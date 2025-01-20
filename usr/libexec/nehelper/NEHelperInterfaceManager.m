@interface NEHelperInterfaceManager
- (NEHelperInterfaceManager)initWithFirstMessage:(id)a3;
- (OS_dispatch_queue)handlerQueue;
- (void)handleMessage:(id)a3;
@end

@implementation NEHelperInterfaceManager

- (void).cxx_destruct
{
}

- (void)handleMessage:(id)a3
{
  id v3 = a3;
  switch(xpc_dictionary_get_uint64(v3, "interface-command"))
  {
    case 1uLL:
      if (xpc_dictionary_get_uint64(v3, "interface-type") != 4) {
        goto LABEL_56;
      }
      long long v68 = 0uLL;
      int uint64 = xpc_dictionary_get_uint64(v3, "interface-ftype");
      xpc_dictionary_get_string(v3, "interface-name");
      uint64_t v67 = 535847;
      long long v87 = 0u;
      long long v88 = 0u;
      if ((uint64 - 1) >= 3)
      {
        v50 = ne_log_obj();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
        {
          LODWORD(length[0]) = 67109120;
          HIDWORD(length[0]) = uint64;
          _os_log_error_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_ERROR, "invalid functional type %u", (uint8_t *)length, 8u);
        }

        int64_t v9 = 22;
        goto LABEL_69;
      }
      int v5 = dword_10002A640[uint64 - 1];
      __strlcpy_chk();
      HIDWORD(v67) = v5;
      *(void *)&long long v88 = &v67;
      int v6 = sub_10001005C(0xC020697A, (uint64_t)&v87, 2);
      if (v6)
      {
        int v7 = v6;
        v8 = ne_log_obj();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          v65 = strerror(v7);
          LODWORD(length[0]) = 136315138;
          *(size_t *)((char *)length + 4) = (size_t)v65;
          _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "SIOCIFCREATE2 failed with, %s", (uint8_t *)length, 0xCu);
        }

        int64_t v9 = v7;
        goto LABEL_69;
      }
      long long v85 = 0u;
      long long v86 = 0u;
      long long v83 = 0u;
      long long v84 = 0u;
      long long v81 = 0u;
      long long v82 = 0u;
      long long v79 = 0u;
      long long v80 = 0u;
      long long v77 = 0u;
      long long v78 = 0u;
      long long v75 = 0u;
      long long v76 = 0u;
      long long v73 = 0u;
      long long v74 = 0u;
      long long v72 = 0u;
      memset(&length[2], 0, 32);
      strncpy((char *)length, (const char *)&v87, 0x10uLL);
      int v51 = sub_10001005C(0xC080696E, (uint64_t)length, 30);
      if (v51)
      {
        int v52 = v51;
        v53 = ne_log_obj();
        if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
        {
          v54 = strerror(v52);
          *(_DWORD *)buf = 136315138;
          v70 = v54;
          v55 = "SIOCPROTOATTACH_IN6 failed with, %s";
LABEL_85:
          _os_log_error_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_ERROR, v55, buf, 0xCu);
          goto LABEL_76;
        }
        goto LABEL_76;
      }
      *(void *)&long long v73 = 0;
      long long v72 = 0u;
      memset(&length[2], 0, 32);
      strncpy((char *)length, (const char *)&v87, 0x10uLL);
      int v57 = sub_10001005C(0xC030694C, (uint64_t)length, 30);
      if (v57)
      {
        int v58 = v57;
        v53 = ne_log_obj();
        if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
        {
          v66 = strerror(v58);
          *(_DWORD *)buf = 136315138;
          v70 = v66;
          v55 = "SIOCGIFINFO_IN6 failed with, %s";
          goto LABEL_85;
        }
        goto LABEL_76;
      }
      if ((HIDWORD(length[4]) & 0xFFFFFDF6) != HIDWORD(length[4]))
      {
        HIDWORD(length[4]) &= 0xFFFFFDF6;
        int v62 = sub_10001005C(0xC0486957, (uint64_t)length, 30);
        if (v62)
        {
          int v63 = v62;
          v53 = ne_log_obj();
          if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
          {
            v64 = strerror(v63);
            *(_DWORD *)buf = 136315138;
            v70 = v64;
            v55 = "SIOCSIFINFO_FLAGS failed with, %s";
            goto LABEL_85;
          }
LABEL_76:
        }
      }
      __strlcpy_chk();
      xpc_object_t v59 = xpc_string_create((const char *)&v68);
      sub_100001CA0((uint64_t)NEHelperServer, v3, 0, v59);

      goto LABEL_72;
    case 2uLL:
      length[0] = 0;
      *(void *)&long long v87 = 0;
      *(void *)&long long v68 = 0;
      string = xpc_dictionary_get_string(v3, "interface-name");
      data = xpc_dictionary_get_data(v3, "interface-address", length);
      v12 = xpc_dictionary_get_data(v3, "interface-netmask", (size_t *)&v87);
      v13 = xpc_dictionary_get_data(v3, "interface-lifetime", (size_t *)&v68);
      if (!string) {
        goto LABEL_56;
      }
      uint64_t v14 = (uint64_t)v13;
      if (!ne_is_sockaddr_valid() || v12 && !ne_is_sockaddr_valid()) {
        goto LABEL_56;
      }
      if (v14 && (void)v68 != 24) {
        goto LABEL_56;
      }
      int v15 = sub_1000100D4((uint64_t)string, (uint64_t)data, (uint64_t)v12, v14);
      if (!v15) {
        goto LABEL_70;
      }
      int64_t v9 = v15;
      goto LABEL_69;
    case 3uLL:
      uint64_t v16 = xpc_dictionary_get_uint64(v3, "interface-mtu");
      if (!xpc_dictionary_get_string(v3, "interface-name") || !v16) {
        goto LABEL_56;
      }
      memset(length, 0, 32);
      __strlcpy_chk();
      LODWORD(length[2]) = v16;
      int v17 = sub_10001005C(0x80206934, (uint64_t)length, 2);
      if (!v17) {
        goto LABEL_70;
      }
      int v18 = v17;
      v19 = ne_log_obj();
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        goto LABEL_67;
      }
      v20 = strerror(v18);
      LODWORD(v87) = 136315138;
      *(void *)((char *)&v87 + 4) = v20;
      v21 = "Cannot set MTU, %s";
      goto LABEL_53;
    case 4uLL:
      int v22 = xpc_dictionary_dup_fd(v3, "interface-socket");
      *(void *)&long long v87 = 0;
      v23 = xpc_dictionary_get_data(v3, "interface-option-data", (size_t *)&v87);
      uint64_t v24 = xpc_dictionary_get_uint64(v3, "interface-option");
      if (v22 < 0) {
        goto LABEL_56;
      }
      int v25 = v24;
      if (!v24) {
        goto LABEL_56;
      }
      if (!setsockopt(v22, 2, v24, v23, v87)) {
        goto LABEL_57;
      }
      v26 = ne_log_obj();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        v60 = __error();
        v61 = strerror(*v60);
        LODWORD(length[0]) = 67109378;
        HIDWORD(length[0]) = v25;
        LOWORD(length[1]) = 2080;
        *(size_t *)((char *)&length[1] + 2) = (size_t)v61;
        _os_log_error_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "Couldn't set socket option %d, %s", (uint8_t *)length, 0x12u);
      }

      int64_t v27 = *__error();
      if (v27)
      {
        v28 = v3;
      }
      else
      {
LABEL_57:
        v28 = v3;
        int64_t v27 = 0;
      }
      sub_100001CA0((uint64_t)NEHelperServer, v28, v27, 0);
      close(v22);
      goto LABEL_72;
    case 5uLL:
      *(void *)&long long v87 = 0;
      v29 = xpc_dictionary_get_string(v3, "interface-name");
      v30 = (unsigned __int8 *)xpc_dictionary_get_data(v3, "interface-address", (size_t *)&v87);
      if (!v29) {
        goto LABEL_56;
      }
      v31 = v30;
      if (!v30 || !(void)v87 || (unint64_t)v87 < *v30) {
        goto LABEL_56;
      }
      int v32 = v30[1];
      if (v32 != 30)
      {
        if (v32 != 2)
        {
          int v18 = 22;
          goto LABEL_68;
        }
        *(_OWORD *)length = 0u;
        __strlcpy_chk();
        *(_OWORD *)&length[2] = 0x210uLL;
        HIDWORD(length[2]) = *((_DWORD *)v31 + 1);
        int v33 = sub_10001005C(0x80206919, (uint64_t)length, 2);
        if (v33)
        {
          int v18 = v33;
          v19 = ne_log_obj();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            LOWORD(v68) = 0;
            v21 = "Couldn't remove IPv4 interface address";
            goto LABEL_83;
          }
          goto LABEL_67;
        }
