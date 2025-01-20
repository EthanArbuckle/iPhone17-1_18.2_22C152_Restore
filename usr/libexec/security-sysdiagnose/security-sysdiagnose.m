uint64_t start()
{
  unsigned int v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  CFStringRef v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unsigned int DepartureReason;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  CFStringRef v38;
  const void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  CFArrayRef v45;
  CFStringRef *v46;
  const void *v47;
  const void *v48;
  uint64_t PeerID;
  const void *v50;
  const void *v51;
  CFErrorDomain Domain;
  int v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  CFDictionaryRef v70;
  const void *v71;
  const void *v72;
  const void *v73;
  CFDictionaryRef v74;
  const void *v75;
  CFDictionaryRef v76;
  const void *v77;
  void *v78;
  void *v79;
  id v80;
  uint64_t v81;
  uint64_t v82;
  void *i;
  id v84;
  void *v85;
  char IsInternalRelease;
  char v87;
  void *v88;
  CFTypeRef v89;
  id v90;
  void *v91;
  dispatch_semaphore_t v92;
  NSObject *v93;
  void *v94;
  NSObject *v95;
  dispatch_time_t v96;
  dispatch_queue_t v97;
  dispatch_group_t v98;
  NSObject *v99;
  NSObject *v100;
  dispatch_semaphore_t v101;
  dispatch_time_t v102;
  NSObject *v103;
  NSObject *v104;
  CFStringRef *v105;
  const void *v106;
  CFTypeID v107;
  NSObject *v108;
  uint64_t v109;
  CFDictionaryRef v110;
  int v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  char v119;
  char v120;
  char v121;
  char v122;
  void *v123;
  CFDictionaryRef query;
  void *v125;
  CFTypeRef cf;
  CFStringRef context;
  uint64_t v128;
  CFBooleanRef v129;
  void *v130;
  __CFString *v131;
  NSObject *v132;
  long long *v133;
  long long v134;
  long long v135;
  unsigned long long v136;
  long long v137;
  void v138[6];
  long long result;
  CFStringRef v140;
  CFStringRef v141;
  void *v142;
  void *v143;
  CFRange v144;

  puts("sysdiagnose keychain");
  qword_10000C2D0 = (uint64_t)__stdoutp;
  *(void *)&result = 0;
  *(void *)&v134 = 0;
  *((void *)&v134 + 1) = &v134;
  *(void *)&v135 = 0x2020000000;
  DWORD2(v135) = 0;
  v0 = SOSCCThisDeviceIsInCircle();
  if (v0 == -1)
  {
    if (CFErrorGetCode((CFErrorRef)result) == 1050)
    {
      v12 = qword_10000C2D0;
      v13 = @"SOS is not supported on this platform\n";
    }
    else
    {
      v51 = (const void *)sSecXPCErrorDomain;
      Domain = CFErrorGetDomain((CFErrorRef)result);
      v53 = CFEqual(v51, Domain);
      v12 = qword_10000C2D0;
      if (v53)
      {
        v13 = @"SOS status is kSOSCCError due to XPC error\n";
      }
      else
      {
        v119 = result;
        v13 = @"SOS status is kSOSCCError (%@)\n";
      }
    }
    sub_100006318(v12, 0, v13, v7, v8, v9, v10, v11, v119);
    sub_100006318(qword_10000C2D0, 0, @"\n", v54, v55, v56, v57, v58, v122);
  }
  else
  {
    if (v0 > 3) {
      v6 = "<unknown ccstatus>";
    }
    else {
      v6 = off_1000086E0[v0];
    }
    sub_100006318(qword_10000C2D0, 0, @"ccstatus: %s (%d)\n", v1, v2, v3, v4, v5, (char)v6);
    if ((void)result)
    {
      sub_100006318(qword_10000C2D0, 0, @"Error checking circle status: %@\n", v14, v15, v16, v17, v18, result);
      v19 = (const void *)result;
      if ((void)result)
      {
        *(void *)&result = 0;
        CFRelease(v19);
      }
    }
    DepartureReason = SOSCCGetLastDepartureReason();
    if (DepartureReason > 8) {
      v26 = "Unknown";
    }
    else {
      v26 = off_100008700[DepartureReason];
    }
    sub_100006318(qword_10000C2D0, 0, @"LastDepartureReason: %s (%d)\n", v20, v21, v22, v23, v24, (char)v26);
    if ((void)result)
    {
      sub_100006318(qword_10000C2D0, 0, @"Error checking last departure reason error: %@\n", v27, v28, v29, v30, v31, result);
      v32 = (const void *)result;
      if ((void)result)
      {
        *(void *)&result = 0;
        CFRelease(v32);
      }
    }
    if (SOSCCValidateUserPublic())
    {
      v38 = @"Account user public is trusted\n";
    }
    else
    {
      v120 = result;
      v38 = @"Account user public is not trusted error:(%@)\n";
    }
    sub_100006318(qword_10000C2D0, 0, v38, v33, v34, v35, v36, v37, v120);
    v39 = (const void *)result;
    if ((void)result)
    {
      *(void *)&result = 0;
      CFRelease(v39);
    }
    v45 = (const __CFArray *)SOSCCCopyGenerationPeerInfo();
    if (v45)
    {
      context = (CFStringRef)_NSConcreteStackBlock;
      v128 = 3221225472;
      v129 = (CFBooleanRef)sub_10000520C;
      v130 = &unk_100008528;
      v131 = (__CFString *)&v134;
      v46 = &context;
      v144.length = CFArrayGetCount(v45);
      v144.location = 0;
      CFArrayApplyFunction(v45, v144, (CFArrayApplierFunction)sub_10000590C, v46);

      CFRelease(v45);
    }
    else
    {
      sub_100006318(qword_10000C2D0, 0, @"No generation count: %@\n", v40, v41, v42, v43, v44, result);
    }
    v47 = (const void *)result;
    if ((void)result)
    {
      *(void *)&result = 0;
      CFRelease(v47);
    }
    v48 = (const void *)SOSCCCopyMyPeerInfo();
    PeerID = SOSPeerInfoGetPeerID();
    sub_1000052E0((uint64_t)"     Peers", PeerID, (uint64_t)&stru_100008568);
    sub_1000052E0((uint64_t)"   Invalid", PeerID, (uint64_t)&stru_100008588);
    sub_1000052E0((uint64_t)"   Retired", PeerID, (uint64_t)&stru_1000085A8);
    sub_1000052E0((uint64_t)"    Concur", PeerID, (uint64_t)&stru_1000085C8);
    sub_1000052E0((uint64_t)"Applicants", PeerID, (uint64_t)&stru_1000085E8);
    if (v48) {
      CFRelease(v48);
    }
    v50 = (const void *)result;
    if ((void)result)
    {
      *(void *)&result = 0;
      CFRelease(v50);
    }
  }
  _Block_object_dispose(&v134, 8);
  context = 0;
  sub_100006318(qword_10000C2D0, 0, @"Engine state:\n", v59, v60, v61, v62, v63, v121);
  if ((SOSCCForEachEngineStateAsString() & 1) == 0) {
    sub_100006318(qword_10000C2D0, 0, @"No engine state, got error: %@\n", v64, v65, v66, v67, v68, (char)context);
  }
  [@"HomeKit keychain state:\n" writeToStdOut];
  *(void *)&v134 = kSecClass;
  *((void *)&v134 + 1) = kSecAttrAccessGroup;
  context = kSecClassGenericPassword;
  v128 = @"com.apple.hap.pairing";
  *(void *)&v135 = kSecAttrSynchronizable;
  *((void *)&v135 + 1) = kSecMatchLimit;
  v129 = kCFBooleanTrue;
  v130 = (void *)kSecMatchLimitAll;
  v136 = __PAIR128__((unint64_t)kSecReturnData, (unint64_t)kSecReturnAttributes);
  v131 = (__CFString *)&__kCFBooleanTrue;
  v132 = &__kCFBooleanFalse;
  *(void *)&v137 = kSecUseDataProtectionKeychain;
  v133 = (long long *)&__kCFBooleanTrue;
  v69 = +[NSDictionary dictionaryWithObjects:&context forKeys:&v134 count:7];
  v70 = (const __CFDictionary *)[v69 mutableCopy];

  *(void *)&result = 0;
  if (!SecItemCopyMatching(v70, (CFTypeRef *)&result)) {
    sub_100004B44(@"HomeKit", (void *)result);
  }
  v71 = (const void *)result;
  if ((void)result)
  {
    *(void *)&result = 0;
    CFRelease(v71);
  }
  [(__CFDictionary *)v70 setObject:&__kCFBooleanFalse forKeyedSubscript:kSecAttrSynchronizable];
  if (!SecItemCopyMatching(v70, (CFTypeRef *)&result)) {
    sub_100004B44(@"HomeKit", (void *)result);
  }
  v72 = (const void *)result;
  if ((void)result)
  {
    *(void *)&result = 0;
    CFRelease(v72);
  }
  [(__CFDictionary *)v70 setObject:@"com.apple.hap.metadata" forKeyedSubscript:kSecAttrAccessGroup];
  if (!SecItemCopyMatching(v70, (CFTypeRef *)&result)) {
    sub_100004B44(@"HomeKit", (void *)result);
  }
  v73 = (const void *)result;
  if ((void)result)
  {
    *(void *)&result = 0;
    CFRelease(v73);
  }

  [@"AutoUnlock keychain state:\n" writeToStdOut];
  *(void *)&v134 = kSecClass;
  *((void *)&v134 + 1) = kSecAttrAccessGroup;
  context = kSecClassGenericPassword;
  v128 = @"com.apple.continuity.unlock";
  *(void *)&v135 = kSecAttrAccount;
  *((void *)&v135 + 1) = kSecAttrSynchronizable;
  v129 = (CFBooleanRef)@"com.apple.continuity.auto-unlock.sync";
  v130 = kCFBooleanTrue;
  *(void *)&v136 = kSecMatchLimit;
  *((void *)&v136 + 1) = kSecReturnAttributes;
  v131 = (__CFString *)kSecMatchLimitAll;
  v132 = &__kCFBooleanTrue;
  *(void *)&v137 = kSecReturnData;
  v133 = (long long *)&__kCFBooleanFalse;
  v74 = +[NSDictionary dictionaryWithObjects:&context forKeys:&v134 count:7];
  *(void *)&result = 0;
  if (!SecItemCopyMatching(v74, (CFTypeRef *)&result)) {
    sub_100004B44(@"AutoUnlock", (void *)result);
  }
  v75 = (const void *)result;
  if ((void)result)
  {
    *(void *)&result = 0;
    CFRelease(v75);
  }

  [@"Rapport keychain state:\n" writeToStdOut];
  *(void *)&v134 = kSecClass;
  *((void *)&v134 + 1) = kSecAttrAccessGroup;
  context = kSecClassGenericPassword;
  v128 = @"com.apple.rapport";
  *(void *)&v135 = kSecAttrSynchronizable;
  *((void *)&v135 + 1) = kSecMatchLimit;
  v129 = kCFBooleanTrue;
  v130 = (void *)kSecMatchLimitAll;
  v136 = __PAIR128__((unint64_t)kSecReturnData, (unint64_t)kSecReturnAttributes);
  v131 = (__CFString *)&__kCFBooleanTrue;
  v132 = &__kCFBooleanFalse;
  v76 = +[NSDictionary dictionaryWithObjects:&context forKeys:&v134 count:6];
  *(void *)&result = 0;
  if (!SecItemCopyMatching(v76, (CFTypeRef *)&result)) {
    sub_100004B44(@"rapport", (void *)result);
  }
  v77 = (const void *)result;
  if ((void)result)
  {
    *(void *)&result = 0;
    CFRelease(v77);
  }

  [@"Notes keychain state:\n" writeToStdOut];
  v138[0] = kSecClass;
  v138[1] = kSecAttrAccessGroup;
  *(void *)&result = kSecClassGenericPassword;
  *((void *)&result + 1) = @"group.com.apple.notes";
  v138[2] = kSecAttrSynchronizable;
  v138[3] = kSecMatchLimit;
  v140 = kSecAttrSynchronizableAny;
  v141 = kSecMatchLimitAll;
  v138[4] = kSecReturnAttributes;
  v138[5] = kSecReturnData;
  v142 = &__kCFBooleanTrue;
  v143 = &__kCFBooleanFalse;
  query = +[NSDictionary dictionaryWithObjects:&result forKeys:v138 count:6];
  cf = 0;
  if (!SecItemCopyMatching(query, &cf))
  {
    v78 = +[NSMutableArray array];
    v125 = +[NSMutableDictionary dictionary];
    v136 = 0u;
    v137 = 0u;
    v134 = 0u;
    v135 = 0u;
    v79 = (id)cf;
    v80 = [v79 countByEnumeratingWithState:&v134 objects:&context count:16];
    if (v80)
    {
      v81 = *(void *)v135;
      v82 = 1;
      do
      {
        for (i = 0; i != v80; i = (char *)i + 1)
        {
          if (*(void *)v135 != v81) {
            objc_enumerationMutation(v79);
          }
          v84 = [*(id *)(*((void *)&v134 + 1) + 8 * i) mutableCopy];
          v85 = [v84 objectForKeyedSubscript:kSecAttrLabel];
          IsInternalRelease = SecIsInternalRelease();
          if (v85) {
            v87 = IsInternalRelease;
          }
          else {
            v87 = 1;
          }
          if ((v87 & 1) == 0 && ([v85 isEqual:@"local"] & 1) == 0)
          {
            v88 = [v125 objectForKeyedSubscript:v85];
            if (!v88)
            {
              v88 = +[NSString stringWithFormat:@"<REDACTED-LABL-%llu>", v82];
              [v125 setObject:v88 forKeyedSubscript:v85];
              ++v82;
            }
            [v84 setObject:v88 forKeyedSubscript:kSecAttrLabel];
          }
          [v78 addObject:v84];
        }
        v80 = [v79 countByEnumeratingWithState:&v134 objects:&context count:16];
      }
      while (v80);
    }

    sub_100004B44(@"notes", v78);
  }
  v89 = cf;
  if (cf)
  {
    cf = 0;
    CFRelease(v89);
  }

  v90 = [objc_alloc((Class)NSXPCConnection) initWithMachServiceName:@"com.apple.securityuploadd" options:0];
  if (v90)
  {
    v91 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___supdProtocol];
    [v90 setRemoteObjectInterface:v91];

    [v90 resume];
    v92 = dispatch_semaphore_create(0);
    context = (CFStringRef)_NSConcreteStackBlock;
    v128 = 3221225472;
    v129 = (CFBooleanRef)sub_100004E08;
    v130 = &unk_1000084B0;
    v93 = v92;
    v131 = (__CFString *)v93;
    v94 = [v90 remoteObjectProxyWithErrorHandler:&context];
    *(void *)&v134 = _NSConcreteStackBlock;
    *((void *)&v134 + 1) = 3221225472;
    *(void *)&v135 = sub_100004E6C;
    *((void *)&v135 + 1) = &unk_1000084D8;
    v95 = v93;
    *(void *)&v136 = v95;
    [v94 getSysdiagnoseDumpWithReply:&v134];

    v96 = dispatch_time(0, 60000000000);
    if (dispatch_semaphore_wait(v95, v96)) {
      [@"\n\nError: timed out waiting for response\n" writeToStdErr];
    }
  }
  else
  {
    [@"failed to setup xpc connection for securityuploadd\n" writeToStdErr];
  }

  qword_10000C2D0 = (uint64_t)__stdoutp;
  v97 = dispatch_queue_create("general", 0);
  v98 = dispatch_group_create();
  v99 = v97;
  v100 = v98;
  *(void *)&v134 = 0;
  *((void *)&v134 + 1) = &v134;
  v135 = 0x2020000000uLL;
  v101 = dispatch_semaphore_create(0);
  v102 = dispatch_time(0, 30000000000);
  dispatch_group_enter(v100);
  context = (CFStringRef)_NSConcreteStackBlock;
  v128 = 3221225472;
  v129 = (CFBooleanRef)sub_10000595C;
  v130 = &unk_100008670;
  v133 = &v134;
  v103 = v100;
  v131 = (__CFString *)v103;
  v104 = v101;
  v132 = v104;
  v105 = objc_retainBlock(&context);
  SOSCloudKeychainGetAllObjectsFromCloud();
  dispatch_semaphore_wait(v104, v102);
  v106 = *(const void **)(*((void *)&v134 + 1) + 24);
  if (v106)
  {
    v107 = CFGetTypeID(v106);
    if (v107 == CFNullGetTypeID())
    {
      CFRelease(*(CFTypeRef *)(*((void *)&v134 + 1) + 24));
      *(void *)(*((void *)&v134 + 1) + 24) = 0;
    }
  }
  v108 = secLogObjForScope();
  if (os_log_type_enabled(v108, OS_LOG_TYPE_DEFAULT))
  {
    v109 = *(void *)(*((void *)&v134 + 1) + 24);
    LODWORD(result) = 138412290;
    *(void *)((char *)&result + 4) = v109;
    _os_log_impl((void *)&_mh_execute_header, v108, OS_LOG_TYPE_DEFAULT, "returned: %@", (uint8_t *)&result, 0xCu);
  }

  v110 = *(const __CFDictionary **)(*((void *)&v134 + 1) + 24);
  _Block_object_dispose(&v134, 8);

  if (v110)
  {
    fwrite("\nAll values in decoded form...\n", 0x1FuLL, 1uLL, (FILE *)qword_10000C2D0);
    v111 = 0;
    *(void *)&v134 = 0;
    *((void *)&v134 + 1) = &v134;
    *(void *)&v135 = 0x2020000000;
    BYTE8(v135) = 0;
    do
    {
      context = (CFStringRef)_NSConcreteStackBlock;
      v128 = 3221225472;
      v129 = (CFBooleanRef)sub_100005B10;
      v130 = &unk_100008698;
      LODWORD(v132) = v111;
      v131 = (__CFString *)&v134;
      CFDictionaryApplyFunction(v110, (CFDictionaryApplierFunction)sub_100005FD8, &context);
      v117 = *((void *)&v134 + 1);
      if (*(unsigned char *)(*((void *)&v134 + 1) + 24))
      {
        sub_100006318(qword_10000C2D0, 0, @"%@\n", v112, v113, v114, v115, v116, (char)&stru_100008D58);
        v117 = *((void *)&v134 + 1);
      }
      *(unsigned char *)(v117 + 24) = 0;
      ++v111;
    }
    while (v111 != 11);
    _Block_object_dispose(&v134, 8);
  }
  fputc(10, (FILE *)qword_10000C2D0);

  return 0;
}

