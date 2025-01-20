@interface PRBTGroupLocalizer
- (BOOL)restartRangingOn:(id)a3 withError:(id *)a4;
- (BOOL)startRangingOn:(id)a3 withError:(id *)a4;
- (BOOL)stopRangingOn:(id)a3 withError:(id *)a4;
- (NSMutableArray)localizerArray;
- (NSMutableArray)localizerShouldRangeArray;
- (NSMutableArray)localizerStateArray;
- (NSMutableDictionary)uuidIndexMap;
- (OS_dispatch_queue)delegateQueue;
- (OS_dispatch_queue)proximityQueue;
- (PRBTGroupLocalizer)initWithDelegate:(id)a3 queue:(id)a4 id:(id)a5;
- (PRBTGroupLocalizer)initWithDelegate:(id)a3 queue:(id)a4 id:(id)a5 isUT:(BOOL)a6;
- (PRBTGroupLocalizer)initWithDelegate:(id)a3 queue:(id)a4 id:(id)a5 isUT:(BOOL)a6 withAnalytics:(BOOL)a7;
- (PRBTGroupLocalizer)initWithDelegate:(id)a3 queue:(id)a4 id:(id)a5 withAnalytics:(BOOL)a6;
- (PRBTGroupLocalizerDelegate)delegate;
- (void)btLocalizerChangedState:(unint64_t)a3 onItem:(id)a4;
- (void)dealloc;
- (void)didFailWithError:(id)a3 onItem:(id)a4;
- (void)didUpdateBTProximity:(id)a3;
- (void)informDelegateRangingStarted:(id)a3 withError:(id)a4;
- (void)informDelegateRangingStopped:(id)a3 withError:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setDelegateQueue:(id)a3;
- (void)setLocalizerArray:(id)a3;
- (void)setLocalizerShouldRangeArray:(id)a3;
- (void)setLocalizerStateArray:(id)a3;
- (void)setProximityQueue:(id)a3;
- (void)setUuidIndexMap:(id)a3;
- (void)updateDelegateWithSelector:(SEL)a3 object:(id)a4;
- (void)willIntegrateBTRSSI:(id)a3;
@end

@implementation PRBTGroupLocalizer

- (PRBTGroupLocalizer)initWithDelegate:(id)a3 queue:(id)a4 id:(id)a5 isUT:(BOOL)a6
{
  return [(PRBTGroupLocalizer *)self initWithDelegate:a3 queue:a4 id:a5 isUT:a6 withAnalytics:1];
}

