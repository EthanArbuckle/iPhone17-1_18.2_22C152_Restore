uint64_t sub_10000136C(int a1, uint64_t a2, uint64_t a3, void *a4)
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  __CFString *v17;
  int v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v23;
  unsigned int v24;
  void *v25;
  unsigned int v26;
  void *v27;
  unsigned int v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  int v37;
  id *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  __CFString *v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  __CFString *v57;
  id v58;
  void *v59;
  void *v60;
  void *v61;
  NSObject *v62;
  void *v63;
  id v64;
  void *v65;
  NSObject *v66;
  NSObject *v67;
  id v68;
  id v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void v81[4];
  NSObject *v82;
  void v83[4];
  NSObject *v84;
  uint64_t *v85;
  void *v86;
  void v87[4];
  void v88[3];
  void v89[7];
  void v90[7];
  void v91[4];
  NSObject *v92;
  uint64_t *v93;
  void *v94;
  void v95[3];
  char v96;
  void v97[6];
  void v98[6];
  uint64_t v99;
  uint64_t *v100;
  uint64_t v101;
  uint64_t (*v102)(uint64_t, uint64_t);
  void (*v103)(uint64_t);
  id v104;
  uint64_t v105;
  uint64_t *v106;
  uint64_t v107;
  uint64_t (*v108)(uint64_t, uint64_t);
  void (*v109)(uint64_t);
  id v110;
  void v111[5];
  void v112[5];
  void v113[5];
  uint64_t v114;
  uint64_t *v115;
  uint64_t v116;
  char v117;
  uint64_t v118;
  uint64_t *v119;
  uint64_t v120;
  char v121;
  void v122[6];
  uint64_t v123;
  uint64_t *v124;
  uint64_t v125;
  uint64_t (*v126)(uint64_t, uint64_t);
  void (*v127)(uint64_t);
  id v128;
  uint64_t v129;
  uint64_t *v130;
  uint64_t v131;
  uint64_t (*v132)(uint64_t, uint64_t);
  void (*v133)(uint64_t);
  id v134;

  v129 = 0;
  v130 = &v129;
  v131 = 0x3032000000;
  v132 = sub_100002440;
  v133 = sub_100002450;
  v134 = 0;
  v123 = 0;
  v124 = &v123;
  v125 = 0x3032000000;
  v126 = sub_100002440;
  v127 = sub_100002450;
  v128 = 0;
  if (!objc_opt_class())
  {
    v8 = 0;
    v7 = 0;
    v13 = 45;
    goto LABEL_29;
  }
  v7 = objc_opt_new();
  v8 = +[NSString stringWithUTF8String:*a4];
  v122[0] = _NSConcreteStackBlock;
  v122[1] = 3221225472;
  v122[2] = sub_100002458;
  v122[3] = &unk_100008490;
  v122[4] = &v129;
  v122[5] = &v123;
  [v7 installedExtensionWithShortName:v8 synchronous:1 replyHandler:v122];
  v9 = (void *)v124[5];
  if (!v9)
  {
    v14 = [(id)v130[5] attributes];
    v15 = v14;
    if (a1)
    {
      if (a1 == 1)
      {
        v16 = [v14 objectForKeyedSubscript:FSActivateOptionSyntaxKey];
        v17 = @"mount";
        v18 = 2;
        if (v16) {
          goto LABEL_19;
        }
LABEL_16:
        warnx("Filesystem %s does not support operation %s", (const char *)[v8 UTF8String], (const char *)-[__CFString UTF8String](v17, "UTF8String"));
        v13 = 8;
LABEL_28:

        goto LABEL_29;
      }
      if (a1 != 2)
      {
        fprintf(__stderrp, "Internal error, operation type %d unrecognized\n", a1);
        v13 = 22;
        goto LABEL_28;
      }
      v16 = [v14 objectForKeyedSubscript:FSFormatOptionSyntaxKey];
      v17 = @"newfs";
    }
    else
    {
      v16 = [v14 objectForKeyedSubscript:FSCheckOptionSyntaxKey];
      v17 = @"fsck";
    }
    v18 = 1;
    if (v16)
    {
LABEL_19:
      v80 = (void *)v16;
      v118 = 0;
      v119 = &v118;
      v120 = 0x2020000000;
      v121 = 0;
      v114 = 0;
      v115 = &v114;
      v116 = 0x2020000000;
      v117 = 0;
      +[FSTaskOptionsBundle resetOptionEnumeration];
      v113[0] = _NSConcreteStackBlock;
      v113[1] = 3221225472;
      v113[2] = sub_100005780;
      v113[3] = &unk_1000084B8;
      v113[4] = &v118;
      v79 = +[FSTaskOptionsBundle bundleForArguments:a4 count:a3 syntaxDictionary:v80 errorHandler:v113];
      if (!*((unsigned char *)v119 + 24))
      {
        v19 = optind;
        if (a3 - optind == v18)
        {
          if (a1 == 2)
          {
            *((unsigned char *)v115 + 24) = 1;
          }
          else
          {
            *((unsigned char *)v115 + 24) = 1;
            if (a1 == 1)
            {
              v20 = v111;
              v111[0] = _NSConcreteStackBlock;
              v111[1] = 3221225472;
              v21 = sub_100002508;
            }
            else
            {
              v20 = v112;
              v112[0] = _NSConcreteStackBlock;
              v112[1] = 3221225472;
              v21 = sub_1000024E0;
            }
            v20[2] = v21;
            v20[3] = &unk_1000084E0;
            v20[4] = &v114;
            [v79 enumerateOptionsWithBlock:];
          }
          v23 = &a4[v19];
          v78 = +[NSString stringWithUTF8String:*v23];
          v13 = [v15 objectForKeyedSubscript:@"FSSupportsBlockResources"];
          if (v13 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
            v24 = [(id)v13 BOOLValue];
          }
          else {
            v24 = 0;
          }
          v25 = [v15 objectForKeyedSubscript:@"FSSupportsPathURLs"];

          if (v25 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
            v26 = [v25 BOOLValue];
          }
          else {
            v26 = 0;
          }
          if (v24)
          {
            v77 = +[FSBlockDeviceResource proxyResourceForBSDName:v78 writable:*((unsigned __int8 *)v115 + 24)];
            v27 = v25;
          }
          else
          {
            if (!v26)
            {
              warnx("Filesystem %s supports neither Block Device nor PathURL resources.", (const char *)[v8 UTF8String]);
              v13 = 22;
              v27 = v25;
LABEL_87:

              goto LABEL_27;
            }
            v13 = [v15 objectForKeyedSubscript:@"FSRequiresSecurityScopedPathURLResources"];

            if (v13 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
              v28 = [(id)v13 BOOLValue];
            }
            else {
              v28 = 0;
            }
            v29 = +[NSURL fileURLWithPath:v78];
            if (v28) {
              +[FSPathURLResource secureResourceWithURL:v29 readonly:*((unsigned char *)v115 + 24) == 0];
            }
            else {
            v77 = +[FSPathURLResource resourceWithURL:v29];
            }

            v27 = (void *)v13;
          }
          if (a1 == 1)
          {
            v75 = +[NSString stringWithUTF8String:v23[1]];
          }
          else
          {
            v75 = 0;
          }
          v73 = objc_opt_new();
          v105 = 0;
          v106 = &v105;
          v107 = 0x3032000000;
          v108 = sub_100002440;
          v109 = sub_100002450;
          v110 = 0;
          if ((a1 | 2) == 2)
          {
            v30 = +[NSUUID UUID];
            v72 = [v30 fs_containerIdentifier];
          }
          else
          {
            v99 = 0;
            v100 = &v99;
            v101 = 0x3032000000;
            v102 = sub_100002440;
            v103 = sub_100002450;
            v104 = 0;
            v34 = [(id)v130[5] bundleIdentifier];
            v98[0] = _NSConcreteStackBlock;
            v98[1] = 3221225472;
            v98[2] = sub_1000025B8;
            v98[3] = &unk_100008508;
            v98[4] = &v123;
            v98[5] = &v99;
            [v7 probeResourceSync:v77 usingBundle:v34 replyHandler:v98];

            v35 = (void *)v124[5];
            if (v35)
            {
              v36 = [v35 localizedDescription];
              warnx("Probing resource: %s", (const char *)[v36 UTF8String]);

              v37 = 0;
              v72 = 0;
              v13 = 5;
            }
            else
            {
              v72 = [(id)v100[5] containerID];
              v97[0] = _NSConcreteStackBlock;
              v97[1] = 3221225472;
              v97[2] = sub_100002638;
              v97[3] = &unk_100008530;
              v97[4] = &v123;
              v97[5] = &v105;
              [v7 loadResource:v77 shortName:v8 options:v73 synchronousReplyHandler:v97];
              v52 = (void *)v124[5];
              if (v52)
              {
                v53 = [v52 localizedDescription];
                warnx("Loading resource: %s", (const char *)[v53 UTF8String]);

                v13 = (uint64_t)[(id)v124[5] code];
                v37 = 0;
              }
              else
              {
                v37 = 1;
              }
            }
            _Block_object_dispose(&v99, 8);

            if (!v37) {
              goto LABEL_86;
            }
          }
          v71 = v27;
          v95[0] = 0;
          v95[1] = v95;
          v95[2] = 0x2020000000;
          v96 = 0;
          v91[0] = _NSConcreteStackBlock;
          v91[1] = 3221225472;
          v91[2] = sub_1000026B8;
          v91[3] = &unk_100008558;
          v93 = &v123;
          v94 = v95;
          v31 = dispatch_group_create();
          v92 = v31;
          v76 = +[FSMessageReceiver receiverForStandardIO:v91];
          v74 = [v76 getConnection];
          dispatch_group_enter(v31);
          if (a1)
          {
            if (a1 != 2)
            {
              v50 = (void *)v106[5];
              if (!v50 || ![v50 count])
              {
                warnx("Operation did not add any volumes");
                v13 = 22;
LABEL_85:

                _Block_object_dispose(v95, 8);
                v27 = v71;
LABEL_86:
                _Block_object_dispose(&v105, 8);

                goto LABEL_87;
              }
              v32 = [(id)v106[5] objectAtIndexedSubscript:0];
              v51 = [v32 volumeID];
              v87[0] = _NSConcreteStackBlock;
              v87[1] = 3221225472;
              v87[2] = sub_1000027E4;
              v87[3] = &unk_1000085A8;
              v88[1] = &v123;
              v88[0] = v31;
              v88[2] = v95;
              [v7 activateVolume:v51 shortName:v8 options:v79 replyHandler:v87];
              v38 = (id *)v88;

LABEL_65:
              dispatch_group_wait(v31, 0xFFFFFFFFFFFFFFFFLL);
              v39 = (void *)v124[5];
              if (v39)
              {
                v40 = [v39 description];
                warnx("operation exiting with error %s", (const char *)[v40 UTF8String]);

                v13 = (uint64_t)[(id)v124[5] code];
              }
              else
              {
                if (a1 != 1) {
                  goto LABEL_84;
                }
                v69 = +[LiveFSMountClient newClientForProvider:@"com.apple.filesystems.UserFS.FileProvider"];
                v41 = [(id)v106[5] objectAtIndexedSubscript:0];
                v42 = [v41 volumeID];
                v43 = [v42 uuid];
                v70 = [v43 description];

                if (![v75 length])
                {
                  v44 = +[NSString stringWithFormat:@"%@/%@", @"com.apple.filesystems.UserFS.FileProvider", v70];

                  v75 = (void *)v44;
                }
                v45 = [(id)v106[5] objectAtIndexedSubscript:0];
                v46 = [v45 volumeName];

                if (v46)
                {
                  v47 = [(id)v106[5] objectAtIndexedSubscript:0];
                  v48 = [v47 volumeName];
                  v49 = [v48 string];
                }
                else
                {
                  v49 = &stru_1000089A8;
                }
                v54 = [v69 mountVolume:v70 fileSystem:v8 displayName:v49 provider:@"com.apple.filesystems.UserFS.FileProvider" domainError:0 on:v75 how:0 options:&stru_1000089A8];
                v55 = (void *)v124[5];
                v124[5] = v54;

                v56 = v124[5];
                if (v56)
                {
                  v57 = v49;
                  v99 = 0;
                  v100 = &v99;
                  v101 = 0x3032000000;
                  v102 = sub_100002440;
                  v103 = sub_100002450;
                  v104 = 0;
                  v58 = [(id)v124[5] localizedDescription];
                  warnx("Final mount step ended with error: %s", (const char *)[v58 UTF8String]);

                  dispatch_group_enter(v31);
                  v59 = [(id)v106[5] objectAtIndexedSubscript:0];
                  v60 = [v59 volumeID];
                  v61 = objc_opt_new();
                  v83[0] = _NSConcreteStackBlock;
                  v83[1] = 3221225472;
                  v83[2] = sub_100002854;
                  v83[3] = &unk_1000085A8;
                  v85 = &v99;
                  v62 = v31;
                  v84 = v62;
                  v86 = v95;
                  [v7 deactivateVolume:v60 shortName:v8 options:v61 replyHandler:v83];

                  dispatch_group_wait(v62, 0xFFFFFFFFFFFFFFFFLL);
                  v63 = (void *)v100[5];
                  if (v63)
                  {
                    v64 = [v63 localizedDescription];
                    warnx("Final mount step cleanup ended with error: %s", (const char *)[v64 UTF8String]);
                  }
                  v65 = objc_opt_new();
                  v66 = dispatch_group_create();
                  dispatch_group_enter(v66);
                  v81[0] = _NSConcreteStackBlock;
                  v81[1] = 3221225472;
                  v81[2] = sub_1000028C4;
                  v81[3] = &unk_1000085D0;
                  v67 = v66;
                  v82 = v67;
                  [v7 unloadResource:v77 shortName:v8 options:v65 replyHandler:v81];
                  dispatch_group_wait(v67, 0xFFFFFFFFFFFFFFFFLL);
                  v68 = [(id)v124[5] code];

                  _Block_object_dispose(&v99, 8);
                  v13 = (uint64_t)v68;
                  v49 = v57;
                }

                if (!v56) {
LABEL_84:
                }
                  v13 = 0;
              }
              goto LABEL_85;
            }
            v32 = [(id)v130[5] bundleIdentifier];
            v33 = v90;
            v90[0] = _NSConcreteStackBlock;
            v90[1] = 3221225472;
            v90[2] = sub_10000273C;
            v90[3] = &unk_100008580;
            v90[5] = &v123;
            v90[4] = v31;
            v90[6] = v95;
            [v7 formatResource:v77 usingBundle:v32 options:v79 connection:v74 replyHandler:v90];
          }
          else
          {
            v32 = [(id)v130[5] bundleIdentifier];
            v33 = v89;
            v89[0] = _NSConcreteStackBlock;
            v89[1] = 3221225472;
            v89[2] = sub_100002790;
            v89[3] = &unk_100008580;
            v89[5] = &v123;
            v89[4] = v31;
            v89[6] = v95;
            [v7 checkResource:v77 usingBundle:v32 options:v79 connection:v74 replyHandler:v89];
          }
          v38 = (id *)(v33 + 4);
          goto LABEL_65;
        }
        warnx("Argument count %d not equal to expected count %d", a3 - optind, v18);
      }
      v13 = 22;
LABEL_27:
      _Block_object_dispose(&v114, 8);
      _Block_object_dispose(&v118, 8);

      goto LABEL_28;
    }
    goto LABEL_16;
  }
  v10 = [v9 domain];
  if (!v10)
  {
LABEL_14:
    v13 = 22;
    goto LABEL_29;
  }
  v11 = [(id)v124[5] domain];
  if (([NSPOSIXErrorDomain isEqualToString:v11] & 1) == 0)
  {

    goto LABEL_14;
  }
  v12 = [(id)v124[5] code];

  if (v12 == (id)2) {
    v13 = 2;
  }
  else {
    v13 = 22;
  }
