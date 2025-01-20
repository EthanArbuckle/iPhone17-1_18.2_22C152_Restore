uint64_t start(int a1, uint64_t a2)
{
  int v2;
  char **v5;
  const char *v6;
  int v7;
  char *v8;
  const char *v9;
  char v10;
  char *v11;
  unsigned __int8 *v12;
  int v13;
  char v14;
  int v15;
  char *v16;
  unsigned __int8 *v17;
  char *v18;
  size_t v19;
  int v21;
  char *v22;
  const char *v23;
  const char *v24;
  id v25;
  uint64_t started;
  void *v27;
  dispatch_source_t v28;
  void *v29;
  dispatch_time_t v30;
  int v31;
  int v32;
  int v33;
  int v34;
  id v35;
  int *v36;
  char *v37;
  uint64_t v38;
  int v39;
  size_t v40;
  id v41;
  int *v42;
  char *v43;
  uint64_t v44;
  int v45;
  unsigned int v46;
  const char *v47;
  int v48;
  int v49;
  uint64_t v50;
  int v51;
  char *v52;
  int v53;
  char *v54;
  int v55;
  int v56;
  id v57;
  int v58;
  uint64_t v59;
  unint64_t v60;
  void block[6];
  uint64_t v62;
  uint64_t *v63;
  uint64_t v64;
  uint64_t (*v65)(uint64_t, uint64_t);
  void (*v66)(uint64_t);
  uint64_t v67;
  void v68[3];
  char v69;
  void v70[3];
  int v71;
  int v72;
  int v73;
  unsigned char v74[24];
  char *v75;
  void *v76;
  void *v77;
  uint64_t *v78;
  unsigned __int8 *v79;
  char *v80;
  int v81;
  char v82;
  char v83;
  uuid_t uu;
  long long handler;
  long long v86;
  long long v87;
  long long v88;
  long long v89;

  v2 = a1 - 1;
  if (a1 <= 1) {
    goto LABEL_107;
  }
  v5 = (char **)(a2 + 8);
  v6 = *(const char **)(a2 + 8);
  if (!strcmp(v6, "list"))
  {
    remote_device_browse_present();
    dispatch_main();
  }
  if (!strcmp(v6, "browse"))
  {
    v10 = 0;
    v60 = 0;
    v11 = 0;
    v12 = 0;
    v13 = 0;
    v14 = 0;
    v70[0] = 0;
    v70[1] = v70;
    v70[2] = 0x2020000000;
    v71 = 0;
    v68[0] = 0;
    v68[1] = v68;
    v68[2] = 0x2020000000;
    v69 = 0;
    v62 = 0;
    v63 = &v62;
    v64 = 0x3032000000;
    v65 = sub_100004D20;
    v66 = sub_100004D30;
    v67 = 0;
    memset(uu, 170, sizeof(uu));
    while (1)
    {
      while (1)
      {
        while (1)
        {
          v15 = getopt(v2, v5, "d:t:s");
          if (v15 == 100) {
            break;
          }
          switch(v15)
          {
            case 115:
              v10 = 1;
              break;
            case 116:
              v60 = strtoull(optarg, 0, 10);
              break;
            case -1:
              *(void *)v74 = _NSConcreteStackBlock;
              *(void *)&v74[8] = 3221225472;
              *(void *)&v74[16] = sub_100004D38;
              v75 = (char *)&unk_100025268;
              v79 = v12;
              v80 = v11;
              v76 = v70;
              v77 = v68;
              v82 = v14 & 1;
              v83 = v10 & 1;
              v81 = v13;
              v78 = &v62;
              objc_retainBlock(v74);
              v25 = &_dispatch_main_q;
              started = remote_device_start_browsing();
              v27 = (void *)v63[5];
              v63[5] = started;

              if (signal(2, (void (__cdecl *)(int))1) != (void (__cdecl *)(int))-1)
              {
                v28 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 2uLL, 0, (dispatch_queue_t)&_dispatch_main_q);
                v29 = (void *)qword_100029050;
                qword_100029050 = (uint64_t)v28;

                *(void *)&handler = _NSConcreteStackBlock;
                *((void *)&handler + 1) = 3221225472;
                *(void *)&v86 = sub_1000051C4;
                *((void *)&v86 + 1) = &unk_100025290;
                *(void *)&v87 = v70;
                *((void *)&v87 + 1) = &v62;
                dispatch_source_set_event_handler((dispatch_source_t)qword_100029050, &handler);
                dispatch_activate((dispatch_object_t)qword_100029050);
                if (v60) {
                  v30 = dispatch_time(0, 1000000000 * v60);
                }
                else {
                  v30 = -1;
                }
                block[0] = _NSConcreteStackBlock;
                block[1] = 3221225472;
                block[2] = sub_1000051E4;
                block[3] = &unk_100025290;
                block[4] = v70;
                block[5] = &v62;
                dispatch_after(v30, (dispatch_queue_t)&_dispatch_main_q, block);

                dispatch_main();
              }
              block[0] = 0;
              v88 = 0u;
              v89 = 0u;
              v86 = 0u;
              v87 = 0u;
              handler = 0u;
              v57 = &_os_log_default;
              os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
              v58 = *__error();
              v72 = 67109120;
              v73 = v58;
              _os_log_send_and_compose_impl();

              v59 = _os_crash_msg();
              sub_10001BCB8(v59);
            default:
              sub_100002784();
          }
        }
        if (uuid_parse(optarg, uu)) {
          break;
        }
        v17 = (unsigned __int8 *)malloc_type_calloc(1uLL, 0x10uLL, 0x61D5536CuLL);
        v12 = v17;
        if (!v17)
        {
          block[0] = 0;
          v88 = 0u;
          v89 = 0u;
          v86 = 0u;
          v87 = 0u;
          handler = 0u;
          v35 = &_os_log_default;
          os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
          v36 = __error();
          v37 = strerror(*v36);
          *(_DWORD *)v74 = 136315650;
          *(void *)&v74[4] = "known-constant allocation";
          *(_WORD *)&v74[12] = 2048;
          *(void *)&v74[14] = 16;
          *(_WORD *)&v74[22] = 2080;
          v75 = v37;
          _os_log_send_and_compose_impl();

          v38 = _os_crash_msg();
          sub_10001BCB8(v38);
        }
        uuid_copy(v17, uu);
        printf("Browse for uuid: %s\n");
LABEL_12:
        v14 = 1;
      }
      v13 = remote_device_type_parse();
      v16 = optarg;
      if (v13)
      {
        printf("Browse for type: %s\n");
        goto LABEL_12;
      }
      if (_dispatch_is_multithreaded())
      {
        while (1)
        {
          v18 = strdup(v16);
          if (v18) {
            break;
          }
          __os_temporary_resource_shortage();
        }
        v11 = v18;
      }
      else
      {
        v11 = strdup(v16);
        v19 = strlen(v16);
        if (!v11)
        {
          v40 = v19;
          block[0] = 0;
          v88 = 0u;
          v89 = 0u;
          v86 = 0u;
          v87 = 0u;
          handler = 0u;
          v41 = &_os_log_default;
          os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
          v42 = __error();
          v43 = strerror(*v42);
          *(_DWORD *)v74 = 136315650;
          *(void *)&v74[4] = "known-constant allocation";
          *(_WORD *)&v74[12] = 2048;
          *(void *)&v74[14] = v40;
          *(_WORD *)&v74[22] = 2080;
          v75 = v43;
          _os_log_send_and_compose_impl();

          v44 = _os_crash_msg();
          sub_10001BCB8(v44);
        }
      }
      printf("Browse for device: %s\n", optarg);
      v13 = 0;
      v14 = 1;
    }
  }
  v7 = strcmp(v6, "show");
  if (a1 == 3 && !v7)
  {
    v8 = *(char **)(a2 + 16);
    v9 = 0;
LABEL_29:
    sub_1000029F4(v8, v9);
    return 0;
  }
  if (a1 == 4 && !v7)
  {
    v8 = *(char **)(a2 + 16);
    v9 = *(const char **)(a2 + 24);
    goto LABEL_29;
  }
  v21 = strcmp(v6, "get-property");
  if (a1 == 4 && !v21)
  {
    v22 = *(char **)(a2 + 16);
    v23 = *(const char **)(a2 + 24);
    v24 = 0;
LABEL_41:
    sub_100002A80(v22, v24, v23);
    return 0;
  }
  if (a1 == 5 && !v21)
  {
    v22 = *(char **)(a2 + 16);
    v24 = *(const char **)(a2 + 24);
    v23 = *(const char **)(a2 + 32);
    goto LABEL_41;
  }
  if (!strcmp(v6, "dumpstate")) {
    sub_100002B7C();
  }
  if (!strcmp(v6, "echo"))
  {
    sub_100002DBC(v2, v5);
    return 0;
  }
  if (!strcmp(v6, "echo-file")) {
    sub_100003130(v2, (uint64_t)v5);
  }
  if (!strcmp(v6, "netcat"))
  {
    sub_1000032A0(v2, v5);
    return 0;
  }
  v31 = strcmp(v6, "relay");
  if (a1 >= 4 && !v31)
  {
    sub_100003460(v2, v5);
    return 0;
  }
  if (!strcmp(v6, "relay-child"))
  {
    sub_100003934(v2, v5);
    return 0;
  }
  v32 = strcmp(v6, "convert-bridge-version");
  if (a1 == 4 && !v32)
  {
    sub_100003BA4(*(void *)(a2 + 16), *(const char **)(a2 + 24));
    return 0;
  }
  v33 = strcmp(v6, "heartbeat");
  if (a1 == 3 && !v33) {
    sub_100003C58(*(char **)(a2 + 16));
  }
  if (!strcmp(v6, "trampoline")) {
    sub_100003C84(v2, v5);
  }
  v34 = strcmp(v6, "reset");
  if (a1 == 3 && !v34)
  {
    sub_1000040D8(*(char **)(a2 + 16));
    return 0;
  }
  v39 = strcmp(v6, "alias");
  if (a1 == 4 && !v39)
  {
    sub_100004120(*(char **)(a2 + 16));
    return 0;
  }
  v45 = strcmp(v6, "synctime");
  v46 = a1 - 3;
  if (a1 == 3 && !v45)
  {
    sub_100004178(*(char **)(a2 + 16));
    return 0;
  }
  if (!os_variant_has_internal_content()) {
LABEL_107:
  }
    sub_100002784();
  v47 = *v5;
  v48 = strcmp(*v5, "loopback");
  if (v46 <= 1 && !v48)
  {
    sub_1000041C0(*(const char **)(a2 + 16));
    return 0;
  }
  v49 = strcmp(v47, "bonjour");
  if (v46 <= 1 && !v49)
  {
    if (a1 == 4) {
      v50 = *(void *)(a2 + 24);
    }
    else {
      v50 = 0;
    }
    sub_100004280(*(const char **)(a2 + 16), v50);
    return 0;
  }
  v51 = strcmp(v47, "network");
  if (v46 <= 1 && !v51)
  {
    if (a1 == 4) {
      v52 = *(char **)(a2 + 24);
    }
    else {
      v52 = 0;
    }
    sub_100004318(*(const char **)(a2 + 16), v52);
    return 0;
  }
  v53 = strcmp(v47, "compute");
  if (v46 > 1 || v53)
  {
    v55 = strcmp(v47, "identity");
    if (a1 == 3 && !v55)
    {
      sub_10000455C(*(const char **)(a2 + 16));
      return 0;
    }
    v56 = strcmp(v47, "setup-ssh");
    if (a1 <= 3 && !v56)
    {
      sub_100004620(v2, v5);
      return 0;
    }
    if (!strcmp(v47, "ssh-tunnel"))
    {
      sub_10000E2FC(v2, v5);
      return 0;
    }
    if (!strcmp(v47, "ssh-tunnel-callback"))
    {
      sub_10000F6EC(v2, v5);
      return 0;
    }
    if (!strcmp(v47, "ssh-tunnel-privileged"))
    {
      sub_100010298(v2, v5);
      return 0;
    }
    goto LABEL_107;
  }
  if (a1 == 4) {
    v54 = *(char **)(a2 + 24);
  }
  else {
    v54 = 0;
  }
  sub_100004410(*(const char **)(a2 + 16), v54);
  return 0;
}

void sub_100002724(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

void sub_100002784()
{
  if (os_variant_has_internal_content())
  {
    fwrite("\nAppleInternal commands:\n\n", 0x1AuLL, 1uLL, __stderrp);
    fwrite("usage: remotectl loopback (attach [--tls]|connect|detach|suspend|resume)\n", 0x49uLL, 1uLL, __stderrp);
    fwrite("usage: remotectl bonjour ((enable|enable-loopback interface_name)|(disable))\n", 0x4DuLL, 1uLL, __stderrp);
    fwrite("usage: remotectl network ((enable interface_name)|disable|(connect address)|(disconnect name|uuid|trait))\n", 0x6AuLL, 1uLL, __stderrp);
    fwrite("usage: remotectl compute ((listen interface_name)|(browse interface_name)|(disconnect name|uuid|trait)|(tls [required|optional])\n", 0x81uLL, 1uLL, __stderrp);
    fwrite("usage: remotectl setup-ssh [-f]\n", 0x20uLL, 1uLL, __stderrp);
    fwrite("usage: remotectl ssh-tunnel [ssh_host]\n", 0x27uLL, 1uLL, __stderrp);
  }
  exit(64);
}

void sub_1000029F4(char *a1, const char *a2)
{
  v3 = sub_100005204(a1);
  id v6 = v3;
  if (a2)
  {
    v4 = sub_1000057A8(v3);
    if (!v4) {
      errx(65, "Unable to find service \"%s\"", a2);
    }
    v5 = v4;
    sub_10000580C(v4, 0);
  }
  else
  {
    sub_1000052D8(v3, 0);
  }
}

void sub_100002A80(char *a1, const char *a2, const char *a3)
{
  v5 = sub_100005204(a1);
  id v13 = v5;
  if (!a2)
  {
    v8 = (void *)remote_device_copy_property();
    if (v8) {
      goto LABEL_4;
    }
LABEL_8:
    name = (const char *)remote_device_get_name();
    v11 = "/";
    v12 = "";
    if (a2) {
      v12 = a2;
    }
    else {
      v11 = "";
    }
    errx(66, "No such property \"%s\" on %s%s%s", a3, name, v11, v12);
  }
  uint64_t v6 = sub_1000057A8(v5);
  if (!v6) {
    errx(65, "Unable to find service \"%s\"", a2);
  }
  v7 = (void *)v6;
  v8 = (void *)remote_service_copy_property();

  if (!v8) {
    goto LABEL_8;
  }
LABEL_4:
  v9 = (char *)xpc_copy_clean_description();
  puts(v9);
  free(v9);
}

void sub_100002B7C()
{
  v0 = (void *)local_device_copy_description();
  v1 = (void *)local_device_copy_service_names();
  v2 = (__SecIdentity *)local_device_copy_identity();
  if (v0 && v1)
  {
    id v3 = v0;
    id v4 = v1;
    puts("Local device");
    v5 = xpc_dictionary_get_dictionary(v3, "properties");
    uuid = xpc_dictionary_get_uuid(v3, "UUID");
    if (uuid)
    {
      *(void *)&out[29] = 0xAAAAAAAAAAAAAAAALL;
      *(void *)&long long v7 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v7 + 1) = 0xAAAAAAAAAAAAAAAALL;
      *(_OWORD *)uuid_string_t out = v7;
      *(_OWORD *)&out[16] = v7;
      uuid_unparse(uuid, out);
      printf("\tUUID: %s\n", out);
    }
    uint64_t uint64 = xpc_dictionary_get_uint64(v3, "device_messaging_protocol_version");
    printf("\tMessaging Protocol Version: %llu\n", uint64);
    string = xpc_dictionary_get_string(v5, "ProductType");
    if (string) {
      printf("\tProduct Type: %s\n", string);
    }
    v10 = xpc_dictionary_get_string(v5, "BuildVersion");
    v11 = xpc_dictionary_get_string(v5, "OSVersion");
    BOOL v12 = xpc_dictionary_get_BOOL(v5, "AppleInternal");
    if (v10 && v11)
    {
      id v13 = "";
      if (v12) {
        id v13 = " AppleInternal";
      }
      printf("\tOS Build: %s (%s)%s\n", v11, v10, v13);
    }
    v14 = (unsigned char *)xpc_copy_clean_description();
    printf("\tProperties: ");
    sub_1000058CC(v14, "\t");
    free(v14);
    putchar(10);
    puts("\tServices:");
    xpc_array_apply(v4, &stru_100025338);

    sub_100005A84(v2);
    putchar(10);
  }
  id v15 = &_dispatch_main_q;
  remote_device_browse_present();

  dispatch_main();
}

void sub_100002D8C(_Unwind_Exception *exception_object)
{
}

void sub_100002DBC(int a1, char **a2)
{
  uint64_t v4 = 0;
  v5 = 0;
  while (1)
  {
    while (1)
    {
      int v6 = getopt(a1, a2, "v:d:");
      if (v6 != 100) {
        break;
      }
      uint64_t v7 = sub_100005204(optarg);

      v5 = (void *)v7;
    }
    if (v6 == -1) {
      break;
    }
    if (v6 != 118) {
      sub_100002784();
    }
    uint64_t v4 = strtoll(optarg, 0, 10);
  }
  dispatch_queue_t v8 = dispatch_queue_create("echo", 0);
  if (!v5)
  {
    v5 = (void *)remote_device_copy_unique_of_type();
    if (!v5)
    {
      fwrite("No coproc device found, falling back to external.\n", 0x32uLL, 1uLL, __stderrp);
      v5 = (void *)remote_device_copy_unique_of_type();
      if (!v5)
      {
        fwrite("No external device found, falling back to loopback.\n", 0x34uLL, 1uLL, __stderrp);
        v5 = (void *)remote_device_copy_unique_of_type();
        if (!v5)
        {
          v18 = __stderrp;
          v19 = "No loopback device found.\n";
          size_t v20 = 26;
          goto LABEL_32;
        }
      }
    }
  }
  if (remote_device_get_state() != 2)
  {
    v18 = __stderrp;
    v19 = "Device not in state CONNECTED\n";
    size_t v20 = 30;
LABEL_32:
    fwrite(v19, v20, 1uLL, v18);
    goto LABEL_34;
  }
  uint64_t v9 = sub_1000057A8(v5);
  if (!v9)
  {
    fprintf(__stderrp, "Service %s not found.\n", "com.apple.internal.xpc.remote.echo");
LABEL_34:
    exit(1);
  }
  v21 = (void *)v9;
  v10 = (void *)xpc_remote_connection_create_with_remote_service();
  xpc_remote_connection_set_event_handler();
  if (v4) {
    xpc_remote_connection_set_local_service_version();
  }
  xpc_remote_connection_activate();
  uint64_t remote_service_version = xpc_remote_connection_get_remote_service_version();
  if (remote_service_version) {
    fprintf(__stderrp, "Remote Service Version: %lld\n", remote_service_version);
  }
  size_t v22 = 0;
  BOOL v12 = fgetln(__stdinp, &v22);
  if (v12 && v22 >= 2)
  {
    id v13 = v12;
    do
    {
      v14 = +[NSData dataWithBytesNoCopy:length:freeWhenDone:](NSData, "dataWithBytesNoCopy:length:freeWhenDone:", v13);
      id v15 = +[NSJSONSerialization JSONObjectWithData:v14 options:4 error:0];
      if (v15)
      {
        v16 = (void *)_CFXPCCreateXPCObjectFromCFObject();
        if (!v16) {
          fwrite("Unable to render as XPC message\n", 0x20uLL, 1uLL, __stderrp);
        }
        xpc_remote_connection_send_message();
      }
      else
      {
        fwrite("Rejecting invalid input message\n", 0x20uLL, 1uLL, __stderrp);
      }

      id v13 = fgetln(__stdinp, &v22);
      if (v13) {
        BOOL v17 = v22 > 1;
      }
      else {
        BOOL v17 = 0;
      }
    }
    while (v17);
  }
  xpc_remote_connection_send_barrier();
  xpc_remote_connection_cancel();
  fwrite("Connection cancelled, waiting for invalid error...\n", 0x33uLL, 1uLL, __stderrp);
}

void sub_100003130(int a1, uint64_t a2)
{
  if (a1 == 3)
  {
    v2 = *(char **)(a2 + 8);
    fprintf(__stderrp, "Sending %s to %s.\n", *(const char **)(a2 + 16), v2);
    dispatch_queue_create("echo", 0);
    id v3 = sub_100005204(v2);
    if (remote_device_get_state() == 2)
    {
      sub_1000057A8(v3);
      if (!objc_claimAutoreleasedReturnValue()) {
        errx(69, "Service %s not found.");
      }
      xpc_remote_connection_create_with_remote_service();
      xpc_remote_connection_set_event_handler();
      xpc_remote_connection_activate();
      xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
      v5 = (void *)xpc_file_transfer_create_with_path();
      if (!v5) {
        err(66, "Unable to create file transfer object");
      }
      xpc_dictionary_set_value(v4, "file", v5);
      xpc_dictionary_set_BOOL(v4, "DisableFileReflection", 1);
      int v6 = (char *)xpc_copy_clean_description();
      fprintf(__stderrp, "Sending Message: %s\n", v6);
      free(v6);
      xpc_remote_connection_send_message();
      dispatch_main();
    }
    errx(69, "Device not in state CONNECTED");
  }
  sub_100002784();
}

void sub_1000032A0(int a1, char **a2)
{
  char v4 = 0;
  do
  {
    char v5 = v4;
    int v6 = getopt(a1, a2, "F");
    char v4 = 1;
  }
  while (v6 == 70);
  if (v6 != -1 || a1 - optind != 2) {
    sub_100002784();
  }
  uint64_t v7 = &a2[optind];
  dispatch_queue_t v8 = *v7;
  uint64_t v9 = v7[1];
  v10 = sub_100005204(*v7);
  uint64_t v11 = sub_1000057A8(v10);
  if (!v11) {
    errx(65, "Unable to find service %s/%s", v8, v9);
  }
  BOOL v12 = (void *)v11;
  int v13 = sub_100005FEC();
  if (v13 == -1) {
    errx(69, "Unable to connect to %s/%s", v8, v9);
  }
  int v14 = v13;
  if (v5)
  {
    if (remote_service_should_encrypt_socket_data()) {
      sub_10001BCBC();
    }
    id v15 = malloc_type_malloc(0x10uLL, 0xBE9DFB57uLL);
    long long v17 = off_100025438;
    *(&v16.msg_iovlen + 1) = -1431655766;
    v16.msg_name = 0;
    *(&v16.msg_namelen + 1) = -1431655766;
    v16.msg_namelen = 0;
    v16.msg_iov = (iovec *)&v17;
    v16.msg_iovlen = 1;
    v16.msg_control = v15;
    *(void *)&v16.msg_controllen = 16;
    *(void *)id v15 = 0xFFFF00000010;
    v15[2] = 1;
    v15[3] = v14;
    if (sendmsg(1, &v16, 0) < 0) {
      sub_10001BCD8();
    }
  }
  else
  {
    sub_100006048(0, 1, v13);
  }
}

void sub_100003460(int a1, char **a2)
{
  LODWORD(v4) = 0;
  char v5 = 0;
  uint64_t v6 = 0;
  while (1)
  {
    uint64_t v7 = v6;
    do
    {
      uint64_t v6 = v7;
      int v8 = getopt(a1, a2, "b:p:s");
      uint64_t v7 = 1;
    }
    while (v8 == 115);
    if (v8 == -1) {
      break;
    }
    if (v8 == 112)
    {
      uint64_t v9 = optarg;
      *__error() = 0;
      unint64_t v4 = strtoul(v9, 0, 0);
      if (*__error()) {
        sub_10001BF30(v9);
      }
      if (v4 >= 0x10000) {
        sub_10001BF14();
      }
    }
    else
    {
      if (v8 != 98) {
        goto LABEL_30;
      }
      char v5 = optarg;
    }
  }
  if (a1 - optind != 2) {
LABEL_30:
  }
    sub_100002784();
  v10 = &a2[optind];
  uint64_t v11 = *v10;
  BOOL v12 = v10[1];
  if (v5) {
    int v13 = v5;
  }
  else {
    int v13 = "::";
  }
  uint64_t v33 = 0;
  v34 = 0;
  int v14 = inet_pton(30, v13, &v33);
  if (v14 != 1)
  {
    if (v14) {
      sub_10001BCF4();
    }
    v32 = 0;
    if (asprintf(&v32, "::ffff:%s", v13) < 0) {
      sub_10001BD20(&v42, &v35);
    }
    int v15 = inet_pton(30, v32, &v33);
    if (v15 != 1)
    {
      if (v15 != -1)
      {
        if (!v15) {
          sub_10001BEF8();
        }
        sub_10001BDAC(&v42, &v35);
      }
      sub_10001BCF4();
    }
  }
  uint64_t v16 = v33;
  long long v17 = v34;
  v18 = sub_100005204(v11);
  uint64_t v19 = sub_1000057A8(v18);
  if (!v19) {
    errx(65, "Unable to find service %s/%s", v11, v12);
  }
  size_t v20 = (void *)v19;
  int v21 = socket(30, 1, 0);
  if (v21 == -1) {
    sub_10001BE30();
  }
  int v22 = v21;
  LODWORD(v33) = 0;
  if (setsockopt(v21, 41, 27, &v33, 4u)) {
    sub_10001BECC();
  }
  *(_WORD *)&v35.sa_len = 7680;
  *(_WORD *)v35.sa_data = bswap32(v4) >> 16;
  *(_DWORD *)&v35.sa_data[2] = 0;
  *(void *)&v35.sa_data[6] = v16;
  v36 = v17;
  LODWORD(v37) = 0;
  if (bind(v22, &v35, 0x1Cu) == -1) {
    sub_10001BE4C();
  }
  if (listen(v22, 128) == -1) {
    sub_10001BE78();
  }
  LODWORD(v42) = 28;
  if (getsockname(v22, &v35, (socklen_t *)&v42) == -1) {
    sub_10001BE94();
  }
  unsigned int v23 = *(unsigned __int16 *)v35.sa_data;
  int v24 = sub_100005FEC();
  if (v24 == -1) {
LABEL_49:
  }
    errx(69, "Unable to connect to %s/%s", v11, v12);
  int v25 = v24;
  unsigned int v26 = __rev16(v23);
  if (v6)
  {
    printf("Listening on %s port %d...\n", v13, v26);
    close(v25);
    while (1)
    {
      while (1)
      {
        int v27 = accept(v22, 0, 0);
        if (v27 != -1) {
          break;
        }
        if (*__error() != 4) {
          sub_10001BEB0();
        }
      }
      int v28 = v27;
      int v29 = sub_100005FEC();
      if (v29 == -1) {
        break;
      }
      int v30 = v29;
      unint64_t v42 = __PAIR64__(v29, v28);
      v31 = 0;
      v32 = 0;
      if (asprintf(&v32, "%d", v28) < 0) {
        sub_10001BD20(&v33, &v35);
      }
      if (asprintf(&v31, "%d", v30) < 0) {
        sub_10001BD20(&v33, &v35);
      }
      *(void *)&v35.sa_len = "remotectl";
      *(void *)&v35.sa_data[6] = "relay-child";
      v36 = "-i";
      v37 = v32;
      v38 = "-o";
      v39 = v31;
      v40 = "-s";
      uint64_t v41 = 0;
      sub_100006200((char *const *)&v35, (uint64_t)&v42);
      close(v28);
      close(v30);
    }
    goto LABEL_49;
  }
  printf("%d\n", v26);
  fflush(__stdoutp);
  unint64_t v42 = __PAIR64__(v25, v22);
  v31 = 0;
  v32 = 0;
  if (asprintf(&v32, "%d", v22) < 0) {
    sub_10001BD20(&v33, &v35);
  }
  if (asprintf(&v31, "%d", v25) < 0) {
    sub_10001BD20(&v33, &v35);
  }
  *(void *)&v35.sa_len = "remotectl";
  *(void *)&v35.sa_data[6] = "relay-child";
  v36 = "-l";
  v37 = v32;
  v38 = "-o";
  v39 = v31;
  v40 = 0;
  sub_100006200((char *const *)&v35, (uint64_t)&v42);
  close(v22);
  close(v25);
}

void sub_100003934(int a1, char *const *a2)
{
  unint64_t v4 = os_log_create("com.apple.RemoteServiceDiscovery", "relay-child");
  uint64_t v5 = 0;
  int v6 = -1;
  int v7 = -1;
  int v8 = -1;
  while (1)
  {
    while (1)
    {
      uint64_t v9 = v5;
      do
      {
        uint64_t v5 = v9;
        int v10 = getopt(a1, a2, "l:i:o:s");
        uint64_t v9 = 1;
      }
      while (v10 == 115);
      if (v10 <= 107) {
        break;
      }
      if (v10 == 111)
      {
        int v8 = strtol(optarg, 0, 0);
      }
      else
      {
        if (v10 != 108) {
LABEL_22:
        }
          sub_100002784();
        int v6 = strtol(optarg, 0, 0);
      }
    }
    if (v10 == -1) {
      break;
    }
    if (v10 != 105) {
      goto LABEL_22;
    }
    int v7 = strtol(optarg, 0, 0);
  }
  if (v5)
  {
    pid_t v11 = getppid();
    if (v11 == 1)
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "parent exited, exiting", buf, 2u);
      }
      exit(1);
    }
    pid_t v12 = v11;
    int v13 = dispatch_queue_create("relay-child", 0);
    int v14 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_proc, v12, 0x80000000uLL, v13);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10000641C;
    handler[3] = &unk_100025450;
    long long v17 = v4;
    dispatch_source_set_event_handler(v14, handler);
    dispatch_activate(v14);
  }
  else
  {
    int v13 = 0;
    int v14 = 0;
  }
  if (v6 != -1)
  {
    while (1)
    {
      int v15 = accept(v6, 0, 0);
      if (v15 != -1) {
        break;
      }
      if (*__error() != 4) {
        sub_10001BEB0();
      }
    }
    int v7 = v15;
    close(v6);
  }
  sub_100006048(v7, v7, v8);
}

uint64_t sub_100003BA4(uint64_t a1, const char *a2)
{
  uint64_t v8 = 0;
  uint64_t v9 = 0;
  uint64_t v10 = 0;
  __int16 v7 = 0;
  if ((bridge_version_read_plist() & 1) == 0) {
    sub_10001BFB8();
  }
  memset(v6, 0, sizeof(v6));
  if ((bridge_version_serialize() & 1) == 0) {
    sub_10001BF9C();
  }
  id v3 = fopen(a2, "wx");
  if (!v3) {
    sub_10001BF64();
  }
  unint64_t v4 = v3;
  if (fwrite(v6, 0x20uLL, 1uLL, v3) <= 0x1F) {
    sub_10001BF80();
  }
  uint64_t result = fclose(v4);
  if (result) {
    sub_10001BF80();
  }
  return result;
}

void sub_100003C58(char *a1)
{
}

void sub_100003C84(int a1, char *const *a2)
{
  os_log_t v21 = os_log_create("com.apple.RemoteServiceDiscovery", "rsdtrampoline");
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x3032000000;
  v32[3] = sub_100004D20;
  v32[4] = sub_100004D30;
  v32[5] = 0;
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x2020000000;
  v31[3] = 0;
  if (optind != 1 || a1 < 1)
  {
LABEL_6:
    uint64_t v5 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0x14uLL, 0, (dispatch_queue_t)&_dispatch_main_q);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1000067BC;
    handler[3] = &unk_1000254E0;
    void handler[4] = v21;
    handler[5] = v31;
    handler[6] = v32;
    dispatch_source_set_event_handler(v5, handler);
    dispatch_activate(v5);
    dispatch_main();
  }
  while (1)
  {
    for (int i = -1; ; int i = atoi(optarg))
    {
      int v7 = getopt(a1, a2, "2:");
      if (v7 != 50) {
        break;
      }
    }
    if (v7 != -1) {
      goto LABEL_30;
    }
    uint64_t v8 = optind;
    uint64_t v9 = (a1 - optind);
    if ((int)v9 < 1) {
      goto LABEL_31;
    }
    uint64_t v10 = 0;
    pid_t v11 = &a2[optind];
    while (strcmp(v11[v10], "--"))
    {
      if (v9 == ++v10)
      {
        LODWORD(v10) = v9;
        goto LABEL_17;
      }
    }
    optind = 1;
LABEL_17:
    if (v10 <= 1) {
LABEL_31:
    }
      sub_100002784();
    uint64_t v12 = v10;
    int v22 = *v11;
    int v13 = malloc_type_calloc(v10, 8uLL, 0x10040436913F5uLL);
    int v14 = v13;
    if (!v13) {
      break;
    }
    unint64_t v15 = 0;
    uint64_t v16 = &v11[v10];
    a1 = v9 - v10;
    do
    {
      v13[v15 / 8] = (&a2[v8 + 1])[v15 / 8];
      v15 += 8;
    }
    while (8 * v12 - 8 != v15);
    id v17 = &_dispatch_main_q;
    handler[7] = _NSConcreteStackBlock;
    handler[8] = 3221225472;
    handler[9] = sub_1000064C8;
    handler[10] = &unk_1000254B8;
    int v29 = i;
    int v27 = v14;
    v18 = v21;
    int v24 = v18;
    int v25 = v31;
    int v28 = v22;
    unsigned int v26 = v32;
    remote_service_listen();

    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v19 = *v14;
      *(_DWORD *)buf = 136446466;
      *(void *)&buf[4] = v22;
      *(_WORD *)&buf[12] = 2082;
      *(void *)&buf[14] = v19;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Trampoline started for \"%{public}s\" -> %{public}s", buf, 0x16u);
    }

    BOOL v20 = optind != 1 || a1 <= 0;
    a2 = v16;
    if (v20) {
      goto LABEL_6;
    }
  }
  uint64_t v30 = 0;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v36 = 0u;
  memset(buf, 0, sizeof(buf));
  os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
  int v33 = 134217984;
  uint64_t v34 = 0;
  _os_log_send_and_compose_impl();
  _os_crash_msg();
  __break(1u);
LABEL_30:
  sub_100002784();
}

void sub_10000409C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
}

void sub_1000040D8(char *a1)
{
  sub_100005204(a1);
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  if ((remote_device_reset() & 1) == 0) {
    sub_10001BFD4();
  }
}

void sub_100004120(char *a1)
{
  sub_100005204(a1);
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  if ((remote_device_set_alias() & 1) == 0) {
    sub_10001BFF4();
  }
}

void sub_100004178(char *a1)
{
  sub_100005204(a1);
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  if ((remote_device_timesync() & 1) == 0) {
    sub_10001C014();
  }
}

uint64_t sub_1000041C0(const char *a1)
{
  if (!strcmp(a1, "attach"))
  {
    uint64_t result = remote_control_attach_loopback();
    if ((result & 1) == 0) {
      goto LABEL_11;
    }
  }
  else if (!strcmp(a1, "connect"))
  {
    uint64_t result = remote_control_connect_loopback();
    if ((result & 1) == 0) {
      goto LABEL_11;
    }
  }
  else if (!strcmp(a1, "detach"))
  {
    uint64_t result = remote_control_detach_loopback();
    if ((result & 1) == 0) {
      goto LABEL_11;
    }
  }
  else if (!strcmp(a1, "suspend"))
  {
    uint64_t result = remote_control_suspend_loopback();
    if ((result & 1) == 0) {
      goto LABEL_11;
    }
  }
  else
  {
    if (strcmp(a1, "resume")) {
      sub_100002784();
    }
    uint64_t result = remote_control_resume_loopback();
    if ((result & 1) == 0) {
LABEL_11:
    }
      exit(1);
  }
  return result;
}

uint64_t sub_100004280(const char *a1, uint64_t a2)
{
  int v4 = strcmp(a1, "enable");
  if (a2 && !v4)
  {
    uint64_t result = remote_control_enable_bonjour();
    if (result) {
      return result;
    }
LABEL_8:
    exit(1);
  }
  int v6 = strcmp(a1, "enable-loopback");
  if (!a2 || v6)
  {
    int v7 = strcmp(a1, "disable");
    if (a2 || v7) {
      sub_100002784();
    }
    uint64_t result = remote_control_disable_bonjour();
    if ((result & 1) == 0) {
      goto LABEL_8;
    }
  }
  else
  {
    uint64_t result = remote_control_enable_bonjour_loopback();
    if ((result & 1) == 0) {
      goto LABEL_8;
    }
  }
  return result;
}

void sub_100004318(const char *a1, char *a2)
{
  int v4 = strcmp(a1, "enable");
  if (!a2 || v4)
  {
    int v5 = strcmp(a1, "disable");
    if (a2 || v5)
    {
      int v6 = strcmp(a1, "connect");
      if (a2 && !v6)
      {
        if ((remote_control_connect_network_peer() & 1) == 0) {
          goto LABEL_19;
        }
        return;
      }
      int v7 = strcmp(a1, "disconnect");
      if (!a2 || v7) {
        sub_100002784();
      }
      sub_100005204(a2);
      id v8 = (id)objc_claimAutoreleasedReturnValue();
      if (remote_device_disconnect())
      {

        return;
      }
    }
    else if (remote_control_disable_network_peer())
    {
      return;
    }
LABEL_19:
    exit(1);
  }
  if ((remote_control_enable_network_peer() & 1) == 0) {
    goto LABEL_19;
  }
}

void sub_100004410(const char *a1, char *a2)
{
  int v4 = strcmp(a1, "browse");
  if (!a2 || v4)
  {
    int v5 = strcmp(a1, "listen");
    if (!a2 || v5)
    {
      int v6 = strcmp(a1, "disconnect");
      if (!a2 || v6)
      {
        if (strcmp(a1, "tls")) {
          goto LABEL_25;
        }
        if (!a2)
        {
          sub_100006964();
          return;
        }
        if (strcmp(a2, "required") && strcmp(a2, "optional")) {
LABEL_25:
        }
          sub_100002784();
        if (local_device_compute_platform_require_tls()) {
          goto LABEL_24;
        }
      }
      else
      {
        sub_100005204(a2);
        id v7 = (id)objc_claimAutoreleasedReturnValue();
        if ((remote_device_disconnect() & 1) == 0) {
          goto LABEL_24;
        }
      }
    }
    else if (!remote_compute_node_listen())
    {
LABEL_24:
      exit(1);
    }
  }
  else if (!remote_compute_controller_browse())
  {
    goto LABEL_24;
  }
}

void sub_10000455C(const char *a1)
{
  if (!strcmp(a1, "show"))
  {
    v2 = (__SecIdentity *)local_device_copy_identity();
    sub_100005A84(v2);
    if (v2)
    {
      CFRelease(v2);
    }
  }
  else if (!strcmp(a1, "delete"))
  {
    if ((local_device_delete_identity() & 1) == 0) {
      goto LABEL_12;
    }
  }
  else
  {
    if (strcmp(a1, "create")) {
      sub_100002784();
    }
    if ((local_device_create_identity() & 1) == 0) {
LABEL_12:
    }
      exit(1);
  }
}

void sub_100004604(_Unwind_Exception *exception_object)
{
  if (v1) {
    CFRelease(v1);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_100004620(int a1, char *const *a2)
{
  strcpy(__dst, "\nHost *.rsd\n\t# This host entry is generated by remotectl setup-ssh\n\tProxyCommand /usr/local/bin/remotectl netcat -F %h com.apple.internal.ssh\n\tProxyUseFdpass yes\n\tServerAliveInterval 1\n\tServerAliveCountMax 3\n\tStrictHostKeyChecking no\n\tUserKnownHostsFile /dev/null\n\tUser root\n\tControlPersist no\n");
  char v4 = 0;
  do
  {
    char v5 = v4;
    int v6 = getopt(a1, a2, "f");
    char v4 = 1;
  }
  while (v6 == 102);
  if (v6 != -1) {
    sub_100002784();
  }
  id v7 = NSHomeDirectory();
  id v8 = [v7 stringByAppendingPathComponent:@".ssh"];
  uint64_t v9 = (const char *)[v8 UTF8String];

  int v10 = open(v9, 0x100000);
  if ((v10 & 0x80000000) == 0) {
    *__error() = 0;
  }
  int v11 = *__error();
  if (v11)
  {
    if (v11 != 2)
    {
      int v25 = __error();
      err(*v25, "failed to open directory %s");
    }
    if (mkdir(v9, 0x1C0u) == -1)
    {
      unsigned int v26 = __error();
      err(*v26, "failed to mkdir %s");
    }
    int v10 = open(v9, 0x100000);
    if (v10 == -1)
    {
      int v27 = __error();
      err(*v27, "failed to open created directory %s");
    }
  }
  int v12 = openat(v10, ".RSDSetupDone", 1);
  if ((v12 & 0x80000000) == 0) {
    *__error() = 0;
  }
  int v13 = *__error();
  if (v13)
  {
    if (v13 != 2)
    {
      int v14 = __error();
      warnc(*v14, "failed to open cookie file");
    }
  }
  else if ((v5 & 1) == 0)
  {
    puts("RSD ssh has been setup before. Pass -f to force redo the setup");
    exit(0);
  }
  int v15 = openat(v10, "config", 521, 420);
  int v16 = v15;
  if (v15 == -1)
  {
    unsigned int v23 = __error();
    err(*v23, "failed to open or create %s/config file", v9);
  }
  if (write(v15, __dst, 0x126uLL) == -1)
  {
    int v24 = __error();
    err(*v24, "failed to write RSD ssh config to %s/config file", v9);
  }
  if (v12 == -1)
  {
    int v12 = openat(v10, ".RSDSetupDone", 513, 420);
    if (v12 == -1)
    {
      id v17 = __error();
      warnc(*v17, "failed to create the cookie file");
      int v12 = -1;
    }
  }
  uint64_t result = close(v16);
  if (result == -1)
  {
    uint64_t v28 = 0;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v32 = 0u;
    os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    int v19 = *__error();
    int v30 = 67109120;
    int v31 = v19;
    _os_log_send_and_compose_impl();
    uint64_t v20 = _os_crash_msg();
    sub_10001BCB8(v20);
  }
  if (v12 != -1)
  {
    uint64_t result = close(v12);
    if (result == -1)
    {
      uint64_t v28 = 0;
      long long v35 = 0u;
      long long v36 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      long long v32 = 0u;
      os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      int v21 = *__error();
      int v30 = 67109120;
      int v31 = v21;
      _os_log_send_and_compose_impl();
      uint64_t v22 = _os_crash_msg();
      sub_10001BCB8(v22);
    }
  }
  if (v10 != -1)
  {
    uint64_t result = close(v10);
    if (result == -1) {
      sub_10001C034(&v28, &v32);
    }
  }
  return result;
}

void sub_100004A78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, int a11, unsigned int a12, unsigned int a13, unsigned int a14)
{
}

void sub_100004AC8(id a1, OS_remote_device *a2, BOOL a3)
{
  BOOL v3 = a3;
  char v4 = a2;
  if (v3) {
    exit(0);
  }
  char v5 = v4;
  memset(uu, 170, sizeof(uu));
  remote_device_copy_uuid();
  *(void *)&out[29] = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v6 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)uuid_string_t out = v6;
  *(_OWORD *)&out[16] = v6;
  uuid_unparse(uu, out);
  name = (const char *)remote_device_get_name();
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  *(_OWORD *)__str = 0u;
  long long v25 = 0u;
  if (remote_device_get_state() == 1)
  {
    printf("%s %-16s\n", out, name);
  }
  else if (remote_device_get_state() == 2)
  {
    uint64_t v8 = remote_device_copy_product_type();
    if (v8) {
      uint64_t v9 = (char *)v8;
    }
    else {
      uint64_t v9 = "-";
    }
    int v10 = (void *)remote_device_copy_property();
    int v11 = v10;
    if (v10 && (string_ptr = xpc_string_get_string_ptr(v10)) != 0) {
      int v13 = strdup(string_ptr);
    }
    else {
      int v13 = 0;
    }

    if (v13) {
      int v14 = v13;
    }
    else {
      int v14 = "-";
    }
    uint64_t v15 = remote_device_copy_os_version();
    if (v15) {
      int v16 = (char *)v15;
    }
    else {
      int v16 = "-";
    }
    uint64_t v17 = remote_device_copy_os_build();
    if (v17) {
      v18 = (char *)v17;
    }
    else {
      v18 = "-";
    }
    uint64_t v19 = remote_device_copy_bridge_version_string();
    if (v19) {
      uint64_t v20 = (char *)v19;
    }
    else {
      uint64_t v20 = "-";
    }
    alias = (const char *)remote_device_get_alias();
    if (alias) {
      snprintf(__str, 0x80uLL, "%s(%s)", name, alias);
    }
    else {
      __strlcpy_chk();
    }
    int v22 = remote_device_copy_internal_build();
    unsigned int v23 = "AppleInternal";
    if (!v22) {
      unsigned int v23 = "-";
    }
    printf("%s %-16s %-12s %-8s %s (%s/%s) %s\n", out, __str, v9, v14, v16, v18, v20, v23);
    if (v9 != "-") {
      free(v9);
    }
    if (v13) {
      free(v13);
    }
    if (v18 != "-") {
      free(v18);
    }
    if (v16 != "-") {
      free(v16);
    }
    if (v20 != "-") {
      free(v20);
    }
  }
}

uint64_t sub_100004D20(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100004D30(uint64_t a1)
{
}

void sub_100004D38(uint64_t a1, void *a2, int a3)
{
  id v5 = a2;
  if (a3)
  {
    free(*(void **)(a1 + 56));
    free(*(void **)(a1 + 64));
    printf("Browse Complete: ");
    unsigned int v8 = *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) - 1;
    if (v8 < 3)
    {
      puts(off_100025500[v8]);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) || !*(unsigned char *)(a1 + 76)) {
        exit(0);
      }
      exit(-1);
    }
    sub_10001C0F8();
  }
  long long v6 = v5;
  if (remote_device_get_state() == 1) {
    sub_100004F00("ATTACH", v6, *(unsigned __int8 *)(a1 + 77));
  }
  uint64_t v9 = v6;
  id v7 = v6;
  remote_device_set_connected_callback();
  remote_device_set_disconnected_callback();
}

uint64_t sub_100004F00(const char *a1, void *a2, int a3)
{
  id v5 = a2;
  name = (const char *)remote_device_get_name();
  memset(uu, 170, sizeof(uu));
  remote_device_copy_uuid();

  *(void *)&out[29] = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v7 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v7 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&out[16] = v7;
  *(_OWORD *)uuid_string_t out = v7;
  uuid_unparse(uu, out);
  if (a3)
  {
    *(_OWORD *)__str = 0u;
    long long v18 = 0u;
    time_t v16 = time(0);
    unsigned int v8 = localtime(&v16);
    long long v10 = *(_OWORD *)&v8->tm_mon;
    long long v9 = *(_OWORD *)&v8->tm_isdst;
    long long v11 = *(_OWORD *)&v8->tm_sec;
    v15.tm_zone = v8->tm_zone;
    *(_OWORD *)&v15.tm_mon = v10;
    *(_OWORD *)&v15.tm_isdst = v9;
    *(_OWORD *)&v15.tm_sec = v11;
    v14.tv_sec = 0xAAAAAAAAAAAAAAAALL;
    *(void *)&v14.tv_usec = 0xAAAAAAAAAAAAAAAALL;
    gettimeofday(&v14, 0);
    memset(v21, 170, 20);
    strftime(v21, 0x14uLL, "%Y-%m-%d %H:%M:%S", &v15);
    memset(v13, 170, 6);
    strftime(v13, 6uLL, "%z", &v15);
    snprintf(__str, 0x20uLL, "%s.%06d%s", v21, v14.tv_usec, v13);
    printf("%s ", __str);
  }
  return printf("%-16s %s (%s)\n", a1, name, out);
}

void sub_100005098(uint64_t a1, void *a2)
{
  sub_100004F00("CONNECT", a2, *(unsigned __int8 *)(a1 + 84));
  if (*(unsigned char *)(a1 + 85))
  {
    int v3 = *(_DWORD *)(a1 + 80);
    char v4 = *(const unsigned __int8 **)(a1 + 64);
    id v5 = *(const char **)(a1 + 72);
    id v6 = *(id *)(a1 + 32);
    if (remote_device_get_type() == v3)
    {
LABEL_3:

      *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
      remote_device_browser_cancel();
      return;
    }
    if (v4)
    {
      memset(uu2, 170, sizeof(uu2));
      remote_device_copy_uuid();
      if (!uuid_compare(v4, uu2)) {
        goto LABEL_3;
      }
    }
    else if (v5)
    {
      name = (const char *)remote_device_get_name();
      if (!strcmp(v5, name)) {
        goto LABEL_3;
      }
    }
  }
}

uint64_t sub_1000051B4(uint64_t a1, void *a2)
{
  return sub_100004F00("DISCONNECT", a2, *(unsigned __int8 *)(a1 + 32));
}

uint64_t sub_1000051C4(uint64_t a1)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 2;
  return remote_device_browser_cancel();
}

uint64_t sub_1000051E4(uint64_t a1)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 3;
  return remote_device_browser_cancel();
}

id sub_100005204(char *a1)
{
  v2 = strstr(a1, ".rsd");
  if (v2) {
    char *v2 = 0;
  }
  memset(uu, 170, sizeof(uu));
  if (uuid_parse(a1, uu))
  {
    if (remote_device_type_parse())
    {
      int v3 = (void *)remote_device_copy_unique_of_type();
      if (!v3) {
LABEL_12:
      }
        errx(65, "Unable to find device \"%s\".\n", a1);
    }
    else
    {
      int v3 = (void *)remote_device_copy_device_with_name();
      if (!v3) {
        goto LABEL_12;
      }
    }
  }
  else
  {
    int v3 = (void *)remote_device_copy_device_with_uuid();
    if (!v3) {
      goto LABEL_12;
    }
  }

  return v3;
}

void sub_1000052D8(void *a1, char a2)
{
  id v3 = a1;
  remote_device_get_type();
  description = (const char *)remote_device_type_get_description();
  name = (const char *)remote_device_get_name();
  printf("Found %s (%s)\n", name, description);
  alias = (const char *)remote_device_get_alias();
  if (alias) {
    printf("\tAlias Name: %s\n", alias);
  }
  int state = remote_device_get_state();
  unsigned int v8 = (const char *)remote_device_state_get_description();
  long long v9 = v8;
  if (state == 2)
  {
    int connectable = remote_device_get_connectable();
    long long v11 = "not-connectable";
    if (connectable) {
      long long v11 = "connectable";
    }
    printf("\tState: %s (%s)\n", v9, v11);
    memset(uu, 170, sizeof(uu));
    remote_device_copy_uuid();
    *(void *)&out[29] = 0xAAAAAAAAAAAAAAAALL;
    *(void *)&long long v12 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v12 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)uuid_string_t out = v12;
    *(_OWORD *)&out[16] = v12;
    uuid_unparse(uu, out);
    printf("\tUUID: %s\n", out);
    int v13 = (const char *)remote_device_copy_product_type();
    if (v13)
    {
      timeval v14 = (char *)v13;
      printf("\tProduct Type: %s\n", v13);
      free(v14);
    }
    tm v15 = (char *)remote_device_copy_os_build();
    uint64_t v16 = remote_device_copy_os_version();
    uint64_t v17 = (char *)v16;
    if (v15 && v16)
    {
      int v18 = remote_device_copy_internal_build();
      uint64_t v19 = "";
      if (v18) {
        uint64_t v19 = " AppleInternal";
      }
      printf("\tOS Build: %s (%s)%s\n", v17, v15, v19);
    }
    free(v15);
    free(v17);
    uint64_t messaging_protocol_version = remote_device_get_messaging_protocol_version();
    printf("\tMessaging Protocol Version: %llu\n", messaging_protocol_version);
    int v21 = remote_device_xpc_remote_connection_tls_enabled();
    int v22 = "disabled";
    if (v21) {
      int v22 = "enabled";
    }
    printf("\tEncrypted RemoteXPC: %s\n", v22);
    *(void *)&long long v23 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v23 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v40 = v23;
    long long v41 = v23;
    long long v39 = v23;
    if (remote_device_get_heartbeat_stats())
    {
      __uint64_t v24 = clock_gettime_nsec_np(_CLOCK_MONOTONIC);
      puts("\tHeartbeat:");
      if (*((void *)&v39 + 1)) {
        printf("\t\tLast successful heartbeat sent %.3fs ago, received %.3fs ago (took %.3fs)\n", (double)(v24 - (unint64_t)v39) / 1000000000.0, (double)(v24 - *((void *)&v39 + 1)) / 1000000000.0, (double)(unint64_t)(*((void *)&v39 + 1) - v39) / 1000000000.0);
      }
      if ((void)v40) {
        printf("\t\tOutstanding heartbeat sent %.3fs ago\n", (double)(v24 - (unint64_t)v40) / 1000000000.0);
      }
      if (*((void *)&v40 + 1)) {
        printf("\t\tLast incoming heartbeat received %.3fs ago\n", (double)(v24 - *((void *)&v40 + 1)) / 1000000000.0);
      }
      printf("\t\t%llu heartbeats sent, %llu received\n", (void)v41, *((void *)&v41 + 1));
    }
    long long v25 = (void *)remote_device_copy_properties();
    long long v26 = (unsigned char *)xpc_copy_clean_description();

    printf("\tProperties: ");
    sub_1000058CC(v26, "\t");
    free(v26);
    putchar(10);
    puts("\tServices:");
    long long v27 = (void *)remote_device_copy_service_names();
    if (!v27 || (long long v28 = v27, xpc_get_type(v27) != (xpc_type_t)&_xpc_type_array)) {
      sub_10001C114(out, &v39);
    }
    applier[0] = _NSConcreteStackBlock;
    applier[1] = 3221225472;
    applier[2] = sub_100005934;
    applier[3] = &unk_1000252B8;
    char v38 = a2;
    id v37 = v3;
    xpc_array_apply(v28, applier);
    puts("\tLocal Services:");
    long long v29 = (void *)remote_device_copy_local_service_names();
    if (!v29 || (long long v30 = v29, xpc_get_type(v29) != (xpc_type_t)&_xpc_type_array)) {
      sub_10001C190(out, &v39);
    }
    xpc_array_apply(v30, &stru_1000252F8);
  }
  else
  {
    printf("\tState: %s\n", v8);
    latest_connect_uint64_t result = remote_device_get_latest_connect_result();
    if (latest_connect_result < 0)
    {
      puts("\t No connect() results");
    }
    else
    {
      int v32 = latest_connect_result;
      if (latest_connect_result) {
        long long v33 = strerror(latest_connect_result);
      }
      else {
        long long v33 = "No error";
      }
      printf("\tconnect() result: %d (%s)\n", v32, v33);
    }
    long long v34 = (void *)remote_device_copy_properties();
    long long v35 = (unsigned char *)xpc_copy_clean_description();

    printf("\tProperties: ");
    sub_1000058CC(v35, "\t");
    free(v35);
    putchar(10);
  }
  putchar(10);
}

id sub_1000057A8(void *a1)
{
  id v1 = a1;
  if (remote_device_get_state() != 2) {
    sub_10001C20C();
  }
  v2 = (void *)remote_device_copy_service();

  return v2;
}

void sub_10000580C(void *a1, const char *a2)
{
  id v3 = a1;
  if (!a2) {
    a2 = "";
  }
  id v7 = v3;
  uint64_t version = remote_service_get_version();
  if (version) {
    printf("%sVersion: %lld\n", a2, version);
  }
  id v5 = (void *)remote_service_copy_properties();
  if (xpc_dictionary_get_count(v5))
  {
    printf("%sProperties: ", a2);
    id v6 = (unsigned char *)xpc_copy_clean_description();
    sub_1000058CC(v6, a2);
    free(v6);
    putchar(10);
  }
}

unsigned char *sub_1000058CC(unsigned char *result, const char *a2)
{
  char v2 = *result;
  if (*result)
  {
    char v4 = result + 1;
    do
    {
      uint64_t result = (unsigned char *)putc(v2, __stdoutp);
      if (*(v4 - 1) == 10) {
        uint64_t result = (unsigned char *)fputs(a2, __stdoutp);
      }
      int v5 = *v4++;
      char v2 = v5;
    }
    while (v5);
  }
  return result;
}

uint64_t sub_100005934(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  string_ptr = xpc_string_get_string_ptr(v4);
  printf("\t\t%s\n", string_ptr);
  if (*(unsigned char *)(a1 + 40))
  {
    xpc_string_get_string_ptr(v4);
    id v6 = (void *)remote_device_copy_service();
    id v7 = v6;
    if (v6) {
      sub_10000580C(v6, "\t\t\t");
    }
  }
  return 1;
}

BOOL sub_1000059BC(id a1, unint64_t a2, OS_xpc_object *a3)
{
  string_ptr = xpc_string_get_string_ptr(a3);
  printf("\t\t%s\n", string_ptr);
  return 1;
}

void sub_1000059F4(id a1, OS_remote_device *a2, BOOL a3)
{
  BOOL v3 = a3;
  id v4 = a2;
  if (v3) {
    exit(0);
  }
  int v5 = v4;
  sub_1000052D8(v4, 1);
}

BOOL sub_100005A4C(id a1, unint64_t a2, OS_xpc_object *a3)
{
  string_ptr = xpc_string_get_string_ptr(a3);
  printf("\t\t%s\n", string_ptr);
  return 1;
}

void sub_100005A84(__SecIdentity *a1)
{
  SecCertificateRef certificateRef = 0;
  SecKeyRef privateKeyRef = 0;
  puts("\tIdentity:");
  if (a1)
  {
    if (SecIdentityCopyPrivateKey(a1, &privateKeyRef))
    {
      long long v19 = 0u;
      long long v20 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      long long v16 = 0u;
      os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      int v14 = 134217984;
      uint64_t v15 = 0;
      _os_log_send_and_compose_impl();
      uint64_t v8 = _os_crash_msg();
      sub_10001BCB8(v8);
    }
    char v2 = SecKeyCopyPublicKey(privateKeyRef);
    BOOL v3 = v2;
    if (!v2)
    {
      long long v19 = 0u;
      long long v20 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      long long v16 = 0u;
      os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      int v14 = 134217984;
      uint64_t v15 = 0;
      _os_log_send_and_compose_impl();
      uint64_t v9 = _os_crash_msg();
      sub_10001BCB8(v9);
    }
    CFDataRef v4 = SecKeyCopyExternalRepresentation(v2, 0);
    if (!v4)
    {
      long long v19 = 0u;
      long long v20 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      long long v16 = 0u;
      os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      int v14 = 134217984;
      uint64_t v15 = 0;
      _os_log_send_and_compose_impl();
      uint64_t v10 = _os_crash_msg();
      sub_10001BCB8(v10);
    }
    CFDataRef v5 = v4;

    if (SecIdentityCopyCertificate(a1, &certificateRef))
    {
      long long v19 = 0u;
      long long v20 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      long long v16 = 0u;
      os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      int v14 = 134217984;
      uint64_t v15 = 0;
      _os_log_send_and_compose_impl();
      uint64_t v11 = _os_crash_msg();
      sub_10001BCB8(v11);
    }
    id v6 = [(__CFData *)v5 sha256];
    id v7 = [v6 base64EncodedStringWithOptions:0];
    printf("\t\tPublic key SHA256: %s\n", (const char *)[v7 UTF8String]);

    if (certificateRef) {
      CFRelease(certificateRef);
    }

    CFRelease(v3);
  }
  else
  {
    puts("\t\tnone");
  }
  if (privateKeyRef) {
    CFRelease(privateKeyRef);
  }
}

void sub_100005DF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, CFTypeRef a13, CFTypeRef cf)
{
  CFRelease(v14);
  if (cf) {
    CFRelease(cf);
  }
  _Unwind_Resume(a1);
}

void sub_100005E6C(id a1, OS_xpc_object *a2)
{
  object = a2;
  char v2 = (char *)xpc_copy_clean_description();
  if (xpc_get_type(object) == (xpc_type_t)&_xpc_type_error)
  {
    fprintf(__stderrp, "Error: %s\n", v2);
    exit(1);
  }
  puts(v2);
  free(v2);
}

void sub_100005F00(id a1)
{
}

void sub_100005F14(id a1, OS_xpc_object *a2)
{
  object = a2;
  char v2 = (const char *)xpc_copy_clean_description();
  if (xpc_get_type(object) == (xpc_type_t)&_xpc_type_error) {
    errx(70, "Connection got error: %s", v2);
  }
  fprintf(__stderrp, "Reply: %s\n", v2);
}

void sub_100005FA4(id a1, int a2)
{
  if (!a2)
  {
    fwrite("File Transfer Complete!\n", 0x18uLL, 1uLL, __stderrp);
    exit(0);
  }
  errc(70, a2, "File Transfer Failed");
}

uint64_t sub_100005FEC()
{
  uint64_t connected_socket = remote_service_create_connected_socket();
  uint64_t v1 = connected_socket;
  if (connected_socket != -1)
  {
    int v2 = fcntl(connected_socket, 3, 0);
    fcntl(v1, 4, v2 & 0xFFFFFFFB);
  }
  return v1;
}

void sub_100006048(int a1, int a2, int a3)
{
  id v6 = malloc_type_valloc(0x20000uLL, 0x1227F270uLL);
  int v7 = kqueue();
  if (v7 < 0) {
    sub_10001C234();
  }
  int v8 = v7;
  changelist.ident = a1;
  *(_DWORD *)&changelist.filter = 0x1FFFF;
  memset(&changelist.fflags, 0, 20);
  uint64_t v16 = a3;
  int v17 = 0x1FFFF;
  uint64_t v19 = 0;
  uint64_t v18 = 0;
  int v20 = 0;
  if (kevent(v7, &changelist, 2, 0, 0, 0)) {
    sub_10001C2A4();
  }
  while (1)
  {
    do
    {
      while (1)
      {
        timeuuid_string_t out = (timespec)xmmword_10001E5F0;
        int v9 = kevent(v8, 0, 0, &changelist, 1, &timeout);
        if ((v9 & 0x80000000) == 0) {
          break;
        }
        if (*__error() != 4) {
          sub_10001C250();
        }
      }
    }
    while (!v9);
    if (!changelist.data && (__int16)changelist.flags < 0) {
      break;
    }
    if (changelist.data >= 0x20000uLL) {
      intptr_t data = 0x20000;
    }
    else {
      intptr_t data = changelist.data;
    }
    ssize_t v11 = read(changelist.ident, v6, data);
    if (v11 < 0) {
      sub_10001C26C();
    }
    size_t v12 = v11;
    if (v11)
    {
      if (LODWORD(changelist.ident) == a1) {
        int v13 = a3;
      }
      else {
        int v13 = a2;
      }
      if (write(v13, v6, v12) < 0) {
        sub_10001C288();
      }
    }
  }
  close(v8);
  close(a1);
  if (a2 != a1) {
    close(a2);
  }
  close(a3);
  free(v6);
}

uint64_t sub_100006200(char *const *a1, uint64_t a2)
{
  memset(__b, 170, sizeof(__b));
  uint32_t bufsize = 1024;
  _NSGetExecutablePath(__b, &bufsize);
  posix_spawn_file_actions_t v13 = (posix_spawn_file_actions_t)0xAAAAAAAAAAAAAAAALL;
  if (posix_spawn_file_actions_init(&v13)) {
    sub_10001C5D4(&v12, v15);
  }
  uint64_t v4 = 0;
  char v5 = 1;
  do
  {
    char v6 = v5;
    if (posix_spawn_file_actions_addinherit_np(&v13, *(_DWORD *)(a2 + 4 * v4))) {
      sub_10001C568(&v12, v15);
    }
    char v5 = 0;
    uint64_t v4 = 1;
  }
  while ((v6 & 1) != 0);
  int v7 = open("/dev/null", 2);
  if (v7 != -1)
  {
    if (posix_spawn_file_actions_adddup2(&v13, v7, 0)) {
      sub_10001C4FC(&v12, v15);
    }
    if (posix_spawn_file_actions_adddup2(&v13, v7, 1)) {
      sub_10001C490(&v12, v15);
    }
    if (posix_spawn_file_actions_adddup2(&v13, v7, 2)) {
      sub_10001C424(&v12, v15);
    }
  }
  posix_spawnattr_t v12 = (posix_spawnattr_t)0xAAAAAAAAAAAAAAAALL;
  if (posix_spawnattr_init(&v12)) {
    sub_10001C3B8(&v11, v15);
  }
  if (posix_spawnattr_setflags(&v12, 2)) {
    sub_10001C34C(&v11, v15);
  }
  if (posix_spawnattr_setflags(&v12, 0x4000)) {
    sub_10001C2E0(&v11, v15);
  }
  v15[0] = -1;
  int v8 = _NSGetEnviron();
  int v9 = posix_spawn(v15, __b, &v13, &v12, a1, *v8);
  if (v9) {
    sub_10001C2C0(v9);
  }
  posix_spawn_file_actions_destroy(&v13);
  uint64_t result = posix_spawnattr_destroy(&v12);
  if (v7 != -1) {
    return close(v7);
  }
  return result;
}

void sub_10000641C(uint64_t a1)
{
  uint64_t v1 = *(NSObject **)(a1 + 32);
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "parent exited, exiting", v2, 2u);
  }
  exit(1);
}

void sub_100006474(id a1, BOOL a2)
{
  BOOL v2 = a2;
  BOOL v3 = "failure";
  if (a2) {
    BOOL v3 = "success";
  }
  fprintf(__stderrp, "Heartbeat %s\n", v3);
  exit(!v2);
}

uint64_t sub_1000064C8(uint64_t a1, int a2)
{
  int v4 = fcntl(a2, 3, 0);
  fcntl(a2, 4, v4 & 0xFFFFFFFB);
  posix_spawn_file_actions_t v23 = (posix_spawn_file_actions_t)0xAAAAAAAAAAAAAAAALL;
  if (posix_spawn_file_actions_init(&v23)) {
    sub_10001C5D4(&v22, buf);
  }
  int v5 = *(_DWORD *)(a1 + 72);
  if (v5 == -1)
  {
    if (posix_spawn_file_actions_adddup2(&v23, a2, 0)) {
      sub_10001C87C(&v22, buf);
    }
    if (posix_spawn_file_actions_adddup2(&v23, a2, 1)) {
      sub_10001C810(&v22, buf);
    }
  }
  else if (posix_spawn_file_actions_adddup2(&v23, a2, v5))
  {
    sub_10001C8E8(&v22, buf);
  }
  posix_spawnattr_t v22 = (posix_spawnattr_t)0xAAAAAAAAAAAAAAAALL;
  if (posix_spawnattr_init(&v22)) {
    sub_10001C3B8(&v21, buf);
  }
  if (posix_spawnattr_setflags(&v22, 2)) {
    sub_10001C34C(&v21, buf);
  }
  if (posix_spawnattr_setflags(&v22, 0x4000)) {
    sub_10001C2E0(&v21, buf);
  }
  if (posix_spawnattr_setflags(&v22, 12)) {
    sub_10001C7A4(&v21, buf);
  }
  sigset_t v19 = 0;
  sigset_t v20 = -1;
  if (posix_spawnattr_setsigdefault(&v22, &v20)) {
    sub_10001C738(&v21, buf);
  }
  if (posix_spawnattr_setsigmask(&v22, &v19)) {
    sub_10001C6CC(&v21, buf);
  }
  LODWORD(v21) = -1;
  char v6 = *(char *const **)(a1 + 56);
  int v7 = *v6;
  int v8 = _NSGetEnviron();
  int v9 = posix_spawn((pid_t *)&v21, v7, &v23, &v22, v6, *v8);
  uint64_t v10 = *(NSObject **)(a1 + 32);
  if (v9)
  {
    int v11 = v9;
    if (os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR)) {
      sub_10001C640(a1, v11, v10);
    }
  }
  else
  {
    if (os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = *(void *)(a1 + 64);
      *(_DWORD *)buf = 136446466;
      uint64_t v25 = v12;
      __int16 v26 = 1024;
      int v27 = v21;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}s: Accepted service, started pid %d", buf, 0x12u);
    }
    uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v14 = *(void *)(v13 + 24);
    if (!v14)
    {
      uint64_t v15 = os_transaction_create();
      uint64_t v16 = *(void *)(*(void *)(a1 + 48) + 8);
      int v17 = *(void **)(v16 + 40);
      *(void *)(v16 + 40) = v15;

      uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
      uint64_t v14 = *(void *)(v13 + 24);
    }
    *(void *)(v13 + 24) = v14 + 1;
  }
  close(a2);
  posix_spawn_file_actions_destroy(&v23);
  return posix_spawnattr_destroy(&v22);
}

int *sub_1000067BC(void *a1)
{
  int v9 = 0;
  do
  {
    while (1)
    {
      uint64_t result = (int *)wait3(&v9, 1, 0);
      if (result == -1) {
        break;
      }
      int v3 = (int)result;
      if (!result) {
        return result;
      }
      int v4 = a1[4];
      if ((v9 & 0x7F) != 0)
      {
        if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109376;
          int v11 = v3;
          __int16 v12 = 1024;
          int v13 = v9 & 0x7F;
          _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Reaped child %d, terminated with signal %d", buf, 0xEu);
        }
      }
      else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        int v11 = v3;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Reaped child %d, exited normally", buf, 8u);
      }
      uint64_t v5 = *(void *)(a1[5] + 8);
      uint64_t v6 = *(void *)(v5 + 24);
      if (v6)
      {
        *(void *)(v5 + 24) = v6 - 1;
        if (*(void *)(*(void *)(a1[5] + 8) + 24)) {
          continue;
        }
      }
      uint64_t v7 = *(void *)(a1[6] + 8);
      int v8 = *(void **)(v7 + 40);
      *(void *)(v7 + 40) = 0;
    }
    uint64_t result = __error();
  }
  while (*result == 4);
  return result;
}

uint64_t sub_100006964()
{
  if (remote_compute_platform_tls_required()) {
    exit(1);
  }
  return printf("TLS is currently %s for the compute platform\n", "not required");
}

uint64_t sub_1000069C4(unsigned int *a1)
{
  uint64_t result = *a1;
  if (result != -1)
  {
    uint64_t result = close(result);
    if (result == -1) {
      sub_10001C954(&v2, v3);
    }
  }
  return result;
}

double sub_100006A30(void *a1, _OWORD *a2)
{
  *a1 = 0;
  double result = 0.0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  return result;
}

uint64_t sub_100006A54()
{
  return _os_log_send_and_compose_impl();
}

double sub_100006A98(void *a1, _OWORD *a2)
{
  *a1 = 0;
  double result = 0.0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  return result;
}

uint64_t sub_100006AB0()
{
  return _os_log_send_and_compose_impl();
}

BOOL sub_100006AE8()
{
  return os_log_type_enabled(v0, OS_LOG_TYPE_ERROR);
}

uint64_t sub_100006B00()
{
  return _os_crash_msg();
}

uint64_t sub_100006B18()
{
  return _os_crash_msg();
}

BOOL sub_100006B30()
{
  return os_log_type_enabled(v0, OS_LOG_TYPE_ERROR);
}

uint64_t sub_100006B48(uint64_t a1, uint64_t a2, uint64_t a3, uid_t a4, gid_t a5, int a6, int a7)
{
  LODWORD(v255) = a7;
  int v226 = a6;
  gid_t v230 = a5;
  uid_t v229 = a4;
  uint64_t v264 = a3;
  uint64_t v262 = a2;
  uint64_t v263 = a1;
  uint64_t v218 = type metadata accessor for DispatchTime();
  uint64_t v217 = *(void *)(v218 - 8);
  __chkstk_darwin(v218);
  v216 = (char *)&v211 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v228 = type metadata accessor for String.Encoding();
  uint64_t v227 = *(void *)(v228 - 8);
  __chkstk_darwin(v228);
  v225 = (char *)&v211 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v243 = type metadata accessor for DispatchWorkItemFlags();
  *(void *)&long long v242 = *(void *)(v243 - 8);
  __chkstk_darwin(v243);
  v240 = (char *)&v211 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v241 = type metadata accessor for DispatchQoS();
  uint64_t v239 = *(void *)(v241 - 8);
  __chkstk_darwin(v241);
  v238 = (char *)&v211 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v237 = type metadata accessor for DispatchTimeInterval();
  uint64_t v236 = *(void *)(v237 - 8);
  __chkstk_darwin(v237);
  v235 = (os_log_t *)((char *)&v211 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v12 = type metadata accessor for IPv6Address();
  uint64_t v261 = *(void *)(v12 - 8);
  uint64_t v13 = __chkstk_darwin(v12);
  v224 = (char *)&v211 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __chkstk_darwin(v13);
  v221 = (char *)&v211 - v16;
  uint64_t v17 = __chkstk_darwin(v15);
  v234 = (char *)&v211 - v18;
  uint64_t v19 = __chkstk_darwin(v17);
  v233 = (char *)&v211 - v20;
  uint64_t v21 = __chkstk_darwin(v19);
  posix_spawn_file_actions_t v23 = (char *)&v211 - v22;
  __chkstk_darwin(v21);
  uint64_t v25 = (char *)&v211 - v24;
  uint64_t v26 = type metadata accessor for NWEndpoint.Port();
  uint64_t v27 = *(void *)(v26 - 8);
  uint64_t v28 = __chkstk_darwin(v26);
  v222 = (char *)&v211 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v30 = __chkstk_darwin(v28);
  v232 = (char *)&v211 - v31;
  __chkstk_darwin(v30);
  long long v33 = (char *)&v211 - v32;
  uint64_t v34 = type metadata accessor for Logger();
  long long v35 = *(void **)(v34 - 8);
  uint64_t v36 = __chkstk_darwin(v34);
  v215 = (char *)&v211 - ((v37 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v38 = __chkstk_darwin(v36);
  v214 = (char *)&v211 - v39;
  uint64_t v40 = __chkstk_darwin(v38);
  v219 = (char *)&v211 - v41;
  uint64_t v42 = __chkstk_darwin(v40);
  v223 = (char *)&v211 - v43;
  uint64_t v44 = __chkstk_darwin(v42);
  v254 = (char *)&v211 - v45;
  uint64_t v46 = __chkstk_darwin(v44);
  v252 = (char *)&v211 - v47;
  __chkstk_darwin(v46);
  v49 = (char *)&v211 - v48;
  uint64_t v50 = sub_10000E1B0();
  v253 = v35;
  v51 = (void (*)(char *, uint64_t, uint64_t))v35[2];
  uint64_t v258 = v50;
  uint64_t v251 = v34;
  v260 = v35 + 2;
  v259 = v51;
  ((void (*)(char *))v51)(v49);
  uint64_t v245 = v27;
  v52 = *(void (**)(char *, uint64_t, uint64_t))(v27 + 16);
  uint64_t v250 = v27 + 16;
  v249 = v52;
  v52(v33, v263, v26);
  v53 = *(void (**)(char *, uint64_t, uint64_t))(v261 + 16);
  v231 = (void (*)(void, void))v25;
  uint64_t v54 = v261 + 16;
  v53(v25, v264, v12);
  v257 = (void (*)(void, void))v23;
  uint64_t v246 = v12;
  v247 = v53;
  v53(v23, v262, v12);
  v55 = Logger.logObject.getter();
  os_log_type_t v56 = static os_log_type_t.info.getter();
  int v57 = v56;
  BOOL v58 = os_log_type_enabled(v55, v56);
  uint64_t v256 = v26;
  uint64_t v248 = v54;
  if (v58)
  {
    uint64_t v59 = swift_slowAlloc();
    uint64_t v213 = swift_slowAlloc();
    uint64_t aBlock = v213;
    *(_DWORD *)uint64_t v59 = 33555202;
    int v212 = v57;
    __int16 v60 = NWEndpoint.Port.rawValue.getter();
    v220 = *(void (**)(char *, uint64_t))(v245 + 8);
    v220(v33, v26);
    LOWORD(v271) = v60;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v59 + 6) = 2080;
    os_log_t v211 = v55;
    v61 = v231;
    uint64_t v62 = IPv6Address.debugDescription.getter();
    uint64_t v271 = sub_1000094CC(v62, v63, &aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    v64 = *(void (**)(void, uint64_t))(v261 + 8);
    v65 = v61;
    uint64_t v66 = v246;
    v64(v65, v246);
    *(_WORD *)(v59 + 16) = 2080;
    v67 = v257;
    uint64_t v68 = IPv6Address.debugDescription.getter();
    uint64_t v271 = sub_1000094CC(v68, v69, &aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    v231 = v64;
    v64(v67, v66);
    os_log_t v70 = v211;
    _os_log_impl((void *)&_mh_execute_header, v211, (os_log_type_t)v212, "SSH tunnel privileged helper started. Will listen on %hu and attempt to create a utun from %s -> %s", (uint8_t *)v59, 0x1Au);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    v71 = v253;
    uint64_t v72 = v251;
    v257 = (void (*)(void, void))v253[1];
    v257(v49, v251);
    uint64_t v73 = v66;
  }
  else
  {
    v220 = *(void (**)(char *, uint64_t))(v245 + 8);
    v220(v33, v26);
    v74 = *(void (**)(void, uint64_t))(v261 + 8);
    uint64_t v75 = v246;
    v74(v231, v246);
    v231 = v74;
    v74(v257, v75);

    v71 = v253;
    uint64_t v72 = v251;
    v257 = (void (*)(void, void))v253[1];
    v257(v49, v251);
    uint64_t v73 = v75;
  }
  int v76 = (int)v255;
  int v77 = tcsetpgrp(0, (pid_t)v255);
  uint64_t v78 = v264;
  v79 = v254;
  if (v77)
  {
    v259(v252, v258, v72);
    v80 = Logger.logObject.getter();
    os_log_type_t v81 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v80, v81))
    {
      uint64_t v82 = swift_slowAlloc();
      v83 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v82 = 67109378;
      LODWORD(aBlock) = v76;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *(_WORD *)(v82 + 8) = 2112;
      int v84 = errno.getter();
      sub_100009B90();
      swift_allocError();
      _DWORD *v85 = v84;
      uint64_t v86 = _swift_stdlib_bridgeErrorToNSError();
      uint64_t aBlock = v86;
      v71 = v253;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      void *v83 = v86;
      int v76 = (int)v255;
      v79 = v254;
      _os_log_impl((void *)&_mh_execute_header, v80, v81, "Failed returning foreground to remotectl at %d: %@", (uint8_t *)v82, 0x12u);
      sub_100008E28(&qword_100028D90);
      swift_arrayDestroy();
      uint64_t v78 = v264;
      swift_slowDealloc();
      swift_slowDealloc();
    }

    v257(v252, v72);
  }
  v259(v79, v258, v72);
  v87 = Logger.logObject.getter();
  os_log_type_t v88 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v87, v88))
  {
    v89 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v89 = 67109120;
    uint64_t v78 = v264;
    LODWORD(aBlock) = v76;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v87, v88, "SSH tunnel privileged helper returned foreground to %d", v89, 8u);
    swift_slowDealloc();
  }

  v255 = v71 + 1;
  v257(v79, v72);
  type metadata accessor for TCPPacketTunnelServer();
  uint64_t v90 = (uint64_t)v232;
  v249(v232, v263, v256);
  uint64_t v91 = (uint64_t)v233;
  v92 = v247;
  v247(v233, v78, v73);
  uint64_t v93 = (uint64_t)v234;
  v92(v234, v262, v73);
  v94 = sub_10000E0B8();
  uint64_t v95 = (uint64_t)v235;
  void *v235 = *v94;
  (*(void (**)(uint64_t, void, uint64_t))(v236 + 104))(v95, enum case for DispatchTimeInterval.seconds(_:), v237);
  uint64_t v96 = sub_10000AAEC(v90, v91, v93, v95);
  v97 = (void (__cdecl *)(int))SIG_IGN.getter();
  signal(2, v97);
  sub_100008AE8(0, (unint64_t *)&qword_100028D80);
  sub_100008AE8(0, (unint64_t *)&qword_1000289B0);
  v98 = (void *)static OS_dispatch_queue.main.getter();
  uint64_t v99 = static OS_dispatch_source.makeSignalSource(signal:queue:)();

  swift_getObjectType();
  v269 = sub_100008D14;
  uint64_t v270 = v96;
  uint64_t aBlock = (uint64_t)_NSConcreteStackBlock;
  unint64_t v266 = 1107296256;
  v267 = sub_100008D1C;
  v268 = &unk_100025518;
  v100 = _Block_copy(&aBlock);
  swift_retain();
  v101 = v238;
  static DispatchQoS.unspecified.getter();
  v102 = v240;
  sub_100008D78();
  OS_dispatch_source.setEventHandler(qos:flags:handler:)();
  _Block_release(v100);
  (*(void (**)(char *, uint64_t))(v242 + 8))(v102, v243);
  (*(void (**)(char *, uint64_t))(v239 + 8))(v101, v241);
  swift_release();
  OS_dispatch_source.activate()();
  uint64_t v103 = v244;
  (*(void (**)(void))(*(void *)v96 + 184))();
  if (v103) {
    goto LABEL_27;
  }
  v254 = (char *)v96;
  v253 = v94;
  uint64_t v104 = v256;
  if (setgid(v230) == -1)
  {
    uint64_t aBlock = 0;
    unint64_t v266 = 0xE000000000000000;
    _StringGuts.grow(_:)(21);
    swift_bridgeObjectRelease();
    v161 = "Could not set gid: ";
LABEL_26:
    uint64_t aBlock = 0xD000000000000013;
    unint64_t v266 = (unint64_t)(v161 - 32) | 0x8000000000000000;
    errno.getter();
    v162._countAndFlagsBits = Errno.description.getter();
    String.append(_:)(v162);
    swift_bridgeObjectRelease();
    uint64_t v163 = aBlock;
    unint64_t v164 = v266;
    sub_100008FE0();
    swift_allocError();
    uint64_t *v165 = v163;
    v165[1] = v164;
    swift_willThrow();
LABEL_27:
    swift_release();
    return swift_unknownObjectRelease();
  }
  if (setuid(v229) == -1)
  {
    uint64_t aBlock = 0;
    unint64_t v266 = 0xE000000000000000;
    _StringGuts.grow(_:)(21);
    swift_bridgeObjectRelease();
    v161 = "Could not set uid: ";
    goto LABEL_26;
  }
  uint64_t v244 = 0;
  v252 = (char *)v99;
  id v105 = [self defaultManager];
  uint64_t aBlock = 0;
  unint64_t v266 = 0xE000000000000000;
  _StringGuts.grow(_:)(30);
  swift_bridgeObjectRelease();
  uint64_t aBlock = 0x6D65722F706D742FLL;
  unint64_t v266 = 0xEF2E6C746365746FLL;
  int v106 = v226;
  LODWORD(v271) = v226;
  v107._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v107);
  swift_bridgeObjectRelease();
  v108._countAndFlagsBits = 0x2D7265706C65682ELL;
  v108._object = (void *)0xED00007964616572;
  String.append(_:)(v108);
  NSString v109 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  LODWORD(v271) = v106;
  uint64_t aBlock = dispatch thunk of CustomStringConvertible.description.getter();
  unint64_t v266 = v110;
  v111._countAndFlagsBits = 0x594441455220;
  v111._object = (void *)0xE600000000000000;
  String.append(_:)(v111);
  v112 = v225;
  static String.Encoding.utf8.getter();
  uint64_t v113 = String.data(using:allowLossyConversion:)();
  unint64_t v115 = v114;
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v227 + 8))(v112, v228);
  Class isa = 0;
  if (v115 >> 60 != 15)
  {
    Class isa = Data._bridgeToObjectiveC()().super.isa;
    sub_100009B24(v113, v115);
  }
  sub_100008E28(&qword_1000289B8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_10001E620;
  uint64_t v118 = v229;
  *(void *)(inited + 32) = NSFileOwnerAccountID;
  *(void *)(inited + 40) = v118;
  *(void *)(inited + 64) = &type metadata for Int;
  *(void *)(inited + 72) = NSFileGroupOwnerAccountID;
  *(void *)(inited + 80) = v230;
  *(void *)(inited + 104) = &type metadata for Int;
  *(void *)(inited + 112) = NSFilePosixPermissions;
  *(void *)(inited + 144) = &type metadata for Int;
  *(void *)(inited + 120) = 438;
  v119 = NSFileOwnerAccountID;
  v120 = NSFileGroupOwnerAccountID;
  v121 = NSFilePosixPermissions;
  sub_100008E6C(inited);
  type metadata accessor for FileAttributeKey();
  sub_100009FF0(&qword_1000289C0, (void (*)(uint64_t))type metadata accessor for FileAttributeKey);
  Class v122 = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  LODWORD(inited) = [v105 createFileAtPath:v109 contents:isa attributes:v122];

  if (!inited)
  {
    sub_100008FE0();
    swift_allocError();
    void *v167 = 0xD000000000000026;
    v167[1] = 0x8000000100020330;
    swift_willThrow();
    swift_release();
    return swift_unknownObjectRelease();
  }
  uint64_t v123 = (*(uint64_t (**)(void))(*(void *)v254 + 168))();
  if (v124) {
    uint64_t v125 = v123;
  }
  else {
    uint64_t v125 = 1853191285;
  }
  if (v124) {
    v126 = v124;
  }
  else {
    v126 = (void *)0xE400000000000000;
  }
  uint64_t v241 = sub_100008E28(&qword_1000289D0);
  uint64_t v127 = swift_allocObject();
  long long v242 = xmmword_10001E630;
  *(_OWORD *)(v127 + 16) = xmmword_10001E630;
  uint64_t aBlock = 0;
  unint64_t v266 = 0xE000000000000000;
  _StringGuts.grow(_:)(69);
  v128._countAndFlagsBits = 0xD00000000000001DLL;
  v128._object = (void *)0x8000000100020360;
  String.append(_:)(v128);
  uint64_t v243 = v125;
  v129._countAndFlagsBits = v125;
  v129._object = v126;
  String.append(_:)(v129);
  v130._countAndFlagsBits = 0x206D6F726620;
  v130._object = (void *)0xE600000000000000;
  String.append(_:)(v130);
  uint64_t v131 = v264;
  v132._countAndFlagsBits = IPv6Address.debugDescription.getter();
  String.append(_:)(v132);
  swift_bridgeObjectRelease();
  v133._countAndFlagsBits = 540945696;
  v133._object = (void *)0xE400000000000000;
  String.append(_:)(v133);
  uint64_t v134 = v262;
  v135._countAndFlagsBits = IPv6Address.debugDescription.getter();
  String.append(_:)(v135);
  swift_bridgeObjectRelease();
  v136._countAndFlagsBits = 0xD000000000000018;
  v136._object = (void *)0x8000000100020380;
  String.append(_:)(v136);
  uint64_t v137 = aBlock;
  unint64_t v138 = v266;
  *(void *)(v127 + 56) = &type metadata for String;
  *(void *)(v127 + 32) = v137;
  *(void *)(v127 + 40) = v138;
  print(_:separator:terminator:)();
  swift_bridgeObjectRelease();
  v139 = v223;
  uint64_t v140 = v251;
  v259(v223, v258, v251);
  v141 = v221;
  uint64_t v142 = v131;
  uint64_t v143 = v246;
  v144 = v247;
  v247(v221, v142, v246);
  v144(v224, v134, v143);
  v145 = v222;
  v249(v222, v263, v104);
  swift_bridgeObjectRetain();
  v146 = Logger.logObject.getter();
  os_log_type_t v147 = static os_log_type_t.info.getter();
  int v148 = v147;
  if (os_log_type_enabled(v146, v147))
  {
    uint64_t v149 = swift_slowAlloc();
    LODWORD(v264) = v148;
    uint64_t v150 = v149;
    uint64_t v263 = swift_slowAlloc();
    uint64_t aBlock = v263;
    *(_DWORD *)uint64_t v150 = 136315906;
    swift_bridgeObjectRetain();
    uint64_t v271 = sub_1000094CC(v243, (unint64_t)v126, &aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v150 + 12) = 2080;
    uint64_t v151 = IPv6Address.debugDescription.getter();
    uint64_t v271 = sub_1000094CC(v151, v152, &aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    v153 = (void (*)(char *, uint64_t))v231;
    v231(v141, v143);
    *(_WORD *)(v150 + 22) = 2080;
    v154 = v224;
    uint64_t v155 = IPv6Address.debugDescription.getter();
    uint64_t v271 = sub_1000094CC(v155, v156, &aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    v153(v154, v143);
    *(_WORD *)(v150 + 32) = 512;
    v157 = v222;
    __int16 v158 = NWEndpoint.Port.rawValue.getter();
    v220(v157, v256);
    LOWORD(v271) = v158;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v146, (os_log_type_t)v264, "SSH tunnel privileged helper created %s from %s -> %s and is listening for a tunnel connection on ::1:%hu.", (uint8_t *)v150, 0x24u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    v159 = v223;
    uint64_t v160 = v251;
  }
  else
  {
    v220(v145, v104);
    swift_bridgeObjectRelease_n();
    v168 = (void (*)(char *, uint64_t))v231;
    v231(v141, v143);
    v168(v224, v143);

    v159 = v139;
    uint64_t v160 = v140;
  }
  uint64_t v169 = ((uint64_t (*)(char *, uint64_t))v257)(v159, v160);
  uint64_t v170 = 0;
  v171 = v254;
  v172 = *(uint64_t (**)(uint64_t))(*(void *)v254 + 144);
  v173 = v253;
  do
  {
    uint64_t v169 = v172(v169);
    uint64_t v175 = v174;
    unint64_t v177 = v176;
    if (v176 >> 62) {
      goto LABEL_38;
    }
    swift_release();
    swift_release();
    uint64_t result = swift_release();
    if (__OFADD__(*v173, 5))
    {
      __break(1u);
      return result;
    }
    if (*v173 + 5 < v170)
    {
      (*(void (**)(uint64_t))(*(void *)v171 + 192))(result);
      v198 = v219;
      uint64_t v199 = v251;
      v259(v219, v258, v251);
      v200 = Logger.logObject.getter();
      os_log_type_t v201 = static os_log_type_t.fault.getter();
      if (os_log_type_enabled(v200, v201))
      {
        v202 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)v202 = 134217984;
        uint64_t aBlock = *v173;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        _os_log_impl((void *)&_mh_execute_header, v200, v201, "SSH tunnel privileged helper waited longer than TCPPacketTunnelServer's timeout (%ld) for a connection.", v202, 0xCu);
        uint64_t v199 = v251;
        swift_slowDealloc();
      }

      v257(v198, v199);
      sub_100008FE0();
      swift_allocError();
      unint64_t v204 = 0xD00000000000002FLL;
      v205 = "remotectl ssh-tunnel out waiting for connection";
      goto LABEL_52;
    }
    uint64_t v169 = sleep(1u);
  }
  while (!__OFADD__(v170++, 1));
  __break(1u);
LABEL_38:
  uint64_t v179 = sub_100009034(v169, v175, v177);
  v172(v179);
  uint64_t v182 = v181;
  if (!(v180 >> 62))
  {
    swift_release();
    swift_release();
    swift_release();
    v206 = v214;
    uint64_t v207 = v251;
    v259(v214, v258, v251);
    v208 = Logger.logObject.getter();
    os_log_type_t v209 = static os_log_type_t.fault.getter();
    if (os_log_type_enabled(v208, v209))
    {
      v210 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v210 = 0;
      _os_log_impl((void *)&_mh_execute_header, v208, v209, "SSH tunnel privileged helper still listening after wait loop.", v210, 2u);
      uint64_t v207 = v251;
      swift_slowDealloc();
    }

    v257(v206, v207);
    goto LABEL_51;
  }
  if (v180 >> 62 != 1)
  {
LABEL_51:
    sub_100008FE0();
    swift_allocError();
    unint64_t v204 = 0xD000000000000027;
    v205 = "remotectl ssh-tunnel failed to connect.";
LABEL_52:
    unint64_t *v203 = v204;
    v203[1] = (unint64_t)(v205 - 32) | 0x8000000000000000;
    swift_willThrow();
    swift_unknownObjectRelease();
    return swift_release();
  }
  swift_release();
  swift_release();
  uint64_t v183 = swift_allocObject();
  *(_OWORD *)(v183 + 16) = v242;
  uint64_t aBlock = 0;
  unint64_t v266 = 0xE000000000000000;
  _StringGuts.grow(_:)(72);
  v184._countAndFlagsBits = 0xD000000000000020;
  v184._object = (void *)0x80000001000203A0;
  String.append(_:)(v184);
  uint64_t v185 = (*(uint64_t (**)(void))(*(void *)v182 + 176))();
  if (v186)
  {
    unint64_t v187 = v186;
  }
  else
  {
    uint64_t v185 = 1853191285;
    unint64_t v187 = 0xE400000000000000;
  }
  unint64_t v188 = v187;
  String.append(_:)(*(Swift::String *)&v185);
  swift_bridgeObjectRelease();
  v189._countAndFlagsBits = 0xD000000000000026;
  v189._object = (void *)0x80000001000203D0;
  String.append(_:)(v189);
  uint64_t v190 = aBlock;
  unint64_t v191 = v266;
  *(void *)(v183 + 56) = &type metadata for String;
  *(void *)(v183 + 32) = v190;
  *(void *)(v183 + 40) = v191;
  print(_:separator:terminator:)();
  swift_bridgeObjectRelease();
  v192 = v216;
  j___s8Dispatch0A4TimeV13distantFutureACvgZ();
  (*(void (**)(char *))(*(void *)v171 + 200))(v192);
  (*(void (**)(char *, uint64_t))(v217 + 8))(v192, v218);
  uint64_t v193 = swift_allocObject();
  *(_OWORD *)(v193 + 16) = v242;
  *(void *)(v193 + 56) = &type metadata for String;
  *(void *)(v193 + 32) = 0xD000000000000010;
  *(void *)(v193 + 40) = 0x8000000100020400;
  print(_:separator:terminator:)();
  swift_bridgeObjectRelease();
  v194 = v215;
  v259(v215, v258, v251);
  v195 = Logger.logObject.getter();
  os_log_type_t v196 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v195, v196))
  {
    v197 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v197 = 0;
    _os_log_impl((void *)&_mh_execute_header, v195, v196, "SSH tunnel privileged server disconnected. Exiting...", v197, 2u);
    swift_slowDealloc();
    swift_release();
    swift_unknownObjectRelease();
  }
  else
  {

    swift_release();
    swift_unknownObjectRelease();
  }
  swift_release();
  return ((uint64_t (*)(char *, uint64_t))v257)(v194, v251);
}

uint64_t sub_100008AE8(uint64_t a1, unint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2)
  {
    self;
    uint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

uint64_t sub_100008B24(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for Logger();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10000E1B0();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
  uint64_t v7 = Logger.logObject.getter();
  os_log_type_t v8 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "SSH tunnel privileged helper received SIGINT, shutting down server...", v9, 2u);
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  sub_100008E28(&qword_1000289D0);
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_10001E630;
  *(void *)(v10 + 56) = &type metadata for String;
  *(void *)(v10 + 32) = 0xD000000000000017;
  *(void *)(v10 + 40) = 0x8000000100020700;
  print(_:separator:terminator:)();
  uint64_t v11 = swift_bridgeObjectRelease();
  return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 192))(v11);
}

uint64_t sub_100008D14()
{
  return sub_100008B24(v0);
}

uint64_t sub_100008D1C(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

uint64_t sub_100008D60(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100008D70()
{
  return swift_release();
}

uint64_t sub_100008D78()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t sub_100008E28(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_100008E6C(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100008E28(&qword_100028A10);
  uint64_t v2 = static _DictionaryStorage.allocate(capacity:)();
  uint64_t v3 = (void *)v2;
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  uint64_t v5 = v2 + 64;
  uint64_t v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_100009E00(v6, (uint64_t)&v13);
    uint64_t v7 = v13;
    unint64_t result = sub_100009D6C(v13);
    if (v9) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(void *)(v3[6] + 8 * result) = v7;
    unint64_t result = (unint64_t)sub_100009E68(&v14, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v10 = v3[2];
    BOOL v11 = __OFADD__(v10, 1);
    uint64_t v12 = v10 + 1;
    if (v11) {
      goto LABEL_11;
    }
    v3[2] = v12;
    v6 += 40;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

void type metadata accessor for FileAttributeKey()
{
  if (!qword_1000289E0)
  {
    ForeignTypeMetaintptr_t data = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_1000289E0);
    }
  }
}

unint64_t sub_100008FE0()
{
  unint64_t result = qword_1000289C8;
  if (!qword_1000289C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000289C8);
  }
  return result;
}

uint64_t sub_100009034(uint64_t a1, uint64_t a2, unint64_t a3)
{
  if ((a3 >> 62) <= 1)
  {
    swift_release();
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_100009098(uint64_t a1, uint64_t a2)
{
  return sub_100009204(a1, a2, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

uint64_t sub_1000090B0(uint64_t a1, id *a2)
{
  uint64_t result = static String._forceBridgeFromObjectiveC(_:result:)();
  *a2 = 0;
  return result;
}

uint64_t sub_100009128(uint64_t a1, id *a2)
{
  char v3 = static String._conditionallyBridgeFromObjectiveC(_:result:)();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_1000091A8@<X0>(void *a1@<X8>)
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  NSString v2 = String._bridgeToObjectiveC()();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_1000091EC(uint64_t a1, uint64_t a2)
{
  return sub_100009204(a1, a2, (uint64_t (*)(uint64_t))&String.hashValue.getter);
}

uint64_t sub_100009204(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_100009248()
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  String.hash(into:)();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_10000929C()
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v0 = Hasher._finalize()();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_100009310()
{
  uint64_t v0 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v2 = v1;
  if (v0 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = _stringCompareWithSmolCheck(_:_:expecting:)();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_10000939C@<X0>(void *a1@<X8>)
{
  NSString v2 = String._bridgeToObjectiveC()();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_1000093E4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_100009410(uint64_t a1)
{
  uint64_t v2 = sub_100009FF0(&qword_1000289C0, (void (*)(uint64_t))type metadata accessor for FileAttributeKey);
  uint64_t v3 = sub_100009FF0(&qword_100028A00, (void (*)(uint64_t))type metadata accessor for FileAttributeKey);

  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_1000094CC(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_1000095A0(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_100009D0C((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = &type metadata for _StringGuts;
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_100009D0C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_100009CBC((uint64_t)v12);
  return v7;
}

uint64_t sub_1000095A0(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        uint64_t v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (void *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            UnsafeMutableRawBufferPointer.subscript.setter();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_10000975C(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0) {
    goto LABEL_13;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  uint64_t v8 = _StringObject.sharedUTF8.getter();
  if (!v8)
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
LABEL_17:
    uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

uint64_t sub_10000975C(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_1000097F4(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_1000099D4(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_1000099D4(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_1000097F4(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0) {
    goto LABEL_10;
  }
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v2 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v2)
  {
    while (1)
    {
      unint64_t v3 = sub_10000996C(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = _StringGuts.copyUTF8(into:)();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
LABEL_10:
      uint64_t v2 = String.UTF8View._foreignCount()();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    _fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_10000996C(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return &_swiftEmptyArrayStorage;
  }
  sub_100008E28(&qword_100028A08);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_1000099D4(char a1, int64_t a2, char a3, char *a4)
{
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    sub_100008E28(&qword_100028A08);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_100009B24(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_100009B38(a1, a2);
  }
  return a1;
}

uint64_t sub_100009B38(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_release();
  }

  return swift_release();
}

unint64_t sub_100009B90()
{
  unint64_t result = qword_1000289D8;
  if (!qword_1000289D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000289D8);
  }
  return result;
}

uint64_t sub_100009BE4()
{
  return sub_100009FF0(&qword_1000289E8, (void (*)(uint64_t))type metadata accessor for FileAttributeKey);
}

uint64_t sub_100009C2C()
{
  return sub_100009FF0(&qword_1000289F0, (void (*)(uint64_t))type metadata accessor for FileAttributeKey);
}

uint64_t sub_100009C74()
{
  return sub_100009FF0(&qword_1000289F8, (void (*)(uint64_t))type metadata accessor for FileAttributeKey);
}

uint64_t sub_100009CBC(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_100009D0C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_100009D6C(uint64_t a1)
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v2 = Hasher._finalize()();
  swift_bridgeObjectRelease();

  return sub_100009E78(a1, v2);
}

uint64_t sub_100009E00(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100008E28(&qword_100028A18);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

_OWORD *sub_100009E68(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

unint64_t sub_100009E78(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v5 = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
  {
    uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v8 = v7;
    if (v6 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    char v11 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v11 & 1) == 0)
    {
      uint64_t v12 = ~v4;
      unint64_t v5 = (v5 + 1) & v12;
      if ((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
      {
        while (1)
        {
          uint64_t v13 = static String._unconditionallyBridgeFromObjectiveC(_:)();
          uint64_t v15 = v14;
          if (v13 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v15 == v16) {
            break;
          }
          char v18 = _stringCompareWithSmolCheck(_:_:expecting:)();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v18 & 1) == 0)
          {
            unint64_t v5 = (v5 + 1) & v12;
            if ((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5)) {
              continue;
            }
          }
          return v5;
        }
        goto LABEL_16;
      }
    }
  }
  return v5;
}

uint64_t sub_100009FF0(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_10000A038()
{
  unint64_t result = qword_100028F80;
  if (!qword_100028F80)
  {
    sub_10000A094(&qword_100028A20);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028F80);
  }
  return result;
}

uint64_t sub_10000A094(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_10000A0EC(uint64_t a1, unsigned int a2, uint64_t (*a3)(void))
{
  uint64_t result = a3();
  if (v3)
  {
    if (a1 <= 1) {
      a1 = 1;
    }
    if (a1 == 1)
    {
      return swift_willThrow();
    }
    else
    {
      sleep(a2);
      uint64_t v8 = swift_errorRelease();
      return ((uint64_t (*)(uint64_t))a3)(v8);
    }
  }
  return result;
}

uint64_t sub_10000A184(uint64_t a1, void *a2)
{
  String.utf8CString.getter();
  int v4 = remote_control_enable_network_peer();
  uint64_t result = swift_release();
  if (!v4)
  {
    _StringGuts.grow(_:)(34);
    swift_bridgeObjectRelease();
    v6._countAndFlagsBits = a1;
    v6._object = a2;
    String.append(_:)(v6);
    sub_100008FE0();
    swift_allocError();
    void *v7 = 0xD000000000000020;
    v7[1] = 0x8000000100020720;
    return swift_willThrow();
  }
  return result;
}

uint64_t sub_10000A260()
{
  uint64_t result = remote_control_disable_network_peer();
  if (!result)
  {
    sub_100008FE0();
    swift_allocError();
    void *v1 = 0xD000000000000022;
    v1[1] = 0x8000000100020750;
    return swift_willThrow();
  }
  return result;
}

uint64_t sub_10000A2D0()
{
  IPv6Address.debugDescription.getter();
  String.utf8CString.getter();
  swift_bridgeObjectRelease();
  int v0 = remote_control_connect_network_peer();
  uint64_t result = swift_release();
  if (!v0)
  {
    _StringGuts.grow(_:)(37);
    v2._object = (void *)0x8000000100020780;
    v2._countAndFlagsBits = 0xD000000000000023;
    String.append(_:)(v2);
    type metadata accessor for IPv6Address();
    _print_unlocked<A, B>(_:_:)();
    sub_100008FE0();
    swift_allocError();
    void *v3 = 0;
    v3[1] = 0xE000000000000000;
    return swift_willThrow();
  }
  return result;
}

uint64_t sub_10000A3D0(uint64_t a1, uint64_t a2, unint64_t a3)
{
  if (!(a3 >> 62))
  {
    swift_retain();
    swift_retain();
    _StringGuts.grow(_:)(16);
    v6._object = (void *)0xEA00000000002867;
    v6._countAndFlagsBits = 0x6E696E657473696CLL;
    String.append(_:)(v6);
    type metadata accessor for NWListener();
    _print_unlocked<A, B>(_:_:)();
    v7._countAndFlagsBits = 8236;
    v7._object = (void *)0xE200000000000000;
    String.append(_:)(v7);
    type metadata accessor for UtunSocket();
    _print_unlocked<A, B>(_:_:)();
    goto LABEL_5;
  }
  if (a3 >> 62 == 1)
  {
    swift_retain();
    swift_retain();
    _StringGuts.grow(_:)(17);
    v3._countAndFlagsBits = 0x657463656E6E6F63;
    v3._object = (void *)0xEA00000000002864;
    String.append(_:)(v3);
    type metadata accessor for NWConnection();
    _print_unlocked<A, B>(_:_:)();
    v4._countAndFlagsBits = 8236;
    v4._object = (void *)0xE200000000000000;
    String.append(_:)(v4);
    type metadata accessor for UtunSocket();
    _print_unlocked<A, B>(_:_:)();
    v5._countAndFlagsBits = 41;
    v5._object = (void *)0xE100000000000000;
    String.append(_:)(v5);
LABEL_5:
    swift_release();
    swift_release();
    return 0;
  }
  return 0x656E6E6F63736964;
}

uint64_t sub_10000A5D0()
{
  return sub_10000A3D0(*(void *)v0, *(void *)(v0 + 8), *(void *)(v0 + 16));
}

unint64_t sub_10000A5DC()
{
  unint64_t result = qword_1000289B0;
  if (!qword_1000289B0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1000289B0);
  }
  return result;
}

void sub_10000A61C()
{
  uint64_t v1 = v0;
  swift_retain_n();
  oslog = Logger.logObject.getter();
  os_log_type_t v2 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(oslog, v2))
  {
    Swift::String v3 = (uint8_t *)swift_slowAlloc();
    uint64_t v4 = swift_slowAlloc();
    *(_DWORD *)Swift::String v3 = 136315138;
    uint64_t v13 = v4;
    Swift::String v5 = (uint64_t *)(v1 + OBJC_IVAR____TtC15SSHPacketTunnel21TCPPacketTunnelServer_state);
    swift_beginAccess();
    uint64_t v6 = *v5;
    uint64_t v7 = v5[1];
    unint64_t v8 = v5[2];
    sub_10000A890(v6, v7, v8);
    uint64_t v9 = sub_10000A3D0(v6, v7, v8);
    unint64_t v11 = v10;
    sub_100009034(v6, v7, v8);
    sub_1000094CC(v9, v11, &v13);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, oslog, v2, "State changed to %s", v3, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_release_n();
  }
}

uint64_t sub_10000A820()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC15SSHPacketTunnel21TCPPacketTunnelServer_state;
  swift_beginAccess();
  uint64_t v2 = *(void *)v1;
  sub_10000A890(*(void *)v1, *(void *)(v1 + 8), *(void *)(v1 + 16));
  return v2;
}

uint64_t sub_10000A890(uint64_t a1, uint64_t a2, unint64_t a3)
{
  if ((a3 >> 62) <= 1)
  {
    swift_retain();
    swift_retain();
    return swift_retain();
  }
  return result;
}

uint64_t sub_10000A8F4(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v7 = (uint64_t *)(v3 + OBJC_IVAR____TtC15SSHPacketTunnel21TCPPacketTunnelServer_state);
  swift_beginAccess();
  uint64_t v8 = *v7;
  uint64_t v9 = v7[1];
  unint64_t v10 = v7[2];
  uint64_t *v7 = a1;
  v7[1] = a2;
  v7[2] = a3;
  sub_10000A890(a1, a2, a3);
  sub_100009034(v8, v9, v10);
  sub_10000A61C();
  return sub_100009034(a1, a2, a3);
}

void (*sub_10000A9A0(uint64_t a1))(uint64_t a1, char a2)
{
  *(void *)(a1 + 24) = v1;
  swift_beginAccess();
  return sub_10000AA00;
}

void sub_10000AA00(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    sub_10000A61C();
  }
}

uint64_t sub_10000AA34()
{
  (*(void (**)(void))(*(void *)v0 + 144))();
  uint64_t v2 = v1;
  if ((v3 >> 62) > 1) {
    return 0;
  }
  swift_release();
  uint64_t v4 = swift_release();
  uint64_t v5 = (*(uint64_t (**)(uint64_t))(*(void *)v2 + 176))(v4);
  swift_release();
  return v5;
}

uint64_t sub_10000AAEC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = swift_allocObject();
  sub_10000AB54(a1, a2, a3, a4);
  return v8;
}

uint64_t sub_10000AB54(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = v4;
  uint64_t v30 = a3;
  uint64_t v31 = a4;
  uint64_t v28 = a1;
  uint64_t v29 = a2;
  uint64_t v6 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
  uint64_t v26 = *(void *)(v6 - 8);
  uint64_t v27 = v6;
  __chkstk_darwin(v6);
  uint64_t v25 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for OS_dispatch_queue.Attributes();
  __chkstk_darwin(v8);
  uint64_t v9 = type metadata accessor for DispatchQoS();
  __chkstk_darwin(v9 - 8);
  unint64_t v24 = sub_10000A5DC();
  uint64_t v32 = 0;
  unint64_t v33 = 0xE000000000000000;
  _StringGuts.grow(_:)(24);
  unint64_t v10 = (void **)sub_10000DCA0();
  unint64_t v11 = *v10;
  unint64_t v12 = (unint64_t)v10[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v32 = v11;
  unint64_t v33 = v12;
  v13._countAndFlagsBits = 0xD000000000000016;
  v13._object = (void *)0x80000001000207C0;
  String.append(_:)(v13);
  static DispatchQoS.unspecified.getter();
  uint64_t v32 = &_swiftEmptyArrayStorage;
  sub_10000D848(&qword_100028A28, (void (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes);
  sub_100008E28(&qword_100028A30);
  sub_10000C1E4((unint64_t *)&qword_100028A38, &qword_100028A30);
  dispatch thunk of SetAlgebra.init<A>(_:)();
  (*(void (**)(char *, void, uint64_t))(v26 + 104))(v25, enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:), v27);
  *(void *)(v4 + 16) = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
  swift_bridgeObjectRetain();
  Logger.init(subsystem:category:)();
  uint64_t v14 = OBJC_IVAR____TtC15SSHPacketTunnel21TCPPacketTunnelServer_exitSemaphore;
  *(void *)(v5 + v14) = dispatch_semaphore_create(0);
  uint64_t v15 = v5 + OBJC_IVAR____TtC15SSHPacketTunnel21TCPPacketTunnelServer_port;
  uint64_t v16 = type metadata accessor for NWEndpoint.Port();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 32))(v15, v28, v16);
  uint64_t v17 = v5 + OBJC_IVAR____TtC15SSHPacketTunnel21TCPPacketTunnelServer_tunnelSourceAddress;
  uint64_t v18 = type metadata accessor for IPv6Address();
  uint64_t v19 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 32);
  v19(v17, v29, v18);
  v19(v5 + OBJC_IVAR____TtC15SSHPacketTunnel21TCPPacketTunnelServer_tunnelDestinationAddress, v30, v18);
  uint64_t v20 = v5 + OBJC_IVAR____TtC15SSHPacketTunnel21TCPPacketTunnelServer_timeout;
  uint64_t v21 = type metadata accessor for DispatchTimeInterval();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 32))(v20, v31, v21);
  uint64_t v22 = (void *)(v5 + OBJC_IVAR____TtC15SSHPacketTunnel21TCPPacketTunnelServer_state);
  *uint64_t v22 = 0;
  v22[1] = 0;
  v22[2] = 0x8000000000000000;
  return v5;
}

uint64_t sub_10000AF60()
{
  uint64_t v1 = type metadata accessor for DispatchTime();
  uint64_t v45 = *(void *)(v1 - 8);
  uint64_t v46 = v1;
  uint64_t v2 = __chkstk_darwin(v1);
  uint64_t v43 = (char *)v42 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v2);
  uint64_t v44 = (char *)v42 - v4;
  uint64_t v5 = type metadata accessor for DispatchWorkItemFlags();
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)v42 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v50 = type metadata accessor for IPv6Address();
  uint64_t v48 = *(void *)(v50 - 8);
  uint64_t v8 = __chkstk_darwin(v50);
  v49 = (char *)v42 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v47 = (char *)v42 - v10;
  uint64_t v11 = type metadata accessor for NWEndpoint.Port();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)v42 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for NWProtocolTCP.Options();
  swift_allocObject();
  NWProtocolTCP.Options.init()();
  dispatch thunk of NWProtocolTCP.Options.enableKeepalive.setter();
  dispatch thunk of NWProtocolTCP.Options.keepaliveIdle.setter();
  dispatch thunk of NWProtocolTCP.Options.keepaliveCount.setter();
  dispatch thunk of NWProtocolTCP.Options.keepaliveInterval.setter();
  type metadata accessor for NWParameters();
  swift_retain();
  uint64_t v15 = NWParameters.__allocating_init(tls:tcp:)();
  NWParameters.acceptLocalOnly.setter();
  uint64_t v51 = v0;
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v14, v0 + OBJC_IVAR____TtC15SSHPacketTunnel21TCPPacketTunnelServer_port, v11);
  type metadata accessor for NWListener();
  swift_allocObject();
  swift_retain();
  uint64_t v16 = v52;
  uint64_t v17 = NWListener.init(using:on:)();
  if (v16)
  {
    swift_release();
    return swift_release();
  }
  else
  {
    uint64_t v18 = v17;
    v42[2] = v7;
    v42[3] = v15;
    v42[1] = v5;
    uint64_t v19 = v51;
    swift_retain();
    sub_10000BB84((uint64_t)sub_10000B6C0);
    NWListener.newConnectionHandler.setter();
    swift_release();
    swift_retain();
    sub_10000BB84((uint64_t)sub_10000BB80);
    NWListener.stateUpdateHandler.setter();
    swift_release();
    type metadata accessor for UtunSocket();
    uint64_t v52 = v18;
    uint64_t v20 = *(void **)(v19 + 16);
    uint64_t v21 = (uint64_t)v47;
    uint64_t v22 = *(void (**)(char *, uint64_t, uint64_t))(v48 + 16);
    uint64_t v23 = v50;
    v22(v47, v19 + OBJC_IVAR____TtC15SSHPacketTunnel21TCPPacketTunnelServer_tunnelSourceAddress, v50);
    uint64_t v24 = v19 + OBJC_IVAR____TtC15SSHPacketTunnel21TCPPacketTunnelServer_tunnelDestinationAddress;
    uint64_t v25 = (uint64_t)v49;
    v22(v49, v24, v23);
    uint64_t v26 = sub_100018AE4(v20, v21, v25);
    uint64_t v27 = v51;
    uint64_t v28 = *(uint64_t (**)(void, uint64_t))(*(void *)v26 + 240);
    swift_retain();
    uint64_t v30 = v28(sub_10000BFD0, v27);
    uint64_t v32 = v31;
    uint64_t v50 = v26;
    swift_release();
    sub_10000A184(v30, v32);
    swift_bridgeObjectRelease();
    NWListener.start(queue:)();
    uint64_t v33 = v51;
    aBlock[4] = sub_10000C0A8;
    aBlock[5] = v51;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_100008D1C;
    aBlock[3] = &unk_1000255E8;
    v49 = (char *)_Block_copy(aBlock);
    aBlock[7] = &_swiftEmptyArrayStorage;
    sub_10000D848((unint64_t *)&unk_100028F70, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
    swift_retain();
    sub_100008E28(&qword_100028A20);
    sub_10000C1E4((unint64_t *)&qword_100028F80, &qword_100028A20);
    dispatch thunk of SetAlgebra.init<A>(_:)();
    type metadata accessor for DispatchWorkItem();
    swift_allocObject();
    uint64_t v34 = DispatchWorkItem.init(flags:block:)();
    swift_release();
    long long v35 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)v33 + 152);
    uint64_t v36 = v52;
    swift_retain();
    uint64_t v37 = v50;
    swift_retain();
    swift_retain();
    v35(v36, v37, v34);
    uint64_t v38 = v43;
    static DispatchTime.now()();
    uint64_t v39 = v44;
    + infix(_:_:)();
    uint64_t v40 = v46;
    uint64_t v41 = *(void (**)(char *, uint64_t))(v45 + 8);
    v41(v38, v46);
    OS_dispatch_queue.asyncAfter(deadline:execute:)();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    return ((uint64_t (*)(char *, uint64_t))v41)(v39, v40);
  }
}

void sub_10000B6C0(uint64_t a1)
{
  uint64_t v3 = *(uint64_t (**)(void))(*(void *)v1 + 144);
  uint64_t v4 = v3();
  uint64_t v7 = v5;
  if (v6 >> 62)
  {
    sub_100009034(v4, v5, v6);
    swift_retain_n();
    log = Logger.logObject.getter();
    os_log_type_t v10 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(log, v10))
    {
      uint64_t v11 = (uint8_t *)swift_slowAlloc();
      uint64_t v22 = swift_slowAlloc();
      *(_DWORD *)uint64_t v11 = 136315138;
      uint64_t v12 = v3();
      uint64_t v14 = v13;
      unint64_t v16 = v15;
      uint64_t v17 = sub_10000A3D0(v12, v13, v15);
      unint64_t v19 = v18;
      sub_100009034(v12, v14, v16);
      sub_1000094CC(v17, v19, &v22);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, log, v10, "In state %s, rejecting new connection", v11, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      swift_release_n();
    }
  }
  else
  {
    dispatch thunk of DispatchWorkItem.cancel()();
    NWListener.cancel()();
    swift_retain();
    sub_10000BB84((uint64_t)sub_10000D844);
    NWConnection.stateUpdateHandler.setter();
    swift_release();
    type metadata accessor for TCPPacketTunnel();
    swift_retain();
    swift_retain();
    uint64_t v8 = sub_1000151B8(a1, v7);
    uint64_t v9 = NWConnection.start(queue:)();
    (*(void (**)(uint64_t))(*(void *)v8 + 128))(v9);
    sub_10000A2D0();
    uint64_t v20 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)v1 + 152);
    swift_retain();
    swift_retain();
    swift_retain();
    v20(a1, v7, v8 | 0x4000000000000000);
    swift_release();
    swift_release();
    swift_release();
    swift_release();
  }
}

uint64_t sub_10000BB84(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

Swift::Int sub_10000BB94(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for NWListener.State();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  uint64_t v8 = (char *)v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  os_log_type_t v10 = (char *)v29 - v9;
  uint64_t v11 = v2 + OBJC_IVAR____TtC15SSHPacketTunnel21TCPPacketTunnelServer_logger;
  uint64_t v32 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  uint64_t v33 = a1;
  v32((char *)v29 - v9, a1, v4);
  uint64_t v12 = Logger.logObject.getter();
  os_log_type_t v13 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v14 = swift_slowAlloc();
    uint64_t v30 = v2;
    unint64_t v15 = (uint8_t *)v14;
    uint64_t v16 = swift_slowAlloc();
    uint64_t v31 = v5;
    uint64_t v35 = v16;
    v29[1] = v11;
    *(_DWORD *)unint64_t v15 = 136315138;
    v29[0] = v15 + 4;
    sub_10000D848(&qword_100028B50, (void (*)(uint64_t))&type metadata accessor for NWListener.State);
    uint64_t v17 = dispatch thunk of CustomStringConvertible.description.getter();
    uint64_t v34 = sub_1000094CC(v17, v18, &v35);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    unint64_t v19 = *(void (**)(char *, uint64_t))(v31 + 8);
    v19(v10, v4);
    _os_log_impl((void *)&_mh_execute_header, v12, v13, "NWListener in state %s", v15, 0xCu);
    swift_arrayDestroy();
    uint64_t v5 = v31;
    swift_slowDealloc();
    uint64_t v2 = v30;
    swift_slowDealloc();
  }
  else
  {

    unint64_t v19 = *(void (**)(char *, uint64_t))(v5 + 8);
    v19(v10, v4);
  }
  v32(v8, v33, v4);
  Swift::Int result = (*(uint64_t (**)(char *, uint64_t))(v5 + 88))(v8, v4);
  if (result == enum case for NWListener.State.waiting(_:)
    || result == enum case for NWListener.State.failed(_:))
  {
    Swift::Int result = ((uint64_t (*)(char *, uint64_t))v19)(v8, v4);
LABEL_15:
    uint64_t v23 = (*(uint64_t (**)(Swift::Int))(*(void *)v2 + 144))(result);
    if (v25 >> 62) {
      return sub_100009034(v23, v24, v25);
    }
    swift_release();
    swift_release();
    swift_release();
    uint64_t v26 = Logger.logObject.getter();
    os_log_type_t v27 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v26, v27))
    {
      uint64_t v28 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v28 = 0;
      _os_log_impl((void *)&_mh_execute_header, v26, v27, "Listener ended without a connection, shutting down.", v28, 2u);
      swift_slowDealloc();
    }

    return sub_10000C604();
  }
  if (result != enum case for NWListener.State.setup(_:)
    && result != enum case for NWListener.State.ready(_:))
  {
    if (result != enum case for NWListener.State.cancelled(_:)) {
      return ((uint64_t (*)(char *, uint64_t))v19)(v8, v4);
    }
    goto LABEL_15;
  }
  return result;
}

uint64_t sub_10000BFD0(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (*(uint64_t (**)(void))(*(void *)v2 + 144))();
  if (v7 >> 62 == 1)
  {
    uint64_t v8 = v7 & 0x3FFFFFFFFFFFFFFFLL;
    swift_release();
    swift_release();
    (*(void (**)(uint64_t, uint64_t))(*(void *)v8 + 136))(a1, a2);
    return swift_release();
  }
  else
  {
    return sub_100009034(v5, v6, v7);
  }
}

uint64_t sub_10000C0A8()
{
  uint64_t v1 = (*(uint64_t (**)(void))(*(void *)v0 + 144))();
  if (v3 >> 62)
  {
    return sub_100009034(v1, v2, v3);
  }
  else
  {
    swift_release();
    swift_release();
    uint64_t v4 = Logger.logObject.getter();
    os_log_type_t v5 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v4, v5))
    {
      uint64_t v6 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, v5, "Listener timed out waiting for an incoming connection", v6, 2u);
      swift_slowDealloc();
    }

    NWListener.cancel()();
    return swift_release();
  }
}

uint64_t sub_10000C1CC(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10000C1DC()
{
  return swift_release();
}

uint64_t sub_10000C1E4(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10000A094(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10000C234()
{
  uint64_t v1 = v0;
  uint64_t v2 = Logger.logObject.getter();
  os_log_type_t v3 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    uint64_t v8 = swift_slowAlloc();
    *(_DWORD *)uint64_t v4 = 136315138;
    sub_1000094CC(0x656E6E6F63736964, 0xEC00000029287463, &v8);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "%s", v4, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)v1 + 144))(v5);
  if (v7 >> 62)
  {
    if (v7 >> 62 != 1) {
      return result;
    }
    swift_release();
    swift_release();
    NWConnection.cancel()();
  }
  else
  {
    swift_release();
    NWListener.cancel()();
    dispatch thunk of DispatchWorkItem.cancel()();
    swift_release();
  }
  return swift_release();
}

uint64_t sub_10000C40C()
{
  return OS_dispatch_semaphore.wait(timeout:)();
}

uint64_t sub_10000C438()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC15SSHPacketTunnel21TCPPacketTunnelServer_logger;
  uint64_t v2 = type metadata accessor for Logger();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);

  uint64_t v3 = v0 + OBJC_IVAR____TtC15SSHPacketTunnel21TCPPacketTunnelServer_port;
  uint64_t v4 = type metadata accessor for NWEndpoint.Port();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  uint64_t v5 = v0 + OBJC_IVAR____TtC15SSHPacketTunnel21TCPPacketTunnelServer_tunnelSourceAddress;
  uint64_t v6 = type metadata accessor for IPv6Address();
  unint64_t v7 = *(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8);
  v7(v5, v6);
  v7(v0 + OBJC_IVAR____TtC15SSHPacketTunnel21TCPPacketTunnelServer_tunnelDestinationAddress, v6);
  uint64_t v8 = v0 + OBJC_IVAR____TtC15SSHPacketTunnel21TCPPacketTunnelServer_timeout;
  uint64_t v9 = type metadata accessor for DispatchTimeInterval();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(v8, v9);
  sub_100009034(*(void *)(v0 + OBJC_IVAR____TtC15SSHPacketTunnel21TCPPacketTunnelServer_state), *(void *)(v0 + OBJC_IVAR____TtC15SSHPacketTunnel21TCPPacketTunnelServer_state + 8), *(void *)(v0 + OBJC_IVAR____TtC15SSHPacketTunnel21TCPPacketTunnelServer_state + 16));

  return swift_deallocClassInstance();
}

Swift::Int sub_10000C604()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for NWConnection.State();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for NWListener.State();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  os_log_type_t v10 = (char *)&v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = (*(uint64_t (**)(uint64_t))(*(void *)v0 + 144))(v8);
  uint64_t v13 = v11;
  uint64_t v15 = v14;
  if (!(v12 >> 62))
  {
    uint64_t v28 = v11;
    NWListener.state.getter();
    int v21 = (*(uint64_t (**)(char *, uint64_t))(v7 + 88))(v10, v6);
    if (v21 != enum case for NWListener.State.failed(_:))
    {
      if (v21 == enum case for NWListener.State.cancelled(_:))
      {
LABEL_16:
        dispatch thunk of DispatchWorkItem.cancel()();
        uint64_t v25 = sub_10000A260();
        (*(void (**)(uint64_t))(*(void *)v15 + 272))(v25);
        (*(void (**)(void, void, unint64_t))(*(void *)v1 + 152))(0, 0, 0x8000000000000000);
        OS_dispatch_semaphore.signal()();
        swift_release();
        swift_release();
        return swift_release();
      }
      uint64_t v22 = Logger.logObject.getter();
      os_log_type_t v23 = static os_log_type_t.fault.getter();
      if (os_log_type_enabled(v22, v23))
      {
        uint64_t v24 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v24 = 0;
        _os_log_impl((void *)&_mh_execute_header, v22, v23, "Shutting down utun before NWListener is shut down", v24, 2u);
        swift_slowDealloc();
      }
    }
    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
    goto LABEL_16;
  }
  if (v12 >> 62 != 1) {
    return OS_dispatch_semaphore.signal()();
  }
  swift_release();
  uint64_t v28 = v13;
  NWConnection.state.getter();
  int v16 = (*(uint64_t (**)(char *, uint64_t))(v3 + 88))(v5, v2);
  if (v16 == enum case for NWConnection.State.failed(_:)) {
    goto LABEL_8;
  }
  if (v16 != enum case for NWConnection.State.cancelled(_:))
  {
    uint64_t v17 = Logger.logObject.getter();
    os_log_type_t v18 = static os_log_type_t.fault.getter();
    if (os_log_type_enabled(v17, v18))
    {
      unint64_t v19 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v19 = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, v18, "Shutting down utun before NWConnection is shut down", v19, 2u);
      swift_slowDealloc();
    }

LABEL_8:
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  uint64_t v20 = sub_10000A260();
  (*(void (**)(uint64_t))(*(void *)v15 + 272))(v20);
  (*(void (**)(void, void, unint64_t))(*(void *)v1 + 152))(0, 0, 0x8000000000000000);
  OS_dispatch_semaphore.signal()();
  swift_release();
  return swift_release();
}

Swift::Int sub_10000CFF4(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for NWConnection.State();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  uint64_t v8 = (char *)v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  os_log_type_t v10 = (char *)v24 - v9;
  uint64_t v28 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  v28((char *)v24 - v9, a1, v4);
  uint64_t v11 = Logger.logObject.getter();
  os_log_type_t v12 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = swift_slowAlloc();
    uint64_t v27 = v1;
    uint64_t v14 = (uint8_t *)v13;
    uint64_t v15 = swift_slowAlloc();
    uint64_t v25 = a1;
    uint64_t v30 = v15;
    uint64_t v26 = v5;
    *(_DWORD *)uint64_t v14 = 136315138;
    v24[1] = v14 + 4;
    sub_10000D848(&qword_100028B58, (void (*)(uint64_t))&type metadata accessor for NWConnection.State);
    uint64_t v16 = dispatch thunk of CustomStringConvertible.description.getter();
    uint64_t v29 = sub_1000094CC(v16, v17, &v30);
    uint64_t v5 = v26;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    os_log_type_t v18 = *(void (**)(char *, uint64_t))(v5 + 8);
    v18(v10, v4);
    _os_log_impl((void *)&_mh_execute_header, v11, v12, "NWConnection in state %s", v14, 0xCu);
    swift_arrayDestroy();
    a1 = v25;
    swift_slowDealloc();
    uint64_t v2 = v27;
    swift_slowDealloc();
  }
  else
  {

    os_log_type_t v18 = *(void (**)(char *, uint64_t))(v5 + 8);
    v18(v10, v4);
  }
  v28(v8, a1, v4);
  Swift::Int result = (*(uint64_t (**)(char *, uint64_t))(v5 + 88))(v8, v4);
  if (result == enum case for NWConnection.State.waiting(_:)
    || result == enum case for NWConnection.State.failed(_:))
  {
    Swift::Int result = ((uint64_t (*)(char *, uint64_t))v18)(v8, v4);
LABEL_18:
    Swift::Int result = (*(uint64_t (**)(Swift::Int))(*(void *)v2 + 144))(result);
    if ((v23 >> 62) <= 1)
    {
      swift_release();
      swift_release();
      swift_release();
      return sub_10000C604();
    }
    return result;
  }
  if (result != enum case for NWConnection.State.setup(_:)
    && result != enum case for NWConnection.State.preparing(_:)
    && result != enum case for NWConnection.State.ready(_:))
  {
    if (result != enum case for NWConnection.State.cancelled(_:)) {
      return ((uint64_t (*)(char *, uint64_t))v18)(v8, v4);
    }
    goto LABEL_18;
  }
  return result;
}

uint64_t sub_10000D3D0()
{
  return type metadata accessor for TCPPacketTunnelServer();
}

uint64_t type metadata accessor for TCPPacketTunnelServer()
{
  uint64_t result = qword_100029490;
  if (!qword_100029490) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_10000D424()
{
  uint64_t result = type metadata accessor for Logger();
  if (v1 <= 0x3F)
  {
    uint64_t result = type metadata accessor for NWEndpoint.Port();
    if (v2 <= 0x3F)
    {
      uint64_t result = type metadata accessor for IPv6Address();
      if (v3 <= 0x3F)
      {
        uint64_t result = type metadata accessor for DispatchTimeInterval();
        if (v4 <= 0x3F) {
          return swift_updateClassMetadata2();
        }
      }
    }
  }
  return result;
}

uint64_t destroy for TCPPacketTunnelServer.State(uint64_t a1)
{
  return sub_100009034(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16));
}

uint64_t *_s15SSHPacketTunnel21TCPPacketTunnelServerC5StateOwCP_0(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  unint64_t v5 = a2[2];
  sub_10000A890(*a2, v4, v5);
  *a1 = v3;
  a1[1] = v4;
  a1[2] = v5;
  return a1;
}

uint64_t *assignWithCopy for TCPPacketTunnelServer.State(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  unint64_t v5 = a2[2];
  sub_10000A890(*a2, v4, v5);
  uint64_t v6 = *a1;
  uint64_t v7 = a1[1];
  unint64_t v8 = a1[2];
  *a1 = v3;
  a1[1] = v4;
  a1[2] = v5;
  sub_100009034(v6, v7, v8);
  return a1;
}

__n128 initializeWithTake for TCPPacketTunnelServer.State(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t *assignWithTake for TCPPacketTunnelServer.State(uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  uint64_t v4 = *a1;
  uint64_t v6 = a1[1];
  unint64_t v5 = a1[2];
  *(_OWORD *)a1 = *(_OWORD *)a2;
  a1[2] = v3;
  sub_100009034(v4, v6, v5);
  return a1;
}

uint64_t getEnumTagSinglePayload for TCPPacketTunnelServer.State(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 > 0x1FFFFD && *(unsigned char *)(a1 + 24)) {
    return (*(_DWORD *)a1 + 2097150);
  }
  if (((((*(void *)(a1 + 16) >> 43) >> 19) | (4
                                                             * ((*(void *)a1 >> 57) & 0x78 | *(void *)a1 & 7 | (*(void *)(a1 + 8) >> 50) & 0x3C00 | ((*(void *)(a1 + 8) & 7) << 7) | (*(void *)(a1 + 16) >> 43) & 0x60000 | ((*(void *)(a1 + 16) & 7) << 14)))) ^ 0x1FFFFF) >= 0x1FFFFD)
    int v3 = -1;
  else {
    int v3 = (((*(void *)(a1 + 16) >> 43) >> 19) | (4
  }
                                                              * ((*(void *)a1 >> 57) & 0x78 | *(void *)a1 & 7 | (*(void *)(a1 + 8) >> 50) & 0x3C00 | ((*(void *)(a1 + 8) & 7) << 7) | (*(void *)(a1 + 16) >> 43) & 0x60000 | ((*(void *)(a1 + 16) & 7) << 14)))) ^ 0x1FFFFF;
  return (v3 + 1);
}

uint64_t storeEnumTagSinglePayload for TCPPacketTunnelServer.State(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x1FFFFD)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 2097150;
    if (a3 >= 0x1FFFFE) {
      *(unsigned char *)(result + 24) = 1;
    }
  }
  else
  {
    if (a3 >= 0x1FFFFE) {
      *(unsigned char *)(result + 24) = 0;
    }
    if (a2)
    {
      unint64_t v3 = ((-a2 >> 2) & 0x7FFFF) - (a2 << 19);
      *(void *)__n128 result = (v3 | (v3 << 57)) & 0xF000000000000007;
      uint64x2_t v4 = (uint64x2_t)vdupq_n_s64(v3);
      *(int8x16_t *)(result + 8) = vorrq_s8(vandq_s8((int8x16_t)vshlq_u64(v4, (uint64x2_t)xmmword_10001E840), (int8x16_t)vdupq_n_s64(7uLL)), vandq_s8((int8x16_t)vshlq_u64(v4, (uint64x2_t)xmmword_10001E850), (int8x16_t)vdupq_n_s64(0xF000000000000000)));
    }
  }
  return result;
}

uint64_t sub_10000D7BC(void *a1)
{
  uint64_t v1 = a1[2] >> 62;
  if (v1 <= 1) {
    return v1;
  }
  else {
    return (*a1 >> 3) + 2;
  }
}

uint64_t sub_10000D7DC(uint64_t result)
{
  *(void *)(result + 16) &= 0x3FFFFFFFFFFFFFFFuLL;
  return result;
}

int8x16_t sub_10000D7EC(uint64_t a1, uint64_t a2)
{
  if (a2 < 2)
  {
    uint64_t v3 = *(void *)(a1 + 16) & 0xFFFFFFFFFFFFFF8 | (a2 << 62);
    int8x16_t result = vandq_s8(*(int8x16_t *)a1, (int8x16_t)vdupq_n_s64(0xFFFFFFFFFFFFFF8uLL));
    *(int8x16_t *)a1 = result;
    *(void *)(a1 + 16) = v3;
  }
  else
  {
    *(void *)a1 = 8 * (a2 - 2);
    result.i64[0] = 0;
    *(_OWORD *)(a1 + 8) = xmmword_10001E860;
  }
  return result;
}

ValueMetadata *type metadata accessor for TCPPacketTunnelServer.State()
{
  return &type metadata for TCPPacketTunnelServer.State;
}

uint64_t sub_10000D848(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10000D890()
{
  uint64_t v0 = *(void *)(String.utf8CString.getter() + 16);
  uint64_t result = swift_release();
  if (v0) {
    dword_100029868 = -1067168253;
  }
  else {
    __break(1u);
  }
  return result;
}

int *sub_10000D8D8()
{
  if (qword_1000294A0 != -1) {
    swift_once();
  }
  return &dword_100029868;
}

uint64_t NWConnection.State.description.getter()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for NWError();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  unint64_t v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for NWConnection.State();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v1, v6);
  int v10 = (*(uint64_t (**)(char *, uint64_t))(v7 + 88))(v9, v6);
  if (v10 == enum case for NWConnection.State.waiting(_:))
  {
    (*(void (**)(char *, uint64_t))(v7 + 96))(v9, v6);
    (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v5, v9, v2);
    uint64_t v16 = 0;
    unint64_t v17 = 0xE000000000000000;
    uint64_t v11 = 0x28676E6974696177;
    unint64_t v12 = 0xE800000000000000;
LABEL_5:
    String.append(_:)(*(Swift::String *)&v11);
    _print_unlocked<A, B>(_:_:)();
    v13._countAndFlagsBits = 41;
    v13._object = (void *)0xE100000000000000;
    String.append(_:)(v13);
    uint64_t v14 = v16;
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    return v14;
  }
  if (v10 == enum case for NWConnection.State.failed(_:))
  {
    (*(void (**)(char *, uint64_t))(v7 + 96))(v9, v6);
    (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v5, v9, v2);
    uint64_t v16 = 0;
    unint64_t v17 = 0xE000000000000000;
    uint64_t v11 = 0x2864656C696166;
    unint64_t v12 = 0xE700000000000000;
    goto LABEL_5;
  }
  if (v10 == enum case for NWConnection.State.setup(_:)) {
    return 0x7075746573;
  }
  if (v10 == enum case for NWConnection.State.preparing(_:)) {
    return 0x6E69726170657270;
  }
  if (v10 == enum case for NWConnection.State.ready(_:)) {
    return 0x7964616572;
  }
  if (v10 == enum case for NWConnection.State.cancelled(_:)) {
    return 0x656C6C65636E6163;
  }
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return 0x6E776F6E6B6E75;
}

void *sub_10000DCA0()
{
  return &unk_1000256A0;
}

uint64_t sub_10000DCAC(uint64_t a1)
{
  return sub_10000DD3C(a1, qword_100029870);
}

uint64_t sub_10000DCBC()
{
  return sub_10000E05C(&qword_100029530, (uint64_t (*)(void))&type metadata accessor for NWEndpoint.Port, (uint64_t)qword_100029870);
}

uint64_t sub_10000DCF4(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_10000DD2C(uint64_t a1)
{
  return sub_10000DD3C(a1, qword_100029888);
}

uint64_t sub_10000DD3C(uint64_t a1, uint64_t *a2)
{
  sub_100008E28(&qword_100028B68);
  __chkstk_darwin();
  uint64_t v4 = (char *)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for NWEndpoint.Port();
  sub_10000E0C4(v5, a2);
  uint64_t v6 = sub_10000DCF4(v5, (uint64_t)a2);
  NWEndpoint.Port.init(rawValue:)();
  uint64_t v7 = *(void *)(v5 - 8);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48))(v4, 1, v5);
  if (result != 1) {
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v7 + 32))(v6, v4, v5);
  }
  __break(1u);
  return result;
}

uint64_t sub_10000DE58()
{
  return sub_10000E05C(&qword_100029538, (uint64_t (*)(void))&type metadata accessor for NWEndpoint.Port, (uint64_t)qword_100029888);
}

uint64_t sub_10000DE90(uint64_t a1)
{
  return sub_10000DEF8(a1, qword_1000298A0);
}

uint64_t sub_10000DEA8()
{
  return sub_10000E05C(&qword_100029540, (uint64_t (*)(void))&type metadata accessor for IPv6Address, (uint64_t)qword_1000298A0);
}

uint64_t sub_10000DEE0(uint64_t a1)
{
  return sub_10000DEF8(a1, qword_1000298B8);
}

uint64_t sub_10000DEF8(uint64_t a1, uint64_t *a2)
{
  sub_100008E28(&qword_100028B60);
  __chkstk_darwin();
  uint64_t v4 = (char *)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for IPv6Address();
  sub_10000E0C4(v5, a2);
  uint64_t v6 = sub_10000DCF4(v5, (uint64_t)a2);
  IPv6Address.init(_:)();
  uint64_t v7 = *(void *)(v5 - 8);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48))(v4, 1, v5);
  if (result != 1) {
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v7 + 32))(v6, v4, v5);
  }
  __break(1u);
  return result;
}

uint64_t sub_10000E024()
{
  return sub_10000E05C(&qword_100029548, (uint64_t (*)(void))&type metadata accessor for IPv6Address, (uint64_t)qword_1000298B8);
}

uint64_t sub_10000E05C(void *a1, uint64_t (*a2)(void), uint64_t a3)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v5 = a2(0);

  return sub_10000DCF4(v5, a3);
}

void *sub_10000E0B8()
{
  return &unk_10001E908;
}

uint64_t *sub_10000E0C4(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_10000E128()
{
  uint64_t v0 = type metadata accessor for Logger();
  sub_10000E0C4(v0, qword_1000298D0);
  sub_10000DCF4(v0, (uint64_t)qword_1000298D0);
  sub_10000DCA0();
  swift_bridgeObjectRetain();
  return Logger.init(subsystem:category:)();
}

uint64_t sub_10000E1B0()
{
  if (qword_100029550 != -1) {
    swift_once();
  }
  uint64_t v0 = type metadata accessor for Logger();

  return sub_10000DCF4(v0, (uint64_t)qword_1000298D0);
}

char *sub_10000E214(int a1, void *a2)
{
  int v2 = a1;
  if (*a2) {
    BOOL v3 = a1 < 1;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3) {
    return (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v5 = a2 + 1;
  uint64_t v6 = (char *)&_swiftEmptyArrayStorage;
  do
  {
    uint64_t v7 = String.init(cString:)();
    uint64_t v9 = v8;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v6 = sub_10001176C(0, *((void *)v6 + 2) + 1, 1, v6);
    }
    unint64_t v11 = *((void *)v6 + 2);
    unint64_t v10 = *((void *)v6 + 3);
    if (v11 >= v10 >> 1) {
      uint64_t v6 = sub_10001176C((char *)(v10 > 1), v11 + 1, 1, v6);
    }
    *((void *)v6 + 2) = v11 + 1;
    unint64_t v12 = &v6[16 * v11];
    *((void *)v12 + 4) = v7;
    *((void *)v12 + 5) = v9;
    uint64_t v13 = *v5++;
    BOOL v14 = v2-- != 0;
  }
  while (v13 && v2 != 0 && v14);
  return v6;
}

uint64_t sub_10000E2FC(int a1, void *a2)
{
  return sub_1000102B0(a1, a2, (void (*)(void))sub_10000E314);
}

uint64_t sub_10000E314(uint64_t a1)
{
  uint64_t v2 = v1;
  sub_100008E28(&qword_100028B60);
  uint64_t v4 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v6 = (char *)&v131 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v131 - v7;
  uint64_t v9 = type metadata accessor for IPv6Address();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v131 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __chkstk_darwin(v11);
  uint64_t v16 = (char *)&v131 - v15;
  uint64_t v17 = __chkstk_darwin(v14);
  v141 = (char *)&v131 - v18;
  __chkstk_darwin(v17);
  uint64_t v20 = (char *)&v131 - v19;
  uint64_t v21 = sub_100008E28(&qword_100028B68);
  uint64_t v22 = __chkstk_darwin(v21 - 8);
  v146 = (char *)&v131 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v22);
  os_log_type_t v147 = (char *)&v131 - v24;
  uint64_t v25 = a1;
  uint64_t v148 = type metadata accessor for NWEndpoint.Port();
  uint64_t v26 = __chkstk_darwin(v148);
  uint64_t v27 = __chkstk_darwin(v26);
  __chkstk_darwin(v27);
  uint64_t v29 = __chkstk_darwin((char *)&v131 - v28);
  uint64_t v34 = *(void *)(a1 + 16);
  if (!v34) {
    goto LABEL_22;
  }
  uint64_t v136 = v29;
  uint64_t v133 = v33;
  Swift::String v135 = v8;
  Swift::String v132 = v13;
  unint64_t v138 = v6;
  uint64_t v134 = v2;
  uint64_t v137 = v16;
  v139 = v20;
  uint64_t v140 = v9;
  uint64_t v144 = (uint64_t)&v131 - v30;
  uint64_t v145 = v10;
  uint64_t v142 = v31;
  uint64_t v143 = v32;
  swift_bridgeObjectRetain();
  uint64_t v149 = 0;
  uint64_t v150 = 0;
  uint64_t v35 = 0;
  uint64_t v151 = 0;
  uint64_t v152 = 0;
  uint64_t v36 = 0;
  uint64_t v153 = 0;
  v154 = 0;
  uint64_t v37 = 0;
  uint64_t v155 = 0;
  uint64_t v38 = 0;
  uint64_t v39 = (void **)(v25 + 40);
  while (2)
  {
    uint64_t v41 = (uint64_t)*(v39 - 1);
    uint64_t v40 = *v39;
    switch(v38)
    {
      case 0:
        BOOL v42 = v41 == 0x6E6E75742D687373 && v40 == (void *)0xEA00000000006C65;
        if (v42 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0) {
          goto LABEL_4;
        }
        __break(1u);
        goto LABEL_59;
      case 1:
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        uint64_t v150 = v41;
        uint64_t v155 = (uint64_t)v40;
        goto LABEL_4;
      case 2:
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        uint64_t v153 = v41;
        uint64_t v37 = v40;
        goto LABEL_4;
      case 3:
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        uint64_t v152 = v41;
        uint64_t v36 = v40;
        goto LABEL_4;
      case 4:
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        uint64_t v151 = v41;
        v154 = v40;
        goto LABEL_4;
      default:
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        if (v38 != 5)
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          unint64_t v156 = 0;
          unint64_t v157 = 0xE000000000000000;
          _StringGuts.grow(_:)(52);
          unint64_t v49 = 0xD000000000000032;
          unint64_t v50 = 0x80000001000208C0;
LABEL_31:
          String.append(_:)(*(Swift::String *)&v49);
          goto LABEL_32;
        }
        uint64_t v149 = v41;
        uint64_t v35 = v40;
LABEL_4:
        ++v38;
        v39 += 2;
        if (v34 != v38) {
          continue;
        }
        swift_bridgeObjectRelease();
        uint64_t v43 = v155;
        if (!v155)
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
LABEL_22:
          unint64_t v156 = 0;
          unint64_t v157 = 0xE000000000000000;
          _StringGuts.grow(_:)(50);
          swift_bridgeObjectRelease();
          unint64_t v156 = 0xD000000000000030;
          unint64_t v157 = 0x8000000100020900;
LABEL_32:
          if (qword_100029558 != -1) {
LABEL_59:
          }
            swift_once();
          uint64_t v70 = qword_1000298E8;
          unint64_t v69 = (void *)unk_1000298F0;
          swift_bridgeObjectRetain();
          v71._countAndFlagsBits = v70;
          v71._object = v69;
          String.append(_:)(v71);
          swift_bridgeObjectRelease();
          unint64_t v72 = v156;
          unint64_t v73 = v157;
          sub_100008FE0();
          swift_allocError();
          unint64_t *v74 = v72;
          v74[1] = v73;
          return swift_willThrow();
        }
        if (v37)
        {
          swift_bridgeObjectRetain();
          uint64_t v44 = (uint64_t)v147;
          uint64_t v45 = v153;
          NWEndpoint.Port.init(_:)();
          uint64_t v46 = v142;
          uint64_t v47 = v148;
          if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v142 + 48))(v44, 1, v148) == 1)
          {
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            sub_1000118E0(v44, &qword_100028B68);
            unint64_t v156 = 0;
            unint64_t v157 = 0xE000000000000000;
            _StringGuts.grow(_:)(23);
            swift_bridgeObjectRelease();
            unint64_t v156 = 0xD000000000000012;
            unint64_t v157 = 0x80000001000209C0;
            v48._countAndFlagsBits = v45;
            v48._object = v37;
            String.append(_:)(v48);
            swift_bridgeObjectRelease();
            unint64_t v49 = 10;
            unint64_t v50 = 0xE100000000000000;
            goto LABEL_31;
          }
          swift_bridgeObjectRelease();
          v53 = *(void (**)(uint64_t, uint64_t, uint64_t))(v46 + 32);
          uint64_t v54 = v136;
          v53(v136, v44, v47);
          v53(v144, v54, v47);
          uint64_t v52 = v46;
        }
        else
        {
          uint64_t v51 = sub_10000DCBC();
          uint64_t v52 = v142;
          uint64_t v47 = v148;
          (*(void (**)(uint64_t, uint64_t, uint64_t))(v142 + 16))(v144, v51, v148);
        }
        uint64_t v55 = v143;
        uint64_t v56 = v140;
        uint64_t v57 = v145;
        if (v36)
        {
          swift_bridgeObjectRetain();
          uint64_t v58 = (uint64_t)v146;
          uint64_t v59 = v152;
          NWEndpoint.Port.init(_:)();
          if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v52 + 48))(v58, 1, v47) == 1)
          {
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            sub_1000118E0(v58, &qword_100028B68);
            unint64_t v156 = 0;
            unint64_t v157 = 0xE000000000000000;
            _StringGuts.grow(_:)(25);
            swift_bridgeObjectRelease();
            unint64_t v156 = 0xD000000000000014;
            unint64_t v157 = 0x80000001000209A0;
            v60._countAndFlagsBits = v59;
            v60._object = v36;
            String.append(_:)(v60);
            swift_bridgeObjectRelease();
            v61._countAndFlagsBits = 10;
            v61._object = (void *)0xE100000000000000;
            String.append(_:)(v61);
            if (qword_100029558 != -1) {
              swift_once();
            }
            uint64_t v63 = qword_1000298E8;
            uint64_t v62 = (void *)unk_1000298F0;
            swift_bridgeObjectRetain();
            v64._countAndFlagsBits = v63;
            v64._object = v62;
            String.append(_:)(v64);
            swift_bridgeObjectRelease();
            unint64_t v65 = v156;
            unint64_t v66 = v157;
            sub_100008FE0();
            swift_allocError();
            unint64_t *v67 = v65;
            v67[1] = v66;
            swift_willThrow();
            return (*(uint64_t (**)(uint64_t, uint64_t))(v52 + 8))(v144, v47);
          }
          swift_bridgeObjectRelease();
          int v76 = *(void (**)(uint64_t, uint64_t, uint64_t))(v52 + 32);
          uint64_t v77 = v133;
          v76(v133, v58, v47);
          v76(v55, v77, v47);
          uint64_t v57 = v145;
          uint64_t v56 = v140;
        }
        else
        {
          uint64_t v75 = sub_10000DE58();
          (*(void (**)(uint64_t, uint64_t, uint64_t))(v52 + 16))(v55, v75, v47);
        }
        uint64_t v78 = (uint64_t)v138;
        uint64_t v79 = v149;
        if (v35)
        {
          swift_bridgeObjectRetain();
          uint64_t v80 = (uint64_t)v135;
          IPv6Address.init(_:)();
          if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v57 + 48))(v80, 1, v56) == 1)
          {
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            sub_1000118E0(v80, &qword_100028B60);
            unint64_t v156 = 0;
            unint64_t v157 = 0xE000000000000000;
            _StringGuts.grow(_:)(23);
            swift_bridgeObjectRelease();
            unint64_t v156 = 0xD000000000000012;
            unint64_t v157 = 0x8000000100020980;
            v81._countAndFlagsBits = v79;
            v81._object = v35;
            String.append(_:)(v81);
            swift_bridgeObjectRelease();
            v82._countAndFlagsBits = 10;
            v82._object = (void *)0xE100000000000000;
            String.append(_:)(v82);
            if (qword_100029558 != -1) {
              swift_once();
            }
            uint64_t v84 = qword_1000298E8;
            v83 = (void *)unk_1000298F0;
            swift_bridgeObjectRetain();
            v85._countAndFlagsBits = v84;
            v85._object = v83;
            String.append(_:)(v85);
            swift_bridgeObjectRelease();
            unint64_t v86 = v156;
            unint64_t v87 = v157;
            sub_100008FE0();
            swift_allocError();
            *os_log_type_t v88 = v86;
            v88[1] = v87;
            swift_willThrow();
LABEL_48:
            v102 = *(void (**)(uint64_t, uint64_t))(v52 + 8);
            v102(v143, v47);
            return ((uint64_t (*)(uint64_t, uint64_t))v102)(v144, v47);
          }
          swift_bridgeObjectRelease();
          uint64_t v90 = *(void (**)(char *, uint64_t, uint64_t))(v57 + 32);
          uint64_t v91 = v141;
          v90(v141, v80, v56);
          v90(v139, (uint64_t)v91, v56);
          uint64_t v57 = v145;
          uint64_t v43 = v155;
        }
        else
        {
          uint64_t v89 = sub_10000E024();
          (*(void (**)(char *, uint64_t, uint64_t))(v57 + 16))(v139, v89, v56);
        }
        v92 = v154;
        uint64_t v93 = v151;
        if (v154)
        {
          swift_bridgeObjectRetain();
          IPv6Address.init(_:)();
          if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v57 + 48))(v78, 1, v56) == 1)
          {
            swift_bridgeObjectRelease();
            sub_1000118E0(v78, &qword_100028B60);
            unint64_t v156 = 0;
            unint64_t v157 = 0xE000000000000000;
            _StringGuts.grow(_:)(21);
            swift_bridgeObjectRelease();
            unint64_t v156 = 0xD000000000000010;
            unint64_t v157 = 0x8000000100020960;
            v94._countAndFlagsBits = v93;
            v94._object = v92;
            String.append(_:)(v94);
            swift_bridgeObjectRelease();
            v95._countAndFlagsBits = 10;
            v95._object = (void *)0xE100000000000000;
            String.append(_:)(v95);
            if (qword_100029558 != -1) {
              swift_once();
            }
            uint64_t v97 = qword_1000298E8;
            uint64_t v96 = (void *)unk_1000298F0;
            swift_bridgeObjectRetain();
            v98._countAndFlagsBits = v97;
            v98._object = v96;
            String.append(_:)(v98);
            swift_bridgeObjectRelease();
            unint64_t v99 = v156;
            unint64_t v100 = v157;
            sub_100008FE0();
            swift_allocError();
            unint64_t *v101 = v99;
            v101[1] = v100;
            swift_willThrow();
            (*(void (**)(char *, uint64_t))(v145 + 8))(v139, v140);
            goto LABEL_48;
          }
          swift_bridgeObjectRelease();
          id v105 = *(void (**)(char *, uint64_t, uint64_t))(v57 + 32);
          int v106 = v132;
          v105(v132, v78, v56);
          uint64_t v104 = (uint64_t)v137;
          v105(v137, (uint64_t)v106, v56);
          uint64_t v57 = v145;
        }
        else
        {
          uint64_t v103 = sub_10000DEA8();
          uint64_t v104 = (uint64_t)v137;
          (*(void (**)(char *, uint64_t, uint64_t))(v57 + 16))(v137, v103, v56);
        }
        uint64_t v107 = v43;
        uint64_t v109 = v143;
        uint64_t v108 = v144;
        uint64_t v110 = (uint64_t)v139;
        uint64_t v111 = v134;
        sub_1000127B0(v150, v107, v104, v144, (uint64_t)v139, v143);
        if (v111)
        {
          uint64_t v112 = v108;
          swift_bridgeObjectRelease();
          if (qword_100029550 != -1) {
            swift_once();
          }
          uint64_t v113 = type metadata accessor for Logger();
          sub_10000DCF4(v113, (uint64_t)qword_1000298D0);
          swift_errorRetain();
          swift_errorRetain();
          unint64_t v114 = Logger.logObject.getter();
          os_log_type_t v115 = static os_log_type_t.error.getter();
          BOOL v116 = os_log_type_enabled(v114, v115);
          uint64_t v117 = v142;
          if (v116)
          {
            uint64_t v118 = (uint8_t *)swift_slowAlloc();
            v119 = (void *)swift_slowAlloc();
            *(_DWORD *)uint64_t v118 = 138412290;
            swift_errorRetain();
            uint64_t v120 = _swift_stdlib_bridgeErrorToNSError();
            unint64_t v156 = v120;
            UnsafeMutableRawBufferPointer.copyMemory(from:)();
            void *v119 = v120;
            uint64_t v47 = v148;
            swift_errorRelease();
            swift_errorRelease();
            _os_log_impl((void *)&_mh_execute_header, v114, v115, "remotectl ssh-tunnel failed: %@", v118, 0xCu);
            sub_100008E28(&qword_100028D90);
            swift_arrayDestroy();
            uint64_t v117 = v142;
            swift_slowDealloc();
            swift_slowDealloc();
          }
          else
          {
            swift_errorRelease();
            swift_errorRelease();
          }
          uint64_t v123 = (uint64_t)v139;

          unint64_t v156 = 0;
          unint64_t v157 = 0xE000000000000000;
          _StringGuts.grow(_:)(31);
          v124._countAndFlagsBits = 0xD00000000000001DLL;
          v124._object = (void *)0x8000000100020940;
          String.append(_:)(v124);
          uint64_t v158 = v111;
          sub_100008E28((uint64_t *)&unk_100028D70);
          _print_unlocked<A, B>(_:_:)();
          unint64_t v125 = v156;
          unint64_t v126 = v157;
          sub_100008FE0();
          swift_allocError();
          *uint64_t v127 = v125;
          v127[1] = v126;
          swift_willThrow();
          swift_errorRelease();
          Swift::String v128 = *(void (**)(char *, uint64_t))(v145 + 8);
          uint64_t v129 = v140;
          v128(v137, v140);
          v128((char *)v123, v129);
          Swift::String v130 = *(void (**)(uint64_t, uint64_t))(v117 + 8);
          v130(v143, v47);
          return ((uint64_t (*)(uint64_t, uint64_t))v130)(v112, v47);
        }
        else
        {
          swift_bridgeObjectRelease();
          v121 = *(void (**)(uint64_t, uint64_t))(v57 + 8);
          v121(v104, v56);
          v121(v110, v56);
          Class v122 = *(void (**)(uint64_t, uint64_t))(v142 + 8);
          v122(v109, v47);
          return ((uint64_t (*)(uint64_t, uint64_t))v122)(v108, v47);
        }
    }
  }
}

void sub_10000F388()
{
  uint64_t v0 = type metadata accessor for IPv6Address();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin();
  BOOL v3 = (char *)v20 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for NWEndpoint.Port();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin();
  uint64_t v7 = (char *)v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = 0;
  unint64_t v24 = 0xE000000000000000;
  _StringGuts.grow(_:)(91);
  v8._countAndFlagsBits = 0xD000000000000028;
  v8._object = (void *)0x8000000100020CD0;
  String.append(_:)(v8);
  uint64_t v9 = sub_10000DCBC();
  uint64_t v22 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  v22(v7, v9, v4);
  _print_unlocked<A, B>(_:_:)();
  uint64_t v21 = *(void (**)(char *, uint64_t))(v5 + 8);
  v21(v7, v4);
  v10._countAndFlagsBits = 0x50497475643C203ELL;
  v10._object = (void *)0xEC000000203F3F20;
  String.append(_:)(v10);
  uint64_t v11 = sub_10000DEA8();
  uint64_t v12 = v1;
  uint64_t v13 = *(void (**)(char *, uint64_t, uint64_t))(v1 + 16);
  v13(v3, v11, v0);
  _print_unlocked<A, B>(_:_:)();
  uint64_t v14 = *(void (**)(char *, uint64_t))(v12 + 8);
  v20[1] = v12 + 8;
  v14(v3, v0);
  v15._object = (void *)0x8000000100020D00;
  v15._countAndFlagsBits = 0xD000000000000010;
  String.append(_:)(v15);
  uint64_t v16 = sub_10000DE58();
  v22(v7, v16, v4);
  _print_unlocked<A, B>(_:_:)();
  v21(v7, v4);
  v17._countAndFlagsBits = 0x6C61636F6C3C203ELL;
  v17._object = (void *)0xEE00203F3F205049;
  String.append(_:)(v17);
  uint64_t v18 = sub_10000E024();
  v13(v3, v18, v0);
  _print_unlocked<A, B>(_:_:)();
  v14(v3, v0);
  v19._countAndFlagsBits = 62;
  v19._object = (void *)0xE100000000000000;
  String.append(_:)(v19);
  qword_1000298E8 = v23;
  unk_1000298F0 = v24;
}

uint64_t sub_10000F6EC(int a1, void *a2)
{
  return sub_1000102B0(a1, a2, (void (*)(void))sub_10000F704);
}

uint64_t sub_10000F704(uint64_t a1)
{
  uint64_t v3 = sub_100008E28(&qword_100028B60);
  uint64_t v4 = __chkstk_darwin(v3 - 8);
  uint64_t v6 = (char *)&v88 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  Swift::String v8 = (char *)&v88 - v7;
  uint64_t v9 = type metadata accessor for IPv6Address();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v88 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  Swift::String v15 = (char *)&v88 - v14;
  uint64_t v16 = sub_100008E28(&qword_100028B68);
  __chkstk_darwin(v16 - 8);
  unint64_t v100 = (char *)&v88 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = type metadata accessor for NWEndpoint.Port();
  uint64_t v19 = __chkstk_darwin(v18);
  uint64_t v22 = ((char *)&v88 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v23 = a1;
  uint64_t v24 = *(void *)(a1 + 16);
  if (!v24) {
    goto LABEL_19;
  }
  v92 = v15;
  uint64_t v93 = v8;
  uint64_t v89 = v1;
  uint64_t v90 = v13;
  uint64_t v91 = v6;
  uint64_t v94 = v9;
  uint64_t v95 = v10;
  uint64_t v96 = v22;
  uint64_t v97 = v20;
  uint64_t v98 = v19;
  uint64_t v25 = v23;
  swift_bridgeObjectRetain();
  uint64_t v26 = 0;
  uint64_t v27 = 0;
  uint64_t v104 = 0;
  uint64_t v105 = 0;
  uint64_t v28 = 0;
  uint64_t v29 = 0;
  unint64_t v106 = 0;
  uint64_t v30 = 0;
  uint64_t v99 = v25;
  uint64_t v31 = (unint64_t *)(v25 + 40);
  v101 = "nnel-callback failed: ";
  unint64_t v102 = 0x8000000100020B20;
  uint64_t v103 = 0;
  while (2)
  {
    uint64_t v32 = *(v31 - 1);
    unint64_t v33 = *v31;
    switch(v30)
    {
      case 0:
        if (v32 == 0xD000000000000013 && v33 == v102 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0) {
          goto LABEL_4;
        }
        __break(1u);
        goto LABEL_42;
      case 1:
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        uint64_t v103 = v32;
        unint64_t v106 = v33;
        goto LABEL_4;
      case 2:
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        uint64_t v105 = v32;
        uint64_t v29 = (void *)v33;
        goto LABEL_4;
      case 3:
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        uint64_t v104 = v32;
        uint64_t v28 = (void *)v33;
        goto LABEL_4;
      default:
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        if (v30 != 4)
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          sub_100008FE0();
          swift_allocError();
          unint64_t v40 = 0xD00000000000003ALL;
          uint64_t v41 = "remotectl ssh-tunnel-callback excepts no more than 4 args.";
          goto LABEL_20;
        }
        uint64_t v26 = v32;
        uint64_t v27 = (void *)v33;
LABEL_4:
        ++v30;
        v31 += 2;
        if (v24 != v30) {
          continue;
        }
        uint64_t v34 = v26;
        swift_bridgeObjectRelease();
        if (!v106)
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
LABEL_19:
          sub_100008FE0();
          swift_allocError();
          unint64_t v40 = 0xD000000000000046;
          uint64_t v41 = "Specify tunnel host as first argument to remotectl ssh-tunnel-callback";
LABEL_20:
          unint64_t *v39 = v40;
          v39[1] = (unint64_t)(v41 - 32) | 0x8000000000000000;
          return swift_willThrow();
        }
        if (!v29)
        {
          uint64_t v38 = 7104878;
          uint64_t v35 = (uint64_t)v100;
          (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v97 + 56))(v100, 1, 1, v98);
          uint64_t v29 = (void *)0xE300000000000000;
LABEL_22:
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          sub_1000118E0(v35, &qword_100028B68);
          unint64_t v107 = 0;
          unint64_t v108 = 0xE000000000000000;
          _StringGuts.grow(_:)(37);
          swift_bridgeObjectRelease();
          unint64_t v107 = 0xD000000000000023;
          unint64_t v108 = 0x8000000100020A70;
          v42._countAndFlagsBits = v38;
          v42._object = v29;
          String.append(_:)(v42);
          swift_bridgeObjectRelease();
          unint64_t v43 = v107;
          unint64_t v44 = v108;
          sub_100008FE0();
          swift_allocError();
          *uint64_t v45 = v43;
          v45[1] = v44;
          return swift_willThrow();
        }
        swift_bridgeObjectRetain();
        uint64_t v35 = (uint64_t)v100;
        NWEndpoint.Port.init(_:)();
        uint64_t v37 = v97;
        uint64_t v36 = v98;
        if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v97 + 48))(v35, 1, v98) == 1)
        {
          uint64_t v38 = v105;
          goto LABEL_22;
        }
        swift_bridgeObjectRelease();
        (*(void (**)(NSObject *, uint64_t, uint64_t))(v37 + 32))(v96, v35, v36);
        if (v28)
        {
          swift_bridgeObjectRetain();
          uint64_t v47 = (uint64_t)v93;
          IPv6Address.init(_:)();
          uint64_t v48 = v95;
          unint64_t v49 = *(unsigned int (**)(uint64_t, uint64_t))(v95 + 48);
          uint64_t v50 = v94;
          if (v49(v47, 1) == 1)
          {
            uint64_t v36 = v98;
            uint64_t v51 = v104;
            goto LABEL_29;
          }
          swift_bridgeObjectRelease();
          uint64_t v56 = *(void (**)(char *, uint64_t, uint64_t))(v48 + 32);
          uint64_t v57 = v47;
          uint64_t v58 = v50;
          v56(v92, v57, v50);
          if (v27)
          {
            uint64_t v59 = v56;
            swift_bridgeObjectRetain();
            uint64_t v60 = (uint64_t)v91;
            IPv6Address.init(_:)();
            if (((unsigned int (*)(uint64_t, uint64_t, uint64_t))v49)(v60, 1, v58) == 1)
            {
              uint64_t v61 = v98;
              uint64_t v62 = v58;
              uint64_t v48 = v95;
              uint64_t v63 = v34;
              goto LABEL_34;
            }
            swift_bridgeObjectRelease();
            uint64_t v68 = (uint64_t)v90;
            v59(v90, v60, v58);
            uint64_t v69 = v58;
            uint64_t v70 = v96;
            uint64_t v26 = (uint64_t)v92;
            Swift::String v71 = v89;
            sub_100016D24(v103, v106, v96, (uint64_t)v92, v68);
            uint64_t v29 = v71;
            uint64_t v72 = v98;
            if (v71)
            {
              swift_bridgeObjectRelease();
              if (qword_100029550 != -1) {
LABEL_42:
              }
                swift_once();
              uint64_t v73 = type metadata accessor for Logger();
              sub_10000DCF4(v73, (uint64_t)qword_1000298D0);
              swift_errorRetain();
              swift_errorRetain();
              v74 = Logger.logObject.getter();
              os_log_type_t v75 = static os_log_type_t.error.getter();
              if (os_log_type_enabled(v74, v75))
              {
                int v76 = (uint8_t *)swift_slowAlloc();
                uint64_t v77 = (void *)swift_slowAlloc();
                *(_DWORD *)int v76 = 138412290;
                swift_errorRetain();
                uint64_t v78 = _swift_stdlib_bridgeErrorToNSError();
                unint64_t v107 = v78;
                UnsafeMutableRawBufferPointer.copyMemory(from:)();
                *uint64_t v77 = v78;
                swift_errorRelease();
                swift_errorRelease();
                _os_log_impl((void *)&_mh_execute_header, v74, v75, "remotectl ssh-tunnel-callback failed: %@", v76, 0xCu);
                sub_100008E28(&qword_100028D90);
                swift_arrayDestroy();
                swift_slowDealloc();
                swift_slowDealloc();
              }
              else
              {
                swift_errorRelease();
                swift_errorRelease();
              }
              uint64_t v80 = v97;
              uint64_t v81 = v95;

              unint64_t v107 = 0;
              unint64_t v108 = 0xE000000000000000;
              _StringGuts.grow(_:)(40);
              v82._countAndFlagsBits = 0xD000000000000026;
              v82._object = (void *)0x8000000100020AF0;
              String.append(_:)(v82);
              uint64_t v109 = v29;
              sub_100008E28((uint64_t *)&unk_100028D70);
              _print_unlocked<A, B>(_:_:)();
              unint64_t v83 = v107;
              unint64_t v84 = v108;
              sub_100008FE0();
              swift_allocError();
              unint64_t *v85 = v83;
              v85[1] = v84;
              swift_willThrow();
              swift_errorRelease();
              unint64_t v86 = *(void (**)(char *, uint64_t))(v81 + 8);
              uint64_t v87 = v94;
              v86(v90, v94);
              v86((char *)v26, v87);
              return (*(uint64_t (**)(NSObject *, uint64_t))(v80 + 8))(v96, v98);
            }
            else
            {
              swift_bridgeObjectRelease();
              uint64_t v79 = *(void (**)(uint64_t, uint64_t))(v95 + 8);
              v79(v68, v69);
              v79(v26, v69);
              return (*(uint64_t (**)(NSObject *, uint64_t))(v97 + 8))(v70, v72);
            }
          }
          else
          {
            uint64_t v62 = v50;
            uint64_t v63 = 7104878;
            uint64_t v60 = (uint64_t)v91;
            (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v48 + 56))(v91, 1, 1, v50);
            uint64_t v27 = (void *)0xE300000000000000;
            uint64_t v61 = v98;
LABEL_34:
            swift_bridgeObjectRelease();
            sub_1000118E0(v60, &qword_100028B60);
            unint64_t v107 = 0;
            unint64_t v108 = 0xE000000000000000;
            _StringGuts.grow(_:)(35);
            swift_bridgeObjectRelease();
            unint64_t v107 = 0xD000000000000021;
            unint64_t v108 = 0x8000000100020AC0;
            v64._countAndFlagsBits = v63;
            v64._object = v27;
            String.append(_:)(v64);
            swift_bridgeObjectRelease();
            unint64_t v65 = v107;
            unint64_t v66 = v108;
            sub_100008FE0();
            swift_allocError();
            unint64_t *v67 = v65;
            v67[1] = v66;
            swift_willThrow();
            (*(void (**)(char *, uint64_t))(v48 + 8))(v92, v62);
            return (*(uint64_t (**)(NSObject *, uint64_t))(v97 + 8))(v96, v61);
          }
        }
        else
        {
          uint64_t v51 = 7104878;
          uint64_t v47 = (uint64_t)v93;
          (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v95 + 56))(v93, 1, 1, v94);
          uint64_t v28 = (void *)0xE300000000000000;
LABEL_29:
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          sub_1000118E0(v47, &qword_100028B60);
          unint64_t v107 = 0;
          unint64_t v108 = 0xE000000000000000;
          _StringGuts.grow(_:)(32);
          swift_bridgeObjectRelease();
          unint64_t v107 = 0xD00000000000001ELL;
          unint64_t v108 = 0x8000000100020AA0;
          v52._countAndFlagsBits = v51;
          v52._object = v28;
          String.append(_:)(v52);
          swift_bridgeObjectRelease();
          unint64_t v53 = v107;
          unint64_t v54 = v108;
          sub_100008FE0();
          swift_allocError();
          unint64_t *v55 = v53;
          v55[1] = v54;
          swift_willThrow();
          return (*(uint64_t (**)(NSObject *, uint64_t))(v37 + 8))(v96, v36);
        }
    }
  }
}

uint64_t sub_100010298(int a1, void *a2)
{
  return sub_1000102B0(a1, a2, (void (*)(void))sub_1000103A4);
}

uint64_t sub_1000102B0(int a1, void *a2, void (*a3)(void))
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_1000103A4(uint64_t a1)
{
  uint64_t v3 = sub_100008E28(&qword_100028B60);
  uint64_t v4 = __chkstk_darwin(v3 - 8);
  uint64_t v6 = (char *)&v134 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  Swift::String v8 = (char *)&v134 - v7;
  uint64_t v9 = type metadata accessor for IPv6Address();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v134 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  Swift::String v15 = (char *)&v134 - v14;
  uint64_t v16 = sub_100008E28(&qword_100028B68);
  __chkstk_darwin(v16 - 8);
  os_log_type_t v147 = (char *)&v134 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = type metadata accessor for NWEndpoint.Port();
  __chkstk_darwin(v18);
  uint64_t v22 = (char *)&v134 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = *(void *)(a1 + 16);
  if (!v23)
  {
    uint64_t v152 = 0;
    uint64_t v158 = 0;
    goto LABEL_22;
  }
  v139 = v8;
  uint64_t v137 = v6;
  uint64_t v135 = v1;
  uint64_t v136 = v13;
  unint64_t v138 = v15;
  uint64_t v140 = v9;
  uint64_t v141 = v10;
  uint64_t v142 = v22;
  uint64_t v143 = v19;
  unint64_t v145 = v20;
  swift_bridgeObjectRetain();
  uint64_t v24 = 0;
  uint64_t v153 = 0;
  v154 = 0;
  uint64_t v25 = 0;
  uint64_t v155 = 0;
  unint64_t v156 = 0;
  uint64_t v149 = 0;
  uint64_t v150 = 0;
  unint64_t v157 = 0;
  uint64_t v158 = 0;
  uint64_t v26 = 0;
  uint64_t v151 = 0;
  uint64_t v152 = 0;
  unint64_t v27 = 0;
  uint64_t v28 = 0;
  uint64_t v144 = a1;
  uint64_t v29 = (unint64_t *)(a1 + 40);
  v146 = "nnel-privileged failed: ";
  uint64_t v148 = 0x8000000100020CB0;
  while (2)
  {
    uint64_t v31 = *(v29 - 1);
    unint64_t v32 = *v29;
    switch(v28)
    {
      case 0:
        if (v31 == 0xD000000000000015 && v32 == v148) {
          goto LABEL_4;
        }
        uint64_t v33 = v24;
        char v34 = _stringCompareWithSmolCheck(_:_:expecting:)();
        uint64_t v24 = v33;
        if (v34) {
          goto LABEL_4;
        }
        __break(1u);
        goto LABEL_62;
      case 1:
        uint64_t v6 = (char *)v26;
        uint64_t v35 = v25;
        uint64_t v36 = v24;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        uint64_t v24 = v36;
        uint64_t v25 = v35;
        uint64_t v26 = (uint64_t)v6;
        uint64_t v152 = v31;
        unint64_t v27 = v32;
        goto LABEL_4;
      case 2:
        uint64_t v6 = (char *)v26;
        uint64_t v37 = v25;
        uint64_t v38 = v24;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        uint64_t v24 = v38;
        uint64_t v25 = v37;
        uint64_t v26 = (uint64_t)v6;
        uint64_t v151 = v31;
        uint64_t v158 = (void *)v32;
        goto LABEL_4;
      case 3:
        uint64_t v6 = (char *)v26;
        uint64_t v39 = v25;
        uint64_t v40 = v24;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        uint64_t v24 = v40;
        uint64_t v25 = v39;
        uint64_t v26 = (uint64_t)v6;
        uint64_t v150 = v31;
        v154 = (void *)v32;
        goto LABEL_4;
      case 4:
        uint64_t v41 = v25;
        uint64_t v42 = v24;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        uint64_t v24 = v42;
        uint64_t v25 = v41;
        uint64_t v26 = v31;
        unint64_t v156 = (void *)v32;
        goto LABEL_4;
      case 5:
        uint64_t v6 = (char *)v26;
        unint64_t v43 = v25;
        uint64_t v44 = v24;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        uint64_t v24 = v44;
        uint64_t v25 = v43;
        uint64_t v26 = (uint64_t)v6;
        uint64_t v149 = v31;
        unint64_t v157 = (void *)v32;
        goto LABEL_4;
      case 6:
        uint64_t v30 = v24;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        uint64_t v24 = v30;
        uint64_t v25 = (void *)v31;
        uint64_t v155 = (void *)v32;
        goto LABEL_4;
      default:
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        if (v28 != 7)
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          sub_100008FE0();
          swift_allocError();
          *uint64_t v63 = 0xD000000000000037;
          v63[1] = 0x8000000100020B40;
          return swift_willThrow();
        }
        uint64_t v24 = v31;
        uint64_t v153 = (void *)v32;
LABEL_4:
        ++v28;
        v29 += 2;
        if (v23 != v28) {
          continue;
        }
        uint64_t v148 = v24;
        swift_bridgeObjectRelease();
        if (!v27)
        {
          unint64_t v20 = v145;
          uint64_t v19 = v143;
LABEL_22:
          uint64_t v45 = (uint64_t)v147;
          int v48 = 1;
          (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v20 + 56))(v147, 1, 1, v19);
          unint64_t v27 = 0;
LABEL_23:
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          sub_1000118E0(v45, &qword_100028B68);
          unint64_t v159 = 0;
          unint64_t v160 = 0xE000000000000000;
          _StringGuts.grow(_:)(37);
          swift_bridgeObjectRelease();
          unint64_t v159 = 0xD000000000000023;
          unint64_t v160 = 0x8000000100020B80;
          if (v48) {
            uint64_t v49 = 7104878;
          }
          else {
            uint64_t v49 = v152;
          }
          if (v48) {
            unint64_t v27 = 0xE300000000000000;
          }
          unint64_t v50 = v27;
          String.append(_:)(*(Swift::String *)&v49);
          swift_bridgeObjectRelease();
          unint64_t v51 = v159;
          unint64_t v52 = v160;
          sub_100008FE0();
          swift_allocError();
          *unint64_t v53 = v51;
          v53[1] = v52;
          return swift_willThrow();
        }
        swift_bridgeObjectRetain();
        uint64_t v45 = (uint64_t)v147;
        NWEndpoint.Port.init(_:)();
        unint64_t v46 = v145;
        uint64_t v47 = v143;
        if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v145 + 48))(v45, 1, v143) == 1)
        {
          int v48 = 0;
          goto LABEL_23;
        }
        swift_bridgeObjectRelease();
        uint64_t v55 = v45;
        uint64_t v56 = v47;
        (*(void (**)(char *, uint64_t, uint64_t))(v46 + 32))(v142, v55, v47);
        uint64_t v57 = v158;
        if (!v158)
        {
          uint64_t v62 = 7104878;
          uint64_t v58 = (uint64_t)v139;
          (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v141 + 56))(v139, 1, 1, v140);
          uint64_t v57 = (void *)0xE300000000000000;
LABEL_35:
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          sub_1000118E0(v58, &qword_100028B60);
          unint64_t v159 = 0;
          unint64_t v160 = 0xE000000000000000;
          _StringGuts.grow(_:)(32);
          swift_bridgeObjectRelease();
          unint64_t v159 = 0xD00000000000001ELL;
          unint64_t v160 = 0x8000000100020BB0;
          v64._countAndFlagsBits = v62;
          v64._object = v57;
          String.append(_:)(v64);
          swift_bridgeObjectRelease();
          unint64_t v65 = v159;
          unint64_t v66 = v160;
          sub_100008FE0();
          swift_allocError();
          unint64_t *v67 = v65;
          v67[1] = v66;
          swift_willThrow();
          return (*(uint64_t (**)(char *, uint64_t))(v145 + 8))(v142, v56);
        }
        swift_bridgeObjectRetain();
        uint64_t v58 = (uint64_t)v139;
        IPv6Address.init(_:)();
        uint64_t v60 = (char *)v140;
        uint64_t v59 = v141;
        uint64_t v61 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v141 + 48);
        if (v61(v58, 1, v140) == 1)
        {
          uint64_t v62 = v151;
          goto LABEL_35;
        }
        uint64_t v152 = v26;
        swift_bridgeObjectRelease();
        uint64_t v68 = v59;
        uint64_t v69 = *(void (**)(char *, uint64_t, char *))(v59 + 32);
        v69(v138, v58, v60);
        uint64_t v70 = v154;
        if (!v154)
        {
          uint64_t v73 = 7104878;
          uint64_t v72 = (uint64_t)v137;
          (*(void (**)(char *, uint64_t, uint64_t, char *))(v59 + 56))(v137, 1, 1, v60);
          uint64_t v70 = (void *)0xE300000000000000;
LABEL_40:
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          sub_1000118E0(v72, &qword_100028B60);
          unint64_t v159 = 0;
          unint64_t v160 = 0xE000000000000000;
          _StringGuts.grow(_:)(34);
          swift_bridgeObjectRelease();
          unint64_t v159 = 0xD000000000000020;
          unint64_t v160 = 0x8000000100020BD0;
          v74._countAndFlagsBits = v73;
          v74._object = v70;
          String.append(_:)(v74);
          swift_bridgeObjectRelease();
          unint64_t v75 = v159;
          unint64_t v76 = v160;
          sub_100008FE0();
          swift_allocError();
          *uint64_t v77 = v75;
          v77[1] = v76;
          swift_willThrow();
          (*(void (**)(char *, char *))(v68 + 8))(v138, v60);
          return (*(uint64_t (**)(char *, uint64_t))(v145 + 8))(v142, v143);
        }
        Swift::String v71 = v69;
        swift_bridgeObjectRetain();
        uint64_t v72 = (uint64_t)v137;
        IPv6Address.init(_:)();
        uint64_t v6 = v60;
        if (v61(v72, 1, (uint64_t)v60) == 1)
        {
          uint64_t v68 = v141;
          uint64_t v73 = v150;
          goto LABEL_40;
        }
        uint64_t v78 = 7104878;
        swift_bridgeObjectRelease();
        v71(v136, v72, v60);
        uint64_t v79 = v157;
        if (!v157)
        {
          uint64_t v79 = (void *)0xE300000000000000;
          Swift::String v82 = v138;
          uint64_t v83 = v143;
          unint64_t v32 = v145;
LABEL_56:
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          unint64_t v159 = 0;
          unint64_t v160 = 0xE000000000000000;
          _StringGuts.grow(_:)(29);
          swift_bridgeObjectRelease();
          unint64_t v159 = 0xD00000000000001BLL;
          unint64_t v160 = 0x8000000100020C00;
          v106._countAndFlagsBits = v78;
          v106._object = v79;
          String.append(_:)(v106);
          swift_bridgeObjectRelease();
          unint64_t v107 = v159;
          unint64_t v108 = v160;
          sub_100008FE0();
          swift_allocError();
          *uint64_t v109 = v107;
          v109[1] = v108;
          swift_willThrow();
          uint64_t v110 = *(void (**)(char *, char *))(v141 + 8);
          v110(v136, v6);
          uint64_t v111 = v82;
LABEL_57:
          v110(v111, v6);
          return (*(uint64_t (**)(char *, uint64_t))(v32 + 8))(v142, v83);
        }
        swift_bridgeObjectRetain();
        uint64_t v80 = v149;
        unint64_t v81 = sub_10001150C(v149, (unint64_t)v79);
        Swift::String v82 = v138;
        uint64_t v83 = v143;
        unint64_t v32 = v145;
        if ((v81 & 0x100000000) != 0)
        {
          uint64_t v78 = v80;
          goto LABEL_56;
        }
        gid_t v84 = v81;
        uint64_t v33 = (uint64_t)v25;
        swift_bridgeObjectRelease();
        Swift::String v85 = v156;
        if (!v156)
        {
          Swift::String v85 = (void *)0xE300000000000000;
LABEL_60:
          uint64_t v112 = (uint64_t)v142;
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          unint64_t v159 = 0;
          unint64_t v160 = 0xE000000000000000;
          _StringGuts.grow(_:)(29);
          swift_bridgeObjectRelease();
          unint64_t v159 = 0xD00000000000001BLL;
          unint64_t v160 = 0x8000000100020C20;
          v113._countAndFlagsBits = v78;
          v113._object = v85;
          String.append(_:)(v113);
          swift_bridgeObjectRelease();
          unint64_t v114 = v159;
          unint64_t v115 = v160;
          sub_100008FE0();
          swift_allocError();
          *BOOL v116 = v114;
          v116[1] = v115;
          swift_willThrow();
          uint64_t v117 = *(void (**)(char *, char *))(v141 + 8);
          v117(v136, v6);
          v117(v138, v6);
          return (*(uint64_t (**)(uint64_t, uint64_t))(v32 + 8))(v112, v83);
        }
        swift_bridgeObjectRetain();
        uint64_t v86 = v152;
        unint64_t v87 = sub_10001150C(v152, (unint64_t)v85);
        if ((v87 & 0x100000000) != 0)
        {
          uint64_t v78 = v86;
          goto LABEL_60;
        }
        uid_t v88 = v87;
        swift_bridgeObjectRelease();
        uint64_t v25 = v155;
        if (!v155)
        {
          uint64_t v25 = (void *)0xE300000000000000;
LABEL_63:
          swift_bridgeObjectRelease();
          unint64_t v159 = 0;
          unint64_t v160 = 0xE000000000000000;
          _StringGuts.grow(_:)(29);
          swift_bridgeObjectRelease();
          unint64_t v159 = 0xD00000000000001BLL;
          unint64_t v160 = 0x8000000100020C40;
          v118._countAndFlagsBits = v78;
          v118._object = v25;
          String.append(_:)(v118);
          swift_bridgeObjectRelease();
          unint64_t v119 = v159;
          unint64_t v120 = v160;
          sub_100008FE0();
          swift_allocError();
          unint64_t *v121 = v119;
          v121[1] = v120;
          swift_willThrow();
          uint64_t v110 = *(void (**)(char *, char *))(v141 + 8);
          v110(v136, v6);
          uint64_t v111 = v138;
          goto LABEL_57;
        }
        swift_bridgeObjectRetain();
        unint64_t v89 = sub_10001150C(v33, (unint64_t)v25);
        if ((v89 & 0x100000000) != 0)
        {
LABEL_62:
          uint64_t v78 = v33;
          uint64_t v83 = v143;
          goto LABEL_63;
        }
        int v90 = v89;
        swift_bridgeObjectRelease();
        uint64_t v91 = v153;
        if (!v153)
        {
          uint64_t v91 = (void *)0xE300000000000000;
          uint64_t v94 = (uint64_t)v138;
LABEL_66:
          unint64_t v159 = 0;
          unint64_t v160 = 0xE000000000000000;
          _StringGuts.grow(_:)(30);
          swift_bridgeObjectRelease();
          unint64_t v159 = 0xD00000000000001CLL;
          unint64_t v160 = 0x8000000100020C60;
          v122._countAndFlagsBits = v78;
          v122._object = v91;
          String.append(_:)(v122);
          swift_bridgeObjectRelease();
          unint64_t v123 = v159;
          unint64_t v124 = v160;
          sub_100008FE0();
          swift_allocError();
          *unint64_t v125 = v123;
          v125[1] = v124;
          swift_willThrow();
          unint64_t v126 = *(void (**)(char *, char *))(v141 + 8);
          v126(v136, v6);
          v126((char *)v94, v6);
          return (*(uint64_t (**)(char *, uint64_t))(v32 + 8))(v142, v143);
        }
        swift_bridgeObjectRetain();
        uint64_t v92 = v148;
        unint64_t v93 = sub_10001150C(v148, (unint64_t)v91);
        uint64_t v94 = (uint64_t)v138;
        if ((v93 & 0x100000000) != 0)
        {
          uint64_t v78 = v92;
          goto LABEL_66;
        }
        int v95 = v93;
        swift_bridgeObjectRelease();
        if ((v95 | v90) < 0)
        {
          __break(1u);
LABEL_71:
          swift_once();
LABEL_52:
          uint64_t v100 = type metadata accessor for Logger();
          sub_10000DCF4(v100, (uint64_t)qword_1000298D0);
          swift_errorRetain();
          swift_errorRetain();
          v101 = Logger.logObject.getter();
          os_log_type_t v102 = static os_log_type_t.error.getter();
          if (os_log_type_enabled(v101, v102))
          {
            uint64_t v103 = (uint8_t *)swift_slowAlloc();
            uint64_t v104 = (void *)swift_slowAlloc();
            *(_DWORD *)uint64_t v103 = 138412290;
            swift_errorRetain();
            uint64_t v105 = _swift_stdlib_bridgeErrorToNSError();
            unint64_t v159 = v105;
            UnsafeMutableRawBufferPointer.copyMemory(from:)();
            *uint64_t v104 = v105;
            swift_errorRelease();
            swift_errorRelease();
            _os_log_impl((void *)&_mh_execute_header, v101, v102, "remotectl ssh-tunnel-privileged failed: %@", v103, 0xCu);
            sub_100008E28(&qword_100028D90);
            swift_arrayDestroy();
            swift_slowDealloc();
            swift_slowDealloc();
          }
          else
          {
            swift_errorRelease();
            swift_errorRelease();
          }

          unint64_t v159 = 0;
          unint64_t v160 = 0xE000000000000000;
          _StringGuts.grow(_:)(42);
          v128._countAndFlagsBits = 0xD000000000000028;
          v128._object = (void *)0x8000000100020C80;
          String.append(_:)(v128);
          uint64_t v161 = v92;
          sub_100008E28((uint64_t *)&unk_100028D70);
          _print_unlocked<A, B>(_:_:)();
          unint64_t v129 = v159;
          unint64_t v130 = v160;
          sub_100008FE0();
          swift_allocError();
          *uint64_t v131 = v129;
          v131[1] = v130;
          swift_willThrow();
          swift_errorRelease();
          uint64_t v132 = v140;
          uint64_t v133 = *(void (**)(char *, uint64_t))(v141 + 8);
          v133(v136, v140);
          v133(v138, v132);
          return (*(uint64_t (**)(char *, uint64_t))(v145 + 8))(v142, v143);
        }
        else
        {
          int v96 = v95;
          uint64_t v97 = (uint64_t)v142;
          uint64_t v98 = (uint64_t)v136;
          uint64_t v99 = v135;
          sub_100006B48((uint64_t)v142, v94, (uint64_t)v136, v88, v84, v90, v96);
          uint64_t v92 = v99;
          if (v99)
          {
            if (qword_100029550 == -1) {
              goto LABEL_52;
            }
            goto LABEL_71;
          }
          uint64_t v127 = *(void (**)(uint64_t, char *))(v141 + 8);
          v127(v98, v6);
          v127(v94, v6);
          return (*(uint64_t (**)(uint64_t, uint64_t))(v32 + 8))(v97, v143);
        }
    }
  }
}

unint64_t sub_10001150C(uint64_t a1, unint64_t a2)
{
  uint64_t v3 = HIBYTE(a2) & 0xF;
  uint64_t v4 = a1 & 0xFFFFFFFFFFFFLL;
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v5 = v3;
  }
  else {
    uint64_t v5 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (!v5)
  {
    swift_bridgeObjectRelease();
    uint64_t v21 = 0;
    LOBYTE(v20) = 1;
    return v21 | ((unint64_t)v20 << 32);
  }
  if ((a2 & 0x1000000000000000) == 0)
  {
    if ((a2 & 0x2000000000000000) == 0)
    {
      if ((a1 & 0x1000000000000000) != 0) {
        uint64_t v6 = (unsigned __int8 *)((a2 & 0xFFFFFFFFFFFFFFFLL) + 32);
      }
      else {
        uint64_t v6 = (unsigned __int8 *)_StringObject.sharedUTF8.getter();
      }
      uint64_t v7 = sub_100011A24(v6, v4, 10);
      LODWORD(v8) = v7;
      char v27 = BYTE4(v7) & 1;
      char v9 = BYTE4(v7) & 1;
      goto LABEL_38;
    }
    v26[0] = a1;
    v26[1] = a2 & 0xFFFFFFFFFFFFFFLL;
    int v10 = a1;
    if (a1 == 43)
    {
      if (v3)
      {
        if (v3 != 1)
        {
          LODWORD(v8) = (BYTE1(a1) - 48);
          if (v8 <= 9)
          {
            uint64_t v15 = v3 - 2;
            if (v15)
            {
              uint64_t v16 = (unsigned __int8 *)v26 + 2;
              while (1)
              {
                unsigned int v17 = *v16 - 48;
                if (v17 > 9) {
                  goto LABEL_35;
                }
                uint64_t v18 = 10 * v8;
                if ((v18 & 0xFFFFFFFF00000000) != 0) {
                  goto LABEL_35;
                }
                LODWORD(v8) = v18 + v17;
                if (__CFADD__(v18, v17)) {
                  goto LABEL_35;
                }
                char v9 = 0;
                ++v16;
                if (!--v15) {
                  goto LABEL_38;
                }
              }
            }
            goto LABEL_37;
          }
        }
        goto LABEL_35;
      }
    }
    else
    {
      if (a1 != 45)
      {
        if (v3)
        {
          LODWORD(v8) = (a1 - 48);
          if (v8 <= 9)
          {
            uint64_t v19 = v3 - 1;
            if (v19)
            {
              uint64_t v23 = (unsigned __int8 *)v26 + 1;
              while (1)
              {
                unsigned int v24 = *v23 - 48;
                if (v24 > 9) {
                  goto LABEL_35;
                }
                uint64_t v25 = 10 * v8;
                if ((v25 & 0xFFFFFFFF00000000) != 0) {
                  goto LABEL_35;
                }
                LODWORD(v8) = v25 + v24;
                if (__CFADD__(v25, v24)) {
                  goto LABEL_35;
                }
                char v9 = 0;
                ++v23;
                if (!--v19) {
                  goto LABEL_38;
                }
              }
            }
            goto LABEL_37;
          }
        }
        goto LABEL_35;
      }
      if (v3)
      {
        if (v3 != 1 && (BYTE1(a1) - 48) <= 9u)
        {
          int v10 = 0;
          LODWORD(v8) = -(BYTE1(a1) - 48);
          if (BYTE1(a1) == 48)
          {
            uint64_t v11 = v3 - 2;
            if (v11)
            {
              uint64_t v12 = (unsigned __int8 *)v26 + 2;
              while (1)
              {
                unsigned int v13 = *v12 - 48;
                if (v13 > 9) {
                  goto LABEL_35;
                }
                uint64_t v14 = 10 * v8;
                if ((v14 & 0xFFFFFFFF00000000) != 0) {
                  goto LABEL_35;
                }
                LODWORD(v8) = v14 - v13;
                if (v14 < v13) {
                  goto LABEL_35;
                }
                char v9 = 0;
                ++v12;
                if (!--v11) {
                  goto LABEL_38;
                }
              }
            }
LABEL_37:
            char v9 = 0;
            goto LABEL_38;
          }
LABEL_53:
          char v9 = 1;
          LODWORD(v8) = v10;
          goto LABEL_38;
        }
LABEL_35:
        LODWORD(v8) = 0;
        char v9 = 1;
LABEL_38:
        swift_bridgeObjectRelease();
        LODWORD(v20) = v9 & 1;
        goto LABEL_39;
      }
      __break(1u);
    }
    __break(1u);
    goto LABEL_53;
  }
  unint64_t v8 = sub_10001193C(a1, a2, 10);
  swift_bridgeObjectRelease();
  uint64_t v20 = HIDWORD(v8) & 1;
LABEL_39:
  uint64_t v21 = v8;
  if (v20) {
    uint64_t v21 = 0;
  }
  return v21 | ((unint64_t)v20 << 32);
}

char *sub_10001176C(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = *((void *)a4 + 3);
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = *((void *)a4 + 2);
    if (v7 <= v8) {
      uint64_t v9 = *((void *)a4 + 2);
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      sub_100008E28(&qword_100028B70);
      int v10 = (char *)swift_allocObject();
      int64_t v11 = j__malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * (v12 >> 4);
      unsigned int v13 = v10 + 32;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      int v10 = (char *)&_swiftEmptyArrayStorage;
      unsigned int v13 = (char *)&_swiftEmptyArrayStorage + 32;
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[16 * v8 + 32]) {
          memmove(v13, a4 + 32, 16 * v8);
        }
        *((void *)a4 + 2) = 0;
        goto LABEL_24;
      }
    }
    sub_10001220C(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t *sub_10001187C(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t sub_1000118E0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100008E28(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_10001193C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v13 = a1;
  uint64_t v14 = a2;
  swift_bridgeObjectRetain();
  uint64_t v5 = String.init<A>(_:)();
  unint64_t v6 = v4;
  if ((v4 & 0x1000000000000000) == 0)
  {
    if ((v4 & 0x2000000000000000) == 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v8 = HIBYTE(v6) & 0xF;
    uint64_t v13 = v5;
    uint64_t v14 = v6 & 0xFFFFFFFFFFFFFFLL;
    uint64_t v7 = (unsigned __int8 *)&v13;
    goto LABEL_7;
  }
  uint64_t v5 = sub_100011CA4();
  unint64_t v10 = v9;
  swift_bridgeObjectRelease();
  unint64_t v6 = v10;
  if ((v10 & 0x2000000000000000) != 0) {
    goto LABEL_6;
  }
LABEL_3:
  if ((v5 & 0x1000000000000000) != 0)
  {
    uint64_t v7 = (unsigned __int8 *)((v6 & 0xFFFFFFFFFFFFFFFLL) + 32);
    uint64_t v8 = v5 & 0xFFFFFFFFFFFFLL;
  }
  else
  {
    uint64_t v7 = (unsigned __int8 *)_StringObject.sharedUTF8.getter();
  }
LABEL_7:
  int64_t v11 = sub_100011A24(v7, v8, a3);
  swift_bridgeObjectRelease();
  return v11 | ((((unint64_t)v11 >> 32) & 1) << 32);
}

unsigned __int8 *sub_100011A24(unsigned __int8 *result, uint64_t a2, uint64_t a3)
{
  int v3 = *result;
  if (v3 == 43)
  {
    if (a2 >= 1)
    {
      uint64_t v16 = a2 - 1;
      if (a2 != 1)
      {
        unsigned __int8 v17 = a3 + 87;
        if (a3 > 10)
        {
          unsigned __int8 v18 = a3 + 55;
        }
        else
        {
          unsigned __int8 v17 = 97;
          unsigned __int8 v18 = 65;
        }
        if (a3 <= 10) {
          unsigned __int8 v19 = a3 + 48;
        }
        else {
          unsigned __int8 v19 = 58;
        }
        if (result)
        {
          unsigned int v8 = 0;
          uint64_t v20 = result + 1;
          do
          {
            unsigned int v21 = *v20;
            if (v21 < 0x30 || v21 >= v19)
            {
              if (v21 < 0x41 || v21 >= v18)
              {
                unsigned int v12 = 0;
                unsigned __int8 v13 = 1;
                if (v21 < 0x61 || v21 >= v17) {
                  return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
                }
                char v22 = -87;
              }
              else
              {
                char v22 = -55;
              }
            }
            else
            {
              char v22 = -48;
            }
            unint64_t v23 = v8 * (unint64_t)a3;
            if ((v23 & 0xFFFFFFFF00000000) != 0) {
              goto LABEL_72;
            }
            unsigned __int8 v24 = v21 + v22;
            unsigned int v8 = v23 + v24;
            if (__CFADD__(v23, v24)) {
              goto LABEL_72;
            }
            ++v20;
            --v16;
          }
          while (v16);
LABEL_48:
          unsigned __int8 v13 = 0;
          unsigned int v12 = v8;
          return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
        }
        goto LABEL_71;
      }
LABEL_72:
      unsigned int v12 = 0;
      unsigned __int8 v13 = 1;
      return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
    }
  }
  else
  {
    if (v3 != 45)
    {
      if (a2)
      {
        unsigned __int8 v25 = a3 + 87;
        if (a3 > 10)
        {
          unsigned __int8 v26 = a3 + 55;
        }
        else
        {
          unsigned __int8 v25 = 97;
          unsigned __int8 v26 = 65;
        }
        if (a3 <= 10) {
          unsigned __int8 v27 = a3 + 48;
        }
        else {
          unsigned __int8 v27 = 58;
        }
        if (result)
        {
          unsigned int v28 = 0;
          do
          {
            unsigned int v29 = *result;
            if (v29 < 0x30 || v29 >= v27)
            {
              if (v29 < 0x41 || v29 >= v26)
              {
                unsigned int v12 = 0;
                unsigned __int8 v13 = 1;
                if (v29 < 0x61 || v29 >= v25) {
                  return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
                }
                char v30 = -87;
              }
              else
              {
                char v30 = -55;
              }
            }
            else
            {
              char v30 = -48;
            }
            unint64_t v31 = v28 * (unint64_t)a3;
            if ((v31 & 0xFFFFFFFF00000000) != 0) {
              goto LABEL_72;
            }
            unsigned __int8 v32 = v29 + v30;
            unsigned int v28 = v31 + v32;
            if (__CFADD__(v31, v32)) {
              goto LABEL_72;
            }
            ++result;
            --a2;
          }
          while (a2);
          unsigned __int8 v13 = 0;
          unsigned int v12 = v28;
          return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
        }
        goto LABEL_71;
      }
      goto LABEL_72;
    }
    if (a2 >= 1)
    {
      uint64_t v4 = a2 - 1;
      if (a2 != 1)
      {
        unsigned __int8 v5 = a3 + 87;
        if (a3 > 10)
        {
          unsigned __int8 v6 = a3 + 55;
        }
        else
        {
          unsigned __int8 v5 = 97;
          unsigned __int8 v6 = 65;
        }
        if (a3 <= 10) {
          unsigned __int8 v7 = a3 + 48;
        }
        else {
          unsigned __int8 v7 = 58;
        }
        if (result)
        {
          unsigned int v8 = 0;
          unint64_t v9 = result + 1;
          while (1)
          {
            unsigned int v10 = *v9;
            if (v10 < 0x30 || v10 >= v7)
            {
              if (v10 < 0x41 || v10 >= v6)
              {
                unsigned int v12 = 0;
                unsigned __int8 v13 = 1;
                if (v10 < 0x61 || v10 >= v5) {
                  return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
                }
                char v11 = -87;
              }
              else
              {
                char v11 = -55;
              }
            }
            else
            {
              char v11 = -48;
            }
            unint64_t v14 = v8 * (unint64_t)a3;
            if ((v14 & 0xFFFFFFFF00000000) != 0) {
              goto LABEL_72;
            }
            unsigned __int8 v15 = v10 + v11;
            unsigned int v8 = v14 - v15;
            if (v14 < v15) {
              goto LABEL_72;
            }
            ++v9;
            if (!--v4) {
              goto LABEL_48;
            }
          }
        }
LABEL_71:
        unsigned int v12 = 0;
        unsigned __int8 v13 = 0;
        return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
      }
      goto LABEL_72;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_100011CA4()
{
  unint64_t v0 = String.subscript.getter();
  uint64_t v4 = sub_100011D24(v0, v1, v2, v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_100011D24(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  if ((a4 & 0x1000000000000000) != 0)
  {
    uint64_t v9 = sub_100011E7C(a1, a2, a3, a4);
    if (!v9
      || (uint64_t v10 = v9,
          char v11 = sub_10000996C(v9, 0),
          unint64_t v12 = sub_100011F7C((unint64_t)v14, (uint64_t)(v11 + 4), v10, a1, a2, a3, a4),
          swift_bridgeObjectRetain(),
          swift_bridgeObjectRelease(),
          v12 == v10))
    {
      uint64_t v13 = static String._uncheckedFromUTF8(_:)();
      swift_release();
      return v13;
    }
    __break(1u);
  }
  else
  {
    if ((a4 & 0x2000000000000000) != 0)
    {
      v14[0] = a3;
      v14[1] = a4 & 0xFFFFFFFFFFFFFFLL;
      return static String._uncheckedFromUTF8(_:)();
    }
    if ((a3 & 0x1000000000000000) != 0) {
      goto LABEL_4;
    }
  }
  _StringObject.sharedUTF8.getter();
LABEL_4:

  return static String._uncheckedFromUTF8(_:)();
}

uint64_t sub_100011E7C(uint64_t result, unint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v7 = result;
  uint64_t v8 = (a3 >> 59) & 1;
  if ((a4 & 0x1000000000000000) == 0) {
    LOBYTE(v8) = 1;
  }
  uint64_t v9 = 4 << v8;
  if ((result & 0xC) == 4 << v8)
  {
    uint64_t result = sub_100012190(result, a3, a4);
    unint64_t v7 = result;
  }
  if ((a2 & 0xC) == v9)
  {
    uint64_t result = sub_100012190(a2, a3, a4);
    a2 = result;
    if ((a4 & 0x1000000000000000) == 0) {
      return (a2 >> 16) - (v7 >> 16);
    }
  }
  else if ((a4 & 0x1000000000000000) == 0)
  {
    return (a2 >> 16) - (v7 >> 16);
  }
  unint64_t v10 = HIBYTE(a4) & 0xF;
  if ((a4 & 0x2000000000000000) == 0) {
    unint64_t v10 = a3 & 0xFFFFFFFFFFFFLL;
  }
  if (v10 < v7 >> 16)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v10 < a2 >> 16)
  {
LABEL_17:
    __break(1u);
    return result;
  }

  return String.UTF8View._foreignDistance(from:to:)();
}

unint64_t sub_100011F7C(unint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7)
{
  uint64_t v9 = (void *)result;
  if (!a2) {
    goto LABEL_5;
  }
  if (!a3)
  {
    unint64_t v12 = a4;
    uint64_t v11 = 0;
    goto LABEL_33;
  }
  if (a3 < 0) {
    goto LABEL_36;
  }
  unint64_t v10 = a5 >> 14;
  unint64_t v27 = a4 >> 14;
  if (a4 >> 14 == a5 >> 14)
  {
LABEL_5:
    uint64_t v11 = 0;
    unint64_t v12 = a4;
LABEL_33:
    void *v9 = a4;
    v9[1] = a5;
    v9[2] = a6;
    v9[3] = a7;
    v9[4] = v12;
    return v11;
  }
  uint64_t v11 = 0;
  uint64_t v14 = (a6 >> 59) & 1;
  if ((a7 & 0x1000000000000000) == 0) {
    LOBYTE(v14) = 1;
  }
  uint64_t v15 = 4 << v14;
  uint64_t v21 = (a7 & 0xFFFFFFFFFFFFFFFLL) + 32;
  uint64_t v22 = a7 & 0xFFFFFFFFFFFFFFLL;
  uint64_t v16 = HIBYTE(a7) & 0xF;
  if ((a7 & 0x2000000000000000) == 0) {
    uint64_t v16 = a6 & 0xFFFFFFFFFFFFLL;
  }
  unint64_t v23 = v16;
  uint64_t v26 = a3 - 1;
  unint64_t v12 = a4;
  while (1)
  {
    unint64_t v17 = v12 & 0xC;
    uint64_t result = v12;
    if (v17 == v15) {
      uint64_t result = sub_100012190(v12, a6, a7);
    }
    if (result >> 14 < v27 || result >> 14 >= v10) {
      break;
    }
    if ((a7 & 0x1000000000000000) != 0)
    {
      uint64_t result = String.UTF8View._foreignSubscript(position:)();
      char v19 = result;
      if (v17 != v15) {
        goto LABEL_23;
      }
    }
    else
    {
      unint64_t v18 = result >> 16;
      if ((a7 & 0x2000000000000000) != 0)
      {
        v28[0] = a6;
        v28[1] = v22;
        char v19 = *((unsigned char *)v28 + v18);
        if (v17 != v15) {
          goto LABEL_23;
        }
      }
      else
      {
        uint64_t result = v21;
        if ((a6 & 0x1000000000000000) == 0) {
          uint64_t result = _StringObject.sharedUTF8.getter();
        }
        char v19 = *(unsigned char *)(result + v18);
        if (v17 != v15)
        {
LABEL_23:
          if ((a7 & 0x1000000000000000) == 0) {
            goto LABEL_24;
          }
          goto LABEL_27;
        }
      }
    }
    uint64_t result = sub_100012190(v12, a6, a7);
    unint64_t v12 = result;
    if ((a7 & 0x1000000000000000) == 0)
    {
LABEL_24:
      unint64_t v12 = (v12 & 0xFFFFFFFFFFFF0000) + 65540;
      goto LABEL_29;
    }
LABEL_27:
    if (v23 <= v12 >> 16) {
      goto LABEL_35;
    }
    unint64_t v12 = String.UTF8View._foreignIndex(after:)();
LABEL_29:
    *(unsigned char *)(a2 + v11) = v19;
    if (v26 == v11)
    {
      uint64_t v11 = a3;
      goto LABEL_33;
    }
    ++v11;
    if (v10 == v12 >> 14) {
      goto LABEL_33;
    }
  }
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
  return result;
}

uint64_t sub_100012190(unsigned __int16 a1, uint64_t a2, uint64_t a3)
{
  char v3 = a1;
  uint64_t v4 = a1 >> 14;
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    uint64_t v10 = String.UTF16View.index(_:offsetBy:)();
    uint64_t v11 = v10 + (v4 << 16);
    unint64_t v12 = v10 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v13 = v11 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v13 = v12;
    }
    return v13 | 4;
  }
  else
  {
    uint64_t v5 = String.UTF8View._foreignIndex(_:offsetBy:)();
    uint64_t v6 = v5 + (v4 << 16);
    unint64_t v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v8 = v7;
    }
    return v8 | 8;
  }
}

uint64_t sub_10001220C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 16 * a1 + 32;
    unint64_t v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

id sub_100012300(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, __int16 a5, uint64_t a6, void *a7, int a8)
{
  int v39 = a8;
  v43._countAndFlagsBits = a6;
  v43._object = a7;
  v42._countAndFlagsBits = a3;
  v42._object = a4;
  uint64_t v40 = a1;
  uint64_t v41 = a2;
  uint64_t v9 = type metadata accessor for URL.DirectoryHint();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin();
  unint64_t v12 = (char *)&v38 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100008E28((uint64_t *)&unk_100028F60);
  __chkstk_darwin();
  uint64_t v14 = (char *)&v38 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = type metadata accessor for URL();
  uint64_t v16 = *(void *)(v15 - 8);
  __chkstk_darwin();
  unint64_t v18 = (char *)&v38 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v19 = [objc_allocWithZone((Class)NSTask) init];
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v16 + 56))(v14, 1, 1, v15);
  (*(void (**)(char *, void, uint64_t))(v10 + 104))(v12, enum case for URL.DirectoryHint.inferFromPath(_:), v9);
  URL.init(filePath:directoryHint:relativeTo:)();
  URL._bridgeToObjectiveC()(v20);
  uint64_t v22 = v21;
  (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v15);
  [v19 setExecutableURL:v22];

  sub_100008E28(&qword_100028B70);
  uint64_t v23 = swift_allocObject();
  *(_OWORD *)(v23 + 16) = xmmword_10001E910;
  *(void *)(v23 + 32) = 28461;
  *(void *)(v23 + 40) = 0xE200000000000000;
  *(void *)(v23 + 48) = 0xD000000000000018;
  *(void *)(v23 + 56) = 0x8000000100020E60;
  *(void *)(v23 + 64) = 21037;
  *(void *)(v23 + 72) = 0xE200000000000000;
  uint64_t v45 = 0;
  unint64_t v46 = 0xE000000000000000;
  _StringGuts.grow(_:)(17);
  swift_bridgeObjectRelease();
  uint64_t v45 = 0x3A5D313A3A5BLL;
  unint64_t v46 = 0xE600000000000000;
  __int16 v44 = a5;
  v24._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v24);
  swift_bridgeObjectRelease();
  v25._countAndFlagsBits = 0x3A5D313A3A5B3ALL;
  v25._object = (void *)0xE700000000000000;
  String.append(_:)(v25);
  __int16 v44 = v39;
  v26._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v26);
  swift_bridgeObjectRelease();
  unint64_t v27 = v46;
  *(void *)(v23 + 80) = v45;
  *(void *)(v23 + 88) = v27;
  uint64_t v28 = v41;
  *(void *)(v23 + 96) = v40;
  *(void *)(v23 + 104) = v28;
  uint64_t v45 = 0;
  unint64_t v46 = 0xE000000000000000;
  swift_bridgeObjectRetain();
  _StringGuts.grow(_:)(57);
  v29._countAndFlagsBits = 0xD000000000000031;
  v29._object = (void *)0x8000000100020E80;
  String.append(_:)(v29);
  __int16 v44 = a5;
  v30._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v30);
  swift_bridgeObjectRelease();
  v31._countAndFlagsBits = 32;
  v31._object = (void *)0xE100000000000000;
  String.append(_:)(v31);
  String.append(_:)(v42);
  v32._countAndFlagsBits = 32;
  v32._object = (void *)0xE100000000000000;
  String.append(_:)(v32);
  String.append(_:)(v43);
  unint64_t v33 = v46;
  *(void *)(v23 + 112) = v45;
  *(void *)(v23 + 120) = v33;
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [v19 setArguments:isa];

  uint64_t v45 = 0;
  if ([v19 launchAndReturnError:&v45])
  {
    id v35 = (id)v45;
  }
  else
  {
    id v36 = (id)v45;
    _convertNSErrorToError(_:)();

    swift_willThrow();
  }
  return v19;
}

void sub_1000127B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v83 = a6;
  uint64_t v81 = a3;
  uint64_t v82 = a5;
  uint64_t v77 = a4;
  uint64_t v78 = a1;
  uint64_t v79 = a2;
  uint64_t v6 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v74 = *(void *)(v6 - 8);
  uint64_t v75 = v6;
  __chkstk_darwin();
  uint64_t v72 = (char *)&v68 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v73 = type metadata accessor for DispatchQoS();
  uint64_t v71 = *(void *)(v73 - 8);
  __chkstk_darwin();
  uint64_t v70 = (char *)&v68 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = static Array._allocateBufferUninitialized(minimumCapacity:)();
  *(void *)(v9 + 16) = 1024;
  uint64_t v80 = v9;
  uint64_t v10 = (char *)(v9 + 32);
  bzero((void *)(v9 + 32), 0x400uLL);
  uint32_t bufsize = 1024;
  if (_NSGetExecutablePath(v10, &bufsize) == -1)
  {
    swift_bridgeObjectRelease();
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    uint64_t v11 = String.init(cString:)();
    uint64_t v13 = v12;
    uint64_t v14 = sub_100008E28(&qword_1000289D0);
    uint64_t v15 = swift_allocObject();
    long long v76 = xmmword_10001E630;
    *(_OWORD *)(v15 + 16) = xmmword_10001E630;
    *(void *)(v15 + 56) = &type metadata for String;
    *(void *)(v15 + 32) = 0xD000000000000052;
    *(void *)(v15 + 40) = 0x8000000100020D80;
    print(_:separator:terminator:)();
    swift_bridgeObjectRelease();
    pid_t v16 = getpgrp();
    gid_t v17 = getegid();
    uid_t v18 = getuid();
    pid_t v19 = getpid();
    sub_100008E28(&qword_100028B70);
    uint64_t v20 = swift_allocObject();
    *(_OWORD *)(v20 + 16) = xmmword_10001E920;
    *(void *)(v20 + 32) = v11;
    *(void *)(v20 + 40) = v13;
    *(void *)(v20 + 48) = 0xD000000000000015;
    *(void *)(v20 + 56) = 0x8000000100020CB0;
    LOWORD(aBlock) = NWEndpoint.Port.rawValue.getter();
    *(void *)(v20 + 64) = dispatch thunk of CustomStringConvertible.description.getter();
    *(void *)(v20 + 72) = v21;
    *(void *)(v20 + 80) = IPv6Address.debugDescription.getter();
    *(void *)(v20 + 88) = v22;
    *(void *)(v20 + 96) = IPv6Address.debugDescription.getter();
    *(void *)(v20 + 104) = v23;
    LODWORD(aBlock) = v18;
    *(void *)(v20 + 112) = dispatch thunk of CustomStringConvertible.description.getter();
    *(void *)(v20 + 120) = v24;
    LODWORD(aBlock) = v17;
    *(void *)(v20 + 128) = dispatch thunk of CustomStringConvertible.description.getter();
    *(void *)(v20 + 136) = v25;
    LODWORD(aBlock) = v19;
    *(void *)(v20 + 144) = dispatch thunk of CustomStringConvertible.description.getter();
    *(void *)(v20 + 152) = v26;
    LODWORD(aBlock) = v16;
    *(void *)(v20 + 160) = dispatch thunk of CustomStringConvertible.description.getter();
    *(void *)(v20 + 168) = v27;
    id v28 = v84;
    id v29 = sub_100014EBC();
    swift_bridgeObjectRelease();
    if (v28)
    {
      swift_bridgeObjectRelease();
      return;
    }
    uint64_t v68 = v14;
    uint64_t v69 = 0;
    id v84 = v29;
    uint64_t aBlock = 0;
    unint64_t v86 = 0xE000000000000000;
    _StringGuts.grow(_:)(30);
    swift_bridgeObjectRelease();
    uint64_t aBlock = 0x6D65722F706D742FLL;
    unint64_t v86 = 0xEF2E6C746365746FLL;
    pid_t v91 = v19;
    v30._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
    String.append(_:)(v30);
    swift_bridgeObjectRelease();
    v31._countAndFlagsBits = 0x2D7265706C65682ELL;
    v31._object = (void *)0xED00007964616572;
    String.append(_:)(v31);
    Swift::String v32 = self;
    id v33 = [v32 defaultManager];
    NSString v34 = String._bridgeToObjectiveC()();
    unsigned __int8 v35 = [v33 fileExistsAtPath:v34];

    if (v35)
    {
LABEL_9:
      swift_bridgeObjectRelease();
      id v41 = [v32 defaultManager];
      NSString v42 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease();
      uint64_t aBlock = 0;
      unsigned int v43 = [v41 removeItemAtPath:v42 error:&aBlock];

      id v44 = (id)aBlock;
      if (v43)
      {
        uint64_t v45 = swift_allocObject();
        *(_OWORD *)(v45 + 16) = v76;
        *(void *)(v45 + 56) = &type metadata for String;
        *(void *)(v45 + 32) = 0xD000000000000037;
        *(void *)(v45 + 40) = 0x8000000100020E00;
        id v46 = v44;
        print(_:separator:terminator:)();
        swift_bridgeObjectRelease();
        uint64_t v47 = IPv6Address.debugDescription.getter();
        uint64_t v49 = v48;
        __int16 v50 = NWEndpoint.Port.rawValue.getter();
        uint64_t v51 = IPv6Address.debugDescription.getter();
        unint64_t v53 = v52;
        int v54 = NWEndpoint.Port.rawValue.getter();
        uint64_t v55 = v69;
        id v56 = sub_100012300(v78, v79, v47, v49, v50, v51, v53, v54);
        if (!v55)
        {
          uint64_t v59 = v56;
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          uint64_t v60 = (void (__cdecl *)(int))SIG_IGN.getter();
          signal(2, v60);
          sub_100008AE8(0, (unint64_t *)&qword_100028D80);
          sub_100008AE8(0, (unint64_t *)&qword_1000289B0);
          uint64_t v61 = (void *)static OS_dispatch_queue.main.getter();
          static OS_dispatch_source.makeSignalSource(signal:queue:)();

          swift_getObjectType();
          uint64_t v62 = swift_allocObject();
          *(void *)(v62 + 16) = v59;
          unint64_t v89 = sub_10001337C;
          uint64_t v90 = v62;
          uint64_t aBlock = (uint64_t)_NSConcreteStackBlock;
          unint64_t v86 = 1107296256;
          unint64_t v87 = sub_100008D1C;
          uid_t v88 = &unk_1000256D8;
          uint64_t v63 = _Block_copy(&aBlock);
          id v64 = v59;
          unint64_t v65 = v70;
          static DispatchQoS.unspecified.getter();
          unint64_t v66 = v72;
          sub_100008D78();
          OS_dispatch_source.setEventHandler(qos:flags:handler:)();
          _Block_release(v63);
          (*(void (**)(char *, uint64_t))(v74 + 8))(v66, v75);
          (*(void (**)(char *, uint64_t))(v71 + 8))(v65, v73);
          swift_release();
          OS_dispatch_source.resume()();
          id v67 = v84;
          [v84 waitUntilExit];

          swift_unknownObjectRelease();
          return;
        }
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      else
      {
        id v58 = (id)aBlock;
        _convertNSErrorToError(_:)();

        swift_willThrow();
      }
    }
    else
    {
      uint64_t v36 = 62;
      while (1)
      {
        --v36;
        id v37 = v84;
        if (!v36 || ([v84 isRunning] & 1) == 0) {
          break;
        }
        sleep(1u);
        id v38 = [v32 defaultManager];
        NSString v39 = String._bridgeToObjectiveC()();
        unsigned int v40 = [v38 fileExistsAtPath:v39];

        if (v40) {
          goto LABEL_9;
        }
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_100008FE0();
      swift_allocError();
      *uint64_t v57 = 0xD00000000000001ALL;
      v57[1] = 0x8000000100020DE0;
      swift_willThrow();
    }
  }
}

uint64_t sub_1000130B4(void *a1)
{
  uint64_t v2 = type metadata accessor for Logger();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  unint64_t v5 = (char *)v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100008E28(&qword_1000289D0);
  uint64_t v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_10001E630;
  *(void *)(v6 + 56) = &type metadata for String;
  *(void *)(v6 + 32) = 0xD000000000000012;
  *(void *)(v6 + 40) = 0x8000000100020E40;
  print(_:separator:terminator:)();
  swift_bridgeObjectRelease();
  uint64_t result = kill((pid_t)[a1 processIdentifier], 9);
  if (result)
  {
    uint64_t v8 = sub_10000E1B0();
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v8, v2);
    uint64_t v9 = Logger.logObject.getter();
    os_log_type_t v10 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v9, v10))
    {
      uint64_t v11 = (uint8_t *)swift_slowAlloc();
      uint64_t v12 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v11 = 138412290;
      int v13 = errno.getter();
      sub_100009B90();
      swift_allocError();
      _DWORD *v14 = v13;
      uint64_t v15 = _swift_stdlib_bridgeErrorToNSError();
      v16[1] = v15;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      void *v12 = v15;
      _os_log_impl((void *)&_mh_execute_header, v9, v10, "Failed to shut down SSH: %@", v11, 0xCu);
      sub_100008E28(&qword_100028D90);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  return result;
}

uint64_t sub_100013344()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10001337C()
{
  return sub_1000130B4(*(void **)(v0 + 16));
}

uint64_t sub_100013384(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100013394()
{
  return swift_release();
}

unint64_t sub_10001339C()
{
  unint64_t result = qword_100028A38;
  if (!qword_100028A38)
  {
    sub_10000A094(&qword_100028A30);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028A38);
  }
  return result;
}

uint64_t sub_1000133F8()
{
  return 10;
}

uint64_t sub_100013400(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v29 = a3;
  uint64_t v36 = a4;
  uint64_t v37 = a2;
  uint64_t v38 = a1;
  uint64_t v26 = type metadata accessor for IPv6Address();
  uint64_t v35 = *(void *)(v26 - 8);
  uint64_t v4 = __chkstk_darwin(v26);
  id v28 = (char *)&v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v27 = (char *)&v25 - v6;
  uint64_t v7 = type metadata accessor for NWEndpoint.Port();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  os_log_type_t v10 = (char *)&v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for NWEndpoint.Host();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v25 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for NWProtocolTCP.Options();
  swift_allocObject();
  NWProtocolTCP.Options.init()();
  dispatch thunk of NWProtocolTCP.Options.enableKeepalive.setter();
  dispatch thunk of NWProtocolTCP.Options.keepaliveIdle.setter();
  dispatch thunk of NWProtocolTCP.Options.keepaliveCount.setter();
  dispatch thunk of NWProtocolTCP.Options.keepaliveInterval.setter();
  dispatch thunk of NWProtocolTCP.Options.connectionTimeout.setter();
  type metadata accessor for NWConnection();
  uint64_t v31 = v12;
  uint64_t v15 = *(void (**)(char *, uint64_t, uint64_t))(v12 + 16);
  uint64_t v32 = v11;
  v15(v14, v38, v11);
  uint64_t v33 = v8;
  uint64_t v34 = v7;
  uint64_t v16 = v26;
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, v37, v7);
  type metadata accessor for NWParameters();
  swift_retain();
  NWParameters.__allocating_init(tls:tcp:)();
  uint64_t v17 = v29;
  uint64_t v18 = NWConnection.__allocating_init(host:port:using:)();
  pid_t v19 = *(void (**)(char *, uint64_t, uint64_t))(v35 + 16);
  uint64_t v20 = v27;
  v19(v27, v17, v16);
  uint64_t v21 = v28;
  v19(v28, v36, v16);
  uint64_t v22 = (*(uint64_t (**)(uint64_t, char *, char *))(v30 + 152))(v18, v20, v21);
  swift_release();
  uint64_t v23 = *(void (**)(uint64_t, uint64_t))(v35 + 8);
  v23(v36, v16);
  v23(v17, v16);
  (*(void (**)(uint64_t, uint64_t))(v33 + 8))(v37, v34);
  (*(void (**)(uint64_t, uint64_t))(v31 + 8))(v38, v32);
  return v22;
}

uint64_t sub_1000137A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = swift_allocObject();
  sub_10001380C(a1, a2, a3);
  return v6;
}

uint64_t sub_10001380C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v44 = a1;
  uint64_t v4 = v3;
  uint64_t v45 = a2;
  uint64_t v46 = a3;
  uint64_t v5 = type metadata accessor for Logger();
  uint64_t v35 = *(void *)(v5 - 8);
  uint64_t v36 = v5;
  __chkstk_darwin(v5);
  uint64_t v34 = (char *)&v33 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v40 = type metadata accessor for IPv6Address();
  uint64_t v49 = *(void *)(v40 - 8);
  uint64_t v7 = __chkstk_darwin(v40);
  NSString v42 = (char *)&v33 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  id v41 = (char *)&v33 - v9;
  uint64_t v10 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
  uint64_t v38 = *(void *)(v10 - 8);
  uint64_t v39 = v10;
  __chkstk_darwin(v10);
  uint64_t v12 = (char *)&v33 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for OS_dispatch_queue.Attributes();
  __chkstk_darwin(v13);
  uint64_t v14 = type metadata accessor for DispatchQoS();
  __chkstk_darwin(v14 - 8);
  *(void *)(v3 + 32) = 0;
  unint64_t v37 = sub_10000A5DC();
  uint64_t v47 = 0;
  unint64_t v48 = 0xE000000000000000;
  _StringGuts.grow(_:)(24);
  uint64_t v15 = (void **)sub_10000DCA0();
  uint64_t v17 = *v15;
  unint64_t v16 = (unint64_t)v15[1];
  uint64_t v33 = v15;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v47 = v17;
  unint64_t v48 = v16;
  v18._countAndFlagsBits = 0xD000000000000016;
  v18._object = (void *)0x8000000100020F10;
  String.append(_:)(v18);
  static DispatchQoS.unspecified.getter();
  uint64_t v47 = &_swiftEmptyArrayStorage;
  sub_100014DB4(&qword_100028A28, (void (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes);
  sub_100008E28(&qword_100028A30);
  sub_10001339C();
  uint64_t v19 = v40;
  dispatch thunk of SetAlgebra.init<A>(_:)();
  (*(void (**)(char *, void, uint64_t))(v38 + 104))(v12, enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:), v39);
  uint64_t v20 = (void *)OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
  *(void *)(v4 + 40) = v20;
  uint64_t v21 = OBJC_IVAR____TtC15SSHPacketTunnel21TCPPacketTunnelClient_exitSemaphore;
  *(void *)(v4 + v21) = dispatch_semaphore_create(0);
  type metadata accessor for UtunSocket();
  uint64_t v22 = *(void (**)(char *, uint64_t, uint64_t))(v49 + 16);
  uint64_t v23 = (uint64_t)v41;
  v22(v41, v45, v19);
  uint64_t v24 = (uint64_t)v42;
  v22(v42, v46, v19);
  id v25 = v20;
  uint64_t v26 = v43;
  uint64_t v27 = sub_100018AE4(v25, v23, v24);
  if (v26)
  {
    swift_release();
    id v28 = *(void (**)(uint64_t, uint64_t))(v49 + 8);
    v28(v46, v19);
    v28(v45, v19);
    swift_release();

    type metadata accessor for TCPPacketTunnelClient();
    swift_deallocPartialClassInstance();
  }
  else
  {
    uint64_t v29 = v44;
    *(void *)(v4 + 16) = v27;
    *(void *)(v4 + 24) = v29;
    swift_retain();
    swift_bridgeObjectRetain();
    uint64_t v30 = v34;
    Logger.init(subsystem:category:)();
    (*(void (**)(uint64_t, char *, uint64_t))(v35 + 32))(v4 + OBJC_IVAR____TtC15SSHPacketTunnel21TCPPacketTunnelClient_logger, v30, v36);
    swift_retain();
    sub_10000BB84((uint64_t)sub_100013E08);
    NWConnection.stateUpdateHandler.setter();
    swift_release();
    uint64_t v31 = *(void (**)(uint64_t, uint64_t))(v49 + 8);
    v31(v46, v19);
    v31(v45, v19);
    swift_release();
  }
  return v4;
}

uint64_t type metadata accessor for TCPPacketTunnelClient()
{
  uint64_t result = qword_100029570;
  if (!qword_100029570) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_100013E0C(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for NWConnection.State();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = __chkstk_darwin(v3);
  uint64_t v7 = (char *)v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v9 = (char *)v22 - v8;
  uint64_t v26 = *(void (**)(char *, uint64_t, uint64_t))(v4 + 16);
  v26((char *)v22 - v8, a1, v3);
  uint64_t v10 = Logger.logObject.getter();
  os_log_type_t v11 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = swift_slowAlloc();
    uint64_t v23 = a1;
    uint64_t v13 = (uint8_t *)v12;
    uint64_t v14 = swift_slowAlloc();
    uint64_t v25 = v1;
    uint64_t v28 = v14;
    uint64_t v24 = v4;
    *(_DWORD *)uint64_t v13 = 136315138;
    v22[1] = v13 + 4;
    sub_100014DB4(&qword_100028B58, (void (*)(uint64_t))&type metadata accessor for NWConnection.State);
    uint64_t v15 = dispatch thunk of CustomStringConvertible.description.getter();
    uint64_t v27 = sub_1000094CC(v15, v16, &v28);
    uint64_t v4 = v24;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    uint64_t v17 = *(void (**)(char *, uint64_t))(v4 + 8);
    v17(v9, v3);
    _os_log_impl((void *)&_mh_execute_header, v10, v11, "NWConnection in state %s", v13, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    a1 = v23;
    swift_slowDealloc();
  }
  else
  {

    uint64_t v17 = *(void (**)(char *, uint64_t))(v4 + 8);
    v17(v9, v3);
  }
  v26(v7, a1, v3);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v4 + 88))(v7, v3);
  if (result == enum case for NWConnection.State.waiting(_:)
    || result == enum case for NWConnection.State.failed(_:))
  {
    v17(v7, v3);
    return sub_1000148C8();
  }
  if (result != enum case for NWConnection.State.setup(_:)
    && result != enum case for NWConnection.State.preparing(_:)
    && result != enum case for NWConnection.State.ready(_:))
  {
    if (result != enum case for NWConnection.State.cancelled(_:)) {
      return ((uint64_t (*)(char *, uint64_t))v17)(v7, v3);
    }
    return sub_1000148C8();
  }
  return result;
}

void sub_100014190()
{
}

void sub_1000141BC()
{
}

uint64_t sub_1000141E0()
{
  uint64_t v2 = v0;
  type metadata accessor for TCPPacketTunnel();
  uint64_t v4 = *(void *)(v0 + 16);
  uint64_t v3 = *(void *)(v0 + 24);
  swift_retain();
  swift_retain();
  uint64_t v5 = sub_1000151B8(v3, v4);
  uint64_t v6 = *(uint64_t (**)(uint64_t (*)(), uint64_t))(*(void *)v4 + 240);
  swift_retain();
  uint64_t v7 = v6(sub_10001432C, v5);
  uint64_t v9 = v8;
  swift_release();
  if (!v1)
  {
    sub_10000A184(v7, v9);
    swift_bridgeObjectRelease();
    uint64_t v11 = NWConnection.start(queue:)();
    (*(void (**)(uint64_t))(*(void *)v5 + 128))(v11);
    *(void *)(v2 + 32) = v5;
  }
  return swift_release();
}

uint64_t sub_10001432C()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 136))();
}

uint64_t sub_100014350()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for NWConnection.State();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  uint64_t v6 = (char *)v31 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)v31 - v7;
  NWConnection.state.getter();
  int v9 = (*(uint64_t (**)(char *, uint64_t))(v3 + 88))(v8, v2);
  BOOL v11 = v9 == enum case for NWConnection.State.setup(_:)
     || v9 == enum case for NWConnection.State.preparing(_:)
     || v9 == enum case for NWConnection.State.ready(_:);
  p_prots = &OBJC_PROTOCOL___NSObject.prots;
  if (v11)
  {
    swift_retain_n();
    uint64_t v13 = Logger.logObject.getter();
    os_log_type_t v14 = static os_log_type_t.fault.getter();
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v15 = (uint8_t *)swift_slowAlloc();
      uint64_t v32 = swift_slowAlloc();
      v33[0] = v32;
      *(_DWORD *)uint64_t v15 = 136315138;
      v31[1] = v15 + 4;
      NWConnection.state.getter();
      sub_100014DB4(&qword_100028B58, (void (*)(uint64_t))&type metadata accessor for NWConnection.State);
      uint64_t v16 = dispatch thunk of CustomStringConvertible.description.getter();
      unint64_t v18 = v17;
      (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
      uint64_t v34 = sub_1000094CC(v16, v18, v33);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v13, v14, "NWConnection in state %s at deinit", v15, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      p_prots = (__objc2_prot_list **)(&OBJC_PROTOCOL___NSObject + 16);
      swift_slowDealloc();
    }
    else
    {

      uint64_t v19 = swift_release_n();
    }
  }
  else
  {
    uint64_t v19 = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v8, v2);
  }
  (*(void (**)(uint64_t))(**(void **)(v1 + 16) + 152))(v19);
  if (v20)
  {
    swift_bridgeObjectRelease();
    swift_retain_n();
    uint64_t v21 = Logger.logObject.getter();
    os_log_type_t v22 = static os_log_type_t.fault.getter();
    if (os_log_type_enabled(v21, v22))
    {
      uint64_t v23 = (uint8_t *)swift_slowAlloc();
      uint64_t v34 = swift_slowAlloc();
      *(_DWORD *)uint64_t v23 = 136315138;
      v33[0] = (*(uint64_t (**)(void))(**(void **)(v1 + 16) + 152))();
      v33[1] = v24;
      sub_100014D60();
      uint64_t v25 = dispatch thunk of CustomStringConvertible.description.getter();
      unint64_t v27 = v26;
      swift_bridgeObjectRelease();
      v33[0] = sub_1000094CC(v25, v27, &v34);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v21, v22, "Utun in state %s at deinit, not disconnected.", v23, 0xCu);
      swift_arrayDestroy();
      p_prots = (__objc2_prot_list **)(&OBJC_PROTOCOL___NSObject + 16);
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_release_n();
    }
  }
  swift_release();
  swift_release();
  swift_release();

  uint64_t v28 = (char *)p_prots[173] + v1;
  uint64_t v29 = type metadata accessor for Logger();
  (*(void (**)(char *, uint64_t))(*(void *)(v29 - 8) + 8))(v28, v29);

  return v1;
}

uint64_t sub_100014870()
{
  sub_100014350();

  return swift_deallocClassInstance();
}

Swift::Int sub_1000148C8()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for NWConnection.State();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  NWConnection.state.getter();
  int v6 = (*(uint64_t (**)(char *, uint64_t))(v3 + 88))(v5, v2);
  if (v6 == enum case for NWConnection.State.waiting(_:) || v6 == enum case for NWConnection.State.failed(_:))
  {
LABEL_9:
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    goto LABEL_10;
  }
  if (v6 != enum case for NWConnection.State.cancelled(_:))
  {
    uint64_t v8 = Logger.logObject.getter();
    os_log_type_t v9 = static os_log_type_t.fault.getter();
    if (os_log_type_enabled(v8, v9))
    {
      uint64_t v10 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, v9, "Shutting down utun before NWConnection is shut down", v10, 2u);
      swift_slowDealloc();
    }

    goto LABEL_9;
  }
LABEL_10:
  uint64_t v11 = sub_10000A260();
  (*(void (**)(uint64_t))(**(void **)(v1 + 16) + 272))(v11);
  return OS_dispatch_semaphore.signal()();
}

unint64_t sub_100014D60()
{
  unint64_t result = qword_100028B78;
  if (!qword_100028B78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028B78);
  }
  return result;
}

uint64_t sub_100014DB4(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100014DFC()
{
  return type metadata accessor for TCPPacketTunnelClient();
}

uint64_t sub_100014E04()
{
  uint64_t result = type metadata accessor for Logger();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

id sub_100014EBC()
{
  uint64_t v1 = type metadata accessor for Logger();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin();
  uint64_t v4 = (char *)v19 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v5 = [objc_allocWithZone((Class)NSTask) init];
  NSString v6 = String._bridgeToObjectiveC()();
  [v5 setLaunchPath:v6];

  Class isa = Array._bridgeToObjectiveC()().super.isa;
  [v5 setArguments:isa];

  [v5 launch];
  pid_t v8 = getpgid((pid_t)[v5 processIdentifier]);
  if (tcsetpgrp(0, v8))
  {
    uint64_t v9 = sub_10000E1B0();
    (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v4, v9, v1);
    uint64_t v10 = Logger.logObject.getter();
    os_log_type_t v11 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v10, v11))
    {
      uint64_t v21 = v0;
      uint64_t v12 = (uint8_t *)swift_slowAlloc();
      uint64_t v13 = swift_slowAlloc();
      uint64_t v20 = v1;
      os_log_type_t v14 = (void *)v13;
      *(_DWORD *)uint64_t v12 = 138412290;
      v19[1] = v12 + 4;
      int v15 = errno.getter();
      sub_100009B90();
      swift_allocError();
      _DWORD *v16 = v15;
      uint64_t v17 = _swift_stdlib_bridgeErrorToNSError();
      uint64_t v22 = v17;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      void *v14 = v17;
      _os_log_impl((void *)&_mh_execute_header, v10, v11, "Failed to set sudo process to foreground: %@", v12, 0xCu);
      sub_100008E28(&qword_100028D90);
      swift_arrayDestroy();
      uint64_t v1 = v20;
      swift_slowDealloc();
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  }
  kill((pid_t)[v5 processIdentifier], 19);
  return v5;
}

uint64_t sub_1000151B8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = swift_allocObject();
  sub_100015208(a1, a2);
  return v4;
}

uint64_t sub_100015208(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v23 = a2;
  uint64_t v24 = a1;
  uint64_t v4 = type metadata accessor for Logger();
  uint64_t v25 = *(void *)(v4 - 8);
  uint64_t v26 = v4;
  __chkstk_darwin(v4);
  uint64_t v22 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
  uint64_t v20 = *(void *)(v6 - 8);
  uint64_t v21 = v6;
  __chkstk_darwin(v6);
  pid_t v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for OS_dispatch_queue.Attributes();
  __chkstk_darwin(v9);
  uint64_t v10 = type metadata accessor for DispatchQoS();
  __chkstk_darwin(v10 - 8);
  unint64_t v19 = sub_10000A5DC();
  unint64_t v27 = 0;
  unint64_t v28 = 0xE000000000000000;
  _StringGuts.grow(_:)(18);
  os_log_type_t v11 = (void **)sub_10000DCA0();
  uint64_t v12 = *v11;
  unint64_t v13 = (unint64_t)v11[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  unint64_t v27 = v12;
  unint64_t v28 = v13;
  v14._object = (void *)0x8000000100020F90;
  v14._countAndFlagsBits = 0xD000000000000010;
  String.append(_:)(v14);
  static DispatchQoS.unspecified.getter();
  unint64_t v27 = &_swiftEmptyArrayStorage;
  sub_1000167AC(&qword_100028A28, (void (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes);
  sub_100008E28(&qword_100028A30);
  sub_10001339C();
  dispatch thunk of SetAlgebra.init<A>(_:)();
  (*(void (**)(char *, void, uint64_t))(v20 + 104))(v8, enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:), v21);
  *(void *)(v2 + 32) = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
  uint64_t v15 = OBJC_IVAR____TtC15SSHPacketTunnel15TCPPacketTunnel_exitSemaphore;
  *(void *)(v3 + v15) = dispatch_semaphore_create(0);
  uint64_t v16 = v24;
  *(void *)(v3 + 16) = v23;
  *(void *)(v3 + 24) = v16;
  swift_bridgeObjectRetain();
  uint64_t v17 = v22;
  Logger.init(subsystem:category:)();
  (*(void (**)(uint64_t, char *, uint64_t))(v25 + 32))(v3 + OBJC_IVAR____TtC15SSHPacketTunnel15TCPPacketTunnel_logger, v17, v26);
  return v3;
}

uint64_t sub_100015588()
{
  swift_retain();
  NWConnection.receive(minimumIncompleteLength:maximumLength:completion:)();

  return swift_release();
}

void sub_1000155EC(uint64_t a1, unint64_t a2, uint64_t a3, char a4, uint64_t a5)
{
}

uint64_t sub_1000155F8(uint64_t a1, unint64_t a2)
{
  uint64_t v19 = a1;
  uint64_t v4 = type metadata accessor for NWConnection.SendCompletion();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v6 = (uint64_t (**)(uint64_t))((char *)v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  LODWORD(v7) = 0;
  switch(a2 >> 62)
  {
    case 1uLL:
      LODWORD(v7) = HIDWORD(v19) - v19;
      if (__OFSUB__(HIDWORD(v19), v19))
      {
        __break(1u);
LABEL_10:
        __break(1u);
      }
      unint64_t v7 = (int)v7;
LABEL_6:
      if ((v7 & 0x8000000000000000) != 0 || v7 >= 0x10000)
      {
        _assertionFailure(_:_:file:line:flags:)();
        __break(1u);
        JUMPOUT(0x100015958);
      }
LABEL_8:
      __int16 __src = bswap32(v7) >> 16;
      uint64_t v11 = sub_10001647C(&__src, &v21);
      unint64_t v13 = v12 & 0xFFFFFFFFFFFFFFLL;
      v16[0] = *(void *)(v2 + 24);
      *uint64_t v6 = sub_100016540;
      v6[1] = (uint64_t (*)(uint64_t))v2;
      unsigned int v18 = enum case for NWConnection.SendCompletion.contentProcessed(_:);
      uint64_t v17 = *(void (**)(uint64_t (**)(uint64_t)))(v5 + 104);
      v17(v6);
      v16[1] = type metadata accessor for NWConnection.ContentContext();
      sub_100016564(v11, v13);
      swift_retain();
      void v16[2] = a2;
      static NWConnection.ContentContext.defaultMessage.getter();
      NWConnection.send(content:contentContext:isComplete:completion:)();
      swift_release();
      sub_100009B38(v11, v13);
      Swift::String v14 = *(void (**)(uint64_t (**)(uint64_t), uint64_t))(v5 + 8);
      v14(v6, v4);
      *uint64_t v6 = sub_1000165BC;
      v6[1] = (uint64_t (*)(uint64_t))v2;
      ((void (*)(uint64_t (**)(uint64_t), void, uint64_t))v17)(v6, v18, v4);
      swift_retain();
      static NWConnection.ContentContext.defaultMessage.getter();
      NWConnection.send(content:contentContext:isComplete:completion:)();
      swift_release();
      sub_100009B38(v11, v13);
      return ((uint64_t (*)(uint64_t (**)(uint64_t), uint64_t))v14)(v6, v4);
    case 2uLL:
      uint64_t v9 = *(void *)(v19 + 16);
      uint64_t v8 = *(void *)(v19 + 24);
      BOOL v10 = __OFSUB__(v8, v9);
      unint64_t v7 = v8 - v9;
      if (!v10) {
        goto LABEL_6;
      }
      goto LABEL_10;
    case 3uLL:
      goto LABEL_8;
    default:
      LODWORD(v7) = BYTE6(a2);
      goto LABEL_8;
  }
}

uint64_t sub_100015968(uint64_t a1, uint64_t a2, const char *a3)
{
  uint64_t v6 = sub_100008E28(&qword_100028D58);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for NWError();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = __chkstk_darwin(v9);
  unint64_t v13 = (char *)&v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  uint64_t v15 = (char *)&v24 - v14;
  sub_1000166E4(a1, (uint64_t)v8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1) {
    return sub_10001674C((uint64_t)v8);
  }
  (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v15, v8, v9);
  uint64_t v17 = *(void (**)(char *, char *, uint64_t))(v10 + 16);
  v17(v13, v15, v9);
  unsigned int v18 = Logger.logObject.getter();
  os_log_type_t v19 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v18, v19))
  {
    unint64_t v27 = a3;
    uint64_t v20 = (uint8_t *)swift_slowAlloc();
    uint64_t v25 = (void *)swift_slowAlloc();
    uint64_t v28 = a2;
    uint64_t v26 = v20;
    *(_DWORD *)uint64_t v20 = 138412290;
    uint64_t v24 = v20 + 4;
    sub_1000167AC((unint64_t *)&unk_100028D60, (void (*)(uint64_t))&type metadata accessor for NWError);
    swift_allocError();
    v17(v21, v13, v9);
    uint64_t v22 = _swift_stdlib_bridgeErrorToNSError();
    uint64_t v29 = v22;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *uint64_t v25 = v22;
    uint64_t v23 = *(void (**)(char *, uint64_t))(v10 + 8);
    v23(v13, v9);
    _os_log_impl((void *)&_mh_execute_header, v18, v19, v27, v26, 0xCu);
    sub_100008E28(&qword_100028D90);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    uint64_t v23 = *(void (**)(char *, uint64_t))(v10 + 8);
    v23(v13, v9);
  }
  NWConnection.cancel()();
  return ((uint64_t (*)(char *, uint64_t))v23)(v15, v9);
}

uint64_t sub_100015CE4()
{
  swift_release();
  swift_release();

  uint64_t v1 = v0 + OBJC_IVAR____TtC15SSHPacketTunnel15TCPPacketTunnel_logger;
  uint64_t v2 = type metadata accessor for Logger();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);

  return swift_deallocClassInstance();
}

void sub_100015DAC(uint64_t a1, unint64_t a2, char a3, uint64_t a4)
{
  uint64_t v8 = sub_100008E28(&qword_100028D58);
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (char *)&v44 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for NWError();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = __chkstk_darwin(v11);
  uint64_t v15 = (char *)&v44 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  uint64_t v17 = (char *)&v44 - v16;
  if (a3)
  {
    unsigned int v18 = Logger.logObject.getter();
    os_log_type_t v19 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v18, v19))
    {
      uint64_t v20 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v20 = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, v19, "TCP connection closed when reading header", v20, 2u);
      swift_slowDealloc();
    }

    NWConnection.cancel()();
    return;
  }
  sub_1000166E4(a4, (uint64_t)v10);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11) != 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v17, v10, v11);
    uint64_t v24 = *(void (**)(char *, char *, uint64_t))(v12 + 16);
    v24(v15, v17, v11);
    uint64_t v25 = Logger.logObject.getter();
    os_log_type_t v26 = static os_log_type_t.error.getter();
    int v27 = v26;
    if (os_log_type_enabled(v25, v26))
    {
      uint64_t v28 = swift_slowAlloc();
      int v47 = v27;
      uint64_t v29 = (uint8_t *)v28;
      uint64_t v45 = (void *)swift_slowAlloc();
      uint64_t v46 = v29;
      *(_DWORD *)uint64_t v29 = 138412290;
      uint64_t v44 = v29 + 4;
      sub_1000167AC((unint64_t *)&unk_100028D60, (void (*)(uint64_t))&type metadata accessor for NWError);
      swift_allocError();
      v24(v30, v15, v11);
      uint64_t v31 = _swift_stdlib_bridgeErrorToNSError();
      uint64_t v48 = v31;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *uint64_t v45 = v31;
      uint64_t v32 = *(void (**)(char *, uint64_t))(v12 + 8);
      v32(v15, v11);
      _os_log_impl((void *)&_mh_execute_header, v25, (os_log_type_t)v47, "TCP connection error %@ when reading header, shutting down...", v46, 0xCu);
      sub_100008E28(&qword_100028D90);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      uint64_t v32 = *(void (**)(char *, uint64_t))(v12 + 8);
      v32(v15, v11);
    }
    NWConnection.cancel()();
    v32(v17, v11);
    return;
  }
  sub_10001674C((uint64_t)v10);
  if (a2 >> 60 == 15)
  {
    uint64_t v21 = Logger.logObject.getter();
    os_log_type_t v22 = static os_log_type_t.fault.getter();
    if (os_log_type_enabled(v21, v22))
    {
      uint64_t v23 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v23 = 0;
      _os_log_impl((void *)&_mh_execute_header, v21, v22, "No error on connection, but Data was nil when reading header", v23, 2u);
      swift_slowDealloc();
    }

    return;
  }
  unint64_t v33 = a2 >> 62;
  switch(a2 >> 62)
  {
    case 1uLL:
      if (__OFSUB__(HIDWORD(a1), a1))
      {
        __break(1u);
LABEL_38:
        __break(1u);
        goto LABEL_39;
      }
      uint64_t v37 = HIDWORD(a1) - (int)a1;
LABEL_22:
      sub_100016564(a1, a2);
      if (v37 == 2)
      {
LABEL_23:
        if (!v33) {
          goto LABEL_36;
        }
        if (v33 != 1)
        {
          uint64_t v40 = *(void *)(a1 + 16);
          uint64_t v41 = *(void *)(a1 + 24);
          swift_retain();
          swift_retain();
          uint64_t v42 = __DataStorage._bytes.getter();
          if (v42)
          {
            uint64_t v43 = __DataStorage._offset.getter();
            if (__OFSUB__(v40, v43)) {
              goto LABEL_42;
            }
            v42 += v40 - v43;
          }
          if (!__OFSUB__(v41, v40))
          {
            __DataStorage._length.getter();
            if (v42)
            {
              swift_release();
              swift_release();
              goto LABEL_36;
            }
            goto LABEL_44;
          }
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
        }
        if ((int)a1 <= a1 >> 32)
        {
          if (__DataStorage._bytes.getter())
          {
            if (!__OFSUB__((int)a1, __DataStorage._offset.getter()))
            {
              __DataStorage._length.getter();
LABEL_36:
              swift_retain();
              NWConnection.receive(minimumIncompleteLength:maximumLength:completion:)();
              sub_100009B24(a1, a2);
              swift_release();
              return;
            }
            goto LABEL_41;
          }
          __DataStorage._length.getter();
          __break(1u);
LABEL_44:
          __break(1u);
          JUMPOUT(0x10001646CLL);
        }
LABEL_39:
        __break(1u);
        goto LABEL_40;
      }
LABEL_14:
      uint64_t v34 = Logger.logObject.getter();
      os_log_type_t v35 = static os_log_type_t.fault.getter();
      if (os_log_type_enabled(v34, v35))
      {
        uint64_t v36 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v36 = 0;
        _os_log_impl((void *)&_mh_execute_header, v34, v35, "Header read guaranteed to be length 2 by Network.framework", v36, 2u);
        swift_slowDealloc();
      }
      sub_100009B24(a1, a2);

      return;
    case 2uLL:
      uint64_t v39 = *(void *)(a1 + 16);
      uint64_t v38 = *(void *)(a1 + 24);
      uint64_t v37 = v38 - v39;
      if (!__OFSUB__(v38, v39)) {
        goto LABEL_22;
      }
      goto LABEL_38;
    case 3uLL:
      goto LABEL_14;
    default:
      if (BYTE6(a2) != 2) {
        goto LABEL_14;
      }
      goto LABEL_23;
  }
}

uint64_t sub_10001647C(unsigned char *__src, unsigned char *a2)
{
  if (__src) {
    unint64_t v2 = a2 - __src;
  }
  else {
    unint64_t v2 = 0;
  }
  if ((v2 & 0x8000000000000000) != 0)
  {
    __break(1u);
LABEL_11:
    __break(1u);
  }
  if (v2 > 0xFF) {
    goto LABEL_11;
  }
  memset(__dst, 0, sizeof(__dst));
  char v5 = v2;
  if (__src && a2 != __src) {
    memcpy(__dst, __src, a2 - __src);
  }
  return *(void *)__dst;
}

uint64_t sub_100016540(uint64_t a1)
{
  return sub_100015968(a1, v1, "Failed to send message header %@. Shutting down connection.");
}

uint64_t sub_100016564(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_retain();
  }

  return swift_retain();
}

uint64_t sub_1000165BC(uint64_t a1)
{
  return sub_100015968(a1, v1, "Failed to send message %@. Shutting down connection.");
}

uint64_t sub_1000165E0()
{
  return type metadata accessor for TCPPacketTunnel();
}

uint64_t type metadata accessor for TCPPacketTunnel()
{
  uint64_t result = qword_100029590;
  if (!qword_100029590) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_100016634()
{
  uint64_t result = type metadata accessor for Logger();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_1000166E4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100008E28(&qword_100028D58);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10001674C(uint64_t a1)
{
  uint64_t v2 = sub_100008E28(&qword_100028D58);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1000167AC(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

void sub_1000167F4(uint64_t a1, unint64_t a2, uint64_t a3, char a4, uint64_t a5)
{
}

void sub_100016800(uint64_t a1, unint64_t a2, char a3, uint64_t a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = sub_100008E28(&qword_100028D58);
  __chkstk_darwin(v10 - 8);
  uint64_t v12 = (char *)v34 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for NWError();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = __chkstk_darwin(v13);
  uint64_t v17 = (char *)v34 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15);
  os_log_type_t v19 = (char *)v34 - v18;
  if (a3)
  {
    uint64_t v20 = Logger.logObject.getter();
    os_log_type_t v21 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v20, v21))
    {
      os_log_type_t v22 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)os_log_type_t v22 = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, v21, "TCP connection closed when reading message", v22, 2u);
      swift_slowDealloc();
    }

    NWConnection.cancel()();
  }
  else
  {
    sub_1000166E4(a4, (uint64_t)v12);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13) == 1)
    {
      sub_10001674C((uint64_t)v12);
      if (a2 >> 60 == 15)
      {
        uint64_t v23 = Logger.logObject.getter();
        os_log_type_t v24 = static os_log_type_t.fault.getter();
        if (os_log_type_enabled(v23, v24))
        {
          uint64_t v25 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v25 = 0;
          _os_log_impl((void *)&_mh_execute_header, v23, v24, "No error on connection, but Data was nil when reading header", v25, 2u);
          swift_slowDealloc();
        }
      }
      else
      {
        unint64_t v33 = *(void (**)(uint64_t, unint64_t))(**(void **)(v5 + 16) + 264);
        sub_100016564(a1, a2);
        v33(a1, a2);
        swift_retain();
        NWConnection.receive(minimumIncompleteLength:maximumLength:completion:)();
        swift_release();
        sub_100009B24(a1, a2);
      }
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v19, v12, v13);
      os_log_type_t v26 = *(void (**)(char *, char *, uint64_t))(v14 + 16);
      v26(v17, v19, v13);
      int v27 = Logger.logObject.getter();
      os_log_type_t v28 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v27, v28))
      {
        uint64_t v37 = v5;
        uint64_t v29 = (uint8_t *)swift_slowAlloc();
        os_log_type_t v35 = (void *)swift_slowAlloc();
        uint64_t v36 = v29;
        *(_DWORD *)uint64_t v29 = 138412290;
        v34[1] = v29 + 4;
        sub_1000167AC((unint64_t *)&unk_100028D60, (void (*)(uint64_t))&type metadata accessor for NWError);
        swift_allocError();
        v26(v30, v17, v13);
        uint64_t v31 = _swift_stdlib_bridgeErrorToNSError();
        uint64_t v38 = v31;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        *os_log_type_t v35 = v31;
        uint64_t v32 = *(void (**)(char *, uint64_t))(v14 + 8);
        v32(v17, v13);
        _os_log_impl((void *)&_mh_execute_header, v27, v28, "TCP connection error %@ when reading message, shutting down...", v36, 0xCu);
        sub_100008E28(&qword_100028D90);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {

        uint64_t v32 = *(void (**)(char *, uint64_t))(v14 + 8);
        v32(v17, v13);
      }
      NWConnection.cancel()();
      v32(v19, v13);
    }
  }
}

uint64_t sub_100016D24(uint64_t a1, unint64_t a2, NSObject *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v148 = a4;
  uint64_t v149 = a5;
  os_log_t v151 = a3;
  uint64_t v146 = a1;
  unint64_t v147 = a2;
  uint64_t v5 = type metadata accessor for NWEndpoint.Host();
  __chkstk_darwin(v5 - 8);
  uint64_t v139 = (uint64_t)&v120 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for IPv6Address();
  uint64_t v150 = *(void *)(v7 - 8);
  uint64_t v8 = __chkstk_darwin(v7);
  unint64_t v125 = (char *)&v120 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __chkstk_darwin(v8);
  uint64_t v131 = (char *)&v120 - v11;
  uint64_t v12 = __chkstk_darwin(v10);
  unint64_t v138 = (char *)&v120 - v13;
  uint64_t v14 = __chkstk_darwin(v12);
  uint64_t v137 = (char *)&v120 - v15;
  uint64_t v16 = __chkstk_darwin(v14);
  uint64_t v18 = (char *)&v120 - v17;
  __chkstk_darwin(v16);
  uint64_t v20 = (char *)&v120 - v19;
  uint64_t v21 = type metadata accessor for NWEndpoint.Port();
  uint64_t v22 = *(void *)(v21 - 8);
  uint64_t v23 = __chkstk_darwin(v21);
  unint64_t v130 = (char *)&v120 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = __chkstk_darwin(v23);
  uint64_t v134 = (char *)&v120 - v26;
  __chkstk_darwin(v25);
  os_log_type_t v28 = (char *)&v120 - v27;
  uint64_t v29 = type metadata accessor for Logger();
  uint64_t v30 = *(void *)(v29 - 8);
  uint64_t v31 = __chkstk_darwin(v29);
  unint64_t v126 = (char *)&v120 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v33 = __chkstk_darwin(v31);
  unint64_t v124 = (char *)&v120 - v34;
  __chkstk_darwin(v33);
  uint64_t v36 = (uint64_t (*)(char *, uint64_t))((char *)&v120 - v35);
  uint64_t v37 = sub_10000E1B0();
  uint64_t v144 = v30;
  uint64_t v38 = *(void (**)(char *, uint64_t, uint64_t))(v30 + 16);
  uint64_t v128 = v37;
  uint64_t v145 = v29;
  uint64_t v129 = v30 + 16;
  uint64_t v127 = v38;
  ((void (*)(uint64_t (*)(char *, uint64_t)))v38)(v36);
  uint64_t v143 = v22;
  uint64_t v39 = v22 + 16;
  uint64_t v40 = *(void (**)(char *, os_log_t, void **))(v22 + 16);
  unint64_t v41 = v147;
  uint64_t v152 = (void **)v21;
  uint64_t v141 = v40;
  uint64_t v142 = v39;
  v40(v28, v151, (void **)v21);
  uint64_t v42 = v36;
  uint64_t v44 = v150 + 16;
  uint64_t v43 = *(void (**)(char *, uint64_t, uint64_t))(v150 + 16);
  uint64_t v45 = v20;
  v43(v20, v148, v7);
  uint64_t v133 = (uint64_t)v18;
  uint64_t v153 = v7;
  v43(v18, v149, v7);
  swift_bridgeObjectRetain_n();
  uint64_t v132 = v42;
  uint64_t v46 = Logger.logObject.getter();
  os_log_type_t v47 = static os_log_type_t.info.getter();
  BOOL v48 = os_log_type_enabled(v46, v47);
  uint64_t v135 = v44;
  uint64_t v136 = v43;
  if (v48)
  {
    uint64_t v49 = swift_slowAlloc();
    os_log_t v120 = v46;
    uint64_t v50 = v49;
    uint64_t v121 = swift_slowAlloc();
    uint64_t v155 = v121;
    *(_DWORD *)uint64_t v50 = 136315906;
    swift_bridgeObjectRetain();
    uint64_t v154 = sub_1000094CC(v146, v41, &v155);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v50 + 12) = 2080;
    uint64_t v51 = NWEndpoint.Port.debugDescription.getter();
    uint64_t v154 = sub_1000094CC(v51, v52, &v155);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    Swift::String v122 = *(void (**)(char *, void **))(v143 + 8);
    v122(v28, v152);
    *(_WORD *)(v50 + 22) = 2080;
    uint64_t v53 = IPv6Address.debugDescription.getter();
    uint64_t v154 = sub_1000094CC(v53, v54, &v155);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    os_log_type_t v55 = v47;
    id v56 = *(void (**)(char *, uint64_t))(v150 + 8);
    v56(v45, v153);
    *(_WORD *)(v50 + 32) = 2080;
    uint64_t v57 = v133;
    uint64_t v58 = IPv6Address.debugDescription.getter();
    uint64_t v154 = sub_1000094CC(v58, v59, &v155);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    unint64_t v123 = v56;
    v56((char *)v57, v153);
    os_log_t v60 = v120;
    _os_log_impl((void *)&_mh_execute_header, v120, v55, "SSH tunnel callback started. Connecting to %s:%s and creating a utun from %s -> %s", (uint8_t *)v50, 0x2Au);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_bridgeObjectRelease_n();
    Swift::String v122 = *(void (**)(char *, void **))(v143 + 8);
    v122(v28, v152);
    uint64_t v62 = *(void (**)(char *, uint64_t))(v150 + 8);
    uint64_t v63 = v153;
    v62(v45, v153);
    unint64_t v123 = v62;
    v62((char *)v133, v63);
  }
  uint64_t v61 = (char *)v132;
  uint64_t v132 = *(uint64_t (**)(char *, uint64_t))(v144 + 8);
  v132(v61, v145);
  os_log_t v64 = v151;
  unint64_t v65 = v141;
  uint64_t v133 = type metadata accessor for TCPPacketTunnelClient();
  swift_bridgeObjectRetain();
  uint64_t v66 = v139;
  NWEndpoint.Host.init(_:)();
  uint64_t v67 = (uint64_t)v134;
  v65(v134, v64, v152);
  uint64_t v69 = v136;
  uint64_t v68 = (uint64_t)v137;
  uint64_t v70 = v153;
  v136(v137, v148, v153);
  uint64_t v71 = (uint64_t)v138;
  v69(v138, v149, v70);
  sub_1000133F8();
  unint64_t v72 = v140;
  uint64_t result = sub_100013400(v66, v67, v68, v71);
  if (!v72)
  {
    uint64_t v74 = (void **)result;
    os_log_t v75 = v151;
    long long v76 = v152;
    uint64_t v77 = v69;
    uint64_t v78 = (*(uint64_t (**)(void))(*(void *)result + 176))();
    uint64_t v79 = (*(uint64_t (**)(uint64_t))(*v74[2] + 176))(v78);
    if (v80) {
      uint64_t v81 = v79;
    }
    else {
      uint64_t v81 = 1853191285;
    }
    if (v80) {
      unint64_t v82 = v80;
    }
    else {
      unint64_t v82 = 0xE400000000000000;
    }
    uint64_t v83 = v124;
    v127(v124, v128, v145);
    os_log_t v84 = v75;
    unint64_t v85 = v82;
    unint64_t v86 = v76;
    uint64_t v87 = v81;
    v141(v130, v84, v86);
    uint64_t v88 = v153;
    v77(v131, v148, v153);
    unint64_t v89 = v125;
    v77(v125, v149, v88);
    unint64_t v90 = v147;
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    pid_t v91 = Logger.logObject.getter();
    os_log_type_t v92 = static os_log_type_t.info.getter();
    os_log_t v151 = v91;
    LODWORD(v149) = v92;
    BOOL v93 = os_log_type_enabled(v91, v92);
    uint64_t v139 = v87;
    unint64_t v140 = v85;
    if (v93)
    {
      uint64_t v94 = swift_slowAlloc();
      uint64_t v148 = swift_slowAlloc();
      uint64_t v155 = v148;
      *(_DWORD *)uint64_t v94 = 136316162;
      swift_bridgeObjectRetain();
      uint64_t v154 = sub_1000094CC(v146, v90, &v155);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v94 + 12) = 2080;
      uint64_t v95 = v87;
      int v96 = v130;
      uint64_t v97 = NWEndpoint.Port.debugDescription.getter();
      uint64_t v154 = sub_1000094CC(v97, v98, &v155);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      v122(v96, v152);
      *(_WORD *)(v94 + 22) = 2080;
      swift_bridgeObjectRetain();
      uint64_t v154 = sub_1000094CC(v95, v85, &v155);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v94 + 32) = 2080;
      uint64_t v99 = v131;
      uint64_t v100 = IPv6Address.debugDescription.getter();
      uint64_t v154 = sub_1000094CC(v100, v101, &v155);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      uint64_t v152 = v74;
      os_log_type_t v102 = v99;
      uint64_t v103 = v153;
      uint64_t v104 = v123;
      v123(v102, v153);
      *(_WORD *)(v94 + 42) = 2080;
      uint64_t v105 = v125;
      uint64_t v106 = IPv6Address.debugDescription.getter();
      uint64_t v154 = sub_1000094CC(v106, v107, &v155);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      v104(v105, v103);
      os_log_t v108 = v151;
      uint64_t v74 = v152;
      uint64_t v109 = v144;
      _os_log_impl((void *)&_mh_execute_header, v151, (os_log_type_t)v149, "SSH tunnel connected to %s:%s on %s from %s -> %s.", (uint8_t *)v94, 0x34u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      uint64_t v110 = *(uint64_t (**)(char *, uint64_t))(v109 + 8);
      uint64_t v111 = v110(v124, v145);
    }
    else
    {
      swift_bridgeObjectRelease_n();
      v122(v130, v152);
      swift_bridgeObjectRelease_n();
      uint64_t v112 = v153;
      Swift::String v113 = v123;
      v123(v131, v153);
      v113(v89, v112);

      uint64_t v110 = v132;
      uint64_t v111 = v132(v83, v145);
    }
    ((void (*)(uint64_t))(*v74)[20])(v111);
    unint64_t v114 = v126;
    v127(v126, v128, v145);
    unint64_t v115 = v140;
    swift_bridgeObjectRetain();
    BOOL v116 = Logger.logObject.getter();
    os_log_type_t v117 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v116, v117))
    {
      Swift::String v118 = (uint8_t *)swift_slowAlloc();
      uint64_t v119 = swift_slowAlloc();
      uint64_t v132 = v110;
      uint64_t v155 = v119;
      *(_DWORD *)Swift::String v118 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v154 = sub_1000094CC(v139, v115, &v155);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v116, v117, "SSH tunnel exited. %s is now closed.", v118, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
      swift_release();

      return v132(v126, v145);
    }
    else
    {

      swift_release();
      swift_bridgeObjectRelease_n();
      return v110(v114, v145);
    }
  }
  return result;
}

uint64_t NWListener.State.description.getter()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for NWListener.State();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v1, v2);
  int v6 = (*(uint64_t (**)(char *, uint64_t))(v3 + 88))(v5, v2);
  if (v6 == enum case for NWListener.State.waiting(_:))
  {
    uint64_t v7 = 0x676E6974696177;
  }
  else if (v6 == enum case for NWListener.State.failed(_:))
  {
    uint64_t v7 = 0x64656C696166;
  }
  else
  {
    if (v6 == enum case for NWListener.State.setup(_:)) {
      return 0x7075746573;
    }
    if (v6 == enum case for NWListener.State.ready(_:)) {
      return 0x7964616572;
    }
    if (v6 == enum case for NWListener.State.cancelled(_:)) {
      return 0x656C6C65636E6163;
    }
    uint64_t v7 = 0x6E776F6E6B6E75;
  }
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return v7;
}

unint64_t sub_100017D70(unint64_t a1)
{
  switch(a1 >> 62)
  {
    case 1uLL:
      unint64_t v8 = 0;
      swift_errorRetain();
      _StringGuts.grow(_:)(34);
      unint64_t v3 = 0xD000000000000020;
      uint64_t v4 = "Could not configure UtunSocket: ";
      goto LABEL_6;
    case 2uLL:
      unint64_t v8 = 0;
      swift_errorRetain();
      _StringGuts.grow(_:)(35);
      unint64_t v3 = 0xD000000000000021;
      uint64_t v4 = "Could not connect to UtunSocket: ";
LABEL_6:
      unint64_t v6 = (unint64_t)(v4 - 32) | 0x8000000000000000;
      String.append(_:)(*(Swift::String *)&v3);
      goto LABEL_7;
    case 3uLL:
      _StringGuts.grow(_:)(28);
      swift_bridgeObjectRelease();
      unint64_t v8 = 0xD00000000000001ALL;
      v5._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
      String.append(_:)(v5);
      swift_bridgeObjectRelease();
      return v8;
    default:
      unint64_t v8 = 0;
      swift_errorRetain();
      _StringGuts.grow(_:)(29);
      v2._countAndFlagsBits = 0xD00000000000001BLL;
      v2._object = (void *)0x80000001000210F0;
      String.append(_:)(v2);
LABEL_7:
      sub_100008E28((uint64_t *)&unk_100028D70);
      _print_unlocked<A, B>(_:_:)();
      sub_100017F58(a1);
      return v8;
  }
}

unint64_t sub_100017F58(unint64_t result)
{
  unint64_t v1 = result >> 62;
  if (!(result >> 62) || v1 == 2 || v1 == 1) {
    return swift_errorRelease();
  }
  return result;
}

unint64_t sub_100017F7C()
{
  return sub_100017D70(*v0);
}

ssize_t FileDescriptor._recv(into:)(void *a1, uint64_t a2, int a3)
{
  if (a1) {
    size_t v4 = a2 - (void)a1;
  }
  else {
    size_t v4 = 0;
  }
  ssize_t result = recv(a3, a1, v4, 0);
  if (result < 0) {
    return errno.getter();
  }
  return result;
}

void sub_100017FD8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v26 = a3;
  uint64_t v27 = a4;
  uint64_t v25 = a1;
  uint64_t v5 = type metadata accessor for URL.DirectoryHint();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  unint64_t v8 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100008E28((uint64_t *)&unk_100028F60);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = type metadata accessor for URL();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)&v24 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v16 = [objc_allocWithZone((Class)NSTask) init];
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56))(v11, 1, 1, v12);
  (*(void (**)(char *, void, uint64_t))(v6 + 104))(v8, enum case for URL.DirectoryHint.inferFromPath(_:), v5);
  URL.init(filePath:directoryHint:relativeTo:)();
  URL._bridgeToObjectiveC()(v17);
  uint64_t v19 = v18;
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  [v16 setExecutableURL:v19];

  sub_100008E28(&qword_100028B70);
  uint64_t v20 = swift_allocObject();
  *(_OWORD *)(v20 + 16) = xmmword_10001E910;
  *(void *)(v20 + 32) = v25;
  *(void *)(v20 + 40) = a2;
  *(void *)(v20 + 48) = 0x3674656E69;
  *(void *)(v20 + 56) = 0xE500000000000000;
  swift_bridgeObjectRetain();
  *(void *)(v20 + 64) = IPv6Address.debugDescription.getter();
  *(void *)(v20 + 72) = v21;
  *(void *)(v20 + 80) = IPv6Address.debugDescription.getter();
  *(void *)(v20 + 88) = v22;
  *(void *)(v20 + 96) = 0x656C786966657270;
  *(void *)(v20 + 104) = 0xE90000000000006ELL;
  *(void *)(v20 + 112) = 3682865;
  *(void *)(v20 + 120) = 0xE300000000000000;
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [v16 setArguments:isa];

  id v28 = v16;
  sub_10000A0EC(5, 1u, (uint64_t (*)(void))sub_10001BB30);
}

void sub_100018340(uint64_t a1, uint64_t a2)
{
  v21[0] = a1;
  uint64_t v3 = type metadata accessor for URL.DirectoryHint();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100008E28((uint64_t *)&unk_100028F60);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for URL();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v14 = [objc_allocWithZone((Class)NSTask) init];
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 56))(v9, 1, 1, v10);
  (*(void (**)(char *, void, uint64_t))(v4 + 104))(v6, enum case for URL.DirectoryHint.inferFromPath(_:), v3);
  URL.init(filePath:directoryHint:relativeTo:)();
  URL._bridgeToObjectiveC()(v15);
  uint64_t v17 = v16;
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  [v14 setExecutableURL:v17];

  sub_100008E28(&qword_100028B70);
  uint64_t v18 = swift_allocObject();
  *(_OWORD *)(v18 + 16) = xmmword_10001E620;
  *(void *)(v18 + 32) = v21[0];
  *(void *)(v18 + 40) = a2;
  *(void *)(v18 + 48) = 7697517;
  *(void *)(v18 + 56) = 0xE300000000000000;
  v21[7] = 9000;
  swift_bridgeObjectRetain();
  *(void *)(v18 + 64) = dispatch thunk of CustomStringConvertible.description.getter();
  *(void *)(v18 + 72) = v19;
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [v14 setArguments:isa];

  v21[4] = v14;
  sub_10000A0EC(5, 1u, (uint64_t (*)(void))sub_10001BB30);
}

uint64_t sub_100018680(uint64_t a1, uint64_t a2)
{
  if (!a2) {
    return 0x656E6E6F63736964;
  }
  String.append(_:)(*(Swift::String *)&a1);
  v2._countAndFlagsBits = 41;
  v2._object = (void *)0xE100000000000000;
  String.append(_:)(v2);
  return 0x657463656E6E6F63;
}

uint64_t sub_100018704(void *a1, void *a2)
{
  uint64_t v3 = a1[1];
  uint64_t v4 = a2[1];
  if (!v3) {
    return v4 == 0;
  }
  if (!v4) {
    return 0;
  }
  if (*a1 == *a2 && v3 == v4) {
    return 1;
  }
  else {
    return _stringCompareWithSmolCheck(_:_:expecting:)();
  }
}

uint64_t sub_100018750()
{
  return sub_100018680(*v0, v0[1]);
}

void sub_100018758()
{
  swift_retain_n();
  oslog = Logger.logObject.getter();
  os_log_type_t v1 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(oslog, v1))
  {
    Swift::String v2 = (uint8_t *)swift_slowAlloc();
    uint64_t v10 = swift_slowAlloc();
    *(_DWORD *)Swift::String v2 = 136315138;
    swift_beginAccess();
    uint64_t v3 = *(void **)(v0 + 136);
    if (v3)
    {
      uint64_t v4 = *(void *)(v0 + 128);
      swift_bridgeObjectRetain();
      v5._countAndFlagsBits = v4;
      v5._object = v3;
      String.append(_:)(v5);
      v6._countAndFlagsBits = 41;
      v6._object = (void *)0xE100000000000000;
      String.append(_:)(v6);
      swift_bridgeObjectRelease();
      uint64_t v7 = 0x657463656E6E6F63;
      unint64_t v8 = 0xEA00000000002864;
    }
    else
    {
      unint64_t v8 = 0xEC00000064657463;
      uint64_t v7 = 0x656E6E6F63736964;
    }
    sub_1000094CC(v7, v8, &v10);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, oslog, v1, "Changed to state %s", v2, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_release_n();
  }
}

uint64_t sub_100018974()
{
  swift_beginAccess();
  uint64_t v1 = *(void *)(v0 + 128);
  swift_bridgeObjectRetain();
  return v1;
}

void sub_1000189C0(uint64_t a1, uint64_t a2)
{
  swift_beginAccess();
  *(void *)(v2 + 128) = a1;
  *(void *)(v2 + 136) = a2;
  swift_bridgeObjectRelease();
  sub_100018758();
}

void (*sub_100018A18(uint64_t a1))(uint64_t a1, char a2)
{
  *(void *)(a1 + 24) = v1;
  swift_beginAccess();
  return sub_100018A70;
}

void sub_100018A70(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    sub_100018758();
  }
}

uint64_t sub_100018AA4()
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)v0 + 152))();
  if (!v2) {
    return 0;
  }
  return result;
}

uint64_t sub_100018AE4(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = swift_allocObject();
  sub_100018B4C(a1, a2, a3);
  return v6;
}

uint64_t sub_100018B4C(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v7 = type metadata accessor for Logger();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v9 = (uint64_t *)(v3 + OBJC_IVAR____TtC15SSHPacketTunnel10UtunSocket_messageReceivedCompletion);
  uint64_t *v9 = 0;
  v9[1] = 0;
  os_log_type_t v47 = v9;
  uint64_t v10 = (void *)(v3 + OBJC_IVAR____TtC15SSHPacketTunnel10UtunSocket_readBuffer);
  type metadata accessor for __DataStorage();
  swift_allocObject();
  uint64_t v11 = __DataStorage.init(length:)();
  void *v10 = 0xFFFF00000000;
  v10[1] = v11 | 0x4000000000000000;
  sub_10000DCA0();
  swift_bridgeObjectRetain();
  Logger.init(subsystem:category:)();
  uint64_t v48 = v8;
  uint64_t v49 = v7;
  uint64_t v45 = v3 + OBJC_IVAR____TtC15SSHPacketTunnel10UtunSocket_logger;
  (*(void (**)(void))(v8 + 32))();
  uint64_t v12 = v3 + OBJC_IVAR____TtC15SSHPacketTunnel10UtunSocket_tunnelSourceAddress;
  uint64_t v13 = type metadata accessor for IPv6Address();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = *(void (**)(void))(v14 + 16);
  uint64_t v46 = v12;
  ((void (*)(uint64_t, uint64_t, uint64_t))v15)(v12, a2, v13);
  uint64_t v44 = v3 + OBJC_IVAR____TtC15SSHPacketTunnel10UtunSocket_tunnelDestinationAddress;
  v15();
  int v16 = socket(32, 2, 2);
  if (v16 < 0)
  {
    int v30 = errno.getter();
    sub_100009B90();
    uint64_t v31 = swift_allocError();
    _DWORD *v32 = v30;
    sub_10001AC34();
    swift_allocError();
    *uint64_t v33 = v31;
    swift_willThrow();

    uint64_t v34 = *(void (**)(uint64_t, uint64_t))(v14 + 8);
    v34(a3, v13);
    uint64_t v35 = a2;
LABEL_7:
    v34(v35, v13);
    (*(void (**)(uint64_t, uint64_t))(v48 + 8))(v45, v49);
    sub_10001AC88(*v47);
    v34(v46, v13);
    v34(v44, v13);
    sub_100009B38(*(void *)(v4 + OBJC_IVAR____TtC15SSHPacketTunnel10UtunSocket_readBuffer), *(void *)(v4 + OBJC_IVAR____TtC15SSHPacketTunnel10UtunSocket_readBuffer + 8));
    type metadata accessor for UtunSocket();
    swift_deallocPartialClassInstance();
    return v4;
  }
  Swift::Int32 v17 = v16;
  uint64_t v42 = a3;
  uint64_t v43 = a2;
  memset(v51, 0, 100);
  uint64_t v18 = sub_10001AB2C(0x60uLL, 0xD00000000000001ALL, 0x8000000100021110);
  unint64_t v20 = v19;
  unint64_t v22 = v21;
  unint64_t v24 = v23;
  swift_bridgeObjectRetain();
  sub_10001916C(v18, v20, v22, v24, (uint64_t)v51 + 4);
  swift_bridgeObjectRelease();
  sub_10000D8D8();
  if ((ioctl(_:_:_:)() & 0x80000000) != 0 || (Swift::Int32 v25 = fcntl(_:_:)(v17, 3), fcntl(_:_:_:)(v17, 4, v25 | 4) < 0))
  {
    int v36 = errno.getter();
    sub_100009B90();
    uint64_t v37 = swift_allocError();
    _DWORD *v38 = v36;
    uint64_t v39 = v37 | 0x4000000000000000;
    sub_10001AC34();
    swift_allocError();
    uint64_t *v40 = v39;
    swift_willThrow();

    uint64_t v34 = *(void (**)(uint64_t, uint64_t))(v14 + 8);
    v34(v42, v13);
    uint64_t v35 = v43;
    goto LABEL_7;
  }
  *(_OWORD *)(v4 + 24) = *(_OWORD *)((char *)v51 + 4);
  *(_OWORD *)(v4 + 40) = *(_OWORD *)((char *)&v51[1] + 4);
  *(_OWORD *)(v4 + 56) = *(_OWORD *)((char *)&v51[2] + 4);
  *(_OWORD *)(v4 + 72) = *(_OWORD *)((char *)&v51[3] + 4);
  long long v26 = *(_OWORD *)((char *)&v51[5] + 4);
  *(_OWORD *)(v4 + 88) = *(_OWORD *)((char *)&v51[4] + 4);
  *(_OWORD *)(v4 + 104) = v26;
  *(_DWORD *)(v4 + 16) = v17;
  *(_DWORD *)(v4 + 20) = v51[0];
  sub_10001ABF4();
  id v27 = a1;
  uint64_t v28 = static OS_dispatch_source.makeReadSource(fileDescriptor:queue:)();

  uint64_t v29 = *(void (**)(uint64_t, uint64_t))(v14 + 8);
  v29(v42, v13);
  v29(v43, v13);
  *(void *)(v4 + 128) = 0;
  *(void *)(v4 + 136) = 0;
  *(void *)(v4 + 120) = v28;
  return v4;
}

uint64_t sub_10001916C(uint64_t result, unint64_t a2, unint64_t a3, unint64_t a4, uint64_t a5)
{
  unint64_t v23 = result;
  unint64_t v24 = a2;
  unint64_t v25 = a3;
  unint64_t v26 = a4;
  if (!a5) {
    return result;
  }
  __chkstk_darwin(result);
  v21[2] = &v23;
  v21[3] = a5;
  v21[4] = v6;
  v21[5] = a5;
  uint64_t result = sub_10001A778((uint64_t (*)(void, void))sub_10001BC1C, (uint64_t)v21, v7, v8, v9, v10);
  if ((result & 1) == 0) {
    return result;
  }
  unint64_t v11 = v23;
  unint64_t v12 = v24 >> 14;
  if (v24 >> 14 == v23 >> 14) {
    return result;
  }
  uint64_t v14 = v25;
  uint64_t v13 = v26;
  uint64_t v15 = (v25 >> 59) & 1;
  if ((v26 & 0x1000000000000000) == 0) {
    LOBYTE(v15) = 1;
  }
  uint64_t v16 = 4 << v15;
  uint64_t v17 = HIBYTE(v26) & 0xF;
  if ((v26 & 0x2000000000000000) == 0) {
    uint64_t v17 = v25 & 0xFFFFFFFFFFFFLL;
  }
  unint64_t v22 = v17;
  swift_bridgeObjectRetain();
  uint64_t v18 = 0;
  unint64_t v19 = v11;
  while (1)
  {
    uint64_t result = Substring.UTF8View.subscript.getter();
    char v20 = result;
    if ((v19 & 0xC) == v16)
    {
      uint64_t result = sub_100012190(v19, v14, v13);
      unint64_t v19 = result;
      if ((v13 & 0x1000000000000000) == 0)
      {
LABEL_11:
        unint64_t v19 = (v19 & 0xFFFFFFFFFFFF0000) + 65540;
        goto LABEL_15;
      }
    }
    else if ((v13 & 0x1000000000000000) == 0)
    {
      goto LABEL_11;
    }
    if (v22 <= v19 >> 16) {
      goto LABEL_20;
    }
    uint64_t result = String.UTF8View._foreignIndex(after:)();
    unint64_t v19 = result;
LABEL_15:
    if (__OFADD__(v18, 1)) {
      break;
    }
    *(unsigned char *)(a5 + v18++) = v20;
    if (v12 == v19 >> 14) {
      return swift_bridgeObjectRelease();
    }
  }
  __break(1u);
LABEL_20:
  __break(1u);
  return result;
}

uint64_t sub_100019314(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  v18[0] = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v6 = *(void *)(v18[0] - 8);
  __chkstk_darwin(v18[0]);
  unint64_t v8 = (char *)v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for DispatchQoS();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  unint64_t v12 = (char *)v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = (void *)(v3 + OBJC_IVAR____TtC15SSHPacketTunnel10UtunSocket_messageReceivedCompletion);
  uint64_t v14 = *(void *)(v3 + OBJC_IVAR____TtC15SSHPacketTunnel10UtunSocket_messageReceivedCompletion);
  *uint64_t v13 = a1;
  v13[1] = a2;
  swift_retain();
  sub_10001AC88(v14);
  memset(v20, 0, sizeof(v20));
  swift_getObjectType();
  aBlock[4] = sub_10001ACE4;
  aBlock[5] = v3;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100008D1C;
  aBlock[3] = &unk_100025700;
  uint64_t v15 = _Block_copy(aBlock);
  swift_retain();
  static DispatchQoS.unspecified.getter();
  sub_100008D78();
  OS_dispatch_source.setEventHandler(qos:flags:handler:)();
  _Block_release(v15);
  (*(void (**)(char *, void))(v6 + 8))(v8, v18[0]);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  swift_release();
  BYTE1(v20[0]) = 32;
  WORD1(v20[0]) = 2;
  DWORD1(v20[0]) = *(_DWORD *)(v3 + 20);
  int v21 = 1;
  v18[4] = &v21;
  v18[5] = v20;
  v18[6] = v3;
  uint64_t v16 = v18[1];
  uint64_t result = sub_10000A0EC(255, 0, (uint64_t (*)(void))sub_10001AD00);
  if (!v16) {
    return aBlock[0];
  }
  return result;
}

void sub_1000195DC()
{
  uint64_t v1 = v0;
  swift_getObjectType();
  uint64_t v2 = OS_dispatch_source.data.getter();
  if (v2 < 0)
  {
LABEL_18:
    __break(1u);
    JUMPOUT(0x100019D48);
  }
  uint64_t v3 = v2;
  uint64_t v4 = (uint64_t *)(v0 + OBJC_IVAR____TtC15SSHPacketTunnel10UtunSocket_readBuffer);
  swift_beginAccess();
  swift_retain();
  uint64_t v22 = Data._Representation.subscript.getter();
  unint64_t v23 = v5;
  ssize_t v6 = sub_10001B790(&v22, v1);
  swift_release();
  uint64_t v7 = v22;
  unint64_t v8 = v23;
  sub_10001A3D8(v22, v23);
  sub_100009B38(v7, v8);
  swift_endAccess();
  if (v6 <= 0)
  {
    uint64_t v15 = Logger.logObject.getter();
    os_log_type_t v16 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v15, v16))
    {
      uint64_t v17 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v17 = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, v16, "Received 0 bytes from utun, closing connection...", v17, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(void))(*(void *)v1 + 272))();
  }
  else if (v3 == v6)
  {
    uint64_t v9 = *(void (**)(uint64_t, unint64_t))(v1
                                                          + OBJC_IVAR____TtC15SSHPacketTunnel10UtunSocket_messageReceivedCompletion);
    if (v9)
    {
      uint64_t v11 = *v4;
      unint64_t v10 = v4[1];
      switch(v10 >> 62)
      {
        case 1uLL:
          uint64_t v21 = (int)v11;
          goto LABEL_16;
        case 2uLL:
          uint64_t v21 = *(void *)(v11 + 16);
LABEL_16:
          sub_100016564(v11, v10);
          if (v3 >= v21) {
            goto LABEL_6;
          }
          __break(1u);
          goto LABEL_18;
        default:
LABEL_6:
          swift_retain();
          uint64_t v12 = Data._Representation.subscript.getter();
          unint64_t v14 = v13;
          sub_100009B38(v11, v10);
          v9(v12, v14);
          sub_10001AC88((uint64_t)v9);
          sub_100009B38(v12, v14);
          return;
      }
    }
  }
  else
  {
    uint64_t v18 = Logger.logObject.getter();
    os_log_type_t v19 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v18, v19))
    {
      uint64_t v20 = swift_slowAlloc();
      *(_DWORD *)uint64_t v20 = 134218240;
      ssize_t v24 = v3;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *(_WORD *)(v20 + 12) = 2048;
      ssize_t v24 = v6;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl((void *)&_mh_execute_header, v18, v19, "Expected to read %ld bytes but read %ld instead.", (uint8_t *)v20, 0x16u);
      swift_slowDealloc();
    }
  }
}

void sub_100019D58(uint64_t a1, unint64_t a2)
{
  switch(a2 >> 62)
  {
    case 1uLL:
      if (a1 >> 32 < (int)a1) {
        __break(1u);
      }
      swift_retain();
      sub_100016564(a1, a2);
      sub_10001A688((int)a1, a1 >> 32);
      sub_100009B38(a1, a2);
      break;
    case 2uLL:
      uint64_t v4 = *(void *)(a1 + 16);
      uint64_t v5 = *(void *)(a1 + 24);
      swift_retain();
      swift_retain();
      swift_retain();
      sub_10001A688(v4, v5);
      swift_release();
      goto LABEL_6;
    default:
      swift_retain();
      int v6 = FileDescriptor._write(_:retryOnInterrupt:)();
      if (v7)
      {
        int v8 = v6;
        sub_100009B90();
        swift_willThrowTypedImpl();
        swift_allocError();
        _DWORD *v9 = v8;
        swift_release();
        swift_errorRetain();
        swift_errorRetain();
        unint64_t v10 = Logger.logObject.getter();
        os_log_type_t v11 = static os_log_type_t.error.getter();
        if (os_log_type_enabled(v10, v11))
        {
          uint64_t v12 = (uint8_t *)swift_slowAlloc();
          unint64_t v13 = (void *)swift_slowAlloc();
          *(_DWORD *)uint64_t v12 = 138412290;
          swift_errorRetain();
          uint64_t v14 = _swift_stdlib_bridgeErrorToNSError();
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          *unint64_t v13 = v14;
          swift_errorRelease();
          swift_errorRelease();
          _os_log_impl((void *)&_mh_execute_header, v10, v11, "Could not write to utun: %@", v12, 0xCu);
          sub_100008E28(&qword_100028D90);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();
          swift_errorRelease();
        }
        else
        {
          swift_errorRelease();

          swift_errorRelease();
          swift_errorRelease();
        }
      }
      else
      {
LABEL_6:
        swift_release();
      }
      break;
  }
}

uint64_t sub_10001A18C()
{
  swift_getObjectType();
  OS_dispatch_source.cancel()();
  uint64_t v1 = FileDescriptor._close()();
  if ((v1 & 0x100000000) == 0) {
    return (*(uint64_t (**)(void, void))(*(void *)v0 + 160))(0, 0);
  }
  int v3 = v1;
  sub_100009B90();
  swift_willThrowTypedImpl();
  uint64_t result = swift_allocError();
  _DWORD *v4 = v3;
  return result;
}

uint64_t sub_10001A250()
{
  uint64_t v1 = v0;
  uint64_t result = swift_beginAccess();
  if (*(void *)(v0 + 136))
  {
    __break(1u);
  }
  else
  {
    swift_getObjectType();
    char v3 = OS_dispatch_source.isCancelled.getter();
    uint64_t result = swift_unknownObjectRelease();
    if (v3)
    {
      swift_bridgeObjectRelease();
      uint64_t v4 = v0 + OBJC_IVAR____TtC15SSHPacketTunnel10UtunSocket_logger;
      uint64_t v5 = type metadata accessor for Logger();
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
      sub_10001AC88(*(void *)(v1 + OBJC_IVAR____TtC15SSHPacketTunnel10UtunSocket_messageReceivedCompletion));
      uint64_t v6 = v1 + OBJC_IVAR____TtC15SSHPacketTunnel10UtunSocket_tunnelSourceAddress;
      uint64_t v7 = type metadata accessor for IPv6Address();
      int v8 = *(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8);
      v8(v6, v7);
      v8(v1 + OBJC_IVAR____TtC15SSHPacketTunnel10UtunSocket_tunnelDestinationAddress, v7);
      sub_100009B38(*(void *)(v1 + OBJC_IVAR____TtC15SSHPacketTunnel10UtunSocket_readBuffer), *(void *)(v1 + OBJC_IVAR____TtC15SSHPacketTunnel10UtunSocket_readBuffer + 8));
      return swift_deallocClassInstance();
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_10001A3D8(uint64_t a1, unint64_t a2)
{
  switch(a2 >> 62)
  {
    case 1uLL:
      if (a1 >> 32 < (int)a1) {
        __break(1u);
      }
      swift_retain();
      sub_10001A5E0((int)a1, a1 >> 32);
      uint64_t result = sub_100009B38(a1, a2);
      break;
    case 2uLL:
      uint64_t v5 = *(void *)(a1 + 16);
      uint64_t v6 = *(void *)(a1 + 24);
      swift_retain();
      swift_retain();
      sub_10001A5E0(v5, v6);
      swift_release();
      uint64_t result = swift_release();
      break;
    default:
      uint64_t result = Data._Representation.replaceSubrange(_:with:count:)();
      break;
  }
  return result;
}

uint64_t sub_10001A5E0(uint64_t a1, uint64_t a2)
{
  uint64_t result = __DataStorage._bytes.getter();
  if (!result || (uint64_t result = __DataStorage._offset.getter(), !__OFSUB__(a1, result)))
  {
    if (!__OFSUB__(a2, a1))
    {
      __DataStorage._length.getter();
      return Data._Representation.replaceSubrange(_:with:count:)();
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_10001A688(uint64_t a1, uint64_t a2)
{
  uint64_t result = __DataStorage._bytes.getter();
  if (result)
  {
    uint64_t result = __DataStorage._offset.getter();
    if (__OFSUB__(a1, result)) {
      goto LABEL_8;
    }
  }
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
LABEL_8:
    __break(1u);
    return result;
  }
  __DataStorage._length.getter();
  int v5 = FileDescriptor._write(_:retryOnInterrupt:)();
  if (v6)
  {
    int v7 = v5;
    sub_100009B90();
    swift_willThrowTypedImpl();
    swift_allocError();
    _DWORD *v8 = v7;
  }
  return swift_release();
}

uint64_t sub_10001A778(uint64_t (*a1)(void, void), uint64_t a2, unint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6)
{
  if ((a6 & 0x1000000000000000) != 0) {
    return (a6 & 0x1000000000000000) >> 60;
  }
  if ((a6 & 0x2000000000000000) != 0)
  {
    uint64_t v13 = HIBYTE(a6) & 0xF;
    v15[0] = a5;
    v15[1] = a6 & 0xFFFFFFFFFFFFFFLL;
    uint64_t v12 = v15;
  }
  else if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v12 = (void *)((a6 & 0xFFFFFFFFFFFFFFFLL) + 32);
    uint64_t v13 = a5 & 0xFFFFFFFFFFFFLL;
  }
  else
  {
    uint64_t v12 = (void *)_StringObject.sharedUTF8.getter();
  }
  uint64_t result = sub_10001A84C((uint64_t)v12, v13, a3, a4, a5, a6, a1);
  if (!v6) {
    return (a6 & 0x1000000000000000) >> 60;
  }
  return result;
}

uint64_t sub_10001A84C(uint64_t result, uint64_t a2, unint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, uint64_t (*a7)(void, void))
{
  unint64_t v10 = a3;
  uint64_t v11 = result;
  uint64_t v12 = (a5 >> 59) & 1;
  if ((a6 & 0x1000000000000000) == 0) {
    LOBYTE(v12) = 1;
  }
  uint64_t v13 = 4 << v12;
  unint64_t v14 = a3 & 0xC;
  unint64_t v15 = a3;
  if (v14 == 4 << v12)
  {
    uint64_t v17 = a7;
    uint64_t result = sub_100012190(a3, a5, a6);
    a7 = v17;
    unint64_t v15 = result;
    if ((a6 & 0x1000000000000000) == 0)
    {
LABEL_5:
      int64_t v16 = v15 >> 16;
      if (v14 != v13) {
        goto LABEL_6;
      }
      goto LABEL_14;
    }
  }
  else if ((a6 & 0x1000000000000000) == 0)
  {
    goto LABEL_5;
  }
  unint64_t v26 = a7;
  unint64_t v18 = a5 & 0xFFFFFFFFFFFFLL;
  if ((a6 & 0x2000000000000000) != 0) {
    unint64_t v18 = HIBYTE(a6) & 0xF;
  }
  if (v18 < v15 >> 16) {
    goto LABEL_31;
  }
  uint64_t result = String.UTF8View._foreignDistance(from:to:)();
  int64_t v16 = result;
  a7 = v26;
  if (v14 == v13)
  {
LABEL_14:
    unsigned __int16 v19 = v10;
    uint64_t v20 = a7;
    uint64_t result = sub_100012190(v19, a5, a6);
    a7 = v20;
    unint64_t v10 = result;
  }
LABEL_6:
  if ((a4 & 0xC) == v13)
  {
    uint64_t v21 = a7;
    uint64_t result = sub_100012190(a4, a5, a6);
    a7 = v21;
    a4 = result;
    if ((a6 & 0x1000000000000000) == 0) {
      goto LABEL_8;
    }
  }
  else if ((a6 & 0x1000000000000000) == 0)
  {
LABEL_8:
    uint64_t result = (a4 >> 16) - (v10 >> 16);
    goto LABEL_21;
  }
  unint64_t v22 = HIBYTE(a6) & 0xF;
  if ((a6 & 0x2000000000000000) == 0) {
    unint64_t v22 = a5 & 0xFFFFFFFFFFFFLL;
  }
  if (v22 < v10 >> 16) {
    goto LABEL_29;
  }
  if (v22 < a4 >> 16)
  {
LABEL_30:
    __break(1u);
LABEL_31:
    __break(1u);
    return result;
  }
  unint64_t v23 = a7;
  uint64_t result = String.UTF8View._foreignDistance(from:to:)();
  a7 = v23;
LABEL_21:
  if (__OFADD__(v16, result))
  {
    __break(1u);
    goto LABEL_28;
  }
  uint64_t v24 = result;
  if (v16 + result < v16)
  {
LABEL_28:
    __break(1u);
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if (v11) {
    uint64_t v25 = v11 + v16;
  }
  else {
    uint64_t v25 = 0;
  }
  return a7(v25, v24);
}

uint64_t sub_10001AA58(uint64_t result, unint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v6 = a2;
  unint64_t v7 = result;
  uint64_t v8 = (a3 >> 59) & 1;
  if ((a4 & 0x1000000000000000) == 0) {
    LOBYTE(v8) = 1;
  }
  uint64_t v9 = 4 << v8;
  if ((a2 & 0xC) == 4 << v8)
  {
    uint64_t result = sub_100012190(a2, a3, a4);
    unint64_t v6 = result;
  }
  if ((v7 & 0xC) == v9)
  {
    uint64_t result = sub_100012190(v7, a3, a4);
    unint64_t v7 = result;
  }
  uint64_t v10 = a3 & 0xFFFFFFFFFFFFLL;
  if ((a4 & 0x2000000000000000) != 0) {
    uint64_t v10 = HIBYTE(a4) & 0xF;
  }
  if (v6 >> 14 <= 4 * v10 && v6 >> 14 >= v7 >> 14) {
    return v7;
  }
  __break(1u);
  return result;
}

uint64_t sub_10001AB2C(unint64_t a1, unint64_t a2, unint64_t a3)
{
  if ((a1 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_12;
  }
  unint64_t v3 = a3;
  unint64_t v4 = a2;
  unint64_t v6 = HIBYTE(a3) & 0xF;
  if ((a3 & 0x2000000000000000) == 0) {
    unint64_t v6 = a2 & 0xFFFFFFFFFFFFLL;
  }
  unint64_t v5 = v6 << 16;
  if ((a3 & 0x1000000000000000) != 0)
  {
LABEL_12:
    uint64_t v9 = String.UTF8View._foreignIndex(_:offsetBy:limitedBy:)();
    if (v10)
    {
      if ((v4 & 0x800000000000000) != 0) {
        goto LABEL_6;
      }
      unint64_t v7 = v5 | 0xB;
    }
    else
    {
      unint64_t v7 = v9;
    }
    goto LABEL_8;
  }
  if (v6 < a1)
  {
LABEL_6:
    unint64_t v7 = v5 | 7;
    goto LABEL_8;
  }
  unint64_t v7 = (a1 << 16) | 4;
LABEL_8:

  return sub_10001AA58(15, v7, v4, v3);
}

unint64_t sub_10001ABF4()
{
  unint64_t result = qword_100028D80;
  if (!qword_100028D80)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100028D80);
  }
  return result;
}

unint64_t sub_10001AC34()
{
  unint64_t result = qword_100028D88;
  if (!qword_100028D88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028D88);
  }
  return result;
}

uint64_t sub_10001AC88(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t type metadata accessor for UtunSocket()
{
  uint64_t result = qword_100029850;
  if (!qword_100029850) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_10001ACE8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10001ACF8()
{
  return swift_release();
}

void sub_10001AD00(uint64_t *a1@<X8>)
{
  uint64_t v5 = v2;
  uint64_t v8 = (int *)v1[2];
  uint64_t v7 = v1[3];
  uint64_t v9 = (int *)v1[4];
  int v10 = *v8;
  *(_DWORD *)(v7 + 8) = *v8;
  int v11 = *(_DWORD *)(v7 + 4);
  int v12 = *(_DWORD *)(v7 + 28);
  long long v13 = *(_OWORD *)(v7 + 12);
  *(_DWORD *)uint64_t v29 = *(_DWORD *)v7;
  *(_DWORD *)&v29[4] = v11;
  *(_DWORD *)&v29[8] = v10;
  *(_OWORD *)&v29[12] = v13;
  int v30 = v12;
  if (connect(v9[4], (const sockaddr *)v29, 0x20u) < 0)
  {
    int v22 = errno.getter();
    sub_100009B90();
    uint64_t v23 = swift_allocError();
    *uint64_t v24 = v22;
    uint64_t p_prots = v23 | 0x8000000000000000;
    sub_10001AC34();
    swift_allocError();
    *uint64_t v25 = p_prots;
    swift_willThrow();
    int v26 = *v8 + 1;
    if (*v8 != -1) {
      goto LABEL_15;
    }
    __break(1u);
  }
  else
  {
    *(void *)uint64_t v29 = 1853191285;
    *(void *)&v29[8] = 0xE400000000000000;
    if (!*v8)
    {
      __break(1u);
      goto LABEL_17;
    }
    LODWORD(v31) = *v8 - 1;
    v14._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
    String.append(_:)(v14);
    swift_bridgeObjectRelease();
    unint64_t v3 = *(void *)&v29[8];
    uint64_t v28 = *(void *)v29;
    swift_retain_n();
    swift_bridgeObjectRetain_n();
    unint64_t v4 = Logger.logObject.getter();
    os_log_type_t v15 = static os_log_type_t.info.getter();
    uint64_t p_prots = (uint64_t)&OBJC_PROTOCOL___NSObject.prots;
    if (os_log_type_enabled(v4, v15))
    {
      uint64_t v17 = swift_slowAlloc();
      *(void *)uint64_t v29 = swift_slowAlloc();
      *(_DWORD *)uint64_t v17 = 136315650;
      swift_bridgeObjectRetain();
      uint64_t v31 = sub_1000094CC(v28, v3, (uint64_t *)v29);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v17 + 12) = 2080;
      uint64_t v18 = IPv6Address.debugDescription.getter();
      uint64_t v31 = sub_1000094CC(v18, v19, (uint64_t *)v29);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      swift_release_n();
      *(_WORD *)(v17 + 22) = 2080;
      uint64_t v20 = IPv6Address.debugDescription.getter();
      uint64_t v31 = sub_1000094CC(v20, v21, (uint64_t *)v29);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      uint64_t p_prots = 0x100029000;
      swift_bridgeObjectRelease();
      swift_release_n();
      _os_log_impl((void *)&_mh_execute_header, v4, v15, "Setting %s IP to %s and tunnel destination to %s", (uint8_t *)v17, 0x20u);
      swift_arrayDestroy();
      swift_slowDealloc();
      uint64_t v5 = v2;
      swift_slowDealloc();

      goto LABEL_8;
    }
  }

  swift_bridgeObjectRelease_n();
  swift_release_n();
LABEL_8:
  sub_100017FD8(v28, v3, (uint64_t)v9 + OBJC_IVAR____TtC15SSHPacketTunnel10UtunSocket_tunnelSourceAddress, (uint64_t)v9 + *(void *)(p_prots + 1600));
  if (v5)
  {
    swift_bridgeObjectRelease();
    int v26 = *v8 + 1;
    if (*v8 != -1) {
      goto LABEL_15;
    }
    __break(1u);
  }
  sub_100018340(v28, v3);
  if (!v5) {
    goto LABEL_14;
  }
  swift_bridgeObjectRelease();
  int v26 = *v8 + 1;
  if (*v8 != -1)
  {
LABEL_15:
    int *v8 = v26;
    return;
  }
  __break(1u);
LABEL_14:
  id v27 = *(void (**)(uint64_t, unint64_t))(*(void *)v9 + 160);
  swift_bridgeObjectRetain();
  v27(v28, v3);
  swift_getObjectType();
  OS_dispatch_source.activate()();
  *a1 = v28;
  a1[1] = v3;
  int v26 = *v8 + 1;
  if (*v8 != -1) {
    goto LABEL_15;
  }
LABEL_17:
  __break(1u);
}

unint64_t *initializeBufferWithCopyOfBuffer for UtunSocketError(unint64_t *a1, unint64_t *a2)
{
  unint64_t v3 = *a2;
  sub_10001B15C(*a2);
  *a1 = v3;
  return a1;
}

unint64_t sub_10001B15C(unint64_t result)
{
  unint64_t v1 = result >> 62;
  if (!(result >> 62) || v1 == 2 || v1 == 1) {
    return swift_errorRetain();
  }
  return result;
}

unint64_t destroy for UtunSocketError(unint64_t *a1)
{
  return sub_100017F58(*a1);
}

unint64_t *assignWithCopy for UtunSocketError(unint64_t *a1, unint64_t *a2)
{
  unint64_t v3 = *a2;
  sub_10001B15C(*a2);
  unint64_t v4 = *a1;
  *a1 = v3;
  sub_100017F58(v4);
  return a1;
}

void *initializeWithTake for UtunSocketError(void *result, void *a2)
{
  *uint64_t result = *a2;
  return result;
}

unint64_t *assignWithTake for UtunSocketError(unint64_t *a1, unint64_t *a2)
{
  unint64_t v3 = *a1;
  *a1 = *a2;
  sub_100017F58(v3);
  return a1;
}

uint64_t getEnumTagSinglePayload for UtunSocketError(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xD && *(unsigned char *)(a1 + 8)) {
    return (*(_DWORD *)a1 + 13);
  }
  unsigned int v3 = (((*(void *)a1 >> 60) >> 2) & 0xFFFFFFF3 | (4 * ((*(void *)a1 >> 60) & 3))) ^ 0xF;
  if (v3 >= 0xC) {
    unsigned int v3 = -1;
  }
  return v3 + 1;
}

uint64_t storeEnumTagSinglePayload for UtunSocketError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xC)
  {
    *(void *)uint64_t result = a2 - 13;
    if (a3 >= 0xD) {
      *(unsigned char *)(result + 8) = 1;
    }
  }
  else
  {
    if (a3 >= 0xD) {
      *(unsigned char *)(result + 8) = 0;
    }
    if (a2) {
      *(void *)uint64_t result = (unint64_t)(((-a2 >> 2) & 3) - 4 * a2) << 60;
    }
  }
  return result;
}

uint64_t sub_10001B2A4(void *a1)
{
  return *a1 >> 62;
}

void *sub_10001B2B0(void *result)
{
  *result &= 0x3FFFFFFFFFFFFFFFuLL;
  return result;
}

uint64_t *sub_10001B2C0(uint64_t *result, uint64_t a2)
{
  *uint64_t result = *result & 0xFFFFFFFFFFFFFFFLL | (a2 << 62);
  return result;
}

ValueMetadata *type metadata accessor for UtunSocketError()
{
  return &type metadata for UtunSocketError;
}

uint64_t sub_10001B2E4()
{
  return type metadata accessor for UtunSocket();
}

uint64_t sub_10001B2EC()
{
  uint64_t result = type metadata accessor for Logger();
  if (v1 <= 0x3F)
  {
    uint64_t result = type metadata accessor for IPv6Address();
    if (v2 <= 0x3F) {
      return swift_updateClassMetadata2();
    }
  }
  return result;
}

void *initializeBufferWithCopyOfBuffer for UtunSocket.State(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for UtunSocket.State()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for UtunSocket.State(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 initializeWithTake for UtunSocket.State(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

void *assignWithTake for UtunSocket.State(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for UtunSocket.State(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  if ((v3 + 1) >= 2) {
    return v3;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for UtunSocket.State(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)__n128 result = 0;
    *(void *)(result + 8) = 0;
    *(_DWORD *)__n128 result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 16) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2;
    }
  }
  return result;
}

uint64_t sub_10001B54C(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 + 1);
}

void *sub_10001B568(void *result, int a2)
{
  if (a2 < 0)
  {
    *__n128 result = a2 ^ 0x80000000;
    result[1] = 0;
  }
  else if (a2)
  {
    result[1] = (a2 - 1);
  }
  return result;
}

ValueMetadata *type metadata accessor for UtunSocket.State()
{
  return &type metadata for UtunSocket.State;
}

uint64_t sub_10001B598(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 sub_10001B5D0(uint64_t a1, long long *a2)
{
  long long v2 = *a2;
  long long v3 = a2[2];
  *(_OWORD *)(a1 + 16) = a2[1];
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)a1 = v2;
  __n128 result = (__n128)a2[3];
  long long v5 = a2[4];
  long long v6 = a2[5];
  *(_DWORD *)(a1 + 96) = *((_DWORD *)a2 + 24);
  *(_OWORD *)(a1 + 64) = v5;
  *(_OWORD *)(a1 + 80) = v6;
  *(__n128 *)(a1 + 48) = result;
  return result;
}

uint64_t sub_10001B5FC(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 100)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_10001B61C(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 88) = 0;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_DWORD *)(result + 96) = 0;
    *(void *)__n128 result = (a2 - 1);
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 100) = v3;
  return result;
}

void type metadata accessor for ctl_info()
{
  if (!qword_100028F50)
  {
    ForeignTypeMetaintptr_t data = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_100028F50);
    }
  }
}

uint64_t sub_10001B6BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = __DataStorage._bytes.getter();
  if (!result) {
    goto LABEL_12;
  }
  uint64_t v8 = result;
  uint64_t result = __DataStorage._offset.getter();
  uint64_t v9 = a1 - result;
  if (__OFSUB__(a1, result))
  {
    __break(1u);
    goto LABEL_11;
  }
  BOOL v10 = __OFSUB__(a2, a1);
  int64_t v11 = a2 - a1;
  if (v10)
  {
LABEL_11:
    __break(1u);
LABEL_12:
    __break(1u);
    return result;
  }
  uint64_t v12 = __DataStorage._length.getter();
  if (v12 >= v11) {
    size_t v13 = v11;
  }
  else {
    size_t v13 = v12;
  }
  ssize_t v14 = recv(*(_DWORD *)(a4 + 16), (void *)(v8 + v9), v13, 0);
  if (v14 < 0)
  {
    int v15 = errno.getter();
    sub_100009B90();
    swift_allocError();
    _DWORD *v16 = v15;
    swift_willThrow();
  }
  return v14;
}

ssize_t sub_10001B790(uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = *a1;
  unint64_t v2 = a1[1];
  switch(v2 >> 62)
  {
    case 1uLL:
      uint64_t v9 = v2 & 0x3FFFFFFFFFFFFFFFLL;
      *(_OWORD *)a1 = xmmword_10001E9F0;
      swift_retain_n();
      uint64_t v10 = v3 >> 32;
      if (swift_isUniquelyReferenced_nonNull_native()) {
        goto LABEL_16;
      }
      if (v10 < (int)v3) {
        goto LABEL_20;
      }
      if (__DataStorage._bytes.getter() && __OFSUB__((int)v3, __DataStorage._offset.getter())) {
        goto LABEL_21;
      }
      type metadata accessor for __DataStorage();
      swift_allocObject();
      uint64_t v17 = __DataStorage.init(bytes:length:copy:deallocator:offset:)();
      swift_release();
      uint64_t v9 = v17;
LABEL_16:
      if (v10 < (int)v3)
      {
        __break(1u);
LABEL_20:
        __break(1u);
LABEL_21:
        __break(1u);
      }
      swift_retain();
      uint64_t v7 = sub_10001B6BC((int)v3, v3 >> 32, v9, a2);
      swift_release_n();
      *a1 = v3;
      a1[1] = v9 | 0x4000000000000000;
      return v7;
    case 2uLL:
      *(void *)&long long v19 = *a1;
      *((void *)&v19 + 1) = v2 & 0x3FFFFFFFFFFFFFFFLL;
      swift_retain_n();
      Data.LargeSlice.ensureUniqueReference()();
      uint64_t v11 = *((void *)&v19 + 1);
      uint64_t v13 = *(void *)(v19 + 16);
      uint64_t v12 = *(void *)(v19 + 24);
      swift_retain();
      uint64_t v7 = sub_10001B6BC(v13, v12, *((uint64_t *)&v19 + 1), a2);
      swift_release_n();
      *a1 = v19;
      a1[1] = v11 | 0x8000000000000000;
      return v7;
    case 3uLL:
      *(void *)((char *)&v19 + 7) = 0;
      *(void *)&long long v19 = 0;
      ssize_t v14 = recv(*(_DWORD *)(a2 + 16), &v19, 0, 0);
      if ((v14 & 0x8000000000000000) == 0) {
        return v14;
      }
      uint64_t v7 = errno.getter();
      sub_100009B90();
      swift_allocError();
      _DWORD *v16 = v7;
      swift_willThrow();
      return v7;
    default:
      *(void *)&long long v19 = *a1;
      WORD4(v19) = v2;
      BYTE10(v19) = BYTE2(v2);
      BYTE11(v19) = BYTE3(v2);
      BYTE12(v19) = BYTE4(v2);
      BYTE13(v19) = BYTE5(v2);
      BYTE14(v19) = BYTE6(v2);
      ssize_t v6 = recv(*(_DWORD *)(a2 + 16), &v19, BYTE6(v2), 0);
      if (v6 < 0)
      {
        uint64_t v7 = errno.getter();
        sub_100009B90();
        swift_allocError();
        *int v15 = v7;
        swift_willThrow();
      }
      else
      {
        uint64_t v7 = v6;
      }
      unint64_t v8 = DWORD2(v19) | ((unint64_t)BYTE12(v19) << 32) | ((unint64_t)BYTE13(v19) << 40) | ((unint64_t)BYTE14(v19) << 48);
      *a1 = v19;
      a1[1] = v8;
      return v7;
  }
}

id sub_10001BB30()
{
  return sub_10001BB48();
}

id sub_10001BB48()
{
  uint64_t v1 = *(void **)(v0 + 16);
  id v7 = 0;
  if ([v1 launchAndReturnError:&v7])
  {
    id v2 = v7;
    [v1 waitUntilExit];
    id result = [v1 terminationStatus];
    if (!result) {
      return result;
    }
    unint64_t v4 = [v1 terminationStatus] | 0xC000000000000000;
    sub_10001AC34();
    swift_allocError();
    unint64_t *v5 = v4;
  }
  else
  {
    id v6 = v7;
    _convertNSErrorToError(_:)();
  }
  return (id)swift_willThrow();
}

void *sub_10001BC1C(void *__src, size_t __len)
{
  if (__src)
  {
    if ((__len & 0x8000000000000000) != 0)
    {
      __int16 __src = (void *)_fatalErrorMessage(_:_:file:line:flags:)();
      __break(1u);
    }
    else
    {
      unint64_t v4 = __src;
      long long v5 = *(void **)(v2 + 40);
      return memmove(v5, v4, __len);
    }
  }
  return __src;
}

void sub_10001BCBC()
{
}

void sub_10001BCD8()
{
}

void sub_10001BCF4()
{
  uint64_t v0 = __error();
  errx(71, "inet_pton(): %d", *v0);
}

void sub_10001BD20(void *a1, _OWORD *a2)
{
  sub_100006A98(a1, a2);
  sub_100006B30();
  uint64_t v2 = __error();
  strerror(*v2);
  sub_100006AD4();
  sub_100006AB0();
  sub_100006B18();
  __break(1u);
}

void sub_10001BDAC(void *a1, _OWORD *a2)
{
}

void sub_10001BE30()
{
}

void sub_10001BE4C()
{
  uint64_t v0 = __error();
  err(71, "bind(): %d", *v0);
}

void sub_10001BE78()
{
}

void sub_10001BE94()
{
}

void sub_10001BEB0()
{
}

void sub_10001BECC()
{
  uint64_t v0 = __error();
  err(71, "setsockopt(): %d", *v0);
}

void sub_10001BEF8()
{
}

void sub_10001BF14()
{
}

void sub_10001BF30(const char *a1)
{
  uint64_t v2 = __error();
  err(65, "strtoul %s: %d", a1, *v2);
}

void sub_10001BF64()
{
}

void sub_10001BF80()
{
}

void sub_10001BF9C()
{
}

void sub_10001BFB8()
{
}

void sub_10001BFD4()
{
  uint64_t v0 = __error();
  err(*v0, "remote_device_reset failed");
}

void sub_10001BFF4()
{
  uint64_t v0 = __error();
  err(*v0, "remote_device_set_alias failed");
}

void sub_10001C014()
{
  uint64_t v0 = __error();
  err(*v0, "remote_device_timesync");
}

void sub_10001C034(void *a1, _OWORD *a2)
{
}

void sub_10001C0F8()
{
}

void sub_10001C114(void *a1, _OWORD *a2)
{
}

void sub_10001C190(void *a1, _OWORD *a2)
{
}

void sub_10001C20C()
{
  name = (const char *)remote_device_get_name();
  errx(75, "Device %s not connected yet", name);
}

void sub_10001C234()
{
}

void sub_10001C250()
{
}

void sub_10001C26C()
{
}

void sub_10001C288()
{
}

void sub_10001C2A4()
{
}

void sub_10001C2C0(int a1)
{
}

void sub_10001C2E0(void *a1, _OWORD *a2)
{
}

void sub_10001C34C(void *a1, _OWORD *a2)
{
}

void sub_10001C3B8(void *a1, _OWORD *a2)
{
}

void sub_10001C424(void *a1, _OWORD *a2)
{
}

void sub_10001C490(void *a1, _OWORD *a2)
{
}

void sub_10001C4FC(void *a1, _OWORD *a2)
{
}

void sub_10001C568(void *a1, _OWORD *a2)
{
}

void sub_10001C5D4(void *a1, _OWORD *a2)
{
}

void sub_10001C640(uint64_t a1, int a2, os_log_t log)
{
  uint64_t v3 = *(void *)(a1 + 64);
  int v4 = 136446466;
  uint64_t v5 = v3;
  __int16 v6 = 1024;
  int v7 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%{public}s: Could not spawn child process: %{darwin.errno}d", (uint8_t *)&v4, 0x12u);
}

void sub_10001C6CC(void *a1, _OWORD *a2)
{
}

void sub_10001C738(void *a1, _OWORD *a2)
{
}

void sub_10001C7A4(void *a1, _OWORD *a2)
{
}

void sub_10001C810(void *a1, _OWORD *a2)
{
}

void sub_10001C87C(void *a1, _OWORD *a2)
{
}

void sub_10001C8E8(void *a1, _OWORD *a2)
{
}

void sub_10001C954(void *a1, _OWORD *a2)
{
}

uint64_t __DataStorage.init(bytes:length:copy:deallocator:offset:)()
{
  return __DataStorage.init(bytes:length:copy:deallocator:offset:)();
}

uint64_t __DataStorage._bytes.getter()
{
  return __DataStorage._bytes.getter();
}

uint64_t __DataStorage.init(length:)()
{
  return __DataStorage.init(length:)();
}

uint64_t __DataStorage._length.getter()
{
  return __DataStorage._length.getter();
}

uint64_t __DataStorage._offset.getter()
{
  return __DataStorage._offset.getter();
}

uint64_t type metadata accessor for __DataStorage()
{
  return type metadata accessor for __DataStorage();
}

uint64_t _convertNSErrorToError(_:)()
{
  return _convertNSErrorToError(_:)();
}

uint64_t type metadata accessor for URL.DirectoryHint()
{
  return type metadata accessor for URL.DirectoryHint();
}

void __swiftcall URL._bridgeToObjectiveC()(NSURL *__return_ptr retstr)
{
}

uint64_t URL.init(filePath:directoryHint:relativeTo:)()
{
  return URL.init(filePath:directoryHint:relativeTo:)();
}

uint64_t type metadata accessor for URL()
{
  return type metadata accessor for URL();
}

Swift::Void __swiftcall Data.LargeSlice.ensureUniqueReference()()
{
}

uint64_t Data._Representation.replaceSubrange(_:with:count:)()
{
  return Data._Representation.replaceSubrange(_:with:count:)();
}

uint64_t Data._Representation.subscript.getter()
{
  return Data._Representation.subscript.getter();
}

NSData __swiftcall Data._bridgeToObjectiveC()()
{
  return (NSData)Data._bridgeToObjectiveC()();
}

uint64_t Logger.logObject.getter()
{
  return Logger.logObject.getter();
}

uint64_t Logger.init(subsystem:category:)()
{
  return Logger.init(subsystem:category:)();
}

uint64_t type metadata accessor for Logger()
{
  return type metadata accessor for Logger();
}

uint64_t errno.getter()
{
  return errno.getter();
}

Swift::Int32 __swiftcall fcntl(_:_:_:)(Swift::Int32 a1, Swift::Int32 a2, Swift::Int32 a3)
{
  return fcntl(_:_:_:)(*(void *)&a1, *(void *)&a2, *(void *)&a3);
}

Swift::Int32 __swiftcall fcntl(_:_:)(Swift::Int32 a1, Swift::Int32 a2)
{
  return fcntl(_:_:)(*(void *)&a1, *(void *)&a2);
}

uint64_t ioctl(_:_:_:)()
{
  return ioctl(_:_:_:)();
}

uint64_t SIG_IGN.getter()
{
  return SIG_IGN.getter();
}

uint64_t FileDescriptor._close()()
{
  return FileDescriptor._close()();
}

uint64_t FileDescriptor._write(_:retryOnInterrupt:)()
{
  return FileDescriptor._write(_:retryOnInterrupt:)();
}

uint64_t Errno.description.getter()
{
  return Errno.description.getter();
}

uint64_t type metadata accessor for NWEndpoint.Host()
{
  return type metadata accessor for NWEndpoint.Host();
}

uint64_t NWEndpoint.Host.init(_:)()
{
  return NWEndpoint.Host.init(_:)();
}

uint64_t NWEndpoint.Port.debugDescription.getter()
{
  return NWEndpoint.Port.debugDescription.getter();
}

uint64_t NWEndpoint.Port.init(rawValue:)()
{
  return NWEndpoint.Port.init(rawValue:)();
}

uint64_t NWEndpoint.Port.rawValue.getter()
{
  return NWEndpoint.Port.rawValue.getter();
}

uint64_t type metadata accessor for NWEndpoint.Port()
{
  return type metadata accessor for NWEndpoint.Port();
}

uint64_t NWEndpoint.Port.init(_:)()
{
  return NWEndpoint.Port.init(_:)();
}

uint64_t NWListener.stateUpdateHandler.setter()
{
  return NWListener.stateUpdateHandler.setter();
}

uint64_t NWListener.newConnectionHandler.setter()
{
  return NWListener.newConnectionHandler.setter();
}

uint64_t type metadata accessor for NWListener.State()
{
  return type metadata accessor for NWListener.State();
}

uint64_t NWListener.start(queue:)()
{
  return NWListener.start(queue:)();
}

uint64_t NWListener.state.getter()
{
  return NWListener.state.getter();
}

uint64_t NWListener.init(using:on:)()
{
  return NWListener.init(using:on:)();
}

Swift::Void __swiftcall NWListener.cancel()()
{
}

uint64_t type metadata accessor for NWListener()
{
  return type metadata accessor for NWListener();
}

uint64_t IPv6Address.debugDescription.getter()
{
  return IPv6Address.debugDescription.getter();
}

uint64_t type metadata accessor for IPv6Address()
{
  return type metadata accessor for IPv6Address();
}

uint64_t IPv6Address.init(_:)()
{
  return IPv6Address.init(_:)();
}

uint64_t static NWConnection.ContentContext.defaultMessage.getter()
{
  return static NWConnection.ContentContext.defaultMessage.getter();
}

uint64_t type metadata accessor for NWConnection.ContentContext()
{
  return type metadata accessor for NWConnection.ContentContext();
}

uint64_t type metadata accessor for NWConnection.SendCompletion()
{
  return type metadata accessor for NWConnection.SendCompletion();
}

uint64_t NWConnection.stateUpdateHandler.setter()
{
  return NWConnection.stateUpdateHandler.setter();
}

uint64_t NWConnection.__allocating_init(host:port:using:)()
{
  return NWConnection.__allocating_init(host:port:using:)();
}

uint64_t NWConnection.send(content:contentContext:isComplete:completion:)()
{
  return NWConnection.send(content:contentContext:isComplete:completion:)();
}

uint64_t type metadata accessor for NWConnection.State()
{
  return type metadata accessor for NWConnection.State();
}

uint64_t NWConnection.start(queue:)()
{
  return NWConnection.start(queue:)();
}

uint64_t NWConnection.state.getter()
{
  return NWConnection.state.getter();
}

Swift::Void __swiftcall NWConnection.cancel()()
{
}

uint64_t NWConnection.receive(minimumIncompleteLength:maximumLength:completion:)()
{
  return NWConnection.receive(minimumIncompleteLength:maximumLength:completion:)();
}

uint64_t type metadata accessor for NWConnection()
{
  return type metadata accessor for NWConnection();
}

uint64_t NWParameters.acceptLocalOnly.setter()
{
  return NWParameters.acceptLocalOnly.setter();
}

uint64_t NWParameters.__allocating_init(tls:tcp:)()
{
  return NWParameters.__allocating_init(tls:tcp:)();
}

uint64_t type metadata accessor for NWParameters()
{
  return type metadata accessor for NWParameters();
}

uint64_t dispatch thunk of NWProtocolTCP.Options.keepaliveIdle.setter()
{
  return dispatch thunk of NWProtocolTCP.Options.keepaliveIdle.setter();
}

uint64_t dispatch thunk of NWProtocolTCP.Options.keepaliveCount.setter()
{
  return dispatch thunk of NWProtocolTCP.Options.keepaliveCount.setter();
}

uint64_t dispatch thunk of NWProtocolTCP.Options.enableKeepalive.setter()
{
  return dispatch thunk of NWProtocolTCP.Options.enableKeepalive.setter();
}

uint64_t dispatch thunk of NWProtocolTCP.Options.connectionTimeout.setter()
{
  return dispatch thunk of NWProtocolTCP.Options.connectionTimeout.setter();
}

uint64_t dispatch thunk of NWProtocolTCP.Options.keepaliveInterval.setter()
{
  return dispatch thunk of NWProtocolTCP.Options.keepaliveInterval.setter();
}

uint64_t NWProtocolTCP.Options.init()()
{
  return NWProtocolTCP.Options.init()();
}

uint64_t type metadata accessor for NWProtocolTCP.Options()
{
  return type metadata accessor for NWProtocolTCP.Options();
}

uint64_t type metadata accessor for NWError()
{
  return type metadata accessor for NWError();
}

uint64_t type metadata accessor for DispatchTimeInterval()
{
  return type metadata accessor for DispatchTimeInterval();
}

uint64_t type metadata accessor for DispatchWorkItemFlags()
{
  return type metadata accessor for DispatchWorkItemFlags();
}

uint64_t static DispatchQoS.unspecified.getter()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t type metadata accessor for DispatchQoS()
{
  return type metadata accessor for DispatchQoS();
}

uint64_t static DispatchTime.distantFuture.getter()
{
  return static DispatchTime.distantFuture.getter();
}

uint64_t static DispatchTime.now()()
{
  return static DispatchTime.now()();
}

uint64_t type metadata accessor for DispatchTime()
{
  return type metadata accessor for DispatchTime();
}

uint64_t DispatchWorkItem.init(flags:block:)()
{
  return DispatchWorkItem.init(flags:block:)();
}

uint64_t dispatch thunk of DispatchWorkItem.cancel()()
{
  return dispatch thunk of DispatchWorkItem.cancel()();
}

uint64_t type metadata accessor for DispatchWorkItem()
{
  return type metadata accessor for DispatchWorkItem();
}

uint64_t + infix(_:_:)()
{
  return + infix(_:_:)();
}

NSDictionary __swiftcall Dictionary._bridgeToObjectiveC()()
{
  return (NSDictionary)Dictionary._bridgeToObjectiveC()();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)String._bridgeToObjectiveC()();
}

uint64_t static String._forceBridgeFromObjectiveC(_:result:)()
{
  return static String._forceBridgeFromObjectiveC(_:result:)();
}

uint64_t static String._conditionallyBridgeFromObjectiveC(_:result:)()
{
  return static String._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t String.data(using:allowLossyConversion:)()
{
  return String.data(using:allowLossyConversion:)();
}

uint64_t static String.Encoding.utf8.getter()
{
  return static String.Encoding.utf8.getter();
}

uint64_t type metadata accessor for String.Encoding()
{
  return type metadata accessor for String.Encoding();
}

uint64_t String.utf8CString.getter()
{
  return String.utf8CString.getter();
}

uint64_t static String._uncheckedFromUTF8(_:)()
{
  return static String._uncheckedFromUTF8(_:)();
}

uint64_t String.hash(into:)()
{
  return String.hash(into:)();
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
}

uint64_t String.init(cString:)()
{
  return String.init(cString:)();
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return String.UTF8View._foreignCount()();
}

uint64_t String.UTF8View._foreignIndex(after:)()
{
  return String.UTF8View._foreignIndex(after:)();
}

uint64_t String.UTF8View._foreignIndex(_:offsetBy:limitedBy:)()
{
  return String.UTF8View._foreignIndex(_:offsetBy:limitedBy:)();
}

uint64_t String.UTF8View._foreignIndex(_:offsetBy:)()
{
  return String.UTF8View._foreignIndex(_:offsetBy:)();
}

uint64_t String.UTF8View._foreignDistance(from:to:)()
{
  return String.UTF8View._foreignDistance(from:to:)();
}

uint64_t String.UTF8View._foreignSubscript(position:)()
{
  return String.UTF8View._foreignSubscript(position:)();
}

uint64_t String.UTF16View.index(_:offsetBy:)()
{
  return String.UTF16View.index(_:offsetBy:)();
}

uint64_t String.init<A>(_:)()
{
  return String.init<A>(_:)();
}

uint64_t String.subscript.getter()
{
  return String.subscript.getter();
}

NSArray __swiftcall Array._bridgeToObjectiveC()()
{
  return (NSArray)Array._bridgeToObjectiveC()();
}

uint64_t static Array._allocateBufferUninitialized(minimumCapacity:)()
{
  return static Array._allocateBufferUninitialized(minimumCapacity:)();
}

uint64_t static os_log_type_t.info.getter()
{
  return static os_log_type_t.info.getter();
}

uint64_t static os_log_type_t.debug.getter()
{
  return static os_log_type_t.debug.getter();
}

uint64_t static os_log_type_t.error.getter()
{
  return static os_log_type_t.error.getter();
}

uint64_t static os_log_type_t.fault.getter()
{
  return static os_log_type_t.fault.getter();
}

uint64_t type metadata accessor for OS_dispatch_queue.Attributes()
{
  return type metadata accessor for OS_dispatch_queue.Attributes();
}

uint64_t OS_dispatch_queue.asyncAfter(deadline:execute:)()
{
  return OS_dispatch_queue.asyncAfter(deadline:execute:)();
}

uint64_t type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency()
{
  return type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
}

uint64_t static OS_dispatch_queue.main.getter()
{
  return static OS_dispatch_queue.main.getter();
}

uint64_t OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)()
{
  return OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
}

uint64_t static OS_dispatch_source.makeReadSource(fileDescriptor:queue:)()
{
  return static OS_dispatch_source.makeReadSource(fileDescriptor:queue:)();
}

uint64_t static OS_dispatch_source.makeSignalSource(signal:queue:)()
{
  return static OS_dispatch_source.makeSignalSource(signal:queue:)();
}

uint64_t OS_dispatch_source.isCancelled.getter()
{
  return OS_dispatch_source.isCancelled.getter();
}

uint64_t OS_dispatch_source.setEventHandler(qos:flags:handler:)()
{
  return OS_dispatch_source.setEventHandler(qos:flags:handler:)();
}

uint64_t OS_dispatch_source.data.getter()
{
  return OS_dispatch_source.data.getter();
}

Swift::Void __swiftcall OS_dispatch_source.cancel()()
{
}

Swift::Void __swiftcall OS_dispatch_source.resume()()
{
}

Swift::Void __swiftcall OS_dispatch_source.activate()()
{
}

uint64_t OS_dispatch_semaphore.wait(timeout:)()
{
  return OS_dispatch_semaphore.wait(timeout:)();
}

Swift::Void __swiftcall OS_dispatch_semaphore.wait()()
{
}

Swift::Int __swiftcall OS_dispatch_semaphore.signal()()
{
  return OS_dispatch_semaphore.signal()();
}

uint64_t Substring.UTF8View.subscript.getter()
{
  return Substring.UTF8View.subscript.getter();
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t UnsafeMutableRawBufferPointer.subscript.setter()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t dispatch thunk of SetAlgebra.init<A>(_:)()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

Swift::Void __swiftcall _StringGuts.grow(_:)(Swift::Int a1)
{
}

uint64_t _StringGuts.copyUTF8(into:)()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t _print_unlocked<A, B>(_:_:)()
{
  return _print_unlocked<A, B>(_:_:)();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t static _DictionaryStorage.allocate(capacity:)()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t Error._getEmbeddedNSError()()
{
  return Error._getEmbeddedNSError()();
}

uint64_t Error._code.getter()
{
  return Error._code.getter();
}

uint64_t Error._domain.getter()
{
  return Error._domain.getter();
}

uint64_t Error._userInfo.getter()
{
  return Error._userInfo.getter();
}

uint64_t print(_:separator:terminator:)()
{
  return print(_:separator:terminator:)();
}

uint64_t Hasher.init(_seed:)()
{
  return Hasher.init(_seed:)();
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return Hasher._finalize()();
}

void CFRelease(CFTypeRef cf)
{
}

NSString *NSHomeDirectory(void)
{
  return _NSHomeDirectory();
}

OSStatus SecIdentityCopyCertificate(SecIdentityRef identityRef, SecCertificateRef *certificateRef)
{
  return _SecIdentityCopyCertificate(identityRef, certificateRef);
}

OSStatus SecIdentityCopyPrivateKey(SecIdentityRef identityRef, SecKeyRef *privateKeyRef)
{
  return _SecIdentityCopyPrivateKey(identityRef, privateKeyRef);
}

CFDataRef SecKeyCopyExternalRepresentation(SecKeyRef key, CFErrorRef *error)
{
  return _SecKeyCopyExternalRepresentation(key, error);
}

SecKeyRef SecKeyCopyPublicKey(SecKeyRef key)
{
  return _SecKeyCopyPublicKey(key);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

uint64_t _CFXPCCreateXPCObjectFromCFObject()
{
  return __CFXPCCreateXPCObjectFromCFObject();
}

char ***_NSGetEnviron(void)
{
  return __NSGetEnviron();
}

int _NSGetExecutablePath(char *buf, uint32_t *bufsize)
{
  return __NSGetExecutablePath(buf, bufsize);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return ___error();
}

uint64_t __os_temporary_resource_shortage()
{
  return ___os_temporary_resource_shortage();
}

uint64_t __strlcpy_chk()
{
  return ___strlcpy_chk();
}

uint64_t _dispatch_is_multithreaded()
{
  return __dispatch_is_multithreaded();
}

uint64_t _os_crash()
{
  return __os_crash();
}

uint64_t _os_crash_msg()
{
  return __os_crash_msg();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _os_log_send_and_compose_impl()
{
  return __os_log_send_and_compose_impl();
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return __swift_stdlib_bridgeErrorToNSError();
}

int accept(int a1, sockaddr *a2, socklen_t *a3)
{
  return _accept(a1, a2, a3);
}

int asprintf(char **a1, const char *a2, ...)
{
  return _asprintf(a1, a2);
}

int atoi(const char *a1)
{
  return _atoi(a1);
}

int bind(int a1, const sockaddr *a2, socklen_t a3)
{
  return _bind(a1, a2, a3);
}

uint64_t bridge_version_read_plist()
{
  return _bridge_version_read_plist();
}

uint64_t bridge_version_serialize()
{
  return _bridge_version_serialize();
}

void bzero(void *a1, size_t a2)
{
}

__uint64_t clock_gettime_nsec_np(clockid_t __clock_id)
{
  return _clock_gettime_nsec_np(__clock_id);
}

int close(int a1)
{
  return _close(a1);
}

int connect(int a1, const sockaddr *a2, socklen_t a3)
{
  return _connect(a1, a2, a3);
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_main(void)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

void err(int a1, const char *a2, ...)
{
}

void errc(int a1, int a2, const char *a3, ...)
{
}

void errx(int a1, const char *a2, ...)
{
}

void exit(int a1)
{
}

int fclose(FILE *a1)
{
  return _fclose(a1);
}

int fcntl(int a1, int a2, ...)
{
  return _fcntl(a1, a2);
}

int fflush(FILE *a1)
{
  return _fflush(a1);
}

char *__cdecl fgetln(FILE *a1, size_t *a2)
{
  return _fgetln(a1, a2);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return _fopen(__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return _fprintf(a1, a2);
}

int fputs(const char *a1, FILE *a2)
{
  return _fputs(a1, a2);
}

void free(void *a1)
{
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return _fwrite(__ptr, __size, __nitems, __stream);
}

gid_t getegid(void)
{
  return _getegid();
}

int getopt(int a1, char *const a2[], const char *a3)
{
  return _getopt(a1, a2, a3);
}

pid_t getpgid(pid_t a1)
{
  return _getpgid(a1);
}

pid_t getpgrp(void)
{
  return _getpgrp();
}

pid_t getpid(void)
{
  return _getpid();
}

pid_t getppid(void)
{
  return _getppid();
}

int getsockname(int a1, sockaddr *a2, socklen_t *a3)
{
  return _getsockname(a1, a2, a3);
}

int gettimeofday(timeval *a1, void *a2)
{
  return _gettimeofday(a1, a2);
}

uid_t getuid(void)
{
  return _getuid();
}

int inet_pton(int a1, const char *a2, void *a3)
{
  return _inet_pton(a1, a2, a3);
}

int kevent(int kq, const kevent *changelist, int nchanges, kevent *eventlist, int nevents, const timespec *timeout)
{
  return _kevent(kq, changelist, nchanges, eventlist, nevents, timeout);
}

int kill(pid_t a1, int a2)
{
  return _kill(a1, a2);
}

int kqueue(void)
{
  return _kqueue();
}

int listen(int a1, int a2)
{
  return _listen(a1, a2);
}

uint64_t local_device_compute_platform_require_tls()
{
  return _local_device_compute_platform_require_tls();
}

uint64_t local_device_copy_description()
{
  return _local_device_copy_description();
}

uint64_t local_device_copy_identity()
{
  return _local_device_copy_identity();
}

uint64_t local_device_copy_service_names()
{
  return _local_device_copy_service_names();
}

uint64_t local_device_create_identity()
{
  return _local_device_create_identity();
}

uint64_t local_device_delete_identity()
{
  return _local_device_delete_identity();
}

tm *__cdecl localtime(const time_t *a1)
{
  return _localtime(a1);
}

size_t malloc_size(const void *ptr)
{
  return _malloc_size(ptr);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_calloc(count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

void *__cdecl malloc_type_valloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_valloc(size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return _memset(__b, __c, __len);
}

int mkdir(const char *a1, mode_t a2)
{
  return _mkdir(a1, a2);
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

uint64_t self
{
  return _self;
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_terminate(void)
{
}

int open(const char *a1, int a2, ...)
{
  return _open(a1, a2);
}

int openat(int a1, const char *a2, int a3, ...)
{
  return _openat(a1, a2, a3);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

uint64_t os_variant_has_internal_content()
{
  return _os_variant_has_internal_content();
}

int posix_spawn(pid_t *a1, const char *a2, const posix_spawn_file_actions_t *a3, const posix_spawnattr_t *a4, char *const __argv[], char *const __envp[])
{
  return _posix_spawn(a1, a2, a3, a4, __argv, __envp);
}

int posix_spawn_file_actions_adddup2(posix_spawn_file_actions_t *a1, int a2, int a3)
{
  return _posix_spawn_file_actions_adddup2(a1, a2, a3);
}

int posix_spawn_file_actions_addinherit_np(posix_spawn_file_actions_t *a1, int a2)
{
  return _posix_spawn_file_actions_addinherit_np(a1, a2);
}

int posix_spawn_file_actions_destroy(posix_spawn_file_actions_t *a1)
{
  return _posix_spawn_file_actions_destroy(a1);
}

int posix_spawn_file_actions_init(posix_spawn_file_actions_t *a1)
{
  return _posix_spawn_file_actions_init(a1);
}

int posix_spawnattr_destroy(posix_spawnattr_t *a1)
{
  return _posix_spawnattr_destroy(a1);
}

int posix_spawnattr_init(posix_spawnattr_t *a1)
{
  return _posix_spawnattr_init(a1);
}

int posix_spawnattr_setflags(posix_spawnattr_t *a1, __int16 a2)
{
  return _posix_spawnattr_setflags(a1, a2);
}

int posix_spawnattr_setsigdefault(posix_spawnattr_t *a1, const sigset_t *a2)
{
  return _posix_spawnattr_setsigdefault(a1, a2);
}

int posix_spawnattr_setsigmask(posix_spawnattr_t *a1, const sigset_t *a2)
{
  return _posix_spawnattr_setsigmask(a1, a2);
}

int printf(const char *a1, ...)
{
  return _printf(a1);
}

int putc(int a1, FILE *a2)
{
  return _putc(a1, a2);
}

int putchar(int a1)
{
  return _putchar(a1);
}

int puts(const char *a1)
{
  return _puts(a1);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return _read(a1, a2, a3);
}

ssize_t recv(int a1, void *a2, size_t a3, int a4)
{
  return _recv(a1, a2, a3, a4);
}

uint64_t remote_compute_controller_browse()
{
  return _remote_compute_controller_browse();
}

uint64_t remote_compute_node_listen()
{
  return _remote_compute_node_listen();
}

uint64_t remote_compute_platform_tls_required()
{
  return _remote_compute_platform_tls_required();
}

uint64_t remote_control_attach_loopback()
{
  return _remote_control_attach_loopback();
}

uint64_t remote_control_connect_loopback()
{
  return _remote_control_connect_loopback();
}

uint64_t remote_control_connect_network_peer()
{
  return _remote_control_connect_network_peer();
}

uint64_t remote_control_detach_loopback()
{
  return _remote_control_detach_loopback();
}

uint64_t remote_control_disable_bonjour()
{
  return _remote_control_disable_bonjour();
}

uint64_t remote_control_disable_network_peer()
{
  return _remote_control_disable_network_peer();
}

uint64_t remote_control_enable_bonjour()
{
  return _remote_control_enable_bonjour();
}

uint64_t remote_control_enable_bonjour_loopback()
{
  return _remote_control_enable_bonjour_loopback();
}

uint64_t remote_control_enable_network_peer()
{
  return _remote_control_enable_network_peer();
}

uint64_t remote_control_resume_loopback()
{
  return _remote_control_resume_loopback();
}

uint64_t remote_control_suspend_loopback()
{
  return _remote_control_suspend_loopback();
}

uint64_t remote_device_browse_present()
{
  return _remote_device_browse_present();
}

uint64_t remote_device_browser_cancel()
{
  return _remote_device_browser_cancel();
}

uint64_t remote_device_copy_bridge_version_string()
{
  return _remote_device_copy_bridge_version_string();
}

uint64_t remote_device_copy_device_with_name()
{
  return _remote_device_copy_device_with_name();
}

uint64_t remote_device_copy_device_with_uuid()
{
  return _remote_device_copy_device_with_uuid();
}

uint64_t remote_device_copy_internal_build()
{
  return _remote_device_copy_internal_build();
}

uint64_t remote_device_copy_local_service_names()
{
  return _remote_device_copy_local_service_names();
}

uint64_t remote_device_copy_os_build()
{
  return _remote_device_copy_os_build();
}

uint64_t remote_device_copy_os_version()
{
  return _remote_device_copy_os_version();
}

uint64_t remote_device_copy_product_type()
{
  return _remote_device_copy_product_type();
}

uint64_t remote_device_copy_properties()
{
  return _remote_device_copy_properties();
}

uint64_t remote_device_copy_property()
{
  return _remote_device_copy_property();
}

uint64_t remote_device_copy_service()
{
  return _remote_device_copy_service();
}

uint64_t remote_device_copy_service_names()
{
  return _remote_device_copy_service_names();
}

uint64_t remote_device_copy_unique_of_type()
{
  return _remote_device_copy_unique_of_type();
}

uint64_t remote_device_copy_uuid()
{
  return _remote_device_copy_uuid();
}

uint64_t remote_device_disconnect()
{
  return _remote_device_disconnect();
}

uint64_t remote_device_get_alias()
{
  return _remote_device_get_alias();
}

uint64_t remote_device_get_connectable()
{
  return _remote_device_get_connectable();
}

uint64_t remote_device_get_heartbeat_stats()
{
  return _remote_device_get_heartbeat_stats();
}

uint64_t remote_device_get_latest_connect_result()
{
  return _remote_device_get_latest_connect_result();
}

uint64_t remote_device_get_messaging_protocol_version()
{
  return _remote_device_get_messaging_protocol_version();
}

uint64_t remote_device_get_name()
{
  return _remote_device_get_name();
}

uint64_t remote_device_get_state()
{
  return _remote_device_get_state();
}

uint64_t remote_device_get_type()
{
  return _remote_device_get_type();
}

uint64_t remote_device_heartbeat()
{
  return _remote_device_heartbeat();
}

uint64_t remote_device_reset()
{
  return _remote_device_reset();
}

uint64_t remote_device_set_alias()
{
  return _remote_device_set_alias();
}

uint64_t remote_device_set_connected_callback()
{
  return _remote_device_set_connected_callback();
}

uint64_t remote_device_set_disconnected_callback()
{
  return _remote_device_set_disconnected_callback();
}

uint64_t remote_device_start_browsing()
{
  return _remote_device_start_browsing();
}

uint64_t remote_device_state_get_description()
{
  return _remote_device_state_get_description();
}

uint64_t remote_device_timesync()
{
  return _remote_device_timesync();
}

uint64_t remote_device_type_get_description()
{
  return _remote_device_type_get_description();
}

uint64_t remote_device_type_parse()
{
  return _remote_device_type_parse();
}

uint64_t remote_device_xpc_remote_connection_tls_enabled()
{
  return _remote_device_xpc_remote_connection_tls_enabled();
}

uint64_t remote_service_copy_properties()
{
  return _remote_service_copy_properties();
}

uint64_t remote_service_copy_property()
{
  return _remote_service_copy_property();
}

uint64_t remote_service_create_connected_socket()
{
  return _remote_service_create_connected_socket();
}

uint64_t remote_service_get_version()
{
  return _remote_service_get_version();
}

uint64_t remote_service_listen()
{
  return _remote_service_listen();
}

uint64_t remote_service_should_encrypt_socket_data()
{
  return _remote_service_should_encrypt_socket_data();
}

ssize_t sendmsg(int a1, const msghdr *a2, int a3)
{
  return _sendmsg(a1, a2, a3);
}

int setgid(gid_t a1)
{
  return _setgid(a1);
}

int setsockopt(int a1, int a2, int a3, const void *a4, socklen_t a5)
{
  return _setsockopt(a1, a2, a3, a4, a5);
}

int setuid(uid_t a1)
{
  return _setuid(a1);
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return _signal(a1, a2);
}

unsigned int sleep(unsigned int a1)
{
  return _sleep(a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return _snprintf(__str, __size, __format);
}

int socket(int a1, int a2, int a3)
{
  return _socket(a1, a2, a3);
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return _strdup(__s1);
}

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
}

size_t strftime(char *a1, size_t a2, const char *a3, const tm *a4)
{
  return _strftime(a1, a2, a3, a4);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

char *__cdecl strstr(char *__s1, const char *__s2)
{
  return _strstr(__s1, __s2);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return _strtol(__str, __endptr, __base);
}

uint64_t strtoll(const char *__str, char **__endptr, int __base)
{
  return _strtoll(__str, __endptr, __base);
}

unint64_t strtoul(const char *__str, char **__endptr, int __base)
{
  return _strtoul(__str, __endptr, __base);
}

unint64_t strtoull(const char *__str, char **__endptr, int __base)
{
  return _strtoull(__str, __endptr, __base);
}

uint64_t swift_allocBox()
{
  return _swift_allocBox();
}

uint64_t swift_allocError()
{
  return _swift_allocError();
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_arrayDestroy()
{
  return _swift_arrayDestroy();
}

uint64_t swift_arrayInitWithCopy()
{
  return _swift_arrayInitWithCopy();
}

uint64_t swift_beginAccess()
{
  return _swift_beginAccess();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return _swift_bridgeObjectRelease_n();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return _swift_bridgeObjectRetain_n();
}

uint64_t swift_deallocClassInstance()
{
  return _swift_deallocClassInstance();
}

uint64_t swift_deallocPartialClassInstance()
{
  return _swift_deallocPartialClassInstance();
}

uint64_t swift_endAccess()
{
  return _swift_endAccess();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_errorRetain()
{
  return _swift_errorRetain();
}

uint64_t swift_getErrorValue()
{
  return _swift_getErrorValue();
}

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
}

uint64_t swift_getSingletonMetadata()
{
  return _swift_getSingletonMetadata();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return _swift_getTypeByMangledNameInContextInMetadataState2();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_initStackObject()
{
  return _swift_initStackObject();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
}

uint64_t swift_once()
{
  return _swift_once();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_release_n()
{
  return _swift_release_n();
}

uint64_t swift_retain()
{
  return _swift_retain();
}

uint64_t swift_retain_n()
{
  return _swift_retain_n();
}

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_slowDealloc()
{
  return _swift_slowDealloc();
}

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_updateClassMetadata2()
{
  return _swift_updateClassMetadata2();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}

uint64_t swift_willThrowTypedImpl()
{
  return _swift_willThrowTypedImpl();
}

int tcsetpgrp(int a1, pid_t a2)
{
  return _tcsetpgrp(a1, a2);
}

time_t time(time_t *a1)
{
  return _time(a1);
}

int uuid_compare(const uuid_t uu1, const uuid_t uu2)
{
  return _uuid_compare(uu1, uu2);
}

void uuid_copy(uuid_t dst, const uuid_t src)
{
}

int uuid_parse(const uuid_string_t in, uuid_t uu)
{
  return _uuid_parse(in, uu);
}

void uuid_unparse(const uuid_t uu, uuid_string_t out)
{
}

pid_t wait3(int *a1, int a2, rusage *a3)
{
  return _wait3(a1, a2, a3);
}

void warnc(int a1, const char *a2, ...)
{
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return _write(__fd, __buf, __nbyte);
}

BOOL xpc_array_apply(xpc_object_t xarray, xpc_array_applier_t applier)
{
  return _xpc_array_apply(xarray, applier);
}

uint64_t xpc_copy_clean_description()
{
  return _xpc_copy_clean_description();
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return _xpc_dictionary_create(keys, values, count);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_BOOL(xdict, key);
}

size_t xpc_dictionary_get_count(xpc_object_t xdict)
{
  return _xpc_dictionary_get_count(xdict);
}

xpc_object_t xpc_dictionary_get_dictionary(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_dictionary(xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_uint64(xdict, key);
}

const uint8_t *__cdecl xpc_dictionary_get_uuid(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_uuid(xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

uint64_t xpc_file_transfer_create_with_path()
{
  return _xpc_file_transfer_create_with_path();
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return _xpc_get_type(object);
}

uint64_t xpc_remote_connection_activate()
{
  return _xpc_remote_connection_activate();
}

uint64_t xpc_remote_connection_cancel()
{
  return _xpc_remote_connection_cancel();
}

uint64_t xpc_remote_connection_create_with_remote_service()
{
  return _xpc_remote_connection_create_with_remote_service();
}

uint64_t xpc_remote_connection_get_remote_service_version()
{
  return _xpc_remote_connection_get_remote_service_version();
}

uint64_t xpc_remote_connection_send_barrier()
{
  return _xpc_remote_connection_send_barrier();
}

uint64_t xpc_remote_connection_send_message()
{
  return _xpc_remote_connection_send_message();
}

uint64_t xpc_remote_connection_set_event_handler()
{
  return _xpc_remote_connection_set_event_handler();
}

uint64_t xpc_remote_connection_set_local_service_version()
{
  return _xpc_remote_connection_set_local_service_version();
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return _xpc_string_get_string_ptr(xstring);
}

id objc_msgSend_JSONObjectWithData_options_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "JSONObjectWithData:options:error:");
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return _[a1 UTF8String];
}

id objc_msgSend_base64EncodedStringWithOptions_(void *a1, const char *a2, ...)
{
  return [a1 base64EncodedStringWithOptions:];
}

id objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(void *a1, const char *a2, ...)
{
  return [a1 dataWithBytesNoCopy:x0 length:x1 freeWhenDone:x2];
}

id objc_msgSend_sha256(void *a1, const char *a2, ...)
{
  return _[a1 sha256];
}

id objc_msgSend_stringByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return [a1 stringByAppendingPathComponent:];
}