- (PRBTGroupLocalizer)initWithDelegate:(id)a3 queue:(id)a4 id:(id)a5 isUT:(BOOL)a6 withAnalytics:(BOOL)a7
{
  BOOL v50 = a6;
  BOOL v51 = a7;
  uint64_t v60 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a4;
  v46 = v12;
  id v47 = a5;
  v45 = v11;
  if (v11)
  {
    if (v12) {
      goto LABEL_3;
    }
  }
  else
  {
    v43 = [MEMORY[0x263F08690] currentHandler];
    [v43 handleFailureInMethod:a2, self, @"PRBTGroupLocalizer.m", 44, @"Invalid parameter not satisfying: %@", @"delegate" object file lineNumber description];

    if (v46) {
      goto LABEL_3;
    }
  }
  v44 = [MEMORY[0x263F08690] currentHandler];
  [v44 handleFailureInMethod:a2, self, @"PRBTGroupLocalizer.m", 45, @"Invalid parameter not satisfying: %@", @"queue" object file lineNumber description];

LABEL_3:
  v56.receiver = self;
  v56.super_class = (Class)PRBTGroupLocalizer;
  v13 = [(PRBTGroupLocalizer *)&v56 init];
  v14 = v13;
  if (v13)
  {
    [(PRBTGroupLocalizer *)v13 setDelegate:v11];
    [(PRBTGroupLocalizer *)v14 setDelegateQueue:v46];
    dispatch_queue_t v15 = dispatch_queue_create("com.apple.findmy.btgroupranging", 0);
    [(PRBTGroupLocalizer *)v14 setProximityQueue:v15];

    os_log_t v16 = os_log_create("com.apple.proximity", "btgrouplocalizer");
    logger = v14->_logger;
    v14->_logger = (OS_os_log *)v16;

    uint64_t v48 = [v47 count];
    v18 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:v48];
    [(PRBTGroupLocalizer *)v14 setLocalizerArray:v18];

    v19 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:v48];
    [(PRBTGroupLocalizer *)v14 setLocalizerShouldRangeArray:v19];

    v20 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:v48];
    [(PRBTGroupLocalizer *)v14 setLocalizerStateArray:v20];

    v21 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:v48];
    [(PRBTGroupLocalizer *)v14 setUuidIndexMap:v21];

    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    obuint64_t j = v47;
    uint64_t v22 = [obj countByEnumeratingWithState:&v52 objects:v59 count:16];
    if (v22)
    {
      uint64_t v23 = 0;
      uint64_t v24 = *(void *)v53;
      do
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v53 != v24) {
            objc_enumerationMutation(obj);
          }
          v26 = *(void **)(*((void *)&v52 + 1) + 8 * i);
          v27 = v14->_logger;
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            v28 = [v26 UUIDString];
            *(_DWORD *)buf = 138412290;
            v58 = v28;
            _os_log_impl(&dword_230EC1000, v27, OS_LOG_TYPE_DEFAULT, "BTGroupLocalizer adding item %@ to the map", buf, 0xCu);
          }
          v29 = [(PRBTGroupLocalizer *)v14 localizerArray];
          v30 = [PRBTLocalizer alloc];
          v31 = [(PRBTGroupLocalizer *)v14 proximityQueue];
          v32 = [(PRBTLocalizer *)v30 initWithDelegate:v14 queue:v31 id:v26 isUT:v50 productUUID:0 withAnalytics:v51];
          [v29 addObject:v32];

          v33 = [(PRBTGroupLocalizer *)v14 localizerShouldRangeArray];
          v34 = [NSNumber numberWithBool:0];
          [v33 addObject:v34];

          v35 = [(PRBTGroupLocalizer *)v14 localizerStateArray];
          v36 = [NSNumber numberWithInt:0];
          [v35 addObject:v36];

          v37 = [(PRBTGroupLocalizer *)v14 uuidIndexMap];
          v38 = [NSNumber numberWithInt:v23 + i];
          [v37 setObject:v38 forKey:v26];
        }
        uint64_t v22 = [obj countByEnumeratingWithState:&v52 objects:v59 count:16];
        uint64_t v23 = (v23 + i);
      }
      while (v22);
    }

    if (v48)
    {
      for (uint64_t j = 0; j != v48; ++j)
      {
        v40 = [(PRBTGroupLocalizer *)v14 localizerArray];
        v41 = [v40 objectAtIndexedSubscript:j];
        [v41 configure];
      }
    }
  }

  return v14;
}

- (PRBTGroupLocalizer)initWithDelegate:(id)a3 queue:(id)a4 id:(id)a5
{
  return [(PRBTGroupLocalizer *)self initWithDelegate:a3 queue:a4 id:a5 withAnalytics:1];
}

