uint64_t sub_100001DFC(mach_msg_header_t *a1, mach_msg_header_t *a2)
{
  char *v4;
  long long v5;
  uint64_t v6;
  uint64_t v7;
  audit_token_t atoken;
  pid_t pidp;
  uint64_t vars8;

  if (a1->msgh_id == 70)
  {
    v4 = (char *)a1 + ((a1->msgh_size + 3) & 0x1FFFFFFFCLL);
    pidp = 0;
    mig_reply_setup(a1, a2);
    a2[1].msgh_remote_port = -305;
    if (!*(_DWORD *)v4 && *((_DWORD *)v4 + 1) >= 0x34u)
    {
      v5 = *(_OWORD *)(v4 + 36);
      *(_OWORD *)atoken.val = *(_OWORD *)(v4 + 20);
      *(_OWORD *)&atoken.val[4] = v5;
      audit_token_to_au32(&atoken, 0, 0, 0, 0, 0, &pidp, 0, 0);
      if (!pidp)
      {
        v6 = sub_1000069F0(a1->msgh_local_port);
        if (v6)
        {
          v7 = v6;
          sub_100006918(v6);
          sub_100006850(v7);
        }
      }
    }
    return 1;
  }
  else
  {
    return sub_1000065F4(a1, (uint64_t)a2);
  }
}

uint64_t sub_100001F00()
{
  return 2;
}

uint64_t sub_100001F74(int a1, char *a2)
{
  uint64_t result = sub_1000073CC();
  if (result)
  {
    sub_10000A434((uint64_t)&unk_100021758);
    uint64_t v5 = sub_100004644(a1);
    if (v5)
    {
      if ((*(_DWORD *)(v5 + 32) & 0x40) != 0)
      {
        strcpy(a2, "NO-UUID-VOLUME-IS-IGNORED");
      }
      else if (*(_DWORD *)v5 == a1)
      {
        v6 = (const char *)(v5 + 64);
        size_t v7 = strlen((const char *)(v5 + 64));
        strncpy(a2, v6, v7);
      }
      else
      {
        strcpy(a2, "NO-UUID-UNKNOWN-DEVICE");
      }
    }
    else
    {
      strcpy(a2, "NO-UUID-NO-DEV-INFO");
    }
    return sub_10000A3A0((uint64_t)&unk_100021758);
  }
  else
  {
    strcpy(a2, "NO-UUID-NO-DEV-INFO");
  }
  return result;
}

void sub_100002080(uint64_t a1, unint64_t a2, uint64_t a3, mach_error_t a4)
{
  if (a4)
  {
    v6 = sub_1000079A4();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000135C8(a4, a2, v6);
    }
  }
  if (a2 > 0xD) {
    goto LABEL_10;
  }
  if (((1 << a2) & 0x2182) != 0) {
    return;
  }
  if (a2 == 2)
  {
    if ((dispatch_mach_mig_demux() & 1) == 0)
    {
      msg = (mach_msg_header_t *)dispatch_mach_msg_get_msg();
      mach_msg_destroy(msg);
    }
  }
  else
  {
LABEL_10:
    v8 = sub_1000079A4();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10001353C(a2, v8);
    }
  }
}

void sub_100002160(uint64_t a1)
{
  kern_return_t v2;
  mach_error_t v3;
  NSObject *v4;

  v1 = (void **)(a1 + 32);
  dispatch_release(*(dispatch_object_t *)(*(void *)(a1 + 32) + 8));
  *((void *)*v1 + 1) = 0;
  v2 = mach_port_mod_refs(mach_task_self_, *((_DWORD *)*v1 + 1), 1u, -1);
  if (v2)
  {
    v3 = v2;
    v4 = sub_1000079A4();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_100013E8C((int)v1, v3);
    }
  }
  free(*v1);
}

void sub_1000021F4(uint64_t a1)
{
  int handle = dispatch_source_get_handle(*(dispatch_source_t *)(a1 + 32));
  int v2 = dispatch_mig_server();
  if (v2)
  {
    int v3 = v2;
    v4 = sub_1000079A4();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_100013494(handle, v3, v4);
    }
  }
}

void *sub_100002274(void *a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  int v3 = v2;
  if ((*(_DWORD *)(a1[4] + 188) & 0x20) != 0)
  {
    xpc_dictionary_set_string(v2, "metric_type", "global");
    xpc_dictionary_set_int64(v3, "resident_size", a1[6]);
    xpc_dictionary_set_int64(v3, "virtual_size", a1[5]);
    xpc_dictionary_set_int64(v3, "string_table_count", dword_100021850);
    xpc_dictionary_set_int64(v3, "event_id", qword_1000206D0[dword_1000206E0] - *(void *)(a1[4] + 160));
    int64_t v5 = dword_100020720;
    v6 = "num_clients";
  }
  else
  {
    xpc_dictionary_set_string(v2, "metric_type", "client");
    v4 = sub_1000023D4();
    xpc_dictionary_set_string(v3, "client_name", v4);
    xpc_dictionary_set_int64(v3, "client_pid", *(int *)(a1[4] + 248));
    xpc_dictionary_set_int64(v3, "num_paths", *(int *)(a1[4] + 128));
    int64_t v5 = *(void *)(a1[4] + 296);
    v6 = "allocated_bytes";
  }
  xpc_dictionary_set_int64(v3, v6, v5);
  return v3;
}

char *sub_1000023D4()
{
  int v0 = __chkstk_darwin();
  if (proc_pidpath(v0, buffer, 0x1000u) < 1) {
    uint64_t result = 0;
  }
  else {
    uint64_t result = basename(buffer);
  }
  if (!result) {
    return "(unknown)";
  }
  return result;
}

uint64_t sub_100002474(const char ***a1, const char ***a2)
{
  return -strcmp(**a1, **a2);
}

uint64_t sub_1000024A0()
{
  thread_act_t v0 = mach_thread_self();
  pthread_setname_np("com.apple.fseventsd.dev.fsevents");
  integer_t policy_info = 19;
  thread_policy_set(v0, 3u, &policy_info, 1u);
  mach_port_deallocate(mach_task_self_, v0);
  integer_t v20 = 0;
  thread_act_t v1 = mach_thread_self();
  BOOLean_t get_default = 1;
  policy_infoCnt[0] = 1;
  if (!thread_policy_get(v1, 1u, &v20, policy_infoCnt, &get_default))
  {
    integer_t v20 = 0;
    thread_policy_set(v1, 1u, &v20, 1u);
  }
  mach_port_deallocate(mach_task_self_, v1);
  if (!dword_1000206C8)
  {
    while (1)
    {
      pthread_mutex_lock(&stru_1000201C0);
      uint64_t v4 = qword_100020730;
      if (qword_100020730) {
        break;
      }
      do
      {
LABEL_13:
        uint64_t v7 = v4;
        uint64_t v4 = *(void *)(v4 + 32);
      }
      while (v4);
      v8 = (int *)sub_10000DE50(1, 0x10000);
      *(void *)(v7 + 32) = v8;
      if (v8)
      {
        int64_t v5 = v8;
        ++dword_10002073C;
        goto LABEL_16;
      }
      pthread_cond_signal(&stru_100020200);
      pthread_mutex_unlock(&stru_1000201C0);
      v16 = sub_1000079A4();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_100016FC4(policy_infoCnt, (unsigned char *)policy_infoCnt + 1);
      }
      sleep(2u);
LABEL_35:
      if (dword_1000206C8) {
        goto LABEL_4;
      }
    }
    int64_t v5 = (int *)qword_100020730;
    while (1)
    {
      int v6 = v5[3];
      if (*v5 - v6 >= 0x8000 || v5[1] == v6) {
        break;
      }
      int64_t v5 = (int *)*((void *)v5 + 4);
      if (!v5) {
        goto LABEL_13;
      }
    }
LABEL_16:
    int v9 = v5[1];
    int v10 = v5[3];
    if (v9 == v5[2] && v9 == v10)
    {
      int v10 = 0;
      *((void *)v5 + 1) = 0;
      v5[1] = 0;
    }
    int64_t v12 = *v5 - (uint64_t)v10;
    pthread_mutex_unlock(&stru_1000201C0);
    ssize_t v13 = read(dword_100020048, (void *)(*((void *)v5 + 3) + v10), v12);
    if (v13 < 0)
    {
      if (*__error() == 9) {
        goto LABEL_4;
      }
    }
    else
    {
      ssize_t v14 = v13;
      if (v13)
      {
        if (v13 <= v12)
        {
          v5[3] += v13;
          pthread_mutex_lock(&stru_1000201C0);
          pthread_cond_signal(&stru_100020200);
          pthread_mutex_unlock(&stru_1000201C0);
        }
        else
        {
          v15 = sub_1000079A4();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            integer_t v20 = 134218240;
            ssize_t v21 = v14;
            __int16 v22 = 1024;
            int v23 = v12;
            _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "fsevent_producer: ************* DANGER : read %zd bytes but buffer is only %u", (uint8_t *)&v20, 0x12u);
          }
        }
      }
      else if (dword_1000206C8)
      {
        goto LABEL_4;
      }
    }
    goto LABEL_35;
  }
LABEL_4:
  if (*__error() != 9)
  {
    int v2 = dword_100020048;
    if ((dword_100020048 & 0x80000000) == 0)
    {
      dword_100020048 = -1;
      close(v2);
    }
  }
  pthread_mutex_lock(&stru_1000201C0);
  pthread_cond_signal(&stru_100020200);
  pthread_mutex_unlock(&stru_1000201C0);
  return 0;
}

uint64_t sub_1000027DC(unint64_t a1)
{
  kern_return_t v112;
  kern_return_t v113;
  NSObject *v114;
  NSObject *v115;
  uint64_t v116;
  int v117;
  int v118;
  void *v119;
  int v120;
  uint64_t v122;
  int v123;
  int v124;
  int v125;
  int *v126;
  char *v127;
  _OWORD *v128;
  pthread_cond_t *v129;
  uint64_t v130;
  int v131;
  int v132;
  char v133;
  int v134;
  _DWORD *v135;
  unint64_t v136;
  char *v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  stat v141;
  char __str[50];
  statfs buf;
  long long v144;
  _OWORD v145[16];
  _DWORD v146[32];
  _DWORD v147[32];
  void v148[32];
  mach_msg_type_number_t thread_info_outCnt[2];
  void v150[33];
  _DWORD v151[32];

  int v2 = "client";
  int v3 = *(_DWORD *)(a1 + 188);
  if ((v3 & 0x20) != 0) {
    int v2 = "disklogger";
  }
  snprintf(__str, 0x32uLL, "com.apple.fseventsd.%s.%d", v2, *(_DWORD *)(a1 + 248));
  pthread_setname_np(__str);
  uint64_t v4 = pthread_self();
  *(_DWORD *)(a1 + 320) = pthread_mach_thread_np(v4);
  if ((v3 & 0x20) != 0) {
    setiopolicy_np(0, 1, 2);
  }
  int v6 = (uid_t *)(a1 + 252);
  uid_t v5 = *(_DWORD *)(a1 + 252);
  if (v5)
  {
    if (!*(void *)(a1 + 344))
    {
      uint64_t v7 = getpwuid(v5);
      if (v7)
      {
        *(void *)(a1 + 344) = strdup(v7->pw_name);
      }
      else
      {
        v8 = sub_1000079A4();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
          sub_1000163E4(a1 + 252, v8, v9, v10, v11, v12, v13, v14);
        }
      }
    }
    if (*v6 && *(_DWORD *)(a1 + 112)) {
      sub_100001F00();
    }
  }
  if ((*(_DWORD *)(a1 + 188) & 0x400) == 0)
  {
    sub_100004744(a1);
    pthread_mutex_lock((pthread_mutex_t *)a1);
    *(_DWORD *)(a1 + 188) |= 0x400u;
    pthread_mutex_unlock((pthread_mutex_t *)a1);
  }
  v135 = (_DWORD *)(a1 + 252);
  if (*v6)
  {
    pthread_setugid_np(*v6, *(_DWORD *)(a1 + 256));
    v15 = *(const char **)(a1 + 344);
    if (v15)
    {
      if (initgroups(v15, *(_DWORD *)(a1 + 256)) < 0)
      {
        v16 = sub_1000079A4();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          v122 = *(void *)(a1 + 344);
          v123 = *(_DWORD *)(a1 + 252);
          v124 = *(_DWORD *)(a1 + 256);
          v125 = *__error();
          v126 = __error();
          v127 = strerror(*v126);
          buf.f_bsize = 136316162;
          *(void *)&buf.f_iosize = v122;
          WORD2(buf.f_blocks) = 1024;
          *(_DWORD *)((char *)&buf.f_blocks + 6) = v123;
          int v6 = (uid_t *)(a1 + 252);
          WORD1(buf.f_bfree) = 1024;
          HIDWORD(buf.f_bfree) = v124;
          LOWORD(buf.f_bavail) = 1024;
          *(_DWORD *)((char *)&buf.f_bavail + 2) = v125;
          HIWORD(buf.f_bavail) = 2080;
          buf.f_files = (uint64_t)v127;
          _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "client_loop: initgroups failed for user %s uid %d gid %d (err: %d/%s)", (uint8_t *)&buf, 0x28u);
        }
      }
    }
  }
  v17 = &off_100020000;
  if (!dword_1000206C8)
  {
    v44 = (pthread_cond_t *)(a1 + 64);
    v45 = (_OWORD *)(a1 + 324);
    v136 = a1 + 352;
    while (1)
    {
      if ((*(_DWORD *)(a1 + 188) & 0x1A) != 0) {
        goto LABEL_22;
      }
      pthread_mutex_lock((pthread_mutex_t *)a1);
      if (!*((_DWORD *)v17 + 434) && (*(_DWORD *)(a1 + 188) & 0x21B) == 0)
      {
        if ((v3 & 0x20) != 0)
        {
          if (pthread_cond_wait(v44, (pthread_mutex_t *)a1)) {
            goto LABEL_26;
          }
        }
        else
        {
          *(void *)&buf.f_bsize = 0;
          buf.f_blocks = 0;
          v150[1] = 0;
          v150[0] = 0;
          gettimeofday((timeval *)&buf, 0);
          v150[0] = *(void *)&buf.f_bsize + 15;
          v150[1] = 0;
          if (pthread_cond_timedwait(v44, (pthread_mutex_t *)a1, (const timespec *)v150) == 60
            && *(_DWORD *)(a1 + 240) == *(_DWORD *)(a1 + 244))
          {
            *(_DWORD *)(a1 + 188) |= 0x800u;
            pthread_mutex_unlock((pthread_mutex_t *)a1);
            pthread_exit(0);
          }
        }
      }
      pthread_mutex_unlock((pthread_mutex_t *)a1);
      if (!*((_DWORD *)v17 + 434) || (v3 & 0x20) != 0) {
        break;
      }
LABEL_225:
      if (*((_DWORD *)v17 + 434)) {
        goto LABEL_22;
      }
    }
    if ((*(_DWORD *)(a1 + 188) & 2) != 0
      || ((*(_DWORD *)(a1 + 188) & 1) != 0 ? (int v47 = sub_100010D44(a1)) : (int v47 = 0), (*(_DWORD *)(a1 + 188) & 2) != 0))
    {
LABEL_205:
      memset(&buf, 0, 40);
      thread_info_outCnt[0] = 10;
      v112 = thread_info(*(_DWORD *)(a1 + 320), 3u, (thread_info_t)&buf, thread_info_outCnt);
      if (v112)
      {
        v113 = v112;
        v114 = sub_1000079A4();
        if (os_log_type_enabled(v114, OS_LOG_TYPE_ERROR))
        {
          LODWORD(v150[0]) = 136315394;
          *(void *)((char *)v150 + 4) = "client_get_thread_info";
          WORD2(v150[1]) = 1024;
          *(_DWORD *)((char *)&v150[1] + 6) = v113;
          _os_log_error_impl((void *)&_mh_execute_header, v114, OS_LOG_TYPE_ERROR, "%s : [%d]thread_info", (uint8_t *)v150, 0x12u);
        }
      }
      else
      {
        _OWORD *v45 = *(_OWORD *)&buf.f_bsize;
      }
      if ((*(_DWORD *)(a1 + 188) & 8) != 0)
      {
        v117 = open(".", 0);
        if (v117 >= 1)
        {
          v118 = v117;
          if (!fcntl(v117, 50, &buf))
          {
            v119 = *(void **)(a1 + 120);
            if (v119) {
              free(v119);
            }
            *(void *)(a1 + 120) = strdup((const char *)&buf);
          }
          close(v118);
        }
        *(_DWORD *)(a1 + 188) &= ~8u;
        *(_DWORD *)(a1 + 188) |= 0x40u;
        syscall(348, "/");
        goto LABEL_222;
      }
      if ((*(_DWORD *)(a1 + 188) & 0x10) != 0)
      {
        if (*(void *)(a1 + 120))
        {
          if (syscall(348, *(void *)(a1 + 120)))
          {
            v115 = sub_1000079A4();
            if (os_log_type_enabled(v115, OS_LOG_TYPE_ERROR))
            {
              v116 = *(void *)(a1 + 120);
              buf.f_bsize = 136315138;
              *(void *)&buf.f_iosize = v116;
              _os_log_error_impl((void *)&_mh_execute_header, v115, OS_LOG_TYPE_ERROR, "client: failed to chdir back to %s", (uint8_t *)&buf, 0xCu);
            }
            goto LABEL_222;
          }
          goto LABEL_228;
        }
        if (!sub_100001F00()) {
LABEL_228:
        }
          *(_DWORD *)(a1 + 188) &= ~0x10u;
      }
LABEL_222:
      if ((v3 & 0x20) != 0)
      {
        v120 = 1;
        atomic_compare_exchange_strong_explicit(dword_100020700, (unsigned int *)&v120, 0, memory_order_relaxed, memory_order_relaxed);
        if (v120 == 1) {
          sub_100005318((uint64_t (*)(void))sub_10000C510);
        }
      }
      goto LABEL_225;
    }
    memset(v145, 0, sizeof(v145));
    if ((*(_DWORD *)(a1 + 188) & 0x200) != 0)
    {
      v48 = *(const char ***)(a1 + 136);
      *(void *)&v145[0] = *v48;
      v150[0] = strlen(*v48) + 1;
      v151[0] = 0x8000000;
      *(void *)thread_info_outCnt = *(void *)(a1 + 168);
      v146[0] = 0;
      v49 = *(uint64_t (**)(void, uint64_t, void *, _OWORD *, _DWORD *, _DWORD *, mach_msg_type_number_t *, void *, _DWORD *))(a1 + 208);
      if (v49)
      {
        int v50 = v49(*(void *)(a1 + 216), 1, v150, v145, v151, v146, thread_info_outCnt, v148, v147);
        if (!v50)
        {
          *(_DWORD *)(a1 + 188) &= ~0x200u;
          if ((*(_DWORD *)(a1 + 188) & 2) != 0) {
            goto LABEL_205;
          }
LABEL_92:
          unsigned int v51 = sub_10000AA08((_DWORD *)a1);
          if (v51)
          {
            v130 = v51;
            size_t v52 = (int)v51;
            v53 = (char *)malloc_type_malloc(8 * (int)v51, 0x2004093837F09uLL);
            if (!v53) {
              goto LABEL_22;
            }
            v54 = v53;
            v134 = v3;
            v128 = v45;
            v129 = v44;
            if ((int)v52 <= 0)
            {
              qsort(v53, v52, 8uLL, (int (__cdecl *)(const void *, const void *))sub_10000BBF0);
LABEL_203:
              free(v54);
              int v3 = v134;
              v17 = &off_100020000;
              v45 = v128;
              v44 = v129;
            }
            else
            {
              uint64_t v55 = 0;
              int v56 = *(_DWORD *)(a1 + 224);
              do
              {
                *(void *)&v53[8 * v55] = *(void *)(*(void *)(a1 + 416)
                                                     + 8 * (((int)v55 + *(_DWORD *)(a1 + 240)) % v56));
                ++v55;
              }
              while (v130 != v55);
              qsort(v53, v52, 8uLL, (int (__cdecl *)(const void *, const void *))sub_10000BBF0);
              uint64_t v57 = 0;
              int v58 = *(_DWORD *)(a1 + 224);
              int v59 = v130;
              do
              {
                *(void *)(*(void *)(a1 + 416) + 8 * (((int)v57 + *(_DWORD *)(a1 + 240)) % v58)) = *(void *)&v54[8 * v57];
                ++v57;
              }
              while (v130 != v57);
              int v60 = 0;
              uint64_t v61 = 0;
              int v62 = 0;
              v63 = (_OWORD *)(a1 + 260);
              v137 = v54;
              while ((*(_DWORD *)(a1 + 188) & 2) == 0)
              {
                v131 = v62;
                LODWORD(v64) = v59 - v60;
                if ((v59 - v60) >= 0x20) {
                  uint64_t v64 = 32;
                }
                else {
                  uint64_t v64 = v64;
                }
                v139 = v64;
                v132 = v60;
                if (v64)
                {
                  uint64_t v65 = 0;
                  LODWORD(v66) = 0;
                  v138 = v60;
                  while (1)
                  {
                    memset(&v141, 0, sizeof(v141));
                    v140 = v65;
                    uint64_t v61 = *(void *)&v54[8 * v65 + 8 * v138];
                    unint64_t v67 = *(unsigned int *)(a1 + 192);
                    if (((atomic_fetch_and_explicit((atomic_uchar *volatile)(v61 + (v67 >> 3) + 56), ~~(-129 >> (v67 & 7)), memory_order_relaxed) << (v67 & 7)) & 0x80) == 0)
                    {
                      v68 = sub_1000079A4();
                      if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
                      {
                        int v100 = *(_DWORD *)(a1 + 192);
                        buf.f_bsize = 134218240;
                        *(void *)&buf.f_iosize = v61;
                        WORD2(buf.f_blocks) = 1024;
                        *(_DWORD *)((char *)&buf.f_blocks + 6) = v100;
                        _os_log_error_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_ERROR, "client loop: event %p did not have my bit (%d) set!", (uint8_t *)&buf, 0x12u);
                      }
                    }
                    if (*v6) {
                      break;
                    }
LABEL_167:
                    uint64_t v94 = 0;
                    v95 = *(const char **)(v61 + 120);
                    do
                    {
                      v96 = *(const char **)(v136 + v94);
                      if (!v96) {
                        break;
                      }
                      size_t v97 = strlen(*(const char **)(v136 + v94));
                      if (!strncmp(v95, v96, v97)) {
                        goto LABEL_178;
                      }
                      v94 += 8;
                    }
                    while (v94 != 64);
                    *((void *)v145 + (int)v66) = v95;
                    v150[(int)v66] = *(__int16 *)(v61 + 52);
                    int v98 = *(_DWORD *)(v61 + 20);
                    v151[(int)v66] = v98;
                    v146[(int)v66] = *(_DWORD *)(v61 + 28);
                    *(void *)&thread_info_outCnt[2 * (int)v66] = *(void *)(v61 + 32);
                    v148[(int)v66] = *(void *)(v61 + 40);
                    v147[(int)v66] = *(_DWORD *)(v61 + 48);
                    if ((*(_DWORD *)(a1 + 188) & 0x1000) != 0 && *(_DWORD *)(a1 + 248) == *(_DWORD *)(v61 + 24)) {
                      v151[(int)v66] = v98 | 0x200000;
                    }
                    unint64_t v99 = *(void *)(v61 + 32);
                    v54 = v137;
                    if (v99 > *(void *)(a1 + 160)) {
                      *(void *)(a1 + 160) = v99;
                    }
LABEL_179:
                    uint64_t v66 = (v66 + 1);
                    uint64_t v65 = v140 + 1;
                    if (v140 + 1 == v139) {
                      goto LABEL_182;
                    }
                  }
                  char v69 = 1;
                  while (2)
                  {
                    if (*(_DWORD *)(a1 + 292) || (*(unsigned char *)(v61 + 23) & 6) != 0) {
                      goto LABEL_167;
                    }
                    v70 = *(char **)(v61 + 120);
                    if (*v70)
                    {
                      if (strncmp(*(const char **)(v61 + 120), ".docid/", 7uLL) && strncmp(v70, ".activity/", 0xAuLL))
                      {
                        char v71 = 1;
                        goto LABEL_120;
                      }
                      v144 = 0uLL;
                      DWORD2(v144) = *(_DWORD *)(v61 + 28);
                      sub_100005318((uint64_t (*)(void))sub_10000BC94);
                      v70 = (char *)v144;
                      if ((void)v144)
                      {
                        char v71 = 0;
                        goto LABEL_120;
                      }
                      v84 = sub_1000079A4();
                      if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR))
                      {
                        int v85 = *(_DWORD *)(v61 + 28);
                        buf.f_bsize = 136315394;
                        *(void *)&buf.f_iosize = "client_process_events";
                        WORD2(buf.f_blocks) = 1024;
                        *(_DWORD *)((char *)&buf.f_blocks + 6) = v85;
                        _os_log_error_impl((void *)&_mh_execute_header, v84, OS_LOG_TYPE_ERROR, "%s: path for pseudo path  device(%d)  is not available", (uint8_t *)&buf, 0x12u);
                      }
LABEL_159:
                      if ((*(_DWORD *)(a1 + 188) & 0x40) == 0 || (v69 & 1) == 0) {
                        goto LABEL_178;
                      }
                      memset(&buf, 0, 512);
                      v93 = *(const char **)(a1 + 120);
                      if (v93)
                      {
                        if (!statfs(v93, &buf)
                          && buf.f_fsid.val[0] == *(_DWORD *)(a1 + 112)
                          && syscall(348, *(void *)(a1 + 120)))
                        {
                          v101 = sub_1000079A4();
                          if (os_log_type_enabled(v101, OS_LOG_TYPE_ERROR))
                          {
                            uint64_t v103 = *(void *)(a1 + 120);
                            LODWORD(v144) = 136315138;
                            *(void *)((char *)&v144 + 4) = v103;
                            _os_log_error_impl((void *)&_mh_execute_header, v101, OS_LOG_TYPE_ERROR, "client: failed to chdir back to %s", (uint8_t *)&v144, 0xCu);
                          }
LABEL_178:
                          LODWORD(v66) = v66 - 1;
                          v54 = v137;
                          goto LABEL_179;
                        }
                      }
                      else if (sub_100001F00())
                      {
                        goto LABEL_178;
                      }
                      char v69 = 0;
                      *(_DWORD *)(a1 + 188) &= 0xFFFFFFAF;
                      if (!*(_DWORD *)(a1 + 252)) {
                        goto LABEL_167;
                      }
                      continue;
                    }
                    break;
                  }
                  char v71 = 1;
                  v70 = ".";
LABEL_120:
                  if (!lstat(v70, &v141))
                  {
                    if (!*(_DWORD *)(a1 + 248)) {
                      sub_1000163B8();
                    }
                    goto LABEL_125;
                  }
                  if (*__error() == 2) {
                    goto LABEL_122;
                  }
                  if (*__error() == 63
                    && (v78 = strrchr(v70, 47)) != 0
                    && (v79 = v78, v80 = v78 + 1, strlen(v78 + 1) >= 0xFF)
                    && (char v81 = *v80) != 0)
                  {
                    v82 = (unsigned __int8 *)(v79 + 2);
                    while ((v81 & 0x80) == 0)
                    {
                      int v83 = *v82++;
                      char v81 = v83;
                      if (!v83) {
                        goto LABEL_156;
                      }
                    }
LABEL_122:
                    v72 = sub_1000064D8(v70);
                    int v73 = access(v72, 4);
                    long long v74 = v63[1];
                    *(_OWORD *)&buf.f_bsize = *v63;
                    *(_OWORD *)&buf.f_bfree = v74;
                    int v75 = sandbox_check_by_audit_token();
                    free(v72);
                    if (!(v73 | v75))
                    {
                      BOOL v76 = 1;
                      goto LABEL_144;
                    }
                    uint64_t v86 = *(unsigned int *)(a1 + 128);
                    if ((int)v86 < 1)
                    {
                      BOOL v76 = 0;
LABEL_144:
                      v63 = (_OWORD *)(a1 + 260);
                      if ((v71 & 1) == 0) {
                        goto LABEL_157;
                      }
                    }
                    else
                    {
                      uint64_t v87 = 0;
                      v88 = *(char **)(v61 + 120);
                      uint64_t v89 = *(void *)(a1 + 136);
                      uint64_t v90 = 8 * v86;
                      while (!strstr(v88, *(const char **)(v89 + v87)))
                      {
                        v87 += 8;
                        if (v90 == v87)
                        {
                          BOOL v76 = 0;
                          int v6 = (uid_t *)(a1 + 252);
                          goto LABEL_144;
                        }
                      }
                      v91 = *(const char **)(v89 + v87);
                      if (*(_DWORD *)(a1 + 112))
                      {
                        if (*v91) {
                          v70 = *(char **)(v89 + v87);
                        }
                        else {
                          v70 = ".";
                        }
                        int v6 = (uid_t *)(a1 + 252);
                        v63 = (_OWORD *)(a1 + 260);
                        if (lstat(v70, &v141) || v141.st_uid != *v135) {
                          goto LABEL_156;
                        }
LABEL_125:
                        long long v77 = v63[1];
                        *(_OWORD *)&buf.f_bsize = *v63;
                        *(_OWORD *)&buf.f_bfree = v77;
                      }
                      else
                      {
                        int v6 = (uid_t *)(a1 + 252);
                        v63 = (_OWORD *)(a1 + 260);
                        if (lstat(v91, &v141) || v141.st_uid != *v135) {
                          goto LABEL_156;
                        }
                        long long v92 = *(_OWORD *)(a1 + 276);
                        *(_OWORD *)&buf.f_bsize = *(_OWORD *)(a1 + 260);
                        *(_OWORD *)&buf.f_bfree = v92;
                      }
                      BOOL v76 = sandbox_check_by_audit_token() == 0;
                      if ((v71 & 1) == 0) {
LABEL_157:
                      }
                        free(v70);
                    }
                  }
                  else
                  {
LABEL_156:
                    BOOL v76 = 0;
                    if ((v71 & 1) == 0) {
                      goto LABEL_157;
                    }
                  }
                  if (v76) {
                    goto LABEL_167;
                  }
                  goto LABEL_159;
                }
                uint64_t v66 = 0;
LABEL_182:
                v104 = *(uint64_t (**)(void, uint64_t, void *, _OWORD *, _DWORD *, _DWORD *, mach_msg_type_number_t *, void *, _DWORD *))(a1 + 208);
                if (v104 && (*(_DWORD *)(a1 + 188) & 2) == 0 && (int)v66 >= 1)
                {
                  int v105 = v104(*(void *)(a1 + 216), v66, v150, v145, v151, v146, thread_info_outCnt, v148, v147);
                  if (v105)
                  {
                    if (v105 == 268435459) {
                      *(_DWORD *)(a1 + 188) |= 2u;
                    }
                    v131 = v105;
                    *(_DWORD *)(a1 + 188) |= 1u;
                    if (!*(void *)(a1 + 152)) {
                      *(void *)(a1 + 152) = *(void *)thread_info_outCnt;
                    }
                    int v106 = *(_DWORD *)(a1 + 184);
                    *(_DWORD *)(a1 + 184) = v106 + 1;
                    if (v106 >= 5)
                    {
                      v107 = sub_1000079A4();
                      if (os_log_type_enabled(v107, OS_LOG_TYPE_ERROR))
                      {
                        int v111 = *(_DWORD *)(a1 + 248);
                        buf.f_bsize = 134218496;
                        *(void *)&buf.f_iosize = a1;
                        WORD2(buf.f_blocks) = 1024;
                        *(_DWORD *)((char *)&buf.f_blocks + 6) = v111;
                        WORD1(buf.f_bfree) = 1024;
                        HIDWORD(buf.f_bfree) = dword_1000206A0;
                        _os_log_error_impl((void *)&_mh_execute_header, v107, OS_LOG_TYPE_ERROR, "SLOWDOWN: client %p (pid %d) sleeping due to too many errors (num usleeps %d)", (uint8_t *)&buf, 0x18u);
                      }
                      sleep(2u);
                      *(_DWORD *)(a1 + 184) = 0;
                    }
                  }
                  else
                  {
                    ++*(void *)(a1 + 304);
                    v131 = 0;
                    *(void *)(a1 + 296) += strlen(*(const char **)(v61 + 120));
                  }
                }
                if (v139)
                {
                  v108 = (uint64_t *)&v54[8 * v132];
                  uint64_t v109 = v139;
                  do
                  {
                    uint64_t v110 = *v108++;
                    sub_100009A0C(v110);
                    --v109;
                  }
                  while (v109);
                }
                *(_DWORD *)(a1 + 240) = (*(_DWORD *)(a1 + 240) + v139) % *(_DWORD *)(a1 + 224);
                int v62 = v131;
                if (v131 == 268435460 || v131 == 268435469) {
                  goto LABEL_203;
                }
                int v60 = v139 + v132;
                int v59 = v130;
                if ((int)v139 + v132 >= (int)v130) {
                  break;
                }
              }
              free(v54);
              int v3 = v134;
              v17 = &off_100020000;
              v45 = v128;
              v44 = v129;
              if (v62) {
                goto LABEL_22;
              }
            }
          }
          goto LABEL_205;
        }
        int v47 = v50;
        if (v50 == 268435459)
        {
          *(_DWORD *)(a1 + 188) |= 2u;
          if ((*(_DWORD *)(a1 + 188) & 2) != 0) {
            goto LABEL_205;
          }
LABEL_90:
          *(void *)&buf.f_bsize = 0;
          buf.f_blocks = 0;
          gettimeofday((timeval *)&buf, 0);
          *(void *)&v141.st_dev = *(void *)&buf.f_bsize + 1;
          v141.st_ino = 0;
          pthread_mutex_lock((pthread_mutex_t *)a1);
          pthread_cond_timedwait(v44, (pthread_mutex_t *)a1, (const timespec *)&v141);
          pthread_mutex_unlock((pthread_mutex_t *)a1);
          goto LABEL_205;
        }
      }
    }
    if ((*(_DWORD *)(a1 + 188) & 2) != 0) {
      goto LABEL_205;
    }
    if (v47) {
      goto LABEL_90;
    }
    goto LABEL_92;
  }
LABEL_22:
  if (*((_DWORD *)v17 + 434)) {
    BOOL v18 = (v3 & 0x20) == 0;
  }
  else {
    BOOL v18 = 0;
  }
  if (!v18)
  {
LABEL_26:
    if (*v6 && *(_DWORD *)(a1 + 112)) {
      syscall(348, "/");
    }
    v133 = v3;
    pthread_mutex_lock((pthread_mutex_t *)a1);
    *(_DWORD *)(a1 + 188) |= 2u;
    pthread_mutex_unlock((pthread_mutex_t *)a1);
    if (atomic_fetch_add_explicit(&dword_10002071C, 0, memory_order_relaxed))
    {
      unsigned int v19 = 0;
      do
      {
        usleep(0x1388u);
        if (atomic_fetch_add_explicit(&dword_10002071C, 0, memory_order_relaxed)) {
          BOOL v20 = v19 >= 0x1387;
        }
        else {
          BOOL v20 = 1;
        }
        ++v19;
      }
      while (!v20);
    }
    pthread_mutex_lock(&stru_100020140);
    int v21 = sub_10000AA08((_DWORD *)a1);
    if (v21 >= 1)
    {
      uid_t v22 = v21;
      for (int i = 0; v22 != i; ++i)
      {
        uint64_t v24 = *(void *)(*(void *)(a1 + 416) + 8 * ((i + *(_DWORD *)(a1 + 240)) % *(_DWORD *)(a1 + 224)));
        if (v24)
        {
          unint64_t v25 = *(unsigned int *)(a1 + 192);
          if (((atomic_fetch_and_explicit((atomic_uchar *volatile)(v24 + (v25 >> 3) + 56), ~~(-129 >> (v25 & 7)), memory_order_relaxed) << (v25 & 7)) & 0x80) != 0)
          {
            sub_100009A0C(v24);
          }
          else
          {
            v32 = sub_1000079A4();
            if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
            {
              int v33 = *(_DWORD *)(v24 + 20);
              int v34 = *(_DWORD *)(a1 + 192);
              int v35 = *(char *)(v24 + 56);
              int v36 = *(char *)(v24 + 57);
              int v37 = *(_DWORD *)(a1 + 240);
              int32_t v38 = *(_DWORD *)(a1 + 244);
              buf.f_bsize = 134220032;
              *(void *)&buf.f_iosize = v24;
              WORD2(buf.f_blocks) = 1024;
              *(_DWORD *)((char *)&buf.f_blocks + 6) = v33;
              WORD1(buf.f_bfree) = 1024;
              HIDWORD(buf.f_bfree) = v34;
              LOWORD(buf.f_bavail) = 1024;
              *(_DWORD *)((char *)&buf.f_bavail + 2) = v35;
              HIWORD(buf.f_bavail) = 1024;
              LODWORD(buf.f_files) = v36;
              WORD2(buf.f_files) = 1024;
              *(_DWORD *)((char *)&buf.f_files + 6) = i;
              WORD1(buf.f_ffree) = 1024;
              HIDWORD(buf.f_ffree) = v37;
              LOWORD(buf.f_fsid.val[0]) = 1024;
              *(int32_t *)((char *)buf.f_fsid.val + 2) = v38;
              HIWORD(buf.f_fsid.val[1]) = 1024;
              buf.f_owner = v22;
              v29 = v32;
              v30 = "client drain: event %p (mask 0x%x) did not have my bit (%d) set! (0x%x 0x%x) (i %d rd %d wr %d, num_pending %d)";
              uint32_t v31 = 60;
              goto LABEL_47;
            }
          }
        }
        else
        {
          v26 = sub_1000079A4();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            int v27 = i + *(_DWORD *)(a1 + 240);
            int v28 = *(_DWORD *)(a1 + 224);
            buf.f_bsize = 67109120;
            buf.f_iosize = v27 % v28;
            v29 = v26;
            v30 = "client drain: *** encountered a NULL entry at idx %d";
            uint32_t v31 = 8;
LABEL_47:
            _os_log_error_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, v30, (uint8_t *)&buf, v31);
          }
        }
      }
    }
    sub_100004EA8(a1);
    sub_10000528C(a1);
    pthread_mutex_unlock(&stru_100020140);
    pthread_mutex_lock((pthread_mutex_t *)a1);
    if ((v133 & 0x20) == 0) {
      sub_100006754(*(void *)(a1 + 216));
    }
    free(*(void **)(a1 + 200));
    if (*(int *)(a1 + 128) >= 1)
    {
      uint64_t v39 = 0;
      do
      {
        free(*(void **)(*(void *)(a1 + 136) + 8 * v39));
        *(void *)(*(void *)(a1 + 136) + 8 * v39++) = 0;
      }
      while (v39 < *(int *)(a1 + 128));
    }
    free(*(void **)(a1 + 136));
    *(void *)(a1 + 136) = 0;
    for (uint64_t j = 352; j != 416; j += 8)
    {
      free(*(void **)(a1 + j));
      *(void *)(a1 + j) = 0;
    }
    v41 = *(void **)(a1 + 120);
    if (v41) {
      free(v41);
    }
    v42 = *(void **)(a1 + 344);
    if (v42) {
      free(v42);
    }
    if ((*(_DWORD *)(a1 + 188) & 0x1000) != 0)
    {
      pthread_mutex_lock(&stru_100020008);
      uint64_t v43 = 0;
      while (dword_100021858[v43] != *(_DWORD *)(a1 + 248))
      {
        if (++v43 == 32) {
          goto LABEL_230;
        }
      }
      dword_100021858[v43] = 0;
LABEL_230:
      pthread_mutex_unlock(&stru_100020008);
    }
    pthread_mutex_unlock((pthread_mutex_t *)a1);
    pthread_cond_destroy((pthread_cond_t *)(a1 + 64));
    free((void *)a1);
    if ((v133 & 0x20) != 0) {
      atomic_fetch_add_explicit(&dword_100020724, 0xFFFFFFFF, memory_order_relaxed);
    }
  }
  atomic_fetch_add_explicit(&dword_100020720, 0xFFFFFFFF, memory_order_relaxed);
  return 0;
}

uint64_t sub_100003AFC(uint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  sub_10000A434((uint64_t)&unk_100021758);
  if (a2)
  {
    uint64_t v13 = 0;
    uint64_t v14 = a2;
    uint64_t v96 = a6;
    uint64_t v97 = a7;
    uint64_t v95 = a4;
    uint64_t v94 = a2;
    while (1)
    {
      uint64_t v15 = sub_100004644(*(_DWORD *)(a6 + 4 * v13));
      if (!v15)
      {
        uint64_t v21 = qword_100020748;
        goto LABEL_18;
      }
      uint64_t v16 = v15;
      v17 = (uint64_t *)(v15 + 128);
      uint64_t v18 = qword_100020748;
      if (*(void *)(v15 + 128)) {
        uint64_t v19 = *(void *)(v15 + 128);
      }
      else {
        uint64_t v19 = qword_100020748;
      }
      if ((*(_DWORD *)(v15 + 32) & 0x80) == 0 && (*(_DWORD *)(v15 + 32) & 4) != 0) {
        goto LABEL_58;
      }
      bzero(&v122, 0x878uLL);
      if (strnstr(*(const char **)(a4 + 8 * v13), ".fseventsd", 0x400uLL)
        || strnstr(*(const char **)(a4 + 8 * v13), ".Spotlight-V100", 0x400uLL))
      {
        goto LABEL_119;
      }
      if (statfs(*(const char **)(v16 + 8), &v122) || v122.f_fsid.val[0] != *(_DWORD *)v16) {
        break;
      }
      if (time(0) - *(void *)(v16 + 40) >= 16)
      {
        BOOL v20 = sub_1000079A4();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          long long v92 = *(const char **)(v16 + 8);
          *(_DWORD *)buf = 136315138;
          v115 = v92;
          _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Events arrived for %s after an unmount request! Re-initializing.", buf, 0xCu);
        }
        *(_DWORD *)(v16 + 32) &= ~0x80u;
        *(_DWORD *)(v16 + 32) |= 0x2004u;
        sub_10000CFA0();
        *(_DWORD *)(v16 + 32) &= ~0x2000u;
LABEL_56:
        uint64_t v19 = *v17;
      }
      uint64_t v18 = qword_100020748;
LABEL_58:
      if ((*(_DWORD *)(v16 + 32) & 0x1000) == 0)
      {
        v53 = (gzFile_s *)v16;
        if (v19) {
          uint64_t v21 = v19;
        }
        else {
          uint64_t v21 = v18;
        }
        if (((uint64_t)v53[1].next & 0x40) == 0)
        {
          v54 = v53;
LABEL_65:
          if (((uint64_t)v54[1].next & 2) != 0)
          {
            uint64_t v55 = (uint64_t)v54;
            int v56 = sub_1000079A4();
            if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
            {
              uint64_t v91 = *(void *)(v55 + 8);
              v122.f_bsize = 136315138;
              *(void *)&v122.f_iosize = v91;
              _os_log_error_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_ERROR, "event id's wrapped for volume %s", (uint8_t *)&v122, 0xCu);
            }
            sub_10000DDAC(v21 + 2304);
            sub_10000F370(v21, 1);
            *(_DWORD *)(v21 + 252) = 0;
            *(void *)(v21 + 8) = 0;
            v54 = (gzFile_s *)v55;
            sub_10000F56C(v55, v21);
            *(_DWORD *)(v55 + 32) &= ~2u;
          }
          uid_t v22 = *(const char **)(a4 + 8 * v13);
          size_t v23 = *(void *)(a3 + 8 * v13);
          v101 = v54;
          if (*(_DWORD *)(a6 + 4 * v13) == v54->have)
          {
            int v57 = strncmp(v22, "/.docid/", 8uLL);
            int v58 = strncmp(v22, "/.activity/", 0xBuLL);
            int have = 1;
            if (v57 && v58 && (int have = v101[1].have, have < 1))
            {
              int v60 = v22;
            }
            else
            {
              int v60 = v22;
              do
              {
                if (*v60 == 47)
                {
                  --have;
                }
                else if (!*v60)
                {
                  break;
                }
                ++v60;
              }
              while (have > 0);
            }
            char v107 = 0;
            size_t v23 = &v22[v23] - v60;
            uid_t v22 = v60;
          }
          else
          {
            char v107 = 0;
          }
LABEL_19:
          unint64_t v24 = *(void *)(a7 + 8 * v13);
          if (v24 > *(void *)(v21 + 8))
          {
            *(void *)(v21 + 8) = v24;
            unint64_t v24 = *(void *)(a7 + 8 * v13);
          }
          uint64_t v25 = *(void *)(a8 + 8 * v13);
          unint64_t v106 = v24;
          int v104 = *(_DWORD *)(a5 + 4 * v13);
          int v105 = *(_DWORD *)(a9 + 4 * v13);
          if (v22[v23 - 1])
          {
            int v26 = v22[v23];
            int v27 = sub_1000079A4();
            BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_ERROR);
            if (v26)
            {
              if (v28)
              {
                v122.f_bsize = 136315394;
                *(void *)&v122.f_iosize = v22;
                WORD2(v122.f_blocks) = 2048;
                *(uint64_t *)((char *)&v122.f_blocks + 6) = v23;
                _os_log_error_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "add_fname: path <<%s>> has len %zd but no trailing nul char!", (uint8_t *)&v122, 0x16u);
              }
            }
            else
            {
              if (v28)
              {
                v122.f_bsize = 136315394;
                *(void *)&v122.f_iosize = v22;
                WORD2(v122.f_blocks) = 2048;
                *(uint64_t *)((char *)&v122.f_blocks + 6) = v23;
                _os_log_error_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "add_fname: path <<%s>> has len %zd but should be +1!", (uint8_t *)&v122, 0x16u);
              }
              ++v23;
            }
          }
          v29 = (pthread_rwlock_t *)(v21 + 2304);
          int v30 = *(_DWORD *)(v21 + 2512);
          uint64_t v108 = v13;
          uint64_t v109 = (pthread_rwlock_t *)(v21 + 2304);
          if (3 * v30 + 3 <= (4 * *(_DWORD *)(v21 + 2520)))
          {
            unsigned int v31 = 2 * v30 + 2;
            if (v31 >= 0x80000)
            {
              if (!*(_DWORD *)(v21 + 2516))
              {
                v32 = sub_1000079A4();
                if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
                {
                  int32_t v89 = *(_DWORD *)(v21 + 2520);
                  int v90 = *(_DWORD *)(v21 + 2512);
                  v122.f_bsize = 67109376;
                  v122.f_iosize = v89;
                  LOWORD(v122.f_blocks) = 1024;
                  *(_DWORD *)((char *)&v122.f_blocks + 2) = v90;
                  _os_log_error_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "fname table has grown too large. (filled %d / mask 0x%x)\n", (uint8_t *)&v122, 0xEu);
                }
                *(_DWORD *)(v21 + 2516) = 1;
              }
              goto LABEL_82;
            }
            v102 = v22;
            *(_DWORD *)buf = 0;
            int v33 = sub_10001274C(v31, buf);
            if (v33)
            {
              int v34 = v33;
              pthread_rwlock_wrlock((pthread_rwlock_t *)(v21 + 2304));
              int v35 = 0;
              int v36 = *(void **)(v21 + 2504);
              *(void *)(v21 + 2504) = v34;
              unsigned int v37 = *(_DWORD *)(v21 + 2512);
              *(_DWORD *)(v21 + 2512) = *(_DWORD *)buf;
              *(_DWORD *)(v21 + 2520) = 0;
              while (1)
              {
                int32_t v38 = (uint64_t *)v36[v35];
                if (v38) {
                  break;
                }
LABEL_52:
                if (++v35 > v37)
                {
                  v29 = (pthread_rwlock_t *)(v21 + 2304);
                  pthread_rwlock_unlock(v109);
                  free(v36);
                  uid_t v22 = v102;
                  goto LABEL_82;
                }
              }
              while (2)
              {
                uint64_t v39 = (unsigned char *)v38[5];
                int v40 = *v39;
                if (*v39)
                {
                  unsigned int v41 = 0;
                  v42 = v39 + 1;
                  do
                  {
                    unsigned int v41 = dword_100020298[v40 ^ HIBYTE(v41)] ^ (v41 << 8);
                    int v43 = *v42++;
                    int v40 = v43;
                  }
                  while (v43);
                }
                else
                {
                  unsigned int v41 = 0;
                }
                if (v41 <= 1) {
                  unsigned int v41 = 1;
                }
                unsigned int v44 = *(_DWORD *)(v21 + 2512);
                v45 = (uint64_t *)(*(void *)(v21 + 2504) + 8 * (v44 & v41));
                uint64_t v46 = *v45;
                if (*v45)
                {
                  int v47 = (uint64_t *)*v38;
                  *int32_t v38 = v46;
                  goto LABEL_50;
                }
                unsigned int v48 = *(_DWORD *)(v21 + 2520) + 1;
                *(_DWORD *)(v21 + 2520) = v48;
                if (v48 > v44)
                {
                  v49 = sub_1000079A4();
                  if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
                  {
                    int32_t v50 = *(_DWORD *)(v21 + 2520);
                    int v51 = *(_DWORD *)(v21 + 2512);
                    v122.f_bsize = 67109376;
                    v122.f_iosize = v50;
                    LOWORD(v122.f_blocks) = 1024;
                    *(_DWORD *)((char *)&v122.f_blocks + 2) = v51;
                    _os_log_error_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_ERROR, "fname table is screwed up! filled buckets %u / table_mask %u)", (uint8_t *)&v122, 0xEu);
                  }
                }
                uint64_t v46 = *v45;
                int v47 = (uint64_t *)*v38;
                *int32_t v38 = *v45;
                if (v46) {
LABEL_50:
                }
                  *(void *)(v46 + 8) = v38;
                uint64_t *v45 = (uint64_t)v38;
                v38[1] = (uint64_t)v45;
                int32_t v38 = v47;
                if (!v47) {
                  goto LABEL_52;
                }
                continue;
              }
            }
            uint64_t v61 = sub_1000079A4();
            if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR)) {
              sub_100016354(&v112, v113);
            }
          }
LABEL_82:
          int v62 = *(unsigned __int8 *)v22;
          if (*v22)
          {
            unsigned int v63 = 0;
            uint64_t v64 = v22;
            uint64_t v65 = (unsigned __int8 *)(v22 + 1);
            do
            {
              unsigned int v63 = dword_100020298[v62 ^ HIBYTE(v63)] ^ (v63 << 8);
              int v66 = *v65++;
              int v62 = v66;
            }
            while (v66);
          }
          else
          {
            uint64_t v64 = v22;
            unsigned int v63 = 0;
          }
          if (v63 <= 1) {
            int v67 = 1;
          }
          else {
            int v67 = v63;
          }
          pthread_rwlock_wrlock(v29);
          uint64_t v103 = (void *)(*(void *)(v21 + 2504) + 8 * (*(_DWORD *)(v21 + 2512) & v67));
          v68 = (void *)*v103;
          if (*v103)
          {
            unsigned int v69 = 0;
            while (1)
            {
              v70 = v68;
              v68 = (void *)*v68;
              if (v70[3] == v25)
              {
                char v71 = (const char *)v70[5];
                if (!strncmp(v71, v64, v23) && !v71[v23 - 1]) {
                  break;
                }
              }
              ++v69;
              if (!v68) {
                goto LABEL_98;
              }
            }
LABEL_112:
            pthread_rwlock_unlock(v109);
            int v81 = *((_DWORD *)v70 + 9) | v104;
            v70[2] = v106;
            v70[3] = v25;
            *((_DWORD *)v70 + 9) = v81;
            *((_DWORD *)v70 + 8) = v105;
          }
          else
          {
            unsigned int v69 = 0;
LABEL_98:
            int v72 = *(_DWORD *)(v21 + 2548);
            if (v72 < *(_DWORD *)(v21 + 2544))
            {
              uint64_t v73 = *(void *)(v21 + 2536);
              *(_DWORD *)(v21 + 2548) = v72 + 1;
              if (v69 > dword_100020728) {
                dword_100020728 = v69;
              }
              ++*(_DWORD *)(v21 + 2524);
              uint64_t v74 = v73 + 48 * v72;
              *(_DWORD *)(v74 + 36) = 0;
              int v75 = sub_10000A568(v64, v23);
              *(void *)(v74 + 40) = v75;
              BOOL v76 = (uint64_t *)(v74 + 40);
              if (v75[v23 - 1])
              {
                int v77 = dword_10002069C++;
                if (v77 <= 49)
                {
                  v78 = sub_1000079A4();
                  if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
                  {
                    uint64_t v86 = *v76;
                    v122.f_bsize = 136315394;
                    *(void *)&v122.f_iosize = v86;
                    WORD2(v122.f_blocks) = 2048;
                    *(uint64_t *)((char *)&v122.f_blocks + 6) = v23;
                    _os_log_error_impl((void *)&_mh_execute_header, v78, OS_LOG_TYPE_ERROR, "add_fname: path <<%s>> has len %zd", (uint8_t *)&v122, 0x16u);
                  }
                }
              }
              v70 = (void *)(v73 + 48 * v72);
              v79 = (void *)*v103;
              if (*v103)
              {
                *(void *)(v21 + 2528) += v23;
                v79[1] = v70;
              }
              else
              {
                ++*(_DWORD *)(v21 + 2520);
                *(void *)(v21 + 2528) += v23;
              }
              void *v70 = v79;
              *uint64_t v103 = v70;
              v70[1] = v103;
              goto LABEL_112;
            }
            v80 = sub_1000079A4();
            if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
            {
              int32_t v84 = *(_DWORD *)(v21 + 2544);
              int v85 = *(_DWORD *)(v21 + 2548);
              v122.f_bsize = 67109634;
              v122.f_iosize = v84;
              LOWORD(v122.f_blocks) = 1024;
              *(_DWORD *)((char *)&v122.f_blocks + 2) = v85;
              HIWORD(v122.f_blocks) = 2080;
              v122.f_bfree = (uint64_t)v64;
              _os_log_error_impl((void *)&_mh_execute_header, v80, OS_LOG_TYPE_ERROR, "too many filenames in the table (max %d cur %d) : path %s\n", (uint8_t *)&v122, 0x18u);
            }
            pthread_rwlock_unlock(v109);
          }
          a6 = v96;
          a7 = v97;
          uint64_t v13 = v108;
          a4 = v95;
          uint64_t v14 = v94;
          if ((v107 & 1) == 0 && *(_DWORD *)(v21 + 2524) >= 0xAAAu)
          {
            memset(&v122.f_bfree, 0, 24);
            *(void *)&v122.f_bsize = v101;
            v122.f_blocks = v21;
            v82 = malloc_type_zone_malloc((malloc_zone_t *)qword_1000206B8, 0x40000uLL, 0x31F9D4DBuLL);
            v122.f_bfree = (uint64_t)v82;
            if (v82)
            {
              v122.f_bavail = 0x40000;
              *(void *)v82 = 1145852723;
              v82[2] = 12;
              LODWORD(v122.f_files) = 12;
              sub_100006220(0, v109, (unsigned int (*)(uint64_t, uint64_t))sub_1000104B8, (uint64_t)&v122);
              sub_1000105C4(v101, v21, (uint64_t)&v122, 1);
              malloc_zone_free((malloc_zone_t *)qword_1000206B8, (void *)v122.f_bfree);
              sub_10000DDAC((uint64_t)v109);
            }
            else
            {
              int v83 = sub_1000079A4();
              if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR)) {
                sub_100016324(&v110, v111);
              }
            }
          }
          goto LABEL_119;
        }
        v54 = (gzFile_s *)sub_100004644(-1);
        uint64_t v21 = qword_100020748;
        if (v54) {
          goto LABEL_65;
        }
LABEL_18:
        v101 = 0;
        uid_t v22 = *(const char **)(a4 + 8 * v13);
        size_t v23 = *(void *)(a3 + 8 * v13);
        char v107 = 1;
        goto LABEL_19;
      }
LABEL_119:
      if (++v13 == v14) {
        goto LABEL_124;
      }
    }
    size_t v52 = sub_1000079A4();
    v17 = &qword_100020748;
    if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
    {
      uint64_t v87 = *(void *)(v16 + 8);
      int v88 = *(_DWORD *)v16;
      *(_DWORD *)buf = 136315906;
      v115 = "disk_logger_callback";
      __int16 v116 = 2080;
      uint64_t v117 = v87;
      __int16 v118 = 1024;
      int v119 = v88;
      __int16 v120 = 1024;
      int32_t v121 = v122.f_fsid.val[0];
      _os_log_error_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_ERROR, "%s: Assign to global disk logger - mount_point[%s], di->dev[%d] sfs.f_fsid.val[0]=[%d]", buf, 0x22u);
    }
    goto LABEL_56;
  }
LABEL_124:
  sub_10000A3A0((uint64_t)&unk_100021758);
  return 0;
}

uint64_t sub_100004644(int a1)
{
  thread_act_t v1 = (uint64_t *)qword_1000206E8;
  if (!qword_1000206E8) {
    return 0;
  }
  if (*(int *)(qword_1000206E8 + 8) < 1) {
    goto LABEL_15;
  }
  uint64_t v3 = 0;
  uint64_t v4 = 0;
  uint64_t result = 0;
  unsigned int v6 = -1;
  do
  {
    if ((*(_DWORD *)(*(void *)(*(void *)qword_1000206E8 + v3) + 32) & 0x4010) == 0)
    {
      uint64_t v7 = *(void *)(*(void *)qword_1000206E8 + v3);
      if (*(_DWORD *)v7 == a1)
      {
        if (*(void *)(v7 + 128))
        {
          uint64_t v8 = *(void *)qword_1000206E8 + v3;
          return *(void *)v8;
        }
        unsigned int v6 = v4;
      }
      else if (*(_DWORD *)(v7 + 32))
      {
        uint64_t result = *(void *)(*(void *)qword_1000206E8 + v3);
      }
    }
    ++v4;
    v3 += 8;
  }
  while (v4 < *(int *)(qword_1000206E8 + 8));
  if ((v6 & 0x80000000) == 0)
  {
    uint64_t v8 = *(void *)qword_1000206E8 + 8 * v6;
    return *(void *)v8;
  }
  if (!result)
  {
LABEL_15:
    uint64_t v9 = sub_1000079A4();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100014750();
    }
    uint64_t v8 = *v1;
    return *(void *)v8;
  }
  return result;
}

uint64_t sub_100004744(uint64_t a1)
{
  uint64_t v18 = 0;
  int v17 = 0;
  if (*(void *)(a1 + 232) == -1) {
    return 0;
  }
  int v2 = dword_100020740;
  if (dword_100020740)
  {
LABEL_3:
    uint64_t v3 = sub_100005318((uint64_t (*)(void))sub_1000054D8);
  }
  else
  {
    while (v2 != 10)
    {
      unsigned int v4 = v2;
      if ((*(_DWORD *)(a1 + 188) & 0x1A) == 0)
      {
        usleep(0x3D090u);
        int v2 = v4 + 1;
        if (!dword_100020740) {
          continue;
        }
      }
      if (v4 < 9) {
        goto LABEL_3;
      }
      break;
    }
    uid_t v5 = sub_1000079A4();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100016C48();
    }
    uint64_t v3 = 0;
  }
  if (*(void *)(a1 + 208) && (*(_DWORD *)(a1 + 188) & 2) == 0)
  {
    if (**(void **)(a1 + 136))
    {
      if ((*(_DWORD *)(a1 + 188) & 1) != 0 && (*(_DWORD *)(a1 + 188) & 0x4000) == 0) {
        uint64_t v3 = sub_100010D44(a1);
      }
      if (!v3)
      {
        __strlcpy_chk();
        size_t v22 = strlen(__s) + 1;
        BOOL v20 = __s;
        int v19 = 0x8000000;
        if (!*(void *)(a1 + 168)) {
          *(void *)(a1 + 168) = *(void *)(a1 + 232);
        }
        uint64_t v6 = (*(uint64_t (**)(void, uint64_t, size_t *, char **, int *, void, uint64_t, uint64_t *, int *))(a1 + 208))(*(void *)(a1 + 216), 1, &v22, &v20, &v19, 0, a1 + 168, &v18, &v17);
        uint64_t v3 = v6;
        if (v6)
        {
          if (v6 == 268435459) {
            *(_DWORD *)(a1 + 188) |= 2u;
          }
          uint64_t v7 = sub_1000079A4();
          if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
            sub_100016BCC(a1, v3, v7);
          }
          *(_DWORD *)(a1 + 188) |= 0x200u;
        }
      }
    }
    else
    {
      uint64_t v8 = sub_1000079A4();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_100016B54(v8, v9, v10, v11, v12, v13, v14, v15);
      }
    }
  }
  return v3;
}

uint64_t sub_100004984(int *a1, int a2, int *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  kern_return_t v17;
  mach_error_t v18;
  NSObject *v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int *v30;
  int v31;
  int v32;
  int v33;
  kern_return_t v34;
  mach_error_t v35;
  NSObject *v36;
  uint64_t v38;
  unsigned int v39;
  uint64_t v40;
  int v41;
  NSObject *v42;
  NSObject *v43;
  uint64_t v44;
  time_t v45;
  int v46;
  uint64_t v47;
  int v48;
  vm_address_t v49;
  vm_address_t address;
  uint8_t buf[4];
  const char *v52;
  __int16 v53;
  int v54;
  __int16 v55;
  unsigned int v56;
  __int16 v57;
  int v58;
  __int16 v59;
  int v60;

  v49 = 0;
  address = 0;
  if (!a1)
  {
    uint64_t v21 = sub_1000079A4();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_1000140D4(v21, v22, v23, v24, v25, v26, v27, v28);
    }
    BOOL v20 = 0xFFFFFFFFLL;
    int v14 = -1;
    int v16 = -1;
    goto LABEL_21;
  }
  int v14 = a2;
  int v16 = 4 * a2;
  int v17 = vm_allocate(mach_task_self_, &address, 4 * a2, -150994943);
  if (v17)
  {
    uint64_t v18 = v17;
    int v19 = sub_1000079A4();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_10001426C(v18);
    }
    int v14 = 0;
    address = 0;
    BOOL v20 = 4294967294;
    goto LABEL_23;
  }
  unsigned int v48 = v14;
  if (v14)
  {
    LODWORD(v29) = v14;
    int v14 = 0;
    v29 = v29;
    int v30 = a3;
    do
    {
      unsigned int v31 = *v30;
      v30 += 2;
      v32 = v14 + v31;
      int v33 = v14 + v31 + 8;
      if (a1[38]) {
        v32 = v33;
      }
      if (a1[39]) {
        int v14 = v32 + 4;
      }
      else {
        int v14 = v32;
      }
      --v29;
    }
    while (v29);
  }
  int v34 = vm_allocate(mach_task_self_, &v49, v14, -150994943);
  if (!v34)
  {
    int v47 = a7;
    if (v48)
    {
      int32_t v38 = 0;
      uint64_t v39 = 0;
      do
      {
        *(_DWORD *)(address + 4 * v38) = v39;
        strlcpy((char *)(v49 + v39), *(const char **)(a4 + 8 * v38), 0x400uLL);
        v39 += a3[2 * v38];
        if (a1[38])
        {
          if (a8) {
            int v40 = *(void *)(a8 + 8 * v38);
          }
          else {
            int v40 = 0;
          }
          *(void *)(v49 + v39) = v40;
          v39 += 8;
        }
        if (a1[39])
        {
          if (a9) {
            unsigned int v41 = *(_DWORD *)(a9 + 4 * v38);
          }
          else {
            unsigned int v41 = 0;
          }
          *(_DWORD *)(v49 + v39) = v41;
          v39 += 4;
        }
        ++v38;
      }
      while (v48 != v38);
    }
    else
    {
      uint64_t v39 = 0;
    }
    if (v39 != v14)
    {
      v42 = sub_1000079A4();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        size_t v52 = "callback_client";
        v53 = 1024;
        v54 = v48;
        uint64_t v55 = 1024;
        int v56 = v39;
        int v57 = 1024;
        int v58 = v14;
        int v59 = 1024;
        int v60 = v48;
        _os_log_error_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_ERROR, "%s: ERROR: npaths=%d j=%d paths_blob_size=%d i=%d", buf, 0x24u);
      }
      int v43 = sub_1000079A4();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
        sub_10001414C(v43);
      }
    }
    unsigned int v44 = sub_100004D8C(*a1, 0x2710u, v48, address, v48, a5, v48, v47, v48, v49, v14);
    BOOL v20 = v44;
    if (!v44 || v44 == 268435459) {
      goto LABEL_21;
    }
    v45 = time(0);
    if (v45 - qword_100020270 < 5)
    {
      if (v45 - qword_100020270 < 2 || (uint64_t v46 = a1[34], dword_100020278 == v46))
      {
LABEL_53:
        if (v20 == 268435460)
        {
          ++dword_1000206A0;
          usleep(0x186A0u);
          BOOL v20 = 268435460;
        }
        goto LABEL_21;
      }
    }
    else
    {
      uint64_t v46 = a1[34];
    }
    qword_100020270 = v45;
    dword_100020278 = v46;
    goto LABEL_53;
  }
  int v35 = v34;
  int v36 = sub_1000079A4();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
    sub_1000141E4(v35);
  }
  v49 = 0;
  BOOL v20 = 4294967293;
LABEL_21:
  if (address) {
    vm_deallocate(mach_task_self_, address, v16);
  }
LABEL_23:
  if (v49) {
    vm_deallocate(mach_task_self_, v49, v14);
  }
  return v20;
}

uint64_t sub_100004D8C(int a1, mach_msg_timeout_t timeout, int a3, uint64_t a4, int a5, uint64_t a6, int a7, uint64_t a8, int a9, uint64_t a10, int a11)
{
  uint64_t v15 = a4;
  int v16 = 16777472;
  int v17 = 4 * a5;
  uint64_t v18 = a6;
  int v19 = 16777472;
  int v20 = 4 * a7;
  uint64_t v21 = a8;
  int v22 = 16777472;
  int v23 = 8 * a9;
  uint64_t v24 = a10;
  int v25 = 16777472;
  int v26 = a11;
  NDR_record_t v27 = NDR_record;
  int v28 = a3;
  int v29 = a5;
  int v30 = a7;
  int v31 = a9;
  int v32 = a11;
  *(void *)msg = 2147483667;
  *(_DWORD *)&msg[8] = a1;
  *(_OWORD *)&msg[12] = xmmword_100019230;
  if (&_voucher_mach_msg_set) {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
  }
  uint64_t v12 = mach_msg((mach_msg_header_t *)msg, 17, 0x78u, 0, 0, timeout, 0);
  if ((v12 - 268435459) <= 1)
  {
    if ((*(_WORD *)msg & 0x1F00) == 0x1100) {
      mach_port_deallocate(mach_task_self_, *(mach_port_name_t *)&msg[12]);
    }
    mach_msg_destroy((mach_msg_header_t *)msg);
  }
  return v12;
}

uint64_t sub_100004EA8(uint64_t a1)
{
  if (qword_100020708)
  {
    int v2 = (int *)malloc_type_malloc(0x10uLL, 0x1080040FC6463CFuLL);
    if (v2)
    {
      uint64_t v3 = (uint64_t)v2;
      *(_OWORD *)int v2 = *(_OWORD *)qword_100020708;
      unsigned int v4 = malloc_type_malloc(8 * v2[3], 0x2004093837F09uLL);
      if (v4)
      {
        uid_t v5 = v4;
        pthread_mutex_lock(&stru_100020180);
        memcpy(v5, *(const void **)v3, 8 * *(int *)(v3 + 12));
        *(void *)uint64_t v3 = v5;
        if (*(int *)(a1 + 128) >= 1)
        {
          uint64_t v6 = 0;
          uint64_t v7 = 0;
          while (1)
          {
            uint64_t v8 = *(unsigned int *)(v3 + 8);
            if ((int)v8 < 1)
            {
              LODWORD(v9) = 0;
              goto LABEL_31;
            }
            uint64_t v9 = 0;
            int v10 = *(_DWORD *)(a1 + 112);
            uint64_t v11 = *(void **)v3;
            while (1)
            {
              uint64_t v12 = v11[v9];
              if ((!v10 || v10 == *(_DWORD *)(v12 + 8))
                && !strcmp(*(const char **)(*(void *)(a1 + 136) + 8 * v6), *(const char **)v12))
              {
                uint64_t v13 = *(void **)(v12 + 24);
                if (v13) {
                  break;
                }
              }
LABEL_16:
              if (++v9 == v8)
              {
                LODWORD(v9) = v8;
                goto LABEL_31;
              }
            }
            int v14 = 0;
            while (1)
            {
              uint64_t v15 = v13;
              if (*v13 == a1 && v13 == (void *)(*(void *)(a1 + 200) + 16 * v6)) {
                break;
              }
              uint64_t v13 = (void *)v13[1];
              int v14 = v15;
              if (!v13) {
                goto LABEL_16;
              }
            }
            uint64_t v16 = v13[1];
            if (v14)
            {
              v14[1] = v16;
            }
            else
            {
              *(void *)(v12 + 24) = v16;
              uint64_t v11 = *(void **)v3;
            }
            v15[1] = 0;
            int v17 = (char *)&v11[v9];
            uint64_t v18 = *(void *)v17;
            uint64_t v19 = *(void *)(*(void *)v17 + 24);
            int v20 = *(_DWORD *)(*(void *)v17 + 16) - 1;
            *(_DWORD *)(*(void *)v17 + 16) = v20;
            if (v20) {
              break;
            }
            if (v19)
            {
              int v25 = sub_1000079A4();
              if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
                goto LABEL_31;
              }
              uint64_t v26 = *(void *)(*(void *)v3 + 8 * v9);
              *(_DWORD *)buf = 67109376;
              LODWORD(v34[0]) = v9;
              WORD2(v34[0]) = 2048;
              *(void *)((char *)v34 + 6) = v26;
              int v23 = v25;
              uint64_t v24 = "remove_paths: prefix_table inconsistent.  refcount == 0 but client_list is non-NULL! prefix_table[%d] = %p";
              goto LABEL_29;
            }
            *(_DWORD *)(v18 + 8) = -1;
            memmove(v17, &v11[(v9 + 1)], 8 * (*(_DWORD *)(v3 + 8) + ~v9));
            --*(_DWORD *)(v3 + 8);
            LODWORD(v9) = v9 - 1;
            *(void *)(v18 + 24) = v7;
            uint64_t v7 = v18;
LABEL_31:
            if ((int)v9 >= *(_DWORD *)(v3 + 8))
            {
              NDR_record_t v27 = sub_1000079A4();
              if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
              {
                uint64_t v28 = *(void *)(*(void *)(a1 + 136) + 8 * v6);
                *(_DWORD *)buf = 136315138;
                v34[0] = v28;
                _os_log_error_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "remove_paths: did not find prefix header for path %s", buf, 0xCu);
              }
            }
            if (++v6 >= *(int *)(a1 + 128)) {
              goto LABEL_39;
            }
          }
          if (v19) {
            goto LABEL_31;
          }
          uint64_t v21 = sub_1000079A4();
          if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
            goto LABEL_31;
          }
          uint64_t v22 = *(void *)(*(void *)v3 + 8 * v9);
          *(_DWORD *)buf = 67109376;
          LODWORD(v34[0]) = v9;
          WORD2(v34[0]) = 2048;
          *(void *)((char *)v34 + 6) = v22;
          int v23 = v21;
          uint64_t v24 = "remove_paths: prefix_table inconsistent.  refcount > 0 but client_list is NULL! prefix_table[%d] = %p";
LABEL_29:
          _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, v24, buf, 0x12u);
          goto LABEL_31;
        }
        uint64_t v7 = 0;
LABEL_39:
        pthread_mutex_unlock(&stru_100020180);
        int v30 = (void **)qword_100020708;
        qword_100020708 = v3;
        __dmb(0xBu);
        do
        {
          if (!atomic_fetch_add_explicit(&dword_100020718, 0, memory_order_relaxed)) {
            break;
          }
          usleep(0x2710u);
        }
        while ((void **)qword_100020710 == v30);
        if (v30)
        {
          free(*v30);
          free(v30);
        }
        if (v7)
        {
          do
          {
            uint64_t v31 = *(void *)(v7 + 24);
            free(*(void **)v7);
            *(void *)&long long v32 = 0xD9D9D9D9D9D9D9D9;
            *((void *)&v32 + 1) = 0xD9D9D9D9D9D9D9D9;
            *(_OWORD *)uint64_t v7 = v32;
            *(_OWORD *)(v7 + 16) = v32;
            free((void *)v7);
            uint64_t v7 = v31;
          }
          while (v31);
        }
        return 0;
      }
      free((void *)v3);
    }
    return 12;
  }
  return 0;
}

uint64_t sub_10000528C(unint64_t a1)
{
  uint64_t v1 = 0;
  int v2 = *(_DWORD *)(a1 + 248);
  do
  {
    if (v2 == dword_1000218D8[v1])
    {
      int v3 = dword_1000218D8[v1 + 1];
      BOOL v4 = __OFSUB__(v3--, 1);
      dword_1000218D8[v1 + 1] = v3;
      if ((v3 < 0) ^ v4 | (v3 == 0)) {
        dword_1000218D8[v1] = 0;
      }
    }
    v1 += 2;
  }
  while (v1 != 1024);
  uint64_t v5 = 0;
  int64x2_t v6 = vdupq_n_s64(a1);
  do
  {
    int32x2_t v7 = vmovn_s64(vceqq_s64((int64x2_t)xmmword_100020758[v5], v6));
    if (v7.i8[0]) {
      *(void *)&xmmword_100020758[v5] = 0;
    }
    if (v7.i8[4]) {
      *((void *)&xmmword_100020758[v5] + 1) = 0;
    }
    ++v5;
  }
  while (v5 != 256);
  return 0;
}

uint64_t sub_100005318(uint64_t (*a1)(void))
{
  sub_10000A434((uint64_t)&unk_100021758);
  if (qword_1000206E8)
  {
    int v2 = malloc_type_calloc(*(int *)(qword_1000206E8 + 8), 8uLL, 0x2004093837F09uLL);
    if (v2)
    {
      int v3 = v2;
      memcpy(v2, *(const void **)qword_1000206E8, 8 * *(int *)(qword_1000206E8 + 8));
      int v4 = *(_DWORD *)(qword_1000206E8 + 8);
      if (v4 <= 0)
      {
        sub_10000A3A0((uint64_t)&unk_100021758);
        uint64_t v12 = 0;
      }
      else
      {
        uint64_t v5 = (v4 - 1);
        uint64_t v6 = v5;
        do
        {
          uint64_t v7 = v3[v6];
          if ((*(_DWORD *)(v7 + 32) & 0x50) != 0) {
            v3[v6] = 0;
          }
          else {
            atomic_fetch_add_explicit((atomic_uint *volatile)(v7 + 36), 1u, memory_order_relaxed);
          }
          BOOL v8 = v6-- <= 0;
        }
        while (!v8);
        sub_10000A3A0((uint64_t)&unk_100021758);
        uint64_t v9 = v5;
        while (1)
        {
          uint64_t v10 = v3[v9];
          if (v10)
          {
            if ((*(_DWORD *)(v10 + 32) & 0x50) == 0)
            {
              uint64_t v11 = a1();
              if (v11) {
                break;
              }
            }
          }
          BOOL v8 = v9-- <= 0;
          if (v8)
          {
            uint64_t v12 = 0;
            goto LABEL_17;
          }
        }
        uint64_t v12 = v11;
        do
        {
LABEL_17:
          uint64_t v13 = v3[v5];
          if (v13) {
            atomic_fetch_add_explicit((atomic_uint *volatile)(v13 + 36), 0xFFFFFFFF, memory_order_relaxed);
          }
          BOOL v8 = v5-- <= 0;
        }
        while (!v8);
      }
      free(v3);
    }
    else
    {
      int v14 = sub_1000079A4();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_1000146D0();
      }
      sub_10000A3A0((uint64_t)&unk_100021758);
      return 12;
    }
  }
  else
  {
    sub_10000A3A0((uint64_t)&unk_100021758);
    return 0;
  }
  return v12;
}

uint64_t sub_1000054D8(uint64_t a1, uint64_t a2)
{
  uint64_t v50 = 0;
  int v3 = (_DWORD *)(a1 + 32);
  if ((*(_DWORD *)(a1 + 32) & 0x50) != 0)
  {
    int v4 = sub_1000079A4();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_100016624();
    }
  }
  else if ((*v3 & 0x90) == 0 && (*v3 & 4) != 0)
  {
    int v6 = *(_DWORD *)(a2 + 112);
    if (!v6 || v6 == *(_DWORD *)a1)
    {
      uint64_t v7 = *(void *)(a1 + 128);
      if (v7 && *(void *)(v7 + 16))
      {
        int v8 = 0;
        unint64_t v9 = *(void *)(a2 + 232);
        uint64_t v10 = (pthread_rwlock_t *)(v7 + 48);
        int v47 = (const char *)(v7 + 256);
        unsigned int v44 = (pthread_rwlock_t *)(v7 + 48);
LABEL_11:
        pthread_rwlock_rdlock(v10);
        int v11 = *(_DWORD *)(v7 + 32);
        if (v11 >= 1)
        {
          int v12 = 0;
          int v13 = *(_DWORD *)(v7 + 32);
          while (1)
          {
            int v14 = v12 + v13;
            if (v12 + v13 >= 0) {
              int v15 = v12 + v13;
            }
            else {
              int v15 = v14 + 1;
            }
            LODWORD(v16) = v15 >> 1;
            unint64_t v17 = *(void *)(*(void *)(v7 + 40) + 8 * (v15 >> 1));
            if (v17 <= v9)
            {
              if (v17 >= v9)
              {
                if ((v14 + 3) <= 1) {
LABEL_24:
                }
                  LODWORD(v16) = v12 - (v12 > 0);
                uint64_t v18 = *(unsigned __int16 *)(v7 + 248);
                unsigned int v46 = *(unsigned __int16 *)(v7 + 250);
                while (1)
                {
                  uint64_t v19 = v18;
                  int v20 = v11;
                  pthread_rwlock_unlock(v44);
                  int v45 = v20;
                  unsigned int v43 = v20 - 1;
                  if ((int)v16 >= v20 - 1)
                  {
                    uint64_t v18 = v19;
                  }
                  else
                  {
                    uint64_t v16 = (int)v16;
                    uint64_t v48 = v20 - 1;
                    uint64_t v49 = 0;
                    uint64_t v18 = v19;
                    while ((*(_DWORD *)(a2 + 188) & 0x1A) == 0)
                    {
                      if ((*v3 & 0x90) != 0 || (*v3 & 4) == 0) {
                        return 0;
                      }
                      pthread_rwlock_rdlock(v44);
                      if (__PAIR64__(v46, v19) != __PAIR64__(*(unsigned __int16 *)(v7 + 250), *(unsigned __int16 *)(v7 + 248)))
                      {
                        pthread_rwlock_unlock(v44);
                        *(_DWORD *)(a2 + 188) |= 1u;
                        uint64_t v24 = v9;
                        if (v49) {
                          uint64_t v24 = v49;
                        }
                        uint64_t v10 = (pthread_rwlock_t *)(v7 + 48);
                        unint64_t v9 = v24;
                        goto LABEL_11;
                      }
                      snprintf(__str, 0x400uLL, "%s/%.16llx", v47, *(void *)(*(void *)(v7 + 40) + 8 * v16));
                      uint64_t v49 = *(void *)(*(void *)(v7 + 40) + 8 * v16 + 8);
                      pthread_rwlock_unlock(v44);
                      if (sub_100005B50(a1, a2, __str, *(void *)(a2 + 232)))
                      {
                        memset(&v51, 0, 512);
                        if (statfs(*(const char **)(a1 + 8), &v51) || v51.f_fsid.val[0] != *(_DWORD *)a1)
                        {
                          NDR_record_t v27 = sub_1000079A4();
                          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
                            sub_1000165BC();
                          }
                          return 0;
                        }
                      }
                      if (v48 == ++v16)
                      {
                        LODWORD(v16) = v43;
                        break;
                      }
                    }
                  }
                  sub_10000BA68(*(void *)(v7 + 16));
                  if (v8 <= 100) {
                    int v21 = 100;
                  }
                  else {
                    int v21 = v8;
                  }
                  int v22 = v21 + 1;
                  while (1)
                  {
                    usleep(0x3E8u);
                    if ((*v3 & 0x90) != 0) {
                      break;
                    }
                    if ((*v3 & 4) == 0) {
                      break;
                    }
                    uint64_t v23 = *(void *)(v7 + 16);
                    if (!v23 || *(_DWORD *)(v23 + 240) == *(_DWORD *)(v23 + 244)) {
                      break;
                    }
                    if (v22 == ++v8)
                    {
                      int v8 = v22;
                      break;
                    }
                  }
                  if ((*v3 & 0x90) != 0 || (*v3 & 4) == 0) {
                    return 0;
                  }
                  pthread_rwlock_rdlock(v44);
                  if (v45 > *(_DWORD *)(*(void *)(a1 + 128) + 32)
                    || v18 != *(unsigned __int16 *)(v7 + 248)
                    || v46 != *(unsigned __int16 *)(v7 + 250))
                  {
                    break;
                  }
                  int v11 = *(_DWORD *)(v7 + 32);
                  if (v45 >= v11)
                  {
                    if ((*v3 & 0x90) != 0 || (*v3 & 4) == 0 || !*(void *)(v7 + 16))
                    {
                      pthread_rwlock_unlock(v44);
                      return 0;
                    }
                    if (v45 >= 1)
                    {
                      uint64_t v36 = *(void *)(v7 + 40);
                      if (v36)
                      {
                        snprintf(__str, 0x400uLL, "%s/%.16llx", v47, *(void *)(v36 + 8 * v43));
                        sub_100005B50(a1, a2, __str, *(void *)(a2 + 232));
                      }
                    }
                    goto LABEL_64;
                  }
                }
                *(_DWORD *)(a2 + 188) |= 1u;
LABEL_64:
                uint64_t v28 = (int8x8_t *)sub_1000060AC(a1, v7, (unsigned int *)&v50 + 1);
                if ((*(_DWORD *)(a1 + 32) & 0x90) == 0 && (*v3 & 4) != 0 && *(void *)(v7 + 16))
                {
                  pthread_rwlock_unlock(v44);
                  unsigned int v29 = HIDWORD(v50);
                  if (HIDWORD(v50))
                  {
                    v28[1].i32[0] = HIDWORD(v50);
                    uid_t v30 = *(_DWORD *)(a2 + 252);
                    if (v30)
                    {
                      pthread_setugid_np(v30, *(_DWORD *)(a2 + 256));
                      uint64_t v31 = *(const char **)(a2 + 344);
                      if (v31)
                      {
                        if (initgroups(v31, *(_DWORD *)(a2 + 256)) < 0)
                        {
                          long long v32 = sub_1000079A4();
                          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
                          {
                            uint64_t v37 = *(void *)(a2 + 344);
                            int v38 = *(_DWORD *)(a2 + 252);
                            int v39 = *(_DWORD *)(a2 + 256);
                            int v40 = *__error();
                            unsigned int v41 = __error();
                            v42 = strerror(*v41);
                            v51.f_bsize = 136316162;
                            *(void *)&v51.f_iosize = v37;
                            WORD2(v51.f_blocks) = 1024;
                            *(_DWORD *)((char *)&v51.f_blocks + 6) = v38;
                            WORD1(v51.f_bfree) = 1024;
                            HIDWORD(v51.f_bfree) = v39;
                            LOWORD(v51.f_bavail) = 1024;
                            *(_DWORD *)((char *)&v51.f_bavail + 2) = v40;
                            HIWORD(v51.f_bavail) = 2080;
                            v51.f_files = (uint64_t)v42;
                            _os_log_error_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "scan_for_old_events: initgroups failed for user %s uid %d gid %d (err: %d/%s)", (uint8_t *)&v51, 0x28u);
                          }
                        }
                      }
                    }
                    if (sub_10000AA8C(a1, a2, v28, v29, 0, *(void *)(a2 + 232), &v50, 0, 0))
                    {
                      int v33 = sub_1000079A4();
                      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
                        sub_100016588();
                      }
                    }
                  }
                  if (*(_DWORD *)(a2 + 252)) {
                    pthread_setugid_np(0xFFFFFF9B, 0xFFFFFF9B);
                  }
                }
                else
                {
                  pthread_rwlock_unlock(v44);
                }
                free(v28);
                return 0;
              }
              int v12 = v16 + 1;
            }
            else
            {
              int v13 = v16;
            }
            if (v12 >= v13) {
              goto LABEL_24;
            }
          }
        }
        int v12 = 0;
        goto LABEL_24;
      }
      int v25 = sub_1000079A4();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        uint64_t v34 = *(void *)(a1 + 8);
        if (v7) {
          uint64_t v35 = *(void *)(v7 + 16);
        }
        else {
          uint64_t v35 = 0;
        }
        v51.f_bsize = 136315650;
        *(void *)&v51.f_iosize = v34;
        WORD2(v51.f_blocks) = 2048;
        *(uint64_t *)((char *)&v51.f_blocks + 6) = v7;
        HIWORD(v51.f_bfree) = 2048;
        v51.f_bavail = v35;
        _os_log_error_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "scan_old: bailing out because device mounted @ %s has dls %p and dls->fci %p", (uint8_t *)&v51, 0x20u);
      }
    }
  }
  return 0;
}

uint64_t sub_100005B50(uint64_t a1, uint64_t a2, const char *a3, unint64_t a4)
{
  int v42 = 0;
  if (qword_1000228D8 != -1) {
    dispatch_once(&qword_1000228D8, &stru_10001C7D8);
  }
  memset(&v41, 0, sizeof(v41));
  dispatch_semaphore_wait((dispatch_semaphore_t)qword_1000228E0, 0xFFFFFFFFFFFFFFFFLL);
  int v8 = open(a3, 0x20000000);
  int v9 = v8;
  if (v8 < 0 || fstat(v8, &v41) || (v41.st_mode & 0xF000) != 0x8000)
  {
    if (a1
      && (*(_DWORD *)(a1 + 32) & 0x1000) == 0
      && (int v20 = sub_1000079A4(), os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)))
    {
      int v23 = *__error();
      BOOL v24 = (v41.st_mode & 0xF000) == 0x8000;
      uid_t v25 = getuid();
      uid_t v26 = geteuid();
      gid_t v27 = getgid();
      gid_t v28 = getegid();
      *(_DWORD *)buf = 136316930;
      unsigned int v44 = a3;
      __int16 v45 = 1024;
      *(_DWORD *)unsigned int v46 = v9;
      *(_WORD *)&v46[4] = 1024;
      *(_DWORD *)&v46[6] = v23;
      *(_WORD *)int v47 = 1024;
      *(_DWORD *)&v47[2] = v24;
      __int16 v48 = 1024;
      *(_DWORD *)uint64_t v49 = v25;
      *(_WORD *)&v49[4] = 1024;
      *(_DWORD *)&v49[6] = v26;
      __int16 v50 = 1024;
      gid_t v51 = v27;
      __int16 v52 = 1024;
      gid_t v53 = v28;
      _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "read_disk_log: problems with history file: %s (fd %d, errno %d ; is_reg %d; uid %d/%d gid %d/%d)",
        buf,
        0x36u);
      if (v9 < 0) {
        goto LABEL_31;
      }
    }
    else if (v9 < 0)
    {
LABEL_31:
      dispatch_semaphore_signal((dispatch_semaphore_t)qword_1000228E0);
      return 22;
    }
    close(v9);
    goto LABEL_31;
  }
  if (!v41.st_size)
  {
    close(v9);
LABEL_33:
    dispatch_semaphore_signal((dispatch_semaphore_t)qword_1000228E0);
    return 0;
  }
  gzFile v10 = gzdopen(v9, "r");
  if (v10)
  {
    int v11 = v10;
    int v12 = (int8x8_t *)malloc_type_zone_malloc((malloc_zone_t *)qword_1000206B8, 0x40000uLL, 0xE67EBE19uLL);
    if (v12)
    {
      int v13 = v12;
      file = v11;
      uid_t v14 = *(_DWORD *)(a2 + 252);
      if (v14)
      {
        pthread_setugid_np(v14, *(_DWORD *)(a2 + 256));
        int v15 = *(const char **)(a2 + 344);
        if (v15)
        {
          if (initgroups(v15, *(_DWORD *)(a2 + 256)) < 0)
          {
            uint64_t v16 = sub_1000079A4();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            {
              int v33 = *(const char **)(a2 + 344);
              int v37 = *(_DWORD *)(a2 + 252);
              int v40 = *(_DWORD *)(a2 + 256);
              int v34 = *__error();
              uint64_t v35 = __error();
              uint64_t v36 = strerror(*v35);
              *(_DWORD *)buf = 136316162;
              unsigned int v44 = v33;
              __int16 v45 = 1024;
              *(_DWORD *)unsigned int v46 = v37;
              *(_WORD *)&v46[4] = 1024;
              *(_DWORD *)&v46[6] = v40;
              *(_WORD *)int v47 = 1024;
              *(_DWORD *)&v47[2] = v34;
              __int16 v48 = 2080;
              *(void *)uint64_t v49 = v36;
              _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "read_disk_log: initgroups failed for user %s uid %d gid %d (err: %d/%s)", buf, 0x28u);
            }
          }
        }
      }
      if ((*(_DWORD *)(a1 + 32) & 0x80) == 0 && (*(_DWORD *)(a1 + 32) & 4) != 0)
      {
        int v17 = 0;
        signed int v29 = 0;
        uint64_t v39 = 0;
        int v18 = 0;
        do
        {
          if ((*(_DWORD *)(a2 + 188) & 2) != 0) {
            break;
          }
          unsigned int v30 = 0x40000 - v29 >= 0x10000 ? 0x10000 : 0x40000 - v29;
          int v31 = gzread(file, (char *)v13 + v29, v30);
          int v17 = v31;
          if (v31 < 1) {
            break;
          }
          *(_DWORD *)buf = 0;
          v39 += v31;
          if (!v29 && v31 <= 0xB)
          {
            long long v32 = sub_1000079A4();
            if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
              sub_100016714();
            }
            goto LABEL_17;
          }
          v29 += v31;
          if (!sub_10000AA8C(a1, a2, v13, v29, 1, a4, &v42, (int *)buf, 1)) {
            int v18 = 1;
          }
          if (v42 && *(_DWORD *)buf == 2)
          {
            signed int v29 = 0x40000 - v42;
            __memmove_chk();
          }
          else if (v42)
          {
            signed int v29 = 0;
          }
        }
        while ((*(_DWORD *)(a1 + 32) & 0x80) == 0 && (*(_DWORD *)(a1 + 32) & 4) != 0);
      }
      else
      {
        int v17 = 0;
        uint64_t v39 = 0;
LABEL_17:
        int v18 = 0;
      }
      gzclose(file);
      malloc_zone_free((malloc_zone_t *)qword_1000206B8, v13);
      if (!v18
        && (*(_DWORD *)(a1 + 32) & 0x80) == 0
        && (*(_DWORD *)(a1 + 32) & 4) != 0
        && (*(_DWORD *)(a2 + 188) & 2) == 0)
      {
        uint64_t v19 = sub_1000079A4();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          unsigned int v44 = a3;
          __int16 v45 = 2048;
          *(void *)unsigned int v46 = v39;
          *(_WORD *)&v46[8] = 1024;
          *(_DWORD *)int v47 = v17;
          _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "read_disk_log: error processing log file %s (total_read %lld, size %d)", buf, 0x1Cu);
        }
      }
      if (*(_DWORD *)(a2 + 252)) {
        pthread_setugid_np(0xFFFFFF9B, 0xFFFFFF9B);
      }
      goto LABEL_33;
    }
    gzclose(v11);
    dispatch_semaphore_signal((dispatch_semaphore_t)qword_1000228E0);
    return 12;
  }
  else
  {
    int v22 = sub_1000079A4();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_1000166AC();
    }
    close(v9);
    dispatch_semaphore_signal((dispatch_semaphore_t)qword_1000228E0);
    return *__error();
  }
}

_DWORD *sub_1000060AC(uint64_t a1, uint64_t a2, unsigned int *a3)
{
  unsigned int v4 = *(_DWORD *)(a2 + 2524);
  if (!v4)
  {
LABEL_8:
    gzFile v10 = 0;
    goto LABEL_9;
  }
  uint64_t v16 = 0;
  uint64_t v6 = *(void *)(a2 + 2528) + 24 * v4;
  uint64_t v7 = v6 + 4096;
  if (v6 + 4096 < 0)
  {
    int v11 = sub_1000079A4();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = *(void *)(a2 + 2528);
      int v14 = *(_DWORD *)(a2 + 2524);
      *(_DWORD *)buf = 134218496;
      uint64_t v18 = v7;
      __int16 v19 = 2048;
      uint64_t v20 = v13;
      __int16 v21 = 1024;
      int v22 = v14;
      _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "in mem disk log size is bad: 0x%zx (string size: %zu num items %d)\n", buf, 0x1Cu);
    }
    unsigned int v4 = 0;
    goto LABEL_8;
  }
  int v9 = malloc_type_malloc(v6 + 4096, 0x5B6FCD30uLL);
  gzFile v10 = v9;
  if (v9)
  {
    v15[0] = 0;
    v15[1] = a2;
    v15[2] = v9;
    v15[3] = v7;
    LODWORD(v16) = 12;
    *(void *)int v9 = 1145852723;
    v9[2] = 12;
    sub_100006220(a1, (pthread_rwlock_t *)(a2 + 2304), (unsigned int (*)(uint64_t, uint64_t))sub_1000063F8, (uint64_t)v15);
    unsigned int v4 = v16;
    v10[2] = v16;
  }
  else
  {
    unsigned int v4 = 0;
  }
LABEL_9:
  *a3 = v4;
  return v10;
}

void sub_100006220(uint64_t a1, pthread_rwlock_t *a2, unsigned int (*a3)(uint64_t, uint64_t), uint64_t a4)
{
  if (!a1 || (*(_DWORD *)(a1 + 32) & 0x90) == 0 && (*(_DWORD *)(a1 + 32) & 4) != 0)
  {
    pthread_rwlock_rdlock(a2);
    int v8 = (uint64_t *)malloc_type_zone_malloc((malloc_zone_t *)qword_1000206B0, 8 * *(unsigned int *)&a2[1].__opaque[12], 0x2004093837F09uLL);
    if (v8)
    {
      int v9 = v8;
      uint64_t v10 = 0;
      size_t v11 = 0;
      int v12 = *(_DWORD *)a2[1].__opaque;
      if ((v12 + 1) > 1) {
        uint64_t v13 = (v12 + 1);
      }
      else {
        uint64_t v13 = 1;
      }
      do
      {
        int v14 = *(void **)(a2[1].__sig + 8 * v10);
        if (v14)
        {
          size_t v15 = *(unsigned int *)&a2[1].__opaque[12];
          do
          {
            if (v11 < v15) {
              v8[v11++] = (uint64_t)v14;
            }
            int v14 = (void *)*v14;
          }
          while (v14);
        }
        ++v10;
      }
      while (v10 != v13);
      if (!a1 || (*(_DWORD *)(a1 + 32) & 0x90) == 0 && (*(_DWORD *)(a1 + 32) & 4) != 0)
      {
        qsort(v8, v11, 8uLL, (int (__cdecl *)(const void *, const void *))sub_10000BBDC);
        if (v11)
        {
          size_t v16 = v11 - 1;
          int v17 = v9;
          do
          {
            if (a1 && ((*(_DWORD *)(a1 + 32) & 0x90) != 0 || (*(_DWORD *)(a1 + 32) & 4) == 0)) {
              break;
            }
            uint64_t v18 = *v17++;
          }
          while (!a3(v18, a4) && v16-- != 0);
        }
      }
      pthread_rwlock_unlock(a2);
      uint64_t v20 = (malloc_zone_t *)qword_1000206B0;
      malloc_zone_free(v20, v9);
    }
    else
    {
      pthread_rwlock_unlock(a2);
    }
  }
}

uint64_t sub_1000063F8(uint64_t a1, uint64_t a2)
{
  unsigned int v4 = *(const char **)(a1 + 40);
  size_t v5 = strlen(v4);
  uint64_t v6 = *(unsigned int *)(a2 + 32);
  if (v5 + v6 + 25 >= *(void *)(a2 + 24)) {
    return 28;
  }
  int v7 = v5 + 1;
  memcpy((void *)(*(void *)(a2 + 16) + v6), v4, v5 + 1);
  uint64_t result = 0;
  unsigned int v9 = *(_DWORD *)(a2 + 32) + v7;
  *(_DWORD *)(a2 + 32) = v9;
  *(void *)(*(void *)(a2 + 16) + v9) = *(void *)(a1 + 16);
  unsigned int v10 = *(_DWORD *)(a2 + 32) + 8;
  *(_DWORD *)(a2 + 32) = v10;
  *(_DWORD *)(*(void *)(a2 + 16) + v10) = *(_DWORD *)(a1 + 36);
  unsigned int v11 = *(_DWORD *)(a2 + 32) + 4;
  *(_DWORD *)(a2 + 32) = v11;
  *(void *)(*(void *)(a2 + 16) + v11) = *(void *)(a1 + 24);
  unsigned int v12 = *(_DWORD *)(a2 + 32) + 8;
  *(_DWORD *)(a2 + 32) = v12;
  *(_DWORD *)(*(void *)(a2 + 16) + v12) = *(_DWORD *)(a1 + 32);
  *(_DWORD *)(a2 + 32) += 4;
  return result;
}

char *sub_1000064D8(const char *a1)
{
  int v2 = (char *)malloc_type_malloc(0x400uLL, 0xD11DD80FuLL);
  int v3 = v2;
  if (v2)
  {
    if (a1 && *a1)
    {
      unsigned int v4 = &a1[strlen(a1) - 1];
      while (v4 > a1)
      {
        int v5 = *(unsigned __int8 *)v4--;
        if (v5 != 47)
        {
          while (v4 > a1)
          {
            int v6 = *(unsigned __int8 *)v4--;
            if (v6 == 47)
            {
              ++v4;
              goto LABEL_13;
            }
          }
          goto LABEL_19;
        }
      }
LABEL_13:
      unint64_t v7 = v4 - a1;
      if (v4 == a1)
      {
LABEL_19:
        if (*a1 == 47) {
          char v11 = 47;
        }
        else {
          char v11 = 46;
        }
        *int v3 = v11;
        v3[1] = 0;
        return v3;
      }
      int v8 = (unsigned __int8 *)(v4 - 1);
      do
      {
        unint64_t v9 = v7;
        if (v8 <= (unsigned __int8 *)a1) {
          break;
        }
        int v10 = *v8--;
        --v7;
      }
      while (v10 == 47);
      if (v9 < 0x400)
      {
        __memcpy_chk();
        v3[v9] = 0;
      }
      else
      {
        *__error() = 63;
        free(v3);
        return 0;
      }
    }
    else
    {
      *(_WORD *)int v2 = 46;
    }
  }
  return v3;
}

uint64_t sub_1000065F4(_DWORD *a1, uint64_t a2)
{
  int v2 = a1[2];
  *(_DWORD *)a2 = *a1 & 0x1F;
  *(_DWORD *)(a2 + 4) = 36;
  int v3 = a1[5] + 100;
  *(_DWORD *)(a2 + 8) = v2;
  *(_DWORD *)(a2 + 12) = 0;
  *(_DWORD *)(a2 + 16) = 0;
  *(_DWORD *)(a2 + 20) = v3;
  int v4 = a1[5];
  if ((v4 - 66007) >= 0xFFFFFFF9
    && (int v5 = (void (*)(void))*(&off_10001C818 + 5 * (v4 - 66000) + 5)) != 0)
  {
    v5();
    return 1;
  }
  else
  {
    uint64_t result = 0;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    *(_DWORD *)(a2 + 32) = -303;
  }
  return result;
}

_DWORD *sub_10000668C(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
  }
  else
  {
    uint64_t result = (_DWORD *)sub_1000066E8(result[3]);
    *(_DWORD *)(a2 + 32) = result;
  }
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

uint64_t sub_1000066E8(int a1)
{
  uint64_t v1 = sub_1000069F0(a1);
  if (v1)
  {
    uint64_t v2 = v1;
    nullsub_1();
    sub_100006918(v2);
    sub_100006850(v2);
  }
  else
  {
    int v3 = sub_1000079A4();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_100013C38();
    }
  }
  return 0;
}

void sub_100006754(uint64_t a1)
{
  kern_return_t v5;
  mach_error_t v6;
  NSObject *v7;
  NSObject *v8;

  uint64_t v2 = (int *)(a1 + 148);
  int add_explicit = atomic_fetch_add_explicit((atomic_uint *volatile)(a1 + 148), 0xFFFFFFFF, memory_order_relaxed);
  if (add_explicit <= 0)
  {
    int v8 = sub_1000079A4();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100013F28(a1, v2, v8);
    }
  }
  else if (add_explicit == 1)
  {
    *(_DWORD *)(a1 + 20) = 0;
    free(*(void **)(a1 + 24));
    *(void *)(a1 + 24) = 0;
    free(*(void **)(a1 + 32));
    *(void *)(a1 + 32) = 0;
    for (uint64_t i = 48; i != 112; i += 8)
    {
      free(*(void **)(a1 + i));
      *(void *)(a1 + i) = 0;
    }
    if (*(_DWORD *)a1)
    {
      int v5 = mach_port_deallocate(mach_task_self_, *(_DWORD *)a1);
      if (v5)
      {
        int v6 = v5;
        unint64_t v7 = sub_1000079A4();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
          sub_100013FC4(a1, v6);
        }
      }
    }
    *(_DWORD *)a1 = 0;
    dispatch_source_cancel(*(dispatch_source_t *)(a1 + 8));
  }
}

void sub_100006850(uint64_t a1)
{
  sub_100006888(a1);

  sub_100006754(a1);
}

void sub_100006888(uint64_t a1)
{
  uint64_t v1 = qword_100020260;
  if (qword_100020260 == a1)
  {
    qword_100020260 = *(void *)(a1 + 192);
    goto LABEL_13;
  }
  if (qword_100020260)
  {
    do
    {
      uint64_t v2 = v1;
      uint64_t v1 = *(void *)(v1 + 192);
    }
    while (v1 != a1 && v1 != 0);
    if (v1)
    {
      *(void *)(v2 + 192) = *(void *)(v1 + 192);
LABEL_13:
      --dword_100020268;
      return;
    }
  }
  int v4 = sub_1000079A4();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_10001405C(v4, v5, v6, v7, v8, v9, v10, v11);
  }
}

void sub_100006918(uint64_t a1)
{
  if (sub_1000073CC())
  {
    pthread_mutex_lock(&stru_100020140);
    uint64_t v2 = 0;
    while (1)
    {
      uint64_t v3 = *(void *)((char *)xmmword_100020758 + v2);
      if (v3)
      {
        if (*(void *)(v3 + 216) == a1) {
          break;
        }
      }
      v2 += 8;
      if (v2 == 4096)
      {
        pthread_mutex_unlock(&stru_100020140);
        int v4 = sub_1000079A4();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
          sub_100017118(a1, v4);
        }
        return;
      }
    }
    pthread_mutex_lock(*(pthread_mutex_t **)((char *)xmmword_100020758 + v2));
    *(_DWORD *)(v3 + 188) |= 2u;
    pthread_mutex_unlock((pthread_mutex_t *)v3);
    sub_10000BA68(v3);
    pthread_mutex_unlock(&stru_100020140);
  }
}

uint64_t sub_1000069F0(int a1)
{
  for (uint64_t result = qword_100020260; result; uint64_t result = *(void *)(result + 192))
  {
    if (*(_DWORD *)(result + 4) == a1) {
      break;
    }
  }
  return result;
}

void sub_100006A18(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)a1 & 0x80000000) == 0 || *(_DWORD *)(a1 + 24) != 5 || *(_DWORD *)(a1 + 4) != 160)
  {
    int v3 = -304;
    goto LABEL_17;
  }
  if (*(unsigned __int16 *)(a1 + 38) << 16 != 1114112
    || *(unsigned char *)(a1 + 51) != 1
    || *(unsigned char *)(a1 + 67) != 1
    || *(unsigned char *)(a1 + 83) != 1
    || *(unsigned char *)(a1 + 99) != 1
    || *(_DWORD *)(a1 + 120) != *(_DWORD *)(a1 + 52) >> 2
    || *(_DWORD *)(a1 + 68) != *(_DWORD *)(a1 + 124)
    || *(_DWORD *)(a1 + 132) != *(_DWORD *)(a1 + 84) >> 2
    || *(_DWORD *)(a1 + 100) != *(_DWORD *)(a1 + 136))
  {
    int v3 = -300;
    goto LABEL_17;
  }
  uint64_t v2 = a1 + 160;
  if (*(_DWORD *)(a1 + 160) || *(_DWORD *)(a1 + 164) <= 0x1Fu)
  {
    int v3 = -309;
LABEL_17:
    *(_DWORD *)(a2 + 32) = v3;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    return;
  }
  int v4 = (mach_port_name_t *)(a2 + 28);
  *(void *)(a2 + 32) = 0x14000000000000;
  int v6 = *(_DWORD *)(a1 + 12);
  int v7 = *(_DWORD *)(a1 + 28);
  int v8 = *(_DWORD *)(a1 + 112);
  unsigned int v9 = *(_DWORD *)(a1 + 116);
  uint64_t v10 = *(void *)(a1 + 40);
  int v11 = *(_DWORD *)(a1 + 52) >> 2;
  unsigned int v12 = *(const void **)(a1 + 56);
  unsigned int v13 = *(_DWORD *)(a1 + 68);
  unsigned int v14 = *(_DWORD *)(a1 + 128);
  size_t v15 = *(_DWORD **)(a1 + 72);
  int v16 = *(_DWORD *)(a1 + 84) >> 2;
  uint64_t v17 = *(void *)(a1 + 88);
  unsigned int v18 = *(_DWORD *)(a1 + 100);
  uint64_t v19 = *(void *)(a1 + 140);
  int v20 = *(_DWORD *)(a1 + 148);
  uint64_t v21 = *(void *)(a1 + 152);
  long long v22 = *(_OWORD *)(v2 + 36);
  v25[0] = *(_OWORD *)(v2 + 20);
  v25[1] = v22;
  int v23 = sub_100006C44(v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v4, v25);
  mig_deallocate(*(void *)(a1 + 88), *(unsigned int *)(a1 + 100));
  *(void *)(a1 + 88) = 0;
  *(_DWORD *)(a1 + 100) = 0;
  mig_deallocate(*(void *)(a1 + 72), *(unsigned int *)(a1 + 84));
  *(void *)(a1 + 72) = 0;
  *(_DWORD *)(a1 + 84) = 0;
  mig_deallocate(*(void *)(a1 + 56), *(unsigned int *)(a1 + 68));
  *(void *)(a1 + 56) = 0;
  *(_DWORD *)(a1 + 68) = 0;
  mig_deallocate(*(void *)(a1 + 40), *(unsigned int *)(a1 + 52));
  *(void *)(a1 + 40) = 0;
  *(_DWORD *)(a1 + 52) = 0;
  if (v23)
  {
    *(_DWORD *)(a2 + 32) = v23;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
  }
  else
  {
    *(_DWORD *)a2 |= 0x80000000;
    *(_DWORD *)(a2 + 4) = 40;
    *(_DWORD *)(a2 + 24) = 1;
  }
}

uint64_t sub_100006C44(int a1, int a2, int a3, unsigned int a4, uint64_t a5, int a6, const void *a7, unsigned int a8, unsigned int a9, _DWORD *a10, int a11, uint64_t a12, unsigned int a13, uint64_t a14, int a15, uint64_t a16, mach_port_name_t *a17, _OWORD *a18)
{
  *(void *)egidp = 0;
  pid_t pidp = 0;
  long long v25 = a18[1];
  *(_OWORD *)atoken.val = *a18;
  *(_OWORD *)&atoken.val[4] = v25;
  audit_token_to_au32(&atoken, 0, &egidp[1], egidp, 0, 0, &pidp, 0, 0);
  mach_port_t v26 = mach_task_self_;
  *a17 = 0;
  if (a4 == a6)
  {
    int v52 = a2;
    if (a9 == a11)
    {
      if (a4 > 0x1000 || a9 > 0x400000)
      {
        ipc_space_t v33 = v26;
        uint64_t v31 = 268435459;
        uint64_t v36 = sub_1000079A4();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
          sub_100013690();
        }
      }
      else if (a8 > 0x400000 || a13 > 0x400000)
      {
        ipc_space_t v33 = v26;
        uint64_t v31 = 268435459;
        int v37 = sub_1000079A4();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
          sub_100013704();
        }
      }
      else if (a4)
      {
        uint64_t v27 = 0;
        while (*(_DWORD *)(a5 + 4 * v27) <= a8)
        {
          if (a4 == ++v27) {
            goto LABEL_11;
          }
        }
        ipc_space_t v33 = v26;
        uint64_t v31 = 268435459;
        int v38 = sub_1000079A4();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
          sub_100013A68();
        }
      }
      else
      {
LABEL_11:
        if ((int)a9 < 1)
        {
LABEL_15:
          ipc_space_t v29 = v26;
          uint64_t v30 = mach_port_allocate(v26, 1u, a17);
          if (v30)
          {
            uint64_t v31 = v30;
            long long v32 = sub_1000079A4();
            if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
              sub_1000139E0(v31);
            }
            goto LABEL_35;
          }
          gid_t v51 = a7;
          mach_port_t previous = 0;
          ipc_space_t v33 = v29;
          uint64_t v40 = mach_port_request_notification(v29, *a17, 70, 1u, *a17, 0x15u, &previous);
          if (v40)
          {
            uint64_t v31 = v40;
            stat v41 = sub_1000079A4();
            if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
              sub_100013958(v31);
            }
          }
          else
          {
            uint64_t v43 = a14;
            if (previous)
            {
              mach_port_deallocate(mach_task_self_, previous);
              uint64_t v43 = a14;
            }
            uintptr_t v44 = *a17;
            long long v45 = a18[1];
            *(_OWORD *)atoken.val = *a18;
            *(_OWORD *)&atoken.val[4] = v45;
            unsigned int v46 = sub_10000805C(v52, v44, a3, a4, a5, a8, v51, v43, a15, a16, pidp, egidp[1], egidp[0], &atoken);
            if (v46)
            {
              int v47 = v46;
              if (sub_1000070B4((uint64_t)v46, a9, a10, a13, a12))
              {
                uint64_t v31 = 268435459;
                *int v47 = 0;
                sub_100006850((uint64_t)v47);
                __int16 v48 = sub_1000079A4();
                if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
                  sub_1000138E4();
                }
              }
              else
              {
                if (!sub_1000071C0((uint64_t)v47)) {
                  return 0;
                }
                uint64_t v31 = 268435459;
                *int v47 = 0;
                sub_100006850((uint64_t)v47);
                __int16 v50 = sub_1000079A4();
                if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR)) {
                  sub_100013870();
                }
              }
              goto LABEL_35;
            }
            uint64_t v31 = 268435459;
            uint64_t v49 = sub_1000079A4();
            if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
              sub_1000137EC(v49);
            }
          }
        }
        else
        {
          uint64_t v28 = 0;
          while (a10[v28] <= a13)
          {
            if (a9 == ++v28) {
              goto LABEL_15;
            }
          }
          ipc_space_t v33 = v26;
          uint64_t v31 = 268435459;
          uint64_t v39 = sub_1000079A4();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
            sub_100013778();
          }
        }
      }
    }
    else
    {
      ipc_space_t v33 = v26;
      uint64_t v31 = 268435459;
      uint64_t v35 = sub_1000079A4();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
        sub_100013ADC();
      }
    }
  }
  else
  {
    ipc_space_t v33 = v26;
    uint64_t v31 = 268435459;
    int v34 = sub_1000079A4();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
      sub_100013B50();
    }
  }
  if (*a17)
  {
    mach_port_mod_refs(v33, *a17, 1u, -1);
LABEL_35:
    *a17 = 0;
  }
  return v31;
}

uint64_t sub_1000070B4(uint64_t a1, int a2, _DWORD *a3, uint64_t a4, uint64_t a5)
{
  *(_DWORD *)(a1 + 40) = 0;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  if (a2 > 8) {
    return 28;
  }
  if (a2 >= 1)
  {
    unsigned int v9 = a3;
    uint64_t v10 = a2;
    uint64_t v11 = a2;
    unsigned int v12 = a3;
    do
    {
      unsigned int v13 = *v12++;
      if (strnlen((const char *)(a5 + v13), 0x401uLL) > 0x400) {
        return 22;
      }
      --v11;
    }
    while (v11);
    unsigned int v14 = (char **)(a1 + 48);
    do
    {
      ++v9;
      __strlcpy_chk();
      *v14++ = strdup(__s1);
      --v10;
    }
    while (v10);
  }
  uint64_t result = 0;
  *(_DWORD *)(a1 + 40) = a2;
  return result;
}

uint64_t sub_1000071C0(uint64_t a1)
{
  if (!sub_1000073CC()) {
    return 22;
  }
  unsigned int v2 = *(_DWORD *)(a1 + 120);
  int v3 = (2 * v2) & 4 | (((v2 >> 3) & 1) << 7);
  if ((v2 & 0x20) != 0)
  {
    v3 |= 0x1000u;
    pthread_mutex_lock(&stru_100020008);
    uint64_t v4 = 0;
    while (dword_100021858[v4])
    {
      if (++v4 == 32) {
        goto LABEL_8;
      }
    }
    dword_100021858[v4] = *(_DWORD *)(a1 + 136);
LABEL_8:
    pthread_mutex_unlock(&stru_100020008);
    unsigned int v2 = *(_DWORD *)(a1 + 120);
  }
  if ((v2 & 0x80) != 0) {
    int v5 = 0x2000;
  }
  else {
    int v5 = 459;
  }
  int v6 = (16 * v2) & 0x100 | v3 | ((v2 & 0x80) << 7);
  if ((v2 & 0x40) != 0)
  {
    v6 |= 0x2000u;
    *(_DWORD *)(a1 + 152) = 1;
  }
  if ((v2 & 0x100) != 0)
  {
    v6 |= 0x8000u;
    *(_DWORD *)(a1 + 156) = 1;
  }
  pthread_t v20 = 0;
  uint64_t v21 = 0;
  memset(&__attr, 0, sizeof(__attr));
  uint64_t v7 = *(void *)(a1 + 24);
  int v8 = *(_DWORD *)(a1 + 16);
  unsigned int v9 = *(_DWORD *)(a1 + 20);
  unsigned int v10 = *(_DWORD *)(a1 + 40);
  uint64_t v11 = *(void *)(a1 + 112);
  uint64_t v12 = *(void *)(a1 + 128);
  int v13 = *(_DWORD *)(a1 + 136);
  int v14 = *(_DWORD *)(a1 + 140);
  int v15 = *(_DWORD *)(a1 + 144);
  long long v16 = *(_OWORD *)(a1 + 176);
  v19[0] = *(_OWORD *)(a1 + 160);
  v19[1] = v16;
  if (sub_10000750C(v13, v8, v7, v9, a1 + 48, v10, v11, v5, v12, v6, (uint64_t)sub_100004984, a1, v14, v15, v19, (unint64_t *)&v21))
  {
    uint64_t v17 = sub_1000079A4();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_10001709C();
    }
    return 22;
  }
  atomic_fetch_add_explicit(&dword_100020720, 1u, memory_order_relaxed);
  sub_10000804C(a1);
  pthread_attr_init(&__attr);
  pthread_attr_setdetachstate(&__attr, 2);
  if ((v6 & 0x4000) != 0) {
    pthread_attr_set_qos_class_np(&__attr, QOS_CLASS_USER_INTERACTIVE, 0);
  }
  pthread_create(&v20, &__attr, (void *(__cdecl *)(void *))sub_1000027DC, v21);
  pthread_attr_destroy(&__attr);
  return 0;
}

uint64_t sub_1000073CC()
{
  if (dword_1000206C8) {
    return 0;
  }
  if (dword_100020750) {
    return 1;
  }
  pthread_mutex_lock(&stru_100020090);
  if (dword_100020750)
  {
    pthread_mutex_unlock(&stru_100020090);
    return 1;
  }
  v13.tv_sec = 0;
  v13.tv_nsec = 0;
  clock_gettime(_CLOCK_REALTIME, &v13);
  v13.tv_sec += 10;
  while (!dword_1000206C8)
  {
    int v2 = pthread_cond_timedwait(&stru_1000200D0, &stru_100020090, &v13);
    if (dword_100020750)
    {
      BOOL v0 = dword_1000206C8 == 0;
      goto LABEL_19;
    }
    int v3 = v2;
    if (v2)
    {
      if (v2 == 60)
      {
        uint64_t v4 = sub_1000079A4();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
          sub_100016D04(v4, v5, v6, v7, v8, v9, v10, v11);
        }
      }
      else
      {
        uint64_t v12 = sub_1000079A4();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
          sub_100016C7C(v3);
        }
      }
      break;
    }
  }
  BOOL v0 = 0;
LABEL_19:
  pthread_mutex_unlock(&stru_100020090);
  return v0;
}

uint64_t sub_10000750C(int a1, int a2, uint64_t a3, unsigned int a4, uint64_t a5, unsigned int a6, uint64_t a7, int a8, uint64_t a9, int a10, uint64_t a11, uint64_t a12, int a13, int a14, _OWORD *a15, unint64_t *a16)
{
  if (a2 && a4 >= 2 && a13) {
    return 22;
  }
  long long v25 = (pthread_mutex_t *)malloc_type_calloc(8 * a8 + 424, 1uLL, 0x7A25EB3BuLL);
  if (!v25) {
    return 12;
  }
  unint64_t v26 = (unint64_t)v25;
  unsigned int v52 = a6;
  uint64_t v53 = a7;
  pthread_mutex_init(v25, 0);
  uint64_t v27 = (pthread_cond_t *)(v26 + 64);
  pthread_cond_init((pthread_cond_t *)(v26 + 64), 0);
  *(_DWORD *)(v26 + 128) = a4;
  uint64_t v28 = a4;
  ipc_space_t v29 = malloc_type_calloc(a4, 8uLL, 0x10040436913F5uLL);
  *(void *)(v26 + 136) = v29;
  if (!v29)
  {
    uint64_t v24 = 12;
LABEL_48:
    free(*(void **)(v26 + 200));
    uintptr_t v44 = *(void **)(v26 + 136);
    if (v44)
    {
      if (a4)
      {
        uint64_t v45 = 0;
        uint64_t v46 = 8 * v28;
        do
        {
          int v47 = *(void **)(*(void *)(v26 + 136) + v45);
          if (v47)
          {
            free(v47);
            *(void *)(*(void *)(v26 + 136) + v45) = 0;
          }
          v45 += 8;
        }
        while (v46 != v45);
        uintptr_t v44 = *(void **)(v26 + 136);
      }
      free(v44);
    }
    for (uint64_t i = 352; i != 416; i += 8)
    {
      free(*(void **)(v26 + i));
      *(void *)(v26 + i) = 0;
    }
    pthread_cond_destroy(v27);
    free((void *)v26);
    unint64_t v26 = 0;
    goto LABEL_59;
  }
  int v50 = a1;
  int v51 = a8;
  if (!a4) {
    goto LABEL_30;
  }
  uint64_t v30 = 0;
  while (1)
  {
    uint64_t v31 = *(char **)(a3 + 8 * v30);
    if (!a2)
    {
LABEL_19:
      uint64_t v35 = v31;
      goto LABEL_21;
    }
    if (*v31 == 47 && !v31[1]) {
      break;
    }
    long long v32 = strstr(*(char **)(a3 + 8 * v30), "/.docid");
    if (v32)
    {
      if (strcmp(v32, "/.docid")) {
        goto LABEL_22;
      }
      ipc_space_t v33 = ".docid";
    }
    else
    {
      int v34 = strstr(v31, "/.activity");
      if (!v34) {
        goto LABEL_19;
      }
      if (strcmp(v34, "/.activity")) {
        goto LABEL_22;
      }
      ipc_space_t v33 = ".activity";
    }
    *(void *)(*(void *)(v26 + 136) + 8 * v30) = strdup(v33);
LABEL_23:
    if (a4 == ++v30) {
      goto LABEL_30;
    }
  }
  uint64_t v35 = (const char *)&unk_1000187EA;
LABEL_21:
  *(void *)(*(void *)(v26 + 136) + 8 * v30) = strdup(v35);
LABEL_22:
  if (*(void *)(*(void *)(v26 + 136) + 8 * v30)) {
    goto LABEL_23;
  }
  uint64_t v36 = sub_1000079A4();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
    sub_100015568();
  }
  if (a4 != v30)
  {
    if (v30 < a4)
    {
      do
        *(void *)(*(void *)(v26 + 136) + 8 * v30++) = 0;
      while (a4 != v30);
    }
    uint64_t v24 = 12;
    goto LABEL_47;
  }
LABEL_30:
  *(_OWORD *)(v26 + 384) = 0u;
  *(_OWORD *)(v26 + 400) = 0u;
  *(_OWORD *)(v26 + 352) = 0u;
  *(_OWORD *)(v26 + 368) = 0u;
  if (v52)
  {
    uint64_t v37 = v52;
    int v38 = (char **)(v26 + 352);
    do
    {
      __strlcpy_chk();
      if (__s[strlen(__s) - 1] != 47) {
        __strlcat_chk();
      }
      *v38++ = strdup(__s);
      a5 += 8;
      --v37;
    }
    while (v37);
  }
  *(_DWORD *)(v26 + 112) = a2;
  *(void *)(v26 + 208) = a11;
  *(void *)(v26 + 216) = a12;
  *(void *)(v26 + 176) = v53;
  *(_DWORD *)(v26 + 224) = v51;
  *(void *)(v26 + 232) = a9;
  *(_DWORD *)(v26 + 188) = a10;
  *(void *)(v26 + 416) = v26 + 424;
  *(_DWORD *)(v26 + 248) = v50;
  *(_DWORD *)(v26 + 252) = a13;
  *(_DWORD *)(v26 + 256) = a14;
  long long v39 = a15[1];
  *(_OWORD *)(v26 + 260) = *a15;
  *(_OWORD *)(v26 + 276) = v39;
  long long v40 = a15[1];
  *(_OWORD *)__s = *a15;
  long long v55 = v40;
  *(_DWORD *)(v26 + 292) = sub_1000079E8(__s, "com.apple.private.vfs.authorized-access");
  stat v41 = (char *)malloc_type_malloc(16 * a4, 0x20040A4A59CD2uLL);
  *(void *)(v26 + 200) = v41;
  if (!v41)
  {
    uint64_t v24 = 12;
LABEL_47:
    uint64_t v27 = (pthread_cond_t *)(v26 + 64);
    goto LABEL_48;
  }
  uint64_t v27 = (pthread_cond_t *)(v26 + 64);
  if (a4)
  {
    int v42 = v41 + 8;
    uint64_t v43 = a4;
    do
    {
      *(v42 - 1) = v26;
      void *v42 = 0;
      v42 += 2;
      --v43;
    }
    while (v43);
  }
  pthread_mutex_lock(&stru_100020140);
  uint64_t v24 = sub_100007F0C(v26);
  if (v24)
  {
LABEL_42:
    pthread_mutex_unlock(&stru_100020140);
    goto LABEL_48;
  }
  uint64_t v24 = sub_100007B20(v26);
  if (v24)
  {
    sub_10000528C(v26);
    goto LABEL_42;
  }
  pthread_mutex_unlock(&stru_100020140);
LABEL_59:
  *a16 = v26;
  return v24;
}

uint64_t sub_1000079A4()
{
  if (qword_100020238 != -1) {
    dispatch_once(&qword_100020238, &stru_10001C6B8);
  }
  return qword_100020240;
}

BOOL sub_1000079E8(_OWORD *a1, const char *a2)
{
  if (a2)
  {
    CFStringRef v3 = CFStringCreateWithCString(kCFAllocatorDefault, a2, 0x8000100u);
    long long v4 = a1[1];
    *(_OWORD *)cf.val = *a1;
    *(_OWORD *)&cf.val[4] = v4;
    uint64_t v5 = SecTaskCreateWithAuditToken(0, &cf);
    if (v5)
    {
      uint64_t v6 = v5;
      *(void *)cf.val = 0;
      CFBooleanRef v7 = (const __CFBoolean *)SecTaskCopyValueForEntitlement(v5, v3, (CFErrorRef *)&cf);
      if (v7)
      {
        CFBooleanRef v8 = v7;
        CFTypeID v9 = CFGetTypeID(v7);
        BOOL v10 = v9 == CFBooleanGetTypeID() && CFBooleanGetValue(v8) != 0;
        CFRelease(v8);
      }
      else
      {
        BOOL v10 = 0;
      }
      if (*(void *)cf.val) {
        CFRelease(*(CFTypeRef *)cf.val);
      }
      CFRelease(v6);
      if (v3) {
LABEL_19:
      }
        CFRelease(v3);
    }
    else
    {
      uint64_t v19 = sub_1000079A4();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        sub_1000154F0(v19, v20, v21, v22, v23, v24, v25, v26);
      }
      BOOL v10 = 0;
      if (v3) {
        goto LABEL_19;
      }
    }
  }
  else
  {
    uint64_t v11 = sub_1000079A4();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100015478(v11, v12, v13, v14, v15, v16, v17, v18);
    }
    return 0;
  }
  return v10;
}

uint64_t sub_100007B20(uint64_t a1)
{
  uint64_t v30 = (char *)malloc_type_malloc(0x10uLL, 0x1080040FC6463CFuLL);
  if (!v30) {
    return 12;
  }
  if (qword_100020708)
  {
    *(_OWORD *)uint64_t v30 = *(_OWORD *)qword_100020708;
  }
  else
  {
    *(void *)uint64_t v30 = 0;
    *((void *)v30 + 1) = 0;
  }
  int v2 = (int *)malloc_type_malloc(4 * *(int *)(a1 + 128), 0x100004052888210uLL);
  if (!v2) {
    goto LABEL_56;
  }
  CFStringRef v3 = v2;
  if (*(int *)(a1 + 128) < 1)
  {
    int v12 = *((_DWORD *)v30 + 3);
    uint64_t v6 = (int *)(v30 + 8);
    int v13 = 8 * v12;
    if (*((_DWORD *)v30 + 2) < v12) {
      goto LABEL_29;
    }
LABEL_28:
    v12 += 128;
    goto LABEL_29;
  }
  uint64_t v4 = 0;
  int v5 = 0;
  uint64_t v6 = (int *)(v30 + 8);
  do
  {
    uint64_t v7 = *v6;
    if ((int)v7 < 1)
    {
      LODWORD(v8) = 0;
    }
    else
    {
      uint64_t v8 = 0;
      int v9 = *(_DWORD *)(a1 + 112);
      uint64_t v10 = *(void *)v30;
      while (1)
      {
        uint64_t v11 = *(void *)(v10 + 8 * v8);
        if ((!v9 || v9 == *(_DWORD *)(v11 + 8))
          && !strcmp(*(const char **)(*(void *)(a1 + 136) + 8 * v4), *(const char **)v11)
          && ((*(_DWORD *)(a1 + 188) & 0x100) != 0 && (*(_WORD *)(v11 + 14) & 1) != 0
           || (*(_DWORD *)(a1 + 188) & 0x100) == 0 && (*(_WORD *)(v11 + 14) & 1) == 0))
        {
          break;
        }
        if (v7 == ++v8) {
          goto LABEL_22;
        }
      }
      v3[v4] = v8;
      ++*(_DWORD *)(v11 + 16);
      LODWORD(v7) = *v6;
    }
    if ((int)v8 >= (int)v7)
    {
LABEL_22:
      v3[v4] = -1;
      ++v5;
    }
    ++v4;
  }
  while (v4 < *(int *)(a1 + 128));
  int v12 = *((_DWORD *)v30 + 3);
  int v13 = 8 * v12;
  if (*((_DWORD *)v30 + 2) + v5 < v12) {
    goto LABEL_29;
  }
  if (v5 <= 127) {
    goto LABEL_28;
  }
  v12 += (v5 + 31) & 0xFFFFFFE0;
LABEL_29:
  uint64_t v14 = (char *)malloc_type_calloc(v12, 8uLL, 0x2004093837F09uLL);
  if (!v14) {
    goto LABEL_55;
  }
  uint64_t v15 = v14;
  if (*(void *)v30) {
    memcpy(v14, *(const void **)v30, v13);
  }
  int v16 = *v6;
  int v29 = v12;
  if (*(int *)(a1 + 128) < 1)
  {
LABEL_40:
    qsort(v15, v16, 8uLL, (int (__cdecl *)(const void *, const void *))sub_100002474);
    *(void *)uint64_t v30 = v15;
    *((_DWORD *)v30 + 2) = v16;
    *((_DWORD *)v30 + 3) = v29;
    uint64_t v23 = (void **)qword_100020708;
    qword_100020708 = (uint64_t)v30;
    __dmb(0xBu);
    do
    {
      if (!atomic_fetch_add_explicit(&dword_100020718, 0, memory_order_relaxed)) {
        break;
      }
      usleep(0x2710u);
    }
    while ((void **)qword_100020710 == v23);
    if (v23)
    {
      free(*v23);
      free(v23);
    }
    free(v3);
    return 0;
  }
  uint64_t v17 = 0;
  uint64_t v18 = 0;
  while (1)
  {
    uint64_t v19 = v3[v18];
    if (v19 == -1) {
      break;
    }
    *(void *)(*(void *)(a1 + 200) + v17 + 8) = *(void *)(*(void *)&v15[8 * v19] + 24);
    __dmb(0xBu);
    *(void *)(*(void *)&v15[8 * v3[v18]] + 24) = *(void *)(a1 + 200) + v17;
LABEL_39:
    ++v18;
    v17 += 16;
    if (v18 >= *(int *)(a1 + 128)) {
      goto LABEL_40;
    }
  }
  uint64_t v20 = malloc_type_malloc(0x20uLL, 0x10300405734DD4FuLL);
  *(void *)&v15[8 * v16] = v20;
  if (!v20) {
    goto LABEL_47;
  }
  uint64_t v21 = *(void *)(a1 + 136);
  *uint64_t v20 = strdup(*(const char **)(v21 + 8 * v18));
  uint64_t v22 = *(void *)&v15[8 * v16];
  if (*(void *)v22)
  {
    *(_DWORD *)(v22 + 8) = *(_DWORD *)(a1 + 112);
    *(_WORD *)(v22 + 12) = strlen(*(const char **)(v21 + 8 * v18));
    *(_WORD *)(v22 + 14) = (*(_DWORD *)(a1 + 188) >> 8) & 1;
    *(_DWORD *)(v22 + 16) = 1;
    *(void *)(v22 + 24) = *(void *)(a1 + 200) + v17;
    ++v16;
    goto LABEL_39;
  }
  free(*(void **)&v15[8 * v16]);
LABEL_47:
  uint64_t v25 = sub_1000079A4();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
    sub_1000150A8();
  }
  uint64_t v26 = *v6;
  if ((int)v26 < v16)
  {
    uint64_t v27 = (void **)&v15[8 * v26];
    uint64_t v28 = v16 - v26;
    do
    {
      if (*v27) {
        free(*v27);
      }
      ++v27;
      --v28;
    }
    while (v28);
  }
  free(v15);
LABEL_55:
  free(v3);
LABEL_56:
  free(v30);
  return 12;
}

uint64_t sub_100007F0C(uint64_t a1)
{
  uint64_t v1 = 0;
  CFStringRef v3 = (int *)(a1 + 248);
  int v2 = *(_DWORD *)(a1 + 248);
  int v4 = -1;
  int v5 = dword_1000218D8;
  while (1)
  {
    int v7 = *v5;
    v5 += 2;
    int v6 = v7;
    if (v7) {
      int v8 = -1;
    }
    else {
      int v8 = (int)v1;
    }
    if (v4 == -1) {
      int v4 = v8;
    }
    if (v2 == v6) {
      break;
    }
    uint64_t v1 = (int *)((char *)v1 + 1);
    if (v1 == (int *)512)
    {
      if (v4 == -1)
      {
        uint64_t v21 = sub_1000079A4();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
          sub_1000151DC(v21, v22, v23, v24, v25, v26, v27, v28);
        }
        return 28;
      }
      uint64_t v1 = &dword_1000218D8[2 * v4];
      *uint64_t v1 = v2;
      v1[1] = 0;
      LODWORD(v1) = v4;
      break;
    }
  }
  int v9 = &dword_1000218D8[2 * (int)v1];
  if (v9[1] <= 511)
  {
    for (uint64_t i = 0; i != 512; ++i)
    {
      if (!xmmword_100020758[i])
      {
        uint64_t v20 = 0;
        *(_DWORD *)(a1 + 192) = i;
        __dmb(0xBu);
        xmmword_100020758[i] = a1;
        ++v9[1];
        return v20;
      }
    }
    if (v1 == v4) {
      *int v9 = 0;
    }
    int v12 = sub_1000079A4();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_100015168(v12, v13, v14, v15, v16, v17, v18, v19);
    }
  }
  else
  {
    uint64_t v10 = sub_1000079A4();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1000150DC(v3, v10);
    }
  }
  return 28;
}

uint64_t sub_10000804C(uint64_t result)
{
  return result;
}

void *sub_10000805C(int a1, uintptr_t a2, int a3, unsigned int a4, uint64_t a5, int a6, const void *a7, uint64_t a8, int a9, uint64_t a10, int a11, int a12, int a13, _OWORD *a14)
{
  long long v14 = a14[1];
  v16[0] = *a14;
  v16[1] = v14;
  uint64_t result = sub_1000080CC(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, v16);
  if (result)
  {
    result[24] = qword_100020260;
    qword_100020260 = (uint64_t)result;
    ++dword_100020268;
  }
  return result;
}

void *sub_1000080CC(int a1, uintptr_t a2, int a3, unsigned int a4, uint64_t a5, int a6, const void *a7, uint64_t a8, int a9, uint64_t a10, int a11, int a12, int a13, _OWORD *a14)
{
  uint64_t v22 = malloc_type_calloc(1uLL, 0xC8uLL, 0x10B004086E55B40uLL);
  if (!v22)
  {
    int v29 = sub_1000079A4();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      sub_100013CAC(v29, v30, v31, v32, v33, v34, v35, v36);
    }
    return 0;
  }
  uint64_t v23 = v22;
  uint64_t v24 = malloc_type_malloc(a6, 0x9984850uLL);
  *((void *)v23 + 4) = v24;
  if (!v24)
  {
    uint64_t v37 = sub_1000079A4();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
      sub_100013D24(v37, v38, v39, v40, v41, v42, v43, v44);
    }
    goto LABEL_18;
  }
  memcpy(v24, a7, a6);
  uint64_t v25 = malloc_type_malloc(8 * a4, 0x10040436913F5uLL);
  *((void *)v23 + 3) = v25;
  if (!v25)
  {
    uint64_t v45 = sub_1000079A4();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
      sub_100013D9C(v45, v46, v47, v48, v49, v50, v51, v52);
    }
    goto LABEL_17;
  }
  if (a4)
  {
    uint64_t v26 = 0;
    do
    {
      *(void *)(*((void *)v23 + 3) + 8 * v26) = *((void *)v23 + 4) + *(unsigned int *)(a5 + 4 * v26);
      ++v26;
    }
    while (a4 != v26);
  }
  *((_DWORD *)v23 + 4) = a3;
  *((_DWORD *)v23 + 5) = a4;
  *(_DWORD *)uint64_t v23 = a1;
  *((_DWORD *)v23 + 1) = a2;
  uint64_t v27 = sub_100008304(a2);
  *((void *)v23 + 1) = v27;
  if (!v27)
  {
    uint64_t v53 = sub_1000079A4();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR)) {
      sub_100013E14(v53, v54, v55, v56, v57, v58, v59, v60);
    }
LABEL_17:
    free(*((void **)v23 + 4));
LABEL_18:
    free(v23);
    return 0;
  }
  *((void *)v23 + 14) = a8;
  *((_DWORD *)v23 + 30) = a9;
  *((void *)v23 + 16) = a10;
  *((_DWORD *)v23 + 34) = a11;
  *((_DWORD *)v23 + 35) = a12;
  *((_DWORD *)v23 + 36) = a13;
  *((_DWORD *)v23 + 37) = 1;
  long long v28 = a14[1];
  *((_OWORD *)v23 + 10) = *a14;
  *((_OWORD *)v23 + 11) = v28;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 0x40000000;
  handler[2] = sub_100002160;
  handler[3] = &unk_10001C6F8;
  handler[4] = v23;
  dispatch_source_set_cancel_handler(v27, handler);
  dispatch_activate(*((dispatch_object_t *)v23 + 1));
  return v23;
}

NSObject *sub_100008304(uintptr_t handle)
{
  uint64_t v1 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_mach_recv, handle, 0, (dispatch_queue_t)qword_100020248);
  int v2 = v1;
  if (v1)
  {
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 0x40000000;
    handler[2] = sub_1000021F4;
    handler[3] = &unk_10001C6D8;
    handler[4] = v1;
    dispatch_source_set_event_handler(v1, handler);
  }
  else
  {
    CFStringRef v3 = sub_1000079A4();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_100013410(v3);
    }
  }
  return v2;
}

uint64_t sub_1000083C8()
{
  v23.tv_sec = 0;
  v23.tv_nsec = 0;
  v22.tv_sec = 0;
  *(void *)&v22.tv_usec = 0;
  v21.tv_sec = 0;
  *(void *)&v21.tv_usec = 0;
  thread_act_t v0 = mach_thread_self();
  pthread_setname_np("com.apple.fseventsd.notify");
  integer_t policy_info = 18;
  thread_policy_set(v0, 3u, &policy_info, 1u);
  mach_port_deallocate(mach_task_self_, v0);
  if (!dword_1000206C8)
  {
    int v2 = 0;
    uint64_t v3 = 9999;
    while (1)
    {
      while (1)
      {
        pthread_mutex_lock(&stru_1000201C0);
LABEL_5:
        uint64_t v4 = qword_100020730;
        if (!qword_100020730) {
          break;
        }
        while (1)
        {
          int v5 = *(_DWORD *)(v4 + 4);
          if (v5 != *(_DWORD *)(v4 + 12) || *(_DWORD *)(v4 + 8) > v5) {
            break;
          }
          uint64_t v4 = *(void *)(v4 + 32);
          if (!v4) {
            goto LABEL_9;
          }
        }
        pthread_mutex_unlock(&stru_1000201C0);
LABEL_19:
        int v8 = 0;
        if (!v4)
        {
          if (!dword_1000206CC)
          {
            if (v2) {
              goto LABEL_32;
            }
            goto LABEL_47;
          }
LABEL_30:
          unsigned int v13 = -dword_1000206CC;
          sub_10000BB3C((void (*)(void))sub_10000DF60);
          atomic_fetch_add_explicit(&dword_1000206CC, v13, memory_order_relaxed);
LABEL_31:
          int v2 = 1;
LABEL_32:
          gettimeofday(&v21, 0);
          uint64_t v3 = sub_10000A754((uint64_t)&v21);
          sub_100008760(&qword_100021830);
          if (!v4) {
            goto LABEL_47;
          }
          int v14 = *(_DWORD *)(v4 + 4);
          if (v14 == *(_DWORD *)(v4 + 8) && v14 <= *(_DWORD *)(v4 + 12))
          {
            uint64_t v4 = *(void *)(v4 + 32) ? *(void *)(v4 + 32) : qword_100020730;
            if (!v4) {
              goto LABEL_47;
            }
            int v15 = *(_DWORD *)(v4 + 4);
            if (v15 == *(_DWORD *)(v4 + 8) && v15 <= *(_DWORD *)(v4 + 12)) {
              goto LABEL_47;
            }
          }
          ++v8;
        }
        if (v8 >= 101)
        {
          uint64_t v16 = sub_1000079A4();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
            sub_100016FF4(&v18, v19);
          }
          goto LABEL_47;
        }
        int v9 = *(_DWORD *)(v4 + 8);
        int v10 = *(_DWORD *)(v4 + 12);
        if (v9 < v10) {
          goto LABEL_25;
        }
        if (v9 > v10 && *(_DWORD *)(v4 + 4) == v9)
        {
          *(_DWORD *)(v4 + 4) = 0;
LABEL_25:
          *(_DWORD *)(v4 + 8) = v10;
          int v9 = v10;
        }
        if (!dword_1000206C8)
        {
          uint64_t v11 = *(int *)(v4 + 4);
          int v12 = v9 - v11;
          sub_100008A3C((_DWORD *)(*(void *)(v4 + 24) + v11), v9 - v11, (uint64_t)&qword_100021830, (void (*)(uint64_t, uint64_t, void, __int16 *, uint64_t, uint64_t, uint64_t))sub_10000958C, 0);
          *(_DWORD *)(v4 + 4) += v12;
          if (!dword_1000206CC) {
            goto LABEL_31;
          }
          goto LABEL_30;
        }
LABEL_47:
        if (dword_1000206C8) {
          return sub_10000DD3C();
        }
      }
LABEL_9:
      if (dword_1000206CC)
      {
        pthread_mutex_unlock(&stru_1000201C0);
        if (dword_1000206CC)
        {
          unsigned int v17 = -dword_1000206CC;
          sub_10000BB3C((void (*)(void))sub_10000DF60);
          uint64_t v4 = 0;
          atomic_fetch_add_explicit(&dword_1000206CC, v17, memory_order_relaxed);
          int v2 = 1;
        }
        else
        {
          uint64_t v4 = 0;
        }
        goto LABEL_19;
      }
      gettimeofday(&v22, 0);
      if ((unint64_t)(v3 - 1500001) < 0xFFFFFFFFFFE91CA0) {
        uint64_t v3 = 1500000;
      }
      unint64_t v6 = 1000 * v3 + 1000 * v22.tv_usec;
      v23.tv_sec = v6 / 0x3B9ACA00 + v22.tv_sec;
      v23.tv_nsec = v6 % 0x3B9ACA00;
      int v7 = pthread_cond_timedwait(&stru_100020200, &stru_1000201C0, &v23);
      if (!v7)
      {
LABEL_15:
        if (!dword_1000206CC && dword_1000206C8)
        {
          pthread_mutex_unlock(&stru_1000201C0);
          return sub_10000DD3C();
        }
        goto LABEL_5;
      }
      if (v7 != 60)
      {
        if (dword_1000206C8) {
          goto LABEL_15;
        }
        goto LABEL_5;
      }
      pthread_mutex_unlock(&stru_1000201C0);
      gettimeofday(&v21, 0);
      uint64_t v3 = sub_10000A754((uint64_t)&v21);
      sub_100008760(&qword_100021830);
    }
  }
  return sub_10000DD3C();
}

uint64_t sub_100008760(uint64_t *a1)
{
  pthread_mutex_lock(&stru_100020100);
  unsigned int v2 = *((_DWORD *)a1 + 5);
  if (v2 <= 0xFFFFFDFF)
  {
    unsigned int v3 = v2 + 512;
    do
    {
      uint64_t v4 = *a1;
      uint64_t v5 = a1[1] & v2;
      unint64_t v6 = *(_DWORD **)(*a1 + 8 * v5);
      if (v6)
      {
        do
        {
          uint64_t v7 = *(void *)v6;
          if (!v6[4])
          {
            if (v7) {
              *(void *)(v7 + 8) = *((void *)v6 + 1);
            }
            **((void **)v6 + 1) = v7;
            if (!*(void *)(v4 + 8 * v5))
            {
              unsigned int v8 = *((_DWORD *)a1 + 4) - 1;
              *((_DWORD *)a1 + 4) = v8;
              if (v8 > *((_DWORD *)a1 + 2))
              {
                int v9 = sub_1000079A4();
                if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
                {
                  int v10 = *((_DWORD *)a1 + 4);
                  int v11 = *((_DWORD *)a1 + 2);
                  *(_DWORD *)buf = 67109376;
                  int v14 = v10;
                  __int16 v15 = 1024;
                  int v16 = v11;
                  _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "event table is screwed up! filled buckets %u / table_mask %u)", buf, 0xEu);
                }
              }
            }
            sub_100008900(*((const char **)v6 + 15), *((__int16 *)v6 + 26));
            *((void *)v6 + 15) = 0;
            malloc_zone_free((malloc_zone_t *)qword_1000206C0, v6);
          }
          unint64_t v6 = (_DWORD *)v7;
        }
        while (v7);
        unsigned int v2 = *((_DWORD *)a1 + 5);
      }
      *((_DWORD *)a1 + 5) = ++v2;
    }
    while (v2 < v3);
  }
  return pthread_mutex_unlock(&stru_100020100);
}

uint64_t sub_100008900(const char *a1, size_t a2)
{
  size_t v2 = a2;
  if (a1[a2 - 1] && !a1[a2]) {
    size_t v2 = a2 + 1;
  }
  int v4 = *(unsigned __int8 *)a1;
  if (*a1)
  {
    unsigned int v5 = 0;
    unint64_t v6 = (unsigned __int8 *)(a1 + 1);
    do
    {
      unsigned int v5 = dword_100020298[v4 ^ HIBYTE(v5)] ^ (v5 << 8);
      int v7 = *v6++;
      int v4 = v7;
    }
    while (v7);
  }
  else
  {
    unsigned int v5 = 0;
  }
  if (v5 <= 1) {
    int v8 = 1;
  }
  else {
    int v8 = v5;
  }
  pthread_mutex_lock(&stru_100020050);
  int v9 = *(char **)(qword_100021848 + 8 * (dword_100021854 & v8));
  if (!v9) {
    goto LABEL_16;
  }
  while (strncmp(v9 + 20, a1, v2) || v9[v2 + 19])
  {
    int v9 = *(char **)v9;
    if (!v9) {
      goto LABEL_16;
    }
  }
  int v11 = *((_DWORD *)v9 + 4) - 1;
  *((_DWORD *)v9 + 4) = v11;
  if (v11)
  {
LABEL_16:
    pthread_mutex_unlock(&stru_100020050);
  }
  else
  {
    int v12 = *(char **)v9;
    if (*(void *)v9) {
      *((void *)v12 + 1) = *((void *)v9 + 1);
    }
    **((void **)v9 + 1) = v12;
    --dword_100021850;
    pthread_mutex_unlock(&stru_100020050);
    malloc_zone_free((malloc_zone_t *)qword_1000206A8, v9);
  }
  return 0;
}

uint64_t sub_100008A3C(_DWORD *a1, int a2, uint64_t a3, void (*a4)(uint64_t, uint64_t, void, __int16 *, uint64_t, uint64_t, uint64_t), uint64_t a5)
{
  __int16 v89 = 47;
  if (a2 >= 1)
  {
    int v81 = 0;
    uint64_t v63 = 0;
    int v64 = 0;
    int v65 = 0;
    uint64_t v66 = 0;
    uint64_t v67 = 0;
    uint64_t v68 = 0;
    int v62 = 0;
    int v60 = 0;
    uint64_t v82 = 0;
    char v73 = 0;
    uint64_t v74 = 0;
    uint64_t v75 = 0;
    int64_t v77 = 0;
    int64_t v78 = a2;
    unsigned int v5 = a1;
    unint64_t v6 = (unint64_t)a1 + a2;
    while (1)
    {
      int v7 = *v5;
      int v8 = (unsigned __int16 *)(v5 + 2);
      if ((*v5 & 0xFFF) != 0x3E7)
      {
        unsigned int v80 = v5[1];
        unsigned int v9 = 1 << *(unsigned char *)v5;
        uint64_t v10 = (byte_100020288 & ((*v5 & 0x2000u) >> 13)) != 0 ? v9 | 0x20000000 : v9;
        if (qword_1000206D0[dword_1000206E0] != -1) {
          break;
        }
      }
      ++dword_100020738;
      if (atomic_fetch_add_explicit(&qword_1000206D0[dword_1000206E0], 1uLL, memory_order_relaxed) == -2)
      {
        uint64_t v53 = sub_1000079A4();
        if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR)) {
          sub_100015624(v95, &v96, v53);
        }
        sub_100005318((uint64_t (*)(void))sub_10000DF4C);
        uint64_t v51 = a3;
        uint64_t v52 = 2415919104;
      }
      else
      {
        uint64_t v51 = a3;
        uint64_t v52 = 0x80000000;
      }
      a4(v51, 0xFFFFFFFFLL, 0, &v89, 2, 2, v52);
      if (*v8 == 45887)
      {
        int v8 = (unsigned __int16 *)v5 + 5;
      }
      else
      {
        uint64_t v54 = sub_1000079A4();
        if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR)) {
          sub_1000155F4(&v87, v88);
        }
      }
LABEL_139:
      unsigned int v5 = v8;
      if ((char *)v8 - (char *)a1 >= v78) {
        return 1;
      }
    }
    if ((unint64_t)v8 >= v6) {
      goto LABEL_139;
    }
    int v11 = 0;
    uint64_t v70 = 0;
    uint64_t v71 = 0;
    *(_DWORD *)&v61[8] = 0;
    int v69 = 0;
    int v72 = 0;
    BOOL v76 = 0;
    int v12 = 0;
    uint64_t v83 = 0;
    *(void *)uint64_t v61 = (v7 - 11);
    unsigned int v13 = "created";
    if (v7 == 12) {
      unsigned int v13 = "changed";
    }
    uint64_t v59 = v13;
    while (1)
    {
      int v14 = *v8;
      if (v14 == 45887)
      {
        ++v8;
        goto LABEL_139;
      }
      uint64_t v15 = v8[1];
      unint64_t add_explicit = atomic_fetch_add_explicit(&qword_1000206D0[dword_1000206E0], 1uLL, memory_order_relaxed);
      unint64_t v17 = add_explicit + 1;
      if (add_explicit == -2)
      {
        char v18 = sub_1000079A4();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
          sub_100015668(v93, &v94, v18);
        }
        sub_100005318((uint64_t (*)(void))sub_10000DF4C);
        ((void (*)(uint64_t, uint64_t, void, __int16 *, uint64_t, uint64_t, uint64_t, uint64_t, void, _DWORD, uint64_t))a4)(a3, 0xFFFFFFFFLL, 0, &v89, 2, 2, 2415919104, -1, 0, 0, a5);
        unint64_t v17 = atomic_fetch_add_explicit(&qword_1000206D0[dword_1000206E0], 1uLL, memory_order_relaxed) + 1;
      }
      uint64_t v19 = (unsigned int *)(v8 + 2);
      if (v7 != 15) {
        break;
      }
      switch(v11)
      {
        case 0:
          if (v14 == 4)
          {
            int v62 = 0;
            uint64_t v63 = 0;
            uint64_t v67 = 0;
            uint64_t v68 = 0;
            int v65 = 0;
            uint64_t v66 = 0;
            int v64 = 0;
            int v81 = 0;
            int v60 = *v19;
          }
          else
          {
            int v60 = 0;
            int v62 = 0;
            uint64_t v63 = 0;
            uint64_t v67 = 0;
            uint64_t v68 = 0;
            int v65 = 0;
            uint64_t v66 = 0;
            int v64 = 0;
            int v81 = 0;
          }
          break;
        case 1:
          if (v14 == 9)
          {
            v81 |= 1u;
            uint64_t v83 = *v19;
            int v62 = *v19;
          }
          break;
        case 2:
          if (v14 == 7)
          {
            uint64_t v68 = *(void *)v19;
            int v28 = v81 | 2;
            goto LABEL_49;
          }
          break;
        case 3:
          if (v14 == 5)
          {
            uint64_t v67 = *(void *)v19;
            int v28 = v81 | 4;
            goto LABEL_49;
          }
          break;
        case 4:
          if (v14 == 5)
          {
            uint64_t v66 = *(void *)v19;
            int v28 = v81 | 8;
            goto LABEL_49;
          }
          break;
        case 5:
          if (v14 == 4)
          {
            int v65 = *v19;
            int v28 = v81 | 0x10;
            goto LABEL_49;
          }
          break;
        case 6:
          if (v14 == 4)
          {
            int v64 = *v19;
            int v28 = v81 | 0x20;
            goto LABEL_49;
          }
          break;
        case 7:
          if (v14 == 5)
          {
            uint64_t v63 = *(void *)v19;
            int v28 = v81 | 0x40;
LABEL_49:
            int v81 = v28;
          }
          break;
        case 8:
          if (v14 == 5 && (v81 & 0x5F) != 0)
          {
            uint64_t v29 = (snprintf((char *)__str, 0x400uLL, "/.activity/%d/%d/%lld/%lld/%lld/%u/%u/%lld", v60, v62, v68, v67, v66, v65, v64, v63)+ 1);
            ((void (*)(uint64_t, void, uint64_t, uint8_t *, uint64_t, uint64_t, uint64_t, unint64_t, void, _DWORD, uint64_t))a4)(a3, v80, v83, __str, v29, v29, v10, v17, 0, 0, a5);
          }
          break;
        default:
          break;
      }
LABEL_121:
      int v8 = (unsigned __int16 *)((char *)v19 + v15);
      ++v11;
      if ((unint64_t)v19 + v15 >= v6) {
        goto LABEL_139;
      }
    }
    if ((v14 - 1) > 1)
    {
      switch(v14)
      {
        case 5:
          if (*(_DWORD *)v61 > 1u)
          {
            int v20 = v69;
          }
          else
          {
            int v20 = v69;
            if (!v69)
            {
              *(void *)&v61[4] = *(void *)v19;
              int v20 = 1;
            }
          }
          BOOL v41 = v72 == 2 && v20 == 1;
          BOOL v42 = *(_DWORD *)v61 > 1u;
          if (!v41) {
            BOOL v42 = 1;
          }
          if (v42)
          {
            int v69 = v20;
          }
          else
          {
            int v43 = snprintf((char *)__str, 0x400uLL, "/.docid/%lld/%s/%lld/src=%lld,dst=%lld", (int)v83, v59, *(void *)&v61[4], v70, v71)+ 1;
            uint64_t v10 = v10;
            int64_t v77 = strrchr((char *)__str, 47) - (char *)__str + 2;
            ((void (*)(uint64_t, void, uint64_t, uint8_t *, void))a4)(a3, v80, v83, __str, v43);
            int v69 = 1;
            int v72 = 2;
          }
          break;
        case 7:
          if (v15 == 4) {
            uint64_t v30 = *v19;
          }
          else {
            uint64_t v30 = *(void *)v19;
          }
          if (v72) {
            uint64_t v39 = v70;
          }
          else {
            uint64_t v39 = v30;
          }
          uint64_t v74 = v30;
          uint64_t v40 = v71;
          if (v72) {
            uint64_t v40 = v30;
          }
          uint64_t v70 = v39;
          uint64_t v71 = v40;
          ++v72;
          break;
        case 9:
          uint64_t v31 = *v19;
          if (v7 == 13)
          {
            int v90 = *v19;
            *(void *)__str = 0;
            sub_10000A434((uint64_t)&unk_100021758);
            if (sub_100011AF4(&v90, __str))
            {
              sub_10000A3A0((uint64_t)&unk_100021758);
              int v91 = v31;
              ioctl(dword_100020048, 0x80047368uLL, &v91);
            }
            else
            {
              *(_DWORD *)(*(void *)__str + 32) |= 0x400u;
              sub_10000A3A0((uint64_t)&unk_100021758);
              int v49 = 0;
              atomic_compare_exchange_strong_explicit(dword_100020700, (unsigned int *)&v49, 1u, memory_order_relaxed, memory_order_relaxed);
              if (qword_100020748)
              {
                uint64_t v50 = *(void *)(qword_100020748 + 16);
                if (v50) {
                  sub_10000BA68(v50);
                }
              }
            }
          }
          uint64_t v83 = v31;
          if (v12)
          {
            if (v76)
            {
              uint64_t v27 = v77;
              if ((v75 & 0x2000000000000000) != 0)
              {
                *BOOL v76 = v73;
                uint64_t v27 = strlen(v12) + 1;
                uint64_t v10 = v10 | 0x20000000;
              }
            }
            else
            {
              uint64_t v27 = v77;
            }
            uint64_t v58 = a5;
            int v57 = 0;
            uint64_t v56 = 0;
            goto LABEL_120;
          }
          break;
        case 10:
          HIDWORD(v75) = *v19;
          int v32 = *v19 & 0xF000;
          switch(v32)
          {
            case 40960:
              LODWORD(v10) = v10 | 0x400000;
              break;
            case 32768:
              LODWORD(v10) = v10 | 0x800000;
              break;
            case 16384:
              LODWORD(v10) = v10 | 0x1000000;
              break;
          }
          int v44 = v10 | 0x100000;
          if (v75 >= 0) {
            int v44 = v10;
          }
          uint64_t v10 = v44 | (HIDWORD(v75) >> 11) & 0x80000;
          break;
        case 11:
          LODWORD(v75) = *v19;
          break;
        case 12:
          HIDWORD(v75) = *((_DWORD *)v8 + 4);
          int v33 = WORD2(v75) & 0xF000;
          switch(v33)
          {
            case 40960:
              LODWORD(v10) = v10 | 0x400000;
              break;
            case 32768:
              LODWORD(v10) = v10 | 0x800000;
              break;
            case 16384:
              LODWORD(v10) = v10 | 0x1000000;
              break;
          }
          uint64_t v74 = *(void *)(v8 + 2);
          uint64_t v83 = *((unsigned int *)v8 + 3);
          LODWORD(v75) = *((_DWORD *)v8 + 6);
          int v45 = v10 | 0x100000;
          if (v75 >= 0) {
            int v45 = v10;
          }
          uint64_t v10 = v45 | (HIDWORD(v75) >> 11) & 0x80000;
          if (v12)
          {
            if (!v76)
            {
              uint64_t v46 = *(void *)(v8 + 2);
              uint64_t v27 = v77;
              uint64_t v31 = *((unsigned int *)v8 + 3);
              goto LABEL_119;
            }
            uint64_t v46 = *(void *)(v8 + 2);
            uint64_t v27 = v77;
            uint64_t v31 = *((unsigned int *)v8 + 3);
            if ((v75 & 0x2000000000000000) == 0) {
              goto LABEL_119;
            }
            char v47 = v73;
            uint64_t v26 = v76;
            goto LABEL_116;
          }
          break;
        default:
          goto LABEL_121;
      }
      goto LABEL_121;
    }
    if (*(unsigned char *)v19 == 47)
    {
      int v12 = (char *)(v8 + 2);
    }
    else
    {
      timeval v21 = sub_1000079A4();
      int v12 = (char *)&unk_100020230;
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)__str = 136315138;
        *(void *)&__str[4] = v8 + 2;
        _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "consumer: DANGER! fname does not begin with a '/' (%s)", __str, 0xCu);
      }
    }
    if (v12[1])
    {
      timeval v22 = strrchr(v12, 47);
      if (!v22) {
        goto LABEL_107;
      }
      timespec v23 = v22;
      uint64_t v24 = v22 - 12;
      if (v22 - 12 <= v12 || strncmp(v22 - 12, "/..namedfork", 0xCuLL))
      {
LABEL_34:
        char v73 = v23[1];
        size_t v25 = strlen(v12);
        uint64_t v26 = v23 + 1;
        uint64_t v82 = v25 + 1;
        uint64_t v27 = v23 - v12 + 2;
LABEL_111:
        uint64_t v31 = v83;
        goto LABEL_112;
      }
      uint64_t v10 = v10 | 0x200;
      *uint64_t v24 = 0;
      uint64_t v34 = strrchr(v12, 47);
      if (v34)
      {
        timespec v23 = v34;
        uint64_t v35 = v34 + 1;
        if (v34[1])
        {
          *uint64_t v34 = 0;
          uint64_t v36 = strrchr(v12, 47);
          if (v36 && (uint64_t v37 = v35, v38 = v36, !strcmp(v36 + 1, v37))) {
            timespec v23 = v38;
          }
          else {
            *timespec v23 = 47;
          }
        }
        goto LABEL_34;
      }
      if (v12[1])
      {
LABEL_107:
        uint64_t v31 = v83;
        uint64_t v48 = sub_1000079A4();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)__str = 136315138;
          *(void *)&__str[4] = v12;
          _os_log_error_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_ERROR, "consumer: DANGER! last_slash is NULL and fname <<%s>> looks bad.", __str, 0xCu);
        }
        uint64_t v26 = 0;
        uint64_t v27 = 2;
        uint64_t v82 = 2;
LABEL_112:
        BOOL v76 = v26;
        if (v31)
        {
          if (v26)
          {
            uint64_t v46 = v74;
            if ((v75 & 0x2000000000000000) != 0)
            {
              char v47 = v73;
LABEL_116:
              char *v26 = v47;
              uint64_t v27 = strlen(v12) + 1;
              uint64_t v10 = v10 | 0x20000000;
            }
          }
          else
          {
            uint64_t v46 = v74;
          }
LABEL_119:
          uint64_t v58 = a5;
          int v57 = v75;
          uint64_t v56 = v46;
LABEL_120:
          int64_t v77 = v27;
          ((void (*)(uint64_t, void, uint64_t, char *, uint64_t, uint64_t, uint64_t, unint64_t, uint64_t, int, uint64_t))a4)(a3, v80, v31, v12, v82, v27, v10, v17, v56, v57, v58);
        }
        else
        {
          int64_t v77 = v27;
          uint64_t v83 = 0;
        }
        goto LABEL_121;
      }
    }
    uint64_t v26 = 0;
    uint64_t v27 = 2;
    uint64_t v82 = 2;
    goto LABEL_111;
  }
  return 1;
}

uint64_t sub_10000958C(uint64_t a1, int a2, int a3, char *__s1, int a5, uint64_t a6, int a7, uint64_t a8, uint64_t a9, int a10)
{
  atomic_fetch_add(&dword_100020718, 1u);
  uint64_t v10 = &off_100020000;
  qword_100020710 = qword_100020708;
  if (!qword_100020708)
  {
    uint64_t v18 = 0;
LABEL_48:
    atomic_fetch_add(&dword_100020718, 0xFFFFFFFF);
    return v18;
  }
  if ((a7 & 0x80000000) == 0)
  {
    LOBYTE(v48[0]) = 0;
    int v47 = !strncmp(__s1, "/.docid/", 8uLL) || !strncmp(__s1, "/.activity/", 0xBuLL);
    uint64_t v19 = __s1;
    if (a3) {
      uint64_t v19 = (char *)sub_10000A234(a3, __s1, v48);
    }
    if (!v19) {
      sub_10001527C();
    }
    if (!strncmp(v19, ".Spotlight-V100", 0xFuLL)
      || !strncmp(v19, ".fseventsd", 0xAuLL)
      || !strncmp(v19, ".MobileBackups", 0xEuLL)
      || !strncmp(v19, "Backups.backupdb", 0x10uLL))
    {
      uint64_t v18 = 0;
    }
    else
    {
      int v46 = a2;
      uint64_t v18 = 0;
      if (!strnstr(v19, "/.ubd/", 0x400uLL) && !LOBYTE(v48[0]))
      {
        uint64_t v43 = a6;
        pthread_mutex_lock(&stru_100020180);
        uint64_t v20 = qword_100020710;
        if (*(int *)(qword_100020710 + 8) >= 1)
        {
          uint64_t v44 = a1;
          uint64_t v45 = a8;
          uint64_t v21 = 0;
          uint64_t v18 = 0;
          unsigned int v41 = a7 & 0xFE23F800;
          int v42 = a7;
          while (1)
          {
            if (*(_DWORD *)(*(void *)(*(void *)v20 + 8 * v21) + 8) != -1)
            {
              timeval v22 = v10;
              unsigned int v23 = *(unsigned __int16 *)(*(void *)(*(void *)v20 + 8 * v21) + 12);
              if (v23 >= 2 && *(unsigned char *)(**(void **)(*(void *)v20 + 8 * v21) + v23 - 1) == 47) {
                --v23;
              }
              uint64_t v24 = __s1;
              if (a3)
              {
                if (*(_DWORD *)(*(void *)(*(void *)v20 + 8 * v21) + 8)) {
                  uint64_t v24 = v19;
                }
                else {
                  uint64_t v24 = __s1;
                }
              }
              unint64_t v25 = v23;
              if (strncmp(**(const char ***)(*(void *)v20 + 8 * v21), v24, v23)) {
                goto LABEL_28;
              }
              if (v23 >= 2)
              {
                int v26 = v24[v23];
                if (v26 != 47 && v26 != 0) {
                  goto LABEL_28;
                }
              }
              uint64_t v10 = v22;
              if (!*(_DWORD *)(*(void *)(*(void *)v20 + 8 * v21) + 8)
                || *(_DWORD *)(*(void *)(*(void *)v20 + 8 * v21) + 8) == a3)
              {
                if ((((*(_WORD *)(*(void *)(*(void *)v20 + 8 * v21) + 14) & 1) == 0) & ~v47) == 0)
                {
                  uint64_t v28 = sub_100009AD0(v44, v46, a3, v24, v42, v45, a9, a10);
                  if (v28)
                  {
                    uint64_t v29 = v28;
                    sub_10000A0D8(*(void *)(*((void *)*v22[226] + v21) + 24), v28);
                    sub_100009A0C(v29);
                    uint64_t v18 = (v18 + 1);
                  }
                  goto LABEL_29;
                }
                uint64_t v30 = (char *)(__s1 - v24 + v43);
                if ((unint64_t)v30 >= v25) {
                  break;
                }
              }
            }
LABEL_29:
            ++v21;
            uint64_t v20 = (uint64_t)v10[226];
            if (v21 >= *(int *)(v20 + 8)) {
              goto LABEL_61;
            }
          }
          uint64_t v31 = v30 - 1;
          char v32 = __s1[v43 - 1];
          __s1[v43 - 1] = 0;
          uint64_t v33 = sub_100009AD0(v44, v46, a3, v24, v41, v45, a9, a10);
          if (v33)
          {
            uint64_t v34 = v33;
            sub_10000A0D8(*(void *)(*((void *)*v22[226] + v21) + 24), v33);
            sub_100009A0C(v34);
            uint64_t v18 = (v18 + 1);
          }
          v31[(void)v24] = v32;
LABEL_28:
          uint64_t v10 = v22;
          goto LABEL_29;
        }
        uint64_t v18 = 0;
LABEL_61:
        pthread_mutex_unlock(&stru_100020180);
      }
    }
    v10[226] = 0;
    goto LABEL_48;
  }
  uint64_t v36 = sub_100009AD0(a1, -1, 0, __s1, a7, a8, a9, a10);
  if (v36)
  {
    uint64_t v37 = v36;
    uint64_t v38 = 0;
    uint64_t v18 = 0;
    atomic_fetch_add(&dword_10002071C, 1u);
    do
    {
      uint64_t v39 = xmmword_100020758[v38];
      if (v39 && (*(_DWORD *)(v39 + 188) & 2) == 0)
      {
        v48[0] = xmmword_100020758[v38];
        v48[1] = 0;
        sub_10000A0D8((uint64_t)v48, v37);
        uint64_t v18 = (v18 + 1);
      }
      ++v38;
    }
    while (v38 != 512);
    atomic_fetch_add(&dword_10002071C, 0xFFFFFFFF);
    sub_100009A0C(v37);
    qword_100020710 = 0;
    atomic_fetch_add(&dword_100020718, 0xFFFFFFFF);
  }
  else
  {
    uint64_t v40 = sub_1000079A4();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
      sub_1000152A8();
    }
    return 0;
  }
  return v18;
}

uint64_t sub_100009A0C(uint64_t a1)
{
  int add = atomic_fetch_add((atomic_uint *volatile)(a1 + 16), 0xFFFFFFFF);
  uint64_t v2 = (add - 1);
  if (add <= 0)
  {
    unsigned int v3 = sub_1000079A4();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_100015040();
    }
    int v4 = sub_1000079A4();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_100014FD4();
    }
    unsigned int v5 = sub_1000079A4();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100014F44();
    }
    MEMORY[0xAA] = -1159983646;
  }
  return v2;
}

uint64_t sub_100009AD0(uint64_t a1, int a2, int a3, const char *a4, int a5, uint64_t a6, uint64_t a7, int a8)
{
  int v8 = a5;
  int v11 = *(unsigned __int8 *)a4;
  if (*a4)
  {
    BOOL v12 = 0;
    unsigned int v13 = (unsigned __int8 *)(a4 + 1);
    int v14 = (char *)a4;
    while (1)
    {
      if (!v12 || v11 != 47)
      {
        *v14++ = v11;
        if (v14 - a4 == 1023)
        {
          *int v14 = 0;
          uint64_t v16 = 1023;
          goto LABEL_12;
        }
        int v11 = *(v13 - 1);
      }
      BOOL v12 = v11 == 47;
      int v15 = *v13++;
      int v11 = v15;
      if (!v15) {
        goto LABEL_10;
      }
    }
  }
  int v14 = (char *)a4;
LABEL_10:
  *int v14 = 0;
  uint64_t v16 = v14 - a4;
LABEL_12:
  size_t v17 = v16 + 1;
  if (a4[v16])
  {
    if (a4[v17])
    {
      int v69 = a4[v16];
      a4[v16] = 0;
    }
    else
    {
      int v69 = 0;
      size_t v17 = v16 + 2;
    }
  }
  else
  {
    int v69 = 0;
  }
  uint64_t v18 = (unsigned int *)(a1 + 16);
  int v19 = *(_DWORD *)(a1 + 8);
  uint64_t v71 = (int *)(a1 + 8);
  if (3 * v19 + 3 <= (4 * *(_DWORD *)(a1 + 16)))
  {
    unsigned int v20 = 2 * v19 + 2;
    if (v20 >= 0x80000)
    {
      if (!*(_DWORD *)(a1 + 12))
      {
        uint64_t v21 = sub_1000079A4();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
          sub_1000153C4(a1 + 16, v71, v21);
        }
        *(_DWORD *)(a1 + 12) = 1;
      }
      goto LABEL_45;
    }
    int v73 = 0;
    timeval v22 = sub_10001274C(v20, &v73);
    if (v22)
    {
      unsigned int v23 = v22;
      size_t v64 = v17;
      pthread_mutex_lock(&stru_100020100);
      int v24 = 0;
      *(void *)(a1 + 16) = 0;
      unint64_t v25 = *(void **)a1;
      *(void *)a1 = v23;
      unsigned int v26 = *(_DWORD *)(a1 + 8);
      *(_DWORD *)(a1 + 8) = v73;
      while (1)
      {
        uint64_t v27 = (uint64_t *)v25[v24];
        if (v27) {
          break;
        }
LABEL_41:
        if (++v24 > v26)
        {
          pthread_mutex_unlock(&stru_100020100);
          free(v25);
          int v8 = a5;
          size_t v17 = v64;
          goto LABEL_45;
        }
      }
      while (1)
      {
        uint64_t v28 = (unsigned char *)v27[15];
        int v29 = *v28;
        if (*v28)
        {
          unsigned int v30 = 0;
          uint64_t v31 = v28 + 1;
          do
          {
            unsigned int v30 = dword_100020298[v29 ^ HIBYTE(v30)] ^ (v30 << 8);
            int v32 = *v31++;
            int v29 = v32;
          }
          while (v32);
        }
        else
        {
          unsigned int v30 = 0;
        }
        if (v30 <= 1) {
          unsigned int v30 = 1;
        }
        unsigned int v33 = *(_DWORD *)(a1 + 8);
        uint64_t v34 = (uint64_t *)(*(void *)a1 + 8 * (v33 & v30));
        uint64_t v35 = *v34;
        if (*v34)
        {
          uint64_t v36 = (uint64_t *)*v27;
          *uint64_t v27 = v35;
        }
        else
        {
          unsigned int v37 = *v18 + 1;
          *uint64_t v18 = v37;
          if (v37 > v33)
          {
            uint64_t v38 = sub_1000079A4();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
            {
              unsigned int v39 = *v18;
              int v40 = *v71;
              *(_DWORD *)buf = 67109376;
              unsigned int v75 = v39;
              __int16 v76 = 1024;
              int v77 = v40;
              _os_log_error_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "event table is screwed up! filled buckets %u / table_mask %u)", buf, 0xEu);
            }
          }
          uint64_t v35 = *v34;
          uint64_t v36 = (uint64_t *)*v27;
          *uint64_t v27 = *v34;
          if (!v35) {
            goto LABEL_40;
          }
        }
        *(void *)(v35 + 8) = v27;
LABEL_40:
        *uint64_t v34 = (uint64_t)v27;
        v27[1] = (uint64_t)v34;
        uint64_t v27 = v36;
        if (!v36) {
          goto LABEL_41;
        }
      }
    }
    unsigned int v41 = sub_1000079A4();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
      sub_100015444();
    }
  }
LABEL_45:
  BOOL v42 = sub_10000A050(a2);
  int v43 = *(unsigned __int8 *)a4;
  if (*a4)
  {
    unsigned int v44 = 0;
    uint64_t v45 = (unsigned __int8 *)(a4 + 1);
    do
    {
      unsigned int v44 = dword_100020298[v43 ^ HIBYTE(v44)] ^ (v44 << 8);
      int v46 = *v45++;
      int v43 = v46;
    }
    while (v46);
  }
  else
  {
    unsigned int v44 = 0;
  }
  if (v44 <= 1) {
    unsigned int v44 = 1;
  }
  int v47 = (uint64_t *)(*(void *)a1 + 8 * (*(_DWORD *)(a1 + 8) & v44));
  if ((v8 & 0x6000000) == 0)
  {
    uint64_t v48 = (void *)*v47;
    if (*v47)
    {
      do
      {
        uint64_t v49 = (uint64_t)v48;
        uint64_t v48 = (void *)*v48;
        int v50 = *(_DWORD *)(v49 + 24);
        if (v42)
        {
          if (v50 != a2) {
            continue;
          }
        }
        else if (sub_10000A050(v50))
        {
          continue;
        }
        if (*(void *)(v49 + 40) == a7)
        {
          uint64_t v51 = *(const char **)(v49 + 120);
          if (!strncmp(v51, a4, v17) && !v51[v17 - 1])
          {
            int add = atomic_fetch_add((atomic_uint *volatile)(v49 + 16), 1u);
            if (add <= -2)
            {
              uint64_t v63 = sub_1000079A4();
              if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR)) {
                sub_10001534C(v49, (add + 1), v63);
              }
            }
            int v53 = a8;
            int v60 = a5;
            if (*(_DWORD *)(v49 + 16) == 1) {
              *(_DWORD *)(v49 + 20) = 0;
            }
            uint64_t v59 = a6;
            int v58 = v69;
LABEL_73:
            *(_DWORD *)(v49 + 20) |= v60;
            *(_DWORD *)(v49 + 24) = a2;
            *(void *)(v49 + 32) = v59;
            *(void *)(v49 + 40) = a7;
            *(_DWORD *)(v49 + 48) = v53;
            if (v58) {
              goto LABEL_74;
            }
            return v49;
          }
        }
      }
      while (v48);
    }
  }
  uint64_t v52 = (char *)malloc_type_zone_malloc((malloc_zone_t *)qword_1000206C0, 0x80uLL, 0x10B00402042220DuLL);
  uint64_t v49 = (uint64_t)v52;
  if (v52)
  {
    *((void *)v52 + 2) = 1;
    *((_DWORD *)v52 + 7) = a3;
    *((_WORD *)v52 + 26) = v17;
    *((void *)v52 + 5) = a7;
    int v53 = a8;
    *((_DWORD *)v52 + 12) = a8;
    *(_OWORD *)(v52 + 56) = 0u;
    *(_OWORD *)(v52 + 72) = 0u;
    *(_OWORD *)(v52 + 88) = 0u;
    *(_OWORD *)(v52 + 104) = 0u;
    uint64_t v54 = sub_10000A568(a4, v17);
    *(void *)(v49 + 120) = v54;
    if (v54[v17 - 1])
    {
      int v55 = dword_100020698++;
      if (v55 <= 49)
      {
        uint64_t v56 = sub_1000079A4();
        if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR)) {
          sub_1000152DC();
        }
      }
    }
    int v57 = (void *)*v47;
    if (*v47) {
      v57[1] = v49;
    }
    else {
      ++*v18;
    }
    uint64_t v59 = a6;
    int v60 = a5;
    int v58 = v69;
    *(void *)uint64_t v49 = v57;
    *int v47 = v49;
    *(void *)(v49 + 8) = v47;
    goto LABEL_73;
  }
  LOBYTE(v58) = v69;
  if (v69) {
LABEL_74:
  }
    a4[v17 - 1] = v58;
  return v49;
}

BOOL sub_10000A050(int a1)
{
  pthread_mutex_lock(&stru_100020008);
  if (dword_100021858[0] == a1)
  {
    BOOL v2 = 1;
  }
  else
  {
    unint64_t v3 = 0;
    do
    {
      unint64_t v4 = v3;
      if (v3 == 31) {
        break;
      }
      int v5 = dword_100021858[++v3];
    }
    while (v5 != a1);
    BOOL v2 = v4 < 0x1F;
  }
  pthread_mutex_unlock(&stru_100020008);
  return v2;
}

uint64_t sub_10000A0D8(uint64_t result, uint64_t a2)
{
  atomic_fetch_add(&dword_10002071C, 1u);
  if (result)
  {
    unint64_t v3 = (_DWORD **)result;
    uint64_t v4 = a2 + 56;
    do
    {
      if (((*v3)[47] & 2) == 0)
      {
        unint64_t v5 = (*v3)[48];
        if (((0x80u >> (v5 & 7)) & atomic_fetch_or_explicit((atomic_uchar *volatile)(v4 + (v5 >> 3)), 0x80u >> (v5 & 7), memory_order_relaxed)) == 0)
        {
          uint64_t v6 = (uint64_t)*v3;
          uint64_t result = sub_10000AA08(*v3);
          int v7 = *v3;
          if ((int)result >= *(_DWORD *)(v6 + 224) - 1)
          {
            atomic_fetch_and_explicit((atomic_uchar *volatile)(v4 + ((unint64_t)v7[48] >> 3)), -129 >> (v7[48] & 7), memory_order_relaxed);
            uint64_t v8 = (uint64_t)*v3;
            if (((*v3)[47] & 1) == 0)
            {
              *(_DWORD *)(v8 + 188) |= 1u;
              *(void *)(v8 + 152) = *(void *)(a2 + 32);
            }
          }
          else if ((v7[47] & 0x80) != 0 && *(_DWORD *)(a2 + 24) == v7[62])
          {
            atomic_fetch_and_explicit((atomic_uchar *volatile)(v4 + ((unint64_t)v7[48] >> 3)), -129 >> (v7[48] & 7), memory_order_relaxed);
          }
          else
          {
            uint64_t result = sub_10000A6D8(a2);
            uint64_t v9 = (uint64_t)*v3;
            *(void *)(*((void *)*v3 + 52) + 8 * (int)(*v3)[61]) = a2;
            *(_DWORD *)(v9 + 244) = (*(_DWORD *)(v9 + 244) + 1) % *(_DWORD *)(v9 + 224);
          }
        }
      }
      unint64_t v3 = (_DWORD **)v3[1];
    }
    while (v3);
  }
  atomic_fetch_add(&dword_10002071C, 0xFFFFFFFF);
  return result;
}

const char *sub_10000A234(int a1, char *__s1, unsigned char *a3)
{
  unint64_t v3 = __s1;
  *a3 = 0;
  if (a1)
  {
    if (!strncmp(__s1, "/.docid/", 8uLL) || !strncmp(v3, "/.activity/", 0xBuLL))
    {
      ++v3;
    }
    else
    {
      sub_10000A434((uint64_t)&unk_100021758);
      uint64_t v6 = qword_1000206E8;
      if (!qword_1000206E8) {
        goto LABEL_25;
      }
      if (*(int *)(qword_1000206E8 + 8) < 1)
      {
        LODWORD(v7) = 0;
      }
      else
      {
        uint64_t v7 = 0;
        do
        {
          if (**(_DWORD **)(*(void *)v6 + 8 * v7) == a1)
          {
            if ((*(_DWORD *)(*(void *)(*(void *)v6 + 8 * v7) + 32) & 0x8000) != 0)
            {
              *a3 = 1;
            }
            else if ((*(_DWORD *)(*(void *)(*(void *)v6 + 8 * v7) + 32) & 0x50) == 0)
            {
              break;
            }
          }
          ++v7;
        }
        while (v7 < *(int *)(v6 + 8));
      }
      if ((int)v7 < *(_DWORD *)(v6 + 8))
      {
        int v8 = *(_DWORD *)(*(void *)(*(void *)v6 + 8 * v7) + 24);
        if (v8 < 1)
        {
          LODWORD(v9) = 0;
        }
        else
        {
          uint64_t v9 = 0;
          do
          {
            if (v3[v9] == 47)
            {
              --v8;
            }
            else if (!v3[v9])
            {
              break;
            }
            ++v9;
          }
          while (v8 > 0);
        }
        sub_10000A3A0((uint64_t)&unk_100021758);
        v3 += v9;
      }
      else
      {
LABEL_25:
        sub_10000A3A0((uint64_t)&unk_100021758);
      }
    }
  }
  return v3;
}

uint64_t sub_10000A3A0(uint64_t a1)
{
  BOOL v2 = (int *)sub_10000A4F4((pthread_key_t *)a1);
  if (v2)
  {
    int v3 = *v2;
    if (!*v2) {
      sub_10000B814();
    }
    if (v3 < 1) {
      int v4 = v3 + 1;
    }
    else {
      int v4 = v3 - 1;
    }
    *BOOL v2 = v4;
    if (v4) {
      return 0;
    }
  }
  else
  {
    uint64_t v6 = sub_1000079A4();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100014414(v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  return pthread_rwlock_unlock((pthread_rwlock_t *)(a1 + 8));
}

uint64_t sub_10000A434(uint64_t a1)
{
  BOOL v2 = (int *)sub_10000A4F4((pthread_key_t *)a1);
  if (v2)
  {
    int v3 = *v2;
    if (*v2 < 0) {
      sub_10000AA60();
    }
    *BOOL v2 = v3 + 1;
    if (v3)
    {
      return 0;
    }
    else
    {
      uint64_t v4 = pthread_rwlock_rdlock((pthread_rwlock_t *)(a1 + 8));
      if (v4)
      {
        uint64_t v13 = sub_1000079A4();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          sub_100014504(v4);
        }
      }
    }
  }
  else
  {
    unint64_t v5 = sub_1000079A4();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10001448C(v5, v6, v7, v8, v9, v10, v11, v12);
    }
    return pthread_rwlock_rdlock((pthread_rwlock_t *)(a1 + 8));
  }
  return v4;
}

void *sub_10000A4F4(pthread_key_t *a1)
{
  BOOL v2 = pthread_getspecific(*a1);
  if (!v2)
  {
    int v3 = malloc_type_malloc(4uLL, 0x100004052888210uLL);
    BOOL v2 = v3;
    if (v3)
    {
      *int v3 = 0;
      if (pthread_setspecific(*a1, v3))
      {
        free(v2);
        return 0;
      }
    }
  }
  return v2;
}

char *sub_10000A568(const char *a1, size_t a2)
{
  size_t v2 = a2;
  if (a1[a2 - 1] && !a1[a2]) {
    size_t v2 = a2 + 1;
  }
  int v4 = *(unsigned __int8 *)a1;
  if (*a1)
  {
    unsigned int v5 = 0;
    uint64_t v6 = (unsigned __int8 *)(a1 + 1);
    do
    {
      unsigned int v5 = dword_100020298[v4 ^ HIBYTE(v5)] ^ (v5 << 8);
      int v7 = *v6++;
      int v4 = v7;
    }
    while (v7);
  }
  else
  {
    unsigned int v5 = 0;
  }
  if (v5 <= 1) {
    int v8 = 1;
  }
  else {
    int v8 = v5;
  }
  pthread_mutex_lock(&stru_100020050);
  uint64_t v9 = (char **)(qword_100021848 + 8 * (dword_100021854 & v8));
  uint64_t v10 = *v9;
  if (*v9)
  {
    while (strncmp(v10 + 20, a1, v2) || v10[v2 + 19])
    {
      uint64_t v10 = *(char **)v10;
      if (!v10) {
        goto LABEL_16;
      }
    }
    uint64_t v13 = (int *)(v10 + 16);
  }
  else
  {
LABEL_16:
    uint64_t v11 = (char *)malloc_type_zone_malloc((malloc_zone_t *)qword_1000206A8, v2 + 24, 0x9FA32475uLL);
    if (!v11)
    {
      pthread_mutex_unlock(&stru_100020050);
      return 0;
    }
    uint64_t v10 = v11;
    *((_DWORD *)v11 + 4) = 1;
    strlcpy(v11 + 20, a1, v2);
    uint64_t v12 = *v9;
    *(void *)uint64_t v10 = *v9;
    if (v12) {
      *((void *)v12 + 1) = v10;
    }
    *uint64_t v9 = v10;
    *((void *)v10 + 1) = v9;
    uint64_t v13 = &dword_100021850;
  }
  ++*v13;
  pthread_mutex_unlock(&stru_100020050);
  return v10 + 20;
}

uint64_t sub_10000A6D8(uint64_t a1)
{
  int add = atomic_fetch_add((atomic_uint *volatile)(a1 + 16), 1u);
  uint64_t v2 = (add + 1);
  if (add <= -2)
  {
    int v3 = sub_1000079A4();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_100014EDC();
    }
    MEMORY[0x99] = -1159983647;
  }
  return v2;
}

uint64_t sub_10000A754(uint64_t a1)
{
  uint64_t v1 = 0;
  uint64_t v2 = 0;
  uint64_t v3 = *(int *)(a1 + 8) + 1000000 * *(void *)a1;
  atomic_fetch_add(&dword_10002071C, 1u);
  do
  {
    uint64_t v4 = xmmword_100020758[v1];
    if (!v4 || (*(_DWORD *)(v4 + 188) & 2) != 0) {
      goto LABEL_26;
    }
    uint64_t v5 = *(void *)(v4 + 144);
    if ((*(_DWORD *)(v4 + 188) & 4) != 0)
    {
      unint64_t v7 = *(void *)(v4 + 176);
      unint64_t v6 = v3 - v5;
    }
    else if (!v5 || ((v6 = v3 - v5, unint64_t v7 = *(void *)(v4 + 176), v7 >= 0x3E8) ? (v8 = v6 >= 2 * v7) : (v8 = 0), v8))
    {
      *(void *)(v4 + 144) = v3;
LABEL_17:
      if (*(_DWORD *)(v4 + 240) != *(_DWORD *)(v4 + 244)
        && v2 - 1 >= (unint64_t)(*(void *)(v4 + 176) - v3 + *(void *)(v4 + 144)))
      {
        uint64_t v2 = *(void *)(v4 + 176) - v3 + *(void *)(v4 + 144);
      }
      goto LABEL_20;
    }
    if (v6 < v7 && (int)sub_10000AA08((_DWORD *)xmmword_100020758[v1]) <= *(_DWORD *)(v4 + 224) / 2) {
      goto LABEL_17;
    }
    if (*(_DWORD *)(v4 + 240) != *(_DWORD *)(v4 + 244))
    {
      *(void *)(v4 + 144) = v3;
      sub_10000BA68(v4);
    }
LABEL_20:
    if ((unint64_t)(v3 - *(void *)(v4 + 312)) >= 0x141DD76001)
    {
      memset(buffer, 0, sizeof(buffer));
      if ((*(_DWORD *)(v4 + 188) & 0x20) != 0 && proc_pidinfo(*(_DWORD *)(v4 + 248), 4, 0, buffer, 96) != 96)
      {
        uint64_t v9 = sub_1000079A4();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          int v10 = *(_DWORD *)(v4 + 248);
          *(_DWORD *)buf = 67109120;
          int v14 = v10;
          _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Failed to gather process task information for pid: %i", buf, 8u);
        }
      }
      analytics_send_event_lazy();
      *(void *)(v4 + 312) = v3;
    }
LABEL_26:
    ++v1;
  }
  while (v1 != 512);
  atomic_fetch_add(&dword_10002071C, 0xFFFFFFFF);
  return v2;
}

uint64_t sub_10000AA08(_DWORD *a1)
{
  int v3 = a1[60];
  int v2 = a1[61];
  if (v3 <= v2) {
    return (v2 - v3);
  }
  else {
    return (a1[56] - v3 + v2);
  }
}

void sub_10000AA60()
{
  __assert_rtn("fsevent_rwlock_rdlock", "fseventsd_implementation.c", 259, "*pLockCount >= 0");
}

uint64_t sub_10000AA8C(uint64_t a1, uint64_t a2, int8x8_t *a3, unsigned int a4, int a5, unint64_t a6, _DWORD *a7, int *a8, char a9)
{
  unsigned int v160 = 0;
  unint64_t v159 = 0;
  uint64_t v158 = 0;
  unsigned int v157 = 0;
  int v16 = a3->i32[0];
  char v17 = 1;
  if (a3->i32[0] > 1145852721)
  {
    if (v16 == 1145852722) {
      goto LABEL_9;
    }
    int v18 = 1145852723;
  }
  else
  {
    if (v16 == 844319812) {
      goto LABEL_9;
    }
    int v18 = 861097028;
  }
  if (v16 == v18) {
    char v17 = 3;
  }
  else {
    char v17 = 0;
  }
LABEL_9:
  __s2 = 0;
  __endptr = 0;
  bzero(&v154, 0x588uLL);
  uint64_t v153 = a2;
  *a7 = 0;
  if (a8) {
    *a8 = 0;
  }
  __int32 v19 = a3->i32[0];
  uint64_t v151 = a2;
  if (a3->i32[0] > 1145852720)
  {
    if ((v19 - 1145852721) < 3)
    {
      int v20 = a3[1].i32[0];
      goto LABEL_18;
    }
  }
  else if (v19 == 827542596 || v19 == 844319812 || v19 == 861097028)
  {
    int v20 = bswap32(a3[1].u32[0]);
    goto LABEL_18;
  }
  int v20 = a3[1].i32[0];
  if (v20 > 0x40000)
  {
    uint64_t v96 = sub_1000079A4();
    if (os_log_type_enabled(v96, OS_LOG_TYPE_ERROR)) {
      sub_100016AC0();
    }
    return 22;
  }
LABEL_18:
  if (a5)
  {
    uint64_t v21 = 22;
    if (v20 > 0x40000 || v20 > a4) {
      return v21;
    }
    __int32 v22 = a3->i32[1];
    a3->i32[1] = 0;
    unsigned int v23 = sub_10000B9FC(a3, v20);
    if (v19 == 827542596 || v19 == 861097028 || v19 == 844319812) {
      unsigned int v23 = bswap32(v23);
    }
    if (v22 == v23)
    {
      if (a8)
      {
        int v24 = 2;
LABEL_31:
        *a8 = v24;
      }
    }
    else
    {
      if (v22 != sub_1000127D8(a3, v20))
      {
        uint64_t v97 = sub_1000079A4();
        if (os_log_type_enabled(v97, OS_LOG_TYPE_ERROR)) {
          sub_100016A58();
        }
        return v21;
      }
      if (a8)
      {
        int v24 = 1;
        goto LABEL_31;
      }
    }
  }
  __int32 v25 = a3->i32[0];
  if (a3->i32[0] == 827542596 || v25 == 861097028 || v25 == 844319812) {
    sub_100012844(a3, (int)a4, v17);
  }
  unsigned int v26 = (unsigned int *)(v151 + 128);
  uint64_t v27 = (const char **)malloc_type_malloc(16 * *(int *)(v151 + 128), 0x1010040466105CCuLL);
  if (!v27)
  {
    __int16 v89 = sub_1000079A4();
    if (os_log_type_enabled(v89, OS_LOG_TYPE_ERROR)) {
      sub_100016790((uint64_t)v26, v89, v90, v91, v92, v93, v94, v95);
    }
    return 12;
  }
  unint64_t v147 = a6;
  v148 = a7;
  uint64_t v28 = v27;
  __strlcpy_chk();
  uint64_t v29 = *(void *)(a1 + 16);
  size_t v30 = strlen((const char *)v29);
  size_t v31 = v30;
  size_t v149 = v30;
  if (*(unsigned char *)v29 == 47)
  {
    size_t v149 = v30;
    if (*(unsigned char *)(v29 + 1))
    {
      *(_WORD *)&v162[v30] = 47;
      size_t v149 = v30 + 1;
    }
  }
  v145 = (unsigned int *)(v151 + 128);
  uint64_t v32 = *v26;
  if ((int)v32 >= 1)
  {
    unsigned int v33 = *(const char ***)(v151 + 136);
    int v34 = *(_DWORD *)(v151 + 112);
    uint64_t v35 = v28 + 1;
    do
    {
      uint64_t v36 = *v33;
      size_t v37 = strlen(*v33);
      *(v35 - 1) = (const char *)v37;
      if (v34) {
        goto LABEL_43;
      }
      size_t v38 = v37;
      if (!strncmp((const char *)v29, v36, v31) && v38 >= v31)
      {
        if (v31 == 1 || ((int v40 = v36[v31], v40 != 47) ? (v41 = v40 == 0) : (v41 = 1), v41))
        {
          BOOL v42 = &v36[v31];
          *uint64_t v35 = &v36[v31];
          if (v36[v31] == 47) {
            *uint64_t v35 = ++v42;
          }
          *(v35 - 1) = (const char *)(&v36[v38] - v42);
          goto LABEL_44;
        }
      }
      if (*v36 != 47 || v36[1])
      {
LABEL_43:
        *uint64_t v35 = v36;
      }
      else
      {
        *(v35 - 1) = 0;
        *uint64_t v35 = (const char *)&unk_1000187EA;
      }
LABEL_44:
      v35 += 2;
      ++v33;
      --v32;
    }
    while (v32);
  }
  int v43 = (char *)&a3[1] + 4;
  size_t __size = 1024 - v149;
  uint64_t v44 = v151;
  uint64_t v146 = v151 + 352;
  uint64_t v45 = v148;
  int v46 = (int *)a1;
LABEL_63:
  uint64_t v47 = a3[1].i32[0];
  unint64_t v48 = (unint64_t)a3 + v47;
  while (1)
  {
    if ((unint64_t)v43 >= v48) {
      goto LABEL_180;
    }
    uint64_t v49 = v43;
    uint64_t v50 = 0;
    __s2 = v43;
    uint64_t v51 = (char *)a3 + v47;
    while (v43[v50])
    {
      if (v48 - (void)v43 == ++v50) {
        goto LABEL_70;
      }
    }
    uint64_t v51 = &v43[v50];
LABEL_70:
    unint64_t v52 = v51 - v43 + 1;
    size_t v163 = v52;
    if (v52 >= 0x401)
    {
      int v98 = sub_1000079A4();
      if (os_log_type_enabled(v98, OS_LOG_TYPE_ERROR)) {
        sub_100016800(v98, v99, v100, v101, v102, v103, v104, v105);
      }
LABEL_180:
      uint64_t v21 = 0;
      goto LABEL_194;
    }
    int v53 = &v43[v52];
    if ((unint64_t)&v43[v52] >= v48) {
      break;
    }
    if (a9 && ((v46[8] & 0xD0) != 0 || (v46[8] & 4) == 0)) {
      goto LABEL_180;
    }
    if ((unint64_t)(v53 + 8) > v48)
    {
      uint64_t v108 = sub_1000079A4();
      if (os_log_type_enabled(v108, OS_LOG_TYPE_ERROR)) {
        sub_100016878(v108, v109, v110, v111, v112, v113, v114, v115);
      }
      goto LABEL_193;
    }
    int v43 = v53 + 12;
    unint64_t v54 = *(void *)v53;
    unint64_t v159 = *(void *)v53;
    if ((unint64_t)(v53 + 12) > v48)
    {
      __int16 v116 = sub_1000079A4();
      if (os_log_type_enabled(v116, OS_LOG_TYPE_ERROR)) {
        sub_1000168F0(v116, v117, v118, v119, v120, v121, v122, v123);
      }
      goto LABEL_193;
    }
    unsigned int v160 = *((_DWORD *)v53 + 2);
    __int32 v55 = a3->i32[0];
    if (a3->i32[0] == 1145852722 || v55 == 844319812)
    {
      if ((unint64_t)(v53 + 20) > v48)
      {
        v124 = sub_1000079A4();
        if (!os_log_type_enabled(v124, OS_LOG_TYPE_ERROR)) {
          goto LABEL_193;
        }
        goto LABEL_188;
      }
      uint64_t v158 = *(void *)v43;
      int v43 = v53 + 20;
    }
    if (v55 == 1145852723 || v55 == 861097028)
    {
      uint64_t v56 = (unsigned int *)(v43 + 8);
      if ((unint64_t)(v43 + 8) > v48)
      {
        v124 = sub_1000079A4();
        if (!os_log_type_enabled(v124, OS_LOG_TYPE_ERROR)) {
          goto LABEL_193;
        }
LABEL_188:
        sub_100016968(v124, v125, v126, v127, v128, v129, v130, v131);
        goto LABEL_193;
      }
      uint64_t v57 = *(void *)v43;
      v43 += 12;
      uint64_t v158 = v57;
      if ((unint64_t)v43 > v48)
      {
        v132 = sub_1000079A4();
        if (os_log_type_enabled(v132, OS_LOG_TYPE_ERROR)) {
          sub_1000169E0(v132, v133, v134, v135, v136, v137, v138, v139);
        }
        goto LABEL_193;
      }
      unsigned int v157 = *v56;
    }
    if (v54 > v147 || (*(_DWORD *)(v44 + 188) & 0x4000) != 0)
    {
      int v141 = strncmp(v49, ".docid/", 7uLL);
      if (v141)
      {
        if (strncmp(v49, ".activity/1/", 0xCuLL))
        {
          strlcpy(&v162[v149], v49, __size);
          uint64_t v142 = 0;
          int v58 = v162;
LABEL_104:
          __s1 = v58;
          uint64_t v66 = *v145;
          if ((int)v66 >= 1)
          {
            size_t v67 = v163 - 1;
            uint64_t v68 = __s2;
            int v69 = v28 + 1;
            while (1)
            {
              size_t v70 = (size_t)*(v69 - 1);
              if (v70 <= v67)
              {
                uint64_t v71 = *v69;
                if (v70 >= 2 && v71[v70 - 1] == 47) {
                  --v70;
                }
                if (!strncmp(v71, v68, v70) && (v70 < 2 || !v68[v70] || v68[v70] == 47)) {
                  break;
                }
              }
              v69 += 2;
              if (!--v66)
              {
LABEL_115:
                uint64_t v45 = v148;
                int v46 = (int *)a1;
                uint64_t v44 = v151;
                goto LABEL_63;
              }
            }
            int v46 = (int *)a1;
            uint64_t v44 = v151;
            uint64_t v45 = v148;
            if (!*(_DWORD *)(v151 + 112) || *v68 != 47)
            {
              if (*(_DWORD *)(v151 + 252))
              {
                int v72 = __s1;
                memset(&v161, 0, sizeof(v161));
                if (HIDWORD(v142)) {
                  int v72 = *(const char **)(a1 + 16);
                }
                long long v73 = *(_OWORD *)(v151 + 276);
                *(_OWORD *)&v152.st_dev = *(_OWORD *)(v151 + 260);
                *(_OWORD *)&v152.st_uid = v73;
                int v74 = sandbox_check_by_audit_token();
                if (lstat(v72, &v161) | v74)
                {
                  if (*__error() != 2) {
                    goto LABEL_168;
                  }
                  memset(&v152, 0, sizeof(v152));
                  unsigned int v75 = sub_1000064D8(v72);
                  int v76 = access(v75, 4);
                  int v77 = sandbox_check_by_audit_token();
                  free(v75);
                  if (v76)
                  {
                    uint64_t v78 = *v145;
                    if ((int)v78 < 1) {
                      goto LABEL_167;
                    }
                    uint64_t v79 = 0;
                    uint64_t v80 = *(void *)(v151 + 136);
                    uint64_t v81 = 8 * v78;
                    while (!strstr(__s1, *(const char **)(v80 + v79)))
                    {
                      v79 += 8;
                      if (v81 == v79) {
                        goto LABEL_167;
                      }
                    }
                    int v88 = *(const char **)(v80 + v79);
                    if (!*(_DWORD *)(v151 + 112) || *v88)
                    {
                      if (!lstat(v88, &v152) && v152.st_uid == *(_DWORD *)(v151 + 252)) {
                        goto LABEL_166;
                      }
LABEL_167:
                      int v46 = (int *)a1;
LABEL_168:
                      uint64_t v44 = v151;
                      goto LABEL_63;
                    }
                    if (lstat(".", &v152) || v152.st_uid != *(_DWORD *)(v151 + 252)) {
                      goto LABEL_167;
                    }
LABEL_166:
                    if (sandbox_check_by_audit_token()) {
                      goto LABEL_167;
                    }
                  }
                  else if (v77)
                  {
                    goto LABEL_167;
                  }
                }
                uint64_t v68 = __s2;
              }
              uint64_t v82 = 0;
              int v83 = 0;
              do
              {
                int32_t v84 = *(const char **)(v146 + v82);
                if (!v84) {
                  break;
                }
                size_t v85 = strlen(*(const char **)(v146 + v82));
                if (*(_DWORD *)(v151 + 112))
                {
                  if (!strncmp(v68, v84, v85)) {
                    int v83 = 1;
                  }
                }
                else if (!strncmp(__s1, v84, v85))
                {
                  goto LABEL_115;
                }
                v82 += 8;
                uint64_t v45 = v148;
              }
              while (v82 != 64);
              int v46 = (int *)a1;
              uint64_t v44 = v151;
              if (!v83 && (v159 > v147 || (*(_DWORD *)(v151 + 188) & 0x4000) != 0))
              {
                if (!*(void *)(v151 + 208) || (*(_DWORD *)(v151 + 188) & 2) != 0) {
                  goto LABEL_180;
                }
                if (v159 > *(void *)(v151 + 168) || (*(_DWORD *)(v151 + 188) & 0x4000) != 0) {
                  *(void *)(v151 + 168) = v159;
                }
                if (!*(_DWORD *)(v151 + 112) && *v68 != 47)
                {
                  uint64_t v86 = v149;
                  if (HIDWORD(v142)) {
                    uint64_t v86 = 1;
                  }
                  v163 += v86;
                  uint64_t v68 = __s1;
                  __s2 = __s1;
                }
                if (((v142 | ((*(_DWORD *)(v151 + 188) & 0x100u) >> 8)) & 1) == 0 && v141)
                {
                  char v87 = strrchr(v68, 47);
                  if (v87 > v68)
                  {
                    v87[1] = 0;
                    size_t v163 = strlen(v68) + 1;
                  }
                  v160 &= 0xFE23F800;
                }
                uint64_t v21 = sub_100012DB8((unsigned int *)&v153, &v163, (const char **)&__s2, &v160, (unsigned int *)a1, &v159, &v158, &v157);
                if (v21 && v21 != 268435460) {
                  goto LABEL_194;
                }
              }
            }
          }
          goto LABEL_63;
        }
        int v62 = strtoull(v49 + 12, &__endptr, 10);
        int v60 = *v46;
        LODWORD(v142) = 1;
        uint64_t v63 = &v162[v149];
        if (*v46 != v62)
        {
          size_t v64 = ".activity/1/%lld";
          goto LABEL_100;
        }
LABEL_99:
        strlcpy(v63, v49, __size);
      }
      else
      {
        int v59 = strtoull(v49 + 7, &__endptr, 10);
        if (!strncmp(v49, ".activity/1/", 0xCuLL))
        {
          int v65 = strtoull(v49 + 12, &__endptr, 10);
          int v60 = *v46;
          LODWORD(v142) = 1;
          BOOL v61 = *v46 == v65;
        }
        else
        {
          LODWORD(v142) = 0;
          int v60 = *v46;
          BOOL v61 = *v46 == v59;
        }
        uint64_t v63 = &v162[v149];
        if (v61)
        {
          uint64_t v44 = v151;
          goto LABEL_99;
        }
        size_t v64 = ".docid/%lld";
        uint64_t v44 = v151;
LABEL_100:
        snprintf(v63, __size, v64, v60);
        if (__endptr) {
          strlcat(v63, __endptr, __size);
        }
        __s2 = v63;
        size_t v163 = strlen(v63) + 1;
      }
      HIDWORD(v142) = 1;
      int v58 = &v162[v149 - 1];
      goto LABEL_104;
    }
  }
  unint64_t v106 = sub_1000079A4();
  if (os_log_type_enabled(v106, OS_LOG_TYPE_ERROR))
  {
    __int32 v107 = a3[1].i32[0];
    v161.st_dev = 134218240;
    *(void *)&v161.st_mode = v53 - (char *)a3;
    WORD2(v161.st_ino) = 1024;
    *(_DWORD *)((char *)&v161.st_ino + 6) = v107;
    _os_log_error_impl((void *)&_mh_execute_header, v106, OS_LOG_TYPE_ERROR, "process_disk_event_buf: ptr out-of-bounds (%ld > max %d)", (uint8_t *)&v161, 0x12u);
  }
LABEL_193:
  uint64_t v21 = 22;
LABEL_194:
  sub_10000B840((uint64_t)&v153);
  _DWORD *v45 = a3[1].i32[0];
  free(v28);
  return v21;
}

void sub_10000B814()
{
  __assert_rtn("fsevent_rwlock_unlock", "fseventsd_implementation.c", 231, "*pLockCount != 0");
}

uint64_t sub_10000B840(uint64_t a1)
{
  if (*(_DWORD *)(*(void *)a1 + 188))
  {
    int v2 = sub_1000079A4();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      sub_1000178A4();
    }
    sub_100010D44(*(void *)a1);
  }
  uint64_t v3 = *(unsigned int *)(a1 + 1416);
  if (v3)
  {
    uint64_t v4 = (*(uint64_t (**)(void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)a1 + 208))(*(void *)(*(void *)a1 + 216), v3, a1 + 8, a1 + 1032, a1 + 264, a1 + 1288, a1 + 392, a1 + 648, a1 + 904);
    uint64_t v5 = v4;
    if (v4)
    {
      uint64_t v6 = *(void *)a1;
      if (v4 == 268435459) {
        *(_DWORD *)(v6 + 188) |= 2u;
      }
      if ((*(_DWORD *)(v6 + 188) & 2) == 0)
      {
        *(_DWORD *)(v6 + 188) |= 1u;
        unint64_t v7 = sub_1000079A4();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          int v11 = *(_DWORD *)(a1 + 1416);
          int v12 = *(_DWORD *)(*(void *)a1 + 248);
          *(_DWORD *)buf = 136315906;
          int v14 = "client_buffer_flush";
          __int16 v15 = 1024;
          int v16 = v11;
          __int16 v17 = 1024;
          int v18 = v12;
          __int16 v19 = 1024;
          int v20 = v5;
          _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%s: failed to send %u events to client pid: %d (status: %d)", buf, 0x1Eu);
        }
      }
    }
    if (*(_DWORD *)(a1 + 1416))
    {
      unint64_t v8 = 0;
      uint64_t v9 = a1 + 1032;
      do
      {
        free(*(void **)(v9 + 8 * v8));
        *(void *)(v9 + 8 * v8++) = 0;
      }
      while (v8 < *(unsigned int *)(a1 + 1416));
    }
  }
  else
  {
    uint64_t v5 = 0;
  }
  *(_DWORD *)(a1 + 1416) = 0;
  return v5;
}

uint64_t sub_10000B9FC(unsigned char *a1, int a2)
{
  if (a2)
  {
    unsigned int v2 = 0;
    do
    {
      int v3 = *a1++;
      unsigned int v2 = dword_100020298[v3 ^ HIBYTE(v2)] ^ (v2 << 8);
      --a2;
    }
    while (a2);
  }
  else
  {
    int v4 = *a1;
    if (*a1)
    {
      unsigned int v2 = 0;
      uint64_t v5 = a1 + 1;
      do
      {
        unsigned int v2 = dword_100020298[v4 ^ HIBYTE(v2)] ^ (v2 << 8);
        int v6 = *v5++;
        int v4 = v6;
      }
      while (v6);
    }
    else
    {
      unsigned int v2 = 0;
    }
  }
  if (v2 <= 1) {
    return 1;
  }
  else {
    return v2;
  }
}

uint64_t sub_10000BA68(uint64_t a1)
{
  pthread_mutex_lock((pthread_mutex_t *)a1);
  if ((*(_DWORD *)(a1 + 188) & 0x800) != 0)
  {
    memset(&v4, 0, sizeof(v4));
    pthread_t v3 = 0;
    if ((*(_DWORD *)(a1 + 188) & 0x20) != 0) {
      sub_100015250();
    }
    *(_DWORD *)(a1 + 188) &= ~0x800u;
    pthread_attr_init(&v4);
    pthread_attr_setdetachstate(&v4, 2);
    pthread_create(&v3, &v4, (void *(__cdecl *)(void *))sub_1000027DC, (void *)a1);
    pthread_attr_destroy(&v4);
  }
  pthread_cond_signal((pthread_cond_t *)(a1 + 64));
  return pthread_mutex_unlock((pthread_mutex_t *)a1);
}

uint64_t sub_10000BB3C(void (*a1)(void))
{
  sub_10000A434((uint64_t)&unk_100021758);
  uint64_t v2 = qword_1000206E8;
  if (qword_1000206E8 && *(int *)(qword_1000206E8 + 8) >= 1)
  {
    uint64_t v3 = 0;
    do
    {
      if (*(void *)(*(void *)v2 + 8 * v3) && (*(_DWORD *)(*(void *)(*(void *)v2 + 8 * v3) + 32) & 0x20) != 0) {
        a1(*(void *)(*(void *)v2 + 8 * v3));
      }
      ++v3;
    }
    while (v3 < *(int *)(v2 + 8));
  }

  return sub_10000A3A0((uint64_t)&unk_100021758);
}

uint64_t sub_10000BBDC(uint64_t a1, uint64_t a2)
{
  return strcmp(*(const char **)(*(void *)a1 + 40), *(const char **)(*(void *)a2 + 40));
}

uint64_t sub_10000BBF0(uint64_t a1, uint64_t a2)
{
  unint64_t v2 = *(void *)(*(void *)a1 + 32);
  unint64_t v3 = *(void *)(*(void *)a2 + 32);
  BOOL v4 = v2 > v3;
  if (v2 >= v3) {
    unsigned int v5 = 0;
  }
  else {
    unsigned int v5 = -1;
  }
  if (v4) {
    return 1;
  }
  else {
    return v5;
  }
}

uint64_t sub_10000BC10(uint64_t a1, int a2, char *a3)
{
  return 0;
}

uint64_t sub_10000BC34(uint64_t a1, void *a2)
{
  return 0;
}

uint64_t sub_10000BC54(void *a1)
{
  uint64_t result = sub_1000073CC();
  if (result) {
    *a1 = qword_1000206D0[dword_1000206E0];
  }
  return result;
}

uint64_t sub_10000BC94(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)a1 != *(_DWORD *)(a2 + 8)) {
    return 0;
  }
  *(void *)a2 = strdup(*(const char **)(a1 + 8));
  return 1;
}

_DWORD *sub_10000BCDC(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 36)
  {
    *(_DWORD *)(a2 + 32) = -304;
    NDR_record_t v3 = NDR_record;
  }
  else
  {
    uint64_t result = (_DWORD *)sub_10000BC10(result[3], result[8], (char *)(a2 + 36));
    *(_DWORD *)(a2 + 32) = result;
    NDR_record_t v3 = NDR_record;
    if (!result)
    {
      *(NDR_record_t *)(a2 + 24) = NDR_record;
      *(_DWORD *)(a2 + 4) = 72;
      return result;
    }
  }
  *(NDR_record_t *)(a2 + 24) = v3;
  return result;
}

_DWORD *sub_10000BD60(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    NDR_record_t v3 = NDR_record;
  }
  else
  {
    uint64_t result = (_DWORD *)sub_10000BC34(result[3], (void *)(a2 + 36));
    *(_DWORD *)(a2 + 32) = result;
    NDR_record_t v3 = NDR_record;
    if (!result)
    {
      *(NDR_record_t *)(a2 + 24) = NDR_record;
      *(_DWORD *)(a2 + 4) = 44;
      return result;
    }
  }
  *(NDR_record_t *)(a2 + 24) = v3;
  return result;
}

void sub_10000BDDC(id a1)
{
  qword_100020240 = (uint64_t)os_log_create("com.apple.fsevents", "daemon");
}

void start(int a1, uint64_t a2)
{
  kern_return_t v4;
  int v5;
  int v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  kern_return_t v11;
  NSObject *v12;
  pthread_t v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  kern_return_t v19;

  int v2 = 3;
  if (a1 == 2)
  {
    if (!strcmp("-d", *(const char **)(a2 + 8))) {
      int v2 = 35;
    }
    else {
      int v2 = 3;
    }
  }
  NDR_record_t v3 = getprogname();
  openlog(v3, v2, 24);
  BOOL v4 = bootstrap_check_in(bootstrap_port, "com.apple.FSEvents", (mach_port_t *)&dword_100020250);
  if (v4)
  {
    int v11 = v4;
    int v12 = sub_1000079A4();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
    *(_DWORD *)buf = 136315650;
    __int16 v15 = "main";
    int v16 = 2080;
    __int16 v17 = bootstrap_strerror(v11);
    int v18 = 1024;
    __int16 v19 = v11;
    unint64_t v8 = "%s: ERROR: bootstrap_check_in() => %s (%d)";
    uint64_t v9 = v12;
    int v10 = 28;
  }
  else
  {
    qword_100020248 = (uint64_t)dispatch_queue_create("com.apple.fseventsd.mach_channel_queue", 0);
    qword_100020258 = dispatch_mach_create_f();
    dispatch_set_qos_class_fallback();
    dispatch_mach_connect();
    uint64_t v13 = 0;
    unsigned int v5 = pthread_create(&v13, 0, (void *(__cdecl *)(void *))sub_1000118F8, 0);
    if (!v5) {
      dispatch_main();
    }
    int v6 = v5;
    unint64_t v7 = sub_1000079A4();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
LABEL_12:
      closelog();
      exit(1);
    }
    *(_DWORD *)buf = 136315394;
    __int16 v15 = "main";
    int v16 = 1024;
    LODWORD(v17) = v6;
    unint64_t v8 = "%s: ERROR: pthread_create() => %d";
    uint64_t v9 = v7;
    int v10 = 18;
  }
  _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, v8, buf, v10);
  goto LABEL_12;
}

uint64_t sub_10000BFEC(int a1, void *a2)
{
  uint64_t v3 = sub_1000069F0(a1);
  if (v3)
  {
    uint64_t v4 = v3;
    nullsub_1();
    sub_10001193C(v4, a2);
  }
  else
  {
    unsigned int v5 = sub_1000079A4();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100013BC4();
    }
  }
  return 0;
}

uint64_t sub_10000C060(uint64_t a1, int a2, unint64_t a3, uint64_t *a4)
{
  return 0;
}

uint64_t sub_10000C088(uint64_t a1, int a2, unint64_t a3, int *a4, int a5)
{
  if (a5)
  {
    uint64_t v6 = 5;
    int v7 = 13;
  }
  else
  {
    int v7 = sub_100011084(a2, a3);
    uint64_t v6 = 0;
  }
  *a4 = v7;
  return v6;
}

void sub_10000C0D0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x18u);
}

void sub_10000C120(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

void sub_10000C15C(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x1Cu);
}

void sub_10000C17C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_10000C1C0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x22u);
}

uint64_t sub_10000C1E0(uint64_t a1)
{
  uint64_t v2 = pthread_rwlock_init((pthread_rwlock_t *)(a1 + 8), 0);
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = sub_1000079A4();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_100014384(v3, v4);
    }
  }
  else
  {
    uint64_t v3 = pthread_key_create((pthread_key_t *)a1, (void (__cdecl *)(void *))&_free);
    if (v3)
    {
      unsigned int v5 = sub_1000079A4();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        sub_1000142F4(v3, v5);
      }
    }
  }
  return v3;
}

uint64_t sub_10000C280(uint64_t a1)
{
  uint64_t v2 = (int *)sub_10000A4F4((pthread_key_t *)a1);
  if (v2)
  {
    int v3 = *v2;
    if (*v2 >= 1) {
      sub_100014590();
    }
    --*v2;
    if (v3 < 0) {
      return 0;
    }
    uint64_t v4 = pthread_rwlock_wrlock((pthread_rwlock_t *)(a1 + 8));
    if (v4)
    {
      unsigned int v5 = sub_1000079A4();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        sub_1000145BC(v4);
      }
    }
    return v4;
  }
  else
  {
    return pthread_rwlock_wrlock((pthread_rwlock_t *)(a1 + 8));
  }
}

uint64_t sub_10000C330(int a1, uint64_t a2, int a3, int a4)
{
  if (a1)
  {
    uint64_t v7 = open("/dev/fsevents", 0);
    uint64_t v8 = v7;
    if ((v7 & 0x80000000) != 0) {
      return v8;
    }
    int v15 = a3;
    int v16 = a4;
    __int16 v17 = &dword_100020048;
    uint64_t v14 = a2;
    uint64_t v9 = ioctl(v7, 0x80187301uLL, &v14);
    if ((v9 & 0x80000000) != 0)
    {
      uint64_t v12 = v9;
      uint64_t v13 = sub_1000079A4();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_100014648(v13);
      }
      close(v8);
      return v12;
    }
    close(v8);
    return 0;
  }
  int v10 = dword_100020048;
  if (dword_100020048 < 0) {
    return 0;
  }
  dword_100020048 = -1;

  return close(v10);
}

void sub_10000C430(const char *a1, char *a2)
{
  long long v12 = xmmword_1000191F0;
  uint64_t v13 = 0;
  v14[0] = 0;
  v14[1] = 0;
  int v15 = 0;
  if (a1 && a2)
  {
    if (getattrlist(a1, &v12, v14, 0x14uLL, 0))
    {
      int v3 = sub_1000079A4();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
        sub_1000147FC();
      }
    }
    else
    {
      uuid_unparse((const unsigned __int8 *)v14 + 4, a2);
    }
  }
  else
  {
    uint64_t v4 = sub_1000079A4();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_100014784(v4, v5, v6, v7, v8, v9, v10, v11);
    }
  }
}

uint64_t sub_10000C510(uint32_t *a1)
{
  uint32_t v1 = *a1;
  uint32_t v8 = *a1;
  if ((a1[8] & 0x400) != 0)
  {
    uint64_t v10 = 0;
    if (dword_1000206C8)
    {
LABEL_23:
      v11.f_bsize = v1;
      ioctl(dword_100020048, 0x80047368uLL, &v11);
      return 0;
    }
    memset(&v11, 0, 512);
    if (qword_100020748)
    {
      uint64_t v2 = *(void *)(qword_100020748 + 16);
      if (v2) {
        sub_10000BA68(v2);
      }
    }
    int v9 = 0;
    sub_10000A434((uint64_t)&unk_100021758);
    if (sub_100011AF4(&v8, &v10))
    {
LABEL_22:
      sub_10000A3A0((uint64_t)&unk_100021758);
      goto LABEL_23;
    }
    uint64_t v3 = v10;
    if (v10)
    {
      if (statfs(*(const char **)(v10 + 8), &v11))
      {
        uint64_t v4 = sub_1000079A4();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
          sub_100014890();
        }
      }
      else
      {
        if (sub_10000CDBC((uint64_t)&v11, &v9)) {
          goto LABEL_17;
        }
        if (v9 == 2)
        {
          int v5 = *(_DWORD *)(v3 + 32) | 0x9040;
        }
        else
        {
          if (v9 != 1) {
            goto LABEL_17;
          }
          int v5 = *(_DWORD *)(v3 + 32) | 0x1000;
        }
        *(_DWORD *)(v3 + 32) = v5;
      }
    }
LABEL_17:
    if ((*(_DWORD *)(v3 + 32) & 1) == 0)
    {
      *(_DWORD *)(v3 + 32) &= ~4u;
      *(_DWORD *)(v3 + 32) |= 0x80u;
      *(_DWORD *)(v3 + 32) &= ~0x400u;
      atomic_fetch_add_explicit((atomic_uint *volatile)(v3 + 36), 1u, memory_order_relaxed);
      sub_10000A3A0((uint64_t)&unk_100021758);
      if (qword_100020748)
      {
        uint64_t v6 = *(void *)(qword_100020748 + 16);
        if (v6) {
          sub_10000BA68(v6);
        }
      }
      sub_10000DC94(*(_DWORD *)v3, 1);
      usleep(0xC350u);
      atomic_fetch_add_explicit((atomic_uint *volatile)(v3 + 36), 0xFFFFFFFF, memory_order_relaxed);
      sub_100010B9C(v3);
      *(void *)(v3 + 40) = time(0);
      goto LABEL_23;
    }
    goto LABEL_22;
  }
  return 0;
}

uint64_t sub_10000C748()
{
  zone = malloc_create_zone(0x10000uLL, 0);
  qword_1000206B8 = (uint64_t)zone;
  if (zone) {
    malloc_set_zone_name(zone, "DiskLoggerBufferZone");
  }
  size_t v38 = 0;
  int v1 = sub_10000CBEC(&v38);
  if (v1 < 1) {
    return 0xFFFFFFFFLL;
  }
  unsigned int v2 = v1;
  sub_10000C1E0((uint64_t)&unk_100021758);
  uint64_t v3 = malloc_type_malloc(0x10uLL, 0x10800409227ACB4uLL);
  if (!v3)
  {
    free(v38);
    return 12;
  }
  uint64_t v4 = v3;
  int v5 = malloc_type_calloc(v2, 8uLL, 0x2004093837F09uLL);
  if (!v5)
  {
    free(v4);
    size_t v30 = v38;
    goto LABEL_41;
  }
  uint64_t v6 = v5;
  uint64_t v36 = v4;
  uint64_t v7 = 0;
  while (1)
  {
    int v37 = 0;
    uint32_t v8 = malloc_type_calloc(0x88uLL, 1uLL, 0xB1905879uLL);
    v6[v7] = v8;
    if (!v8) {
      break;
    }
    int v9 = v8;
    uint64_t v10 = v38;
    statfs v11 = (char *)v38 + 2168 * v7;
    int v13 = *((_DWORD *)v11 + 12);
    long long v12 = v11 + 48;
    _DWORD *v8 = v13;
    uint64_t v14 = strdup(v12 + 40);
    *((void *)v9 + 1) = v14;
    if (sub_10000CC8C(v12 + 40, __s1))
    {
      *(void *)(v6[v7] + 16) = strdup(__s1);
      uint64_t v14 = *(char **)(v6[v7] + 16);
    }
    else
    {
      int v15 = sub_1000079A4();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        int v25 = *(_DWORD *)v6[v7];
        *(_DWORD *)buf = 136315650;
        int v40 = "init_dev_info";
        __int16 v41 = 2080;
        BOOL v42 = v12 + 40;
        __int16 v43 = 1024;
        int v44 = v25;
        _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%s: Could not resolve nofirmlink  path, fallback to mount_point[%s] dev[%d]\n", buf, 0x1Cu);
      }
      *(void *)(v6[v7] + 16) = strdup(v12 + 40);
    }
    int v16 = v14;
    do
    {
      while (1)
      {
        int v18 = *v16++;
        int v17 = v18;
        if (v18 != 47) {
          break;
        }
        ++*(_DWORD *)(v6[v7] + 24);
      }
    }
    while (v17);
    __int16 v19 = (_DWORD *)v6[v7];
    if (v14[1]) {
      ++v19[6];
    }
    int v20 = v10[542 * v7 + 16];
    v19[7] = v20;
    v19[8] = 4;
    if ((v20 & 0x4000) != 0)
    {
      v19[8] |= 1u;
      dword_1000206F0 = *(_DWORD *)v12;
    }
    int v37 = 0;
    if (sub_10000CDBC((uint64_t)&v10[542 * v7], &v37)) {
      int v21 = 256;
    }
    else {
      int v21 = 64;
    }
    *(_DWORD *)(v6[v7] + 32) |= v21;
    if (v37 == 2)
    {
      int v24 = sub_1000079A4();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        uint64_t v28 = v6[v7];
        uint64_t v29 = *(char **)(v28 + 8);
        LODWORD(v28) = *(_DWORD *)v28;
        *(_DWORD *)buf = 136315650;
        int v40 = "init_dev_info";
        __int16 v41 = 2080;
        BOOL v42 = v29;
        __int16 v43 = 1024;
        int v44 = v28;
        _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "%s: mount_point(%s) dev(%d) will be completely ignored", buf, 0x1Cu);
      }
      int v23 = 32832;
      goto LABEL_33;
    }
    if (v37 == 1)
    {
      __int32 v22 = sub_1000079A4();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        uint64_t v26 = v6[v7];
        uint64_t v27 = *(char **)(v26 + 8);
        LODWORD(v26) = *(_DWORD *)v26;
        *(_DWORD *)buf = 136315650;
        int v40 = "init_dev_info";
        __int16 v41 = 2080;
        BOOL v42 = v27;
        __int16 v43 = 1024;
        int v44 = v26;
        _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%s: Logging disabled (no_log) completely for device: mount_point(%s) dev(%d)", buf, 0x1Cu);
      }
      int v23 = 4096;
LABEL_33:
      *(_DWORD *)(v6[v7] + 32) |= v23;
    }
    if (++v7 == v2)
    {
      uint64_t v34 = (uint64_t)v36;
      *(void *)uint64_t v36 = v6;
      v36[2] = v2;
      __dmb(0xBu);
      qword_1000206E8 = v34;
      sub_100005318(sub_10000CFA0);
      pthread_create((pthread_t *)&qword_100020280, 0, (void *(__cdecl *)(void *))sub_10000DB0C, 0);
      free(v38);
      return 0;
    }
  }
  size_t v31 = sub_1000079A4();
  BOOL v32 = os_log_type_enabled(v31, OS_LOG_TYPE_ERROR);
  unsigned int v33 = v38;
  if (v32) {
    sub_100014908();
  }
  free(v6);
  free(v36);
  size_t v30 = v33;
LABEL_41:
  free(v30);
  return 0xFFFFFFFFLL;
}

uint64_t sub_10000CBEC(void *a1)
{
  int v2 = 1000;
  while (1)
  {
    int v3 = getfsstat(0, 0, 2);
    if (v3 < 0) {
      return 0;
    }
    int v4 = 2168 * v3 + 2168;
    uint64_t result = (uint64_t)malloc_type_malloc(v4, 0x789CADBuLL);
    if (!result) {
      return result;
    }
    uint64_t v6 = (void *)result;
    uint64_t result = getfsstat((statfs *)result, v4, 2);
    if ((result & 0x80000000) == 0) {
      goto LABEL_7;
    }
    free(v6);
    if (!--v2)
    {
      uint64_t v6 = 0;
      uint64_t result = 0xFFFFFFFFLL;
LABEL_7:
      *a1 = v6;
      return result;
    }
  }
}

char *sub_10000CC8C(const char *a1, char *a2)
{
  long long v5 = xmmword_100019208;
  memset(v8, 0, 512);
  int v6 = 0;
  int v7 = 32;
  DWORD1(v5) = 0x80000000;
  if (getattrlist(a1, &v5, v8, 0x420uLL, 0x20u) == -1)
  {
    int v3 = sub_1000079A4();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_100014988();
    }
    return 0;
  }
  else if (a2)
  {
    strlcpy(a2, (const char *)&v8[1] + SDWORD2(v8[1]) + 8, 0x400uLL);
  }
  else
  {
    return (char *)&v8[1] + SDWORD2(v8[1]) + 8;
  }
  return a2;
}

uint64_t sub_10000CDBC(uint64_t a1, int *a2)
{
  if (a2) {
    *a2 = 0;
  }
  if ((*(unsigned char *)(a1 + 65) & 0x40) != 0) {
    return 1;
  }
  memset(&v8, 0, sizeof(v8));
  snprintf(__str, 0x400uLL, "%s/.fseventsd/no_log", (const char *)(a1 + 88));
  if ((*(unsigned char *)(a1 + 65) & 0x10) != 0 && !lstat(__str, &v8))
  {
    if (!a2) {
      return 0;
    }
    uint64_t result = 0;
    int v6 = 1;
    goto LABEL_19;
  }
  snprintf(__str, 0x400uLL, "%s/.fseventsd/ignore", (const char *)(a1 + 88));
  int v4 = *(_DWORD *)(a1 + 64);
  if ((v4 & 0x1000) == 0) {
    goto LABEL_9;
  }
  if (!lstat(__str, &v8))
  {
    if (!a2) {
      return 0;
    }
    uint64_t result = 0;
    int v6 = 2;
LABEL_19:
    *a2 = v6;
    return result;
  }
  int v4 = *(_DWORD *)(a1 + 64);
LABEL_9:
  if ((v4 & 0x21) != 0) {
    return 0;
  }
  if (strcmp((const char *)(a1 + 72), "apfs"))
  {
    if ((v4 & 0x100000) == 0) {
      goto LABEL_13;
    }
LABEL_23:
    int v7 = strstr((char *)(a1 + 88), "/Users/");
    uint64_t result = 0;
    if ((v4 & 0x1000) == 0 || !v7) {
      return result;
    }
    goto LABEL_25;
  }
  __int16 v9 = 0;
  if (!APFSVolumeRole() && v9 == 576) {
    return 1;
  }
  int v4 = *(_DWORD *)(a1 + 64);
  if ((v4 & 0x100000) != 0) {
    goto LABEL_23;
  }
LABEL_13:
  if ((v4 & 0x1000) == 0) {
    return 0;
  }
LABEL_25:
  uint64_t result = strcmp((const char *)(a1 + 88), "/dev");
  if (result)
  {
    uint64_t result = strcmp((const char *)(a1 + 72), "acfs");
    if (result) {
      return (v4 & 0x200) == 0 && strcmp((const char *)(a1 + 88), "/private/var/wireless/baseband_data");
    }
  }
  return result;
}

uint64_t sub_10000CFA0()
{
  uint64_t v0 = __chkstk_darwin();
  uint64_t v1 = v0;
  unint64_t v54 = 0;
  unint64_t v55 = 0;
  unint64_t v53 = 0;
  memset(&v58, 0, 512);
  uint64_t v2 = *(void *)(v0 + 128);
  if (v2 && v2 != qword_100020748)
  {
    int v3 = sub_1000079A4();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_100014D4C();
    }
    return 0;
  }
  int v4 = (_DWORD *)(v0 + 32);
  if ((*(_DWORD *)(v0 + 32) & 0x100) == 0 || (*v4 & 0x1000) != 0 && (*v4 & 1) == 0)
  {
    long long v5 = sub_1000079A4();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100014A1C();
    }
    return 0;
  }
  int v6 = (char *)malloc_type_calloc(0x9F8uLL, 1uLL, 0x3A070EA9uLL);
  if (!v6) {
    return 0;
  }
  uint64_t v7 = (uint64_t)v6;
  *((void *)v6 + 3) = 0x100002000;
  pthread_rwlock_init((pthread_rwlock_t *)(v6 + 48), 0);
  stat v8 = *(unsigned char **)(v1 + 8);
  if (*v8 == 47 && v8[1]) {
    snprintf((char *)(v7 + 256), 0x400uLL, "%s/.fseventsd", *(const char **)(v1 + 8));
  }
  else {
    __strlcpy_chk();
  }
  char v9 = 1;
  while (1)
  {
    int v10 = open((const char *)(v7 + 256), 0x20000000);
    if (v10 < 0)
    {
      long long v12 = sub_1000079A4();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        uint64_t v15 = *(void *)(v1 + 8);
        int v16 = *(_DWORD *)v1;
        buf.f_bsize = 136315906;
        *(void *)&buf.f_iosize = "create_dls_callback";
        WORD2(buf.f_blocks) = 2080;
        *(uint64_t *)((char *)&buf.f_blocks + 6) = v7 + 256;
        HIWORD(buf.f_bfree) = 2080;
        buf.f_bavail = v15;
        LOWORD(buf.f_files) = 1024;
        *(_DWORD *)((char *)&buf.f_files + 2) = v16;
        _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%s: Could not open logging directory <2> [%s] for mount[%s] dev[%d] ", (uint8_t *)&buf, 0x26u);
      }
      memset(&v52, 0, sizeof(v52));
    }
    else
    {
      int v11 = v10;
      if (fstatfs(v10, &v58)
        || v58.f_fsid.val[0] != *(_DWORD *)v1
        || v58.f_fsid.val[0] == dword_1000206F0 && (*v4 & 1) == 0)
      {
        int v17 = sub_1000079A4();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          uint64_t v18 = *(void *)(v1 + 8);
          int v19 = *(_DWORD *)v1;
          buf.f_bsize = 136315906;
          *(void *)&buf.f_iosize = "create_dls_callback";
          WORD2(buf.f_blocks) = 2080;
          *(uint64_t *)((char *)&buf.f_blocks + 6) = v7 + 256;
          HIWORD(buf.f_bfree) = 2080;
          buf.f_bavail = v18;
          LOWORD(buf.f_files) = 1024;
          *(_DWORD *)((char *)&buf.f_files + 2) = v19;
          _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%s: Could not open logging directory <1> [%s] for mount[%s] dev[%d] ", (uint8_t *)&buf, 0x26u);
        }
LABEL_59:
        close(v11);
LABEL_60:
        free((void *)v7);
        return 0;
      }
      memset(&v52, 0, sizeof(v52));
      if (fstat(v11, &v52) || (v52.st_mode & 0xF000) == 0x4000) {
        goto LABEL_54;
      }
      close(v11);
    }
    int v13 = *(unsigned __int8 **)(v1 + 8);
    int v14 = *v13;
    if ((v9 & 1) == 0) {
      break;
    }
    if (v14 == 47 && !v13[1])
    {
      __strlcpy_chk();
      char v9 = 0;
      if ((*(_WORD *)(v1 + 28) & 0x4001) != 0) {
        goto LABEL_39;
      }
    }
    else
    {
      snprintf((char *)(v7 + 256), 0x400uLL, "%s%s", *(const char **)(v1 + 8), "/private/var/db/fseventsd");
      char v9 = 0;
    }
  }
  if (v14 == 47 && v13[1]) {
    snprintf((char *)(v7 + 256), 0x400uLL, "%s/.fseventsd", *(const char **)(v1 + 8));
  }
  else {
    __strlcpy_chk();
  }
LABEL_39:
  unlink((const char *)(v7 + 256));
  if (mkdir((const char *)(v7 + 256), 0x1C0u) && ((*v4 & 1) == 0 || *__error() != 30))
  {
    int v20 = sub_1000079A4();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_100014CA0();
    }
  }
  int v21 = open((const char *)(v7 + 256), 0x20000000);
  if (v21 < 0)
  {
    uint64_t v28 = sub_1000079A4();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      uint64_t v39 = *(void *)(v1 + 8);
      int v40 = *(_DWORD *)v1;
      buf.f_bsize = 136315906;
      *(void *)&buf.f_iosize = "create_dls_callback";
      WORD2(buf.f_blocks) = 2080;
      *(uint64_t *)((char *)&buf.f_blocks + 6) = v7 + 256;
      HIWORD(buf.f_bfree) = 2080;
      buf.f_bavail = v39;
      LOWORD(buf.f_files) = 1024;
      *(_DWORD *)((char *)&buf.f_files + 2) = v40;
      _os_log_error_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "%s: Could not open logging directory <3> [%s] for mount[%s] dev[%d] ", (uint8_t *)&buf, 0x26u);
    }
    if ((*v4 & 1) == 0)
    {
      uint64_t v29 = sub_1000079A4();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        uint64_t v30 = *(void *)(v1 + 8);
        int v31 = *(_DWORD *)v1;
        buf.f_bsize = 136315906;
        *(void *)&buf.f_iosize = "create_dls_callback";
        WORD2(buf.f_blocks) = 2080;
        *(uint64_t *)((char *)&buf.f_blocks + 6) = v7 + 256;
        HIWORD(buf.f_bfree) = 2080;
        buf.f_bavail = v30;
        LOWORD(buf.f_files) = 1024;
        *(_DWORD *)((char *)&buf.f_files + 2) = v31;
        _os_log_error_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "%s: Could not open logging directory <4> [%s] for mount[%s] dev[%d] ", (uint8_t *)&buf, 0x26u);
      }
      goto LABEL_60;
    }
    strcpy((char *)(v7 + 256), "/tmp");
    int v11 = open((const char *)(v7 + 256), 0);
  }
  else
  {
    int v11 = v21;
    if (*v4 & 1) != 0 || (*(unsigned char *)(v1 + 28))
    {
      int v25 = sub_1000079A4();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        uint64_t v26 = *(void *)(v1 + 8);
        int v27 = *(_DWORD *)v1;
        buf.f_bsize = 136315906;
        *(void *)&buf.f_iosize = "create_dls_callback";
        WORD2(buf.f_blocks) = 2080;
        *(uint64_t *)((char *)&buf.f_blocks + 6) = v7 + 256;
        HIWORD(buf.f_bfree) = 2080;
        buf.f_bavail = v26;
        LOWORD(buf.f_files) = 1024;
        *(_DWORD *)((char *)&buf.f_files + 2) = v27;
        _os_log_error_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "%s: Use fallback log directory for read only root fs [%s] for mount[%s] dev[%d] ", (uint8_t *)&buf, 0x26u);
      }
    }
    else
    {
      if (fstatfs(v21, &v58)
        || v58.f_fsid.val[0] != *(_DWORD *)v1
        || v58.f_fsid.val[0] == dword_1000206F0 && (*v4 & 1) == 0)
      {
        __int32 v22 = sub_1000079A4();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          uint64_t v50 = *(void *)(v1 + 8);
          int v51 = *(_DWORD *)v1;
          buf.f_bsize = 136315906;
          *(void *)&buf.f_iosize = "create_dls_callback";
          WORD2(buf.f_blocks) = 2080;
          *(uint64_t *)((char *)&buf.f_blocks + 6) = v7 + 256;
          HIWORD(buf.f_bfree) = 2080;
          buf.f_bavail = v50;
          LOWORD(buf.f_files) = 1024;
          *(_DWORD *)((char *)&buf.f_files + 2) = v51;
          _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%s: Could not open logging directory <5> [%s] for mount[%s] dev[%d] ", (uint8_t *)&buf, 0x26u);
        }
        close(v11);
        rmdir((const char *)(v7 + 256));
        goto LABEL_60;
      }
LABEL_54:
      __s1[0] = 0;
      fstatfs(v11, &v58);
      fcntl(v11, 50, __s1);
      if (v58.f_fsid.val[0] != *(_DWORD *)v1 || strcmp(__s1, (const char *)(v7 + 256)))
      {
        int v23 = sub_1000079A4();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
          sub_100014C30((uint64_t)__s1, v7 + 256);
        }
        unlink((const char *)(v7 + 256));
        goto LABEL_59;
      }
    }
  }
  BOOL v32 = (int *)(v7 + 32);
  unsigned int v33 = (void **)(v7 + 40);
  if (sub_10000F71C(v11, (_DWORD *)(v7 + 32), (_DWORD *)(v7 + 36), (void *)(v7 + 40), (unsigned int (*)(char *))sub_10000F8E4, &v54, &v53))
  {
    uint64_t v34 = sub_1000079A4();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
      sub_100014BC8();
    }
    goto LABEL_60;
  }
  *(_DWORD *)(v7 + 248) = 65537;
  sub_10000F948(v7 + 2304);
  size_t v35 = *(unsigned int *)(v7 + 32);
  if ((int)v35 < 2) {
    goto LABEL_90;
  }
  qsort(*v33, v35, 8uLL, (int (__cdecl *)(const void *, const void *))sub_10000F9D4);
  if (!((v53 - v54) >> 31)) {
    goto LABEL_90;
  }
  if (*v32 < 1)
  {
    LODWORD(v36) = 0;
  }
  else
  {
    uint64_t v36 = 0;
    __darwin_time_t v37 = 0;
    while (1)
    {
      snprintf(__s1, 0x400uLL, "%s/%.16llx", (const char *)(v7 + 256), *((void *)*v33 + v36));
      if (lstat(__s1, &v52)) {
        break;
      }
      if (v52.st_size)
      {
        __darwin_time_t tv_sec = v52.st_ctimespec.tv_sec;
        if (v52.st_ctimespec.tv_sec < v37)
        {
          BOOL v42 = sub_1000079A4();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
          {
            buf.f_bsize = 134218498;
            *(void *)&buf.f_iosize = v52.st_ctimespec.tv_sec;
            WORD2(buf.f_blocks) = 2048;
            *(uint64_t *)((char *)&buf.f_blocks + 6) = v37;
            HIWORD(buf.f_bfree) = 2080;
            buf.f_bavail = v7 + 256;
            _os_log_error_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_ERROR, "Log files out of order (%ld < %ld) in %s.", (uint8_t *)&buf, 0x20u);
          }
          goto LABEL_89;
        }
      }
      else
      {
        __darwin_time_t tv_sec = v37;
      }
      ++v36;
      __darwin_time_t v37 = tv_sec;
      if (v36 >= *v32) {
        goto LABEL_89;
      }
    }
    __int16 v41 = sub_1000079A4();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
      sub_100014B60();
    }
  }
LABEL_89:
  if (v36 != *v32)
  {
    uint64_t v49 = sub_1000079A4();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
      sub_100014AF8();
    }
    char v43 = 0;
  }
  else
  {
LABEL_90:
    char v43 = 1;
  }
  if ((*v4 & 0x2000) == 0) {
    sub_10000EE64(v1, v7);
  }
  uint64_t v44 = *v32;
  if ((int)v44 >= 1)
  {
    uint64_t v45 = v44 + 1;
    while (sub_10000F9EC(v7, *(void *)(*(void *)(v7 + 40) + 8 * (v45 - 2)), &v55))
    {
      memset(&buf, 0, 512);
      if (!statfs(*(const char **)(v1 + 8), &buf) && buf.f_fsid.val[0] == *(_DWORD *)v1 && (unint64_t)--v45 > 1) {
        continue;
      }
      goto LABEL_102;
    }
    if (v55 > qword_1000206D0[dword_1000206E0])
    {
      qword_1000206D0[dword_1000206E0 ^ 1] = v55;
      atomic_fetch_xor(&dword_1000206E0, 1u);
    }
  }
LABEL_102:
  *(void *)(v7 + 8) = 0;
  if (sub_1000102A4(v1, v7))
  {
    if ((*v4 & 1) == 0 || strcmp((const char *)(v7 + 256), "/tmp"))
    {
      int v46 = sub_1000079A4();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
        sub_100014A90();
      }
    }
    goto LABEL_108;
  }
  if ((v43 & 1) == 0)
  {
LABEL_108:
    sub_10000F370(v7, 1);
    sub_10000F56C(v1, v7);
  }
  *(void *)(v1 + 128) = v7;
  if (*(_DWORD *)(v1 + 32))
  {
    qword_100020748 = v7;
    uint64_t v47 = v7;
  }
  else
  {
    uint64_t v47 = qword_100020748;
    if (!qword_100020748) {
      return 0;
    }
  }
  uint64_t v48 = *(void *)(v47 + 16);
  if (v48) {
    *(void *)(v7 + 16) = v48;
  }
  return 0;
}

uint64_t sub_10000DB0C()
{
  pthread_setname_np("com.apple.fseventsd.volume");
  qword_1000206F8 = (uint64_t)CFRunLoopGetCurrent();
  setiopolicy_np(0, 1, 2);
  CFFileDescriptorNativeDescriptor v0 = sub_100011BF0();
  if (v0 < 0)
  {
    uint64_t v1 = sub_1000079A4();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
      sub_100014EA8();
    }
  }
  uint64_t v2 = CFFileDescriptorCreate(0, v0, 1u, (CFFileDescriptorCallBack)sub_100011C68, 0);
  if (v2)
  {
    int v3 = v2;
    RunLoopSource = CFFileDescriptorCreateRunLoopSource(0, v2, 0);
    if (RunLoopSource)
    {
      long long v5 = RunLoopSource;
      CFRunLoopAddSource((CFRunLoopRef)qword_1000206F8, RunLoopSource, kCFRunLoopDefaultMode);
      CFRelease(v5);
      CFFileDescriptorEnableCallBacks(v3, 1uLL);
    }
    else
    {
      int v14 = sub_1000079A4();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_100014E30(v14, v15, v16, v17, v18, v19, v20, v21);
      }
      CFFileDescriptorInvalidate(v3);
      CFRelease(v3);
    }
  }
  else
  {
    int v6 = sub_1000079A4();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100014DB8(v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  CFRunLoopRun();
  return 0;
}

uint64_t sub_10000DC50()
{
  if (qword_1000206F8) {
    CFRunLoopStop((CFRunLoopRef)qword_1000206F8);
  }
  CFFileDescriptorNativeDescriptor v0 = (_opaque_pthread_t *)qword_100020280;

  return pthread_join(v0, 0);
}

uint64_t sub_10000DC94(int a1, int a2)
{
  pthread_mutex_lock(&stru_100020140);
  for (uint64_t i = 0; i != 4096; i += 8)
  {
    uint64_t v5 = *(void *)((char *)xmmword_100020758 + i);
    if (v5 && *(_DWORD *)(v5 + 112) == a1)
    {
      if (a2 == 1)
      {
        int v6 = 8;
      }
      else
      {
        if (a2 != 2)
        {
LABEL_9:
          sub_10000BA68(v5);
          continue;
        }
        int v6 = 16;
      }
      *(_DWORD *)(v5 + 188) |= v6;
      goto LABEL_9;
    }
  }

  return pthread_mutex_unlock(&stru_100020140);
}

uint64_t sub_10000DD3C()
{
  uint64_t v0 = 0;
  atomic_fetch_add(&dword_10002071C, 1u);
  do
  {
    uint64_t result = xmmword_100020758[v0];
    if (result && (*(_DWORD *)(result + 188) & 2) == 0 && (*(_DWORD *)(result + 188) & 0x20) != 0) {
      uint64_t result = sub_10000BA68(result);
    }
    ++v0;
  }
  while (v0 != 512);
  atomic_fetch_add(&dword_10002071C, 0xFFFFFFFF);
  return result;
}

uint64_t sub_10000DDAC(uint64_t a1)
{
  pthread_rwlock_wrlock((pthread_rwlock_t *)a1);
  unsigned int v2 = 0;
  uint64_t v3 = *(void *)(a1 + 200);
  do
  {
    int v4 = *(uint64_t ***)(v3 + 8 * v2);
    if (v4)
    {
      do
      {
        uint64_t v5 = *v4;
        size_t v6 = strlen((const char *)v4[5]);
        sub_100008900((const char *)v4[5], v6 + 1);
        v4[5] = 0;
        int v4 = (uint64_t **)v5;
      }
      while (v5);
      uint64_t v3 = *(void *)(a1 + 200);
    }
    *(void *)(v3 + 8 * v2++) = 0;
  }
  while (v2 <= *(_DWORD *)(a1 + 208));
  *(void *)(a1 + 216) = 0;
  *(_DWORD *)(a1 + 244) = 0;

  return pthread_rwlock_unlock((pthread_rwlock_t *)a1);
}

void *sub_10000DE50(int a1, int a2)
{
  if (a1 < 1)
  {
    uint64_t v7 = 0;
  }
  else
  {
    int v3 = a1;
    int v4 = 0;
    size_t v5 = a2;
    while (1)
    {
      size_t v6 = malloc_type_malloc(0x28uLL, 0x10300407BD0FDCAuLL);
      if (!v6) {
        break;
      }
      uint64_t v7 = v6;
      *(_DWORD *)size_t v6 = a2;
      *(void *)((char *)v6 + 12) = 0;
      *(void *)((char *)v6 + 4) = 0;
      uint64_t v8 = malloc_type_malloc(v5, 0x6F4A520EuLL);
      v7[3] = v8;
      if (!v8)
      {
        free(v7);
        break;
      }
      v7[4] = v4;
      int v4 = v7;
      if (!--v3) {
        goto LABEL_10;
      }
    }
    uint64_t v7 = v4;
  }
LABEL_10:
  __dmb(0xBu);
  return v7;
}

uint64_t sub_10000DF4C(uint64_t a1)
{
  *(_DWORD *)(a1 + 32) |= 2u;
  return 0;
}

uint64_t sub_10000DF60(uint64_t result)
{
  if (*(void *)(result + 8))
  {
    uint64_t v1 = result;
    if ((*(_DWORD *)(result + 32) & 0x10) == 0)
    {
      unint64_t add_explicit = atomic_fetch_add_explicit(&qword_1000206D0[dword_1000206E0], 1uLL, memory_order_relaxed);
      uint64_t v3 = add_explicit + 1;
      if (add_explicit == -2)
      {
        sub_100005318((uint64_t (*)(void))sub_10000DF4C);
        uint64_t v3 = atomic_fetch_add_explicit(&qword_1000206D0[dword_1000206E0], 1uLL, memory_order_relaxed) + 1;
      }
      if ((*(_DWORD *)(v1 + 32) & 4) != 0) {
        int v4 = 0x2000000;
      }
      else {
        int v4 = 0x4000000;
      }
      size_t v5 = strlen(*(const char **)(v1 + 16));
      uint64_t result = sub_10000958C((uint64_t)&qword_100021830, -1, *(_DWORD *)v1, *(char **)(v1 + 16), (int)v5 + 1, v5 + 1, v4, v3, 0, 0);
      if ((*(_DWORD *)(v1 + 32) & 4) == 0) {
        *(_DWORD *)(v1 + 32) |= 0x10u;
      }
      *(_DWORD *)(v1 + 32) &= ~0x20u;
    }
  }
  return result;
}

uint64_t sub_10000E070()
{
  pthread_mutex_lock(&stru_1000201C0);
  pthread_cond_signal(&stru_100020200);

  return pthread_mutex_unlock(&stru_1000201C0);
}

uint64_t sub_10000E0BC()
{
  dword_1000206C8 = 1;
  __dmb(0xBu);
  uint64_t result = dword_100020048;
  if ((dword_100020048 & 0x80000000) == 0)
  {
    dword_100020048 = -1;
    return close(result);
  }
  return result;
}

__CFDictionary *sub_10000E0E8()
{
  pthread_mutex_lock(&stru_100020140);
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (!Mutable)
  {
    BOOL v32 = sub_1000079A4();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
      sub_1000156AC(v32, v33, v34, v35, v36, v37, v38, v39);
    }
LABEL_47:
    int v40 = 0;
    goto LABEL_48;
  }
  CFMutableDictionaryRef v1 = Mutable;
  unsigned int v2 = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (!v2)
  {
    __int16 v41 = sub_1000079A4();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
      sub_1000156AC(v41, v42, v43, v44, v45, v46, v47, v48);
    }
LABEL_46:
    CFRelease(v1);
    goto LABEL_47;
  }
  uint64_t v3 = v2;
  sub_10000E83C(v2, @"proc_name", "%s", "fseventsd");
  sub_10000E83C(v3, @"num_clients", "%d", (void *)dword_100020720);
  sub_10000E83C(v3, @"curr_event_id", "%llu", (void *)qword_1000206D0[dword_1000206E0]);
  sub_10000E83C(v3, @"string_table_count", "%u", (void *)dword_100021850);
  theDict = v1;
  CFDictionaryAddValue(v1, @"global_state", v3);
  CFRelease(v3);
  theArray = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
  int v4 = dword_100020720;
  if (dword_100020720 >= 1)
  {
    uint64_t v5 = 0;
    int v6 = 0;
    uint64_t v7 = "%s";
    do
    {
      uint64_t v8 = xmmword_100020758[v5];
      if (v8)
      {
        CFMutableDictionaryRef v9 = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
        if (!v9)
        {
          uint64_t v49 = sub_1000079A4();
          CFMutableDictionaryRef v1 = theDict;
          if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
            sub_1000156AC(v49, v50, v51, v52, v53, v54, v55, v56);
          }
          goto LABEL_46;
        }
        uint64_t v10 = v9;
        uint64_t v11 = sub_1000023D4();
        sub_10000E83C(v10, @"client_name", v7, v11);
        sub_10000E83C(v10, @"client_pid", "%d", (void *)*(int *)(v8 + 248));
        sub_10000E83C(v10, @"client_uid", "%d", (void *)*(unsigned int *)(v8 + 252));
        sub_10000E83C(v10, @"client_gid", "%d", (void *)*(unsigned int *)(v8 + 256));
        sub_10000E83C(v10, @"dev_to_watch", "%d", (void *)*(int *)(v8 + 112));
        uint64_t v12 = *(void **)(v8 + 120);
        if (v12) {
          sub_10000E83C(v10, @"working_dir", v7, v12);
        }
        int v60 = v6;
        sub_10000E83C(v10, @"last_update", "%llu", *(void **)(v8 + 144));
        sub_10000E83C(v10, @"dropped_id", "%llu", *(void **)(v8 + 152));
        sub_10000E83C(v10, @"last_id", "%llu", *(void **)(v8 + 160));
        sub_10000E83C(v10, @"last_history_id", "%llu", *(void **)(v8 + 168));
        sub_10000E83C(v10, @"update_interval", "%llu", *(void **)(v8 + 176));
        sub_10000E83C(v10, @"num_errors", "%d", (void *)*(int *)(v8 + 184));
        sub_10000E83C(v10, @"client_flags", "%d", (void *)*(int *)(v8 + 188));
        sub_10000E83C(v10, @"max_events", "%d", (void *)*(int *)(v8 + 224));
        sub_10000E83C(v10, @"num_paths", "%d", (void *)*(int *)(v8 + 128));
        sub_10000E83C(v10, @"start_id", "%llu", *(void **)(v8 + 232));
        sub_10000E83C(v10, @"vfs_authorized_access", "%d", (void *)*(unsigned int *)(v8 + 292));
        sub_10000E83C(v10, @"num_events", "%llu", *(void **)(v8 + 304));
        sub_10000E83C(v10, @"allocated_bytes", "%llu", *(void **)(v8 + 296));
        sub_10000E83C(v10, @"client_thread", "%d", (void *)*(unsigned int *)(v8 + 320));
        sub_10000E83C(v10, @"client_index", "%d", (void *)*(int *)(v8 + 192));
        double v69 = (double)*(int *)(v8 + 328) / 1000000.0 + (double)*(int *)(v8 + 324);
        sub_10000E83C(v10, @"user_time", "%f", &v69);
        double v69 = (double)*(int *)(v8 + 336) / 1000000.0 + (double)*(int *)(v8 + 332);
        sub_10000E83C(v10, @"system_time", "%f", &v69);
        uint64_t v13 = *(void **)(v8 + 344);
        if (v13) {
          sub_10000E83C(v10, @"pw_name", v7, v13);
        }
        int v14 = v7;
        CFIndex v15 = *(unsigned int *)(v8 + 128);
        if ((int)v15 >= 1)
        {
          CFMutableArrayRef v16 = CFArrayCreateMutable(kCFAllocatorDefault, v15, &kCFTypeArrayCallBacks);
          if (v16)
          {
            uint64_t v17 = v16;
            if (*(int *)(v8 + 128) >= 1)
            {
              uint64_t v18 = 0;
              do
              {
                CFStringRef v19 = CFStringCreateWithCString(kCFAllocatorDefault, *(const char **)(*(void *)(v8 + 136) + 8 * v18), 0x8000100u);
                if (v19)
                {
                  CFStringRef v20 = v19;
                  CFArrayAppendValue(v17, v19);
                  CFRelease(v20);
                }
                else
                {
                  uint64_t v21 = sub_1000079A4();
                  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
                    sub_1000157B4(&v67, v68);
                  }
                }
                ++v18;
              }
              while (v18 < *(int *)(v8 + 128));
            }
            CFDictionaryAddValue(v10, @"path_table", v17);
            CFRelease(v17);
          }
          else
          {
            __int32 v22 = sub_1000079A4();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
              sub_100015784(&v65, v66);
            }
          }
        }
        CFMutableArrayRef v23 = CFArrayCreateMutable(kCFAllocatorDefault, 8, &kCFTypeArrayCallBacks);
        if (v23)
        {
          int v24 = v23;
          uint64_t v25 = 0;
          uint64_t v26 = v8 + 352;
          do
          {
            int v27 = *(const char **)(v26 + v25);
            if (!v27) {
              break;
            }
            CFStringRef v28 = CFStringCreateWithCString(kCFAllocatorDefault, v27, 0x8000100u);
            if (v28)
            {
              CFStringRef v29 = v28;
              CFArrayAppendValue(v24, v28);
              CFRelease(v29);
            }
            else
            {
              uint64_t v30 = sub_1000079A4();
              if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
                sub_100015754(&v63, v64);
              }
            }
            v25 += 8;
          }
          while (v25 != 64);
          if (CFArrayGetCount(v24) >= 1) {
            CFDictionaryAddValue(v10, @"exclusion_paths", v24);
          }
          CFRelease(v24);
        }
        else
        {
          int v31 = sub_1000079A4();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
            sub_100015724(&v61, v62);
          }
        }
        int v6 = v60 + 1;
        CFArrayAppendValue(theArray, v10);
        CFRelease(v10);
        int v4 = dword_100020720;
        uint64_t v7 = v14;
      }
      ++v5;
    }
    while (v6 < v4);
  }
  int v40 = theDict;
  CFDictionaryAddValue(theDict, @"clients", theArray);
  CFRelease(theArray);
LABEL_48:
  pthread_mutex_unlock(&stru_100020140);
  return v40;
}

double sub_10000E83C(__CFDictionary *a1, const __CFString *a2, char *__s1, void *a4)
{
  if (!strcmp(__s1, "%llu"))
  {
    if (!a4) {
      return result;
    }
    CFStringRef v9 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"%llu", a4);
  }
  else if (!strcmp(__s1, "%s"))
  {
    CFStringRef v9 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"%s", a4);
  }
  else if (!strcmp(__s1, "%f"))
  {
    double result = *(double *)a4;
    if (*(double *)a4 == 0.0) {
      return result;
    }
    CFStringRef v9 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"%f", *a4);
  }
  else if (!strcmp(__s1, "%u"))
  {
    if (!a4) {
      return result;
    }
    CFStringRef v9 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"%u", a4);
  }
  else
  {
    if (!a4) {
      return result;
    }
    CFStringRef v9 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"%d", a4);
  }
  CFStringRef v10 = v9;
  if (v9)
  {
    CFDictionaryAddValue(a1, a2, v9);
    CFRelease(v10);
  }
  else
  {
    uint64_t v11 = sub_1000079A4();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1000157E4(a2, v11);
    }
  }
  return result;
}

uint64_t sub_10000E9D4(uint64_t result)
{
  if (result == 30)
  {
    pthread_mutex_lock(&stru_100020140);
    CFMutableDictionaryRef v1 = sub_1000079A4();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
      sub_10001586C();
    }
    uint64_t v2 = 0;
    while (1)
    {
      uint64_t v3 = xmmword_100020758[v2];
      if (v3) {
        break;
      }
LABEL_22:
      if (++v2 == 512) {
        return pthread_mutex_unlock(&stru_100020140);
      }
    }
    uint64_t v4 = *(void *)(v3 + 232);
    uint64_t v5 = sub_1000079A4();
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);
    if (v4 == -1)
    {
      if (v6)
      {
        CFStringRef v29 = sub_1000023D4();
        int v30 = *(_DWORD *)(v3 + 248);
        int v31 = *(_DWORD *)(v3 + 188);
        int v32 = *(_DWORD *)(v3 + 128);
        *(_DWORD *)statfs buf = 136315906;
        *(void *)uint64_t v34 = v29;
        *(_WORD *)&v34[8] = 1024;
        *(_DWORD *)&v34[10] = v30;
        *(_WORD *)&v34[14] = 1024;
        *(_DWORD *)&v34[16] = v31;
        LOWORD(v35) = 1024;
        *(_DWORD *)((char *)&v35 + 2) = v32;
        uint64_t v13 = v5;
        int v14 = "\t%s pid %d, flags 0x%x, #paths %d, sinceWhen: Now\n";
        uint32_t v15 = 30;
        goto LABEL_25;
      }
    }
    else if (v6)
    {
      uint64_t v7 = sub_1000023D4();
      int v8 = *(_DWORD *)(v3 + 248);
      int v9 = *(_DWORD *)(v3 + 188);
      int v10 = *(_DWORD *)(v3 + 128);
      uint64_t v11 = *(void *)(v3 + 232);
      uint64_t v12 = qword_1000206D0[dword_1000206E0] - v11;
      *(_DWORD *)statfs buf = 136316418;
      *(void *)uint64_t v34 = v7;
      *(_WORD *)&v34[8] = 1024;
      *(_DWORD *)&v34[10] = v8;
      *(_WORD *)&v34[14] = 1024;
      *(_DWORD *)&v34[16] = v9;
      LOWORD(v35) = 1024;
      *(_DWORD *)((char *)&v35 + 2) = v10;
      HIWORD(v35) = 2048;
      *(void *)uint64_t v36 = v11;
      *(_WORD *)&v36[8] = 2048;
      uint64_t v37 = v12;
      uint64_t v13 = v5;
      int v14 = "\t%s pid %d, flags 0x%x, #paths %d, sinceWhen: 0x%llx [delta: %llu]\n";
      uint32_t v15 = 50;
LABEL_25:
      _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, v14, buf, v15);
    }
    CFMutableArrayRef v16 = sub_1000079A4();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      uint64_t v25 = *(void *)(v3 + 296);
      uint64_t v24 = *(void *)(v3 + 304);
      double v26 = (double)*(int *)(v3 + 328) / 1000000.0 + (double)*(int *)(v3 + 324);
      double v27 = (double)*(int *)(v3 + 332);
      double v28 = (double)*(int *)(v3 + 336) / 1000000.0;
      *(_DWORD *)statfs buf = 134218752;
      *(void *)uint64_t v34 = v24;
      *(_WORD *)&v34[8] = 2048;
      *(void *)&v34[10] = v25;
      *(_WORD *)&v34[18] = 2048;
      double v35 = v26;
      *(_WORD *)uint64_t v36 = 2048;
      *(double *)&v36[2] = v28 + v27;
      _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "\t\tnum_events[%llu] allocated_bytes[%llu] user_time[%.2f] system_time[%.2f]\n", buf, 0x2Au);
    }
    if (*(int *)(v3 + 128) >= 1)
    {
      uint64_t v17 = 0;
      do
      {
        uint64_t v18 = sub_1000079A4();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          uint64_t v19 = *(void *)(*(void *)(v3 + 136) + 8 * v17);
          *(_DWORD *)statfs buf = 67109378;
          *(_DWORD *)uint64_t v34 = v17;
          *(_WORD *)&v34[4] = 2080;
          *(void *)&v34[6] = v19;
          _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "\t\t%d: %s\n", buf, 0x12u);
        }
        ++v17;
      }
      while (v17 < *(int *)(v3 + 128));
    }
    uint64_t v20 = 0;
    uint64_t v21 = v3 + 352;
    do
    {
      if (!*(void *)(v21 + v20)) {
        break;
      }
      __int32 v22 = sub_1000079A4();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        uint64_t v23 = *(void *)(v21 + v20);
        *(_DWORD *)statfs buf = 136315138;
        *(void *)uint64_t v34 = v23;
        _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "\t\tExcluded %s\n", buf, 0xCu);
      }
      v20 += 8;
    }
    while (v20 != 64);
    goto LABEL_22;
  }
  return result;
}

uint64_t sub_10000ED88(uint64_t a1)
{
  snprintf(__str, 0x400uLL, "%s/.ramdisk-boot-done", (const char *)(a1 + 256));
  int v1 = open(__str, 0x20000000);
  if (v1 < 1) {
    return 0;
  }
  int v2 = v1;
  if (unlink(__str))
  {
    uint64_t v3 = sub_1000079A4();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_100015918();
    }
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v4 = 1;
  }
  close(v2);
  return v4;
}

void sub_10000EE64(uint64_t a1, uint64_t a2)
{
  memset(&v16, 0, sizeof(v16));
  uint64_t v15 = 0;
  if (!sub_10000ED88(a2))
  {
    snprintf(__str, 0x400uLL, "%s/fseventsd-uuid", (const char *)(a2 + 256));
    int v5 = open(__str, 0x20000000);
    if (v5 < 0) {
      return;
    }
    int v6 = v5;
    if (fstat(v5, &v16) || (v16.st_mode & 0xF000) != 0x8000)
    {
      int v10 = sub_1000079A4();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_100015B60();
      }
    }
    else
    {
      __darwin_time_t tv_sec = v16.st_ctimespec.tv_sec;
      time_t v8 = time(0);
      if (fsctl(__str, 0x40046812uLL, &v15, 0))
      {
        int v9 = sub_1000079A4();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          sub_100015AD0();
        }
LABEL_17:
        *(_DWORD *)(a1 + 32) |= 0x200u;
        close(v6);
LABEL_18:
        sub_10000F370(a2, 1);
        sub_10000F56C(a1, a2);
        return;
      }
      if (fsctl(__str, 0x40046813uLL, (char *)&v15 + 4, 0))
      {
        uint64_t v11 = sub_1000079A4();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          sub_100015A40(v11);
        }
        goto LABEL_17;
      }
      if (HIDWORD(v15) > tv_sec && HIDWORD(v15) - tv_sec > 119 || v8 - v15 >= 120 && v8 - tv_sec > 5)
      {
        close(v6);
        memset(v30, 0, sizeof(v30));
        sub_10000C430((const char *)(a2 + 256), v30);
        memset(&buf, 0, 512);
        if (statfs((const char *)(a2 + 256), &buf)) {
          uint64_t f_flags = 0;
        }
        else {
          uint64_t f_flags = buf.f_flags;
        }
        uint64_t v13 = sub_1000079A4();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)uint64_t v17 = 136316418;
          uint64_t v18 = a2 + 256;
          __int16 v19 = 2080;
          uint64_t v20 = v30;
          __int16 v21 = 2048;
          uint64_t v22 = f_flags;
          __int16 v23 = 2048;
          __darwin_time_t v24 = HIDWORD(v15) - tv_sec;
          __int16 v25 = 2048;
          time_t v26 = v8 - v15;
          __int16 v27 = 2048;
          time_t v28 = v8 - tv_sec;
          _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "event logs in %s with volume UUID [%s] and f_flags[0x%llx] out of sync with volume.  destroying old logs. (%ld %ld %ld)", v17, 0x3Eu);
        }
        analytics_send_event_lazy();
        int v14 = sub_1000079A4();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          sub_1000159B8();
        }
        goto LABEL_18;
      }
    }
    close(v6);
    return;
  }
  uint64_t v4 = sub_1000079A4();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    buf.f_bsize = 136315138;
    *(void *)&buf.f_iosize = "check_vol_last_mod_time";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s: ram disk boot detected", (uint8_t *)&buf, 0xCu);
  }
}

xpc_object_t sub_10000F274(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v2, "statfs_f_flags", *(void *)(a1 + 32));
  xpc_dictionary_set_int64(v2, "is_mnt_removable", *(void *)(a1 + 40));
  xpc_dictionary_set_int64(v2, "last_mount_time", *(unsigned int *)(a1 + 64));
  xpc_dictionary_set_int64(v2, "last_event_time", *(void *)(a1 + 48));
  xpc_dictionary_set_int64(v2, "current_time", *(void *)(a1 + 56));
  xpc_dictionary_set_int64(v2, "mount_time", *(unsigned int *)(a1 + 68));
  xpc_dictionary_set_int64(v2, "last_mount_diff", *(unsigned int *)(a1 + 64) - *(void *)(a1 + 48));
  xpc_dictionary_set_int64(v2, "current_mount_diff", *(void *)(a1 + 56) - *(unsigned int *)(a1 + 68));
  xpc_dictionary_set_int64(v2, "last_event_diff", *(void *)(a1 + 56) - *(void *)(a1 + 48));
  return v2;
}

void sub_10000F370(uint64_t a1, int a2)
{
  uint64_t v4 = (const char *)(a1 + 256);
  uint64_t v5 = __strlcpy_chk();
  v17[v5] = 47;
  int v6 = (int *)(a1 + 32);
  if (*(int *)(a1 + 32) >= 1)
  {
    uint64_t v7 = 0;
    time_t v8 = &v17[v5 + 1];
    size_t v9 = 1023 - v5;
    do
    {
      snprintf(v8, v9, "%.16llx", *(void *)(*(void *)(a1 + 40) + 8 * v7));
      if (unlink(v17) && (*__error() != 30 || strcmp(v4, "/.fseventsd")))
      {
        int v10 = sub_1000079A4();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          uint64_t v11 = __error();
          uint64_t v12 = strerror(*v11);
          *(_DWORD *)statfs buf = 136315394;
          int v14 = v17;
          __int16 v15 = 2080;
          stat v16 = v12;
          _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "failed to unlink old log file %s (%s)", buf, 0x16u);
        }
      }
      ++v7;
    }
    while (v7 < *v6);
  }
  if (a2)
  {
    pthread_rwlock_wrlock((pthread_rwlock_t *)(a1 + 48));
    free(*(void **)(a1 + 40));
    *(void *)int v6 = 0;
    *(void *)(a1 + 40) = 0;
    ++*(_WORD *)(a1 + 248);
    *(_WORD *)(a1 + 250) = 1;
    pthread_rwlock_unlock((pthread_rwlock_t *)(a1 + 48));
  }
  else
  {
    free(*(void **)(a1 + 40));
    *(void *)int v6 = 0;
    *(void *)(a1 + 40) = 0;
    ++*(_WORD *)(a1 + 248);
    *(_WORD *)(a1 + 250) = 1;
  }
}

void sub_10000F56C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (const unsigned __int8 *)(a1 + 48);
  uuid_generate((unsigned __int8 *)(a1 + 48));
  uuid_unparse(v4, (char *)(a1 + 64));
  uint64_t v5 = (const char *)(a2 + 256);
  snprintf(__str, 0x400uLL, "%s/fseventsd-uuid", (const char *)(a2 + 256));
  unlink(__str);
  int v6 = open_dprotected_np(__str, 536872450, 4, 0, 384);
  if (v6 < 0)
  {
    if ((*(_DWORD *)(a1 + 32) & 1) == 0 || *__error() != 30)
    {
      uint64_t v11 = sub_1000079A4();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_100015CC0();
      }
    }
  }
  else
  {
    int v7 = v6;
    size_t v8 = strlen((const char *)(a1 + 64));
    ssize_t v9 = write(v7, (const void *)(a1 + 64), v8);
    if (v9 == strlen((const char *)(a1 + 64)))
    {
      if ((*(_DWORD *)(a1 + 32) & 1) == 0 || strcmp(v5, "/tmp"))
      {
        int v10 = sub_1000079A4();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
          sub_100015BE4((uint64_t)v5);
        }
      }
    }
    else
    {
      unlink(__str);
      uint64_t v12 = sub_1000079A4();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_100015C58();
      }
    }
    close(v7);
  }
}

uint64_t sub_10000F71C(int a1, _DWORD *a2, _DWORD *a3, void *a4, unsigned int (*a5)(char *), unint64_t *a6, unint64_t *a7)
{
  *a3 = 0;
  *a2 = 0;
  *a4 = 0;
  *a7 = 0;
  *a6 = 0;
  int v14 = fdopendir(a1);
  if (!v14)
  {
    close(a1);
    return *__error();
  }
  __int16 v15 = v14;
  int v30 = a2;
  int v31 = a3;
  int v32 = a4;
  uint64_t v33 = a6;
  uint64_t v34 = a7;
  uint64_t v16 = 0;
  unint64_t v17 = 0;
  int v18 = 0;
  __int16 v19 = 0;
  unint64_t v20 = -1;
  while (1)
  {
    do
    {
      __int16 v21 = readdir(v15);
      if (!v21)
      {
        _DWORD *v30 = v16;
        *int v31 = v18;
        void *v32 = v19;
        *uint64_t v33 = v20;
        *uint64_t v34 = v17;
        closedir(v15);
        return 0;
      }
      uint64_t v22 = v21;
    }
    while (a5 && !a5(v21->d_name));
    if (v16 < v18)
    {
      int v23 = v18;
      __darwin_time_t v24 = v19;
      goto LABEL_11;
    }
    int v23 = v18 + 100;
    __int16 v25 = malloc_type_calloc(v18 + 100, 8uLL, 0x100004000313F17uLL);
    if (!v25) {
      break;
    }
    __darwin_time_t v24 = v25;
    if (v19)
    {
      memcpy(v25, v19, 8 * v18);
      free(v19);
    }
LABEL_11:
    unint64_t v26 = strtoull(v22->d_name, 0, 16);
    v24[v16] = v26;
    if (v26 <= v17) {
      unint64_t v27 = v17;
    }
    else {
      unint64_t v27 = v26;
    }
    if (v26 >= v20) {
      unint64_t v28 = v20;
    }
    else {
      unint64_t v28 = v26;
    }
    if (v26 < v20) {
      unint64_t v27 = v17;
    }
    if (v26 + 1 > 1)
    {
      unint64_t v17 = v27;
      unint64_t v20 = v28;
      ++v16;
    }
    int v18 = v23;
    __int16 v19 = v24;
  }
  if (v19) {
    free(v19);
  }
  closedir(v15);
  return 12;
}

BOOL sub_10000F8E4(unsigned char *a1)
{
  BOOL v1 = *a1 == 0;
  if ((char)*a1 >= 1)
  {
    if ((_DefaultRuneLocale.__runetype[*a1] & 0x10000) != 0)
    {
      xpc_object_t v2 = a1 + 1;
      do
      {
        int v3 = *v2++;
        uint64_t v4 = v3;
      }
      while (v3 >= 1 && (_DefaultRuneLocale.__runetype[v4] & 0x10000) != 0);
      return v4 == 0;
    }
    else
    {
      return 0;
    }
  }
  return v1;
}

void *sub_10000F948(uint64_t a1)
{
  *(void *)(a1 + 240) = 0;
  *(_OWORD *)(a1 + 224) = 0u;
  *(_OWORD *)(a1 + 176) = 0u;
  *(_OWORD *)(a1 + 192) = 0u;
  *(_OWORD *)(a1 + 144) = 0u;
  *(_OWORD *)(a1 + 160) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 208) = 0u;
  xpc_object_t v2 = (_DWORD *)(a1 + 208);
  pthread_rwlock_init((pthread_rwlock_t *)a1, 0);
  *(void *)(a1 + 200) = sub_10001274C(4096, v2);
  double result = malloc_type_malloc(0x1FFE0uLL, 0x10B00407F4A3208uLL);
  *(void *)(a1 + 232) = result;
  *(_DWORD *)(a1 + 240) = 2730;
  return result;
}

uint64_t sub_10000F9D4(void *a1, void *a2)
{
  if (*a1 < *a2) {
    return 0xFFFFFFFFLL;
  }
  else {
    return *a1 > *a2;
  }
}

uint64_t sub_10000F9EC(uint64_t a1, uint64_t a2, void *a3)
{
  memset(&v60, 0, sizeof(v60));
  *a3 = 0;
  snprintf(__str, 0x400uLL, "%s/%.16llx", (const char *)(a1 + 256), a2);
  int v5 = open(__str, 0x20000000);
  if (v5 < 0)
  {
LABEL_91:
    __int16 v41 = sub_1000079A4();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
      sub_100015D28();
    }
    return 22;
  }
  int v6 = v5;
  if (fstat(v5, &v60) || (v60.st_mode & 0xF000) != 0x8000)
  {
    close(v6);
    goto LABEL_91;
  }
  if (!v60.st_size)
  {
    close(v6);
    return 22;
  }
  gzFile v7 = gzdopen(v6, "rb");
  if (!v7)
  {
    uint64_t v44 = sub_1000079A4();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
      sub_100015DAC();
    }
    close(v6);
    return *__error();
  }
  size_t v8 = v7;
  ssize_t v9 = &off_100020000;
  int v10 = (int8x8_t *)malloc_type_zone_malloc((malloc_zone_t *)qword_1000206B8, 0x40000uLL, 0x86324632uLL);
  if (!v10)
  {
    gzclose(v8);
    return 12;
  }
  uint64_t v11 = v10;
  int v12 = gzread(v8, v10, 0x10000u);
  if (v12 < 1)
  {
    uint64_t v16 = 0;
    uint64_t v45 = 0;
    goto LABEL_107;
  }
  uint64_t v13 = 0;
  uint64_t v14 = 0;
  unint64_t v15 = 0;
  uint64_t v16 = 0;
  int v17 = 0;
  int v57 = 0;
  __int32 v58 = 0;
  uint64_t v56 = 0;
  uint64_t v55 = v8;
  do
  {
    if (!v14 && v12 <= 0xB)
    {
      uint64_t v46 = sub_1000079A4();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
        sub_100015E14();
      }
      goto LABEL_103;
    }
    int v18 = v11->i32[0];
    if (v11->i32[0] > 1145852720)
    {
      if ((v18 - 1145852721) >= 3) {
        goto LABEL_25;
      }
      if (v13) {
        goto LABEL_28;
      }
      int v17 = v11[1].i32[0];
    }
    else
    {
      if (v18 != 827542596 && v18 != 844319812 && v18 != 861097028)
      {
LABEL_25:
        int v17 = v11[1].i32[0];
        if (v17 <= 0x40000)
        {
          if (v13) {
            goto LABEL_28;
          }
          goto LABEL_27;
        }
        uint64_t v51 = sub_1000079A4();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
        {
          __int32 v52 = v11->i32[0];
          *(_DWORD *)statfs buf = 67109890;
          *(_DWORD *)int v62 = v52;
          *(_WORD *)&v62[4] = 1024;
          strcpy(&v62[6], "1SLD");
          v62[11] = 8;
          *(void *)&v62[12] = v56;
          *(_WORD *)&v62[20] = 2080;
          *(void *)&v62[22] = __str;
          _os_log_error_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_ERROR, "get_last_event_id: magic is wrong (0x%.8x != 0x%.8x; cur_pos %lld) in file %s",
            buf,
            0x22u);
        }
LABEL_103:
        uint64_t v47 = v8;
LABEL_104:
        gzclose(v47);
        malloc_zone_free((malloc_zone_t *)qword_1000206B8, v11);
        return 22;
      }
      if (v13) {
        goto LABEL_28;
      }
      int v17 = bswap32(v11[1].u32[0]);
    }
LABEL_27:
    __int32 v58 = v11->i32[1];
    v11->i32[1] = 0;
LABEL_28:
    v13 += v12;
    int v59 = v17;
    if (v13 < v17)
    {
      v14 += v12;
      goto LABEL_85;
    }
    unsigned int v21 = sub_10000B9FC(v11, v17);
    unsigned int v22 = v21;
    if (v18 == 827542596 || v18 == 861097028 || v18 == 844319812) {
      unsigned int v22 = bswap32(v21);
    }
    uint64_t v16 = (char *)&v11[1] + 4;
    if (v58 != v22)
    {
      int v23 = sub_1000127D8(v11, v59);
      if (v58 != v23)
      {
        int v49 = v23;
        uint64_t v50 = sub_1000079A4();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)statfs buf = 67109634;
          *(_DWORD *)int v62 = v58;
          *(_WORD *)&v62[4] = 1024;
          *(_DWORD *)&v62[6] = v49;
          *(_WORD *)&v62[10] = 2080;
          *(void *)&v62[12] = __str;
          _os_log_error_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_ERROR, "get_last_event_id: checksum mis-match: file 0x%.8x, calculated 0x%.8x in file %s", buf, 0x18u);
        }
        uint64_t v47 = v55;
        goto LABEL_104;
      }
    }
    switch(v18)
    {
      case 827542596:
        char v24 = 0;
        break;
      case 861097028:
        char v24 = 3;
        break;
      case 844319812:
        char v24 = 1;
        break;
      default:
        goto LABEL_43;
    }
    sub_100012844(v11, v13, v24);
LABEL_43:
    unint64_t v25 = (unint64_t)v11 + v11[1].i32[0];
    while ((unint64_t)v16 < v25)
    {
      unint64_t v26 = (unint64_t)v16;
      do
      {
        if (!*(unsigned char *)v26) {
          break;
        }
        ++v26;
      }
      while (v26 < v25);
      if (v26 - (unint64_t)v16 - 1024 <= 0xFFFFFFFFFFFFFBFELL)
      {
        CFStringRef v29 = sub_1000079A4();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
          sub_100015E90(v74, &v75, v29);
        }
        break;
      }
      uint64_t v16 = (char *)(v26 + 1);
      if (v26 + 1 >= v25)
      {
        int v30 = sub_1000079A4();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          __int32 v40 = v11[1].i32[0];
          *(_DWORD *)statfs buf = 134218754;
          *(void *)int v62 = v16 - (char *)v11;
          *(_WORD *)&v62[8] = 1024;
          *(_DWORD *)&v62[10] = v40;
          *(_WORD *)&v62[14] = 2080;
          *(void *)&v62[16] = __str;
          *(_WORD *)&v62[24] = 1024;
          *(_DWORD *)&v62[26] = v57;
          _os_log_error_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "get_last_event_id: ptr out-of-bounds (%ld > %d) in file %s (counter %d)", buf, 0x22u);
        }
        int v31 = sub_1000079A4();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)statfs buf = 136315138;
          *(void *)int v62 = v26;
          _os_log_error_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "get_last_event_id: path was: <%s>", buf, 0xCu);
        }
        break;
      }
      if (v26 + 9 > v25)
      {
        int v32 = sub_1000079A4();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
          sub_100015ED8(v72, &v73, v32);
        }
        break;
      }
      if (v15 <= *(void *)(v26 + 1)) {
        unint64_t v15 = *(void *)(v26 + 1);
      }
      uint64_t v16 = (char *)(v26 + 13);
      if (v26 + 13 > v25)
      {
        uint64_t v33 = sub_1000079A4();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
          sub_100015F20(v70, &v71, v33);
        }
        uint64_t v16 = (char *)(v26 + 9);
        break;
      }
      __int32 v27 = v11->i32[0];
      if (v11->i32[0] == 1145852722 || v27 == 844319812)
      {
        unint64_t v28 = v26 + 21;
        if (v28 > v25)
        {
          uint64_t v34 = sub_1000079A4();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
            sub_100015FB0(v68, &v69, v34);
          }
          break;
        }
      }
      else
      {
        unint64_t v28 = v26 + 13;
      }
      if (v27 == 1145852723 || v27 == 861097028)
      {
        uint64_t v16 = (char *)(v28 + 12);
        if (v28 + 12 > v25)
        {
          uint64_t v36 = sub_1000079A4();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
            sub_100015F68(v66, &v67, v36);
          }
          uint64_t v16 = (char *)v28;
          break;
        }
      }
      else
      {
        uint64_t v16 = (char *)v28;
      }
    }
    uint64_t v14 = 0;
    if (v58 == v22)
    {
      __int32 v38 = v11[1].i32[0];
      size_t v8 = v55;
      if (v38)
      {
        uint64_t v14 = 0x40000 - v38;
        __memmove_chk();
      }
    }
    else
    {
      size_t v8 = v55;
    }
    ++v57;
    v56 += v13;
    uint64_t v13 = 0;
LABEL_85:
    if (0x40000 - v14 >= 0x10000) {
      unsigned int v39 = 0x10000;
    }
    else {
      unsigned int v39 = 0x40000 - v14;
    }
    int v12 = gzread(v8, (char *)v11 + v14, v39);
    int v17 = v59;
  }
  while (v12 > 0);
  uint64_t v45 = v11;
  ssize_t v9 = &off_100020000;
  if (v15)
  {
    uint64_t v42 = 0;
    *a3 = v15 + 1;
    goto LABEL_109;
  }
LABEL_107:
  uint64_t v48 = sub_1000079A4();
  if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
  {
    if (v45)
    {
      int v53 = v45[1].i32[0];
      int v54 = v45[1].i32[1];
    }
    else
    {
      int v53 = -123;
      int v54 = -123;
    }
    *(_DWORD *)statfs buf = 134219008;
    *(void *)int v62 = a2;
    *(_WORD *)&v62[8] = 2048;
    *(void *)&v62[10] = v16;
    *(_WORD *)&v62[18] = 2048;
    *(void *)&v62[20] = v11;
    *(_WORD *)&v62[28] = 1024;
    int v63 = v53;
    __int16 v64 = 1024;
    int v65 = v54;
    _os_log_error_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_ERROR, "did not find any event id's in %.16llx (ptr %p buff %p / iptr[2] %d / iptr[3] %d\n", buf, 0x2Cu);
  }
  uint64_t v42 = 22;
LABEL_109:
  malloc_zone_free((malloc_zone_t *)v9[215], v11);
  gzclose(v8);
  return v42;
}

uint64_t sub_1000102A4(uint64_t a1, uint64_t a2)
{
  memset(&v10, 0, sizeof(v10));
  int v3 = (const char *)(a2 + 256);
  snprintf(__str, 0x400uLL, "%s/fseventsd-uuid", (const char *)(a2 + 256));
  int v4 = open(__str, 0x20000000);
  if (v4 < 0)
  {
    if ((*(_DWORD *)(a1 + 32) & 1) == 0 || strcmp(v3, "/tmp"))
    {
      ssize_t v9 = sub_1000079A4();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_100015FF8();
      }
    }
    return 2;
  }
  int v5 = v4;
  if (fstat(v4, &v10) || (v10.st_mode & 0xF000) != 0x8000)
  {
    close(v5);
    return 22;
  }
  int v6 = (unsigned char *)(a1 + 64);
  ssize_t v7 = read(v5, (void *)(a1 + 64), 0x40uLL);
  if (v7 <= 0)
  {
    close(v5);
    unlink(__str);
    unsigned char *v6 = 0;
    return 2;
  }
  if (v7 == 64)
  {
    close(v5);
    unlink(__str);
    unsigned char *v6 = 0;
    return 22;
  }
  *(unsigned char *)(a1 + v7 + 64) = 0;
  close(v5);
  uint64_t result = uuid_parse((const char *)(a1 + 64), (unsigned __int8 *)(a1 + 48));
  if (result)
  {
    unlink(__str);
    return 22;
  }
  return result;
}

void sub_100010438(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 128);
  if (v2)
  {
    if (!*(_DWORD *)(v2 + 28))
    {
      unint64_t v3 = *(void *)(a2 + 40);
      if (v3 > 0x1388 || 100 * v3 / *(void *)(a2 + 8) >= 6)
      {
        int v4 = sub_1000079A4();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
          sub_100016088();
        }
        *(_DWORD *)(v2 + 28) = 1;
      }
    }
  }
}

uint64_t sub_1000104B8(uint64_t a1, uint64_t a2)
{
  int v4 = *(const char **)(a1 + 40);
  size_t v5 = strlen(v4);
  uint64_t v6 = *(unsigned int *)(a2 + 32);
  if (v5 + v6 + 25 >= *(void *)(a2 + 24))
  {
    sub_1000105C4(*(gzFile *)a2, *(void *)(a2 + 8), a2, 0);
    uint64_t v7 = *(void *)(a2 + 16);
    *(void *)(v7 + 4) = 0xC00000000;
    uint64_t v6 = 12;
    *(_DWORD *)(a2 + 32) = 12;
    int v4 = *(const char **)(a1 + 40);
  }
  else
  {
    uint64_t v7 = *(void *)(a2 + 16);
  }
  size_t v8 = v5 + 1;
  memcpy((void *)(v7 + v6), v4, v8);
  unsigned int v9 = *(_DWORD *)(a2 + 32) + v8;
  *(_DWORD *)(a2 + 32) = v9;
  *(void *)(*(void *)(a2 + 16) + v9) = *(void *)(a1 + 16);
  unsigned int v10 = *(_DWORD *)(a2 + 32) + 8;
  *(_DWORD *)(a2 + 32) = v10;
  *(_DWORD *)(*(void *)(a2 + 16) + v10) = *(_DWORD *)(a1 + 36);
  unsigned int v11 = *(_DWORD *)(a2 + 32) + 4;
  *(_DWORD *)(a2 + 32) = v11;
  *(void *)(*(void *)(a2 + 16) + v11) = *(void *)(a1 + 24);
  unsigned int v12 = *(_DWORD *)(a2 + 32) + 8;
  *(_DWORD *)(a2 + 32) = v12;
  *(_DWORD *)(*(void *)(a2 + 16) + v12) = *(_DWORD *)(a1 + 32);
  *(_DWORD *)(a2 + 32) += 4;
  return 0;
}

gzFile sub_1000105C4(gzFile result, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t v7 = (uint64_t)result;
  if (*(_DWORD *)(a2 + 28))
  {
    size_t v8 = 0;
    if (a4) {
      goto LABEL_7;
    }
  }
  else
  {
    sub_10000F370(a2, 1);
    sub_10000F56C(v7, a2);
    *(_DWORD *)(a2 + 252) = 0;
    uint64_t result = sub_1000129F4(v7, a2, 1);
    if (!result) {
      return result;
    }
    size_t v8 = result;
    *(_DWORD *)(a2 + 28) = 1;
    if (a4) {
      goto LABEL_7;
    }
  }
  if (*(_DWORD *)(a3 + 32) < 0xDu) {
    return result;
  }
LABEL_7:
  uint64_t v9 = *(void *)(a3 + 16);
  *(void *)uint64_t v9 = 1145852723;
  *(_DWORD *)(v9 + 8) = *(_DWORD *)(a3 + 32);
  *(_DWORD *)(v9 + 4) = sub_10000B9FC((unsigned char *)v9, *(_DWORD *)(a3 + 32));
  pthread_rwlock_wrlock((pthread_rwlock_t *)(a2 + 48));
  if (v8) {
    goto LABEL_10;
  }
  gzFile v10 = sub_1000129F4(v7, a2, 0);
  if (v10)
  {
    size_t v8 = v10;
    *(_DWORD *)(a2 + 28) = 1;
LABEL_10:
    uint64_t v11 = gzwrite(v8, *(voidpc *)(a3 + 16), *(_DWORD *)(a3 + 32));
    if (gzflush(v8, 2))
    {
      unsigned int v12 = sub_1000079A4();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_1000162B4();
      }
    }
    if (v11 == *(_DWORD *)(a3 + 32))
    {
      uint64_t v13 = *(void *)a2 + *(void *)(a3 + 24);
      *(void *)a2 = v13;
      int v14 = gzclose(v8);
      if (a4 || v13 >= 0x400000)
      {
        if (v14)
        {
          if (*__error() == 28) {
            *(_DWORD *)(a2 + 28) = 0;
          }
          int v17 = sub_1000079A4();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
            sub_1000160F4();
          }
          sub_10000F370(a2, 0);
          sub_10000F56C(v7, a2);
        }
        *(void *)(*(void *)(a3 + 16) + 4) = 0xC00000000;
        *(void *)a2 = 0;
        *(_DWORD *)(a2 + 252) = 0;
      }
      else
      {
        *(_DWORD *)(a2 + 252) = 1;
      }
    }
    else
    {
      unint64_t v15 = sub_1000079A4();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        sub_10001620C();
      }
      if (*__error() == 28)
      {
        *(_DWORD *)(a2 + 28) = 0;
        gzclose(v8);
        *(void *)(*(void *)(a3 + 16) + 4) = 0xC00000000;
        uint64_t v16 = sub_1000079A4();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
          sub_1000161A0();
        }
        sub_10000F370(a2, 0);
        sub_10000F56C(v7, a2);
      }
    }
    return (gzFile)pthread_rwlock_unlock((pthread_rwlock_t *)(a2 + 48));
  }
  *(_DWORD *)(a2 + 28) = 0;

  return (gzFile)pthread_rwlock_unlock((pthread_rwlock_t *)(a2 + 48));
}

uint64_t sub_100010898()
{
  memset(&v5, 0, sizeof(v5));
  int v4 = "/";
  memset(v3, 0, sizeof(v3));
  qword_1000206B0 = (uint64_t)malloc_default_zone();
  pid_t v0 = getpid();
  if (sub_10000750C(v0, 0, (uint64_t)&v4, 1u, 0, 0, 30000000, *(_DWORD *)(qword_100020748 + 24), -1, 256, (uint64_t)sub_100003AFC, qword_100020748, 0, 0, v3, (unint64_t *)(qword_100020748 + 16)))
  {
    BOOL v1 = sub_1000079A4();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
      sub_100016384();
    }
    return 22;
  }
  else
  {
    *(_DWORD *)(*(void *)(qword_100020748 + 16) + 188) |= 0x20u;
    atomic_fetch_add_explicit(&dword_100020724, 1u, memory_order_relaxed);
    atomic_fetch_add_explicit(&dword_100020720, 1u, memory_order_relaxed);
    sub_100005318((uint64_t (*)(void))sub_100010A34);
    pthread_attr_init(&v5);
    pthread_attr_setdetachstate(&v5, 2);
    pthread_create(&qword_100021828, &v5, (void *(__cdecl *)(void *))sub_1000027DC, *(void **)(qword_100020748 + 16));
    pthread_attr_destroy(&v5);
    uint64_t result = 0;
    __dmb(0xBu);
    dword_100020740 = 1;
  }
  return result;
}

uint64_t sub_100010A34(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 128);
  if (v2 && !*(void *)(v2 + 16)) {
    *(void *)(v2 + 16) = a2;
  }
  return 0;
}

uint64_t sub_100010A50(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 128);
  unint64_t v3 = (pthread_rwlock_t *)(v2 + 2304);
  v5[0] = a1;
  v5[1] = v2;
  ptr = malloc_type_zone_malloc((malloc_zone_t *)qword_1000206B8, 0x40000uLL, 0x2A67FEB9uLL);
  long long v7 = xmmword_1000191E0;
  DWORD2(v7) = 12;
  sub_100006220(0, v3, (unsigned int (*)(uint64_t, uint64_t))sub_1000104B8, (uint64_t)v5);
  sub_1000105C4((gzFile)a1, *(void *)(a1 + 128), (uint64_t)v5, 1);
  malloc_zone_free((malloc_zone_t *)qword_1000206B8, ptr);
  return sub_10000DDAC((uint64_t)v3);
}

void sub_100010B04(uint64_t a1)
{
  uint64_t v2 = *(void ***)(a1 + 128);
  if (*(int *)(a1 + 36) < 1)
  {
    if (v2)
    {
      sub_10000DDAC((uint64_t)(v2 + 288));
      free(*(void **)(*(void *)(a1 + 128) + 2536));
      free(*(void **)(*(void *)(a1 + 128) + 2504));
      free(v2[5]);
      free(v2);
      *(void *)(a1 + 128) = 0;
    }
  }
  else
  {
    unint64_t v3 = sub_1000079A4();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_100016454();
    }
  }
}

uint64_t sub_100010B9C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 128);
  if (v1)
  {
    if (dword_1000206C8 || v1 != qword_100020748)
    {
      if ((*(_DWORD *)(a1 + 32) & 1) != 0 || v1 != qword_100020748)
      {
        sub_100010A50(a1);
        snprintf(__str, 0x400uLL, "%s/fseventsd-uuid", (const char *)(v1 + 256));
        utimes(__str, 0);
        if ((*(_DWORD *)(a1 + 32) & 0x200) != 0)
        {
          sub_10000F370(v1, 1);
          snprintf(__str, 0x400uLL, "%s/fseventsd-uuid", (const char *)(v1 + 256));
          unlink(__str);
          if (rmdir((const char *)(v1 + 256)))
          {
            pthread_attr_t v5 = sub_1000079A4();
            if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
              sub_1000164F8();
            }
          }
        }
        if (!dword_1000206C8) {
          *(_DWORD *)(a1 + 32) &= ~0x800u;
        }
      }
      else
      {
        int v4 = sub_1000079A4();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
          sub_1000164C4();
        }
      }
    }
  }
  return 0;
}

uint64_t sub_100010D00()
{
  *(void *)(qword_100020748 + 16) = 0;
  uint64_t result = sub_100005318((uint64_t (*)(void))sub_100010B9C);
  qword_100020748 = 0;
  return result;
}

uint64_t sub_100010D44(uint64_t a1)
{
  uint64_t v11 = **(const char ***)(a1 + 136);
  uint64_t v8 = strlen(v11) + 1;
  uint64_t v9 = 0;
  int v6 = 0x40000000;
  int v7 = 0;
  unint64_t v2 = *(void *)(a1 + 152);
  unint64_t v10 = v2;
  if (v2 > *(void *)(a1 + 160)) {
    *(void *)(a1 + 160) = v2;
  }
  int v5 = 0;
  unint64_t v3 = *(uint64_t (**)(void, uint64_t, uint64_t *, const char **, int *, int *, unint64_t *, uint64_t *, int *))(a1 + 208);
  if (!v3) {
    return 0;
  }
  uint64_t result = v3(*(void *)(a1 + 216), 1, &v8, &v11, &v6, &v5, &v10, &v9, &v7);
  if (result)
  {
    if (result == 268435459)
    {
      *(_DWORD *)(a1 + 188) |= 2u;
      return 268435459;
    }
  }
  else
  {
    *(_DWORD *)(a1 + 188) &= ~1u;
    *(void *)(a1 + 152) = 0;
  }
  return result;
}

uint64_t sub_100010E4C(int a1, unint64_t a2, uint64_t *a3)
{
  uint64_t result = sub_1000073CC();
  if (result)
  {
    memset(&v18, 0, sizeof(v18));
    sub_10000A434((uint64_t)&unk_100021758);
    *a3 = 0;
    uint64_t v7 = sub_100004644(a1);
    if (v7)
    {
      uint64_t v8 = v7;
      if ((*(_DWORD *)(v7 + 32) & 0x40) == 0)
      {
        uint64_t v9 = *(void *)(v7 + 128);
        if (v9)
        {
          uint64_t v10 = *(unsigned int *)(v9 + 32);
          if ((int)v10 >= 1)
          {
            while (1)
            {
              uint64_t v11 = v10 - 1;
              snprintf(__str, 0x400uLL, "%s/%.16llx", (const char *)(*(void *)(v8 + 128) + 256), *(void *)(*(void *)(*(void *)(v8 + 128) + 40) + 8 * (v10 - 1)));
              if (!lstat(__str, &v18)
                && (v18.st_mode & 0xF000) == 0x8000
                && v18.st_ctimespec.tv_sec <= a2
                && v18.st_size > 0)
              {
                break;
              }
              --v10;
              if ((unint64_t)(v11 + 1) <= 1) {
                goto LABEL_11;
              }
            }
            if ((v10 & 0xFFFFFFFE) == 0)
            {
LABEL_11:
              unsigned int v12 = sub_1000079A4();
              if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
                sub_100016D7C();
              }
              *a3 = 0;
              return sub_10000A3A0((uint64_t)&unk_100021758);
            }
            int v13 = sub_10000F9EC(*(void *)(v8 + 128), *(void *)(*(void *)(*(void *)(v8 + 128) + 40) + 8 * (v10 - 1)), a3);
            if (v13)
            {
              int v14 = v13;
              *a3 = *(void *)(*(void *)(*(void *)(v8 + 128) + 40) + 8 * (v10 - 2));
              unint64_t v15 = sub_1000079A4();
              if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
              {
                uint64_t v16 = *(void *)(*(void *)(*(void *)(v8 + 128) + 40) + 8 * (v10 - 1));
                uint64_t v17 = *a3;
                *(_DWORD *)statfs buf = 67109888;
                int v20 = v10 - 1;
                __int16 v21 = 2048;
                uint64_t v22 = v17;
                __int16 v23 = 1024;
                int v24 = v14;
                __int16 v25 = 2048;
                uint64_t v26 = v16;
                _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "failed to get last id from log file %d so using last id == 0x%llx (ret %d; %.16llx)\n",
                  buf,
                  0x22u);
              }
            }
          }
        }
      }
    }
    return sub_10000A3A0((uint64_t)&unk_100021758);
  }
  return result;
}

uint64_t sub_100011084(int a1, unint64_t a2)
{
  if (!sub_1000073CC()) {
    return 0xFFFFFFFFLL;
  }
  sub_10000A434((uint64_t)&unk_100021758);
  uint64_t v4 = sub_100004644(a1);
  if (!v4) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v5 = v4;
  memset(&v20, 0, sizeof(v20));
  if ((*(_DWORD *)(v4 + 32) & 0x40) != 0 || (uint64_t v6 = *(void *)(v4 + 128)) == 0 || !*(_DWORD *)(v6 + 32))
  {
    sub_10000A3A0((uint64_t)&unk_100021758);
    return 0xFFFFFFFFLL;
  }
  pthread_rwlock_wrlock((pthread_rwlock_t *)(v6 + 48));
  uint64_t v7 = *(void *)(v5 + 128);
  if (*(int *)(v7 + 32) < 1)
  {
    int v9 = 0;
  }
  else
  {
    uint64_t v8 = 0;
    int v9 = 0;
    do
    {
      unint64_t v10 = *(void *)(*(void *)(v7 + 40) + 8 * v8);
      if (a2 != -1 && v10 >= a2) {
        break;
      }
      snprintf(__str, 0x400uLL, "%s/%.16llx", (const char *)(v7 + 256), v10);
      if (!lstat(__str, &v20) && (v20.st_mode & 0xF000) == 0x8000)
      {
        uint64_t v11 = sub_1000079A4();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)statfs buf = 136315138;
          __int16 v23 = __str;
          _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "    purge_events: deleting: %s", buf, 0xCu);
        }
        unlink(__str);
        ++v9;
      }
      ++v8;
      uint64_t v7 = *(void *)(v5 + 128);
    }
    while (v8 < *(int *)(v7 + 32));
    if (v9)
    {
      snprintf((char *)buf, 0x400uLL, "%s/fseventsd-uuid", (const char *)(v7 + 256));
      unlink((const char *)buf);
      sub_10000F56C(v5, *(void *)(v5 + 128));
      uint64_t v7 = *(void *)(v5 + 128);
    }
  }
  int v13 = *(_DWORD *)(v7 + 32);
  int v14 = *(char **)(v7 + 40);
  if (v13 <= v9)
  {
    free(v14);
    uint64_t v18 = *(void *)(v5 + 128);
    *(void *)(v18 + 32) = 0;
    *(void *)(v18 + 40) = 0;
    ++*(_WORD *)(v18 + 248);
    __int16 v19 = 1;
  }
  else
  {
    memmove(v14, &v14[8 * v9], 8 * (v13 - v9));
    uint64_t v15 = *(void *)(v5 + 128);
    int v16 = *(_DWORD *)(v15 + 36);
    int v17 = *(_DWORD *)(v15 + 32) - v9;
    *(_DWORD *)(v15 + 32) = v17;
    bzero((void *)(*(void *)(v15 + 40) + 8 * v17), 8 * (v16 - v17));
    uint64_t v18 = *(void *)(v5 + 128);
    __int16 v19 = *(_WORD *)(v18 + 250) + 1;
  }
  *(_WORD *)(v18 + 250) = v19;
  pthread_rwlock_unlock((pthread_rwlock_t *)(v18 + 48));
  sub_10000A3A0((uint64_t)&unk_100021758);
  return 0;
}

uint64_t sub_10001132C()
{
  memset(&v11, 0, sizeof(v11));
  pthread_t v10 = 0;
  signal(2, (void (__cdecl *)(int))sub_10000E0BC);
  signal(3, (void (__cdecl *)(int))sub_10000E0BC);
  signal(15, (void (__cdecl *)(int))sub_10000E0BC);
  signal(1, (void (__cdecl *)(int))sub_10000E0BC);
  signal(30, (void (__cdecl *)(int))1);
  global_queue = dispatch_get_global_queue(-32768, 0);
  qword_100020290 = (uint64_t)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0x1EuLL, 0, global_queue);
  dispatch_source_set_event_handler((dispatch_source_t)qword_100020290, &stru_10001C758);
  dispatch_resume((dispatch_object_t)qword_100020290);
  dispatch_get_global_queue(0, 0);
  os_state_add_handler();
  for (uint64_t i = 0; i != 256; ++i)
  {
    int v2 = i << 24;
    int v3 = 8;
    do
    {
      if (v2 >= 0) {
        v2 *= 2;
      }
      else {
        int v2 = (2 * v2) ^ 0x4C11DB7;
      }
      --v3;
    }
    while (v3);
    dword_100020298[i] = v2;
  }
  dword_10002073C = 2;
  qword_100020730 = (uint64_t)sub_10000DE50(2, 0x10000);
  if (qword_100020730)
  {
    zone = malloc_create_zone(0, 0);
    qword_1000206A8 = (uint64_t)zone;
    if (zone) {
      malloc_set_zone_name(zone, "PathStringZone");
    }
    qword_100021848 = 0;
    *(void *)&dword_100021850 = 0;
    qword_100021848 = (uint64_t)sub_10001274C(4096, &dword_100021854);
    qword_1000206C0 = (uint64_t)malloc_default_zone();
    qword_100021830 = 0;
    qword_100021840 = 0;
    qword_100021838 = 0;
    qword_100021830 = (uint64_t)sub_10001274C(4096, &qword_100021838);
    bzero(xmmword_100020758, 0x1000uLL);
    bzero(dword_1000218D8, 0x1000uLL);
    sub_10000C748();
    if (!qword_100020748)
    {
      uint64_t v8 = sub_1000079A4();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_100016DE4();
      }
      while (1)
        sleep(0x15180u);
    }
    pthread_cond_init(&stru_100020200, 0);
    pthread_mutex_init(&stru_1000201C0, 0);
    pthread_mutex_init(&stru_100020140, 0);
    v12[0] = 0x101010101010101;
    v12[1] = 0x101010101010101;
    if (!sub_10000C330(1, (uint64_t)v12, 16, 0x2000))
    {
      ioctl(dword_100020048, 0x20007365uLL, 0);
      if (!ioctl(dword_100020048, 0x20007366uLL, 0)) {
        byte_100020288 = 1;
      }
      pthread_attr_init(&v11);
      pthread_create(&v10, &v11, (void *(__cdecl *)(void *))sub_1000024A0, 0);
      pthread_attr_destroy(&v11);
      if (sub_100010898())
      {
        int v9 = sub_1000079A4();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          sub_100016E18();
        }
      }
      pthread_mutex_lock(&stru_100020090);
      dword_100020750 = 1;
      pthread_cond_broadcast(&stru_1000200D0);
      pthread_mutex_unlock(&stru_100020090);
      sub_1000083C8();
      pthread_join(v10, 0);
      sub_10000DC50();
      while (dword_100020724)
        usleep(0xC350u);
      sub_100010D00();
      exit(0);
    }
    uint64_t v5 = sub_1000079A4();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100016E4C(v5);
    }
    return 22;
  }
  else
  {
    uint64_t v7 = sub_1000079A4();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100016DB0();
    }
    return 12;
  }
}

void sub_100011700(id a1)
{
}

os_state_data_s *__cdecl sub_100011708(id a1, os_state_hints_s *a2)
{
  if (a2->var2 != 3)
  {
    pthread_attr_t v11 = sub_1000079A4();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100016F90();
    }
    return 0;
  }
  int v2 = sub_10000E0E8();
  if (!v2)
  {
    unsigned int v12 = sub_1000079A4();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_100016ED4();
    }
    return 0;
  }
  int v3 = v2;
  CFDataRef Data = CFPropertyListCreateData(kCFAllocatorDefault, v2, kCFPropertyListBinaryFormat_v1_0, 0, 0);
  unsigned int Length = CFDataGetLength(Data);
  if (Length <= 0x8000)
  {
    CFRelease(v3);
    pthread_t v10 = malloc_type_calloc(1uLL, Length + 200, 0x280E3D90uLL);
    __strlcpy_chk();
    *(_DWORD *)pthread_t v10 = 1;
    *((_DWORD *)v10 + 1) = Length;
    v15.location = 0;
    v15.length = Length;
    CFDataGetBytes(Data, v15, (UInt8 *)v10 + 200);
  }
  else
  {
    uint64_t v6 = sub_1000079A4();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100016F08(Length, v6);
    }
    Value = CFDictionaryGetValue(v3, @"global_state");
    CFDataRef v8 = CFPropertyListCreateData(kCFAllocatorDefault, Value, kCFPropertyListBinaryFormat_v1_0, 0, 0);
    CFRelease(v3);
    unsigned int v9 = CFDataGetLength(v8);
    pthread_t v10 = malloc_type_calloc(1uLL, v9 + 200, 0xD8A49280uLL);
    __strlcpy_chk();
    *(_DWORD *)pthread_t v10 = 1;
    *((_DWORD *)v10 + 1) = v9;
    v14.location = 0;
    v14.length = v9;
    CFDataGetBytes(v8, v14, (UInt8 *)v10 + 200);
    if (v8) {
      CFRelease(v8);
    }
  }
  if (Data) {
    CFRelease(Data);
  }
  return (os_state_data_s *)v10;
}

uint64_t sub_1000118F8()
{
  sub_10001132C();
  pid_t v0 = sub_1000079A4();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    sub_100017024(v0, v1, v2, v3, v4, v5, v6, v7);
  }
  return 0;
}

uint64_t sub_10001193C(uint64_t a1, void *a2)
{
  uint64_t result = sub_1000073CC();
  if (result)
  {
    int v5 = 0;
    while (2)
    {
      pthread_mutex_lock(&stru_100020140);
      uint64_t v6 = 0;
      while (1)
      {
        uint64_t v7 = xmmword_100020758[v6];
        if (v7)
        {
          if (*(void *)(v7 + 216) == a1) {
            break;
          }
        }
        if (++v6 == 512)
        {
          return pthread_mutex_unlock(&stru_100020140);
        }
      }
      if (pthread_mutex_trylock((pthread_mutex_t *)xmmword_100020758[v6]))
      {
        pthread_mutex_unlock(&stru_100020140);
        uint64_t result = sleep(1u);
        if (++v5 != 10) {
          continue;
        }
      }
      else
      {
        if ((*(_DWORD *)(v7 + 188) & 0x800) != 0)
        {
          memset(&v9, 0, sizeof(v9));
          pthread_t v8 = 0;
          if ((*(_DWORD *)(v7 + 188) & 0x20) != 0) {
            sub_1000171B8();
          }
          *(_DWORD *)(v7 + 188) &= ~0x800u;
          pthread_attr_init(&v9);
          pthread_attr_setdetachstate(&v9, 2);
          pthread_create(&v8, &v9, (void *(__cdecl *)(void *))sub_1000027DC, (void *)v7);
          pthread_attr_destroy(&v9);
        }
        pthread_cond_signal((pthread_cond_t *)(v7 + 64));
        pthread_mutex_unlock((pthread_mutex_t *)v7);
        *a2 = *(void *)(v7 + 160);
        return pthread_mutex_unlock(&stru_100020140);
      }
      break;
    }
  }
  return result;
}

uint64_t sub_100011AF4(_DWORD *a1, void *a2)
{
  uint64_t v3 = qword_1000206E8;
  if (qword_1000206E8)
  {
    if (*(int *)(qword_1000206E8 + 8) < 1)
    {
      LODWORD(v4) = 0;
    }
    else
    {
      uint64_t v4 = 0;
      do
      {
        if ((*(_DWORD *)(*(void *)(*(void *)qword_1000206E8 + 8 * v4) + 32) & 0x50) == 0
          && **(_DWORD **)(*(void *)qword_1000206E8 + 8 * v4) == *a1)
        {
          break;
        }
        ++v4;
      }
      while (v4 < *(int *)(qword_1000206E8 + 8));
    }
  }
  else
  {
    if (dword_1000206C8) {
      return 2;
    }
    int v5 = sub_1000079A4();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1000171E4();
    }
    MEMORY[0x123] = 195936478;
    uint64_t v3 = qword_1000206E8;
    if (!qword_1000206E8) {
      return 2;
    }
    LODWORD(v4) = 0;
  }
  if ((int)v4 < *(_DWORD *)(v3 + 8))
  {
    uint64_t result = 0;
    *a2 = *(void *)(*(void *)v3 + 8 * v4);
    return result;
  }
  return 2;
}

uint64_t sub_100011BF0()
{
  uint64_t v0 = kqueue();
  if ((v0 & 0x80000000) != 0) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v1 = v0;
  v3.ident = 0;
  *(_DWORD *)&v3.filter = 131063;
  memset(&v3.fflags, 0, 20);
  if (kevent(v0, &v3, 1, 0, 0, 0))
  {
    close(v1);
    return 0xFFFFFFFFLL;
  }
  return v1;
}

void sub_100011C68(__CFFileDescriptor *a1)
{
  uint64_t v1 = a1;
  CFFileDescriptorNativeDescriptor NativeDescriptor = CFFileDescriptorGetNativeDescriptor(a1);
  memset(&eventlist, 0, sizeof(eventlist));
  *(void *)timeout = 0;
  *(void *)&timeout[8] = 0;
  do
  {
    if (dword_1000206C8 || kevent(NativeDescriptor, 0, 0, &eventlist, 1, (const timespec *)timeout) != -1) {
      goto LABEL_13;
    }
  }
  while (*__error() == 4);
  int v3 = *__error();
  if (!v3)
  {
LABEL_13:
    if (dword_1000206C8) {
      goto LABEL_14;
    }
    uint64_t v102 = 0;
    if (qword_100020748)
    {
      uint64_t v10 = *(void *)(qword_100020748 + 16);
      if (v10) {
        sub_10000BA68(v10);
      }
    }
    int v11 = sub_10000CBEC(&v102);
    if (v11 <= 0)
    {
      uint64_t v33 = sub_1000079A4();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
        sub_100017218();
      }
      goto LABEL_14;
    }
    unsigned int v12 = v11;
    uint64_t v97 = v1;
    usleep(0xC350u);
    sub_10000C280((uint64_t)&unk_100021758);
    uint64_t v13 = qword_1000206E8;
    if (*(int *)(qword_1000206E8 + 8) >= 1)
    {
      uint64_t v14 = 0;
      do
        *(_DWORD *)(*(void *)(*(void *)v13 + 8 * v14++) + 32) |= 8u;
      while (v14 < *(int *)(v13 + 8));
    }
    uint64_t v15 = 0;
    int v98 = 0;
    int v16 = 0;
    int v17 = v102;
    uint64_t v100 = v12;
    do
    {
      uint64_t v18 = &v17[2168 * v15];
      *(_DWORD *)uint64_t v18 = 0;
      if (*(int *)(v13 + 8) < 1)
      {
        LODWORD(v19) = 0;
      }
      else
      {
        uint64_t v19 = 0;
        stat v20 = v17;
        __int16 v21 = &v17[2168 * v15];
        uint64_t v22 = v21 + 48;
        __int16 v23 = v21 + 88;
        while ((*(_DWORD *)(*(void *)(*(void *)v13 + 8 * v19) + 32) & 0x4030) != 0
             || *v22 != **(_DWORD **)(*(void *)v13 + 8 * v19)
             || !*(void *)(*(void *)(*(void *)v13 + 8 * v19) + 8)
             || strcmp(v23, *(const char **)(*(void *)(*(void *)v13 + 8 * v19) + 8)))
        {
          if (++v19 >= *(int *)(v13 + 8)) {
            goto LABEL_32;
          }
        }
        *(_DWORD *)(*(void *)(*(void *)v13 + 8 * v19) + 32) &= ~8u;
        ++v16;
        sub_100010438(*(void *)(*(void *)v13 + 8 * v19), (uint64_t)v18);
        uint64_t v13 = qword_1000206E8;
LABEL_32:
        int v17 = v20;
      }
      if ((int)v19 >= *(_DWORD *)(v13 + 8))
      {
        int v98 = 1;
        *(_DWORD *)uint64_t v18 = 1;
        ++v16;
      }
      ++v15;
    }
    while (v15 != v100);
    if (*(int *)(v13 + 8) < 1)
    {
      int v25 = 0;
      int v26 = v16;
      int v27 = v98;
    }
    else
    {
      uint64_t v24 = 0;
      int v25 = 0;
      int v26 = v16;
      int v27 = v98;
      do
      {
        if ((*(_DWORD *)(*(void *)(*(void *)v13 + 8 * v24) + 32) & 0x4000) != 0)
        {
          int v27 = 1;
        }
        else if ((*(_DWORD *)(*(void *)(*(void *)v13 + 8 * v24) + 32) & 8) != 0 {
               && (*(_DWORD *)(*(void *)(*(void *)v13 + 8 * v24) + 32) & 0x30) == 0)
        }
        {
          *(_DWORD *)(*(void *)(*(void *)v13 + 8 * v24) + 32) &= 0xFFFFFFF3;
          ++v26;
          uint64_t v28 = *(void *)(*(void *)v13 + 8 * v24);
          int v29 = *(_DWORD *)(v28 + 32);
          int v30 = v29 | 0x800;
          unsigned int v31 = v29 & 0xFFFFFF7F;
          if ((*(_DWORD *)(v28 + 32) & 0x80) != 0) {
            unsigned int v32 = v31;
          }
          else {
            unsigned int v32 = v30;
          }
          *(_DWORD *)(v28 + 32) = v32;
          *(_DWORD *)(*(void *)(*(void *)v13 + 8 * v24) + 32) |= 0x20u;
          int v25 = 1;
        }
        else if ((*(_DWORD *)(*(void *)(*(void *)v13 + 8 * v24) + 32) & 8) != 0 {
               && (*(_DWORD *)(*(void *)(*(void *)v13 + 8 * v24) + 32) & 0x30) != 0)
        }
        {
          ++v26;
          *(_DWORD *)(*(void *)(*(void *)v13 + 8 * v24) + 32) &= ~8u;
        }
        ++v24;
      }
      while (v24 < *(int *)(v13 + 8));
    }
    if (!v27)
    {
      sub_10000A3A0((uint64_t)&unk_100021758);
      free(v17);
      uint64_t v1 = v97;
      if (v25) {
        goto LABEL_138;
      }
      goto LABEL_14;
    }
    uint64_t v42 = malloc_type_malloc(0x10uLL, 0x10800409227ACB4uLL);
    if (v42)
    {
      uint64_t v43 = v42;
      uint64_t v44 = malloc_type_calloc(v26, 8uLL, 0x2004093837F09uLL);
      if (v44)
      {
        uint64_t v45 = v44;
        uint64_t v46 = qword_1000206E8;
        uint64_t v99 = (uint64_t)v43;
        if (*(int *)(qword_1000206E8 + 8) < 1)
        {
          int v48 = 0;
        }
        else
        {
          uint64_t v47 = 0;
          int v48 = 0;
          do
          {
            if ((*(_DWORD *)(*(void *)(*(void *)v46 + 8 * v47) + 32) & 0x4000) == 0)
            {
              v44[v48++] = *(void *)(*(void *)v46 + 8 * v47);
              uint64_t v46 = qword_1000206E8;
            }
            ++v47;
          }
          while (v47 < *(int *)(v46 + 8));
        }
        uint64_t v60 = 0;
        while (1)
        {
          int v101 = 0;
          char v61 = &v17[2168 * v60];
          if (*(_DWORD *)v61) {
            break;
          }
LABEL_111:
          if (++v60 == v100) {
            goto LABEL_115;
          }
        }
        int v62 = malloc_type_calloc(0x88uLL, 1uLL, 0x50201608uLL);
        v45[v48] = v62;
        if (!v62)
        {
          size_t v85 = sub_1000079A4();
          if (os_log_type_enabled(v85, OS_LOG_TYPE_ERROR))
          {
            LODWORD(eventlist.ident) = 136315138;
            *(uintptr_t *)((char *)&eventlist.ident + 4) = (uintptr_t)&v17[2168 * v60 + 88];
            _os_log_error_impl((void *)&_mh_execute_header, v85, OS_LOG_TYPE_ERROR, "NO MEMORY for new device for mount point %s\n", (uint8_t *)&eventlist, 0xCu);
          }
LABEL_115:
          if (v48 != v26)
          {
            uint64_t v86 = sub_1000079A4();
            if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR)) {
              sub_1000172B4();
            }
          }
          *(void *)uint64_t v99 = v45;
          *(_DWORD *)(v99 + 8) = v48;
          uint64_t v87 = qword_1000206E8;
          qword_1000206E8 = v99;
          if (v87)
          {
            int v88 = *(_DWORD *)(v87 + 8);
            uint64_t v1 = v97;
            if (v88 >= 1)
            {
              for (uint64_t i = 0; i < v88; ++i)
              {
                uint64_t v90 = *(void *)(*(void *)v87 + 8 * i);
                if ((*(_DWORD *)(v90 + 32) & 0x4000) != 0)
                {
                  sub_100010B04(v90);
                  free(*(void **)(*(void *)v87 + 8 * i));
                  *(void *)(*(void *)v87 + 8 * i) = 0;
                  int v88 = *(_DWORD *)(v87 + 8);
                }
              }
              int v48 = *(_DWORD *)(v99 + 8);
            }
          }
          else
          {
            uint64_t v1 = v97;
          }
          if (v48 >= 1)
          {
            uint64_t v91 = 0;
            uint64_t v92 = *(void *)v99;
            do
            {
              uint64_t v93 = *(void *)(v92 + 8 * v91);
              if ((*(_DWORD *)(v93 + 32) & 0x800) != 0)
              {
                sub_100010B9C(v93);
                uint64_t v92 = *(void *)v99;
                uint64_t v93 = *(void *)(*(void *)v99 + 8 * v91);
                *(_DWORD *)(v93 + 32) &= ~0x800u;
              }
              if ((*(_DWORD *)(v93 + 32) & 0x10) != 0)
              {
                uint64_t v94 = *(void **)(v93 + 8);
                if (v94)
                {
                  free(v94);
                  uint64_t v95 = *(void *)v99;
                  *(void *)(*(void *)(*(void *)v99 + 8 * v91) + 8) = 0;
                  free(*(void **)(*(void *)(v95 + 8 * v91) + 16));
                  uint64_t v92 = *(void *)v99;
                  *(void *)(*(void *)(*(void *)v99 + 8 * v91) + 16) = 0;
                  uint64_t v96 = *(_DWORD **)(v92 + 8 * v91);
                  _DWORD *v96 = 0;
                }
                else
                {
                  uint64_t v96 = *(_DWORD **)(v92 + 8 * v91);
                }
                if (!v96[9]) {
                  v96[8] |= 0x4000u;
                }
              }
              ++v91;
            }
            while (v91 < *(int *)(v99 + 8));
          }
          sub_10000A3A0((uint64_t)&unk_100021758);
          free(*(void **)v87);
          free((void *)v87);
          free(v17);
LABEL_138:
          atomic_fetch_add_explicit(&dword_1000206CC, 1u, memory_order_relaxed);
          sub_10000E070();
LABEL_14:
          pthread_attr_t v9 = v1;
LABEL_15:
          CFFileDescriptorEnableCallBacks(v9, 1uLL);
          return;
        }
        int v63 = v62;
        int v64 = v48;
        uint64_t v65 = v48;
        uint64_t v66 = &v17[2168 * v60];
        *int v62 = *((_DWORD *)v66 + 12);
        uint64_t v67 = v66 + 88;
        uint64_t v68 = strdup(v66 + 88);
        *((void *)v63 + 1) = v68;
        if (sub_10000CC8C(v67, (char *)&eventlist))
        {
          *(void *)(v45[v65] + 16) = strdup((const char *)&eventlist);
          uint64_t v68 = *(char **)(v45[v65] + 16);
        }
        else
        {
          uint64_t v69 = sub_1000079A4();
          if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
          {
            int v80 = *(_DWORD *)v45[v65];
            *(_DWORD *)timeout = 136315650;
            *(void *)&timeout[4] = "handle_vfs_event";
            *(_WORD *)&timeout[12] = 2080;
            *(void *)&timeout[14] = v68;
            __int16 v104 = 1024;
            int v105 = v80;
            _os_log_error_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_ERROR, "%s: Could not resolve nofirmlink  path, fallback to mount_point[%s] dev[%d]\n", timeout, 0x1Cu);
          }
          *(void *)(v45[v65] + 16) = strdup(v67);
        }
        size_t v70 = v68;
        do
        {
          while (1)
          {
            int v72 = *v70++;
            int v71 = v72;
            if (v72 != 47) {
              break;
            }
            ++*(_DWORD *)(v45[v65] + 24);
          }
        }
        while (v71);
        uint64_t v73 = v45[v65];
        if (v68[1]) {
          ++*(_DWORD *)(v73 + 24);
        }
        *(_DWORD *)(v73 + 32) = 36;
        int v74 = sub_10000CDBC((uint64_t)v61, &v101);
        uint64_t v75 = v45[v65];
        int v76 = *(_DWORD *)(v75 + 32);
        if (v74)
        {
          *(_DWORD *)(v75 + 32) = v76 | 0x100;
          int v77 = v101;
          if (v101)
          {
LABEL_103:
            if (v77 == 2)
            {
              *(_DWORD *)(v45[v65] + 32) |= 0x8040u;
              uint64_t v79 = sub_1000079A4();
              if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR))
              {
                uint64_t v83 = v45[v65];
                uint64_t v84 = *(void *)(v83 + 8);
                LODWORD(v83) = *(_DWORD *)v83;
                *(_DWORD *)timeout = 136315650;
                *(void *)&timeout[4] = "handle_vfs_event";
                *(_WORD *)&timeout[12] = 2080;
                *(void *)&timeout[14] = v84;
                __int16 v104 = 1024;
                int v105 = v83;
                _os_log_error_impl((void *)&_mh_execute_header, v79, OS_LOG_TYPE_ERROR, "%s: mount_point(%s) dev(%d) will be completely ignored", timeout, 0x1Cu);
              }
            }
            else if (v77 == 1)
            {
              uint64_t v78 = sub_1000079A4();
              if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
              {
                uint64_t v81 = v45[v65];
                uint64_t v82 = *(void *)(v81 + 8);
                LODWORD(v81) = *(_DWORD *)v81;
                *(_DWORD *)timeout = 136315650;
                *(void *)&timeout[4] = "handle_vfs_event";
                *(_WORD *)&timeout[12] = 2080;
                *(void *)&timeout[14] = v82;
                __int16 v104 = 1024;
                int v105 = v81;
                _os_log_error_impl((void *)&_mh_execute_header, v78, OS_LOG_TYPE_ERROR, "%s: Logging disabled (no_log) completely for device: mount_point(%s) dev(%d)", timeout, 0x1Cu);
              }
              *(_DWORD *)(v45[v65] + 32) |= 0x1000u;
            }
            int v48 = v64 + 1;
            goto LABEL_111;
          }
          sub_10000CFA0();
        }
        else
        {
          *(_DWORD *)(v75 + 32) = v76 | 0x40;
        }
        int v77 = v101;
        goto LABEL_103;
      }
      int v59 = sub_1000079A4();
      if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR)) {
        sub_100017280();
      }
      sub_10000A3A0((uint64_t)&unk_100021758);
      free(v43);
    }
    else
    {
      __int32 v58 = sub_1000079A4();
      if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR)) {
        sub_10001724C();
      }
      sub_10000A3A0((uint64_t)&unk_100021758);
    }
    free(v17);
    uint64_t v1 = v97;
    goto LABEL_14;
  }
  uint64_t v4 = sub_1000079A4();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_10001740C();
  }
  if (v3 != 9)
  {
    CFFileDescriptorInvalidate(v1);
    CFRelease(v1);
  }
  CFFileDescriptorNativeDescriptor v5 = sub_100011BF0();
  if (v5 < 0)
  {
    uint64_t v34 = sub_1000079A4();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
      sub_10001731C(v34, v35, v36, v37, v38, v39, v40, v41);
    }
  }
  else
  {
    uint64_t v6 = CFFileDescriptorCreate(0, v5, 1u, (CFFileDescriptorCallBack)sub_100011C68, 0);
    RunLoopSource = CFFileDescriptorCreateRunLoopSource(0, v6, 0);
    if (RunLoopSource)
    {
      pthread_t v8 = RunLoopSource;
      CFRunLoopAddSource((CFRunLoopRef)qword_1000206F8, RunLoopSource, kCFRunLoopDefaultMode);
      CFRelease(v8);
      pthread_attr_t v9 = v6;
      goto LABEL_15;
    }
    int v49 = sub_1000079A4();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
      sub_100017394(v49, v50, v51, v52, v53, v54, v55, v56);
    }
    CFFileDescriptorInvalidate(v6);
    CFRelease(v6);
  }
  dword_1000206C8 = 1;
  __dmb(0xBu);
  int v57 = dword_100020048;
  if ((dword_100020048 & 0x80000000) == 0)
  {
    dword_100020048 = -1;
    close(v57);
  }
}

void *sub_10001274C(int a1, _DWORD *a2)
{
  if (a1 < 1) {
    return 0;
  }
  int v3 = 1;
  do
  {
    unsigned int v4 = v3;
    v3 *= 2;
  }
  while ((int)v4 <= a1);
  unsigned int v5 = v4 >> 1;
  uint64_t v6 = malloc_type_malloc(8 * (v4 >> 1), 0x2004093837F09uLL);
  uint64_t v7 = v6;
  if (v6)
  {
    if (v5 <= 1) {
      unsigned int v8 = 1;
    }
    else {
      unsigned int v8 = v5;
    }
    bzero(v6, 8 * v8);
    *a2 = v5 - 1;
  }
  return v7;
}

uint64_t sub_1000127D8(unsigned char *a1, int a2)
{
  if (a2)
  {
    unsigned int v2 = 0;
    do
    {
      int v3 = *a1++;
      v2 ^= dword_100020298[v3 ^ HIBYTE(v2)];
      --a2;
    }
    while (a2);
  }
  else
  {
    int v4 = *a1;
    if (*a1)
    {
      unsigned int v2 = 0;
      unsigned int v5 = a1 + 1;
      do
      {
        v2 ^= dword_100020298[v4 ^ HIBYTE(v2)];
        int v6 = *v5++;
        int v4 = v6;
      }
      while (v6);
    }
    else
    {
      unsigned int v2 = 0;
    }
  }
  if (v2 <= 1) {
    return 1;
  }
  else {
    return v2;
  }
}

void sub_100012844(int8x8_t *a1, uint64_t a2, char a3)
{
  *a1 = vrev32_s8(*a1);
  uint64_t v3 = bswap32(a1[1].u32[0]);
  a1[1].i32[0] = v3;
  BOOL v4 = v3 <= 0x40000 && v3 <= a2;
  unsigned int v5 = (unint64_t *)((char *)&a1[1] + 4);
  unint64_t v6 = (unint64_t)a1 + v3;
  if (v4 && (unint64_t)v5 < v6)
  {
    while (1)
    {
      int v11 = v5;
      do
      {
        if (!*(unsigned char *)v11) {
          break;
        }
        int v11 = (unint64_t *)((char *)v11 + 1);
      }
      while ((unint64_t)v11 < v6);
      unint64_t v12 = (char *)v11 - (char *)v5 + 1;
      if (v12 >= 0x401)
      {
        uint64_t v13 = sub_1000079A4();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          sub_10001748C(v13, v14, v15, v16, v17, v18, v19, v20);
        }
        return;
      }
      unsigned int v8 = (char *)v5 + v12;
      if ((unint64_t)v8 >= v6) {
        return;
      }
      if ((unint64_t)(v8 + 8) > v6) {
        break;
      }
      *(void *)unsigned int v8 = bswap64(*(void *)v8);
      unsigned int v5 = (unint64_t *)(v8 + 12);
      if ((unint64_t)(v8 + 12) > v6)
      {
        int v29 = sub_1000079A4();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
          sub_10001757C(v29, v30, v31, v32, v33, v34, v35, v36);
        }
        return;
      }
      *((_DWORD *)v8 + 2) = bswap32(*((_DWORD *)v8 + 2));
      __int32 v9 = a1[1].i32[0];
      if (a3)
      {
        unint64_t v10 = (unint64_t)(v8 + 20);
        if (v10 > (unint64_t)a1 + v9)
        {
          uint64_t v37 = sub_1000079A4();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
            sub_10001766C(v37, v38, v39, v40, v41, v42, v43, v44);
          }
          return;
        }
        *unsigned int v5 = bswap64(*v5);
        unsigned int v5 = (unint64_t *)v10;
      }
      if ((a3 & 2) != 0)
      {
        if ((char *)v5 + 4 > (char *)a1 + v9)
        {
          uint64_t v45 = sub_1000079A4();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
            sub_1000175F4(v45, v46, v47, v48, v49, v50, v51, v52);
          }
          return;
        }
        *(_DWORD *)unsigned int v5 = bswap32(*(_DWORD *)v5);
        __int32 v9 = a1[1].i32[0];
        unsigned int v5 = (unint64_t *)((char *)v5 + 4);
      }
      unint64_t v6 = (unint64_t)a1 + v9;
      if ((unint64_t)v5 >= v6) {
        return;
      }
    }
    __int16 v21 = sub_1000079A4();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_100017504(v21, v22, v23, v24, v25, v26, v27, v28);
    }
  }
}

gzFile sub_1000129F4(uint64_t a1, uint64_t a2, int a3)
{
  memset(&v22, 0, sizeof(v22));
  if ((*(_DWORD *)(a1 + 32) & 0x1040) != 0) {
    return 0;
  }
  uint64_t v6 = *(void *)(a2 + 8);
  if (!v6)
  {
    uint64_t v6 = qword_1000206D0[dword_1000206E0];
    *(void *)(a2 + 8) = v6;
  }
  unsigned int v7 = 0;
  uint64_t v8 = 0;
  while (1)
  {
    if (*(_DWORD *)(a2 + 252))
    {
      int v9 = open((const char *)(a2 + 1280), 536870922);
    }
    else
    {
      uint64_t v8 = v6 + 1;
      snprintf((char *)(a2 + 1280), 0x400uLL, "%s/%.16llx", (const char *)(a2 + 256), v6 + 1);
      int v9 = open_dprotected_np((const char *)(a2 + 1280), 536874498, 4, 0, 384);
    }
    int v10 = v9;
    if ((v9 & 0x80000000) == 0) {
      break;
    }
    if (*__error() != 17 || v7 >= 0x64) {
      goto LABEL_16;
    }
    ++v7;
    uint64_t v6 = *(void *)(a2 + 8) + 1;
    *(void *)(a2 + 8) = v6;
  }
  if (fstat(v9, &v22) || (v22.st_mode & 0xF000) != 0x8000)
  {
    __error();
    close(v10);
LABEL_16:
    int v11 = sub_1000079A4();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1000177E0();
    }
    int v10 = open("/dev/null", 2);
    if (v10 < 0)
    {
      uint64_t v18 = sub_1000079A4();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        goto LABEL_38;
      }
      goto LABEL_39;
    }
  }
  size_t v12 = strlen((const char *)(a2 + 256));
  __s2[0] = 0;
  if (fcntl(v10, 50, __s2) || strncmp((const char *)(a2 + 256), __s2, v12) || __s2[v12] != 47)
  {
    if (*(void *)__s2 != 0x6C756E2F7665642FLL || v24 != 108)
    {
      uint64_t v14 = sub_1000079A4();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_10001776C(a2 + 256);
      }
    }
    close(v10);
    int v10 = open("/dev/null", 2);
    if (v10 < 0)
    {
      uint64_t v18 = sub_1000079A4();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
LABEL_38:
      }
        sub_1000176E4(v18);
LABEL_39:
      gzFile v3 = 0;
LABEL_41:
      *(_DWORD *)(a2 + 28) = 0;
      return v3;
    }
  }
  gzFile v3 = gzdopen(v10, "ab");
  if (!v3)
  {
    close(v10);
    goto LABEL_41;
  }
  if (a3) {
    pthread_rwlock_wrlock((pthread_rwlock_t *)(a2 + 48));
  }
  if (*(_DWORD *)(a2 + 252)) {
    goto LABEL_48;
  }
  int v15 = *(_DWORD *)(a2 + 32);
  uint64_t v16 = *(int *)(a2 + 36);
  if (v15 >= (int)v16)
  {
    uint64_t v20 = malloc_type_calloc(v16 + 100, 8uLL, 0x100004000313F17uLL);
    if (!v20) {
      goto LABEL_48;
    }
    uint64_t v17 = v20;
    __int16 v21 = *(const void **)(a2 + 40);
    if (v21)
    {
      memcpy(v20, v21, 8 * *(int *)(a2 + 36));
      free(*(void **)(a2 + 40));
    }
    *(void *)(a2 + 40) = v17;
    int v15 = *(_DWORD *)(a2 + 32);
    *(_DWORD *)(a2 + 36) += 100;
  }
  else
  {
    uint64_t v17 = *(void **)(a2 + 40);
  }
  v17[v15] = v8;
  *(_DWORD *)(a2 + 32) = v15 + 1;
LABEL_48:
  if (a3) {
    pthread_rwlock_unlock((pthread_rwlock_t *)(a2 + 48));
  }
  return v3;
}

void sub_100012D94(id a1)
{
  qword_1000228E0 = (uint64_t)dispatch_semaphore_create(8);
}

uint64_t sub_100012DB8(unsigned int *a1, size_t *a2, const char **a3, unsigned int *a4, unsigned int *a5, void *a6, void *a7, unsigned int *a8)
{
  uint64_t v8 = a1[354];
  if (v8 >= 0x20) {
    sub_100017878();
  }
  int v9 = a8;
  if ((*(_DWORD *)(*(void *)a1 + 188) & 0x100) != 0)
  {
    size_t v15 = *a2;
    uint64_t v16 = *a3;
  }
  else
  {
    size_t v15 = *a2;
    uint64_t v16 = *a3;
    if (v8)
    {
      uint64_t v17 = (v8 - 1);
      uint64_t v18 = *(const char **)&a1[2 * v17 + 258];
      if (!strncmp(v18, v16, v15))
      {
        int v25 = v18[v15 - 1];
        int v9 = a8;
        if (!v25)
        {
          uint64_t result = 0;
          a1[v17 + 66] |= *a4;
          *(void *)&a1[2 * a1[354] + 96] = *a6;
          return result;
        }
      }
      else
      {
        int v9 = a8;
      }
    }
  }
  *(void *)&a1[2 * v8 + 2] = v15;
  a1[v8 + 66] = *a4;
  uint64_t v19 = a1[354];
  *(void *)&a1[2 * v19 + 98] = *a6;
  a1[v19 + 322] = *a5;
  uint64_t v20 = strdup(v16);
  uint64_t v21 = a1[354];
  *(void *)&a1[2 * v21 + 258] = v20;
  *(void *)&a1[2 * v21 + 162] = *a7;
  a1[v21 + 226] = *v9;
  uint64_t v22 = a1[354];
  if (*(void *)&a1[2 * v22 + 258])
  {
    uint64_t result = 0;
  }
  else if (*a3)
  {
    uint64_t result = 12;
  }
  else
  {
    uint64_t result = 0;
  }
  unsigned int v24 = v22 + 1;
  a1[354] = v24;
  if (v24 >= 0x20)
  {
    return sub_10000B840((uint64_t)a1);
  }
  return result;
}

void sub_100012F78(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void sub_100012F90(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_100012FAC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 2u);
}

unsigned char *sub_100012FD0(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = 0;
  *a2 = 0;
  return result;
}

void sub_100012FE0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_100013000(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x12u);
}

void sub_100013030(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

void sub_100013074(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0xEu);
}

void sub_1000130D8(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x18u);
}

void sub_1000130F8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

double sub_100013134()
{
  return 2.0542726e-289;
}

void sub_100013174(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

void sub_1000131DC(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x20u);
}

uint64_t sub_100013224(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 20);
  if ((v1 - 66007) >= 0xFFFFFFF9) {
    return (uint64_t)*(&off_10001C818 + 5 * (v1 - 66000) + 5);
  }
  else {
    return 0;
  }
}

_DWORD *sub_100013264(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    NDR_record_t v3 = NDR_record;
  }
  else
  {
    uint64_t result = (_DWORD *)sub_10000BFEC(result[3], (void *)(a2 + 36));
    *(_DWORD *)(a2 + 32) = result;
    NDR_record_t v3 = NDR_record;
    if (!result)
    {
      *(NDR_record_t *)(a2 + 24) = NDR_record;
      *(_DWORD *)(a2 + 4) = 44;
      return result;
    }
  }
  *(NDR_record_t *)(a2 + 24) = v3;
  return result;
}

uint64_t sub_1000132E0(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 44)
  {
    *(_DWORD *)(a2 + 32) = -304;
    NDR_record_t v3 = NDR_record;
  }
  else
  {
    uint64_t result = sub_10000C060(*(unsigned int *)(result + 12), *(_DWORD *)(result + 32), *(void *)(result + 36), (uint64_t *)(a2 + 36));
    *(_DWORD *)(a2 + 32) = result;
    NDR_record_t v3 = NDR_record;
    if (!result)
    {
      *(NDR_record_t *)(a2 + 24) = NDR_record;
      *(_DWORD *)(a2 + 4) = 44;
      return result;
    }
  }
  *(NDR_record_t *)(a2 + 24) = v3;
  return result;
}

uint64_t sub_100013368(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 44)
  {
    int v3 = -304;
    goto LABEL_7;
  }
  if (*(_DWORD *)(result + 44) || *(_DWORD *)(result + 48) <= 7u)
  {
    int v3 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v3;
    NDR_record_t v4 = NDR_record;
LABEL_8:
    *(NDR_record_t *)(a2 + 24) = v4;
    return result;
  }
  uint64_t result = sub_10000C088(*(unsigned int *)(result + 12), *(_DWORD *)(result + 32), *(void *)(result + 36), (int *)(a2 + 36), *(void *)(result + 56));
  *(_DWORD *)(a2 + 32) = result;
  NDR_record_t v4 = NDR_record;
  if (result) {
    goto LABEL_8;
  }
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  *(_DWORD *)(a2 + 4) = 40;
  return result;
}

void sub_100013410(os_log_t log)
{
  int v1 = 136315138;
  unsigned int v2 = "create_dispatch_source_for_f2d_port";
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%s: ERROR: dispatch_source_create() failed", (uint8_t *)&v1, 0xCu);
}

void sub_100013494(int a1, int a2, os_log_t log)
{
  if (dword_100020250 == a1) {
    int v3 = "public";
  }
  else {
    int v3 = "private";
  }
  int v4 = 136315394;
  uint64_t v5 = v3;
  __int16 v6 = 1024;
  int v7 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "f2d: ERROR: dispatch_mig_server(%s) => %d", (uint8_t *)&v4, 0x12u);
}

void sub_10001353C(uint64_t a1, NSObject *a2)
{
  int v2 = 136315394;
  int v3 = "fseventsd_mach_channel_handler";
  __int16 v4 = 2048;
  uint64_t v5 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%s: unhandled dispatch_mach_reason[%lu]", (uint8_t *)&v2, 0x16u);
}

void sub_1000135C8(mach_error_t a1, uint64_t a2, NSObject *a3)
{
  int v5 = 136315906;
  __int16 v6 = "fseventsd_mach_channel_handler";
  __int16 v7 = 2048;
  uint64_t v8 = a2;
  __int16 v9 = 2080;
  uint64_t v10 = mach_error_string(a1);
  __int16 v11 = 1024;
  mach_error_t v12 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "%s: reason(%lu) ERROR:  %s (%d)", (uint8_t *)&v5, 0x26u);
}

void sub_100013690()
{
  LODWORD(v2) = 136315650;
  sub_10000C0F0();
  sub_10000C0D0((void *)&_mh_execute_header, v0, v1, "%s: num_paths(%d) > MAX_NUM_PATHS || num_exclude_paths(%d) > MAX_NUM_PATHS*PATH_MAX", v2, v3, v4);
}

void sub_100013704()
{
  LODWORD(v2) = 136315650;
  sub_10000C0F0();
  sub_10000C0D0((void *)&_mh_execute_header, v0, v1, "%s: paths_blobCnt(%d) > MAX_NUM_PATHS*PATH_MAX || exclude_paths_blobCnt(%d)", v2, v3, v4);
}

void sub_100013778()
{
  LODWORD(v2) = 136315650;
  sub_10000C0F0();
  sub_10000C0D0((void *)&_mh_execute_header, v0, v1, "%s: exclude_path_offsets[%d] > exclude_paths_blobCnt(%d)", v2, v3, v4);
}

void sub_1000137EC(os_log_t log)
{
  int v1 = 136315138;
  int v2 = "implementation_register_rpc";
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%s: clientp = add_client() => NULL", (uint8_t *)&v1, 0xCu);
}

void sub_100013870()
{
  sub_10000C10C();
  sub_10000C120((void *)&_mh_execute_header, v0, v1, "%s: implementation_added_client() => %d", v2, v3, v4, v5, 2u);
}

void sub_1000138E4()
{
  sub_10000C10C();
  sub_10000C120((void *)&_mh_execute_header, v0, v1, "%s: set_exclusion_paths() => %d", v2, v3, v4, v5, 2u);
}

void sub_100013958(mach_error_t a1)
{
  mach_error_string(a1);
  sub_10000C13C();
  sub_10000C15C((void *)&_mh_execute_header, v1, v2, "%s: ERROR: mach_port_request_notification() => %s (%d)", v3, v4, v5, v6, 2u);
}

void sub_1000139E0(mach_error_t a1)
{
  mach_error_string(a1);
  sub_10000C13C();
  sub_10000C15C((void *)&_mh_execute_header, v1, v2, "%s: ERROR: mach_port_allocate() => %s (%d)", v3, v4, v5, v6, 2u);
}

void sub_100013A68()
{
  LODWORD(v2) = 136315650;
  sub_10000C0F0();
  sub_10000C0D0((void *)&_mh_execute_header, v0, v1, "%s: path_offsets[%d] > paths_blobCnt(%d)", v2, v3, v4);
}

void sub_100013ADC()
{
  LODWORD(v2) = 136315650;
  sub_10000C0F0();
  sub_10000C0D0((void *)&_mh_execute_header, v0, v1, "%s: num_exclude_paths(%d) != exclude_path_offsetsCnt(%d)", v2, v3, v4);
}

void sub_100013B50()
{
  LODWORD(v2) = 136315650;
  sub_10000C0F0();
  sub_10000C0D0((void *)&_mh_execute_header, v0, v1, "%s: num_paths(%d) != path_offsetsCnt(%d)", v2, v3, v4);
}

void sub_100013BC4()
{
  sub_10000C10C();
  sub_10000C120((void *)&_mh_execute_header, v0, v1, "%s: ERROR: get_client_with_matching_f2d_private_port(0x%x) => NULL", v2, v3, v4, v5, 2u);
}

void sub_100013C38()
{
  sub_10000C10C();
  sub_10000C120((void *)&_mh_execute_header, v0, v1, "%s: ERROR: get_client_with_matching_f2d_private_port(0x%x) => NULL", v2, v3, v4, v5, 2u);
}

void sub_100013CAC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000C17C((void *)&_mh_execute_header, a1, a3, "%s: ERROR: clientp = malloc() failed", a5, a6, a7, a8, 2u);
}

void sub_100013D24(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000C17C((void *)&_mh_execute_header, a1, a3, "%s: ERROR: clientp->paths_blob = malloc() failed", a5, a6, a7, a8, 2u);
}

void sub_100013D9C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000C17C((void *)&_mh_execute_header, a1, a3, "%s: ERROR: clientp->paths = malloc() failed", a5, a6, a7, a8, 2u);
}

void sub_100013E14(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100013E8C(int a1, mach_error_t error_value)
{
  mach_error_string(error_value);
  sub_10000C198();
  sub_10000C1C0((void *)&_mh_execute_header, v2, v3, "%s: f2d_private_source cancel: ERROR: mach_port_mod_refs(0x%x, MACH_PORT_RIGHT_RECEIVE, -1) => %s (%d)", v4, v5, v6, v7, 2u);
}

void sub_100013F28(uint64_t a1, int *a2, os_log_t log)
{
  uint64_t v3 = *(void *)(a1 + 24);
  int v4 = *a2;
  int v5 = 134218496;
  uint64_t v6 = a1;
  __int16 v7 = 2048;
  uint64_t v8 = v3;
  __int16 v9 = 1024;
  int v10 = v4;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "dealloc_client: DANGER: clientp %p (%p) has refcount %d", (uint8_t *)&v5, 0x1Cu);
}

void sub_100013FC4(int a1, mach_error_t error_value)
{
  mach_error_string(error_value);
  sub_10000C198();
  sub_10000C1C0((void *)&_mh_execute_header, v2, v3, "%s: ERROR: mach_port_deallocate(clientp->d2f_port = 0x%x) => %s (%d)", v4, v5, v6, v7, 2u);
}

void sub_10001405C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000140D4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000C17C((void *)&_mh_execute_header, a1, a3, "%s: ERROR: clientp == NULL", a5, a6, a7, a8, 2u);
}

void sub_10001414C(os_log_t log)
{
  int v1 = 136315394;
  uint64_t v2 = "callback_client";
  __int16 v3 = 2080;
  uint64_t v4 = "j == paths_blob_size";
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "fseventsd: %s(): failed assertion '%s'\n", (uint8_t *)&v1, 0x16u);
}

void sub_1000141E4(mach_error_t a1)
{
  mach_error_string(a1);
  sub_10000C13C();
  sub_10000C15C((void *)&_mh_execute_header, v1, v2, "%s: ERROR: vm_allocate of paths_blob failed: %s (%d)", v3, v4, v5, v6, 2u);
}

void sub_10001426C(mach_error_t a1)
{
  mach_error_string(a1);
  sub_10000C13C();
  sub_10000C15C((void *)&_mh_execute_header, v1, v2, "%s: ERROR: vm_allocate of array_of_path_offsets failed: %s (%d)", v3, v4, v5, v6, 2u);
}

void sub_1000142F4(int a1, NSObject *a2)
{
  strerror(a1);
  int v4 = 136315394;
  uint64_t v5 = "fsevent_rwlock_init";
  sub_100013020();
  sub_100013030((void *)&_mh_execute_header, a2, v3, "%s Unable to create rwlock key [%s]\n", (uint8_t *)&v4);
}

void sub_100014384(int a1, NSObject *a2)
{
  strerror(a1);
  int v4 = 136315394;
  uint64_t v5 = "fsevent_rwlock_init";
  sub_100013020();
  sub_100013030((void *)&_mh_execute_header, a2, v3, "%s Unable to initialize rwlock [%s]\n", (uint8_t *)&v4);
}

void sub_100014414(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001448C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100014504(int a1)
{
  strerror(a1);
  sub_1000130B8();
  sub_10000C15C((void *)&_mh_execute_header, v1, v2, "%s Unable to acquire rdlock %s [%d]\n", v3, v4, v5, v6, 2u);
}

void sub_100014590()
{
  __assert_rtn("fsevent_rwlock_wrlock", "fseventsd_implementation.c", 286, "*pLockCount <= 0");
}

void sub_1000145BC(int a1)
{
  strerror(a1);
  sub_1000130B8();
  sub_10000C15C((void *)&_mh_execute_header, v1, v2, "%s Unable to acquire wrlock %s [%d]\n", v3, v4, v5, v6, 2u);
}

void sub_100014648(NSObject *a1)
{
  uint64_t v2 = __error();
  strerror(*v2);
  sub_100013048();
  sub_100012F78((void *)&_mh_execute_header, a1, v3, "/dev/fsevents clone failed! (%s)", v4);
}

void sub_1000146D0()
{
  v1[0] = 136315394;
  sub_10000C10C();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "%s: No Memory for %d devices", (uint8_t *)v1, 0x12u);
}

void sub_100014750()
{
  sub_100012FC4();
  sub_100012F90((void *)&_mh_execute_header, v0, v1, "no root di?!\n", v2, v3, v4, v5, v6);
}

void sub_100014784(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000147FC()
{
  __error();
  os_log_t v0 = __error();
  strerror(*v0);
  sub_100013054();
  sub_10000C15C((void *)&_mh_execute_header, v1, v2, "%s: getattrlist failed (%d):[%s]", v3, v4, v5, v6, 2u);
}

void sub_100014890()
{
  sub_100013174(__stack_chk_guard);
  v2[0] = 136315394;
  sub_1000131C8();
  sub_100013030((void *)&_mh_execute_header, v0, v1, "%s: could not stat the fs @ %s", (uint8_t *)v2);
}

void sub_100014908()
{
  sub_1000130AC();
  sub_100012F78((void *)&_mh_execute_header, v0, (uint64_t)v0, "init_dev_info: no memory dev info of mount point %s\n", v1);
}

void sub_100014988()
{
  __error();
  os_log_t v0 = __error();
  strerror(*v0);
  sub_100013054();
  sub_10000C15C((void *)&_mh_execute_header, v1, v2, "%s: err(%d): [%s]\n", v3, v4, v5, v6, 2u);
}

void sub_100014A1C()
{
  sub_100013210();
  sub_100013000((void *)&_mh_execute_header, v0, v1, "volume %s does not support logging (flags 0x%x).", v2, v3);
}

void sub_100014A90()
{
  sub_100013048();
  sub_10000C17C((void *)&_mh_execute_header, v0, v1, "Failed to load UUID.  Removing all old log files in %s", v2, v3, v4, v5, v6);
}

void sub_100014AF8()
{
  sub_100013048();
  sub_10000C17C((void *)&_mh_execute_header, v0, v1, "Problem with log files.  Removing all old log files in %s", v2, v3, v4, v5, v6);
}

void sub_100014B60()
{
  sub_100013048();
  sub_10000C17C((void *)&_mh_execute_header, v0, v1, "Can't stat log file: %s", v2, v3, v4, v5, v6);
}

void sub_100014BC8()
{
  sub_100013094();
  sub_100013000((void *)&_mh_execute_header, v0, v1, "create_dls: failed to get dirlist for %s, error %d", v2, v3);
}

void sub_100014C30(uint64_t a1, uint64_t a2)
{
  LODWORD(v4) = 136315394;
  *(void *)((char *)&v4 + 4) = a2;
  sub_100013020();
  sub_100012FE0((void *)&_mh_execute_header, v2, v3, "log dir %s does not match path %s.  bailing out.", (const char *)v4, DWORD2(v4));
}

void sub_100014CA0()
{
  sub_1000131A4();
  __error();
  uint64_t v0 = __error();
  strerror(*v0);
  sub_10000C15C((void *)&_mh_execute_header, v1, v2, "failed to make the directory %s (%d/%s)", v3, v4, v5, v6, 2u);
}

void sub_100014D4C()
{
  sub_1000130AC();
  sub_10000C17C((void *)&_mh_execute_header, v0, v1, "creating a dls for %s but it already has one...", v2, v3, v4, v5, v6);
}

void sub_100014DB8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100014E30(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100014EA8()
{
  sub_100012FC4();
  sub_100012F90((void *)&_mh_execute_header, v0, v1, "volume_mounted_run_loop: failed to init the vfs event kqueue!", v2, v3, v4, v5, v6);
}

void sub_100014EDC()
{
  sub_100013094();
  sub_100013000((void *)&_mh_execute_header, v0, v1, "add_event_ref: event @ %p had bogus refcount %d", v2, v3);
}

void sub_100014F44()
{
  sub_100013134();
  int v6 = v0;
  __int16 v7 = v1;
  int v8 = v2;
  __int16 v9 = v1;
  int v10 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "remove_event_ref: mask 0x%x dev %d client_map 0x%x 0x%x", v5, 0x1Au);
}

void sub_100014FD4()
{
  sub_1000130AC();
  sub_10000C17C((void *)&_mh_execute_header, v0, v1, "remove_event_ref: path: %s", v2, v3, v4, v5, v6);
}

void sub_100015040()
{
  sub_100013094();
  sub_100013000((void *)&_mh_execute_header, v0, v1, "remove_event_ref: event @ %p had bogus refcount %d", v2, v3);
}

void sub_1000150A8()
{
  sub_100012FC4();
  sub_100012F90((void *)&_mh_execute_header, v0, v1, "add_paths_to_prefix_table: bad news: no memory for operation.", v2, v3, v4, v5, v6);
}

void sub_1000150DC(int *a1, NSObject *a2)
{
  int v2 = *a1;
  v3[0] = 67109376;
  v3[1] = v2;
  __int16 v4 = 1024;
  int v5 = 512;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "too many clients for pid %d (limit %d)", (uint8_t *)v3, 0xEu);
}

void sub_100015168(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000151DC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100015250()
{
}

void sub_10001527C()
{
}

void sub_1000152A8()
{
  sub_100012FC4();
  sub_100012F90((void *)&_mh_execute_header, v0, v1, "can not allocate a kernel-dropped event!", v2, v3, v4, v5, v6);
}

void sub_1000152DC()
{
  sub_100013174(__stack_chk_guard);
  sub_1000130AC();
  sub_100013180();
  sub_100012FE0((void *)&_mh_execute_header, v0, v1, "add_event: path <<%s>> has len %zu", v2, v3);
}

void sub_10001534C(uint64_t a1, uint64_t a2, NSObject *a3)
{
  LOWORD(v3) = 2048;
  *(void *)((char *)&v3 + 2) = a1;
  sub_100013000((void *)&_mh_execute_header, a2, a3, "consumer thread: bad ref count %d on entry %p", 67109376, (const void *)v3);
}

void sub_1000153C4(uint64_t a1, _DWORD *a2, NSObject *a3)
{
  LOWORD(v3) = 1024;
  *(_DWORD *)((char *)&v3 + 2) = *a2;
  sub_100013074((void *)&_mh_execute_header, (uint64_t)a2, a3, "event table has grown too large. (filled %d / mask 0x%x)", 67109376, v3);
}

void sub_100015444()
{
  sub_100012FC4();
  sub_100012F90((void *)&_mh_execute_header, v0, v1, "failed to resize the hash table.", v2, v3, v4, v5, v6);
}

void sub_100015478(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000154F0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100015568()
{
  v3[0] = 136315650;
  sub_10000C10C();
  __int16 v4 = v0;
  int v5 = v1;
  _os_log_error_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_ERROR, "%s: empty path table index(%d)  with device id(%d) - skipping \n", (uint8_t *)v3, 0x18u);
}

void sub_1000155F4(unsigned char *a1, unsigned char *a2)
{
  sub_100012FD0(a1, a2);
  sub_100012FAC((void *)&_mh_execute_header, v2, (uint64_t)v2, "dropped event message is inconsistent.", v3);
}

void sub_100015624(uint8_t *a1, void *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 134217984;
  *a2 = -1;
  sub_100012F78((void *)&_mh_execute_header, a3, (uint64_t)a3, "1: event id's wrapping to zero! (0x%llx)", a1);
}

void sub_100015668(uint8_t *a1, void *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 134217984;
  *a2 = -1;
  sub_100012F78((void *)&_mh_execute_header, a3, (uint64_t)a3, "2: event id's wrapping to zero! (0x%llx)", a1);
}

void sub_1000156AC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000C17C((void *)&_mh_execute_header, a1, a3, "%s: ERROR: CFDictionaryCreateMutable() => NULL\n", a5, a6, a7, a8, 2u);
}

void sub_100015724(unsigned char *a1, unsigned char *a2)
{
  sub_100012FD0(a1, a2);
  sub_100012FAC((void *)&_mh_execute_header, v2, (uint64_t)v2, "exclusion_paths cfMutableArray was not created", v3);
}

void sub_100015754(unsigned char *a1, unsigned char *a2)
{
  sub_100012FD0(a1, a2);
  sub_100012FAC((void *)&_mh_execute_header, v2, (uint64_t)v2, "exclusion_paths cfStr was not created", v3);
}

void sub_100015784(unsigned char *a1, unsigned char *a2)
{
  sub_100012FD0(a1, a2);
  sub_100012FAC((void *)&_mh_execute_header, v2, (uint64_t)v2, "path_table cfMutableArray was not created", v3);
}

void sub_1000157B4(unsigned char *a1, unsigned char *a2)
{
  sub_100012FD0(a1, a2);
  sub_100012FAC((void *)&_mh_execute_header, v2, (uint64_t)v2, "path_table cfStr was not created", v3);
}

void sub_1000157E4(const __CFString *a1, NSObject *a2)
{
  CFStringGetCStringPtr(a1, 0x8000100u);
  sub_100013048();
  sub_100012F78((void *)&_mh_execute_header, a2, v3, "%s val was not created", v4);
}

void sub_10001586C()
{
  sub_1000131FC();
  uint64_t v4 = v0;
  __int16 v5 = 1024;
  int v6 = v1;
  _os_log_error_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_ERROR, "fseventsd internal state [num_clients: %d, current_event_id: 0x%llx string_table_count[%d]\n", v3, 0x18u);
}

void sub_100015918()
{
  sub_1000131A4();
  __error();
  sub_10000C15C((void *)&_mh_execute_header, v0, v1, "%s: error removing [%s] (%d)", v2, v3, v4, v5, 2u);
}

void sub_1000159B8()
{
  sub_1000130AC();
  sub_100013180();
  sub_100012FE0((void *)&_mh_execute_header, v0, v1, "event %s for %s", v2, v3);
}

void sub_100015A40(NSObject *a1)
{
  int v2 = *__error();
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a1, OS_LOG_TYPE_ERROR, "check_vol_last_mod_time: failed to get last mtime (%d)\n", (uint8_t *)v3, 8u);
}

void sub_100015AD0()
{
  sub_1000131A4();
  __error();
  sub_1000131FC();
  uint64_t v3 = v1;
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "check_vol_last_mod_time:XXX failed to get mount time (%d; &mount_time == %p)\n",
    v2,
    0x12u);
}

void sub_100015B60()
{
  sub_100013164();
  __error();
  sub_1000131B0();
  sub_100013114();
  sub_1000130D8((void *)&_mh_execute_header, v0, v1, "check_vol_last_mod_time: problems with history file: %s (%d ; is_reg %d)",
    v2,
    v3,
    v4,
    v5,
    v6);
}

void sub_100015BE4(uint64_t a1)
{
  LODWORD(v3) = 136315394;
  *(void *)((char *)&v3 + 4) = a1;
  sub_100013180();
  sub_100012FE0((void *)&_mh_execute_header, v1, v2, "log dir: %s getting new uuid: %s", (const char *)v3, DWORD2(v3));
}

void sub_100015C58()
{
  sub_100013048();
  sub_10000C17C((void *)&_mh_execute_header, v0, v1, "failed to store the uuid in %s.  unlinking it.", v2, v3, v4, v5, v6);
}

void sub_100015CC0()
{
  sub_100013048();
  sub_10000C17C((void *)&_mh_execute_header, v0, v1, "failed to create the uuid file %s", v2, v3, v4, v5, v6);
}

void sub_100015D28()
{
  sub_100013164();
  __error();
  sub_1000131B0();
  sub_100013114();
  sub_1000130D8((void *)&_mh_execute_header, v0, v1, "get_last_event_id: problems with history file: %s (%d ; is_reg %d)",
    v2,
    v3,
    v4,
    v5,
    v6);
}

void sub_100015DAC()
{
  sub_100013048();
  sub_10000C17C((void *)&_mh_execute_header, v0, v1, "get_last_event_id: failed to gzopen %s", v2, v3, v4, v5, v6);
}

void sub_100015E14()
{
  int v2 = 136315394;
  uint64_t v3 = "get_last_event_id";
  sub_100013020();
  sub_100013030((void *)&_mh_execute_header, v0, v1, "%s: malformed history archive - header too small - (%s)\n", (uint8_t *)&v2);
}

void sub_100015E90(uint8_t *a1, void *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "get_last_event_id";
  sub_100012F78((void *)&_mh_execute_header, a3, (uint64_t)a3, "%s: malformed history file - > PATH_MAX \n", a1);
}

void sub_100015ED8(uint8_t *a1, void *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "get_last_event_id";
  sub_100012F78((void *)&_mh_execute_header, a3, (uint64_t)a3, "%s: malformed history file - DLS_EVENTID_SIZE truncated", a1);
}

void sub_100015F20(uint8_t *a1, void *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "get_last_event_id";
  sub_100012F78((void *)&_mh_execute_header, a3, (uint64_t)a3, "%s: malformed history file - DLS_EVENTMASK_SIZE truncated", a1);
}

void sub_100015F68(uint8_t *a1, void *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "get_last_event_id";
  sub_100012F78((void *)&_mh_execute_header, a3, (uint64_t)a3, "%s: malformed history file - DLS_FILEID_SIZE+DLS_DOCID_SIZE truncated", a1);
}

void sub_100015FB0(uint8_t *a1, void *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "get_last_event_id";
  sub_100012F78((void *)&_mh_execute_header, a3, (uint64_t)a3, "%s: malformed history file - DLS_FILEID_SIZE truncated", a1);
}

void sub_100015FF8()
{
  sub_1000131A4();
  int v2 = __error();
  strerror(*v2);
  int v4 = 136315394;
  uint64_t v5 = v1;
  sub_100013020();
  sub_100013030((void *)&_mh_execute_header, v0, v3, "could not open <<%s>> (%s)\n", (uint8_t *)&v4);
}

void sub_100016088()
{
  sub_1000130AC();
  sub_10000C17C((void *)&_mh_execute_header, v0, v1, "re-enabling logs in %s", v2, v3, v4, v5, v6);
}

void sub_1000160F4()
{
  __error();
  sub_1000130D8((void *)&_mh_execute_header, v0, v1, "disk logger: gzclose() failed (%d/%d) removing all old log files in %s", v2, v3, v4, v5, 2u);
}

void sub_1000161A0()
{
  sub_1000130AC();
  sub_10000C17C((void *)&_mh_execute_header, v0, v1, "disk logger: removing all old log files in %s", v2, v3, v4, v5, v6);
}

void sub_10001620C()
{
  uint64_t v0 = __error();
  strerror(*v0);
  sub_1000131DC((void *)&_mh_execute_header, v1, v2, "disk logger: failed to write %zu bytes to log file %s (err: %s).", v3, v4, v5, v6, 2u);
}

void sub_1000162B4()
{
  sub_100013210();
  sub_100013000((void *)&_mh_execute_header, v0, v1, "gzflush(%s) returned %d", v2, v3);
}

void sub_100016324(unsigned char *a1, unsigned char *a2)
{
  sub_100012FD0(a1, a2);
  sub_100012FAC((void *)&_mh_execute_header, v2, (uint64_t)v2, "could not allocate buffer for logging file names!\n", v3);
}

void sub_100016354(unsigned char *a1, unsigned char *a2)
{
  sub_100012FD0(a1, a2);
  sub_100012FAC((void *)&_mh_execute_header, v2, (uint64_t)v2, "failed to resize the hash table.", v3);
}

void sub_100016384()
{
  sub_100012FC4();
  sub_100012F90((void *)&_mh_execute_header, v0, v1, "Failed to create disk logger client.", v2, v3, v4, v5, v6);
}

void sub_1000163B8()
{
  __assert_rtn("client_process_events", "fseventsd_implementation.c", 4327, "me->pid != 0");
}

void sub_1000163E4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100016454()
{
  sub_100013048();
  sub_100013180();
  sub_100012FE0((void *)&_mh_execute_header, v0, v1, "Leaking dev_info_t: 0x%p dls: 0x%p", v2, v3);
}

void sub_1000164C4()
{
  sub_100012FC4();
  sub_100012F90((void *)&_mh_execute_header, v0, v1, "DANGER! trying to cleanup the global dls for something that is not the root fs!", v2, v3, v4, v5, v6);
}

void sub_1000164F8()
{
  sub_1000131A4();
  uint64_t v2 = __error();
  strerror(*v2);
  int v4 = 136315394;
  uint64_t v5 = v1;
  sub_100013020();
  sub_100013030((void *)&_mh_execute_header, v0, v3, "unmounting: failed to remove log dir %s (%s)", (uint8_t *)&v4);
}

void sub_100016588()
{
  sub_100012FC4();
  sub_100012F90((void *)&_mh_execute_header, v0, v1, "scan_for_old_events: error processing in-memory disk bound event buffer", v2, v3, v4, v5, v6);
}

void sub_1000165BC()
{
  sub_100013174(__stack_chk_guard);
  sub_1000130AC();
  sub_10000C17C((void *)&_mh_execute_header, v0, v1, "scan_for_old_events_callback: mount point %s appears to be gone!", v2, v3, v4, v5, v6);
}

void sub_100016624()
{
  sub_100013048();
  sub_10001314C();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "scan_for_old: I should not be called for di %p (%s) flags 0x%x", v1, 0x1Cu);
}

void sub_1000166AC()
{
  sub_100013048();
  sub_10000C17C((void *)&_mh_execute_header, v0, v1, "read_disk_log: failed to gzopen %s", v2, v3, v4, v5, v6);
}

void sub_100016714()
{
  int v2 = 136315394;
  uint64_t v3 = "read_disk_log";
  sub_100013020();
  sub_100013030((void *)&_mh_execute_header, v0, v1, "%s: malformed history archive - header too small - (%s)\n", (uint8_t *)&v2);
}

void sub_100016790(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100016800(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100016878(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000168F0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100016968(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000169E0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100016A58()
{
  sub_10001318C();
  sub_100013074((void *)&_mh_execute_header, v0, v1, "process_disk_event_buf: checksum mis-match: file 0x%.8x, calculated 0x%.8x", v2, v3);
}

void sub_100016AC0()
{
  sub_100013134();
  int v3 = 1145852721;
  __int16 v4 = v0;
  int v5 = 1145852722;
  __int16 v6 = v0;
  int v7 = 1145852723;
  _os_log_error_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "process_disk_event_buf: magic is wrong (0x%.8x != (0x%.8x <OR> 0x%.8x <OR> 0x%.8x))", v2, 0x1Au);
}

void sub_100016B54(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100016BCC(uint64_t a1, uint64_t a2, NSObject *a3)
{
  LOWORD(v3) = 1024;
  *(_DWORD *)((char *)&v3 + 2) = *(_DWORD *)(a1 + 248);
  sub_100013074((void *)&_mh_execute_header, a2, a3, "failed sending HISTORY_DONE (%d) to pid %d\n", 67109376, v3);
}

void sub_100016C48()
{
  sub_100012FC4();
  sub_100012F90((void *)&_mh_execute_header, v0, v1, "scan_for_old_events: disk logger never started up!", v2, v3, v4, v5, v6);
}

void sub_100016C7C(int a1)
{
  strerror(a1);
  sub_100013054();
  sub_10000C15C((void *)&_mh_execute_header, v1, v2, "%s: unexpected error (%d):[%s]", v3, v4, v5, v6, 2u);
}

void sub_100016D04(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100016D7C()
{
  sub_100012FC4();
  sub_100012F90((void *)&_mh_execute_header, v0, v1, "requested timestamp is prior to the earliest log file.  setting event-id to zero\n", v2, v3, v4, v5, v6);
}

void sub_100016DB0()
{
  sub_100012FC4();
  sub_100012F90((void *)&_mh_execute_header, v0, v1, "failed to initialize fsevent buffers.", v2, v3, v4, v5, v6);
}

void sub_100016DE4()
{
  sub_100012FC4();
  sub_100012F90((void *)&_mh_execute_header, v0, v1, "No global disk logger state?!", v2, v3, v4, v5, v6);
}

void sub_100016E18()
{
  sub_100012FC4();
  sub_100012F90((void *)&_mh_execute_header, v0, v1, "Failed to create the disk logger thread!", v2, v3, v4, v5, v6);
}

void sub_100016E4C(NSObject *a1)
{
  uint64_t v2 = __error();
  strerror(*v2);
  sub_100013048();
  sub_100012F78((void *)&_mh_execute_header, a1, v3, "Could not access /dev/fsevents. (%s)", v4);
}

void sub_100016ED4()
{
  sub_100012FC4();
  sub_100012F90((void *)&_mh_execute_header, v0, v1, "client_state_cfdict is NULL", v2, v3, v4, v5, v6);
}

void sub_100016F08(int a1, NSObject *a2)
{
  v2[0] = 67109376;
  v2[1] = a1;
  __int16 v3 = 1024;
  int v4 = a1 - 0x8000;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "serialized_client_state_size is %dKB and is (%d)KB greater than the MAX_STATEDUMP_SIZE", (uint8_t *)v2, 0xEu);
}

void sub_100016F90()
{
  sub_100012FC4();
  sub_100012F90((void *)&_mh_execute_header, v0, v1, "hints osh_api is not equal to OS_STATE_API_REQUEST", v2, v3, v4, v5, v6);
}

void sub_100016FC4(unsigned char *a1, unsigned char *a2)
{
  sub_100012FD0(a1, a2);
  sub_100012FAC((void *)&_mh_execute_header, v2, (uint64_t)v2, "fsevent producer: no memory for buffers!", v3);
}

void sub_100016FF4(unsigned char *a1, unsigned char *a2)
{
  sub_100012FD0(a1, a2);
  sub_100012FAC((void *)&_mh_execute_header, v2, (uint64_t)v2, "fsevent consumer: spinning too much?!\n", v3);
}

void sub_100017024(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001709C()
{
  sub_100013174(__stack_chk_guard);
  v2[0] = 136315394;
  sub_1000131C8();
  sub_100013030((void *)&_mh_execute_header, v0, v1, "%s : failed to add client for path %s", (uint8_t *)v2);
}

void sub_100017118(uint64_t a1, NSObject *a2)
{
  uint64_t v2 = **(void **)(a1 + 24);
  int v3 = 136315650;
  uint64_t v4 = "implementation_removed_client";
  __int16 v5 = 2048;
  uint64_t v6 = a1;
  __int16 v7 = 2080;
  uint64_t v8 = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%s: did not find client %p for path = '%s'", (uint8_t *)&v3, 0x20u);
}

void sub_1000171B8()
{
}

void sub_1000171E4()
{
  sub_100012FC4();
  sub_100012F90((void *)&_mh_execute_header, v0, v1, "global dev table should not be NULL!", v2, v3, v4, v5, v6);
}

void sub_100017218()
{
  sub_100012FC4();
  sub_100012F90((void *)&_mh_execute_header, v0, v1, "handle_vfs_event: failed to get the mntinfo!", v2, v3, v4, v5, v6);
}

void sub_10001724C()
{
  sub_100012FC4();
  sub_100012F90((void *)&_mh_execute_header, v0, v1, "handle_vfs_event: no memory for dev_table_t", v2, v3, v4, v5, v6);
}

void sub_100017280()
{
  sub_100012FC4();
  sub_100012F90((void *)&_mh_execute_header, v0, v1, "handle_vfs_event: no memory for di_table", v2, v3, v4, v5, v6);
}

void sub_1000172B4()
{
  sub_10001318C();
  sub_100013074((void *)&_mh_execute_header, v0, v1, "handle_vfs_event: mismatched num mounts! j %d, num_mounts %d", v2, v3);
}

void sub_10001731C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100017394(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001740C()
{
  v1[0] = 136315394;
  sub_10000C10C();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "%s: Error: %d, restarting vfs events", (uint8_t *)v1, 0x12u);
}

void sub_10001748C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100017504(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001757C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000175F4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001766C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000176E4(NSObject *a1)
{
  int v2 = __error();
  strerror(*v2);
  sub_100013048();
  sub_100012F78((void *)&_mh_execute_header, a1, v3, "disk logger: can't even open /dev/null? (%s)", v4);
}

void sub_10001776C(uint64_t a1)
{
  LODWORD(v3) = 136315394;
  *(void *)((char *)&v3 + 4) = a1;
  sub_100013180();
  sub_100012FE0((void *)&_mh_execute_header, v1, v2, "disk logger: my log dir moved! (should be: %s but is: %s).", (const char *)v3, DWORD2(v3));
}

void sub_1000177E0()
{
  sub_100013164();
  os_log_t v0 = __error();
  strerror(*v0);
  sub_100013020();
  sub_1000131DC((void *)&_mh_execute_header, v1, v2, "disk logger: failed to open output file %s (%s). mount point %s", v3, v4, v5, v6, 2u);
}

void sub_100017878()
{
}

void sub_1000178A4()
{
  sub_100013174(__stack_chk_guard);
  int v1 = 136315650;
  uint64_t v2 = "client_buffer_flush";
  sub_10001314C();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "%s: sending client(%p) USER DROPPED event to pid %d\n", (uint8_t *)&v1, 0x1Cu);
}

uint64_t APFSVolumeRole()
{
  return _APFSVolumeRole();
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return _CFArrayCreateMutable(allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return _CFArrayGetCount(theArray);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return _CFBooleanGetTypeID();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return _CFBooleanGetValue(BOOLean);
}

void CFDataGetBytes(CFDataRef theData, CFRange range, UInt8 *buffer)
{
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return _CFDataGetLength(theData);
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreateMutable(allocator, capacity, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryGetValue(theDict, key);
}

CFFileDescriptorRef CFFileDescriptorCreate(CFAllocatorRef allocator, CFFileDescriptorNativeDescriptor fd, Boolean closeOnInvalidate, CFFileDescriptorCallBack callout, const CFFileDescriptorContext *context)
{
  return _CFFileDescriptorCreate(allocator, fd, closeOnInvalidate, callout, context);
}

CFRunLoopSourceRef CFFileDescriptorCreateRunLoopSource(CFAllocatorRef allocator, CFFileDescriptorRef f, CFIndex order)
{
  return _CFFileDescriptorCreateRunLoopSource(allocator, f, order);
}

void CFFileDescriptorEnableCallBacks(CFFileDescriptorRef f, CFOptionFlags callBackTypes)
{
}

CFFileDescriptorNativeDescriptor CFFileDescriptorGetNativeDescriptor(CFFileDescriptorRef f)
{
  return _CFFileDescriptorGetNativeDescriptor(f);
}

void CFFileDescriptorInvalidate(CFFileDescriptorRef f)
{
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

CFDataRef CFPropertyListCreateData(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return _CFPropertyListCreateData(allocator, propertyList, format, options, error);
}

void CFRelease(CFTypeRef cf)
{
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return _CFRunLoopGetCurrent();
}

void CFRunLoopRun(void)
{
}

void CFRunLoopStop(CFRunLoopRef rl)
{
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return _CFStringCreateWithCString(alloc, cStr, encoding);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return _CFStringCreateWithFormat(alloc, formatOptions, format);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return _CFStringGetCStringPtr(theString, encoding);
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return _SecTaskCopyValueForEntitlement(task, entitlement, error);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return _SecTaskCreateWithAuditToken(allocator, token);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int *__error(void)
{
  return ___error();
}

uint64_t __memcpy_chk()
{
  return ___memcpy_chk();
}

uint64_t __memmove_chk()
{
  return ___memmove_chk();
}

uint64_t __strlcat_chk()
{
  return ___strlcat_chk();
}

uint64_t __strlcpy_chk()
{
  return ___strlcpy_chk();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

int access(const char *a1, int a2)
{
  return _access(a1, a2);
}

uint64_t analytics_send_event_lazy()
{
  return _analytics_send_event_lazy();
}

void audit_token_to_au32(audit_token_t *atoken, uid_t *auidp, uid_t *euidp, gid_t *egidp, uid_t *ruidp, gid_t *rgidp, pid_t *pidp, au_asid_t *asidp, au_tid_t *tidp)
{
}

char *__cdecl basename(char *a1)
{
  return _basename(a1);
}

kern_return_t bootstrap_check_in(mach_port_t bp, const name_t service_name, mach_port_t *sp)
{
  return _bootstrap_check_in(bp, service_name, sp);
}

const char *__cdecl bootstrap_strerror(kern_return_t r)
{
  return _bootstrap_strerror(r);
}

void bzero(void *a1, size_t a2)
{
}

int clock_gettime(clockid_t __clock_id, timespec *__tp)
{
  return _clock_gettime(__clock_id, __tp);
}

int close(int a1)
{
  return _close(a1);
}

int closedir(DIR *a1)
{
  return _closedir(a1);
}

void closelog(void)
{
}

void dispatch_activate(dispatch_object_t object)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

uint64_t dispatch_mach_connect()
{
  return _dispatch_mach_connect();
}

uint64_t dispatch_mach_create_f()
{
  return _dispatch_mach_create_f();
}

uint64_t dispatch_mach_mig_demux()
{
  return _dispatch_mach_mig_demux();
}

uint64_t dispatch_mach_msg_get_msg()
{
  return _dispatch_mach_msg_get_msg();
}

void dispatch_main(void)
{
}

uint64_t dispatch_mig_server()
{
  return _dispatch_mig_server();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return _dispatch_semaphore_signal(dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return _dispatch_semaphore_wait(dsema, timeout);
}

uint64_t dispatch_set_qos_class_fallback()
{
  return _dispatch_set_qos_class_fallback();
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
}

uintptr_t dispatch_source_get_handle(dispatch_source_t source)
{
  return _dispatch_source_get_handle(source);
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void exit(int a1)
{
}

int fcntl(int a1, int a2, ...)
{
  return _fcntl(a1, a2);
}

DIR *__cdecl fdopendir(int a1)
{
  return _fdopendir(a1);
}

void free(void *a1)
{
}

int fsctl(const char *a1, unint64_t a2, void *a3, unsigned int a4)
{
  return _fsctl(a1, a2, a3, a4);
}

int fstat(int a1, stat *a2)
{
  return _fstat(a1, a2);
}

int fstatfs(int a1, statfs *a2)
{
  return _fstatfs(a1, a2);
}

int getattrlist(const char *a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  return _getattrlist(a1, a2, a3, a4, a5);
}

gid_t getegid(void)
{
  return _getegid();
}

uid_t geteuid(void)
{
  return _geteuid();
}

int getfsstat(statfs *a1, int a2, int a3)
{
  return _getfsstat(a1, a2, a3);
}

gid_t getgid(void)
{
  return _getgid();
}

pid_t getpid(void)
{
  return _getpid();
}

const char *getprogname(void)
{
  return _getprogname();
}

passwd *__cdecl getpwuid(uid_t a1)
{
  return _getpwuid(a1);
}

int gettimeofday(timeval *a1, void *a2)
{
  return _gettimeofday(a1, a2);
}

uid_t getuid(void)
{
  return _getuid();
}

int gzclose(gzFile file)
{
  return _gzclose(file);
}

gzFile gzdopen(int fd, const char *mode)
{
  return _gzdopen(fd, mode);
}

int gzflush(gzFile file, int flush)
{
  return _gzflush(file, flush);
}

int gzread(gzFile file, voidp buf, unsigned int len)
{
  return _gzread(file, buf, len);
}

int gzwrite(gzFile file, voidpc buf, unsigned int len)
{
  return _gzwrite(file, buf, len);
}

int initgroups(const char *a1, int a2)
{
  return _initgroups(a1, a2);
}

int ioctl(int a1, unint64_t a2, ...)
{
  return _ioctl(a1, a2);
}

int kevent(int kq, const kevent *changelist, int nchanges, kevent *eventlist, int nevents, const timespec *timeout)
{
  return _kevent(kq, changelist, nchanges, eventlist, nevents, timeout);
}

int kqueue(void)
{
  return _kqueue();
}

int lstat(const char *a1, stat *a2)
{
  return _lstat(a1, a2);
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return _mach_error_string(error_value);
}

mach_msg_return_t mach_msg(mach_msg_header_t *msg, mach_msg_option_t option, mach_msg_size_t send_size, mach_msg_size_t rcv_size, mach_port_name_t rcv_name, mach_msg_timeout_t timeout, mach_port_name_t notify)
{
  return _mach_msg(msg, option, send_size, rcv_size, rcv_name, timeout, notify);
}

void mach_msg_destroy(mach_msg_header_t *a1)
{
}

kern_return_t mach_port_allocate(ipc_space_t task, mach_port_right_t right, mach_port_name_t *name)
{
  return _mach_port_allocate(task, right, name);
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return _mach_port_deallocate(task, name);
}

kern_return_t mach_port_mod_refs(ipc_space_t task, mach_port_name_t name, mach_port_right_t right, mach_port_delta_t delta)
{
  return _mach_port_mod_refs(task, name, right, delta);
}

kern_return_t mach_port_request_notification(ipc_space_t task, mach_port_name_t name, mach_msg_id_t msgid, mach_port_mscount_t sync, mach_port_t notify, mach_msg_type_name_t notifyPoly, mach_port_t *previous)
{
  return _mach_port_request_notification(task, name, msgid, sync, notify, notifyPoly, previous);
}

mach_port_t mach_thread_self(void)
{
  return _mach_thread_self();
}

malloc_zone_t *__cdecl malloc_create_zone(vm_size_t start_size, unsigned int flags)
{
  return _malloc_create_zone(start_size, flags);
}

malloc_zone_t *malloc_default_zone(void)
{
  return _malloc_default_zone();
}

void malloc_set_zone_name(malloc_zone_t *zone, const char *name)
{
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_calloc(count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

void *__cdecl malloc_type_zone_malloc(malloc_zone_t *zone, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_zone_malloc(zone, size, type_id);
}

void malloc_zone_free(malloc_zone_t *zone, void *ptr)
{
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

void mig_deallocate(vm_address_t a1, vm_size_t a2)
{
}

void mig_reply_setup(mach_msg_header_t *a1, mach_msg_header_t *a2)
{
}

int mkdir(const char *a1, mode_t a2)
{
  return _mkdir(a1, a2);
}

int open(const char *a1, int a2, ...)
{
  return _open(a1, a2);
}

int open_dprotected_np(const char *a1, int a2, int a3, int a4, ...)
{
  return _open_dprotected_np(a1, a2, a3, a4);
}

void openlog(const char *a1, int a2, int a3)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_state_add_handler()
{
  return _os_state_add_handler();
}

int proc_pidinfo(int pid, int flavor, uint64_t arg, void *buffer, int buffersize)
{
  return _proc_pidinfo(pid, flavor, arg, buffer, buffersize);
}

int proc_pidpath(int pid, void *buffer, uint32_t buffersize)
{
  return _proc_pidpath(pid, buffer, buffersize);
}

int pthread_attr_destroy(pthread_attr_t *a1)
{
  return _pthread_attr_destroy(a1);
}

int pthread_attr_init(pthread_attr_t *a1)
{
  return _pthread_attr_init(a1);
}

int pthread_attr_set_qos_class_np(pthread_attr_t *__attr, qos_class_t __qos_class, int __relative_priority)
{
  return _pthread_attr_set_qos_class_np(__attr, __qos_class, __relative_priority);
}

int pthread_attr_setdetachstate(pthread_attr_t *a1, int a2)
{
  return _pthread_attr_setdetachstate(a1, a2);
}

int pthread_cond_broadcast(pthread_cond_t *a1)
{
  return _pthread_cond_broadcast(a1);
}

int pthread_cond_destroy(pthread_cond_t *a1)
{
  return _pthread_cond_destroy(a1);
}

int pthread_cond_init(pthread_cond_t *a1, const pthread_condattr_t *a2)
{
  return _pthread_cond_init(a1, a2);
}

int pthread_cond_signal(pthread_cond_t *a1)
{
  return _pthread_cond_signal(a1);
}

int pthread_cond_timedwait(pthread_cond_t *a1, pthread_mutex_t *a2, const timespec *a3)
{
  return _pthread_cond_timedwait(a1, a2, a3);
}

int pthread_cond_wait(pthread_cond_t *a1, pthread_mutex_t *a2)
{
  return _pthread_cond_wait(a1, a2);
}

int pthread_create(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return _pthread_create(a1, a2, a3, a4);
}

void pthread_exit(void *a1)
{
}

void *__cdecl pthread_getspecific(pthread_key_t a1)
{
  return _pthread_getspecific(a1);
}

int pthread_join(pthread_t a1, void **a2)
{
  return _pthread_join(a1, a2);
}

int pthread_key_create(pthread_key_t *a1, void (__cdecl *a2)(void *))
{
  return _pthread_key_create(a1, a2);
}

mach_port_t pthread_mach_thread_np(pthread_t a1)
{
  return _pthread_mach_thread_np(a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return _pthread_mutex_init(a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return _pthread_mutex_lock(a1);
}

int pthread_mutex_trylock(pthread_mutex_t *a1)
{
  return _pthread_mutex_trylock(a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return _pthread_mutex_unlock(a1);
}

int pthread_rwlock_init(pthread_rwlock_t *a1, const pthread_rwlockattr_t *a2)
{
  return _pthread_rwlock_init(a1, a2);
}

int pthread_rwlock_rdlock(pthread_rwlock_t *a1)
{
  return _pthread_rwlock_rdlock(a1);
}

int pthread_rwlock_unlock(pthread_rwlock_t *a1)
{
  return _pthread_rwlock_unlock(a1);
}

int pthread_rwlock_wrlock(pthread_rwlock_t *a1)
{
  return _pthread_rwlock_wrlock(a1);
}

pthread_t pthread_self(void)
{
  return _pthread_self();
}

int pthread_setname_np(const char *a1)
{
  return _pthread_setname_np(a1);
}

int pthread_setspecific(pthread_key_t a1, const void *a2)
{
  return _pthread_setspecific(a1, a2);
}

int pthread_setugid_np(uid_t a1, gid_t a2)
{
  return _pthread_setugid_np(a1, a2);
}

void qsort(void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return _read(a1, a2, a3);
}

dirent *__cdecl readdir(DIR *a1)
{
  return _readdir(a1);
}

int rmdir(const char *a1)
{
  return _rmdir(a1);
}

uint64_t sandbox_check_by_audit_token()
{
  return _sandbox_check_by_audit_token();
}

int setiopolicy_np(int a1, int a2, int a3)
{
  return _setiopolicy_np(a1, a2, a3);
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

int statfs(const char *a1, statfs *a2)
{
  return _statfs(a1, a2);
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

size_t strlcat(char *__dst, const char *__source, size_t __size)
{
  return _strlcat(__dst, __source, __size);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return _strlcpy(__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return _strncmp(__s1, __s2, __n);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return _strncpy(__dst, __src, __n);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return _strnlen(__s1, __n);
}

char *__cdecl strnstr(const char *__big, const char *__little, size_t __len)
{
  return _strnstr(__big, __little, __len);
}

char *__cdecl strrchr(char *__s, int __c)
{
  return _strrchr(__s, __c);
}

char *__cdecl strstr(char *__s1, const char *__s2)
{
  return _strstr(__s1, __s2);
}

unint64_t strtoull(const char *__str, char **__endptr, int __base)
{
  return _strtoull(__str, __endptr, __base);
}

int syscall(int a1, ...)
{
  return _syscall(a1);
}

kern_return_t thread_info(thread_inspect_t target_act, thread_flavor_t flavor, thread_info_t thread_info_out, mach_msg_type_number_t *thread_info_outCnt)
{
  return _thread_info(target_act, flavor, thread_info_out, thread_info_outCnt);
}

kern_return_t thread_policy_get(thread_inspect_t thread, thread_policy_flavor_t flavor, thread_policy_t policy_info, mach_msg_type_number_t *policy_infoCnt, BOOLean_t *get_default)
{
  return _thread_policy_get(thread, flavor, policy_info, policy_infoCnt, get_default);
}

kern_return_t thread_policy_set(thread_act_t thread, thread_policy_flavor_t flavor, thread_policy_t policy_info, mach_msg_type_number_t policy_infoCnt)
{
  return _thread_policy_set(thread, flavor, policy_info, policy_infoCnt);
}

time_t time(time_t *a1)
{
  return _time(a1);
}

int unlink(const char *a1)
{
  return _unlink(a1);
}

int usleep(useconds_t a1)
{
  return _usleep(a1);
}

int utimes(const char *a1, const timeval *a2)
{
  return _utimes(a1, a2);
}

void uuid_generate(uuid_t out)
{
}

int uuid_parse(const uuid_string_t in, uuid_t uu)
{
  return _uuid_parse(in, uu);
}

void uuid_unparse(const uuid_t uu, uuid_string_t out)
{
}

kern_return_t vm_allocate(vm_map_t target_task, vm_address_t *address, vm_size_t size, int flags)
{
  return _vm_allocate(target_task, address, size, flags);
}

kern_return_t vm_deallocate(vm_map_t target_task, vm_address_t address, vm_size_t size)
{
  return _vm_deallocate(target_task, address, size);
}

BOOLean_t voucher_mach_msg_set(mach_msg_header_t *msg)
{
  return _voucher_mach_msg_set(msg);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return _write(__fd, __buf, __nbyte);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return _xpc_dictionary_create(keys, values, count);
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}