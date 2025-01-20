@interface MFMailDropAttachmentDataProvider
+ (OS_os_log)log;
- (MFMailDropAttachmentDataProvider)initWithLibrary:(id)a3;
- (id)_defaultDownloadSessionForAttachment:(id)a3;
- (void)URLSession:(id)a3 downloadTask:(id)a4 didFinishDownloadingToURL:(id)a5;
- (void)URLSession:(id)a3 downloadTask:(id)a4 didWriteData:(int64_t)a5 totalBytesWritten:(int64_t)a6 totalBytesExpectedToWrite:(int64_t)a7;
- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5;
- (void)fetchDataForAttachment:(id)a3 consumer:(id)a4 progress:(id)a5 completion:(id)a6;
@end

@implementation MFMailDropAttachmentDataProvider

+ (OS_os_log)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__MFMailDropAttachmentDataProvider_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_14 != -1) {
    dispatch_once(&log_onceToken_14, block);
  }
  v2 = (void *)log_log_14;
  return (OS_os_log *)v2;
}

void __39__MFMailDropAttachmentDataProvider_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_14;
  log_log_14 = (uint64_t)v1;
}

- (MFMailDropAttachmentDataProvider)initWithLibrary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MFMailDropAttachmentDataProvider;
  v5 = [(MFAttachmentLibraryDataProvider *)&v9 initWithLibrary:v4];
  if (v5)
  {
    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    requests = v5->_requests;
    v5->_requests = v6;
  }
  return v5;
}

- (void)fetchDataForAttachment:(id)a3 consumer:(id)a4 progress:(id)a5 completion:(id)a6
{
  v52[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v39 = a5;
  v40 = (void (**)(id, uint64_t, id, void))a6;
  id v12 = objc_alloc(MEMORY[0x1E4F73560]);
  v52[0] = v11;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v52 count:1];
  v41 = objc_msgSend(v12, "initWithConsumers:expectedSize:", v13, objc_msgSend(v10, "encodedFileSize"));

  v47[0] = MEMORY[0x1E4F143A8];
  v47[1] = 3221225472;
  v47[2] = __88__MFMailDropAttachmentDataProvider_fetchDataForAttachment_consumer_progress_completion___block_invoke;
  v47[3] = &unk_1E5D3DD30;
  id v14 = v39;
  id v48 = v14;
  [v41 setProgressBlock:v47];
  if ([v10 isDataAvailableLocally])
  {
    v15 = (void *)MEMORY[0x1E4F1C9B8];
    v16 = [v10 path];
    id v46 = 0;
    v17 = [v15 dataWithContentsOfFile:v16 options:1 error:&v46];
    id v18 = v46;

    uint64_t v19 = v17 != 0;
    if (v17)
    {
      [v41 appendData:v17];
      uint64_t v20 = 0;
      uint64_t v19 = 1;
    }
    else
    {
      uint64_t v20 = 0;
    }
  }
  else
  {
    v21 = [v10 mailDropMetadata];
    v17 = [v21 directUrl];

    if (v17)
    {
      v37 = [(MFMailDropAttachmentDataProvider *)self _defaultDownloadSessionForAttachment:v10];
      v22 = +[MFMailDropAttachmentDataProvider log];
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        *(void *)&buf[4] = v10;
        __int16 v50 = 2112;
        v51 = v37;
        _os_log_impl(&dword_1A7EFF000, v22, OS_LOG_TYPE_DEFAULT, "Downloading Mail Drop attachment: %@ using URL session: %@", buf, 0x16u);
      }

      v35 = [MEMORY[0x1E4F60E18] promise];
      objc_msgSend(v10, "setMetadataValue:forKey:");
      [v10 setMetadataValue:v41 forKey:@"primaryConsumer"];
      v23 = [v10 mailDropMetadata];
      v38 = [v23 UUID];

      v24 = [[_MFAttachmentActiveRequest alloc] initWithAttachment:v10];
      v25 = self->_requests;
      objc_sync_enter(v25);
      v36 = v24;
      [(NSMutableDictionary *)self->_requests setObject:v24 forKeyedSubscript:v38];
      objc_sync_exit(v25);

      v26 = [(_MFAttachmentActiveRequest *)v24 downloadProgress];
      objc_msgSend(v14, "addChild:withPendingUnitCount:", v26, objc_msgSend(v14, "totalUnitCount"));

      v34 = [v37 downloadTaskWithURL:v17];
      [v34 setTaskDescription:v38];
      *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
      objc_initWeak((id *)buf, v10);
      v27 = +[MFActivityMonitor currentMonitor];
      v28 = (void *)MEMORY[0x1E4F60D40];
      v43[0] = MEMORY[0x1E4F143A8];
      v43[1] = 3221225472;
      v43[2] = __88__MFMailDropAttachmentDataProvider_fetchDataForAttachment_consumer_progress_completion___block_invoke_21;
      v43[3] = &unk_1E5D3E1D0;
      objc_copyWeak(&v45, (id *)buf);
      id v29 = v34;
      id v44 = v29;
      v30 = [v28 tokenWithCancelationBlock:v43];
      [v27 addCancelable:v30];

      [v29 resume];
      v31 = [v35 future];
      id v42 = 0;
      v32 = [v31 result:&v42];
      id v18 = v42;
      uint64_t v19 = [v32 BOOLValue];

      [v10 setMetadataValue:0 forKey:@"downloadPromise"];
      [v10 setMetadataValue:0 forKey:@"primaryConsumer"];
      v33 = self->_requests;
      objc_sync_enter(v33);
      [(NSMutableDictionary *)self->_requests setObject:0 forKeyedSubscript:v38];
      objc_sync_exit(v33);

      objc_destroyWeak(&v45);
      objc_destroyWeak((id *)buf);

      uint64_t v20 = v19;
    }
    else
    {
      uint64_t v19 = 0;
      uint64_t v20 = 0;
      id v18 = 0;
    }
  }

  [v41 done];
  [v11 done];
  v40[2](v40, v19, v18, v20);
}