- (PRBTGroupLocalizer)initWithDelegate:(id)a3 queue:(id)a4 id:(id)a5 withAnalytics:(BOOL)a6
{
  BOOL v58 = a6;
  uint64_t v72 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  long long v53 = v11;
  id v54 = a5;
  long long v52 = v10;
  if (v10)
  {
    if (v11) {
      goto LABEL_3;
    }
  }
  else
  {
    BOOL v50 = [MEMORY[0x263F08690] currentHandler];
    [v50 handleFailureInMethod:a2, self, @"PRBTGroupLocalizer.m", 88, @"Invalid parameter not satisfying: %@", @"delegate" object file lineNumber description];

    if (v53) {
      goto LABEL_3;
    }
  }
  BOOL v51 = [MEMORY[0x263F08690] currentHandler];
  [v51 handleFailureInMethod:a2, self, @"PRBTGroupLocalizer.m", 89, @"Invalid parameter not satisfying: %@", @"queue" object file lineNumber description];

LABEL_3:
  v64.receiver = self;
  v64.super_class = (Class)PRBTGroupLocalizer;
  id v12 = [(PRBTGroupLocalizer *)&v64 init];
  v13 = v12;
  if (v12)
  {
    [(PRBTGroupLocalizer *)v12 setDelegate:v10];
    [(PRBTGroupLocalizer *)v13 setDelegateQueue:v53];
    dispatch_queue_t v14 = dispatch_queue_create("com.apple.findmy.btgroupranging", 0);
    [(PRBTGroupLocalizer *)v13 setProximityQueue:v14];

    os_log_t v15 = os_log_create("com.apple.proximity", "btgrouplocalizer");
    logger = v13->_logger;
    v13->_logger = (OS_os_log *)v15;

    uint64_t v55 = [v54 count];
    v17 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:v55];
    [(PRBTGroupLocalizer *)v13 setLocalizerArray:v17];

    v18 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:v55];
    [(PRBTGroupLocalizer *)v13 setLocalizerShouldRangeArray:v18];

    v19 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:v55];
    [(PRBTGroupLocalizer *)v13 setLocalizerStateArray:v19];

    v20 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:v55];
    [(PRBTGroupLocalizer *)v13 setUuidIndexMap:v20];

    long long v62 = 0u;
    long long v63 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    obuint64_t j = v54;
    uint64_t v21 = [obj countByEnumeratingWithState:&v60 objects:v71 count:16];
    if (v21)
    {
      uint64_t v59 = 0;
      uint64_t v57 = *(void *)v61;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v61 != v57) {
            objc_enumerationMutation(obj);
          }
          uint64_t v23 = *(void **)(*((void *)&v60 + 1) + 8 * i);
          uint64_t v24 = [v23 uuid];
          v25 = [v23 productUUID];
          int v26 = [v23 isOwned];
          v27 = v13->_logger;
          BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);
          if (v25)
          {
            if (v28)
            {
              id v29 = [v24 UUIDString];
              uint64_t v30 = [v25 UUIDString];
              v31 = (void *)v30;
              *(_DWORD *)buf = 138412802;
              v32 = "true";
              if (v26) {
                v32 = "false";
              }
              uint64_t v66 = (uint64_t)v29;
              __int16 v67 = 2112;
              uint64_t v68 = v30;
              __int16 v69 = 2080;
              v70 = v32;
              _os_log_impl(&dword_230EC1000, v27, OS_LOG_TYPE_DEFAULT, "BTGroupLocalizer adding item %@ to the map with productUUID %@, isUT: %s", buf, 0x20u);
            }
          }
          else if (v28)
          {
            uint64_t v33 = [v24 UUIDString];
            v34 = (void *)v33;
            *(_DWORD *)buf = 138412546;
            v35 = "true";
            if (v26) {
              v35 = "false";
            }
            uint64_t v66 = v33;
            __int16 v67 = 2080;
            uint64_t v68 = (uint64_t)v35;
            _os_log_impl(&dword_230EC1000, v27, OS_LOG_TYPE_DEFAULT, "BTGroupLocalizer adding item %@ to the map with no productUUID, isUT: %s", buf, 0x16u);
          }
          v36 = [(PRBTGroupLocalizer *)v13 localizerArray];
          v37 = [PRBTLocalizer alloc];
          v38 = [(PRBTGroupLocalizer *)v13 proximityQueue];
          v39 = [(PRBTLocalizer *)v37 initWithDelegate:v13 queue:v38 id:v24 isUT:v26 ^ 1u productUUID:v25 withAnalytics:v58];
          [v36 addObject:v39];

          v40 = [(PRBTGroupLocalizer *)v13 localizerShouldRangeArray];
          v41 = [NSNumber numberWithBool:0];
          [v40 addObject:v41];

          v42 = [(PRBTGroupLocalizer *)v13 localizerStateArray];
          v43 = [NSNumber numberWithInt:0];
          [v42 addObject:v43];

          v44 = [(PRBTGroupLocalizer *)v13 uuidIndexMap];
          v45 = [NSNumber numberWithInt:v59 + i];
          [v44 setObject:v45 forKey:v24];
        }
        uint64_t v21 = [obj countByEnumeratingWithState:&v60 objects:v71 count:16];
        uint64_t v59 = (v59 + i);
      }
      while (v21);
    }

    if (v55)
    {
      for (uint64_t j = 0; j != v55; ++j)
      {
        id v47 = [(PRBTGroupLocalizer *)v13 localizerArray];
        uint64_t v48 = [v47 objectAtIndexedSubscript:j];
        [v48 configure];
      }
    }
  }

  return v13;
}

- (void)didFailWithError:(id)a3 onItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(PRBTGroupLocalizer *)self delegateQueue];
  if (v8)
  {
    v9 = [(PRBTGroupLocalizer *)self delegateQueue];
  }
  else
  {
    v9 = MEMORY[0x263EF83A0];
    id v10 = MEMORY[0x263EF83A0];
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __46__PRBTGroupLocalizer_didFailWithError_onItem___block_invoke;
    block[3] = &unk_264BC1D50;
    id v13 = WeakRetained;
    id v14 = v6;
    id v15 = v7;
    dispatch_async(v9, block);
  }
}

uint64_t __46__PRBTGroupLocalizer_didFailWithError_onItem___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) didFailWithError:*(void *)(a1 + 40) onItem:*(void *)(a1 + 48)];
}

