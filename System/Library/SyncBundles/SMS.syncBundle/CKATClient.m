@interface CKATClient
+ (void)restoreProtectedCloudStorageMobileBackup;
- (BOOL)_isABCache:(id)a3;
- (BOOL)_isAttachment:(id)a3;
- (BOOL)_isLegacyAttachment:(id)a3;
- (BOOL)_isMessagesPath:(id)a3;
- (BOOL)_isSMSTempDB:(id)a3;
- (BOOL)_isSticker:(id)a3;
- (BOOL)reconcileRestoreOfType:(int)a3 withError:(id *)a4;
- (BOOL)shouldBackgroundRestoreFile:(id)a3 backupManager:(id)a4;
- (BOOL)shouldRestoreFile:(id)a3 backupManager:(id)a4;
- (id)outstandingAssetTransfers;
- (id)supportedDataclasses;
- (void)_prioritizeRecentAttachments;
- (void)assetTransfer:(id)a3 succeeded:(BOOL)a4 withError:(id)a5;
- (void)logMOCDefaultsWithContext:(id)a3;
- (void)prioritizeAsset:(id)a3;
- (void)restoreEndedWithError:(id)a3;
@end

@implementation CKATClient

+ (void)restoreProtectedCloudStorageMobileBackup
{
  if (qword_8AA0 != -1) {
    dispatch_once(&qword_8AA0, &stru_41C0);
  }
  if (off_8A98)
  {
    v2 = _ATLogCategorySyncBundle();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "Initiating ProtectedCloudStorage mobile backup restore.", v3, 2u);
    }

    off_8A98();
  }
}

- (void)prioritizeAsset:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)MBManager);
  [v4 prioritizeRestoreFileWithPath:v3];
}

- (void)assetTransfer:(id)a3 succeeded:(BOOL)a4 withError:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  v9 = _ATLogCategorySyncBundle();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (!a4)
  {
    if (v10)
    {
      int v16 = 138412546;
      id v17 = v7;
      __int16 v18 = 2114;
      id v19 = v8;
      v13 = "failed to restore %@: %{public}@";
      v14 = v9;
      uint32_t v15 = 22;
      goto LABEL_9;
    }
LABEL_10:

    goto LABEL_11;
  }
  if (v10)
  {
    int v16 = 138412290;
    id v17 = v7;
    _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "successfully restored %@", (uint8_t *)&v16, 0xCu);
  }

  uint32_t v11 = notify_post("com.apple.ChatKit.attachmentRestoredNotification");
  if (v11)
  {
    uint32_t v12 = v11;
    v9 = _ATLogCategorySyncBundle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 67109120;
      LODWORD(v17) = v12;
      v13 = "notify_post failed: %u";
      v14 = v9;
      uint32_t v15 = 8;
LABEL_9:
      _os_log_impl(&dword_0, v14, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v16, v15);
      goto LABEL_10;
    }
    goto LABEL_10;
  }
LABEL_11:
}

- (id)outstandingAssetTransfers
{
  id v25 = 0;
  id v19 = objc_alloc_init((Class)MBManager);
  v2 = [v19 restoreFilesForDomain:@"MediaDomain" relativePath:@"Library/SMS" pendingOnly:1 error:&v25];
  id v3 = v25;
  if (!v2)
  {
    id v4 = _ATLogCategorySyncBundle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v28 = v3;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "failed to get files for restore: %{public}@", buf, 0xCu);
    }
  }
  id v17 = v3;
  id v5 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v2, "count"));
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v6 = v2;
  id v7 = [v6 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v22;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v6);
        }
        uint32_t v11 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        uint32_t v12 = objc_msgSend(v11, "path", v17);
        v13 = +[ATAsset downloadAssetWithIdentifier:v12 dataclass:@"MessagePart" prettyName:v12];
        [v13 setPath:v12];
        [v13 setIsRestore:1];
        objc_msgSend(v13, "setPriority:", objc_msgSend(v11, "priority"));
        [v5 addObject:v13];
      }
      id v8 = [v6 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v8);
  }

  dispatch_time_t v14 = dispatch_time(0, 10000000000);
  uint32_t v15 = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1F04;
  block[3] = &unk_41E8;
  block[4] = self;
  dispatch_after(v14, v15, block);

  return v5;
}

- (void)_prioritizeRecentAttachments
{
  id v3 = _ATLogCategorySyncBundle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Reprioritizing recent attachments to restore first.", buf, 2u);
  }

  id v4 = (void *)IMDAttachmentRecordCopyRecentFilenames();
  id v5 = _ATLogCategorySyncBundle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v17 = v4;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Recent small attachments %@", buf, 0xCu);
  }

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      BOOL v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        -[CKATClient prioritizeAsset:](self, "prioritizeAsset:", *(void *)(*((void *)&v11 + 1) + 8 * (void)v10), (void)v11);
        BOOL v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (id)supportedDataclasses
{
  return +[NSArray arrayWithObject:@"MessagePart"];
}

- (void)logMOCDefaultsWithContext:(id)a3
{
  id v3 = a3;
  id v4 = IMGetDomainValueForKey();
  int v5 = IMGetDomainBoolForKey();
  int v6 = IMGetDomainBoolForKey();
  id v7 = _ATLogCategorySyncBundle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v8 = @"NO";
    int v10 = 138413058;
    id v11 = v3;
    if (v5) {
      CFStringRef v9 = @"YES";
    }
    else {
      CFStringRef v9 = @"NO";
    }
    __int16 v12 = 2112;
    long long v13 = v4;
    if (v6) {
      CFStringRef v8 = @"YES";
    }
    __int16 v14 = 2112;
    CFStringRef v15 = v9;
    __int16 v16 = 2112;
    CFStringRef v17 = v8;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "%@: \nsyncDate:%@  \nnewDeviceBringUpHasPerformed:%@ \nnewDeviceBringUpHasFinished:%@", (uint8_t *)&v10, 0x2Au);
  }
}

