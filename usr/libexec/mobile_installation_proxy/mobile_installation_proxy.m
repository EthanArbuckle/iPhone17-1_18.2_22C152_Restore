uint64_t start()
{
  qword_1000107C0 = MOLogOpen();
  if (!qword_1000107C0) {
    syslog(3, "Failed to set up logging");
  }
  if (lockdown_checkin_xpc())
  {
    if (!qword_1000107C0 || *(int *)(qword_1000107C0 + 44) >= 3) {
      MOLogWrite();
    }
    return 1;
  }
  else
  {
    CFRunLoopRun();
    return 0;
  }
}

void sub_100003D74(id a1, _lockdown_connection *a2, __CFDictionary *a3)
{
  uint64_t v6 = 0;
  v4 = a2;
  Value = CFDictionaryGetValue(a3, kLockdownCheckinClientNameKey);
  CFTypeRef cf = 0;
  lockdown_receive_message();
  if (!qword_1000107C0 || *(int *)(qword_1000107C0 + 44) >= 3) {
    MOLogWrite();
  }
  lockdown_disconnect();
}

void sub_1000050C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34)
{
}

void sub_100005104(uint64_t a1, const void *a2)
{
  if (!*(_DWORD *)(a1 + 16))
  {
    Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    if (Mutable)
    {
      v4 = Mutable;
      if (a2) {
        CFDictionarySetValue(Mutable, @"Error", a2);
      }
      if (lockdown_send_message() && (!qword_1000107C0 || *(int *)(qword_1000107C0 + 44) >= 3)) {
        MOLogWrite();
      }
      CFRelease(v4);
    }
    else if (!qword_1000107C0 || *(int *)(qword_1000107C0 + 44) >= 3)
    {
      MOLogWrite();
    }
  }
}

intptr_t sub_100005230(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t sub_100005238(uint64_t a1, const __CFDictionary *a2)
{
  return sub_100005248(a2, *(void *)(a1 + 32));
}

uint64_t sub_100005248(const __CFDictionary *a1, uint64_t a2)
{
  if (a1)
  {
    if (CFDictionaryContainsKey(a1, @"Error"))
    {
      *(_DWORD *)(a2 + 16) = 1;
      goto LABEL_5;
    }
    if (a2)
    {
LABEL_5:
      uint64_t result = lockdown_send_message();
      if (!result) {
        return result;
      }
    }
  }
  uint64_t result = qword_1000107C0;
  if (!qword_1000107C0 || *(int *)(qword_1000107C0 + 44) >= 3)
  {
    return MOLogWrite();
  }
  return result;
}

intptr_t sub_1000052EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!a3) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100005308(uint64_t a1)
{
  Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (Mutable)
  {
    v3 = Mutable;
    CFDictionarySetValue(Mutable, @"Status", @"Complete");
    if ((!a1 || lockdown_send_message()) && (!qword_1000107C0 || *(int *)(qword_1000107C0 + 44) >= 3)) {
      MOLogWrite();
    }
    CFRelease(v3);
  }
  else if (!qword_1000107C0 || *(int *)(qword_1000107C0 + 44) >= 3)
  {
    MOLogWrite();
  }
}

void sub_100005418(id a1)
{
  qword_1000107C8 = (uint64_t)sub_100005438();
}

CFStringRef sub_100005438()
{
  uint64_t v0 = sysconf(71);
  if (v0 == -1)
  {
    int v5 = *__error();
    if (!qword_1000107C0 || *(int *)(qword_1000107C0 + 44) >= 3)
    {
      strerror(v5);
      MOLogWrite();
    }
    return 0;
  }
  else
  {
    size_t v1 = v0;
    v2 = (char *)&v7 - ((__chkstk_darwin() + 15) & 0xFFFFFFFFFFFFFFF0);
    bzero(v10, 0x400uLL);
    memset(&v9, 0, sizeof(v9));
    v8 = 0;
    int v3 = getpwnam_r("mobile", &v9, v2, v1, &v8);
    if (v3)
    {
      if (!qword_1000107C0 || *(int *)(qword_1000107C0 + 44) >= 3)
      {
        strerror(v3);
        MOLogWrite();
      }
      return 0;
    }
    if (!v8)
    {
      if (!qword_1000107C0 || *(int *)(qword_1000107C0 + 44) >= 3) {
        MOLogWrite();
      }
      return 0;
    }
    if (!realpath_DARWIN_EXTSN(v9.pw_dir, v10))
    {
      if (!qword_1000107C0 || *(int *)(qword_1000107C0 + 44) >= 3)
      {
        uint64_t v6 = __error();
        strerror(*v6);
        MOLogWrite();
      }
      return 0;
    }
    return CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"%s/Media", v10);
  }
}

uint64_t sub_100005688()
{
  uint64_t result = qword_1000107C0;
  if (!qword_1000107C0 || *(int *)(qword_1000107C0 + 44) >= 3) {
    return MOLogWrite();
  }
  return result;
}

intptr_t sub_1000056BC(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t sub_1000056C4(uint64_t a1, const __CFDictionary *a2)
{
  return sub_100005248(a2, *(void *)(a1 + 32));
}

void sub_1000056D4(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = a2;
  id v8 = a3;
  if (![v7 isEqualToString:@"WaitForStorageDeletion"])
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
      sub_1000088F0((uint64_t)v7, a1);
    }
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
      sub_100008864((uint64_t)v7, (uint64_t)v8);
    }
LABEL_10:
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    *a4 = 1;
    goto LABEL_11;
  }
  id v9 = v8;
  if ([v9 BOOLValue]) {
    [*(id *)(a1 + 32) setWaitForDeletion:1];
  }

LABEL_11:
}

