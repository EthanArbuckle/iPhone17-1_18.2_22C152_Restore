@interface WebBookmarkDeviceIdentifier
+ (void)_postWebBookmarkMetaDataChangeDistributedNotification:(id)a3;
+ (void)clearDeviceIdentifierWithPlistURL:(id)a3;
- (BOOL)_listensForMetaDataChangeNotification;
- (BOOL)encounteredErrorWhileObtainingUUID;
- (BOOL)isReadOnly;
- (NSUUID)UUID;
- (WebBookmarkDeviceIdentifier)initWithPlistURL:(id)a3 readOnly:(BOOL)a4;
- (id)description;
- (void)_cancelMonitoringMetaDataFile;
- (void)_createOrLoadMetaData;
- (void)_metaDataDidChange:(id)a3;
- (void)_resumeMonitoringMetaDataFile;
- (void)_setListensForMetaDataChangeNotification:(BOOL)a3;
- (void)_setUpWithPlistURL:(id)a3 readOnly:(BOOL)a4 queue:(id)a5;
- (void)dealloc;
- (void)setReadOnly:(BOOL)a3;
- (void)stopObservingChanges;
@end

@implementation WebBookmarkDeviceIdentifier

void __35__WebBookmarkDeviceIdentifier_UUID__block_invoke(uint64_t a1)
{
}

- (NSUUID)UUID
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy_;
  v10 = __Block_byref_object_dispose_;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __35__WebBookmarkDeviceIdentifier_UUID__block_invoke;
  v5[3] = &unk_2643D9BB8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSUUID *)v3;
}

- (WebBookmarkDeviceIdentifier)initWithPlistURL:(id)a3 readOnly:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WebBookmarkDeviceIdentifier;
  v7 = [(WebBookmarkDeviceIdentifier *)&v12 init];
  if (v7)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"com.apple.WebBookmarkDeviceIdentifier.%p", v7);
    id v8 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_t v9 = dispatch_queue_create((const char *)[v8 UTF8String], 0);

    [(WebBookmarkDeviceIdentifier *)v7 _setUpWithPlistURL:v6 readOnly:v4 queue:v9];
    v10 = v7;
  }
  return v7;
}

- (void)_setUpWithPlistURL:(id)a3 readOnly:(BOOL)a4 queue:(id)a5
{
  id v8 = (NSURL *)a3;
  objc_storeStrong((id *)&self->_queue, a5);
  id v9 = a5;
  plistURL = self->_plistURL;
  self->_plistURL = v8;
  id v11 = v8;

  self->_readOnly = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __65__WebBookmarkDeviceIdentifier__setUpWithPlistURL_readOnly_queue___block_invoke;
  block[3] = &unk_2643D9B48;
  block[4] = self;
  dispatch_sync(queue, block);
}

uint64_t __65__WebBookmarkDeviceIdentifier__setUpWithPlistURL_readOnly_queue___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _createOrLoadMetaData];
}

- (void)_createOrLoadMetaData
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21C043000, a2, OS_LOG_TYPE_ERROR, "Error reading bookmarks metadata file with code: %zd", (uint8_t *)&v2, 0xCu);
}

uint64_t __52__WebBookmarkDeviceIdentifier__createOrLoadMetaData__block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    uint64_t v3 = WBS_LOG_CHANNEL_PREFIXBookmarks();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_21C043000, v3, OS_LOG_TYPE_DEFAULT, "Posted bookmarks metadata file changed notification", v6, 2u);
    }
    uint64_t v4 = [MEMORY[0x263F08A00] defaultCenter];
    [v4 postNotificationName:@"webBookmarksMetaDataDidChangeNotification" object:*(void *)(a1 + 32)];
  }
  return [*(id *)(a1 + 32) _resumeMonitoringMetaDataFile];
}

- (void)_resumeMonitoringMetaDataFile
{
  p_fileMonitor = &self->_fileMonitor;
  fileMonitor = self->_fileMonitor;
  if (fileMonitor)
  {
    dispatch_resume(fileMonitor);
  }
  else
  {
    unsigned int v5 = open([(NSURL *)self->_plistURL fileSystemRepresentation], 4);
    if ((v5 & 0x80000000) != 0)
    {
      [(WebBookmarkDeviceIdentifier *)self _setListensForMetaDataChangeNotification:1];
    }
    else
    {
      int v6 = v5;
      dispatch_source_t v7 = dispatch_source_create(MEMORY[0x263EF8410], v5, 3uLL, (dispatch_queue_t)self->_queue);
      if (v7)
      {
        objc_storeStrong((id *)p_fileMonitor, v7);
        handler[0] = MEMORY[0x263EF8330];
        handler[1] = 3221225472;
        handler[2] = __60__WebBookmarkDeviceIdentifier__resumeMonitoringMetaDataFile__block_invoke;
        handler[3] = &unk_2643D9B48;
        handler[4] = self;
        dispatch_source_set_event_handler(v7, handler);
        v10[0] = MEMORY[0x263EF8330];
        v10[1] = 3221225472;
        v10[2] = __60__WebBookmarkDeviceIdentifier__resumeMonitoringMetaDataFile__block_invoke_16;
        v10[3] = &__block_descriptor_36_e5_v8__0l;
        int v11 = v6;
        dispatch_source_set_cancel_handler(v7, v10);
        dispatch_resume(v7);
        id v8 = self;
        uint64_t v9 = 0;
      }
      else
      {
        close(v6);
        id v8 = self;
        uint64_t v9 = 1;
      }
      [(WebBookmarkDeviceIdentifier *)v8 _setListensForMetaDataChangeNotification:v9];
    }
  }
}