- (BOOL)reconcileRestoreOfType:(int)a3 withError:(id *)a4
{
  int v5 = IMGetDomainValueForKey();
  int v6 = IMGetDomainBoolForKey();
  int v7 = IMGetDomainBoolForKey();
  CFStringRef v8 = _ATLogCategorySyncBundle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v9 = @"NO";
    if (v6) {
      CFStringRef v10 = @"YES";
    }
    else {
      CFStringRef v10 = @"NO";
    }
    int v13 = 138412802;
    __int16 v14 = v5;
    __int16 v15 = 2112;
    CFStringRef v16 = v10;
    if (v7) {
      CFStringRef v9 = @"YES";
    }
    __int16 v17 = 2112;
    CFStringRef v18 = v9;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "Checking MOC defaults after reconcile restore: \nsyncDate:%@  \nnewDeviceBringUpHasPerformed:%@ \nnewDeviceBringUpHasFinished:%@", (uint8_t *)&v13, 0x20u);
  }

  [(CKATClient *)self logMOCDefaultsWithContext:@"Checking MOC defaults after reconcile restore"];
  IMSetDomainValueForKey();
  IMSetDomainBoolForKey();
  IMSetDomainBoolForKey();
  [(CKATClient *)self logMOCDefaultsWithContext:@"MOC Defaults have been reset"];
  id v11 = IMGetDomainValueForKey();
  LOBYTE(self) = 0;
  if (!v11)
  {
    if (IMGetDomainBoolForKey()) {
      LOBYTE(self) = 0;
    }
    else {
      LODWORD(self) = IMGetDomainBoolForKey() ^ 1;
    }
  }

  return (char)self;
}

- (void)restoreEndedWithError:(id)a3
{
  [(CKATClient *)self logMOCDefaultsWithContext:@"Checking MOC defaults after restore ended"];
  if (!a3)
  {
    int v5 = +[NSString stringGUID];
    int v6 = +[IMDaemonController sharedInstance];
    [v6 addListenerID:v5 capabilities:kFZListenerCapChats];

    int v7 = +[IMDaemonController sharedInstance];
    [v7 blockUntilConnected];

    CFStringRef v8 = +[IMDaemonController sharedInstance];
    [v8 cleanupAttachments];

    CFStringRef v9 = +[IMDaemonController sharedInstance];
    [v9 removeListenerID:v5];

    CFStringRef v10 = +[IMDaemonController sharedInstance];
    [v10 disconnectFromDaemon];

    id v11 = dispatch_get_global_queue(0, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_256C;
    block[3] = &unk_41E8;
    block[4] = self;
    dispatch_async(v11, block);
  }
}

- (BOOL)_isSMSTempDB:(id)a3
{
  return [a3 rangeOfString:@"sms-temp"] != (id)0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)_isABCache:(id)a3
{
  return [a3 rangeOfString:@"com.apple.messages.abcache."] != (id)0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)_isMessagesPath:(id)a3
{
  [a3 rangeOfString:@"Library/SMS"];
  return v3 != 0;
}

- (BOOL)_isLegacyAttachment:(id)a3
{
  [a3 rangeOfString:@"Library/SMS/Parts"];
  return v3 != 0;
}

- (BOOL)_isAttachment:(id)a3
{
  [a3 rangeOfString:@"Library/SMS/Attachments"];
  return v3 != 0;
}

- (BOOL)_isSticker:(id)a3
{
  [a3 rangeOfString:@"Library/SMS/StickerCache"];
  return v3 != 0;
}

- (BOOL)shouldRestoreFile:(id)a3 backupManager:(id)a4
{
  id v5 = a3;
  int v6 = [v5 path];
  unsigned int v7 = [(CKATClient *)self _isMessagesPath:v6];

  if (!v7) {
    goto LABEL_5;
  }
  CFStringRef v8 = [v5 path];
  unsigned __int8 v9 = [(CKATClient *)self _isSMSTempDB:v8];

  if ((v9 & 1) != 0
    || ([v5 path],
        CFStringRef v10 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v11 = [(CKATClient *)self _isABCache:v10],
        v10,
        (v11 & 1) != 0))
  {
    BOOL v12 = 0;
  }
  else
  {
LABEL_5:
    BOOL v12 = 1;
  }

  return v12;
}

- (BOOL)shouldBackgroundRestoreFile:(id)a3 backupManager:(id)a4
{
  id v5 = a3;
  int v6 = [v5 path];
  unsigned __int8 v7 = [v5 isDirectory];

  if ((v7 & 1) != 0 || ![(CKATClient *)self _isMessagesPath:v6])
  {
    BOOL v9 = 0;
  }
  else
  {
    if ([(CKATClient *)self _isLegacyAttachment:v6])
    {
      CFStringRef v8 = _ATLogCategorySyncBundle();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 138412290;
        BOOL v12 = v6;
        _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "Legacy attachment, yup: %@", (uint8_t *)&v11, 0xCu);
      }
    }
    else if (![(CKATClient *)self _isAttachment:v6])
    {
      BOOL v9 = [(CKATClient *)self _isSticker:v6];
      goto LABEL_11;
    }
    BOOL v9 = 1;
  }
LABEL_11:

  return v9;
}

@end