- (void)updateDelegateWithSelector:(SEL)a3 object:(id)a4
{
  id v6 = a4;
  id v7 = [(PRBTGroupLocalizer *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    v8 = [(PRBTGroupLocalizer *)self delegateQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __56__PRBTGroupLocalizer_updateDelegateWithSelector_object___block_invoke;
    block[3] = &unk_264BC1BF8;
    id v10 = v7;
    SEL v12 = a3;
    id v11 = v6;
    dispatch_async(v8, block);
  }
}

uint64_t __56__PRBTGroupLocalizer_updateDelegateWithSelector_object___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) performSelector:*(void *)(a1 + 48) withObject:*(void *)(a1 + 40)];
}

- (void)willIntegrateBTRSSI:(id)a3
{
}

- (void)didUpdateBTProximity:(id)a3
{
}

- (void)btLocalizerChangedState:(unint64_t)a3 onItem:(id)a4
{
  id v6 = a4;
  objc_initWeak(&location, self);
  id v7 = [(PRBTGroupLocalizer *)self proximityQueue];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __53__PRBTGroupLocalizer_btLocalizerChangedState_onItem___block_invoke;
  v9[3] = &unk_264BC1BD0;
  objc_copyWeak(v11, &location);
  id v10 = v6;
  v11[1] = (id)a3;
  id v8 = v6;
  dispatch_async(v7, v9);

  objc_destroyWeak(v11);
  objc_destroyWeak(&location);
}

