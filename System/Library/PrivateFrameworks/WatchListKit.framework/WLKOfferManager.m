@interface WLKOfferManager
+ (id)_offerFullPath;
+ (id)_offerPath;
+ (id)defaultOfferManager;
- (NSArray)offers;
- (WLKOfferManager)init;
- (id)_connection;
- (id)_offers;
- (id)_updateOfferFile;
- (void)_activeAccountChangedNotification:(id)a3;
- (void)_setOffers:(id)a3;
- (void)clearOffers:(id)a3;
- (void)fetchOffers:(BOOL)a3 completion:(id)a4;
- (void)removeOfferByBadgeId:(id)a3 completionHandler:(id)a4;
- (void)saveOffer:(id)a3 completionHandler:(id)a4;
- (void)sendBadgeActionMetricsEvents:(id)a3;
- (void)setOffers:(id)a3;
@end

@implementation WLKOfferManager

- (void)clearOffers:(id)a3
{
  id v4 = a3;
  v5 = WLKSystemLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_1BA2E8000, v5, OS_LOG_TYPE_DEFAULT, "WLKOfferManager - clearAllOffers: begin", (uint8_t *)&buf, 2u);
  }

  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __31__WLKOfferManager_clearOffers___block_invoke;
  v23[3] = &unk_1E620A438;
  id v6 = v4;
  id v24 = v6;
  v7 = (void *)MEMORY[0x1BA9E94D0](v23);
  if (WLKIsDaemon())
  {
    objc_initWeak(&buf, self);
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __31__WLKOfferManager_clearOffers___block_invoke_66;
    block[3] = &unk_1E6209FD0;
    objc_copyWeak(&v21, &buf);
    id v20 = v7;
    id v9 = v7;
    dispatch_async(queue, block);

    objc_destroyWeak(&v21);
    objc_destroyWeak(&buf);
  }
  else
  {
    v10 = [(WLKOfferManager *)self _connection];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __31__WLKOfferManager_clearOffers___block_invoke_2;
    v17[3] = &unk_1E620A438;
    id v11 = v7;
    id v18 = v11;
    v12 = [v10 remoteObjectProxyWithErrorHandler:v17];

    v13 = WLKSystemLogObject();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1BA2E8000, v13, OS_LOG_TYPE_DEFAULT, "WLKOfferManager - calling out to daemon for clearing all offers", (uint8_t *)&buf, 2u);
    }

    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __31__WLKOfferManager_clearOffers___block_invoke_68;
    v15[3] = &unk_1E620A438;
    id v16 = v11;
    id v14 = v11;
    [v12 clearOffers:v15];
  }
}

- (void)fetchOffers:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  v7 = WLKSystemLogObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_1BA2E8000, v7, OS_LOG_TYPE_DEFAULT, "WLKOfferManager - fetchOffers: begin", (uint8_t *)&buf, 2u);
  }

  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __42__WLKOfferManager_fetchOffers_completion___block_invoke;
  v26[3] = &unk_1E620A4B0;
  id v8 = v6;
  id v27 = v8;
  id v9 = (void *)MEMORY[0x1BA9E94D0](v26);
  if (WLKIsDaemon())
  {
    objc_initWeak(&buf, self);
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __42__WLKOfferManager_fetchOffers_completion___block_invoke_55;
    block[3] = &unk_1E620A4D8;
    objc_copyWeak(&v23, &buf);
    BOOL v24 = v4;
    id v22 = v9;
    id v11 = v9;
    dispatch_async(queue, block);

    objc_destroyWeak(&v23);
    objc_destroyWeak(&buf);
  }
  else
  {
    v12 = [(WLKOfferManager *)self _connection];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __42__WLKOfferManager_fetchOffers_completion___block_invoke_57;
    v19[3] = &unk_1E620A438;
    id v13 = v9;
    id v20 = v13;
    id v14 = [v12 remoteObjectProxyWithErrorHandler:v19];

    v15 = WLKSystemLogObject();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1BA2E8000, v15, OS_LOG_TYPE_DEFAULT, "WLKOfferManager - calling out to daemon for fetching", (uint8_t *)&buf, 2u);
    }

    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __42__WLKOfferManager_fetchOffers_completion___block_invoke_58;
    v17[3] = &unk_1E620A500;
    void v17[4] = self;
    id v18 = v13;
    id v16 = v13;
    [v14 fetchOffers:v4 completion:v17];
  }
}

