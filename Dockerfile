FROM node:14.17.0

ADD ensure_depend.sh /ensure_depend.sh
RUN chmod +x /ensure_depend.sh
