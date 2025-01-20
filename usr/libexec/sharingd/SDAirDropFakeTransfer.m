@interface SDAirDropFakeTransfer
+ (id)sharedFakeTransfer;
- (BOOL)debugModeEnabled;
- (SDAirDropAlertManagerProtocol)transferManager;
- (SDAirDropFakeTransfer)init;
- (id)createBlockToPerformBlockOnMainQueue:(id)a3 withDelay:(float)a4;
- (id)generateFakeTransferDataFromBundleID:(id)a3 files:(id)a4 items:(id)a5 itemsDescription:(id)a6;
- (id)writeDataToFile:(id)a3 ofType:(id)a4;
- (void)addIconPropertiesWithImage:(CGImage *)a3 toFakeTransferData:(id)a4;
- (void)addProgressPropertiesWithBytesCopied:(int64_t)a3 totalBytes:(int64_t)a4 timeRemaining:(int64_t)a5 filesCopied:(int64_t)a6 toFakeTransferData:(id)a7;
- (void)replaceItemsWithItems:(id)a3 inFakeTransferData:(id)a4;
- (void)setDebugModeEnabled:(BOOL)a3;
- (void)setTransferManager:(id)a3;
- (void)startFakeTransferInCategory:(int64_t)a3 ofType:(int64_t)a4;
- (void)startFakeTransferWithItemSources:(id)a3;
- (void)startFakeTransferWithItems:(id)a3 fromBundleID:(id)a4 withItemsDescription:(id)a5 previewImage:(id)a6 desiredDuration:(float)a7 totalBytes:(int64_t)a8;
@end

@implementation SDAirDropFakeTransfer

+ (id)sharedFakeTransfer
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000D6314;
  block[3] = &unk_1008CB370;
  block[4] = a1;
  if (qword_10097FE60 != -1) {
    dispatch_once(&qword_10097FE60, block);
  }
  v2 = (void *)qword_10097FE58;

  return v2;
}

- (SDAirDropFakeTransfer)init
{
  v9.receiver = self;
  v9.super_class = (Class)SDAirDropFakeTransfer;
  v2 = [(SDAirDropFakeTransfer *)&v9 init];
  if (!v2) {
    goto LABEL_5;
  }
  uint64_t v3 = +[NSBundle bundleWithPath:@"/AppleInternal/Applications/SharingDemo.app"];
  bundle = v2->_bundle;
  v2->_bundle = (NSBundle *)v3;

  if (!v2->_bundle) {
    goto LABEL_7;
  }
  v5 = +[SDStatusMonitor sharedMonitor];
  if (([v5 enableDebugMode] & 1) == 0)
  {

    goto LABEL_7;
  }
  int v6 = IsAppleInternalBuild();

  if (!v6)
  {
LABEL_7:
    v7 = 0;
    goto LABEL_8;
  }
LABEL_5:
  v7 = v2;
LABEL_8:

  return v7;
}

- (void)setDebugModeEnabled:(BOOL)a3
{
  if (self->_debugModeEnabled != a3)
  {
    self->_debugModeEnabled = a3;
    if (a3)
    {
      if ([&off_100906E48 count])
      {
        unint64_t v4 = 0;
        do
        {
          if (v4 <= 8)
          {
            uint64_t v5 = (uint64_t)[off_1008CCD18[v4] count];
            if (v5 >= 1)
            {
              uint64_t v6 = v5;
              for (uint64_t i = 0; i != v6; ++i)
              {
                v8 = +[NSString stringWithFormat:@"%ld.%ld", v4, i];
                objc_super v9 = [@"com.apple.sharingd.fake.transfer." stringByAppendingString:v8];
                v10 = airdrop_log();
                if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  v14 = v9;
                  _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "fakeTransfer notification observer %@", buf, 0xCu);
                }

                DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
                CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)sub_1000D6618, v9, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
              }
            }
          }
          ++v4;
        }
        while (v4 < (unint64_t)[&off_100906E48 count]);
      }
    }
    else
    {
      v12 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterRemoveEveryObserver(v12, self);
    }
  }
}

