@interface WiFiWalletSource
- (NSMutableDictionary)networks;
- (NSMutableSet)relevantPassIdentifiers;
- (OS_dispatch_queue)queue;
- (PKPassLibrary)passLibrary;
- (WiFiWalletSource)init;
- (WiFiWalletSource)initWithChangeHandler:(id)a3;
- (id)_createWiFiWalletPassFromPass:(id)a3;
- (id)_networksWithIdentifier:(id)a3;
- (id)candidateNetworks;
- (id)changeHandler;
- (id)expiredWalletIDs;
- (id)relevancyHandler;
- (id)relevantNetworks;
- (void)_addPass:(id)a3;
- (void)_handlePassLibraryChange:(id)a3;
- (void)_handleRelevantPassUpdate:(id)a3;
- (void)_initializeWiFiPasses;
- (void)_issueRelevancyCallbackWithRelevantNetworks:(id)a3 notRelevantNetworks:(id)a4;
- (void)_passDidBecomeRelevant:(id)a3;
- (void)_passLibraryDidBecomeRelevantNotification:(id)a3;
- (void)_passLibraryDidChange:(id)a3;
- (void)_removeRelevantPasses;
- (void)dealloc;
- (void)setChangeHandler:(id)a3;
- (void)setNetworks:(id)a3;
- (void)setPassLibrary:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRelevancyHandler:(id)a3;
- (void)setRelevantPassIdentifiers:(id)a3;
@end

@implementation WiFiWalletSource

- (id)relevantNetworks
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA80] set];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v4 = (void *)MEMORY[0x1E4F1CAD0];
  v5 = [(WiFiWalletSource *)self relevantPassIdentifiers];
  v6 = [v4 setWithSet:v5];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        v12 = [(WiFiWalletSource *)self networks];
        v13 = [v12 objectForKey:v11];

        if (v13)
        {
          v14 = [v13 allObjects];
          [v3 addObjectsFromArray:v14];
        }
        else
        {
          NSLog(&cfstr_SNoRelevantNet_0.isa, "-[WiFiWalletSource relevantNetworks]", v11);
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  return v3;
}

- (NSMutableSet)relevantPassIdentifiers
{
  return self->_relevantPassIdentifiers;
}

- (WiFiWalletSource)init
{
  return [(WiFiWalletSource *)self initWithChangeHandler:0];
}

- (WiFiWalletSource)initWithChangeHandler:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)WiFiWalletSource;
  v5 = [(WiFiWalletSource *)&v19 init];
  if (!v5)
  {
    long long v17 = 0;
    goto LABEL_9;
  }
  if (v4)
  {
    uint64_t v6 = MEMORY[0x1D94403E0](v4);
    id changeHandler = v5->changeHandler;
    v5->id changeHandler = (id)v6;
  }
  dispatch_queue_t v8 = dispatch_queue_create("com.apple.wifi.wallet-source", 0);
  queue = v5->_queue;
  v5->_queue = (OS_dispatch_queue *)v8;

  if (!v5->_queue) {
    goto LABEL_12;
  }
  v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  networks = v5->_networks;
  v5->_networks = v10;

  if (!v5->_networks
    || (v12 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]),
        relevantPassIdentifiers = v5->_relevantPassIdentifiers,
        v5->_relevantPassIdentifiers = v12,
        relevantPassIdentifiers,
        !v5->_relevantPassIdentifiers))
  {
LABEL_12:
    long long v17 = v5;
    v5 = 0;
    goto LABEL_9;
  }
  if (([MEMORY[0x1E4F84890] isPassLibraryAvailable] & 1) == 0)
  {
    NSLog(&cfstr_PkpasslibraryI.isa);
    goto LABEL_12;
  }
  v14 = (PKPassLibrary *)objc_alloc_init(MEMORY[0x1E4F84890]);
  passLibrary = v5->_passLibrary;
  v5->_passLibrary = v14;

  [(WiFiWalletSource *)v5 _initializeWiFiPasses];
  long long v16 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v16 addObserver:v5 selector:sel__passLibraryDidChange_ name:*MEMORY[0x1E4F87560] object:v5->_passLibrary];

  long long v17 = [MEMORY[0x1E4F28C40] defaultCenter];
  [v17 addObserver:v5 selector:sel__passLibraryDidBecomeRelevantNotification_ name:*MEMORY[0x1E4F87588] object:0 suspensionBehavior:2];