void sub_1000057CC(void *a1, void *a2, void *a3)
{
  int v5 = a3;
  id v6 = a1;
  id v7 = v6;
  if (v6)
  {
    v93 = a2;
    if ([v6 count] == (id)1
      && ([v7 objectForKeyedSubscript:@"com.apple.mobile_installation.metadata"],
          id v8 = objc_claimAutoreleasedReturnValue(),
          unsigned __int8 v9 = [v8 BOOLValue],
          v8,
          (v9 & 1) != 0))
    {
      int v10 = 0;
      BOOL v11 = 0;
      BOOL v95 = 0;
      BOOL v97 = 0;
      BOOL v99 = 0;
    }
    else
    {
      v12 = [v7 objectForKeyedSubscript:@"ShowPlaceholders"];

      BOOL v99 = v12 != 0;
      v13 = [v7 objectForKeyedSubscript:@"ShowLaunchProhibitedApps"];

      BOOL v97 = v13 != 0;
      v14 = [v7 objectForKeyedSubscript:@"ShowAppClips"];

      BOOL v95 = v14 != 0;
      v15 = [v7 objectForKeyedSubscript:@"ShowSwiftPlaygroundsApps"];

      BOOL v11 = v15 != 0;
      int v10 = 1;
    }
    v16 = [v7 objectForKeyedSubscript:@"Attribute"];
    v17 = sub_1000061DC(v16);

    int v90 = v11;
    if (v17)
    {
      v18 = +[NSSet setWithArray:v17];
    }
    else
    {
      v18 = 0;
    }
    v21 = [v7 objectForKeyedSubscript:@"BundleIDs"];
    v22 = sub_1000061DC(v21);

    if (v22)
    {
      v20 = +[NSSet setWithArray:v22];
    }
    else
    {
      v20 = 0;
    }
    v23 = v7;
    v24 = [v7 objectForKeyedSubscript:@"ReturnAttributes"];
    v25 = sub_1000061DC(v24);

    if (v25)
    {
      v19 = +[NSSet setWithArray:v25];
    }
    else
    {
      v19 = 0;
    }

    if (!v10)
    {
      v45 = v23;
      id v46 = v18;
LABEL_92:
      v77 = [v45 objectForKeyedSubscript:@"com.apple.mobile_installation.metadata" v83];
      unsigned int v78 = [v77 BOOLValue];

      if (v78)
      {
        v79 = +[LSApplicationWorkspace defaultWorkspace];
        id v101 = 0;
        id v102 = 0;
        [v79 getKnowledgeUUID:&v102 andSequenceNumber:&v101];
        id v80 = v102;
        id v81 = v101;

        v112[0] = @"com.apple.mobile_installation.metadata";
        v111[0] = kCFBundleIdentifierKey;
        v111[1] = @"CacheGUID";
        v82 = [v80 UUIDString];
        v111[2] = @"SequenceNumber";
        v112[1] = v82;
        v112[2] = v81;
        v5[2](v5, @"com.apple.mobile_installation.metadata", +[NSDictionary dictionaryWithObjects:v112 forKeys:v111 count:3]);
      }
      goto LABEL_94;
    }
    BOOL v86 = v99;
    LOBYTE(v87) = v97;
    HIDWORD(v87) = v95;
    id v7 = v23;
    a2 = v93;
  }
  else
  {
    BOOL v86 = 0;
    uint64_t v87 = 0;
    int v90 = 0;
    v19 = 0;
    v20 = 0;
    v18 = 0;
  }
  id v26 = [v7 objectForKeyedSubscript:@"ApplicationType"];
  id v98 = v20;
  id v27 = v18;
  id v28 = v19;
  id v29 = a2;
  v94 = v5;
  if (qword_1000107E0 != -1) {
    dispatch_once(&qword_1000107E0, &stru_10000C578);
  }
  id v30 = (id)qword_1000107D8;
  if (qword_100010808 != -1) {
    dispatch_once(&qword_100010808, &stru_10000C6B0);
  }
  v96 = v26;
  v92 = v7;
  v88 = v5;
  id v31 = (id)qword_100010800;
  if (v28)
  {
    id v32 = v28;
    unsigned int v33 = [v32 containsObject:@"SharedDirSize"];
    if ([v32 containsObject:@"StaticDiskUsage"]) {
      int v34 = 4;
    }
    else {
      int v34 = 0;
    }
    int v35 = v34 | v33;
    if ([v32 containsObject:@"DynamicDiskUsage"]) {
      int v36 = 2;
    }
    else {
      int v36 = 0;
    }
    if ([v32 containsObject:@"ApplicationSINF"]) {
      int v37 = 8;
    }
    else {
      int v37 = 0;
    }
    int v38 = v35 | v36 | v37;
    if ([v32 containsObject:@"iTunesMetadata"]) {
      int v39 = 16;
    }
    else {
      int v39 = 0;
    }
    if ([v32 containsObject:@"iTunesArtwork"]) {
      int v40 = 32;
    }
    else {
      int v40 = 0;
    }
    int v41 = v39 | v40;
    unsigned int v42 = [v32 containsObject:@"GeoJSON"];

    if (v42) {
      int v43 = 64;
    }
    else {
      int v43 = 0;
    }
    int v44 = v38 | v41 | v43;
  }
  else
  {
    int v44 = 0;
  }
  int v85 = v44;
  id v47 = v30;
  id v48 = v31;
  id v46 = v27;
  id v49 = v28;
  v100 = v49;
  id v91 = v29;
  if (v28)
  {
    v50 = v49;
    v89 = v46;
    id v28 = +[NSMutableSet setWithCapacity:0];
    v51 = +[NSMutableSet setWithCapacity:0];
    long long v107 = 0u;
    long long v108 = 0u;
    long long v109 = 0u;
    long long v110 = 0u;
    id v52 = v50;
    id v53 = [v52 countByEnumeratingWithState:&v107 objects:v114 count:16];
    if (v53)
    {
      id v54 = v53;
      uint64_t v55 = *(void *)v108;
      do
      {
        for (i = 0; i != v54; i = (char *)i + 1)
        {
          if (*(void *)v108 != v55) {
            objc_enumerationMutation(v52);
          }
          uint64_t v57 = *(void *)(*((void *)&v107 + 1) + 8 * i);
          unsigned int v58 = [v47 containsObject:v57];
          unsigned int v59 = [v48 containsObject:v57];
          if ((v58 & 1) != 0 || (v60 = v28, v59))
          {
            v60 = v51;
            if ((v58 ^ 1 | v59)) {
              continue;
            }
          }
          [v60 addObject:v57];
        }
        id v54 = [v52 countByEnumeratingWithState:&v107 objects:v114 count:16];
      }
      while (v54);
    }

    id v46 = v89;
    if (v89)
    {
      long long v105 = 0u;
      long long v106 = 0u;
      long long v103 = 0u;
      long long v104 = 0u;
      id v61 = v89;
      id v62 = [v61 countByEnumeratingWithState:&v103 objects:v113 count:16];
      if (v62)
      {
        id v63 = v62;
        uint64_t v64 = *(void *)v104;
        do
        {
          for (j = 0; j != v63; j = (char *)j + 1)
          {
            if (*(void *)v104 != v64) {
              objc_enumerationMutation(v61);
            }
            uint64_t v66 = *(void *)(*((void *)&v103 + 1) + 8 * (void)j);
            unsigned int v67 = [v47 containsObject:v66];
            unsigned int v68 = [v48 containsObject:v66];
            if ((v67 & 1) != 0 || (v69 = v28, v68))
            {
              v69 = v51;
              if ((v67 ^ 1 | v68)) {
                continue;
              }
            }
            [v69 addObject:v66];
          }
          id v63 = [v61 countByEnumeratingWithState:&v103 objects:v113 count:16];
        }
        while (v63);
      }

      id v46 = v89;
    }
    id v29 = v91;
  }
  else
  {
    v51 = 0;
  }
  id v70 = v51;
  id v71 = v28;

  id v72 = v70;
  id v73 = v71;
  v45 = v92;
  if (([v29 isEqualToString:@"iTunes"] & 1) != 0
    || [v29 isEqualToString:@"AMPDevicesAgent"])
  {
    [v73 removeObject:@"CFBundleBuild"];
  }
  [v73 removeObject:@"UINewsstandApp"];
  v74 = v96;
  if (v73 && [v73 count])
  {
    if (MGGetBoolAnswer())
    {
      if (qword_1000107C0 && *(int *)(qword_1000107C0 + 44) < 5) {
        goto LABEL_83;
      }
LABEL_82:
      id v83 = v29;
      id v84 = v73;
      MOLogWrite();
      goto LABEL_83;
    }
    if (qword_1000107C0 && *(int *)(qword_1000107C0 + 44) > 6) {
      goto LABEL_82;
    }
  }
LABEL_83:
  if (!v96
    || ([v96 isEqualToString:@"Any"] & 1) != 0
    || ([v96 isEqualToString:@"System"] & 1) != 0
    || ([v96 isEqualToString:@"Internal"] & 1) != 0
    || ([v96 isEqualToString:@"User"] & 1) != 0)
  {
    v75 = +[LSApplicationRecord enumeratorWithOptions:](LSApplicationRecord, "enumeratorWithOptions:", 0, v83, v84);
    sub_1000067E4(v75, v46, v98, v94, v96, v73, SHIDWORD(v87), v90, v87, v72, v47, v100, v48, v85);
    if (v86)
    {
      v76 = +[LSApplicationRecord enumeratorWithOptions:64];
      sub_1000067E4(v76, v46, v98, v94, v96, v73, SHIDWORD(v87), v90, v87, v72, v47, v100, v48, v85);
    }
    v74 = v96;
    id v29 = v91;
    v45 = v92;
  }
  else if (!qword_1000107C0 || *(int *)(qword_1000107C0 + 44) >= 3)
  {
    id v83 = v96;
    MOLogWrite();
  }

  v19 = v100;
  v20 = v98;

  int v5 = v88;
  if (v45) {
    goto LABEL_92;
  }
LABEL_94:
}

