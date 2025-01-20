uint64_t sub_100005AD8(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  void v8[5];
  id v9;

  v3 = a2;
  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 128), 0xFFFFFFFFFFFFFFFFLL);
  v4 = *(void *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 120);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100005B8C;
  v8[3] = &unk_100024AB0;
  v8[4] = v4;
  v9 = v3;
  v6 = v3;
  dispatch_async(v5, v8);

  return 1;
}

intptr_t sub_100005B8C(uint64_t a1)
{
  [*(id *)(a1 + 32) outputEvent:*(void *)(a1 + 40)];
  v2 = *(NSObject **)(*(void *)(a1 + 32) + 128);

  return dispatch_semaphore_signal(v2);
}

uint64_t sub_100005BD4(uint64_t a1, void *a2)
{
  id v3 = a2;
  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 128), 0xFFFFFFFFFFFFFFFFLL);
  uint64_t v4 = *(void *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 120);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100005C88;
  v8[3] = &unk_100024AB0;
  v8[4] = v4;
  id v9 = v3;
  id v6 = v3;
  dispatch_async(v5, v8);

  return 0;
}

intptr_t sub_100005C88(uint64_t a1)
{
  [*(id *)(a1 + 32) outputEvent:*(void *)(a1 + 40)];
  v2 = *(NSObject **)(*(void *)(a1 + 32) + 128);

  return dispatch_semaphore_signal(v2);
}

uint64_t sub_100005D70()
{
  puts("log [options] [<command>]");
  putchar(10);
  puts("    -a,--all                         Show all system logs");
  puts("    -x,--process <name>              Filter events from the specified process");
  puts("    -d,--path=<logs-dir>             Use <logs-dir> instead of default");
  puts("    --last num [m|h|d]               Limits the captured events to the period starting at the given interval ago from the current time");
  puts("    -S,--start=\"YYYY-MM-DD HH:MM:SS\" Start log dump from a specified date");
  puts("    -E,--end=\"YYYY-MM-DD HH:MM:SS\"   Stop log dump after a specified date");
  puts("    -b                               Show CloudDocs logs");
  puts("    -f                               Show FileProvider related logs");
  puts("    -F                               Show FruitBasket related logs");
  puts("    -N                               Show network related logs (should be used in conjonction with another flag)");
  puts("    -g                               Show Genstore related logs");
  puts("    -i                               Show SQL and CloudDocs logs");
  puts("    -o                               Show local storage logs");
  puts("    -D                               Show logs from the Denator subsystem");
  puts("    -z,--local-timezone              Display timestamps within local timezone");
  puts("    --dark-mode                      Adapt color scheme to dark mode terminal");
  puts("    -q,--quick                       Print logs without heavy pre-processing");

  return putchar(10);
}

id sub_100006784(int a1, char *const *a2)
{
  int v8 = a1;
  v7 = a2;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100006860;
  v5[3] = &unk_100024DC8;
  v2 = objc_alloc_init(BRCTLLogCommand);
  id v6 = v2;
  sub_100009A00(&v8, &v7, "abc:d:fFNogH:il:m:n:qS:E:p:stwx:z", (const option *)&off_100024B80, v5);
  [(BRCTLLogCommand *)v2 buildPredicateFromString];
  if (v8) {
    sub_1000099E8();
  }
  id v3 = (id)[(BRCTLLogCommand *)v2 dumpToFd:1];

  return v3;
}

id sub_100006860(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) parseOption:a2 arg:a3];
}

uint64_t sub_100006998(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1000069A8(uint64_t a1)
{
}

uint64_t sub_1000069B0(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_opt_new();
  [v4 setEventType:1024];
  if ((unint64_t)[v3 length] < 0x1F)
  {
    id v5 = 0;
    goto LABEL_46;
  }
  if (qword_10002A908 != -1) {
    dispatch_once(&qword_10002A908, &stru_100024E10);
  }
  id v6 = [v3 substringToIndex:31];
  v7 = [(id)qword_10002A900 dateFromString:v6];
  if (v7)
  {
    [v4 setTimestamp:v7];
    int v8 = [v3 substringFromIndex:32];
    id v9 = +[NSScanner scannerWithString:v8];

    v10 = +[NSCharacterSet whitespaceCharacterSet];
    [v9 setCharactersToBeSkipped:v10];

    uint64_t v43 = 0;
    id v5 = 0;
    if ([v9 scanHexLongLong:&v43])
    {
      [v4 setThreadID:v43];
      if ([v9 scanString:@"Default" intoString:0])
      {
        uint64_t v11 = 0;
LABEL_18:
        [v4 setMessageType:v11];
        uint64_t v42 = 0;
        id v5 = 0;
        if (![v9 scanHexLongLong:&v42]) {
          goto LABEL_44;
        }
        uint64_t v41 = 0;
        id v5 = 0;
        if (![v9 scanInteger:&v41]) {
          goto LABEL_44;
        }
        [v4 setProcessID:v41];
        id v40 = 0;
        unsigned int v12 = [v9 scanUpToString:@": " intoString:&v40];
        id v13 = v40;
        id v5 = 0;
        if (!v12) {
          goto LABEL_43;
        }
        if ([v9 isAtEnd]) {
          goto LABEL_22;
        }
        [v9 scanString:@": " intoString:0];
        [v4 setProcessImagePath:v13];
        id v14 = [v9 scanLocation];
        if (objc_msgSend(v9, "scanUpToString:intoString:", @" ["), 0) {
          && ![v9 isAtEnd])
        }
        {
          [v9 scanString:@" [" intoString:0);
        }
        else
        {
          [v9 setScanLocation:v14];
          id v5 = 0;
          if (![v9 scanString:@"[" intoString:0]) {
            goto LABEL_43;
          }
          if ([v9 isAtEnd])
          {
LABEL_22:
            id v5 = 0;
LABEL_43:

            goto LABEL_44;
          }
        }
        id v39 = 0;
        unsigned int v15 = [v9 scanUpToString:@"]" intoString:&v39];
        id v16 = v39;
        id v5 = 0;
        if (v15)
        {
          id v36 = v16;
          if ([v9 isAtEnd])
          {
            id v5 = 0;
          }
          else
          {
            [v9 scanString:@"]" intoString:0];
            v17 = [v36 componentsSeparatedByString:@"."];
            v37 = v17;
            if ([v36 hasPrefix:@"com.apple."]
              || ([v36 hasPrefix:@"com.example."] & 1) != 0)
            {
              id v35 = v13;
              uint64_t v18 = 0;
              uint64_t v19 = 0;
              do
              {
                v20 = [v37 objectAtIndexedSubscript:v18];
                v19 += (uint64_t)[v20 length];

                ++v18;
              }
              while (v18 != 3);
              v21 = (char *)(v19 + 2);
              id v13 = v35;
            }
            else
            {
              v22 = [v17 objectAtIndexedSubscript:0];
              v21 = (char *)[v22 length];
            }
            v23 = [v36 substringToIndex:v21];
            [v4 setSubsystem:v23];

            v24 = [v36 substringFromIndex:v21 + 1];
            [v4 setCategory:v24];

            v25 = +[NSCharacterSet newlineCharacterSet];
            id v38 = 0;
            LODWORD(v23) = [v9 scanUpToCharactersFromSet:v25 intoString:&v38];
            id v26 = v38;

            id v5 = 0;
            if (v23)
            {
              [v4 setEventMessage:v26];
              id v5 = v4;
            }
          }
          id v16 = v36;
        }

        goto LABEL_43;
      }
      if ([v9 scanString:@"Info" intoString:0])
      {
        uint64_t v11 = 1;
        goto LABEL_18;
      }
      if ([v9 scanString:@"Debug" intoString:0])
      {
        uint64_t v11 = 2;
        goto LABEL_18;
      }
      if ([v9 scanString:@"Error" intoString:0])
      {
        uint64_t v11 = 16;
        goto LABEL_18;
      }
      id v5 = 0;
      if ([v9 scanString:@"Fault" intoString:0])
      {
        uint64_t v11 = 17;
        goto LABEL_18;
      }
    }
LABEL_44:

    goto LABEL_45;
  }
  id v5 = 0;
LABEL_45:

LABEL_46:
  if (v5)
  {
    uint64_t v27 = *(void *)(a1[6] + 8);
    if (*(void *)(v27 + 40))
    {
      uint64_t v28 = (*(uint64_t (**)(void))(a1[4] + 16))();
      uint64_t v27 = *(void *)(a1[6] + 8);
    }
    else
    {
      uint64_t v28 = 0;
    }
    id v29 = v5;
    v30 = *(void **)(v27 + 40);
    *(void *)(v27 + 40) = v29;
LABEL_53:

    goto LABEL_54;
  }
  if (!*(unsigned char *)(*(void *)(a1[5] + 8) + 24))
  {
    v32 = *(void **)(*(void *)(a1[6] + 8) + 40);
    if (!v32)
    {
      uint64_t v28 = 0xFFFFFFFFLL;
      goto LABEL_54;
    }
    v30 = [v32 eventMessage];
    v33 = [v3 substringToIndex:[v3 length] - 1];
    v34 = +[NSString stringWithFormat:@"%@\n%@", v30, v33];
    [*(id *)(*(void *)(a1[6] + 8) + 40) setEventMessage:v34];

    uint64_t v28 = 0;
    goto LABEL_53;
  }
  uint64_t v28 = 0;
LABEL_54:
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 0;

  return v28;
}

void sub_100006FAC(id a1)
{
  uint64_t v1 = objc_opt_new();
  v2 = (void *)qword_10002A900;
  qword_10002A900 = v1;

  id v3 = (void *)qword_10002A900;

  [v3 setDateFormat:@"yyyy-MM-dd HH:mm:ss.SSSZ"];
}

uint64_t sub_100007000()
{
  puts("check [options] <command>");
  puts("    run local and server checks");
  putchar(10);
  puts("    -o,--output=<file-path>");
  puts("                         redirect output to <file-path>");
  puts("    local                (default) run local checks");
  puts("    server [<containers>]");
  puts("                         run server checks for the specified containers");

  return putchar(10);
}

uint64_t sub_100007084(unsigned int a1, char *const *a2)
{
  unsigned int v15 = a1;
  id v14 = (const char **)a2;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = 0;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100007328;
  v9[3] = &unk_100024EA8;
  v9[4] = &v10;
  sub_100009A00((int *)&v15, (char *const **)&v14, "o:", (const option *)&off_100024E30, v9);
  v2 = (const char *)v11[3];
  if (v2)
  {
    uint64_t v3 = open(v2, 525, 420);
    if ((v3 & 0x80000000) != 0) {
      err(1, "Unable to open file %s", *v14);
    }
    id v4 = [objc_alloc((Class)NSFileHandle) initWithFileDescriptor:v3 closeOnDealloc:1];
  }
  else
  {
    id v4 = +[NSFileHandle fileHandleWithStandardOutput];
  }
  id v5 = (void *)qword_10002A910;
  qword_10002A910 = (uint64_t)v4;

  if (v15)
  {
    int v6 = sub_100009910(*v14, (const char **)&off_100024E70);
    uint64_t v7 = ((uint64_t (*)(void, const char **))(&off_100024E70)[2 * v6 + 1])(v15, v14);
  }
  else
  {
    sub_10000722C(0, 0);
    uint64_t v7 = 0;
  }
  _Block_object_dispose(&v10, 8);
  return v7;
}

void sub_10000720C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000722C(int a1, char *const *a2)
{
  int v10 = a1;
  id v9 = a2;
  sub_100009A00(&v10, &v9, 0, 0, 0);
  if (v10 >= 2) {
    sub_1000099E8();
  }
  v2 = sub_100009BE0();
  uint64_t v3 = qword_10002A910;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000734C;
  v7[3] = &unk_100024ED0;
  id v8 = v2;
  id v4 = v2;
  [v4 performSelfCheck:v3 reply:v7];
  id v5 = [v4 resultWithTimeout:dword_10002A8D0 exitMessage:@"self-check failed"];

  return 0;
}

uint64_t sub_100007320()
{
  return 1;
}

uint64_t sub_100007328(uint64_t result, int a2)
{
  if (a2 == 111) {
    *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = optarg;
  }
  return result;
}

id sub_10000734C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setBoolResult:a2 error:a3];
}

void *sub_100007624(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 userInfo];
  id v5 = [v4 objectForKeyedSubscript:NSProgressFileOperationKindKey];

  if (v5)
  {
    id v6 = [v3 description];
    printf("xxxxx ignore %s\n", (const char *)[v6 UTF8String]);

    uint64_t v7 = 0;
  }
  else
  {
    [*(id *)(a1 + 32) setProgressObserved:v3];
    [*(id *)(a1 + 32) setPreviousDescription:0];
    puts("<<<<<");
    [v3 addObserver:*(void *)(a1 + 32) forKeyPath:@"localizedDescription" options:4 context:0];
    [v3 addObserver:*(void *)(a1 + 32) forKeyPath:@"localizedAdditionalDescription" options:4 context:0];
    [v3 addObserver:*(void *)(a1 + 32) forKeyPath:@"indeterminate" options:4 context:0];
    [v3 addObserver:*(void *)(a1 + 32) forKeyPath:@"userInfo.NSProgressFileTotalCountKey" options:4 context:0];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000077DC;
    v12[3] = &unk_100024AB0;
    id v8 = v3;
    uint64_t v9 = *(void *)(a1 + 32);
    id v13 = v8;
    uint64_t v14 = v9;
    int v10 = objc_retainBlock(v12);
    uint64_t v7 = objc_retainBlock(v10);
  }

  return v7;
}

id sub_1000077DC(uint64_t a1)
{
  puts(">>>>>");
  [*(id *)(a1 + 32) removeObserver:*(void *)(a1 + 40) forKeyPath:@"localizedDescription"];
  [*(id *)(a1 + 32) removeObserver:*(void *)(a1 + 40) forKeyPath:@"localizedAdditionalDescription"];
  [*(id *)(a1 + 32) removeObserver:*(void *)(a1 + 40) forKeyPath:@"indeterminate"];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);

  return [v2 removeObserver:v3 forKeyPath:@"userInfo.NSProgressFileTotalCountKey"];
}