void sub_100004AF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
}

void sub_100004B44(void *a1, void *a2)
{
  id v22 = a1;
  if (a2)
  {
    CFTypeID v3 = CFGetTypeID(a2);
    CFTypeID TypeID = CFArrayGetTypeID();
    id v5 = a2;
    if (v3 == TypeID)
    {
      v6 = +[NSMutableArray array];
      long long v27 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      id v5 = v5;
      id v7 = [v5 countByEnumeratingWithState:&v27 objects:v32 count:16];
      if (v7)
      {
        id v8 = v7;
        id v9 = 0;
        uint64_t v10 = *(void *)v28;
        do
        {
          v11 = 0;
          v12 = v9;
          do
          {
            if (*(void *)v28 != v10) {
              objc_enumerationMutation(v5);
            }
            id v9 = *(id *)(*((void *)&v27 + 1) + 8 * (void)v11);

            if (objc_opt_respondsToSelector())
            {
              v13 = [v9 asOneLineString];
              v14 = +[NSString stringWithFormat:@"%@: %@\n", v22, v13];
              [v6 addObject:v14];
            }
            v11 = (char *)v11 + 1;
            v12 = v9;
          }
          while (v8 != v11);
          id v8 = [v5 countByEnumeratingWithState:&v27 objects:v32 count:16];
        }
        while (v8);
      }
      [v6 sortUsingSelector:"compare:"];
      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      id v15 = v6;
      id v16 = [v15 countByEnumeratingWithState:&v23 objects:v31 count:16];
      if (v16)
      {
        id v17 = v16;
        uint64_t v18 = *(void *)v24;
        do
        {
          for (i = 0; i != v17; i = (char *)i + 1)
          {
            if (*(void *)v24 != v18) {
              objc_enumerationMutation(v15);
            }
            [*(id *)(*((void *)&v23 + 1) + 8 * i) writeToStdOut];
          }
          id v17 = [v15 countByEnumeratingWithState:&v23 objects:v31 count:16];
        }
        while (v17);
      }
    }
    else if (objc_opt_respondsToSelector())
    {
      v20 = [v5 asOneLineString];
      v21 = +[NSString stringWithFormat:@"%@: %@\n", v22, v20];
      [v21 writeToStdOut];
    }
  }
}