- (id)_connection
{
  connection = self->_connection;
  if (!connection)
  {
    BOOL v4 = (NSXPCConnection *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.watchlistd.xpc" options:0];
    v5 = self->_connection;
    self->_connection = v4;

    id v6 = self->_connection;
    v7 = WLKConnectionClientInterface();
    [(NSXPCConnection *)v6 setExportedInterface:v7];

    [(NSXPCConnection *)self->_connection setExportedObject:self];
    id v8 = self->_connection;
    id v9 = WLKConnectionServerInterface();
    [(NSXPCConnection *)v8 setRemoteObjectInterface:v9];

    [(NSXPCConnection *)self->_connection setInterruptionHandler:&__block_literal_global_74];
    objc_initWeak(&location, self);
    v10 = self->_connection;
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    id v14 = __30__WLKOfferManager__connection__block_invoke_75;
    v15 = &unk_1E620A550;
    objc_copyWeak(&v16, &location);
    [(NSXPCConnection *)v10 setInvalidationHandler:&v12];
    [(NSXPCConnection *)self->_connection resume];
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
    connection = self->_connection;
  }

  return connection;
}

void __31__WLKOfferManager_clearOffers___block_invoke_66(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _setOffers:0];
  os_unfair_lock_lock((os_unfair_lock_t)&__offersOnDiskLock);
  v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  BOOL v4 = +[WLKOfferManager _offerFullPath];
  id v7 = 0;
  [v3 removeItemAtPath:v4 error:&v7];
  id v5 = v7;

  os_unfair_lock_unlock((os_unfair_lock_t)&__offersOnDiskLock);
  id v6 = objc_msgSend(MEMORY[0x1E4F1CB18], "wlk_userDefaults");
  [v6 removeObjectForKey:@"badgeIdentifiers"];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __31__WLKOfferManager_clearOffers___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  BOOL v4 = WLKSystemLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_1BA2E8000, v4, OS_LOG_TYPE_DEFAULT, "WLKOfferManager - Error: Unable to communicate with the remote object proxy (%@)", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __31__WLKOfferManager_clearOffers___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = WLKSystemLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_1BA2E8000, v4, OS_LOG_TYPE_DEFAULT, "WLKOfferManager - clearAllOffers: end", v6, 2u);
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

- (void)_setOffers:(id)a3
{
  BOOL v4 = (NSArray *)a3;
  os_unfair_lock_lock(&__offersLock);
  offers = self->_offers;
  self->_offers = v4;

  os_unfair_lock_unlock(&__offersLock);
}

+ (id)_offerFullPath
{
  v2 = +[WLKOfferManager _offerPath];
  id v3 = [v2 stringByAppendingPathComponent:@"offers.plist"];

  BOOL v4 = [v3 stringByExpandingTildeInPath];

  return v4;
}

+ (id)_offerPath
{
  v2 = WLKDefaultSupportPath();
  if ([v2 length])
  {
    id v3 = objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStore");
    BOOL v4 = objc_msgSend(v3, "ams_activeiTunesAccount");
    uint64_t v5 = objc_msgSend(v4, "ams_DSID");

    if (v5)
    {
      id v6 = [NSString stringWithFormat:@"%@", v5];
      if (v6)
      {
        uint64_t v7 = [v2 stringByAppendingPathComponent:v6];

        v2 = (void *)v7;
      }
    }
  }
  else
  {
    NSLog(&cfstr_Wlksettingssto.isa);
  }

  return v2;
}

+ (id)defaultOfferManager
{
  if (defaultOfferManager___once != -1) {
    dispatch_once(&defaultOfferManager___once, &__block_literal_global_6);
  }
  v2 = (void *)defaultOfferManager___defaultOfferManager;

  return v2;
}

void __42__WLKOfferManager_fetchOffers_completion___block_invoke_58(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = WLKSystemLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_1BA2E8000, v4, OS_LOG_TYPE_DEFAULT, "WLKOfferManager - daemon callback for fetching", v5, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  if (v3 && [v3 count]) {
    [*(id *)(a1 + 32) sendBadgeActionMetricsEvents:v3];
  }
}