void sub_100008260(id *a1, void *a2)
{
  id v3 = a2;
  [a1[4] disableUpdates];
  id v4 = [v3 objectForKeyedSubscript:NSMetadataQueryUpdateAddedItemsKey];
  id v5 = [v3 objectForKeyedSubscript:NSMetadataQueryUpdateRemovedItemsKey];
  v94 = v3;
  v105 = [v3 objectForKeyedSubscript:NSMetadataQueryUpdateChangedItemsKey];
  id v6 = a1[5];
  uint64_t v7 = +[NSDate date];
  id v8 = [v7 description];
  [v6 write:@"%s total:%d" :[v8 UTF8String] :[a1[4] resultCount]];

  if ([v4 count]) {
    [a1[5] write:@" added:%d" , [v4 count]];
  }
  uint64_t v9 = v105;
  if ([v105 count]) {
    [a1[5] write:@" updated:%d" , [v105 count]];
  }
  if ([v5 count]) {
    [a1[5] write:@" removed:%d" , [v5 count]];
  }
  [a1[5] write:"\n"];
  long long v136 = 0u;
  long long v137 = 0u;
  long long v134 = 0u;
  long long v135 = 0u;
  id obj = [a1[4] results];
  id v10 = [obj countByEnumeratingWithState:&v134 objects:v139 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v135;
    uint64_t v102 = BRMetadataUbiquitousItemUploadingSizeKey;
    uint64_t v101 = BRMetadataUbiquitousItemDownloadingSizeKey;
    uint64_t v100 = NSMetadataUbiquitousSharedItemRoleKey;
    uint64_t v99 = NSMetadataUbiquitousSharedItemPermissionsKey;
    uint64_t v97 = BRURLTagNamesKey;
    uint64_t v98 = BRModifiedSinceSharedKey;
    uint64_t v95 = BRMetadataCreatorNameComponentsKey;
    uint64_t v96 = BRMetadataIsTopLevelSharedItemKey;
    char v112 = 1;
    uint64_t v103 = *(void *)v135;
    v104 = v4;
    while (1)
    {
      id v13 = 0;
      id v106 = v11;
      do
      {
        if (*(void *)v135 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void **)(*((void *)&v134 + 1) + 8 * (void)v13);
        unsigned int v15 = [v4 containsObject:v14];
        unsigned int v16 = [v9 containsObject:v14];
        unsigned int v17 = v16;
        if (!*((unsigned char *)a1[6] + 12) || (v15 & 1) != 0 || v16)
        {
          uint64_t v18 = [v14 valueForKey:NSMetadataItemURLKey];
          v118 = [v14 valueForKey:NSMetadataUbiquitousItemURLInLocalContainerKey];
          uint64_t v19 = [v18 path];
          v125 = v18;
          v20 = [v18 path];
          unsigned int v21 = [v20 hasPrefix:a1[7]];

          v119 = v13;
          if (v21)
          {
            id v22 = [a1[7] length];
            if (v22 < [v19 length])
            {
              uint64_t v23 = [v19 substringFromIndex:[a1[7] length]];

              uint64_t v19 = (void *)v23;
            }
          }
          uint64_t v122 = [v14 valueForKey:NSMetadataUbiquitousItemDownloadingErrorKey];
          uint64_t v128 = [v14 valueForKey:NSMetadataUbiquitousItemUploadingErrorKey];
          v121 = [v14 valueForKey:NSMetadataUbiquitousItemPercentDownloadedKey];
          v120 = [v14 valueForKey:NSMetadataUbiquitousItemPercentUploadedKey];
          v129 = [v14 valueForKey:v102];
          v116 = [v14 valueForKey:v101];
          v126 = [v14 valueForKey:NSMetadataUbiquitousItemDownloadingStatusKey];
          v24 = [v14 valueForKey:NSMetadataUbiquitousItemIsDownloadingKey];
          unsigned int v25 = [v24 BOOLValue];

          id v26 = [v14 valueForKey:NSMetadataUbiquitousItemIsUploadedKey];
          unsigned int v124 = [v26 BOOLValue];

          uint64_t v27 = [v14 valueForKey:NSMetadataUbiquitousItemIsUploadingKey];
          unsigned int v28 = [v27 BOOLValue];

          id v29 = [v14 valueForKey:NSMetadataUbiquitousItemIsSharedKey];
          unsigned int v30 = [v29 BOOLValue];

          v31 = [v14 valueForKey:NSMetadataUbiquitousItemDownloadRequestedKey];
          unsigned int v108 = [v31 BOOLValue];

          v123 = [v14 valueForKey:v100];
          v113 = [v14 valueForKey:NSMetadataUbiquitousSharedItemOwnerNameComponentsKey];
          v127 = [v14 valueForKey:v99];
          v115 = [v14 valueForKey:NSMetadataUbiquitousSharedItemMostRecentEditorNameComponentsKey];
          v32 = [v14 valueForKey:v98];
          unsigned int v109 = [v32 BOOLValue];

          v117 = [v14 valueForKey:v97];
          v33 = [v14 valueForKey:v96];
          unsigned int v110 = [v33 BOOLValue];

          v114 = [v14 valueForKey:v95];
          [a1[5] write:" o "];
          if (v15 | v17) {
            uint64_t v34 = 2;
          }
          else {
            uint64_t v34 = 0;
          }
          if (v15) {
            uint64_t v35 = 2;
          }
          else {
            uint64_t v35 = 9;
          }
          [a1[5] startFgColor:v35 attr:v34];
          id v36 = a1[5];
          id v111 = v19;
          [v36 write:[v111 fileSystemRepresentation]];
          [a1[5] reset];
          v37 = v118;
          if (v118 != v125)
          {
            [a1[5] startFgColor:0 attr:2];
            id v38 = a1[5];
            id v39 = [v118 path];
            [v38 write:@" (at %s)", [v39 fileSystemRepresentation]];

            [a1[5] reset];
          }
          [a1[5] startFgColor:4];
          if (v124)
          {
            [a1[5] puts:" ☁"];
            id v40 = v104;
            uint64_t v41 = (void *)v122;
            uint64_t v42 = v129;
            if ((v28 & 1) == 0) {
              goto LABEL_34;
            }
            goto LABEL_30;
          }
          id v40 = v104;
          uint64_t v41 = (void *)v122;
          uint64_t v42 = v129;
          if (v28)
          {
LABEL_30:
            [a1[5] puts:" ↑"];
            if (v42)
            {
              id v43 = a1[5];
              [v129 unsignedLongLongValue];
              v44 = BRLocalizedFileSizeDescriptionWithExactCount();
              id v45 = [v44 description];
              id v88 = [v45 UTF8String];
              v46 = v43;
              uint64_t v42 = v129;
              [v46 write:@" %s ", v88];

              uint64_t v41 = (void *)v122;
            }
            if (v120)
            {
              id v47 = a1[5];
              [v120 floatValue];
              v49 = v47;
              uint64_t v42 = v129;
              [v49 write:@"%.01f%% "];
            }
LABEL_34:
            if (v25)
            {
LABEL_35:
              [a1[5] puts:" ↓"];
              if (v116)
              {
                id v50 = a1[5];
                [v116 unsignedLongLongValue];
                v51 = BRLocalizedFileSizeDescriptionWithExactCount();
                id v52 = [v51 description];
                id v89 = [v52 UTF8String];
                v53 = v50;
                uint64_t v42 = v129;
                [v53 write:@" %s ", v89];
              }
              if (v121)
              {
                id v54 = a1[5];
                [v121 floatValue];
                v56 = v54;
                uint64_t v42 = v129;
                [v56 write:[NSString stringWithFormat:@"%.01f%% ", v55]];
              }
LABEL_43:
              [a1[5] reset];
              v57 = [a1[8] objectForKeyedSubscript:v126];
              v58 = (void *)v128;
              if (v57)
              {
                [a1[5] startFgColor:4];
                id v59 = a1[5];
                id v90 = [v57 UTF8String];
                v60 = v59;
                uint64_t v42 = v129;
                [v60 write:[NSString stringWithFormat:@" %s", v90]];
                [a1[5] reset];
              }
              if (v109)
              {
                [a1[5] write:" ✍️ "];
                [a1[5] startFgColor:5];
                id v61 = a1[5];
                if (v115)
                {
                  [v115 br_formattedName];
                  id v62 = objc_claimAutoreleasedReturnValue();
                  [v61 write:@" by %s" stringByUTF8String:v62];

                  v58 = (void *)v128;
                }
                else
                {
                  [v61 write:" by Me"];
                }
                [a1[5] reset];
                uint64_t v42 = v129;
              }
              if (((v30 ^ 1 | v110) & 1) == 0)
              {
                [a1[5] write:" ➕ "];
                [a1[5] startFgColor:5];
                id v63 = a1[5];
                if (v114)
                {
                  [v114 br_formattedName];
                  id v64 = objc_claimAutoreleasedReturnValue();
                  v65 = (const char *)[v64 UTF8String];
                  v66 = "🤷";
                  if (v65) {
                    v66 = v65;
                  }
                  [v63 write:[NSString stringWithFormat:@" by %s", v66]];

                  v58 = (void *)v128;
                }
                else
                {
                  [v63 write:" by Me"];
                }
                [a1[5] reset];
                uint64_t v42 = v129;
              }
              if (v30) {
                [a1[5] write:" 👥 "];
              }
              [a1[5] startFgColor:5];
              if ([v123 isEqualToString:NSMetadataUbiquitousSharedItemRoleOwner])
              {
                [a1[5] write:" by Me"];
                id v13 = v119;
              }
              else
              {
                id v13 = v119;
                if ([v123 isEqualToString:NSMetadataUbiquitousSharedItemRoleParticipant])
                {
                  id v67 = a1[5];
                  [v113 br_formattedName];
                  id v68 = objc_claimAutoreleasedReturnValue();
                  v69 = (const char *)[v68 UTF8String];
                  v70 = "🤷";
                  if (v69) {
                    v70 = v69;
                  }
                  v71 = v67;
                  uint64_t v42 = v129;
                  [v71 write:@" by %s", v70];

                  v58 = (void *)v128;
                }
              }
              [a1[5] reset];
              if (v127)
              {
                [a1[5] startFgColor:5];
                v72 = [a1[9] objectForKeyedSubscript:v127];
                v73 = v72;
                if (v72)
                {
                  id v74 = a1[5];
                  id v91 = [v72 UTF8String];
                  v75 = v74;
                  v58 = (void *)v128;
                  [v75 write:[NSString stringWithFormat:@" (%s)", v91]];
                }
                [a1[5] reset];

                uint64_t v42 = v129;
              }
              [a1[5] puts:"\n"];
              if (v41)
              {
                [a1[5] startFgColor:1];
                [a1[5] puts:"\t\t download error:"];
                [a1[5] reset];
                id v76 = a1[5];
                id v77 = [a1[6] _prettyDescriptionFromError:v41];
                id v92 = [v77 UTF8String];
                v78 = v76;
                uint64_t v42 = v129;
                [v78 write:[NSString stringWithFormat:@" %s\n", v92]];

                v58 = (void *)v128;
              }
              if (v58)
              {
                [a1[5] startFgColor:1];
                [a1[5] puts:"\t\t upload error:"];
                [a1[5] reset];
                id v79 = a1[5];
                id v80 = [a1[6] _prettyDescriptionFromError:v58];
                id v93 = [v80 UTF8String];
                v81 = v79;
                uint64_t v42 = v129;
                [v81 write:v93];

                v58 = (void *)v128;
              }
              v82 = v117;
              if (v117)
              {
                [a1[5] startFgColor:4];
                [a1[5] puts:"\t\t tags:"];
                long long v132 = 0u;
                long long v133 = 0u;
                long long v130 = 0u;
                long long v131 = 0u;
                id v83 = v117;
                id v84 = [v83 countByEnumeratingWithState:&v130 objects:v138 count:16];
                if (v84)
                {
                  id v85 = v84;
                  uint64_t v86 = *(void *)v131;
                  do
                  {
                    for (i = 0; i != v85; i = (char *)i + 1)
                    {
                      if (*(void *)v131 != v86) {
                        objc_enumerationMutation(v83);
                      }
                      [a1[5] puts:[*(id *)(*((void *)&v130 + 1) + 8 * i) UTF8String]];
                      [a1[5] puts:" "];
                    }
                    id v85 = [v83 countByEnumeratingWithState:&v130 objects:v138 count:16];
                  }
                  while (v85);
                }

                [a1[5] puts:"\n"];
                v37 = v118;
                id v13 = v119;
                uint64_t v41 = (void *)v122;
                v58 = (void *)v128;
                uint64_t v42 = v129;
                v82 = v117;
              }
              v112 &= v124;

              uint64_t v9 = v105;
              id v11 = v106;
              uint64_t v12 = v103;
              id v4 = v40;
              goto LABEL_83;
            }
          }
          else
          {
            [a1[5] puts:" (Waiting for upload)"];
            if (v25) {
              goto LABEL_35;
            }
          }
          if (v108
            && ([v126 isEqualToString:NSMetadataUbiquitousItemDownloadingStatusCurrent] & 1) == 0)
          {
            [a1[5] puts:" (Waiting for download)"];
          }
          goto LABEL_43;
        }
LABEL_83:
        id v13 = (char *)v13 + 1;
      }
      while (v13 != v11);
      id v11 = [obj countByEnumeratingWithState:&v134 objects:v139 count:16];
      if (!v11) {
        goto LABEL_87;
      }
    }
  }
  char v112 = 1;
LABEL_87:

  [a1[5] puts:"\n"];
  [a1[4] enableUpdates];
  *((unsigned char *)a1[6] + 16) = v112 & 1;
}

void sub_1000090A0(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [a2 userInfo];
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
}

void sub_100009100(void *a1, void *a2)
{
  id v10 = a2;
  id v3 = +[NSDate date];
  [v3 timeIntervalSinceDate:*(void *)(a1[4] + 40)];
  uint64_t v5 = v4;

  (*(void (**)(void))(a1[6] + 16))();
  id v6 = (void *)a1[5];
  uint64_t v7 = +[NSDate date];
  id v8 = [v7 description];
  [v6 write:@"%s gathering done in %.3fs\n\n" , [v8 UTF8String], v5];

  uint64_t v9 = a1[4];
  if (*(unsigned char *)(v9 + 14)) {
    exit(0);
  }
  *(unsigned char *)(v9 + 17) = 1;
}

uint64_t sub_1000092BC()
{
  puts("monitor [options] [<container> ...]");
  puts("    monitor activity");
  puts("    -g                   dump global activity of the iCloud Drive");
  puts("    -i                   dump changes incrementally");
  puts("    -t                   amount of time in seconds to run the query, the query will stop after the specified time");
  puts("    -p                   only static gathering");
  puts("                         Example: brctl monitor -p com.apple.CloudDoocs");
  puts("    -S,--scope=<scope>");
  puts("                         restrict the NSMetadataQuery scope to docs, data, external or a combination");
  puts("    -w,--wait-uploaded");
  puts("                         wait for all items to be uploaded");
  putchar(10);
  puts("    [<container> ...]    list of containers to monitor, ignored when -g is used");

  return putchar(10);
}

uint64_t sub_10000937C(int a1, char *const *a2)
{
  int v35 = a1;
  uint64_t v34 = a2;
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_100009828;
  v32[3] = &unk_100024DC8;
  uint64_t v2 = objc_alloc_init(BRCTLMonitor);
  v33 = v2;
  sub_100009A00(&v35, &v34, "gipt:S:w", (const option *)&off_10002A7F0, v32);
  if ([(BRCTLMonitor *)v2 isGlobal])
  {
    [(BRCTLMonitor *)v2 monitorGlobalActivity];
    goto LABEL_40;
  }
  if (![(BRCTLMonitor *)v2 scopes]) {
    [(BRCTLMonitor *)v2 setScopes:7];
  }
  id v3 = [objc_alloc((Class)NSMutableArray) initWithCapacity:1];
  uint64_t v4 = +[BRContainer allContainersByContainerID];
  uint64_t v5 = v4;
  if (v35)
  {
    id v6 = +[NSString stringWithUTF8String:*v34];
    uint64_t v7 = [v5 objectForKeyedSubscript:v6];

    if (v7)
    {
      if (v35 >= 1)
      {
        for (uint64_t i = 0; i < v35; ++i)
        {
          uint64_t v9 = +[NSString stringWithUTF8String:v34[i]];
          id v10 = [v5 objectForKeyedSubscript:v9];

          if (v10) {
            [v3 addObject:v9];
          }
        }
      }
      goto LABEL_23;
    }
    id v11 = v3;
    id v3 = 0;
  }
  else
  {
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v11 = [v4 objectEnumerator];
    id v12 = [v11 countByEnumeratingWithState:&v28 objects:v36 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v29;
      do
      {
        for (j = 0; j != v13; j = (char *)j + 1)
        {
          if (*(void *)v29 != v14) {
            objc_enumerationMutation(v11);
          }
          unsigned int v16 = [*(id *)(*((void *)&v28 + 1) + 8 * (void)j) identifier];
          [v3 addObject:v16];
        }
        id v13 = [v11 countByEnumeratingWithState:&v28 objects:v36 count:16];
      }
      while (v13);
    }
  }

LABEL_23:
  if (v3) {
    unsigned int v17 = v3;
  }
  else {
    unsigned int v17 = &__NSArray0__struct;
  }
  id v18 = [v17 mutableCopy];
  if (([(BRCTLMonitor *)v2 scopes] & 2) != 0) {
    [v18 addObject:NSMetadataQueryUbiquitousDataScope];
  }
  if ([(BRCTLMonitor *)v2 scopes]) {
    [v18 addObject:NSMetadataQueryUbiquitousDocumentsScope];
  }
  if (([(BRCTLMonitor *)v2 scopes] & 4) != 0) {
    [v18 addObject:NSMetadataQueryAccessibleUbiquitousExternalDocumentsScope];
  }
  id v19 = objc_alloc_init((Class)NSMetadataQuery);
  if (v3)
  {
    if (![v3 count]) {
      sub_100016D2C();
    }
    [v19 setSearchScopes:v18];
    v20 = +[NSPredicate predicateWithFormat:@"%K LIKE '*/*'", NSMetadataItemPathKey];
    [v19 setPredicate:v20];

    unsigned int v21 = +[NSFileManager defaultManager];
    id v22 = [v3 objectAtIndexedSubscript:0];
    uint64_t v23 = [v21 URLForUbiquityContainerIdentifier:v22];

    if (!v23) {
      sub_100016D48();
    }
    v24 = [v23 path];
    unsigned int v25 = [v24 stringByDeletingLastPathComponent];
  }
  else
  {
    if (v35 >= 2) {
      sub_100016CF4();
    }
    id v26 = +[NSString br_pathWithFileSystemRepresentation:*v34];
    unsigned int v25 = [v26 br_realpath];

    uint64_t v23 = +[NSURL fileURLWithPath:v25];
    if ((objc_msgSend(v23, "br_isInSyncedLocation") & 1) == 0) {
      sub_100016D10();
    }
    [v19 br_setupForMonitoringChildrenOfFolderAtURL:v23 searchScopes:v18];
  }

  [(BRCTLMonitor *)v2 monitorQuery:v19 rootPath:v25];
LABEL_40:

  return 0;
}

id sub_100009828(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) parseOption:a2 arg:a3];
}

uint64_t sub_100009910(const char *a1, const char **a2)
{
  size_t v4 = strlen(a1);
  uint64_t v5 = *a2;
  if (!*a2) {
    goto LABEL_11;
  }
  size_t v6 = v4;
  uint64_t v7 = 0;
  id v8 = a2 + 2;
  uint64_t result = 0xFFFFFFFFLL;
  do
  {
    uint64_t v10 = result;
    if (strlen(v5) == v6 && !strncmp(v5, a1, v6))
    {
      uint64_t result = v7;
      if ((v10 & 0x80000000) == 0)
      {
        warnx("Operation %s is ambiguous: %s or %s?");
        goto LABEL_12;
      }
    }
    else
    {
      uint64_t result = v10;
    }
    id v11 = *v8;
    v8 += 2;
    uint64_t v5 = v11;
    uint64_t v7 = (v7 + 1);
  }
  while (v11);
  if ((result & 0x80000000) != 0)
  {
LABEL_11:
    warnx("No such operation %s");
LABEL_12:
    sub_1000099E8();
  }
  return result;
}

void sub_1000099E8()
{
}

void sub_100009A00(int *a1, char *const **a2, const char *a3, const option *a4, void *a5)
{
  uint64_t v9 = a5;
  int v10 = 1;
  optreset = 1;
  optind = 1;
  if ((unint64_t)a3 | (unint64_t)a4)
  {
    for (uint64_t i = v9; ; i[2](i, v11, optarg))
    {
      uint64_t v11 = getopt_long(*a1, *a2, a3, a4, 0);
      if (v11 == -1) {
        break;
      }
      if (v11 == 63 || v11 == 58) {
        sub_1000099E8();
      }
    }
    int v10 = optind;
    uint64_t v9 = i;
  }
  *a1 -= v10;
  *a2 += optind;
}

id sub_100009B04(uint64_t a1, const char *a2, void *a3)
{
  id v5 = a3;
  size_t v6 = v5;
  if (a2)
  {
    size_t v7 = strlen(a2);
    uint64_t v8 = 0;
    uint64_t v9 = "yes";
    while (strncmp(v9, a2, v7))
    {
      uint64_t v9 = (&off_100024FE0)[v8 + 2];
      v8 += 2;
      if (v8 == 12) {
        errx(64, "-%c expects yes/no, received \"%s\"", a1, a2);
      }
    }
    id v10 = +[NSNumber numberWithInt:LODWORD((&off_100024FE0)[v8 + 1])];
  }
  else
  {
    id v10 = v5;
  }
  uint64_t v11 = v10;

  return v11;
}

id sub_100009BE0()
{
  v0 = +[BRDaemonConnection defaultConnection];
  id v1 = [v0 newSyncProxy];

  if (!v1) {
    sub_100016D64();
  }

  return v1;
}

id sub_100009C38()
{
  if ((BRIsFPFSEnabled() & 1) == 0) {
    sub_100016D80();
  }
  v0 = +[BRDaemonConnection defaultConnection];
  id v1 = [v0 newFPFSSyncProxy];

  if (!v1) {
    sub_100016D64();
  }

  return v1;
}

id sub_100009C9C()
{
  if (BRIsFPFSEnabled()) {
    sub_100016D9C();
  }
  v0 = +[BRDaemonConnection defaultConnection];
  id v1 = [v0 newLegacySyncProxy];

  if (!v1) {
    sub_100016D64();
  }

  return v1;
}

intptr_t sub_100009E94(uint64_t a1)
{
  [*(id *)(a1 + 32) result];

  uint64_t v2 = *(NSObject **)(a1 + 40);

  return dispatch_semaphore_signal(v2);
}

void sub_100009ED8(FILE *a1, void *a2, uint64_t a3)
{
}

void sub_100009EE0(FILE *a1, void *a2, uint64_t a3, int a4)
{
  id v31 = a2;
  id v34 = (id)_CFURLPromiseCopyPhysicalURL();
  uint64_t v43 = 0;
  v44 = &v43;
  uint64_t v45 = 0x3032000000;
  v46 = sub_10000C7C4;
  id v47 = sub_10000C7D4;
  id v48 = 0;
  id v5 = +[NSProcessInfo processInfo];
  size_t v6 = [v5 environment];

  id v42 = 0;
  [v34 getResourceValue:&v42 forKey:NSURLVolumeIdentifierKey error:0];
  id v7 = v42;
  geteuid();
  +[BRAccountDescriptor allLoggedInAccountDescriptors];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = (char *)[obj countByEnumeratingWithState:&v38 objects:v51 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v39;
    id v4 = &unk_100025280;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v39 != v9) {
          objc_enumerationMutation(obj);
        }
        id v36 = v6;
        id v37 = v7;
        BRPerformWithAccountDescriptor();
      }
      uint64_t v8 = (char *)[obj countByEnumeratingWithState:&v38 objects:v51 count:16];
    }
    while (v8);
  }

  id v11 = (id)v44[5];
  _Block_object_dispose(&v43, 8);

  if (a4)
  {
    id v12 = +[NSMutableDictionary dictionary];
    v49[0] = @"logical";
    id v13 = v31;
    uint64_t v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s", [v13 fileSystemRepresentation]);
    v50[0] = v14;
    v49[1] = @"physical";
    id v15 = v34;
    unsigned int v16 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s", [v15 fileSystemRepresentation]);
    v50[1] = v16;
    v49[2] = @"account";
    if (v11)
    {
      id v4 = [v11 accountIdentifier];
      +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s", [v4 UTF8String]);
      unsigned int v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      unsigned int v17 = @"no account found";
    }
    v50[2] = v17;
    v49[3] = @"synced";
    if (v15) {
      v24 = v15;
    }
    else {
      v24 = v13;
    }
    if (objc_msgSend(v24, "br_isInSyncedLocation")) {
      unsigned int v25 = "YES";
    }
    else {
      unsigned int v25 = "NO";
    }
    id v26 = +[NSString stringWithUTF8String:v25];
    v50[3] = v26;
    uint64_t v27 = +[NSDictionary dictionaryWithObjects:v50 forKeys:v49 count:4];
    [v12 setObject:v27 forKeyedSubscript:@"Paths"];

    if (v11)
    {
    }
  }
  else
  {
    fwrite("𒁂  Paths\n", 0xCuLL, 1uLL, a1);
    id v18 = v31;
    fprintf(a1, "  𒁍  logical:     %s\n", (const char *)[v18 fileSystemRepresentation]);
    id v19 = v34;
    fprintf(a1, "  𒁍  physical:    %s\n", (const char *)[v19 fileSystemRepresentation]);
    if (v11)
    {
      id v20 = [v11 accountIdentifier];
      fprintf(a1, "  𒁍  account:     %s\n", (const char *)[v20 UTF8String]);
    }
    else
    {
      fprintf(a1, "  𒁍  account:     %s\n", "no account found");
    }
    if (v19) {
      unsigned int v21 = v19;
    }
    else {
      unsigned int v21 = v18;
    }
    unsigned int v22 = [v21 br_isInSyncedLocation];
    uint64_t v23 = "NO";
    if (v22) {
      uint64_t v23 = "YES";
    }
    fprintf(a1, "  𒁍  synced:      %s\n", v23);
    id v12 = 0;
  }
  id v28 = v34;
  id v29 = v31;
  id v30 = v12;
  BRPerformWithAccountDescriptor();
}

void sub_10000A4C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45)
{
}