intptr_t sub_100004E08(uint64_t a1, uint64_t a2)
{
  CFTypeID v3 = +[NSString stringWithFormat:@"Error talking with daemon: %@\n", a2];
  [v3 writeToStdErr];

  v4 = *(NSObject **)(a1 + 32);

  return dispatch_semaphore_signal(v4);
}

intptr_t sub_100004E6C(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    CFTypeID v3 = +[NSString stringWithFormat:@"\nAnalytics sysdiagnose:\n\n%@\n", a2];
    [v3 writeToStdOut];
  }
  v4 = *(NSObject **)(a1 + 32);

  return dispatch_semaphore_signal(v4);
}

CFDataRef sub_100004ED4(CFDataRef theData)
{
  CFDataRef v1 = theData;
  if (theData)
  {
    uint64_t v26 = 0;
    long long v27 = &v26;
    uint64_t v28 = 0x2020000000;
    uint64_t v29 = 0;
    BytePtr = CFDataGetBytePtr(theData);
    CFTypeID v3 = &BytePtr[CFDataGetLength(v1)];
    uint64_t v33 = 0;
    ccder_decode_constructed_tl();
    uint64_t v32 = 0;
    v4 = (const UInt8 *)ccder_decode_tl();
    uint64_t v31 = 0;
    uint64_t v30 = 0;
    ccder_decode_uint64();
    ccder_decode_uint64();
    uint64_t v34 = 0;
    id v5 = (char *)ccder_decode_tl();
    if (CSSMOID_PKCS5_HMAC_SHA1.Length == v34
      && (v6 = v5, !memcmp(CSSMOID_PKCS5_HMAC_SHA1.Data, v5, CSSMOID_PKCS5_HMAC_SHA1.Length))
      && v6)
    {
      id v9 = (const UInt8 *)&v6[CSSMOID_PKCS5_HMAC_SHA1.Length];
      uint64_t v7 = v31;
      uint64_t v8 = v30;
    }
    else
    {
      v4 = 0;
      uint64_t v7 = 0;
      uint64_t v8 = 0;
      id v9 = 0;
    }
    if (v9 == v3)
    {
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v21 = sub_1000051B0;
      id v22 = &unk_100008500;
      long long v23 = &v26;
      uint64_t v24 = v7;
      uint64_t v25 = v8;
      uint64_t v10 = v20;
      CFDataRef v11 = CFDataCreateWithBytesNoCopy(kCFAllocatorDefault, v4, 4, kCFAllocatorNull);
      v12 = v10;
      v13 = v12;
      if (v11)
      {
        CFIndex Length = CFDataGetLength(v11);
        Mutable = CFStringCreateMutable(kCFAllocatorDefault, 2 * Length);
        id v16 = CFDataGetBytePtr(v11);
        CFIndex v17 = CFDataGetLength(v11);
        if (v17 >= 1)
        {
          do
          {
            unsigned int v18 = *v16++;
            CFStringAppendFormat(Mutable, 0, @"%02X", v18);
            --v17;
          }
          while (v17);
        }
        v21(v13, (uint64_t)Mutable);
        CFRelease(Mutable);

        CFRelease(v11);
      }
      else
      {
        v21(v12, @"(null)");
        CFRelease(@"(null)");
      }
      CFDataRef v1 = (const __CFData *)v27[3];
    }
    else
    {
      CFDataRef v1 = 0;
    }
    _Block_object_dispose(&v26, 8);
  }
  return v1;
}