LABEL_9:

  return v5;
}

- (void)dealloc
{
  if (self->_passLibrary)
  {
    v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 removeObserver:self name:*MEMORY[0x1E4F87560] object:0];
  }
  v4.receiver = self;
  v4.super_class = (Class)WiFiWalletSource;
  [(WiFiWalletSource *)&v4 dealloc];
}

- (void)_initializeWiFiPasses
{
  objc_initWeak(&location, self);
  v3 = [(WiFiWalletSource *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__WiFiWalletSource__initializeWiFiPasses__block_invoke;
  block[3] = &unk_1E69BDDA8;
  objc_copyWeak(&v5, &location);
  block[4] = self;
  dispatch_async(v3, block);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __41__WiFiWalletSource__initializeWiFiPasses__block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_super v4 = [WeakRetained passLibrary];
  id v5 = [v4 passesOfType:0];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * v10);
        id v12 = objc_loadWeakRetained(v2);
        [v12 _addPass:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  v13 = [*(id *)(a1 + 32) passLibrary];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __41__WiFiWalletSource__initializeWiFiPasses__block_invoke_2;
  v14[3] = &unk_1E69BE2F0;
  v14[4] = *(void *)(a1 + 32);
  [v13 fetchCurrentRelevantPassInfo:v14];
}

void __41__WiFiWalletSource__initializeWiFiPasses__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  NSLog(&cfstr_RelevantPasses.isa, v3);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(a1 + 32) _handleRelevantPassUpdate:*(void *)(*((void *)&v9 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)_addPass:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    uint64_t v6 = [v4 semantics];

    if (v6)
    {
      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      uint64_t v7 = [v5 semantics];
      uint64_t v8 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v23;
        uint64_t v11 = *MEMORY[0x1E4F87650];
        while (2)
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v23 != v10) {
              objc_enumerationMutation(v7);
            }
            if ([*(id *)(*((void *)&v22 + 1) + 8 * i) isEqualToString:v11])
            {

              long long v15 = [v5 uniqueID];
              long long v16 = [v5 serialNumber];
              NSLog(&cfstr_SAddingPassUni.isa, "-[WiFiWalletSource _addPass:]", v5, v15, v16);

              id v14 = [(WiFiWalletSource *)self _createWiFiWalletPassFromPass:v5];
              if (v14)
              {
                long long v17 = [(WiFiWalletSource *)self networks];
                long long v18 = [v5 uniqueID];
                [v17 setObject:v14 forKey:v18];

                objc_super v19 = [(WiFiWalletSource *)self changeHandler];

                if (v19)
                {
                  block[0] = MEMORY[0x1E4F143A8];
                  block[1] = 3221225472;
                  block[2] = __29__WiFiWalletSource__addPass___block_invoke;
                  block[3] = &unk_1E69BC8B0;
                  block[4] = self;
                  id v14 = v14;
                  id v21 = v14;
                  dispatch_async(MEMORY[0x1E4F14428], block);
                }
              }
              else
              {
                NSLog(&cfstr_SFailedToCreat_6.isa, "-[WiFiWalletSource _addPass:]", v5);
              }
              goto LABEL_16;
            }
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
          if (v9) {
            continue;
          }
          break;
        }
      }
    }
  }

  v13 = [v5 localizedDescription];
  NSLog(&cfstr_SPassDoesnTCon.isa, "-[WiFiWalletSource _addPass:]", v5, v13);

  id v14 = 0;
LABEL_16:
}

void __29__WiFiWalletSource__addPass___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) changeHandler];
  (*((void (**)(id, void, void))v2 + 2))(v2, *(void *)(a1 + 40), 0);
}