LABEL_70:
        v49 = v3;
        int64_t v9 = 0;
        goto LABEL_71;
      }
      long long v85 = 0u;
      long long v86 = 0u;
      long long v83 = 0u;
      long long v84 = 0u;
      long long v81 = 0u;
      long long v82 = 0u;
      long long v79 = 0u;
      long long v80 = 0u;
      long long v77 = 0u;
      long long v78 = 0u;
      long long v75 = 0u;
      long long v76 = 0u;
      long long v73 = 0u;
      long long v74 = 0u;
      long long v72 = 0u;
      memset(length, 0, sizeof(length));
      __strlcpy_chk();
      LOWORD(length[2]) = 7708;
      *(_OWORD *)&length[3] = *(_OWORD *)(v31 + 8);
      int v56 = sub_10001005C(0x81206919, (uint64_t)length, 30);
      if (!v56) {
        goto LABEL_70;
      }
      int v18 = v56;
      v19 = ne_log_obj();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v68) = 0;
        v21 = "Couldn't remove IPv6 interface address";
LABEL_83:
        v38 = (uint8_t *)&v68;
        v47 = v19;
        uint32_t v48 = 2;
LABEL_55:
        _os_log_error_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_ERROR, v21, v38, v48);
      }
LABEL_67:

LABEL_68:
      int64_t v9 = v18;
