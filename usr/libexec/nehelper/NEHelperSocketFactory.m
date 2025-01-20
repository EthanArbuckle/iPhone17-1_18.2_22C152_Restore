@interface NEHelperSocketFactory
- (NEHelperSocketFactory)initWithFirstMessage:(id)a3;
- (OS_dispatch_queue)handlerQueue;
- (void)handleMessage:(id)a3;
@end

@implementation NEHelperSocketFactory

- (void).cxx_destruct
{
}

- (void)handleMessage:(id)a3
{
  id v4 = a3;
  uint64_t uint64 = xpc_dictionary_get_uint64(v4, "socket-type");
  switch(uint64)
  {
    case 1uLL:
      int v6 = socket(29, 3, 2);
      if (v6 < 0)
      {
        v36 = ne_log_obj();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        {
          int v49 = *__error();
          *(_DWORD *)__strerrbuf = 67109120;
          LODWORD(v92) = v49;
          _os_log_error_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "socket(PF_KEY, SOCK_RAW, PF_KEY_V2) failed: %d", (uint8_t *)__strerrbuf, 8u);
        }

        if (*__error()) {
          int64_t v37 = *__error();
        }
        else {
          int64_t v37 = 22;
        }
        sub_100001CA0((uint64_t)NEHelperServer, v4, v37, 0);
      }
      else
      {
        int v7 = v6;
        xpc_object_t v8 = xpc_fd_create(v6);
        close(v7);
        *(_DWORD *)__strerrbuf = 4500;
        sysctlbyname("net.inet.ipsec.esp_port", 0, 0, __strerrbuf, 4uLL);
        sub_100001CA0((uint64_t)NEHelperServer, v4, 0, v8);
      }
      goto LABEL_151;
    case 2uLL:
      size_t length = 0;
      size_t v70 = 0;
      data = (const sockaddr *)xpc_dictionary_get_data(v4, "socket-localaddr", &length);
      v14 = (const sockaddr *)xpc_dictionary_get_data(v4, "socket-remoteaddr", &v70);
      string = xpc_dictionary_get_string(v4, "socket-interface");
      int v16 = xpc_dictionary_get_uint64(v4, "socket-effective-pid");
      if ne_is_sockaddr_valid() && (ne_is_sockaddr_valid())
      {
        *(_DWORD *)v84 = v16;
        if (data)
        {
          if (v14)
          {
            int sa_family = v14->sa_family;
            BOOL v18 = data->sa_family == sa_family;
            v19 = ne_log_obj();
            v20 = v19;
            if (v18)
            {
              if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
              {
                nw_endpoint_t address = nw_endpoint_create_address(data);
                nw_endpoint_t v53 = nw_endpoint_create_address(v14);
                *(_DWORD *)__strerrbuf = 138413058;
                v92 = (const char *)address;
                __int16 v93 = 2112;
                nw_endpoint_t v94 = v53;
                __int16 v95 = 2080;
                v96 = string;
                __int16 v97 = 1024;
                int v98 = v16;
                _os_log_debug_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "Creating IKE socket to (%@, %@, \"%s\", %d)", (uint8_t *)__strerrbuf, 0x26u);
              }
              if (string)
              {
                unsigned int v63 = if_nametoindex(string);
                if (v63) {
                  goto LABEL_26;
                }
                int v21 = *__error();
                if (strerror_r(v21, __strerrbuf, 0x80uLL)) {
                  __strerrbuf[0] = 0;
                }
                v22 = ne_log_obj();
                if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 136315650;
                  *(void *)&buf[4] = string;
                  *(_WORD *)&buf[12] = 1024;
                  *(_DWORD *)&buf[14] = v21;
                  *(_WORD *)&buf[18] = 2080;
                  *(void *)&buf[20] = __strerrbuf;
                  _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "Failed to find interface \"%s\": [%d] %s", buf, 0x1Cu);
                }
              }
              unsigned int v63 = 0;
LABEL_26:
              int v23 = socket(sa_family, 2, 0);
              int v24 = v23;
              if (v23 < 0)
              {
                int v42 = *__error();
                if (strerror_r(v42, __strerrbuf, 0x80uLL)) {
                  __strerrbuf[0] = 0;
                }
                v47 = ne_log_obj();
                if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 67109634;
                  *(_DWORD *)&buf[4] = sa_family;
                  *(_WORD *)&buf[8] = 1024;
                  *(_DWORD *)&buf[10] = v42;
                  *(_WORD *)&buf[14] = 2080;
                  *(void *)&buf[16] = __strerrbuf;
                  _os_log_error_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_ERROR, "Failed to create socket(%u, SOCK_DGRAM, 0): [%d] %s", buf, 0x18u);
                }

                if (v24 == -1) {
                  goto LABEL_158;
                }
                goto LABEL_157;
              }
              if (fcntl(v23, 4, 4) == -1)
              {
                int v25 = *__error();
                if (strerror_r(v25, __strerrbuf, 0x80uLL)) {
                  __strerrbuf[0] = 0;
                }
                v26 = ne_log_obj();
                if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 67109378;
                  *(_DWORD *)&buf[4] = v25;
                  *(_WORD *)&buf[8] = 2080;
                  *(void *)&buf[10] = __strerrbuf;
                  _os_log_error_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "Failed to put socket in non-blocking mode: [%d] %s", buf, 0x12u);
                }
              }
              if (fcntl(v24, 73, 1) == -1)
              {
                int v27 = *__error();
                if (strerror_r(v27, __strerrbuf, 0x80uLL)) {
                  __strerrbuf[0] = 0;
                }
                v28 = ne_log_obj();
                if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 67109378;
                  *(_DWORD *)&buf[4] = v27;
                  *(_WORD *)&buf[8] = 2080;
                  *(void *)&buf[10] = __strerrbuf;
                  _os_log_error_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "Failed to set NOSIGPIPE option: [%d] %s", buf, 0x12u);
                }
              }
              *(_DWORD *)v80 = 1;
              if (setsockopt(v24, 0xFFFF, 4, v80, 4u) < 0)
              {
                int v42 = *__error();
                if (strerror_r(v42, __strerrbuf, 0x80uLL)) {
                  __strerrbuf[0] = 0;
                }
                v48 = ne_log_obj();
                if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 67109378;
                  *(_DWORD *)&buf[4] = v42;
                  *(_WORD *)&buf[8] = 2080;
                  *(void *)&buf[10] = __strerrbuf;
                  _os_log_error_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_ERROR, "setsockopt SO_REUSEADDR failed: [%d] %s", buf, 0x12u);
                }
              }
              else if (setsockopt(v24, 0xFFFF, 512, v80, 4u) < 0)
              {
                int v42 = *__error();
                if (strerror_r(v42, __strerrbuf, 0x80uLL)) {
                  __strerrbuf[0] = 0;
                }
                v48 = ne_log_obj();
                if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 67109378;
                  *(_DWORD *)&buf[4] = v42;
                  *(_WORD *)&buf[8] = 2080;
                  *(void *)&buf[10] = __strerrbuf;
                  _os_log_error_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_ERROR, "setsockopt SO_REUSEPORT failed: [%d] %s", buf, 0x12u);
                }
              }
              else if (v16 && setsockopt(v24, 0xFFFF, 4359, v84, 4u) < 0)
              {
                int v42 = *__error();
                if (strerror_r(v42, __strerrbuf, 0x80uLL)) {
                  __strerrbuf[0] = 0;
                }
                v48 = ne_log_obj();
                if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 67109378;
                  *(_DWORD *)&buf[4] = v42;
                  *(_WORD *)&buf[8] = 2080;
                  *(void *)&buf[10] = __strerrbuf;
                  _os_log_error_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_ERROR, "setsockopt SO_DELEGATED failed: [%d] %s", buf, 0x12u);
                }
              }
              else
              {
                if (sa_family != 30 || (socklen_t v79 = 0, (setsockopt(v24, 41, 63, &v79, 4u) & 0x80000000) == 0))
                {
                  *(void *)&v78.sae_srcif = 0;
                  memset(&v78.sae_srcaddrlen, 0, 24);
                  v78.sae_srcaddr = data;
                  v78.sae_srcaddrlen = data->sa_len;
                  v78.sae_srcif = v63;
                  v78.sae_dstaddr = v14;
                  v78.sae_dstaddrlen = v14->sa_len;
                  if ((connectx(v24, &v78, 0, 0, 0, 0, 0, 0) & 0x80000000) == 0)
                  {
                    xpc_object_t v29 = xpc_fd_create(v24);
                    close(v24);
                    sub_100001CA0((uint64_t)NEHelperServer, v4, 0, v29);

                    goto LABEL_151;
                  }
                  int v42 = *__error();
                  if (strerror_r(v42, __strerrbuf, 0x80uLL)) {
                    __strerrbuf[0] = 0;
                  }
                  v56 = ne_log_obj();
                  if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
                  {
                    nw_endpoint_t v61 = nw_endpoint_create_address(data);
                    nw_endpoint_t v62 = nw_endpoint_create_address(v14);
                    *(_DWORD *)buf = 138413314;
                    *(void *)&buf[4] = v61;
                    *(_WORD *)&buf[12] = 2112;
                    *(void *)&buf[14] = v62;
                    *(_WORD *)&buf[22] = 2080;
                    *(void *)&buf[24] = string;
                    LOWORD(v86) = 1024;
                    *(_DWORD *)((char *)&v86 + 2) = v42;
                    WORD3(v86) = 2080;
                    *((void *)&v86 + 1) = __strerrbuf;
                    _os_log_error_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_ERROR, "connectx(%@, %@, \"%s\") failed: [%d] %s", buf, 0x30u);
                  }
                  goto LABEL_157;
                }
                int v42 = *__error();
                if (strerror_r(v42, __strerrbuf, 0x80uLL)) {
                  __strerrbuf[0] = 0;
                }
                v48 = ne_log_obj();
                if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 67109378;
                  *(_DWORD *)&buf[4] = v42;
                  *(_WORD *)&buf[8] = 2080;
                  *(void *)&buf[10] = __strerrbuf;
                  _os_log_error_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_ERROR, "setsockopt IPV6_PREFER_TEMPADDR failed: [%d] %s", buf, 0x12u);
                }
              }