- (void)startFakeTransferInCategory:(int64_t)a3 ofType:(int64_t)a4
{
  uint64_t v6 = +[SDASharedItemsFactory sharedItemsInCategory:ofType:](SDASharedItemsFactory, "sharedItemsInCategory:ofType:");
  v7 = v6;
  int64_t v30 = a3;
  if ((unint64_t)(a3 - 7) < 2)
  {
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v8 = [v6 countByEnumeratingWithState:&v32 objects:v40 count:16];
    if (!v8) {
      goto LABEL_25;
    }
    id v9 = v8;
    uint64_t v10 = *(void *)v33;
    while (1)
    {
      for (uint64_t i = 0; i != v9; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v33 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        v13 = [v12 data];

        if (v13)
        {
          v14 = [v12 data];
          v15 = [v12 uti];
          v16 = [(SDAirDropFakeTransfer *)self writeDataToFile:v14 ofType:v15];

          goto LABEL_11;
        }
        v17 = [v12 string];

        if (v17)
        {
          v18 = [v12 string];
          v14 = [v18 dataUsingEncoding:4];

          v16 = [(SDAirDropFakeTransfer *)self writeDataToFile:v14 ofType:kUTTypePlainText];
LABEL_11:

          if (v16) {
            goto LABEL_13;
          }
        }
        v16 = [v12 URL];
LABEL_13:
        [v12 setURL:v16];

        [v12 setData:0];
        [v12 setUti:0];
        [v12 setString:0];
      }
      id v9 = [v7 countByEnumeratingWithState:&v32 objects:v40 count:16];
      if (!v9) {
        goto LABEL_25;
      }
    }
  }
  if (a3 == 2 && (unint64_t)(a4 - 3) <= 4)
  {
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v19 = [v6 countByEnumeratingWithState:&v36 objects:v43 count:16];
    if (v19)
    {
      id v20 = v19;
      uint64_t v21 = *(void *)v37;
      do
      {
        for (j = 0; j != v20; j = (char *)j + 1)
        {
          if (*(void *)v37 != v21) {
            objc_enumerationMutation(v7);
          }
          v23 = *(void **)(*((void *)&v36 + 1) + 8 * (void)j);
          v41[0] = @"SFAirDropActivitySubjectMain";
          v24 = [v23 subject];
          v41[1] = @"SFAirDropActivitySubjectiTunesStoreLinkType";
          v42[0] = v24;
          v25 = +[NSNumber numberWithInteger:a4 - 2];
          v42[1] = v25;
          v26 = +[NSDictionary dictionaryWithObjects:v42 forKeys:v41 count:2];

          v27 = +[NSJSONSerialization dataWithJSONObject:v26 options:0 error:0];
          id v28 = [objc_alloc((Class)NSString) initWithData:v27 encoding:4];
          [v23 setSubject:v28];
        }
        id v20 = [v7 countByEnumeratingWithState:&v36 objects:v43 count:16];
      }
      while (v20);
    }
  }
LABEL_25:
  if (v7)
  {
    [(SDAirDropFakeTransfer *)self startFakeTransferWithItemSources:v7];
  }
  else
  {
    v29 = airdrop_log();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      sub_1000D8060(v30, a4, v29);
    }
  }
}

- (void)startFakeTransferWithItemSources:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 valueForKeyPath:@"@sum.fakeDuration"];
  [v5 floatValue];
  int v7 = v6;

  id v8 = [v4 valueForKeyPath:@"@sum.fakeBytes"];
  id v9 = [v8 longLongValue];

  id v15 = [v4 objectAtIndexedSubscript:0];
  uint64_t v10 = +[SDASharedItemsFactory plainItemsFromItemSources:v4];

  v11 = [v15 fakeBundleID];
  v12 = [v15 subject];
  v13 = [v15 previewImage];
  LODWORD(v14) = v7;
  [(SDAirDropFakeTransfer *)self startFakeTransferWithItems:v10 fromBundleID:v11 withItemsDescription:v12 previewImage:v13 desiredDuration:v9 totalBytes:v14];
}