void sub_10000A4F8(uint64_t a1)
{
  fputc(10, *(FILE **)(a1 + 56));
  uint64_t v208 = a1;
  int v5 = *(_DWORD *)(a1 + 64);
  if ((v5 & 8) == 0)
  {
    v149 = 0;
    if ((v5 & 0x20) != 0) {
      goto LABEL_37;
    }
LABEL_3:
    v164 = 0;
    if ((v5 & 0x40) != 0) {
      goto LABEL_169;
    }
LABEL_4:
    v203 = v164;
    if ((v5 & 0x80) != 0) {
      goto LABEL_193;
    }
    goto LABEL_5;
  }
  v262[0] = @"File Attributes";
  v261[0] = NSURLNameKey;
  v261[1] = NSURLLocalizedNameKey;
  v261[2] = NSURLTypeIdentifierKey;
  v261[3] = NSURLContentTypeKey;
  v261[4] = NSURLHasHiddenExtensionKey;
  v261[5] = NSURLIsHiddenKey;
  v261[6] = NSURLFileResourceTypeKey;
  v261[7] = NSURLIsPackageKey;
  v261[8] = NSURLIsAliasFileKey;
  v261[9] = NSURLFileSizeKey;
  v261[10] = NSURLTotalFileSizeKey;
  v261[11] = NSURLCreationDateKey;
  v261[12] = NSURLContentModificationDateKey;
  v261[13] = NSURLAttributeModificationDateKey;
  v261[14] = NSURLAddedToDirectoryDateKey;
  v261[15] = NSURLFileProtectionKey;
  v261[16] = NSURLDocumentIdentifierKey;
  v261[17] = NSURLThumbnailDictionaryKey;
  id v7 = +[NSArray arrayWithObjects:v261 count:18];
  v262[1] = @"Ubiquitous Attributes";
  v263[0] = v7;
  v260[0] = NSURLIsUbiquitousItemKey;
  v260[1] = NSURLUbiquitousItemContainerDisplayNameKey;
  v260[2] = NSURLUbiquitousItemHasUnresolvedConflictsKey;
  v260[3] = NSURLUbiquitousItemDownloadRequestedKey;
  v260[4] = NSURLUbiquitousItemIsDownloadingKey;
  v260[5] = NSURLUbiquitousItemIsUploadedKey;
  v260[6] = NSURLUbiquitousItemIsUploadingKey;
  v260[7] = NSURLUbiquitousItemDownloadingStatusKey;
  v260[8] = NSURLUbiquitousItemDownloadingErrorKey;
  v260[9] = NSURLUbiquitousItemUploadingErrorKey;
  uint64_t v8 = +[NSArray arrayWithObjects:v260 count:10];
  v263[1] = v8;
  v193 = +[NSDictionary dictionaryWithObjects:v263 forKeys:v262 count:2];

  long long v247 = 0u;
  long long v248 = 0u;
  long long v245 = 0u;
  long long v246 = 0u;
  id obj = [v193 allKeys];
  id v189 = [obj countByEnumeratingWithState:&v245 objects:v259 count:16];
  if (!v189)
  {
    v149 = 0;
    goto LABEL_36;
  }
  v149 = 0;
  uint64_t v185 = *(void *)v246;
  do
  {
    for (uint64_t i = 0; i != v189; uint64_t i = (char *)i + 1)
    {
      if (*(void *)v246 != v185) {
        objc_enumerationMutation(obj);
      }
      uint64_t v9 = *(void **)(*((void *)&v245 + 1) + 8 * i);
      if (*(unsigned char *)(v208 + 68))
      {
        id v10 = +[NSMutableDictionary dictionary];

        [*(id *)(v208 + 32) setObject:v10 forKeyedSubscript:v9];
      }
      else
      {
        fprintf(*(FILE **)(v208 + 56), "𒁂 %s\n", (const char *)[v9 UTF8String]);
        id v10 = v149;
      }
      id v11 = *(void **)(v208 + 40);
      id v12 = [v193 objectForKeyedSubscript:v9];
      id v244 = 0;
      id v13 = [v11 promisedItemResourceValuesForKeys:v12 error:&v244];
      id v204 = v244;

      if (v204 || !v13)
      {
        if (*(unsigned char *)(v208 + 68)) {
          goto LABEL_30;
        }
        unsigned int v25 = __stderrp;
        id v14 = [*(id *)(v208 + 40) path];
        id v26 = (const char *)[v14 fileSystemRepresentation];
        id v27 = [v204 description];
        fprintf(v25, "can't get attributes at '%s': %s\n", v26, (const char *)[v27 UTF8String]);
      }
      else
      {
        long long v242 = 0u;
        long long v243 = 0u;
        long long v240 = 0u;
        long long v241 = 0u;
        id v14 = [v193 objectForKeyedSubscript:v9];
        id v15 = [v14 countByEnumeratingWithState:&v240 objects:v258 count:16];
        if (v15)
        {
          id v3 = *(void **)v241;
          do
          {
            for (j = 0; j != v15; j = (char *)j + 1)
            {
              if (*(void **)v241 != v3) {
                objc_enumerationMutation(v14);
              }
              unsigned int v17 = *(void **)(*((void *)&v240 + 1) + 8 * (void)j);
              if (*(unsigned char *)(v208 + 68))
              {
                id v18 = [v13 objectForKeyedSubscript:*(void *)(*((void *)&v240 + 1) + 8 * (void)j)];
                id v19 = [v18 description];
                id v20 = [v19 stringByReplacingOccurrencesOfString:@"\"" withString:@"'"];

                unsigned int v21 = [v20 stringByReplacingOccurrencesOfString:@"\n" withString:@" "];

                id v1 = (FILE *)NSString;
                id v22 = v21;
                +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s", [v22 UTF8String]);
                id v2 = (id)objc_claimAutoreleasedReturnValue();
                [v10 setObject:v2 forKeyedSubscript:v17];
              }
              else
              {
                id v1 = *(FILE **)(v208 + 56);
                id v23 = v17;
                v24 = (const char *)[v23 UTF8String];
                id v22 = [v13 objectForKeyedSubscript:v23];
                id v2 = [v22 description];
                fprintf(v1, "  𒁍  %s: %s\n", v24, (const char *)[v2 UTF8String]);
              }
            }
            id v15 = [v14 countByEnumeratingWithState:&v240 objects:v258 count:16];
          }
          while (v15);
        }
      }

      if (*(unsigned char *)(v208 + 68))
      {
LABEL_30:

        v149 = 0;
        goto LABEL_32;
      }
      fputc(10, *(FILE **)(v208 + 56));
      v149 = v10;
LABEL_32:
    }
    id v189 = [obj countByEnumeratingWithState:&v245 objects:v259 count:16];
  }
  while (v189);
LABEL_36:

  int v5 = *(_DWORD *)(v208 + 64);
  if ((v5 & 0x20) == 0) {
    goto LABEL_3;
  }
LABEL_37:
  if (*(unsigned char *)(v208 + 68))
  {
    v164 = +[NSMutableArray array];
    [*(id *)(v208 + 32) setObject:v164 forKeyedSubscript:@"Versions"];
  }
  else
  {
    fwrite("𒁂  Versions\n", 0xFuLL, 1uLL, *(FILE **)(v208 + 56));
    v164 = 0;
  }
  uint64_t v234 = 0;
  v235 = &v234;
  uint64_t v236 = 0x3032000000;
  v237 = sub_10000C7C4;
  v238 = sub_10000C7D4;
  id v239 = objc_alloc_init((Class)NSMutableDictionary);
  id v28 = dispatch_group_create();
  dispatch_group_enter(v28);
  uint64_t v29 = *(void *)(v208 + 40);
  v230[0] = _NSConcreteStackBlock;
  v230[1] = 3221225472;
  v230[2] = sub_10000C7DC;
  v230[3] = &unk_100025058;
  char v233 = *(unsigned char *)(v208 + 68);
  v232 = &v234;
  id v30 = v28;
  v231 = v30;
  +[NSFileVersion getNonlocalVersionsOfItemAtURL:v29 completionHandler:v230];
  dispatch_time_t v31 = dispatch_time(0, 3000000000);
  dispatch_group_t group = v30;
  if (dispatch_group_wait(v30, v31))
  {
    if (!*(unsigned char *)(v208 + 68)) {
      fwrite("Fetching non local versions...\n", 0x1FuLL, 1uLL, __stderrp);
    }
    dispatch_time_t v32 = dispatch_time(0, 120000000000);
    if (dispatch_group_wait(v30, v32) && !*(unsigned char *)(v208 + 68)) {
      fwrite("Fetching non local versions timed out\n", 0x26uLL, 1uLL, __stderrp);
    }
  }
  v147 = +[NSFileVersion currentVersionOfItemAtURL:*(void *)(v208 + 40)];
  if (v147)
  {
    if (*(unsigned char *)(v208 + 68))
    {
      v256[0] = @"name";
      id v205 = [v147 localizedName];
      v199 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s", [v205 UTF8String]);
      v257[0] = v199;
      v256[1] = @"mtime";
      id v194 = [v147 modificationDate];
      id v190 = [v194 description];
      v186 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s", [v190 UTF8String]);
      v257[1] = v186;
      v256[2] = @"device";
      id obja = [v147 localizedNameOfSavingComputer];
      v178 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s", [obja UTF8String]);
      v257[2] = v178;
      v256[3] = @"path";
      v175 = [v147 URL];
      id v171 = [v175 path];
      +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s", [v171 fileSystemRepresentation]);
      v165 = (FILE *)objc_claimAutoreleasedReturnValue();
      v257[3] = v165;
      v256[4] = @"location";
      if ([v147 hasLocalContents]) {
        v33 = "local";
      }
      else {
        v33 = "remote";
      }
      id v163 = +[NSString stringWithUTF8String:v33];
      v257[4] = v163;
      v256[5] = @"conlict";
      if ([v147 isConflict]) {
        id v34 = "true";
      }
      else {
        id v34 = "false";
      }
      v162 = +[NSString stringWithUTF8String:v34];
      v257[5] = v162;
      v256[6] = @"resolved";
      if ([v147 isResolved]) {
        int v35 = "true";
      }
      else {
        int v35 = "false";
      }
      id v36 = +[NSString stringWithUTF8String:v35];
      v257[6] = v36;
      v256[7] = @"thumbnail";
      if ([v147 hasThumbnail]) {
        id v37 = "true";
      }
      else {
        id v37 = "false";
      }
      long long v38 = +[NSString stringWithUTF8String:v37];
      v257[7] = v38;
      v256[8] = @"etag";
      long long v39 = (void *)v235[5];
      long long v40 = [v147 persistentIdentifier];
      long long v41 = [v39 objectForKeyedSubscript:v40];
      if (v41)
      {
        id v42 = (void *)v235[5];
        id v3 = [v147 persistentIdentifier];
        id v1 = [v42 objectForKeyedSubscript:v3];
        id v2 = [(FILE *)v1 etag];
        +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s", [v2 UTF8String]);
        uint64_t v43 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        uint64_t v43 = &stru_100026380;
      }
      v257[8] = v43;
      v56 = +[NSDictionary dictionaryWithObjects:v257 forKeys:v256 count:9];
      [v164 addObject:v56];

      if (v41)
      {
      }
    }
    else
    {
      v172 = *(FILE **)(v208 + 56);
      id v205 = [v147 localizedName];
      v166 = (FILE *)[v205 UTF8String];
      v199 = [v147 modificationDate];
      id v194 = [v199 description];
      id v163 = [v194 UTF8String];
      id v190 = [v147 localizedNameOfSavingComputer];
      v44 = (const char *)[v190 UTF8String];
      v186 = [v147 URL];
      id obja = [v186 path];
      uint64_t v45 = (const char *)[obja fileSystemRepresentation];
      if ([v147 hasLocalContents]) {
        v46 = "local";
      }
      else {
        v46 = "remote";
      }
      if ([v147 isConflict]) {
        id v47 = "|conflict";
      }
      else {
        id v47 = "";
      }
      if ([v147 isResolved]) {
        id v48 = "|resolved";
      }
      else {
        id v48 = "";
      }
      if ([v147 hasThumbnail]) {
        v49 = "|thumbnail";
      }
      else {
        v49 = "";
      }
      id v50 = (void *)v235[5];
      v178 = [v147 persistentIdentifier];
      v175 = [v50 objectForKeyedSubscript:v178];
      if (v175)
      {
        v51 = (void *)v235[5];
        id v52 = [v147 persistentIdentifier];
        v53 = [v51 objectForKeyedSubscript:v52];
        id v54 = [v53 etag];
        id v55 = [@" etag:" stringByAppendingString:v54];
        fprintf(v172, "  𒁍  <NSFileVersion name:\"%s\"\n      mtime:%s device:\"%s\"\n      path:\"%s\"\n      %s%s%s%s%s>\n", (const char *)v166, (const char *)v163, v44, v45, v46, v47, v48, v49, (const char *)[v55 UTF8String]);
      }
      else
      {
        fprintf(v172, "  𒁍  <NSFileVersion name:\"%s\"\n      mtime:%s device:\"%s\"\n      path:\"%s\"\n      %s%s%s%s%s>\n", (const char *)v166, (const char *)v163, v44, v45, v46, v47, v48, v49, "");
      }
    }
  }
  v57 = +[NSFileVersion otherVersionsOfItemAtURL:*(void *)(v208 + 40)];
  v58 = [v57 sortedArrayUsingSelector:"modificationDate"];

  long long v228 = 0u;
  long long v229 = 0u;
  long long v226 = 0u;
  long long v227 = 0u;
  id v148 = v58;
  id v158 = [v148 countByEnumeratingWithState:&v226 objects:v255 count:16];
  if (v158)
  {
    uint64_t v156 = *(void *)v227;
    do
    {
      v206 = 0;
      do
      {
        if (*(void *)v227 != v156) {
          objc_enumerationMutation(v148);
        }
        id v59 = *(void **)(*((void *)&v226 + 1) + 8 * (void)v206);
        if (*(unsigned char *)(v208 + 68))
        {
          v253[0] = @"name";
          id v200 = [v59 localizedName];
          v195 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s", [v200 UTF8String]);
          v254[0] = v195;
          v253[1] = @"mtime";
          id v191 = [v59 modificationDate];
          id v187 = [v191 description];
          +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s", [v187 UTF8String]);
          id objb = (id)objc_claimAutoreleasedReturnValue();
          v254[1] = objb;
          v253[2] = @"device";
          id v179 = [v59 localizedNameOfSavingComputer];
          v176 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s", [v179 UTF8String]);
          v254[2] = v176;
          v253[3] = @"path";
          v173 = [v59 URL];
          v167 = [v173 path];
          v60 = +[NSString stringWithFormat:@"%s", [(FILE *)v167 fileSystemRepresentation]];
          v254[3] = v60;
          v253[4] = @"location";
          if ([v59 hasLocalContents]) {
            id v61 = "local";
          }
          else {
            id v61 = "remote";
          }
          id v62 = +[NSString stringWithUTF8String:v61];
          v254[4] = v62;
          v253[5] = @"conlict";
          if ([v59 isConflict]) {
            id v63 = "true";
          }
          else {
            id v63 = "false";
          }
          id v64 = +[NSString stringWithUTF8String:v63];
          v254[5] = v64;
          v253[6] = @"resolved";
          if ([v59 isResolved]) {
            v65 = "true";
          }
          else {
            v65 = "false";
          }
          v66 = +[NSString stringWithUTF8String:v65];
          v254[6] = v66;
          v253[7] = @"thumbnail";
          if ([v59 hasThumbnail]) {
            id v67 = "true";
          }
          else {
            id v67 = "false";
          }
          id v68 = +[NSString stringWithUTF8String:v67];
          v254[7] = v68;
          v253[8] = @"etag";
          v69 = (void *)v235[5];
          v70 = [v59 persistentIdentifier];
          v71 = [v69 objectForKeyedSubscript:v70];
          if (v71)
          {
            v72 = (void *)v235[5];
            id v163 = [v59 persistentIdentifier];
            v162 = [v72 objectForKeyedSubscript:v163];
            id v161 = [v162 etag];
            +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s", [v161 UTF8String]);
            v160 = (__CFString *)objc_claimAutoreleasedReturnValue();
            CFStringRef v73 = v160;
          }
          else
          {
            CFStringRef v73 = &stru_100026380;
          }
          v254[8] = v73;
          id v85 = +[NSDictionary dictionaryWithObjects:v254 forKeys:v253 count:9];
          [v164 addObject:v85];

          if (v71)
          {
          }
        }
        else
        {
          v168 = *(FILE **)(v208 + 56);
          id v200 = [v59 localizedName];
          v154 = (const char *)[v200 UTF8String];
          v195 = [v59 modificationDate];
          id v191 = [v195 description];
          v152 = (const char *)[v191 UTF8String];
          id v187 = [v59 localizedNameOfSavingComputer];
          v150 = (const char *)[v187 UTF8String];
          id objb = [v59 URL];
          id v179 = [objb path];
          id v74 = (const char *)[v179 fileSystemRepresentation];
          if ([v59 hasLocalContents]) {
            v75 = "local";
          }
          else {
            v75 = "remote";
          }
          if ([v59 isConflict]) {
            id v76 = "|conflict";
          }
          else {
            id v76 = "";
          }
          if ([v59 isResolved]) {
            id v77 = "|resolved";
          }
          else {
            id v77 = "";
          }
          if ([v59 hasThumbnail]) {
            v78 = "|thumbnail";
          }
          else {
            v78 = "";
          }
          id v79 = (void *)v235[5];
          v176 = [v59 persistentIdentifier];
          v173 = [v79 objectForKeyedSubscript:v176];
          if (v173)
          {
            id v80 = (void *)v235[5];
            v81 = [v59 persistentIdentifier];
            v82 = [v80 objectForKeyedSubscript:v81];
            id v83 = [v82 etag];
            id v84 = [@" etag:" stringByAppendingString:v83];
            fprintf(v168, "  𒁍  <NSFileVersion name:\"%s\"\n      mtime:%s device:\"%s\"\n      path:\"%s\"\n      %s%s%s%s%s>\n", v154, v152, v150, v74, v75, v76, v77, v78, (const char *)[v84 UTF8String]);
          }
          else
          {
            fprintf(v168, "  𒁍  <NSFileVersion name:\"%s\"\n      mtime:%s device:\"%s\"\n      path:\"%s\"\n      %s%s%s%s%s>\n", v154, v152, v150, v74, v75, v76, v77, v78, "");
          }
        }

        v206 = (char *)v206 + 1;
      }
      while (v158 != v206);
      id v86 = [v148 countByEnumeratingWithState:&v226 objects:v255 count:16];
      id v158 = v86;
    }
    while (v86);
  }

  long long v224 = 0u;
  long long v225 = 0u;
  long long v222 = 0u;
  long long v223 = 0u;
  id v151 = [(id)v235[5] allValues];
  id v159 = [v151 countByEnumeratingWithState:&v222 objects:v252 count:16];
  if (v159)
  {
    uint64_t v157 = *(void *)v223;
    do
    {
      v207 = 0;
      do
      {
        if (*(void *)v223 != v157) {
          objc_enumerationMutation(v151);
        }
        v87 = *(void **)(*((void *)&v222 + 1) + 8 * (void)v207);
        if (*(unsigned char *)(v208 + 68))
        {
          v250[0] = @"name";
          id v201 = [v87 localizedName];
          v196 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s", [v201 UTF8String]);
          v251[0] = v196;
          v250[1] = @"mtime";
          id v192 = [v87 modificationDate];
          id v188 = [v192 description];
          +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s", [v188 UTF8String]);
          id objc = (id)objc_claimAutoreleasedReturnValue();
          v251[1] = objc;
          v250[2] = @"device";
          id v180 = [v87 localizedNameOfSavingComputer];
          v177 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s", [v180 UTF8String]);
          v251[2] = v177;
          v250[3] = @"path";
          v174 = [v87 URL];
          v169 = [v174 path];
          id v88 = +[NSString stringWithFormat:@"%s", [(FILE *)v169 fileSystemRepresentation]];
          v251[3] = v88;
          v250[4] = @"location";
          if ([v87 hasLocalContents]) {
            id v89 = "local";
          }
          else {
            id v89 = "remote";
          }
          id v90 = +[NSString stringWithUTF8String:v89];
          v251[4] = v90;
          v250[5] = @"conlict";
          if ([v87 isConflict]) {
            id v91 = "true";
          }
          else {
            id v91 = "false";
          }
          id v92 = +[NSString stringWithUTF8String:v91];
          v251[5] = v92;
          v250[6] = @"resolved";
          if ([v87 isResolved]) {
            id v93 = "true";
          }
          else {
            id v93 = "false";
          }
          v94 = +[NSString stringWithUTF8String:v93];
          v251[6] = v94;
          v250[7] = @"thumbnail";
          if ([v87 hasThumbnail]) {
            uint64_t v95 = "true";
          }
          else {
            uint64_t v95 = "false";
          }
          uint64_t v96 = +[NSString stringWithUTF8String:v95];
          v251[7] = v96;
          v250[8] = @"etag";
          uint64_t v97 = (void *)v235[5];
          uint64_t v98 = [v87 persistentIdentifier];
          uint64_t v99 = [v97 objectForKeyedSubscript:v98];
          if (v99)
          {
            uint64_t v100 = (void *)v235[5];
            id v163 = [v87 persistentIdentifier];
            v162 = [v100 objectForKeyedSubscript:v163];
            id v161 = [v162 etag];
            +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s", [v161 UTF8String]);
            v160 = (__CFString *)objc_claimAutoreleasedReturnValue();
            CFStringRef v101 = v160;
          }
          else
          {
            CFStringRef v101 = &stru_100026380;
          }
          v251[8] = v101;
          v114 = +[NSDictionary dictionaryWithObjects:v251 forKeys:v250 count:9];
          [v164 addObject:v114];

          if (v99)
          {
          }
        }
        else
        {
          v170 = *(FILE **)(v208 + 56);
          id v201 = [v87 localizedName];
          v155 = (const char *)[v201 UTF8String];
          v196 = [v87 modificationDate];
          id v192 = [v196 description];
          v153 = (const char *)[v192 UTF8String];
          id v188 = [v87 localizedNameOfSavingComputer];
          uint64_t v102 = (const char *)[v188 UTF8String];
          id objc = [v87 URL];
          id v180 = [objc path];
          uint64_t v103 = (const char *)[v180 fileSystemRepresentation];
          if ([v87 hasLocalContents]) {
            v104 = "local";
          }
          else {
            v104 = "remote";
          }
          if ([v87 isConflict]) {
            v105 = "|conflict";
          }
          else {
            v105 = "";
          }
          if ([v87 isResolved]) {
            id v106 = "|resolved";
          }
          else {
            id v106 = "";
          }
          if ([v87 hasThumbnail]) {
            v107 = "|thumbnail";
          }
          else {
            v107 = "";
          }
          unsigned int v108 = (void *)v235[5];
          v177 = [v87 persistentIdentifier];
          v174 = [v108 objectForKeyedSubscript:v177];
          if (v174)
          {
            unsigned int v109 = (void *)v235[5];
            unsigned int v110 = [v87 persistentIdentifier];
            id v111 = [v109 objectForKeyedSubscript:v110];
            char v112 = [v111 etag];
            id v113 = [@" etag:" stringByAppendingString:v112];
            fprintf(v170, "  𒁍  <NSFileVersion name:\"%s\"\n      mtime:%s device:\"%s\"\n      path:\"%s\"\n      %s%s%s%s%s>\n", v155, v153, v102, v103, v104, v105, v106, v107, (const char *)[v113 UTF8String]);
          }
          else
          {
            fprintf(v170, "  𒁍  <NSFileVersion name:\"%s\"\n      mtime:%s device:\"%s\"\n      path:\"%s\"\n      %s%s%s%s%s>\n", v155, v153, v102, v103, v104, v105, v106, v107, "");
          }
        }

        v207 = (char *)v207 + 1;
      }
      while (v159 != v207);
      id v115 = [v151 countByEnumeratingWithState:&v222 objects:v252 count:16];
      id v159 = v115;
    }
    while (v115);
  }

  if (*(unsigned char *)(v208 + 68))
  {

    v164 = 0;
  }
  else
  {
    fputc(10, *(FILE **)(v208 + 56));
  }

  _Block_object_dispose(&v234, 8);
  int v5 = *(_DWORD *)(v208 + 64);
  if ((v5 & 0x40) == 0) {
    goto LABEL_4;
  }
LABEL_169:
  if (*(unsigned char *)(v208 + 68))
  {
    v203 = +[NSMutableArray array];

    [*(id *)(v208 + 32) setObject:v203 forKeyedSubscript:@"Thumbnail"];
  }
  else
  {
    fwrite("𒁂  Thumbnail\n", 0x10uLL, 1uLL, *(FILE **)(v208 + 56));
    v203 = v164;
  }
  v116 = +[GSStorageManager manager];
  int v117 = BRIsFPFSEnabled();
  uint64_t v118 = 48;
  if (v117) {
    uint64_t v118 = 40;
  }
  uint64_t v119 = *(void *)(v208 + v118);
  id v221 = 0;
  v202 = [v116 permanentStorageForItemAtURL:v119 allocateIfNone:0 error:&v221];
  id v197 = v221;

  if (v197 || !v202)
  {
    if (!*(unsigned char *)(v208 + 68))
    {
      v129 = __stderrp;
      id v120 = [*(id *)(v208 + 40) path];
      long long v130 = (const char *)[v120 fileSystemRepresentation];
      id v131 = [v197 description];
      fprintf(v129, "can't get thumbnails at '%s': %s\n", v130, (const char *)[v131 UTF8String]);

      goto LABEL_189;
    }
LABEL_190:

    v203 = 0;
  }
  else
  {
    id v120 = [v202 enumeratorForAdditionsInNameSpace:@"com.apple.thumbnails" withOptions:0 withoutOptions:0 ordering:0xFFFFFFFFLL];
    long long v220 = 0u;
    long long v218 = 0u;
    long long v219 = 0u;
    long long v217 = 0u;
    id v121 = [v120 countByEnumeratingWithState:&v217 objects:v249 count:16];
    if (v121)
    {
      uint64_t v122 = *(void *)v218;
      do
      {
        for (k = 0; k != v121; k = (char *)k + 1)
        {
          if (*(void *)v218 != v122) {
            objc_enumerationMutation(v120);
          }
          unsigned int v124 = *(void **)(*((void *)&v217 + 1) + 8 * (void)k);
          if (*(unsigned char *)(v208 + 68))
          {
            v125 = [v124 url];
            id v126 = [v125 path];
            v127 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s", [v126 UTF8String]);
            [v203 addObject:v127];
          }
          else
          {
            uint64_t v128 = *(FILE **)(v208 + 56);
            v125 = [v124 url];
            id v126 = [v125 path];
            fprintf(v128, "  𒁍  thumbnail: %s\n", (const char *)[v126 UTF8String]);
          }
        }
        id v121 = [v120 countByEnumeratingWithState:&v217 objects:v249 count:16];
      }
      while (v121);
    }
LABEL_189:

    if (*(unsigned char *)(v208 + 68)) {
      goto LABEL_190;
    }
    fputc(10, *(FILE **)(v208 + 56));
  }

  if ((*(_DWORD *)(v208 + 64) & 0x80) == 0)
  {
LABEL_5:
    id v6 = v149;
    goto LABEL_205;
  }
LABEL_193:
  if (*(unsigned char *)(v208 + 68))
  {
    id v6 = +[NSMutableDictionary dictionary];

    [*(id *)(v208 + 32) setObject:v6 forKeyedSubscript:@"Lookup"];
  }
  else
  {
    fwrite("𒁂  Lookup\n", 0xDuLL, 1uLL, *(FILE **)(v208 + 56));
    id v6 = v149;
  }
  if (!BRIsFPFSEnabled())
  {
    long long v132 = sub_100009C9C();
    dispatch_semaphore_t v133 = dispatch_semaphore_create(0);
    long long v134 = [*(id *)(v208 + 40) path];
    v210[0] = _NSConcreteStackBlock;
    v210[1] = 3221225472;
    v210[2] = sub_10000C96C;
    v210[3] = &unk_100025080;
    char v216 = *(unsigned char *)(v208 + 68);
    id v211 = *(id *)(v208 + 48);
    id v135 = v132;
    id v212 = v135;
    id v6 = v6;
    uint64_t v136 = *(void *)(v208 + 56);
    id v213 = v6;
    uint64_t v215 = v136;
    long long v137 = v133;
    v214 = v137;
    [v135 gatherInformationForPath:v134 reply:v210];

    dispatch_time_t v138 = dispatch_time(0, 30000000000);
    if (dispatch_semaphore_wait(v137, v138))
    {
      if (*(unsigned char *)(v208 + 68)) {
        goto LABEL_203;
      }
      v139 = __stderrp;
      id v140 = [*(id *)(v208 + 48) path];
      fprintf(v139, "timed out getting lookup info at '%s'\n", (const char *)[v140 fileSystemRepresentation]);
    }
    if (!*(unsigned char *)(v208 + 68))
    {
LABEL_204:

      goto LABEL_205;
    }
LABEL_203:

    id v6 = 0;
    goto LABEL_204;
  }
  if (!*(unsigned char *)(v208 + 68)) {
    fwrite("NOT IMPLEMENTED IN FPFS\n", 0x18uLL, 1uLL, *(FILE **)(v208 + 56));
  }
LABEL_205:
  if (*(unsigned char *)(v208 + 68))
  {
    uint64_t v141 = *(void *)(v208 + 32);
    id v209 = 0;
    v142 = +[NSJSONSerialization jsonStringFromDictionary:v141 options:1 error:&v209];
    id v143 = v209;
    if (v143) {
      sub_100016E04(v143);
    }
    v144 = *(FILE **)(v208 + 56);
    id v145 = v142;
    fputs((const char *)[v145 UTF8String], v144);
  }
}

