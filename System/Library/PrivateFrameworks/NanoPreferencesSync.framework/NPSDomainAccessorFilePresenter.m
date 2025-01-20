@interface NPSDomainAccessorFilePresenter
- (BOOL)isCurrent;
- (BOOL)presentedItemNeedsWatching;
- (NPSDomainAccessorFilePresenter)initWithDelegate:(id)a3 domainURL:(id)a4;
- (NPSDomainAccessorFilePresenterDelegate)delegate;
- (NSOperationQueue)presentedItemOperationQueue;
- (NSOperationQueue)presenterOperationQueue;
- (NSURL)domainURL;
- (NSURL)presentedItemURL;
- (OS_dispatch_queue)presenterUnderlyingQueue;
- (id)synchronizeForReadingOnly:(BOOL)a3 handler:(id)a4;
- (void)dealloc;
- (void)relinquishPresentedItemToWriter:(id)a3;
- (void)setCurrent:(BOOL)a3;
- (void)setDomainURL:(id)a3;
- (void)setPresenterOperationQueue:(id)a3;
- (void)setPresenterUnderlyingQueue:(id)a3;
@end

@implementation NPSDomainAccessorFilePresenter

- (NPSDomainAccessorFilePresenter)initWithDelegate:(id)a3 domainURL:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    v17 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v18 = *MEMORY[0x1E4F1C3C8];
    v19 = [NSString stringWithFormat:@"delegate: (%@)", 0];
    id v20 = [v17 exceptionWithName:v18 reason:v19 userInfo:0];

    objc_exception_throw(v20);
  }
  v8 = v7;
  v21.receiver = self;
  v21.super_class = (Class)NPSDomainAccessorFilePresenter;
  v9 = [(NPSDomainAccessorFilePresenter *)&v21 init];
  if (v9)
  {
    v10 = nps_domain_accessor_log;
    if (os_log_type_enabled((os_log_t)nps_domain_accessor_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218498;
      v23 = v9;
      __int16 v24 = 2048;
      id v25 = v6;
      __int16 v26 = 2112;
      v27 = v8;
      _os_log_impl(&dword_1BA426000, v10, OS_LOG_TYPE_DEFAULT, "self: (%p); delegate: (%p); domainURL: (%@)",
        buf,
        0x20u);
    }
    objc_storeWeak((id *)&v9->_delegate, v6);
    objc_storeStrong((id *)&v9->_domainURL, a4);
    v9->_current = 0;
    v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v12 = dispatch_queue_create("com.apple.nanoprefsync.frmrk.filePresenter", v11);
    presenterUnderlyingQueue = v9->_presenterUnderlyingQueue;
    v9->_presenterUnderlyingQueue = (OS_dispatch_queue *)v12;

    v14 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    presenterOperationQueue = v9->_presenterOperationQueue;
    v9->_presenterOperationQueue = v14;

    [(NSOperationQueue *)v9->_presenterOperationQueue setMaxConcurrentOperationCount:1];
    [(NSOperationQueue *)v9->_presenterOperationQueue setUnderlyingQueue:v9->_presenterUnderlyingQueue];
  }
  return v9;
}

- (void)dealloc
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v3 = nps_domain_accessor_log;
  if (os_log_type_enabled((os_log_t)nps_domain_accessor_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    id v6 = self;
    _os_log_impl(&dword_1BA426000, v3, OS_LOG_TYPE_DEFAULT, "self: (%p)", buf, 0xCu);
  }
  v4.receiver = self;
  v4.super_class = (Class)NPSDomainAccessorFilePresenter;
  [(NPSDomainAccessorFilePresenter *)&v4 dealloc];
}