- (void)startFakeTransferWithItems:(id)a3 fromBundleID:(id)a4 withItemsDescription:(id)a5 previewImage:(id)a6 desiredDuration:(float)a7 totalBytes:(int64_t)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  v17 = [v13 firstObject];
  unsigned int v18 = [v17 isFileURL];

  id v19 = +[NSUUID UUID];
  id v20 = [v19 UUIDString];

  uint64_t v21 = sub_1001B2E7C();
  if (v21)
  {
    v22 = v21;
    unsigned int v67 = v18;
    v66 = self;
    v23 = [v21 URLByAppendingPathComponent:@"com.apple.AirDrop" isDirectory:1];

    v24 = [v23 URLByAppendingPathComponent:v20 isDirectory:1];

    id v25 = objc_alloc((Class)NSProgress);
    v69 = [v25 sf_initWithFileURL:v24];

    uint64_t v26 = [v24 URLByAppendingPathComponent:@"Files" isDirectory:1];

    NSFileAttributeKey v120 = NSFileProtectionKey;
    NSFileProtectionType v121 = NSFileProtectionCompleteUntilFirstUserAuthentication;
    uint64_t v27 = +[NSDictionary dictionaryWithObjects:&v121 forKeys:&v120 count:1];
    id v28 = +[NSFileManager defaultManager];
    id v114 = 0;
    os_log_t log = (os_log_t)v26;
    v68 = (void *)v27;
    LODWORD(v26) = [v28 createDirectoryAtURL:v26 withIntermediateDirectories:1 attributes:v27 error:&v114];
    id v29 = v114;

    if (!v26)
    {
      v44 = airdrop_log();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
        sub_1000D812C((uint64_t)v29, v44);
      }
      goto LABEL_31;
    }
    id v61 = v13;
    v62 = v20;
    id v64 = v15;
    id v65 = v14;
    id v63 = v16;
    if (v67)
    {
      v72 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v13 count]);
      long long v110 = 0u;
      long long v111 = 0u;
      long long v112 = 0u;
      long long v113 = 0u;
      id obj = v13;
      id v30 = [obj countByEnumeratingWithState:&v110 objects:v119 count:16];
      if (v30)
      {
        id v31 = v30;
        char v70 = 0;
        uint64_t v32 = *(void *)v111;
        do
        {
          for (uint64_t i = 0; i != v31; uint64_t i = (char *)i + 1)
          {
            if (*(void *)v111 != v32) {
              objc_enumerationMutation(obj);
            }
            long long v34 = *(void **)(*((void *)&v110 + 1) + 8 * i);
            long long v35 = [v34 lastPathComponent];
            long long v36 = [log URLByAppendingPathComponent:v35 isDirectory:0];

            long long v37 = +[NSFileManager defaultManager];
            id v109 = v29;
            unsigned int v38 = [v37 copyItemAtURL:v34 toURL:v36 error:&v109];
            id v39 = v109;

            if (v38)
            {
              [v72 addObject:v36];
              v40 = +[NSFileManager defaultManager];
              v41 = [v36 path];
              id v108 = v39;
              v42 = [v40 attributesOfItemAtPath:v41 error:&v108];
              id v29 = v108;

              v43 = [v42 objectForKeyedSubscript:NSFileSize];
              a8 += (int64_t)[v43 longLongValue];
            }
            else
            {
              v42 = airdrop_log();
              if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412546;
                v116 = v34;
                __int16 v117 = 2112;
                id v118 = v39;
                _os_log_error_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_ERROR, "startFakeTransferWithItems copyItemAtURL %@ failed %@", buf, 0x16u);
              }
              char v70 = 1;
              id v29 = v39;
            }
          }
          id v31 = [obj countByEnumeratingWithState:&v110 objects:v119 count:16];
        }
        while (v31);
      }
      else
      {
        char v70 = 0;
      }

      v44 = [v72 copy];
      if (v70) {
        goto LABEL_30;
      }
      id v13 = &__NSArray0__struct;
      id v15 = v64;
      id v14 = v65;
      id v20 = v62;
      id v16 = v63;
    }
    else
    {
      v44 = &__NSArray0__struct;
    }
    id v45 = objc_alloc_init((Class)NSOperationQueue);
    [v45 setMaxConcurrentOperationCount:1];
    [v45 setSuspended:1];
    v106[0] = _NSConcreteStackBlock;
    v106[1] = 3221225472;
    v106[2] = sub_1000D74DC;
    v106[3] = &unk_1008CA4B8;
    id v46 = v45;
    id v107 = v46;
    [v69 setCancellationHandler:v106];
    v71 = v44;
    [(SDAirDropFakeTransfer *)v66 generateFakeTransferDataFromBundleID:v14 files:v44 items:v13 itemsDescription:v15];
    v101[0] = _NSConcreteStackBlock;
    v101[1] = 3221225472;
    v101[2] = sub_1000D74E4;
    v101[3] = &unk_1008CA770;
    id obja = (id)objc_claimAutoreleasedReturnValue();
    id v102 = obja;
    id v103 = v16;
    v104 = v66;
    id v73 = v20;
    id v105 = v73;
    v47 = [(SDAirDropFakeTransfer *)v66 createBlockToPerformBlockOnMainQueue:v101 withDelay:0.0];
    [v46 addOperationWithBlock:v47];

    v98[0] = _NSConcreteStackBlock;
    v98[1] = 3221225472;
    v98[2] = sub_1000D7570;
    v98[3] = &unk_1008CBF30;
    id v48 = v69;
    id v99 = v48;
    int64_t v100 = a8;
    v49 = [(SDAirDropFakeTransfer *)v66 createBlockToPerformBlockOnMainQueue:v98 withDelay:0.0];
    [v46 addOperationWithBlock:v49];

    int64_t v50 = a8;
    int v51 = (int)(float)(a7 + a7);
    if (v51 >= 1)
    {
      int v52 = 0;
      do
      {
        ++v52;
        v88[0] = _NSConcreteStackBlock;
        v88[1] = 3221225472;
        v88[2] = sub_1000D75C4;
        v88[3] = &unk_1008CCC60;
        uint64_t v93 = (uint64_t)(double)(a8 / v51);
        int v95 = v52;
        float v96 = a7;
        int v97 = 1056964608;
        id v89 = v48;
        id v90 = obja;
        v91 = v66;
        int64_t v94 = v50;
        id v92 = v73;
        LODWORD(v53) = 0.5;
        v54 = [(SDAirDropFakeTransfer *)v66 createBlockToPerformBlockOnMainQueue:v88 withDelay:v53];
        [v46 addOperationWithBlock:v54];

        int64_t v50 = a8;
      }
      while (v51 != v52);
    }
    v80[0] = _NSConcreteStackBlock;
    v80[1] = 3221225472;
    v80[2] = sub_1000D76B4;
    v80[3] = &unk_1008CCC88;
    id v55 = v48;
    id v81 = v55;
    id v82 = obja;
    int64_t v86 = v50;
    v83 = v66;
    char v87 = v67;
    v44 = v71;
    v84 = v44;
    id v85 = v73;
    id v56 = obja;
    LODWORD(v57) = 0.5;
    v58 = [(SDAirDropFakeTransfer *)v66 createBlockToPerformBlockOnMainQueue:v80 withDelay:v57];
    [v46 addOperationWithBlock:v58];

    v78[0] = _NSConcreteStackBlock;
    v78[1] = 3221225472;
    v78[2] = sub_1000D7764;
    v78[3] = &unk_1008CA4B8;
    id v79 = v55;
    LODWORD(v59) = 2.0;
    v60 = [(SDAirDropFakeTransfer *)v66 createBlockToPerformBlockOnMainQueue:v78 withDelay:v59];
    [v46 addOperationWithBlock:v60];

    [v46 setSuspended:0];