void sub_10000C784(_Unwind_Exception *a1)
{
}

uint64_t sub_10000C7C4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10000C7D4(uint64_t a1)
{
}

void sub_10000C7DC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v6)
  {
    if (!*(unsigned char *)(a1 + 48))
    {
      uint64_t v8 = __stderrp;
      id v9 = [v6 description];
      fprintf(v8, "Unable to list versions: %s\n", (const char *)[v9 UTF8String]);
    }
  }
  else
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v10 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v11; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v18 != v12) {
            objc_enumerationMutation(v5);
          }
          id v14 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          id v15 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
          unsigned int v16 = [v14 persistentIdentifier];
          [v15 setObject:v14 forKeyedSubscript:v16];
        }
        id v11 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v11);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_10000C96C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  unsigned int v25 = v6;
  if (!v5 || v6)
  {
    if (!*(unsigned char *)(a1 + 72))
    {
      long long v20 = __stderrp;
      id v21 = [*(id *)(a1 + 32) path];
      id v22 = (const char *)[v21 fileSystemRepresentation];
      id v23 = [*(id *)(a1 + 40) error];
      id v24 = [v23 description];
      fprintf(v20, "failed getting lookup info at '%s': %s\n", v22, (const char *)[v24 UTF8String]);
    }
  }
  else
  {
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v7 = [&off_100027F90 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v8; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v27 != v9) {
            objc_enumerationMutation(&off_100027F90);
          }
          id v11 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          uint64_t v12 = [v5 objectForKeyedSubscript:v11];

          if (v12)
          {
            if (*(unsigned char *)(a1 + 72))
            {
              id v13 = [v5 objectForKeyedSubscript:v11];
              id v14 = [v13 stringByReplacingOccurrencesOfString:@"\"" withString:@"'"];

              id v15 = v14;
              unsigned int v16 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s", [v15 UTF8String]);
              [*(id *)(a1 + 48) setObject:v16 forKeyedSubscript:v11];
            }
            else
            {
              long long v17 = *(FILE **)(a1 + 64);
              id v18 = v11;
              long long v19 = (const char *)[v18 UTF8String];
              id v15 = [v5 objectForKeyedSubscript:v18];
              fprintf(v17, "  𒁍  %s: %s\n", v19, (const char *)[v15 UTF8String]);
            }
          }
        }
        id v8 = [&off_100027F90 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v8);
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));
}

uint64_t sub_10000CE8C()
{
  v0 = getprogname();
  printf("Usage: %s <command> [command-options and arguments]\n", v0);
  putchar(10);
  puts("    -h,--help            show this help");
  putchar(10);
  puts("COMMANDS");
  putchar(10);
  sub_1000168AC();
  sub_100005D70();
  puts("dump [options] [<container>]");
  puts("    dump the CloudDocs database");
  putchar(10);
  puts("    -o,--output=<file-path>");
  puts("                         redirect output to <file-path>");
  puts("    -d,--database-path=<db-path>");
  puts("                         Use the database at <db-path>");
  puts("    -e,--enterprise");
  puts("                         Use the Data Separated database");
  puts("    -i,--itemless");
  puts("                         Don't dump items from the db");
  puts("    -u,--upgrade");
  puts("                         Upgrade the db if necessary before dumping");
  puts("    -v,--verbose");
  puts("                         Be verbose when dumping the database");
  putchar(10);
  puts("    [<container>]        the container to be dumped");
  putchar(10);
  puts("status [<containers>]");
  puts("    Prints items which haven't been completely synced up / applied to disk");
  putchar(10);
  puts("    [<container>]        the container to be dumped");
  putchar(10);
  puts("accounts [options]");
  puts("    Displays iCloudDrive eligible accounts and their logged in/out status and directory name");
  puts("    -w,--wait            wait for logged in accounts to load");
  putchar(10);
  puts("quota");
  puts("    Displays the available quota in the account");
  putchar(10);
  sub_1000092BC();
  puts("spotlight [<command>]");
  putchar(10);
  puts("    enable                enables spotlight indexing");
  puts("    disable               disables spotlight indexing");
  putchar(10);
  return 64;
}

BOOL sub_10000D088(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = +[NSFileManager defaultManager];
  id v26 = 0;
  unsigned __int8 v6 = [v5 setAttributes:v4 ofItemAtPath:v3 error:&v26];
  id v7 = v26;
  if (v6)
  {
    id v8 = [v5 enumeratorAtPath:v3];
    id v9 = 0;
    while (1)
    {
      id v10 = v9;
      id v9 = [v8 nextObject];

      BOOL v11 = v9 == 0;
      if (!v9) {
        break;
      }
      uint64_t v12 = [v3 stringByAppendingPathComponent:v9];
      id v25 = v7;
      unsigned __int8 v13 = [v5 setAttributes:v4 ofItemAtPath:v12 error:&v25];
      id v14 = v25;

      id v7 = v14;
      if ((v13 & 1) == 0)
      {
        id v24 = __stderrp;
        id v15 = [v4 description];
        id v23 = (const char *)[v15 UTF8String];
        id v16 = [v9 description];
        long long v17 = (const char *)[v16 UTF8String];
        id v18 = [v14 description];
        fprintf(v24, "Unable to set attributes (attributes: %s, path: %s, error: %s).", v23, v17, (const char *)[v18 UTF8String]);

        id v7 = v14;
        goto LABEL_7;
      }
    }
  }
  else
  {
    long long v19 = __stderrp;
    id v8 = [v4 description];
    long long v20 = (const char *)[v8 UTF8String];
    id v9 = [v3 description];
    id v21 = (const char *)[v9 UTF8String];
    id v15 = [v7 description];
    fprintf(v19, "Unable to set attributes (attributes: %s, path: %s, error: %s).", v20, v21, (const char *)[v15 UTF8String]);
LABEL_7:

    BOOL v11 = 0;
  }

  return v11;
}

uint64_t sub_10000D2C4()
{
  return 1;
}

uint64_t sub_10000D2CC(const char *a1, int a2)
{
  *(_OWORD *)BOOL v11 = xmmword_10001B5C0;
  uint64_t v12 = 0;
  size_t size = 0;
  uint64_t v4 = sysctl(v11, 3u, 0, &size, 0, 0);
  if (!v4)
  {
    id v5 = (char *)malloc_type_malloc(size, 0xC204E11AuLL);
    uint64_t v4 = sysctl(v11, 3u, v5, &size, 0, 0);
    if (!v4)
    {
      if (size >= 0x288)
      {
        size_t v6 = size / 0x288;
        id v7 = v5 + 243;
        uint64_t v4 = 0xFFFFFFFFLL;
        do
        {
          pid_t v8 = *(_DWORD *)(v7 - 203);
          if (v8 >= 1 && !strncmp(a1, v7, 0x10uLL)) {
            uint64_t v4 = kill(v8, a2);
          }
          v7 += 648;
          --v6;
        }
        while (v6);
      }
      else
      {
        uint64_t v4 = 0xFFFFFFFFLL;
      }
    }
    free(v5);
  }
  return v4;
}

id sub_10000D430(const char *a1)
{
  *(_OWORD *)unsigned __int8 v13 = xmmword_10001B5C0;
  uint64_t v14 = 0;
  size_t size = 0;
  id v2 = 0;
  if (!sysctl(v13, 3u, 0, &size, 0, 0))
  {
    id v3 = (int *)malloc_type_malloc(size, 0xD8CE6780uLL);
    id v2 = 0;
    if (!sysctl(v13, 3u, v3, &size, 0, 0))
    {
      if (size >= 0x288)
      {
        id v2 = 0;
        size_t v4 = size / 0x288;
        id v5 = v3 + 10;
        do
        {
          uint64_t v6 = *v5;
          if ((v6 & 0x80000000) == 0 && (proc_pidpath(*v5, buffer, 0x400u) & 0x80000000) == 0)
          {
            id v7 = strrchr(buffer, 47);
            pid_t v8 = v7 ? v7 + 1 : buffer;
            if (!strcmp(v8, a1))
            {
              if (!v2) {
                id v2 = objc_opt_new();
              }
              id v9 = +[NSNumber numberWithInt:v6];
              [v2 addObject:v9];
            }
          }
          v5 += 162;
          --v4;
        }
        while (v4);
      }
      else
      {
        id v2 = 0;
      }
    }
    free(v3);
  }

  return v2;
}

uint64_t sub_10000D5F4()
{
  if (qword_10002A920 != -1) {
    dispatch_once(&qword_10002A920, &stru_1000250C8);
  }
  return dword_10002A918;
}

void sub_10000D638(id a1)
{
  uid_t v1 = getuid();
  if (!v1) {
    uid_t v1 = getuid();
  }
  if (v1 == -101) {
    int v2 = 0;
  }
  else {
    int v2 = v1;
  }
  dword_10002A918 = v2;
}

uint64_t start(unsigned int a1, char *const *a2)
{
  unsigned int v9 = a1;
  pid_t v8 = (const char **)a2;
  getpid();
  if (sandbox_check()) {
    sub_100016E54();
  }
  int v3 = MKBDeviceUnlockedSinceBoot();
  if (v3 < 0) {
    errx(70, "We can't figure out if the device is unlocked: error %d", v3);
  }
  if (!v3) {
    sub_100016E38();
  }
  setenv("POSIXLY_CORRECT", "1", 1);
  if (os_variant_has_internal_content()) {
    execv("/usr/local/bin/brctl_internal", a2);
  }
  sub_100009A00((int *)&v9, (char *const **)&v8, "h", (const option *)&off_1000250E8, &stru_100025168);
  uint64_t v4 = v9;
  if ((int)v9 <= 0)
  {
    sub_10000CE8C();
    exit(64);
  }
  id v5 = v8;
  uint64_t v6 = (&off_100025188)[2 * sub_100009910(*v8, (const char **)&off_100025188) + 1];

  return ((uint64_t (*)(uint64_t, const char **))v6)(v4, v5);
}

void sub_10000D788(id a1, int a2, const char *a3)
{
  if (a2 == 104) {
    sub_1000099E8();
  }
}

void sub_10000D7A4(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 64) && ([*(id *)(a1 + 32) isDataSeparated] & 1) == 0)
  {
    int v2 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"HOME"];
    if (*(unsigned char *)(a1 + 64))
    {
      uint64_t v3 = NSHomeDirectoryForUser(@"mobile");

      int v2 = (void *)v3;
    }
  }
  else
  {
    int v2 = +[NSString br_currentHomeDir];
  }
  uint64_t v4 = +[NSURL fileURLWithPath:v2];
  id v6 = 0;
  [v4 getResourceValue:&v6 forKey:NSURLVolumeIdentifierKey error:0];
  id v5 = v6;

  if ([*(id *)(a1 + 48) isEqual:v5]) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), *(id *)(a1 + 32));
  }
}

