@interface QUModelFactory
+ (BOOL)useSpotlightResources;
+ (NSBundle)U2HeadBundle;
+ (id)log;
+ (id)sharedInstance;
+ (void)setU2HeadBundle:(id)a3;
+ (void)setUseSpotlightResources:(BOOL)a3;
- (NSError)loadError;
- (QUModelFactory)init;
- (id)getModelForLocale:(id)a3 withTimeoutMS:(unsigned int)a4;
- (id)quModel;
- (void)releaseModel;
- (void)setLoadError:(id)a3;
@end

@implementation QUModelFactory

void __50__QUModelFactory_getModelForLocale_withTimeoutMS___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = *(void **)(*(void *)(a1 + 32) + 8);
  id v8 = a2;
  [v7 lock];
  uint64_t v9 = *(void *)(a1 + 32);
  id v10 = *(id *)(v9 + 24);

  if (v10 != v8)
  {
    v11 = [(id)objc_opt_class() log];
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
LABEL_5:

      goto LABEL_14;
    }
    LODWORD(v23) = 138412290;
    *(void *)((char *)&v23 + 4) = v6;
    v12 = "[QPNLU] QU model changed before load complete error: %@";
    v13 = v11;
    os_log_type_t v14 = OS_LOG_TYPE_INFO;
    uint32_t v15 = 12;
LABEL_4:
    _os_log_impl(&dword_25AC98000, v13, v14, v12, (uint8_t *)&v23, v15);
    goto LABEL_5;
  }
  if (*(_DWORD *)(v9 + 16) == 2)
  {
    v16 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v23) = 0;
      _os_log_impl(&dword_25AC98000, v16, OS_LOG_TYPE_DEFAULT, "[QPNLU] Waking threads blocked on load", (uint8_t *)&v23, 2u);
    }

    [*(id *)(*(void *)(a1 + 32) + 8) broadcast];
  }
  uint64_t v17 = *(void *)(a1 + 32);
  if (!v6)
  {
    *(_DWORD *)(v17 + 16) = 3;
    v11 = [(id)objc_opt_class() log];
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_5;
    }
    LOWORD(v23) = 0;
    v12 = "[QPNLU] QU model loaded";
    v13 = v11;
    os_log_type_t v14 = OS_LOG_TYPE_DEFAULT;
    uint32_t v15 = 2;
    goto LABEL_4;
  }
  objc_storeStrong((id *)(v17 + 56), a3);
  v18 = [(id)objc_opt_class() log];
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    LODWORD(v23) = 138412290;
    *(void *)((char *)&v23 + 4) = v6;
    _os_log_impl(&dword_25AC98000, v18, OS_LOG_TYPE_ERROR, "[QPNLU] QU model load failed error: %@", (uint8_t *)&v23, 0xCu);
  }

  uint64_t v19 = *(void *)(a1 + 32);
  v20 = *(void **)(v19 + 24);
  *(void *)(v19 + 24) = 0;

  uint64_t v21 = *(void *)(a1 + 32);
  v22 = *(void **)(v21 + 40);
  *(void *)(v21 + 40) = 0;

  *(_DWORD *)(*(void *)(a1 + 32) + 16) = 0;
LABEL_14:
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "unlock", v23);
}