void __53__PRBTGroupLocalizer_btLocalizerChangedState_onItem___block_invoke(uint64_t a1)
{
  uint64_t v64 = *MEMORY[0x263EF8340];
  v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));

  if (WeakRetained)
  {
    v4 = (id *)objc_loadWeakRetained(v2);
    v5 = [v4 uuidIndexMap];
    id v6 = [v5 objectForKey:*(void *)(a1 + 32)];
    int v7 = [v6 intValue];

    id v8 = [v4 localizerStateArray];
    v9 = [v8 objectAtIndexedSubscript:v7];
    int v10 = [v9 intValue];

    id v11 = [v4 localizerShouldRangeArray];
    SEL v12 = [v11 objectAtIndexedSubscript:v7];
    int v13 = [v12 BOOLValue];

    id v14 = [v4 localizerArray];
    id v15 = [v14 objectAtIndexedSubscript:v7];

    switch(*(void *)(a1 + 48))
    {
      case 0:
        os_log_t v16 = v4[1];
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          id v17 = [*(id *)(a1 + 32) UUIDString];
          *(_DWORD *)buf = 136315138;
          uint64_t v61 = [v17 UTF8String];
          _os_log_impl(&dword_230EC1000, v16, OS_LOG_TYPE_DEFAULT, "%s: Localizer is connecting", buf, 0xCu);
        }
        goto LABEL_41;
      case 1:
        v18 = v4[1];
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          id v19 = [*(id *)(a1 + 32) UUIDString];
          *(_DWORD *)buf = 136315138;
          uint64_t v61 = [v19 UTF8String];
          _os_log_impl(&dword_230EC1000, v18, OS_LOG_TYPE_DEFAULT, "%s: Localizer is configured and ready to start ranging", buf, 0xCu);
        }
        if (v13)
        {
          v20 = v4[1];
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            id v21 = [*(id *)(a1 + 32) UUIDString];
            uint64_t v22 = [v21 UTF8String];
            *(_DWORD *)buf = 136315138;
            uint64_t v61 = v22;
            _os_log_impl(&dword_230EC1000, v20, OS_LOG_TYPE_DEFAULT, "%s: Device asked to start ranging", buf, 0xCu);
          }
          id v59 = 0;
          char v23 = [v15 start:&v59];
          os_log_t v16 = v59;
          if ((v23 & 1) == 0)
          {
            uint64_t v24 = v4[1];
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
            {
              id v25 = [*(id *)(a1 + 32) UUIDString];
              uint64_t v26 = [v25 UTF8String];
              id v27 = [v16 localizedDescription];
              uint64_t v28 = [v27 UTF8String];
              *(_DWORD *)buf = 136315394;
              uint64_t v61 = v26;
              __int16 v62 = 2080;
              uint64_t v63 = v28;
              _os_log_impl(&dword_230EC1000, v24, OS_LOG_TYPE_DEFAULT, "%s: Failed to start ranging with error: %s", buf, 0x16u);
            }
          }
          goto LABEL_41;
        }
        if ((v10 - 3) <= 1) {
          [v4 informDelegateRangingStopped:*(void *)(a1 + 32) withError:0];
        }
        break;
      case 2:
        id v29 = v4[1];
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          id v30 = [*(id *)(a1 + 32) UUIDString];
          *(_DWORD *)buf = 136315138;
          uint64_t v61 = [v30 UTF8String];
          _os_log_impl(&dword_230EC1000, v29, OS_LOG_TYPE_DEFAULT, "%s: Localizer is attempting to start ranging", buf, 0xCu);
        }
        if (v13) {
          break;
        }
        v31 = v4[1];
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          id v32 = [*(id *)(a1 + 32) UUIDString];
          uint64_t v33 = [v32 UTF8String];
          *(_DWORD *)buf = 136315138;
          uint64_t v61 = v33;
          _os_log_impl(&dword_230EC1000, v31, OS_LOG_TYPE_DEFAULT, "%s: Localizer should not be attempting to range - asked to stop ranging", buf, 0xCu);
        }
        id v58 = 0;
        char v34 = [v15 stop:&v58];
        os_log_t v16 = v58;
        if ((v34 & 1) == 0)
        {
          v35 = v4[1];
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
          {
            id v36 = [*(id *)(a1 + 32) UUIDString];
            uint64_t v37 = [v36 UTF8String];
            id v38 = [v16 localizedDescription];
            uint64_t v39 = [v38 UTF8String];
            *(_DWORD *)buf = 136315394;
            uint64_t v61 = v37;
            __int16 v62 = 2080;
            uint64_t v63 = v39;
            _os_log_impl(&dword_230EC1000, v35, OS_LOG_TYPE_DEFAULT, "%s: Failed to stop ranging with error: %s", buf, 0x16u);
          }
        }
        goto LABEL_41;
      case 3:
        v40 = v4[1];
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
        {
          id v41 = [*(id *)(a1 + 32) UUIDString];
          *(_DWORD *)buf = 136315138;
          uint64_t v61 = [v41 UTF8String];
          _os_log_impl(&dword_230EC1000, v40, OS_LOG_TYPE_DEFAULT, "%s: Localizer is ranging", buf, 0xCu);
        }
        if (v13)
        {
          if ((v10 - 1) <= 1) {
            [v4 informDelegateRangingStarted:*(void *)(a1 + 32) withError:0];
          }
        }
        else
        {
          v46 = v4[1];
          if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
          {
            id v47 = [*(id *)(a1 + 32) UUIDString];
            uint64_t v48 = [v47 UTF8String];
            *(_DWORD *)buf = 136315138;
            uint64_t v61 = v48;
            _os_log_impl(&dword_230EC1000, v46, OS_LOG_TYPE_DEFAULT, "%s: Localizer should not be ranging - asked to stop ranging", buf, 0xCu);
          }
          id v57 = 0;
          char v49 = [v15 stop:&v57];
          os_log_t v16 = v57;
          if ((v49 & 1) == 0)
          {
            BOOL v50 = v4[1];
            if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
            {
              id v51 = [*(id *)(a1 + 32) UUIDString];
              uint64_t v52 = [v51 UTF8String];
              id v53 = [v16 localizedDescription];
              uint64_t v54 = [v53 UTF8String];
              *(_DWORD *)buf = 136315394;
              uint64_t v61 = v52;
              __int16 v62 = 2080;
              uint64_t v63 = v54;
              _os_log_impl(&dword_230EC1000, v50, OS_LOG_TYPE_DEFAULT, "%s: Failed to stop ranging with error: %s", buf, 0x16u);
            }
          }
LABEL_41:
        }
        break;
      case 4:
        v42 = v4[1];
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
        {
          id v43 = [*(id *)(a1 + 32) UUIDString];
          *(_DWORD *)buf = 136315138;
          uint64_t v61 = [v43 UTF8String];
          _os_log_impl(&dword_230EC1000, v42, OS_LOG_TYPE_DEFAULT, "%s: Localizer is attempting to stop ranging", buf, 0xCu);
        }
        if (!v13) {
          break;
        }
        os_log_t v16 = v4[1];
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          id v44 = [*(id *)(a1 + 32) UUIDString];
          uint64_t v45 = [v44 UTF8String];
          *(_DWORD *)buf = 136315138;
          uint64_t v61 = v45;
          _os_log_impl(&dword_230EC1000, v16, OS_LOG_TYPE_DEFAULT, "%s: Localizer should not be attempting to stop - wait until stop is complete and localizer is back to configured to ask to start again", buf, 0xCu);
        }
        goto LABEL_41;
      default:
        break;
    }
    uint64_t v55 = [v4 localizerStateArray];
    objc_super v56 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 48)];
    [v55 replaceObjectAtIndex:v7 withObject:v56];
  }
}