uint64_t sub_10000D8AC(int a1, char *const *a2)
{
  int v95 = a1;
  v94 = (const char **)a2;
  uint64_t v90 = 0;
  id v91 = &v90;
  uint64_t v92 = 0x2020000000;
  uint64_t v93 = 0;
  uint64_t v84 = 0;
  id v85 = &v84;
  uint64_t v86 = 0x3032000000;
  v87 = sub_10000C7C4;
  id v88 = sub_10000C7D4;
  id v89 = 0;
  char v83 = 0;
  uint64_t v79 = 0;
  id v80 = &v79;
  uint64_t v81 = 0x2020000000;
  char v82 = 1;
  uint64_t v75 = 0;
  id v76 = &v75;
  uint64_t v77 = 0x2020000000;
  char v78 = 0;
  uint64_t v71 = 0;
  v72 = &v71;
  uint64_t v73 = 0x2020000000;
  char v74 = 0;
  uint64_t v67 = 0;
  id v68 = &v67;
  uint64_t v69 = 0x2020000000;
  char v70 = 0;
  uint64_t v63 = 0;
  id v64 = &v63;
  uint64_t v65 = 0x2020000000;
  char v66 = 0;
  v62[0] = _NSConcreteStackBlock;
  v62[1] = 3221225472;
  v62[2] = sub_10000FB64;
  v62[3] = &unk_1000253A8;
  v62[4] = &v90;
  v62[5] = &v84;
  v62[6] = &v79;
  v62[7] = &v75;
  v62[8] = &v71;
  v62[9] = &v67;
  v62[10] = &v63;
  sub_100009A00(&v95, (char *const **)&v94, "d:o:iuefv", (const option *)&off_1000252A0, v62);
  if (!v85[5]) {
    *((unsigned char *)v76 + 24) = 0;
  }
  uint64_t v2 = sub_10000FCA4((const char *)v91[3], &v83);
  uint64_t v3 = (void *)qword_10002A928;
  qword_10002A928 = v2;

  if (v95 < 1 || (uint64_t v4 = *v94, !strcmp(*v94, "all")))
  {
    v49 = 0;
  }
  else
  {
    v49 = +[NSString stringWithUTF8String:v4];
  }
  if ([ (id) v85[5] fileSystemRepresentation])
  {
    id v5 = (const char *)[ (id) v85[5] fileSystemRepresentation];
  }
  else
  {
    id v6 = +[UIDevice currentDevice];
    id v7 = [v6 name];
    id v5 = (const char *)[v7 UTF8String];
  }
  if (!*((unsigned char *)v68 + 24))
  {
    int v8 = [(id)qword_10002A928 fileDescriptor];
    unsigned int v9 = *v94;
    if (!*v94) {
      unsigned int v9 = "all";
    }
    dprintf(v8, "brctl: dumping\n    containers:   <%s>\n    from:         %s\n", v9, v5);
    if (!v85[5])
    {
      int v10 = [(id)qword_10002A928 fileDescriptor];
      int v11 = BRIsFPFSEnabled();
      uint64_t v12 = "Disabled";
      if (v11) {
        uint64_t v12 = "Enabled";
      }
      dprintf(v10, "    FPFS Feature: %s\n", v12);
    }
  }
  if (v85[5])
  {
    +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:");
    id v50 = (id)objc_claimAutoreleasedReturnValue();
    unsigned __int8 v13 = [v50 URLByAppendingPathComponent:@"client.db"];
    id v14 = objc_alloc_init((Class)PQLConnection);
    id v96 = 0;
    unsigned __int8 v15 = [v14 openAtURL:v13 withFlags:1 error:&v96];
    id v16 = v96;
    if ((v15 & 1) == 0) {
      goto LABEL_52;
    }
    long long v17 = [v14 userVersion];
    id v18 = brc_bread_crumbs();
    long long v19 = brc_default_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      uint64_t v99 = v13;
      __int16 v100 = 2112;
      CFStringRef v101 = v17;
      __int16 v102 = 2112;
      uint64_t v103 = v18;
      _os_log_debug_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "[DEBUG] Database version of %@ is %@%@", buf, 0x20u);
    }

    [v14 close:0];
    uint64_t v20 = (uint64_t)[v17 longLongValue];
    id v21 = off_10002A8D8;
    if (v20 >= 30000) {
      id v21 = &off_10002A8E0;
    }
    id v22 = (*v21)();

    id v23 = [v22 sessionForDumpingDatabasesAtURL:v50];

    uint64_t v24 = *((unsigned __int8 *)v76 + 24);
    id v61 = 0;
    unsigned __int8 v25 = [v23 initializeOfflineDatabaseWhileUpgrading:v24 loadClientState:1 forDBDump:1 error:&v61];
    id v26 = v61;
    id v16 = v26;
    if ((v25 & 1) == 0)
    {
LABEL_52:
      [v16 description];
      [ objc_claimAutoreleasedReturnValue() UTF8String];
      errx(1, "Unable to open database: %s");
    }
    if (*((unsigned char *)v68 + 24))
    {
      id v59 = v26;
      unsigned __int8 v27 = [v23 dumpFPFSMigrationStatusToFileHandle:qword_10002A928 tracker:0 includeNonMigratedItems:0 error:&v59];
      long long v28 = (__CFString *)v59;

      if ((v27 & 1) == 0)
      {
        [(__CFString *)v28 description];
        [ objc_claimAutoreleasedReturnValue() UTF8String];
        errx(1, "Unable to dump FPFS migration status: %s");
      }
    }
    else
    {
      uint64_t v39 = *((unsigned __int8 *)v80 + 24);
      uint64_t v40 = *((unsigned __int8 *)v64 + 24);
      id v60 = v26;
      unsigned __int8 v41 = [v23 dumpDatabaseToFileHandle:qword_10002A928 zoneName:v49 includeAllItems:v39 verbose:v40 tracker:0 error:&v60];
      long long v28 = (__CFString *)v60;

      if ((v41 & 1) == 0)
      {
        [(__CFString *)v28 description];
        [ objc_claimAutoreleasedReturnValue() UTF8String];
        errx(1, "Unable to dump database: %s");
      }
    }
    goto LABEL_49;
  }
  if (*((unsigned char *)v68 + 24)) {
    CFStringRef v29 = @"FPFS Migration Status";
  }
  else {
    CFStringRef v29 = @"database";
  }
  id v50 = +[NSString stringWithFormat:@"Unable to dump %@", v29];
  if (!*((unsigned char *)v72 + 24))
  {
    long long v28 = @"__defaultPersonaID__";
LABEL_45:
    id v42 = sub_100009BE0();
    id v23 = v42;
    uint64_t v43 = qword_10002A928;
    if (*((unsigned char *)v68 + 24))
    {
      v44 = v51;
      v51[0] = _NSConcreteStackBlock;
      v51[1] = 3221225472;
      v51[2] = sub_10000FDC0;
      v51[3] = &unk_100024ED0;
      id v52 = v42;
      [v52 dumpFPFSMigrationStatusTo:v43 personaID:v28 includeNonMigratedItems:0 reply:v51];
    }
    else
    {
      uint64_t v45 = *((unsigned __int8 *)v80 + 24);
      uint64_t v46 = *((unsigned __int8 *)v64 + 24);
      v44 = v53;
      v53[0] = _NSConcreteStackBlock;
      v53[1] = 3221225472;
      v53[2] = sub_10000FDB0;
      v53[3] = &unk_100024ED0;
      id v54 = v42;
      [v54 dumpDatabaseTo:v43 containerID:v49 personaID:v28 includeAllItems:v45 verbose:v46 reply:v53];
    }

    id v47 = [v23 resultWithTimeout:dword_10002A8D0 exitMessage:v50];
LABEL_49:

    goto LABEL_50;
  }
  +[BRAccountDescriptor allLoggedInAccountDescriptors];
  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  id v30 = (id)objc_claimAutoreleasedReturnValue();
  long long v28 = 0;
  id v31 = [v30 countByEnumeratingWithState:&v55 objects:v97 count:16];
  if (v31)
  {
    uint64_t v32 = *(void *)v56;
    do
    {
      for (uint64_t i = 0; i != v31; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v56 != v32) {
          objc_enumerationMutation(v30);
        }
        id v34 = *(void **)(*((void *)&v55 + 1) + 8 * i);
        if ([v34 isDataSeparated])
        {
          int v35 = [(id)qword_10002A928 fileDescriptor];
          id v36 = [v34 organizationName];
          dprintf(v35, "\n\ndatabase for data separated persona (managed by %s)\n", (const char *)[v36 UTF8String]);

          uint64_t v37 = [v34 personaIdentifier];

          long long v28 = (__CFString *)v37;
        }
      }
      id v31 = [v30 countByEnumeratingWithState:&v55 objects:v97 count:16];
    }
    while (v31);
  }

  uint64_t v38 = [v50 stringByAppendingString:@" for enterprise account"];

  id v50 = (id)v38;
  if (v28) {
    goto LABEL_45;
  }
LABEL_50:

  if (v83)
  {
    +[BRCTermDumper execPagerOnFileFd:](BRCTermDumper, "execPagerOnFileFd:", [(id)qword_10002A928 fileDescriptor]);
    __break(1u);
  }
  _Block_object_dispose(&v63, 8);
  _Block_object_dispose(&v67, 8);
  _Block_object_dispose(&v71, 8);
  _Block_object_dispose(&v75, 8);
  _Block_object_dispose(&v79, 8);

  _Block_object_dispose(&v84, 8);
  _Block_object_dispose(&v90, 8);
  return 0;
}

void sub_10000E188(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45,uint64_t a46,uint64_t a47,uint64_t a48,char a49,uint64_t a50,uint64_t a51,uint64_t a52,char a53,uint64_t a54,uint64_t a55,uint64_t a56,char a57,uint64_t a58,uint64_t a59,uint64_t a60,char a61,uint64_t a62,uint64_t a63)
{
  _Block_object_dispose(&a45, 8);
  _Block_object_dispose(&a49, 8);
  _Block_object_dispose(&a53, 8);
  _Block_object_dispose(&a57, 8);
  _Block_object_dispose(&a61, 8);
  _Block_object_dispose(&a66, 8);
  _Block_object_dispose(&a72, 8);
  _Unwind_Resume(a1);
}

id sub_10000E214(int a1, char *const *a2)
{
  int v20 = a1;
  long long v19 = (const char **)a2;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x2020000000;
  uint64_t v18 = 0;
  char v14 = 0;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10000FEF0;
  v13[3] = &unk_100024EA8;
  int v13[4] = &v15;
  sub_100009A00(&v20, (char *const **)&v19, "o:", (const option *)&off_1000253C8, v13);
  if (v20 < 1 || (uint64_t v2 = *v19, !strcmp(*v19, "all")))
  {
    uint64_t v3 = 0;
  }
  else
  {
    uint64_t v3 = +[NSString stringWithUTF8String:v2];
  }
  uint64_t v4 = sub_10000FCA4((const char *)v16[3], &v14);
  id v5 = (void *)qword_10002A928;
  qword_10002A928 = v4;

  id v6 = sub_100009BE0();
  uint64_t v7 = qword_10002A928;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10000FF08;
  v11[3] = &unk_100024ED0;
  id v8 = v6;
  id v12 = v8;
  [v8 printStatus:v7 containerID:v3 reply:v11];
  id v9 = [v8 resultWithTimeout:dword_10002A8D0 exitMessage:@"self-check failed"];
  if (v14)
  {
    id result = +[BRCTermDumper execPagerOnFileFd:](BRCTermDumper, "execPagerOnFileFd:", [(id)qword_10002A928 fileDescriptor]);
    __break(1u);
  }
  else
  {

    _Block_object_dispose(&v15, 8);
    return 0;
  }
  return result;
}

void sub_10000E40C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000E428(int a1, uint64_t a2)
{
  optreset = 1;
  optind = 1;
  uint64_t v2 = (a1 - 1);
  if (a1 <= 1) {
    sub_1000099E8();
  }
  uint64_t v3 = a2 + 8;
  uint64_t v4 = (&off_100025408)[2 * sub_100009910(*(const char **)(a2 + 8), (const char **)&off_100025408) + 1];

  return ((uint64_t (*)(uint64_t, uint64_t))v4)(v2, v3);
}

uint64_t sub_10000E4AC(int a1, char *const *a2)
{
  int v43 = a1;
  id v42 = a2;
  uint64_t v38 = 0;
  uint64_t v39 = &v38;
  uint64_t v40 = 0x2020000000;
  char v41 = 0;
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_100010DEC;
  v37[3] = &unk_100024EA8;
  v37[4] = &v38;
  sub_100009A00(&v43, &v42, "w", (const option *)&off_1000255A8, v37);
  uint64_t v2 = +[ACAccountStore defaultStore];
  [v2 br_allEligibleAppleAccounts];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v3 = [obj countByEnumeratingWithState:&v33 objects:v44 count:16];
  unsigned __int8 v25 = v2;
  if (v3)
  {
    uint64_t v4 = *(void *)v34;
    while (2)
    {
      for (uint64_t i = 0; i != v3; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v34 != v4) {
          objc_enumerationMutation(obj);
        }
        id v6 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        uint64_t v7 = [v6 identifier];
        unsigned int v8 = [v6 isDataSeparatedAccount];
        unsigned int v9 = [v6 isDataSeparatedAccount];
        int v10 = "primary";
        if (v8) {
          int v10 = "enterprise-";
        }
        CFStringRef v11 = &stru_100026380;
        if (v9) {
          CFStringRef v11 = v7;
        }
        id v12 = +[NSString stringWithFormat:@"%s%@", v10, v11];
        id v13 = [v6 username];
        char v14 = (const char *)[v13 UTF8String];
        unsigned int v15 = [v6 br_isEnabledForCloudDocs];
        id v16 = v12;
        uint64_t v17 = (const char *)[v16 UTF8String];
        uint64_t v18 = "no";
        if (v15) {
          uint64_t v18 = "yes";
        }
        printf("account:%s logged-in:%s account-directory:%s\n", v14, v18, v17);

        if (*((unsigned char *)v39 + 24) && objc_msgSend(v6, "br_isEnabledForCloudDocs"))
        {
          long long v19 = +[BRAccountDescriptor accountDescriptorForAccountID:v7];
          uint64_t v27 = 0;
          long long v28 = &v27;
          uint64_t v29 = 0x3032000000;
          id v30 = sub_10000C7C4;
          id v31 = sub_10000C7D4;
          id v32 = 0;
          BRPerformWithAccountDescriptor();
          if (v28[5])
          {
            id v21 = [v6 username];
            id v22 = (const char *)[v21 UTF8String];
            id v23 = [(id)v28[5] description];
            printf("error loading logged-in account:%s error:%s\n", v22, (const char *)[v23 UTF8String]);

            _Block_object_dispose(&v27, 8);
            uint64_t v20 = 1;
            goto LABEL_20;
          }
          _Block_object_dispose(&v27, 8);
        }
      }
      id v3 = [obj countByEnumeratingWithState:&v33 objects:v44 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
  uint64_t v20 = 0;
LABEL_20:

  _Block_object_dispose(&v38, 8);
  return v20;
}

void sub_10000E8C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43)
{
}

uint64_t sub_10000E920()
{
  id v0 = objc_alloc_init((Class)NSOperationQueue);
  uid_t v1 = +[BRAccountDescriptor allLoggedInAccountDescriptors];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = [v1 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v2)
  {
    id v3 = v2;
    uint64_t v4 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v3; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v10 != v4) {
          objc_enumerationMutation(v1);
        }
        uint64_t v7 = *(void *)(*((void *)&v9 + 1) + 8 * i);
        id v8 = v0;
        BRPerformWithAccountDescriptor();
      }
      id v3 = [v1 countByEnumeratingWithState:&v9 objects:v13 count:16 _NSConcreteStackBlock:3221225472 sub_100010EA4:&unk_100024AB0 v7];
    }
    while (v3);
  }
  [v0 waitUntilAllOperationsAreFinished];

  return 0;
}

uint64_t sub_10000EAAC(unsigned int a1, char *const *a2)
{
  v26[0] = a1;
  unsigned __int8 v25 = (const char **)a2;
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x2020000000;
  uint64_t v24 = 1;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100011018;
  v20[3] = &unk_100024EA8;
  v20[4] = &v21;
  sub_100009A00((int *)v26, (char *const **)&v25, "t", (const option *)&off_100025660, v20);
  uint64_t v2 = v26[0];
  if (!v26[0]) {
    sub_1000099E8();
  }
  if (!geteuid()) {
    errx(1, "Can't evict a document while running as root");
  }
  if ((int)v2 >= 1)
  {
    unint64_t v3 = 0;
    uint64_t v4 = v25;
    uint64_t v5 = 8 * v2;
    do
    {
      id v6 = +[NSURL fileURLWithFileSystemRepresentation:v4[v3 / 8] isDirectory:0 relativeToURL:0];
      dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
      uint64_t v14 = 0;
      unsigned int v15 = &v14;
      uint64_t v16 = 0x3032000000;
      uint64_t v17 = sub_10000C7C4;
      uint64_t v18 = sub_10000C7D4;
      id v19 = 0;
      id v8 = v7;
      BREvictItemAtURLWithOptions();
      dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
      long long v9 = (void *)v15[5];
      if (v9)
      {
        long long v12 = *v4;
        id v13 = [v9 description];
        errx(1, "Unable to evict item at path '%s': %s", v12, v13);
      }
      long long v10 = "content";
      if (v22[3] == 4) {
        long long v10 = "thumbnail";
      }
      printf("evicted %s of '%s'\n", v10, v4[v3 / 8]);

      _Block_object_dispose(&v14, 8);
      v3 += 8;
    }
    while (v5 != v3);
  }
  _Block_object_dispose(&v21, 8);
  return 0;
}

void sub_10000ED48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
}

uint64_t sub_10000ED7C(unsigned int a1, char *const *a2)
{
  unsigned int v34 = a1;
  v32[3] = 0;
  long long v33 = a2;
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x2020000000;
  uint64_t v28 = 0;
  uint64_t v29 = &v28;
  uint64_t v30 = 0x2020000000;
  char v31 = 0;
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_100011094;
  v27[3] = &unk_100025560;
  v27[4] = v32;
  v27[5] = &v28;
  sub_100009A00((int *)&v34, &v33, "tb", (const option *)&off_1000256A0, v27);
  uint64_t v2 = v34;
  if ((int)v34 <= 0) {
    sub_1000099E8();
  }
  if (!geteuid()) {
    errx(1, "Can't download documents while running as root");
  }
  id v15 = [objc_alloc((Class)NSMutableArray) initWithCapacity:v2];
  unint64_t v3 = v33;
  do
  {
    uint64_t v4 = +[NSURL fileURLWithFileSystemRepresentation:*v3 isDirectory:0 relativeToURL:0];
    [v15 addObject:v4];

    ++v3;
    --v2;
  }
  while (v2);
  if (*((unsigned char *)v29 + 24))
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    dispatch_semaphore_t v5 = (dispatch_semaphore_t)v15;
    id v6 = [v5 countByEnumeratingWithState:&v23 objects:v35 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v24 != v7) {
            objc_enumerationMutation(v5);
          }
          uint64_t v9 = *(void *)(*((void *)&v23 + 1) + 8 * i);
          long long v10 = dispatch_group_create();
          long long v11 = dispatch_get_global_queue(0, 0);
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_1000110CC;
          block[3] = &unk_100025470;
          block[4] = v9;
          dispatch_group_async(v10, v11, block);

          dispatch_group_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
        }
        id v6 = [v5 countByEnumeratingWithState:&v23 objects:v35 count:16];
      }
      while (v6);
    }
  }
  else
  {
    uint64_t v16 = 0;
    uint64_t v17 = &v16;
    uint64_t v18 = 0x3032000000;
    id v19 = sub_10000C7C4;
    uint64_t v20 = sub_10000C7D4;
    id v21 = 0;
    dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
    BRStartDownloadForItemsWithOptions();
    dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
    long long v12 = (void *)v17[5];
    if (v12)
    {
      uint64_t v14 = [v12 description];
      errx(1, "Unable to start downloads: %s", v14);
    }

    _Block_object_dispose(&v16, 8);
  }

  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(v32, 8);
  return 0;
}

void sub_10000F154(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,char a44,uint64_t a45,uint64_t a46,uint64_t a47,char a48)
{
}