- (void)_passLibraryDidBecomeRelevantNotification:(id)a3
{
  NSLog(&cfstr_S.isa, a2, "-[WiFiWalletSource _passLibraryDidBecomeRelevantNotification:]", a3);
  id v4 = [(WiFiWalletSource *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__WiFiWalletSource__passLibraryDidBecomeRelevantNotification___block_invoke;
  block[3] = &unk_1E69BC8D8;
  block[4] = self;
  dispatch_async(v4, block);
}

void __62__WiFiWalletSource__passLibraryDidBecomeRelevantNotification___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) passLibrary];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __62__WiFiWalletSource__passLibraryDidBecomeRelevantNotification___block_invoke_2;
  v3[3] = &unk_1E69BE2F0;
  v3[4] = *(void *)(a1 + 32);
  [v2 fetchCurrentRelevantPassInfo:v3];
}

void __62__WiFiWalletSource__passLibraryDidBecomeRelevantNotification___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    NSLog(&cfstr_RelevantPasses.isa, v3);
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v11;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v5);
          }
          [*(id *)(a1 + 32) _handleRelevantPassUpdate:*(void *)(*((void *)&v10 + 1) + 8 * i)];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v7);
    }
  }
  else
  {
    NSLog(&cfstr_SNoRelevantPas.isa, "-[WiFiWalletSource _passLibraryDidBecomeRelevantNotification:]_block_invoke_2");
    [*(id *)(a1 + 32) _removeRelevantPasses];
  }
}

- (void)_passLibraryDidChange:(id)a3
{
  id v4 = a3;
  NSLog(&cfstr_LibraryChanged.isa, v4);
  id v5 = [(WiFiWalletSource *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__WiFiWalletSource__passLibraryDidChange___block_invoke;
  block[3] = &unk_1E69BC8B0;
  block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);
}

void __42__WiFiWalletSource__passLibraryDidChange___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [*(id *)(a1 + 40) userInfo];
  [v1 _handlePassLibraryChange:v2];
}

- (void)_handlePassLibraryChange:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v6 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F87540]];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v21;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v21 != v9) {
            objc_enumerationMutation(v6);
          }
          [(WiFiWalletSource *)self _addPass:*(void *)(*((void *)&v20 + 1) + 8 * v10++)];
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
      }
      while (v8);
    }

    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v11 = objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E4F875A8], 0);
    uint64_t v12 = [v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v17;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v17 != v14) {
            objc_enumerationMutation(v11);
          }
          [(WiFiWalletSource *)self _addPass:*(void *)(*((void *)&v16 + 1) + 8 * v15++)];
        }
        while (v13 != v15);
        uint64_t v13 = [v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
      }
      while (v13);
    }
  }
}

- (void)_handleRelevantPassUpdate:(id)a3
{
  id v4 = a3;
  id v9 = v4;
  if (v4)
  {
    uint64_t v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F87580]];
    if (v5)
    {
      id v6 = (void *)v5;
      uint64_t v7 = [(WiFiWalletSource *)self passLibrary];
      uint64_t v8 = [v7 passWithUniqueID:v6];

      if (v8)
      {
        [(WiFiWalletSource *)self _passDidBecomeRelevant:v8];
      }
      else
      {
        NSLog(&cfstr_SUnableToFindP.isa, "-[WiFiWalletSource _handleRelevantPassUpdate:]", v6);
      }
    }
    else
    {
      NSLog(&cfstr_SMissingUnique.isa, "-[WiFiWalletSource _handleRelevantPassUpdate:]", v9);
    }
  }
  else
  {
    NSLog(&cfstr_SPassinfoIsNil.isa, "-[WiFiWalletSource _handleRelevantPassUpdate:]");
  }
}

- (void)_passDidBecomeRelevant:(id)a3
{
  id v10 = a3;
  if (v10)
  {
    id v4 = [(WiFiWalletSource *)self relevantPassIdentifiers];
    uint64_t v5 = [v10 uniqueID];
    [v4 addObject:v5];

    id v6 = [v10 uniqueID];
    NSLog(&cfstr_SPassIsNowRele.isa, "-[WiFiWalletSource _passDidBecomeRelevant:]", v10, v6);

    uint64_t v7 = [v10 uniqueID];
    uint64_t v8 = [(WiFiWalletSource *)self _networksWithIdentifier:v7];

    if (v8)
    {
      [(WiFiWalletSource *)self _issueRelevancyCallbackWithRelevantNetworks:v8 notRelevantNetworks:0];
    }
    else
    {
      id v9 = [v10 uniqueID];
      NSLog(&cfstr_SNoRelevantNet.isa, "-[WiFiWalletSource _passDidBecomeRelevant:]", v10, v9);
    }
  }
  else
  {
    NSLog(&cfstr_SNoPassGivenFo.isa, "-[WiFiWalletSource _passDidBecomeRelevant:]");
  }
}