- (void)informDelegateRangingStarted:(id)a3 withError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(PRBTGroupLocalizer *)self delegateQueue];
  if (v8)
  {
    v9 = [(PRBTGroupLocalizer *)self delegateQueue];
  }
  else
  {
    v9 = MEMORY[0x263EF83A0];
    id v10 = MEMORY[0x263EF83A0];
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __61__PRBTGroupLocalizer_informDelegateRangingStarted_withError___block_invoke;
    block[3] = &unk_264BC1D50;
    id v13 = WeakRetained;
    id v14 = v6;
    id v15 = v7;
    dispatch_async(v9, block);
  }
}

uint64_t __61__PRBTGroupLocalizer_informDelegateRangingStarted_withError___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) didStartRangingOn:*(void *)(a1 + 40) withError:*(void *)(a1 + 48)];
}

- (void)informDelegateRangingStopped:(id)a3 withError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(PRBTGroupLocalizer *)self delegateQueue];
  if (v8)
  {
    v9 = [(PRBTGroupLocalizer *)self delegateQueue];
  }
  else
  {
    v9 = MEMORY[0x263EF83A0];
    id v10 = MEMORY[0x263EF83A0];
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __61__PRBTGroupLocalizer_informDelegateRangingStopped_withError___block_invoke;
    block[3] = &unk_264BC1D50;
    id v13 = WeakRetained;
    id v14 = v6;
    id v15 = v7;
    dispatch_async(v9, block);
  }
}

uint64_t __61__PRBTGroupLocalizer_informDelegateRangingStopped_withError___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) didStopRangingOn:*(void *)(a1 + 40) withError:*(void *)(a1 + 48)];
}

- (BOOL)startRangingOn:(id)a3 withError:(id *)a4
{
  id v5 = a3;
  objc_initWeak(&location, self);
  id v6 = [(PRBTGroupLocalizer *)self proximityQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__PRBTGroupLocalizer_startRangingOn_withError___block_invoke;
  block[3] = &unk_264BC1C20;
  objc_copyWeak(&v11, &location);
  id v10 = v5;
  id v7 = v5;
  dispatch_async(v6, block);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
  return 1;
}

void __47__PRBTGroupLocalizer_startRangingOn_withError___block_invoke(uint64_t a1)
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));

  if (WeakRetained)
  {
    v4 = (id *)objc_loadWeakRetained(v2);
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    obuint64_t j = *(id *)(a1 + 32);
    uint64_t v5 = [obj countByEnumeratingWithState:&v37 objects:v45 count:16];
    if (v5)
    {
      uint64_t v7 = *(void *)v38;
      *(void *)&long long v6 = 136315394;
      long long v34 = v6;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v38 != v7) {
            objc_enumerationMutation(obj);
          }
          v9 = *(void **)(*((void *)&v37 + 1) + 8 * i);
          id v10 = objc_msgSend(v4, "uuidIndexMap", v34);
          id v11 = [v10 objectForKey:v9];
          int v12 = [v11 intValue];

          id v13 = [v4 localizerShouldRangeArray];
          id v14 = [NSNumber numberWithBool:1];
          uint64_t v15 = v12;
          [v13 replaceObjectAtIndex:v12 withObject:v14];

          os_log_t v16 = v4[1];
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            id v17 = [v9 UUIDString];
            uint64_t v18 = [v17 UTF8String];
            *(_DWORD *)buf = 136315138;
            uint64_t v42 = v18;
            _os_log_impl(&dword_230EC1000, v16, OS_LOG_TYPE_DEFAULT, "%s: Device should range updated to YES", buf, 0xCu);
          }
          id v19 = [v4 localizerStateArray];
          v20 = [v19 objectAtIndexedSubscript:v15];
          BOOL v21 = [v20 intValue] == 1;

          if (v21)
          {
            uint64_t v22 = v4[1];
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
            {
              id v23 = [v9 UUIDString];
              uint64_t v24 = [v23 UTF8String];
              *(_DWORD *)buf = 136315138;
              uint64_t v42 = v24;
              _os_log_impl(&dword_230EC1000, v22, OS_LOG_TYPE_DEFAULT, "%s: Device asked to start ranging", buf, 0xCu);
            }
            id v25 = [v4 localizerArray];
            uint64_t v26 = [v25 objectAtIndexedSubscript:v15];
            id v36 = 0;
            char v27 = [v26 start:&v36];
            id v28 = v36;

            if ((v27 & 1) == 0)
            {
              id v29 = v4[1];
              if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
              {
                id v30 = [v9 UUIDString];
                uint64_t v31 = [v30 UTF8String];
                id v32 = [v28 localizedDescription];
                uint64_t v33 = [v32 UTF8String];
                *(_DWORD *)buf = v34;
                uint64_t v42 = v31;
                __int16 v43 = 2080;
                uint64_t v44 = v33;
                _os_log_impl(&dword_230EC1000, v29, OS_LOG_TYPE_DEFAULT, "%s: Failed to start ranging with error: %s", buf, 0x16u);
              }
            }
          }
        }
        uint64_t v5 = [obj countByEnumeratingWithState:&v37 objects:v45 count:16];
      }
      while (v5);
    }
  }
}