LABEL_30:
    id v13 = v61;
    id v20 = v62;
    id v15 = v64;
    id v14 = v65;
    id v16 = v63;
LABEL_31:

    goto LABEL_32;
  }
  airdrop_log();
  os_log_t log = (os_log_t)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
    sub_1000D80E8(log);
  }
  id v29 = 0;
LABEL_32:
}

- (id)writeDataToFile:(id)a3 ofType:(id)a4
{
  uint64_t v5 = (__CFString *)a4;
  id v6 = a3;
  int v7 = (__CFString *)UTTypeCopyPreferredTagWithClass(v5, kUTTagClassFilenameExtension);
  CFStringRef v8 = UTTypeCopyDescription(v5);
  id v9 = (__CFString *)v8;
  if (v8) {
    CFStringRef v10 = v8;
  }
  else {
    CFStringRef v10 = v5;
  }
  v11 = +[NSUUID UUID];
  v12 = [v11 UUIDString];
  id v13 = +[NSString stringWithFormat:@"%@-%@.%@", v10, v12, v7];

  id v14 = NSTemporaryDirectory();
  id v15 = [v14 stringByAppendingPathComponent:v13];
  [v6 writeToFile:v15 atomically:1];

  id v16 = +[NSURL fileURLWithPath:v15];

  return v16;
}