LABEL_157:
              close(v24);
              goto LABEL_158;
            }
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            {
              nw_endpoint_t v54 = nw_endpoint_create_address(data);
              nw_endpoint_t v55 = nw_endpoint_create_address(v14);
              *(_DWORD *)__strerrbuf = 138412546;
              v92 = (const char *)v54;
              __int16 v93 = 2112;
              nw_endpoint_t v94 = v55;
              _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Mismatched AF %@ %@", (uint8_t *)__strerrbuf, 0x16u);
            }
          }
          else
          {
            v20 = ne_log_obj();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)__strerrbuf = 136315138;
              v92 = "connect_udp_ike_socket";
              _os_log_fault_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_FAULT, "%s called with null remote", (uint8_t *)__strerrbuf, 0xCu);
            }
          }
        }
        else
        {
          v20 = ne_log_obj();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)__strerrbuf = 136315138;
            v92 = "connect_udp_ike_socket";
            _os_log_fault_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_FAULT, "%s called with null local", (uint8_t *)__strerrbuf, 0xCu);
          }
        }

        int v42 = 22;
LABEL_158:
        v60 = ne_log_obj();
        if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)__strerrbuf = 0;
          _os_log_error_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_ERROR, "kNEHelperMessageSocketTypeIKE connect_udp_ike_socket failed", (uint8_t *)__strerrbuf, 2u);
        }

        sub_100001CA0((uint64_t)NEHelperServer, v4, v42, 0);
        goto LABEL_151;
      }
      v32 = ne_log_obj();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)__strerrbuf = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "kNEHelperMessageSocketTypeIKE received invalid parameters", (uint8_t *)__strerrbuf, 2u);
      }

      sub_100001CA0((uint64_t)NEHelperServer, v4, 22, 0);
