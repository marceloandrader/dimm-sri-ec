FROM java:8-jre
LABEL maintainer "marcelo.andrade.r@gmail.com"

ENV DEBIAN_FRONTEND noninteractive

COPY ./DIMMInstaladorLinux-x86-1.7 /

RUN apt-get update -y 
RUN apt-get install -y --force-yes --no-install-recommends \
   -o Dpkg::Options::="--force-confdef" \
   -o Dpkg::Options::="--force-confold" \
   libmodern-perl-perl \
   libcompress-raw-lzma-perl \
   libterm-progressbar-perl \
   libdata-dump-perl \
   libfile-homedir-perl \
   wget

# Extract the installer contents in order to use directly
# the installer doesn't work on 64 bit architectures
RUN wget --no-check-certificate "https://raw.githubusercontent.com/lod/unpack-install-jammer/master/extract.pl"
RUN chmod +x /extract.pl
RUN perl /extract.pl /DIMMInstaladorLinux-x86-1.7 || true

RUN chmod +x install_dir/root/dimm/dimmFormularios4JUnix.sh
CMD "install_dir/root/dimm/dimmFormularios4JUnix.sh"