- (id)createBlockToPerformBlockOnMainQueue:(id)a3 withDelay:(float)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000D7964;
  v7[3] = &unk_1008CCCD8;
  float v9 = a4;
  id v8 = a3;
  id v4 = v8;
  uint64_t v5 = objc_retainBlock(v7);

  return v5;
}

- (id)generateFakeTransferDataFromBundleID:(id)a3 files:(id)a4 items:(id)a5 itemsDescription:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = +[NSMutableDictionary dictionary];
  [v13 setObject:v9 forKeyedSubscript:kSFOperationBundleIDKey];
  id v14 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v10 count]);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v15 = v10;
  id v16 = (char *)[v15 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v16)
  {
    v17 = v16;
    uint64_t v18 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v25 != v18) {
          objc_enumerationMutation(v15);
        }
        id v20 = SFGenerateFileInfoForURL();
        [v14 addObject:v20, v24];
      }
      v17 = (char *)[v15 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v17);
  }

  id v21 = [v14 copy];
  [v13 setObject:v21 forKeyedSubscript:kSFOperationFilesKey];

  [v13 setObject:v11 forKeyedSubscript:kSFOperationItemsKey];
  id v22 = [v12 copy];
  [v13 setObject:v22 forKeyedSubscript:kSFOperationItemsDescriptionKey];

  [v13 setObject:@"John's iPhone" forKeyedSubscript:kSFOperationSenderComputerNameKey];
  [v13 setObject:@"john_doe86@icloud.com" forKeyedSubscript:kSFOperationSenderEmailKey];
  [v13 setObject:@"John" forKeyedSubscript:kSFOperationSenderFirstNameKey];
  [v13 setObject:@"7g63429g1d7d" forKeyedSubscript:kSFOperationSenderIDKey];
  [v13 setObject:@"Doe" forKeyedSubscript:kSFOperationSenderLastNameKey];
  [v13 setObject:@"John Doe" forKeyedSubscript:kSFOperationSenderCompositeNameKey];
  [v13 setObject:&__kCFBooleanTrue forKeyedSubscript:kSFOperationVerifiableIdentityKey];

  return v13;
}

- (void)addIconPropertiesWithImage:(CGImage *)a3 toFakeTransferData:(id)a4
{
}

- (void)addProgressPropertiesWithBytesCopied:(int64_t)a3 totalBytes:(int64_t)a4 timeRemaining:(int64_t)a5 filesCopied:(int64_t)a6 toFakeTransferData:(id)a7
{
  id v11 = a7;
  [v11 setObject:@"application/x-cpio" forKeyedSubscript:@"Content-Type"];
  id v12 = +[NSNumber numberWithLongLong:a3];
  [v11 setObject:v12 forKeyedSubscript:kSFOperationBytesCopiedKey];

  id v13 = +[NSNumber numberWithLongLong:a4];
  [v11 setObject:v13 forKeyedSubscript:kSFOperationTotalBytesKey];

  id v14 = +[NSNumber numberWithInteger:a5];
  [v11 setObject:v14 forKeyedSubscript:kSFOperationTimeRemainingKey];

  id v15 = +[NSNumber numberWithInteger:a6];
  [v11 setObject:v15 forKeyedSubscript:kSFOperationFilesCopiedKey];
}

- (void)replaceItemsWithItems:(id)a3 inFakeTransferData:(id)a4
{
}

- (SDAirDropAlertManagerProtocol)transferManager
{
  return self->_transferManager;
}

- (void)setTransferManager:(id)a3
{
}

- (BOOL)debugModeEnabled
{
  return self->_debugModeEnabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transferManager, 0);

  objc_storeStrong((id *)&self->_bundle, 0);
}

@end