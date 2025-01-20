void start()
{
  MOXPCTransportOpen();
  MOXPCTransportSetMessageHandler();
  MOXPCTransportResume();
  dispatch_main();
}

void sub_100000E60(id a1, OS_xpc_object *a2, __CFDictionary *a3)
{
  v4 = a2;
  v6 = a3;
  v7 = [(__CFDictionary *)v6 objectForKeyedSubscript:@"command"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v9 = 0xFFFFFFFFLL;
LABEL_8:
    v20 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/MobileCheckpoint/checkpointd.m"];
    v21 = [v20 lastPathComponent];

    id v22 = +[NSString stringWithFormat:@"%@:%d: unknown command %d", v21, 437, v9];
    syslog(5, "%s", (const char *)[v22 UTF8String]);

    v23 = v19;
LABEL_9:
LABEL_10:
    v24 = +[NSDictionary dictionary];
    goto LABEL_11;
  }
  id v8 = [v7 intValue];
  if (v8 == 1)
  {
    v26 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/MobileCheckpoint/checkpointd.m"];
    v27 = [v26 lastPathComponent];

    id v28 = +[NSString stringWithFormat:@"%@:%d: shutting down...", v27, 427];
    syslog(5, "%s", (const char *)[v28 UTF8String]);

    dispatch_time_t v29 = dispatch_time(0, 2000000000);
    dispatch_after(v29, (dispatch_queue_t)&_dispatch_main_q, &stru_100058270);
    goto LABEL_10;
  }
  uint64_t v9 = (uint64_t)v8;
  if (v8) {
    goto LABEL_8;
  }
  v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/MobileCheckpoint/checkpointd.m"];
  v12 = [v11 lastPathComponent];

  id v13 = +[NSString stringWithFormat:@"%@:%d: rebuilding checkpoint", v12, 401];
  syslog(5, "%s", (const char *)[v13 UTF8String]);

  v15 = +[NSMutableDictionary dictionary];
  uint64_t v16 = +[NSMutableDictionary dictionaryWithContentsOfFile:@"/System/Library/CoreServices/Checkpoint.xml"];
  if (!v16)
  {
    v31 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/MobileCheckpoint/checkpointd.m"];
    [v31 lastPathComponent];
    v33 = v32 = v14;

    id v34 = +[NSString stringWithFormat:@"%@:%d: failed to create dictionary from %s", v33, 339, "/System/Library/CoreServices/Checkpoint.xml"];
    syslog(5, "%s", (const char *)[v34 UTF8String]);

    v23 = v32;
    goto LABEL_9;
  }
  v17 = (void *)v16;
  uint64_t v18 = +[FigCheckpointSupport makeDictionary];
  context = v14;
  v145 = v7;
  v143 = (void *)v18;
  if (v18)
  {
    [v17 addEntriesFromDictionary:v18];
  }
  else
  {
    v36 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/MobileCheckpoint/checkpointd.m"];
    v37 = [v36 lastPathComponent];

    id v38 = +[NSString stringWithFormat:@"%@:%d: no checkpoint info from EmbeddedMedia", v37, 348];
    syslog(5, "%s", (const char *)[v38 UTF8String]);
  }
  [v17 setObject:v15 forKeyedSubscript:@"__removals__"];
  id v39 = v17;
  v40 = (void *)MGCopyAnswer();
  v41 = v40;
  if (v40) {
    unsigned int v42 = [v40 intValue];
  }
  else {
    unsigned int v42 = -1;
  }

  long long v161 = 0u;
  long long v162 = 0u;
  LOBYTE(v161) = v42 == 5;
  BYTE1(v161) = v42 == 3;
  BYTE2(v161) = v42 == 1;
  v43 = (void *)MGCopyAnswer();
  v44 = v43;
  if (v43) {
    BOOL v45 = [v43 intValue] != 0;
  }
  else {
    BOOL v45 = 0;
  }

  BYTE6(v161) = v45;
  v46 = (void *)MGCopyAnswer();
  v47 = v46;
  if (v46) {
    BOOL v48 = (int)[v46 intValue] > 1;
  }
  else {
    BOOL v48 = 0;
  }

  BYTE7(v161) = v48;
  v49 = (void *)MGCopyAnswer();
  v50 = v49;
  if (v49) {
    BOOL v51 = [v49 intValue] != 0;
  }
  else {
    BOOL v51 = 0;
  }

  BYTE8(v161) = v51;
  if (v42 == 1)
  {
    BOOL v52 = 1;
  }
  else
  {
    v53 = (void *)MGCopyAnswer();
    v54 = v53;
    if (v53) {
      BOOL v52 = [v53 intValue] != 0;
    }
    else {
      BOOL v52 = 0;
    }
  }
  BYTE9(v161) = v52;
  v55 = (void *)MGCopyAnswer();
  v56 = v55;
  if (v55) {
    unsigned int v57 = [v55 intValue];
  }
  else {
    unsigned int v57 = 0;
  }

  HIDWORD(v161) = v57;
  v58 = (void *)MGCopyAnswer();
  v59 = v58;
  if (v58) {
    unsigned int v60 = [v58 intValue];
  }
  else {
    unsigned int v60 = -1;
  }

  LODWORD(v162) = v60;
  BYTE3(v161) = v60 == 5;
  BYTE4(v161) = v60 == 8;
  BYTE5(v161) = v60 == 9;
  CFStringRef v61 = (const __CFString *)MGCopyAnswer();
  if (v61)
  {
    CFStringRef v62 = v61;
    v163.length = CFStringGetLength(v61);
    v163.location = 0;
    CFStringGetBytes(v62, v163, 0x600u, 0, 0, (UInt8 *)&v162 + 4, 10, 0);
    CFRelease(v62);
    if (BYTE4(v162))
    {
      v63 = +[NSString stringWithCString:(char *)&v162 + 4 encoding:1];
      [v39 setObject:v63 forKeyedSubscript:@"MinITunesVersion"];
    }
  }
  if (BYTE6(v161)) {
    [v39 setObject:&__kCFBooleanTrue forKeyedSubscript:@"SupportsCarrierBundleInstall"];
  }
  obuint64_t j = v15;
  if (!(_BYTE)v161)
  {
    uint64_t v153 = 0;
    sub_10001B944((uint64_t)&v153 + 4, (uint64_t)&v153);
    if (v64)
    {
      uint64_t v65 = v64;
      v67 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/MobileCheckpoint/checkpointd.m"];
      [v67 lastPathComponent];
      v69 = id v68 = v39;

      id v70 = +[NSString stringWithFormat:@"%@:%d: Can't get stuff: %d", v69, 120, v65, v143, context];
      syslog(5, "%s", (const char *)[v70 UTF8String]);

      id v39 = v68;
    }
    else
    {
      v71 = +[NSNumber numberWithInt:HIDWORD(v153)];
      [v39 setObject:v71 forKeyedSubscript:@"FairPlayDeviceType"];

      v72 = +[NSNumber numberWithInt:v153];
      [v39 setObject:v72 forKeyedSubscript:@"KeyTypeSupportVersion"];
    }
    sub_1000334F0();
    if (v73)
    {
      uint64_t v74 = v73;
      v76 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/MobileCheckpoint/checkpointd.m"];
      [v76 lastPathComponent];
      v78 = id v77 = v39;

      id v79 = +[NSString stringWithFormat:@"%@:%d: Can't get CB stuff: %d", v78, 127, v74];
      syslog(5, "%s", (const char *)[v79 UTF8String]);

      id v39 = v77;
    }
    else
    {
      v80 = +[NSNumber numberWithInt:0];
      [v39 setObject:v80 forKeyedSubscript:@"FairPlayCBMinVersion"];

      v81 = +[NSNumber numberWithInt:0];
      [v39 setObject:v81 forKeyedSubscript:@"FairPlayCBMaxVersion"];
    }
  }
  if (HIDWORD(v161))
  {
    v82 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:");
    [v39 setObject:v82 forKeyedSubscript:@"FamilyID"];
  }
  uint64_t v83 = MGCopyAnswer();
  if (v83)
  {
    v84 = (void *)v83;
    [v39 setObject:v83 forKeyedSubscript:@"ScreenWidth"];
  }
  uint64_t v85 = MGCopyAnswer();
  if (v85)
  {
    v86 = (void *)v85;
    [v39 setObject:v85 forKeyedSubscript:@"ScreenHeight"];
  }
  uint64_t v87 = MGCopyAnswer();
  if (v87)
  {
    v88 = (void *)v87;
    [v39 setObject:v87 forKeyedSubscript:@"ScreenScaleFactor"];
  }
  if (BYTE1(v161))
  {
    [v39 setObject:&off_10005DEA0 forKeyedSubscript:@"HomeScreenIconWidth"];
    [v39 setObject:&off_10005DEA0 forKeyedSubscript:@"HomeScreenIconHeight"];
    v89 = &off_10005DE70;
  }
  else
  {
    [v39 setObject:&off_10005DE40 forKeyedSubscript:@"HomeScreenIconWidth"];
    [v39 setObject:&off_10005DE40 forKeyedSubscript:@"HomeScreenIconHeight"];
    v89 = &off_10005DE88;
    if (!BYTE3(v161))
    {
      if (BYTE4(v161) | BYTE5(v161)) {
        v90 = &off_10005DE70;
      }
      else {
        v90 = &off_10005DE88;
      }
      goto LABEL_63;
    }
  }
  v90 = &off_10005DE58;
LABEL_63:
  [v39 setObject:v90 forKeyedSubscript:@"HomeScreenIconRows"];
  [v39 setObject:&off_10005DE88 forKeyedSubscript:@"HomeScreenIconColumns"];
  [v39 setObject:v89 forKeyedSubscript:@"HomeScreenIconDockMaxCount"];
  if (BYTE1(v161))
  {
    sub_100002204(v39, @"AlbumArt", @"3001");
    v91 = @"3002";
    v92 = v39;
    v93 = @"AlbumArt";
  }
  else
  {
    sub_100002204(v39, @"AlbumArt", @"3013");
    sub_100002204(v39, @"AlbumArt", @"3018");
    sub_100002204(v39, @"AlbumArt", @"3019");
    sub_100002204(v39, @"AlbumArt", @"3020");
    sub_100002204(v39, @"AlbumArt", @"3021");
    v93 = @"ChapterImageSpecs";
    v92 = v39;
    v91 = @"3013";
  }
  sub_100002204(v92, v93, v91);
  if (BYTE7(v161)) {
    v94 = @"3001";
  }
  else {
    v94 = @"3101";
  }
  if (BYTE7(v161)) {
    v95 = @"3002";
  }
  else {
    v95 = @"3102";
  }
  if (BYTE7(v161)) {
    v96 = @"3005";
  }
  else {
    v96 = @"3105";
  }
  if (BYTE7(v161)) {
    v97 = @"3006";
  }
  else {
    v97 = @"3106";
  }
  if (BYTE7(v161)) {
    v98 = @"3007";
  }
  else {
    v98 = @"3107";
  }
  if (BYTE7(v161)) {
    v99 = @"3012";
  }
  else {
    v99 = @"3112";
  }
  sub_100002204(v39, @"AlbumArt", v94);
  sub_100002204(v39, @"AlbumArt", v95);
  sub_100002204(v39, @"AlbumArt", v96);
  sub_100002204(v39, @"AlbumArt", v97);
  sub_100002204(v39, @"AlbumArt", v98);
  sub_100002204(v39, @"ChapterImageSpecs", v99);
  sub_100002204(v39, @"ChapterImageSpecs", v96);
  v146 = v6;
  v147 = v5;
  v148 = v4;
  if (BYTE7(v161))
  {
    v100 = @"4040";
    v101 = @"4032";
    v102 = @"3041";
    v103 = @"3034";
    v104 = @"4036";
    v105 = obj;
    if (BYTE1(v161))
    {
      v106 = @"4035";
      goto LABEL_96;
    }
    v106 = @"4140";
    v107 = @"4132";
    v108 = @"4037";
    goto LABEL_94;
  }
  v105 = obj;
  if (!BYTE1(v161))
  {
    sub_100002204(v39, @"ImageSpecifications", @"4040");
    v100 = @"4140";
    v101 = @"4132";
    v102 = @"4131";
    v103 = @"3141";
    v104 = @"3143";
    v106 = @"4037";
    v107 = @"4035";
    v108 = @"4032";
LABEL_94:
    sub_100002204(v39, @"ImageSpecifications", v108);
    goto LABEL_95;
  }
  v100 = @"4140";
  v101 = @"4132";
  v102 = @"4131";
  v103 = @"3141";
  v104 = @"3143";
  v106 = @"4037";
  v107 = @"4036";
LABEL_95:
  sub_100002204(v39, @"ImageSpecifications", v107);
LABEL_96:
  sub_100002204(v39, @"ImageSpecifications", v106);
  sub_100002204(v39, @"ImageSpecifications", v104);
  sub_100002204(v39, @"ImageSpecifications", v103);
  sub_100002204(v39, @"ImageSpecifications", v102);
  sub_100002204(v39, @"ImageSpecifications", v101);
  sub_100002204(v39, @"ImageSpecifications", v100);
  if (!BYTE8(v161))
  {
    v109 = [v39 objectForKeyedSubscript:@"ImageSpecifications"];
    v110 = v109;
    if (v109)
    {
      v111 = (char *)[v109 count];
      if (v111)
      {
        v112 = v111;
        id v113 = v39;
        v114 = 0;
        v115 = 0;
        do
        {
          v116 = v115;
          v115 = [v110 objectAtIndex:v114];

          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [v115 removeObjectForKey:@"PreserveSourceColorSpace"];
          }
          ++v114;
        }
        while (v112 != v114);

        id v39 = v113;
        v105 = obj;
      }
      [v39 setObject:v110 forKeyedSubscript:@"ImageSpecifications"];
    }
  }
  if (BYTE9(v161)) {
    [v39 setObject:&__kCFBooleanTrue forKeyedSubscript:@"Ringtones"];
  }
  v117 = dlopen("/System/Library/Frameworks/UIKit.framework/UIKit", 1);
  if (!v117)
  {
    v121 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/MobileCheckpoint/checkpointd.m"];
    v122 = [v121 lastPathComponent];

    +[NSString stringWithFormat:@"%@:%d: couldn't dlopen UIKit", v122, 322];
LABEL_114:
    id v124 = objc_claimAutoreleasedReturnValue();
    syslog(5, "%s", (const char *)[v124 UTF8String]);

    goto LABEL_117;
  }
  v118 = (void (*)(void))dlsym(v117, "UIKeyboardGetSupportedInputModes");
  if (!v118)
  {
    v123 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/MobileCheckpoint/checkpointd.m"];
    v122 = [v123 lastPathComponent];

    +[NSString stringWithFormat:@"%@:%d: couldn't look up UIKeyboardGetSupportedInputModes", v122, 319];
    goto LABEL_114;
  }
  v119 = v118();
  if (v119)
  {
    [v39 setObject:v119 forKeyedSubscript:@"SupportedKeyboards"];
  }
  else
  {
    v126 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/MobileCheckpoint/checkpointd.m"];
    v127 = [v126 lastPathComponent];

    id v128 = +[NSString stringWithFormat:@"%@:%d: UIKeyboardGetSupportedInputModes returned NULL", v127, 316];
    syslog(5, "%s", (const char *)[v128 UTF8String]);
  }

LABEL_117:
  long long v159 = 0u;
  long long v160 = 0u;
  timeval v157 = (timeval)0;
  long long v158 = 0u;
  id obja = v105;
  id v150 = [obja countByEnumeratingWithState:&v157 objects:&v156 count:16];
  if (v150)
  {
    uint64_t v149 = *(void *)v158;
    do
    {
      for (i = 0; i != v150; i = (char *)i + 1)
      {
        if (*(void *)v158 != v149) {
          objc_enumerationMutation(obja);
        }
        uint64_t v130 = *(void *)(*(void *)&v157.tv_usec + 8 * i);
        v131 = [obja objectForKeyedSubscript:v130];
        v132 = v39;
        v133 = [v39 objectForKeyedSubscript:v130];
        v134 = +[NSMutableArray array];
        uint64_t v135 = (uint64_t)[v133 count];
        if (v135 >= 1)
        {
          uint64_t v136 = v135;
          for (uint64_t j = 0; j < v136; j += 2)
          {
            v138 = [v133 objectAtIndex:j];
            if (([v131 containsObject:v138] & 1) == 0)
            {
              [v134 addObject:v138];
              v139 = [v133 objectAtIndex:j + 1];
              [v134 addObject:v139];
            }
          }
        }
        id v39 = v132;
        [v132 setObject:v134 forKey:v130];
      }
      id v150 = [obja countByEnumeratingWithState:&v157 objects:&v156 count:16];
    }
    while (v150);
  }

  [v39 removeObjectForKey:@"__removals__"];
  id v140 = v39;

  v141 = +[NSPropertyListSerialization dataWithPropertyList:v140 format:200 options:0 error:0];
  v5 = v147;
  v4 = v148;
  v6 = v146;
  if ([v141 writeToFile:@"/var/mobile/Library/Caches/Checkpoint.plist.tmp" atomically:1])
  {
    memset(&v156, 0, sizeof(v156));
    if (!stat("/System/Library/CoreServices/Checkpoint.xml", &v156))
    {
      v157.tv_sec = v156.st_mtimespec.tv_sec;
      *(&v157.tv_usec + 1) = 0;
      v157.tv_usec = SLODWORD(v156.st_mtimespec.tv_nsec) / 1000;
      *(void *)&long long v158 = v156.st_mtimespec.tv_sec;
      *((void *)&v158 + 1) = (SLODWORD(v156.st_mtimespec.tv_nsec) / 1000);
      if (!utimes("/var/mobile/Library/Caches/Checkpoint.plist.tmp", &v157)) {
        rename((const std::__fs::filesystem::path *)"/var/mobile/Library/Caches/Checkpoint.plist.tmp", (const std::__fs::filesystem::path *)"/var/mobile/Library/Caches/Checkpoint.plist", v142);
      }
    }
  }
  CFStringRef v154 = @"checkpoint";
  id v155 = v140;
  v24 = +[NSDictionary dictionaryWithObjects:&v155 forKeys:&v154 count:1];

  v7 = v145;
  if (!v24) {
    goto LABEL_10;
  }
LABEL_11:
  MOXPCTransportSendMessageOnConnection();
}

void sub_100002164(id a1)
{
  v2 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/MobileCheckpoint/checkpointd.m"];
  v3 = [v2 lastPathComponent];

  id v4 = +[NSString stringWithFormat:@"%@:%d: done", v3, 430];
  syslog(5, "%s", (const char *)[v4 UTF8String]);

  exit(0);
}

void sub_100002204(void *a1, void *a2, void *a3)
{
  id v10 = a1;
  id v5 = a2;
  id v6 = a3;
  v7 = [v10 objectForKeyedSubscript:@"__removals__"];
  id v8 = [v7 objectForKeyedSubscript:v5];

  if (!v8)
  {
    id v8 = +[NSMutableSet set];
    uint64_t v9 = [v10 objectForKeyedSubscript:@"__removals__"];
    [v9 setObject:v8 forKeyedSubscript:v5];
  }
  [v8 addObject:v6];
}

void *sub_1000022E8(void *result)
{
  *result = ++qword_100060390;
  return result;
}

uint64_t sub_100002304(mach_port_t a1, int a2, int *a3, uint64_t a4, int a5, _OWORD *a6, void *a7, _DWORD *a8, _DWORD *a9, _DWORD *a10, _DWORD *a11, _DWORD *a12)
{
  int v30 = 1;
  uint64_t v31 = a4;
  int v32 = 16777472;
  int v33 = a5;
  NDR_record_t v34 = NDR_record;
  int v17 = *a3;
  int v35 = a2;
  int v36 = v17;
  int v37 = a5;
  mach_port_t reply_port = mig_get_reply_port();
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = reply_port;
  msg.msgh_bits = -2147478253;
  *(void *)&msg.msgh_voucher_port = 0x4B000000000;
  if (&_voucher_mach_msg_set)
  {
    voucher_mach_msg_set(&msg);
    mach_port_t reply_port = msg.msgh_local_port;
  }
  uint64_t v19 = mach_msg(&msg, 3, 0x40u, 0xDCu, reply_port, 0, 0);
  uint64_t v20 = v19;
  if ((v19 - 268435458) <= 0xE && ((1 << (v19 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(msg.msgh_local_port);
  }
  else
  {
    if (!v19)
    {
      if (msg.msgh_id == 71)
      {
        uint64_t v20 = 4294966988;
      }
      else if (msg.msgh_id == 1300)
      {
        if ((msg.msgh_bits & 0x80000000) != 0)
        {
          uint64_t v20 = 4294966996;
          if (v30 == 2
            && msg.msgh_size == 212
            && !msg.msgh_remote_port
            && HIBYTE(v32) == 1
            && HIWORD(v35) << 16 == 1114112)
          {
            int v21 = v33;
            if (v33 == v47)
            {
              uint64_t v20 = 0;
              int v22 = *(_DWORD *)&v34.mig_vers;
              *a3 = v38;
              long long v23 = v46;
              a6[6] = v45;
              a6[7] = v23;
              long long v24 = v44;
              a6[4] = v43;
              a6[5] = v24;
              long long v25 = v40;
              *a6 = v39;
              a6[1] = v25;
              long long v26 = v42;
              a6[2] = v41;
              a6[3] = v26;
              *a7 = v31;
              *a8 = v21;
              int v27 = v49;
              *a9 = v48;
              *a10 = v27;
              *a11 = v50;
              *a12 = v22;
              return v20;
            }
          }
        }
        else if (msg.msgh_size == 36)
        {
          uint64_t v20 = 4294966996;
          if (HIDWORD(v31))
          {
            if (msg.msgh_remote_port) {
              uint64_t v20 = 4294966996;
            }
            else {
              uint64_t v20 = HIDWORD(v31);
            }
          }
        }
        else
        {
          uint64_t v20 = 4294966996;
        }
      }
      else
      {
        uint64_t v20 = 4294966995;
      }
      mach_msg_destroy(&msg);
      return v20;
    }
    mig_dealloc_reply_port(msg.msgh_local_port);
  }
  return v20;
}

uint64_t sub_100002560(mach_port_t a1, unsigned int a2, long long *a3)
{
  long long v4 = a3[5];
  long long v19 = a3[4];
  long long v20 = v4;
  long long v5 = a3[7];
  long long v21 = a3[6];
  long long v22 = v5;
  long long v6 = a3[1];
  long long v15 = *a3;
  long long v16 = v6;
  long long v7 = a3[3];
  long long v17 = a3[2];
  NDR_record_t v13 = NDR_record;
  unsigned int v14 = a2;
  long long v18 = v7;
  mach_port_t reply_port = mig_get_reply_port();
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = reply_port;
  msg.msgh_bits = 5395;
  *(void *)&msg.msgh_voucher_port = 0x4B100000000;
  if (&_voucher_mach_msg_set)
  {
    voucher_mach_msg_set(&msg);
    mach_port_t reply_port = msg.msgh_local_port;
  }
  uint64_t v9 = mach_msg(&msg, 3, 0xA4u, 0x2Cu, reply_port, 0, 0);
  uint64_t v10 = v9;
  if ((v9 - 268435458) <= 0xE && ((1 << (v9 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(msg.msgh_local_port);
    return v10;
  }
  if (v9)
  {
    mig_dealloc_reply_port(msg.msgh_local_port);
    return v10;
  }
  if (msg.msgh_id == 71)
  {
    uint64_t v10 = 4294966988;
LABEL_17:
    mach_msg_destroy(&msg);
    return v10;
  }
  if (msg.msgh_id != 1301)
  {
    uint64_t v10 = 4294966995;
    goto LABEL_17;
  }
  uint64_t v10 = 4294966996;
  if ((msg.msgh_bits & 0x80000000) != 0) {
    goto LABEL_17;
  }
  if (msg.msgh_size != 36) {
    goto LABEL_17;
  }
  if (msg.msgh_remote_port) {
    goto LABEL_17;
  }
  uint64_t v10 = v14;
  if (v14) {
    goto LABEL_17;
  }
  return v10;
}

uint64_t sub_1000026F0(mach_port_t a1, int a2, int a3, int a4, _OWORD *a5, uint64_t a6, int a7, _OWORD *a8, void *a9, _DWORD *a10)
{
  int v18 = 1;
  uint64_t v19 = a6;
  int v20 = 16777472;
  int v21 = a7;
  NDR_record_t v22 = NDR_record;
  *(_DWORD *)long long v23 = a2;
  *(_DWORD *)&v23[4] = a3;
  *(_DWORD *)&v23[8] = a4;
  *(_OWORD *)&v23[12] = *a5;
  int v24 = a7;
  mach_port_t reply_port = mig_get_reply_port();
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = reply_port;
  msg.msgh_bits = -2147478253;
  *(void *)&msg.msgh_voucher_port = 0x4B200000000;
  if (&_voucher_mach_msg_set)
  {
    voucher_mach_msg_set(&msg);
    mach_port_t reply_port = msg.msgh_local_port;
  }
  uint64_t v13 = mach_msg(&msg, 3, 0x54u, 0x50u, reply_port, 0, 0);
  uint64_t v14 = v13;
  if ((v13 - 268435458) <= 0xE && ((1 << (v13 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(msg.msgh_local_port);
  }
  else
  {
    if (!v13)
    {
      if (msg.msgh_id == 71)
      {
        uint64_t v14 = 4294966988;
      }
      else if (msg.msgh_id == 1302)
      {
        if ((msg.msgh_bits & 0x80000000) != 0)
        {
          uint64_t v14 = 4294966996;
          if (v18 == 1 && msg.msgh_size == 72 && !msg.msgh_remote_port && HIBYTE(v20) == 1)
          {
            int v15 = v21;
            if (v21 == *(_DWORD *)&v23[16])
            {
              uint64_t v14 = 0;
              *a8 = *(_OWORD *)v23;
              *a9 = v19;
              *a10 = v15;
              return v14;
            }
          }
        }
        else if (msg.msgh_size == 36)
        {
          uint64_t v14 = 4294966996;
          if (HIDWORD(v19))
          {
            if (msg.msgh_remote_port) {
              uint64_t v14 = 4294966996;
            }
            else {
              uint64_t v14 = HIDWORD(v19);
            }
          }
        }
        else
        {
          uint64_t v14 = 4294966996;
        }
      }
      else
      {
        uint64_t v14 = 4294966995;
      }
      mach_msg_destroy(&msg);
      return v14;
    }
    mig_dealloc_reply_port(msg.msgh_local_port);
  }
  return v14;
}

uint64_t sub_1000028E0(mach_port_t a1, _DWORD *a2, _DWORD *a3, _DWORD *a4, _DWORD *a5)
{
  mach_port_t reply_port = mig_get_reply_port();
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = reply_port;
  msg.msgh_bits = 5395;
  *(void *)&msg.msgh_voucher_port = 0x4B300000000;
  if (&_voucher_mach_msg_set)
  {
    voucher_mach_msg_set(&msg);
    mach_port_t reply_port = msg.msgh_local_port;
  }
  uint64_t v11 = mach_msg(&msg, 3, 0x18u, 0x3Cu, reply_port, 0, 0);
  uint64_t v12 = v11;
  if ((v11 - 268435458) > 0xE || ((1 << (v11 - 2)) & 0x4003) == 0)
  {
    if (v11)
    {
      mig_dealloc_reply_port(msg.msgh_local_port);
      return v12;
    }
    if (msg.msgh_id == 71)
    {
      uint64_t v12 = 4294966988;
    }
    else if (msg.msgh_id == 1303)
    {
      if ((msg.msgh_bits & 0x80000000) == 0)
      {
        if (msg.msgh_size == 52)
        {
          if (!msg.msgh_remote_port)
          {
            uint64_t v12 = v18;
            if (!v18)
            {
              int v15 = v20;
              *a2 = v19;
              *a3 = v15;
              int v16 = v22;
              *a4 = v21;
              *a5 = v16;
              return v12;
            }
            goto LABEL_23;
          }
        }
        else if (msg.msgh_size == 36)
        {
          if (msg.msgh_remote_port) {
            BOOL v13 = 1;
          }
          else {
            BOOL v13 = v18 == 0;
          }
          if (v13) {
            uint64_t v12 = 4294966996;
          }
          else {
            uint64_t v12 = v18;
          }
          goto LABEL_23;
        }
      }
      uint64_t v12 = 4294966996;
    }
    else
    {
      uint64_t v12 = 4294966995;
    }
LABEL_23:
    mach_msg_destroy(&msg);
    return v12;
  }
  mig_put_reply_port(msg.msgh_local_port);
  return v12;
}

uint64_t sub_100002A5C(uint64_t a1)
{
  v1 = (unint64_t *)*(&off_10005CE90
                           + ((85 * ((qword_100060158 - dword_100060160) ^ 0xD)) ^ byte_1000519D0[byte_10004D730[(85 * ((qword_100060158 - dword_100060160) ^ 0xD))] ^ 0x4F])
                           - 70);
  unsigned __int8 v2 = 85 * ((qword_100060158 + *v1) ^ 0xD);
  v3 = *(&off_10005CE90 + (byte_1000519D8[(byte_10004D73C[v2 - 12] ^ 0x10) - 8] ^ v2) - 64);
  unint64_t v4 = (*v3 - *v1) ^ (unint64_t)&v6;
  unint64_t *v1 = (839241301 * v4) ^ 0x78A901D92725650DLL;
  void *v3 = 839241301 * (v4 ^ 0x78A901D92725650DLL);
  unsigned int v7 = 628203409 * (((&v7 | 0xB375491A) - (&v7 & 0xB375491A)) ^ 0x31FD4529) + 631;
  uint64_t v8 = a1;
  LOBYTE(v3) = 85 * (*(_DWORD *)v1 ^ 0xD ^ *(_DWORD *)v3);
  return (*((uint64_t (**)(unsigned int *))*(&off_10005CE90
                                                     + ((85
                                                                                      * ((qword_100060158
                                                                                        + dword_100060160) ^ 0xD)) ^ byte_1000519D0[byte_10004D730[(85 * ((qword_100060158 + dword_100060160) ^ 0xD))] ^ 0x9B])
                                                     + 51)
          + (byte_100049F68[(byte_100056A60[v3] ^ 0x14) - 8] ^ v3)
          + 2054))(&v7);
}

uint64_t sub_100002C44(unsigned int a1)
{
  return byte_100049E6C[(byte_100056864[a1 - 4] ^ 0xBF) - 12] ^ a1;
}

uint64_t sub_100002C74(char a1, unsigned int a2)
{
  return byte_1000519D8[(byte_10004D73C[a2 - 12] ^ a1) - 8] ^ a2;
}

uint64_t sub_100002CA0(unsigned int a1)
{
  return byte_100049F68[(byte_100056A60[a1] ^ 0x14) - 8] ^ a1;
}

uint64_t sub_100002CD0(char a1, unsigned int a2)
{
  return byte_100056C68[(byte_100051ADC[a2 - 12] ^ a1) - 8] ^ a2;
}

uint64_t sub_100002CFC(unsigned int a1)
{
  return byte_10005696C[(byte_1000518D4[a1 - 4] ^ 0x42) - 12] ^ a1;
}

uint64_t sub_100002D2C(unsigned int a1)
{
  return byte_100056C68[(byte_100051ADC[a1 - 12] ^ 0x11) - 8] ^ a1;
}

uint64_t sub_100002D5C(unsigned int a1)
{
  return byte_1000519D8[(byte_10004D73C[a1 - 12] ^ 0xF6) - 8] ^ a1;
}

uint64_t sub_100002D8C(unsigned int a1)
{
  return byte_1000519D8[(byte_10004D73C[a1 - 12] ^ 0x9B) - 8] ^ a1;
}

uint64_t sub_100002DBC(uint64_t a1)
{
  v1 = *(&off_10005CE90
       + ((85 * ((qword_100060158 + dword_100060370) ^ 0xD)) ^ byte_100049E60[byte_100056860[(85 * ((qword_100060158 + dword_100060370) ^ 0xD))] ^ 0xBF])
       - 19);
  unsigned __int8 v2 = *(&off_10005CE90
       + ((85 * ((qword_100060158 + *v1) ^ 0xD)) ^ byte_100049E60[byte_100056860[(85 * ((qword_100060158 + *v1) ^ 0xD))] ^ 0xBF])
       - 74);
  uint64_t v3 = *v1 - (void)&v5 + *v2;
  void *v1 = 839241301 * v3 - 0x7D8293EE6603FCAFLL;
  void *v2 = 839241301 * (v3 ^ 0x78A901D92725650DLL);
  uint64_t v6 = a1;
  unsigned int v7 = 665
     - 1374699841 * ((1444875314 - (&v6 | 0x561F0C32) + (&v6 | 0xA9E0F3CD)) ^ 0xC414EBC4);
  LOBYTE(v2) = 85 * (*(_DWORD *)v1 ^ 0xD ^ *(_DWORD *)v2);
  return (*((uint64_t (**)(uint64_t *))*(&off_10005CE90
                                                + ((85 * (dword_100060370 ^ 0xD ^ qword_100060158)) ^ byte_10004A060[byte_100056B60[(85 * (dword_100060370 ^ 0xD ^ qword_100060158))] ^ 0x62])
                                                - 101)
          + (byte_1000519D8[(byte_10004D73C[v2 - 12] ^ 0x4F) - 8] ^ v2)
          + 1868))(&v6);
}

uint64_t sub_100002FB4(char a1, unsigned int a2)
{
  return byte_100049E6C[(byte_100056864[a2 - 4] ^ a1) - 12] ^ a2;
}

uint64_t sub_100002FE0(unsigned int a1)
{
  return byte_10005696C[(byte_1000518D4[a1 - 4] ^ 0x7D) - 12] ^ a1;
}

uint64_t sub_100003010(char a1, unsigned int a2)
{
  return byte_100049F68[(byte_100056A60[a2] ^ a1) - 8] ^ a2;
}

uint64_t sub_10000303C(unsigned int a1)
{
  return byte_10004A064[(byte_100056B68[a1 - 8] ^ 0x1D) - 4] ^ a1;
}

uint64_t sub_10000306C(unsigned int a1)
{
  return byte_10004A064[(byte_100056B68[a1 - 8] ^ 0x58) - 4] ^ a1;
}

uint64_t sub_10000309C(unsigned int a1)
{
  return byte_1000519D8[(byte_10004D73C[a1 - 12] ^ 0xE6) - 8] ^ a1;
}

uint64_t sub_1000030CC(unsigned int a1)
{
  return byte_100049F68[(byte_100056A60[a1] ^ 0xC8) - 8] ^ a1;
}

uint64_t sub_1000030FC(unsigned int a1)
{
  return byte_100049E6C[(byte_100056864[a1 - 4] ^ 0xD1) - 12] ^ a1;
}

uint64_t sub_10000312C(uint64_t a1)
{
  v1 = (unint64_t *)*(&off_10005CE90
                           + ((85 * (dword_100060378 ^ 0xD ^ qword_100060158)) ^ byte_1000519D0[byte_10004D730[(85 * (dword_100060378 ^ 0xD ^ qword_100060158))] ^ 0xE6])
                           - 178);
  unsigned __int8 v2 = *(&off_10005CE90
       + (byte_100049F68[(byte_100056A60[(85 * ((qword_100060158 - *v1) ^ 0xD))] ^ 0x14)
                                        - 8] ^ (85 * ((qword_100060158 - *v1) ^ 0xD)))
       - 17);
  unint64_t v3 = (*v2 - *v1) ^ (unint64_t)&v5;
  unint64_t *v1 = (839241301 * v3) ^ 0x78A901D92725650DLL;
  void *v2 = 839241301 * (v3 ^ 0x78A901D92725650DLL);
  uint64_t v7 = a1;
  v6[0] = (1374699841 * ((2 * (v6 & 0x72D60108) - v6 - 1926627593) ^ 0xE0DDE6FE)) ^ 0x6DA;
  LOBYTE(v2) = 85 * ((*(_DWORD *)v2 - *(_DWORD *)v1) ^ 0xD);
  (*((void (**)(_DWORD *))*(&off_10005CE90
                                     + ((85 * ((qword_100060158 - dword_100060378) ^ 0xD)) ^ byte_1000519D0[byte_10004D730[(85 * ((qword_100060158 - dword_100060378) ^ 0xD))] ^ 0xF6])
                                     - 6)
   + (byte_10004A064[(byte_100056B68[v2 - 8] ^ 0x58) - 4] ^ v2)
   + 2130))(v6);
  return v6[1];
}

uint64_t sub_100003324(char a1, unsigned int a2)
{
  return byte_10005696C[(byte_1000518D4[a2 - 4] ^ a1) - 12] ^ a2;
}

uint64_t sub_100003350(unsigned int a1)
{
  return byte_1000519D8[(byte_10004D73C[a1 - 12] ^ 0x4F) - 8] ^ a1;
}

uint64_t sub_100003380(char a1, unsigned int a2)
{
  return byte_10004A064[(byte_100056B68[a2 - 8] ^ a1) - 4] ^ a2;
}

uint64_t sub_1000033AC(unsigned int a1)
{
  return byte_100056C68[(byte_100051ADC[a1 - 12] ^ 0xBB) - 8] ^ a1;
}

uint64_t sub_1000033DC(unsigned int a1)
{
  return byte_10004A064[(byte_100056B68[a1 - 8] ^ 0x62) - 4] ^ a1;
}

uint64_t sub_10000340C(unsigned int a1)
{
  return byte_100056C68[(byte_100051ADC[a1 - 12] ^ 0x33) - 8] ^ a1;
}

uint64_t sub_10000343C(unsigned int a1)
{
  return byte_1000519D8[(byte_10004D73C[a1 - 12] ^ 0x10) - 8] ^ a1;
}

void sub_100003468(uint64_t a1)
{
  int v1 = *(_DWORD *)a1 ^ (1178560073 * ((-2 - ((a1 | 0x5930FF1B) + (~a1 | 0xA6CF00E4))) ^ 0x1C5B7886));
  uint64_t v4 = *(void *)(a1 + 8);
  v3[0] = v1 - 108757529 * ((v3 - 1271267561 - 2 * (v3 & 0xB439FF17)) ^ 0x54A59D3C) + 199;
  uint64_t v2 = (uint64_t)*(&off_10005CE90 + (v1 ^ 0xE6));
  (*(void (**)(_DWORD *))(v2 + 8 * (v1 ^ 0x859)))(v3);
  __asm { BRAA            X8, X17 }
}

uint64_t sub_100003614@<X0>(unsigned int a1@<W4>, uint64_t a2@<X8>)
{
  BOOL v4 = v3 == v2 + (a1 ^ 0x401) + 1010 - 1229;
  return (*(uint64_t (**)(void))(a2 + 8 * ((v4 | (4 * v4)) ^ a1)))();
}

uint64_t sub_100003644()
{
  *(_DWORD *)(v5 - 128) = v0 + ((v5 - 136) ^ 0x8FA51BC6) * v1 + 146;
  *(void *)(v5 - 120) = v3;
  *(void *)(v5 - 136) = v4;
  uint64_t v6 = (*(uint64_t (**)(uint64_t))(v2 + 8 * (v0 ^ 0xDBA)))(v5 - 136);
  return (*(uint64_t (**)(uint64_t))(v2 + 8 * ((781 * (*(_DWORD *)(v5 - 124) > (v0 ^ 0x76FA1D59u))) ^ v0)))(v6);
}

uint64_t sub_1000036D0@<X0>(uint64_t a1@<X8>)
{
  *(_DWORD *)(*(void *)(v2 - 0x4C6937770F4864B0) + 4 * (v5 - 699099538)) = *(_DWORD *)(*(void *)(v3 - 0x4C6937770F4864B0)
                                                                                           + 4 * (v5 - 699099538));
  return (*(uint64_t (**)(void))(a1 + 8 * ((75 * (v5 + 5 * (v4 ^ 0x299) - 1196 != v1)) ^ v4 ^ 0x4B)))();
}

uint64_t sub_100003740(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(unsigned char *)(a4 + v5) = *(unsigned char *)(v11 + (v4 + v8))
                      - ((((v6 - 30) | 0x20) ^ v9) & (2 * *(unsigned char *)(v11 + (v4 + v8))))
                      + 82;
  return (*(uint64_t (**)(void))(v10 + 8 * (((v5 != 63) * v7) ^ v6)))();
}

uint64_t sub_10000378C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,int a23,int a24)
{
  return (*(uint64_t (**)(void))(v25
                              + 8
                              * (((a24 - *(_DWORD *)(a2 + 4) == -112928127)
                                * (((v24 - 49) | 0x82) ^ 0x2FE ^ (12 * (v24 ^ 0x1DA)))) ^ v24)))();
}

uint64_t sub_1000037E4(uint64_t a1, int a2)
{
  return (*(uint64_t (**)(void))(v2
                              + 8
                              * (((v3 - 1 + 268 * (a2 ^ 0x7AE) >= 0) * ((982 * (a2 ^ 0x7AE)) ^ 0x139)) ^ a2 ^ 0x582)))();
}

uint64_t sub_100003838(uint64_t a1, uint64_t a2)
{
  int v6 = **(unsigned __int8 **)(a2 + 8) - 42;
  return (*(uint64_t (**)(void))(v5 + 8 * ((1440 * (((v6 << (5 * (v4 ^ 0xFB) - 7)) & v3) + (v6 ^ v2) == v2)) ^ v4)))();
}

uint64_t sub_100003884(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,int a24,char a25)
{
  *(void *)(&a25 + v25 + a6) = 0x5252525252525252;
  return (*(uint64_t (**)(void))(v28
                              + 8 * ((75 * ((((v27 ^ 0x4Bu) - 303) ^ 0x371) != ((v27 ^ 0x4DB) & v26))) ^ v27 ^ 0x4B)))();
}

uint64_t sub_1000038E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18, unsigned int a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,int a24,int a25,int a26,int a27)
{
  unsigned int v31 = (((a25 ^ v30) + a26) ^ 0x61B7D33A) - 536936450 + ((2 * ((a25 ^ v30) + a26)) & 0xC36FA674);
  BOOL v32 = a19 < 0x3B007D48;
  if (v32 == v31 - 112612848 < (((v29 ^ 0x483) - 1214010178) & 0x485C4FC3 ^ 0x3B007F8Bu)) {
    BOOL v32 = v31 - 112612848 < a19;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v28 + 8 * ((38 * v32) ^ v29 ^ 0x483)))(a1, a2, a3, a4, a5, a6, ((a27 + (v27 ^ v30)) ^ 0x6FFDFFDD) - 8773905 + (((a27 + (v27 ^ v30)) << a18) & 0xDFFBFFBA), a8, a9, a10, a11, a12, a13, a14, a15, a16, a17);
}

uint64_t sub_1000039D4@<X0>(unint64_t a1@<X8>)
{
  int v2 = LODWORD(STACK[0x2AC]) - 937;
  unint64_t v3 = STACK[0x2D8];
  STACK[0x518] = *(void *)(v1 + 8 * (LODWORD(STACK[0x2AC]) - 1731));
  STACK[0x568] = v3;
  LODWORD(STACK[0x574]) = 1922185985;
  STACK[0x328] = a1;
  BOOL v4 = ((2 * (*(_DWORD *)(v3 - 0x1FA9E8BAFD93F974) & 0x3F)) ^ 0x40)
     + (*(_DWORD *)(v3 - 0x1FA9E8BAFD93F974) & 0x3F ^ 0xFFFFE4DF)
     + 6863 < (v2 ^ 0x2AFu) - 551;
  return (*(uint64_t (**)(void))(v1
                              + 8
                              * ((((v2 - 1) ^ v4) & 1 | (2 * (((v2 - 1) ^ v4) & 1))) ^ v2)))();
}

uint64_t sub_100003A80(uint64_t a1, uint64_t a2, int a3)
{
  *(_DWORD *)(v4 + 4 * (v3 - 1338976439)) = 1338976439
                                                          - v3
                                                          + ((1566083941
                                                            * (*(_DWORD *)(v4 + 4 * (v3 - 1338976440)) ^ (*(_DWORD *)(v4 + 4 * (v3 - 1338976440)) >> 30))) ^ *(_DWORD *)(v4 + 4 * (v3 - 1338976439)));
  uint64_t v8 = 1178560073 * ((v7 - 144) ^ 0x1BFC50E8BA947862);
  *(void *)(v7 - 128) = v8 + 2511662611;
  *(void *)(v7 - 112) = (v3 + 1172686173) + v8;
  *(_DWORD *)(v7 - 120) = (v5 + 801681764) ^ v8;
  *(_DWORD *)(v7 - 132) = (v5 + 801681641) ^ v8;
  *(_DWORD *)(v7 - 104) = -1178560073 * ((v7 - 144) ^ 0xBA947862);
  *(_DWORD *)(v7 - 144) = (v5 + 1388397614) ^ v8;
  *(_DWORD *)(v7 - 140) = (v5 + 801681539) ^ v8;
  uint64_t v9 = (*(uint64_t (**)(uint64_t))(v6 + 8 * (v5 ^ (a3 + 1997))))(v7 - 144);
  return (*(uint64_t (**)(uint64_t))(v6 + 8 * *(int *)(v7 - 136)))(v9);
}

uint64_t sub_100003B98(uint64_t a1)
{
  int v1 = 1755732067 * ((650609490 - (a1 | 0x26C78352) + (a1 | 0xD9387CAD)) ^ 0x7FEC176);
  int v2 = *(_DWORD *)(a1 + 8) - v1;
  unsigned int v3 = v1 + *(_DWORD *)(a1 + 12) - 785517299;
  unsigned int v4 = (*(_DWORD *)(*(void *)a1 - 0x1FA9E8BAFD93F974) ^ 0x21A8BDE0) + v3;
  int v5 = v4 - ((2 * v4) & 0x43517BC0) + 564706784;
  *(_DWORD *)(*(void *)a1 - 0x1FA9E8BAFD93F974) = v5;
  return (*((uint64_t (**)(void))*(&off_10005CE90 + (v2 ^ 0x1A7)) + ((101 * ((v5 ^ 0x21A8BDE0u) < v3)) ^ v2)))();
}

uint64_t sub_100003C68@<X0>(uint64_t a1@<X8>, uint64_t a2, char a3)
{
  int v8 = v5 - 960;
  (*(void (**)(void, void, void))(v6 + 8 * (v5 ^ 0xD78)))(**(unsigned int **)(a1 + 8 * (v5 - 1284)), *v4, *(_DWORD *)(v7 - 0x3D8A64FC118460FALL) + ((v5 - 960) ^ v3));
  unint64_t v9 = ((unint64_t)&a3 ^ 0x7F7DEB70DDBEEBFFLL)
     + ((2 * (void)&a3) & 0xFEFBD6E1BB7DD7F0)
     - 0x61102170C504016CLL
     + (v8 ^ 0xD5u);
  *(unsigned char *)(v7 - 0x3D8A64FC118460E3) = ((v9 + (((v8 ^ 0xD5) - 21) ^ 0x58)) ^ 0xBA) * (v9 + 41);
  return (*(uint64_t (**)(uint64_t))(v6 + 8 * v8))(v7 - 0x3D8A64FC11846102);
}

void sub_100003D70(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 12) + 1759421093 * (((a1 | 0x9EBEB665) - a1 + (a1 & 0x6141499A)) ^ 0x2DC30631);
  uint64_t v2 = *(void *)a1;
  v4[0] = v1
        - 108757529 * ((((v4 | 0x1B6875D8) ^ 0xFFFFFFFE) - (~v4 | 0xE4978A27)) ^ 0x40BE80C)
        - 974;
  uint64_t v5 = v2;
  uint64_t v3 = (uint64_t)*(&off_10005CE90 + v1 - 1139);
  (*(void (**)(_DWORD *))(v3 + 8 * (v1 + 820)))(v4);
  __asm { BRAA            X8, X17 }
}

uint64_t sub_100003E80(uint64_t a1, uint64_t a2, uint64_t a3, int a4, int a5)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7
                                                              + 8
                                                              * (((v5 == ((v6 + 1918805905) & 0x8DA15B75 ^ 0x36B))
                                                                * (a5 + a4 + v6 + 1400 - 1477 + 616)) ^ (v6 + 1400))))(a1, a2, 324658714);
}

uint64_t sub_100003EE0@<X0>(unsigned int a1@<W8>)
{
  return (*(uint64_t (**)(void))(v2
                              + 8
                              * ((((((v1 ^ 0x277) - 1051) ^ a1) < 8) * (((v1 - 1631502686) & 0x613EBF55) - 1064)) ^ v1)))();
}

uint64_t sub_100003F2C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  int v29 = (v24 - 1699) | 0x505;
  unsigned int v30 = v26 + v25 + a1;
  if (v30 <= 0x40) {
    int v31 = 64;
  }
  else {
    int v31 = v30;
  }
  BOOL v32 = !__CFADD__(v30 + (v29 ^ 0x362) - 1057 - 717, v27 + v31);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v28 + 8 * (((4 * v32) | (32 * v32)) ^ v29)))(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24);
}

uint64_t sub_100003F90@<X0>(int a1@<W8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, int a13, int a14)
{
  return (*(uint64_t (**)(void))(v15
                              + 8
                              * (int)((((a1 | a14) == 0) * (((v14 + 1376721080) & 0xADF0E3BA ^ 0xFFFFFF47) + v14 - 909)) ^ v14)))();
}

uint64_t sub_100003FDC(uint64_t a1)
{
  int v2 = *(_DWORD *)(*(void *)(a1 + 16) - 0x4C6937770F4864B4) + 1626162369;
  int v3 = *(_DWORD *)(*(void *)a1 - 0x4C6937770F4864B4) + 1626162369;
  int v4 = (v2 < -227798714) ^ (v3 < -227798714);
  BOOL v5 = v2 > v3;
  if (v4) {
    BOOL v5 = v2 < -227798714;
  }
  int v1 = *(_DWORD *)(a1 + 8) - 3804331 * (a1 ^ 0x8FA51BC6);
  return (*((uint64_t (**)(void))*(&off_10005CE90 + (int)(v1 & 0x906DD19C)) + ((v5 * (v1 ^ 0x6BC)) ^ v1)))();
}

uint64_t sub_100004094(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  *((unsigned char *)&STACK[0x2AC] + v5 - 704281290) = 82;
  return (*(uint64_t (**)(void))(v7 + 8 * ((1004 * ((unint64_t)(v5 - 704281289) < 0x40)) ^ (a5 + v6 + 735))))();
}

uint64_t sub_1000040DC(uint64_t a1, uint64_t a2, int a3, uint64_t a4, int a5, uint64_t a6, int a7)
{
  uint64_t v12 = a3 + ((a7 + 170567) & 0xC78F6D92 ^ (v9 + 155));
  long long v13 = *(_OWORD *)(v8 + v12 - 15);
  long long v14 = *(_OWORD *)(v8 + v12 - 31);
  uint64_t v15 = v10 + v12;
  *(_OWORD *)(v15 - 15) = v13;
  *(_OWORD *)(v15 - 31) = v14;
  return (*(uint64_t (**)(void))(v7 + 8 * ((236 * ((v11 & 0xFFFFFFE0) == 32)) ^ (a5 + a7 + 42))))();
}

uint64_t sub_100004148(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  unint64_t v66 = STACK[0x300];
  STACK[0x3F8] = STACK[0x300];
  STACK[0x4A8] = 0;
  LODWORD(STACK[0x2BC]) = 1228396329;
  STACK[0x418] = 0;
  LODWORD(STACK[0x2D4]) = 1228396329;
  STACK[0x508] = 0;
  return (*(uint64_t (**)(void))(v65 + 8 * (((v66 == 0) * (a65 ^ 0x48E)) | a65)))();
}

uint64_t sub_1000041A4(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,int a21,int a22)
{
  return (*(uint64_t (**)(void))(v23
                              + 8
                              * (a22 | (2 * (((a22 + 730) ^ (a6 - 1207) ^ 0xEC0DF40E) + v22 < v22 + a2)))))();
}

uint64_t sub_1000041FC()
{
  return (*(uint64_t (**)(void))(v1 + 8 * ((696 * (v2 == ((v0 - 1706) ^ (v3 - 67)))) ^ (v0 - 1706))))();
}

uint64_t sub_100004228()
{
  return (*(uint64_t (**)(void))(v5
                              + 8
                              * ((1442
                                * ((v1 & (2 * (*(unsigned __int8 *)(v2 + 6) - 1)))
                                 + ((v3 - 1766889467) & 0x6950966F ^ v4 ^ (*(unsigned __int8 *)(v2 + 6) - 1)) == v0)) ^ v3)))();
}

uint64_t sub_100004278()
{
  return (*(uint64_t (**)(void))(v2 + 8 * ((1174 * (v1 + 1 == v3 + 44)) ^ v0)))();
}

uint64_t sub_10000434C()
{
  uint64_t v5 = *(void *)(v7 + 16);
  *(void *)(v4 - 128) = v3;
  *(void *)(v4 - 112) = v5;
  *(_DWORD *)(v4 - 120) = v0 + ((((v4 - 128) | 0xC9F0C769) - ((v4 - 128) & 0xC9F0C769)) ^ 0x4655DCAF) * v2 - 808;
  return (*(uint64_t (**)(uint64_t))(v1 + 8 * (v0 + 95)))(v4 - 128);
}

uint64_t sub_100004404@<X0>(uint64_t a1@<X0>, int a2@<W1>, int a3@<W4>, int a4@<W5>, int a5@<W6>, int a6@<W7>, int a7@<W8>)
{
  *(_DWORD *)(*v10 + 4 * (v8 + a7)) = a2;
  return (*(uint64_t (**)(uint64_t, uint64_t))(v7
                                                     + 8
                                                     * (((v13 == ((v12 - 463 + a3) & a6 ^ v9 ^ (v12 - 463 + a4) & a5))
                                                       * v11) ^ (v12 - 463))))(a1, 3001514288);
}

uint64_t sub_100004460@<X0>(uint64_t a1@<X8>)
{
  return (*(uint64_t (**)(void))(a1
                              + 8
                              * (int)((((115 * ((v1 - 293) ^ 0x4EB) + 1824155943) & 0x934597FE ^ 0x3CB)
                                     * (v2 == 1388059666)) ^ (v1 - 293))))();
}

uint64_t sub_1000044D8()
{
  *v2 ^= STACK[0x2A0];
  return (*(uint64_t (**)(void))(v1
                              + 8
                              * (int)((13
                                     * (((((((v0 + 898075048) & 0xCA7871F7) - 246) | 0x611) - 3555) ^ (v0 + 898075048) & 0xCA7871F7 ^ 0x727)
                                      + v3 == 739971293)) ^ (v0 + 898075048) & 0xCA7871F7)))();
}

uint64_t sub_100004564(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, int a16)
{
  return (*(uint64_t (**)(void))(v18
                              + 8
                              * ((1016
                                * (((v17 - 1228396329 + (v16 ^ 0x550) + 1096 - 1230) & (9 * (v16 ^ 0x550) - 1237)) - a16 == -1228396329)) ^ v16)))();
}

void sub_1000045B8(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 16) + 1224239923 * (((a1 | 0x8E383864) - (a1 & 0x8E383864)) ^ 0x7C8BC5B3);
  __asm { BRAA            X13, X17 }
}

uint64_t sub_10000466C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, int a6, uint64_t a7, uint64_t a8)
{
  *(unsigned char *)(*(void *)(a8 + 96) + 1568) = 0;
  return (*(uint64_t (**)(void))(v9
                              + 8
                              * (int)(((*(_DWORD *)(a8 + 72) == a6) * (a5 + ((v8 - 1745094900) & 0xFB7D7FDE) + 504)) ^ (v8 - 995))))();
}

uint64_t sub_1000046B8@<X0>(uint64_t a1@<X2>, int a2@<W8>)
{
  return (*(uint64_t (**)(void))(v2
                              + 8
                              * ((2006 * (*(_DWORD *)(a1 + 48 * v3 + 36) + 146835943 < (a2 + 2147483165))) ^ a2)))();
}

uint64_t sub_10000470C()
{
  STACK[0x408] -= 16;
  return (*(uint64_t (**)(void))(v1 + 8 * ((((v0 - 92) | 0x670) + 1844) ^ 0x62C)))();
}

uint64_t sub_100004748@<X0>(uint64_t a1@<X7>, int a2@<W8>)
{
  LOBYTE(STACK[0x284]) = *(unsigned char *)(a1 + v3);
  return (*(uint64_t (**)(void))(v4 + 8 * (((((v2 - 629) | 0x11) + 1015) * ((a2 + 611) < 4)) ^ v2)))();
}

void sub_100004780(uint64_t a1)
{
  __asm { BRAA            X14, X17 }
}

uint64_t sub_1000048B0()
{
  BOOL v5 = v3 + 1689507776 > 1267606904 || v3 + 1689507776 < v2;
  return (*(uint64_t (**)(void))(v1 + 8 * ((v5 * ((4 * v0) ^ 0x1899)) ^ v0)))();
}

uint64_t sub_1000048F8(int a1)
{
  return (*(uint64_t (**)(void))(v3 + 8 * (((((a1 - 347) | 0x80) + 582) * (v1 == v2)) ^ a1)))();
}

void sub_100004924(int a1@<W8>)
{
  uint64_t v3 = 4 * (v1 - 1479895064);
  uint64_t v4 = (int *)(STACK[0x2A0] + v3);
  int v5 = *v4;
  LODWORD(v4) = -953638755
              * ((*(_DWORD *)(*(void *)STACK[0x290] + (*(int *)STACK[0x288] & 0xFFFFFFFF93BD49D0)) ^ v4) & 0x7FFFFFFF);
  LODWORD(v4) = v4 ^ (v4 >> 16);
  unsigned int v6 = -953638755 * v4;
  uint64_t v7 = 4 * ((-953638755 * v4) >> (((a1 - 87) & 0xF6) + 66));
  *(_DWORD *)(v2 + v3) ^= v5 ^ *(_DWORD *)((char *)*(&off_10005CE90 + (a1 ^ 0x6AA)) + v7 - 4) ^ *((_DWORD *)*(&off_10005CE90 + (a1 ^ 0x685))
                                                                                                + (v6 >> (((a1 - 87) & 0xF6) + 66))) ^ *(_DWORD *)((char *)*(&off_10005CE90 + (a1 ^ 0x619)) + v7 - 12) ^ (-1600323584 * v4) ^ v6 ^ (-1109235783 * (v6 >> (((a1 - 87) & 0xF6) + 66)));
  JUMPOUT(0x100004508);
}

uint64_t sub_100004A2C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v9 = v5 + v6;
  *(unsigned char *)(v9 + a4 - 1) = v7;
  return (*(uint64_t (**)(void))(v8 + 8 * (((v9 < 0x40) | (2 * (v9 < 0x40))) ^ v4)))();
}

uint64_t sub_100004A60(int a1, int a2)
{
  return (*(uint64_t (**)(void))(v3 + 8 * ((1491 * ((a2 + 1 + v2) < 0x28)) ^ a1)))();
}

uint64_t sub_100004A78(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  unsigned int v8 = v5 - (((v5 << (v6 + 16)) + 1838174638) & 0xF469B37C) + 821887637;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v7
                                                                                         + 8
                                                                                         * ((67
                                                                                           * (((2 * v8) & 0xDFF7EB3E ^ 0xD461A33C)
                                                                                            + (v8 ^ 0x95CF2C21)
                                                                                            + 950336355 == 681636098)) ^ (v6 - 1488))))(a1, a2, a3, 1158830124, a5, 681636098);
}

uint64_t sub_100004B24(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40)
{
  HIDWORD(a29) = 1115468202;
  LODWORD(a28) = a4 - 90;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, unint64_t *, uint64_t *, uint64_t, uint64_t, uint64_t, void))(v41 + 8 * ((1859 * (((v40 - 1213573902) & 0x4855A9FE ^ (a4 - 90)) + ((v40 - 1213573902) & 0x4855A9FE) + 876 != 2017223308)) ^ (v40 - 1213573902) & 0x4855A9FE)))(2000647704, 357408481, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           &STACK[0x278],
           &a40,
           a27,
           a28,
           a29,
           0);
}

uint64_t sub_100004BD4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36)
{
  return sub_1000352A0(a2, a3, a4, a5, a7, a8, (const char *)&STACK[0x284], a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19, a20,
           a21,
           a22,
           a23,
           a5,
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
           a36);
}

uint64_t sub_100004BE0()
{
  return (*(uint64_t (**)(void))(v0 + 8 * (((8 * (qword_100060D90 != 0)) | (16 * (qword_100060D90 != 0))) ^ 0x228u)))();
}

uint64_t sub_100004C10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  *(void *)(v29 - 144) = v25;
  *(void *)(v29 - 136) = v25;
  *(_DWORD *)(v29 - 112) = v24
                         + ((((v29 - 144) | 0x86162B6F) - (v29 - 144) + ((v29 - 144) & 0x79E9D490)) ^ 0xF8E9B15D) * v28
                         + 363;
  *(void *)(v29 - 128) = a24;
  *(void *)(v29 - 120) = a23;
  (*(void (**)(uint64_t))(v26 + 8 * (v24 + 1842)))(v29 - 144);
  *(_DWORD *)(v29 - 104) = v24 + 235795823 * ((v29 + 1102998098 - 2 * ((v29 - 144) & 0x41BE6AE2)) ^ 0xD51323BB) - 40;
  *(void *)(v29 - 120) = a15;
  *(void *)(v29 - 112) = a24;
  *(void *)(v29 - 136) = v25;
  *(void *)(v29 - 128) = v25;
  *(void *)(v29 - 144) = a23;
  uint64_t v30 = (*(uint64_t (**)(uint64_t))(v26 + 8 * (v24 ^ 0x8DD)))(v29 - 144);
  return (*(uint64_t (**)(uint64_t))(v26
                                            + 8
                                            * ((7
                                              * (v27
                                               + (v24 ^ 0x502)
                                               - 1514
                                               + (v24 ^ 0x502)
                                               - 616
                                               + ((2 * (v24 ^ 0x502)) ^ 0xE3FA578B) > 0x7FFFFFFE)) ^ ((v24 ^ 0x502) + 81))))(v30);
}

uint64_t sub_100004D34(uint64_t a1, uint64_t a2, char a3, char a4, char a5, char a6)
{
  return (*(uint64_t (**)(void))(v8 + 8 * ((448 * (v7 == ((((v6 ^ a4) * a5) ^ a6) + (v6 ^ a3)))) ^ v6)))();
}

uint64_t sub_100004D68(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  return (*(uint64_t (**)(void))(v5
                                           + 8 * (int)(((((a4 + 185488380) & 0xF4F1AF9F) - 1927) * (v4 > 0x1F)) | a4)))((a4 + 544));
}

uint64_t sub_100004DA8@<X0>(uint64_t result@<X0>, int a2@<W8>)
{
  if (v2 + 49998 < ((v4 + 44) ^ 0x1D23u)) {
    int v3 = a2;
  }
  *(_DWORD *)(*(void *)(result + 8) - 0x413A964FADEC51F1) = v3;
  return result;
}

uint64_t sub_100004DE0()
{
  STACK[0x310] = *(void *)(v1 + 8 * v0);
  return sub_100030BB8();
}

void sub_100004DE8(uint64_t a1@<X8>, uint64_t a2, uint64_t a3, unsigned int a4, uint64_t a5, uint64_t a6)
{
  a3 = v7;
  a4 = v8 - 3804331 * ((&a3 & 0xDD8F8E02 | ~(&a3 | 0xDD8F8E02)) ^ 0xADD56A3B) + 1786;
  a5 = v7;
  a6 = a1;
  (*(void (**)(uint64_t *))(v6 + 8 * (v8 + 1887)))(&a3);
  sub_10000D938();
}

void sub_100004E48(uint64_t a1@<X8>)
{
  __asm { BRAA            X12, X17 }
}

uint64_t sub_100005580(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,void *a27,unint64_t a28,uint64_t a29,_DWORD *a30)
{
  *a30 = v31 + 1;
  unsigned int v34 = ((v30 ^ (v30 >> 11)) << 7) & 0x9D2C5680 ^ v30 ^ (v30 >> 11);
  *(_DWORD *)(*a27 + a28) ^= ((v33 & (v34 << 15) ^ v34) >> (a16 ^ 4)) ^ v33 & (v34 << 15) ^ v34;
  return (*(uint64_t (**)(void))(v32 + 8 * (((a28 < 0x1FC) | (2 * (a28 < 0x1FC))) ^ 0xA8)))();
}

uint64_t sub_10000560C@<X0>(uint64_t a1@<X8>)
{
  return (*(uint64_t (**)(uint64_t))(v2 + 8 * ((531 * (a1 + 1 == v3 + 32)) ^ v4)))(v1);
}

uint64_t sub_1000056F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21)
{
  *(void *)(v25 - 120) = a21;
  *(void *)(v25 - 104) = v24;
  *(_DWORD *)(v25 - 112) = v22
                         + ((-506546454 - ((v25 - 120) | 0xE1CEB6EA) + ((v25 - 120) | 0x1E314915)) ^ 0x919452D3) * v23
                         + 1429;
  uint64_t v26 = (*(uint64_t (**)(uint64_t))(v21 + 8 * (v22 + 1865)))(v25 - 120);
  return (*(uint64_t (**)(uint64_t))(v21
                                            + 8
                                            * ((488
                                              * (((v22 - 1) ^ (*(_DWORD *)(v25 - 108) > 0x76FA18A3u)) & 1)) ^ v22)))(v26);
}

uint64_t sub_10000579C@<X0>(uint64_t a1@<X0>, int a2@<W8>)
{
  int v6 = (a2 - 754) | 0xD8;
  uint64_t v7 = (void *)(v4 - 0x4C6937770F4864B0);
  BOOL v8 = v5 > 0x5E734EBA;
  int v9 = (v6 ^ 0x100DE618) + v2;
  int v10 = v8 ^ (v9 < -1584615099);
  BOOL v11 = v9 < (int)((v6 ^ 0x218CB39D) + v5);
  if (!v10) {
    BOOL v8 = v11;
  }
  return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v3 + 8 * ((52 * v8) ^ v6)))(a1, *v7, 269346328, 2710352197);
}

uint64_t sub_100005884@<X0>(int a1@<W8>, int8x16_t a2@<Q1>, int8x16_t a3@<Q4>, int8x16_t a4@<Q5>, int8x16_t a5@<Q6>, int32x4_t a6@<Q7>)
{
  int v9 = (const float *)(v7 + 908);
  int8x16_t v10 = (int8x16_t)vld1q_dup_f32(v9);
  a2.i64[0] = *(void *)(v7 + 912);
  a2.i32[2] = *(_DWORD *)(v7 + 920);
  int8x16_t v11 = vextq_s8(v10, a2, 0xCuLL);
  int8x16_t v12 = a2;
  v12.i32[3] = *(_DWORD *)(v7 + 924);
  int32x4_t v13 = (int32x4_t)veorq_s8((int8x16_t)vshrq_n_u32((uint32x4_t)vorrq_s8(vandq_s8(v12, a3), vandq_s8(v11, a5)), 1uLL), *(int8x16_t *)v7);
  v11.i32[0] = *(_DWORD *)(v8 + 4 * (*(_DWORD *)(v7 + 912) & (a1 - 1481)));
  v11.i32[1] = *(_DWORD *)(v8 + 4 * (*(_DWORD *)(v7 + 916) & 1));
  v11.i32[2] = *(_DWORD *)(v8 + 4 * (*(_DWORD *)(v7 + 920) & 1));
  v11.i32[3] = *(_DWORD *)(v8 + 4 * (v12.i8[12] & 1));
  *(int8x16_t *)(v7 + 908) = veorq_s8((int8x16_t)vaddq_s32(vsubq_s32(v13, (int32x4_t)vandq_s8((int8x16_t)vaddq_s32(v13, v13), a4)), a6), v11);
  return (*(uint64_t (**)(void))(v6 + 8 * a1))();
}

uint64_t sub_10000593C@<X0>(int a1@<W8>)
{
  return (*(uint64_t (**)(void))(v4
                              + 8
                              * ((392
                                * (((((((v5 - 1468665632) & 0x578A0A7F) + v2) ^ (2 * a1))
                                   + v3
                                   - ((v2 + 591) & (2 * ((((v5 - 1468665632) & 0x578A0A7F) + v2) ^ (2 * a1))))) ^ v3) > v1)) ^ v5)))();
}

uint64_t sub_100005990(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, unint64_t *a10, int a11, uint64_t a12, unsigned int a13, int a14)
{
  unsigned int v17 = 108757529 * ((293386251 - (&a10 | 0x117CB80B) + (&a10 | 0xEE8347F4)) ^ 0xE1F25DF);
  a11 = v17 ^ 0x1F819DE0;
  a13 = 1583071831 - v17;
  a14 = v14 - v17 - 524;
  a10 = &STACK[0x118FD125AD18CD5C];
  a12 = v15;
  uint64_t v18 = (*(uint64_t (**)(unint64_t **))(v16 + 8 * (v14 ^ 0xB2C)))(&a10);
  return (*(uint64_t (**)(uint64_t))(v16
                                            + 8
                                            * (((*(_DWORD *)(v15 - 0x3D8A64FC118460EALL) == -1158872075)
                                              * (((v14 - 1470856091) & 0x57AB7B7F) + 1087)) ^ v14)))(v18);
}

uint64_t sub_100005A8C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  *(int8x16_t *)&STACK[0x2A8] = vaddq_s8(vsubq_s8(*(int8x16_t *)(v8 + (v7 + a6)), vandq_s8(vaddq_s8(*(int8x16_t *)(v8 + (v7 + a6)), *(int8x16_t *)(v8 + (v7 + a6))), v10)), v11);
  return (*(uint64_t (**)(void))(v9 + 8 * ((v6 - 7) ^ (v6 + 772))))();
}

uint64_t sub_100005AE4()
{
  STACK[0x298] = v1;
  *(_DWORD *)(STACK[0x588] + 4 * ((LODWORD(STACK[0x324]) + v0) >> LODWORD(STACK[0x258]))) = v2;
  return sub_100030D10();
}

uint64_t sub_100005B10()
{
  BOOL v4 = v1 - 1575996271 > 1110237201 || v1 - 1575996271 < SLODWORD(STACK[0x2A0]);
  return (*(uint64_t (**)(void))(v2 + 8 * (int)(((((v0 + 1130542960) & 0xBC9D4FB7) - 1346) * v4) ^ v0)))();
}

uint64_t sub_100005B64@<X0>(unsigned int a1@<W8>)
{
  unint64_t v4 = v1 + v2;
  if (v4 <= 0x38) {
    unint64_t v4 = 56;
  }
  return (*(uint64_t (**)(void))(v3
                              + 8
                              * ((98
                                * (((a1 + 50) ^ (v4 - v1 + 1938080791 < (((a1 - 9) | 0x219) ^ 0x711uLL))) & 1)) ^ a1)))();
}

void sub_100005BCC()
{
  if ((*(_DWORD *)(v2 - 0x4C6937770F4864B4) - 293522566) >= 0x7FFFFFFF) {
    int v3 = v1;
  }
  else {
    int v3 = v1 + 2;
  }
  *(_DWORD *)(v0 + 8) = v3;
}

uint64_t sub_100005C00(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  *(_DWORD *)(*(void *)(a1 + 96) + 1424) = *(_DWORD *)(a2 + 4)
                                             - 1097119570
                                             + ((((a6 - 735) | 0x200) + 675367754) | 0x102CB030);
  *(void *)(*(void *)(a1 + 96) + 520) = *(void *)(a2 + 8) + 1;
  return 0;
}

uint64_t sub_100005C60@<X0>(int a1@<W8>)
{
  LODWORD(STACK[0x3AC]) = STACK[0x288];
  LODWORD(STACK[0x3DC]) = STACK[0x290];
  STACK[0x2E8] = STACK[0x270];
  STACK[0x510] = STACK[0x280];
  STACK[0x338] = STACK[0x278];
  LODWORD(STACK[0x3CC]) = a1;
  return sub_100026438(a1);
}

uint64_t sub_100005CB4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25)
{
  *(_DWORD *)(v28 - 200) = 1224239923
                         * ((-932950423 - ((v28 - 200) | 0xC8644E69) + ((v28 - 200) | 0x379BB196)) ^ 0xC5284C41)
                         + 426521240
                         + (v25 ^ 0x69A)
                         + 1670;
  (*(void (**)(uint64_t))(v26 + 8 * ((v25 ^ 0x69A) + 1988)))(v28 - 200);
  LOBYTE(STACK[0x18C4]) = (-103 * ((v28 + 56) ^ 0x32)) ^ 0x1D;
  *(_DWORD *)(v28 - 176) = ((v25 ^ 0x69A) + 449) ^ (1225351577 * ((v28 - 200) ^ 0x7EFF9A32));
  *(void *)(v28 - 184) = a25;
  *(void *)(v28 - 200) = v27;
  (*(void (**)(uint64_t))(v26 + 8 * ((v25 ^ 0x69A) + 2025)))(v28 - 200);
  return sub_100019E08();
}

uint64_t sub_100005D88(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(v6
                              + 8
                              * ((199 * ((((v3 - 518) ^ (*(_DWORD *)(a3 + 48 * (v5 + v4) + 36) == v5)) & 1) == 0)) ^ v3)))();
}

void sub_100005E14(uint64_t a1@<X8>)
{
  *(void *)(*(void *)(v1 + 64) - 0x3842FAF4B7C49EFFLL) = a1;
  sub_10004031C();
}

uint64_t sub_100005E38()
{
  int v4 = STACK[0x228];
  int v5 = (v1 - 1489) | 0x240;
  *(_DWORD *)STACK[0x250] = 0;
  unsigned int v6 = ((v0 ^ (v0 >> 11)) << 7) & 0x9D2C5680 ^ v0 ^ (v0 >> 11);
  int v7 = (unsigned char *)(v2 + (v4 - 2085126513));
  unsigned int v8 = -953638755
     * ((*(_DWORD *)(*(void *)STACK[0x290] + (*(_DWORD *)STACK[0x288] & 0x2DC6E5FC)) ^ v7) & ((v5 ^ 0xF) + 2147482768));
  unint64_t v9 = (v8 ^ HIWORD(v8)) * ((v5 + 913) ^ 0xC728A66C);
  LOBYTE(v9) = *((unsigned char *)*(&off_10005CE90 + (v5 ^ 0x338)) + (v9 >> 24) - 8) ^ v6 ^ 0xEA ^ (((v6 << 15) & 0xEFC60000 ^ v6) >> 18) ^ v5 ^ 0x8A ^ *((unsigned char *)*(&off_10005CE90 + v5 - 812) + (v9 >> 24)) ^ *((unsigned char *)*(&off_10005CE90 + v5 - 784) + (v9 >> 24) - 11) ^ v9 ^ (-123 * (((v8 ^ HIWORD(v8)) * ((v5 + 913) ^ 0xC728A66C)) >> 24));
  unsigned char *v7 = v9;
  return (*(uint64_t (**)(void))(v3 + 8 * ((1949 * (v4 - (v9 != 0) == 2085126512)) ^ v5)))();
}

uint64_t sub_100005E40()
{
  return (*(uint64_t (**)(void))(v2
                              + 8
                              * (int)(((v3 != (v0 ^ 0x70) + 1075864817) * (v1 + ((v0 + 769620532) & 0xD67CE773) - 1259)) ^ v0)))();
}

uint64_t sub_100005EA8(uint64_t a1, uint64_t a2, uint64_t a3, int a4, int a5)
{
  int v6 = a5 - 1932018900 + ((a4 - 1170358563) & 0x45C24373u) + 547 < ((19 * (a4 ^ 0x13D)) ^ 0x4B7u);
  return (*(uint64_t (**)(void))(v5 + 8 * ((8 * v6) | (v6 << 6) | a4)))();
}

uint64_t sub_100005F0C@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18)
{
  int v23 = ((((v22 - 144) | 0x59786742) - ((v22 - 144) & 0x59786742)) ^ 0x15EEE53F) * v19;
  *(_DWORD *)(v22 - 140) = v23 + v18 + 1286;
  *(void *)(v22 - 136) = a1;
  *(void *)(v22 - 120) = a2;
  *(_DWORD *)(v22 - 128) = ((((v18 + 876) | 0x85) ^ 0xED9CD432) + v20) ^ v23;
  uint64_t v24 = (*(uint64_t (**)(uint64_t))(v21 + 8 * (v18 + 1413)))(v22 - 144);
  return sub_10003FB98(v24, v25, v26, v27, v28, v29, v30, v31, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13,
           a14,
           a15,
           a16,
           a17,
           a18);
}

uint64_t sub_100005F90(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12, int a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, unsigned int a18, uint64_t a19)
{
  int *v20 = a12 ^ v21;
  unsigned int *v19 = v23 ^ 0xBAED07D0 ^ a13;
  a18 = v24
      + (v23 ^ 0x91DC6262)
      + 535753261 * ((&a17 & 0xA9ABCCEA | ~(&a17 | 0xA9ABCCEA)) ^ 0x5CA03D3A);
  a19 = a15;
  (*(void (**)(char *))(v22 + 8 * (int)(v24 + (v23 ^ 0x91DC6262) + 680)))(&a17);
  return sub_1000186F0();
}

uint64_t sub_10000602C(uint64_t a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,int a25)
{
  int8x16x4_t v37 = vld4q_s8(a4);
  uint8x16_t v29 = (uint8x16_t)veorq_s8(v37.val[2], v28);
  _Q17 = vmovl_high_u8(v29);
  _Q16 = vmovl_u8(*(uint8x8_t *)v29.i8);
  __asm
  {
    SHLL2           V16.4S, V16.8H, #0x10
    SHLL2           V17.4S, V17.8H, #0x10
  }
  return (*(uint64_t (**)(uint64_t))(v27 + 8 * ((v26 == 203833431) ^ (35 * (a25 ^ 0x4DA) + 288))))(v25);
}

uint64_t sub_10000623C()
{
  return (*(uint64_t (**)(void))(v1
                              + 8
                              * (((LODWORD(STACK[0x2CC]) != ((((v0 - 1268175675) & 0x4B96D67E) - 617) | 0x1A8)
                                                          + 1228395374)
                                * ((((v0 - 1268175675) & 0x4B96D67E) + 629) ^ 0x605)) ^ (v0 - 1268175675) & 0x4B96D67E)))();
}

uint64_t sub_1000062D8()
{
  *(_DWORD *)(v6 - 120) = v4 - 1224239923 * ((~((v6 - 136) | 0xB3104465) + ((v6 - 136) & 0xB3104465)) ^ 0xBE5C464D) + 70;
  *(void *)(v6 - 136) = v5;
  *(void *)(v6 - 128) = v1;
  uint64_t v7 = (*(uint64_t (**)(uint64_t))(v2 + 8 * (v4 + 1967)))(v6 - 136);
  return (*(uint64_t (**)(uint64_t))(v2 + 8 * ((368 * (v0 == (v4 ^ 0x14 ^ (v3 - 159)))) ^ v4)))(v7);
}

void sub_100006370(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 8) + 3804331 * ((((2 * a1) | 0x83BDF70C) - a1 + 1042351226) ^ 0x4E7BE040);
  uint64_t v2 = *(void *)a1;
  if (*(_DWORD *)(*(void *)a1 - 0x4C6937770F4864B4) - 293522565 >= 0) {
    unsigned int v4 = *(_DWORD *)(*(void *)a1 - 0x4C6937770F4864B4) - 293522565;
  }
  else {
    unsigned int v4 = 293522565 - *(_DWORD *)(*(void *)a1 - 0x4C6937770F4864B4);
  }
  uint64_t v3 = *(void *)(a1 + 24);
  if (*(_DWORD *)(v3 - 0x4C6937770F4864B4) - 293522565 >= 0) {
    unsigned int v5 = *(_DWORD *)(v3 - 0x4C6937770F4864B4) - 293522565;
  }
  else {
    unsigned int v5 = 293522565 - *(_DWORD *)(v3 - 0x4C6937770F4864B4);
  }
  unsigned int v9 = v1
     - 1759421093
     * (((&v8 | 0x4292037D) - &v8 + (&v8 & 0xBD6DFC80)) ^ 0xF1EFB329)
     - 710;
  uint64_t v8 = v2;
  uint64_t v6 = (uint64_t)*(&off_10005CE90 + v1 - 1849);
  (*(void (**)(uint64_t *))(v6 + 8 * (v1 ^ 0xFCF)))(&v8);
  if (v4 >= v5) {
    unsigned int v7 = v5;
  }
  else {
    unsigned int v7 = v4;
  }
  __asm { BRAA            X12, X17 }
}

uint64_t sub_100006510()
{
  int v5 = *(unsigned __int8 *)(v0 + v2 - 0x1F24F052D2B75ELL)
     - (*(unsigned char *)(v1 + v2 - 0x1F24F052D2B75ELL) - 72);
  return (*(uint64_t (**)(void))(v4
                              + 8
                              * (((((2 * v5) & 0x9EFEFF9E) + (v5 ^ (((v3 - 633330772) & 0x25BFDFF5) + 1333754782)) == 1333755855)
                                * (((v3 - 46) | 0x690) - 5)) ^ v3)))();
}

uint64_t sub_100006518()
{
  return sub_100036C00();
}

uint64_t sub_100006594()
{
  unsigned int v5 = v0 + ((v4 + 100) ^ 0x65D) + 5393;
  if (v5 <= 0x40) {
    unsigned int v5 = 64;
  }
  return (*(uint64_t (**)(void))(v3 + 8 * ((107 * (-v1 - v2 - 6914 + v5 > 0xE)) ^ (v4 + 100))))();
}

uint64_t sub_100006648@<X0>(unsigned int a1@<W8>)
{
  BOOL v6 = v4 < v3;
  unsigned int v7 = v2 + 1;
  if (v6 == v7 > a1) {
    BOOL v6 = v7 + v3 < v4;
  }
  return (*(uint64_t (**)(void))(v5 + 8 * (((2 * v6) | (16 * v6)) ^ v1)))();
}

uint64_t sub_1000066C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43)
{
  int v52 = ((~((v51 - 200) | v48) + ((v51 - 200) & v48)) ^ 0x99B88C2D) * v50;
  *(void *)(v51 - 192) = 0;
  *(void *)(v51 - 184) = v45;
  *(_DWORD *)(v51 - 160) = v47 - v52 + 575;
  *(void *)(v51 - 152) = a43;
  *(void *)(v51 - 144) = 0;
  *(void *)(v51 - 176) = v43;
  *(void *)(v51 - 168) = v46;
  *(_DWORD *)(v51 - 136) = v52 ^ v44;
  uint64_t v53 = (*(uint64_t (**)(uint64_t))(v49 + 8 * (v47 + 1342)))(v51 - 200);
  int v54 = *(_DWORD *)(v51 - 200);
  LODWORD(STACK[0x564]) = v54;
  return (*(uint64_t (**)(uint64_t))(v49 + 8 * (((v54 == -1158872075) * (v47 ^ 0x25C)) ^ v47)))(v53);
}

uint64_t sub_100006760()
{
  LODWORD(STACK[0x464]) = v0 + 383;
  return sub_100017830();
}

uint64_t sub_10000677C@<X0>(uint64_t a1@<X8>)
{
  *(unsigned char *)(v1 + (v6 + v3)) = *(unsigned char *)(a1 + (v6 + v3));
  return (*(uint64_t (**)(void))(v7
                              + 8
                              * (((2 * (((v6 - 1 == v2) ^ v5) & 1)) & 0xEF | (16 * (((v6 - 1 == v2) ^ v5) & 1))) ^ v4)))();
}

uint64_t sub_1000067B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17)
{
  int v21 = 628203409 * ((~((v20 - 152) | 0x5F9A5A08) + ((v20 - 152) & 0x5F9A5A08)) ^ 0x22EDA9C4);
  *(void *)(v20 - 128) = a15;
  *(void *)(v20 - 112) = a17;
  *(void *)(v20 - 104) = a13;
  *(_DWORD *)(v20 - 136) = v18 - v21 + 281;
  *(_DWORD *)(v20 - 132) = v17 - v21 + v18 + 854318536;
  *(void *)(v20 - 152) = a14;
  *(void *)(v20 - 144) = a12;
  (*(void (**)(uint64_t))(v19 + 8 * (v18 + 1839)))(v20 - 152);
  return (*(uint64_t (**)(void))(v19
                              + 8
                              * (int)(((*(_DWORD *)(v20 - 120) == -1158872075) * (((v18 + 713684567) & 0xD5760EFD) - 23)) ^ v18)))();
}

uint64_t sub_1000068A8@<X0>(uint64_t a1@<X2>, int a2@<W8>)
{
  unsigned int v6 = *(_DWORD *)((char *)&STACK[0x284] + ((v4 + a2) & 0xFFFFFFFC) + 72);
  *(unsigned char *)(a1 + (v4 + a2)) = ((v6 >> ((v3 + 118) ^ 0x21)) ^ 0x2C)
                                           - ((2 * (v6 >> ((v3 + 118) ^ 0x21))) & 0xA4)
                                           + 82;
  *(unsigned char *)(a1 + (v4 + a2 + 1)) = (BYTE2(v6) ^ 0xE7) - ((2 * (BYTE2(v6) ^ 0xE7)) & 0xA4) + 82;
  *(unsigned char *)(a1 + (v4 + a2 + 2)) = (BYTE1(v6) ^ 0xD3)
                                               - 2 * ((BYTE1(v6) ^ 0xD3) & 0x56 ^ BYTE1(v6) & 4)
                                               + 82;
  *(unsigned char *)(a1 + (v4 + a2 + 3)) = v6 ^ 0xF4;
  unsigned int v7 = LODWORD(STACK[0x2E0]) + 933765223;
  BOOL v8 = v7 < v2;
  BOOL v9 = v4 + 1093157862 < v7;
  if (v4 + 1093157862 < v2 != v8) {
    BOOL v9 = v8;
  }
  return (*(uint64_t (**)(void))(v5 + 8 * ((v9 | (8 * v9)) ^ v3)))();
}

uint64_t sub_100006998()
{
  return (*(uint64_t (**)(void))(v3
                              + 8
                              * ((((((v2 - 733507815) & 0x2BB86EED) - 912) ^ ((v2 - 1461) | 0x32)) * (v0 == v1)) ^ v2)))();
}

uint64_t sub_1000069E0@<X0>(int a1@<W3>, uint64_t a2@<X8>)
{
  *(unsigned char *)(a2 - 1078471726 + v4 - 220 - 1) = 82;
  return (*(uint64_t (**)(void))(v3 + 8 * ((126 * ((unint64_t)(a2 - 1078471726) > 0x37)) ^ (a1 + v2 + 818))))();
}

uint64_t sub_100006A28@<X0>(uint64_t a1@<X8>)
{
  *(_DWORD *)(*(void *)(v1 + 96) + 528) = 1255422628;
  *(_DWORD *)(*(void *)(v1 + 96) + 532) = 293522565;
  *(void *)(*(void *)(v1 + 96) + 536) = *(void *)(v1 + 96) + 544;
  uint64_t v4 = *(void *)(v1 + 96) + 0x4C6937770F4866C8;
  uint64_t v5 = *(void *)(v2 + 8) + (*(_DWORD *)(v2 + 4) - v3);
  unsigned int v6 = 460628867 * ((2 * (v9 & 0x5C0DDCB0) - v9 + 603071310) ^ 0x6F64A133);
  int v11 = (v3 - 913435166) ^ v6;
  v9[1] = v6 + 1970;
  uint64_t v10 = v4;
  uint64_t v12 = v5;
  (*(void (**)(_DWORD *))(a1 + 16776))(v9);
  int v7 = v9[0];
  *(void *)(*(void *)(v1 + 96) + 512) = *(void *)(v2 + 8) + (*(_DWORD *)(v2 + 4) - v3);
  return (v7 - 1738490747);
}

uint64_t sub_100006A30()
{
  *(_DWORD *)(*(void *)(v1 + 96) + 1428) = 1680994591;
  return sub_100031204(36 * (v0 ^ 0x220u), -1981012829);
}

uint64_t sub_100006A60@<X0>(int a1@<W8>)
{
  int v3 = *(uint64_t (**)(uint64_t))(v2 + 8 * (a1 ^ 0xDA8));
  return v3(v1);
}

uint64_t sub_100006A94@<X0>(unsigned int a1@<W0>, unsigned int a2@<W4>, uint64_t a3@<X8>, uint8x8_t a4@<D0>)
{
  a4.i32[0] = *(_DWORD *)(a3 + (a2 ^ 0x1D3) + a1);
  *(_DWORD *)(a3 - 3 + (v6 + v4)) = vmovn_s16((int16x8_t)vmovl_u8(a4)).u32[0];
  return (*(uint64_t (**)(void))(v7
                              + 8 * (int)((113 * ((((a2 ^ 0x71) + 2064252498) & 0x84F6036B) - 861 != v5)) ^ a2 ^ 0x71)))();
}

uint64_t sub_100006B04(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  uint64_t v10 = (v7 + v4);
  unsigned int v11 = *(_DWORD *)(v9 - 220 + v10 + 72);
  unsigned int v12 = v11 >> ((v6 - 35) & 0xFC ^ (a3 + 24));
  *(unsigned char *)(a4 + v10) = (v12 ^ 0x2C) - ((2 * v12) & 0xA4) + 82;
  *(unsigned char *)(a4 + (v10 + 1)) = (BYTE2(v11) ^ 0xE7) - ((2 * (BYTE2(v11) ^ 0xE7)) & 0xA4) + 82;
  *(unsigned char *)(a4 + (v10 + 2)) = (BYTE1(v11) ^ 0xD3)
                                           - 2 * ((BYTE1(v11) ^ 0xD3) & 0x56 ^ BYTE1(v11) & 4)
                                           + 82;
  *(unsigned char *)(a4 + (v10 + 3)) = v11 ^ 0xF4;
  unsigned int v13 = *(_DWORD *)(v9 - 128) + 1600462375;
  BOOL v14 = v13 < v5;
  BOOL v15 = v7 - 1661562255 < v13;
  if (v7 - 1661562255 < v5 != v14) {
    BOOL v15 = v14;
  }
  return (*(uint64_t (**)(void))(v8 + 8 * ((76 * v15) ^ v6)))();
}

uint64_t sub_100006C08(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,int a37,int a38,int a39)
{
  _DWORD *v41 = v41[623];
  unint64_t v45 = 1178560073 * ((0xB424B002C500E910 - ((v44 - 144) | 0xB424B002C500E910) + a36) ^ 0x50271F15806B6E8DLL);
  *(_DWORD *)(v44 - 120) = a39 ^ v45;
  *(_DWORD *)(v44 - 144) = (v40 + 1388397614) ^ v45;
  *(_DWORD *)(v44 - 140) = a39 ^ v45 ^ 0xE7;
  *(void *)(v44 - 128) = (v42 + 1) + v45;
  *(void *)(v44 - 112) = v45 + 3;
  *(_DWORD *)(v44 - 132) = a37 ^ v45;
  *(_DWORD *)(v44 - 104) = -1178560073 * ((-989796080 - ((v44 - 144) | 0xC500E910) + a36) ^ 0x806B6E8D);
  uint64_t v46 = (*(uint64_t (**)(uint64_t))(v43 + 8 * (v39 + v40 + 1481)))(v44 - 144);
  return (*(uint64_t (**)(uint64_t))(v43 + 8 * *(int *)(v44 - 136)))(v46);
}

uint64_t sub_100006CDC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  *(_DWORD *)(v18 - 112) = v12
                         + 1225351577
                         * ((54402917 - ((v18 - 144) | 0x33E1F65) + ((v18 - 144) | 0xFCC1E09A)) ^ 0x823E7AA8)
                         - 187;
  *(void *)(v18 - 144) = v13;
  *(void *)(v18 - 136) = v13;
  *(void *)(v18 - 128) = v15;
  *(void *)(v18 - 120) = v14;
  (*(void (**)(uint64_t))(v17 + 8 * (v12 + 1292)))(v18 - 144);
  int v19 = 535753261 * ((~((v18 - 144) | 0x71B4EA7E) + ((v18 - 144) & 0x71B4EA7E)) ^ 0x84BF1BAE);
  *(_DWORD *)(v18 - 144) = -470130725 - v19 + v16;
  *(_DWORD *)(v18 - 140) = v12 - v19 + 968;
  *(void *)(v18 - 136) = a12;
  uint64_t v20 = (*(uint64_t (**)(uint64_t))(v17 + 8 * (v12 ^ 0xB04)))(v18 - 144);
  return (*(uint64_t (**)(uint64_t))(v17 + 8 * ((1812 * (*(_DWORD *)(v18 - 128) != 453445646)) ^ v12)))(v20);
}

uint64_t sub_100006E0C()
{
  return (*(uint64_t (**)(void))(v2 + 8 * ((31 * (((v1 - 1) ^ (v0 > 0x82)) & 1)) ^ (v1 + 235))))();
}

uint64_t sub_100006E58@<X0>(int a1@<W8>)
{
  return (*(uint64_t (**)(void))(v3
                              + 8
                              * (int)(((v2 == ((a1 + 873636873) & 0xCBED5BBD ^ (v1 + 456)))
                                     * ((a1 + 1495281550) & 0xA6DFCE3F ^ 0x410)) ^ a1)))();
}

uint64_t sub_100006ECC(uint64_t a1)
{
  unint64_t v3 = STACK[0x2B0];
  BOOL v4 = LODWORD(STACK[0x414]) == 0;
  STACK[0x3E8] = LODWORD(STACK[0x414]);
  return (*(uint64_t (**)(uint64_t, unint64_t))(v2
                                                              + 8
                                                              * ((103
                                                                * ((v4 ^ (v1 - 72 + v1 - 80 + 1)) & 1)) ^ v1)))(a1, v3);
}

uint64_t sub_100006F1C(double a1, double a2, double a3, double a4, int8x16_t a5, int8x16_t a6, uint64_t a7, int a8)
{
  int v14 = a8 - 50;
  uint64_t v15 = v11 + (v14 ^ 0x2EB ^ v13);
  int8x16_t v16 = vrev64q_s8(*(int8x16_t *)(v9 + v15 - 15));
  int8x16_t v17 = vextq_s8(v16, v16, 8uLL);
  int8x16_t v18 = vrev64q_s8(*(int8x16_t *)(v9 + v15 - 31));
  int8x16_t v19 = vextq_s8(v18, v18, 8uLL);
  uint64_t v20 = v8 + v15;
  int8x16_t v21 = vrev64q_s8(vaddq_s8(vsubq_s8(v17, vandq_s8(vaddq_s8(v17, v17), a5)), a6));
  *(int8x16_t *)(v20 - 15) = vextq_s8(v21, v21, 8uLL);
  int8x16_t v22 = vrev64q_s8(vaddq_s8(vsubq_s8(v19, vandq_s8(vaddq_s8(v19, v19), a5)), a6));
  *(int8x16_t *)(v20 - 31) = vextq_s8(v22, v22, 8uLL);
  return (*(uint64_t (**)(void))(v12 + 8 * ((1010 * (((v14 ^ 0xFFFFFE04) & v10) != 32)) ^ v14)))(0);
}

void sub_100006FC0(uint64_t a1)
{
  int v1 = 1374699841 * (a1 ^ 0x6DF41809);
  int v2 = *(_DWORD *)a1 + v1;
  uint64_t v3 = *(void *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 16);
  int v6 = *(_DWORD *)(a1 + 4) - v1;
  unsigned int v7 = 1225351577 * ((1667340836 - (&v9 | 0x63619A24) + (&v9 | 0x9C9E65DB)) ^ 0xE261FFE9);
  int v13 = v7 ^ (*(_DWORD *)(a1 + 56) - v1 + 202378104);
  uint64_t v14 = v5;
  uint64_t v16 = v5;
  int v10 = v7 ^ (v2 + 368399939);
  unsigned int v11 = (v6 ^ 0x888453B1) - v7 - 1409292419 + ((2 * v6) & 0xFEEFBFBE ^ 0xEEE7189C);
  uint64_t v9 = v3;
  uint64_t v12 = v4;
  uint64_t v8 = (uint64_t)*(&off_10005CE90 + v2 - 98);
  (*(void (**)(uint64_t *))(v8 + 8 * (v2 + 1871)))(&v9);
  __asm { BRAA            X8, X17 }
}

uint64_t sub_100007140()
{
  STACK[0x4E8] = STACK[0x428];
  LODWORD(STACK[0x340]) = STACK[0x4C4];
  return (*(uint64_t (**)(void))(v1
                              + 8
                              * (int)(((LODWORD(STACK[0x2B8]) - 1678813229 < ((((v0 - 1403768789) & 0x53ABCFF6)
                                                                             - 806787363) & 0x301693F7u)
                                                                           - 437)
                                     * (((((v0 - 1403768789) & 0x53ABCFF6) + 86855389) & 0xFAD2ABF7) - 433)) ^ (v0 - 1403768789) & 0x53ABCFF6)))();
}

uint64_t sub_10000716C()
{
  return (*(uint64_t (**)(void))(v2 + 8 * ((126 * ((v0 + 1) < 0x14)) ^ v1)))();
}

uint64_t sub_100007184(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void))(v8
                                                                                                 + 8
                                                                                                 * ((((v6 & 8) != (v7 ^ 0x44A) - 1532) * ((v7 ^ 0x44A) - 597)) ^ v7 ^ 0x44A)))(a1, a2, a3, a4, a5, a6, (a5 - a6));
}

uint64_t sub_1000071C0()
{
  uint64_t v3 = (*(uint64_t (**)(void))(v1 + 8 * (v0 ^ 0xEBA)))();
  return (*(uint64_t (**)(uint64_t))(v1 + 8 * ((1495 * (v2 == (v0 ^ 0x2FA) - 1158873110)) ^ (v0 - 1256))))(v3);
}

uint64_t sub_100007210()
{
  BOOL v2 = (((v0 - 1225) | 0x103) ^ 0x35277501) + LODWORD(STACK[0x260]) != -1722194663;
  return (*(uint64_t (**)(void))(v1 + 8 * ((2 * v2) | (16 * v2) | v0)))();
}

uint64_t sub_100007278()
{
  return (*(uint64_t (**)(void))(v2
                              + 8
                              * ((22
                                * (((v1 + 1) ^ ((v0 - 1678813228 + v1 - 1346 - 703) < 2)) & 1)) | v1)))();
}

uint64_t sub_1000072BC(double a1, int8x16_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  int v72 = LODWORD(STACK[0x2A8]) - 447;
  int8x16_t v73 = (int8x16_t)vld1q_dup_f32((const float *)v70);
  v74.i64[0] = 0x8000000080000000;
  v74.i64[1] = 0x8000000080000000;
  a2.i64[0] = *(void *)(v70 + 4);
  a2.i32[2] = *(_DWORD *)(v70 + 12);
  int8x16_t v75 = vextq_s8(v73, a2, 0xCuLL);
  int8x16_t v76 = a2;
  v76.i32[3] = *(_DWORD *)(v70 + 16);
  int32x4_t v77 = (int32x4_t)veorq_s8((int8x16_t)vshrq_n_u32((uint32x4_t)vorrq_s8(vandq_s8(v76, a69), vandq_s8(v75, v74)), 1uLL), *(int8x16_t *)(v70 + 4 * (LODWORD(STACK[0x2A8]) - 502) - 3512));
  v75.i32[0] = *(_DWORD *)(v71 + 4 * (*(_DWORD *)(v70 + 4) & 1));
  v75.i32[1] = *(_DWORD *)(v71 + 4 * (*(_DWORD *)(v70 + 8) & 1));
  v75.i32[2] = *(_DWORD *)(v71 + 4 * (*(_DWORD *)(v70 + 12) & 1));
  v75.i32[3] = *(_DWORD *)(v71 + 4 * (v76.i8[12] & 1));
  *(int8x16_t *)uint64_t v70 = veorq_s8((int8x16_t)vaddq_s32(vsubq_s32(v77, (int32x4_t)vandq_s8((int8x16_t)vaddq_s32(v77, v77), a68)), a67), v75);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v69 + 8 * v72))(1522624374, 506);
}

void sub_1000072C4(int a1@<W8>)
{
  uint64_t v5 = *(void *)(v2 + v1);
  unsigned int v6 = *v3 + a1;
  *(unsigned char *)(v5 + v6) = 82;
  *(unsigned char *)(v5 + v6 + 1) = -87;
  *(unsigned char *)(v5 + v6 + 2) = 75;
  *(unsigned char *)(v5 + v6 + 3) = 10;
  uint64_t v7 = *(void *)(v2 + v1);
  unsigned int v8 = ((2 * (a1 + *v3 + 4)) & 0xDF6B7BDA) + ((a1 + *v3 + 4) ^ 0x6FB5BDED) - 1874181613;
  *(unsigned char *)(v7 + v8) = 82;
  *(unsigned char *)(v7 + v8 + 1) = 82;
  *(unsigned char *)(v7 + v8 + 2) = 82;
  *(unsigned char *)(v7 + v8 + 3) = 86;
  _DWORD *v3 = v4 + 12;
}

uint64_t sub_100007398@<X0>(uint64_t a1@<X8>)
{
  *(void *)(a1 - 7 + v4 + 268700034 + v3 - v5 + ((v6 - 276144714) & 0x10759CFEu)) = *(void *)(v1
                                                                                                - 7
                                                                                                + v4
                                                                                                + 268700034
                                                                                                + v3
                                                                                                - v5
                                                                                                + ((v6 - 276144714) & 0x10759CFEu));
  return (*(uint64_t (**)(void))(v7 + 8 * ((3630 * (v5 - (v2 & 0xFFFFFFF8) == -8)) ^ v6)))();
}

uint64_t sub_100007408(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, unint64_t *a11, uint64_t a12, int a13, unint64_t *a14, int a15)
{
  unsigned int v19 = 1755732067 * (((&a11 | 0x545E70D) + (~&a11 | 0xFABA18F2)) ^ 0xDB835AD7);
  a14 = &STACK[0x2801F3359A3B3D0];
  a11 = &STACK[0x6DD0242DB3724EE9];
  a12 = v18;
  a13 = (v17 + 704) ^ v19;
  a15 = v19 ^ 0x33A35495;
  uint64_t v20 = (*(uint64_t (**)(unint64_t **))(v16 + 8 * (v17 + 1617)))(&a11);
  return (*(uint64_t (**)(uint64_t))(v16
                                            + 8
                                            * (((*(_DWORD *)(v18 - 0x3D8A64FC118460EALL) == v15) * (v17 ^ 0x3E9)) ^ v17)))(v20);
}

uint64_t sub_1000074E4(int a1)
{
  return (*(uint64_t (**)(void))(v3 + 8 * (((v1 == (v2 - 52)) * a1) ^ v2)))();
}

uint64_t sub_100007504(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  return (*(uint64_t (**)(void))(v6
                              + 8
                              * ((4080
                                * ((v4 ^ 0x1Fu) >= ((a4 + ((v5 + 814285071) | 0x85008080) + 273) ^ (v5 - 434471638) & 0x19E57BFD))) ^ v5)))();
}

uint64_t sub_100007564(uint64_t a1, uint64_t a2, uint64_t a3, int a4, int a5)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(v7
                                                     + 8
                                                     * ((44 * (v5 - 1439792564 >= (v6 ^ (a4 - 1075) ^ 0x465u))) ^ (a5 + v6 - 47))))(a1, -1439792564);
}

uint64_t sub_1000075B0@<X0>(int a1@<W8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21)
{
  int v24 = (a1 - 121) | 0x400;
  *int8x16_t v22 = 0x80000000;
  (*(void (**)(uint64_t))(v21 + 8 * (a1 + 1988)))(a21);
  unsigned int v25 = v22[1];
  unsigned int v26 = v22[((v24 - 1899297111) & 0x7134F5DB) - 145];
  unsigned int v27 = v22[398];
  int v28 = *(_DWORD *)(v23 - 160 + 4 * (v26 & 1));
  *int8x16_t v22 = v22[397] ^ ((v25 & 0x7FFFFFFE | *v22 & 0x80000000) >> 1) ^ *(_DWORD *)(v23 - 160 + 4 * (v25 & 1));
  v22[1] = v27 ^ ((v26 & 0x7FFFFFFE | v25 & 0x80000000) >> 1) ^ v28;
  return (*(uint64_t (**)(void))(v21 + 8 * (v24 - 438)))();
}

uint64_t sub_1000075EC@<X0>(uint64_t a1@<X8>)
{
  int v4 = *(_DWORD *)(v1 + 1428);
  if (v4 == 1680994579 || v4 == 1680994575) {
    return (*(uint64_t (**)(void))(v3
  }
                                + 8
                                * ((764 * (*(_DWORD *)(a1 + 476) == (((LODWORD(STACK[0x2AC]) - 1496) | 2) ^ 0x34D7C6C8))) ^ (LODWORD(STACK[0x2AC]) - 1494))))();
  STACK[0x408] = STACK[0x210];
  return v2();
}

uint64_t sub_10000771C(uint64_t a1, uint64_t a2, int a3)
{
  return (*(uint64_t (**)(void))(v5 + 8 * ((447 * ((a3 + 1 + v4) < 0x3C)) ^ v3)))();
}

uint64_t sub_100007804(uint64_t a1, uint64_t a2)
{
  return ((uint64_t (*)(void))*(&off_1000589E0 + ((248 * (*(_DWORD *)(a2 + 4) != 1228396330)) ^ 0x37Du)))();
}

uint64_t sub_10000783C(uint64_t a1, uint64_t a2)
{
  return ((uint64_t (*)(uint64_t))*(&off_1000589E0 + ((57 * (*(_DWORD *)(a2 + 4) != 1228396342)) ^ 0x658u)))(4294925278);
}

uint64_t sub_10000787C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, int a11, unint64_t *a12, char a13, unsigned int a14, uint64_t a15, int a16)
{
  int v24 = 1759421093 * ((&a11 - 2 * ((unint64_t)&a11 & 0xDE579572) - 564685454) ^ 0x6D2A2526);
  a13 = (((*(unsigned char *)(v16 + 24) + v21) ^ 0xC5)
       + (((v19 - 119) & 0xEA ^ 0xFC) & (2 * (*(unsigned char *)(v16 + 24) + v21)) ^ 0x14)
       - 10) ^ (-91 * ((&a11 - 2 * ((unint64_t)&a11 & 0xDE579572) + 114) ^ 0x26));
  a16 = v19 - v24 + 1670;
  a12 = &STACK[0x59E1F3EDA99096A4];
  a15 = v20;
  a14 = v24 + (v22 ^ 0x88D26293) + (v23 & 0xFE43DDFA ^ 0xEE4318D8) - 1661062368;
  uint64_t v25 = (*(uint64_t (**)(int *))(v18 + 8 * (v19 ^ 0x8B0)))(&a11);
  return (*(uint64_t (**)(uint64_t))(v18 + 8 * ((1255 * (a11 == v17)) ^ v19)))(v25);
}

uint64_t sub_1000079A0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, int a9@<W8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33)
{
  *(unsigned char *)(a4 + (v34 + a9 + 1419)) = *(unsigned char *)(a33 + a8 - 327863515);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v35 + 8 * (int)((120 * ((a9 - 200978466) < 0x40)) ^ ((v33 - 188) | a6))))(a1, a2, a3, a4, a5, a6, a7, a8, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19, a20,
           a21,
           a22,
           a23,
           a24,
           a25);
}

uint64_t sub_100007A14(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7)
{
  int v10 = v7 != a7 + ((v8 - 2084516562) & 0x7C3F3759) + 206 * (v8 ^ 0x286) - 3036;
  return (*(uint64_t (**)(void))(v9 + 8 * ((v10 | (v10 << 6)) ^ v8)))();
}

uint64_t sub_100007A6C(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 16) ^ (1755732067 * ((a1 + 127962867 - 2 * (a1 & 0x7A08EF3)) ^ 0xD9663328));
  return (*((uint64_t (**)(void))*(&off_10005CE90 + (int)(v1 & 0xCB0B79CC))
          + (((*(void *)(a1 + 8) == 0x3D8A64FC11846102) * (v1 - 1101)) ^ v1)))();
}

uint64_t sub_100007AF4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, int a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  int v29 = v24 + 1278;
  *(_DWORD *)(v28 - 104) = v24
                         + ((1625289054 - ((v28 - 144) | 0x60DFF15E) + ((v28 - 144) | 0x9F200EA1)) ^ 0xB8D47F8) * v25
                         - 40;
  *(void *)(v28 - 144) = a23;
  *(void *)(v28 - 136) = v26;
  *(void *)(v28 - 128) = v26;
  *(void *)(v28 - 120) = a17;
  *(void *)(v28 - 112) = a24;
  uint64_t v30 = (*(uint64_t (**)(uint64_t))(v27 + 8 * (v24 + 1869)))(v28 - 144);
  return (*(uint64_t (**)(uint64_t))(v27
                                            + 8
                                            * ((7 * (a19 + v29 - 616 + ((2 * v29) ^ 0xE3FA578B) > 0x7FFFFFFE)) ^ (v29 + 81))))(v30);
}

uint64_t sub_100007BC0()
{
  return 4294925278;
}

uint64_t sub_100007BCC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36)
{
  int v39 = 3 * (v37 ^ 0x2AD);
  *(unsigned char *)(a7 + (((2 * v39) ^ 0xFFFFF939) & (v36 + a4))) = *(unsigned char *)(a35 + a36 - 400146842)
                                                                           - (a8 & (2 * *(unsigned char *)(a35 + a36 - 400146842)))
                                                                           + 82;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v38 + 8 * ((239 * ((a4 + v36 + 1) < 0x40)) ^ v39)))(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27);
}

uint64_t sub_100007C48()
{
  return (*(uint64_t (**)(void))(v2
                              + 8
                              * ((253
                                * (((v1 << ((v0 ^ 0xDF) + 123)) & 0xBDFFD7DE ^ 0xCF654DA)
                                 + (v1 ^ 0x7984D582)
                                 + 771678174 == v0 + 218023028)) ^ v0)))();
}

uint64_t sub_100007CBC()
{
  LODWORD(STACK[0x3AC]) = STACK[0x288];
  LODWORD(STACK[0x3DC]) = STACK[0x290];
  STACK[0x2E8] = STACK[0x270];
  STACK[0x510] = STACK[0x280];
  STACK[0x338] = STACK[0x278];
  return sub_10002EA4C();
}

uint64_t sub_100007D10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,int a21,int a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,int a31)
{
  _DWORD *v33 = v33[623];
  return (*(uint64_t (**)(void))(v32 + 8 * ((1611 * (v31 - 1 == (a22 & 0x72FEBD87 ^ 0x87))) ^ (a31 - 440))))();
}

uint64_t sub_100007D64@<X0>(int a1@<W8>)
{
  return (*(uint64_t (**)(void))(v2 + 8 * ((127 * ((a1 + v1 - 980 - 830) > 7)) ^ (v1 - 980))))();
}

uint64_t sub_100007D74(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  return (*(uint64_t (**)(void))(v6 + 8 * (((v5 == (v4 - 98)) * (v4 ^ a4)) ^ v4)))();
}

uint64_t sub_100007D98@<X0>(uint64_t a1@<X8>)
{
  LODWORD(STACK[0x288]) = v2;
  return (*(uint64_t (**)(void))(v4
                              + 8
                              * (((*(unsigned __int8 *)(a1 + 236 + STACK[0x290]) != *(unsigned __int8 *)(v3 + 32 + STACK[0x290]))
                                * (7 * (v1 ^ 0x43E) + 259 + ((7 * (v1 ^ 0x43E)) ^ 0x38C) - 1170)) ^ (7 * (v1 ^ 0x43E)))))();
}

uint64_t sub_100007E04(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  int v19 = (v17 - 589) ^ 0x27E;
  *(_DWORD *)(a14 + 4 * v18) = ((0xD10582ED6FC879AFLL >> (v19 - 35)) ^ 0xD10582ED)
                               + v15
                               - ((2 * ((0xD10582ED6FC879AFLL >> (v19 - 35)) ^ 0xD10582ED)) & 0x65CEF260);
  BOOL v20 = v14 > 0x2CA51BD7;
  int v21 = 344 * ((v17 - 589) ^ 0x339);
  if (v20 == a8 + 309834205 < -749018072) {
    BOOL v20 = a8 + 309834205 < a4;
  }
  return (*(uint64_t (**)(void))(v16 + 8 * (((v21 - 676) * v20) ^ v19)))();
}

uint64_t sub_100007E20()
{
  return (*(uint64_t (**)(void))(v4
                              + 8
                              * ((62
                                * ((v1 & (2 * (*(unsigned __int8 *)(v2 + 8) - 11)))
                                 + ((v0 + ((v3 + 1668646938) & 0x9C8A765A) - 520) ^ (*(unsigned __int8 *)(v2 + 8) - 11)) == v0)) ^ v3)))();
}

uint64_t sub_100007E74(uint64_t a1)
{
  return (*(uint64_t (**)(void))(v3 + 8 * ((((v2 - 1249277817) ^ (v4 + 1648) ^ (v2 - 185)) * (v1 == a1)) ^ v2)))();
}

#error "10000A31C: call analysis failed (funcsize=2212)"

uint64_t sub_10000A320@<X0>(int a1@<W0>, int a2@<W8>)
{
  unsigned int v6 = v4[396] ^ ((*v4 & 0x7FFFFFFE | v4[623] & 0x80000000) >> 1);
  v4[623] = (v6 + v2 - ((v6 << ((a2 + 43) & 0xFB ^ 0xF0)) & (a1 + 1482))) ^ *(_DWORD *)(v5 + 4 * (*v4 & 1));
  return (*(uint64_t (**)(void))(v3 + 8 * ((938 * (LODWORD(STACK[0x494]) > 0x26F)) ^ (a2 - 1410))))();
}

uint64_t sub_10000A3A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  *(void *)(a9 + v10) = v13;
  return (*(uint64_t (**)(void))(v12
                              + 8
                              * (int)((((((v11 + 399767722) & 0xE82C06FE ^ 0xFFFFFFFFFFFFFD1CLL) & v9) != 8)
                                     * (((v11 + 399767722) & 0xE82C06FE ^ 0x7ED) - 810)) ^ (v11 + 399767722) & 0xE82C06FE)))();
}

uint64_t sub_10000A410()
{
  *(_DWORD *)(v5 - 128) = v3
                        + ((((v5 - 136) ^ 0xCE951637 | 0x3D05B776)
                          - ((v5 - 136) ^ 0xCE951637)
                          + (((v5 - 136) ^ 0xCE951637) & 0xC2FA4889)) ^ 0x7C35BA87)
                        * v2
                        + 1516;
  *(void *)(v5 - 136) = v0;
  *(void *)(v5 - 120) = v4;
  uint64_t v6 = (*(uint64_t (**)(uint64_t))(v1 + 8 * (v3 ^ 0x8E0)))(v5 - 136);
  return (*(uint64_t (**)(uint64_t))(v1
                                            + 8
                                            * ((1017 * (*(_DWORD *)(v5 - 124) - 1996101796 < (v3 ^ 0xD0C2176B))) ^ v3)))(v6);
}

uint64_t sub_10000A4BC(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(v3
                                            + 8
                                            * (((v1 < ((v2 - 512) ^ 0x1BEu)) * ((v2 - 2049531519) & 0x7A295FFC ^ 0x551)) ^ v2)))(a1);
}

uint64_t sub_10000A508()
{
  return (*(uint64_t (**)(void))(v2 + 8 * ((233 * (v0 + 1 == v3 + 44)) ^ v1)))();
}

uint64_t sub_10000A5D4()
{
  return (*(uint64_t (**)(void))(v3
                              + 8 * (((((v2 == v0) ^ (v1 + 100)) & 1) * ((v1 - 1425) ^ 0x4A)) ^ v1)))();
}

uint64_t sub_10000A610(uint64_t a1)
{
  int v2 = 1225351577 * ((a1 & 0x45F4E8E1 | ~(a1 | 0x45F4E8E1)) ^ 0xC4F48D2C);
  int v3 = *(_DWORD *)(a1 + 12);
  uint64_t v4 = *(void *)(a1 + 16);
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 48);
  unsigned int v7 = 1224239923 * ((2 * (&v10 & 0x296E5BF0) - &v10 + 1452385292) ^ 0xA42259DB);
  int v8 = (*(_DWORD *)(a1 + 8) ^ v2) - 368400037;
  uint64_t v13 = *(void *)a1;
  uint64_t v14 = v5;
  uint64_t v10 = v6;
  uint64_t v12 = v4;
  int v16 = v8 + v7 + 949;
  int v11 = v2 + v3 - v7 + 913803552;
  uint64_t result = (*((uint64_t (**)(uint64_t *))*(&off_10005CE90 + v8) + v8 + 1951))(&v10);
  *(_DWORD *)(a1 + 40) = v15;
  return result;
}

void sub_10000A750()
{
  uint64_t v0 = (uint64_t)*(&off_10005CE90
                + ((85 * ((qword_100060158 + dword_100060118) ^ 0xD)) ^ byte_100056960[byte_1000518D0[(85 * ((qword_100060158 + dword_100060118) ^ 0xD))] ^ 0x7D])
                - 16);
  uint64_t v1 = *(void *)(v0 - 4);
  int v2 = (uint64_t *)*(&off_10005CE90
                  + (byte_1000519D0[byte_10004D730[(85 * ((qword_100060158 + v1) ^ 0xD))] ^ 0xE6] ^ (85 * ((qword_100060158 + v1) ^ 0xD)))
                  - 159);
  uint64_t v3 = (*v2 ^ v1) - (void)&v9;
  uint64_t v4 = 839241301 * (v3 - 0x78A901D92725650DLL);
  uint64_t v5 = 839241301 * (v3 ^ 0x78A901D92725650DLL);
  *(void *)(v0 - 4) = v4;
  uint64_t *v2 = v5;
  LOBYTE(v5) = 85 * ((v5 + *(_DWORD *)(v0 - 4)) ^ 0xD);
  *(_DWORD *)*(&off_10005CE90 + (v5 ^ byte_1000519D0[byte_10004D730[v5] ^ 0x9B]) - 79) = -1158872075;
  uint64_t v6 = (uint64_t)*(&off_10005CE90
                + ((85 * ((qword_100060158 + dword_100060118) ^ 0xD)) ^ byte_100056960[byte_1000518D0[(85 * ((qword_100060158 + dword_100060118) ^ 0xD))] ^ 0x42])
                + 136);
  uint64_t v7 = (*(uint64_t (**)(uint64_t, uint64_t))(v6
                                                   + 8
                                                   * ((byte_10005696C[(byte_1000518D4[(85 * (*(unsigned char *)(v0 - 4) ^ 0xD ^ *(unsigned char *)v2)) - 4] ^ 0x7D) - 12] ^ (85 * (*(unsigned char *)(v0 - 4) ^ 0xD ^ *(unsigned char *)v2)))
                                                    + 2009)))(512, 1509315540);
  unsigned __int8 v8 = 85 * ((*(_DWORD *)v2 - *(_DWORD *)(v0 - 4)) ^ 0xD);
  *(void *)((char *)*(&off_10005CE90
                      + (byte_10004A064[(byte_100056B68[v8 - 8] ^ 0x62) - 4] ^ v8)
                      - 222)
            - 4) = v7;
  __asm { BRAA            X8, X17 }
}

uint64_t sub_10000A9AC(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  return (*(uint64_t (**)(void))(v6
                                           + 8 * (int)(((((v5 + 678467098) & 0xD78F6F8F) - 957) * (v4 == a4)) ^ v5)))((v5 - 87));
}

uint64_t sub_10000A9E8()
{
  return ((uint64_t (*)(void))STACK[0x2F0])();
}

uint64_t sub_10000AA20()
{
  void *v1 = v5;
  return (*(uint64_t (**)(void))(v4 + 8 * (((v3 == 0) * v2) ^ v0)))();
}

uint64_t sub_10000AA44()
{
  return (*(uint64_t (**)(void, uint64_t))(v4
                                                    + 8
                                                    * ((((v3 ^ 0xE22) - 2040) * ((v1 + v0 - 767295169) < 8)) ^ v3)))((v3 ^ 0xE22u) - 1013, v2);
}

uint64_t sub_10000AAAC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return (*(uint64_t (**)(uint64_t))(v10
                                            + 8
                                            * ((((v9 ^ 0x576) + (v9 ^ 0x70F) - 2153)
                                              * (*(_DWORD *)(v11 - 144) == *(_DWORD *)(v11 - 152))) ^ v9)))(a9);
}

uint64_t sub_10000AAF4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,int a27)
{
  return sub_10002B74C(-1320429705, a5, (a27 & 0xDFFFFFFF ^ 0x9AED03F5) - 1034711200 - ((2 * (a27 & 0xDFFFFFFF ^ 0x9AED03F5)) & 0x84A71EC0));
}

uint64_t sub_10000AC8C()
{
  *(void *)(v5 - 136) = v0;
  *(void *)(v5 - 120) = v4;
  *(_DWORD *)(v5 - 128) = v3 + ((v5 - 136) ^ 0x8FA51BC6) * v2 + 11;
  uint64_t v6 = (*(uint64_t (**)(uint64_t))(v1 + 8 * (v3 ^ 0xEC3)))(v5 - 136);
  return (*(uint64_t (**)(uint64_t))(v1
                                            + 8
                                            * ((484 * (*(_DWORD *)(v5 - 124) + ((4 * v3) ^ 0x8905FD54) < 0x9E567FF8)) ^ v3)))(v6);
}

void sub_10000AD18()
{
}

uint64_t sub_10000AD20(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,int a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,int a45,int a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,int a55,int a56,int a57,uint64_t a58,int a59,uint64_t a60,unint64_t a61,uint64_t a62,unint64_t a63)
{
  return sub_100014C24(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
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
           a39,
           a40,
           a41,
           a42,
           a43,
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

uint64_t sub_10000AD4C@<X0>(int a1@<W1>, uint64_t a2@<X8>)
{
  int v6 = v3 + v2;
  int v7 = (v5 ^ 0x3D9) + v3;
  *(_DWORD *)(*(void *)(v4 - 0x4C6937770F4864B0) + 4 * v6) = a1;
  *(_DWORD *)(v4 - 0x4C6937770F4864B4) = v7;
  int v8 = v7 + v2;
  if (v7 + v2 < 0) {
    int v8 = -v8;
  }
  return (*(uint64_t (**)(void))(a2
                              + 8
                              * ((180
                                * ((((v5 - 876) ^ ((int)(v2
                                                       + ((v5 - 876) ^ 0x2DA)
                                                       + (v8 ^ 0x1D7EFE97)
                                                       + ((2 * v8) & 0x3AFDFD2E)
                                                       + ((v5 - 876) ^ 0xF3FFCD82)
                                                       - 695) >= 0)) & 1) == 0)) ^ (v5 - 876))))();
}

uint64_t sub_10000AE28@<X0>(uint64_t a1@<X8>)
{
  int v11 = (char)(v1 - 69) - (char)(v3 - 69);
  LODWORD(STACK[0x2A0]) = ((2 * v11) & 0xFF7FF5CC) + ((v2 + 2143287856) ^ v11) - 361316898;
  uint64_t v12 = (v2 + 1632032432) & 0x9EB929BF;
  int v13 = (*(unsigned __int8 *)(a1 + v12 + 834) ^ v10) - *(unsigned __int8 *)(v6 + v12 + 854);
  int v14 = (v13 ^ v8) + v5 + (v9 & (2 * v13)) == v4;
  return (*(uint64_t (**)(uint64_t))(v7 + 8 * (int)(((32 * v14) | (v14 << 6)) ^ v12)))(1794690833);
}

uint64_t sub_10000AE6C@<X0>(uint64_t a1@<X8>)
{
  return (*(uint64_t (**)(uint64_t))(v3 + 8
                                                 * (((32 * (v4 + 1 == v2 + 60)) | ((v4 + 1 == v2 + 60) << 6)) ^ v1)))(a1);
}

uint64_t sub_10000AF3C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, int a6)
{
  return (*(uint64_t (**)(void))(v6 + 8 * ((((a6 ^ 0x501) - 364) * (v7 == a5)) ^ a6)))(0);
}

uint64_t sub_10000AF68(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22)
{
  int v27 = v22 + 629;
  int v28 = ((320601217 - ((v26 - 144) | 0x131BFC81) + ((v26 - 144) | 0xECE4037E)) ^ 0xE6100D51) * v25;
  *(_DWORD *)(v26 - 144) = (v27 ^ 0xE3FA5B56) + v24 - v28;
  *(_DWORD *)(v26 - 140) = v27 - v28 + 588;
  *(void *)(v26 - 136) = a22;
  uint64_t v29 = (*(uint64_t (**)(uint64_t))(v23 + 8 * (v27 + 904)))(v26 - 144);
  return (*(uint64_t (**)(uint64_t))(v23
                                            + 8
                                            * (((*(_DWORD *)(v26 - 128) == 453445646) * ((v27 ^ 0x466) + 170)) ^ v27)))(v29);
}

uint64_t sub_10000AF98@<X0>(uint64_t a1@<X3>, int a2@<W8>)
{
  *(_OWORD *)(a1 + a2 + 16 + (v2 ^ 0xF4054930)) = *v4;
  return (*(uint64_t (**)(void))(v5 + 8 * ((489 * (v3 == 16)) ^ v2)))();
}

uint64_t sub_10000AFA4()
{
  *(_DWORD *)(v5 - 112) = v0 - 1224239923 * ((v5 + 2087162237 - 2 * ((v5 - 128) & 0x7C6791FD)) ^ 0x8ED46C2A) - 484;
  *(void *)(v5 - 128) = v3;
  *(void *)(v5 - 120) = v2;
  uint64_t v6 = (*(uint64_t (**)(uint64_t))(v1 + 8 * (v0 + 1413)))(v5 - 128);
  return (*(uint64_t (**)(uint64_t))(v1
                                            + 8
                                            * (((((v0 - 395614984) & 0x17949B2D ^ 0x63A) + ((v0 - 607) | 0x20D))
                                              * (v4 == 918830165)) ^ v0)))(v6);
}

uint64_t sub_10000B05C@<X0>(uint64_t a1@<X0>, int a2@<W1>, int a3@<W8>)
{
  uint64_t v9 = v5 + (a2 ^ 0x26u) + v4 + v3 - v6 + 1512;
  *(void *)(a1 - 7 + v9) = *(void *)(v7 - 7 + v9);
  return (*(uint64_t (**)(void))(v8 + 8 * ((38 * (((a2 ^ 0xFFFFFED6) & a3) != v6 + 8)) | a2 ^ 0x26)))();
}

void sub_10000B0C4()
{
}

uint64_t sub_10000B0E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,int a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  unint64_t v71 = STACK[0x3F0];
  int v72 = *(unsigned __int8 *)(STACK[0x3F0] - 0x1FA9E8BAFD93F958) ^ 0xCF;
  if (v72 == 2) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v70
  }
                                                                                           + 8
                                                                                           * (((*(_DWORD *)(v71 - 0x1FA9E8BAFD93F95CLL) == 1049205778)
                                                                                             * a57) ^ (LODWORD(STACK[0x2AC]) - 375))))(a1, a2, 4158721196, 2315474905, 205, 889516850);
  if (v72 == 1) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v70 + 8 * ((29 * (*(_DWORD *)(v71 - 0x1FA9E8BAFD93F95CLL) == a69 + 1049205289)) ^ (LODWORD(STACK[0x2AC]) + 123))))(a1, 3119665326, 1470973143, 91, 205, 889516850, 295671177);
  }
  unint64_t v74 = STACK[0x250];
  STACK[0x3D0] = 91;
  *(unsigned char *)(v71 - 0x1FA9E8BAFD93F95DLL) = ((((((v69 - 74) & 0xFD) - 117) | 0xC1) - 55) ^ v74) * (v74 + 17);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v70
                                                                                                  + 8 * (int)((14 * (STACK[0x3D0] == 0)) ^ (v69 + 707276982) & 0xD5D7C9FD)))(a1, 3119665326, 1470973143, 91, 205, 889516850, 295671177);
}

uint64_t sub_10000B284(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v5
                                                                                + 8
                                                                                * ((209
                                                                                  * (v4 != ((251
                                                                                           * (v6 & 0x437561FF ^ 0x151)) ^ 0x43A4E32B)
                                                                                         + (v6 & 0x437561FF)
                                                                                         - 75)) ^ v6 & 0x437561FFu)))(a1, a2, a3, a4, 3398038152);
}

uint64_t sub_10000B2DC(int a1, int a2, int a3, uint64_t a4, uint64_t a5, int a6)
{
  int v13 = a6 - 320;
  v23.val[1].i64[0] = ((_BYTE)v9 + 3) & 0xF;
  v23.val[1].i64[1] = ((_BYTE)v9 + 2) & 0xF;
  v23.val[2].i64[0] = ((_BYTE)v9 + 1) & 0xF;
  v23.val[2].i64[1] = v9 & 0xF;
  v23.val[3].i64[0] = ((_BYTE)v9 - 1) & 0xF;
  v23.val[3].i64[1] = ((_BYTE)v9 + 14) & 0xF;
  v24.val[0].i64[0] = ((_BYTE)v9 + 13) & 0xF;
  v24.val[0].i64[1] = ((_BYTE)v9 + 12) & 0xF;
  uint64_t v14 = *(void *)(v12 - 120) - 15;
  v24.val[1].i64[0] = ((_BYTE)v9 + 11) & 0xF;
  v24.val[1].i64[1] = ((_BYTE)v9 + 10) & 0xF;
  unsigned int v15 = a2 + a1 + a3;
  v24.val[2].i64[0] = ((_BYTE)v9 + 9) & 0xF;
  v24.val[2].i64[1] = (v9 + 8) & 0xF;
  v24.val[3].i64[0] = ((_BYTE)v9 + 7) & 0xF;
  v24.val[3].i64[1] = ((_BYTE)v9 + 6) & 0xF;
  v16.i64[0] = 0x505050505050505;
  v16.i64[1] = 0x505050505050505;
  v17.i64[0] = 0x5252525252525252;
  v17.i64[1] = 0x5252525252525252;
  uint64_t v18 = v15 & ((v13 + 367) ^ 0x576);
  v23.val[0].i64[0] = v18;
  v23.val[0].i64[1] = ((_BYTE)v9 + 4) & 0xF;
  v19.i64[0] = vqtbl4q_s8(v23, (int8x16_t)xmmword_100056D90).u64[0];
  v19.i64[1] = vqtbl4q_s8(v24, (int8x16_t)xmmword_100056D90).u64[0];
  int8x16_t v20 = vrev64q_s8(veorq_s8(veorq_s8(*(int8x16_t *)(v14 + v15), *(int8x16_t *)(v6 + v18 - 15)), veorq_s8(*(int8x16_t *)(v8 + v18 - 15), *(int8x16_t *)(v7 + v18 - 15))));
  int8x16_t v21 = vrev64q_s8(veorq_s8(veorq_s8(vextq_s8(v20, v20, 8uLL), v17), vmulq_s8(v19, v16)));
  *(int8x16_t *)(v14 + v15) = vextq_s8(v21, v21, 8uLL);
  return (*(uint64_t (**)(void))(v11 + 8 * ((471 * ((v10 & 0xFFFFFFF0) == 16)) ^ v13)))();
}

uint64_t sub_10000B448(uint64_t a1, uint64_t a2, int a3, int a4)
{
  BOOL v11 = (v9 & (2 * (*(unsigned __int8 *)(a2 + 9) - 1))) + ((*(unsigned __int8 *)(a2 + 9) - 1) ^ v8) == ((a3 - 883298568) & 0xC9118DEF) + a4
     && (v4 + v5 + 4) < 0xC9;
  return (*(uint64_t (**)(void))(v6 + 8 * ((v11 * (v7 + ((a3 - 1056964700) | 0x8118D44) + 699)) ^ a3)))();
}

uint64_t sub_10000B4C8()
{
  return (*(uint64_t (**)(void))(v2 + 8 * ((27 * ((v0 ^ 0x8B98BE4B ^ (v1 - 459229644) & 0x1B5F46FC) == 0)) ^ v1)))();
}

uint64_t sub_10000B528()
{
  return (*(uint64_t (**)(void))(v3 + 8 * ((((5 * (v1 ^ 0x75C) - 7) ^ (199 * (v1 ^ 0x73F))) * (v0 == v2)) ^ v1)))();
}

uint64_t sub_10000B568(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return (*(uint64_t (**)(void))(v6 + 8 * ((52 * (v5 + 1 == v7 + 64)) ^ a5)))();
}

uint64_t sub_10000B624(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  unsigned int v12 = v8 - 1843657716;
  if (v12 <= 0x40) {
    unsigned int v12 = 64;
  }
  return (*(uint64_t (**)(void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v11
                                                                                                 + 8
                                                                                                 * ((8 * (v10 - v7 - v9 + v12 < 0xF)) | (16 * (v10 - v7 - v9 + v12 < 0xF)) | 0x284u)))((v10 - v7 - v9), a2, a3, a4, a5, 2602388831, a7);
}

uint64_t sub_10000B694()
{
  uint64_t result = (*(uint64_t (**)(void))(v2 + 8 * (v0 + 779)))();
  _DWORD *v1 = -797628418;
  return result;
}

uint64_t sub_10000B6CC()
{
  return (*(uint64_t (**)(void))(v3 + 8 * ((((v2 + 845) ^ 0x107) * (v0 == v1)) ^ v2)))();
}

uint64_t sub_10000B700()
{
  return sub_10000B7E4(0x3F4D603B87B823A6);
}

uint64_t sub_10000B7E4(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8)
{
  BOOL v12 = v9 > 0x19EA9541;
  if (v12 == v10 + a4 < -434804034) {
    BOOL v12 = v10 + a4 < a8;
  }
  return (*(uint64_t (**)(void))(v8 + 8 * ((466 * v12) ^ v11)))();
}

uint64_t sub_10000B858(uint64_t a1, int a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7, int a8)
{
  return (*(uint64_t (**)(void))(v10
                              + 8
                              * (((*(_DWORD *)(*a5 + 4 * (((138 * (v8 ^ 0x14E)) ^ 0x703) + a8 + a2)) != ((138 * (v8 ^ 0x14E)) ^ 0x288 ^ (v9 + 906)))
                                * ((138 * (v8 ^ 0x14E) - 1471) ^ 0x137)) ^ (138 * (v8 ^ 0x14E)))))();
}

uint64_t sub_10000B87C()
{
  *uint64_t v0 = 293522565;
  return sub_1000443C4();
}

uint64_t sub_10000B888()
{
  return (*(uint64_t (**)(void))(v0
                              + 8
                              * ((59
                                * (*(_DWORD *)(v1 - 0x3D8A64FC118460EALL) == 29 * (((v2 + 754) | 2) ^ 0x6A8)
                                                                           - 1158873757)) ^ v2)))();
}

uint64_t sub_10000B8E4(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8)
{
  return (*(uint64_t (**)(void))(v8 + 8 * (((((a8 - 1054) ^ 0x269) - 789) * (v9 == a4)) | a8)))();
}

uint64_t sub_10000B910(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, int a15, int a16)
{
  if (a16 - 293522565 >= 0) {
    int v18 = a16 - 293522565;
  }
  else {
    int v18 = ~(a16 - 293522566);
  }
  return (*(uint64_t (**)(uint64_t))(v17
                                            + 8
                                            * ((((int)((v18 ^ 0x797EFE8F)
                                                     - 1744843274
                                                     + ((v18 << (((v16 + 82) | 2) - 81)) & 0xF2FDFD1E)
                                                     - 293522566) >= 0)
                                              * ((((v16 + 82) | 2) + 1409) ^ 0x702)) ^ ((v16 + 82) | 2))))(3001514288);
}

uint64_t sub_10000B9A0@<X0>(uint64_t a1@<X6>, int a2@<W8>)
{
  *(_OWORD *)(a1 + (a2 + 16)) = *v4;
  return (*(uint64_t (**)(void))(v5 + 8 * (((v3 == 16) * (319 * (v2 ^ 0x33E) - 636)) | v2)))();
}

uint64_t sub_10000B9AC(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  return (*(uint64_t (**)(void))(v5
                                           + 8
                                           * ((((((v4 & 0x18) == 0) ^ a4) & 1) * ((a4 ^ 0x66A) - 1910)) ^ a4)))(a4 ^ 0x7F6u);
}

uint64_t sub_10000B9E8@<X0>(uint64_t a1@<X8>)
{
  return (*(uint64_t (**)(void))(a1 + 8 * ((25 * (v1 == 1228396329)) ^ 0x76Au)))();
}

uint64_t sub_10000BA1C@<X0>(uint64_t a1@<X0>, int a2@<W2>, int a3@<W8>)
{
  *(unsigned char *)(a1 + (v4 - 50709206)) = *(unsigned char *)(v3 + (v4 - 50709206));
  return (*(uint64_t (**)(void))(v5 + 8 * (((v4 - 1 == a3) * (a2 ^ 0x9A)) ^ a2)))();
}

uint64_t sub_10000BA60()
{
  return (*(uint64_t (**)(void))(v1 + 8 * ((31 * (((v0 - 1) ^ (v2 > 0x82)) & 1)) ^ (v0 + 235))))();
}

uint64_t sub_10000BA94@<X0>(uint64_t a1@<X8>)
{
  uint64_t v8 = (v3 + v4);
  int v9 = ((*(unsigned __int8 *)(v1 + (v8 + 2)) ^ v5) << (((v2 + 124) & 0xF1) + 31)) | *(unsigned __int8 *)(v1 + v8) ^ v5 | ((*(unsigned __int8 *)(v1 + (v8 + 1)) ^ v5) << 8) | ((*(unsigned __int8 *)(v1 + (v8 + 3)) ^ v5) << 24);
  *(_DWORD *)(a1 + v8) = v9 + v7 - ((2 * v9) & 0x75DA07EA);
  return (*(uint64_t (**)(void))(v6 + 8 * ((27 * ((v3 + 4 + v4) < 0x40)) ^ v2)))();
}

uint64_t sub_10000BB40(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  STACK[0x310] = *(void *)(v10 + 8 * v9);
  return sub_100030BB8(a1, a2, a3, 1468, a5, a6, a7, a8, a9);
}

uint64_t sub_10000BB84(int a1)
{
  int v7 = v3 + v1;
  int v8 = v7 + v2;
  if ((v7 + v2) <= 0x40) {
    int v8 = v4;
  }
  return (*(uint64_t (**)(void))(v6 + 8 * ((13 * (((v5 - v7 < (a1 + v8)) ^ 0xED) & 1)) ^ 0x516u)))();
}

uint64_t sub_10000BD74@<X0>(uint64_t a1@<X2>, int a2@<W8>)
{
  unsigned int v6 = *(_DWORD *)((char *)&STACK[0x2A8] + ((v4 + a2) & 0xFFFFFFFC) + 72);
  *(unsigned char *)(a1 + (v4 + a2)) = v6 ^ 0xF4;
  unsigned int v7 = (v6 >> (((v3 + 11) & 0x6E) - 62)) ^ 0xFFFFFFD3;
  *(unsigned char *)(a1 + (v4 + a2 + 1)) = v7 + (~(2 * v7) | 0x5B) + 83;
  *(unsigned char *)(a1 + (v4 + a2 + 2)) = (BYTE2(v6) ^ 0xE7) - ((2 * (BYTE2(v6) ^ 0xE7)) & 0xA4) + 82;
  *(unsigned char *)(a1 + (v4 + a2 + 3)) = (HIBYTE(v6) ^ 0x2C) - ((v6 >> 23) & 0xA4) + 82;
  unsigned int v8 = LODWORD(STACK[0x304]) + 819978861;
  BOOL v9 = v8 < v2;
  BOOL v10 = v4 + 1644413352 < v8;
  if (v4 + 1644413352 < v2 != v9) {
    BOOL v10 = v9;
  }
  return (*(uint64_t (**)(void))(v5 + 8 * ((1221 * v10) ^ v3)))();
}

uint64_t sub_10000BE6C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40)
{
  LODWORD(STACK[0x454]) = 627309544;
  LODWORD(STACK[0x4F0]) = 128;
  unint64_t v43 = STACK[0x300] + 0x4C6937770F4866C8;
  unint64_t v44 = STACK[0x2E0];
  unint64_t v45 = STACK[0x360];
  int v46 = 535753261 * ((((2 * (v42 - 200)) | 0x7B43AD7C) - (v42 - 200) + 1113467202) ^ 0xB755D891);
  *(void *)(v42 - 184) = STACK[0x300] + 0x4C6937770F4867D8;
  *(void *)(v42 - 176) = v43;
  *(_DWORD *)(v42 - 128) = v46 + v40 + 74;
  *(void *)(v42 - 200) = v45;
  *(void *)(v42 - 144) = v44;
  *(void *)(v42 - 136) = a40;
  *(_DWORD *)(v42 - 192) = v46 + 1689929610;
  *(void *)(v42 - 152) = 0;
  *(void *)(v42 - 168) = 0;
  uint64_t v47 = (*(uint64_t (**)(uint64_t))(v41 + 8 * (v40 ^ 0xC57)))(v42 - 200);
  return (*(uint64_t (**)(uint64_t))(v41
                                            + 8
                                            * (((*(_DWORD *)(v42 - 160) == ((v40 + 742) ^ 0xBAED0504))
                                              * (((v40 - 971) | 0x499) ^ 0x4FD)) ^ v40)))(v47);
}

uint64_t sub_10000BF7C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36)
{
  HIDWORD(a22) = a1;
  return sub_100004BD4(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
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
           a36);
}

uint64_t sub_10000BF94(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,int a26,int a27,unsigned __int8 a28,unint64_t a29)
{
  return sub_10000CC08(a2, a3, a5, a6, a7, a8, v29, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19, a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29);
}

uint64_t sub_10000BF9C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7)
{
  return (*(uint64_t (**)(void))(v8 + 8 * (v7 ^ ((v9 == v10) * a7))))();
}

uint64_t sub_10000BFBC@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v4 = ((v2 - 724) | 0x82u) - 1168;
  int8x8_t v5 = vrev64_s8(*(int8x8_t *)(a2 + v4 - 7));
  *(int8x8_t *)(a1 - 7 + v4) = vrev64_s8(vadd_s8(vsub_s8(v5, vand_s8(vadd_s8(v5, v5), (int8x8_t)0xA4A4A4A4A4A4A4A4)), (int8x8_t)0x5252525252525252));
  return (*(uint64_t (**)(void))(v3 + 8 * (v2 - 1069)))();
}

uint64_t sub_10000C03C(uint64_t a1, int a2, int a3, unsigned int a4)
{
  return (*(uint64_t (**)(void))(v5 + 8 * (a3 | (8 * (*(_DWORD *)(*v4 + 4 * a4) != a3 + a2)))))();
}

void sub_10000C068()
{
  *int v0 = 1158830272;
}

uint64_t sub_10000C078()
{
  return (*(uint64_t (**)(void))(v2
                              + 8
                              * ((218 * (((v0 < 0x20) ^ (((((v1 - 71) | 0x48) - 119) | 0x28) - 56)) & 1)) ^ ((v1 - 1607) | 0x48))))();
}

uint64_t sub_10000C0C0(unint64_t a1)
{
  STACK[0x4C8] = a1;
  LODWORD(STACK[0x524]) = v2;
  uint64_t v4 = (v1 - 607);
  unint64_t v5 = STACK[0x458];
  unint64_t v6 = ((unint64_t)&STACK[0x4F8] ^ 0x3CB3F667F5DBE3D5 ^ v4)
     + ((2 * (void)&STACK[0x4F8]) & 0x7967ECCFEBB7C6F0)
     - 0x24309226A048217FLL;
  STACK[0x4F8] = 335;
  *(unsigned char *)(v5 + 335) = (v6 ^ 0xBA) * (v6 + 17);
  return (*(uint64_t (**)(void))(v3 + 8 * (int)(((STACK[0x4F8] == 0) * ((v1 - 66) ^ 0x78)) ^ v4)))();
}

void sub_10000C194()
{
}

uint64_t sub_10000C1A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v6 = v4 - 845;
  uint64_t v7 = (v4 - 529);
  uint64_t v8 = (v4 - 1473);
  unint64_t v9 = v3 + a3;
  if (v9 <= 0x38) {
    unint64_t v9 = 56;
  }
  return (*(uint64_t (**)(void))(v5 + 8 * ((11 * (v9 - v3 + (v7 ^ 0x62FC6ACA) >= v8 - 296)) | v6)))();
}

void sub_10000C210()
{
  unint64_t v4 = STACK[0x398] + 0x1FA9E8BAFD93FA38;
  STACK[0x2D8] = v4;
  int v5 = 235795823 * ((((v3 - 200) | 0x281C9517) - (v3 - 200) + ((v3 - 200) & 0xD7E36AE8)) ^ 0xBCB1DC4E);
  *(void *)(v3 - 184) = v4;
  *(_DWORD *)(v3 - 196) = v5 + 832817738;
  *(_DWORD *)(v3 - 192) = 1172345370 - v5 + v2 + 46;
  (*(void (**)(uint64_t))(v1 + 8 * (v2 ^ 0x82F)))(v3 - 200);
  STACK[0x518] = *(void *)(v1 + 8 * v2);
  STACK[0x298] = v0;
  JUMPOUT(0x1000039F8);
}

uint64_t sub_10000C2D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8)
{
  return sub_10001CC98(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_10000C2FC()
{
  return (*(uint64_t (**)(void))(v1 + 8 * ((82 * (STACK[0x350] != 0)) ^ (v0 - 1259))))();
}

uint64_t sub_10000C328@<X0>(int a1@<W5>, uint64_t a2@<X8>)
{
  *(void *)(v2 - 7 + v5 + v4 + v7 - v8 + ((a1 + 1154481805) & 0xBB3003BE)) = *(void *)(a2
                                                                                         - 7
                                                                                         + v5
                                                                                         + v4
                                                                                         + v7
                                                                                         - v8
                                                                                         + ((a1 + 1154481805) & 0xBB3003BE));
  return (*(uint64_t (**)(void))(v9 + 8 * ((1186 * (v8 - (v3 & 0xFFFFFFF8) == -8)) ^ a1)))(v6 - (v3 & 0xFFFFFFF8));
}

uint64_t sub_10000C390(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23)
{
  int v28 = v23 + 443;
  *(_DWORD *)(v27 - 112) = v28 + ((v26 - ((v27 - 120) | v26) + ((v27 - 120) | 0x1930A684)) ^ 0x9695BD42) * v25 + 587;
  *(void *)(v27 - 120) = a23;
  *(void *)(v27 - 104) = a21;
  uint64_t v29 = (*(uint64_t (**)(uint64_t))(v24 + 8 * (v28 + 1023)))(v27 - 120);
  return (*(uint64_t (**)(uint64_t))(v24
                                            + 8
                                            * (int)(((*(_DWORD *)(v27 - 108) > 0x76FA18A2u)
                                                   * ((((v28 + 389442411) & 0xE8C991FF) + 1377) ^ 0x707)) | v28)))(v29);
}

uint64_t sub_10000C398@<X0>(int a1@<W8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, int a17, int a18, int a19, int a20,int a21,uint64_t (*a22)(void))
{
  LODWORD(STACK[0x2F4]) = (a1 ^ v25) + (a17 ^ v25) + v25 - (v24 & (2 * ((a1 ^ v25) + (a17 ^ v25))));
  LODWORD(STACK[0x2F8]) = (v26 ^ v25) + (a18 ^ v25) + v25 - (v24 & (2 * ((v26 ^ v25) + (a18 ^ v25))));
  LODWORD(STACK[0x2FC]) = (v23 ^ v25) + (a19 ^ v25) + v25 - (v24 & (2 * ((v23 ^ v25) + (a19 ^ v25))));
  LODWORD(STACK[0x300]) = (v22 ^ v25) + (a21 ^ v25) + v25 - (v24 & (2 * ((v22 ^ v25) + (a21 ^ v25))));
  return a22();
}

uint64_t sub_10000C434(uint64_t a1, uint64_t a2, int a3, uint64_t a4, int a5, uint64_t a6, int a7)
{
  return (*(uint64_t (**)(void))(v7
                              + 8
                              * ((((a5 + a3 + a7 + 237) < 0x40) * ((a7 + 2017220786) ^ 0x783C5D37)) ^ a7)))();
}

uint64_t sub_10000C48C(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7)
{
  unsigned int v10 = a3 + v9 + ((a7 + 454) ^ 0x15EC5489);
  unsigned int v11 = v7 - 329173806;
  int v12 = (v11 < 0x6884EAEB) ^ (v10 < 0x6884EAEB);
  BOOL v13 = v10 > v11;
  if (v12) {
    BOOL v13 = v10 < 0x6884EAEB;
  }
  return (*(uint64_t (**)(void))(v8 + 8 * ((2027 * v13) ^ (a7 + 427))))();
}

uint64_t sub_10000C500@<X0>(uint64_t a1@<X8>)
{
  STACK[0x408] = a1 - 16;
  return (*(uint64_t (**)(void))(v2 + 8 * (((v1 == v4) * (v3 ^ 0x291)) ^ (v3 - 1178))))();
}

uint64_t sub_10000C544@<X0>(unsigned int a1@<W0>, int a2@<W1>, int a3@<W8>)
{
  int v10 = v5 + v4 - 1138;
  *(_DWORD *)(*v7 + 4 * (a3 + v6 + v10 + v8)) = *(_DWORD *)(*v7 + 4 * (v3 + v10 + 382));
  return (*(uint64_t (**)(void))(v9 + 8 * (((v3 + v10 + 381 < a1) * a2) ^ v6)))();
}

uint64_t sub_10000C550@<X0>(int a1@<W3>, int a2@<W5>, uint64_t a3@<X8>)
{
  int v6 = (a2 - 172) | 0x88;
  *(unsigned char *)(a3 + a1 + 1299677932 + ((v6 - 2000485575) | 0x1248810u)) = *(unsigned char *)(v5
                                                                                 + a1
                                                                                 + 1299677932
                                                                                 + ((v6 - 2000485575) | 0x1248810u));
  return (*(uint64_t (**)(void))(v3 + 8 * (((4 * (a1 - 1 != v4)) | (32 * (a1 - 1 != v4))) ^ v6)))(0);
}

uint64_t sub_10000C5B4@<X0>(char a1@<W0>, char a2@<W1>, char a3@<W2>, int a4@<W3>, int a5@<W6>, uint64_t a6@<X7>, int a7@<W8>, int8x16_t a8@<Q0>, int8x8_t a9@<D1>, int8x8_t a10@<D2>, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58)
{
  uint64_t v68 = (a4 + v67 - 8);
  v70.val[0].i64[0] = ((_BYTE)a4 + (_BYTE)v67 - 8) & 0xF;
  v70.val[0].i64[1] = ((_BYTE)a4 + v66 - 8) & 0xF;
  v70.val[1].i64[0] = ((_BYTE)a4 + v65 - 8) & 0xF;
  v70.val[1].i64[1] = ((_BYTE)a4 + v64 - 8) & 0xF;
  v70.val[2].i64[0] = ((_BYTE)a4 + a2 - 8) & 0xF;
  v70.val[2].i64[1] = ((_BYTE)a4 + v61 - 8) & 0xF;
  v70.val[3].i64[0] = ((_BYTE)a4 + v62 - 8 + a3) & 0xF;
  v70.val[3].i64[1] = ((_BYTE)a4 + a1 - 8) & 0xF;
  *(int8x8_t *)(a6 + v68) = vrev64_s8(veor_s8(veor_s8(vrev64_s8(veor_s8(veor_s8(*(int8x8_t *)(a6 + v68), *(int8x8_t *)(v58 + (v68 & 0xF) - 7)), veor_s8(*(int8x8_t *)(v60 + (v68 & 0xF) - 7), *(int8x8_t *)(v59 + (v68 & 0xF) - 7)))), a10), vmul_s8((int8x8_t)*(_OWORD *)&vqtbl4q_s8(v70, a8), a9)));
  return (*(uint64_t (**)(void))(a58 + 8 * (((a4 != v63 + 8) * a7) ^ a5)))();
}

uint64_t sub_10000C5DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  unsigned int v11 = v7 + v8 + v9;
  uint64_t v12 = a2 + v11;
  long long v13 = *(_OWORD *)(v12 - 31);
  uint64_t v14 = v5 + v11;
  *(_OWORD *)(v14 - 15) = *(_OWORD *)(v12 - 15);
  *(_OWORD *)(v14 - 31) = v13;
  return (*(uint64_t (**)(void))(v10 + 8 * ((((v6 & 0xFFFFFFE0) == 32) * ((a5 ^ 0xB2) - 1611)) ^ (a5 - 1066))))();
}

void sub_10000C634(uint64_t a1)
{
  int v2 = *(_DWORD *)(*(void *)(a1 + 8) - 0x4C6937770F4864B4);
  int v4 = v2 - 293522565;
  BOOL v3 = v2 - 293522565 < 0;
  int v5 = 293522565 - v2;
  if (!v3) {
    int v5 = v4;
  }
  int v1 = (*(_DWORD *)(a1 + 4) + 1755732067 * ((a1 - 1759316641 - 2 * (a1 & 0x9722F55F)) ^ 0x49E44884)) ^ 0x2DA;
  __asm { BRAA            X11, X17 }
}

uint64_t sub_10000C76C@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, int a3@<W4>, int a4@<W8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v5
                                                                       + 8
                                                                       * ((((((14 * (a4 ^ 0x5CB)) ^ 0xFFFFFFBA) & v4) != a3)
                                                                         * (((a4 - 85735119) & 0x51C375D) - 1612)) | a4)))(1433, a1, a2, 71);
}

uint64_t sub_10000C7D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, void))(v7
                                                                               + 8
                                                                               * (((((a5 ^ 0xAFA) & v6) == 0)
                                                                                 * ((9 * (a5 ^ 0xA8B)) ^ 0x442)) ^ a5 ^ 0x946)))(a1, a2, a3, a4, (v5 - a4));
}

void sub_10000C824()
{
  int v5 = 535753261 * ((((2 * (v4 - 120)) | 0x9AAC88F2) - (v4 - 120) - 1297499257) ^ 0x47A24A56);
  *(_DWORD *)(v4 - 112) = v3 + ((v2 + 345) ^ 0xD7352E63) + v5;
  *(_DWORD *)(v4 - 108) = (v2 + 761) ^ v5;
  *(void *)(v4 - 120) = v0;
  (*(void (**)(uint64_t))(v1 + 8 * (v2 + 1327)))(v4 - 120);
  JUMPOUT(0x10000C89CLL);
}

uint64_t sub_10000C944(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27)
{
  uint64_t v27 = *(_DWORD *)(a1 + 40)
      - 1224239923
      * ((2 * ((a1 ^ 0x6CFE4100) & 0x6997F88A) - (a1 ^ 0x6CFE4100) - 1771567243) ^ 0x825BBA2);
  unsigned int v28 = 235795823
      * (((v33 ^ 0x46C05FDF | 0xC9B2DC24)
        - (v33 ^ 0x46C05FDF)
        + ((v33 ^ 0x46C05FDF) & 0x364D23DB)) ^ 0x1BDFCAA2);
  uint64_t v36 = &STACK[0x1FA9E8BAFD93FC3C];
  unsigned int v34 = v28 + 832817738;
  int v35 = v27 - v28 + 1172345378;
  (*((void (**)(unsigned char *))*(&off_10005CE90 + (int)(v27 ^ 0xB5)) + (int)(v27 ^ 0x805)))(v33);
  return sub_100019188(v27, (uint64_t)v32, v29, (uint64_t)&v31, v27, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19, a20, a21, a22,
           a23,
           a24,
           a25,
           a26,
           a27);
}

uint64_t sub_10000CC08@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X4>, uint64_t a4@<X5>, uint64_t a5@<X6>, uint64_t a6@<X7>, int a7@<W8>, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,int a25,int a26,unsigned __int8 a27,unint64_t a28)
{
  int v33 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, unint64_t *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v28 + 8 * a7);
  int v34 = STACK[0x2F4];
  int v35 = STACK[0x2F4];
  int v36 = STACK[0x2F8];
  int v37 = STACK[0x2FC];
  int v38 = STACK[0x2F8];
  uint64_t v39 = LODWORD(STACK[0x2FC]);
  int v40 = LOBYTE(STACK[0x308]) ^ 0xCF;
  if (v40 == 2)
  {
    BOOL v45 = (unint64_t)&STACK[0x2A8] < a28 && v29 < (unint64_t)&STACK[0x2E8];
    return (*(uint64_t (**)(uint64_t, uint64_t))(v28 + 8 * ((1014 * ((v45 ^ a27) & 1)) ^ (v30 + 1428))))(v39, 3541576793);
  }
  else if (v40 == 1)
  {
    BOOL v42 = (unint64_t)&STACK[0x2A8] < a28 && v29 < (unint64_t)&STACK[0x2E8];
    return (*(uint64_t (**)(uint64_t))(v28 + 8 * ((a25 * v42) ^ (v30 + 601))))(v39);
  }
  else
  {
    LODWORD(STACK[0x2F0]) = 2 * (LODWORD(STACK[0x2F0]) ^ v31) + v31 - (v32 & (4 * (LODWORD(STACK[0x2F0]) ^ v31)));
    LODWORD(STACK[0x2F4]) = v31 + (v35 ^ v31) + (v34 ^ v31) - (v32 & (2 * ((v35 ^ v31) + (v34 ^ v31))));
    LODWORD(STACK[0x2F8]) = (v38 ^ v31) + (v36 ^ v31) + v31 - (v32 & (2 * ((v38 ^ v31) + (v36 ^ v31))));
    LODWORD(STACK[0x2FC]) = (v39 ^ v31) + (v37 ^ v31) + v31 - (v32 & (2 * ((v39 ^ v31) + (v37 ^ v31))));
    return v33(v39, a1, a2, &STACK[0x2A8], a3, a4, a5, a6, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18,
             a19,
             a20,
             a21);
  }
}

void sub_10000CD18()
{
}

uint64_t sub_10000CDDC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  *(unsigned char *)(a6 + (v12 + v10)) = *(unsigned char *)(a7 + (v12 + v10)) ^ *(unsigned char *)(v9 + ((v12 + v10) & 0xFLL)) ^ *(unsigned char *)(v8 + ((v12 + v10) & 0xFLL)) ^ *(unsigned char *)(((v12 + v10) & 0xFLL) + v7 + 2) ^ (-73 * ((v12 + v10) & 0xF)) ^ 0x52;
  return (*(uint64_t (**)(void))(v13 + 8 * ((110 * (v12 + 1 + v10 >= 9 * (v11 ^ 0x28Eu) - 51)) ^ v11)))();
}

uint64_t sub_10000CE54@<X0>(int a1@<W8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, int a13)
{
  BOOL v18 = a1 == 145079878 || a13 - v14 != v15 + ((v13 - 1375767808) & 0x565CEF7F) - 112929389;
  return (*(uint64_t (**)(uint64_t))(v16 + 8 * ((63 * v18) ^ v13)))(1158830123);
}

void sub_10000CEBC(uint64_t a1@<X8>)
{
  *(_DWORD *)(a1 - 0x4C6937770F4864B4) = (((v3 + v2) * (v1 - 898433860)) ^ 0xBB7FFCBD)
                                         + 1442762696
                                         + ((2 * (v3 + v2) * (v1 - 898433860)) & 0x76FFF97A);
}

uint64_t sub_10000CF48(int a1, uint64_t a2, void *a3, int a4, unsigned int a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23)
{
  BOOL v36 = v24 > a5;
  unint64_t v37 = (*(_DWORD *)(a23 + 4 * (v34 + a1 + (v25 ^ v29) * v28)) ^ v23)
      + HIDWORD(v35)
      + v27 * (unint64_t)(*(_DWORD *)(*a3 + 4 * (v34 + a1 + (v25 ^ v29) * v28)) ^ v23);
  *(_DWORD *)(a23 + 4 * (v34 + a1 + 596)) = v37 + v23 - (v26 & (2 * v37));
  if (v36 == v34 + v30 < v32) {
    BOOL v36 = v34 + v30 < a4;
  }
  return (*(uint64_t (**)(void))(v31 + 8 * ((v36 * v33) ^ v25)))();
}

uint64_t sub_10000CFD0()
{
  return (*(uint64_t (**)(void))(v2 + 8 * ((7 * ((v1 ^ (v0 + 1405858150) & 0xAC344FAE ^ 0xA77B3CEB) != 0)) ^ v0)))();
}

uint64_t sub_10000D02C(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  return (*(uint64_t (**)(void))(v7
                              + 8
                              * ((7
                                * (((((v4 - 353351917) & 0x150FB7CB) + 1866577470) ^ -((v8 & 0x631A08C0) + v5))
                                 + (-(v6 + 2 * (v8 & 0x631A08C0)) & 0xBD997A4E ^ 0x21180840)
                                 - 339772674 != a4)) ^ v4)))();
}

uint64_t sub_10000D0C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8)
{
  return (*(uint64_t (**)(void))(v11
                              + 8
                              * (((*(_DWORD *)(v10 + 48 * (v12 + a8) + 36) == v12)
                                * (((v8 + 1064516) | 0x44C2540) ^ (v9 + v8 - 716 - 1955))) ^ v8)))();
}

uint64_t sub_10000D120(uint64_t a1, int a2, int a3, void *a4, int a5, int a6, int a7)
{
  unsigned int v14 = *(_DWORD *)(*a4 + 4 * (a7 + v10)) ^ v8;
  *(_DWORD *)(*a4 + 4 * (v7 + v11 + v9 - 1133)) = ((v14 >> v12) | a5 ^ v8)
                                                  + v8
                                                  - (a2 & (2 * ((v14 >> v12) | a5 ^ v8)));
  return (*(uint64_t (**)(void))(v13 + 8 * (((a7 - 1 + v10 >= 0) * a6) ^ a3)))();
}

uint64_t sub_10000D128@<X0>(int a1@<W2>, int a2@<W8>)
{
  return (*(uint64_t (**)(void))(v2
                              + 8 * ((59 * (a2 - v3 + ((((a1 + 922) | 0x10) - 3) ^ 0xF43EFAEC) == -968278406)) ^ a1)))();
}

uint64_t sub_10000D1A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,int a21,int a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,int a27,int a28,uint64_t a29,int a30,uint64_t a31,uint64_t a32)
{
  unsigned int v35 = 628203409 * ((2 * (&a25 & 0x6979A960) - &a25 - 1769580899) ^ 0x140E5AAE);
  a31 = a23;
  a32 = a15;
  a29 = a17;
  a25 = a16;
  a26 = a14;
  a27 = v32 - v35 + 18;
  a28 = 854318342 - v35 + 7 * (v32 ^ 0x269) + a22;
  uint64_t v36 = (*(uint64_t (**)(uint64_t *))(v33 + 8 * (v32 ^ 0xA78)))(&a25);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v33
                                                                                         + 8
                                                                                         * ((1884 * (a30 == -1158872075)) ^ v32)))(v36, v34, 2474212436, 3049151192, 1820755250, 1228396339);
}

void sub_10000D2B8()
{
}

uint64_t sub_10000D2F8@<X0>(uint64_t a1@<X2>, uint64_t a2@<X8>)
{
  unint64_t v6 = v2 + a1;
  *(unsigned char *)(v6 + a2 - 1) = v4;
  return (*(uint64_t (**)(void))(v5
                              + 8 * (((v6 < 0x38) * ((((v3 - 1179) | 0x30A) + 930) ^ 0x15E)) ^ ((v3 - 1179) | 0x30A))))();
}

uint64_t sub_10000D33C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  int v67 = LODWORD(STACK[0x2AC]) - 1665;
  *(_DWORD *)(a64 + 52) = ((((LODWORD(STACK[0x55C]) ^ v66) + (v65 ^ v66)) % 0x2710) ^ 0x5FDFBEFD)
                        - 214051329
                        + (((((LODWORD(STACK[0x55C]) ^ v66) + (v65 ^ v66)) % 0x2710) << ((LODWORD(STACK[0x2AC]) + 127) ^ 0x71)) & 0x7DFA);
  int v68 = STACK[0x564];
  STACK[0x408] -= 1616;
  LODWORD(STACK[0x3CC]) = v68;
  return (*(uint64_t (**)(void))(v64 + 8 * ((1937 * (v68 == v66)) ^ v67)))();
}

uint64_t sub_10000D3D8()
{
  STACK[0x258] = STACK[0x200];
  return sub_10002AD5C();
}

uint64_t sub_10000D3F4()
{
  int v8 = (v4 - 1602) | 0x190;
  int v9 = 535753261 * ((862451137 - ((v7 - 136) | 0x3367F5C1) + ((v7 - 136) | 0xCC980A3E)) ^ 0xC66C0411);
  *(void *)(v7 - 136) = v6;
  *(_DWORD *)(v7 - 128) = v0 + v9 + (v8 ^ 0xD7E31ADF);
  *(_DWORD *)(v7 - 124) = (v4 - 160) ^ v9;
  (*(void (**)(uint64_t))(v3 + 8 * (v4 + 406)))(v7 - 136);
  *(void *)(v7 - 136) = v1;
  *(void *)(v7 - 120) = v2;
  *(_DWORD *)(v7 - 128) = v8
                        + ((((v7 - 136) | 0x51771D8A) - (v7 - 136) + ((v7 - 136) & 0xAE88E270)) ^ 0xDED2064C) * v5
                        + 1213;
  uint64_t v10 = (*(uint64_t (**)(uint64_t))(v3 + 8 * (v8 + 1649)))(v7 - 136);
  return (*(uint64_t (**)(uint64_t))(v3
                                            + 8
                                            * (v8 ^ (4
                                                   * (*(_DWORD *)(v7 - 124) > (((v8 - 386) | 0x81) ^ 0x76FA1551u)
                                                                            + v8
                                                                            + 308)))))(v10);
}

uint64_t sub_10000D51C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27)
{
  unsigned int v33 = v29 + v28 - 530505710;
  if (v33 <= 0x40) {
    int v34 = 64;
  }
  else {
    int v34 = v33;
  }
  BOOL v35 = __CFADD__(v33 - 1, v30 + 530505478 + v31 + v34 + 232);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v32 + 8 * ((v35 ^ (v27 + 91)) & 1 ^ v27)))(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27);
}

uint64_t sub_10000D588(uint64_t a1, uint64_t a2, int a3)
{
  return (*(uint64_t (**)(void))(v4 + 8 * (((((a3 - 925) | 0x118) ^ (a3 + 311)) * (v3 == a1)) ^ a3)))();
}

uint64_t sub_10000D5C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v19
                                                                                                  + 8 * ((1629 * (*(_DWORD *)(a19 - 0x3D8A64FC118460EALL) == (((v20 ^ 1) - 65) | 0x40) - 1158872781)) ^ v20 ^ 1)))(a1, a2, a3, a4, a5, a6, a7);
}

uint64_t sub_10000D620()
{
  LODWORD(STACK[0x464]) = v0 + 383;
  return sub_10001C650();
}

uint64_t sub_10000D62C()
{
  int v5 = 1374699841 * ((((v4 - 144) | 0xD577BC6C) - (v4 - 144) + ((v4 - 144) & 0x2A884390)) ^ 0xB883A465);
  *(void *)(v4 - 144) = v3;
  *(void *)(v4 - 136) = v9;
  *(_DWORD *)(v4 - 128) = v5 + v0 - 589;
  *(_DWORD *)(v4 - 124) = (((v0 - 149) ^ 0xDCD2615E) + v8) ^ v5;
  uint64_t result = (*(uint64_t (**)(uint64_t))(v2 + 8 * (v0 + 1112)))(v4 - 144);
  *(_DWORD *)(v7 - 0x5E2B99D919B8B1B6) = v8;
  _DWORD *v1 = -1158872075;
  return result;
}

uint64_t sub_10000D70C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, int a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v20
                                                                                         + 8
                                                                                         * ((28
                                                                                           * (a11 - 267936855 < ((v19 + 175001529) & 0xF591AAD5) + 2147483050)) ^ v19)))(a1, a2, a3, a4, a5, a19);
}

uint64_t sub_10000D76C@<X0>(int a1@<W2>, unsigned int a2@<W3>, uint64_t a3@<X8>, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,int a33)
{
  unint64_t v36 = STACK[0x440];
  unsigned int v37 = *(_DWORD *)(a3 - 0x1FA9E8BAFD93F970 + 4 * ((a1 + 136246100) >> (((a33 - 52) | v34) + 17)));
  *(unsigned char *)(v36 + (a1 + 136246100)) = (HIBYTE(v37) ^ 0x2C) - ((v37 >> 23) & 0xA4) + 82;
  *(unsigned char *)(v36 + (a1 + 136246101)) = (BYTE2(v37) ^ 0xE7) - ((2 * (BYTE2(v37) ^ 0xE7)) & 0xA4) + 82;
  *(unsigned char *)(v36 + (a1 + 136246102)) = (BYTE1(v37) ^ 0xD3)
                                                   - 2 * ((BYTE1(v37) ^ 0xD3) & 0x56 ^ BYTE1(v37) & 4)
                                                   + 82;
  *(unsigned char *)(v36 + (a1 + 136246103)) = v37 ^ 0xF4;
  unsigned int v38 = *v33 + 1266269127;
  BOOL v39 = v38 < a2;
  BOOL v40 = v38 > 0x8A0357DD;
  if (a2 > 0x8A0357DD != v39) {
    BOOL v40 = v39;
  }
  return (*(uint64_t (**)(void))(v35 + 8 * ((1486 * v40) ^ (a33 - 963))))();
}

uint64_t sub_10000D878@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  int v5 = (((v2 + 115) ^ 0xA8)
                       + *(unsigned char *)(a2 + a1)
                       - **(unsigned char **)(v4 + 8 * (((v2 + 632) | 0x200) - 1732))) == 121;
  return (*(uint64_t (**)(uint64_t))(v3 + 8 * (((v5 << 6) | (v5 << 7)) ^ (((v2 + 632) | 0x200) - 414))))(1448);
}

uint64_t sub_10000D8D8@<X0>(uint64_t a1@<X8>, uint64_t a2, uint64_t a3, uint64_t a4, unsigned int a5, uint64_t a6)
{
  a6 = v7;
  a5 = v8
     + 628203409
     * (((&a3 | 0xA3013AD2) - &a3 + (&a3 & 0x5CFEC528)) ^ 0x218936E1)
     + 750;
  a3 = a1;
  a4 = v7;
  uint64_t v9 = (*(uint64_t (**)(uint64_t *))(v6 + 8 * (v8 + 1889)))(&a3);
  return sub_10000D938(v9);
}

uint64_t sub_10000D960(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, unsigned int a20)
{
  BOOL v23 = v20 + 1226706481 < (int)(a20 + 1901407439);
  if (v20 + 1226706481 < -246076209 != a20 > ((v21 - 99) ^ 0xEAACBE0u) + v21 - 309) {
    BOOL v23 = a20 > ((v21 - 99) ^ 0xEAACBE0u) + v21 - 309;
  }
  return (*(uint64_t (**)(void))(v22 + 8 * ((565 * v23) ^ v21)))();
}

uint64_t sub_10000D9D8(uint64_t a1, uint64_t a2, int a3)
{
  return (*(uint64_t (**)(uint64_t))(v5
                                            + 8
                                            * (int)(((a3 + ((v4 - 7369752) & 0xB5F9FB8F) + 1604) * (v3 == 59)) ^ v4)))(4294925278);
}

uint64_t sub_10000DA18(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,int a30,unsigned int a31)
{
  v33[623] = *(_DWORD *)(a5 + 4 * (*v33 & 1)) ^ v33[396] ^ ((*v33 & ((v31 + 754) ^ 0x7FFFFBF0) | v33[623] & 0x80000000) >> 1);
  return (*(uint64_t (**)(void))(v32 + 8 * ((1011 * (a31 > 0x26F)) ^ v31)))();
}

void sub_10000DA78()
{
}

uint64_t sub_10000DA94(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56)
{
  char v61 = (char *)*(&off_10005CE90 + (v59 + 26)) - 8;
  char v62 = (char *)*(&off_10005CE90 + v59 - 39) - 4;
  uint64_t v63 = (uint64_t)*(&off_10005CE90 + (v59 + 21));
  int v64 = *(unsigned __int8 *)(v63 + (*(unsigned __int8 *)(v56 - 0x180D539AA7AA25) ^ 0x49));
  int v65 = ((v61[*(unsigned __int8 *)(v56 - 0x180D539AA7AA30) ^ 0xD7] ^ 0x16) << (v59 - 87)) | ((v62[*v57 ^ 0xB1] ^ 0x29) << 24);
  HIDWORD(v67) = v64 ^ 1;
  LODWORD(v67) = (v64 ^ 0x55555555) << 24;
  unsigned __int8 v66 = v67 >> 26;
  uint64_t v68 = *(unsigned __int8 *)(v56 - 0x180D539AA7AA2FLL) ^ 0xECLL;
  *(_DWORD *)(v60 - 200) = v58;
  int v69 = (char *)*(&off_10005CE90 + (v59 ^ 0xDCu)) - 8;
  unsigned __int8 v70 = v69[v68] - 89;
  LODWORD(v68) = v62[*(unsigned __int8 *)(v56 - 0x180D539AA7AA26) ^ 0xB8];
  int v71 = v65 | v70 ^ 9;
  int v72 = *(unsigned __int8 *)(v63 + (*(unsigned __int8 *)(v56 - 0x180D539AA7AA29) ^ 0x6BLL));
  HIDWORD(v67) = v72 ^ 1;
  LODWORD(v67) = (v72 ^ 0x55555555) << 24;
  LOBYTE(v64) = v61[*(unsigned __int8 *)(v56 - 0x180D539AA7AA24) ^ 0x2ELL];
  int v73 = ((v67 >> 26) ^ 0x53) << 16;
  int v74 = *(unsigned __int8 *)(v63 + (*(unsigned __int8 *)(v56 - 0x180D539AA7AA31) ^ 0x47));
  HIDWORD(v67) = v74 ^ 1;
  LODWORD(v67) = (v74 ^ 0x55555555) << 24;
  int v75 = v71 | (((v67 >> 26) ^ 0x1E) << 16);
  LODWORD(v63) = *(unsigned __int8 *)(v63 + (*(unsigned __int8 *)(v56 - 0x180D539AA7AA2DLL) ^ 0xCBLL));
  unsigned int v76 = ((v66 ^ 0xFB) << 16) | ((v68 ^ 0x91) << 24) | ((v64 ^ 0xD3) << 8);
  HIDWORD(v67) = v63 ^ 1;
  LODWORD(v67) = (v63 ^ 0x55555555) << 24;
  unsigned int v77 = ((v69[*(unsigned __int8 *)(v56 - 0x180D539AA7AA2BLL) ^ 0xA9] - 89) | ((v61[*(unsigned __int8 *)(v56 - 0x180D539AA7AA2CLL) ^ 0x30] ^ 0x23) << 8)) & 0xFF00FFFF | (((v67 >> 26) ^ 0xBA) << 16) | ((v62[*(unsigned __int8 *)(v56 - 0x180D539AA7AA2ELL) ^ 0x35] ^ 0xE6) << 24);
  LOBYTE(v63) = v69[*(unsigned __int8 *)(v56 - 0x180D539AA7AA23) ^ 0x36] - 89;
  unsigned int v78 = v73 & 0xFFFFFF00 | ((v61[*(unsigned __int8 *)(v56 - 0x180D539AA7AA28) ^ 0x77] ^ 0xD9) << 8) | (v69[*(unsigned __int8 *)(v56 - 0x180D539AA7AA27) ^ 0xB5] - 89) ^ 0xA8 | (~v62[*(unsigned __int8 *)(v56 - 0x180D539AA7AA2ALL) ^ 0xBFLL] << 24);
  id v79 = (char *)*(&off_10005CE90 + (v59 + 24)) - 12;
  v80 = (char *)*(&off_10005CE90 + (v59 ^ 0x3Bu)) - 8;
  LODWORD(v62) = *(_DWORD *)&v79[4 * (v63 ^ 0xFD)] ^ 0x605DB452 ^ *(_DWORD *)&v80[4 * (v66 ^ 0x61)];
  LOBYTE(v69) = v68 ^ 4;
  uint64_t v81 = (uint64_t)*(&off_10005CE90 + (v59 ^ 0xC1u));
  LODWORD(v62) = (v62 - ((2 * v62) & 0xD9BC1C68) + 1826491956) ^ *(_DWORD *)(v81
                                                                                           + 4 * v69);
  int v82 = v62 - ((2 * v62) & 0x16988CB8);
  uint64_t v83 = (char *)*(&off_10005CE90 + (v59 + 8)) - 12;
  int v84 = *(_DWORD *)&v83[4 * (v64 ^ 0xEB)] ^ v75 ^ (v82 - 1957935524);
  LODWORD(v534) = v76 & 0xFFFFFF00 | v63 ^ 0x2A;
  int v85 = v534
      - 2 * ((v76 & 0x57366F00 | (v63 ^ 0x2A) & 0xBF) ^ (v63 ^ 0x2A) & 1)
      - 684298306;
  unint64_t v533 = __PAIR64__(v75, v77);
  int v86 = v84;
  int v445 = v84;
  LODWORD(v63) = v84 ^ v77 ^ 0x4D;
  int v87 = v84 ^ v77;
  *(_DWORD *)(v60 - 176) = v87;
  *(_DWORD *)(v60 - 128) = v63 ^ v78;
  int v88 = v63;
  unsigned __int8 v428 = v63;
  LODWORD(v63) = v63 ^ v78 ^ v85;
  int v469 = BYTE1(v63);
  int v459 = BYTE2(v63);
  int v89 = *(_DWORD *)&v83[4 * (BYTE1(v63) ^ 0x95)] ^ *(_DWORD *)&v80[4 * (BYTE2(v63) ^ 0x88)];
  int v90 = v63 ^ 0x6DC14217;
  int v464 = v63;
  unsigned int v91 = ((v89 ^ 0xE816845D) - ((2 * (v89 ^ 0xE816845D)) & 0x60EECA6) + 50820691) ^ *(_DWORD *)&v79[4
                                                                                                 * (v63 ^ 0x97)];
  LODWORD(v63) = (v63 ^ 0x6DC14217) >> 24;
  *(_DWORD *)(v60 - 208) = v63;
  unsigned int v92 = v86 ^ *(_DWORD *)(v81 + 4 * (v63 ^ 0x65)) ^ (v91 - ((2 * v91) & 0xD9BC1C68) + 1826491956);
  HIDWORD(v532) = v78;
  int v93 = v92 ^ 0x13AA8777;
  *(_DWORD *)(v60 - 168) = v92;
  LODWORD(v63) = v92 ^ 0x13AA8777 ^ (v78 - ((2 * v78) & 0x27550EEE) + 329942903);
  unsigned int v94 = v63 ^ v90;
  __int16 v95 = v63;
  *(_DWORD *)(v60 - 160) = v63;
  int v476 = BYTE2(v94);
  int v480 = BYTE1(v94);
  unsigned int v96 = *(_DWORD *)&v80[4 * (BYTE2(v94) ^ 0x2E)] ^ *(_DWORD *)&v83[4 * (BYTE1(v94) ^ 0x9B)] ^ 0xE816845D;
  int v547 = v94;
  int v97 = (v96 - ((2 * v96) & 0x60EECA6) + 50820691) ^ *(_DWORD *)&v79[4 * (v94 ^ 0xD2)];
  unsigned int v98 = v94 ^ 0xFB0FF820;
  *(_DWORD *)(v60 - 216) = HIBYTE(v94);
  unsigned int v99 = (v97 - ((2 * v97) & 0xD9BC1C68) + 1826491956) ^ *(_DWORD *)(v81 + 4 * (HIBYTE(v94) ^ 0x69));
  int v100 = v99 ^ v88 ^ 0xDE1A13F;
  int v511 = v99 ^ v88;
  int v101 = v100 ^ v63;
  *(_DWORD *)(v60 - 148) = v100 ^ v63;
  unsigned int v102 = ((v101 ^ 0x9767ACD5) - ((2 * (v101 ^ 0x9767ACD5)) & 0x1F50B2D2) - 1884792471) ^ v98 ^ 0x9547167F;
  int v520 = BYTE2(v102);
  HIDWORD(v534) = ((unsigned __int16)(((v100 ^ v95 ^ 0xACD5)
                                                      - ((2 * (v100 ^ v95 ^ 0xACD5)) & 0xB2D2)
                                                      + 22889) ^ v98 ^ 0x167F) >> 8);
  unsigned int v103 = *(_DWORD *)&v80[4 * (BYTE2(v102) ^ 0x89)] ^ *(_DWORD *)&v83[4 * (HIDWORD(v534) ^ 0x3A)] ^ 0xE816845D;
  int v522 = (((v100 ^ v95 ^ 0xD5) - ((2 * (v100 ^ v95 ^ 0xD5)) & 0xD2) + 105) ^ v98);
  int v104 = (v103 - ((2 * v103) & 0x60EECA6) + 50820691) ^ *(_DWORD *)&v79[4 * (v522 ^ 0xE4)];
  v102 >>= 24;
  *(_DWORD *)(v60 - 224) = v102;
  unsigned int v105 = (v104 - ((2 * v104) & 0xD9BC1C68) + 1826491956) ^ *(_DWORD *)(v81 + 4 * (v102 ^ 0x1D));
  unsigned int v492 = v99 ^ v92;
  unsigned int v551 = (v105 - ((2 * v105) & 0x2AC51DC8) - 1788703004) ^ v99 ^ v92;
  *(_DWORD *)(v60 - 256) = v551 ^ 0x95628EE4;
  unsigned int v543 = v551 ^ 0x95628EE4 ^ v99 ^ v88;
  unsigned int v106 = ((v543 ^ 0xFE25CD6D) - ((2 * (v543 ^ 0xFE25CD6D)) & 0x1F50B2D2) - 1884792471) ^ v98;
  *(_DWORD *)(v60 - 232) = ((unsigned __int16)(((v543 ^ 0xCD6D)
                                                               - ((2 * (v543 ^ 0xCD6D)) & 0xB2D2)
                                                               + 22889) ^ v98) >> 8);
  int v107 = *(_DWORD *)&v83[4
                       * (((unsigned __int16)(((v543 ^ 0xCD6D)
                                                              - ((2 * (v543 ^ 0xCD6D)) & 0xB2D2)
                                                              + 22889) ^ v98) >> 8) ^ 0x6F)];
  *(_DWORD *)(v60 - 240) = BYTE2(v106);
  unsigned int v108 = v107 ^ *(_DWORD *)&v80[4 * (BYTE2(v106) ^ 0xA8)] ^ 0xE816845D;
  unsigned int v109 = (v108 - ((2 * v108) & 0xD9BC1C68) + 1826491956) ^ *(_DWORD *)(v81 + 4 * (HIBYTE(v106) ^ 0x85));
  int v538 = (((v543 ^ 0x6D) - ((2 * (v543 ^ 0x6D)) & 0xD2) + 105) ^ v98);
  int v110 = (v109 - ((2 * v109) & 0x60EECA6) + 50820691) ^ *(_DWORD *)&v79[4 * (v538 ^ 0x25)];
  unsigned int v540 = v543 ^ v100 ^ v63;
  unsigned int v421 = (v110 - ((2 * v110) & 0x6E2D192C) - 1223258986) ^ v100;
  *(_DWORD *)(v60 - 136) = v421 ^ v540;
  int v111 = v106 ^ v421 ^ v540 ^ 0x141917E6;
  unsigned int v454 = (v111 ^ 0x940A0C30) >> 24;
  int v442 = ((v111 ^ 0x940A0C30) >> 16);
  int v112 = *(_DWORD *)(v81 + 4 * (v454 ^ 0x1D)) ^ *(_DWORD *)&v80[4 * (v442 ^ 0x89)] ^ 0xF84CC35;
  int v448 = ((unsigned __int16)(v111 ^ 0xC30) >> 8);
  int v113 = (v112 - ((2 * v112) & 0x16988CB8) - 1957935524) ^ *(_DWORD *)&v83[4 * (v448 ^ 0x3A)];
  *(_DWORD *)(v60 - 184) = v551 ^ 0x95628EE4 ^ v110;
  unsigned int v114 = v551 ^ 0x95628EE4 ^ v110 ^ *(_DWORD *)&v79[4 * ((v106 ^ v421 ^ v540 ^ 0xE6) ^ 0xAB)] ^ (v113 - ((2 * v113) & 0x60EECA6) + 50820691);
  int v115 = v114 ^ v421 ^ 0x7C166C11;
  unsigned int v517 = v114;
  unsigned int v116 = (v115 ^ v106) >> 24;
  *(_DWORD *)(v60 - 248) = v116;
  int v525 = (v115 ^ v106);
  int v117 = *(_DWORD *)(v81 + 4 * (v116 ^ 0x9B)) ^ *(_DWORD *)&v79[4 * (v525 ^ 0x31)] ^ 0x6FD97867;
  unsigned int v501 = ((v115 ^ v106) >> 8) ^ 0x86839A;
  int v508 = ((unsigned __int16)(v115 ^ v106) >> 8) ^ 0x9A;
  int v118 = (v117 - ((2 * v117) & 0x16988CB8) - 1957935524) ^ *(_DWORD *)&v83[4
                                                                         * (((unsigned __int16)(v115 ^ v106) >> 8) ^ 0xA0)];
  int v119 = v115 ^ v106 ^ 0x578C480E;
  int v505 = ((v115 ^ v106) >> 16);
  unsigned int v120 = (v118 - ((2 * v118) & 0xC6B58402) + 1666892289) ^ *(_DWORD *)&v80[4 * (v505 ^ 0xA)];
  int v121 = (v120 - ((2 * v120) & 0x2CC6CEEE) + 375613303) ^ v114;
  *(_DWORD *)(v60 - 140) = v121;
  unsigned int v436 = v121 ^ 0xEBE0FDDD ^ v115;
  unsigned int v122 = v121 ^ 0xEBE0FDDD;
  __int16 v426 = v121 ^ 0xFDDD;
  unsigned int v514 = v115 ^ v421 ^ v540 ^ 0x141917E6;
  int v489 = v115;
  unsigned int v123 = ((v436 ^ 0x5A137D54) - ((2 * (v436 ^ 0x5A137D54)) & 0xAECBBE34) + 1466294042) ^ v514 ^ 0x12E852D3;
  *(_DWORD *)(v60 - 144) = v123;
  unsigned __int8 v456 = v123 ^ 0xE3;
  unsigned int v124 = v123 ^ 0x92495AE3;
  unsigned int v125 = ((v123 ^ 0x92495AE3) - 2 * ((v123 ^ 0x15D682E3) & 0x19 ^ (v123 ^ 0x92495AE3) & 0x510FD2BD) - 787492188) ^ v119;
  int v545 = BYTE1(v125);
  int v529 = (((v123 ^ 0xE3) - 2 * ((v123 ^ 0xE3) & 0x19 ^ (v123 ^ 0xE3) & 0xBD) - 92) ^ v119);
  unsigned int v126 = *(_DWORD *)&v83[4 * (BYTE1(v125) ^ 0x8A)] ^ *(_DWORD *)&v79[4 * (v529 ^ 0xAA)] ^ 0x884B300F;
  int v127 = BYTE2(v125);
  unsigned int v128 = (v126 - ((2 * v126) & 0xC6B58402) + 1666892289) ^ *(_DWORD *)&v80[4 * (BYTE2(v125) ^ 0x13)];
  unsigned int v433 = HIBYTE(v125);
  LODWORD(v69) = (v128 - ((2 * v128) & 0xD9BC1C68) + 1826491956) ^ *(_DWORD *)(v81 + 4 * (HIBYTE(v125) ^ 0x5A));
  unsigned int v129 = v69 ^ v115;
  unsigned int v130 = v69 ^ v115 ^ 0xCC37C820 ^ v119;
  unsigned int v131 = v93 ^ ((v87 ^ 0xBAF72DE4) - ((2 * (v87 ^ 0xBAF72DE4)) & 0x27550EEE) + 329942903);
  int v132 = ((unsigned __int16)((unsigned __int16)v69 ^ v115 ^ 0xC820 ^ v119) >> 8);
  int v133 = *(_DWORD *)&v83[4 * (v132 ^ 0xF9)] ^ *(_DWORD *)(v81 + 4 * (HIBYTE(v130) ^ 0xBE));
  unsigned int v134 = ((v133 ^ 0xE7924868) - 2 * ((v133 ^ 0xE7924868) & 0x3077657 ^ v133 & 4) + 50820691) ^ *(_DWORD *)&v79[4 * (v130 ^ 0x74)];
  unsigned int v135 = v122 ^ v69;
  unsigned int v136 = v122 ^ v69 ^ *(_DWORD *)&v80[4 * (BYTE2(v130) ^ 0x54)] ^ (v134
                                                                               - ((2 * v134) & 0xC6B58402)
                                                                               + 1666892289);
  int v431 = v124 ^ v136 ^ v130;
  unsigned int v486 = v124 ^ v136;
  int v536 = BYTE1(v431);
  unsigned int v424 = (v431 ^ 0xBF335EBA) >> 24;
  LODWORD(v81) = *(_DWORD *)&v83[4 * (BYTE1(v431) ^ 0xA)] ^ 0xE7924868 ^ *(_DWORD *)(v81 + 4 * (v424 ^ 0xC4));
  int v137 = (v81 - ((2 * v81) & 0x60EECA6) + 50820691) ^ *(_DWORD *)&v79[4 * (v431 ^ 0x84)];
  int v410 = ((v431 ^ 0xBF335EBA) >> 16);
  unsigned int v138 = (v137 - ((2 * v137) & 0xC6B58402) + 1666892289) ^ *(_DWORD *)&v80[4 * (v410 ^ 0x9B)];
  *(_DWORD *)(v60 - 192) = v136;
  LODWORD(v532) = v136 ^ 0x9D333AC7 ^ (v138 - ((2 * v138) & 0x3B882EDC) + 499390318);
  unsigned int v414 = v136 ^ v129 ^ 0xCC37C820;
  unsigned int v407 = v124 ^ v136 ^ 0xC5FCF3F0;
  HIDWORD(v531) = v414 ^ 0x2AAB97B1 ^ (v532 - ((2 * v532) & 0x847D210A) - 1036087163);
  LODWORD(v531) = HIDWORD(v531) ^ v407 ^ 0x4662A266;
  HIDWORD(a50) = (v531 + 1412078724 + ~(2 * (v531 & 0x542A9C9B ^ (HIDWORD(v531) ^ v407) & 0x18))) ^ v431 ^ 0xBF335EBA;
  v139 = (char *)*(&off_10005CE90 + (v59 ^ 0xE3u)) - 12;
  unsigned int v140 = (((v135 ^ 0x1B9155BD) >> 16)
        - 757047905
        + ((2 * ((v135 ^ 0x1B9155BD) >> 16) + 88) & 0x2E4 ^ 0xF7FBFBFF)) ^ *(_DWORD *)&v139[4 * (((v135 ^ 0x1B9155BD) >> 16) ^ 0x2D)];
  LODWORD(v83) = ((BYTE2(v130) ^ 0x75) - 757047905 + ((2 * (BYTE2(v130) ^ 0x75) + 88) & 0x2E4 ^ 0xF7FBFBFF)) ^ *(_DWORD *)&v139[4 * (BYTE2(v130) ^ 0x58)];
  v141 = (char *)*(&off_10005CE90 + (v59 ^ 0x6Du)) - 8;
  unsigned int v142 = (v140 - ((2 * v140) & 0xD2AA6098) - 380293044) ^ *(_DWORD *)&v141[4
                                                                         * (((unsigned __int16)(v122 ^ (unsigned __int16)v69) >> 8) ^ 0x47)];
  int v143 = v83 - ((2 * v83) & 0x58A3531C);
  v144 = (char *)*(&off_10005CE90 + (v59 ^ 0x6Cu)) - 4;
  unsigned int v145 = v124 ^ v129;
  v146 = (char *)*(&off_10005CE90 + (v59 & 0x900D405)) - 8;
  int v147 = *(_DWORD *)&v146[4 * (v145 ^ 0x53)];
  int v148 = (v143 + 743549326) ^ *(_DWORD *)&v144[4 * (HIBYTE(v130) ^ 0x77)];
  unsigned int v149 = *(_DWORD *)&v139[4 * (BYTE2(v145) ^ 0x35)] ^ *(_DWORD *)&v144[4 * (HIBYTE(v145) ^ 0xB9)] ^ ((BYTE2(v145) ^ 0x18) - 757047905 + ((2 * (BYTE2(v145) ^ 0x18) + 88) & 0x2E4 ^ 0xF7FBFBFF)) ^ (181304767 * v147 - 638800974 + (~(362609534 * v147 + 1530266694) | 0xA75CACE3));
  int v150 = *(_DWORD *)&v146[4 * (v129 ^ 0x74)];
  unsigned int v151 = (181304767 * v150 - ((362609534 * v150 + 1530266694) & 0xD2AA6098) - 1762643345) ^ *(_DWORD *)&v141[4 * (BYTE1(v129) ^ 0x5A)];
  unsigned int v527 = v151 - ((2 * v151) & 0x58A3531C);
  unsigned int v482 = v132 ^ 0x26;
  unsigned int v499 = v148 - ((2 * v148) & 0xD2AA6098);
  unsigned int v495 = v149 - ((2 * v149) & 0xD2AA6098);
  int v535 = (v142 - ((2 * v142) & 0x58A3531C) + 743549326) ^ *(_DWORD *)&v144[4 * ((v135 ^ 0x1B9155BD) >> 24)] ^ (181304767 * *(_DWORD *)&v146[4 * (v135 ^ 0x7D)] - 1382350301);
  unsigned int v152 = *(_DWORD *)&v139[4 * (((v131 ^ 0xE9B45E6C) >> 16) ^ 0xF5)] ^ ((((v131 ^ 0xE9B45E6C) >> 16) ^ 0xD8)
                                                                                      - 757047905
                                                                                      + ((2
                                                                                        * (((v131 ^ 0xE9B45E6C) >> 16) ^ 0xD8)
                                                                                        + 88) & 0x2E4 ^ 0xF7FBFBFF));
  unsigned int v153 = *(_DWORD *)(v60 - 160) ^ 0x31676F78;
  int v154 = *(_DWORD *)&v139[4 * (BYTE2(v153) ^ 0x7B)] ^ ((BYTE2(v153) ^ 0x56)
                                                     - 757047905
                                                     + ((2
                                                       * (((BYTE2(v153) ^ 0x56) + 44) & 0x173 ^ (HIWORD(v153) | 0x7FFFFFFE))) ^ 0x8040403));
  int v155 = (v154 - ((2 * v154) & 0x58A3531C) + 743549326) ^ *(_DWORD *)&v144[4 * HIBYTE(v153)];
  unsigned int v156 = *(_DWORD *)&v139[4 * (v476 ^ 0x34)] ^ ((v476 ^ 0x19)
                                              - 757047905
                                              + ((2 * (v476 ^ 0x19) + 88) & 0x2E4 ^ 0xF7FBFBFF));
  int v157 = (v156 - 380293044 + (~(2 * v156) | 0x2D559F67) + 1) ^ *(_DWORD *)&v141[4 * (v480 ^ 5)];
  unsigned int v477 = v155 - ((2 * v155) & 0xD2AA6098);
  int v481 = v157 - ((2 * v157) & 0x58A3531C);
  int v158 = *(_DWORD *)&v146[4 * (*(_DWORD *)(v60 - 168) ^ 0xDF)];
  LODWORD(v69) = 181304767 * v158 - 638800974 + (~(362609534 * v158 + 1530266694) | 0xA75CACE3);
  unsigned int v159 = *(_DWORD *)(v60 - 168) ^ 0x5A18571F;
  LODWORD(v69) = *(_DWORD *)&v144[4 * HIBYTE(v159)] ^ ((BYTE2(v159) ^ 0xC1)
                                                     - 757047905
                                                     + ((2 * (BYTE2(v159) ^ 0xC1) + 88) & 0x2E4 ^ 0xF7FBFBFF)) ^ *(_DWORD *)&v139[4 * (BYTE2(v159) ^ 0xEC)] ^ v69;
  unsigned int v474 = v69 - ((2 * v69) & 0xD2AA6098);
  unsigned int v160 = *(_DWORD *)&v144[4 * ((v131 ^ 0xE9B45E6C) >> 24)] ^ (v152 + 743549326 + (~(2 * v152) | 0xA75CACE3) + 1);
  unsigned int v413 = v131 ^ 0xAC;
  unsigned int v466 = BYTE1(v131) ^ 0xB4;
  unsigned int v471 = v160 - ((2 * v160) & 0xD2AA6098);
  LOWORD(v151) = v436 ^ 0x8EA4;
  unsigned int v161 = v436 ^ 0x35C48CD5;
  unsigned int v162 = *(_DWORD *)&v139[4 * (v127 ^ 0x44)] ^ ((v127 ^ 0x69)
                                              - 757047905
                                              + ((2 * (v127 ^ 0x69) + 88) & 0x2E4 ^ 0xF7FBFBFF));
  unsigned int v163 = *(_DWORD *)&v139[4 * (((v436 ^ 0x35C48CD5) >> 16) ^ 0xFE)] ^ ((((v436 ^ 0x35C48CD5) >> 16) ^ 0xD3)
                                                                                      - 757047905
                                                                                      + ((2
                                                                                        * (((v436 ^ 0x35C48CD5) >> 16) ^ 0xD3)
                                                                                        + 88) & 0x2E4 ^ 0xF7FBFBFF));
  int v164 = *(_DWORD *)&v146[4 * (v456 ^ 0xC5)];
  int v165 = (v162 - ((2 * v162) & 0x58A3531C) + 743549326) ^ *(_DWORD *)&v144[4 * (v433 ^ 0x71)];
  int v166 = BYTE2(*(_DWORD *)(v60 - 140));
  unsigned int v167 = *(_DWORD *)&v139[4 * (v166 ^ 0xCC)] ^ ((v166 ^ 0xE1)
                                              - 757047905
                                              + ((2 * (v166 ^ 0xE1) + 88) & 0x2E4 ^ 0xF7FBFBFF));
  LODWORD(v69) = (v167 - ((2 * v167) & 0xD2AA6098) - 380293044) ^ *(_DWORD *)&v141[4 * (HIBYTE(v426) ^ 0x8B)];
  unsigned int v437 = v165 - ((2 * v165) & 0xD2AA6098);
  int v457 = v69 - ((2 * v69) & 0x58A3531C);
  LODWORD(v69) = *(_DWORD *)(v60 - 144) ^ 0x77495AE3;
  LODWORD(v69) = *(_DWORD *)&v141[4 * (BYTE1(v69) ^ 0x20)] ^ ((BYTE2(v69) ^ 0xD7)
                                                            - 757047905
                                                            + ((2 * (BYTE2(v69) ^ 0xD7) + 88) & 0x2E4 ^ 0xF7FBFBFF)) ^ *(_DWORD *)&v139[4 * (BYTE2(v69) ^ 0xFA)] ^ (181304767 * v164 - ((362609534 * v164 + 1530266694) & 0xD2AA6098) - 1762643345);
  int v168 = (v163 - ((2 * v163) & 0x58A3531C) + 743549326) ^ *(_DWORD *)&v144[4 * HIBYTE(v161)] ^ (181304767
                                                                                              * *(_DWORD *)&v146[4 * (v151 ^ 0x99)]
                                                                                              - 1382350301);
  unsigned int v418 = BYTE1(v151) ^ 0x14;
  unsigned int v402 = v426 ^ 0xA3;
  unsigned int v427 = v168 - ((2 * v168) & 0xD2AA6098);
  int v434 = v69 - ((2 * v69) & 0x58A3531C);
  int v169 = *(_DWORD *)(v60 - 128);
  unsigned int v417 = BYTE1(v169) ^ 0xF5;
  unsigned int v420 = v445 ^ 0x2BEAE26B;
  unsigned int v170 = *(_DWORD *)&v139[4 * (((v445 ^ 0x2BEAE26Bu) >> 16) ^ 0xEC)] ^ ((((v445 ^ 0x2BEAE26Bu) >> 16) ^ 0xC1)
                                                                                       - 757047905
                                                                                       + ((2
                                                                                         * (((v445 ^ 0x2BEAE26Bu) >> 16) ^ 0xC1)
                                                                                         + 88) & 0x2E4 ^ 0xF7FBFBFF)) ^ (181304767 * *(_DWORD *)&v146[4 * (v445 ^ 0x1E)] - 1382350301);
  unsigned int v171 = (v170 - ((2 * v170) & 0xD2AA6098) - 380293044) ^ *(_DWORD *)&v141[4 * (BYTE1(v445) ^ 8)];
  int v172 = *(_DWORD *)&v139[4 * (v459 ^ 0x16)] ^ ((v459 ^ 0x3B) - 757047906 - ((2 * (v459 ^ 0x3B) + 160207960) & 0x80406E4));
  LODWORD(v69) = *(_DWORD *)&v146[4 * (v428 ^ 0x55)];
  unsigned int v460 = v171 - ((2 * v171) & 0x58A3531C);
  int v406 = BYTE2(v169);
  int v446 = (BYTE2(v169) ^ 0xA7) - 757047906 - ((2 * (BYTE2(v169) ^ 0xA7) + 160207960) & 0x80406E4);
  unsigned int v173 = (v172 - ((2 * v172) & 0xD2AA6098) - 380293044) ^ *(_DWORD *)&v141[4 * (v469 ^ 0xFF)] ^ (181304767
                                                                                               * *(_DWORD *)&v146[4 * (v464 ^ 0xE4)]
                                                                                               - 1382350301);
  unsigned int v470 = v173 - ((2 * v173) & 0x58A3531C);
  unsigned int v174 = *(_DWORD *)(v60 - 176);
  unsigned int v175 = (181304767 * v69 - ((362609534 * v69 + 1530266694) & 0x58A3531C) - 638800975) ^ ((BYTE2(v174) ^ 0xBA) - 757047905 + ((2 * (BYTE2(v174) ^ 0xBA) + 88) & 0x2E4 ^ 0xF7FBFBFF)) ^ *(_DWORD *)&v144[4 * (HIBYTE(v174) ^ 0x2F)] ^ *(_DWORD *)&v139[4 * (BYTE2(v174) ^ 0x97)];
  unsigned int v429 = v175 - ((2 * v175) & 0xD2AA6098);
  int v176 = BYTE2(*(_DWORD *)(v60 - 136));
  unsigned int v177 = *(_DWORD *)&v139[4 * (v176 ^ 0xE4)] ^ ((v176 ^ 0xC9)
                                              - 757047905
                                              + ((2 * (v176 ^ 0xC9) + 88) & 0x2E4 ^ 0xF7FBFBFF));
  unsigned int v404 = BYTE1(v145) ^ 0x56;
  unsigned int v178 = *(_DWORD *)&v139[4 * (BYTE2(*(_DWORD *)(v60 - 184)) ^ 0x56)] ^ ((BYTE2(*(_DWORD *)(v60 - 184)) ^ 0x7B)
                                                                                        - 757047905
                                                                                        + ((2
                                                                                          * (BYTE2(*(_DWORD *)(v60 - 184)) ^ 0x7B)
                                                                                          + 88) & 0x2E4 ^ 0xF7FBFBFF));
  unsigned int v179 = (v177 - ((2 * v177) & 0xD2AA6098) - 380293044) ^ *(_DWORD *)&v141[4
                                                                         * (((unsigned __int16)(v421 ^ v540 ^ 0x17E6) >> 8) ^ 0x4C)] ^ (181304767 * *(_DWORD *)&v146[4 * ((v421 ^ v540) ^ 0xA5)] - 1382350301);
  LODWORD(v69) = *(_DWORD *)&v146[4 * (v421 ^ 0xFB)];
  LODWORD(v69) = (181304767 * v69 - ((362609534 * v69 + 1530266694) & 0xD2AA6098) - 1762643345) ^ *(_DWORD *)&v141[4 * (BYTE1(v421) ^ 0xEF)];
  LODWORD(v412) = v179 - ((2 * v179) & 0x58A3531C);
  LODWORD(v405) = v69 - ((2 * v69) & 0x58A3531C);
  int v180 = (v178 - ((2 * v178) & 0x58A3531C) + 743549326) ^ *(_DWORD *)&v144[4 * (HIBYTE(*(_DWORD *)(v60 - 184)) ^ 0xD9)] ^ (181304767 * *(_DWORD *)&v146[4 * (*(_DWORD *)(v60 - 184) ^ 0x79)] - 1382350301);
  int v181 = *(_DWORD *)&v139[4 * (v442 ^ 0x86)] ^ ((v442 ^ 0xAB) - 757047906 - ((2 * (v442 ^ 0xAB) + 160207960) & 0x80406E4));
  LODWORD(v69) = (v181 - ((2 * v181) & 0x58A3531C) + 743549326) ^ *(_DWORD *)&v144[4 * v454];
  unsigned int v401 = v448 ^ 0xEE;
  unsigned int v398 = (v106 ^ v421 ^ v540 ^ 0xE6) ^ 0xD;
  unsigned int v449 = v69 - ((2 * v69) & 0xD2AA6098);
  unsigned int v443 = v180 - ((2 * v180) & 0xD2AA6098);
  int v439 = BYTE2(v421) ^ 0x16;
  int v465 = (BYTE2(v421) ^ 0x73)
       - 757047905
       + ((2 * (((BYTE2(v421) ^ 0x73) + 44) & 0x173 ^ (BYTE2(v421) ^ 0x73 | 0x7FFFFFFE))) ^ 0x8040403);
  LODWORD(v69) = *(_DWORD *)&v139[4 * (v410 ^ 0xDB)] ^ ((v410 ^ 0xF6)
                                                      - 757047905
                                                      + ((2 * (v410 ^ 0xF6) + 88) & 0x2E4 ^ 0xF7FBFBFF));
  int v408 = BYTE2(v407);
  unsigned int v455 = (v408 ^ 0xEC) - 757047905 + ((2 * (v408 ^ 0xEC) + 88) & 0x2E4 ^ 0xF7FBFBFF);
  unsigned int v451 = HIBYTE(v421) ^ 0xE8;
  unsigned int v182 = *(_DWORD *)(v60 - 192);
  unsigned int v183 = *(_DWORD *)&v139[4 * (BYTE2(v182) ^ 0xE8)] ^ ((BYTE2(v182) ^ 0xC5)
                                                     - 757047905
                                                     + ((2 * (BYTE2(v182) ^ 0xC5) + 88) & 0x2E4 ^ 0xF7FBFBFF));
  int v184 = (181304767 * *(_DWORD *)&v146[4 * (v182 ^ 0xCA)] - 1382350301) ^ *(_DWORD *)&v144[4 * (HIBYTE(v182) ^ 0x8E)] ^ (v183 - ((2 * v183) & 0x58A3531C) + 743549326);
  unsigned int v422 = v414 ^ 0x8834528A;
  unsigned int v185 = (181304767 * *(_DWORD *)&v146[4 * (v414 ^ 0xFB)] - 1382350301) ^ (((v414 ^ 0x8834528A) >> 16)
                                                                                          - 757047905
                                                                                          + ((2
                                                                                            * ((v414 ^ 0x8834528A) >> 16)
                                                                                            + 88) & 0x2E4 ^ 0xF7FBFBFF)) ^ *(_DWORD *)&v139[4 * (((v414 ^ 0x8834528A) >> 16) ^ 0x2D)];
  unsigned int v411 = v184 - ((2 * v184) & 0xD2AA6098);
  unsigned int v186 = (v185 - ((2 * v185) & 0xD2AA6098) - 380293044) ^ *(_DWORD *)&v141[4 * (BYTE1(v414) ^ 8)];
  LODWORD(v69) = *(_DWORD *)&v144[4 * (v424 ^ 0xA1)] ^ (181304767 * *(_DWORD *)&v146[4 * (v431 ^ 0xAF)]
                                                      - 1382350301) ^ (v69
                                                                     - ((2 * v69) & 0x58A3531C)
                                                                     + 743549326);
  unsigned int v432 = v186 - ((2 * v186) & 0x58A3531C);
  unsigned int v425 = v69 - ((2 * v69) & 0xD2AA6098);
  LODWORD(v69) = *(_DWORD *)&v146[4 * (v492 ^ 0xEC)];
  unsigned int v187 = *(_DWORD *)&v139[4 * (v520 ^ 0x32)] ^ ((v520 ^ 0x1F)
                                              - 757047905
                                              + ((2 * (v520 ^ 0x1F) + 88) & 0x2E4 ^ 0xF7FBFBFF));
  int v188 = *(_DWORD *)&v146[4 * (v511 ^ 0xE6)];
  LODWORD(v69) = *(_DWORD *)&v144[4 * (HIBYTE(v492) ^ 0xCA)] ^ ((BYTE2(v492) ^ 0x2F)
                                                              - 757047905
                                                              + ((2 * (BYTE2(v492) ^ 0x2F) + 88) & 0x2E4 ^ 0xF7FBFBFF)) ^ *(_DWORD *)&v139[4 * (BYTE2(v492) ^ 2)] ^ (181304767 * v69 - ((362609534 * v69 + 1530266694) & 0x58A3531C) - 638800975);
  unsigned int v189 = (v187 - ((2 * v187) & 0xD2AA6098) - 380293044) ^ *(_DWORD *)&v141[4 * (HIDWORD(v534) ^ 0x8C)] ^ (181304767 * *(_DWORD *)&v146[4 * (v522 ^ 0xD9)] - 1382350301);
  int v190 = ((v511 ^ 0x49A657C7u) >> 16);
  int v191 = *(_DWORD *)&v144[4 * ((v511 ^ 0x49A657C7u) >> 24)] ^ *(_DWORD *)&v139[4 * (v190 ^ 0x18)] ^ ((v190 ^ 0x35) - 757047905 + ((2 * (((v190 ^ 0x35) + 44) & 0x173 ^ (v190 ^ 0x35 | 0x7FFFFFFE))) ^ 0x8040403)) ^ (181304767 * v188 - ((362609534 * v188 + 1530266694) & 0x58A3531C) - 638800975);
  unsigned int v192 = *(_DWORD *)&v139[4 * (((*(_DWORD *)(v60 - 148) ^ 0xA99ABAAA) >> 16) ^ 0x2D)] ^ (((*(_DWORD *)(v60 - 148) ^ 0xA99ABAAA) >> 16) - 757047905 + ((2 * ((*(_DWORD *)(v60 - 148) ^ 0xA99ABAAA) >> 16) + 88) & 0x2E4 ^ 0xF7FBFBFF));
  HIDWORD(v534) = (v69 - ((2 * v69) & 0xD2AA6098) - 380293044) ^ *(_DWORD *)&v141[4
                                                                                                * (BYTE1(v492) ^ 0x2E)];
  unsigned int v523 = v189 - ((2 * v189) & 0x58A3531C);
  unsigned int v415 = BYTE1(v511) ^ 0xB9;
  LODWORD(v69) = (v192 - ((2 * v192) & 0x58A3531C) + 743549326) ^ *(_DWORD *)&v144[4
                                                                                 * ((*(_DWORD *)(v60 - 148) ^ 0xA99ABAAA) >> 24)] ^ (181304767 * *(_DWORD *)&v146[4 * (*(_DWORD *)(v60 - 148) ^ 0x3A)] - 1382350301);
  unsigned int v521 = v191 - ((2 * v191) & 0xD2AA6098);
  unsigned int v512 = v69 - ((2 * v69) & 0xD2AA6098);
  unsigned int v193 = *(_DWORD *)&v139[4 * (v505 ^ 0xC1)] ^ ((v505 ^ 0xEC)
                                              - 757047905
                                              + ((2 * (v505 ^ 0xEC) + 88) & 0x2E4 ^ 0xF7FBFBFF));
  LODWORD(v69) = (v193 - ((2 * v193) & 0xD2AA6098) - 380293044) ^ *(_DWORD *)&v141[4
                                                                                 * ((v508 - ((2 * v501) & 0x166) + 179) ^ 0x54)] ^ (181304767 * *(_DWORD *)&v146[4 * (v525 ^ 0xE2)] - 1382350301);
  unsigned int v506 = BYTE1(v517) ^ 0x77;
  int v194 = *(_DWORD *)&v146[4 * (v514 ^ 0x7E)];
  int v195 = (181304767 * v194 - ((362609534 * v194 + 1530266694) & 0x58A3531C) - 638800975) ^ *(_DWORD *)&v144[4 * (HIBYTE(v514) ^ 0xC7)];
  unsigned int v399 = ((unsigned __int16)(v514 ^ 0x52D3) >> 8) ^ 0x89;
  int v526 = v69 - ((2 * v69) & 0x58A3531C);
  unsigned int v502 = v195 - ((2 * v195) & 0xD2AA6098);
  unsigned int v509 = v489 ^ 0xEEA2BFA8;
  unsigned int v196 = *(_DWORD *)&v139[4 * (((v489 ^ 0xEEA2BFA8) >> 16) ^ 0x86)] ^ ((((v489 ^ 0xEEA2BFA8) >> 16) ^ 0xAB)
                                                                                      - 757047905
                                                                                      + ((2
                                                                                        * (((v489 ^ 0xEEA2BFA8) >> 16) ^ 0xAB)
                                                                                        + 88) & 0x2E4 ^ 0xF7FBFBFF));
  LODWORD(v69) = (181304767 * *(_DWORD *)&v146[4 * (v489 ^ 0x68)] - 1382350301) ^ *(_DWORD *)&v141[4 * (BYTE1(v489) ^ 0x55)] ^ (v196 - ((2 * v196) & 0xD2AA6098) - 380293044);
  unsigned int v394 = v408 ^ 0xC1;
  unsigned int v490 = v517 ^ 0x231B9DB5;
  int v197 = ((v517 ^ 0x231B9DB5) >> 16);
  unsigned int v393 = v197 ^ 0xEC;
  unsigned int v497 = (v197 ^ 0xC1) - 757047905 + ((2 * (v197 ^ 0xC1) + 88) & 0x2E4 ^ 0xF7FBFBFF);
  LODWORD(v397) = v69 - ((2 * v69) & 0x58A3531C);
  unsigned int v390 = BYTE2(v514) ^ 0x63;
  unsigned int v493 = (BYTE2(v514) ^ 0x4E) - 757047905 + ((2 * (BYTE2(v514) ^ 0x4E) + 88) & 0x2E4 ^ 0xF7FBFBFF);
  LODWORD(v61) = *(_DWORD *)&v146[4 * (v538 ^ 0x74)];
  int v198 = *(_DWORD *)&v146[4 * (v547 ^ 0xFB)];
  int v199 = *(_DWORD *)&v146[4 * v413];
  LODWORD(v79) = *(_DWORD *)&v146[4 * v402];
  LODWORD(v69) = *(_DWORD *)&v146[4 * (v517 ^ 0x75)];
  int v200 = *(_DWORD *)&v146[4 * ((v543 ^ v101) ^ 0x97)];
  int v201 = *(_DWORD *)&v146[4 * (v543 ^ 0x2A)];
  int v548 = 181304767 * *(_DWORD *)&v146[4 * (v130 ^ 0x31)] - 1382350301;
  HIDWORD(v412) = 181304767 * v198 - 1382350301;
  LODWORD(v403) = 181304767 * *(_DWORD *)&v146[4 * (*(_DWORD *)(v60 - 160) ^ 0xB8)] - 1382350301;
  LODWORD(v409) = 181304767 * v199 - 1382350301;
  HIDWORD(v395) = 181304767 * *(_DWORD *)&v146[4 * (v529 ^ 0xF0)] - 1382350301;
  LODWORD(v396) = 181304767 * v79 - 1382350301;
  int v539 = 181304767 * *(_DWORD *)&v146[4 * (*(_DWORD *)(v60 - 128) ^ 0x57)] - 1382350301;
  int v462 = 181304767 * *(_DWORD *)&v146[4 * v398] - 1382350301;
  int v518 = 181304767 * *(_DWORD *)&v146[4 * (v486 ^ 0x78)] - 1382350301;
  HIDWORD(v396) = 181304767 * v69 - 1382350301;
  HIDWORD(v397) = 181304767 * *(_DWORD *)&v146[4 * (v551 ^ 0xC9)] - 1382350301;
  LODWORD(v146) = (181304767 * v61 - ((362609534 * v61 + 1530266694) & 0x58A3531C) - 638800975) ^ *(_DWORD *)&v144[4 * (HIBYTE(v106) ^ 0x7B)];
  unsigned int v202 = *(_DWORD *)&v139[4 * (BYTE2(v540) ^ 0xBA)] ^ ((BYTE2(v540) ^ 0x97)
                                                     - 757047905
                                                     + ((2 * (BYTE2(v540) ^ 0x97) + 88) & 0x2E4 ^ 0xF7FBFBFF)) ^ (181304767 * v200 - 1382350301);
  unsigned int v203 = (v202 - ((2 * v202) & 0xD2AA6098) - 380293044) ^ *(_DWORD *)&v141[4
                                                                         * (((unsigned __int16)(v543 ^ v101) >> 8) ^ 8)];
  LODWORD(v61) = *(_DWORD *)&v139[4 * (BYTE2(v551) ^ 0xFC)] ^ ((BYTE2(v551) ^ 0xD1)
                                                             - 757047905
                                                             + ((2 * (BYTE2(v551) ^ 0xD1) + 88) & 0x2E4 ^ 0xF7FBFBFF));
  unsigned int v204 = (181304767 * v201 - 1382350301) ^ ((BYTE2(v543) ^ 0x37)
                                          - 757047905
                                          + ((2 * (BYTE2(v543) ^ 0x37) + 88) & 0x2E4 ^ 0xF7FBFBFF)) ^ *(_DWORD *)&v139[4 * (BYTE2(v543) ^ 0x1A)];
  unsigned int v205 = v146 - ((2 * v146) & 0xD2AA6098);
  LODWORD(v392) = *(_DWORD *)&v139[4 * (BYTE2(v129) ^ 0x61)];
  HIDWORD(v405) = *(_DWORD *)&v139[4 * (v406 ^ 0x8A)];
  int v485 = *(_DWORD *)&v139[4 * (v439 ^ 0x48)];
  int v515 = *(_DWORD *)&v139[4 * v394];
  int v206 = (v204 - ((2 * v204) & 0x58A3531C) + 743549326) ^ *(_DWORD *)&v144[4 * (HIBYTE(v543) ^ 0xF9)];
  HIDWORD(v391) = *(_DWORD *)&v139[4 * v393];
  HIDWORD(v392) = *(_DWORD *)&v139[4 * v390];
  int v207 = *(_DWORD *)(v60 - 240);
  LODWORD(v395) = *(_DWORD *)&v139[4 * (v207 ^ 0x1A)];
  int v550 = *(_DWORD *)&v141[4 * v482];
  int v483 = *(_DWORD *)&v141[4 * v404];
  int v440 = *(_DWORD *)&v141[4 * (BYTE1(*(_DWORD *)(v60 - 160)) ^ 0x85)];
  HIDWORD(v403) = *(_DWORD *)&v141[4 * (BYTE1(*(_DWORD *)(v60 - 168)) ^ 0xBD)];
  *(_DWORD *)(v60 - 168) = *(_DWORD *)&v141[4 * v466];
  int v546 = *(_DWORD *)&v141[4 * (v545 ^ 0xAA)];
  LODWORD(v139) = ((v106 >> 15) & 0x58 ^ 0x48) + (v207 ^ 0x4C64A1B);
  int v467 = *(_DWORD *)&v141[4 * v418];
  *(_DWORD *)(v60 - 240) = *(_DWORD *)&v141[4 * v417];
  *(_DWORD *)(v60 - 176) = *(_DWORD *)&v141[4 * (BYTE1(*(_DWORD *)(v60 - 176)) ^ 0xD6)];
  int v549 = *(_DWORD *)&v141[4 * v401];
  *(_DWORD *)(v60 - 184) = *(_DWORD *)&v141[4 * (BYTE1(*(_DWORD *)(v60 - 184)) ^ 0xD7)];
  LODWORD(v69) = HIBYTE(v486) ^ 0x21;
  HIDWORD(v400) = *(_DWORD *)&v141[4 * (BYTE1(v486) ^ 0xAE)];
  int v208 = *(_DWORD *)&v141[4 * (BYTE1(*(_DWORD *)(v60 - 192)) ^ 0x16)];
  HIDWORD(v389) = *(_DWORD *)&v141[4 * (v536 ^ 0xF0)];
  *(_DWORD *)(v60 - 192) = *(_DWORD *)&v141[4 * v415];
  LODWORD(v419) = v139 - 837151885 + ((2 * v139) & 0x2E4 ^ 0xF7FBFBFF);
  int v537 = *(_DWORD *)&v141[4 * (BYTE1(*(_DWORD *)(v60 - 148)) ^ 0x3A)];
  unsigned int v209 = v203 - ((2 * v203) & 0x58A3531C);
  LODWORD(v391) = *(_DWORD *)&v141[4 * v506];
  int v487 = *(_DWORD *)&v141[4 * v399];
  *(_DWORD *)(v60 - 232) = *(_DWORD *)&v141[4 * (*(_DWORD *)(v60 - 232) ^ 0x84)];
  HIDWORD(v416) = *(_DWORD *)&v141[4 * (BYTE1(v543) ^ 0x2E)];
  int v210 = *(_DWORD *)&v141[4 * (BYTE1(*(_DWORD *)(v60 - 256)) ^ 0xC8)];
  *(_DWORD *)(v60 - 160) = v499 - 380293044;
  unsigned int v500 = v495 - 380293044;
  *(_DWORD *)(v60 - 256) = v477 - 380293044;
  LODWORD(v416) = v474 - 380293044;
  unsigned int v544 = v471 - 380293044;
  unsigned int v507 = v437 - 380293044;
  LODWORD(v400) = v427 - 380293044;
  unsigned int v438 = v429 - 380293044;
  unsigned int v478 = v449 - 380293044;
  unsigned int v472 = v443 - 380293044;
  LODWORD(v146) = v411 - 380293044;
  LODWORD(v389) = v425 - 380293044;
  unsigned int v450 = v521 - 380293044;
  unsigned int v444 = v512 - 380293044;
  unsigned int v496 = v502 - 380293044;
  LODWORD(a25) = v205 - 380293044;
  unsigned int v475 = v206 - ((2 * v206) & 0xD2AA6098) - 380293044;
  int v513 = *(_DWORD *)&v144[4 * (HIBYTE(v129) ^ 0xB2)];
  *(_DWORD *)(v60 - 216) = *(_DWORD *)&v144[4 * (*(_DWORD *)(v60 - 216) ^ 7)];
  int v503 = *(_DWORD *)&v144[4 * (HIBYTE(*(_DWORD *)(v60 - 140)) ^ 7)];
  HIDWORD(v409) = *(_DWORD *)&v144[4 * HIBYTE(*(_DWORD *)(v60 - 144))];
  HIDWORD(a27) = *(_DWORD *)&v144[4 * (HIBYTE(*(_DWORD *)(v60 - 128)) ^ 0xB8)];
  *(_DWORD *)(v60 - 128) = *(_DWORD *)&v144[4 * HIBYTE(v420)];
  *(_DWORD *)(v60 - 208) = *(_DWORD *)&v144[4 * (*(_DWORD *)(v60 - 208) ^ 0x4B)];
  HIDWORD(v423) = *(_DWORD *)&v144[4 * (HIBYTE(*(_DWORD *)(v60 - 136)) ^ 0xCF)];
  unsigned int v211 = v210 ^ (v61 - ((2 * v61) & 0xD2AA6098) - 380293044);
  int v452 = *(_DWORD *)&v144[4 * v451];
  int v212 = *(_DWORD *)&v144[4 * v69];
  int v213 = *(_DWORD *)&v144[4 * HIBYTE(v422)];
  *(_DWORD *)(v60 - 224) = *(_DWORD *)&v144[4 * (*(_DWORD *)(v60 - 224) ^ 0xAA)];
  LODWORD(v388) = *(_DWORD *)&v144[4 * HIBYTE(v490)];
  int v491 = *(_DWORD *)&v144[4 * (*(_DWORD *)(v60 - 248) ^ 0x38)];
  HIDWORD(v388) = *(_DWORD *)&v144[4 * HIBYTE(v509)];
  LODWORD(v423) = *(_DWORD *)&v144[4 * (HIBYTE(v540) ^ 0x3D)];
  HIDWORD(v419) = *(_DWORD *)&v144[4 * (HIBYTE(v551) ^ 4)];
  unsigned int v214 = v527 + 743549326;
  int v541 = v481 + 743549326;
  *(_DWORD *)(v60 - 248) = v460 + 743549326;
  unsigned int v552 = v470 + 743549326;
  unsigned int v461 = v523 + 743549326;
  int v215 = v397 + 743549326;
  unsigned int v216 = v209 + 743549326;
  int v217 = v211 - ((2 * v211) & 0x58A3531C) + 743549326;
  int v218 = v535 ^ HIDWORD(v534) ^ 0x6285F181;
  unsigned int v219 = v146 ^ v208 ^ v218;
  int v220 = v59;
  uint64_t v221 = (uint64_t)*(&off_10005CE90 + (v59 + 43));
  v222 = (char *)*(&off_10005CE90 + v59 - 73) - 12;
  uint64_t v223 = (uint64_t)*(&off_10005CE90 + (v59 ^ 0xF8u));
  v224 = (char *)*(&off_10005CE90 + (v59 + 56)) - 12;
  unsigned int v225 = (v224[*(unsigned __int8 *)(v60 - 105) ^ 0xE4] ^ 0xA1) & 0xFF00FFFF | ((*(unsigned __int8 *)(v221 + (*(unsigned __int8 *)(v60 - 108) ^ 0x3ELL)) ^ (*(unsigned __int8 *)(v60 - 108) - ((2 * *(unsigned __int8 *)(v60 - 108)) & 0x36) - 101) ^ 0xFFFFFFE1) << 24) | (((*(unsigned char *)(v223 + (*(unsigned __int8 *)(v60 - 107) ^ 0x27)) + 59) ^ 0x96) << 16);
  int v226 = ((*(unsigned __int8 *)(v221 + (*(unsigned __int8 *)(v60 - 104) ^ 0xD3)) ^ (*(unsigned __int8 *)(v60 - 104)
                                                                                    + (~(2
                                                                                       * *(unsigned __int8 *)(v60 - 104)) | 0xC9)
                                                                                    - 100) ^ 0xE0) << 24) | ((v222[*(unsigned __int8 *)(v60 - 102) ^ 0xBELL] ^ 0x22) << 8);
  unsigned int v227 = (v224[*(unsigned __int8 *)(v60 - 109) ^ 0x41] ^ 0x97) & 0xFF00FFFF | (((*(unsigned char *)(v223 + (*(unsigned __int8 *)(v60 - 111) ^ 0x40)) + 59) ^ 0x5A) << 16) | ((v222[*(unsigned __int8 *)(v60 - 110) ^ 0xBBLL] ^ 0x80) << 8) | ((*(unsigned __int8 *)(v221 + (*(unsigned __int8 *)(v60 - 112) ^ 0x1ELL)) ^ (*(unsigned __int8 *)(v60 - 112) - ((2 * *(unsigned __int8 *)(v60 - 112)) & 0x36) - 101) ^ 0x84) << 24);
  v528 = v222;
  uint64_t v530 = v221;
  int v228 = v224[*(unsigned __int8 *)(v60 - 97) ^ 0x74] ^ 0x30 | (((*(unsigned char *)(v223 + (*(unsigned __int8 *)(v60 - 99) ^ 0xF3)) + 59) ^ 2) << 16) | ((v222[*(unsigned __int8 *)(v60 - 98) ^ 0x20] ^ 0x6A) << 8) | ((*(unsigned __int8 *)(v221 + (*(unsigned __int8 *)(v60 - 100) ^ 0xF3)) ^ (*(unsigned __int8 *)(v60 - 100) - ((2 * *(unsigned __int8 *)(v60 - 100)) & 0x36) - 101) ^ 0x85) << 24);
  v524 = v224;
  int v229 = v225 | ((v222[*(unsigned __int8 *)(v60 - 106) ^ 9] ^ 0x85) << 8);
  unsigned int v230 = (v224[*(unsigned __int8 *)(v60 - 101) ^ 0xF2] ^ 0x18 | v226) & 0xFF00FFFF | (((*(unsigned char *)(v223 + (*(unsigned __int8 *)(v60 - 103) ^ 0xE9)) + 59) ^ 0x8A) << 16);
  if ((v219 & 0x80) != 0) {
    int v231 = -128;
  }
  else {
    int v231 = 128;
  }
  *(_DWORD *)(v60 - 136) = v228 ^ 0x2B01EA6F;
  *(_DWORD *)(v60 - 140) = v227 ^ 0x5E7FEAB1;
  *(_DWORD *)(v60 - 144) = v229 ^ 0xA7DBB3DC;
  *(_DWORD *)(v60 - 148) = v230 ^ 0xA9BF8045;
  HIDWORD(v519) = v389 ^ HIDWORD(v389);
  LODWORD(v519) = v212 ^ HIDWORD(v400) ^ v455 ^ v515 ^ v518;
  HIDWORD(v516) = (v432 + 743549326) ^ v213;
  LODWORD(v516) = v500 ^ v483;
  HIDWORD(v510) = v513 ^ ((BYTE2(v129) ^ 0x4C) - 757047906 - ((2 * (BYTE2(v129) ^ 0x4C) + 160207960) & 0x80406E4)) ^ v392 ^ v214;
  LODWORD(v510) = v400 ^ v467;
  HIDWORD(v504) = v507 ^ v546 ^ HIDWORD(v395);
  LODWORD(v504) = (v457 + 743549326) ^ v503 ^ v396;
  HIDWORD(v498) = (v434 + 743549326) ^ HIDWORD(v409);
  LODWORD(v498) = v391 ^ v388 ^ v497 ^ HIDWORD(v391) ^ HIDWORD(v396);
  HIDWORD(v494) = v487 ^ v493 ^ HIDWORD(v392) ^ v496;
  LODWORD(v494) = v215 ^ HIDWORD(v388);
  HIDWORD(v488) = (v526 + 743549326) ^ v491;
  LODWORD(v488) = v472 ^ *(_DWORD *)(v60 - 184);
  HIDWORD(v484) = v452 ^ v465 ^ v485 ^ (v405 + 743549326);
  LODWORD(v484) = (v412 + 743549326) ^ HIDWORD(v423);
  HIDWORD(v479) = v462 ^ v549 ^ v478;
  LODWORD(v479) = HIDWORD(v397) ^ HIDWORD(v419) ^ v217;
  HIDWORD(v473) = v475 ^ HIDWORD(v416);
  LODWORD(v473) = v216 ^ v423;
  HIDWORD(v468) = *(_DWORD *)(v60 - 232) ^ v419 ^ v395 ^ a25;
  LODWORD(v468) = v461 ^ *(_DWORD *)(v60 - 224);
  HIDWORD(v463) = *(_DWORD *)(v60 - 192) ^ v450;
  LODWORD(v463) = v444 ^ v537;
  HIDWORD(v458) = v416 ^ HIDWORD(v403);
  LODWORD(v458) = *(_DWORD *)(v60 - 256) ^ v440 ^ v403;
  HIDWORD(v453) = v409 ^ *(_DWORD *)(v60 - 168) ^ v544;
  LODWORD(v453) = HIDWORD(v412) ^ *(_DWORD *)(v60 - 216) ^ v541;
  HIDWORD(v447) = v438 ^ *(_DWORD *)(v60 - 176);
  LODWORD(v447) = *(_DWORD *)(v60 - 240) ^ v446 ^ HIDWORD(a27) ^ HIDWORD(v405) ^ v539;
  HIDWORD(v441) = v552 ^ *(_DWORD *)(v60 - 208);
  LODWORD(v441) = *(_DWORD *)(v60 - 248) ^ *(_DWORD *)(v60 - 128);
  LODWORD(v435) = (v231 + (v219 ^ 0x2497E332)) ^ v218;
  HIDWORD(v435) = *(_DWORD *)(v60 - 200) - 2146926575;
  HIDWORD(v430) = *(_DWORD *)(v60 - 160) ^ v550 ^ v548;
  LODWORD(v430) = (v220 + 994) ^ 0x4D1;
  *(_DWORD *)(v60 - 128) = v220 + 994;
  HIDWORD(a27) = (v220 + 994) ^ 0x481;
  *(void *)(v60 - 176) = 13;
  v232 = *(unsigned __int8 **)(v60 - 120);
  int v233 = *(_DWORD *)(v60 - 128);
  unsigned __int8 v234 = *(unsigned char *)(v223 + (v232[13] ^ 0xF3)) + ((*(unsigned char *)(v60 - 128) - 122) ^ 0xFC);
  *(void *)(v60 - 160) = 1;
  int v235 = (v234 ^ 2) << 16;
  char v236 = *(unsigned char *)(v223 + (v232[1] ^ 0x57));
  *(void *)(v60 - 168) = 10;
  uint64_t v237 = v232[10] ^ 0xB6;
  int v238 = ((v236 + 59) ^ 0xF6) << 16;
  *(void *)(v60 - 184) = 4;
  int v239 = v528[v237] ^ 0xF;
  LODWORD(v237) = *(unsigned __int8 *)(v530 + (v232[4] ^ 0x9ALL)) ^ (v232[4] + (~(2 * v232[4]) | 0xC9) - 100) ^ 0xFFFFFFCF;
  uint64_t v240 = v232[7] ^ 0xD6;
  *(void *)(v60 - 232) = 7;
  *(void *)(v60 - 224) = 2;
  LODWORD(v240) = v224[v240] ^ 0xF2 | (v237 << 24);
  LODWORD(v237) = v528[v232[2]] ^ 0x1D;
  *(void *)(v60 - 200) = 3;
  int v241 = v224[v232[3] ^ 0x74];
  *(void *)(v60 - 192) = 12;
  LODWORD(v237) = v238 | (v237 << 8) | v241 ^ 0x30;
  int v242 = *(unsigned __int8 *)(v530 + (v232[12] ^ 0x6ELL)) ^ (v232[12] - ((2 * v232[12]) & 0x36) - 101) ^ 0x51;
  *(void *)(v60 - 216) = 0;
  int v243 = v237 | ((*(unsigned __int8 *)(v530 + (*v232 ^ 0x15)) ^ (*v232 - ((2 * *v232) & 0x36) - 101) ^ 0xAE) << 24);
  unsigned int v244 = (v239 << 8) | ((*(unsigned __int8 *)(v530 + (v232[8] ^ 0x46)) ^ (v232[8] - ((2 * v232[8]) & 0x36) - 101) ^ 0xFFFFFFE7) << 24);
  *(void *)(v60 - 208) = 14;
  LODWORD(v237) = v528[v232[14] ^ 0xD5] ^ 0x95;
  LODWORD(v237) = (v237 << 8) + 1047924406 - ((v237 << 9) & 0x1C00);
  unsigned int v245 = ((v235 | (v242 << 24)) ^ 0xDB53DFFF) + 615260161 + ((2 * (v235 | (v242 << 24))) & 0xB6A60000);
  *(void *)(v60 - 240) = 5;
  int v246 = (v245 - (v237 ^ 0x3E760EB6 | v245)) ^ ((v237 ^ 0xC189F149) + 1);
  *(void *)(v60 - 256) = 11;
  LODWORD(v240) = v240 & 0xFF00FFFF | (((*(unsigned char *)(v223 + (v232[5] ^ 0x9DLL)) + 59) ^ 0xF7) << 16);
  uint64_t v247 = v232[6] ^ 0xA4;
  unsigned int v248 = (v524[v232[11] ^ 0xC2] ^ 0x15 | v244) & 0xFF00FFFF | (((*(unsigned char *)(v223 + (v232[9] ^ 0x3ELL)) + 59) ^ 0xDF) << 16);
  *(void *)(v60 - 248) = 15;
  int v249 = v528[v247];
  LODWORD(v247) = v524[v232[15] ^ 0x47] ^ (((v246 + 1047924406 - ((2 * v246) & 0x7CEC1D6C)) ^ v237)
                                                            + v245);
  unsigned int v542 = v240 | ((v249 ^ 0xC5) << 8);
  v250 = (char *)*(&off_10005CE90 + v233 - 957) - 8;
  unsigned int v251 = *(_DWORD *)&v250[4 * (((unsigned __int16)(v542 ^ WORD2(v531)) >> 8) ^ 0x21)] ^ ((((unsigned __int16)(v542 ^ WORD2(v531)) >> 8) ^ 0x4C) + 83930553 - ((2 * (((v542 ^ HIDWORD(v531)) >> 8) ^ 0xB71C4C)) & 0x172));
  v252 = (char *)*(&off_10005CE90 + v430) - 8;
  unsigned int v253 = v243 ^ v532;
  int v254 = (v251 + 725496940 - ((2 * v251) & 0x567C68D8)) ^ *(_DWORD *)&v252[4 * ((v243 ^ v532) ^ 0xAA)];
  LODWORD(v240) = HIDWORD(a50) ^ v247 ^ 0x30;
  unsigned int v255 = ((BYTE1(v240) ^ 0xED) + 83930553 - ((2 * ((v240 >> 8) ^ 0x818AED)) & 0x172)) ^ *(_DWORD *)&v250[4 * (BYTE1(v240) ^ 0x80)];
  int v256 = v255 + 867425885 - ((2 * v255) & 0x6767BCBA);
  int v257 = v254 + 867425885 - ((2 * v254) & 0x6767BCBA);
  v258 = (char *)*(&off_10005CE90 + v233 - 1055) - 8;
  int v259 = *(_DWORD *)&v258[4 * (((v248 ^ v531) >> 16) ^ 0x68)];
  HIDWORD(v261) = v259 ^ 0x451;
  LODWORD(v261) = v259 ^ 0xD1BF8000;
  int v260 = v261 >> 12;
  int v262 = *(_DWORD *)&v258[4 * ((v243 ^ v532) >> 16)];
  HIDWORD(v261) = v262 ^ 0x451;
  LODWORD(v261) = v262 ^ 0xD1BF8000;
  v263 = (char *)*(&off_10005CE90 + HIDWORD(a27)) - 4;
  int v264 = *(_DWORD *)&v263[4 * (((v542 ^ HIDWORD(v531)) >> 24) ^ 0xB7)] ^ (v261 >> 12);
  int v265 = *(_DWORD *)&v258[4 * (BYTE2(v240) ^ 0x8A)];
  HIDWORD(v261) = v265 ^ 0x451;
  LODWORD(v261) = v265 ^ 0xD1BF8000;
  int v266 = v256 ^ v264;
  int v267 = (BYTE1(v248) ^ BYTE1(v531)) ^ *(_DWORD *)&v252[4
                                                                       * ((v542 ^ BYTE4(v531)) ^ 0xFB)] ^ *(_DWORD *)&v250[4 * ((BYTE1(v248) ^ BYTE1(v531)) ^ 0x23)] ^ (v261 >> 12);
  int v268 = *(_DWORD *)&v258[4 * (((v542 ^ HIDWORD(v531)) >> 16) ^ 0x1C)];
  HIDWORD(v261) = v268 ^ 0x451;
  LODWORD(v261) = v268 ^ 0xD1BF8000;
  int v269 = *(_DWORD *)&v263[4 * (((v248 ^ v531) >> 24) ^ 0xF6)] ^ ((BYTE1(v253) ^ 0x32)
                                                                             + 83930553
                                                                             - 2
                                                                             * (((v253 >> 8) ^ 0x730032) & 0xBD ^ (v253 >> 8) & 4)) ^ *(_DWORD *)&v250[4 * (BYTE1(v253) ^ 0x5F)] ^ ((v261 >> 12) + 867425885 - ((2 * (v261 >> 12)) & 0x6767BCBA));
  unsigned int v270 = v389 ^ HIDWORD(v389) ^ v260 ^ v257 ^ *(_DWORD *)&v263[4 * (BYTE3(v240) ^ 0x81)];
  LODWORD(v240) = v519 ^ (v269 + 725496940 - ((2 * v269) & 0x567C68D8)) ^ *(_DWORD *)&v252[4
                                                                                         * (BYTE4(a50) ^ v247 ^ 0x30 ^ 0x27)];
  unsigned int v271 = HIDWORD(v516) ^ *(_DWORD *)&v252[4 * ((v248 ^ v531) ^ 0x5F)] ^ (v266
                                                                                        + 725496940
                                                                                        - ((2 * v266) & 0x567C68D8));
  unsigned int v272 = v435 ^ *(_DWORD *)&v263[4 * (((v243 ^ v532) >> 24) ^ 0x73)] ^ ((v267 ^ 0x2E3E999B)
                                                                                    + 867425885
                                                                                    + ((2
                                                                                      * ((v267 ^ 0x2E3E999B) & 0x33B3DE5F ^ v267 & 2)) ^ 0xFFFFFFFB)
                                                                                    + 1);
  int v273 = *(_DWORD *)&v258[4 * (BYTE2(v270) ^ 0x38)];
  HIDWORD(v261) = v273 ^ 0x451;
  LODWORD(v261) = v273 ^ 0xD1BF8000;
  int v274 = v261 >> 12;
  int v275 = *(_DWORD *)&v258[4 * (BYTE2(v240) ^ 0x7C)];
  HIDWORD(v261) = v275 ^ 0x451;
  LODWORD(v261) = v275 ^ 0xD1BF8000;
  int v276 = v261 >> 12;
  int v277 = *(_DWORD *)&v258[4 * (BYTE2(v271) ^ 0x66)];
  HIDWORD(v261) = v277 ^ 0x451;
  LODWORD(v261) = v277 ^ 0xD1BF8000;
  LODWORD(v247) = (v261 >> 12) ^ *(_DWORD *)&v250[4 * (BYTE1(v272) ^ 5)] ^ ((BYTE1(v272) ^ 0x68)
                                                                          + 83930553
                                                                          - 2
                                                                          * (((v272 >> 8) ^ 0x42BD68) & 0xBB ^ (v272 >> 8) & 2));
  LODWORD(v237) = (v274 + 725496940 - ((2 * v274) & 0x567C68D8)) ^ *(_DWORD *)&v252[4 * (v271 ^ 0xB6)];
  LODWORD(v247) = (v247 + 725496940 - ((2 * v247) & 0x567C68D8)) ^ *(_DWORD *)&v252[4 * (v270 ^ 0x61)];
  unsigned int v278 = ((BYTE1(v270) ^ 0x8C) + 83930553 - ((2 * ((v270 >> 8) ^ 0xF9388C)) & 0x172)) ^ 0xD678EAEF ^ *(_DWORD *)&v250[4 * (BYTE1(v270) ^ 0xE1)];
  unsigned int v279 = *(_DWORD *)&v263[4 * (HIBYTE(v271) ^ 0x43)] ^ 0x91A985E3;
  int v280 = v278 + v279 - 2 * (v278 & v279);
  int v281 = *(_DWORD *)&v258[4 * (BYTE2(v272) ^ 0xBD)];
  HIDWORD(v261) = v281 ^ 0x451;
  LODWORD(v261) = v281 ^ 0xD1BF8000;
  int v282 = *(_DWORD *)&v263[4 * (HIBYTE(v270) ^ 0xF9)] ^ (v276 + 867425885 - ((2 * v276) & 0x6767BCBA));
  int v283 = *(_DWORD *)&v263[4 * (HIBYTE(v272) ^ 0x42)];
  int v284 = (v282 + 725496940 - ((2 * v282) & 0x567C68D8)) ^ *(_DWORD *)&v252[4 * (v272 ^ 0xAB)];
  unsigned int v285 = v283 ^ v535 ^ *(_DWORD *)&v250[4 * (BYTE1(v240) ^ 0x6F)] ^ ((BYTE1(v240) ^ 2)
                                                                   + 83930553
                                                                   - ((v240 >> 7) & 0x172)) ^ (v237 + 867425885 - ((2 * v237) & 0x6767BCBA));
  unsigned int v286 = HIDWORD(v430) ^ *(_DWORD *)&v250[4 * (BYTE1(v271) ^ 0x39)] ^ (v284 + 83930553 - ((2 * v284) & 0xA015B72));
  unsigned int v287 = HIDWORD(v510) ^ *(_DWORD *)&v252[4 * (v240 ^ 0xAA)] ^ ((v280 ^ (v261 >> 12))
                                                                               + 725496940
                                                                               - ((2 * (v280 ^ (v261 >> 12))) & 0x567C68D8));
  LODWORD(v237) = v516 ^ *(_DWORD *)&v263[4 * (BYTE3(v240) ^ 0x10)];
  LODWORD(v240) = *(_DWORD *)&v258[4 * (BYTE2(v287) ^ 0x79)];
  unsigned int v288 = v237 ^ (v247 + 867425885 - ((2 * v247) & 0x6767BCBA));
  HIDWORD(v261) = v240 ^ 0x451;
  LODWORD(v261) = v240 ^ 0xD1BF8000;
  LODWORD(v240) = ((v261 >> 12) + 867425885 - ((2 * (v261 >> 12)) & 0x6767BCBA)) ^ *(_DWORD *)&v263[4 * (HIBYTE(v288) ^ 0x22)];
  LODWORD(v247) = ((BYTE1(v287) ^ 0xD0) + 83930553 - 2 * (((v287 >> 8) ^ 0x679D0) & 0xBF ^ (v287 >> 8) & 6)) ^ *(_DWORD *)&v250[4 * (BYTE1(v287) ^ 0xBD)];
  LODWORD(v247) = (v247 + 725496940 - ((2 * v247) & 0x567C68D8)) ^ *(_DWORD *)&v252[4 * (v285 ^ 0x76)];
  LODWORD(v237) = ((BYTE1(v286) ^ 0xEC) + 83930553 - ((2 * ((v286 >> 8) ^ 0xE5FEC)) & 0x172)) ^ *(_DWORD *)&v250[4 * (BYTE1(v286) ^ 0x81)];
  int v289 = *(_DWORD *)&v258[4 * (BYTE2(v286) ^ 0x5F)];
  HIDWORD(v261) = v289 ^ 0x451;
  LODWORD(v261) = v289 ^ 0xD1BF8000;
  int v290 = v261 >> 12;
  HIDWORD(v261) = *(_DWORD *)&v252[4 * (v288 ^ 0x5E)] ^ 0xC22913E4;
  LODWORD(v261) = HIDWORD(v261);
  LODWORD(v237) = (v261 >> 28) ^ __ROR4__(*(_DWORD *)&v263[4 * (HIBYTE(v287) ^ 6)] ^ 0x7462B151 ^ (v237+ 867425885- ((2 * v237) & 0x6767BCBA)), 28);
  int v291 = (v290 + 867425885 - ((2 * v290) & 0x6767BCBA)) ^ *(_DWORD *)&v263[4 * (HIBYTE(v285) ^ 0xD2)];
  int v292 = (v291 + 725496940 - ((2 * v291) & 0x567C68D8)) ^ *(_DWORD *)&v252[4 * (v287 ^ 0x4C)];
  int v293 = *(_DWORD *)&v258[4 * (BYTE2(v288) ^ 0x1B)];
  HIDWORD(v261) = v293 ^ 0x451;
  LODWORD(v261) = v293 ^ 0xD1BF8000;
  int v294 = v261 >> 12;
  int v295 = v240 + 725496940 - ((2 * v240) & 0x567C68D8);
  LODWORD(v240) = *(_DWORD *)&v258[4 * (BYTE2(v285) ^ 0xCC)];
  HIDWORD(v261) = v240 ^ 0x451;
  LODWORD(v261) = v240 ^ 0xD1BF8000;
  LODWORD(v240) = v510 ^ (v261 >> 12) ^ __ROR4__(v237 ^ 0x78071371, 4);
  LOBYTE(v237) = v286 ^ BYTE1(v271) ^ 0x54;
  unsigned int v296 = HIDWORD(v504) ^ *(_DWORD *)&v263[4 * (HIBYTE(v286) ^ 0xE)] ^ v294 ^ (v247
                                                                            + 867425885
                                                                            - ((2 * v247) & 0x6767BCBA));
  unsigned int v297 = v504 ^ *(_DWORD *)&v250[4 * (BYTE1(v288) ^ 5)] ^ (v292 + 83930553 - ((2 * v292) & 0xA015B72));
  unsigned int v298 = HIDWORD(v498) ^ ((BYTE1(v285) ^ 0xC0) + 83930553 - ((2 * ((v285 >> 8) ^ 0xD2CCC0)) & 0x172)) ^ *(_DWORD *)&v252[4 * (v237 ^ 0xCA)] ^ *(_DWORD *)&v250[4 * (BYTE1(v285) ^ 0xAD)] ^ v295;
  int v299 = *(_DWORD *)&v258[4 * (BYTE2(v297) ^ 0x52)];
  HIDWORD(v261) = v299 ^ 0x451;
  LODWORD(v261) = v299 ^ 0xD1BF8000;
  int v300 = v261 >> 12;
  int v301 = *(_DWORD *)&v258[4 * (BYTE2(v240) ^ 0xFE)];
  HIDWORD(v261) = v301 ^ 0x451;
  LODWORD(v261) = v301 ^ 0xD1BF8000;
  int v302 = ((v296 >> 8) ^ 0xA73B29) & 0xBD ^ (v296 >> 8) & 4;
  int v303 = BYTE1(v296) ^ 0x29;
  int v304 = ((BYTE1(v297) ^ 0x95) + 83930553 - ((2 * ((v297 >> 8) ^ 0x455295)) & 0x172)) ^ *(_DWORD *)&v252[4 * (v296 ^ 0x72)] ^ *(_DWORD *)&v250[4 * (BYTE1(v297) ^ 0xF8)] ^ ((v261 >> 12) + 725496940 - ((2 * (v261 >> 12)) & 0x567C68D8));
  int v305 = *(_DWORD *)&v258[4 * (BYTE2(v298) ^ 2)];
  HIDWORD(v261) = v305 ^ 0x451;
  LODWORD(v261) = v305 ^ 0xD1BF8000;
  int v306 = *(_DWORD *)&v263[4 * (HIBYTE(v296) ^ 0xA7)] ^ *(_DWORD *)&v252[4
                                                                      * ((v297 ^ BYTE1(v288)) ^ 0x54)] ^ (v261 >> 12);
  int v307 = *(_DWORD *)&v258[4 * (BYTE2(v296) ^ 0x3B)];
  HIDWORD(v261) = v307 ^ 0x451;
  LODWORD(v261) = v307 ^ 0xD1BF8000;
  unsigned int v308 = v498 ^ *(_DWORD *)&v252[4 * (v240 ^ 0x1E)] ^ *(_DWORD *)&v263[4 * (HIBYTE(v297) ^ 0x61)] ^ ((BYTE1(v298) ^ 0xD9) + 83930553 - 2 * (((v298 >> 8) ^ 0x9802D9) & 0xBF ^ (v298 >> 8) & 6)) ^ *(_DWORD *)&v250[4 * (BYTE1(v298) ^ 0xB4)] ^ (v261 >> 12);
  unsigned int v309 = HIDWORD(v494) ^ *(_DWORD *)&v263[4 * (HIBYTE(v298) ^ 0x98)] ^ (v304 + 867425885 - ((2 * v304) & 0x6767BCBA));
  unsigned int v310 = v215 ^ HIDWORD(v388) ^ *(_DWORD *)&v252[4 * (v298 ^ 0x3D)] ^ *(_DWORD *)&v263[4 * (BYTE3(v240) ^ 0x99)] ^ (v303 + 83930553 - 2 * v302) ^ *(_DWORD *)&v250[4 * (v303 ^ 0x6D)] ^ v300;
  LODWORD(v247) = *(_DWORD *)&v258[4 * (BYTE2(v308) ^ 0x6F)];
  HIDWORD(v261) = v247 ^ 0x451;
  LODWORD(v261) = v247 ^ 0xD1BF8000;
  LODWORD(v247) = v261 >> 12;
  LODWORD(v237) = v306 ^ 0x188DEA31;
  int v311 = (v306 ^ 0x188DEA31) & 0x500ADBF;
  int v312 = v306 & 6;
  int v313 = *(_DWORD *)&v258[4 * (BYTE2(v310) ^ 0x65)];
  int v314 = v311 ^ v312;
  HIDWORD(v261) = v313 ^ 0x451;
  LODWORD(v261) = v313 ^ 0xD1BF8000;
  unsigned int v315 = HIDWORD(v488) ^ *(_DWORD *)&v250[4 * (BYTE1(v240) ^ 0x8A)] ^ (v237 + 83930553 - 2 * v314);
  int v316 = BYTE1(v310) ^ 0x15;
  int v317 = v316 + 83930553 - ((2 * ((v310 >> 8) ^ 0xCD6515)) & 0x172);
  LODWORD(v237) = *(_DWORD *)&v252[4
                                 * ((BYTE4(v488) ^ v250[4 * (BYTE1(v240) ^ 0x8A)] ^ (v237 - 71 - 2 * v314) ^ BYTE1(v240)) ^ 0xA6)] ^ ((BYTE1(v308) ^ 0xEB) + 83930553 - ((2 * ((v308 >> 8) ^ 0x4B15EB)) & 0x172)) ^ *(_DWORD *)&v250[4 * (BYTE1(v308) ^ 0x86)] ^ ((v261 >> 12) + 725496940 - ((2 * (v261 >> 12)) & 0x567C68D8));
  LODWORD(v240) = *(_DWORD *)&v258[4 * (BYTE2(v315) ^ 0x81)];
  HIDWORD(v261) = v240 ^ 0x451;
  LODWORD(v261) = v240 ^ 0xD1BF8000;
  LODWORD(v240) = ((v261 >> 12) + 867425885 - ((2 * (v261 >> 12)) & 0x6767BCBA)) ^ *(_DWORD *)&v263[4 * (HIBYTE(v308) ^ 0x4B)];
  LODWORD(v240) = (v240 + 725496940 - ((2 * v240) & 0x567C68D8)) ^ *(_DWORD *)&v252[4 * (v310 ^ 0x34)];
  LODWORD(v247) = *(_DWORD *)&v252[4 * (v309 ^ 0xFC)] ^ (v247 + 725496940 - ((2 * v247) & 0x567C68D8)) ^ ((BYTE1(v315) ^ 0xA0) + 83930553 - ((2 * ((v315 >> 8) ^ 0x6881A0)) & 0x172)) ^ *(_DWORD *)&v250[4 * (BYTE1(v315) ^ 0xCD)];
  unsigned int v318 = *(_DWORD *)&v258[4 * (BYTE2(v309) ^ 0xC6)];
  LODWORD(v261) = __ROR4__((v318 >> 12) ^ 0x260C6DA, 17) ^ 0xEE910136;
  HIDWORD(v261) = v261;
  LODWORD(v240) = v488 ^ *(_DWORD *)&v250[4 * (BYTE1(v309) ^ 0x75)] ^ (v240 + 83930553 - ((2 * v240) & 0xA015B72));
  unsigned int v319 = HIDWORD(v484) ^ *(_DWORD *)&v263[4 * (HIBYTE(v310) ^ 0xCD)] ^ (v247 + 867425885 - ((2 * v247) & 0x6767BCBA));
  unsigned int v320 = v484 ^ *(_DWORD *)&v263[4 * (HIBYTE(v309) ^ 0x5A)] ^ (v237 + 867425885 - ((2 * v237) & 0x6767BCBA));
  unsigned int v321 = HIDWORD(v479) ^ v317 ^ *(_DWORD *)&v252[4 * (v308 ^ 0x53)] ^ *(_DWORD *)&v250[4 * (v316 ^ 0x6D)] ^ *(_DWORD *)&v263[4 * (HIBYTE(v315) ^ 0x68)] ^ ((v261 >> 15) + (v318 << 20));
  unsigned int v322 = ((BYTE1(v240) ^ 0x9D) + 83930553 - ((2 * ((v240 >> 8) ^ 0xC2489D)) & 0x172)) ^ *(_DWORD *)&v250[4 * (BYTE1(v240) ^ 0xF0)];
  LODWORD(v237) = *(_DWORD *)&v258[4 * (BYTE2(v319) ^ 0x8F)];
  unsigned int v323 = *(_DWORD *)&v252[4 * (v321 ^ 0xBB)] ^ (v237 << 20) ^ (v237 >> 12) ^ 0x451D1BF8 ^ (v322 + 725496940 - ((2 * v322) & 0x567C68D8));
  LODWORD(v247) = *(_DWORD *)&v258[4 * (BYTE2(v320) ^ 0xB8)];
  HIDWORD(v261) = v247 ^ 0x451;
  LODWORD(v261) = v247 ^ 0xD1BF8000;
  LODWORD(v247) = ((v261 >> 12) + 725496940 - ((2 * (v261 >> 12)) & 0x567C68D8)) ^ *(_DWORD *)&v252[4 * ((v240 ^ BYTE1(v309)) ^ 0x3F)];
  LODWORD(v237) = v323 + 867425885 - ((2 * v323) & 0x6767BCBA);
  int v324 = *(_DWORD *)&v258[4 * (BYTE2(v240) ^ 0x48)];
  HIDWORD(v261) = v324 ^ 0x451;
  LODWORD(v261) = v324 ^ 0xD1BF8000;
  int v325 = ((BYTE1(v321) ^ 0x8A) + 83930553 - ((2 * ((v321 >> 8) ^ 0x7B168A)) & 0x172)) ^ *(_DWORD *)&v252[4 * (v320 ^ 0xCC)] ^ *(_DWORD *)&v250[4 * (BYTE1(v321) ^ 0xE7)] ^ ((v261 >> 12) + 725496940 - ((2 * (v261 >> 12)) & 0x567C68D8));
  int v326 = *(_DWORD *)&v258[4 * (BYTE2(v321) ^ 0x16)];
  HIDWORD(v261) = v326 ^ 0x451;
  LODWORD(v261) = v326 ^ 0xD1BF8000;
  unsigned int v327 = v479 ^ ((BYTE1(v320) ^ 0xD7) + 83930553 - ((2 * ((v320 >> 8) ^ 0xCFB8D7)) & 0x172)) ^ *(_DWORD *)&v252[4 * (v319 ^ 0x50)] ^ *(_DWORD *)&v250[4 * (BYTE1(v320) ^ 0xBA)] ^ (v261 >> 12) ^ *(_DWORD *)&v263[4 * (BYTE3(v240) ^ 0xC2)];
  LODWORD(v240) = HIDWORD(v473) ^ *(_DWORD *)&v263[4 * (HIBYTE(v319) ^ 0xC7)] ^ (v325
                                                                               + 867425885
                                                                               - ((2 * v325) & 0x6767BCBA));
  unsigned int v328 = v473 ^ *(_DWORD *)&v263[4 * (HIBYTE(v320) ^ 0xCF)] ^ v237;
  unsigned int v329 = HIDWORD(v468) ^ ((BYTE1(v319) ^ 0xD9) + 83930553 - ((2 * ((v319 >> 8) ^ 0xC78FD9)) & 0x172)) ^ *(_DWORD *)&v250[4 * (BYTE1(v319) ^ 0xB4)] ^ *(_DWORD *)&v263[4 * (HIBYTE(v321) ^ 0x7B)] ^ (v247 + 867425885 - ((2 * v247) & 0x6767BCBA));
  int v330 = ((BYTE1(v329) ^ 0xCC) + 83930553 - ((2 * ((v329 >> 8) ^ 0x33C8CC)) & 0x172)) ^ *(_DWORD *)&v250[4 * (BYTE1(v329) ^ 0xA1)];
  int v331 = *(_DWORD *)&v258[4 * (BYTE2(v240) ^ 0xE6)];
  HIDWORD(v261) = v331 ^ 0x451;
  LODWORD(v261) = v331 ^ 0xD1BF8000;
  int v332 = v261 >> 12;
  int v333 = *(_DWORD *)&v258[4 * (BYTE2(v328) ^ 0x1C)];
  HIDWORD(v261) = v333 ^ 0x451;
  LODWORD(v261) = v333 ^ 0xD1BF8000;
  LODWORD(v247) = (v261 >> 12) ^ *(_DWORD *)&v250[4 * (BYTE1(v240) ^ 0xD9)] ^ ((BYTE1(v240) ^ 0xB4)
                                                                             + 83930553
                                                                             - ((2
                                                                               * ((v240 >> 8) ^ 0x4FE6B4)) & 0x172));
  LODWORD(v247) = (v247 + 725496940 - ((2 * v247) & 0x567C68D8)) ^ *(_DWORD *)&v252[4 * (v327 ^ 0xDB)];
  LODWORD(v237) = (v330 + 725496940 - ((2 * v330) & 0x567C68D8)) ^ *(_DWORD *)&v252[4 * (v328 ^ 0x3A)];
  int v334 = *(_DWORD *)&v252[4 * (v240 ^ 0x96)];
  int v335 = *(_DWORD *)&v252[4 * (v329 ^ 0xA2)] ^ ((BYTE1(v327) ^ 0xFE)
                                                               + 83930553
                                                               - ((2 * ((v327 >> 8) ^ 0x1BEFE)) & 0x172)) ^ *(_DWORD *)&v250[4 * (BYTE1(v327) ^ 0x93)] ^ (v332 + 725496940 - ((2 * v332) & 0x567C68D8));
  HIDWORD(v261) = v334 ^ 0xB3E346C;
  LODWORD(v261) = v334 ^ 0x20000000;
  HIDWORD(v261) = (v261 >> 29) ^ 0x6615DA09;
  LODWORD(v261) = HIDWORD(v261);
  int v336 = (v261 >> 3) + 83930553 - ((2 * (v261 >> 3)) & 0xA015B72);
  int v337 = *(_DWORD *)&v258[4 * (BYTE2(v327) ^ 0xBE)];
  HIDWORD(v261) = v337 ^ 0x451;
  LODWORD(v261) = v337 ^ 0xD1BF8000;
  int v338 = v261 >> 12;
  int v339 = *(_DWORD *)&v258[4 * (BYTE2(v329) ^ 0xC8)];
  HIDWORD(v261) = v339 ^ 0x451;
  LODWORD(v261) = v339 ^ 0xD1BF8000;
  unsigned int v340 = v468 ^ *(_DWORD *)&v263[4 * (HIBYTE(v329) ^ 0x17)] ^ (v247 + 867425885 - ((2 * v247) & 0x6767BCBA));
  LODWORD(v247) = v336 ^ *(_DWORD *)&v250[4 * (BYTE1(v328) ^ 0xD1)] ^ (v261 >> 12);
  unsigned int v341 = *(_DWORD *)&v263[4 * (HIBYTE(v327) ^ 0x25)] ^ HIDWORD(v534) ^ (v247 + 867425885 - ((2 * v247) & 0x6767BCBA));
  unsigned int v342 = HIDWORD(v463) ^ *(_DWORD *)&v263[4 * (BYTE3(v240) ^ 0x4F)] ^ v338 ^ (v237
                                                                            + 867425885
                                                                            - ((2 * v237) & 0x6767BCBA));
  LODWORD(v240) = v463 ^ *(_DWORD *)&v263[4 * (HIBYTE(v328) ^ 0x1B)] ^ (v335 + 867425885 - ((2 * v335) & 0x6767BCBA));
  LODWORD(v247) = *(_DWORD *)&v258[4 * (BYTE2(v240) ^ 0x7E)];
  HIDWORD(v261) = v247 ^ 0x451;
  LODWORD(v261) = v247 ^ 0xD1BF8000;
  int v343 = v261 >> 12;
  LODWORD(v247) = *(_DWORD *)&v258[4 * (BYTE2(v342) ^ 1)];
  HIDWORD(v261) = v247 ^ 0x451;
  LODWORD(v261) = v247 ^ 0xD1BF8000;
  LODWORD(v247) = ((v261 >> 12) + 725496940 - ((2 * (v261 >> 12)) & 0x567C68D8)) ^ *(_DWORD *)&v252[4 * (v340 ^ 0xC6)];
  LODWORD(v237) = ((BYTE1(v340) ^ 0x71) + 83930553 - 2 * (((v340 >> 8) ^ 0xF25B71) & 0xBD ^ (v340 >> 8) & 4)) ^ *(_DWORD *)&v250[4 * (BYTE1(v340) ^ 0x1C)];
  LODWORD(v237) = (v237 + 867425885 - ((2 * v237) & 0x6767BCBA)) ^ *(_DWORD *)&v263[4 * (HIBYTE(v342) ^ 0x1F)];
  int v344 = *(_DWORD *)&v258[4 * (BYTE2(v340) ^ 0x5B)];
  HIDWORD(v261) = v344 ^ 0x451;
  LODWORD(v261) = v344 ^ 0xD1BF8000;
  int v345 = v261 >> 12;
  int v346 = *(_DWORD *)&v258[4 * (BYTE2(v341) ^ 0xF4)];
  HIDWORD(v261) = v346 ^ 0x451;
  LODWORD(v261) = v346 ^ 0xD1BF8000;
  int v347 = v261 >> 12;
  HIDWORD(v261) = v343 ^ ((BYTE1(v342) ^ 0x81) + 83930553 - 2 * (((v342 >> 8) ^ 0x1F0181) & 0xBB ^ (v342 >> 8) & 2)) ^ 0xD678EAEF ^ *(_DWORD *)&v250[4 * (BYTE1(v342) ^ 0xEC)];
  LODWORD(v261) = HIDWORD(v261);
  LODWORD(v261) = (v261 >> 11) ^ __ROR4__(*(_DWORD *)&v263[4 * (HIBYTE(v340) ^ 0xF2)] ^ 0x91A985E3, 11) ^ 0xD490839A;
  HIDWORD(v261) = v261;
  unsigned int v348 = v416 ^ HIDWORD(v403) ^ *(_DWORD *)&v252[4 * (v342 ^ 0xB8)] ^ ((BYTE1(v240) ^ 0xAA)
                                                                                      + 83930553
                                                                                      - ((2
                                                                                        * ((v240 >> 8) ^ 0x967EAA)) & 0x172)) ^ *(_DWORD *)&v263[4 * (HIBYTE(v341) ^ 0x57)] ^ v345 ^ *(_DWORD *)&v250[4 * (BYTE1(v240) ^ 0xC7)];
  LOBYTE(v345) = v341 ^ BYTE1(v328);
  v341 >>= 8;
  unsigned int v349 = v458 ^ *(_DWORD *)&v263[4 * (BYTE3(v240) ^ 0x96)] ^ ((v341 ^ 0xE0)
                                                            + 83930553
                                                            - 2 * ((v341 ^ 0x73F4E0) & 0xBB ^ v341 & 2)) ^ (v247 + 867425885 - ((2 * v247) & 0x6767BCBA)) ^ *(_DWORD *)&v250[4 * (v341 ^ 0x8D)];
  unsigned int v350 = HIDWORD(v453) ^ *(_DWORD *)&v252[4 * (v240 ^ 0x88)] ^ v347 ^ (v237
                                                                                      + 725496940
                                                                                      - ((2 * v237) & 0x567C68D8));
  LODWORD(v240) = v453 ^ *(_DWORD *)&v252[4 * (v345 ^ 0xAF)] ^ ((v261 >> 21)
                                                                               + 725496940
                                                                               - ((2 * (v261 >> 21)) & 0x567C68D8));
  LODWORD(v237) = *(_DWORD *)&v258[4 * (BYTE2(v348) ^ 0x66)];
  HIDWORD(v261) = v237 ^ 0x451;
  LODWORD(v261) = v237 ^ 0xD1BF8000;
  int v351 = v261 >> 12;
  LODWORD(v237) = *(_DWORD *)&v250[4 * (BYTE1(v349) ^ 0x96)] ^ ((BYTE1(v349) ^ 0xFB)
                                                              + 83930553
                                                              - 2 * (((v349 >> 8) ^ 0x3EA2FB) & 0xBD ^ (v349 >> 8) & 4));
  LODWORD(v237) = (v237 + 725496940 - ((2 * v237) & 0x567C68D8)) ^ *(_DWORD *)&v252[4 * (v350 ^ 0x75)];
  int v352 = *(_DWORD *)&v258[4 * (BYTE2(v349) ^ 0xA2)];
  HIDWORD(v261) = v352 ^ 0x451;
  LODWORD(v261) = v352 ^ 0xD1BF8000;
  LODWORD(v247) = ((BYTE1(v350) ^ 0xF0) + 83930553 - 2 * (((v350 >> 8) ^ 0xB54AF0) & 0xBB ^ (v350 >> 8) & 2)) ^ (v261 >> 12) ^ *(_DWORD *)&v250[4 * (BYTE1(v350) ^ 0x9D)];
  LODWORD(v247) = (v247 + 867425885 - ((2 * v247) & 0x6767BCBA)) ^ *(_DWORD *)&v263[4 * (BYTE3(v240) ^ 0xED)];
  int v353 = *(_DWORD *)&v263[4 * (HIBYTE(v350) ^ 0x91)];
  int v354 = *(_DWORD *)&v263[4 * (HIBYTE(v349) ^ 0x3E)];
  int v355 = *(_DWORD *)&v263[4 * (HIBYTE(v348) ^ 0xDF)];
  int v356 = BYTE1(v240) ^ 0x1D;
  LODWORD(v263) = v356 + 83930553 - ((2 * ((v240 >> 8) ^ 0xC9AF1D)) & 0x172);
  int v357 = *(_DWORD *)&v252[4 * (v240 ^ 0x8F)];
  LODWORD(v240) = *(_DWORD *)&v258[4 * (BYTE2(v240) ^ 0xAF)];
  int v358 = *(_DWORD *)&v258[4 * (BYTE2(v350) ^ 0x4A)];
  HIDWORD(v261) = v358 ^ 0x451;
  LODWORD(v261) = v358 ^ 0xD1BF8000;
  int v359 = HIDWORD(v447) ^ *(_DWORD *)&v252[4 * (v349 ^ 0x9A)] ^ v351 ^ v353 ^ *(_DWORD *)&v250[4 * (v356 ^ 0x6D)];
  unsigned int v360 = v447 ^ ((BYTE1(v348) ^ 0x2A) + 83930553 - 2 * (((v348 >> 8) ^ 0xDF662A) & 0xBD ^ (v348 >> 8) & 4)) ^ v354 ^ *(_DWORD *)&v250[4 * (BYTE1(v348) ^ 0x47)] ^ v357 ^ (v261 >> 12);
  unsigned int v361 = HIDWORD(v441) ^ *(_DWORD *)&v252[4 * (v348 ^ 0x5E)] ^ (v247
                                                                               + 725496940
                                                                               - ((2 * v247) & 0x567C68D8));
  LODWORD(v250) = v441 ^ v355 ^ (v240 >> 12) ^ (v240 << 20) ^ (v237
                                                                                   + 867425885
                                                                                   - ((2 * v237) & 0x6767BCBA));
  uint64_t v362 = *(unsigned int *)(v60 - 128);
  uint64_t v363 = (uint64_t)*(&off_10005CE90 + (int)v362 - 916);
  v364 = (char *)*(&off_10005CE90 + (int)v362 - 1050) - 12;
  LODWORD(v237) = *(_DWORD *)(v363 + 4 * (v361 ^ 7u)) ^ *(_DWORD *)&v364[4 * (BYTE1(v250) ^ 0x38)] ^ 0x288F5819;
  unsigned int v365 = v359 ^ v263;
  LODWORD(v252) = *(_DWORD *)&v364[4
                                 * (((unsigned __int16)(v359 ^ (unsigned __int16)v263) >> 8) ^ 0x9B)];
  int v366 = *(_DWORD *)&v364[4 * ((unsigned __int16)(v361 ^ 0x6F07) >> 8)];
  LODWORD(v240) = *(_DWORD *)&v364[4 * (BYTE1(v360) ^ 0x36)];
  uint64_t v367 = (uint64_t)*(&off_10005CE90 + (int)v362 - 962);
  uint64_t v368 = *(unsigned int *)(v367 + 4 * (HIBYTE(v361) ^ 0xEF));
  int v369 = *(_DWORD *)(v367 + 4 * (HIBYTE(v360) ^ 0x23));
  LODWORD(v263) = *(_DWORD *)(v367 + 4 * ((v250 >> 24) ^ 0xD8));
  int v370 = *(_DWORD *)(v367 + 4 * (HIBYTE(v365) ^ 0x29));
  uint64_t v371 = (uint64_t)*(&off_10005CE90 + (int)v362 - 926);
  LODWORD(v367) = *(_DWORD *)(v371 + 4 * (BYTE2(v250) ^ 0xA1u));
  int v372 = *(_DWORD *)(v371 + 4 * (BYTE2(v361) ^ 0x2Au));
  int v373 = *(_DWORD *)(v371 + 4 * (BYTE2(v360) ^ 3u));
  int v374 = v369 ^ (v237 + 2073681688 - ((2 * v237) & 0xF733BE30));
  uint64_t v375 = *(unsigned int *)(v363 + 4 * (v365 ^ 0xEDu));
  LODWORD(v237) = *(_DWORD *)(v363 + 4 * (v360 ^ 0xD4u));
  unsigned int v376 = *(_DWORD *)(v371 + 4 * (BYTE2(v359) ^ 6u)) ^ (v374 - 842307138 - ((2 * v374) & 0x9B96D37C));
  int v377 = *(_DWORD *)(v363 + 4 * (v250 ^ 0x23u));
  LODWORD(v250) = *(_DWORD *)(v60 - 148) ^ HIDWORD(v532) ^ (v376 - ((2 * v376) & 0x567A058E) + 725418695);
  v378 = (char *)*(&off_10005CE90 + (int)v362 - 911) - 8;
  v232[8] = v378[(v250 >> 24) ^ 0xD7] ^ 0x8C;
  LODWORD(v367) = ((v366 ^ v367 ^ 0x89EE4809)
                 + 2073681688
                 - 2 * ((v366 ^ v367 ^ 0x89EE4809) & 0x7B99DF1C ^ (v366 ^ v367) & 4)) ^ v370;
  LODWORD(v367) = (v367 + 1823111598 - ((2 * v367) & 0xD954F35C)) ^ v237;
  LODWORD(v367) = *(_DWORD *)(v60 - 144) ^ v533 ^ (v367 - ((2 * v367) & 0x4AB262BC) + 626602334);
  v379 = (char *)*(&off_10005CE90 + (int)v362 - 1013) - 4;
  v232[*(void *)(v60 - 232)] = (v379[v367 ^ 0xC7] - 69) ^ 0x5F;
  v380 = (char *)*(&off_10005CE90 + (int)v362 - 1065) - 12;
  int v381 = v380[BYTE1(v367) ^ 0x13];
  HIDWORD(v261) = v381 ^ 0x24;
  LODWORD(v261) = (v381 ^ 0x80) << 24;
  v232[6] = (v261 >> 30) ^ 0x40;
  int v382 = ((v372 ^ v375 ^ 0xA1611010) + 2073681688 - 2 * ((v372 ^ v375 ^ 0xA1611010) & 0x7B99DF1B ^ (v372 ^ v375) & 3)) ^ v263;
  int v383 = (v382 - ((2 * v382) & 0x884A436E) + 1143284151) ^ v240;
  LODWORD(v237) = *(_DWORD *)(v60 - 140) ^ HIDWORD(v533) ^ (v383 - ((2 * v383) & 0xB9FAD066) - 587372493);
  int v384 = v380[(unsigned __int16)(*(_WORD *)(v60 - 140) ^ WORD2(v533) ^ (v383
                                                                                       - ((2 * v383) & 0xD066)
                                                                                       + 26675)) >> 8];
  HIDWORD(v261) = v384 ^ 0x24;
  LODWORD(v261) = (v384 ^ 0x80) << 24;
  v232[*(void *)(v60 - 224)] = (v261 >> 30) ^ 0x7E;
  v385 = (char *)*(&off_10005CE90 + (int)v362 - 1080) - 12;
  v232[9] = v385[BYTE2(v250) ^ 0xFBLL] ^ 0x69;
  LODWORD(v252) = ((v252 ^ 0x3FBCFEAF ^ v368)
                 - 842307138
                 - ((2 * (v252 ^ 0x3FBCFEAF ^ v368)) & 0x9B96D37C)) ^ v373;
  LODWORD(v252) = v377 ^ (v252 + 1823111598 - ((2 * v252) & 0xD954F35C));
  LODWORD(v252) = *(_DWORD *)(v60 - 136) ^ v534 ^ (v252 - ((2 * v252) & 0x5306D09C) - 1451005874);
  v232[*(void *)(v60 - 176)] = v385[BYTE2(v252) ^ 0xB8] ^ 0xBA;
  v232[*(void *)(v60 - 256)] = (v379[v250 ^ 0x1BLL] - 69) ^ 0x7D;
  v232[*(void *)(v60 - 240)] = v385[BYTE2(v367) ^ 3] ^ 0xC4;
  v232[*(void *)(v60 - 184)] = v378[BYTE3(v367) ^ 0x6DLL] ^ 0x74;
  LODWORD(v367) = v380[BYTE1(v250) ^ 0x92];
  HIDWORD(v261) = v367 ^ 0x24;
  LODWORD(v261) = (v367 ^ 0x80) << 24;
  v232[*(void *)(v60 - 168)] = (v261 >> 30) ^ 0xD2;
  uint64_t v386 = *(void *)(v60 - 216);
  v232[v386] = v378[BYTE3(v237) ^ 0x53] ^ 0x98;
  v232[*(void *)(v60 - 200)] = (v379[v237 ^ 0x95] - 69) ^ 0xAF;
  v232[*(void *)(v60 - 248)] = (v379[v252 ^ 0x64] - 69) ^ 0x27;
  v232[*(void *)(v60 - 192)] = v378[(v252 >> 24) ^ 0x6ELL] ^ 0xE;
  LODWORD(v378) = v380[BYTE1(v252) ^ 0x1FLL];
  HIDWORD(v261) = v378 ^ 0x24;
  LODWORD(v261) = (v378 ^ 0x80) << 24;
  v232[*(void *)(v60 - 208)] = (v261 >> 30) ^ 0x58;
  v232[*(void *)(v60 - 160)] = v385[BYTE2(v237) ^ 0xC8] ^ 0xEB;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, char *, _UNKNOWN **, uint64_t, char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, char *, uint64_t, char *, uint64_t, uint64_t, uint64_t, uint64_t, unint64_t, uint64_t))(a56 + 8 * ((1985 * (((v386 - 931126052 - 2 * ((v386 + 16) & 0x488024CE)) ^ 0xC88024CC) < HIDWORD(v435))) ^ ((int)v362 - 575))))(370, v362, v368, v385, &off_10005CE90, 105, v380, v375, a9, v388, v389, v391, v392, v395, v396, v397, v400, v403, v405,
           v409,
           v412,
           v416,
           v419,
           v423,
           a25,
           a26,
           a27,
           v430,
           v435,
           v441,
           v447,
           v453,
           v458,
           v463,
           v468,
           v473,
           v479,
           v484,
           v488,
           v494,
           v498,
           v504,
           v510,
           v516,
           v519,
           v524,
           v223,
           v528,
           v530,
           a50,
           v531,
           v532,
           v533,
           v534);
}

uint64_t sub_1000122A4()
{
  BOOL v4 = v0 < 0xDB61F36F;
  unint64_t v5 = (((v2 - 1062) | 0x84u) ^ 0xFFE0DB10888F3C9ELL) + v1;
  int v6 = v4 ^ (v5 < 0xDB61F36F);
  BOOL v7 = v5 < v0;
  if (!v6) {
    BOOL v4 = v7;
  }
  return (*(uint64_t (**)(void))(v3 + 8 * ((v4 * ((13 * (v2 ^ 0x43A)) ^ 0xF4)) ^ v2)))();
}

uint64_t sub_100012320@<X0>(int a1@<W1>, uint64_t a2@<X8>)
{
  *(unsigned char *)(a2 + (v5 + v4)) = *(unsigned char *)(v2 + (v5 + v4));
  return (*(uint64_t (**)(void))(v6 + 8 * (((v5 - 1 == v3 + 823) * (((a1 - 572) | 0x282) ^ 0x6E8)) ^ (a1 - 196))))();
}

void sub_100012368(uint64_t a1@<X8>)
{
  *(_DWORD *)(*(void *)(a1 - 0x4C6937770F4864B0) + 4 * (v6 + v4)) = v2
                                                                        - ((v3 + 2 * v2 + 534220427) & v5)
                                                                        - 2100083946;
  *(_DWORD *)(a1 - 0x4C6937770F4864B4) = (((v6 + 1 + v4) * (v1 - 898433860)) ^ 0x33FFCDA7)
                                         - 578879778
                                         + ((2 * (v6 + 1 + v4) * (v1 - 898433860)) & 0x67FF9B4E);
}

uint64_t sub_100012438@<X0>(int a1@<W8>)
{
  int v8 = (void *)(v6 - 0x4C6937770F4864B0);
  unsigned int v9 = ((2 * (*(_DWORD *)(*v8 + 4 * (a1 + 136063570 + ((v5 + 182) ^ 0x7CE464E2))) ^ v3)) << (v2 ^ 0x1F)) | ((*(_DWORD *)(*v8 + 4 * (a1 - 2063560685)) ^ v3) >> v2);
  *(_DWORD *)*int v8 = v9 + v3 - (v4 & (2 * v9));
  BOOL v10 = v1 - 479695548 > 1751711065;
  if (v1 - 479695548 < -395772584) {
    BOOL v10 = 1;
  }
  return (*(uint64_t (**)(uint64_t))(v7 + 8 * ((200 * !v10) ^ (v5 + 785))))(3899194712);
}

uint64_t sub_10001251C(uint64_t a1, uint64_t a2)
{
  return sub_100012550(a1, a2, (a1 - 386838938) & 0x170EB36F, (v2 - 681636099), (a1 - 386838938) & 0x170EB36F ^ 0x34Eu);
}

uint64_t sub_100012550@<X0>(unsigned int a1@<W0>, int a2@<W3>, int a3@<W4>, uint64_t a4@<X8>)
{
  uint64_t v8 = (a2 - v6);
  long long v9 = *(_OWORD *)(a4 + v8 - 15);
  long long v10 = *(_OWORD *)(a4 + v8 - 31);
  uint64_t v11 = v4 + v8;
  *(_OWORD *)(v11 - 15) = v9;
  *(_OWORD *)(v11 - 31) = v10;
  return (*(uint64_t (**)(void))(v7 + 8 * ((7 * (a3 + v6 == v5)) ^ a1)))();
}

uint64_t sub_100012590(int a1, uint64_t a2, uint64_t a3)
{
  *(void *)(a3 + v5) = *(void *)(v4 + v5);
  return (*(uint64_t (**)(void))(v7 + 8 * (((v6 == 0) * v3) ^ a1)))();
}

void sub_1000125C0(uint64_t a1@<X8>)
{
  *(_DWORD *)(a1 - 0x1FA9E8BAFD93F978) = (*(_DWORD *)(a1 - 0x1FA9E8BAFD93F978) ^ 0x1D2269FF)
                                         + 488794623
                                         - ((2 * (*(_DWORD *)(a1 - 0x1FA9E8BAFD93F978) ^ 0x1D2269FF) + 2) & 0x3A44D3FE)
                                         + 1;
}

uint64_t sub_100012608()
{
  return (*(uint64_t (**)(void))(v2 + 8 * (((v1 == v3) * (v0 + 1488)) ^ v0)))();
}

uint64_t sub_10001262C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  int v10 = v5 ^ 0x26D;
  int v11 = (v5 ^ 0x26D) + 1039;
  int v12 = (v5 ^ 0x26D) + 642;
  unsigned int v13 = v8 - 1793818603;
  if (v13 <= 0x40) {
    unsigned int v13 = 64;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v9
                                                                                         + 8
                                                                                         * (((1793818603 - v6 - v7 + v13 < (v12 ^ 0x4F8u))
                                                                                           * (v11 ^ 0x68F)) ^ v10)))(a1, a2, a3, 3790, a5, 3894820454);
}

uint64_t sub_1000126B4@<X0>(int a1@<W8>)
{
  _DWORD *v3 = v3[623];
  return (*(uint64_t (**)(void))(v2 + 8 * ((((((a1 ^ 0x142) - 338) ^ 0x678) - 776) * (v1 == 1268148513)) ^ a1 ^ 0x142)))();
}

void sub_100012704(uint64_t a1@<X8>, uint64_t a2, uint64_t a3, int a4, uint64_t a5)
{
  a3 = a1;
  a4 = v7 + 3804331 * ((&a3 - 174634352 - 2 * ((unint64_t)&a3 & 0xF5974A90)) ^ 0x7A325156) + 992;
  a5 = v6;
  (*(void (**)(uint64_t *))(v5 + 8 * (v7 ^ 0x8F9u)))(&a3);
  sub_10000D938();
}

uint64_t sub_100012768@<X0>(int a1@<W1>, int a2@<W8>, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  unint64_t v68 = STACK[0x290];
  *(_DWORD *)(v68 + 392) = a2;
  *(_DWORD *)(v68 + 396) = STACK[0x3A4];
  *(void *)(v68 + 400) = STACK[0x488];
  *(_DWORD *)(v68 + 408) = ((((v64 + 1537) | 0x61) - 770) ^ 0x4DFA31E7) - v65 + LODWORD(STACK[0x4F4]);
  *(void *)(v68 + 416) = STACK[0x288] + (v65 - 1115468202);
  int v69 = (*(uint64_t (**)(unint64_t, uint64_t))(v67 + v63 * (uint64_t)a1 + 8))(STACK[0x258], a63);
  return (*(uint64_t (**)(__n128))(v66
                                           + 8
                                           * ((43 * (v69 - 1158872075 - ((2 * v69) & 0x75DA07EA) == -1158872075)) ^ v64)))((__n128)0);
}

uint64_t sub_100012844(uint64_t a1, uint64_t a2)
{
  unsigned int v8 = (((v4 - 1870660036) | 0x25098900) ^ 0x3741D4D3) + v5;
  unsigned int v9 = *(_DWORD *)(v7 - 220 + (v8 & 0xFFFFFFFC) + 72);
  *(unsigned char *)(a2 + v8) = v9 ^ 0xF4;
  *(unsigned char *)(a2 + (v5 + v2)) = (BYTE1(v9) ^ 0xD3) + (~(2 * (BYTE1(v9) ^ 0xD3)) | 0x5B) + 83;
  *(unsigned char *)(a2 + (v5 + v2 + 1)) = (BYTE2(v9) ^ 0xE7) - ((2 * (BYTE2(v9) ^ 0xE7)) & 0xA4) + 82;
  *(unsigned char *)(a2 + (v5 + v2 + 2)) = (HIBYTE(v9) ^ 0x2C) - ((v9 >> 23) & 0xA4) + 82;
  unsigned int v10 = *(_DWORD *)(v7 - 128) + 1023941363;
  BOOL v11 = v10 < v3;
  BOOL v12 = v5 - 27650980 < v10;
  if (v5 - 27650980 < v3 != v11) {
    BOOL v12 = v11;
  }
  return (*(uint64_t (**)(void))(v6 + 8 * ((v12 | (8 * v12)) ^ v4)))();
}

uint64_t sub_10001293C()
{
  uint64_t v2 = (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8 * (v1 ^ 0xE94)))(1576, 3012117910);
  STACK[0x350] = v2;
  return (*(uint64_t (**)(void))(v0
                              + 8
                              * (int)((((((v1 - 1162) | 0x4A0) ^ 0xFFFFFF4E) + ((v1 + 1910071457) & 0x8E269EFB))
                                     * (v2 != 0)) ^ v1)))();
}

uint64_t sub_1000129B8()
{
  return (*(uint64_t (**)(void))(v2
                              + 8
                              * (int)(((((v0 + 930944859) & 0xC882EBEF) + ((v0 - 21) ^ 0x3F9)) * ((v1 & 2) == 0)) ^ v0)))();
}

uint64_t sub_1000129FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49)
{
  uint64_t v51 = (*(uint64_t (**)(uint64_t, uint64_t))(v50 + 8 * (v49 + 1115)))(1576, 2940923044);
  STACK[0x508] = v51;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v50 + 8 * (((v51 == 0) * (v49 + 743 + ((v49 + 733) | 0x20) - 1485)) ^ v49)))(v51, v52, v53, v54, v55, v56, v57, v58, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
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
           a39,
           a40,
           a41,
           a42,
           a43,
           a44,
           a45,
           a46,
           a47,
           a48,
           a49);
}

uint64_t sub_100012A6C@<X0>(int a1@<W8>)
{
  *(unsigned char *)(v4 + (v3 + v7 + 1069)) = *(unsigned char *)(v2 + (v3 + v7 + 1069));
  return (*(uint64_t (**)(void))(v1 + 8 * (((v7 - 1 != a1) * v6) | v5)))();
}

uint64_t sub_100012AAC@<X0>(int a1@<W8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,int a35,unsigned int a36,uint64_t a37,char a38)
{
  unsigned int v40 = v38[396] ^ ((*v38 & 0x7FFFFFFE | v38[623] & 0x80000000) >> 1);
  v38[623] = (((a1 + 53776792) | 0x50884118)
            + v40
            - ((((a1 + 52477806) | 0x509C1342) ^ 0xFC1B464) & (2 * v40))
            + 1518460943) ^ *((_DWORD *)&a38 + (*v38 & 1));
  return (*(uint64_t (**)(void))(v39 + 8 * ((1232 * (a36 > 0x26F)) ^ a1)))();
}

uint64_t sub_100012B54(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32)
{
  int v35 = (a4 + 1367933561) & 0x5ABA2FEF;
  (*(void (**)(uint64_t, uint64_t))(v34 + 8 * (a4 ^ (a4 + 1971))))(a32, 2965982036);
  uint64_t v36 = (*(uint64_t (**)(void))(v34 + 8 * (v32 + 1404885274)))();
  _DWORD *v33 = v36;
  v33[1] = 1812433253 * (v36 ^ (v36 >> 30)) + 1;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v34 + 8 * (v35 | (8 * (((v35 + 24) ^ 1) & 1u)))))(v36, v37, v38, v39, v40, v41, v42, v43, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
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
           a31);
}

uint64_t sub_100012C04@<X0>(uint64_t a1@<X8>)
{
  int v4 = *(_DWORD *)(v2 - 0x4C6937770F4864B4);
  int v5 = v4 - 293522565;
  if (v4 - 293522565 < 0) {
    int v5 = 293522565 - v4;
  }
  *(_DWORD *)(v1 - 0x4C6937770F4864B4) = v4;
  return (*(uint64_t (**)(void))(a1
                              + 8
                              * ((((v5 ^ ((v3 ^ 0x643) + 1778117392)) - 1079019050 + ((2 * v5) & 0xD3F7DF76) != 699099537)
                                * ((v3 - 114) ^ 0x273)) ^ v3)))();
}

uint64_t sub_100012C9C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,unsigned int a31,uint64_t a32,unsigned int a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,int a39)
{
  uint64_t v45 = ((v43 ^ 0x47C4C9C3E81A640CLL) + a4 - ((2 * (v43 ^ 0x47C4C9C3E81A640CLL)) & 0x314441BC73BDCEE4)) ^ v44;
  uint64_t v46 = __ROR8__(((v42 - 628) - 0x560ACAA2CD855434) ^ __ROR8__(v39 ^ a32, 12), 52);
  uint64_t v47 = v46 ^ 0x322397601515A6F7;
  uint64_t v48 = ((v46 ^ 0x322397601515A6F7)
       - 0x250EAFF2CB02E2E9
       - ((((v42 + 1963149380) & 0x8AFCB67E) - 0x4A1D5FE59605CA4CLL) & (2 * (v46 ^ 0x322397601515A6F7)))) ^ a3;
  uint64_t v49 = v40 ^ v43 ^ 0x47C4C9C3E81A640CLL;
  unint64_t v50 = (v46 ^ 0x322397601515A6F7) & (v45 ^ 0x97FBFBAE09CFCCD0);
  v45 ^= 0x68040451F630332FuLL;
  unint64_t v51 = (v48 ^ 0xE4C1C31231B4037DLL) & (v46 ^ 0xCDDC689FEAEA5908) ^ v45;
  unint64_t v52 = v49 ^ 0xDE0FF4A233A21529 ^ (v50 - ((2 * v50) & 0x7E72859DFDC64D88) + 0x3F3942CEFEE326C4);
  unint64_t v53 = v48 ^ 0xE4C1C31231B4037DLL ^ (v49 ^ 0xE136B66CCD4133EDLL) & (v40 ^ 0x1EC9499332BECC12);
  *((void *)&v54 + 1) = v40 ^ 0x33ED;
  *(void *)&long long v54 = v40 ^ 0xE136B66CCD410000;
  unint64_t v55 = (v48 ^ 0x1B3E3CEDCE4BFC82) & (v40 ^ 0xE136B66CCD4133EDLL) ^ v47 ^ v51;
  uint64_t v56 = v45 & (v49 ^ 0x1EC9499332BECC12);
  unint64_t v57 = __ROR8__(__ROR8__(v52, 38) ^ __ROR8__(v51, 38) ^ 0xB8AB4977971512F1, 26);
  LOBYTE(v51) = *(unsigned char *)(a35 + ((((v55 >> 61) ^ 4) + 241) ^ 0x78));
  char v58 = (~(8 * (v51 ^ 0xDD)) | 0x67) + 4 * (v51 ^ 0xDD) - 49;
  LOBYTE(v49) = (v51 ^ 0xDD) + (~(2 * (v51 ^ 0xDD)) | 0x63) - 49;
  char v59 = v51 ^ 0xE5;
  char v60 = v59 + (v49 ^ v58 ^ 0xC7) + 1;
  unint64_t v61 = v56 ^ __ROR8__((v54 >> 16) ^ 0x4D81525DA35B383ALL, 48) ^ v53;
  char v62 = (v58 ^ 0x31) + 20;
  char v63 = v62 - ((2 * (v58 ^ 0x31) + 2) & 0x20) + (v60 & 0x40);
  if ((v60 & 0x40 & ((v58 ^ 0x31) + 1)) != 0) {
    char v63 = v62 - (v60 & 0x40) - ((2 * ((v58 ^ 0x31) + 1)) & 0x20);
  }
  char v64 = v63 ^ ((v60 & 0xBF) - ((2 * v60) & 0x26) + 19);
  unsigned __int8 v65 = ((v64 - ((2 * v64) & 0x9C) - 50) ^ v58) + v59;
  *((void *)&v66 + 1) = ~v53;
  *(void *)&long long v66 = v53 ^ 0x92CFC162FD513142;
  unint64_t v67 = __ROR8__(v53, 57) & 0xFFFFFFFFFFFFE07FLL;
  *((void *)&v66 + 1) = v53 ^ 0xC73859440B58B903 ^ ((v66 >> 1)
                                                      - ((2 * (v66 >> 1)) & 0xABEF304DEC131080)
                                                      + 0x55F79826F6098840);
  *(void *)&long long v66 = *((void *)&v66 + 1) ^ (v53 << 58) ^ 0xC00000000000000;
  uint64_t v68 = v66 >> 51;
  uint64_t v69 = v55 ^ (v55 >> 39) ^ (8 * v55) ^ (((v65 >> 1) | (v65 << 7)) | (v55 << 25));
  uint64_t v70 = v69 ^ 0x17CA2DE71D8C8858;
  uint64_t v206 = v68 + (v67 ^ 0x8F8AC7F1FBA51795);
  unint64_t v71 = v52 << 23;
  unint64_t v72 = (v52 << 23) ^ 0xFBA827E079000000;
  unint64_t v73 = (((v57 << 45) ^ (v57 << 36)) & 0xFFFFFFF000000000 | (v57 >> 28)) ^ (v57 >> 19) ^ 0xD0A2B87327B31AB3;
  uint64_t v74 = v73 - ((2 * v73) & 0xFAB23557E381488) - 0x782A6E5540E3F5BCLL;
  unint64_t v75 = v52 ^ (v52 >> 41) ^ (v52 >> 7) ^ 0x579BA212CC10BA54 ^ (((v52 << 57) ^ 0xE400000000000000)
                                                               - (((v52 << 57) ^ 0xE400000000000000) >> 61 << 62)
                                                               - 0x1E3308558D5B864CLL);
  uint64_t v76 = v75 & 0x10000000000000;
  uint64_t v77 = v75 & 0x10000000000000 | 0x2B086A297B8D239BLL;
  unint64_t v78 = v75 & 0xFFEFFFFFFFFFFFFFLL;
  uint64_t v79 = __ROR8__(v206 - 2 * (v68 & (v67 ^ 0x8F8AC7F1FBA51795)), 13);
  unint64_t v80 = v61 ^ (v61 >> 10) ^ (v61 << 47) ^ ((v61 >> 17) | (v61 << 54));
  if ((v76 & v71) != 0) {
    uint64_t v81 = 0x5610D452F71A4736 - v77;
  }
  else {
    uint64_t v81 = v77;
  }
  uint64_t v82 = (v72 - 0x2B086A297B8D239BLL + v81) ^ v78;
  uint64_t v83 = (v82 - ((2 * v82) & 0x69AAF3ACEAE43D16) - 0x4B2A86298A8DE175) ^ v80;
  uint64_t v84 = __ROR8__(__ROR8__(v83 ^ 0x83BD4BE8C6187132, 23) ^ 0x6C4FE5A873E441B7, 41);
  uint64_t v85 = (v79 + 0x319307E6BED75CB5 - ((2 * v79) & 0x63260FCD7DAEB96ALL)) ^ v70;
  uint64_t v86 = v74 ^ v57 ^ v82;
  unint64_t v87 = v84 & (v80 ^ 0x1CAE3FE19723B7B4) ^ v85;
  unint64_t v88 = (v86 ^ 0x4DA99233A60E0657 | ~v84)
      + ((v84 - 0x64F7468E7CB58D94 - ((2 * v84) & 0x361172E30694E4D8)) ^ v86 ^ 0xD6A12B422544743BLL)
      + 1;
  unint64_t v89 = (((v85 ^ 0xBEE74353B47A99EDLL) & (v69 ^ 0xD9A6D5FE5CA42B12))
       - 0x64F7468E7CB58D94
       - ((2 * ((v85 ^ 0xBEE74353B47A99EDLL) & (v69 ^ 0xD9A6D5FE5CA42B12))) & 0x361172E30694E4D8)) ^ v86 ^ 0xD6A12B422544743BLL;
  unint64_t v90 = v83 ^ (v86 ^ 0xB2566DCC59F1F9A8) & (v69 ^ 0x26592A01A35BD4EDLL);
  unint64_t v91 = ((v89 ^ (v85 ^ 0x4118BCAC4B856612) & (v80 ^ 0xE351C01E68DC484BLL))
       + 0x319307E6BED75CB5
       - ((2 * (v89 ^ (v85 ^ 0x4118BCAC4B856612) & (v80 ^ 0xE351C01E68DC484BLL))) & 0x63260FCD7DAEB96ALL)) ^ v70;
  *((void *)&v93 + 1) = v89 ^ v90 ^ 0xC8B3323;
  *(void *)&long long v93 = v89 ^ v90 ^ 0xFBF8B63C10000000;
  uint64_t v92 = v93 >> 28;
  unint64_t v94 = v88 ^ __ROR8__(((v87 ^ 0xBEE74353B47A99EDLL) >> 27) ^ __ROR8__(v80 ^ 0xE1DE6585B59498FDLL, 27) ^ (((v87 ^ 0xBEE74353B47A99EDLL) << 37)- (((v87 ^ 0xBEE74353B47A99EDLL) << 38) & 0x1379170000000000)- 0x7643747485F20715), 37);
  *(void *)&long long v93 = __ROR8__(v89 ^ v90, 19);
  uint64_t v95 = (v92 ^ v93 ^ 0x66647F7F16C78391)
      - ((2 * (v92 ^ v93 ^ 0x66647F7F16C78391)) & 0x458CBC23EF0390FCLL)
      + 0x22C65E11F781C87ELL;
  unint64_t v96 = (v87 ^ 0xD1A234CC1D2559D7) << 58;
  unint64_t v97 = v96 & (v87 ^ 0xD000000000000000);
  unint64_t v98 = v96 | v87 ^ 0xD1A234CC1D2559D7;
  *((void *)&v93 + 1) = v91 ^ 0x1747C156E755AED6;
  *(void *)&long long v93 = v91 ^ 0x4000000000000000;
  uint64_t v99 = v91 ^ __ROR8__(v91, 39) ^ (v93 >> 61);
  unint64_t v100 = v99 ^ 0xFF9F5736B3E5B890;
  uint64_t v101 = v99 & 0x7C09B5691D153F3ALL;
  unint64_t v102 = (v97 ^ ((v87 ^ 0xD1A234CC1D2559D7) << 63)) + 0x5163D3DF81E99C4 - ((2 * v97) & 0x800000000000000);
  unint64_t v103 = ((v90 >> 7) ^ (v90 >> 41) | (v90 << 57)) ^ (v90 << 23) ^ 0x93D56E1BA3DE8205;
  unint64_t v104 = v103 - ((2 * v103) & 0xABC0BC498206F5ACLL) + 0x55E05E24C1037AD6;
  unint64_t v105 = v104 ^ v90;
  unint64_t v106 = v104 ^ v89 ^ v95;
  unint64_t v107 = v94 ^ (v94 << 47) ^ (v94 >> 10) ^ (v94 >> 17) ^ (v94 << 54);
  unint64_t v108 = (v105 & (unint64_t)&_mh_execute_header ^ 0x4FFB577FFF676D7BLL)
       + 2 * (v105 & (unint64_t)&_mh_execute_header);
  unint64_t v109 = v108 - 0xC034068BF000948;
  unint64_t v110 = v105 & 0xFFFFFFFEFFFFFFFFLL;
  unint64_t v111 = ((v87 ^ 0xD1A234CC1D2559D7) >> 6) ^ (v87 >> 1) ^ v98 ^ v102 ^ v99 ^ 0xFF9F5736B3E5B890;
  unint64_t v112 = v108 - 0x4FFB577FFF676D7BLL;
  unint64_t v113 = 0x93F36E973FCED1AELL - v108;
  if (((v107 ^ 0xBEE8B63400000000) & v112) == 0) {
    unint64_t v113 = v109;
  }
  unint64_t v114 = ((v107 ^ 0xBEE8B6349A795903) - 0x43F8171740676433 + v113) ^ v110;
  *((void *)&v116 + 1) = v106 ^ 0x1B627A20ELL;
  *(void *)&long long v116 = v106 ^ 0x4162333800000000;
  uint64_t v115 = v116 >> 33;
  *(void *)&long long v116 = __ROR8__((v111 ^ 0x68D11A660E92ACEBLL) & (v99 ^ 0x57695F4B404DEABLL), 33);
  uint64_t v117 = (v114 ^ 0x67A324EBA2D2A6ACLL) & (v106 ^ 0x41623339B627A20ELL);
  char v118 = v114 & 1;
  char v119 = !(v114 & 1);
  unint64_t v120 = (v106 ^ 0xBE9DCCC649D85DF1) & (v99 ^ 0xFA896A0B4BFB2154);
  *(void *)&long long v116 = __ROR8__(v115 ^ v116 ^ 0xCF4F457632C10184, 31);
  unint64_t v121 = (v114 ^ 0x985CDB145D2D5953) & (v107 ^ 0x411749CB6586A6FCLL);
  unint64_t v122 = v114 ^ (v120 - ((2 * v120) & 0xD291F24E0FAB0776) - 0x16B706D8F82A7C45);
  unint64_t v123 = v121 ^ v111 ^ 0x68D11A660E92ACEBLL;
  unint64_t v124 = (v107 ^ 0xBEE8B6349A795903) & (v111 ^ 0x972EE599F16D5314);
  unint64_t v125 = v123 ^ v107 ^ (v117 - ((2 * v117) & 0x75A3840DB422C6FELL) - 0x452E3DF925EE9C81);
  unint64_t v126 = v122 ^ v116;
  unint64_t v127 = v116 ^ v100 ^ (v124 + 0x5163D3DF81E99C4 - ((2 * v124) & 0xA2C7A7BF03D3388));
  unint64_t v128 = ((v122 ^ (unint64_t)v116) << 36) ^ ((v122 ^ (unint64_t)v116) << 45);
  unint64_t v129 = (v123 ^ 0x7955EAEC4D48B80CLL) >> v119 >> v118;
  unint64_t v130 = v127 ^ 0xF9CF6FCF536DB565 ^ (((v127 >> 39) ^ (v127 >> 61) ^ 0xAFF5F4)
                                      - 2 * (((v127 >> 39) ^ (v127 >> 61) ^ 0xAFF5F4) & 0x1B0ED3D ^ (v127 >> 39) & 8)
                                      - 0x51CA6B01CC4F12CBLL);
  uint64_t v131 = (((v127 << 25) ^ 0x62C1BAB0A0000000 ^ -(uint64_t)((v127 << 25) ^ 0x62C1BAB0A0000000) ^ (v130
                                                                                                  - (v130 ^ (v127 << 25) ^ 0x62C1BAB0A0000000)))
        + v130) ^ (8 * v127);
  unint64_t v132 = ((v122 >> 41) | (v122 << 57)) ^ (v122 >> 7) ^ (((v122 << 23) ^ 0x95857378FE000000)
                                                      - ((2 * ((v122 << 23) ^ 0x95857378FE000000)) & 0x833DEA76E7000000)
                                                      + 0x419EF53B739249BBLL);
  uint64_t v133 = (v125 >> 10) ^ (v125 << 47) ^ (v125 >> 17) ^ (v125 << 54) ^ 0x4FA3E9D2FAA91E10;
  unint64_t v134 = (v133 - ((2 * v133) & 0x969DD3FBA43ACB38) - 0x34B116022DE29A64) ^ v125;
  unint64_t v135 = v134 ^ 0xD99C31A7C24594D6;
  unint64_t v136 = v132 ^ v122 ^ v134;
  unint64_t v137 = v132 ^ v116 ^ ((v128 ^ (v126 >> 19) ^ (v126 >> 28) ^ 0xA61CAFB5F5227C04)
                      + 0x5F5F49665295DE56
                      - 2
                      * ((v128 ^ (v126 >> 19) ^ (v126 >> 28) ^ 0xA61CAFB5F5227C04) & 0x5F5F49665295DE77 ^ (v128 ^ (v126 >> 19) ^ (v126 >> 28)) & 0x21));
  unint64_t v138 = (((v123 << 58) ^ (v123 << 63)) & 0xFC00000000000000 | (v123 >> 6)) ^ v129;
  uint64_t v139 = ((v138 ^ 0x31E557ABB13522E0)
        - 2 * ((v138 ^ 0x31E557ABB13522E0) & 0x696D67F40041147ELL ^ v138 & 2)
        - 0x1692980BFFBEEB84) ^ v123;
  unint64_t v140 = v139 ^ 0x90388D184D09AC70;
  unint64_t v141 = ((v139 ^ 0x90388D184D09AC70)
        - 0xEDAD458731CF048
        - 2 * ((v139 ^ 0x90388D184D09AC70) & 0x71252BA78CE30FBCLL ^ v139 & 4)) ^ v131 ^ 0x4EF2F22C8A09CD38;
  uint64_t v142 = (v131 ^ 0x40282674F9153D7FLL) & v140;
  unint64_t v143 = (v131 ^ 0xBFD7D98B06EAC280) & (v137 ^ 0x3480CC3853ED43B7);
  unint64_t v144 = v141 ^ (v136 ^ 0x372EAB65ED0F20C6) & (v134 ^ 0x2663CE583DBA6B29);
  uint64_t v145 = (v142 - ((v142 - 0x4D7BC656FA136301 - ((2 * v142) & 0x650873520BD939FELL)) ^ v137 ^ 0x79FB0A6EA9FE20B7)) ^ ((v137 ^ 0x3480CC3853ED43B7) + 1);
  unint64_t v146 = ((v145 - 0x4D7BC656FA136301 - ((2 * v145) & 0x650873520BD939FELL)) ^ v137 ^ 0x79FB0A6EA9FE20B7) + v142;
  unint64_t v147 = ((v135 & ~v141) - 0xEDAD458731CF048 - ((2 * (v135 & ~v141)) & 0xE24A574F19C61F70)) ^ v131 ^ 0x4EF2F22C8A09CD38 ^ v146;
  unint64_t v148 = (((2 * v136) ^ 0x91A2A93425E1BE73) + (v136 ^ 0x372EAB65ED0F20C6)) & (v137 ^ 0xCB7F33C7AC12BC48);
  unint64_t v149 = (v143 - ((2 * v143) & 0xFCCEAC129FFA9B38) - 0x198A9F6B002B264) ^ v136;
  unint64_t v150 = v146 ^ v149;
  unint64_t v151 = v144 ^ v135 ^ v148;
  *((void *)&v116 + 1) = v147 ^ 0x1877DA25;
  *(void *)&long long v116 = v147 ^ 0x425764BB40000000;
  uint64_t v152 = v116 >> 30;
  *((void *)&v116 + 1) = v146 ^ v149 ^ 0x298D0;
  *(void *)&long long v116 = v146 ^ v149 ^ 0x5EBF5A8954180000;
  uint64_t v153 = (v147 << 25) ^ 0x76B0EFB44A000000;
  unint64_t v154 = v144 & 0xFDFEEACE34F5F11BLL ^ 0x3BDA1E3360BF843ALL;
  uint64_t v155 = v154 ^ (v144 & 0x2011531CB0A0EE4 | (v144 << 58));
  uint64_t v156 = (v149 >> 41) ^ 0x5CC72A;
  uint64_t v157 = (v116 >> 19) ^ ((v146 ^ v149 ^ 0xC949FD6CA2F26D5ALL) << 36) ^ ((v146 ^ v149 ^ 0xC949FD6CA2F26D5ALL) >> 28) ^ 0x6E8F58A97F6A7E5FLL;
  uint64_t v158 = v150 ^ 0x7839D973CA386A2ALL ^ (v157 - ((2 * v157) & 0x4D0D07F53C45E5F4) + 0x268683FA9E22F2FALL);
  unint64_t v159 = (v144 >> 1) & 0x80000000000 ^ 0xD23C0921229D2333;
  uint64_t v160 = __ROR8__(v152 ^ (v147 >> 61 << 34) ^ 0x84F57132E3442245, 34);
  unint64_t v161 = v155 ^ (v144 << 63);
  *((void *)&v116 + 1) = v149 ^ 0x27;
  *(void *)&long long v116 = v149 ^ 0xB98E55BF51965080;
  uint64_t v162 = v149 ^ 0x1529C608340288FALL ^ ((v116 >> 7) - ((2 * (v116 >> 7)) & 0x594F276ECB29B0BALL) - 0x53586C489A6B27A3);
  unint64_t v163 = (v160 ^ (v147 >> 39) ^ 0x84AEC9) + v153;
  uint64_t v164 = v160 & v153;
  uint64_t v165 = v162 & v156;
  uint64_t v166 = v162 + v156;
  unint64_t v167 = v163 - 2 * v164;
  unint64_t v168 = (v161 + 0x6764EF82A3DB36A3 - ((2 * v155) & 0xCEC9DF0547B66D46)) ^ (v159 | 0x8080040440100CLL) ^ 0xB5D86EA78506059CLL;
  BOOL v169 = v101 == 0x7809200909112110;
  unint64_t v170 = v168 ^ 0x189B107D5C24C95CLL;
  if (v169) {
    unint64_t v170 = (v159 | 0x8080040440100CLL) ^ 0xB5D86EA78506059CLL;
  }
  uint64_t v171 = v167 ^ (8 * v147);
  uint64_t v172 = v168 + 2 * ((v170 ^ 0x6764EF82A3DB36A3) & v155) + 0x763E36AED54FD8EALL;
  uint64_t v173 = v166 - 2 * v165;
  if ((v159 & v154 & 0x80000000000) != 0) {
    unint64_t v174 = ((v161 + ((v159 | 0x8080040440100CLL) ^ 0x2D437EDAD922CCC0) + 1) ^ 0x77FF36FEDFDFFBFFLL)
  }
         - 0x1C100500A902315
         + ((2 * (v161 + ((v159 | 0x8080040440100CLL) ^ 0x2D437EDAD922CCC0) + 1)) & 0xEFFE6DFDBFBFF7FELL);
  else {
    unint64_t v174 = v172;
  }
  unint64_t v175 = v173 ^ (v149 << 23);
  unint64_t v176 = v151 ^ (v151 >> 10) ^ (v151 >> 17) ^ (v151 << 47) ^ (v151 << 54);
  unint64_t v177 = v175 ^ v176;
  *((void *)&v178 + 1) = v174 + 0x9C1C9512AB02716;
  *(void *)&long long v178 = v174 - 0x763E36AED54FD8EALL;
  unint64_t v179 = __ROR8__(__ROR8__(v144, 62) & 0xFFFFBFFFFFFFFFFBLL ^ 0x4F1EC6363424B53DLL ^ (v178 >> 61), 3) ^ (v144 >> 6);
  *(void *)&long long v178 = __ROR8__(__ROR8__(v175, 57) ^ __ROR8__(v158, 57) ^ 0xAA9CE060A7C86764, 7);
  unint64_t v180 = v171 ^ 0xAA6A2D4BA2838D66;
  unint64_t v181 = v179 ^ v171 ^ 0xAA6A2D4BA2838D66;
  *((void *)&v178 + 1) = v178 ^ 0x16FDF2E892CF90CELL;
  unint64_t v182 = v178 ^ 0x16FDF2E892CF90CELL ^ (v181 ^ 0xC341B7A7BB59AAAALL) & (v171 ^ 0x5595D2B45D7C7299);
  unint64_t v183 = v181 ^ 0xC341B7A7BB59AAAALL ^ (v175 ^ 0xDFA8CB2853800000) & (v176 ^ 0xAEA93A9FECEAF928);
  uint64_t v184 = (v178 ^ 0x16FDF2E892CF90CELL) & (v177 ^ 0x7101F1B7BF6AF928);
  unint64_t v185 = (__ROR8__((v178 >> 38) ^ 0x2F851D43D911B5B3, 26) ^ 0xAD6F61F41EB8AF09) & v180 ^ v177;
  unint64_t v186 = v185 ^ v182;
  unint64_t v187 = v185 ^ v182 ^ 0x8EFE0E48409506D7;
  unint64_t v188 = (v181 ^ 0x3CBE485844A65555) & (v176 ^ 0x5156C560131506D7) ^ v180 ^ v182;
  unint64_t v189 = v183 ^ 0x6DC4FB0BD4FFFF44;
  unint64_t v190 = ((v184 ^ v183) - ((2 * (v184 ^ v183)) & 0xD0C6725AFFFEFDEALL) - 0x179CC6D28000810BLL) ^ v176;
  *((void *)&v178 + 1) = v186 ^ 0x3D2C8;
  *(void *)&long long v178 = v186 ^ 0x87C22D0B5BE00000;
  unint64_t v191 = __ROR8__(__ROR8__(v183 ^ 0x616B258C5FF13C26, 27) ^ 0x61D86C4195FBD0F1, 37);
  uint64_t v192 = v188 ^ (v188 >> 39) ^ (8 * v188) ^ (v188 << 25) ^ (v188 >> 61);
  uint64_t v193 = (((v178 >> 19) ^ (v187 << 36) ^ (v187 >> 28) ^ 0xB76D41F000000000)
        - 2
        * (((v178 >> 19) ^ (v187 << 36) ^ (v187 >> 28) ^ 0xB76D41F000000000) & 0x7854C6B5839E383FLL ^ ((v178 >> 19) ^ (v187 << 36) ^ (v187 >> 28)) & 0x2B)
        - 0x7AB394A7C61C7ECLL) ^ v186;
  *((void *)&v178 + 1) = v185 ^ 0xE7C7634586;
  *(void *)&long long v178 = v185 ^ 0xBC7FB80000000000 ^ (((v185 << 57) ^ 0xC00000000000000)
                                                  - ((2 * ((v185 << 57) ^ 0xC00000000000000)) & 0x3C00000000000000)
                                                  + 0x1F34005895E46458);
  uint64_t v194 = ((v192 ^ 0xABCF8FE7C463E5DLL)
        + (v189 ^ (v189 >> 1) ^ (v191 << 58))
        - 2 * ((v192 ^ 0xABCF8FE7C463E5DLL) & (v189 ^ (v189 >> 1) ^ (v191 << 58)))) ^ ((v191 >> 6) | (v191 << 63));
  uint64_t v195 = __ROR8__(__ROR8__(v185, 49) & 0xFFFFFFFFFFC07FFFLL ^ 0x6BD066F68E2CE97 ^ (v178 >> 42), 22);
  unint64_t v196 = v190 ^ (v190 >> 10) ^ (((v190 << 54) ^ (v190 << 47)) & 0xFFFF800000000000 | (v190 >> 17));
  if (v206) {
    unint64_t v197 = v195 ^ 0xDD74CA3F78583B7ELL;
  }
  else {
    unint64_t v197 = 0x228B35C087A7C481;
  }
  unint64_t v198 = v195 & 0xDD74CA3F78583B7ELL ^ __ROR8__(v185, 41) ^ v197 & v195 ^ 0xF99F7AC9F8C6DEF4;
  unint64_t v199 = v193 ^ v198;
  unint64_t v200 = v198 & (v196 ^ 0xAF5C16C4FD9CBF1BLL);
  unint64_t v201 = (v198 - 0x5B2632DE3CB51F19 - ((2 * v198) & 0x49B39A438695C1CELL)) ^ v196 ^ 0xF47A241AC129A003 ^ (v199 ^ 0x80691441B4402112) & (v192 ^ 0xABCF8FE7C463E5DLL);
  unint64_t v202 = v201 ^ v199 ^ 0x7F96EBBE4BBFDEEDLL ^ v194 & (v192 ^ 0xF543070183B9C1A2) ^ 0x6E829E585CD8000;
  if (a33 > 0xD0E0E991 != (a39 - 1029343869) < 0x2F1F166E) {
    BOOL v204 = a33 > 0xD0E0E991;
  }
  else {
    BOOL v204 = a39 - 1029343869 < a31;
  }
  unint64_t v203 = v201 ^ 0x36BF165E8D2C233ELL ^ (((v201 << 57) ^ 0xAE00000000000000)
                                      - (((v201 << 57) ^ 0xAE00000000000000) >> 60 << 61)
                                      + 0x718B276492070B69);
  return (*(uint64_t (**)(BOOL, unint64_t, unint64_t, unint64_t, uint64_t, unint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v41 + 8 * (v42 ^ (119 * !v204))))(v204, v203 & ((v201 >> 41) ^ 0x239A18), (v201 << 23) ^ (v201 >> 7) ^ (v203 | (v201 >> 41) ^ 0x239A18), v202, a5, v200, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29);
}

uint64_t sub_1000144A0@<X0>(int a1@<W8>)
{
  int v7 = STACK[0x4F4];
  unsigned int v8 = (_DWORD *)STACK[0x290];
  unint64_t v9 = STACK[0x290] + 24 * v2;
  *(_DWORD *)(v9 + 8) = v5;
  *(_DWORD *)(v9 + 12) = v4;
  *(void *)(v9 + 16) = STACK[0x288];
  *(_DWORD *)(v9 + 24) = v7;
  *unsigned int v8 = v1 + 1;
  BOOL v11 = v3 - 1591024252 > (int)((a1 + 1348056934) & 0xAFA64EFB ^ 0x414797F5) || v3 - 1591024252 < SLODWORD(STACK[0x260]);
  return (*(uint64_t (**)(void))(v6 + 8 * ((v11 * (((a1 - 53) | 0x125) + 1533)) ^ a1)))();
}

uint64_t sub_10001452C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, int a20)
{
  int v24 = v20 ^ 0x45C649C;
  int v25 = v22 + v20 + 74;
  unsigned int v26 = v21 + (((v22 + v20 - 1230) | 0x108) ^ 0xFE02F052);
  BOOL v27 = a20 + 79566585 < v26;
  if (a20 + 79566585 < (v24 ^ 0x473ACB6Eu) != v26 < 0x473AC8A3) {
    BOOL v27 = v26 < 0x473AC8A3;
  }
  return (*(uint64_t (**)(void))(v23 + 8 * ((101 * !v27) ^ v25)))();
}

uint64_t sub_10001453C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, int a18, int a19)
{
  BOOL v22 = v19 - 1799284488 < (a19 - 1218996010);
  if ((a19 - 1218996010) < 0x8F7000 != (v19 - 1799284488) < 0x8F7000) {
    BOOL v22 = (a19 - 1218996010) < 0x8F7000;
  }
  return (*(uint64_t (**)(void))(v21 + 8 * ((v22 * ((3 * (v20 ^ 0x262)) ^ 0x141)) ^ v20)))();
}

uint64_t sub_1000145B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,int a45)
{
  return (*(uint64_t (**)(void))(v47
                              + 8
                              * ((((LODWORD(STACK[0x504]) ^ v45) != ((v46 - 111) ^ 0x95E91B30) + a45) * (v46 - 1661)) ^ v46)))();
}

void sub_1000145F8()
{
  _DWORD *v1 = v0;
}

uint64_t sub_10001461C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  return (*(uint64_t (**)(void))(v73 + 8 * (v72 | a72 | (a72 << 9))))();
}

void sub_100014630()
{
}

uint64_t sub_100014638(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,void *a37,int *a38,uint64_t a39)
{
  uint64_t v42 = 4 * (v40 - 918202767);
  unsigned int v43 = -953638755 * ((*(_DWORD *)(*a37 + (*a38 & 0xFFFFFFFF8D5CD910)) ^ (a39 + v42)) & 0x7FFFFFFF);
  int v44 = v43 ^ HIWORD(v43);
  *(_DWORD *)(v41 + v42) ^= *(_DWORD *)(a39 + v42) ^ *((_DWORD *)*(&off_10005CE90 + (v39 ^ 0x615u))
                                                     + ((-953638755 * v44) >> 24)) ^ *((_DWORD *)*(&off_10005CE90 + v39 - 1603) + ((-953638755 * v44) >> 24) + 2) ^ *((_DWORD *)*(&off_10005CE90 + (v39 ^ 0x60Au)) + ((-953638755 * v44) >> 24)) ^ (v44 * ((v39 - 474) ^ 0xA09D048F)) ^ (-953638755 * v44) ^ (-512782329 * ((-953638755 * v44) >> 24));
  return sub_100026268(v39 - 474);
}

uint64_t sub_100014720(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, void))(v4
                                                                               + 8
                                                                               * ((((((2 * (v6 ^ 0x34F)) ^ 0x46E) & v5) == 0)
                                                                                 * (((v6 ^ 0x34F) + 980) ^ 0x165)) ^ v6)))(a1, a2, a3, a4, (a3 - a4));
}

uint64_t sub_100014760(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unsigned int v14 = a4 + v10 - 352 + v12 + 2134660974;
  unsigned int v15 = *(_DWORD *)((char *)&STACK[0x2AC] + (v14 & 0xFFFFFFFC) + 72);
  *(unsigned char *)(a8 + v14) = v15 ^ 0xF4;
  *(unsigned char *)(a8 + (v12 + v8)) = (BYTE1(v15) ^ 0xD3) + (~(2 * (BYTE1(v15) ^ 0xD3)) | 0x5B) + 83;
  *(unsigned char *)(a8 + (v12 + v8 + 1)) = (BYTE2(v15) ^ 0xE7) - ((2 * (BYTE2(v15) ^ 0xE7)) & 0xA4) + 82;
  *(unsigned char *)(a8 + (v12 + v8 + 2)) = (HIBYTE(v15) ^ 0x2C) - ((v15 >> 23) & 0xA4) + 82;
  unsigned int v16 = LODWORD(STACK[0x308]) + 1826264843;
  BOOL v17 = v16 < v9;
  BOOL v18 = v12 - 1562581048 < v16;
  if (v12 - 1562581048 < v9 != v17) {
    BOOL v18 = v17;
  }
  return (*(uint64_t (**)(void))(v13 + 8 * ((!v18 * v11) ^ v10)))();
}

uint64_t sub_10001484C@<X0>(int a1@<W1>, uint64_t a2@<X8>)
{
  return (*(uint64_t (**)(void))(v2 + 8 * ((981 * (a2 + 1 == v3 + 64)) ^ a1)))();
}

uint64_t sub_100014920(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39)
{
  if (v40 == 1678813233 || v40 == 1678813236)
  {
    int v43 = LODWORD(STACK[0x2AC]) - 1074;
    LOBYTE(STACK[0x184F]) = LOBYTE(STACK[0x182F]) - ((LODWORD(STACK[0x2AC]) - 77) & (2 * LOBYTE(STACK[0x182F]))) + 82;
    LOBYTE(STACK[0x184E]) = LOBYTE(STACK[0x182E]) - ((2 * LOBYTE(STACK[0x182E])) & 0xA4) + 82;
    LOBYTE(STACK[0x184D]) = LOBYTE(STACK[0x182D]) - ((2 * LOBYTE(STACK[0x182D])) & 0xA4) + 82;
    LOBYTE(STACK[0x184C]) = LOBYTE(STACK[0x182C]) - ((2 * LOBYTE(STACK[0x182C])) & 0xA4) + 82;
    LOBYTE(STACK[0x184B]) = LOBYTE(STACK[0x182B]) - ((2 * LOBYTE(STACK[0x182B])) & 0xA4) + 82;
    LOBYTE(STACK[0x184A]) = LOBYTE(STACK[0x182A]) - ((2 * LOBYTE(STACK[0x182A])) & 0xA4) + 82;
    LOBYTE(STACK[0x1849]) = LOBYTE(STACK[0x1829]) - ((2 * LOBYTE(STACK[0x1829])) & 0xA4) + 82;
    LOBYTE(STACK[0x1848]) = LOBYTE(STACK[0x1828]) - ((2 * LOBYTE(STACK[0x1828])) & 0xA4) + 82;
    LOBYTE(STACK[0x1847]) = LOBYTE(STACK[0x1827]) - ((2 * LOBYTE(STACK[0x1827])) & 0xA4) + 82;
    LOBYTE(STACK[0x1846]) = LOBYTE(STACK[0x1826]) - ((2 * LOBYTE(STACK[0x1826])) & 0xA4) + 82;
    LOBYTE(STACK[0x1845]) = LOBYTE(STACK[0x1825]) - ((2 * LOBYTE(STACK[0x1825])) & 0xA4) + 82;
    LOBYTE(STACK[0x1844]) = LOBYTE(STACK[0x1824]) - ((2 * LOBYTE(STACK[0x1824])) & 0xA4) + 82;
    LOBYTE(STACK[0x1843]) = LOBYTE(STACK[0x1823]) - ((2 * LOBYTE(STACK[0x1823])) & 0xA4) + 82;
    LOBYTE(STACK[0x1842]) = LOBYTE(STACK[0x1822]) - ((2 * LOBYTE(STACK[0x1822])) & 0xA4) + 82;
    LOBYTE(STACK[0x1841]) = LOBYTE(STACK[0x1821]) - ((2 * LOBYTE(STACK[0x1821])) & 0xA4) + 82;
    int v40 = STACK[0x2B8];
    char v44 = LOBYTE(STACK[0x1820]) - ((2 * LOBYTE(STACK[0x1820])) & 0xA4) + 82;
  }
  else
  {
    int v43 = (LODWORD(STACK[0x2AC]) - 451404530) & 0x1AE7DEBF;
    LOBYTE(STACK[0x184F]) = STACK[0x59F];
    LODWORD(STACK[0x184B]) = STACK[0x59B];
    STACK[0x1843] = STACK[0x593];
    LOWORD(STACK[0x1841]) = STACK[0x591];
    char v44 = STACK[0x590];
  }
  LOBYTE(STACK[0x1840]) = v44;
  unint64_t v45 = STACK[0x2B0];
  int v46 = 1374699841 * ((2 * ((v42 - 200) & 0x23661F28) - (v42 - 200) - 593895214) ^ 0xB16DF8DB);
  unsigned int v47 = v46
      + LODWORD(STACK[0x414])
      - 135033746
      - (((((v43 + 1553222838) & 0xA36BB7EA) - 1189) ^ 0xEFE71A67) & (2 * LODWORD(STACK[0x414])));
  *(_DWORD *)(v42 - 200) = v43 - v46 - 465;
  *(_DWORD *)(v42 - 196) = v47;
  *(_DWORD *)(v42 - 144) = v46 + v40 - 673828488 + 1726;
  *(void *)(v42 - 160) = a27;
  *(void *)(v42 - 152) = v39;
  *(void *)(v42 - 136) = a39;
  LOBYTE(STACK[0x18C0]) = -117 - 65 * ((2 * ((v42 + 56) & 0x28) - (v42 + 56) - 46) ^ 0xDB);
  *(void *)(v42 - 168) = &STACK[0x1840];
  *(void *)(v42 - 184) = v45;
  uint64_t v48 = (*(uint64_t (**)(uint64_t))(v41 + 8 * (v43 ^ 0xA97)))(v42 - 200);
  int v49 = *(_DWORD *)(v42 - 192);
  LODWORD(STACK[0x464]) = v49;
  return (*(uint64_t (**)(uint64_t))(v41 + 8 * ((99 * (v49 != -1158872075)) ^ v43)))(v48);
}

uint64_t sub_100014C0C()
{
  return sub_100014C24();
}

uint64_t sub_100014C24(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,int a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,int a45,int a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,int a55,int a56,int a57,uint64_t a58,int a59,uint64_t a60,unint64_t a61,uint64_t a62,unint64_t a63)
{
  unint64_t v75 = STACK[0x268];
  a69 = STACK[0x268] + 49;
  a67 = v74 + 49;
  a62 = v74 + 29;
  a63 = v75 + 29;
  a61 = v75 + 9;
  a60 = v74 + 9;
  STACK[0x280] = (unint64_t)&a9 - 0x14D7FC5203D9079;
  STACK[0x250] = ((unint64_t)&STACK[0x3D0] ^ 0x57B8B8EE7F7977D9)
               - 0x153808C208483FD9
               + ((2 * (void)&STACK[0x3D0]) & 0xAF7171DCFEF2EFB0);
  LODWORD(STACK[0x260]) = v73 - 731;
  LODWORD(STACK[0x258]) = (v73 - 731) ^ 0x414;
  LODWORD(STACK[0x228]) = v73 + 1825586412;
  a38 = (v73 - 42188541) & 0x283BDEF;
  a59 = a38 ^ 0x516;
  a71 = v73 ^ 0x718;
  a57 = v73 - 566920067;
  a56 = v73 + 1523040350;
  a46 = v73 ^ 0x6D2;
  LODWORD(STACK[0x278]) = v73 + 1336809541;
  int v76 = (v73 - 1330090582) & 0x4F478FE7;
  LODWORD(STACK[0x220]) = v76;
  LODWORD(STACK[0x270]) = v76 ^ 0x46F;
  *(int32x4_t *)&STACK[0x200] = vdupq_n_s32(0xBAED03F5);
  *(int32x4_t *)&STACK[0x210] = vdupq_n_s32(0x75DA07EAu);
  a73 = v73 + 1936342787;
  LODWORD(STACK[0x2A0]) = 671089843;
  return sub_10001BE48();
}

uint64_t sub_100014DE8@<X0>(int a1@<W8>)
{
  LODWORD(STACK[0x2CC]) = v2;
  return (*(uint64_t (**)(void))(v3 + 8 * ((37 * (a1 + 1 >= (v1 - 773))) ^ v1)))();
}

uint64_t sub_100014E28()
{
  return (*(uint64_t (**)(void))(v1
                              + 8
                              * ((51
                                * ((((v0 - 414) ^ 0x372) & *(_DWORD *)(v2 - 0x3D8A64FC118460EELL)) == ((v0 + 559369924) & 0xDEA8ADAA) - 384)) ^ v0)))();
}

uint64_t sub_100014E88()
{
  return (*(uint64_t (**)(void))(v1
                              + 8
                              * (((*(void *)(v0 - 0x3D8A64FC11846102) == 0)
                                * (((((v2 ^ 0x6B) - 31) ^ 0x3D1) + 1156) ^ (((v2 ^ 0x6B) - 31) | 0x4A0))) ^ v2 ^ 0x6B)))();
}

uint64_t sub_100014EF0@<X0>(int a1@<W8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17)
{
  int v21 = (a1 + 190) | 0x440;
  *(void *)(v20 - 128) = v18;
  *(void *)(v20 - 120) = a4;
  *(_DWORD *)(v20 - 104) = a1
                         + ((((v20 - 144) | 0xD9021A8B) - (v20 - 144) + ((v20 - 144) & 0x26FDE570)) ^ 0x4DAF53D2) * v17
                         - 40;
  *(void *)(v20 - 144) = a16;
  *(void *)(v20 - 136) = v18;
  *(void *)(v20 - 112) = a17;
  uint64_t v22 = (*(uint64_t (**)(uint64_t))(v19 + 8 * (a1 ^ 0x8DD)))(v20 - 144);
  return (*(uint64_t (**)(uint64_t))(v19
                                            + 8
                                            * ((7 * (a12 + v21 - 616 + ((2 * v21) ^ 0xE3FA578B) > 0x7FFFFFFE)) ^ (v21 + 81))))(v22);
}

uint64_t sub_100014FC0(uint64_t a1, int a2)
{
  uint64_t v5 = *(void *)(v9 + 32);
  uint64_t v6 = *(void *)(v9 + 40);
  memset(v10, 82, sizeof(v10));
  int v7 = (((v4 - 160) & 0xA46671A9 | ~((v4 - 160) | 0xA46671A9)) ^ 0xCF34C70F) * a2;
  *(void *)(v4 - 160) = v5;
  *(void *)(v4 - 120) = v10;
  *(_DWORD *)(v4 - 124) = (v2 + 1948) ^ v7;
  *(void *)(v4 - 144) = v4 - 180;
  *(void *)(v4 - 136) = v6;
  *(_DWORD *)(v4 - 152) = v7 + 1566298333;
  uint64_t result = (*(uint64_t (**)(uint64_t))(v3 + 8 * (v2 + 2050)))(v4 - 160);
  *(_DWORD *)(v9 + 16) = *(_DWORD *)(v4 - 128);
  return result;
}

uint64_t sub_1000150A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44)
{
  int v44 = BYTE4(a36) ^ 0xCF;
  if (v44 == 1)
  {
    char v45 = a5 + a4 + 17;
    BYTE4(a31) = (v45 ^ 0xD3) + 8 * a33 - ((16 * a33) & 0xAA);
    BYTE5(a31) = ((a33 >> 5) ^ 0xEF) - ((2 * ((a33 >> 5) ^ 0xEF)) & 0xA4) + 82;
    BYTE6(a31) = ((a33 >> 13) ^ 0x45) - ((2 * ((a33 >> 13) ^ 0x45)) & 0xA4) + 82;
    HIBYTE(a31) = ((a33 >> 21) ^ 0xD) - ((a33 >> 20) & 0xA4) + 82;
    HIDWORD(v49) = ~HIDWORD(a32);
    LODWORD(v49) = a33 ^ 0x20000000;
    LOBYTE(a32) = (v49 >> 29) - ((2 * (v49 >> 29)) & 0xA4) + 82;
    BYTE1(a32) = ((HIDWORD(a32) >> 5) ^ 0x4F) - ((2 * ((HIDWORD(a32) >> 5) ^ 0x4F)) & 0xA4) + 82;
    BYTE2(a32) = ((HIDWORD(a32) >> 13) ^ 0x13) - ((2 * ((HIDWORD(a32) >> 13) ^ 0x13)) & 0xA4) + 82;
    unsigned int v47 = (HIDWORD(a32) >> 21) ^ 0xFFFFFFE9;
    char v48 = (2 * v47) & 0xA4;
    goto LABEL_5;
  }
  if (v44 == 2)
  {
    char v45 = a4 ^ (a4 - 127);
    HIDWORD(v46) = ~HIDWORD(a32);
    LODWORD(v46) = a33 ^ 0x20000000;
    BYTE4(a31) = ((HIDWORD(a32) >> 21) ^ 0xE9)
               - 2 * (((HIDWORD(a32) >> 21) ^ 0xE9) & (v45 ^ 0x57) ^ (HIDWORD(a32) >> 21) & 4)
               + 82;
    BYTE5(a31) = ((HIDWORD(a32) >> 13) ^ 0x13) - ((2 * ((HIDWORD(a32) >> 13) ^ 0x13)) & 0xA4) + 82;
    BYTE6(a31) = ((HIDWORD(a32) >> 5) ^ 0x4F) + (~(2 * ((HIDWORD(a32) >> 5) ^ 0x4F)) | 0x5B) + 83;
    HIBYTE(a31) = (v46 >> 29) - ((2 * (v46 >> 29)) & 0xA4) + 82;
    LOBYTE(a32) = ((a33 >> 21) ^ 0xD) - ((a33 >> 20) & 0xA4) + 82;
    BYTE1(a32) = ((a33 >> 13) ^ 0x45) - ((2 * ((a33 >> 13) ^ 0x45)) & 0xA4) + 82;
    BYTE2(a32) = ((a33 >> 5) ^ 0xEF) - ((2 * ((a33 >> 5) ^ 0xEF)) & 0xA4) + 82;
    LOBYTE(v47) = 8 * a33;
    char v48 = (16 * a33) & 0xA0;
LABEL_5:
    BYTE3(a32) = v47 + a4 + v45 + 127 - v48 + 104;
  }
  return sub_1000344F4(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
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
           a39,
           a40,
           a41,
           a42,
           a43,
           a44);
}

uint64_t sub_10001529C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  *(void *)(v17 - 120) = v16;
  *(_DWORD *)(v17 - 128) = v15 + ((((v17 - 136) | 0x59E99CB8) - ((v17 - 136) & 0x59E99CB8)) ^ 0xD64C877E) * v14 + 604;
  *(void *)(v17 - 136) = a12;
  (*(void (**)(uint64_t))(v13 + 8 * (v15 ^ 0xA7D)))(v17 - 136);
  int v18 = 535753261 * (((v17 - 136) & 0x153AF112 | ~((v17 - 136) | 0x153AF112)) ^ 0xE03100C2);
  *(void *)(v17 - 136) = v12;
  *(_DWORD *)(v17 - 128) = v18 + 1194343371;
  *(_DWORD *)(v17 - 124) = (v15 + 915) ^ v18;
  (*(void (**)(uint64_t))(v13 + 8 * (v15 ^ 0xA57)))(v17 - 136);
  *(void *)(v17 - 136) = a12;
  *(_DWORD *)(v17 - 128) = v15
                         + ((((v17 - 136) ^ 0x6A781FD2) & 0x2F4F9D48 | ~((v17 - 136) ^ 0x6A781FD2 | 0x2F4F9D48)) ^ 0x356D66A3)
                         * v14
                         + 1086;
  *(void *)(v17 - 120) = v12;
  uint64_t v19 = (*(uint64_t (**)(uint64_t))(v13 + 8 * (v15 ^ 0xA0E)))(v17 - 136);
  return (*(uint64_t (**)(uint64_t))(v13
                                            + 8
                                            * (((*(_DWORD *)(v17 - 124) > (v15 + 1996101203))
                                              * (v15 ^ 0x24B)) | (v15 - 127))))(v19);
}

uint64_t sub_1000152B0@<X0>(unint64_t a1@<X2>, uint64_t a2@<X8>)
{
  return (*(uint64_t (**)(void))(v3 + 8 * ((1332 * (a2 + 1 == ((v2 - 829) ^ (v2 + v4) & v5 ^ a1))) ^ v2)))();
}

uint64_t sub_1000152E8()
{
  STACK[0x370] = v0;
  return sub_1000324A8();
}

uint64_t sub_1000152FC()
{
  return (*(uint64_t (**)(void))(v1 + 8 * (((v0 > 0x49BEE2A0) | (2 * (v0 > 0x49BEE2A0))) ^ (v2 + 1404884051))))();
}

uint64_t sub_10001534C@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20,uint64_t a21,char a22,uint64_t a23,char a24,uint64_t a25,char a26,uint64_t a27,char a28,uint64_t a29,char a30,uint64_t a31,char a32,uint64_t a33,char a34)
{
  uint64_t v39 = &a34 + v34;
  unint64_t v55 = &a20 + v34;
  long long v54 = &a30 + v34;
  unint64_t v53 = &a32 + v34;
  unint64_t v52 = &a28 + v34;
  unint64_t v57 = &a24 + v34;
  unint64_t v51 = &a26 + v34;
  uint64_t v56 = &a22 + v34;
  uint64_t v41 = a1[1];
  uint64_t v60 = *a1;
  uint64_t v40 = *a1;
  uint64_t v61 = v36;
  uint64_t v42 = *(void *)(a1[4] - 0x6E06359E347AB915);
  uint64_t v43 = a1[4];
  *(void *)(v38 - 120) = a2;
  *(void *)(v38 - 112) = v43;
  uint64_t v44 = v43;
  *(void *)(v38 - 136) = v42;
  *(void *)(v38 - 128) = &a34 + v34;
  int v45 = v35 - 1399;
  *(void *)(v38 - 144) = v40;
  *(_DWORD *)(v38 - 104) = v35
                         - 1399
                         + 235795823
                         * ((((v38 - 144) | 0xF803260D) - (v38 - 144) + ((v38 - 144) & 0x7FCD9F0)) ^ 0x6CAE6F54);
  int v46 = (v35 - 1770275446) & 0x69843FBC;
  uint64_t v59 = 8 * (v35 + 510);
  int v47 = v35;
  (*(void (**)(uint64_t))(v37 + v59))(v38 - 144);
  *(_DWORD *)(v38 - 112) = v47
                         + 1225351577
                         * ((((v38 - 144) | 0x8FDD7D74) - (v38 - 144) + ((v38 - 144) & 0x70228288)) ^ 0xF122E746)
                         - 996;
  *(void *)(v38 - 128) = v44;
  *(void *)(v38 - 120) = v40;
  *(void *)(v38 - 144) = v56;
  *(void *)(v38 - 136) = v39;
  (*(void (**)(uint64_t))(v37 + 8 * (v47 + 483)))(v38 - 144);
  *(_DWORD *)(v38 - 104) = v45 + 235795823 * ((v38 - 144) ^ 0x94AD4959);
  *(void *)(v38 - 144) = v40;
  *(void *)(v38 - 136) = v39;
  *(void *)(v38 - 120) = v56;
  *(void *)(v38 - 112) = v44;
  *(void *)(v38 - 128) = v55;
  (*(void (**)(uint64_t))(v37 + v59))(v38 - 144);
  *(void *)(v38 - 120) = v56;
  *(void *)(v38 - 112) = v44;
  *(void *)(v38 - 144) = v40;
  *(void *)(v38 - 136) = v55;
  *(_DWORD *)(v38 - 104) = v45 + 235795823 * ((((v38 - 144) | 0x79517D9D) - ((v38 - 144) & 0x79517D9D)) ^ 0xEDFC34C4);
  *(void *)(v38 - 128) = v54;
  (*(void (**)(uint64_t))(v37 + v59))(v38 - 144);
  *(void *)(v38 - 144) = v40;
  *(void *)(v38 - 136) = v54;
  *(void *)(v38 - 128) = v53;
  *(void *)(v38 - 120) = v56;
  *(_DWORD *)(v38 - 104) = v45 + 235795823 * ((2 * ((v38 - 144) & 0xC899318) - (v38 - 144) + 1937140964) ^ 0xE7DB25BD);
  *(void *)(v38 - 112) = v44;
  uint64_t v58 = 8 * (v47 ^ 0xE0E);
  (*(void (**)(uint64_t))(v37 + v58))(v38 - 144);
  *(void *)(v38 - 120) = v56;
  *(void *)(v38 - 112) = v44;
  *(void *)(v38 - 136) = v53;
  *(void *)(v38 - 128) = v52;
  *(_DWORD *)(v38 - 104) = v45 + 235795823 * ((((v38 - 144) | 0xA0E296BA) - ((v38 - 144) & 0xA0E296BA)) ^ 0x344FDFE3);
  *(void *)(v38 - 144) = v60;
  (*(void (**)(uint64_t))(v37 + v59))(v38 - 144);
  *(void *)(v38 - 120) = v56;
  *(void *)(v38 - 112) = v44;
  *(void *)(v38 - 136) = v52;
  *(void *)(v38 - 128) = v57;
  *(_DWORD *)(v38 - 104) = v45 + 235795823 * ((v38 + 1189551663 - 2 * ((v38 - 144) & 0x46E71EBF)) ^ 0xD24A57E6);
  *(void *)(v38 - 144) = v60;
  (*(void (**)(uint64_t))(v37 + v58))(v38 - 144);
  *(void *)(v38 - 120) = v56;
  *(void *)(v38 - 112) = v44;
  *(void *)(v38 - 136) = v57;
  *(void *)(v38 - 128) = v51;
  *(void *)(v38 - 144) = v60;
  *(_DWORD *)(v38 - 104) = v45 + 235795823 * ((2 * ((v38 - 144) & 0x426167F0) - (v38 - 144) + 1033803791) ^ 0xA933D156);
  (*(void (**)(uint64_t))(v37 + v58))(v38 - 144);
  *(_DWORD *)(v38 - 104) = v45 + 235795823 * ((v38 - 1033018493 - 2 * ((v38 - 144) & 0xC26D6413)) ^ 0x56C02D4A);
  *(void *)(v38 - 144) = v60;
  *(void *)(v38 - 136) = v51;
  *(void *)(v38 - 120) = v56;
  *(void *)(v38 - 112) = v44;
  *(void *)(v38 - 128) = v56;
  (*(void (**)(uint64_t))(v37 + v59))(v38 - 144);
  uint64_t v48 = *(void *)(v44 - 0x6E06359E347AB91DLL);
  *(void *)(v38 - 128) = v61;
  *(void *)(v38 - 144) = v48;
  *(_DWORD *)(v38 - 136) = v47
                         + 3804331
                         * ((((v38 - 144) | 0xE23F7099) - (v38 - 144) + ((v38 - 144) & 0x1DC08F60)) ^ 0x6D9A6B5F)
                         - 398;
  (*(void (**)(uint64_t))(v37 + 8 * (v47 ^ 0xE0B)))(v38 - 144);
  *(_DWORD *)(v38 - 140) = v47 - 1755732067 * ((v38 + 780493445 - 2 * ((v38 - 144) & 0x2E856315)) ^ 0xF043DECE) - 690;
  *(void *)(v38 - 136) = v41;
  uint64_t v49 = (*(uint64_t (**)(uint64_t))(v37 + 8 * (v47 ^ 0xE23)))(v38 - 144);
  return (*(uint64_t (**)(uint64_t))(v37
                                            + 8
                                            * ((7 * (*(_DWORD *)(v38 - 144) - 470130725 >= (v46 ^ 0x7FFFFC7Fu))) ^ v47)))(v49);
}

void sub_1000158BC(_DWORD *a1)
{
  unsigned int v1 = *a1 ^ (1374699841 * ((-2 - ((a1 | 0xA88133EE) + (~a1 | 0x577ECC11))) ^ 0x3A8AD418));
  __asm { BRAA            X9, X17 }
}

void sub_100015978(uint64_t a1)
{
  int v1 = *(_DWORD *)a1 - 628203409 * ((a1 & 0x7EE22050 | ~(a1 | 0x7EE22050)) ^ 0x395D39C);
  uint64_t v2 = *(void *)(a1 + 8);
  uint64_t v3 = (uint64_t)*(&off_10005CE90 + v1 - 491);
  (*(void (**)(char *, uint64_t (*)()))(v3 + 8 * (v1 ^ 0xA2E)))((char *)*(&off_10005CE90 + v1 - 482) - 4, sub_10002D038);
  __asm { BRAA            X9, X17 }
}

uint64_t sub_100015A34(int a1, uint64_t a2, int a3)
{
  return (*(uint64_t (**)(void))(v4
                              + 8
                              * ((23 * (a3 + a1 + ((v3 + 1566) ^ 0x60C3691 ^ (v3 + 1673373234) & 0x9C425D7F) < 8)) ^ v3)))();
}

uint64_t sub_100015AB4(uint64_t a1, uint64_t a2, int a3)
{
  return (*(uint64_t (**)(void))(v3
                              + 8
                              * (int)(((a3 + (a3 ^ 0xFFFFFE59) + 733) * (*(_DWORD *)(v4 - 136) == *(_DWORD *)(v4 - 140))) ^ a3)))();
}

uint64_t sub_100015AF0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v7
                                                                                + 8
                                                                                * ((49
                                                                                  * (((v6 + 48) ^ (v5 + v4 + ((v6 - 2064156538) & 0x7B0886FF ^ 0x10040C16u) < 8)) & 1)) ^ (v6 - 154))))(a1, a2, a3, a4, 3613331197);
}

uint64_t sub_100015B68(int a1)
{
  return (*(uint64_t (**)(void))(v3 + 8 * ((((((a1 + 132) | 0x1C1) - 253) ^ (a1 - 914)) * (v1 == v2)) ^ a1)))();
}

void sub_100015BB0()
{
}

void sub_100015BBC(uint64_t a1)
{
  int v2 = 1224239923 * (((a1 ^ 0x7838128A) & 0xFC78B2CE | (a1 ^ 0x820410) & 0x3874D31) ^ 0x8A09EB4D);
  int v3 = *(_DWORD *)(a1 + 8) ^ v2;
  v6[1] = (235795823
         * (((v6 | 0xFA820D6C) - v6 + (v6 & 0x57DF290)) ^ 0x6E2F4435)) ^ (v3 - 231789191);
  uint64_t v4 = (uint64_t)*(&off_10005CE90 + v3 - 261);
  (*(void (**)(_DWORD *))(v4 + 8 * (v3 + 1692)))(v6);
  BOOL v5 = *(_DWORD *)*(&off_10005CE90 + (v3 ^ 0x1D8)) - (*(_DWORD *)(a1 + 24) ^ v2) != (v3 ^ 0x24F) + 1962976448;
  __asm { BRAA            X15, X17 }
}

uint64_t sub_100015D5C(uint64_t a1, uint64_t a2, unsigned int a3, int a4, int a5)
{
  return (*(uint64_t (**)(void))(v5
                              + 8
                              * ((300
                                * ((v7 & (2 * (*(unsigned __int8 *)(a2 + 5) - 242)))
                                 + ((*(unsigned __int8 *)(a2 + 5) - 242) ^ ((a3 ^ a5) + a4)) == v6)) ^ a3)))();
}

uint64_t sub_100015DD8@<X0>(int a1@<W0>, uint64_t a2@<X8>, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v17 = 4 * (v16 + v10);
  int v18 = v5 + v12 + (*(_DWORD *)(*(void *)(a5 - 0x4C6937770F4864B0) + v17) ^ v13);
  *(_DWORD *)(*(void *)(a2 - 0x4C6937770F4864B0) + v17) = v18
                                                            + ((a1 - 203) ^ 0x6C8 ^ (v13 + 1339))
                                                            - (v11 & (2 * v18));
  BOOL v19 = v14 > v9;
  int v20 = v16 + 1 + v7;
  int v21 = v19 ^ (v20 < v6);
  BOOL v22 = v20 < v8;
  if (!v21) {
    BOOL v19 = v22;
  }
  return (*(uint64_t (**)(void))(v15 + 8 * ((563 * v19) ^ (a1 - 203))))();
}

uint64_t sub_100015EB8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,int a27)
{
  HIDWORD(a23) = v27;
  return sub_10001D8AC(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           __SPAIR64__(v29, v28),
           a25,
           a26,
           a27);
}

uint64_t sub_100015ECC@<X0>(uint64_t a1@<X8>)
{
  return (*(uint64_t (**)(void))(a1 + 8 * ((31 * (v1 == 1228396329)) ^ 0x2AA)))();
}

uint64_t sub_100015F10@<X0>(int a1@<W8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45)
{
  LODWORD(STACK[0x290]) = 582388011;
  unsigned int v49 = (a1 + 1584616612) & 0xA18CABBF;
  unint64_t v50 = STACK[0x428];
  int v51 = (v49 + 1073741382) ^ LODWORD(STACK[0x4C4]);
  int v52 = (2 * LODWORD(STACK[0x4C4])) & 0x7FFFFFFA;
  int v53 = 1225351577 * ((2 * ((v48 - 200) & 0x6BE0F1A8) - (v48 - 200) - 1809904041) ^ 0xEAE09465);
  *(_DWORD *)(v48 - 176) = (v45 - 471448658) ^ v53;
  *(void *)(v48 - 200) = a45;
  *(void *)(v48 - 168) = v46;
  *(void *)(v48 - 152) = v50;
  *(void *)(v48 - 184) = a44;
  *(_DWORD *)(v48 - 192) = (a1 + 368399838) ^ v53;
  *(_DWORD *)(v48 - 188) = v51 - v53 + v52 - 344471713;
  uint64_t v54 = (*(uint64_t (**)(uint64_t))(v47 + 8 * (a1 ^ 0x96E)))(v48 - 200);
  int v55 = *(_DWORD *)(v48 - 160);
  LODWORD(STACK[0x464]) = v55;
  return (*(uint64_t (**)(uint64_t))(v47 + 8 * (int)(((v55 == -1158872075) * (v49 ^ 0x2B7)) ^ v49)))(v54);
}

uint64_t sub_10001604C@<X0>(int a1@<W8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, unsigned int a9)
{
  BOOL v11 = a9 < 0xE7C1304F;
  if (v11 == (v9 - 806916427) < 0xE7C1304F) {
    BOOL v11 = v9 - 806916427 < a9;
  }
  return (*(uint64_t (**)(void))(v10 + 8 * ((v11 * (3 * (a1 ^ 0x728) - 50)) | a1)))();
}

void sub_1000160C8()
{
}

uint64_t sub_1000160D0()
{
  return (*(uint64_t (**)(void))(v1
                              + 8
                              * (LODWORD(STACK[0x268]) ^ (61
                                                        * ((LODWORD(STACK[0x288])
                                                                        - 1078009232
                                                                        + ~(v0 + LODWORD(STACK[0x220]) - 1680994559)) < 3)))))();
}

uint64_t sub_100016188(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  return (*(uint64_t (**)(void))(v15
                              + 8
                              * ((((((a2 - 170933025) ^ (a13
                                                       + v16
                                                       - 220
                                                       + (unint64_t)(v14 + v13 - 1) < 0x10)) & 1) == 0)
                                * ((a2 - 223) ^ 0x408)) ^ a2)))();
}

uint64_t sub_1000161EC@<X0>(int8x16_t *a1@<X6>, int a2@<W8>)
{
  v7.i64[0] = 0xA4A4A4A4A4A4A4A4;
  v7.i64[1] = 0xA4A4A4A4A4A4A4A4;
  v8.i64[0] = 0x5252525252525252;
  v8.i64[1] = 0x5252525252525252;
  *(int8x16_t *)(v5 + (a2 + v2)) = vaddq_s8(vsubq_s8(*a1, vandq_s8(vaddq_s8(*a1, *a1), v7)), v8);
  return (*(uint64_t (**)(void))(v6 + 8 * (((((v4 + 1) & 0x1FFFFFFF0) == 16) * ((v3 + 109) ^ 0x561)) ^ v3)))();
}

uint64_t sub_100016250(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, uint64_t a7, unsigned int a8)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, void, uint64_t))(v9
                                                                               + 8
                                                                               * (((((a6 - 1771441669) & 0x69960DFF)
                                                                                  + 490)
                                                                                 * (a8 >> 4 == 69205872)) ^ a6)))(a1, a2, a3, (a6 - 1771441669) & 0x69960DFF, v8);
}

uint64_t sub_100016298(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, unint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 8 * (int)(a8 | (2 * (v15 > 1)))))(a1, a2, a3, a4, a5, 0xB85CCCF2DD310BC2, a7, a8, a9, a10, a11, a12, a13, a14);
}

uint64_t sub_1000162AC@<X0>(int a1@<W3>, int a2@<W8>)
{
  return (*(uint64_t (**)(void))(v2 + 8 * ((1112 * (a2 + ((v3 + 1249277875) ^ 0xBFB7D2E2) < 0x38)) ^ (a1 + v3 + 844))))();
}

uint64_t sub_1000162F4()
{
  return (*(uint64_t (**)(void))(v3
                              + 8
                              * ((41
                                * ((v1 & 0xFFFFFFFFFFFFFFFuLL) - 1 >= (unint64_t)((v2 + v0 - 942) | 0xAu) - 328)) ^ (v2 + v0 + 416))))();
}

uint64_t sub_100016334(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12, int a13)
{
  BOOL v16 = v13 + 1132010006 < (a13 + 877820110);
  if (a13 + 877820110 < (v15 ^ 0x824CAFAB) != (v13 + 1132010006) < 0x824CAAD6) {
    BOOL v16 = a13 + 877820110 < (v15 ^ 0x824CAFAB);
  }
  return (*(uint64_t (**)(uint64_t))(v14 + 8 * ((254 * v16) ^ v15)))(2843670420);
}

uint64_t sub_1000163AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44)
{
  return sub_1000344F4(a1, a2, 1492525174, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
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
           a39,
           a40,
           a41,
           a42,
           a43,
           a44);
}

uint64_t sub_1000163C4(double a1)
{
  *(double *)(v2 + v4) = a1;
  return (*(uint64_t (**)(void))(v6 + 8 * (((v3 != v4) * v5) | v1)))();
}

uint64_t sub_1000163E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, int a17)
{
  LODWORD(STACK[0x560]) = a17;
  return (*(uint64_t (**)(void))(v18 + 8 * ((83 * (STACK[0x478] == 0)) ^ (v17 - 1391))))();
}

uint64_t sub_100016418@<X0>(uint64_t a1@<X8>)
{
  *(unint64_t *)((char *)&STACK[0x2AC] + a1 - 704281290) = 0x5252525252525252;
  return (*(uint64_t (**)(void))(v3
                              + 8
                              * (int)((((((v2 - 5) ^ 0x312) & v1) != 8) * ((v2 + 1356083911) & 0xAF2BCEFD ^ 0x4F1)) | (v2 - 5))))();
}

uint64_t sub_100016490(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  int v26 = v24 + 1;
  unsigned int v27 = ((v22 ^ 0x4FA) - 1238136993 + *v23) * (*(_DWORD *)(a16 + 4 * (v26 - 1355080478)) ^ 0xB2E77930);
  unsigned int v28 = 1224239923 * ((((v21 | 0xD5326E8A) ^ 0xFFFFFFFE) - (~v21 | 0x2ACD9175)) ^ 0xD87E6CA2);
  *(_DWORD *)(v25 - 104) = v22 - v28 + 1202;
  *(_DWORD *)(v25 - 100) = (v26 - 1061557913) ^ v28;
  *(void *)(v25 - 112) = a14;
  *(_DWORD *)(v25 - 120) = (v27 ^ 0x7FBDD7F7) - v28 + ((2 * v27) & 0xFF7BAFEE) - 1074266176;
  *(void *)(v25 - 128) = a13;
  uint64_t v29 = (*(uint64_t (**)(uint64_t))(v18 + 8 * v20))(v25 - 128);
  BOOL v31 = v26 + 1401270453 > v17 || v26 + 1401270453 < v16;
  return (*(uint64_t (**)(uint64_t))(v18 + 8 * ((v31 * v19) ^ v22)))(v29);
}

uint64_t sub_100016498()
{
  BOOL v2 = v0 < (STACK[0x278] & 0x89D94FFB ^ 0x7B861A47) + ((LODWORD(STACK[0x2AC]) - 1648) | 0x18);
  return (*(uint64_t (**)(void))(v1 + 8 * (((2 * v2) | (32 * v2)) ^ (LODWORD(STACK[0x2AC]) - 1624))))();
}

uint64_t sub_1000164E8(uint64_t a1)
{
  int v2 = 1755732067 * (a1 ^ 0xDEC6BDDB);
  int v3 = *(_DWORD *)(a1 + 24) ^ v2;
  int v4 = *(_DWORD *)(a1 + 28) ^ v2;
  uint64_t v5 = *(void *)(a1 + 16);
  unsigned int v6 = (*(_DWORD *)(a1 + 4) ^ v2 ^ 0xC2B60F99) + ((2 * (*(_DWORD *)(a1 + 4) ^ v2)) & 0xF6FDEFFE ^ 0x7291E0CC);
  unsigned int v7 = 235795823
     * (((&v9 | 0x9DCFE726) - &v9 + (&v9 & 0x623018D8)) ^ 0x962AE7F);
  uint64_t v14 = *(void *)(a1 + 8);
  uint64_t v9 = v5;
  unsigned int v11 = v3 - 2138961583 + v7;
  int v12 = v4 - ((2 * v4 + 113599946) & 0x183DE7B4) - v7 - 545151297;
  int v13 = v6 - v7 + 1855449664;
  uint64_t result = (*((uint64_t (**)(uint64_t *))*(&off_10005CE90 + (v3 ^ 0x7F7DFD2C)) + v3 - 2138961231))(&v9);
  *(_DWORD *)a1 = v10;
  return result;
}

void sub_100016660(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 36) ^ (235795823
                             * ((-2 - ((a1 ^ 0x29040430 | 0x96E8ABCB) + (a1 ^ 0x10C0A082 | 0x69175434))) ^ 0x52961214));
  __asm { BRAA            X10, X17 }
}

uint64_t sub_100016790@<X0>(int a1@<W8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41)
{
  int v49 = (((v47 | 0x1EA818B6) - (v47 & 0x1EA818B6)) ^ 0x145C1699) * v46;
  *(void *)(v48 - 176) = a41;
  *(void *)(v48 - 168) = v41;
  *(void *)(v48 - 184) = a40;
  *(_DWORD *)(v48 - 196) = a1 - v49;
  *(_DWORD *)(v48 - 192) = (v43 + 513) ^ v49;
  uint64_t v50 = (*(uint64_t (**)(uint64_t))(v45 + 8 * (v43 ^ 0x875)))(v48 - 200);
  int v51 = *(_DWORD *)(v48 - 200);
  STACK[0x370] = v42;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, __n128))(v45 + 8 * (((v51 == v44) * (v43 ^ 0x6CE ^ (v43 + 1714) ^ 0x689)) ^ v43)))(v50, 48, 1754, 1158830124, 3756217471, 763955140, 538749824, (__n128)0);
}

uint64_t sub_100016864@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v7 = a2 + v4 - 304;
  STACK[0x3E8] = v7;
  *(unsigned char *)(a1 + v7) = ((v3 + 1) ^ v5) * (v3 + 18);
  return (*(uint64_t (**)(void))(v6 + 8 * (((2 * (STACK[0x3E8] == 0)) | (4 * (STACK[0x3E8] == 0))) ^ v2)))();
}

uint64_t sub_10001686C()
{
  return (*(uint64_t (**)(void))(v1 + 8 * ((((v0 ^ 0x266) - 1634) * ((v3 + v2 - 1) >= 0x7FFFFFFD)) ^ v0)))();
}

#error "100016A5C: call analysis failed (funcsize=85)"

uint64_t sub_100016A60@<X0>(uint64_t a1@<X8>)
{
  unsigned int v3 = *(_DWORD *)(v1 - 0x3D8A64FC118460F2) + 870831891;
  unsigned int v4 = *(_DWORD *)(v1 - 0x3D8A64FC118460F6) + 1804458166;
  BOOL v5 = v3 < ((v2 - 476) | 0x14Cu) - 2018642697;
  BOOL v6 = v3 > v4;
  if (v5 != v4 < ((v2 - 619) | 0xCCu) - 2018642426) {
    BOOL v7 = v5;
  }
  else {
    BOOL v7 = v6;
  }
  return (*(uint64_t (**)(void))(a1 + 8 * ((233 * !v7) ^ v2)))();
}

uint64_t sub_100016B10(_DWORD *a1)
{
  *((unsigned char *)a1 + (v3 ^ (v2 + 505)) + v1 + 4) = 69;
  *a1 = v1;
  return 0;
}

uint64_t sub_100016B34(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, int a13, int a14, uint64_t a15, uint64_t a16, int a17, int a18)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, unint64_t *, uint64_t))(v18 + 8 * ((504 * (a14 + ((2 * LODWORD(STACK[0x2EC])) & 0x5E ^ 0x40) + (STACK[0x2EC] & 0x3F ^ 0x1F9EDFCFu) < a18 - 718)) ^ (v19 + 1180))))(a1, -162308310, 4111790164, a4, 1875169912, 3894820454, &STACK[0x2A8], 164);
}

uint64_t sub_100016BE4@<X0>(int a1@<W8>)
{
  return (*(uint64_t (**)(void))(v2 + 8 * ((997 * (v1 + v3 + 1 < ((a1 + 666) ^ 0x7FFFFB73u))) ^ a1)))();
}

uint64_t sub_100016C38@<X0>(int a1@<W8>)
{
  return (*(uint64_t (**)(void))(v2 + 8 * (((*v1 == ((a1 + 1406370204) & 0xAC2C7FFA) - 1914) * (a1 - 1490)) ^ a1)))();
}

uint64_t sub_100016C80@<X0>(int a1@<W0>, uint64_t a2@<X3>, uint64_t a3@<X4>, int a4@<W8>)
{
  int v8 = a4 + 1;
  *(unsigned char *)(a2 + (v4 ^ 0x3EE ^ (a1 + 19)) + v8) = *(unsigned char *)(a3 + v7 - 829712093)
                                                               - (v5 & (2 * *(unsigned char *)(a3 + v7 - 829712093)))
                                                               + 82;
  return (*(uint64_t (**)(void))(v6 + 8 * ((11 * ((a1 + v8 + 1) < 0x40)) ^ v4)))();
}

uint64_t sub_100016C88()
{
  return (*(uint64_t (**)(void))(v2
                              + 8
                              * (int)((((int)((v3 ^ 0xFFDEFFFE) + 2046785616 + (v0 & 0xFFBDFFFC) - 2044622927) <= ((v1 - 63) | 0x540) - 1892)
                                     * ((v1 + 1222222621) & 0xB7265EEE ^ 0x478)) ^ v1)))();
}

void sub_100016D38(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 32) ^ (535753261 * (((a1 | 0x3F53CC1) - (a1 & 0x3F53CC1)) ^ 0x90132EE));
  uint64_t v3 = *(void *)a1;
  uint64_t v2 = *(void *)(a1 + 8);
  uint64_t v4 = *(void *)(a1 + 16);
  uint64_t v5 = *(void *)(*(void *)a1 - 0x6E06359E347AB915);
  uint64_t v7 = *(void *)(a1 + 40);
  uint64_t v8 = v5;
  uint64_t v9 = &STACK[0x4C6937770F4864E8];
  uint64_t v10 = v2;
  uint64_t v11 = v3;
  unsigned int v12 = v1 + 235795823 * ((&v7 - 1802953736 - 2 * (&v7 & 0x94891BF8)) ^ 0x2452A1) - 559;
  uint64_t v6 = (uint64_t)*(&off_10005CE90 + (v1 ^ 0x27D));
  (*(void (**)(uint64_t *))(v6 + 8 * (v1 + 1350)))(&v7);
  uint64_t v7 = *(void *)(v3 - 0x6E06359E347AB91DLL);
  uint64_t v9 = &STACK[0x4C6937770F4864D8];
  LODWORD(v8) = v1
              + 3804331 * ((((2 * &v7) | 0x24D906D2) - &v7 - 309101417) ^ 0x9DC998AF)
              + 442;
  (*(void (**)(uint64_t *))(v6 + 8 * (v1 + 1345)))(&v7);
  HIDWORD(v7) = v1
              - 1755732067 * ((2 * (&v7 & 0x7291AB68) - &v7 + 225334417) ^ 0xD3A8E94A)
              + 150;
  uint64_t v8 = v4;
  (*(void (**)(uint64_t *))(v6 + 8 * (v1 ^ 0xAEB)))(&v7);
  __asm { BRAA            X8, X17 }
}

void sub_100016F94()
{
  if (v0 == 1714328988) {
    int v1 = -1158872075;
  }
  else {
    int v1 = 1158830125;
  }
  *(_DWORD *)(v2 + 32) = v1;
}

void sub_100016FF8()
{
  LODWORD(STACK[0x290]) = v2;
  LODWORD(STACK[0x288]) = v1;
  STACK[0x210] = v0;
  JUMPOUT(0x100017004);
}

uint64_t sub_10001706C()
{
  return (*(uint64_t (**)(void))(v4
                              + 8
                              * ((1135
                                * (((v1 + v2 + 670 - 915) & (2 * (*(unsigned __int8 *)(v3 + 2) - 72)))
                                 + ((*(unsigned __int8 *)(v3 + 2) - 72) ^ v0) == v0)) ^ v2)))();
}

void sub_1000170AC(uint64_t a1, uint64_t a2)
{
  __asm { BRAA            X9, X17 }
}

void sub_10001711C(uint64_t a1)
{
  int v1 = 628203409 * (((a1 | 0x89B748DF) - a1 + (a1 & 0x7648B720)) ^ 0xB3F44EC);
  unsigned int v2 = *(_DWORD *)(*(void *)(a1 + 24) - 0x54240281ACF56119) + 275588124;
  unsigned int v3 = *(_DWORD *)(a1 + 20) + v1 - 691658836;
  BOOL v4 = v2 < 0x52E9D5C5;
  BOOL v5 = v2 > v3;
  if (v3 < 0x52E9D5C5 != v4) {
    BOOL v5 = v4;
  }
  __asm { BRAA            X9, X17 }
}

uint64_t sub_100017204(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v6
                                                                                + 8
                                                                                * (int)(((v4 == (((v5 - 1963) | 0x682) ^ 0x6A8))
                                                                                       * ((v5 + 2088720251) & 0xFBBCFDFD ^ 0x783C5D2B)) ^ v5)))(a1, a2, a3, a4, 2277745974);
}

uint64_t sub_100017264(uint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  if (a2 <= 0x30) {
    uint64_t v9 = 48;
  }
  else {
    uint64_t v9 = a2;
  }
  return (*(uint64_t (**)(void))(v6
                              + 8
                              * ((499 * (((a6 - 237) ^ (unint64_t)(v8 - 889)) + v9 + 1 + v7 < 0x40)) ^ (a6 - 237))))();
}

uint64_t sub_100017348(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,int a22,unsigned int a23,uint64_t a24)
{
  if (a23 < 0xAA294407 != (v24 + 1046146367) < 0xAA294407) {
    BOOL v26 = (v24 + 1046146367) < 0xAA294407;
  }
  else {
    BOOL v26 = v24 + 1046146367 > a23;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v25
                                                                                                  + 8 * ((v26 * a22) ^ 0x797)))(a1, 2486282488, a3, a4, 2277745974, 2017221945, a24);
}

uint64_t sub_1000173DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50)
{
  int v53 = 535753261 * ((((v52 - 200) | 0xCB336D8B) - ((v52 - 200) & 0xCB336D8B)) ^ 0xC1C763A4);
  *(void *)(v52 - 168) = 0x2E4DC5BD422AC3DALL;
  *(_DWORD *)(v52 - 196) = -1769365458 - v53;
  *(_DWORD *)(v52 - 192) = (v50 + 8) ^ v53;
  *(void *)(v52 - 184) = a49;
  *(void *)(v52 - 176) = a50;
  uint64_t v54 = (*(uint64_t (**)(uint64_t))(v51 + 8 * (v50 + 1554)))(v52 - 200);
  return (*(uint64_t (**)(uint64_t))(v51
                                            + 8
                                            * ((73 * (*(_DWORD *)(v52 - 200) != ((v50 - 1158872686) ^ (v50 - 505)))) ^ v50)))(v54);
}

uint64_t sub_1000174B4(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, int a6, uint64_t a7, int a8)
{
  return (*(uint64_t (**)(void))(v8 + 8 * (((a4 + a8 + 1419 >= ((a6 + 48) ^ 0xFFFFFF1D)) * ((2 * a6) ^ 0x137)) ^ a6)))();
}

uint64_t sub_1000174FC()
{
  void *v1 = v5;
  return (*(uint64_t (**)(void))(v4 + 8 * (((v3 == 0) * v2) ^ v0)))();
}

void sub_100017520(_DWORD *a1@<X8>)
{
  unsigned int v4 = 1118977051 * (*v1 + v2) - ((v3 - 2057013194 * (*v1 + v2) - 1880080648) & 0x84A71EC0) + 172732547;
  unsigned char *v5 = (HIBYTE(v4) ^ 0xC2) - 2 * ((HIBYTE(v4) ^ 0xC2) & 0x5A ^ HIBYTE(v4) & 8) + 82;
  v5[1] = (BYTE2(v4) ^ 0x53) - ((2 * (BYTE2(v4) ^ 0x53)) & 0xA4) + 82;
  v5[2] = (BYTE1(v4) ^ 0x8F) - ((2 * (BYTE1(v4) ^ 0x8F)) & 0xA4) + 82;
  v5[3] = v4 ^ 0x32;
  v1[4] = *a1;
}

void sub_100017610()
{
  _DWORD *v2 = 0x80000000;
  (*(void (**)(unint64_t))(v1 + 8 * (v0 + 1986)))(STACK[0x2A0]);
  JUMPOUT(0x10001764CLL);
}

void sub_100017738()
{
}

uint64_t sub_100017744(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7)
{
  return (*(uint64_t (**)(void))(v7 + 8 * ((1552 * (((((a7 ^ 0x282) - 562) ^ 0xF4) & v8) == 0)) ^ a7)))();
}

uint64_t sub_10001777C(uint64_t result)
{
  uint64_t v2 = *v1;
  *(void *)uint64_t result = 0;
  *(void *)(result + 8) = 0x1C20221D1C20221DLL;
  *(void *)(result + 16) = 0xD858270353C623C8;
  *(_DWORD *)(result + 24) = -1158872075;
  *(void *)(v2 - 0x6B8EF04F79262543) = result + 0x3D8A64FC11846102;
  *((_DWORD *)v1 + 2) = -1158872075;
  return result;
}

uint64_t sub_1000177F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,unsigned int *a56)
{
  uint64_t v58 = (*(uint64_t (**)(void, unint64_t, void))(v57 + 8 * ((v56 ^ 0x141) + 1994)))(*a56, STACK[0x2B0], LODWORD(STACK[0x414]));
  return sub_100017830(v58);
}

uint64_t sub_100017830()
{
  uint64_t v5 = LODWORD(STACK[0x464]);
  unint64_t v6 = (((v0 | 0x5D107D8CBBA72603) - (v0 | 0xA2EF82734458D9FCLL) - 0x5D107D8CBBA72604) ^ 0xA8F220E1B153282CLL) * v3;
  *(_DWORD *)(v4 - 176) = (v1 + 1454402395) ^ ((((v0 | 0xBBA72603) - (v0 | 0x4458D9FC) + 1146673660) ^ 0xB153282C) * v3);
  *(_DWORD *)(v4 - 192) = ((v1 + 1454402395) ^ 0x5A)
                        - (((v0 | 0xBBA72603) - (v0 | 0x4458D9FC) + 1146673660) ^ 0xB153282C) * v3;
  *(_DWORD *)(v4 - 188) = (((v0 | 0xBBA72603) - (v0 | 0x4458D9FC) + 1146673660) ^ 0xB153282C) * v3 + v1 + 2104630613;
  *(_DWORD *)(v4 - 184) = -((((v0 | 0xBBA72603) - (v0 | 0x4458D9FC) + 1146673660) ^ 0xB153282C) * v3);
  *(void *)(v4 - 200) = v6 ^ 0x4512582F;
  *(_DWORD *)(v4 - 160) = (v1 + 1454402444) ^ ((((v0 | 0xBBA72603) - (v0 | 0x4458D9FC) + 1146673660) ^ 0xB153282C) * v3);
  *(void *)(v4 - 168) = v5 + v6;
  uint64_t v7 = (*(uint64_t (**)(uint64_t))(v2 + 8 * (v1 + 375)))(v4 - 200);
  return (*(uint64_t (**)(uint64_t))(v2 + 8 * *(int *)(v4 - 180)))(v7);
}

uint64_t sub_100017908(unsigned int a1, int a2, uint64_t a3, int a4)
{
  unsigned int v9 = v7 + 490;
  int v10 = v5 + v4;
  unsigned int v11 = ((188 * (v9 ^ 0x79C)) ^ (v6 + 377)) + v10;
  if (v11 <= 0x40) {
    unsigned int v11 = a1;
  }
  return (*(uint64_t (**)(void))(v8 + 8 * ((101 * (a4 - v10 >= a2 + v11)) ^ v9)))();
}

uint64_t sub_10001795C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t v8 = a2 - 1;
  STACK[0x2F8] = v8;
  *(unsigned char *)(a1 + v8) = (((v6 ^ v5) + v3 + 2) ^ v4) * ((v6 ^ v5) + v3 + 19);
  return (*(uint64_t (**)(void))(v7 + 8 * ((STACK[0x2F8] != 0) ^ v2)))();
}

uint64_t sub_100017968(uint64_t a1, uint64_t a2)
{
  int v6 = **(unsigned __int8 **)(a2 + 8) - 42;
  return (*(uint64_t (**)(void))(v5
                              + 8
                              * ((((v3 & (2 * v6)) + (v6 ^ v2) == v2) * (((v4 - 315687702) & 0x12D103FB) - 604)) ^ v4)))();
}

uint64_t sub_1000179B8(uint64_t a1)
{
  int v2 = *(_DWORD *)(*(void *)(a1 + 8) - 0x4C6937770F4864B4);
  int v4 = v2 - 293522565;
  BOOL v3 = v2 - 293522565 < 0;
  int v5 = 293522565 - v2;
  if (!v3) {
    int v5 = v4;
  }
  int v1 = *(_DWORD *)a1 + 108757529 * ((2 * (a1 & 0x5EAB9BD4) - a1 - 1588304853) ^ 0x41C80600) + 8;
  return (*((uint64_t (**)(void))*(&off_10005CE90 + v1 - 173)
          + ((((v1 ^ v5 ^ 0x65BD46C2) + ((2 * v5) & 0xCB7A8FF6) - 1706903853 + ((v1 + 21269178) & 0xFEBB753D) < 0x7FFFFFFF)
            * (((v1 - 9) | 1) ^ 0x3B8)) ^ v1)))();
}

uint64_t sub_100017ADC(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 16) + 1755732067 * ((a1 - 903090360 - 2 * (a1 & 0xCA2BEF48)) ^ 0x14ED5293);
  return (*((uint64_t (**)(void))*(&off_10005CE90 + v1 - 1542)
          + (int)(((*(void *)(a1 + 8) != 0x3D8A64FC11846102) * (((v1 + 1372236108) & 0xAE3553BF) - 919)) ^ v1)))();
}

uint64_t sub_100017B7C(uint64_t a1, uint64_t a2, int a3)
{
  return (*(uint64_t (**)(void))(v5 + 8 * ((1054 * (v3 + 1 == v4 + 80)) ^ a3)))();
}

uint64_t sub_100017C4C()
{
  return (*(uint64_t (**)(void))(v1
                              + 8
                              * (int)(((((v0 - 387812146) ^ 0xE8E27991) - 498) * (((v3 + v2) & 0x1F) != 0x10)) ^ v0)))();
}

uint64_t sub_100017CB8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23)
{
  *(void *)(v25 - 120) = a23;
  *(_DWORD *)(v25 - 112) = v23
                         + 3804331 * ((2 * ((v25 - 120) & 0x7949BE30) - (v25 - 120) - 2034875953) ^ 0x9135A09)
                         + 105;
  *(void *)(v25 - 104) = a19;
  (*(void (**)(uint64_t))(v24 + 8 * (v23 ^ 0xC70)))(v25 - 120);
  *(void *)(v25 - 104) = a21;
  *(void *)(v25 - 120) = a23;
  *(_DWORD *)(v25 - 112) = v23
                         + 3804331 * ((2 * ((v25 - 120) & 0x4B4D8198) - (v25 - 120) - 1263370651) ^ 0x3B1765A3)
                         + 587;
  uint64_t v26 = (*(uint64_t (**)(uint64_t))(v24 + 8 * (v23 + 1023)))(v25 - 120);
  return (*(uint64_t (**)(uint64_t))(v24
                                            + 8
                                            * (((*(_DWORD *)(v25 - 108) > 0x76FA18A2u) * (14 * (v23 ^ 0x4C3) - 1797)) ^ v23)))(v26);
}

uint64_t sub_100017DF0@<X0>(int a1@<W8>)
{
  return (*(uint64_t (**)(void))(v1 + 8 * (((**(void **)(v3 + 8 * (v2 ^ 0x2F5)) == 0) * (a1 + 538)) ^ v2)))();
}

uint64_t sub_100017E20()
{
  unsigned int v5 = (((v4 - v3) >> 4) & 0x5FEDFDA ^ 0x4BE9F12) + (((v4 - v3) >> 5) ^ 0x7CA0B066);
  BOOL v6 = ((v0 - 182) ^ 0x24203E02 ^ (471 * (v0 ^ 0x124))) + v5 < v2 - 1625315039;
  if (v2 > 0x60E056DE != v5 < 0x7AFF6FED) {
    BOOL v6 = v2 > 0x60E056DE;
  }
  return (*(uint64_t (**)(void))(v1 + 8 * ((27 * v6) ^ v0)))();
}

uint64_t sub_100017ED0@<X0>(int a1@<W6>, int a2@<W8>)
{
  return sub_10004148C(a1, v2 + a2 + (v3 ^ 0x97656BBB));
}

uint64_t sub_100017EFC@<X0>(int a1@<W5>, unsigned int a2@<W8>)
{
  uint64_t v4 = a2;
  unint64_t v5 = (v2 + 566) - 704281290 + a2 - 1044;
  if (v5 <= 0x38) {
    unint64_t v5 = 56;
  }
  return (*(uint64_t (**)(void))(v3 + 8 * ((1014 * (v5 - v4 + (v2 ^ (a1 - 83)) - 1312940655 < 8)) ^ v2)))();
}

uint64_t sub_100017F64@<X0>(int a1@<W0>, uint64_t a2@<X8>)
{
  int v6 = a1 - 1561;
  int v7 = a1 - 1302;
  int v8 = (**(_DWORD **)(a2 - 0x4C6937770F4864B0) ^ 0x4D1886CF) + 1;
  **(_DWORD **)(a2 - 0x4C6937770F4864B0) = v2 + v6 + v8 - (v5 & (2 * v8)) - 428;
  BOOL v9 = v3 - 1198301460 > 920654514;
  if (v3 - 1198301460 < -1226829135) {
    BOOL v9 = 1;
  }
  return (*(uint64_t (**)(void))(v4 + 8 * ((1719 * v9) ^ v7)))();
}

void sub_100018028(uint64_t a1, uint64_t a2)
{
  __asm { BRAA            X9, X17 }
}

void sub_100018098(int a1@<W8>)
{
  int v5 = 127 * (v3 ^ 0x194);
  int v6 = 861644077 - a1;
  if (*v4 + 1853961083 < 0) {
    int v6 = v1;
  }
  *v4 += (v5 ^ (v2 + 449)) + v6;
}

uint64_t sub_10001811C(uint64_t a1, int a2)
{
  return (*(uint64_t (**)(void))(v3 + 8 * (((*v2 == 0x6CA88026133E1E07) * ((a2 - 235) ^ 0x3FD)) ^ a2)))();
}

uint64_t sub_100018158@<X0>(int a1@<W4>, int a2@<W6>, int a3@<W8>)
{
  *(unsigned char *)(v6 + (v5 + a1 + 1069)) = *(unsigned char *)(v4 + (v5 + a1 + 1069));
  return (*(uint64_t (**)(void))(v3 + 8 * (((a1 - 1 != a3) * ((a2 ^ 0x512) - 786)) | a2 ^ 0xB)))();
}

uint64_t sub_10001819C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v5
                                                                                         + 8
                                                                                         * ((120
                                                                                           * (v4 != (((v3 ^ 0x626) + 1736) ^ 0x6DA))) ^ v3)))(a1, a2, a3, 1468, 205, 889516850);
}

uint64_t sub_1000181E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, _DWORD *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,_DWORD **a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,char a46)
{
  uint64_t v50 = (v47 + 1402059193);
  uint64_t v51 = *a27;
  if (((unint64_t)*a27 & 3) != (v47 - v46) + v50 - 1554
    || (uint64_t v52 = *(void **)(v49 + 8 * (v47 ^ (v46 + 939))), *v52))
  {
    *a10 = 1158830154;
    return sub_1000390E8(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
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
  else
  {
    int v53 = 94 * (v50 ^ 0x2DC);
    *uint64_t v52 = v51;
    **(_DWORD **)(v49 + 8 * (v47 + 1402058516)) = 255;
    *v51 |= ~v51[*v51 & 0x3ELL] << 16;
    v51[4] |= (v53 ^ 0xF905 ^ v51[v51[4] & 0x3ELL]) << 16;
    v51[8] |= ~v51[v51[8] & 0x3ELL] << 16;
    v51[12] |= ~v51[v51[12] & 0x3ELL] << 16;
    v51[16] |= ~v51[v51[16] & 0x3ELL] << 16;
    v51[20] |= ~v51[v51[20] & 0x3ELL] << 16;
    v51[24] |= ~v51[v51[24] & 0x3ELL] << 16;
    v51[28] |= ~v51[v51[28] & 0x3ELL] << 16;
    v51[32] |= ~v51[v51[32] & 0x3ELL] << 16;
    v51[36] |= ~v51[v51[36] & 0x3ELL] << 16;
    v51[40] |= ~v51[v51[40] & 0x3ELL] << 16;
    v51[44] |= ~v51[v51[44] & 0x3ELL] << 16;
    v51[48] |= ~v51[v51[48] & 0x3ELL] << 16;
    v51[52] |= ~v51[v51[52] & 0x3ELL] << 16;
    v51[56] |= ~v51[v51[56] & 0x3ELL] << 16;
    v51[60] |= ~v51[v51[60] & 0x3ELL] << 16;
    uint64_t v54 = (*(uint64_t (**)(char *, void, uint64_t))(v48 + 8 * (v47 + 1402060650)))(&a46, 0, 1024);
    STACK[0x528] = (unint64_t)&a46;
    return (*(uint64_t (**)(uint64_t))(v48 + 8 * ((414 * (((v53 + 19) ^ 1) & 1)) ^ v53)))(v54);
  }
}

uint64_t sub_1000184F8()
{
  int v3 = v1 != ((134 * (v2 ^ 0x6AB)) ^ 0x218);
  return (*(uint64_t (**)(void))(v0 + 8 * (((4 * v3) | (v3 << 6)) ^ v2)))();
}

uint64_t sub_100018530@<X0>(char a1@<W0>, char a2@<W1>, char a3@<W2>, char a4@<W3>, int a5@<W8>)
{
  unsigned int v14 = v5 + 16;
  uint64_t v15 = v14 - 16;
  int v16 = (v15 >> v7) - (v8 & (2 * (v15 >> v7))) + v9;
  v12[12] = (HIBYTE(v16) ^ v10) - 2 * ((HIBYTE(v16) ^ v10) & v11 ^ HIBYTE(v16) & 8) + 82;
  v12[13] = (a1 ^ BYTE2(v16)) - (a2 & (2 * (a1 ^ BYTE2(v16)))) + 82;
  v12[14] = (BYTE1(v16) ^ 0x8F) - (a2 & (2 * (BYTE1(v16) ^ 0x8F))) + 82;
  v12[15] = v16 ^ a3;
  int v17 = (unsigned char *)(v6 + v15);
  unsigned char *v17 = *v12 ^ a4 ^ *(unsigned char *)(v6 + v15);
  *(unsigned char *)(v6 + (v15 | 1)) ^= v12[1] ^ a4;
  *(unsigned char *)(v6 + (v15 | 2)) ^= v12[2] ^ a4;
  *(unsigned char *)(v6 + (v15 | 3)) ^= v12[3] ^ a4;
  v17[4] = v12[4] ^ a4 ^ *(unsigned char *)(v6 + v15 + 4);
  v17[5] = v12[5] ^ a4 ^ *(unsigned char *)(v6 + v15 + 5);
  v17[6] = v12[6] ^ a4 ^ *(unsigned char *)(v6 + v15 + 6);
  v17[7] = v12[7] ^ a4 ^ *(unsigned char *)(v6 + v15 + 7);
  v17[8] = v12[8] ^ a4 ^ *(unsigned char *)(v6 + v15 + 8);
  v17[9] = v12[9] ^ a4 ^ *(unsigned char *)(v6 + v15 + 9);
  v17[10] = v12[10] ^ a4 ^ *(unsigned char *)(v6 + v15 + 10);
  v17[11] = v12[11] ^ a4 ^ *(unsigned char *)(v6 + v15 + 11);
  v17[12] = v12[12] ^ a4 ^ *(unsigned char *)(v6 + v15 + 12);
  v17[13] = v12[13] ^ a4 ^ *(unsigned char *)(v6 + v15 + 13);
  v17[14] = v12[14] ^ a4 ^ *(unsigned char *)(v6 + v15 + 14);
  v17[15] = v12[15] ^ a4 ^ *(unsigned char *)(v6 + v15 + 15);
  return (*(uint64_t (**)(void))(v13 + 8 * (((8 * (v14 > 0x14F)) | (16 * (v14 > 0x14F))) ^ (a5 + 59))))();
}

void sub_100018538()
{
}

uint64_t sub_100018544(uint64_t a1, uint64_t a2, uint64_t a3, int a4, int a5, int a6, int a7, unsigned int a8)
{
  return (*(uint64_t (**)(void))(v9 + 8 * (((*(_DWORD *)(*v10 + 4 * a8) != ((a7 + a4) & a5) + v8) * a6) ^ a7)))();
}

uint64_t sub_100018574(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,int a26,int a27,int a28,int a29)
{
  *uint64_t v29 = v29[623];
  return sub_10003F1F0(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29);
}

uint64_t sub_100018584(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, unint64_t a16, uint64_t a17, int a18, int a19)
{
  uint64_t v26 = (a6 + v19 - 51) ^ (a6 - 576);
  int v22 = 1755732067 * ((((v21 - 160) | 0xE413AAA9) + (~(v21 - 160) | 0x1BEC5556)) ^ 0x3AD51773);
  STACK[0x310] = a16;
  *(_DWORD *)(v21 - 152) = v22 + v19 + 248;
  *(_DWORD *)(v21 - 148) = a19 - v22 - 442879031;
  uint64_t v23 = (*(uint64_t (**)(uint64_t))(v20 + 8 * (v19 + 2049)))(v21 - 160);
  uint64_t v24 = LODWORD(STACK[0x2F0]) & (v26 ^ 0x7FF);
  *((unsigned char *)&STACK[0x2AC] + (v24 ^ 0x20)) = -46;
  return (*(uint64_t (**)(uint64_t))(v20 + 8 * ((774 * ((v24 ^ 0x20) > 0x37)) ^ v19)))(v23);
}

uint64_t sub_100018670(uint64_t a1, uint64_t a2, unsigned int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8)
{
  BOOL v17 = a3 > v13;
  *(unsigned char *)(*v16 + ((v11 - 301633764) & 0x11FA8E65 ^ (a8 + 124)) + v9) = 82;
  unsigned int v18 = v9 + 1 + v8;
  int v19 = v17 ^ (v18 < v10);
  BOOL v20 = v18 < v12;
  if (!v19) {
    BOOL v17 = v20;
  }
  return (*(uint64_t (**)(void))(v15 + 8 * ((!v17 * v14) ^ v11)))();
}

void sub_1000186E4()
{
}

uint64_t sub_1000186F0()
{
  uint64_t v9 = v7;
  v8[1] = v5
        + (((v8 | 0x5A0877C7) - v8 + (v8 & 0xA5F78838)) ^ 0x50FC79E8) * v4
        + v3;
  (*(void (**)(_DWORD *))(v1 + 8 * (int)(v3 ^ 0x91DC61AF)))(v8);
  return v2 ^ v0;
}

uint64_t sub_100018824(uint64_t a1, int a2)
{
  return (*(uint64_t (**)(void))(v4
                              + 8
                              * ((((*(unsigned char *)(v5 + v3 * (uint64_t)a2 + 40) & 8) == 0) * ((v2 ^ 0x348) + 220)) ^ (v2 - 1634))))();
}

uint64_t sub_10001885C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v8 = *(unsigned __int8 *)(v4 + a3 - 0x43EE3A17E455A7DALL)
     - (*(unsigned __int8 *)(v5 + a3 - 0x43EE3A17E455A7DALL) ^ 0x52);
  return (*(uint64_t (**)(uint64_t))(v6
                                            + 8
                                            * ((461
                                              * (((33 * (v3 ^ 0x4E4) - 33563982) & (2 * v8)) + (v8 ^ (v7 + 10)) == (v3 ^ 0x4E4) + v7)) ^ v3)))(1158830123);
}

uint64_t sub_1000188D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, unsigned int a16, int a17)
{
  a16 = (1178560073 * ((2 * (&a16 & 0x52392F10) - &a16 + 768004332) ^ 0x9752A88E)) ^ 0x650810FC;
  uint64_t v19 = (*(uint64_t (**)(unsigned int *))(v18 + 17112))(&a16);
  return (*(uint64_t (**)(uint64_t))(v18 + 8 * ((1773 * (a17 == v17)) ^ 0x150u)))(v19);
}

uint64_t sub_100018964(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_1000189A0(1433, a2, a3, 71, a5, 2419797384, &STACK[0x2A8], 164);
}

uint64_t sub_1000189A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v4
                                                                                + 8
                                                                                * ((182
                                                                                  * (((2 * LODWORD(STACK[0x2EC])) & 0x58 ^ 0x40)
                                                                                   + (STACK[0x2EC] & 0x3F ^ 0x6AEB7FCCu)
                                                                                   - 1793818664 > 0xFFFFFFBF)) ^ (v5 + 273))))(a1, -162308310, 4111790164, a4, 1875169912);
}

uint64_t sub_100018AD8(uint64_t a1, int a2)
{
  return (*(uint64_t (**)(void))(v5 + 8 * (((v3 + v4 - 2004 + a2 >= 0) * ((v2 + 1409) ^ 0x702)) ^ v2)))();
}

uint64_t sub_100018B0C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8)
{
  int v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void))(v9
                                                                                      + 8
                                                                                      * (((v8 < a8 - 491)
                                                                                        * ((31 * (a8 ^ 0x1E6)) ^ 0x387)) | a8));
  *(_DWORD *)(v10 - 144) = v8;
  return v11(a1, a2, a3, a4, a5, 0);
}

uint64_t sub_100018B50(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v13 = (a1 - 355645664);
  *(unsigned char *)(a6 + v13) = *(unsigned char *)(a7 + v13) ^ *(unsigned char *)(v9 + (v13 & 0xF)) ^ *(unsigned char *)(v8 + (v13 & 0xF)) ^ *(unsigned char *)((v13 & 0xF) + v7 + 2) ^ (-73 * (v13 & 0xF)) ^ 0x52;
  return (*(uint64_t (**)(void))(v12 + 8 * ((339 * (a1 - 1 == 9 * (v11 ^ 0x2A2) + v10)) ^ v11)))();
}

uint64_t sub_100018BCC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  return (*(uint64_t (**)(void))(v66 + 8 * ((994 * (v67 != (a65 ^ (v68 + 894)))) ^ (v65 - 1286))))();
}

uint64_t sub_100018C00()
{
  return (*(uint64_t (**)(void))(v2 + 8 * ((((v1 ^ 0x7B7) - 693) * (v0 == 1754960189)) ^ v1)))();
}

uint64_t sub_100018C38(uint64_t a1, uint64_t a2, int a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8)
{
  int v16 = (unsigned int *)(v12 + 4 * v10);
  uint64_t v17 = v10 + 1;
  int v18 = *(_DWORD *)(v12 + 4 * v17);
  unsigned int v19 = v16[397] ^ ((v18 & (((v8 - 1180) | a8) + v15) | v9 & 0x80000000) >> 1);
  *int v16 = (v19 + a3 - (a4 & (2 * v19))) ^ *(_DWORD *)(v14 + 4 * (v18 & 1));
  return (*(uint64_t (**)(void))(v13 + 8 * (((v17 != 227) * v11) ^ v8)))();
}

uint64_t sub_100018CA0@<X0>(int a1@<W0>, int a2@<W1>, uint64_t a3@<X2>, int a4@<W8>)
{
  *(unsigned char *)(v5 + (a4 + v6 + v4 + 1738)) = *(unsigned char *)(a3 + (a4 + v6 + v4 + 1738));
  return (*(uint64_t (**)(void))(v9
                              + 8
                              * (((a4 - 1 == v7 + ((v4 - 19) | 2) - 22) * ((((v4 + 1738) ^ v8) * a1) ^ a2)) ^ (v4 + 485))))();
}

uint64_t sub_100018CC4()
{
  LODWORD(STACK[0x55C]) = v0;
  return sub_10001BE48();
}

void sub_100018CE4()
{
}

uint64_t sub_100018D54(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, int a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38)
{
  HIDWORD(v41) = HIDWORD(a18) + 1626434781;
  v39.i64[0] = 0x5252525252525252;
  v39.i64[1] = 0x5252525252525252;
  LODWORD(a28) = 2 * (a6 ^ (a6 - 253));
  HIDWORD(a21) = (a6 + 1146009256) & 0x4374EEFF;
  LODWORD(v41) = HIDWORD(a21) ^ 0x2B2;
  return sub_10002FFC8(*(double *)vdupq_n_s32(0x75DA07EAu).i64, v39, a1, a2, 82301862, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17,
           a18,
           a19,
           v38,
           a21,
           v41,
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
           a38);
}

uint64_t sub_100018DF4(char a1, uint64_t a2, int a3)
{
  return (*(uint64_t (**)(void))(v6
                              + 8
                              * (((((v5 ^ a1) + *(unsigned char *)(v4 + 1 + a2) - *(unsigned char *)(v3 + 1)) == 17)
                                * a3) ^ (v5 - 108))))();
}

uint64_t sub_100018E04(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,int a57)
{
  unsigned int v59 = v57 & 0xC014F3FF;
  int v60 = a27 - ((2 * a27 + 1008819976) & 0xFB25129E) - 1683801901;
  unsigned int v61 = ((a57 + v59 - 2107248869) ^ v60) + ((2 * v60) & 0xFFEEFFDE ^ 0xFB24129E);
  BOOL v63 = (((v59 - 836416703) & 0x31DAB35F ^ 0x50) & (v61 + 1)) != 0 || v61 == ((v59 + 968) | 0x41) + 2146925096;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v58 + 8 * (int)((956 * v63) ^ v59)))(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
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
           a39,
           a40,
           a41,
           a42,
           a43,
           a44,
           a45,
           a46,
           a47,
           a48);
}

uint64_t sub_100018EDC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,int a39)
{
  return (*(uint64_t (**)(void))(v40 + 8 * ((1880 * ((v39 ^ 0xEAB261CD) + a39 < 0x10)) ^ v39)))();
}

uint64_t sub_100018F1C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v47
                                                                                                  + 8 * ((((LODWORD(STACK[0x2AC]) + 16) & 1) * v46) ^ (LODWORD(STACK[0x2AC]) + 12))))(a1, a2, a46, 4182909345, a5, a6, 115);
}

uint64_t sub_100018F94(uint64_t a1, int a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,unsigned int a42)
{
  unsigned int v46 = v43[396] ^ ((*v43 & 0x7FFFFFFE | ((a2 + v42 - 1058) ^ 0xD3BCD37E) & v43[623]) >> 1);
  v43[623] = (v46 + a3 - ((((v42 + 18926890) | 0x529C0232) - 1489305422) & (2 * v46))) ^ *(_DWORD *)(v45 + 4 * (*v43 & 1));
  return (*(uint64_t (**)(void))(v44 + 8 * ((845 * (a42 > 0x26F)) ^ v42)))();
}

uint64_t sub_100019028()
{
  return (*(uint64_t (**)(void))(v2 + 8 * ((v1 + 1404883401) ^ (11 * (v0 >= v3)))))();
}

uint64_t sub_100019060(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,unsigned int *a56)
{
  (*(void (**)(void, unint64_t *, uint64_t))(v56 + 8 * (v57 + 1750)))(*a56, &STACK[0x4B8], 2048);
  unsigned int v59 = *(uint64_t (**)(void))(v56
                            + 8
                            * ((1250
                              * ((*(unsigned int (**)(void, unint64_t *, void, uint64_t))(v56 + 8 * (v57 + 1787)))(*a56, &STACK[0x468], (LODWORD(STACK[0x344]) + v58), 1) == ((v57 + 1423) ^ 0xFFFFFA4B) + v57 + 484)) ^ v57));
  return v59();
}

uint64_t sub_100019100(uint64_t a1, int a2, int a3, uint64_t a4, uint64_t a5, int a6)
{
  return (*(uint64_t (**)(void))(v6
                              + 8
                              * (int)(((((a6 + 422852653) & 0xE6CBC5F9) - 1244)
                                     * ((a3 + a2 - 1876928461) < 8)) ^ a6)))();
}

uint64_t sub_10001915C()
{
  return sub_100019188();
}

uint64_t sub_100019188@<X0>(uint64_t a1@<X1>, uint64_t a2@<X3>, uint64_t a3@<X6>, uint64_t a4@<X7>, int a5@<W8>, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  uint64_t v26 = *(uint64_t (**)(void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void, uint64_t, uint64_t, void, uint64_t))(v25 + 8 * ((63 * (((2 * LODWORD(STACK[0x2C8])) & 0x76 ^ 0x40) + (STACK[0x2C8] & 0x3F ^ 0xCBFFBE1B) + 872432009 < 0xFFFFFFC0)) ^ ((int)a1 + 1253)));
  return v26(v26, a1, 3422535226, a2, 872432070, 164, a3, a4, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16,
           a17,
           a18,
           a19,
           *(void *)(v25 + 8 * a5),
           a21,
           a22,
           *(void *)(v24 + 24),
           a24);
}

uint64_t sub_1000192B0@<X0>(uint64_t a1@<X8>)
{
  BOOL v9 = v4 > 0xB90DBCE0;
  uint64_t v10 = (v6 - 243809380);
  *(unsigned char *)(a1 + v10) = *(unsigned char *)(v1 + v10) ^ (97 * (v10 & 0xF)) ^ *(unsigned char *)(*(void *)(v8 + 8 * (int)(v3 - 601))
                                                                              + (v10 & 0xF)
                                                                              - 8) ^ *(unsigned char *)(*(void *)(v8 + 8 * (v3 ^ 0x2F5))
                                                                                              + (v10 & 0xF)
                                                                                              - 4) ^ *(unsigned char *)(*(void *)(v8 + 8 * (int)(v3 - 668)) + (v10 & 0xF)) ^ 0x52;
  unsigned int v11 = ((205 * (v3 ^ 0x2BF)) ^ 0x386A0327) + v6;
  int v12 = v9 ^ (v11 < v2);
  BOOL v13 = v11 < v5;
  if (!v12) {
    BOOL v9 = v13;
  }
  return (*(uint64_t (**)(void))(v7 + 8 * ((1125 * v9) ^ v3)))();
}

uint64_t sub_100019380(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  (*(void (**)(uint64_t, uint64_t))(v21 + 8 * (v20 + 1089)))(a13, 2965982036);
  uint64_t v23 = (*(uint64_t (**)(void))(v21 + 8 * (int)a11))();
  *int v22 = v23;
  v22[1] = 1812433253 * (v23 ^ (v23 >> 30)) + 1;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v21 + 8 * SHIDWORD(a11)))(v23, v24, v25, v26, v27, v28, v29, v30, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20);
}

uint64_t sub_1000193F8@<X0>(uint64_t a1@<X2>, uint64_t a2@<X8>)
{
  *(unsigned char *)(v4 + a1 + a2 - 1) = v5;
  return (*(uint64_t (**)(void))(v6 + 8 * ((((unint64_t)(v4 + a1) < 0x38) * v2) ^ v3)))();
}

uint64_t sub_100019428@<X0>(uint64_t a1@<X4>, unint64_t a2@<X8>, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, unsigned int a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19)
{
  unint64_t v30 = (v28 ^ v25 ^ (v19 + 287) ^ *(_DWORD *)(v29 + v26)) + HIDWORD(a2);
  *(_DWORD *)(v29 + 4 * a1) = v30 + v19 - (v20 & (2 * v30));
  *(_DWORD *)(a19 + v26) = HIDWORD(v30) | (v19 + ((v28 + 838) | 0xE0) - 1256);
  BOOL v31 = v23 + 1226706482 < v21;
  if (a14 > v22 != v23 + 1226706482 < -246076209) {
    BOOL v31 = a14 > v22;
  }
  return (*(uint64_t (**)(void))(v24 + 8 * ((v28 + 911) ^ (!v31 * v27))))();
}

uint64_t sub_1000194CC@<X0>(uint64_t result@<X0>, int a2@<W8>)
{
  *(_DWORD *)(result + 16) = ((*(_DWORD *)(*(void *)(v3 - 0x4C6937770F4864B0) + 4 * v4) ^ 0xB2E77930) >> v2) & 1 | a2;
  return result;
}

uint64_t sub_100019504()
{
  return (*(uint64_t (**)(void))(v0
                              + 8 * ((((34 * ((v1 - 207) ^ 0x162)) ^ (v1 + 803)) * (v2 == 369098752)) ^ (v1 - 207))))();
}

uint64_t sub_100019540()
{
  *(void *)(v1 + v4) = v6;
  return (*(uint64_t (**)(void))(v5 + 8 * (((v2 != v4) * v3) ^ v0)))();
}

uint64_t sub_100019564(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19)
{
  return (*(uint64_t (**)(void))(v22
                              + 8
                              * ((2011
                                * ((unint64_t)&STACK[0x2AC]
                                 + (v19 + v20)
                                 + (((((v21 ^ 0x463) + 1532951490) & 0x103D0 ^ 0xFFFFFFFFFFFFFD17)
                                   + (((v21 ^ 0x463) - 2140396674) & 0x19FC)) ^ a19) > 0xF)) ^ v21 ^ 0x463u)))();
}

uint64_t sub_1000195DC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, int a9@<W8>, uint64_t a10)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 8 * (((*(_DWORD *)(a8 + 72) == ((245 * (a9 ^ 0x19B) - 2095483354) | 0x10600444) + a4) * ((245 * (a9 ^ 0x19B) - 1661762671) & 0x630C7B95 ^ 0x795)) ^ (245 * (a9 ^ 0x19B)))))(a1, a2, a3, a4, a5, a6, a7, a8, a10);
}

void sub_100019658()
{
  LODWORD(STACK[0x2CC]) = 1228396329;
  JUMPOUT(0x10000C0D4);
}

uint64_t sub_100019670(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  LODWORD(STACK[0x53C]) = v9;
  STACK[0x310] = *(void *)(v11 + 8 * v10);
  return sub_100030BB8(a1, a2, -1660710441, a4, a5, a6, a7, a8, a9);
}

void sub_100019694(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)(a2 + v2) = 293522565;
  sub_100021BFC();
}

uint64_t sub_1000196A4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return (*(uint64_t (**)(void))(a2
                              + 8
                              * ((234 * (*(_DWORD *)(*(void *)(a1 + 8) + v4) == ((8 * (v2 + 1137)) ^ 0x2BD0 ^ v3))) ^ (v2 + 1137))))();
}

uint64_t sub_1000196E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  *(void *)(v19 - 128) = a14;
  *(_DWORD *)(v19 - 120) = v14 + (((~(v19 - 128) & 0x8B35C53C) - (~(v19 - 128) | 0x8B35C53D)) ^ 0x490DEFB) * v16 + 1024;
  *(void *)(v19 - 112) = v18;
  uint64_t v20 = (*(uint64_t (**)(uint64_t))(v15 + 8 * (v14 ^ 0xACC)))(v19 - 128);
  return (*(uint64_t (**)(uint64_t))(v15
                                            + 8
                                            * ((392
                                              * (((v14 + 48) ^ 0xB8 ^ (*(_DWORD *)(v19 - 116) > ((v14 - 1971889104) & 0x7588A5EE ^ (v17 + 877)))) & 1)) ^ v14)))(v20);
}

uint64_t sub_100019794@<X0>(int a1@<W0>, int a2@<W1>, int a3@<W2>, unint64_t a4@<X8>)
{
  uint64_t v9 = (a3 + a1 + v7);
  unint64_t v10 = v9 + a4 + 1;
  uint64_t v11 = ((_BYTE)a3 + (_BYTE)a1 + (_BYTE)v7) & 0xF;
  unint64_t v12 = v6 + v11 - v9;
  unint64_t v13 = v6 + v11 + ((2 * a2) ^ 0xD17);
  unint64_t v14 = v11 - v9 + v4 + ((a2 - 1291) | 0x22Eu) - 940;
  unint64_t v15 = v11 + v4 + 3;
  uint64_t v16 = v11 + v5;
  unint64_t v17 = v16 - v9 + 4;
  unint64_t v18 = v16 + 5;
  BOOL v20 = v12 < v10 && v13 > a4;
  int v22 = v15 > a4 && v14 < v10 || v20;
  if (v18 <= a4 || v17 >= v10) {
    int v24 = v22;
  }
  else {
    int v24 = 1;
  }
  return (*(uint64_t (**)(void))(v8 + 8 * ((109 * (v24 ^ 1)) ^ a2)))();
}

uint64_t sub_10001983C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  BOOL v10 = *(_DWORD *)STACK[0x290] != a6 || v7 != ((v6 + 497) ^ LODWORD(STACK[0x280]));
  return (*(uint64_t (**)(void))(v8 + 8 * ((v10 * (v6 - 17)) ^ v6)))();
}

uint64_t sub_100019884(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19)
{
  *(_DWORD *)(v24 - 112) = v21 + ((2 * ((v24 - 120) & 0x10E96C30) - (v24 - 120) - 283733045) ^ 0x60B3880D) * v22 - 129;
  *(void *)(v24 - 120) = a19;
  *(void *)(v24 - 104) = v19;
  uint64_t v25 = (*(uint64_t (**)(uint64_t))(v20 + 8 * (v21 ^ 0xF4F)))(v24 - 120);
  return (*(uint64_t (**)(uint64_t))(v20
                                            + 8
                                            * ((218
                                              * (v23 + *(_DWORD *)(v24 - 108) + 746 < ((v21 - 799208319) & 0x2FA2EEF7 ^ 0x9B4D4768)
                                                                                    + (v21 ^ 0x1FE))) ^ v21)))(v25);
}

uint64_t sub_10001994C(uint64_t a1, int a2, uint64_t a3, uint64_t a4, char a5)
{
  return sub_10002B74C(a2, a5, *(_DWORD *)(v5 - 140));
}

uint64_t sub_10001995C(int a1)
{
  return (*(uint64_t (**)(void))(v4 + 8 * ((1802 * (*(_DWORD *)(v2 + 4 * v3) == a1)) ^ v1)))();
}

uint64_t sub_100019984(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  int v18 = 535753261 * ((((v17 - 136) | 0xE31AF377) - (v17 - 136) + ((v17 - 136) & 0x1CE50C88)) ^ 0xE9EEFD58);
  *(_DWORD *)(v17 - 128) = v18 + v12 + 1112227895;
  *(_DWORD *)(v17 - 124) = (v15 + 915) ^ v18;
  *(void *)(v17 - 136) = v16;
  (*(void (**)(uint64_t))(v14 + 8 * (v15 ^ 0xA57)))(v17 - 136);
  *(_DWORD *)(v17 - 128) = v15 + ((v17 - 1192853900 - 2 * ((v17 - 136) & 0xB8E67EFC)) ^ 0x3743653A) * v13 + 1086;
  *(void *)(v17 - 120) = a11;
  *(void *)(v17 - 136) = a12;
  uint64_t v19 = (*(uint64_t (**)(uint64_t))(v14 + 8 * (v15 ^ 0xA0E)))(v17 - 136);
  return (*(uint64_t (**)(uint64_t))(v14
                                            + 8
                                            * ((((*(_DWORD *)(v17 - 124) - 1996101795) >= 0x8A4F20CF)
                                              * ((v15 - 164604506) & 0x9CFAEBE ^ (v15 + 1113))) ^ (v15 - 325))))(v19);
}

uint64_t sub_100019AC0()
{
  _DWORD *v3 = v3[623];
  unint64_t v7 = 1374699841
     * ((~((v6 - 144) | 0x11E12E9833E9C1D7) + ((v6 - 144) & 0x11E12E9833E9C1D7)) ^ 0xE0124F6BA1E22621);
  *(_DWORD *)(v6 - 112) = v1 + v0 - 1549623123 + v7;
  *(_DWORD *)(v6 - 108) = ((v1 + v0 - 1549623123) | 0x28) - v7;
  *(void *)(v6 - 120) = v7 + 1237246621;
  *(_DWORD *)(v6 - 124) = (v1 + v0 - 1909091488) ^ v7;
  *(void *)(v6 - 136) = (v5 + 319043854) + v7;
  *(_DWORD *)(v6 - 144) = v7 ^ 1;
  *(_DWORD *)(v6 - 140) = ((v1 + v0 - 1549623123) ^ 0x51) - v7;
  uint64_t v8 = (*(uint64_t (**)(uint64_t))(v4 + 8 * (v2 + v1 + v0 - 620 + 1525)))(v6 - 144);
  return (*(uint64_t (**)(uint64_t))(v4 + 8 * *(int *)(v6 - 128)))(v8);
}

uint64_t sub_100019BB8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, int a11, int a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, int32x4_t a18, int8x16_t a19, int8x16_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30)
{
  *(_DWORD *)uint64_t v30 = 0x80000000;
  (*(void (**)(uint64_t))(v31 + 8 * (a12 ^ 0x8C0u)))(a30);
  int v33 = (a12 - 738403596) & 0x7FBFF7FE ^ 0x53BCD106;
  int8x16_t v34 = (int8x16_t)vld1q_dup_f32((const float *)v30);
  v35.i64[0] = 0x8000000080000000;
  v35.i64[1] = 0x8000000080000000;
  v36.i32[0] = *(_DWORD *)(v30 + 4);
  v36.i32[1] = *(_DWORD *)(v30 + 4 * (((v33 + 226207111) & 0xF2845D1C) - 1306));
  v36.i32[2] = *(_DWORD *)(v30 + 12);
  int8x16_t v37 = vextq_s8(v34, v36, 0xCuLL);
  int8x16_t v38 = v36;
  v38.i32[3] = *(_DWORD *)(v30 + 16);
  int32x4_t v39 = (int32x4_t)veorq_s8((int8x16_t)vshrq_n_u32((uint32x4_t)vorrq_s8(vandq_s8(v38, a20), vandq_s8(v37, v35)), 1uLL), *(int8x16_t *)(v30 + 1588));
  v37.i32[0] = *(_DWORD *)(v32 + 4 * (*(_DWORD *)(v30 + 4) & 1));
  v37.i32[1] = *(_DWORD *)(v32 + 4 * (*(_DWORD *)(v30 + 4 * (((v33 + 226207111) & 0xF2845D1C) - 1306)) & 1));
  v37.i32[2] = *(_DWORD *)(v32 + 4 * (*(_DWORD *)(v30 + 12) & 1));
  v37.i32[3] = *(_DWORD *)(v32 + 4 * (v38.i8[12] & 1));
  *(int8x16_t *)uint64_t v30 = veorq_s8((int8x16_t)vaddq_s32(vsubq_s32(v39, (int32x4_t)vandq_s8((int8x16_t)vaddq_s32(v39, v39), a19)), a18), v37);
  return (*(uint64_t (**)(uint64_t))(v31 + 8 * v33))(2890084078);
}

uint64_t sub_100019D38@<X0>(uint64_t a1@<X8>)
{
  unsigned int v5 = 3804331 * (((&v7 | 0x8C3F22A4) - (&v7 & 0x8C3F22A4)) ^ 0x39A3962);
  uint64_t v8 = v2;
  int v7 = v1 - v5 - ((v4 + 251 * (v3 ^ 0x39D) + 1906279050) & 0x4710F0E0) + 1549286566;
  int v9 = (v3 - 774) ^ v5;
  return (*(uint64_t (**)(int *))(a1 + 8 * (v3 + 1228)))(&v7);
}

uint64_t sub_100019DFC()
{
  return sub_100019E08();
}

uint64_t sub_100019E08()
{
  return (*(uint64_t (**)(void))(v0 + 8 * ((1007 * (((STACK[0x4E8] == 0) ^ v1) & 1)) ^ (v1 - 250))))();
}

uint64_t sub_100019E38()
{
  return (*(uint64_t (**)(void))(v1 + 8
                                   * ((19 * (((STACK[0x318] == 0) ^ (v0 + 46)) & 1)) ^ (v0 - 267))))();
}

uint64_t sub_100019E8C()
{
  *(void *)(v6 - 120) = v1;
  *(_DWORD *)(v6 - 128) = v0
                        + ((893471718 - ((v6 - 136) | 0x35414BE6) + ((v6 - 136) | 0xCABEB419)) ^ 0x451BAFDF) * v4
                        + 905;
  *(void *)(v6 - 136) = v5;
  uint64_t v7 = (*(uint64_t (**)(uint64_t))(v2 + 8 * (v0 + 1341)))(v6 - 136);
  return (*(uint64_t (**)(uint64_t))(v2
                                            + 8
                                            * ((118
                                              * (*(_DWORD *)(v6 - 124) > ((v0 + 1558518982) & 0xA31AE6B7 ^ (v3 + 1613)))) ^ v0)))(v7);
}

uint64_t sub_100019F3C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, int a6, uint64_t a7, uint64_t a8)
{
  *(unsigned char *)(*(void *)(a8 + 96) + 1568) = 1;
  return (*(uint64_t (**)(void))(v9
                              + 8
                              * (int)(((*(_DWORD *)(a8 + 72) == a6) * (a5 + ((v8 - 1745093905) & 0xFB7D7FDE) + 504)) ^ v8)))();
}

uint64_t sub_100019F88()
{
  return v0();
}

uint64_t sub_100019F94@<X0>(uint64_t a1@<X8>)
{
  *(unsigned char *)(a1 + v1 - 1919386335) = *(unsigned char *)(v3 + v1 - 1919386335)
                                   - (((v4 ^ 0x6C) - 17) & (2 * *(unsigned char *)(v3 + v1 - 1919386335)))
                                   + 82;
  return (*(uint64_t (**)(void))(v5 + 8 * ((718 * (v1 - 1 == v2)) ^ v4)))();
}

void sub_100019FE4()
{
  STACK[0x4B8] = STACK[0x468];
  JUMPOUT(0x100004A90);
}

uint64_t sub_10001A038@<X0>(int a1@<W8>, uint64_t a2, ...)
{
  va_start(va, a2);
  BOOL v5 = (*(uint64_t (**)(void, char *, void, uint64_t))(v3 + 8 * (int)(v4 + 1613)))(**(unsigned int **)(v2 + 8 * (int)(v4 - 468)), va, (((2 * (v4 ^ 0x68)) ^ 0xFFFFF4F0) & (a1 - 247329192) ^ 0xBFADA3BD)+ ((2 * (a1 - 247329192)) & 0x7F5B4000)+ 1079139395, 1) == 0;
  return (*(uint64_t (**)(void))(v3 + 8 * (((16 * v5) | (32 * v5)) ^ v4)))();
}

uint64_t sub_10001A0C8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v5 = v3 + 127 - v1;
  int8x16_t v6 = vrev64q_s8(*(int8x16_t *)(v5 - 15));
  int8x16_t v7 = vextq_s8(v6, v6, 8uLL);
  int8x16_t v8 = vrev64q_s8(*(int8x16_t *)(v5 - 31));
  int8x16_t v9 = vextq_s8(v8, v8, 8uLL);
  uint64_t v10 = a1 + 127 - v1;
  v11.i64[0] = 0xA4A4A4A4A4A4A4A4;
  v11.i64[1] = 0xA4A4A4A4A4A4A4A4;
  v12.i64[0] = 0x5252525252525252;
  v12.i64[1] = 0x5252525252525252;
  int8x16_t v13 = vrev64q_s8(vaddq_s8(vsubq_s8(v7, vandq_s8(vaddq_s8(v7, v7), v11)), v12));
  *(int8x16_t *)(v10 - 15) = vextq_s8(v13, v13, 8uLL);
  int8x16_t v14 = vrev64q_s8(vaddq_s8(vsubq_s8(v9, vandq_s8(vaddq_s8(v9, v9), v11)), v12));
  *(int8x16_t *)(v10 - 31) = vextq_s8(v14, v14, 8uLL);
  return (*(uint64_t (**)(void))(v4 + 8 * (((v1 == 96) * ((v2 ^ 0x9D) - 630)) ^ v2)))();
}

uint64_t sub_10001A15C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(v3 + 8 * ((1972 * (v2 - a1 >= ((v1 + 336) ^ 0x50DuLL))) ^ v1)))();
}

uint64_t sub_10001A190@<X0>(int a1@<W8>)
{
  *(unsigned char *)(*(void *)(v3 - 0x3D8A64FC11846102) + (v5 - 1847951484 + v2)) = *(unsigned char *)(*(void *)(v3 - 0x3D8A64FC11846102) + (v2 - 1405494217));
  return (*(uint64_t (**)(void))(v4 + 8 * ((606 * (v2 + ((v1 - 978) | 0x402) - 1936 == a1)) ^ (v1 - 439))))();
}

uint64_t sub_10001A204(uint64_t a1, int a2, int a3)
{
  BOOL v6 = v3 > 0x54D0F385;
  if (v6 == a2 + 80145776 < ((a3 - 1713) | 0x82) - 1422980216) {
    BOOL v6 = a2 + 80145776 < v5;
  }
  return (*(uint64_t (**)(void))(v4 + 8 * ((167 * v6) ^ a3)))();
}

uint64_t sub_10001A27C(_DWORD *a1)
{
  unsigned int v1 = 3804331 * ((((2 * a1) | 0xB15C7908) - a1 - 1487813764) ^ 0xD70B2742);
  unsigned int v2 = a1[1] + v1;
  return (*((uint64_t (**)(void))*(&off_10005CE90 + (int)(v2 ^ 0x7F7))
          + (int)((((*a1 ^ v1 ^ 0xBAED03F5) - 1 < 0x63) * (((v2 - 1418) ^ 0xFFFFFF6D) + (v2 ^ 0x566))) ^ v2)))();
}

uint64_t sub_10001A314(int a1, int a2)
{
  int v5 = v3 + v2;
  unsigned int v6 = v3 + v2 + 6914;
  if (v6 <= 0x40) {
    unsigned int v6 = 64;
  }
  return (*(uint64_t (**)(void))(v4
                              + 8
                              * (((a2 + v6 <= ((v5 + 6913) ^ (39 * (a1 ^ 0x7D0)) ^ 0xFFFFFA0E))
                                * (((a1 - 1397) | 0x450) + 2335)) ^ a1)))();
}

uint64_t sub_10001A388(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  int v66 = *(_DWORD *)(a64 + 56);
  *(_DWORD *)(a64 + 56) = v66 + 1;
  return (*(uint64_t (**)(void))(v65
                              + 8
                              * (((2 * (v66 - 1449096113 < (v64 ^ 0xFFFFF90B))) | ((v66 - 1449096113 < (v64 ^ 0xFFFFF90B)) << 9)) ^ (v64 - 1670))))();
}

uint64_t sub_10001A3D0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, int a8@<W8>, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,int a24,char a25)
{
  int v29 = v26 ^ 0x3ED;
  *(&a25 + ((v29 - 463) ^ (a8 + 581)) + v25) = *(unsigned char *)(a15 + v28 - 88873948)
                                                           + (~(2 * *(unsigned char *)(a15 + v28 - 88873948)) | 0x5B)
                                                           + 83;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v27
                                                                                                  + 8 * ((91 * ((a6 + v25 + 1) < 0x40)) ^ v29)))(a1, a2, a3, a4, a5, a6, a7);
}

uint64_t sub_10001A440(uint64_t a1)
{
  return (*(uint64_t (**)(void))(v2 + 8 * (v1 | (8 * (a1 + 1 != v3 + 48)))))();
}

uint64_t sub_10001A524(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  STACK[0x408] = STACK[0x250] - 176;
  STACK[0x390] = a1;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, unint64_t))(v6
                                                                                                  + 8 * ((((v5 ^ 0x2C) - 650) * (STACK[0x2A0] > a1)) ^ v5)))(355645999, a2, a3, a4, a5, a1);
}

uint64_t sub_10001A5C0(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7)
{
  return (*(uint64_t (**)(void))(v8
                              + 8
                              * ((1992
                                * (((*(_DWORD *)(v9 + v7 * (uint64_t)a2 + 32) == a7) ^ (37 * (v10 ^ 0xEA))) & 1)) ^ v10)))();
}

void sub_10001A600()
{
}

uint64_t sub_10001A60C(uint64_t result)
{
  unint64_t v1 = 1178560073 * ((result - 2 * (result & 0x88D88836770F0327) - 0x772777C988F0FCD9) ^ 0x9324D8DECD9B7B45);
  unint64_t v2 = *(void *)(result + 32) - v1;
  unint64_t v3 = *(void *)(result + 16) - v1;
  BOOL v4 = v2 >= v3;
  BOOL v5 = (uint64_t)v2 < (uint64_t)v3;
  int v6 = !v4;
  if (((*(_DWORD *)(result + 40) + 1178560073
                                  * ((result - 2 * (result & 0x770F0327) + 1997472551) ^ 0xCD9B7B45)) & 1) == 0)
    BOOL v5 = v6;
  BOOL v7 = !v5;
  uint64_t v8 = 4;
  if (!v7) {
    uint64_t v8 = 24;
  }
  *(_DWORD *)(result + 8) = *(_DWORD *)(result + 12) ^ (1178560073
                                                      * ((result - 2 * (result & 0x770F0327) + 1997472551) ^ 0xCD9B7B45)) ^ *(_DWORD *)(result + v8) ^ (1178560073 * ((result - 2 * (result & 0x770F0327) + 1997472551) ^ 0xCD9B7B45));
  return result;
}

uint64_t sub_10001A6A0(uint64_t a1)
{
  int v1 = 460628867 * (((a1 | 0x7391008F) - a1 + (a1 & 0x8C6EFF70)) ^ 0x3F0782F2);
  int v2 = *(_DWORD *)(a1 + 8) + v1;
  int v3 = *(_DWORD *)(a1 + 24) + v1;
  int v4 = *(_DWORD *)(*(void *)(a1 + 16) - 0x4C6937770F4864B4);
  unsigned int v6 = v4 - 293522565;
  BOOL v5 = v4 - 293522565 < 0;
  unsigned int v7 = 293522565 - v4;
  if (!v5) {
    unsigned int v7 = v6;
  }
  return (*((uint64_t (**)(void))*(&off_10005CE90 + v2 - 1868)
          + ((51 * (((v2 - 127) ^ ((v3 - 1134880257) < 4 * (unint64_t)v7)) & 1)) ^ v2)))();
}

uint64_t sub_10001A778@<X0>(int a1@<W1>, uint64_t a2@<X8>)
{
  return (*(uint64_t (**)(void))(v2 + 8 * (a1 | ((a2 + 1 == v3 + 44) << 8))))();
}

uint64_t sub_10001A838@<X0>(int a1@<W4>, uint64_t a2@<X8>)
{
  return (*(uint64_t (**)(void))(v2 + 8 * ((459 * (a2 + 1 != v3 + 64)) ^ a1)))();
}

uint64_t sub_10001A904()
{
  STACK[0x248] = (unint64_t)&STACK[0x54240281ACF5660D];
  STACK[0x240] = (unint64_t)&STACK[0x257CFFE2D3AC1965];
  STACK[0x238] = (unint64_t)&STACK[0x39AF297A7BF74D23];
  STACK[0x230] = (unint64_t)&STACK[0x1DF44763245EAB60];
  int v4 = 235795823 * ((((v3 - 200) | 0x8F6D0B6B) - (v3 - 200) + ((v3 - 200) & 0x7092F490)) ^ 0x1BC04232);
  *(void *)(v3 - 192) = &STACK[0x440C6379540E0A01];
  *(_WORD *)(v3 - 200) = 5141 - v4;
  *(_DWORD *)(v3 - 180) = v0 - v4 + 594;
  uint64_t v5 = (*(uint64_t (**)(uint64_t))(v2 + 8 * (v0 ^ 0x9E6)))(v3 - 200);
  int v6 = LOBYTE(STACK[0x4A7]);
  int v7 = (LOBYTE(STACK[0x4A4]) << 24) | (LOBYTE(STACK[0x4A5]) << 16) | (LOBYTE(STACK[0x4A6]) << 8) | v6;
  LODWORD(STACK[0x38C]) = v7 - ((v7 & 0x400DE87D ^ v6 & 0x11111111) << ((v0 + 53) ^ 0xF0)) + 1074653292;
  BOOL v8 = (STACK[0x35C] & ((v0 ^ 0x74D) - 1769)) == 0;
  uint64_t v9 = *(uint64_t (**)(uint64_t))(v2 + 8 * ((v8 | (2 * v8)) ^ v0));
  LODWORD(STACK[0x2AC]) = v1;
  LODWORD(STACK[0x2A8]) = v1;
  return v9(v5);
}

uint64_t sub_10001AC38@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, int a7@<W8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v7
                                                                                         + 8
                                                                                         * ((((((((a7 + 763) | 0x11)
                                                                                               - 821) | 0x202)
                                                                                             + 9) ^ (2 * ((a7 + 763) | 0x11)) ^ 0xB88)
                                                                                           * (v8 == 0)) ^ (((a7 + 763) | 0x11) + 957))))(a1, a2, a3, a4, a5, a6);
}

void sub_10001AC8C(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>, uint64_t a4, int a5, int a6, uint64_t a7, int a8, uint64_t a9)
{
  *(_DWORD *)(*(void *)(a1 + 96) + 800) = 1255422628;
  *(_DWORD *)(*(void *)(a1 + 96) + 804) = 293522565;
  *(void *)(*(void *)(a1 + 96) + 808) = *(void *)(a1 + 96) + 816;
  uint64_t v10 = *(void *)(a1 + 96) + 0x4C6937770F4867D8;
  int v11 = 460628867 * ((&a5 + 1137917537 - 2 * ((unint64_t)&a5 & 0x43D33E61)) ^ 0xF45BC1C);
  a9 = *(void *)(a2 + 8) + (*(_DWORD *)(a2 + 4) - v9);
  a8 = (v9 - 913435166) ^ v11;
  a7 = v10;
  a6 = v11 + 1970;
  (*(void (**)(int *))(a3 + 16776))(&a5);
  JUMPOUT(0x100042600);
}

uint64_t sub_10001AC94(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, int a16, int a17, uint64_t a18, unint64_t *a19, int a20,unsigned int a21)
{
  int v22 = 1755732067 * ((&a16 + 1504961492 - 2 * ((unint64_t)&a16 & 0x59B3E3D4)) ^ 0x87755E0F);
  a17 = v22 ^ 0x39C8F867;
  a20 = v22 ^ 0x7F7DFDA0;
  a21 = v22 ^ 0x85DB490F;
  a18 = a13;
  a19 = &STACK[0x3842FAF4B7C49F27];
  uint64_t v23 = (*(uint64_t (**)(int *))(v21 + 17192))(&a16);
  return (*(uint64_t (**)(uint64_t))(v21 + 8 * ((101 * (a16 == -1158872075)) ^ 0xBFu)))(v23);
}

uint64_t sub_10001AD80@<X0>(uint64_t a1@<X1>, int a2@<W8>)
{
  uint64_t v4 = v2;
  unint64_t v5 = v2 + a1;
  if (v5 <= 0x38) {
    unint64_t v5 = 56;
  }
  return (*(uint64_t (**)(void))(v3
                              + 8
                              * (((v5 - v4 + ((175 * (a2 ^ 0x5E2u)) ^ 0x9ACA2DALL) < 8) * (((a2 - 1359) | 0x420) - 203)) ^ a2)))();
}

uint64_t sub_10001ADE8(uint64_t result, uint64_t a2, uint64_t a3, int a4)
{
  *(_DWORD *)(result + 24) = a4;
  return result;
}

uint64_t sub_10001ADF4(uint64_t a1)
{
  unsigned int v5 = *(unsigned __int8 *)(v1 + (v3 + 1));
  uint64_t v6 = ((2 * v5) & 0x17A) + (v5 ^ 0x49BFDFBD);
  return (*(uint64_t (**)(uint64_t, uint64_t, void))(v2
                                                             + 8
                                                             * (int)((((v4 - 1397919450) & 0x53528FCB ^ 0x256)
                                                                    * ((v5 >> 7) ^ 1)) ^ v4)))(a1, v6, (v6 - 8915092));
}

uint64_t sub_10001AE68()
{
  return (*(uint64_t (**)(void))(v2
                              + 8
                              * (((((v0 ^ 0x7EA) + 4) ^ v0 ^ 0x7EA) * (4 * v1 - LODWORD(STACK[0x288]) == 96081028)) ^ v0)))();
}

uint64_t sub_10001AEB0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,int a35)
{
  _DWORD *v37 = v37[623];
  return (*(uint64_t (**)(void))(v38 + 8 * ((1393 * (a35 + v40 == v39)) ^ (v36 + v35 + 103))))();
}

uint64_t sub_10001AFCC()
{
  return (*(uint64_t (**)(void))(v2 + 8 * (((((v1 - 1680) | 0x582) ^ 0x5B3) * (v0 == 64)) ^ v1)))();
}

uint64_t sub_10001B004(uint64_t a1, uint64_t a2, uint64_t a3, int a4, int a5)
{
  *(unsigned char *)(a1 + (a5 + v5 + 1777)) = *(unsigned char *)(v7 + (a5 + v5 + 1777));
  return (*(uint64_t (**)(void))(v8 + 8 * ((100 * (((v5 - 1 == a4) ^ (v6 + 126)) & 1)) ^ (v6 - 1633))))();
}

uint64_t sub_10001B05C()
{
  return (*(uint64_t (**)(void))(v3 + 8 * ((((v1 - 1492) ^ 0x3A) * (v2 == v0)) ^ v1)))();
}

uint64_t sub_10001B098(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(v8
                                                     + 8
                                                     * (((8 * ((a5 + 1 + v7) < 0x50)) | (16 * ((a5 + 1 + v7) < 0x50))) ^ v6)))(v5, a4);
}

uint64_t sub_10001B164()
{
  return (*(uint64_t (**)(void))(v2 + 8 * ((197 * (((v0 == (v1 ^ 0x28550A41)) ^ (v1 + 1)) & 1)) ^ v1)))();
}

uint64_t sub_10001B1C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,int a35,__int16 a36,char a37,char a38,int a39)
{
  if (BYTE4(a16) == 2) {
    return (*(uint64_t (**)(uint64_t))(v39
  }
                                              + 8
                                              * ((880 * (a39 != a4 + a5 + 1049205410)) ^ ((int)a4 + (int)a5))))(324658922);
  if (BYTE4(a16) == 1) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v39
  }
                                                                + 8
                                                                * (int)(((a39 != 1049205778) * ((a4 ^ (a4 + 176)) + 445)) ^ (a4 + a5))))(324658922, a2, a9);
  unint64_t v41 = ((unint64_t)&a22 ^ 0x2B7DD3FFFFD74DD0)
      + ((2 * (void)&a22) & 0x56FBA7FFFFAE9BA0)
      - 0x91102C2440401C0;
  a38 = ((v41 + ((a4 - 15) ^ 0x2B)) ^ 0xBA) * (v41 + 1);
  return (*(uint64_t (**)(void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v39 + 4488))(*(void *)(v39 + 4488), 324658714, a9, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27);
}

uint64_t sub_10001B358@<X0>(int a1@<W0>, int a2@<W1>, int a3@<W2>, int a4@<W3>, int a5@<W5>, int a6@<W8>, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54)
{
  *(void *)(v60 - 128) = v54 - 7;
  *(void *)(v60 - 136) = *(void *)(v60 - 120) - 7;
  *(_DWORD *)(v60 - 148) = v58 & 0xFFFFFFF8;
  *(_DWORD *)(v60 - 140) = a5 - (v58 & 0xFFFFFFF8) + 8;
  int v61 = a3 + a2 + a1;
  char v62 = v61 + v59 - a5;
  unsigned int v63 = v61 + a4 - a5;
  v65.val[0].i64[0] = v63 & 0xF;
  v65.val[0].i64[1] = (v62 + 13) & 0xF;
  v65.val[1].i64[0] = (v62 + 12) & 0xF;
  v65.val[1].i64[1] = (v62 + 11) & 0xF;
  v65.val[2].i64[0] = (v62 + 10) & 0xF;
  v65.val[2].i64[1] = (v62 + ((127 * (a6 ^ 0xB1)) ^ 0x55)) & 0xF;
  v65.val[3].i64[0] = (v62 + 8) & 0xF;
  v65.val[3].i64[1] = (v62 + 7) & 0xF;
  *(int8x8_t *)(*(void *)(v60 - 136) + v63) = veor_s8(veor_s8(veor_s8(*(int8x8_t *)(v55 + v65.val[0].i64[0] - 7), *(int8x8_t *)(*(void *)(v60 - 128) + v63)), veor_s8(*(int8x8_t *)(v57 + v65.val[0].i64[0] - 7), *(int8x8_t *)(v65.val[0].i64[0] + v56 - 6))), vrev64_s8(vmul_s8((int8x8_t)*(_OWORD *)&vqtbl4q_s8(v65, (int8x16_t)xmmword_100056DA0), (int8x8_t)0x1717171717171717)));
  return (*(uint64_t (**)(__n128))(a54 + 8 * ((1530 * (*(_DWORD *)(v60 - 140) == 0)) ^ a6)))((__n128)xmmword_100056DA0);
}

uint64_t sub_10001B4BC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, unsigned int a4@<W8>)
{
  if ((a4 & 0x20) != 0) {
    int v8 = 1678813233;
  }
  else {
    int v8 = 1678813230;
  }
  LODWORD(STACK[0x37C]) = v8;
  if (v5 > 974561828)
  {
    if (v5 == 974561829 || v5 == 2062192291) {
      goto LABEL_16;
    }
    int v9 = 1428359214;
  }
  else
  {
    if (v5 == -484083700 || v5 == 509428767) {
      goto LABEL_16;
    }
    int v9 = 624178969;
  }
  if (v5 == v9)
  {
LABEL_16:
    *(_OWORD *)&STACK[0x1830] = xmmword_100056D70;
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v6
                                                                         + 8
                                                                         * (int)((((v4 ^ 0x6E3) - 3) * ((a4 >> 5) & 1)) ^ (v4 - 1407))))(a1, a2, a3, 1158830124);
  }
  if ((((v7 ^ 0x8E) - 1661) & a4) != 0) {
    int v10 = 1678813230;
  }
  else {
    int v10 = 1678813229;
  }
  LODWORD(STACK[0x2B8]) = v10;
  LODWORD(STACK[0x288]) = 1471272300;
  LODWORD(STACK[0x290]) = 313952552;
  return sub_10003EAFC();
}

uint64_t sub_10001B5F0@<X0>(int a1@<W1>, int a2@<W4>, uint64_t a3@<X6>, int a4@<W8>, int8x16_t a5@<Q3>, int8x16_t a6@<Q4>)
{
  int8x16_t *v7 = vaddq_s8(vaddq_s8(*(int8x16_t *)(a3 + (v6 + a1)), a6), vmvnq_s8(vandq_s8(vaddq_s8(*(int8x16_t *)(a3 + (v6 + a1)), *(int8x16_t *)(a3 + (v6 + a1))), a5)));
  return (*(uint64_t (**)(void))(v8 + 8 * (a2 + a4 + 95)))();
}

uint64_t sub_10001B644(uint64_t a1, int a2)
{
  unsigned int v5 = ((a2 - 744) ^ 0x627A62AB) + v4;
  BOOL v6 = v5 < 0xA4F71292;
  BOOL v7 = v5 > v2 + 684940409;
  if ((v2 + 684940409) < 0xA4F71292 != v6) {
    BOOL v7 = v6;
  }
  return (*(uint64_t (**)(void))(v3 + 8 * ((v7 * (((a2 - 1315) | 0x149) ^ 0x137)) ^ a2)))();
}

uint64_t sub_10001B6C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  *(unsigned char *)(v9 + a2 + a7 + v8 - 71) = v10;
  return (*(uint64_t (**)(void))(v12 + 8 * ((((unint64_t)(v9 + a2) < 0x38) * v11) ^ v7)))();
}

uint64_t sub_10001B6F0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, int a9@<W8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35)
{
  int v38 = a9 + 1;
  *(unsigned char *)(a7 + (v38 + a3)) = *(unsigned char *)(a35 + v37 + (a4 ^ (2 * v35)) - 1875169944);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v36 + 8 * ((220 * ((a3 + v38 + 1) > 0x3F)) ^ v35)))(a1, a2, a3, a4, a5, a6, a7, a8, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19, a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27);
}

uint64_t sub_10001B6F8()
{
  return (*(uint64_t (**)(void))(v2
                              + 8
                              * ((62
                                * ((((v0 + 1109) ^ 0x6E1 ^ (v0 - 1618211364) & 0x6073F398) & *(_DWORD *)(v1 - 0x3D8A64FC118460EELL)) != 0)) ^ v0)))();
}

uint64_t sub_10001B754()
{
  BOOL v4 = v3 + 820205043 < (int)(v1 + 1879904767);
  if (v1 > 0xFF2EE00 != v3 + 820205043 < -267578881) {
    BOOL v4 = v1 > 0xFF2EE00;
  }
  return (*(uint64_t (**)(void))(v2
                              + 8
                              * (((((13 * (v0 ^ 0x7C)) ^ v4) & 1) * (303 * (v0 ^ 0x179) - 374)) ^ v0)))();
}

uint64_t sub_10001B7E0()
{
  (*(void (**)(void))(v1 + 8 * (v0 + 346)))();
  return (*(uint64_t (**)(void))(v1 + 8 * (((8 * (STACK[0x4A8] != 0)) | (16 * (STACK[0x4A8] != 0))) ^ (v0 - 132))))();
}

void sub_10001B818(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,int a27,int a28)
{
  LODWORD(STACK[0x300]) = (a6 ^ v29)
                        + (a28 ^ v29)
                        + v29
                        - ((((a6 ^ v29) + (a28 ^ v29)) << ((v28 + 75) & 0x6F ^ 0x47)) & v30);
  sub_10000CD18();
}

uint64_t sub_10001B860()
{
  BOOL v3 = v0 > LODWORD(STACK[0x260]) + (STACK[0x258] & 0x343B6FB7) - 1807201481;
  return (*(uint64_t (**)(void))(v2 + 8 * (((8 * v3) | (16 * v3)) ^ (v1 + 154))))();
}

uint64_t sub_10001B8AC()
{
  return (*(uint64_t (**)(void))(v3
                              + 8
                              * (int)((((((2 * v2) ^ 0x500) + 1644678033) & 0x9DF837DE ^ 0x61A) * (v0 == v1)) ^ v2)))();
}

uint64_t sub_10001B8F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,int a21)
{
  return (*(uint64_t (**)(void))(v22 + 8 * (((a21 == 363543239) * (7 * (v21 ^ 0x1DF) + 1468)) ^ v21)))();
}

void sub_10001B944(uint64_t a1, uint64_t a2)
{
  if (a1) {
    BOOL v2 = a2 == 0;
  }
  else {
    BOOL v2 = 1;
  }
  int v3 = !v2;
  __asm { BRAA            X8, X17 }
}

uint64_t sub_10001B9B8(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  return (*(uint64_t (**)(void))(v15
                              + 8 * (((a4 + v16 + v13 - 285 + 57) * ((unint64_t)(a13 + a3 - v14) > 0xF)) ^ v13)))();
}

uint64_t sub_10001B9F4@<X0>(int a1@<W1>, int a2@<W3>, uint64_t a3@<X8>)
{
  unsigned int v10 = v9 + v8 + a1;
  uint64_t v11 = v4 + v10;
  long long v12 = *(_OWORD *)(v11 - 31);
  uint64_t v13 = a3 + v10;
  *(_OWORD *)(v13 - 15) = *(_OWORD *)(v11 - 15);
  *(_OWORD *)(v13 - 31) = v12;
  return (*(uint64_t (**)(void))(v3 + 8 * ((((v7 & 0xFFFFFFE0) == 32) * ((a2 - v5) ^ 0x55F)) | (v6 + a2 + 1495))))();
}

uint64_t sub_10001BA50(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 8) - 1755732067 * ((a1 & 0xE52700F6 | ~(a1 | 0xE52700F6)) ^ 0xC41E42D2);
  uint64_t v2 = *(void *)a1;
  uint64_t v3 = *(void *)(a1 + 16);
  unsigned int v5 = v1
     - 1178560073
     * (((&v5 | 0xE1E865C5) - &v5 + (&v5 & 0x1E179A38)) ^ 0x5B7C1DA7)
     + 1882359242;
  uint64_t v6 = v2;
  uint64_t v7 = v3;
  return (*((uint64_t (**)(unsigned int *))*(&off_10005CE90 + (int)(v1 ^ 0x8FCD81A4)) + (int)(v1 ^ 0x8FCD8942)))(&v5);
}

uint64_t sub_10001BB58@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, int a5@<W8>, uint64_t a6, uint64_t a7, unint64_t a8)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v8 + 8 * ((a8 + 4 >= a8) ^ (a5 + 949))))(a1, a2, a3, a4);
}

uint64_t sub_10001BBC8()
{
  return (*(uint64_t (**)(void))(v4
                              + 8
                              * ((1974
                                * ((((v3 + 185) ^ (v1 - 683)) & (2 * (*(unsigned __int8 *)(v2 + 6) - 1)))
                                 + ((*(unsigned __int8 *)(v2 + 6) - 1) ^ v0) == v0)) ^ v3)))();
}

uint64_t sub_10001BC0C@<X0>(uint64_t a1@<X8>, uint64_t a2, uint64_t a3, uint64_t a4, int a5, int a6)
{
  *(_DWORD *)(a1 - 0x462410CFA83B5FEFLL) = a6;
  return (*(uint64_t (**)(void))(v8
                              + 8
                              * (int)((((((_BYTE)v6 - 43) & 0xFD ^ (*(void *)(v7 + 24) == 0x7CE89A2E9B2054D0)) & 1)
                                     * ((((v6 + 2044511445) & 0x86233EFD) - 1049) ^ 0x243)) ^ (v6 + 2044511445) & 0x86233EFD)))();
}

uint64_t sub_10001BC88(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12, int a13)
{
  uint64_t v20 = (a5 - 468524091) & 0x1BED1F0B;
  int v15 = 1755732067 * ((738867677 - ((v14 - 120) | 0x2C0A39DD) + ((v14 - 120) | 0xD3F5C622)) ^ 0xD337BF9);
  *(void *)(v14 - 120) = a10;
  *(_DWORD *)(v14 - 112) = v15 + a5 + 241;
  *(_DWORD *)(v14 - 108) = a13 - v15 + ((a5 - 1316421434) | 0x4008880) + 726552427;
  uint64_t v17 = (*(uint64_t (**)(uint64_t))(v13 + 8 * (a5 + 2042)))(v14 - 120);
  uint64_t v18 = *(unsigned int *)(v14 - 152) & (v20 ^ 0x334);
  *(unsigned char *)(v14 - 220 + (v18 ^ 0x20)) = -46;
  return (*(uint64_t (**)(uint64_t))(v13 + 8 * ((951 * ((v18 ^ 0x20) > 0x37)) ^ a5)))(v17);
}

uint64_t sub_10001BDB8(uint64_t a1, int a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,int a30,int a31)
{
  return (*(uint64_t (**)(void))(v31 + 8 * ((23 * (a31 + a3 + ((a2 - 5) ^ 0x2A9u) > 0xFFFFFFFA)) ^ (a2 + 1289))))();
}

void sub_10001BE08()
{
}

uint64_t sub_10001BE2C()
{
  return sub_10001BE48();
}

uint64_t sub_10001BE48()
{
  return (*(uint64_t (**)(void))(v1 + 8 * v0))();
}

uint64_t sub_10001BEBC(uint64_t a1)
{
  int v2 = 108757529 * (a1 ^ 0xE09C622B);
  int v3 = *(_DWORD *)(a1 + 24) ^ v2;
  int v4 = *(_DWORD *)(a1 + 8);
  unsigned int v5 = 235795823 * ((1211322473 - (v35 | 0x48335069) + (v35 | 0xB7CCAF96)) ^ 0x2361E6CF);
  uint64_t v22 = &STACK[0x1FA9E8BAFD93FC60];
  int v38 = &STACK[0x1FA9E8BAFD93FC60];
  unsigned int v36 = v5 + 832817738;
  int v37 = v3 - v5 + 1172345365;
  int v6 = (void (*)(unsigned char *))*((void *)*(&off_10005CE90 + (v3 ^ 0xCA)) + v3 + 2038);
  unint64_t v15 = 108757529 * (a1 ^ 0xE75B6218E09C622BLL);
  int v7 = v4 + v2;
  v6(v35);
  int v31 = v7 - 127554155;
  int v14 = v7 - 2004786753;
  int v17 = v7 - 1881050563;
  int v16 = v7 - 688763679;
  char v28 = &v34;
  long long v12 = (char *)&v11[-40576908] + 1;
  unsigned int v18 = (v3 + 1009808264) & 0xC3CF8EBF;
  int v27 = v3 - 1723333327;
  int v24 = (v3 - 1723333327) & 0x66B7FBE9 ^ 0x16F;
  int v13 = (4 * v3) ^ 0x10C;
  int v30 = v3 ^ 0x386BAA0B;
  int v26 = 310 * (v3 ^ 0x42);
  int v23 = (v26 - 1229978848) & 0x494FFCDE;
  int v25 = v23 ^ 0x499;
  v11[3] = v3 - 1137793690;
  uint64_t v32 = (v3 - 1137793690);
  uint64_t v33 = v32;
  int v29 = v3;
  int32x4_t v20 = vdupq_n_s32(0xBAED03F5);
  int32x4_t v21 = vdupq_n_s32(0x75DA07EAu);
  uint64_t v19 = a1;
  return sub_1000189A0(1433, v8, v9, 71);
}

uint64_t sub_10001C174@<X0>(int a1@<W0>, uint64_t a2@<X8>)
{
  return sub_10001C1C8(a1 ^ 0x491u, v2 - 0x4C6937770F4864B0, a2 - 0x4C6937770F4864B0, 0xFFF97FBF1BDBBFFELL, 0x6E5FFEF5FDBDF074, 1283);
}

uint64_t sub_10001C1C8(unsigned int a1, void *a2, void *a3, uint64_t a4, uint64_t a5, int a6)
{
  BOOL v18 = v17 > v11;
  uint64_t v19 = 4 * (v14 + v12);
  int v20 = v10 + v6 + (*(_DWORD *)(*a2 + v19) ^ v13) + 49;
  *(_DWORD *)(*a3 + v19) = v20 + ((a1 + 675) ^ (v13 + 276)) - (v16 & (2 * v20));
  int v21 = v14 + 1 + v7;
  LODWORD(v19) = v18 ^ (v21 < v8);
  BOOL v22 = v21 < v9;
  if (!v19) {
    BOOL v18 = v22;
  }
  return (*(uint64_t (**)(void))(v15 + 8 * ((v18 * a6) ^ a1)))();
}

uint64_t sub_10001C250(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t (*a55)(void))
{
  STACK[0x4D8] = v55;
  STACK[0x4D0] = STACK[0x2A0];
  return a55();
}

uint64_t sub_10001C268@<X0>(uint64_t a1@<X1>, unsigned int a2@<W8>)
{
  return (*(uint64_t (**)(void))(v2 + 8 * ((781 * (**(unsigned char **)(a1 + 8) == 0)) ^ a2)))();
}

uint64_t sub_10001C290@<X0>(int a1@<W8>)
{
  BOOL v3 = (v1 ^ 0x1Fu) >= (a1 ^ 0x347u) - 1434;
  return (*(uint64_t (**)(void))(v2 + 8 * ((v3 | (16 * v3)) ^ a1)))();
}

uint64_t sub_10001C2C0@<X0>(uint64_t a1@<X8>)
{
  return (*(uint64_t (**)(void))(v2
                              + 8
                              * ((((*(_DWORD *)(a1 + 532) - 293522566) < 0x7FFFFFFF) * (v1 + 1464)) ^ v1)))();
}

uint64_t sub_10001C2FC@<X0>(uint64_t a1@<X5>, int a2@<W6>, uint64_t a3@<X8>)
{
  unsigned int v11 = v4 - 1;
  uint64_t v12 = v11 & 0xF;
  *(unsigned char *)(a3 + v11) = *(unsigned char *)(a1 + v11) ^ (v12 * v6) ^ *(unsigned char *)(*(void *)(v10 + 8 * v5) + v12) ^ *(unsigned char *)(*(void *)(v10 + 8 * (a2 - 866)) + v12 - 2) ^ *(unsigned char *)(*(void *)(v10 + 8 * (a2 - 870)) + v12 + (v3 ^ v7) - 12) ^ v8;
  return (*(uint64_t (**)(void))(v9 + 8 * (((2 * (v11 == 0)) | ((v11 == 0) << 6)) ^ a2)))();
}

uint64_t sub_10001C304@<X0>(int a1@<W8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
  int v40 = a1 ^ 0x22E;
  int v41 = v40 - v37 + 511;
  *(_DWORD *)uint64_t v38 = 0x80000000;
  (*(void (**)(uint64_t))(v39 + 8 * (v40 ^ 0x826)))(a32);
  int8x16_t v42 = (int8x16_t)vld1q_dup_f32((const float *)v38);
  v43.i64[0] = 0x8000000080000000;
  v43.i64[1] = 0x8000000080000000;
  v44.i64[0] = *(void *)(v38 + 4);
  v44.i32[2] = *(_DWORD *)(v38 + 12);
  int8x16_t v45 = vextq_s8(v42, v44, 0xCuLL);
  int8x16_t v46 = v44;
  v46.i32[3] = *(_DWORD *)(v38 + 16);
  int32x4_t v47 = (int32x4_t)veorq_s8((int8x16_t)vshrq_n_u32((uint32x4_t)vorrq_s8(vandq_s8(v46, (int8x16_t)vdupq_n_s32(0x7FFFFFFEu)), vandq_s8(v45, v43)), 1uLL), *(int8x16_t *)(v38 + 1588));
  v45.i32[0] = *((_DWORD *)&a37 + (*(_DWORD *)(v38 + 4) & 1));
  v45.i32[1] = *((_DWORD *)&a37 + (*(_DWORD *)(v38 + 8) & 1));
  v45.i32[2] = *((_DWORD *)&a37 + (*(_DWORD *)(v38 + 12) & 1));
  v45.i32[3] = *((_DWORD *)&a37 + (v46.i8[12] & 1));
  *(int8x16_t *)uint64_t v38 = veorq_s8((int8x16_t)vaddq_s32(vsubq_s32(v47, (int32x4_t)vandq_s8((int8x16_t)vaddq_s32(v47, v47), (int8x16_t)vdupq_n_s32(0x5C7D671Au))), vdupq_n_s32(0xAE3EB38D)), v45);
  return (*(uint64_t (**)(void))(v39 + 8 * (v41 ^ 0x53BCD3B7)))();
}

uint64_t sub_10001C454()
{
  return (*(uint64_t (**)(void))(v0 + 8 * (v1 ^ (8 * (v2 == ((v1 + 1649743196) & 0x9DAAEBAF ^ 0x12C5ECA9))))))();
}

uint64_t sub_10001C4B4(uint64_t a1, int a2, uint64_t a3)
{
  *(void *)(a3 + v3) = *(void *)(v4 + v3);
  return (*(uint64_t (**)(void))(v8 + 8 * (((a2 != v5) * v6) | v7)))();
}

uint64_t sub_10001C4E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23)
{
  return sub_10002A6E0(a6, a8, a23, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19, a20, a21, a22, a23);
}

uint64_t sub_10001C4EC@<X0>(uint64_t a1@<X8>)
{
  unsigned int v4 = 3804331 * ((((&v6 | 0x251A88C) ^ 0xFFFFFFFE) - (~&v6 | 0xFDAE5773)) ^ 0x720B4CB5);
  int v6 = -569989849 - (v4 + v1) - ((1962695022 - (v1 << (4 * (v3 ^ 0xE1) - 75))) & 0x4710F0E0);
  uint64_t v7 = a1;
  int v8 = (v3 - 797) ^ v4;
  return (*(uint64_t (**)(int *))(v2 + 8 * (v3 + 1205)))(&v6);
}

uint64_t sub_10001C5B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, int a11)
{
  return (*(uint64_t (**)(void))(v11
                              + 8
                              * ((53
                                * (((v12 + 384) ^ 0xA3013C06)
                                 + (a11 ^ 0xDDFFFBB7)
                                 + 2130626046
                                 + ((2 * a11) & 0xBBFFF76E) >= v12 + 2147483439)) ^ v12)))();
}

uint64_t sub_10001C628(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,unsigned int *a56)
{
  uint64_t v58 = (*(uint64_t (**)(void, uint64_t, void))(v56 + 8 * ((v57 ^ 0x44A) + 1405)))(*a56, a2, LODWORD(STACK[0x340]));
  return sub_10001C650(v58);
}

uint64_t sub_10001C650()
{
  *(_DWORD *)(v2 - 200) = 1224239923 * (((~(v2 - 200) & 0xA39E7912) - (~(v2 - 200) | 0xA39E7913)) ^ 0x512D84C4)
                        + 426521240
                        + v1;
  (*(void (**)(uint64_t))(v0 + 8 * (v1 + 318)))(v2 - 200);
  uint64_t result = v4;
  *(_DWORD *)(v4 + 8) = v5;
  return result;
}

uint64_t sub_10001C6FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, unint64_t *a14, uint64_t a15, uint64_t a16, uint64_t a17, unsigned int a18, unint64_t *a19, unint64_t *a20)
{
  a18 = (v20 - 179) ^ (1374699841
                     * ((2 * (&a18 & 0x54F9DA60) - &a18 - 1425660514) ^ 0xC6F23D97));
  a19 = &STACK[0x6A5823FD3C5DCAD4];
  a20 = a14;
  (*(void (**)(unsigned int *))(v22 + 8 * (v20 + 1366)))(&a18);
  a18 = (v20 - 179) ^ (1374699841
                     * (((&a18 | 0xA4701DEF) + (~&a18 | 0x5B8FE210)) ^ 0xC98405E7));
  a19 = &STACK[0x6A5823FD3C5DCAD8];
  a20 = a14;
  (*(void (**)(unsigned int *))(v22 + 8 * (v20 ^ 0x55A)))(&a18);
  a18 = (v20 - 179) ^ (1374699841
                     * (((&a18 | 0x724CF555) - (&a18 & 0x724CF555)) ^ 0x1FB8ED5C));
  a19 = &STACK[0x6A5823FD3C5DCACC];
  a20 = a14;
  (*(void (**)(unsigned int *))(v22 + 8 * (v20 ^ 0x55A)))(&a18);
  a18 = (v20 - 179) ^ (1374699841
                     * ((((2 * &a18) | 0xE28A525E) - &a18 + 247125713) ^ 0x9CB13126));
  a19 = &STACK[0x6A5823FD3C5DCAD0];
  a20 = a14;
  (*(void (**)(unsigned int *))(v22 + 8 * (v20 ^ 0x55A)))(&a18);
  LODWORD(a20) = v20
               - 1755732067 * ((&a18 & 0xF822126F | ~(&a18 | 0xF822126F)) ^ 0xD91B504B)
               + 1008;
  a19 = a14;
  uint64_t v24 = (*(uint64_t (**)(unsigned int *))(v22 + 8 * (v20 ^ 0xAFD)))(&a18);
  return (*(uint64_t (**)(uint64_t))(v22 + 8 * (int)(((a18 == v21) * (v20 ^ v23 ^ 0xF92CC82A)) ^ v20)))(v24);
}

uint64_t sub_10001C920@<X0>(uint64_t a1@<X3>, unsigned int a2@<W4>, uint64_t a3@<X8>)
{
  *(unsigned char *)(a3 + v4 + a1 - 1) = v5;
  return (*(uint64_t (**)(void))(v6
                              + 8
                              * ((168 * (a3 + v4 < (unint64_t)(19 * ((29 * (v3 ^ 0x727)) ^ a2)) - 1)) ^ (29 * (v3 ^ 0x727)))))();
}

uint64_t sub_10001C96C(uint64_t a1, int a2, int a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23)
{
  int v29 = v26 + 1;
  *(_DWORD *)(a23 + 4 * (v27 + 1 + ((v24 + 1065) ^ a2))) = v23;
  BOOL v31 = v29 < a3 && v29 > v25;
  return (*(uint64_t (**)(void))(v28 + 8 * ((v31 * a4) ^ (v24 + 48))))();
}

uint64_t sub_10001C978@<X0>(int a1@<W8>)
{
  return (*(uint64_t (**)(uint64_t))(v3
                                            + 8
                                            * (((((a1 + 4989465) | 0x4104410) ^ (a1 - 402758103) & 0x1C5DFFFF ^ 0x3F5)
                                              * ((v1 ^ 0x15AB3AC3) == v2 - 1844081673)) ^ a1)))(1158830123);
}

uint64_t sub_10001C9EC()
{
  BOOL v4 = (v0 & 0x6B7FDDFE)
     + (v3 ^ v1 & 0x171D87FC ^ 0xB5BFED0F)
     + 1869347294
     + (((v1 & 0x171D87FC) + 129) ^ 0x50F)
     - 623635036 > 0x7FFFFFFE;
  return (*(uint64_t (**)(void))(v2 + 8 * (v4 | (8 * v4) | v1 & 0x171D87FCu)))();
}

uint64_t sub_10001CA68(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return (*(uint64_t (**)(unint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 8 * ((83 * (STACK[0x478] == 0)) ^ (v8 - 1391))))(STACK[0x478], a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_10001CA94@<X0>(uint64_t a1@<X5>, int a2@<W8>, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43)
{
  *(_DWORD *)(v47 + 360) = 1678813230;
  uint64_t v49 = (*(uint64_t (**)(uint64_t, uint64_t, unint64_t *, unint64_t, void, uint64_t, unint64_t *, unint64_t *))(v46 + 8 * (a2 ^ 0xB5D)))(v44, 2, &STACK[0x424], STACK[0x4B8], (v43 - 1228396329), a1, &STACK[0x318], &STACK[0x4A0]);
  int v55 = ((2 * v49) & 0x636FF7BC) + (v49 ^ 0xB1B7FBDE);
  LODWORD(STACK[0x2D0]) = v55 + 2120187896;
  int v56 = STACK[0x2AC];
  if (v55 == -1313342498)
  {
    LODWORD(STACK[0x454]) = 627309824;
    STACK[0x430] = STACK[0x318];
    uint64_t v58 = (LODWORD(STACK[0x4A0]) ^ 0x5BB7DF7B) - 310380626 + ((2 * LODWORD(STACK[0x4A0])) & 0xB76FBEF6);
    STACK[0x360] = STACK[0x280];
    STACK[0x3C0] = v45;
    char v59 = (char *)&STACK[0x5A0] + STACK[0x210];
    uint64_t v60 = v59 - 0x14D7FC5203D8CD9;
    STACK[0x2E0] = (unint64_t)(v59 - 0x14D7FC5203D8CD9);
    STACK[0x300] = (unint64_t)(v59 - 0x14D7FC5203D8C59);
    *(void *)uint64_t v60 = 0x6370646600;
    v60[8] = 1;
    return sub_10001CC98(v49, v50, v51, 1158830124, v52, v53, v54, v58, &STACK[0x474], &STACK[0x334], &STACK[0x4B4], &STACK[0x3B8], a7, a8, a9, a10, a11, a12, a13,
             a14,
             a15,
             a16,
             a17,
             a18,
             a19,
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
             a39,
             a40,
             a41,
             a42,
             a43);
  }
  else if (v55 == -1044907039)
  {
    LODWORD(STACK[0x3CC]) = 1158830285;
    return (*(uint64_t (**)(uint64_t, unint64_t, uint64_t, uint64_t))(v46
                                                                                  + 8
                                                                                  * ((19
                                                                                    * (((STACK[0x318] == 0) ^ (v56 + 46)) & 1)) ^ (v56 - 267))))(v49, STACK[0x318], v51, 1158830124);
  }
  else
  {
    int v61 = 3804331 * ((v48 - 42613452 - 2 * ((v48 - 200) & 0xFD75C5FC)) ^ 0x72D0DE3A);
    *(void *)(v48 - 192) = a23;
    *(_DWORD *)(v48 - 200) = (v55 - ((2 * (v55 + 2120187896) + 533792852) & 0x75DA07EA) + 154470423) ^ v61;
    *(_DWORD *)(v48 - 196) = v56 - v61 + 138;
    uint64_t v62 = (*(uint64_t (**)(uint64_t))(v46 + 8 * (v56 + 319)))(v48 - 200);
    return (*(uint64_t (**)(uint64_t))(v46
                                              + 8
                                              * ((19 * (((STACK[0x318] == 0) ^ (v56 + 46)) & 1)) ^ (v56 - 267))))(v62);
  }
}

uint64_t sub_10001CC98(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8)
{
  int v15 = (v12 - 1419) | 0x209;
  STACK[0x210] = v9;
  STACK[0x408] = v9 + 64;
  uint64_t v16 = (v8 ^ 0x7ECAC778) - 42092040 + ((2 * v8) & 0xE0u);
  STACK[0x298] = (v14 - 200) | 0x538819AE0AA33BE7;
  LODWORD(STACK[0x280]) = 106 * (v10 ^ 0x6FE);
  LODWORD(STACK[0x278]) = v10 + 1982245614;
  int v17 = 25 * (v10 ^ 0x6E2);
  LODWORD(STACK[0x270]) = v17;
  LODWORD(STACK[0x268]) = v17 + 161043678;
  LODWORD(STACK[0x260]) = 265 * (v10 ^ 0x6F7);
  LODWORD(STACK[0x258]) = v10 - 876310643;
  STACK[0x2A0] = STACK[0x4D0];
  LODWORD(STACK[0x200]) = a8;
  BOOL v18 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v11
                                                                                                + 8
                                                                                                * ((1422
                                                                                                  * (((v15 + 1202259078) & 0xB856FEFB ^ ((v15 ^ 0xF) + 881)) == 32)) ^ v15));
  STACK[0x290] = *(void *)(v13 + 8 * (v15 - 775));
  STACK[0x288] = *(void *)(v13 + 8 * ((v12 - 1419) & 0x3E247CA2 | 8u));
  return v18(a1, a2, v16, a4, 3756217471, 763955140, 538749824);
}

uint64_t sub_10001CF44()
{
  int v3 = v1 - ((2 * v1 + 1838174638) & 0x6CED33F2) + v2 + 359 + v2 + 32 - 314656123;
  BOOL v4 = ((2 * v3) & 0x771BBFEE ^ 0x640933E2) + (v3 ^ 0x8DFB460E) + 1199039198 != 50709205;
  return (*(uint64_t (**)(void))(v0 + 8 * (v4 | (8 * v4) | v2)))();
}

uint64_t sub_10001CFD4()
{
  BOOL v4 = v1 - 1819163619 < (int)(v3 + 299791266 + ((v0 - 1449810266) & 0x566A5BFC) + 204);
  if (v3 > 0x6E21881D != v1 - 1819163619 < -1847691294) {
    BOOL v4 = v3 > 0x6E21881D;
  }
  return (*(uint64_t (**)(void))(v2 + 8 * ((7 * v4) ^ v0)))();
}

uint64_t sub_10001D058()
{
  return (*(uint64_t (**)(void))(v2
                              + 8
                              * (((((v0 | 0x48) ^ (*(void *)(v1 + 24) == 0x7CE89A2E9B2054D0)) & 1)
                                * (((v0 | 0x248) - 1049) ^ 0x243)) ^ (v0 | 0x248))))();
}

uint64_t sub_10001D0AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23)
{
  *(void *)(v28 - 120) = a23;
  *(_DWORD *)(v28 - 112) = v23 + ((v28 - 120) ^ 0x8FA51BC6) * v26 + 1030;
  *(void *)(v28 - 104) = v24;
  uint64_t v29 = (*(uint64_t (**)(uint64_t))(v25 + 8 * (v23 + 1466)))(v28 - 120);
  return (*(uint64_t (**)(uint64_t))(v25
                                            + 8
                                            * (((((v23 - 486) | 0x248u) + v27 + *(_DWORD *)(v28 - 108) > 0xDC5BC245)
                                              * (v23 - 537)) ^ v23)))(v29);
}

uint64_t sub_10001D12C()
{
  uint64_t v3 = (*(uint64_t (**)(void))(v2 + 8 * (v1 ^ 0xA8C)))();
  LODWORD(STACK[0x560]) = v0;
  return (*(uint64_t (**)(uint64_t))(v2 + 8 * ((459 * (v0 != (v1 ^ 0xBAED0132))) ^ v1)))(v3);
}

uint64_t sub_10001D210@<X0>(void *a1@<X1>, int a2@<W2>, int a3@<W6>, int a4@<W7>, unint64_t a5@<X8>, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22)
{
  unint64_t v32 = (*(_DWORD *)(a22 + 4 * (v22 + v26)) ^ v23)
      + HIDWORD(a5)
      + v24 * (unint64_t)(*(_DWORD *)(*a1 + 4 * (v22 + v26)) ^ v23);
  *(_DWORD *)(a22 + 4 * (((v31 + a3) & a4 ^ (v26 + 65)) + v22)) = v32 + v23 - (v25 & (2 * v32));
  BOOL v34 = v22 + v27 > v29 || v22 + v27 < a2;
  return (*(uint64_t (**)(void))(v28 + 8 * ((v34 * v30) ^ v31)))();
}

uint64_t sub_10001D288()
{
  int v5 = v2 + 670 + *(unsigned __int8 *)(v3 + 8) - 920;
  return (*(uint64_t (**)(void))(v4 + 8 * ((499 * (((v5 << ((v2 + 19) ^ 9)) & v1) + (v5 ^ v0) == v0)) ^ v2)))();
}

uint64_t sub_10001D2D4(int a1, int a2, int a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8)
{
  return (*(uint64_t (**)(void))(v9 + 8 * (((((7 * (v8 ^ a4 ^ a1)) ^ a2) + a8 == 32) * (v8 ^ a4 ^ a3)) ^ v8 ^ a4)))();
}

uint64_t sub_10001D334(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void))(v9
                                                                                                 + 8
                                                                                                 * ((1016 * ((v8 & 8) == (((((v7 ^ 0x347) + 675) | 0x340) - 1020) ^ v7 ^ 0x15E))) ^ v7 ^ 0x347)))(a1, a2, a3, a4, a5, a6, (v6 - a6));
}

void sub_10001D380()
{
}

uint64_t sub_10001D388@<X0>(int a1@<W1>, int a2@<W4>, int a3@<W8>)
{
  return (*(uint64_t (**)(void))(v5
                              + 8
                              * (((*(_DWORD *)(v6
                                             + ((((v4 ^ 0x52C) - 379123236) & 0x1698F1FF ^ (a2 + 129)) + v3)
                                             * (uint64_t)a1
                                             + 36) == a3)
                                * ((v4 ^ 0x52C) - 534)) ^ v4 ^ 0x52C)))();
}

uint64_t sub_10001D3F8(char a1, int8x16_t a2, int8x8_t a3, int8x8_t a4, uint64_t a5, char a6, int a7, char a8, int a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45)
{
  uint64_t v56 = (a9 + a7 - 8);
  v58.val[0].i64[0] = ((_BYTE)a9 + (_BYTE)a7 - 8) & 0xF;
  v58.val[0].i64[1] = ((_BYTE)a9 + v53 - 8) & 0xF;
  v58.val[1].i64[0] = ((_BYTE)a9 + v52 - 8) & 0xF;
  v58.val[1].i64[1] = ((_BYTE)a9 + a8 - 8) & 0xF;
  v58.val[2].i64[0] = ((_BYTE)a9 + v49 - 8 + (v54 ^ 0xAA)) & 0xF;
  v58.val[2].i64[1] = ((_BYTE)a9 + a6 - 8) & 0xF;
  v58.val[3].i64[0] = ((_BYTE)a9 + v45 - 8) & 0xF;
  v58.val[3].i64[1] = ((_BYTE)a9 + a1 - 8) & 0xF;
  *(int8x8_t *)(*(void *)(v55 - 136) + v56) = vrev64_s8(veor_s8(veor_s8(vrev64_s8(veor_s8(veor_s8(*(int8x8_t *)(v50 + v56), *(int8x8_t *)(v46 + (v56 & 0xF) - 7)), veor_s8(*(int8x8_t *)(v48 + (v56 & 0xF) - 7), *(int8x8_t *)(v47 + (v56 & 0xF) - 7)))), a4), vmul_s8((int8x8_t)*(_OWORD *)&vqtbl4q_s8(v58, a2), a3)));
  return (*(uint64_t (**)(void))(a45 + 8 * ((57 * (a9 != v51 + 8)) ^ *(_DWORD *)(v55 - 124))))();
}

uint64_t sub_10001D420(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8)
{
  int v14 = v8 + 224;
  unsigned int v15 = (v8 + 562103136) | 0x94088080;
  int v16 = v11 + 154969107;
  if ((v11 + 154969107) <= 0x40) {
    int v16 = 64;
  }
  return (*(uint64_t (**)(void))(v12
                              + 8 * (int)(((v15 ^ (v13 + 27)) * ((a8 - v9 - v10 + v16) < 0xF)) | v14)))();
}

uint64_t sub_10001D4B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned int a5)
{
  return (*(uint64_t (**)(void))(v6 + 8 * ((1850 * (v5 + 1 == v7 + 24)) ^ a5)))();
}

uint64_t sub_10001D580@<X0>(uint64_t a1@<X0>, int a2@<W2>, int a3@<W4>, int a4@<W8>)
{
  uint64_t v7 = v4 + ((a2 - 1413) ^ (a3 + 1485));
  long long v8 = *(_OWORD *)(v5 + v7 - 15);
  long long v9 = *(_OWORD *)(v5 + v7 - 31);
  uint64_t v10 = a1 + v7;
  *(_OWORD *)(v10 - 15) = v8;
  *(_OWORD *)(v10 - 31) = v9;
  return (*(uint64_t (**)(void))(v6 + 8 * ((1960 * ((a4 & 0xFFFFFFE0) == 32)) ^ (a2 - 839))))();
}

uint64_t sub_10001D5D8()
{
  return (*(uint64_t (**)(void))(v2 + 8 * (v1 + 4 * (v0 - 1228396394 >= ((v1 - 1396686764) & 0x533FBE6B ^ 0xFFFFFDF5)))))();
}

uint64_t sub_10001D634@<X0>(int a1@<W4>, int a2@<W5>, uint64_t a3@<X8>)
{
  *(unsigned char *)(a3 + (v4 + a1)) = *(unsigned char *)(v3 + (v4 + a1));
  return (*(uint64_t (**)(void))(v7 + 8 * (((v4 - 1 != a2) * v5) ^ (v6 - 1135))))();
}

uint64_t sub_10001D664@<X0>(int a1@<W1>, uint64_t a2@<X2>, int a3@<W3>, char a4@<W7>, int a5@<W8>)
{
  *(unsigned char *)(a2 + v5) = *(unsigned char *)(v8 + (v6 + a1))
                      - (a4 & (2 * *(unsigned char *)(v8 + (v6 + a1))))
                      + 82;
  return (*(uint64_t (**)(void))(v7 + 8 * ((4 * (v5 == 63)) | (16 * (v5 == 63)) | (a3 + a5 + 98))))();
}

void sub_10001D6B0()
{
}

uint64_t sub_10001D6B8@<X0>(int a1@<W8>)
{
  uint64_t v8 = v1 + 1;
  unsigned char *v2 = ((v3 + v8) ^ v5) * (v4 + v8);
  return (*(uint64_t (**)(void))(v7 + 8 * (((v8 != 91) * v6) ^ a1)))();
}

uint64_t sub_10001D6C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26)
{
  *(_DWORD *)(v29 - 200) = 1224239923
                         * (((((v29 - 200) ^ 0x41440848 | 0xA61BD714) ^ 0xFFFFFFFE)
                           - ((v29 - 200) ^ 0xA0181414 | 0x59E428EB)) ^ 0xEC101E74)
                         + 426521240
                         + v26
                         + 1338;
  (*(void (**)(uint64_t))(v28 + 8 * (v26 + 1656)))(v29 - 200);
  LODWORD(STACK[0x288]) = LODWORD(STACK[0x288]) + v27 - 1662;
  LOBYTE(STACK[0x18C4]) = (-103 * ((((2 * (v29 + 56)) | 0x64) - (v29 + 56) + 78) ^ 0x80)) ^ 0x1D;
  *(_DWORD *)(v29 - 176) = (v26 + 117) ^ (1225351577
                                        * ((((2 * (v29 - 200)) | 0xB022F764) - (v29 - 200) + 669942862) ^ 0xA6EEE180));
  *(void *)(v29 - 184) = a25;
  *(void *)(v29 - 200) = a26;
  uint64_t v30 = (*(uint64_t (**)(uint64_t))(v28 + 8 * (v26 ^ 0x9E3)))(v29 - 200);
  LODWORD(STACK[0x464]) = *(_DWORD *)(v29 - 192);
  return sub_10003EAFC(v30);
}

uint64_t sub_10001D7E0@<X0>(int a1@<W1>, int a2@<W8>)
{
  if ((a2 - 363543247) <= 0x10 && ((1 << (a2 + 49)) & 0x14103) != 0) {
    return sub_10001D84C();
  }
  else {
    return (*(uint64_t (**)(void))(v3
  }
                                + 8
                                * ((((*(unsigned char *)(v4 + v2 * (uint64_t)a1 + 40) & 8) == 0)
                                  * ((LODWORD(STACK[0x2AC]) ^ 0x348) + 220)) ^ (LODWORD(STACK[0x2AC]) - 1634))))();
}

uint64_t sub_10001D84C(uint64_t a1, int a2)
{
  return (*(uint64_t (**)(void))(v4
                              + 8
                              * ((v2 + 31) ^ (((((v2 - 1137201419) & 0x43C84ABD ^ (v2 + 1216999397) & 0xB7760DBD ^ 0x431) & *(_DWORD *)(v5 + v3 * (uint64_t)a2 + 40)) != 0) << 6))))();
}

uint64_t sub_10001D8AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,int a27)
{
  return (*(uint64_t (**)(void, void))(v29 + 8 * v27))(a27 & 0x20000000, (v28 - 706));
}

uint64_t sub_10001D930()
{
  BOOL v2 = (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8 * (v0 ^ 0xF3B)))(32, 0x101004023FF3BD5) == 0;
  return (*(uint64_t (**)(void))(v1
                              + 8
                              * ((v2 * (((v0 ^ 0x657) - 255) ^ 0x1EB ^ (((v0 ^ 0x657) - 255) | 0x750) ^ 0x6C3)) ^ v0 ^ 0x657)))();
}

uint64_t sub_10001D9B4@<X0>(int a1@<W8>)
{
  int v6 = a1 - 1256211653;
  int v7 = v2 - 1778;
  if (*v3 + 1853961083 < 0) {
    int v6 = -1424057579 - a1;
  }
  _DWORD *v3 = *v3 - 807349032 + v6;
  int v8 = v1 + 198409217;
  BOOL v9 = v8 < 282332180;
  **(_DWORD **)(v4 - 0x4C6937770F4864B0) = *(_DWORD *)(*(void *)(v4 - 0x4C6937770F4864B0)
                                                       + 4 * ((v7 ^ 0x1320054B) + a1 + 1910541042));
  if (v8 < 282332180) {
    BOOL v9 = v8 > -1865151467;
  }
  return (*(uint64_t (**)(void))(v5 + 8 * ((202 * v9) ^ v7)))();
}

void sub_10001DAA4(int a1@<W8>, int a2, __int16 a3, char a4, char a5, char a6, char a7, char a8, char a9, char a10, char a11, char a12, char a13, char a14, char a15, char a16, char a17, char a18, char a19, char a20,char a21,char a22,char a23,char a24,char a25,char a26,char a27,char a28,char a29,char a30,char a31,char a32,char a33,char a34,char a35,char a36,char a37,char a38,char a39,char a40,char a41,char a42,char a43,char a44,char a45,char a46,char a47,char a48,char a49,char a50,char a51,char a52,char a53)
{
  char v59 = *(unsigned int **)(v57 + 8 * (a1 ^ 0x2B7));
  uint64_t v60 = *(void *)(v57 + 8 * (a1 ^ 0x26B));
  uint64_t v61 = *v59;
  uint64_t v62 = *(unsigned char **)(v60 - 4);
  a4 = *v62 - 7;
  a5 = v62[1] - 7;
  a6 = v62[2] - 7;
  a7 = v62[3] - 7;
  a8 = v62[4] - 7;
  a9 = v62[5] - 7;
  a10 = v62[6] - 7;
  a11 = v62[7] - 7;
  a12 = v62[8] - 7;
  a13 = v62[9] - 7;
  a14 = v62[10] - 7;
  a15 = v62[11] - 7;
  a16 = v62[12] - 7;
  a17 = v62[13] - 7;
  a18 = v62[14] - 7;
  a19 = v62[15] - 7;
  a20 = v62[16] - 7;
  a21 = v62[17] - 7;
  a22 = v62[18] - 7;
  a23 = v62[19] - 7;
  a24 = v62[20] - 7;
  a25 = v62[21] - 7;
  unsigned int v63 = *(unsigned char **)(v60 - 4);
  a26 = v63[22] - 7;
  a27 = v63[23] - 7;
  a28 = v63[24] - 7;
  a29 = v63[25] - 7;
  a30 = v63[26] - 7;
  a31 = v63[27] - 7;
  a32 = v63[28] - 7;
  a33 = v63[29] - 7;
  uint64_t v64 = (*(uint64_t (**)(uint64_t, char *, unsigned int *))(v56 + 8 * (a1 + 1610)))(v61, &a4, v53);
  int v71 = ((2 * v64) & 0xCFEB6C9E) + (v64 ^ 0xE7F5B64F);
  if (v71 == -403327409)
  {
    *(_DWORD *)(v58 + 352) |= v55 - 546;
    *(_DWORD *)(v58 + 52) = 1449096108;
    (*(void (**)(void, uint64_t, uint64_t, uint64_t, uint64_t))(v56 + 8 * (v55 ^ 0xA69)))(*v53, v58 + 340, v58 + 344, v58 + 348, v54);
    sub_10003F75C();
  }
  else
  {
    if (v71 == -403326307)
    {
      uint64_t v72 = *v59;
      int v73 = *(unsigned char **)(*(void *)(v57 + 8 * (v55 ^ 0x27E)) - 4);
      a34 = *v73 - 21;
      a35 = v73[1] - 21;
      a36 = v73[2] - 21;
      a37 = v73[3] - 21;
      a38 = v73[4] - 21;
      a39 = v73[5] - 21;
      a40 = v73[6] - 21;
      a41 = v73[7] - 21;
      a42 = v73[8] - 21;
      a43 = v73[9] - 21;
      a44 = v73[10] - 21;
      a45 = v73[11] - 21;
      a46 = v73[12] - 21;
      a47 = v73[13] - 21;
      a48 = v73[14] - 21;
      a49 = v73[15] - 21;
      a50 = v73[16] - 21;
      a51 = v73[17] - 21;
      a52 = v73[18] - 21;
      a53 = v73[19] - 21;
      uint64_t v64 = (*(uint64_t (**)(uint64_t, char *, unsigned int *))(v56 + 8 * (v55 + 1610)))(v72, &a34, v53);
      int v74 = (2 * v64) & 0xFFFF5B9E;
      int v71 = (v64 ^ 0xFFFFADCF) + 62256765;
    }
    else
    {
      int v74 = 465563133;
    }
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v56
                                                                                          + 8
                                                                                          * ((29
                                                                                            * (((v71 + v74 == 62235724) ^ (v55 + 1)) & 1)) ^ (v55 + 219))))(v64, v65, v66, v67, v68, v69, v70);
  }
}

uint64_t sub_10001DE54(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,int a24,char a25)
{
  *(&a25 + v25 + a6) = 82;
  return (*(uint64_t (**)(void))(v27 + 8 * ((1290 * ((unint64_t)(v25 + a6 + 1) < 0x40)) ^ v26 ^ 0x37C)))();
}

void sub_10001DE98()
{
}

uint64_t sub_10001DF04()
{
  unsigned int v5 = ((v1 & (2 * (*(unsigned __int8 *)(v2 + 3) - 134))) + ((*(unsigned __int8 *)(v2 + 3) - 134) ^ v0) == v0)
     * ((v3 + 731730123) & 0xD462AFED);
  if ((v1 & (2 * (*(unsigned __int8 *)(v2 + 3) - 134))) + ((*(unsigned __int8 *)(v2 + 3) - 134) ^ v0) == v0) {
    ++v5;
  }
  return (*(uint64_t (**)(void))(v4 + 8 * (int)(v5 ^ v3)))();
}

void sub_10001DF58()
{
}

uint64_t sub_10001DF64(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,_DWORD *a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,int a42,int a43)
{
  *a29 = a43 + 1;
  uint64_t v47 = *v45;
  unint64_t v48 = 1178560073
      * ((0xDF04BE4CD67CBC5FLL - ((v46 - 144) | 0xDF04BE4CD67CBC5FLL) + ((v46 - 144) | 0x20FB41B3298343A0)) ^ 0x3B07115B93173BC2);
  *(_DWORD *)(v46 - 104) = -1178560073
                         * ((-696468385 - ((v46 - 144) | 0xD67CBC5F) + ((v46 - 144) | 0x298343A0)) ^ 0x93173BC2);
  int v49 = (v43 + 1219232329) ^ v48;
  *(_DWORD *)(v46 - 132) = v49 ^ 0x8C;
  *(void *)(v46 - 128) = v47 + v48;
  *(_DWORD *)(v46 - 120) = v49;
  *(void *)(v46 - 112) = v48 + 5119;
  *(_DWORD *)(v46 - 144) = (v43 + 1388397614) ^ v48;
  *(_DWORD *)(v46 - 140) = v49 ^ 0xC2;
  uint64_t v50 = (*(uint64_t (**)(uint64_t))(v44 + 8 * (v43 ^ (a4 + 1997))))(v46 - 144);
  return (*(uint64_t (**)(uint64_t))(v44 + 8 * *(int *)(v46 - 136)))(v50);
}

uint64_t sub_10001E058(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7)
{
  return (*(uint64_t (**)(void))(v8 + 8 * ((70 * ((a7 + 1 + v7) < 0x20)) ^ a1)))();
}

uint64_t sub_10001E130()
{
  return (*(uint64_t (**)(void))(v0
                              + 8
                              * ((7
                                * (v1 + v3 - 862 + ((2 * (v3 - 246)) ^ 0xD0E ^ (v2 - 1364)) > 0x7FFFFFFE)) ^ (v3 - 165))))();
}

void sub_10001E188()
{
  unint64_t v3 = STACK[0x2D8];
  int v4 = 235795823 * ((((2 * (v2 - 200)) | 0x95483A3E) - (v2 - 200) + 895214305) ^ 0x5E095446);
  *(_DWORD *)(v2 - 196) = v4 + 832817738;
  *(_DWORD *)(v2 - 192) = 1172345370 - v4 + v1;
  *(void *)(v2 - 184) = v3;
  (*(void (**)(uint64_t))(v0 + 8 * (v1 + 2043)))(v2 - 200);
  STACK[0x518] = *(void *)(v0 + 8 * v1);
  JUMPOUT(0x100044EA0);
}

uint64_t sub_10001E250@<X0>(int a1@<W1>, unsigned int a2@<W2>, char a3@<W3>, int a4@<W6>, uint64_t a5@<X8>, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  int v67 = 5 * (a65 ^ 0x184);
  unint64_t v68 = STACK[0x440];
  unsigned int v69 = *(_DWORD *)(a5 - 0x1FA9E8BAFD93F970 + ((a1 + 1175301970) & 0xFFFFFFFC));
  *(unsigned char *)(v68 + (a1 + 1175301970)) = v69 ^ (v67 - 45);
  *(unsigned char *)(v68 + (a1 + 1175301971)) = (BYTE1(v69) ^ 0xD3) + (a3 | ~(2 * (BYTE1(v69) ^ 0xD3))) + 83;
  *(unsigned char *)(v68 + (a1 + 1175301972)) = (BYTE2(v69) ^ 0xE7) - ((2 * (BYTE2(v69) ^ 0xE7)) & 0xA4) + 82;
  *(unsigned char *)(v68 + (a1 + 1175301973)) = (HIBYTE(v69) ^ 0x2C) - ((v69 >> 23) & 0xA4) + 82;
  unsigned int v70 = *v65 + 421767365;
  BOOL v71 = v70 < a2;
  BOOL v72 = a4 + 1175301970 < v70;
  if (a4 + 1175301970 < a2 != v71) {
    BOOL v72 = v71;
  }
  return (*(uint64_t (**)(void))(v66 + 8 * ((v72 | (4 * v72)) ^ v67)))();
}

void sub_10001E340()
{
  uint64_t v0 = (uint64_t)*(&off_10005CE90
                + ((85 * ((qword_100060158 - dword_100060388) ^ 0xD)) ^ byte_100056C60[byte_100051AD0[(85 * ((qword_100060158 - dword_100060388) ^ 0xD))] ^ 0xBB])
                + 93);
  uint64_t v1 = *(void *)(v0 - 4);
  uint64_t v2 = *(&off_10005CE90
       + ((85 * ((qword_100060158 + v1) ^ 0xD)) ^ byte_100049E60[byte_100056860[(85 * ((qword_100060158 + v1) ^ 0xD))] ^ 0xD1])
       - 45);
  unint64_t v3 = (unint64_t)&v5[v1 + *v2];
  *(void *)(v0 - 4) = 839241301 * (v3 - 0x78A901D92725650DLL);
  void *v2 = 839241301 * (v3 ^ 0x78A901D92725650DLL);
  v6[0] = (1178560073 * ((((2 * v6) | 0xAAB34380) - v6 - 1431937472) ^ 0xEFCDD9A2)) ^ 0x650810FC;
  LOBYTE(v2) = 85 * ((*(_DWORD *)v2 - *(_DWORD *)(v0 - 4)) ^ 0xD);
  uint64_t v4 = (uint64_t)*(&off_10005CE90
                + ((85 * ((qword_100060158 - dword_100060388) ^ 0xD)) ^ byte_100049F60[byte_100056A60[(85 * ((qword_100060158 - dword_100060388) ^ 0xD))] ^ 0xC8])
                - 25);
  (*(void (**)(_DWORD *))(v4
                                   + 8
                                   * ((byte_100056C68[(byte_100051ADC[v2 - 12] ^ 0x11)
                                                                                   - 8] ^ v2)
                                    + 1936)))(v6);
  __asm { BRAA            X8, X17 }
}

uint64_t sub_10001E570(void *a1, unint64_t a2)
{
  STACK[0x478] = a2;
  *a1 = 0xADADADADADADADADLL;
  a1[1] = 0x5252525254525240;
  int v5 = 3804331 * ((-560311296 - ((v4 - 200) | 0xDE9A5400) + ((v4 - 200) | 0x2165ABFF)) ^ 0xAEC0B039);
  *(_DWORD *)(v4 - 200) = v5 - 1582061431;
  *(_DWORD *)(v4 - 192) = v2 - v5 + 1064655508;
  int v6 = *(void (**)(uint64_t))(v3 + 8 * (v2 ^ 0xCF2));
  STACK[0x2A0] = a2;
  v6(v4 - 200);
  LODWORD(STACK[0x2CC]) = 1228396665;
  uint64_t v7 = (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8 * (v2 + 944)))(336, 1925803308);
  STACK[0x458] = v7;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v3
                                                                                         + 8
                                                                                         * (int)(((v7 == 0)
                                                                                                * ((v2 ^ 0x26E)
                                                                                                 + ((v2 + 971746860) & 0xC6144FBD)
                                                                                                 - 2369)) ^ v2)))(v7, v8, v9, v10, v11, v12);
}

void sub_10001E694()
{
}

uint64_t sub_10001E69C@<X0>(int a1@<W8>)
{
  int v4 = a1 + 163;
  if (v2 >= 0) {
    unsigned int v5 = v2;
  }
  else {
    unsigned int v5 = -v2;
  }
  if (v1 >= 0) {
    unsigned int v6 = v1;
  }
  else {
    unsigned int v6 = -v1;
  }
  return (*(uint64_t (**)(void))(v3 + 8 * ((((((v4 - 165) | 2) ^ 0x632) + v4 - 163) * (v5 > v6)) ^ v4)))();
}

uint64_t sub_10001E6E4@<X0>(uint64_t a1@<X8>)
{
  *(unsigned char *)(a1 + (v7 + v5)) = *(unsigned char *)(v4 + (v7 + v5));
  return (*(uint64_t (**)(void))(v1 + 8 * (((v2 + v7 - 1429 == v3) * v6) ^ v2)))(0);
}

uint64_t sub_10001E71C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  *(void *)(v19 - 160) = 0x9908B0DF00000000;
  uint64_t v20 = **(unsigned int **)(v17 + 8 * (v16 ^ 0x419));
  *(void *)(v19 - 120) = a16;
  *(_DWORD *)(v19 - 128) = (v16 + 1029385664) ^ a16;
  *(_DWORD *)(v19 - 112) = (v16 + 1029385463) ^ a16;
  *(void *)(v19 - 152) = v20 ^ a16;
  *(_DWORD *)(v19 - 144) = v16 + 1029385664 - a16 - 76;
  *(_DWORD *)(v19 - 140) = a16 + v16 + 2104631352;
  *(_DWORD *)(v19 - 136) = -(int)a16;
  uint64_t v21 = (*(uint64_t (**)(uint64_t))(v18 + 8 * (v16 + 1114)))(v19 - 152);
  return (*(uint64_t (**)(uint64_t))(v18 + 8 * *(int *)(v19 - 132)))(v21);
}

uint64_t sub_10001E7E8(uint64_t result)
{
  unint64_t v1 = 1374699841
     * (((result ^ 0x1C901A3C001822A1) & 0x1FB61EFE8E9BEAE7 | (result ^ 0xE008E10020040010) & 0xE049E10171641518) ^ 0xF29465304DE83AB8);
  int v2 = *(_DWORD *)(result + 36) + v1;
  int v3 = *(_DWORD *)result ^ v1;
  uint64_t v4 = *(void *)(result + 8);
  unint64_t v5 = v4 - v1;
  int v6 = *(_DWORD *)(result + 32) - v1;
  uint64_t v7 = *(void *)(result + 24);
  unint64_t v8 = v7 - v1;
  int v9 = *(_DWORD *)(result + 4) + v1;
  if (v3) {
    BOOL v10 = v8 > v5;
  }
  else {
    BOOL v10 = v7 == v4;
  }
  if (v10) {
    int v2 = v6;
  }
  *(_DWORD *)(result + 16) = v2 ^ v9;
  return result;
}

uint64_t sub_10001E8A0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = qword_100060158 - qword_100060178 - (void)&v8;
  qword_100060178 = 839241301 * v2 + 0x78A901D92725650DLL;
  qword_100060158 = 839241301 * (v2 ^ 0x78A901D92725650DLL);
  int v3 = *(_DWORD *)(a2 + 4);
  unsigned __int8 v4 = 85 * ((85 * v2 + 13) ^ 0xD ^ qword_100060158);
  uint64_t v5 = (uint64_t)*(&off_10005CE90 + (v4 ^ byte_100056C60[byte_100051AD0[v4] ^ 0x11]) - 63);
  if (v3 == 1228396332) {
    __asm { BRAA            X1, X17 }
  }
  if (v3 == 1228396339)
  {
    int v6 = **(unsigned __int8 **)(a2 + 8) - 9;
    __asm { BRAA            X2, X17 }
  }
  return 4294925278;
}

uint64_t sub_10001EA50(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v3
                                                                       + 8
                                                                       * (((v4 != ((v5 + 505898750) & 0xE1D893FB)
                                                                                + 33258350)
                                                                         * ((v5 - 1369) ^ 0x11A)) ^ v5)))(a1, a2, a3, 2145539100);
}

uint64_t sub_10001EAA8@<X0>(int a1@<W8>)
{
  return (*(uint64_t (**)(void))(v3
                              + 8
                              * (int)((((545 * (v1 ^ 0x37D) + 1705321608) & 0x9A5AD7F7 ^ 0x3B)
                                     * ((a1 + v2 + 893) < 0x7FFFFFFF)) ^ v1)))();
}

uint64_t sub_10001EB08@<X0>(int a1@<W0>, int a2@<W1>, int a3@<W2>, int a4@<W3>, uint64_t a5@<X8>, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39)
{
  *(_DWORD *)(v47 - 124) = v43;
  *(_DWORD *)(v47 - 120) = v46;
  unsigned int v48 = ((a2 - 69) ^ 0xFFFFFB1F) & v43;
  int v49 = -a4;
  *(_DWORD *)(v47 - 136) = v48;
  char v50 = v45 + a3 + a1;
  uint64_t v51 = (v49 + a3 + a1 + v44);
  v53.val[0].i64[0] = ((_BYTE)v49 + (_BYTE)a3 + (_BYTE)a1 + (_BYTE)v44) & 0xF;
  v53.val[0].i64[1] = ((_BYTE)v49 + v42 + ((a2 - 89) ^ 8)) & 0xF;
  v53.val[1].i64[0] = ((_BYTE)v49 + v50 + 10) & 0xF;
  v53.val[1].i64[1] = ((_BYTE)v49 + v50 + 9) & 0xF;
  v53.val[2].i64[0] = ((_BYTE)v49 + v50 + 8) & 0xF;
  v53.val[2].i64[1] = ((_BYTE)v49 + v50 + 7) & 0xF;
  v53.val[3].i64[0] = ((_BYTE)v49 + v50 + 6) & 0xF;
  v53.val[3].i64[1] = ((_BYTE)v49 + v50 + 5) & 0xF;
  *(int8x8_t *)(a5 - 7 + v51) = veor_s8(veor_s8(veor_s8(*(int8x8_t *)(v41 + (v51 & 0xF) - 7), *(int8x8_t *)(a5 - 7 + v51)), veor_s8(*(int8x8_t *)((v51 & 0xF) + v39 - 5), *(int8x8_t *)((v51 & 0xF) + v40 - 3))), vrev64_s8(vmul_s8((int8x8_t)*(_OWORD *)&vqtbl4q_s8(v53, (int8x16_t)xmmword_100056DA0), (int8x8_t)0x7777777777777777)));
  return (*(uint64_t (**)(__n128))(a39 + 8 * ((459 * (v49 != 8 - v48)) ^ (a2 - 69))))((__n128)xmmword_100056DA0);
}

uint64_t sub_10001EC3C()
{
  return (*(uint64_t (**)(void))(v0 + 8 * ((v3 - 1404883559) ^ (32 * (v2 >= v1)))))();
}

uint64_t sub_10001EC6C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  unint64_t v12 = ((unint64_t)&a9 ^ 0x6FEFC7FBF1FDFFFFLL)
      - 0x44D46A90105252ELL
      + ((2 * (void)&a9) & 0xDFDF8FF7E3FBFFF0);
  a9 = v10 - 1;
  *(unsigned char *)(a2 + a9) = (v12 + ((16 * v9) ^ 0x20)) * ((v12 + 47) ^ 0xBA);
  int v13 = *(uint64_t (**)(void))(v11 + 8 * ((900 * (a9 == 0)) ^ v9));
  return v13(v13);
}

uint64_t sub_10001ECF8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, int a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  *(void *)(v28 - 128) = v26;
  *(void *)(v28 - 120) = a16;
  *(void *)(v28 - 112) = a24;
  *(_DWORD *)(v28 - 104) = v25 + ((v28 - 144) ^ 0x94AD4959) * v24 - 1318;
  *(void *)(v28 - 144) = a23;
  *(void *)(v28 - 136) = v26;
  uint64_t v29 = (*(uint64_t (**)(uint64_t))(v27 + 8 * (v25 ^ 0xDDF)))(v28 - 144);
  return (*(uint64_t (**)(uint64_t))(v27
                                            + 8
                                            * ((7 * (a19 + v25 - 616 + ((2 * v25) ^ 0xE3FA578B) > 0x7FFFFFFE)) ^ (v25 + 81))))(v29);
}

uint64_t sub_10001ED9C()
{
  return (*(uint64_t (**)(void))(v3
                              + 8
                              * ((100
                                * (((v1 == v0 + (((v2 ^ 0x248) - 1008) | 0x231) - 625) ^ ((v2 ^ 0x48) - 1)) & 1)) ^ v2 ^ 0x248)))();
}

uint64_t sub_10001EDF4@<X0>(int a1@<W8>)
{
  return (*(uint64_t (**)(void))(v2
                              + 8
                              * (((a1 + ((v1 - 1008) | 0x14u) - 536802093 < 0x7FFFFFFF) * (((v1 - 1121) | 0x186) ^ 0xAF)) ^ v1)))();
}

void sub_10001EE50()
{
}

uint64_t sub_10001EE58()
{
  return (*(uint64_t (**)(void))(v4
                              + 8
                              * ((1466
                                * ((((*(unsigned __int8 *)(v2 + 4) - 247) << ((v3 - 71) ^ 0xAC)) & v1)
                                 + ((*(unsigned __int8 *)(v2 + 4) - 247) ^ v0) == v0)) ^ v3)))();
}

uint64_t sub_10001EEA0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  *(_DWORD *)(v15 - 120) = v11
                         - 1224239923 * ((((v15 - 136) | 0x6D1D4435) - ((v15 - 136) & 0x6D1D4435)) ^ 0x9FAEB9E2)
                         - 1280;
  *(void *)(v15 - 136) = v14;
  *(void *)(v15 - 128) = a11;
  uint64_t v16 = (*(uint64_t (**)(uint64_t))(v12 + 8 * (v11 + 617)))(v15 - 136);
  return (*(uint64_t (**)(uint64_t))(v12 + 8 * (((v13 == v11 + 82113945) * ((v11 ^ 0x7B4) + 393)) ^ v11)))(v16);
}

uint64_t sub_10001EF68(_DWORD *a1)
{
  unsigned int v2 = *a1 ^ (1178560073 * (((a1 | 0x9834C8C3) - (a1 & 0x9834C8C3)) ^ 0x22A0B0A1));
  uint64_t result = (*((uint64_t (**)(char *, void (*)()))*(&off_10005CE90 + (int)(v2 - 1695027312))
            + (int)(v2 ^ 0x650818A5)))((char *)*(&off_10005CE90 + (int)(v2 ^ 0x65081066)) - 8, sub_10000A750);
  int v4 = *(_DWORD *)*(&off_10005CE90 + (int)(v2 ^ 0x650810F6));
  if (result) {
    int v4 = 1158830411;
  }
  a1[1] = v4;
  return result;
}

uint64_t sub_10001F044(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,int a30)
{
  return (*(uint64_t (**)(void))(v31
                              + 8 * ((1611 * (v30 - 1 == ((a30 - 1929298191) & 0x72FEBD87 ^ 0x87))) ^ (a30 - 440))))();
}

uint64_t sub_10001F094()
{
  return sub_100028074();
}

uint64_t sub_10001F440(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, unint64_t *a18, int a19, unsigned int a20)
{
  a18 = &STACK[0x6B8EF04F79262563];
  a20 = 1704
      - 460628867
      * ((-1402127699 - (&a18 ^ 0xA1613669 | 0xAC6D3AAD) + (&a18 ^ 0xA1613669 | 0x5392C552)) ^ 0xBE657146);
  uint64_t v23 = (*(uint64_t (**)(unint64_t **))(v21 + 16928))(&a18);
  return (*(uint64_t (**)(uint64_t))(v21 + 8 * ((252 * (a19 == v20)) ^ v22)))(v23);
}

void sub_10001F4E8(uint64_t a1, uint64_t a2)
{
  __asm { BRAA            X10, X17 }
}

uint64_t sub_10001F530@<X0>(int a1@<W1>, int a2@<W8>, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,int a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,int a33)
{
  BOOL v36 = v33 != (a2 ^ a22) + a2 + 876 - 16575603 || a33 != a1;
  return (*(uint64_t (**)(void))(v34 + 8 * ((1859 * v36) ^ a2)))();
}

uint64_t sub_10001F57C()
{
  BOOL v4 = v1 + v0 + (((v2 - 894) | 0x93) ^ 0x4472209Eu) < (v2 ^ 0x38Au);
  return (*(uint64_t (**)(void))(v3 + 8 * (((2 * v4) | (8 * v4)) ^ v2)))();
}

uint64_t sub_10001F5D8@<X0>(int a1@<W8>)
{
  return (*(uint64_t (**)(void))(v2 + 8 * (int)((((v1 + 1826365780) & 0x9323DA9C ^ 0x29C) * ((a1 ^ 0x1Fu) < 8)) | v1)))();
}

uint64_t sub_10001F620(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48)
{
  uint64_t v51 = *(void *)(v48 + 24);
  *(int8x16_t *)(v50 - 112) = veorq_s8(*(int8x16_t *)*(void *)(v48 + 16), (int8x16_t)xmmword_100056DB0);
  if (*(void *)(v50 - 120)) {
    BOOL v52 = v51 == 0x180D539AA7AA32;
  }
  else {
    BOOL v52 = 1;
  }
  int v53 = !v52;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v49 + 8 * (int)((25 * v53) ^ a8)))(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
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
           a39,
           a40,
           a41,
           a42,
           a43,
           a44,
           a45,
           a46,
           a47,
           a48);
}

uint64_t sub_10001F694(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, int a19, int a20,_DWORD *a21,uint64_t a22,uint64_t a23,uint64_t a24,int *a25,void *a26)
{
  int v31 = v29 ^ 0x73;
  *a21 = v27 + 1;
  unsigned int v32 = ((v26 ^ (v26 >> 11)) << 7) & 0x9D2C5680 ^ v26 ^ (v26 >> 11);
  int v33 = (unsigned char *)(a17 + (a20 - 1));
  unsigned int v34 = -953638755 * ((*(_DWORD *)(*a26 + (*a25 & 0xFFFFFFFFCAB8BC78)) ^ v33) & 0x7FFFFFFF);
  unint64_t v35 = -953638755 * ((v34 >> ((((v29 ^ 0x73) + 35) | 0xE) ^ 0xBE)) ^ v34);
  char v36 = *(unsigned char *)(*(void *)(v28 + 8 * (v31 - 1145)) + (v35 >> 24)) ^ v32 ^ (((v31 - 272237693) & (v32 << 15) ^ v32) >> 18) ^ *(unsigned char *)(*(void *)(v28 + 8 * (v31 ^ 0x4D2)) + (v35 >> 24) - 12) ^ *(unsigned char *)(*(void *)(v28 + 8 * (v31 - 1138)) + (v35 >> 24) + 1) ^ v35 ^ (-69 * BYTE3(v35));
  unsigned char *v33 = v36;
  return (*(uint64_t (**)(void))(v30 + 8 * ((530 * (a20 == (v36 != 0))) ^ v29 ^ 0x73)))();
}

void sub_10001F7CC(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 28) + 108757529 * (((a1 | 0xFA9FB8B3) - (a1 & 0xFA9FB8B3)) ^ 0x1A03DA98);
  __asm { BRAA            X8, X17 }
}

uint64_t sub_10001F890()
{
  return (*(uint64_t (**)(void))(v3
                              + 8
                              * (int)((((((v2 - 1248) | 0x10) ^ 0xFFFFFB34) + 23 * (v2 ^ 0x546)) * (v0 == v1)) ^ v2)))();
}

uint64_t sub_10001F8E0@<X0>(int a1@<W8>)
{
  int v4 = LODWORD(STACK[0x494])++;
  *(_DWORD *)STACK[0x220] = v4 + 1;
  uint64_t v5 = *(unsigned int *)STACK[0x250];
  uint64_t v6 = 1178560073 * ((v1 + 0x29E3EB6E453D5991 - 2 * (v1 & 0x29E3EB6E453D5991)) ^ 0x321FBB86FFA921F3);
  *(_DWORD *)(v3 - 188) = (a1 + 1579996014) ^ v6;
  *(void *)(v3 - 184) = v5 + v6;
  *(void *)(v3 - 168) = v6 + 5119;
  int v7 = (a1 + 1579995979) ^ v6;
  *(_DWORD *)(v3 - 200) = (a1 - 1501687621) ^ v6;
  *(_DWORD *)(v3 - 196) = v7 ^ 0x58;
  *(_DWORD *)(v3 - 160) = -1178560073 * ((v1 + 1161648529 - 2 * (v1 & 0x453D5991)) ^ 0xFFA921F3);
  *(_DWORD *)(v3 - 176) = v7;
  uint64_t v8 = (*(uint64_t (**)(uint64_t))(v2 + 8 * (a1 ^ 0xEC4)))(v3 - 200);
  return (*(uint64_t (**)(uint64_t))(v2 + 8 * *(int *)(v3 - 192)))(v8);
}

uint64_t sub_10001F9C4()
{
  return (*(uint64_t (**)(void))(v2
                              + 8
                              * ((472 * (((v1 > v0 + 623) ^ (LODWORD(STACK[0x2AC]) + 26)) & 1)) ^ (LODWORD(STACK[0x2AC]) - 1055))))();
}

uint64_t sub_10001FA08(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  *(_DWORD *)(result + 28) = a5;
  return result;
}

void sub_10001FA10(uint64_t a1)
{
  __asm { BRAA            X8, X17 }
}

void sub_10001FA50()
{
}

uint64_t sub_10001FA58(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)(a1 + 24) = *(_DWORD *)(a2 + 4);
  *(void *)(a1 + 32) = *(void *)(a2 + 8);
  return 0;
}

uint64_t sub_10001FA70@<X0>(int a1@<W2>, uint64_t a2@<X8>)
{
  *(_DWORD *)(a2 - 3 + (v5 + v3)) = *(_DWORD *)(v2 - 3 + (v5 + v3));
  return (*(uint64_t (**)(void))(v6 + 8 * ((460 * (((a1 + 289) ^ 0x365) == v4)) ^ (a1 + 1139))))();
}

uint64_t sub_10001FABC()
{
  return (*(uint64_t (**)(void))(v2 + 8 * (((((v4 << (v3 + 31)) & v1) != v5) * v6) ^ v0)))();
}

void sub_10001FAE8(uint64_t a1)
{
  int v1 = 1178560073 * ((2 * (a1 & 0x78F6F35) - a1 + 2020643018) ^ 0xC2E4E8A8);
  unsigned int v2 = *(_DWORD *)(*(void *)(a1 + 8) - 0x3D8A64FC118460F6) + 674491969;
  unsigned int v3 = *(_DWORD *)(a1 + 4) - v1 + 899026615;
  int v4 = (v3 < 0x4454105E) ^ (v2 < 0x4454105E);
  BOOL v5 = v2 < v3;
  if (v4) {
    BOOL v6 = v3 < 0x4454105E;
  }
  else {
    BOOL v6 = v5;
  }
  __asm { BRAA            X12, X17 }
}

uint64_t sub_10001FBF0@<X0>(uint64_t a1@<X1>, int a2@<W8>, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,unsigned int *a50)
{
  int v51 = a2 + 1143;
  uint64_t v52 = (*(uint64_t (**)(void, uint64_t, void))(v50 + 8 * (a2 ^ 0x990)))(*a50, a1, LODWORD(STACK[0x4A0]));
  return (*(uint64_t (**)(uint64_t))(v50
                                            + 8
                                            * (((LODWORD(STACK[0x3CC]) == -1158872075) * ((v51 + 114) ^ (v51 + 161))) ^ v51)))(v52);
}

uint64_t sub_10001FC54(uint64_t a1, int a2, int a3, int a4, int a5)
{
  unsigned int v7 = a3 - 32;
  uint64_t v8 = v5 + v7;
  long long v9 = *(_OWORD *)(v8 - 31);
  uint64_t v10 = a1 + v7;
  *(_OWORD *)(v10 - 15) = *(_OWORD *)(v8 - 15);
  *(_OWORD *)(v10 - 31) = v9;
  return (*(uint64_t (**)(void))(v6 + 8 * (((a4 == 32) * a5) ^ (a2 + 574))))();
}

uint64_t sub_10001FC60(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  *(_DWORD *)(*(void *)(v9 - 0x4C6937770F4864B0) + 4 * (v7 + v5 + 1)) = a5;
  return (*(uint64_t (**)(void))(v8 + 8 * ((254 * (v7 + v5 > ((v6 - 1118) | 0x186) - 407)) ^ v6)))();
}

uint64_t sub_10001FCB4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26)
{
  unsigned int v31 = v28 + v27 - 1793818603;
  if (v31 <= 0x40) {
    int v32 = 64;
  }
  else {
    int v32 = v31;
  }
  BOOL v33 = v29 + v32 > ((((276 * (v26 ^ 0x687) - 1728857413) & 0x670C46FF) - 1272) ^ (v31 - 1));
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v30 + 8 * ((2 * v33) | (32 * v33) | v26)))(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26);
}

uint64_t sub_10001FD34@<X0>(int a1@<W8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, unsigned int a9, char a10)
{
  unsigned int v13 = (a1 + 1970905373) & 0x8A865F5F;
  a9 = (a1 + 1286) ^ ((((&a9 ^ 0xD379E85A | 0xE551A89D)
                      - (&a9 ^ 0xD379E85A)
                      + ((&a9 ^ 0xD379E85A) & 0x1AAE5762)) ^ 0x5BDC58CE)
                    * v10);
  a10 = (((&a9 ^ 0x5A | 0x9D) - (&a9 ^ 0x5A) + ((&a9 ^ 0x5A) & 0x62)) ^ 0xCE)
      * v10
      + 114;
  uint64_t v14 = (*(uint64_t (**)(unsigned int *))(v11 + 8 * (a1 ^ 0xAFB)))(&a9);
  return (*(uint64_t (**)(uint64_t))(v11
                                            + 8
                                            * (int)(((**(_DWORD **)(v12 + 8 * (int)(v13 ^ 0x306)) == ((139 * (v13 ^ 0x303)) ^ 0x22C))
                                                   * (((v13 - 1394289517) & 0x531B2B7F) + 557)) ^ v13)))(v14);
}

uint64_t sub_10001FE28@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, int a3@<W3>, unsigned int a4@<W4>, uint64_t a5@<X5>, int a6@<W6>, int a7@<W8>)
{
  unint64_t v19 = a1 + v17 + (v12 ^ 0xB2E77930) + v14 * (unint64_t)(*(_DWORD *)(*v13 + 4 * a3) ^ v12);
  *(_DWORD *)(a5 + 4 * v15) = v19 + v12 - ((2 * v19) & 0x65CEF260);
  uint64_t v20 = ((v19 >> (((v10 - 100) ^ v18) ^ v9)) ^ v7)
      + v11
      + (a2 & (2 * (v19 >> (((v10 - 100) ^ v18) ^ v9))));
  BOOL v21 = a3 + 183806600 < a6;
  if (a4 > 0x750B5578 != a3 + 183806600 < v16) {
    BOOL v21 = a4 > 0x750B5578;
  }
  return (*(uint64_t (**)(uint64_t))(v8 + 8 * (v10 ^ (v21 * a7))))(v20);
}

uint64_t sub_10001FED4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  int v11 = *(unsigned __int8 *)(a4 + v6 + v9) ^ v5 | ((*(unsigned __int8 *)(a4 + v6 + v9 + 1) ^ v5) << 8) | ((*(unsigned __int8 *)(a4 + v6 + v9 + 2) ^ v5) << (((v4 - 106) & 0xD7) - 54)) | ((*(unsigned __int8 *)(a4 + v6 + v9 + 3) ^ v5) << 24);
  *(_DWORD *)(v8 + ((v6 + v9) & 0xFFFFFFFFFFFFFFFCLL)) = v11 + v10 - ((2 * v11) & 0x75DA07EA);
  return (*(uint64_t (**)(void))(v7 + 8 * ((802 * ((unint64_t)(v6 + 4 + v9) < 0x40)) | v4)))();
}

uint64_t sub_10001FF74(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,int a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38)
{
  uint64_t v44 = (v39 - 975);
  HIDWORD(v46) = (v41 - 841074325) & 0x3221C6FE;
  LODWORD(v46) = v41 ^ 0xC06;
  HIDWORD(a21) = v41 - 1929298191;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t *, unint64_t, unint64_t, unint64_t, unint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v42 + 8 * (int)((29 * ((((_BYTE)v44 + 81) & 0x7D ^ (((v44 - 162) | 0x402) == 1038)) & 1)) ^ v44)))(v43 - 152, a2, v38 - 0x440C6379540E055DLL, (unsigned __int16)(v40 - 5137), 2464994385, 1026, 29, 198, a9, a10, v46, &a38, (unint64_t)&a31 % (v44 - 137) + 16, 1178560073* ((((v43 - 152) | 0x576FD5F7CC5860D8) - (v43 - 152) + ((v43 - 152) & 0xA8902A0833A79F20)) ^ 0x4C93851F76CC18BALL)+ 5119, 1178560073* ((((v43 - 152) | 0x576FD5F7CC5860D8) - (v43 - 152) + ((v43 - 152) & 0xA8902A0833A79F20)) ^ 0x4C93851F76CC18BALL), 535753261
         * (((~(v43 - 152) | 0x89D588405E525F14) + ((v43 - 152) | 0x762A77BFA1ADA0EBLL)) ^ 0x83C82AD2AB59AEC5),
           v38 - 0x440C6379540E055DLL,
           a18,
           a19,
           a20,
           a21);
}

uint64_t sub_10002023C(uint64_t a1, int a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, int a7)
{
  unsigned int v11 = (v7 + 982736996) & 0xC56C9FEF;
  unsigned int v12 = (_DWORD *)STACK[0x290];
  _DWORD *v12 = v8 - 1;
  unsigned int v13 = &v12[6 * (v8 - 763955141)];
  int v14 = v13[2];
  STACK[0x288] = *((void *)v13 + 2);
  LODWORD(STACK[0x4F4]) = v13[6];
  return (*(uint64_t (**)(void))(v9
                              + 8
                              * (int)(((*(_DWORD *)(v10 + (int)(a5 + v14 + v11 - 705) * (uint64_t)a2 + 36) == a7)
                                     * (v11 ^ 0x71 ^ (30 * (v11 ^ 0x2FD)))) ^ v11)))();
}

void sub_100020318()
{
}

uint64_t sub_100020320@<X0>(int a1@<W8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, _DWORD *a11, uint64_t a12, unsigned int *a13)
{
  *a11 = 1;
  int v15 = (a1 + 1437243918) ^ a8;
  *(void *)(v14 - 136) = *a13 + a8;
  *(_DWORD *)(v14 - 152) = (a1 - 1501686882) ^ a8;
  *(_DWORD *)(v14 - 148) = v15 ^ 7;
  *(_DWORD *)(v14 - 140) = v15 ^ 0x72;
  *(void *)(v14 - 120) = a7;
  *(_DWORD *)(v14 - 128) = v15;
  *(_DWORD *)(v14 - 112) = -(int)a8;
  uint64_t v16 = (*(uint64_t (**)(uint64_t))(v13 + 8 * (a1 ^ 0xC3B)))(v14 - 152);
  return (*(uint64_t (**)(uint64_t))(v13 + 8 * *(int *)(v14 - 144)))(v16);
}

uint64_t sub_1000203C4@<X0>(int a1@<W0>, int a2@<W1>, int a3@<W6>, int a4@<W7>, int a5@<W8>)
{
  uint64_t v10 = (a1 ^ a4 ^ (v9 + 731)) + a2;
  *(unsigned char *)(v5 + v10) = *(unsigned char *)(v6 + v10) - (v7 & (2 * *(unsigned char *)(v6 + v10))) + 82;
  return (*(uint64_t (**)(void))(v8 + 8 * (((a2 - 1 == a3) * a5) ^ a1)))();
}

uint64_t sub_100020408(uint64_t a1, uint64_t a2, unsigned int a3, int a4, int a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, unsigned int a17)
{
  int v19 = a4 ^ (a4 + 19);
  unsigned int v20 = ((v19 + 731) ^ 0x53AA0628) + v17;
  BOOL v21 = v20 < a3;
  BOOL v22 = v20 > a17;
  if (a17 < a3 != v21) {
    BOOL v23 = v21;
  }
  else {
    BOOL v23 = v22;
  }
  return (*(uint64_t (**)(uint64_t))(v18 + 8 * ((v23 * (17 * v19 - 335)) ^ (a5 + a4 + 224))))(4206093348);
}

uint64_t sub_100020484@<X0>(int a1@<W8>)
{
  _DWORD *v2 = STACK[0x3B8];
  v2[85] = STACK[0x454];
  v2[86] = STACK[0x474];
  v2[87] = STACK[0x334];
  v2[88] = STACK[0x4B4];
  return (*(uint64_t (**)(void))(v1
                              + 8
                              * ((19 * (((STACK[0x318] == 0) ^ (((a1 + 17) | 0x70) + 46)) & 1)) ^ (((a1 + 17) | 0x670) - 267))))();
}

uint64_t sub_10002050C@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  unsigned int v10 = v2 - 471867934;
  int v11 = v2 - 1;
  int v12 = *(unsigned __int8 *)(v6 + v10);
  if (v12 == 82) {
    __asm { BRAA            X11, X17 }
  }
  if (v12 == 210)
  {
    int v13 = -1158872075;
    uint64_t v14 = *(void *)(v4 + 8);
    int v15 = *(unsigned __int8 *)(v4 + 16) ^ v5;
    *(void *)uint64_t result = v6;
    *(_DWORD *)(result + 8) = v7;
    *(_DWORD *)(result + 12) = v11;
    if (v15 == 69) {
      int v16 = -665311488;
    }
    else {
      int v16 = -665311487;
    }
    *(_DWORD *)(result + 16) = 1405494216;
    *(_DWORD *)(result + 20) = v16;
    *(_DWORD *)(result + 24) = -1158872075;
    *(void *)(v14 - 0x59E1F3EDA990969CLL) = a2;
  }
  else
  {
    uint64_t result = (*(uint64_t (**)(void))(v9 + 8 * (v8 ^ 0xF3F)))();
    int v13 = 1158830124;
  }
  *(_DWORD *)uint64_t v4 = v13;
  return result;
}

uint64_t sub_1000205F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  return (*(uint64_t (**)(void))(v6
                              + 8
                              * (((((a6 ^ 0x44B) + 1179) ^ 0x657) * ((unint64_t)(a4 - v7 - 1167) > 0x1F)) ^ a6)))();
}

uint64_t sub_100020630(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)(a1 + 40) = *(_DWORD *)(a2 + 4);
  *(void *)(a1 + 48) = *(void *)(a2 + 8);
  return 0;
}

uint64_t sub_10002064C()
{
  return sub_100027474();
}

void sub_100020660(uint64_t a1)
{
  int v1 = 1225351577 * ((-2 - ((a1 | 0x69BC7507) + (~a1 | 0x96438AF8))) ^ 0xE8BC10CA);
  __asm { BRAA            X10, X17 }
}

uint64_t sub_1000206F8@<X0>(int a1@<W1>, int a2@<W8>)
{
  return (*(uint64_t (**)(void))(v3 + 8 * (((((v2 - 203444186) & 0xC204F7B ^ 0x31E) + v2 + 906) * (a2 == a1)) ^ v2)))();
}

uint64_t sub_10002074C@<X0>(uint64_t a1@<X6>, int a2@<W7>, int a3@<W8>)
{
  *((unsigned char *)&STACK[0x2AC] + (a3 + v3)) = *(unsigned char *)((v5 ^ 0x15Du) + v4 + a1 - 1808684845)
                                                      - ((2 * *(unsigned char *)((v5 ^ 0x15Du) + v4 + a1 - 1808684845)) & 0xA4)
                                                      + 82;
  return (*(uint64_t (**)(void))(v6 + 8 * ((195 * ((a2 + a3 + 1) > 0x3F)) ^ v5)))();
}

_DWORD *sub_1000207B8@<X0>(_DWORD *result@<X0>, int a2@<W8>)
{
  *uint64_t result = (a2 << ((v2 + 75) & 0xAF ^ 0x82)) + v3 - 1854405051;
  return result;
}

uint64_t sub_1000207F8()
{
  return (*(uint64_t (**)(void))(v2 + 8 * (((*v1 == (((v0 - 826) | 0xA6) ^ 0x4E6)) * ((v0 - 826) ^ 0x499)) ^ v0)))();
}

uint64_t sub_100020834(int a1, int a2)
{
  return (*(uint64_t (**)(void))(v2 + 8 * ((((v3 - 701) ^ 0x1A3 ^ ((v3 - 566) | 0x142)) * (a1 == a2)) ^ (v3 - 33))))();
}

uint64_t sub_100020870@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, _DWORD *a5@<X8>)
{
  uint64_t v10 = a1[6];
  uint64_t v12 = *a1;
  uint64_t v11 = a1[1];
  *a5 = v7 - 270264499;
  *(_DWORD *)(v12 - 0x257CFFE2D3AC1529) = v6;
  *(_DWORD *)(v10 - 0x39AF297A7BF7497FLL) = a3;
  *(void *)(v11 - 0x1DF44763245EA6D8) = v5 + (((v8 - 519) | 0x41) ^ 0xF69F3E8D) + v9;
  return sub_10003C9E0((uint64_t)a1, a2, a3, a4, -1158872075);
}

uint64_t sub_1000208F4(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)(a1 + 88) = 53;
  *(_DWORD *)(a1 + 72) = *(_DWORD *)(a2 + 4);
  *(void *)(a1 + 80) = *(void *)(a2 + 8);
  return 0;
}

uint64_t sub_100020914@<X0>(int a1@<W8>)
{
  int v3 = *(uint64_t (**)(uint64_t))(v2 + 8 * (a1 ^ 0xA76u));
  return v3(v1);
}

uint64_t sub_100020948@<X0>(uint64_t a1@<X1>, uint64_t a2@<X6>, uint64_t a3@<X8>)
{
  *(unsigned char *)(a1 + a3 + a2 - 1) = 82;
  return (*(uint64_t (**)(void))(v4
                              + 8
                              * ((875
                                * (((v3 - 623476159) & 0x25297DDF ^ 0x41Du ^ (unint64_t)(a1 + 66)) + a3 < 0x40)) ^ (v3 - 623476159) & 0x25297DDFu)))();
}

uint64_t sub_1000209A4(int a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(v3 + 8 * ((((a1 + 253) ^ 0x203) * ((unint64_t)(a2 - v4 - v2) > 0x1F)) ^ a1)))();
}

uint64_t sub_1000209E0(uint64_t a1)
{
  int v2 = 1374699841 * ((2 * (a1 & 0x2C1640CD) - a1 + 1407827762) ^ 0x3E1DA73B);
  int v3 = *(_DWORD *)a1 + v2;
  uint64_t v5 = *(void *)(a1 + 8);
  uint64_t v4 = *(void *)(a1 + 16);
  uint64_t v7 = *(void *)(a1 + 24);
  uint64_t v6 = *(void *)(a1 + 32);
  int v8 = *(_DWORD *)(a1 + 40) ^ v2;
  unsigned int v9 = 235795823 * ((&v11 & 0xF4A3154B | ~(&v11 | 0xF4A3154B)) ^ 0x9FF1A3ED);
  int v16 = v9 ^ (v3 + 2024875101);
  uint64_t v17 = v5;
  uint64_t v13 = v6;
  uint64_t v14 = v4;
  uint64_t v11 = v7;
  unsigned int v12 = v8 + v9 + 368694536;
  uint64_t result = (*((uint64_t (**)(uint64_t *))*(&off_10005CE90 + v3 + 2024873223) + (int)(v3 ^ 0x874EEBCD)))(&v11);
  *(_DWORD *)(a1 + 48) = v15;
  return result;
}

uint64_t sub_100020B24@<X0>(uint64_t a1@<X0>, int a2@<W1>, int a3@<W4>, uint64_t a4@<X8>)
{
  uint64_t v9 = (v8 + v7 + a2 - a3);
  *(void *)(a4 - 7 + v9) = *(void *)(v5 - 7 + v9);
  return (*(uint64_t (**)(uint64_t, void))(v4
                                                    + 8
                                                    * (int)(((a3 - (v6 & 0xFFFFFFF8) == -8)
                                                           * (((a1 - 366778151) & 0x15DC97EB) - 949)) ^ a1)))(a1, (v9 - 8));
}

uint64_t sub_100020B8C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void))(v7
                                                                                     + 8
                                                                                     * ((((((v6 - 654803831) & 0x27077FE3)
                                                                                         - 526) ^ 0x1BB)
                                                                                       * (v5 > 0xF)) ^ v6));
  *(_DWORD *)(v8 - 144) = v5;
  return v9(a1, a2, a3, a4, a5, 0);
}

uint64_t sub_100020BD4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  return (*(uint64_t (**)(void))(v7 + 8 * ((1469 * (v6 + 1 == v8 + 16)) ^ a6)))();
}

void sub_100020CB0(uint64_t a1)
{
  int v1 = 235795823 * (((a1 | 0xA666D7F8) - a1 + (a1 & 0x59992807)) ^ 0x32CB9EA1);
  int v2 = *(_DWORD *)(a1 + 16) - v1;
  __asm { BRAA            X13, X17 }
}

uint64_t sub_100020D78(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, uint64_t a7, char a8)
{
  char v14 = *(unsigned char *)(v12 + v8 + ((v10 - 1946) ^ (a6 + 18)));
  *((unsigned char *)&STACK[0x2A8] + v9) = v14 - (a8 & (2 * v14)) + 82;
  return (*(uint64_t (**)(void))(v13 + 8 * (((v9 == 63) * v11) ^ v10)))();
}

uint64_t sub_100020DC8(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 16);
  int v2 = *(_DWORD *)(result + 4) - 235795823 * (((result | 0xDF39865F) - result + (result & 0x20C679A0)) ^ 0x4B94CF06);
  *(_DWORD *)(v1 - 0x1FA9E8BAFD93F958) = ((v2 & 0x6B ^ 0x2812062B) + (v2 & 0x194 ^ 0x1040005) - 1) ^ 0x92023CA8;
  *(void *)(v1 - 0x1FA9E8BAFD93F978) = 0x21A8BDE01D2269FFLL;
  *(_DWORD *)(v1 - 0x1FA9E8BAFD93F95CLL) = 1049205778;
  int v3 = v2 ^ 0x48;
  if (v3 == 1)
  {
    int v4 = 1049205794;
    goto LABEL_5;
  }
  if (v3 == 2)
  {
    *(_DWORD *)(v1 - 0x1FA9E8BAFD93F960) = -281726378;
    int v4 = 1049205798;
LABEL_5:
    *(void *)(v1 - 0x1FA9E8BAFD93F970) = 0xC32A782F4BA2F0A7;
    *(void *)(v1 - 0x1FA9E8BAFD93F968) = 0x3CD587D0B45D0F58;
    *(_DWORD *)(v1 - 0x1FA9E8BAFD93F95CLL) = v4;
  }
  *(_DWORD *)uint64_t result = 117938525;
  return result;
}

uint64_t sub_100020F3C@<X0>(uint64_t a1@<X8>)
{
  return (*(uint64_t (**)(void))(v2 + 8 * ((181 * (a1 == ((v1 + 1046410411) & 0xC5FD6F7D) - 73164625)) ^ v1)))();
}

uint64_t sub_100020F80@<X0>(int a1@<W8>, int w3_0@<W3>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, int a17, int a18, int a19,int a20,int a21,uint64_t (*a22)(void))
{
  LODWORD(STACK[0x304]) = v26 + (w3_0 ^ v26) + (v23 ^ v26) - ((((w3_0 ^ v26) + (v23 ^ v26)) << (v24 + 122)) & v25);
  return sub_10000C398(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22);
}

uint64_t sub_100020FCC@<X0>(int a1@<W6>, uint64_t a2@<X8>)
{
  return (*(uint64_t (**)(void))(a2 + 8 * (((v2 == 24) * a1) ^ v3)))();
}

uint64_t sub_10002102C(uint64_t a1, uint64_t a2, int a3, int a4)
{
  return (*(uint64_t (**)(void))(v5
                              + 8
                              * ((((v4 == a4) ^ (a3 - 44)) & 1 | (8
                                                                                 * (((v4 == a4) ^ (a3 - 44)) & 1))) ^ (a3 - 811))))();
}

uint64_t sub_10002107C@<X0>(int a1@<W3>, uint64_t a2@<X4>, int a3@<W8>, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, int a19, char a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,int a32)
{
  uint64_t v37 = (v35 + a3);
  unsigned int v38 = *(_DWORD *)(&a20 + v37 + 72);
  *(unsigned char *)(a2 + v37) = (HIBYTE(v38) ^ 0x2C) - ((HIBYTE(v38) << (a1 + v33 - 89)) & 0xA4) + 82;
  *(unsigned char *)(a2 + (v37 + 1)) = (BYTE2(v38) ^ 0xE7) - ((2 * (BYTE2(v38) ^ 0xE7)) & 0xA4) + 82;
  *(unsigned char *)(a2 + (v37 + 2)) = (BYTE1(v38) ^ 0xD3)
                                           - 2 * ((BYTE1(v38) ^ 0xD3) & 0x56 ^ BYTE1(v38) & 4)
                                           + 82;
  *(unsigned char *)(a2 + (v37 + 3)) = v38 ^ 0xF4;
  BOOL v39 = a32 - 572544878 < v32;
  if (v35 - 36275336 < v32 == v39) {
    BOOL v39 = v35 - 36275336 < (a32 - 572544878);
  }
  return (*(uint64_t (**)(void))(v36 + 8 * ((v39 * v34) ^ v33)))((a1 + v33 - 368));
}

uint64_t sub_10002116C()
{
  return sub_10003CF58();
}

uint64_t sub_1000212C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, int a14, int a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,int a28)
{
  return (*(uint64_t (**)(uint64_t))(v28
                                            + 8
                                            * ((1600
                                              * (a15
                                               + ((2 * LODWORD(STACK[0x2C8])) & 0x56 ^ 0x40)
                                               + (((a28 ^ 0xCE) + 1062) ^ 0x7AFCFA96 ^ STACK[0x2C8] & 0x3F) < 0xFFFFFFC0)) ^ (a28 + 85))))(4115370206);
}

void sub_100021378()
{
  LODWORD(STACK[0x290]) = 582388011;
  JUMPOUT(0x100016020);
}

uint64_t sub_100021394@<X0>(uint64_t a1@<X8>)
{
  uint64_t v5 = v2;
  uint64_t v7 = v2;
  uint64_t v8 = v1;
  unsigned int v6 = v3
     - 371
     - 3804331
     * (((&v5 | 0x386E7D01) - &v5 + (&v5 & 0xC79182F8)) ^ 0xB7CB66C7)
     + 1813;
  return (*(uint64_t (**)(uint64_t *))(a1 + 8 * (v3 + 1543)))(&v5);
}

void sub_100021424()
{
}

uint64_t sub_10002142C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void, uint64_t, uint64_t))(v13 + 8 * ((230 * (v11 != (v12 ^ 0x67E))) ^ v12)))(a1, a2, a3, a4, a5, a6, a7, 1304690755, *(void *)(a1 + 16), a10, a11);
}

uint64_t sub_100021478(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, int a6, uint64_t a7, int a8)
{
  HIDWORD(v12) = a8 ^ 2;
  LODWORD(v12) = a8 ^ a4;
  return (*(uint64_t (**)(uint64_t, void))(v8 + 8 * ((a7 + 1 == v11 + 24) | a6)))(a2, v9 + (v12 >> 2) - (v10 & (2 * (v12 >> 2))));
}

uint64_t sub_100021534(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  return (*(uint64_t (**)(void))(v6 + 8 * ((((2 * v5) ^ 0xAF0) * (v4 != a4)) ^ v5)))();
}

uint64_t sub_10002155C(uint64_t result, uint64_t a2, int a3)
{
  *(_DWORD *)(result + 12) = a3 - v3 - 302763828;
  return result;
}

uint64_t sub_100021574@<X0>(int a1@<W8>)
{
  int v4 = v2 - 356;
  BOOL v5 = a1 + 86995843 < (v1 - 505772162);
  if (v1 - 505772162 < ((v4 + 528870088) & 0xE07A17DD) + 1416412644 != a1 + 86995843 < ((v4 + 1290) ^ 0x546CC480u)) {
    BOOL v5 = v1 - 505772162 < ((v4 + 528870088) & 0xE07A17DD) + 1416412644;
  }
  return (*(uint64_t (**)(void))(v3 + 8 * ((26 * !v5) ^ v4)))();
}

uint64_t sub_10002160C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58)
{
  LODWORD(STACK[0x494]) = v58;
  uint64_t v62 = (*(uint64_t (**)(uint64_t, void))(v60 + 8 * (v59 + 1663)))(a58, 0);
  uint64_t v63 = *(void *)(v61 + 16);
  *(_DWORD *)(v61 + 4) = *(_DWORD *)(v61 + 24);
  *(_DWORD *)(v61 + 8) = v63;
  uint64_t v64 = 8 * (v59 ^ 0x9DE);
  *(_DWORD *)(v61 + 12) = (*(uint64_t (**)(uint64_t))(v60 + v64))(v62);
  *(_DWORD *)uint64_t v61 = (*(uint64_t (**)(void))(v60 + v64))();
  return sub_100021688();
}

uint64_t sub_100021688()
{
  *(_DWORD *)(v7 + 4 * (v4 - 274670784)) = *(_DWORD *)(v6 + 4 * (v1 - 1479895065))
                                                         + v1
                                                         - 1479895065
                                                         + ((1664525
                                                           * (*(_DWORD *)(v7 + 4 * (v4 - 274670785)) ^ (*(_DWORD *)(v7 + 4 * (v4 - 274670785)) >> 30))) ^ *(_DWORD *)(v7 + 4 * (v4 - 274670784)));
  unint64_t v9 = 1178560073 * ((~(v2 | 0x7515CECEEC0E5C36) + (v2 & 0x7515CECEEC0E5C36)) ^ 0x911661D9A965DBABLL);
  *(_DWORD *)(v8 - 160) = -1178560073 * ((~(v2 | 0xEC0E5C36) + (v2 & 0xEC0E5C36)) ^ 0xA965DBAB);
  *(_DWORD *)(v8 - 176) = (v3 - 857892745) ^ v9;
  *(_DWORD *)(v8 - 200) = (v3 - 1501687621) ^ v9;
  *(_DWORD *)(v8 - 196) = (v3 - 857892745) ^ v9 ^ 0xF;
  *(void *)(v8 - 184) = v9 + v0;
  *(_DWORD *)(v8 - 188) = (v3 - 857892841) ^ v9;
  *(void *)(v8 - 168) = (v4 + 1905308611) + v9;
  uint64_t v10 = (*(uint64_t (**)(uint64_t))(v5 + 8 * (v3 + 324)))(v8 - 200);
  return (*(uint64_t (**)(uint64_t))(v5 + 8 * *(int *)(v8 - 192)))(v10);
}

uint64_t sub_1000217A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,int a21,int a22)
{
  *(_DWORD *)(v28 - 104) = (v23 ^ 0x372)
                         + 235795823 * (((~(v28 - 144) & 0x34749384) - (~(v28 - 144) | 0x34749385)) ^ 0xA0D9DADC)
                         - 40;
  *(void *)(v28 - 136) = v22;
  *(void *)(v28 - 128) = v22;
  *(void *)(v28 - 120) = a13;
  *(void *)(v28 - 112) = v26;
  *(void *)(v28 - 144) = v25;
  uint64_t v29 = (*(uint64_t (**)(uint64_t))(v24 + 8 * ((v23 ^ 0x372) + 1869)))(v28 - 144);
  return (*(uint64_t (**)(uint64_t))(v24
                                            + 8
                                            * ((7
                                              * (a22
                                               + (((v23 ^ 0x372) - 226) | 0x5E0)
                                               - 616
                                               + ((2 * (((v23 ^ 0x372) - 226) | 0x5E0)) ^ 0xD0E ^ (v27 - 1364)) > 0x7FFFFFFE)) ^ ((((v23 ^ 0x372) - 226) | 0x5E0) + 81))))(v29);
}

void sub_100021874()
{
  *uint64_t v0 = v1;
  sub_1000417D8();
}

void sub_10002187C()
{
}

uint64_t sub_100021888(uint64_t a1, uint64_t a2, int a3, uint64_t a4, int a5)
{
  return (*(uint64_t (**)(void))(v6
                              + 8 * (((((v5 - 1198) | 0xA9) + 303) * ((a3 + a5 + 2101251) > 7)) ^ v5)))();
}

uint64_t sub_1000218F4@<X0>(int a1@<W3>, int a2@<W8>)
{
  return (*(uint64_t (**)(void))(v4 + 8 * ((716 * ((a2 ^ 0x6D9767FA ^ v2 ^ (a1 + 178)) == v3 - 111507154)) ^ v2)))();
}

uint64_t sub_100021940(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, int a20,int a21)
{
  int v23 = *(uint64_t (**)(void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v21 + 8 * ((v22 - 699) ^ (1282 * ((a21 & 0x20000000) == 0))));
  return v23(v23, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16);
}

uint64_t sub_100021970@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, int a5@<W8>, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,unsigned int a29)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, void, uint64_t))(v30
                                                                                        + 8
                                                                                        * ((787
                                                                                          * (((9 * (a5 ^ 0x606)) ^ (v29 - 482)) == -1158872075)) ^ (9 * (a5 ^ 0x606)))))(a1, a2, a3, a4, a29, a28);
}

uint64_t sub_1000219C4@<X0>(int a1@<W8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  int v17 = a1 ^ 0x6BD;
  int v18 = ((v16 - 144) ^ 0x4C96827D) * v9;
  *(void *)(v16 - 120) = v14;
  *(_DWORD *)(v16 - 140) = v18 + a1 + 1168;
  *(void *)(v16 - 136) = v15;
  *(_DWORD *)(v16 - 128) = ((a1 ^ 0xAE0BA523) + v10) ^ v18;
  (*(void (**)(uint64_t))(v11 + 8 * (a1 ^ 0xB13)))(v16 - 144);
  *(_DWORD *)(v16 - 144) = v17
                         + 535753261 * ((((2 * (v16 - 144)) | 0x9FFC68C8) - (v16 - 144) + 805424028) ^ 0xC50A3A4B)
                         - 848;
  *(void *)(v16 - 136) = a8;
  *(void *)(v16 - 128) = v12;
  (*(void (**)(uint64_t))(v11 + 8 * (v17 + 666)))(v16 - 144);
  *(void *)(v16 - 104) = v12;
  *(void *)(v16 - 128) = a7;
  *(void *)(v16 - 120) = a9;
  *(void *)(v16 - 144) = a8;
  *(void *)(v16 - 136) = v15;
  *(_DWORD *)(v16 - 112) = (v17 - 686) ^ (535753261
                                        * ((-892046159 - ((v16 - 144) | 0xCAD474B1) + ((v16 - 144) | 0x352B8B4E)) ^ 0x3FDF8561));
  uint64_t v19 = (*(uint64_t (**)(uint64_t))(v11 + 8 * (v17 + 719)))(v16 - 144);
  return (*(uint64_t (**)(uint64_t))(v11 + 8 * ((((9 * (v17 ^ 0x5DB)) ^ 0x22A) * (v13 == 0)) ^ v17)))(v19);
}

uint64_t sub_100021B3C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v68 + 8 * (((a67 + 725) * (v69 == v70)) ^ (v67 - 1714))))(100, a2, a3, a4, a5, a6, a7, 3707121342);
}

uint64_t sub_100021BA4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  *(_DWORD *)(v16 - 112) = v14 + (((v16 - 120) & 0x48EC8D96 | ~((v16 - 120) | 0x48EC8D96)) ^ 0x38B669AF) * v15 + 766;
  *(void *)(v16 - 104) = a12;
  *(void *)(v16 - 120) = v12;
  uint64_t v17 = (*(uint64_t (**)(uint64_t))(v13 + 8 * (v14 + 1669)))(v16 - 120);
  return sub_100021BFC(v17);
}

void sub_100021C38()
{
}

uint64_t sub_100021D14(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4)
{
  int v6 = v4 < (((a4 ^ 0x79B) - 200) ^ 0xF0);
  return (*(uint64_t (**)(void))(v5 + 8 * ((8 * v6) | (v6 << 6) | a4)))();
}

uint64_t sub_100021D48(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,int a38,int a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,unsigned int *a57)
{
  if (v57 == 1678813236 || v57 == 1678813233)
  {
    LOBYTE(STACK[0x185F]) = LOBYTE(STACK[0x59F]) ^ 0x52;
    LOBYTE(STACK[0x185E]) = LOBYTE(STACK[0x59E]) ^ 0x52;
    LOBYTE(STACK[0x185D]) = LOBYTE(STACK[0x59D]) ^ 0x52;
    LOBYTE(STACK[0x185C]) = LOBYTE(STACK[0x59C]) ^ 0x52;
    LOBYTE(STACK[0x185B]) = LOBYTE(STACK[0x59B]) ^ 0x52;
    LOBYTE(STACK[0x185A]) = LOBYTE(STACK[0x59A]) ^ 0x52;
    LOBYTE(STACK[0x1859]) = LOBYTE(STACK[0x599]) ^ 0x52;
    LOBYTE(STACK[0x1858]) = LOBYTE(STACK[0x598]) ^ 0x52;
    LOBYTE(STACK[0x1857]) = LOBYTE(STACK[0x597]) ^ 0x52;
    LOBYTE(STACK[0x1856]) = LOBYTE(STACK[0x596]) ^ 0x52;
    LOBYTE(STACK[0x1855]) = LOBYTE(STACK[0x595]) ^ 0x52;
    LOBYTE(STACK[0x1854]) = LOBYTE(STACK[0x594]) ^ 0x52;
    LOBYTE(STACK[0x1853]) = LOBYTE(STACK[0x593]) ^ 0x52;
    LOBYTE(STACK[0x1852]) = LOBYTE(STACK[0x592]) ^ 0x52;
    LOBYTE(STACK[0x1851]) = LOBYTE(STACK[0x591]) ^ 0x52;
    LOBYTE(STACK[0x1850]) = LOBYTE(STACK[0x590]) ^ 0x52;
  }
  int v60 = v58;
  int v61 = v58 - 614;
  int v62 = (*(uint64_t (**)(void, void, void, void, unint64_t *, unint64_t, void, unint64_t *))(v59 + 8 * (v58 + 391)))(LODWORD(STACK[0x3BC]), (v57 - 1678813228), a39 ^ 0xC1EF3DAu, LODWORD(STACK[0x38C]) ^ 0x400DE86Cu, &STACK[0x1850], STACK[0x4E8], LODWORD(STACK[0x340]), &STACK[0x1820]);
  unsigned int v63 = ((2 * v62) & 0xBD7F73F2) + ((v58 - 1078) ^ 0x5EBFBB42 ^ v62);
  uint64_t v64 = (*(uint64_t (**)(void, unint64_t, void))(v59 + 8 * (v60 + 327)))(*a57, STACK[0x4E8], LODWORD(STACK[0x340]));
  return (*(uint64_t (**)(uint64_t))(v59 + 8 * ((41 * (v63 == 1589623289)) ^ v61)))(v64);
}

uint64_t sub_100021F08()
{
  return (*(uint64_t (**)(void))(v1 + 8 * ((114 * (v0 + 1 != v3 + 32)) ^ v2)))();
}

uint64_t sub_100021FD4(int a1)
{
  return (*(uint64_t (**)(void))(v4
                              + 8
                              * (((*(unsigned __int8 *)(v1 + v3 - 0x4F92F29E82627B65) != *(unsigned __int8 *)(v2 + v3 - 0x4F92F29E82627B65))
                                * (a1 + 259 + (a1 ^ v5) - 1170)) ^ a1)))();
}

uint64_t sub_10002201C@<X0>(int a1@<W8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
  uint64_t v43 = (unsigned int *)(v39 + 4 * v37);
  int v44 = ((a1 + 255) ^ (v42 + 1100)) & v38;
  uint64_t v45 = v37 + 1;
  int v46 = *(_DWORD *)(v39 + 4 * v45);
  unsigned int v47 = v43[397] ^ ((v46 & 0x7FFFFFFE | v44) >> 1);
  unsigned int *v43 = (v47 + v40 - ((2 * v47) & 0x5C7D671A)) ^ *((_DWORD *)&a37 + (v46 & 1));
  return (*(uint64_t (**)(void))(v41 + 8 * ((1927 * (v45 == 227)) ^ a1)))();
}

uint64_t sub_100022090(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  return (*(uint64_t (**)(void))(v4
                              + 8
                              * ((((a4 - 49260597) & 0x2EFA679 ^ (a4 - 1432428549) & 0x55611F6D ^ 0x232)
                                * (*(_DWORD *)(v5 - 144) == *(_DWORD *)(v5 - 148))) ^ a4)))();
}

void sub_1000220F0(uint64_t a1, uint64_t a2)
{
  __asm { BRAA            X9, X17 }
}

uint64_t sub_10002216C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_10003F858(a1, a2, a3, a4, STACK[0x4B0]);
}

uint64_t sub_100022184(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,int a45)
{
  int v47 = STACK[0x2A8];
  int v48 = STACK[0x37C];
  LODWORD(STACK[0x2B8]) = STACK[0x37C];
  int v49 = 460628867 * ((-2067849607 - ((v46 - 200) | 0x84BF1E79) + ((v46 - 200) | 0x7B40E186)) ^ 0x37D663FB);
  *(_DWORD *)(v46 - 176) = (a45 - ((2 * a45 + 735198082) & 0x53FCE07C) - 1075343873) ^ v49;
  *(_DWORD *)(v46 - 200) = v47 - v49 - 1375;
  *(void *)(v46 - 168) = &STACK[0x590];
  *(void *)(v46 - 152) = &STACK[0x13E505825523BA47];
  *(void *)(v46 - 144) = a44;
  *(_DWORD *)(v46 - 156) = (v48 - ((2 * v48 + 937340840) & 0x71AB89EA) - 725279543) ^ v49;
  *(void *)(v46 - 192) = &STACK[0x7B8F2B3A773DAA78];
  *(void *)(v46 - 184) = &STACK[0x180D539AA7C262];
  uint64_t v50 = (*(uint64_t (**)(uint64_t))(v45 + 8 * (v47 ^ 0xE8E)))(v46 - 200);
  int v51 = *(_DWORD *)(v46 - 160);
  LODWORD(STACK[0x464]) = v51;
  return (*(uint64_t (**)(uint64_t))(v45 + 8 * ((1203 * (v51 == -1158872075)) ^ (v47 - 1078))))(v50);
}

uint64_t sub_1000222F8()
{
  **(_DWORD **)(v0 - 0x4C6937770F4864B0) = ((v2 ^ 0xB7) - 848504150) ^ (v1 + 2139855715);
  return sub_100022340();
}

void sub_100022340(int a1@<W8>)
{
  *(_DWORD *)(v1 - 0x4C6937770F4864B4) = a1;
}

uint64_t sub_100022358(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, int a6, int a7, int a8)
{
  return (*(uint64_t (**)(void))(v8 + 8 * (((v11 == ((v12 + a5) & a8 ^ v9 ^ (v12 + a6) & a7)) * v10) ^ v12)))();
}

uint64_t sub_10002238C()
{
  return (*(uint64_t (**)(void))(v3 + 8 * (((((v4 + 105) ^ 0x4CFu) + v1 + v0 > 7) * v2) ^ (v4 + 105))))();
}

uint64_t sub_1000223A0@<X0>(int a1@<W8>)
{
  return (*(uint64_t (**)(uint64_t))(v2
                                            + 8
                                            * ((63 * (a1 == ((v3 + v1 + 576 + 2638) & 0x855C67FD) + 71915253)) ^ v1)))(1158830123);
}

uint64_t sub_1000223EC()
{
  return (*(uint64_t (**)(void))(v4
                              + 8
                              * ((((v1 & (2 * (*(unsigned __int8 *)(v3 + 6) - 1)))
                                 + ((*(unsigned __int8 *)(v3 + 6) - 1) ^ v0) == v0)
                                * (v2 + 1500)) ^ v2)))();
}

uint64_t sub_100022474()
{
  return (*(uint64_t (**)(void))(v2 + 8 * (((v1 + 1 != v3 + 48) | (32 * (v1 + 1 != v3 + 48))) ^ v0)))();
}

uint64_t sub_100022550@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36)
{
  uint64_t v39 = *(void *)(a1 + 24);
  *(int8x16_t *)(v38 - 112) = veorq_s8(*(int8x16_t *)*(void *)(a1 + 40), (int8x16_t)xmmword_100056D60);
  if (a9) {
    BOOL v40 = v39 == 0x180D539AA7AA32;
  }
  else {
    BOOL v40 = 1;
  }
  int v41 = v40;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v37 + 8 * ((v41 * ((v36 + 58) ^ 0x5AB)) ^ v36)))(a1, a2, a3, a4, a5, a6, a7, a8, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19, a20,
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
           a36);
}

uint64_t sub_1000225B8(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26)
{
  return (*(uint64_t (**)(void))(v26
                              + 8
                              * (((((a3 ^ 0xEFD) - 734) ^ a3 ^ 0xC15)
                                * ((unint64_t)(a21 - a26 - a5 - 0xBE6E86706A92175) < 0x20)) | a3)))();
}

void sub_100022614(uint64_t a1@<X8>, int a2, uint64_t a3, unsigned int a4)
{
  unsigned int v7 = 1178560073
     * (((&a2 | 0x3D9987B0) - &a2 + (&a2 & 0xC2667848)) ^ 0x870DFFD2);
  a2 = (v6 - 840) ^ v7;
  a4 = (~(2 * v4 - 1962695022) | 0x68081D3D) + v4 + v7 + ((v6 + 410) ^ 0x917DC1E7);
  a3 = a1;
  (*(void (**)(int *))(v5 + 8 * (v6 ^ 0xB8D)))(&a2);
  JUMPOUT(0x10001C590);
}

void sub_1000226B4()
{
}

void sub_1000228CC()
{
}

uint64_t sub_100022944(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, unint64_t *a14, uint64_t a15, unsigned int a16, unint64_t *a17, unint64_t *a18)
{
  int v21 = v20 ^ 0x49A;
  a17 = &STACK[0x6A5823FD3C5DCAB4];
  a18 = a14;
  a16 = (v21 - 566) ^ (1374699841 * ((&a16 & 0x3A281C42 | ~(&a16 | 0x3A281C42)) ^ 0xA823FBB4));
  (*(void (**)(unsigned int *))(v19 + 8 * (v21 + 979)))(&a16);
  a16 = (v21 - 566) ^ (1374699841
                     * ((((2 * &a16) | 0xF610D1B2) - &a16 - 2064148697) ^ 0x16FC70D0));
  a17 = &STACK[0x6A5823FD3C5DCAB8];
  a18 = a14;
  (*(void (**)(unsigned int *))(v19 + 8 * (v21 + 979)))(&a16);
  a16 = (v21 - 566) ^ (1374699841
                     * ((((&a16 | 0x3FC1A968) ^ 0xFFFFFFFE) - (~&a16 | 0xC03E5697)) ^ 0xADCA4E9E));
  a17 = &STACK[0x6A5823FD3C5DCAD0];
  a18 = a14;
  (*(void (**)(unsigned int *))(v19 + 8 * (v21 + 979)))(&a16);
  LODWORD(a18) = v21
               - 1755732067
               * (((&a16 ^ 0x3C32CFEE) + 814069247 - 2 * ((&a16 ^ 0x3C32CFEE) & 0x3085B5FF)) ^ 0xD271C7CA)
               + 621;
  a17 = a14;
  uint64_t v22 = (*(uint64_t (**)(unsigned int *))(v19 + 8 * (v21 ^ 0xC7Au)))(&a16);
  return (*(uint64_t (**)(uint64_t))(v19
                                            + 8
                                            * (int)(((a16 == v18) * (((v21 - 673355174) & 0x91DC77C7) + 1847827317)) ^ v21)))(v22);
}

uint64_t sub_100022B34@<X0>(int a1@<W2>, int a2@<W3>, int a3@<W4>, uint64_t a4@<X8>)
{
  uint64_t v10 = a1 + a3 + ((169 * (v8 ^ 0xEE)) ^ 0x619 ^ (a2 + 3449)) + a4;
  uint64_t v11 = ((_BYTE)a1 + (_BYTE)a3 + ((-87 * (v8 ^ 0xEE)) ^ 0x19 ^ (a2 + 121))) & 0xF;
  unint64_t v12 = v11 + v5 - v10;
  unint64_t v13 = (v11 | v7) - v10;
  unint64_t v14 = (v11 | v6) - v10;
  BOOL v18 = (unint64_t)(v4 - a4) > 0xF && v12 > 0xF && v13 > 0xF && v14 > 0xF;
  return (*(uint64_t (**)(void))(v9 + 8 * ((30 * v18) ^ v8)))();
}

void sub_100022BB4()
{
  *int v0 = 1158830124;
  JUMPOUT(0x10000735CLL);
}

uint64_t sub_100022BC4()
{
  return (*(uint64_t (**)(void))(v3 + 8 * ((((v2 - 1093) ^ 0x287) * ((v1 + v0 - 1590476071) > 7)) ^ v2)))();
}

uint64_t sub_100022C1C(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, int a20,int a21)
{
  return sub_100003F90(v21 == v22 + (a3 ^ (a3 - 273)) - 1815, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19, a20, a21);
}

void sub_100022C3C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9, uint64_t a10)
{
  int v15 = (((v14 - 144) & 0x6B75664C | ~((v14 - 144) | 0x6B75664C)) ^ 0xD81C1BCE) * a9;
  *(void *)(v14 - 128) = v13;
  *(void *)(v14 - 144) = a10;
  *(_DWORD *)(v14 - 120) = v10 - v15 + (((v12 ^ 0x7FB) + 499) ^ 0xDEEA9AA0);
  *(_DWORD *)(v14 - 136) = (v12 ^ 0x7FB) - v15 + 1396;
  (*(void (**)(uint64_t))(v11 + 8 * (v12 ^ 0xDF4)))(v14 - 144);
  sub_1000338C8();
}

uint64_t sub_100022CC8@<X0>(uint64_t a1@<X3>, uint64_t a2@<X8>)
{
  unint64_t v6 = a2 + v3;
  *(unsigned char *)(v6 + a1 - 1) = v4;
  return (*(uint64_t (**)(void))(v5 + 8 * (((v6 < 0x40) | (2 * (v6 < 0x40))) ^ (v2 - 2000436013) & 0x773C3BD7u)))();
}

uint64_t sub_100022D18@<X0>(unsigned __int8 *a1@<X8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,unsigned int a34,uint64_t a35)
{
  int v40 = (v37 - 267) | 0x4E0;
  uint64_t v41 = *(void *)(v39 + 8 * (v37 ^ 0x430)) - 8;
  int v42 = *(unsigned __int8 *)(v41 + (*(unsigned __int8 *)(v35 - 0x180D539AA7AA31) ^ 0x85));
  HIDWORD(v43) = v42 ^ 0x31;
  LODWORD(v43) = (v42 ^ 0x80) << 24;
  int v44 = (v43 >> 30) ^ 0x9F;
  uint64_t v45 = *(void *)(v39 + 8 * (v37 - 951)) - 8;
  int v46 = *(unsigned __int8 *)(v45 + (*(unsigned __int8 *)(v35 - 0x180D539AA7AA27) ^ 0xBFLL));
  HIDWORD(v43) = v46 ^ 8;
  LODWORD(v43) = (v40 ^ v46 ^ 0x70) << 24;
  LOBYTE(v46) = v43 >> 28;
  int v47 = v44 << 16;
  int v48 = *(unsigned __int8 *)(v41 + (*(unsigned __int8 *)(v35 - 0x180D539AA7AA2DLL) ^ 0x6FLL));
  HIDWORD(v43) = v48 ^ 0x31;
  LODWORD(v43) = (v48 ^ 0x80) << 24;
  uint64_t v49 = *(void *)(v39 + 8 * (v37 - 1034)) - 12;
  int v50 = v46 | ((*(unsigned __int8 *)(v49 + (*(unsigned __int8 *)(v35 - 0x180D539AA7AA28) ^ 0xB7)) ^ 0xD9) << 8);
  uint64_t v51 = *(void *)(v39 + 8 * (v37 - 978)) - 4;
  unsigned __int8 v52 = *(unsigned char *)(v51 + (*(unsigned __int8 *)(v35 - 0x180D539AA7AA26) ^ 0xD8));
  unint64_t v53 = ((*(unsigned __int8 *)(v49 + (*(unsigned __int8 *)(v35 - 0x180D539AA7AA24) ^ 0xC7)) ^ 0x39) << 8) & 0xFFFFFFFF00FFFFFFLL | ((unint64_t)(v52 ^ 0x2Eu) << 24);
  int v54 = (((v43 >> 30) ^ 0x68) << 16) | ((*(unsigned __int8 *)(v49
                                                                             + (*(unsigned __int8 *)(v35 - 0x180D539AA7AA2CLL) ^ 0xDFLL)) ^ 0xF8) << 8);
  int v55 = *(unsigned __int8 *)(v45 + (*(unsigned __int8 *)(v35 - 0x180D539AA7AA23) ^ 0xBCLL));
  HIDWORD(v43) = v55 ^ 8;
  LODWORD(v43) = (v55 ^ 0xFFFFFF9F) << 24;
  LOBYTE(v55) = v43 >> 28;
  int v56 = *(unsigned __int8 *)(v45 + (*(unsigned __int8 *)(v35 - 0x180D539AA7AA2BLL) ^ 0x98));
  HIDWORD(v43) = v56 ^ 8;
  LODWORD(v43) = (v56 ^ 0xFFFFFF9F) << 24;
  int v57 = v43 >> 28;
  int v58 = v54 | ((*(unsigned __int8 *)(v51 + (*(unsigned __int8 *)(v35 - 0x180D539AA7AA2ELL) ^ 0xAFLL)) ^ 0xFE) << 24);
  int v59 = v47 | ((*(unsigned __int8 *)(v49 + (*(unsigned __int8 *)(v35 - 0x180D539AA7AA30) ^ 0x49)) ^ 0x72) << 8) | ((*(unsigned __int8 *)(v51 + (*v36 ^ 0xFELL)) ^ 0x27) << 24);
  int v60 = *(unsigned __int8 *)(v45 + (*(unsigned __int8 *)(v35 - 0x180D539AA7AA2FLL) ^ 0xD0));
  HIDWORD(v43) = v60 ^ 8;
  LODWORD(v43) = (v60 ^ 0xFFFFFF9F) << 24;
  int v61 = *(unsigned __int8 *)(v41 + (*(unsigned __int8 *)(v35 - 0x180D539AA7AA25) ^ 0xB6));
  LOBYTE(v60) = (v43 >> 28) ^ 0x3C;
  HIDWORD(v43) = v61 ^ 0x31;
  LODWORD(v43) = (v61 ^ 0x80) << 24;
  uint64_t v62 = (v43 >> 30) ^ 0x21;
  int v63 = *(unsigned __int8 *)(v41 + (*(unsigned __int8 *)(v35 - 0x180D539AA7AA29) ^ 0xC8));
  HIDWORD(v43) = v63 ^ 0x31;
  LODWORD(v43) = (v63 ^ 0x80) << 24;
  LODWORD(v51) = *(unsigned __int8 *)(v51 + (*(unsigned __int8 *)(v35 - 0x180D539AA7AA2ALL) ^ 0x18));
  unsigned int v64 = (v53 & 0xFFFFFF00 | (v62 << 16) | v55 ^ 0x68) ^ 0xB32185A;
  uint64_t v65 = *(void *)(v39 + 8 * (v37 - 1004)) - 8;
  unsigned int v66 = v50 & 0xFF00FFFF | (((v43 >> 30) ^ 0x37) << 16) | ((v51 ^ 0x61) << 24);
  LODWORD(v51) = ((BYTE1(v53) ^ 0x9E) - ((2 * (((v53 | (v62 << 16)) >> 8) ^ 0x75F49E)) & 0x96) - 1020968629) ^ *(_DWORD *)(v65 + 4 * (BYTE1(v53) ^ 0x6BLL));
  unsigned int v67 = v62 ^ 0xDD;
  LODWORD(v62) = v51 - ((2 * v51) & 0x683E3FD6);
  uint64_t v68 = *(void *)(v39 + 8 * (v37 - 1012)) - 4;
  int v69 = *(_DWORD *)(v68 + 4 * (v52 ^ 0x31u));
  HIDWORD(v43) = ~v69;
  LODWORD(v43) = v69 ^ 0x3CDFE274;
  uint64_t v70 = *(void *)(v39 + 8 * (v37 ^ 0x418)) - 4;
  int v71 = (v43 >> 2) ^ *(_DWORD *)(v70 + 4 * v67) ^ (v62 + 874455019);
  uint64_t v72 = *(void *)(v39 + 8 * (v37 ^ 0x461));
  unsigned int v250 = v59 & 0xFFFFFF00 | v60;
  int v73 = v250 ^ *(_DWORD *)(v72 + 4 * (v55 ^ 0xD9u)) ^ 0x27C749E1 ^ (v71
                                                                                     - ((2 * v71) & 0x5B2D5B2A)
                                                                                     + 764849557);
  unsigned int v251 = v58 & 0xFFFFFF00 | v57;
  int v74 = v251 - 2 * ((v58 & 0x27C74900 | v57 & 0xF3) ^ v57 & 0x12) + 667372001;
  unsigned int v248 = v66;
  unsigned int v249 = v64;
  int v246 = v74 ^ 0x2789BBD4 ^ v73;
  int v75 = v66 ^ 0x46E9BEEA ^ v246;
  LODWORD(v62) = v75 ^ v64;
  int v76 = *(_DWORD *)(v68 + 4 * (((v75 ^ v64) >> 24) ^ 0x19));
  HIDWORD(v43) = ~v76;
  LODWORD(v43) = v76 ^ 0x3CDFE274;
  int v77 = ((v43 >> 2) - ((2 * (v43 >> 2)) & 0x5B2D5B2A) + 764849557) ^ *(_DWORD *)(v72
                                                                               + 4
                                                                               * ((v75 ^ v64) ^ 0x7Cu));
  LODWORD(v62) = *(_DWORD *)(v65 + 4 * (BYTE1(v62) ^ 0x26u)) ^ *(_DWORD *)(v70 + 4 * (BYTE2(v62) ^ 0xA0u)) ^ ((BYTE1(v62) ^ 0xD3) - ((2 * ((v62 >> 8) ^ 0x7389D3)) & 0x96) - 1020968629) ^ (v77 - ((2 * v77) & 0x683E3FD6) + 874455019);
  LODWORD(v62) = v62 - ((2 * v62) & 0x4F8E93C2) + 667372001;
  unsigned int v78 = v74 ^ 0x918A9AC4 ^ v62;
  int v244 = v75 ^ v64 ^ 0x2DD30B38;
  int v245 = v75;
  int v79 = v78 ^ v75;
  int v80 = v79 ^ v244;
  int v81 = *(_DWORD *)(v68 + 4 * (((v79 ^ v244) >> 24) ^ 0x16));
  HIDWORD(v43) = ~v81;
  LODWORD(v43) = v81 ^ 0x3CDFE274;
  int v82 = *(_DWORD *)(v65 + 4 * (((unsigned __int16)(v80 ^ 0xCF76) >> 8) ^ 0xF5u)) ^ *(_DWORD *)(v70 + 4 * (BYTE2(v80) ^ 0x14u)) ^ (((unsigned __int16)(v80 ^ 0xCF76) >> 8) - (((v80 ^ 0x7C3DCF76u) >> 7) & 0x96) - 1020968629) ^ ((v43 >> 2) - ((2 * (v43 >> 2)) & 0x683E3FD6) + 874455019);
  int v247 = v73;
  LODWORD(v242) = v62 ^ v73;
  HIDWORD(v242) = v79 ^ v244;
  int v83 = v62 ^ v73 ^ *(_DWORD *)(v72 + 4 * ((v79 ^ v244) ^ 0x33u)) ^ (v82
                                                                                      - ((2 * v82) & 0x5B2D5B2A)
                                                                                      + 764849557);
  unint64_t v243 = __PAIR64__(v78, v79);
  LODWORD(v241) = ((v83 ^ 0x516EF336) - ((2 * (v83 ^ 0x516EF336)) & 0xCEDBA44C) - 412233178) ^ v78;
  unsigned int v84 = v241 ^ 0x8EDEEA78 ^ v79;
  unsigned int v85 = v84 ^ v79 ^ v244 ^ 0x7C3DCF76;
  LODWORD(v62) = *(_DWORD *)(v68 + 4 * (HIBYTE(v85) ^ 0xC6));
  HIDWORD(v43) = ~v62;
  LODWORD(v43) = v62 ^ 0x3CDFE274;
  LODWORD(v62) = (v43 >> 2) ^ *(_DWORD *)(v65 + 4 * (BYTE1(v85) ^ 0xFBu)) ^ ((BYTE1(v85) ^ 0xE)
                                                                             - ((2 * ((v85 >> 8) ^ 0xAC0F0E)) & 0x96)
                                                                             - 1020968629);
  LODWORD(v62) = (v62 - ((2 * v62) & 0x5B2D5B2A) + 764849557) ^ *(_DWORD *)(v72
                                                                          + 4
                                                                          * ((v84 ^ v79 ^ v244 ^ 0x76) ^ 0xCBu));
  HIDWORD(v241) = v83;
  LODWORD(v62) = v83 ^ *(_DWORD *)(v70 + 4 * (BYTE2(v85) ^ 0x26u)) ^ (v62 - ((2 * v62) & 0x683E3FD6) + 874455019);
  HIDWORD(v239) = v62 ^ 0x980EBEDC;
  unint64_t v240 = __PAIR64__(v84, v85);
  unsigned int v86 = v84 ^ 0xFF75D61D;
  LODWORD(v239) = v62 ^ 0x980EBEDC ^ ((v241 ^ 0x8EDEEA78) - ((2 * (v241 ^ 0x8EDEEA78)) & 0x92C09BD4) - 916435478);
  HIDWORD(v238) = v239 ^ 0x307C325C ^ v84 ^ 0xFF75D61D;
  int v87 = *(_DWORD *)(v68 + 4 * (((HIDWORD(v238) ^ v85) >> 24) ^ 5));
  HIDWORD(v43) = ~v87;
  LODWORD(v43) = v87 ^ 0x3CDFE274;
  int v88 = ((v43 >> 2) - ((2 * (v43 >> 2)) & 0x5B2D5B2A) + 764849557) ^ *(_DWORD *)(v72
                                                                               + 4
                                                                               * ((BYTE4(v238) ^ v85) ^ 0x32u));
  unsigned int v89 = HIDWORD(v238) ^ v85 ^ 0x6F671777;
  LODWORD(v238) = HIDWORD(v238) ^ v85;
  LODWORD(v62) = *(_DWORD *)(v65 + 4 * (BYTE1(v89) ^ 0xF5u)) ^ *(_DWORD *)(v70
                                                                           + 4
                                                                           * (((HIDWORD(v238) ^ v85) >> 16) ^ 0x4Eu)) ^ v62 ^ (BYTE1(v89) - ((v89 >> 7) & 0x96) - 1020968629) ^ (v88 - ((2 * v88) & 0x683E3FD6) + 874455019);
  int v90 = v62 ^ v86;
  unsigned int v91 = v62 ^ v86 ^ v89;
  int v92 = *(_DWORD *)(v68 + 4 * (HIBYTE(v91) ^ 0x21));
  HIDWORD(v43) = ~v92;
  LODWORD(v43) = v92 ^ 0x3CDFE274;
  int v93 = ((v43 >> 2) - ((2 * (v43 >> 2)) & 0x683E3FD6) + 874455019) ^ *(_DWORD *)(v70 + 4 * (BYTE2(v91) ^ 0xCEu));
  unsigned int v94 = (v93 + 764849557 + (~(2 * v93) | 0xA4D2A4D5) + 1) ^ *(_DWORD *)(v72 + 4 * (v91 ^ 0xA7u));
  int v95 = ((unsigned __int16)(v91 ^ 0x48E2) >> 8);
  unsigned int v96 = (v94 - ((2 * v94) & 0x864A8296) - 1020968629) ^ *(_DWORD *)(v65 + 4 * (v95 ^ 0xF5u));
  int v97 = v62 ^ 0x987B8B74 ^ v95 ^ (v96 - ((2 * v96) & 0x922AF084) - 921339838);
  LODWORD(v237) = v90;
  HIDWORD(v237) = v62 ^ 0x987B8B74;
  unsigned int v98 = v62 ^ 0x987B8B74 ^ ((v239 ^ 0x307C325C) - ((2 * (v239 ^ 0x307C325C)) & 0x922AF084) - 921339838);
  unint64_t v236 = __PAIR64__(v91, v98);
  HIDWORD(v235) = v97 ^ 0x8BD616D1;
  unsigned int v99 = v97 ^ 0x8BD616D1 ^ (v98 - ((2 * v98) & 0x17AC2DA2) - 1948903727);
  unsigned int v100 = v99 ^ 0xE6F58988 ^ v90;
  unsigned int v101 = v100 ^ v91 ^ 0x4BE748E2;
  LODWORD(v62) = *(_DWORD *)(v68 + 4 * (HIBYTE(v101) ^ 0x12));
  HIDWORD(v43) = ~v62;
  LODWORD(v43) = v62 ^ 0x3CDFE274;
  LODWORD(v62) = *(_DWORD *)(v65 + 4 * (((unsigned __int16)(v101 ^ 0x8988) >> 8) ^ 0xF5u)) ^ *(_DWORD *)(v70 + 4 * (BYTE2(v101) ^ 0xDCu)) ^ (((unsigned __int16)(v101 ^ 0x8988) >> 8) - (((v101 ^ 0x78F58988) >> 7) & 0x96) - 1020968629) ^ ((v43 >> 2) - ((2 * (v43 >> 2)) & 0x683E3FD6) + 874455019);
  unsigned int v102 = *(_DWORD *)(v72 + 4 * ((v100 ^ v91 ^ 0xE2) ^ 0xCDu)) ^ v97 ^ 0xD081E13A ^ (v62 - ((2 * v62) & 0x5B2D5B2A) + 764849557);
  HIDWORD(v234) = v100 ^ 0xE97415AA;
  LODWORD(v235) = v99;
  LODWORD(v234) = v102 ^ ((v99 ^ 0xE6F58988) - 2 * ((v99 ^ 0xE6F58988) & 0x5081E13B ^ v99 & 1) - 796794566);
  unsigned int v103 = ((v234 ^ 0x5BF36347) - ((2 * (v234 ^ 0x5BF36347)) & 0x7035CD38) - 1206196580) ^ v100 ^ 0xE97415AA;
  unsigned int v104 = v103 ^ v101 ^ 0x78F58988;
  LODWORD(v62) = ((BYTE1(v104) ^ 0xBB) - ((2 * ((v104 >> 8) ^ 0x1A89BB)) & 0x96) - 1020968629) ^ *(_DWORD *)(v65 + 4 * (BYTE1(v104) ^ 0x4Eu));
  LODWORD(v62) = (v62 - ((2 * v62) & 0x5B2D5B2A) + 764849557) ^ *(_DWORD *)(v72
                                                                          + 4
                                                                          * ((v103 ^ v101 ^ 0x88) ^ 0x91u));
  int v105 = *(_DWORD *)(v68 + 4 * (HIBYTE(v104) ^ 0x70));
  HIDWORD(v43) = ~v105;
  LODWORD(v43) = v105 ^ 0x3CDFE274;
  LODWORD(v62) = (v43 >> 2) ^ *(_DWORD *)(v70 + 4 * (BYTE2(v104) ^ 0xA0u)) ^ (v62
                                                                              - ((2 * v62) & 0x683E3FD6)
                                                                              + 874455019);
  *(void *)((char *)&v234 + 4) = __PAIR64__(v101, v102);
  HIDWORD(v232) = (v62 - ((2 * v62) & 0xA103C274) - 796794566) ^ v102;
  unint64_t v233 = __PAIR64__(v103, v104);
  int v106 = HIDWORD(v232) ^ 0x930000ED ^ v234 ^ 0x5BF36347;
  HIDWORD(v231) = v103 ^ 0x9AAB5A2C ^ ((v106 ^ 0x8D06EA22)
                                     - 2 * ((v106 ^ 0x8D06EA22) & 0x3DEE8ADB ^ v106 & 8)
                                     - 1108440365);
  int v107 = *(_DWORD *)(v68 + 4 * (((HIDWORD(v231) ^ v104) >> 24) ^ 0x23));
  HIDWORD(v43) = ~v107;
  LODWORD(v43) = v107 ^ 0x3CDFE274;
  int v108 = ((unsigned __int16)(WORD2(v231) ^ v104 ^ 0x1195) >> 8);
  int v109 = *(_DWORD *)(v72 + 4 * ((BYTE4(v231) ^ v104) ^ 0xD0u)) ^ *(_DWORD *)(v65
                                                                                              + 4 * (v108 ^ 0xF5u)) ^ 0xEEB3ECDE ^ (v43 >> 2);
  LODWORD(v231) = HIDWORD(v231) ^ v104;
  unsigned int v110 = (v109 - ((2 * v109) & 0x683E3FD6) + 874455019) ^ *(_DWORD *)(v70
                                                                    + 4
                                                                    * (((HIDWORD(v231) ^ v104) >> 16) ^ 0x7Eu)) ^ HIDWORD(v232) ^ 0x930000ED ^ v108;
  LODWORD(v232) = v106;
  LODWORD(v62) = v110 ^ v103 ^ HIDWORD(v231) ^ v104 ^ 0x49571195;
  LODWORD(v68) = *(_DWORD *)(v68 + 4 * (BYTE3(v62) ^ 0x63));
  unsigned int v111 = v62 ^ 0x2745D0FF;
  HIDWORD(v230) = v62 ^ 0x1E719A5D;
  HIDWORD(v43) = ~v68;
  LODWORD(v43) = v68 ^ 0x3CDFE274;
  LODWORD(v68) = *(_DWORD *)(v65 + 4 * (BYTE1(v111) ^ 0xFDu)) ^ *(_DWORD *)(v72
                                                                            + 4
                                                                            * (~(_BYTE)v62 ^ 0xC4u)) ^ ((BYTE1(v111) ^ 8) - 2 * (((v111 >> 8) ^ 0x2E3F08) & 0x4F ^ (v111 >> 8) & 4) - 1020968629) ^ ((v43 >> 2) - ((2 * (v43 >> 2)) & 0x5B2D5B2A) + 764849557);
  LODWORD(v68) = (v68 - ((2 * v68) & 0x683E3FD6) + 874455019) ^ *(_DWORD *)(v70
                                                                          + 4
                                                                          * (((v62 ^ 0x2745D0FF) >> 16) ^ 0x16u));
  LODWORD(v70) = v110 ^ v103 ^ 0x452FF2BF;
  uint64_t v112 = *(void *)(v39 + 8 * (v37 ^ 0x443)) - 8;
  uint64_t v113 = *(void *)(v39 + 8 * (v37 - 895)) - 4;
  int v114 = *(unsigned __int8 *)(v113 + (*(unsigned __int8 *)(v38 - 109) ^ 0xA5));
  HIDWORD(v43) = v114 ^ 0x3B;
  LODWORD(v43) = (v114 ^ 0x80) << 24;
  uint64_t v115 = *(void *)(v39 + 8 * (v37 ^ 0x454)) - 12;
  uint64_t v116 = *(void *)(v39 + 8 * (v37 ^ 0x494)) - 8;
  uint64_t v228 = v113;
  uint64_t v229 = v112;
  uint64_t v227 = v115;
  LODWORD(v41) = (((((v43 >> 30) ^ 0xDB) >> 2) | (((v43 >> 30) ^ 0xDB) << 6)) | ((*(unsigned __int8 *)(v115 + (*(unsigned __int8 *)(v38 - 111) ^ 0x7ALL)) ^ 0x6E) << 16) | ((*(unsigned __int8 *)(v116 + (*(unsigned __int8 *)(v38 - 112) ^ 0x78)) ^ 0x94) << 24) | (((*(unsigned char *)(v112 + (*(unsigned __int8 *)(v38 - 110) ^ 0x5DLL)) + (*(unsigned char *)(v38 - 110) ^ 0x52) - 96) ^ 0x5D) << 8)) ^ 0x18D31094;
  unsigned int v117 = ((*(unsigned __int8 *)(v113 + (*(unsigned __int8 *)(v38 - 101) ^ 0x60)) ^ 0x70) & 0xFFFF00FF | ((*(unsigned __int8 *)(v115 + (*(unsigned __int8 *)(v38 - 103) ^ 5)) ^ 0x3F) << 16) | (((*(unsigned char *)(v112 + (*(unsigned __int8 *)(v38 - 102) ^ 4)) + (*(unsigned char *)(v38 - 102) ^ 0xB) - 96) ^ 0x33) << 8) | ((*(unsigned __int8 *)(v116 + (*(unsigned __int8 *)(v38 - 104) ^ 0x1CLL)) ^ 0x61) << 24)) ^ 0x44531A8F;
  unsigned int v118 = ((*(unsigned __int8 *)(v113 + (*(unsigned __int8 *)(v38 - 105) ^ 0x28)) ^ 0xB1) & 0xFFFF00FF | ((((*(unsigned char *)(v38 - 106) ^ 0xAC) + *(unsigned char *)(v112 + (*(unsigned __int8 *)(v38 - 106) ^ 0xA3)) - 96) ^ 0xF6) << 8) | ((*(unsigned __int8 *)(v116 + (*(unsigned __int8 *)(v38 - 108) ^ 0xB2)) ^ 0x96) << 24) | ((*(unsigned __int8 *)(v115 + (*(unsigned __int8 *)(v38 - 107) ^ 0x27)) ^ 0x5B) << 16)) ^ 0x6525C9CC;
  unsigned int v119 = ((*(unsigned __int8 *)(v113 + (*(unsigned __int8 *)(v38 - 97) ^ 0x7BLL)) ^ 0xC4) & 0xFFFF00FF | ((((*(unsigned char *)(v38 - 98) ^ 0xD0) + *(unsigned char *)(v112 + (*(unsigned __int8 *)(v38 - 98) ^ 0xDFLL)) - 96) ^ 0xE4) << 8) | ((*(unsigned __int8 *)(v115 + (*(unsigned __int8 *)(v38 - 99) ^ 0xAALL)) ^ 0xD) << 16) | ((*(unsigned __int8 *)(v116 + (*(unsigned __int8 *)(v38 - 100) ^ 0x45)) ^ 0xAE) << 24)) ^ 0x987502FE;
  unsigned int v120 = (v106 ^ 0x8D06EA22) - 2 * ((v106 ^ 0x8D06EA22) & 0x6F5797F7 ^ v106 & 4) + 1868011507;
  int v121 = v68 - ((2 * v68) & 0xDEAF2FE6) + 1868011507;
  HIDWORD(v225) = v40 + 630863891;
  LODWORD(v225) = (v37 - 267) & 0x60E31801 | 0xA0;
  HIDWORD(v224) = v40 ^ 0x76B;
  LODWORD(v224) = v110 ^ 0x6F5797F3 ^ v120;
  HIDWORD(v223) = v40 ^ 0x721;
  LODWORD(v223) = v40 ^ 0x76F;
  HIDWORD(v226) = v110 ^ 0x6F5797F3;
  HIDWORD(v222) = v121 ^ v110 ^ 0x6F5797F3;
  LODWORD(v222) = v40 ^ 0x7EC;
  *(_DWORD *)(v38 - 124) = v40;
  HIDWORD(a5) = v40 ^ 0x74B;
  LODWORD(v230) = v70;
  LODWORD(v226) = v120 ^ 0x3DC8BA5D ^ v121;
  HIDWORD(a3) = v226 ^ v70;
  *(_DWORD *)(v38 - 244) = -1559264522;
  uint64_t v122 = (((v40 + 630863891) & 0xDA65C5DF) - 1501) & 0xA30F82F6 ^ 0xA30F82F7;
  *(void *)(v38 - 208) = v122;
  uint64_t v123 = a1[v122];
  *(void *)(v38 - 176) = 12;
  LODWORD(v123) = *(unsigned __int8 *)(v113 + (v123 ^ 0x41));
  uint64_t v124 = a1[12] ^ 0x60;
  *(void *)(v38 - 160) = 8;
  LODWORD(v124) = *(unsigned __int8 *)(v116 + v124);
  uint64_t v125 = a1[8];
  *(void *)(v38 - 136) = 1;
  LODWORD(v125) = *(unsigned __int8 *)(v116 + (v125 ^ 0xC1)) ^ 0xA1;
  LODWORD(v70) = *(unsigned __int8 *)(v115 + (a1[1] ^ 0x66)) ^ 0x82;
  *(void *)(v38 - 144) = 15;
  uint64_t v126 = a1[15] ^ 0xE9;
  *(void *)(v38 - 168) = 11;
  LODWORD(v124) = *(unsigned __int8 *)(v113 + v126) ^ 0x66 | ((v124 ^ 0x15) << 24);
  LODWORD(v126) = *(unsigned __int8 *)(v113 + (a1[11] ^ 0xC3));
  *(void *)(v38 - 184) = 0;
  int v127 = (v70 << 16) | ((*(unsigned __int8 *)(v116 + (*a1 ^ 0x30)) ^ 0x25) << 24);
  *(void *)(v38 - 152) = 2;
  unsigned int v128 = v127 & 0xFFFF00FF | (((*(unsigned char *)(v229 + (a1[2] ^ 0xC0)) + (a1[2] ^ 0xCF) - 96) ^ 0xF9) << 8);
  LODWORD(v123) = v123 ^ 0xB6 | ((*(unsigned __int8 *)(v116 + (a1[4] ^ 0xFCLL)) ^ 0x9B) << 24);
  *(void *)(v38 - 224) = 4;
  *(void *)(v38 - 216) = 5;
  LODWORD(v123) = v123 | ((*(unsigned __int8 *)(v115 + (a1[5] ^ 0xA9)) ^ 0xBF) << 16);
  *(void *)(v38 - 240) = 9;
  int v129 = (*(unsigned __int8 *)(v115 + (a1[9] ^ 0x5DLL)) ^ 0x51) << 16;
  *(void *)(v38 - 200) = 10;
  unsigned int v130 = v129 & 0xFFFF00FF | (((*(unsigned char *)(v229 + (a1[10] ^ 0xD5)) + (a1[10] ^ 0xDA) - 96) ^ 0xCF) << 8);
  *(void *)(v38 - 192) = 14;
  LODWORD(v124) = v124 & 0xFFFF00FF | ((*(unsigned char *)(v229 + (a1[14] ^ 0xE4)) + (a1[14] ^ 0xEB) + 32) << 8);
  *(void *)(v38 - 232) = 3;
  LODWORD(v68) = *(unsigned __int8 *)(v113 + (a1[3] ^ 0xDCLL)) ^ 0x72 | v128;
  *(void *)(v38 - 256) = 13;
  LODWORD(v124) = v124 | ((*(unsigned __int8 *)(v115 + (a1[13] ^ 0x92)) ^ 0x6C) << 16);
  LODWORD(v125) = (v130 | v126 ^ 0xAC | (v125 << 24))
                - 2 * ((v130 | v126 ^ 0xAC | (v125 << 24)) & 0x7DEAA337 ^ (v126 ^ 0xAC) & 1)
                - 34954442;
  LODWORD(v123) = v123 & 0xFFFF00FF | (((*(unsigned char *)(v229 + (a1[6] ^ 0x4FLL)) + (a1[6] ^ 0x40) - 96) ^ 0xB7) << 8);
  LODWORD(v126) = v41 ^ v250 ^ (v68 - ((2 * v68) & 0x42D5535A) - 1586845267);
  unsigned int v131 = v118 ^ v251 ^ (v123 - ((2 * v123) & 0xB938E0EA) - 593727371);
  LODWORD(v68) = (v124 - ((2 * v124) & 0x4399768E) + 567065415) ^ v119;
  unsigned int v132 = (v68 - ((2 * v68) & 0xFD8D0D5C) + 2126939822) ^ v249;
  LODWORD(v68) = v117 ^ v248 ^ v125;
  uint64_t v133 = *(void *)(v39 + 8 * (v40 ^ 0x76B)) - 12;
  LODWORD(v41) = *(_DWORD *)(v133 + 4 * (BYTE3(v68) ^ 0x3F));
  HIDWORD(v43) = ~v41;
  LODWORD(v43) = v41 ^ 0x20A394C6;
  uint64_t v134 = *(void *)(v39 + 8 * (*(_DWORD *)(v38 - 124) - 1952));
  LODWORD(v123) = (v43 >> 1) ^ ((BYTE2(v132) ^ 0x68)
                              + 913632926
                              - 2 * ((HIWORD(v132) ^ 0xB768) & 0x9F ^ HIWORD(v132) & 1)) ^ *(_DWORD *)(v134 + 4 * (BYTE2(v132) ^ 0x34u));
  unint64_t v135 = (char *)*(&off_10005CE90 + v225) - 8;
  LODWORD(v70) = *(_DWORD *)&v135[4 * ((v117 ^ v248 ^ v125) ^ 0xC6)] ^ ((BYTE2(v126) ^ 0xD5)
                                                                                       + 913632926
                                                                                       - ((2 * (WORD1(v126) ^ 0x6CD5)) & 0x13C)) ^ *(_DWORD *)(v134 + 4 * (BYTE2(v126) ^ 0x89u)) ^ (((v117 ^ v248 ^ v125) ^ 0xAB) - 1329622030 + ((2 * ((v117 ^ v248 ^ v125) ^ 0xAB) + 254) & 0x2E4 ^ 0xDDFE7FFF));
  unsigned int v136 = *(_DWORD *)(v134 + 4 * (BYTE2(v131) ^ 0x8Cu)) ^ *(_DWORD *)&v135[4 * (v132 ^ 0xB6)] ^ ((BYTE2(v131) ^ 0xD0) + 913632926 - ((2 * (HIWORD(v131) ^ 0xC8D0)) & 0x13C)) ^ ((v132 ^ 0xDB) - 1329622030 + ((2 * (v132 ^ 0xDB) + 254) & 0x2E4 ^ 0xDDFE7FFF));
  int v137 = *(_DWORD *)(v133 + 4 * (HIBYTE(v131) ^ 0xC8));
  HIDWORD(v43) = ~v137;
  LODWORD(v43) = v137 ^ 0x20A394C6;
  unint64_t v138 = (char *)*(&off_10005CE90 + *(_DWORD *)(v38 - 124) - 1852) - 8;
  LODWORD(v124) = ((BYTE2(v68) ^ 0xAD) + 913632926 - ((2 * (WORD1(v68) ^ 0x3FAD)) & 0x13C)) ^ *(_DWORD *)&v135[4 * (v126 ^ 0x1C)] ^ ((v126 ^ 0x71) - 1329622030 + ((2 * (v126 ^ 0x71) + 254) & 0x2E4 ^ 0xDDFE7FFF)) ^ *(_DWORD *)(v134 + 4 * (BYTE2(v68) ^ 0xF1u)) ^ (v43 >> 1);
  LODWORD(v125) = *(_DWORD *)(v133 + 4 * (BYTE3(v126) ^ 0x6C));
  HIDWORD(v43) = ~v125;
  LODWORD(v43) = v125 ^ 0x20A394C6;
  int v139 = (v43 >> 1) ^ *(_DWORD *)&v138[4 * (BYTE1(v68) ^ 0x29)] ^ (v136 + 154760405 - ((2 * v136) & 0x1272E9AA));
  LODWORD(v68) = ((v131 ^ 0x10)
                - 1329622030
                + ((2 * (v131 ^ 0x10) + 254) & 0x2E4 ^ 0xDDFE7FFF)) ^ *(_DWORD *)&v138[4 * (BYTE1(v126) ^ 0xDE)] ^ *(_DWORD *)&v135[4 * (v131 ^ 0x7D)] ^ (v123 + 154760405 - ((2 * v123) & 0x1272E9AA));
  LODWORD(v123) = *(_DWORD *)(v133 + 4 * (HIBYTE(v132) ^ 0xB7));
  HIDWORD(v43) = ~v123;
  LODWORD(v43) = v123 ^ 0x20A394C6;
  LODWORD(v125) = v68 + 1189723660 - ((2 * v68) & 0x8DD37C18);
  LODWORD(v68) = (v70 + 154760405 - ((2 * v70) & 0x1272E9AA)) ^ *(_DWORD *)&v138[4 * (BYTE1(v131) ^ 0x2F)] ^ (v43 >> 1);
  LODWORD(v126) = (v139 + 667372001 - ((2 * v139) & 0x4F8E93C2)) ^ v247;
  unsigned int v140 = *(_DWORD *)&v138[4 * (BYTE1(v132) ^ 0x66)] ^ v246 ^ (v124 + 154760405 - ((2 * v124) & 0x1272E9AA));
  LODWORD(v123) = *(_DWORD *)(v133 + 4 * ((v125 ^ ~v245) >> 24));
  HIDWORD(v43) = ~v123;
  LODWORD(v43) = v123 ^ 0x20A394C6;
  LODWORD(v124) = v43 >> 1;
  LODWORD(v123) = *(_DWORD *)(v133 + 4 * (BYTE3(v126) ^ 0x91));
  HIDWORD(v43) = ~v123;
  LODWORD(v43) = v123 ^ 0x20A394C6;
  LODWORD(v123) = v43 >> 1;
  LODWORD(v125) = v125 ^ v245;
  int v141 = *(_DWORD *)(v133 + 4 * (HIBYTE(v140) ^ 0xA3));
  HIDWORD(v43) = ~v141;
  LODWORD(v43) = v141 ^ 0x20A394C6;
  int v142 = v123 ^ *(_DWORD *)(v134 + 4 * (BYTE2(v140) ^ 0xF0u)) ^ ((BYTE2(v140) ^ 0xAC)
                                                                 + 913632926
                                                                 - 2
                                                                 * ((HIWORD(v140) ^ 0xA3AC) & 0x9F ^ HIWORD(v140) & 1));
  LODWORD(v123) = *(_DWORD *)&v135[4 * (((v139 - 31 - ((2 * v139) & 0xC2)) ^ v247) ^ 0x7B)];
  *(_DWORD *)(v38 - 120) = -1329622031;
  LODWORD(v123) = (v43 >> 1) ^ v123 ^ ((BYTE2(v125) ^ 0x49) + 913632926 - ((2 * (WORD1(v125) ^ 0xFF49)) & 0x13C)) ^ *(_DWORD *)(v134 + 4 * (BYTE2(v125) ^ 0x15u)) ^ ((v126 ^ 0x16) - 1329622031 - ((2 * (v126 ^ 0x16) + 842892542) & 0x220182E4));
  LODWORD(v68) = (v68 - ((2 * v68) & 0xBCB5B002) + 1583011841) ^ v244;
  int v143 = (v123 + 154760405 - ((2 * v123) & 0x1272E9AA)) ^ *(_DWORD *)&v138[4 * (BYTE1(v68) ^ 0x70)];
  int v144 = (v142 + 154760405 - ((2 * v142) & 0x1272E9AA)) ^ *(_DWORD *)&v138[4 * (BYTE1(v125) ^ 0x2C)];
  LODWORD(v123) = v124 ^ *(_DWORD *)&v135[4 * (v140 ^ 3)] ^ *(_DWORD *)(v134
                                                                                       + 4 * (BYTE2(v68) ^ 0xC3u)) ^ ((v140 ^ 0x6E) - 1329622030 + ((2 * (v140 ^ 0x6E) + 254) & 0x2E4 ^ 0xDDFE7FFF)) ^ ((BYTE2(v68) ^ 0x9F) + 913632926 - ((2 * (WORD1(v68) ^ 0x259F)) & 0x13C));
  LODWORD(v124) = ((BYTE2(v126) ^ 0x72) + 913632926 - 2 * ((WORD1(v126) ^ 0x9172) & 0x9F ^ WORD1(v126) & 1)) ^ *(_DWORD *)(v134 + 4 * (BYTE2(v126) ^ 0x2Eu));
  int v145 = *(_DWORD *)(v133 + 4 * (BYTE3(v68) ^ 0x25));
  HIDWORD(v43) = ~v145;
  LODWORD(v43) = v145 ^ 0x20A394C6;
  LODWORD(v70) = ((v125 ^ 0xFC)
                - 1329622030
                + ((2 * (v125 ^ 0xFC) + 254) & 0x2E4 ^ 0xDDFE7FFF)) ^ *(_DWORD *)&v138[4 * (BYTE1(v140) ^ 0xBD)] ^ *(_DWORD *)&v135[4 * (v125 ^ 0x91)] ^ (v43 >> 1) ^ (v124 + 154760405 - ((2 * v124) & 0x1272E9AA));
  LODWORD(v124) = ((v68 ^ 0xD6) - 1726037377) ^ v242 ^ *(_DWORD *)&v135[4
                                                                                       * (v68 ^ 0xBB)] ^ (v144 + 396415346 - ((2 * v144) & 0x2F41A2E4));
  LODWORD(v68) = *(_DWORD *)&v138[4 * (BYTE1(v126) ^ 0x57)] ^ v243 ^ (v123 + 154760405 - ((2 * v123) & 0x1272E9AA));
  LODWORD(v126) = (v70 - ((2 * v70) & 0xFFBD6856) - 2182101) ^ HIDWORD(v242);
  unsigned int v146 = (v143 - 412233178 - ((2 * v143) & 0xCEDBA44C)) ^ v78;
  int v147 = *(_DWORD *)(v133 + 4 * (BYTE3(v126) ^ 0xA6));
  HIDWORD(v43) = ~v147;
  LODWORD(v43) = v147 ^ 0x20A394C6;
  LODWORD(v123) = ((v143 + 38 - ((2 * v143) & 0x4C)) ^ v78);
  LODWORD(v123) = ((v123 ^ 0xA1) - 1329622030 + ((2 * (v123 ^ 0xA1) + 254) & 0x2E4 ^ 0xDDFE7FFF)) ^ *(_DWORD *)&v135[4 * (v123 ^ 0xCC)];
  int v148 = *(_DWORD *)(v134 + 4 * (BYTE2(v124) ^ 0xDBu)) ^ ((BYTE2(v124) ^ 0x87)
                                                          + 913632926
                                                          - ((2 * (WORD1(v124) ^ 0x3A87)) & 0x13C)) ^ (v43 >> 1);
  LODWORD(v123) = (v123 + 154760405 - ((2 * v123) & 0x1272E9AA)) ^ *(_DWORD *)&v138[4 * (BYTE1(v124) ^ 0xDE)];
  LODWORD(v70) = ((v124 ^ 0x9E)
                - 1329622030
                + ((2 * (v124 ^ 0x9E) + 254) & 0x2E4 ^ 0xDDFE7FFF)) ^ *(_DWORD *)&v135[4 * (v124 ^ 0xF3)];
  LODWORD(v125) = v70 + 154760405 - ((2 * v70) & 0x1272E9AA);
  int v149 = (v148 + 154760405 - ((2 * v148) & 0x1272E9AA)) ^ *(_DWORD *)&v138[4 * (BYTE1(v146) ^ 0x57)];
  unsigned int v150 = (WORD1(v68) ^ 0xD588) & 0x9F ^ WORD1(v68) & 1;
  LODWORD(v70) = BYTE2(v68) ^ 0x88;
  int v151 = *(_DWORD *)(v133 + 4 * (BYTE3(v68) ^ 0x96));
  HIDWORD(v43) = ~v151;
  LODWORD(v43) = v151 ^ 0x20A394C6;
  LODWORD(v124) = *(_DWORD *)(v133 + 4 * (BYTE3(v124) ^ 0x3A));
  LODWORD(v123) = *(_DWORD *)(v134 + 4 * (BYTE2(v126) ^ 0x20u)) ^ BYTE2(v126) ^ (v43 >> 1) ^ (v123 + 913632926 - ((2 * v123) & 0x6CE9DD3C));
  HIDWORD(v43) = ~v124;
  LODWORD(v43) = v124 ^ 0x20A394C6;
  LODWORD(v124) = *(_DWORD *)&v138[4 * (BYTE1(v68) ^ 0xD0)] ^ BYTE2(v146) ^ *(_DWORD *)(v134
                                                                                      + 4 * (BYTE2(v146) ^ 0xF6u)) ^ 0x3F4D9AE1 ^ (v43 >> 1);
  unsigned int v152 = ((v126 ^ 0x8B) - 1726037377) ^ HIDWORD(v241) ^ *(_DWORD *)&v135[4
                                                                                        * (v126 ^ 0xE6)] ^ (v124 + 396415346 - ((2 * v124) & 0x2F41A2E4));
  LODWORD(v68) = *(_DWORD *)&v135[4 * (v68 ^ 0x7D)] ^ ((v68 ^ 0x10) - 1726037377) ^ (v149 + 396415346 - ((2 * v149) & 0x2F41A2E4));
  int v153 = *(_DWORD *)(v133 + 4 * (HIBYTE(v146) ^ 0x7C));
  HIDWORD(v43) = ~v153;
  LODWORD(v43) = v153 ^ 0x20A394C6;
  unsigned int v154 = (v68 - ((2 * v68) & 0x1209A57A) + 151311037) ^ v240;
  LODWORD(v68) = ((v123 ^ 0x7C) - ((2 * (v123 ^ 0x7C)) & 0xC94948E6) - 458972045) ^ HIDWORD(v240);
  LODWORD(v126) = *(_DWORD *)&v138[4 * (BYTE1(v126) ^ 0xB)] ^ v241 ^ (v70 + 913632926 - 2 * v150) ^ *(_DWORD *)(v134 + 4 * (v70 ^ 0x5C)) ^ (v43 >> 1) ^ v125;
  int v155 = (((v123 ^ 0x7C) - ((2 * (v123 ^ 0x7C)) & 0xE6) + 115) ^ BYTE4(v240));
  unsigned int v156 = ((v155 ^ 0x9A) - 1329622030 + ((2 * (v155 ^ 0x9A) + 254) & 0x2E4 ^ 0xDDFE7FFF)) ^ *(_DWORD *)&v135[4 * (v155 ^ 0xF7)];
  LODWORD(v123) = *(_DWORD *)(v133 + 4 * (HIBYTE(v152) ^ 0x2D));
  HIDWORD(v43) = ~v123;
  LODWORD(v43) = v123 ^ 0x20A394C6;
  LODWORD(v125) = v156 + 154760405 - ((2 * v156) & 0x1272E9AA);
  int v157 = (v43 >> 1) ^ *(_DWORD *)&v135[4 * (v154 ^ 0x88)] ^ ((v154 ^ 0xE5)
                                                                            - 1329622030
                                                                            + ((2 * (v154 ^ 0xE5) + 254) & 0x2E4 ^ 0xDDFE7FFF));
  LODWORD(v123) = *(_DWORD *)(v133 + 4 * (HIBYTE(v154) ^ 0x80));
  HIDWORD(v43) = ~v123;
  LODWORD(v43) = v123 ^ 0x20A394C6;
  LODWORD(v124) = v43 >> 1;
  LODWORD(v123) = *(_DWORD *)(v133 + 4 * (BYTE3(v68) ^ 0xFC));
  HIDWORD(v43) = ~v123;
  LODWORD(v43) = v123 ^ 0x20A394C6;
  LODWORD(v123) = v43 >> 1;
  int v158 = *(_DWORD *)(v133 + 4 * (BYTE3(v126) ^ 0xB4));
  HIDWORD(v43) = ~v158;
  LODWORD(v43) = v158 ^ 0x20A394C6;
  LODWORD(v123) = v123 ^ *(_DWORD *)&v135[4 * (v126 ^ 0x8B)] ^ ((v126 ^ 0xE6)
                                                                               - 1329622030
                                                                               + ((2 * (v126 ^ 0xE6)
                                                                                 + 254) & 0x2E4 ^ 0xDDFE7FFF));
  unsigned int v159 = ((BYTE2(v126) ^ 0x59) + 913632926 - ((2 * (WORD1(v126) ^ 0xB459)) & 0x13C)) ^ *(_DWORD *)(v134
                                                                                                 + 4
                                                                                                 * (BYTE2(v126) ^ 5u)) ^ *(_DWORD *)&v138[4 * (BYTE1(v68) ^ 0x6D)] ^ (v157 + 154760405 - ((2 * v157) & 0x1272E9AA));
  int v160 = (HIWORD(v152) ^ 0x2D72) & 0x9F ^ HIWORD(v152) & 1;
  LODWORD(v70) = BYTE2(v152) ^ 0x72;
  int v161 = v152;
  unsigned int v162 = (v152 ^ 0x16) - 1329622030 + ((2 * (v152 ^ 0x16) + 254) & 0x2E4 ^ 0xDDFE7FFF);
  unsigned int v163 = ((BYTE2(v154) ^ 0x94) + 913632926 - ((2 * (HIWORD(v154) ^ 0x8094)) & 0x13C)) ^ HIDWORD(v238) ^ *(_DWORD *)&v138[4 * (BYTE1(v152) ^ 0x57)] ^ *(_DWORD *)(v134 + 4 * (BYTE2(v154) ^ 0xC8u)) ^ (v123 + 154760405 - ((2 * v123) & 0x1272E9AA));
  unsigned int v164 = *(_DWORD *)&v138[4 * (BYTE1(v154) ^ 0xAC)] ^ v239 ^ ((v43 >> 1) + 154760405 - ((2 * (v43 >> 1)) & 0x1272E9AA)) ^ *(_DWORD *)&v135[4 * (v161 ^ 0x7B)] ^ v162 ^ *(_DWORD *)(v134 + 4 * (BYTE2(v68) ^ 0x18u)) ^ ((BYTE2(v68) ^ 0x44) + 913632926 - 2 * ((WORD1(v68) ^ 0xBF44) & 0x9F ^ WORD1(v68) & 1));
  LODWORD(v68) = *(_DWORD *)&v138[4 * (BYTE1(v126) ^ 0x34)] ^ v238 ^ *(_DWORD *)(v134 + 4 * (v70 ^ 0x5C));
  LODWORD(v126) = (v159 - 916435478 - ((2 * v159) & 0x92C09BD4)) ^ HIDWORD(v239);
  LODWORD(v68) = v68 ^ (v70 + 913632926 - 2 * v160) ^ v125 ^ v124;
  LODWORD(v123) = *(_DWORD *)(v133 + 4 * (BYTE3(v68) ^ 0x4A));
  HIDWORD(v43) = ~v123;
  LODWORD(v43) = v123 ^ 0x20A394C6;
  int v165 = (v43 >> 1) + 154760405 - ((2 * (v43 >> 1)) & 0x1272E9AA);
  int v166 = ((BYTE2(v164) ^ 0x81) + 913632926 - ((2 * (HIWORD(v164) ^ 0x1481)) & 0x13C)) ^ *(_DWORD *)(v134
                                                                                                  + 4 * (BYTE2(v164) ^ 0xDDu));
  unsigned int v167 = ((v164 ^ 0x51) - 1329622030 + ((2 * (v164 ^ 0x51) + 254) & 0x2E4 ^ 0xDDFE7FFF)) ^ *(_DWORD *)&v135[4 * (v164 ^ 0x3C)];
  LODWORD(v115) = *(_DWORD *)(v134 + 4 * (BYTE2(v163) ^ 0xDBu)) ^ ((BYTE2(v163) ^ 0x87)
                                                                   + 913632926
                                                                   - ((2 * (HIWORD(v163) ^ 0x7787)) & 0x13C));
  int v168 = *(_DWORD *)(v133 + 4 * (HIBYTE(v164) ^ 0x14));
  HIDWORD(v43) = ~v168;
  LODWORD(v43) = v168 ^ 0x20A394C6;
  int v169 = v43 >> 1;
  int v170 = *(_DWORD *)(v133 + 4 * (BYTE3(v126) ^ 0x9A));
  HIDWORD(v43) = ~v170;
  LODWORD(v43) = v170 ^ 0x20A394C6;
  LODWORD(v123) = ((v68 ^ 0x9F885A1) >> 16) ^ *(_DWORD *)(v134
                                                                                       + 4
                                                                                       * (((v68 ^ 0x9F885A1) >> 16) ^ 0x5Cu)) ^ (v167 + 913632926 - ((2 * v167) & 0x6CE9DD3C));
  int v171 = *(_DWORD *)&v135[4 * (v68 ^ 0xCC)] ^ *(_DWORD *)&v138[4 * (BYTE1(v163) ^ 0xDE)] ^ (v166 + 154760405 - ((2 * v166) & 0x1272E9AA)) ^ (*(_DWORD *)(v38 - 120) + (v68 ^ 0xA1) - ((2 * (v68 ^ 0xA1) + 842892542) & 0x220182E4)) ^ (v43 >> 1);
  int v172 = *(_DWORD *)(v133 + 4 * (HIBYTE(v163) ^ 0x77));
  HIDWORD(v43) = ~v172;
  LODWORD(v43) = v172 ^ 0x20A394C6;
  LODWORD(v123) = (v43 >> 1) ^ *(_DWORD *)&v138[4 * (BYTE1(v126) ^ 0x2D)] ^ (v123 + 154760405 - ((2 * v123) & 0x1272E9AA));
  unsigned int v173 = *(_DWORD *)&v138[4 * (BYTE1(v164) ^ 0x34)] ^ HIDWORD(v236) ^ v165 ^ ((v163 ^ 0x9E)
                                                                            - 1329622030
                                                                            + ((2 * (v163 ^ 0x9E) + 254) & 0x2E4 ^ 0xDDFE7FFF)) ^ *(_DWORD *)(v134 + 4 * (BYTE2(v126) ^ 0xB5u)) ^ ((BYTE2(v126) ^ 0xE9) + 913632926 - ((2 * (WORD1(v126) ^ 0x9AE9)) & 0x13C)) ^ *(_DWORD *)&v135[4 * (v163 ^ 0xF3)];
  LODWORD(v68) = *(_DWORD *)&v138[4 * (BYTE1(v68) ^ 0x67)] ^ v236 ^ v169 ^ ((v126 ^ 0xA8)
                                                                          - 1329622030
                                                                          + ((2 * (v126 ^ 0xA8) + 254) & 0x2E4 ^ 0xDDFE7FFF)) ^ *(_DWORD *)&v135[4 * (v126 ^ 0xC5)] ^ (v115 + 154760405 - ((2 * v115) & 0x1272E9AA));
  int v174 = *(_DWORD *)(v133 + 4 * (BYTE3(v68) ^ 0x6D));
  HIDWORD(v43) = ~v174;
  LODWORD(v43) = v174 ^ 0x20A394C6;
  LODWORD(v125) = v43 >> 1;
  LODWORD(v124) = (v171 - 921339838 - ((2 * v171) & 0x922AF084)) ^ HIDWORD(v237);
  LODWORD(v70) = *(_DWORD *)(v133 + 4 * (BYTE3(v124) ^ 0xFD));
  unsigned int v175 = *(_DWORD *)(v134 + 4 * (BYTE2(v68) ^ 0x52u)) ^ (~v70 << 31) ^ (v70 >> 1) ^ ((BYTE2(v68) ^ 0xE) + 913632926 - 2 * ((WORD1(v68) ^ 0x2E0E) & 0x9F ^ WORD1(v68) & 1));
  LODWORD(v70) = ((v68 ^ 0x4A)
                - 1329622030
                + ((2 * (v68 ^ 0x4A) + 254) & 0x2E4 ^ 0xDDFE7FFF)) ^ *(_DWORD *)&v135[4 * (v68 ^ 0x27)];
  LODWORD(v115) = (v123 - ((2 * v123) & 0x76411E14) - 1155494134) ^ v237;
  int v176 = *(_DWORD *)(v133 + 4 * (BYTE3(v115) ^ 0x44));
  HIDWORD(v43) = ~v176;
  LODWORD(v43) = v176 ^ 0x20A394C6;
  LODWORD(v123) = (v43 >> 1) ^ *(_DWORD *)&v138[4 * (BYTE1(v124) ^ 0xA4)] ^ (v70 + 154760405 - ((2 * v70) & 0x1272E9AA));
  int v177 = BYTE2(v173) ^ *(_DWORD *)(v134 + 4 * (BYTE2(v173) ^ 0x24u)) ^ (v123 + 913632926 - ((2 * v123) & 0x6CE9DD3C));
  LODWORD(v123) = *(_DWORD *)(v134 + 4 * (BYTE2(v115) ^ 0x74u)) ^ v125 ^ *(_DWORD *)&v135[4
                                                                                          * (v124 ^ 0x4D)] ^ ((v124 ^ 0x20) - 1329622030 + ((2 * (v124 ^ 0x20) + 254) & 0x2E4 ^ 0xDDFE7FFF)) ^ ((BYTE2(v115) ^ 0x28) + 913632926 - ((2 * (WORD1(v115) ^ 0x4428)) & 0x13C));
  unsigned int v178 = ((v173 ^ 0x34) - 1329622030 + ((2 * (v173 ^ 0x34) + 254) & 0x2E4 ^ 0xDDFE7FFF)) ^ *(_DWORD *)&v135[4 * (v173 ^ 0x59)] ^ *(_DWORD *)&v138[4 * BYTE1(v115)] ^ ((v175 ^ 0x1051CA63) + 154760405 - 2 * ((v175 ^ 0x1051CA63) & 0x93974DD ^ v175 & 8));
  LODWORD(v68) = ((v115 ^ 0x8F)
                - 1571276971
                + ((2 * (v115 ^ 0x8F) + 254) & 0x1AA ^ 0xEDCF7FFF)) ^ *(_DWORD *)&v138[4 * (BYTE1(v68) ^ 0x65)];
  LODWORD(v68) = (v68 + 396415346 - ((2 * v68) & 0x2F41A2E4)) ^ *(_DWORD *)&v135[4 * (v115 ^ 0xE2)];
  LODWORD(v124) = *(_DWORD *)(v134 + 4 * (BYTE2(v124) ^ 0x40u)) ^ ((BYTE2(v124) ^ 0x1C)
                                                                   + 913632926
                                                                   - ((2 * (WORD1(v124) ^ 0xFD1C)) & 0x13C));
  LODWORD(v70) = v124 ^ 0xF1376150 ^ (v68 - 1305851517 - ((2 * v68) & 0x64549306));
  LODWORD(v68) = v68 ^ 0x6500C283;
  LODWORD(v70) = (v68 + v70 + 1) ^ ((v124 ^ 0x261DEA50) + 1);
  LODWORD(v115) = *(_DWORD *)(v133 + 4 * (HIBYTE(v173) ^ 0x6E));
  HIDWORD(v43) = ~v115;
  LODWORD(v43) = v115 ^ 0x20A394C6;
  LODWORD(v124) = v124 ^ 0x6BC85C2C ^ (v70 - 1305851517 - ((2 * v70) & 0x64549306));
  unsigned int v179 = ((v177 ^ 0x78) - 1206196580 - ((2 * (v177 ^ 0x78)) & 0x7035CD38)) ^ HIDWORD(v234);
  LODWORD(v124) = ((v124 + v68) ^ (v43 >> 1)) - ((2 * ((v124 + v68) ^ (v43 >> 1))) & 0xDD93112A);
  unsigned int v180 = *(_DWORD *)&v138[4 * (BYTE1(v173) ^ 0x38)] ^ v235 ^ (v123 + 154760405 - ((2 * v123) & 0x1272E9AA));
  unsigned int v181 = (v178 - 1948903727 - ((2 * v178) & 0x17AC2DA2)) ^ HIDWORD(v235);
  LODWORD(v68) = ((BYTE2(v181) ^ 0xE9) + 913632926 - ((2 * (HIWORD(v181) ^ 0xB8E9)) & 0x13C)) ^ *(_DWORD *)(v134 + 4 * (BYTE2(v181) ^ 0xB5u));
  LODWORD(v126) = *(_DWORD *)(v133 + 4 * (HIBYTE(v179) ^ 0x9D));
  HIDWORD(v43) = ~v126;
  LODWORD(v43) = v126 ^ 0x20A394C6;
  int v182 = v43 >> 1;
  LODWORD(v126) = *(_DWORD *)(v133 + 4 * (HIBYTE(v180) ^ 0x61));
  HIDWORD(v43) = ~v126;
  LODWORD(v43) = v126 ^ 0x20A394C6;
  int v183 = *(_DWORD *)&v135[4 * (v181 ^ 0xC5)] ^ *(_DWORD *)(v134 + 4 * (BYTE2(v179) ^ 0x28u)) ^ (v43 >> 1) ^ ((v181 ^ 0xA8) - 1329622030 + ((2 * (v181 ^ 0xA8) + 254) & 0x2E4 ^ 0xDDFE7FFF)) ^ ((BYTE2(v179) ^ 0x74) + 913632926 - ((2 * (HIWORD(v179) ^ 0x9D74)) & 0x13C));
  LODWORD(v123) = (v124 + 1858701461) ^ DWORD2(v234);
  LODWORD(v70) = v182 ^ ((BYTE2(v123) ^ 0x41) + 913632926 - ((v123 >> 15) & 0x13C)) ^ *(_DWORD *)(v134 + 4 * (BYTE2(v123) ^ 0x1Du));
  unsigned int v184 = (v180 ^ 0x85) - 1329622030 + ((2 * (v180 ^ 0x85) + 254) & 0x2E4 ^ 0xDDFE7FFF);
  int v185 = *(_DWORD *)(v133 + 4 * (HIBYTE(v181) ^ 0xB8));
  HIDWORD(v43) = ~v185;
  LODWORD(v43) = v185 ^ 0x20A394C6;
  int v186 = *(_DWORD *)&v135[4 * (v123 ^ 0x8A)] ^ *(_DWORD *)(v134 + 4 * (BYTE2(v180) ^ 0x54u)) ^ ((BYTE2(v180) ^ 8) + 913632926 - 2 * ((HIWORD(v180) ^ 0x6108) & 0x9F ^ HIWORD(v180) & 1)) ^ (v43 >> 1) ^ ((v123 ^ 0xE7) - 1329622030 + ((2 * (v123 ^ 0xE7) + 254) & 0x2E4 ^ 0xDDFE7FFF));
  LODWORD(v126) = *(_DWORD *)&v138[4 * (((unsigned __int16)((v124 - 30571) ^ WORD4(v234)) >> 8) ^ 0xA6)] ^ v234 ^ (v183 + 154760405 - ((2 * v183) & 0x1272E9AA));
  LODWORD(v123) = *(_DWORD *)(v133 + 4 * (BYTE3(v123) ^ 0x8F));
  HIDWORD(v43) = ~v123;
  LODWORD(v43) = v123 ^ 0x20A394C6;
  int v187 = (v186 + 154760405 - ((2 * v186) & 0x1272E9AA)) ^ *(_DWORD *)&v138[4 * (BYTE1(v179) ^ 0xBD)];
  LODWORD(v68) = *(_DWORD *)&v135[4 * (v179 ^ 0xB4)] ^ *(_DWORD *)&v138[4 * (BYTE1(v180) ^ 0x8F)] ^ ((v179 ^ 0xD9) - 1329622030 + ((2 * (v179 ^ 0xD9) + 254) & 0x2E4 ^ 0xDDFE7FFF)) ^ (v68 + 154760405 - ((2 * v68) & 0x1272E9AA)) ^ (v43 >> 1);
  LODWORD(v123) = *(_DWORD *)&v138[4 * (BYTE1(v181) ^ 0x2D)];
  LODWORD(v124) = *(_DWORD *)&v135[4 * (v180 ^ 0xE8)];
  unsigned int v188 = (v187 - 796794566 - ((2 * v187) & 0xA103C274)) ^ DWORD1(v234);
  unsigned int v189 = (v68 - ((2 * v68) & 0xA97E211E) - 725675889) ^ v233;
  LODWORD(v68) = v184 ^ HIDWORD(v233) ^ v124 ^ v123 ^ (v70 + 154760405 - ((2 * v70) & 0x1272E9AA));
  LODWORD(v123) = *(_DWORD *)(v133 + 4 * (HIBYTE(v189) ^ 0xEB));
  unsigned int v190 = ((BYTE2(v68) ^ 0x66) + 913632926 - 2 * ((WORD1(v68) ^ 0xAE66) & 0x9F ^ WORD1(v68) & 1)) ^ *(_DWORD *)(v134 + 4 * (BYTE2(v68) ^ 0x3Au));
  HIDWORD(v43) = ~v123;
  LODWORD(v43) = v123 ^ 0x20A394C6;
  LODWORD(v70) = *(_DWORD *)(v133 + 4 * (HIBYTE(v188) ^ 0xEF));
  LODWORD(v125) = ((v43 >> 1) + 913632926 - ((2 * (v43 >> 1)) & 0x6CE9DD3C)) ^ *(_DWORD *)(v134
                                                                                         + 4 * (BYTE2(v188) ^ 0x40u));
  HIDWORD(v43) = ~v70;
  LODWORD(v43) = v70 ^ 0x20A394C6;
  LODWORD(v70) = (v43 >> 1) ^ *(_DWORD *)&v135[4 * (v189 ^ 0xE0)] ^ ((v189 ^ 0x8D)
                                                                                    - 1329622030
                                                                                    + ((2
                                                                                      * (v189 ^ 0x8D)
                                                                                      + 254) & 0x2E4 ^ 0xDDFE7FFF));
  LODWORD(v124) = v190 + 154760405 - ((2 * v190) & 0x1272E9AA);
  int v191 = v70 + 154760405 - ((2 * v70) & 0x1272E9AA);
  LODWORD(v70) = ((v126 ^ 0x4A)
                - 1329622030
                + ((2 * (v126 ^ 0x4A) + 254) & 0x2E4 ^ 0xDDFE7FFF)) ^ *(_DWORD *)&v135[4 * (v126 ^ 0x27)];
  LODWORD(v113) = *(_DWORD *)(v133 + 4 * (BYTE3(v68) ^ 0xAE));
  HIDWORD(v43) = ~v113;
  LODWORD(v43) = v113 ^ 0x20A394C6;
  LODWORD(v70) = (v43 >> 1) ^ (v70 + 913632926 - ((2 * v70) & 0x6CE9DD3C)) ^ *(_DWORD *)(v134
                                                                                       + 4 * (BYTE2(v189) ^ 0xF5u));
  int v192 = *(_DWORD *)(v133 + 4 * (BYTE3(v126) ^ 0xDC));
  HIDWORD(v43) = ~v192;
  LODWORD(v43) = v192 ^ 0x20A394C6;
  unsigned int v193 = *(_DWORD *)&v138[4 * (BYTE1(v68) ^ 0x7C)] ^ HIDWORD(v232) ^ ((BYTE2(v126) ^ 0xE)
                                                                    + 913632926
                                                                    - 2
                                                                    * ((WORD1(v126) ^ 0xDC0E) & 0x9F ^ WORD1(v126) & 1)) ^ *(_DWORD *)(v134 + 4 * (BYTE2(v126) ^ 0x52u)) ^ v191;
  int v194 = v68;
  LODWORD(v113) = (v68 ^ 0xB3)
                - 1329622030
                + ((2 * (v68 ^ 0xB3) + 254) & 0x2E4 ^ 0xDDFE7FFF);
  LODWORD(v68) = *(_DWORD *)&v138[4 * (BYTE1(v189) ^ 0xDB)] ^ v232 ^ *(_DWORD *)&v135[4 * (v188 ^ 0x4D)] ^ (v43 >> 1) ^ v124 ^ ((v188 ^ 0x20) - 1329622030 + ((2 * (v188 ^ 0x20) + 254) & 0x2E4 ^ 0xDDFE7FFF));
  LODWORD(v126) = (v125 + 154760405 - ((2 * v125) & 0x1272E9AA)) ^ v231 ^ *(_DWORD *)&v138[4 * (BYTE1(v126) ^ 0x65)] ^ *(_DWORD *)&v135[4 * (v194 ^ 0xDE)] ^ v113;
  LODWORD(v125) = *(_DWORD *)&v138[4 * (BYTE1(v188) ^ 0xA4)] ^ HIDWORD(v231) ^ (v70
                                                                              + 154760405
                                                                              - ((2 * v70) & 0x1272E9AA));
  int v195 = (v138[4 * (BYTE1(v188) ^ 0xA4)] ^ BYTE4(v231) ^ (v70 - 43 - ((2 * v70) & 0xAA)) ^ BYTE2(v189));
  LODWORD(v123) = *(_DWORD *)(v133 + 4 * (BYTE3(v126) ^ 0x6C));
  HIDWORD(v43) = ~v123;
  LODWORD(v43) = v123 ^ 0x20A394C6;
  LODWORD(v70) = v43 >> 1;
  LODWORD(v124) = *(_DWORD *)(v133 + 4 * (HIBYTE(v193) ^ 0xF7));
  HIDWORD(v43) = ~v124;
  LODWORD(v43) = v124 ^ 0x20A394C6;
  LODWORD(v113) = v43 >> 1;
  LODWORD(v124) = ((BYTE2(v126) ^ 0xC8) + 913632926 - 2 * ((WORD1(v126) ^ 0x6CC8) & 0x9F ^ WORD1(v126) & 1)) ^ *(_DWORD *)(v134 + 4 * (BYTE2(v126) ^ 0x94u));
  LODWORD(v115) = *(_DWORD *)(v133 + 4 * (BYTE3(v125) ^ 0xE7));
  HIDWORD(v43) = ~v115;
  LODWORD(v43) = v115 ^ 0x20A394C6;
  int v196 = v43 >> 1;
  int v197 = v70 ^ *(_DWORD *)&v135[4 * (v195 ^ 0xE2)] ^ *(_DWORD *)(v134 + 4 * (BYTE2(v193) ^ 0xB5u)) ^ ((BYTE2(v193) ^ 0xE9) + 913632926 - ((2 * (HIWORD(v193) ^ 0xF7E9)) & 0x13C)) ^ ((v195 ^ 0x8F) - 1329622030 + ((2 * (v195 ^ 0x8F) + 254) & 0x2E4 ^ 0xDDFE7FFF));
  int v198 = (v197 + 154760405 - ((2 * v197) & 0x1272E9AA)) ^ *(_DWORD *)&v138[4 * (BYTE1(v68) ^ 0xEC)];
  LODWORD(v123) = v113 ^ *(_DWORD *)(v134 + 4 * (BYTE2(v68) ^ 0xA7u)) ^ *(_DWORD *)&v135[4
                                                                                         * ((v126 ^ BYTE2(v188)) ^ 0x32)] ^ (((v126 ^ BYTE2(v188)) ^ 0x5F) - 1329622030 + ((2 * ((v126 ^ BYTE2(v188)) ^ 0x5F) + 254) & 0x2E4 ^ 0xDDFE7FFF)) ^ ((BYTE2(v68) ^ 0xFB) + 913632926 - ((2 * (WORD1(v68) ^ 0x57FB)) & 0x13C));
  int v199 = *(_DWORD *)(v133 + 4 * (BYTE3(v68) ^ 0x57));
  HIDWORD(v43) = ~v199;
  LODWORD(v43) = v199 ^ 0x20A394C6;
  LODWORD(v123) = (v123 + 154760405 - ((2 * v123) & 0x1272E9AA)) ^ *(_DWORD *)&v138[4 * (BYTE1(v125) ^ 0x6D)];
  LODWORD(v68) = v68;
  int v200 = ((BYTE2(v125) ^ 0x31) + 913632926 - ((2 * (WORD1(v125) ^ 0xE731)) & 0x13C)) ^ ((v193 ^ 0xA8)
                                                                                      + *(_DWORD *)(v38 - 120)
                                                                                      - ((2
                                                                                        * (v193 ^ 0xA8)
                                                                                        + 842892542) & 0x220182E4)) ^ *(_DWORD *)&v135[4 * (v193 ^ 0xC5)] ^ *(_DWORD *)(v134 + 4 * (BYTE2(v125) ^ 0x6Du)) ^ (v43 >> 1);
  LODWORD(v70) = *(_DWORD *)&v135[4 * (v68 ^ 0x42)];
  LODWORD(v125) = (v68 ^ 0x2F) - 1329622030 + ((2 * (v68 ^ 0x2F) + 254) & 0x2E4 ^ 0xDDFE7FFF);
  LODWORD(v113) = v224 ^ *(_DWORD *)&v138[4 * (BYTE1(v126) ^ 0x61)] ^ (v200 + 154760405 - ((2 * v200) & 0x1272E9AA));
  int v201 = v113 ^ 0xADE748E2;
  LODWORD(v134) = (v123 + 1868011507 - ((2 * v123) & 0xDEAF2FE6)) ^ v110 ^ 0x6F5797F3;
  LODWORD(v68) = (v198 + 386613795 - ((2 * v198) & 0x2E168446)) ^ HIDWORD(v230);
  LODWORD(v124) = *(_DWORD *)&v138[4 * (BYTE1(v193) ^ 0x2D)] ^ v230 ^ v196 ^ v70 ^ v125 ^ (v124
                                                                                         + 154760405
                                                                                         - ((2 * v124) & 0x1272E9AA));
  LODWORD(v123) = BYTE3(v113) ^ 0x89;
  int v202 = *(_DWORD *)(v38 - 124);
  unint64_t v203 = (char *)*(&off_10005CE90 + v202 - 1842) - 8;
  BOOL v204 = (char *)*(&off_10005CE90 + v202 - 1836) - 8;
  unsigned int v205 = (char *)*(&off_10005CE90 + (int)v223) - 8;
  int v206 = (*(_DWORD *)&v205[4 * (BYTE2(v134) ^ 0x9E)] - 340771306) ^ (*(_DWORD *)&v203[4 * (v124 ^ 0xC9)]
                                                                   - 1271570329);
  LODWORD(v125) = *(_DWORD *)&v203[4 * (v113 ^ 0xC8)];
  uint64_t v207 = v125 - ((2 * v125 + 1751826638) & 0xB087438A);
  LODWORD(v125) = *(_DWORD *)&v203[4 * (v68 ^ 0xB9)];
  LODWORD(v135) = *(_DWORD *)&v204[4 * (BYTE3(v134) ^ 0xE7)];
  LODWORD(v113) = *(_DWORD *)&v204[4 * (BYTE3(v124) ^ 0xB8)];
  LODWORD(v123) = (*(_DWORD *)&v205[4 * (BYTE2(v124) ^ 0x38)] - 340771306) ^ (*(_DWORD *)&v204[4 * v123]
                                                                            - 626469149) ^ (*(_DWORD *)&v203[4 * (v134 ^ 0xA2)]
                                                                                          - 1271570329);
  LODWORD(v203) = *(_DWORD *)&v204[4 * (BYTE3(v68) ^ 0x65)];
  int v208 = (char *)*(&off_10005CE90 + SHIDWORD(v223)) - 4;
  unsigned int v209 = (v206 + 1480827333 - ((2 * v206) & 0xB087438A)) ^ *(_DWORD *)&v208[4 * (BYTE1(v201) ^ 0x29)] ^ (v203 - 626469149);
  LODWORD(v134) = *(_DWORD *)&v208[4 * (BYTE1(v134) ^ 0xA0)];
  int v210 = *(_DWORD *)&v208[4 * (BYTE1(v124) ^ 0xE9)];
  LODWORD(v124) = *(_DWORD *)&v208[4 * (BYTE1(v68) ^ 0x74)];
  LODWORD(v208) = *(_DWORD *)&v205[4 * (BYTE2(v201) ^ 0x6B)];
  unsigned int v211 = v124 ^ v226 ^ (v123 + 1480827333 - ((2 * v123) & 0xB087438A));
  unsigned int v212 = HIDWORD(a3) ^ HIDWORD(v230) ^ (v209 + 386613795 - ((2 * v209) & 0x2E168446));
  uint64_t v213 = v134 ^ HIDWORD(a3) ^ (v207 + 209257004) ^ (v113 - 626469149) ^ (*(_DWORD *)&v205[4 * (BYTE2(v68) ^ 0x1D)] - 340771306);
  unsigned int v214 = (char *)*(&off_10005CE90 + v202 - 1946) - 8;
  a1[6] = v214[((unsigned __int16)(v124 ^ v226 ^ (v123 - 24123 - ((2 * v123) & 0x438A))) >> 8) ^ 0x99] ^ 0x2C;
  int v215 = (char *)*(&off_10005CE90 + v202 - 2012) - 4;
  a1[*(void *)(v38 - 256)] = (v215[BYTE2(v212) ^ 0xADLL] + 19) ^ 0xC5;
  uint64_t v216 = (uint64_t)*(&off_10005CE90 + (int)v222);
  a1[*(void *)(v38 - 208)] = *(unsigned char *)(v216 + (v211 ^ 0xFCLL)) ^ 0x20;
  a1[*(void *)(v38 - 240)] = (v215[BYTE2(v213) ^ 0x8CLL] + 19) ^ 0x47;
  int v217 = (char *)*(&off_10005CE90 + SHIDWORD(a5)) - 8;
  a1[*(void *)(v38 - 224)] = (v217[HIBYTE(v211) ^ 0xDELL] - 36) ^ 0x1B;
  LODWORD(v123) = v215[BYTE2(v211) ^ 0x15];
  a1[*(void *)(v38 - 216)] = ((v123 + ((v123 + 19) ^ 0xDA) + 20) ^ 0xFE) + v123 + 19;
  LODWORD(v203) = HIDWORD(v222) ^ v210 ^ (v208 - 340771306);
  uint64_t v218 = (v125 - 1271570329);
  uint64_t v219 = v203 ^ v218 ^ (v135
                                                  - ((2 * v135 - 1252938298) & 0xB087438A)
                                                  + 854358184);
  a1[*(void *)(v38 - 232)] = *(unsigned char *)(v216
                                        + ((v203 ^ v218 ^ ((_BYTE)v135
                                                                                           - ((2 * (_BYTE)v135 - 58) & 0x8A)
                                                                                           - 88)) ^ 5)) ^ 0xD2;
  a1[*(void *)(v38 - 176)] = (v217[HIBYTE(v212) ^ 0x4ELL] - 36) ^ 0xE6;
  a1[*(void *)(v38 - 160)] = (v217[BYTE3(v213) ^ 0x9CLL] - 36) ^ 0xB8;
  uint64_t v220 = *(void *)(v38 - 184);
  a1[v220] = (v217[BYTE3(v219) ^ 0x67] - 36) ^ 0x91;
  a1[*(void *)(v38 - 168)] = *(unsigned char *)(v216 + (v213 ^ 0xF2)) ^ 0xD8;
  a1[*(void *)(v38 - 200)] = v214[BYTE1(v213) ^ 0x1ELL] ^ 0x8F;
  a1[*(void *)(v38 - 152)] = v214[BYTE1(v219) ^ 0x33] ^ 0x96;
  a1[*(void *)(v38 - 192)] = v214[BYTE1(v212) ^ 0xBCLL] ^ 0x58;
  a1[*(void *)(v38 - 144)] = *(unsigned char *)(v216 + (v212 ^ 0x9FLL)) ^ 0x20;
  a1[*(void *)(v38 - 136)] = (v215[BYTE2(v219) ^ 0xDLL] + 19) ^ 0x8E;
  LODWORD(v215) = ((v220 - 1559264506 - 2 * ((v220 + 16) & 0x230F82F7 ^ *(_DWORD *)(v38 - 244) & 1)) ^ 0xA30F82F6) >= a34;
  return (*(uint64_t (**)(uint64_t, uint64_t, void, char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, unsigned __int8 *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, unint64_t, void, void, uint64_t, unint64_t, uint64_t, uint64_t, uint64_t, unint64_t, uint64_t, uint64_t, unint64_t))(a35 + 8 * (int)(v215 | (8 * v215) | (v202 - 636))))(v218, v219, (v123 + 19) ^ 0xDAu, v205, 2961654666, 3668498147, v207, v213, a2, a3, a1, a5, v222, v223, v224, v225, v226, v116, v227,
           v228,
           v229,
           v230,
           v231,
           v232,
           v233,
           v234,
           *((void *)&v234 + 1),
           v235,
           v236,
           v237,
           v238,
           v239,
           v240,
           v241,
           v242,
           v243);
}

void sub_1000260A8()
{
  STACK[0x540] -= 32;
  JUMPOUT(0x1000260E8);
}

void sub_100026160(uint64_t a1@<X8>)
{
  *(void *)(a1 - 0x7CE89A2E9B2054D0) = v2;
  _DWORD *v1 = -1158872075;
}

uint64_t sub_1000261B8()
{
  return (*(uint64_t (**)(void))(v0 + 8 * ((1452 * (v2 - 293522566 >= 0)) ^ v1)))();
}

uint64_t sub_100026204(uint64_t a1, uint64_t a2, unsigned int a3, uint64_t a4, uint64_t a5, int a6)
{
  return (*(uint64_t (**)(void))(v6
                              + 8
                              * ((382
                                * ((v8 & (2 * (*(unsigned __int8 *)(a2 + 4) - 147)))
                                 + ((*(unsigned __int8 *)(a2 + 4) - 147) ^ a6) == v7)) ^ a3)))();
}

void sub_10002623C()
{
}

uint64_t sub_100026244(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,int a39)
{
  *v39 ^= a39;
  return sub_100026268();
}

uint64_t sub_100026268@<X0>(int a1@<W8>)
{
  return (*(uint64_t (**)(void))(v1 + 8 * ((452 * (v2 - 1 == ((a1 - 671098129) & 0x7BBCF3FF ^ 0x47BB915F))) ^ a1)))();
}

void sub_1000262B8()
{
}

uint64_t sub_100026324@<X0>(int a1@<W7>, _OWORD *a2@<X8>)
{
  *(_OWORD *)(v3 + (v2 + a1)) = *a2;
  return (*(uint64_t (**)(void))(v6
                              + 8 * (int)((41 * ((v5 ^ 0x3F1) != ((v5 ^ 0x1FFFFFC11) & (v4 + 1)))) ^ v5 ^ 0x29)))();
}

void sub_100026394()
{
}

void sub_1000263AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,int a57,int a58,int a59,int a60,int a61)
{
  *(_DWORD *)(v61 - 136) = a58 ^ 0x72B13362;
  *(_DWORD *)(v61 - 148) = a60 ^ 0x90646368;
  *(_DWORD *)(v61 - 140) = a61 ^ 0xA8EBA1CB;
  *(_DWORD *)(v61 - 144) = a59 ^ 0xDC05AE42;
  JUMPOUT(0x1000104E8);
}

uint64_t sub_100026400()
{
  (*(void (**)(void))(v1 + 8 * (v0 + 346)))();
  return (*(uint64_t (**)(void))(v1 + 8 * ((83 * (STACK[0x478] == 0)) ^ (v0 - 1391))))();
}

uint64_t sub_100026438@<X0>(int a1@<W8>)
{
  unint64_t v3 = ((v1 - 903447352) & 0x35D987FF ^ 0xFFFFFFFFFFFFF0FFLL) + v2;
  STACK[0x210] = v3;
  STACK[0x408] = v3;
  LODWORD(STACK[0x464]) = a1;
  LODWORD(STACK[0x290]) = STACK[0x3DC];
  LODWORD(STACK[0x288]) = STACK[0x3AC];
  return sub_10003EAFC();
}

uint64_t sub_100026478()
{
  return (*(uint64_t (**)(void))(v3
                              + 8
                              * (int)((((41 * ((v2 + 1311098803) & 0xB1DA35EE ^ 0x3F)) ^ 0x111) * (v0 == v1)) ^ v2)))();
}

uint64_t sub_1000264C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  unsigned int v21 = (v18 + 1241838826) & 0xB5FB0CBC;
  int v22 = 535753261 * ((2 * ((v20 - 128) & 0x373DA4B8) - (v20 - 128) - 926786747) ^ 0xC236556A);
  *(void *)(v20 - 128) = v19;
  *(_DWORD *)(v20 - 120) = v14 + v22 + (v21 ^ 0x106BFBDA);
  *(_DWORD *)(v20 - 116) = (v18 + 733) ^ v22;
  (*(void (**)(uint64_t))(v15 + 8 * (v18 + 1299)))(v20 - 128);
  *(_DWORD *)(v20 - 120) = v21
                         + ((((v20 - 128) | 0xD9FE1F48) - (v20 - 128) + ((v20 - 128) & 0x2601E0B0)) ^ 0x565B048E) * v16
                         + 481;
  *(void *)(v20 - 112) = v17;
  *(void *)(v20 - 128) = a14;
  uint64_t v23 = (*(uint64_t (**)(uint64_t))(v15 + 8 * (int)(v21 + 917)))(v20 - 128);
  return (*(uint64_t (**)(uint64_t))(v15
                                            + 8
                                            * (int)(((*(_DWORD *)(v20 - 116) <= 0x76FA18A2u) * ((v21 - 686) ^ 0x52)) ^ v21)))(v23);
}

uint64_t sub_100026600()
{
  BOOL v5 = (((*(unsigned __int8 *)(v2 + 2) - 72) << (v3 + 110)) & v1) + ((*(unsigned __int8 *)(v2 + 2) - 72) ^ v0) == v0;
  return (*(uint64_t (**)(void))(v4 + 8 * (((2 * v5) | (4 * v5)) ^ v3)))();
}

uint64_t sub_100026644(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,unsigned int a26,int a27,uint64_t a28,int a29,uint64_t a30,uint64_t a31)
{
  uint64_t v32 = *(void *)(a2 + 8);
  unsigned int v33 = 628203409 * ((((2 * &a24) | 0x183D5AE8) - &a24 - 203337076) ^ 0x8E96A147);
  int v34 = 854318832 - v33 + *(_DWORD *)(a2 + 4);
  a26 = 577 - v33;
  a27 = v34;
  a30 = v32;
  a31 = a15;
  a24 = a16;
  a25 = a14;
  a28 = a17;
  uint64_t v36 = (*(uint64_t (**)(uint64_t *))(v31 + 17080))(&a24);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v31
                                                                                         + 8
                                                                                         * ((474 * (a29 == -1158872075)) ^ 0x22Fu)))(v36, a2, 2474212436, 3049151192, 1820755250, 1228396339);
}

uint64_t sub_100026758@<X0>(int a1@<W8>)
{
  return (*(uint64_t (**)(void))(v3 + 8 * (((a1 != v1) * (((v2 - 340) | 0x524) - 1107)) ^ v2)))();
}

uint64_t sub_100026798(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, int a14, int a15, _DWORD *a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  unsigned int v27 = (((v20 - 707) | v21) ^ 0x22) + ((a7 - 1870143180) & 0xFFFFFFF0);
  int v24 = 1178560073
      * ((((2 * ((v23 - 136) ^ 0xCB3C0B5D)) | 0x39AB4DA6) - ((v23 - 136) ^ 0xCB3C0B5D) - 483763923) ^ 0x6D7DD5EC);
  *(void *)(v23 - 128) = a20;
  *(_DWORD *)(v23 - 136) = v24 + a7 - a15 - 22191697;
  *(_DWORD *)(v23 - 132) = v24 + (v27 ^ 0xCEBEBDE7) + ((2 * v27) & 0x9D7D7BC0) + 1073693632;
  *(_DWORD *)(v23 - 120) = (v20 + 1228) ^ v24;
  unsigned int v28 = v20;
  uint64_t v25 = (*(uint64_t (**)(uint64_t))(v22 + 8 * (v20 ^ 0xA91)))(v23 - 136);
  return (*(uint64_t (**)(uint64_t))(v22 + 8 * ((1275 * (*a16 == -1158872075)) ^ v28)))(v25);
}

uint64_t sub_1000268B4()
{
  return sub_1000268BC();
}

uint64_t sub_1000268BC(double a1, int8x16_t a2, uint64_t a3, uint64_t a4, const char *a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30)
{
  int v37 = *(uint64_t (**)(uint64_t, uint64_t, const char *, uint64_t, uint64_t, uint64_t, uint64_t))(v32 + 8 * v30);
  uint64_t v39 = *(unsigned int *)(v36 - 148);
  uint64_t v38 = *(unsigned int *)(v36 - 144);
  int v40 = *(_DWORD *)(v36 - 144);
  unsigned int v42 = *(_DWORD *)(v36 - 140);
  unsigned int v41 = *(_DWORD *)(v36 - 136);
  int v43 = *(unsigned char *)(v36 - 124) ^ 0xCF;
  if (v43 == 2)
  {
    int8x16x4_t v58 = vld4q_s8(a5);
    HIDWORD(a17) = *(_DWORD *)(v36 - 132);
    uint8x16_t v52 = (uint8x16_t)veorq_s8(v58.val[1], a2);
    _Q21 = vmovl_u8(*(uint8x8_t *)v52.i8);
    _Q20 = vmovl_high_u8(v52);
    __asm
    {
      SHLL2           V22.4S, V20.8H, #0x10
      SHLL2           V23.4S, V21.8H, #0x10
    }
    LODWORD(a18) = *(unsigned __int8 *)(v36 - 124) ^ 0xFFFFFFCF;
    return sub_100026C10(v38, v39, a5, a6, a7, a8, a9, v41, a11, a12, a13, a14, a15, a16, a17, a18, __PAIR64__(v38, v39), __PAIR64__(v41, v42), v37,
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
  else if (v43 == 1)
  {
    int8x16x4_t v57 = vld4q_s8(a5);
    uint8x16_t v44 = (uint8x16_t)veorq_s8(v57.val[2], a2);
    _Q21 = vmovl_high_u8(v44);
    _Q20 = vmovl_u8(*(uint8x8_t *)v44.i8);
    __asm
    {
      SHLL2           V20.4S, V20.8H, #0x10
      SHLL2           V21.4S, V21.8H, #0x10
    }
    return (*(uint64_t (**)(uint64_t))(v32 + 8 * ((108 * (a23 + 1 != v35)) ^ ((int)a6 + v34 + 555))))(115731202);
  }
  else
  {
    *(_DWORD *)(v36 - 148) = 2 * (*(_DWORD *)(v36 - 148) ^ v31) + v31 - (v33 & (4 * (*(_DWORD *)(v36 - 148) ^ v31)));
    *(_DWORD *)(v36 - 144) = (v40 ^ v31) + (v38 ^ v31) + v31 - (v33 & (2 * ((v40 ^ v31) + (v38 ^ v31))));
    *(_DWORD *)(v36 - 140) = 2 * (v42 ^ v31) + v31 - (v33 & (4 * (v42 ^ v31)));
    *(_DWORD *)(v36 - 136) = 2 * (v41 ^ v31) + v31 - (v33 & (4 * (v41 ^ v31)));
    return v37(v38, v39, a5, a6, a7, a8, a9);
  }
}

uint64_t sub_100026C10@<X0>(int a1@<W6>, uint64_t a2@<X8>, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, int a14, char a15)
{
  unsigned int v20 = (_DWORD *)(v15 + 4 * (a2 + v17));
  int v21 = *(v20 - 8) ^ *(v20 - 3);
  int v22 = v21 + v18 - ((v21 << a15) & a1);
  int v23 = *(v20 - 16) ^ *(v20 - 14);
  HIDWORD(v24) = v23 ^ 0x3AED03F5 ^ v22;
  LODWORD(v24) = v23 ^ ~v22;
  _DWORD *v20 = (v24 >> 31) + v18 - (a1 & (2 * (v24 >> 31)));
  return (*(uint64_t (**)(void))(v16 + 8 * ((573 * (a2 + 1 == v19 + 64)) ^ 0x58Eu)))();
}

void sub_100026C9C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, int a15, int a16)
{
  *(_DWORD *)(v19 - 132) = (v17 ^ v18)
                         + (a16 ^ v18)
                         + v18
                         - (((v16 - 1249278775) ^ 0xEC462ECC) & (2 * ((v17 ^ v18) + (a16 ^ v18))));
  JUMPOUT(0x100026CE8);
}

void sub_100026D6C()
{
}

uint64_t sub_100026D78@<X0>(int a1@<W0>, int a2@<W2>, int a3@<W4>, uint64_t a4@<X8>, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38)
{
  v49.val[1].i64[0] = ((_BYTE)v41 + 10) & 0xF;
  v49.val[1].i64[1] = ((_BYTE)v41 + 9) & 0xF;
  v49.val[2].i64[0] = ((_BYTE)v41 + 8) & 0xF;
  v49.val[2].i64[1] = ((_BYTE)v41 + 7) & 0xF;
  v49.val[3].i64[0] = ((_BYTE)v41 + 6) & 0xF;
  v49.val[3].i64[1] = ((_BYTE)v41 + 5) & 0xF;
  v44.i64[0] = 0x7777777777777777;
  v44.i64[1] = 0x7777777777777777;
  uint64_t v45 = v43 + a2 + a1 - 317 + ((a3 - 425) | 0x138u);
  v49.val[0].i64[0] = ((_BYTE)v43 + (_BYTE)a2 + (_BYTE)a1 - 61 + ((a3 + 87) | 0x38)) & 0xF;
  v49.val[0].i64[1] = ((_BYTE)v41 + 11) & 0xF;
  v46.i64[0] = vqtbl4q_s8(v49, (int8x16_t)xmmword_100056D90).u64[0];
  v50.val[0].i64[1] = ((_BYTE)v41 + 3) & 0xF;
  v50.val[1].i64[1] = (v41 + 1) & 0xF;
  v50.val[2].i64[1] = ((_BYTE)v41 - 1) & 0xF;
  v50.val[3].i64[1] = (v41 + 13) & 0xF;
  v50.val[0].i64[0] = ((_BYTE)v41 + 4) & 0xF;
  v50.val[1].i64[0] = ((_BYTE)v41 + 2) & 0xF;
  v50.val[2].i64[0] = v41 & 0xF;
  v50.val[3].i64[0] = (v41 + 14) & 0xF;
  v46.i64[1] = vqtbl4q_s8(v50, (int8x16_t)xmmword_100056D90).u64[0];
  int8x16_t v47 = vrev64q_s8(vmulq_s8(v46, v44));
  *(int8x16_t *)(a4 - 15 + v45) = veorq_s8(veorq_s8(veorq_s8(*(int8x16_t *)(v40 + (v45 & 0xF) - 15), *(int8x16_t *)(a4 - 15 + v45)), veorq_s8(*(int8x16_t *)((v45 & 0xF) + v38 - 13), *(int8x16_t *)((v45 & 0xF) + v39 - 11))), vextq_s8(v47, v47, 8uLL));
  return (*(uint64_t (**)(void))(a38 + 8 * ((1903 * ((v42 & 0xFFFFFFF0) == 16)) ^ a3)))();
}

uint64_t sub_100026ED4()
{
  STACK[0x408] = STACK[0x250];
  return ((uint64_t (*)(void))STACK[0x278])();
}

void sub_100026EEC()
{
  STACK[0x518] = *(void *)(v0 + 8 * (LODWORD(STACK[0x2AC]) - 1733));
  JUMPOUT(0x1000039F8);
}

uint64_t sub_100026F10(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,_DWORD *a29,unsigned int *a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,int a42)
{
  int v45 = v42;
  *a29 = a42 + 1;
  uint64_t v46 = *a30;
  *(void *)(v44 - 136) = a14;
  *(_DWORD *)(v44 - 124) = (v42 - 1909090868) ^ a15;
  int v47 = v42 + 1276895225 - a15;
  *(_DWORD *)(v44 - 144) = a15 ^ 1;
  *(_DWORD *)(v44 - 140) = v47 - 77;
  *(void *)(v44 - 120) = v46 + a15;
  *(_DWORD *)(v44 - 112) = v45 + 1276895225 + a15;
  *(_DWORD *)(v44 - 108) = v47 + 43;
  uint64_t v48 = (*(uint64_t (**)(uint64_t))(v43 + 8 * (a1 + v45 + 1525)))(v44 - 144);
  return (*(uint64_t (**)(uint64_t))(v43 + 8 * *(int *)(v44 - 128)))(v48);
}

uint64_t sub_100026FA8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, _DWORD *a10, int a11, int a12, uint64_t a13, uint64_t a14)
{
  int v17 = 235795823 * ((v16 + 1373711073 - 2 * ((v16 - 128) & 0x51E12B61)) ^ 0xC54C6238);
  *(_DWORD *)(v16 - 112) = v17 + v15 + 76;
  *(void *)(v16 - 120) = a14;
  *(_DWORD *)(v16 - 128) = v17 + ((v15 - 770) ^ (32 * a12) ^ 0x3FFFAE41) + ((a12 << (v15 + 6)) & 0x7FFF5F40) - 92373768;
  uint64_t v18 = (*(uint64_t (**)(uint64_t))(v14 + 8 * (v15 + 900)))(v16 - 128);
  return (*(uint64_t (**)(uint64_t))(v14 + 8
                                                  * ((869 * ((*a10 - 293522566) < 0x7FFFFFFF)) ^ v15)))(v18);
}

uint64_t sub_10002708C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12)
{
  return (*(uint64_t (**)(void))(v12 + 8
                                    * (((a12 + 16851015 >= (((v13 + 380) | 4) ^ 0x7FFFFDB1u)) * (v13 - 154)) ^ v13)))();
}

uint64_t sub_1000270E4@<X0>(uint64_t a1@<X8>)
{
  *(_DWORD *)(v6 + 4 * a1) = a1 + (v1 ^ (v1 >> 30)) * v4;
  return (*(uint64_t (**)(void))(v5 + 8 * (((a1 > 0x26E) * v2) ^ v3)))();
}

void sub_100027110()
{
}

uint64_t sub_10002711C@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  *(_DWORD *)(*(void *)(a2 + 96) + 24) = v3;
  unsigned int v4 = *(_DWORD *)(a1 + 4) - ((2 * *(_DWORD *)(a1 + 4) + 1838174638) & 0xF469B37C) + 821887637;
  return (*(uint64_t (**)(void))(v2
                                           + 8
                                           * ((8
                                             * (((2 * v4) & 0xDFF7EB3E ^ 0xD461A33C) + (v4 ^ 0x95CF2C21) + 950336355 == 681636098)) | 0x2A0u)))(0);
}

uint64_t sub_1000271D0()
{
  LODWORD(STACK[0x484]) = v0;
  LODWORD(STACK[0x404]) = v3;
  LODWORD(STACK[0x3D8]) = v1;
  LODWORD(STACK[0x36C]) = v4;
  LODWORD(STACK[0x3C8]) = v2;
  unint64_t v8 = STACK[0x578];
  int v9 = *(_DWORD *)(STACK[0x578] - 0x1FA9E8BAFD93F960);
  LODWORD(STACK[0x324]) = 783333624;
  int v10 = (v5 ^ (v7 + 879) ^ v9) + (v2 ^ v7);
  *(_DWORD *)(v8 - 0x1FA9E8BAFD93F960) = v10 + v7 - (v6 & (2 * v10));
  return sub_100030DBC();
}

uint64_t sub_100027240@<X0>(int a1@<W8>)
{
  LODWORD(STACK[0x3CC]) = v3;
  STACK[0x4B8] = STACK[0x2A0];
  return (*(uint64_t (**)(void))(v1 + 8 * ((478 * (((a1 + 44) ^ (*v2 == 0)) & 1)) ^ a1)))();
}

uint64_t sub_100027288(int a1, int8x16_t a2, double a3, double a4, int8x16_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9)
{
  int8x16_t *v10 = vaddq_s8(vsubq_s8(*(int8x16_t *)(v13 + (v11 + a1)), vandq_s8(vaddq_s8(*(int8x16_t *)(v13 + (v11 + a1)), *(int8x16_t *)(v13 + (v11 + a1))), a5)), a2);
  return (*(uint64_t (**)(void))(v12 + 8 * ((a9 + v9 + 1018) ^ 7)))();
}

uint64_t sub_1000272DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, int a14)
{
  return (*(uint64_t (**)(void))(v15 + 8 * (((a14 == v14) * (((v16 - 726053845) & 0x2B46B55A) + 159)) ^ v16)))();
}

uint64_t sub_100027318(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36)
{
  return sub_100004BD4(a1, a2, a3, a4, a24, a6, a7, a8, a9, a10, a11, (uint64_t)&STACK[0x270], a13, a14, a15, a16, a17, a18, a19,
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
           a36);
}

uint64_t sub_100027338@<X0>(int a1@<W0>, int a2@<W8>)
{
  return (*(uint64_t (**)(void))(v4
                              + 8
                              * (int)((((a1 + 928323170) & 0xC8AAEFFF ^ 0x6DA) * (v2 - v3 - 1281073251 == a2 - 822924050)) ^ a1)))();
}

uint64_t sub_10002739C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,_DWORD *a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,char a46)
{
  _DWORD *v46 = 0;
  return sub_10002994C(-874258553, -953638755, 2112833706, a38, 0, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19, a20, a21, a22,
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
           (uint64_t)a38,
           a39,
           a40,
           a41,
           a42,
           a43,
           a44,
           a45,
           a46);
}

uint64_t sub_1000273A4(__n128 a1)
{
  *(__n128 *)(v4 + v3) = a1;
  return (*(uint64_t (**)(void))(v5 + 8 * (((v3 == 1500) * v2) ^ v1)))();
}

uint64_t sub_1000273C8()
{
  return (*(uint64_t (**)(void))(v3
                              + 8
                              * (v0 | (32
                                     * (((v1 + ((v0 - 914306194) & 0x367F33AE) - 488) ^ (v0 + 1394926928) & 0xACDB1FE5)
                                      + v2 > 0x7FFFFFFE)))))();
}

uint64_t sub_100027424(uint64_t a1, uint64_t a2, int a3, uint64_t a4, int a5)
{
  return (*(uint64_t (**)(void))(v6
                              + 8 * (((v5 == v7 + a5 + a3 + 19 - 409) * (a3 ^ (a3 + 362) ^ 0x356)) ^ (a5 + a3 + 19))))();
}

uint64_t sub_100027474(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28)
{
  HIDWORD(a16) = HIDWORD(a12) + 578092201;
  v31.i64[0] = 0x5252525252525252;
  v31.i64[1] = 0x5252525252525252;
  HIDWORD(a20) = 1;
  return sub_1000268BC(*(double *)vdupq_n_s32(0x75DA07EAu).i64, v31, a1, a2, (const char *)(v30 - 220), a4, (v28 - 2), (uint64_t)&off_10005CE90, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17,
           a18,
           a19,
           a20,
           v29 - 16,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28);
}

uint64_t sub_1000274F0()
{
  uint64_t result = (*(uint64_t (**)(void, uint64_t, void))(v1 + 8 * (v4 + 1687)))(**(unsigned int **)(v2 + 8 * (v4 - 357)), v6, v7);
  *(_DWORD *)(v0 + 40) = v3;
  return result;
}

void sub_100027520()
{
  LODWORD(STACK[0x464]) = v0 - 18;
  JUMPOUT(0x100006ED0);
}

void sub_100027530(uint64_t a1@<X8>, uint64_t a2, uint64_t a3, uint64_t a4, unsigned int a5, uint64_t a6)
{
  a5 = v8
     + 628203409 * ((1757855476 - (&a3 | 0x68C6BEF4) + (&a3 | 0x9739410B)) ^ 0x15B14D38)
     + 591;
  a3 = v6;
  a4 = v7;
  a6 = v7;
  (*(void (**)(uint64_t *))(a1 + 8 * (v8 ^ 0x946)))(&a3);
  JUMPOUT(0x1000213F8);
}

uint64_t sub_1000275A0()
{
  return (*(uint64_t (**)(void))(v4
                              + 8
                              * ((1167
                                * ((v1 & (2 * (*(unsigned __int8 *)(v2 + 5) - 13)))
                                 + ((*(unsigned __int8 *)(v2 + 5) - 13) ^ v0) == ((v3 + 100491992) & 0xFA029B9C ^ (v0 + 504)))) ^ v3)))();
}

#error "10002774C: call analysis failed (funcsize=74)"

uint64_t sub_100027750@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  *(unsigned char *)(*(void *)(a2 + 96) + 468) = *(unsigned char *)(*(void *)(a1 + 8) + 12);
  return (*(uint64_t (**)(void))(v2 + 11424))(0);
}

void sub_1000277B4()
{
}

void sub_10002783C()
{
}

uint64_t sub_1000278C4()
{
  return (*(uint64_t (**)(void))(v3
                              + 8
                              * ((60 * (((v0 - 137) ^ (v2 - 340)) + v1 >= ((v0 - 137) ^ 0x151u))) ^ v0)))();
}

uint64_t sub_1000278FC@<X0>(int a1@<W0>, int a2@<W4>, char a3@<W5>, int a4@<W6>, uint64_t a5@<X8>)
{
  *(unsigned char *)(v6 + a5) = *(unsigned char *)(v9 + (v7 + a1))
                      - (a3 & (2 * *(unsigned char *)(v9 + (v7 + a1))))
                      + 82;
  return (*(uint64_t (**)(void))(v8 + 8 * (((a5 == 63) * a4) ^ (a2 + v5 + 473))))();
}

uint64_t sub_100027944(uint64_t a1, int a2, int a3, int a4, uint64_t a5, int a6)
{
  uint64_t v12 = (a4 + a3 + a2 + 1381);
  uint64_t v13 = *(void *)(v11 - 120);
  uint64_t v14 = v12 + v13;
  uint64_t v15 = (a6 - 855) & v12;
  uint64_t v16 = v7 - v14;
  unint64_t v17 = (v15 | v9) - v14;
  uint64_t v18 = (v15 | v8) - v14;
  unint64_t v19 = v16 + v15;
  BOOL v23 = v6 - v13 >= (unint64_t)((a6 + 2111796249) & 0x82208FD6) - 1862
     && v19 > 0xF
     && v17 > 0xF
     && (unint64_t)(v18 + 1) > 0xF;
  return (*(uint64_t (**)(void))(v10 + 8 * ((249 * v23) ^ a6)))();
}

uint64_t sub_1000279D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned int a7, uint64_t a8)
{
  *(void *)(*(void *)(a8 + 96) + 1544) = *(void *)(a2 + 8);
  *(_DWORD *)(*(void *)(a8 + 96) + 1536) = *(_DWORD *)(a2 + 4);
  return v8 ^ a7;
}

uint64_t sub_100027A2C()
{
  *(void *)(v5 - 136) = v4;
  *(void *)(v5 - 120) = v0;
  *(_DWORD *)(v5 - 128) = v3 + ((2 * ((v5 - 136) & 0x622B28D8) - (v5 - 136) - 1646995679) ^ 0x1271CCE7) * v2 + 1496;
  uint64_t v6 = (*(uint64_t (**)(uint64_t))(v1 + 8 * (v3 + 1932)))(v5 - 136);
  return (*(uint64_t (**)(uint64_t))(v1
                                            + 8
                                            * ((13
                                              * (*(_DWORD *)(v5 - 124) - 1996101795 < 23 * (v3 ^ 0xB2u) - 1890212889)) ^ v3)))(v6);
}

uint64_t sub_100027AD4@<X0>(int a1@<W0>, int a2@<W2>, int a3@<W3>, uint64_t a4@<X4>, int a5@<W5>, uint64_t a6@<X6>, int a7@<W8>)
{
  *(unsigned char *)(a6 + (a7 + a2)) = *(unsigned char *)(v10 + (v8 + a5));
  return (*(uint64_t (**)(void))(v9
                              + 8
                              * ((668 * ((((((v7 - 472) | 0x15A) ^ a1 ^ a3) + v8) & 0xFFFFFFFC) == a4)) ^ ((v7 - 472) | 0x15A))))();
}

uint64_t sub_100027AE8@<X0>(int a1@<W0>, unsigned int a2@<W1>, char a3@<W2>, char a4@<W3>, uint64_t a5@<X4>, int a6@<W5>, uint64_t a7@<X6>, int a8@<W8>)
{
  BOOL v13 = a2 < v10;
  *(unsigned char *)(a7 + (v8 + v11)) = *(unsigned char *)(a5 + (v9 + a6))
                                            - ((((a8 + a3) & a4) + 110) & (2 * *(unsigned char *)(a5 + (v9 + a6))))
                                            + 82;
  unsigned int v14 = v9 + 1 + a1;
  int v15 = v13 ^ (v14 < v10);
  BOOL v16 = v14 < a2;
  if (!v15) {
    BOOL v13 = v16;
  }
  return (*(uint64_t (**)(void))(v12 + 8 * (a8 ^ (4 * v13))))();
}

void sub_100027B50()
{
  STACK[0x518] = *(void *)(v0 + 8 * (LODWORD(STACK[0x2AC]) - 1777));
  JUMPOUT(0x100027B6CLL);
}

uint64_t sub_100027B78(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  return (*(uint64_t (**)(void))(v4 + 8 * ((1346 * (a1 + 1 == v5 + 16)) ^ a4)))();
}

uint64_t sub_100027C64@<X0>(int a1@<W0>, unsigned int a2@<W1>, int a3@<W2>, unsigned int a4@<W8>, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, int a20,char a21)
{
  BOOL v26 = a4 < a2;
  *(&a21 + (v21 - 1692578465)) = *(unsigned char *)(v25 + (v22 + a1))
                                             - ((*(unsigned __int8 *)(v25 + (v22 + a1)) << (v23 ^ 0x86)) & 0xA4)
                                             + 82;
  unsigned int v27 = v22 + 1 + a3;
  int v28 = v26 ^ (v27 < a2);
  BOOL v29 = v27 < a4;
  if (!v28) {
    BOOL v26 = v29;
  }
  return (*(uint64_t (**)(void))(v24 + 8 * ((13 * !v26) ^ v23)))();
}

uint64_t sub_100027CE8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,int a26,int a27,uint64_t a28,int a29,uint64_t a30,uint64_t a31)
{
  unsigned int v33 = 628203409 * (&a24 ^ 0x82880C33);
  int v34 = 854318342 - v33 + v31 + 81 + *(_DWORD *)(a2 + 4);
  uint64_t v35 = *(void *)(a2 + 8);
  a26 = v31 - v33 + 168;
  a27 = v34;
  a30 = v35;
  a31 = a15;
  a24 = a16;
  a25 = a14;
  a28 = a17;
  int v39 = v31;
  (*(void (**)(uint64_t *))(v32 + 8 * (v31 + 1726)))(&a24);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v32
                                                                                         + 8
                                                                                         * ((834 * (a29 == -1158872075)) ^ v39)))(a1, a2, 2474212436, 3049151192, 1820755250, 1228396339);
}

uint64_t sub_100027DEC()
{
  return (*(uint64_t (**)(void))(v3
                              + 8
                              * (int)((((((v2 + 2087505184) & 0x83932D73) + 70) ^ ((v2 - 911) | 0xCC)) * (v0 == v1)) ^ v2)))();
}

uint64_t sub_100027E40@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, int a3@<W2>, unsigned int a4@<W3>, uint64_t a5@<X8>)
{
  char v13 = *(unsigned char *)(*(void *)(a2 + 8) + a4);
  *(unsigned char *)(a1 + (v5 + v6) + 4) = (v13 ^ v10) + ((2 * v13) & 0xBB) - 24;
  unsigned int v14 = *(_DWORD *)(a2 + 4) + v11;
  BOOL v15 = v7 + v8 + a4 < v14;
  if (a4 + 1 > v12 != v14 < v8 + 538) {
    BOOL v15 = v14 < v8 + 538;
  }
  return (*(uint64_t (**)(void))(a5 + 8 * ((v15 * a3) ^ v9)))();
}

uint64_t sub_100027E48(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  return (*(uint64_t (**)(void))(v7 + 8 * (int)((((v6 ^ 0xFFFFFAA4) + v6 + 943) * (*(_DWORD *)(v8 - 144) != a6)) ^ v6)))();
}

void sub_100027E78(uint64_t a1)
{
  int v1 = 1374699841 * ((315119540 - (a1 | 0x12C857B4) + (a1 | 0xED37A84B)) ^ 0x80C3B042);
  int v2 = *(_DWORD *)(a1 + 16) - v1;
  int v3 = *(_DWORD *)(a1 + 20) ^ v1;
  int v4 = *(_DWORD *)(*(void *)a1 - 0x4C6937770F4864B4);
  int v6 = v4 - 293522565;
  BOOL v5 = v4 - 293522565 < 0;
  int v7 = 293522565 - v4;
  if (!v5) {
    int v7 = v6;
  }
  __asm { BRAA            X12, X17 }
}

uint64_t sub_100027F64()
{
  return (*(uint64_t (**)(void))(v0
                              + 8
                              * ((((v2 - 293522565) * (v1 - 293522565) <= (int)((v3 - 280) ^ 0xFFFFFF34))
                                * ((29 * (v3 ^ 0x1E4)) ^ 0xC0)) ^ v3)))();
}

void sub_100027FB4()
{
}

void sub_100028000()
{
}

uint64_t sub_10002800C(uint64_t a1, int a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,int a32)
{
  return (*(uint64_t (**)(void))(v32 + 8 * ((23 * (a32 + a3 + ((a2 - 5) ^ 0x2A9u) > 0xFFFFFFFA)) ^ (a2 + 1289))))();
}

uint64_t sub_100028050(uint64_t a1)
{
  *(void *)(v4 + a1) = v7;
  return (*(uint64_t (**)(uint64_t))(v5 + 8 * (((v1 == a1) * v6) ^ v2)))(a1 + v3);
}

uint64_t sub_100028074()
{
  BOOL v8 = v4 < v6;
  if (v8 == v2 + v1 < (((v7 - 864) | v0) ^ v3)) {
    BOOL v8 = v4 > v2 + v1;
  }
  return (*(uint64_t (**)(void))(v5 + 8 * ((31 * v8) ^ v7)))();
}

uint64_t sub_1000280C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36)
{
  int v37 = LOBYTE(STACK[0x2E4]) ^ 0xCF;
  if (v37 == 1)
  {
    unsigned int v45 = STACK[0x2C8];
    unsigned int v46 = STACK[0x2C4];
    int v47 = LODWORD(STACK[0x2C8]) >> 5;
    LOBYTE(STACK[0x2BC]) = 8 * LOBYTE(STACK[0x2C8]) - ((LODWORD(STACK[0x2C8]) << a10) & 0xA0) + 82;
    LOBYTE(STACK[0x2BD]) = (v47 ^ 0xEF) - (v36 & (2 * (v47 ^ 0xEF))) + 82;
    LOBYTE(STACK[0x2BE]) = ((v45 >> 13) ^ 0x45) - (v36 & (2 * ((v45 >> 13) ^ 0x45))) + 82;
    LOBYTE(STACK[0x2BF]) = ((v45 >> 21) ^ 0xD) - (v36 & (v45 >> 20)) + 82;
    HIDWORD(v48) = ~v46;
    LODWORD(v48) = v45 ^ 0x20000000;
    LOBYTE(STACK[0x2C0]) = (v48 >> 29) - (v36 & (2 * (v48 >> 29))) + 82;
    LOBYTE(STACK[0x2C1]) = ((v46 >> 5) ^ 0x4F) + (~(2 * ((v46 >> 5) ^ 0x4F)) | 0x5B) + 83;
    LOBYTE(STACK[0x2C2]) = ((v46 >> 13) ^ 0x13) - (v36 & (2 * ((v46 >> 13) ^ 0x13))) + 82;
    unsigned int v49 = v46 >> 21;
    unsigned int v50 = (v46 >> 21) ^ 0xFFFFFFE9;
    LOBYTE(v47) = v50 & 0x56 ^ v49 & 4;
    char v43 = v50 + 82;
    char v44 = 2 * v47;
    uint64_t v38 = a24;
    goto LABEL_5;
  }
  uint64_t v38 = a24;
  if (v37 == 2)
  {
    unsigned int v39 = STACK[0x2C4];
    unsigned int v40 = STACK[0x2C8];
    HIDWORD(v41) = ~LODWORD(STACK[0x2C4]);
    LODWORD(v41) = LODWORD(STACK[0x2C8]) ^ 0x20000000;
    int v42 = (LODWORD(STACK[0x2C4]) >> 13) ^ 0x13;
    LOBYTE(STACK[0x2BC]) = ((LODWORD(STACK[0x2C4]) >> ((a2 ^ 0x56) - 90)) ^ 0xE9)
                         + ~(2
                           * (((LODWORD(STACK[0x2C4]) >> ((a2 ^ 0x56) - 90)) ^ 0xE9) & 0x56 ^ (LODWORD(STACK[0x2C4]) >> ((a2 ^ 0x56) - 90)) & 4))
                         + 83;
    LOBYTE(STACK[0x2BD]) = v42 - (v36 & (2 * v42)) + 82;
    LOBYTE(STACK[0x2BE]) = ((v39 >> 5) ^ 0x4F) - (v36 & (2 * ((v39 >> 5) ^ 0x4F))) + 82;
    LOBYTE(STACK[0x2BF]) = (v41 >> 29) - (v36 & (2 * (v41 >> 29))) + 82;
    LOBYTE(STACK[0x2C0]) = ((v40 >> 21) ^ 0xD) - (v36 & (v40 >> 20)) + 82;
    LOBYTE(STACK[0x2C1]) = ((v40 >> 13) ^ 0x45) - (v36 & (2 * ((v40 >> 13) ^ 0x45))) + 82;
    LOBYTE(STACK[0x2C2]) = ((v40 >> 5) ^ 0xEF) - (v36 & (2 * ((v40 >> 5) ^ 0xEF))) + 82;
    char v43 = 8 * v40 + 82;
    char v44 = (16 * v40) & 0xA0;
LABEL_5:
    LOBYTE(STACK[0x2C3]) = v43 - v44;
  }
  return sub_100004BD4(a1, a2, a3, a4, v38, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
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
           a36);
}

uint64_t sub_1000282E0@<X0>(uint64_t a1@<X1>, int a2@<W2>, int a3@<W8>)
{
  *(unsigned char *)(v3 + (v4 - 1250703398)) = *(unsigned char *)(a1 + (v4 - 1250703398));
  return (*(uint64_t (**)(void))(v5
                                           + 8
                                           * ((26 * ((((a2 - 634744801) ^ (v4 - 1 == a3)) & 1) == 0)) ^ (a2 - 1154))))((a2 - 634744801) & 0x25D569DF);
}

uint64_t sub_100028340(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  LODWORD(STACK[0x228]) = a3;
  LODWORD(STACK[0x1818]) = v74;
  LODWORD(STACK[0x181C]) = 879232639;
  int v79 = *(_DWORD **)(v76 + 8 * (v72 - 1709));
  STACK[0x220] = (unint64_t)v79;
  LODWORD(STACK[0x494]) = *v79;
  int v80 = *(unsigned int **)(v76 + 8 * (v72 - 1754));
  STACK[0x250] = (unint64_t)v80;
  uint64_t v81 = *v80;
  unint64_t v82 = ((0xC7B6EE4BCF22DF88 - (v73 | 0xC7B6EE4BCF22DF88) + a72) ^ 0xCDAB4CD93A292E58) * v77;
  *(_DWORD *)(v78 - 176) = (v72 + 1771629191) ^ v82;
  *(_DWORD *)(v78 - 160) = (v72 + 1771629209) ^ v82;
  *(_DWORD *)(v78 - 192) = ((v72 + 1771629191) ^ 0x7B) - v82;
  *(_DWORD *)(v78 - 188) = v82 + v72 + 2104630613;
  *(_DWORD *)(v78 - 184) = -(int)v82;
  *(void *)(v78 - 168) = v81 + v82;
  *(void *)(v78 - 200) = v82;
  uint64_t v83 = (*(uint64_t (**)(uint64_t))(v75 + 8 * (v72 ^ 0xE99)))(v78 - 200);
  return (*(uint64_t (**)(uint64_t))(v75 + 8 * *(int *)(v78 - 180)))(v83);
}

void sub_100028444(uint64_t a1)
{
  int v1 = 535753261 * (((a1 | 0xC65CACBE) - (a1 & 0xC65CACBE)) ^ 0xCCA8A291);
  int v2 = *(_DWORD *)(a1 + 72) - v1;
  BOOL v4 = *(_OWORD *)(a1 + 48) == 0 || *(_DWORD *)(a1 + 8) - v1 == 1689929482;
  __asm { BRAA            X9, X17 }
}

uint64_t sub_100028594@<X0>(int a1@<W6>, uint64_t a2@<X8>)
{
  uint64_t v9 = (a1 - 1406640885);
  *(unsigned char *)(a2 + v9) = *(unsigned char *)(v2 + v9) ^ *(unsigned char *)(v4 + (v9 & 0xF)) ^ *(unsigned char *)(v6 + (v9 & 0xF)) ^ *(unsigned char *)(v5 + (v9 & 0xF)) ^ ((v9 & 0xF) * (((v7 - 79) | 8) + 6)) ^ 0x52;
  return (*(uint64_t (**)(void))(v8 + 8 * ((1276 * (a1 - 1 == v3)) ^ (v7 - 1757))))();
}

uint64_t sub_10002860C@<X0>(int a1@<W3>, uint64_t a2@<X8>)
{
  return (*(uint64_t (**)(void))(a2
                              + 8
                              * ((35
                                * (((((43 * ((v2 - 520) ^ 0x3DA) - 488119167) & 0x1D181DFE) + 1073740582) & a1) == 0)) | (v2 - 520))))();
}

uint64_t sub_1000286D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(v7 + 8 * ((268 * (a6 + 1 == v8 + 20)) ^ v6)))();
}

uint64_t sub_1000287AC@<X0>(unsigned int a1@<W0>, int a2@<W3>, unsigned int a3@<W4>, int a4@<W8>, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  BOOL v18 = a3 > a1;
  *(_DWORD *)(a12 + 4 * (v12 + a4)) = a2;
  int v19 = v12 + 1 + v15;
  int v20 = v18 ^ (v19 < v14 + 65);
  BOOL v21 = v19 < v16;
  if (!v20) {
    BOOL v18 = v21;
  }
  return (*(uint64_t (**)(void))(v17 + 8 * ((v18 * (((v13 + 240) | 0x382) - 1988)) ^ v13)))();
}

uint64_t sub_10002880C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,int a24,char a25)
{
  *(void *)(&a25 + v27 + a2) = 0x5252525252525252;
  return (*(uint64_t (**)(void))(v28
                              + 8
                              * (((((((v26 - 26) | 4u) - 396) & v25) != 8) * ((((v26 - 26) | 4) + 129) ^ 0x21B)) ^ ((v26 - 26) | 4))))();
}

uint64_t sub_100028868(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return sub_10000C48C(a1, a2, a3, a4, a5, a6, v6 + 216);
}

void sub_100028884()
{
}

uint64_t sub_10002888C(int a1)
{
  return (*(uint64_t (**)(void))(v1 + 8 * ((510 * (v3 + 1 == v2 + 40)) ^ a1)))();
}

void sub_100028958(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 8) + 1178560073 * ((-2 - ((a1 | 0xA6FD25DC) + (~a1 | 0x5902DA23))) ^ 0xE396A241);
  __asm { BRAA            X15, X17 }
}

void sub_100028A8C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31)
{
  uint64_t v34 = (*(uint64_t (**)(uint64_t, void))(v32 + 8 * (v31 + 966)))(a31, 0);
  uint64_t v35 = *(void *)(v33 + 16);
  *(_DWORD *)(v33 + 4) = *(_DWORD *)(v33 + 24);
  *(_DWORD *)(v33 + 8) = v35;
  *(_DWORD *)(v33 + 12) = (*(uint64_t (**)(uint64_t))(v32 + 8 * (v31 ^ 0xC87u)))(v34);
  *(_DWORD *)uint64_t v33 = (*(uint64_t (**)(void))(v32 + 8 * (v31 + 889)))();
  JUMPOUT(0x100028B54);
}

uint64_t sub_100028C30(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, int a16, int a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,int a22)
{
  int v26 = v22 & 0x446CBDFF;
  BOOL v28 = v25 != ((v26 - v23) ^ a17 ^ 0x40206F63) || a22 != 145079878;
  return (*(uint64_t (**)(uint64_t))(v24 + 8 * ((960 * v28) ^ v26)))(3136095221);
}

uint64_t sub_100028C94@<X0>(int a1@<W8>)
{
  int *v2 = v12 ^ v4;
  int *v1 = v13 ^ v4;
  *uint64_t v8 = v11 ^ ((v3 ^ v6) + a1);
  uint64_t v16 = v10;
  unsigned int v15 = (v3 ^ v6)
      + 114507000
      + 535753261 * ((-863361720 - (v14 | 0xCC8A2548) + (v14 | 0x3375DAB7)) ^ 0x3981D498);
  (*(void (**)(unsigned char *))(v5 + 8 * ((v3 ^ v6) + 114507680)))(v14);
  unsigned int v15 = 535753261
      * (((v14 | 0x27283D55) - v14 + (v14 & 0xD8D7C2A8)) ^ 0x2DDC337A)
      + 114507000
      + (v3 ^ v6);
  uint64_t v16 = v9;
  (*(void (**)(unsigned char *))(v5 + 8 * (v3 ^ v6 ^ (v6 + 1206))))(v14);
  return v4 ^ 0xBAED03F5;
}

uint64_t sub_100028DE0@<X0>(int a1@<W8>)
{
  return (*(uint64_t (**)(void))(v5
                              + 8
                              * (((*(_DWORD *)(v1 + 4 * (v4 + a1 + 5 * (v3 ^ 0x71u))) == v2) * (v3 ^ 0x589)) ^ (v3 + 701))))();
}

uint64_t sub_100028E2C()
{
  return (*(uint64_t (**)(void))(v3
                              + 8
                              * (int)(((((v2 - 1079116174) & 0xF5DB89C0 ^ 0xFFFFF78B) + ((v2 - 2071394637) | 0x31008180))
                                     * (v0 == v1)) ^ v2)))();
}

uint64_t sub_100028E88(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return (*(uint64_t (**)(uint64_t))(v8 + 8 * ((39 * (a8 + 1 == v10 + 16)) ^ v9)))(a5);
}

void sub_100028F70()
{
}

void sub_100029018()
{
}

uint64_t sub_100029024(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned int a6)
{
  if ((v6 - 363543247) <= 0x10 && ((1 << (v6 + 49)) & 0x14103) != 0) {
    return (*(uint64_t (**)(void))(v9
  }
                                + 8
                                * ((41
                                  * ((v7 & 0xFFFFFFFFFFFFFFFuLL) - 1 >= (unint64_t)((v8 + v10 - 942) | 0xAu)
                                                                      - 328)) ^ (v8 + v10 + 416))))();
  else {
    return sub_1000407FC(1158830123, a2, a3, a4, a5, a6);
  }
}

uint64_t sub_10002909C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, int a14, unsigned int a15, _DWORD *a16, int a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,_DWORD *a24)
{
  int v29 = (*a24 ^ (v24 + v28 - 256 - 274)) + a17 * (*(_DWORD *)(*a7 + 4 * (a8 - 1304690755)) ^ v24);
  uint64_t v30 = *(uint64_t (**)(void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void *, void, uint64_t, uint64_t, uint64_t, uint64_t))(v27 + 8 * (v28 ^ (180 * (v26 <= a15))));
  return v30(v30, a2, a3, a4, a5, a6, a7, ((v29 + v25 - ((2 * v29) & 0x18E5A0D8)) ^ a3) * (*a16 - 1238135713), a9, a10, a11, a12);
}

uint64_t sub_1000290BC()
{
  return (*(uint64_t (**)(void))(v2
                              + 8
                              * (((((v1 - 228) ^ 0x41A) - 403) * ((v3 + v0) < 0x7FFFFFFE)) ^ (v1 - 401))))();
}

uint64_t sub_1000290FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, int a18, int a19, uint64_t a20,int a21)
{
  unsigned int v24 = 1225351577 * (((&a18 | 0x7B9B81A3) + (~&a18 | 0x84647E5C)) ^ 0x5641B90);
  a18 = 471154195 * v21 - v24 + 78647399;
  a19 = v24 ^ 0x333;
  a20 = a13;
  uint64_t v25 = (*(uint64_t (**)(int *))(v23 + 17504))(&a18);
  return (*(uint64_t (**)(uint64_t))(v23
                                            + 8
                                            * (((a21 == v22) ^ 0x49) & 1 | (4 * (((a21 == v22) ^ 0x49) & 1)) | 0x71Au)))(v25);
}

void sub_1000291E0()
{
}

uint64_t sub_1000292BC@<X0>(uint64_t a1@<X1>, unint64_t a2@<X8>, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12, uint64_t a13, uint64_t a14, uint64_t a15, int a16, int a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  unint64_t v25 = (a1 ^ HIDWORD(a2)) + HIDWORD(v24) + (*(_DWORD *)(a20 + a7) ^ v21);
  *(_DWORD *)(a20 + 4 * a8) = v25 + v21 - ((v25 << ((v20 - 79) ^ 0xC4)) & v22);
  *(_DWORD *)(a20 + a7) = (v25 >> (v20 ^ 0x34u)) | v21;
  BOOL v27 = a17 - 2053507322 < 768677283 && a17 - 2053507322 >= a12;
  return (*(uint64_t (**)(void))(v23 + 8 * (v20 | (99 * v27))))();
}

uint64_t sub_100029360(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  BOOL v8 = v7 + v6 + (a5 ^ 0x144u) - 2008801758 > 7;
  return (*(uint64_t (**)(void))(v5 + 8 * (((8 * v8) | (16 * v8)) ^ a5)))();
}

uint64_t sub_1000293B8@<X0>(uint64_t a1@<X2>, int a2@<W8>, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, int a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,int a31)
{
  unsigned int v35 = *(_DWORD *)(&a19 + ((v33 + a2) & 0xFFFFFFFC) + 72);
  *(unsigned char *)(a1 + (v33 + a2)) = v35 ^ 0xF4;
  *(unsigned char *)(a1 + (v33 + a2 + 2)) = (BYTE2(v35) ^ 0xE7) - ((2 * (BYTE2(v35) ^ 0xE7)) & 0xA4) + 82;
  *(unsigned char *)(a1 + (v33 + a2 + 1)) = ((v32 + 122) ^ BYTE1(v35) ^ 0x39)
                                                + (~(2 * ((v32 + 122) ^ BYTE1(v35) ^ 0x39)) | 0x5B)
                                                + 83;
  *(unsigned char *)(a1 + (v33 + a2 + 3)) = (HIBYTE(v35) ^ 0x2C) - ((v35 >> 23) & 0xA4) + 82;
  BOOL v36 = a31 + 525024744 < v31;
  if (v33 + 299410648 < v31 == v36) {
    BOOL v36 = v33 + 299410648 < (a31 + 525024744);
  }
  return (*(uint64_t (**)(void))(v34 + 8 * ((813 * v36) ^ v32)))((v32 + 1408886394) & 0xBF5FFEFF);
}

void sub_1000294AC(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 12) + 460628867 * ((a1 & 0x73B15F3F | ~(a1 | 0x73B15F3F)) ^ 0xC0D822BD);
  uint64_t v2 = (uint64_t)*(&off_10005CE90 + v1 - 1564);
  uint64_t v3 = *(void *)(v2
                 + 8
                 * ((((*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8 * (v1 + 423)))(32, 0x101004023FF3BD5) == 0)
                   * (((v1 - 528) | 0x221) - 1704)) ^ v1));
  __asm { BRAA            X8, X17 }
}

uint64_t sub_10002955C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,int a23,int a24)
{
  return sub_1000348A4(7 * a24);
}

uint64_t sub_100029580(uint64_t a1, uint64_t a2, int a3, uint64_t a4, int a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, int a19)
{
  return (*(uint64_t (**)(void))(v20
                              + 8
                              * ((1116 * (v19 == ((v21 + (a19 & 0xCE7F6FF9) - 387) ^ (35 * (a3 ^ (a3 + 6)))))) ^ (a5 + a3 + 414))))();
}

void sub_1000295DC(uint64_t a1)
{
  __asm { BRAA            X8, X17 }
}

uint64_t sub_100029660@<X0>(uint64_t a1@<X8>)
{
  return sub_1000296F4(a1 - 0x4C6937770F4864B0, (v1 ^ 0x10u) + 1892546602, 2402419931, 0x6E79FFF71DFFFAFELL, 0xFFDF7EBDFB99B574, 454827875, 426300198);
}

uint64_t sub_1000296F4(void *a1, int a2, int a3, uint64_t a4, uint64_t a5, int a6, int a7)
{
  uint64_t v18 = 4 * (v15 + v13);
  int v19 = (a2 & a3 ^ v9) + v7 + (*(_DWORD *)(*v11 + v18) ^ v14) - (*(_DWORD *)(*v12 + v18) ^ v14);
  *(_DWORD *)(*a1 + v18) = v19 + v14 - (v17 & (2 * v19));
  BOOL v21 = v15 + a6 > a7 || v15 + a6 < v8;
  return (*(uint64_t (**)(void))(v16 + 8 * (v10 ^ (16 * v21))))();
}

uint64_t sub_100029768(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8)
{
  int v13 = *(unsigned __int8 *)(v8 + (v11 + v10 + 2));
  return (*(uint64_t (**)(uint64_t, uint64_t, void))(v9 + 8 * (v12 ^ (29 * (a8 == 2143130624)))))(a1, a2, (v13 ^ 0x59BFF73D) - 277356564 + ((v13 << ((v12 + 6) & 0xED)) & 0x7Au));
}

void sub_100029810()
{
  *(_DWORD *)(v0 + 8) = -1158872075;
}

uint64_t sub_10002985C@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  *(unsigned char *)(v6 + v4 + v3 + a2) = v5;
  return (*(uint64_t (**)(void))(v8 + 8 * ((((unint64_t)(v6 + 1 + a1) < 0x38) * v7) ^ v2)))();
}

uint64_t sub_10002988C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return (*(uint64_t (**)(uint64_t))(v10
                                            + 8
                                            * (int)(((((v9 + 355) | 0x180) + (v9 ^ 0xFFFFF86F))
                                                   * (*(_DWORD *)(v11 - 144) != a6)) ^ v9)))(a9);
}

uint64_t sub_1000298C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  BOOL v19 = HIDWORD(a11) < 0x1AFFC75B;
  uint64_t v20 = (v17 - 278456132) & 0x1098E67D;
  if (v19 == v16 - 376741762 < (v20 + 452970282)) {
    BOOL v19 = (v16 - 376741762) < HIDWORD(a11);
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v18 + 8 * ((493 * v19) ^ v17)))(a1, 452970331, HIDWORD(a11), a4, 164, 493, v20, a8, a9, a10, a11, a12, a13, a14, a15, a16);
}

uint64_t sub_10002994C@<X0>(int a1@<W4>, int a2@<W5>, int a3@<W6>, _DWORD *a4@<X7>, char a5@<W8>, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43)
{
  unsigned int v48 = (v43 + 811799856) & 0xCF9CEEFA;
  int v49 = 219 * (v43 ^ 0x2CC);
  unsigned int v50 = &a43 + (v45 - 2112833707);
  unsigned int v51 = ((*(_DWORD *)(*v47 + (*a4 & 0x393A6864)) ^ v50) & 0x7FFFFFFF) * a2;
  unint64_t v52 = (v51 ^ HIWORD(v51)) * a2;
  char v53 = *((unsigned char *)*(&off_10005CE90 + (v43 ^ 0x29A)) + (v52 >> 24) - 4);
  char v54 = *((unsigned char *)*(&off_10005CE90 + v43 - 635) + (v52 >> 24) - 4) ^ *((unsigned char *)*(&off_10005CE90 + v43 - 632)
                                                                      + (v52 >> 24)
                                                                      - 5);
  LOBYTE(v52) = v52 ^ (15 * BYTE3(v52));
  char *v50 = v53 ^ ((v48 ^ v44 ^ (a1 + v49 - 2203)) >> a5) ^ v54 ^ v52;
  return (*(uint64_t (**)(void))(v46
                              + 8
                              * ((1655
                                * (v45
                                 - (((v53 ^ ((v48 ^ v44 ^ (a1 + v49 - 2203)) >> a5) ^ v54) ^ v52) != 0) == a3)) ^ v43)))();
}

uint64_t sub_100029A54@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  *(unsigned char *)(a1 + (v4 - 223289211)) = *(unsigned char *)(a2 + (v4 - 223289211))
                                                  - ((v3 ^ 0x58) & (2 * *(unsigned char *)(a2 + (v4 - 223289211))))
                                                  + 82;
  return (*(uint64_t (**)(void))(v5 + 8 * ((1583 * (v4 - 1 == v2)) ^ v3)))();
}

uint64_t sub_100029AA8@<X0>(int a1@<W8>)
{
  LODWORD(STACK[0x3AC]) = STACK[0x288];
  LODWORD(STACK[0x3DC]) = STACK[0x290];
  STACK[0x2E8] = STACK[0x270];
  STACK[0x510] = STACK[0x280];
  STACK[0x338] = STACK[0x278];
  STACK[0x408] = STACK[0x298];
  LODWORD(STACK[0x424]) = 2;
  STACK[0x318] = 0;
  LODWORD(STACK[0x4A0]) = 0;
  LODWORD(STACK[0x3B8]) = 0;
  return (*(uint64_t (**)(void))(v2 + 8 * (((8 * (((a1 ^ 0x32C) & v1) != 0)) | (16 * (((a1 ^ 0x32C) & v1) != 0))) ^ a1)))();
}

uint64_t sub_100029B18()
{
  int v7 = 535753261 * ((((v6 - 136) | 0x3E5BA146) - ((v6 - 136) & 0x3E5BA146)) ^ 0x34AFAF69);
  *(_DWORD *)(v6 - 128) = v7 + 1194343371;
  *(_DWORD *)(v6 - 124) = (v0 + 870) ^ v7;
  *(void *)(v6 - 136) = v2;
  (*(void (**)(uint64_t))(v3 + 8 * (v0 ^ 0xA64)))(v6 - 136);
  *(_DWORD *)(v6 - 128) = v0
                        + ((638976023 - ((v6 - 136) | 0x26160017) + ((v6 - 136) | 0xD9E9FFE8)) ^ 0x564CE42E) * v4
                        + 559;
  *(void *)(v6 - 136) = v1;
  *(void *)(v6 - 120) = v5;
  (*(void (**)(uint64_t))(v3 + 8 * (v0 + 1462)))(v6 - 136);
  *(void *)(v6 - 120) = v2;
  *(_DWORD *)(v6 - 128) = v0 + ((~((v6 - 136) | 0x76D9E9A9) + ((v6 - 136) & 0x76D9E9A9)) ^ 0x6830D90) * v4 + 1041;
  *(void *)(v6 - 136) = v1;
  uint64_t v8 = (*(uint64_t (**)(uint64_t))(v3 + 8 * (v0 ^ 0xA3D)))(v6 - 136);
  return (*(uint64_t (**)(uint64_t))(v3
                                            + 8
                                            * (((*(_DWORD *)(v6 - 124) <= 0x76FA18A2u)
                                              * (((v0 - 456) | 1) ^ ((v0 ^ 0x2B3) - 113))) ^ v0)))(v8);
}

uint64_t sub_100029C84@<X0>(uint64_t a1@<X1>, uint64_t a2@<X6>, uint64_t a3@<X8>)
{
  unint64_t v7 = a3 + a1;
  *(unsigned char *)(v7 + a2 + (v3 ^ v5 ^ 0x133u) - 71) = v4;
  return (*(uint64_t (**)(void))(v6 + 8 * (((v7 < 0x38) * v5) ^ v3 ^ v5)))();
}

void sub_100029CC0(int a1@<W2>, char a2@<W8>)
{
  *(void *)(v4 - 0x14F716D90F32FE87) = *v2;
  *(_DWORD *)(v5 - 0x2565C4DA53AB2E8DLL) = a1;
  void *v2 = 0;
  *(void *)(v8 - 0x3D8A64FC118460FALL) = 0x1C20221D1C20221DLL;
  _DWORD *v3 = 1405494216;
  *(_DWORD *)(v8 - 0x3D8A64FC118460EELL) = ((((*(_DWORD *)(v8 - 0x3D8A64FC118460EELL) & 0xFFFFFFFE ^ 0x5B9BE77A) << (a2 - 68)) & 0x3A1A7734)
                                          - (*(_DWORD *)(v8 - 0x3D8A64FC118460EELL) & 0xFFFFFFFE ^ 0x5B9BE77A)
                                          - 487406492) ^ 0xB969231E;
  *(_DWORD *)(v7 + 36) = *v6;
}

uint64_t sub_100029DDC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  *(_DWORD *)(v16 - 128) = v14 + ((((v16 - 136) | 0xFC1637B6) - ((v16 - 136) & 0xFC1637B6)) ^ 0x73B32C70) * v12 + 967;
  *(void *)(v16 - 120) = v15;
  *(void *)(v16 - 136) = a12;
  uint64_t v17 = (*(uint64_t (**)(uint64_t))(v13 + 8 * (v14 + 1403)))(v16 - 136);
  return (*(uint64_t (**)(uint64_t))(v13
                                            + 8
                                            * (((*(_DWORD *)(v16 - 124) > 0x76FA18A3u) * ((3 * (v14 ^ 0x203)) ^ 0x505)) ^ v14)))(v17);
}

uint64_t sub_100029E78()
{
  LODWORD(STACK[0x464]) = v0;
  return sub_100029E8C();
}

uint64_t sub_100029E8C()
{
  return (*(uint64_t (**)(void))(v1
                              + 8
                              * ((116
                                * (((v0 + 122) ^ (LODWORD(STACK[0x464]) == v2 + v0 - 1016 - 761)) & 1)) ^ (v0 - 703))))();
}

uint64_t sub_100029ECC()
{
  int v5 = v1 + v0 + 268700257 >= (v3 ^ 0xFFFFFFAD) + v3 - 69;
  return (*(uint64_t (**)(uint64_t))(v4 + 8 * (((v5 << 6) | (v5 << 7)) ^ v3)))(v2);
}

uint64_t sub_100029F1C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v4
                                                                       + 8
                                                                       * (((LODWORD(STACK[0x3CC]) == v5)
                                                                         * ((v3 + 114) ^ (v3 + 161))) ^ v3)))(a1, a2, a3, 1158830124);
}

uint64_t sub_100029F54(__n128 a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7, char a8)
{
  v8.n128_u64[0] = (a6 + 12) & 0xF;
  v8.n128_u64[1] = (a6 + 11) & 0xF;
  v9.n128_u64[0] = (a6 + 10) & 0xF;
  v9.n128_u64[1] = (a6 + a8 - 1 + 71) & 0xF;
  v10.n128_u64[0] = (a6 + 8) & 0xF;
  v10.n128_u64[1] = (a6 + 7) & 0xF;
  v11.n128_u64[0] = 0x1717171717171717;
  v11.n128_u64[1] = 0x1717171717171717;
  return sub_10002A040(a1, v8, v9, v10, (__n128)xmmword_100056D90, v11);
}

uint64_t sub_10002A040(double a1, __n128 a2, __n128 a3, __n128 a4, int8x16_t a5, int8x16_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, int a11, int a12, int a13, int a14)
{
  uint64_t v27 = (a11 + v17 - a14);
  uint64_t v28 = ((_BYTE)a11 + (_BYTE)v17 - (_BYTE)a14) & 0xF;
  uint64_t v29 = v20;
  v30.i64[0] = vqtbl4q_s8(*(int8x16x4_t *)(&a2 - 1), a5).u64[0];
  v30.i64[1] = vqtbl4q_s8(*(int8x16x4_t *)&v23, a5).u64[0];
  int8x16_t v31 = vrev64q_s8(vmulq_s8(v30, a6));
  *(int8x16_t *)(v21 + v27) = veorq_s8(veorq_s8(veorq_s8(*(int8x16_t *)(v14 + (v27 & 0xF) - 15), *(int8x16_t *)(v19 + v27)), veorq_s8(*(int8x16_t *)(v16 + (v27 & 0xF) - 15), *(int8x16_t *)((v27 & 0xF) + v15 - 14))), vextq_s8(v31, v31, 8uLL));
  return (*(uint64_t (**)(void))(v22 + 8 * ((a14 + v18 - 422 != a12) | a13)))();
}

uint64_t sub_10002A0BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, int a18, int a19)
{
  *(void *)(*(void *)(a17 + 96) + 504) = v19 + 1;
  *(_DWORD *)(*(void *)(a17 + 96) + 496) = a19 - 1;
  int v22 = 235795823 * ((((v21 - 160) | 0x14C5FA4E) - (v21 - 160) + ((v21 - 160) & 0xEB3A05B0)) ^ 0x8068B317);
  *(_DWORD *)(v21 - 156) = v22 + 832817738;
  *(_DWORD *)(v21 - 152) = 1172345435 - v22;
  STACK[0x320] = (unint64_t)&STACK[0x1FA9E8BAFD93FC64];
  uint64_t v23 = (*(uint64_t (**)(uint64_t))(v20 + 16864))(v21 - 160);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v20
                                                     + 8
                                                     * ((29
                                                       * (a19
                                                        - 1210543848
                                                        + ((2 * LODWORD(STACK[0x2F0])) & 0x7C ^ 0x40)
                                                        + (STACK[0x2F0] & 0x3F ^ 0xFEEF975E) < 0xFFFFFFC0)) ^ 0x424u)))(v23, 2486282488);
}

uint64_t sub_10002A2C0()
{
  STACK[0x528] = *(void *)(v1 + 8 * (v0 - 1691));
  return sub_10003D59C(v0 + 182);
}

uint64_t sub_10002A300()
{
  int v3 = v0 ^ 0x323;
  return (*(uint64_t (**)(void))(v2
                              + 8
                              * ((37
                                * (((v3 - 504) ^ 0xD461A0B6 ^ ((((v3 ^ 0xFFFFFA7D) & v1)
                                                              - ((2 * ((v3 ^ 0xFFFFFA7D) & v1)) & 0xF469B37C)
                                                              + 2050283966) << ((v3 + 125) & 0x59 ^ 0x58)) & 0xDFF7EB3E)
                                 + ((((v3 ^ 0xFFFFFA7D) & v1)
                                   - ((2 * ((v3 ^ 0xFFFFFA7D) & v1)) & 0xF469B37C)
                                   + 2050283966) ^ 0x95CF2C21)
                                 + 950336355 != 681636098)) ^ v3)))();
}

uint64_t sub_10002A3B8@<X0>(int a1@<W8>)
{
  return (*(uint64_t (**)(void))(v2
                              + 8
                              * ((350 * (a1 - 704281290 < ((v1 - 2017221872) | 0x196u) - 423)) ^ (v1 - 2017221322))))();
}

void sub_10002A408()
{
}

uint64_t sub_10002A410(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unsigned int v9 = v4 - 2063400874;
  if (v9 <= 0x40) {
    unsigned int v9 = 64;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v8
                                                                                + 8
                                                                                * (((-v5
                                                                                   - v7
                                                                                   + ((485 * (v6 ^ 0x51F)) ^ 0x7AFCFC60)
                                                                                   + v9 < 0xF)
                                                                                  * (v6 ^ 0x51F)) ^ v6)))(a1, a2, a3, a4, 829712093);
}

uint64_t sub_10002A484(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, void))(v2
                                                    + 8
                                                    * ((231
                                                      * (((*(_DWORD *)(v3 - 0x3D8A64FC118460F6) == 471867933) ^ ((v1 ^ 0x85) - 1)) & 1)) ^ v1)))(a1, *(void *)(v3 - 0x3D8A64FC11846102));
}

uint64_t sub_10002A4F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, unint64_t *a12, uint64_t a13, uint64_t a14, uint64_t a15, unsigned int a16, unint64_t *a17, unint64_t *a18)
{
  a17 = &STACK[0x6A5823FD3C5DCAC8];
  a18 = a12;
  a16 = (v20 - 229) ^ (1374699841
                     * ((2 * (&a16 & 0x3E37FD38) - &a16 - 1043856698) ^ 0xAC3C1ACF));
  (*(void (**)(unsigned int *))(v19 + 8 * (v20 + 1316)))(&a16);
  a16 = (v20 - 229) ^ (1374699841 * (((&a16 | 0x3811F97) - (&a16 & 0x3811F97)) ^ 0x6E75079E));
  a17 = &STACK[0x6A5823FD3C5DCAC0];
  a18 = a12;
  (*(void (**)(unsigned int *))(v19 + 8 * (v20 + 1316)))(&a16);
  a16 = (v20 - 229) ^ (1374699841
                     * (((&a16 | 0x7695AD7B) + (~&a16 | 0x896A5284)) ^ 0x1B61B573));
  a17 = &STACK[0x6A5823FD3C5DCAC4];
  a18 = a12;
  (*(void (**)(unsigned int *))(v19 + 8 * (v20 + 1316)))(&a16);
  LODWORD(a18) = v20
               - 1755732067
               * ((-493616554 - (&a16 | 0xE2940256) + (&a16 | 0x1D6BFDA9)) ^ 0xC3AD4072)
               + 958;
  a17 = a12;
  uint64_t v21 = (*(uint64_t (**)(unsigned int *))(v19 + 8 * (v20 ^ 0xA8B)))(&a16);
  return (*(uint64_t (**)(uint64_t))(v19 + 8 * ((13 * (a16 == ((557 * (v20 ^ 0x2D6)) ^ (v18 + 954)))) ^ v20)))(v21);
}

uint64_t sub_10002A6C8(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)(a1 + 56) = *(_DWORD *)(a2 + 4);
  *(void *)(a1 + 64) = *(void *)(a2 + 8);
  return 0;
}

uint64_t sub_10002A6E0@<X0>(uint64_t a1@<X5>, int a2@<W7>, uint64_t a3@<X8>, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18)
{
  unint64_t v27 = (*(_DWORD *)(a3 + v24) ^ v18) + HIDWORD(v26);
  *(_DWORD *)(a3 + 4 * a1) = v27 + (((v25 ^ 0x593) - 767) ^ (v18 + 1223)) - (v20 & (2 * v27));
  *(_DWORD *)(a18 + v24) = HIDWORD(v27) | v18;
  BOOL v28 = a2 + 50347353 < v21;
  if (v19 > v22 != a2 + 50347353 < -792445541) {
    BOOL v28 = v19 > v22;
  }
  return (*(uint64_t (**)(void))(v23 + 8 * ((v25 + 314) ^ (1335 * v28))))();
}

void sub_10002A778(uint64_t a1)
{
  int v1 = 1759421093 * (a1 ^ 0xB37DB054);
  if (*(void *)(a1 + 24)) {
    BOOL v2 = *(_DWORD *)(a1 + 20) - v1 == 471867933;
  }
  else {
    BOOL v2 = 1;
  }
  int v3 = v2;
  __asm { BRAA            X8, X17 }
}

uint64_t sub_10002A818(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9, int a10)
{
  *(void *)(v15 - 120) = v11;
  *(void *)(v15 - 136) = v13;
  *(_DWORD *)(v15 - 128) = v14 + ((v15 - 136) ^ 0x8FA51BC6) * v10 - 521;
  uint64_t v16 = (*(uint64_t (**)(uint64_t))(v12 + 8 * (v14 ^ 0xE86)))(v15 - 136);
  return (*(uint64_t (**)(uint64_t))(v12 + 8 * (((((v14 - 453) | 0x200) - 1684) * (a10 > 0)) ^ v14)))(v16);
}

void sub_10002A89C()
{
}

uint64_t sub_10002A8A4(uint64_t a1, uint64_t a2, int a3)
{
  return (*(uint64_t (**)(void))(v3 + 8 * ((224 * (v4 + 8 == (a3 ^ (2 * v5)) - 386)) ^ v5)))();
}

void sub_10002A900(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 40) - 235795823 * ((a1 + 1866794728 - 2 * (a1 & 0x6F4506E8)) ^ 0xFBE84FB1);
  __asm { BRAA            X14, X17 }
}

uint64_t sub_10002AA1C(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  int v6 = *(unsigned __int8 *)(v5 - 124) ^ 0xCF;
  if (v6 == 1)
  {
    char v9 = 32;
    unsigned int v13 = *(_DWORD *)(v5 - 156);
    unsigned int v12 = *(_DWORD *)(v5 - 152);
    *(unsigned char *)(v5 - 164) = 8 * v12 - ((16 * v12) & 0xA0) + 82;
    *(unsigned char *)(v5 - 163) = ((v12 >> 5) ^ 0xEF) - ((2 * ((v12 >> 5) ^ 0xEF)) & 0xA4) + 82;
    *(unsigned char *)(v5 - 162) = ((v12 >> 13) ^ 0x45) - ((2 * ((v12 >> 13) ^ 0x45)) & 0xA4) + 82;
    *(unsigned char *)(v5 - 161) = ((v12 >> 21) ^ 0xD) + (~(v12 >> 20) | 0x5B) + 83;
    HIDWORD(v14) = ~v13;
    LODWORD(v14) = v12 ^ 0x20000000;
    *(unsigned char *)(v5 - 160) = (v14 >> 29) - ((2 * (v14 >> 29)) & 0xA4) + 82;
    *(unsigned char *)(v5 - 159) = ((v13 >> 5) ^ 0x4F) - ((2 * ((v13 >> 5) ^ 0x4F)) & 0xA4) + 82;
    *(unsigned char *)(v5 - 158) = ((v13 >> 13) ^ 0x13) - 2 * (((v13 >> 13) ^ 0x13) & 0x56 ^ (v13 >> 13) & 4) + 82;
    unsigned int v10 = (v13 >> 21) ^ 0xFFFFFFE9;
    char v11 = (2 * v10) & 0xA4;
    goto LABEL_5;
  }
  if (v6 == 2)
  {
    unsigned int v10 = *(_DWORD *)(v5 - 156);
    unsigned int v7 = *(_DWORD *)(v5 - 152);
    HIDWORD(v8) = ~v10;
    LODWORD(v8) = v7 ^ 0x20000000;
    *(unsigned char *)(v5 - 164) = ((v10 >> (a4 - 107)) ^ 0xE9) - ((2 * ((v10 >> (a4 - 107)) ^ 0xE9)) & 0xA4) + 82;
    *(unsigned char *)(v5 - 163) = ((v10 >> 13) ^ 0x13) - ((2 * ((v10 >> 13) ^ 0x13)) & 0xA4) + 82;
    *(unsigned char *)(v5 - 162) = ((v10 >> 5) ^ 0x4F) - ((2 * ((v10 >> 5) ^ 0x4F)) & 0xA4) + 82;
    *(unsigned char *)(v5 - 161) = (v8 >> 29) - ((2 * (v8 >> 29)) & 0xA4) + 82;
    *(unsigned char *)(v5 - 160) = ((v7 >> 21) ^ 0xD) - ((v7 >> 20) & 0xA4) + 82;
    *(unsigned char *)(v5 - 159) = ((v7 >> 13) ^ 0x45) + (~(2 * ((v7 >> 13) ^ 0x45)) | 0x5B) + 83;
    *(unsigned char *)(v5 - 158) = ((v7 >> 5) ^ 0xEF) - ((2 * ((v7 >> 5) ^ 0xEF)) & 0xA4) + 82;
    char v9 = a4 - 96;
    LOBYTE(v10) = 8 * v7;
    char v11 = (16 * v7) & 0xA0;
LABEL_5:
    *(unsigned char *)(v5 - 157) = v10 - v11 + ((v9 - 117) & 0xD4) - 46;
  }
  return sub_100027474();
}

uint64_t sub_10002AC60()
{
  return (*(uint64_t (**)(void))(v3
                              + 8
                              * ((123 * (v2 + v0 - 133 >= v1 + 2147481761 + ((v1 - 554565138) & 0x210DF9D7u))) ^ v1)))();
}

uint64_t sub_10002ACB0()
{
  *(_DWORD *)(v4 - 112) = v1 + ((((v4 - 120) | 0xCDA04FA0) - ((v4 - 120) & 0xCDA04FA0)) ^ 0x42055466) * v2 - 180;
  *(void *)(v4 - 104) = v6;
  *(void *)(v4 - 120) = v3;
  return (*(uint64_t (**)(uint64_t))(v0 + 8 * (v1 ^ 0xD6D)))(v4 - 120);
}

void sub_10002AD48()
{
}

uint64_t sub_10002AD5C@<X0>(int a1@<W5>, int a2@<W6>, int a3@<W8>)
{
  STACK[0x288] = *v3;
  return sub_10002C310(a1, a2, a3);
}

uint64_t sub_10002AD8C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,int a38,int a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,unsigned int *a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  int v70 = STACK[0x290];
  if (LODWORD(STACK[0x290]) == 582388011) {
    return (*(uint64_t (**)(void))(v68
  }
                                + 8
                                * ((((((LODWORD(STACK[0x288]) - 1471272300) < 3) ^ (LOBYTE(STACK[0x2AC]) - 58)) & 1)
                                  * (119 * (LODWORD(STACK[0x2AC]) ^ 0x6F5) + 1530)) ^ (LODWORD(STACK[0x2AC]) - 763))))();
  if (v70 == 313952552)
  {
    int v75 = STACK[0x2AC];
    (*(void (**)(void, uint64_t, uint64_t))(v68 + 8 * (LODWORD(STACK[0x2AC]) + 327)))(*a57, v65, v66);
    STACK[0x4E8] = 0;
    LODWORD(STACK[0x340]) = 0;
    unint64_t v76 = STACK[0x2B0];
    int v77 = *(_DWORD *)(a65 + 52) + 176349273;
    int v78 = 1224239923 * ((-1065362320 - ((v69 - 200) | 0xC07FDC70) + ((v69 - 200) | 0x3F80238F)) ^ 0xCD33DE58);
    int v79 = v78 + (LODWORD(STACK[0x414]) ^ 0x75BEFEED) + ((2 * LODWORD(STACK[0x414])) & 0xEB7DFDDA) - 1411912832;
    *(_DWORD *)(v69 - 160) = v78 + v75 - 1720;
    *(_DWORD *)(v69 - 156) = v79;
    *(void *)(v69 - 200) = a47;
    *(_DWORD *)(v69 - 188) = (a39 & 0x7FFFFFFF ^ 0xF1F88607)
                           - v78
                           + (v67 & 0xFBCCEBBA ^ 0x180CE3B0)
                           + (((v75 - 1777) | 0x800) ^ 0xDFB9F778);
    *(_DWORD *)(v69 - 184) = v77 ^ v78;
    *(void *)(v69 - 176) = v76;
    *(void *)(v69 - 168) = &STACK[0x1820];
    uint64_t v80 = (*(uint64_t (**)(uint64_t))(v68 + 8 * (v75 ^ 0xE86)))(v69 - 200);
    int v81 = *(_DWORD *)(v69 - 192);
    LODWORD(STACK[0x464]) = v81;
    return (*(uint64_t (**)(uint64_t))(v68 + 8 * ((999 * (v81 == -1158872075)) ^ (v75 - 1667))))(v80);
  }
  else
  {
    int v71 = STACK[0x2AC];
    int v72 = (LODWORD(STACK[0x2AC]) - 1727) | 0x64D;
    LODWORD(STACK[0x290]) = v70;
    int v73 = 3804331 * ((2 * ((v69 - 200) & 0x3D4A22D8) - (v69 - 200) + 1119214880) ^ 0xCD10C6E6);
    *(_DWORD *)(v69 - 200) = (v70 - ((2 * v70 + 1519578544) & 0x75DA07EA) + (v72 ^ 0xA8367CB2)) ^ v73;
    *(_DWORD *)(v69 - 196) = v71 - v73 + 138;
    *(void *)(v69 - 192) = a28;
    (*(void (**)(uint64_t))(v68 + 8 * (v71 + 319)))(v69 - 200);
    return sub_10003EAFC();
  }
}

uint64_t sub_10002AD94(int a1, int a2, int a3, unsigned int a4)
{
  uint64_t v9 = (a2 + a1 + a3);
  unint64_t v10 = *(void *)(v8 - 120);
  unint64_t v11 = v9 + v10 + 1;
  uint64_t v12 = (((a4 + 18560107) & 0xFEE4CF7F ^ 0xFFFFFE84) + 121 * (a4 ^ 0x156)) & (a2 + a1);
  uint64_t v13 = v12 - v9;
  unint64_t v14 = v4 + v13;
  ++v12;
  unint64_t v15 = v4 + v12;
  unint64_t v16 = v6 + v13;
  unint64_t v17 = v6 + v12;
  unint64_t v18 = v5 + v13;
  unint64_t v19 = v5 + v12;
  BOOL v21 = v15 > v10 && v14 < v11;
  if (v17 > v10 && v16 < v11) {
    BOOL v21 = 1;
  }
  int v24 = v19 > v10 && v18 < v11 || v21;
  return (*(uint64_t (**)(void))(v7 + 8 * ((59 * v24) ^ a4)))();
}

uint64_t sub_10002AE60(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, int a7)
{
  uint64_t v13 = (a5 - 1105605851);
  *(unsigned char *)(*(void *)(v12 - 120) + v13) ^= *(unsigned char *)(v8 + (v13 & 0xF)) ^ *(unsigned char *)(v10 + (v13 & 0xF)) ^ *(unsigned char *)(v9 + (v13 & 0xF)) ^ (5 * (v13 & 0xF)) ^ 0x52;
  return (*(uint64_t (**)(void))(v11 + 8 * ((1974 * (a5 - 1 == v7)) ^ (a7 - 558))))();
}

uint64_t sub_10002AECC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,int a27)
{
  return sub_10002F7A0(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27);
}

uint64_t sub_10002AEF4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, int a15, int a16)
{
  return (*(uint64_t (**)(void))(v17 + 8 * ((1401 * (a16 == v18 - 1044366419)) ^ v16)))();
}

_DWORD *sub_10002AF24(_DWORD *result)
{
  *uint64_t result = 1738448729;
  return result;
}

uint64_t sub_10002AF40(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  return (*(uint64_t (**)(void))(v6
                              + 8
                              * (((*(_DWORD *)(a3 + 48 * (v5 + v4)) == (v7 ^ (a4 - 638)) - 1922492007)
                                * (42 * (v7 ^ 0x787) - 171)) ^ v7)))();
}

uint64_t sub_10002AF9C(uint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4, int a5)
{
  return (*(uint64_t (**)(void))(v6
                              + 8
                              * ((2 * ((a5 + 1 + v5) < 0x40)) | (4 * ((a5 + 1 + v5) < 0x40)) | a2)))();
}

uint64_t sub_10002B07C@<X0>(uint64_t a1@<X2>, uint64_t a2@<X5>, int a3@<W8>, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,int a24,int a25,uint64_t a26,unint64_t a27,int a28)
{
  LODWORD(STACK[0x278]) = a3;
  LODWORD(STACK[0x27C]) = a28;
  STACK[0x280] = a27;
  LODWORD(STACK[0x288]) = a25 - v32 + 1308242440;
  STACK[0x290] = a2 + (((v31 + 1210057828) | 0x301C5801) ^ 0xC5BF136F) + v32;
  int v34 = (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 48 * v33 + 8))(a12, a20);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v30
                                                                       + 8
                                                                       * ((54
                                                                         * (v34
                                                                          + v29
                                                                          - ((v34 << ((v31 + 23) & 0xF7 ^ 0xE2)) & v28) == v29)) ^ v31)))(2000647704, 357408481, a22, 2017221945);
}

void sub_10002B170()
{
}

uint64_t sub_10002B184(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, unint64_t, unint64_t))(v52 + 8 * ((30 * (((LODWORD(STACK[0x2AC]) - 1712) ^ 0x6ADDE72) + LODWORD(STACK[0x2AC]) - 1734 != 112057966)) ^ (LODWORD(STACK[0x2AC]) - 657))))(a1, a2, a3, a52, 4182909345, 115, 0xFFE7F2AC655855CELL, STACK[0x288]);
}

uint64_t sub_10002B1F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return (*(uint64_t (**)(void))(v8 + 8 * ((((a5 + ((v7 + 289981659) | 0x211200A) + 904) ^ 0x4F3) * (v5 == v6)) ^ v7)))();
}

uint64_t sub_10002B238(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, int a6, uint64_t a7)
{
  *(void *)(a7 + (a4 + v8)) = *(void *)(a3 + (a4 + v8));
  return (*(uint64_t (**)(void))(v7 + 8 * (((v10 == 0) * v9) ^ a6)))();
}

uint64_t sub_10002B268@<X0>(uint64_t a1@<X0>, int a2@<W8>)
{
  LODWORD(STACK[0x2A0]) = a2 + 1157;
  LODWORD(STACK[0x298]) = (a2 + 1157) ^ 0x148;
  int v3 = (a2 + 324) | 0x4D0;
  uint64_t v4 = (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8 * (a2 + 1906)))(a1, 4182676990);
  return (*(uint64_t (**)(void))(v2 + 8 * (((v4 == 0) * (v3 ^ (LODWORD(STACK[0x298]) + 696))) ^ LODWORD(STACK[0x2A0]))))();
}

void sub_10002B2D8()
{
}

uint64_t sub_10002B2E0()
{
  int v5 = (v2 ^ v4 ^ 0x4A308653) + v0;
  int v6 = *v3 + 1244692735;
  int v7 = (v6 < -609268348) ^ (v5 < -609268348);
  BOOL v8 = v5 > v6;
  if (v7) {
    BOOL v8 = v5 < -609268348;
  }
  return (*(uint64_t (**)(void))(v1 + 8 * ((75 * v8) ^ v2)))();
}

uint64_t sub_10002B344()
{
  (*(void (**)(void))(v1 + 8 * (v0 ^ 0xEBA)))();
  return (*(uint64_t (**)(void))(v1 + 8 * ((52 * (STACK[0x508] != 0)) ^ (v0 - 941))))();
}

uint64_t sub_10002B388(double a1)
{
  *(double *)(v4 + (v2 & 0x1617AB6F)) = a1;
  return (*(uint64_t (**)(void))(v5 + 8 * (((4 * (v3 == 0)) | ((v3 == 0) << 9)) ^ v1)))();
}

uint64_t sub_10002B3C0()
{
  LODWORD(STACK[0x494]) = 0;
  return sub_10001F8E0(v0 + 1705);
}

uint64_t sub_10002B3CC(uint64_t a1, uint64_t a2, int a3, int a4, int a5, int a6)
{
  *(_DWORD *)(a2 + (v8 - a5)) = *(_DWORD *)(v6 + (v8 - a5));
  return (*(uint64_t (**)(void))(v9 + 8 * (((a4 + a5 == v7) * a6) ^ a3)))();
}

uint64_t sub_10002B3F8()
{
  return (*(uint64_t (**)(void))(v2 + 8 * ((1520 * (v0 - 162308311 < ((v1 + 1435) ^ 0x5D9u))) ^ (v1 + 303))))();
}

void sub_10002B444()
{
}

uint64_t sub_10002B450@<X0>(int a1@<W1>, int a2@<W2>, uint64_t a3@<X8>)
{
  unsigned int v7 = ((a2 ^ 0xA7DD45A0) & (2 * ((v6 ^ v3) + v4 + (a2 ^ 0x685 ^ a1))))
     + (((v6 ^ v3) + v4 + (a2 ^ 0x685 ^ a1)) ^ 0x53EEA3FD)
     + 1030517674;
  unsigned int v8 = v5 + 1966798218;
  int v9 = (v8 < 0x915B17A7) ^ (v7 < 0x915B17A7);
  BOOL v10 = v7 > v8;
  if (v9) {
    BOOL v10 = v7 < 0x915B17A7;
  }
  return (*(uint64_t (**)(void))(a3 + 8 * (v10 ^ a2)))();
}

void sub_10002B4DC(_DWORD *a1)
{
  *((unsigned char *)a1 + v1 + 4) = -102;
  sub_10003EF10(a1);
}

uint64_t sub_10002B508(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)(*(void *)(v5 + 96) + 1428) = 1680994575;
  return (*(uint64_t (**)(void))(v4
                              + 8
                              * (((*(_DWORD *)(a2 + 4) != v2 + 32 * (v3 ^ 0x1D9) - 1440) * ((v3 ^ 0x1D9) + 975)) ^ v3)))();
}

uint64_t sub_10002B560(uint64_t a1, double a2)
{
  *(double *)(v5 + (v3 ^ v6) + a1) = a2;
  BOOL v9 = v4 == a1;
  uint64_t v10 = a1 + 8;
  int v11 = !v9;
  return (*(uint64_t (**)(uint64_t))(v8 + 8 * ((v11 * v7) ^ v2)))(v10);
}

void sub_10002B58C()
{
}

uint64_t sub_10002B704()
{
  (*(void (**)(void))(v1 + 8 * (v0 + 346)))();
  return (*(uint64_t (**)(void))(v1 + 8 * ((82 * (STACK[0x350] != 0)) ^ (v0 - 1259))))();
}

uint64_t sub_10002B740()
{
  return sub_10002B74C();
}

uint64_t sub_10002B74C@<X0>(int a1@<W1>, char a2@<W4>, int a3@<W8>)
{
  int v11 = *(uint64_t (**)(void))(v8 + 8 * v3);
  uint64_t v12 = *v10;
  unsigned int v13 = v4 + a1;
  *(unsigned char *)(*v10 + v13) = (HIBYTE(a3) ^ a2) - 2 * ((HIBYTE(a3) ^ a2) & v5 ^ HIBYTE(a3) & 8) + 82;
  *(unsigned char *)(v12 + v13 + 1) = (v9 ^ BYTE2(a3)) - (v6 & (2 * (v9 ^ BYTE2(a3)))) + 82;
  *(unsigned char *)(v12 + v13 + 2) = (BYTE1(a3) ^ 0x8F) - (v6 & (2 * (BYTE1(a3) ^ 0x8F))) + 82;
  *(unsigned char *)(v12 + v13 + 3) = a3 ^ v7;
  return v11();
}

uint64_t sub_10002B7CC(int a1, uint64_t a2, uint64_t a3, int a4)
{
  return (*(uint64_t (**)(void))(v6
                              + 8
                              * ((430
                                * (a1 + v5 + 63 >= ((((v4 + 273186774) | 0x3116422) - a4 + 1050) ^ (a1 - 998)) + v5)) ^ v4)))();
}

void sub_10002B824()
{
  STACK[0x598] = 0xF94FA64135EA834ELL;
  STACK[0x590] = 0x12F183975977D032;
  JUMPOUT(0x100022190);
}

void sub_10002B870()
{
}

uint64_t sub_10002B920()
{
  return 4294925278;
}

uint64_t sub_10002B928()
{
  return sub_10002B930();
}

uint64_t sub_10002B930@<X0>(int a1@<W1>, uint64_t a2@<X2>, int a3@<W3>, int a4@<W8>, int8x16_t a5@<Q1>, int8x16_t a6@<Q3>)
{
  int8x16_t v11 = *(int8x16_t *)(v9 + (v7 + a1 + v6));
  *(int8x16_t *)(a2 + v6) = vaddq_s8(vsubq_s8(v11, vandq_s8(vaddq_s8(v11, v11), a6)), a5);
  return (*(uint64_t (**)(void))(v8 + 8 * (((v6 != 48) * v10) ^ (a3 + a4 + 277))))();
}

uint64_t sub_10002B978(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,int a41,uint64_t a42,int a43,int a44)
{
  return (*(uint64_t (**)(void))(v44
                              + 8
                              * (a44 ^ (63
                                      * (((2 * (a10 - ((2 * a41) & 0x64D2EC82) - 720525964)) & 0xF3E797F6 ^ 0x60C28482)
                                       + ((a10 - ((2 * a41) & 0x64D2EC82) - 720525964) ^ 0xCB9ABDBA)
                                       + 657454520 == 555991475)))))();
}

uint64_t sub_10002BA34()
{
  int v6 = v3 + *(unsigned __int8 *)(v2 + 1) - 819;
  return (*(uint64_t (**)(void))(v5 + 8 * ((1641 * ((v1 & (2 * v6)) + (v6 ^ v0) == v0)) ^ v4)))();
}

uint64_t sub_10002BA70(int a1)
{
  return (*(uint64_t (**)(void))(v5
                              + 8
                              * (int)(((*(_DWORD *)(v4 + 1424) != ((v1 + v2) & v3 ^ 0x40411B61))
                                     * ((v1 + a1) & 0x95072D7A ^ 0xBF8)) ^ v1)))();
}

uint64_t sub_10002BAC0()
{
  return (*(uint64_t (**)(void))(v2
                              + 8
                              * ((v1 - 301) | 0x201 | (8
                                                     * (((((((v1 - 301) | 0x201) + 1007310305) ^ 0x3C0A52DE) - 1316) & v0) != ((((v1 - 301) | 0x201) + 1007310305) & 0xC3F5AFEF ^ 0x7E2))))))();
}

uint64_t sub_10002BB18(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v24 + 8 * (((v22 + 843) * ((a3 + v23 + 610) < 4)) ^ v22)))(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22);
}

uint64_t sub_10002BB50()
{
  return (*(uint64_t (**)(void))(v1 + 8 * ((28 * (LODWORD(STACK[0x220]) == 1)) ^ v0)))();
}

uint64_t sub_10002BBB8()
{
  return (*(uint64_t (**)(void))(v0
                              + 8
                              * ((206
                                * (((v2 ^ ((*(_DWORD *)(*v3 + 4 * v5) ^ v1) > (v2 ^ 0x742 ^ (v1 + 1240) ^ *(_DWORD *)(*v4 + 4 * v5)))) & 1) == 0)) ^ v2)))();
}

void sub_10002BC14()
{
  STACK[0x518] = *(void *)(v0 + 8 * (LODWORD(STACK[0x2AC]) - 1724));
  JUMPOUT(0x1000039F8);
}

uint64_t sub_10002BC3C(uint64_t a1)
{
  int v1 = 535753261 * ((a1 & 0x20D467A0 | ~(a1 | 0x20D467A0)) ^ 0xD5DF9670);
  int v2 = *(_DWORD *)(a1 + 4) + v1;
  int v3 = *(_DWORD *)a1 + v1;
  if (v3 < 0) {
    int v3 = -v3;
  }
  int v4 = *(_DWORD *)(*(void *)(a1 + 8) - 0x4C6937770F4864B4);
  unsigned int v6 = v4 - 293522565;
  BOOL v5 = v4 - 293522565 < 0;
  unsigned int v7 = 293522565 - v4;
  if (!v5) {
    unsigned int v7 = v6;
  }
  return (*((uint64_t (**)(void))*(&off_10005CE90 + v2 - 1612) + ((432 * (v3 >> 5 < v7)) ^ v2)))();
}

void sub_10002BCF0()
{
}

uint64_t sub_10002BD18(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30)
{
  BOOL v36 = (_DWORD *)(a26 + 24 * v31);
  _DWORD *v36 = v33;
  v36[1] = a5;
  *(void *)(v32 + 24 * v31 + 16) = a6;
  v36[4] = HIDWORD(a29);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v34 + 8 * ((45 * (*(_DWORD *)(a3 + 48 * v35 + 32) + ((v30 + 1648121632) & 0x9DC3AE3D ^ 0x8C08FD7) < ((v30 + 2075975469) & 0xFC7F7D39) + 130261706)) ^ v30)))(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
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

void sub_10002BDC4()
{
}

void sub_10002BDDC(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 16) + 1178560073 * (((a1 | 0xD9A9EA42) - a1 + (a1 & 0x265615BD)) ^ 0x633D9220);
  __asm { BRAA            X10, X17 }
}

uint64_t sub_10002BEA8()
{
  return 4294925278;
}

uint64_t sub_10002BEB0()
{
  uint64_t v0 = (uint64_t)*(&off_10005CE90
                + ((85 * ((qword_100060158 - dword_100060380) ^ 0xD)) ^ byte_1000519D0[byte_10004D730[(85 * ((qword_100060158 - dword_100060380) ^ 0xD))] ^ 0x10])
                + 50);
  uint64_t v1 = *(void *)(v0 - 4);
  int v2 = *(&off_10005CE90
       + (byte_100056C68[(byte_100051ADC[(85
                                                                                           * ((qword_100060158 + v1) ^ 0xD))
                                                                         - 12] ^ 0x33)
                                        - 8] ^ (85 * ((qword_100060158 + v1) ^ 0xD)))
       - 121);
  unint64_t v3 = (unint64_t)&v8[*v2 - v1];
  *(void *)(v0 - 4) = 839241301 * v3 - 0x7D8293EE6603FCAFLL;
  void *v2 = 839241301 * (v3 ^ 0x78A901D92725650DLL);
  unsigned int v9 = (1374699841 * ((2 * (&v9 & 0x19DD0CF8) - &v9 - 433917178) ^ 0x8BD6EB0F)) ^ 0x6DA;
  int8x16_t v11 = (char *)*(&off_10005CE90
                + (byte_1000519D0[byte_10004D730[(85
                                                                                                * ((*(_DWORD *)v2
                                                                                                  - *(_DWORD *)(v0 - 4)) ^ 0xD))] ^ 0x9B] ^ (85 * ((*(_DWORD *)v2 - *(_DWORD *)(v0 - 4)) ^ 0xD)))
                + 2)
      - 4;
  uint64_t v4 = (uint64_t)*(&off_10005CE90
                + ((85 * ((qword_100060158 - dword_100060380) ^ 0xD)) ^ byte_100056960[byte_1000518D0[(85 * ((qword_100060158 - dword_100060380) ^ 0xD))] ^ 0x42])
                + 136);
  (*(void (**)(unsigned int *))(v4
                                         + 8
                                         * (((85
                                                                           * ((*(_DWORD *)v2 + *(_DWORD *)(v0 - 4)) ^ 0xD)) ^ byte_1000519D0[byte_10004D730[(85 * ((*(_DWORD *)v2 + *(_DWORD *)(v0 - 4)) ^ 0xD))] ^ 0xE6])
                                          + 1931)))(&v9);
  unsigned int v9 = (1374699841 * (&v9 ^ 0x6DF41809)) ^ 0x6DA;
  int8x16_t v11 = (char *)*(&off_10005CE90
                + ((85 * (*(_DWORD *)(v0 - 4) ^ 0xD ^ *(_DWORD *)v2)) ^ byte_1000519D0[byte_10004D730[(85 * (*(_DWORD *)(v0 - 4) ^ 0xD ^ *(_DWORD *)v2))] ^ 0x9B])
                - 43);
  unsigned __int8 v5 = 85 * (*(_DWORD *)(v0 - 4) ^ 0xD ^ *(_DWORD *)v2);
  (*(void (**)(unsigned int *))(v4
                                         + 8
                                         * ((byte_10004A064[(byte_100056B68[v5 - 8] ^ 0x62)
                                                                                         - 4] ^ v5)
                                          + 1912)))(&v9);
  unsigned int v6 = 1374699841 * ((2 * (&v9 & 0x1CF1FAC8) - &v9 + 1661863223) ^ 0xEFA1D3E);
  unsigned int v9 = v6 ^ 0x790;
  char v10 = v6 + 113;
  return (*(uint64_t (**)(unsigned int *))(v4
                                                   + 8
                                                   * ((byte_100049F68[(byte_100056A60[(85 * (*(_DWORD *)(v0 - 4) ^ 0xD ^ *(_DWORD *)v2))] ^ 0xC8) - 8] ^ (85 * (*(_DWORD *)(v0 - 4) ^ 0xD ^ *(_DWORD *)v2)))
                                                    + 1996)))(&v9);
}

void sub_10002C260()
{
  STACK[0x518] = *(void *)(v0 + 8 * (LODWORD(STACK[0x2AC]) - 1774));
  JUMPOUT(0x1000039F8);
}

uint64_t sub_10002C288@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, int a9@<W8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62)
{
  STACK[0x210] = v63;
  *(void *)(v65 + 1516) = v62;
  *(void *)(v65 + 1524) = v62;
  *(_DWORD *)(v65 + 1532) = v64;
  *(void *)(a3 + 96) = v65;
  *(_DWORD *)(v65 + 476) = 886556627;
  unint64_t v67 = STACK[0x408];
  unint64_t v68 = v66 + STACK[0x408] + ((a9 + 1017) ^ 0xFEB2803ADFC26D86);
  STACK[0x250] = STACK[0x408];
  STACK[0x228] = v67 + 432;
  STACK[0x288] = STACK[0x380];
  STACK[0x290] = v68;
  STACK[0x258] = a3;
  return sub_10002C310(a1, a2, a3, a4, a5, a6, a7, a8, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19, a20,
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
           a39,
           a40,
           a41,
           a42,
           a43,
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
           v65,
           a59,
           a60,
           a3,
           a62);
}

uint64_t sub_10002C310@<X0>(int a1@<W5>, int a2@<W6>, int a3@<W8>)
{
  int v6 = v3 ^ 0x4AE;
  STACK[0x278] = *(void *)(v5 + 8 * a3);
  STACK[0x408] = STACK[0x228];
  LODWORD(STACK[0x43C]) = 363543235;
  LODWORD(STACK[0x3A4]) = 1228396329;
  STACK[0x488] = 0;
  LODWORD(STACK[0x4F4]) = 1115468202;
  unsigned int v7 = (_DWORD *)STACK[0x290];
  _DWORD *v7 = a1;
  LODWORD(STACK[0x270]) = v4 + 1379028952;
  LODWORD(STACK[0x298]) = v4 - 1698066938;
  LODWORD(STACK[0x2A0]) = v4 + 1949941322;
  LODWORD(STACK[0x260]) = v4 + 1934913341;
  LODWORD(STACK[0x268]) = (v3 ^ 0x4AE) + v4 + 1430454428;
  LODWORD(v7) = *v7;
  LODWORD(STACK[0x280]) = a2 - 640;
  BOOL v9 = v7 != a1 || a2 + 1 != ((v6 + 497) ^ (a2 - 640));
  return (*(uint64_t (**)(void))(v5 + 8 * ((v9 * (v6 - 17)) ^ v6)))();
}

uint64_t sub_10002C408(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12, int a13)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v13
                                                                                         + 8
                                                                                         * (((((v14 - 1280) | 0x692) ^ 0xB96)
                                                                                           * (a13 > 0)) ^ v14)))(a1, a2, a3, a4, a5, 2147481761);
}

uint64_t sub_10002C46C()
{
  return (*(uint64_t (**)(void))(v0
                              + 8
                              * (int)((((v2 + 2001136479) & 0x88B917DF ^ (v2 + 1857124422) & 0x914E87B9 ^ 0x32)
                                     * (**(void **)(v1 + 8 * (v2 - 535)) == 0)) ^ (v2 + 18))))();
}

uint64_t sub_10002C4D4()
{
  BOOL v4 = v1 + v2 - 1 >= 196 * (v0 ^ 0x2F5u) + 2147482863;
  return (*(uint64_t (**)(void))(v3 + 8 * ((2 * v4) | (8 * v4) | v0)))();
}

void sub_10002C51C(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 24) + 1224239923 * ((((2 * a1) | 0x6988450E) - a1 + 1262214521) ^ 0x4677DF50);
  __asm { BRAA            X14, X17 }
}

uint64_t sub_10002C610()
{
  return (*(uint64_t (**)(void))(v2
                              + 8
                              * ((472 * (((v1 < v0) ^ ((LODWORD(STACK[0x2AC]) ^ 0xFB) + 1)) & 1)) ^ (LODWORD(STACK[0x2AC]) - 1055))))();
}

void sub_10002C654(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_DWORD *)(a3 + v4) = v3;
  JUMPOUT(0x10002AD0CLL);
}

uint64_t sub_10002C6AC(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 8) - 3804331 * (a1 ^ 0x8FA51BC6);
  return (*((uint64_t (**)(void))*(&off_10005CE90 + (v1 ^ 0x427))
          + (int)(((*(void *)a1 == *(void *)(a1 + 16)) * (((v1 + 758017876) & 0xD2D18EE8) - 627)) ^ v1)))();
}

uint64_t sub_10002C71C(uint64_t a1, uint64_t a2)
{
  return ((uint64_t (*)(void))*(&off_1000589E0 + ((49 * (*(_DWORD *)(a2 + 4) == 1228396330)) | 0x68Au)))();
}

uint64_t sub_10002C754()
{
  return (*(uint64_t (**)(void))(v1 + 8 * ((2094 * (v2 == ((v0 - 1704) ^ (v3 - 57)))) ^ (v0 - 1714))))();
}

uint64_t sub_10002C788()
{
  *(_DWORD *)(*v2 + 4 * (v4 + v0)) = v1;
  return (*(uint64_t (**)(void))(v5 + 8 * ((254 * (v0 + v4 + (v3 ^ 0x5F8) - 407 >= 0)) ^ v3)))();
}

uint64_t sub_10002C7CC(uint64_t a1, uint64_t a2, uint64_t a3, int a4, int a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12, int a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,int a25,char a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  int v37 = 1755732067 * ((((2 * (v36 - 128)) | 0x581E1344) - (v36 - 128) - 739183010) ^ 0xF2C9B479);
  *(void *)(v36 - 128) = a10;
  *(_DWORD *)(v36 - 120) = v37 + a5 + 222;
  *(_DWORD *)(v36 - 116) = a13 - v37 + a4 + a5 - 847384140;
  uint64_t v38 = (*(uint64_t (**)(uint64_t))(v35 + 8 * (a5 + 2023)))(v36 - 128);
  unsigned int v39 = a35 & 0x3F ^ (a5 - 45);
  *(&a26 + v39) = -46;
  return (*(uint64_t (**)(uint64_t))(v35 + 8 * ((1476 * (v39 > 0x37)) ^ a5)))(v38);
}

uint64_t sub_10002C8D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,int a23)
{
  unsigned int v26 = (a23 ^ v25) - (((a23 ^ v25) << ((v24 + 112) ^ 0x33)) & 0xFFEAE12A) - 692075;
  return (*(uint64_t (**)(uint64_t, uint64_t, void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v23 + 8 * ((86 * (((v26 << (((v24 + 67) | 0x22) ^ 0x26)) & 0x5B77FD82 ^ 0x5B62E102) + (v26 ^ 0xD24E8E54) - 211842560 == 555452609)) ^ (v24 + 244))))(a1, a2, (v24 - 656), a4, a5, a6, 555452609, 1058, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18);
}

uint64_t sub_10002C99C()
{
  unsigned int v5 = ((v2 - 1271186742) & 0x4BC4C7D3 ^ 0xFFFFFC6C) + *(unsigned __int8 *)(v3 + 7);
  return (*(uint64_t (**)(void))(v4 + 8 * ((1547 * ((v1 & (2 * v5)) + (v5 ^ v0) == v0)) ^ v2)))();
}

uint64_t sub_10002C9F0()
{
  unsigned int v3 = LODWORD(STACK[0x4F4]) + ((v0 - 1657) ^ 0x4ECBA5B1);
  int v4 = ((v1 + 1209040831) < 0x914856E8) ^ (v3 < 0x914856E8);
  BOOL v5 = v3 < v1 + 1209040831;
  if (v4) {
    BOOL v5 = (v1 + 1209040831) < 0x914856E8;
  }
  return (*(uint64_t (**)(void))(v2 + 8 * (v5 | (32 * v5) | v0)))();
}

void sub_10002CA54()
{
}

uint64_t sub_10002CAA4()
{
  uint64_t v6 = *(void *)(v9 + 24);
  int v7 = 108757529 * ((((v5 - 144) | 0xDBA6EF8F) + (~(v5 - 144) | 0x24591070)) ^ 0x3B3A8DA5);
  *(void *)(v5 - 136) = v10;
  *(_DWORD *)(v5 - 144) = (v0 + 1208) ^ v7;
  *(_DWORD *)(v5 - 140) = v7 ^ 0x245280BD;
  (*(void (**)(uint64_t))(v4 + 8 * (v0 ^ 0xAA2)))(v5 - 144);
  *(void *)(v5 - 120) = v10;
  *(void *)(v5 - 112) = v3;
  *(_DWORD *)(v5 - 104) = v0
                        + 235795823 * ((2 * ((v5 - 144) & 0x7A33CFE0) - (v5 - 144) - 2050215910) ^ 0x11617943)
                        - 559;
  *(void *)(v5 - 144) = v2;
  *(void *)(v5 - 136) = v1;
  *(void *)(v5 - 128) = v1;
  (*(void (**)(uint64_t))(v4 + 8 * (v0 + 1350)))(v5 - 144);
  *(void *)(v5 - 144) = v1;
  *(_DWORD *)(v5 - 136) = v0
                        + 3804331 * ((((v5 - 144) | 0xF76D89FF) - (v5 - 144) + ((v5 - 144) & 0x8927600)) ^ 0x78C89239)
                        + 442;
  *(void *)(v5 - 128) = v6;
  return (*(uint64_t (**)(uint64_t))(v4 + 8 * (v0 ^ 0xAC3)))(v5 - 144);
}

void sub_10002CC14()
{
}

uint64_t sub_10002CC20(uint64_t a1, uint64_t a2)
{
  STACK[0x2F0] = *(void *)(v2 + 8 * (LODWORD(STACK[0x2AC]) - 1775));
  return sub_100042758(a1, a2, -1660710441);
}

uint64_t sub_10002CC30()
{
  return (*(uint64_t (**)(void))(v1
                              + 8
                              * ((601
                                * (*(_DWORD *)STACK[0x290] - 763955141 + ((v0 - 1017483034) & 0x3CA589EFu) - 142 < 0x10)) ^ v0)))();
}

uint64_t sub_10002CC88(uint64_t result)
{
  unint64_t v1 = 535753261
     * ((-2 - ((~result | 0xCE9083717906D1D1) + (result | 0x316F7C8E86F92E2ELL))) ^ 0x3B72DE1C73F2DFFELL);
  unint64_t v2 = *(void *)(result + 32) - v1;
  unint64_t v3 = *(void *)result ^ v1;
  BOOL v4 = v3 == v2;
  BOOL v5 = v3 > v2;
  int v6 = v4;
  if (((*(_DWORD *)(result + 16) + v1) & 1) == 0) {
    BOOL v5 = v6;
  }
  BOOL v4 = !v5;
  uint64_t v7 = 40;
  if (!v4) {
    uint64_t v7 = 24;
  }
  *(_DWORD *)(result + 20) = *(_DWORD *)(result + v7) ^ v1 ^ (*(_DWORD *)(result + 8) + v1);
  return result;
}

uint64_t sub_10002CD34()
{
  *(void *)(v5 - 128) = v4;
  *(void *)(v5 - 112) = v1;
  *(_DWORD *)(v5 - 120) = v2 + 3804331 * ((v5 + 1349735923 - 2 * ((v5 - 128) & 0x50735673)) ^ 0xDFD64DB5) + 965;
  uint64_t v6 = (*(uint64_t (**)(uint64_t))(v0 + 8 * (v2 + 1401)))(v5 - 128);
  return (*(uint64_t (**)(uint64_t))(v0
                                            + 8
                                            * ((23
                                              * (((v2 - 43) ^ (*(_DWORD *)(v5 - 116) > v3 + 35 * (v2 ^ 0x2DDu) - 735)) & 1)) | v2)))(v6);
}

uint64_t sub_10002CE08@<X0>(void *a1@<X0>, char a2@<W1>, int a3@<W4>, int a4@<W5>, int a5@<W6>, int a6@<W8>)
{
  *(unsigned char *)(*a1 + (a5 + a6)) = (a4 ^ v8) >> a2;
  return (*(uint64_t (**)(void))(v6 + 8 * ((29 * (a5 + a3 + 707 - 978 == v7 + a3 + 456)) ^ a3)))();
}

uint64_t sub_10002CE58@<X0>(int a1@<W8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17)
{
  int v21 = (a1 + 1150) | 0x80;
  *(void *)(v20 - 144) = a16;
  *(void *)(v20 - 136) = v18;
  *(_DWORD *)(v20 - 104) = a1 + (((~(v20 - 144) & 0xABA1E94E) - (~(v20 - 144) | 0xABA1E94F)) ^ 0x3F0CA016) * v17 - 40;
  *(void *)(v20 - 120) = a5;
  *(void *)(v20 - 112) = a17;
  *(void *)(v20 - 128) = v18;
  uint64_t v22 = (*(uint64_t (**)(uint64_t))(v19 + 8 * (a1 + 1869)))(v20 - 144);
  return (*(uint64_t (**)(uint64_t))(v19
                                            + 8
                                            * ((7 * (a12 + v21 - 616 + ((2 * v21) ^ 0xE3FA578B) > 0x7FFFFFFE)) ^ (v21 + 81))))(v22);
}

uint64_t sub_10002CF1C@<X0>(int a1@<W8>)
{
  *(_DWORD *)(v4 + 4 * (v2 - 274670784)) = 274670784
                                                         - v2
                                                         + ((1566083941
                                                           * (*(_DWORD *)(v4 + 4 * (v2 - 274670785)) ^ (*(_DWORD *)(v4 + 4 * (v2 - 274670785)) >> 30))) ^ *(_DWORD *)(v4 + 4 * (v2 - 274670784)));
  unint64_t v6 = 1374699841 * ((~(v1 | 0xB05CE583DA476239) + (v1 & 0xB05CE583DA476239)) ^ 0x41AF8470484C85CFLL);
  *(void *)(v5 - 176) = v6 + 2072386613;
  *(_DWORD *)(v5 - 168) = a1 - 1583921794 + v6;
  *(_DWORD *)(v5 - 164) = ((a1 - 1583921794) ^ 9) - v6;
  *(_DWORD *)(v5 - 180) = (a1 - 504208807) ^ v6;
  *(_DWORD *)(v5 - 200) = v6 ^ 1;
  *(_DWORD *)(v5 - 196) = a1 - 1583921794 - v6 - 94;
  *(void *)(v5 - 192) = (v2 + 1797715830) + v6;
  uint64_t v7 = (*(uint64_t (**)(uint64_t))(v3 + 8 * (a1 ^ 0xE90)))(v5 - 200);
  return (*(uint64_t (**)(uint64_t))(v3 + 8 * *(int *)(v5 - 184)))(v7);
}

uint64_t sub_10002D038()
{
  uint64_t v0 = *(&off_10005CE90
       + ((85 * (dword_100060128 ^ 0xD ^ qword_100060158)) ^ byte_100049E60[byte_100056860[(85 * (dword_100060128 ^ 0xD ^ qword_100060158))] ^ 0xBF])
       - 97);
  unsigned __int8 v1 = 85 * ((qword_100060158 + *v0) ^ 0xD);
  int v2 = *(&off_10005CE90 + (byte_10005696C[(byte_1000518D4[v1 - 4] ^ 0x42) - 12] ^ v1)
                        + 59);
  unint64_t v3 = (unint64_t)&v5[*v0 + *v2];
  *uint64_t v0 = 839241301 * v3 - 0x78A901D92725650DLL;
  void *v2 = 839241301 * (v3 ^ 0x78A901D92725650DLL);
  unsigned int v6 = (1374699841 * ((&v6 - 685824170 - 2 * (&v6 & 0xD71F2756)) ^ 0xBAEB3F5F)) ^ 0x6DA;
  LOBYTE(v3) = 85 * ((*(_DWORD *)v2 - *(_DWORD *)v0) ^ 0xD);
  uint64_t v7 = (uint64_t)*(&off_10005CE90
                + (byte_1000519D8[(byte_10004D73C[v3 - 12] ^ 0xF6) - 8] ^ v3)
                - 16);
  LOBYTE(v0) = 85 * ((*(_DWORD *)v2 + *(_DWORD *)v0) ^ 0xD);
  return (*((uint64_t (**)(unsigned int *))*(&off_10005CE90
                                                     + ((85
                                                                                      * (dword_100060128 ^ 0xD ^ qword_100060158)) ^ byte_100049E60[byte_100056860[(85 * (dword_100060128 ^ 0xD ^ qword_100060158))] ^ 0xD1])
                                                     + 32)
          + (byte_100056C68[(byte_100051ADC[v0 - 12] ^ 0x33)
                                                         - 8] ^ v0)
          + 1969))(&v6);
}

uint64_t sub_10002D26C()
{
  return (*(uint64_t (**)(void))(v2 + 8 * ((v1 + 1404883401) ^ (11 * (v0 <= v3 + 623)))))();
}

uint64_t sub_10002D2A8()
{
  int v6 = v1 + 621;
  uint64_t v7 = (void *)STACK[0x290];
  unint64_t v8 = STACK[0x290] + 264;
  v7[31] = 0x117ECC854AD43AA4;
  v7[32] = v8;
  v7[65] = 0x117ECC854AD43AA4;
  v7[66] = v7 + 67;
  STACK[0x298] = (unint64_t)(v7 + 0x98D26EEE1E90CD8);
  v7[99] = 0x117ECC854AD43AA4;
  v7[100] = v7 + 101;
  STACK[0x260] = (unint64_t)(v7 + 0x98D26EEE1E90CFALL);
  v7[133] = 0x117ECC854AD43AA4;
  v7[134] = v7 + 135;
  STACK[0x270] = (unint64_t)(v7 + 0x98D26EEE1E90D1CLL);
  v7[167] = 0x117ECC854AD43AA4;
  v7[168] = v7 + 169;
  STACK[0x278] = (unint64_t)(v7 + 0x98D26EEE1E90D3ELL);
  unint64_t v9 = STACK[0x4C8] + 4;
  LODWORD(STACK[0x2A0]) = 2 * v4;
  LODWORD(STACK[0x280]) = v1 + 398;
  int v10 = 1225351577 * ((v5 + 562447963 - 2 * ((v5 - 200) & 0x21864723)) ^ 0x5F79DD11);
  *(_DWORD *)(v5 - 180) = v1 + 398 - v10;
  *(void *)(v5 - 192) = v9;
  *(_DWORD *)(v5 - 200) = ((v4 ^ 0xCD527F07) - 620978400 + ((2 * v4) & 0xEF7EF9E4 ^ 0x655A01E0)) ^ v10;
  *(void *)(v5 - 176) = v7 + 0x98D26EEE1E90CB6;
  uint64_t v11 = 8 * (v1 ^ 0xCBF);
  STACK[0x258] = v11;
  (*(void (**)(uint64_t))(v3 + v11))(v5 - 200);
  uint64_t v12 = v9 + v2;
  unsigned int v13 = (STACK[0x2A0] & 0xBDFA3C74 ^ 0x35DA0460) + ((v1 - 468706997) ^ v4) - 205586984;
  int v14 = 1225351577 * ((((v5 - 200) | 0x155097C1) + (~(v5 - 200) | 0xEAAF683E)) ^ 0x6BAF0DF2);
  *(void *)(v5 - 176) = STACK[0x298];
  *(_DWORD *)(v5 - 180) = LODWORD(STACK[0x280]) - v14;
  *(void *)(v5 - 192) = v12;
  *(_DWORD *)(v5 - 200) = v13 ^ v14;
  uint64_t v15 = 8 * (v1 + 951);
  STACK[0x298] = v15;
  (*(void (**)(uint64_t))(v3 + v15))(v5 - 200);
  uint64_t v16 = v12 + v2;
  STACK[0x250] = v12 + v2;
  LODWORD(v12) = STACK[0x2A0];
  int v17 = 1225351577 * ((896332480 - ((v5 - 200) | 0x356CF2C0) + ((v5 - 200) | 0xCA930D3F)) ^ 0xB46C970D);
  *(_DWORD *)(v5 - 200) = ((v4 ^ 0xE0517E6B) - 134242700 + (STACK[0x2A0] & 0xB578FB3C ^ 0x35580328)) ^ v17;
  *(void *)(v5 - 192) = v16;
  int v18 = STACK[0x280];
  *(_DWORD *)(v5 - 180) = LODWORD(STACK[0x280]) - v17;
  *(void *)(v5 - 176) = STACK[0x260];
  (*(void (**)(uint64_t))(v3 + STACK[0x298]))(v5 - 200);
  uint64_t v19 = STACK[0x250] + v2;
  int v20 = 1225351577 * ((((v5 - 200) | 0xC99D9FFD) - (v5 - 200) + ((v5 - 200) & 0x36626000)) ^ 0xB76205CF);
  *(void *)(v5 - 176) = STACK[0x270];
  *(_DWORD *)(v5 - 200) = ((v4 ^ 0x4010FC86) + 1472076959 + (v12 & 0xF5FBFEE6 ^ 0x75DA06E2)) ^ v20;
  *(_DWORD *)(v5 - 180) = v18 - v20;
  uint64_t v21 = v19;
  *(void *)(v5 - 192) = v19;
  (*(void (**)(uint64_t))(v3 + STACK[0x258]))(v5 - 200);
  unsigned int v22 = (v4 ^ 0x6810BFEE) + 2143182839 + (STACK[0x2A0] & 0xA5FB7836 ^ 0x25DA0022);
  int v23 = 1225351577
      * ((-2 - (((v5 - 200) ^ 0x90B48304 | 0x67434C63) + ((v5 - 200) ^ 0x42030042 | 0x98BCB39C))) ^ 0x53B7E68B);
  *(_DWORD *)(v5 - 180) = v18 - v23;
  *(void *)(v5 - 176) = STACK[0x278];
  *(_DWORD *)(v5 - 200) = v22 ^ v23;
  *(void *)(v5 - 192) = v21 + v2;
  (*(void (**)(uint64_t))(v3 + STACK[0x298]))(v5 - 200);
  unint64_t v24 = STACK[0x4C8];
  unint64_t v25 = (v0 - 1228396329);
  STACK[0x2F8] = v25;
  return (*(uint64_t (**)(unint64_t))(v3
                                                     + 8
                                                     * ((127 * (v25 != ((v6 + 625540860) & 0xDAB6FFDF) - 1485)) ^ (v6 - 1336))))(v24);
}

uint64_t sub_10002D784()
{
  *(void *)(v4 - 220 + v0 + 1) = 0x5252525252525252;
  return (*(uint64_t (**)(void))(v3 + 8 * ((((v1 & 0x38) == 8) * (v2 ^ 0x5AE)) ^ v2)))();
}

uint64_t sub_10002D7D0(double a1, double a2, double a3, double a4, double a5, int8x16_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39)
{
  uint64_t v44 = (const float *)(v42 + 908);
  int8x16_t v45 = (int8x16_t)vld1q_dup_f32(v44);
  v46.i64[0] = 0x8000000080000000;
  v46.i64[1] = 0x8000000080000000;
  a6.i64[0] = *(void *)(a39 + 4);
  a6.i32[2] = *(_DWORD *)(a39 + 12);
  int8x16_t v47 = vextq_s8(v45, a6, 0xCuLL);
  int8x16_t v48 = a6;
  v48.i32[3] = *(_DWORD *)(a39 + 16);
  int32x4_t v49 = (int32x4_t)veorq_s8((int8x16_t)vshrq_n_u32((uint32x4_t)vorrq_s8(vandq_s8(v48, (int8x16_t)vdupq_n_s32(0x7FFFFFFEu)), vandq_s8(v47, v46)), 1uLL), *(int8x16_t *)(a39 - 908));
  v47.i32[0] = *(_DWORD *)(v40 + 4 * (*(_DWORD *)(a39 + 4) & 1));
  v47.i32[1] = *(_DWORD *)(v40 + 4 * (*(_DWORD *)(a39 + 8) & ((v39 - 216) ^ 0xCFu)));
  v47.i32[2] = *(_DWORD *)(v40 + 4 * (*(_DWORD *)(a39 + 12) & 1));
  v47.i32[3] = *(_DWORD *)(v40 + 4 * (v48.i8[12] & 1));
  *(int8x16_t *)a39 = veorq_s8((int8x16_t)vaddq_s32(vsubq_s32(v49, (int32x4_t)vandq_s8((int8x16_t)vaddq_s32(v49, v49), (int8x16_t)vdupq_n_s32(v41))), vdupq_n_s32(0xAE3EB38D)), v47);
  return (*(uint64_t (**)(void))(v43 + 8 * v39))();
}

uint64_t sub_10002D8B0(uint64_t a1, uint64_t a2, int a3, uint64_t a4, int a5, int a6)
{
  BOOL v7 = a3 + ((a6 ^ 0xFFFFFCAE) & a5) + 1 + 1396 < 0x30;
  return (*(uint64_t (**)(void))(v6 + 8 * (((16 * v7) | (32 * v7)) ^ a6 ^ 0x84u)))();
}

void sub_10002D9AC()
{
  _DWORD *v1 = v0;
  sub_1000390E8();
}

uint64_t sub_10002D9B4(uint64_t a1, uint64_t a2)
{
  return ((uint64_t (*)(uint64_t))*(&off_1000589E0
                                           + (((2 * (*(_DWORD *)(a2 + 4) == 1228396342)) | (8
                                                                                          * (*(_DWORD *)(a2 + 4) == 1228396342))) ^ 0x456u)))(4294925278);
}

uint64_t sub_10002D9F4@<X0>(unsigned int a1@<W0>, int a2@<W8>)
{
  return sub_100036B80(a1, a2);
}

uint64_t sub_10002DE48(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21)
{
  *(void *)(v25 - 120) = v21;
  *(void *)(v25 - 112) = a21;
  *(_DWORD *)(v25 - 104) = v23
                         - 1224239923 * ((((v25 - 120) | 0x29F4E1E7) - ((v25 - 120) & 0x29F4E1E7)) ^ 0xDB471C30)
                         - 1525;
  uint64_t v26 = (*(uint64_t (**)(uint64_t))(v22 + 8 * (v23 ^ 0xE94)))(v25 - 120);
  return (*(uint64_t (**)(uint64_t))(v22
                                            + 8
                                            * (((v24 != (v23 ^ 0x419) + 1878724289) * ((v23 - 1129) ^ 0x379)) ^ v23)))(v26);
}

uint64_t sub_10002DEF4@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)(*a1 - 0x6DD0242DB3724EE9) = 0;
  return (*(uint64_t (**)(void))(a2 + 8 * ((947 * (*v2 == ((v4 + 980) ^ (v3 + 869)))) ^ v4)))();
}

uint64_t sub_10002DF40()
{
  int v6 = (v1 & (2 * (*(unsigned __int8 *)(v2 + 3) - 134))) + ((*(unsigned __int8 *)(v2 + 3) - 134) ^ v0) == (v4 ^ (v0 + 504));
  return (*(uint64_t (**)(void))(v5 + 8 * ((v6 | (v6 << 6)) ^ v3)))();
}

uint64_t sub_10002DF7C()
{
  LODWORD(STACK[0x3CC]) = v2;
  return (*(uint64_t (**)(void))(v1 + 8 * ((((v0 - 963) ^ 0x312) * v3) ^ (v0 - 165))))();
}

uint64_t sub_10002DFAC@<X0>(int a1@<W8>)
{
  STACK[0x210] = 0x14D7FC5203D9659;
  int v3 = a1 & 0x3BEB9DFF;
  LOBYTE(STACK[0x18C4]) = (-103 * ((2 * ((v2 + 56) & 0xE8) - (v2 + 56) + 17) ^ 0x23)) ^ 0x1C;
  *(void *)(v2 - 200) = &STACK[0x325ADC664C0CED61];
  *(void *)(v2 - 184) = &STACK[0x471594F912D1403D];
  *(_DWORD *)(v2 - 176) = ((a1 & 0x3BEB9DFF) - 971) ^ (1225351577
                                                     * ((2 * ((v2 - 200) & 0x3CAEDAE8) - (v2 - 200) + 1129391377) ^ 0x3DAEBF23));
  uint64_t v4 = (*(uint64_t (**)(uint64_t))(v1 + 8 * (a1 & 0x3BEB9DFF ^ 0xDA3u)))(v2 - 200);
  int v5 = *(_DWORD *)(v2 - 192);
  LODWORD(STACK[0x464]) = v5;
  return (*(uint64_t (**)(uint64_t))(v1
                                            + 8
                                            * (((v5 == ((v3 + 1811173628) & 0x940BAFFD ^ 0xBAED0504))
                                              * (((v3 - 1499) | 0x1A0) + 577)) ^ v3)))(v4);
}

uint64_t sub_10002E0D8()
{
  return (*(uint64_t (**)(void))(v2 + 8 * ((27 * (v0 + 1 == v3 + 4)) ^ v1)))();
}

void sub_10002E1B4()
{
}

uint64_t sub_10002E1C8()
{
  int v1 = STACK[0x2A8];
  STACK[0x408] -= 1616;
  LODWORD(STACK[0x3CC]) = 1158830274;
  return (*(uint64_t (**)(void))(v0 + 8
                                   * ((19 * (((STACK[0x318] == 0) ^ (v1 + 46)) & 1)) ^ (v1 - 267))))();
}

uint64_t sub_10002E240@<X0>(int a1@<W4>, int a2@<W8>)
{
  return (*(uint64_t (**)(void))(v8
                              + 8
                              * (((((*(_DWORD *)(v4 + 4 * (a2 + a1 + 599)) == v2) ^ (v3 + v7)) & 1)
                                * (((v3 + v5) & v6) - 1920)) ^ (v3 + 1323))))();
}

uint64_t sub_10002E24C@<X0>(int a1@<W8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, int a14, int a15)
{
  return (*(uint64_t (**)(void))(v16 + 8 * ((((((4 * a15) ^ 0x1378) - 1258) ^ a15 ^ 0x54E) * (a1 == v15)) ^ a15)))();
}

uint64_t sub_10002E28C@<X0>(uint64_t a1@<X8>)
{
  return (*(uint64_t (**)(void))(v3 + 8 * (((*(unsigned char *)(a1 + v2) == 94) * ((v1 + 1111) ^ 0x157)) ^ v1)))();
}

uint64_t sub_10002E2C8()
{
  return (*(uint64_t (**)(void))(v2
                              + 8
                              * (((v0 - 829712093 + v1 - 763 - 1016 >= (v0 - 829712093))
                                * (((v1 - 1802) | 0x11) ^ 0x42)) ^ v1)))();
}

uint64_t sub_10002E320()
{
  return (*(uint64_t (**)(void))(v2
                              + 8
                              * ((501
                                * (((v1 << (((v0 - 31) & 0xEF) + 55)) & 0xDFBF4F9A ^ 0x8B9C0310)
                                 + (v1 ^ 0xBA11E665)
                                 + ((v0 - 570720636) & 0x22047FE7)
                                 - 1330686321 == 546243521)) ^ v0)))();
}

uint64_t sub_10002E3BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  LODWORD(STACK[0x3CC]) = v66;
  return (*(uint64_t (**)(void))(v65
                              + 8
                              * ((((*(_DWORD *)(a64 + 360) - 1678813230) > 0xFFFFFFFD)
                                * (((v64 - 181) | 0xBA) - 1451)) ^ v64)))();
}

void sub_10002E414(uint64_t a1)
{
  int v1 = 1374699841 * ((~a1 & 0x2CB30A96 | a1 & 0xD34CF569) ^ 0x4147129F);
  __asm { BRAA            X11, X17 }
}

uint64_t sub_10002E4D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return (*(uint64_t (**)(void))(v6 + 8 * ((221 * (a1 + 1 != v5 + 48)) ^ a5)))();
}

uint64_t sub_10002E594()
{
  return (*(uint64_t (**)(void))(v2 + 8 * (((v0 != ((v1 - 1109) | 0x40) - 7) * ((v1 + 498) ^ 0x649)) | v1)))();
}

uint64_t sub_10002E5D4()
{
  return (*(uint64_t (**)(void))(v2 + 8 * (((((((v4 - 589) ^ v0) + v1) & 0x7FFFFFFC) == v3) * (v4 + 597)) ^ v4)))();
}

uint64_t sub_10002E608(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  return (*(uint64_t (**)(void))(v16
                              + 8
                              * ((49
                                * (a13 + v13 - (unint64_t)(v14 + a1) < (unint64_t)((v15 + 1534982880) & 0xB7DBE7EF)
                                                                                          - 324658906)) ^ v15)))();
}

void sub_10002E660()
{
}

uint64_t sub_10002E6C8@<X0>(int a1@<W0>, int a2@<W2>, uint64_t a3@<X8>)
{
  *(unsigned char *)(v3 + (a1 - 681636099)) = *(unsigned char *)(a3 + (a1 - 681636099));
  return (*(uint64_t (**)(void))(v5
                              + 8
                              * (((2 * (((a1 - 1 == v4) ^ (((a2 - 16) | 2) - 1)) & 1)) & 0xEF | (16 * (((a1 - 1 == v4) ^ (((a2 - 16) | 2) - 1)) & 1))) ^ ((a2 - 16) | 2))))();
}

uint64_t sub_10002E718()
{
  return (*(uint64_t (**)(void))(v1 + 8 * (((v0 < 0x49BEE29D) | (2 * (v0 < 0x49BEE29D))) ^ (v2 + 1404884051))))();
}

uint64_t sub_10002E754(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, int a13, unsigned int a14)
{
  *(unsigned char *)(*v17 + a8 + v14 + 83 * (v15 ^ 0x4C4u) + 121) = -46;
  BOOL v18 = v14 - 1016859366 < a14 + 218870076;
  if (a14 > 0xF2F44EC3 != (v14 - 1016859366) < 0xD0BB13C) {
    BOOL v18 = a14 > 0xF2F44EC3;
  }
  return (*(uint64_t (**)(void))(v16 + 8 * (v15 ^ (390 * !v18))))();
}

void sub_10002E7E0()
{
}

uint64_t sub_10002E7E8(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  return (*(uint64_t (**)(void))(v6
                              + 8
                              * (((v4 ^ 0x29F ^ (v4 + 243) ^ 0x244) * (((a4 - (v5 & 3)) & 0xFFFFFFFC) > a4 + 3)) ^ v4)))();
}

void sub_10002E834()
{
}

uint64_t sub_10002E840(uint64_t a1, uint64_t a2, char a3)
{
  return (*(uint64_t (**)(void))(v6
                              + 8
                              * ((28
                                * ((*(unsigned char *)(v4 + 1 + a2) - *(unsigned char *)(v3 + 1) + 11) != (v5 ^ a3))) ^ (v5 + 1046))))();
}

uint64_t sub_10002E850()
{
  BOOL v5 = v0 > 0x17CE1F19;
  if (v5 == v2 + 531341104 < (int)((v1 - 57) ^ 0xE831E03F)) {
    BOOL v5 = v2 + 531341104 < v4;
  }
  return (*(uint64_t (**)(void))(v3 + 8 * (((16 * v5) | (32 * v5)) ^ v1)))();
}

void sub_10002E8C0(uint64_t a1)
{
  BOOL v3 = *(void *)(a1 + 8) != 0x440C6379540E055DLL
    && (unsigned __int16)(*(_WORD *)a1 - 2705 * ((a1 - 2 * (a1 & 0x65A) + 1626) ^ 0x4F03)) != 5137;
  int v1 = *(_DWORD *)(a1 + 20) + 235795823 * ((a1 - 2 * (a1 & 0x9028065A) - 1876425126) ^ 0x4854F03);
  __asm { BRAA            X8, X17 }
}

uint64_t sub_10002E9A8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(v3
                              + 8
                              * (int)(((((v1 + 914920686) & 0xC9776EF9) - 263) * (*(unsigned __int8 *)(v2 + a1) == 210)) ^ (v1 - 556))))();
}

uint64_t sub_10002E9E8@<X0>(int a1@<W1>, int a2@<W6>, int a3@<W8>)
{
  int v6 = *(_DWORD *)(v5 + v3 * (uint64_t)a1 + 36);
  BOOL v8 = (v6 - 929037235 > (((a3 ^ 0x4FF) + 240) ^ 0x68BCAEB2) || v6 - 929037235 < SLODWORD(STACK[0x298])) && v6 != a2;
  return (*(uint64_t (**)(void))(v4 + 8 * ((15 * v8) | a3)))();
}

uint64_t sub_10002EA4C()
{
  *(_DWORD *)(v3 + 52) += v0 ^ 0x777 ^ (v0 + 34) ^ 0x754;
  LODWORD(STACK[0x2B8]) = *(_DWORD *)(v3 + 360);
  STACK[0x408] = v1 - 2432;
  LODWORD(STACK[0x464]) = v4;
  return (*(uint64_t (**)(void))(v2 + 8 * ((399 * (STACK[0x428] == 0)) ^ v0)))();
}

uint64_t sub_10002EAB0(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)(*(void *)(v5 + 96) + 1428) = 1680994579;
  return (*(uint64_t (**)(void))(v4 + 8 * (((*(_DWORD *)(a2 + 4) == v2) * ((12 * (v3 ^ 0x270)) ^ 0x505)) | v3)))();
}

uint64_t sub_10002EB10()
{
  return (*(uint64_t (**)(uint64_t, unint64_t *))(v2
                                                                + 8
                                                                * (((v1 ^ 0x4BA ^ (v1 - 423440899) & 0x193D2EAD)
                                                                  * (v0 == 0)) ^ v1)))(1225351577, &STACK[0x4C6937770F486570]);
}

uint64_t sub_10002EC1C@<X0>(unsigned int a1@<W3>, uint64_t a2@<X4>, int a3@<W5>, int a4@<W8>, int8x16_t a5@<Q0>, int8x16_t a6@<Q1>, int8x16_t a7@<Q4>, int8x16_t a8@<Q5>, int8x16_t a9@<Q6>, int32x4_t a10@<Q7>)
{
  uint64_t v15 = v10 + 4;
  uint64_t v16 = a4 ^ a1;
  a6.i32[0] = *(_DWORD *)(v12 + 4 * (v15 + (v16 ^ a2)));
  a6.i32[1] = v11->i32[2];
  a6.i32[2] = v11->i32[3];
  int8x16_t v17 = vextq_s8(a5, a6, 0xCuLL);
  int8x16_t v18 = a6;
  v18.i32[3] = v11[1].i32[0];
  int32x4_t v19 = (int32x4_t)veorq_s8((int8x16_t)vshrq_n_u32((uint32x4_t)vorrq_s8(vandq_s8(v18, a7), vandq_s8(v17, a8)), 1uLL), *(int8x16_t *)((char *)v11 - 908));
  v17.i32[0] = *(_DWORD *)(v14 + 4 * (*(_DWORD *)(v12 + 4 * (v15 + (v16 ^ a2))) & 1));
  v17.i32[1] = *(_DWORD *)(v14 + 4 * (v11->i32[2] & 1));
  v17.i32[2] = *(_DWORD *)(v14 + 4 * (v11->i32[3] & 1));
  v17.i32[3] = *(_DWORD *)(v14 + 4 * (v18.i8[12] & 1));
  int8x16_t *v11 = veorq_s8((int8x16_t)vaddq_s32(vsubq_s32(v19, (int32x4_t)vandq_s8((int8x16_t)vaddq_s32(v19, v19), a9)), a10), v17);
  return (*(uint64_t (**)(void))(v13 + 8 * (((v15 == 392) * a3) ^ a4)))();
}

uint64_t sub_10002EC28(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7, int a8)
{
  return (*(uint64_t (**)(void))(v9 + 8 * ((990 * (((a8 ^ (v8 + 349)) & 0x80000000) != a7 - 903)) ^ (a7 + 599))))();
}

void sub_10002EC74()
{
}

void sub_10002ED30()
{
}

uint64_t sub_10002ED3C()
{
  int v5 = 108757529 * ((v4 - 144) ^ 0xE09C622B);
  *(_DWORD *)(v4 - 144) = (v0 + 1065) ^ v5;
  *(_DWORD *)(v4 - 140) = v5 ^ 0x245280BD;
  *(void *)(v4 - 136) = v8;
  (*(void (**)(uint64_t))(v1 + 8 * (v0 + 1235)))(v4 - 144);
  *(_DWORD *)(v4 - 104) = v0 + 235795823 * ((v4 - 1119630572 - 2 * ((v4 - 144) & 0xBD43CBA4)) ^ 0x29EE82FD) - 702;
  *(void *)(v4 - 128) = v9;
  *(void *)(v4 - 120) = v8;
  *(void *)(v4 - 144) = v2;
  *(void *)(v4 - 136) = v9;
  *(void *)(v4 - 112) = v3;
  (*(void (**)(uint64_t))(v1 + 8 * (v0 ^ 0xBB7)))(v4 - 144);
  *(_DWORD *)(v4 - 136) = v0
                        + 616
                        + 3804331 * ((((2 * (v4 - 144)) | 0xC393DF78) - (v4 - 144) + 506859588) ^ 0x6E6CF47A)
                        - 317;
  *(void *)(v4 - 128) = v7;
  *(void *)(v4 - 144) = v9;
  return (*(uint64_t (**)(uint64_t))(v1 + 8 * (v0 + 1202)))(v4 - 144);
}

uint64_t sub_10002EEA4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30)
{
  int v35 = v30 - 357408968;
  HIDWORD(a29) = *(_DWORD *)(a26 + 24 * (v35 + 486) + 16);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, void, void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v34 + 8 * ((1125 * (((*(_DWORD *)(a26 + 24 * (v35 + (v31 ^ 0x704u) - 1492)) + v32) & 0xFFFFFFFFFFFFFFDLL) == 0)) ^ v31)))(a1, a2, a3, a4, *(unsigned int *)(a26 + 24 * (v35 + (v31 ^ 0x704u) - 1492) + 4), *(void *)(v33 + 24 * (v35 + (v31 ^ 0x704u) - 1492) + 16), a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
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

uint64_t sub_10002EF58(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return sub_10002EF7C(a1, a2, a3, a4, a5, a6, a7, v7);
}

uint64_t sub_10002EF7C(uint64_t a1, int a2, uint64_t a3, uint64_t a4, int a5)
{
  BOOL v9 = *(_DWORD *)(v8 + (v6 + a5) * (uint64_t)a2) == ((v5 + 1440871623) & 0xAA1E07DF ^ 0x186A4AE0);
  return (*(uint64_t (**)(void))(v7
                              + 8 * (((v5 ^ v9) & 1 | (8 * ((v5 ^ v9) & 1))) ^ v5)))();
}

uint64_t sub_10002EFD4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,int a25,int a26,uint64_t a27,int a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,int a58)
{
  return (*(uint64_t (**)(void))(v58
                              + 8
                              * (a58 ^ (44
                                      * (((2 * (a28 - ((2 * a26) & 0xB3C2D0F0) + 2012354556)) & 0x83FFEDFE ^ 0x83C2C0F0)
                                       + ((a28 - ((2 * a26) & 0xB3C2D0F0) + 2012354556) ^ 0x981E9E87)
                                       - 1688442 != 1105605509)))))();
}

void sub_10002F0B8()
{
}

uint64_t sub_10002F0C4@<X0>(void *a1@<X0>, int a2@<W2>, int a3@<W3>, int a4@<W8>)
{
  return sub_10002CE08(a1, 0, a3 - 707, *(_DWORD *)(*v5 + 4 * (a2 - 1548127713)), v4, a4);
}

void sub_10002F0F4()
{
}

uint64_t sub_10002F160(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)(a1 + 16) = (**(unsigned __int8 **)(a2 + 8) ^ 0xFBF27F28)
                       + 2146282456
                       + ((2 * **(unsigned __int8 **)(a2 + 8)) & 0x50);
  return 0;
}

uint64_t sub_10002F1B0()
{
  return (*(uint64_t (**)(void))(v1
                              + 8
                              * ((15
                                * (((LODWORD(STACK[0x3A4]) - 1228396329) ^ 0xBCFBFF5DFEC6FD6DLL)
                                 + 0x430400A2DC9AF602
                                 + ((((v0 + 317080091) & 0xED19B9DF) + 0x1FD8DFA4BLL) & (2
                                                                                       * (LODWORD(STACK[0x3A4]) - 1228396329))) != 3680629615)) ^ v0)))();
}

void sub_10002F264()
{
}

uint64_t sub_10002F408(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,int a21)
{
  return (*(uint64_t (**)(void))(v22 + 8 * (((a21 == 363543283) * ((v21 - 1413781041) & 0x5EB ^ 0x76B)) ^ v21)))();
}

void sub_10002F458()
{
}

uint64_t sub_10002F508@<X0>(int a1@<W7>, uint64_t a2@<X8>)
{
  return (*(uint64_t (**)(void))(v4
                              + 8
                              * (((((v2 - 1757) | a1) ^ v3) * (*(_DWORD *)(a2 + 1424) == 1078009232)) ^ (v2 - 1602))))();
}

uint64_t sub_10002F540()
{
  return (*(uint64_t (**)(void))(v3
                              + 8
                              * ((14 * (v0 + v1 + ((v2 + 1789882323) & 0x95508FDF) - 1590477060 > 7)) ^ (v2 - 195))))();
}

uint64_t sub_10002F598(double a1)
{
  *(double *)(v2 + v4) = a1;
  return (*(uint64_t (**)(void))(v6 + 8 * (((v3 != v4) * v5) ^ v1)))();
}

uint64_t sub_10002F5BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  return (*(uint64_t (**)(void))(v7
                              + 8
                              * ((100 * (v6 + a6 + (((v8 ^ 0x7FE) - 1707246434) & 0x65C27BEFu) - 7 >= v6 + a6)) ^ v8 ^ 0x7FE)))();
}

uint64_t sub_10002F608()
{
  BOOL v2 = (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8 * (v1 + 1127)))(200, 1616997413) != 0;
  return (*(uint64_t (**)(void))(v0 + 8 * ((v2 * (((2 * v1) ^ 0x10A) - 1729)) ^ v1)))();
}

uint64_t sub_10002F654(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,int a38,int a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47)
{
  int v52 = STACK[0x340];
  int v53 = *(_DWORD *)(v50 + 52) - 42637110;
  int v54 = 108757529 * ((v51 - 200) ^ 0xE09C622B);
  *(void *)(v51 - 200) = v47;
  *(_DWORD *)(v51 - 192) = ((v49 + 1030) ^ 0x3C2 ^ v52 ^ 0x7FDFB8E1) - v54 + ((2 * v52) & 0xFFBF7D3C) - 671088780;
  *(_DWORD *)(v51 - 188) = v53 ^ v54;
  *(void *)(v51 - 168) = &STACK[0x1850];
  *(void *)(v51 - 160) = a47;
  *(_DWORD *)(v51 - 180) = ((a39 ^ 0xD4880E0C) + 2013003760 + ((2 * a39) & 0xB12DFBAC ^ 0x102DE3A4)) ^ v54;
  *(_DWORD *)(v51 - 176) = (v49 - 369) ^ v54;
  uint64_t v55 = (*(uint64_t (**)(uint64_t))(v48 + 8 * (v49 + 1499)))(v51 - 200);
  int v56 = *(_DWORD *)(v51 - 184);
  LODWORD(STACK[0x464]) = v56;
  return (*(uint64_t (**)(uint64_t))(v48 + 8 * ((1860 * (v56 == -1158872075)) ^ v49)))(v55);
}

uint64_t sub_10002F778()
{
  return sub_10002F7A0();
}

uint64_t sub_10002F7A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,int a27)
{
  return sub_10001D8AC((2 * (v27 - 1102500656)) & 0x7FBDEEF4, 2134620320, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27);
}

uint64_t sub_10002F87C()
{
  return (*(uint64_t (**)(void))(v3
                              + 8 * (int)(((((5 * (v2 ^ 0x166) + 570447789) & 0xDDFFACBE) - 1173) * (v0 == v1)) ^ v2)))();
}

uint64_t sub_10002F8C8()
{
  int v2 = v0 + 1704;
  unint64_t v3 = STACK[0x508];
  unint64_t v4 = STACK[0x250];
  unint64_t v5 = STACK[0x350];
  STACK[0x298] = (unint64_t)&STACK[0x5A0] + STACK[0x250] - 0x14D7FC5203D96C9;
  STACK[0x280] = (unint64_t)&STACK[0x5A0] + v4 - 0x14D7FC5203D96C7;
  STACK[0x290] = 0;
  unsigned int v6 = (LODWORD(STACK[0x2AC]) + 153626762) & 0xF6D7D59D;
  LODWORD(STACK[0x278]) = LODWORD(STACK[0x2AC]) ^ 0xEAD;
  LODWORD(STACK[0x268]) = v6;
  LODWORD(STACK[0x270]) = v6 ^ 0x6B2;
  int v7 = v0 + 492;
  if (v3) {
    BOOL v8 = v5 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  int v9 = v8;
  return (*(uint64_t (**)(uint64_t))(v1 + 8 * ((v9 * (v2 - 1677)) ^ v7)))(1794690833);
}

uint64_t sub_10002FA00(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  return (*(uint64_t (**)(void))(v5 + 8 * ((162 * ((v4 & 0x18) == ((a4 - 168) ^ 0x34) - 163)) ^ a4)))();
}

uint64_t sub_10002FA38(uint64_t result)
{
  unint64_t v1 = 1759421093
     * ((-2 - ((~result | 0xA799CC8FED74AA68) + (result | 0x58663370128B5597))) ^ 0x89270DDF5E091A3CLL);
  unint64_t v2 = *(void *)(result + 16) ^ v1;
  unint64_t v3 = *(void *)(result + 24) + v1;
  int v4 = *(_DWORD *)(result + 4) + v1;
  int v5 = *(_DWORD *)(result + 32) ^ v1;
  int v6 = *(_DWORD *)(result + 8) - v1;
  int v7 = *(_DWORD *)(result + 12) ^ v1;
  BOOL v8 = v3 >= v2;
  BOOL v9 = v3 != v2;
  int v10 = v8;
  if (v5) {
    BOOL v9 = v10;
  }
  if (!v9) {
    int v7 = v6;
  }
  *(_DWORD *)(result + 36) = v7 ^ v4;
  return result;
}

void sub_10002FADC(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 8) + 1374699841 * (((a1 | 0x3B067EF8) - (a1 & 0x3B067EF8)) ^ 0x56F266F1);
  uint64_t v2 = (uint64_t)*(&off_10005CE90 + v1 - 525);
  uint64_t v3 = *(void *)a1;
  (*(void (**)(char *, uint64_t (*)()))(v2 + 8 * (v1 + 1472)))((char *)*(&off_10005CE90 + (v1 ^ 0x20C)) - 4, sub_10002D038);
  __asm { BRAA            X9, X17 }
}

void sub_10002FBA4()
{
}

uint64_t sub_10002FBBC(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 24);
  return 0;
}

void sub_10002FBD4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  int v6 = LOBYTE(STACK[0x30C]) ^ 0xCF;
  if (v6 == 1)
  {
    unsigned int v12 = STACK[0x2F0];
    unsigned int v13 = STACK[0x2EC];
    LOBYTE(STACK[0x2E4]) = 8 * LOBYTE(STACK[0x2F0]) - ((LODWORD(STACK[0x2F0]) << ((a6 ^ (a6 - 67)) + 53)) & 0xA0) + 82;
    LOBYTE(STACK[0x2E5]) = ((v12 >> 5) ^ 0xEF) + (~(2 * ((v12 >> 5) ^ 0xEF)) | 0x5B) + 83;
    LOBYTE(STACK[0x2E6]) = ((v12 >> 13) ^ 0x45) - ((2 * ((v12 >> 13) ^ 0x45)) & 0xA4) + 82;
    LOBYTE(STACK[0x2E7]) = ((v12 >> 21) ^ 0xD) - ((v12 >> 20) & 0xA4) + 82;
    HIDWORD(v14) = ~v13;
    LODWORD(v14) = v12 ^ 0x20000000;
    LOBYTE(STACK[0x2E8]) = (v14 >> 29) - ((2 * (v14 >> 29)) & 0xA4) + 82;
    LOBYTE(STACK[0x2E9]) = ((v13 >> 5) ^ 0x4F) - ((2 * ((v13 >> 5) ^ 0x4F)) & 0xA4) + 82;
    LOBYTE(STACK[0x2EA]) = ((v13 >> 13) ^ 0x13) - ((2 * ((v13 >> 13) ^ 0x13)) & 0xA4) + 82;
    unsigned int v15 = v13 >> 21;
    unsigned int v16 = (v13 >> 21) ^ 0xFFFFFFE9;
    char v17 = v16 & 0x56 ^ v15 & 4;
    char v10 = v16 + 82;
    char v11 = 2 * v17;
  }
  else
  {
    if (v6 != 2) {
      goto LABEL_6;
    }
    unsigned int v7 = STACK[0x2EC];
    unsigned int v8 = STACK[0x2F0];
    LOBYTE(STACK[0x2E4]) = ((LODWORD(STACK[0x2EC]) >> 21) ^ 0xE9)
                         - ((2 * ((LODWORD(STACK[0x2EC]) >> 21) ^ 0xE9)) & 0xA4)
                         + 82;
    LOBYTE(STACK[0x2E5]) = ((v7 >> 13) ^ 0x13) - ((2 * ((v7 >> 13) ^ 0x13)) & 0xA4) + 82;
    LOBYTE(STACK[0x2E6]) = ((v7 >> 5) ^ 0x4F) - ((2 * ((v7 >> 5) ^ 0x4F)) & 0xA4) + 82;
    HIDWORD(v9) = ~v7;
    LODWORD(v9) = v8 ^ 0x20000000;
    LOBYTE(STACK[0x2E7]) = (v9 >> 29) - ((2 * (v9 >> 29)) & 0xA4) + 82;
    LOBYTE(STACK[0x2E8]) = ((v8 >> 21) ^ 0xD) - ((v8 >> 20) & 0xA4) + 82;
    LOBYTE(STACK[0x2E9]) = ((v8 >> 13) ^ 0x45) - ((2 * ((v8 >> 13) ^ 0x45)) & 0xA4) + 82;
    LOBYTE(STACK[0x2EA]) = ((v8 >> 5) ^ 0xEF) - ((2 * ((v8 >> 5) ^ 0xEF)) & 0xA4) + 82;
    char v10 = 8 * v8 + 82;
    char v11 = (16 * v8) & 0xA0;
  }
  LOBYTE(STACK[0x2EB]) = v10 - v11;
LABEL_6:
  JUMPOUT(0x100018D68);
}

void sub_10002FDE4()
{
  uint64_t v0 = __chkstk_darwin();
  int v1 = *(_DWORD *)(v0 + 16) + 1225351577 * ((2 * (v0 & 0x54E14326) - v0 - 1424048935) ^ 0xD5E126EB);
  __asm { BRAA            X13, X17 }
}

uint64_t sub_10002FF5C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned int a5, int a6)
{
  uint64_t v10 = v8 + ((v6 - 1067) | a5) - 825;
  BOOL v12 = v7 != 69 && v10 != a2 + 200;
  return (*(uint64_t (**)(void))(v9 + 8 * ((v12 * ((v6 - 759) ^ a6)) ^ v6)))();
}

void sub_10002FF98()
{
}

void sub_10002FFB4()
{
}

uint64_t sub_10002FFC0()
{
  return sub_10002FFC8();
}

uint64_t sub_10002FFC8(double a1, int8x16_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40)
{
  unint64_t v76 = *(uint64_t (**)(void))(v45 + 8 * v42);
  uint64_t v48 = LODWORD(STACK[0x2F8]);
  unint64_t v75 = STACK[0x2F4];
  LODWORD(a27) = STACK[0x2FC];
  LODWORD(a28) = STACK[0x300];
  LODWORD(a23) = LOBYTE(STACK[0x30C]) ^ 0xFFFFFFCF;
  int v49 = LOBYTE(STACK[0x30C]) ^ 0xCF;
  if (v49 == 2)
  {
    int8x16x4_t v78 = vld4q_s8(v40);
    uint8x16_t v61 = (uint8x16_t)veorq_s8(v78.val[1], a2);
    _Q22 = vmovl_u8(*(uint8x8_t *)v61.i8);
    _Q21 = vmovl_high_u8(v61);
    __asm
    {
      SHLL2           V23.4S, V21.8H, #0x10
      SHLL2           V24.4S, V22.8H, #0x10
    }
    int v66 = (_DWORD *)(v43 + 4 * (v47 + 16 + v46));
    int v67 = *(v66 - 8) ^ *(v66 - 3);
    int v68 = v67 + v44 - ((2 * v67) & 0x75DA07EA);
    int v69 = *(v66 - 16) ^ *(_DWORD *)(v43 + 4 * (v47 + 16 + v46 + v41) - 2260);
    uint64_t v70 = v69 ^ v68 ^ 0x3AED03F5u;
    HIDWORD(v72) = v69 ^ v68 ^ 0x3AED03F5;
    LODWORD(v72) = v69 ^ ~v68;
    int v71 = v72 >> 31;
    uint64_t v73 = (2 * v71) & 0x75DA07EA;
    _DWORD *v66 = v71 + v44 - v73;
    int v74 = *(uint64_t (**)(void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, unint64_t, uint64_t, uint64_t, uint64_t (*)(void), uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v45 + 8 * (int)((45 * (v47 + 17 == v47 + 80)) ^ a30));
    return v74(v74, v48, a5, v73, v70, 1932017504, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19, a20, a21,
             a22,
             a23,
             a24,
             a25,
             v75,
             a27,
             a28,
             v76,
             a30,
             a31,
             a32,
             a33,
             a34,
             a35,
             a36,
             a37,
             a38,
             a39,
             a40);
  }
  else if (v49 == 1)
  {
    int8x16x4_t v77 = vld4q_s8(v40);
    uint64_t v50 = (a7 + a8 + 578);
    uint8x16_t v51 = (uint8x16_t)veorq_s8(v77.val[2], a2);
    _Q22 = vmovl_high_u8(v51);
    _Q21 = vmovl_u8(*(uint8x8_t *)v51.i8);
    __asm
    {
      SHLL2           V21.4S, V21.8H, #0x10
      SHLL2           V22.4S, V22.8H, #0x10
    }
    unint64_t v58 = ((a7 + a8 + 2061907248) & 0x8519C9F7 ^ (unint64_t)(v46 + 151)) + 1932017504;
    uint64_t v59 = (uint64_t)*(&off_10005CE90 + (int)v50 - 1126);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void, void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, unint64_t, uint64_t, uint64_t, uint64_t (*)(void), uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v45 + 8 * (int)((126 * (v47 == 1932017489)) ^ v50)))(v59, v48, 2368187550, v50, v47 + 16, 1932017505, -(*(unsigned char *)(v59 + v58) - 57), *(_DWORD *)(v43 + 4 * (*((unsigned char *)*(&off_10005CE90 + (int)v50 - 1018) + v58 - 4) - 99)) ^ v44, a11, a12, a13, a14, a15, a16, a17, a18, a19, a20, a21,
             a22,
             a23,
             a24,
             a25,
             v75,
             a27,
             a28,
             v76,
             a30,
             a31,
             a32,
             a33,
             a34,
             a35,
             a36,
             a37,
             a38,
             a39,
             a40);
  }
  else
  {
    return sub_10000C398(STACK[0x2F4], a11, a12, a13, a14, a15, a16, a17, a18, a19, a20, a21, a22, a23, a24, a25, v75, SHIDWORD(v75), a27,
             SHIDWORD(a27),
             a28,
             v76);
  }
}

uint64_t sub_1000303DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,int a30,unsigned int a31)
{
  if (a31 < 0x50456BA7 != a30 + v33 < (v32 ^ 0x50456BE1u)) {
    BOOL v34 = a30 + v33 < (v32 ^ 0x50456BE1u);
  }
  else {
    BOOL v34 = a30 + v33 > a31;
  }
  return (*(uint64_t (**)(void))(v31 + 8 * ((29 * v34) ^ (v32 + 1890))))();
}

uint64_t sub_100030458@<X0>(uint64_t a1@<X8>)
{
  return (*(uint64_t (**)(void))(a1 + 8 * ((v3 == ((((v4 - 654) | v2) + 1256) ^ v1)) ^ v4)))();
}

uint64_t sub_100030480@<X0>(int a1@<W0>, int a2@<W1>, int a3@<W2>, uint64_t a4@<X8>)
{
  int v10 = v7 + v6;
  int v11 = *(_DWORD *)(a4 + 4 * (v7 + v6 - 14));
  int v12 = *(_DWORD *)(a4 + 4 * (v7 + v6 - 8)) ^ *(_DWORD *)(a4 + 4 * (v7 + v6 - 3));
  int v13 = v9 + ((v4 - 724) | 0x10) + v12 - (a1 & (2 * v12)) - 1328;
  int v14 = *(_DWORD *)(a4 + 4 * (v10 - 16)) ^ v11;
  HIDWORD(v15) = v14 ^ a2 ^ v13;
  LODWORD(v15) = v14 ^ ~v13;
  *(_DWORD *)(a4 + 4 * (v5 + v7)) = (v15 >> 31) + v9 - (a1 & (2 * (v15 >> 31)));
  return (*(uint64_t (**)(void))(v8 + 8 * ((((v5 + 1 + v7) < 0x50) * a3) ^ v4)))();
}

uint64_t sub_100030514(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8)
{
  return (*(uint64_t (**)(void))(v8
                              + 8 * ((13 * (((v9 == a8) ^ (((v10 - 48) | 0x18) - 14)) & 1)) ^ v10)))();
}

uint64_t sub_10003054C(uint64_t a1, int a2)
{
  return (*(uint64_t (**)(void))(v2 + 8 * ((125 * (a1 + 1 != v3 + 24)) ^ a2)))();
}

void sub_100030610()
{
}

uint64_t sub_100030620(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned int a5)
{
  BOOL v8 = v5 + 1105203810 < (int)(a5 + 1476568100);
  if (a5 > 0x27FD5BDB != v5 + 1105203810 < (int)((v6 + 1138) ^ 0xD802A3E3)) {
    BOOL v8 = a5 > 0x27FD5BDB;
  }
  return (*(uint64_t (**)(void))(v7 + 8 * ((v8 | (2 * v8)) ^ v6)))();
}

uint64_t sub_1000306A8()
{
  return (*(uint64_t (**)(void))(v0 + 8 * ((v3 - 1404883559) ^ (32 * (v2 <= v1 + 623)))))();
}

uint64_t sub_1000306DC@<X0>(int a1@<W4>, uint64_t a2@<X8>)
{
  uint64_t v7 = (v4 + a1);
  long long v8 = *(_OWORD *)(v2 + v7 - 15);
  long long v9 = *(_OWORD *)(v2 + v7 - 31);
  uint64_t v10 = a2 + v7;
  *(_OWORD *)(v10 - 15) = v8;
  *(_OWORD *)(v10 - 31) = v9;
  return (*(uint64_t (**)(void))(v6 + 8 * ((741 * (((v5 - 261) ^ 0x5CC) == (v3 & 0xFFFFFFE0))) ^ (v5 - 254))))();
}

uint64_t sub_100030738@<X0>(int a1@<W8>)
{
  *(_DWORD *)(v2 + 4 * (v4 - 5584596)) = 5584596
                                                       - v4
                                                       + ((1566083941
                                                         * (*(_DWORD *)(v2 + 4 * (v4 - 5584597)) ^ (*(_DWORD *)(v2 + 4 * (v4 - 5584597)) >> 30))) ^ *(_DWORD *)(v2 + 4 * (v4 - 5584596)));
  *(_DWORD *)(v6 - 124) = (a1 - 1909090868) ^ v5;
  *(_DWORD *)(v6 - 112) = a1 - 777625871 + v5;
  *(_DWORD *)(v6 - 108) = ((a1 - 777625871) ^ 0x2C) - v5;
  *(_DWORD *)(v6 - 144) = v5 ^ 1;
  *(_DWORD *)(v6 - 140) = ((a1 - 777625871) & 0xF567BA06) - v5;
  *(void *)(v6 - 120) = v5 + 3225473880;
  *(void *)(v6 - 136) = (v4 - 1075078011) + v5;
  uint64_t v7 = (*(uint64_t (**)(uint64_t))(v3 + 8 * (v1 + a1 + 1525)))(v6 - 144);
  return (*(uint64_t (**)(uint64_t))(v3 + 8 * *(int *)(v6 - 128)))(v7);
}

uint64_t sub_100030828()
{
  return sub_100012608();
}

void sub_100030858()
{
  int v6 = 1225351577 * (((v5 - 144) & 0xB6FEF26 | ~((v5 - 144) | 0xB6FEF26)) ^ 0x8A6F8AEB);
  *(void *)(v5 - 136) = v3;
  *(_DWORD *)(v5 - 144) = (v1 - 301871255 + v0 + 637) ^ v6;
  *(_DWORD *)(v5 - 124) = v0 - v6 + 752;
  *(void *)(v5 - 120) = v4;
  (*(void (**)(uint64_t))(v2 + 8 * (v0 + 1305)))(v5 - 144);
  JUMPOUT(0x100021A28);
}

uint64_t sub_1000308DC@<X0>(int a1@<W8>)
{
  BOOL v2 = ((a1 - 1228396329) ^ 0xF9AF5FCF5AF9EBFFLL)
     + ((2 * (a1 - 1228396329)) & 0xB5F3D7FE)
     + 0x650A030C2435744 != 490554179;
  return (*(uint64_t (**)(void))(v1 + 8 * (((2 * v2) | (4 * v2)) ^ 0x82u)))();
}

void sub_100030980()
{
}

uint64_t sub_1000309B4(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5
                                                              + 8
                                                              * ((((v2 - 1934261661) & 0x734A7B57 ^ (v2 - 1663611601) & 0x6328B1FF ^ 0x7E5)
                                                                * (v3 == v4)) ^ v2)))(a1, a2, 1492525174);
}

uint64_t sub_100030A18(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, int a6)
{
  return (*(uint64_t (**)(void))(v9 + 8 * (((a5 + v8 + (v8 ^ (a6 + 471)) - 1106) * (v6 == v7)) | v8)))();
}

uint64_t sub_100030A48()
{
  BOOL v2 = (((v0 - 1202) | 0x103) ^ 0x35277501) + LODWORD(STACK[0x260]) != -1722194663;
  return (*(uint64_t (**)(void))(v1 + 8 * ((2 * v2) | (16 * v2) | (v0 + 23))))();
}

uint64_t sub_100030AB8@<X0>(unsigned int a1@<W5>, int a2@<W8>)
{
  return (*(uint64_t (**)(void))(v2 + 8 * (((a2 - 937) | 0x440) ^ (286 * (a1 > ((a2 - 937) | 0x440u) - 1255)))))();
}

uint64_t sub_100030BB8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  STACK[0x578] = v10;
  STACK[0x580] = v9;
  unint64_t v12 = STACK[0x408];
  int v13 = (char *)&a9 + STACK[0x408] - 0x14D7FC5203D90B9;
  STACK[0x588] = (unint64_t)v13;
  STACK[0x408] = v12 + 320;
  LODWORD(STACK[0x484]) = *(_DWORD *)(v10 - 0x1FA9E8BAFD93F970);
  LODWORD(STACK[0x404]) = *(_DWORD *)(v10 - 0x1FA9E8BAFD93F96CLL);
  LODWORD(STACK[0x3D8]) = *(_DWORD *)(v10 - 0x1FA9E8BAFD93F968);
  LODWORD(STACK[0x36C]) = *(_DWORD *)(v10 - 0x1FA9E8BAFD93F964);
  int v14 = *(unsigned __int8 *)(v10 - 0x1FA9E8BAFD93F958) ^ 0xCF;
  if (v14 == 2)
  {
    LODWORD(STACK[0x3C8]) = *(_DWORD *)(v10 - 0x1FA9E8BAFD93F960);
    return sub_100030D10();
  }
  else if (v14 == 1)
  {
    int v16 = LODWORD(STACK[0x2AC]) - 1664;
    LODWORD(STACK[0x324]) = 783333544;
    BOOL v18 = v9 < STACK[0x280] + v12 && (unint64_t)v13 < v9 + 64;
    return (*(uint64_t (**)(void))(v11 + 8 * ((LODWORD(STACK[0x270]) * v18) ^ v16)))();
  }
  else
  {
    return sub_100030DBC();
  }
}

uint64_t sub_100030D10()
{
  LODWORD(STACK[0x324]) = v1;
  return (*(uint64_t (**)(uint64_t))(v3
                                            + 8
                                            * (int)(((v1 + v2 >= ((v0 + 287734729) & 0xEED9802B ^ 0x4B))
                                                   * ((v0 + 1245420510) & 0xB5C467FF ^ 0x7FE)) ^ v0)))(1977223146);
}

uint64_t sub_100030D88(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  LODWORD(STACK[0x484]) = v6;
  LODWORD(STACK[0x3D8]) = v7;
  LODWORD(STACK[0x404]) = v8;
  LODWORD(STACK[0x36C]) = v9;
  LODWORD(STACK[0x324]) = 783333608;
  return sub_100030DBC(a1, a2, -1660710441, a4, a5, a6, 13, 3862993706);
}

uint64_t sub_100030DBC()
{
  int v8 = (*(_DWORD *)(v5 - 0x1FA9E8BAFD93F970) ^ v7) + (v1 ^ v7);
  *(_DWORD *)(v5 - 0x1FA9E8BAFD93F970) = v8 + v7 - (v6 & (2 * v8));
  int v9 = (*(_DWORD *)(v5 - 0x1FA9E8BAFD93F96CLL) ^ v7) + (v3 ^ v7);
  *(_DWORD *)(v5 - 0x1FA9E8BAFD93F96CLL) = v9 + v7 - (v6 & (2 * v9));
  int v10 = (*(_DWORD *)(v5 - 0x1FA9E8BAFD93F968) ^ v7) + (v2 ^ v7);
  *(_DWORD *)(v5 - 0x1FA9E8BAFD93F968) = v10 + v7 - (v6 & (2 * v10));
  int v11 = (*(_DWORD *)(v5 - 0x1FA9E8BAFD93F964) ^ v7) + (v4 ^ v7);
  *(_DWORD *)(v5 - 0x1FA9E8BAFD93F964) = v11 + v7 - (v6 & (2 * v11));
  STACK[0x408] = v0 - 320;
  return ((uint64_t (*)(void))STACK[0x310])();
}

uint64_t sub_100030E9C()
{
  return (*(uint64_t (**)(void))(v2 + 8 * ((207 * (v0 == (v1 ^ 0x21Au) - 392 + 0x2CD918D830143261)) ^ v1)))();
}

void sub_100030EE0(uint64_t a1)
{
  uint64_t v2 = (uint64_t)*(&off_10005CE90
                + ((85 * ((qword_100060158 - dword_100060120) ^ 0xD)) ^ byte_100049E60[byte_100056860[(85 * ((qword_100060158 - dword_100060120) ^ 0xD))] ^ 0xBF])
                + 15);
  uint64_t v3 = *(void *)(v2 - 4);
  int v4 = (unint64_t *)*(&off_10005CE90
                           + (byte_10004A064[(byte_100056B68[(85 * ((qword_100060158 + v3) ^ 0xD))
                                                                                          - 8] ^ 0x1D)
                                                                          - 4] ^ (85 * ((qword_100060158 + v3) ^ 0xD)))
                           + 2);
  unint64_t v5 = 839241301 * ((unint64_t)&v7[v3 + *v4] ^ 0x78A901D92725650DLL);
  *(void *)(v2 - 4) = v5;
  unint64_t *v4 = v5;
  LODWORD(v4) = *(_DWORD *)(v2 - 4);
  uint64_t v6 = (uint64_t)*(&off_10005CE90
                + ((85 * ((qword_100060158 + dword_100060120) ^ 0xD)) ^ byte_100049E60[byte_100056860[(85 * ((qword_100060158 + dword_100060120) ^ 0xD))] ^ 0xD1])
                + 32);
  (*(void (**)(char *, uint64_t (*)()))(v6
                                                + 8
                                                * ((byte_100056C68[(byte_100051ADC[(85 * ((v5 + (_BYTE)v4) ^ 0xD)) - 12] ^ 0xBB)
                                                                                                - 8] ^ (85 * ((v5 + (_BYTE)v4) ^ 0xD)))
                                                 + 2095)))((char *)*(&off_10005CE90+ (byte_1000519D8[(byte_10004D73C[(85* ((v5 - (_BYTE)v4) ^ 0xD))- 12] ^ 0x10)- 8] ^ (85 * ((v5 - (_BYTE)v4) ^ 0xD)))+ 22)- 4, sub_10002D038);
  __asm { BRAA            X9, X17 }
}

void sub_1000310BC(uint64_t a1)
{
  int v1 = 460628867 * ((a1 + 617932952 - 2 * (a1 & 0x24D4E898)) ^ 0x68426AE5);
  __asm { BRAA            X8, X17 }
}

uint64_t sub_100031154@<X0>(int a1@<W4>, int a2@<W5>, uint64_t a3@<X8>)
{
  uint64_t v8 = (a1 - 555991476);
  *(unsigned char *)(a3 + v8) ^= *(unsigned char *)(v6 + (v8 & 0xF)) ^ *(unsigned char *)((v8 & 0xF) + v4 + 2) ^ *(unsigned char *)((v8 & 0xF) + v5 + 4) ^ (119 * (v8 & 0xF));
  return (*(uint64_t (**)(void))(v7 + 8 * ((30 * (a1 - 1 == v3)) ^ (a2 - 1884))))();
}

uint64_t sub_1000311C0(uint64_t a1, int a2)
{
  return (*(uint64_t (**)(void))(v3 + 8 * ((((a2 - 2988473) & 0x2D9F69 ^ (a2 + 1559)) * ((v2 & 0x18) == 0)) ^ a2)))();
}

uint64_t sub_100031204@<X0>(int a1@<W3>, int a2@<W8>)
{
  int v5 = 235795823 * ((v4 - 2123568225 - 2 * ((v4 - 120) & 0x816CEC17)) ^ 0x15C1A54E);
  *(_DWORD *)(v4 - 116) = v5
                        + 1575393849 * a2
                        + a1
                        - 35
                        - 2 * ((1575393849 * a2 + 451922360) & 0x31A3CA4A ^ (1575393849 * a2) & 2)
                        + 1284738691;
  *(_DWORD *)(v4 - 112) = a1 - v5 + 1172343995;
  *(void *)(v4 - 104) = v4 + 0x1FA9E8BAFD93F8DCLL;
  uint64_t v7 = (*(uint64_t (**)(uint64_t))(v2 + 8 * (a1 + 668)))(v4 - 120);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2
                                                     + 8
                                                     * ((575
                                                       * (*v3
                                                        - 1153273398
                                                        + ((2 * *(_DWORD *)(v4 - 152)) & 0x5C ^ 0x40)
                                                        + (*(_DWORD *)(v4 - 152) & (a1 - 1377) ^ 0xF6C35BCE) < 0xFFFFFFC0)) ^ a1)))(v7, 3240914752);
}

uint64_t sub_100031390(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  return (*(uint64_t (**)(void))(v7 + 8 * ((125 * ((a6 + 1 + v6) > 0x2F)) ^ a1)))();
}

uint64_t sub_100031480@<X0>(uint64_t a1@<X8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45)
{
  unint64_t v49 = STACK[0x4E8];
  unsigned int v50 = (LODWORD(STACK[0x4C4]) ^ 0x6767FFE7) - 537265186 + ((2 * LODWORD(STACK[0x4C4])) & 0xCECFFFCE);
  int v51 = 1374699841 * ((v48 - 200) ^ 0x6DF41809);
  *(_DWORD *)(v48 - 200) = v47 - v51 - 2024873522;
  *(void *)(v48 - 192) = a44;
  *(void *)(v48 - 184) = a45;
  *(_DWORD *)(v48 - 160) = v50 ^ v51;
  *(_DWORD *)(v48 - 156) = v51 + ((v47 + 1224) ^ 0x1849BDC0) * v45 + 1049188301;
  *(void *)(v48 - 176) = v49;
  *(void *)(v48 - 168) = a1;
  uint64_t v52 = (*(uint64_t (**)(uint64_t))(v46 + 8 * (v47 ^ 0x9F1)))(v48 - 200);
  int v53 = *(_DWORD *)(v48 - 152);
  LODWORD(STACK[0x464]) = v53;
  return (*(uint64_t (**)(uint64_t))(v46 + 8 * ((1438 * (v53 == -1158872075)) ^ v47)))(v52);
}

uint64_t sub_100031568(int a1, int a2)
{
  int v9 = (unsigned int *)(v7 + 4 * v4);
  uint64_t v10 = v4 + 1;
  int v11 = *(_DWORD *)(v7 + 4 * v10);
  unsigned int v12 = v9[397] ^ ((v11 & 0x7FFFFFFE | v2 & 0x80000000) >> 1);
  *int v9 = (v12 + v5 - ((((v3 + 205) | 2) + a1) & (2 * v12))) ^ *(_DWORD *)(v8 + 4 * (v11 & 1));
  return (*(uint64_t (**)(void))(v6 + 8 * (((v10 != 227) * a2) ^ v3)))();
}

void sub_1000315D0()
{
  STACK[0x518] = *(void *)(v0 + 8 * (LODWORD(STACK[0x2AC]) - 1715));
  JUMPOUT(0x1000039F8);
}

void sub_1000315F4()
{
}

uint64_t sub_1000316C0(uint64_t a1, uint64_t a2, int a3, uint64_t a4, int a5)
{
  return (*(uint64_t (**)(void))(v6
                              + 8
                              * (((v5 == v7 + (a3 ^ (a3 - 3)) + 385 - 390) * ((277 * (a3 ^ (a3 - 3))) ^ 0x158)) | (a5 + a3 + 516))))();
}

uint64_t sub_100031710(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8)
{
  return (*(uint64_t (**)(void))(v10
                              + 8
                              * ((((((v8 - 628) ^ 0xFFFFFD9C) & (v9 - 1228396326)) - a8 != -1228396329)
                                * ((v8 - 628) ^ 0x25D)) ^ v8)))();
}

uint64_t sub_100031758()
{
  return (*(uint64_t (**)(uint64_t))(v3 + 8 * (((((v2 - 1273) | 9) ^ 0x77) * (v0 == v1)) ^ v2)))(4115370206);
}

void sub_10003179C()
{
}

void sub_1000317AC(uint64_t a1, uint64_t a2)
{
  __asm { BRAA            X11, X17 }
}

uint64_t sub_1000317F8()
{
  return sub_100031824();
}

uint64_t sub_100031824@<X0>(int a1@<W0>, int a2@<W7>, uint64_t a3@<X8>)
{
  int v12 = (*(unsigned __int8 *)(v4 + a3) ^ v8) - (*(unsigned char *)(v3 + a3) - 78);
  return (*(uint64_t (**)(void))(v11
                              + 8
                              * ((((v9 & (2 * v12)) + ((((v5 + a2 + v7) | a1) + v6) ^ (v5 + a2) & (v7 + 984) ^ v12) == v6 + 1645)
                                * v10) ^ v5)))();
}

void sub_100031884()
{
}

uint64_t sub_1000318AC@<X0>(uint64_t a1@<X1>, int a2@<W3>, uint64_t a3@<X8>, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, int a19, char a20)
{
  *(&a20 + a3 + (a2 + v20 - 746 - 526) - 1764451486) = 82;
  return (*(uint64_t (**)(void))(v21 + 8 * ((1114 * ((unint64_t)(a3 + 1 + a1) < 0x38)) ^ (v20 - 746))))();
}

uint64_t sub_1000318FC@<X0>(int a1@<W8>)
{
  return (*(uint64_t (**)(void))(v1
                              + 8
                              * ((490 * (((((4 * LODWORD(STACK[0x2AC])) ^ 0x1F40) - 1155) & a1) == 0)) ^ (LODWORD(STACK[0x2AC]) - 517))))();
}

void sub_100031930()
{
}

uint64_t sub_100031964(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,_DWORD *a29)
{
  uint64_t v34 = (*(uint64_t (**)(uint64_t, void))(v30 + 8 * (v29 + 1538)))(a12, 0);
  (*(void (**)(uint64_t))(v30 + 8 * (v29 ^ 0xA5B)))(v34);
  (*(void (**)(void))(v30 + 8 * (v29 + 1461)))();
  v31[1] = *a29 + ((1664525 * (*v31 ^ (*v31 >> 30))) ^ v31[1]);
  *(void *)(v33 - 120) = v32 + 623;
  int v35 = ((v29 ^ 0x65D) + 1920031704) ^ v32;
  *(_DWORD *)(v33 - 152) = ((v29 ^ 0x65D) - 1501686882) ^ v32;
  *(_DWORD *)(v33 - 148) = v35 ^ 0xB;
  *(void *)(v33 - 136) = v32 + 2;
  *(_DWORD *)(v33 - 128) = v35;
  *(_DWORD *)(v33 - 112) = -(int)v32;
  *(_DWORD *)(v33 - 140) = v35 ^ 0x8A;
  uint64_t v36 = (*(uint64_t (**)(uint64_t))(v30 + 8 * (v29 ^ 0xA66)))(v33 - 152);
  return (*(uint64_t (**)(uint64_t))(v30 + 8 * *(int *)(v33 - 144)))(v36);
}

void sub_100031A8C(uint64_t a1@<X8>, uint64_t a2, uint64_t a3, unsigned int a4, uint64_t a5)
{
  int v9 = (v7 - 797935537) & 0x2F8F87FB;
  a5 = v6;
  a3 = v5;
  a4 = v7
     + 3804331 * ((-1267227818 - (&a3 | 0xB477A356) + (&a3 | 0x4B885CA9)) ^ 0xC42D476F)
     + 1019;
  (*(void (**)(uint64_t *))(a1 + 8 * (v7 ^ 0x882)))(&a3);
  *int v8 = (v9 ^ 0x22FD99F1) - *v8;
  JUMPOUT(0x1000213F8);
}

uint64_t sub_100031B2C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12, int a13)
{
  BOOL v16 = v13 - 571457069 < (a13 - 1790825561);
  if ((a13 - 1790825561) < 0xE33C5DAF != (v13 - 571457069) < 0xE33C5DAF) {
    BOOL v16 = (a13 - 1790825561) < 0xE33C5DAF;
  }
  return (*(uint64_t (**)(void))(v15 + 8 * ((!v16 * ((v14 ^ 0x1CA) - 64)) ^ v14)))();
}

uint64_t sub_100031B98@<X0>(int a1@<W8>)
{
  return (*(uint64_t (**)(void))(v1 + 8 * (a1 ^ 0x4DA)))();
}

uint64_t sub_100031BDC@<X0>(uint64_t a1@<X0>, int a2@<W2>, int a3@<W8>)
{
  return (*(uint64_t (**)(uint64_t, void))(v3
                                                    + 8 * ((525 * (((((a2 - 1116) | 0x611) ^ 0x6E9) & a3) == 0)) ^ a2)))(a1, (a2 - 1038));
}

uint64_t sub_100031C18(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,int a59,uint64_t a60)
{
  STACK[0x2A0] = (*(uint64_t (**)(uint64_t, uint64_t))(v61 + 8 * (v60 + 350)))(a60, 2965982036);
  unsigned int v63 = (*(uint64_t (**)(void))(v61 + 8 * (v60 + 279)))();
  *uint64_t v62 = v63;
  v62[1] = 1812433253 * ((v63 >> ((a59 ^ 0xB0) + 72)) ^ v63) + 1;
  return (*(uint64_t (**)(void))(v61 + 8 * (a59 ^ 0x11)))();
}

void sub_100031C98()
{
}

void sub_100031CEC()
{
}

uint64_t sub_100031D00(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v5
                                                                                         + 8
                                                                                         * ((v4 - 938) | (8 * ((((v3 - 1660710442) < 0x38) ^ (v4 - 76)) & 1)))))(a1, 306, a3, 1468, 205, 889516850);
}

uint64_t sub_100031D50@<X0>(int a1@<W6>, uint64_t a2@<X7>, uint64_t a3@<X8>)
{
  *(unsigned char *)(v6 + ((((v3 ^ v9) * a1) ^ v7) & (v4 + a2))) = *(unsigned char *)(v5 + a3 + v10);
  return (*(uint64_t (**)(void))(v8
                              + 8
                              * ((((a2 + v4 + 1) > 0x3F) | (4 * ((a2 + v4 + 1) > 0x3F))) ^ v3)))();
}

uint64_t sub_100031DA0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,int a21,int a22,uint64_t a23,int a24,int a25)
{
  BOOL v29 = a25 - v26 == (v25 ^ 0xF944D8AE) && a22 == a6 + 10;
  return (*(uint64_t (**)(void))(v27 + 8 * ((1338 * v29) ^ v25)))();
}

uint64_t sub_100031DE8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  int v76 = *(unsigned __int8 *)(v73 - 0x1FA9E8BAFD93F958) ^ 0xCF;
  if (v76 == 1)
  {
    unsigned int v83 = *(_DWORD *)(v73 - 0x1FA9E8BAFD93F974);
    unsigned int v79 = (LODWORD(STACK[0x2AC]) - 737) | 0x1C4;
    unsigned int v84 = (v83 >> (((LOBYTE(STACK[0x2AC]) + 31) | 0xC4) ^ 0xD1)) ^ 0xFFFFFFEF;
    unsigned int v85 = *(_DWORD *)(v73 - 0x1FA9E8BAFD93F978);
    HIDWORD(v86) = ~v85;
    LODWORD(v86) = v83 ^ 0x20000000;
    *(unsigned char *)(v73 - 0x1FA9E8BAFD93F980) = 8 * v83 - ((16 * v83) & 0xAA) + 82;
    *(unsigned char *)(v73 - 0x1FA9E8BAFD93F97FLL) = v84 - ((2 * v84) & 0xA4) + 82;
    *(unsigned char *)(v73 - 0x1FA9E8BAFD93F97ELL) = ((v83 >> 13) ^ 0x45) - ((2 * ((v83 >> 13) ^ 0x45)) & 0xA4) + 82;
    *(unsigned char *)(v73 - 0x1FA9E8BAFD93F97DLL) = (a7 ^ (v83 >> 21)) - ((v83 >> 20) & 0xA4) + 82;
    *(unsigned char *)(v73 - 0x1FA9E8BAFD93F97CLL) = (v86 >> 29) - ((2 * (v86 >> 29)) & 0xA4) + 82;
    *(unsigned char *)(v73 - 0x1FA9E8BAFD93F97BLL) = ((v85 >> 5) ^ 0x4F) - ((2 * ((v85 >> 5) ^ 0x4F)) & 0xA4) + 82;
    *(unsigned char *)(v73 - 0x1FA9E8BAFD93F97ALL) = ((v85 >> 13) ^ 0x13) - ((2 * ((v85 >> 13) ^ 0x13)) & 0xA4) + 82;
    unsigned int v87 = (v85 >> 21) ^ 0xFFFFFFE9;
    char v81 = v87 + 82;
    unsigned int v82 = 2 * (v87 & 0x56 ^ (v85 >> 21) & 4);
    goto LABEL_5;
  }
  int v77 = v74;
  if (v76 == 2)
  {
    unsigned int v78 = *(_DWORD *)(v73 - 0x1FA9E8BAFD93F978);
    unsigned int v79 = a72 & 0x8C95BFDF;
    *(unsigned char *)(v73 - 0x1FA9E8BAFD93F980) = ((v78 >> 21) ^ 0xE9)
                                           + ~((((v78 >> 21) ^ 0xFFFFFFE9) & 0x56 ^ (v78 >> 21) & 4) << ((a72 & 0xDF) + 45))
                                           + 83;
    *(unsigned char *)(v73 - 0x1FA9E8BAFD93F97FLL) = ((v78 >> 13) ^ 0x13) - ((2 * ((v78 >> 13) ^ 0x13)) & 0xA4) + 82;
    *(unsigned char *)(v73 - 0x1FA9E8BAFD93F97ELL) = ((v78 >> 5) ^ 0x4F) - ((2 * ((v78 >> 5) ^ 0x4F)) & 0xA4) + 82;
    unsigned int v82 = *(_DWORD *)(v73 - 0x1FA9E8BAFD93F974);
    HIDWORD(v80) = ~v78;
    LODWORD(v80) = v82 ^ 0x20000000;
    *(unsigned char *)(v73 - 0x1FA9E8BAFD93F97DLL) = (v80 >> 29) - ((2 * (v80 >> 29)) & 0xA4) + 82;
    *(unsigned char *)(v73 - 0x1FA9E8BAFD93F97CLL) = (a7 ^ (v82 >> 21)) - ((v82 >> 20) & 0xA4) + 82;
    *(unsigned char *)(v73 - 0x1FA9E8BAFD93F97BLL) = ((v82 >> 13) ^ 0x45) - ((2 * ((v82 >> 13) ^ 0x45)) & 0xA4) + 82;
    *(unsigned char *)(v73 - 0x1FA9E8BAFD93F97ALL) = ((v82 >> 5) ^ 0xEF) + (~(2 * ((v82 >> 5) ^ 0xEF)) | 0x5B) + 83;
    char v81 = 8 * v82 + 82;
    LOBYTE(v82) = (16 * v82) & 0xA0;
LABEL_5:
    int v77 = v79 ^ 0x325;
    *(unsigned char *)(v73 - 0x1FA9E8BAFD93F979) = v81 - v82;
  }
  STACK[0x310] = *(void *)(v75 + 8 * (v77 - 1729));
  return sub_100030BB8();
}

uint64_t sub_100032160()
{
  STACK[0x288] = STACK[0x488];
  LODWORD(STACK[0x4F4]) = 1115468202;
  return sub_100012608();
}

uint64_t sub_100032198(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7)
{
  return (*(uint64_t (**)(void))(v7
                              + 8
                              * ((((57 * ((a7 - 884) ^ (v8 + 1561) ^ (v8 + 1195))) ^ 0x32D) * (v9 > 0x1F)) ^ (a7 - 884))))();
}

uint64_t sub_1000321DC(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12, int a13, uint64_t a14, uint64_t a15)
{
  BOOL v19 = a13 > -1190615263;
  *(_DWORD *)(a15 + 4 * (a1 - 1503743600)) = v17;
  int v20 = a1 + 1834355311;
  uint64_t v21 = ((v15 - 1728) ^ 0x142u) + a1;
  int v22 = v19 ^ (v20 < 1190615262);
  BOOL v23 = v20 < v16;
  if (!v22) {
    BOOL v19 = v23;
  }
  return (*(uint64_t (**)(uint64_t, BOOL))(v18 + 8 * (v15 ^ (8 * !v19))))(v21, v23);
}

uint64_t sub_100032258(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,int a23,int a24)
{
  return (*(uint64_t (**)(void))(v25
                              + 8
                              * ((1093 * (a24 - *(_DWORD *)(a2 + 4) - 1041595808 == 245 * (v24 ^ 0x22D) - 1154524425)) ^ v24)))();
}

uint64_t sub_1000322AC(int a1, int a2)
{
  return (*(uint64_t (**)(void))(v3 + 8 * ((415 * (a2 + a1 + ((v2 - 1705) | 0x164u) - 1107293952 - 355 < 8)) ^ v2)))();
}

uint64_t sub_10003231C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8)
{
  return (*(uint64_t (**)(void))(v9
                              + 8
                              * ((235
                                * (*(_DWORD *)(v8 + 48 * (v11 + a8)) == ((148 * (v10 ^ 0x67F) + 377450165) & 0xEDDCF771)
                                                                        + 1754139832)) ^ v10)))();
}

uint64_t sub_100032388(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7)
{
  uint64_t v16 = (a7 + v12);
  uint64_t v17 = (((v13 - 800) | 0x444) ^ 0x56A) & v16;
  *(unsigned char *)(*(void *)(v15 - 120) + v16) = *(unsigned char *)(v8 + v17) ^ *(unsigned char *)(v7 + v16) ^ *(unsigned char *)(v10 + v17) ^ *(unsigned char *)(v17 + v9 + 1) ^ (23 * v17);
  return (*(uint64_t (**)(void))(v14 + 8 * ((254 * (a7 - 1 != v11)) ^ (v13 + 565))))();
}

uint64_t sub_100032400()
{
  return (*(uint64_t (**)(void))(v2
                              + 8
                              * ((497 * (v0 - STACK[0x3C0] >= (unint64_t)(v1 + 79) - 1288)) ^ v1)))();
}

uint64_t sub_100032440(int a1, int a2, int a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8)
{
  int v13 = v9 + v8;
  int v14 = v13 + v10;
  if ((v13 + v10) <= 0x40) {
    int v14 = a4;
  }
  return (*(uint64_t (**)(void))(v11
                              + 8
                              * ((509
                                * (a8 - v13 >= a1
                                             + a3
                                             + ((a2 - 1575) | 0xA0)
                                             + 1052
                                             + v12
                                             + ((a2 - 1575) | 0xA0u)
                                             - 249
                                             + v14
                                             + 1094307160)) ^ ((a2 - 1575) | 0xA0))))();
}

uint64_t sub_1000324A8()
{
  return (*(uint64_t (**)(void))(v1 + 8 * ((38 * (STACK[0x418] == 0)) | (v0 - 880))))();
}

void sub_1000324D0()
{
}

uint64_t sub_1000324E0(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22)
{
  if (a16 == 2) {
    return (*(uint64_t (**)(void))(v22 + 8 * ((76 * (*(_DWORD *)(v23 - 128) != 1049205778)) ^ (a4 - 1249276634))))();
  }
  if (a16 == 1)
  {
    BOOL v24 = *(_DWORD *)(v23 - 128) != ((a4 - 1249276988) ^ 0x3E899E56);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v22 + 8 * (v24 | (8 * v24) | (a4 - 1249276988))))(a1, a9, 3045689728);
  }
  else
  {
    unint64_t v26 = ((unint64_t)&a22 ^ 0x6FBE6FFFDEC7FF77)
        - 0xC88064418011300
        + ((2 * (void)&a22) & 0xDF7CDFFFBD8FFEE0);
    *(unsigned char *)(v23 - 129) = ((v26 - 119) ^ 0xBA) * (v26 - 102);
    return (*(uint64_t (**)(void, uint64_t, uint64_t))(v22 + 16160))(0, a2, 3045689728);
  }
}

void sub_100032688(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 16) ^ (3804331 * ((a1 & 0x8EFFDE1B | ~(a1 | 0x8EFFDE1B)) ^ 0xFEA53A22));
  uint64_t v2 = *(void *)(a1 + 8);
  int v3 = *(_DWORD *)(v2 - 0x4C6937770F4864B4);
  unsigned int v6 = v1 - 1759421093 * ((2 * (&v5 & 0x11D00BC0) - &v5 + 1848636475) ^ 0xDD52446F) + 1130;
  uint64_t v5 = v2;
  uint64_t v4 = (uint64_t)*(&off_10005CE90 + (v1 ^ 0x19));
  (*(void (**)(uint64_t *))(v4 + 8 * (v1 + 1909)))(&v5);
  __asm { BRAA            X8, X17 }
}

void sub_1000327CC()
{
}

uint64_t sub_1000327D8(uint64_t a1, uint64_t a2, unsigned int a3)
{
  return (*(uint64_t (**)(void))(v3
                              + 8
                              * ((362
                                * ((v6 & (2 * (*(unsigned __int8 *)(a2 + 3) - 137)))
                                 + ((*(unsigned __int8 *)(a2 + 3) - 137) ^ v5) == (a3 ^ (v4 - 165)) - 556027422)) ^ a3)))();
}

uint64_t sub_100032824(uint64_t a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,int a25,int a26)
{
  int8x16x4_t v37 = vld4q_s8(a4);
  uint8x16_t v27 = (uint8x16_t)veorq_s8(v37.val[1], v26);
  _Q17 = vmovl_u8(*(uint8x8_t *)v27.i8);
  _Q16 = vmovl_high_u8(v27);
  __asm
  {
    SHLL2           V18.4S, V16.8H, #0x10
    SHLL2           V19.4S, V17.8H, #0x10
  }
  return sub_10003DD9C(a1, a2, a3, (uint64_t)a4, 5 * a26);
}

uint64_t sub_100032930()
{
  int v8 = (v4 + 355) | 0x78;
  int v9 = 535753261 * ((v7 - 136) ^ 0xAF40E2F);
  *(void *)(v7 - 136) = v6;
  *(_DWORD *)(v7 - 128) = v9 + v5 + v8 + 5526427;
  *(_DWORD *)(v7 - 124) = (v4 + 1345) ^ v9;
  (*(void (**)(uint64_t))(v2 + 8 * (v4 ^ 0x8B9)))(v7 - 136);
  *(void *)(v7 - 136) = v0;
  *(_DWORD *)(v7 - 128) = v8
                        + ((((v7 - 136) | 0x1745966D) - (v7 - 136) + ((v7 - 136) & 0xE8BA6990)) ^ 0x98E08DAB) * v3
                        + 1041;
  *(void *)(v7 - 120) = v1;
  uint64_t v10 = (*(uint64_t (**)(uint64_t))(v2 + 8 * (v8 + 1477)))(v7 - 136);
  return (*(uint64_t (**)(uint64_t))(v2
                                            + 8
                                            * ((235
                                              * (*(_DWORD *)(v7 - 124) <= ((v8 + 540961619) & 0xDFC192FF) + 1996101587)) ^ v8)))(v10);
}

void sub_100032A3C()
{
}

uint64_t sub_100032A48@<X0>(int a1@<W8>)
{
  int v4 = a1 - 293;
  unsigned int v5 = (v4 + 1999958721) & 0x88CB0FFA;
  uint64_t v6 = (*(uint64_t (**)(void))(v2 + 8 * (v4 + 936)))(*v3);
  return (*(uint64_t (**)(uint64_t))(v2
                                            + 8
                                            * (int)(((*v1 == (((v5 - 826) | 0xA6) ^ 0x4E6)) * ((v5 - 826) ^ 0x499)) ^ v5)))(v6);
}

uint64_t sub_100032AB4(char a1, int a2, unsigned int a3, uint64_t a4, uint64_t a5, int a6)
{
  return (*(uint64_t (**)(void))(v8
                              + 8
                              * ((((((a3 ^ v6) * a1) ^ (v9 + v7 < a6 + (a3 ^ v6) + 1775 + 108)) & 1)
                                * a2) ^ a3)))();
}

uint64_t sub_100032AF8@<X0>(uint64_t a1@<X1>, unint64_t a2@<X2>, int a3@<W4>, unsigned int a4@<W7>, unint64_t a5@<X8>, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  BOOL v35 = v21 > v34;
  int v36 = v27 + a3;
  int v37 = v27 + 1;
  uint64_t v38 = 4 * (v37 + a3);
  unint64_t v39 = (*(_DWORD *)(a20 + v38) ^ v20) + ((a5 >> (v29 ^ v25)) ^ a1);
  unint64_t v40 = HIDWORD(v33)
      + a4 * (unint64_t)(*(_DWORD *)(*v31 + v38) ^ v20)
      + ((v39 + v26 - (v24 & (2 * v39))) ^ a2);
  *(_DWORD *)(a20 + 4 * v36) = v40 + v20 - (v22 & (2 * v40));
  if (v35 == v37 + 531341104 < v30 + 167) {
    BOOL v35 = v37 + 531341104 < v32;
  }
  return (*(uint64_t (**)(void))(v28 + 8 * (((16 * v35) | (32 * v35)) ^ v23)))();
}

void sub_100032BAC()
{
}

uint64_t sub_100032BB4(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)(a1 + 88) = (((**(unsigned char **)(a2 + 8) != 0) | (2 * (**(unsigned char **)(a2 + 8) != 0))) ^ 0x7D) - 72;
  return 0;
}

uint64_t sub_100032BE4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v12 + 8 * ((22 * (((*(_DWORD *)(a8 + 72) == a6) ^ (a5 + a3 - 111)) & 1)) ^ ((int)a5 + (int)a3 - 127))))(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12);
}

uint64_t sub_100032C2C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  int v19 = (v11 - 276) | 0xF0;
  *(_DWORD *)(v18 - 104) = v11
                         + 235795823 * ((2 * ((v18 - 144) & 0x56DD6590) - (v18 - 144) - 1457350033) ^ 0x3D8FD336)
                         - 595;
  *(void *)(v18 - 136) = v13;
  *(void *)(v18 - 128) = v13;
  *(void *)(v18 - 120) = a11;
  *(void *)(v18 - 112) = v15;
  *(void *)(v18 - 144) = v14;
  uint64_t v20 = (*(uint64_t (**)(uint64_t))(v17 + 8 * (v11 + 1314)))(v18 - 144);
  BOOL v21 = v12 + v16 - 1 >= 196 * (v19 ^ 0x2F5u) + 2147482863;
  return (*(uint64_t (**)(uint64_t))(v17 + 8 * ((2 * v21) | (8 * v21) | v19)))(v20);
}

void sub_100032CE4()
{
}

uint64_t sub_100032DBC(int a1, uint64_t a2)
{
  *(void *)(v2 - 7 + (v4 + v5 + v6 - v7)) = *(void *)(a2 - 7 + (v4 + v5 + v6 - v7));
  return (*(uint64_t (**)(void))(v8
                              + 8 * (((v7 - (v3 & 0xFFFFFFF8) == -8) * ((a1 - 1922331182) & 0x72946DFF ^ 0x10)) ^ a1)))();
}

void sub_100032E24()
{
}

uint64_t sub_100032E30@<X0>(uint64_t a1@<X1>, unint64_t a2@<X2>, int a3@<W4>, void *a4@<X6>, unsigned int a5@<W7>, unint64_t a6@<X8>, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21)
{
  uint64_t v35 = 4 * (v26 + 1 + a3);
  unint64_t v36 = (*(_DWORD *)(a21 + v35) ^ (v21 + (v32 ^ 0x300) - 274))
      + (a1 ^ HIDWORD(a6))
      + v28 * (unint64_t)(*(_DWORD *)(*a4 + v35) ^ v21);
  unint64_t v37 = HIDWORD(v33)
      + a5 * (unint64_t)(*(_DWORD *)(*v30 + v35) ^ v21)
      + ((v36 + v25 - (v29 & (2 * v36))) ^ a2);
  *(_DWORD *)(a21 + 4 * (v26 + a3)) = v37 + v21 - (v22 & (2 * v37));
  BOOL v39 = v26 + v24 < v34 && v26 + v24 >= v31;
  return (*(uint64_t (**)(void))(v27 + 8 * ((v39 * v23) ^ v32)))();
}

uint64_t sub_100032ED0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v8 = a1 + 1;
  unsigned char *v2 = ((10 * v5) ^ (v3 + v8) ^ 0xFC) * (v4 + v8);
  return (*(uint64_t (**)(void))(v7 + 8 * (((v8 == 91) * v6) ^ v1)))();
}

void sub_100032ED8(uint64_t a1)
{
  uint64_t v2 = (uint64_t *)*(&off_10005CE90
                  + (byte_100056C68[(byte_100051ADC[(85 * ((qword_100060158 + dword_1000601A0) ^ 0xD)) - 12] ^ 0x33)
                                                                 - 8] ^ (85 * ((qword_100060158 + dword_1000601A0) ^ 0xD)))
                  + 9);
  unsigned __int8 v3 = 85 * ((qword_100060158 + *v2) ^ 0xD);
  char v4 = (uint64_t *)*(&off_10005CE90 + (byte_1000519D8[(byte_10004D73C[v3 - 12] ^ 0xF6) - 8] ^ v3) - 83);
  unint64_t v5 = (*v4 + *v2) ^ (unint64_t)&v9;
  uint64_t v6 = 839241301 * v5 - 0x78A901D92725650DLL;
  uint64_t v7 = 839241301 * (v5 ^ 0x78A901D92725650DLL);
  uint64_t *v2 = v6;
  uint64_t *v4 = v7;
  LODWORD(v4) = *(_DWORD *)v2;
  uint64_t v8 = (uint64_t)*(&off_10005CE90
                + ((85 * ((qword_100060158 - dword_1000601A0) ^ 0xD)) ^ byte_10004A060[byte_100056B60[(85 * ((qword_100060158 - dword_1000601A0) ^ 0xD))] ^ 0x62])
                - 101);
  (*(void (**)(char *, uint64_t (*)()))(v8
                                                + 8
                                                * ((byte_100049E60[byte_100056860[(85 * (v4 ^ 0xD ^ v7))] ^ 0xBF] ^ (85 * (v4 ^ 0xD ^ v7)))
                                                 + 2000)))((char *)*(&off_10005CE90+ ((85 * ((v7 - (_BYTE)v4) ^ 0xD)) ^ byte_100049E60[byte_100056860[(85 * ((v7 - (_BYTE)v4) ^ 0xD))] ^ 0xD1])+ 41)- 4, sub_10002D038);
  __asm { BRAA            X9, X17 }
}

uint64_t sub_1000330C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,int a24,char a25)
{
  return (*(uint64_t (**)(void))(v28
                              + 8
                              * ((2021
                                * ((unint64_t)(&a25 + a13 + (v25 + v26 - 1)) < ((v27 - 1425291778) & 0x54F437DF ^ ((unint64_t)(v27 - 659) + 129)))) ^ v27)))();
}

uint64_t sub_100033120(uint64_t a1, int a2, uint64_t a3)
{
  *(void *)(a3 + (v4 + v3)) = *(void *)(v5 + (v4 + v3));
  return (*(uint64_t (**)(void))(v7 + 8 * ((14 * (v6 == 0)) ^ a2)))();
}

void sub_100033154(uint64_t a1)
{
  int v1 = 535753261 * ((-2 - ((a1 | 0x6D3F96EA) + (~a1 | 0x92C06915))) ^ 0x9834673A);
  int v2 = *(_DWORD *)(a1 + 8) ^ v1;
  int v3 = *(_DWORD *)(a1 + 4) + v1;
  BOOL v5 = (~v3 & 0x30000000) == 0 || (v3 & 0x3F000000) == 369098752;
  __asm { BRAA            X10, X17 }
}

uint64_t sub_10003322C()
{
  int v6 = ((((v5 - 144) | 0xD528F351) + (~(v5 - 144) | 0x2AD70CAE)) ^ 0xDFDCFD7F) * v4;
  *(void *)(v5 - 136) = v3;
  *(_DWORD *)(v5 - 144) = v2 - 470130727 - v6;
  *(_DWORD *)(v5 - 140) = v0 - v6 + 240;
  uint64_t v7 = (*(uint64_t (**)(uint64_t))(v1 + 8 * (v0 + 556)))(v5 - 144);
  return (*(uint64_t (**)(uint64_t))(v1
                                            + 8
                                            * (((*(_DWORD *)(v5 - 128) == 453445646) * (((v0 - 1494) | 0x205) ^ 0x27B)) ^ (v0 - 436))))(v7);
}

uint64_t sub_1000332D4@<X0>(int a1@<W8>)
{
  return (*(uint64_t (**)(uint64_t))(v2
                                            + 8
                                            * (((((v1 - 1811316757) | 0x21800980) ^ (v3 + 105)) * (a1 == 1228396338)) ^ v1)))(4294925278);
}

uint64_t sub_10003331C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, unint64_t *a16, int a17, unsigned int a18)
{
  a16 = &STACK[0x6B8EF04F79262553];
  a18 = 1704 - 460628867 * (((&a16 | 0x8BB0E6D) - (&a16 & 0x8BB0E6D)) ^ 0x442D8C10);
  uint64_t v21 = (*(uint64_t (**)(unint64_t **))(v19 + 16928))(&a16);
  return (*(uint64_t (**)(uint64_t))(v19 + 8
                                                  * (int)(((a17 == v18) * ((v20 ^ 0x9B531C2F) + 1689051611)) ^ v20)))(v21);
}

uint64_t sub_1000333C4(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  return (*(uint64_t (**)(void))(v6 + 8 * ((((v5 + 248) ^ 0x2A1 ^ ((v5 - 634) | 0x108)) * (v4 == a4)) ^ v5)))();
}

uint64_t sub_1000333FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, int a6)
{
  return (*(uint64_t (**)(void))(v8 + 8 * (((a5 + a6 + ((v7 - 913) | 0x29) - 815 - 557) * ((v6 ^ 0x1Fu) < 8)) ^ v7)))();
}

uint64_t sub_10003343C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v8
                                                                                         + 8
                                                                                         * (int)(((*(_DWORD *)(a8 + 72) == a5 + 1228395914)
                                                                                                * (((a5 + 940674495) & 0xC7EE75FF)
                                                                                                 - 39)) ^ (a5 + 480))))(a1, a2, 2474212436, 3049151192, 1820755250, 1228396339);
}

uint64_t sub_1000334B8()
{
  *(_DWORD *)(*v3 + 4 * (v6 + v0 + v1)) = v2;
  return (*(uint64_t (**)(void))(v7 + 8 * ((((v6 + v0 + 405) < 0x7FFFFFFF) * v5) ^ v4)))();
}

void sub_1000334F0()
{
  int v0 = (unint64_t *)*(&off_10005CE90
                           + ((85 * ((qword_100060158 - dword_100060170) ^ 0xD)) ^ byte_10004A060[byte_100056B60[(85 * ((qword_100060158 - dword_100060170) ^ 0xD))] ^ 0x1D])
                           + 110);
  unsigned __int8 v1 = 85 * (*v0 ^ qword_100060158 ^ 0xD);
  int v2 = (unint64_t *)*(&off_10005CE90
                           + (byte_1000519D8[(byte_10004D73C[v1 - 12] ^ 0x9B) - 8] ^ v1)
                           - 26);
  unint64_t v3 = 839241301 * ((unint64_t)&v5[*v2 ^ *v0] ^ 0x78A901D92725650DLL);
  *int v0 = v3;
  unint64_t *v2 = v3;
  v6[0] = (1178560073 * (((v6 | 0x945DDB82) - (v6 & 0x945DDB82)) ^ 0x2EC9A3E0)) ^ 0x650810FC;
  LOBYTE(v2) = 85 * (*(_DWORD *)v0 ^ 0xD ^ *(_DWORD *)v2);
  uint64_t v4 = (uint64_t)*(&off_10005CE90
                + ((85 * (dword_100060170 ^ 0xD ^ qword_100060158)) ^ byte_100056960[byte_1000518D0[(85 * (dword_100060170 ^ 0xD ^ qword_100060158))] ^ 0x7D])
                + 22);
  (*(void (**)(_DWORD *))(v4
                                   + 8
                                   * ((byte_10005696C[(byte_1000518D4[v2 - 4] ^ 0x42)
                                                                                   - 12] ^ v2)
                                    + 2135)))(v6);
  __asm { BRAA            X8, X17 }
}

uint64_t sub_10003370C@<X0>(int a1@<W8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56)
{
  int v59 = a1 + 1067;
  int v60 = (a1 + 277) | 0x211;
  int v61 = (a1 - 625) | 0x14;
  STACK[0x498] = 0;
  int v62 = ((v58 - 188424848 - 2 * ((v58 - 200) & 0xF4C4DE38)) ^ 0xFE30D017) * v57;
  *(void *)(v58 - 176) = a56;
  *(void *)(v58 - 184) = a55;
  *(void *)(v58 - 168) = 0x2E4DC5BD422AC3DALL;
  *(_DWORD *)(v58 - 196) = -1769365461 - v62;
  *(_DWORD *)(v58 - 192) = (a1 - 185) ^ v62;
  uint64_t v63 = (*(uint64_t (**)(uint64_t))(v56 + 8 * ((a1 + 1067) ^ 0xF6E)))(v58 - 200);
  return (*(uint64_t (**)(uint64_t))(v56
                                            + 8
                                            * (((*(_DWORD *)(v58 - 200) != v61 - 1158872231) * (v60 ^ 0x61D)) ^ v59)))(v63);
}

uint64_t sub_1000337EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,int a45)
{
  BOOL v48 = (LODWORD(STACK[0x504]) ^ v45) == a45 + ((v46 - 348) | 0x421) - 1779886384;
  return (*(uint64_t (**)(void))(v47
                              + 8
                              * (((((v46 - 1030) ^ v48) & 1) == 0) | (((((v46 - 1030) ^ v48) & 1) == 0) << 6) | v46)))();
}

uint64_t sub_100033844(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  int v18 = 1374699841 * (((v17 - 144) & 0x443FF3BF | ~((v17 - 144) | 0x443FF3BF)) ^ 0xD6341449);
  *(void *)(v17 - 144) = v15;
  *(void *)(v17 - 136) = a13;
  *(_DWORD *)(v17 - 128) = v18 + v16 - 249;
  *(_DWORD *)(v17 - 124) = (v13 + 11 * (v16 ^ 0x201) - 1656671880) ^ v18;
  uint64_t v19 = (*(uint64_t (**)(uint64_t))(v14 + 8 * (v16 ^ 0xA74)))(v17 - 144);
  return sub_1000338C8(v19);
}

void sub_1000338C8()
{
  _DWORD *v2 = v1;
  *(_DWORD *)(v0 + 40) = -1158872075;
}

uint64_t sub_10003391C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(unsigned char *)(a4 + 1) = *(unsigned char *)(a8 + (v9 - 327863514));
  return (*(uint64_t (**)(void))(v10
                              + 8 * ((1362 * (v9 + ((v8 - 3) ^ 0xEC753184 ^ (v8 - 843738656) & 0x324A6BBB) < 4)) ^ v8)))();
}

void sub_10003399C(uint64_t a1)
{
  BOOL v2 = *(_DWORD *)(*(void *)(a1 + 8) - 0x4C6937770F4864B4) == 293522565
    || *(_DWORD *)(*(void *)(a1 + 16) - 0x4C6937770F4864B4) == 293522565;
  __asm { BRAA            X13, X17 }
}

uint64_t sub_100033A80(double a1, __n128 a2, __n128 a3, __n128 a4, __n128 a5, __n128 a6, __n128 a7, __n128 a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, int a15, uint64_t a16)
{
  unsigned int v29 = v21 - 16;
  uint64_t v30 = v29 & 0xF;
  v32.i64[0] = vqtbl4q_s8(*(int8x16x4_t *)(&a2 - 1), v26).u64[0];
  v32.i64[1] = vqtbl4q_s8(*(int8x16x4_t *)a5.n128_u64, v26).u64[0];
  int8x16_t v33 = vrev64q_s8(veorq_s8(veorq_s8(*(int8x16_t *)(v19 + v29), *(int8x16_t *)(v16 + v30 - 15)), veorq_s8(*(int8x16_t *)(v18 + v30 - 15), *(int8x16_t *)(v17 + v30 - 15))));
  int8x16_t v34 = vrev64q_s8(veorq_s8(veorq_s8(vextq_s8(v33, v33, 8uLL), v28), vmulq_s8(v32, v27)));
  *(int8x16_t *)(v20 + v29) = vextq_s8(v34, v34, 8uLL);
  return (*(uint64_t (**)(void))(v25 + 8 * (((v22 == 16) * (((a15 - 387) | v23) ^ v24)) ^ a15)))();
}

uint64_t sub_100033A8C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, int a11, int a12)
{
  return (*(uint64_t (**)(void))(v12 + 8 * ((1379 * (a12 - 1006085881 < ((v13 - 701) ^ 0x7FFFFF3Du))) ^ v13)))();
}

uint64_t sub_100033AD8()
{
  return (*(uint64_t (**)(void))(v2
                              + 8
                              * ((55
                                * (((v1 - 1) ^ ((v0 & 0x1F ^ 1) == ((v1 + 1225596063) & 0xB6F2DFB7 ^ 0x3B3))) & 1)) ^ v1)))();
}

uint64_t sub_100033B30(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned int a5)
{
  return (*(uint64_t (**)(void))(v6 + 8 * (((2 * (v7 + 1 != v5 + 40)) | (8 * (v7 + 1 != v5 + 40))) ^ a5)))();
}

uint64_t sub_100033BFC@<X0>(int a1@<W8>)
{
  v8.i64[0] = 0xA4A4A4A4A4A4A4A4;
  v8.i64[1] = 0xA4A4A4A4A4A4A4A4;
  v9.i64[0] = 0x5252525252525252;
  v9.i64[1] = 0x5252525252525252;
  *(int8x16_t *)(v3 + (v1 + a1 + 64)) = vaddq_s8(vsubq_s8(*v7, vandq_s8(vaddq_s8(*v7, *v7), v8)), v9);
  return (*(uint64_t (**)(void))(v6
                              + 8
                              * ((1992
                                * (((7 * (v4 ^ 0x4A4u) + 0x1FFFFFBF2) & (v2 + v5 - 248)) - (7 * (v4 ^ 0x4A4u) - 773) != -233)) ^ (7 * (v4 ^ 0x4A4)))))();
}

uint64_t sub_100033C8C(int a1, unsigned int a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6)
{
  *(void *)(a6 + a2) = *(void *)(a3 + a2);
  return (*(uint64_t (**)(void))(v6 + 8 * (((a5 == 0) * v7) ^ a1)))();
}

uint64_t sub_100033CBC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35)
{
  *(_DWORD *)(v40 - 128) = (v35 ^ 0x20B)
                         - 1178560073
                         * ((((v40 - 144) ^ 0x55FC345A) & 0x28D6E822 | ~((v40 - 144) ^ 0x55FC345A | 0x28D6E822)) ^ 0x38415BE5)
                         - 976;
  *(void *)(v40 - 144) = v39;
  *(void *)(v40 - 136) = v37;
  (*(void (**)(uint64_t))(v36 + 8 * ((v35 ^ 0x20B) + 940)))(v40 - 144);
  *(_DWORD *)(v40 - 104) = (v35 ^ 0x20B) - 980 + 235795823 * ((v38 - 323563898 - 2 * (v38 & 0xECB6CE86)) ^ 0x781B87DF);
  *(void *)(v40 - 120) = v39;
  *(void *)(v40 - 112) = a24;
  *(void *)(v40 - 144) = v37;
  *(void *)(v40 - 136) = a35;
  *(void *)(v40 - 128) = v39;
  (*(void (**)(uint64_t))(v36 + 8 * ((v35 ^ 0x20B) + 929)))(v40 - 144);
  *(_DWORD *)(v40 - 104) = (v35 ^ 0x20B)
                         - 980
                         + 235795823 * ((((2 * v38) | 0xED55BEB4) - v38 - 1990909786) ^ 0xE2079603);
  *(void *)(v40 - 144) = v37;
  *(void *)(v40 - 136) = v39;
  *(void *)(v40 - 128) = v39;
  *(void *)(v40 - 120) = a18;
  *(void *)(v40 - 112) = a24;
  (*(void (**)(uint64_t))(v36 + 8 * ((v35 ^ 0x20B) + 929)))(v40 - 144);
  *(void *)(v40 - 128) = v39;
  *(_DWORD *)(v40 - 136) = (v35 ^ 0x20B)
                         + 1755732067 * ((v38 & 0x3CE12F49 | ~(v38 | 0x3CE12F49)) ^ 0x1DD86D6D)
                         - 1882358638;
  *(void *)(v40 - 144) = a20;
  (*(void (**)(uint64_t))(v36 + 8 * ((v35 ^ 0x20B) + 952)))(v40 - 144);
  *(_DWORD *)(v40 - 128) = (v35 ^ 0x20B)
                         - 1178560073 * ((1697882597 - (v38 | 0x6533A1E5) + (v38 | 0x9ACC5E1A)) ^ 0x20582678)
                         - 976;
  *(void *)(v40 - 144) = v39;
  *(void *)(v40 - 136) = a25;
  (*(void (**)(uint64_t))(v36 + 8 * (v35 ^ 0xEDF)))(v40 - 144);
  *(_DWORD *)(v40 - 136) = (v35 ^ 0x20B) + 3804331 * (((~v38 & 0x8D35EC0E) - (~v38 | 0x8D35EC0F)) ^ 0x290F7C9) + 21;
  *(void *)(v40 - 144) = v39;
  *(void *)(v40 - 128) = a25;
  uint64_t v41 = (*(uint64_t (**)(uint64_t))(v36 + 8 * (v35 ^ 0xEAF)))(v40 - 144);
  return (*(uint64_t (**)(uint64_t))(v36
                                            + 8
                                            * ((((((v35 ^ 0x20B) - 1118) | 0x380) - 946) * (a23 == 0)) ^ ((v35 ^ 0x20B) + 108))))(v41);
}

uint64_t sub_100033F54@<X0>(int a1@<W4>, uint64_t a2@<X8>)
{
  *((unsigned char *)&STACK[0x2AC] + a2 - 704281290) = 82;
  return (*(uint64_t (**)(void))(v3 + 8 * ((2046 * ((unint64_t)(a2 - 704281289) < 0x38)) ^ (v2 + a1))))();
}

void sub_100033F98()
{
}

uint64_t sub_100033FA4@<X0>(unsigned int a1@<W8>)
{
  return (*(uint64_t (**)(void))(v3
                              + 8
                              * (((((*(unsigned char *)(v2 + a1) == 82) ^ ((v1 ^ 0xC7) + 1)) & 1)
                                * ((v1 - 178) ^ 0x37C)) ^ v1)))();
}

uint64_t sub_100033FF8()
{
  BOOL v5 = v1 + 1267621293 > 1239093617 || v1 + 1267621293 < v3 + ((v0 - 1387068373) & 0x52ACFE6B) - 908391577;
  return (*(uint64_t (**)(void))(v2 + 8 * (v0 ^ (2 * v5))))();
}

uint64_t sub_100034050@<X0>(uint64_t a1@<X8>)
{
  return (*(uint64_t (**)(void))(v4
                              + 8
                              * ((471
                                * (v3
                                 - a1
                                 + ((v2 - 1298) | 0x431u)
                                 + v1
                                 + (unint64_t)(331 * (v2 ^ 0x6D1u))
                                 - 0x1FA9E8BAFD94038ALL < 0x10)) ^ v2)))();
}

uint64_t sub_1000340B8()
{
  STACK[0x250] = v1;
  STACK[0x210] = v1 - 112;
  STACK[0x408] = v1 - 112;
  return v0();
}

uint64_t sub_1000340D8()
{
  return (*(uint64_t (**)(void))(v1 + 8 * ((1495 * (v2 == (v0 ^ 0x2FA) - 1158873110)) ^ (v0 - 1256))))();
}

void sub_100034114()
{
  uint64_t v0 = __chkstk_darwin();
  if (*(void *)(v0 + 24)) {
    BOOL v2 = *(void *)v0 == 0x3842FAF4B7C49EFFLL;
  }
  else {
    BOOL v2 = 1;
  }
  char v3 = v2;
  int v1 = *(_DWORD *)(v0 + 12) - 235795823 * (v0 ^ 0x94AD4959);
  __asm { BRAA            X9, X17 }
}

uint64_t sub_10003422C(uint64_t result)
{
  *(_DWORD *)(result + 16) = 573362254;
  return result;
}

uint64_t sub_100034248@<X0>(uint64_t result@<X0>, int a2@<W8>)
{
  *(_DWORD *)(result + 16) = a2;
  return result;
}

uint64_t sub_1000342C8(uint64_t a1)
{
  int v3 = (*(uint64_t (**)(void))(v1 + 17088))();
  if (v3 == 16) {
    unsigned int v4 = -42029;
  }
  else {
    unsigned int v4 = -42030;
  }
  if (v3) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  (*(void (**)(uint64_t))(v1 + 16984))(a1);
  return v5;
}

uint64_t sub_100034310(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, void))(v7
                                                                      + 8
                                                                      * (((((a6 - 1346) | 0x246) ^ 0x258) * (v6 > 0xF)) ^ a6)))(a1, a2, a3, 0);
}

uint64_t sub_100034344@<X0>(int a1@<W0>, unsigned int a2@<W1>, unsigned int a3@<W2>, uint64_t a4@<X3>, char a5@<W4>, int a6@<W5>, int a7@<W8>)
{
  BOOL v13 = a3 < a2;
  *(unsigned char *)(a4 + (a7 + a1)) = v8
                                           + 58
                                           + *(unsigned char *)(v12 + (v7 + v10))
                                           - (a5 & (2 * *(unsigned char *)(v12 + (v7 + v10))))
                                           + 33;
  unsigned int v14 = v7 + 1 + v9;
  int v15 = v13 ^ (v14 < a2);
  BOOL v16 = v14 < a3;
  if (!v15) {
    BOOL v13 = v16;
  }
  return (*(uint64_t (**)(void))(v11 + 8 * ((v13 * a6) ^ v8)))();
}

uint64_t sub_1000343AC(uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(uint64_t, void))(v6 + 8 * (v7 ^ 0xE5B)))(a1, 0);
  if (result == 16)
  {
    v3 -= 3;
    goto LABEL_7;
  }
  if (result == 12)
  {
LABEL_7:
    uint64_t result = (*(uint64_t (**)(uint64_t))(v6 + 8 * (v4 ^ 0xE91)))(a1);
    int v10 = v3;
    goto LABEL_8;
  }
  if (result)
  {
    v3 -= 2;
    goto LABEL_7;
  }
  void *v5 = a1;
  int v10 = -192463815;
LABEL_8:
  *(_DWORD *)(v1 + 4) = v10 ^ v2;
  return result;
}

uint64_t sub_10003443C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19)
{
  *(_DWORD *)(v24 - 104) = v20
                         - 1224239923
                         * ((-1904687679 - ((v24 - 120) | 0x8E78C5C1) + ((v24 - 120) | 0x71873A3E)) ^ 0x8334C7E9)
                         - 350;
  *(void *)(v24 - 120) = v23;
  *(void *)(v24 - 112) = a19;
  uint64_t v25 = (*(uint64_t (**)(uint64_t))(v21 + 8 * (v20 + 1547)))(v24 - 120);
  return (*(uint64_t (**)(uint64_t))(v21
                                            + 8
                                            * (int)((((v20 - 353) ^ 0x1D7 ^ (v20 + 84205336) & 0xFAFB1F9E) * (v22 == v19)) ^ v20)))(v25);
}

uint64_t sub_1000344F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44)
{
  LODWORD(a17) = HIDWORD(a12) + 184282734;
  v45.i64[0] = 0x5252525252525252;
  v45.i64[1] = 0x5252525252525252;
  return sub_1000377D0(v45, a1, a2, a3, a4, a5, 164, 26, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18,
           a19,
           a20,
           v44 - 16,
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
           a39,
           a40,
           a41,
           a42,
           a43,
           a44);
}

void sub_10003454C()
{
}

_DWORD *sub_100034558@<X0>(_DWORD *result@<X0>, int a2@<W8>)
{
  _DWORD *v2 = a2;
  *uint64_t result = 1158830272;
  return result;
}

uint64_t sub_10003456C@<X0>(uint64_t a1@<X0>, int a2@<W8>, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19)
{
  *(_DWORD *)(a19 + 4 * (int)(((a2 - 742) ^ 0xCA3DD304) + 901918594)) = -1293453008;
  BOOL v21 = v19 <= 0x59204B5C && (int)(v19 + 652193382 + a2 - 35) < 652194980;
  return (*(uint64_t (**)(uint64_t, uint64_t))(v20 + 8 * ((93 * !v21) ^ (a2 - 35))))(a1, 1495288668);
}

uint64_t sub_100034650()
{
  return (*(uint64_t (**)(void))(v4
                              + 8
                              * ((((v1 & (2 * (*(unsigned __int8 *)(v2 + 5) - 13)))
                                 + ((*(unsigned __int8 *)(v2 + 5) - 13) ^ v0) == v0)
                                * ((v3 ^ 0x359) + 477)) ^ v3)))();
}

uint64_t sub_100034690@<X0>(unsigned int a1@<W8>)
{
  uint64_t v3 = a1;
  unint64_t v4 = a1 - 1078471726;
  if (v4 <= 0x38) {
    unint64_t v4 = 56;
  }
  return (*(uint64_t (**)(void))(v2 + 8 * ((126 * (v4 - v3 + ((v1 - 136721719) & 0xBDAFBD83) - 1967218001 < 8)) ^ v1)))();
}

uint64_t sub_1000346FC(uint64_t a1, char a2)
{
  return (*(uint64_t (**)(void))(v2
                              + 8
                              * ((124
                                * (((((v3 - 207) | 0x501) ^ 0x7FBD927D) & (((a2 + 67) & 0x7F ^ 0x7FBD93FF)
                                                                         + 2 * ((a2 + 67) & 0x7F))) == 2143130624)) ^ (v3 + 696))))();
}

uint64_t sub_100034764@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X6>, uint64_t a7@<X7>, uint64_t a8@<X8>, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,int8x16_t *a36)
{
  *(int8x16_t *)(a6 + ((((v37 | 0x514u) - 713) ^ 0xFFFFFD71) & (v36 + a3))) = vaddq_s8(vsubq_s8(*a36, vandq_s8(vaddq_s8(*a36, *a36), v39)), v40);
  uint64_t v41 = *(uint64_t (**)(void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v38 + 8 * ((37 * (((a8 + 1) & 0x1FFFFFFF0) == 16)) ^ (v37 | 0x514)));
  return v41(v41, a1, a2, a3, a4, a5, a6, a7, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27);
}

uint64_t sub_1000347DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,int a22,int a23,char a24,_DWORD *a25,void *a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30)
{
  int8x16_t v32 = (int *)(a29 + 4 * v31);
  int v33 = *v32;
  LODWORD(v32) = -953638755 * ((*(_DWORD *)(*a26 + (*a25 & 0x9C34EB4)) ^ v32) & 0x7FFFFFFF);
  LODWORD(v32) = (v32 >> a24) ^ v32;
  unsigned int v34 = -953638755 * v32;
  *(_DWORD *)(a30 + 4 * v31) ^= v33 ^ *((_DWORD *)*(&off_10005CE90 + v30 - 969) + HIBYTE(v34)) ^ *((_DWORD *)*(&off_10005CE90 + a23)
                                                                                                 + HIBYTE(v34)
                                                                                                 - 1) ^ *((_DWORD *)*(&off_10005CE90 + a22) + HIBYTE(v34) - 2) ^ (-1600323584 * v32) ^ v34 ^ (-2081955537 * HIBYTE(v34));
  return sub_1000348A4();
}

uint64_t sub_1000348A4@<X0>(int a1@<W8>)
{
  BOOL v3 = ((a1 + 1090269979) & 0xBF03CE9F ^ 0xFFFFFBF1) + v1 == ((a1 + 435) | 8) - 1038;
  return (*(uint64_t (**)(void))(v2 + 8 * ((v3 | (4 * v3)) ^ a1)))();
}

uint64_t sub_1000348F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, unsigned int a9, unsigned int a10, uint64_t a11, int a12)
{
  int v17 = *(_DWORD *)(v12 - 0x3D8A64FC118460F2);
  unsigned int v18 = 1178560073 * (((&a9 | 0xB78A9F27) + (~&a9 | 0x487560D8)) ^ 0xD1EE744);
  a9 = v18 + 442457267;
  a10 = v17 + v18 + (((v16 - 305) | 0x722) ^ 0xBAF7DAD8);
  a12 = (v16 + 1613) ^ v18;
  a11 = v12;
  uint64_t v19 = (*(uint64_t (**)(unsigned int *))(v15 + 8 * (v16 + 1808)))(&a9);
  return (*(uint64_t (**)(uint64_t))(v15 + 8 * ((1415 * (*v14 == v13)) ^ v16)))(v19);
}

uint64_t sub_1000349BC@<X0>(int a1@<W8>)
{
  uint64_t result = (*(uint64_t (**)(void))(v3 + 8 * (a1 + 896)))(*v4);
  _DWORD *v2 = 0;
  *(_DWORD *)uint64_t v1 = 0;
  *(void *)(v1 + 344) = 0;
  *(void *)(v1 + 352) = 0;
  *(_DWORD *)(v1 + 360) = 1678813228;
  *(_DWORD *)(v1 + 56) = 1449096108;
  return result;
}

void sub_100034A08()
{
}

uint64_t sub_100034A10(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(v1
                                                     + 8
                                                     * ((93 * (((((v2 + 777) | 0x300) - 1583) ^ 0xD2) == 32)) ^ ((v2 + 777) | 0x300))))(a1, 644357898);
}

uint64_t sub_100034A88@<X0>(int a1@<W5>, int a2@<W8>)
{
  return (*(uint64_t (**)(void))(v4 + 8 * (int)(((((a1 + a2 - 1268) ^ 0xFFFFF9B8) + a1 + a2 - 1268) * (v3 == v2)) ^ a2)))();
}

uint64_t sub_100034AB8@<X0>(uint64_t a1@<X0>, int a2@<W3>, int a3@<W4>, int a4@<W5>, int a5@<W8>)
{
  *(unsigned char *)(*(void *)(a1 + 8) + (a4 + a5)) = ((a3 ^ v7) >> v8)
                                                            - (((a3 ^ v7) >> v8 << (121 * (a2 ^ 0xF1) - 106)) & 0xA4)
                                                            + 82;
  return (*(uint64_t (**)(void))(v5 + 8 * ((490 * (a4 - 1 != (a2 ^ 0xF1) + 1822 + v6)) ^ a2)))();
}

uint64_t sub_100034B28@<X0>(unsigned int a1@<W0>, int a2@<W1>, uint64_t a3@<X4>, uint64_t a4@<X8>)
{
  uint64_t v9 = a4 + 1;
  *(_DWORD *)(v8 + 4 * (v9 + ((v4 + v6) & a1)) - 228) = *(_DWORD *)(a3 + 4 * (*(_DWORD *)(v8 + 4 * v9 + 912) & 1)) ^ *(_DWORD *)(v8 + 4 * v9) ^ ((*(_DWORD *)(v8 + 4 * v9 + 912) & 0x7FFFFFFE | v5 & 0x80000000) >> 1);
  return (*(uint64_t (**)(void))(v7 + 8 * (((v9 == 395) * a2) ^ (v4 - 297))))();
}

uint64_t sub_100034B30@<X0>(int a1@<W8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t *a6, int a7, int a8, unint64_t *a9, int a10, unint64_t *a11, char a12, uint64_t a13)
{
  uint64_t v16 = *(void *)(v13 + 32);
  unsigned int v17 = 1224239923
      * (((&a6 | 0xB684D67) - &a6 + (&a6 & 0xF497B298)) ^ 0xF9DBB0B0);
  a12 = 100 - 51 * (((&a6 | 0x67) - &a6 + (&a6 & 0x98)) ^ 0xB0);
  a7 = (v15 - 175) ^ v17;
  a13 = v16;
  a9 = &STACK[0x513D873E067408FB];
  a11 = &STACK[0x43A9E9343BFE8E6F];
  a6 = &STACK[0x6CA88026133E1E16];
  a10 = (((2 * a1) & 0x5FDA736 ^ 0x5110012) + ((v15 + 360149366) ^ a1) + 2137997176) ^ v17;
  uint64_t v18 = (*(uint64_t (**)(unint64_t **))(v14 + 8 * (v15 + 1503)))(&a6);
  return (*(uint64_t (**)(uint64_t))(v14 + 8 * ((2033 * (a8 == -1158872075)) ^ v15)))(v18);
}

uint64_t sub_100034C60()
{
  int v5 = *(unsigned __int8 *)(*(void *)(v1 + 32) + (((v2 + 26) | 0x10u) ^ 0xF7068CA3C5208978) + v0)
     - *(unsigned __int8 *)(v4 + (((v2 + 26) | 0x10u) ^ 0xF7068CA3C5208978) + v0);
  return (*(uint64_t (**)(void))(v3
                              + 8
                              * ((502 * ((v5 ^ 0x7FEB69EF) - 645996768 + ((2 * v5) & 0xFFD6D3DE) != 1500137743)) ^ v2)))();
}

uint64_t sub_100034CE4(int a1)
{
  return (*(uint64_t (**)(void, void, void))(v4
                                                           + 8
                                                           * ((((((v1 & 0x18) == 0) ^ ((a1 | 0x38) + 69)) & 1)
                                                             * (((a1 | 0x38) - 955) ^ 0xBE)) ^ (a1 | 0x38))))(((a1 | 0x38) - 955) ^ 0x551u, (v2 - v3), ((a1 | 0x38) - 955) | 0x420u);
}

uint64_t sub_100034D34(uint64_t a1)
{
  return sub_100034D7C(a1, v1);
}

uint64_t sub_100034D7C@<X0>(int a1@<W0>, int a2@<W2>, int a3@<W5>, void *a4@<X6>, int a5@<W8>, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  uint64_t v24 = 4 * (v22 + v21);
  unint64_t v25 = ((v23 - 1430) ^ HIDWORD(v20) ^ v18)
      + v12 * (unint64_t)(*(_DWORD *)(*a4 + 4 * v21) ^ v14)
      + (*(_DWORD *)(a11 + v24) ^ v14);
  *(_DWORD *)(a11 + v24) = (v25 + a1 - (v15 & (2 * v25))) ^ v16;
  LODWORD(v24) = a2 + v21 + 255;
  LODWORD(v25) = (v13 > v11) ^ ((int)v24 < v17);
  BOOL v26 = (int)v24 < a3;
  if (v25) {
    BOOL v26 = v13 > v11;
  }
  return (*(uint64_t (**)(void))(v19 + 8 * ((v26 * a5) ^ v23)))();
}

uint64_t sub_100034E08@<X0>(unsigned int a1@<W0>, int a2@<W1>, uint64_t a3@<X6>, int a4@<W8>)
{
  BOOL v9 = v5 < a1;
  *((unsigned char *)&STACK[0x2AC] + (a4 - 1657738042)) = *(unsigned char *)(a3 + (v4 + a2))
                                                              - ((2 * *(unsigned char *)(a3 + (v4 + a2))) & 0xA4)
                                                              + 82;
  unsigned int v10 = ((v7 - 776898304) & 0x2E4E84BF) + v6 + v4;
  int v11 = v9 ^ (v10 < a1);
  BOOL v12 = v10 < v5;
  if (!v11) {
    BOOL v9 = v12;
  }
  return (*(uint64_t (**)(void))(v8 + 8 * ((370 * v9) ^ v7)))();
}

uint64_t sub_100034E98()
{
  return sub_100036C00();
}

uint64_t sub_100034EBC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return (*(uint64_t (**)(void))(v8 + 8 * ((62 * (a7 + 1 != v9 + 32)) ^ v7)))();
}

uint64_t sub_100034F90(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  (*(void (**)(uint64_t, uint64_t))(v26 + 8 * (v25 + v27 + 1507)))(a13, 2965982036);
  unsigned int v28 = (*(uint64_t (**)(void))(v26 + 8 * (v27 ^ (v27 + 2040))))();
  unsigned int *v24 = v28;
  uint64_t v29 = 1812433253 * (v28 ^ (v28 >> 30)) + 1;
  v24[1] = v29;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v26 + 8 * ((198 * (((v25 + v27 + 123) ^ 1) & 1)) ^ (v25 + v27 + 248))))(v29, v30, v31, v32, v33, v34, v35, v36, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24);
}

uint64_t sub_100035024()
{
  return (*(uint64_t (**)(void))(v0
                              + 8
                              * (int)(((*(unsigned __int8 *)(v2 + 1) == (((v3 + 32) | 0xC8) + 55))
                                     * ((v3 - 586043656) & 0xEBFFDDEF ^ (v1 + 373))) ^ v3)))();
}

uint64_t sub_100035078(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,int a26,int a27,unsigned __int8 a28,unint64_t a29)
{
  return sub_10000CC08(a2, a3, a5, a6, a7, a8, v29 - 16, a9, a10, a11, a12, a13, a14, a15, a16, a17, v30 - 180, a19, a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29);
}

uint64_t sub_100035088(uint64_t a1, uint64_t a2, int a3)
{
  _DWORD *v4 = v4[623];
  return (*(uint64_t (**)(void))(v5
                              + 8
                              * ((219
                                * (((v3 - 88) ^ (v6 - 1 == ((a3 + v3 - 88 - 579) ^ 0x3598DF49))) & 1)) ^ (v3 - 88))))();
}

void sub_1000350DC()
{
}

uint64_t sub_10003524C(uint64_t a1, uint64_t a2, int a3, unsigned int a4)
{
  return (*(uint64_t (**)(void))(v4 + 8
                                   * ((54 * ((((a3 + 1428) ^ (*(_DWORD *)(*v6 + 4 * a4) == v5)) & 1) == 0)) ^ a3)))();
}

uint64_t sub_100035284(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22)
{
  return sub_1000352A0(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22);
}

uint64_t sub_1000352A0@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X6>, uint64_t a6@<X7>, const char *a7@<X8>, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35)
{
  BOOL v48 = *(uint64_t (**)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))(v39 + 8 * v35);
  int v49 = STACK[0x2CC];
  uint64_t v50 = LODWORD(STACK[0x2D0]);
  unint64_t v84 = STACK[0x2CC];
  uint64_t v51 = LODWORD(STACK[0x2D4]);
  unsigned int v52 = STACK[0x2D8];
  int v53 = STACK[0x2D4];
  int v54 = STACK[0x2D8];
  int v55 = LOBYTE(STACK[0x2E4]) ^ 0xCF;
  HIDWORD(a26) = LOBYTE(STACK[0x2E4]) ^ 0xFFFFFFCF;
  if (v55 == 2)
  {
    unsigned int v83 = v48;
    uint64_t v71 = LODWORD(STACK[0x2DC]);
    int8x16x4_t v86 = vld4q_s8(a7);
    HIDWORD(a24) = STACK[0x2DC];
    uint8x16_t v72 = (uint8x16_t)veorq_s8(v86.val[1], v47);
    _Q17 = vmovl_u8(*(uint8x8_t *)v72.i8);
    _Q16 = vmovl_high_u8(v72);
    __asm
    {
      SHLL2           V18.4S, V16.8H, #0x10
      SHLL2           V19.4S, V17.8H, #0x10
    }
    int v77 = (_DWORD *)(v44 + 4 * (v43 + 637245503));
    int v78 = *(v77 - 8) ^ *(_DWORD *)(v44 + 4 * (v43 + 637245503 + a33) - 1816);
    int v79 = v78 + v40 - (v36 & (2 * v78));
    int v80 = *(v77 - 16) ^ *(v77 - 14);
    HIDWORD(v81) = v80 ^ 0x3AED03F5 ^ v79;
    LODWORD(v81) = v80 ^ ~v79;
    *int v77 = v40 + (v81 >> 31) - (v36 & (2 * (v81 >> 31)));
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, unint64_t, uint64_t (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void), uint64_t, unint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v39 + 8 * ((579 * (v45 == 637245440)) ^ HIDWORD(a32))))(v50, a1, a2, v71, a4, v51, a5, a6, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18,
             a19,
             a20,
             a21,
             a22,
             a23,
             a24,
             a25,
             a26,
             __PAIR64__(v52, v51),
             v83,
             a29,
             v84,
             a31,
             a32,
             a33,
             a34,
             a35);
  }
  else if (v55 == 1)
  {
    unint64_t v82 = __PAIR64__(v52, v51);
    int8x16x4_t v85 = vld4q_s8(a7);
    uint8x16_t v56 = (uint8x16_t)veorq_s8(v85.val[2], v47);
    _Q17 = vmovl_high_u8(v56);
    _Q16 = vmovl_u8(*(uint8x8_t *)v56.i8);
    __asm
    {
      SHLL2           V16.4S, V16.8H, #0x10
      SHLL2           V17.4S, V17.8H, #0x10
    }
    uint64_t v63 = v45 - 16;
    int v64 = (char *)*(&off_10005CE90 + (v37 ^ 0x780)) - 4;
    uint64_t v65 = (char *)*(&off_10005CE90 + v37 - 1683) - 4;
    int v66 = (v49 ^ v42)
        + a5
        + ((v50 ^ v38) & (v54 ^ (v42 + v41 - 2007)) | (v50 ^ v42) & (v53 ^ v42))
        + *(_DWORD *)&v65[4 * v63 + 4 * v43]
        + (*(_DWORD *)(v44 + 4 * (v64[v63 + v43] - 99)) ^ v40);
    uint64_t v67 = (uint64_t)*(&off_10005CE90 + v37 - 1772);
    unsigned int v68 = (v66 + v42 - (v46 & (2 * v66))) ^ v42;
    int v69 = ((v68 << (*(unsigned char *)(v67 + v63 + v43) - 57)) | (v68 >> (57 - *(unsigned char *)(v67 + v63 + v43)))) + (v50 ^ v42);
    return (*(uint64_t (**)(uint64_t, char *, char *, uint64_t, void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, unint64_t, uint64_t (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void), uint64_t, unint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v39 + 8 * v37))(v50, v64, v65, v67, v69 + v42 - (v46 & (2 * v69)), v45 - 15, a5, 637245503, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18,
             a19,
             a20,
             a21,
             a22,
             a23,
             a24,
             a25,
             a26,
             v82,
             v48,
             a29,
             v84,
             a31,
             a32,
             a33,
             a34,
             a35);
  }
  else
  {
    LODWORD(STACK[0x2CC]) = (v49 ^ v42) + (v84 ^ v42) + v42 - (v46 & (2 * ((v49 ^ v42) + (v84 ^ v42))));
    LODWORD(STACK[0x2D0]) = (v50 ^ v42)
                          + (HIDWORD(v84) ^ v42)
                          + v42
                          - (v46 & (2 * ((v50 ^ v42) + (HIDWORD(v84) ^ v42))));
    LODWORD(STACK[0x2D4]) = (v53 ^ v42) + (v51 ^ v42) + v42 - (v46 & (2 * ((v53 ^ v42) + (v51 ^ v42))));
    LODWORD(STACK[0x2D8]) = (v54 ^ v42) + (v52 ^ v42) + v42 - (v46 & (2 * ((v54 ^ v42) + (v52 ^ v42))));
    return v48(v50, a1, a2, a3, v50, v51, a5, a6, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18,
             a19,
             a20,
             a21,
             a22);
  }
}

void sub_100035688(int a1@<W3>, int a2@<W8>, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, int a19, int a20)
{
  LODWORD(STACK[0x2DC]) = (a1 ^ v20)
                        + (a20 ^ v20)
                        + v20
                        - (((a2 - 1233) ^ (v21 + 41)) & (2 * ((a1 ^ v20) + (a20 ^ v20))));
  JUMPOUT(0x1000356E0);
}

uint64_t sub_10003576C(int a1)
{
  return (*(uint64_t (**)(void))(v3
                              + 8
                              * (int)((((53 * (a1 ^ 0x3B1) + 298366853) & 0xEE374930 ^ 0x6D4)
                                     * ((v2 + v1) < 0x7FFFFFFF)) ^ a1)))();
}

void sub_1000357DC(int a1@<W8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  *(_DWORD *)(v9 - 140) = (~(1578338534 * (*(_DWORD *)(a9 + 32) - a1) + 1405330388) | 0x7B58E13F)
                        + 789169267 * (*(_DWORD *)(a9 + 32) - a1)
                        - 332046005;
  JUMPOUT(0x100003958);
}

uint64_t sub_100035908@<X0>(uint64_t a1@<X8>)
{
  return (*(uint64_t (**)(void))(v5
                              + 8
                              * (int)(((*(_DWORD *)(*(void *)(a1 - 0x4C6937770F4864B0)
                                                  + 4 * (v2 + v4 - 1)) != ((((v1 + 1419978580) & 0xAB5CD53E)
                                                                                          + 1691) ^ (v3 + 1477)))
                                     * ((v1 + 1419978580) & 0xAB5CD53E ^ 0x135)) ^ (v1 + 1419978580) & 0xAB5CD53E)))();
}

void sub_100035978()
{
}

uint64_t sub_100035980@<X0>(char a1@<W2>, char a2@<W3>, int a3@<W8>)
{
  return (*(uint64_t (**)(void))(v4 + 8 * ((414 * (((a3 == 24) ^ (a1 + a2 + v3 + 6 - 95)) & 1)) ^ v3)))();
}

void sub_1000359C4()
{
}

uint64_t sub_1000359EC@<X0>(uint64_t a1@<X1>, unint64_t a2@<X8>, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, int a11, unsigned int a12, uint64_t a13, uint64_t a14, int a15, int a16, uint64_t a17, uint64_t a18, uint64_t a19)
{
  unint64_t v24 = (v23 >> (v22 ^ 0xF9u)) + (a1 ^ HIDWORD(a2)) + (*(_DWORD *)(a19 + a6) ^ v19);
  *(_DWORD *)(a19 + 4 * a7) = v24 + ((v22 + 694) ^ (v19 + 399)) - (v20 & (2 * v24));
  *(_DWORD *)(a19 + a6) = HIDWORD(v24) | v19;
  BOOL v25 = a16 + 318542585 < a11;
  if (a12 > 0x1F3F6CC4 != a16 + 318542585 < -524250309) {
    BOOL v25 = a12 > 0x1F3F6CC4;
  }
  return (*(uint64_t (**)(void))(v21 + 8 * (v22 ^ (63 * v25))))();
}

uint64_t sub_100035AB4@<X0>(uint64_t a1@<X0>, int a2@<W1>, int a3@<W2>, int a4@<W8>)
{
  return sub_100034AB8(a1, 11 * (a3 ^ 0x737u), *(_DWORD *)(*v5 + 4 * (a2 - 644358140 + 11 * (a3 ^ 0x737))), v4, a4);
}

uint64_t sub_100035AEC@<X0>(uint64_t a1@<X8>)
{
  return (*(uint64_t (**)(void))(a1 + 8 * ((11 * (v1 != ((v2 - 1037) ^ 0x3D8))) ^ v2)))();
}

uint64_t sub_100035B18(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36)
{
  return sub_100004BD4(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
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
           a36);
}

uint64_t sub_100035B28(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,int a27,char a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
  if (a28 == 2)
  {
    BOOL v39 = LODWORD(STACK[0x2E0]) != (((a2 + 137) | 1) ^ 0x3E899CD1);
    return (*(uint64_t (**)(uint64_t))(v37 + 8 * ((v39 | (8 * v39)) ^ (a2 + 138))))(235795823);
  }
  else if (a28 == 1)
  {
    return (*(uint64_t (**)(uint64_t))(v37
                                              + 8
                                              * (((2
                                                 * (((LODWORD(STACK[0x2E0]) == 1049205778) ^ (a2 - 118)) & 1)) & 0xF7 | (8 * (((LODWORD(STACK[0x2E0]) == 1049205778) ^ (a2 - 118)) & 1))) ^ (a2 + 953))))(235795823);
  }
  else
  {
    unint64_t v40 = ((unint64_t)&a37 ^ 0x2DBE3DE45DDDEBF7)
        - 0x2C0C2404008880F7
        + (((void)&a37 << (((a2 + 11) | 0x92u) + 43)) & 0x5B7C7BC8BBBBD7E0);
    LOBYTE(STACK[0x2DF]) = (v40 ^ 0xBA) * (v40 + 17);
    return (*(uint64_t (**)(uint64_t))(v37
                                              + 8
                                              * ((47 * (((((a2 + 11) | 0x492) - 1120) | 9) == 218)) ^ ((a2 + 11) | 0x492))))(235795823);
  }
}

void sub_100035CBC()
{
}

uint64_t sub_100035D14()
{
  return (*(uint64_t (**)(void))(v4
                              + 8
                              * ((((v1 & (2 * (*(unsigned __int8 *)(v3 + 5) - 13)))
                                 + ((*(unsigned __int8 *)(v3 + 5) - 13) ^ v0) == v0)
                                * ((v2 - 1979032862) & 0x75F5A7BB ^ 0x6A9)) ^ v2)))();
}

uint64_t sub_100035D64@<X0>(int a1@<W8>)
{
  return (*(uint64_t (**)(void))(v1 + 8 * (((qword_100060D90 == 0) * (a1 ^ 0x5B0)) ^ 0x1DA)))();
}

uint64_t sub_100035DA8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v5
                                                                                + 8
                                                                                * ((1822
                                                                                  * (v4 < ((18 * (v6 ^ 0xF8u)) ^ 0xFFFFFFFFFFFFFED7)
                                                                                        + (v6 - 17))) ^ v6)))(a1, a2, a3, a4, v7);
}

uint64_t sub_100035DE8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,int a26,int a27,unsigned __int8 a28,unint64_t a29)
{
  int v30 = LOBYTE(STACK[0x308]) ^ 0xCF;
  if (v30 == 1)
  {
    unsigned int v39 = STACK[0x2EC];
    unsigned int v40 = STACK[0x2E8];
    char v41 = ((LODWORD(STACK[0x2EC]) >> 5) ^ 0xEF) - (a8 & (2 * ((LODWORD(STACK[0x2EC]) >> 5) ^ 0xEF)));
    char v42 = ((LODWORD(STACK[0x2EC]) >> 13) ^ 0x45) - (a8 & (2 * ((LODWORD(STACK[0x2EC]) >> 13) ^ 0x45)));
    LOBYTE(STACK[0x2E0]) = 8 * LOBYTE(STACK[0x2EC]) - ((LODWORD(STACK[0x2EC]) << (v29 - 66)) & 0xA0) + 82;
    LOBYTE(STACK[0x2E1]) = v41 + 82;
    int v35 = v29 + 1218;
    LOBYTE(STACK[0x2E2]) = v42 + 82;
    LOBYTE(STACK[0x2E3]) = ((v39 >> 21) ^ 0xD) + (~(v39 >> 20) | 0x5B) + 83;
    HIDWORD(v43) = ~v40;
    LODWORD(v43) = v39 ^ 0x20000000;
    LOBYTE(STACK[0x2E4]) = (v43 >> 29) - (a8 & (2 * (v43 >> 29))) + 82;
    LOBYTE(STACK[0x2E5]) = ((v40 >> 5) ^ 0x4F) - (a8 & (2 * ((v40 >> 5) ^ 0x4F))) + 82;
    LOBYTE(STACK[0x2E6]) = ((v40 >> 13) ^ 0x13) - 2 * (((v40 >> 13) ^ 0x13) & 0x5A ^ (v40 >> 13) & 8) + 82;
    unsigned int v44 = v40 >> 21;
    unsigned int v45 = (v40 >> 21) ^ 0xFFFFFFE9;
    char v46 = v45 & 0x56 ^ v44 & 4;
    char v37 = v45 + 82;
    char v38 = 2 * v46;
    goto LABEL_5;
  }
  int v31 = v29;
  if (v30 == 2)
  {
    unsigned int v32 = STACK[0x2E8];
    unsigned int v33 = STACK[0x2EC];
    char v34 = ((LODWORD(STACK[0x2E8]) >> 13) ^ 0x13)
        - 2 * (((LODWORD(STACK[0x2E8]) >> 13) ^ 0x13) & 0x5A ^ (LODWORD(STACK[0x2E8]) >> 13) & 8);
    int v35 = HIDWORD(a10) & 0x43D15F5B;
    LOBYTE(STACK[0x2E0]) = (BYTE4(a10) & 0x5B)
                         + ((LODWORD(STACK[0x2E8]) >> 21) ^ 0xE9)
                         - (a8 & (2 * ((LODWORD(STACK[0x2E8]) >> 21) ^ 0xE9)))
                         + 74;
    LOBYTE(STACK[0x2E1]) = v34 + 82;
    HIDWORD(v36) = ~v32;
    LODWORD(v36) = v33 ^ 0x20000000;
    LOBYTE(STACK[0x2E2]) = ((v32 >> 5) ^ 0x4F) - (a8 & (2 * ((v32 >> 5) ^ 0x4F))) + 82;
    LOBYTE(STACK[0x2E3]) = (v36 >> 29) - (a8 & (2 * (v36 >> 29))) + 82;
    LOBYTE(STACK[0x2E4]) = ((v33 >> 21) ^ 0xD) - (a8 & (v33 >> 20)) + 82;
    LOBYTE(STACK[0x2E5]) = ((v33 >> 13) ^ 0x45) + (~(2 * ((v33 >> 13) ^ 0x45)) | 0x5B) + 83;
    LOBYTE(STACK[0x2E6]) = ((v33 >> 5) ^ 0xEF) - (a8 & (2 * ((v33 >> 5) ^ 0xEF))) + 82;
    char v37 = 8 * v33 + 82;
    char v38 = (16 * v33) & 0xA0;
LABEL_5:
    int v31 = v35 - 1218;
    LOBYTE(STACK[0x2E7]) = v37 - v38;
  }
  return sub_10000CC08(a2, a3, a5, a6, a7, a8, v31 - 56, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19, a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29);
}

uint64_t sub_100036004(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8)
{
  BOOL v11 = a8 + 50347352 < (int)(v8 + 1355038107);
  if (a8 + 50347352 < -792445541 != v8 > (((199 * (v9 ^ 0x385) - 414) | 0x90) ^ 0x2F3BC4DCu)) {
    BOOL v11 = v8 > (((199 * (v9 ^ 0x385) - 414) | 0x90) ^ 0x2F3BC4DCu);
  }
  return (*(uint64_t (**)(void))(v10 + 8 * ((53 * v11) ^ v9)))();
}

uint64_t sub_100036088(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, int a16, int a17, uint64_t a18, unint64_t *a19, int a20,int a21)
{
  unsigned int v23 = 1755732067
      * ((2 * ((&a16 ^ 0x4D536147) & 0x46C3A983) - (&a16 ^ 0x4D536147) + 960255612) ^ 0xAAA98AE0);
  a18 = a11;
  a19 = &STACK[0x3842FAF4B7C49F17];
  a20 = v23 ^ 0x7F7DFDA0;
  a21 = v23 ^ 0x3EE104E0;
  a17 = v23 ^ 0x39C8F867;
  uint64_t v24 = (*(uint64_t (**)(int *))(v22 + 17192))(&a16);
  return (*(uint64_t (**)(uint64_t))(v22 + 8 * ((101 * (a16 != v21)) ^ 0x43F)))(v24);
}

void sub_100036180()
{
}

uint64_t sub_100036190(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,int a43,int a44)
{
  int v46 = ((((((a44 ^ 0xF0) - 37) | 0xD) ^ 0xE) + (_BYTE)a10) & 0xF) == 0 && a10 != 1566298317;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v44 + 8 * (((32 * v46) | (v46 << 6)) ^ a44 ^ 0x3F0)))(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
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
           a35);
}

void sub_1000361EC()
{
}

void sub_1000361F8()
{
}

uint64_t sub_1000363B8()
{
  return (*(uint64_t (**)(void))(v3 + 8 * ((1582 * (v2 + v1 + v0 + ((2 * v0) ^ 0x340u) - 609 < 0x7FFFFFFF)) ^ v0)))();
}

uint64_t sub_1000363F8@<X0>(unsigned __int8 a1@<W8>)
{
  *(_DWORD *)(v4 + 4 * v2) = v2 + (v1 ^ (v1 >> 30)) * v3;
  return (*(uint64_t (**)(void))(v6 + 8 * (v5 | (8 * (((v2 < 0x26F) ^ a1) & 1u)))))();
}

uint64_t sub_100036428()
{
  BOOL v4 = v1[6] == 0x5E2B99D919B8B1B6 || (v1[7] | v1[2]) == 0;
  return (*(uint64_t (**)(void))(v2
                              + 8 * (int)((v4 * ((v0 + 436490539) & 0xE5FBAEF7 ^ 0x251 ^ (53 * (v0 ^ 0x46E)))) ^ v0)))();
}

uint64_t sub_1000364A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  if (a31 == 2) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v31
  }
                                                                + 8
                                                                * (((LODWORD(STACK[0x304]) != 1049205778)
                                                                  * (((v32 + 1098) | 0x100) - 1408)) ^ (v32 + 902))))(a1, 235795823, a18);
  if (a31 != 1) {
    JUMPOUT(0x1000365E8);
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v31
                                                              + 8
                                                              * ((63
                                                                * (LODWORD(STACK[0x304]) != 3 * (v32 ^ 0x102)
                                                                                          + 1049204806)) ^ (v32 + 1354))))(a1, 235795823, a18);
}

uint64_t sub_100036624(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(v17
                                                     + 8
                                                     * ((684
                                                       * (*(_DWORD *)(a14 + 4 * (v16 + v18 + 1)) == ((v15 - 410367795) & 0x1875B463 ^ (v14 - 316)) + ((v15 - 1871859575) & 0x6F924DDD))) ^ (v15 - 402))))(353, 57);
}

uint64_t sub_1000366A0()
{
  *(_DWORD *)(v5 - 120) = v0
                        - 1224239923
                        * ((1780674782 - ((v5 - 136) | 0x6A22F0DE) + ((v5 - 136) | 0x95DD0F21)) ^ 0x676EF2F6)
                        - 521;
  *(void *)(v5 - 136) = v4;
  *(void *)(v5 - 128) = v1;
  uint64_t v6 = (*(uint64_t (**)(uint64_t))(v2 + 8 * (v0 ^ 0xB60)))(v5 - 136);
  return (*(uint64_t (**)(uint64_t))(v2
                                            + 8
                                            * ((1444
                                              * (v3 == ((98 * (v0 ^ 0x315) - 1045006308) & 0x3E4987E2 ^ 0x6F4D263E))) ^ v0)))(v6);
}

void sub_10003676C(int a1@<W1>, int a2@<W8>)
{
  if (a2 + v2 - 1 >= ((a1 + 1775310922) & 0x962EE7BB) + 2147481677) {
    int v6 = -v3;
  }
  else {
    int v6 = v5;
  }
  int *v4 = v6;
  JUMPOUT(0x10002AF2CLL);
}

uint64_t sub_1000367B0@<X0>(uint64_t a1@<X8>)
{
  *(unsigned char *)(a1 + (v6 + v4)) = *(unsigned char *)(v3 + (v6 + v4));
  return (*(uint64_t (**)(void))(v1 + 8 * (((v6 - 1 == v2) * v5) ^ v7)))(0);
}

uint64_t sub_1000367E0@<X0>(uint64_t a1@<X8>)
{
  BOOL v8 = v4 > 0x2B177F8E;
  uint64_t v9 = v6 - 350243763 + 17 * (v2 ^ 0x157u);
  *(unsigned char *)(a1 + v9) = *(unsigned char *)(v1 + v9);
  if (v8 == v6 - 1073203387 < v3) {
    BOOL v8 = v6 - 1073203387 < v5;
  }
  return (*(uint64_t (**)(void))(v7 + 8 * ((7 * v8) ^ v2)))();
}

uint64_t sub_100036858@<X0>(unsigned int a1@<W1>, uint64_t a2@<X8>)
{
  return (*(uint64_t (**)(void))(a2 + 8 * ((1308 * (*(_DWORD *)(*v3 + 4 * a1) == v2)) ^ v4)))();
}

void sub_100036898()
{
}

uint64_t sub_10003691C(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unint64_t a7)
{
  BOOL v10 = v7 < v8;
  uint64_t v11 = (a2 + 932);
  if (v10 == a3 - 0x43EE3A1708DEB46ALL < (v11 ^ a7)) {
    BOOL v10 = a3 - 0x43EE3A1708DEB46ALL < v7;
  }
  return (*(uint64_t (**)(void))(v9 + 8 * (int)((v10 * (v11 ^ 0x4DE)) | a2)))();
}

uint64_t sub_100036980(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, unint64_t *a16, int a17, unsigned int a18)
{
  a18 = 1704
      - 460628867
      * (((&a16 | 0xDBE923A9) - &a16 + (&a16 & 0x2416DC50)) ^ 0x977FA1D4);
  a16 = &STACK[0x6B8EF04F79262563];
  uint64_t v21 = (*(uint64_t (**)(unint64_t **))(v19 + 16928))(&a16);
  return (*(uint64_t (**)(uint64_t))(v19 + 8 * ((577 * (a17 == v18)) ^ v20)))(v21);
}

void sub_100036A14()
{
}

uint64_t sub_100036A20()
{
  return (*(uint64_t (**)(void))(v4
                              + 8
                              * ((1405
                                * ((v1 & (2 * (*(unsigned __int8 *)(v2 + 1) - 134)))
                                 + ((*(unsigned __int8 *)(v2 + 1) - 134) ^ v0) == v0 + ((v3 - 403) | 8) - 520)) ^ v3)))();
}

uint64_t sub_100036A64(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  unsigned int v8 = a5 + ((v5 + 568162112) & 0xDE2281D7 ^ 0x40D77001);
  BOOL v9 = v7 + 1200789074 < v8;
  if ((v7 + 1200789074) < 0x8A0F47FC != v8 < ((v5 - 791472323) & 0x2F2CE34E ^ 0x8A0F45BA)) {
    BOOL v9 = v8 < ((v5 - 791472323) & 0x2F2CE34E ^ 0x8A0F45BA);
  }
  return (*(uint64_t (**)(void))(v6 + 8 * ((83 * v9) ^ v5)))();
}

uint64_t sub_100036B00(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, int a18, int a19)
{
  return (*(uint64_t (**)(void))(v20
                              + 8
                              * (((((v19 - 1168) | 0x10) - 88) * (((a5 - 1228396326) & 0xFFFFFFFC) - a19 != -1228396330)) ^ (v19 - 25))))();
}

void sub_100036B48()
{
}

uint64_t sub_100036B80@<X0>(unsigned int a1@<W0>, int a2@<W8>)
{
  BOOL v8 = v6 < a1;
  unsigned int v9 = v7 + a2 + 1464;
  int v10 = v8 ^ (v9 < (v2 ^ v3) + v7);
  BOOL v11 = v9 < v6;
  if (!v10) {
    BOOL v8 = v11;
  }
  return (*(uint64_t (**)(void))(v5 + 8 * ((v8 * v4) ^ v2)))();
}

uint64_t sub_100036BC8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,int a32)
{
  *(_DWORD *)(v32 - 224) ^= a32;
  return sub_100045008();
}

void sub_100036BE4()
{
}

void sub_100036BF0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_DWORD *)(a3 + v4) = v3;
  JUMPOUT(0x10002EE10);
}

uint64_t sub_100036C00()
{
  return sub_100036C20(v0);
}

uint64_t sub_100036C20@<X0>(int a1@<W2>, void *a2@<X8>)
{
  uint64_t v13 = (v3 - a1 + 1237);
  uint64_t v14 = v13 + v4 + 0x43EE3A1708DEAF95;
  int v15 = *(unsigned __int8 *)(*a2 + v6 + 0x43EE3A17E455A7DALL)
      - (*(unsigned __int8 *)(v2 + v6 + 0x43EE3A17E455A7DALL) ^ v11);
  BOOL v17 = (v15 ^ v5) + (v9 & (2 * v15)) + v12 != v10 || v14 == 0x43EE3A17E455A7DALL;
  return (*(uint64_t (**)(void))(v8 + 8 * (int)((v17 * v7) ^ v13)))();
}

uint64_t sub_100036C9C@<X0>(uint64_t a1@<X3>, uint64_t a2@<X4>, uint64_t a3@<X5>, uint64_t a4@<X6>, int a5@<W8>)
{
  v11.i64[0] = 0xA4A4A4A4A4A4A4A4;
  v11.i64[1] = 0xA4A4A4A4A4A4A4A4;
  v12.i64[0] = 0x5353535353535353;
  v12.i64[1] = 0x5353535353535353;
  *(int8x16_t *)(v8 + v5 + a5 + 2 * (v6 ^ 0x14u)) = vaddq_s8(vaddq_s8(*v10, v12), vmvnq_s8(vandq_s8(vaddq_s8(*v10, *v10), v11)));
  uint64_t v13 = *(uint64_t (**)(uint64_t, int8x16_t *, void, uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 8 * ((1957 * (((v7 + 1) & 0x1FFFFFFF0) == 16)) ^ v6));
  return v13(1957, v10 + 1, v13, a1, a2, a3, a4);
}

uint64_t sub_100036D18()
{
  return (*(uint64_t (**)(void))(v4
                              + 8
                              * ((((v1 & (2 * (*(unsigned __int8 *)(v2 + 7) - 1)))
                                 + ((*(unsigned __int8 *)(v2 + 7) - 1) ^ v0) == v0)
                                * ((v3 ^ 0x19B) + 697)) ^ v3)))();
}

uint64_t sub_100036D54()
{
  return (*(uint64_t (**)(void))(v5
                              + 8
                              * (((*(_DWORD *)(v0 + 4 * (v2 + v4 - 1)) != ((v1 + 1691) ^ (v3 + 1477)))
                                * (v1 ^ 0x135)) ^ v1)))();
}

uint64_t sub_100036D98()
{
  int v3 = *(_DWORD *)(v1 - 0x3D8A64FC118460F2)
     - (((*(_DWORD *)(v1 - 0x3D8A64FC118460F2) << (((v0 + 114) & 0x3B) - 58)) + 1483978864) & 0x631A08C0)
     - 574168936;
  BOOL v4 = ((2 * v3) & 0xBD997A4E ^ 0x21180840) + ((v0 - 1807217038) ^ 0xFB09B6B8 ^ v3) - 339772674 == 1250703397;
  return (*(uint64_t (**)(void))(v2 + 8 * ((v4 | (2 * v4)) ^ v0)))();
}

uint64_t sub_100036E5C@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  *(unsigned char *)(*(void *)(a2 + 96) + 448) = *(unsigned char *)(*(void *)(a1 + 8) + 12);
  return (*(uint64_t (**)(void))(v2 + 10648))(0);
}

uint64_t sub_100036EB8@<X0>(uint64_t a1@<X8>, uint64_t a2)
{
  return sub_100036F34(a2 - 0x4C6937770F4864B0, a1 - 0x4C6937770F4864B0, 0x91A6814AE6664F8ELL, 0x7FD9FFF73BBBB9F7, 2004317166, 0xEE7F7EBDDDDDF67BLL, 1070);
}

uint64_t sub_100036F34(void *a1, void *a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7)
{
  uint64_t v18 = 4 * (v15 + v13);
  int v19 = v7 + a3 + (*(_DWORD *)(*a1 + v18) ^ v10);
  *(_DWORD *)(*a2 + v18) = v19 + v14 - ((v17 + v12 + 663 - 1547) & (2 * v19));
  int v20 = v15 + 1 + v8;
  BOOL v22 = v20 > v9 || v20 < v11;
  return (*(uint64_t (**)(void))(v16 + 8 * ((v22 * a7) ^ v12)))();
}

void sub_100036FA8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8)
{
  *(_DWORD *)(v9 - 128) = v10;
  *(_DWORD *)(v9 - 140) = (((a8 - 30) | 4) ^ 0xFFFFFDCC) & v8;
  *(_DWORD *)(v9 - 136) = v8;
  JUMPOUT(0x100037020);
}

void sub_1000370F4()
{
}

uint64_t sub_10003710C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, int a9@<W8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,int a22)
{
  a22 = (((v22 + 68959487) | 0x402341) ^ (v23 - 1263)) + a9;
  uint64_t v25 = *(&a22 + 6 * (a9 - 145079879) + 2) + (int)a8;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v24 + 8 * ((4 * ((v25 & 0xFFFFFFFFFFFFFFELL) == 2)) | (8 * ((v25 & 0xFFFFFFFFFFFFFFELL) == 2)) | v22)))(a1, a2, a3, a4, a5, a6, a7, a8, a10, a11, a12, a13);
}

uint64_t sub_1000371C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  int v9 = v5 ^ 0x7D8;
  unsigned int v10 = v6 + v4 - 2063400874;
  if (v10 <= 0x40) {
    int v11 = 64;
  }
  else {
    int v11 = v10;
  }
  BOOL v12 = __CFADD__(v10 - 1, v7 + (((v9 ^ 0x10F) + 840) ^ 0x7AFCF8B8) + v11);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v8 + 8 * ((474 * v12) ^ v9)))(a1, a2, a3, a4, 829712093);
}

void sub_10003723C()
{
}

void sub_100037244()
{
}

uint64_t sub_10003724C()
{
  return (*(uint64_t (**)(void))(v4
                              + 8
                              * ((1510
                                * ((v3 & (2 * (*(unsigned __int8 *)(v1 + 7) - 1)))
                                 + ((*(unsigned __int8 *)(v1 + 7) - 1) ^ v0) == v0)) ^ v2)))();
}

uint64_t sub_100037288()
{
  return (*(uint64_t (**)(void))(v4
                              + 8
                              * ((1352
                                * ((v1 & (2 * (*(unsigned __int8 *)(v2 + 8) - 4)))
                                 + (v3 ^ 0x359 ^ (v0 + 341) ^ (*(unsigned __int8 *)(v2 + 8) - 4)) == v0)) ^ v3)))();
}

uint64_t sub_1000372D0(uint64_t a1, uint64_t a2, int a3)
{
  return (*(uint64_t (**)(void))(v3 + 8 * ((93 * (v4 + 8 == ((a3 - 1583) ^ 0xD2))) ^ a3)))();
}

uint64_t sub_100037304()
{
  return sub_10003C4D8();
}

void sub_100037324(uint64_t a1)
{
  *(_DWORD *)(*(void *)(a1 + 24) - 0x2801F3359A3B3C4) = v3;
  _DWORD *v1 = v2;
  JUMPOUT(0x10000C074);
}

uint64_t sub_100037344()
{
  int v3 = v1 - (((v2 + 603437216) & 0x5C0842FF ^ 0x33F9AF3A) & (2 * v1 + 764432812)) + 1355087704;
  return (*(uint64_t (**)(void))(v0
                              + 8
                              * ((74
                                * ((((v2 + 1244782929) & 0xB5CE1F5B ^ 0xEF77B0D5) & (2 * v3) ^ 0x2371A504)
                                 + (v3 ^ 0xEE470D4D)
                                 - 1353209987 == 655590220)) ^ v2)))();
}

uint64_t sub_100037400(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  return (*(uint64_t (**)(void))(v7 + 8 * (((((v6 - 1285950586) & 0x5FFFEFEA) - a4 + 196) * (v5 == v4)) ^ v6)))();
}

void sub_100037444(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, unsigned __int8 *a9)
{
  int v11 = ((*a9 ^ 0x52) << 24) | ((a9[1] ^ 0x52) << 16) | ((a9[2] ^ 0x52) << 8) | a9[3] ^ 0x52;
  *(_DWORD *)(*(void *)(v9 + 8) - 0x6A5823FD3C5DCA9CLL) = v11 + v10 - ((2 * v11) & 0x75DA07EA);
  sub_10003C278();
}

void sub_1000374B0()
{
}

uint64_t sub_1000374B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return sub_100027474(a1, a2, a3, 1249277568, a5, a6, 1977223146);
}

uint64_t sub_1000374D0(uint64_t a1, uint64_t a2, unsigned int a3)
{
  unsigned int v6 = *(unsigned __int8 *)(a2 + 8) + (a3 ^ 0xFFFFFF1A);
  return (*(uint64_t (**)(void))(v3 + 8 * ((1065 * ((v5 & (2 * v6)) + (v6 ^ v4) == v4)) ^ a3)))();
}

uint64_t sub_100037510(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  *(void *)(v16 - 128) = a14;
  *(void *)(v16 - 112) = &STACK[0x4C6937770F4864F8];
  *(_DWORD *)(v16 - 120) = v15
                         - 84
                         + 3804331 * ((((v16 - 128) | 0xFE067FB4) - ((v16 - 128) & 0xFE067FB4)) ^ 0x71A36472)
                         - 1;
  (*(void (**)(uint64_t))(v14 + 8 * ((v15 - 84) ^ 0xC9E)))(v16 - 128);
  *(_DWORD *)(v16 - 120) = v15
                         - 84
                         + 3804331 * ((((v16 - 128) | 0x5611C0B8) - ((v16 - 128) & 0x5611C0B8)) ^ 0xD9B4DB7E)
                         + 481;
  *(void *)(v16 - 128) = a14;
  *(void *)(v16 - 112) = a13;
  uint64_t v17 = (*(uint64_t (**)(uint64_t))(v14 + 8 * (v15 + 833)))(v16 - 128);
  return (*(uint64_t (**)(uint64_t))(v14
                                            + 8
                                            * (((((v15 - 85) ^ (*(_DWORD *)(v16 - 116) > 0x76FA18A2u)) & 1)
                                              * ((178 * ((v15 - 84) ^ 0x4A8)) ^ 0x364)) ^ (v15 - 84))))(v17);
}

uint64_t sub_10003764C@<X0>(int a1@<W8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  return sub_1000376C4(2476915504, a2 - 0x6E06359E347AB90DLL, a14 - 0x4C6937770F4864B0, (v14 + 242450133), (a1 + 1905031794), v14 - 1);
}

uint64_t sub_1000376C4()
{
  return (*(uint64_t (**)(void))(v1 + 8 * (v2 ^ (15 * (v0 > 1)))))();
}

uint64_t sub_10003773C@<X0>(int a1@<W8>)
{
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v2 + 8 * (a1 ^ 0x8FDu));
  return v3(v1);
}

void sub_100037770()
{
}

uint64_t sub_1000377C8()
{
  return sub_1000377D0();
}

uint64_t sub_1000377D0(int8x16_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45)
{
  int v53 = *(uint64_t (**)(void, void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v49 + 8 * v47);
  HIDWORD(a21) = HIDWORD(a34);
  int v54 = BYTE4(a37) ^ 0xCF;
  HIDWORD(a17) = BYTE4(a37) ^ 0xFFFFFFCF;
  if (v54 == 2)
  {
    HIDWORD(a18) = a35;
    uint64_t v77 = *(void *)(v49 + 8 * v47);
    uint64_t v66 = 463 * (a5 ^ (a5 + 4));
    int8x16x4_t v79 = vld4q_s8(v46);
    HIDWORD(a15) = HIDWORD(a36);
    uint8x16_t v67 = (uint8x16_t)veorq_s8(v79.val[1], a1);
    _Q21 = vmovl_u8(*(uint8x8_t *)v67.i8);
    _Q20 = vmovl_high_u8(v67);
    __asm
    {
      SHLL2           V22.4S, V20.8H, #0x10
      SHLL2           V23.4S, V21.8H, #0x10
    }
    uint8x16_t v72 = (_DWORD *)(v45 + 4 * (v51 + 1572325417));
    int v73 = *(v72 - 8) ^ *(v72 - 3);
    int v74 = v73 + v50 - (v48 & (2 * v73));
    int v75 = *(v72 - 16) ^ *(v72 - 14);
    HIDWORD(v76) = (v66 - 162) ^ v75 ^ 0x3AED056F ^ v74;
    LODWORD(v76) = v75 ^ ~v74;
    _DWORD *v72 = (v76 >> 31) + v50 - (v48 & (2 * (v76 >> 31)));
    return (*(uint64_t (**)(void, void, uint64_t, uint64_t, void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, unint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v49 + 8 * (int)((120 * (v52 != 1572325354)) ^ v66)))(HIDWORD(v76), HIDWORD(a35), 82301862, v66, HIDWORD(a36), a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, __PAIR64__(a36, HIDWORD(a35)), v77,
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
             a39,
             a40,
             a41,
             a42,
             a43,
             a44,
             a45);
  }
  else if (v54 == 1)
  {
    HIDWORD(a18) = a35;
    int8x16x4_t v78 = vld4q_s8(v46);
    uint64_t v55 = (a6 + a5 - 82);
    uint8x16_t v56 = (uint8x16_t)veorq_s8(v78.val[2], a1);
    _Q21 = vmovl_high_u8(v56);
    _Q20 = vmovl_u8(*(uint8x8_t *)v56.i8);
    __asm
    {
      SHLL2           V20.4S, V20.8H, #0x10
      SHLL2           V21.4S, V21.8H, #0x10
    }
    uint64_t v63 = (char *)*(&off_10005CE90 + (int)(v55 ^ 0x1A9)) - 4;
    int v64 = (char *)*(&off_10005CE90 + (int)v55 - 122) - 4;
    return (*(uint64_t (**)(void, void, uint64_t, char *, char *, uint64_t, void, void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, unint64_t, uint64_t (*)(void, void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t), uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v49 + 8 * (int)((170 * (a22 + 1 != v52)) ^ v55)))(*(_DWORD *)(v45 + 4 * (v63[a22 + v51] - 99)) ^ v50, HIDWORD(a35), 324658922, v63, v64, v55, *(unsigned int *)&v64[4 * a22 + 4 * v51], *(&off_10005CE90 + (int)(v55 ^ 0x155)), a10, a11, a12, a13, a14, a15, a16, a17, a18, __PAIR64__(a36, HIDWORD(a35)), v53,
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
             a39,
             a40,
             a41,
             a42,
             a43,
             a44,
             a45);
  }
  else
  {
    return v53(HIDWORD(a35), HIDWORD(a35), a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19, a20,
             a21,
             a22,
             a23,
             a24,
             a25,
             a26,
             a27);
  }
}

void sub_100037BE0()
{
}

uint64_t sub_100037CD8@<X0>(uint64_t a1@<X8>)
{
  return (*(uint64_t (**)(void))(a1 + 8 * ((168 * (v1 == 1228396329)) ^ 0x13Cu)))();
}

uint64_t sub_100037D04(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, int a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, int a20,unsigned int a21,uint64_t a22,unsigned char *a23)
{
  uint64_t v25 = *(unsigned char **)(a8 + 96);
  v25[1167] = a23[19];
  v25[1166] = a23[18];
  v25[1165] = a23[17];
  v25[1164] = a23[16];
  v25[1163] = a23[15];
  v25[1162] = a23[14];
  v25[1161] = a23[13];
  v25[1160] = a23[12];
  v25[1159] = a23[11];
  v25[1158] = a23[10];
  v25[1157] = a23[9];
  v25[1156] = a23[8];
  v25[1155] = a23[7];
  v25[1154] = a23[6];
  v25[1153] = a23[5];
  v25[1152] = a23[4];
  v25[1151] = a23[3];
  v25[1150] = a23[2];
  v25[1149] = a23[1];
  v25[1148] = *a23;
  return (*(uint64_t (**)(void))(v24
                                           + 8
                                           * (((((((49 * (v23 ^ 0x225) - 218) | 1) - a5 + 345346976) & 0x57F0F797) - 506)
                                             * (*(_DWORD *)(a8 + 72) == a6)) ^ ((49 * (v23 ^ 0x225) - 218) | 1))))(a21);
}

uint64_t sub_100037E24(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3
                                                              + 8
                                                              * (int)(((v4 > ((v2 - 1425701027) & 0x13DA7BF ^ 0x95B4F219))
                                                                     * ((v2 - 1015099579) & 0xE8C45F7F ^ 0x58C)) ^ (v2 - 1404883171))))(a1, a2, 1404883838);
}

uint64_t sub_100037EA4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25)
{
  *(void *)(v30 - 144) = v28;
  *(void *)(v30 - 136) = v26;
  *(_DWORD *)(v30 - 104) = v25
                         + 235795823
                         * ((((2 * ((v30 - 144) ^ 0x6B10807E)) | 0xC27ADE42) - ((v30 - 144) ^ 0x6B10807E) - 1631416097) ^ 0x9E80A606)
                         - 40;
  *(void *)(v30 - 128) = a25;
  *(void *)(v30 - 120) = a20;
  *(void *)(v30 - 112) = a24;
  uint64_t v31 = (*(uint64_t (**)(uint64_t))(v27 + 8 * (v25 ^ 0x8DD)))(v30 - 144);
  return (*(uint64_t (**)(uint64_t))(v27
                                            + 8
                                            * ((7
                                              * (v29
                                               + ((v25 - 1916068607) & 0x7234E7FC)
                                               - 616
                                               + ((2 * ((v25 - 1916068607) & 0x7234E7FC)) ^ 0xE3FA578B) > 0x7FFFFFFE)) ^ (((v25 - 1916068607) & 0x7234E7FC) + 81))))(v31);
}

uint64_t sub_100037F90(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 8 * (v6 ^ (22 * (v5 == 0)))))(a1, a2, a3, a4, a5);
}

uint64_t sub_100037FC0(uint64_t a1, uint64_t a2, int a3)
{
  return (*(uint64_t (**)(void))(v6
                                           + 8
                                           * ((((v3 & 0x18) == ((a3 - 126) ^ 0x220) - 208)
                                             * (6 * ((a3 - 126) ^ 0x25E) - 619)) ^ (a3 - 126))))((v4 - v5));
}

uint64_t sub_100038008(uint64_t a1, uint64_t a2, int a3, uint64_t a4, int a5, int a6)
{
  int v11 = *(unsigned __int8 *)(v6 + (v9 + a5)) | (a3 << 8);
  return (*(uint64_t (**)(uint64_t, uint64_t, void))(v7 + 8 * ((145 * (v8 - 1 == a6)) ^ v10)))(a1, a2, ((v11 - 936847616) ^ 0x6B7FD76D) - 575144004 + (((v11 - 936847616) << (v10 - 104)) & 0xD6FFAEDA));
}

uint64_t sub_100038078(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7)
{
  return (*(uint64_t (**)(void))(v7
                                           + 8
                                           * ((((v11 - v9 - 945) ^ (v8 + 1392) ^ (v11 - 759)) * (v10 == a7)) ^ v11)))(0);
}

uint64_t sub_1000380B0@<X0>(uint64_t a1@<X4>, unint64_t a2@<X8>, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, unsigned int a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19)
{
  return sub_100019428(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19);
}

uint64_t sub_1000380B8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, int a9@<W8>, uint64_t a10)
{
  uint64_t v13 = *(void *)(v11 + 16);
  *(_DWORD *)(v10 - 0x56D617B809C7B315) = 0;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v12 + 8 * (((v13 != 0x4C6937770F4864B8) | (4 * (v13 != 0x4C6937770F4864B8))) ^ a9)))(a1, a2, a3, a4, a5, a6, a7, a8, a10);
}

uint64_t sub_100038160(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, int a16, unsigned int a17)
{
  if (a17 < 0x706F2EB1 != (v19 + 832282161) < 0x706F2EB1) {
    BOOL v20 = (v19 + 832282161) < 0x706F2EB1;
  }
  else {
    BOOL v20 = v19 + 832282161 > a17;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v17
                                                     + 8
                                                     * (((2 * ((((v18 ^ (v18 + 6)) + 119) ^ v20) & 1)) & 0xFB | (4 * ((((v18 ^ (v18 + 6)) + 119) ^ v20) & 1))) ^ (a4 + v18 + 1440))))(a1, 3240914752);
}

uint64_t sub_1000381EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9, int a10, uint64_t a11)
{
  *(void *)(v16 - 136) = v13;
  *(void *)(v16 - 128) = v13;
  *(_DWORD *)(v16 - 104) = v15
                         + 1225351577 * ((2 * ((v16 - 136) & 0x9FAC850) - (v16 - 136) - 167430226) ^ 0x88FAAD9C)
                         - 787;
  *(void *)(v16 - 120) = a11;
  *(void *)(v16 - 112) = v12;
  uint64_t v17 = (*(uint64_t (**)(uint64_t))(v14 + 8 * (v15 ^ 0xD74)))(v16 - 136);
  return (*(uint64_t (**)(uint64_t))(v14
                                            + 8
                                            * ((255
                                              * (((((((v15 - 1284) | 0x218) - 16851653) ^ ((v11 - 1560199605) >> 1))
                                                 + ((v11 - 1560199605) & 0xFDFDBF6E)
                                                 + 16851017) & a10) == 0)) ^ v15)))(v17);
}

uint64_t sub_1000382D4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, int a9@<W8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void, uint64_t, uint64_t, uint64_t))(v15 + 8 * ((((197 * (a9 ^ 0x37E)) ^ 0x3DF) * (v14 != 0)) ^ a9)))(a1, a2, a3, a4, a5, a6, a7, a8, a10, *(void *)(a1 + 32), a12, a13, a14);
}

uint64_t sub_100038330(uint64_t a1, int a2)
{
  return (*(uint64_t (**)(void))(v4
                              + 8
                              * ((23
                                * (v2 + ((258 * v3) ^ (v5 + 1548)) + ((258 * v3 - 1524) | 0x105u) + 195224802 < v2 + a2)) ^ (258 * v3))))();
}

uint64_t sub_100038398()
{
  return (*(uint64_t (**)(uint64_t))(v0 + 14704))(3136095221);
}

uint64_t sub_1000384C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, int a15, int a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25)
{
  int v28 = 1755732067 * ((-1664490172 - ((v27 - 160) | 0x9CC9E544) + ((v27 - 160) | 0x63361ABB)) ^ 0xBDF0A760);
  *(void *)(v27 - 160) = a25;
  *(_DWORD *)(v27 - 152) = v28 + v26 + 245;
  *(_DWORD *)(v27 - 148) = a16 - v28;
  uint64_t v29 = (*(uint64_t (**)(uint64_t))(v25 + 8 * (v26 + 2046)))(v27 - 160);
  uint64_t v30 = STACK[0x2EC] & (223 * (v26 ^ 0x33) - 1052);
  *((unsigned char *)&STACK[0x2A8] + (v30 ^ 0x20)) = -46;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v25
                                                              + 8
                                                              * ((1729 * ((v30 ^ 0x20) > 0x37)) | v26)))(v29, -162308310, 4111790164);
}

void sub_1000385E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, int a11)
{
  uint64_t v13 = *(void *)(v11 + 48);
  *(void *)(*(void *)(v11 + 8) - 0x7B8F2B3A773DA590) = v12;
  *(_DWORD *)(v13 - 0x13E505825523B707) = a11;
  JUMPOUT(0x10003861CLL);
}

void sub_100038658()
{
}

uint64_t sub_100038664@<X0>(uint64_t a1@<X8>)
{
  return (*(uint64_t (**)(void))(a1
                              + 8
                              * ((180
                                * ((((v4 - 108) ^ (v1 + ((v4 - 108) ^ 0x2DA) + v2 + v4 - 108 + v3 - 803 - 695 >= 0)) & 1) == 0)) ^ (v4 - 108))))();
}

void sub_1000386B8()
{
}

void sub_1000386E0()
{
}

uint64_t sub_10003872C()
{
  return (*(uint64_t (**)(void))(v0
                              + 8
                              * ((219
                                * (((v2 + 63) ^ (v1 - 1004986468 < ((v2 + 2042620556) & 0x864011FF ^ 0xFFFFFF10))) & 1)) ^ v2)))();
}

uint64_t sub_100038788@<X0>(int a1@<W8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13)
{
  int v17 = a1 + 780;
  int v18 = 108757529 * ((((v16 - 144) | 0x1284A53F) - (v16 - 144) + ((v16 - 144) & 0xED7B5AC0)) ^ 0xF218C714);
  *(void *)(v16 - 136) = &a13 + v13;
  *(_DWORD *)(v16 - 144) = (a1 + 1632) ^ v18;
  *(_DWORD *)(v16 - 140) = v18 ^ 0x245380BD;
  uint64_t v19 = (*(uint64_t (**)(uint64_t))(v14 + 8 * ((a1 + 780) ^ 0xC06)))(v16 - 144);
  return (*(uint64_t (**)(uint64_t))(v14
                                            + 8
                                            * ((((((v17 - 821) | 0x202) + 9) ^ (2 * v17) ^ 0xB88) * (v15 == 0)) ^ (v17 + 957))))(v19);
}

uint64_t sub_10003884C()
{
  *(void *)(v1 - 0x118FD125AD18CD5CLL) = (*v3 - 1405494216)
                                         + *(void *)(v2 - 0x3D8A64FC11846102)
                                         + 8;
  return (*(uint64_t (**)(void))(v6 + 8 * ((7 * (*v5 == v4)) ^ v0)))();
}

uint64_t sub_1000388B0()
{
  return (*(uint64_t (**)(void))(v2
                              + 8
                              * ((26 * (v1 == (((v3 - 363) | 0x710) ^ (v0 - 1088)) + ((v3 - 1831971410) & 0x6D31AFF6))) ^ v3)))();
}

uint64_t sub_100038918(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(v6 + 8 * ((39 * (((a5 + 1) & 0x7FFFFFE0) != v7)) ^ v5)))();
}

uint64_t sub_1000389F8(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  return (*(uint64_t (**)(void))(v7 + 8 * (int)(((a4 + ((v4 - 1078208970) & 0xF5CDAD81) + 38) * (v6 == v5)) ^ v4)))();
}

void sub_100038A34()
{
}

void sub_100038AA8()
{
}

void sub_100038B64()
{
}

uint64_t sub_100038B70(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, uint64_t a7)
{
  return (*(uint64_t (**)(void))(v8 + 8 * ((1878 * (a7 + 1 == v7 + 64)) ^ a5)))();
}

uint64_t sub_100038C50()
{
  return (*(uint64_t (**)(void))(v4
                              + 8
                              * ((((v1 & (2 * (*(unsigned __int8 *)(v3 + 1) - 134)))
                                 + ((*(unsigned __int8 *)(v3 + 1) - 134) ^ v0) == v0)
                                * (183 * ((v2 - 440) ^ 0xF0) - 603)) ^ (v2 - 440))))();
}

void sub_100038C94(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,unsigned char *a25,uint64_t a26,unsigned char *a27,uint64_t a28,unsigned char *a29,char a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35)
{
  a27[3] = (HIBYTE(v41) ^ 0x6E) - 2 * ((HIBYTE(v41) ^ 0x6E) & 0x3D ^ HIBYTE(v41) & 1) + 60;
  a25[9] = (a30 + 67) ^ BYTE5(v40);
  a25[15] = BYTE1(v41) ^ 0x9E;
  a29[8] = v41 ^ 0x58;
  a27[9] = (BYTE2(v41) ^ 0x82) - ((2 * BYTE2(v41)) & 0x78) + 60;
  a29[26] = BYTE4(v40) ^ 0x20;
  if ((v38 ^ 0xFF6ECFB9418212D9) >= 0x8134422366A90F03) {
    char v35 = (v38 ^ 0xD9) - ((2 * (v38 ^ 0xD9) - 6) & 0x88) - 63;
  }
  char v42 = v35 ^ 0xC4;
  if ((v38 ^ 0xFF6ECFB9418212D9) >= 0x8134422366A90F03) {
    char v43 = 3;
  }
  else {
    char v43 = 0;
  }
  char v44 = *(unsigned char *)(a35 + 531 + (BYTE6(v40) ^ 0xDLL));
  a25[7] = HIBYTE(v40) ^ 0x5C;
  a29[27] = BYTE1(v38) ^ 0x12;
  a27[10] = 7 * (v44 ^ 0x9C) - ((14 * (v44 ^ 0x9C)) & 0x78) + 60;
  a25[10] = v42 + v43;
  HIDWORD(v45) = *(unsigned __int8 *)(a35 + (((BYTE2(v38) ^ 0x82) - 15) ^ 0x78)) ^ 0xFFFFFFDD;
  LODWORD(v45) = (HIDWORD(v45) << 26) ^ (HIDWORD(v45) << 24);
  a29[10] = BYTE4(v38) ^ 0xB9;
  a27[14] = (BYTE3(v38) ^ 0x41) - ((2 * BYTE3(v38)) & 0x78) + 60;
  a27[20] = (v45 >> 25) ^ 0x20;
  a27[4] = (BYTE6(v38) ^ 0x6E) - ((2 * (BYTE6(v38) ^ 0x6E)) & 0x78) + 60;
  a27[16] = (BYTE5(v38) ^ 0xCF) - ((2 * (BYTE5(v38) ^ 0xCF)) & 0x78) + 60;
  unsigned int v46 = *(unsigned __int8 *)(a35 + ((((unint64_t)~v38 >> 56) - 15) ^ 0x78)) ^ 0xFFFFFFDD;
  a29[20] = v39 ^ 0x42;
  HIDWORD(v45) = v46;
  LODWORD(v45) = (v46 << 26) ^ (v46 << 24);
  a27[15] = (v45 >> 25) ^ 0x20;
  unsigned int v47 = *(unsigned __int8 *)(a23 + (((v39 >> 1) & 0x80 | ((unsigned __int16)v39 >> 9)) ^ 0xE1));
  a29[17] = BYTE3(v39) ^ 0x48;
  a25[14] = BYTE4(v39) ^ 0xCC;
  *a27 = BYTE5(v39) - ((2 * BYTE5(v39)) & 0x78) - 68;
  a29[21] = HIBYTE(v39) ^ 0x1F;
  a29[13] = BYTE2(v39) ^ 0x50;
  a29[3] = (v47 ^ 0x8A ^ (v47 >> 2) & 0x17) + 32;
  a25[12] = BYTE6(v39) ^ 6;
  char v48 = *(unsigned char *)(a35 + 531 + (v36 ^ 0x35) + 2 * (v36 & 0xD5 ^ 0x15) - 4 * (v36 & 0xD5 ^ 0x15) + 213) ^ 0x9C;
  a29[11] = BYTE2(v36) ^ 0xB6;
  a27[5] = 7 * v48 - ((14 * v48) & 0x78) + 60;
  a27[2] = (BYTE3(v36) ^ 0xE4) + ~(2 * ((BYTE3(v36) ^ 0xE4) & 0x3D ^ BYTE3(v36) & 1)) + 61;
  a29[25] = BYTE1(v36) ^ 0x76;
  unsigned int v49 = *(unsigned __int8 *)(a23 + (((v36 >> 25) & 0x80 | (v36 >> 33) & 0x7F) ^ 0xB1));
  a29[22] = BYTE5(v36) ^ 0xD3;
  a29[18] = HIBYTE(v36) ^ 0x50;
  a29[2] = BYTE1(v37) ^ 0x56;
  a27[1] = v37 ^ 0x6C;
  a29[30] = BYTE3(a3) ^ 0x5F;
  a29[9] = BYTE2(v37) ^ 0xBE;
  a29[19] = (v49 ^ 0x8A ^ (v49 >> 2) & 0x17) + 32;
  a27[7] = (BYTE6(v36) ^ 0x2B) - ((2 * (BYTE6(v36) ^ 0x2B)) & 0x78) + 60;
  unsigned int v50 = *(unsigned __int8 *)(a35 + (((BYTE4(a3) ^ 0xF6) - 15) ^ 0x78)) ^ 0xFFFFFFDD;
  a29[24] = BYTE6(a3) ^ 0x81;
  a29[12] = BYTE5(a3) ^ 0xFD;
  HIDWORD(v45) = v50;
  LODWORD(v45) = (v50 << 26) ^ (v50 << 24);
  a29[1] = HIBYTE(a3) ^ 0x9D;
  a29[23] = (v45 >> 25) ^ 0x1C;
  JUMPOUT(0x1000390E4);
}

uint64_t sub_100039124(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, int a13, int a14, unsigned int a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,int a23,int a24)
{
  unsigned int v25 = (((a14 + 795) | 0x320) ^ 0xA4E3E2E0) + a24;
  BOOL v26 = v25 < 0xD6584C6F;
  BOOL v27 = v25 > a15;
  if (a15 < 0xD6584C6F != v26) {
    BOOL v28 = v26;
  }
  else {
    BOOL v28 = v27;
  }
  return (*(uint64_t (**)(uint64_t))(v24 + 8 * ((28 * !v28) ^ (a2 + 85))))(4115370206);
}

uint64_t sub_100039134@<X0>(int a1@<W5>, int a2@<W6>, int a3@<W8>)
{
  *(unsigned char *)(v8 - 220 + a3 + v3 + ((v5 + a1) | 0x40u)) = *(unsigned char *)(v4 + v7 - 1054052544)
                                                       - ((2 * *(unsigned char *)(v4 + v7 - 1054052544)) & 0xA4)
                                                       + 82;
  return (*(uint64_t (**)(void))(v6 + 8 * ((374 * ((a2 + a3 + 1) < 0x40)) ^ (v5 + a1 + 1737))))();
}

uint64_t sub_1000391A4(uint64_t a1, uint64_t a2, int a3, uint64_t a4, int a5)
{
  return (*(uint64_t (**)(void))(v6 + 8 * ((118 * (v5 == (a3 ^ (a3 + 382) ^ (v7 + 130)))) ^ (a3 + a5))))();
}

uint64_t sub_1000391DC(uint64_t a1, uint64_t a2, int a3, int a4)
{
  BOOL v8 = v4 > v7;
  int v9 = (a4 ^ 0xA820DF63) + a3;
  int v10 = v8 ^ (v9 < -2073597293);
  BOOL v11 = v9 < v6;
  if (!v10) {
    BOOL v8 = v11;
  }
  return (*(uint64_t (**)(uint64_t, void))(v5 + 8 * ((1411 * v8) ^ a4)))(a1, 0);
}

void sub_100039248()
{
}

uint64_t sub_100039254(uint64_t a1, uint64_t a2, char a3, char a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v14 = (v12 + v9);
  unsigned int v15 = *(_DWORD *)((char *)&STACK[0x2AC] + v14 + 72);
  unsigned int v16 = (v15 >> (a3 + (v10 ^ (a4 + 101)) - 95)) ^ 0xFFFFFFE7;
  *(unsigned char *)(a8 + v14) = (HIBYTE(v15) ^ 0x2C) - ((v15 >> 23) & 0xA4) + 82;
  *(unsigned char *)(a8 + (v14 + 1)) = v16 - ((2 * v16) & 0xA4) + 82;
  *(unsigned char *)(a8 + (v14 + 2)) = (BYTE1(v15) ^ 0xD3)
                                           - 2 * ((BYTE1(v15) ^ 0xD3) & 0x56 ^ BYTE1(v15) & 4)
                                           + 82;
  *(unsigned char *)(a8 + (v14 + 3)) = v15 ^ 0xF4;
  LODWORD(v14) = LODWORD(STACK[0x308]) - 1509244786;
  BOOL v17 = v14 < v8;
  BOOL v18 = v12 - 1878450556 < v14;
  if (v12 - 1878450556 < v8 != v17) {
    BOOL v18 = v17;
  }
  return (*(uint64_t (**)(void))(v13 + 8 * ((v18 * v11) ^ v10)))();
}

void sub_100039340()
{
}

uint64_t sub_100039348(uint64_t a1)
{
  int v4 = *(unsigned __int8 *)(*(void *)(a1 + 40) + (v2 - 1115468202));
  return (*(uint64_t (**)(void))(v1
                              + 8
                              * (((((v4 + (((v3 - 1768) | 0x201) ^ 0x15AB3882) - ((2 * v4) & 0xFFFFFF87)) & 0x1F) == 28)
                                * (((v3 - 1544) | 0x409) - 1292)) ^ v3)))();
}

void sub_1000393B8()
{
  if (v0 + v1 - 1 >= (v4 + 2147482953)) {
    int v5 = 587045130 - v3;
  }
  else {
    int v5 = v3;
  }
  _DWORD *v2 = v5;
  JUMPOUT(0x100034234);
}

uint64_t sub_1000393F0()
{
  unsigned int v3 = *(_DWORD *)(v1 - 0x3D8A64FC118460F2) + 356230457;
  unsigned int v4 = *(_DWORD *)(v1 - 0x3D8A64FC118460F6) + ((v2 - 756) ^ 0x4CE1A57A);
  BOOL v5 = v4 < 0x6901C901;
  BOOL v6 = v3 < v4;
  if (v3 < 0x6901C901 != v5) {
    BOOL v6 = v5;
  }
  return (*(uint64_t (**)(void))(v0 + 8 * ((482 * v6) ^ v2)))();
}

void sub_100039480()
{
}

uint64_t sub_100039488(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  return (*(uint64_t (**)(uint64_t))(v8
                                            + 8
                                            * ((41 * (((v6 - 112 - v7) ^ (a6 == -1158872075)) & 1)) ^ (v6 - 93))))(3136095221);
}

uint64_t sub_1000394E8@<X0>(uint64_t a1@<X8>, uint64_t a2, uint64_t a3)
{
  return sub_10003953C(a3 - 0x4C6937770F4864B0, a1 - 0x4C6937770F4864B0, (v3 - 574) - 347, 0xFCDBB9FABAFE3EBALL, 0x175FC7D74, 0x2FFD5EDD7515F760, 118);
}

uint64_t sub_10003953C(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7)
{
  BOOL v20 = v15 > v12;
  uint64_t v21 = 4 * (v19 + v13);
  int v22 = v7 + v16 + (*(_DWORD *)(*a1 + v21) ^ v17);
  *(_DWORD *)(*a2 + v21) = v22 + v17 - (v14 & (2 * v22));
  int v23 = v8 + v19 + 1333;
  LODWORD(v21) = v20 ^ (v23 < v9);
  BOOL v24 = v23 < v11;
  if (!v21) {
    BOOL v20 = v24;
  }
  return (*(uint64_t (**)(void))(v18 + 8 * ((v20 * a7) ^ (v10 + 260))))();
}

uint64_t sub_1000395C8(uint64_t a1, int a2, uint64_t a3, unsigned int a4)
{
  return (*(uint64_t (**)(void))(v4 + 8 * (((a2 - 1726 + ((a2 - 159213374) & 0x97D607F) - 102) * (v5 < a4)) ^ a2)))();
}

uint64_t sub_100039608()
{
  return (*(uint64_t (**)(void))(v5
                              + 8
                              * ((1621
                                * ((((*(unsigned __int8 *)(v2 + 4) - 247) << ((v4 | 8) - 7)) & v1)
                                 + ((*(unsigned __int8 *)(v2 + 4) - 247) ^ v0) == v0)) ^ v3)))();
}

uint64_t sub_100039648(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  int v12 = ((*(unsigned __int8 *)(a4 + a6 + v10) ^ 0x52) << 24) | ((*(unsigned __int8 *)(a4 + a6 + v10 + 1) ^ 0x52) << 16) | ((*(unsigned __int8 *)(a4 + a6 + v10 + 2) ^ ((((_BYTE)v7 + 118) & 0x6E) + 12) & 0x7E) << 8) | *(unsigned __int8 *)(a4 + a6 + v10 + 3) ^ 0x52;
  *(_DWORD *)(v9 + ((a6 + v10) & 0xFFFFFFFFFFFFFFFCLL)) = v12 + v11 - (v6 & (2 * v12));
  return (*(uint64_t (**)(void))(v8 + 8 * ((140 * ((unint64_t)(a6 + 4 + v10) < 0x40)) | v7)))();
}

uint64_t sub_1000396E4(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  return (*(uint64_t (**)(void))(v6 + 8 * ((122 * (v4 != a4)) ^ v5)))();
}

uint64_t sub_100039708@<X0>(unsigned int a1@<W0>, unsigned int a2@<W1>, int a3@<W2>, unsigned int a4@<W3>, int a5@<W6>, int a6@<W8>)
{
  return (*(uint64_t (**)(void))(v6 + 8 * (((a5 + a6 + (a4 ^ a1) - 133 < a2) * a3) | a4)))();
}

uint64_t sub_10003973C(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, int a6)
{
  *(void *)(v9 - 7 + v13 + v12 + v11 - a4 + ((a6 - 65) ^ v8)) = *(void *)(v7
                                                                            - 7
                                                                            + v13
                                                                            + v12
                                                                            + v11
                                                                            - a4
                                                                            + ((a6 - 65) ^ v8));
  return (*(uint64_t (**)(void))(v6 + 8 * ((788 * (a4 - (v10 & 0xFFFFFFF8) == -8)) ^ a6)))();
}

uint64_t sub_100039798()
{
  return (*(uint64_t (**)(void))(v4
                              + 8
                              * ((((v1 & (2 * (*(unsigned __int8 *)(v3 + 3) - 134)))
                                 + ((*(unsigned __int8 *)(v3 + 3) - 134) ^ v0) == v0)
                                * (5 * (v2 ^ 0x42) + 685)) ^ v2)))();
}

uint64_t sub_1000397D8@<X0>(uint64_t a1@<X3>, uint64_t a2@<X7>, int a3@<W8>, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t (*a18)(uint64_t))
{
  *(unsigned char *)(a1 + (a3 + 2)) = *(unsigned char *)(a2 + (v19 - 327863569 + v18 - 612));
  int v22 = 1755732067 * ((~((v21 - 168) | 0xBF7F5A4B) + ((v21 - 168) & 0xBF7F5A4B)) ^ 0x9E46186F);
  *(void *)(v21 - 168) = a16;
  *(_DWORD *)(v21 - 160) = v22 + v18 - 612 + 242;
  *(_DWORD *)(v21 - 156) = 785517303 - v22;
  uint64_t v23 = (*(uint64_t (**)(uint64_t))(v20 + 8 * ((v18 - 612) ^ 0x80D)))(v21 - 168);
  return a18(v23);
}

uint64_t sub_10003987C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(v3
                              + 8
                              * (((v1 - a1 < (unint64_t)(((v2 ^ 0x289) - 68816500) & 0x41A0DFF) - 119)
                                * ((v2 ^ 0x289) - 206)) ^ v2 ^ 0x289)))();
}

uint64_t sub_1000398C8()
{
  *(unint64_t *)((char *)&STACK[0x2AC] + v2 + ((v0 - 370650460) & 0x1617AB6F) - 704281843) = 0x5252525252525252;
  return (*(uint64_t (**)(void))(v3
                              + 8
                              * (((4 * ((v1 & 0xFFFFFFFFFFFFFFF8) == 8)) | (((v1 & 0xFFFFFFFFFFFFFFF8) == 8) << 9)) ^ v0)))();
}

uint64_t sub_100039934()
{
  return (*(uint64_t (**)(void))(v2
                              + 8
                              * ((((*(void *)(v1 + 16) == 0x462410CFA83B5FEFLL) ^ (v0 - 117)) & 1 | (32 * (((*(void *)(v1 + 16) == 0x462410CFA83B5FEFLL) ^ (v0 - 117)) & 1))) ^ v0)))();
}

uint64_t sub_100039974()
{
  return (*(uint64_t (**)(void))(v2 + 8 * ((1419 * (v1 + 1 == v3 + 60)) ^ v0)))();
}

uint64_t sub_100039A44@<X0>(int a1@<W8>)
{
  return (*(uint64_t (**)(void))(v3
                              + 8 * (int)(((((78 * (v2 ^ 0x139)) ^ 0xFFFFFF96) + 6 * (v2 ^ 0x11D)) * (a1 == v1)) ^ v2)))();
}

uint64_t sub_100039A94(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  return (*(uint64_t (**)(void))(v7 + 8 * ((1877 * (v8 + 1 == v6 + 32)) ^ a6)))();
}

uint64_t sub_100039B68(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(v2 + 8 * ((2 * (**(unsigned char **)(a2 + 8) != 0)) | 0x23Cu)))();
}

void sub_100039BB0()
{
}

uint64_t sub_100039BBC@<X0>(int a1@<W8>)
{
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v2 + 8 * (a1 ^ 0xC59));
  return v3(v1);
}

uint64_t sub_100039BF0@<X0>(uint64_t a1@<X1>, int a2@<W8>)
{
  uint64_t v4 = v2;
  unint64_t v5 = a1 + v2 + ((a2 - 989) | 0x478u) - 1271;
  if (v5 <= 0x38) {
    unint64_t v5 = 56;
  }
  return (*(uint64_t (**)(void))(v3 + 8 * (((v5 - v4 + 1439792564 < 8) * ((a2 ^ 0x5C7) - 361)) ^ a2)))();
}

uint64_t sub_100039C54@<X0>(uint64_t a1@<X3>, uint64_t a2@<X8>)
{
  *(int8x16_t *)(a1 + ((v2 ^ 0xFFFFF8EDLL) & (a2 + 16))) = vaddq_s8(vsubq_s8(*v4, vandq_s8(vaddq_s8(*v4, *v4), v7)), v6);
  return (*(uint64_t (**)(void))(v5 + 8 * (int)((150 * (v3 == 16)) ^ v2)))();
}

void sub_100039C60(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, int a14, uint64_t a15, uint64_t a16, int a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,unsigned char *a23,uint64_t a24,unsigned char *a25,uint64_t a26,unsigned char *a27,uint64_t a28,uint64_t a29,unsigned char *a30,uint64_t a31,unsigned char *a32,unsigned char *a33,uint64_t a34,unsigned char *a35,unsigned char *a36,unsigned char *a37,unsigned char *a38,unsigned char *a39)
{
  uint64_t v43 = ((a3 ^ 0x52F415C5815BAE9ALL) - 0x7D8AF4275EA9BD7ELL - ((2 * (a3 ^ 0x52F415C5815BAE9ALL)) & 0x4EA17B142AC8504)) ^ v41;
  uint64_t v44 = (((a15 << ((v42 - 61) ^ 0x5Au)) | (a14 - 1166967796))
       - 0x399961E20103D709
       - 2
       * (((a15 << ((v42 - 61) ^ 0x5Au)) | (a14 - 1166967796)) & 0x46669E1DFEFC28FFLL ^ (a14 - 1166967796) & 8)) ^ v39;
  unint64_t v45 = v44 ^ 0xA173397C065C8DEALL;
  uint64_t v46 = v44 ^ 0x5E8CC683F9A37215;
  unint64_t v47 = ((v44 ^ 0x5E8CC683F9A37215)
       - 0x2A85D7411830FBA5
       - ((2 * (v44 ^ 0x5E8CC683F9A37215)) & 0xAAF4517DCF9E08B6)) ^ a5;
  uint64_t v48 = v47 ^ 0x629A61E2FE92CDE4;
  unint64_t v49 = v43 ^ 0x8ABB7B075CE8A96ELL;
  unint64_t v50 = (v47 ^ 0x629A61E2FE92CDE4) & v45 ^ v43 ^ 0x8ABB7B075CE8A96ELL;
  unint64_t v51 = (v47 ^ 0x9D659E1D016D321BLL) & (v40 ^ 0x8BFDCD62E2805098) ^ v46 ^ v50;
  *((void *)&v53 + 1) = v51 ^ 0xABEF87C8808CCB5;
  *(void *)&long long v53 = v51 ^ 0x8000000000000000;
  uint64_t v52 = v53 >> 61;
  uint64_t v54 = v46 & (v43 ^ 0x754484F8A3175691);
  uint64_t v55 = v50 ^ 0xF38BFF733C051F6;
  unint64_t v56 = a3 ^ 0x52F415C5815BAE9ALL ^ v40 ^ 0x8BFDCD62E2805098;
  unint64_t v57 = v54 ^ v56;
  uint64_t v58 = (v54 ^ v56) & 0x200000000;
  BOOL v59 = (v55 & v58) == 0;
  uint64_t v60 = v58 | 0x52C4D9584A7921BLL;
  if (!v59) {
    uint64_t v60 = 0xA589B2B094F2436 - v60;
  }
  unint64_t v61 = ((v55 + v60 - 0x52C4D9584A7921BLL) ^ (0x52C4D9584A7921BLL - (v55 + v60)) ^ ((v57 & 0xFFFFFFFDFFFFFFFFLL)
                                                                                  - ((v55 + v60 - 0x52C4D9584A7921BLL) ^ v57 & 0xFFFFFFFDFFFFFFFFLL)))
      + (v57 & 0xFFFFFFFDFFFFFFFFLL);
  unint64_t v62 = v61 - ((2 * v61) & 0x8C4CDA09FDE05546) - 0x39D992FB010FD55DLL;
  *((void *)&v63 + 1) = v62 ^ 0x2AA3;
  *(void *)&long long v63 = v62 ^ 0xC6266D04FEF00000;
  unint64_t v64 = v51 ^ __ROR8__(v51, 39) ^ v52;
  uint64_t v65 = ((v63 >> 19) - ((2 * (v63 >> 19)) & 0x8C4CDA09FDE05546) - 0x39D992FB010FD55DLL) ^ v62;
  uint64_t v66 = (v57 << 23) ^ (v57 >> 7) ^ ((v57 >> 41) | (v57 << 57)) ^ 0x1EC655AF97FB0312;
  unint64_t v67 = (v66 - ((2 * v66) & 0x852C45F27677EA78) - 0x3D69DD06C4C40AC4) ^ v57;
  unint64_t v68 = v67 ^ 0x75AF050E6B7435CELL ^ (v62 << 36) ^ (v65 & 0x88A7E47BC54E7E29 ^ ((v62 >> 28) ^ 0xC6266D04FLL) & 0xBC54E7E29 | v65 & 0x77581B843AB181D6 ^ ((v62 >> 28) ^ 0xC6266D04FLL) & 0x43AB181D6);
  uint64_t v69 = v48 ^ v56 & (v40 ^ 0x7402329D1D7FAF67);
  unint64_t v70 = v49 & ~v56 ^ v40 ^ 0x8BFDCD62E2805098 ^ v69;
  unint64_t v71 = ((v70 >> 10) ^ (v70 >> 17) | (v70 << 54)) ^ 0xF5EC3F377C10F093;
  uint64_t v72 = v70 ^ 0xA298BB6602A0D4DLL ^ (v71 - ((2 * v71) & 0x776CD304977ED534) - 0x4449967DB4409566);
  unint64_t v73 = v72 & 0x4C1D4E44A4B3031DLL ^ ((v70 << 47) ^ 0xB3EB800000000000) & 0x4C1D000000000000 | v72 & 0xB3E2B1BB5B4CFCE2 ^ ((v70 << 47) ^ 0xB3EB800000000000) & 0xB3E2800000000000;
  unint64_t v74 = v73 - ((2 * v73) & 0xF19D9A8C84C8701ALL) + 0x78CECD464264380DLL;
  uint64_t v75 = v74 ^ ((v67 ^ 0x75AF050E6B7435CELL)
             - 2 * ((v67 ^ 0x75AF050E6B7435CELL) & 0x78CECD464264382DLL ^ v67 & 0x20)
             + 0x78CECD464264380DLL);
  unint64_t v76 = v68 ^ 0xEF02AA3000000000;
  *((void *)&v63 + 1) = ~v69;
  *(void *)&long long v63 = v69 ^ 0x92CFC162FD513142;
  unint64_t v77 = v69 ^ 0xE981735F753ACD69 ^ (((v69 << 58) ^ 0xC00000000000000)
                                    - (((v69 << 58) ^ 0xC00000000000000uLL) >> 59 << 60)
                                    + 0x7B4EB23D886BFC2ALL);
  unint64_t v78 = v77 - ((2 * v77) & 0xBDCB4E8627C3A7E4) + 0x5EE5A74313E1D3F2;
  uint64_t v79 = v64 ^ 0x2D4B4EA6F0FC62B7;
  uint64_t v80 = ((v69 ^ 0x92CFC162FD513166) >> (v57 & 6 ^ 2) >> (v57 & 6 ^ 4)) ^ (v63 >> 1) ^ v64 ^ 0x2D4B4EA6F0FC62B7 ^ v78;
  unint64_t v81 = (v74 ^ 0x873132B9BD9BC7F2) & (v67 ^ 0x75AF050E6B7435CELL) ^ v80;
  unint64_t v82 = v81 ^ v74 ^ (((v68 ^ 0xEF02AA3000000000) & ~v75)
                   - ((2 * ((v68 ^ 0xEF02AA3000000000) & ~v75)) & 0xF19D9A8C84C8701ALL)
                   + 0x78CECD464264380DLL);
  unint64_t v83 = ((v82 >> 10) & 0x2000000000000 ^ 0xDBCF7FFFFF7FD5FDLL) + 2 * ((v82 >> 10) & 0x2000000000000);
  BOOL v59 = ((v83 + 0x2430800000802A03) & (v82 ^ 0x28E000000000000)) == 0;
  unint64_t v84 = (v68 ^ 0x10FD55CFFFFFFFFFLL) & (v64 ^ 0x73AEE9E5E31DB145) ^ v75;
  unint64_t v85 = ((v84 >> 41) ^ (v84 >> 7) | (v84 << 57)) ^ (v84 << 23) ^ 0xF774B04353CE1CF4;
  unint64_t v86 = v85 - ((2 * v85) & 0x9774A99083BEAF5CLL) + 0x4BBA54C841DF57AELL;
  unint64_t v87 = v83 + 0x3E75CADDCBFDFE80;
  unint64_t v88 = 0xF614CADDCAFDAA7ALL - v83;
  if (!v59) {
    unint64_t v87 = v88;
  }
  unint64_t v89 = (v82 >> 10) & 0xFFFDFFFFFFFFFFFFLL ^ 0xA3E966F75234 ^ ((v82 ^ 0x28FA59BDD48D0B6) - 0x1A454ADDCB7DD47DLL + v87);
  uint64_t v90 = ((v89 >> 38) & 0x2A35FE4) + (v89 >> 39) - 2 * ((v89 >> 38) & 0x2A35FE4) + 0x61376A34D751AFF2;
  *((void *)&v91 + 1) = v82 ^ 0xD0B6;
  *(void *)&long long v91 = v82 ^ 0x28FA59BDD480000;
  uint64_t v92 = (((v90 << 39) ^ (v82 << 54)) & 0xFFFFFF8000000000 | ((v90 ^ (v89 << 25)) >> 25)) ^ (v91 >> 17);
  unint64_t v93 = v76 ^ v80 & (v64 ^ 0x8C51161A1CE24EBALL);
  unint64_t v94 = (((v74 ^ 0x78CECD464264380DLL) & ~v80)
       - ((2 * ((v74 ^ 0x78CECD464264380DLL) & ~v80)) & 0xBDCB4E8627C3A7E4)
       + 0x5EE5A74313E1D3F2) ^ v79 ^ v93;
  unint64_t v95 = (8 * v94) ^ (v94 >> 39) ^ 0xBA3E0AB73A03F932 ^ ((*(unsigned char *)(a21
                                                                                     + (((v94 >> 57) ^ 0x2B) & 0x70 ^ 0xFE)) ^ ((((v94 >> 57) ^ 0x2B) & 0x70 ^ 0xDE) + (((v94 >> 57) ^ 0x2B) & 0x70 ^ 0x4B)) ^ 0xA1)
                                                                         - 122);
  unint64_t v96 = v94 ^ 0x36735144BA8A02C6 ^ (v95 - ((2 * v95) & 0xC2692024BBBF5820) + 0x613490125DDFAC10);
  unint64_t v97 = v96 + ((v94 << 25) ^ 0xADCEAB5DAC000000) - 2 * (v96 & ((v94 << 25) ^ 0xADCEAB5DAC000000));
  unint64_t v98 = v86 ^ v84;
  unint64_t v99 = v84 ^ v93;
  *(void *)&long long v91 = __ROR8__(__ROR8__(v99 ^ 0x787EEEF1A7EE72F1, 16) ^ 0x1712D402E105A6CBLL, 48);
  unint64_t v100 = v99 ^ 0xAC7C0FF4012565E3 ^ ((v99 ^ 0xAC7C0FF4012565E3) >> 19) ^ ((unint64_t)v91 >> 28) ^ ((void)v91 << 36) ^ ((void)v91 << 45) ^ v86 ^ v84;
  *((void *)&v91 + 1) = v100 ^ 0xEB;
  *(void *)&long long v91 = v100 ^ 0xD1826830C05F2200;
  uint64_t v101 = v97 - ((2 * v97) & 0x86B41119E85B238) + 0x435A088CF42D91CLL;
  unint64_t v102 = v92 ^ 0x8557F9309BB51A6BLL;
  unint64_t v103 = v92 ^ 0x8557F9309BB51A6BLL ^ v98;
  unint64_t v104 = v103 ^ 0xD1826830C05F22EBLL ^ (v101 ^ 0x435A088CF42D91CLL) & ((((unint64_t)(v91 >> 9) ^ 0x284B28057C49B8D1) >> (v69 & 0x37 ^ 3) >> (v69 & 0x37 ^ 0x34)) ^ (((unint64_t)(v91 >> 9) ^ 0x284B28057C49B8D1) << 9) ^ 0x69AFF5076C8E5DAFLL);
  *((void *)&v91 + 1) = v104 ^ 0x118501E2B14;
  *(void *)&long long v91 = v104 ^ 0x26974A0000000000;
  uint64_t v105 = v104 ^ 0x74AA69F683C1D3F2 ^ (((v91 >> 41) ^ (v104 << 57) ^ 0x2800000000000000)
                                      - 2 * (((v91 >> 41) ^ (v104 << 57)) & 0x523D22EED3DFF8EELL ^ (v91 >> 41) & 8)
                                      + 0x523D22EED3DFF8E6);
  uint64_t v106 = v105 + ((v104 >> 7) ^ 0x4D2E9630A03C56) - 2 * (v105 & ((v104 >> 7) ^ 0x4D2E9630A03C56));
  unint64_t v107 = v81 ^ 0x3CC071451A2243DELL ^ (((v81 >> 1) ^ (v81 >> 6) ^ (v81 << 58) ^ 0xDE1FAE11AA0A9F1DLL)
                                     - 2
                                     * (((v81 >> 1) ^ (v81 >> 6) ^ (v81 << 58) ^ 0xDE1FAE11AA0A9F1DLL) & 0x538506DAB37D83E6 ^ ((v81 >> 1) ^ (v81 >> 6)) & 2)
                                     + 0x538506DAB37D83E4);
  unint64_t v108 = v107 & 0xF47FF077890F9720 ^ (v81 << 63) | v107 & 0xB800F8876F068DFLL;
  unint64_t v109 = (v103 ^ 0xD1826830C05F22EBLL) & (v92 ^ 0x7AA806CF644AE594);
  unint64_t v110 = ((v103 ^ 0x2E7D97CF3FA0DD14) & (v100 ^ 0xD1826830C05F22EBLL))
       - ((2 * ((v103 ^ 0x2E7D97CF3FA0DD14) & (v100 ^ 0xD1826830C05F22EBLL))) & 0x89735FD1005A713ALL);
  uint64_t v111 = v101 ^ (v108 - ((2 * v108) & 0x86B41119E85B238) + 0x435A088CF42D91CLL);
  unint64_t v112 = v109 ^ v111;
  uint64_t v113 = v109 ^ v111 ^ v102 ^ (v110 + 0x44B9AFE8802D389DLL);
  *((void *)&v91 + 1) = v113 ^ 0x3AB;
  *(void *)&long long v91 = v113 ^ 0x37C90380D01DF000;
  uint64_t v114 = v113 ^ 0x44B9AFE8802D389DLL ^ ((v113 ^ 0x44B9AFE8802D389DuLL) >> 17) ^ (v91 >> 10) ^ ((v113 ^ 0x44B9AFE8802D389DLL) << 47);
  uint64_t v115 = v106 + (v114 ^ 0x16EB95D00604E32ELL) - 2 * (v106 & (v114 ^ 0x16EB95D00604E32ELL));
  unint64_t v116 = v100 ^ 0x3FA0C6ABD066ACE7 ^ (((v101 ^ 0xFBCA5F7730BD26E3) & v108)
                                      - ((2 * ((v101 ^ 0xFBCA5F7730BD26E3) & v108)) & 0xDC455D3620731C18)
                                      - 0x11DD5164EFC671F4);
  unint64_t v117 = ((v116 ^ v102 & ~v111) - ((2 * (v116 ^ v102 & ~v111)) & 0x86B41119E85B238) + 0x435A088CF42D91CLL) ^ v101;
  *((void *)&v91 + 1) = v117 ^ 0x38FE43D2BCLL;
  *(void *)&long long v91 = v117 ^ 0x3278F80000000000;
  unint64_t v118 = __ROR8__(v117, 61) ^ (v117 << 25) ^ __ROR8__((v91 >> 38) ^ (v117 >> 39 << 26) ^ 0xC258A8B62E885BC3, 26);
  *((void *)&v91 + 1) = v112 ^ 0x548B80C;
  *(void *)&long long v91 = v112 ^ 0x7955EAEC48000000;
  unint64_t v119 = ((v112 & 0x3F) << 31) ^ 0xE04699B10F1F629ALL ^ (v91 >> 27);
  unint64_t v120 = (v112 >> 6) ^ (v112 >> 1) ^ (((v119 << 27) ^ (v112 << 63)) & 0xFFFFFFFFF8000000 | (v119 >> 37));
  unint64_t v121 = v118 ^ v120;
  unint64_t v122 = v118 ^ v120 ^ 0xC51AEF5B5CC303B1;
  unint64_t v123 = v115 & (v114 ^ 0xE9146A2FF9FB1CD1) ^ v122;
  unint64_t v126 = (v120 ^ 0x853759C940934A2BLL) + (v122 | v118 ^ 0xBFD2496DE3AFB665) + 1;
  unint64_t v127 = v116 ^ v104;
  uint64_t v128 = (v127 >> 19) ^ (v127 << 36) ^ (v127 << 45) ^ 0x2A792D60982B22B5;
  uint64_t v129 = (v127 >> 28) ^ 0x6E04C1591;
  unint64_t v130 = v127 ^ 0x8FF7BF808465F1B1 ^ (v128 - ((2 * v128) & 0xC3E6FDB3239CEF76) - 0x1E0C81266E318845);
  unint64_t v131 = (v130 & 0x26452CB7C950B7B6 ^ v129 & 0x7C950B7B6 | v130 & 0xD9BAD34836AF4849 ^ v129 & 0x836AF4849) ^ v106;
  unint64_t v132 = v126 & 1;
  unint64_t v133 = (v126 & 0xFFFFFFFFFFFFFFFELL) - ((2 * v126) & 0x180D20D0D8C7C8F0) + 0xC0690686C63E478;
  if ((v132 & v131) != 0) {
    uint64_t v134 = v131 - v132 - ((2 * (v131 - v132)) & 0x180D20D0D8C7C8F0) + 0xC0690686C63E478;
  }
  else {
    uint64_t v134 = v131 ^ 0xC0690686C63E478 ^ v132;
  }
  unint64_t v135 = v134 ^ v133;
  unint64_t v136 = (v121 ^ 0x3AE510A4A33CFC4ELL) & (v114 ^ 0x16EB95D00604E32ELL) ^ v118 ^ 0x402DB6921C50499ALL ^ v134 ^ v133;
  unint64_t v137 = ((8 * v136) ^ 0x12BB25DAC3BED128) & (v136 ^ 0x425764BB5877DA20) ^ __ROR8__(v136, 39) ^ (v136 ^ 0x880583D83EB46F64 ^ (((v136 >> 61) ^ 2) - 0x35AD189C993C4ABELL + ((2 * (((v136 >> 61) ^ 2 | 0xFFFFFFFFFFFFFFC1) ^ (v136 >> 61))) ^ 0x79)) | (8 * v136) ^ 0x12BB25DAC3BED128);
  unint64_t v124 = ((v123 >> 1) ^ (v123 >> 6) | (v123 << 63)) ^ (v123 << 58) ^ 0x82A267617DDD3C0DLL;
  unint64_t v125 = (v124 - ((2 * v124) & 0x995BA5349B6D1ECCLL) - 0x33522D65B249709ALL) ^ v123;
  unint64_t v138 = (v137 ^ 0xEF4E54B88CF6B010 ^ ((v125 ^ 0x1F77CCA92D090B5CLL)
                                       - 2 * ((v125 ^ 0x1F77CCA92D090B5CLL) & 0x19FEBB0CC6721EDBLL ^ v125 & 2)
                                       - 0x660144F3398DE127)) & 0xA9AD36174A77719DLL | (v137 ^ 0xEF4E54B88CF6B010 ^ ((v125 ^ 0x1F77CCA92D090B5CLL) - 2 * ((v125 ^ 0x1F77CCA92D090B5CLL) & 0x19FEBB0CC6721EFBLL ^ v125 & 0x22) + 0x19FEBB0CC6721ED9)) & 0x5652C9E8B5888E62;
  unint64_t v139 = v138 - ((2 * v138) & 0x2230F17A7C030AF0);
  uint64_t v140 = (v118 ^ 0x402DB6921C50499ALL) & ~v131 ^ v115;
  unint64_t v141 = ((v140 + (v140 ^ 0x8F38572C0C9BC202) + 1) ^ 0xFFFFFFFFFFFFFFFELL) + v140;
  unint64_t v142 = v141 - ((2 * v141) & 0x1FEE5F5913BFB15ALL);
  unint64_t v143 = v142 + 0xFF72FAC89DFD8ADLL;
  unint64_t v144 = ((0xF008D05376202752 - v142) & 0x10000000000000 | (((((0xF008D05376202752 - v142) & 0x10000000000000) >> 52) & 1) << 53)) ^ 0x3E1BDFFEEFDDFDFDLL;
  unint64_t v145 = v144 + 0x1E4200110220203;
  unint64_t v146 = v144 - 0x1E02031A0A096010;
  unint64_t v147 = 0x5E35BCE3D5B29BEALL - v144;
  uint64_t v148 = (v143 >> 7) ^ 0x1FEE5F5913BFB1;
  if ((v145 & v148) == 0) {
    unint64_t v147 = v146;
  }
  unint64_t v149 = v143 & 0xFFEFFFFFFFFFFFFFLL ^ (v143 >> 41) ^ (v148 - 0x2019DCE4E5D49DEDLL + v147);
  unint64_t v150 = (v143 << 23) ^ (v143 << 57) ^ 0x83A3C040DF58233ALL ^ v149;
  unint64_t v151 = v123 ^ v114 ^ ((v131 & ~v115) - ((2 * (v131 & ~v115)) & 0xA6C61315C044ACB4) - 0x2C9CF6751FDDA9A6);
  unint64_t v152 = (v151 & 0x1000000000 | (v151 << 47)) ^ v151 & 0xFFFFFFEFFFFFFFFFLL ^ ((v151 >> 10) ^ (v151 >> 17) | (v151 << 54));
  *((void *)&v153 + 1) = v152 ^ 0x19ADA7491DLL;
  *(void *)&long long v153 = v152 ^ 0x935559C000000000;
  unint64_t v154 = v139 + 0x111878BD3E018578;
  unint64_t v155 = v152 ^ 0xAF82FD2BD847CCC3;
  unint64_t v156 = (v150 - 2 * (v150 & 0x3CD7A4F275E085DFLL ^ v149 & 1) + 0x3CD7A4F275E085DELL) ^ v152 ^ 0xAF82FD2BD847CCC3;
  uint64_t v157 = (v139 + 0x111878BD3E018578) ^ v156 & (__ROR8__((v153 >> 38) ^ 0xE2AAF8192B2B27F8, 26) ^ 0x353601C75541F9B5);
  unint64_t v158 = ((v157 ^ 0x83237C49150185C3) + 0x6DC4FB0BD4FFFF45) ^ ((v157 ^ 0xEEE78742C1FE7A87) + 1);
  v157 ^= 0x15BB53144C880990uLL;
  uint64_t v159 = (v158 - ((2 * v158) & 0x9465752E51319D0) + 0x4A32BA972898CE8) ^ v157;
  unint64_t v160 = v159 - ((2 * v159 + 0x1B89F617A9FFFE88) & 0x24306251FFD63388) + 0x7FDD2C34D4EB1908;
  *((void *)&v153 + 1) = (v159 - ((2 * v159 - 1442840952) & 0xFFD63388) - 722790136) ^ 4;
  *(void *)&long long v153 = v160 ^ 0x12183128FFEB19C0;
  uint64_t v161 = ((v159 << 63) | 0x90C18947FF58CE2) ^ (v160 >> 1) ^ (v153 >> 6);
  unint64_t v162 = (((2 * v154) ^ 0xDDCF0E8583FCF50FLL) + (v154 ^ 0x111878BD3E018578)) & (v152 ^ 0x935559D9ADA7491DLL);
  unint64_t v163 = (v135 - ((2 * v135) & 0x7D0C5EB406578C34) - 0x4179D0A5FCD439E6) ^ v140;
  unint64_t v164 = ((v163 ^ 0xBE862F5A032BC61ALL) << 45) ^ ((v163 ^ 0xBE862F5A032BC61ALL) << 36) ^ v150 ^ __ROR8__((((v163 ^ 0xBE862F5A032BC61ALL) >> 30) | ((unint64_t)~(v163 >> 28) << 62)) ^ __ROR8__(v163 ^ 0xE29B9371326EEEBELL ^ (((v163 >> 19) ^ 0x52E1117FEB8) - ((2 * ((v163 >> 19) ^ 0x52E1117FEB8)) & 0x379D8F5BBA5CLL) - 0x3414E431385222D2), 2) ^ 0xA6115EFD9A53B36ELL, 62);
  unint64_t v165 = (v154 ^ 0x111878BD3E018578) & (v137 ^ 0x894F104BB57B5136) ^ v164 ^ 0xE87B635F1624B3E6;
  unint64_t v166 = v165 ^ v137 ^ 0xEF4E54B88CF6B010 ^ (v162 - ((2 * v162) & 0x33FD76198CE43DB2) - 0x660144F3398DE127);
  *((void *)&v153 + 1) = v166 ^ 0x5BE354A5BB0B2;
  *(void *)&long long v153 = v166 ^ 0x6000000000000000;
  uint64_t v167 = (v161 + 0x12183128FFEB19C0 - ((2 * v161) & 0x24306251FFD63388) + 4) ^ v160;
  uint64_t v168 = v166 ^ __ROR8__(v166, 39) ^ (v153 >> 61);
  unint64_t v169 = ((v164 ^ 0x3D9656FDEA6A2FLL ^ -(uint64_t)(v164 ^ 0x3D9656FDEA6A2FLL) ^ ((v164 ^ 0xE87B635F1624B3E6)
                                                                              + 0x17B90AF614312637))
        + 0x17B90AF614312636) & (v137 ^ 0x76B0EFB44A84AEC9) ^ v156;
  unint64_t v170 = v169 ^ 0x2DB5B6AF87F64351 ^ ((v169 ^ 0x2DB5B6AF87F64351) >> 7) ^ ((v169 ^ 0x2DB5B6AF87F64351) << 23) ^ (((v169 ^ 0x2DB5B6AF87F64351) >> 41) | ((v169 ^ 0x2DB5B6AF87F64351) << 57));
  unint64_t v171 = (((v164 ^ 0xE87B635F1624B3E6) & ~v156)
        - ((2 * ((v164 ^ 0xE87B635F1624B3E6) & ~v156)) & 0x79AF49E4EBC10BBCLL)
        + 0x3CD7A4F275E085DELL) ^ v155;
  unint64_t v172 = (v171 - ((2 * v171) & 0x9465752E51319D0) + 0x4A32BA972898CE8) ^ v157;
  unint64_t v173 = v172 ^ (v172 << 54) ^ (v172 << 47) ^ (v172 >> 10) ^ (v172 >> 17);
  *(void *)&long long v153 = __ROR8__(__ROR8__(v165, 61) ^ 0x500CB82D79BEE91BLL, 3);
  unint64_t v174 = ((v169 ^ (unint64_t)v153) >> 19) ^ ((v169 ^ (unint64_t)v153) >> 28);
  unint64_t v175 = v169 ^ v153 ^ ((v169 ^ (unint64_t)v153) << 36) ^ v170 ^ (((v174 | ((v169 ^ (unint64_t)v153) << 45)) ^ 0x21278C61855392E3)
                                                                       - 2
                                                                       * (((v174 | ((v169 ^ (unint64_t)v153) << 45)) ^ 0x21278C61855392E3) & 0x5C2BC6295C869FBELL ^ v174 & 0x14)
                                                                       + 0x5C2BC6295C869FAALL);
  uint64_t v176 = v173 ^ 0x7F1D10379022393BLL;
  uint64_t v177 = v173 ^ 0x7F1D10379022393BLL ^ (v170 - ((2 * v170) & 0x4468294827AD1A2CLL) - 0x5DCBEB5BEC2972EALL);
  unint64_t v178 = (v175 ^ 0x84F91E5017386969) & (v168 ^ 0xA9109542E9BBBCELL) ^ v177;
  unint64_t v179 = v167 & (v168 ^ 0xF56EF6ABD1644431) ^ v175 ^ 0x7B06E1AFE8C79696;
  *((void *)&v153 + 1) = v179 ^ v178 ^ 0x62F93;
  *(void *)&long long v153 = v179 ^ v178 ^ 0x69309AC4CA80000;
  uint64_t v180 = v179 ^ v178 ^ 0xD8EA11F9768A5E1CLL ^ (((v153 >> 19) ^ ((v179 ^ v178) << 36) ^ 0xCAE2F93000000000)
                                             - 2
                                             * (((v153 >> 19) ^ ((v179 ^ v178) << 36) ^ 0xCAE2F93000000000) & 0x5E7918553A24719FLL ^ (v153 >> 19) & 0x10)
                                             - 0x2186E7AAC5DB8E71);
  uint64_t v181 = (v180 ^ -v180 ^ ((((v179 ^ v178) >> 28) ^ 0x69309AC4) - (v180 ^ ((v179 ^ v178) >> 28) ^ 0x69309AC4)))
       + (((v179 ^ v178) >> 28) ^ 0x69309AC4);
  unint64_t v182 = v181 - 0x7D8AF4275EA9BD7ELL - ((2 * v181) & 0x4EA17B142AC8504);
  LOBYTE(v149) = *(unsigned char *)(a26 + ((v181 - 126 - ((2 * v181) & 4)) ^ 0xC4));
  *a32 = ((unsigned __int16)(v181 + 17026 - ((2 * v181) & 0x8504)) >> 8) ^ 0x42;
  a25[5] = ((v149 ^ 0x94) >> 6) | (4 * (v149 ^ 0x94));
  uint64_t v183 = (v182 >> 12) & 0xF0 | (v182 >> 20) & 0xF;
  LOBYTE(v160) = ((v182 >> 12) & 0xF0 | (v182 >> 20) & 0xF) ^ 0x9B;
  *a33 = (*(unsigned char *)(a21 + (v183 ^ 0x9B)) ^ 0xA1)
       + (v183 ^ 0x2E)
       + (v183 ^ 0xBB)
       - 2 * (((v183 ^ 0x2E) + (v183 ^ 0xBB)) & (*(unsigned char *)(a21 + (v183 ^ 0x9B)) ^ 0xA1))
       - 122;
  LOBYTE(v158) = *(unsigned char *)(a26 + (((v181 - 1588182398 - ((2 * v181) & 0x42AC8504u)) >> 24) ^ 0xE7)) ^ 0x94;
  *a35 = (v158 >> 6) | (4 * v158);
  v168 ^= 0x9F405F8AE2ED768DLL;
  uint64_t v184 = (v167 - ((2 * v167) & 0x2BA2ADBD98ED9A86) - 0x6A2EA921338932BDLL) ^ v168;
  unint64_t v185 = (((v173 ^ 0xDD29049383F4B42DLL) & ~v184 ^ v179)
        - ((2 * ((v173 ^ 0xDD29049383F4B42DLL) & ~v184 ^ v179)) & 0x2BA2ADBD98ED9A86)
        - 0x6A2EA921338932BDLL) ^ v168;
  *(void *)&long long v153 = __ROR8__((v185 >> 13) & 0x7000000000000 ^ __ROR8__(v185 ^ 0x2DB106AAC3821A36 ^ (((8 * v185) ^ (v185 << 25) ^ 0xBF0681A6CFCC6AD0)+ 0x4FB208FD4CFB976DLL+ (~(2* ((8 * v185) ^ (v185 << 25) ^ 0xBF0681A6CFCC6AD0)) | 0x609BEE056608D12FLL)), 16) ^ 0x59AF12027FFB7224, 48);
  uint64_t v186 = (v153 ^ -(uint64_t)v153 ^ (((v185 >> 39) ^ 0xC4061C) - (v153 ^ (v185 >> 39) ^ 0xC4061C)))
       + ((v185 >> 39) ^ 0xC4061C);
  LODWORD(v168) = *(unsigned __int8 *)(a19
                                     + ((((v182 >> 31) & 0xB8 ^ 0xB0) + (BYTE4(v182) ^ 4)) ^ 0x77));
  DWORD1(v153) = (v168 >> 6) ^ 0x7F ^ -((v168 >> 6) ^ 0x7F) ^ (((v168 >> 6) | (8 * v168))
                                                                                         - 127);
  LODWORD(v153) = (DWORD1(v153) + 4 * v168) << 24;
  a25[1] = v186 ^ 0xAC;
  a27[6] = (BYTE6(v182) ^ 0x75) - ((2 * (BYTE6(v182) ^ 0x75)) & 0x78) + 60;
  a25[4] = BYTE2(v186) ^ 0x24;
  *a36 = (unint64_t)v153 >> 26;
  unint64_t v187 = v184 ^ (v173 ^ 0x22D6FB6C7C0B4BD2) & v170;
  unint64_t v188 = (v187 >> 1) ^ (v187 >> 6) ^ ((v187 << 58) ^ 0xB800000000000000) & 0xE7FFFFFFFFFFFFFFLL ^ (((v187 << 58) ^ 0xB800000000000000) & 0x1800000000000000 ^ v187 & 0x183B3BDBC4516A26 | v187 & 0xE7C4C4243BAE95D9 ^ (v187 << 63));
  a27[12] = (BYTE3(v186) ^ 0x72) - ((2 * (BYTE3(v186) ^ 0x72)) & 0x78) + 60;
  *(unsigned char *)(a29 + 29) = HIBYTE(v182) ^ 0x82;
  a27[13] = (BYTE5(v182) ^ 0xB) - ((2 * (BYTE5(v182) ^ 0xB)) & 0x78) + 60;
  a23[6] = (v186 ^ 0x12027FFB722459ACuLL) >> (v160 & 8) >> (~(_BYTE)v160 & 8);
  LODWORD(v160) = *(unsigned __int8 *)(a19 + (((BYTE4(v186) ^ 0xFB) - 36) ^ 0x77));
  a23[4] = BYTE6(v186) ^ 2;
  *a25 = HIBYTE(v186) ^ 0x12;
  a23[2] = ((unsigned __int16)((v187 >> 1) ^ (v187 >> 6) ^ v187) >> 8) ^ 5;
  *a38 = BYTE5(v186) ^ 0x7F;
  LODWORD(v182) = (v160 >> 6) | (4 * v160);
  LODWORD(v160) = (((v187 >> 1) ^ (v187 >> 6) ^ v187) >> 16);
  a25[2] = (v187 >> 1) ^ (v187 >> 6) ^ v187 ^ 0xDB;
  *a23 = ((v182 ^ 0x7F) >> 2) | ((v182 ^ 0x7F) << 6);
  LOBYTE(v182) = *(unsigned char *)(a16
                          + (((v160 ^ 0x76) + (v160 ^ 0xFFFFFFAA) + 1) ^ 0xFFFFFFFE)
                          + (v160 ^ 0x76));
  *a37 = (((v187 >> 1) ^ (v187 >> 6) ^ v187) >> 24) ^ 0x87;
  uint64_t v189 = ((v187 ^ (v175 ^ 0x7B06E1AFE8C79696) & ~v177)
        - ((2 * (v187 ^ (v175 ^ 0x7B06E1AFE8C79696) & ~v177)) & 0x4468294827AD1A2CLL)
        - 0x5DCBEB5BEC2972EALL) ^ v176;
  unint64_t v190 = v189
       - ((2 * v189) & 0x9E2B77E5823BC0A6)
       + 0x4F15BBF2C11DE053
       - ((2 * (v189 - ((2 * v189) & 0x9E2B77E5823BC0A6) + 0x4F15BBF2C11DE053)) & 0x7D3B6EA98205E680)
       + 0x3E9DB754C102F340;
  LOBYTE(v168) = (v186 ^ 0xAC) & (v186 ^ 0x50);
  unint64_t v191 = v190 ^ (v190 << 47) ^ (v190 >> 10) ^ (v190 << 54);
  unint64_t v192 = v191 ^ (v190 >> 17);
  a25[3] = BYTE6(v188) ^ 0x5D;
  LOBYTE(v190) = (v182 ^ 0xF2 ^ (16 * v182) & 0x40) & 7 ^ 0x35 ^ ((unint64_t)((v182 ^ 0xF2 ^ (16 * v182) & 0x40) >> 3) << v168 << (v168 ^ 3u));
  a25[11] = v192 ^ 0x7D;
  *(unsigned char *)(a29 + 28) = BYTE5(v188) ^ 0x22;
  a25[13] = ((v190 >> 3) | (32 * v190)) ^ 0xA6;
  *a30 = BYTE2(v192) ^ 0x98;
  a27[8] = (HIBYTE(v188) ^ 0xA1) - ((2 * (HIBYTE(v188) ^ 0xA1)) & 0x78) + 60;
  a27[17] = (BYTE4(v188) ^ 0x3C) - 2 * ((BYTE4(v188) ^ 0x3C) & 0x3D ^ BYTE4(v188) & 1) + 60;
  uint64_t v193 = (v192 >> 20) & 0xF0 | (v192 >> 28);
  a27[11] = (BYTE1(v192) ^ 0xD3) - ((2 * (BYTE1(v192) ^ 0xD3)) & 0x78) + 60;
  LOBYTE(v168) = *(unsigned char *)(a21 + (v193 ^ 2));
  *(unsigned char *)a29 = BYTE6(v191) ^ 0x32;
  *a39 = BYTE5(v192) ^ 0xF;
  unint64_t v194 = v178 ^ (v178 << 23) ^ ((v178 >> 7) ^ (v178 >> 41) | (v178 << 57));
  *(unsigned char *)(a29 + 15) = BYTE3(v194) ^ 0x79;
  a27[19] = v194 ^ 0xAE;
  a23[5] = BYTE1(v194) ^ 0x3D;
  a25[8] = BYTE2(v194) ^ 3;
  a27[18] = (v168 ^ ((v193 ^ 0x22) + (v193 ^ 0xB7)) ^ 0xA1)
          - 2
          * (((v168 ^ ((v193 ^ 0x22) + (v193 ^ 0xB7)) ^ 0xA1) + 6) & 0x3D ^ (v168 ^ ((v193 ^ 0x22) + (v193 ^ 0xB7)) ^ 0xA1) & 1)
          - 62;
  a25[6] = BYTE4(v192) ^ 0x77;
  a23[7] = HIBYTE(v191) ^ 0x97;
  LOBYTE(v177) = *(unsigned char *)(a26 + (BYTE4(v194) ^ 0x19)) ^ 0x94;
  *(unsigned char *)(a29 + 14) = BYTE5(v194) ^ 0x49;
  a23[3] = HIBYTE(v194) ^ 0xBE;
  a23[1] = BYTE6(v194) ^ 0x75;
  *(unsigned char *)(a29 + 16) = (v177 >> 6) | (4 * v177);
  *(_DWORD *)(a29 + 4) = a17 + 4325459;
  JUMPOUT(0x10003BEB0);
}

uint64_t sub_10003BF30(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25)
{
  int v31 = 184 * (v25 ^ 0x5ED);
  *(_DWORD *)(v30 - 112) = v31
                         - 323
                         + 1225351577 * ((2 * ((v30 - 144) & 0x3E94D538) - (v30 - 144) - 1049941305) ^ 0xBF94B0F5);
  *(void *)(v30 - 144) = v26;
  *(void *)(v30 - 136) = v26;
  *(void *)(v30 - 128) = a24;
  *(void *)(v30 - 120) = a23;
  (*(void (**)(uint64_t))(v27 + 8 * (v31 ^ 0xB84)))(v30 - 144);
  *(_DWORD *)(v30 - 112) = v31
                         - 323
                         + 1225351577
                         * ((((v30 - 144) | 0x2F4E003) - (v30 - 144) + ((v30 - 144) & 0xFD0B1FF8)) ^ 0x7C0B7A31);
  *(void *)(v30 - 128) = a24;
  *(void *)(v30 - 120) = a23;
  *(void *)(v30 - 144) = a25;
  *(void *)(v30 - 136) = a25;
  (*(void (**)(uint64_t))(v27 + 8 * (v31 ^ 0xB84)))(v30 - 144);
  int v32 = 535753261 * ((((v30 - 144) | 0x4611E399) + (~(v30 - 144) | 0xB9EE1C66)) ^ 0x4CE5EDB7);
  *(_DWORD *)(v30 - 144) = v28 - v32 + ((9 * (v31 ^ 0x382)) ^ 0xE3FA5F30);
  *(_DWORD *)(v30 - 140) = v31 - v32 + 832;
  *(void *)(v30 - 136) = v29;
  uint64_t v33 = (*(uint64_t (**)(uint64_t))(v27 + 8 * (v31 ^ 0xB8C)))(v30 - 144);
  return (*(uint64_t (**)(uint64_t))(v27 + 8
                                                  * (((*(_DWORD *)(v30 - 128) != 453445646) * (v31 ^ 0x3D7)) ^ v31)))(v33);
}

uint64_t sub_10003C0C8(uint64_t a1)
{
  return sub_10003C158(a1, 1181, 0x7FFD1ADCF836F79FLL, 0x1F06DEF3ELL, 0xACDBFDFB37DD3E7BLL, 2422812654, 1335028728, 1086);
}

uint64_t sub_10003C158(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, int a7, int a8)
{
  uint64_t v20 = 4 * (v19 + v14);
  int v21 = v8 + v16 + (*(_DWORD *)(*v11 + v20) ^ v17) + (*(_DWORD *)(*v12 + v20) ^ v17);
  *(_DWORD *)(*v13 + v20) = v21 + v17 - (v15 & (2 * v21));
  BOOL v23 = v19 + a6 > a7 || v19 + a6 < v9;
  return (*(uint64_t (**)(void))(v18 + 8 * ((v23 * a8) ^ v10)))();
}

uint64_t sub_10003C1DC()
{
  return 0;
}

uint64_t sub_10003C21C(uint64_t a1, int a2)
{
  return (*(uint64_t (**)(uint64_t))(v5
                                            + 8
                                            * ((((a2 - 1075) ^ a2 ^ 0x7C6) * (v3 - v4 - 1871448105 == v2 + 1713657990)) ^ a2)))(1158830123);
}

uint64_t sub_10003C26C@<X0>(_DWORD *a1@<X8>)
{
  *a1 = v1;
  return sub_10003C278();
}

void sub_10003C278()
{
  *(_DWORD *)(v1 + 4) = v0;
}

void sub_10003C2B0()
{
}

uint64_t sub_10003C410@<X0>(uint64_t a1@<X8>)
{
  uint64_t v5 = *(void *)(v3 - 0x3D8A64FC11846102);
  int v6 = ((*(unsigned __int8 *)(v5 + (v2 - 1405494216)) ^ 0x52) << 24) | ((*(unsigned __int8 *)(v5 + (v2 - 1405494215)) ^ 0x52) << 16) | ((*(unsigned __int8 *)(v5 + ((v4 + 922741011) & 0xC90015DD ^ 0xAC39D8F7) + v2) ^ 0x52) << 8) | *(unsigned __int8 *)(v5 + (v2 - 1405494213)) ^ 0x52;
  return (*(uint64_t (**)(void))(a1 + 8 * ((53 * (((v6 + v1 - ((2 * v6) & 0x75DA07EA)) & 0xFFFFFF) != 1448621)) ^ v4)))();
}

uint64_t sub_10003C4D0()
{
  return sub_10003C4D8();
}

uint64_t sub_10003C4D8()
{
  return (*(uint64_t (**)(void))(v2 + 8
                                   * ((1919 * (v0 < ((v1 - 2049268174) & 0x7A25569F ^ 0x7FFFFB68u))) ^ (v1 - 1680))))();
}

void sub_10003C520()
{
}

uint64_t sub_10003C52C()
{
  return (*(uint64_t (**)(void))(v2
                              + 8
                              * (((((v0 - 343) | 0x187) - 1737) * (*(_DWORD *)(v1 - 0x3D8A64FC118460F2) == 1405494216)) ^ v0)))();
}

uint64_t sub_10003C574()
{
  int v3 = ((v1 - 1726) ^ 0x22FD9970) - v2;
  if (v2 + 1853961083 < 0) {
    int v3 = v2;
  }
  return (*(uint64_t (**)(void))(v0 + 8 * ((1452 * (v3 - 293522566 >= 0)) ^ (v1 - 1726))))();
}

uint64_t sub_10003C610(uint64_t a1, uint64_t a2, int a3, uint64_t a4, int a5)
{
  return (*(uint64_t (**)(void))(v6 + 8 * (((4 * (v5 == v7)) | ((v5 == v7) << 6)) ^ (a5 + a3 + 169))))();
}

void sub_10003C644()
{
}

uint64_t sub_10003C64C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,int a36)
{
  return (*(uint64_t (**)(void))(v37 + 8 * ((1157 * (v38 < (a36 & 0xB382977E) + 1894883878)) ^ (v36 - 1404883218))))();
}

uint64_t sub_10003C6A4(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  return (*(uint64_t (**)(uint64_t, void))(v6 + 8 * (((((v5 - 292) | 0x85) ^ 0x6F6) * (v4 == a4)) ^ v5)))(a1, (v5 + 915));
}

uint64_t sub_10003C6D8()
{
  return (*(uint64_t (**)(void))(v2 + 8 * (((v0 != (v1 ^ 0x63B) + 6) * ((v1 + 161) ^ 0x6B5)) ^ v1)))();
}

uint64_t sub_10003C720@<X0>(int a1@<W8>)
{
  if ((a1 - 363543247) <= 0x10 && ((1 << (a1 + 49)) & 0x14103) != 0) {
    return (*(uint64_t (**)(void))(v3
  }
                                + 8
                                * ((21
                                  * ((((((v2 - 273804640) & 0x888E48FB) + 0xFFFFFFFFFFFFE59) ^ ((v2 + 2017221514) | 0x14u)) & v1) != 0)) ^ (v2 + 2017221549))))();
  else {
    return sub_10003F71C();
  }
}

void sub_10003C7C4()
{
}

void sub_10003C834(uint64_t a1)
{
  int v1 = 460628867 * (a1 ^ 0x4C96827D);
  int v2 = *(_DWORD *)a1 + v1;
  unsigned int v3 = (*(_DWORD *)(a1 + 44) ^ v1 ^ 0xC52A80A9) + ((2 * (*(_DWORD *)(a1 + 44) ^ v1)) & 0xFBFE88B8 ^ 0x71AA88A8);
  unsigned int v4 = 3804331 * ((2 * (v7 & 0x347AC888) - v7 - 880461965) ^ 0x44202CB5);
  unsigned int v5 = v4 + 1926004923 * (v1 ^ *(_DWORD *)(a1 + 24) ^ 0x29FE703E);
  v7[1] = *(void *)(a1 + 56);
  v7[2] = &STACK[0x14F716D90F32FE87];
  unsigned int v10 = v5 + 77507090;
  int v8 = v2 + v4 + 304;
  unsigned int v9 = v3 + v4 + 1257635824;
  v7[0] = &STACK[0x2565C4DA53AB2E99];
  uint64_t v6 = (uint64_t)*(&off_10005CE90 + v2 - 262);
  (*(void (**)(void *))(v6 + 8 * (v2 + 1763)))(v7);
  __asm { BRAA            X9, X17 }
}

uint64_t sub_10003C9E0(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  *(_DWORD *)(result + 32) = a5;
  return result;
}

void sub_10003C9F0(uint64_t a1@<X8>, int a2, uint64_t a3, unsigned int a4)
{
  unsigned int v8 = 1178560073 * (&a2 ^ 0xBA947862);
  a4 = v8 - v4 - ((-1906280556 - v6) & 0x97F7E2C2) + ((v7 - 663514604) & 0x278C6DEB ^ 0x132C28C9);
  a3 = v5;
  a2 = (v7 - 1400) ^ v8;
  (*(void (**)(int *))(a1 + 8 * (v7 + 605)))(&a2);
  JUMPOUT(0x100019DD4);
}

uint64_t sub_10003CA84(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28)
{
  int v32 = 3804331 * ((((v31 - 200) | 0x211E3AE4) - ((v31 - 200) & 0x211E3AE4)) ^ 0xAEBB2122);
  *(void *)(v31 - 192) = a28;
  *(_DWORD *)(v31 - 200) = (v29 - (((v28 ^ 0x44A) + 1977221369) & (2 * v29 + 1115720718)) + 1546471932) ^ v32;
  *(_DWORD *)(v31 - 196) = v28 - v32 + 1216;
  (*(void (**)(uint64_t))(v30 + 8 * (v28 + 1397)))(v31 - 200);
  return sub_10001C650();
}

void sub_10003CB24()
{
}

uint64_t sub_10003CB30@<X0>(uint64_t a1@<X8>)
{
  STACK[0x3E0] = 104 - a1;
  int v2 = (uint64_t (*)(void))STACK[0x528];
  STACK[0x210] = v1 - 112;
  STACK[0x408] = v1 - 112;
  return v2();
}

uint64_t sub_10003CB54@<X0>(int a1@<W0>, int a2@<W3>, int a3@<W7>, int a4@<W8>)
{
  int v10 = 818 * (v7 ^ 0x48F);
  unsigned int v11 = a1 + a4 + 1;
  BOOL v12 = v5 < v6;
  *(unsigned char *)(v8 - 0x1FA9E8BAFD93F9B8 + (v4 + a3)) = *(unsigned char *)(STACK[0x328]
                                                                             + (a4 - 1329417966));
  if (v12 == v11 < (((v10 - 1463) | 0x150) ^ (a2 + 1448))) {
    BOOL v12 = v11 < v5;
  }
  return (*(uint64_t (**)(void))(v9 + 8 * (((4 * !v12) | (8 * !v12)) ^ v10)))();
}

uint64_t sub_10003CBF4()
{
  BOOL v4 = (*(uint64_t (**)(void, uint64_t))(v0 + 8 * (v3 + 1137)))(*(_DWORD *)(v2 + 24 * v1 + 16) + ((v3 - 124) ^ 0x2F3u) - 1228396730, 2970849626) != 0;
  return (*(uint64_t (**)(void))(v0 + 8 * ((2001 * v4) ^ v3)))();
}

uint64_t sub_10003CC5C@<X0>(uint64_t a1@<X0>, int a2@<W1>, int a3@<W7>, uint64_t a4@<X8>)
{
  *(_DWORD *)(*v6 + 4 * (((v8 - 75) ^ a3) + v4)) = a2;
  return (*(uint64_t (**)(uint64_t, uint64_t))(a4 + 8
                                                          * ((v9 == ((((v8 - 729) | v7) + 1256) ^ v5)) ^ (v8 - 75))))(a1, 3001514288);
}

uint64_t sub_10003CCA8(uint64_t a1, int a2)
{
  return (*(uint64_t (**)(void, uint64_t))(v3 + 8 * (((v2 ^ 0xD5CE41A8) == (a2 ^ 0x63B) - 1381) | a2)))(a2 ^ 0x1777C51Bu, 728585860);
}

void sub_10003CD00(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 44) - 1224239923 * (((a1 | 0x1FD8AEE4) - a1 + (a1 & 0xE027511B)) ^ 0xED6B5333);
  __asm { BRAA            X0, X17 }
}

void sub_10003CE40()
{
}

void sub_10003CF18()
{
}

uint64_t sub_10003CF58()
{
  return (*(uint64_t (**)(void))(*(void *)(v3 + 8 * (v0 - 295))
                              + 8 * ((((v4 & 2) == (v1 ^ (2 * v0) ^ (v0 + 43))) * v2) ^ v0)))();
}

void sub_10003CF90()
{
}

void sub_10003D024()
{
  STACK[0x518] = *(void *)(v0 + 8 * (LODWORD(STACK[0x2AC]) - 1722));
  JUMPOUT(0x1000039F8);
}

uint64_t sub_10003D044()
{
  return (*(uint64_t (**)(void))(v2 + 8 * (((v1 != ((v0 - 617) | 0x1A8) + 1228395374) * ((v0 + 629) ^ 0x605)) ^ v0)))();
}

uint64_t sub_10003D088(uint64_t a1, uint64_t a2, unsigned int a3, uint64_t a4, char a5)
{
  return (*(uint64_t (**)(void))(v5
                              + 8
                              * ((735
                                * ((((*(unsigned __int8 *)(a2 + 7) - 100) << (v6 + (a3 ^ a5) + 28)) & v8)
                                 + ((*(unsigned __int8 *)(a2 + 7) - 100) ^ v7) == v7)) ^ a3)))();
}

uint64_t sub_10003D0D0()
{
  *(void *)(v8 - 144) = v0;
  *(void *)(v8 - 136) = v0;
  *(_DWORD *)(v8 - 112) = v7 + ((2 * ((v8 - 144) & 0x46732040) - (v8 - 144) - 1181950024) ^ 0xC773458A) * v5 - 1161;
  *(void *)(v8 - 128) = v4;
  *(void *)(v8 - 120) = v3;
  (*(void (**)(uint64_t))(v1 + 8 * (v7 ^ 0xEC2)))(v8 - 144);
  int v9 = 535753261 * ((v8 + 585069490 - 2 * ((v8 - 144) & 0x22DF7442)) ^ 0x282B7A6D);
  *(void *)(v8 - 136) = v6;
  *(_DWORD *)(v8 - 144) = -470130727 - v9 + v2 + 2;
  *(_DWORD *)(v8 - 140) = v7 - v9 - 6;
  uint64_t v10 = (*(uint64_t (**)(uint64_t))(v1 + 8 * (v7 + 310)))(v8 - 144);
  return (*(uint64_t (**)(uint64_t))(v1
                                            + 8
                                            * (int)(((*(_DWORD *)(v8 - 128) != 453445646)
                                                   * ((v7 + 28603932) & 0xFE4B87AF ^ 0x494)) ^ v7)))(v10);
}

uint64_t sub_10003D1E4@<X0>(uint64_t a1@<X1>, unint64_t a2@<X2>, int a3@<W3>, int a4@<W5>, void *a5@<X6>, int a6@<W7>, unint64_t a7@<X8>, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  uint64_t v37 = 4 * (v35 + 1 + a3);
  unint64_t v38 = (*(_DWORD *)(a24 + v37) ^ v25)
      + ((a7 >> (((a6 + 75) | v26) - 28)) ^ a1)
      + v24 * (unint64_t)(*(_DWORD *)(*a5 + v37) ^ v25);
  unint64_t v39 = HIDWORD(v32)
      + v30 * (unint64_t)(*(_DWORD *)(*v33 + v37) ^ v25)
      + ((v38 + v29 - (a4 & (2 * v38))) ^ a2);
  *(_DWORD *)(a24 + 4 * (v35 + a3)) = v39 + v25 - (v27 & (2 * v39));
  BOOL v41 = v35 + v36 > v28 || v35 + v36 < v34;
  return (*(uint64_t (**)(void))(v31 + 8 * (a6 | (2 * v41))))();
}

void sub_10003D284()
{
}

uint64_t sub_10003D35C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, int a9@<W8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,int a21,int a22,int a23)
{
  uint64_t v31 = &a23 + 6 * v24;
  v31[2] = v29;
  v31[3] = v25;
  *((void *)v31 + 2) = a18;
  v31[6] = a21;
  a23 = v23 + 1;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v28 + 8 * (((a9 + *(_DWORD *)(v26 + 48 * v27 + 32) + 1071617037 < v30) * (((a9 - 224) | 0x116) + 231)) ^ a9)))(a1, a2, a3, a4, a5, a6, a7, a8, a10, a11, a12, a13);
}

uint64_t sub_10003D3CC(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  LODWORD(STACK[0x290]) = 582388011;
  LODWORD(STACK[0x464]) = a4 + 161;
  return sub_10003EAFC(a1);
}

void sub_10003D3E8()
{
}

uint64_t sub_10003D3F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, void))(v8
                                                                      + 8
                                                                      * ((13
                                                                        * (v9 >= ((a8 + 899980) | 0x386040B8u)
                                                                               - 946732440)) ^ a8)))(a1, a2, a3, 0);
}

void sub_10003D43C()
{
}

void sub_10003D458()
{
}

uint64_t sub_10003D470@<X0>(int a1@<W1>, int a2@<W4>, int a3@<W8>, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,int a24,int a25)
{
  BOOL v28 = v25 != a1 && a25 - a2 == -112928127;
  return (*(uint64_t (**)(void))(v26 + 8 * ((v28 * ((a3 - 20) ^ 0x87)) ^ a3)))();
}

uint64_t sub_10003D4B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,int a54,int a55,unint64_t a56,uint64_t a57,uint64_t a58,unint64_t a59,char *a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  STACK[0x528] = *(void *)(v69 + 8 * (v68 - 1721));
  a60 = (char *)&a9 - 0x14D7FC5203D9743;
  a59 = ((unint64_t)&STACK[0x3E0] ^ 0x7EF6DF7DF6E6E875 ^ (3 * (v68 ^ 0x47Cu)))
      + ((2 * (void)&STACK[0x3E0]) & 0xFDEDBEFBEDCDDFA0)
      - 0x18400A40F09FFFD2;
  a56 = a59 + 17;
  LODWORD(STACK[0x220]) = v68 ^ 0x4C6;
  a68 = (v68 - 1277962995) & 0x4C2C277D;
  a55 = v68 ^ 0x21A;
  a66 = v68 ^ 0x277;
  return sub_10003D59C(a1, 48, 1754, (__n128)0);
}

uint64_t sub_10003D59C@<X0>(int a1@<W8>)
{
  STACK[0x408] = v2 + 112;
  STACK[0x380] = v1;
  if (v1) {
    BOOL v6 = v3 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  int v7 = !v6;
  return (*(uint64_t (**)(void))(v5 + 8 * ((v7 * ((a1 - 302) ^ v4)) ^ a1)))();
}

uint64_t sub_10003D5D0(uint64_t a1, uint64_t a2, unsigned int a3)
{
  return (*(uint64_t (**)(void))(v3
                              + 8
                              * ((1960
                                * ((v6 & (2 * (*(unsigned __int8 *)(a2 + 6) - 44)))
                                 + ((v4 + a3 - 229) ^ 0x6EFCB262 ^ (*(unsigned __int8 *)(a2 + 6) - 44)) == v5)) ^ a3)))();
}

uint64_t sub_10003D61C()
{
  LODWORD(STACK[0x558]) = v0;
  return sub_10001BE48();
}

uint64_t sub_10003D640@<X0>(int a1@<W0>, uint64_t a2@<X8>, __n128 a3@<Q0>)
{
  int v7 = (__n128 *)(v5 + v3);
  v7[73] = a3;
  v7[74] = a3;
  return (*(uint64_t (**)(void))(v6 + 8 * (((a2 == v3) * a1) ^ v4)))();
}

uint64_t sub_10003D66C()
{
  int v5 = 535753261 * (((((v4 - 120) | 0x5B53723A) ^ 0xFFFFFFFE) - (~(v4 - 120) | 0xA4AC8DC5)) ^ 0xAE5883EA);
  *(void *)(v4 - 120) = v3;
  *(_DWORD *)(v4 - 112) = v5 + v0 + 5 * (v2 ^ 0x182) - 49591930;
  *(_DWORD *)(v4 - 108) = (v2 + 1234) ^ v5;
  uint64_t v6 = (*(uint64_t (**)(uint64_t))(v1 + 8 * (v2 + 1800)))(v4 - 120);
  return sub_10003D6F0(v6);
}

uint64_t sub_10003D6F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21)
{
  *(_DWORD *)(v25 - 112) = v23 + ((((v25 - 120) | 0x6840D74F) + (~(v25 - 120) | 0x97BF28B0)) ^ 0xE7E5CC88) * v22 + 947;
  *(void *)(v25 - 104) = a19;
  *(void *)(v25 - 120) = a21;
  uint64_t v26 = (*(uint64_t (**)(uint64_t))(v21 + 8 * (v23 ^ 0xA9B)))(v25 - 120);
  return (*(uint64_t (**)(uint64_t))(v21
                                            + 8
                                            * (((*(_DWORD *)(v25 - 108) + ((v23 + 619785253) & 0xDB0ED359 ^ (v24 - 601)) < 0xF40DF1D5)
                                              * ((v23 + 645) ^ 0x567)) ^ v23)))(v26);
}

uint64_t sub_10003D7B0@<X0>(uint64_t a1@<X2>, int a2@<W8>)
{
  int v6 = *(_DWORD *)((char *)&STACK[0x2A8] + ((v4 + a2) & 0xFFFFFFFC) + 72);
  *(unsigned char *)(a1 + (v4 + a2)) = (HIBYTE(v6) ^ 0x2C) - (((v3 ^ 0xD6) + 94) & (2 * HIBYTE(v6))) + 82;
  *(unsigned char *)(a1 + (v4 + a2 + 1)) = (BYTE2(v6) ^ 0xE7) - ((2 * (BYTE2(v6) ^ 0xE7)) & 0xA4) + 82;
  *(unsigned char *)(a1 + (v4 + a2 + 2)) = (BYTE1(v6) ^ 0xD3)
                                               - 2 * ((BYTE1(v6) ^ 0xD3) & 0x56 ^ BYTE1(v6) & 4)
                                               + 82;
  *(unsigned char *)(a1 + (v4 + a2 + 3)) = v6 ^ 0xF4;
  unsigned int v7 = LODWORD(STACK[0x304]) + 1452183546;
  BOOL v8 = v7 < v2;
  BOOL v9 = v4 + 1533356661 < v7;
  if (v4 + 1533356661 < v2 != v8) {
    BOOL v9 = v8;
  }
  return (*(uint64_t (**)(void))(v5 + 8 * ((533 * v9) ^ v3)))();
}

uint64_t sub_10003D8A4(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3
                                                              + 8
                                                              * (((v4 < ((v2 - 1404883171) ^ 0x95B4EC88))
                                                                * (v2 ^ (v2 - 577) ^ 0x58C)) ^ (v2 - 1404883171))))(a1, a2, 1404883838);
}

uint64_t sub_10003D8F4(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  return (*(uint64_t (**)(void))(v5
                              + 8
                              * (((((v4 < 0x20) ^ (89 * (a4 ^ 0xFE) + 1)) & 1) * (a4 - 1781)) | a4)))();
}

uint64_t sub_10003D938()
{
  uint64_t v5 = (v1 - 305) | 0x50Du;
  *(void *)(v4 - 220 + v2 + ((v5 - 962) ^ 0xFFFFFFFFBFB7D29CLL)) = 0x5252525252525252;
  return (*(uint64_t (**)(uint64_t))(v3 + 8 * (int)((37 * (((v5 ^ 0xFFFFFFFFFFFFFAF7) & v0) != 8)) ^ v5)))(8);
}

uint64_t sub_10003D9AC(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(v2
                              + 8
                              * ((1140
                                * (((v3 ^ 0x86CBF293) & (2 * (*(unsigned __int8 *)(a2 + 1) - 146)))
                                 + ((*(unsigned __int8 *)(a2 + 1) - 146) ^ v4) == v4)) ^ 0xE5u)))();
}

uint64_t sub_10003DA00(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,int a45)
{
  LODWORD(STACK[0x290]) = v47;
  LODWORD(STACK[0x288]) = v46;
  STACK[0x210] = v45;
  int v51 = 3804331 * ((-1740393391 - ((v50 - 200) | 0x9843B451) + ((v50 - 200) | 0x67BC4BAE)) ^ 0xE8195068);
  int v52 = v51 + LODWORD(STACK[0x2B8]) - 454779872;
  *(void *)(v50 - 184) = a42;
  *(_DWORD *)(v50 - 172) = v52;
  *(_DWORD *)(v50 - 168) = v51 + (v48 + 1926002756 + ((v48 + 585) | 0x2C0)) * a45 - 1131158003;
  *(_DWORD *)(v50 - 176) = v51 + v48 + 267;
  *(void *)(v50 - 200) = a41;
  *(void *)(v50 - 192) = a44;
  uint64_t v53 = (*(uint64_t (**)(uint64_t))(v49 + 8 * (v48 ^ 0x9C2)))(v50 - 200);
  int v54 = *(_DWORD *)(v50 - 164);
  LODWORD(STACK[0x464]) = v54;
  return (*(uint64_t (**)(uint64_t))(v49 + 8 * ((1800 * (v54 == -1158872075)) ^ v48)))(v53);
}

uint64_t sub_10003DB0C()
{
  return (*(uint64_t (**)(void))(v3 + 8
                                   * ((1100 * (((v0 + 3 * (v1 ^ 0x30Bu) - 56) & 0x7FFFFFFFFFFFFFF0) == v2)) ^ v1)))();
}

uint64_t sub_10003DB48()
{
  return sub_10003DB50();
}

uint64_t sub_10003DB50()
{
  int v5 = 1755732067 * ((v4 - 200) ^ 0xDEC6BDDB);
  *(_DWORD *)(v4 - 192) = v5 + v3 - 1478;
  *(_DWORD *)(v4 - 188) = v0 - v5 - 1136668672;
  *(void *)(v4 - 200) = v1;
  uint64_t v6 = (*(uint64_t (**)(uint64_t))(v2 + 8 * (v3 ^ 0xEC5)))(v4 - 200);
  return ((uint64_t (*)(uint64_t))STACK[0x518])(v6);
}

void sub_10003DBC0()
{
}

uint64_t sub_10003DBCC@<X0>(int a1@<W8>)
{
  *(unsigned char *)(*v2 + (v3 + v6)) = *(unsigned char *)(*v2 + (v6 + v5));
  return (*(uint64_t (**)(void))(v8 + 8 * (((v6 + v4 - 1936 == a1) * v7) ^ v1)))();
}

void sub_10003DC08()
{
}

uint64_t sub_10003DC2C()
{
  return (*(uint64_t (**)(void))(v1 + 8 * ((927 * (STACK[0x498] != 0)) ^ (v0 - 1332))))();
}

void sub_10003DC6C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(unsigned char *)(a4 + v6 + (v4 | 0x200u) + 56 - 670) = v5;
  JUMPOUT(0x100033930);
}

uint64_t sub_10003DCA8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50)
{
  int v55 = (v50 - 536) | 0x20;
  int v56 = 7 * (v55 ^ v52);
  int v57 = 535753261 * ((((v54 - 200) | 0xC8F0DEF3) - (v54 - 200) + ((v54 - 200) & 0x370F2108)) ^ 0xC204D0DC);
  *(void *)(v54 - 176) = a50;
  *(void *)(v54 - 168) = v51;
  *(void *)(v54 - 184) = a49;
  *(_DWORD *)(v54 - 196) = -1769365460 - v57;
  *(_DWORD *)(v54 - 192) = (v55 + 8) ^ v57;
  uint64_t v58 = (*(uint64_t (**)(uint64_t))(v53 + 8 * (v55 + 1554)))(v54 - 200);
  return (*(uint64_t (**)(uint64_t))(v53
                                            + 8
                                            * (((*(_DWORD *)(v54 - 200) != v56 - 1158872138) * ((v55 - 505) ^ 0x76)) ^ v55)))(v58);
}

uint64_t sub_10003DD9C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  BOOL v12 = (_DWORD *)(v9 + 4 * (v6 + v10));
  int v13 = *(v12 - 8) ^ *(_DWORD *)(v9 + 4 * (v6 + v10 + ((a5 + 442) | 0x410u)) - 6220);
  int v14 = v13 + v11 - (v5 & (2 * v13));
  int v15 = *(v12 - 16) ^ *(v12 - 14);
  HIDWORD(v16) = v15 ^ 0x3AED03F5 ^ v14;
  LODWORD(v16) = v15 ^ ~v14;
  _DWORD *v12 = (v16 >> 31) + v11 - (v5 & (2 * (v16 >> 31)));
  return (*(uint64_t (**)(void))(v8 + 8 * ((871 * (v6 + 1 == v7 + 80)) ^ (a5 + 1329))))();
}

uint64_t sub_10003DE3C()
{
  *(void *)(v3 + v0 - 0x1FA9E8BB609067E2) = v6;
  return (*(uint64_t (**)(uint64_t))(v4
                                            + 8
                                            * ((((v1 & 0x38) - (unint64_t)(v2 + 323) == -1757)
                                              * v5) ^ (v2 - 1189))))((v2 + 323) - 1757);
}

uint64_t sub_10003DE98()
{
  return (*(uint64_t (**)(void))(v2
                              + 8
                              * ((145 * (((3 * (v1 ^ 0xF5)) ^ (((v1 - 821) ^ v0) < 8)) & 1)) ^ v1)))();
}

void sub_10003DED8()
{
  uint64_t v3 = (*(uint64_t (**)(uint64_t))(v1 + 8 * (v2 ^ 0x572)))(16);
  uint64_t v4 = *(uint64_t **)(v0 + 8 * (v2 ^ 0x29D));
  uint64_t *v4 = v3;
  (*(void (**)(void))(v1 + 8 * (v2 + 1519)))();
  int v5 = (void *)(*(uint64_t (**)(uint64_t))(v1 + 8 * (v2 + 1362)))(8);
  uint64_t v6 = *(void *)(v0 + 8 * (v2 ^ 0x2A1));
  *(void *)(v6 - 4) = v5;
  void *v5 = 0xBDBDBDBDBDBDBDBDLL;
  uint64_t v7 = *(void *)(v0 + 8 * (v2 - 608));
  *(_DWORD *)(v7 + 4) = 0;
  **(_DWORD **)(v0 + 8 * (v2 ^ 0x2EB)) = 0;
  uint64_t v8 = (unsigned char *)*v4;
  uint64_t v9 = *(unsigned char **)(v6 - 4);
  v9[6] = 26;
  *uint64_t v8 = -77;
  v9[4] = -34;
  uint64_t v10 = *(unsigned char **)(v0 + 8 * (v2 - 642));
  *(v10 - 2) = 115;
  v10[5] = 92;
  *(unsigned char *)(v7 + 29) = 68;
  v10[10] = -124;
  v8[4] = 73;
  unsigned char *v10 = 45;
  *(unsigned char *)(v7 + 28) = 83;
  **(unsigned char **)(v0 + 8 * (v2 ^ 0x293)) = -113;
  v8[1] = 80;
  **(unsigned char **)(v0 + 8 * (v2 - 476)) = 88;
  v10[9] = 19;
  **(unsigned char **)(v0 + 8 * (v2 ^ 0x2EA)) = 1;
  _DWORD v8[2] = -44;
  **(unsigned char **)(v0 + 8 * (v2 - 532)) = 51;
  _DWORD v9[2] = 80;
  v8[6] = -11;
  **(unsigned char **)(v0 + 8 * (v2 - 500)) = 25;
  **(unsigned char **)(v0 + 8 * (v2 - 509)) = 39;
  v8[5] = -22;
  v8[3] = -15;
  v10[4] = 90;
  *(unsigned char *)(v7 + 14) = -52;
  v10[11] = -7;
  **(unsigned char **)(v0 + 8 * (v2 - 547)) = -109;
  v8[13] = 99;
  **(unsigned char **)(v0 + 8 * (v2 ^ 0x239)) = 119;
  *uint64_t v9 = -122;
  v9[7] = -80;
  unsigned char v8[8] = 34;
  v10[3] = -69;
  v8[11] = 54;
  *(unsigned char *)(v7 + 15) = 3;
  v9[5] = -5;
  v9[1] = 73;
  *(unsigned char *)(v7 + 16) = -36;
  *(unsigned char *)uint64_t v7 = 23;
  v9[3] = 59;
  int v11 = (unsigned char *)*v4;
  v11[10] = 45;
  v11[15] = -87;
  *(v10 - 4) = 24;
  v10[7] = -80;
  *(unsigned char *)(v7 + 25) = -92;
  v10[1] = -27;
  v10[6] = 28;
  *(unsigned char *)(v7 + 27) = 52;
  *(v10 - 8) = -51;
  *(_WORD *)(v7 + 10) = -3774;
  *(unsigned char *)(v7 + 22) = -121;
  *(unsigned char *)(v7 + 20) = 77;
  *(unsigned char *)(v7 + 26) = 113;
  v11[9] = 31;
  v10[12] = 51;
  v10[2] = -52;
  *(unsigned char *)(v7 + 8) = -85;
  *(v10 - 3) = -27;
  *(v10 - 6) = 85;
  *(unsigned char *)(v7 + 2) = 34;
  v10[8] = 49;
  v11[12] = -86;
  *(v10 - 5) = -50;
  v11[7] = -90;
  v11[14] = -33;
  *(unsigned char *)(v7 + 21) = -105;
  *(unsigned char *)(v7 + 3) = -98;
  *(v10 - 1) = 28;
  *(unsigned char *)(v7 + 24) = -119;
  *(unsigned char *)(v7 + 30) = 58;
  *(unsigned char *)(v7 + 12) = 73;
  *(unsigned char *)(v7 + 1) = -15;
  *(v10 - 7) = 116;
  *(unsigned char *)(v7 + 19) = 120;
  *(unsigned char *)(v7 + 13) = 69;
  *(_WORD *)(v7 + 17) = -4168;
  *(unsigned char *)(v7 + 9) = -105;
  *(unsigned char *)(v7 + 23) = 79;
  JUMPOUT(0x10003E76CLL);
}

uint64_t sub_10003E7A8@<X0>(uint64_t a1@<X2>, uint64_t a2@<X8>)
{
  *(unsigned char *)(a2 + a1 + v3 + (v2 - 1413) - 30) = v4;
  return (*(uint64_t (**)(void))(v5
                              + 8
                              * (((4 * ((unint64_t)(a2 + a1) > 0x3F)) | (16 * ((unint64_t)(a2 + a1) > 0x3F))) ^ v2)))();
}

uint64_t sub_10003E7E0()
{
  return (*(uint64_t (**)(void))(v2 + 8 * (int)(((((v1 ^ 0xB5898A8B) + 1249279601) ^ 0x7EC) * (v0 != 63)) ^ v1)))();
}

void sub_10003E81C(uint64_t a1@<X8>)
{
  int v5 = (v2 - 156) | 0x95;
  *(void *)(v4 - 120) = v1 - 7;
  *(void *)(v4 - 136) = a1 - 7;
  *(_DWORD *)(v4 - 152) = (v5 ^ 0xFFFFFC27) & v3;
  *(_DWORD *)(v4 - 124) = v5;
  JUMPOUT(0x10003E8A4);
}

uint64_t sub_10003E988()
{
  return (*(uint64_t (**)(void))(v1
                              + 8
                              * ((((v0 + 1551) ^ 0x35F ^ (2 * v0) ^ 0x444)
                                * (*(_DWORD *)(v2 - 124) == *(_DWORD *)(v2 - 136))) ^ v0)))();
}

uint64_t sub_10003E9C4()
{
  return (*(uint64_t (**)(void))(v4
                              + 8
                              * ((((v1 & (2 * (*(unsigned __int8 *)(v3 + 4) - 247)))
                                 + ((*(unsigned __int8 *)(v3 + 4) - 247) ^ v0) == v0)
                                * (61 * (v2 ^ 0xFA) - 604)) ^ v2)))();
}

uint64_t sub_10003EA08(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8)
{
  unsigned int v12 = v10 + a8 - 766983562;
  BOOL v13 = v12 < 0x9483081D;
  BOOL v14 = v12 > v8 + 408900100;
  if ((v8 + 408900100) < 0x9483081D != v13) {
    BOOL v14 = v13;
  }
  return (*(uint64_t (**)(void))(v9 + 8 * (v11 | (4 * ((v14 ^ (5 * (v11 ^ 0x28))) & 1)))))();
}

void sub_10003EA7C()
{
}

void sub_10003EADC()
{
}

uint64_t sub_10003EAFC()
{
  int v1 = (char *)&STACK[0x5A0] + (v0 + 114) + STACK[0x210] - 0x14D7FC5203D9D4ALL;
  STACK[0x270] = (unint64_t)(v1 + 2048);
  STACK[0x280] = (unint64_t)(v1 + 2176);
  STACK[0x2A0] = (unint64_t)v1;
  STACK[0x278] = (unint64_t)(v1 + 2304);
  return sub_100029E8C();
}

uint64_t sub_10003EB4C(uint64_t a1, int a2, uint64_t a3, uint64_t a4, int a5)
{
  return (*(uint64_t (**)(void))(v7
                              + 8
                              * ((((*(unsigned char *)(v8 + (v6 + a5) * (uint64_t)a2 + 40) & 8) == 0) * ((v5 + 196) ^ (v5 + 993))) ^ v5)))();
}

void sub_10003EB84(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 16) - 628203409 * ((a1 - 1763701788 - 2 * (a1 & 0x96E00BE4)) ^ 0x146807D7);
  uint64_t v2 = *(void *)(a1 + 24);
  if (*(_DWORD *)(v2 - 0x4C6937770F4864B4) - 293522565 >= 0) {
    unsigned int v4 = *(_DWORD *)(v2 - 0x4C6937770F4864B4) - 293522565;
  }
  else {
    unsigned int v4 = 293522565 - *(_DWORD *)(v2 - 0x4C6937770F4864B4);
  }
  uint64_t v3 = *(void *)a1;
  if (*(_DWORD *)(*(void *)a1 - 0x4C6937770F4864B4) - 293522565 >= 0) {
    unsigned int v5 = *(_DWORD *)(v3 - 0x4C6937770F4864B4) - 293522565;
  }
  else {
    unsigned int v5 = 293522565 - *(_DWORD *)(v3 - 0x4C6937770F4864B4);
  }
  unsigned int v9 = v1 - 1759421093 * ((2 * (&v8 & 0x1EE2A9C8) - &v8 + 1629312561) ^ 0xD260E665) + 326;
  uint64_t v8 = v2;
  uint64_t v6 = (uint64_t)*(&off_10005CE90 + (v1 ^ 0x335));
  (*(void (**)(uint64_t *))(v6 + 8 * (v1 + 1105)))(&v8);
  if (v4 >= v5) {
    unsigned int v7 = v5;
  }
  else {
    unsigned int v7 = v4;
  }
  __asm { BRAA            X13, X17 }
}

uint64_t sub_10003ED38@<X0>(int a1@<W8>)
{
  unint64_t v4 = 1759421093
     * ((((v3 - 168) | 0x60E2BDCEF914AA9ELL) - (v3 - 168) + ((v3 - 168) & 0x9F1D423106EB5560)) ^ 0x4E5C7C9E4A691ACALL);
  *(_DWORD *)(v3 - 160) = v4 + a1 + 615989952 - 243;
  *(_DWORD *)(v3 - 156) = (a1 + 615989952) ^ v4;
  *(_DWORD *)(v3 - 136) = v4;
  *(_DWORD *)(v3 - 168) = v4 + a1 + 2021363720;
  *(_DWORD *)(v3 - 164) = a1 + 615989952 - v4 - 115;
  uint64_t v5 = v3 - 200;
  *(void *)(v5 + 48) = v1 ^ v4;
  *(void *)(v5 + 56) = 1500137743 - v4;
  uint64_t v6 = (*(uint64_t (**)(uint64_t))(v2 + 8 * (a1 ^ 0x84B)))(v3 - 168);
  return (*(uint64_t (**)(uint64_t))(v2 + 8 * *(int *)(v3 - 132)))(v6);
}

uint64_t sub_10003EE14(uint64_t a1, int a2)
{
  BOOL v4 = v2 < ((a2 + 4) ^ 0x1ACu) - 131;
  return (*(uint64_t (**)(void))(v3 + 8 * ((16 * v4) | (32 * v4) | (a2 + 4))))();
}

uint64_t sub_10003EE48()
{
  return sub_10003EE80(2024115522, 247996162);
}

uint64_t sub_10003EE80@<X0>(int a1@<W0>, int a2@<W1>, int a3@<W8>, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  *(_DWORD *)(a11 + 4 * (v11 + a3)) = *(_DWORD *)(*v12 + 4 * (v11 + a3));
  BOOL v17 = v11 + a1 > a2 || v11 + a1 < v13;
  return (*(uint64_t (**)(void))(v15 + 8 * (v17 | (8 * v17) | v14)))();
}

uint64_t sub_10003EEC8@<X0>(int a1@<W3>, uint64_t a2@<X8>)
{
  *(unsigned char *)(a2 - 1078471726 + v4 - 220 - 1) = 82;
  return (*(uint64_t (**)(void))(v3 + 8 * ((1997 * ((unint64_t)(a2 - 1078471726) < 0x40)) ^ (a1 + v2 + 779))))();
}

void sub_10003EF10(_DWORD *a1)
{
  *((unsigned char *)a1 + v3 + 4) = v5;
  int v8 = v6 + v2;
  *a1 = v6 + v2 - 710401751;
  unsigned int v9 = a1 + 1;
  *((unsigned char *)v9 + (v7 + v2)) = v4;
  *((unsigned char *)v9 + (v1 + v2 - 2)) = 116;
  *((unsigned char *)v9 + (v8 - 1800476003)) = -126;
  *((unsigned char *)v9 + (v8 - 1800476002)) = 69;
  JUMPOUT(0x10001EA44);
}

uint64_t sub_10003EFE4()
{
  BOOL v5 = v1 < v0;
  if (v5 == v3 - 0x568C3E31802B6168 < v0) {
    BOOL v5 = v3 - 0x568C3E31802B6168 < v1;
  }
  return (*(uint64_t (**)(void))(v4 + 8 * ((((v2 - 109) ^ 0x13) * v5) ^ v2)))();
}

uint64_t sub_10003F040(_DWORD *a1)
{
  signed int v1 = *a1 - 1224239923 * ((a1 & 0x3B94B05C | ~(a1 | 0x3B94B05C)) ^ 0x36D8B274);
  uint64_t v2 = *(void *)((char *)*(&off_10005CE90 + (v1 ^ 0x196C39D2)) - 4);
  v1 -= 426522877;
  uint64_t v5 = v2;
  unsigned int v4 = v1 + 628203409 * ((2 * (&v4 & 0x6DC59F68) - &v4 - 1841667952) ^ 0x10B26CA3) + 491;
  return (*((uint64_t (**)(unsigned int *))*(&off_10005CE90 + v1) + v1 + 1994))(&v4);
}

uint64_t sub_10003F148(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, int a17)
{
  uint64_t v19 = (*(uint64_t (**)(void))(v18 + 8 * (v17 + 346)))();
  STACK[0x408] -= 16;
  return (*(uint64_t (**)(uint64_t))(v18
                                            + 8
                                            * (((a17 == -1158872075) * (((v17 ^ 0x4A6) + 1178) ^ 0x291)) ^ v17 ^ 0x4A6)))(v19);
}

uint64_t sub_10003F1B0()
{
  return (*(uint64_t (**)(void))(v1
                              + 8
                              * (int)(((*v0 == 0x118FD125AD18CD5CLL) * (v2 - 1521 + ((v2 - 1521) ^ 0xFFFFFE70))) ^ v2)))();
}

uint64_t sub_10003F1F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,int a26,int a27,int a28,int a29)
{
  *(_DWORD *)(v33 - 116) = (a29 ^ 0xF0) - v29;
  *(void *)(v33 - 128) = (v32 + 1) + v29;
  *(void *)(v33 - 144) = v29 + 3;
  *(_DWORD *)(v33 - 120) = a29 + v29;
  *(_DWORD *)(v33 - 132) = a27 ^ v29;
  *(_DWORD *)(v33 - 152) = v29 ^ 1;
  *(_DWORD *)(v33 - 148) = a28 - v29;
  uint64_t v34 = (*(uint64_t (**)(uint64_t))(v31 + 8 * (v30 + 1107)))(v33 - 152);
  return (*(uint64_t (**)(uint64_t))(v31 + 8 * *(int *)(v33 - 136)))(v34);
}

void sub_10003F260(uint64_t a1)
{
  int v1 = 1225351577 * (((a1 | 0x24F55ED3) - a1 + (a1 & 0xDB0AA12C)) ^ 0x5A0AC4E1);
  int v2 = *(_DWORD *)(a1 + 24) ^ v1;
  uint64_t v3 = (uint64_t)*(&off_10005CE90 + v2 - 416);
  int v4 = (*(unsigned char *)(a1 + 28) ^ v1);
  (*(void (**)(char *, uint64_t (*)()))(v3 + 8 * (v2 ^ 0xA75)))((char *)*(&off_10005CE90 + (v2 ^ 0x27D)) - 8, sub_10002BEB0);
  uint64_t v5 = *(void *)((char *)*(&off_10005CE90 + (v2 ^ 0x277)) - 4);
  int v7 = v2
     - 1374699841 * ((&v6 + 1102890120 - 2 * ((unint64_t)&v6 & 0x41BCC488)) ^ 0x2C48DC81)
     + 109;
  uint64_t v6 = v5;
  (*(void (**)(uint64_t *))(v3 + 8 * (v2 ^ 0x583)))(&v6);
  __asm { BRAA            X9, X17 }
}

void sub_10003F3C8()
{
}

uint64_t sub_10003F410(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  *(void *)(a11 + v12) = v15;
  return (*(uint64_t (**)(void))(v14 + 8 * ((((v11 & 0x38) == 8) * (((v13 - 1091) | 0x5D5) - 1287)) ^ v13)))();
}

void sub_10003F454(int a1@<W8>)
{
  *(_DWORD *)(v1 + 40) = a1;
}

uint64_t sub_10003F45C@<X0>(char a1@<W8>)
{
  *(_DWORD *)(v6 + 4 * v1) = v1 + ((v2 >> a1) ^ v2) * v4;
  return (*(uint64_t (**)(void))(v5 + 8 * (((v1 < 0x26F) | (16 * (v1 < 0x26F))) ^ v3)))();
}

uint64_t sub_10003F48C@<X0>(uint64_t a1@<X4>, int a2@<W6>, unsigned int a3@<W7>, unsigned int a4@<W8>)
{
  *(_DWORD *)(v7 + 4 * v5) = *(_DWORD *)(a1 + 4 * (*(_DWORD *)(v7 + 4 * (v5 + 1)) & 1)) ^ *(_DWORD *)(v7 + 4 * (v5 + ((a4 + a2) & a3)) - 2564) ^ ((*(_DWORD *)(v7 + 4 * (v5 + 1)) & 0x7FFFFFFE | v4 & 0x80000000) >> 1);
  return (*(uint64_t (**)(void))(v6 + 8 * (((2 * (v5 == 226)) | (32 * (v5 == 226))) ^ a4)))();
}

uint64_t sub_10003F4F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,int a21,int a22)
{
  *(void *)(v28 - 128) = v23;
  *(void *)(v28 - 120) = a14;
  *(_DWORD *)(v28 - 104) = v22
                         + 235795823 * ((((2 * (v28 - 144)) | 0x45660000) - (v28 - 144) - 582156288) ^ 0xB61E4959)
                         - 40;
  *(void *)(v28 - 112) = v26;
  *(void *)(v28 - 144) = v25;
  *(void *)(v28 - 136) = v23;
  uint64_t v29 = (*(uint64_t (**)(uint64_t))(v24 + 8 * (v22 + 1869)))(v28 - 144);
  return (*(uint64_t (**)(uint64_t))(v24
                                            + 8
                                            * ((7
                                              * (a22
                                               + v22
                                               + 662
                                               + ((2 * (v22 + 1278)) ^ 0xD0E ^ (v27 - 1364)) > 0x7FFFFFFE)) ^ (v22 + 1359))))(v29);
}

uint64_t sub_10003F5A8@<X0>(uint64_t a1@<X8>)
{
  return (*(uint64_t (**)(void))(a1
                              + 8
                              * (int)(v3 ^ 0x74F | (16
                                                  * (((v2 - 293522927 + (((v3 ^ 0x74F) - 449) | 0x108u))
                                                    * (v1 - 293522565)) >> 31)))))();
}

void sub_10003F5EC()
{
}

void sub_10003F5F8(uint64_t a1)
{
  BOOL v4 = *(void *)(a1 + 8) == 0x3D8A64FC11846102
    || *(void *)(a1 + 16) == 0x14F716D90F32FE87
    || *(void *)a1 == 0x2565C4DA53AB2E8DLL;
  int v1 = *(_DWORD *)(a1 + 24) - 3804331 * (((a1 | 0xF1219854) - (a1 & 0xF1219854)) ^ 0x7E848392);
  __asm { BRAA            X10, X17 }
}

uint64_t sub_10003F6F4()
{
  return sub_10003F71C();
}

uint64_t sub_10003F71C()
{
  return v0 ^ v1;
}

void sub_10003F75C()
{
  uint64_t v4 = *v0;
  *(_DWORD *)(v0[2] - 0x471594F912D13C81) = *v1;
  *(_DWORD *)(v4 - 0x325ADC664C0CEA05) = *v2 + 2 * (v3 ^ 0x20C) - ((2 * *v2) & 0x27ACC2B2) - 1814667475;
  *((_DWORD *)v0 + 2) = -1158872075;
}

uint64_t sub_10003F800(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  return (*(uint64_t (**)(void))(v8
                              + 8
                              * (int)(((v7 == a6 + ((v6 - 2109641371) & 0x7DBE92FB) - 705)
                                     * (((v6 - 2109641371) ^ 0x82416DA8) - 608)) | v6)))();
}

uint64_t sub_10003F84C()
{
  return sub_10003F858();
}

uint64_t sub_10003F858@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, int a5@<W8>)
{
  LODWORD(STACK[0x4B0]) = a5 + 64;
  unsigned int v7 = LODWORD(STACK[0x574]) + (((v5 ^ 0x16) - 820) ^ 0x1770A881);
  BOOL v8 = a5 + 986027227 > v7;
  if ((a5 + 986027227) < 0x8A02E389 != v7 < 0x8A02E389) {
    BOOL v8 = (a5 + 986027227) < 0x8A02E389;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v6 + 8 * ((49 * v8) ^ v5)))(a1, a2, a3, a4, 205, 889516850);
}

uint64_t sub_10003F8DC()
{
  return (*(uint64_t (**)(void))(v2
                              + 8
                              * (((((LODWORD(STACK[0x280]) - 1558) | 0x616) ^ 0x62E) * (v0 < 0x944857A0)) ^ (v1 + 154))))();
}

void sub_10003F924()
{
}

uint64_t sub_10003F938(uint64_t a1, uint64_t a2, int a3, uint64_t a4, int a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  unsigned int v29 = v27 + a5;
  if (v29 <= 0x40) {
    unsigned int v29 = 64;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v28
                                                                                                  + 8 * ((108 * (a3 - v25 - v26 + v29 > 0xE)) ^ v24)))(872432070, a2, 3967103171, a4, a24, a6, 2368187550);
}

uint64_t sub_10003F9CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  *(void *)(a11 + v13) = v15;
  return (*(uint64_t (**)(void))(v14 + 8 * ((((v12 & 0xFFFFFFFFFFFFFFF8) == 8) * ((v11 - 165) ^ 0x442)) ^ v11)))();
}

uint64_t sub_10003FA0C()
{
  return sub_10001BE48();
}

uint64_t sub_10003FA3C()
{
  return (*(uint64_t (**)(void))(v2 + 8 * ((1004 * (v0 - 100 < ((v1 + 74) | 0x540u) - 1759)) ^ v1)))();
}

void sub_10003FA78()
{
}

uint64_t sub_10003FA94(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57)
{
  uint64_t v60 = (*(uint64_t (**)(uint64_t))(v58 + 8 * (v57 ^ 0xEBA)))(a57);
  STACK[0x408] = STACK[0x250] - 1824;
  LODWORD(STACK[0x3CC]) = v59;
  return (*(uint64_t (**)(uint64_t))(v58
                                            + 8
                                            * ((19 * (((STACK[0x318] == 0) ^ (v57 + 46)) & 1)) ^ (v57 - 267))))(v60);
}

void sub_10003FB1C()
{
  *(_DWORD *)(v0 - 0x3D8A64FC118460EALL) = 1158830113;
  sub_1000278A8();
}

uint64_t sub_10003FB3C(int a1, uint64_t a2)
{
  int v7 = ((v6 - 144) ^ 0x7EFF9A32) * a1;
  *(void *)(v6 - 136) = v2;
  *(_DWORD *)(v6 - 124) = v3 - v7 + 870;
  *(void *)(v6 - 120) = a2;
  *(_DWORD *)(v6 - 144) = (v4 + 764607257 + v3 + 1009) ^ v7;
  uint64_t v8 = (*(uint64_t (**)(uint64_t))(v5 + 8 * (v3 + 1423)))(v6 - 144);
  return sub_10003FB98(v8);
}

uint64_t sub_10003FB98(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  *(void *)(v31 - 136) = a24;
  *(void *)(v31 - 128) = v30;
  *(_DWORD *)(v31 - 144) = v24
                         - 1102
                         + 535753261
                         * ((((v31 - 144) | 0x90371EFA) - (v31 - 144) + ((v31 - 144) & 0x6FC8E100)) ^ 0x9AC310D5);
  (*(void (**)(uint64_t))(v25 + 8 * (v24 + 412)))(v31 - 144);
  int v35 = 2 * (v31 - 144);
  *(void *)(v31 - 144) = v30;
  *(void *)(v31 - 128) = v26;
  *(void *)(v31 - 120) = a24;
  *(void *)(v31 - 112) = v28;
  *(_DWORD *)(v31 - 136) = v24 + 310 - 1178560073 * (((v35 | 0x34657936) - (v31 - 144) + 1707950949) ^ 0x20A6C4F9);
  (*(void (**)(uint64_t))(v25 + 8 * (v24 ^ 0xED0)))(v31 - 144);
  *(_DWORD *)(v31 - 104) = v24
                         - 1499
                         + 235795823
                         * ((((v31 - 144) ^ 0xFB8C79AA) - 1432301377 - 2 * (((v31 - 144) ^ 0xFB8C79AA) & 0xAAA0D0BF)) ^ 0xC581E04C);
  *(void *)(v31 - 144) = v30;
  *(void *)(v31 - 136) = v27;
  *(void *)(v31 - 120) = v26;
  *(void *)(v31 - 112) = a24;
  *(void *)(v31 - 128) = v26;
  uint64_t v34 = 8 * (v24 + 410);
  (*(void (**)(uint64_t))(v25 + v34))(v31 - 144);
  *(_DWORD *)(v31 - 128) = v24
                         - 181
                         - 1225351577 * ((((v31 - 144) | 0x47DE7FEB) - ((v31 - 144) & 0x47DE7FEB)) ^ 0x3921E5D9);
  *(void *)(v31 - 112) = a24;
  *(void *)(v31 - 104) = v26;
  *(void *)(v31 - 144) = v30;
  *(void *)(v31 - 136) = a16;
  *(void *)(v31 - 120) = v26;
  (*(void (**)(uint64_t))(v25 + 8 * (v24 + 413)))(v31 - 144);
  *(void *)(v31 - 136) = a24;
  *(void *)(v31 - 128) = a19;
  *(_DWORD *)(v31 - 144) = v24
                         - 1102
                         + 535753261
                         * ((-803403039 - ((v31 - 144) | 0xD01D0AE1) + ((v31 - 144) | 0x2FE2F51E)) ^ 0x2516FB31);
  (*(void (**)(uint64_t))(v25 + 8 * (v24 ^ 0xEA4)))(v31 - 144);
  *(void *)(v31 - 144) = a19;
  *(_DWORD *)(v31 - 136) = v24
                         + 310
                         - 1178560073 * (((v31 - 144) & 0x3A81D27D | ~((v31 - 144) | 0x3A81D27D)) ^ 0x7FEA55E0);
  *(void *)(v31 - 128) = v29;
  *(void *)(v31 - 120) = a24;
  *(void *)(v31 - 112) = v28;
  (*(void (**)(uint64_t))(v25 + 8 * (v24 ^ 0xED0)))(v31 - 144);
  *(_DWORD *)(v31 - 104) = v24 - 1499 + 235795823 * (((v35 | 0x58B860E0) - (v31 - 144) + 1403244432) ^ 0x38F17929);
  *(void *)(v31 - 120) = v29;
  *(void *)(v31 - 112) = a24;
  *(void *)(v31 - 136) = v27;
  *(void *)(v31 - 128) = v29;
  *(void *)(v31 - 144) = a19;
  (*(void (**)(uint64_t))(v25 + v34))(v31 - 144);
  *(_DWORD *)(v31 - 128) = v24 - 181 - 1225351577 * ((v31 - 144) ^ 0x7EFF9A32);
  *(void *)(v31 - 112) = a24;
  *(void *)(v31 - 104) = v29;
  *(void *)(v31 - 120) = v29;
  *(void *)(v31 - 144) = a19;
  *(void *)(v31 - 136) = a17;
  (*(void (**)(uint64_t))(v25 + 8 * (v24 + 413)))(v31 - 144);
  *(void *)(v31 - 144) = v26;
  *(void *)(v31 - 136) = v29;
  *(_DWORD *)(v31 - 128) = v24
                         - 1224239923 * ((((v31 - 144) | 0xB3BC8C3B) + (~(v31 - 144) | 0x4C4373C4)) ^ 0x410F71ED)
                         - 1442;
  (*(void (**)(uint64_t))(v25 + 8 * (v24 ^ 0xEF9)))(v31 - 144);
  *(void *)(v31 - 144) = v29;
  *(_DWORD *)(v31 - 132) = v24 - 1759421093 * (((v35 | 0xD101A53A) - (v31 - 144) - 1753272989) ^ 0xDBFD62C9) - 414;
  uint64_t v32 = (*(uint64_t (**)(uint64_t))(v25 + 8 * (v24 + 365)))(v31 - 144);
  return (*(uint64_t (**)(uint64_t))(v25
                                            + 8
                                            * (v24 | (2
                                                    * (*(_DWORD *)(v31 - 136)
                                                     + ((v24 + 1193586234) & 0xB8DB4FBE ^ 0xE429F736) >= (v24 ^ 0x19B6F079u))))))(v32);
}

uint64_t sub_10003FFE4@<X0>(uint64_t a1@<X8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,int a27)
{
  return (*(uint64_t (**)(uint64_t))(v28 + 8 * (a27 + 52 * (a1 + 1 == v29 + 4))))(v27);
}

uint64_t sub_1000400C4(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, void))(v4
                                                    + 8 * ((86 * (v3 + v2 + 553653265 < (v1 ^ 0x3E8u) - 211)) ^ v1)))(a1, (v1 ^ 0x3E8u) + 353);
}

void sub_100040114()
{
}

uint64_t sub_100040178()
{
  return (*(uint64_t (**)(void))(v3 + 8 * (((((v0 ^ 0x6F8) + 1413) ^ 0x4E7) * (v2 == v1)) ^ v0)))();
}

void sub_1000401A8(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 32) - 1225351577 * ((2 * (a1 & 0x3AE15D2F) - a1 + 1159635664) ^ 0x3BE138E2);
  __asm { BRAA            X15, X17 }
}

uint64_t sub_1000402BC@<X0>(uint64_t a1@<X8>, uint64_t a2, uint64_t a3, char a4, unsigned int a5, uint64_t a6)
{
  a5 = v7
     - 691
     + 535753261 * (((&a4 | 0x640FEBA7) - (&a4 & 0x640FEBA7)) ^ 0x6EFBE588)
     + 1106;
  a6 = a1;
  uint64_t v8 = (*(uint64_t (**)(char *))(v6 + 8 * ((v7 - 691) ^ 0x706)))(&a4);
  return sub_10004031C(v8);
}

void sub_10004031C()
{
  *(_DWORD *)(v0 + 8) = v1;
}

uint64_t sub_10004035C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int *a9, uint64_t a10, uint64_t a11, uint64_t a12, int a13, int a14, int a15, int a16, uint64_t a17, char a18, int a19, uint64_t a20)
{
  int v24 = (v23 - 1567753686) & 0x5D72075B;
  int *v20 = (v21 + v24 - 1114) ^ a16;
  *a9 = a14 ^ v21;
  a20 = a12;
  a19 = v24
      + 535753261 * ((&a18 + 1480479000 - 2 * ((unint64_t)&a18 & 0x583E5118)) ^ 0x52CA5F37)
      + 230;
  uint64_t v25 = (*(uint64_t (**)(char *))(v22 + 8 * (v24 ^ 0x3B2)))(&a18);
  return sub_100040404(v25);
}

uint64_t sub_100040404()
{
  uint64_t v8 = v6;
  v7[1] = v4
        + (((v7 | 0x58605BFA) - v7 + (v7 & 0xA79FA400)) ^ 0x529455D5) * v2
        + 643;
  (*(void (**)(_DWORD *))(v1 + 8 * (v4 + 1323)))(v7);
  return v3 ^ v0;
}

uint64_t sub_10004049C@<X0>(int a1@<W8>)
{
  int v5 = 535753261 * ((((v4 - 144) | 0x2E96BD07) - (v4 - 144) + ((v4 - 144) & 0xD16942F8)) ^ 0x2462B328);
  *(_DWORD *)(v4 - 144) = a1 - v5;
  *(_DWORD *)(v4 - 140) = v1 - v5 + 12;
  *(void *)(v4 - 136) = v3;
  uint64_t v6 = (*(uint64_t (**)(uint64_t))(v2 + 8 * (v1 ^ 0xED8)))(v4 - 144);
  return (*(uint64_t (**)(uint64_t))(v2
                                            + 8 * (((*(_DWORD *)(v4 - 128) == 453445646) * ((v1 - 228) ^ 0x5C3)) ^ v1)))(v6);
}

uint64_t sub_100040540(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t (*a23)(uint64_t),uint64_t a24)
{
  int v27 = 1755732067 * ((((v26 - 160) | 0x5AEABF65) - (v26 - 160) + ((v26 - 160) & 0xA5154098)) ^ 0x842C02BE);
  *(_DWORD *)(v26 - 152) = v27 + v24 + 229;
  *(_DWORD *)(v26 - 148) = 785517303 - v27;
  *(void *)(v26 - 160) = a24;
  uint64_t v28 = (*(uint64_t (**)(uint64_t))(v25 + 8 * (v24 ^ 0x872)))(v26 - 160);
  return a23(v28);
}

uint64_t sub_1000405C0(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return (*(uint64_t (**)(void))(v7 + 8 * ((93 * (a7 + 1 != v8 + 80)) ^ a1)))();
}

uint64_t sub_100040684()
{
  return sub_100040690();
}

uint64_t sub_100040690@<X0>(unsigned int a1@<W1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  *(void *)(a2 + v3 + v5 + a3 - 1) = v9;
  return (*(uint64_t (**)(void))(v7 + 8 * ((14 * (v5 + (v4 ^ a1) * v8 - 924 == v6)) | v4)))();
}

uint64_t sub_1000406D0(uint64_t a1, uint64_t a2, int a3, uint64_t a4, int a5)
{
  int v12 = v6 + v8;
  uint64_t v13 = (v5 + v12);
  int8x8_t v14 = vrev64_s8(*(int8x8_t *)(v7 + v13));
  *(int8x8_t *)(a1 + v13) = vrev64_s8(vadd_s8(vsub_s8(v14, vand_s8(vadd_s8(v14, v14), v10)), v11));
  return (*(uint64_t (**)(void))(v9 + 8 * (((a5 == v12) | (16 * (a5 == v12))) ^ a3)))();
}

uint64_t sub_1000406D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, unint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, unint64_t a11, unint64_t a12, unint64_t a13, unint64_t a14)
{
  int v18 = 628203409 * ((8872314 - ((v17 - 160) | 0x87617A) + ((v17 - 160) | 0xFF789E85)) ^ 0x7DF092B6);
  STACK[0x318] = a11;
  STACK[0x310] = a13;
  STACK[0x338] = a6;
  STACK[0x328] = a14;
  *(_DWORD *)(v17 - 144) = v15 - v18 + 367;
  *(_DWORD *)(v17 - 140) = a5 - v18 + 854318832;
  STACK[0x340] = a12;
  (*(void (**)(uint64_t))(v16 + 8 * (v15 + 1925)))(v17 - 160);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v16
                                                                       + 8
                                                                       * (((*(_DWORD *)(v17 - 128) == v14)
                                                                         * (v15 ^ 0x2D2 ^ (62 * (v15 ^ 0xCD)))) ^ v15)))(2000647704, 357408481, a3, 2017221945);
}

uint64_t sub_1000407EC@<X0>(int a1@<W5>, unsigned int a2@<W8>)
{
  if (a2 == a1) {
    return sub_1000407FC(1158830123);
  }
  else {
    return sub_1000407FC(a2);
  }
}

uint64_t sub_1000407FC(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned int a6)
{
  return a1 ^ a6;
}

uint64_t sub_10004083C(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t *a16)
{
  uint64_t v20 = *a16;
  int v21 = (void *)(v19 - 200);
  memset((void *)(v19 - 200), 82, 16);
  int v22 = ((((2 * (v19 - 168)) | 0xFBA80D6A) - (v19 - 168) + 36436299) ^ 0x69794FEC) * a1;
  v21[9] = v21;
  *(_DWORD *)(v19 - 160) = v22 + 1566298333;
  *(_DWORD *)(v19 - 132) = (v18 + 1891) ^ v22;
  v21[6] = &STACK[0x270];
  v21[7] = v20;
  v21[4] = v19 - 184;
  uint64_t v23 = (*(uint64_t (**)(uint64_t))(v16 + 8 * (v18 ^ 0x837)))(v19 - 168);
  int v24 = *(_DWORD *)(v19 - 136) == v17 + ((3 * (v18 ^ 0x6C) - 502308939) & 0x1DF0A2FF) - 750;
  return (*(uint64_t (**)(uint64_t))(v16 + 8 * (((32 * v24) | (v24 << 9)) ^ v18)))(v23);
}

uint64_t sub_10004094C@<X0>(int8x16_t *a1@<X3>, int a2@<W8>)
{
  *a1 = vaddq_s8(vsubq_s8(*(int8x16_t *)(v5 + (v2 + v3)), vandq_s8(vaddq_s8(*(int8x16_t *)(v5 + (v2 + v3)), *(int8x16_t *)(v5 + (v2 + v3))), v7)), v6);
  return (*(uint64_t (**)(void))(v4 + 8 * (a2 + 702)))((v2 + 64));
}

uint64_t sub_10004099C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27)
{
  int v31 = v29 - 530505710;
  if ((v29 - 530505710) <= 0x40) {
    int v31 = 64;
  }
  uint64_t v32 = *(uint64_t (**)(void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v30 + 8 * ((39 * (530505478 - v27 - v28 + 58 * (HIDWORD(a16) ^ 0x28Au) + v31 >= ((4 * HIDWORD(a16)) ^ 0x9B4u) - 893)) ^ HIDWORD(a16)));
  return v32(v32, a2, a3, 3833295385, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27);
}

uint64_t sub_100040A28(uint64_t a1, int a2, uint64_t a3, int a4)
{
  return (*(uint64_t (**)(void))(v6 + 8
                                   * ((215 * (v5 + a4 - 16 < (((v4 ^ 0x573) - 1674) ^ ((v4 ^ 0x573u) * a2)))) ^ v4)))();
}

uint64_t sub_100040A6C@<X0>(int a1@<W1>, int a2@<W8>)
{
  int v6 = 268 * (v5 ^ 0x21A);
  *(_DWORD *)(*(void *)(v4 - 0x4C6937770F4864B0) + 4 * (v3 + a2)) = a1;
  int v7 = v3 + v6 - 535;
  *(_DWORD *)(v4 - 0x4C6937770F4864B4) = v7;
  int v8 = v7 + a2;
  if (v7 + a2 < 0) {
    int v8 = -v8;
  }
  return (*(uint64_t (**)(void))(v2
                              + 8
                              * ((((v8 ^ (v6 + 998177669))
                                 + ((2 * v8) & 0x76FDFB3A)
                                 - 998178742
                                 + 268 * ((v6 + 22) ^ 0x22C) >= 0)
                                * ((982 * ((v6 + 22) ^ 0x22C)) ^ 0x139)) ^ (v6 + 22))))();
}

uint64_t sub_100040B68@<X0>(int a1@<W5>, uint64_t a2@<X8>, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  return (*(uint64_t (**)(void))(v16
                              + 8
                              * (int)(((~a13 + v13 - v15 < (unint64_t)(a2 - 2017221929)) * (a2 ^ (a1 + 3))) ^ v14)))();
}

uint64_t sub_100040BAC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29)
{
  int v35 = STACK[0x2D0];
  if (LODWORD(STACK[0x2D0]) == 806845398)
  {
    uint64_t v37 = (char *)&STACK[0x5A0] + v30 - 0x14D7FC5203D9D4ALL;
    STACK[0x398] = (unint64_t)(v37 - 47);
    LODWORD(STACK[0x3A8]) = 623450844;
    STACK[0x408] = v30 - 192;
    STACK[0x4C8] = 0;
    unint64_t v38 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v32 + 8 * (int)(((((v33 + 2026650862) & 0x8733BE2F) - 518) * (v37 != (char *)-201)) ^ (v33 - 801)));
    LODWORD(STACK[0x524]) = 1228396329;
    STACK[0x268] = STACK[0x338];
    STACK[0x288] = (unint64_t)(v37 + 181);
    STACK[0x290] = (unint64_t)(v37 - 47);
    return v38(a1, a2, a3, a4, a5, a6, a7, a8);
  }
  else if (v35 == 1075280857)
  {
    LODWORD(STACK[0x3CC]) = v29 + 161;
    return (*(uint64_t (**)(void))(v32
                                + 8 * ((19 * (((STACK[0x318] == 0) ^ (v33 + 46)) & 1)) ^ (v33 - 267))))();
  }
  else
  {
    int v39 = 3804331 * ((((v34 - 200) | 0x81BE4809) - ((v34 - 200) & 0x81BE4809)) ^ 0xE1B53CF);
    *(void *)(v34 - 192) = a29;
    *(_DWORD *)(v34 - 200) = (v35 - ((2 * v35 + 533792852) & v31) - 1965717473) ^ v39;
    *(_DWORD *)(v34 - 196) = v33 - v39 + 138;
    uint64_t v40 = (*(uint64_t (**)(uint64_t))(v32 + 8 * (v33 ^ 0xEC1)))(v34 - 200);
    return (*(uint64_t (**)(uint64_t))(v32
                                              + 8
                                              * ((19 * (((STACK[0x318] == 0) ^ (v33 + 46)) & 1)) ^ (v33 - 267))))(v40);
  }
}

uint64_t sub_100040BB4()
{
  return (*(uint64_t (**)(void))(v2 + 8 * ((405 * (v0 + 1 == v3 + 4)) ^ v1)))();
}

uint64_t sub_100040C8C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, unsigned int a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24)
{
  if (a22 == 2) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, void, uint64_t, uint64_t, uint64_t))(v24 + 8 * ((1771 * (LODWORD(STACK[0x308]) != 1049205778)) ^ 0x1A7)))(a1, a2, 2277745974, 2017221945, a11, a24, 1228396329, a16);
  }
  if (a22 != 1) {
    JUMPOUT(0x100040E1CLL);
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, void, uint64_t, uint64_t, uint64_t))(v24 + 8 * ((199 * (LODWORD(STACK[0x308]) == 1049205778)) ^ 0x160)))(a1, a2, 2277745974, 2017221945, a11, a24, 1228396329, a16);
}

uint64_t sub_100040E4C(uint64_t a1, uint64_t a2)
{
  STACK[0x2F0] = *(void *)(v2 + 8 * (LODWORD(STACK[0x2AC]) - 1738));
  return sub_100042758(a1, a2, -1660710441);
}

uint64_t sub_100040E5C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, uint64_t a7, unsigned int a8)
{
  *(unsigned char *)(*v13 + (((v10 - 1397) | 0x2C2) ^ a8) + v12) = *(unsigned char *)(*v13 + (v9 + a6));
  return (*(uint64_t (**)(void))(v11 + 8 * ((13 * (v8 == 1754960190)) ^ v10)))();
}

uint64_t sub_100040EBC@<X0>(int a1@<W8>)
{
  int v3 = a1 + 513;
  int v4 = a1 - 780;
  BOOL v6 = v1[8] == 0x56D617B809C7B315 || (*v1 | v1[4]) == 0;
  return (*(uint64_t (**)(void))(v2 + 8 * ((v6 * (v3 + v4 - 1744)) ^ v3)))();
}

uint64_t sub_100040F14@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v5 = (335 - v2);
  int8x16_t v6 = vrev64q_s8(*(int8x16_t *)(a2 + v5 - 15));
  int8x16_t v7 = vextq_s8(v6, v6, 8uLL);
  int8x16_t v8 = vrev64q_s8(*(int8x16_t *)(a2 + v5 - 31));
  int8x16_t v9 = vextq_s8(v8, v8, 8uLL);
  uint64_t v10 = a1 + v5;
  v11.i64[0] = 0xA4A4A4A4A4A4A4A4;
  v11.i64[1] = 0xA4A4A4A4A4A4A4A4;
  v12.i64[0] = 0x5252525252525252;
  v12.i64[1] = 0x5252525252525252;
  int8x16_t v13 = vrev64q_s8(vaddq_s8(vsubq_s8(v7, vandq_s8(vaddq_s8(v7, v7), v11)), v12));
  *(int8x16_t *)(v10 - 15) = vextq_s8(v13, v13, 8uLL);
  int8x16_t v14 = vrev64q_s8(vaddq_s8(vsubq_s8(v9, vandq_s8(vaddq_s8(v9, v9), v11)), v12));
  *(int8x16_t *)(v10 - 31) = vextq_s8(v14, v14, 8uLL);
  return (*(uint64_t (**)(void))(v4 + 8 * (((v2 == 288) * (((v3 - 841802745) & 0x322CE6FB) - 126)) ^ v3)))();
}

void sub_100040FB8()
{
}

uint64_t sub_100040FC0(int a1, int a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8)
{
  return (*(uint64_t (**)(void))(v9
                              + 8 * (((((7 * ((v8 + 156) ^ a1)) ^ a2) + a8 == 32) * ((v8 + 156) ^ a3)) ^ (v8 + 156))))();
}

void sub_100041004()
{
}

uint64_t sub_100041078()
{
  return (*(uint64_t (**)(void))(v1 + 8 * (((v2 != 129 * (v0 ^ 0x6F3) + 442455332) * ((v0 ^ 0x1A3) - 1469)) ^ v0)))();
}

uint64_t sub_1000410B8(uint64_t a1)
{
  BOOL v5 = *(void *)(v4 + 8 * (v1 - 430)) - 8 - a1 - ((v1 - 1848164883) & 0x6E28C3FF ^ 0x2B3uLL) + 335 < 0x20;
  return (*(uint64_t (**)(uint64_t))(v3 + 8 * (((2 * v5) | (16 * v5)) ^ (v1 + 479))))(v2 + 1569);
}

uint64_t sub_10004112C()
{
  return (*(uint64_t (**)(void))(v1 + 8 * ((((v0 - 1404883218) ^ 0x6E9) * (v2 > 0x70F1A701)) ^ (v0 - 1404883218))))();
}

uint64_t sub_100041178(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, int a11)
{
  return (*(uint64_t (**)(void))(v12
                              + 8
                              * (((a11 == ((((v13 ^ 0x4D2) - 1298) | 0x1C4) ^ (v11 - 471))) * (5 * (v13 ^ 0x18C) - 392)) ^ v13 ^ 0x4D2)))();
}

uint64_t sub_1000411C4()
{
  return (*(uint64_t (**)(void))(v1 + 8 * ((LODWORD(STACK[0x220]) * (v2 == v3)) ^ (v0 - 1706))))();
}

void sub_100041250(_DWORD *a1)
{
  unsigned int v1 = *a1 ^ (1374699841 * ((((2 * a1) | 0x97E9331C) - a1 + 873162354) ^ 0xA6008187));
  __asm { BRAA            X8, X17 }
}

uint64_t sub_10004131C@<X0>(uint64_t a1@<X2>, int a2@<W8>)
{
  uint64_t v6 = (v4 + a2);
  unsigned int v7 = *(_DWORD *)((char *)&STACK[0x284] + v6 + 72);
  *(unsigned char *)(a1 + v6) = v7 ^ 0xF4;
  *(unsigned char *)(a1 + (v6 + 1)) = (BYTE1(v7) ^ 0xD3)
                                          + ((v3 + 118) ^ 0x6A)
                                          + (~(2 * (BYTE1(v7) ^ 0xD3)) | 0x5B);
  *(unsigned char *)(a1 + (v6 + 2)) = (BYTE2(v7) ^ 0xE7) - ((2 * (BYTE2(v7) ^ 0xE7)) & 0xA4) + 82;
  *(unsigned char *)(a1 + (v6 + 3)) = (HIBYTE(v7) ^ 0x2C) - ((v7 >> 23) & 0xA4) + 82;
  LODWORD(v6) = LODWORD(STACK[0x2E0]) - 1026350896;
  BOOL v8 = v6 < v2;
  BOOL v9 = v4 - 394182302 < v6;
  if (v4 - 394182302 < v2 != v8) {
    BOOL v9 = v8;
  }
  return (*(uint64_t (**)(void))(v5 + 8 * ((1218 * v9) ^ v3)))();
}

uint64_t sub_1000413FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, __int16 a5)
{
  return (*(uint64_t (**)(void))(v5
                              + 8
                              * ((7
                                * ((((unint64_t)(v6 - a1 - 4) < 0x20) ^ ((a5 & 0xDB) - 1)) & 1)) | a5 & 0x7DBu)))();
}

uint64_t sub_100041440()
{
  return sub_10004148C();
}

uint64_t sub_10004148C@<X0>(int a1@<W6>, int a2@<W8>)
{
  unsigned int v5 = (v2 + 1082340157) & 0xBF7CCEC3;
  int v6 = v2 - 702;
  int v7 = v2 + 539;
  unsigned int v8 = a1 + 1768315878 + v6;
  BOOL v9 = a2 - 1121157198 < v8;
  if (v8 < (v5 ^ 0xD8DE7E75) != (a2 - 1121157198) < 0xD8DE7AB6) {
    BOOL v9 = v8 < (v5 ^ 0xD8DE7E75);
  }
  return (*(uint64_t (**)(void))(v4 + 8 * ((!v9 * v3) ^ v7)))();
}

uint64_t sub_100041514@<X0>(uint64_t a1@<X8>)
{
  return (*(uint64_t (**)(void))(v3
                              + 8
                              * ((((((unint64_t)(v1 - a1) < 0x20) ^ (v2 - 70)) & 1)
                                * (((v2 - 551) | 0x2A1) - 1536)) ^ v2)))();
}

uint64_t sub_100041554(_DWORD *a1, uint64_t a2)
{
  return ((uint64_t (*)(void))*(&off_1000589E0
                             + ((1017 * ((*a1 + *(_DWORD *)(a2 + 4) + 1976496717) > 0xC8)) ^ 0x1E2u)))();
}

uint64_t sub_100041598(__n128 a1)
{
  *(_DWORD *)(v4 + 1424) = 1078009232;
  *(_DWORD *)(v4 + 1428) = 1680994559;
  *(void *)(v4 + 1432) = v2;
  *(void *)(v4 + 1440) = v2;
  *(_DWORD *)(v4 + 1448) = v3;
  *(__n128 *)(v4 + 1452) = a1;
  return (*(uint64_t (**)(void))(v5 + 8 * v1))();
}

uint64_t sub_1000415EC()
{
  return (*(uint64_t (**)(void))(v4
                              + 8
                              * ((1429
                                * ((v1 & (2 * (*(unsigned __int8 *)(v2 + 2) - 72)))
                                 + ((*(unsigned __int8 *)(v2 + 2) - 72) ^ v0) == v0 + ((v3 - 327) | 0x200) - 685)) ^ v3)))();
}

uint64_t sub_100041634@<X0>(int a1@<W0>, int a2@<W1>, unsigned int a3@<W2>, int a4@<W3>, int a5@<W8>)
{
  *(unsigned char *)(v11 - 220 + (a5 + a1)) = *(unsigned char *)(v10 + (v7 + a2))
                                                  - ((2 * *(unsigned char *)(v10 + (v7 + a2))) & 0xA4)
                                                  + 82;
  unsigned int v12 = a4 + v7 + 1;
  int v13 = (v5 < v6) ^ (v12 < a3);
  BOOL v14 = v12 < v5;
  if (v13) {
    BOOL v14 = v5 < v6;
  }
  return (*(uint64_t (**)(void))(v8 + 8 * ((254 * v14) ^ v9)))();
}

uint64_t sub_1000416AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  *(_DWORD *)(v13 - 108) = v12 + 220 - 1759421093 * ((v13 - 120) ^ 0xB37DB054);
  *(void *)(v13 - 120) = a10;
  (*(void (**)(uint64_t))(v11 + 8 * (v12 + 999)))(v13 - 120);
  *(_DWORD *)(v13 - 108) = v12
                         + 220
                         - 1759421093 * ((((2 * (v13 - 120)) | 0x1F4924FA) - (v13 - 120) - 262443645) ^ 0xBCD92229);
  *(void *)(v13 - 120) = a11;
  (*(void (**)(uint64_t))(v11 + 8 * (v12 + 999)))(v13 - 120);
  *(void *)(v13 - 120) = a9;
  *(_DWORD *)(v13 - 112) = v12 + 3804331 * ((((v13 - 120) | 0x8F66C20F) + (~(v13 - 120) | 0x70993DF0)) ^ 0xC3D9C8) + 136;
  *(void *)(v13 - 104) = a11;
  uint64_t v14 = (*(uint64_t (**)(uint64_t))(v11 + 8 * (v12 + 1039)))(v13 - 120);
  return sub_1000417D8(v14);
}

uint64_t sub_100041818(uint64_t a1, int a2)
{
  int v6 = *(_DWORD *)(v4 + v2 * (uint64_t)a2 + 36) - 2095483022;
  BOOL v8 = v6 > 590750450 || v6 < SLODWORD(STACK[0x268]);
  return (*(uint64_t (**)(void))(v3 + 8 * ((v8 * ((((v5 ^ 0x360) + 1554) | 0x50) - 1232)) ^ v5 ^ 0x360)))();
}

uint64_t sub_100041884(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, int a15, int a16)
{
  return (*(uint64_t (**)(void))(v16 + 8 * ((296 * (a16 == ((v17 + 277103071) | 0x81582043) + 688954798)) ^ v17)))();
}

uint64_t sub_1000418CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, int a7, char a8)
{
  int v17 = (v9 + a6) & a7;
  unint64_t v18 = a1 - 0x3F4D603B87B823A6 + (*(_DWORD *)(a2 + 4 * v15) ^ v10);
  *(_DWORD *)(a2 + 4 * v15) = v18 + v10 - ((v18 << (v17 ^ a8)) & 0x65CEF260);
  return (*(uint64_t (**)(void))(v8 + 8 * ((((v11 ^ HIDWORD(v18)) + (v12 & (v18 >> 31)) + v13 == v16) * v14) ^ v17)))();
}

uint64_t sub_1000418DC(double a1)
{
  double *v1 = a1;
  return (*(uint64_t (**)(void))(v5 + 8 * (((v4 == 0) * v3) ^ v2)))();
}

void sub_100041900()
{
}

uint64_t sub_100041910(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  int v10 = v6 - 12;
  *(void *)(a4 + v5 + ((v10 + 901) ^ (unint64_t)(v7 + 506))) = v9;
  return (*(uint64_t (**)(void))(v8 + 8 * ((28 * (((v10 ^ 0x30) & v4) != 8)) ^ v10)))();
}

void sub_100041964()
{
}

uint64_t sub_100041978(uint64_t a1, uint64_t a2, int a3)
{
  return (*(uint64_t (**)(void))(v5 + 8 * (((((a3 - 750) | 0x12A) - 192) * (v3 != v4)) ^ a3)))();
}

uint64_t sub_1000419A4(int a1)
{
  return (*(uint64_t (**)(void))(v3 + 8 * (((v2 == ((v1 + 166450540) & 0xF61425FF ^ (a1 + 142))) * (v1 - 1139)) ^ v1)))();
}

void sub_1000419F4()
{
}

void sub_1000419FC()
{
}

void sub_100041A44(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 4) - 535753261 * (a1 ^ 0xAF40E2F);
  __asm { BRAA            X10, X17 }
}

uint64_t sub_100041AE0(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t v8 = *v6;
  unint64_t v9 = 535753261
     * ((2 * ((v7 - 144) & 0x154D0DED0CF6E588) - (v7 - 144) + 0x6AB2F212F3091A77) ^ 0x9F50AF7FF9FD1458);
  int v10 = (v4 + 1970359376) ^ (535753261 * ((2 * ((v7 - 144) & 0xCF6E588) - (v7 - 144) - 217507209) ^ 0xF9FD1458));
  *(_DWORD *)(v7 - 104) = v10 ^ 0x22;
  *(void *)(v7 - 144) = v8 ^ v9;
  *(_DWORD *)(v7 - 120) = v10;
  *(void *)(v7 - 112) = v9;
  *(_DWORD *)(v7 - 136) = ((v4 + 1970359376) ^ 0x4F)
                        - 535753261 * ((2 * ((v7 - 144) & 0xCF6E588) - (v7 - 144) - 217507209) ^ 0xF9FD1458);
  *(_DWORD *)(v7 - 132) = 535753261 * ((2 * ((v7 - 144) & 0xCF6E588) - (v7 - 144) - 217507209) ^ 0xF9FD1458)
                        + v4
                        + 699748552;
  *(_DWORD *)(v7 - 128) = -535753261 * ((2 * ((v7 - 144) & 0xCF6E588) - (v7 - 144) - 217507209) ^ 0xF9FD1458);
  uint64_t v11 = (*(uint64_t (**)(uint64_t))(v5 + 8 * (v4 ^ (a4 + 1944))))(v7 - 144);
  return (*(uint64_t (**)(uint64_t))(v5 + 8 * *(int *)(v7 - 124)))(v11);
}

uint64_t sub_100041BEC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, int a11, int a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, unsigned int a17, int a18, int a19)
{
  uint64_t v24 = *(void *)(v19 + 32);
  uint64_t v25 = *(void *)(v19 + 16);
  unsigned int v26 = 1374699841 * (&a12 ^ 0x6DF41809);
  a15 = a9;
  a16 = a9;
  a13 = v24;
  a14 = v25;
  a12 = v23 - v26 - 2024873800;
  a17 = ((a11 ^ 0x67EFFFCD) - 546178056 + ((a11 << ((v23 - 44) ^ 0xA0)) & 0xCFDFFF9A)) ^ v26;
  a18 = v26 + 407485375 * (v22 ^ 0x38D5C4F5) + 643495073;
  uint64_t v27 = (*(uint64_t (**)(int *))(v21 + 8 * (v23 ^ 0xA8B)))(&a12);
  return (*(uint64_t (**)(uint64_t))(v21 + 8 * ((453 * (a19 != v20)) ^ v23)))(v27);
}

uint64_t sub_100041CD4(__n128 a1, __n128 a2, __n128 a3, __n128 a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, unsigned int a18, uint64_t a19, uint64_t a20,int a21,int a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,unsigned int a30)
{
  v31.n128_u64[0] = 0xA4A4A4A4A4A4A4A4;
  v31.n128_u64[1] = 0xA4A4A4A4A4A4A4A4;
  v32.n128_u64[0] = 0x5252525252525252;
  v32.n128_u64[1] = 0x5252525252525252;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void, uint64_t, __n128, __n128, __n128, __n128, __n128, __n128))(v30 + 8 * ((((a22 - 1424677960) & 0x54EADED7 ^ 0x249) * (a18 < 0xFFFFFFFE)) ^ a22)))(3260256096, 2974537591, 1320429705, 1235729443, 4294967234, 3830318332, a30, 3059237151, a1, a2, a3, a4, v31, v32);
}

uint64_t sub_100041D68(unsigned int a1, int a2)
{
  BOOL v12 = v8 > a1;
  *(unsigned char *)(*(void *)(v11 - 120) + (a2 - 728585860)) = *(unsigned char *)(v3 + ((a2 - 728585860) & 0xFLL)) ^ *(unsigned char *)(v2 + (a2 - 728585860)) ^ *(unsigned char *)(v5 + ((a2 - 728585860) & 0xFLL)) ^ *(unsigned char *)(((a2 - 728585860) & 0xFLL) + v4 + 1) ^ (23 * ((a2 + 124) & 0xF));
  if (v12 == a2 - 1122311369 < v6) {
    BOOL v12 = a2 - 1122311369 < v9;
  }
  return (*(uint64_t (**)(void))(v10 + 8 * ((177 * v12) ^ v7)))();
}

uint64_t sub_100041E04()
{
  return (*(uint64_t (**)(void))(v1 + 8 * ((52 * (STACK[0x508] != 0)) ^ (v0 - 941))))();
}

uint64_t sub_100041E34(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char *a6)
{
  int v7 = (char *)&STACK[0x1860] + v6;
  char *v7 = *a6;
  *(void *)(v7 + 1) = *(void *)(a6 + 1);
  *(_DWORD *)(v7 + 9) = *(_DWORD *)(a6 + 9);
  *(_WORD *)(v7 + 13) = *(_WORD *)(a6 + 13);
  v7[15] = a6[15];
  uint64_t v8 = *((void *)a6 + 1);
  *((void *)v7 + 2) = *(void *)a6;
  *((void *)v7 + 3) = v8;
  return sub_100007EB8();
}

void sub_100041E80()
{
}

uint64_t sub_100041E8C()
{
  return (*(uint64_t (**)(void))(v3 + 8 * (v1 | (32 * ((v1 ^ 0x481u) * v2 + 4 == v0 - 1228396329)))))();
}

uint64_t sub_100041ED4(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  int v9 = v5 + 17852546;
  if ((v9 + 1) > 0x40) {
    int v10 = v9 + 1;
  }
  else {
    int v10 = 64;
  }
  return (*(uint64_t (**)(void))(v8
                              + 8
                              * ((((((v7 ^ 0x190) - 1388) | 0x130) ^ 0x107) * ((a4 - v4 - v6 + v10) < 0xF)) ^ v7 ^ 0x190)))();
}

uint64_t sub_100041F54()
{
  if (v2 + v0 >= 0) {
    unsigned int v4 = v2 + v0;
  }
  else {
    unsigned int v4 = -(v2 + v0);
  }
  return (*(uint64_t (**)(void))(v3 + 8 * (v1 | (32 * (((v4 > 0x82) ^ (-57 * (v1 ^ 0x5C))) & 1)))))();
}

void sub_100041F8C()
{
}

uint64_t sub_100041F94(void *a1)
{
  return (*(uint64_t (**)(void))(v1
                              + 8
                              * (((*(_DWORD *)(*a1 + v3) != ((v4 - 1600492070) & 0x5F658CDB ^ v2))
                                * (21 * (v4 ^ 0x602) - 430)) ^ v4)))();
}

uint64_t sub_100041FE8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  BOOL v7 = ((v5 - 656349354) & 0x271F1D79u) + v4 - 1938082080 > 0x37;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v6
                                                                                + 8 * ((v7 | (4 * v7)) ^ (v5 + 1738))))(a1, a2, a3, a4, 1797);
}

uint64_t sub_10004204C(uint64_t a1, int a2, uint64_t a3, uint64_t a4, char a5)
{
  return sub_10002B74C(a2, a5, v5);
}

uint64_t sub_10004205C()
{
  uint64_t v4 = (*(uint64_t (**)(void))(v1 + 8 * (v0 ^ 0xEBA)))();
  LODWORD(STACK[0x3CC]) = v2;
  return (*(uint64_t (**)(uint64_t))(v1 + 8 * ((((v0 - 963) ^ 0x312) * v3) ^ (v0 - 165))))(v4);
}

uint64_t sub_1000420A8()
{
  BOOL v2 = v0 > (STACK[0x268] & 0xF666A9DF ^ 0x7B861E3D);
  return (*(uint64_t (**)(void))(v1 + 8 * ((2 * v2) | (32 * v2) | (LODWORD(STACK[0x2AC]) - 1624))))();
}

uint64_t sub_1000420F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,int a24,uint64_t a25,int a26)
{
  unint64_t v30 = 535753261 * ((v29 - 0x276D84AF23161DA3 - 2 * ((v29 - 144) & 0xD8927B50DCE9E2EDLL)) ^ 0x2D70263DD61DECC2);
  *(void *)(v29 - 144) = **(unsigned int **)(v28 + 8 * (v26 ^ (v26 - 21))) ^ v30;
  *(_DWORD *)(v29 - 120) = a26 ^ v30;
  *(_DWORD *)(v29 - 132) = v30 + v26 + 699748552;
  *(_DWORD *)(v29 - 128) = -535753261 * ((v29 - 588651939 - 2 * ((v29 - 144) & 0xDCE9E2ED)) ^ 0xD61DECC2);
  *(_DWORD *)(v29 - 136) = a26 - v30 - 50;
  *(_DWORD *)(v29 - 104) = a24 ^ v30;
  *(void *)(v29 - 112) = v30;
  uint64_t v31 = (*(uint64_t (**)(uint64_t))(v27 + 8 * (v26 ^ (v26 + 1944))))(v29 - 144);
  return (*(uint64_t (**)(uint64_t))(v27 + 8 * *(int *)(v29 - 124)))(v31);
}

void sub_100042110()
{
}

void sub_10004228C(uint64_t a1)
{
  int v1 = 535753261 * (((a1 | 0xD816FE13) - (a1 & 0xD816FE13)) ^ 0xD2E2F03C);
  __asm { BRAA            X14, X17 }
}

uint64_t sub_10004234C()
{
  return (*(uint64_t (**)(void))(v1 + 8 * (((8 * (STACK[0x4A8] != 0)) | (16 * (STACK[0x4A8] != 0))) ^ (v0 - 132))))();
}

uint64_t sub_100042374()
{
  STACK[0x298] = v2;
  return (*(uint64_t (**)(void))(v0
                              + 8
                              * ((125
                                * (((v1 - 1228398312) ^ (v1 + 198)) + LODWORD(STACK[0x344]) < 0xFFFFF7FF)) ^ v1)))();
}

void sub_1000423BC(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 40) + 460628867 * (((a1 | 0x4A5B5FFB) - (a1 & 0x4A5B5FFB)) ^ 0x6CDDD86);
  __asm { BRAA            X10, X17 }
}

void sub_1000424E4()
{
}

void sub_10004262C()
{
}

uint64_t sub_1000426A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,int a21)
{
  return (*(uint64_t (**)(void))(v23
                              + 8
                              * ((965 * (a21 - 145079879 + 8 * (v21 ^ (v24 + 35)) - 295 < 0x10)) ^ (v21 + v22))))();
}

uint64_t sub_1000426EC(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8)
{
  return (*(uint64_t (**)(void))(v9
                              + 8
                              * (((a4 + v8 + 1365 < ((99 * (a8 ^ 0x4FA)) ^ 0xFFFFFBB1)) * ((a8 - 395) ^ 0x283)) ^ a8)))();
}

void sub_100042738()
{
}

uint64_t sub_100042758@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, int a7@<W8>)
{
  STACK[0x3F0] = v7;
  STACK[0x440] = STACK[0x288];
  uint64_t v9 = (a7 + 1566) ^ 0x61B ^ *(_DWORD *)(v7 - 0x1FA9E8BAFD93F974) & 0x3Fu;
  *(unsigned char *)(v7 - 0x1FA9E8BAFD93F9B8 + v9) = -46;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v8 + 8 * ((798 * (v9 > a7 + 26)) ^ a7)))(a1, a2, a3, a4, a5, a6, 13, 3862993706);
}

uint64_t sub_1000427FC(int a1)
{
  return (*(uint64_t (**)(void))(v3 + 8 * (((((v2 - 109) | 0x680) ^ 0x3BA) * (v1 == a1)) ^ v2)))();
}

uint64_t sub_10004282C@<X0>(unsigned int a1@<W8>)
{
  return (*(uint64_t (**)(void))(v2
                              + 8
                              * (int)((((v1 + 1643694542) & 0x9E0737F5 ^ (v1 - 27498478) & 0x1A393EE ^ 0x7CE)
                                     * (a1 < 0x20)) ^ v1)))();
}

uint64_t sub_100042888()
{
  BOOL v6 = *v0 == 82 && LODWORD(STACK[0x558]) == -594971754 && v2 == ((LODWORD(STACK[0x2AC]) - 1758) ^ (v3 - 14));
  return (*(uint64_t (**)(void))(v1 + 8 * ((441 * v6) ^ (LODWORD(STACK[0x2AC]) - 1080))))();
}

uint64_t sub_1000428D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25)
{
  int v31 = v30 - 144;
  *(void *)(v30 - 120) = v25;
  *(_DWORD *)(v30 - 112) = (v26 ^ 0x711)
                         + 120
                         + 1225351577
                         * ((1968051862 - ((v30 - 144) | 0x754E1696) + ((v30 - 144) | 0x8AB1E969)) ^ 0xF44E735B);
  *(void *)(v30 - 136) = a25;
  *(void *)(v30 - 128) = a24;
  *(void *)(v30 - 144) = a25;
  (*(void (**)(uint64_t))(v27 + 8 * ((v26 ^ 0x711) + 1599)))(v30 - 144);
  *(_DWORD *)(v30 - 112) = (v26 ^ 0x711)
                         + 120
                         + 1225351577 * ((~((v30 - 144) | 0xA9F5623A) + ((v30 - 144) & 0xA9F5623A)) ^ 0x28F507F7);
  *(void *)(v30 - 144) = a25;
  *(void *)(v30 - 136) = a25;
  *(void *)(v30 - 128) = a24;
  *(void *)(v30 - 120) = v25;
  (*(void (**)(uint64_t))(v27 + 8 * ((v26 ^ 0x711) + 1599)))(v30 - 144);
  *(_DWORD *)(v30 - 112) = (v26 ^ 0x711)
                         + 120
                         + 1225351577 * ((((v30 - 144) | 0x2567ABA4) - ((v30 - 144) & 0x2567ABA4)) ^ 0x5B983196);
  *(void *)(v30 - 128) = a24;
  *(void *)(v30 - 120) = v25;
  *(void *)(v30 - 144) = a25;
  *(void *)(v30 - 136) = a25;
  (*(void (**)(uint64_t))(v27 + 8 * (v26 ^ 0xED0)))(v30 - 144);
  int v32 = (v26 ^ 0x711) + 1275;
  unsigned int v33 = 535753261 * ((((v31 | 0x3FFAE838) ^ 0xFFFFFFFE) - (~v31 | 0xC00517C7)) ^ 0xCAF119E8);
  *(_DWORD *)(v30 - 144) = -470130727 - v33 + v28 + 1;
  *(_DWORD *)(v30 - 140) = v32 - v33;
  *(void *)(v30 - 136) = v29;
  (*(void (**)(uint64_t))(v27 + 8 * (v26 ^ 0xED8)))(v30 - 144);
  uint64_t v34 = v29;
  BOOL v35 = *(_DWORD *)(v30 - 128) == 38 * (v26 ^ 0x6EA) + 453444202;
  unsigned int v36 = 535753261 * (((v31 ^ 0x8000C829 | 0x2ACF2346) + (v31 ^ 0x50202 | 0xD530DCB9)) ^ 0x8AF1C405);
  *(_DWORD *)(v30 - 144) = -470130727 - v36 + v28;
  *(_DWORD *)(v30 - 140) = v32 - v36;
  *(void *)(v30 - 136) = v34;
  uint64_t v37 = (*(uint64_t (**)(uint64_t))(v27 + 8 * (v26 ^ 0xED8)))(v30 - 144);
  return (*(uint64_t (**)(uint64_t))(v27 + 8 * ((969 * v35) ^ v26 ^ 0x711)))(v37);
}

uint64_t sub_100042B5C()
{
  return (*(uint64_t (**)(void))(v2
                              + 8
                              * ((197
                                * (((58 * (v1 ^ 0x653) + 1950830156) ^ v0)
                                 + ((2 * v0) & 0xFFBFDFFA ^ 0x173159E2)
                                 + 7 * (v1 ^ 0x68B) == -2099816)) ^ v1)))();
}

void sub_100042BE4()
{
}

uint64_t sub_100042BF0(uint64_t a1, int a2)
{
  return (*(uint64_t (**)(void))(v2
                              + 8
                              * (((a1 != ((7 * (a2 ^ 0x7FDu)) ^ 0x3F4D603B87B82227)) * (633 * (a2 ^ 0x7C8) - 1234)) | a2)))();
}

uint64_t sub_100042C54()
{
  int v4 = v1 - 1017822189;
  BOOL v5 = v4 < (((v2 ^ 0x111) - 403) | 0x84) + (((v2 ^ 0x111) - 1388) | 0x508) + 1423180499;
  int v6 = v3 - 1017822189 < v4;
  if (v3 - 1017822189 < 1423184024 != v5) {
    int v6 = v5;
  }
  return (*(uint64_t (**)(void))(v0 + 8 * (v6 | (v6 << 6) | v2 ^ 0x111)))();
}

uint64_t sub_100042CD8()
{
  *(_DWORD *)(*(void *)(v5 - 0x4C6937770F4864B0) + 4 * (v0 + v1 + ((v2 - 21) | 0x116u))) = -1293453008;
  return (*(uint64_t (**)(void))(v4 + 8 * ((226 * (v0 + v1 + 405 < v3)) ^ (v2 + 988))))();
}

uint64_t sub_100042D3C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33)
{
  int v36 = v33 & 0x397E2FF;
  uint64_t v37 = (*(uint64_t (**)(uint64_t, void))(v34 + 8 * ((v33 & 0x397E2FFu) + 1390)))(a12, 0);
  uint64_t v38 = *(void *)(v35 - 208);
  *(_DWORD *)(v35 - 220) = *(_DWORD *)(v35 - 200);
  *(_DWORD *)(v35 - 216) = v38;
  uint64_t v39 = 8 * (v36 ^ 0xAEFu);
  *(_DWORD *)(v35 - 212) = (*(uint64_t (**)(uint64_t))(v34 + v39))(v37);
  uint64_t v40 = (*(uint64_t (**)(void))(v34 + v39))();
  *(_DWORD *)(v35 - 224) = v40;
  LODWORD(a31) = a32 + 1;
  return sub_100042DD0(v40, v41, v42, v43, v44, v45, v46, v47, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
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

uint64_t sub_100042DD0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39)
{
  *(_DWORD *)(v40 + 4 * (v42 - 5584596)) = *(_DWORD *)(a39 + 4 * v41)
                                                         + v41
                                                         + ((1664525
                                                           * (*(_DWORD *)(v40 + 4 * (v42 - 5584597)) ^ (*(_DWORD *)(v40 + 4 * (v42 - 5584597)) >> 30))) ^ *(_DWORD *)(v40 + 4 * (v42 - 5584596)));
  int v45 = (v43 - 1920057348) ^ a33;
  *(_DWORD *)(v44 - 120) = v45;
  *(void *)(v44 - 128) = a33 + 2861670891;
  *(_DWORD *)(v44 - 104) = -(int)a33;
  *(_DWORD *)(v44 - 132) = v45 ^ 0x3C;
  *(_DWORD *)(v44 - 144) = (v43 + 1388397614) ^ a33;
  *(_DWORD *)(v44 - 140) = v45 ^ 0x59;
  *(void *)(v44 - 112) = (v42 - 1438881000) + a33;
  uint64_t v46 = (*(uint64_t (**)(uint64_t))(a34 + 8 * (v43 ^ (v39 + 1997))))(v44 - 144);
  return (*(uint64_t (**)(uint64_t))(a34 + 8 * *(int *)(v44 - 136)))(v46);
}

void sub_100042EB4(uint64_t a1, uint64_t a2)
{
  unsigned int v3 = *(&off_10005CE90
       + ((85 * ((qword_100060158 - dword_100060168) ^ 0xD)) ^ byte_1000519D0[byte_10004D730[(85 * ((qword_100060158 - dword_100060168) ^ 0xD))] ^ 0xE6])
       - 152);
  unsigned __int8 v4 = 85 * ((qword_100060158 + *v3) ^ 0xD);
  uint64_t v5 = *(&off_10005CE90 + (byte_10005696C[(byte_1000518D4[v4 - 4] ^ 0x42) - 12] ^ v4)
                        + 59);
  unint64_t v6 = (unint64_t)&v8[*v5 ^ *v3];
  void *v3 = 839241301 * (v6 - 0x78A901D92725650DLL);
  void *v5 = 839241301 * (v6 ^ 0x78A901D92725650DLL);
  **(_DWORD **)(a1 + 96) = *(_DWORD *)(a2 + 16);
  LODWORD(v6) = 235795823
              * (((v10 | 0x6937D69) - v10 + (v10 & 0xF96C8290)) ^ 0x923E3430);
  int v11 = v6 + 832817738;
  int v12 = 1172345435 - v6;
  uint64_t v13 = &STACK[0x1FA9E8BAFD93FA34];
  LODWORD(v5) = 839241301 * (*(_DWORD *)v3 ^ 0x2725650D ^ *(_DWORD *)v5);
  uint64_t v7 = (uint64_t)*(&off_10005CE90
                + ((85 * ((qword_100060158 + dword_100060168) ^ 0xD)) ^ byte_100049F60[byte_100056A60[(85 * ((qword_100060158 + dword_100060168) ^ 0xD))] ^ 0xC8])
                - 25);
  (*(void (**)(unsigned char *))(v7
                                  + 8
                                  * ((byte_10004A064[(byte_100056B68[v5 - 8] ^ 0x1D)
                                                                                  - 4] ^ v5)
                                   + 2047)))(v10);
  __asm { BRAA            X8, X17 }
}

uint64_t sub_1000431C8@<X0>(uint64_t a1@<X8>)
{
  *(unsigned char *)(a1 - 0x6CA88026133E1E07) = 1;
  return sub_1000431E0();
}

uint64_t sub_1000431E0(uint64_t result)
{
  uint64_t v3 = *(void *)(v1 + 32);
  *(void *)(*(void *)(v1 + 16) - 0x513D873E067408EBLL) = result;
  *(_DWORD *)(v3 - 0x43A9E9343BFE8E53) = v2;
  *(_DWORD *)(v1 + 12) = -1158872075;
  return result;
}

void sub_100043258()
{
  *(_DWORD *)(v1 + 16) = v0;
}

void sub_10004329C(int a1@<W8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,int a31,int a32)
{
  (*(void (**)(void, void, void, void, unint64_t *, uint64_t, uint64_t, unint64_t *))(v36 + 8 * (a1 + 694)))(*v37, (v32 + v35), a32 ^ 0xC1EF3DAu, (((a1 + 94) | 0xD1) ^ 0xACE26DF5) + v37[13], &STACK[0x1850], v33, v34, &STACK[0x1820]);
  JUMPOUT(0x100043340);
}

uint64_t sub_100043604@<X0>(uint64_t a1@<X3>, int a2@<W4>, char a3@<W5>, uint64_t a4@<X6>, uint64_t a5@<X7>, uint64_t a6@<X8>)
{
  uint64_t v12 = (v10 + a2);
  *(unsigned char *)(a1 + v12 + a4) = *(unsigned char *)(a5 + v12) ^ ((v12 & 0xF) * a3) ^ *(unsigned char *)(a6 + (v12 & 0xF)) ^ *(unsigned char *)((v12 & 0xF) + v6 + 1) ^ (v9 + 39) ^ *(unsigned char *)(v7 + (v12 & 0xF));
  return (*(uint64_t (**)(void))(v11 + 8 * ((30 * (v10 - 1 != ((v9 + 22) ^ v8) + v9)) ^ (v9 + 1077))))();
}

uint64_t sub_100043680(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21)
{
  *(_DWORD *)(v23 - 112) = v22 + 3804331 * ((v23 + 729909663 - 2 * ((v23 - 120) & 0x2B818A17)) ^ 0xA42491D1) + 465;
  *(void *)(v23 - 104) = a6;
  *(void *)(v23 - 120) = a21;
  (*(void (**)(uint64_t))(v21 + 8 * (v22 ^ 0xAE8)))(v23 - 120);
  *(void *)(v23 - 104) = a19;
  *(void *)(v23 - 120) = a21;
  *(_DWORD *)(v23 - 112) = v22
                         + 3804331 * ((2 * ((v23 - 120) & 0xD4CFCC0) - (v23 - 120) + 1924334396) ^ 0xFD1618FA)
                         + 947;
  uint64_t v24 = (*(uint64_t (**)(uint64_t))(v21 + 8 * (v22 ^ 0xA9B)))(v23 - 120);
  return (*(uint64_t (**)(uint64_t))(v21
                                            + 8
                                            * ((56
                                              * (*(_DWORD *)(v23 - 108) - 1996101795 < (v22 - 200413445))) ^ v22)))(v24);
}

uint64_t sub_1000437B4@<X0>(uint64_t a1@<X3>, uint64_t a2@<X7>, int a3@<W8>)
{
  *(unsigned char *)(a1 + a3 - 200978466 + v5 - 609 + ((v5 + 2113534275) & 0x820606BF) - 725) = *(unsigned char *)(a2
                                                                                                 + (v4 - 327863513));
  return (*(uint64_t (**)(void))(v6 + 8 * (v5 ^ (7 * ((v3 & 0xFFFFFFFC) != 327863512)))))();
}

uint64_t sub_10004382C()
{
  int v6 = (v0 + 342) | 0x291;
  _DWORD *v4 = v4[623];
  unint64_t v7 = 1178560073 * ((0xAC77E651F55CC418 - (v2 | 0xAC77E651F55CC418) + STACK[0x298]) ^ 0x48744946B0374385);
  *(_DWORD *)(v5 - 176) = (v6 + 731902608) ^ v7;
  *(void *)(v5 - 184) = v7 + 2487768992u;
  *(void *)(v5 - 168) = (v1 + 1007873928) + v7;
  *(_DWORD *)(v5 - 200) = (v6 - 1501687621) ^ v7;
  *(_DWORD *)(v5 - 196) = ((v6 + 731902608) | 0x1A) ^ v7;
  *(_DWORD *)(v5 - 188) = (v6 + 731902696) ^ v7;
  *(_DWORD *)(v5 - 160) = -(int)v7;
  uint64_t v8 = (*(uint64_t (**)(uint64_t))(v3 + 8 * (v6 + 324)))(v5 - 200);
  return (*(uint64_t (**)(uint64_t))(v3 + 8 * *(int *)(v5 - 192)))(v8);
}

void sub_100043920()
{
}

uint64_t sub_100043928(uint64_t a1, uint64_t a2, int a3)
{
  return (*(uint64_t (**)(uint64_t))(v4 + 8 * ((((7 * (v3 ^ 0x174)) ^ 0x6F6) * (a3 > 0)) ^ v3)))(1503743600);
}

uint64_t sub_1000439A0()
{
  return (*(uint64_t (**)(void))(v2
                              + 8
                              * (v1 | (32
                                     * (v0 == ((v1 + 245) | 0xC5u) + 0x6E597EB51999B073 + 5 * (v1 ^ 0x688u) - 2645)))))();
}

uint64_t sub_1000439EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,int a21,int a22)
{
  return (*(uint64_t (**)(void))(v23 + 8 * ((13 * (a22 == (((v22 ^ 0x2BD) - 305) ^ (a6 + 34)))) ^ v22)))();
}

void sub_100043A2C()
{
}

uint64_t sub_100043A38@<X0>(uint64_t a1@<X1>, unint64_t a2@<X2>, int a3@<W3>, int a4@<W5>, unint64_t a5@<X8>, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22)
{
  int v34 = v33 + a3;
  int v35 = v33 + 1;
  uint64_t v36 = 4 * (v35 + a3);
  unint64_t v37 = (*(_DWORD *)(a22 + v36) ^ v22) + (a1 ^ HIDWORD(a5));
  unint64_t v38 = HIDWORD(v30)
      + v26 * (unint64_t)(*(_DWORD *)(*v31 + v36) ^ v22)
      + ((v37 + ((v25 - 808) ^ (v24 + 276)) - (v28 & (2 * v37))) ^ a2);
  *(_DWORD *)(a22 + 4 * v34) = v38 + v22 - (v23 & (2 * v38));
  BOOL v40 = v35 + a4 > 1267606904 || v35 + a4 < v32;
  return (*(uint64_t (**)(void))(v27 + 8 * ((v40 * v29) ^ v25)))();
}

uint64_t sub_100043AD0()
{
  int v4 = 628203409 * ((((v3 - 200) | 0xFA8733D5) + (~(v3 - 200) | 0x578CC2A)) ^ 0x780F3FE7);
  unint64_t v5 = STACK[0x230];
  *(void *)(v3 - 200) = STACK[0x240];
  *(void *)(v3 - 192) = v5;
  *(_DWORD *)(v3 - 184) = v1 - v4 + 434;
  *(_DWORD *)(v3 - 180) = v0 - v4 + 854318832;
  unint64_t v6 = STACK[0x288];
  *(void *)(v3 - 176) = STACK[0x248];
  unint64_t v7 = STACK[0x238];
  *(void *)(v3 - 160) = v6;
  *(void *)(v3 - 152) = v7;
  uint64_t v8 = (*(uint64_t (**)(uint64_t))(v2 + 8 * (v1 ^ 0x8D8)))(v3 - 200);
  return (*(uint64_t (**)(uint64_t, uint64_t, __n128))(v2
                                                             + 8
                                                             * (int)(((*(_DWORD *)(v3 - 168) == -1158872075)
                                                                    * (v1 + ((v1 + 619) ^ 0xFFFFF969) + 1634)) ^ v1)))(v8, 48, (__n128)0);
}

void sub_100043BC4()
{
}

uint64_t sub_100043C5C()
{
  return (*(uint64_t (**)(void))(v0 + 8 * ((2004 * (((6 * ((v1 + 707) ^ 0x3FC)) ^ 0x12E) == 32)) ^ (v1 + 707))))();
}

uint64_t sub_100043CE0()
{
  return (*(uint64_t (**)(void))(v3
                              + 8
                              * (int)((((((v1 - 29) | 0x2B0) ^ 0xFFFFFFC8) + (v1 ^ 0x2AF)) * (v0 == v2 - 426397374)) ^ v1)))();
}

void sub_100043D28()
{
}

uint64_t sub_100043D30()
{
  int v7 = *(unsigned __int8 *)(v3 + v4 - 0x568C3E319D68A4ACLL) - *(unsigned __int8 *)(v2 + v4 - 0x568C3E319D68A4ACLL);
  return (*(uint64_t (**)(uint64_t))(v5
                                            + 8
                                            * ((824
                                              * ((((v6 + v0 - 21) ^ 0xB76766A) & (2 * v7)) + ((v0 + 109) ^ v1 ^ v7) == v1 + 126)) ^ v0)))(4294925278);
}

void sub_100043DA0()
{
  int v1 = (const float *)(v0 + 908);
  vld1q_dup_f32(v1);
  JUMPOUT(0x100043DBCLL);
}

void sub_100043E68(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,int a22,int a23)
{
  int v27 = 460628867 * ((((2 * (v26 - 144)) | 0xC14A8B9C) - (v26 - 144) + 526039602) ^ 0xAC33C7B3);
  *(void *)(v26 - 128) = v25;
  *(void *)(v26 - 144) = a9;
  *(_DWORD *)(v26 - 120) = a23 - v27 + 511428738 + v23 - 149;
  *(_DWORD *)(v26 - 136) = v23 - v27 + 1056;
  (*(void (**)(uint64_t))(v24 + 8 * (v23 ^ 0xBD3)))(v26 - 144);
  JUMPOUT(0x10000D6ACLL);
}

uint64_t sub_100043EF4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52)
{
  unint64_t v56 = STACK[0x2B0];
  int v57 = STACK[0x414];
  unsigned int v58 = (((v53 ^ 0xABE) + 284832254) & 0xEF05CF6F ^ 0xEFE71CF0) & (2 * LODWORD(STACK[0x414]));
  int v59 = 1374699841 * ((((v55 - 200) | 0xA6087EC5) - ((v55 - 200) & 0xA6087EC5)) ^ 0xCBFC66CC);
  *(void *)(v55 - 136) = a39;
  *(void *)(v55 - 184) = v56;
  *(void *)(v55 - 168) = a51;
  LOBYTE(STACK[0x18C0]) = -117 - 65 * ((((v55 + 56) | 0xC5) - ((v55 + 56) & 0xC5)) ^ 0xCC);
  *(void *)(v55 - 160) = a27;
  *(void *)(v55 - 152) = a52;
  *(_DWORD *)(v55 - 144) = v59 + v52 + (v53 ^ 0xABE) + 1024 - 673828488;
  *(_DWORD *)(v55 - 200) = (v53 ^ 0xABE) - v59 - 464;
  *(_DWORD *)(v55 - 196) = v59 + v57 - 135033746 - v58;
  uint64_t v60 = (*(uint64_t (**)(uint64_t))(v54 + 8 * (v53 ^ 0x28)))(v55 - 200);
  int v61 = *(_DWORD *)(v55 - 192);
  LODWORD(STACK[0x464]) = v61;
  return (*(uint64_t (**)(uint64_t))(v54 + 8 * ((1273 * (v61 == -1158872075)) ^ v53 ^ 0xABE)))(v60);
}

void sub_100044020(uint64_t a1@<X8>)
{
  *(_DWORD *)(a1 - 0x6A5823FD3C5DCA9CLL) = v1 - 1;
  JUMPOUT(0x100005E2CLL);
}

void sub_10004403C(int a1@<W8>)
{
  (*(void (**)(void, void, unint64_t))(v3 + 8 * (a1 + 653)))(LODWORD(STACK[0x3B8]), (v1 + v2), STACK[0x510]);
  JUMPOUT(0x1000440A0);
}

uint64_t sub_1000442D4()
{
  return (*(uint64_t (**)(void))(v0 + 8 * (((((v2 - 1661503129) & 0x6308879F) - 1663) * (v1 == 0)) ^ v2)))();
}

uint64_t sub_10004430C(int a1)
{
  return (*(uint64_t (**)(void))(v3 + 8 * ((((a1 - 1396) ^ 0x69B ^ ((a1 - 1275) | 0x600)) * (v1 == v2)) | a1)))();
}

void sub_100044340(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7)
{
  uint64_t v14 = *(void *)(v12 - 0x4C6937770F4864B0);
  unsigned int v15 = (*(_DWORD *)(v14 + 4 * (v13 - 1)) ^ v10) >> v9;
  *(_DWORD *)(v14 + 4 * (v7 + v8 + 1)) = v15 + ((a7 - 182) ^ (v10 + 42)) - (v11 & (2 * v15));
  JUMPOUT(0x1000443C0);
}

uint64_t sub_100044400@<X0>(int a1@<W1>, char a2@<W3>, int a3@<W4>, uint64_t a4@<X6>, int a5@<W8>)
{
  *(unsigned char *)(v6 + v7) = *(unsigned char *)(a4 + (v5 + a1))
                      + (a2 | ~(2 * *(unsigned char *)(a4 + (v5 + a1))))
                      + 83;
  return (*(uint64_t (**)(void))(v8 + 8 * (((2 * (v7 == 63)) | (8 * (v7 == 63))) ^ (a3 + a5 + 1127))))();
}

uint64_t sub_10004444C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,int a21)
{
  return (*(uint64_t (**)(void))(v22 + 8 * (((a21 == 363543107) * ((49 * (v21 ^ 0x225)) ^ 0x57F)) ^ v21)))();
}

uint64_t sub_100044494(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, int a20,int a21)
{
  BOOL v22 = ((a21 - 1228396329) ^ 0x5DFB6FEF176E7D3FLL)
      + ((2 * (a21 - 1228396329)) & 0x2EDCFA7E)
      - 0x5DFB6FEE3BF789D0 != a7 - 1042;
  return (*(uint64_t (**)(void))(v21 + 8 * (((16 * v22) | (32 * v22)) ^ a1)))();
}

uint64_t sub_10004453C()
{
  *(void *)(v3 + (v0 ^ v4) + v5) = v7;
  return (*(uint64_t (**)(void))(v6 + 8 * ((28 * (v2 != v5)) ^ v1)))();
}

uint64_t sub_10004456C@<X0>(int a1@<W8>)
{
  return (*(uint64_t (**)(void))(v2 + 8 * (((a1 != v1 - 323) * (((v1 - 1840286562) & 0x6DB08F7E) - 1358)) ^ v1)))();
}

uint64_t sub_100044644(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50)
{
  unsigned int v57 = ((2 * ((v55 ^ 0xF9551F6D) & 0x10143999) - (v55 ^ 0xF9551F6D) - 269760924) ^ 0x1C4AD726) * v54;
  *(_DWORD *)(v56 - 196) = -1769365458 - v57;
  *(_DWORD *)(v56 - 192) = (v51 + 8) ^ v57;
  *(void *)(v56 - 176) = a50;
  *(void *)(v56 - 168) = v50;
  *(void *)(v56 - 184) = a49;
  uint64_t v58 = (*(uint64_t (**)(uint64_t))(v53 + 8 * (v51 ^ 0xA72)))(v56 - 200);
  return (*(uint64_t (**)(uint64_t))(v53 + 8 * (((*(_DWORD *)(v56 - 200) != v52) * (v51 ^ 0x271)) ^ v51)))(v58);
}

uint64_t sub_100044708(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25)
{
  return (*(uint64_t (**)(void))(v28
                              + 8
                              * (((*(_DWORD *)(a25 + 4 * (v27 + 5 * (v26 ^ 0x71u))) == v25) * (v26 ^ 0x589)) ^ (v26 + 701))))();
}

void sub_10004474C()
{
}

uint64_t sub_100044A4C@<X0>(uint64_t a1@<X8>)
{
  int8x16x4_t v29 = vld4q_s8(v1);
  int v4 = LODWORD(STACK[0x220]) + 622;
  v5.i64[0] = 0x5252525252525252;
  v5.i64[1] = 0x5252525252525252;
  uint8x16_t v6 = (uint8x16_t)veorq_s8(v29.val[0], v5);
  uint16x8_t v7 = vmovl_high_u8(v6);
  int8x16_t v8 = (int8x16_t)vmovl_high_u16(v7);
  uint16x8_t v9 = vmovl_u8(*(uint8x8_t *)v6.i8);
  int8x16_t v10 = (int8x16_t)vmovl_high_u16(v9);
  uint8x16_t v11 = (uint8x16_t)veorq_s8(v29.val[1], v5);
  uint16x8_t v12 = vmovl_u8(*(uint8x8_t *)v11.i8);
  uint16x8_t v13 = vmovl_high_u8(v11);
  int8x16_t v14 = vorrq_s8((int8x16_t)vshll_n_u16(*(uint16x4_t *)v12.i8, 8uLL), (int8x16_t)vmovl_u16(*(uint16x4_t *)v9.i8));
  int8x16_t v15 = vorrq_s8((int8x16_t)vshll_high_n_u16(v12, 8uLL), v10);
  int8x16_t v16 = vorrq_s8((int8x16_t)vshll_n_u16(*(uint16x4_t *)v13.i8, 8uLL), (int8x16_t)vmovl_u16(*(uint16x4_t *)v7.i8));
  int8x16_t v17 = vorrq_s8((int8x16_t)vshll_high_n_u16(v13, 8uLL), v8);
  uint8x16_t v18 = (uint8x16_t)veorq_s8(v29.val[2], v5);
  _Q17 = (int8x16_t)vmovl_high_u8(v18);
  _Q16 = (int8x16_t)vmovl_u8(*(uint8x8_t *)v18.i8);
  int8x16_t v21 = (int8x16_t)vshll_n_s16(*(int16x4_t *)_Q16.i8, 0x10uLL);
  __asm { SHLL2           V16.4S, V16.8H, #0x10 }
  int8x16_t v26 = (int8x16_t)vshll_n_s16(*(int16x4_t *)_Q17.i8, 0x10uLL);
  __asm { SHLL2           V17.4S, V17.8H, #0x10 }
  v29.val[0] = veorq_s8(v29.val[3], v5);
  v29.val[1] = (int8x16_t)vmovl_u8(*(uint8x8_t *)v29.val[0].i8);
  v29.val[0] = (int8x16_t)vmovl_high_u8((uint8x16_t)v29.val[0]);
  v29.val[2] = vorrq_s8(vorrq_s8(v14, v21), (int8x16_t)vshlq_n_s32((int32x4_t)vmovl_u16(*(uint16x4_t *)v29.val[1].i8), 0x18uLL));
  v29.val[1] = vorrq_s8(vorrq_s8(v15, _Q16), (int8x16_t)vshlq_n_s32((int32x4_t)vmovl_high_u16((uint16x8_t)v29.val[1]), 0x18uLL));
  v29.val[3] = vorrq_s8(vorrq_s8(v16, v26), (int8x16_t)vshlq_n_s32((int32x4_t)vmovl_u16(*(uint16x4_t *)v29.val[0].i8), 0x18uLL));
  v29.val[0] = vorrq_s8(vorrq_s8(v17, _Q17), (int8x16_t)vshlq_n_s32((int32x4_t)vmovl_high_u16((uint16x8_t)v29.val[0]), 0x18uLL));
  v29.val[1] = (int8x16_t)vsubq_s32((int32x4_t)v29.val[1], (int32x4_t)vandq_s8((int8x16_t)vaddq_s32((int32x4_t)v29.val[1], (int32x4_t)v29.val[1]), *(int8x16_t *)&STACK[0x210]));
  int32x4_t v27 = *(int32x4_t *)&STACK[0x200];
  v29.val[2] = (int8x16_t)vaddq_s32(vsubq_s32((int32x4_t)v29.val[2], (int32x4_t)vandq_s8((int8x16_t)vaddq_s32((int32x4_t)v29.val[2], (int32x4_t)v29.val[2]), *(int8x16_t *)&STACK[0x210])), *(int32x4_t *)&STACK[0x200]);
  v29.val[0] = (int8x16_t)vaddq_s32(vsubq_s32((int32x4_t)v29.val[0], (int32x4_t)vandq_s8((int8x16_t)vaddq_s32((int32x4_t)v29.val[0], (int32x4_t)v29.val[0]), *(int8x16_t *)&STACK[0x210])), *(int32x4_t *)&STACK[0x200]);
  *(int32x4_t *)(a1 + 32) = vaddq_s32(vsubq_s32((int32x4_t)v29.val[3], (int32x4_t)vandq_s8((int8x16_t)vaddq_s32((int32x4_t)v29.val[3], (int32x4_t)v29.val[3]), *(int8x16_t *)&STACK[0x210])), *(int32x4_t *)&STACK[0x200]);
  *(int8x16_t *)(a1 + 48) = v29.val[0];
  *(int8x16_t *)a1 = v29.val[2];
  *(int32x4_t *)(a1 + 16) = vaddq_s32((int32x4_t)v29.val[1], v27);
  return (*(uint64_t (**)(void))(v3
                              + 8
                              * (((2 * ((v2 + 783333545) > 0xF)) | (4
                                                                                * ((v2 + 783333545) > 0xF))) ^ (v4 - 817))))();
}

uint64_t sub_100044C78(uint64_t a1, int a2)
{
  BOOL v9 = v7 - (v3 & 0xFFFFFFF8) == -8;
  uint64_t v10 = v5 + v4 + v6 - v7 + ((a2 - 131) | 0x116u);
  *(void *)(a1 - 7 + v10) = *(void *)(v2 - 7 + v10);
  int v11 = v9;
  return (*(uint64_t (**)(void))(v8 + 8 * ((14 * v11) ^ a2)))();
}

uint64_t sub_100044CD8()
{
  return (*(uint64_t (**)(void))(v0
                              + 8
                              * ((8 * ((((v2 + v1 + 268700257) < 8) ^ 0x7B) & 1)) & 0xDF | (32 * ((((v2 + v1 + 268700257) < 8) ^ 0x7B) & 1)) | 0x546u)))();
}

uint64_t sub_100044D44()
{
  return (*(uint64_t (**)(void))(v2
                              + 8
                              * ((1886
                                * (((2 * (*v1 - 42)) & 0xFDFFDBFC) + ((*v1 - 42) ^ 0x7EFFEDFE) == ((v0 + 664) ^ 0x7EFFEF53))) ^ (v0 + 479))))();
}

uint64_t sub_100044DAC(void *a1, uint64_t a2, int a3)
{
  return sub_100036C20(a3, a1);
}

void sub_100044DD4()
{
}

uint64_t sub_100044DDC()
{
  return (*(uint64_t (**)(void))(v1 + 8 * ((340 * ((v2 ^ v3) < v0 - 643)) ^ v0)))();
}

void sub_100044E14()
{
  int v3 = 235795823 * ((v2 - 200) ^ 0x94AD4959);
  *(void *)(v2 - 184) = STACK[0x2D8];
  *(_DWORD *)(v2 - 196) = v3 + 832817738;
  *(_DWORD *)(v2 - 192) = 1172345370 - v3 + v1 + 43;
  (*(void (**)(uint64_t))(v0 + 8 * (v1 + 2086)))(v2 - 200);
  JUMPOUT(0x100044E8CLL);
}

uint64_t sub_100044EAC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7)
{
  return (*(uint64_t (**)(uint64_t))(v10 + 8 * ((285 * (v7 + 1 == v9 + 20)) ^ a7)))(v8);
}

uint64_t sub_100044F8C@<X0>(void *a1@<X0>, int a2@<W3>, uint64_t a3@<X8>)
{
  *(void *)(*a1 - 0x6DD0242DB3724EE9) = v6 + v5 + 8;
  return (*(uint64_t (**)(void))(a3 + 8 * ((947 * (*v3 == ((a2 - 48) ^ (v4 + 869)))) ^ (a2 - 1028))))();
}

uint64_t sub_100044FEC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,int a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39)
{
  *(_DWORD *)(a39 + 4 * v39) ^= a31;
  return sub_100045008();
}

uint64_t sub_100045008()
{
  return (*(uint64_t (**)(void))(v2
                              + 8
                              * ((52
                                * ((((v0 + 293912717) ^ (v1 - 1404883218 + (v0 ^ 0x53BCD1AD) == 99991747)) & 1) == 0)) ^ v0)))();
}

uint64_t sub_10004507C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,int a54,unsigned int a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61)
{
  *(void *)(a58 + 1560) = *(void *)STACK[0x448];
  *(_DWORD *)(a58 + 1552) = *(_DWORD *)STACK[0x348];
  *(void *)(*(void *)(a61 + 96) + 488) = *(void *)(a61 + 8);
  *(_DWORD *)(*(void *)(a61 + 96) + 480) = *(_DWORD *)a61;
  return sub_1000450F0(a55, a2, 1754, a4, a5, a6, a7, 186);
}

uint64_t sub_1000450F0@<X0>(int a1@<W0>, char a2@<W7>, uint64_t a3@<X8>)
{
  unsigned char *v3 = ((v4 + a3) ^ a2) * (v5 + a3);
  return (*(uint64_t (**)(void))(v7 + 8 * (((((a3 == 103) ^ (a1 + 78)) & 1) * v6) ^ a1)))();
}

uint64_t sub_100045130(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18)
{
  *(_DWORD *)(v23 - 112) = v18
                         + ((((v23 - 120) ^ 0xED3B11D2 | 0x3A86F137)
                           - ((v23 - 120) ^ 0xED3B11D2)
                           + (((v23 - 120) ^ 0xED3B11D2) & 0xC5790EC8)) ^ 0x5818FB23)
                         * v20
                         + 1076;
  *(void *)(v23 - 104) = v21;
  *(void *)(v23 - 120) = a18;
  uint64_t v24 = (*(uint64_t (**)(uint64_t))(v19 + 8 * (v18 + 1512)))(v23 - 120);
  return (*(uint64_t (**)(uint64_t))(v19
                                            + 8
                                            * ((((*(_DWORD *)(v23 - 108) + v22) < 0xF9A00238)
                                              * ((v18 ^ 0x2A1) + 1320)) ^ v18)))(v24);
}

uint64_t sub_1000451D4(uint64_t a1, uint64_t a2, unsigned int a3)
{
  return (*(uint64_t (**)(void))(v3
                              + 8
                              * ((1470
                                * ((((*(unsigned __int8 *)(a2 + 2) - 38) << ((a3 - 8) & 0xEF ^ (v4 - 1))) & v6)
                                 + ((*(unsigned __int8 *)(a2 + 2) - 38) ^ v5) == v5)) ^ a3)))();
}

void sub_100045230()
{
}

uint64_t sub_100045238(unsigned int a1)
{
  return (*(uint64_t (**)(void))(v2 + 8 * (((v4 + 1 == v3 + 48) * v1) ^ a1)))();
}

uint64_t sub_100045310(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  BOOL v11 = v7 == a6 || LODWORD(STACK[0x4F4]) - v8 != ((v6 + 13) ^ 0xF944D8EC);
  return (*(uint64_t (**)(void))(v9 + 8 * ((v11 * (((v6 - 1308136083) & 0x4DF892F3) - 692)) ^ v6)))();
}

uint64_t sub_100045368(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, int a18, int a19, uint64_t a20,unint64_t *a21,int a22,unsigned int a23)
{
  unsigned int v28 = 1755732067 * (&a18 ^ 0xDEC6BDDB);
  a22 = (v27 + 2138961537) ^ v28;
  a23 = v28 ^ 0xA391CA94;
  a19 = v28 ^ 0x39C8F867;
  a20 = a13;
  a21 = &STACK[0x3842FAF4B7C49F27];
  uint64_t v29 = (*(uint64_t (**)(int *))(v25 + 8 * (v27 ^ 0xF7A)))(&a18);
  return (*(uint64_t (**)(uint64_t))(v25 + 8 * ((150 * (a18 == v24 + ((v27 - v23 - 479) ^ v26) - 674)) ^ v27)))(v29);
}

uint64_t sub_100045424(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7)
{
  BOOL v13 = v7 == v11 && v9 != a7;
  return (*(uint64_t (**)(void))(v10 + 8 * (((v8 + 231) * v13) ^ v8)))();
}

void sub_100045458()
{
}

void sub_100045460()
{
}

uint64_t sub_100045468(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7, uint64_t a8, uint64_t a9, uint64_t a10, int a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,unsigned int a27)
{
  unsigned int v29 = (a7 + 478039178) & 0xE381B37D;
  int v34 = a7 ^ 0x633;
  int v30 = 1755732067 * ((((v28 - 168) | 0xD7972D6F) - ((v28 - 168) & 0xD7972D6F)) ^ 0x95190B4);
  *(_DWORD *)(v28 - 160) = v30 + a7 + 250;
  *(_DWORD *)(v28 - 156) = a11 - v30;
  *(void *)(v28 - 168) = a21;
  uint64_t v31 = (*(uint64_t (**)(uint64_t))(v27 + 8 * (a7 + 2051)))(v28 - 168);
  uint64_t v32 = v34 ^ 0x622 ^ STACK[0x2C8] & 0x3F;
  *((unsigned char *)&STACK[0x284] + v32) = -46;
  return (*(uint64_t (**)(uint64_t, void, uint64_t))(v27
                                                             + 8
                                                             * (int)(((v32 > 0x37) * (v29 + 1212)) ^ a7)))(v31, a27, 3967103171);
}

uint64_t sub_100045580(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  *(_DWORD *)(a10 - 0x6E06359E347AB90DLL) = (v14 ^ 0xBCA7916D) - v10;
  int v17 = 108757529
      * ((((v15 - 136) ^ 0x1E543FEE | 0xD1B85227)
        - ((v15 - 136) ^ 0x1E543FEE)
        + (((v15 - 136) ^ 0x1E543FEE) & 0x2E47ADD8)) ^ 0x2F700FE2);
  *(void *)(v15 - 128) = v16;
  *(_DWORD *)(v15 - 136) = (v14 + 1695) ^ v17;
  *(_DWORD *)(v15 - 132) = v17 ^ 0x245280BD;
  (*(void (**)(uint64_t))(v12 + 8 * (v14 + 1865)))(v15 - 136);
  int v18 = 535753261 * ((((2 * (v15 - 136)) | 0xEBB3BF32) - (v15 - 136) + 170270823) ^ 0xFF2DD1B6);
  *(void *)(v15 - 136) = v16;
  *(_DWORD *)(v15 - 128) = v18 + ((v13 << 6) & 0x8EFEF7C0) + ((32 * v13) ^ 0xC77F7BEF) + 2142289883;
  *(_DWORD *)(v15 - 124) = (v14 + 1240) ^ v18;
  (*(void (**)(uint64_t))(v12 + 8 * (v14 ^ 0x912)))(v15 - 136);
  *(void *)(v15 - 136) = v11;
  *(_DWORD *)(v15 - 128) = v14
                         + 3804331 * (((~(v15 - 136) & 0xCD5261FC) - (~(v15 - 136) | 0xCD5261FD)) ^ 0x42F77A3B)
                         + 929;
  *(void *)(v15 - 120) = &STACK[0x4C6937770F4864D8];
  (*(void (**)(uint64_t))(v12 + 8 * (v14 ^ 0x938)))(v15 - 136);
  *(void *)(v15 - 136) = v11;
  *(void *)(v15 - 120) = v16;
  *(_DWORD *)(v15 - 128) = v14 + 3804331 * ((v15 - 933916987 - 2 * ((v15 - 136) & 0xC8558F4D)) ^ 0x47F0948B) + 1411;
  uint64_t v19 = (*(uint64_t (**)(uint64_t))(v12 + 8 * (v14 ^ 0x94B)))(v15 - 136);
  return (*(uint64_t (**)(uint64_t))(v12
                                            + 8
                                            * ((28
                                              * ((v14 + 1265 + *(_DWORD *)(v15 - 124) - 1996101795 - 1531) >= 0x8A4F20CF)) ^ v14)))(v19);
}

uint64_t sub_1000457E8(int a1)
{
  int v4 = (a1 ^ 0x704) + a1 - 834 + v3 - 8949821;
  int v5 = (v1 > 0x415ECEFC) ^ (v4 < -1096732413);
  BOOL v6 = v4 < (int)(v1 + 1050751235);
  if (v5) {
    BOOL v6 = v1 > 0x415ECEFC;
  }
  return (*(uint64_t (**)(void))(v2 + 8 * ((648 * v6) ^ a1)))();
}

void sub_100045860()
{
}

void sub_10004586C(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 4) ^ (1225351577 * ((-2 - ((~a1 | 0x83317A5F) + (a1 | 0x7CCE85A0))) ^ 0xFDCEE06D));
  __asm { BRAA            X8, X17 }
}

uint64_t sub_100045950(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  return (*(uint64_t (**)(void))(v6 + 8 * ((28 * (((v4 == v5) ^ (a4 + 35 + a4 - 75 + 1)) & 1)) ^ a4)))();
}

uint64_t sub_100045998@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, unint64_t a6@<X5>, int a7@<W8>, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, int8x16_t *a13)
{
  *int v13 = veorq_s8(*a13, (int8x16_t)xmmword_100056D80);
  STACK[0x540] += 32;
  STACK[0x550] = a6;
  STACK[0x548] = a6;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v14
                                                                                + 8
                                                                                * ((((59 * (a7 ^ 0x186)) ^ 0x12F)
                                                                                  * (v13 == (int8x16_t *)a6)) | a7)))(a1, a2, a3, a4, a5);
}

uint64_t sub_1000459FC(_DWORD *a1)
{
  unsigned int v1 = 108757529 * ((-1057227633 - (a1 | 0xC0FBFC8F) + (a1 | 0x3F040370)) ^ 0xDF98615B);
  int v2 = *a1 ^ v1;
  int v3 = a1[1] ^ v1;
  unsigned int v5 = v3 - 609386684;
  BOOL v4 = v3 - 609386684 < 0;
  LODWORD(v6) = 609386684 - v3;
  if (v4) {
    uint64_t v6 = v6;
  }
  else {
    uint64_t v6 = v5;
  }
  return (*((uint64_t (**)(void))*(&off_10005CE90 + v2 - 1821)
          + (((v6 == ((2 * v6) & 0xFF1736C6)) * ((v2 - 139) ^ 0x703)) ^ v2)))();
}

void sub_100045AB8(uint64_t a1, uint64_t a2)
{
  BOOL v2 = (*(_DWORD *)(a2 + 4) - 1228396329) < 0x102;
  __asm { BRAA            X9, X17 }
}

unsigned char *sub_100045B1C(unsigned char *result, unsigned int a2, unint64_t a3)
{
  unint64_t v3 = -(int)result & 7;
  if (v3 > a3) {
    LODWORD(v3) = a3;
  }
  switch((int)v3)
  {
    case 1:
      goto LABEL_10;
    case 2:
      goto LABEL_9;
    case 3:
      goto LABEL_8;
    case 4:
      goto LABEL_7;
    case 5:
      goto LABEL_6;
    case 6:
      goto LABEL_5;
    case 7:
      *result++ = a2;
LABEL_5:
      *result++ = a2;
LABEL_6:
      *result++ = a2;
LABEL_7:
      *result++ = a2;
LABEL_8:
      *result++ = a2;
LABEL_9:
      *result++ = a2;
LABEL_10:
      *result++ = a2;
      break;
    default:
      break;
  }
  unint64_t v4 = a3 - v3;
  if (v4 >= 8)
  {
    uint64_t v5 = 0x101010101010101 * a2;
    unint64_t v6 = ((v4 >> 3) + 7) >> 3;
    switch((v4 >> 3) & 7)
    {
      case 1uLL:
        goto LABEL_20;
      case 2uLL:
        goto LABEL_19;
      case 3uLL:
        goto LABEL_18;
      case 4uLL:
        goto LABEL_17;
      case 5uLL:
        goto LABEL_16;
      case 6uLL:
        goto LABEL_15;
      case 7uLL:
        goto LABEL_14;
      default:
        do
        {
          *(void *)uint64_t result = v5;
          result += 8;
LABEL_14:
          *(void *)uint64_t result = v5;
          result += 8;
LABEL_15:
          *(void *)uint64_t result = v5;
          result += 8;
LABEL_16:
          *(void *)uint64_t result = v5;
          result += 8;
LABEL_17:
          *(void *)uint64_t result = v5;
          result += 8;
LABEL_18:
          *(void *)uint64_t result = v5;
          result += 8;
LABEL_19:
          *(void *)uint64_t result = v5;
          result += 8;
LABEL_20:
          *(void *)uint64_t result = v5;
          result += 8;
          --v6;
        }
        while (v6);
        break;
    }
  }
  switch(v4 & 7)
  {
    case 1uLL:
      goto LABEL_28;
    case 2uLL:
      goto LABEL_27;
    case 3uLL:
      goto LABEL_26;
    case 4uLL:
      goto LABEL_25;
    case 5uLL:
      goto LABEL_24;
    case 6uLL:
      goto LABEL_23;
    case 7uLL:
      *result++ = a2;
LABEL_23:
      *result++ = a2;
LABEL_24:
      *result++ = a2;
LABEL_25:
      *result++ = a2;
LABEL_26:
      *result++ = a2;
LABEL_27:
      *result++ = a2;
LABEL_28:
      *uint64_t result = a2;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_100045C08@<X0>(uint64_t a1@<X4>, uint64_t a2@<X8>)
{
  return (*(uint64_t (**)(uint64_t))(v4
                                            + 8
                                            * ((78
                                              * (a2 - a1 - 1452 >= (unint64_t)(348
                                                                                    * (((v3 ^ 0x745) - 680858813) & 0x289517A3 ^ 0x600u))
                                                                 - 1012)) ^ v3 ^ 0x745u)))(v2);
}

void CFRelease(CFTypeRef cf)
{
}

CFIndex CFStringGetBytes(CFStringRef theString, CFRange range, CFStringEncoding encoding, UInt8 lossByte, Boolean isExternalRepresentation, UInt8 *buffer, CFIndex maxBufLen, CFIndex *usedBufLen)
{
  return _CFStringGetBytes(theString, range, encoding, lossByte, isExternalRepresentation, buffer, maxBufLen, usedBufLen);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return _CFStringGetLength(theString);
}

uint64_t MGCopyAnswer()
{
  return _MGCopyAnswer();
}

uint64_t MOXPCTransportOpen()
{
  return _MOXPCTransportOpen();
}

uint64_t MOXPCTransportResume()
{
  return _MOXPCTransportResume();
}

uint64_t MOXPCTransportSendMessageOnConnection()
{
  return _MOXPCTransportSendMessageOnConnection();
}

uint64_t MOXPCTransportSetMessageHandler()
{
  return _MOXPCTransportSetMessageHandler();
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_main(void)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return _dlopen(__path, __mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return _dlsym(__handle, __symbol);
}

void exit(int a1)
{
}

mach_msg_return_t mach_msg(mach_msg_header_t *msg, mach_msg_option_t option, mach_msg_size_t send_size, mach_msg_size_t rcv_size, mach_port_name_t rcv_name, mach_msg_timeout_t timeout, mach_port_name_t notify)
{
  return _mach_msg(msg, option, send_size, rcv_size, rcv_name, timeout, notify);
}

void mach_msg_destroy(mach_msg_header_t *a1)
{
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void mig_dealloc_reply_port(mach_port_t reply_port)
{
}

mach_port_t mig_get_reply_port(void)
{
  return _mig_get_reply_port();
}

void mig_put_reply_port(mach_port_t reply_port)
{
}

{
}

{
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_enumerationMutation(id obj)
{
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
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

void rename(const std::__fs::filesystem::path *__from, const std::__fs::filesystem::path *__to, std::error_code *__ec)
{
}

int stat(const char *a1, stat *a2)
{
  return _stat(a1, a2);
}

void syslog(int a1, const char *a2, ...)
{
}

int utimes(const char *a1, const timeval *a2)
{
  return _utimes(a1, a2);
}

BOOLean_t voucher_mach_msg_set(mach_msg_header_t *msg)
{
  return _voucher_mach_msg_set(msg);
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 lastPathComponent];
}

id objc_msgSend_makeDictionary(void *a1, const char *a2, ...)
{
  return [a1 makeDictionary];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return [a1 set];
}