- (void)_removeRelevantPasses
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = [(WiFiWalletSource *)self relevantPassIdentifiers];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    uint64_t v5 = [(WiFiWalletSource *)self relevantPassIdentifiers];
    NSLog(&cfstr_SRelevantPassI.isa, "-[WiFiWalletSource _removeRelevantPasses]", v5);

    id v6 = [MEMORY[0x1E4F1CA80] set];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    uint64_t v7 = [(WiFiWalletSource *)self relevantPassIdentifiers];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v18 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v17 + 1) + 8 * i);
          uint64_t v13 = [(WiFiWalletSource *)self _networksWithIdentifier:v12];
          uint64_t v14 = v13;
          if (v13)
          {
            uint64_t v15 = [v13 allObjects];
            [v6 addObjectsFromArray:v15];
          }
          else
          {
            NSLog(&cfstr_SNoNetworksFou.isa, "-[WiFiWalletSource _removeRelevantPasses]", v12);
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v9);
    }

    [(WiFiWalletSource *)self _issueRelevancyCallbackWithRelevantNetworks:0 notRelevantNetworks:v6];
    long long v16 = [(WiFiWalletSource *)self relevantPassIdentifiers];
    [v16 removeAllObjects];
  }
  else
  {
    NSLog(&cfstr_SNoRelevantPas.isa, "-[WiFiWalletSource _removeRelevantPasses]");
  }
}

- (void)_issueRelevancyCallbackWithRelevantNetworks:(id)a3 notRelevantNetworks:(id)a4
{
  unint64_t v9 = (unint64_t)a3;
  unint64_t v6 = (unint64_t)a4;
  uint64_t v7 = [(WiFiWalletSource *)self relevancyHandler];

  if (v7)
  {
    if (v9 | v6)
    {
      uint64_t v8 = [(WiFiWalletSource *)self relevancyHandler];
      v8[2](v8, v9, v6);
    }
    else
    {
      NSLog(&cfstr_STriedToIsssue.isa, "-[WiFiWalletSource _issueRelevancyCallbackWithRelevantNetworks:notRelevantNetworks:]");
    }
  }
}