- (BOOL)stopRangingOn:(id)a3 withError:(id *)a4
{
  id v5 = a3;
  objc_initWeak(&location, self);
  long long v6 = [(PRBTGroupLocalizer *)self proximityQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__PRBTGroupLocalizer_stopRangingOn_withError___block_invoke;
  block[3] = &unk_264BC1C20;
  objc_copyWeak(&v11, &location);
  id v10 = v5;
  id v7 = v5;
  dispatch_async(v6, block);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
  return 1;
}

void __46__PRBTGroupLocalizer_stopRangingOn_withError___block_invoke(uint64_t a1)
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));

  if (WeakRetained)
  {
    v4 = (id *)objc_loadWeakRetained(v2);
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    obuint64_t j = *(id *)(a1 + 32);
    uint64_t v5 = [obj countByEnumeratingWithState:&v37 objects:v45 count:16];
    if (v5)
    {
      uint64_t v7 = *(void *)v38;
      *(void *)&long long v6 = 136315394;
      long long v34 = v6;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v38 != v7) {
            objc_enumerationMutation(obj);
          }
          v9 = *(void **)(*((void *)&v37 + 1) + 8 * i);
          id v10 = objc_msgSend(v4, "uuidIndexMap", v34);
          id v11 = [v10 objectForKey:v9];
          int v12 = [v11 intValue];

          id v13 = [v4 localizerShouldRangeArray];
          id v14 = [NSNumber numberWithBool:0];
          uint64_t v15 = v12;
          [v13 replaceObjectAtIndex:v12 withObject:v14];

          os_log_t v16 = v4[1];
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            id v17 = [v9 UUIDString];
            uint64_t v18 = [v17 UTF8String];
            *(_DWORD *)buf = 136315138;
            uint64_t v42 = v18;
            _os_log_impl(&dword_230EC1000, v16, OS_LOG_TYPE_DEFAULT, "%s: Device should range updated to NO", buf, 0xCu);
          }
          id v19 = [v4 localizerStateArray];
          v20 = [v19 objectAtIndexedSubscript:v15];
          int v21 = [v20 intValue];

          if ((v21 & 0xFFFFFFFE) == 2)
          {
            uint64_t v22 = v4[1];
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
            {
              id v23 = [v9 UUIDString];
              uint64_t v24 = [v23 UTF8String];
              *(_DWORD *)buf = 136315138;
              uint64_t v42 = v24;
              _os_log_impl(&dword_230EC1000, v22, OS_LOG_TYPE_DEFAULT, "%s: Device asked to stop ranging", buf, 0xCu);
            }
            id v25 = [v4 localizerArray];
            uint64_t v26 = [v25 objectAtIndexedSubscript:v15];
            id v36 = 0;
            char v27 = [v26 stop:&v36];
            id v28 = v36;

            if ((v27 & 1) == 0)
            {
              id v29 = v4[1];
              if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
              {
                id v30 = [v9 UUIDString];
                uint64_t v31 = [v30 UTF8String];
                id v32 = [v28 localizedDescription];
                uint64_t v33 = [v32 UTF8String];
                *(_DWORD *)buf = v34;
                uint64_t v42 = v31;
                __int16 v43 = 2080;
                uint64_t v44 = v33;
                _os_log_impl(&dword_230EC1000, v29, OS_LOG_TYPE_DEFAULT, "%s: Failed to stop ranging with error: %s", buf, 0x16u);
              }
            }
          }
        }
        uint64_t v5 = [obj countByEnumeratingWithState:&v37 objects:v45 count:16];
      }
      while (v5);
    }
  }
}

- (BOOL)restartRangingOn:(id)a3 withError:(id *)a4
{
  return 1;
}

