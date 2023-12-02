FROM node:10.20.1

ADD ensure_depend.sh /ensure_depend.sh
RUN chmod +x /ensure_depend.sh