void __42__WLKOfferManager_fetchOffers_completion___block_invoke_55(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = [WeakRetained _offers];
  if (*(unsigned char *)(a1 + 48))
  {
    [WeakRetained _setOffers:0];
    os_unfair_lock_lock((os_unfair_lock_t)&__offersOnDiskLock);
    BOOL v4 = [MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v5 = +[WLKOfferManager _offerFullPath];
    id v8 = 0;
    [v4 removeItemAtPath:v5 error:&v8];
    id v6 = v8;

    os_unfair_lock_unlock((os_unfair_lock_t)&__offersOnDiskLock);
    if (v6)
    {
      uint64_t v7 = WLKSystemLogObject();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)id buf = 138412290;
        id v10 = v6;
        _os_log_impl(&dword_1BA2E8000, v7, OS_LOG_TYPE_DEFAULT, "WLKOfferManager - Error: Failed to clear offers after fetching (%@)", buf, 0xCu);
      }
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __42__WLKOfferManager_fetchOffers_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = WLKSystemLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_1BA2E8000, v4, OS_LOG_TYPE_DEFAULT, "WLKOfferManager - fetchOffers: end", v6, 2u);
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id, void))(v5 + 16))(v5, v3, 0);
  }
}

- (id)_offers
{
  os_unfair_lock_lock(&__offersLock);
  id v3 = (void *)[(NSArray *)self->_offers copy];
  os_unfair_lock_unlock(&__offersLock);

  return v3;
}

uint64_t __38__WLKOfferManager_defaultOfferManager__block_invoke()
{
  defaultOfferManager___defaultOfferManager = objc_alloc_init(WLKOfferManager);

  return MEMORY[0x1F41817F8]();
}

- (WLKOfferManager)init
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v24.receiver = self;
  v24.super_class = (Class)WLKOfferManager;
  v2 = [(WLKOfferManager *)&v24 init];
  if (v2)
  {
    id v3 = WLKSystemLogObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id buf = 0;
      _os_log_impl(&dword_1BA2E8000, v3, OS_LOG_TYPE_DEFAULT, "WLKOfferManager - + (instancetype)defaultOfferManager - init", buf, 2u);
    }

    dispatch_queue_t v4 = dispatch_queue_create("com.apple.WatchListKit.OfferManager", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    if (WLKIsDaemon())
    {
      id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
      uint64_t v7 = +[WLKAccountMonitor sharedInstance];
      [v6 addObserver:v2 selector:sel__activeAccountChangedNotification_ name:@"WLKAccountMonitorAccountDidChange" object:v7];

      id v8 = (void *)MEMORY[0x1E4F1C9B8];
      id v9 = +[WLKOfferManager _offerFullPath];
      id v10 = [v8 dataWithContentsOfFile:v9];

      if (v10)
      {
        os_unfair_lock_lock((os_unfair_lock_t)&__offersOnDiskLock);
        id v23 = 0;
        uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v10 error:&v23];
        id v12 = v23;
        os_unfair_lock_unlock((os_unfair_lock_t)&__offersOnDiskLock);
        if (v12)
        {
          uint64_t v13 = WLKSystemLogObject();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)id buf = 138412290;
            id v26 = v12;
            _os_log_impl(&dword_1BA2E8000, v13, OS_LOG_TYPE_DEFAULT, "WLKOfferManager - init read from disk failed secure unarchiver error: %@", buf, 0xCu);
          }
        }
        else
        {
          id v14 = (void *)MEMORY[0x1E4F1CAD0];
          uint64_t v15 = objc_opt_class();
          uint64_t v16 = objc_opt_class();
          uint64_t v17 = objc_opt_class();
          uint64_t v18 = objc_opt_class();
          uint64_t v13 = objc_msgSend(v14, "setWithObjects:", v15, v16, v17, v18, objc_opt_class(), 0);
          v19 = [v11 decodeObjectOfClasses:v13 forKey:*MEMORY[0x1E4F284E8]];
          id v20 = v19;
          if (v19)
          {
            id v21 = [v19 copy];
            [(WLKOfferManager *)v2 _setOffers:v21];
          }
          else
          {
            id v21 = WLKSystemLogObject();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)id buf = 0;
              _os_log_impl(&dword_1BA2E8000, v21, OS_LOG_TYPE_DEFAULT, "WLKOfferManager - init read from disk unarchiver failed to decode object", buf, 2u);
            }
          }
        }
      }
    }
  }
  return v2;
}