- (void)_setListensForMetaDataChangeNotification:(BOOL)a3
{
  if (self->_listensForMetaDataChangeNotification != a3)
  {
    BOOL v3 = a3;
    self->_listensForMetaDataChangeNotification = a3;
    unsigned int v5 = [MEMORY[0x263F087C8] defaultCenter];
    id v6 = v5;
    if (v3) {
      [v5 addObserver:self selector:sel__metaDataDidChange_ name:@"com.apple.WebBookmarks.MetaDataDidChangeNotification" object:0];
    }
    else {
      [v5 removeObserver:self name:@"com.apple.WebBookmarks.MetaDataDidChangeNotification" object:0];
    }
  }
}

- (void)_cancelMonitoringMetaDataFile
{
  fileMonitor = self->_fileMonitor;
  if (fileMonitor)
  {
    dispatch_source_cancel(fileMonitor);
    uint64_t v4 = self->_fileMonitor;
    self->_fileMonitor = 0;
  }
}

- (void)dealloc
{
  [(WebBookmarkDeviceIdentifier *)self _setListensForMetaDataChangeNotification:0];
  v3.receiver = self;
  v3.super_class = (Class)WebBookmarkDeviceIdentifier;
  [(WebBookmarkDeviceIdentifier *)&v3 dealloc];
}

uint64_t __60__WebBookmarkDeviceIdentifier__resumeMonitoringMetaDataFile__block_invoke(uint64_t a1)
{
  int v2 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_21C043000, v2, OS_LOG_TYPE_DEFAULT, "Received a vnode event for bookmarks metadata file", v4, 2u);
  }
  return [*(id *)(a1 + 32) _createOrLoadMetaData];
}

uint64_t __60__WebBookmarkDeviceIdentifier__resumeMonitoringMetaDataFile__block_invoke_16(uint64_t a1)
{
  return close(*(_DWORD *)(a1 + 32));
}

- (void)_metaDataDidChange:(id)a3
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __50__WebBookmarkDeviceIdentifier__metaDataDidChange___block_invoke;
  block[3] = &unk_2643D9B48;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __50__WebBookmarkDeviceIdentifier__metaDataDidChange___block_invoke(uint64_t a1)
{
  int v2 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_21C043000, v2, OS_LOG_TYPE_DEFAULT, "Received bookmarks metadata file change distributed notification", v4, 2u);
  }
  return [*(id *)(a1 + 32) _createOrLoadMetaData];
}

- (BOOL)encounteredErrorWhileObtainingUUID
{
  uint64_t v6 = 0;
  dispatch_source_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __65__WebBookmarkDeviceIdentifier_encounteredErrorWhileObtainingUUID__block_invoke;
  v5[3] = &unk_2643D9BB8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __65__WebBookmarkDeviceIdentifier_encounteredErrorWhileObtainingUUID__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 24);
  return result;
}

- (void)stopObservingChanges
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__WebBookmarkDeviceIdentifier_stopObservingChanges__block_invoke;
  block[3] = &unk_2643D9B48;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __51__WebBookmarkDeviceIdentifier_stopObservingChanges__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _cancelMonitoringMetaDataFile];
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@: %p' _UUID = %@", objc_opt_class(), self, self->_UUID];
}

+ (void)clearDeviceIdentifierWithPlistURL:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x263EFF9A0];
  id v5 = a3;
  id v6 = [v4 dictionaryWithContentsOfURL:v5];
  [v6 removeObjectForKey:@"DeviceUUID"];
  [v6 writeToURL:v5 atomically:1];
  [a1 _postWebBookmarkMetaDataChangeDistributedNotification:v5];
}

+ (void)_postWebBookmarkMetaDataChangeDistributedNotification:(id)a3
{
  char v3 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_21C043000, v3, OS_LOG_TYPE_DEFAULT, "Posting bookmarks metadata file change distributed notification", v5, 2u);
  }
  uint64_t v4 = [MEMORY[0x263F087C8] defaultCenter];
  [v4 postNotificationName:@"com.apple.WebBookmarks.MetaDataDidChangeNotification" object:0];
}

- (BOOL)isReadOnly
{
  return self->_readOnly;
}

- (void)setReadOnly:(BOOL)a3
{
  self->_readOnly = a3;
}

- (BOOL)_listensForMetaDataChangeNotification
{
  return self->_listensForMetaDataChangeNotification;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileMonitor, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
  objc_storeStrong((id *)&self->_plistURL, 0);
}

@end