void sub_100005190(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

CFStringRef sub_1000051B0(void *a1, uint64_t a2)
{
  CFStringRef result = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"<Params: iter: %zd, size: %zd, salt: %@>", a1[5], a1[6], a2);
  *(void *)(*(void *)(a1[4] + 8) + 24) = result;
  return result;
}

void sub_10000520C(uint64_t a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  ++*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  if ((*(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) & 1) != 0
    || (sub_100006318(qword_10000C2D0, 0, @"Circle name: %@, ", a4, a5, a6, a7, a8, a2),
        (*(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) & 1) != 0))
  {
    v14 = (const void *)SOSGenerationCountCopyDescription();
    sub_100006318(qword_10000C2D0, 0, @"Generation Count: %@", v15, v16, v17, v18, v19, (char)v14);
    if (v14) {
      CFRelease(v14);
    }
  }
  sub_100006318(qword_10000C2D0, 0, @"%s\n", v9, v10, v11, v12, v13, (char)"");
}

void sub_1000052E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v20 = 0;
  CFArrayRef v5 = (const __CFArray *)(*(uint64_t (**)(uint64_t, const void **))(a3 + 16))(a3, &v20);
  uint64_t v11 = qword_10000C2D0;
  if (v5)
  {
    CFArrayRef v12 = v5;
    CFArrayGetCount(v5);
    sub_100006318(v11, 0, @"%s count: %ld\n", v13, v14, v15, v16, v17, a1);
    context[0] = _NSConcreteStackBlock;
    context[1] = 3221225472;
    context[2] = sub_100005424;
    context[3] = &unk_100008648;
    context[4] = a2;
    context[5] = a1;
    v21.length = CFArrayGetCount(v12);
    v21.location = 0;
    CFArrayApplyFunction(v12, v21, (CFArrayApplierFunction)sub_10000590C, context);
    CFRelease(v12);
  }
  else
  {
    sub_100006318(qword_10000C2D0, 0, @"No %s, error: %@\n", v6, v7, v8, v9, v10, a1);
  }
  uint64_t v18 = v20;
  if (v20)
  {
    v20 = 0;
    CFRelease(v18);
  }
}

__CFArray *__cdecl sub_100005404(id a1, __CFError **a2)
{
  return (__CFArray *)_SOSCCCopyApplicantPeerInfo(a2);
}