LABEL_151:

      return;
    case 3uLL:
      int v90 = 0;
      long long v88 = 0u;
      long long v89 = 0u;
      long long v86 = 0u;
      long long v87 = 0u;
      memset(buf, 0, sizeof(buf));
      memset(&v78, 0, 32);
      xpc_dictionary_get_string(v4, "socket-control-name");
      size_t length = 0;
      p_size_t length = &length;
      uint64_t v76 = 0x2020000000;
      char v77 = 0;
      size_t v70 = 0;
      v71 = &v70;
      uint64_t v72 = 0x2020000000;
      char v73 = 0;
      if (!self || !self->_privileged)
      {
        v9 = ne_log_obj();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)__strerrbuf = 0;
          _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Rejecting kernel control socket request from un-privileged client", (uint8_t *)__strerrbuf, 2u);
        }

        sub_100001CA0((uint64_t)NEHelperServer, v4, 1, 0);
        goto LABEL_150;
      }
      int v33 = socket(32, 2, 2);
      if (v33 < 0)
      {
        int v40 = *__error();
        if (strerror_r(v40, __strerrbuf, 0x80uLL)) {
          __strerrbuf[0] = 0;
        }
        v41 = ne_log_obj();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v84 = 67109378;
          *(_DWORD *)&v84[4] = v40;
          *(_WORD *)&v84[8] = 2080;
          *(void *)&v84[10] = __strerrbuf;
          _os_log_error_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_ERROR, "Cannot create kernel control socket: [%d] %s", v84, 0x12u);
        }

        sub_100001CA0((uint64_t)NEHelperServer, v4, v40, 0);
        goto LABEL_150;
      }
      int v90 = 0;
      long long v88 = 0u;
      long long v89 = 0u;
      long long v86 = 0u;
      long long v87 = 0u;
      memset(buf, 0, sizeof(buf));
      __strlcpy_chk();
      if (ioctl(v33, 0xC0644E03uLL, buf))
      {
        int v34 = *__error();
        if (strerror_r(v34, __strerrbuf, 0x80uLL)) {
          __strerrbuf[0] = 0;
        }
        v35 = ne_log_obj();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v84 = 67109378;
          *(_DWORD *)&v84[4] = v34;
          *(_WORD *)&v84[8] = 2080;
          *(void *)&v84[10] = __strerrbuf;
          _os_log_error_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "ioctl(CTLIOCGINFO) failed: [%d] %s", v84, 0x12u);
        }

        close(v33);
        sub_100001CA0((uint64_t)NEHelperServer, v4, v34, 0);
        goto LABEL_150;
      }
      v78.sae_srcif = 139296;
      *(&v78.sae_srcif + 1) = *(_DWORD *)buf;
      memset(&v78.sae_srcaddr, 0, 24);
      v43 = xpc_dictionary_get_array(v4, "socket-options");
      v44 = v43;
      if (v43 && xpc_array_get_count(v43))
      {
        if (bind(v33, (const sockaddr *)&v78, 0x20u))
        {
          int v45 = *__error();
          if (strerror_r(v45, __strerrbuf, 0x80uLL)) {
            __strerrbuf[0] = 0;
          }
          v46 = ne_log_obj();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)v84 = 67109378;
            *(_DWORD *)&v84[4] = v45;
            *(_WORD *)&v84[8] = 2080;
            *(void *)&v84[10] = __strerrbuf;
            _os_log_error_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_ERROR, "bind failed on kernel control socket: [%d] %s", v84, 0x12u);
          }