uint64_t sub_10000F1A8(unsigned int a1, char *const *a2)
{
  unsigned int v93 = a1;
  uint64_t v92 = a2;
  uint64_t v86 = 0;
  v87 = &v86;
  uint64_t v88 = 0x3032000000;
  id v89 = sub_10000C7C4;
  uint64_t v90 = sub_10000C7D4;
  id v91 = (id)objc_opt_new();
  v84[0] = 0;
  v84[1] = v84;
  v84[2] = 0x2020000000;
  char v85 = 0;
  uint64_t v80 = 0;
  uint64_t v81 = &v80;
  uint64_t v82 = 0x2020000000;
  char v83 = 0;
  v79[0] = _NSConcreteStackBlock;
  v79[1] = 3221225472;
  v79[2] = sub_1000111E0;
  v79[3] = &unk_100025560;
  v79[4] = v84;
  v79[5] = &v80;
  sub_100009A00((int *)&v93, &v92, "ao", (const option *)&off_100025740, v79);
  if ((int)v93 <= 0) {
    sub_1000099E8();
  }
  uint64_t v50 = v93;
  id v48 = v92;
  uint64_t v2 = +[NSString br_pathWithFileSystemRepresentation:*v92];
  id v52 = +[NSURL fileURLWithPath:v2];

  v76[0] = _NSConcreteStackBlock;
  v76[1] = 3221225472;
  v76[2] = sub_10001120C;
  v76[3] = &unk_100025788;
  char v78 = &v86;
  unint64_t v3 = dispatch_semaphore_create(0);
  uint64_t v77 = v3;
  +[NSFileVersion getNonlocalVersionsOfItemAtURL:v52 completionHandler:v76];
  v49 = v3;
  dispatch_semaphore_wait(v3, 0xFFFFFFFFFFFFFFFFLL);
  if (*((unsigned char *)v81 + 24))
  {
    puts("[");
    long long v74 = 0u;
    long long v75 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    id obj = (id)v87[5];
    id v4 = [obj countByEnumeratingWithState:&v72 objects:v97 count:16];
    if (v4)
    {
      char v5 = 1;
      uint64_t v54 = *(void *)v73;
      v51 = "\n]";
      do
      {
        id v6 = 0;
        id v55 = v4;
        do
        {
          if (*(void *)v73 != v54) {
            objc_enumerationMutation(obj);
          }
          uint64_t v7 = *(void **)(*((void *)&v72 + 1) + 8 * (void)v6);
          unsigned int outCount = 0;
          if ((v5 & 1) == 0) {
            puts(",");
          }
          id v8 = (objc_class *)objc_opt_class();
          uint64_t v9 = class_copyPropertyList(v8, &outCount);
          puts("\t{");
          if (outCount)
          {
            for (unint64_t i = 0; i < outCount; ++i)
            {
              id v11 = [objc_alloc((Class)NSString) initWithUTF8String:property_getName(v9[i])];
              if (([v11 isEqualToString:@"persistentIdentifier"] & 1) == 0)
              {
                long long v12 = [v7 valueForKey:v11];
                id v13 = +[NSString stringWithFormat:@"%@", v12];

                if ([(__CFString *)v13 isEqualToString:@"(null)"])
                {

                  id v13 = &stru_100026380;
                }
                uint64_t v14 = (const char *)[v11 UTF8String];
                id v15 = v13;
                printf("\t\t\"%s\": \"%s\"", v14, (const char *)[(__CFString *)v15 UTF8String]);
                if (i == outCount - 1) {
                  uint64_t v16 = "";
                }
                else {
                  uint64_t v16 = ",";
                }
                puts(v16);
              }
            }
          }
          printf("\t}");
          char v5 = 0;
          id v6 = (char *)v6 + 1;
        }
        while (v6 != v55);
        id v4 = [obj countByEnumeratingWithState:&v72 objects:v97 count:16];
        char v5 = 0;
      }
      while (v4);
      goto LABEL_34;
    }
    id v21 = "\n]";
LABEL_33:
    v51 = (char *)v21;
    goto LABEL_34;
  }
  puts("versions: {");
  long long v69 = 0u;
  long long v70 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  id obj = (id)v87[5];
  id v17 = [obj countByEnumeratingWithState:&v67 objects:v96 count:16];
  if (!v17)
  {
    id v21 = "}";
    goto LABEL_33;
  }
  uint64_t v18 = *(void *)v68;
  v51 = "}";
  do
  {
    for (j = 0; j != v17; j = (char *)j + 1)
    {
      if (*(void *)v68 != v18) {
        objc_enumerationMutation(obj);
      }
      id v20 = [*(id *)(*((void *)&v67 + 1) + 8 * (void)j) description];
      printf("    %s\n", (const char *)[v20 UTF8String]);
    }
    id v17 = [obj countByEnumeratingWithState:&v67 objects:v96 count:16];
  }
  while (v17);
LABEL_34:

  puts(v51);
  id v22 = objc_alloc_init((Class)NSMutableDictionary);
  id v23 = objc_alloc_init((Class)NSMutableSet);
  long long v65 = 0u;
  long long v66 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  id v24 = (id)v87[5];
  id v25 = [v24 countByEnumeratingWithState:&v63 objects:v95 count:16];
  if (v25)
  {
    uint64_t v26 = *(void *)v64;
    do
    {
      for (k = 0; k != v25; k = (char *)k + 1)
      {
        if (*(void *)v64 != v26) {
          objc_enumerationMutation(v24);
        }
        uint64_t v28 = *(void **)(*((void *)&v63 + 1) + 8 * (void)k);
        uint64_t v29 = [v28 etag];
        [v22 setObject:v28 forKeyedSubscript:v29];
      }
      id v25 = [v24 countByEnumeratingWithState:&v63 objects:v95 count:16];
    }
    while (v25);
  }

  if ((int)v50 >= 2)
  {
    uint64_t v30 = (const char **)(v48 + 1);
    uint64_t v31 = v50 - 1;
    while (1)
    {
      id v32 = *v30;
      if (!strcmp(*v30, "ALL")) {
        break;
      }
      long long v33 = +[NSString stringWithUTF8String:v32];
      unsigned int v34 = [v22 objectForKeyedSubscript:v33];

      if (v34) {
        [v23 addObject:v34];
      }

      ++v30;
      if (!--v31) {
        goto LABEL_49;
      }
    }
    id v35 = objc_alloc((Class)NSMutableSet);
    long long v36 = [v22 allValues];
    id v37 = [v35 initWithArray:v36];

    id v23 = v37;
  }
LABEL_49:
  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  id v56 = v23;
  id v38 = [v56 countByEnumeratingWithState:&v59 objects:v94 count:16];
  if (v38)
  {
    uint64_t v39 = *(void *)v60;
    while (2)
    {
      for (m = 0; m != v38; m = (char *)m + 1)
      {
        if (*(void *)v60 != v39) {
          objc_enumerationMutation(v56);
        }
        char v41 = *(void **)(*((void *)&v59 + 1) + 8 * (void)m);
        id v42 = [v41 description];
        printf("downloading version %s...\n", (const char *)[v42 UTF8String]);

        id v43 = objc_alloc_init((Class)NSFileCoordinator);
        v44 = [v41 URL];
        v57[4] = v41;
        id v58 = 0;
        v57[0] = _NSConcreteStackBlock;
        v57[1] = 3221225472;
        v57[2] = sub_100011290;
        v57[3] = &unk_1000257B0;
        [v43 coordinateReadingItemAtURL:v44 options:1 error:&v58 byAccessor:v57];
        id v45 = v58;

        if (v45)
        {
          id v46 = [v45 description];
          printf("  ERROR: %s\n", (const char *)[v46 UTF8String]);

          goto LABEL_59;
        }
      }
      id v38 = [v56 countByEnumeratingWithState:&v59 objects:v94 count:16];
      if (v38) {
        continue;
      }
      break;
    }
  }
LABEL_59:

  _Block_object_dispose(&v80, 8);
  _Block_object_dispose(v84, 8);
  _Block_object_dispose(&v86, 8);

  return 0;
}

void sub_10000FA50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  _Block_object_dispose(&a71, 8);
  _Block_object_dispose(&STACK[0x210], 8);
  _Block_object_dispose(&STACK[0x230], 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000FAE8(int a1, uint64_t a2)
{
  optreset = 1;
  optind = 1;
  if (a1 != 2) {
    sub_1000099E8();
  }
  uint64_t v2 = a2 + 8;
  unint64_t v3 = (&off_1000257D0)[2 * sub_100009910(*(const char **)(a2 + 8), (const char **)&off_1000257D0) + 1];

  return ((uint64_t (*)(uint64_t, uint64_t))v3)(1, v2);
}

void sub_10000FB64(void *a1, int a2, uint64_t a3)
{
  switch(a2)
  {
    case 'd':
      if (a3)
      {
        char v5 = +[NSString br_pathWithFileSystemRepresentation:a3];
      }
      else
      {
        char v5 = 0;
      }
      id v7 = v5;
      objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), v5);
      if (a3)
      {
      }
      return;
    case 'e':
      uint64_t v6 = a1[8];
      goto LABEL_12;
    case 'f':
      uint64_t v6 = a1[9];
      goto LABEL_12;
    case 'g':
    case 'h':
    case 'j':
    case 'k':
    case 'l':
    case 'm':
    case 'n':
      return;
    case 'i':
      *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 0;
      return;
    case 'o':
      *(void *)(*(void *)(a1[4] + 8) + 24) = a3;
      return;
    default:
      if (a2 == 117)
      {
        uint64_t v6 = a1[7];
      }
      else
      {
        if (a2 != 118) {
          return;
        }
        uint64_t v6 = a1[10];
      }
LABEL_12:
      *(unsigned char *)(*(void *)(v6 + 8) + 24) = 1;
      return;
  }
}

id sub_10000FCA4(const char *a1, char *a2)
{
  if (a1)
  {
    uint64_t v4 = open(a1, 1541, 420);
    if ((v4 & 0x80000000) != 0) {
      err(1, "Unable to open file %s", a1);
    }
    id v5 = [objc_alloc((Class)NSFileHandle) initWithFileDescriptor:v4 closeOnDealloc:1];
LABEL_4:
    id v6 = v5;
    char v7 = 0;
    if (!a2) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  if (!isatty(1))
  {
    id v5 = +[NSFileHandle fileHandleWithStandardOutput];
    goto LABEL_4;
  }
  uint64_t v9 = tmpfile();
  id v10 = objc_alloc((Class)NSFileHandle);
  int v11 = fileno(v9);
  char v7 = 1;
  id v6 = [v10 initWithFileDescriptor:dup(v11) closeOnDealloc:1];
  fclose(v9);
  if (a2) {
LABEL_5:
  }
    *a2 = v7;
LABEL_6:

  return v6;
}

id sub_10000FDB0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setBoolResult:a2 error:a3];
}

id sub_10000FDC0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setBoolResult:a2 error:a3];
}

Class sub_10000FDD0()
{
  if (!qword_10002A938)
  {
    qword_10002A938 = (uint64_t)dlopen("/System/Library/PrivateFrameworks/CloudDocsDaemon.framework/CloudDocsDaemon", 2);
    if (!qword_10002A938) {
      sub_100016E70();
    }
  }
  Class Class = objc_getClass("BRCAccountSession");
  qword_10002A930 = (uint64_t)Class;
  if (!Class) {
    sub_100016F24();
  }
  off_10002A8D8[0] = (uint64_t (*)())sub_10000FE54;

  return Class;
}

id sub_10000FE54()
{
  return (id)qword_10002A930;
}

Class sub_10000FE60()
{
  if (!qword_10002A948)
  {
    qword_10002A948 = (uint64_t)dlopen("/System/Library/PrivateFrameworks/iCloudDriveCore.framework/iCloudDriveCore", 2);
    if (!qword_10002A948) {
      sub_100016F50();
    }
  }
  Class Class = objc_getClass("BRCAccountSessionFPFS");
  qword_10002A940 = (uint64_t)Class;
  if (!Class) {
    sub_100017004();
  }
  off_10002A8E0 = (uint64_t (*)())sub_10000FEE4;

  return Class;
}

id sub_10000FEE4()
{
  return (id)qword_10002A940;
}

uint64_t sub_10000FEF0(uint64_t result, int a2, uint64_t a3)
{
  if (a2 == 111) {
    *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a3;
  }
  return result;
}

id sub_10000FF08(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setBoolResult:a2 error:a3];
}

uint64_t sub_10000FF18()
{
  geteuid();
  id v0 = +[BRAccountDescriptor allLoggedInAccountDescriptors];
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  uid_t v1 = (char *)[v0 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v1)
  {
    uint64_t v2 = v1;
    uint64_t v3 = *(void *)v7;
    do
    {
      for (unint64_t i = 0; i != v2; ++i)
      {
        if (*(void *)v7 != v3) {
          objc_enumerationMutation(v0);
        }
        BRPerformWithAccountDescriptor();
      }
      uint64_t v2 = (char *)[v0 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v2);
  }

  return 0;
}

uint64_t sub_100010070(int a1, char *const *a2)
{
  int v24 = a1;
  id v23 = a2;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  id v20 = sub_10000C7C4;
  id v21 = sub_10000C7D4;
  id v22 = 0;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100010C6C;
  v16[3] = &unk_100024EA8;
  v16[4] = &v17;
  sub_100009A00(&v24, &v23, "o:", (const option *)&off_100025490, v16);
  if (v24 <= 0) {
    errx(1, "need to specify a container ID\n");
  }
  id v2 = +[NSString stringWithUTF8String:*v23];
  uint64_t v3 = (const char *)[v2 UTF8String];
  uint64_t v4 = (const char *)[ (id) v18[5] UTF8String];
  id v5 = "";
  if (v4) {
    id v5 = v4;
  }
  printf("creating %s %s\n", v3, v5);
  long long v6 = +[BRDaemonConnection defaultConnection];
  id v7 = [v6 newSyncProxy];

  uint64_t v8 = v18[5];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100010CC8;
  v14[3] = &unk_1000254D8;
  id v9 = v7;
  id v15 = v9;
  [v9 createContainerWithID:v2 ownerName:v8 reply:v14];
  id v10 = [v9 result];

  if (!v10)
  {
    long long v12 = [v9 error];
    id v13 = [v12 description];
    printf("  error: %s\n", (const char *)[v13 UTF8String]);

    err(1, "can't create container");
  }

  _Block_object_dispose(&v17, 8);
  return 0;
}

void sub_1000102D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000102F8(int a1, char *const *a2)
{
  int v26 = a1;
  id v25 = a2;
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 0;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100010CDC;
  v16[3] = &unk_100025560;
  v16[4] = &v21;
  void v16[5] = &v17;
  sub_100009A00(&v26, &v25, "cs", (const option *)&off_1000254F8, v16);
  if (*((unsigned char *)v18 + 24)) {
    *((unsigned char *)v22 + 24) = 1;
  }
  if (v26 <= 0) {
    errx(1, "need to specify a container ID\n");
  }
  id v2 = +[NSString stringWithUTF8String:*v25];
  uint64_t v3 = (const char *)[v2 UTF8String];
  uint64_t v4 = "YES";
  if (*((unsigned char *)v22 + 24)) {
    id v5 = "YES";
  }
  else {
    id v5 = "NO";
  }
  if (!*((unsigned char *)v18 + 24)) {
    uint64_t v4 = "NO";
  }
  printf("deleting container %s on client:%s and on server:%s\n", v3, v5, v4);
  long long v6 = +[BRDaemonConnection defaultConnection];
  id v7 = [v6 newSyncProxy];

  uint64_t v8 = *((unsigned __int8 *)v22 + 24);
  uint64_t v9 = *((unsigned __int8 *)v18 + 24);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100010D08;
  v14[3] = &unk_1000254D8;
  id v10 = v7;
  id v15 = v10;
  [v10 deleteAllContentsOfContainerID:v2 onClient:v8 onServer:v9 wait:1 reply:v14];
  int v11 = [v10 result];
  LOBYTE(v9) = [v11 BOOLValue];

  if ((v9 & 1) == 0)
  {
    [v10 error];
    id v13 = [(id)objc_claimAutoreleasedReturnValue() description];
    errx(1, "deletion failed with %s\n", v13);
  }

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v21, 8);
  return 0;
}

void sub_10001057C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000105A8()
{
  id v0 = objc_alloc_init(ContainerObserver);
  id v1 = objc_alloc_init((Class)BRContainersMonitor);
  id v2 = [objc_alloc((Class)BRCTermDumper) initWithFd:1 forceColor:0];
  [(ContainerObserver *)v0 setDumper:v2];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v3 = +[BRContainer allContainers];
  id v4 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  id v5 = (void *)BRSubSystemContainerIDPrefix;
  if (v4)
  {
    id v6 = v4;
    uint64_t v7 = *(void *)v16;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = [*(id *)(*((void *)&v15 + 1) + 8 * (void)v8) identifier];
        id v10 = [v5 stringByAppendingString:v9];
        [v1 addObserver:v0 forContainerID:v10];

        uint64_t v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }

  int v11 = [v5 stringByAppendingString:BRUbiquitousContainerMetadataContainerID];
  [v1 addObserver:v0 forContainerID:v11];

  long long v12 = [v5 stringByAppendingString:BRUbiquitousSharedContainerID];
  [v1 addObserver:v0 forContainerID:v12];

  id v13 = +[NSRunLoop mainRunLoop];
  [v13 run];

  return 0;
}

uint64_t sub_1000107C0(int a1, uint64_t a2)
{
  optreset = 1;
  optind = 1;
  if (a1 <= 1) {
    sub_100017030();
  }
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = sub_10000C7C4;
  int v11 = sub_10000C7D4;
  id v12 = 0;
  id v2 = +[NSString stringWithUTF8String:*(void *)(a2 + 8)];
  uint64_t v3 = dispatch_semaphore_create(0);
  BRRegisterInitialSyncHandlerForContainer();
  dispatch_semaphore_wait(v3, 0xFFFFFFFFFFFFFFFFLL);
  if (v8[5])
  {
    id v5 = (const char *)[v2 UTF8String];
    id v6 = [(id)v8[5] description];
    errx(1, "waiting for initial faults live failed for %s: %s\n", v5, v6);
  }

  _Block_object_dispose(&v7, 8);
  return 0;
}

void sub_100010948(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100010964(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) organizationName];
  uint64_t v3 = +[NSString stringWithFormat:@" (managed by: %@)", v2];

  id v4 = +[BRContainer allContainers];
  id v5 = [v4 count];
  id v6 = [*(id *)(a1 + 32) accountIdentifier];
  uint64_t v7 = (const char *)[v6 UTF8String];
  unsigned int v8 = [*(id *)(a1 + 32) isDataSeparated];
  uint64_t v9 = "";
  if (v8) {
    uint64_t v9 = (const char *)[v3 UTF8String];
  }
  id v22 = v3;
  printf("\n\nlisting %ld containers for account %s%s:\n", v5, v7, v9);

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = v4;
  id v25 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v25)
  {
    uint64_t v24 = *(void *)v32;
    do
    {
      for (unint64_t i = 0; i != v25; unint64_t i = (char *)i + 1)
      {
        if (*(void *)v32 != v24) {
          objc_enumerationMutation(obj);
        }
        int v11 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        id v30 = [v11 identifier];
        uint64_t v28 = (const char *)[v30 UTF8String];
        id v29 = [v11 localizedName];
        uint64_t v27 = (const char *)[v29 UTF8String];
        id v12 = [v11 documentsURL];
        id v13 = [v12 path];
        int v26 = (const char *)[v13 fileSystemRepresentation];
        if ([v11 isDocumentScopePublic]) {
          uint64_t v14 = "Public";
        }
        else {
          uint64_t v14 = "Private";
        }
        if ([v11 isInInitialState]) {
          long long v15 = " inInitialState";
        }
        else {
          long long v15 = "";
        }
        if ([v11 isCloudSyncTCCDisabled]) {
          long long v16 = " isCloudSyncTCCDisabled";
        }
        else {
          long long v16 = "";
        }
        long long v17 = [v11 bundleIdentifiers];
        long long v18 = [v17 allObjects];
        id v19 = [v18 componentsJoinedByString:@", "];
        char v20 = (const char *)[v19 UTF8String];
        if (v20) {
          uint64_t v21 = v20;
        }
        else {
          uint64_t v21 = "";
        }
        printf("  id:%s localizedName:'%s' documents:'%s' [%s:%s%s] clients: %s\n", v28, v27, v26, v14, v15, v16, v21);
      }
      id v25 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v25);
  }
}

uint64_t sub_100010C6C(uint64_t result, int a2)
{
  if (a2 == 111)
  {
    uint64_t v3 = result;
    *(void *)(*(void *)(*(void *)(v3 + 32) + 8) + 40) = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:");
    return _objc_release_x1();
  }
  return result;
}

id sub_100010CC8(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setBoolResult:a2 == 0 error:a2];
}