id sub_1000061DC(void *a1)
{
  id v1 = a1;
  if (!v1) {
    goto LABEL_23;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  objc_opt_class();
  if (isKindOfClass)
  {
    id v3 = v1;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v15 = 0u;
      long long v16 = 0u;
      long long v13 = 0u;
      long long v14 = 0u;
      id v4 = v3;
      int v5 = (char *)[v4 countByEnumeratingWithState:&v13 objects:v18 count:16];
      if (!v5)
      {

LABEL_25:
        id v10 = v4;
        goto LABEL_26;
      }
      id v6 = v5;
      uint64_t v7 = *(void *)v14;
      int v8 = 1;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(v4);
          }
          v8 &= objc_opt_isKindOfClass();
        }
        id v6 = (char *)[v4 countByEnumeratingWithState:&v13 objects:v18 count:16];
      }
      while (v6);

      if (v8) {
        goto LABEL_25;
      }
    }
    else
    {
    }
    if (qword_1000107C0 && *(int *)(qword_1000107C0 + 44) < 3)
    {
LABEL_23:
      BOOL v11 = 0;
      goto LABEL_27;
    }
LABEL_22:
    MOLogWrite();
    goto LABEL_23;
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (qword_1000107C0 && *(int *)(qword_1000107C0 + 44) < 3) {
      goto LABEL_23;
    }
    objc_opt_class();
    goto LABEL_22;
  }
  id v17 = v1;
  id v10 = +[NSArray arrayWithObjects:&v17 count:1];
LABEL_26:
  BOOL v11 = v10;
LABEL_27:

  return v11;
}

id sub_100006414(void *a1, void *a2)
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000064CC;
  v7[3] = &unk_10000C530;
  id v4 = (id)objc_opt_new();
  id v8 = v4;
  sub_1000057CC(a1, a2, v7);
  id v5 = v4;

  return v5;
}

id sub_1000064CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setObject:a3 forKeyedSubscript:a2];
}

uint64_t sub_1000064D8(void *a1, void (*a2)(void *, uint64_t), uint64_t a3, void *a4)
{
  +[NSMutableArray arrayWithCapacity:10];
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x2020000000;
  uint64_t v20 = 0;
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x2020000000;
  v16[3] = 0;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100006638;
  v10[3] = &unk_10000C558;
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v11 = v8;
  v12 = &v17;
  long long v13 = v16;
  long long v14 = a2;
  uint64_t v15 = a3;
  sub_1000057CC(a1, a4, v10);
  if ([v8 count]) {
    sub_1000066C0(a2, a3, v8, v18[3]);
  }

  _Block_object_dispose(v16, 8);
  _Block_object_dispose(&v17, 8);

  return 1;
}

void sub_100006614(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

id sub_100006638(uint64_t a1)
{
  [*(id *)(a1 + 32) addObject:];
  id result = [*(id *)(a1 + 32) count];
  if (result == (id)10)
  {
    sub_1000066C0(*(void (**)(void *, uint64_t))(a1 + 56), *(void *)(a1 + 64), *(void **)(a1 + 32), *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24));
    id result = [*(id *)(a1 + 32) removeAllObjects];
  }
  else if (result == (id)1)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *(void *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                            + 24);
  }
  ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  return result;
}

void sub_1000066C0(void (*a1)(void *, uint64_t), uint64_t a2, void *a3, uint64_t a4)
{
  id v7 = a3;
  id v8 = +[NSNumber numberWithUnsignedInteger:a4];
  unsigned __int8 v9 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v7 count]);
  v11[0] = @"Status";
  v11[1] = @"CurrentIndex";
  v12[0] = @"BrowsingApplications";
  v12[1] = v8;
  v11[2] = @"CurrentAmount";
  v11[3] = @"CurrentList";
  v12[2] = v9;
  v12[3] = v7;
  id v10 = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:4];

  a1(v10, a2);
}

