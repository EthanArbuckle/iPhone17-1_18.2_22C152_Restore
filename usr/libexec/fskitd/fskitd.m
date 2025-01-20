uint64_t sub_1000031DC(int a1, id a2, _OWORD *a3)
{
  const char *v5;
  const char *v6;
  size_t v7;
  int v9;

  v5 = (const char *)[a2 UTF8String];
  v6 = v5;
  *a3 = 0u;
  a3[1] = 0u;
  a3[2] = 0u;
  a3[3] = 0u;
  if (a1 || *v5 != 47)
  {
    v7 = strlen(v5);
    memcpy((char *)a3 + 4, v6, v7);
  }
  else
  {
    v9 = 0;
    sscanf(v5 + 1, "%x", &v9);
    *((_DWORD *)a3 + 1) = v9;
    a1 = -1;
  }
  *(_DWORD *)a3 = a1;
  return 0;
}

id sub_10000328C(unsigned int *a1, _DWORD *a2, void *a3, int *a4, uint64_t a5)
{
  *a4 = 0;
  uint64_t v9 = *a1;
  *a2 = v9;
  uint64_t v10 = v9;
  if (v9 == -1)
  {
    uint64_t v10 = a1[1];
    *a2 = v10;
  }
  id v11 = [(id)qword_100060780 lookup:v10];
  v12 = v11;
  *a3 = v11;
  *a4 = 70;
  if (!v11)
  {
    id v13 = 0;
    id v14 = 0;
    v15 = 0;
    goto LABEL_17;
  }
  if (objc_msgSend(v11, "is_killing_io"))
  {
    id v13 = 0;
    id v14 = 0;
    v15 = 0;
    int v16 = 5;
LABEL_16:
    *a4 = v16;
    goto LABEL_17;
  }
  if (v9 != -1)
  {
    id v37 = 0;
    unsigned __int8 v17 = [v12 ensureConnected:0 status:&v37];
    id v14 = v37;
    if (v17)
    {
      *a4 = 0;
      v15 = +[NSString stringWithUTF8String:a1 + 1];
      id v13 = 0;
      goto LABEL_17;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10003A2D4((uint64_t)v14, v21, v22, v23, v24, v25, v26, v27);
    }
    id v13 = 0;
    v15 = 0;
    int v16 = 57;
    goto LABEL_16;
  }
  id v38 = 0;
  unsigned __int8 v18 = [v12 ensureConnected:a5 status:&v38];
  id v19 = v38;
  id v14 = v19;
  if (v18)
  {
    v20 = [v12 rootLIFileHandle];
    if (v20)
    {
      *a4 = 0;
      id v13 = v20;
      v15 = v13;
      goto LABEL_17;
    }
    BOOL v29 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v29) {
      sub_10003A298(v29, v30, v31, v32, v33, v34, v35, v36);
    }
    id v13 = 0;
    v15 = 0;
    int v16 = 70;
    goto LABEL_16;
  }
  id v13 = 0;
  v15 = 0;
  if (!v19) {
    *a4 = 0;
  }
LABEL_17:

  return v15;
}

uint64_t sub_10000347C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, __int16 a5, int a6, unsigned int *a7)
{
  long long v47 = 0u;
  memset(v48, 0, 496);
  v12 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:");
  id v13 = +[NSString stringWithUTF8String:a4];
  int v46 = 0;
  uint64_t v42 = 0;
  v43 = &v42;
  uint64_t v44 = 0x2020000000;
  v45[0] = 0;
  if (a6)
  {
    id v41 = 0;
    id v14 = sub_10000328C(a7, &v46, &v41, v45, 0);
    id v15 = v41;
    if (v15) {
      goto LABEL_3;
    }
LABEL_16:
    BOOL v29 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v29) {
      sub_10003A348(v29, v30, v31, v32, v33, v34, v35, v36);
    }
    int v16 = 0;
    int v24 = 22;
    goto LABEL_19;
  }
  BOOL v27 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO);
  if ((a5 & 0x400) != 0)
  {
    v28 = v12;
    if (v27)
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "mounting detached lifs mount", (uint8_t *)buf, 2u);
      v28 = v12;
    }
  }
  else
  {
    v28 = v13;
    if (v27)
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "mounting lifs mount", (uint8_t *)buf, 2u);
      v28 = v13;
    }
  }
  id v15 = [(id)qword_100060780 lookupByPath:v28];
  id v14 = 0;
  if (!v15) {
    goto LABEL_16;
  }
LABEL_3:
  if ((objc_msgSend(v15, "is_connected") & 1) == 0)
  {
    int v16 = [v15 connect];
    if (v16)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_10003A384((uint64_t)v16, v17, v18, v19, v20, v21, v22, v23);
      }
      int v24 = 61;
LABEL_19:
      uint64_t v26 = 0;
      uint64_t v25 = 0;
      *((_DWORD *)v43 + 6) = v24;
      goto LABEL_22;
    }
  }
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472;
  v40[2] = sub_1000038E4;
  v40[3] = &unk_100058868;
  v40[4] = &v42;
  uint64_t v25 = [v15 fsSynchObjWithErrorHandler:v40];
  if (v25)
  {
    uint64_t v26 = [v15 rootLIFileHandle];
    sub_1000031DC((int)[v15 midx], v26, v48);
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472;
    v39[2] = sub_100003940;
    v39[3] = &unk_100058890;
    v39[4] = &v42;
    v39[5] = &v47;
    [v25 fileAttributes:v26 requestID:-1 reply:v39];
  }
  else
  {
    uint64_t v26 = 0;
  }
  int v16 = 0;
LABEL_22:
  int v37 = *((_DWORD *)v43 + 6);
  if (v37)
  {
    memset(buf, 0, 512);
    sub_1000039F4(a2, v37, 2, (uint64_t *)buf);
  }
  else
  {
    sub_1000039F4(a2, 0, 25, (uint64_t *)&v47);
  }
  _Block_object_dispose(&v42, 8);

  return 0;
}

void sub_1000038C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000038E4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10003A3F8((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 22;
}

void sub_100003940(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  if (!a2)
  {
    if (v5)
    {
      id v19 = v5;
      BOOL v6 = (unint64_t)[v5 length] >= 0xB8;
      id v5 = v19;
      if (v6)
      {
        uint64_t v7 = *(void *)(a1 + 40);
        uint64_t v8 = [v19 bytes];
        long long v9 = v8[3];
        long long v11 = *v8;
        long long v10 = v8[1];
        *(_OWORD *)(v7 + 112) = v8[2];
        *(_OWORD *)(v7 + 128) = v9;
        *(_OWORD *)(v7 + 80) = v11;
        *(_OWORD *)(v7 + 96) = v10;
        long long v12 = v8[7];
        long long v14 = v8[4];
        long long v13 = v8[5];
        *(_OWORD *)(v7 + 176) = v8[6];
        *(_OWORD *)(v7 + 192) = v12;
        *(_OWORD *)(v7 + 144) = v14;
        *(_OWORD *)(v7 + 160) = v13;
        long long v16 = v8[9];
        long long v15 = v8[10];
        uint64_t v17 = *((void *)v8 + 22);
        long long v18 = v8[8];
        id v5 = v19;
        *(void *)(v7 + 256) = v17;
        *(_OWORD *)(v7 + 224) = v16;
        *(_OWORD *)(v7 + 240) = v15;
        *(_OWORD *)(v7 + 208) = v18;
      }
    }
  }
}

void sub_1000039F4(uint64_t a1, int a2, int a3, uint64_t *a4)
{
  *a4 = a1;
  *((_DWORD *)a4 + 2) = a2;
  unsigned int v6 = [qword_100060738 callStructMethod:v1 inStruct:v2 inSize:v3 outStruct:v4 outStructSize:v5];
  if (v6)
  {
    unsigned int v7 = v6;
    uint64_t v8 = livefs_std_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = *a4;
      *(_DWORD *)buf = 136315906;
      long long v11 = "lifs_send_reply";
      __int16 v12 = 1024;
      int v13 = a3;
      __int16 v14 = 2048;
      uint64_t v15 = v9;
      __int16 v16 = 1024;
      unsigned int v17 = v7;
      _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%s: Failed to send reply with selector: %u reqid: %llu status: %d", buf, 0x22u);
    }
  }
}

uint64_t sub_100003B00(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int *a4)
{
  int v31 = 0;
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x2020000000;
  v30[0] = 0;
  id v26 = 0;
  id v5 = sub_10000328C(a4, &v31, &v26, v30, 0);
  id v6 = v26;
  unsigned int v7 = v6;
  if (*((_DWORD *)v28 + 6)) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    if (!v6)
    {
      uint64_t v9 = livefs_std_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_10003A46C(v9, v10, v11, v12, v13, v14, v15, v16);
      }
      goto LABEL_17;
    }
  }
  else if ([v6 currentState] == (id)2)
  {
    *((_DWORD *)v28 + 6) = 0;
  }
  unsigned int v17 = livefs_std_log();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    unsigned int v22 = [v7 mnt_flags];
    unsigned int v23 = [v7 is_in_unmount_method];
    unsigned int v24 = [v7 is_killing_io];
    *(_DWORD *)buf = 67109632;
    *(_DWORD *)&uint8_t buf[4] = v22;
    *(_WORD *)&buf[8] = 1024;
    *(_DWORD *)&buf[10] = v23;
    *(_WORD *)&buf[14] = 1024;
    LODWORD(v33) = v24;
    _os_log_debug_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "Unmount callback fired flags %x, is_in_unmount %d killing %d", buf, 0x14u);
  }

  if ((objc_msgSend(v7, "mnt_flags") & 0x100) != 0
    && (objc_msgSend(v7, "is_in_unmount_method") & 1) == 0)
  {
    uint64_t v9 = v7;
    objc_sync_enter(v9);
    if ([v9 is_in_unmount_method])
    {
      objc_sync_exit(v9);
LABEL_17:

      goto LABEL_22;
    }
    if (([v9 mnt_flags] & 0x200) != 0)
    {
      [v9 setIs_killing_io:1];
      uint64_t v18 = 6;
    }
    else
    {
      uint64_t v18 = 2;
    }
    [v9 setIs_in_unmount_syscall:1];
    objc_sync_exit(v9);

    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_100003E78;
    v25[3] = &unk_1000588B8;
    v25[4] = &v27;
    +[fskitdXPCServer LiveMounterDoUnmountPreflight:v9 how:v18 reply:v25];
  }
LABEL_22:
  id v19 = v7;
  objc_sync_enter(v19);
  if (objc_msgSend(v19, "is_in_unmount_syscall")) {
    [v19 setIs_in_unmount_syscall:0];
  }
  objc_sync_exit(v19);

  int v20 = *((_DWORD *)v28 + 6);
  if (!v20)
  {
    int v20 = -1;
    *((_DWORD *)v28 + 6) = -1;
  }
  long long v62 = 0u;
  long long v63 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v35 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  *(_OWORD *)buf = 0u;
  sub_1000039F4(a2, v20, 2, (uint64_t *)buf);
  _Block_object_dispose(&v27, 8);

  return 0;
}

void sub_100003E30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100003E78(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  unsigned int v7 = livefs_std_log();
  BOOL v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10003A4A4();
    }

    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 22;
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v9 = 138412546;
      uint64_t v10 = 0;
      __int16 v11 = 2112;
      id v12 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "spontaneous unmount done with error %@ name %@", (uint8_t *)&v9, 0x16u);
    }
  }
}

uint64_t sub_100003F88(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int *a4)
{
  id v22 = 0;
  uint64_t v23 = 0;
  id v5 = sub_10000328C(a4, (_DWORD *)&v23 + 1, &v22, (int *)&v23, 0);
  id v6 = v22;
  unsigned int v7 = v6;
  if (!v6)
  {
    int v9 = livefs_std_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10003A46C(v9, v10, v11, v12, v13, v14, v15, v16);
    }

    goto LABEL_7;
  }
  if ((objc_msgSend(v6, "mnt_flags") & 0x100) == 0)
  {
LABEL_7:
    memset(v24, 0, 512);
    sub_1000039F4(a2, v23, 2, (uint64_t *)v24);
    goto LABEL_8;
  }
  BOOL v8 = qword_100060730;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100004138;
  block[3] = &unk_100058920;
  id v19 = v7;
  uint64_t v20 = a2;
  int v21 = 2;
  dispatch_async(v8, block);

LABEL_8:
  return 0;
}

void sub_100004138(uint64_t a1)
{
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = sub_1000043DC;
  uint64_t v15 = sub_1000043EC;
  id v16 = 0;
  if ([*(id *)(a1 + 32) isFSKitModule])
  {
    v2 = *(void **)(a1 + 32);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000043F4;
    v10[3] = &unk_100058868;
    v10[4] = &v11;
    [v2 forgetModuleVolumeWithFlags:2 reply:v10];
  }
  else
  {
    id v3 = [*(id *)(a1 + 32) providerName];
    uint64_t v4 = [*(id *)(a1 + 32) volumeName];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100004404;
    v9[3] = &unk_100058868;
    v9[4] = &v11;
    +[LIFSClientConnector forgetLiveFilesVolumeForProvider:v3 volume:v4 withFlags:2 handler:v9];
  }
  if (v12[5])
  {
    id v5 = livefs_std_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = v12[5];
      unsigned int v7 = [*(id *)(a1 + 32) volumeName];
      sub_10003A50C(v6, v7, buf, v5);
    }
  }
  uint64_t v8 = *(void *)(a1 + 40);
  memset(v18, 0, 512);
  sub_1000039F4(v8, 0, 2, (uint64_t *)v18);
  +[fskitdXPCServer LiveMounterDoUnmountCleanup:*(void *)(a1 + 32) how:*(unsigned int *)(a1 + 48) reply:&stru_1000588F8];
  _Block_object_dispose(&v11, 8);
}

void sub_1000043B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000043DC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1000043EC(uint64_t a1)
{
}

void sub_1000043F4(uint64_t a1, void *a2)
{
}

void sub_100004404(uint64_t a1, void *a2)
{
}

void sub_100004414(id a1, NSError *a2, NSString *a3)
{
  uint64_t v4 = a2;
  id v5 = a3;
  uint64_t v6 = livefs_std_log();
  unsigned int v7 = v6;
  if (v4)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10003A574();
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v8 = 138412546;
    uint64_t v9 = 0;
    __int16 v10 = 2112;
    uint64_t v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "spontaneous unmount cleanup done with error %@ name %@", (uint8_t *)&v8, 0x16u);
  }
}

uint64_t sub_100004508(uint64_t a1, uint64_t a2, unsigned int *a3)
{
  id v18 = 0;
  uint64_t v19 = 0;
  uint64_t v4 = sub_10000328C(a3, (_DWORD *)&v19 + 1, &v18, (int *)&v19, 0);
  id v5 = v18;
  uint64_t v6 = v5;
  if (!v5)
  {
    __int16 v10 = livefs_std_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10003A5DC();
    }

    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v11 = a2;
    int v12 = 22;
    goto LABEL_10;
  }
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100004798;
  v16[3] = &unk_100058940;
  int v17 = HIDWORD(v19);
  v16[4] = a2;
  uint64_t v7 = [v5 fsObjWithErrorHandler:v16];
  if (!v7)
  {
    uint64_t v13 = livefs_std_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_10003A650();
    }

    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v11 = a2;
    int v12 = 5;
LABEL_10:
    sub_1000039F4(v11, v12, 2, (uint64_t *)&v20);
    goto LABEL_11;
  }
  int v8 = (void *)v7;
  uint64_t v9 = [v6 rootLIFileHandle];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10000488C;
  v15[3] = &unk_100058960;
  v15[4] = a2;
  [v8 volumeStatistics:v9 requestID:a2 reply:v15];

LABEL_11:
  return 0;
}

void sub_100004798(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = livefs_std_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_10003A6C4();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  memset(v6, 0, 512);
  sub_1000039F4(v5, 5, 2, (uint64_t *)v6);
}

void sub_10000488C(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = v5;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  if (!a2
    && v5
    && (unint64_t)objc_msgSend(v5, "length", v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25, v26,
                           v27,
                           v28,
                           v29,
                           v30,
                           v31,
                           v32,
                           v33,
                           v34,
                           v35,
                           v36,
                           v37,
                           v38,
                           v39,
                           (void)v40) >= 0x28)
  {
    uint64_t v7 = [v6 bytes];
    uint64_t v8 = v7[4];
    long long v9 = *((_OWORD *)v7 + 1);
    long long v11 = *(_OWORD *)v7;
    long long v12 = v9;
    *(void *)&long long v13 = v8;
  }
  sub_1000039F4(*(void *)(a1 + 32), a2, 3, (uint64_t *)&v10);
}

uint64_t sub_100004988(uint64_t a1, uint64_t a2, unsigned int *a3, uint64_t a4)
{
  id v22 = 0;
  uint64_t v23 = 0;
  uint64_t v6 = sub_10000328C(a3, (_DWORD *)&v23 + 1, &v22, (int *)&v23, 0);
  id v7 = v22;
  uint64_t v8 = v7;
  if (!v7)
  {
    long long v12 = livefs_std_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10003A738();
    }

    int v13 = v23;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    uint64_t v14 = a2;
    goto LABEL_10;
  }
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100004C30;
  v20[3] = &unk_100058940;
  int v21 = HIDWORD(v23);
  v20[4] = a2;
  uint64_t v9 = [v7 fsObjWithErrorHandler:v20];
  if (!v9)
  {
    long long v15 = livefs_std_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_10003A7AC();
    }

    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    uint64_t v14 = a2;
    int v13 = 5;
LABEL_10:
    sub_1000039F4(v14, v13, 2, (uint64_t *)&v24);
    goto LABEL_11;
  }
  long long v10 = (void *)v9;
  +[FSFileName nameWithCString:a4];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100004D24;
  v17[3] = &unk_100058988;
  id v18 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v19 = a2;
  id v11 = v18;
  [v10 otherAttributeOf:v6 named:v11 requestID:a2 reply:v17];

LABEL_11:
  return 0;
}

void sub_100004C30(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = livefs_std_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_10003A820();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  memset(v6, 0, 512);
  sub_1000039F4(v5, 5, 2, (uint64_t *)v6);
}

void sub_100004D24(uint64_t a1, int a2, void *a3)
{
  long long v18 = 0u;
  long long v19 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "data", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0);
  id v6 = objc_claimAutoreleasedReturnValue();
  id v7 = [v6 bytes];

  id v8 = a3;
  uint64_t v9 = (unsigned __int8 *)[v8 bytes];
  if (!v8) {
    goto LABEL_16;
  }
  if (*v7 == 95)
  {
    long long v10 = v9;
    unsigned int v11 = v7[1];
    int v12 = 45;
    if (v11 > 0x4E)
    {
      if (v11 == 79 || v11 == 83)
      {
        LODWORD(v16) = [v8 length];
        *(void *)&long long v17 = v10;
        if (*v7 == 95 && v7[1] == 83) {
          int v13 = 3;
        }
        else {
          int v13 = 2;
        }
        int v15 = v13;
        goto LABEL_16;
      }
    }
    else
    {
      if (v11 == 66)
      {
        int v15 = 0;
        LODWORD(v16) = *v9;
        goto LABEL_16;
      }
      if (v11 == 78)
      {
        int v15 = 1;
        uint64_t v16 = *(void *)v9;
LABEL_16:
        int v12 = a2;
      }
    }
  }
  else
  {
    int v12 = 45;
  }
  sub_1000039F4(*(void *)(a1 + 40), v12, 23, (uint64_t *)&v14);
}

uint64_t sub_100004EC4(uint64_t a1, uint64_t a2, unsigned int *a3, const char *a4, const char *a5, unsigned int a6)
{
  id v36 = 0;
  uint64_t v37 = 0;
  long long v10 = sub_10000328C(a3, (_DWORD *)&v37 + 1, &v36, (int *)&v37, 0);
  id v11 = v36;
  int v12 = v11;
  if (v11)
  {
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_100005358;
    v34[3] = &unk_100058940;
    int v35 = HIDWORD(v37);
    v34[4] = a2;
    uint64_t v13 = [v11 fsObjWithErrorHandler:v34];
    if (v13)
    {
      long long v14 = (void *)v13;
      int v15 = strcmp("_S_f_vol_name", a4);
      BOOL v16 = v15 == 0;
      uint64_t v17 = a6;
      if (v15)
      {
        id v18 = 0;
      }
      else
      {
        id v18 = [objc_alloc((Class)NSString) initWithBytes:a5 length:strnlen(a5, a6) encoding:4];
        if (!v18)
        {
          long long v68 = 0u;
          long long v69 = 0u;
          long long v66 = 0u;
          long long v67 = 0u;
          long long v64 = 0u;
          long long v65 = 0u;
          long long v62 = 0u;
          long long v63 = 0u;
          long long v60 = 0u;
          long long v61 = 0u;
          long long v58 = 0u;
          long long v59 = 0u;
          long long v56 = 0u;
          long long v57 = 0u;
          long long v54 = 0u;
          long long v55 = 0u;
          long long v52 = 0u;
          long long v53 = 0u;
          long long v50 = 0u;
          long long v51 = 0u;
          long long v48 = 0u;
          long long v49 = 0u;
          long long v46 = 0u;
          long long v47 = 0u;
          long long v44 = 0u;
          long long v45 = 0u;
          long long v42 = 0u;
          long long v43 = 0u;
          long long v40 = 0u;
          long long v41 = 0u;
          long long v38 = 0u;
          long long v39 = 0u;
          sub_1000039F4(a2, 22, 2, (uint64_t *)&v38);
          goto LABEL_21;
        }
      }
      uint64_t v23 = +[NSData dataWithBytes:a5 length:v17];
      long long v24 = +[FSFileName nameWithCString:a4];
      long long v25 = [v24 string];
      if ([v25 isEqual:@"_N_SYNC"])
      {
        uint64_t v26 = *(void *)a5;

        if ((v26 & 2) != 0)
        {
          long long v68 = 0u;
          long long v69 = 0u;
          long long v66 = 0u;
          long long v67 = 0u;
          long long v64 = 0u;
          long long v65 = 0u;
          long long v62 = 0u;
          long long v63 = 0u;
          long long v60 = 0u;
          long long v61 = 0u;
          long long v58 = 0u;
          long long v59 = 0u;
          long long v56 = 0u;
          long long v57 = 0u;
          long long v54 = 0u;
          long long v55 = 0u;
          long long v52 = 0u;
          long long v53 = 0u;
          long long v50 = 0u;
          long long v51 = 0u;
          long long v48 = 0u;
          long long v49 = 0u;
          long long v46 = 0u;
          long long v47 = 0u;
          long long v44 = 0u;
          long long v45 = 0u;
          long long v42 = 0u;
          long long v43 = 0u;
          long long v40 = 0u;
          long long v41 = 0u;
          long long v38 = 0u;
          long long v39 = 0u;
          long long v27 = livefs_std_log();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
            sub_10003A97C(v27);
          }

          [v14 setOtherAttributeOf:v10 named:v24 value:v23 requestID:a2 reply:&stru_1000589C8];
          LODWORD(v55) = 0;
          sub_1000039F4(a2, 0, 22, (uint64_t *)&v38);
          goto LABEL_20;
        }
      }
      else
      {
      }
      v29[0] = _NSConcreteStackBlock;
      v29[1] = 3221225472;
      v29[2] = sub_100005450;
      v29[3] = &unk_100058A58;
      BOOL v33 = v16;
      uint64_t v32 = a2;
      id v30 = v12;
      id v31 = v18;
      [v14 setOtherAttributeOf:v10 named:v24 value:v23 requestID:a2 reply:v29];

LABEL_20:
LABEL_21:

      goto LABEL_22;
    }
    id v22 = livefs_std_log();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_10003A908();
    }

    long long v68 = 0u;
    long long v69 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    uint64_t v21 = a2;
    int v20 = 5;
  }
  else
  {
    long long v19 = livefs_std_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_10003A894();
    }

    int v20 = v37;
    long long v68 = 0u;
    long long v69 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    uint64_t v21 = a2;
  }
  sub_1000039F4(v21, v20, 2, (uint64_t *)&v38);
LABEL_22:

  return 0;
}

void sub_100005358(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = livefs_std_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_10003AA00();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  memset(v6, 0, 512);
  sub_1000039F4(v5, 5, 2, (uint64_t *)v6);
}

void sub_100005450(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7 = a4;
  memset(v16, 0, 512);
  if (a2) {
    goto LABEL_2;
  }
  if (a3 && [a3 length])
  {
    LODWORD(v16[17]) = [a3 length];
    [a3 bytes];
    __memcpy_chk();
  }
  if (v7) {
    *(_OWORD *)((char *)&v16[17] + 8) = *(_OWORD *)[v7 bytes];
  }
  else {
    *(void *)&v16[18] = 0;
  }
  if (!*(unsigned char *)(a1 + 56))
  {
LABEL_2:
    sub_1000039F4(*(void *)(a1 + 48), a2, 22, (uint64_t *)v16);
  }
  else
  {
    id v8 = dispatch_get_global_queue(2, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100005650;
    block[3] = &unk_100058A30;
    uint64_t v9 = *(void *)(a1 + 48);
    int v15 = 0;
    uint64_t v13 = v9;
    long long v14 = v16;
    id v11 = *(id *)(a1 + 32);
    id v12 = *(id *)(a1 + 40);
    dispatch_async(v8, block);
  }
}

id sub_100005650(uint64_t a1)
{
  sub_1000039F4(*(void *)(a1 + 48), *(_DWORD *)(a1 + 64), 22, *(uint64_t **)(a1 + 56));
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);

  return [v2 renameToName:v3 reply:&stru_100058A08];
}

void sub_1000056A4(id a1, NSError *a2)
{
  v2 = a2;
  if (v2)
  {
    uint64_t v3 = livefs_std_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 138412290;
      uint64_t v5 = v2;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Error setting volume name: %@", (uint8_t *)&v4, 0xCu);
    }
  }
}

uint64_t sub_100005754(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _DWORD *a5)
{
  *a5 = 45;
  return 0;
}

uint64_t sub_100005764(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int *a4, uint64_t a5)
{
  id v8 = +[NSData dataWithBytes:a5 length:184];
  uint64_t v9 = +[FSFileName nameWithCString:a3];
  id v24 = 0;
  uint64_t v25 = 0;
  long long v10 = sub_10000328C(a4, (_DWORD *)&v25 + 1, &v24, (int *)&v25, 0);
  id v11 = v24;
  id v12 = v11;
  if (!v11)
  {
    int v15 = livefs_std_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_10003AA74();
    }

    int v16 = v25;
    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    uint64_t v17 = a2;
    goto LABEL_10;
  }
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100005A34;
  v22[3] = &unk_100058940;
  int v23 = HIDWORD(v25);
  v22[4] = a2;
  uint64_t v13 = [v11 fsObjWithErrorHandler:v22];
  if (!v13)
  {
    id v18 = livefs_std_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_10003AAE8();
    }

    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    uint64_t v17 = a2;
    int v16 = 5;
LABEL_10:
    sub_1000039F4(v17, v16, 2, (uint64_t *)&v26);
    goto LABEL_11;
  }
  long long v14 = v13;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100005B28;
  v20[3] = &unk_100058A78;
  int v21 = HIDWORD(v25);
  v20[4] = a2;
  [v13 makeDirectoryIn:v10 named:v9 attributes:v8 requestID:a2 reply:v20];

LABEL_11:
  return 0;
}

void sub_100005A34(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = livefs_std_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_10003AB5C();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  memset(v6, 0, 512);
  sub_1000039F4(v5, 5, 2, (uint64_t *)v6);
}

void sub_100005B28(uint64_t a1, int a2, void *a3, void *a4, void *a5, uint64_t a6, void *a7)
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a7;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  memset(v51, 0, sizeof(v51));
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  if (!a2)
  {
    sub_1000031DC(*(_DWORD *)(a1 + 40), a4, &v36);
    if (v13
      && (unint64_t)objc_msgSend(v13, "length", v35, v36, v37, v38, v39, v40, v41, v42, v43, v44, v45, v46, v47, v48, v49, v50, v51[0],
                             v51[1],
                             v51[2],
                             v51[3],
                             v51[4],
                             v51[5],
                             v51[6],
                             v51[7],
                             v51[8],
                             v51[9],
                             v51[10],
                             v51[11],
                             v52,
                             v53,
                             (void)v54) >= 0xB8)
    {
      int v15 = [v13 bytes];
      long long v16 = v15[3];
      long long v18 = *v15;
      long long v17 = v15[1];
      long long v42 = v15[2];
      long long v43 = v16;
      long long v40 = v18;
      long long v41 = v17;
      long long v19 = v15[7];
      long long v21 = v15[4];
      long long v20 = v15[5];
      long long v46 = v15[6];
      long long v47 = v19;
      long long v44 = v21;
      long long v45 = v20;
      long long v23 = v15[9];
      long long v22 = v15[10];
      long long v24 = v15[8];
      *(void *)&v51[0] = *((void *)v15 + 22);
      long long v49 = v23;
      long long v50 = v22;
      long long v48 = v24;
      if (!v12) {
        goto LABEL_10;
      }
    }
    else
    {
      *(void *)&v51[0] = 0;
      long long v49 = 0u;
      long long v50 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      long long v40 = 0u;
      if (!v12) {
        goto LABEL_10;
      }
    }
    if ((unint64_t)objc_msgSend(v12, "length", v35, v36, v37, v38, v39, v40, v41, v42, v43, v44, v45, v46, v47, v48, v49, v50, *(void *)&v51[0]) >= 0xB8)
    {
      uint64_t v25 = [v12 bytes];
      long long v26 = v25[3];
      long long v28 = *v25;
      long long v27 = v25[1];
      *(_OWORD *)((char *)&v51[2] + 8) = v25[2];
      *(_OWORD *)((char *)&v51[3] + 8) = v26;
      *(_OWORD *)((char *)v51 + 8) = v28;
      *(_OWORD *)((char *)&v51[1] + 8) = v27;
      long long v29 = v25[7];
      long long v31 = v25[4];
      long long v30 = v25[5];
      *(_OWORD *)((char *)&v51[6] + 8) = v25[6];
      *(_OWORD *)((char *)&v51[7] + 8) = v29;
      *(_OWORD *)((char *)&v51[4] + 8) = v31;
      *(_OWORD *)((char *)&v51[5] + 8) = v30;
      uint64_t v32 = *((void *)v25 + 22);
      long long v33 = v25[10];
      long long v34 = v25[8];
      *(_OWORD *)((char *)&v51[9] + 8) = v25[9];
      *(_OWORD *)((char *)&v51[10] + 8) = v33;
      *(_OWORD *)((char *)&v51[8] + 8) = v34;
      *((void *)&v51[11] + 1) = v32;
      if (v14)
      {
LABEL_11:
        long long v52 = *(_OWORD *)[v14 bytes];
        goto LABEL_12;
      }
      goto LABEL_9;
    }
LABEL_10:
    memset((char *)v51 + 8, 0, 184);
    if (v14) {
      goto LABEL_11;
    }
LABEL_9:
    *((void *)&v52 + 1) = 0;
  }
LABEL_12:
  sub_1000039F4(*(void *)(a1 + 32), a2, 5, (uint64_t *)&v35);
}

uint64_t sub_100005D68(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int *a4, uint64_t a5)
{
  id v8 = +[NSData dataWithBytes:a5 length:184];
  uint64_t v9 = +[FSFileName nameWithCString:a3];
  id v24 = 0;
  uint64_t v25 = 0;
  long long v10 = sub_10000328C(a4, (_DWORD *)&v25 + 1, &v24, (int *)&v25, 0);
  id v11 = v24;
  id v12 = v11;
  if (!v11)
  {
    int v15 = livefs_std_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_10003ABD0();
    }

    int v16 = v25;
    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    uint64_t v17 = a2;
    goto LABEL_10;
  }
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100006038;
  v22[3] = &unk_100058940;
  int v23 = HIDWORD(v25);
  v22[4] = a2;
  id v13 = [v11 fsObjWithErrorHandler:v22];
  if (!v13)
  {
    long long v18 = livefs_std_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_10003AC44();
    }

    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    uint64_t v17 = a2;
    int v16 = 5;
LABEL_10:
    sub_1000039F4(v17, v16, 2, (uint64_t *)&v26);
    goto LABEL_11;
  }
  id v14 = v13;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10000612C;
  v20[3] = &unk_100058A98;
  int v21 = HIDWORD(v25);
  v20[4] = a2;
  [v13 createIn:v10 named:v9 attributes:v8 requestID:a2 reply:v20];

LABEL_11:
  return 0;
}

void sub_100006038(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = livefs_std_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_10003ACB8();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  memset(v6, 0, 512);
  sub_1000039F4(v5, 5, 2, (uint64_t *)v6);
}

void sub_10000612C(uint64_t a1, int a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  memset(v51, 0, sizeof(v51));
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  if (!a2)
  {
    sub_1000031DC(*(_DWORD *)(a1 + 40), a4, &v36);
    if (v12)
    {
      id v14 = v12;
      int v15 = objc_msgSend(v14, "bytes", v35, v36, v37, v38, v39, v40, v41, v42, v43, v44, v45, v46, v47, v48, v49, v50, v51[0],
              v51[1],
              v51[2],
              v51[3],
              v51[4],
              v51[5],
              v51[6],
              v51[7],
              v51[8],
              v51[9],
              v51[10],
              v51[11],
              v52,
              v53,
              (void)v54);
      long long v16 = v15[3];
      long long v18 = *v15;
      long long v17 = v15[1];
      long long v42 = v15[2];
      long long v43 = v16;
      long long v40 = v18;
      long long v41 = v17;
      long long v19 = v15[7];
      long long v21 = v15[4];
      long long v20 = v15[5];
      long long v46 = v15[6];
      long long v47 = v19;
      long long v44 = v21;
      long long v45 = v20;
      long long v23 = v15[9];
      long long v22 = v15[10];
      long long v24 = v15[8];
      *(void *)&v51[0] = *((void *)v15 + 22);
      long long v49 = v23;
      long long v50 = v22;
      long long v48 = v24;
    }
    else
    {
      *(void *)&v51[0] = 0;
      long long v49 = 0u;
      long long v50 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      long long v40 = 0u;
    }
    if (v11)
    {
      uint64_t v25 = [v11 bytes];
      long long v26 = v25[3];
      long long v28 = *v25;
      long long v27 = v25[1];
      *(_OWORD *)((char *)&v51[2] + 8) = v25[2];
      *(_OWORD *)((char *)&v51[3] + 8) = v26;
      *(_OWORD *)((char *)v51 + 8) = v28;
      *(_OWORD *)((char *)&v51[1] + 8) = v27;
      long long v29 = v25[7];
      long long v31 = v25[4];
      long long v30 = v25[5];
      *(_OWORD *)((char *)&v51[6] + 8) = v25[6];
      *(_OWORD *)((char *)&v51[7] + 8) = v29;
      *(_OWORD *)((char *)&v51[4] + 8) = v31;
      *(_OWORD *)((char *)&v51[5] + 8) = v30;
      long long v33 = v25[9];
      long long v32 = v25[10];
      long long v34 = v25[8];
      *((void *)&v51[11] + 1) = *((void *)v25 + 22);
      *(_OWORD *)((char *)&v51[9] + 8) = v33;
      *(_OWORD *)((char *)&v51[10] + 8) = v32;
      *(_OWORD *)((char *)&v51[8] + 8) = v34;
      if (v13)
      {
LABEL_7:
        long long v52 = *(_OWORD *)[v13 bytes];
        goto LABEL_10;
      }
    }
    else
    {
      memset((char *)v51 + 8, 0, 184);
      if (v13) {
        goto LABEL_7;
      }
    }
    *((void *)&v52 + 1) = 0;
  }
LABEL_10:
  sub_1000039F4(*(void *)(a1 + 32), a2, 4, (uint64_t *)&v35);
}

uint64_t sub_100006344(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int *a4, unsigned int *a5, uint64_t a6, uint64_t a7)
{
  id v12 = +[NSData dataWithBytes:a7 length:184];
  id v13 = +[FSFileName nameWithCString:a3];
  id v30 = 0;
  uint64_t v31 = 0;
  id v14 = sub_10000328C(a5, (_DWORD *)&v31 + 1, &v30, (int *)&v31, 0);
  id v15 = v30;
  id v29 = v15;
  long long v16 = sub_10000328C(a4, (_DWORD *)&v31 + 1, &v29, (int *)&v31, 0);
  id v17 = v29;

  if (!v17)
  {
    long long v20 = livefs_std_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_10003AD2C();
    }

    int v21 = v31;
    long long v62 = 0u;
    long long v63 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v33 = 0u;
    long long v32 = 0u;
    uint64_t v22 = a2;
    goto LABEL_10;
  }
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_10000666C;
  v27[3] = &unk_100058940;
  int v28 = HIDWORD(v31);
  v27[4] = a2;
  long long v18 = [v17 fsObjWithErrorHandler:v27];
  if (!v18)
  {
    long long v23 = livefs_std_log();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      sub_10003ADA0();
    }

    long long v62 = 0u;
    long long v63 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v33 = 0u;
    long long v32 = 0u;
    uint64_t v22 = a2;
    int v21 = 5;
LABEL_10:
    sub_1000039F4(v22, v21, 2, (uint64_t *)&v32);
    goto LABEL_11;
  }
  long long v19 = v18;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_100006760;
  v25[3] = &unk_100058A98;
  int v26 = HIDWORD(v31);
  v25[4] = a2;
  [v18 makeCloneOf:v14 named:v13 inDirectory:v16 attributes:v12 usingFlags:a6 requestID:a2 reply:v25];

LABEL_11:
  return 0;
}

void sub_10000666C(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = livefs_std_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_10003AE14();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  memset(v6, 0, 512);
  sub_1000039F4(v5, 5, 2, (uint64_t *)v6);
}

void sub_100006760(uint64_t a1, int a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  memset(v50, 0, sizeof(v50));
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  if (!a2)
  {
    sub_1000031DC(*(_DWORD *)(a1 + 40), a4, &v35);
    if (v12
      && (unint64_t)objc_msgSend(v12, "length", v34, v35, v36, v37, v38, v39, v40, v41, v42, v43, v44, v45, v46, v47, v48, v49, v50[0],
                             v50[1],
                             v50[2],
                             v50[3],
                             v50[4],
                             v50[5],
                             v50[6],
                             v50[7],
                             v50[8],
                             v50[9],
                             v50[10],
                             v50[11],
                             v51,
                             v52,
                             (void)v53) >= 0xB8)
    {
      id v14 = [v12 bytes];
      long long v15 = v14[3];
      long long v17 = *v14;
      long long v16 = v14[1];
      long long v41 = v14[2];
      long long v42 = v15;
      long long v39 = v17;
      long long v40 = v16;
      long long v18 = v14[7];
      long long v20 = v14[4];
      long long v19 = v14[5];
      long long v45 = v14[6];
      long long v46 = v18;
      long long v43 = v20;
      long long v44 = v19;
      long long v22 = v14[9];
      long long v21 = v14[10];
      long long v23 = v14[8];
      *(void *)&v50[0] = *((void *)v14 + 22);
      long long v48 = v22;
      long long v49 = v21;
      long long v47 = v23;
      if (!v11) {
        goto LABEL_10;
      }
    }
    else
    {
      *(void *)&v50[0] = 0;
      long long v48 = 0u;
      long long v49 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      long long v39 = 0u;
      if (!v11) {
        goto LABEL_10;
      }
    }
    if ((unint64_t)objc_msgSend(v11, "length", v34, v35, v36, v37, v38, v39, v40, v41, v42, v43, v44, v45, v46, v47, v48, v49, *(void *)&v50[0]) >= 0xB8)
    {
      long long v24 = [v11 bytes];
      long long v25 = v24[3];
      long long v27 = *v24;
      long long v26 = v24[1];
      *(_OWORD *)((char *)&v50[2] + 8) = v24[2];
      *(_OWORD *)((char *)&v50[3] + 8) = v25;
      *(_OWORD *)((char *)v50 + 8) = v27;
      *(_OWORD *)((char *)&v50[1] + 8) = v26;
      long long v28 = v24[7];
      long long v30 = v24[4];
      long long v29 = v24[5];
      *(_OWORD *)((char *)&v50[6] + 8) = v24[6];
      *(_OWORD *)((char *)&v50[7] + 8) = v28;
      *(_OWORD *)((char *)&v50[4] + 8) = v30;
      *(_OWORD *)((char *)&v50[5] + 8) = v29;
      uint64_t v31 = *((void *)v24 + 22);
      long long v32 = v24[10];
      long long v33 = v24[8];
      *(_OWORD *)((char *)&v50[9] + 8) = v24[9];
      *(_OWORD *)((char *)&v50[10] + 8) = v32;
      *(_OWORD *)((char *)&v50[8] + 8) = v33;
      *((void *)&v50[11] + 1) = v31;
      if (v13)
      {
LABEL_11:
        long long v51 = *(_OWORD *)[v13 bytes];
        goto LABEL_12;
      }
      goto LABEL_9;
    }
LABEL_10:
    memset((char *)v50 + 8, 0, 184);
    if (v13) {
      goto LABEL_11;
    }
LABEL_9:
    *((void *)&v51 + 1) = 0;
  }
LABEL_12:
  sub_1000039F4(*(void *)(a1 + 32), a2, 26, (uint64_t *)&v34);
}

uint64_t sub_1000069A0(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int *a4, uint64_t a5)
{
  id v8 = +[FSFileName nameWithCString:](FSFileName, "nameWithCString:");
  id v12 = 0;
  uint64_t v13 = 0;
  uint64_t v9 = sub_10000328C(a4, (_DWORD *)&v13 + 1, &v12, (int *)&v13, 0);
  id v10 = v12;
  sub_100006A50(a2, SHIDWORD(v13), v9, v8, v10, a5);

  return 0;
}

void sub_100006A50(uint64_t a1, int a2, void *a3, void *a4, void *a5, uint64_t a6)
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = v13;
  if (!v13)
  {
    long long v17 = livefs_std_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_10003AE88();
    }

    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    uint64_t v18 = a1;
    int v19 = 22;
    goto LABEL_10;
  }
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100006CCC;
  v24[3] = &unk_100058940;
  int v25 = a2;
  v24[4] = a1;
  long long v15 = [v13 fsObjWithErrorHandler:v24];
  if (!v15)
  {
    long long v20 = livefs_std_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_10003AEFC();
    }

    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    uint64_t v18 = a1;
    int v19 = 5;
LABEL_10:
    sub_1000039F4(v18, v19, 2, (uint64_t *)&v26);
    goto LABEL_11;
  }
  long long v16 = v15;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100006DC0;
  v21[3] = &unk_100058AB8;
  v21[4] = a1;
  int v22 = a2;
  int v23 = a6;
  [v15 lookupIn:v11 name:v12 usingFlags:a6 requestID:a1 reply:v21];

LABEL_11:
}

void sub_100006CCC(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = livefs_std_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_10003AF70();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  memset(v6, 0, 512);
  sub_1000039F4(v5, 5, 2, (uint64_t *)v6);
}

void sub_100006DC0(uint64_t a1, int a2, int a3, void *a4, void *a5, void *a6, void *a7, void *a8, void *a9, void *a10)
{
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a9;
  id v23 = a10;
  memset(v60, 0, 192);
  long long v58 = 0u;
  long long v59 = 0u;
  long long v57 = 0u;
  long long v55 = 0u;
  memset(v56, 0, sizeof(v56));
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  if (!a2)
  {
    if (!v18
      || (unint64_t)objc_msgSend(v18, "length", v51, v52, v53, v54, v55, v56[0], v56[1], v56[2], v56[3], v56[4], v56[5], v56[6], v56[7], v56[8], v56[9], v56[10], v56[11],
                             v57,
                             v58,
                             v59,
                             *(_OWORD *)v60,
                             *(_OWORD *)&v60[16],
                             *(_OWORD *)&v60[32],
                             *(_OWORD *)&v60[48],
                             *(_OWORD *)&v60[64],
                             *(_OWORD *)&v60[80],
                             *(_OWORD *)&v60[96],
                             *(_OWORD *)&v60[112],
                             *(_OWORD *)&v60[128],
                             *(_OWORD *)&v60[144],
                             *(void *)&v60[160]) <= 0xB7)
    {
      uint64_t v24 = *(void *)(a1 + 32);
      long long v94 = 0u;
      long long v93 = 0u;
      long long v92 = 0u;
      long long v91 = 0u;
      long long v90 = 0u;
      long long v89 = 0u;
      long long v88 = 0u;
      long long v87 = 0u;
      long long v86 = 0u;
      long long v85 = 0u;
      long long v84 = 0u;
      long long v83 = 0u;
      long long v82 = 0u;
      long long v81 = 0u;
      long long v80 = 0u;
      long long v79 = 0u;
      long long v78 = 0u;
      long long v77 = 0u;
      long long v76 = 0u;
      long long v75 = 0u;
      long long v74 = 0u;
      long long v73 = 0u;
      long long v72 = 0u;
      long long v71 = 0u;
      long long v70 = 0u;
      long long v69 = 0u;
      long long v68 = 0u;
      long long v67 = 0u;
      long long v66 = 0u;
      long long v65 = 0u;
      long long v64 = 0u;
      long long v63 = 0u;
      int v25 = (uint64_t *)&v63;
      int v26 = 96;
      goto LABEL_6;
    }
    long long v28 = [v18 bytes];
    long long v30 = v28[9];
    long long v29 = v28[10];
    long long v31 = v28[8];
    *(void *)((char *)&v56[11] + 4) = *((void *)v28 + 22);
    long long v32 = v28[2];
    long long v33 = v28[3];
    long long v34 = v28[1];
    *(_OWORD *)((char *)v56 + 4) = *v28;
    *(_OWORD *)((char *)&v56[3] + 4) = v33;
    *(_OWORD *)((char *)&v56[2] + 4) = v32;
    *(_OWORD *)((char *)&v56[1] + 4) = v34;
    long long v35 = v28[6];
    long long v36 = v28[7];
    long long v37 = v28[5];
    *(_OWORD *)((char *)&v56[4] + 4) = v28[4];
    *(_OWORD *)((char *)&v56[7] + 4) = v36;
    *(_OWORD *)((char *)&v56[6] + 4) = v35;
    *(_OWORD *)((char *)&v56[5] + 4) = v37;
    *(_OWORD *)((char *)&v56[8] + 4) = v31;
    *(_OWORD *)((char *)&v56[10] + 4) = v29;
    *(_OWORD *)((char *)&v56[9] + 4) = v30;
    sub_1000031DC(*(_DWORD *)(a1 + 40), v17, (long long *)((char *)&v52 + 4));
    int v38 = *(_DWORD *)(a1 + 44);
    if (v22 && (v38 & 0x10000000) != 0)
    {
      unint64_t v39 = (unint64_t)[v22 length] / 0x18;
      if (v39 >= 2) {
        LODWORD(v39) = 2;
      }
      int v61 = v39;
      [v22 bytes];
      __memcpy_chk();
      int v38 = *(_DWORD *)(a1 + 44);
    }
    else
    {
      int v61 = 0;
    }
    if (!a3 && (v38 & 0x20000000) != 0)
    {
      if (v20 && (unint64_t)[v20 length] >= 0xB8)
      {
        long long v40 = [v20 bytes];
        long long v41 = v40[3];
        long long v43 = *v40;
        long long v42 = v40[1];
        *(_OWORD *)&v60[44] = v40[2];
        *(_OWORD *)&v60[60] = v41;
        *(_OWORD *)&v60[12] = v43;
        *(_OWORD *)&v60[28] = v42;
        long long v44 = v40[7];
        long long v46 = v40[4];
        long long v45 = v40[5];
        *(_OWORD *)&v60[108] = v40[6];
        *(_OWORD *)&v60[124] = v44;
        *(_OWORD *)&v60[76] = v46;
        *(_OWORD *)&v60[92] = v45;
        long long v48 = v40[9];
        long long v47 = v40[10];
        long long v49 = v40[8];
        *(void *)&v60[188] = *((void *)v40 + 22);
        *(_OWORD *)&v60[156] = v48;
        *(_OWORD *)&v60[172] = v47;
        *(_OWORD *)&v60[140] = v49;
        sub_1000031DC(*(_DWORD *)(a1 + 40), v19, (_OWORD *)((char *)&v56[11] + 12));
        if (v23)
        {
          unint64_t v50 = (unint64_t)[v23 length] / 0x18;
          if (v50 >= 2) {
            LODWORD(v50) = 2;
          }
          int v62 = v50;
          [v23 bytes];
          __memcpy_chk();
          a3 = 0;
          goto LABEL_24;
        }
        a3 = 0;
      }
      else
      {
        a3 = 96;
      }
      int v62 = 0;
    }
LABEL_24:
    LODWORD(v52) = a3;
    uint64_t v24 = *(void *)(a1 + 32);
    int v25 = (uint64_t *)&v51;
    int v26 = 0;
    int v27 = 6;
    goto LABEL_7;
  }
  uint64_t v24 = *(void *)(a1 + 32);
  long long v94 = 0uLL;
  long long v93 = 0uLL;
  long long v92 = 0uLL;
  long long v91 = 0uLL;
  long long v90 = 0uLL;
  long long v89 = 0uLL;
  long long v88 = 0uLL;
  long long v87 = 0uLL;
  long long v86 = 0uLL;
  long long v85 = 0uLL;
  long long v84 = 0uLL;
  long long v83 = 0uLL;
  long long v82 = 0uLL;
  long long v81 = 0uLL;
  long long v80 = 0uLL;
  long long v79 = 0uLL;
  long long v78 = 0uLL;
  long long v77 = 0uLL;
  long long v76 = 0uLL;
  long long v75 = 0uLL;
  long long v74 = 0uLL;
  long long v73 = 0uLL;
  long long v72 = 0uLL;
  long long v71 = 0uLL;
  long long v70 = 0uLL;
  long long v69 = 0uLL;
  long long v68 = 0uLL;
  long long v67 = 0uLL;
  long long v66 = 0uLL;
  long long v65 = 0uLL;
  long long v64 = 0uLL;
  long long v63 = 0uLL;
  int v25 = (uint64_t *)&v63;
  int v26 = a2;
LABEL_6:
  int v27 = 2;
LABEL_7:
  sub_1000039F4(v24, v26, v27, v25);
}

uint64_t sub_100007214(uint64_t a1, uint64_t a2, unsigned int *a3, uint64_t a4)
{
  id v19 = 0;
  uint64_t v20 = 0;
  id v6 = sub_10000328C(a3, (_DWORD *)&v20 + 1, &v19, (int *)&v20, 0);
  id v7 = v19;
  id v8 = v7;
  if (!v7)
  {
    id v11 = livefs_std_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10003AFE4();
    }

    int v12 = v20;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v13 = a2;
    goto LABEL_10;
  }
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10000749C;
  v17[3] = &unk_100058940;
  int v18 = HIDWORD(v20);
  void v17[4] = a2;
  uint64_t v9 = [v7 fsObjWithErrorHandler:v17];
  if (!v9)
  {
    id v14 = livefs_std_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_10003B058();
    }

    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v13 = a2;
    int v12 = 5;
LABEL_10:
    sub_1000039F4(v13, v12, 2, (uint64_t *)&v21);
    goto LABEL_11;
  }
  id v10 = v9;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100007590;
  v16[3] = &unk_100058AD8;
  v16[4] = a2;
  [v9 open:v6 withMode:a4 requestID:a2 reply:v16];

LABEL_11:
  return 0;
}

void sub_10000749C(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = livefs_std_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_10003B0CC();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  memset(v6, 0, 512);
  sub_1000039F4(v5, 5, 2, (uint64_t *)v6);
}

void sub_100007590(uint64_t a1, int a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  memset(v3, 0, 512);
  sub_1000039F4(v2, a2, 2, (uint64_t *)v3);
}

uint64_t sub_100007638(uint64_t a1, uint64_t a2, unsigned int *a3, uint64_t a4)
{
  id v19 = 0;
  uint64_t v20 = 0;
  id v6 = sub_10000328C(a3, (_DWORD *)&v20 + 1, &v19, (int *)&v20, 0);
  id v7 = v19;
  id v8 = v7;
  if (!v7)
  {
    id v11 = livefs_std_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10003B140();
    }

    int v12 = v20;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v13 = a2;
    goto LABEL_10;
  }
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000078C0;
  v17[3] = &unk_100058940;
  int v18 = HIDWORD(v20);
  void v17[4] = a2;
  uint64_t v9 = [v7 fsObjWithErrorHandler:v17];
  if (!v9)
  {
    id v14 = livefs_std_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_10003B1B4();
    }

    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v13 = a2;
    int v12 = 5;
LABEL_10:
    sub_1000039F4(v13, v12, 2, (uint64_t *)&v21);
    goto LABEL_11;
  }
  id v10 = v9;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000079B4;
  v16[3] = &unk_100058AD8;
  v16[4] = a2;
  [v9 close:v6 keepingMode:a4 requestID:a2 reply:v16];

LABEL_11:
  return 0;
}

void sub_1000078C0(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = livefs_std_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_10003B228();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  memset(v6, 0, 512);
  sub_1000039F4(v5, 5, 2, (uint64_t *)v6);
}

void sub_1000079B4(uint64_t a1, int a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  memset(v3, 0, 512);
  sub_1000039F4(v2, a2, 2, (uint64_t *)v3);
}

uint64_t sub_100007A5C(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int *a4, unsigned int *a5, uint64_t a6, unsigned int *a7, unsigned int *a8, int a9)
{
  long long v15 = +[FSFileName nameWithCString:](FSFileName, "nameWithCString:");
  long long v16 = +[FSFileName nameWithCString:a6];
  id v39 = 0;
  uint64_t v40 = 0;
  id v17 = sub_10000328C(a5, (_DWORD *)&v40 + 1, &v39, (int *)&v40, 0);
  id v18 = v39;
  id v38 = v18;
  id v19 = sub_10000328C(a4, (_DWORD *)&v40 + 1, &v38, (int *)&v40, 0);
  id v20 = v38;

  memset(__s1, 0, sizeof(__s1));
  if (!memcmp(__s1, a7, 0x40uLL))
  {
    long long v21 = 0;
  }
  else
  {
    id v37 = v20;
    long long v21 = sub_10000328C(a7, (_DWORD *)&v40 + 1, &v37, (int *)&v40, 0);
    id v22 = v37;

    id v20 = v22;
  }
  id v36 = v20;
  long long v23 = sub_10000328C(a8, (_DWORD *)&v40 + 1, &v36, (int *)&v40, 0);
  id v24 = v36;

  if (!v24)
  {
    long long v27 = livefs_std_log();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      sub_10003B29C();
    }

    int v28 = v40;
    long long v72 = 0u;
    long long v73 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    uint64_t v29 = a2;
    goto LABEL_13;
  }
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_100007E10;
  v34[3] = &unk_100058940;
  int v35 = HIDWORD(v40);
  v34[4] = a2;
  long long v25 = [v24 fsObjWithErrorHandler:v34];
  if (!v25)
  {
    long long v30 = livefs_std_log();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      sub_10003B310();
    }

    long long v72 = 0u;
    long long v73 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    uint64_t v29 = a2;
    int v28 = 5;
LABEL_13:
    sub_1000039F4(v29, v28, 2, (uint64_t *)&v42);
    goto LABEL_14;
  }
  long long v26 = v25;
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_100007F04;
  v33[3] = &unk_100058AF8;
  v33[4] = a2;
  LODWORD(v32) = a9;
  [v25 renameItemIn:v17 named:v15 item:v19 toDirectory:v23 newName:v16 toItem:v21 usingFlags:v32 requestID:a2 reply:v33];

LABEL_14:
  return 0;
}

void sub_100007E10(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = livefs_std_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_10003B384();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  memset(v6, 0, 512);
  sub_1000039F4(v5, 5, 2, (uint64_t *)v6);
}

void sub_100007F04(uint64_t a1, int a2, void *a3, void *a4, void *a5)
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  memset(v44, 0, sizeof(v44));
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  if (!a2)
  {
    if (v9
      && (unint64_t)objc_msgSend(v9, "length", v32, v33, v34, v35, v36, v37, v38, v39, v40, v41, v42, v43, v44[0], v44[1], v44[2], v44[3], v44[4],
                             v44[5],
                             v44[6],
                             v44[7],
                             v44[8],
                             v44[9],
                             v44[10],
                             v44[11],
                             v45,
                             v46,
                             v47,
                             v48,
                             v49,
                             v50,
                             (void)v51) >= 0xB8)
    {
      int v12 = [v9 bytes];
      long long v13 = v12[3];
      long long v15 = *v12;
      long long v14 = v12[1];
      long long v35 = v12[2];
      long long v36 = v13;
      long long v33 = v15;
      long long v34 = v14;
      long long v16 = v12[7];
      long long v18 = v12[4];
      long long v17 = v12[5];
      long long v39 = v12[6];
      long long v40 = v16;
      long long v37 = v18;
      long long v38 = v17;
      long long v20 = v12[9];
      long long v19 = v12[10];
      long long v21 = v12[8];
      *(void *)&v44[0] = *((void *)v12 + 22);
      long long v42 = v20;
      long long v43 = v19;
      long long v41 = v21;
    }
    else
    {
      *(void *)&v44[0] = 0;
      long long v42 = 0u;
      long long v43 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      long long v33 = 0u;
    }
    if (v10 && (unint64_t)[v10 length] >= 0xB8)
    {
      id v22 = [v10 bytes];
      long long v23 = v22[6];
      long long v24 = v22[7];
      long long v25 = v22[5];
      *(_OWORD *)((char *)&v44[4] + 8) = v22[4];
      *(_OWORD *)((char *)&v44[6] + 8) = v23;
      *(_OWORD *)((char *)&v44[7] + 8) = v24;
      *(_OWORD *)((char *)&v44[5] + 8) = v25;
      uint64_t v26 = *((void *)v22 + 22);
      long long v27 = v22[10];
      long long v28 = v22[8];
      *(_OWORD *)((char *)&v44[9] + 8) = v22[9];
      *(_OWORD *)((char *)&v44[10] + 8) = v27;
      *(_OWORD *)((char *)&v44[8] + 8) = v28;
      long long v29 = v22[2];
      long long v30 = v22[3];
      long long v31 = v22[1];
      *(_OWORD *)((char *)v44 + 8) = *v22;
      *(_OWORD *)((char *)&v44[3] + 8) = v30;
      *(_OWORD *)((char *)&v44[2] + 8) = v29;
      *(_OWORD *)((char *)&v44[1] + 8) = v31;
      *((void *)&v44[11] + 1) = v26;
      if (!v11)
      {
LABEL_9:
        *((void *)&v45 + 1) = 0;
        goto LABEL_12;
      }
    }
    else
    {
      memset((char *)v44 + 8, 0, 184);
      if (!v11) {
        goto LABEL_9;
      }
    }
    long long v45 = *(_OWORD *)[v11 bytes];
  }
LABEL_12:
  sub_1000039F4(*(void *)(a1 + 32), a2, 7, (uint64_t *)&v32);
}

uint64_t sub_100008150(uint64_t a1, uint64_t a2, unsigned int *a3, unsigned int *a4, uint64_t a5)
{
  id v8 = +[FSFileName nameWithCString:a5];
  uint64_t v27 = 0;
  int v26 = 0;
  id v25 = 0;
  id v9 = sub_10000328C(a3, (_DWORD *)&v27 + 1, &v25, &v26, 0);
  id v10 = v25;
  if (v10)
  {
    id v11 = v10;
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_1000085A0;
    v23[3] = &unk_100058940;
    int v24 = HIDWORD(v27);
    v23[4] = a2;
    uint64_t v12 = [v10 fsObjWithErrorHandler:v23];
    if (v12)
    {
      long long v13 = (void *)v12;
      id v22 = v11;
      long long v14 = sub_10000328C(a4, &v27, &v22, &v26, 0);
      id v15 = v22;

      if (v15)
      {
        if (!HIDWORD(v27) || HIDWORD(v27) == v27)
        {
          v21[0] = _NSConcreteStackBlock;
          v21[1] = 3221225472;
          v21[2] = sub_100008694;
          v21[3] = &unk_100058B18;
          v21[4] = a2;
          [v13 removeDirectory:v14 from:v9 named:v8 usingFlags:0 requestID:a2 reply:v21];
        }
        else
        {
          long long v16 = livefs_std_log();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
            sub_10003B4E0();
          }

          long long v58 = 0u;
          long long v59 = 0u;
          long long v56 = 0u;
          long long v57 = 0u;
          long long v54 = 0u;
          long long v55 = 0u;
          long long v52 = 0u;
          long long v53 = 0u;
          long long v50 = 0u;
          long long v51 = 0u;
          long long v48 = 0u;
          long long v49 = 0u;
          long long v46 = 0u;
          long long v47 = 0u;
          long long v44 = 0u;
          long long v45 = 0u;
          long long v42 = 0u;
          long long v43 = 0u;
          long long v40 = 0u;
          long long v41 = 0u;
          long long v38 = 0u;
          long long v39 = 0u;
          long long v36 = 0u;
          long long v37 = 0u;
          long long v34 = 0u;
          long long v35 = 0u;
          long long v32 = 0u;
          long long v33 = 0u;
          long long v30 = 0u;
          long long v31 = 0u;
          long long v29 = 0u;
          long long v28 = 0u;
          sub_1000039F4(a2, 18, 2, (uint64_t *)&v28);
        }
      }
      else
      {
        long long v19 = livefs_std_log();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
          sub_10003B3F8();
        }

        long long v58 = 0u;
        long long v59 = 0u;
        long long v56 = 0u;
        long long v57 = 0u;
        long long v54 = 0u;
        long long v55 = 0u;
        long long v52 = 0u;
        long long v53 = 0u;
        long long v50 = 0u;
        long long v51 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        long long v46 = 0u;
        long long v47 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        long long v29 = 0u;
        long long v28 = 0u;
        sub_1000039F4(a2, v26, 2, (uint64_t *)&v28);
      }
    }
    else
    {
      long long v18 = livefs_std_log();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_10003B46C();
      }

      long long v58 = 0u;
      long long v59 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      long long v29 = 0u;
      long long v28 = 0u;
      sub_1000039F4(a2, 5, 2, (uint64_t *)&v28);
    }
  }
  else
  {
    long long v17 = livefs_std_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_10003B3F8();
    }

    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v29 = 0u;
    long long v28 = 0u;
    sub_1000039F4(a2, v26, 2, (uint64_t *)&v28);
  }

  return 0;
}

void sub_1000085A0(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = livefs_std_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_10003B55C();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  memset(v6, 0, 512);
  sub_1000039F4(v5, 5, 2, (uint64_t *)v6);
}

void sub_100008694(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  memset(v31, 0, sizeof(v31));
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  if (!a2)
  {
    if (v7
      && (unint64_t)objc_msgSend(v7, "length", v19, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29, v30, v31[0], v31[1], v32, v33, v34,
                             v35,
                             v36,
                             v37,
                             v38,
                             v39,
                             v40,
                             v41,
                             v42,
                             v43,
                             v44,
                             v45,
                             v46,
                             v47,
                             (void)v48) >= 0xB8)
    {
      id v9 = [v7 bytes];
      long long v10 = v9[3];
      long long v12 = *v9;
      long long v11 = v9[1];
      long long v22 = v9[2];
      long long v23 = v10;
      long long v20 = v12;
      long long v21 = v11;
      long long v13 = v9[7];
      long long v15 = v9[4];
      long long v14 = v9[5];
      long long v26 = v9[6];
      long long v27 = v13;
      long long v24 = v15;
      long long v25 = v14;
      long long v17 = v9[9];
      long long v16 = v9[10];
      long long v18 = v9[8];
      *(void *)&v31[0] = *((void *)v9 + 22);
      long long v29 = v17;
      long long v30 = v16;
      long long v28 = v18;
      if (!v8)
      {
LABEL_5:
        *(void *)&v31[1] = 0;
        goto LABEL_8;
      }
    }
    else
    {
      *(void *)&v31[0] = 0;
      long long v29 = 0u;
      long long v30 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      long long v20 = 0u;
      if (!v8) {
        goto LABEL_5;
      }
    }
    *(_OWORD *)((char *)v31 + 8) = *(_OWORD *)[v8 bytes];
  }
LABEL_8:
  sub_1000039F4(*(void *)(a1 + 32), a2, 8, (uint64_t *)&v19);
}

uint64_t sub_100008814(uint64_t a1, uint64_t a2, int a3, uint64_t a4, unsigned int *a5, unsigned int a6, uint64_t a7)
{
  id v29 = 0;
  uint64_t v30 = 0;
  long long v12 = sub_10000328C(a5, (_DWORD *)&v30 + 1, &v29, (int *)&v30, 0);
  id v13 = v29;
  long long v14 = v13;
  if (v13)
  {
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_100008C2C;
    v27[3] = &unk_100058940;
    int v28 = HIDWORD(v30);
    v27[4] = a2;
    long long v15 = [v13 fsObjWithErrorHandler:v27];
    if (v15)
    {
      if (a3)
      {
        long long v61 = 0u;
        long long v62 = 0u;
        long long v59 = 0u;
        long long v60 = 0u;
        long long v57 = 0u;
        long long v58 = 0u;
        long long v55 = 0u;
        long long v56 = 0u;
        long long v53 = 0u;
        long long v54 = 0u;
        long long v51 = 0u;
        long long v52 = 0u;
        long long v49 = 0u;
        long long v50 = 0u;
        long long v47 = 0u;
        long long v48 = 0u;
        long long v45 = 0u;
        long long v46 = 0u;
        long long v43 = 0u;
        long long v44 = 0u;
        long long v41 = 0u;
        long long v42 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        sub_1000039F4(a2, 45, 2, (uint64_t *)&v31);
      }
      else
      {
        *(void *)&long long v31 = 0;
        *((void *)&v31 + 1) = &v31;
        *(void *)&long long v32 = 0x43010000000;
        *((void *)&v32 + 1) = "";
        long long v33 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        long long v46 = 0u;
        long long v47 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        long long v50 = 0u;
        long long v51 = 0u;
        long long v52 = 0u;
        long long v53 = 0u;
        long long v54 = 0u;
        long long v55 = 0u;
        long long v56 = 0u;
        long long v57 = 0u;
        long long v58 = 0u;
        long long v59 = 0u;
        long long v60 = 0u;
        long long v61 = 0u;
        long long v62 = 0u;
        long long v63 = 0u;
        long long v64 = 0u;
        uint64_t v23 = 0;
        long long v24 = &v23;
        uint64_t v25 = 0x2020000000;
        long long v26 = &v33;
        long long v18 = +[LiveFSSharedMutableBuffer dataWithLength:a6];
        id v19 = [v18 mutableBytes];
        *(void *)(v24[3] + 32) = v19;
        [v18 detachBytes];
        v21[0] = _NSConcreteStackBlock;
        v21[1] = 3221225472;
        v21[2] = sub_100008D20;
        v21[3] = &unk_100058B40;
        v21[4] = &v23;
        void v21[5] = &v31;
        v21[6] = a2;
        unsigned int v22 = a6;
        [v15 readDirectory:v12 intoBuffer:v18 cookie:a4 verifier:a7 requestID:a2 reply:v21];

        _Block_object_dispose(&v23, 8);
        _Block_object_dispose(&v31, 8);
      }
    }
    else
    {
      long long v17 = livefs_std_log();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_10003B644();
      }

      long long v61 = 0u;
      long long v62 = 0u;
      long long v59 = 0u;
      long long v60 = 0u;
      long long v57 = 0u;
      long long v58 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      sub_1000039F4(a2, 5, 2, (uint64_t *)&v31);
    }
  }
  else
  {
    long long v16 = livefs_std_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_10003B5D0();
    }

    long long v61 = 0u;
    long long v62 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    sub_1000039F4(a2, v30, 2, (uint64_t *)&v31);
  }

  return 0;
}

void sub_100008C00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

void sub_100008C2C(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = livefs_std_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_10003B6B8();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  memset(v6, 0, 512);
  sub_1000039F4(v5, 5, 2, (uint64_t *)v6);
}

uint64_t sub_100008D20(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = *(void *)(*(void *)(a1 + 40) + 8) + 32;
  if (a3) {
    BOOL v5 = a2 == -1001;
  }
  else {
    BOOL v5 = 0;
  }
  if (v5) {
    a2 = 0;
  }
  if (!a2)
  {
    *(void *)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) + 16) = a4;
    *(_DWORD *)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) + 24) = a3;
  }
  sub_1000039F4(*(void *)(a1 + 48), a2, 9, *(uint64_t **)(*(void *)(*(void *)(a1 + 32) + 8) + 24));
  vm_map_t v6 = mach_task_self_;
  vm_address_t v7 = *(void *)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) + 32);
  vm_size_t v8 = *(unsigned int *)(a1 + 56);

  return vm_deallocate(v6, v7, v8);
}

uint64_t sub_100008DD4(uint64_t a1, uint64_t a2, unsigned int *a3, uint64_t a4, unsigned int *a5)
{
  vm_size_t v8 = +[FSFileName nameWithCString:a4];
  id v24 = 0;
  uint64_t v25 = 0;
  id v9 = sub_10000328C(a3, (_DWORD *)&v25 + 1, &v24, (int *)&v25, 0);
  id v10 = v24;
  id v23 = v10;
  long long v11 = sub_10000328C(a5, (_DWORD *)&v25 + 1, &v23, (int *)&v25, 0);
  id v12 = v23;

  if (!v12)
  {
    long long v15 = livefs_std_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_10003B72C();
    }

    int v16 = v25;
    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    uint64_t v17 = a2;
    goto LABEL_10;
  }
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1000090B4;
  v21[3] = &unk_100058940;
  int v22 = HIDWORD(v25);
  v21[4] = a2;
  id v13 = [v12 fsObjWithErrorHandler:v21];
  if (!v13)
  {
    long long v18 = livefs_std_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_10003B7A0();
    }

    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    uint64_t v17 = a2;
    int v16 = 5;
LABEL_10:
    sub_1000039F4(v17, v16, 2, (uint64_t *)&v26);
    goto LABEL_11;
  }
  long long v14 = v13;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1000091A8;
  v20[3] = &unk_100058AF8;
  v20[4] = a2;
  [v13 makeLinkOf:v9 named:v8 inDirectory:v11 requestID:a2 reply:v20];

LABEL_11:
  return 0;
}

void sub_1000090B4(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = livefs_std_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_10003B814();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  memset(v6, 0, 512);
  sub_1000039F4(v5, 5, 2, (uint64_t *)v6);
}

void sub_1000091A8(uint64_t a1, int a2, void *a3, void *a4, void *a5)
{
  id v9 = a5;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  memset(v42, 0, sizeof(v42));
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  if (!a2)
  {
    if (a3
      && (unint64_t)objc_msgSend(a3, "length", v30, v31, v32, v33, v34, v35, v36, v37, v38, v39, v40, v41, v42[0], v42[1], v42[2], v42[3], v42[4],
                             v42[5],
                             v42[6],
                             v42[7],
                             v42[8],
                             v42[9],
                             v42[10],
                             v42[11],
                             v43,
                             v44,
                             v45,
                             v46,
                             v47,
                             v48,
                             (void)v49) >= 0xB8)
    {
      id v10 = [a3 bytes];
      long long v11 = v10[6];
      long long v12 = v10[7];
      long long v13 = v10[5];
      *(_OWORD *)((char *)&v42[4] + 8) = v10[4];
      *(_OWORD *)((char *)&v42[6] + 8) = v11;
      *(_OWORD *)((char *)&v42[7] + 8) = v12;
      *(_OWORD *)((char *)&v42[5] + 8) = v13;
      uint64_t v14 = *((void *)v10 + 22);
      long long v15 = v10[10];
      long long v16 = v10[8];
      *(_OWORD *)((char *)&v42[9] + 8) = v10[9];
      *(_OWORD *)((char *)&v42[10] + 8) = v15;
      *(_OWORD *)((char *)&v42[8] + 8) = v16;
      long long v17 = v10[2];
      long long v18 = v10[3];
      long long v19 = v10[1];
      *(_OWORD *)((char *)v42 + 8) = *v10;
      *(_OWORD *)((char *)&v42[3] + 8) = v18;
      *(_OWORD *)((char *)&v42[2] + 8) = v17;
      *(_OWORD *)((char *)&v42[1] + 8) = v19;
      *((void *)&v42[11] + 1) = v14;
      if (!a4) {
        goto LABEL_10;
      }
    }
    else
    {
      memset((char *)v42 + 8, 0, 184);
      if (!a4) {
        goto LABEL_10;
      }
    }
    if ((unint64_t)objc_msgSend(a4, "length", v30) >= 0xB8)
    {
      long long v20 = [a4 bytes];
      long long v21 = v20[3];
      long long v23 = *v20;
      long long v22 = v20[1];
      long long v33 = v20[2];
      long long v34 = v21;
      long long v31 = v23;
      long long v32 = v22;
      long long v24 = v20[7];
      long long v26 = v20[4];
      long long v25 = v20[5];
      long long v37 = v20[6];
      long long v38 = v24;
      long long v35 = v26;
      long long v36 = v25;
      long long v28 = v20[9];
      long long v27 = v20[10];
      long long v29 = v20[8];
      *(void *)&v42[0] = *((void *)v20 + 22);
      long long v40 = v28;
      long long v41 = v27;
      long long v39 = v29;
      if (v9)
      {
LABEL_11:
        long long v43 = *(_OWORD *)[v9 bytes];
        goto LABEL_12;
      }
      goto LABEL_9;
    }
LABEL_10:
    *(void *)&v42[0] = 0;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v31 = 0u;
    if (v9) {
      goto LABEL_11;
    }
LABEL_9:
    *((void *)&v43 + 1) = 0;
  }
LABEL_12:
  sub_1000039F4(*(void *)(a1 + 32), a2, 11, (uint64_t *)&v30);
}

uint64_t sub_1000093E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned int *a5, uint64_t a6)
{
  id v10 = +[FSFileName nameWithCString:](FSFileName, "nameWithCString:");
  long long v11 = +[NSString stringWithUTF8String:a4];
  long long v12 = +[NSData dataWithBytes:a6 length:184];
  id v27 = 0;
  uint64_t v28 = 0;
  long long v13 = sub_10000328C(a5, (_DWORD *)&v28 + 1, &v27, (int *)&v28, 0);
  id v14 = v27;
  long long v15 = v14;
  if (!v14)
  {
    long long v18 = livefs_std_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_10003B888();
    }

    int v19 = v28;
    long long v59 = 0u;
    long long v60 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    uint64_t v20 = a2;
    goto LABEL_10;
  }
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_1000096D0;
  v25[3] = &unk_100058940;
  int v26 = HIDWORD(v28);
  v25[4] = a2;
  long long v16 = [v14 fsObjWithErrorHandler:v25];
  if (!v16)
  {
    long long v21 = livefs_std_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_10003B8FC();
    }

    long long v59 = 0u;
    long long v60 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    uint64_t v20 = a2;
    int v19 = 5;
LABEL_10:
    sub_1000039F4(v20, v19, 2, (uint64_t *)&v29);
    goto LABEL_11;
  }
  long long v17 = v16;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_1000097C4;
  v23[3] = &unk_100058A98;
  int v24 = HIDWORD(v28);
  v23[4] = a2;
  [v16 makeSymLinkIn:v13 named:v10 contents:v11 attributes:v12 requestID:a2 reply:v23];

LABEL_11:
  return 0;
}

void sub_1000096D0(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = livefs_std_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_10003B970();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  memset(v6, 0, 512);
  sub_1000039F4(v5, 5, 2, (uint64_t *)v6);
}

void sub_1000097C4(uint64_t a1, int a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  memset(v51, 0, sizeof(v51));
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  if (!a2)
  {
    if (v11
      && (unint64_t)objc_msgSend(v11, "length", v35, v36, v37, v38, v39, v40, v41, v42, v43, v44, v45, v46, v47, v48, v49, v50, v51[0],
                             v51[1],
                             v51[2],
                             v51[3],
                             v51[4],
                             v51[5],
                             v51[6],
                             v51[7],
                             v51[8],
                             v51[9],
                             v51[10],
                             v51[11],
                             v52,
                             v53,
                             (void)v54) >= 0xB8)
    {
      long long v15 = [v11 bytes];
      long long v16 = v15[3];
      long long v18 = *v15;
      long long v17 = v15[1];
      *(_OWORD *)((char *)&v51[2] + 8) = v15[2];
      *(_OWORD *)((char *)&v51[3] + 8) = v16;
      *(_OWORD *)((char *)v51 + 8) = v18;
      *(_OWORD *)((char *)&v51[1] + 8) = v17;
      long long v19 = v15[7];
      long long v21 = v15[4];
      long long v20 = v15[5];
      *(_OWORD *)((char *)&v51[6] + 8) = v15[6];
      *(_OWORD *)((char *)&v51[7] + 8) = v19;
      *(_OWORD *)((char *)&v51[4] + 8) = v21;
      *(_OWORD *)((char *)&v51[5] + 8) = v20;
      uint64_t v22 = *((void *)v15 + 22);
      long long v23 = v15[10];
      long long v24 = v15[8];
      *(_OWORD *)((char *)&v51[9] + 8) = v15[9];
      *(_OWORD *)((char *)&v51[10] + 8) = v23;
      *(_OWORD *)((char *)&v51[8] + 8) = v24;
      *((void *)&v51[11] + 1) = v22;
      if (!v13) {
        goto LABEL_10;
      }
    }
    else
    {
      memset((char *)v51 + 8, 0, 184);
      if (!v13) {
        goto LABEL_10;
      }
    }
    if ((unint64_t)objc_msgSend(v13, "length", v35, v36, v37, v38, v39) >= 0xB8)
    {
      long long v25 = [v13 bytes];
      long long v26 = v25[3];
      long long v28 = *v25;
      long long v27 = v25[1];
      long long v42 = v25[2];
      long long v43 = v26;
      long long v40 = v28;
      long long v41 = v27;
      long long v29 = v25[7];
      long long v31 = v25[4];
      long long v30 = v25[5];
      long long v46 = v25[6];
      long long v47 = v29;
      long long v44 = v31;
      long long v45 = v30;
      long long v33 = v25[9];
      long long v32 = v25[10];
      long long v34 = v25[8];
      *(void *)&v51[0] = *((void *)v25 + 22);
      long long v49 = v33;
      long long v50 = v32;
      long long v48 = v34;
      if (v14)
      {
LABEL_11:
        long long v52 = *(_OWORD *)[v14 bytes];
        goto LABEL_12;
      }
LABEL_9:
      *((void *)&v52 + 1) = 0;
LABEL_12:
      sub_1000031DC(*(_DWORD *)(a1 + 40), v12, &v36);
      goto LABEL_13;
    }
LABEL_10:
    *(void *)&v51[0] = 0;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v40 = 0u;
    if (v14) {
      goto LABEL_11;
    }
    goto LABEL_9;
  }
LABEL_13:
  sub_1000039F4(*(void *)(a1 + 32), a2, 10, (uint64_t *)&v35);
}

uint64_t sub_100009A10(uint64_t a1, uint64_t a2, unsigned int *a3)
{
  id v17 = 0;
  uint64_t v18 = 0;
  int v4 = sub_10000328C(a3, (_DWORD *)&v18 + 1, &v17, (int *)&v18, 0);
  id v5 = v17;
  vm_map_t v6 = v5;
  if (!v5)
  {
    id v9 = livefs_std_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10003B9E4();
    }

    int v10 = v18;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    uint64_t v11 = a2;
    goto LABEL_10;
  }
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100009C88;
  v15[3] = &unk_100058940;
  int v16 = HIDWORD(v18);
  v15[4] = a2;
  vm_address_t v7 = [v5 fsObjWithErrorHandler:v15];
  if (!v7)
  {
    id v12 = livefs_std_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10003BA58();
    }

    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    uint64_t v11 = a2;
    int v10 = 5;
LABEL_10:
    sub_1000039F4(v11, v10, 2, (uint64_t *)&v19);
    goto LABEL_11;
  }
  vm_size_t v8 = v7;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100009D7C;
  v14[3] = &unk_100058B18;
  v14[4] = a2;
  [v7 readLinkOf:v4 requestID:a2 reply:v14];

LABEL_11:
  return 0;
}

void sub_100009C88(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = livefs_std_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_10003BACC();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  memset(v6, 0, 512);
  sub_1000039F4(v5, 5, 2, (uint64_t *)v6);
}

void sub_100009D7C(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  if (a2 || !v7)
  {
    if (!a2 && !v7)
    {
      uint64_t v11 = livefs_std_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_10003BB40(v11, v12, v13, v14, v15, v16, v17, v18);
      }

      a2 = 22;
    }
  }
  else
  {
    id v9 = objc_msgSend(v7, "length", v19, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29, v30, v31, v32, v33, v34, v35,
           v36,
           v37,
           v38,
           v39,
           v40,
           v41,
           v42,
           v43,
           v44,
           v45,
           v46,
           v47,
           v48,
           (void)v49);
    if ((unint64_t)v9 >= 0x3FF) {
      uint64_t v10 = 1023;
    }
    else {
      uint64_t v10 = (uint64_t)v9;
    }
    [v7 bytes];
    __memcpy_chk();
    a2 = 0;
    *((unsigned char *)&v20 + v10) = 0;
  }
  sub_1000039F4(*(void *)(a1 + 32), a2, 12, (uint64_t *)&v19);
}

uint64_t sub_100009EE8(uint64_t a1, uint64_t a2, unsigned int *a3, unsigned int *a4, uint64_t a5, uint64_t a6)
{
  uint64_t v10 = +[FSFileName nameWithCString:a5];
  uint64_t v29 = 0;
  int v28 = 0;
  id v27 = 0;
  uint64_t v11 = sub_10000328C(a3, (_DWORD *)&v29 + 1, &v27, &v28, 0);
  id v12 = v27;
  if (v12)
  {
    uint64_t v13 = v12;
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_10000A334;
    v25[3] = &unk_100058940;
    int v26 = HIDWORD(v29);
    v25[4] = a2;
    uint64_t v14 = [v12 fsObjWithErrorHandler:v25];
    if (v14)
    {
      uint64_t v15 = (void *)v14;
      id v24 = v13;
      uint64_t v16 = sub_10000328C(a4, &v29, &v24, &v28, 0);
      id v17 = v24;

      if (v17)
      {
        if (HIDWORD(v29) == v29)
        {
          v23[0] = _NSConcreteStackBlock;
          v23[1] = 3221225472;
          v23[2] = sub_10000A428;
          v23[3] = &unk_100058B18;
          v23[4] = a2;
          [v15 removeItem:v16 from:v11 named:v10 usingFlags:a6 requestID:a2 reply:v23];
        }
        else
        {
          long long v21 = livefs_std_log();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
            sub_10003BCA0();
          }

          long long v60 = 0u;
          long long v61 = 0u;
          long long v58 = 0u;
          long long v59 = 0u;
          long long v56 = 0u;
          long long v57 = 0u;
          long long v54 = 0u;
          long long v55 = 0u;
          long long v52 = 0u;
          long long v53 = 0u;
          long long v50 = 0u;
          long long v51 = 0u;
          long long v48 = 0u;
          long long v49 = 0u;
          long long v46 = 0u;
          long long v47 = 0u;
          long long v44 = 0u;
          long long v45 = 0u;
          long long v42 = 0u;
          long long v43 = 0u;
          long long v40 = 0u;
          long long v41 = 0u;
          long long v38 = 0u;
          long long v39 = 0u;
          long long v36 = 0u;
          long long v37 = 0u;
          long long v34 = 0u;
          long long v35 = 0u;
          long long v32 = 0u;
          long long v33 = 0u;
          long long v31 = 0u;
          long long v30 = 0u;
          sub_1000039F4(a2, 18, 2, (uint64_t *)&v30);
        }
      }
      else
      {
        long long v20 = livefs_std_log();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
          sub_10003BBB8();
        }

        long long v60 = 0u;
        long long v61 = 0u;
        long long v58 = 0u;
        long long v59 = 0u;
        long long v56 = 0u;
        long long v57 = 0u;
        long long v54 = 0u;
        long long v55 = 0u;
        long long v52 = 0u;
        long long v53 = 0u;
        long long v50 = 0u;
        long long v51 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        long long v46 = 0u;
        long long v47 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        long long v31 = 0u;
        long long v30 = 0u;
        sub_1000039F4(a2, v28, 2, (uint64_t *)&v30);
      }
    }
    else
    {
      long long v19 = livefs_std_log();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        sub_10003BC2C();
      }

      long long v60 = 0u;
      long long v61 = 0u;
      long long v58 = 0u;
      long long v59 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      long long v31 = 0u;
      long long v30 = 0u;
      sub_1000039F4(a2, 5, 2, (uint64_t *)&v30);
    }
  }
  else
  {
    uint64_t v18 = livefs_std_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_10003BBB8();
    }

    long long v60 = 0u;
    long long v61 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v31 = 0u;
    long long v30 = 0u;
    sub_1000039F4(a2, v28, 2, (uint64_t *)&v30);
  }

  return 0;
}

void sub_10000A334(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = livefs_std_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_10003BD1C();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  memset(v6, 0, 512);
  sub_1000039F4(v5, 5, 2, (uint64_t *)v6);
}

void sub_10000A428(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  memset(v31, 0, sizeof(v31));
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  if (!a2)
  {
    if (v7
      && (unint64_t)objc_msgSend(v7, "length", v19, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29, v30, v31[0], v31[1], v32, v33, v34,
                             v35,
                             v36,
                             v37,
                             v38,
                             v39,
                             v40,
                             v41,
                             v42,
                             v43,
                             v44,
                             v45,
                             v46,
                             v47,
                             (void)v48) >= 0xB8)
    {
      id v9 = [v7 bytes];
      long long v10 = v9[3];
      long long v12 = *v9;
      long long v11 = v9[1];
      long long v22 = v9[2];
      long long v23 = v10;
      long long v20 = v12;
      long long v21 = v11;
      long long v13 = v9[7];
      long long v15 = v9[4];
      long long v14 = v9[5];
      long long v26 = v9[6];
      long long v27 = v13;
      long long v24 = v15;
      long long v25 = v14;
      long long v17 = v9[9];
      long long v16 = v9[10];
      long long v18 = v9[8];
      *(void *)&v31[0] = *((void *)v9 + 22);
      long long v29 = v17;
      long long v30 = v16;
      long long v28 = v18;
      if (!v8)
      {
LABEL_5:
        *(void *)&v31[1] = 0;
        goto LABEL_8;
      }
    }
    else
    {
      *(void *)&v31[0] = 0;
      long long v29 = 0u;
      long long v30 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      long long v20 = 0u;
      if (!v8) {
        goto LABEL_5;
      }
    }
    *(_OWORD *)((char *)v31 + 8) = *(_OWORD *)[v8 bytes];
  }
LABEL_8:
  sub_1000039F4(*(void *)(a1 + 32), a2, 13, (uint64_t *)&v19);
}

uint64_t sub_10000A5A8(uint64_t a1, uint64_t a2, unsigned int *a3, uint64_t a4)
{
  vm_map_t v6 = +[NSData dataWithBytes:a4 length:184];
  id v20 = 0;
  uint64_t v21 = 0;
  id v7 = sub_10000328C(a3, (_DWORD *)&v21 + 1, &v20, (int *)&v21, 0);
  id v8 = v20;
  id v9 = v8;
  if (!v8)
  {
    long long v12 = livefs_std_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10003BD90();
    }

    int v13 = v21;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    uint64_t v14 = a2;
    goto LABEL_10;
  }
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10000A850;
  v18[3] = &unk_100058940;
  int v19 = HIDWORD(v21);
  v18[4] = a2;
  long long v10 = [v8 fsObjWithErrorHandler:v18];
  if (!v10)
  {
    long long v15 = livefs_std_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_10003BE04();
    }

    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    uint64_t v14 = a2;
    int v13 = 5;
LABEL_10:
    sub_1000039F4(v14, v13, 2, (uint64_t *)&v22);
    goto LABEL_11;
  }
  long long v11 = v10;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10000A944;
  v17[3] = &unk_100058B18;
  void v17[4] = a2;
  [v10 setFileAttributesOf:v7 to:v6 requestID:a2 reply:v17];

LABEL_11:
  return 0;
}

void sub_10000A850(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = livefs_std_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_10003BE78();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  memset(v6, 0, 512);
  sub_1000039F4(v5, 5, 2, (uint64_t *)v6);
}

void sub_10000A944(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  memset(v31, 0, sizeof(v31));
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  if (!a2)
  {
    if (v7
      && (unint64_t)objc_msgSend(v7, "length", v19, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29, v30, v31[0], v31[1], v32, v33, v34,
                             v35,
                             v36,
                             v37,
                             v38,
                             v39,
                             v40,
                             v41,
                             v42,
                             v43,
                             v44,
                             v45,
                             v46,
                             v47,
                             (void)v48) >= 0xB8)
    {
      id v9 = [v7 bytes];
      long long v10 = v9[3];
      long long v12 = *v9;
      long long v11 = v9[1];
      long long v22 = v9[2];
      long long v23 = v10;
      long long v20 = v12;
      long long v21 = v11;
      long long v13 = v9[7];
      long long v15 = v9[4];
      long long v14 = v9[5];
      long long v26 = v9[6];
      long long v27 = v13;
      long long v24 = v15;
      long long v25 = v14;
      long long v17 = v9[9];
      long long v16 = v9[10];
      long long v18 = v9[8];
      *(void *)&v31[0] = *((void *)v9 + 22);
      long long v29 = v17;
      long long v30 = v16;
      long long v28 = v18;
      if (!v8)
      {
LABEL_5:
        *(void *)&v31[1] = 0;
        goto LABEL_8;
      }
    }
    else
    {
      *(void *)&v31[0] = 0;
      long long v29 = 0u;
      long long v30 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      long long v20 = 0u;
      if (!v8) {
        goto LABEL_5;
      }
    }
    *(_OWORD *)((char *)v31 + 8) = *(_OWORD *)[v8 bytes];
  }
LABEL_8:
  sub_1000039F4(*(void *)(a1 + 32), a2, 14, (uint64_t *)&v19);
}

uint64_t sub_10000AAC4(uint64_t a1, uint64_t a2, unsigned int *a3)
{
  id v19 = 0;
  uint64_t v20 = 0;
  int v4 = sub_10000328C(a3, (_DWORD *)&v20 + 1, &v19, (int *)&v20, 1);
  id v5 = v19;
  vm_map_t v6 = v5;
  int v7 = v20;
  if (!v4 && !v20)
  {
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    [v5 copyDisconnectedRootAttrs:&v22];
    uint64_t v8 = a2;
    int v9 = 0;
    int v10 = 15;
LABEL_14:
    sub_1000039F4(v8, v9, v10, (uint64_t *)&v21);
    goto LABEL_15;
  }
  if (!v5)
  {
    long long v13 = livefs_std_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_10003BEEC();
    }

    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v8 = a2;
    int v9 = v7;
    goto LABEL_13;
  }
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10000ADBC;
  v17[3] = &unk_100058940;
  int v18 = HIDWORD(v20);
  void v17[4] = a2;
  long long v11 = [v5 fsObjWithErrorHandler:v17];
  if (!v11)
  {
    long long v14 = livefs_std_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_10003BF60();
    }

    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v8 = a2;
    int v9 = 5;
LABEL_13:
    int v10 = 2;
    goto LABEL_14;
  }
  long long v12 = v11;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10000AEB0;
  v16[3] = &unk_100058960;
  v16[4] = a2;
  [v11 fileAttributes:v4 requestID:a2 reply:v16];

LABEL_15:
  return 0;
}

void sub_10000ADBC(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = livefs_std_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_10003BFD4();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  memset(v6, 0, 512);
  sub_1000039F4(v5, 5, 2, (uint64_t *)v6);
}

void sub_10000AEB0(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  vm_map_t v6 = v5;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  if (!a2)
  {
    if (v5
      && (unint64_t)objc_msgSend(v5, "length", v17, v18, v19, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29, v30, v31, v32, v33,
                             v34,
                             v35,
                             v36,
                             v37,
                             v38,
                             v39,
                             v40,
                             v41,
                             v42,
                             v43,
                             v44,
                             v45,
                             v46,
                             (void)v47) >= 0xB8)
    {
      int v7 = [v6 bytes];
      a2 = 0;
      long long v8 = v7[3];
      long long v10 = *v7;
      long long v9 = v7[1];
      long long v20 = v7[2];
      long long v21 = v8;
      long long v18 = v10;
      long long v19 = v9;
      long long v11 = v7[7];
      long long v13 = v7[4];
      long long v12 = v7[5];
      long long v24 = v7[6];
      long long v25 = v11;
      long long v22 = v13;
      long long v23 = v12;
      long long v15 = v7[9];
      long long v14 = v7[10];
      long long v16 = v7[8];
      *(void *)&long long v29 = *((void *)v7 + 22);
      long long v27 = v15;
      long long v28 = v14;
      long long v26 = v16;
    }
    else
    {
      a2 = 96;
    }
  }
  sub_1000039F4(*(void *)(a1 + 32), a2, 15, (uint64_t *)&v17);
}

uint64_t sub_10000AFE0(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int *a4, unsigned int a5, uint64_t a6, uint64_t a7)
{
  id v29 = 0;
  uint64_t v30 = 0;
  long long v12 = sub_10000328C(a4, (_DWORD *)&v30 + 1, &v29, (int *)&v30, 0);
  id v13 = v29;
  long long v14 = v13;
  if (v13)
  {
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_10000B394;
    v27[3] = &unk_100058940;
    int v28 = HIDWORD(v30);
    v27[4] = a2;
    long long v15 = [v13 fsObjWithErrorHandler:v27];
    if (v15)
    {
      *(void *)&long long v31 = 0;
      *((void *)&v31 + 1) = &v31;
      *(void *)&long long v32 = 0x43010000000;
      *((void *)&v32 + 1) = "";
      long long v33 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      long long v58 = 0u;
      long long v59 = 0u;
      long long v60 = 0u;
      long long v61 = 0u;
      long long v62 = 0u;
      long long v63 = 0u;
      long long v64 = 0u;
      uint64_t v23 = 0;
      long long v24 = &v23;
      uint64_t v25 = 0x2020000000;
      long long v26 = &v33;
      long long v16 = +[LiveFSSharedMutableBuffer dataWithLength:a5];
      id v17 = [v16 mutableBytes];
      *(void *)(v24[3] + 40) = v17;
      [v16 detachBytes];
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_10000B488;
      v21[3] = &unk_100058B40;
      v21[4] = &v23;
      void v21[5] = &v31;
      v21[6] = a2;
      unsigned int v22 = a5;
      [v15 readDirectory:v12 intoBuffer:v16 requestedAttributes:a7 | 0x100 cookie:a3 verifier:a6 requestID:a2 reply:v21];

      _Block_object_dispose(&v23, 8);
      _Block_object_dispose(&v31, 8);
    }
    else
    {
      long long v19 = livefs_std_log();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        sub_10003C0BC();
      }

      long long v61 = 0u;
      long long v62 = 0u;
      long long v59 = 0u;
      long long v60 = 0u;
      long long v57 = 0u;
      long long v58 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      sub_1000039F4(a2, 5, 2, (uint64_t *)&v31);
    }
  }
  else
  {
    long long v18 = livefs_std_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_10003C048();
    }

    long long v61 = 0u;
    long long v62 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    sub_1000039F4(a2, v30, 2, (uint64_t *)&v31);
  }

  return 0;
}

void sub_10000B368(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
}

void sub_10000B394(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = livefs_std_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_10003C130();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  memset(v6, 0, 512);
  sub_1000039F4(v5, 5, 2, (uint64_t *)v6);
}

uint64_t sub_10000B488(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = *(void *)(*(void *)(a1 + 40) + 8) + 32;
  if ((a2 & 0x80000000) == 0)
  {
    if (a2) {
      goto LABEL_10;
    }
LABEL_8:
    a2 = 0;
    *(void *)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) + 24) = a4;
    *(_DWORD *)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) + 32) = a3;
    goto LABEL_10;
  }
  if (a2 != -1002)
  {
    if (a2 != -1001) {
      goto LABEL_10;
    }
    if (!a3) {
      *(void *)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) + 16) = -1;
    }
    goto LABEL_8;
  }
  a2 = 22;
LABEL_10:
  sub_1000039F4(*(void *)(a1 + 48), a2, 16, *(uint64_t **)(*(void *)(*(void *)(a1 + 32) + 8) + 24));
  vm_map_t v5 = mach_task_self_;
  vm_address_t v6 = *(void *)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) + 40);
  vm_size_t v7 = *(unsigned int *)(a1 + 56);

  return vm_deallocate(v5, v6, v7);
}

uint64_t sub_10000B568(uint64_t a1, uint64_t a2, unsigned int *a3, uint64_t a4, const void *a5, unsigned int a6)
{
  id v34 = 0;
  uint64_t v35 = 0;
  long long v10 = sub_10000328C(a3, (_DWORD *)&v35 + 1, &v34, (int *)&v35, 0);
  id v11 = v34;
  long long v12 = v11;
  if (!v11)
  {
    long long v18 = livefs_std_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_10003C1A4();
    }

    int v19 = v35;
    long long v66 = 0u;
    long long v67 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    uint64_t v20 = a2;
    goto LABEL_11;
  }
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_10000B8E0;
  v32[3] = &unk_100058940;
  int v33 = HIDWORD(v35);
  v32[4] = a2;
  uint64_t v13 = [v11 fsObjWithErrorHandler:v32];
  if (!v13)
  {
    long long v21 = livefs_std_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_10003C218();
    }

    long long v66 = 0u;
    long long v67 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    uint64_t v20 = a2;
    int v19 = 5;
LABEL_11:
    sub_1000039F4(v20, v19, 2, (uint64_t *)&v36);
    goto LABEL_16;
  }
  long long v14 = (void *)v13;
  long long v15 = dispatch_get_global_queue(0, 0);
  dispatch_data_t v16 = dispatch_data_create(a5, a6, v15, _dispatch_data_destructor_munmap);

  if (v16)
  {
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    _OWORD v31[2] = sub_10000B9D4;
    v31[3] = &unk_100058B60;
    v31[4] = a2;
    id v17 = v16;
    [v14 writeTo:v10 atOffset:a4 fromBuffer:v17 requestID:a2 reply:v31];
  }
  else
  {
    unsigned int v22 = livefs_std_log();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_10003C28C(v22, v23, v24, v25, v26, v27, v28, v29);
    }

    long long v66 = 0u;
    long long v67 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    sub_1000039F4(a2, 12, 2, (uint64_t *)&v36);
  }

LABEL_16:
  return 0;
}

void sub_10000B8E0(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = livefs_std_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_10003C304();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  memset(v6, 0, 512);
  sub_1000039F4(v5, 5, 2, (uint64_t *)v6);
}

void sub_10000B9D4(uint64_t a1, int a2, int a3, void *a4)
{
  id v7 = a4;
  long long v8 = v7;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v10 = 0u;
  memset(v9, 0, sizeof(v9));
  if (!a2)
  {
    LODWORD(v9[1]) = a3;
    if (v7) {
      *(_OWORD *)((char *)&v9[1] + 8) = *(_OWORD *)objc_msgSend(v7, "bytes", v9[0], v9[1], v9[2], v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23,
    }
                                                     v24,
                                                     v25,
                                                     v26,
                                                     v27,
                                                     v28,
                                                     v29,
                                                     v30,
                                                     v31,
                                                     v32,
                                                     v33,
                                                     v34,
                                                     v35,
                                                     v36,
                                                     (void)v37);
  }
  sub_1000039F4(*(void *)(a1 + 32), a2, 17, (uint64_t *)v9);
}

uint64_t sub_10000BAC8(uint64_t a1, unsigned int *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int *a7)
{
  dispatch_semaphore_t v12 = dispatch_semaphore_create(0);
  int v30 = 0;
  id v29 = 0;
  long long v13 = sub_10000328C(a2, &v30, &v29, a7, 0);
  id v14 = v29;
  long long v15 = v14;
  if (v13 && v14)
  {
    *a7 = 0;
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_10000BCC8;
    v26[3] = &unk_100058B88;
    long long v28 = a7;
    long long v16 = v12;
    long long v27 = v16;
    long long v17 = [v15 fsObjWithErrorHandler:v26];
    id v18 = +[LiveFSSharedMutableBuffer newByCopyingPort:a5];
    if (v18)
    {
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_10000BCDC;
      v22[3] = &unk_100058BB0;
      long long v24 = a7;
      uint64_t v25 = a6;
      long long v19 = v16;
      long long v23 = v19;
      [v17 writeTo:v13 atOffset:a3 sharedBuffer:v18 requestID:-1 reply:v22];
      dispatch_time_t v20 = dispatch_time(0, 5000000000);
      if (dispatch_semaphore_wait(v19, v20)) {
        *a7 = 60;
      }
    }
    else
    {
      *a7 = 12;
    }
  }
  else
  {
    *a7 = 70;
  }

  return 0;
}

intptr_t sub_10000BCC8(uint64_t a1)
{
  **(_DWORD **)(a1 + 40) = 5;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

intptr_t sub_10000BCDC(uint64_t a1, int a2, int a3)
{
  **(_DWORD **)(a1 + 40) = a2;
  if (!a2) {
    **(_DWORD **)(a1 + 48) = a3;
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t sub_10000BCF8(uint64_t a1, uint64_t a2, unsigned int *a3, unsigned int a4, uint64_t a5)
{
  id v25 = 0;
  uint64_t v26 = 0;
  long long v8 = sub_10000328C(a3, (_DWORD *)&v26 + 1, &v25, (int *)&v26, 0);
  id v9 = v25;
  long long v10 = v9;
  if (v9)
  {
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_10000C094;
    v23[3] = &unk_100058940;
    int v24 = HIDWORD(v26);
    v23[4] = a2;
    long long v11 = [v9 fsObjWithErrorHandler:v23];
    if (v11)
    {
      *(void *)&long long v27 = 0;
      *((void *)&v27 + 1) = &v27;
      *(void *)&long long v28 = 0x43010000000;
      *((void *)&v28 + 1) = "";
      long long v29 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      long long v58 = 0u;
      long long v59 = 0u;
      long long v60 = 0u;
      uint64_t v19 = 0;
      dispatch_time_t v20 = &v19;
      uint64_t v21 = 0x2020000000;
      long long v22 = &v29;
      dispatch_semaphore_t v12 = +[LiveFSSharedMutableBuffer dataWithLength:a4];
      id v13 = [v12 mutableBytes];
      *(void *)(v20[3] + 24) = v13;
      [v12 detachBytes];
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_10000C188;
      v17[3] = &unk_100058BD8;
      void v17[4] = &v19;
      void v17[5] = &v27;
      v17[6] = a2;
      unsigned int v18 = a4;
      [v11 readFrom:v8 atOffset:a5 intoBuffer:v12 requestID:a2 reply:v17];

      _Block_object_dispose(&v19, 8);
      _Block_object_dispose(&v27, 8);
    }
    else
    {
      long long v15 = livefs_std_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        sub_10003C3EC();
      }

      long long v57 = 0u;
      long long v58 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      sub_1000039F4(a2, 5, 2, (uint64_t *)&v27);
    }
  }
  else
  {
    id v14 = livefs_std_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_10003C378();
    }

    long long v57 = 0u;
    long long v58 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    sub_1000039F4(a2, v26, 2, (uint64_t *)&v27);
  }

  return 0;
}

void sub_10000C068(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

void sub_10000C094(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = livefs_std_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_10003C460();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  memset(v6, 0, 512);
  sub_1000039F4(v5, 5, 2, (uint64_t *)v6);
}

uint64_t sub_10000C188(uint64_t a1, int a2, int a3)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = *(void *)(*(void *)(a1 + 40) + 8) + 32;
  if (!a2) {
    *(_DWORD *)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) + 16) = a3;
  }
  sub_1000039F4(*(void *)(a1 + 48), a2, 19, *(uint64_t **)(*(void *)(*(void *)(a1 + 32) + 8) + 24));
  vm_map_t v4 = mach_task_self_;
  vm_address_t v5 = *(void *)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) + 24);
  vm_size_t v6 = *(unsigned int *)(a1 + 56);

  return vm_deallocate(v4, v5, v6);
}

uint64_t sub_10000C21C(uint64_t a1, unsigned int *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int *a7)
{
  dispatch_semaphore_t v12 = dispatch_semaphore_create(0);
  int v30 = 0;
  id v29 = 0;
  id v13 = sub_10000328C(a2, &v30, &v29, a7, 0);
  id v14 = v29;
  long long v15 = v14;
  if (v13 && v14)
  {
    *a7 = 0;
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_10000C41C;
    v26[3] = &unk_100058B88;
    long long v28 = a7;
    long long v16 = v12;
    long long v27 = v16;
    long long v17 = [v15 fsObjWithErrorHandler:v26];
    id v18 = +[LiveFSSharedMutableBuffer newByCopyingPort:a5];
    if (v18)
    {
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_10000C430;
      v22[3] = &unk_100058C00;
      int v24 = a7;
      uint64_t v25 = a6;
      uint64_t v19 = v16;
      long long v23 = v19;
      [v17 readFrom:v13 atOffset:a3 intoBuffer:v18 requestID:-1 reply:v22];
      dispatch_time_t v20 = dispatch_time(0, 5000000000);
      if (dispatch_semaphore_wait(v19, v20)) {
        *a7 = 60;
      }
    }
    else
    {
      *a7 = 12;
    }
  }
  else
  {
    *a7 = 70;
  }

  return 0;
}

intptr_t sub_10000C41C(uint64_t a1)
{
  **(_DWORD **)(a1 + 40) = 5;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

intptr_t sub_10000C430(uint64_t a1, int a2, int a3)
{
  **(_DWORD **)(a1 + 40) = a2;
  if (!a2) {
    **(_DWORD **)(a1 + 48) = a3;
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t sub_10000C44C(uint64_t a1, uint64_t a2, unsigned int *a3)
{
  id v18 = 0;
  uint64_t v19 = 0;
  vm_map_t v4 = sub_10000328C(a3, (_DWORD *)&v19 + 1, &v18, (int *)&v19, 0);
  id v5 = v18;
  vm_size_t v6 = v5;
  if (!v5)
  {
    long long v10 = livefs_std_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10003C4D4();
    }

    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v11 = a2;
    int v12 = 22;
    goto LABEL_10;
  }
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10000C6DC;
  v16[3] = &unk_100058940;
  int v17 = HIDWORD(v19);
  v16[4] = a2;
  uint64_t v7 = [v5 fsSynchObjWithErrorHandler:v16];
  if (!v7)
  {
    id v13 = livefs_std_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_10003C548();
    }

    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v11 = a2;
    int v12 = 5;
LABEL_10:
    sub_1000039F4(v11, v12, 2, (uint64_t *)&v20);
    goto LABEL_11;
  }
  long long v8 = (void *)v7;
  id v9 = [v6 rootLIFileHandle];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10000C7D0;
  v15[3] = &unk_100058960;
  v15[4] = a2;
  [v8 pathConfiguration:v9 requestID:a2 reply:v15];

LABEL_11:
  return 0;
}

void sub_10000C6DC(uint64_t a1, void *a2)
{
  id v3 = a2;
  vm_map_t v4 = livefs_std_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_10003C5BC();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  memset(v6, 0, 512);
  sub_1000039F4(v5, 5, 2, (uint64_t *)v6);
}

void sub_10000C7D0(uint64_t a1, int a2, id a3)
{
  uint64_t v5 = [a3 bytes];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  if (!a2)
  {
    LODWORD(v8) = *v5;
    unsigned int v6 = *((unsigned __int8 *)v5 + 12);
    LODWORD(v9) = (v6 & 4) == 0;
    DWORD1(v9) = (v6 >> 3) & 1;
    DWORD2(v8) = (v6 >> 1) & 1;
    DWORD1(v8) = v5[1];
    HIDWORD(v8) = v6 & 1;
    DWORD2(v9) = v5[2];
  }
  sub_1000039F4(*(void *)(a1 + 32), a2, 21, (uint64_t *)&v7);
}

uint64_t sub_10000C8D8(uint64_t a1, uint64_t a2, unsigned int *a3)
{
  id v17 = 0;
  uint64_t v18 = 0;
  vm_map_t v4 = sub_10000328C(a3, (_DWORD *)&v18 + 1, &v17, (int *)&v18, 1);
  id v5 = v17;
  unsigned int v6 = v5;
  if (!v5)
  {
    long long v9 = livefs_std_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "lifs_reclaim_send";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = HIDWORD(v18);
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s: Unable to find entry for index %u", buf, 0x12u);
    }

    int v10 = v18;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    memset(buf, 0, sizeof(buf));
    uint64_t v11 = a2;
    goto LABEL_10;
  }
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10000CBC0;
  v15[3] = &unk_100058C20;
  int v16 = HIDWORD(v18);
  long long v7 = [v5 fsObjWithErrorHandler:v15];
  if (!v7)
  {
    long long v12 = livefs_std_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "lifs_reclaim_send";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = HIDWORD(v18);
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%s: Unable to get fsobj for idx %u", buf, 0x12u);
    }

    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    memset(buf, 0, sizeof(buf));
    uint64_t v11 = a2;
    int v10 = 5;
LABEL_10:
    sub_1000039F4(v11, v10, 2, (uint64_t *)buf);
    goto LABEL_11;
  }
  long long v8 = v7;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10000CC24;
  v14[3] = &unk_100058960;
  v14[4] = a2;
  [v7 reclaim:v4 requestID:a2 reply:v14];

LABEL_11:
  return 0;
}

void sub_10000CBC0(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = livefs_std_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_10003C630();
  }
}

void sub_10000CC24(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  unsigned int v6 = v5;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  if (!a2 && v5) {
    long long v8 = *(_OWORD *)objc_msgSend(v5, "bytes", v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23,
  }
                      v24,
                      v25,
                      v26,
                      v27,
                      v28,
                      v29,
                      v30,
                      v31,
                      v32,
                      v33,
                      v34,
                      v35,
                      v36,
                      (void)v37);
  sub_1000039F4(*(void *)(a1 + 32), a2, 42, (uint64_t *)&v7);
}

uint64_t sub_10000CD08(uint64_t a1, uint64_t a2, unsigned int *a3, uint64_t a4)
{
  id v19 = 0;
  uint64_t v20 = 0;
  unsigned int v6 = sub_10000328C(a3, (_DWORD *)&v20 + 1, &v19, (int *)&v20, 1);
  id v7 = v19;
  long long v8 = v7;
  if (!v7)
  {
    long long v11 = livefs_std_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "lifs_access_send";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = HIDWORD(v20);
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s: Unable to find entry for index %u", buf, 0x12u);
    }

    int v12 = v20;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    memset(buf, 0, sizeof(buf));
    uint64_t v13 = a2;
    goto LABEL_10;
  }
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10000D008;
  v17[3] = &unk_100058940;
  int v18 = HIDWORD(v20);
  void v17[4] = a2;
  long long v9 = [v7 fsObjWithErrorHandler:v17];
  if (!v9)
  {
    long long v14 = livefs_std_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "lifs_access_send";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = HIDWORD(v20);
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%s: Unable to get fsobj for idx %u", buf, 0x12u);
    }

    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    memset(buf, 0, sizeof(buf));
    uint64_t v13 = a2;
    int v12 = 5;
LABEL_10:
    sub_1000039F4(v13, v12, 2, (uint64_t *)buf);
    goto LABEL_11;
  }
  long long v10 = v9;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10000D0FC;
  v16[3] = &unk_100058AD8;
  v16[4] = a2;
  [v9 checkAccessTo:v6 requestedAccess:a4 requestID:a2 reply:v16];

LABEL_11:
  return 0;
}

void sub_10000D008(uint64_t a1, void *a2)
{
  id v3 = a2;
  vm_map_t v4 = livefs_std_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_10003C6A8();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  memset(v6, 0, 512);
  sub_1000039F4(v5, 5, 2, (uint64_t *)v6);
}

void sub_10000D0FC(uint64_t a1, int a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  memset(v3, 0, 512);
  sub_1000039F4(v2, a2, 2, (uint64_t *)v3);
}

uint64_t sub_10000D1A4(uint64_t a1, uint64_t a2, unsigned int *a3, uint64_t a4, uint64_t a5, int a6)
{
  id v25 = 0;
  uint64_t v26 = 0;
  long long v10 = sub_10000328C(a3, (_DWORD *)&v26 + 1, &v25, (int *)&v26, 0);
  id v11 = v25;
  int v12 = v11;
  if (!v11)
  {
    long long v16 = livefs_std_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_10003C71C();
    }

    int v17 = v26;
    long long v57 = 0u;
    long long v58 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    uint64_t v18 = a2;
    goto LABEL_13;
  }
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_10000D4E0;
  v23[3] = &unk_100058940;
  int v24 = HIDWORD(v26);
  v23[4] = a2;
  uint64_t v13 = [v11 fsObjWithErrorHandler:v23];
  if (!v13)
  {
    id v19 = livefs_std_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_10003C790();
    }

    long long v57 = 0u;
    long long v58 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    uint64_t v18 = a2;
    int v17 = 5;
LABEL_13:
    sub_1000039F4(v18, v17, 2, (uint64_t *)&v27);
    goto LABEL_16;
  }
  long long v14 = (void *)v13;
  if (a6)
  {
    long long v15 = livefs_std_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_10003C804();
    }

    long long v57 = 0u;
    long long v58 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    sub_1000039F4(a2, 22, 2, (uint64_t *)&v27);
  }
  else
  {
    uint64_t v20 = +[FSFileName nameWithCString:a4];
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_10000D5D4;
    v22[3] = &unk_100058C40;
    void v22[4] = a5;
    void v22[5] = a2;
    [v14 xattrOf:v10 named:v20 requestID:a2 reply:v22];
  }
LABEL_16:

  return 0;
}

void sub_10000D4E0(uint64_t a1, void *a2)
{
  id v3 = a2;
  vm_map_t v4 = livefs_std_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_10003C878();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  memset(v6, 0, 512);
  sub_1000039F4(v5, 5, 2, (uint64_t *)v6);
}

void sub_10000D5D4(uint64_t a1, int a2, void *a3)
{
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  if (!a2)
  {
    id v5 = a3;
    *(void *)&long long v11 = objc_msgSend(v5, "length", v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25, v26,
                        v27,
                        v28,
                        v29,
                        v30,
                        v31,
                        v32,
                        v33,
                        v34,
                        v35,
                        v36,
                        v37,
                        v38,
                        v39,
                        (void)v40);
    id v6 = [v5 length];
    id v7 = *(id *)(a1 + 32);
    if (v6 < v7) {
      id v7 = v6;
    }
    *((void *)&v11 + 1) = v7;
    id v8 = v5;
    id v9 = [v8 bytes];

    *(void *)&long long v12 = v9;
  }
  sub_1000039F4(*(void *)(a1 + 40), a2, 24, (uint64_t *)&v10);
}

uint64_t sub_10000D6E0(uint64_t a1, uint64_t a2, unsigned int *a3, uint64_t a4, uint64_t a5, unint64_t a6, int a7, uint64_t a8)
{
  if (a6 < 0x401)
  {
    sub_10000D7B8(a2, a3, a4, a5, a6, a7, a8);
  }
  else
  {
    memset(v9, 0, 512);
    sub_1000039F4(a2, 22, 2, (uint64_t *)v9);
  }
  return 0;
}

void sub_10000D7B8(uint64_t a1, unsigned int *a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, uint64_t a7)
{
  id v28 = 0;
  uint64_t v29 = 0;
  long long v13 = sub_10000328C(a2, (_DWORD *)&v29 + 1, &v28, (int *)&v29, 0);
  id v14 = v28;
  long long v15 = v14;
  if (!v14)
  {
    long long v19 = livefs_std_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_10003C8EC();
    }

    int v20 = v29;
    long long v60 = 0u;
    long long v61 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    uint64_t v21 = a1;
    goto LABEL_13;
  }
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_10000F084;
  v26[3] = &unk_100058940;
  int v27 = HIDWORD(v29);
  void v26[4] = a1;
  uint64_t v16 = [v14 fsObjWithErrorHandler:v26];
  if (!v16)
  {
    long long v22 = livefs_std_log();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_10003C960();
    }

    long long v60 = 0u;
    long long v61 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    uint64_t v21 = a1;
    int v20 = 5;
LABEL_13:
    sub_1000039F4(v21, v20, 2, (uint64_t *)&v30);
    goto LABEL_19;
  }
  long long v17 = (void *)v16;
  if (a6)
  {
    long long v18 = livefs_std_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_10003C9D4();
    }

    long long v60 = 0u;
    long long v61 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    sub_1000039F4(a1, 22, 2, (uint64_t *)&v30);
  }
  else
  {
    if (a4)
    {
      long long v23 = +[NSData dataWithBytes:a4 length:a5];
    }
    else
    {
      long long v23 = 0;
    }
    long long v24 = +[FSFileName nameWithCString:a3];
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_10000F178;
    v25[3] = &unk_100058AD8;
    v25[4] = a1;
    [v17 setXattrOf:v13 named:v24 value:v23 how:a7 requestID:a1 reply:v25];
  }
LABEL_19:
}

uint64_t sub_10000DB3C(uint64_t a1, uint64_t a2, unsigned int *a3, uint64_t a4, vm_address_t a5, unsigned int a6, int a7, uint64_t a8)
{
  LODWORD(v8) = a6;
  if (a6 <= 0x40000)
  {
    vm_size_t v8 = a6;
    sub_10000D7B8(a2, a3, a4, a5, a6, a7, a8);
  }
  else
  {
    memset(v11, 0, 512);
    sub_1000039F4(a2, 22, 2, (uint64_t *)v11);
    vm_size_t v8 = v8;
  }
  vm_deallocate(mach_task_self_, a5, v8);
  return 0;
}

uint64_t sub_10000DC44(uint64_t a1, uint64_t a2, unsigned int *a3, uint64_t a4)
{
  return 0;
}

uint64_t sub_10000DC7C(uint64_t a1, uint64_t a2, unsigned int *a3, uint64_t a4)
{
  id v19 = 0;
  uint64_t v20 = 0;
  id v6 = sub_10000328C(a3, (_DWORD *)&v20 + 1, &v19, (int *)&v20, 0);
  id v7 = v19;
  vm_size_t v8 = v7;
  if (!v7)
  {
    long long v11 = livefs_std_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10003CA48();
    }

    int v12 = v20;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v13 = a2;
    goto LABEL_10;
  }
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10000DEF4;
  v17[3] = &unk_100058940;
  int v18 = HIDWORD(v20);
  void v17[4] = a2;
  id v9 = [v7 fsObjWithErrorHandler:v17];
  if (!v9)
  {
    id v14 = livefs_std_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_10003CABC();
    }

    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v13 = a2;
    int v12 = 5;
LABEL_10:
    sub_1000039F4(v13, v12, 2, (uint64_t *)&v21);
    goto LABEL_11;
  }
  long long v10 = v9;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10000DFE8;
  v16[3] = &unk_100058C60;
  v16[4] = a2;
  void v16[5] = a4;
  [v9 listXattrsOf:v6 requestID:a2 reply:v16];

LABEL_11:
  return 0;
}

void sub_10000DEF4(uint64_t a1, void *a2)
{
  id v3 = a2;
  vm_map_t v4 = livefs_std_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_10003CB30();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  memset(v6, 0, 512);
  sub_1000039F4(v5, 5, 2, (uint64_t *)v6);
}

void sub_10000DFE8(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = [v5 count];
  if (v6)
  {
    uint64_t v7 = 0;
    vm_size_t v8 = 0;
    unsigned int v9 = 0;
    do
    {
      id v10 = [v5 objectAtIndex:v7];

      v9 += [v10 lengthOfBytesUsingEncoding:4] + 1;
      ++v7;
      vm_size_t v8 = v10;
    }
    while (v6 != v7);
  }
  else
  {
    unsigned int v9 = 0;
    id v10 = 0;
  }
  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  if (v9 <= 1) {
    size_t v11 = 1;
  }
  else {
    size_t v11 = v9;
  }
  long long v21 = 0uLL;
  long long v22 = 0uLL;
  int v12 = malloc_type_malloc(v11, 0x73A8D213uLL);
  if (v12)
  {
    uint64_t v13 = v12;
    if (v6)
    {
      uint64_t v14 = 0;
      long long v15 = (char *)v12;
      do
      {
        objc_msgSend(v5, "objectAtIndex:", v14, v21, v22, v23, v24, v25, v26, v27, v28, v29, v30, v31, v32, v33, v34, v35, v36,
          v37,
          v38,
          v39,
          v40,
          v41,
          v42,
          v43,
          v44,
          v45,
          v46,
          v47,
          v48,
          v49,
        uint64_t v16 = v50);

        id v10 = v16;
        strcpy(v15, (const char *)[v10 UTF8String]);
        long long v17 = (char *)[v10 lengthOfBytesUsingEncoding:4] + (void)v15;
        *long long v17 = 0;
        long long v15 = v17 + 1;
        ++v14;
      }
      while (v6 != v14);
    }
    uint64_t v18 = *(void *)(a1 + 32);
    unint64_t v19 = *(void *)(a1 + 40);
    if (v19 >= v9) {
      unint64_t v19 = v9;
    }
    *(void *)&long long v22 = v9;
    *((void *)&v22 + 1) = v19;
    *(void *)&long long v23 = v13;
    sub_1000039F4(v18, a2, 24, (uint64_t *)&v21);
    free(v13);
  }
  else
  {
    uint64_t v20 = *(void *)(a1 + 32);
    memset(v53, 0, 512);
    sub_1000039F4(v20, 12, 2, (uint64_t *)v53);
  }
}

uint64_t sub_10000E264(uint64_t a1, uint64_t a2, unsigned int *a3)
{
  id v17 = 0;
  uint64_t v18 = 0;
  vm_map_t v4 = sub_10000328C(a3, (_DWORD *)&v18 + 1, &v17, (int *)&v18, 0);
  id v5 = v17;
  uint64_t v6 = v5;
  if (!v5)
  {
    unsigned int v9 = livefs_std_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10003CBA4();
    }

    int v10 = v18;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    uint64_t v11 = a2;
    goto LABEL_10;
  }
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10000E4E4;
  v15[3] = &unk_100058940;
  int v16 = HIDWORD(v18);
  void v15[4] = a2;
  uint64_t v7 = [v5 fsObjWithErrorHandler:v15];
  if (!v7)
  {
    int v12 = livefs_std_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10003CC18();
    }

    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    uint64_t v11 = a2;
    int v10 = 5;
LABEL_10:
    sub_1000039F4(v11, v10, 2, (uint64_t *)&v19);
    goto LABEL_11;
  }
  vm_size_t v8 = v7;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10000E5D8;
  v14[3] = &unk_100058C80;
  v14[4] = a2;
  [v7 fetchVolumeMachPortLabeled:FSKitVolumeMachPortForKernelMount requestID:a2 reply:v14];

LABEL_11:
  return 0;
}

void sub_10000E4E4(uint64_t a1, void *a2)
{
  id v3 = a2;
  vm_map_t v4 = livefs_std_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_10003CC8C();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  memset(v6, 0, 512);
  sub_1000039F4(v5, 5, 2, (uint64_t *)v6);
}

void sub_10000E5D8(uint64_t a1, int a2, void *a3)
{
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v5 = 0u;
  long long v6 = 0u;
  if (!a2) {
    LODWORD(v6) = objc_msgSend(a3, "machPort", v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21,
  }
                                  v22,
                                  v23,
                                  v24,
                                  v25,
                                  v26,
                                  v27,
                                  v28,
                                  v29,
                                  v30,
                                  v31,
                                  v32,
                                  v33,
                                  v34,
                                  (void)v35);
  sub_1000039F4(*(void *)(a1 + 32), a2, 30, (uint64_t *)&v5);
}

uint64_t sub_10000E6A4(uint64_t a1, uint64_t a2, unsigned int *a3, uint64_t a4, unsigned int a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  id v29 = 0;
  uint64_t v30 = 0;
  long long v14 = sub_10000328C(a3, (_DWORD *)&v30 + 1, &v29, (int *)&v30, 0);
  id v15 = v29;
  long long v16 = v15;
  if (!v15)
  {
    long long v19 = livefs_std_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_10003CD00();
    }

    int v20 = v30;
    long long v61 = 0u;
    long long v62 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v32 = 0u;
    long long v31 = 0u;
    uint64_t v21 = a2;
    goto LABEL_10;
  }
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_10000E958;
  v27[3] = &unk_100058940;
  int v28 = HIDWORD(v30);
  v27[4] = a2;
  long long v17 = [v15 fsObjWithErrorHandler:v27];
  if (!v17)
  {
    long long v22 = livefs_std_log();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_10003CD74();
    }

    long long v61 = 0u;
    long long v62 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v32 = 0u;
    long long v31 = 0u;
    uint64_t v21 = a2;
    int v20 = 5;
LABEL_10:
    sub_1000039F4(v21, v20, 2, (uint64_t *)&v31);
    goto LABEL_11;
  }
  long long v18 = v17;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10000EA4C;
  v24[3] = &unk_100058CA0;
  int v25 = a6;
  int v26 = a7;
  v24[4] = a8;
  void v24[5] = a2;
  [v17 blockmapFile:v14 range:a4 startIO:a5 flags:a6 operationID:a7 reply:a8];

LABEL_11:
  return 0;
}

void sub_10000E958(uint64_t a1, void *a2)
{
  id v3 = a2;
  vm_map_t v4 = livefs_std_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_10003CDE8();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  memset(v6, 0, 512);
  sub_1000039F4(v5, 5, 2, (uint64_t *)v6);
}

void sub_10000EA4C(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v38 = 0u;
  long long v36 = 0u;
  memset(v37, 0, sizeof(v37));
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  if (a2)
  {
    long long v9 = livefs_std_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10003CE5C();
    }
  }
  else
  {
    if (v7)
    {
      unint64_t v10 = (unint64_t)objc_msgSend(v7, "length", v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25, v26, v27, v28,
                                v29,
                                v30,
                                v31,
                                v32,
                                v33,
                                v34,
                                v35,
                                v36,
                                v37[0],
                                v37[1],
                                v38,
                                v39,
                                v40,
                                (void)v41)
          / 0x18;
      if (v10 >= 0x10) {
        int v11 = 16;
      }
      else {
        int v11 = v10;
      }
      LODWORD(v37[0]) = v11;
      [v7 bytes];
      __memcpy_chk();
    }
    if (v8) {
      *(_OWORD *)((char *)v37 + 8) = *(_OWORD *)[v8 bytes];
    }
    else {
      *(void *)&v37[1] = 0;
    }
  }
  sub_1000039F4(*(void *)(a1 + 40), a2, 31, (uint64_t *)&v12);
}

uint64_t sub_10000EBEC(uint64_t a1, uint64_t a2, unsigned int *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  id v29 = 0;
  uint64_t v30 = 0;
  long long v14 = sub_10000328C(a3, (_DWORD *)&v30 + 1, &v29, (int *)&v30, 0);
  id v15 = v29;
  long long v16 = v15;
  if (!v15)
  {
    long long v19 = livefs_std_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_10003CED4();
    }

    int v20 = v30;
    long long v61 = 0u;
    long long v62 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v32 = 0u;
    long long v31 = 0u;
    uint64_t v21 = a2;
    goto LABEL_10;
  }
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_10000EEA0;
  v27[3] = &unk_100058940;
  int v28 = HIDWORD(v30);
  v27[4] = a2;
  long long v17 = [v15 fsObjWithErrorHandler:v27];
  if (!v17)
  {
    long long v22 = livefs_std_log();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_10003CF48();
    }

    long long v61 = 0u;
    long long v62 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v32 = 0u;
    long long v31 = 0u;
    uint64_t v21 = a2;
    int v20 = 5;
LABEL_10:
    sub_1000039F4(v21, v20, 2, (uint64_t *)&v31);
    goto LABEL_11;
  }
  long long v18 = v17;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10000EF94;
  v24[3] = &unk_100058CC0;
  int v25 = a6;
  int v26 = a7;
  v24[4] = a8;
  void v24[5] = a2;
  [v17 endIO:v14 range:a4 status:a5 flags:a6 operationID:a7 reply:v24];

LABEL_11:
  return 0;
}

void sub_10000EEA0(uint64_t a1, void *a2)
{
  id v3 = a2;
  vm_map_t v4 = livefs_std_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_10003CFBC();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  memset(v6, 0, 512);
  sub_1000039F4(v5, 5, 2, (uint64_t *)v6);
}

void sub_10000EF94(uint64_t a1, int a2)
{
  if (a2)
  {
    vm_map_t v4 = livefs_std_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_10003D030();
    }
  }
  uint64_t v5 = *(void *)(a1 + 40);
  memset(v6, 0, 512);
  sub_1000039F4(v5, a2, 2, (uint64_t *)v6);
}

void sub_10000F084(uint64_t a1, void *a2)
{
  id v3 = a2;
  vm_map_t v4 = livefs_std_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_10003D0A8();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  memset(v6, 0, 512);
  sub_1000039F4(v5, 5, 2, (uint64_t *)v6);
}

void sub_10000F178(uint64_t a1, int a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  memset(v3, 0, 512);
  sub_1000039F4(v2, a2, 2, (uint64_t *)v3);
}

void sub_10000F254(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

void sub_10000F270(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x1Cu);
}

void sub_10000F290(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

void sub_10000F29C(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

void sub_10000F2F0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_10000F30C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_10000F35C(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x18u);
}

void sub_10000F37C(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x28u);
}

void sub_10000F39C(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_10000F3BC(void *a1)
{
  id v1 = a1;
  uint64_t v2 = dispatch_group_create();
  id v3 = +[NSMutableArray array];
  uint64_t v16 = 0;
  long long v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x3032000000;
  v14[3] = sub_10000F5A8;
  v14[4] = sub_10000F5B8;
  id v15 = objc_alloc_init((Class)NSCondition);
  if (!*((unsigned char *)v17 + 24)) {
    dispatch_group_enter(v2);
  }
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000F5C0;
  v8[3] = &unk_100058D60;
  long long v12 = v14;
  long long v13 = &v16;
  id v4 = v1;
  id v9 = v4;
  id v5 = v3;
  id v10 = v5;
  long long v6 = v2;
  int v11 = v6;
  id v7 = +[FPProviderDomain beginMonitoringProviderDomainChangesWithHandler:v8];
  dispatch_group_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  +[FPProviderDomain endMonitoringProviderDomainChanges:v7];

  _Block_object_dispose(v14, 8);
  _Block_object_dispose(&v16, 8);
}

void sub_10000F57C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000F5A8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10000F5B8(uint64_t a1)
{
}

void sub_10000F5C0(uint64_t a1, void *a2, void *a3)
{
  id v23 = a2;
  id v5 = a3;
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) lock];
  uint64_t v6 = *(void *)(*(void *)(a1 + 64) + 8);
  long long v22 = v5;
  if (*(unsigned char *)(v6 + 24))
  {
    [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) unlock];
    goto LABEL_28;
  }
  *(unsigned char *)(v6 + 24) = 1;
  uint64_t v25 = a1;
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) unlock];
  if (!v5)
  {
    long long v37 = 0u;
    long long v38 = 0u;
    long long v36 = 0u;
    long long v35 = 0u;
    id obj = [v23 allValues];
    id v8 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
    if (!v8) {
      goto LABEL_26;
    }
    uint64_t v9 = *(void *)v36;
    while (1)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v36 != v9) {
          objc_enumerationMutation(obj);
        }
        int v11 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        long long v12 = [v11 identifier:v22];
        long long v13 = [v12 componentsSeparatedByString:@"/"];

        if ((unint64_t)[v13 count] < 2)
        {
          id v14 = 0;
          goto LABEL_24;
        }
        id v14 = [v13 objectAtIndexedSubscript:1];
        id v15 = [v11 providerID];
        if ([v15 isEqual:@"com.apple.SMBClientProvider.FileProvider"])
        {
        }
        else
        {
          uint64_t v16 = [v11 providerID];
          unsigned int v17 = [v16 isEqual:@"com.apple.filesystems.UserFS.FileProvider"];

          if (!v17) {
            goto LABEL_24;
          }
        }
        uint64_t v31 = 0;
        long long v32 = &v31;
        uint64_t v33 = 0x2020000000;
        char v34 = 1;
        uint64_t v18 = [v11 providerID];
        if (![v18 isEqual:@"com.apple.SMBClientProvider.FileProvider"])
        {

LABEL_20:
          int v20 = *(void **)(v25 + 32);
          v28[0] = _NSConcreteStackBlock;
          v28[1] = 3221225472;
          v28[2] = sub_10000F9E0;
          v28[3] = &unk_100058CE8;
          id v14 = v14;
          id v29 = v14;
          uint64_t v30 = &v31;
          [v20 enumerateObjectsUsingBlock:v28];
          if (*((unsigned char *)v32 + 24))
          {
            [*(id *)(v25 + 40) addObject:v11];
            dispatch_group_enter(*(dispatch_group_t *)(v25 + 48));
          }

          goto LABEL_23;
        }
        BOOL v19 = (unint64_t)[v14 length] < 7;

        if (!v19) {
          goto LABEL_20;
        }
        *((unsigned char *)v32 + 24) = 0;
LABEL_23:
        _Block_object_dispose(&v31, 8);
LABEL_24:
      }
      id v8 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
      if (!v8)
      {
LABEL_26:

        v26[0] = _NSConcreteStackBlock;
        v26[1] = 3221225472;
        v26[2] = sub_10000FA58;
        v26[3] = &unk_100058D38;
        uint64_t v21 = *(void **)(v25 + 40);
        long long v27 = *(id *)(v25 + 48);
        [v21 enumerateObjectsWithOptions:1 usingBlock:v26];
        id v7 = v27;
        goto LABEL_27;
      }
    }
  }
  id v7 = livefs_std_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    sub_10003D11C();
  }
LABEL_27:

  dispatch_group_leave(*(dispatch_group_t *)(v25 + 48));
LABEL_28:
}

void sub_10000F9C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000F9E0(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v6 = *(void **)(a1 + 32);
  id v7 = [a2 objectForKeyedSubscript:LiveFSMounterDomainStorageKey];
  LODWORD(v6) = [v6 isEqual:v7];

  if (v6)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 1;
  }
}

void sub_10000FA58(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 identifier];
  id v5 = [v4 componentsSeparatedByString:@"/"];
  uint64_t v6 = [v5 objectAtIndexedSubscript:1];
  id v7 = [v3 providerID];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10000FB80;
  _OWORD v9[3] = &unk_100058D10;
  id v10 = v3;
  id v11 = *(id *)(a1 + 32);
  id v8 = v3;
  +[LivefsDomainManager removeDomain:v6 provider:v7 how:0 reply:v9];
}

void sub_10000FB80(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = livefs_std_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_10003D184(a1);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void sub_10000FEE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000FF20(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v2 = dispatch_get_global_queue(2, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000FFD0;
    block[3] = &unk_100058D88;
    id v4 = WeakRetained;
    dispatch_async(v2, block);
  }
}

id sub_10000FFD0(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleInvalidated];
}

void sub_10000FFD8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v2 = dispatch_get_global_queue(2, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100010088;
    block[3] = &unk_100058D88;
    id v4 = WeakRetained;
    dispatch_async(v2, block);
  }
}

id sub_100010088(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleInvalidated];
}

uint64_t start(int a1, char *const *a2)
{
  kern_return_t v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  dispatch_queue_t v10;
  void *v11;
  dispatch_source_t v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  unsigned int v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;
  void *v24;
  unsigned __int16 v25;
  NSObject *v26;
  int v27;
  __CFString *v28;
  __CFString *v29;
  unsigned __int16 v30;
  __CFString *v31;
  __CFString *v32;
  NSObject *v33;
  int has_internal_content;
  NSObject *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  mountTable *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  __CFNotificationCenter *DarwinNotifyCenter;
  NSObject *v46;
  NSObject *v47;
  NSObject *v48;
  NSObject *v50;
  kern_return_t v51;
  NSObject *v52;
  NSObject *v53;
  NSObject *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  NSObject *v62;
  NSObject *v63;
  NSObject *v64;
  uid_t v65;
  void handler[4];
  NSObject *v67;
  mach_port_name_t name;
  char *__endptr;
  uint8_t buf[4];
  void v71[2];

  __endptr = 0;
  name = 0;
  id v4 = livefs_std_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_10003D878();
  }

  id v5 = livefs_std_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v71[0]) = 1;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "main:lifs:v2:%d", buf, 8u);
  }

  uint64_t v6 = mach_port_allocate(mach_task_self_, 1u, &name);
  if (v6)
  {
    long long v51 = v6;
    long long v52 = livefs_std_log();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR)) {
      sub_10003D7D0(v51);
    }

    bootstrap_strerror(v51);
    err(1, "%s: ERROR: bootstrap_check_in() failed: %s - %d");
  }
  if (name - 1 >= 0xFFFFFFFE)
  {
    long long v53 = livefs_std_log();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR)) {
      sub_10003D728(&name, v53);
    }

    err(1, "%s: invalid port - %s");
  }
  id v7 = dispatch_queue_attr_make_with_overcommit();
  id v8 = dispatch_queue_attr_make_with_qos_class(v7, QOS_CLASS_USER_INITIATED, 0);

  uint64_t v9 = dispatch_queue_attr_make_with_autorelease_frequency(v8, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);

  id v10 = dispatch_queue_create("lifs_queue", v9);
  id v11 = (void *)qword_100060730;
  qword_100060730 = (uint64_t)v10;

  long long v12 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_mach_recv, name, 0, (dispatch_queue_t)qword_100060730);
  if (!v12)
  {
    long long v54 = livefs_std_log();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR)) {
      sub_10003D38C(v54, v55, v56, v57, v58, v59, v60, v61);
    }

    err(1, "%s: ERROR: dispatch_source_create() failed");
  }
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_1000109D8;
  handler[3] = &unk_100058D88;
  long long v13 = v12;
  long long v67 = v13;
  dispatch_source_set_event_handler(v13, handler);
  dispatch_activate(v13);
  if (mach_port_insert_right(mach_task_self_, name, name, 0x14u))
  {
    long long v62 = livefs_std_log();
    if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR)) {
      sub_10003D6A8();
    }

    err(1, "%s: ERROR: mach_port_insert_right failed: %d");
  }
  id v14 = +[LiveFSUserClient defaultClient];
  id v15 = (void *)qword_100060738;
  qword_100060738 = v14;

  uint64_t v16 = [(id)qword_100060738 setMainMachPort:name forDomain:&stru_10005A670];
  unsigned int v17 = livefs_std_log();
  uint64_t v18 = v17;
  if (v16)
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_10003D628();
    }

    err(1, "%s: ERROR sending mach port to kernel: %d");
  }
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Done setting up mach ports", buf, 2u);
  }

  BOOL v19 = objc_opt_new();
  int v20 = (void *)qword_100060740;
  qword_100060740 = v19;

  uint64_t v21 = objc_opt_new();
  long long v22 = (void *)qword_100060748;
  qword_100060748 = v21;

  id v23 = objc_alloc_init((Class)FSAuditToken);
  long long v24 = (void *)qword_100060750;
  qword_100060750 = (uint64_t)v23;

  if (!qword_100060750)
  {
    long long v63 = fskit_std_log();
    if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR)) {
      sub_10003D404();
    }

    errx(71, "Unable to get own audit token. Exiting");
  }
  long long v65 = getuid();
  uint64_t v25 = (v65 & 0xF) + 9000;
  int v26 = livefs_std_log();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
    sub_10003D598(v25, v26);
  }

  while (1)
  {
    long long v27 = getopt(a1, a2, "Ln:p:t:v");
    switch(v27)
    {
      case 'n':
        strtoul(optarg, &__endptr, 10);
        if (*__endptr) {
          sub_10003D508();
        }
        continue;
      case 'o':
      case 'q':
      case 'r':
      case 's':
      case 'u':
        goto LABEL_54;
      case 'p':
        if (*optarg == 47)
        {
          +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:");
          int v28 = (__CFString *)objc_claimAutoreleasedReturnValue();
          id v29 = off_1000603A8;
          off_1000603A8 = v28;
        }
        else
        {
          uint64_t v30 = strtol(optarg, &__endptr, 10);
          if (!v30 || *__endptr) {
            sub_10003D538();
          }
          uint64_t v25 = v30;
LABEL_20:
          byte_10006072C = 1;
        }
        break;
      case 't':
        strtoul(optarg, &__endptr, 10);
        if (*__endptr) {
          sub_10003D568();
        }
        continue;
      case 'v':
        ++dword_100060728;
        continue;
      default:
        if (v27 == 76) {
          goto LABEL_20;
        }
        if (v27 != -1) {
LABEL_54:
        }
          sub_10003D438();
        if (byte_10006072C)
        {
          uint64_t v31 = +[NSString stringWithFormat:@"%d", v25];
          long long v32 = off_1000603A8;
          off_1000603A8 = v31;
        }
        if (dword_100060728)
        {
          uint64_t v33 = livefs_std_log();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109378;
            LODWORD(v71[0]) = v65;
            WORD2(v71[0]) = 2112;
            *(void *)((char *)v71 + 6) = off_1000603A8;
            _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Running as %d for port %@", buf, 0x12u);
          }
        }
        has_internal_content = os_variant_has_internal_content();
        byte_100060758 = has_internal_content;
        if (has_internal_content)
        {
          long long v35 = livefs_std_log();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Running on internal build.", buf, 2u);
          }
        }
        long long v37 = os_transaction_create();
        long long v38 = (void *)qword_100060790;
        qword_100060790 = v37;

        long long v39 = objc_alloc_init(mountTable);
        long long v40 = (void *)qword_100060780;
        qword_100060780 = (uint64_t)v39;

        if (!qword_100060780)
        {
          long long v64 = livefs_std_log();
          if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR)) {
            sub_10003D460();
          }

          err(1, "Could not allocate mount table");
        }
        long long v41 = sub_100010A44(2, &stru_100058DF0);
        long long v42 = (void *)qword_100060720;
        qword_100060720 = v41;

        long long v43 = sub_100010A44(15, &stru_100058E10);
        long long v44 = (void *)qword_100060718;
        qword_100060718 = v43;

        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)sub_100010B94, @"com.apple.mobile.keybagd.first_unlock", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
        if (MKBGetDeviceLockState() == 3 || MKBDeviceUnlockedSinceBoot())
        {
          long long v46 = livefs_std_log();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315138;
            v71[0] = "checkIfUnlocked";
            _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "%s:Device was unlocked, proceed with main flow.", buf, 0xCu);
          }

          sub_100010C00();
        }
        else
        {
          long long v50 = livefs_std_log();
          if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "checkIfUnlocked - Device was never unlocked.", buf, 2u);
          }
        }
        long long v47 = livefs_std_log();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG)) {
          sub_10003D4C8();
        }

        CFRunLoopRun();
        long long v48 = livefs_std_log();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
          sub_10003D494();
        }

        return 70;
    }
  }
}

void sub_1000109D8()
{
  uint64_t v0 = dispatch_mig_server();
  if (v0)
  {
    uint64_t v1 = v0;
    uint64_t v2 = livefs_std_log();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      sub_10003D8B8(v1, v2, v3, v4, v5, v6, v7, v8);
    }
  }
}

NSObject *sub_100010A44(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (signal(a1, (void (__cdecl *)(int))1) == (void (__cdecl *)(int))-1)
  {
    uint64_t v7 = livefs_std_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10003D924(a1, v7, v8, v9, v10, v11, v12, v13);
    }
LABEL_10:

    exit(71);
  }
  uint64_t v4 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, a1, 0, (dispatch_queue_t)&_dispatch_main_q);
  if (!v4)
  {
    uint64_t v7 = livefs_std_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10003D990(a1, v7, v14, v15, v16, v17, v18, v19);
    }
    goto LABEL_10;
  }
  uint64_t v5 = v4;
  dispatch_source_set_event_handler(v4, v3);
  dispatch_resume(v5);

  return v5;
}

void sub_100010B2C(id a1)
{
}

void sub_100010B60(id a1)
{
}

void sub_100010B94()
{
  uint64_t v0 = livefs_std_log();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v1 = 0;
    _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEFAULT, "firstUnlockNotificationCallback: Device unlocked", v1, 2u);
  }

  sub_100010C00();
}

void sub_100010C00()
{
  [(id)qword_100060780 tearDownDaemon:0 withPath:off_100060710];
  uint64_t v0 = off_100060710;
  uint64_t v1 = +[NSFileManager defaultManager];
  char v51 = 0;
  NSFileAttributeKey v61 = NSFilePosixPermissions;
  long long v62 = &off_10005B028;
  uint64_t v2 = +[NSDictionary dictionaryWithObjects:&v62 forKeys:&v61 count:1];
  if (![v1 fileExistsAtPath:v0 isDirectory:&v51])
  {
    *(void *)&long long buf = 0;
    unsigned __int8 v7 = [v1 createDirectoryAtPath:v0 withIntermediateDirectories:0 attributes:v2 error:&buf];
    id v5 = (id)buf;
    if ((v7 & 1) == 0)
    {
      id v3 = livefs_std_log();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
        sub_10003DD9C();
      }
      goto LABEL_14;
    }
    int v8 = 0;
    goto LABEL_16;
  }
  if (!v51)
  {
    id v3 = livefs_std_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_10003DB68();
    }
    id v5 = 0;
    goto LABEL_14;
  }
  id v50 = 0;
  id v3 = [v1 contentsOfDirectoryAtPath:v0 error:&v50];
  id v4 = v50;
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = livefs_std_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10003DD28();
    }
    goto LABEL_6;
  }
  if ([v3 count]
    && ([v1 isWritableFileAtPath:v0] & 1) == 0
    && chmod((const char *)[(__CFString *)v0 fileSystemRepresentation], 0x1EDu))
  {
    long long v35 = livefs_std_log();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
      sub_10003DCA0();
    }
  }
  int v36 = 0;
  *(void *)&long long v34 = 138543618;
  long long v48 = v34;
  while (1)
  {
    if (![v3 count])
    {
      id v5 = 0;
LABEL_69:
      if ([v1 isWritableFileAtPath:v0]
        && chmod((const char *)[(__CFString *)v0 fileSystemRepresentation], 0x16Du))
      {
        long long v41 = livefs_std_log();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_FAULT)) {
          sub_10003DBD0((uint64_t)v0, v41);
        }
      }
      int v8 = 0;
      goto LABEL_15;
    }
    long long v37 = livefs_std_log();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long v57 = v48;
      long long v58 = v0;
      __int16 v59 = 1024;
      int v60 = v36;
      _os_log_error_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "%{public}@ not empty on base system, loop %d!", v57, 0x12u);
    }

    if (v36 == 5) {
      break;
    }
    ++v36;
    *(void *)&long long buf = _NSConcreteStackBlock;
    *((void *)&buf + 1) = 3221225472;
    long long v53 = sub_100011A4C;
    long long v54 = &unk_100058F18;
    long long v38 = v0;
    long long v55 = v38;
    id v39 = v1;
    id v56 = v39;
    [v3 enumerateObjectsUsingBlock:&buf];
    id v49 = 0;
    uint64_t v40 = [v39 contentsOfDirectoryAtPath:v38 error:&v49];
    id v5 = v49;

    id v3 = v40;
    if (v5)
    {
      id v3 = v40;
      goto LABEL_69;
    }
  }
  uint64_t v6 = livefs_std_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
    sub_10003DC60();
  }
  id v5 = 0;
LABEL_6:

LABEL_14:
  int v8 = 1;
LABEL_15:

LABEL_16:
  if (v8)
  {
    long long v42 = livefs_std_log();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
      sub_10003DB34();
    }

    err(1, "Could not build LiveFiles mount path");
  }
  if (dword_100060728)
  {
    uint64_t v9 = livefs_std_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "About to tear down pre-existing mounts", (uint8_t *)&buf, 2u);
    }

    if (dword_100060728)
    {
      uint64_t v10 = livefs_std_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = off_1000603A8;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Creating transport on port %@", (uint8_t *)&buf, 0xCu);
      }
    }
  }
  dword_100060788 = arc4random();
  if (dword_100060728)
  {
    uint64_t v11 = livefs_std_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Creating the root (FPnfsMemFS) file system", (uint8_t *)&buf, 2u);
    }
  }
  uint64_t v12 = [FPnfsMemFS alloc];
  uint64_t v13 = [(FPnfsMemFS *)v12 initWithRootPath:off_100060710];
  uint64_t v14 = (void *)qword_100060770;
  qword_100060770 = (uint64_t)v13;

  if (!qword_100060770)
  {
    long long v43 = livefs_std_log();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
      sub_10003D9FC();
    }

    err(1, "Could not allocate root file system");
  }
  if (dword_100060728)
  {
    uint64_t v15 = livefs_std_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Creating the root mountEntry", (uint8_t *)&buf, 2u);
    }
  }
  id v16 = +[mountEntry newWithObject:path:mntTable:](mountEntry, "newWithObject:path:mntTable:");
  uint64_t v17 = (void *)qword_100060778;
  qword_100060778 = (uint64_t)v16;

  if (!qword_100060778)
  {
    long long v44 = livefs_std_log();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
      sub_10003DA30();
    }

    err(1, "Could not alloc/init the root mount table entry");
  }
  if (byte_10006072C) {
    [qword_100060778 setIs_inet:1];
  }
  if (dword_100060728)
  {
    uint64_t v18 = livefs_std_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Mount the root file system (FPnfsMemFS", (uint8_t *)&buf, 2u);
    }
  }
  [(id)qword_100060778 mount:0];
  if (objc_claimAutoreleasedReturnValue())
  {
    long long v45 = livefs_std_log();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
      sub_10003DACC();
    }

    err(1, "Could not initialize the fskitd's root memory file system.");
  }
  uint64_t v19 = [(id)qword_100060740 mounts];
  int v20 = (void *)qword_100060798;
  qword_100060798 = v19;

  [(id)qword_100060798 enumerateObjectsUsingBlock:&stru_100058E50];
  [(id)qword_100060780 resetIndex];
  sub_10000F3BC((void *)qword_100060798);
  if (dword_100060728)
  {
    uint64_t v21 = livefs_std_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Staring mounting service", (uint8_t *)&buf, 2u);
    }
  }
  long long v22 = objc_alloc_init(liveFilesMountServiceDelegate);
  id v23 = (void *)qword_1000607A0;
  qword_1000607A0 = (uint64_t)v22;

  if (!qword_1000607A0)
  {
    long long v46 = livefs_std_log();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
      sub_10003DA64();
    }

    err(1, "Could not alloc/init mountServiceDelegate");
  }
  id v24 = [objc_alloc((Class)FSModuleHost) initWithProbeList:1];
  uint64_t v25 = (void *)qword_100060760;
  qword_100060760 = (uint64_t)v24;

  [(id)qword_100060760 setModulesLoaded:&stru_100058E90];
  [(id)qword_100060760 setModulesUnloaded:&stru_100058EB0];
  [(id)qword_100060760 loadModulesAndMonitor];
  int v26 = objc_alloc_init(fskitdAgentManager);
  long long v27 = (void *)qword_100060768;
  qword_100060768 = (uint64_t)v26;

  uint64_t v28 = objc_opt_new();
  id v29 = (void *)qword_100060750;
  qword_100060750 = v28;

  id v30 = [objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.filesystems.fskitd"];
  uint64_t v31 = (void *)qword_1000607A8;
  qword_1000607A8 = (uint64_t)v30;

  if (!qword_1000607A8)
  {
    long long v47 = livefs_std_log();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
      sub_10003DA98();
    }

    err(1, "Could not obtain NSXPCListerner serviceListener");
  }
  [(id)qword_1000607A8 setDelegate:qword_1000607A0];
  if (dword_100060728)
  {
    long long v32 = livefs_std_log();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Resuming liveFilesMountService", (uint8_t *)&buf, 2u);
    }
  }
  [(id)qword_1000607A8 resume];
  uint64_t v33 = (void *)qword_100060790;
  qword_100060790 = 0;
}

void sub_100011598(id a1, NSDictionary *a2, unint64_t a3, BOOL *a4)
{
  uint64_t v4 = LiveFSMounterMountedOnKey;
  id v5 = a2;
  uint64_t v6 = [(NSDictionary *)v5 objectForKeyedSubscript:v4];
  unsigned __int8 v7 = [(NSDictionary *)v5 objectForKeyedSubscript:LiveFSMounterVolumeNameKey];
  int v8 = [(NSDictionary *)v5 objectForKeyedSubscript:LiveFSMounterDisplayNameKey];
  uint64_t v9 = [(NSDictionary *)v5 objectForKeyedSubscript:LiveFSMounterDomainStorageKey];
  uint64_t v10 = [(NSDictionary *)v5 objectForKeyedSubscript:LiveFSMounterVolumeProviderNameKey];
  uint64_t v11 = [(NSDictionary *)v5 objectForKey:LiveFSMounterDomainErrorKey];
  uint64_t v12 = [(NSDictionary *)v5 objectForKeyedSubscript:LiveFSMounterMountIDKey];

  id v13 = [v12 intValue];
  if ([v6 isAbsolutePath])
  {
    id v14 = v6;
  }
  else
  {
    id v14 = +[NSString stringWithFormat:@"%@/%@", off_100060710, v6];
  }
  uint64_t v15 = v14;
  LODWORD(v22) = v13;
  id v16 = +[mountEntry newWithName:v7 fileSystem:0 displayName:v8 storageName:v9 provider:v10 path:v14 mountID:v22 auditToken:qword_100060750 mntTable:qword_100060780];
  if (v16) {
    [(id)qword_100060770 mkMountPath:v6 mountID:v13];
  }
  else {
  uint64_t v17 = fs_errorForPOSIXError();
  }
  if (v17)
  {
    uint64_t v18 = livefs_std_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412546;
      id v24 = v17;
      __int16 v25 = 2114;
      int v26 = v10;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Got error %@ reconstituting mount for provider %{public}@", buf, 0x16u);
    }

    uint64_t v19 = livefs_std_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
      sub_10003DE08();
    }
  }
  else
  {
    if (v11)
    {
      int v20 = [(id)qword_100060740 deserializedError:v11];
      [v16 setDomainError:v20];
    }
    [v16 setCurrentState:1];
    id v21 = [v16 mount:0];
  }
}

void sub_10001189C(id a1, NSArray *a2, NSDictionary *a3, NSArray *a4)
{
  uint64_t v4 = a2;
  id v5 = fskit_std_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 134218242;
    NSUInteger v7 = [(NSArray *)v4 count];
    __int16 v8 = 2112;
    uint64_t v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Added %lu identifiers: %@", (uint8_t *)&v6, 0x16u);
  }
}

void sub_10001195C(id a1, NSArray *a2, NSDictionary *a3, NSArray *a4)
{
  uint64_t v4 = a2;
  id v5 = fskit_std_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    NSUInteger v6 = [(NSArray *)v4 count];
    NSUInteger v7 = [(NSArray *)v4 fs_map:&stru_100058EF0];
    int v8 = 134218242;
    NSUInteger v9 = v6;
    __int16 v10 = 2112;
    uint64_t v11 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Removed %lu identifiers: %@", (uint8_t *)&v8, 0x16u);
  }
}

id sub_100011A44(id a1, FSModuleInstance *a2)
{
  return [(FSModuleInstance *)a2 bundleIdentifier];
}

void sub_100011A4C(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) stringByAppendingPathComponent:a2];
  uint64_t v4 = *(void **)(a1 + 40);
  id v7 = 0;
  [v4 removeItemAtPath:v3 error:&v7];
  id v5 = v7;
  NSUInteger v6 = livefs_std_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543618;
    NSUInteger v9 = v3;
    __int16 v10 = 2112;
    id v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Removal of items at %{public}@ returned %@", buf, 0x16u);
  }
}

void sub_100011B4C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_100011B78(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

uint64_t sub_100011E7C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_100011F90(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_10001207C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_100012168(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100012274(uint64_t a1, int a2, void *a3, void *a4, void *a5, void *a6)
{
  id v14 = a3;
  id v11 = a5;
  id v12 = a6;
  if (a2)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    id v13 = [a4 base64String];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

uint64_t sub_100012458(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_100012518(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_1000125F8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100012730(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    NSUInteger v6 = [a2 base64String];
    id v7 = fskit_std_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v9 = 136315650;
      __int16 v10 = "-[FSVolumeConnectorBridge getRootFileHandleWithError:]_block_invoke";
      __int16 v11 = 2112;
      id v12 = v6;
      __int16 v13 = 2112;
      id v14 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s:reply:rootFH:%@:err:%@", (uint8_t *)&v9, 0x20u);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    int v8 = fskit_std_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v9 = 136315650;
      __int16 v10 = "-[FSVolumeConnectorBridge getRootFileHandleWithError:]_block_invoke";
      __int16 v11 = 2112;
      id v12 = 0;
      __int16 v13 = 2112;
      id v14 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s:reply:rootFH:%@:err:%@", (uint8_t *)&v9, 0x20u);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

uint64_t sub_100012988(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100012A84(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5, void *a6, void *a7, void *a8, void *a9, void *a10)
{
  id v23 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  id v19 = a9;
  id v20 = a10;
  if (a2)
  {
    (*(void (**)(void, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a2);
  }
  else
  {
    id v21 = [a4 base64String];
    if (v16)
    {
      uint64_t v22 = [v16 base64String];
    }
    else
    {
      uint64_t v22 = 0;
    }
    (*(void (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), 0);
  }
}

void sub_100012D18(uint64_t a1, int a2, void *a3, void *a4, void *a5, void *a6)
{
  id v14 = a3;
  id v11 = a5;
  id v12 = a6;
  if (a2)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    __int16 v13 = [a4 base64String];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void sub_100012EF4(uint64_t a1, int a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  uint64_t v15 = fskit_std_log();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    int v17 = 136315650;
    id v18 = "-[FSVolumeConnectorBridge makeDirectoryIn:named:attributes:requestID:reply:]_block_invoke";
    __int16 v19 = 1024;
    int v20 = a2;
    __int16 v21 = 2112;
    id v22 = v12;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "%s:result:%d theItem:%@", (uint8_t *)&v17, 0x1Cu);
  }

  if (a2)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    id v16 = [v12 base64String];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

uint64_t sub_100013190(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1000132CC(uint64_t a1, int a2, void *a3, void *a4, void *a5, void *a6)
{
  id v14 = a3;
  id v11 = a5;
  id v12 = a6;
  if (a2)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    id v13 = [a4 base64String];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

uint64_t sub_100013484(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_100013578(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_100013638(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100013A3C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100013A58(uint64_t result, int a2, int a3)
{
  if (!a2) {
    *(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 32) = a3;
  }
  return result;
}

uint64_t sub_100013A70(uint64_t result, int a2, int a3)
{
  if (!a2) {
    *(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 36) = a3;
  }
  return result;
}

uint64_t sub_100013A88(uint64_t result, int a2)
{
  if (!a2) {
    *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 44) |= 2u;
  }
  return result;
}

uint64_t sub_100013AA8(uint64_t result, int a2, int a3)
{
  if (!a2) {
    *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 44) = *(unsigned char *)(*(void *)(*(void *)(result + 32)
  }
                                                                                          + 8)
                                                                              + 44) & 0xFE | (a3 != 0);
  return result;
}

uint64_t sub_100013AD4(uint64_t result, int a2, int a3)
{
  if (!a2) {
    *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 44) = *(unsigned char *)(*(void *)(*(void *)(result + 32)
  }
                                                                                          + 8)
                                                                              + 44) & 0xFB | (4 * (a3 == 0));
  return result;
}

uint64_t sub_100013B00(uint64_t result, int a2, int a3)
{
  if (!a2) {
    *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 44) = *(unsigned char *)(*(void *)(*(void *)(result + 32)
  }
                                                                                          + 8)
                                                                              + 44) & 0xF7 | (8 * (a3 != 0));
  return result;
}

uint64_t sub_100013B2C(uint64_t result, int a2, int a3)
{
  if (!a2) {
    *(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 40) = a3;
  }
  return result;
}

uint64_t sub_100013C88(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = *(void *)(a1 + 40);
  id v8 = [*(id *)(a1 + 32) mutableBytes];
  int v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, id))(v7 + 16);

  return v9(v7, a2, a3, a4, v8);
}

uint64_t sub_100013E48(uint64_t a1, uint64_t a2, size_t a3)
{
  memcpy([*(id *)(a1 + 32) mutableBytes], [*(id *)(a1 + 40) bytes], a3);
  uint64_t v4 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);

  return v4();
}

uint64_t sub_100014010(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = *(void *)(a1 + 40);
  id v8 = [*(id *)(a1 + 32) mutableBytes];
  int v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, id))(v7 + 16);

  return v9(v7, a2, a3, a4, v8);
}

uint64_t sub_1000141D8(uint64_t a1, uint64_t a2, size_t a3)
{
  memcpy([*(id *)(a1 + 32) mutableBytes], [*(id *)(a1 + 40) bytes], a3);
  uint64_t v4 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);

  return v4();
}

uint64_t sub_1000143AC(uint64_t a1, uint64_t a2, size_t a3)
{
  memcpy([*(id *)(a1 + 32) mutableBytes], [*(id *)(a1 + 40) bytes], a3);
  uint64_t v4 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);

  return v4();
}

uint64_t sub_100014548(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = [*(id *)(a1 + 32) mutableBytes];
  id v5 = *(uint64_t (**)(uint64_t, uint64_t, id))(v3 + 16);

  return v5(v3, a2, v4);
}

uint64_t sub_10001465C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_100014734(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_100014860(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_10001498C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_100014B44(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_100014C20(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_100014D68(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_100014E5C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_100014F68(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_100015050(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_10001516C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10001525C(uint64_t a1, int a2, void *a3)
{
  if (a2)
  {
    id v4 = 0;
  }
  else
  {
    id v5 = a3;
    v7[0] = [v5 totalBytes];
    v7[1] = [v5 availableBytes];
    v7[2] = [v5 freeBytes];
    v7[3] = [v5 totalFiles];
    id v6 = [v5 freeFiles];

    v7[4] = v6;
    id v4 = +[NSData dataWithBytes:v7 length:40];
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_100015408(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_100015518(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_100015610(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100015E9C(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v9 = a4;
  uint64_t v7 = *(void *)(a1 + 32);
  if (a2)
  {
    (*(void (**)(uint64_t, uint64_t, void, void))(v7 + 16))(v7, a2, 0, 0);
  }
  else
  {
    id v8 = [a3 dataUsingEncoding:4];
    (*(void (**)(uint64_t, void, void *, id))(v7 + 16))(v7, 0, v8, v9);
  }
}

void sub_1000166D4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak((id *)(v3 - 80));
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100016710(uint64_t a1)
{
  id obj = *(id *)(a1 + 32);
  objc_sync_enter(obj);
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained[1] removeObjectForKey:*(void *)(a1 + 40)];

  objc_sync_exit(obj);
}

void sub_100016780(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

id sub_100016794(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [(id)qword_100060748 instanceDied:a2 instanceUUID:a3 uid:*(unsigned int *)(a1 + 32)];
}

FSModuleIdentity *__cdecl sub_1000168C8(id a1, FSModuleInstance *a2)
{
  return (FSModuleIdentity *)[(FSModuleInstance *)a2 identity];
}

void sub_100016BF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a17, 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100016C2C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100016C3C(uint64_t a1)
{
}

void sub_100016C44(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  id v8 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

void sub_100016CC4(uint64_t *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  id v8 = [v7 attributes];
  id v9 = [v8 objectForKeyedSubscript:FSModuleIdentityAttributeShortName];
  __int16 v10 = v9;
  if (v9 && ![v9 caseInsensitiveCompare:a1[4]])
  {
    id v11 = fskit_std_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      sub_10003DE48(a1 + 4, v11);
    }

    objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), a2);
    uint64_t v12 = *(void *)(a1[6] + 8);
    id v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = 0;

    *a4 = 1;
  }
}

void sub_100016F5C(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v10 = a2;
  id v7 = a3;
  id v8 = a4;
  if (v7) {
    BOOL v9 = v10 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9 && !v8)
  {
    fs_errorForPOSIXError();
    id v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_100017170(uint64_t a1, void *a2, void *a3)
{
  unint64_t v6 = a2;
  uint64_t v5 = a3;
  if (!(v6 | v5))
  {
    uint64_t v5 = fs_errorForPOSIXError();
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_100017360(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v2 = *(NSObject **)(a1 + 32);

  dispatch_group_leave(v2);
}

void sub_100017408(id a1)
{
  qword_1000607B8 = (uint64_t)DASessionCreate(kCFAllocatorDefault);
  uint64_t v1 = dispatch_queue_create("com.apple.fskitd.da", 0);
  DASessionSetDispatchQueue((DASessionRef)qword_1000607B8, v1);
  uint64_t v2 = fskit_std_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    int v3 = 138412290;
    uint64_t v4 = qword_1000607B8;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Setup main DA session, %@", (uint8_t *)&v3, 0xCu);
  }
}

uint64_t sub_1000175FC(uint64_t a1)
{
  CFRelease(*(CFTypeRef *)(a1 + 40));
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);

  return v2();
}

uint64_t sub_100017770(uint64_t a1)
{
  CFRelease(*(CFTypeRef *)(a1 + 40));
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);

  return v2();
}

void sub_100017D2C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100017D54(uint64_t a1)
{
  uint64_t v2 = (void *)FSTaskPurposeFormat;
  int v3 = [*(id *)(a1 + 32) taskPurpose];
  LODWORD(v2) = [v2 isEqualToString:v3];

  if (v2)
  {
    uint64_t v4 = *(void *)(a1 + 40);
    +[fskitdDAOperations probeDisk:v4 replyHandler:&stru_100059438];
  }
}

void sub_100017DEC(uint64_t a1, void *a2)
{
  id obj = a2;
  objc_sync_enter(obj);
  int v3 = [obj ourConn];

  if (v3)
  {
    uint64_t v4 = [obj ourConn];
    uint64_t v5 = [v4 remoteObjectProxy];

    [v5 taskStatusUpdate:*(void *)(a1 + 32)];
  }
  objc_sync_exit(obj);
}

void sub_100017E98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_100017F8C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10001818C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10001850C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100018520(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = fskit_std_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_10003E504((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100018594(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = fskit_std_log();
  uint64_t v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_10003E5E8();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    sub_10003E570(v5, v6, v7, v8, v9, v10, v11, v12);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100018BE0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void sub_100018C00(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_100018ECC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_100018EE0(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  *a4 = 0;
  uint64_t v7 = *(void **)(a1 + 32);
  uint64_t v8 = [v6 name];
  if ([v7 localizedStandardCompare:v8])
  {
  }
  else
  {
    unsigned __int8 v9 = [v6 nascent];

    if ((v9 & 1) == 0)
    {
      uint64_t v10 = 1;
      *a4 = 1;
      goto LABEL_6;
    }
  }
  uint64_t v10 = 0;
LABEL_6:

  return v10;
}

void sub_100019108(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

BOOL sub_10001911C(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  *a4 = 0;
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = [a2 name];
  id v7 = [v5 localizedStandardCompare:v6];

  if (!v7) {
    *a4 = 1;
  }
  return v7 == 0;
}

void sub_100019398(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

BOOL sub_1000193AC(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  *a4 = 0;
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = [a2 name];
  id v7 = [v5 localizedStandardCompare:v6];

  if (!v7) {
    *a4 = 1;
  }
  return v7 == 0;
}

void sub_1000194B0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100019728(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

BOOL sub_100019744(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  *a4 = 0;
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = [a2 name];
  id v7 = [v5 localizedStandardCompare:v6];

  if (!v7) {
    *a4 = 1;
  }
  return v7 == 0;
}

void sub_1000197AC(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) fs];
  id v3 = [*(id *)(a1 + 32) name];
  uint64_t v4 = [v2 fullPathForRelativePath:v3];

  id v5 = v4;
  int v6 = rmdir((const char *)[v5 fileSystemRepresentation]);
  if (v6 && v6 != 66)
  {
    id v7 = livefs_std_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10003EA88(v5, v7);
    }
  }
}

void sub_100019B0C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_100019B3C(uint64_t a1, char *__s, uint64_t a3, uint64_t a4)
{
  size_t v8 = strlen(__s);
  *(void *)a4 = a1;
  *(void *)(a4 + 8) = a3;
  *(_WORD *)(a4 + 16) = (v8 + 29) & 0xFFF8;
  *(unsigned char *)(a4 + 20) = 2;
  *(_WORD *)(a4 + 18) = v8;
  strlcpy((char *)(a4 + 21), __s, v8 + 1);
  return a4 + *(unsigned __int16 *)(a4 + 16);
}

void sub_100019E28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id obj)
{
}

void sub_100019FD4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10001A480(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 40);
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 224);
  id v3 = [v1 fh];
  [v2 setObject:v1 forKey:v3];
}

void sub_10001A710(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10001A738(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10001A748(uint64_t a1)
{
}

uint64_t sub_10001A750(void *a1)
{
  *(void *)(*(void *)(a1[6] + 8) + 40) = [*(id *)(a1[4] + 224) objectForKey:a1[5]];

  return _objc_release_x1();
}

void sub_10001A83C(uint64_t a1)
{
  uint64_t v1 = *(void **)(*(void *)(a1 + 32) + 224);
  id v2 = [*(id *)(a1 + 40) fh];
  [v1 removeObjectForKey:v2];
}

void sub_10001B078(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) rootNode];
  if ([*(id *)(a1 + 40) count] != (id)2)
  {
    uint64_t v4 = 0;
    while (1)
    {
      id v5 = [*(id *)(a1 + 40) objectAtIndexedSubscript:v4];
      int v6 = [v2 lookup:v5];

      if (!v6) {
        break;
      }
      id v3 = [*(id *)(a1 + 32) findNode:v6];

      ++v4;
      id v2 = v3;
      if (v4 >= (char *)[*(id *)(a1 + 40) count] - 2) {
        goto LABEL_6;
      }
    }
  }
  id v3 = v2;
LABEL_6:
  id v7 = [*(id *)(a1 + 40) objectAtIndexedSubscript:((char *)objc_msgSend(*(id *)(a1 + 40), "count") - 1)];
  unsigned int v8 = [v3 rmDir:v7];

  if (dword_100060728)
  {
    unsigned __int8 v9 = livefs_std_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = [*(id *)(a1 + 40) objectAtIndexedSubscript:[*(id *)(a1 + 40) count] - 1];
      uint64_t v11 = [v3 name];
      int v12 = 138412802;
      id v13 = v10;
      __int16 v14 = 2112;
      uint64_t v15 = v11;
      __int16 v16 = 1024;
      unsigned int v17 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Attempting to remove %@ from %@ returned %d", (uint8_t *)&v12, 0x1Cu);
    }
  }
}

void sub_10001DA90(_Unwind_Exception *a1)
{
  objc_sync_exit(v2);
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10001EA08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
}

uint64_t sub_10001EA90(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10001EAA0(uint64_t a1)
{
}

void sub_10001EAA8(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v5 = livefs_std_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10003F130();
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_10001EB2C(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_10001EC8C(id *a1)
{
  id v2 = a1 + 4;
  objc_msgSend(a1[4], "stringByAppendingPathComponent:", @".", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0,
  id v3 = 0);
  id v4 = livefs_std_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_10003F204();
  }

  id v5 = v3;
  stat((const char *)[v5 fileSystemRepresentation], &v8);
  if ([a1[5] isEqual:@"com.apple.filesystems.UserFS.FileProvider"]
    && ([a1[6] isFSKitModule] & 1) == 0)
  {
    int v6 = +[NSURL fileURLWithPath:*v2];
    +[CSSearchableIndex volumeMountedAtURL:v6 withOptions:0];

    id v7 = livefs_std_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      sub_10003F198();
    }
  }
}

id sub_10001F054(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  uint64_t v6 = *(void *)(a1 + 64);
  uint64_t v7 = *(void *)(a1 + 72);
  int v8 = *(_DWORD *)(a1 + 104);
  uint64_t v9 = *(void *)(a1 + 80);
  uint64_t v10 = *(void *)(a1 + 88);
  uint64_t v11 = (void *)v2[2];
  if (v11) {
    [v11 auditToken];
  }
  else {
    memset(v14, 0, sizeof(v14));
  }
  LODWORD(v13) = v8;
  return [v2 LiveMounterReallyMountVolume:v3 fileSystem:v4 displayName:v5 provider:v6 domainError:v7 on:v9 how:v13 options:v10 auditToken:v14 reply:*(void *)(a1 + 96)];
}

id sub_10001F2D8(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  uint64_t v6 = *(void *)(a1 + 64);
  uint64_t v7 = *(void *)(a1 + 72);
  int v8 = *(_DWORD *)(a1 + 88);
  uint64_t v9 = (void *)v2[2];
  if (v9) {
    [v9 auditToken];
  }
  else {
    memset(v12, 0, sizeof(v12));
  }
  LODWORD(v11) = v8;
  return [v2 LiveMounterReallyMountVolume:v3 fileSystem:0 displayName:v4 provider:v5 domainError:v6 on:v7 how:v11 options:0 auditToken:v12 reply:*(void *)(a1 + 80)];
}

id sub_10001F5E0(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 56);
  uint64_t v5 = *(void *)(a1 + 64);
  uint64_t v6 = *(void *)(a1 + 72);
  int v7 = *(_DWORD *)(a1 + 96);
  uint64_t v8 = *(void *)(a1 + 80);
  uint64_t v9 = *(void *)(a1 + 88);
  long long v10 = *(_OWORD *)(a1 + 116);
  v13[0] = *(_OWORD *)(a1 + 100);
  v13[1] = v10;
  LODWORD(v12) = v7;
  return [v2 LiveMounterReallyMountVolume:v1 fileSystem:0 displayName:v3 provider:v4 domainError:v5 on:v6 how:v12 options:v8 auditToken:v13 reply:v9];
}

void sub_10001F858(uint64_t a1, void *a2)
{
  id v5 = a2;
  uint64_t v3 = [v5 objectForKeyedSubscript:LiveFSMounterDomainErrorKey];

  if (v3) {
    [v5 setValue:0 forKey:LiveFSMounterDomainErrorKey];
  }
  if (*(void *)(a1 + 32))
  {
    uint64_t v4 = [qword_100060740 serializedError];
    [v5 setObject:v4 forKey:LiveFSMounterDomainErrorKey];
  }
}

id sub_10001FA84(uint64_t a1)
{
  return [*(id *)(a1 + 32) reallyUpdateErrorStateForVolume:*(void *)(a1 + 40) provider:*(void *)(a1 + 48) domainError:*(void *)(a1 + 56) reply:*(void *)(a1 + 64)];
}

void sub_10001FED0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10001FEEC(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_1000203B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000203FC(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100020AA4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (([*(id *)(a1 + 32) isEqual:*(void *)(a1 + 40)] & 1) == 0)
  {
    if (!v5 || (*(unsigned char *)(a1 + 88) & 1) != 0)
    {
      int v7 = *(void **)(a1 + 56);
      uint64_t v8 = *(void *)(a1 + 64);
      uint64_t v9 = *(void *)(a1 + 40);
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_100020BC8;
      v11[3] = &unk_100059310;
      uint64_t v10 = *(void *)(a1 + 72);
      id v13 = *(id *)(a1 + 80);
      id v12 = v6;
      [v7 updateErrorStateForVolume:v8 provider:v10 domainError:v9 reply:v11];

      goto LABEL_7;
    }
    [*(id *)(a1 + 48) setDomainError:*(void *)(a1 + 32)];
  }
  (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
LABEL_7:
}

uint64_t sub_100020BC8(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, uint64_t, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), a2, *(void *)(a1 + 32));
}

uint64_t sub_100020E2C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100021278(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a15, 8);
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1000212B0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  id v8 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  int v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

void sub_100021330(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  id v8 = *(void **)(a1 + 32);
  uint64_t v9 = [v7 bundleIdentifier];
  LODWORD(v8) = [v8 isEqualToString:v9];

  if (v8)
  {
    uint64_t v10 = fskit_std_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      sub_10003F31C(v7, v10);
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

void sub_1000214F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100021510(uint64_t a1, void *a2, uint64_t a3)
{
  if (a2 || !a3)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [a2 bundleIdentifier];
    _objc_release_x1();
  }
  else
  {
    id v4 = fskit_std_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      sub_10003F3F0();
    }

    uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = 0;
  }
}

void sub_100021B6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va1, a7);
  va_start(va, a7);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_100021BCC(uint64_t a1, void *a2, void *a3)
{
  id v6 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  id v7 = a2;
  uint64_t v8 = +[FSBlockDeviceResource dynamicCast:v7];

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;

  uint64_t v11 = fskit_std_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    uint64_t v12 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    uint64_t v13 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    int v14 = 138412546;
    uint64_t v15 = v12;
    __int16 v16 = 2112;
    uint64_t v17 = v13;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "openWith returned err %@ dev %@", (uint8_t *)&v14, 0x16u);
  }
}

void sub_100022644(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,char a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,char a53)
{
  _Block_object_dispose((const void *)(v53 - 176), 8);
  _Block_object_dispose(&a47, 8);
  _Block_object_dispose(&a53, 8);
  _Block_object_dispose((const void *)(v53 - 256), 8);
  _Block_object_dispose((const void *)(v53 - 208), 8);
  _Unwind_Resume(a1);
}

void sub_1000226D0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  id v8 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

void sub_100022750(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v8 = a3;
  if (v8) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  }
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

void sub_1000227D4(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_100022834(uint64_t a1, void *a2)
{
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  if (v4)
  {
    id v5 = fskit_std_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138412290;
      id v7 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "checkIn returned error %@", (uint8_t *)&v6, 0xCu);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_100022910(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(id *)(a1 + 32);
  objc_sync_enter(v4);
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  if (*(unsigned char *)(v5 + 24))
  {
    objc_sync_exit(v4);
  }
  else
  {
    *(unsigned char *)(v5 + 24) = 1;
    objc_sync_exit(v4);

    if (v3)
    {
      id v6 = v3;
      id v7 = [(id)qword_100060740 tasks];
      objc_sync_enter(v7);
      id v8 = [(id)qword_100060740 tasks];
      uint64_t v9 = [v6 taskID];
      uint64_t v10 = [v8 objectForKey:v9];

      objc_sync_exit(v7);
      [v10 setTaskReferenceHolder:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [v6 taskState] == 3;
      if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
      {
        uint64_t v11 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
        uint64_t v12 = [v6 taskID];
        [v11 addTaskID:v12];

        uint64_t v13 = fskit_std_log();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          int v14 = [v6 taskID];
          uint64_t v15 = *(void *)(a1 + 40);
          int v16 = 138412546;
          uint64_t v17 = v14;
          __int16 v18 = 2112;
          uint64_t v19 = v15;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Adding taskID %@ to resource %@", (uint8_t *)&v16, 0x16u);
        }
      }
    }
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }
}

void sub_100022B2C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100022CF0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100022F14(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10002322C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
  objc_sync_exit(v15);
  _Block_object_dispose(&a15, 8);
  _Unwind_Resume(a1);
}

void sub_100023280(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  id v6 = [(id)qword_100060740 tasks];
  id v7 = [v6 objectForKeyedSubscript:v5];

  if (v7)
  {
    id v8 = [v7 taskPurpose];
    unsigned __int8 v9 = [v8 isEqualToString:FSTaskPurposeActivate];

    if ((v9 & 1) == 0)
    {
      uint64_t v10 = fs_errorForPOSIXError();
      uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
      uint64_t v12 = *(void **)(v11 + 40);
      *(void *)(v11 + 40) = v10;

      uint64_t v13 = fskit_std_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        int v14 = [*(id *)(a1 + 32) getResourceID];
        uint64_t v15 = [v7 taskPurpose];
        int v16 = 136315906;
        uint64_t v17 = "-[fskitdXPCServer canStartUnloadTask:resource:]_block_invoke";
        __int16 v18 = 2112;
        uint64_t v19 = v14;
        __int16 v20 = 2112;
        id v21 = v5;
        __int16 v22 = 2112;
        id v23 = v15;
        _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%s:%@: Can't start unload task, previous task (%@) runs task purpose (%@)", (uint8_t *)&v16, 0x2Au);
      }
      *a3 = 1;
    }
  }
}

uint64_t sub_1000238D4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_10002399C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_100023A64(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100023B98(_Unwind_Exception *a1)
{
  objc_sync_exit(v2);
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100023E00(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_100023E14(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_100023E30(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void, uint64_t, void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), a2, *(void *)(a1 + 32), a3);
}

void sub_100024220(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000244D0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100024990(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
  objc_sync_exit(v15);
  _Block_object_dispose(&a15, 8);
  _Unwind_Resume(a1);
}

void sub_1000249E4(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  id v6 = [(id)qword_100060740 tasks];
  id v7 = [v6 objectForKeyedSubscript:v5];

  if (v7)
  {
    id v8 = [v7 taskPurpose];
    unsigned __int8 v9 = [v8 isEqualToString:FSTaskPurposeActivate];

    if ((v9 & 1) == 0)
    {
      uint64_t v10 = fs_errorForPOSIXError();
      uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
      uint64_t v12 = *(void **)(v11 + 40);
      *(void *)(v11 + 40) = v10;

      uint64_t v13 = fskit_std_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        int v14 = [*(id *)(a1 + 32) getResourceID];
        uint64_t v15 = [v7 taskPurpose];
        int v16 = 136315906;
        uint64_t v17 = "-[fskitdXPCServer canStartDeactivateTask:resource:]_block_invoke";
        __int16 v18 = 2112;
        uint64_t v19 = v14;
        __int16 v20 = 2112;
        id v21 = v5;
        __int16 v22 = 2112;
        id v23 = v15;
        _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%s:%@: Can't start deactivate task, previous task (%@) runs task purpose (%@)", (uint8_t *)&v16, 0x2Au);
      }
      *a3 = 1;
    }
  }
}

void sub_10002527C(uint64_t a1)
{
  uint64_t v63 = 0;
  long long v64 = &v63;
  uint64_t v65 = 0x3032000000;
  long long v66 = sub_10001EA90;
  long long v67 = sub_10001EAA0;
  id v68 = (id)objc_opt_new();
  uint64_t v57 = 0;
  long long v58 = &v57;
  uint64_t v59 = 0x3032000000;
  int v60 = sub_10001EA90;
  NSFileAttributeKey v61 = sub_10001EAA0;
  id v62 = 0;
  uint64_t v51 = 0;
  long long v52 = &v51;
  uint64_t v53 = 0x3032000000;
  long long v54 = sub_10001EA90;
  long long v55 = sub_10001EAA0;
  fs_errorForPOSIXError();
  id v56 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v45 = 0;
  long long v46 = &v45;
  uint64_t v47 = 0x3032000000;
  long long v48 = sub_10001EA90;
  id v49 = sub_10001EAA0;
  id v50 = 0;
  uint64_t v39 = 0;
  uint64_t v40 = (id *)&v39;
  uint64_t v41 = 0x3032000000;
  long long v42 = sub_10001EA90;
  long long v43 = sub_10001EAA0;
  id v44 = 0;
  id v2 = (void *)qword_100060748;
  uint64_t v3 = *(void *)(a1 + 32);
  long long v4 = *(_OWORD *)(a1 + 88);
  long long v37 = *(_OWORD *)(a1 + 72);
  long long v38 = v4;
  id v5 = +[FSAuditToken tokenWithToken:&v37];
  uint64_t v6 = *(void *)(a1 + 40);
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_10002579C;
  v36[3] = &unk_1000597E8;
  v36[4] = &v39;
  v36[5] = &v57;
  v36[6] = &v45;
  [v2 existingExtensionForBundle:v3 user:v5 volume:v6 replyHandler:v36];

  if (v40[5]) {
    goto LABEL_2;
  }
  if (v46[5])
  {
    uint64_t v7 = [*(id *)(a1 + 48) canStartActivateTask:v64[5]];
    id v8 = v40[5];
    void v40[5] = (id)v7;

    if (v40[5])
    {
LABEL_2:
      (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
      goto LABEL_3;
    }
    unsigned __int8 v9 = *(void **)(a1 + 48);
    uint64_t v10 = v46[5];
    uint64_t v11 = *(void *)(a1 + 32);
    uint64_t v12 = v58[5];
    long long v13 = *(_OWORD *)(a1 + 88);
    long long v37 = *(_OWORD *)(a1 + 72);
    long long v38 = v13;
    int v14 = +[FSAuditToken tokenWithToken:&v37];
    uint64_t v15 = [*(id *)(a1 + 48) ourConn];
    int v16 = v15;
    if (v15) {
      [v15 auditToken];
    }
    else {
      memset(v35, 0, sizeof(v35));
    }
    __int16 v20 = +[FSAuditToken tokenWithToken:v35];
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    long long v21 = *(_OWORD *)(a1 + 88);
    long long v33 = *(_OWORD *)(a1 + 72);
    long long v34 = v21;
    v26[2] = sub_1000258B4;
    v26[3] = &unk_100059860;
    uint64_t v29 = &v51;
    id v30 = &v63;
    uint64_t v31 = &v57;
    int8x16_t v25 = *(int8x16_t *)(a1 + 40);
    id v22 = (id)v25.i64[0];
    int8x16_t v27 = vextq_s8(v25, v25, 8uLL);
    long long v32 = &v45;
    id v28 = *(id *)(a1 + 56);
    uint64_t v23 = [v9 applyResource:v10 targetBundle:v11 instanceID:v12 initiatorAuditToken:v14 authorizingAuditToken:v20 isProbe:0 usingBlock:v26];
    id v24 = v40[5];
    void v40[5] = (id)v23;

    if (!v40[5]) {
      objc_storeStrong(v40 + 5, (id)v52[5]);
    }
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
  else
  {
    uint64_t v17 = fskit_std_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      sub_10003FFC4();
    }

    uint64_t v18 = *(void *)(a1 + 64);
    uint64_t v19 = fs_errorForPOSIXError();
    (*(void (**)(uint64_t, void *))(v18 + 16))(v18, v19);
  }
LABEL_3:
  _Block_object_dispose(&v39, 8);

  _Block_object_dispose(&v45, 8);
  _Block_object_dispose(&v51, 8);

  _Block_object_dispose(&v57, 8);
  _Block_object_dispose(&v63, 8);
}

void sub_100025748(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,char a51)
{
  _Block_object_dispose(&a45, 8);
  _Block_object_dispose(&a51, 8);
  _Block_object_dispose((const void *)(v51 - 256), 8);
  _Block_object_dispose((const void *)(v51 - 208), 8);
  _Block_object_dispose((const void *)(v51 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_10002579C(void *a1, void *a2, void *a3)
{
  id v17 = a2;
  id v5 = a3;
  objc_storeStrong((id *)(*(void *)(a1[4] + 8) + 40), a3);
  if (!v5)
  {
    uint64_t v6 = [v17 instanceID];
    uint64_t v7 = *(void *)(a1[5] + 8);
    id v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    unsigned __int8 v9 = [v17 resourceIDs];
    id v10 = [v9 count];

    if (v10)
    {
      uint64_t v11 = [v17 resourceIDs];
      uint64_t v12 = [v11 objectAtIndexedSubscript:0];

      long long v13 = [(id)qword_100060740 resourceManager];
      uint64_t v14 = [v13 getResource:v12];
      uint64_t v15 = *(void *)(a1[6] + 8);
      int v16 = *(void **)(v15 + 40);
      *(void *)(v15 + 40) = v14;
    }
  }
}

void sub_1000258B4(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v33 = a2;
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  [v9 setState:5];
  uint64_t v12 = [(id)qword_100060740 resourceManager];
  objc_sync_enter(v12);
  long long v13 = [(id)qword_100060740 resourceManager];
  [v13 addResource:v9];

  objc_sync_exit(v12);
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472;
  v40[2] = sub_100025BD4;
  v40[3] = &unk_100059810;
  long long v42 = *(_OWORD *)(a1 + 56);
  id v14 = v11;
  id v41 = v14;
  uint64_t v15 = [v10 remoteObjectProxyWithErrorHandler:v40];
  uint64_t v16 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  uint64_t v17 = FSTaskPurposeActivate;
  uint64_t v18 = [[*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) fs_containerIdentifier];
  uint64_t v19 = +[FSTaskDescription taskDescriptionWithID:v16 state:0 purpose:v17 error:0 bundleID:v33 extensionID:v18 resource:v9];

  __int16 v20 = *(void **)(a1 + 32);
  long long v21 = *(_OWORD *)(a1 + 104);
  long long v38 = *(_OWORD *)(a1 + 88);
  long long v39 = v21;
  id v22 = [v20 getInitiatorBundleIDForToken:&v38];
  [v19 setTaskInitiatorID:v22];

  uint64_t v23 = *(void **)(a1 + 32);
  long long v24 = *(_OWORD *)(a1 + 104);
  long long v38 = *(_OWORD *)(a1 + 88);
  long long v39 = v24;
  int8x16_t v25 = [v23 getInitiatorSigningIDForToken:&v38];
  [v19 setTaskSigningID:v25];

  int v26 = [(id)qword_100060740 tasks];
  objc_sync_enter(v26);
  int8x16_t v27 = [(id)qword_100060740 tasks];
  [v27 setObject:v19 forKey:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];

  objc_sync_exit(v26);
  [(id)qword_100060740 taskSetChanged];
  uint64_t v28 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
  uint64_t v29 = *(void *)(a1 + 40);
  uint64_t v30 = *(void *)(a1 + 48);
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_100025C64;
  v34[3] = &unk_100059838;
  long long v37 = *(_OWORD *)(a1 + 56);
  id v35 = v19;
  id v36 = v14;
  id v31 = v14;
  id v32 = v19;
  [v15 activateVolume:v29 resource:v28 options:v30 replyHandler:v34];
}

void sub_100025BB4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100025BD4(void *a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), a2);
  id v4 = a2;
  [(id)qword_100060740 removeReferencesToTask:*(void *)(*(void *)(a1[6] + 8) + 40)];
  [(id)qword_100060740 taskSetChanged];
  (*(void (**)(void))(a1[4] + 16))();
}

void sub_100025C64(uint64_t a1, void *a2)
{
  id v6 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  id v4 = *(id *)(a1 + 32);
  if (v6)
  {
    [(id)qword_100060740 removeReferencesToTask:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
    [(id)qword_100060740 taskSetChanged];
  }
  else
  {
    uint64_t v5 = [*(id *)(a1 + 32) updatedDescriptionInState:3 error:0];

    +[fskitdExtensionClient postTaskStatusUpdate:v5];
    id v4 = (id)v5;
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_100025F9C(uint64_t a1)
{
  uint64_t v32 = 0;
  id v33 = &v32;
  uint64_t v34 = 0x3032000000;
  id v35 = sub_10001EA90;
  id v36 = sub_10001EAA0;
  id v37 = (id)objc_opt_new();
  uint64_t v26 = 0;
  int8x16_t v27 = &v26;
  uint64_t v28 = 0x3032000000;
  uint64_t v29 = sub_10001EA90;
  uint64_t v30 = sub_10001EAA0;
  fs_errorForPOSIXError();
  id v31 = (id)objc_claimAutoreleasedReturnValue();
  id v2 = [*(id *)(a1 + 32) canStartTask:v33[5] resource:*(void *)(a1 + 40)];
  if (v2)
  {
    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
  }
  else
  {
    uint64_t v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 48);
    uint64_t v6 = v33[5];
    long long v7 = *(_OWORD *)(a1 + 96);
    v25[0] = *(_OWORD *)(a1 + 80);
    v25[1] = v7;
    id v8 = +[FSAuditToken tokenWithToken:v25];
    id v9 = [*(id *)(a1 + 32) ourConn];
    id v10 = v9;
    if (v9) {
      [v9 auditToken];
    }
    else {
      memset(v24, 0, sizeof(v24));
    }
    id v11 = +[FSAuditToken tokenWithToken:v24];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    long long v12 = *(_OWORD *)(a1 + 96);
    long long v22 = *(_OWORD *)(a1 + 80);
    long long v23 = v12;
    v15[2] = sub_1000262BC;
    v15[3] = &unk_100059900;
    __int16 v20 = &v26;
    long long v21 = &v32;
    void v15[4] = *(void *)(a1 + 32);
    id v16 = *(id *)(a1 + 56);
    id v17 = *(id *)(a1 + 64);
    id v18 = *(id *)(a1 + 40);
    id v19 = *(id *)(a1 + 48);
    id v2 = [v3 applyResource:v4 targetBundle:v5 instanceID:v6 initiatorAuditToken:v8 authorizingAuditToken:v11 isProbe:0 usingBlock:v15];

    if (v2)
    {
      uint64_t v13 = 0;
      uint64_t v14 = *(void *)(a1 + 72);
    }
    else
    {
      id v2 = (id)v27[5];
      uint64_t v14 = *(void *)(a1 + 72);
      if (v2) {
        uint64_t v13 = 0;
      }
      else {
        uint64_t v13 = v33[5];
      }
    }
    (*(void (**)(uint64_t, uint64_t, id))(v14 + 16))(v14, v13, v2);
  }
  _Block_object_dispose(&v26, 8);

  _Block_object_dispose(&v32, 8);
}

void sub_100026290(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_1000262BC(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  [v10 setState:2];
  uint64_t v13 = [(id)qword_100060740 resourceManager];
  objc_sync_enter(v13);
  uint64_t v14 = [(id)qword_100060740 resourceManager];
  [v14 addResource:v10];

  objc_sync_exit(v13);
  v91[0] = _NSConcreteStackBlock;
  v91[1] = 3221225472;
  v91[2] = sub_1000269EC;
  v91[3] = &unk_100059810;
  long long v93 = *(_OWORD *)(a1 + 72);
  id v15 = v12;
  id v92 = v15;
  long long v69 = [v11 remoteObjectProxyWithErrorHandler:v91];
  v88[0] = _NSConcreteStackBlock;
  v88[1] = 3221225472;
  v88[2] = sub_100026A7C;
  v88[3] = &unk_100059810;
  long long v90 = *(_OWORD *)(a1 + 72);
  id v16 = v15;
  id v89 = v16;
  long long v70 = v11;
  long long v71 = [v11 synchronousRemoteObjectProxyWithErrorHandler:v88];
  id v17 = *(void **)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
  uint64_t v18 = FSTaskPurposeCheck;
  id v19 = [v17 fs_containerIdentifier];
  __int16 v20 = +[FSTaskDescription taskDescriptionWithID:v17 state:0 purpose:v18 error:0 bundleID:v9 extensionID:v19 resource:v10];

  [v20 setTerminateExtensionWhenFinished:1];
  long long v21 = *(void **)(a1 + 32);
  long long v22 = *(_OWORD *)(a1 + 104);
  long long v74 = *(_OWORD *)(a1 + 88);
  long long v75 = v22;
  long long v23 = [v21 getInitiatorBundleIDForToken:&v74];
  [v20 setTaskInitiatorID:v23];

  long long v24 = *(void **)(a1 + 32);
  long long v25 = *(_OWORD *)(a1 + 104);
  long long v74 = *(_OWORD *)(a1 + 88);
  long long v75 = v25;
  uint64_t v26 = [v24 getInitiatorSigningIDForToken:&v74];
  [v20 setTaskSigningID:v26];

  int8x16_t v27 = [(id)qword_100060740 tasks];
  objc_sync_enter(v27);
  uint64_t v28 = [(id)qword_100060740 tasks];
  [v28 setObject:v20 forKey:*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40)];
  id v68 = v9;

  objc_sync_exit(v27);
  [(id)qword_100060740 taskSetChanged];
  uint64_t v29 = fskit_std_log();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
    sub_100040130(v10, v29);
  }

  uint64_t v30 = objc_opt_new();
  id v31 = +[FSTaskOption optionWithoutValue:FSTaskParameterConstantForceLoad];
  [v30 addOption:v31];

  v87[0] = _NSConcreteStackBlock;
  v87[1] = 3221225472;
  v87[2] = sub_100026B0C;
  v87[3] = &unk_1000598B0;
  v87[4] = *(void *)(a1 + 72);
  [v71 loadResource:v10 options:v30 replyHandler:v87];
  v82[0] = _NSConcreteStackBlock;
  v82[1] = 3221225472;
  v82[2] = sub_100026B20;
  v82[3] = &unk_100059838;
  uint64_t v85 = *(void *)(a1 + 72);
  id v32 = v20;
  uint64_t v33 = *(void *)(a1 + 80);
  id v83 = v32;
  uint64_t v86 = v33;
  id v34 = v16;
  id v84 = v34;
  id v35 = objc_retainBlock(v82);
  id v36 = *(void **)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
  if (!v36)
  {
    id v50 = fskit_std_log();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG)) {
      sub_100040040(v50, v51, v52, v53, v54, v55, v56, v57);
    }

    uint64_t v58 = *(void *)(a1 + 40);
    uint64_t v59 = *(void *)(a1 + 48);
    uint64_t v60 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
    v80[0] = _NSConcreteStackBlock;
    v80[1] = 3221225472;
    v80[2] = sub_100026C08;
    v80[3] = &unk_1000591E8;
    long long v81 = v35;
    long long v48 = v69;
    [v69 checkWithOptions:v58 connection:v59 taskID:v60 replyHandler:v80];
    id v49 = v81;
    goto LABEL_11;
  }
  if ([v36 code] == (id)45)
  {
    id v37 = fskit_std_log();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG)) {
      sub_1000400B8(v37, v38, v39, v40, v41, v42, v43, v44);
    }

    uint64_t v45 = *(void *)(a1 + 40);
    uint64_t v46 = *(void *)(a1 + 48);
    uint64_t v47 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
    v78[0] = _NSConcreteStackBlock;
    v78[1] = 3221225472;
    v78[2] = sub_100026C18;
    v78[3] = &unk_1000591E8;
    long long v79 = v35;
    long long v48 = v69;
    [v69 checkResource:v10 options:v45 connection:v46 taskID:v47 replyHandler:v78];
    id v49 = v79;
LABEL_11:

    goto LABEL_15;
  }
  [(id)qword_100060740 removeReferencesToTask:*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40)];
  NSFileAttributeKey v61 = [(id)qword_100060740 resourceManager];
  [v61 removeResource:*(void *)(a1 + 56)];

  [(id)qword_100060740 taskSetChanged];
  *(void *)&long long v74 = 0;
  *((void *)&v74 + 1) = &v74;
  *(void *)&long long v75 = 0x3032000000;
  *((void *)&v75 + 1) = sub_10001EA90;
  long long v76 = sub_10001EAA0;
  id v77 = 0;
  id v62 = (void *)qword_100060748;
  uint64_t v63 = *(void *)(a1 + 64);
  long long v64 = *(_OWORD *)(a1 + 104);
  v73[0] = *(_OWORD *)(a1 + 88);
  v73[1] = v64;
  uint64_t v65 = +[FSAuditToken tokenWithToken:v73];
  long long v66 = [[*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) fs_containerIdentifier];
  v72[0] = _NSConcreteStackBlock;
  v72[1] = 3221225472;
  v72[2] = sub_100026C28;
  v72[3] = &unk_1000598D8;
  v72[4] = &v74;
  [v62 existingExtensionForBundle:v63 user:v65 instance:v66 replyHandler:v72];

  long long v67 = *(void **)(*((void *)&v74 + 1) + 40);
  if (v67) {
    [v67 terminate];
  }
  (*((void (**)(id, void))v34 + 2))(v34, 0);
  _Block_object_dispose(&v74, 8);

  long long v48 = v69;
LABEL_15:
}

void sub_1000269C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000269EC(void *a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), a2);
  id v4 = a2;
  [(id)qword_100060740 removeReferencesToTask:*(void *)(*(void *)(a1[6] + 8) + 40)];
  [(id)qword_100060740 taskSetChanged];
  (*(void (**)(void))(a1[4] + 16))();
}

void sub_100026A7C(void *a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), a2);
  id v4 = a2;
  [(id)qword_100060740 removeReferencesToTask:*(void *)(*(void *)(a1[6] + 8) + 40)];
  [(id)qword_100060740 taskSetChanged];
  (*(void (**)(void))(a1[4] + 16))();
}

void sub_100026B0C(uint64_t a1, int a2, id obj)
{
}

void sub_100026B20(uint64_t a1, void *a2)
{
  id v6 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  id v4 = *(id *)(a1 + 32);
  if (v6)
  {
    [(id)qword_100060740 removeReferencesToTask:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
    [(id)qword_100060740 taskSetChanged];
  }
  else
  {
    uint64_t v5 = [*(id *)(a1 + 32) updatedDescriptionInState:1 error:0];

    +[fskitdExtensionClient postTaskStatusUpdate:v5];
    id v4 = (id)v5;
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t sub_100026C08(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_100026C18(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100026C28(uint64_t a1, void *a2)
{
}

void sub_100026F8C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000271C0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_1000271D4(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 taskBundleID];
  id v4 = [v3 hasPrefix:*(void *)(a1 + 32)];

  return v4;
}

void sub_100027420(uint64_t a1)
{
  uint64_t v69 = 0;
  long long v70 = &v69;
  uint64_t v71 = 0x3032000000;
  long long v72 = sub_10001EA90;
  long long v73 = sub_10001EAA0;
  id v74 = (id)objc_opt_new();
  uint64_t v63 = 0;
  long long v64 = &v63;
  uint64_t v65 = 0x3032000000;
  long long v66 = sub_10001EA90;
  long long v67 = sub_10001EAA0;
  id v68 = 0;
  uint64_t v57 = 0;
  uint64_t v58 = &v57;
  uint64_t v59 = 0x3032000000;
  uint64_t v60 = sub_10001EA90;
  NSFileAttributeKey v61 = sub_10001EAA0;
  fs_errorForPOSIXError();
  id v62 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v51 = 0;
  uint64_t v52 = &v51;
  uint64_t v53 = 0x3032000000;
  uint64_t v54 = sub_10001EA90;
  uint64_t v55 = sub_10001EAA0;
  id v56 = 0;
  uint64_t v45 = 0;
  uint64_t v46 = (id *)&v45;
  uint64_t v47 = 0x3032000000;
  long long v48 = sub_10001EA90;
  id v49 = sub_10001EAA0;
  id v50 = 0;
  id v2 = (void *)qword_100060748;
  uint64_t v3 = *(void *)(a1 + 32);
  long long v4 = *(_OWORD *)(a1 + 88);
  long long v43 = *(_OWORD *)(a1 + 72);
  long long v44 = v4;
  uint64_t v5 = +[FSAuditToken tokenWithToken:&v43];
  uint64_t v6 = *(void *)(a1 + 40);
  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472;
  v42[2] = sub_1000279B8;
  v42[3] = &unk_1000597E8;
  v42[4] = &v45;
  v42[5] = &v63;
  v42[6] = &v51;
  [v2 existingExtensionForBundle:v3 user:v5 volume:v6 replyHandler:v42];

  if (v46[5]) {
    goto LABEL_2;
  }
  if (v52[5])
  {
    uint64_t v7 = [*(id *)(a1 + 48) canStartDeactivateTask:v70[5]];
    id v8 = v46[5];
    v46[5] = (id)v7;

    if (v46[5]) {
      goto LABEL_2;
    }
    id v9 = (long long *)(a1 + 72);
    id v10 = (void *)qword_100060748;
    uint64_t v11 = *(void *)(a1 + 32);
    long long v12 = *(_OWORD *)(a1 + 88);
    long long v43 = *(_OWORD *)(a1 + 72);
    long long v44 = v12;
    uint64_t v13 = +[FSAuditToken tokenWithToken:&v43];
    uint64_t v14 = *(void *)(a1 + 40);
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472;
    v41[2] = sub_100027AD0;
    v41[3] = &unk_100059748;
    v41[4] = &v45;
    v41[5] = &v63;
    [v10 existingExtensionForBundle:v11 user:v13 volume:v14 replyHandler:v41];

    if (v46[5])
    {
LABEL_2:
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
      goto LABEL_3;
    }
    id v15 = *(void **)(a1 + 48);
    uint64_t v16 = v52[5];
    uint64_t v17 = *(void *)(a1 + 32);
    uint64_t v18 = v64[5];
    long long v19 = *(_OWORD *)(a1 + 88);
    long long v43 = *v9;
    long long v44 = v19;
    __int16 v20 = +[FSAuditToken tokenWithToken:&v43];
    long long v21 = [*(id *)(a1 + 48) ourConn];
    long long v22 = v21;
    if (v21) {
      [v21 auditToken];
    }
    else {
      memset(v40, 0, sizeof(v40));
    }
    uint64_t v26 = +[FSAuditToken tokenWithToken:v40];
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_100027B64;
    v32[3] = &unk_1000599A0;
    id v34 = &v57;
    id v35 = &v69;
    id v36 = &v63;
    long long v27 = *(_OWORD *)(a1 + 88);
    long long v38 = *v9;
    long long v39 = v27;
    int8x16_t v31 = *(int8x16_t *)(a1 + 40);
    id v28 = (id)v31.i64[0];
    int8x16_t v33 = vextq_s8(v31, v31, 8uLL);
    uint64_t v37 = *(void *)(a1 + 64);
    uint64_t v29 = [v15 applyResource:v16 targetBundle:v17 instanceID:v18 initiatorAuditToken:v20 authorizingAuditToken:v26 isProbe:0 usingBlock:v32];
    id v30 = v46[5];
    v46[5] = (id)v29;

    if (!v46[5]) {
      objc_storeStrong(v46 + 5, (id)v58[5]);
    }
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    long long v23 = fskit_std_log();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
      sub_1000401CC();
    }

    uint64_t v24 = *(void *)(a1 + 56);
    long long v25 = fs_errorForPOSIXError();
    (*(void (**)(uint64_t, void *))(v24 + 16))(v24, v25);
  }
LABEL_3:
  _Block_object_dispose(&v45, 8);

  _Block_object_dispose(&v51, 8);
  _Block_object_dispose(&v57, 8);

  _Block_object_dispose(&v63, 8);
  _Block_object_dispose(&v69, 8);
}

void sub_100027964(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,char a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,char a56)
{
  _Block_object_dispose(&a50, 8);
  _Block_object_dispose(&a56, 8);
  _Block_object_dispose((const void *)(v56 - 248), 8);
  _Block_object_dispose((const void *)(v56 - 200), 8);
  _Block_object_dispose((const void *)(v56 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1000279B8(void *a1, void *a2, void *a3)
{
  id v17 = a2;
  id v5 = a3;
  objc_storeStrong((id *)(*(void *)(a1[4] + 8) + 40), a3);
  if (!v5)
  {
    uint64_t v6 = [v17 instanceID];
    uint64_t v7 = *(void *)(a1[5] + 8);
    id v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    id v9 = [v17 resourceIDs];
    id v10 = [v9 count];

    if (v10)
    {
      uint64_t v11 = [v17 resourceIDs];
      long long v12 = [v11 objectAtIndexedSubscript:0];

      uint64_t v13 = [(id)qword_100060740 resourceManager];
      uint64_t v14 = [v13 getResource:v12];
      uint64_t v15 = *(void *)(a1[6] + 8);
      uint64_t v16 = *(void **)(v15 + 40);
      *(void *)(v15 + 40) = v14;
    }
  }
}

void sub_100027AD0(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  if (!v5)
  {
    uint64_t v6 = [v9 instanceID];
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    id v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
}

void sub_100027B64(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472;
  v39[2] = sub_100027E28;
  v39[3] = &unk_100059810;
  long long v41 = *(_OWORD *)(a1 + 48);
  id v13 = v12;
  id v40 = v13;
  uint64_t v14 = [v11 remoteObjectProxyWithErrorHandler:v39];
  uint64_t v15 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  uint64_t v16 = FSTaskPurposeDeactivate;
  id v17 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) fs_containerIdentifier];
  uint64_t v18 = +[FSTaskDescription taskDescriptionWithID:v15 state:0 purpose:v16 error:0 bundleID:v9 extensionID:v17 resource:v10];

  long long v19 = *(void **)(a1 + 32);
  long long v20 = *(_OWORD *)(a1 + 96);
  long long v37 = *(_OWORD *)(a1 + 80);
  long long v38 = v20;
  long long v21 = [v19 getInitiatorBundleIDForToken:&v37];
  [v18 setTaskInitiatorID:v21];

  long long v22 = *(void **)(a1 + 32);
  long long v23 = *(_OWORD *)(a1 + 96);
  long long v37 = *(_OWORD *)(a1 + 80);
  long long v38 = v23;
  uint64_t v24 = [v22 getInitiatorSigningIDForToken:&v37];
  [v18 setTaskSigningID:v24];

  long long v25 = [(id)qword_100060740 tasks];
  objc_sync_enter(v25);
  uint64_t v26 = [(id)qword_100060740 tasks];
  [v26 setObject:v18 forKey:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];

  objc_sync_exit(v25);
  [(id)qword_100060740 taskSetChanged];
  uint64_t v27 = *(void *)(a1 + 40);
  uint64_t v28 = *(void *)(a1 + 72);
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_100027EB8;
  v32[3] = &unk_100059978;
  long long v36 = *(_OWORD *)(a1 + 48);
  id v33 = v18;
  id v34 = v10;
  id v35 = v13;
  id v29 = v13;
  id v30 = v10;
  id v31 = v18;
  [v14 deactivateVolume:v27 numericOptions:v28 replyHandler:v32];
}

void sub_100027E14(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100027E28(void *a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), a2);
  id v4 = a2;
  [(id)qword_100060740 removeReferencesToTask:*(void *)(*(void *)(a1[6] + 8) + 40)];
  [(id)qword_100060740 taskSetChanged];
  (*(void (**)(void))(a1[4] + 16))();
}

void sub_100027EB8(uint64_t a1, void *a2)
{
  id v8 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a2);
  id v4 = *(id *)(a1 + 32);
  if (v8)
  {
    [(id)qword_100060740 removeReferencesToTask:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
    [(id)qword_100060740 taskSetChanged];
  }
  else
  {
    uint64_t v5 = [*(id *)(a1 + 32) updatedDescriptionInState:3 error:0];

    +[fskitdExtensionClient postTaskStatusUpdate:v5];
    [*(id *)(a1 + 40) setState:0];
    uint64_t v6 = [(id)qword_100060740 resourceManager];
    objc_sync_enter(v6);
    uint64_t v7 = [(id)qword_100060740 resourceManager];
    [v7 updateResource:*(void *)(a1 + 40)];

    objc_sync_exit(v6);
    id v4 = (id)v5;
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void sub_100027FF0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100028254(uint64_t a1)
{
  uint64_t v33 = 0;
  id v34 = &v33;
  uint64_t v35 = 0x3032000000;
  long long v36 = sub_10001EA90;
  long long v37 = sub_10001EAA0;
  id v38 = (id)objc_opt_new();
  uint64_t v27 = 0;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x3032000000;
  id v30 = sub_10001EA90;
  id v31 = sub_10001EAA0;
  fs_errorForPOSIXError();
  id v32 = (id)objc_claimAutoreleasedReturnValue();
  id v2 = [*(id *)(a1 + 32) canStartTask:v34[5] resource:*(void *)(a1 + 40)];
  if (v2)
  {
    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
  }
  else
  {
    uint64_t v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 48);
    uint64_t v6 = v34[5];
    long long v7 = *(_OWORD *)(a1 + 96);
    *(_OWORD *)long long buf = *(_OWORD *)(a1 + 80);
    *(_OWORD *)&uint8_t buf[16] = v7;
    id v8 = +[FSAuditToken tokenWithToken:buf];
    id v9 = [*(id *)(a1 + 32) ourConn];
    id v10 = v9;
    if (v9) {
      [v9 auditToken];
    }
    else {
      memset(v26, 0, sizeof(v26));
    }
    id v11 = +[FSAuditToken tokenWithToken:v26];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    long long v12 = *(_OWORD *)(a1 + 96);
    long long v24 = *(_OWORD *)(a1 + 80);
    long long v25 = v12;
    v17[2] = sub_100028614;
    v17[3] = &unk_100059900;
    long long v22 = &v27;
    long long v23 = &v33;
    void v17[4] = *(void *)(a1 + 32);
    id v18 = *(id *)(a1 + 56);
    id v19 = *(id *)(a1 + 64);
    id v20 = *(id *)(a1 + 40);
    id v21 = *(id *)(a1 + 48);
    id v2 = [v3 applyResource:v4 targetBundle:v5 instanceID:v6 initiatorAuditToken:v8 authorizingAuditToken:v11 isProbe:0 usingBlock:v17];

    id v13 = fskit_std_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      uint64_t v14 = v34[5];
      *(_DWORD *)long long buf = 138412546;
      *(void *)&uint8_t buf[4] = v2;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Format about to return err %@ uuid %@", buf, 0x16u);
    }

    if (v2)
    {
      uint64_t v15 = 0;
      uint64_t v16 = *(void *)(a1 + 72);
    }
    else
    {
      id v2 = (id)v28[5];
      uint64_t v16 = *(void *)(a1 + 72);
      if (v2) {
        uint64_t v15 = 0;
      }
      else {
        uint64_t v15 = v34[5];
      }
    }
    (*(void (**)(uint64_t, uint64_t, id))(v16 + 16))(v16, v15, v2);
  }
  _Block_object_dispose(&v27, 8);

  _Block_object_dispose(&v33, 8);
}

void sub_1000285DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
}

void sub_100028614(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  [v10 setState:3];
  id v13 = [(id)qword_100060740 resourceManager];
  objc_sync_enter(v13);
  uint64_t v14 = [(id)qword_100060740 resourceManager];
  [v14 addResource:v10];

  objc_sync_exit(v13);
  v91[0] = _NSConcreteStackBlock;
  v91[1] = 3221225472;
  v91[2] = sub_100028D44;
  v91[3] = &unk_100059810;
  long long v93 = *(_OWORD *)(a1 + 72);
  id v15 = v12;
  id v92 = v15;
  uint64_t v69 = [v11 remoteObjectProxyWithErrorHandler:v91];
  v88[0] = _NSConcreteStackBlock;
  v88[1] = 3221225472;
  v88[2] = sub_100028DD4;
  v88[3] = &unk_100059810;
  long long v90 = *(_OWORD *)(a1 + 72);
  id v16 = v15;
  id v89 = v16;
  long long v70 = v11;
  uint64_t v71 = [v11 synchronousRemoteObjectProxyWithErrorHandler:v88];
  id v17 = *(void **)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
  uint64_t v18 = FSTaskPurposeFormat;
  id v19 = [v17 fs_containerIdentifier];
  id v20 = +[FSTaskDescription taskDescriptionWithID:v17 state:0 purpose:v18 error:0 bundleID:v9 extensionID:v19 resource:v10];

  [v20 setTerminateExtensionWhenFinished:1];
  id v21 = *(void **)(a1 + 32);
  long long v22 = *(_OWORD *)(a1 + 104);
  long long v74 = *(_OWORD *)(a1 + 88);
  long long v75 = v22;
  long long v23 = [v21 getInitiatorBundleIDForToken:&v74];
  [v20 setTaskInitiatorID:v23];

  long long v24 = *(void **)(a1 + 32);
  long long v25 = *(_OWORD *)(a1 + 104);
  long long v74 = *(_OWORD *)(a1 + 88);
  long long v75 = v25;
  uint64_t v26 = [v24 getInitiatorSigningIDForToken:&v74];
  [v20 setTaskSigningID:v26];

  uint64_t v27 = [(id)qword_100060740 tasks];
  objc_sync_enter(v27);
  uint64_t v28 = [(id)qword_100060740 tasks];
  [v28 setObject:v20 forKey:*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40)];
  id v68 = v9;

  objc_sync_exit(v27);
  [(id)qword_100060740 taskSetChanged];
  uint64_t v29 = fskit_std_log();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
    sub_100040338(v10, v29);
  }

  id v30 = objc_opt_new();
  id v31 = +[FSTaskOption optionWithoutValue:FSTaskParameterConstantForceLoad];
  [v30 addOption:v31];

  v87[0] = _NSConcreteStackBlock;
  v87[1] = 3221225472;
  v87[2] = sub_100028E64;
  v87[3] = &unk_1000598B0;
  v87[4] = *(void *)(a1 + 72);
  [v71 loadResource:v10 options:v30 replyHandler:v87];
  v82[0] = _NSConcreteStackBlock;
  v82[1] = 3221225472;
  v82[2] = sub_100028E78;
  v82[3] = &unk_100059838;
  uint64_t v85 = *(void *)(a1 + 72);
  id v32 = v20;
  uint64_t v33 = *(void *)(a1 + 80);
  id v83 = v32;
  uint64_t v86 = v33;
  id v34 = v16;
  id v84 = v34;
  uint64_t v35 = objc_retainBlock(v82);
  long long v36 = *(void **)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
  if (!v36)
  {
    id v50 = fskit_std_log();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG)) {
      sub_100040248(v50, v51, v52, v53, v54, v55, v56, v57);
    }

    uint64_t v58 = *(void *)(a1 + 40);
    uint64_t v59 = *(void *)(a1 + 48);
    uint64_t v60 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
    v80[0] = _NSConcreteStackBlock;
    v80[1] = 3221225472;
    v80[2] = sub_100028F60;
    v80[3] = &unk_1000591E8;
    long long v81 = v35;
    long long v48 = v69;
    [v69 formatWithOptions:v58 connection:v59 taskID:v60 replyHandler:v80];
    id v49 = v81;
    goto LABEL_11;
  }
  if ([v36 code] == (id)45)
  {
    long long v37 = fskit_std_log();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG)) {
      sub_1000402C0(v37, v38, v39, v40, v41, v42, v43, v44);
    }

    uint64_t v45 = *(void *)(a1 + 40);
    uint64_t v46 = *(void *)(a1 + 48);
    uint64_t v47 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
    v78[0] = _NSConcreteStackBlock;
    v78[1] = 3221225472;
    v78[2] = sub_100028F70;
    v78[3] = &unk_1000591E8;
    long long v79 = v35;
    long long v48 = v69;
    [v69 formatResource:v10 options:v45 connection:v46 taskID:v47 replyHandler:v78];
    id v49 = v79;
LABEL_11:

    goto LABEL_15;
  }
  [(id)qword_100060740 removeReferencesToTask:*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40)];
  NSFileAttributeKey v61 = [(id)qword_100060740 resourceManager];
  [v61 removeResource:*(void *)(a1 + 56)];

  [(id)qword_100060740 taskSetChanged];
  *(void *)&long long v74 = 0;
  *((void *)&v74 + 1) = &v74;
  *(void *)&long long v75 = 0x3032000000;
  *((void *)&v75 + 1) = sub_10001EA90;
  long long v76 = sub_10001EAA0;
  id v77 = 0;
  id v62 = (void *)qword_100060748;
  uint64_t v63 = *(void *)(a1 + 64);
  long long v64 = *(_OWORD *)(a1 + 104);
  v73[0] = *(_OWORD *)(a1 + 88);
  v73[1] = v64;
  uint64_t v65 = +[FSAuditToken tokenWithToken:v73];
  long long v66 = [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) fs_containerIdentifier];
  v72[0] = _NSConcreteStackBlock;
  v72[1] = 3221225472;
  v72[2] = sub_100028F80;
  v72[3] = &unk_1000598D8;
  v72[4] = &v74;
  [v62 existingExtensionForBundle:v63 user:v65 instance:v66 replyHandler:v72];

  long long v67 = *(void **)(*((void *)&v74 + 1) + 40);
  if (v67) {
    [v67 terminate];
  }
  (*((void (**)(id, void))v34 + 2))(v34, 0);
  _Block_object_dispose(&v74, 8);

  long long v48 = v69;
LABEL_15:
}

void sub_100028D18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100028D44(void *a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), a2);
  id v4 = a2;
  [(id)qword_100060740 removeReferencesToTask:*(void *)(*(void *)(a1[6] + 8) + 40)];
  [(id)qword_100060740 taskSetChanged];
  (*(void (**)(void))(a1[4] + 16))();
}

void sub_100028DD4(void *a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), a2);
  id v4 = a2;
  [(id)qword_100060740 removeReferencesToTask:*(void *)(*(void *)(a1[6] + 8) + 40)];
  [(id)qword_100060740 taskSetChanged];
  (*(void (**)(void))(a1[4] + 16))();
}

void sub_100028E64(uint64_t a1, int a2, id obj)
{
}

void sub_100028E78(uint64_t a1, void *a2)
{
  id v6 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  id v4 = *(id *)(a1 + 32);
  if (v6)
  {
    [(id)qword_100060740 removeReferencesToTask:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
    [(id)qword_100060740 taskSetChanged];
  }
  else
  {
    uint64_t v5 = [*(id *)(a1 + 32) updatedDescriptionInState:1 error:0];

    +[fskitdExtensionClient postTaskStatusUpdate:v5];
    id v4 = (id)v5;
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t sub_100028F60(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_100028F70(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100028F80(uint64_t a1, void *a2)
{
}

void sub_1000292F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_100029320(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  id v8 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  long long v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

uint64_t sub_1000293A0(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 bundleIdentifier];
  if ([v4 hasPrefix:*(void *)(a1 + 32)]) {
    uint64_t v5 = 1;
  }
  else {
    uint64_t v5 = (uint64_t)[v3 isSystem];
  }

  return v5;
}

void sub_100029718(uint64_t a1)
{
  uint64_t v63 = 0;
  long long v64 = &v63;
  uint64_t v65 = 0x3032000000;
  long long v66 = sub_10001EA90;
  long long v67 = sub_10001EAA0;
  id v68 = (id)objc_opt_new();
  uint64_t v57 = 0;
  uint64_t v58 = &v57;
  uint64_t v59 = 0x3032000000;
  uint64_t v60 = sub_10001EA90;
  NSFileAttributeKey v61 = sub_10001EAA0;
  id v62 = 0;
  uint64_t v51 = 0;
  uint64_t v52 = &v51;
  uint64_t v53 = 0x3032000000;
  uint64_t v54 = sub_10001EA90;
  uint64_t v55 = sub_10001EAA0;
  fs_errorForPOSIXError();
  id v56 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v45 = 0;
  uint64_t v46 = &v45;
  uint64_t v47 = 0x3032000000;
  long long v48 = sub_10001EA90;
  id v49 = sub_10001EAA0;
  id v50 = 0;
  uint64_t v39 = 0;
  uint64_t v40 = (id *)&v39;
  uint64_t v41 = 0x3032000000;
  uint64_t v42 = sub_10001EA90;
  uint64_t v43 = sub_10001EAA0;
  id v44 = 0;
  id v2 = (void *)qword_100060748;
  uint64_t v3 = *(void *)(a1 + 32);
  long long v4 = *(_OWORD *)(a1 + 96);
  long long v37 = *(_OWORD *)(a1 + 80);
  long long v38 = v4;
  uint64_t v5 = +[FSAuditToken tokenWithToken:&v37];
  uint64_t v6 = *(void *)(a1 + 40);
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_100029C2C;
  v36[3] = &unk_100059748;
  v36[4] = &v39;
  v36[5] = &v57;
  [v2 extensionForBundle:v3 user:v5 instance:v6 replyHandler:v36];

  if (v40[5]
    || ([*(id *)(a1 + 48) canStartTask:v64[5] resource:*(void *)(a1 + 56)],
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        id v8 = v40[5],
        void v40[5] = (id)v7,
        v8,
        v40[5]))
  {
    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
  }
  else
  {
    id v9 = *(void **)(a1 + 48);
    uint64_t v10 = *(void *)(a1 + 56);
    uint64_t v11 = *(void *)(a1 + 32);
    id v12 = [(id)v58[5] instanceID];
    long long v13 = *(_OWORD *)(a1 + 96);
    long long v37 = *(_OWORD *)(a1 + 80);
    long long v38 = v13;
    uint64_t v14 = +[FSAuditToken tokenWithToken:&v37];
    id v15 = [*(id *)(a1 + 48) ourConn];
    id v16 = v15;
    if (v15) {
      [v15 auditToken];
    }
    else {
      memset(v35, 0, sizeof(v35));
    }
    id v17 = +[FSAuditToken tokenWithToken:v35];
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    _OWORD v25[2] = sub_100029CAC;
    v25[3] = &unk_100059A68;
    id v30 = &v63;
    id v31 = &v57;
    uint64_t v18 = *(void *)(a1 + 48);
    uint64_t v29 = &v51;
    v25[4] = v18;
    long long v19 = *(_OWORD *)(a1 + 96);
    long long v33 = *(_OWORD *)(a1 + 80);
    long long v34 = v19;
    id v26 = *(id *)(a1 + 64);
    id v32 = &v45;
    id v27 = *(id *)(a1 + 32);
    id v28 = *(id *)(a1 + 56);
    uint64_t v20 = [v9 applyResource:v10 targetBundle:v11 instanceID:v12 initiatorAuditToken:v14 authorizingAuditToken:v17 isProbe:0 usingBlock:v25];
    id v21 = v40[5];
    void v40[5] = (id)v20;

    if (v52[5])
    {
      long long v22 = [(id)v58[5] resourceIDs];
      [v22 enumerateObjectsUsingBlock:&stru_100059AA8];

      [(id)v58[5] terminate];
    }
    if (v40[5])
    {
      uint64_t v23 = 0;
      uint64_t v24 = *(void *)(a1 + 72);
    }
    else
    {
      objc_storeStrong(v40 + 5, (id)v52[5]);
      uint64_t v24 = *(void *)(a1 + 72);
      if (v40[5]) {
        uint64_t v23 = 0;
      }
      else {
        uint64_t v23 = v46[5];
      }
    }
    (*(void (**)(uint64_t, uint64_t))(v24 + 16))(v24, v23);
  }
  _Block_object_dispose(&v39, 8);

  _Block_object_dispose(&v45, 8);
  _Block_object_dispose(&v51, 8);

  _Block_object_dispose(&v57, 8);
  _Block_object_dispose(&v63, 8);
}

void sub_100029BDC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 200), 8);
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_100029C2C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  id v8 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

void sub_100029CAC(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v34 = a2;
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  [v9 setState:4];
  id v12 = [(id)qword_100060740 resourceManager];
  objc_sync_enter(v12);
  long long v13 = [(id)qword_100060740 resourceManager];
  [v13 addResource:v9];

  objc_sync_exit(v12);
  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472;
  v44[2] = sub_100029FF4;
  v44[3] = &unk_100059810;
  long long v46 = *(_OWORD *)(a1 + 64);
  id v14 = v11;
  id v45 = v14;
  long long v33 = v10;
  id v15 = [v10 remoteObjectProxyWithErrorHandler:v44];
  uint64_t v16 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
  uint64_t v17 = FSTaskPurposeLoad;
  uint64_t v18 = [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) instanceID];
  long long v19 = [v18 fs_containerIdentifier];
  uint64_t v20 = +[FSTaskDescription taskDescriptionWithID:v16 state:0 purpose:v17 error:0 bundleID:v34 extensionID:v19 resource:v9];

  id v21 = *(void **)(a1 + 32);
  long long v22 = *(_OWORD *)(a1 + 112);
  long long v42 = *(_OWORD *)(a1 + 96);
  long long v43 = v22;
  uint64_t v23 = [v21 getInitiatorBundleIDForToken:&v42];
  [v20 setTaskInitiatorID:v23];

  uint64_t v24 = *(void **)(a1 + 32);
  long long v25 = *(_OWORD *)(a1 + 112);
  long long v42 = *(_OWORD *)(a1 + 96);
  long long v43 = v25;
  id v26 = [v24 getInitiatorSigningIDForToken:&v42];
  [v20 setTaskSigningID:v26];

  id v27 = [(id)qword_100060740 tasks];
  objc_sync_enter(v27);
  id v28 = [(id)qword_100060740 tasks];
  [v28 setObject:v20 forKey:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40)];

  objc_sync_exit(v27);
  [(id)qword_100060740 taskSetChanged];
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  _OWORD v35[2] = sub_10002A084;
  v35[3] = &unk_100059A40;
  id v36 = v20;
  int8x16_t v29 = vextq_s8(*(int8x16_t *)(a1 + 80), *(int8x16_t *)(a1 + 80), 8uLL);
  long long v40 = *(_OWORD *)(a1 + 64);
  int8x16_t v41 = v29;
  uint64_t v30 = *(void *)(a1 + 40);
  id v37 = *(id *)(a1 + 48);
  id v38 = *(id *)(a1 + 56);
  id v39 = v14;
  id v31 = v14;
  id v32 = v20;
  [v15 loadResource:v9 options:v30 replyHandler:v35];
}

void sub_100029FD4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100029FF4(void *a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), a2);
  id v4 = a2;
  [(id)qword_100060740 removeReferencesToTask:*(void *)(*(void *)(a1[6] + 8) + 40)];
  [(id)qword_100060740 taskSetChanged];
  (*(void (**)(void))(a1[4] + 16))();
}

void sub_10002A084(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), a3);
  id v7 = *(id *)(a1 + 32);
  if (v6)
  {
    [(id)qword_100060740 removeReferencesToTask:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40)];
    [(id)qword_100060740 taskSetChanged];
  }
  else
  {
    uint64_t v8 = [*(id *)(a1 + 32) updatedDescriptionInState:3 error:0];

    +[fskitdExtensionClient postTaskStatusUpdate:v8];
    id v9 = [v5 copy];
    uint64_t v10 = *(void *)(*(void *)(a1 + 80) + 8);
    id v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;

    id v12 = [*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) errorFromStartingProc];
    if (v12)
    {
      long long v13 = fskit_std_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v14 = *(void *)(a1 + 40);
        *(_DWORD *)long long buf = 136315650;
        uint64_t v20 = "-[fskitdXPCServer _loadResource:usingBundle:options:auditToken:replyHandler:]_block_invoke_5";
        __int16 v21 = 2112;
        uint64_t v22 = v14;
        __int16 v23 = 2112;
        uint64_t v24 = v12;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s: Can't find instance of bundleID %@ err %@", buf, 0x20u);
      }

      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), v12);
    }
    uint64_t v15 = *(void *)(a1 + 88);
    if (*(void *)(*(void *)(v15 + 8) + 40))
    {
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_10002A2F0;
      v18[3] = &unk_100059A18;
      v18[4] = v15;
      [v5 enumerateObjectsUsingBlock:v18];
      uint64_t v16 = *(void **)(*(void *)(*(void *)(a1 + 88) + 8) + 40);
      uint64_t v17 = [*(id *)(a1 + 48) getResourceID];
      [v16 addResourceID:v17];
    }
    id v7 = (id)v8;
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

void sub_10002A2F0(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = fskit_std_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_1000403D4(v3, v4);
  }

  id v5 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  id v6 = [v3 volumeID];
  [v5 addVolumeID:v6];
}

void sub_10002A37C(id a1, NSString *a2, unint64_t a3, BOOL *a4)
{
  id v4 = (void *)qword_100060740;
  id v5 = a2;
  id v6 = [v4 resourceManager];
  id v7 = [v6 getResource:v5];

  +[fskitdExtensionClient closeResource:v7 andRevoke:1];
}

void sub_10002A684(uint64_t a1)
{
  uint64_t v44 = 0;
  id v45 = &v44;
  uint64_t v46 = 0x3032000000;
  uint64_t v47 = sub_10001EA90;
  long long v48 = sub_10001EAA0;
  id v49 = (id)objc_opt_new();
  v42[0] = 0;
  v42[1] = v42;
  v42[2] = 0x3032000000;
  v42[3] = sub_10001EA90;
  v42[4] = sub_10001EAA0;
  id v43 = 0;
  uint64_t v36 = 0;
  id v37 = &v36;
  uint64_t v38 = 0x3032000000;
  id v39 = sub_10001EA90;
  long long v40 = sub_10001EAA0;
  fs_errorForPOSIXError();
  id v41 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v30 = 0;
  id v31 = (id *)&v30;
  uint64_t v32 = 0x3032000000;
  long long v33 = sub_10001EA90;
  id v34 = sub_10001EAA0;
  id v35 = [*(id *)(a1 + 32) canStartProbeTask:v45[5] resource:*(void *)(a1 + 40)];
  if (v31[5])
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    id v2 = *(void **)(a1 + 32);
    uint64_t v3 = *(void *)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 48);
    id v5 = +[FSModuleHost defaultInstanceUUID];
    long long v6 = *(_OWORD *)(a1 + 80);
    long long v28 = *(_OWORD *)(a1 + 64);
    long long v29 = v6;
    id v7 = +[FSAuditToken tokenWithToken:&v28];
    uint64_t v8 = [*(id *)(a1 + 32) ourConn];
    id v9 = v8;
    if (v8) {
      [v8 auditToken];
    }
    else {
      memset(v27, 0, sizeof(v27));
    }
    uint64_t v10 = +[FSAuditToken tokenWithToken:v27];
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    long long v11 = *(_OWORD *)(a1 + 80);
    long long v25 = *(_OWORD *)(a1 + 64);
    _OWORD v24[2] = sub_10002AAF8;
    v24[3] = &unk_100059AF8;
    v24[4] = *(void *)(a1 + 32);
    void v24[5] = &v36;
    long long v26 = v11;
    void v24[6] = &v44;
    v24[7] = v42;
    uint64_t v12 = [v2 applyResource:v3 targetBundle:v4 instanceID:v5 initiatorAuditToken:v7 authorizingAuditToken:v10 isProbe:1 usingBlock:v24];
    id v13 = v31[5];
    void v31[5] = (id)v12;

    if (!v31[5])
    {
      objc_storeStrong(v31 + 5, (id)v37[5]);
      if (!v31[5])
      {
        uint64_t v14 = (void *)qword_100060748;
        uint64_t v15 = *(void *)(a1 + 48);
        long long v16 = *(_OWORD *)(a1 + 80);
        long long v28 = *(_OWORD *)(a1 + 64);
        long long v29 = v16;
        uint64_t v17 = +[FSAuditToken tokenWithToken:&v28];
        uint64_t v18 = +[FSModuleHost defaultInstanceUUID];
        long long v19 = [v18 fs_containerIdentifier];
        v20[0] = _NSConcreteStackBlock;
        v20[1] = 3221225472;
        v20[2] = sub_10002B030;
        v20[3] = &unk_100059B20;
        uint64_t v22 = &v30;
        id v21 = *(id *)(a1 + 40);
        __int16 v23 = &v44;
        [v14 existingExtensionForBundle:v15 user:v17 instance:v19 replyHandler:v20];
      }
    }
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  _Block_object_dispose(&v30, 8);

  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(v42, 8);

  _Block_object_dispose(&v44, 8);
}

void sub_10002AAAC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 256), 8);
  _Block_object_dispose((const void *)(v1 - 208), 8);
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_10002AAF8(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v31 = a2;
  id v9 = a3;
  id v32 = a4;
  id v10 = a5;
  [v9 setState:1];
  long long v11 = [(id)qword_100060740 resourceManager];
  objc_sync_enter(v11);
  uint64_t v12 = [(id)qword_100060740 resourceManager];
  [v12 addResource:v9];

  objc_sync_exit(v11);
  uint64_t v43 = 0;
  uint64_t v44 = &v43;
  uint64_t v45 = 0x3032000000;
  uint64_t v46 = sub_10001EA90;
  uint64_t v47 = sub_10001EAA0;
  id v48 = 0;
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472;
  _OWORD v40[2] = sub_10002AE88;
  v40[3] = &unk_100059810;
  long long v42 = *(_OWORD *)(a1 + 40);
  id v13 = v10;
  id v41 = v13;
  uint64_t v14 = [v32 remoteObjectProxyWithErrorHandler:v40];
  uint64_t v15 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  uint64_t v16 = FSTaskPurposeProbe;
  uint64_t v17 = +[FSModuleHost defaultInstanceUUID];
  uint64_t v18 = [v17 fs_containerIdentifier];
  uint64_t v19 = +[FSTaskDescription taskDescriptionWithID:v15 state:0 purpose:v16 error:0 bundleID:v31 extensionID:v18 resource:v9];
  uint64_t v20 = (void *)v44[5];
  v44[5] = v19;

  id v21 = *(void **)(a1 + 32);
  long long v22 = *(_OWORD *)(a1 + 80);
  long long v38 = *(_OWORD *)(a1 + 64);
  long long v39 = v22;
  __int16 v23 = [v21 getInitiatorBundleIDForToken:&v38];
  [(id)v44[5] setTaskInitiatorID:v23];

  uint64_t v24 = *(void **)(a1 + 32);
  long long v25 = *(_OWORD *)(a1 + 80);
  long long v38 = *(_OWORD *)(a1 + 64);
  long long v39 = v25;
  long long v26 = [v24 getInitiatorSigningIDForToken:&v38];
  [(id)v44[5] setTaskSigningID:v26];

  id v27 = [(id)qword_100060740 tasks];
  objc_sync_enter(v27);
  long long v28 = [(id)qword_100060740 tasks];
  [v28 setObject:v44[5] forKey:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];

  objc_sync_exit(v27);
  [(id)qword_100060740 taskSetChanged];
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_10002AF18;
  v33[3] = &unk_100059AD0;
  long long v35 = *(_OWORD *)(a1 + 40);
  uint64_t v29 = *(void *)(a1 + 56);
  uint64_t v36 = &v43;
  uint64_t v37 = v29;
  id v30 = v13;
  id v34 = v30;
  [v14 probeResource:v9 replyHandler:v33];

  _Block_object_dispose(&v43, 8);
}

void sub_10002AE50(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Block_object_dispose((const void *)(v2 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_10002AE88(void *a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), a2);
  id v4 = a2;
  [(id)qword_100060740 removeReferencesToTask:*(void *)(*(void *)(a1[6] + 8) + 40)];
  [(id)qword_100060740 taskSetChanged];
  (*(void (**)(void))(a1[4] + 16))();
}

void sub_10002AF18(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v12 = a3;
  objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), a3);
  if (v12)
  {
    [(id)qword_100060740 removeReferencesToTask:*(void *)(*(void *)(a1[6] + 8) + 40)];
    [(id)qword_100060740 taskSetChanged];
  }
  else
  {
    uint64_t v6 = [*(id *)(*(void *)(a1[7] + 8) + 40) updatedDescriptionInState:3 error:0];
    uint64_t v7 = *(void *)(a1[7] + 8);
    uint64_t v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    +[fskitdExtensionClient postTaskStatusUpdate:*(void *)(*(void *)(a1[7] + 8) + 40)];
  }
  uint64_t v9 = *(void *)(a1[8] + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v5;
  id v11 = v5;

  (*(void (**)(void))(a1[4] + 16))();
}

void sub_10002B030(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  }
  else
  {
    uint64_t v7 = fskit_std_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      sub_10004046C(a1, v7);
    }

    uint64_t v8 = [*(id *)(a1 + 32) getResourceID];
    [v5 removeResourceID:v8];

    [v5 removeTaskID:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
  }
}

void sub_10002B314(uint64_t a1)
{
  uint64_t v53 = 0;
  uint64_t v54 = &v53;
  uint64_t v55 = 0x3032000000;
  id v56 = sub_10001EA90;
  uint64_t v57 = sub_10001EAA0;
  id v58 = (id)objc_opt_new();
  uint64_t v47 = 0;
  id v48 = &v47;
  uint64_t v49 = 0x3032000000;
  id v50 = sub_10001EA90;
  uint64_t v51 = sub_10001EAA0;
  fs_errorForPOSIXError();
  id v52 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v41 = 0;
  long long v42 = (id *)&v41;
  uint64_t v43 = 0x3032000000;
  uint64_t v44 = sub_10001EA90;
  uint64_t v45 = sub_10001EAA0;
  id v46 = 0;
  uint64_t v35 = 0;
  uint64_t v36 = &v35;
  uint64_t v37 = 0x3032000000;
  long long v38 = sub_10001EA90;
  long long v39 = sub_10001EAA0;
  id v40 = 0;
  uint64_t v2 = (void *)qword_100060748;
  uint64_t v3 = *(void *)(a1 + 32);
  long long v4 = *(_OWORD *)(a1 + 88);
  long long v33 = *(_OWORD *)(a1 + 72);
  long long v34 = v4;
  id v5 = +[FSAuditToken tokenWithToken:&v33];
  uint64_t v6 = *(void *)(a1 + 40);
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_10002B754;
  v32[3] = &unk_100059748;
  void v32[4] = &v41;
  void v32[5] = &v35;
  [v2 existingExtensionForBundle:v3 user:v5 resource:v6 replyHandler:v32];

  if (v42[5]
    || ([*(id *)(a1 + 48) canStartUnloadTask:v54[5] resource:*(void *)(a1 + 40)],
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        id v8 = v42[5],
        void v42[5] = (id)v7,
        v8,
        v42[5]))
  {
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
  else
  {
    uint64_t v10 = *(void *)(a1 + 40);
    uint64_t v9 = *(void **)(a1 + 48);
    uint64_t v11 = *(void *)(a1 + 32);
    id v12 = [(id)v36[5] instanceID];
    long long v13 = *(_OWORD *)(a1 + 88);
    long long v33 = *(_OWORD *)(a1 + 72);
    long long v34 = v13;
    uint64_t v14 = +[FSAuditToken tokenWithToken:&v33];
    uint64_t v15 = [*(id *)(a1 + 48) ourConn];
    uint64_t v16 = v15;
    if (v15) {
      [v15 auditToken];
    }
    else {
      memset(v31, 0, sizeof(v31));
    }
    uint64_t v17 = +[FSAuditToken tokenWithToken:v31];
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    long long v18 = *(_OWORD *)(a1 + 88);
    long long v29 = *(_OWORD *)(a1 + 72);
    long long v30 = v18;
    _OWORD v24[2] = sub_10002B7E0;
    v24[3] = &unk_100059B70;
    id v27 = &v53;
    long long v28 = &v35;
    uint64_t v19 = *(void *)(a1 + 48);
    uint64_t v20 = *(void **)(a1 + 56);
    long long v26 = &v47;
    v24[4] = v19;
    id v25 = v20;
    uint64_t v21 = [v9 applyResource:v10 targetBundle:v11 instanceID:v12 initiatorAuditToken:v14 authorizingAuditToken:v17 isProbe:0 usingBlock:v24];
    id v22 = v42[5];
    void v42[5] = (id)v21;

    if (!v42[5]) {
      objc_storeStrong(v42 + 5, (id)v48[5]);
    }
    __int16 v23 = (void *)v36[5];
    if (v23) {
      [v23 terminate];
    }
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
  _Block_object_dispose(&v35, 8);

  _Block_object_dispose(&v41, 8);
  _Block_object_dispose(&v47, 8);

  _Block_object_dispose(&v53, 8);
}

void sub_10002B710(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_10002B754(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v6 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  if (!v6) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
}

void sub_10002B7E0(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472;
  v39[2] = sub_10002BAB4;
  v39[3] = &unk_100059810;
  long long v41 = *(_OWORD *)(a1 + 48);
  id v13 = v12;
  id v40 = v13;
  id v31 = v11;
  uint64_t v14 = [v11 remoteObjectProxyWithErrorHandler:v39];
  uint64_t v15 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  uint64_t v16 = FSTaskPurposeUnload;
  uint64_t v17 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) instanceID];
  long long v18 = [v17 fs_containerIdentifier];
  id v32 = v9;
  uint64_t v19 = +[FSTaskDescription taskDescriptionWithID:v15 state:0 purpose:v16 error:0 bundleID:v9 extensionID:v18 resource:v10];

  uint64_t v20 = *(void **)(a1 + 32);
  long long v21 = *(_OWORD *)(a1 + 88);
  long long v37 = *(_OWORD *)(a1 + 72);
  long long v38 = v21;
  id v22 = [v20 getInitiatorBundleIDForToken:&v37];
  [v19 setTaskInitiatorID:v22];

  __int16 v23 = *(void **)(a1 + 32);
  long long v24 = *(_OWORD *)(a1 + 88);
  long long v37 = *(_OWORD *)(a1 + 72);
  long long v38 = v24;
  id v25 = [v23 getInitiatorSigningIDForToken:&v37];
  [v19 setTaskSigningID:v25];

  long long v26 = [(id)qword_100060740 tasks];
  objc_sync_enter(v26);
  id v27 = [(id)qword_100060740 tasks];
  [v27 setObject:v19 forKey:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];

  objc_sync_exit(v26);
  [(id)qword_100060740 taskSetChanged];
  uint64_t v28 = *(void *)(a1 + 40);
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_10002BB44;
  v33[3] = &unk_100059838;
  long long v36 = *(_OWORD *)(a1 + 48);
  id v34 = v19;
  id v35 = v13;
  id v29 = v13;
  id v30 = v19;
  [v14 unloadResource:v10 options:v28 replyHandler:v33];
}

void sub_10002BAA0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10002BAB4(void *a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), a2);
  id v4 = a2;
  [(id)qword_100060740 removeReferencesToTask:*(void *)(*(void *)(a1[6] + 8) + 40)];
  [(id)qword_100060740 taskSetChanged];
  (*(void (**)(void))(a1[4] + 16))();
}

void sub_10002BB44(uint64_t a1, void *a2)
{
  id v6 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  id v4 = *(id *)(a1 + 32);
  if (v6)
  {
    [(id)qword_100060740 removeReferencesToTask:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
    [(id)qword_100060740 taskSetChanged];
  }
  else
  {
    uint64_t v5 = [*(id *)(a1 + 32) updatedDescriptionInState:3 error:0];

    +[fskitdExtensionClient postTaskStatusUpdate:v5];
    id v4 = (id)v5;
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_10002BC74(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x16u);
}

uint64_t sub_10002BC8C(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(void *)(a3 + 4) = v3;
  *(_WORD *)(a3 + 12) = 2112;
  *(void *)(a3 + 14) = result;
  *(_WORD *)(a3 + 22) = 2112;
  *(void *)(a3 + 24) = a2;
  return result;
}

uint64_t sub_10002BCA8@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  *(void *)(a2 + 4) = a3;
  *(_WORD *)(a2 + 12) = 2112;
  *(void *)(a2 + 14) = result;
  return result;
}

void sub_10002BCBC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_10002BCE4(void *a1@<X0>, const char *a2@<X3>, uint8_t *a3@<X4>, NSObject *a4@<X8>)
{
  _os_log_error_impl(a1, a4, OS_LOG_TYPE_ERROR, a2, a3, 0x20u);
}

void sub_10002BD14(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

uint64_t sub_10002BD24(uint64_t result, uint64_t a2, int a3)
{
  *(void *)(a2 + 4) = v3;
  *(_WORD *)(a2 + 12) = 2112;
  *(void *)(a2 + 14) = result;
  *(_WORD *)(a2 + 22) = 1024;
  *(_DWORD *)(a2 + 24) = a3;
  return result;
}

void sub_10002C0B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10002C0D4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10002C0E4(uint64_t a1)
{
}

void sub_10002C0EC(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    uint64_t v5 = livefs_std_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100040508((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_10002C170(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = livefs_std_log();
  uint64_t v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_100040574((uint64_t)v3, v5, v6, v7, v8, v9, v10, v11);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    uint64_t v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "setConnected:completionHandler: returned %@", (uint8_t *)&v12, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10002C5A4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = livefs_std_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_1000405E0((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10002C93C(id a1)
{
  uint64_t v1 = livefs_std_log();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "exit", v2, 2u);
  }

  [(id)qword_100060780 tearDownDaemon:1 withPath:off_100060710];
  exit(0);
}

void sub_10002CA14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_10002CAB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_10002CB20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_10002D7A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  objc_sync_exit(v15);
  _Unwind_Resume(a1);
}

void sub_10002D7C4(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v15 = a2;
  uint64_t v7 = [v15 objectForKeyedSubscript:LiveFSMounterVolumeProviderNameKey];
  unsigned int v8 = [v7 isEqualToString:a1[4]];

  uint64_t v9 = [v15 objectForKeyedSubscript:LiveFSMounterMountedOnKey];
  if ([v9 isEqualToString:a1[5]]) {
    goto LABEL_7;
  }
  uint64_t v10 = [v15 objectForKeyedSubscript:LiveFSMounterMountIDKey];
  if ([v10 isEqualToNumber:a1[6]])
  {
LABEL_6:

LABEL_7:
    int v12 = v15;
LABEL_8:
    *(void *)(*(void *)(a1[9] + 8) + 24) = a3;
    *a4 = 1;
    goto LABEL_9;
  }
  if (v8)
  {
    uint64_t v11 = [v15 objectForKeyedSubscript:LiveFSMounterDomainStorageKey];
    if ([v11 isEqualToString:a1[7]])
    {

      goto LABEL_6;
    }
    uint64_t v13 = [v15 objectForKeyedSubscript:LiveFSMounterVolumeNameKey];
    unsigned __int8 v14 = [v13 isEqualToString:a1[8]];

    int v12 = v15;
    if (v14) {
      goto LABEL_8;
    }
  }
  else
  {

    int v12 = v15;
  }
LABEL_9:
}

void sub_10002DBA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v12 - 96), 8);
  objc_sync_exit(v11);
  _Unwind_Resume(a1);
}

uint64_t sub_10002DBD4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10002DBE4(uint64_t a1)
{
}

void sub_10002DBEC(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v12 = a2;
  unsigned int v8 = [v12 objectForKeyedSubscript:LiveFSMounterVolumeProviderNameKey];
  unsigned int v9 = [v8 isEqualToString:a1[4]];

  if (v9)
  {
    uint64_t v10 = [v12 objectForKeyedSubscript:LiveFSMounterVolumeNameKey];
    unsigned int v11 = [v10 isEqualToString:a1[5]];

    if (v11)
    {
      *(void *)(*(void *)(a1[6] + 8) + 24) = a3;
      objc_storeStrong((id *)(*(void *)(a1[7] + 8) + 40), a2);
      *a4 = 1;
    }
  }
}

void sub_10002DE6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  objc_sync_exit(v9);
  _Unwind_Resume(a1);
}

void sub_10002DE8C(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v11 = a2;
  uint64_t v7 = [v11 objectForKeyedSubscript:LiveFSMounterVolumeProviderNameKey];
  if ([v7 isEqualToString:a1[4]])
  {
    unsigned int v8 = [v11 objectForKeyedSubscript:LiveFSMounterVolumeNameKey];
    unsigned int v9 = [v8 isEqualToString:a1[5]];

    uint64_t v10 = v11;
    if (v9)
    {
      *(void *)(*(void *)(a1[6] + 8) + 24) = a3;
      *a4 = 1;
    }
  }
  else
  {

    uint64_t v10 = v11;
  }
}

void sub_10002DFF4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10002E49C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10002E4C4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10002E4D4(uint64_t a1)
{
}

void sub_10002E4DC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  id v8 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

void sub_10002E750(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va1, a7);
  va_start(va, a7);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_10002E77C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  id v8 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

void sub_10002ED1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_10002ED44(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  id v8 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

void sub_10002FC08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
  _Block_object_dispose((const void *)(v39 - 160), 8);
  _Block_object_dispose(&a39, 8);
  _Block_object_dispose((const void *)(v39 - 256), 8);
  _Unwind_Resume(a1);
}

void sub_10002FC78(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

void sub_10002FD00(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  id v8 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

void sub_10002FD80(uint64_t a1, void *a2)
{
}

void sub_10002FD90(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

uint64_t sub_10002FE18(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10002FFA8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10003086C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32)
{
  _Block_object_dispose(&a26, 8);
  _Block_object_dispose(&a32, 8);
  _Block_object_dispose((const void *)(v32 - 176), 8);
  _Block_object_dispose((const void *)(v32 - 256), 8);
  _Unwind_Resume(a1);
}

void sub_1000308E4(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  id v8 = livefs_std_log();
  uint64_t v9 = v8;
  if (v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Got connection", (uint8_t *)buf, 2u);
    }

    if (*(unsigned char *)(a1 + 56)) {
      +[FSKitConstants FSVolumeXPCProtocol];
    }
    else {
    uint64_t v10 = +[LiveFSClient interfaceForListeners];
    }
    [v6 setRemoteObjectInterface:v10];

    objc_storeStrong((id *)(*(void *)(a1 + 40) + 24), a2);
    objc_initWeak(buf, *(id *)(a1 + 40));
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100030B78;
    v18[3] = &unk_100058DB0;
    objc_copyWeak(&v19, buf);
    [v6 setInterruptionHandler:v18];
    uint64_t v13 = _NSConcreteStackBlock;
    uint64_t v14 = 3221225472;
    uint64_t v15 = sub_100030BBC;
    uint64_t v16 = &unk_100058DB0;
    objc_copyWeak(&v17, buf);
    [v6 setInvalidationHandler:&v13];
    id v11 = objc_opt_new();
    uint64_t v12 = +[LiveFSVolumeClient exportedClientInterface];
    [v6 setExportedInterface:v12];

    [v6 setExportedObject:v11];
    [v6 resume];
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

    objc_destroyWeak(&v17);
    objc_destroyWeak(&v19);
    objc_destroyWeak(buf);
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100040BA0();
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a3);
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  }
}

void sub_100030B48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100030B78(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained handleConnectionInterrupted];
    id WeakRetained = v2;
  }
}

void sub_100030BBC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = livefs_std_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    sub_100040C08((uint64_t)WeakRetained, v2, v3, v4, v5, v6, v7, v8);
  }

  if (WeakRetained) {
    [WeakRetained handleConnectionInvalidated];
  }
}

void sub_100030C20(uint64_t a1, void *a2)
{
}

void sub_100030C30(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 176), a2);
  if (v6)
  {
    *(unsigned char *)(*(void *)(a1 + 32) + 96) = 1;
    uint64_t v8 = livefs_std_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 176);
      int v25 = 138412290;
      uint64_t v26 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Got root fh %@", (uint8_t *)&v25, 0xCu);
    }
  }
  else
  {
    uint64_t v10 = livefs_std_log();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
    if (v7)
    {
      if (v11) {
        sub_100040CC0();
      }

      *(unsigned char *)(*(void *)(a1 + 32) + 96) = 0;
      uint64_t v19 = *(void *)(*(void *)(a1 + 40) + 8);
      id v20 = v7;
      uint64_t v8 = *(NSObject **)(v19 + 40);
      *(void *)(v19 + 40) = v20;
    }
    else
    {
      if (v11) {
        sub_100040C88(v10, v12, v13, v14, v15, v16, v17, v18);
      }

      *(unsigned char *)(*(void *)(a1 + 32) + 96) = 0;
      [*(id *)(*(void *)(a1 + 32) + 24) invalidate];
      uint64_t v21 = *(void *)(a1 + 32);
      id v22 = *(void **)(v21 + 24);
      *(void *)(v21 + 24) = 0;

      uint64_t v23 = fs_errorForPOSIXError();
      uint64_t v24 = *(void *)(*(void *)(a1 + 40) + 8);
      uint64_t v8 = *(NSObject **)(v24 + 40);
      *(void *)(v24 + 40) = v23;
    }
  }
}

void sub_100030DCC(uint64_t a1, void *a2)
{
}

void sub_100030DDC(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id v6 = v5;
  if (!a2 && v5 && (id v7 = v5, [v7 bytes]))
  {
    uint64_t v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", [v7 bytes]);
    uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    uint64_t v11 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) stringByReplacingOccurrencesOfString:@"/dev/" withString:&stru_10005A670];
    uint64_t v12 = *(void *)(a1 + 32);
  }
  else
  {
    uint64_t v13 = fskit_std_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_100040D28(a2, v13);
    }

    uint64_t v11 = fs_errorForPOSIXError();
    uint64_t v12 = *(void *)(a1 + 40);
  }
  uint64_t v14 = *(void *)(v12 + 8);
  uint64_t v15 = *(void **)(v14 + 40);
  *(void *)(v14 + 40) = v11;
}

void sub_100030EE0(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id v6 = v5;
  if (!a2 && v5 && (id v7 = v5, [v7 bytes]))
  {
    uint64_t v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", [v7 bytes]);
    uint64_t v9 = *(void *)(a1 + 32);
  }
  else
  {
    uint64_t v10 = fskit_std_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100040DA0(a2, v10);
    }

    uint64_t v8 = fs_errorForPOSIXError();
    uint64_t v9 = *(void *)(a1 + 40);
  }
  uint64_t v11 = *(void *)(v9 + 8);
  uint64_t v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v8;
}

id sub_10003145C(uint64_t a1)
{
  return [*(id *)(a1 + 32) doConnect];
}

void sub_10003158C(uint64_t a1)
{
  id v2 = livefs_std_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    sub_100040ED0(v2, v3, v4, v5, v6, v7, v8, v9);
  }

  uint64_t v10 = *(unsigned char **)(a1 + 32);
  if (v10[113])
  {
    [v10 setCurrentState:2];
    uint64_t v11 = fskit_std_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v16 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "xpc connection interrupted for auto eject me", v16, 2u);
    }

    uint64_t v10 = *(unsigned char **)(a1 + 32);
  }
  id v12 = [v10 unmount:1];
  [*(id *)(a1 + 32) removeMountTask];
  uint64_t v13 = *(void *)(a1 + 32);
  uint64_t v14 = *(void **)(v13 + 24);
  *(void *)(v13 + 24) = 0;
  id v15 = v14;

  [v15 invalidate];
}

id sub_1000322B8(uint64_t a1, void *a2)
{
  return [a2 setObject:*(void *)(a1 + 32) forKey:LiveFSMounterDisplayNameKey];
}

void sub_1000325B8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100032F34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100032F70(uint64_t a1, void *a2)
{
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  uint64_t v5 = fskit_std_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    sub_1000417B4();
  }
}

void sub_100032FEC(uint64_t a1, void *a2)
{
}

void sub_1000335E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100033600(void *a1)
{
  *(void *)(*(void *)(a1[6] + 8) + 40) = [*(id *)(a1[4] + 208) objectForKey:a1[5]];

  return _objc_release_x1();
}

void sub_100033760(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100033778(void *a1)
{
  id v7 = [*(id *)(a1[4] + 208) objectEnumerator];
  do
  {
    uint64_t v2 = [v7 nextObject];
    uint64_t v3 = *(void *)(a1[6] + 8);
    id v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v2;

    if (!v2) {
      break;
    }
    uint64_t v5 = [*(id *)(*(void *)(a1[6] + 8) + 40) mntOn];
    unsigned int v6 = [v5 isEqualToString:a1[5]];
  }
  while (!v6);
}

void sub_100033964(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10003397C(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 208) objectEnumerator];
  for (i = v2; ; uint64_t v2 = i)
  {
    uint64_t v3 = [v2 nextObject];
    uint64_t v4 = *(void *)(a1[7] + 8);
    uint64_t v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;

    if (!v3) {
      break;
    }
    unsigned int v6 = [*(id *)(*(void *)(a1[7] + 8) + 40) volumeName];
    if ([v6 isEqualToString:a1[5]])
    {
      id v7 = [*(id *)(*(void *)(a1[7] + 8) + 40) providerName];
      unsigned __int8 v8 = [v7 isEqualToString:a1[6]];

      if (v8) {
        break;
      }
    }
    else
    {
    }
  }
}

void sub_100033D34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va1, a13);
  va_start(va, a13);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_100033D64(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 208);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  _OWORD v14[2] = sub_100033EB4;
  v14[3] = &unk_100059DC0;
  id v15 = *(id *)(a1 + 40);
  id v3 = *(id *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 72);
  id v16 = v3;
  uint64_t v17 = v4;
  [v2 enumerateKeysAndObjectsUsingBlock:v14];
  uint64_t v5 = *(void **)(*(void *)(a1 + 32) + 208);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100033F7C;
  v8[3] = &unk_100059DE8;
  uint64_t v12 = *(void *)(a1 + 72);
  id v9 = *(id *)(a1 + 40);
  id v10 = *(id *)(a1 + 56);
  id v6 = *(id *)(a1 + 64);
  uint64_t v7 = *(void *)(a1 + 80);
  id v11 = v6;
  uint64_t v13 = v7;
  [v5 enumerateKeysAndObjectsUsingBlock:v8];
}

void sub_100033EB4(void *a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v11 = a3;
  id v6 = [v11 providerName];
  if ([v6 isEqualToString:a1[4]])
  {
    uint64_t v7 = [v11 volumeName];
    unsigned int v8 = [v7 isEqualToString:a1[5]];

    if (!v8) {
      goto LABEL_5;
    }
    *a4 = 1;
    uint64_t v9 = *(void *)(a1[6] + 8);
    id v10 = v11;
    id v6 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v10;
  }

LABEL_5:
}

void sub_100033F7C(void *a1, void *a2, void *a3, unsigned char *a4)
{
  id v16 = a2;
  id v8 = a3;
  uint64_t v9 = v8;
  id v10 = *(id *)(*(void *)(a1[7] + 8) + 40);
  if (v10) {
    BOOL v11 = v10 == v8;
  }
  else {
    BOOL v11 = 0;
  }
  if (!v11 && (unint64_t)[v8 currentState] <= 1)
  {
    uint64_t v12 = [v9 providerName];
    unsigned int v13 = [v12 isEqualToString:a1[4]];
    if (v13)
    {
      uint64_t v4 = [v9 storageName];
      if ([v4 isEqualToString:a1[5]])
      {

        goto LABEL_13;
      }
    }
    uint64_t v14 = [v9 mntOn];
    unsigned int v15 = [v14 isEqualToString:a1[6]];

    if (!v13)
    {

      if (!v15) {
        goto LABEL_14;
      }
      goto LABEL_13;
    }

    if (v15)
    {
LABEL_13:
      *(unsigned char *)(*(void *)(a1[8] + 8) + 24) = 1;
      *a4 = 1;
    }
  }
LABEL_14:
}

id sub_100034188(void *a1)
{
  return [*(id *)(a1[4] + 208) setObject:a1[5] forKey:a1[6]];
}

id sub_10003424C(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 208) removeObjectForKey:*(void *)(a1 + 40)];
}

void sub_100034344(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10003435C(uint64_t a1)
{
  +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [*(id *)(*(void *)(a1 + 32) + 208) count]);
  id v29 = v28 = a1;
  id v31 = [*(id *)(*(void *)(a1 + 32) + 208) objectEnumerator];
  uint64_t v2 = [v31 nextObject];
  if (v2)
  {
    id v3 = (void *)v2;
    uint64_t v4 = &CFGetTypeID_ptr;
    uint64_t v5 = &CFGetTypeID_ptr;
    do
    {
      uint64_t v6 = [v3 volumeName];
      if (v6)
      {
        uint64_t v7 = (void *)v6;
        if ([v3 currentState] == (id)1)
        {

LABEL_7:
          v34[0] = LiveFSMounterMountedOnKey;
          uint64_t v9 = [v3 mntOn];
          v35[0] = v9;
          v34[1] = LiveFSMounterVolumeNameKey;
          id v10 = [v3 volumeName];
          v35[1] = v10;
          v34[2] = LiveFSMounterVolumeProviderNameKey;
          BOOL v11 = [v3 providerName];
          _OWORD v35[2] = v11;
          v34[3] = LiveFSMounterDisplayNameKey;
          uint64_t v12 = [v3 displayName];
          v35[3] = v12;
          void v34[4] = LiveFSMounterMountIDKey;
          unsigned int v13 = [v4[242] numberWithUnsignedInt:[v3 midx]];
          void v35[4] = v13;
          void v34[5] = LiveFSMounterDomainStorageKey;
          uint64_t v14 = [v3 volumeName];
          v35[5] = v14;
          v34[6] = LiveFSMounterMountStateKey;
          unsigned int v15 = [v3 stateAsString];
          v35[6] = v15;
          id v16 = [v5[231] dictionaryWithObjects:v35 forKeys:v34 count:7];

          uint64_t v17 = [v3 domainError];

          if (v17)
          {
            uint64_t v18 = objc_opt_new();
            [v18 addEntriesFromDictionary:v16];
            v32[0] = @"errorDomain";
            id v30 = [v3 domainError];
            uint64_t v19 = [v30 domain];
            v33[0] = v19;
            v32[1] = @"errorCode";
            id v20 = [v3 domainError];
            uint64_t v21 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v20 code]);
            v33[1] = v21;
            v32[2] = @"errorDescription";
            id v22 = [v3 domainError];
            uint64_t v23 = [v22 description];
            v33[2] = v23;
            uint64_t v24 = +[NSDictionary dictionaryWithObjects:v33 forKeys:v32 count:3];
            [v18 setValue:v24 forKey:LiveFSMounterDomainErrorKey];

            id v16 = v18;
            uint64_t v5 = &CFGetTypeID_ptr;
          }
          else
          {
            uint64_t v5 = &CFGetTypeID_ptr;
          }
          [v29 addObject:v16];

          uint64_t v4 = &CFGetTypeID_ptr;
          goto LABEL_11;
        }
        int v8 = *(unsigned __int8 *)(v28 + 48);

        if (v8) {
          goto LABEL_7;
        }
      }
LABEL_11:
      uint64_t v25 = [v31 nextObject];

      id v3 = (void *)v25;
    }
    while (v25);
  }
  uint64_t v26 = *(void *)(*(void *)(v28 + 40) + 8);
  id v27 = *(void **)(v26 + 40);
  *(void *)(v26 + 40) = v29;
}

void sub_1000347A4(uint64_t a1)
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 208) allKeys];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100034924;
  v5[3] = &unk_100059E60;
  v5[4] = &v6;
  [v2 enumerateObjectsUsingBlock:v5];
  atomic_store(*((_DWORD *)v7 + 6) + 1, (unsigned int *)(*(void *)(a1 + 32) + 216));
  id v3 = livefs_std_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = *((_DWORD *)v7 + 6) + 1;
    *(_DWORD *)long long buf = 67109120;
    int v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Index reset to %u", buf, 8u);
  }

  _Block_object_dispose(&v6, 8);
}

void sub_100034900(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_100034924(uint64_t a1, void *a2)
{
  id result = [a2 unsignedIntValue];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  if (result > *(_DWORD *)(v4 + 24)) {
    *(_DWORD *)(v4 + 24) = result;
  }
  return result;
}

void sub_1000349B8(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

void sub_1000349D8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x12u);
}

void sub_100034F88(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100034FA4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = +[FSTaskDescription taskDescriptionWithID:a2 state:3 purpose:&stru_10005A670 error:*(void *)(a1 + 32) bundleID:*(void *)(*(void *)(a1 + 40) + 24) extensionID:*(void *)(*(void *)(a1 + 40) + 56) resource:0];
  id v3 = fskit_std_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_1000418D0((uint64_t)v2, v3);
  }

  +[fskitdExtensionClient postTaskStatusUpdate:v2];
}

void sub_100035670(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
}

uint64_t sub_1000356F8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100035708(uint64_t a1)
{
}

void sub_100035710(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained weDied];
    id WeakRetained = v2;
  }
}

void sub_100035754(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = *(void *)(a1[4] + 8);
  int v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v7;
  id v17 = v7;

  uint64_t v12 = *(void *)(a1[5] + 8);
  unsigned int v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v8;
  id v14 = v8;

  uint64_t v15 = *(void *)(a1[6] + 8);
  id v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v9;
}

void sub_100035B1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va1, a7);
  va_start(va, a7);
  uint64_t v9 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  objc_sync_exit(v7);
  _Unwind_Resume(a1);
}

void sub_100035B60(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = fskit_std_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412546;
    id v14 = v5;
    __int16 v15 = 2112;
    id v16 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Got ep %@ error %@", (uint8_t *)&v13, 0x16u);
  }

  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v5;
  id v10 = v5;

  uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v6;
}

void sub_100035E94(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100035ED4(id a1, NSString *a2, unint64_t a3, BOOL *a4)
{
  uint64_t v4 = (void *)qword_100060740;
  id v5 = a2;
  id v6 = [v4 resourceManager];
  id v7 = [v6 getResource:v5];

  if (v7)
  {
    uint64_t v8 = fskit_std_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      sub_100041B4C(v7);
    }

    +[fskitdExtensionClient closeResource:v7 andRevoke:1];
  }
}

void sub_100035F7C(id a1, NSError *a2)
{
  id v2 = a2;
  if (v2)
  {
    id v3 = fskit_std_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_100041BDC((uint64_t)v2, v3);
    }
  }
}

void sub_100036098(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100036128(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000361B8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100036248(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000362D8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100036368(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000368D8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100036AC0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100036CE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id obj)
{
}

void sub_1000370FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id obj)
{
}

void sub_100037280(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_100037298(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = [v4 volumeIDs];
  id v6 = [v5 containsObject:*(void *)(a1 + 32)];

  if (v6)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    id v7 = fskit_std_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      uint64_t v9 = [v4 instanceID];
      id v10 = [v4 bundleID];
      uint64_t v11 = [v4 resourceIDs];
      int v13 = 136316162;
      id v14 = "-[fskitdExtensionManager isVolumeIDUsed:bundle:user:replyHandler:]_block_invoke";
      __int16 v15 = 2112;
      uint64_t v16 = v8;
      __int16 v17 = 2112;
      uint64_t v18 = v9;
      __int16 v19 = 2112;
      id v20 = v10;
      __int16 v21 = 2112;
      id v22 = v11;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s:volumeID(%@) is being used by instance (%@:%@:%@)", (uint8_t *)&v13, 0x34u);
    }
  }

  return v6;
}

void sub_10003770C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id obj)
{
}

void sub_100037A74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_100037BD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_100037BE8(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = [v5 instanceID];
  id v7 = [v6 isEqual:*(void *)(a1 + 32)];

  if (v7) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  }

  return v7;
}

void sub_100037D24(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100037D74(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x20u);
}

uint64_t sub_100037D94(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 20);
  if ((v1 - 706) >= 0xFFFFFFD8) {
    return (uint64_t)*(&off_100059F50 + 5 * (v1 - 666) + 5);
  }
  else {
    return 0;
  }
}

_DWORD *sub_100037DC8(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0) {
    goto LABEL_26;
  }
  id v3 = result;
  uint64_t v4 = result[1];
  if (v4 < 0x80) {
    goto LABEL_26;
  }
  if (v4 > 0x880) {
    goto LABEL_26;
  }
  unsigned int v5 = result[11];
  if (v5 > 0x400) {
    goto LABEL_26;
  }
  unsigned int v6 = (v5 + 3) & 0xFFFFFFFC;
  if ((int)v4 - 128 < v5 || v4 < v6 + 128) {
    goto LABEL_26;
  }
  uint64_t v8 = (char *)result + v6;
  unsigned int v9 = *((_DWORD *)v8 + 13);
  if (v9 > 0x400) {
    goto LABEL_26;
  }
  unsigned int v10 = (v9 + 3) & 0xFFFFFFFC;
  int v11 = v4 - v6;
  if (v11 - 128 < v9 || v11 != v10 + 128) {
    goto LABEL_26;
  }
  uint64_t v13 = 1072;
  if (result[1] < 0x430uLL) {
    uint64_t v13 = result[1];
  }
  id result = memchr(result + 12, 0, v13 - 48);
  if (result
    && ((id v14 = v8 - 1024, v15 = v8 + 56, (char *)v3 + v4 - v15 >= 1024) ? (v16 = 1024) : (v16 = (char *)v3 + v4 - v15),
        (id result = memchr(v15, 0, v16)) != 0))
  {
    __int16 v17 = (_DWORD *)((char *)v3 + ((v4 + 3) & 0x1FFFFFFFCLL));
    if (!*v17 && v17[1] > 0x1Fu)
    {
      id result = (_DWORD *)sub_10000347C(v3[3], *((void *)v3 + 4), (uint64_t)(v3 + 12), (uint64_t)v15, *(_DWORD *)&v14[v10 + 1080], *(_DWORD *)&v14[v10 + 1084], (unsigned int *)&v14[v10 + 1088]);
      *(_DWORD *)(a2 + 32) = result;
      return result;
    }
    int v18 = -309;
  }
  else
  {
LABEL_26:
    int v18 = -304;
  }
  *(_DWORD *)(a2 + 32) = v18;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

uint64_t sub_100037F50(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 108)
  {
    int v3 = -304;
  }
  else
  {
    if (!*(_DWORD *)(result + 108) && *(_DWORD *)(result + 112) > 0x1Fu)
    {
      id result = sub_100003B00(*(unsigned int *)(result + 12), *(void *)(result + 32), *(unsigned int *)(result + 40), (unsigned int *)(result + 44));
      *(_DWORD *)(a2 + 32) = result;
      return result;
    }
    int v3 = -309;
  }
  *(_DWORD *)(a2 + 32) = v3;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

uint64_t sub_100037FF4(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 108)
  {
    int v3 = -304;
  }
  else
  {
    if (!*(_DWORD *)(result + 108) && *(_DWORD *)(result + 112) > 0x1Fu)
    {
      id result = sub_100003F88(*(unsigned int *)(result + 12), *(void *)(result + 32), *(unsigned int *)(result + 40), (unsigned int *)(result + 44));
      *(_DWORD *)(a2 + 32) = result;
      return result;
    }
    int v3 = -309;
  }
  *(_DWORD *)(a2 + 32) = v3;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

uint64_t sub_100038098(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 104)
  {
    int v3 = -304;
  }
  else
  {
    if (!*(_DWORD *)(result + 104) && *(_DWORD *)(result + 108) > 0x1Fu)
    {
      id result = sub_100004508(*(unsigned int *)(result + 12), *(void *)(result + 32), (unsigned int *)(result + 40));
      *(_DWORD *)(a2 + 32) = result;
      return result;
    }
    int v3 = -309;
  }
  *(_DWORD *)(a2 + 32) = v3;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

_DWORD *sub_100038138(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0) {
    goto LABEL_11;
  }
  int v3 = result;
  uint64_t v4 = result[1];
  if (v4 < 0x70 || v4 > 0x94) {
    goto LABEL_11;
  }
  unsigned int v5 = result[27];
  BOOL v6 = v5 <= 0x21 && (int)v4 - 112 >= v5;
  unsigned int v7 = ((v5 + 3) & 0xFFFFFFFC) + 112;
  if (!v6 || v4 != v7) {
    goto LABEL_11;
  }
  uint64_t v10 = 145;
  if (result[1] < 0x91uLL) {
    uint64_t v10 = result[1];
  }
  id result = memchr(result + 28, 0, v10 - 112);
  if (result)
  {
    int v11 = (_DWORD *)((char *)v3 + ((v4 + 3) & 0x1FFFFFFFCLL));
    if (!*v11 && v11[1] > 0x1Fu)
    {
      id result = (_DWORD *)sub_100004988(v3[3], *((void *)v3 + 4), v3 + 10, (uint64_t)(v3 + 28));
      *(_DWORD *)(a2 + 32) = result;
      return result;
    }
    int v9 = -309;
  }
  else
  {
LABEL_11:
    int v9 = -304;
  }
  *(_DWORD *)(a2 + 32) = v9;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

_DWORD *sub_10003823C(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) == 0
    && (int v3 = result, v4 = result[1], v4 >= 0x174)
    && v4 <= 0x198
    && (unsigned int v5 = result[27], v5 <= 0x21)
    && ((unsigned int v6 = (v5 + 3) & 0xFFFFFFFC, (int)v4 - 372 >= v5) ? (v7 = v4 == v6 + 372) : (v7 = 0),
        v7 && (id result = memchr(result + 28, 0, 0x21uLL)) != 0))
  {
    uint64_t v8 = (_DWORD *)((char *)v3 + ((v4 + 3) & 0x1FFFFFFFCLL));
    if (!*v8 && v8[1] > 0x1Fu)
    {
      id result = (_DWORD *)sub_100004EC4(v3[3], *((void *)v3 + 4), v3 + 10, (const char *)v3 + 112, (const char *)v3 + v6 + 112, *(_DWORD *)((char *)v3 + v6 + 368));
      *(_DWORD *)(a2 + 32) = result;
      return result;
    }
    int v9 = -309;
  }
  else
  {
    int v9 = -304;
  }
  *(_DWORD *)(a2 + 32) = v9;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

uint64_t sub_100038350(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 108)
  {
    int v3 = -304;
    goto LABEL_7;
  }
  if (*(_DWORD *)(result + 108) || *(_DWORD *)(result + 112) <= 0x1Fu)
  {
    int v3 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v3;
    NDR_record_t v4 = NDR_record;
    goto LABEL_8;
  }
  id result = sub_100005754(*(unsigned int *)(result + 12), *(void *)(result + 32), result + 40, *(unsigned int *)(result + 104), (_DWORD *)(a2 + 36));
  *(_DWORD *)(a2 + 32) = result;
  NDR_record_t v4 = NDR_record;
  if (!result)
  {
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    *(_DWORD *)(a2 + 4) = 40;
    return result;
  }
LABEL_8:
  *(NDR_record_t *)(a2 + 24) = v4;
  return result;
}

_DWORD *sub_100038414(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0) {
    goto LABEL_16;
  }
  int v3 = result;
  uint64_t v4 = result[1];
  if (v4 < 0x128) {
    goto LABEL_16;
  }
  if (v4 > 0x528) {
    goto LABEL_16;
  }
  unsigned int v5 = result[11];
  if (v5 > 0x400) {
    goto LABEL_16;
  }
  unsigned int v6 = (v5 + 3) & 0xFFFFFFFC;
  if ((int)v4 - 296 < v5 || v4 != v6 + 296) {
    goto LABEL_16;
  }
  uint64_t v8 = 1072;
  if (result[1] < 0x430uLL) {
    uint64_t v8 = result[1];
  }
  id result = memchr(result + 12, 0, v8 - 48);
  if (result)
  {
    int v9 = (_DWORD *)((char *)v3 + ((v4 + 3) & 0x1FFFFFFFCLL));
    if (!*v9 && v9[1] > 0x1Fu)
    {
      id result = (_DWORD *)sub_100005D68(v3[3], *((void *)v3 + 4), (uint64_t)(v3 + 12), (_DWORD *)((char *)v3 + v6 + 48), (uint64_t)v3 + v6 + 112);
      *(_DWORD *)(a2 + 32) = result;
      return result;
    }
    int v10 = -309;
  }
  else
  {
LABEL_16:
    int v10 = -304;
  }
  *(_DWORD *)(a2 + 32) = v10;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

_DWORD *sub_100038530(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0) {
    goto LABEL_16;
  }
  int v3 = result;
  uint64_t v4 = result[1];
  if (v4 < 0x16C) {
    goto LABEL_16;
  }
  if (v4 > 0x56C) {
    goto LABEL_16;
  }
  unsigned int v5 = result[11];
  if (v5 > 0x400) {
    goto LABEL_16;
  }
  unsigned int v6 = (v5 + 3) & 0xFFFFFFFC;
  if ((int)v4 - 364 < v5 || v4 != v6 + 364) {
    goto LABEL_16;
  }
  uint64_t v8 = 1072;
  if (result[1] < 0x430uLL) {
    uint64_t v8 = result[1];
  }
  id result = memchr(result + 12, 0, v8 - 48);
  if (result)
  {
    int v9 = (_DWORD *)((char *)v3 + ((v4 + 3) & 0x1FFFFFFFCLL));
    if (!*v9 && v9[1] > 0x1Fu)
    {
      id result = (_DWORD *)sub_100006344(v3[3], *((void *)v3 + 4), (uint64_t)(v3 + 12), (_DWORD *)((char *)v3 + v6 + 48), (_DWORD *)((char *)v3 + v6 + 112), *(unsigned int *)((char *)v3 + v6 + 176), (uint64_t)v3 + v6 + 180);
      *(_DWORD *)(a2 + 32) = result;
      return result;
    }
    int v10 = -309;
  }
  else
  {
LABEL_16:
    int v10 = -304;
  }
  *(_DWORD *)(a2 + 32) = v10;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

_DWORD *sub_100038654(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0) {
    goto LABEL_16;
  }
  int v3 = result;
  uint64_t v4 = result[1];
  if (v4 < 0x128) {
    goto LABEL_16;
  }
  if (v4 > 0x528) {
    goto LABEL_16;
  }
  unsigned int v5 = result[11];
  if (v5 > 0x400) {
    goto LABEL_16;
  }
  unsigned int v6 = (v5 + 3) & 0xFFFFFFFC;
  if ((int)v4 - 296 < v5 || v4 != v6 + 296) {
    goto LABEL_16;
  }
  uint64_t v8 = 1072;
  if (result[1] < 0x430uLL) {
    uint64_t v8 = result[1];
  }
  id result = memchr(result + 12, 0, v8 - 48);
  if (result)
  {
    int v9 = (_DWORD *)((char *)v3 + ((v4 + 3) & 0x1FFFFFFFCLL));
    if (!*v9 && v9[1] > 0x1Fu)
    {
      id result = (_DWORD *)sub_100005764(v3[3], *((void *)v3 + 4), (uint64_t)(v3 + 12), (_DWORD *)((char *)v3 + v6 + 48), (uint64_t)v3 + v6 + 112);
      *(_DWORD *)(a2 + 32) = result;
      return result;
    }
    int v10 = -309;
  }
  else
  {
LABEL_16:
    int v10 = -304;
  }
  *(_DWORD *)(a2 + 32) = v10;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

_DWORD *sub_100038770(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0) {
    goto LABEL_16;
  }
  int v3 = result;
  uint64_t v4 = result[1];
  if (v4 < 0x74) {
    goto LABEL_16;
  }
  if (v4 > 0x474) {
    goto LABEL_16;
  }
  unsigned int v5 = result[11];
  if (v5 > 0x400) {
    goto LABEL_16;
  }
  unsigned int v6 = (v5 + 3) & 0xFFFFFFFC;
  if ((int)v4 - 116 < v5 || v4 != v6 + 116) {
    goto LABEL_16;
  }
  uint64_t v8 = 1072;
  if (result[1] < 0x430uLL) {
    uint64_t v8 = result[1];
  }
  id result = memchr(result + 12, 0, v8 - 48);
  if (result)
  {
    int v9 = (_DWORD *)((char *)v3 + ((v4 + 3) & 0x1FFFFFFFCLL));
    if (!*v9 && v9[1] > 0x1Fu)
    {
      id result = (_DWORD *)sub_1000069A0(v3[3], *((void *)v3 + 4), (uint64_t)(v3 + 12), (_DWORD *)((char *)v3 + v6 + 48), *(unsigned int *)((char *)v3 + v6 + 112));
      *(_DWORD *)(a2 + 32) = result;
      return result;
    }
    int v10 = -309;
  }
  else
  {
LABEL_16:
    int v10 = -304;
  }
  *(_DWORD *)(a2 + 32) = v10;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

_DWORD *sub_10003888C(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) == 0
    && (int v3 = result, v4 = result[1], v4 >= 0x74)
    && v4 <= 0x98
    && (unsigned int v5 = result[11], v5 <= 0x21)
    && ((unsigned int v6 = (v5 + 3) & 0xFFFFFFFC, (int)v4 - 116 >= v5) ? (v7 = v4 == v6 + 116) : (v7 = 0),
        v7 && (id result = memchr(result + 12, 0, 0x21uLL)) != 0))
  {
    uint64_t v8 = (_DWORD *)((char *)v3 + ((v4 + 3) & 0x1FFFFFFFCLL));
    if (!*v8 && v8[1] > 0x1Fu)
    {
      id result = (_DWORD *)sub_1000069A0(v3[3], *((void *)v3 + 4), (uint64_t)(v3 + 12), (_DWORD *)((char *)v3 + v6 + 48), *(unsigned int *)((char *)v3 + v6 + 112));
      *(_DWORD *)(a2 + 32) = result;
      return result;
    }
    int v9 = -309;
  }
  else
  {
    int v9 = -304;
  }
  *(_DWORD *)(a2 + 32) = v9;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

_DWORD *sub_10003899C(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) == 0
    && (int v3 = result, v4 = result[1], v4 >= 0x74)
    && v4 <= 0xB8
    && (unsigned int v5 = result[11], v5 <= 0x41)
    && ((unsigned int v6 = (v5 + 3) & 0xFFFFFFFC, (int)v4 - 116 >= v5) ? (v7 = v4 == v6 + 116) : (v7 = 0),
        v7 && (id result = memchr(result + 12, 0, 0x41uLL)) != 0))
  {
    uint64_t v8 = (_DWORD *)((char *)v3 + ((v4 + 3) & 0x1FFFFFFFCLL));
    if (!*v8 && v8[1] > 0x1Fu)
    {
      id result = (_DWORD *)sub_1000069A0(v3[3], *((void *)v3 + 4), (uint64_t)(v3 + 12), (_DWORD *)((char *)v3 + v6 + 48), *(unsigned int *)((char *)v3 + v6 + 112));
      *(_DWORD *)(a2 + 32) = result;
      return result;
    }
    int v9 = -309;
  }
  else
  {
    int v9 = -304;
  }
  *(_DWORD *)(a2 + 32) = v9;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

uint64_t sub_100038AAC(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 108)
  {
    int v3 = -304;
  }
  else
  {
    if (!*(_DWORD *)(result + 108) && *(_DWORD *)(result + 112) > 0x1Fu)
    {
      id result = sub_100007214(*(unsigned int *)(result + 12), *(void *)(result + 32), (unsigned int *)(result + 40), *(unsigned int *)(result + 104));
      *(_DWORD *)(a2 + 32) = result;
      return result;
    }
    int v3 = -309;
  }
  *(_DWORD *)(a2 + 32) = v3;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

uint64_t sub_100038B50(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 108)
  {
    int v3 = -304;
  }
  else
  {
    if (!*(_DWORD *)(result + 108) && *(_DWORD *)(result + 112) > 0x1Fu)
    {
      id result = sub_100007638(*(unsigned int *)(result + 12), *(void *)(result + 32), (unsigned int *)(result + 40), *(unsigned int *)(result + 104));
      *(_DWORD *)(a2 + 32) = result;
      return result;
    }
    int v3 = -309;
  }
  *(_DWORD *)(a2 + 32) = v3;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

_DWORD *sub_100038BF4(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0) {
    goto LABEL_26;
  }
  int v3 = result;
  uint64_t v4 = result[1];
  if (v4 < 0x13C) {
    goto LABEL_26;
  }
  if (v4 > 0x93C) {
    goto LABEL_26;
  }
  unsigned int v5 = result[11];
  if (v5 > 0x400) {
    goto LABEL_26;
  }
  unsigned int v6 = (v5 + 3) & 0xFFFFFFFC;
  if ((int)v4 - 316 < v5 || v4 < v6 + 316) {
    goto LABEL_26;
  }
  uint64_t v8 = (char *)result + v6;
  unsigned int v9 = *((_DWORD *)v8 + 45);
  if (v9 > 0x400) {
    goto LABEL_26;
  }
  unsigned int v10 = (v9 + 3) & 0xFFFFFFFC;
  int v11 = v4 - v6;
  if (v11 - 316 < v9 || v11 != v10 + 316) {
    goto LABEL_26;
  }
  uint64_t v13 = 1072;
  if (result[1] < 0x430uLL) {
    uint64_t v13 = result[1];
  }
  id result = memchr(result + 12, 0, v13 - 48);
  if (result
    && ((id v14 = v8 - 1024, v15 = v8 + 184, (char *)v3 + v4 - v15 >= 1024)
      ? (size_t v16 = 1024)
      : (size_t v16 = (char *)v3 + v4 - v15),
        (id result = memchr(v15, 0, v16)) != 0))
  {
    __int16 v17 = (_DWORD *)((char *)v3 + ((v4 + 3) & 0x1FFFFFFFCLL));
    if (!*v17 && v17[1] > 0x1Fu)
    {
      id result = (_DWORD *)sub_100007A5C(v3[3], *((void *)v3 + 4), (uint64_t)(v3 + 12), (unsigned int *)v14 + 268, (unsigned int *)v14 + 284, (uint64_t)v15, (unsigned int *)&v14[v10 + 1208], (unsigned int *)&v14[v10 + 1272], *(_DWORD *)&v14[v10 + 1336]);
      *(_DWORD *)(a2 + 32) = result;
      return result;
    }
    int v18 = -309;
  }
  else
  {
LABEL_26:
    int v18 = -304;
  }
  *(_DWORD *)(a2 + 32) = v18;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

_DWORD *sub_100038D8C(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) == 0
    && (int v3 = result, v4 = result[1], v4 >= 0xB0)
    && v4 <= 0x4B0
    && ((unsigned int v5 = result[43], v5 <= 0x400) ? (v6 = (int)v4 - 176 >= v5) : (v6 = 0),
        (unsigned int v7 = ((v5 + 3) & 0xFFFFFFFC) + 176, v6) ? (v8 = v4 == v7) : (v8 = 0),
        v8 && (id result = memchr(result + 44, 0, v4 - 176)) != 0))
  {
    unsigned int v10 = (_DWORD *)((char *)v3 + ((v4 + 3) & 0x1FFFFFFFCLL));
    if (!*v10 && v10[1] > 0x1Fu)
    {
      id result = (_DWORD *)sub_100008150(v3[3], *((void *)v3 + 4), v3 + 10, v3 + 26, (uint64_t)(v3 + 44));
      *(_DWORD *)(a2 + 32) = result;
      return result;
    }
    int v9 = -309;
  }
  else
  {
    int v9 = -304;
  }
  *(_DWORD *)(a2 + 32) = v9;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

uint64_t sub_100038E88(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 128)
  {
    int v3 = -304;
  }
  else
  {
    if (!*(_DWORD *)(result + 128) && *(_DWORD *)(result + 132) > 0x1Fu)
    {
      id result = sub_100008814(*(unsigned int *)(result + 12), *(void *)(result + 32), *(_DWORD *)(result + 40), *(void *)(result + 44), (unsigned int *)(result + 52), *(_DWORD *)(result + 116), *(void *)(result + 120));
      *(_DWORD *)(a2 + 32) = result;
      return result;
    }
    int v3 = -309;
  }
  *(_DWORD *)(a2 + 32) = v3;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

_DWORD *sub_100038F38(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0) {
    goto LABEL_26;
  }
  int v3 = result;
  uint64_t v4 = result[1];
  if (v4 < 0x130) {
    goto LABEL_26;
  }
  if (v4 > 0x930) {
    goto LABEL_26;
  }
  unsigned int v5 = result[11];
  if (v5 > 0x400) {
    goto LABEL_26;
  }
  unsigned int v6 = (v5 + 3) & 0xFFFFFFFC;
  if ((int)v4 - 304 < v5 || v4 < v6 + 304) {
    goto LABEL_26;
  }
  BOOL v8 = (char *)result + v6;
  unsigned int v9 = *((_DWORD *)v8 + 13);
  if (v9 > 0x400) {
    goto LABEL_26;
  }
  unsigned int v10 = (v9 + 3) & 0xFFFFFFFC;
  int v11 = v4 - v6;
  if (v11 - 304 < v9 || v11 != v10 + 304) {
    goto LABEL_26;
  }
  uint64_t v13 = 1072;
  if (result[1] < 0x430uLL) {
    uint64_t v13 = result[1];
  }
  id result = memchr(result + 12, 0, v13 - 48);
  if (result
    && ((id v14 = v8 - 1024, v15 = v8 + 56, (char *)v3 + v4 - v15 >= 1024) ? (v16 = 1024) : (v16 = (char *)v3 + v4 - v15),
        (id result = memchr(v15, 0, v16)) != 0))
  {
    __int16 v17 = (_DWORD *)((char *)v3 + ((v4 + 3) & 0x1FFFFFFFCLL));
    if (!*v17 && v17[1] > 0x1Fu)
    {
      id result = (_DWORD *)sub_1000093E0(v3[3], *((void *)v3 + 4), (uint64_t)(v3 + 12), (uint64_t)v15, (unsigned int *)&v14[v10 + 1080], (uint64_t)&v14[v10 + 1144]);
      *(_DWORD *)(a2 + 32) = result;
      return result;
    }
    int v18 = -309;
  }
  else
  {
LABEL_26:
    int v18 = -304;
  }
  *(_DWORD *)(a2 + 32) = v18;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

_DWORD *sub_1000390BC(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0) {
    goto LABEL_16;
  }
  int v3 = result;
  uint64_t v4 = result[1];
  if (v4 < 0xB0) {
    goto LABEL_16;
  }
  if (v4 > 0x4B0) {
    goto LABEL_16;
  }
  unsigned int v5 = result[27];
  if (v5 > 0x400) {
    goto LABEL_16;
  }
  unsigned int v6 = (v5 + 3) & 0xFFFFFFFC;
  if ((int)v4 - 176 < v5 || v4 != v6 + 176) {
    goto LABEL_16;
  }
  uint64_t v8 = 1136;
  if (result[1] < 0x470uLL) {
    uint64_t v8 = result[1];
  }
  id result = memchr(result + 28, 0, v8 - 112);
  if (result)
  {
    unsigned int v9 = (_DWORD *)((char *)v3 + ((v4 + 3) & 0x1FFFFFFFCLL));
    if (!*v9 && v9[1] > 0x1Fu)
    {
      id result = (_DWORD *)sub_100008DD4(v3[3], *((void *)v3 + 4), v3 + 10, (uint64_t)(v3 + 28), (_DWORD *)((char *)v3 + v6 + 112));
      *(_DWORD *)(a2 + 32) = result;
      return result;
    }
    int v10 = -309;
  }
  else
  {
LABEL_16:
    int v10 = -304;
  }
  *(_DWORD *)(a2 + 32) = v10;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

uint64_t sub_1000391D8(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 104)
  {
    int v3 = -304;
  }
  else
  {
    if (!*(_DWORD *)(result + 104) && *(_DWORD *)(result + 108) > 0x1Fu)
    {
      id result = sub_100009A10(*(unsigned int *)(result + 12), *(void *)(result + 32), (unsigned int *)(result + 40));
      *(_DWORD *)(a2 + 32) = result;
      return result;
    }
    int v3 = -309;
  }
  *(_DWORD *)(a2 + 32) = v3;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

_DWORD *sub_100039278(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0) {
    goto LABEL_16;
  }
  int v3 = result;
  uint64_t v4 = result[1];
  if (v4 < 0xB4) {
    goto LABEL_16;
  }
  if (v4 > 0x4B4) {
    goto LABEL_16;
  }
  unsigned int v5 = result[43];
  if (v5 > 0x400) {
    goto LABEL_16;
  }
  unsigned int v6 = (v5 + 3) & 0xFFFFFFFC;
  if ((int)v4 - 180 < v5 || v4 != v6 + 180) {
    goto LABEL_16;
  }
  uint64_t v8 = 1200;
  if (result[1] < 0x4B0uLL) {
    uint64_t v8 = result[1];
  }
  id result = memchr(result + 44, 0, v8 - 176);
  if (result)
  {
    unsigned int v9 = (_DWORD *)((char *)v3 + ((v4 + 3) & 0x1FFFFFFFCLL));
    if (!*v9 && v9[1] > 0x1Fu)
    {
      id result = (_DWORD *)sub_100009EE8(v3[3], *((void *)v3 + 4), v3 + 10, v3 + 26, (uint64_t)(v3 + 44), *(unsigned int *)((char *)v3 + v6 + 176));
      *(_DWORD *)(a2 + 32) = result;
      return result;
    }
    int v10 = -309;
  }
  else
  {
LABEL_16:
    int v10 = -304;
  }
  *(_DWORD *)(a2 + 32) = v10;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

uint64_t sub_100039398(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 288)
  {
    int v3 = -304;
  }
  else
  {
    if (!*(_DWORD *)(result + 288) && *(_DWORD *)(result + 292) > 0x1Fu)
    {
      id result = sub_10000A5A8(*(unsigned int *)(result + 12), *(void *)(result + 32), (unsigned int *)(result + 40), result + 104);
      *(_DWORD *)(a2 + 32) = result;
      return result;
    }
    int v3 = -309;
  }
  *(_DWORD *)(a2 + 32) = v3;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

uint64_t sub_10003943C(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 104)
  {
    int v3 = -304;
  }
  else
  {
    if (!*(_DWORD *)(result + 104) && *(_DWORD *)(result + 108) > 0x1Fu)
    {
      id result = sub_10000AAC4(*(unsigned int *)(result + 12), *(void *)(result + 32), (unsigned int *)(result + 40));
      *(_DWORD *)(a2 + 32) = result;
      return result;
    }
    int v3 = -309;
  }
  *(_DWORD *)(a2 + 32) = v3;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

uint64_t sub_1000394DC(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 132)
  {
    int v3 = -304;
  }
  else
  {
    if (!*(_DWORD *)(result + 132) && *(_DWORD *)(result + 136) > 0x1Fu)
    {
      id result = sub_10000AFE0(*(unsigned int *)(result + 12), *(void *)(result + 32), *(void *)(result + 40), (unsigned int *)(result + 48), *(_DWORD *)(result + 112), *(void *)(result + 116), *(void *)(result + 124));
      *(_DWORD *)(a2 + 32) = result;
      return result;
    }
    int v3 = -309;
  }
  *(_DWORD *)(a2 + 32) = v3;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

uint64_t sub_100039588(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 && *(_DWORD *)(result + 24) == 1 && *(_DWORD *)(result + 4) == 136)
  {
    if (*(unsigned char *)(result + 39) == 1 && (unsigned int v3 = *(_DWORD *)(result + 40), v3 == *(_DWORD *)(result + 132)))
    {
      if (!*(_DWORD *)(result + 136) && *(_DWORD *)(result + 140) > 0x1Fu)
      {
        id result = sub_10000B568(*(unsigned int *)(result + 12), *(void *)(result + 52), (unsigned int *)(result + 60), *(void *)(result + 124), *(const void **)(result + 28), v3);
        *(_DWORD *)(a2 + 32) = result;
        return result;
      }
      int v4 = -309;
    }
    else
    {
      int v4 = -300;
    }
  }
  else
  {
    int v4 = -304;
  }
  *(_DWORD *)(a2 + 32) = v4;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

uint64_t sub_100039660(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0 || *(_DWORD *)(result + 24) != 1 || *(_DWORD *)(result + 4) != 128)
  {
    int v3 = -304;
    goto LABEL_9;
  }
  if (*(unsigned __int16 *)(result + 38) << 16 != 1114112)
  {
    int v3 = -300;
    goto LABEL_9;
  }
  if (*(_DWORD *)(result + 128) || *(_DWORD *)(result + 132) <= 0x1Fu)
  {
    int v3 = -309;
LABEL_9:
    *(_DWORD *)(a2 + 32) = v3;
    NDR_record_t v4 = NDR_record;
    goto LABEL_10;
  }
  id result = sub_10000BAC8(*(unsigned int *)(result + 12), (unsigned int *)(result + 48), *(void *)(result + 112), *(void *)(result + 120), *(unsigned int *)(result + 28), a2 + 36, (int *)(a2 + 40));
  *(_DWORD *)(a2 + 32) = result;
  NDR_record_t v4 = NDR_record;
  if (!result)
  {
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    *(_DWORD *)(a2 + 4) = 44;
    return result;
  }
LABEL_10:
  *(NDR_record_t *)(a2 + 24) = v4;
  return result;
}

uint64_t sub_10003974C(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 116)
  {
    int v3 = -304;
  }
  else
  {
    if (!*(_DWORD *)(result + 116) && *(_DWORD *)(result + 120) > 0x1Fu)
    {
      id result = sub_10000BCF8(*(unsigned int *)(result + 12), *(void *)(result + 32), (unsigned int *)(result + 40), *(_DWORD *)(result + 104), *(void *)(result + 108));
      *(_DWORD *)(a2 + 32) = result;
      return result;
    }
    int v3 = -309;
  }
  *(_DWORD *)(a2 + 32) = v3;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

uint64_t sub_1000397F4(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0 || *(_DWORD *)(result + 24) != 1 || *(_DWORD *)(result + 4) != 128)
  {
    int v3 = -304;
    goto LABEL_9;
  }
  if (*(unsigned __int16 *)(result + 38) << 16 != 1114112)
  {
    int v3 = -300;
    goto LABEL_9;
  }
  if (*(_DWORD *)(result + 128) || *(_DWORD *)(result + 132) <= 0x1Fu)
  {
    int v3 = -309;
LABEL_9:
    *(_DWORD *)(a2 + 32) = v3;
    NDR_record_t v4 = NDR_record;
    goto LABEL_10;
  }
  id result = sub_10000C21C(*(unsigned int *)(result + 12), (unsigned int *)(result + 48), *(void *)(result + 112), *(void *)(result + 120), *(unsigned int *)(result + 28), a2 + 36, (int *)(a2 + 40));
  *(_DWORD *)(a2 + 32) = result;
  NDR_record_t v4 = NDR_record;
  if (!result)
  {
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    *(_DWORD *)(a2 + 4) = 44;
    return result;
  }
LABEL_10:
  *(NDR_record_t *)(a2 + 24) = v4;
  return result;
}

uint64_t sub_1000398E0(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 104)
  {
    int v3 = -304;
  }
  else
  {
    if (!*(_DWORD *)(result + 104) && *(_DWORD *)(result + 108) > 0x1Fu)
    {
      id result = sub_10000C44C(*(unsigned int *)(result + 12), *(void *)(result + 32), (unsigned int *)(result + 40));
      *(_DWORD *)(a2 + 32) = result;
      return result;
    }
    int v3 = -309;
  }
  *(_DWORD *)(a2 + 32) = v3;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

uint64_t sub_100039980(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 104)
  {
    int v3 = -304;
  }
  else
  {
    if (!*(_DWORD *)(result + 104) && *(_DWORD *)(result + 108) > 0x1Fu)
    {
      id result = sub_10000C8D8(*(unsigned int *)(result + 12), *(void *)(result + 32), (unsigned int *)(result + 40));
      *(_DWORD *)(a2 + 32) = result;
      return result;
    }
    int v3 = -309;
  }
  *(_DWORD *)(a2 + 32) = v3;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

uint64_t sub_100039A20(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 108)
  {
    int v3 = -304;
  }
  else
  {
    if (!*(_DWORD *)(result + 108) && *(_DWORD *)(result + 112) > 0x1Fu)
    {
      id result = sub_10000CD08(*(unsigned int *)(result + 12), *(void *)(result + 32), (unsigned int *)(result + 40), *(unsigned int *)(result + 104));
      *(_DWORD *)(a2 + 32) = result;
      return result;
    }
    int v3 = -309;
  }
  *(_DWORD *)(a2 + 32) = v3;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

_DWORD *sub_100039AC4(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0) {
    goto LABEL_16;
  }
  int v3 = result;
  uint64_t v4 = result[1];
  if (v4 < 0x7C) {
    goto LABEL_16;
  }
  if (v4 > 0xFC) {
    goto LABEL_16;
  }
  unsigned int v5 = result[27];
  if (v5 > 0x80) {
    goto LABEL_16;
  }
  unsigned int v6 = (v5 + 3) & 0xFFFFFFFC;
  if ((int)v4 - 124 < v5 || v4 != v6 + 124) {
    goto LABEL_16;
  }
  uint64_t v8 = 240;
  if (result[1] < 0xF0uLL) {
    uint64_t v8 = result[1];
  }
  id result = memchr(result + 28, 0, v8 - 112);
  if (result)
  {
    unsigned int v9 = (_DWORD *)((char *)v3 + ((v4 + 3) & 0x1FFFFFFFCLL));
    if (!*v9 && v9[1] > 0x1Fu)
    {
      id result = (_DWORD *)sub_10000D1A4(v3[3], *((void *)v3 + 4), v3 + 10, (uint64_t)(v3 + 28), *(void *)((char *)v3 + v6 + 112), *(_DWORD *)((char *)v3 + v6 + 120));
      *(_DWORD *)(a2 + 32) = result;
      return result;
    }
    int v10 = -309;
  }
  else
  {
LABEL_16:
    int v10 = -304;
  }
  *(_DWORD *)(a2 + 32) = v10;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

uint64_t sub_100039BE4(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 112)
  {
    int v3 = -304;
  }
  else
  {
    if (!*(_DWORD *)(result + 112) && *(_DWORD *)(result + 116) > 0x1Fu)
    {
      id result = sub_10000DC7C(*(unsigned int *)(result + 12), *(void *)(result + 32), (unsigned int *)(result + 40), *(void *)(result + 104));
      *(_DWORD *)(a2 + 32) = result;
      return result;
    }
    int v3 = -309;
  }
  *(_DWORD *)(a2 + 32) = v3;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

_DWORD *sub_100039C88(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) == 0
    && (int v3 = result, v4 = result[1], v4 >= 0x70)
    && v4 <= 0xF0
    && ((unsigned int v5 = result[27], v5 <= 0x80) ? (v6 = (int)v4 - 112 >= v5) : (v6 = 0),
        (unsigned int v7 = ((v5 + 3) & 0xFFFFFFFC) + 112, v6) ? (v8 = v4 == v7) : (v8 = 0),
        v8 && (id result = memchr(result + 28, 0, v4 - 112)) != 0))
  {
    int v10 = (_DWORD *)((char *)v3 + ((v4 + 3) & 0x1FFFFFFFCLL));
    if (!*v10 && v10[1] > 0x1Fu)
    {
      id result = (_DWORD *)sub_10000DC44(v3[3], *((void *)v3 + 4), v3 + 10, (uint64_t)(v3 + 28));
      *(_DWORD *)(a2 + 32) = result;
      return result;
    }
    int v9 = -309;
  }
  else
  {
    int v9 = -304;
  }
  *(_DWORD *)(a2 + 32) = v9;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

_DWORD *sub_100039D80(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) == 0
    && (int v3 = result, v4 = result[1], v4 >= 0x480)
    && v4 <= 0x500
    && (unsigned int v5 = result[27], v5 <= 0x80)
    && ((unsigned int v6 = (v5 + 3) & 0xFFFFFFFC, (int)v4 - 1152 >= v5) ? (v7 = v4 == v6 + 1152) : (v7 = 0),
        v7 && (id result = memchr(result + 28, 0, 0x80uLL)) != 0))
  {
    BOOL v8 = (_DWORD *)((char *)v3 + ((v4 + 3) & 0x1FFFFFFFCLL));
    if (!*v8 && v8[1] > 0x1Fu)
    {
      id result = (_DWORD *)sub_10000D6E0(v3[3], *((void *)v3 + 4), v3 + 10, (uint64_t)(v3 + 28), (uint64_t)v3 + v6 + 112, *(void *)((char *)v3 + v6 + 1136), *(_DWORD *)((char *)v3 + v6 + 1144), *(unsigned int *)((char *)v3 + v6 + 1148));
      *(_DWORD *)(a2 + 32) = result;
      return result;
    }
    int v9 = -309;
  }
  else
  {
    int v9 = -304;
  }
  *(_DWORD *)(a2 + 32) = v9;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

uint64_t sub_100039EA0(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0) {
    goto LABEL_2;
  }
  uint64_t v4 = result;
  int v3 = -304;
  if (*(_DWORD *)(result + 24) != 1) {
    goto LABEL_3;
  }
  uint64_t v5 = *(unsigned int *)(result + 4);
  if (v5 < 0x90 || v5 > 0x110) {
    goto LABEL_3;
  }
  if (*(unsigned char *)(result + 39) != 1) {
    goto LABEL_19;
  }
  unsigned int v6 = *(_DWORD *)(result + 128);
  if (v6 > 0x80)
  {
LABEL_2:
    int v3 = -304;
    goto LABEL_3;
  }
  int v3 = -304;
  if ((int)v5 - 144 < v6) {
    goto LABEL_3;
  }
  unsigned int v7 = (v6 + 3) & 0xFFFFFFFC;
  if (v5 != v7 + 144) {
    goto LABEL_3;
  }
  BOOL v8 = (_DWORD *)(result + v7);
  unsigned int v9 = *(_DWORD *)(result + 40);
  if (v9 != v8[33])
  {
LABEL_19:
    int v3 = -300;
    goto LABEL_3;
  }
  uint64_t v10 = 260;
  if (*(unsigned int *)(result + 4) < 0x104uLL) {
    uint64_t v10 = *(unsigned int *)(result + 4);
  }
  id result = (uint64_t)memchr((void *)(result + 132), 0, v10 - 132);
  if (!result) {
    goto LABEL_2;
  }
  int v11 = (_DWORD *)(((v5 + 3) & 0x1FFFFFFFCLL) + v4);
  if (!*v11 && v11[1] > 0x1Fu)
  {
    id result = sub_10000DB3C(*(unsigned int *)(v4 + 12), *(void *)(v4 + 52), (unsigned int *)(v4 + 60), v4 + 132, *(void *)(v4 + 28), v9, v8[34], v8[35]);
    *(_DWORD *)(a2 + 32) = result;
    return result;
  }
  int v3 = -309;
LABEL_3:
  *(_DWORD *)(a2 + 32) = v3;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

uint64_t sub_10003A008(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 104)
  {
    int v3 = -304;
  }
  else
  {
    if (!*(_DWORD *)(result + 104) && *(_DWORD *)(result + 108) > 0x1Fu)
    {
      id result = sub_10000E264(*(unsigned int *)(result + 12), *(void *)(result + 32), (unsigned int *)(result + 40));
      *(_DWORD *)(a2 + 32) = result;
      return result;
    }
    int v3 = -309;
  }
  *(_DWORD *)(a2 + 32) = v3;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

uint64_t sub_10003A0A8(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 132)
  {
    int v3 = -304;
  }
  else
  {
    if (!*(_DWORD *)(result + 132) && *(_DWORD *)(result + 136) > 0x1Fu)
    {
      id result = sub_10000E6A4(*(unsigned int *)(result + 12), *(void *)(result + 32), (unsigned int *)(result + 40), *(void *)(result + 104), *(_DWORD *)(result + 112), *(unsigned int *)(result + 116), *(unsigned int *)(result + 120), *(void *)(result + 124));
      *(_DWORD *)(a2 + 32) = result;
      return result;
    }
    int v3 = -309;
  }
  *(_DWORD *)(a2 + 32) = v3;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

uint64_t sub_10003A15C(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 136)
  {
    int v3 = -304;
  }
  else
  {
    if (!*(_DWORD *)(result + 136) && *(_DWORD *)(result + 140) > 0x1Fu)
    {
      id result = sub_10000EBEC(*(unsigned int *)(result + 12), *(void *)(result + 32), (unsigned int *)(result + 40), *(void *)(result + 104), *(void *)(result + 112), *(unsigned int *)(result + 120), *(unsigned int *)(result + 124), *(void *)(result + 128));
      *(_DWORD *)(a2 + 32) = result;
      return result;
    }
    int v3 = -309;
  }
  *(_DWORD *)(a2 + 32) = v3;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

uint64_t sub_10003A20C(_DWORD *a1, uint64_t a2)
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
  if ((v4 - 706) >= 0xFFFFFFD8
    && (uint64_t v5 = (void (*)(void))*(&off_100059F50 + 5 * (v4 - 666) + 5)) != 0)
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

void sub_10003A298(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003A2D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003A348(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003A384(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003A3F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003A46C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003A4A4()
{
  sub_10000F344();
  sub_10000F39C((void *)&_mh_execute_header, v0, v1, "spontaneous unmount done with error %@ name %@");
}

void sub_10003A50C(uint64_t a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)long long buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Error %@ forgetting volume %@", buf, 0x16u);
}

void sub_10003A574()
{
  sub_10000F344();
  sub_10000F39C((void *)&_mh_execute_header, v0, v1, "spontaneous unmount cleanup done with error %@ name %@");
}

void sub_10003A5DC()
{
  sub_10000F290(__stack_chk_guard);
  sub_10000F240();
  sub_10000F254((void *)&_mh_execute_header, v0, v1, "%s: Unable to find entry for index %u", v2, v3, v4, v5, 2u);
}

void sub_10003A650()
{
  sub_10000F290(__stack_chk_guard);
  sub_10000F240();
  sub_10000F254((void *)&_mh_execute_header, v0, v1, "%s: Unable to get fsobj for idx %u", v2, v3, v4, v5, 2u);
}

void sub_10003A6C4()
{
  sub_10000F29C(__stack_chk_guard);
  int v2 = 136315650;
  sub_10000F220();
  sub_10000F270((void *)&_mh_execute_header, v0, v1, "%s: Got connection error for idx %u, error %@", v2);
}

void sub_10003A738()
{
  sub_10000F290(__stack_chk_guard);
  sub_10000F240();
  sub_10000F254((void *)&_mh_execute_header, v0, v1, "%s: Unable to find entry for index %u", v2, v3, v4, v5, 2u);
}

void sub_10003A7AC()
{
  sub_10000F290(__stack_chk_guard);
  sub_10000F240();
  sub_10000F254((void *)&_mh_execute_header, v0, v1, "%s: Unable to get fsobj for idx %u", v2, v3, v4, v5, 2u);
}

void sub_10003A820()
{
  sub_10000F29C(__stack_chk_guard);
  int v2 = 136315650;
  sub_10000F220();
  sub_10000F270((void *)&_mh_execute_header, v0, v1, "%s: Got connection error for idx %u, error %@", v2);
}

void sub_10003A894()
{
  sub_10000F290(__stack_chk_guard);
  sub_10000F240();
  sub_10000F254((void *)&_mh_execute_header, v0, v1, "%s: Unable to find entry for index %u", v2, v3, v4, v5, 2u);
}

void sub_10003A908()
{
  sub_10000F290(__stack_chk_guard);
  sub_10000F240();
  sub_10000F254((void *)&_mh_execute_header, v0, v1, "%s: Unable to get fsobj for idx %u", v2, v3, v4, v5, 2u);
}

void sub_10003A97C(os_log_t log)
{
  int v1 = 136315138;
  uint64_t v2 = "lifs_setfsattr_send";
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "%s: sync is async", (uint8_t *)&v1, 0xCu);
}

void sub_10003AA00()
{
  sub_10000F29C(__stack_chk_guard);
  int v2 = 136315650;
  sub_10000F220();
  sub_10000F270((void *)&_mh_execute_header, v0, v1, "%s: Got connection error for idx %u, error %@", v2);
}

void sub_10003AA74()
{
  sub_10000F290(__stack_chk_guard);
  sub_10000F240();
  sub_10000F254((void *)&_mh_execute_header, v0, v1, "%s: Unable to find entry for index %u", v2, v3, v4, v5, 2u);
}

void sub_10003AAE8()
{
  sub_10000F290(__stack_chk_guard);
  sub_10000F240();
  sub_10000F254((void *)&_mh_execute_header, v0, v1, "%s: Unable to get fsobj for idx %u", v2, v3, v4, v5, 2u);
}

void sub_10003AB5C()
{
  sub_10000F29C(__stack_chk_guard);
  int v2 = 136315650;
  sub_10000F220();
  sub_10000F270((void *)&_mh_execute_header, v0, v1, "%s: Got connection error for idx %u, error %@", v2);
}

void sub_10003ABD0()
{
  sub_10000F290(__stack_chk_guard);
  sub_10000F240();
  sub_10000F254((void *)&_mh_execute_header, v0, v1, "%s: Unable to find entry for index %u", v2, v3, v4, v5, 2u);
}

void sub_10003AC44()
{
  sub_10000F290(__stack_chk_guard);
  sub_10000F240();
  sub_10000F254((void *)&_mh_execute_header, v0, v1, "%s: Unable to get fsobj for idx %u", v2, v3, v4, v5, 2u);
}

void sub_10003ACB8()
{
  sub_10000F29C(__stack_chk_guard);
  int v2 = 136315650;
  sub_10000F220();
  sub_10000F270((void *)&_mh_execute_header, v0, v1, "%s: Got connection error for idx %u, error %@", v2);
}

void sub_10003AD2C()
{
  sub_10000F290(__stack_chk_guard);
  sub_10000F240();
  sub_10000F254((void *)&_mh_execute_header, v0, v1, "%s: Unable to find entry for index %u", v2, v3, v4, v5, 2u);
}

void sub_10003ADA0()
{
  sub_10000F290(__stack_chk_guard);
  sub_10000F240();
  sub_10000F254((void *)&_mh_execute_header, v0, v1, "%s: Unable to get fsobj for idx %u", v2, v3, v4, v5, 2u);
}

void sub_10003AE14()
{
  sub_10000F29C(__stack_chk_guard);
  int v2 = 136315650;
  sub_10000F220();
  sub_10000F270((void *)&_mh_execute_header, v0, v1, "%s: Got connection error for idx %u, error %@", v2);
}

void sub_10003AE88()
{
  sub_10000F2DC();
  sub_10000F254((void *)&_mh_execute_header, v0, v1, "%s: Unable to find entry for index %u", v2, v3, v4, v5, 2u);
}

void sub_10003AEFC()
{
  sub_10000F2DC();
  sub_10000F254((void *)&_mh_execute_header, v0, v1, "%s: Unable to get fsobj for idx %u", v2, v3, v4, v5, 2u);
}

void sub_10003AF70()
{
  sub_10000F29C(__stack_chk_guard);
  int v2 = 136315650;
  sub_10000F220();
  sub_10000F270((void *)&_mh_execute_header, v0, v1, "%s: Got connection error for idx %u, error %@", v2);
}

void sub_10003AFE4()
{
  sub_10000F290(__stack_chk_guard);
  sub_10000F240();
  sub_10000F254((void *)&_mh_execute_header, v0, v1, "%s: Unable to find entry for index %u", v2, v3, v4, v5, 2u);
}

void sub_10003B058()
{
  sub_10000F290(__stack_chk_guard);
  sub_10000F240();
  sub_10000F254((void *)&_mh_execute_header, v0, v1, "%s: Unable to get fsobj for idx %u", v2, v3, v4, v5, 2u);
}

void sub_10003B0CC()
{
  sub_10000F29C(__stack_chk_guard);
  int v2 = 136315650;
  sub_10000F220();
  sub_10000F270((void *)&_mh_execute_header, v0, v1, "%s: Got connection error for idx %u, error %@", v2);
}

void sub_10003B140()
{
  sub_10000F290(__stack_chk_guard);
  sub_10000F240();
  sub_10000F254((void *)&_mh_execute_header, v0, v1, "%s: Unable to find entry for index %u", v2, v3, v4, v5, 2u);
}

void sub_10003B1B4()
{
  sub_10000F290(__stack_chk_guard);
  sub_10000F240();
  sub_10000F254((void *)&_mh_execute_header, v0, v1, "%s: Unable to get fsobj for idx %u", v2, v3, v4, v5, 2u);
}

void sub_10003B228()
{
  sub_10000F29C(__stack_chk_guard);
  int v2 = 136315650;
  sub_10000F220();
  sub_10000F270((void *)&_mh_execute_header, v0, v1, "%s: Got connection error for idx %u, error %@", v2);
}

void sub_10003B29C()
{
  sub_10000F290(__stack_chk_guard);
  sub_10000F240();
  sub_10000F254((void *)&_mh_execute_header, v0, v1, "%s: Unable to find entry for index %u", v2, v3, v4, v5, 2u);
}

void sub_10003B310()
{
  sub_10000F290(__stack_chk_guard);
  sub_10000F240();
  sub_10000F254((void *)&_mh_execute_header, v0, v1, "%s: Unable to get fsobj for idx %u", v2, v3, v4, v5, 2u);
}

void sub_10003B384()
{
  sub_10000F29C(__stack_chk_guard);
  int v2 = 136315650;
  sub_10000F220();
  sub_10000F270((void *)&_mh_execute_header, v0, v1, "%s: Got connection error for idx %u, error %@", v2);
}

void sub_10003B3F8()
{
  sub_10000F290(__stack_chk_guard);
  sub_10000F240();
  sub_10000F254((void *)&_mh_execute_header, v0, v1, "%s: Unable to find entry for index %u", v2, v3, v4, v5, 2u);
}

void sub_10003B46C()
{
  sub_10000F290(__stack_chk_guard);
  sub_10000F240();
  sub_10000F254((void *)&_mh_execute_header, v0, v1, "%s: Unable to get fsobj for idx %u", v2, v3, v4, v5, 2u);
}

void sub_10003B4E0()
{
  LODWORD(v2) = 136315650;
  sub_10000F328();
  sub_10000F35C((void *)&_mh_execute_header, v0, v1, "%s: rename across devices: %u and %u", v2, v3, v4);
}

void sub_10003B55C()
{
  sub_10000F29C(__stack_chk_guard);
  int v2 = 136315650;
  sub_10000F220();
  sub_10000F270((void *)&_mh_execute_header, v0, v1, "%s: Got connection error for idx %u, error %@", v2);
}

void sub_10003B5D0()
{
  sub_10000F290(__stack_chk_guard);
  sub_10000F240();
  sub_10000F254((void *)&_mh_execute_header, v0, v1, "%s: Unable to find entry for index %u", v2, v3, v4, v5, 2u);
}

void sub_10003B644()
{
  sub_10000F290(__stack_chk_guard);
  sub_10000F240();
  sub_10000F254((void *)&_mh_execute_header, v0, v1, "%s: Unable to get fsobj for idx %u", v2, v3, v4, v5, 2u);
}

void sub_10003B6B8()
{
  sub_10000F29C(__stack_chk_guard);
  int v2 = 136315650;
  sub_10000F220();
  sub_10000F270((void *)&_mh_execute_header, v0, v1, "%s: Got connection error for idx %u, error %@", v2);
}

void sub_10003B72C()
{
  sub_10000F290(__stack_chk_guard);
  sub_10000F240();
  sub_10000F254((void *)&_mh_execute_header, v0, v1, "%s: Unable to find entry for index %u", v2, v3, v4, v5, 2u);
}

void sub_10003B7A0()
{
  sub_10000F290(__stack_chk_guard);
  sub_10000F240();
  sub_10000F254((void *)&_mh_execute_header, v0, v1, "%s: Unable to get fsobj for idx %u", v2, v3, v4, v5, 2u);
}

void sub_10003B814()
{
  sub_10000F29C(__stack_chk_guard);
  int v2 = 136315650;
  sub_10000F220();
  sub_10000F270((void *)&_mh_execute_header, v0, v1, "%s: Got connection error for idx %u, error %@", v2);
}

void sub_10003B888()
{
  sub_10000F290(__stack_chk_guard);
  sub_10000F240();
  sub_10000F254((void *)&_mh_execute_header, v0, v1, "%s: Unable to find entry for index %u", v2, v3, v4, v5, 2u);
}

void sub_10003B8FC()
{
  sub_10000F290(__stack_chk_guard);
  sub_10000F240();
  sub_10000F254((void *)&_mh_execute_header, v0, v1, "%s: Unable to get fsobj for idx %u", v2, v3, v4, v5, 2u);
}

void sub_10003B970()
{
  sub_10000F29C(__stack_chk_guard);
  int v2 = 136315650;
  sub_10000F220();
  sub_10000F270((void *)&_mh_execute_header, v0, v1, "%s: Got connection error for idx %u, error %@", v2);
}

void sub_10003B9E4()
{
  sub_10000F290(__stack_chk_guard);
  sub_10000F240();
  sub_10000F254((void *)&_mh_execute_header, v0, v1, "%s: Unable to find entry for index %u", v2, v3, v4, v5, 2u);
}

void sub_10003BA58()
{
  sub_10000F290(__stack_chk_guard);
  sub_10000F240();
  sub_10000F254((void *)&_mh_execute_header, v0, v1, "%s: Unable to get fsobj for idx %u", v2, v3, v4, v5, 2u);
}

void sub_10003BACC()
{
  sub_10000F29C(__stack_chk_guard);
  int v2 = 136315650;
  sub_10000F220();
  sub_10000F270((void *)&_mh_execute_header, v0, v1, "%s: Got connection error for idx %u, error %@", v2);
}

void sub_10003BB40(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003BBB8()
{
  sub_10000F290(__stack_chk_guard);
  sub_10000F240();
  sub_10000F254((void *)&_mh_execute_header, v0, v1, "%s: Unable to find entry for index %u", v2, v3, v4, v5, 2u);
}

void sub_10003BC2C()
{
  sub_10000F290(__stack_chk_guard);
  sub_10000F240();
  sub_10000F254((void *)&_mh_execute_header, v0, v1, "%s: Unable to get fsobj for idx %u", v2, v3, v4, v5, 2u);
}

void sub_10003BCA0()
{
  LODWORD(v2) = 136315650;
  sub_10000F328();
  sub_10000F35C((void *)&_mh_execute_header, v0, v1, "%s: rename across devices: %u and %u", v2, v3, v4);
}

void sub_10003BD1C()
{
  sub_10000F29C(__stack_chk_guard);
  int v2 = 136315650;
  sub_10000F220();
  sub_10000F270((void *)&_mh_execute_header, v0, v1, "%s: Got connection error for idx %u, error %@", v2);
}

void sub_10003BD90()
{
  sub_10000F290(__stack_chk_guard);
  sub_10000F240();
  sub_10000F254((void *)&_mh_execute_header, v0, v1, "%s: Unable to find entry for index %u", v2, v3, v4, v5, 2u);
}

void sub_10003BE04()
{
  sub_10000F290(__stack_chk_guard);
  sub_10000F240();
  sub_10000F254((void *)&_mh_execute_header, v0, v1, "%s: Unable to get fsobj for idx %u", v2, v3, v4, v5, 2u);
}

void sub_10003BE78()
{
  sub_10000F29C(__stack_chk_guard);
  int v2 = 136315650;
  sub_10000F220();
  sub_10000F270((void *)&_mh_execute_header, v0, v1, "%s: Got connection error for idx %u, error %@", v2);
}

void sub_10003BEEC()
{
  sub_10000F290(__stack_chk_guard);
  sub_10000F240();
  sub_10000F254((void *)&_mh_execute_header, v0, v1, "%s: Unable to find entry for index %u", v2, v3, v4, v5, 2u);
}

void sub_10003BF60()
{
  sub_10000F290(__stack_chk_guard);
  sub_10000F240();
  sub_10000F254((void *)&_mh_execute_header, v0, v1, "%s: Unable to get fsobj for idx %u", v2, v3, v4, v5, 2u);
}

void sub_10003BFD4()
{
  sub_10000F29C(__stack_chk_guard);
  int v2 = 136315650;
  sub_10000F220();
  sub_10000F270((void *)&_mh_execute_header, v0, v1, "%s: Got connection error for idx %u, error %@", v2);
}

void sub_10003C048()
{
  sub_10000F290(__stack_chk_guard);
  sub_10000F240();
  sub_10000F254((void *)&_mh_execute_header, v0, v1, "%s: Unable to find entry for index %u", v2, v3, v4, v5, 2u);
}

void sub_10003C0BC()
{
  sub_10000F290(__stack_chk_guard);
  sub_10000F240();
  sub_10000F254((void *)&_mh_execute_header, v0, v1, "%s: Unable to get fsobj for idx %u", v2, v3, v4, v5, 2u);
}

void sub_10003C130()
{
  sub_10000F29C(__stack_chk_guard);
  int v2 = 136315650;
  sub_10000F220();
  sub_10000F270((void *)&_mh_execute_header, v0, v1, "%s: Got connection error for idx %u, error %@", v2);
}

void sub_10003C1A4()
{
  sub_10000F290(__stack_chk_guard);
  sub_10000F240();
  sub_10000F254((void *)&_mh_execute_header, v0, v1, "%s: Unable to find entry for index %u", v2, v3, v4, v5, 2u);
}

void sub_10003C218()
{
  sub_10000F290(__stack_chk_guard);
  sub_10000F240();
  sub_10000F254((void *)&_mh_execute_header, v0, v1, "%s: Unable to get fsobj for idx %u", v2, v3, v4, v5, 2u);
}

void sub_10003C28C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003C304()
{
  sub_10000F29C(__stack_chk_guard);
  int v2 = 136315650;
  sub_10000F220();
  sub_10000F270((void *)&_mh_execute_header, v0, v1, "%s: Got connection error for idx %u, error %@", v2);
}

void sub_10003C378()
{
  sub_10000F290(__stack_chk_guard);
  sub_10000F240();
  sub_10000F254((void *)&_mh_execute_header, v0, v1, "%s: Unable to find entry for index %u", v2, v3, v4, v5, 2u);
}

void sub_10003C3EC()
{
  sub_10000F290(__stack_chk_guard);
  sub_10000F240();
  sub_10000F254((void *)&_mh_execute_header, v0, v1, "%s: Unable to get fsobj for idx %u", v2, v3, v4, v5, 2u);
}

void sub_10003C460()
{
  sub_10000F29C(__stack_chk_guard);
  int v2 = 136315650;
  sub_10000F220();
  sub_10000F270((void *)&_mh_execute_header, v0, v1, "%s: Got connection error for idx %u, error %@", v2);
}

void sub_10003C4D4()
{
  sub_10000F290(__stack_chk_guard);
  sub_10000F240();
  sub_10000F254((void *)&_mh_execute_header, v0, v1, "%s: Unable to find entry for index %u", v2, v3, v4, v5, 2u);
}

void sub_10003C548()
{
  sub_10000F290(__stack_chk_guard);
  sub_10000F240();
  sub_10000F254((void *)&_mh_execute_header, v0, v1, "%s: Unable to get fsobj for idx %u", v2, v3, v4, v5, 2u);
}

void sub_10003C5BC()
{
  sub_10000F29C(__stack_chk_guard);
  int v2 = 136315650;
  sub_10000F220();
  sub_10000F270((void *)&_mh_execute_header, v0, v1, "%s: Got connection error for idx %u, error %@", v2);
}

void sub_10003C630()
{
  int v2 = 136315650;
  sub_10000F220();
  sub_10000F270((void *)&_mh_execute_header, v0, v1, "%s: Got connection error for idx %u, error %@", v2);
}

void sub_10003C6A8()
{
  sub_10000F29C(__stack_chk_guard);
  int v2 = 136315650;
  sub_10000F220();
  sub_10000F270((void *)&_mh_execute_header, v0, v1, "%s: Got connection error for idx %u, error %@", v2);
}

void sub_10003C71C()
{
  sub_10000F290(__stack_chk_guard);
  sub_10000F240();
  sub_10000F254((void *)&_mh_execute_header, v0, v1, "%s: Unable to find entry for index %u", v2, v3, v4, v5, 2u);
}

void sub_10003C790()
{
  sub_10000F290(__stack_chk_guard);
  sub_10000F240();
  sub_10000F254((void *)&_mh_execute_header, v0, v1, "%s: Unable to get fsobj for idx %u", v2, v3, v4, v5, 2u);
}

void sub_10003C804()
{
  sub_10000F2DC();
  sub_10000F254((void *)&_mh_execute_header, v0, v1, "%s: requested position %u", v2, v3, v4, v5, 2u);
}

void sub_10003C878()
{
  sub_10000F29C(__stack_chk_guard);
  int v2 = 136315650;
  sub_10000F220();
  sub_10000F270((void *)&_mh_execute_header, v0, v1, "%s: Got connection error for idx %u, error %@", v2);
}

void sub_10003C8EC()
{
  sub_10000F290(__stack_chk_guard);
  sub_10000F240();
  sub_10000F254((void *)&_mh_execute_header, v0, v1, "%s: Unable to find entry for index %u", v2, v3, v4, v5, 2u);
}

void sub_10003C960()
{
  sub_10000F290(__stack_chk_guard);
  sub_10000F240();
  sub_10000F254((void *)&_mh_execute_header, v0, v1, "%s: Unable to get fsobj for idx %u", v2, v3, v4, v5, 2u);
}

void sub_10003C9D4()
{
  sub_10000F2DC();
  sub_10000F254((void *)&_mh_execute_header, v0, v1, "%s: requested position %u", v2, v3, v4, v5, 2u);
}

void sub_10003CA48()
{
  sub_10000F290(__stack_chk_guard);
  sub_10000F240();
  sub_10000F254((void *)&_mh_execute_header, v0, v1, "%s: Unable to find entry for index %u", v2, v3, v4, v5, 2u);
}

void sub_10003CABC()
{
  sub_10000F290(__stack_chk_guard);
  sub_10000F240();
  sub_10000F254((void *)&_mh_execute_header, v0, v1, "%s: Unable to get fsobj for idx %u", v2, v3, v4, v5, 2u);
}

void sub_10003CB30()
{
  sub_10000F29C(__stack_chk_guard);
  int v2 = 136315650;
  sub_10000F220();
  sub_10000F270((void *)&_mh_execute_header, v0, v1, "%s: Got connection error for idx %u, error %@", v2);
}

void sub_10003CBA4()
{
  sub_10000F290(__stack_chk_guard);
  sub_10000F240();
  sub_10000F254((void *)&_mh_execute_header, v0, v1, "%s: Unable to find entry for index %u", v2, v3, v4, v5, 2u);
}

void sub_10003CC18()
{
  sub_10000F290(__stack_chk_guard);
  sub_10000F240();
  sub_10000F254((void *)&_mh_execute_header, v0, v1, "%s: Unable to get fsobj for idx %u", v2, v3, v4, v5, 2u);
}

void sub_10003CC8C()
{
  sub_10000F29C(__stack_chk_guard);
  int v2 = 136315650;
  sub_10000F220();
  sub_10000F270((void *)&_mh_execute_header, v0, v1, "%s: Got connection error for idx %u, error %@", v2);
}

void sub_10003CD00()
{
  sub_10000F290(__stack_chk_guard);
  sub_10000F240();
  sub_10000F254((void *)&_mh_execute_header, v0, v1, "%s: Unable to find entry for index %u", v2, v3, v4, v5, 2u);
}

void sub_10003CD74()
{
  sub_10000F290(__stack_chk_guard);
  sub_10000F240();
  sub_10000F254((void *)&_mh_execute_header, v0, v1, "%s: Unable to get fsobj for idx %u", v2, v3, v4, v5, 2u);
}

void sub_10003CDE8()
{
  sub_10000F29C(__stack_chk_guard);
  int v2 = 136315650;
  sub_10000F220();
  sub_10000F270((void *)&_mh_execute_header, v0, v1, "%s: Got connection error for idx %u, error %@", v2);
}

void sub_10003CE5C()
{
  sub_10000F2A8();
  sub_10000F37C((void *)&_mh_execute_header, v0, v1, "%s: Got error %u (startIO %u flags 0x%x opeId %llu", v2, v3, v4, v5, v6);
}

void sub_10003CED4()
{
  sub_10000F290(__stack_chk_guard);
  sub_10000F240();
  sub_10000F254((void *)&_mh_execute_header, v0, v1, "%s: Unable to find entry for index %u", v2, v3, v4, v5, 2u);
}

void sub_10003CF48()
{
  sub_10000F290(__stack_chk_guard);
  sub_10000F240();
  sub_10000F254((void *)&_mh_execute_header, v0, v1, "%s: Unable to get fsobj for idx %u", v2, v3, v4, v5, 2u);
}

void sub_10003CFBC()
{
  sub_10000F29C(__stack_chk_guard);
  int v2 = 136315650;
  sub_10000F220();
  sub_10000F270((void *)&_mh_execute_header, v0, v1, "%s: Got connection error for idx %u, error %@", v2);
}

void sub_10003D030()
{
  sub_10000F2A8();
  sub_10000F37C((void *)&_mh_execute_header, v0, v1, "%s: Got error %u (ioStatus %u flags 0x%x opeId %llu", v2, v3, v4, v5, v6);
}

void sub_10003D0A8()
{
  sub_10000F29C(__stack_chk_guard);
  int v2 = 136315650;
  sub_10000F220();
  sub_10000F270((void *)&_mh_execute_header, v0, v1, "%s: Got connection error for idx %u, error %@", v2);
}

void sub_10003D11C()
{
  sub_100011BAC();
  sub_10000F2F0((void *)&_mh_execute_header, v0, v1, "unable to get domains: %{public}@", v2, v3, v4, v5, v6);
}

void sub_10003D184(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) identifier];
  sub_100011BB8();
  sub_100011B68();
  _os_log_error_impl(v2, v3, v4, v5, v6, 0x16u);
}

void sub_10003D224(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003D29C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003D314(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003D38C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003D404()
{
  sub_100011B40();
  sub_10000F30C((void *)&_mh_execute_header, v0, v1, "Unable to get own audit token. Exiting", v2, v3, v4, v5, v6);
}

void sub_10003D438()
{
  uint64_t v0 = getprogname();
  errx(1, "Usage: %s [-L] [-p port] [-n no_outstanding_requests] [-t no_threads] [-v]", v0);
}

void sub_10003D460()
{
  sub_100011B40();
  sub_10000F30C((void *)&_mh_execute_header, v0, v1, "Could not allocate mount table", v2, v3, v4, v5, v6);
}

void sub_10003D494()
{
  sub_100011B40();
  sub_10000F30C((void *)&_mh_execute_header, v0, v1, "Unexpected termination of liveFilesMountService", v2, v3, v4, v5, v6);
}

void sub_10003D4C8()
{
  sub_100011B40();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "main:RunLoopRun", v1, 2u);
}

void sub_10003D508()
{
}

void sub_10003D538()
{
}

void sub_10003D568()
{
}

void sub_10003D598(unsigned __int16 a1, NSObject *a2)
{
  int v2 = 138412546;
  uint64_t v3 = off_1000603A8;
  __int16 v4 = 1024;
  int v5 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "main:FPNfsPortStr:%@:FPNfsPort:%d", (uint8_t *)&v2, 0x12u);
}

void sub_10003D628()
{
  v1[0] = 136315394;
  sub_10000F2DC();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "%s: ERROR: sending mach port to kernel: %d", (uint8_t *)v1, 0x12u);
}

void sub_10003D6A8()
{
  v1[0] = 136315394;
  sub_10000F2DC();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "%s: ERROR: mach_port_insert_right failed: %d", (uint8_t *)v1, 0x12u);
}

void sub_10003D728(_DWORD *a1, NSObject *a2)
{
  int v2 = "dead";
  if (!*a1) {
    int v2 = "null";
  }
  int v3 = 136315394;
  __int16 v4 = "main";
  __int16 v5 = 2080;
  uint8_t v6 = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%s: invalid port - %s", (uint8_t *)&v3, 0x16u);
}

void sub_10003D7D0(kern_return_t a1)
{
  bootstrap_strerror(a1);
  sub_100011B68();
  _os_log_error_impl(v1, v2, v3, v4, v5, 0x1Cu);
}

void sub_10003D878()
{
  sub_100011B40();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "main:start", v1, 2u);
}

void sub_10003D8B8(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100011B78((void *)&_mh_execute_header, a2, a3, "ERROR: dispatch_mig_server => %08x", a5, a6, a7, a8, 0);
}

void sub_10003D924(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003D990(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003D9FC()
{
  sub_100011B40();
  sub_10000F30C((void *)&_mh_execute_header, v0, v1, "Could not allocate root file system", v2, v3, v4, v5, v6);
}

void sub_10003DA30()
{
  sub_100011B40();
  sub_10000F30C((void *)&_mh_execute_header, v0, v1, "Could not alloc/init the root mount table entry", v2, v3, v4, v5, v6);
}

void sub_10003DA64()
{
  sub_100011B40();
  sub_10000F30C((void *)&_mh_execute_header, v0, v1, "Could not alloc/init mountServiceDelegate", v2, v3, v4, v5, v6);
}

void sub_10003DA98()
{
  sub_100011B40();
  sub_10000F30C((void *)&_mh_execute_header, v0, v1, "Could not obtain NSXPCListerner serviceListener", v2, v3, v4, v5, v6);
}

void sub_10003DACC()
{
  sub_100011BAC();
  sub_10000F2F0((void *)&_mh_execute_header, v0, v1, "Could not initialize the fskitd's root memory file system. error = %{public}@", v2, v3, v4, v5, v6);
}

void sub_10003DB34()
{
  sub_100011B40();
  sub_10000F30C((void *)&_mh_execute_header, v0, v1, "Could not build LiveFiles mount path", v2, v3, v4, v5, v6);
}

void sub_10003DB68()
{
  sub_100011BAC();
  sub_10000F2F0((void *)&_mh_execute_header, v0, v1, "%{public}@ exist but is not a directory", v2, v3, v4, v5, v6);
}

void sub_10003DBD0(uint64_t a1, NSObject *a2)
{
  __error();
  sub_100011B94();
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "Error making file %{public}@ r/o: %{darwin.errno}d", v3, 0x12u);
}

void sub_10003DC60()
{
  sub_100011B40();
  _os_log_fault_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_FAULT, "Cleanup incomplete after 5 loops. Bailing", v1, 2u);
}

void sub_10003DCA0()
{
  __error();
  sub_100011B94();
  sub_100011B68();
  _os_log_error_impl(v0, v1, v2, v3, v4, 0x12u);
}

void sub_10003DD28()
{
  sub_100011BAC();
  sub_10000F39C((void *)&_mh_execute_header, v0, v1, "Problem enumerating %{public}@, error %@, aborting");
}

void sub_10003DD9C()
{
  sub_100011BB8();
  sub_10000F39C((void *)&_mh_execute_header, v0, v1, "Error creating %{public}@: %{public}@");
}

void sub_10003DE08()
{
  sub_100011B40();
  _os_log_fault_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_FAULT, "Error reconstituting mount point", v1, 2u);
}

void sub_10003DE48(uint64_t *a1, NSObject *a2)
{
  uint64_t v2 = *a1;
  int v3 = 136315394;
  uint64_t v4 = "-[fskitdAgentManager currentExtensionForShortName:auditToken:replyHandler:]_block_invoke_2";
  __int16 v5 = 2112;
  uint64_t v6 = v2;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "%s: Found extension for fsShortName (%@)", (uint8_t *)&v3, 0x16u);
}

void sub_10003DED8(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)long long buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "taskID(%@) not found in our tasks dictionary", buf, 0xCu);
}

void sub_10003DF30(void *a1)
{
  os_log_t v1 = [a1 getResourceID];
  sub_100018BCC();
  sub_100018BE0((void *)&_mh_execute_header, v2, v3, "%s:start:resource:%@", v4, v5, v6, v7, 2u);
}

void sub_10003DFC4(void *a1)
{
  os_log_t v1 = [a1 taskID];
  sub_100018BCC();
  sub_100018C00((void *)&_mh_execute_header, v2, v3, "%s: Unknown task ID (%@) was given, can't find task", v4, v5, v6, v7, 2u);
}

void sub_10003E058(void *a1)
{
  os_log_t v1 = [a1 taskID];
  sub_100018BCC();
  sub_100018BE0((void *)&_mh_execute_header, v2, v3, "%s: Killing the extension instance for task (%@)", v4, v5, v6, v7, 2u);
}

void sub_10003E0EC(void *a1, id *a2, NSObject *a3)
{
  uint64_t v5 = [a1 taskExtensionInstanceID];
  uint64_t v6 = [*a2 instanceID];
  uint64_t v7 = [v6 fs_containerIdentifier];
  int v8 = 136315650;
  unsigned int v9 = "-[fskitdExtensionClient taskStatusUpdate:]";
  __int16 v10 = 2112;
  int v11 = v5;
  __int16 v12 = 2112;
  uint64_t v13 = v7;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "%s: Task extension instance ID (%@) isn't the same as this instance ID (%@)", (uint8_t *)&v8, 0x20u);
}

void sub_10003E1D4(os_log_t log)
{
  int v1 = 136315138;
  uint64_t v2 = "-[fskitdExtensionClient wipeResource:replyHandler:]";
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%s: Given device is not a block device", (uint8_t *)&v1, 0xCu);
}

void sub_10003E258(void *a1)
{
  int v1 = [a1 getResourceID];
  sub_100018BCC();
  sub_100018C00((void *)&_mh_execute_header, v2, v3, "%s: Given resource (%@) is not recognized by resource manager", v4, v5, v6, v7, 2u);
}

void sub_10003E2EC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003E364(void *a1)
{
  int v1 = [a1 getResourceID];
  sub_100018BCC();
  sub_100018C00((void *)&_mh_execute_header, v2, v3, "%s: Given resource (%@) isn't recognized", v4, v5, v6, v7, 2u);
}

void sub_10003E3F8(void *a1)
{
  int v1 = [a1 getResourceID];
  sub_100018BCC();
  sub_100018BE0((void *)&_mh_execute_header, v2, v3, "%s: Checking if given resource (%@) is recognized by our instance", v4, v5, v6, v7, 2u);
}

void sub_10003E48C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003E504(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003E570(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003E5E8()
{
  v1[0] = 136315394;
  sub_100018BCC();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "%s: encountered error while wiping device %@", (uint8_t *)v1, 0x16u);
}

void sub_10003E668(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003E6E0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003E758(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003E7D0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003E848(void *a1)
{
  int v1 = [a1 getResourceID];
  sub_100018BCC();
  sub_100018BE0((void *)&_mh_execute_header, v2, v3, "%s:end:resource(%@)", v4, v5, v6, v7, 2u);
}

void sub_10003E8D8(void *a1)
{
  int v1 = [a1 getResourceID];
  sub_100018BCC();
  sub_100018BE0((void *)&_mh_execute_header, v2, v3, "%s:start:resource(%@)", v4, v5, v6, v7, 2u);
}

void sub_10003E968(void *a1)
{
  int v1 = [a1 getResourceID];
  sub_100018BCC();
  sub_100018BE0((void *)&_mh_execute_header, v2, v3, "%s:end:resource(%@)", v4, v5, v6, v7, 2u);
}

void sub_10003E9F8(void *a1)
{
  int v1 = [a1 getResourceID];
  sub_100018BCC();
  sub_100018BE0((void *)&_mh_execute_header, v2, v3, "%s:start:resource(%@)", v4, v5, v6, v7, 2u);
}

void sub_10003EA88(void *a1, NSObject *a2)
{
  id v3 = [a1 fileSystemRepresentation];
  int v4 = *__error();
  int v5 = 136315394;
  id v6 = v3;
  __int16 v7 = 1024;
  int v8 = v4;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "failed to cleanup parent %s - %{darwin.errno}d", (uint8_t *)&v5, 0x12u);
}

void sub_10003EB30(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "mkMountPath:finish:%@", (uint8_t *)&v2, 0xCu);
}

void sub_10003EBA8(uint64_t a1, uint64_t *a2, os_log_t log)
{
  uint64_t v3 = *a2;
  int v4 = 138543618;
  uint64_t v5 = a1;
  __int16 v6 = 2114;
  uint64_t v7 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "mkMountPath: %{public}@ is not contain in fskitd's root %{public}@", (uint8_t *)&v4, 0x16u);
}

void sub_10003EC34(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Oops!", v1, 2u);
}

void sub_10003EC78(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Oops! ReadDirAndAttrs on %@", (uint8_t *)&v2, 0xCu);
}

void sub_10003ECF0(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "LiveMounterReallyMount: cleanup rm returned %d", (uint8_t *)v2, 8u);
}

void sub_10003ED68()
{
  sub_100011B40();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "Failed to create mount entry!", v1, 2u);
}

void sub_10003EDA8()
{
  sub_10002BD14(__stack_chk_guard);
  sub_10002BD58();
  sub_10000F2F0((void *)&_mh_execute_header, v0, v1, "Failed to actually mount!: %@", v2, v3, v4, v5, v6);
}

void sub_10003EE10()
{
  sub_100011BAC();
  sub_10000F2F0((void *)&_mh_execute_header, v0, v1, "Failed connection back to %@", v2, v3, v4, v5, v6);
}

void sub_10003EE78()
{
  sub_100011BAC();
  __int16 v3 = 1024;
  int v4 = v0;
  _os_log_debug_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEBUG, "ReallyMountVolume:connect mp for volume:%@ how: 0x%08x", v2, 0x12u);
}

void sub_10003EEFC()
{
  sub_100011BAC();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  sub_10002BC74((void *)&_mh_execute_header, v1, (uint64_t)v1, "Created domain for volname %@, displayName %@", v2);
}

void sub_10003EF78()
{
  sub_100011B40();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "ReallyMountVolume:adding:LIVEMOUNTER_MOUNT_DISCONNECTED:flags", v1, 2u);
}

void sub_10003EFB8()
{
  sub_10002BD14(__stack_chk_guard);
  sub_10002BD58();
  sub_10000F2F0((void *)&_mh_execute_header, v0, v1, "Failed to store the mount point in settings file!: %@", v2, v3, v4, v5, v6);
}

void sub_10003F020()
{
  sub_10002BD14(__stack_chk_guard);
  sub_10002BD58();
  sub_10000F2F0((void *)&_mh_execute_header, v0, v1, "Failed to make mount path: %@", v2, v3, v4, v5, v6);
}

void sub_10003F088()
{
  sub_10002BD14(__stack_chk_guard);
  sub_10002BD58();
  sub_10000F2F0((void *)&_mh_execute_header, v0, v1, "failed preflight: %@", v2, v3, v4, v5, v6);
}

void sub_10003F0F0()
{
  sub_100011B40();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "converting EAUTH to Fileprovider error", v1, 2u);
}

void sub_10003F130()
{
  sub_100011BAC();
  sub_10000F2F0((void *)&_mh_execute_header, v0, v1, "addDomain: addDomain returned error: %@", v2, v3, v4, v5, v6);
}

void sub_10003F198()
{
  sub_10002BD58();
  sub_100011B4C((void *)&_mh_execute_header, v0, v1, "CoreSpotlight:registered:%@", v2, v3, v4, v5, v6);
}

void sub_10003F204()
{
  sub_100011BAC();
  sub_100011B4C((void *)&_mh_execute_header, v0, v1, "doKernelMount:fullPath:providerName:async:block:stat:%@", v2, v3, v4, v5, v6);
}

void sub_10003F26C()
{
  sub_100011B40();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "mountVolume rejecting as client isn't entitled", v1, 2u);
}

void sub_10003F2AC(void *a1, uint64_t a2, uint8_t *buf, os_log_t log)
{
  uint64_t v5 = *(void *)(*(void *)a2 + 40);
  *(_DWORD *)long long buf = 138543618;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(void *)(buf + 14) = v5;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Could not unmount %{public}@ error = %{public}@", buf, 0x16u);
}

void sub_10003F31C(void *a1, NSObject *a2)
{
  uint64_t v4 = [a1 bundleIdentifier];
  uint64_t v5 = [a1 attributes];
  int v6 = 136315650;
  uint64_t v7 = "-[fskitdXPCServer getExtensionModuleFromID:forToken:]_block_invoke_2";
  __int16 v8 = 2112;
  unsigned int v9 = v4;
  __int16 v10 = 2112;
  int v11 = v5;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "%s: Found extension %@, attrs %@", (uint8_t *)&v6, 0x20u);
}

void sub_10003F3F0()
{
  v2[0] = 136315394;
  sub_10002BD00();
  sub_10002BC74((void *)&_mh_execute_header, v0, v1, "%s: No bundleID found for fsShortName (%@)", (uint8_t *)v2);
}

void sub_10003F46C()
{
  sub_10002BCD8();
  *uint64_t v1 = 136315394;
  sub_10002BCA8(v2, (uint64_t)v1, (uint64_t)"-[fskitdXPCServer getRealResource:auditToken:reply:]");
  sub_10002BC74((void *)&_mh_execute_header, v3, (uint64_t)v3, "%s: Updating resource in resource manager %@", v4);
}

void sub_10003F4C0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003F538()
{
  sub_10002BCD8();
  *uint64_t v1 = 136315394;
  sub_10002BCA8(v2, (uint64_t)v1, (uint64_t)"-[fskitdXPCServer getRealResource:auditToken:reply:]");
  sub_10002BC74((void *)&_mh_execute_header, v3, (uint64_t)v3, "%s: Recieved resource (%@) is a 'real' resource, returning it.", v4);
}

void sub_10003F58C()
{
  sub_100018BCC();
  sub_10002BCBC((void *)&_mh_execute_header, v0, v1, "%s: Can't find the extension for %@", v2, v3, v4, v5, 2u);
}

void sub_10003F600()
{
  sub_10002BCD8();
  *uint64_t v1 = 136315394;
  sub_10002BCA8(v2, (uint64_t)v1, (uint64_t)"-[fskitdXPCServer applyResource:targetBundle:instanceID:initiatorAuditToken:authorizingAuditToken:isProbe:usingBlock:]");
  _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "%s: Can't get the real resource of %@", v4, 0x16u);
}

void sub_10003F65C(void *a1, uint64_t a2, _DWORD *a3)
{
  *a3 = 136315650;
  sub_10002BC8C((uint64_t)a1, a2, (uint64_t)a3);
  sub_10002BCE4((void *)&_mh_execute_header, "%s: Resource %@ can't be used on extension %@", v4, v5);
}

void sub_10003F6B4(uint64_t a1, uint64_t a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a2 = 138412546;
  *(void *)(a2 + 4) = a1;
  *(_WORD *)(a2 + 12) = 2048;
  *(void *)(a2 + 14) = a3;
  sub_10002BC74((void *)&_mh_execute_header, a4, a3, "applyResource starting with resource %@ kind %ld", (uint8_t *)a2);
}

void sub_10003F704()
{
  sub_10002BCD8();
  *uint64_t v1 = 136315650;
  sub_10002BD24(v2, (uint64_t)v1, v3);
  _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%s:%@: Can't start probe task, resource state is %d", v4, 0x1Cu);
}

void sub_10003F764()
{
  sub_10002BCD8();
  *uint64_t v1 = 136315650;
  sub_10002BD24(v2, (uint64_t)v1, v3);
  _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%s:%@: Can't start new task, resource state is %d", v4, 0x1Cu);
}

void sub_10003F7C4()
{
  sub_10002BD44();
  _DWORD *v2 = 136315650;
  sub_10002BC8C(v3, v4, (uint64_t)v2);
  sub_10002BCE4((void *)&_mh_execute_header, "%s:%@: Resource isn't in loaded/active state, can't start unload task: %@", v5, v6);
}

void sub_10003F818()
{
  sub_10002BCD8();
  *uint64_t v1 = 136315394;
  sub_10002BCA8(v2, (uint64_t)v1, (uint64_t)"-[fskitdXPCServer canStartUnloadTask:resource:]");
  sub_10002BC74((void *)&_mh_execute_header, v3, (uint64_t)v3, "%s:%@: Found the resource to unload", v4);
}

void sub_10003F86C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003F8E4()
{
  v2[0] = 136315394;
  sub_100018BCC();
  sub_10002BC74((void *)&_mh_execute_header, v0, v1, "%s:return:%@", (uint8_t *)v2);
}

void sub_10003F95C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003F9D4(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3 = 136315394;
  uint64_t v4 = "-[fskitdXPCServer getInitiatorSigningIDForToken:]";
  __int16 v5 = 2114;
  uint64_t v6 = a1;
  sub_10002BC74((void *)&_mh_execute_header, a2, a3, "%s: SecTaskCopySigningIdentifier:%{public}@", (uint8_t *)&v3);
}

void sub_10003FA58(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003FAD0()
{
  sub_100018BCC();
  sub_10002BCBC((void *)&_mh_execute_header, v0, v1, "%s: No task ID (%@) found", v2, v3, v4, v5, 2u);
}

void sub_10003FB44(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003FBBC()
{
  sub_100018BCC();
  sub_10002BCBC((void *)&_mh_execute_header, v0, v1, "%s:end:reply:%@", v2, v3, v4, v5, 2u);
}

void sub_10003FC30()
{
  sub_100018BCC();
  sub_10002BCBC((void *)&_mh_execute_header, v0, v1, "%s:start:taskID:%@", v2, v3, v4, v5, 2u);
}

void sub_10003FCA4()
{
  sub_10002BCD8();
  *uint64_t v1 = 136315394;
  sub_10002BCA8(v2, (uint64_t)v1, (uint64_t)"-[fskitdXPCServer canStartActivateTask:resource:]");
  sub_10002BC74((void *)&_mh_execute_header, v3, (uint64_t)v3, "%s:%@: Found the resource to activate", v4);
}

void sub_10003FCF8()
{
  sub_10002BD44();
  _DWORD *v2 = 136315650;
  sub_10002BC8C(v3, v4, (uint64_t)v2);
  sub_10002BCE4((void *)&_mh_execute_header, "%s:%@: Resource isn't in loaded state, can't start activate task: %@", v5, v6);
}

void sub_10003FD4C()
{
  sub_100018BCC();
  sub_10002BCBC((void *)&_mh_execute_header, v0, v1, "%s: No module found with short name ‘%@’", v2, v3, v4, v5, 2u);
}

void sub_10003FDC0()
{
  sub_10002BCD8();
  *uint64_t v1 = 136315394;
  sub_10002BCA8(v2, (uint64_t)v1, (uint64_t)"-[fskitdXPCServer canStartDeactivateTask:resource:]");
  sub_10002BC74((void *)&_mh_execute_header, v3, (uint64_t)v3, "%s:%@: Found the resource to activate", v4);
}

void sub_10003FE14()
{
  sub_10002BD44();
  _DWORD *v2 = 136315650;
  sub_10002BC8C(v3, v4, (uint64_t)v2);
  sub_10002BCE4((void *)&_mh_execute_header, "%s:%@: Resource isn't in active state, can't start deactivate task: %@", v5, v6);
}

void sub_10003FE68()
{
  sub_100018BCC();
  sub_10002BCBC((void *)&_mh_execute_header, v0, v1, "%s: No module found with short name ‘%@’", v2, v3, v4, v5, 2u);
}

void sub_10003FEDC()
{
  sub_100018BCC();
  sub_10002BCBC((void *)&_mh_execute_header, v0, v1, "%s: No module found with short name ‘%@’", v2, v3, v4, v5, 2u);
}

void sub_10003FF50()
{
  sub_100018BCC();
  sub_10002BCBC((void *)&_mh_execute_header, v0, v1, "%s: No module found with short name ‘%@’", v2, v3, v4, v5, 2u);
}

void sub_10003FFC4()
{
  v2[0] = 136315394;
  sub_10002BD00();
  sub_10002BC74((void *)&_mh_execute_header, v0, v1, "%s: Can't activate volume (%@), no resource associated with it found", (uint8_t *)v2);
}

void sub_100040040(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000400B8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100040130(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 getResourceID];
  v5[0] = 136315394;
  sub_100018BCC();
  sub_10002BC74((void *)&_mh_execute_header, a2, v4, "%s: load resource (%@) before doing checkWithOptions", (uint8_t *)v5);
}

void sub_1000401CC()
{
  v2[0] = 136315394;
  sub_10002BD00();
  sub_10002BC74((void *)&_mh_execute_header, v0, v1, "%s: Can't deactivate volume (%@), no resource associated with it found", (uint8_t *)v2);
}

void sub_100040248(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000402C0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100040338(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 getResourceID];
  v5[0] = 136315394;
  sub_100018BCC();
  sub_10002BC74((void *)&_mh_execute_header, a2, v4, "%s: load resource (%@) before doing formatWithOptions", (uint8_t *)v5);
}

void sub_1000403D4(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 volumeID];
  v5[0] = 136315394;
  sub_100018BCC();
  sub_10002BC74((void *)&_mh_execute_header, a2, v4, "%s: Adding volumeID %@ to our instance", (uint8_t *)v5);
}

void sub_10004046C(uint64_t a1, NSObject *a2)
{
  uint64_t v3 = [*(id *)(a1 + 32) getResourceID];
  v5[0] = 136315394;
  sub_100018BCC();
  sub_10002BC74((void *)&_mh_execute_header, a2, v4, "%s: Remove resourceID (%@) from the FSModuleHost.defaultInstanceUUID instance", (uint8_t *)v5);
}

void sub_100040508(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000F2F0((void *)&_mh_execute_header, a2, a3, "addDomain: addDomain returned error: %@", a5, a6, a7, a8, 2u);
}

void sub_100040574(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000F2F0((void *)&_mh_execute_header, a2, a3, "setConnected:completionHandler: returned %@", a5, a6, a7, a8, 2u);
}

void sub_1000405E0(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000F2F0((void *)&_mh_execute_header, a2, a3, "RemoveDomain returned error: %@", a5, a6, a7, a8, 2u);
}

void sub_10004064C(os_log_t log)
{
  int v1 = 136315138;
  uint64_t v2 = "-[LivefsSettings setIdleTimerLocked:]";
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "%s: Dispatched no-mounts timer", (uint8_t *)&v1, 0xCu);
}

void sub_1000406D0(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Starting cleanup", v1, 2u);
}

void sub_100040714(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Skipping boot check cleanup as we didn't get a boot UUID this launch", v1, 2u);
}

void sub_100040758()
{
  sub_100011BAC();
  _os_log_fault_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_FAULT, "Didn't understand providername %@", v1, 0xCu);
}

void sub_1000407CC(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *(void *)(*(void *)a2 + 40);
  int v4 = 136315650;
  uint64_t v5 = "+[LIFSClientConnector getLiveFilesConnectionForProvider:volume:withHandler:]";
  __int16 v6 = 2112;
  uint64_t v7 = a1;
  __int16 v8 = 2112;
  uint64_t v9 = v3;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Got to end of %s, returning conn %@ error %@", (uint8_t *)&v4, 0x20u);
}

void sub_10004086C()
{
  sub_10002BD14(__stack_chk_guard);
  sub_10002BD58();
  sub_10000F2F0((void *)&_mh_execute_header, v0, v1, "No client, error %@", v2, v3, v4, v5, v6);
}

void sub_1000408D4()
{
  sub_10002BD14(__stack_chk_guard);
  sub_10002BD58();
  sub_10000F2F0((void *)&_mh_execute_header, v0, v1, "forgetVolume returned %@", v2, v3, v4, v5, v6);
}

void sub_10004093C()
{
  int v1 = 136315394;
  uint64_t v2 = "-[mountEntry initWithName:fileSystem:displayName:storageName:provider:path:mountID:auditToken:mntTable:]";
  sub_1000349A8();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "%s:bridgeToVolumeConnector:%d", (uint8_t *)&v1, 0x12u);
}

void sub_1000409C4()
{
  sub_10002BD14(__stack_chk_guard);
  sub_10002BD58();
  sub_10000F39C((void *)&_mh_execute_header, v0, v1, "Error %@ in LIGetRootFileHandle for memoryfs mounting at %@");
}

void sub_100040A38()
{
  sub_10002BD58();
  __int16 v2 = 1024;
  int v3 = 670;
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "%s:%d: No bridge to FSVolumeConnector, do old flow", v1, 0x12u);
}

void sub_100040AC8(uint64_t *a1, NSObject *a2)
{
  uint64_t v2 = *a1;
  int v3 = 136315650;
  uint64_t v4 = "-[mountEntry getLiveFilesConnectionForPath:withCompletionHandler:]";
  __int16 v5 = 1024;
  int v6 = 652;
  __int16 v7 = 2112;
  uint64_t v8 = v2;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "%s:%d: Getting FSVolumeConnector endpoint for volumeID (%@)", (uint8_t *)&v3, 0x1Cu);
}

void sub_100040B68(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100040BA0()
{
  sub_100011BAC();
  sub_10000F2F0((void *)&_mh_execute_header, v0, v1, "Could not get file provider connection %{public}@", v2, v3, v4, v5, v6);
}

void sub_100040C08(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100040C88(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000F30C((void *)&_mh_execute_header, a1, a3, "*** Unable to get LIGetRootFileHandle, server returned no error and no filehandle", a5, a6, a7, a8, 0);
}

void sub_100040CC0()
{
  sub_100011BAC();
  sub_10000F2F0((void *)&_mh_execute_header, v0, v1, "Unable to get LIGetRootFileHandle, server returned %@", v2, v3, v4, v5, v6);
}

void sub_100040D28(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Error %d getting LI_FSATTR_FSLOCATION", (uint8_t *)v2, 8u);
}

void sub_100040DA0(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Error %d getting LI_FSATTR_FSTYPENAME", (uint8_t *)v2, 8u);
}

void sub_100040E18(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *long long buf = 0;
  *a2 = 0;
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "mountEntry connect woke while we are still waiting for an answer", buf, 2u);
}

void sub_100040E58(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *long long buf = 0;
  *a2 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "connect called while still building domain", buf, 2u);
}

void sub_100040E98(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100040ED0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100040F48()
{
  sub_100011BAC();
  sub_1000349A8();
  sub_1000349D8((void *)&_mh_execute_header, v0, (uint64_t)v0, "Auto-connect failed with error '%@', mount id %u", v1);
}

void sub_100040FC0(int a1)
{
  strerror(a1);
  sub_100011BAC();
  sub_1000349B8((void *)&_mh_execute_header, v1, v2, "mount launch failed with result \"%{public}s\"[%d]", v3, v4, v5, v6, v7);
}

void sub_100041048()
{
  __error();
  sub_1000349A8();
  sub_1000349B8((void *)&_mh_execute_header, v0, v1, "spawner: waitpid %s: errno=%d\n", v2, v3, v4, v5, 2u);
}

void sub_1000410D4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100041154(uint64_t a1, NSObject *a2)
{
  int v4 = *__error();
  int v5 = 136315650;
  uint64_t v6 = "int get_volume_caps(const char *, uint32_t *, uint32_t *)";
  __int16 v7 = 2080;
  uint64_t v8 = a1;
  __int16 v9 = 1024;
  int v10 = v4;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%s: getattrlist('%s') -> %d", (uint8_t *)&v5, 0x1Cu);
}

void sub_100041208()
{
  v2[0] = 136315394;
  sub_10000F2DC();
  sub_1000349D8((void *)&_mh_execute_header, v0, v1, "spawner: %s: exited with status %d\n", (uint8_t *)v2);
}

void sub_100041280()
{
  int v2 = 136315394;
  uint64_t v3 = "mount_lifs";
  sub_1000349A8();
  sub_1000349D8((void *)&_mh_execute_header, v0, v1, "spawner: %s: terminated by signal %d\n", (uint8_t *)&v2);
}

void sub_100041304()
{
  v2[0] = 136315394;
  sub_10000F2DC();
  sub_1000349D8((void *)&_mh_execute_header, v0, v1, "spawner: posix_spawn %s: error=%d\n", (uint8_t *)v2);
}

void sub_10004137C()
{
  sub_10002BD58();
  sub_10000F39C((void *)&_mh_execute_header, v0, v1, "Could not make mount path for %{public}@ error = %{public}@");
}

void sub_1000413F4(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)long long buf = 136315394;
  *(void *)(buf + 4) = "-[mountEntry removeMountTask]";
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "%s: Removing resource (%@) from mount task", buf, 0x16u);
}

void sub_100041460()
{
  v1[0] = 136315394;
  sub_10002BD00();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "%s: Removing mount task with UUID (%@)", (uint8_t *)v1, 0x16u);
}

void sub_1000414E4(void *a1)
{
  [a1 fileSystemRepresentation];
  __error();
  sub_1000349A8();
  sub_1000349B8((void *)&_mh_execute_header, v1, v2, "failed to cleanup %s - %{darwin.errno}d", v3, v4, v5, v6, 2u);
}

void sub_100041574()
{
  sub_100011BAC();
  sub_10000F2F0((void *)&_mh_execute_header, v0, v1, "isMountAtPath error %@", v2, v3, v4, v5, v6);
}

void sub_1000415DC()
{
  sub_100011BAC();
  sub_10000F39C((void *)&_mh_execute_header, v0, v1, "Unable to disarm triggers on path %@, error %@");
}

void sub_100041650()
{
  sub_10002BD00();
  sub_10002BCBC((void *)&_mh_execute_header, v0, v1, "%s: no extension instance found for this entry (%@)", v2, v3, v4, v5, 2u);
}

void sub_1000416C8()
{
  sub_10002BD14(__stack_chk_guard);
  sub_10002BD00();
  sub_10002BCBC((void *)&_mh_execute_header, v0, v1, "%s: Connecting to extension instance reported error %@", v2, v3, v4, v5, 2u);
}

void sub_10004173C()
{
  sub_10002BD00();
  sub_10002BCBC((void *)&_mh_execute_header, v0, v1, "%s: mount entry (%@) isn't using fskit module", v2, v3, v4, v5, 2u);
}

void sub_1000417B4()
{
  v3[0] = 136315650;
  sub_10002BD00();
  __int16 v4 = v0;
  uint64_t v5 = v1;
  _os_log_error_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_ERROR, "%s: Can't get proxy object, can't forget the module volume (%@) error (%@)", (uint8_t *)v3, 0x20u);
}

void sub_100041848()
{
  __error();
  sub_1000349A8();
  sub_1000349B8((void *)&_mh_execute_header, v0, v1, "Error unmounting %@: %{darwin.errno}d", v2, v3, v4, v5, 2u);
}

void sub_1000418D0(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Killing %@", (uint8_t *)&v2, 0xCu);
}

void sub_100041948(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to create resource assertion", v1, 2u);
}

void sub_10004198C(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to aquire resource assertion", v1, 2u);
}

void sub_1000419D0(os_log_t log)
{
  int v1 = 136315138;
  int v2 = "-[fskitdExtensionInstance terminate]";
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "%s:end", (uint8_t *)&v1, 0xCu);
}

void sub_100041A54(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)long long buf = 136315394;
  *(void *)(buf + 4) = "-[fskitdExtensionInstance terminate]";
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "%s:terminate return error: %@", buf, 0x16u);
}

void sub_100041AC0(int a1, NSObject *a2)
{
  int v2 = 136315394;
  uint64_t v3 = "-[fskitdExtensionInstance terminate]";
  __int16 v4 = 1024;
  int v5 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "%s:start:%d", (uint8_t *)&v2, 0x12u);
}

void sub_100041B4C(void *a1)
{
  int v1 = [a1 getResourceID];
  sub_100018BCC();
  sub_100018BE0((void *)&_mh_execute_header, v2, v3, "%s: revoking resource (%@) because extension is terminated", v4, v5, v6, v7, 2u);
}

void sub_100041BDC(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Error stopping extension instance: %@", (uint8_t *)&v2, 0xCu);
}

void sub_100041C54(void *a1)
{
  int v1 = [a1 getInstancesInfo];
  sub_100018BCC();
  sub_100018BE0((void *)&_mh_execute_header, v2, v3, "%s: Available instances are:\n%@", v4, v5, v6, v7, 2u);
}

void sub_100041CE8()
{
  int v2 = 136315650;
  sub_100037D58();
  sub_100037D74((void *)&_mh_execute_header, v0, v1, "%s: Can't find any instance using bundleID (%@) and volume ID (%@)", v2);
}

void sub_100041D5C()
{
  int v2 = 136315650;
  sub_100037D58();
  sub_100037D74((void *)&_mh_execute_header, v0, v1, "%s:volumeID(%@)bundleID(%@):start", v2);
}

void sub_100041DD0(void *a1)
{
  os_log_t v1 = [a1 getInstancesInfo];
  sub_100018BCC();
  sub_100018BE0((void *)&_mh_execute_header, v2, v3, "%s: Available instances are:\n%@", v4, v5, v6, v7, 2u);
}

void sub_100041E64(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v5 = [a2 getResourceID];
  int v6 = 136315650;
  uint64_t v7 = "-[fskitdExtensionManager existingExtensionForBundle:user:resource:replyHandler:]";
  __int16 v8 = 2112;
  uint64_t v9 = a1;
  __int16 v10 = 2112;
  int v11 = v5;
  _os_log_debug_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_DEBUG, "%s: Can't find any instance using bundleID (%@) and resourceID (%@)", (uint8_t *)&v6, 0x20u);
}

void sub_100041F2C()
{
  int v2 = 136315650;
  sub_100037D58();
  sub_100037D74((void *)&_mh_execute_header, v0, v1, "%s: Found an instance (%@) with our resource (%@)", v2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return _CFNotificationCenterGetDarwinNotifyCenter();
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return _CFPreferencesGetAppBooleanValue(key, applicationID, keyExistsAndHasValidFormat);
}

CFPropertyListRef CFPropertyListCreateDeepCopy(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFOptionFlags mutabilityOption)
{
  return _CFPropertyListCreateDeepCopy(allocator, propertyList, mutabilityOption);
}

void CFRelease(CFTypeRef cf)
{
}

void CFRunLoopRun(void)
{
}

CFTypeID CFStringGetTypeID(void)
{
  return _CFStringGetTypeID();
}

DADiskRef DADiskCreateFromBSDName(CFAllocatorRef allocator, DASessionRef session, const char *name)
{
  return _DADiskCreateFromBSDName(allocator, session, name);
}

uint64_t DADiskProbeWithBlock()
{
  return _DADiskProbeWithBlock();
}

uint64_t DADiskSetFSKitAdditions()
{
  return _DADiskSetFSKitAdditions();
}

DASessionRef DASessionCreate(CFAllocatorRef allocator)
{
  return _DASessionCreate(allocator);
}

void DASessionSetDispatchQueue(DASessionRef session, dispatch_queue_t queue)
{
}

uint64_t MKBDeviceUnlockedSinceBoot()
{
  return _MKBDeviceUnlockedSinceBoot();
}

uint64_t MKBGetDeviceLockState()
{
  return _MKBGetDeviceLockState();
}

CFStringRef SecTaskCopySigningIdentifier(SecTaskRef task, CFErrorRef *error)
{
  return _SecTaskCopySigningIdentifier(task, error);
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return _SecTaskCopyValueForEntitlement(task, entitlement, error);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return _SecTaskCreateWithAuditToken(allocator, token);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
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

uint64_t _os_feature_enabled_impl()
{
  return __os_feature_enabled_impl();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint32_t arc4random(void)
{
  return _arc4random();
}

int asprintf(char **a1, const char *a2, ...)
{
  return _asprintf(a1, a2);
}

const char *__cdecl bootstrap_strerror(kern_return_t r)
{
  return _bootstrap_strerror(r);
}

int chmod(const char *a1, mode_t a2)
{
  return _chmod(a1, a2);
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_data_t dispatch_data_create(const void *buffer, size_t size, dispatch_queue_t queue, dispatch_block_t destructor)
{
  return _dispatch_data_create(buffer, size, queue, destructor);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return _dispatch_group_create();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return _dispatch_group_wait(group, timeout);
}

uint64_t dispatch_mig_server()
{
  return _dispatch_mig_server();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return _dispatch_queue_attr_make_with_autorelease_frequency(attr, frequency);
}

uint64_t dispatch_queue_attr_make_with_overcommit()
{
  return _dispatch_queue_attr_make_with_overcommit();
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return _dispatch_queue_attr_make_with_qos_class(attr, qos_class, relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
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

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

void err(int a1, const char *a2, ...)
{
}

void errx(int a1, const char *a2, ...)
{
}

void exit(int a1)
{
}

void free(void *a1)
{
}

uint64_t fs_errorForPOSIXError()
{
  return _fs_errorForPOSIXError();
}

int fsctl(const char *a1, unint64_t a2, void *a3, unsigned int a4)
{
  return _fsctl(a1, a2, a3, a4);
}

uint64_t fskit_std_log()
{
  return _fskit_std_log();
}

uint64_t getBootUUID()
{
  return _getBootUUID();
}

uint64_t getNSErrorFromLiveFSErrno()
{
  return _getNSErrorFromLiveFSErrno();
}

int getattrlist(const char *a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  return _getattrlist(a1, a2, a3, a4, a5);
}

gid_t getgid(void)
{
  return _getgid();
}

int getmntinfo_r_np(statfs **a1, int a2)
{
  return _getmntinfo_r_np(a1, a2);
}

int getopt(int a1, char *const a2[], const char *a3)
{
  return _getopt(a1, a2, a3);
}

pid_t getpid(void)
{
  return _getpid();
}

const char *getprogname(void)
{
  return _getprogname();
}

uid_t getuid(void)
{
  return _getuid();
}

uint64_t livefs_std_log()
{
  return _livefs_std_log();
}

kern_return_t mach_port_allocate(ipc_space_t task, mach_port_right_t right, mach_port_name_t *name)
{
  return _mach_port_allocate(task, right, name);
}

kern_return_t mach_port_insert_right(ipc_space_t task, mach_port_name_t name, mach_port_t poly, mach_msg_type_name_t polyPoly)
{
  return _mach_port_insert_right(task, name, poly, polyPoly);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return _memchr(__s, __c, __n);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return _memcmp(__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

int mkdir(const char *a1, mode_t a2)
{
  return _mkdir(a1, a2);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

{
}

{
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return [super a2];
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

int objc_sync_enter(id obj)
{
  return _objc_sync_enter(obj);
}

int objc_sync_exit(id obj)
{
  return _objc_sync_exit(obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
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

int rmdir(const char *a1)
{
  return _rmdir(a1);
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return _signal(a1, a2);
}

int sscanf(const char *a1, const char *a2, ...)
{
  return _sscanf(a1, a2);
}

int stat(const char *a1, stat *a2)
{
  return _stat(a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

char *__cdecl strcpy(char *__dst, const char *__src)
{
  return _strcpy(__dst, __src);
}

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return _strlcpy(__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return _strnlen(__s1, __n);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return _strtol(__str, __endptr, __base);
}

unint64_t strtoul(const char *__str, char **__endptr, int __base)
{
  return _strtoul(__str, __endptr, __base);
}

int unmount(const char *a1, int a2)
{
  return _unmount(a1, a2);
}

kern_return_t vm_deallocate(vm_map_t target_task, vm_address_t address, vm_size_t size)
{
  return _vm_deallocate(target_task, address, size);
}

pid_t waitpid(pid_t a1, int *a2, int a3)
{
  return _waitpid(a1, a2, a3);
}

id objc_msgSend_BSDName(void *a1, const char *a2, ...)
{
  return [a1 BSDName];
}

id objc_msgSend_FSAllClientXPCProtocols(void *a1, const char *a2, ...)
{
  return [a1 FSAllClientXPCProtocols];
}

id objc_msgSend_FSClientHostXPCProtocol(void *a1, const char *a2, ...)
{
  return [a1 FSClientHostXPCProtocol];
}

id objc_msgSend_FSClientXPCProtocol(void *a1, const char *a2, ...)
{
  return [a1 FSClientXPCProtocol];
}

id objc_msgSend_FSKitHelperProtocol(void *a1, const char *a2, ...)
{
  return [a1 FSKitHelperProtocol];
}

id objc_msgSend_FSModuleExtensionHostXPCProtocol(void *a1, const char *a2, ...)
{
  return [a1 FSModuleExtensionHostXPCProtocol];
}

id objc_msgSend_FSModuleExtensionXPCProtocol(void *a1, const char *a2, ...)
{
  return [a1 FSModuleExtensionXPCProtocol];
}

id objc_msgSend_FSVolumeXPCProtocol(void *a1, const char *a2, ...)
{
  return [a1 FSVolumeXPCProtocol];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_acquire(void *a1, const char *a2, ...)
{
  return [a1 acquire];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return [a1 allValues];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_atime(void *a1, const char *a2, ...)
{
  return [a1 atime];
}

id objc_msgSend_attributes(void *a1, const char *a2, ...)
{
  return [a1 attributes];
}

id objc_msgSend_auditToken(void *a1, const char *a2, ...)
{
  return [a1 auditToken];
}

id objc_msgSend_availableBytes(void *a1, const char *a2, ...)
{
  return [a1 availableBytes];
}

id objc_msgSend_base64String(void *a1, const char *a2, ...)
{
  return [a1 base64String];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bundleID(void *a1, const char *a2, ...)
{
  return [a1 bundleID];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_cleanupConfigFromLastBoot(void *a1, const char *a2, ...)
{
  return [a1 cleanupConfigFromLastBoot];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_connect(void *a1, const char *a2, ...)
{
  return [a1 connect];
}

id objc_msgSend_connectionWasInterupted(void *a1, const char *a2, ...)
{
  return [a1 connectionWasInterupted];
}

id objc_msgSend_containerID(void *a1, const char *a2, ...)
{
  return [a1 containerID];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentExtensions(void *a1, const char *a2, ...)
{
  return [a1 currentExtensions];
}

id objc_msgSend_currentState(void *a1, const char *a2, ...)
{
  return [a1 currentState];
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return [a1 data];
}

id objc_msgSend_defaultClient(void *a1, const char *a2, ...)
{
  return [a1 defaultClient];
}

id objc_msgSend_defaultInstanceUUID(void *a1, const char *a2, ...)
{
  return [a1 defaultInstanceUUID];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_detachBytes(void *a1, const char *a2, ...)
{
  return [a1 detachBytes];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_displayName(void *a1, const char *a2, ...)
{
  return [a1 displayName];
}

id objc_msgSend_doConnect(void *a1, const char *a2, ...)
{
  return [a1 doConnect];
}

id objc_msgSend_doWait(void *a1, const char *a2, ...)
{
  return [a1 doWait];
}

id objc_msgSend_doWakeAndUnlock(void *a1, const char *a2, ...)
{
  return [a1 doWakeAndUnlock];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_domainError(void *a1, const char *a2, ...)
{
  return [a1 domainError];
}

id objc_msgSend_errorFromStartingProc(void *a1, const char *a2, ...)
{
  return [a1 errorFromStartingProc];
}

id objc_msgSend_exportedClientInterface(void *a1, const char *a2, ...)
{
  return [a1 exportedClientInterface];
}

id objc_msgSend_exportedObject(void *a1, const char *a2, ...)
{
  return [a1 exportedObject];
}

id objc_msgSend_extensionIdentity(void *a1, const char *a2, ...)
{
  return [a1 extensionIdentity];
}

id objc_msgSend_fh(void *a1, const char *a2, ...)
{
  return [a1 fh];
}

id objc_msgSend_fileDescriptor(void *a1, const char *a2, ...)
{
  return [a1 fileDescriptor];
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return [a1 fileSystemRepresentation];
}

id objc_msgSend_fileno(void *a1, const char *a2, ...)
{
  return [a1 fileno];
}

id objc_msgSend_first(void *a1, const char *a2, ...)
{
  return [a1 first];
}

id objc_msgSend_freeBytes(void *a1, const char *a2, ...)
{
  return [a1 freeBytes];
}

id objc_msgSend_freeFiles(void *a1, const char *a2, ...)
{
  return [a1 freeFiles];
}

id objc_msgSend_fs(void *a1, const char *a2, ...)
{
  return [a1 fs];
}

id objc_msgSend_fsFileHandle(void *a1, const char *a2, ...)
{
  return [a1 fsFileHandle];
}

id objc_msgSend_getInstancesInfo(void *a1, const char *a2, ...)
{
  return [a1 getInstancesInfo];
}

id objc_msgSend_getMainDASession(void *a1, const char *a2, ...)
{
  return [a1 getMainDASession];
}

id objc_msgSend_getResourceID(void *a1, const char *a2, ...)
{
  return [a1 getResourceID];
}

id objc_msgSend_getResources(void *a1, const char *a2, ...)
{
  return [a1 getResources];
}

id objc_msgSend_getattr(void *a1, const char *a2, ...)
{
  return [a1 getattr];
}

id objc_msgSend_handleConnectionInterrupted(void *a1, const char *a2, ...)
{
  return [a1 handleConnectionInterrupted];
}

id objc_msgSend_handleConnectionInvalidated(void *a1, const char *a2, ...)
{
  return [a1 handleConnectionInvalidated];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_initFresh(void *a1, const char *a2, ...)
{
  return [a1 initFresh];
}

id objc_msgSend_initiatorAuditToken(void *a1, const char *a2, ...)
{
  return [a1 initiatorAuditToken];
}

id objc_msgSend_instanceAuditToken(void *a1, const char *a2, ...)
{
  return [a1 instanceAuditToken];
}

id objc_msgSend_instanceConfig(void *a1, const char *a2, ...)
{
  return [a1 instanceConfig];
}

id objc_msgSend_instanceID(void *a1, const char *a2, ...)
{
  return [a1 instanceID];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_interfaceForListeners(void *a1, const char *a2, ...)
{
  return [a1 interfaceForListeners];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_isAbsolutePath(void *a1, const char *a2, ...)
{
  return [a1 isAbsolutePath];
}

id objc_msgSend_isEnabled(void *a1, const char *a2, ...)
{
  return [a1 isEnabled];
}

id objc_msgSend_isFSKitModule(void *a1, const char *a2, ...)
{
  return [a1 isFSKitModule];
}

id objc_msgSend_isOurUID(void *a1, const char *a2, ...)
{
  return [a1 isOurUID];
}

id objc_msgSend_isSystem(void *a1, const char *a2, ...)
{
  return [a1 isSystem];
}

id objc_msgSend_isWritable(void *a1, const char *a2, ...)
{
  return [a1 isWritable];
}

id objc_msgSend_keyEnumerator(void *a1, const char *a2, ...)
{
  return [a1 keyEnumerator];
}

id objc_msgSend_kind(void *a1, const char *a2, ...)
{
  return [a1 kind];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_loadModulesAndMonitor(void *a1, const char *a2, ...)
{
  return [a1 loadModulesAndMonitor];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return [a1 localizedDescription];
}

id objc_msgSend_lock(void *a1, const char *a2, ...)
{
  return [a1 lock];
}

id objc_msgSend_longValue(void *a1, const char *a2, ...)
{
  return [a1 longValue];
}

id objc_msgSend_machPort(void *a1, const char *a2, ...)
{
  return [a1 machPort];
}

id objc_msgSend_midx(void *a1, const char *a2, ...)
{
  return [a1 midx];
}

id objc_msgSend_mntOn(void *a1, const char *a2, ...)
{
  return [a1 mntOn];
}

id objc_msgSend_mounts(void *a1, const char *a2, ...)
{
  return [a1 mounts];
}

id objc_msgSend_mtime(void *a1, const char *a2, ...)
{
  return [a1 mtime];
}

id objc_msgSend_mutableBytes(void *a1, const char *a2, ...)
{
  return [a1 mutableBytes];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_nascent(void *a1, const char *a2, ...)
{
  return [a1 nascent];
}

id objc_msgSend_newContainerID(void *a1, const char *a2, ...)
{
  return [a1 newContainerID];
}

id objc_msgSend_nextFileHandle(void *a1, const char *a2, ...)
{
  return [a1 nextFileHandle];
}

id objc_msgSend_nextIndex(void *a1, const char *a2, ...)
{
  return [a1 nextIndex];
}

id objc_msgSend_nextObject(void *a1, const char *a2, ...)
{
  return [a1 nextObject];
}

id objc_msgSend_objectEnumerator(void *a1, const char *a2, ...)
{
  return [a1 objectEnumerator];
}

id objc_msgSend_ourConn(void *a1, const char *a2, ...)
{
  return [a1 ourConn];
}

id objc_msgSend_parent(void *a1, const char *a2, ...)
{
  return [a1 parent];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_pathComponents(void *a1, const char *a2, ...)
{
  return [a1 pathComponents];
}

id objc_msgSend_pid(void *a1, const char *a2, ...)
{
  return [a1 pid];
}

id objc_msgSend_pidversion(void *a1, const char *a2, ...)
{
  return [a1 pidversion];
}

id objc_msgSend_providerID(void *a1, const char *a2, ...)
{
  return [a1 providerID];
}

id objc_msgSend_providerName(void *a1, const char *a2, ...)
{
  return [a1 providerName];
}

id objc_msgSend_remoteObjectProxy(void *a1, const char *a2, ...)
{
  return [a1 remoteObjectProxy];
}

id objc_msgSend_removeMountTask(void *a1, const char *a2, ...)
{
  return [a1 removeMountTask];
}

id objc_msgSend_resetConnectError(void *a1, const char *a2, ...)
{
  return [a1 resetConnectError];
}

id objc_msgSend_resetIndex(void *a1, const char *a2, ...)
{
  return [a1 resetIndex];
}

id objc_msgSend_resourceIDs(void *a1, const char *a2, ...)
{
  return [a1 resourceIDs];
}

id objc_msgSend_resourceManager(void *a1, const char *a2, ...)
{
  return [a1 resourceManager];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_revoke(void *a1, const char *a2, ...)
{
  return [a1 revoke];
}

id objc_msgSend_rootLIFileHandle(void *a1, const char *a2, ...)
{
  return [a1 rootLIFileHandle];
}

id objc_msgSend_rootNode(void *a1, const char *a2, ...)
{
  return [a1 rootNode];
}

id objc_msgSend_ruid(void *a1, const char *a2, ...)
{
  return [a1 ruid];
}

id objc_msgSend_second(void *a1, const char *a2, ...)
{
  return [a1 second];
}

id objc_msgSend_startedWork(void *a1, const char *a2, ...)
{
  return [a1 startedWork];
}

id objc_msgSend_startedWorkLocked(void *a1, const char *a2, ...)
{
  return [a1 startedWorkLocked];
}

id objc_msgSend_stateAsString(void *a1, const char *a2, ...)
{
  return [a1 stateAsString];
}

id objc_msgSend_storageName(void *a1, const char *a2, ...)
{
  return [a1 storageName];
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return [a1 string];
}

id objc_msgSend_stringByStandardizingPath(void *a1, const char *a2, ...)
{
  return [a1 stringByStandardizingPath];
}

id objc_msgSend_strongToWeakObjectsMapTable(void *a1, const char *a2, ...)
{
  return [a1 strongToWeakObjectsMapTable];
}

id objc_msgSend_taskBundleID(void *a1, const char *a2, ...)
{
  return [a1 taskBundleID];
}

id objc_msgSend_taskErrorState(void *a1, const char *a2, ...)
{
  return [a1 taskErrorState];
}

id objc_msgSend_taskExtensionInstanceID(void *a1, const char *a2, ...)
{
  return [a1 taskExtensionInstanceID];
}

id objc_msgSend_taskID(void *a1, const char *a2, ...)
{
  return [a1 taskID];
}

id objc_msgSend_taskInitiatorID(void *a1, const char *a2, ...)
{
  return [a1 taskInitiatorID];
}

id objc_msgSend_taskPurpose(void *a1, const char *a2, ...)
{
  return [a1 taskPurpose];
}

id objc_msgSend_taskReferenceHolder(void *a1, const char *a2, ...)
{
  return [a1 taskReferenceHolder];
}

id objc_msgSend_taskResource(void *a1, const char *a2, ...)
{
  return [a1 taskResource];
}

id objc_msgSend_taskSetChanged(void *a1, const char *a2, ...)
{
  return [a1 taskSetChanged];
}

id objc_msgSend_taskSigningID(void *a1, const char *a2, ...)
{
  return [a1 taskSigningID];
}

id objc_msgSend_taskState(void *a1, const char *a2, ...)
{
  return [a1 taskState];
}

id objc_msgSend_taskUpdateClients(void *a1, const char *a2, ...)
{
  return [a1 taskUpdateClients];
}

id objc_msgSend_tasks(void *a1, const char *a2, ...)
{
  return [a1 tasks];
}

id objc_msgSend_terminate(void *a1, const char *a2, ...)
{
  return [a1 terminate];
}

id objc_msgSend_terminateExtension(void *a1, const char *a2, ...)
{
  return [a1 terminateExtension];
}

id objc_msgSend_terminateExtensionWhenFinished(void *a1, const char *a2, ...)
{
  return [a1 terminateExtensionWhenFinished];
}

id objc_msgSend_third(void *a1, const char *a2, ...)
{
  return [a1 third];
}

id objc_msgSend_timeIntervalSince1970(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSince1970];
}

id objc_msgSend_token(void *a1, const char *a2, ...)
{
  return [a1 token];
}

id objc_msgSend_totalBytes(void *a1, const char *a2, ...)
{
  return [a1 totalBytes];
}

id objc_msgSend_totalFiles(void *a1, const char *a2, ...)
{
  return [a1 totalFiles];
}

id objc_msgSend_uid(void *a1, const char *a2, ...)
{
  return [a1 uid];
}

id objc_msgSend_unlock(void *a1, const char *a2, ...)
{
  return [a1 unlock];
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntValue];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_uuid(void *a1, const char *a2, ...)
{
  return [a1 uuid];
}

id objc_msgSend_verf(void *a1, const char *a2, ...)
{
  return [a1 verf];
}

id objc_msgSend_volumeID(void *a1, const char *a2, ...)
{
  return [a1 volumeID];
}

id objc_msgSend_volumeIDs(void *a1, const char *a2, ...)
{
  return [a1 volumeIDs];
}

id objc_msgSend_volumeName(void *a1, const char *a2, ...)
{
  return [a1 volumeName];
}

id objc_msgSend_weDied(void *a1, const char *a2, ...)
{
  return [a1 weDied];
}

id objc_msgSend_xattrOf_named_requestID_replyHandler_(void *a1, const char *a2, ...)
{
  return [a1 xattrOf:x0 named:x1 requestID:x2 replyHandler:x3];
}