uint64_t sub_100010CDC(uint64_t result, int a2)
{
  if (a2 == 115)
  {
    uint64_t v2 = *(void *)(result + 40);
  }
  else
  {
    if (a2 != 99) {
      return result;
    }
    uint64_t v2 = *(void *)(result + 32);
  }
  *(unsigned char *)(*(void *)(v2 + 8) + 24) = 1;
  return result;
}

void sub_100010D08(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  BOOL v3 = a2 == 0;
  id v4 = a2;
  id v5 = +[NSNumber numberWithInt:v3];
  [v2 setObjResult:v5 error:v4];
}

void sub_100010D8C(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t sub_100010DEC(uint64_t result, int a2)
{
  if (a2 == 119) {
    *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
  }
  return result;
}

void sub_100010E08(uint64_t a1)
{
  uint64_t v2 = sub_100009BE0();
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100010E94;
  v3[3] = &unk_1000255F0;
  v3[4] = *(void *)(a1 + 32);
  [v2 waitForAccountToLoadWithReply:v3];
}

void sub_100010E94(uint64_t a1, void *a2)
{
}

void sub_100010EA4(uint64_t a1)
{
  id v2 = objc_alloc_init((Class)BRFetchQuotaOperation);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100010F40;
  v3[3] = &unk_100025640;
  v3[4] = *(void *)(a1 + 32);
  [v2 setFetchQuotaCompletionBlock:v3];
  [*(id *)(a1 + 40) addOperation:v2];
}

void sub_100010F40(uint64_t a1, void *a2, void *a3)
{
  id v10 = a3;
  if (v10)
  {
    if ([*(id *)(a1 + 32) isDataSeparated]) {
      id v5 = "enterprise";
    }
    else {
      id v5 = "personal";
    }
    id v6 = [v10 description];
    printf("failed fetching %s quota - %s\n", v5, (const char *)[v6 UTF8String]);
  }
  else
  {
    id v7 = [a2 unsignedLongLongValue];
    unsigned int v8 = [*(id *)(a1 + 32) isDataSeparated];
    uint64_t v9 = "personal";
    if (v8) {
      uint64_t v9 = "enterprise";
    }
    printf("%llu bytes of quota remaining in %s account\n", v7, v9);
  }
}

uint64_t sub_100011018(uint64_t result, int a2)
{
  if (a2 == 116) {
    *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 4;
  }
  return result;
}

void sub_100011034(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t sub_100011094(uint64_t result, int a2)
{
  if (a2 == 98)
  {
    *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = 1;
  }
  else if (a2 == 116)
  {
    *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 2;
  }
  return result;
}

void sub_1000110CC(uint64_t a1)
{
  id v2 = objc_alloc_init((Class)NSFileCoordinator);
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = 0;
  [v2 coordinateReadingItemAtURL:v3 options:131073 error:&v4 byAccessor:&stru_100025720];
}

void sub_100011128(id a1, NSURL *a2)
{
  id v2 = [(NSURL *)a2 path];
  printf("download complete at \"%s\"\n", (const char *)[v2 UTF8String]);
}

void sub_100011180(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t sub_1000111E0(uint64_t result, int a2)
{
  if (a2 == 111)
  {
    uint64_t v2 = *(void *)(result + 40);
  }
  else
  {
    if (a2 != 97) {
      return result;
    }
    uint64_t v2 = *(void *)(result + 32);
  }
  *(unsigned char *)(*(void *)(v2 + 8) + 24) = 1;
  return result;
}

void sub_10001120C(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v6 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  if (v6) {
    sub_10001704C(v6);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t sub_100011290(uint64_t a1, void *a2)
{
  id v3 = [a2 path];
  id v4 = (const char *)[v3 fileSystemRepresentation];

  printf("  acquired coordinated read at '%s'\n", v4);
  memset(&v37, 0, sizeof(v37));
  if (lstat(v4, &v37) < 0)
  {
    uint64_t v28 = *__error();
    return printf("  ERROR: can't lstat path '%s' %{errno}d\n", v4, v28);
  }
  else
  {
    unsigned int st_mode = v37.st_mode;
    if ((v37.st_mode & 0xF000) == 0x8000
      || (st_size = v37.st_size, id v7 = [*(id *)(a1 + 32) size], st_mode = v37.st_mode, (id)st_size == v7))
    {
      uint64_t v8 = aPcDBLSW[(unint64_t)st_mode >> 12];
      uint64_t v9 = 120;
      if (st_mode) {
        uint64_t v10 = 120;
      }
      else {
        uint64_t v10 = 45;
      }
      uint64_t v35 = v10;
      uint64_t v11 = 119;
      if ((st_mode & 2) != 0) {
        uint64_t v12 = 119;
      }
      else {
        uint64_t v12 = 45;
      }
      if ((st_mode & 4) != 0) {
        uint64_t v13 = 114;
      }
      else {
        uint64_t v13 = 45;
      }
      uint64_t v31 = v13;
      uint64_t v33 = v12;
      if ((st_mode & 8) != 0) {
        uint64_t v14 = 120;
      }
      else {
        uint64_t v14 = 45;
      }
      if ((st_mode & 0x10) != 0) {
        uint64_t v15 = 119;
      }
      else {
        uint64_t v15 = 45;
      }
      uint64_t v29 = v14;
      if ((st_mode & 0x20) != 0) {
        uint64_t v16 = 114;
      }
      else {
        uint64_t v16 = 45;
      }
      if ((st_mode & 0x40) == 0) {
        uint64_t v9 = 45;
      }
      if ((st_mode & 0x80) == 0) {
        uint64_t v11 = 45;
      }
      if ((st_mode & 0x100) != 0) {
        uint64_t v17 = 114;
      }
      else {
        uint64_t v17 = 45;
      }
      return printf("  version is on disk at '%s': deviceID:%u fileID:%llu mode:%c%c%c%c%c%c%c%c%c%c nlink:%u uid:%u gid:%u atime:%lu mtime:%lu ctime:%lu size:%llu flags:0x%x\n", v4, v37.st_dev, v37.st_ino, v8, v17, v11, v9, v16, v15, v29, v31, v33, v35);
    }
    else
    {
      uint64_t v19 = 120;
      if (v37.st_mode) {
        uint64_t v20 = 120;
      }
      else {
        uint64_t v20 = 45;
      }
      uint64_t v36 = v20;
      uint64_t v21 = 119;
      if ((v37.st_mode & 2) != 0) {
        uint64_t v22 = 119;
      }
      else {
        uint64_t v22 = 45;
      }
      if ((v37.st_mode & 4) != 0) {
        uint64_t v23 = 114;
      }
      else {
        uint64_t v23 = 45;
      }
      uint64_t v32 = v23;
      uint64_t v34 = v22;
      if ((v37.st_mode & 8) != 0) {
        uint64_t v24 = 120;
      }
      else {
        uint64_t v24 = 45;
      }
      if ((v37.st_mode & 0x10) != 0) {
        uint64_t v25 = 119;
      }
      else {
        uint64_t v25 = 45;
      }
      uint64_t v30 = v24;
      if ((v37.st_mode & 0x20) != 0) {
        uint64_t v26 = 114;
      }
      else {
        uint64_t v26 = 45;
      }
      if ((v37.st_mode & 0x40) == 0) {
        uint64_t v19 = 45;
      }
      if ((v37.st_mode & 0x80) == 0) {
        uint64_t v21 = 45;
      }
      if ((v37.st_mode & 0x100) != 0) {
        uint64_t v27 = 114;
      }
      else {
        uint64_t v27 = 45;
      }
      return printf("  ERROR: wrong size at '%s' deviceID:%u fileID:%llu mode:%c%c%c%c%c%c%c%c%c%c nlink:%u uid:%u gid:%u atime:%lu mtime:%lu ctime:%lu size:%llu flags:0x%x\n", v4, v37.st_dev, v37.st_ino, aPcDBLSW[(unint64_t)v37.st_mode >> 12], v27, v21, v19, v26, v25, v30, v32, v34, v36);
    }
  }
}

uint64_t sub_1000114E4()
{
  return 0;
}

uint64_t sub_100011510()
{
  sub_1000115E8(0);
  sub_100009BE0();
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000117C8;
  v4[3] = &unk_1000254D8;
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = v0;
  [v0 dropSpotlightIndexWithReply:v4];
  id v1 = [v0 result];
  unsigned int v2 = [v1 BOOLValue];

  if (!v2) {
    sub_100017080(v0);
  }
  puts("Dropped Spotlight index successfully");

  return 0;
}

void sub_1000115E8(int a1)
{
  unsigned int v2 = +[NSString stringWithFormat:@"/bin/launchctl start com.apple.bird"];
  v20[0] = v2;
  id v3 = +[NSString stringWithFormat:@"/usr/bin/pkill -STOP bird"];
  v20[1] = v3;
  id v4 = "no";
  if (a1) {
    id v4 = "yes";
  }
  id v5 = +[NSString stringWithFormat:@"/usr/bin/defaults write com.apple.bird spotlight-indexer.enabled -BOOL %s", v4];
  v20[2] = v5;
  id v6 = +[NSString stringWithFormat:@"/usr/bin/pkill -KILL bird"];
  v20[3] = v6;
  id v7 = +[NSArray arrayWithObjects:v20 count:4];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v8 = v7;
  id v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (unint64_t i = 0; i != v10; unint64_t i = (char *)i + 1)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(id *)(*((void *)&v15 + 1) + 8 * i);
        puts((const char *)[v13 UTF8String]);
        uint64_t v14 = +[BRTask taskWithCommandWithArguments:v13];
        [v14 exec];
      }
      id v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }
}

id sub_1000117C8(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setBoolResult:a2 == 0 error:a2];
}

void sub_1000117DC(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_impl(a1, v9, OS_LOG_TYPE_DEFAULT, a4, &a9, 0x16u);
}

void sub_100011A14(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isDataSeparated]) {
    *(unsigned char *)(*(void *)(a1 + 40) + 112) = 1;
  }
  if (*(unsigned char *)(*(void *)(a1 + 40) + 109)
    && ([*(id *)(a1 + 32) isDataSeparated] & 1) == 0)
  {
    uint64_t v2 = [*(id *)(a1 + 48) objectForKeyedSubscript:@"HOME"];
    if (*(unsigned char *)(*(void *)(a1 + 40) + 109))
    {
      id v6 = (id)v2;
      uint64_t v3 = NSHomeDirectoryForUser(@"mobile");

      uint64_t v2 = v3;
    }
  }
  else
  {
    uint64_t v2 = +[NSString br_currentHomeDir];
  }
  id v7 = (id)v2;
  if (v2)
  {
    id v4 = *(void **)(*(void *)(a1 + 40) + 40);
    id v5 = [*(id *)(a1 + 32) accountIdentifier];
    [v4 setObject:v7 forKey:v5];
  }
  else
  {
    id v5 = [*(id *)(a1 + 32) accountIdentifier];
    printf("couldn't get home path for account %s\n", (const char *)[v5 UTF8String]);
  }
}

void sub_10001315C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100013180(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100013190(uint64_t a1)
{
}

void sub_100013198(uint64_t a1, xpc_object_t object)
{
  xpc_type_t type = xpc_get_type(object);
  if (object == &_xpc_error_connection_interrupted && type == (xpc_type_t)&_xpc_type_error)
  {
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = 0;
  }
}

void sub_1000139DC(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 stringByAppendingPathComponent:@"filecoordination_dump.txt"];
  id v10 = 0;
  [v4 writeToFile:v5 atomically:1 encoding:4 error:&v10];

  id v6 = v10;
  id v7 = v6;
  if (v6)
  {
    id v8 = __stderrp;
    id v9 = [v6 description];
    fprintf(v8, "failed to write file coordination dump - %s", (const char *)[v9 UTF8String]);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

uint64_t sub_100016294(uint64_t a1)
{
  return fclose(*(FILE **)(a1 + 32));
}

uint64_t sub_10001629C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [*(id *)(a1 + 32) stringByAppendingPathComponent:a2];
  id v4 = *(void **)(a1 + 40);
  id v15 = 0;
  id v5 = [v4 attributesOfItemAtPath:v3 error:&v15];
  id v6 = v15;
  id v7 = v6;
  if (v5) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 0;
  }
  if (!v8)
  {
    id v9 = __stderrp;
    id v10 = (const char *)[v3 fileSystemRepresentation];
    id v11 = [v7 description];
    fprintf(v9, "can't retrieve attributes of item at \"%s\": %s\n", v10, (const char *)[v11 UTF8String]);
  }
  uint64_t v12 = [v5 fileType];
  uint64_t v13 = [v12 isEqualToString:NSFileTypeSymbolicLink] ^ 1;

  return v13;
}

uint64_t sub_1000168AC()
{
  puts("diagnose [options] [--doc|-d <document-path>] [<diagnosis-output-path>]");
  puts("    diagnose and collect logs\n");
  puts("    -M,--collect-mobile-documents[=<container>]  (default: all containers)");
  puts("    -s,--sysdiagnose     Do not collect what's already part of sysdiagnose");
  puts("    -t,--uitest          Collect logs for UI tests");
  puts("    -n,--name=<name>     Change the device name");
  puts("    -f,--full            Do a full diagnose, including server checks");
  puts("    -d,--doc=<document-path>");
  puts("                         Collect additional information about the document at that path.");
  puts("                         Helps when investigating an issue impacting a specific document.");
  puts("    [<diagnosis-output-path>]");
  puts("                         Specifies the output path of the diagnosis; -n becomes useless.");

  return putchar(10);
}

uint64_t sub_100016964(int a1, char *const *a2)
{
  int v23 = a1;
  uint64_t v22 = a2;
  id v4 = objc_alloc_init(BRCTLDiagnoseCommand);
  diagnoseArgs = v4->diagnoseArgs;
  v4->diagnoseArgs = (NSString *)&stru_100026380;

  if (a1 >= 2)
  {
    id v6 = (uint64_t *)(a2 + 1);
    uint64_t v7 = a1 - 1;
    do
    {
      uint64_t v8 = *v6++;
      id v9 = +[NSString stringWithFormat:@" %s", v8];
      uint64_t v10 = [(NSString *)v4->diagnoseArgs stringByAppendingString:v9];
      id v11 = v4->diagnoseArgs;
      v4->diagnoseArgs = (NSString *)v10;

      --v7;
    }
    while (v7);
  }
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100016B58;
  v20[3] = &unk_100024DC8;
  uint64_t v12 = v4;
  uint64_t v21 = v12;
  sub_100009A00(&v23, &v22, "M:sfn:d:rletc", (const option *)&off_1000258C0, v20);
  [(BRCTLDiagnoseCommand *)v12 prepareDiagnose];
  if (v12->continueExecution)
  {
    v12->BOOL skipLogArchive = 1;
    uint64_t v13 = v4->diagnoseArgs;
    v4->diagnoseArgs = 0;
  }
  BOOL skipLogArchive = v12->skipLogArchive;
  uid_t v15 = getuid();
  if (skipLogArchive || v15 == 0)
  {
    if (v23 >= 2) {
      sub_1000099E8();
    }
    if (v23 == 1)
    {
      long long v17 = +[NSString stringWithUTF8String:*v22];
    }
    else
    {
      long long v17 = 0;
    }
    [(BRCTLDiagnoseCommand *)v12 diagnoseWithPath:v17];

    uint64_t v18 = 0;
  }
  else
  {
    printf("brctl diagnose must run as root to %s\n", "collect a log archive");
    uint64_t v18 = 1;
  }

  return v18;
}

id sub_100016B58(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) parseOption:a2 arg:a3];
}

Class sub_100016B68()
{
  if (!qword_10002A958)
  {
    qword_10002A958 = (uint64_t)dlopen("/System/Library/PrivateFrameworks/PassKitCore.framework/PassKitCore", 2);
    if (!qword_10002A958) {
      sub_1000171B0();
    }
  }
  Class Class = objc_getClass("PKDiagnostics");
  qword_10002A950 = (uint64_t)Class;
  if (!Class) {
    sub_100017274();
  }
  off_10002A8F0 = (uint64_t (*)())sub_100016BEC;

  return Class;
}

id sub_100016BEC()
{
  return (id)qword_10002A950;
}

void sub_100016BF8()
{
}

void sub_100016C24()
{
  __assert_rtn("-[BRCTLLogCommand getDepth:current:previous:forThread:]", "cmd-log.m", 631, "*current != [NSNull null]");
}

void sub_100016C50()
{
  __assert_rtn("-[BRCTLLogCommand getDepth:current:previous:forThread:]", "cmd-log.m", 632, "*previous != [NSNull null]");
}

void sub_100016C7C(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] _checkIfQueryShouldStop%@", (uint8_t *)&v2, 0xCu);
}

void sub_100016CF4()
{
}

void sub_100016D10()
{
}

void sub_100016D2C()
{
}

void sub_100016D48()
{
}

void sub_100016D64()
{
}

void sub_100016D80()
{
}

void sub_100016D9C()
{
}

void sub_100016DB8(void *a1, void *a2)
{
  uint64_t v3 = (const char *)[a1 UTF8String];
  id v4 = [a2 description];
  errx(1, "%s; error: %s", v3, v4);
}

void sub_100016E04(void *a1)
{
  id v1 = [a1 description];
  errx(1, "JSON Serialization failed: %s", v1);
}

void sub_100016E38()
{
}

void sub_100016E54()
{
}

void sub_100016E70()
{
  id v0 = brc_bread_crumbs();
  id v1 = brc_default_log();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    dlerror();
    sub_1000117DC((void *)&_mh_execute_header, v2, v3, "[WARNING] Can't open CloudDocsDaemon : %s%@", v4, v5, v6, v7, 2u);
  }

  __assert_rtn("CloudDocsDaemonLibrary", "/Library/Caches/com.apple.xbs/Sources/CloudDocs_plugins/brctl/brctl.m", 116, "Can't open CloudDocsDaemon");
}

void sub_100016F24()
{
}

void sub_100016F50()
{
  id v0 = brc_bread_crumbs();
  id v1 = brc_default_log();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    dlerror();
    sub_1000117DC((void *)&_mh_execute_header, v2, v3, "[WARNING] Can't open iCloudDriveCore : %s%@", v4, v5, v6, v7, 2u);
  }

  __assert_rtn("iCloudDriveCoreLibrary", "/Library/Caches/com.apple.xbs/Sources/CloudDocs_plugins/brctl/brctl.m", 106, "Can't open iCloudDriveCore");
}

void sub_100017004()
{
}

void sub_100017030()
{
}

void sub_10001704C(void *a1)
{
  id v1 = [a1 description];
  errx(1, "Unable to list versions: %s", v1);
}

void sub_100017080(void *a1)
{
  [a1 error];
  id v1 = [(id)objc_claimAutoreleasedReturnValue() description];
  errx(1, "Unable to drop Spotlight Index: %s", v1);
}

void sub_1000170BC()
{
}

void sub_1000170E8()
{
}

void sub_100017104()
{
}

void sub_100017120(void *a1)
{
}

void sub_10001714C(void *a1, void *a2)
{
  [a1 _printActionFailedWithError:a2];
  uint64_t v3 = [a2 localizedDescription];
  errx(1, "Print action failed with error: %s", v3);
}

void sub_100017194()
{
}

void sub_1000171B0()
{
  id v0 = brc_bread_crumbs();
  id v1 = brc_default_log();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    int v2 = 136315394;
    uint64_t v3 = dlerror();
    __int16 v4 = 2112;
    uint64_t v5 = v0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "[WARNING] Can't open PassKitCore : %s%@", (uint8_t *)&v2, 0x16u);
  }

  __assert_rtn("PassKitCoreLibrary", "/Library/Caches/com.apple.xbs/Sources/CloudDocs_plugins/brctl/cmd-diagnose.m", 40, "Can't open PassKitCore");
}

void sub_100017274()
{
}

uint64_t BRCPrettyPrintBitmap()
{
  return _BRCPrettyPrintBitmap();
}

uint64_t BREvictItemAtURLWithOptions()
{
  return _BREvictItemAtURLWithOptions();
}

uint64_t BRIsFPFSEnabled()
{
  return _BRIsFPFSEnabled();
}

uint64_t BRLocalizedFileSizeDescriptionWithExactCount()
{
  return _BRLocalizedFileSizeDescriptionWithExactCount();
}

uint64_t BRLogsAbsolutePath()
{
  return _BRLogsAbsolutePath();
}

uint64_t BRPerformWithAccountDescriptor()
{
  return _BRPerformWithAccountDescriptor();
}