LABEL_69:
      v49 = v3;
LABEL_71:
      sub_100001CA0((uint64_t)NEHelperServer, v49, v9, 0);
LABEL_72:

      return;
    case 6uLL:
      uint64_t v34 = xpc_dictionary_get_uint64(v3, "interface-type");
      v35 = xpc_dictionary_get_string(v3, "interface-name");
      v36 = xpc_dictionary_get_string(v3, "interface-delegate-name");
      if (v34 != 4 || !v35 || !v36) {
        goto LABEL_56;
      }
      long long v87 = 0u;
      long long v77 = 0u;
      long long v78 = 0u;
      long long v75 = 0u;
      long long v76 = 0u;
      long long v73 = 0u;
      long long v74 = 0u;
      long long v72 = 0u;
      memset(length, 0, sizeof(length));
      __strlcpy_chk();
      long long v88 = xmmword_10002A620;
      v89 = length;
      __strlcpy_chk();
      int v37 = sub_10001005C(0x8028697B, (uint64_t)&v87, 2);
      if (!v37) {
        goto LABEL_70;
      }
      int v18 = v37;
      v19 = ne_log_obj();
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        goto LABEL_67;
      }
      LODWORD(v68) = 136315138;
      *(void *)((char *)&v68 + 4) = strerror(v18);
      v21 = "SIOCSDRVSPEC failed with, %s";
      v38 = (uint8_t *)&v68;
      goto LABEL_54;
    case 7uLL:
      if (!xpc_dictionary_get_string(v3, "interface-name")) {
        goto LABEL_56;
      }
      memset(length, 0, 32);
      __strlcpy_chk();
      int v39 = sub_10001005C(0x80206979, (uint64_t)length, 2);
      if (!v39) {
        goto LABEL_70;
      }
      int v18 = v39;
      v19 = ne_log_obj();
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        goto LABEL_67;
      }
      v40 = strerror(v18);
      LODWORD(v87) = 136315138;
      *(void *)((char *)&v87 + 4) = v40;
      v21 = "SIOCIFDESTROY failed with, %s";
      goto LABEL_53;
    case 8uLL:
      uint64_t v41 = xpc_dictionary_get_uint64(v3, "interface-type");
      v42 = xpc_dictionary_get_string(v3, "interface-name");
      v43 = xpc_dictionary_get_string(v3, "interface-description");
      if (v41 != 4) {
        goto LABEL_56;
      }
      if (!v42) {
        goto LABEL_56;
      }
      v44 = v43;
      if (!v43) {
        goto LABEL_56;
      }
      strncpy((char *)length, v42, 0x10uLL);
      LODWORD(length[2]) = strnlen(v44, 0x80uLL);
      strncpy((char *)&length[2] + 4, v44, 0x80uLL);
      int v45 = sub_10001005C(0xC094698F, (uint64_t)length, 2);
      if (!v45) {
        goto LABEL_70;
      }
      int v18 = v45;
      v19 = ne_log_obj();
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        goto LABEL_67;
      }
      v46 = strerror(v18);
      LODWORD(v87) = 136315138;
      *(void *)((char *)&v87 + 4) = v46;
      v21 = "SIOCSIFDESC failed with, %s";
LABEL_53:
      v38 = (uint8_t *)&v87;
LABEL_54:
      v47 = v19;
      uint32_t v48 = 12;
      goto LABEL_55;
    default:
LABEL_56:
      v49 = v3;
      int64_t v9 = 22;
      goto LABEL_71;
  }
}

- (OS_dispatch_queue)handlerQueue
{
  if (self)
  {
    self = (NEHelperInterfaceManager *)objc_getProperty(self, a2, 8, 1);
    uint64_t v2 = vars8;
  }
  return (OS_dispatch_queue *)self;
}

- (NEHelperInterfaceManager)initWithFirstMessage:(id)a3
{
  v4 = xpc_dictionary_get_remote_connection(a3);
  if (sub_10000E810((uint64_t)NEHelperServer, v4))
  {
    v13.receiver = self;
    v13.super_class = (Class)NEHelperInterfaceManager;
    int v5 = [(NEHelperInterfaceManager *)&v13 init];
    if (v5)
    {
      int v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      dispatch_queue_t v7 = dispatch_queue_create("NEHelperInterfaceManager", v6);
      queue = v5->_queue;
      v5->_queue = (OS_dispatch_queue *)v7;
    }
    self = v5;
    int64_t v9 = self;
  }
  else
  {
    v10 = ne_log_obj();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v12 = sub_10000E870((uint64_t)NEHelperServer, v4);
      *(_DWORD *)buf = 138412546;
      id v15 = v12;
      __int16 v16 = 2080;
      int v17 = "com.apple.private.nehelper.privileged";
      _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Denying interface manager connection because %@ does not have the %s entitlement", buf, 0x16u);
    }
    int64_t v9 = 0;
  }

  return v9;
}

@end