__CFArray *__cdecl sub_10000540C(id a1, __CFError **a2)
{
  return (__CFArray *)_SOSCCCopyConcurringPeerPeerInfo(a2);
}

__CFArray *__cdecl sub_100005414(id a1, __CFError **a2)
{
  return (__CFArray *)_SOSCCCopyRetirementPeerInfo(a2);
}

__CFArray *__cdecl sub_10000541C(id a1, __CFError **a2)
{
  return (__CFArray *)_SOSCCCopyNotValidPeerPeerInfo(a2);
}

void sub_100005424(uint64_t a1, uint64_t a2)
{
  if (!a2) {
    return;
  }
  CFStringRef PeerName = (const __CFString *)SOSPeerInfoGetPeerName();
  CFStringRef PeerDeviceType = (const __CFString *)SOSPeerInfoGetPeerDeviceType();
  CFTypeRef cf2 = (CFTypeRef)SOSPeerInfoGetPeerID();
  CFDictionaryRef v6 = (const __CFDictionary *)SOSPeerInfoCopyPeerGestalt();
  CFDictionaryRef v7 = v6;
  if (v6) {
    CFDictionaryGetValue(v6, @"OSVersion");
  }
  CFStringRef v8 = &stru_100008D58;
  if (SOSPeerInfoVersionHasV2Data())
  {
    CFDictionaryRef v9 = *(const __CFDictionary **)(a2 + 80);
    if (v9)
    {
      CFStringRef Value = (const __CFString *)CFDictionaryGetValue(*(CFDictionaryRef *)(a2 + 80), @"TransportType");
      CFStringRef v8 = (const __CFString *)CFDictionaryGetValue(v9, @"DeviceID");
      CFStringRef v11 = (const __CFString *)CFDictionaryGetValue(v9, @"MachineIDKey");
    }
    else
    {
      CFStringRef Value = @"KVS";
      CFStringRef v11 = &stru_100008D58;
      CFStringRef v8 = &stru_100008D58;
    }
  }
  else
  {
    CFStringRef Value = @"KVS";
    CFStringRef v11 = &stru_100008D58;
  }
  *(void *)&long long v12 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v12 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v46 = v12;
  long long v47 = v12;
  long long v44 = v12;
  long long v45 = v12;
  long long v42 = v12;
  long long v43 = v12;
  long long v40 = v12;
  long long v41 = v12;
  *(_OWORD *)__str = v12;
  long long v39 = v12;
  if (!PeerName)
  {
    uint64_t v15 = strdup("");
    if (PeerDeviceType) {
      goto LABEL_13;
    }
LABEL_26:
    uint64_t v18 = strdup("");
    if (Value) {
      goto LABEL_16;
    }
LABEL_27:
    CFRange v21 = strdup("");
    if (v8) {
      goto LABEL_19;
    }
    goto LABEL_28;
  }
  CFRetain(PeerName);
  CFIndex Length = CFStringGetLength(PeerName);
  CFIndex v14 = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u) + 1;
  uint64_t v15 = (char *)malloc_type_malloc(v14, 0x5ECC0363uLL);
  if (!CFStringGetCString(PeerName, v15, v14, 0x8000100u)) {
    *uint64_t v15 = 0;
  }
  CFRelease(PeerName);
  if (!PeerDeviceType) {
    goto LABEL_26;
  }
LABEL_13:
  CFRetain(PeerDeviceType);
  CFIndex v16 = CFStringGetLength(PeerDeviceType);
  CFIndex v17 = CFStringGetMaximumSizeForEncoding(v16, 0x8000100u) + 1;
  uint64_t v18 = (char *)malloc_type_malloc(v17, 0x5ECC0363uLL);
  if (!CFStringGetCString(PeerDeviceType, v18, v17, 0x8000100u)) {
    *uint64_t v18 = 0;
  }
  CFRelease(PeerDeviceType);
  if (!Value) {
    goto LABEL_27;
  }
LABEL_16:
  CFRetain(Value);
  CFIndex v19 = CFStringGetLength(Value);
  CFIndex v20 = CFStringGetMaximumSizeForEncoding(v19, 0x8000100u) + 1;
  CFRange v21 = (char *)malloc_type_malloc(v20, 0x5ECC0363uLL);
  if (!CFStringGetCString(Value, v21, v20, 0x8000100u)) {
    char *v21 = 0;
  }
  CFRelease(Value);
  if (v8)
  {
LABEL_19:
    CFRetain(v8);
    CFIndex v22 = CFStringGetLength(v8);
    CFIndex v23 = CFStringGetMaximumSizeForEncoding(v22, 0x8000100u) + 1;
    uint64_t v24 = (char *)malloc_type_malloc(v23, 0x5ECC0363uLL);
    if (!CFStringGetCString(v8, v24, v23, 0x8000100u)) {
      *uint64_t v24 = 0;
    }
    CFRelease(v8);
    if (v11) {
      goto LABEL_22;
    }
    goto LABEL_29;
  }
LABEL_28:
  uint64_t v24 = strdup("");
  if (v11)
  {
LABEL_22:
    CFRetain(v11);
    CFIndex v25 = CFStringGetLength(v11);
    CFIndex v26 = CFStringGetMaximumSizeForEncoding(v25, 0x8000100u) + 1;
    long long v27 = (char *)malloc_type_malloc(v26, 0x5ECC0363uLL);
    if (!CFStringGetCString(v11, v27, v26, 0x8000100u)) {
      *long long v27 = 0;
    }
    CFRelease(v11);
    goto LABEL_30;
  }
LABEL_29:
  long long v27 = strdup("");
LABEL_30:
  CFTypeRef v28 = *(CFTypeRef *)(a1 + 32);
  if (cf2 && v28) {
    BOOL v29 = CFEqual(v28, cf2) != 0;
  }
  else {
    BOOL v29 = v28 == cf2;
  }
  if (v29) {
    uint64_t v30 = "me>";
  }
  else {
    uint64_t v30 = "   ";
  }
  snprintf(__str, 0xA0uLL, "%s %s: %-16s dev:%-16s trn:%-16s devid:%-36s mid: %-36s", v30, *(const char **)(a1 + 40), v15, v18, v21, v24, v27);
  free(v15);
  free(v18);
  free(v21);
  free(v24);
  free(v27);
  CFStringRef v31 = CFStringCreateWithCString(0, __str, 0x8000100u);
  SOSPeerInfoGetPeerID();
  SOSPeerInfoGetVersion();
  SOSPeerInfoSupportsCKKSForAll();
  sub_100006318(qword_10000C2D0, 0, @"%@ pid:%@ V%d %@ OS:%@\n", v32, v33, v34, v35, v36, (char)v31);
  CFRelease(v31);
  if (v7) {
    CFRelease(v7);
  }
}