uint64_t BRRegisterInitialSyncHandlerForContainer()
{
  return _BRRegisterInitialSyncHandlerForContainer();
}

uint64_t BRStartDownloadForItemsWithOptions()
{
  return _BRStartDownloadForItemsWithOptions();
}

CFArrayRef CFPreferencesCopyKeyList(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return _CFPreferencesCopyKeyList(applicationID, userName, hostName);
}

CFDictionaryRef CFPreferencesCopyMultiple(CFArrayRef keysToFetch, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return _CFPreferencesCopyMultiple(keysToFetch, applicationID, userName, hostName);
}

uint64_t MGCopyAnswer()
{
  return _MGCopyAnswer();
}

uint64_t MKBDeviceUnlockedSinceBoot()
{
  return _MKBDeviceUnlockedSinceBoot();
}

NSString *__cdecl NSHomeDirectoryForUser(NSString *userName)
{
  return _NSHomeDirectoryForUser(userName);
}

NSString *NSTemporaryDirectory(void)
{
  return _NSTemporaryDirectory();
}

uint64_t WriteStackshotReport()
{
  return _WriteStackshotReport();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFURLCopyLogicalNameOfPromiseAtURL()
{
  return __CFURLCopyLogicalNameOfPromiseAtURL();
}

uint64_t _CFURLIsPromiseName()
{
  return __CFURLIsPromiseName();
}

uint64_t _CFURLPromiseCopyPhysicalURL()
{
  return __CFURLPromiseCopyPhysicalURL();
}

uint64_t _CFXPCCreateXPCObjectFromCFObject()
{
  return __CFXPCCreateXPCObjectFromCFObject();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int *__error(void)
{
  return ___error();
}

uint64_t _brc_log_is_internal_install()
{
  return __brc_log_is_internal_install();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t archive_entry_free()
{
  return _archive_entry_free();
}

uint64_t archive_entry_new()
{
  return _archive_entry_new();
}

uint64_t archive_entry_set_pathname()
{
  return _archive_entry_set_pathname();
}

uint64_t archive_errno()
{
  return _archive_errno();
}

uint64_t archive_read_disk_entry_from_file()
{
  return _archive_read_disk_entry_from_file();
}

uint64_t archive_read_disk_new()
{
  return _archive_read_disk_new();
}

uint64_t archive_read_disk_set_standard_lookup()
{
  return _archive_read_disk_set_standard_lookup();
}

uint64_t archive_read_finish()
{
  return _archive_read_finish();
}

uint64_t archive_write_data()
{
  return _archive_write_data();
}

uint64_t archive_write_finish()
{
  return _archive_write_finish();
}

uint64_t archive_write_header()
{
  return _archive_write_header();
}

uint64_t archive_write_new()
{
  return _archive_write_new();
}

uint64_t archive_write_open_filename()
{
  return _archive_write_open_filename();
}

uint64_t archive_write_set_compression_gzip()
{
  return _archive_write_set_compression_gzip();
}

uint64_t archive_write_set_format_pax()
{
  return _archive_write_set_format_pax();
}

int atoi(const char *a1)
{
  return _atoi(a1);
}

uint64_t brc_bread_crumbs()
{
  return _brc_bread_crumbs();
}

uint64_t brc_default_log()
{
  return _brc_default_log();
}

objc_property_t *__cdecl class_copyPropertyList(Class cls, unsigned int *outCount)
{
  return _class_copyPropertyList(cls, outCount);
}

int close(int a1)
{
  return _close(a1);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
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

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return _dispatch_queue_attr_make_with_autorelease_frequency(attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return _dispatch_queue_attr_make_with_qos_class(attr, qos_class, relative_priority);
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

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

char *dlerror(void)
{
  return _dlerror();
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return _dlopen(__path, __mode);
}

int dprintf(int a1, const char *a2, ...)
{
  return _dprintf(a1, a2);
}

int dup(int a1)
{
  return _dup(a1);
}

void err(int a1, const char *a2, ...)
{
}

void err_set_exit_b(void *a1)
{
}

void err_set_file(void *a1)
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

int feof(FILE *a1)
{
  return _feof(a1);
}

int fflush(FILE *a1)
{
  return _fflush(a1);
}

int fileno(FILE *a1)
{
  return _fileno(a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return _fopen(__filename, __mode);
}

uint64_t fp_shouldObfuscateFilenames()
{
  return _fp_shouldObfuscateFilenames();
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return _fprintf(a1, a2);
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

int fts_close(FTS *a1)
{
  return _fts_close(a1);
}

FTS *__cdecl fts_open(char *const *a1, int a2, int (__cdecl *a3)(const FTSENT **, const FTSENT **))
{
  return _fts_open(a1, a2, a3);
}

FTSENT *__cdecl fts_read(FTS *a1)
{
  return _fts_read(a1);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return _fwrite(__ptr, __size, __nitems, __stream);
}

uid_t geteuid(void)
{
  return _geteuid();
}

int gethostname(char *a1, size_t a2)
{
  return _gethostname(a1, a2);
}

ssize_t getline(char **__linep, size_t *__linecapp, FILE *__stream)
{
  return _getline(__linep, __linecapp, __stream);
}

int getopt_long(int a1, char *const *a2, const char *a3, const option *a4, int *a5)
{
  return _getopt_long(a1, a2, a3, a4, a5);
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

int isatty(int a1)
{
  return _isatty(a1);
}

int kill(pid_t a1, int a2)
{
  return _kill(a1, a2);
}

int lstat(const char *a1, stat *a2)
{
  return _lstat(a1, a2);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
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

id objc_begin_catch(void *exc_buf)
{
  return _objc_begin_catch(exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

Class objc_getClass(const char *name)
{
  return _objc_getClass(name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
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

id objc_retainAutoreleasedReturnValue(id a1)
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

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

int open(const char *a1, int a2, ...)
{
  return _open(a1, a2);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_variant_has_internal_content()
{
  return _os_variant_has_internal_content();
}

int printf(const char *a1, ...)
{
  return _printf(a1);
}

int proc_pidpath(int pid, void *buffer, uint32_t buffersize)
{
  return _proc_pidpath(pid, buffer, buffersize);
}

const char *__cdecl property_getName(objc_property_t property)
{
  return _property_getName(property);
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

uint64_t sandbox_check()
{
  return _sandbox_check();
}

int setenv(const char *__name, const char *__value, int __overwrite)
{
  return _setenv(__name, __value, __overwrite);
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return _signal(a1, a2);
}

int stat(const char *a1, stat *a2)
{
  return _stat(a1, a2);
}

int strcasecmp(const char *a1, const char *a2)
{
  return _strcasecmp(a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

size_t strcspn(const char *__s, const char *__charset)
{
  return _strcspn(__s, __charset);
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

char *__cdecl strrchr(char *__s, int __c)
{
  return _strrchr(__s, __c);
}

uint64_t strtoll(const char *__str, char **__endptr, int __base)
{
  return _strtoll(__str, __endptr, __base);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return _sysctl(a1, a2, a3, a4, a5, a6);
}

FILE *tmpfile(void)
{
  return _tmpfile();
}

void warnx(const char *a1, ...)
{
}

BOOL xpc_BOOL_get_value(xpc_object_t xBOOL)
{
  return _xpc_BOOL_get_value(xBOOL);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return _xpc_connection_create_mach_service(name, targetq, flags);
}

void xpc_connection_resume(xpc_connection_t connection)
{
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return _xpc_connection_send_message_with_reply_sync(connection, message);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_value(xdict, key);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return _xpc_get_type(object);
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return [a1 URL];
}

id objc_msgSend_URLByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 URLByDeletingLastPathComponent];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend__createSecureDiagnoseDirectory(void *a1, const char *a2, ...)
{
  return [a1 _createSecureDiagnoseDirectory];
}

id objc_msgSend__diagnoseParentPath(void *a1, const char *a2, ...)
{
  return [a1 _diagnoseParentPath];
}

id objc_msgSend__moveMobileLogs(void *a1, const char *a2, ...)
{
  return [a1 _moveMobileLogs];
}

id objc_msgSend__printActionEnd(void *a1, const char *a2, ...)
{
  return [a1 _printActionEnd];
}

id objc_msgSend__printActionFailed(void *a1, const char *a2, ...)
{
  return [a1 _printActionFailed];
}

id objc_msgSend_accountIdentifier(void *a1, const char *a2, ...)
{
  return [a1 accountIdentifier];
}

id objc_msgSend_allContainers(void *a1, const char *a2, ...)
{
  return [a1 allContainers];
}

id objc_msgSend_allContainersByContainerID(void *a1, const char *a2, ...)
{
  return [a1 allContainersByContainerID];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_allLoggedInAccountDescriptors(void *a1, const char *a2, ...)
{
  return [a1 allLoggedInAccountDescriptors];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return [a1 allObjects];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return [a1 allValues];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_buildPredicateFromString(void *a1, const char *a2, ...)
{
  return [a1 buildPredicateFromString];
}

id objc_msgSend_bundleIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifiers];
}

id objc_msgSend_category(void *a1, const char *a2, ...)
{
  return [a1 category];
}

id objc_msgSend_cloudDocsLogPath(void *a1, const char *a2, ...)
{
  return [a1 cloudDocsLogPath];
}

id objc_msgSend_cloudKitLogPath(void *a1, const char *a2, ...)
{
  return [a1 cloudKitLogPath];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_crashLogsPaths(void *a1, const char *a2, ...)
{
  return [a1 crashLogsPaths];
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return [a1 currentDevice];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_dateFormatter(void *a1, const char *a2, ...)
{
  return [a1 dateFormatter];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_defaultConnection(void *a1, const char *a2, ...)
{
  return [a1 defaultConnection];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_defaultStore(void *a1, const char *a2, ...)
{
  return [a1 defaultStore];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_deviceName(void *a1, const char *a2, ...)
{
  return [a1 deviceName];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_disableUpdates(void *a1, const char *a2, ...)
{
  return [a1 disableUpdates];
}

id objc_msgSend_distantFuture(void *a1, const char *a2, ...)
{
  return [a1 distantFuture];
}

id objc_msgSend_distantPast(void *a1, const char *a2, ...)
{
  return [a1 distantPast];
}

id objc_msgSend_documentsURL(void *a1, const char *a2, ...)
{
  return [a1 documentsURL];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_enableUpdates(void *a1, const char *a2, ...)
{
  return [a1 enableUpdates];
}

id objc_msgSend_endDate(void *a1, const char *a2, ...)
{
  return [a1 endDate];
}

id objc_msgSend_environment(void *a1, const char *a2, ...)
{
  return [a1 environment];
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return [a1 error];
}

id objc_msgSend_etag(void *a1, const char *a2, ...)
{
  return [a1 etag];
}

id objc_msgSend_eventMessage(void *a1, const char *a2, ...)
{
  return [a1 eventMessage];
}

id objc_msgSend_eventType(void *a1, const char *a2, ...)
{
  return [a1 eventType];
}

id objc_msgSend_exec(void *a1, const char *a2, ...)
{
  return [a1 exec];
}

id objc_msgSend_fileDescriptor(void *a1, const char *a2, ...)
{
  return [a1 fileDescriptor];
}

id objc_msgSend_fileHandleWithStandardOutput(void *a1, const char *a2, ...)
{
  return [a1 fileHandleWithStandardOutput];
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return [a1 fileSystemRepresentation];
}

id objc_msgSend_fileType(void *a1, const char *a2, ...)
{
  return [a1 fileType];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return [a1 floatValue];
}

id objc_msgSend_fractionCompleted(void *a1, const char *a2, ...)
{
  return [a1 fractionCompleted];
}

id objc_msgSend_hasLocalContents(void *a1, const char *a2, ...)
{
  return [a1 hasLocalContents];
}

id objc_msgSend_hasThumbnail(void *a1, const char *a2, ...)
{
  return [a1 hasThumbnail];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_isAtEnd(void *a1, const char *a2, ...)
{
  return [a1 isAtEnd];
}

id objc_msgSend_isCancelled(void *a1, const char *a2, ...)
{
  return [a1 isCancelled];
}

id objc_msgSend_isCloudSyncTCCDisabled(void *a1, const char *a2, ...)
{
  return [a1 isCloudSyncTCCDisabled];
}

id objc_msgSend_isConflict(void *a1, const char *a2, ...)
{
  return [a1 isConflict];
}

id objc_msgSend_isDataSeparated(void *a1, const char *a2, ...)
{
  return [a1 isDataSeparated];
}

id objc_msgSend_isDataSeparatedAccount(void *a1, const char *a2, ...)
{
  return [a1 isDataSeparatedAccount];
}

id objc_msgSend_isDocumentScopePublic(void *a1, const char *a2, ...)
{
  return [a1 isDocumentScopePublic];
}

id objc_msgSend_isEnumeratingDirectoryPostOrder(void *a1, const char *a2, ...)
{
  return [a1 isEnumeratingDirectoryPostOrder];
}

id objc_msgSend_isFinished(void *a1, const char *a2, ...)
{
  return [a1 isFinished];
}

id objc_msgSend_isGlobal(void *a1, const char *a2, ...)
{
  return [a1 isGlobal];
}

id objc_msgSend_isInInitialState(void *a1, const char *a2, ...)
{
  return [a1 isInInitialState];
}

id objc_msgSend_isIndeterminate(void *a1, const char *a2, ...)
{
  return [a1 isIndeterminate];
}

id objc_msgSend_isPaused(void *a1, const char *a2, ...)
{
  return [a1 isPaused];
}

id objc_msgSend_isResolved(void *a1, const char *a2, ...)
{
  return [a1 isResolved];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return [a1 lastObject];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 lastPathComponent];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_localizedAdditionalDescription(void *a1, const char *a2, ...)
{
  return [a1 localizedAdditionalDescription];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return [a1 localizedDescription];
}

id objc_msgSend_localizedName(void *a1, const char *a2, ...)
{
  return [a1 localizedName];
}

id objc_msgSend_localizedNameOfSavingComputer(void *a1, const char *a2, ...)
{
  return [a1 localizedNameOfSavingComputer];
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return [a1 longLongValue];
}

id objc_msgSend_mainRunLoop(void *a1, const char *a2, ...)
{
  return [a1 mainRunLoop];
}

id objc_msgSend_manager(void *a1, const char *a2, ...)
{
  return [a1 manager];
}

id objc_msgSend_mangledIDString(void *a1, const char *a2, ...)
{
  return [a1 mangledIDString];
}

id objc_msgSend_messageType(void *a1, const char *a2, ...)
{
  return [a1 messageType];
}

id objc_msgSend_mobileDocumentsURL(void *a1, const char *a2, ...)
{
  return [a1 mobileDocumentsURL];
}

id objc_msgSend_modificationDate(void *a1, const char *a2, ...)
{
  return [a1 modificationDate];
}

id objc_msgSend_monitorGlobalActivity(void *a1, const char *a2, ...)
{
  return [a1 monitorGlobalActivity];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_newFPFSSyncProxy(void *a1, const char *a2, ...)
{
  return [a1 newFPFSSyncProxy];
}

id objc_msgSend_newLegacySyncProxy(void *a1, const char *a2, ...)
{
  return [a1 newLegacySyncProxy];
}

id objc_msgSend_newSyncProxy(void *a1, const char *a2, ...)
{
  return [a1 newSyncProxy];
}

id objc_msgSend_newlineCharacterSet(void *a1, const char *a2, ...)
{
  return [a1 newlineCharacterSet];
}

id objc_msgSend_nextObject(void *a1, const char *a2, ...)
{
  return [a1 nextObject];
}

id objc_msgSend_now(void *a1, const char *a2, ...)
{
  return [a1 now];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return [a1 null];
}

id objc_msgSend_objectEnumerator(void *a1, const char *a2, ...)
{
  return [a1 objectEnumerator];
}

id objc_msgSend_organizationName(void *a1, const char *a2, ...)
{
  return [a1 organizationName];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_persistentIdentifier(void *a1, const char *a2, ...)
{
  return [a1 persistentIdentifier];
}

id objc_msgSend_personaIdentifier(void *a1, const char *a2, ...)
{
  return [a1 personaIdentifier];
}

id objc_msgSend_prepareDiagnose(void *a1, const char *a2, ...)
{
  return [a1 prepareDiagnose];
}

id objc_msgSend_previousDescription(void *a1, const char *a2, ...)
{
  return [a1 previousDescription];
}

id objc_msgSend_processID(void *a1, const char *a2, ...)
{
  return [a1 processID];
}

id objc_msgSend_processImagePath(void *a1, const char *a2, ...)
{
  return [a1 processImagePath];
}

id objc_msgSend_processInfo(void *a1, const char *a2, ...)
{
  return [a1 processInfo];
}

id objc_msgSend_processUniqueID(void *a1, const char *a2, ...)
{
  return [a1 processUniqueID];
}

id objc_msgSend_progressObserved(void *a1, const char *a2, ...)
{
  return [a1 progressObserved];
}

id objc_msgSend_reason(void *a1, const char *a2, ...)
{
  return [a1 reason];
}

id objc_msgSend_removeLastObject(void *a1, const char *a2, ...)
{
  return [a1 removeLastObject];
}

id objc_msgSend_reset(void *a1, const char *a2, ...)
{
  return [a1 reset];
}

id objc_msgSend_resetRedirect(void *a1, const char *a2, ...)
{
  return [a1 resetRedirect];
}

id objc_msgSend_result(void *a1, const char *a2, ...)
{
  return [a1 result];
}

id objc_msgSend_resultCount(void *a1, const char *a2, ...)
{
  return [a1 resultCount];
}

id objc_msgSend_results(void *a1, const char *a2, ...)
{
  return [a1 results];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return [a1 run];
}

id objc_msgSend_scanLocation(void *a1, const char *a2, ...)
{
  return [a1 scanLocation];
}

id objc_msgSend_scopes(void *a1, const char *a2, ...)
{
  return [a1 scopes];
}

id objc_msgSend_sectionRoot(void *a1, const char *a2, ...)
{
  return [a1 sectionRoot];
}

id objc_msgSend_seekToEndOfFile(void *a1, const char *a2, ...)
{
  return [a1 seekToEndOfFile];
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return [a1 size];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return [a1 standardUserDefaults];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return [a1 start];
}

id objc_msgSend_startPager(void *a1, const char *a2, ...)
{
  return [a1 startPager];
}

id objc_msgSend_startQuery(void *a1, const char *a2, ...)
{
  return [a1 startQuery];
}

id objc_msgSend_stopQuery(void *a1, const char *a2, ...)
{
  return [a1 stopQuery];
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return [a1 string];
}

id objc_msgSend_stringByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 stringByDeletingLastPathComponent];
}

id objc_msgSend_stringForReset(void *a1, const char *a2, ...)
{
  return [a1 stringForReset];
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return [a1 stringValue];
}

id objc_msgSend_subsystem(void *a1, const char *a2, ...)
{
  return [a1 subsystem];
}

id objc_msgSend_threadID(void *a1, const char *a2, ...)
{
  return [a1 threadID];
}

id objc_msgSend_timestamp(void *a1, const char *a2, ...)
{
  return [a1 timestamp];
}

id objc_msgSend_timezone(void *a1, const char *a2, ...)
{
  return [a1 timezone];
}

id objc_msgSend_traceID(void *a1, const char *a2, ...)
{
  return [a1 traceID];
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongLongValue];
}

id objc_msgSend_url(void *a1, const char *a2, ...)
{
  return [a1 url];
}

id objc_msgSend_useColor(void *a1, const char *a2, ...)
{
  return [a1 useColor];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_userVersion(void *a1, const char *a2, ...)
{
  return [a1 userVersion];
}

id objc_msgSend_username(void *a1, const char *a2, ...)
{
  return [a1 username];
}

id objc_msgSend_waitStatus(void *a1, const char *a2, ...)
{
  return [a1 waitStatus];
}

id objc_msgSend_waitUntilAllOperationsAreFinished(void *a1, const char *a2, ...)
{
  return [a1 waitUntilAllOperationsAreFinished];
}

id objc_msgSend_whitespaceAndNewlineCharacterSet(void *a1, const char *a2, ...)
{
  return [a1 whitespaceAndNewlineCharacterSet];
}

id objc_msgSend_whitespaceCharacterSet(void *a1, const char *a2, ...)
{
  return [a1 whitespaceCharacterSet];
}

id objc_msgSend_writeToFile_atomically_encoding_error_(void *a1, const char *a2, ...)
{
  return [a1 writeToFile:x0 atomically:x1 encoding:x2 error:x3];
}