uint64_t isRunningInRecovery()
{
  return 0;
}

uint64_t isRunningInRootLaunchdContext()
{
  return 0;
}

uint64_t isRunningInDiagnosticsMode()
{
  if (qword_100020ED8 != -1) {
    dispatch_once(&qword_100020ED8, &stru_10001C2E8);
  }
  return byte_100020ED0;
}

void sub_1000020EC(id a1)
{
  id v2 = (id)MGCopyAnswer();
  v1 = isNSNumber(v2);

  if (v1) {
    byte_100020ED0 = [v2 BOOLValue];
  }
}

id isNSNumber(void *a1)
{
  id v1 = a1;
  if (v1 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v2 = v1;
  }
  else {
    id v2 = 0;
  }

  return v2;
}

id isNSDictionary(void *a1)
{
  id v1 = a1;
  if (v1 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v2 = v1;
  }
  else {
    id v2 = 0;
  }

  return v2;
}

id isNSString(void *a1)
{
  id v1 = a1;
  if (v1 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v2 = v1;
  }
  else {
    id v2 = 0;
  }

  return v2;
}

id isNSData(void *a1)
{
  id v1 = a1;
  if (v1 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v2 = v1;
  }
  else {
    id v2 = 0;
  }

  return v2;
}

id copy_current_process_name()
{
  return sub_100002314();
}