void sub_1000067E4(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, int a7, int a8, unsigned __int8 a9, void *a10, void *a11, void *a12, void *a13, int a14)
{
  id v19 = a1;
  id v130 = a2;
  id v20 = a3;
  v123 = a4;
  id v21 = a5;
  id v149 = a6;
  v129 = a10;
  id v128 = a11;
  id v138 = a12;
  id v127 = a13;
  long long v153 = 0u;
  long long v154 = 0u;
  long long v155 = 0u;
  long long v156 = 0u;
  id obj = v19;
  id v22 = [obj countByEnumeratingWithState:&v153 objects:v169 count:16];
  if (v22)
  {
    id v23 = v22;
    uint64_t v24 = *(void *)v154;
    id v125 = v21;
    id v126 = v20;
    uint64_t v124 = *(void *)v154;
    do
    {
      v25 = 0;
      id v131 = v23;
      do
      {
        if (*(void *)v154 != v24) {
          objc_enumerationMutation(obj);
        }
        id v26 = *(void **)(*((void *)&v153 + 1) + 8 * (void)v25);
        v152 = v26;
        if (!v20
          || ([v26 bundleIdentifier],
              id v28 = objc_claimAutoreleasedReturnValue(),
              unsigned int v29 = [v20 containsObject:v28],
              v28,
              id v26 = v152,
              v29))
        {
          id v30 = [v26 compatibilityObject:v116];
          id v31 = [v30 bundleType];
          id v32 = v31;
          if (!v21
            || ([v31 isEqualToString:v21] & 1) != 0
            || [v21 isEqualToString:@"Any"]
            && (([v32 isEqualToString:@"System"] & 1) != 0
             || ([v32 isEqualToString:@"Internal"] & 1) != 0
             || [v32 isEqualToString:@"User"]))
          {
            v151 = v27;
            unsigned int v33 = [v152 isLaunchProhibited] ^ 1 | a9;
            [v152 appClipMetadata];
            int v34 = v150 = v32;

            int v35 = v34 ? a7 : 1;
            unsigned int v36 = [v152 isSwiftPlaygroundsApp] ^ 1 | a8;
            BOOL v37 = v33 != 1 || v35 == 0;
            id v32 = v150;
            id v27 = v151;
            if (!v37 && v36 != 0)
            {
              v140 = v25;
              int v39 = +[NSMutableDictionary dictionaryWithCapacity:0];
              v143 = v30;
              id v40 = v30;
              id v41 = v39;
              id v42 = v128;
              id v43 = v127;
              id v144 = v149;
              int v44 = v129;
              v45 = v129;
              id v47 = v46;
              v146 = v45;
              if (v129)
              {
                context = v46;
                id v134 = v43;
                id v136 = v42;
                long long v172 = 0u;
                long long v173 = 0u;
                long long v170 = 0u;
                long long v171 = 0u;
                id v48 = v45;
                id v49 = [v48 countByEnumeratingWithState:&v170 objects:v174 count:16];
                if (v49)
                {
                  id v50 = v49;
                  uint64_t v51 = *(void *)v171;
                  do
                  {
                    id v52 = 0;
                    do
                    {
                      if (*(void *)v171 != v51) {
                        objc_enumerationMutation(v48);
                      }
                      id v53 = *(void **)(*((void *)&v170 + 1) + 8 * (void)v52);
                      id v54 = v40;
                      id v55 = v41;
                      id v56 = v53;
                      if (qword_100010818 != -1) {
                        dispatch_once(&qword_100010818, &stru_10000C6F8);
                      }
                      id v57 = [(id)qword_100010810 indexForKey:v56, v116];
                      if (v57 == (id)0x7FFFFFFFFFFFFFFFLL)
                      {
                        if (!qword_1000107C0 || *(int *)(qword_1000107C0 + 44) >= 3)
                        {
                          v116 = v56;
                          MOLogWrite();
                        }
                      }
                      else
                      {
                        unsigned int v58 = &off_1000102E0 + 4 * (void)v57;

                        sub_100008394((uint64_t)v58, v54, v55);
                      }

                      id v52 = (char *)v52 + 1;
                    }
                    while (v50 != v52);
                    id v50 = [v48 countByEnumeratingWithState:&v170 objects:v174 count:16];
                  }
                  while (v50);
                }

                id v43 = v134;
                id v42 = v136;
                v45 = v146;
                id v47 = context;
              }
              else
              {
                do
                {
                  sub_100008394((uint64_t)&off_1000102E0 + (void)v44, v40, v41);
                  v44 += 32;
                }
                while (v44 != (char *)1184);
              }
              unsigned int v59 = v144;
              if (!v149 || [v144 count])
              {
                [v40 bundleURL:v116];
                id v60 = (id)objc_claimAutoreleasedReturnValue();
                id v61 = v144;
                pthread_mutex_lock(&stru_100010780);
                Unique = (__CFBundle *)_CFBundleCreateUnique();
                if (Unique)
                {
                  id v63 = Unique;
                  if (v149)
                  {
                    id v64 = v43;
                    uint64_t FilteredInfoPlist = _CFBundleCreateFilteredInfoPlist();
                    if (FilteredInfoPlist)
                    {
                      CFDictionaryRef v66 = (const __CFDictionary *)FilteredInfoPlist;
                      CFTypeID TypeID = CFDictionaryGetTypeID();
                      if (TypeID == CFGetTypeID(v66))
                      {
                        CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy(0, 0, v66);
                        CFRelease(v66);
                        goto LABEL_67;
                      }
                      CFTypeID v71 = CFGetTypeID(v66);
                      CFStringRef v72 = CFCopyTypeIDDescription(v71);
                      if (!qword_1000107C0 || *(int *)(qword_1000107C0 + 44) >= 3)
                      {
                        v116 = (void *)v72;
                        MOLogWrite();
                      }
                      if (v72) {
                        CFRelease(v72);
                      }
                      CFRelease(v66);
                    }
                    else if (!qword_1000107C0 || *(int *)(qword_1000107C0 + 44) >= 3)
                    {
                      v116 = v61;
                      v117 = v63;
                      MOLogWrite();
                    }
                    CFMutableDictionaryRef MutableCopy = 0;
LABEL_67:
                    id v43 = v64;
                    unsigned int v59 = v144;
                  }
                  else
                  {
                    CFDictionaryRef InfoDictionary = CFBundleGetInfoDictionary(Unique);
                    if (InfoDictionary)
                    {
                      CFMutableDictionaryRef v70 = CFDictionaryCreateMutableCopy(0, 0, InfoDictionary);
                      CFMutableDictionaryRef MutableCopy = v70;
                      if (v70) {
                        [(__CFDictionary *)v70 removeObjectForKey:@"CFBundleInfoPlistURL"];
                      }
                    }
                    else
                    {
                      if (!qword_1000107C0 || *(int *)(qword_1000107C0 + 44) >= 3)
                      {
                        v116 = v60;
                        MOLogWrite();
                      }
                      CFMutableDictionaryRef MutableCopy = 0;
                    }
                  }
                  CFRelease(v63);
                }
                else
                {
                  if (!qword_1000107C0 || *(int *)(qword_1000107C0 + 44) >= 3)
                  {
                    v116 = v60;
                    MOLogWrite();
                  }
                  CFMutableDictionaryRef MutableCopy = 0;
                }
                pthread_mutex_unlock(&stru_100010780);

                if (MutableCopy)
                {
                  *(void *)&long long v161 = _NSConcreteStackBlock;
                  *((void *)&v161 + 1) = 3221225472;
                  *(void *)&long long v162 = sub_1000085FC;
                  *((void *)&v162 + 1) = &unk_10000C6D8;
                  *(void *)&long long v163 = v42;
                  *((void *)&v163 + 1) = v43;
                  *(void *)&long long v164 = v41;
                  [(__CFDictionary *)MutableCopy enumerateKeysAndObjectsUsingBlock:&v161];
                }
                v45 = v146;
              }

              id v73 = [v152 bundleIdentifier];
              id v74 = v41;
              id v75 = v130;
              id v76 = v138;
              long long v161 = 0u;
              long long v162 = 0u;
              long long v163 = 0u;
              long long v164 = 0u;
              id v77 = v75;
              id v78 = [v77 countByEnumeratingWithState:&v161 objects:v174 count:16];
              if (v78)
              {
                id v79 = v78;
                uint64_t v80 = *(void *)v162;
                while (2)
                {
                  for (i = 0; i != v79; i = (char *)i + 1)
                  {
                    if (*(void *)v162 != v80) {
                      objc_enumerationMutation(v77);
                    }
                    v82 = [v74 objectForKeyedSubscript:*(void *)(*((void *)&v161 + 1) + 8 * i), v116];

                    if (!v82)
                    {

                      id v21 = v125;
                      id v20 = v126;
                      id v23 = v131;
                      id v27 = v151;
                      id v30 = v143;
                      goto LABEL_108;
                    }
                  }
                  id v79 = [v77 countByEnumeratingWithState:&v161 objects:v174 count:16];
                  if (v79) {
                    continue;
                  }
                  break;
                }
              }

              if (!v138) {
                goto LABEL_106;
              }
              long long v159 = 0u;
              long long v160 = 0u;
              long long v157 = 0u;
              long long v158 = 0u;
              id v83 = [v74 allKeys];
              id v84 = [v83 countByEnumeratingWithState:&v157 objects:&v170 count:16];
              if (v84)
              {
                id v85 = v84;
                uint64_t v86 = *(void *)v158;
                do
                {
                  for (j = 0; j != v85; j = (char *)j + 1)
                  {
                    if (*(void *)v158 != v86) {
                      objc_enumerationMutation(v83);
                    }
                    uint64_t v88 = *(void *)(*((void *)&v157 + 1) + 8 * (void)j);
                    if ((objc_msgSend(v76, "containsObject:", v88, v116) & 1) == 0) {
                      [v74 removeObjectForKey:v88];
                    }
                  }
                  id v85 = [v83 countByEnumeratingWithState:&v157 objects:&v170 count:16];
                }
                while (v85);
              }

              if (a14)
              {
                v89 = +[LSApplicationProxy applicationProxyForIdentifier:v73];
                int v90 = [v89 bundleContainerURL];
                id v30 = v143;
                if ([v89 isContainerized] && v90)
                {
                  char v91 = a14;
                  if ((a14 & 1) != 0 && (!qword_1000107C0 || *(int *)(qword_1000107C0 + 44) >= 3)) {
                    MOLogWrite();
                  }
                  if ((a14 & 4) != 0)
                  {
                    v93 = [v89 diskUsage];
                    v94 = [v93 staticUsage];

                    if (v94)
                    {
                      [v74 setObject:v94 forKey:@"StaticDiskUsage"];
                    }
                    else if (!qword_1000107C0 || *(int *)(qword_1000107C0 + 44) >= 3)
                    {
                      v116 = [v89 bundleIdentifier];
                      MOLogWrite();
                    }
                    id v30 = v143;
                    if ((a14 & 2) != 0) {
                      goto LABEL_122;
                    }
LABEL_99:
                    if ((a14 & 8) == 0) {
                      goto LABEL_100;
                    }
LABEL_128:
                    v147 = [v89 bundleURL:v116];
                    BOOL v97 = [v89 bundleExecutable];
                    id v98 = +[NSString stringWithFormat:@"SC_Info/%@.sinf", v97];
                    [v147 URLByAppendingPathComponent:v98];
                    v100 = BOOL v99 = v90;
                    sub_10000872C(v100, v74, @"ApplicationSINF");

                    int v90 = v99;
                    char v91 = a14;

                    id v30 = v143;
                    if ((a14 & 0x10) != 0) {
                      goto LABEL_129;
                    }
LABEL_101:
                    if ((v91 & 0x20) != 0) {
                      goto LABEL_155;
                    }
                  }
                  else
                  {
                    if ((a14 & 2) == 0) {
                      goto LABEL_99;
                    }
LABEL_122:
                    BOOL v95 = [v89 diskUsage:v116];
                    v96 = [v95 dynamicUsage];

                    if (v96)
                    {
                      [v74 setObject:v96 forKey:@"DynamicDiskUsage"];
                    }
                    else if (!qword_1000107C0 || *(int *)(qword_1000107C0 + 44) >= 3)
                    {
                      v116 = [v89 bundleIdentifier];
                      MOLogWrite();
                    }
                    id v30 = v143;
                    if ((a14 & 8) != 0) {
                      goto LABEL_128;
                    }
LABEL_100:
                    if ((a14 & 0x10) == 0) {
                      goto LABEL_101;
                    }
LABEL_129:
                    v135 = v90;
                    id v101 = [v90 URLByAppendingPathComponent:@"iTunesMetadata.plist" withOptions:v116];
                    id v102 = v89;
                    id v103 = v101;
                    id v145 = v74;
                    v137 = v102;
                    v148 = [v102 bundleIdentifier];
                    id v168 = 0;
                    long long v104 = +[NSData dataWithContentsOfURL:v103 options:3 error:&v168];
                    id v105 = v168;
                    long long v106 = v105;
                    if (v104)
                    {
                      contexta = v103;
                      id v166 = 0;
                      uint64_t v167 = 100;
                      long long v107 = +[NSPropertyListSerialization propertyListWithData:v104 options:1 format:&v167 error:&v166];
                      id v122 = v166;

                      if (v107)
                      {
                        objc_opt_class();
                        if ((objc_opt_isKindOfClass() & 1) == 0)
                        {
                          if (!qword_1000107C0 || *(int *)(qword_1000107C0 + 44) >= 3)
                          {
                            v121 = [contexta path];
                            v113 = (objc_class *)objc_opt_class();
                            NSStringFromClass(v113);
                            v118 = v117 = v148;
                            v116 = v121;
                            MOLogWrite();
                          }
                          goto LABEL_152;
                        }
                        v120 = v107;
                        long long v108 = [v107 objectForKeyedSubscript:@"title"];

                        if (v108) {
                          goto LABEL_137;
                        }
                        long long v109 = [v137 localizedShortName];
                        if (!v109)
                        {
                          long long v109 = [v137 localizedName];
                        }
                        [v120 setObject:v109 forKeyedSubscript:@"title"];
                        id v165 = 0;
                        uint64_t v110 = +[NSPropertyListSerialization dataWithPropertyList:v120 format:v167 options:0 error:&v165];
                        id v119 = v165;

                        if (v110)
                        {

                          long long v104 = (void *)v110;
                          id v122 = v119;
LABEL_137:
                          [v145 setObject:v104 forKey:@"iTunesMetadata"];
                          long long v107 = v120;
LABEL_152:
                          long long v106 = v122;
                        }
                        else
                        {
                          if (!qword_1000107C0 || *(int *)(qword_1000107C0 + 44) >= 3)
                          {
                            v116 = v148;
                            v117 = (__CFBundle *)v119;
                            MOLogWrite();
                          }

                          long long v104 = 0;
                          long long v106 = v119;
                          long long v107 = v120;
                        }
                      }
                      else
                      {
                        if (qword_1000107C0 && *(int *)(qword_1000107C0 + 44) < 3) {
                          goto LABEL_152;
                        }
                        long long v106 = v122;
                        v116 = v148;
                        v117 = (__CFBundle *)v122;
                        MOLogWrite();
                      }

                      id v103 = contexta;
                    }
                    else
                    {
                      if (v105)
                      {
                        v111 = [v105 domain];
                        if ([v111 isEqualToString:NSCocoaErrorDomain])
                        {
                          id v112 = [v106 code];

                          if (v112 == (id)260) {
                            goto LABEL_154;
                          }
                        }
                        else
                        {
                        }
                      }
                      if (!qword_1000107C0 || *(int *)(qword_1000107C0 + 44) >= 3)
                      {
                        v117 = (__CFBundle *)v103;
                        v118 = v106;
                        v116 = v148;
                        MOLogWrite();
                      }
                    }
LABEL_154:

                    id v30 = v143;
                    int v90 = v135;
                    if ((v91 & 0x20) != 0)
                    {
LABEL_155:
                      v114 = [v90 URLByAppendingPathComponent:@"iTunesArtwork" v116, v117, v118];
                      sub_10000872C(v114, v74, @"iTunesArtwork");

                      id v30 = v143;
                      if ((v91 & 0x40) == 0) {
                        goto LABEL_104;
                      }
LABEL_103:
                      v92 = [v90 URLByAppendingPathComponent:@"GeoJSON" relativeToURL:v116];
                      sub_10000872C(v92, v74, @"GeoJSON");

                      id v30 = v143;
                      goto LABEL_104;
                    }
                  }
                  if ((v91 & 0x40) == 0) {
                    goto LABEL_104;
                  }
                  goto LABEL_103;
                }
LABEL_104:
              }
              else
              {
LABEL_106:

                id v30 = v143;
              }

              id v73 = [v152 bundleIdentifier];
              v123[2](v123, v73, v74);
              id v21 = v125;
              id v20 = v126;
              id v23 = v131;
              id v27 = v151;
LABEL_108:
              id v32 = v150;

              uint64_t v24 = v124;
              v25 = v140;
            }
          }
        }
        v25 = (char *)v25 + 1;
      }
      while (v25 != v23);
      id v115 = [obj countByEnumeratingWithState:&v153 objects:v169 count:16];
      id v23 = v115;
    }
    while (v115);
  }
}