__CFArray *__cdecl sub_100005904(id a1, __CFError **a2)
{
  return (__CFArray *)_SOSCCCopyValidPeerPeerInfo(a2);
}

uint64_t sub_10000590C(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 16))(a2, a1);
}

void sub_100005924(id a1, __CFString *a2)
{
  sub_100006318(qword_10000C2D0, 0, @"%@\n", v2, v3, v4, v5, v6, (char)a2);
}

intptr_t sub_10000595C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = secLogObjForScope();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    int v12 = 138412290;
    uint64_t v13 = a2;
    _os_log_debug_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "SOSCloudKeychainGetObjectsFromCloud returned: %@", (uint8_t *)&v12, 0xCu);
  }

  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a2;
  CFDictionaryRef v7 = *(const void **)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  if (v7) {
    CFRetain(v7);
  }
  if (a3)
  {
    CFStringRef v8 = secLogObjForScope();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412290;
      uint64_t v13 = a3;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "SOSCloudKeychainGetObjectsFromCloud returned error: %@", (uint8_t *)&v12, 0xCu);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  CFDictionaryRef v9 = secLogObjForScope();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v11 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    int v12 = 138412290;
    uint64_t v13 = v11;
    _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "SOSCloudKeychainGetObjectsFromCloud block exit: %@", (uint8_t *)&v12, 0xCu);
  }

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void sub_100005B10(uint64_t a1, char a2, const void *a3)
{
  int KeyType = SOSKVSKeyGetKeyType();
  if (KeyType != *(_DWORD *)(a1 + 40)) {
    return;
  }
  switch(KeyType)
  {
    case 0:
      CFDataRef v86 = 0;
      if (!a3) {
        goto LABEL_27;
      }
      CFTypeID v19 = CFGetTypeID(a3);
      if (v19 != CFDataGetTypeID()) {
        goto LABEL_25;
      }
      uint64_t valuePtr = 5;
      CFDataRef v20 = CFNumberCreate(kCFAllocatorDefault, kCFNumberCFIndexType, &valuePtr);
      CFDictionaryRef v28 = sub_100005FF4(kCFAllocatorDefault, v21, v22, v23, v24, v25, v26, v27, @"SyncD", @"SyncD");
      uint64_t v29 = SOSCircleCreateFromData();
      sub_100006318(qword_10000C2D0, v28, @"%@: %@\n", v30, v31, v32, v33, v34, a2);
      if (!v29) {
        goto LABEL_48;
      }
      uint64_t v35 = (const void *)v29;
      goto LABEL_47;
    case 1:
    case 4:
      if (!a3) {
        goto LABEL_27;
      }
      CFTypeID v12 = CFGetTypeID(a3);
      if (v12 != CFDataGetTypeID()) {
        goto LABEL_25;
      }
      SecOTRPacketTypeString();
      uint64_t v13 = qword_10000C2D0;
      CFDataGetLength((CFDataRef)a3);
      sub_100006318(v13, 0, @"%@: %s: %ld\n", v14, v15, v16, v17, v18, a2);
      goto LABEL_29;
    case 2:
      if (!a3) {
        goto LABEL_27;
      }
      CFTypeID v36 = CFGetTypeID(a3);
      if (v36 != CFDataGetTypeID()) {
        goto LABEL_25;
      }
      CFDataRef v37 = sub_100004ED4((CFDataRef)a3);
      uint64_t v38 = qword_10000C2D0;
      if (!v37) {
        goto LABEL_28;
      }
      sub_100006318(qword_10000C2D0, 0, @"%@: %@\n", v7, v8, v9, v10, v11, a2);
      CFDataRef v39 = v37;
      goto LABEL_52;
    case 8:
      if (!a3) {
        goto LABEL_27;
      }
      CFTypeID v40 = CFGetTypeID(a3);
      if (v40 != CFDataGetTypeID()) {
        goto LABEL_25;
      }
      CFDataRef v86 = 0;
      BytePtr = CFDataGetBytePtr((CFDataRef)a3);
      CFDataRef v42 = CFDataCreate(kCFAllocatorDefault, BytePtr, 18);
      CFIndex v43 = CFDataGetLength((CFDataRef)a3) - 18;
      long long v44 = CFDataGetBytePtr((CFDataRef)a3);
      CFDataRef v45 = CFDataCreate(kCFAllocatorDefault, v44 + 18, v43);
      CFStringRef v46 = CFStringCreateFromExternalRepresentation(kCFAllocatorDefault, v42, 0x8000100u);
      long long v47 = (const void *)SOSCircleCreateFromData();
      if (v47)
      {
        uint64_t valuePtr = 5;
        CFNumberRef v48 = CFNumberCreate(kCFAllocatorDefault, kCFNumberCFIndexType, &valuePtr);
        CFDictionaryRef v56 = sub_100005FF4(kCFAllocatorDefault, v49, v50, v51, v52, v53, v54, v55, @"SyncD", @"SyncD");
        sub_100006318(qword_10000C2D0, v56, @"%@: %@: %@\n", v57, v58, v59, v60, v61, a2);
        if (v48) {
          CFRelease(v48);
        }
        if (v56) {
          CFRelease(v56);
        }
      }
      else
      {
        uint64_t v74 = qword_10000C2D0;
        sub_1000060E8(v45);
        sub_100006318(v74, 0, @"%@: %@\n", v75, v76, v77, v78, v79, a2);
      }
      if (v46) {
        CFRelease(v46);
      }
      if (v45) {
        CFRelease(v45);
      }
      if (v47) {
        CFRelease(v47);
      }
      if (v42) {
        CFRelease(v42);
      }
      CFDataRef v39 = v86;
      if (!v86) {
        goto LABEL_29;
      }
      CFDataRef v86 = 0;
      goto LABEL_52;
    case 9:
      if (!a3)
      {
LABEL_27:
        uint64_t v38 = qword_10000C2D0;
LABEL_28:
        sub_100006318(v38, 0, @"%@: %@\n", v7, v8, v9, v10, v11, a2);
        goto LABEL_29;
      }
      CFTypeID v62 = CFGetTypeID(a3);
      if (v62 != CFDataGetTypeID())
      {
LABEL_25:
        uint64_t v38 = qword_10000C2D0;
        goto LABEL_28;
      }
      v63 = CFDataGetBytePtr((CFDataRef)a3);
      CFDataRef v20 = CFDataCreate(kCFAllocatorDefault, v63, 18);
      CFIndex v64 = CFDataGetLength((CFDataRef)a3) - 18;
      v65 = CFDataGetBytePtr((CFDataRef)a3);
      CFDataRef v66 = CFDataCreate(kCFAllocatorDefault, v65 + 18, v64);
      CFStringRef v67 = CFStringCreateFromExternalRepresentation(kCFAllocatorDefault, v20, 0x8000100u);
      CFDictionaryRef v28 = sub_100004ED4(v66);
      uint64_t v73 = qword_10000C2D0;
      if (v28)
      {
        sub_100006318(qword_10000C2D0, 0, @"%@: %@: %@\n", v68, v69, v70, v71, v72, a2);
      }
      else
      {
        sub_1000060E8((const __CFData *)a3);
        sub_100006318(v73, 0, @"%@: %@\n", v80, v81, v82, v83, v84, a2);
      }
      if (v67) {
        CFRelease(v67);
      }
      if (v66)
      {
        uint64_t v35 = v66;
LABEL_47:
        CFRelease(v35);
      }
LABEL_48:
      if (v20) {
        CFRelease(v20);
      }
      if (v28)
      {
        CFDataRef v39 = v28;
LABEL_52:
        CFRelease(v39);
      }
LABEL_29:
      *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
      return;
    default:
      goto LABEL_25;
  }
}