id sub_100002314()
{
  int v0 = __chkstk_darwin();
  bzero(buffer, 0x1000uLL);
  memset(v8, 0, sizeof(v8));
  if (v0
    && (+[NSXPCConnection currentConnection],
        (id v1 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v2 = v1;
    pid_t v3 = [v1 processIdentifier];
  }
  else
  {
    pid_t v3 = getpid();
  }
  proc_pidpath(v3, buffer, 0x1000u);
  int v4 = strlen(buffer);
  if ((v4 & 0x80000000) == 0)
  {
    do
    {
      if (buffer[v4] == 47) {
        break;
      }
    }
    while (v4-- > 0);
  }
  __strlcpy_chk();
  id v6 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", @"%s", v8);

  return v6;
}

id copy_calling_process_name()
{
  return sub_100002314();
}

void sub_100002C80(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

int main(int argc, const char **argv, const char **envp)
{
  pid_t v3 = objc_opt_new();
  int v4 = +[NSXPCListener serviceListener];
  [v4 setDelegate:v3];
  [v4 resume];

  return 0;
}

id _PVAppIdentityLogSystem()
{
  if (qword_100020EE8 != -1) {
    dispatch_once(&qword_100020EE8, &stru_10001C308);
  }
  int v0 = (void *)qword_100020EE0;

  return v0;
}

void sub_100003828(id a1)
{
  qword_100020EE0 = (uint64_t)os_log_create("com.apple.devicecheck", "pvappidentity");

  _objc_release_x1();
}

uint64_t sub_10000386C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v4 = *(_DWORD *)(a3 + 12);
  if (v4 == 2 || v4 == 6) {
    __asm { BRAA            X0, X17 }
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = -10303;
  return 0;
}

void xf670c98d209342c7f64fcddd68cb14b0(uint64_t a1)
{
  __asm { BRAA            X0, X17 }
}

uint64_t sub_10000426C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30)
{
  int v31 = *(_DWORD *)(v30 - 180);
  uint64_t v32 = *(void *)(v30 - 152);
  uint64_t v33 = *(void *)(v30 - 168);
  int v50 = *(_DWORD *)(v30 - 140);
  *(_DWORD *)(v30 - 200) = (v50 - 2110137103) & 0x3C768ADF;
  *(_DWORD *)(v30 - 212) = v50 - 1095735102;
  *(void *)(v30 - 40) = v33;
  *(_DWORD *)(v30 - 48) = (v50 + v31) ^ (95750717
                                       * ((-2 - ((v30 - 48) | 0x77F639D1) - (~(v30 - 48) | 0x8809C62E)) ^ 0x77D375C1));
  *(void *)(v30 - 208) = v32;
  (*(void (**)(void))(v32 + 8 * (v50 - 1095735030)))();
  int v34 = *(_DWORD *)(v30 - 180);
  uint64_t v35 = *(void *)(v30 - 160);
  uint64_t v36 = *(void *)(v30 - 208);
  *(void *)(v30 - 224) = *(void *)(v30 - 32);
  *(void *)(v30 - 40) = v35;
  *(_DWORD *)(v30 - 48) = (v50 + v34) ^ (95750717
                                       * ((((v30 - 48) | 0x5D601FD2) - (v30 - 48) + ((v30 - 48) & 0xA29FE02D)) ^ 0xA2BAAC3D));
  (*(void (**)(void))(v36 + 8 * (v50 ^ 0x414F99F6)))();
  int v44 = *(_DWORD *)(v30 - 212);
  uint64_t v45 = *(void *)(v30 - 208);
  int v46 = *(_DWORD *)(v30 - 200);
  BOOL v47 = *(void *)(v30 - 32) == 0;
  if (!*(void *)(v30 - 224)) {
    BOOL v47 = 1;
  }
  *(void *)(v30 - 128) = 0;
  v48 = *(uint64_t (**)(void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v45 + 8 * (v44 ^ (!v47 * (v46 + 24))));
  *(_DWORD *)(v30 - 196) = v46;
  return v48(v48, v37, v38, v39, v40, v41, v42, v43, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30);
}

uint64_t sub_10000444C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28)
{
  int v46 = *(_DWORD *)(v28 - 196);
  uint64_t v47 = *(void *)(v28 - 152);
  uint64_t v29 = (*(uint64_t (**)(void))(v47 + 8 * (v46 + 373)))(*(void *)(v28 - 168));
  uint64_t v30 = *(void *)(v28 - 160);
  uint64_t v44 = v29;
  *(void *)(v28 - 120) = v29;
  uint64_t v31 = (*(uint64_t (**)(uint64_t))(v47 + 8 * (v46 + 373)))(v30);
  uint64_t v32 = *(void *)(v28 - 168);
  uint64_t v45 = v31;
  *(void *)(v28 - 112) = v31;
  uint64_t v33 = (*(uint64_t (**)(void, uint64_t, uint64_t))(v47 + 8 * (v46 ^ 0x1F9)))(0, v44, v32);
  *(void *)(v28 - 104) = v33;
  BOOL v41 = v45 > ((v46 + 1095735343) ^ 0x414F9876);
  if (!v33) {
    BOOL v41 = 0;
  }
  *(void *)(v28 - 128) = v33;
  uint64_t v42 = *(uint64_t (**)(void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v47 + 8 * (v46 ^ (!v41 * (((v46 + 26) | 0x90) ^ 0xFE))));
  return v42(v42, v34, v35, v36, v37, v38, v39, v40, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28);
}

uint64_t sub_10000455C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,int a37)
{
  uint64_t v50 = *(void *)(v37 - 152);
  uint64_t v38 = (*(uint64_t (**)(void))(v50 + 8 * (a37 + 188)))(*(void *)(v37 - 104));
  uint64_t v39 = *(void *)(v37 - 160);
  *(void *)(v37 - 96) = v38;
  *(void *)(v37 - 88) = (*(uint64_t (**)(uint64_t))(v50 + 8 * (a37 ^ 0x141)))(v39);
  BOOL v40 = *(void *)(v37 - 120) > ((a37 + 1095735173) ^ 0x414F9876);
  *(void *)(v37 - 136) = 0;
  *(void *)(v37 - 128) = *(void *)(v37 - 104);
  BOOL v41 = *(uint64_t (**)(void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v50 + 8 * ((501 * v40) ^ a37));
  return v41(v41, v42, v43, v44, v45, v46, v47, v48, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22);
}

uint64_t sub_10000460C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,int a30,int a31)
{
  uint64_t v32 = *(void *)(v31 - 152);
  uint64_t v33 = *(void *)(v31 - 136);
  *(unsigned char *)(*(void *)(v31 - 96) + v33) ^= *(unsigned char *)(*(void *)(v31 - 88) + v33 % *(void *)(v31 - 112));
  uint64_t v34 = v33 + ((a31 + 1808784013) & 0xD57FBCF7) - 1095735413;
  LOBYTE(v33) = v34 != *(void *)(v31 - 120);
  *(void *)(v31 - 136) = v34;
  *(void *)(v31 - 128) = *(void *)(v31 - 104);
  uint64_t v35 = *(uint64_t (**)(void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v32 + 8 * (int)((501 * (v33 & 1)) ^ a31));
  return v35(v35, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19, a20, a21, a22);
}

void sub_1000046A8()
{
  *(void *)(*(void *)(v0 - 192) + 8) = *(void *)(v0 - 128);
}

void sub_100004B44(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v4 = (void *)((char *)*(&off_10001D380
                          + (byte_10001AFF0[byte_10001AEF0[(47
                                                                                            * (qword_100020E98 ^ qword_100020EC8 ^ 0xE7))] ^ 0x3D] ^ (47 * (qword_100020E98 ^ qword_100020EC8 ^ 0xE7)))
                          - 131)
                - 3);
  v5 = (void *)((char *)*(&off_10001D380
                          + (byte_10001AFF0[byte_10001AEF0[(47
                                                                                            * (qword_100020E98 ^ *v4 ^ 0xE7))] ^ 0x83] ^ (47 * (qword_100020E98 ^ *v4 ^ 0xE7)))
                          + 15)
                - 7);
  uint64_t v6 = *v5 - *v4 - (void)&v10;
  *int v4 = 831087919 * v6 + 0x697FFA56AACEE319;
  void *v5 = 831087919 * (v6 ^ 0x968005A955311CE7);
  unint64_t v7 = atomic_load((unint64_t *)(a3 + 40));
  LOBYTE(v5) = 47 * ((*v5 + *v4) ^ 0xE7);
  v9 = (char *)*(&off_10001D380
               + (byte_10001AFF0[byte_10001AEF0[(47
                                                                                 * ((qword_100020E98 - qword_100020EC8) ^ 0xE7))] ^ 0x3D] ^ (47 * ((qword_100020E98 - qword_100020EC8) ^ 0xE7)))
               - 124)
     - 2;
  uint64_t v8 = *(void *)&v9[8
                    * ((52
                      * ((*(uint64_t (**)(unint64_t, uint64_t))&v9[8
                                                                                 * (byte_10001AFF0[byte_10001AEF0[v5] ^ 0x3D] ^ v5)
                                                                                 + 2104])(v7, a1) == 0)) ^ 0xDC)];
  __asm { BRAA            X0, X17 }
}

uint64_t sub_100004DC8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32)
{
  int v42 = *(_DWORD *)(v32 - 196);
  uint64_t v43 = *(void *)(v32 - 216);
  *(void *)(v32 - 192) = *(void *)(v43 + 8 * v42);
  *(void *)(v32 - 184) = a32;
  *(_DWORD *)(v32 - 48) = v42
                        - 667133525
                        - 1546437751 * ((2 * ((v32 - 48) & 0x55D1F8E1) - 1439824098 - (v32 - 48)) ^ 0x9D85EF32);
  *(void *)(v32 - 40) = v32 - 192;
  (*(void (**)(void))(v43 + 8 * (v42 + 410)))();
  uint64_t v33 = *(uint64_t (**)(void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v43 + 8 * (int)((v42 + 182) ^ ((*(unsigned char *)(v32 - 44) & 1) * ((7 * ((v42 + 2004398036) & 0xBDFF5FD3 ^ 0x35780FC3)) ^ 0x1D))));
  return v33(v33, v34, v35, v36, v37, v38, v39, v40, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23);
}

uint64_t sub_100004EE0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,int a31,int a32,uint64_t a33,uint64_t a34)
{
  uint64_t v35 = *(void *)(v34 - 216);
  *(_DWORD *)(v34 - 48) = (a32 + 81) ^ (95750717
                                      * ((-2 - ((v34 - 48) | 0xE1FBDD16) - (~(v34 - 48) | 0x1E0422E9)) ^ 0xE1DE9106));
  *(void *)(v34 - 40) = a34;
  uint64_t v46 = v35;
  (*(void (**)(void))(v35 + 8 * (a32 + 370)))();
  uint64_t v45 = *(void *)(v34 - 32);
  *(void *)(v34 - 48) = a34;
  *(_DWORD *)(v34 - 32) = a32
                        + 112
                        - 491357047
                        * ((((v34 - 48) | 0x94C2D1C2) - (v34 - 48) + ((v34 - 48) & 0x6B3D2E3D)) ^ 0x89DA43AA);
  (*(void (**)(void))(v46 + 8 * (a32 ^ 0x1EF)))();
  uint64_t v36 = *(uint64_t (**)(void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v46 + 8 * (a32 ^ ((v45 != 0) * (((a32 ^ 0xE) + 180) ^ 0xE6))));
  return v36(v36, v37, v38, v39, v40, v41, v42, v43, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19, a20);
}

uint64_t sub_100005080()
{
  int v1 = v13;
  int v2 = v12;
  uint64_t v3 = v9;
  uint64_t v4 = v11;
  uint64_t v5 = *(void *)(v0 - 216);
  int v6 = v10;
  unint64_t v7 = atomic_load(*(unint64_t **)(v0 - 224));
  *(void *)(v0 - 152) = *(void *)(v5 + 8 * v6);
  *(void *)(v0 - 144) = v7;
  *(void *)(v0 - 136) = v4;
  *(void *)(v0 - 128) = v3;
  *(_DWORD *)(v0 - 48) = v6 + v2 + 446615023 * ((v0 - 48 + v1 - 2 * (v1 & (v0 - 48))) ^ 0xBF066D1F);
  *(void *)(v0 - 40) = v0 - 152;
  return (*(uint64_t (**)(void))(v5 + 8 * (v6 + 433)))();
}

uint64_t x803d0eda3a7a2958f40d334c1bee4d3f(uint64_t a1)
{
  int v1 = *(_DWORD *)a1 + 900777529 * ((-1 - (a1 | 0x6367F922) + (a1 & 0x6367F922)) ^ 0xEA4A0B94);
  uint64_t v122 = *(void *)(a1 + 8);
  unsigned int v124 = (v1 - 1042381784) | 0x88424908;
  uint64_t v254 = v122;
  unsigned int v253 = (v1 - 1312390715) ^ (95750717
                            * ((&vars0 + 1070273037 - 2 * ((&vars0 - 80) & 0x3FCB125D)) ^ 0xC011A1B2));
  v123 = (char *)*(&off_10001D380 + v1 - 1312390759) - 2;
  uint64_t result = (*(uint64_t (**)(void))&v123[8 * (v1 ^ 0x4E397F1A)])();
  uint64_t v125 = 0;
  if (!v255) {
    goto LABEL_45;
  }
  uint64_t v117 = (*(uint64_t (**)(uint64_t))&v123[8 * (v124 + 1738913254)])(v122);
  int v3 = (*(uint64_t (**)(uint64_t))&v123[8 * (v124 + 1738913266)])(v122);
  uint64_t result = 0;
  unsigned int v118 = ((((v3 + 938825205 - ((2 * v3) & 0x6FEAABEA)) ^ ((v124 + 1842724934) | 0x4809728A) ^ 0xA7686890)
         + ((v124 + 1708646932) & 0xE3FFDF2F)
         + 880598248) ^ (((v3 + 938825205 - ((2 * v3) & 0x6FEAABEA)) ^ 0xF8B646F4) + 122272012) ^ (((v3 + 938825205 - ((2 * v3) & 0x6FEAABEA)) ^ 0x2612050B)
                                                                                                 - 638715147))
       - 1734222997;
  unsigned int v119 = (v124 + 1708646932) & 0xE3FFDF2F;
  int v120 = 0;
  uint64_t v125 = 0;
  if (!v117) {
    goto LABEL_45;
  }
  do
  {
    v191[(unsigned __int16)(67 * v120) % 0x44u] = 0;
    *(_DWORD *)&v126[4 * ((unsigned __int16)(35 * v120) % 0x8Au) + 64] = 0;
    int v120 = ((((v120 ^ 0xB8) + 1 + (v120 | v119 ^ 0x49)) | v120 & 0xB8 ^ 8) ^ 9) + ((2 * v120) & 2);
    int v42 = v119 ^ 0x5C8C048;
  }
  while ((v120 & 0xC0) == 0);
  unsigned int v31 = (v118 ^ 0x9E137A22) & (2 * (v118 & 0x9F537A8A)) ^ v118 & 0x9F537A8A;
  unsigned int v32 = (((v118 ^ 0xBCB3EE22) << ((v42 + 52) ^ 0x7B)) ^ 0x47C12950) & (v118 ^ 0xBCB3EE22) ^ ((v118 ^ 0xBCB3EE22) << ((v42 + 52) ^ 0x7B)) & 0x23E094A8;
  int v33 = (v32 ^ 0x3C00000) & (4 * v31) ^ v31;
  unsigned int v34 = ((4 * (v32 ^ 0x202094A8)) ^ 0x8F8252A0) & (v32 ^ 0x202094A8) ^ (4 * (v32 ^ 0x202094A8)) & 0x23E094A8;
  int v35 = v34 ^ 0x20608408;
  int v36 = (v34 ^ 0x38010A0) & (16 * v33) ^ v33;
  int v37 = ((16 * v35) ^ 0x3E094A80) & v35 ^ (16 * v35) & 0x23E094A0;
  int v38 = v36 ^ (v37 ^ 0x22000000) & (v36 << 8) ^ 0x23E094A8;
  int v49 = v42 - 987446220;
  int v50 = -1306255046;
  unsigned int v51 = (16
       * ((v38 << 16) & 0x3E00000 ^ ((v38 << 16) ^ 0x4A80000) & (((v37 ^ 0x1E09428) << 8) & 0x23E00000 ^ (((v37 ^ 0x1E09428) << 8) ^ 0xE0940000) & (v37 ^ 0x1E09428) ^ 0x3600000) ^ v38)) ^ (8 * v118) ^ 0xCE929ED0;
  int v52 = -1062240790;
  unsigned int v53 = 0;
  unint64_t v54 = 0xC530979C2EFBCDEDLL;
  unint64_t v55 = 0x955742DFEAA12A70;
  unint64_t v56 = 0xA5C0AD593675CE62;
  int v57 = 0;
  unsigned int v58 = ((((v3 + 938825205 - ((2 * v3) & 0x6FEAABEA)) ^ ((v124 + 1842724934) | 0x4809728A) ^ 0xA7686890)
        + ((v124 + 1708646932) & 0xE3FFDF2F)
        + 880598248) ^ (((v3 + 938825205 - ((2 * v3) & 0x6FEAABEA)) ^ 0xF8B646F4) + 122272012) ^ (((v3
                                                                                                  + 938825205
                                                                                                  - ((2 * v3) & 0x6FEAABEA)) ^ 0x2612050B)
                                                                                                - 638715147))
      - 1734222997;
LABEL_37:
  int v82 = (v49 + 1272916611) & 0x67F7F6FE;
  unsigned int v83 = v53;
  unsigned __int8 v84 = 0;
  if (v58 + (v82 ^ (v49 + 1384527676)) < 0xFFFFFFC0)
  {
    do
    {
      unsigned int v81 = v83 + ((v82 - 314389602) ^ 0x4E397E9B);
      v191[(unsigned __int16)(67 * v84) % 0x44u] = *(unsigned char *)(v117 + v83);
      unsigned int v83 = v81;
      ++v84;
    }
    while ((v84 & 0xC0) == 0);
    int v112 = v82 - 314389602;
    unsigned int v113 = v51;
    unsigned int v114 = v81;
    int v115 = v57;
    unsigned int v116 = v58 - 64;
    goto LABEL_25;
  }
  if (v58 + ((v49 + 1948417710) | 0x84804) - 351860580 == 1828578878)
  {
    v191[(67 * v58 + 30) % ((((v49 - 82) | 4) ^ 0xB6) - 86)] = 0x80;
    int v108 = ((v49 + 1948417710) | 0x84804) ^ 0x6F7326B6;
    unsigned int v109 = v53;
LABEL_9:
    unsigned int v110 = v58;
    do
    {
      int v4 = (v108 - 1950255523) & 0x6F553F4F;
      v191[((v110 + 1) * (v4 ^ 0x49503404) - 1294396898) % 0x44] = 0;
      BOOL v5 = v110 - 1621919156 < 0xFFFFFFC0;
      char v111 = (v108 + 93) & 0x4F;
      ++v110;
    }
    while (!v5);
    int v112 = (v4 - 18289605) | 0x6005E18;
    unsigned int v113 = v51;
    unsigned int v114 = v109;
    int v115 = 2;
    unsigned int v116 = v58;
    if (v58 - 1621919094 < v112 + (((v4 - 659565579) | 0x48C80383) ^ 0xDB0E8A21))
    {
      __int16 v192 = v51;
      LOBYTE(v193) = BYTE2(v51);
      HIBYTE(v193) = (HIWORD(v51) >> (BYTE2(v51) & 8)) >> (BYTE2(v51) & 8 ^ (((v111 - 11) & 0x58 | 0x82)
                                                                                         + 110));
      int v112 = (((v4 - 659565579) | 0x48C80383) - 1821150464) & 0x4FFDFFDA;
      unsigned int v113 = (HIWORD(v51) >> (BYTE2(v51) & 8)) >> (BYTE2(v51) & 8 ^ (((v111 - 11) & 0x58 | 0x82) + 110));
      unsigned int v114 = v109;
      int v115 = 1;
      unsigned int v116 = v58;
    }
    goto LABEL_25;
  }
  unsigned int v40 = v58 + ((v49 - 39409877) ^ 0x3595422C);
  if (v40 >= 0x930219C1) {
    unsigned int v40 = -1828578879;
  }
  int v105 = 0;
  unsigned int v106 = v53;
  do
  {
    unsigned int v107 = v106 + 1;
    v191[67 * v105 % 0x44u] = *(unsigned char *)(v117 + v106);
    v105 += v49 + 1390440071;
    ++v106;
  }
  while (v105 != v40 + 1);
  v191[(67 * v58 + ((v49 + 832564868) & 0x6F79FE9B) + 1688179588) % 0x44] = 0x80;
  int v108 = v49 - 1592136416;
  unsigned int v109 = v107;
  int v112 = (v49 + 832564868) & 0x6F79FE9B;
  unsigned int v113 = v51;
  unsigned int v114 = v107;
  int v115 = 2;
  unsigned int v116 = v58;
  if (v58 - 1621919157 >= 0xFFFFFFC0) {
    goto LABEL_9;
  }
LABEL_25:
  int v73 = (v112 - 1350442267) & 0x7F7DBEFF;
  int v74 = v50;
  unsigned int v75 = v113;
  int v76 = v52;
  unint64_t v77 = v54;
  unint64_t v78 = v55;
  unint64_t v79 = v56;
  int v80 = v115;
  while (1)
  {
    int v85 = HIDWORD(v79);
    int v88 = v79;
    unint64_t v86 = v78;
    int v89 = HIDWORD(v77);
    int v87 = v76;
    unsigned int v47 = v75;
    int v43 = v73 + 1228077155;
    int v44 = 0;
    do
    {
      *(_DWORD *)&v126[4 * (v44 * ((v43 ^ 0x890C12D6) - 1331694097) % 0x8A) + 64] = (((v191[(268 * v44 + 67) % 0x44u] << 8) | (v191[268 * v44 % 0x44u] << 16) | v191[(268 * v44 + 134) % 0x44u]) << ((4 * v44) & 8) << ((4 * v44) & 8 ^ 8)) ^ v191[(268 * v44 + 201) % 0x44u];
      BOOL v39 = v44 == 15;
      unsigned int v104 = v43 ^ 0x890C12D6;
      unsigned int v103 = 2079948095;
      ++v44;
    }
    while (!v39);
    while (1)
    {
      int v6 = 35 * v103;
      unsigned int v7 = 35 * v103 + 216261197;
      unsigned int v8 = (v103 - 2079948094) * ((v104 - 541298908) ^ 0x2F1C797B);
      unsigned int v9 = v8 % (v104 - 1331693856);
      unsigned int v10 = v8 % 0x8A;
      unsigned int v11 = v7 % 0x114;
      if (v9 >= 0x8A) {
        v9 -= 138;
      }
      unsigned int v12 = *(_DWORD *)&v126[4 * v10 + 64];
      unsigned int v13 = (*(_DWORD *)&v126[4 * v9 + 64] >> 18) | (v12 << 14);
      int v14 = (v12 >> 7) | (v12 << 25);
      unsigned int v15 = *(_DWORD *)&v126[4 * (v7 % 0x8A) + 64];
      if (v11 >= 0x8A) {
        v11 -= 138;
      }
      unsigned int v16 = (v12 << 22) & 0xFE000000 | (v12 >> 10);
      int v17 = (v12 & 0x80000) != 0 ? -512 : 512;
      unsigned int v18 = ((v13 >> 7) | (v13 << 25)) ^ (v16 + v17) ^ 0x714E40C1;
      unsigned int v19 = (v6 + 216261022) % 0x8Au;
      unsigned int v20 = (v6 + 216260707) % 0x8Au;
      unsigned int v21 = (v14 ^ (v18 >> 25) ^ (((((v18 << 7) ^ 0x58DE9F47) - 1490984775) ^ (-128 * v18) ^ (v18 << 7)) - 1490984776))
          + ((*(_DWORD *)&v126[4 * ((((2 * (v6 + 216261162)) & 0x46) + ((v6 + 216261162) ^ 0x23u)) % 0x8A) + 64] >> ((v103 - 62) & 0xA) >> ((v103 - 62) & 0xA ^ 0xA)) ^ ((v15 >> 17) | (*(_DWORD *)&v126[4 * v11 + 64] << 15)) ^ (((((2 * (v15 - 525514482)) & 0x3EA56DE4) + ((v15 - 525514482) ^ 0x1F52B6F0)) >> 19) | (v15 << 13)));
      v22 = (unsigned int *)&v126[4 * ((v6 + 216261267) % 0x8Au) + 64];
      unsigned int *v22 = v21;
      unsigned int v23 = v21 + *(_DWORD *)&v126[4 * v19 + 64];
      unsigned int *v22 = v23;
      unsigned int *v22 = v23 + *(_DWORD *)&v126[4 * v20 + 64];
      if (v103 - 2079948078 >= 0x40) {
        break;
      }
      unsigned int v103 = (((v103 - 2079948078) << (v43 ^ 0xE3)) & 0xF7F2FA5E) + ((v103 - 2079948078) ^ 0x7BF97D2F);
    }
    int v90 = v78 + 887271227;
    int v162 = -1659577931;
    int v159 = -1922208696;
    int v91 = v76 + 2076145032;
    int v143 = 1589663567;
    int v127 = 99353436;
    int v166 = -237127426;
    int v177 = 1080536437;
    int v128 = -950892916;
    int v130 = -573433557;
    int v178 = -1206768034;
    int v129 = 1900193146;
    int v144 = 1435298322;
    int v131 = 1078118787;
    int v176 = -1368020389;
    int v179 = 737658237;
    int v160 = 1982282152;
    int v133 = -611342466;
    int v161 = 783909560;
    int v147 = 13734264;
    int v93 = HIDWORD(v77) - 1948402973;
    int v181 = -868659329;
    int v163 = 200568637;
    int v150 = -485084246;
    int v164 = 1722461281;
    int v145 = -197275057;
    int v167 = 1246841071;
    int v180 = 2028392851;
    int v148 = 1243567142;
    int v146 = -1896577749;
    int v155 = 903538893;
    int v151 = 1139618364;
    int v183 = 1768068531;
    int v149 = -1267435255;
    int v134 = 811553054;
    int v165 = -999821788;
    int v182 = 587238152;
    int v135 = 1869493450;
    int v152 = -2126472437;
    int v168 = -1834995086;
    int v184 = -1644629787;
    int v132 = -1825591151;
    int v136 = -1364700100;
    int v186 = 272915772;
    int v175 = -772332666;
    int v154 = -305590320;
    int v185 = -561925337;
    int v139 = 1357309036;
    int v187 = 1132371715;
    int v169 = -1001353726;
    int v137 = -475891366;
    int v156 = 1431450730;
    int v170 = -221303333;
    int v153 = -1091170216;
    int v142 = -492330839;
    int v138 = 748734503;
    int v140 = -2073782358;
    int v158 = -1393219663;
    int v172 = 1796133377;
    int v171 = 980259775;
    int v188 = 2010313222;
    int v141 = -1459803713;
    int v174 = -1064921950;
    int v173 = -1797551322;
    int v189 = -1593925685;
    int v157 = -1866093915;
    int v190 = -617624658;
    unsigned int v94 = HIDWORD(v77) - 1948402973;
    int v95 = HIDWORD(v78) - 964064710;
    int v96 = v77 + 1985226573;
    int v97 = v76 + 2076145032;
    unsigned int v98 = v74 + ((v104 + 1853720479) & 0x67FFFEAC) - 1844955987;
    int v99 = HIDWORD(v79) - 180045005;
    int v100 = v78 + 887271227;
    int v101 = 0;
    int v102 = v79 - 2064523229;
    do
    {
      int v24 = v99;
      unsigned int v25 = v98;
      unsigned int v26 = v94;
      int v65 = v102;
      int v66 = v100;
      int v67 = v99;
      unsigned int v68 = v98;
      int v69 = v97;
      unsigned int v70 = v94;
      int v27 = *(_DWORD *)&v126[4
                           * ((unsigned __int16)(35 * v101 + 2380)
                            % (unsigned __int16)((((v104 - 30817) & 0xFEAC) + 20279) & 0x73ED ^ 0x532F))
                           + 64]
          - 473311159;
      int v28 = *(_DWORD *)&v126[4 * ((unsigned __int16)(35 * v101) % 0x8Au) + 64]
          + (((v94 >> 11) | (v94 << 21)) ^ ((v94 >> 6) | (v94 << 26)) ^ ((v94 >> 25) | (v94 << 7)))
          + (v27 ^ (((v100 ^ v99) & v94 ^ v100) + v95))
          + 2 * ((((v100 ^ v99) & v94 ^ v100) + v95) & v27);
      int v29 = (((v98 >> 22) | (v98 << 10)) ^ (v98 >> 13) ^ (((((v98 >> 2) | (v98 << 30))
                                                          - (((v98 >> 2) | (v98 << 30)) ^ (v98 << 19))) ^ (-524288 * v98) ^ (v98 << 19))
                                                        + ((v98 >> 2) | (v98 << 30))))
          + ((v102 ^ v97) & v98 ^ v102 & v97)
          + v28;
      unsigned int v30 = v28 + v96;
      int v71 = v28 + v96;
      LOBYTE(v28) = v101 != 63;
      unsigned int v94 = v30;
      int v95 = v100;
      int v96 = v97;
      int v97 = v102;
      unsigned int v98 = v29;
      int v99 = v26;
      int v100 = v24;
      ++v101;
      int v102 = v25;
      int v72 = (((v104 + 1853720479) & 0x67FFFEAC) - 1172287689) & 0x346A73ED;
    }
    while ((v28 & 1) != 0);
    unsigned int v59 = v70 + HIDWORD(v79);
    int v60 = v66 + HIDWORD(v78);
    unsigned int v92 = v74 + ((v104 + 1853720479) & 0x67FFFEAC) - 1844955987;
    int v61 = (v29 ^ v92) + 2 * (v29 & v92);
    int v62 = ((2 * (v79 + 165920838 + v68)) & 0xEC387F74) + ((v79 + 165920838 + v68) ^ 0xF61C3FBA);
    int v63 = ((2 * (v69 + v77)) & 0xBB280ADC) + ((v69 + v77) ^ 0xDD94056E);
    int v64 = (v72 + 198946533) | 0xBAA1451;
    if (v80 == (((((((v104 - 97) & 0xAC) + 55) & 0xED) - 27) | 0x51) ^ 0xDA)) {
      break;
    }
    unsigned int v48 = (v64 + 1690945550) & 0xEFDFF7B7;
    int v49 = v64 - 2127463777;
    int v50 = v61 + 1209678547;
    unsigned int v51 = v75;
    int v52 = v65 + v76;
    unsigned int v53 = v114;
    LODWORD(v54) = v63 + (v48 ^ 0xA2FC2C33);
    HIDWORD(v54) = v71 + HIDWORD(v77);
    LODWORD(v55) = v67 + v78;
    HIDWORD(v55) = v66 + HIDWORD(v78);
    LODWORD(v56) = ((2 * (v79 + 165920838 + v68)) & 0xEC387F74) + ((v79 + 165920838 + v68) ^ 0xF61C3FBA);
    HIDWORD(v56) = v70 + HIDWORD(v79);
    int v57 = v80;
    unsigned int v58 = v116;
    if (v80 != 2) {
      goto LABEL_37;
    }
    LOBYTE(v192) = v75;
    __int16 v193 = HIWORD(v75);
    HIBYTE(v192) = v75 >> ((v48 ^ 0x2C) + 123);
    unsigned int v45 = v48 ^ 0xFB53342C;
    unsigned __int8 v46 = 0;
    do
    {
      v191[(unsigned __int16)(67 * v46) % 0x44u] = 0;
      int v73 = v45 + 24395250;
      int v74 = v61 + 1209678547;
      unsigned int v75 = HIBYTE(v47);
      int v76 = v65 + v87;
      LODWORD(v77) = v63 + ((v64 + 1690945550) & 0xEFDFF7B7 ^ 0xA2FC2C33);
      HIDWORD(v77) = v71 + v89;
      LODWORD(v78) = v67 + v86;
      HIDWORD(v78) = v66 + HIDWORD(v86);
      LODWORD(v79) = ((2 * (v88 + 165920838 + v68)) & 0xEC387F74) + ((v88 + 165920838 + v68) ^ 0xF61C3FBA);
      HIDWORD(v79) = v70 + v85;
      int v80 = 1;
      ++v46;
    }
    while ((v46 & 0xFCu) < v45 - 2076500561);
  }
  v191[0] = 0;
  char v245 = 0;
  char v251 = 0;
  char v250 = 0;
  char v237 = 0;
  char v247 = 0;
  char v234 = 0;
  char v252 = 0;
  char v236 = 0;
  char v244 = 0;
  char v248 = 0;
  char v249 = 0;
  char v230 = 0;
  char v229 = 0;
  char v240 = 0;
  char v221 = 0;
  char v243 = 0;
  char v228 = 0;
  char v246 = 0;
  char v233 = 0;
  char v239 = 0;
  char v223 = 0;
  char v222 = 0;
  char v224 = 0;
  char v238 = 0;
  char v232 = 0;
  char v204 = 0;
  char v219 = 0;
  char v241 = 0;
  char v231 = 0;
  char v242 = 0;
  char v216 = 0;
  char v200 = 0;
  char v194 = 0;
  char v209 = 0;
  char v227 = 0;
  char v207 = 0;
  char v218 = 0;
  char v235 = 0;
  char v214 = 0;
  char v225 = 0;
  char v215 = 0;
  char v217 = 0;
  char v210 = 0;
  char v199 = 0;
  char v226 = 0;
  char v196 = 0;
  __int16 v193 = 0;
  char v220 = 0;
  char v202 = 0;
  char v198 = 0;
  char v211 = 0;
  char v203 = 0;
  char v212 = 0;
  char v213 = 0;
  char v208 = 0;
  char v201 = 0;
  char v206 = 0;
  char v205 = 0;
  char v197 = 0;
  char v195 = 0;
  __int16 v192 = 0;
  v126[7] = v62 + 35;
  v126[2] = (unsigned __int16)((v29 ^ (v74 + ((v104 - 30817) & 0xFEAC) + 13485))
                             + 2 * (v29 & (v74 + ((v104 - 30817) & 0xFEAC) + 13485))) >> 8;
  v126[4] = (v62 - 2064523229) >> 24;
  v126[0] = ((v29 ^ v92) + 2 * (v29 & v92)) >> 24;
  v126[3] = (v29 ^ (v74 + ((v104 - 97) & 0xAC) - 83)) + 2 * (v29 & (v74 + ((v104 - 97) & 0xAC) - 83));
  v126[5] = (v62 - 2064523229) >> 16;
  v126[1] = ((v29 ^ v92) + 2 * (v29 & v92)) >> 16;
  v126[6] = (v62 - 2064523229) >> ((((((v104 - 97) & 0xAC) + 55) & 0xED) - 19) ^ 0x9A);
  v126[9] = (v65 + v91) >> 16;
  v126[12] = (v63 + v72 - 2074620358) >> 24;
  v126[15] = v63 + ((((v104 - 97) & 0xAC) + 55) & 0xED) + 58;
  v126[11] = v65 + v76 - 120;
  unsigned int v41 = (2 * v59) & 0xB4C13272;
  v126[19] = v71 + v93;
  v126[16] = (v71 + v93) >> 24;
  v126[13] = (v63 + v72 - 2074620358) >> 16;
  v126[8] = (v65 + v91) >> 24;
  v126[10] = (unsigned __int16)(v65 + v91) >> 8;
  v126[14] = (unsigned __int16)(v63 + ((((v104 - 30817) & 0xFEAC) + 20279) & 0x73ED) - 12742) >> 8;
  v126[18] = (unsigned __int16)(v71 + v93) >> 8;
  v126[17] = (v71 + v93) >> 16;
  v126[27] = v67 + v90;
  v126[20] = ((v59 ^ 0x5A609939) - 1696325126 + v41) >> 24;
  v126[23] = (v59 ^ 0x39) - 6 + ((2 * v59) & 0x72);
  v126[28] = (v60 - 964064710) >> 24;
  v126[22] = (unsigned __int16)((v59 ^ 0x9939) + 8698 + ((2 * v59) & 0x3272)) >> 8;
  v126[21] = ((v59 ^ 0x5A609939) - 1696325126 + v41) >> 16;
  v126[25] = (v67 + v90) >> 16;
  v126[26] = (unsigned __int16)(v67 + v78 - 20677) >> 8;
  v126[30] = (unsigned __int16)(v60 - 30150) >> 8;
  v126[31] = v60 + 58;
  v126[29] = (v60 - 964064710) >> 16;
  v126[24] = (v67 + v90) >> 24;
  uint64_t result = (*(uint64_t (**)(void, unsigned char *, uint64_t))&v123[8 * ((v72 - 1085845779) ^ 0xD3AFA311)])(*(void *)((char *)*(&off_10001D380 + (int)((v72 - 1085845779) ^ 0xD3AFA29B)) - 2), v126, 32);
  uint64_t v125 = result;
LABEL_45:
  *(void *)(a1 + 16) = v125;
  return result;
}

void x612ffaeaf886c2c15cdfcc6264a72fe5(uint64_t a1)
{
  __asm { BRAA            X0, X17 }
}

uint64_t sub_100007300()
{
  uint64_t result = (*(uint64_t (**)(void, void, void))(*(void *)(v0 - 104)
                                                             + 8 * (int)(*(_DWORD *)(v0 - 92) ^ 0xD83C585B)))(*(void *)(*(void *)(v0 - 136) + 8), *(void *)(*(void *)(v0 - 136) + 16), 0);
  *(_DWORD *)(v0 - 196) = result != -1;
  *(unsigned char *)(*(void *)(v0 - 192) + 4) = *(_DWORD *)(v0 - 196) & 1;
  return result;
}

void xca25a8e8583c3c2713b0c0092817dfbd(uint64_t a1)
{
  __asm { BRAA            X0, X17 }
}

uint64_t sub_100008024(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,int a38,int a39,uint64_t a40,uint64_t a41,uint64_t a42,int a43,unsigned int a44)
{
  HIDWORD(v55) = a44;
  LODWORD(v55) = (a44 - 1787756776) | 0x84;
  HIDWORD(a29) = a44 - 1787756546;
  (*(void (**)(void))(a42 + 8 * (int)(a44 ^ 0x6A8F0154)))();
  uint64_t v45 = (-1 - (a36 | (v44 - 64)) + (a36 & (v44 - 64))) ^ 0x18EBA506237DB04ALL;
  *(void *)(v44 - 56) = 0x2DCC32BA892366FLL * a40 + 0x26EF50ABF1D549FLL + 806450243 * v45;
  *(void *)(v44 - 48) = ((((a41 ^ 0x738B0620017329ALL) + v55 - 0x738B06200173330) ^ ((a41 ^ 0x3BD1F6BC3CABC5ECLL) - 0x3BD1F6BC3CABC5ECLL) ^ ((a41 ^ 0x1D2F31BE4220C110) - 0x1D2F31BE4220C110))
                         - 0x6ADA27514F0E6AF4) ^ (806450243 * v45);
  *(_DWORD *)(v44 - 64) = 1259718717 * a39 + 655850556 + 806450243 * v45;
  *(_DWORD *)(v44 - 32) = a44 + 1528041095 + 806450243 * v45;
  (*(void (**)(void))(a42 + 8 * (int)(a44 ^ 0x6A8F012E)))();
  unsigned __int8 v46 = *(uint64_t (**)(void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, unint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a42 + 8 * (int)((a44 - 1787756546) ^ (486 * (*(void *)(v44 - 40) == -1))));
  return v46(v46, v47, v48, v49, v50, v51, v52, v53, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a42,
           v55,
           __PAIR64__(a44, v55),
           a33,
           a34,
           a35,
           a36,
           a37);
}

uint64_t sub_100008260(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,int a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45)
{
  HIDWORD(a26) = a32;
  HIDWORD(v54) = (a32 + 9371620) ^ 0x6A000080;
  LODWORD(v54) = (a32 + 9371620) | 0x6A000080;
  uint64_t v45 = *(uint64_t (**)(void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a41 + 8 * (int)(a32 ^ (((((*(uint64_t (**)(uint64_t, void, uint64_t))(a41 + 8 * (int)(a32 ^ 0x175)))(a45, a40 ^ 0x7E9C3666u, a44) == 0) ^ ((a32 - 28) | 0x80) ^ 1) & 1) * (HIDWORD(v54) - 1787756748))));
  HIDWORD(a32) = HIDWORD(v54);
  LODWORD(a29) = v54;
  return v45(v45, v46, v47, v48, v49, v50, v51, v52, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a41,
           v54,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34,
           a35);
}

uint64_t sub_100008310()
{
  uint64_t v2 = (*(uint64_t (**)(void, uint64_t, uint64_t))(v8 + 8 * (v3 - 1787756407)))(0, v9, 32);
  v11[0] = *(void *)(v8 + 8 * (v3 - 1787756786));
  v11[4] = v10;
  v11[5] = 0xDEC9B6394D9EDF3DLL * v6 + 0x6CA28B661A2058C3;
  v11[6] = (((v7 ^ 0xC129A6281F40BF21) + 0x3ED659D7E0BF40DFLL) ^ ((v7 ^ 0xACA4D4753FC9F669) + 0x535B2B8AC0360997) ^ ((v7 ^ 0x4C4B053D5E157F2ELL) - 0x4C4B053D5E157F2ELL))
         + 0x6CE07D9EF3EA94D7;
  *(void *)(v0 - 56) = v11;
  *(_DWORD *)(v0 - 64) = v3 + 814891109 + 446615023 * ((v0 - 64 + (v5 & ~(v0 - 64)) - (v5 & (v0 - 64))) ^ 0xFE3F0F69);
  uint64_t result = (*(uint64_t (**)(void))(v8 + 8 * (v3 - 1787756361)))();
  *(void *)(v4 + 16) = v2;
  return result;
}

void PVAppIdentityCore_GenerateDigests(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, int a7)
{
  unsigned int v12 = (unint64_t *)((char *)*(&off_10001D380
                                     + (byte_10001ABF0[byte_10001AAF0[(47 * (qword_100020E98 ^ qword_100020EB8 ^ 0xE7))] ^ 0xF4] ^ (47 * (qword_100020E98 ^ qword_100020EB8 ^ 0xE7)))
                                     + 47)
                           - 7);
  unsigned int v13 = (unint64_t *)((char *)*(&off_10001D380
                                     + (byte_10001B1F0[byte_10001B0F0[(47 * (qword_100020E98 ^ *v12 ^ 0xE7))]] ^ (47 * (qword_100020E98 ^ *v12 ^ 0xE7)))
                                     - 36)
                           - 7);
  unint64_t v7 = 831087919 * ((*v13 - *v12 - (void)&v24) ^ 0x968005A955311CE7);
  *unsigned int v12 = v7;
  *unsigned int v13 = v7;
  uint64_t v16 = 0;
  v15[0] = 0;
  uint64_t v17 = 0;
  v15[1] = 0;
  LODWORD(v25) = 1312390810
               - 900777529
               * ((((unint64_t)&v25 | 0xBF8FEF9A3B26EE5ALL)
                 - ((unint64_t)&v25 | 0x40701065C4D911A5)
                 - 992407131) ^ 0x4DF4E313);
  uint64_t v26 = a2;
  unint64_t v8 = 831087919 * ((*v13 + *v12) ^ 0x968005A955311CE7);
  int v14 = (char *)*(&off_10001D380
                + (byte_10001B1F0[byte_10001B0F0[(47
                                                                                  * ((qword_100020E98 - qword_100020EB8) ^ 0xE7))] ^ 0x7B] ^ (47 * ((qword_100020E98 - qword_100020EB8) ^ 0xE7)))
                - 93)
      - 2;
  (*(void (**)(void))&v14[8 * (byte_10001B5F0[byte_10001B4F0[v8] ^ 0xD] ^ v8) + 1352])();
  v18[0] = *((void *)v14 + 32);
  v18[2] = a4;
  int v19 = (a6 ^ 0x32BFFF7F) - 2115344 + ((2 * a6) & 0x657FFEFE);
  unsigned int v20 = a7 + 1159262016 - ((2 * a7) & 0x8A31DE80);
  unsigned int v21 = &v16;
  v22 = v15;
  unsigned int v23 = &v17;
  unsigned int v25 = v18;
  LODWORD(v26) = 1086542167 * ((&v25 - 1835899083 - 2 * (&v25 & 0x92926735)) ^ 0x99E017AA)
               - 1978704681;
  (*(void (**)(void))&v14[8
                        * (byte_10001AFF0[byte_10001AEF0[(47
                                                                                          * (*(unsigned char *)v13 ^ *(unsigned char *)v12 ^ 0xE7))] ^ 0x83] ^ (47 * (*(unsigned char *)v13 ^ *(unsigned char *)v12 ^ 0xE7)))
                        + 3640])();
  __asm { BRAA            X0, X17 }
}

#error "100009ECC: call analysis failed (funcsize=607)"

uint64_t sub_10000A974(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,unint64_t a43,unint64_t a44,unint64_t a45,int a46,int a47,int a48)
{
  (*(void (**)(unint64_t))(STACK[0x3B0] + 8 * (a48 + 609637866)))(STACK[0x2D0]);
  uint64_t v48 = *(uint64_t (**)(void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(STACK[0x3B0] + 8 * ((a48 + 609637769) ^ (19 * (STACK[0x2E8] == 0))));
  LODWORD(STACK[0x450]) = a48;
  LODWORD(STACK[0x454]) = a47;
  STACK[0x458] = a45;
  STACK[0x460] = a44;
  STACK[0x468] = a43;
  return v48(v48, v49, v50, v51, v52, v53, v54, v55, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34,
           a35,
           a36,
           a37,
           a38,
           a39);
}

uint64_t sub_10000AA10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,int a42,unint64_t a43,unint64_t a44,unint64_t a45,int a46,int a47)
{
  (*(void (**)(unint64_t))(STACK[0x3B0] + 8 * (a42 + 609637866)))(STACK[0x2E8]);
  LODWORD(STACK[0x450]) = a42;
  LODWORD(STACK[0x454]) = a47;
  STACK[0x458] = a45;
  STACK[0x460] = a44;
  STACK[0x468] = a43;
  uint64_t v47 = *(uint64_t (**)(void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(STACK[0x3B0] + 8 * ((104 * (STACK[0x420] != 0)) ^ (LODWORD(STACK[0x450]) + 609637828)));
  return v47(v47, v48, v49, v50, v51, v52, v53, v54, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33);
}

uint64_t sub_10000AACC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,int a40,int a41)
{
  (*(void (**)(unint64_t))(STACK[0x3B0] + 8 * (int)(a41 ^ 0xDBA9AA1E)))(STACK[0x420]);
  int v42 = *(uint64_t (**)(void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(STACK[0x3B0] + 8 * (((*(void *)(v41 - 240) == 0) * (((a41 + 609637551) | 0x16) ^ (((a41 + 609637551) ^ 0xF4) - 180))) ^ (a41 + 609637551)));
  return v42(v42, v43, v44, v45, v46, v47, v48, v49, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32);
}

uint64_t sub_10000AB60(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,int a35,int a36)
{
  (*(void (**)(uint64_t))(STACK[0x3B0] + 8 * (a36 ^ 0x15B)))(a34);
  unint64_t v37 = STACK[0x3B0];
  *(void *)(v36 - 240) = 0;
  int v38 = *(uint64_t (**)(void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v37 + 8 * ((a36 + 158) ^ ((*(void *)(v36 - 256) == 0) * (((a36 + 165) | 1) ^ (a36 - 1096824128) & 0x416035EA ^ 0x38))));
  return v38(v38, v39, v40, v41, v42, v43, v44, v45, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27);
}

uint64_t sub_10000ABF8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,int a32,int a33)
{
  (*(void (**)(uint64_t))(STACK[0x3B0] + 8 * (a33 + 122)))(a31);
  unint64_t v34 = STACK[0x3B0];
  *(void *)(v33 - 256) = 0;
  int v35 = *(uint64_t (**)(void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v34 + 8 * (int)(((((*(void *)(v33 - 232) == 0) ^ ((((_BYTE)a33 - 3) & 0xFD) - 102) & 0xB9) & 1) * (((a33 + 1301431293) & 0xB26DBBFD ^ 0x5A) + 277)) ^ (a33 + 1301431293) & 0xB26DBBFD));
  return v35(v35, v36, v37, v38, v39, v40, v41, v42, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24);
}

uint64_t sub_10000ACA0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,int a29,int a30)
{
  (*(void (**)(uint64_t))(STACK[0x3B0] + 8 * (a30 ^ 0x1DB)))(a28);
  unint64_t v31 = STACK[0x3B0];
  *(void *)(v30 - 232) = 0;
  unsigned int v32 = *(uint64_t (**)(void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v31 + 8 * (((STACK[0x480] != 0) * ((((a30 + 98) | 0x18) ^ 0x1D9) - 117)) ^ ((a30 + 98) | 0x18)));
  return v32(v32, v33, v34, v35, v36, v37, v38, v39, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19, a20, a21);
}

uint64_t sub_10000AD20(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,int a26,int a27)
{
  (*(void (**)(uint64_t))(STACK[0x3B0] + 8 * (a27 ^ 0x5D)))(a25);
  unint64_t v27 = STACK[0x3B0];
  STACK[0x480] = 0;
  int v28 = *(uint64_t (**)(void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v27 + 8 * (((STACK[0x470] != 0) * ((56 * (a27 ^ 0x13D)) ^ 0xFC)) ^ (56 * (a27 ^ 0x13D))));
  return v28(v28, v29, v30, v31, v32, v33, v34, v35, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18);
}

uint64_t sub_10000ADA8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,int a23,int a24)
{
  (*(void (**)(uint64_t))(STACK[0x3B0] + 8 * (a24 ^ 0x184)))(a22);
  unint64_t v24 = STACK[0x3B0];
  STACK[0x470] = 0;
  unsigned int v25 = *(uint64_t (**)(void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v24 + 8 * ((a24 - 206) ^ (54 * (((STACK[0x478] == 0) ^ (((a24 - 34) & 0x7F) + 1)) & 1))));
  return v25(v25, v26, v27, v28, v29, v30, v31, v32, a9, a10, a11, a12, a13, a14, a15);
}

uint64_t sub_10000AE44(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, int a20,int a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40)
{
  (*(void (**)(uint64_t))(STACK[0x3B0] + 8 * (a21 + 338)))(a19);
  unint64_t v40 = STACK[0x3B0];
  STACK[0x478] = 0;
  uint64_t v41 = *(uint64_t (**)(void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v40 + 8 * (((a40 == 0) * (((a21 + 50) | 2) + 50)) ^ (a21 + 44)));
  return v41(v41, v42, v43, v44, v45, v46, v47, v48, a9, a10, a11, a12);
}

uint64_t sub_10000AEBC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, int a17, int a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40)
{
  (*(void (**)(uint64_t))(STACK[0x3B0] + 8 * (a18 ^ 0x122)))(a40);
  unint64_t v40 = *(uint64_t (**)(void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(STACK[0x3B0] + 8 * ((3 * (a18 ^ 0x6F)) ^ ((a39 == 0) * (3 * (a18 ^ 0x6F) + 25 + ((3 * (a18 ^ 0x6F) - 151071118) & 0x901297F) - 18))));
  return v40(v40, v41, v42, v43, v44, v45, v46, v47, a9);
}

uint64_t sub_10000AF54(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, int a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38)
{
  (*(void (**)(uint64_t))(STACK[0x3B0] + 8 * (a16 + 208)))(a38);
  uint64_t v38 = *(uint64_t (**)(void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(STACK[0x3B0] + 8 * (((a37 == 0) * ((a16 ^ 0xF9) - 48 + (a16 ^ 0xF9) + 85)) ^ a16 ^ 0xF9));
  return v38(v38, v39, v40, v41, v42, v43, v44, v45);
}

uint64_t sub_10000AFCC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, int a14, int a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38)
{
  (*(void (**)(uint64_t))(STACK[0x3B0] + 8 * (a15 ^ 0x159)))(a38);
  uint64_t v39 = *(uint64_t (**)(void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(STACK[0x3B0]
                                                                                      + 8
                                                                                      * (((*(void *)(v38 - 248) == 0)
                                                                                        * ((a15 - 2141707598) & 0x7FA7DDDE ^ 0xC5)) ^ (a15 + 136)));
  return v39(v39, v40, v41, v42, v43, v44);
}

uint64_t sub_10000B05C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, int a13)
{
  (*(void (**)(uint64_t))(STACK[0x3B0] + 8 * (a13 ^ 0x1AA)))(a12);
  unint64_t v14 = STACK[0x3B0];
  *(void *)(v13 - 248) = 0;
  unsigned int v15 = *(uint64_t (**)(void, uint64_t, uint64_t, uint64_t, uint64_t))(v14
                                                                             + 8
                                                                             * ((91
                                                                               * (((STACK[0x488] == 0) ^ (((a13 - 78) | 8) - 14) ^ 0xD7) & 1)) ^ ((a13 - 78) | 8)));
  return v15(v15, v16, v17, v18, v19);
}

uint64_t sub_10000B0EC()
{
  (*(void (**)())(v3 + 8 * (v1 ^ 0x1C9)))();
  return (v2 - 989955170);
}

void xa859cbdfad2e09bc3fec50993773da26(_DWORD *a1)
{
  unsigned int v1 = *a1 ^ (95750717 * ((a1 + ~a1 - (~a1 ^ 0xAAB34EF7)) ^ 0x5569FD18));
  __asm { BRAA            X0, X17 }
}

uint64_t sub_10000B230()
{
  int v9 = *(_DWORD *)(v0 - 12);
  uint64_t v8 = *(void *)(v0 - 24);
  uint64_t v10 = (*(uint64_t (**)(void))(v8 + 8 * (v9 ^ 0x1A7)))(*(void *)(v0 - 40));
  unsigned int v1 = *(uint64_t (**)(void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v8
                                                                                     + 8
                                                                                     * (v9 ^ ((v10 == (*(uint64_t (**)(void))(v8 + 8 * (v9 + 373)))())
                                                                                            * ((19 * (v9 ^ 0x63)) ^ 0x97))));
  *(void *)(v0 - 8) = *(void *)(v0 - 32);
  return v1(v1, v2, v3, v4, v5, v6);
}

uint64_t sub_10000B2D0()
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(v0 - 24) + 8 * (v3 ^ 0x1D6)))(*(void *)(v0 - 40));
  uint64_t v2 = 0;
  if (result) {
    uint64_t v2 = *(void *)(v0 - 40);
  }
  *(void *)(v0 - 8) = v2;
  *(void *)(v4 + 16) = *(void *)(v0 - 8);
  return result;
}

void x382897c70d9caf2414a68315371674b5(_DWORD *a1)
{
  unsigned int v2 = *a1 ^ (1588918703 * ((2 * (a1 | 0xCDC95E5) - a1 - 215782885) ^ 0xDF6DDACF));
  int v3 = (char *)*(&off_10001D380 + (int)(v2 - 248)) - 2;
  uint64_t v1 = *(void *)&v3[8
                    * ((((*(uint64_t (**)(void))&v3[8 * (v2 + 137)])() != 0) * (((v2 - 1520323073) & 0x5A9E49FD) - 273)) ^ v2)];
  __asm { BRAA            X0, X17 }
}

uint64_t sub_10000B55C()
{
  uint64_t v1 = *(void *)(v0 - 152);
  int v2 = *(_DWORD *)(v0 - 156);
  uint64_t v3 = *(void *)(v0 - 192);
  int v4 = *(_DWORD *)(v0 - 108);
  *(_DWORD *)(v0 - 228) = v4;
  *(void *)(v0 - 240) = *(void *)(v3 + 24);
  *(_DWORD *)(v0 - 212) = v4 - 15;
  *(_DWORD *)(v0 - 216) = v4 - 15;
  *(_DWORD *)(v0 - 232) = v2 + v4 - 953692094;
  *(void *)(v0 - 224) = v1;
  uint64_t v5 = (*(uint64_t (**)(void))(v1 + 8 * (v4 ^ 0xB3)))();
  int v6 = *(_DWORD *)(v0 - 232);
  int v7 = *(_DWORD *)(v0 - 228);
  uint64_t v8 = *(void *)(v0 - 224);
  int v9 = *(_DWORD *)(v0 - 216);
  int v10 = *(_DWORD *)(v0 - 212);
  *(void *)(v0 - 208) = v5;
  unsigned int v11 = (v6 ^ 0xE335E3BB) & (2 * (v6 & (v9 ^ 0xF3A5F2A2))) ^ v6 & (v9 ^ 0xF3A5F2A2);
  unsigned int v12 = ((2 * (v6 ^ 0xC57F60E9)) ^ 0x6DB526A4) & (v6 ^ 0xC57F60E9) ^ (2 * (v6 ^ 0xC57F60E9)) & 0x36DA9352;
  int v13 = (v12 ^ 0x4900200) & (4 * v11) ^ v11;
  unsigned int v14 = ((4 * (v12 ^ 0x124A9152)) ^ 0xDB6A4D48) & (v12 ^ 0x124A9152) ^ (4 * (v12 ^ 0x124A9152)) & 0x36DA9350;
  int v15 = v14 ^ 0x24909212;
  int v16 = (v14 ^ 0x124A0140) & (16 * v13) ^ v13;
  int v17 = ((16 * v15) ^ 0x6DA93520) & v15 ^ (16 * v15) & 0x36DA9350;
  int v18 = v16 ^ (v17 ^ 0x24881100) & (v16 << 8) ^ 0x36DA9352;
  uint64_t v19 = (int)(v6 ^ (2
                  * ((v18 << 16) & 0x36DA0000 ^ ((v18 << 16) ^ 0x13520000) & (((v17 ^ 0x12528252) << 8) & 0x36DA0000 ^ (((v17 ^ 0x12528252) << 8) ^ 0xDA930000) & (v17 ^ 0x12528252) ^ 0x24480000) ^ v18)) ^ 0xBC64E7D4);
  uint64_t v20 = (((v19 ^ 0x49922932D24AA04FLL) - 0x65C4C5BC08D2F441) ^ ((v19 ^ 0x61F4313C9C138111) - 0x4DA2DDB2468BD51FLL) ^ ((v19 ^ 0x2866180E48891395) - 0x430F4809211479BLL))
      + 0x2C56EC8FBF686AD8;
  BOOL v21 = v20 < (uint64_t)0x80000000E3200413;
  BOOL v22 = v5 + 3810526227 < v20;
  if (((v21 ^ (v5 > 0x7FFFFFFF1CDFFBECLL)) & 1) == 0) {
    BOOL v21 = v22;
  }
  unsigned int v23 = *(uint64_t (**)(void))(v8 + 8 * (v7 ^ (27 * !v21)));
  *(_DWORD *)(v0 - 200) = v9;
  *(_DWORD *)(v0 - 196) = v10;
  return v23();
}

uint64_t sub_10000B830()
{
  uint64_t v1 = *(void *)(v0 - 152);
  int v2 = *(_DWORD *)(v0 - 160);
  int v3 = *(_DWORD *)(v0 - 200);
  *(_DWORD *)(v0 - 256) = v2 + 1392417408;
  *(_DWORD *)(v0 - 252) = v2 + 1392417408 < -128876024;
  int v4 = *(uint64_t (**)(void))(v1 + 8 * (v3 ^ (3 * (v2 - 626190217 < ((v3 + 18) ^ 0x7FFFFED4u)))));
  *(_DWORD *)(v0 - 248) = (v3 + 18) ^ 2;
  *(_DWORD *)(v0 - 244) = v3 + 18;
  return v4();
}

uint64_t sub_10000B8AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,unsigned int a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34)
{
  int v35 = 3 * (*(_DWORD *)(v34 - 248) ^ 0x138);
  uint64_t v37 = *(uint64_t (**)(void, void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v34 - 152) + 8 * (int)(v35 ^ (((*(_DWORD *)(v34 - 164) - 375809824) < 0x7FFFFFFF) * ((v35 + 1097168588) & 0xBE9A8957 ^ ((v35 - 34) | 0x108) ^ 0x1FB))));
  LODWORD(v39) = (v35 + 1097168588) & 0xBE9A8957;
  HIDWORD(v39) = (v35 - 34) | 0x108;
  unsigned int v36 = ((2 * (*(_DWORD *)(v34 - 160) ^ 0xAF7B202A)) ^ 0xEBAC70A4) & (*(_DWORD *)(v34 - 160) ^ 0xAF7B202A) ^ (2 * (*(_DWORD *)(v34 - 160) ^ 0xAF7B202A)) & 0x75D63852;
  return v37(v37, ((4 * (v36 ^ 0x14520852)) ^ 0xD758E148) & (v36 ^ 0x14520852) ^ (4 * (v36 ^ 0x14520852)) & 0x75D63850 ^ 0x20861812, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           v39,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34);
}

uint64_t sub_10000BFD4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,int a39,int a40,uint64_t a41,int a42,int a43)
{
  LODWORD(v68) = HIDWORD(a21) * a40 + ((a22 + 1666819014) & 0x9CA65BFF) + 601340295;
  HIDWORD(v68) = (a22 + 1666819014) & 0x9CA65BFF;
  LODWORD(a21) = 0;
  uint64_t v44 = *(void *)(v43 - 176);
  uint64_t v45 = *(void *)(v43 - 240);
  LODWORD(v64) = 0;
  HIDWORD(v64) = HIDWORD(v68);
  LODWORD(v66) = HIDWORD(v68) + 22;
  HIDWORD(v66) = HIDWORD(v68) + 270;
  int v46 = (v68 ^ 0xDCAB0618) & (2 * (v68 & 0xDC28465C)) ^ v68 & 0xDC28465C;
  int v47 = ((2 * (v68 ^ 0x64FB0210)) ^ (HIDWORD(v68) + 22) ^ 0x71A688AB) & (v68 ^ 0x64FB0210) ^ (2 * (v68 ^ 0x64FB0210)) & (HIDWORD(v68) - 1194114001);
  int v48 = (v47 ^ 0x30820000) & (4 * v46) ^ v46;
  unsigned int v49 = ((4 * (v47 ^ 0x88514444)) ^ 0xE34D1130) & (v47 ^ 0x88514444) ^ (4 * (v47 ^ 0x88514444)) & 0xB8D3444C;
  int v50 = v49 ^ 0x1892444C;
  unsigned int v51 = (v49 ^ 0xA0410000) & (16 * v48) ^ v48;
  unsigned int v52 = ((16 * v50) ^ 0x8D3444C0) & v50 ^ (16 * v50) & 0xB8D34440;
  unsigned int v53 = v51 ^ (v52 ^ 0x88104400) & (v51 << 8) ^ 0xB8D3444C;
  uint64_t v54 = (int)(v68 ^ (2
                   * ((v53 << 16) & 0x38D30000 ^ ((v53 << 16) ^ 0x444C0000) & (((v52 ^ 0x30C3000C) << 8) & 0xB8D30000 ^ (((v52 ^ 0x30C3000C) << 8) ^ 0xD3440000) & (v52 ^ 0x30C3000C) ^ 0x28930000) ^ v53)) ^ 0xD3779E2F);
  uint64_t v65 = *(void *)(v43 - 152);
  *(void *)(v43 - 96) = *(void *)(v65 + 8 * SHIDWORD(v68));
  *(void *)(v43 - 80) = v45;
  *(void *)(v43 - 72) = (((v54 ^ 0x6EAC73507F84F15ELL) - 0x58FB7CCF4D350CACLL) ^ ((v54 ^ 0x553117D454C515B4)
                                                                                  - 0x6366184B6674E846) ^ ((v54 ^ 0x3B9D64845538B401) - 0xDCA6B1B678949F3))
                        - 0x628A8547A97F0DA1;
  *(_DWORD *)(v43 - 64) = a43;
  *(void *)(v43 - 48) = v43 - 96;
  *(_DWORD *)(v43 - 40) = HIDWORD(v68)
                        - 452446456
                        + 148806247 * ((v43 - 48 + (v44 & ~(v43 - 48)) - (v44 & (v43 - 48))) ^ 0xB431CC30);
  (*(void (**)(void))(v65 + 8 * (HIDWORD(v68) ^ 0x18C)))();
  uint64_t v67 = *(void *)(v43 - 32);
  uint64_t v55 = *(uint64_t (**)(void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v65 + 8 * ((43 * (v67 != 0)) ^ HIDWORD(v68) ^ 0x94));
  HIDWORD(a19) = HIDWORD(v68) + 22;
  return v55(v55, v56, v57, v58, v59, v60, v61, v62, a9, a10, a11, a12, a13, a14, v64, v65, v66, v67, a19,
           v68,
           a21,
           a22,
           a23,
           a24,
           a25);
}

uint64_t sub_10000C32C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, unsigned int a15, uint64_t a16, uint64_t a17, uint64_t a18, int a19, int a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,int a41,BOOL a42)
{
  HIDWORD(a12) = a20;
  uint64_t v55 = *(void *)(v42 - 152);
  uint64_t v54 = (*(uint64_t (**)(uint64_t))(v55 + 8 * (a20 + 381)))(a18);
  uint64_t v43 = (*(uint64_t (**)(uint64_t))(v55 + 8 * (a20 + 393)))(a18);
  (*(void (**)(void, uint64_t, uint64_t))(v55 + 8 * (a20 + 409)))(*(void *)(v42 - 120), v54, v43);
  (*(void (**)(uint64_t))(v55 + 8 * (a20 ^ 0x157)))(a18);
  BOOL v51 = a42;
  if (((a42 ^ (a15 > 0x1C398FDA)) & 1) == 0) {
    BOOL v51 = (int)(a15 + ((a20 - 22) ^ 0x63C67038)) < a41;
  }
  unsigned int v52 = *(uint64_t (**)(void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v55 + 8 * (a20 ^ (100 * v51)));
  LODWORD(v56) = a20 - 22;
  HIDWORD(v56) = (a20 + 652783050) & 0xD917531B;
  return v52(v52, v44, v45, v46, v47, v48, v49, v50, a9, a10, v54, a12, v55, v56);
}

uint64_t sub_10000C464(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34)
{
  int v35 = *(_DWORD *)(v34 - 252);
  int v36 = (HIDWORD(a22) - 279) | 0x129;
  if (((v35 ^ (HIDWORD(a21) > ((HIDWORD(a22) - 761876194) & 0x2D694DFB ^ 0x7AE7DC5u))) & 1) == 0) {
    LOBYTE(v35) = HIDWORD(a21) + 2018607625 < *(_DWORD *)(v34 - 256);
  }
  uint64_t v37 = *(uint64_t (**)(void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v34 - 152) + 8 * (((v35 & 1) * (v36 ^ 0x11B)) ^ HIDWORD(a22)));
  *(_DWORD *)(v34 - 244) = v36;
  return v37(v37, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34);
}

uint64_t sub_10000C50C()
{
  int v3 = *(_DWORD *)(v0 - 244);
  uint64_t v2 = (*(uint64_t (**)(void, void))(*(void *)(v0 - 152) + 8 * (v3 + 120)))(0, *(void *)(v0 - 120));
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(v0 - 152) + 8 * (v3 ^ 0x4F)))(*(void *)(v0 - 120));
  *(void *)(v0 - 104) = v2;
  *(void *)(*(void *)(v0 - 192) + 16) = *(void *)(v0 - 104);
  return result;
}

void sub_10000C5B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = (char *)*(&off_10001D380
               + (byte_10001AFF0[byte_10001AEF0[(47
                                                                                 * ((qword_100020E98 - qword_100020EB0) ^ 0xE7))] ^ 0x8A] ^ (47 * ((qword_100020E98 - qword_100020EB0) ^ 0xE7)))
               - 197)
     - 2;
  int v6 = (void *)((char *)*(&off_10001D380
                          + (byte_10001B1F0[byte_10001B0F0[(47
                                                                                            * ((qword_100020E98 - *v5) ^ 0xE7))] ^ 0xFE] ^ (47 * ((qword_100020E98 - *v5) ^ 0xE7)))
                          - 118)
                - 7);
  unint64_t v7 = *v6 ^ *(void *)v5 ^ (unint64_t)&v12;
  *(void *)uint64_t v5 = (831087919 * v7) ^ 0x968005A955311CE7;
  *int v6 = 831087919 * (v7 ^ 0x968005A955311CE7);
  unint64_t v8 = atomic_load((unint64_t *)(a3 + 40));
  unint64_t v9 = 831087919 * (*v6 ^ *(void *)v5 ^ 0x968005A955311CE7);
  unsigned int v11 = (char *)*(&off_10001D380
                + (byte_10001B5F0[byte_10001B4F0[(47
                                                                                  * ((qword_100020E98 - qword_100020EB0) ^ 0xE7))] ^ 0xD] ^ (47 * ((qword_100020E98 - qword_100020EB0) ^ 0xE7)))
                - 175)
      - 2;
  uint64_t v10 = *(void *)&v11[8
                      * ((309
                        * ((*(uint64_t (**)(unint64_t, uint64_t))&v11[8
                                                                                    * (byte_10001B1F0[byte_10001B0F0[v9] ^ 0x7B] ^ v9)
                                                                                    + 2352])(v8, a1) == 0)) ^ 0xA)];
  __asm { BRAA            X0, X17 }
}

uint64_t sub_10000C828(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,int a24,int a25,uint64_t a26,uint64_t a27)
{
  LODWORD(v37) = a25;
  HIDWORD(v37) = (a25 + 25657353) | 0x42004909;
  LODWORD(v38) = (a25 + 176947270) & 0xF573FFA9;
  a26 = *(void *)(a22 + 8 * a25);
  a27 = a18;
  *(_DWORD *)(v27 - 48) = a25
                        - 667133525
                        - 1546437751 * ((2 * ((v27 - 48) & 0x253B5AB4) - 624646837 - (v27 - 48)) ^ 0xED6F4D67);
  *(void *)(v27 - 40) = &a26;
  (*(void (**)(void))(a22 + 8 * (a25 + 410)))();
  uint64_t v28 = *(uint64_t (**)(void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a22 + 8 * (int)(a25 ^ (v38 + 10) ^ (((*(unsigned char *)(v27 - 44) ^ 1) & 1) * (HIDWORD(v37) ^ 0x4387C930))));
  HIDWORD(v38) = v38;
  return v28(v28, v29, v30, v31, v32, v33, v34, v35, a9, a10, a11, a12, a13, a14, v37, a22, v38, a18);
}

uint64_t sub_10000C958(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, int a17, int a18, uint64_t a19, uint64_t a20,int a21,uint64_t a22,uint64_t a23)
{
  *(_DWORD *)(v23 - 48) = (a18 + 86) ^ (95750717 * ((-1 - (a21 | (v23 - 48)) + (a21 & (v23 - 48))) ^ 0xB1B14760));
  *(void *)(v23 - 40) = a20;
  (*(void (**)(void))(a23 + 8 * (a18 ^ 0x189)))();
  unint64_t v24 = *(uint64_t (**)(void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a23
                                                                                      + 8
                                                                                      * (a18 ^ ((*(void *)(v23 - 32) == 0)
                                                                                              * ((a18 - 436995012) & 0x1A0C03BA ^ 0x22))));
  return v24(v24, v25, v26, v27, v28, v29);
}

uint64_t sub_10000CA48()
{
  uint64_t v1 = v7;
  uint64_t v2 = v9;
  uint64_t v3 = v11;
  int v4 = v8;
  unint64_t v5 = atomic_load(v10);
  *(void *)(v0 - 152) = *(void *)(v3 + 8 * v4);
  *(void *)(v0 - 144) = v5;
  *(void *)(v0 - 136) = v2;
  *(void *)(v0 - 128) = v1;
  *(_DWORD *)(v0 - 48) = v4
                       - 1692319393
                       + 446615023 * ((-2 - ((v0 - 48) | 0xE968A332) - (~(v0 - 48) | 0x16975CCD)) ^ 0x45B91BF2);
  *(void *)(v0 - 40) = v0 - 152;
  return (*(uint64_t (**)(void))(v3 + 8 * (v4 + 433)))();
}

uint64_t sub_10000CB44(unsigned int a1)
{
  return ((a1 >> 22) & 3 | 0xFCB4D8BC) ^ ((((a1 >> 8) & 0x74 | 0x73F3D68A)
                                         - ((a1 >> 8) & 0xFC | 0x4380C600)
                                         + ((a1 >> 8) & 0x74 | 0x4200C000)) ^ 0x8E870836) & ((a1 >> 22) | 0xFFB7FFFC);
}

void x2b0fb2cf0990fff72ee03ad3f8b2bda0(uint64_t a1)
{
  int v1 = *(_DWORD *)a1 ^ (688255471 * ((a1 + (~a1 & 0x5DDDB22A) - (a1 & 0x5DDDB22A)) ^ 0x7D17CD8));
  uint64_t v4 = *(void *)(a1 + 16);
  int v3 = (v1 + 94) ^ (95750717
                  * ((2 * ((unint64_t)&v3 | 0xBA3032D4B2FAE425) - (void)&v3 + 1292180443) ^ 0x4D2057CA));
  uint64_t v2 = (char *)*(&off_10001D380 + (v1 ^ 0x32)) - 2;
  (*(void (**)(void))&v2[8 * v1 + 3064])();
  __asm { BRAA            X0, X17 }
}

uint64_t sub_10000CD24(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  uint64_t v21 = *(void *)(v20 - 112);
  uint64_t v22 = *(void *)(v20 - 104);
  int v36 = *(_DWORD *)(v20 - 68);
  *(_DWORD *)(v20 - 140) = (v36 ^ 0x15F) + 180;
  uint64_t v37 = v22;
  uint64_t v35 = (*(uint64_t (**)(uint64_t))(v22 + 8 * (v36 ^ 0xE2)))(v21);
  uint64_t v23 = (*(uint64_t (**)(void, uint64_t))(v37 + 8 * (v36 + 86)))(*(void *)((char *)*(&off_10001D380 + v36 - 341) - 2), v35 << (*(_DWORD *)(v20 - 140) ^ 0xB4u));
  int v24 = *(_DWORD *)(v20 - 140);
  uint64_t v25 = *(void *)(v20 - 80);
  *(void *)(v20 - 136) = v23;
  uint64_t v26 = *(uint64_t (**)(void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v37 + 8 * (v36 ^ (40 * (v23 == 0))));
  *(_DWORD *)(v20 - 124) = v24;
  *(void *)(v20 - 64) = v25;
  return v26(v26, v27, v28, v29, v30, v31, v32, v33, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19, a20);
}

uint64_t sub_10000CDE4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26)
{
  int v36 = *(_DWORD *)(v26 - 124);
  uint64_t v37 = *(void *)(v26 - 104);
  (*(void (**)(void))(v37 + 8 * (v36 ^ 0x105)))(*(void *)(v26 - 112));
  uint64_t v27 = *(uint64_t (**)(void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v37 + 8 * (v36 ^ ((a26 != 0) * ((v36 - 180) ^ (5 * (v36 ^ 0x80) - 182)))));
  *(void *)(v26 - 64) = *(void *)(v26 - 136);
  return v27(v27, v28, v29, v30, v31, v32, v33, v34, a9, a10, a11, a12, a13, a14, a15, a16, a17);
}

uint64_t sub_10000CE70(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,unsigned __int8 *a24,int a25,int a26)
{
  uint64_t v27 = *(uint64_t (**)(void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v26 - 104) + 8 * ((489 * (*a24 > 0x9Fu)) ^ (118 * (a26 ^ 0x10B))));
  return v27(v27, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12);
}

uint64_t sub_10000CF6C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, int a18, char a19, int a20)
{
  uint64_t v21 = *(void *)(v20 - 104);
  *(unsigned char *)(v20 - 50) = a19 + 126;
  uint64_t v22 = *(uint64_t (**)(void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v21
                                                                                               + 8
                                                                                               * ((42
                                                                                                 * ((a17 + ((a20 + 7) | 0x42) + 17) < 0xF6u)) ^ (a20 + 214)));
  return v22(v22, a2, a3, a4, a5, a6, a7);
}

uint64_t sub_10000D06C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, int a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26)
{
  uint64_t v27 = *(void *)(v26 - 136);
  uint64_t v28 = *(void *)(v26 - 104);
  HIDWORD(v38) = a14 - 65;
  HIDWORD(a12) = (a14 + 962364085) & 0xC6A37CEC;
  LODWORD(v38) = a14 - 329;
  *(unsigned char *)(v26 - 49) = a17 + ((a14 - 65) ^ 0xB5);
  uint64_t v39 = v28;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v28 + 8 * ((a14 - 65) ^ 0xC5)))(v27, v26 - 50, 2);
  uint64_t v29 = *(uint64_t (**)(void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v39 + 8 * ((a14 - 65) | ((a16 + 1 == a26) * (a14 - 329 + (HIDWORD(a12) ^ 0xA3)))));
  *(void *)(v26 - 64) = *(void *)(v26 - 136);
  return v29(v29, v30, v31, v32, v33, v34, v35, v36, a9, v38, v39, a12);
}

void sub_10000D1E0()
{
  *(void *)(*(void *)(v0 - 120) + 8) = *(void *)(v0 - 64);
}

void x0ea8d5bdddc8032a3a24f7847d1d9948(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 16) + 491357047 * (((a1 | 0x52D3C3FB) - a1 + (a1 & 0xAD2C3C04)) ^ 0x4FCB5193);
  __asm { BRAA            X0, X17 }
}

uint64_t sub_10000D2F0()
{
  int v5 = *(_DWORD *)(v0 - 12);
  uint64_t v6 = *(void *)(v0 - 24);
  uint64_t v7 = (*(uint64_t (**)())(v6 + 8 * (v5 ^ 0x1BF)))();
  uint64_t v1 = (*(uint64_t (**)(void))(v6 + 8 * (v5 ^ 0x1B9)))();
  uint64_t v2 = v9;
  uint64_t v3 = v1;
  uint64_t result = v7;
  if (v7 != v3) {
    uint64_t v2 = 0;
  }
  *(void *)(v0 - 8) = v2;
  *(void *)(v8 + 8) = *(void *)(v0 - 8);
  return result;
}

void x5195de5e0eac30c205a853f1bfc8d90a()
{
  uint64_t v0 = **(void **)__chkstk_darwin();
  __asm { BRAA            X0, X17 }
}

void sub_10000D65C()
{
  *(_DWORD *)(v0 + 12) = (*(_DWORD *)(v1 + 72) >> 6) ^ 0x589A410A;
}

uint64_t xaddfa6f64ae88876a0afdb8241d75bbe(void *a1, void *a2)
{
  uint64_t v2 = (void *)((char *)*(&off_10001D380
                          + (byte_10001AFF0[byte_10001AEF0[(47
                                                                                            * (qword_100020E98 ^ qword_100020EC0 ^ 0xE7))] ^ 0x39] ^ (47 * (qword_100020E98 ^ qword_100020EC0 ^ 0xE7)))
                          - 63)
                - 7);
  uint64_t v3 = (void *)((char *)*(&off_10001D380
                          + (byte_10001B3F0[byte_10001B2F0[(47
                                                                                            * (qword_100020E98 ^ *v2 ^ 0xE7))] ^ 0xC1] ^ (47 * (qword_100020E98 ^ *v2 ^ 0xE7)))
                          - 169)
                - 7);
  unint64_t v4 = *v3 ^ *v2 ^ (unint64_t)&v8;
  *uint64_t v2 = 831087919 * (v4 + 0x697FFA56AACEE319);
  *uint64_t v3 = 831087919 * (v4 ^ 0x968005A955311CE7);
  unint64_t v5 = 831087919 * ((*v3 - *v2) ^ 0x968005A955311CE7);
  uint64_t v6 = (*(uint64_t (**)(void, void, void))((char *)*(&off_10001D380
                                                                   + (byte_10001B3F0[byte_10001B2F0[(47 * (qword_100020E98 ^ qword_100020EC0 ^ 0xE7))] ^ 0xCF] ^ (47 * (qword_100020E98 ^ qword_100020EC0 ^ 0xE7)))
                                                                   - 73)
                                                         + 8
                                                         * (byte_10001B1F0[byte_10001B0F0[v5] ^ 0xFE] ^ v5)
                                                         + 2590))(*a1, *a2, 0);
  if (v6 == 1) {
    return 1;
  }
  else {
    return ((v6 == -1) << 31 >> 31);
  }
}

void sub_100012880(id a1)
{
  BOOL v51 = (void *)((char *)*(&off_10001D380
                           + (byte_10001ABF0[byte_10001AAF0[(47
                                                                                             * (qword_100020E98 ^ qword_100020EA8 ^ 0xE7))] ^ 0xAD] ^ (47 * (qword_100020E98 ^ qword_100020EA8 ^ 0xE7)))
                           + 14)
                 - 2);
  unsigned __int8 v1 = 47 * (qword_100020E98 ^ *v51 ^ 0xE7);
  unsigned int v52 = (void *)((char *)*(&off_10001D380 + (byte_10001B5F0[byte_10001B4F0[v1] ^ 0xBA] ^ v1) - 67) - 7);
  unint64_t v2 = (*v52 - *v51) ^ (unint64_t)&v55;
  *BOOL v51 = 831087919 * v2 + 0x697FFA56AACEE319;
  *unsigned int v52 = 831087919 * (v2 ^ 0x968005A955311CE7);
  unint64_t v3 = 831087919 * (*v52 ^ *v51 ^ 0x968005A955311CE7);
  uint64_t v49 = (char *)*(&off_10001D380
                + (byte_10001AFF0[byte_10001AEF0[(47
                                                                                  * (qword_100020E98 ^ qword_100020EA8 ^ 0xE7))] ^ 0x5C] ^ (47 * (qword_100020E98 ^ qword_100020EA8 ^ 0xE7)))
                - 42)
      - 2;
  unsigned int v50 = (*(uint64_t (**)(void))&v49[8
                                 * (byte_10001AFF0[byte_10001AEF0[v3] ^ 0x8A] ^ v3)
                                 + 1928])();
  unint64_t v4 = (void *)((char *)*(&off_10001D380
                          + (byte_10001AFF0[byte_10001AEF0[(47 * ((*v52 + *v51) ^ 0xE7))] ^ 0x5C] ^ (47 * ((*v52 + *v51) ^ 0xE7)))
                          - 62)
                - 6);
  uint64_t v41 = (unsigned char *)*v4;
  v62[9] = *(unsigned char *)*v4 - 100;
  v62[10] = v41[1] - 100;
  v62[11] = v41[2] - 100;
  v62[12] = v41[3] - 100;
  v62[13] = v41[4] - 100;
  v62[14] = v41[5] - 100;
  v62[15] = v41[6] - 100;
  v62[16] = v41[7] - 100;
  v62[17] = v41[8] - 100;
  v62[18] = v41[9] - 100;
  v62[19] = v41[10] - 100;
  v62[20] = v41[11] - 100;
  v62[21] = v41[12] - 100;
  v62[22] = v41[13] - 100;
  v62[23] = v41[14] - 100;
  v62[24] = v41[15] - 100;
  unint64_t v5 = 831087919 * (*v52 ^ *v51 ^ 0x968005A955311CE7);
  *(void *)((char *)*(&off_10001D380
                      + (byte_10001AFF0[byte_10001AEF0[(47 * ((*v52 - *v51) ^ 0xE7))] ^ 0x83] ^ (47 * ((*v52 - *v51) ^ 0xE7)))
                      + 7)
            - 7) = (*(uint64_t (**)(void))&v49[8
                                            * (byte_10001AFF0[byte_10001AEF0[v5] ^ 0x39] ^ v5)
                                            + 2448])();
  unsigned __int8 v6 = 47 * ((*v52 - *v51) ^ 0xE7);
  uint64_t v7 = (void *)((char *)*(&off_10001D380 + (byte_10001ADF0[byte_10001ACF0[v6] ^ 0xE7] ^ v6) - 51) - 2);
  uint64_t v42 = (unsigned char *)*v7;
  v60[0] = *(unsigned char *)*v7 - 65;
  v60[1] = v42[1] - 65;
  v60[2] = v42[2] - 65;
  v60[3] = v42[3] - 65;
  v60[4] = v42[4] - 65;
  v60[5] = v42[5] - 65;
  v60[6] = v42[6] - 65;
  v60[7] = v42[7] - 65;
  v60[8] = v42[8] - 65;
  v60[9] = v42[9] - 65;
  v60[10] = v42[10] - 65;
  unint64_t v8 = 831087919 * (*v52 ^ *v51 ^ 0x968005A955311CE7);
  *(void *)((char *)*(&off_10001D380
                      + (byte_10001ADF0[byte_10001ACF0[(47 * ((*v52 + *v51) ^ 0xE7))] ^ 0xE7] ^ (47 * ((*v52 + *v51) ^ 0xE7)))
                      + 5)
            - 2) = (*(uint64_t (**)(void, unsigned char *, void))&v49[8
                                                                          * (byte_10001B5F0[byte_10001B4F0[v8] ^ 0xBA] ^ v8)
                                                                          + 2608])(0, v60, v50);
  unsigned __int8 v9 = 47 * ((*v52 - *v51) ^ 0xE7);
  uint64_t v10 = (void *)((char *)*(&off_10001D380 + (byte_10001B1F0[byte_10001B0F0[v9]] ^ v9) - 25) - 2);
  uint64_t v43 = (unsigned char *)*v10;
  v59[0] = *(unsigned char *)*v10 - 40;
  v59[1] = v43[1] - 40;
  v59[2] = v43[2] - 40;
  v59[3] = v43[3] - 40;
  v59[4] = v43[4] - 40;
  v59[5] = v43[5] - 40;
  v59[6] = v43[6] - 40;
  v59[7] = v43[7] - 40;
  v59[8] = v43[8] - 40;
  v59[9] = v43[9] - 40;
  v59[10] = v43[10] - 40;
  v59[11] = v43[11] - 40;
  unint64_t v11 = 831087919 * ((*v52 + *v51) ^ 0x968005A955311CE7);
  uint64_t v12 = (*(uint64_t (**)(void, unsigned char *, void))&v49[8
                                                               * (byte_10001AFF0[byte_10001AEF0[v11] ^ 0x5C] ^ v11)
                                                               + 2528])(0, v59, v50);
  unsigned __int8 v13 = 47 * (*v52 ^ *v51 ^ 0xE7);
  *(void *)((char *)*(&off_10001D380 + (byte_10001B3F0[byte_10001B2F0[v13] ^ 0xC1] ^ v13) - 157) - 3) = v12;
  unsigned int v14 = (void *)((char *)*(&off_10001D380
                           + (byte_10001AFF0[byte_10001AEF0[(47
                                                                                             * ((*v52 + *v51) ^ 0xE7))] ^ 0x83] ^ (47 * ((*v52 + *v51) ^ 0xE7)))
                           + 19)
                 - 3);
  int v15 = (unsigned char *)*v14;
  v53[0] = *(unsigned char *)*v14 - 16;
  v53[1] = v15[1] - 16;
  v53[2] = v15[2] - 16;
  v53[3] = v15[3] - 16;
  v53[4] = v15[4] - 16;
  v53[5] = v15[5] - 16;
  v53[6] = v15[6] - 16;
  unint64_t v16 = 831087919 * ((*v52 + *v51) ^ 0x968005A955311CE7);
  uint64_t v17 = (*(uint64_t (**)(void, unsigned char *, void))&v49[8
                                                               * (byte_10001AFF0[byte_10001AEF0[v16] ^ 0x3D] ^ v16)
                                                               + 1872])(0, v53, v50);
  unsigned __int8 v18 = 47 * ((*v52 - *v51) ^ 0xE7);
  *(void *)((char *)*(&off_10001D380 + (byte_10001AFF0[byte_10001AEF0[v18] ^ 0x5C] ^ v18) - 44) - 2) = v17;
  unsigned __int8 v19 = 47 * ((*v52 + *v51) ^ 0xE7);
  uint64_t v20 = (void *)((char *)*(&off_10001D380 + (byte_10001ABF0[byte_10001AAF0[v19] ^ 0xF4] ^ v19) - 6)
                 - 6);
  uint64_t v44 = (unsigned char *)*v20;
  v61[0] = *(unsigned char *)*v20 - 113;
  v61[1] = v44[1] - 113;
  v61[2] = v44[2] - 113;
  v61[3] = v44[3] - 113;
  v61[4] = v44[4] - 113;
  v61[5] = v44[5] - 113;
  v61[6] = v44[6] - 113;
  v61[7] = v44[7] - 113;
  unint64_t v21 = 831087919 * ((*v52 + *v51) ^ 0x968005A955311CE7);
  uint64_t v22 = (*(uint64_t (**)(void, unsigned char *, void))&v49[8
                                                               * (byte_10001ABF0[byte_10001AAF0[v21] ^ 0x21] ^ v21)
                                                               + 1952])(0, v61, v50);
  unint64_t v23 = 831087919 * ((*v52 - *v51) ^ 0x968005A955311CE7);
  *(void *)((char *)*(&off_10001D380
                      + (byte_10001AFF0[byte_10001AEF0[v23] ^ 0x8A] ^ v23)
                      - 170)
            - 3) = v22;
  unsigned __int8 v24 = 47 * (*v52 ^ *v51 ^ 0xE7);
  uint64_t v45 = *(unsigned char **)((char *)*(&off_10001D380 + (byte_10001AFF0[byte_10001AEF0[v24] ^ 0x3D] ^ v24) - 110)
                  - 2);
  v57[0] = *v45 - 20;
  v57[1] = v45[1] - 20;
  v57[2] = v45[2] - 20;
  v57[3] = v45[3] - 20;
  v57[4] = v45[4] - 20;
  v57[5] = v45[5] - 20;
  v57[6] = v45[6] - 20;
  v57[7] = v45[7] - 20;
  v57[8] = v45[8] - 20;
  unint64_t v25 = 831087919 * ((*v52 - *v51) ^ 0x968005A955311CE7);
  uint64_t v26 = (*(uint64_t (**)(void, unsigned char *, void))&v49[8
                                                               * (byte_10001AFF0[byte_10001AEF0[v25] ^ 0x5C] ^ v25)
                                                               + 2528])(0, v57, v50);
  unint64_t v27 = 831087919 * (*v52 ^ *v51 ^ 0x968005A955311CE7);
  *(void *)((char *)*(&off_10001D380
                      + (byte_10001AFF0[byte_10001AEF0[v27] ^ 0x3D] ^ v27)
                      - 114)
            - 6) = v26;
  unint64_t v28 = 831087919 * ((*v52 - *v51) ^ 0x968005A955311CE7);
  uint64_t v29 = (void *)((char *)*(&off_10001D380
                           + (byte_10001ABF0[byte_10001AAF0[v28] ^ 0xF4] ^ v28)
                           + 2)
                 - 6);
  uint64_t v46 = (unsigned char *)*v29;
  v62[0] = *(unsigned char *)*v29 - 41;
  v62[1] = v46[1] - 41;
  v62[2] = v46[2] - 41;
  v62[3] = v46[3] - 41;
  v62[4] = v46[4] - 41;
  v62[5] = v46[5] - 41;
  v62[6] = v46[6] - 41;
  v62[7] = v46[7] - 41;
  v62[8] = v46[8] - 41;
  uint64_t v30 = (*(uint64_t (**)(void, unsigned char *, void))&v49[8
                                                               * (byte_10001B1F0[byte_10001B0F0[(47 * ((*(unsigned char *)v52 + *(unsigned char *)v51) ^ 0xE7))]] ^ (47 * ((*(unsigned char *)v52 + *(unsigned char *)v51) ^ 0xE7)))
                                                               + 2856])(0, v62, v50);
  unint64_t v31 = 831087919 * (*v52 ^ *v51 ^ 0x968005A955311CE7);
  *(void *)((char *)*(&off_10001D380
                      + (byte_10001AFF0[byte_10001AEF0[v31] ^ 0x39] ^ v31)
                      - 66)
            - 6) = v30;
  unint64_t v32 = 831087919 * ((*v52 - *v51) ^ 0x968005A955311CE7);
  uint64_t v33 = (void *)((char *)*(&off_10001D380
                           + (byte_10001ABF0[byte_10001AAF0[v32] ^ 0xAD] ^ v32)
                           + 27)
                 - 7);
  uint64_t v47 = (unsigned char *)*v33;
  v58[0] = *(unsigned char *)*v33 - 13;
  v58[1] = v47[1] - 13;
  v58[2] = v47[2] - 13;
  v58[3] = v47[3] - 13;
  v58[4] = v47[4] - 13;
  v58[5] = v47[5] - 13;
  v58[6] = v47[6] - 13;
  v58[7] = v47[7] - 13;
  v58[8] = v47[8] - 13;
  v58[9] = v47[9] - 13;
  v58[10] = v47[10] - 13;
  v58[11] = v47[11] - 13;
  unint64_t v34 = 831087919 * ((*v52 + *v51) ^ 0x968005A955311CE7);
  uint64_t v35 = (*(uint64_t (**)(void, unsigned char *, void))&v49[8
                                                               * (byte_10001B3F0[byte_10001B2F0[v34] ^ 0xC1] ^ v34)
                                                               + 1792])(0, v58, v50);
  unint64_t v36 = 831087919 * ((*v52 - *v51) ^ 0x968005A955311CE7);
  *(void *)((char *)*(&off_10001D380
                      + (byte_10001B3F0[byte_10001B2F0[v36] ^ 0xC1] ^ v36)
                      - 146)
            - 6) = v35;
  uint64_t v48 = *(unsigned char **)((char *)*(&off_10001D380
                            + (byte_10001B1F0[byte_10001B0F0[(47
                                                                                              * ((*v52 + *v51) ^ 0xE7))] ^ 0xFE] ^ (47 * ((*v52 + *v51) ^ 0xE7)))
                            - 92)
                  - 7);
  v56[0] = *v48 - 46;
  v56[1] = v48[1] - 46;
  v56[2] = v48[2] - 46;
  v56[3] = v48[3] - 46;
  v56[4] = v48[4] - 46;
  v56[5] = v48[5] - 46;
  v56[6] = v48[6] - 46;
  v56[7] = v48[7] - 46;
  v56[8] = v48[8] - 46;
  v56[9] = v48[9] - 46;
  unint64_t v37 = 831087919 * ((*v52 - *v51) ^ 0x968005A955311CE7);
  *(void *)((char *)*(&off_10001D380
                      + (byte_10001B1F0[byte_10001B0F0[(47 * (*v52 ^ *v51 ^ 0xE7))] ^ 0xFE] ^ (47 * (*v52 ^ *v51 ^ 0xE7)))
                      - 82)
            - 3) = (*(uint64_t (**)(void, unsigned char *, void))&v49[8
                                                                          * (byte_10001ABF0[byte_10001AAF0[v37] ^ 0xF4] ^ v37)
                                                                          + 3184])(0, v56, v50);
  uint64_t v38 = (void *)((char *)*(&off_10001D380
                           + (byte_10001B1F0[byte_10001B0F0[(47 * (*v52 ^ *v51 ^ 0xE7))]] ^ (47 * (*v52 ^ *v51 ^ 0xE7)))
                           - 7)
                 - 6);
  uint64_t v39 = (unsigned char *)*v38;
  v54[0] = *(unsigned char *)*v38 - 64;
  v54[1] = v39[1] - 64;
  v54[2] = v39[2] - 64;
  v54[3] = v39[3] - 64;
  v54[4] = v39[4] - 64;
  v54[5] = v39[5] - 64;
  v54[6] = v39[6] - 64;
  unint64_t v40 = 831087919 * ((*v52 + *v51) ^ 0x968005A955311CE7);
  *(void *)((char *)*(&off_10001D380
                      + (byte_10001B1F0[byte_10001B0F0[(47 * (*v52 ^ *v51 ^ 0xE7))] ^ 0x7B] ^ (47 * (*v52 ^ *v51 ^ 0xE7)))
                      - 141)
            - 2) = (*(uint64_t (**)(void, unsigned char *, void))&v49[8
                                                                          * (byte_10001AFF0[byte_10001AEF0[v40] ^ 0xEB] ^ v40)
                                                                          + 2936])(0, v54, v50);
}

void xaa3632ca25336dd303b7719ed645ab2e(uint64_t a1)
{
  __asm { BRAA            X0, X17 }
}

uint64_t sub_100013E6C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,int a38)
{
  uint64_t v39 = *(void *)(v38 - 192);
  int v51 = *(_DWORD *)(v38 - 180);
  *(void *)(v38 - 32) = *(void *)(v38 - 200);
  *(_DWORD *)(v38 - 48) = (v51 + 452446428) ^ (688255471 * ((-1 - (a38 | (v38 - 48)) + (a38 & (v38 - 48))) ^ 0xF2B68D79));
  uint64_t v50 = v39;
  (*(void (**)(void))(v39 + 8 * (int)(v51 ^ 0xE5083613)))();
  uint64_t v40 = *(void *)(v38 - 40);
  *(void *)(v38 - 168) = v40;
  *(void *)(v38 - 176) = 0;
  uint64_t v41 = *(uint64_t (**)(void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v50 + 8 * (int)(((v40 == 0) * ((v51 ^ 0xE50837E9) - 141)) ^ (v51 + 452446768)));
  return v41(v41, v42, v43, v44, v45, v46, v47, v48, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27);
}

uint64_t sub_100013F68()
{
  uint64_t v1 = *(void *)(v0 - 192);
  *(void *)(v0 - 40) = *(void *)(v0 - 168);
  *(_DWORD *)(v0 - 48) = v5 + 1764837237 - 900777529 * ((v0 - 48 + (v7 & ~(v0 - 48)) - (v7 & (v0 - 48))) ^ 0x2CA35B5D);
  uint64_t v3 = v1;
  (*(void (**)(void))(v1 + 8 * (v5 + 452446822)))();
  uint64_t v4 = *(void *)(v0 - 32);
  uint64_t result = (*(uint64_t (**)(void))(v3 + 8 * (int)(v5 ^ 0xE5083641)))(*(void *)(v0 - 168));
  *(void *)(v0 - 176) = v4;
  *(void *)(v6 + 16) = *(void *)(v0 - 176);
  return result;
}

void sub_10001481C(int a1)
{
  __asm { BRAA            X0, X17 }
}

uint64_t sub_100014990(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, uint64_t a11, int a12)
{
  uint64_t v12 = *(uint64_t (**)(void, uint64_t, uint64_t, uint64_t))(a11
                                                                    + 8
                                                                    * ((484
                                                                      * ((((a10 & 0x53340000 ^ ((a12 - 2071691395) | 0x694032D0u) ^ 0x609005EACC0EB44)
                                                                         - 1) | a10 & 0x2C0B0000) == 0x609005E1B365994)) ^ a12));
  return v12(v12, a2, a3, a4);
}

uint64_t sub_100014A24()
{
  return v1 + ((v2 - 1048749) & 0xEDD4B2F9 ^ 0x86CDFF6D);
}

void sub_100014A68(id a1)
{
  unsigned __int8 v19 = (void *)((char *)*(&off_10001D380
                           + (byte_10001B3F0[byte_10001B2F0[(47
                                                                                             * ((qword_100020E98
                                                                                               + qword_100020EA0) ^ 0xE7))] ^ 0xCF] ^ (47 * ((qword_100020E98 + qword_100020EA0) ^ 0xE7)))
                           - 124)
                 - 7);
  unsigned __int8 v1 = 47 * ((qword_100020E98 + *v19) ^ 0xE7);
  uint64_t v20 = (void *)((char *)*(&off_10001D380 + (byte_10001AFF0[byte_10001AEF0[v1] ^ 0xEB] ^ v1) - 26) - 7);
  uint64_t v2 = (*v20 ^ *v19) - (void)&v27;
  *unsigned __int8 v19 = 831087919 * v2 + 0x697FFA56AACEE319;
  *uint64_t v20 = 831087919 * (v2 ^ 0x968005A955311CE7);
  unint64_t v3 = 831087919 * (*v20 ^ *v19 ^ 0x968005A955311CE7);
  unint64_t v21 = (char *)*(&off_10001D380
                + (byte_10001ABF0[byte_10001AAF0[(47
                                                                                  * ((qword_100020E98 + qword_100020EA0) ^ 0xE7))] ^ 0x21] ^ (47 * ((qword_100020E98 + qword_100020EA0) ^ 0xE7)))
                - 114)
      - 2;
  unsigned int v22 = (*(uint64_t (**)(void))&v21[8
                                 * (byte_10001ABF0[byte_10001AAF0[v3] ^ 0xF4] ^ v3)
                                 + 3568])();
  uint64_t v4 = *(unsigned char **)((char *)*(&off_10001D380
                           + (byte_10001B1F0[byte_10001B0F0[(47
                                                                                             * ((*v20 - *v19) ^ 0xE7))] ^ 0x7B] ^ (47 * ((*v20 - *v19) ^ 0xE7)))
                           - 126)
                 - 7);
  v24[6] = *v4 - 69;
  v24[7] = v4[1] - 69;
  v24[8] = v4[2] - 69;
  v24[9] = v4[3] - 69;
  v24[10] = v4[4] - 69;
  v24[11] = v4[5] - 69;
  unint64_t v5 = 831087919 * ((*v20 - *v19) ^ 0x968005A955311CE7);
  uint64_t v6 = (*(uint64_t (**)(void))&v21[8 * (byte_10001B5F0[byte_10001B4F0[v5] ^ 0xBA] ^ v5)
                                + 2608])();
  unint64_t v23 = (uint64_t *)((char *)*(&off_10001D380
                            + (byte_10001AFF0[byte_10001AEF0[(47 * (*v20 ^ *v19 ^ 0xE7))] ^ 0x5C] ^ (47 * (*v20 ^ *v19 ^ 0xE7)))
                            - 38)
                  - 6);
  *unint64_t v23 = v6;
  int v7 = (void *)((char *)*(&off_10001D380
                          + (byte_10001B3F0[byte_10001B2F0[(47 * (*v20 ^ *v19 ^ 0xE7))] ^ 0xC1] ^ (47 * (*v20 ^ *v19 ^ 0xE7)))
                          - 135)
                - 7);
  unint64_t v8 = (unsigned char *)*v7;
  v26[0] = *(unsigned char *)*v7 - 100;
  v26[1] = v8[1] - 100;
  v26[2] = v8[2] - 100;
  v26[3] = v8[3] - 100;
  v26[4] = v8[4] - 100;
  v26[5] = v8[5] - 100;
  v26[6] = v8[6] - 100;
  unint64_t v9 = 831087919 * ((*v20 + *v19) ^ 0x968005A955311CE7);
  v23[1] = (*(uint64_t (**)(void, unsigned char *, void))&v21[8
                                                                  * (byte_10001AFF0[byte_10001AEF0[v9] ^ 0x83] ^ v9)
                                                                  + 3264])(0, v26, v22);
  uint64_t v10 = (void *)((char *)*(&off_10001D380
                           + (byte_10001B5F0[byte_10001B4F0[(47 * (*v20 ^ *v19 ^ 0xE7))] ^ 0xD] ^ (47 * (*v20 ^ *v19 ^ 0xE7)))
                           - 173)
                 - 6);
  unint64_t v11 = (unsigned char *)*v10;
  v25[0] = *(unsigned char *)*v10 - 120;
  v25[1] = v11[1] - 120;
  v25[2] = v11[2] - 120;
  v25[3] = v11[3] - 120;
  v25[4] = v11[4] - 120;
  v25[5] = v11[5] - 120;
  unint64_t v12 = 831087919 * ((*v20 + *v19) ^ 0x968005A955311CE7);
  v23[2] = (*(uint64_t (**)(void, unsigned char *, void))&v21[8
                                                                  * (byte_10001ABF0[byte_10001AAF0[v12] ^ 0xAD] ^ v12)
                                                                  + 3104])(0, v25, v22);
  unsigned __int8 v13 = *(unsigned char **)((char *)*(&off_10001D380
                            + (byte_10001B3F0[byte_10001B2F0[(47 * (*v20 ^ *v19 ^ 0xE7))] ^ 0xC1] ^ (47 * (*v20 ^ *v19 ^ 0xE7)))
                            - 152)
                  - 2);
  v24[0] = *v13 - 119;
  v24[1] = v13[1] - 119;
  v24[2] = v13[2] - 119;
  v24[3] = v13[3] - 119;
  v24[4] = v13[4] - 119;
  v24[5] = v13[5] - 119;
  unint64_t v14 = 831087919 * ((*v20 + *v19) ^ 0x968005A955311CE7);
  v23[3] = (*(uint64_t (**)(void, unsigned char *, void))&v21[8
                                                                  * (byte_10001ADF0[byte_10001ACF0[v14] ^ 0xE7] ^ v14)
                                                                  + 2776])(0, v24, v22);
  unint64_t v15 = 831087919 * ((*v20 - *v19) ^ 0x968005A955311CE7);
  unint64_t v16 = (void *)((char *)*(&off_10001D380
                           + (byte_10001ABF0[byte_10001AAF0[v15] ^ 0xAD] ^ v15)
                           + 33)
                 - 3);
  uint64_t v17 = (unsigned char *)*v16;
  v28[0] = *(unsigned char *)*v16 - 44;
  v28[1] = v17[1] - 44;
  v28[2] = v17[2] - 44;
  v28[3] = v17[3] - 44;
  v28[4] = v17[4] - 44;
  v28[5] = v17[5] - 44;
  v28[6] = v17[6] - 44;
  v28[7] = v17[7] - 44;
  v28[8] = v17[8] - 44;
  unint64_t v18 = 831087919 * ((*v20 + *v19) ^ 0x968005A955311CE7);
  v23[4] = (*(uint64_t (**)(void, unsigned char *, void))&v21[8
                                                                  * (byte_10001B3F0[byte_10001B2F0[v18] ^ 0xCF] ^ v18)
                                                                  + 2280])(0, v28, v22);
}

uint64_t x678e8d900cffa24e3508bf7db27bf548(uint64_t a1)
{
  int v9 = *(_DWORD *)(a1 + 32) - 806450243 * ((a1 + ~a1 - (~a1 ^ 0x11B6368F)) ^ 0xE952AFF2);
  uint64_t v1 = 806450243 * ((a1 + ~a1 - (~a1 ^ 0x5DF2162611B6368FLL)) ^ 0x2672652DE952AFF2);
  int v8 = *(_DWORD *)a1 - v1;
  uint64_t v6 = *(void *)(a1 + 8) - v1;
  uint64_t v7 = *(void *)(a1 + 16) ^ v1;
  uint64_t v10 = (char *)*(&off_10001D380 + (int)(v9 ^ 0xC5A30FB2)) - 2;
  uint64_t v11 = (v6 - 0x6D3DD3081B372F28) % (*(int (**)(void))&v10[8 * v9 + 0x1D2E791C8])();
  uint64_t v2 = (*(uint64_t (**)(void, uint64_t, uint64_t, uint64_t, void, uint64_t))&v10[8 * v9 + 0x1D2E79218])(0, v7 - 0x735F614E32555EA6 + v11, 1, 1026, (v8 - 1192932164), v6 - 0x6D3DD3081B372F28 - v11);
  uint64_t result = a1;
  BOOL v4 = v2 == -1;
  uint64_t v5 = v2 + v11;
  if (v4) {
    uint64_t v5 = -1;
  }
  *(void *)(a1 + 24) = v5;
  return result;
}

void x8a96ca947d0744f5e268066a2ed44c15(uint64_t a1)
{
  __asm { BRAA            X0, X17 }
}

uint64_t sub_100015734(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,void *a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  LODWORD(v82) = a71;
  HIDWORD(a41) = a71 + 1692319562;
  uint64_t v80 = a54[2];
  uint64_t v81 = a54[1];
  uint64_t v83 = (*(uint64_t (**)(void, void))(a69 + 8 * (int)(a71 ^ 0x9B2140FC)))(0, a54[3]);
  (*(void (**)(uint64_t, uint64_t))(a69 + 8 * (int)(a71 ^ 0x9B2140E8)))(v81, v80);
  int v71 = *(uint64_t (**)(void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a69 + 8 * ((a71 + 1692319562) ^ (98 * (v83 != 0))));
  HIDWORD(v82) = a71;
  return v71(v71, v72, v73, v74, v75, v76, v77, v78, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34,
           a35,
           a36,
           a37,
           v80,
           v81,
           v83,
           a41,
           a69,
           v82,
           a44,
           a45,
           a46,
           a47,
           a48,
           a49,
           a50,
           a51,
           a52,
           a53,
           a54,
           a55,
           a56,
           a57,
           a58,
           a59,
           a60,
           a61,
           a62,
           a63);
}

uint64_t sub_1000157F8()
{
  return (*(uint64_t (**)())(v2 + 8 * (int)(v1 ^ 0x9B21403B)))();
}

unsigned __int8 *x35039bc6b18b78fd0ec67d9e04460611(unsigned __int8 *result, unsigned __int8 a2, unint64_t a3)
{
  if ((-(char)result & 7u) <= a3) {
    int v3 = -(char)result & 7;
  }
  else {
    int v3 = a3;
  }
  unsigned int v39 = v3;
  BOOL v4 = v3 != 0;
  uint64_t v5 = (v3 - 1);
  if (v5 != 0 && v4)
  {
    uint64_t v7 = v5;
    char v6 = 1;
  }
  else
  {
    uint64_t v7 = v5;
    char v6 = 0;
  }
  uint64_t v40 = result;
  if ((v6 & 1) == 0)
  {
    uint64_t v33 = result;
    unint64_t v34 = result;
    uint64_t v35 = result;
    unint64_t v36 = result;
    unint64_t v37 = result;
    uint64_t v38 = result;
    switch(v7)
    {
      case 0:
        goto LABEL_15;
      case 1:
        goto LABEL_14;
      case 2:
        goto LABEL_13;
      case 3:
        goto LABEL_12;
      case 4:
        goto LABEL_11;
      case 5:
        goto LABEL_10;
      case 6:
        *uint64_t result = a2;
        uint64_t v33 = result + 1;
LABEL_10:
        *uint64_t v33 = a2;
        unint64_t v34 = v33 + 1;
LABEL_11:
        *unint64_t v34 = a2;
        uint64_t v35 = v34 + 1;
LABEL_12:
        *uint64_t v35 = a2;
        unint64_t v36 = v35 + 1;
LABEL_13:
        *unint64_t v36 = a2;
        unint64_t v37 = v36 + 1;
LABEL_14:
        *unint64_t v37 = a2;
        uint64_t v38 = v37 + 1;
LABEL_15:
        *uint64_t v38 = a2;
        uint64_t v40 = v38 + 1;
        break;
      default:
        JUMPOUT(0);
    }
  }
  unint64_t v30 = a3 - v39;
  uint64_t v31 = 0x101010101010101 * a2;
  unint64_t v32 = v40;
  if (v30 >= 8)
  {
    unint64_t v14 = (uint64_t *)v40;
    unint64_t v15 = ((v30 >> 3) + 7) >> 3;
    unint64_t v16 = (uint64_t *)v40;
    unint64_t v17 = v15;
    unint64_t v18 = (uint64_t *)v40;
    unint64_t v19 = v15;
    uint64_t v20 = (uint64_t *)v40;
    unint64_t v21 = v15;
    unsigned int v22 = (uint64_t *)v40;
    unint64_t v23 = v15;
    unsigned __int8 v24 = (uint64_t *)v40;
    unint64_t v25 = v15;
    uint64_t v26 = (uint64_t *)v40;
    unint64_t v27 = v15;
    unint64_t v28 = (uint64_t *)v40;
    unint64_t v29 = v15;
    switch(v15)
    {
      case 1uLL:
        goto LABEL_25;
      case 2uLL:
        goto LABEL_24;
      case 3uLL:
        goto LABEL_23;
      case 4uLL:
        goto LABEL_22;
      case 5uLL:
        goto LABEL_21;
      case 6uLL:
        goto LABEL_20;
      case 7uLL:
        goto LABEL_19;
      default:
        do
        {
          *unint64_t v14 = v31;
          unint64_t v16 = v14 + 1;
          unint64_t v17 = v15;
LABEL_19:
          *unint64_t v16 = v31;
          unint64_t v18 = v16 + 1;
          unint64_t v19 = v17;
LABEL_20:
          *unint64_t v18 = v31;
          uint64_t v20 = v18 + 1;
          unint64_t v21 = v19;
LABEL_21:
          *uint64_t v20 = v31;
          unsigned int v22 = v20 + 1;
          unint64_t v23 = v21;
LABEL_22:
          uint64_t *v22 = v31;
          unsigned __int8 v24 = v22 + 1;
          unint64_t v25 = v23;
LABEL_23:
          *unsigned __int8 v24 = v31;
          uint64_t v26 = v24 + 1;
          unint64_t v27 = v25;
LABEL_24:
          *uint64_t v26 = v31;
          unint64_t v28 = v26 + 1;
          unint64_t v29 = v27;
LABEL_25:
          *unint64_t v28 = v31;
          unint64_t v14 = v28 + 1;
          unint64_t v15 = v29 - 1;
          unint64_t v32 = (unsigned __int8 *)(v28 + 1);
        }
        while (v29 != 1);
        break;
    }
  }
  int v8 = v32;
  int v9 = v32;
  uint64_t v10 = v32;
  uint64_t v11 = v32;
  unint64_t v12 = v32;
  unsigned __int8 v13 = v32;
  switch((unint64_t)v32)
  {
    case 1uLL:
      goto LABEL_33;
    case 2uLL:
      goto LABEL_32;
    case 3uLL:
      goto LABEL_31;
    case 4uLL:
      goto LABEL_30;
    case 5uLL:
      goto LABEL_29;
    case 6uLL:
      goto LABEL_28;
    case 7uLL:
      *unint64_t v32 = a2;
      int v8 = v32 + 1;
LABEL_28:
      *int v8 = a2;
      int v9 = v8 + 1;
LABEL_29:
      unsigned __int8 *v9 = a2;
      uint64_t v10 = v9 + 1;
LABEL_30:
      *uint64_t v10 = a2;
      uint64_t v11 = v10 + 1;
LABEL_31:
      *uint64_t v11 = a2;
      unint64_t v12 = v11 + 1;
LABEL_32:
      *unint64_t v12 = a2;
      unsigned __int8 v13 = v12 + 1;
LABEL_33:
      *unsigned __int8 v13 = a2;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_100017BE4()
{
  return 0;
}

uint64_t sub_100017BEC(const char *a1, uint64_t a2)
{
  int v4 = open(a1, 256);
  if (v4 < 0)
  {
    int v8 = __error();
    int v9 = strerror(*v8);
    syslog(3, "Failed to open macho file at %s for reading: %s", a1, v9);
    return 0;
  }
  else
  {
    int v5 = v4;
    uint64_t v6 = sub_100017C74(v4, (uint64_t)a1, a2);
    close(v5);
    return v6;
  }
}

uint64_t sub_100017C74(int a1, uint64_t a2, uint64_t a3)
{
  __buf[0] = 0;
  memset(&v24, 0, sizeof(v24));
  if (fstat(a1, &v24))
  {
    int v5 = __error();
    strerror(*v5);
    syslog(3, "Failed to stat %s : %s");
    return 0;
  }
  if (v24.st_size <= 8)
  {
    syslog(3, "File at %s is not a valid mach-o (too small to contain a valid header)");
    return 0;
  }
  *__error() = 0;
  if (pread(a1, __buf, 4uLL, 0) != 4)
  {
    uint64_t v7 = __error();
    strerror(*v7);
    syslog(3, "Failed to read magic from %s : %s");
    return 0;
  }
  if (__buf[0] <= -805638659)
  {
    if (__buf[0] != -1095041334 && __buf[0] != -889275714)
    {
      int v6 = -822415874;
      goto LABEL_15;
    }
    fat_header fat_header = 0;
    *__error() = 0;
    if (pread(a1, &fat_header, 8uLL, 0) == 8)
    {
      uint32_t magic = fat_header.magic;
      if (fat_header.magic == -1095041334)
      {
        swap_fat_header(&fat_header, NX_LittleEndian);
        uint32_t magic = fat_header.magic;
      }
      syslog(7, "Got fat header with magic 0x%08x and %u archs", magic, fat_header.nfat_arch);
      if (fat_header.nfat_arch < 0x401)
      {
        size_t v15 = 20 * fat_header.nfat_arch;
        if (v24.st_size > (uint64_t)(v15 + 8))
        {
          unint64_t v14 = (fat_arch *)malloc_type_malloc(20 * fat_header.nfat_arch, 0x50FF23B5uLL);
          if (v15 == pread(a1, v14, v15, 8))
          {
            swap_fat_arch(v14, fat_header.nfat_arch, NX_LittleEndian);
            if (!fat_header.nfat_arch)
            {
LABEL_37:
              uint64_t v8 = 1;
              if (!v14) {
                return v8;
              }
              goto LABEL_28;
            }
            uint64_t v16 = 0;
            unint64_t v17 = v14;
            while (1)
            {
              syslog(7, "Evaluating fat slice with cputype %d; subtype %d; offset %u; size %u; align %u",
                v17->cputype,
                v17->cpusubtype,
                v17->offset,
                v17->size,
                v17->align);
              off_t offset = v17->offset;
              if (v24.st_size <= offset)
              {
                syslog(3, "Fat arch %u in %s specifies offset which is beyond the end of the file");
                goto LABEL_27;
              }
              unint64_t v19 = sub_100018044(a1, offset, v24.st_size);
              if (!v19) {
                break;
              }
              uint64_t v20 = v19;
              char v21 = (*(uint64_t (**)(uint64_t, fat_arch *, char *))(a3 + 16))(a3, v17, v19);
              free(v20);
              if (++v16 < (unint64_t)fat_header.nfat_arch)
              {
                ++v17;
                if (v21) {
                  continue;
                }
              }
              goto LABEL_37;
            }
            syslog(3, "Failed to read macho header and load commands in %s at %u");
          }
          else
          {
            unsigned int v22 = __error();
            strerror(*v22);
            syslog(3, "Failed to read fat archs from %s : %s");
          }
LABEL_27:
          uint64_t v8 = 0;
          if (!v14) {
            return v8;
          }
LABEL_28:
          free(v14);
          return v8;
        }
        syslog(3, "File is not large enough to contain %u fat arch headers and their referenced slices.");
      }
      else
      {
        syslog(3, "Number of fat archs %u exceeds the maximum %u");
      }
    }
    else
    {
      unsigned __int8 v13 = __error();
      strerror(*v13);
      syslog(3, "Failed to read fat header of %s : %s");
    }
    unint64_t v14 = 0;
    goto LABEL_27;
  }
  if ((__buf[0] + 17958194) >= 2)
  {
    int v6 = -805638658;
LABEL_15:
    if (__buf[0] != v6)
    {
      syslog(3, "Unknown binary with magic 0x%08x at %s");
      return 0;
    }
  }
  uint64_t v10 = sub_100018044(a1, 0, v24.st_size);
  if (v10)
  {
    uint64_t v11 = v10;
    (*(void (**)(uint64_t, void, char *))(a3 + 16))(a3, 0, v10);
    free(v11);
    return 1;
  }
  syslog(3, "Failed to read macho header and load commands in %s at %u");
  return 0;
}

char *sub_100018044(int a1, off_t a2, uint64_t a3)
{
  long long __buf = 0u;
  long long v19 = 0u;
  ssize_t v6 = pread(a1, &__buf, 0x20uLL, a2);
  if (v6 < 0)
  {
    int v9 = __error();
    strerror(*v9);
    syslog(3, "Failed to read mach header at offset %lld : %s");
LABEL_26:
    unsigned __int8 v13 = 0;
    goto LABEL_27;
  }
  if (v6 != 28 && v6 != 32)
  {
    syslog(3, "Expected to read at least sizeof(struct mach_header) but only got %zd bytes");
    goto LABEL_26;
  }
  unsigned int v8 = v19;
  unsigned int v7 = DWORD1(v19);
  if ((int)__buf > -17958195)
  {
    if (__buf != -17958194)
    {
      if (__buf == -17958193) {
        goto LABEL_12;
      }
LABEL_23:
      syslog(3, "Unknown magic in macho header at offset %llu: 0x%08x");
      goto LABEL_26;
    }
LABEL_15:
    size_t v10 = 28;
    goto LABEL_16;
  }
  if (__buf == -822415874)
  {
    unsigned int v7 = bswap32(DWORD1(v19));
    unsigned int v8 = bswap32(v19);
    goto LABEL_15;
  }
  if (__buf != -805638658) {
    goto LABEL_23;
  }
  unsigned int v7 = bswap32(DWORD1(v19));
  unsigned int v8 = bswap32(v19);
LABEL_12:
  if (v6 != 32)
  {
    syslog(3, "Got 64-bit magic but didn't read size of 64-bit mach header");
    goto LABEL_26;
  }
  size_t v10 = 32;
LABEL_16:
  size_t v11 = v7;
  if (8 * (unint64_t)v8 > v7)
  {
    syslog(3, "Space required for total size of load commands (%llu) is greater than indicated size of commands (%u).");
    goto LABEL_26;
  }
  if ((uint64_t)(v10 + v7 + a2) >= a3)
  {
    syslog(3, "File is not large enough to contain commands with length %u");
    goto LABEL_26;
  }
  unint64_t v12 = (char *)malloc_type_malloc(v10 + v7, 0xD7630F4AuLL);
  unsigned __int8 v13 = v12;
  if (!v12)
  {
    uint64_t v16 = __error();
    strerror(*v16);
    syslog(3, "Failed to allocate %llu bytes: %s");
    goto LABEL_27;
  }
  memcpy(v12, &__buf, v10);
  ssize_t v14 = pread(a1, &v13[v10], v11, v10 + a2);
  if (v14 < 0)
  {
    unint64_t v17 = __error();
    strerror(*v17);
    syslog(3, "Failed to read %u bytes at offset %lld : %s");
    goto LABEL_27;
  }
  if (v14 != v11)
  {
    syslog(3, "Expected to read %u bytes of commands but only got %zd bytes");
LABEL_27:
    free(v13);
    return 0;
  }
  return v13;
}

uint64_t sub_100018270(const char *a1)
{
  uint64_t v5 = 0;
  ssize_t v6 = &v5;
  uint64_t v7 = 0x2000000000;
  int v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 0x40000000;
  v4[2] = sub_100018338;
  v4[3] = &unk_10001D5D0;
  v4[4] = &v5;
  v4[5] = a1;
  if (sub_100017BEC(a1, (uint64_t)v4))
  {
    uint64_t v2 = *((unsigned int *)v6 + 6);
  }
  else
  {
    syslog(3, "Failed to iterate macho file at %s", a1);
    uint64_t v2 = 0;
  }
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t sub_100018338(uint64_t a1)
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2000000000;
  int v9 = 0;
  dyld_get_image_versions();
  int v2 = *((_DWORD *)v7 + 6);
  if (!v2)
  {
    syslog(3, "Failed to get SDK version from slice in %s", *(const char **)(a1 + 40));
    int v2 = *((_DWORD *)v7 + 6);
  }
  syslog(7, "Slice had version 0x%08x", v2);
  unsigned int v3 = *((_DWORD *)v7 + 6);
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  if (v3 > *(_DWORD *)(v4 + 24)) {
    *(_DWORD *)(v4 + 24) = v3;
  }
  _Block_object_dispose(&v6, 8);
  return 1;
}

uint64_t sub_10001843C(uint64_t result, uint64_t a2, int a3)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a3;
  return result;
}

BOOL sub_10001844C(int a1, int a2, char *a3, int *a4)
{
  if (!a3)
  {
    syslog(3, "Error: Argument pointer must not be null");
    int v12 = 13;
    syslog(3, "Unable to determine CPU type is runnable with error: %d", 13);
    BOOL v9 = 0;
    if (!a4) {
      return v9;
    }
    goto LABEL_12;
  }
  v17[0] = a1;
  v17[1] = a2;
  int v16 = 0;
  size_t v15 = 4;
  int v8 = sysctlbyname("kern.grade_cputype", &v16, &v15, v17, 8uLL);
  BOOL v9 = v8 == 0;
  if (v8)
  {
    size_t v10 = __error();
    size_t v11 = strerror(*v10);
    syslog(3, "Error calling kern.grade_cputype for CPU type 0x%x and subtype 0x%x: %s", a1, a2, v11);
    int v12 = 12;
    syslog(3, "Unable to determine CPU type is runnable with error: %d", 12);
    char v13 = 0;
  }
  else if (v16 >= 1 && a1 == 16777228 && (a2 & 0xFFFFFFu) <= 2)
  {
    syslog(7, "CPU type 0x%x and subtype 0x%x are runnable", 16777228, a2);
    int v12 = 0;
    char v13 = 1;
  }
  else
  {
    syslog(7, "CPU type 0x%x and subtype 0x%x are not runnable", a1, a2);
    int v12 = 0;
    char v13 = 0;
  }
  *a3 = v13;
  if (a4) {
LABEL_12:
  }
    *a4 = v12;
  return v9;
}

BOOL sub_1000185E4(const char *a1, unsigned char *a2, _DWORD *a3)
{
  int v33 = 0;
  char v32 = 0;
  memset(&v31, 0, sizeof(v31));
  int v30 = 0;
  if (!a1)
  {
    int v33 = 1;
    syslog(3, "Input path is NULL");
    goto LABEL_58;
  }
  if (!a2)
  {
    int v33 = 13;
    syslog(3, "Error: Argument pointer must not be null");
    goto LABEL_60;
  }
  int v6 = open(a1, 256);
  if (v6 != -1)
  {
    int v7 = v6;
    if (fstat(v6, &v31) == -1)
    {
      int v12 = *__error();
      int v33 = 3;
      cputype = (char *)a1;
      uint64_t cpusubtype = (uint64_t)strerror(v12);
      BOOL v9 = "Can't stat input file %s: %s";
      goto LABEL_54;
    }
    unint64_t st_size = v31.st_size;
    if (read(v7, &v30, 4uLL) != 4)
    {
      int v13 = *__error();
      int v33 = 5;
      cputype = (char *)a1;
      uint64_t cpusubtype = (uint64_t)strerror(v13);
      BOOL v9 = "Failed to read header for file %s: %s";
      goto LABEL_54;
    }
    if (lseek(v7, 0, 0) == -1)
    {
      int v14 = *__error();
      int v33 = 4;
      cputype = (char *)a1;
      uint64_t cpusubtype = (uint64_t)strerror(v14);
      BOOL v9 = "Can't seek input file %s: %s";
      goto LABEL_54;
    }
    if (st_size >= 8 && v30 == -1095041334)
    {
      *(void *)&fat_header.uint32_t magic = 0;
      if (read(v7, &fat_header, 8uLL) != 8)
      {
        int v16 = *__error();
        int v33 = 5;
        cputype = (char *)a1;
        uint64_t cpusubtype = (uint64_t)strerror(v16);
        BOOL v9 = "Failed to read fat header from input file %s: %s";
        goto LABEL_54;
      }
      swap_fat_header((fat_header *)&fat_header, NX_LittleEndian);
      if (fat_header.cputype >= 0x401u)
      {
        int v33 = 7;
        cputype = (char *)fat_header.cputype;
        uint64_t cpusubtype = 1024;
        BOOL v9 = "Number of fat archs %u exceeds the maximum %u";
LABEL_54:
        int v15 = 3;
        goto LABEL_55;
      }
      size_t v17 = 20 * fat_header.cputype;
      if (v17 + 8 > st_size)
      {
        int v33 = 8;
        cputype = (char *)a1;
        BOOL v9 = "Malformed fat file: %s";
        goto LABEL_54;
      }
      long long v19 = (fat_arch *)malloc_type_malloc(v17, 0x360B8367uLL);
      if (v19)
      {
        if (v17 == read(v7, v19, v17))
        {
          swap_fat_arch(v19, fat_header.cputype, NX_LittleEndian);
          if (fat_header.cputype)
          {
            uint64_t v20 = 0;
            p_uint64_t cpusubtype = &v19->cpusubtype;
            while (sub_10001844C(*(p_cpusubtype - 1), *p_cpusubtype, &v32, &v33))
            {
              if (v32) {
                goto LABEL_64;
              }
              p_cpusubtype += 5;
              if (++v20 >= (unint64_t)fat_header.cputype) {
                goto LABEL_65;
              }
            }
            unint64_t v23 = "Failed to check if cpu type is runnable";
          }
          else
          {
            if (v32)
            {
LABEL_64:
              syslog(7, "FAT matching_arch cpu_type: 0x%x cpu_subtype: 0x%x");
              goto LABEL_56;
            }
LABEL_65:
            cputype = (char *)a1;
            unint64_t v23 = "Failed to find matching arch for FAT input file %s";
          }
        }
        else
        {
          int v24 = *__error();
          int v33 = 6;
          cputype = (char *)a1;
          uint64_t cpusubtype = (uint64_t)strerror(v24);
          unint64_t v23 = "Failed to read fat arch(s) from input file %s: %s";
        }
      }
      else
      {
        int v22 = *__error();
        int v33 = 9;
        cputype = strerror(v22);
        unint64_t v23 = "Failed to allocate memory for fat arch(s): %s";
      }
      syslog(3, v23, cputype, cpusubtype);
LABEL_56:
      free(v19);
      if ((v7 & 0x80000000) == 0) {
        close(v7);
      }
LABEL_58:
      if (!a2) {
        goto LABEL_60;
      }
      goto LABEL_59;
    }
    if (st_size >= 0x1C)
    {
      if (v30 == -17958194 || v30 == -822415874)
      {
        memset(&fat_header, 0, 28);
        if (read(v7, &fat_header, 0x1CuLL) == 28)
        {
          if (v30 == -822415874) {
            swap_mach_header((mach_header *)&fat_header, NX_LittleEndian);
          }
          if (sub_10001844C(fat_header.cputype, fat_header.cpusubtype, &v32, &v33))
          {
            if (!v32)
            {
              cputype = (char *)a1;
              BOOL v9 = "Failed to find matching arch for 32-bit Mach-O input file %s";
              goto LABEL_54;
            }
            cputype = (char *)fat_header.cputype;
            uint64_t cpusubtype = fat_header.cpusubtype;
            BOOL v9 = "32-bit thin matching_arch cpu_type: 0x%x cpu_subtype: 0x%x";
LABEL_27:
            int v15 = 7;
LABEL_55:
            syslog(v15, v9, cputype, cpusubtype);
            long long v19 = 0;
            goto LABEL_56;
          }
          goto LABEL_50;
        }
        goto LABEL_41;
      }
      if (st_size >= 0x20 && (v30 == -17958193 || v30 == -805638658))
      {
        memset(&fat_header, 0, sizeof(fat_header));
        if (read(v7, &fat_header, 0x20uLL) == 32)
        {
          if (v30 == -805638658) {
            swap_mach_header_64(&fat_header, NX_LittleEndian);
          }
          if (sub_10001844C(fat_header.cputype, fat_header.cpusubtype, &v32, &v33))
          {
            if (!v32)
            {
              cputype = (char *)a1;
              BOOL v9 = "Failed to find matching arch for 64-bit Mach-O input file %s";
              goto LABEL_54;
            }
            cputype = (char *)fat_header.cputype;
            uint64_t cpusubtype = fat_header.cpusubtype;
            BOOL v9 = "64-bit thin matching_arch cpu_type: 0x%x cpu_subtype: 0x%x";
            goto LABEL_27;
          }
LABEL_50:
          BOOL v9 = "Failed to check if cpu type is runnable";
          goto LABEL_54;
        }
LABEL_41:
        int v18 = *__error();
        int v33 = 5;
        cputype = (char *)a1;
        uint64_t cpusubtype = (uint64_t)strerror(v18);
        BOOL v9 = "Failed to read mach header from input file %s: %s";
        goto LABEL_54;
      }
    }
    int v33 = 10;
    cputype = (char *)a1;
    BOOL v9 = "Unknown binary format for input file %s.";
    goto LABEL_54;
  }
  int v10 = *__error();
  int v33 = 2;
  size_t v11 = strerror(v10);
  syslog(3, "Can't open input file %s: %s", a1, v11);
LABEL_59:
  *a2 = v32;
LABEL_60:
  int v25 = v33;
  if (a3) {
    *a3 = v33;
  }
  return v25 == 0;
}

void sub_100018B38()
{
  sub_100002CA0();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "    executableName   : %@", v1, 0xCu);
}

void sub_100018BAC(void *a1)
{
  int v1 = [a1 bundleIdentifier];
  sub_100002CA0();
  sub_100002C80((void *)&_mh_execute_header, v2, v3, "    bundleid         : %@", v4, v5, v6, v7, v8);
}

void sub_100018C30(void *a1)
{
  int v1 = [a1 applicationIdentifier];
  sub_100002CA0();
  sub_100002C80((void *)&_mh_execute_header, v2, v3, "    application-id.. : %@", v4, v5, v6, v7, v8);
}

void sub_100018CB4(void *a1)
{
  [a1 isFreeProfileValidated];
  sub_100002C80((void *)&_mh_execute_header, v1, v2, "    Free    validated: %@", v3, v4, v5, v6, 2u);
}

void sub_100018D48(void *a1)
{
  [a1 isUPPValidated];
  sub_100002C80((void *)&_mh_execute_header, v1, v2, "    UPP     validated: %@", v3, v4, v5, v6, 2u);
}

void sub_100018DDC(void *a1)
{
  [a1 isProfileValidated];
  sub_100002C80((void *)&_mh_execute_header, v1, v2, "    profile validated: %@", v3, v4, v5, v6, 2u);
}

void sub_100018E70()
{
  sub_100002CA0();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "    appRecord        : %@", v1, 0xCu);
}

void sub_100018EE4(void *a1)
{
  uint64_t v1 = [a1 applicationIdentifier];
  sub_100002CA0();
  sub_100002C80((void *)&_mh_execute_header, v2, v3, "  Found by           : %@", v4, v5, v6, v7, v8);
}

void sub_100018F68(uint64_t *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v4 = *a1;
  id v5 = [objc_alloc((Class)NSString) initWithData:a2 encoding:4];
  int v6 = 138412546;
  uint64_t v7 = v4;
  __int16 v8 = 2112;
  id v9 = v5;
  _os_log_debug_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_DEBUG, "\n\n%@\n%@\n\n", (uint8_t *)&v6, 0x16u);
}

void sub_10001902C(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Caller not entitled", v1, 2u);
}

void CFRelease(CFTypeRef cf)
{
}

uint64_t MGCopyAnswer()
{
  return _MGCopyAnswer();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

int *__error(void)
{
  return ___error();
}

uint64_t __strlcpy_chk()
{
  return ___strlcpy_chk();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void bzero(void *a1, size_t a2)
{
}

int close(int a1)
{
  return _close(a1);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

uint64_t dyld_get_image_versions()
{
  return _dyld_get_image_versions();
}

void free(void *a1)
{
}

int fstat(int a1, stat *a2)
{
  return _fstat(a1, a2);
}

pid_t getpid(void)
{
  return _getpid();
}

off_t lseek(int a1, off_t a2, int a3)
{
  return _lseek(a1, a2, a3);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
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

void objc_storeStrong(id *location, id obj)
{
}

int open(const char *a1, int a2, ...)
{
  return _open(a1, a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

ssize_t pread(int __fd, void *__buf, size_t __nbyte, off_t a4)
{
  return _pread(__fd, __buf, __nbyte, a4);
}

int proc_pidpath(int pid, void *buffer, uint32_t buffersize)
{
  return _proc_pidpath(pid, buffer, buffersize);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return _read(a1, a2, a3);
}

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

void swap_fat_arch(fat_arch *fat_archs, uint32_t nfat_arch, NXByteOrder target_byte_order)
{
}

void swap_fat_header(fat_header *fat_header, NXByteOrder target_byte_order)
{
}

void swap_mach_header(mach_header *mh, NXByteOrder target_byte_order)
{
}

void swap_mach_header_64(mach_header_64 *mh, NXByteOrder target_byte_order)
{
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return _sysctlbyname(a1, a2, a3, a4, a5);
}

void syslog(int a1, const char *a2, ...)
{
}

id objc_msgSend_applicationIdentifier(void *a1, const char *a2, ...)
{
  return [a1 applicationIdentifier];
}

id objc_msgSend_asDictionary(void *a1, const char *a2, ...)
{
  return [a1 asDictionary];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_currentConnection(void *a1, const char *a2, ...)
{
  return [a1 currentConnection];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_executableURL(void *a1, const char *a2, ...)
{
  return [a1 executableURL];
}

id objc_msgSend_generateDigest(void *a1, const char *a2, ...)
{
  return [a1 generateDigest];
}

id objc_msgSend_infoDictionary(void *a1, const char *a2, ...)
{
  return [a1 infoDictionary];
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return [a1 init];
}

id objc_msgSend_isEntitled(void *a1, const char *a2, ...)
{
  return [a1 isEntitled];
}

id objc_msgSend_isFeatureEnabled(void *a1, const char *a2, ...)
{
  return [a1 isFeatureEnabled];
}

id objc_msgSend_isFreeProfileValidated(void *a1, const char *a2, ...)
{
  return [a1 isFreeProfileValidated];
}

id objc_msgSend_isProfileValidated(void *a1, const char *a2, ...)
{
  return [a1 isProfileValidated];
}

id objc_msgSend_isUPPValidated(void *a1, const char *a2, ...)
{
  return [a1 isUPPValidated];
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return [a1 processIdentifier];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_serviceListener(void *a1, const char *a2, ...)
{
  return [a1 serviceListener];
}