- (void)saveOffer:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = WLKSystemLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_1BA2E8000, v8, OS_LOG_TYPE_DEFAULT, "WLKOfferManager - saveOffer: begin", (uint8_t *)&buf, 2u);
  }

  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __47__WLKOfferManager_saveOffer_completionHandler___block_invoke;
  v27[3] = &unk_1E620A438;
  id v9 = v7;
  id v28 = v9;
  id v10 = (void *)MEMORY[0x1BA9E94D0](v27);
  if (WLKIsDaemon())
  {
    objc_initWeak(&buf, self);
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __47__WLKOfferManager_saveOffer_completionHandler___block_invoke_49;
    block[3] = &unk_1E620A488;
    objc_copyWeak(&v25, &buf);
    id v23 = v6;
    id v24 = v10;
    id v12 = v10;
    dispatch_async(queue, block);

    objc_destroyWeak(&v25);
    objc_destroyWeak(&buf);
  }
  else
  {
    uint64_t v13 = [(WLKOfferManager *)self _connection];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __47__WLKOfferManager_saveOffer_completionHandler___block_invoke_3;
    v20[3] = &unk_1E620A438;
    id v14 = v10;
    id v21 = v14;
    uint64_t v15 = [v13 remoteObjectProxyWithErrorHandler:v20];

    uint64_t v16 = WLKSystemLogObject();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1BA2E8000, v16, OS_LOG_TYPE_DEFAULT, "WLKOfferManager - calling out to daemon for saving offer", (uint8_t *)&buf, 2u);
    }

    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __47__WLKOfferManager_saveOffer_completionHandler___block_invoke_53;
    v18[3] = &unk_1E620A438;
    id v19 = v14;
    id v17 = v14;
    [v15 saveOffer:v6 completionHandler:v18];
  }
}

void __47__WLKOfferManager_saveOffer_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  dispatch_queue_t v4 = WLKSystemLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_1BA2E8000, v4, OS_LOG_TYPE_DEFAULT, "WLKOfferManager - saveOffer: end", v6, 2u);
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

void __47__WLKOfferManager_saveOffer_completionHandler___block_invoke_49(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  id v3 = WeakRetained;
  if (!a1[4])
  {
    uint64_t v13 = [MEMORY[0x1E4F28C58] errorWithDomain:@"WLKOfferManagerErrorDomain" code:-1 userInfo:0];
    (*((void (**)(void))a1[5] + 2))();

    id v10 = 0;
    goto LABEL_14;
  }
  uint64_t v4 = [WeakRetained _offers];
  if (!v4
    || (uint64_t v5 = (void *)v4,
        [v3 _offers],
        id v6 = objc_claimAutoreleasedReturnValue(),
        uint64_t v7 = [v6 count],
        v6,
        v5,
        !v7))
  {
    id v10 = [MEMORY[0x1E4F1CA48] arrayWithObject:a1[4]];
LABEL_7:
    uint64_t v11 = (void *)[v10 copy];
    [v3 _setOffers:v11];

    id v12 = [v3 _updateOfferFile];
    (*((void (**)(void))a1[5] + 2))();

    goto LABEL_14;
  }
  uint64_t v24 = 0;
  id v25 = &v24;
  uint64_t v26 = 0x2020000000;
  char v27 = 0;
  id v8 = [v3 _offers];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __47__WLKOfferManager_saveOffer_completionHandler___block_invoke_2;
  v20[3] = &unk_1E620A460;
  id v21 = a1[4];
  id v22 = a1[5];
  id v23 = &v24;
  [v8 enumerateObjectsUsingBlock:v20];

  int v9 = *((unsigned __int8 *)v25 + 24);
  if (*((unsigned char *)v25 + 24))
  {
    id v10 = 0;
  }
  else
  {
    id v14 = [v3 _offers];
    uint64_t v15 = [v14 count];

    uint64_t v16 = (void *)MEMORY[0x1E4F1CA48];
    [v3 _offers];
    if (v15 < 5) {
      id v17 = {;
    }
      uint64_t v18 = (void *)[v17 copy];
      id v10 = [v16 arrayWithArray:v18];
    }
    else {
      id v17 = {;
    }
      uint64_t v18 = objc_msgSend(v17, "subarrayWithRange:", 1, 4);
      id v19 = (void *)[v18 copy];
      id v10 = [v16 arrayWithArray:v19];
    }
    [v10 addObject:a1[4]];
  }

  _Block_object_dispose(&v24, 8);
  if (!v9) {
    goto LABEL_7;
  }
LABEL_14:
}