void sub_100007898(id a1)
{
  id v4 = +[NSMutableSet setWithCapacity:37];
  for (uint64_t i = 0; i != 1184; i += 32)
    [v4 addObject:**(void **)((char *)&off_1000102E0 + i)];
  id v2 = [v4 copy];
  id v3 = (void *)qword_1000107D8;
  qword_1000107D8 = (uint64_t)v2;
}

void *sub_100007928()
{
  return &__kCFBooleanTrue;
}

id sub_100007934(id *a1)
{
  id v1 = *a1;
  id v2 = [*a1 count];
  if (v2) {
    id v2 = v1;
  }

  return v2;
}

id sub_100007974(unsigned char *a1)
{
  if (*a1)
  {
    id v1 = +[NSNumber numberWithBool:1];
  }
  else
  {
    id v1 = 0;
  }

  return v1;
}

id sub_1000079BC(id *a1)
{
  return [*a1 path];
}

id sub_1000079C4(id *a1)
{
  id v1 = *a1;
  id v2 = [*a1 count];
  if (v2) {
    id v2 = v1;
  }

  return v2;
}

void *sub_100007A04(void *a1)
{
  id v1 = a1;
  id v2 = [v1 entitlementValueForKey:@"com.apple.private.mobileinstall.upgrade-enabled" ofClass:objc_opt_class()];
  unsigned int v3 = [v2 BOOLValue];
  id v4 = [v1 bundleType];

  id v5 = &__kCFBooleanTrue;
  if (([v4 isEqualToString:@"User"] & 1) == 0
    && !([v4 isEqualToString:@"VPNPlugin"] | v3))
  {
    id v5 = &__kCFBooleanFalse;
  }

  return v5;
}