- (id)_createWiFiWalletPassFromPass:(id)a3
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id obj = [v3 semantics];
  uint64_t v4 = [obj countByEnumeratingWithState:&v48 objects:v53 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    id v6 = 0;
    uint64_t v7 = *(void *)v49;
    uint64_t v8 = *MEMORY[0x1E4F87650];
    uint64_t v9 = *MEMORY[0x1E4F878A0];
    uint64_t v10 = *MEMORY[0x1E4F87898];
    uint64_t v37 = *MEMORY[0x1E4F87650];
    uint64_t v38 = *(void *)v49;
    while (2)
    {
      uint64_t v11 = 0;
      uint64_t v39 = v5;
      do
      {
        if (*(void *)v49 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void **)(*((void *)&v48 + 1) + 8 * v11);
        if ([v12 isEqualToString:v8])
        {
          uint64_t v42 = v11;
          uint64_t v13 = [v3 localizedName];
          uint64_t v14 = [v3 localizedDescription];
          NSLog(&cfstr_PassHasWifi.isa, v13, v14);

          uint64_t v15 = [v3 semantics];
          long long v16 = [v15 objectForKey:v12];

          long long v17 = [v16 dictionariesValue];
          uint64_t v18 = [v17 count];

          if (!v18)
          {
            NSLog(&cfstr_SPassHasAWifia.isa, "-[WiFiWalletSource _createWiFiWalletPassFromPass:]", v3);

            v35 = 0;
            goto LABEL_25;
          }
          v43 = [MEMORY[0x1E4F1CA80] set];

          long long v46 = 0u;
          long long v47 = 0u;
          long long v44 = 0u;
          long long v45 = 0u;
          v41 = v16;
          long long v19 = [v16 dictionariesValue];
          uint64_t v20 = [v19 countByEnumeratingWithState:&v44 objects:v52 count:16];
          if (v20)
          {
            uint64_t v21 = v20;
            uint64_t v22 = *(void *)v45;
            do
            {
              for (uint64_t i = 0; i != v21; ++i)
              {
                if (*(void *)v45 != v22) {
                  objc_enumerationMutation(v19);
                }
                long long v24 = *(void **)(*((void *)&v44 + 1) + 8 * i);
                long long v25 = objc_alloc_init(WiFiWalletPass);
                uint64_t v26 = [v3 uniqueID];
                [(WiFiWalletPass *)v25 setUniqueIdentifier:v26];

                uint64_t v27 = [v24 objectForKey:v9];
                [(WiFiWalletPass *)v25 setSSID:v27];

                v28 = [v24 objectForKey:v10];
                [(WiFiWalletPass *)v25 setPassword:v28];

                v29 = [v3 serialNumber];
                [(WiFiWalletPass *)v25 setSerialNumber:v29];

                v30 = [v3 relevantDate];
                [(WiFiWalletPass *)v25 setRelevantDate:v30];

                v31 = [v3 localizedDescription];
                [(WiFiWalletPass *)v25 setLocalizedDescription:v31];

                v32 = [(WiFiWalletPass *)v25 SSID];

                if (v32)
                {
                  v33 = [(WiFiWalletPass *)v25 SSID];
                  uint64_t v34 = [v33 length];

                  if (v34)
                  {
                    [v43 addObject:v25];
                    NSLog(&cfstr_SAddedWifiinfo.isa, "-[WiFiWalletSource _createWiFiWalletPassFromPass:]", v25);
                  }
                }
              }
              uint64_t v21 = [v19 countByEnumeratingWithState:&v44 objects:v52 count:16];
            }
            while (v21);
          }

          uint64_t v11 = v42;
          id v6 = v43;
          uint64_t v8 = v37;
          uint64_t v7 = v38;
          uint64_t v5 = v39;
        }
        ++v11;
      }
      while (v11 != v5);
      uint64_t v5 = [obj countByEnumeratingWithState:&v48 objects:v53 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  else
  {
    id v6 = 0;
  }

  id v6 = v6;
  v35 = v6;
LABEL_25:

  return v35;
}

- (id)_networksWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(WiFiWalletSource *)self networks];
  id v6 = [v5 objectForKey:v4];

  if (!v6) {
    NSLog(&cfstr_SRelevantNetwo.isa, "-[WiFiWalletSource _networksWithIdentifier:]", v4);
  }

  return v6;
}

- (id)candidateNetworks
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA80] set];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = [(WiFiWalletSource *)self networks];
  uint64_t v5 = [v4 allValues];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = [*(id *)(*((void *)&v14 + 1) + 8 * v9) allObjects];
        [v3 addObjectsFromArray:v10];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  if ([v3 count]) {
    uint64_t v11 = v3;
  }
  else {
    uint64_t v11 = 0;
  }
  id v12 = v11;

  return v12;
}

- (id)expiredWalletIDs
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v2 = [(WiFiWalletSource *)self passLibrary];
  id v3 = [v2 passes];

  id v4 = [MEMORY[0x1E4F1CA80] set];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v10, "isExpired", (void)v13))
        {
          uint64_t v11 = [v10 serialNumber];
          [v4 addObject:v11];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)changeHandler
{
  return self->changeHandler;
}

- (void)setChangeHandler:(id)a3
{
}

- (id)relevancyHandler
{
  return self->relevancyHandler;
}

- (void)setRelevancyHandler:(id)a3
{
}

- (PKPassLibrary)passLibrary
{
  return self->_passLibrary;
}

- (void)setPassLibrary:(id)a3
{
}

- (NSMutableDictionary)networks
{
  return self->_networks;
}

- (void)setNetworks:(id)a3
{
}

- (void)setRelevantPassIdentifiers:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_relevantPassIdentifiers, 0);
  objc_storeStrong((id *)&self->_networks, 0);
  objc_storeStrong((id *)&self->_passLibrary, 0);
  objc_storeStrong(&self->relevancyHandler, 0);

  objc_storeStrong(&self->changeHandler, 0);
}

@end