void __47__WLKOfferManager_saveOffer_completionHandler___block_invoke_2(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  if ([a2 isEqualToDictionary:a1[4]])
  {
    *a4 = 1;
    id v6 = [MEMORY[0x1E4F28C58] errorWithDomain:@"WLKOfferManagerErrorDomain" code:-2 userInfo:0];
    (*(void (**)(void))(a1[5] + 16))();
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
  }
}

void __47__WLKOfferManager_saveOffer_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = WLKSystemLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_1BA2E8000, v4, OS_LOG_TYPE_DEFAULT, "WLKOfferManager - Error: Unable to communicate with the remote object proxy (%@)", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __47__WLKOfferManager_saveOffer_completionHandler___block_invoke_53(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = WLKSystemLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v5 = 0;
    _os_log_impl(&dword_1BA2E8000, v4, OS_LOG_TYPE_DEFAULT, "WLKOfferManager - daemon callback for saving offer", v5, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __42__WLKOfferManager_fetchOffers_completion___block_invoke_57(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = WLKSystemLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_1BA2E8000, v4, OS_LOG_TYPE_DEFAULT, "WLKOfferManager - Error: Unable to communicate with the remote object proxy (%@)", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)removeOfferByBadgeId:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = WLKSystemLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_1BA2E8000, v8, OS_LOG_TYPE_DEFAULT, "WLKOfferManager - removeOffer: begin", (uint8_t *)&buf, 2u);
  }

  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __58__WLKOfferManager_removeOfferByBadgeId_completionHandler___block_invoke;
  v27[3] = &unk_1E620A438;
  id v9 = v7;
  id v28 = v9;
  id v10 = (void *)MEMORY[0x1BA9E94D0](v27);
  if (WLKIsDaemon())
  {
    objc_initWeak(&buf, self);
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __58__WLKOfferManager_removeOfferByBadgeId_completionHandler___block_invoke_60;
    block[3] = &unk_1E620A488;
    objc_copyWeak(&v25, &buf);
    id v23 = v6;
    id v24 = v10;
    id v12 = v10;
    dispatch_async(queue, block);

    objc_destroyWeak(&v25);
    objc_destroyWeak(&buf);
  }
  else
  {
    uint64_t v13 = [(WLKOfferManager *)self _connection];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __58__WLKOfferManager_removeOfferByBadgeId_completionHandler___block_invoke_64;
    v20[3] = &unk_1E620A438;
    id v14 = v10;
    id v21 = v14;
    uint64_t v15 = [v13 remoteObjectProxyWithErrorHandler:v20];

    uint64_t v16 = WLKSystemLogObject();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1BA2E8000, v16, OS_LOG_TYPE_DEFAULT, "WLKOfferManager - calling out to daemon for removing offer", (uint8_t *)&buf, 2u);
    }

    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __58__WLKOfferManager_removeOfferByBadgeId_completionHandler___block_invoke_65;
    v18[3] = &unk_1E620A438;
    id v19 = v14;
    id v17 = v14;
    [v15 removeOfferByBadgeId:v6 completionHandler:v18];
  }
}

void __58__WLKOfferManager_removeOfferByBadgeId_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = WLKSystemLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_1BA2E8000, v4, OS_LOG_TYPE_DEFAULT, "WLKOfferManager - removeOffer: end", v6, 2u);
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