id sub_100007AC4(id *a1)
{
  id v1 = [*a1 longLongValue];
  if (v1)
  {
    id v1 = +[NSNumber numberWithLongLong:v1];
  }

  return v1;
}

id sub_100007B08(id *a1)
{
  id v1 = *a1;
  id v2 = [*a1 count];
  if (v2)
  {
    +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v1 count]);
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v4 = v1;
    id v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (!v5) {
      goto LABEL_22;
    }
    id v6 = v5;
    uint64_t v7 = *(void *)v17;
    while (1)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        id v10 = [v4 objectForKeyedSubscript:v9, v15];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v11 = v10;
          goto LABEL_11;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v11 = +[NSURL URLWithString:v10];
LABEL_11:
          v12 = v11;
          if ([v11 isFileURL])
          {
            long long v13 = [v12 path];
            [v3 setObject:v13 forKeyedSubscript:v9];
          }
          else if (!qword_1000107C0 || *(int *)(qword_1000107C0 + 44) >= 3)
          {
            uint64_t v15 = v12;
            MOLogWrite();
          }
          goto LABEL_20;
        }
        if (!qword_1000107C0 || *(int *)(qword_1000107C0 + 44) >= 3) {
          MOLogWrite();
        }
        v12 = 0;
LABEL_20:
      }
      id v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (!v6)
      {
LABEL_22:

        id v2 = v3;
        break;
      }
    }
  }

  return v2;
}

NSNumber *sub_100007D5C(void *a1)
{
  return +[NSNumber numberWithUnsignedInteger:*a1];
}

id sub_100007D6C(void *a1)
{
  id v1 = a1;
  uint64_t v2 = objc_opt_class();
  id v3 = [v1 objectForInfoDictionaryKey:@"SBMatchingApplicationGenres" ofClass:v2 valuesOfClass:objc_opt_class()];

  return v3;
}

id sub_100007DE8(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 objectForInfoDictionaryKey:@"LSApplicationCategoryType" ofClass:objc_opt_class()];

  return v2;
}

void *sub_100007E50(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 appState];
  if (![v2 isPlaceholder])
  {

    goto LABEL_7;
  }
  if ([v1 installType] != (id)7)
  {
    id v3 = [v1 installType];

    if (v3 == (id)8) {
      goto LABEL_6;
    }
LABEL_7:
    id v4 = &__kCFBooleanFalse;
    goto LABEL_8;
  }

LABEL_6:
  id v4 = &__kCFBooleanTrue;
LABEL_8:

  return v4;
}