LABEL_86:

          close(v33);
          sub_100001CA0((uint64_t)NEHelperServer, v4, v45, 0);
LABEL_149:

LABEL_150:
          _Block_object_dispose(&v70, 8);
          _Block_object_dispose(&length, 8);
          goto LABEL_151;
        }
        applier[0] = _NSConcreteStackBlock;
        applier[1] = 3221225472;
        applier[2] = sub_100011B88;
        applier[3] = &unk_1000390D0;
        int v69 = v33;
        id v50 = v4;
        id v66 = v50;
        v67 = &length;
        v68 = &v70;
        xpc_array_apply(v44, applier);
        if (connect(v33, (const sockaddr *)&v78, 0x20u))
        {
          int v51 = *__error();
          if (strerror_r(v51, __strerrbuf, 0x80uLL)) {
            __strerrbuf[0] = 0;
          }
          v52 = ne_log_obj();
          if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)v84 = 67109378;
            *(_DWORD *)&v84[4] = v51;
            *(_WORD *)&v84[8] = 2080;
            *(void *)&v84[10] = __strerrbuf;
            _os_log_error_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_ERROR, "connect failed on kernel control socket: [%d] %s", v84, 0x12u);
          }

          close(v33);
          sub_100001CA0((uint64_t)NEHelperServer, v50, v51, 0);

          goto LABEL_149;
        }
      }
      else if (connect(v33, (const sockaddr *)&v78, 0x20u))
      {
        int v45 = *__error();
        if (strerror_r(v45, __strerrbuf, 0x80uLL)) {
          __strerrbuf[0] = 0;
        }
        v46 = ne_log_obj();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v84 = 67109378;
          *(_DWORD *)&v84[4] = v45;
          *(_WORD *)&v84[8] = 2080;
          *(void *)&v84[10] = __strerrbuf;
          _os_log_error_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_ERROR, "connect failed on kernel control socket: [%d] %s", v84, 0x12u);
        }
        goto LABEL_86;
      }
      if (!*((unsigned char *)p_length + 24) && !*((unsigned char *)v71 + 24)) {
        goto LABEL_148;
      }
      memset(v84, 0, sizeof(v84));
      socklen_t v79 = 16;
      if (getsockopt(v33, 2, 2, v84, &v79))
      {
        int v57 = *__error();
        if (strerror_r(v57, __strerrbuf, 0x80uLL)) {
          __strerrbuf[0] = 0;
        }
        v58 = ne_log_obj();
        if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v80 = 67109378;
          *(_DWORD *)v81 = v57;
          *(_WORD *)&v81[4] = 2080;
          *(void *)&v81[6] = __strerrbuf;
          _os_log_error_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_ERROR, "Failed to get the name of the new virtual interface: [%d] %s", v80, 0x12u);
        }
      }
      else if (*((unsigned char *)p_length + 24) && (*(_DWORD *)&v84[16] = 1, ioctl(v33, 0xC02069D7uLL, v84)))
      {
        int v57 = *__error();
        if (strerror_r(v57, __strerrbuf, 0x80uLL)) {
          __strerrbuf[0] = 0;
        }
        v58 = ne_log_obj();
        if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v80 = 136315650;
          *(void *)v81 = v84;
          *(_WORD *)&v81[8] = 1024;
          *(_DWORD *)&v81[10] = v57;
          __int16 v82 = 2080;
          v83 = __strerrbuf;
          _os_log_error_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_ERROR, "Failed to set SIOCSIFNOTRAFFICSHAPING to 1 for %s: [%d] %s", v80, 0x1Cu);
        }
      }
      else
      {
        if (!*((unsigned char *)v71 + 24) || (v84[16] = 1, !ioctl(v33, 0xC02069DDuLL, v84)))
        {
LABEL_148:
          xpc_object_t v59 = xpc_fd_create(v33);
          close(v33);
          sub_100001CA0((uint64_t)NEHelperServer, v4, 0, v59);

          goto LABEL_149;
        }
        int v57 = *__error();
        if (strerror_r(v57, __strerrbuf, 0x80uLL)) {
          __strerrbuf[0] = 0;
        }
        v58 = ne_log_obj();
        if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v80 = 136315650;
          *(void *)v81 = v84;
          *(_WORD *)&v81[8] = 1024;
          *(_DWORD *)&v81[10] = v57;
          __int16 v82 = 2080;
          v83 = __strerrbuf;
          _os_log_error_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_ERROR, "Failed to set SIOCSIFDIRECTLINK to 1 for %s: [%d] %s", v80, 0x1Cu);
        }
      }

      close(v33);
      sub_100001CA0((uint64_t)NEHelperServer, v4, v57, 0);
      goto LABEL_149;
    case 4uLL:
      int v10 = necp_session_open();
      if (v10 < 0)
      {
        int v38 = *__error();
        if (strerror_r(v38, __strerrbuf, 0x80uLL)) {
          __strerrbuf[0] = 0;
        }
        v39 = ne_log_obj();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)&buf[4] = v38;
          *(_WORD *)&buf[8] = 2080;
          *(void *)&buf[10] = __strerrbuf;
          _os_log_fault_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_FAULT, "Cannot create necp session fd: [%d] %s", buf, 0x12u);
        }

        sub_100001CA0((uint64_t)NEHelperServer, v4, v38, 0);
      }
      else
      {
        int v11 = v10;
        xpc_object_t v12 = xpc_fd_create(v10);
        close(v11);
        sub_100001CA0((uint64_t)NEHelperServer, v4, 0, v12);
      }
      goto LABEL_151;
    default:
      v30 = (const char *)uint64;
      v31 = ne_log_obj();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)__strerrbuf = 134217984;
        v92 = v30;
        _os_log_error_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "NEHelperSocketFactory received invalid socketType %llu", (uint8_t *)__strerrbuf, 0xCu);
      }

      sub_100001CA0((uint64_t)NEHelperServer, v4, 22, 0);
      goto LABEL_151;
  }
}