void __58__WLKOfferManager_removeOfferByBadgeId_completionHandler___block_invoke_60(id *a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  id v3 = [WeakRetained _offers];
  uint64_t v4 = v3;
  if (v3 && [v3 count])
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v22 = 0x2020000000;
    uint64_t v23 = -1;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __58__WLKOfferManager_removeOfferByBadgeId_completionHandler___block_invoke_2;
    v18[3] = &unk_1E620A528;
    id v19 = a1[4];
    p_long long buf = &buf;
    [v4 enumerateObjectsUsingBlock:v18];
    uint64_t v5 = *(void *)(*((void *)&buf + 1) + 24);
    if (v5 == -1
      || ([WeakRetained _offers],
          id v6 = objc_claimAutoreleasedReturnValue(),
          BOOL v7 = [v6 count] == 1,
          v6,
          v7))
    {
      id v8 = 0;
    }
    else
    {
      uint64_t v11 = (void *)MEMORY[0x1E4F1CA48];
      id v12 = [WeakRetained _offers];
      uint64_t v13 = (void *)[v12 copy];
      id v8 = [v11 arrayWithArray:v13];

      [v8 removeObjectAtIndex:*(void *)(*((void *)&buf + 1) + 24)];
    }

    _Block_object_dispose(&buf, 8);
    if (v5 != -1)
    {
      if (v8)
      {
        id v14 = (void *)[v8 copy];
        [WeakRetained _setOffers:v14];

        uint64_t v15 = [WeakRetained _updateOfferFile];
        (*((void (**)(void))a1[5] + 2))();
      }
      else
      {
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __58__WLKOfferManager_removeOfferByBadgeId_completionHandler___block_invoke_3;
        v16[3] = &unk_1E620A438;
        id v17 = a1[5];
        [WeakRetained clearOffers:v16];
        id v8 = v17;
      }
      goto LABEL_12;
    }
  }
  else
  {
    id v8 = 0;
  }
  id v9 = WLKSystemLogObject();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = (__CFString *)a1[4];
    if (!v10) {
      id v10 = &stru_1F13BCF18;
    }
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v10;
    _os_log_impl(&dword_1BA2E8000, v9, OS_LOG_TYPE_DEFAULT, "WLKOfferManager - Fail to remove offer. Badge ID %@ Not found", (uint8_t *)&buf, 0xCu);
  }

  (*((void (**)(void))a1[5] + 2))();
LABEL_12:
}

void __58__WLKOfferManager_removeOfferByBadgeId_completionHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = [a2 objectForKey:@"badgeId"];
  if ([v7 isEqualToString:*(void *)(a1 + 32)])
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
    *a4 = 1;
  }
}