- (id)getModelForLocale:(id)a3 withTimeoutMS:(unsigned int)a4
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v6 = a3;
  unsupportedLocaleIdentifiers = self->_unsupportedLocaleIdentifiers;
  id v8 = [v6 localeIdentifier];
  LODWORD(unsupportedLocaleIdentifiers) = [(NSSet *)unsupportedLocaleIdentifiers containsObject:v8];

  [(NSCondition *)self->_condition lock];
  if (unsupportedLocaleIdentifiers)
  {
    uint64_t v9 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.QueryParser.QUModelError" code:-9002 userInfo:0];
    loadError = self->_loadError;
    self->_loadError = v9;

    [(NSCondition *)self->_condition unlock];
    v11 = 0;
  }
  else
  {
    id releaseBlock = self->_releaseBlock;
    if (releaseBlock)
    {
      dispatch_block_cancel(releaseBlock);
      id v13 = self->_releaseBlock;
      self->_id releaseBlock = 0;
    }
    os_log_type_t v14 = [(QUUnderstandingModel *)self->_quModel locale];
    uint32_t v15 = [v14 localeIdentifier];
    v16 = [v6 localeIdentifier];
    char v17 = [v15 isEqualToString:v16];

    if ((v17 & 1) == 0)
    {
      v18 = [(id)objc_opt_class() log];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        uint64_t v19 = [v6 localeIdentifier];
        *(_DWORD *)buf = 138412290;
        double v33 = *(double *)&v19;
        _os_log_impl(&dword_25AC98000, v18, OS_LOG_TYPE_INFO, "[QPNLU] QU creating new model for %@", buf, 0xCu);
      }
      v20 = [[U2OwlModel alloc] initWithLocale:v6];
      quModel = self->_quModel;
      self->_quModel = (QUUnderstandingModel *)v20;

      v22 = (OS_os_transaction *)os_transaction_create();
      transaction = self->_transaction;
      self->_transaction = v22;

      uint64_t v24 = self->_loadError;
      self->_loadError = 0;

      self->_int state = 1;
      v25 = self->_quModel;
      v31[0] = MEMORY[0x263EF8330];
      v31[1] = 3221225472;
      v31[2] = __50__QUModelFactory_getModelForLocale_withTimeoutMS___block_invoke;
      v31[3] = &unk_2654836C8;
      v31[4] = self;
      [(QUUnderstandingModel *)v25 loadWithCompletionHandler:v31];
    }
    int state = self->_state;
    if (a4 && state != 3)
    {
      v27 = [(id)objc_opt_class() log];
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        double v33 = (double)a4 / 1000.0;
        _os_log_impl(&dword_25AC98000, v27, OS_LOG_TYPE_DEFAULT, "[QPNLU] Waiting for model load with timeout (%f)", buf, 0xCu);
      }

      self->_int state = 2;
      v28 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:(double)a4 / 1000.0];
      [(NSCondition *)self->_condition waitUntilDate:v28];
      v29 = [(id)objc_opt_class() log];
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_25AC98000, v29, OS_LOG_TYPE_DEFAULT, "[QPNLU] Done waiting", buf, 2u);
      }

      if (self->_state == 2) {
        self->_int state = 1;
      }

      int state = self->_state;
    }
    if (state == 3) {
      v11 = self->_quModel;
    }
    else {
      v11 = 0;
    }
    [(NSCondition *)self->_condition unlock];
  }

  return v11;
}

+ (id)log
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __21__QUModelFactory_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken != -1) {
    dispatch_once(&log_onceToken, block);
  }
  v2 = (void *)log_log;

  return v2;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global);
  }
  v2 = (void *)sharedInstance_sharedInstance;

  return v2;
}

void __21__QUModelFactory_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.queryunderstanding", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log;
  log_log = (uint64_t)v1;
}

uint64_t __32__QUModelFactory_sharedInstance__block_invoke()
{
  sharedInstance_sharedInstance = objc_alloc_init(QUModelFactory);

  return MEMORY[0x270F9A758]();
}

+ (BOOL)useSpotlightResources
{
  return +[U2HeadWrapper useSpotlightResources];
}

+ (void)setUseSpotlightResources:(BOOL)a3
{
}

+ (NSBundle)U2HeadBundle
{
  return +[U2HeadWrapper U2HeadBundle];
}

+ (void)setU2HeadBundle:(id)a3
{
}

- (QUModelFactory)init
{
  v10.receiver = self;
  v10.super_class = (Class)QUModelFactory;
  v2 = [(QUModelFactory *)&v10 init];
  if (v2)
  {
    id v3 = (NSCondition *)objc_alloc_init(MEMORY[0x263F08740]);
    condition = v2->_condition;
    v2->_condition = v3;

    transaction = v2->_transaction;
    v2->_transaction = 0;

    id releaseBlock = v2->_releaseBlock;
    v2->_id releaseBlock = 0;

    uint64_t v7 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"en_IN", @"en-IN", 0);
    unsupportedLocaleIdentifiers = v2->_unsupportedLocaleIdentifiers;
    v2->_unsupportedLocaleIdentifiers = (NSSet *)v7;
  }
  return v2;
}

- (id)quModel
{
  return self->_quModel;
}

- (void)releaseModel
{
  [(NSCondition *)self->_condition lock];
  loadError = self->_loadError;
  self->_loadError = 0;

  id releaseBlock = self->_releaseBlock;
  if (releaseBlock)
  {
    dispatch_block_cancel(releaseBlock);
    id v5 = self->_releaseBlock;
    self->_id releaseBlock = 0;
  }
  if (self->_quModel)
  {
    id v6 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl(&dword_25AC98000, v6, OS_LOG_TYPE_INFO, "[QPNLU] QU model released.", v9, 2u);
    }

    quModel = self->_quModel;
    self->_quModel = 0;

    transaction = self->_transaction;
    self->_transaction = 0;
  }
  if (self->_state == 2) {
    [(NSCondition *)self->_condition broadcast];
  }
  self->_int state = 0;
  [(NSCondition *)self->_condition unlock];
}

- (NSError)loadError
{
  [(NSCondition *)self->_condition lock];
  id v3 = self->_loadError;
  [(NSCondition *)self->_condition unlock];

  return v3;
}

- (void)setLoadError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadError, 0);
  objc_storeStrong(&self->_releaseBlock, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_unsupportedLocaleIdentifiers, 0);
  objc_storeStrong((id *)&self->_quModel, 0);

  objc_storeStrong((id *)&self->_condition, 0);
}

@end