void *sub_100007EE4(void *a1)
{
  id v1 = a1;
  id v2 = objc_alloc((Class)LSApplicationRecord);
  id v3 = [v1 bundleIdentifier];
  id v10 = 0;
  id v4 = [v2 initWithBundleIdentifier:v3 allowPlaceholder:1 error:&v10];
  id v5 = v10;

  if (!v4)
  {
    if (!qword_1000107C0 || *(int *)(qword_1000107C0 + 44) >= 3)
    {
      uint64_t v9 = [v1 bundleIdentifier];
      MOLogWrite();
    }
    goto LABEL_7;
  }
  id v6 = [v4 appClipMetadata];

  if (!v6)
  {
LABEL_7:
    uint64_t v7 = &__kCFBooleanFalse;
    goto LABEL_8;
  }
  uint64_t v7 = &__kCFBooleanTrue;
LABEL_8:

  return v7;
}

void *sub_100007FFC(void *a1)
{
  id v1 = a1;
  if (qword_1000107F8 != -1) {
    dispatch_once(&qword_1000107F8, &stru_10000C690);
  }
  id v2 = [v1 bundleIdentifier];
  id v3 = [v1 managedPersonas];
  id v4 = v3;
  if (!v3 || ![v3 count])
  {
LABEL_13:
    id v12 = 0;
    id v6 = [objc_alloc((Class)LSApplicationRecord) initWithBundleIdentifier:v2 allowPlaceholder:1 error:&v12];
    id v7 = v12;
    if (v6)
    {
      id v8 = [v6 appClipMetadata];

      if (v8
        || ([v6 managementDomain],
            uint64_t v9 = objc_claimAutoreleasedReturnValue(),
            unsigned __int8 v10 = [v9 hasPrefix:@"swift-playgrounds"],
            v9,
            (v10 & 1) != 0))
      {
        id v5 = &__kCFBooleanFalse;
LABEL_21:

        goto LABEL_22;
      }
    }
    else if (!qword_1000107C0 || *(int *)(qword_1000107C0 + 44) >= 3)
    {
      MOLogWrite();
    }
    id v5 = &__kCFBooleanTrue;
    goto LABEL_21;
  }
  if (!qword_1000107E8 || !qword_1000107F0)
  {
    if (!qword_1000107C0 || *(int *)(qword_1000107C0 + 44) >= 3) {
      MOLogWrite();
    }
    goto LABEL_13;
  }
  if ((objc_msgSend(v4, "containsObject:") & 1) != 0
    || ([v4 containsObject:qword_1000107F0] & 1) != 0)
  {
    goto LABEL_13;
  }
  id v5 = &__kCFBooleanFalse;
LABEL_22:

  return v5;
}

void sub_1000081E8(id a1)
{
  id v1 = +[UMUserPersonaAttributes personaAttributesForPersonaType:0];
  uint64_t v2 = [v1 userPersonaUniqueString];
  id v3 = (void *)qword_1000107E8;
  qword_1000107E8 = v2;

  if (!qword_1000107E8 && (!qword_1000107C0 || *(int *)(qword_1000107C0 + 44) >= 3)) {
    MOLogWrite();
  }
  id v4 = +[UMUserPersonaAttributes personaAttributesForPersonaType:3];
  uint64_t v5 = [v4 userPersonaUniqueString];
  id v6 = (void *)qword_1000107F0;
  qword_1000107F0 = v5;

  if (!qword_1000107F0 && (!qword_1000107C0 || *(int *)(qword_1000107C0 + 44) >= 3))
  {
    MOLogWrite();
  }
}

void sub_100008304(id a1)
{
  qword_100010800 = +[NSSet setWithObjects:@"SharedDirSize", @"DynamicDiskUsage", @"StaticDiskUsage", @"ApplicationSINF", @"iTunesArtwork", @"GeoJSON", @"iTunesMetadata", 0];

  _objc_release_x1();
}

void sub_100008394(uint64_t a1, void *a2, void *a3)
{
  id v17 = a2;
  id v5 = a3;
  id v6 = *(void (**)(id))(a1 + 24);
  if (v6)
  {
    v6(v17);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    id v8 = 0;
    if (!v7) {
      goto LABEL_17;
    }
    goto LABEL_3;
  }
  uint64_t v9 = +[NSString stringWithUTF8String:*(void *)(a1 + 8)];
  SEL v10 = NSSelectorFromString(v9);

  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    if (qword_1000107C0 && *(int *)(qword_1000107C0 + 44) < 3) {
      goto LABEL_16;
    }
LABEL_15:
    MOLogWrite();
LABEL_16:
    id v8 = 0;
    goto LABEL_17;
  }
  uint64_t v11 = [v17 methodSignatureForSelector:v10];
  if (!v11)
  {
    if (qword_1000107C0 && *(int *)(qword_1000107C0 + 44) < 3) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
  id v12 = (void *)v11;
  long long v13 = +[NSInvocation invocationWithMethodSignature:v11];
  [v13 setSelector:v10];
  [v13 invokeWithTarget:v17];
  id v8 = (id *)malloc_type_malloc((size_t)[v12 methodReturnLength], 0x50130DACuLL);
  [v13 getReturnValue:v8];
  long long v14 = *(void (**)(id *))(a1 + 16);
  if (v14)
  {
    v14(v8);
    id v15 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v16 = v12;
    if (strcmp("@", (const char *)[v16 methodReturnType]))
    {
      if (!qword_1000107C0 || *(int *)(qword_1000107C0 + 44) >= 3) {
        MOLogWrite();
      }

      goto LABEL_17;
    }
    id v15 = *v8;
  }
  id v7 = v15;

  if (v7) {
LABEL_3:
  }
    [v5 setObject:v7 forKey:**(void **)a1];
LABEL_17:
  free(v8);
}

void sub_1000085FC(id *a1, void *a2, void *a3, unsigned char *a4)
{
  id v8 = a2;
  id v7 = a3;
  if (([a1[4] containsObject:v8] & 1) == 0
    && ([a1[5] containsObject:v8] & 1) == 0)
  {
    [a1[6] setValue:v7 forKey:v8];
  }
  *a4 = 0;
}

void sub_100008690(id a1)
{
  id v4 = +[NSMutableArray arrayWithCapacity:37];
  for (uint64_t i = 0; i != 1184; i += 32)
    [v4 addObject:**(void **)((char *)&off_1000102E0 + i)];
  id v2 = [objc_alloc((Class)NSKnownKeysMappingStrategy) initForKeys:v4];
  id v3 = (void *)qword_100010810;
  qword_100010810 = (uint64_t)v2;
}

void sub_10000872C(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  id v13 = 0;
  id v8 = +[NSData dataWithContentsOfURL:v5 options:2 error:&v13];
  id v9 = v13;
  SEL v10 = v9;
  if (v8)
  {
    [v6 setObject:v8 forKey:v7];
  }
  else
  {
    if (v9)
    {
      uint64_t v11 = [v9 domain];
      if ([v11 isEqualToString:NSCocoaErrorDomain])
      {
        id v12 = [v10 code];

        if (v12 == (id)260) {
          goto LABEL_11;
        }
      }
      else
      {
      }
    }
    if (!qword_1000107C0 || *(int *)(qword_1000107C0 + 44) >= 3) {
      MOLogWrite();
    }
  }
LABEL_11:
}