void __58__WLKOfferManager_removeOfferByBadgeId_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = WLKSystemLogObject();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      int v6 = 138412290;
      id v7 = v3;
      _os_log_impl(&dword_1BA2E8000, v4, OS_LOG_TYPE_DEFAULT, "WLKOfferManager - Failed to remove offer - %@", (uint8_t *)&v6, 0xCu);
    }
  }
  else if (v5)
  {
    LOWORD(v6) = 0;
    _os_log_impl(&dword_1BA2E8000, v4, OS_LOG_TYPE_DEFAULT, "WLKOfferManager - Remove offer successfully", (uint8_t *)&v6, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __58__WLKOfferManager_removeOfferByBadgeId_completionHandler___block_invoke_64(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = WLKSystemLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_1BA2E8000, v4, OS_LOG_TYPE_DEFAULT, "WLKOfferManager - Error: Unable to communicate with the remote object proxy (%@)", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __58__WLKOfferManager_removeOfferByBadgeId_completionHandler___block_invoke_65(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = WLKSystemLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v5 = 0;
    _os_log_impl(&dword_1BA2E8000, v4, OS_LOG_TYPE_DEFAULT, "WLKOfferManager - daemon callback for removing offer", v5, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __31__WLKOfferManager_clearOffers___block_invoke_68(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = WLKSystemLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v5 = 0;
    _os_log_impl(&dword_1BA2E8000, v4, OS_LOG_TYPE_DEFAULT, "WLKOfferManager - daemon callback for clearing all offers", v5, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __30__WLKOfferManager__connection__block_invoke()
{
  v0 = WLKSystemLogObject();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1BA2E8000, v0, OS_LOG_TYPE_DEFAULT, "WLKOfferManager - Connection interrupted.", v1, 2u);
  }
}

void __30__WLKOfferManager__connection__block_invoke_75(uint64_t a1)
{
  v2 = WLKSystemLogObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_1BA2E8000, v2, OS_LOG_TYPE_DEFAULT, "WLKOfferManager - Connection invalidated.", v6, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v4 = WeakRetained;
  if (WeakRetained)
  {
    int v5 = (void *)*((void *)WeakRetained + 1);
    *((void *)WeakRetained + 1) = 0;
  }
}

- (void)_activeAccountChangedNotification:(id)a3
{
  if (WLKIsDaemon())
  {
    id v3 = objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStore");
    objc_msgSend(v3, "ams_activeiTunesAccount");
    id v8 = (id)objc_claimAutoreleasedReturnValue();

    uint64_t v4 = v8;
    if (!v8)
    {
      NSLog(&cfstr_Wlkoffermanage_0.isa);
      +[WLKBadgingUtilities clearSavedBadgeIdentifiers];
      int v5 = +[WLKNotificationCenter defaultCenter];
      id v6 = [NSNumber numberWithInt:0];
      [v5 setBadgeNumber:v6 withCompletionHandler:0];

      uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.WatchListKit"];
      [v7 removeObjectForKey:@"PreviouslyBadgedTVOffers"];

      uint64_t v4 = 0;
    }
  }
}

- (id)_updateOfferFile
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v4 = +[WLKOfferManager _offerPath];
  id v21 = 0;
  [v3 createDirectoryAtPath:v4 withIntermediateDirectories:1 attributes:0 error:&v21];
  id v5 = v21;

  if (!v5)
  {
    id v8 = (void *)MEMORY[0x1E4F28DB0];
    id v9 = [(WLKOfferManager *)self offers];
    id v20 = 0;
    id v10 = [v8 archivedDataWithRootObject:v9 requiringSecureCoding:1 error:&v20];
    id v11 = v20;

    if (!v10)
    {
LABEL_13:
      id v7 = v11;

      goto LABEL_14;
    }
    os_unfair_lock_lock((os_unfair_lock_t)&__offersOnDiskLock);
    id v12 = +[WLKOfferManager _offerFullPath];
    int v13 = [v10 writeToFile:v12 atomically:1];

    os_unfair_lock_unlock((os_unfair_lock_t)&__offersOnDiskLock);
    id v14 = WLKSystemLogObject();
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
    if (v13)
    {
      if (v15)
      {
        *(_WORD *)long long buf = 0;
        uint64_t v16 = "WLKOfferManager - _updateOfferFile: wrote offers to disk successfully";
        id v17 = v14;
        uint32_t v18 = 2;
LABEL_11:
        _os_log_impl(&dword_1BA2E8000, v17, OS_LOG_TYPE_DEFAULT, v16, buf, v18);
      }
    }
    else if (v15)
    {
      *(_DWORD *)long long buf = 138412290;
      id v23 = v11;
      uint64_t v16 = "WLKOfferManager - _updateOfferFile: failed to write offers to disk - %@";
      id v17 = v14;
      uint32_t v18 = 12;
      goto LABEL_11;
    }

    goto LABEL_13;
  }
  id v6 = WLKSystemLogObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v23 = v5;
    _os_log_impl(&dword_1BA2E8000, v6, OS_LOG_TYPE_DEFAULT, "WLKOfferManager - _updateOfferFile: failed to create directory at path - %@", buf, 0xCu);
  }

  id v7 = v5;
LABEL_14:

  return v7;
}

- (void)sendBadgeActionMetricsEvents:(id)a3
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc(MEMORY[0x1E4F4DD58]);
  id v5 = WLKTVAppBundleID();
  id v6 = objc_msgSend(MEMORY[0x1E4F4DBD8], "wlk_defaultBag");
  v31 = (void *)[v4 initWithContainerID:v5 bag:v6];

  id v30 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  v32 = v3;
  id v7 = [v3 lastObject];
  id v8 = [v7 objectForKeyedSubscript:@"metrics"];

  id obj = v8;
  uint64_t v35 = [v8 countByEnumeratingWithState:&v45 objects:v52 count:16];
  if (!v35)
  {
    v37 = 0;
    v38 = 0;
    v39 = 0;
    id v40 = 0;
    id v9 = 0;
    goto LABEL_33;
  }
  v37 = 0;
  v38 = 0;
  v39 = 0;
  id v40 = 0;
  id v9 = 0;
  uint64_t v34 = *(void *)v46;
  do
  {
    uint64_t v10 = 0;
    do
    {
      if (*(void *)v46 != v34) {
        objc_enumerationMutation(obj);
      }
      uint64_t v36 = v10;
      id v11 = *(void **)(*((void *)&v45 + 1) + 8 * v10);
      long long v41 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      id v12 = v11;
      uint64_t v13 = [v12 countByEnumeratingWithState:&v41 objects:v51 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v42;
        do
        {
          uint64_t v16 = 0;
          do
          {
            if (*(void *)v42 != v15) {
              objc_enumerationMutation(v12);
            }
            id v17 = *(void **)(*((void *)&v41 + 1) + 8 * v16);
            uint32_t v18 = [v12 objectForKey:v17];
            if (![v17 isEqualToString:@"details"]
              || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0) {
                goto LABEL_24;
              }
              id v19 = v18;
              if ([v17 isEqualToString:@"notificationId"])
              {
                id v20 = v39;
                id v21 = v9;
                v39 = v19;
              }
              else
              {
                if ([v17 isEqualToString:@"marketingCampaignGroup"])
                {
                  id v20 = v38;
                  v38 = v19;
                }
                else
                {
                  if (([v17 isEqualToString:@"marketingCampaignToken"] & 1) == 0)
                  {
                    int v22 = [v17 isEqualToString:@"notificationType"];
                    id v20 = v9;
                    id v21 = v19;
                    if (!v22) {
                      goto LABEL_23;
                    }
                    goto LABEL_22;
                  }
                  id v20 = v37;
                  v37 = v19;
                }
                id v21 = v9;
              }
LABEL_22:
              id v19 = v19;

              id v9 = v21;
              goto LABEL_23;
            }
            id v19 = v40;
            id v40 = v18;
LABEL_23:

LABEL_24:
            ++v16;
          }
          while (v14 != v16);
          uint64_t v23 = [v12 countByEnumeratingWithState:&v41 objects:v51 count:16];
          uint64_t v14 = v23;
        }
        while (v23);
      }

      uint64_t v10 = v36 + 1;
    }
    while (v36 + 1 != v35);
    uint64_t v35 = [obj countByEnumeratingWithState:&v45 objects:v52 count:16];
  }
  while (v35);
LABEL_33:

  uint64_t v24 = (void *)[objc_alloc(MEMORY[0x1E4F4DD60]) initWithTopic:@"xp_amp_notifications"];
  id v25 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v25 setObject:@"badgeAction" forKey:@"eventType"];
  if (v40)
  {
    uint64_t v26 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithDictionary:v40];
    [v26 removeObjectForKey:@"brandId"];
    char v27 = (void *)[v26 copy];
    [v25 setObject:v27 forKey:@"details"];
  }
  if (v9) {
    [v25 setObject:v9 forKey:@"notificationType"];
  }
  if (v39) {
    [v25 setObject:v39 forKey:@"notificationId"];
  }
  if (v38) {
    [v25 setObject:v38 forKey:@"marketingCampaignGroup"];
  }
  if (v37) {
    [v25 setObject:v37 forKey:@"marketingCampaignToken"];
  }
  [v24 addPropertiesWithDictionary:v25];
  [v30 addObject:v24];
  id v28 = WLKSystemLogObject();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v50 = v30;
    _os_log_impl(&dword_1BA2E8000, v28, OS_LOG_TYPE_DEFAULT, "WLKOfferManager - Will send BadgeAction events: %@", buf, 0xCu);
  }

  [v31 enqueueEvents:v30];
  v29 = [v31 flush];
  [v29 addFinishBlock:&__block_literal_global_107];
}

void __48__WLKOfferManager_sendBadgeActionMetricsEvents___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = WLKSystemLogObject();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      int v9 = 138412290;
      id v10 = v3;
      id v6 = "WLKOfferManager - Error flushing BadgeAction events: %@";
      id v7 = v4;
      uint32_t v8 = 12;
LABEL_6:
      _os_log_impl(&dword_1BA2E8000, v7, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v9, v8);
    }
  }
  else if (v5)
  {
    LOWORD(v9) = 0;
    id v6 = "WLKOfferManager - BadgeAction Events flushed.";
    id v7 = v4;
    uint32_t v8 = 2;
    goto LABEL_6;
  }
}

- (NSArray)offers
{
  return self->_offers;
}

- (void)setOffers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_offers, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

@end