- (id)synchronizeForReadingOnly:(BOOL)a3 handler:(id)a4
{
  BOOL v4 = a3;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (!v6) {
    -[NPSDomainAccessorFilePresenter synchronizeForReadingOnly:handler:]();
  }
  uint64_t v7 = v6;
  v8 = (void *)[objc_alloc(MEMORY[0x1E4F28CA0]) initWithFilePresenter:self];
  domainURL = self->_domainURL;
  if (v4)
  {
    uint64_t v22 = 0;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __68__NPSDomainAccessorFilePresenter_synchronizeForReadingOnly_handler___block_invoke;
    v20[3] = &unk_1E6217D70;
    v20[4] = self;
    v10 = &v21;
    id v21 = v7;
    v11 = (id *)&v22;
    [v8 coordinateReadingItemAtURL:domainURL options:1 error:&v22 byAccessor:v20];
  }
  else
  {
    uint64_t v19 = 0;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __68__NPSDomainAccessorFilePresenter_synchronizeForReadingOnly_handler___block_invoke_2;
    v17[3] = &unk_1E6217D70;
    v17[4] = self;
    v10 = &v18;
    id v18 = v7;
    v11 = (id *)&v19;
    [v8 coordinateWritingItemAtURL:domainURL options:0 error:&v19 byAccessor:v17];
  }
  id v12 = *v11;

  if (v12)
  {
    v13 = nps_domain_accessor_log;
    if (os_log_type_enabled((os_log_t)nps_domain_accessor_log, OS_LOG_TYPE_DEFAULT))
    {
      v14 = self->_domainURL;
      *(_DWORD *)buf = 138412546;
      __int16 v24 = v14;
      __int16 v25 = 2112;
      id v26 = v12;
      _os_log_impl(&dword_1BA426000, v13, OS_LOG_TYPE_DEFAULT, "Failed to file-coordinate URL (%@) with error: (%@)", buf, 0x16u);
    }
    id v15 = v12;
  }

  return v12;
}

uint64_t __68__NPSDomainAccessorFilePresenter_synchronizeForReadingOnly_handler___block_invoke(uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  *(unsigned char *)(*(void *)(a1 + 32) + 8) = result;
  return result;
}

uint64_t __68__NPSDomainAccessorFilePresenter_synchronizeForReadingOnly_handler___block_invoke_2(uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  *(unsigned char *)(*(void *)(a1 + 32) + 8) = result;
  return result;
}

- (BOOL)isCurrent
{
  v11[1] = *MEMORY[0x1E4F143B8];
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  presenterOperationQueue = self->_presenterOperationQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __43__NPSDomainAccessorFilePresenter_isCurrent__block_invoke;
  v6[3] = &unk_1E6217C78;
  v6[4] = self;
  v6[5] = &v7;
  v3 = [MEMORY[0x1E4F28B48] blockOperationWithBlock:v6];
  v11[0] = v3;
  BOOL v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  [(NSOperationQueue *)presenterOperationQueue addOperations:v4 waitUntilFinished:1];

  LOBYTE(presenterOperationQueue) = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return (char)presenterOperationQueue;
}

uint64_t __43__NPSDomainAccessorFilePresenter_isCurrent__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 8);
  return result;
}

- (NSURL)presentedItemURL
{
  return self->_domainURL;
}

- (NSOperationQueue)presentedItemOperationQueue
{
  return self->_presenterOperationQueue;
}

- (void)relinquishPresentedItemToWriter:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  BOOL v4 = (void (**)(id, void))a3;
  v5 = nps_domain_accessor_log;
  if (os_log_type_enabled((os_log_t)nps_domain_accessor_log, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 134217984;
    v8 = self;
    _os_log_impl(&dword_1BA426000, v5, OS_LOG_TYPE_DEFAULT, "self: (%p)", (uint8_t *)&v7, 0xCu);
  }
  self->_current = 0;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained filePresenterDidBecomeNonCurrent:self];

  if (v4) {
    v4[2](v4, 0);
  }
}

- (BOOL)presentedItemNeedsWatching
{
  return 0;
}

- (NSURL)domainURL
{
  return self->_domainURL;
}

- (void)setDomainURL:(id)a3
{
}

- (NPSDomainAccessorFilePresenterDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (NPSDomainAccessorFilePresenterDelegate *)WeakRetained;
}

- (void)setCurrent:(BOOL)a3
{
  self->_current = a3;
}

- (NSOperationQueue)presenterOperationQueue
{
  return self->_presenterOperationQueue;
}

- (void)setPresenterOperationQueue:(id)a3
{
}

- (OS_dispatch_queue)presenterUnderlyingQueue
{
  return self->_presenterUnderlyingQueue;
}

- (void)setPresenterUnderlyingQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presenterUnderlyingQueue, 0);
  objc_storeStrong((id *)&self->_presenterOperationQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_domainURL, 0);
}

- (void)synchronizeForReadingOnly:handler:.cold.1()
{
}

@end