void sub_100008864(uint64_t a1, uint64_t a2)
{
  int v2 = 138412546;
  uint64_t v3 = a1;
  __int16 v4 = 2112;
  uint64_t v5 = a2;
  _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Unsupported value for %@ : %@", (uint8_t *)&v2, 0x16u);
}

void sub_1000088F0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  uint64_t v3 = *(void *)(*(void *)(a2 + 56) + 8);
  int v4 = 138412802;
  uint64_t v5 = a1;
  __int16 v6 = 2112;
  uint64_t v7 = v2;
  __int16 v8 = 2112;
  uint64_t v9 = v3;
  _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Unsupported uninstall option %@ in %@ (client: %@)", (uint8_t *)&v4, 0x20u);
}

CFDictionaryRef CFBundleGetInfoDictionary(CFBundleRef bundle)
{
  return _CFBundleGetInfoDictionary(bundle);
}

CFStringRef CFCopyTypeIDDescription(CFTypeID type_id)
{
  return _CFCopyTypeIDDescription(type_id);
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryContainsKey(theDict, key);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreateMutable(allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return _CFDictionaryCreateMutableCopy(allocator, capacity, theDict);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return _CFDictionaryGetTypeID();
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

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

void CFRelease(CFTypeRef cf)
{
}

void CFRunLoopRun(void)
{
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return _CFStringCreateWithFormat(alloc, formatOptions, format);
}

CFURLRef CFURLCreateWithFileSystemPath(CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory)
{
  return _CFURLCreateWithFileSystemPath(allocator, filePath, pathStyle, isDirectory);
}

uint64_t MGGetBoolAnswer()
{
  return _MGGetBoolAnswer();
}

uint64_t MOLogOpen()
{
  return _MOLogOpen();
}

uint64_t MOLogWrite()
{
  return _MOLogWrite();
}

uint64_t MobileInstallationCheckCapabilitiesMatch()
{
  return _MobileInstallationCheckCapabilitiesMatch();
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return _NSSelectorFromString(aSelectorName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFBundleCreateFilteredInfoPlist()
{
  return __CFBundleCreateFilteredInfoPlist();
}

uint64_t _CFBundleCreateUnique()
{
  return __CFBundleCreateUnique();
}

uint64_t _CTServerConnectionCreate()
{
  return __CTServerConnectionCreate();
}

uint64_t _CTServerConnectionInstallCarrierBundle()
{
  return __CTServerConnectionInstallCarrierBundle();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return ___error();
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
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

void free(void *a1)
{
}

int getpwnam_r(const char *a1, passwd *a2, char *a3, size_t a4, passwd **a5)
{
  return _getpwnam_r(a1, a2, a3, a4, a5);
}

uint64_t lockdown_checkin_xpc()
{
  return _lockdown_checkin_xpc();
}

uint64_t lockdown_disconnect()
{
  return _lockdown_disconnect();
}

uint64_t lockdown_receive_message()
{
  return _lockdown_receive_message();
}

uint64_t lockdown_send_message()
{
  return _lockdown_send_message();
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return _memcmp(__s1, __s2, __n);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
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

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return _pthread_mutex_lock(a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return _pthread_mutex_unlock(a1);
}

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return _realpath_DARWIN_EXTSN(a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

uint64_t sysconf(int a1)
{
  return _sysconf(a1);
}

void syslog(int a1, const char *a2, ...)
{
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return [a1 UUIDString];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_appClipMetadata(void *a1, const char *a2, ...)
{
  return [a1 appClipMetadata];
}

id objc_msgSend_appState(void *a1, const char *a2, ...)
{
  return [a1 appState];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bundleContainerURL(void *a1, const char *a2, ...)
{
  return [a1 bundleContainerURL];
}

id objc_msgSend_bundleExecutable(void *a1, const char *a2, ...)
{
  return [a1 bundleExecutable];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_bundleType(void *a1, const char *a2, ...)
{
  return [a1 bundleType];
}

id objc_msgSend_bundleURL(void *a1, const char *a2, ...)
{
  return [a1 bundleURL];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_compatibilityObject(void *a1, const char *a2, ...)
{
  return [a1 compatibilityObject];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return [a1 defaultWorkspace];
}

id objc_msgSend_diskUsage(void *a1, const char *a2, ...)
{
  return [a1 diskUsage];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_dynamicUsage(void *a1, const char *a2, ...)
{
  return [a1 dynamicUsage];
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return [a1 fileSystemRepresentation];
}

id objc_msgSend_installType(void *a1, const char *a2, ...)
{
  return [a1 installType];
}

id objc_msgSend_isContainerized(void *a1, const char *a2, ...)
{
  return [a1 isContainerized];
}

id objc_msgSend_isFileURL(void *a1, const char *a2, ...)
{
  return [a1 isFileURL];
}

id objc_msgSend_isLaunchProhibited(void *a1, const char *a2, ...)
{
  return [a1 isLaunchProhibited];
}

id objc_msgSend_isMultiUser(void *a1, const char *a2, ...)
{
  return [a1 isMultiUser];
}

id objc_msgSend_isPlaceholder(void *a1, const char *a2, ...)
{
  return [a1 isPlaceholder];
}

id objc_msgSend_isSwiftPlaygroundsApp(void *a1, const char *a2, ...)
{
  return [a1 isSwiftPlaygroundsApp];
}

id objc_msgSend_localizedName(void *a1, const char *a2, ...)
{
  return [a1 localizedName];
}

id objc_msgSend_localizedShortName(void *a1, const char *a2, ...)
{
  return [a1 localizedShortName];
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return [a1 longLongValue];
}

id objc_msgSend_managedPersonas(void *a1, const char *a2, ...)
{
  return [a1 managedPersonas];
}

id objc_msgSend_managementDomain(void *a1, const char *a2, ...)
{
  return [a1 managementDomain];
}

id objc_msgSend_methodReturnLength(void *a1, const char *a2, ...)
{
  return [a1 methodReturnLength];
}

id objc_msgSend_methodReturnType(void *a1, const char *a2, ...)
{
  return [a1 methodReturnType];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_resumeSync(void *a1, const char *a2, ...)
{
  return [a1 resumeSync];
}

id objc_msgSend_sharedConnection(void *a1, const char *a2, ...)
{
  return [a1 sharedConnection];
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return [a1 sharedManager];
}

id objc_msgSend_staticUsage(void *a1, const char *a2, ...)
{
  return [a1 staticUsage];
}

id objc_msgSend_userPersonaUniqueString(void *a1, const char *a2, ...)
{
  return [a1 userPersonaUniqueString];
}