uint64_t sub_100005FD8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a3 + 16))(a3, a1, a2);
}

CFDictionaryRef sub_100005FF4(CFAllocatorRef allocator, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  int v22 = &a10;
  unint64_t v11 = 0;
  if (a9)
  {
    do
    {
      v11 += 2;
      CFTypeID v12 = v22;
      v22 += 2;
    }
    while (v12[1]);
  }
  unint64_t v13 = v11 >> 1;
  int v23 = (const void **)&a9;
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(allocator, v11 >> 1, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (!Mutable) {
    return 0;
  }
  uint64_t v15 = Mutable;
  if (v11)
  {
    do
    {
      uint64_t v16 = v23;
      uint64_t v17 = *v23;
      v23 += 2;
      CFNullRef v18 = (const __CFNull *)v16[1];
      if (v18) {
        CFNullRef v19 = v18;
      }
      else {
        CFNullRef v19 = kCFNull;
      }
      CFDictionarySetValue(v15, v17, v19);
      --v13;
    }
    while (v13);
  }
  CFDictionaryRef Copy = CFDictionaryCreateCopy(allocator, v15);
  CFRelease(v15);
  return Copy;
}

uint64_t sub_1000060E8(const __CFData *a1)
{
  uint64_t v19 = 0;
  CFDataRef v20 = &v19;
  uint64_t v21 = 0x2020000000;
  uint64_t v22 = 0;
  BytePtr = CFDataGetBytePtr(a1);
  CFIndex Length = CFDataGetLength(a1);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  uint64_t v16 = sub_1000062C4;
  uint64_t v17 = &unk_1000086C0;
  CFNullRef v18 = &v19;
  uint64_t v4 = v15;
  CFDataRef v5 = CFDataCreateWithBytesNoCopy(kCFAllocatorDefault, BytePtr, Length, kCFAllocatorNull);
  uint64_t v6 = v4;
  uint64_t v7 = v6;
  if (v5)
  {
    CFIndex v8 = CFDataGetLength(v5);
    CFMutableDictionaryRef Mutable = CFStringCreateMutable(kCFAllocatorDefault, 2 * v8);
    uint64_t v10 = CFDataGetBytePtr(v5);
    CFIndex v11 = CFDataGetLength(v5);
    if (v11 >= 1)
    {
      do
      {
        unsigned int v12 = *v10++;
        CFStringAppendFormat(Mutable, 0, @"%02X", v12);
        --v11;
      }
      while (v11);
    }
    v16((uint64_t)v7, (uint64_t)Mutable);
    CFRelease(Mutable);

    CFRelease(v5);
  }
  else
  {
    v16((uint64_t)v6, @"(null)");
    CFRelease(@"(null)");
  }
  uint64_t v13 = v20[3];
  _Block_object_dispose(&v19, 8);
  return v13;
}

void sub_1000062A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

CFStringRef sub_1000062C4(uint64_t a1, uint64_t a2)
{
  CFStringRef result = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"%@", a2);
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

void sub_100006318(uint64_t a1, const __CFDictionary *a2, const __CFString *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  v15[5] = &a9;
  CFStringRef v10 = CFStringCreateWithFormatAndArguments(kCFAllocatorDefault, a2, a3, &a9);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 0x40000000;
  void v15[2] = sub_1000064C8;
  v15[3] = &unk_100008748;
  v15[4] = a1;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 0x40000000;
  uint64_t v17 = sub_100006558;
  CFNullRef v18 = &unk_100008798;
  uint64_t v19 = v15;
  CStringPtr = CFStringGetCStringPtr(v10, 0x8000100u);
  if (CStringPtr)
  {
    unsigned int v12 = CStringPtr;
    size_t v13 = strlen(CStringPtr);
    ((void (*)(void *, const char *, size_t))v17)(v16, v12, v13);
  }
  else
  {
    CFIndex usedBufLen = 0;
    CFIndex Length = CFStringGetLength(v10);
    v22.location = 0;
    v22.length = Length;
    CFStringGetBytes(v10, v22, 0x8000100u, 0, 0, 0, 0, &usedBufLen);
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 0x40000000;
    void v20[2] = sub_1000064D8;
    v20[3] = &unk_100008770;
    v20[6] = 0;
    v20[7] = Length;
    v20[8] = usedBufLen;
    v20[4] = v16;
    v20[5] = v10;
    sub_100006568(usedBufLen + 1, (uint64_t)v20);
  }
  CFRelease(v10);
}

uint64_t sub_1000064C8(uint64_t a1, char *a2)
{
  return fputs(a2, *(FILE **)(a1 + 32));
}

uint64_t sub_1000064D8(uint64_t result, int a2, UInt8 *buffer)
{
  if (buffer)
  {
    uint64_t v4 = result;
    CFStringRef v5 = *(const __CFString **)(result + 40);
    CFRange v8 = *(CFRange *)(v4 + 48);
    CFIndex v6 = *(void *)(v4 + 64);
    CFIndex usedBufLen = 0xAAAAAAAAAAAAAAAALL;
    CFStringGetBytes(v5, v8, 0x8000100u, 0, 0, buffer, v6, &usedBufLen);
    buffer[usedBufLen] = 0;
    return (*(uint64_t (**)(void))(*(void *)(v4 + 32) + 16))();
  }
  return result;
}

uint64_t sub_100006558(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100006568(size_t size, uint64_t a2)
{
  if (size)
  {
    if (size > 0x800)
    {
      CFStringRef v5 = malloc_type_malloc(size, 0x9C1A2F70uLL);
      (*(void (**)(uint64_t, size_t, void *))(a2 + 16))(a2, size, v5);
      if (v5)
      {
        free(v5);
      }
    }
    else
    {
      __chkstk_darwin();
      memset((char *)&v6 - ((size + 15) & 0xFFFFFFFFFFFFFFF0), 170, size);
      (*(void (**)(uint64_t, size_t, char *))(a2 + 16))(a2, size, (char *)&v6 - ((size + 15) & 0xFFFFFFFFFFFFFFF0));
    }
  }
  else
  {
    uint64_t v4 = *(void (**)(uint64_t, void, void))(a2 + 16);
    v4(a2, 0, 0);
  }
}

void CFArrayApplyFunction(CFArrayRef theArray, CFRange range, CFArrayApplierFunction applier, void *context)
{
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return _CFArrayGetCount(theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return _CFArrayGetTypeID();
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return _CFDataCreate(allocator, bytes, length);
}

CFDataRef CFDataCreateWithBytesNoCopy(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return _CFDataCreateWithBytesNoCopy(allocator, bytes, length, bytesDeallocator);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return _CFDataGetBytePtr(theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return _CFDataGetLength(theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return _CFDataGetTypeID();
}

void CFDictionaryApplyFunction(CFDictionaryRef theDict, CFDictionaryApplierFunction applier, void *context)
{
}

CFDictionaryRef CFDictionaryCreateCopy(CFAllocatorRef allocator, CFDictionaryRef theDict)
{
  return _CFDictionaryCreateCopy(allocator, theDict);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreateMutable(allocator, capacity, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryGetValue(theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return _CFEqual(cf1, cf2);
}

CFIndex CFErrorGetCode(CFErrorRef err)
{
  return _CFErrorGetCode(err);
}

CFErrorDomain CFErrorGetDomain(CFErrorRef err)
{
  return _CFErrorGetDomain(err);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

CFTypeID CFNullGetTypeID(void)
{
  return _CFNullGetTypeID();
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return _CFNumberCreate(allocator, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return _CFRetain(cf);
}

void CFStringAppendFormat(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
}

CFStringRef CFStringCreateFromExternalRepresentation(CFAllocatorRef alloc, CFDataRef data, CFStringEncoding encoding)
{
  return _CFStringCreateFromExternalRepresentation(alloc, data, encoding);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return _CFStringCreateMutable(alloc, maxLength);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return _CFStringCreateWithCString(alloc, cStr, encoding);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return _CFStringCreateWithFormat(alloc, formatOptions, format);
}

CFStringRef CFStringCreateWithFormatAndArguments(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, va_list arguments)
{
  return _CFStringCreateWithFormatAndArguments(alloc, formatOptions, format, arguments);
}

CFIndex CFStringGetBytes(CFStringRef theString, CFRange range, CFStringEncoding encoding, UInt8 lossByte, Boolean isExternalRepresentation, UInt8 *buffer, CFIndex maxBufLen, CFIndex *usedBufLen)
{
  return _CFStringGetBytes(theString, range, encoding, lossByte, isExternalRepresentation, buffer, maxBufLen, usedBufLen);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return _CFStringGetCString(theString, buffer, bufferSize, encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return _CFStringGetCStringPtr(theString, encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return _CFStringGetLength(theString);
}

CFIndex CFStringGetMaximumSizeForEncoding(CFIndex length, CFStringEncoding encoding)
{
  return _CFStringGetMaximumSizeForEncoding(length, encoding);
}

uint64_t SOSCCCopyGenerationPeerInfo()
{
  return _SOSCCCopyGenerationPeerInfo();
}

uint64_t SOSCCCopyMyPeerInfo()
{
  return _SOSCCCopyMyPeerInfo();
}

uint64_t SOSCCForEachEngineStateAsString()
{
  return _SOSCCForEachEngineStateAsString();
}

uint64_t SOSCCGetLastDepartureReason()
{
  return _SOSCCGetLastDepartureReason();
}

uint64_t SOSCCThisDeviceIsInCircle()
{
  return _SOSCCThisDeviceIsInCircle();
}

uint64_t SOSCCValidateUserPublic()
{
  return _SOSCCValidateUserPublic();
}

uint64_t SOSCircleCreateFromData()
{
  return _SOSCircleCreateFromData();
}

uint64_t SOSCloudKeychainGetAllObjectsFromCloud()
{
  return _SOSCloudKeychainGetAllObjectsFromCloud();
}

uint64_t SOSGenerationCountCopyDescription()
{
  return _SOSGenerationCountCopyDescription();
}

uint64_t SOSKVSKeyGetKeyType()
{
  return _SOSKVSKeyGetKeyType();
}

uint64_t SOSPeerInfoCopyPeerGestalt()
{
  return _SOSPeerInfoCopyPeerGestalt();
}

uint64_t SOSPeerInfoGetPeerDeviceType()
{
  return _SOSPeerInfoGetPeerDeviceType();
}

uint64_t SOSPeerInfoGetPeerID()
{
  return _SOSPeerInfoGetPeerID();
}

uint64_t SOSPeerInfoGetPeerName()
{
  return _SOSPeerInfoGetPeerName();
}

uint64_t SOSPeerInfoGetVersion()
{
  return _SOSPeerInfoGetVersion();
}

uint64_t SOSPeerInfoSupportsCKKSForAll()
{
  return _SOSPeerInfoSupportsCKKSForAll();
}

uint64_t SOSPeerInfoVersionHasV2Data()
{
  return _SOSPeerInfoVersionHasV2Data();
}

uint64_t SecIsInternalRelease()
{
  return _SecIsInternalRelease();
}

OSStatus SecItemCopyMatching(CFDictionaryRef query, CFTypeRef *result)
{
  return _SecItemCopyMatching(query, result);
}

uint64_t SecOTRPacketTypeString()
{
  return _SecOTRPacketTypeString();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t ccder_decode_constructed_tl()
{
  return _ccder_decode_constructed_tl();
}

uint64_t ccder_decode_tl()
{
  return _ccder_decode_tl();
}

uint64_t ccder_decode_uint64()
{
  return _ccder_decode_uint64();
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

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
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

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

int fputc(int a1, FILE *a2)
{
  return _fputc(a1, a2);
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

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return _memcmp(__s1, __s2, __n);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return _memset(__b, __c, __len);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
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

void objc_enumerationMutation(id obj)
{
}

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

int puts(const char *a1)
{
  return _puts(a1);
}

uint64_t secLogObjForScope()
{
  return _secLogObjForScope();
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return _snprintf(__str, __size, __format);
}

char *__cdecl strdup(const char *__s1)
{
  return _strdup(__s1);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_asOneLineString(void *a1, const char *a2, ...)
{
  return [a1 asOneLineString];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_writeToStdErr(void *a1, const char *a2, ...)
{
  return [a1 writeToStdErr];
}

id objc_msgSend_writeToStdOut(void *a1, const char *a2, ...)
{
  return [a1 writeToStdOut];
}