LABEL_29:
  _Block_object_dispose(&v123, 8);

  _Block_object_dispose(&v129, 8);
  return v13;
}

void sub_100002388(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,char a63)
{
  _Block_object_dispose(&STACK[0x230], 8);
  _Block_object_dispose(&a63, 8);
  _Block_object_dispose(&STACK[0x260], 8);
  _Block_object_dispose(&STACK[0x308], 8);
  _Block_object_dispose(&STACK[0x328], 8);
  _Block_object_dispose((const void *)(v63 - 216), 8);
  _Block_object_dispose((const void *)(v63 - 168), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100002440(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100002450(uint64_t a1)
{
}

void sub_100002458(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

uint64_t sub_1000024E0(uint64_t result, int a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  if (a2 == 113 || a2 == 110)
  {
    *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 0;
    *a5 = 1;
  }
  return result;
}

uint64_t sub_100002508(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id v6 = v5;
  if (a2 == 111 && v5)
  {
    uint64_t v9 = v5;
    id v5 = [v5 isEqualToString:@"ro"];
    if ((v5 & 1) != 0
      || (id v5 = [v9 isEqualToString:@"rdonly"], (v5 & 1) != 0))
    {
      char v7 = 0;
      id v6 = v9;
LABEL_6:
      *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v7;
      goto LABEL_7;
    }
    id v5 = [v9 isEqualToString:@"rw"];
    id v6 = v9;
    if (v5)
    {
      char v7 = 1;
      goto LABEL_6;
    }
  }
LABEL_7:

  return _objc_release_x1(v5, v6);
}

void sub_1000025B8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  id v8 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  char v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

void sub_100002638(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  id v8 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  char v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

void sub_1000026B8(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v5 = v3;
    sub_100005818();
    id v3 = v5;
  }
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    id v4 = v3;
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
    id v3 = v4;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
}

void sub_10000273C(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  if (v3)
  {
    id v4 = v3;
    sub_100005884();
    id v3 = v4;
  }
}

void sub_100002790(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  if (v3)
  {
    id v4 = v3;
    sub_1000058F0();
    id v3 = v4;
  }
}

void sub_1000027E4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3) {
    sub_100005818();
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
}

void sub_100002854(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
}

void sub_1000028C4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = fskit_std_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      sub_10000596C((uint64_t)v3, v4);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_100002930(uint64_t a1@<X8>)
{
  *(unsigned char *)(*(void *)(a1 + 8) + 24) = 1;
}

uint64_t sub_100002940()
{
  return *(void *)(*(void *)(v0 + 40) + 8) + 40;
}

void sub_100002954()
{
  id v3 = (id *)(*(void *)(*(void *)(v0 + 40) + 8) + 40);
  objc_storeStrong(v3, v1);
}

uint64_t sub_100002980(uint64_t a1)
{
  bzero(from, 0x400uLL);
  uint64_t v2 = *(char **)(a1 + 8);
  id v3 = "/.b/8/";
  if (sub_100003088("/.b/8/", 0))
  {
    if (dword_10000C19C) {
      fprintf(__stderrp, "Default mount %s is not available. Using backup %s.\n", "/.b/8/", "/private/system_data/");
    }
    id v3 = "/private/system_data/";
    if (sub_100003088("/private/system_data/", 0))
    {
      fwrite("Mountpoints not available. Exiting.\n", 0x24uLL, 1uLL, __stderrp);
      return 2;
    }
  }
  id v5 = *(const char **)(a1 + 24);
  if (!v5)
  {
    uint64_t v6 = __stderrp;
    char v7 = "No mnt_opts provided to mount preflight.\n";
    size_t v8 = 41;
LABEL_19:
    fwrite(v7, v8, 1uLL, v6);
LABEL_20:
    fwrite("Failed mount preflight. Exiting.\n", 0x21uLL, 1uLL, __stderrp);
    return 22;
  }
  if (sub_100003088("/sbin/mount_tmpfs", 1))
  {
    fprintf(__stderrp, "Failed to find executable: %s \n");
    goto LABEL_20;
  }
  uint64_t v9 = strdup(v5);
  v10 = strtok(v9, ",");
  if (!v10)
  {
LABEL_18:
    free(v9);
    uint64_t v6 = __stderrp;
    char v7 = "Ramdisk fstab not in expected format.\n";
    size_t v8 = 38;
    goto LABEL_19;
  }
  id v11 = v10;
  while (1)
  {
    size_t v12 = strlen(v11);
    if (v12 >= 6)
    {
      unint64_t v13 = v12;
      if (!strncmp("size=", v11, 5uLL) || v13 >= 0xA && !strncmp("template=", v11, 9uLL)) {
        break;
      }
    }
    id v11 = strtok(0, ",");
    if (!v11) {
      goto LABEL_18;
    }
  }
  v15 = (char *)&v5[v11 - v9];
  *(v15 - 1) = 0;
  free(v9);
  v16 = sub_1000030EC(v15, "size=");
  if (!v16)
  {
    fprintf(__stderrp, "Unexpected mount size %zu\n");
    goto LABEL_20;
  }
  v17 = v16;
  __endptr[0] = 0;
  uint64_t v18 = strtol(v16, __endptr, 0);
  if (__endptr[0] == v17 || *__endptr[0] || (uint64_t v19 = v18, v18 <= 0))
  {
    fprintf(__stderrp, "Unexpected size string: %s\n", v17);
    free(v17);
    goto LABEL_20;
  }
  free(v17);
  v20 = sub_1000030EC(v15, "template=");
  if (v20)
  {
    v21 = v20;
    __strlcpy_chk();
    free(v21);
  }
  uint64_t v22 = v19 << 9;
  if (dword_10000C19C) {
    fprintf(__stdoutp, "Mounting tmpfs volume at tmp location %s\n", v3);
  }
  if ((int)sub_100002F28(v3, v19 << 9) >= 1)
  {
    fprintf(__stderrp, "Initial mount to %s failed with %d\n");
    goto LABEL_53;
  }
  v23 = copyfile_state_alloc();
  copyfile_state_set(v23, 6u, sub_100003004);
  if (copyfile(from, v3, v23, 0x800Fu) < 0)
  {
    v31 = __stderrp;
    v32 = __error();
    strerror(*v32);
    fprintf(v31, "Failed to copy contents from %s to %s with error: %s\n");
    goto LABEL_53;
  }
  copyfile_state_free(v23);
  if (dword_10000C19C) {
    fprintf(__stdoutp, "Mounting tmpfs volume at %s\n", v2);
  }
  uint64_t v4 = sub_100002F28(v2, v22);
  if ((int)v4 >= 1)
  {
    fprintf(__stderrp, "Final mount to %s failed with %d\n");
    goto LABEL_53;
  }
  v24 = copyfile_state_alloc();
  copyfile_state_set(v24, 6u, sub_100003004);
  if (copyfile(v3, v2, v24, 0x800Fu) < 0)
  {
    v33 = __stderrp;
    v34 = __error();
    strerror(*v34);
    fprintf(v33, "Failed to copy contents from %s to %s with error: %s\n");
LABEL_53:
    v35 = __error();
    int v36 = sub_100003AE8(*v35, 0xFFFFFFFF);
    exit(v36);
  }
  copyfile_state_free(v24);
  LODWORD(err) = -1;
  __endptr[0] = "/sbin/umount";
  __endptr[1] = "-f";
  __endptr[2] = v3;
  __endptr[3] = 0;
  if ((sub_100003180(__endptr, &err) & 0x80000000) != 0)
  {
    fprintf(__stderrp, "Failed to execute command %s\n", __endptr[0]);
    v26 = __error();
    int v25 = sub_100003AE8(*v26, 0xFFFFFFFF);
  }
  else
  {
    int v25 = (int)err;
  }
  if (v25)
  {
    v27 = __stderrp;
    v28 = __error();
    fprintf(v27, "Failed to unmount %s (errno %d).\n", v3, *v28);
  }
  if (sub_100003A6C())
  {
    CFErrorRef err = 0;
    if (UMLCreatePrimaryUserLayout())
    {
      puts("UMLCreatePrimaryUserLayout passed without error");
    }
    else
    {
      CFStringRef v29 = CFErrorCopyDescription(err);
      CFIndex Code = CFErrorGetCode(err);
      CFStringGetCString(v29, (char *)__endptr, 256, 0x8000100u);
      fprintf(__stderrp, "Failed to copy user template: %s (%ld).\n", (const char *)__endptr, Code);
      CFRelease(err);
      CFRelease(v29);
    }
  }
  if (dword_10000C19C) {
    sub_1000051E0(0);
  }
  return v4;
}

uint64_t sub_100002F28(char *a1, uint64_t a2)
{
  unsigned int v5 = -1;
  snprintf(__str, 0x40uLL, "%zu", a2);
  v6[0] = "/sbin/mount_tmpfs";
  v6[1] = "-s";
  v6[2] = __str;
  v6[3] = a1;
  v6[4] = 0;
  if ((sub_100003180(v6, &v5) & 0x80000000) == 0) {
    return v5;
  }
  fprintf(__stderrp, "Failed to execute command %s\n", v6[0]);
  uint64_t v4 = __error();
  return sub_100003AE8(*v4, 0xFFFFFFFF);
}

uint64_t sub_100003004(int a1, int a2)
{
  if (a2 == 1 && dword_10000C19C)
  {
    if (a1 == 2)
    {
      fprintf(__stderrp, "Creating %s/\n");
    }
    else if (a1 == 1)
    {
      fprintf(__stderrp, "Copying %s -> %s\n");
    }
  }
  return 0;
}

uint64_t sub_100003088(const char *a1, int a2)
{
  uint64_t result = access(a1, a2);
  if (result)
  {
    uint64_t v4 = __stderrp;
    unsigned int v5 = __error();
    uint64_t v6 = strerror(*v5);
    fprintf(v4, "Failed access check for %s with issue %s\n", a1, v6);
    return *__error();
  }
  return result;
}

char *sub_1000030EC(char *a1, const char *a2)
{
  id v3 = strstr(a1, a2);
  size_t v4 = strlen(a2);
  if (!v3) {
    return 0;
  }
  size_t v5 = v4;
  if (strlen(v3) <= v4) {
    return 0;
  }
  uint64_t v6 = &v3[v5];
  size_t v7 = strcspn(v6, ",");
  if (v7 - 1 > 0x3FE) {
    return 0;
  }
  size_t v8 = v7;
  uint64_t v9 = (char *)malloc_type_calloc(1uLL, v7 + 1, 0xA81E8FAEuLL);
  return strncpy(v9, v6, v8);
}

uint64_t sub_100003180(char **a1, _DWORD *a2)
{
  uint64_t v2 = a1;
  pid_t v48 = 0;
  int v49 = -1;
  posix_spawn_file_actions_t v47 = 0;
  *(void *)v50 = -1;
  if (!a1)
  {
    fwrite("command_argv is NULL\n", 0x15uLL, 1uLL, __stderrp);
    uint64_t v6 = 0;
    *__error() = 22;
LABEL_22:
    uint64_t v27 = 0xFFFFFFFFLL;
    goto LABEL_23;
  }
  if (pipe(v50))
  {
    size_t v4 = __stderrp;
    __error();
    size_t v5 = __error();
    strerror(*v5);
    fprintf(v4, "Failed to create pipe for command output: %d (%s)\n");
LABEL_20:
    uint64_t v2 = 0;
LABEL_21:
    uint64_t v6 = 0;
    goto LABEL_22;
  }
  int v7 = posix_spawn_file_actions_init(&v47);
  if (v7)
  {
    *__error() = v7;
    size_t v8 = __stderrp;
    __error();
    uint64_t v9 = __error();
    strerror(*v9);
    fprintf(v8, "posix_spawn_file_actions_init failed: %d (%s)\n");
    goto LABEL_20;
  }
  int v10 = posix_spawn_file_actions_addclose(&v47, v50[0]);
  if (v10)
  {
    *__error() = v10;
    id v11 = __stderrp;
    __error();
    size_t v12 = __error();
    strerror(*v12);
    fprintf(v11, "posix_spawn_file_actions_addclose output_pipe[0] failed: %d (%s)\n");
    goto LABEL_20;
  }
  int v13 = posix_spawn_file_actions_adddup2(&v47, v50[1], 1);
  if (v13)
  {
    *__error() = v13;
    v14 = __stderrp;
    __error();
    v15 = __error();
    strerror(*v15);
    fprintf(v14, "posix_spawn_file_actions_adddup2 output_pipe[1] failed: %d (%s)\n");
    goto LABEL_20;
  }
  int v16 = posix_spawn_file_actions_addclose(&v47, v50[1]);
  if (v16)
  {
    *__error() = v16;
    v17 = __stderrp;
    __error();
    uint64_t v18 = __error();
    strerror(*v18);
    fprintf(v17, "posix_spawn_file_actions_addclose output_pipe[1] failed: %d (%s)\n");
    goto LABEL_20;
  }
  if (dword_10000C19C)
  {
    fwrite("Executing command: ", 0x13uLL, 1uLL, __stdoutp);
    uint64_t v19 = *v2;
    if (*v2)
    {
      v20 = (const char **)(v2 + 1);
      do
      {
        fprintf(__stdoutp, "%s ", v19);
        v21 = *v20++;
        uint64_t v19 = v21;
      }
      while (v21);
    }
    fputc(10, __stdoutp);
  }
  uint64_t v22 = *v2;
  v23 = _NSGetEnviron();
  int v24 = posix_spawn(&v48, v22, &v47, 0, v2, *v23);
  if (v24)
  {
    *__error() = v24;
    int v25 = __stderrp;
    __error();
    v26 = __error();
    strerror(*v26);
    fprintf(v25, "posix_spawn failed: %d (%s)\n");
    goto LABEL_20;
  }
  close(v50[1]);
  v50[1] = -1;
  v30 = (char **)malloc_type_calloc(0x400uLL, 1uLL, 0x100004077774924uLL);
  if (!v30)
  {
    v37 = __stderrp;
    __error();
    v38 = __error();
    strerror(*v38);
    fprintf(v37, "calloc failed: %d (%s)\n");
    goto LABEL_20;
  }
  uint64_t v2 = v30;
  v31 = fdopen(v50[0], "r");
  if (!v31)
  {
    v39 = __stderrp;
    __error();
    v40 = __error();
    strerror(*v40);
    fprintf(v39, "fdopen failed: %d (%s)\n");
    goto LABEL_21;
  }
  uint64_t v6 = v31;
  size_t v46 = 0;
  if (fgetln(v31, &v46))
  {
    size_t v32 = 0;
    do
    {
      if (v32 >= 1023 - v46) {
        break;
      }
      __strncat_chk();
      v32 += v46;
    }
    while (fgetln(v6, &v46));
  }
  if (ferror(v6))
  {
    v33 = __stderrp;
    int v34 = *__error();
    v35 = __error();
    int v36 = strerror(*v35);
    fprintf(v33, "fgetln failed: %d (%s)\n", v34, v36);
    goto LABEL_22;
  }
  if (fclose(v6))
  {
    v41 = __stderrp;
    __error();
    v42 = __error();
    strerror(*v42);
    fprintf(v41, "fclose failed: %d (%s)\n");
    goto LABEL_21;
  }
  close(v50[0]);
  v50[0] = -1;
  while (waitpid(v48, &v49, 0) < 0)
  {
    if (*__error() != 4)
    {
      v43 = __stderrp;
      __error();
      v44 = __error();
      strerror(*v44);
      fprintf(v43, "waitpid failed: %d (%s)\n");
      goto LABEL_21;
    }
  }
  if (dword_10000C19C) {
    fprintf(__stdoutp, "Command output:\n%s\n", (const char *)v2);
  }
  if ((v49 & 0x7F) == 0x7F) {
    goto LABEL_59;
  }
  if ((v49 & 0x7F) != 0)
  {
    if (a2) {
      *a2 = 0;
    }
    fprintf(__stderrp, "Command signaled: %d\n");
    goto LABEL_63;
  }
  int v45 = BYTE1(v49);
  if (a2) {
    *a2 = BYTE1(v49);
  }
  if (!v45)
  {
LABEL_59:
    uint64_t v27 = 0;
    uint64_t v6 = 0;
    goto LABEL_23;
  }
  fprintf(__stderrp, "Command failed: %d\n");
LABEL_63:
  uint64_t v6 = 0;
  uint64_t v27 = 1;
LABEL_23:
  int v28 = *__error();
  if (v47) {
    posix_spawn_file_actions_destroy(&v47);
  }
  if (v6) {
    fclose(v6);
  }
  if ((v50[0] & 0x80000000) == 0) {
    close(v50[0]);
  }
  if ((v50[1] & 0x80000000) == 0) {
    close(v50[1]);
  }
  if (v2) {
    free(v2);
  }
  *__error() = v28;
  return v27;
}

int *sub_10000375C(_DWORD *a1)
{
  if (!(_BYTE)dword_10000C14C)
  {
    io_registry_entry_t v3 = IORegistryEntryFromPath(kIOMasterPortDefault, "IODeviceTree:/filesystems/fstab");
    if (v3)
    {
      io_object_t v4 = v3;
      CFDataRef CFProperty = (const __CFData *)IORegistryEntryCreateCFProperty(v3, @"os_env_type", kCFAllocatorDefault, 0);
      if (CFProperty)
      {
        CFDataRef v6 = CFProperty;
        v13.length = CFDataGetLength(CFProperty);
        v13.location = 0;
        CFDataGetBytes(v6, v13, (UInt8 *)&dword_10000C148);
        CFRelease(v6);
      }
      IOObjectRelease(v4);
      *a1 = dword_10000C148;
      int BootDevice = APFSContainerGetBootDevice();
      if (!BootDevice)
      {
LABEL_14:
        uint64_t v2 = &dword_10000C14C;
        strcpy((char *)&dword_10000C14C, "/dev/");
        CFStringGetCString(0, (char *)&word_10000C150 + 1, 27, 0x8000100u);
        CFRelease(0);
        return v2;
      }
      int v8 = 5;
      while (1)
      {
        uint64_t v9 = __stderrp;
        int v10 = dword_10000C148 == 1 ? "" : "warning: ";
        id v11 = strerror(BootDevice & 0x3FFF);
        fprintf(v9, "%sfailed to get boot device - %s\n", v10, v11);
        if (dword_10000C148 == 1) {
          break;
        }
        sleep(1u);
        if ((v8 + 1) < 2) {
          break;
        }
        fprintf(__stderrp, "Retrying (%d retries left)...\n", v8);
        int BootDevice = APFSContainerGetBootDevice();
        --v8;
        if (!BootDevice) {
          goto LABEL_14;
        }
      }
    }
    else
    {
      fwrite("failed to get filesystem info\n", 0x1EuLL, 1uLL, __stderrp);
    }
    return 0;
  }
  *a1 = dword_10000C148;
  return &dword_10000C14C;
}

char *sub_100003950()
{
  CFArrayRef theArray = 0;
  uint64_t v0 = &byte_10000C16C;
  if (!byte_10000C16C)
  {
    if ((_BYTE)dword_10000C14C || sub_10000375C(&v7))
    {
      int v1 = APFSVolumeRoleFind();
      if (v1)
      {
        uint64_t v2 = __stderrp;
        if (dword_10000C148 == 1) {
          io_registry_entry_t v3 = "";
        }
        else {
          io_registry_entry_t v3 = "warning: ";
        }
        io_object_t v4 = strerror(v1 & 0x3FFF);
        fprintf(v2, "%sfailed to lookup data volume - %s\n", v3, v4);
      }
      else
      {
        if (CFArrayGetCount(theArray) < 2)
        {
          CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(theArray, 0);
          CFStringGetCString(ValueAtIndex, &byte_10000C16C, 32, 0x8000100u);
          CFRelease(theArray);
          return v0;
        }
        fwrite("found multiple data volumes\n", 0x1CuLL, 1uLL, __stderrp);
        CFRelease(theArray);
      }
    }
    return 0;
  }
  return v0;
}

BOOL sub_100003A6C()
{
  io_registry_entry_t v0 = IORegistryEntryFromPath(kIOMasterPortDefault, "IODeviceTree:/filesystems");
  if (!v0) {
    return 0;
  }
  io_object_t v1 = v0;
  CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(v0, @"e-apfs", kCFAllocatorDefault, 0);
  BOOL v3 = CFProperty != 0;
  if (CFProperty) {
    CFRelease(CFProperty);
  }
  IOObjectRelease(v1);
  return v3;
}

uint64_t sub_100003AE8(unsigned int a1, unsigned int a2)
{
  if (a2 == -1) {
    a2 = sysexit_np();
  }
  if (dword_10000C198) {
    return a1;
  }
  else {
    return a2;
  }
}

void start(int a1, char *const *a2)
{
  __endptr = 0;
  bzero(v65, 0x400uLL);
  io_object_t v4 = 0;
  size_t v5 = 0;
  uint64_t v6 = 0;
  int v7 = 0;
  __s1 = 0;
  int v8 = 0;
  while (1)
  {
    while (1)
    {
      uint64_t v9 = v6;
      int v10 = getopt(a1, a2, "headfFko:rwt:uvP:");
      if (v10 > 96)
      {
        uint64_t v6 = 1;
        switch(v10)
        {
          case 'a':
            continue;
          case 'd':
            dword_10000C190 = 1;
            uint64_t v6 = v9;
            continue;
          case 'e':
            dword_10000C198 = 1;
            uint64_t v6 = v9;
            continue;
          case 'f':
            v7 |= 0x80000u;
            uint64_t v6 = v9;
            continue;
          case 'k':
            v7 |= 0x8000000u;
            uint64_t v6 = v9;
            continue;
          case 'o':
            uint64_t v6 = v9;
            if (*optarg)
            {
              __s1 = sub_1000045E8(__s1, optarg);
              if (strstr(optarg, "union")) {
                v7 |= 0x20u;
              }
              uint64_t v6 = v9;
            }
            continue;
          case 'r':
            v7 |= 1u;
            uint64_t v6 = v9;
            continue;
          case 't':
            if (v4)
            {
              if (dword_10000C198) {
                int v17 = 22;
              }
              else {
                int v17 = 64;
              }
              errx(v17, "only one -t option may be specified.");
            }
            io_object_t v4 = (const char **)makevfslist(optarg);
            size_t v5 = optarg;
            uint64_t v6 = v9;
            continue;
          case 'u':
            v7 |= 0x10000u;
            uint64_t v6 = v9;
            continue;
          case 'v':
            dword_10000C19C = 1;
            uint64_t v6 = v9;
            continue;
          case 'w':
            v7 &= ~1u;
            uint64_t v6 = v9;
            continue;
          default:
            goto LABEL_80;
        }
      }
      if (v10 != 70) {
        break;
      }
      uint64_t v6 = v9;
    }
    if (v10 != 80) {
      break;
    }
    int v11 = strtol(optarg, &__endptr, 10);
    if (__endptr != optarg)
    {
      int v8 = v11;
      BOOL v12 = *__endptr || v11 < 1;
      BOOL v13 = !v12 && v11 < 3;
      uint64_t v6 = v9;
      if (v13) {
        continue;
      }
    }
    if (dword_10000C198) {
      int v14 = 22;
    }
    else {
      int v14 = 64;
    }
    errx(v14, "-P flag requires a valid mount phase number");
  }
  if (v10 != -1) {
    goto LABEL_80;
  }
  int v15 = a1 - optind;
  int v16 = (const char **)&a2[optind];
  if ((v8 - 1) >= 2)
  {
    uint64_t v18 = v5;
    if (!v8) {
      goto LABEL_43;
    }
  }
  else
  {
    dword_10000C194 = v8;
  }
  LODWORD(v9) = 1;
  dword_10000C19C = 1;
  uint64_t v18 = "nonfs";
  io_object_t v4 = (const char **)makevfslist("nonfs");
LABEL_43:
  if (v15 != 2)
  {
    if (v15 != 1)
    {
      if (!v15)
      {
        if (!v9)
        {
          if (!dword_10000C18C) {
            sub_1000051E0(v4);
          }
          exit(0);
        }
        uint64_t v64 = 0;
        if (!setfsent())
        {
          if (*__error()) {
            unsigned int v25 = *__error();
          }
          else {
            unsigned int v25 = 6;
          }
          int v34 = sub_100003AE8(v25, 0xFFFFFFFF);
          errx(v34, "mount: can't get filesystem checklist");
        }
        int v63 = 0;
        int v28 = sub_10000375C(&v63);
        CFStringRef v29 = sub_100003950();
        if (v29)
        {
          fprintf(__stdoutp, "mount: found boot container: %s, data volume: %s env: %u\n", (const char *)v28, v29, v63);
        }
        else
        {
          if (v63 == 1 && dword_10000C194 == 2)
          {
            if (*__error()) {
              unsigned int v38 = *__error();
            }
            else {
              unsigned int v38 = 6;
            }
            int v57 = sub_100003AE8(v38, 0xFFFFFFFF);
            errx(v57, "mount: missing data volume");
          }
          fprintf(__stdoutp, "mount: data volume missing, but not required in env: %u\n", v63);
        }
        v42 = getfsent();
        if (v42)
        {
          v44 = v42;
          int v43 = 0;
          do
          {
            fs_type = v44->fs_type;
            int v46 = strcmp(fs_type, "ro");
            if ((!v46 || !strcmp(fs_type, "rw") || !strcmp(fs_type, "rq"))
              && !checkvfsname(v44->fs_vfstype, v4)
              && !sub_100004724(v44->fs_mntops, "noauto"))
            {
              if ((fs_vfstype = v44->fs_vfstype, strcmp(fs_vfstype, "nfs")) && strcmp(fs_vfstype, "url")
                || !sub_100004724(v44->fs_mntops, "net")
                && v44->fs_spec
                && (fs_file = v44->fs_file) != 0
                && !sub_10000480C(v44->fs_spec, fs_file, 0))
              {
                if ((!dword_10000C194 || v44->fs_passno == dword_10000C194)
                  && (!sub_10000480C(v44->fs_spec, v44->fs_file, &v64) || v46 && (v64 & 1) != 0))
                {
                  fs_spec = v44->fs_spec;
                  if (!strcmp(v44->fs_spec, "ramdisk"))
                  {
                    if (dword_10000C19C) {
                      fwrite("mount: encountered ramdisk\n", 0x1BuLL, 1uLL, __stdoutp);
                    }
                    unsigned int v51 = sub_100002980((uint64_t)v44);
                    if (v51)
                    {
                      int v61 = sub_100003AE8(v51, 0xFFFFFFFF);
                      errx(v61, "mount: failed to setup tmpfs mount");
                    }
                    int v43 = 0;
                  }
                  else
                  {
                    if (v44->fs_passno >= 2
                      && !strcmp(v44->fs_vfstype, "apfs")
                      && !strcmp(v44->fs_type, "rw")
                      && v29
                      && !dword_10000C190
                      && v63 == 1
                      && !strcmp(v29, fs_spec))
                    {
                      int v52 = APFSContainerMigrateMediaKeys();
                      if (v52) {
                        fprintf(__stderrp, "mount: failed to migrate Media Keys, error = %x\n", v52);
                      }
                      else {
                        fwrite("mount: successfully migrated Media Keys\n", 0x28uLL, 1uLL, __stdoutp);
                      }
                    }
                    int v49 = sub_1000048B8();
                    if (v49) {
                      int v43 = v49;
                    }
                  }
                }
              }
            }
            v44 = getfsent();
          }
          while (v44);
        }
        else
        {
          int v43 = 0;
        }
        endfsent();
        if (v8 == 2) {
          sub_100005194();
        }
        exit(v43);
      }
      goto LABEL_80;
    }
    v23 = *v16;
    if (strlen(*v16) >= 0x401)
    {
      if (dword_10000C198) {
        int v24 = 22;
      }
      else {
        int v24 = 65;
      }
      errx(v24, "special file or file system %s too long.", v23);
    }
    if (!realpath_DARWIN_EXTSN(v23, v65))
    {
      v26 = __error();
      int v27 = sub_100003AE8(*v26, 0xFFFFFFFF);
      errx(v27, "%s: invalid special file or file system.", *v16);
    }
    if (!v4)
    {
      if ((v7 & 0x10000) != 0)
      {
        int v41 = sub_10000526C(v65);
        exit(v41);
      }
      v31 = getfsfile(v65);
      if (!v31)
      {
        v31 = getfsspec(v65);
        if (!v31)
        {
          size_t v32 = __error();
          int v33 = sub_100003AE8(*v32, 0xFFFFFFFF);
          errx(v33, "%s: unknown special file or file system.", *v16);
        }
      }
      v53 = v31->fs_type;
      if (strcmp(v53, "ro") && strcmp(v53, "rw") && strcmp(v53, "rq"))
      {
        if (dword_10000C198) {
          int v59 = 22;
        }
        else {
          int v59 = 65;
        }
        errx(v59, "%s has unknown file system type.", *v16);
      }
      if (!strcmp(v31->fs_vfstype, "nfs"))
      {
        if (sub_100004724(v31->fs_mntops, "net"))
        {
          if (dword_10000C198) {
            int v58 = 22;
          }
          else {
            int v58 = 65;
          }
          errx(v58, "%s is owned by the automounter.", *v16);
        }
        if (sub_10000480C(v31->fs_spec, v31->fs_file, 0))
        {
          if (dword_10000C198) {
            int v60 = 37;
          }
          else {
            int v60 = 78;
          }
          errx(v60, "%s is already mounted at %s.", v31->fs_spec, v31->fs_file);
        }
      }
      if (!strcmp(v31->fs_spec, "ramdisk"))
      {
        if (dword_10000C19C) {
          fwrite("Found a ramdisk entry\n", 0x16uLL, 1uLL, __stdoutp);
        }
        int v54 = sub_100002980((uint64_t)v31);
        exit(v54);
      }
      goto LABEL_103;
    }
LABEL_80:
    sub_1000046B8();
  }
  uint64_t v19 = *v16;
  v20 = v16[1];
  size_t v21 = strlen(v20);
  if (v21 >= 0x401)
  {
    if (dword_10000C198) {
      int v22 = 63;
    }
    else {
      int v22 = 65;
    }
    errx(v22, "file system %s too long.", v20);
  }
  if ((v7 & 0x8000000) != 0)
  {
    if ((unint64_t)__strlcpy_chk() >= 0x400)
    {
      if (dword_10000C198) {
        int v30 = 63;
      }
      else {
        int v30 = 65;
      }
      errx(v30, "file system %s too long.", v16[1]);
    }
  }
  else if (v21)
  {
    if (!realpath_DARWIN_EXTSN(v20, v65))
    {
      v35 = __error();
      int v36 = sub_100003AE8(*v35, 0xFFFFFFFF);
      errx(v36, "%s: invalid file system.", v16[1]);
    }
  }
  else
  {
    v7 |= 0x8000000u;
  }
  if (!v4 && strchr((char *)*v16, 58))
  {
    if (sub_10000480C(v19, v65, 0))
    {
      if (dword_10000C198) {
        int v55 = 37;
      }
      else {
        int v55 = 78;
      }
      errx(v55, "%s is already mounted at %s.", v19, v65);
    }
    if ((v7 & 0x10000) == 0)
    {
LABEL_103:
      int v40 = sub_1000048B8();
      exit(v40);
    }
  }
  else if ((v7 & 0x10000) == 0)
  {
    if (!v18)
    {
      if (dword_10000C198) {
        int v37 = 22;
      }
      else {
        int v37 = 64;
      }
      errx(v37, "You must specify a filesystem type with -t.");
    }
    goto LABEL_103;
  }
  if (!sub_100005308(v65))
  {
    if (*__error()) {
      unsigned int v39 = *__error();
    }
    else {
      unsigned int v39 = 2;
    }
    int v56 = sub_100003AE8(v39, 0xFFFFFFFF);
    errx(v56, "unknown special file or file system %s.", *v16);
  }
  goto LABEL_103;
}

char *sub_1000045E8(char *__s, char *__s1)
{
  if (__s)
  {
    if (*__s)
    {
      size_t v4 = strlen(__s);
      size_t v5 = v4 + strlen(__s1) + 2;
      uint64_t v6 = (char *)malloc_type_malloc(v5, 0xBC38757EuLL);
      if (!v6) {
        sub_1000059F8();
      }
      int v7 = v6;
      snprintf(v6, v5, "%s,%s", __s, __s1);
    }
    else
    {
      int v7 = strdup(__s1);
    }
    free(__s);
    return v7;
  }
  else
  {
    return strdup(__s1);
  }
}

void sub_1000046B8()
{
  fprintf(__stderrp, "usage: mount %s %s\n       mount %s\n       mount %s\n", "[-dfFrkuvw] [-o options] [-t external_type]", "special mount_point", "[-adfFrkuvw] [-t external_type]", "[-dfrkuvw] special | mount_point");
  if (dword_10000C198) {
    int v0 = 22;
  }
  else {
    int v0 = 64;
  }
  exit(v0);
}

uint64_t sub_100004724(const char *a1, const char *a2)
{
  uint64_t v2 = a2;
  if (*a2 == 110)
  {
    if (a2[1] == 111)
    {
      uint64_t v2 = a2 + 2;
      int v3 = 0;
    }
    else
    {
      int v3 = 1;
    }
    BOOL v4 = *((unsigned __int8 *)a2 + 1) == 111;
  }
  else
  {
    BOOL v4 = 0;
    int v3 = 1;
  }
  size_t v5 = strdup(a1);
  uint64_t v6 = strtok(v5, ",");
  for (i = 0; v6; uint64_t v6 = strtok(0, ","))
  {
    if (*v6 == 110)
    {
      BOOL v8 = v6[1] == 111;
      v6 += 2 * v8;
      if (v8) {
        unsigned int v9 = v4;
      }
      else {
        unsigned int v9 = v3;
      }
    }
    else
    {
      unsigned int v9 = v3;
    }
    if (!strcasecmp(v6, v2)) {
      uint64_t i = v9;
    }
    else {
      uint64_t i = i;
    }
  }
  free(v5);
  return i;
}

uint64_t sub_10000480C(const char *a1, const char *a2, void *a3)
{
  int v10 = 0;
  int v6 = getmntinfo(&v10, 2);
  if (!v6) {
    sub_100005A2C();
  }
  if (v6 < 1) {
    return 0;
  }
  int v7 = v10;
  uint64_t v8 = v6;
  while (strcmp(v7->f_mntfromname, a1) || strcmp(v7->f_mntonname, a2))
  {
    ++v7;
    if (!--v8) {
      return 0;
    }
  }
  if (a3) {
    *a3 = v7->f_flags;
  }
  return 1;
}

uint64_t sub_1000048B8()
{
  uint64_t v0 = __chkstk_darwin();
  int v3 = v2;
  size_t v5 = v4;
  int v7 = v6;
  unsigned int v9 = v8;
  uint64_t v11 = v10;
  BOOL v12 = (const char *)v0;
  memset(v62, 0, 512);
  memset(&v61, 0, 512);
  int v57 = 0;
  if ((v8 & 0x8000000) != 0)
  {
    if ((unint64_t)__strlcpy_chk() >= 0x400) {
      return 22;
    }
  }
  else if (!realpath_DARWIN_EXTSN(v1, __s))
  {
    if (dword_10000C194 != 2
      || ((size_t v13 = strlen(__s), v13 >= 0xC) ? (v14 = 12) : (v14 = v13), strncmp(__s, "/private/var", v14)))
    {
      warn("realpath %s");
      goto LABEL_88;
    }
    if (mkdir(__s, 0x1C0u))
    {
      warn("mkdir %s");
      goto LABEL_88;
    }
  }
  if (v5) {
    int v15 = v5;
  }
  else {
    int v15 = "";
  }
  if (!v7)
  {
    int v7 = *v15 ? (char *)v15 : "";
    if (*v15) {
      int v15 = "";
    }
  }
  int v16 = strdup(v15);
  int v17 = sub_1000045E8(v16, v7);
  uint64_t v18 = v17;
  if (((bswap32(*(unsigned __int16 *)__s) >> 16) - 12032) | v9 & 0x20) {
    uint64_t v19 = v9;
  }
  else {
    uint64_t v19 = v9 | 0x10000;
  }
  if ((v19 & 0x80000) != 0) {
    uint64_t v18 = sub_1000045E8(v17, "force");
  }
  if (v19) {
    uint64_t v18 = sub_1000045E8(v18, "ro");
  }
  int v58 = 0;
  if ((v19 & 0x10000) != 0)
  {
    uint64_t v18 = sub_1000045E8(v18, "update");
    if ((v19 & 0x100000) == 0)
    {
LABEL_29:
      if ((v19 & 0x80) == 0) {
        goto LABEL_31;
      }
      goto LABEL_30;
    }
  }
  else if ((v19 & 0x100000) == 0)
  {
    goto LABEL_29;
  }
  uint64_t v18 = sub_1000045E8(v18, "nobrowse");
  if ((v19 & 0x80) != 0) {
LABEL_30:
  }
    uint64_t v18 = sub_1000045E8(v18, "protect");
LABEL_31:
  int v55 = strndup(v18, 0x400uLL);
  if ((v19 & 0x8000000) != 0) {
    uint64_t v18 = sub_1000045E8(v18, "nofollow");
  }
  v20 = "/sbin";
  size_t v21 = &off_1000085F8;
  memset(&v56, 0, sizeof(v56));
  do
  {
    snprintf(__str, 0x401uLL, "%s/mount_%s", v20, v12);
    int v22 = stat(__str, &v56);
    if (!v22)
    {
LABEL_39:
      if (v22 || (v3 & 1) != 0) {
        goto LABEL_47;
      }
      goto LABEL_50;
    }
    v23 = *v21++;
    v20 = v23;
  }
  while (v23);
  int v24 = "/System/Library/Filesystems";
  unsigned int v25 = &off_100008610;
  while (1)
  {
    snprintf(__str, 0x401uLL, "%s/%s.fs/%s/mount_%s", v24, v12, "Contents/Resources", v12);
    if (!stat(__str, &v56)) {
      break;
    }
    v26 = *v25++;
    int v24 = v26;
    if (!v26) {
      goto LABEL_39;
    }
  }
  if (v3)
  {
LABEL_47:
    int v58 = 1;
    *(void *)&v62[0] = v12;
    sub_100005524(v55, &v58, (uint64_t)v62, 97);
    int v28 = v58;
    int v29 = v58 + 1;
    *((void *)v62 + v58) = v11;
    uint64_t v30 = (v28 + 2);
    *((void *)v62 + v29) = __s;
    *((void *)v62 + (int)v30) = 0;
    uint64_t result = sub_10000136C(1, v19, v30, v62);
    if (!result || !v3)
    {
      if (!result) {
        return result;
      }
      goto LABEL_50;
    }
    switch(result)
    {
      case 0x2D:
        warnx("FSKit unavailable");
        BOOL v40 = dword_10000C198 == 0;
        unsigned int v41 = 45;
        break;
      case 8:
        warnx("File system named %s unable to mount", v12);
        BOOL v40 = dword_10000C198 == 0;
        unsigned int v41 = 8;
        break;
      case 2:
        warnx("File system named %s not found", v12);
        BOOL v40 = dword_10000C198 == 0;
        unsigned int v41 = 2;
        break;
      default:
        warnx("Unable to invoke task");
        BOOL v40 = dword_10000C198 == 0;
        unsigned int v41 = 22;
        break;
    }
LABEL_95:
    unsigned int v42 = 69;
    goto LABEL_96;
  }
LABEL_50:
  int v58 = 1;
  *(void *)&v62[0] = v12;
  sub_100005524(v18, &v58, (uint64_t)v62, 97);
  int v31 = v58;
  int v32 = v58 + 1;
  *((void *)v62 + v58) = v11;
  uint64_t v33 = (v31 + 2);
  int v58 = v31 + 2;
  *((void *)v62 + v32) = __s;
  *((void *)v62 + (int)v33) = 0;
  if (dword_10000C190)
  {
    printf("exec: mount_%s", v12);
    if ((v31 & 0x80000000) == 0)
    {
      int v34 = (const char **)v62 + 1;
      uint64_t v35 = v33 - 1;
      do
      {
        int v36 = *v34++;
        printf(" %s", v36);
        --v35;
      }
      while (v35);
    }
    putchar(10);
    return 0;
  }
  pid_t v37 = fork();
  if (v37 == -1)
  {
    warn("fork");
    free(v18);
    unsigned int v41 = *__error();
    BOOL v40 = dword_10000C198 == 0;
    unsigned int v42 = 71;
    goto LABEL_96;
  }
  pid_t v38 = v37;
  if (v37)
  {
    free(v18);
    free(v55);
    if (waitpid(v38, &v57, 0) < 0)
    {
      sub_100005A54(&v56);
      return v56.st_dev;
    }
    uint64_t v39 = v57 & 0x7F;
    if (v39 != 127)
    {
      if ((v57 & 0x7F) != 0)
      {
        warnx("%s: %s", __s, sys_siglist[v39]);
        BOOL v40 = dword_10000C198 == 0;
        unsigned int v41 = 4;
        goto LABEL_95;
      }
      if (BYTE1(v57))
      {
        warnx("%s failed with %d", __s, BYTE1(v57));
        if (dword_10000C198) {
          return 4;
        }
        else {
          return BYTE1(v57);
        }
      }
    }
    if (!dword_10000C19C) {
      return 0;
    }
    if ((statfs(__s, &v61) & 0x80000000) == 0)
    {
      sub_10000538C((uint64_t)&v61);
      return 0;
    }
    warn("statfs %s");
LABEL_88:
    unsigned int v52 = *__error();
    LODWORD(result) = sysexit_np();
    if (dword_10000C198) {
      return v52;
    }
    else {
      return result;
    }
  }
  int v43 = "/sbin";
  v44 = &off_1000085F8;
  do
  {
    snprintf(__str, 0x401uLL, "%s/mount_%s", v43, v12);
    *(void *)&v62[0] = __str;
    execv(__str, (char *const *)v62);
    if (*__error() != 2) {
      warn("exec %s for %s", __str, __s);
    }
    int v45 = *v44++;
    int v43 = v45;
  }
  while (v45);
  char v46 = 0;
  posix_spawn_file_actions_t v47 = "/System/Library/Filesystems";
  pid_t v48 = &off_100008610;
  do
  {
    snprintf(__str, 0x401uLL, "%s/%s.fs/%s/mount_%s", v47, v12, "Contents/Resources", v12);
    *(void *)&v62[0] = __str;
    execv(__str, (char *const *)v62);
    if (*__error() == 2)
    {
      if (v46) {
        goto LABEL_80;
      }
LABEL_79:
      int v58 = 1;
      *(void *)&v62[0] = v12;
      sub_100005524(v55, &v58, (uint64_t)v62, 97);
      int v49 = v58;
      int v50 = v58 + 1;
      *((void *)v62 + v58) = v11;
      v49 += 2;
      int v58 = v49;
      *((void *)v62 + v50) = __s;
      *((void *)v62 + v49) = 0;
      goto LABEL_80;
    }
    warn("exec %s for %s", __str, __s);
    if ((v46 & 1) == 0) {
      goto LABEL_79;
    }
LABEL_80:
    unsigned int v51 = *v48++;
    posix_spawn_file_actions_t v47 = v51;
    char v46 = 1;
  }
  while (v51);
  if (*__error() != 2)
  {
    v53 = __error();
    int v54 = sub_100003AE8(*v53, 0xFFFFFFFF);
    exit(v54);
  }
  warn("exec %s for %s", __str, __s);
  unsigned int v41 = *__error();
  BOOL v40 = dword_10000C198 == 0;
  unsigned int v42 = 72;
LABEL_96:
  if (v40) {
    return v42;
  }
  else {
    return v41;
  }
}

void sub_100005194()
{
  __argv[0] = "/System/Library/Filesystems/apfs.fs/apfs_boot_util";
  __argv[1] = "2";
  __argv[2] = 0;
  execv("/System/Library/Filesystems/apfs.fs/apfs_boot_util", __argv);
  uint64_t v0 = __error();
  int v1 = sub_100003AE8(*v0, 0xFFFFFFFF);
  errx(v1, "apfs_boot_util exec failed");
}

uint64_t sub_1000051E0(const char **a1)
{
  size_t v5 = 0;
  uint64_t result = getmntinfo(&v5, 2);
  if (!result) {
    sub_100005A2C();
  }
  if ((int)result >= 1)
  {
    unint64_t v3 = 0;
    uint64_t v4 = 2168 * result;
    do
    {
      uint64_t result = checkvfsname(v5[v3 / 0x878].f_fstypename, a1);
      if (!result) {
        uint64_t result = sub_10000538C((uint64_t)&v5[v3 / 0x878]);
      }
      v3 += 2168;
    }
    while (v4 != v3);
  }
  return result;
}

uint64_t sub_10000526C(const char *a1)
{
  int v2 = sub_100005308(a1);
  if (!v2) {
    sub_100005AA4(a1);
  }
  unint64_t v3 = v2;
  if (!strchr(v2->f_mntfromname, 47)) {
    getfsfile(v3->f_mntonname);
  }

  return sub_1000048B8();
}

statfs *sub_100005308(const char *a1)
{
  int v6 = 0;
  int v2 = getmntinfo(&v6, 2);
  if (v2 < 1) {
    return 0;
  }
  unint64_t v3 = v6;
  uint64_t v4 = v2;
  while (strcmp(v3->f_mntfromname, a1) && strcmp(v3->f_mntonname, a1))
  {
    ++v3;
    if (!--v4) {
      return 0;
    }
  }
  return v3;
}

uint64_t sub_10000538C(uint64_t a1)
{
  int v2 = (const char *)(a1 + 88);
  printf("%s on %s (%s", (const char *)(a1 + 1112), (const char *)(a1 + 88), (const char *)(a1 + 72));
  int v12 = 0;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = xmmword_1000067C4;
  uint64_t v9 = 0;
  if (!getattrlist(v2, &v8, &v10, 0x24uLL, 0) && (BYTE7(v11) & 2) != 0 && (DWORD1(v10) & 0x2000000) != 0) {
    printf(", sealed");
  }
  unsigned int v3 = *(_DWORD *)(a1 + 64) & 0xDFF0F7FF;
  if (v3)
  {
    uint64_t v4 = &dword_100008620;
    do
    {
      if (!*v4) {
        break;
      }
      if ((*v4 & v3) != 0)
      {
        printf(", %s", *((const char **)v4 + 1));
        v3 &= ~*v4;
      }
      v4 += 6;
    }
    while (v3);
  }
  int v5 = *(_DWORD *)(a1 + 2136);
  if (v5)
  {
    int v6 = &dword_100008800;
    do
    {
      if (!*v6) {
        break;
      }
      if ((*v6 & v5) != 0)
      {
        printf(", %s", *((const char **)v6 + 1));
        v5 &= ~*v6;
      }
      v6 += 6;
    }
    while (v5);
  }
  if (*(_DWORD *)(a1 + 56))
  {
    printf(", mounted by ");
    if (getpwuid(*(_DWORD *)(a1 + 56))) {
      printf("%s");
    }
    else {
      printf("%d");
    }
  }
  return puts(")");
}

char *sub_100005524(char *a1, int *a2, uint64_t a3, int a4)
{
  int v7 = *a2;
  __stringp = a1;
  while (1)
  {
    uint64_t result = strsep(&__stringp, ",");
    if (!result) {
      break;
    }
    if (*result)
    {
      if (*result != 45)
      {
        int v9 = v7 + 1;
        *(void *)(a3 + 8 * v7) = "-o";
        goto LABEL_10;
      }
      if (result[1] != 45 || result[2])
      {
        int v9 = v7 + 1;
        *(void *)(a3 + 8 * v7) = result;
        long long v10 = strchr(result, 61);
        if (v10)
        {
          char *v10 = 0;
          uint64_t result = v10 + 1;
LABEL_10:
          *(void *)(a3 + 8 * v9) = result;
          int v9 = v7 + 2;
        }
        int v7 = v9;
        if (v9 >= a4) {
          sub_100005ADC();
        }
      }
    }
  }
  *a2 = v7;
  return result;
}

uint64_t checkvfsname(char *__s1, const char **a2)
{
  int v2 = a2;
  if (a2)
  {
    unsigned int v3 = *a2;
    if (*v2)
    {
      int v5 = v2 + 1;
      while (strcmp(__s1, v3))
      {
        int v6 = *v5++;
        unsigned int v3 = v6;
        if (!v6) {
          goto LABEL_6;
        }
      }
      LOBYTE(v2) = byte_10000C1A0;
    }
    else
    {
LABEL_6:
      LOBYTE(v2) = byte_10000C1A0 ^ 1;
    }
  }
  return v2 & 1;
}

void *makevfslist(char *a1)
{
  if (!a1) {
    return 0;
  }
  int v1 = a1;
  if (strchr(a1, 47)) {
    sub_100005758();
  }
  if (*v1 == 110 && v1[1] == 111)
  {
    v1 += 2;
    byte_10000C1A0 = 1;
  }
  int v2 = 0;
  for (uint64_t i = v1; *i == 44; ++i)
  {
    ++v2;
LABEL_11:
    ;
  }
  if (*i) {
    goto LABEL_11;
  }
  uint64_t v4 = malloc_type_malloc(8 * (v2 + 2), 0x10040436913F5uLL);
  int v5 = v4;
  if (v4)
  {
    *uint64_t v4 = v1;
    int v6 = strchr(v1, 44);
    uint64_t v7 = 1;
    if (v6)
    {
      do
      {
        *int v6 = 0;
        long long v8 = v6 + 1;
        uint64_t v9 = v7 + 1;
        v5[v7] = v8;
        int v6 = strchr(v8, 44);
        uint64_t v7 = v9;
      }
      while (v6);
      uint64_t v7 = v9;
    }
    v5[v7] = 0;
  }
  else
  {
    warn(0);
  }
  return v5;
}

void sub_100005758()
{
  *__error() = 22;
  err(1, "invalid fstype");
}

void sub_100005780(uint64_t a1, void *a2)
{
  sub_100002930(*(void *)(a1 + 32));
  id v4 = v3;
  id v8 = [a2 description];
  int v5 = (const char *)[v8 UTF8String];
  id v6 = v4;
  uint64_t v7 = (const char *)[v6 UTF8String];

  warnx("Error %s parsing '%s'", v5, v7);
}

void sub_100005818()
{
  sub_100002974();
  id v1 = [v0 localizedDescription];
  warnx("Operation ended with error: %s", (const char *)[v1 UTF8String]);

  int v2 = (id *)sub_100002940();

  objc_storeStrong(v2, v3);
}

void sub_100005884()
{
  sub_100002974();
  id v2 = [v1 localizedDescription];
  warnx("Operation ended with error: %s", (const char *)[v2 UTF8String]);

  sub_100002954();
  dispatch_group_leave(*(dispatch_group_t *)(v0 + 32));
  sub_100002930(*(void *)(v0 + 48));
}

void sub_1000058F0()
{
  sub_100002974();
  id v2 = [v1 localizedDescription];
  warnx("%s:%d: Operation ended with error: %s", "invoke_tool_from_fskit_block_invoke_9", 309, (const char *)[v2 UTF8String]);

  sub_100002954();
  dispatch_group_leave(*(dispatch_group_t *)(v0 + 32));
  sub_100002930(*(void *)(v0 + 48));
}

void sub_10000596C(uint64_t a1, NSObject *a2)
{
  int v2 = 136315394;
  id v3 = "invoke_tool_from_fskit_block_invoke_12";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "%s:error:%@", (uint8_t *)&v2, 0x16u);
}

void sub_1000059F8()
{
  int v0 = *__error();
  if (dword_10000C198) {
    int v1 = v0;
  }
  else {
    int v1 = 75;
  }
  err(v1, "failed to allocate memory for arguments");
}

void sub_100005A2C()
{
  int v0 = __error();
  int v1 = sub_100003AE8(*v0, 0xFFFFFFFF);
  err(v1, "getmntinfo");
}

uint64_t sub_100005A54(_DWORD *a1)
{
  warn("waitpid");
  int v2 = *__error();
  uint64_t result = sysexit_np();
  if (dword_10000C198) {
    int v4 = v2;
  }
  else {
    int v4 = result;
  }
  *a1 = v4;
  return result;
}

void sub_100005AA4(const char *a1)
{
  int v2 = __error();
  int v3 = sub_100003AE8(*v2, 0xFFFFFFFF);
  errx(v3, "unknown special file or file system %s.", a1);
}

void sub_100005ADC()
{
  if (dword_10000C198) {
    int v0 = 7;
  }
  else {
    int v0 = 64;
  }
  errc(v0, 7, "too many mount arguments");
}

uint64_t APFSContainerGetBootDevice()
{
  return _APFSContainerGetBootDevice();
}

uint64_t APFSContainerMigrateMediaKeys()
{
  return _APFSContainerMigrateMediaKeys();
}

uint64_t APFSVolumeRoleFind()
{
  return _APFSVolumeRoleFind();
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return _CFArrayGetCount(theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return _CFArrayGetValueAtIndex(theArray, idx);
}

void CFDataGetBytes(CFDataRef theData, CFRange range, UInt8 *buffer)
{
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return _CFDataGetLength(theData);
}

CFStringRef CFErrorCopyDescription(CFErrorRef err)
{
  return _CFErrorCopyDescription(err);
}

CFIndex CFErrorGetCode(CFErrorRef err)
{
  return _CFErrorGetCode(err);
}

void CFRelease(CFTypeRef cf)
{
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return _CFStringGetCString(theString, buffer, bufferSize, encoding);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return _IOObjectRelease(object);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return _IORegistryEntryCreateCFProperty(entry, key, allocator, options);
}

io_registry_entry_t IORegistryEntryFromPath(mach_port_t mainPort, const io_string_t path)
{
  return _IORegistryEntryFromPath(mainPort, path);
}

uint64_t UMLCreatePrimaryUserLayout()
{
  return _UMLCreatePrimaryUserLayout();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

char ***_NSGetEnviron(void)
{
  return __NSGetEnviron();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
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

uint64_t __strncat_chk()
{
  return ___strncat_chk();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

int access(const char *a1, int a2)
{
  return _access(a1, a2);
}

void bzero(void *a1, size_t a2)
{
}

int close(int a1)
{
  return _close(a1);
}

int copyfile(const char *from, const char *to, copyfile_state_t state, copyfile_flags_t flags)
{
  return _copyfile(from, to, state, flags);
}

copyfile_state_t copyfile_state_alloc(void)
{
  return _copyfile_state_alloc();
}

int copyfile_state_free(copyfile_state_t a1)
{
  return _copyfile_state_free(a1);
}

int copyfile_state_set(copyfile_state_t s, uint32_t flag, const void *src)
{
  return _copyfile_state_set(s, flag, src);
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

void endfsent(void)
{
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

int execv(const char *__path, char *const *__argv)
{
  return _execv(__path, __argv);
}

void exit(int a1)
{
}

int fclose(FILE *a1)
{
  return _fclose(a1);
}

FILE *__cdecl fdopen(int a1, const char *a2)
{
  return _fdopen(a1, a2);
}

int ferror(FILE *a1)
{
  return _ferror(a1);
}

char *__cdecl fgetln(FILE *a1, size_t *a2)
{
  return _fgetln(a1, a2);
}

pid_t fork(void)
{
  return _fork();
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return _fprintf(a1, a2);
}

int fputc(int a1, FILE *a2)
{
  return _fputc(a1, a2);
}

void free(void *a1)
{
}

uint64_t fskit_std_log()
{
  return _fskit_std_log();
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return _fwrite(__ptr, __size, __nitems, __stream);
}

int getattrlist(const char *a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  return _getattrlist(a1, a2, a3, a4, a5);
}

fstab *getfsent(void)
{
  return _getfsent();
}

fstab *__cdecl getfsfile(const char *a1)
{
  return _getfsfile(a1);
}

fstab *__cdecl getfsspec(const char *a1)
{
  return _getfsspec(a1);
}

int getmntinfo(statfs **a1, int a2)
{
  return _getmntinfo(a1, a2);
}

int getopt(int a1, char *const a2[], const char *a3)
{
  return _getopt(a1, a2, a3);
}

passwd *__cdecl getpwuid(uid_t a1)
{
  return _getpwuid(a1);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_calloc(count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

int mkdir(const char *a1, mode_t a2)
{
  return _mkdir(a1, a2);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
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

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

int pipe(int a1[2])
{
  return _pipe(a1);
}

int posix_spawn(pid_t *a1, const char *a2, const posix_spawn_file_actions_t *a3, const posix_spawnattr_t *a4, char *const __argv[], char *const __envp[])
{
  return _posix_spawn(a1, a2, a3, a4, __argv, __envp);
}

int posix_spawn_file_actions_addclose(posix_spawn_file_actions_t *a1, int a2)
{
  return _posix_spawn_file_actions_addclose(a1, a2);
}

int posix_spawn_file_actions_adddup2(posix_spawn_file_actions_t *a1, int a2, int a3)
{
  return _posix_spawn_file_actions_adddup2(a1, a2, a3);
}

int posix_spawn_file_actions_destroy(posix_spawn_file_actions_t *a1)
{
  return _posix_spawn_file_actions_destroy(a1);
}

int posix_spawn_file_actions_init(posix_spawn_file_actions_t *a1)
{
  return _posix_spawn_file_actions_init(a1);
}

int printf(const char *a1, ...)
{
  return _printf(a1);
}

int putchar(int a1)
{
  return _putchar(a1);
}

int puts(const char *a1)
{
  return _puts(a1);
}

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return _realpath_DARWIN_EXTSN(a1, a2);
}

int setfsent(void)
{
  return _setfsent();
}

unsigned int sleep(unsigned int a1)
{
  return _sleep(a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return _snprintf(__str, __size, __format);
}

int stat(const char *a1, stat *a2)
{
  return _stat(a1, a2);
}

int statfs(const char *a1, statfs *a2)
{
  return _statfs(a1, a2);
}

int strcasecmp(const char *a1, const char *a2)
{
  return _strcasecmp(a1, a2);
}

char *__cdecl strchr(char *__s, int __c)
{
  return _strchr(__s, __c);
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

size_t strcspn(const char *__s, const char *__charset)
{
  return _strcspn(__s, __charset);
}

char *__cdecl strdup(const char *__s1)
{
  return _strdup(__s1);
}

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
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

char *__cdecl strndup(const char *__s1, size_t __n)
{
  return _strndup(__s1, __n);
}

char *__cdecl strsep(char **__stringp, const char *__delim)
{
  return _strsep(__stringp, __delim);
}

char *__cdecl strstr(char *__s1, const char *__s2)
{
  return _strstr(__s1, __s2);
}

char *__cdecl strtok(char *__str, const char *__sep)
{
  return _strtok(__str, __sep);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return _strtol(__str, __endptr, __base);
}

uint64_t sysexit_np()
{
  return _sysexit_np();
}

pid_t waitpid(pid_t a1, int *a2, int a3)
{
  return _waitpid(a1, a2, a3);
}

void warn(const char *a1, ...)
{
}

void warnx(const char *a1, ...)
{
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return [a1 UUID];
}

id objc_msgSend_attributes(void *a1, const char *a2, ...)
{
  return [a1 attributes];
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

id objc_msgSend_containerID(void *a1, const char *a2, ...)
{
  return [a1 containerID];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_getConnection(void *a1, const char *a2, ...)
{
  return [a1 getConnection];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return [a1 localizedDescription];
}

id objc_msgSend_resetOptionEnumeration(void *a1, const char *a2, ...)
{
  return [a1 resetOptionEnumeration];
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return [a1 string];
}

id objc_msgSend_uuid(void *a1, const char *a2, ...)
{
  return [a1 uuid];
}

id objc_msgSend_volumeID(void *a1, const char *a2, ...)
{
  return [a1 volumeID];
}

id objc_msgSend_volumeName(void *a1, const char *a2, ...)
{
  return [a1 volumeName];
}