- (OS_dispatch_queue)handlerQueue
{
  if (self)
  {
    self = (NEHelperSocketFactory *)objc_getProperty(self, a2, 16, 1);
    uint64_t v2 = vars8;
  }
  return (OS_dispatch_queue *)self;
}

- (NEHelperSocketFactory)initWithFirstMessage:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)NEHelperSocketFactory;
  v5 = [(NEHelperSocketFactory *)&v23 init];
  if (v5)
  {
    xpc_dictionary_get_remote_connection(v4);
    int v6 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    int v7 = (void *)xpc_connection_copy_entitlement_value();
    xpc_object_t v8 = (void *)xpc_connection_copy_entitlement_value();
    BOOL v9 = v7 && xpc_get_type(v7) == (xpc_type_t)&_xpc_type_BOOL && xpc_BOOL_get_value(v7);
    v5->_privileged = v9;
    BOOL v10 = v8 && xpc_get_type(v8) == (xpc_type_t)&_xpc_type_BOOL && xpc_BOOL_get_value(v8);
    int v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v12 = dispatch_queue_create("NEHelperSocketFactory", v11);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v12;

    if (!v5->_privileged && !v10)
    {
      pid_t pid = xpc_connection_get_pid(v6);
      int v15 = proc_name(pid, buffer, 0x100u);
      int v16 = ne_log_obj();
      BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);
      if (v15 < 1)
      {
        if (v17)
        {
          *(_DWORD *)buf = 67109634;
          *(_DWORD *)int v25 = pid;
          *(_WORD *)&v25[4] = 2080;
          *(void *)&v25[6] = "com.apple.private.nehelper.privileged";
          __int16 v26 = 2080;
          int v27 = "com.apple.private.neagent";
          BOOL v18 = "Denying connection from process %d because it is missing the %s entitlement and the %s entitlement";
          v19 = v16;
          uint32_t v20 = 28;
          goto LABEL_21;
        }
      }
      else if (v17)
      {
        *(_DWORD *)buf = 136315906;
        *(void *)int v25 = buffer;
        *(_WORD *)&v25[8] = 1024;
        *(_DWORD *)&v25[10] = pid;
        __int16 v26 = 2080;
        int v27 = "com.apple.private.nehelper.privileged";
        __int16 v28 = 2080;
        xpc_object_t v29 = "com.apple.private.neagent";
        BOOL v18 = "Denying connection from %s (%d) because it is missing the %s entitlement and the %s entitlement";
        v19 = v16;
        uint32_t v20 = 38;
LABEL_21:
        _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, v18, buf, v20);
      }

      int v21 = 0;
      goto LABEL_19;
    }
  }
  int v21 = v5;
LABEL_19:

  return v21;
}

@end