- (void)dealloc
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_230EC1000, logger, OS_LOG_TYPE_DEFAULT, "Destructing PRBTGroupLocalizer", buf, 2u);
  }
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  obuint64_t j = [(PRBTGroupLocalizer *)self uuidIndexMap];
  uint64_t v4 = [obj countByEnumeratingWithState:&v38 objects:v46 count:16];
  if (v4)
  {
    uint64_t v6 = *(void *)v39;
    *(void *)&long long v5 = 136315394;
    long long v34 = v5;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v39 != v6) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        v9 = [(PRBTGroupLocalizer *)self uuidIndexMap];
        id v10 = [v9 objectForKey:v8];
        int v11 = [v10 intValue];

        int v12 = [(PRBTGroupLocalizer *)self localizerShouldRangeArray];
        uint64_t v13 = v11;
        id v14 = [v12 objectAtIndexedSubscript:v11];
        int v15 = [v14 BOOLValue];

        os_log_t v16 = [(PRBTGroupLocalizer *)self localizerStateArray];
        id v17 = [v16 objectAtIndexedSubscript:v13];
        int v18 = [v17 intValue];

        if ((v18 & 0xFFFFFFFE) == 2) {
          int v19 = v15;
        }
        else {
          int v19 = 0;
        }
        v20 = self->_logger;
        BOOL v21 = os_log_type_enabled((os_log_t)v20, OS_LOG_TYPE_DEFAULT);
        if (v19 == 1)
        {
          if (v21)
          {
            id v22 = [v8 UUIDString];
            uint64_t v23 = [v22 UTF8String];
            *(_DWORD *)buf = 136315138;
            uint64_t v43 = v23;
            _os_log_impl(&dword_230EC1000, (os_log_t)v20, OS_LOG_TYPE_DEFAULT, "%s: Device is still ranging - Stop is sent", buf, 0xCu);
          }
          uint64_t v24 = [(PRBTGroupLocalizer *)self localizerArray];
          id v25 = [v24 objectAtIndexedSubscript:v13];
          id v37 = 0;
          char v26 = [v25 stop:&v37];
          v20 = (OS_os_log *)v37;

          if ((v26 & 1) == 0)
          {
            char v27 = self->_logger;
            if (os_log_type_enabled((os_log_t)v27, OS_LOG_TYPE_DEFAULT))
            {
              id v28 = [v8 UUIDString];
              uint64_t v29 = [v28 UTF8String];
              id v30 = [(OS_os_log *)v20 localizedDescription];
              uint64_t v31 = [v30 UTF8String];
              *(_DWORD *)buf = v34;
              uint64_t v43 = v29;
              __int16 v44 = 2080;
              uint64_t v45 = v31;
              _os_log_impl(&dword_230EC1000, (os_log_t)v27, OS_LOG_TYPE_DEFAULT, "%s: Failed to stop ranging with error: %s", buf, 0x16u);
            }
          }
        }
        else if (v21)
        {
          id v32 = [v8 UUIDString];
          uint64_t v33 = [v32 UTF8String];
          *(_DWORD *)buf = 136315138;
          uint64_t v43 = v33;
          _os_log_impl(&dword_230EC1000, (os_log_t)v20, OS_LOG_TYPE_DEFAULT, "%s: Device is not ranging", buf, 0xCu);
        }
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v38 objects:v46 count:16];
    }
    while (v4);
  }

  v36.receiver = self;
  v36.super_class = (Class)PRBTGroupLocalizer;
  [(PRBTGroupLocalizer *)&v36 dealloc];
}

- (PRBTGroupLocalizerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PRBTGroupLocalizerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (OS_dispatch_queue)proximityQueue
{
  return self->_proximityQueue;
}

- (void)setProximityQueue:(id)a3
{
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (void)setDelegateQueue:(id)a3
{
}

- (NSMutableArray)localizerArray
{
  return self->_localizerArray;
}

- (void)setLocalizerArray:(id)a3
{
}

- (NSMutableArray)localizerShouldRangeArray
{
  return self->_localizerShouldRangeArray;
}

- (void)setLocalizerShouldRangeArray:(id)a3
{
}

- (NSMutableArray)localizerStateArray
{
  return self->_localizerStateArray;
}

- (void)setLocalizerStateArray:(id)a3
{
}

- (NSMutableDictionary)uuidIndexMap
{
  return self->_uuidIndexMap;
}

- (void)setUuidIndexMap:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuidIndexMap, 0);
  objc_storeStrong((id *)&self->_localizerStateArray, 0);
  objc_storeStrong((id *)&self->_localizerShouldRangeArray, 0);
  objc_storeStrong((id *)&self->_localizerArray, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong((id *)&self->_proximityQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_logger, 0);
}

@end