uint64_t __88__MFMailDropAttachmentDataProvider_fetchDataForAttachment_consumer_progress_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  [*(id *)(a1 + 32) setTotalUnitCount:a4];
  v6 = *(void **)(a1 + 32);
  return [v6 setCompletedUnitCount:a2];
}

void __88__MFMailDropAttachmentDataProvider_fetchDataForAttachment_consumer_progress_completion___block_invoke_21(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = +[MFMailDropAttachmentDataProvider log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    id v5 = WeakRetained;
    _os_log_impl(&dword_1A7EFF000, v3, OS_LOG_TYPE_DEFAULT, "Canceling download for Mail Drop attachment %@", (uint8_t *)&v4, 0xCu);
  }

  [*(id *)(a1 + 32) cancel];
}

- (id)_defaultDownloadSessionForAttachment:(id)a3
{
  int v4 = [a3 mailDropMetadata];
  unint64_t v5 = [v4 fileSize];

  if (v5 >> 22 > 0x18)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __73__MFMailDropAttachmentDataProvider__defaultDownloadSessionForAttachment___block_invoke_2;
    v9[3] = &unk_1E5D3B5C0;
    v9[4] = self;
    if (_defaultDownloadSessionForAttachment__wifiOnlySessionOnceToken != -1) {
      dispatch_once(&_defaultDownloadSessionForAttachment__wifiOnlySessionOnceToken, v9);
    }
    uint64_t v6 = &_defaultDownloadSessionForAttachment__wifiOnlySession;
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __73__MFMailDropAttachmentDataProvider__defaultDownloadSessionForAttachment___block_invoke;
    block[3] = &unk_1E5D3B5C0;
    block[4] = self;
    if (_defaultDownloadSessionForAttachment__defaultSessionOnceToken != -1) {
      dispatch_once(&_defaultDownloadSessionForAttachment__defaultSessionOnceToken, block);
    }
    uint64_t v6 = &_defaultDownloadSessionForAttachment__defaultSession;
  }
  id v7 = (id)*v6;
  return v7;
}

void __73__MFMailDropAttachmentDataProvider__defaultDownloadSessionForAttachment___block_invoke()
{
  v0 = (void *)MEMORY[0x1E4F18DC0];
  downloadConfiguration(@"com.apple.mobilemail.MailDropDownload", 1);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = objc_msgSend(v0, "sessionWithConfiguration:delegate:delegateQueue:");
  v2 = (void *)_defaultDownloadSessionForAttachment__defaultSession;
  _defaultDownloadSessionForAttachment__defaultSession = v1;
}

void __73__MFMailDropAttachmentDataProvider__defaultDownloadSessionForAttachment___block_invoke_2()
{
  v0 = (void *)MEMORY[0x1E4F18DC0];
  downloadConfiguration(@"com.apple.mobilemail.MailDropDownloadWIFIOnly", 0);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = objc_msgSend(v0, "sessionWithConfiguration:delegate:delegateQueue:");
  v2 = (void *)_defaultDownloadSessionForAttachment__wifiOnlySession;
  _defaultDownloadSessionForAttachment__wifiOnlySession = v1;
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v15 = a4;
  id v7 = a5;
  v8 = self->_requests;
  objc_sync_enter(v8);
  requests = self->_requests;
  id v10 = [v15 taskDescription];
  id v11 = [(NSMutableDictionary *)requests objectForKeyedSubscript:v10];

  objc_sync_exit(v8);
  id v12 = [v11 attachment];
  v13 = [v12 metadataValueForKey:@"downloadPromise"];

  if (v7)
  {
    [v13 finishWithError:v7];
  }
  else
  {
    id v14 = +[MFError errorWithDomain:@"MFMessageErrorDomain" code:1030 userInfo:0];
    [v13 finishWithError:v14];
  }
}

- (void)URLSession:(id)a3 downloadTask:(id)a4 didFinishDownloadingToURL:(id)a5
{
  id v19 = a4;
  id v7 = a5;
  v8 = self->_requests;
  objc_sync_enter(v8);
  requests = self->_requests;
  id v10 = [v19 taskDescription];
  id v11 = [(NSMutableDictionary *)requests objectForKeyedSubscript:v10];

  objc_sync_exit(v8);
  id v12 = [v11 attachment];
  v13 = [v12 metadataValueForKey:@"primaryConsumer"];
  id v14 = (void *)MEMORY[0x1E4F1C9B8];
  id v15 = [v7 resourceSpecifier];
  v16 = [v14 dataWithContentsOfFile:v15 options:1 error:0];

  if (v16) {
    [v13 appendData:v16];
  }
  v17 = [v12 metadataValueForKey:@"downloadPromise"];
  id v18 = [MEMORY[0x1E4F28ED0] numberWithBool:v16 != 0];
  [v17 finishWithResult:v18];
}

- (void)URLSession:(id)a3 downloadTask:(id)a4 didWriteData:(int64_t)a5 totalBytesWritten:(int64_t)a6 totalBytesExpectedToWrite:(int64_t)a7
{
  id v14 = a4;
  objc_super v9 = self->_requests;
  objc_sync_enter(v9);
  requests = self->_requests;
  id v11 = [v14 taskDescription];
  id v12 = [(NSMutableDictionary *)requests objectForKeyedSubscript:v11];

  objc_sync_exit(v9);
  v13 = [v12 downloadProgress];
  [v13 setCompletedUnitCount:a6];
}

- (void).cxx_destruct
{
}

@end