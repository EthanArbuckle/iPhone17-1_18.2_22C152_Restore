@interface PKPrinterBrowser
+ (id)browserWithDelegate:(id)a3;
+ (id)browserWithDelegate:(id)a3 infoDictionary:(id)a4;
+ (id)browserWithDelegate:(id)a3 infoDictionary:(id)a4 provenance:(unint64_t)a5;
- (BOOL)delegateRespondsToProximityUpdate;
- (NSMutableDictionary)btDevices;
- (NSMutableDictionary)printers;
- (PKPrinterBrowser)initWithDelegate:(id)a3 infoDictionary:(id)a4 provenance:(unint64_t)a5;
- (PKPrinterBrowserDelegate)delegate;
- (void)browserAdded:(id)a3 removed:(id)a4;
- (void)btlePrinterFound:(id)a3;
- (void)btleRssiUpdated:(id)a3 rssi:(id)a4;
- (void)dealloc;
- (void)printerAdded:(id)a3 more:(BOOL)a4;
- (void)printerRemoved:(id)a3 more:(BOOL)a4;
- (void)setBtDevices:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setPrinters:(id)a3;
@end

@implementation PKPrinterBrowser

+ (id)browserWithDelegate:(id)a3
{
  id v3 = a3;
  v4 = [PKPrinterBrowser alloc];
  v5 = [(PKPrinterBrowser *)v4 initWithDelegate:v3 infoDictionary:MEMORY[0x263EFFA78] provenance:0];

  return v5;
}

+ (id)browserWithDelegate:(id)a3 infoDictionary:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [[PKPrinterBrowser alloc] initWithDelegate:v5 infoDictionary:v6 provenance:0];

  return v7;
}

+ (id)browserWithDelegate:(id)a3 infoDictionary:(id)a4 provenance:(unint64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = [[PKPrinterBrowser alloc] initWithDelegate:v7 infoDictionary:v8 provenance:a5];

  return v9;
}

- (PKPrinterBrowser)initWithDelegate:(id)a3 infoDictionary:(id)a4 provenance:(unint64_t)a5
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  v21.receiver = self;
  v21.super_class = (Class)PKPrinterBrowser;
  v10 = [(PKPrinterBrowser *)&v21 init];
  if (v10)
  {
    uint64_t v11 = SBSSpringBoardServerPort();
    MEMORY[0x230FA89C0](v11, &v10->_originalCellFlag, &v10->_originalWifiFlag);
    uint64_t v12 = SBSSpringBoardServerPort();
    MEMORY[0x230FA89E0](v12, v10->_originalCellFlag, 2);
    uint64_t v13 = SBSSpringBoardServerPort();
    MEMORY[0x230FA89F0](v13, 0);
    v14 = [MEMORY[0x263EFF9A0] dictionary];
    [(PKPrinterBrowser *)v10 setPrinters:v14];

    v15 = [MEMORY[0x263EFF9A0] dictionary];
    [(PKPrinterBrowser *)v10 setBtDevices:v15];

    [(PKPrinterBrowser *)v10 setDelegate:v8];
    v10->_delegateRespondsToProximityUpdate = objc_opt_respondsToSelector() & 1;
    int v16 = +[PKPrinterBrowseInfo rollCacheGeneration];
    v17 = _PKLogCategory(PKLogCategoryDiscovery[0]);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v23 = v16;
      _os_log_impl(&dword_22EA54000, v17, OS_LOG_TYPE_DEFAULT, "Starting browse, flush cache from gen %d", buf, 8u);
    }

    v18 = [[PKPrintdRPC_BrowseClient alloc] initWithInfo:v9 provenance:a5 delegate:v10];
    browserClient = v10->_browserClient;
    v10->_browserClient = v18;

    [(PKPrintdRPC_BrowseClient *)v10->_browserClient startBrowsing];
  }

  return v10;
}

- (void)dealloc
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  uint64_t v4 = SBSSpringBoardServerPort();
  MEMORY[0x230FA89E0](v4, self->_originalCellFlag, self->_originalWifiFlag);
  browserClient = self->_browserClient;
  if (browserClient)
  {
    [(PKPrintdRPC_BrowseClient *)browserClient invalidate];
    id v6 = self->_browserClient;
    self->_browserClient = 0;
  }
  [(PKPrinterBrowser *)self setDelegate:0];
  [(PKPrinterBrowser *)self setPrinters:0];
  [(PKPrinterBrowser *)self setBtDevices:0];
  v7.receiver = self;
  v7.super_class = (Class)PKPrinterBrowser;
  [(PKPrinterBrowser *)&v7 dealloc];
}

- (void)setDelegate:(id)a3
{
  id v6 = (PKPrinterBrowserDelegate *)a3;
  if (!v6)
  {
    browserClient = self->_browserClient;
    if (browserClient)
    {
      [(PKPrintdRPC_BrowseClient *)browserClient invalidate];
      id v5 = self->_browserClient;
      self->_browserClient = 0;

      self->_delegateRespondsToProximityUpdate = 0;
    }
  }
  self->_delegate = v6;
  self->_delegateRespondsToProximityUpdate = objc_opt_respondsToSelector() & 1;
}

- (void)btleRssiUpdated:(id)a3 rssi:(id)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v23 = a3;
  id v22 = a4;
  if (self->_delegateRespondsToProximityUpdate)
  {
    id obj = [(PKPrinterBrowser *)self printers];
    objc_sync_enter(obj);
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v6 = self;
    objc_super v7 = [(PKPrinterBrowser *)self printers];
    id v8 = [v7 allValues];

    uint64_t v9 = [v8 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v26 != v10) {
            objc_enumerationMutation(v8);
          }
          uint64_t v12 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          uint64_t v13 = objc_msgSend(v12, "btleUUID", obj);
          if (v13)
          {
            v14 = [v12 btleUUID];
            int v15 = [v14 isEqual:v23];

            if (v15)
            {
              [v12 addRSSIValue:v22];
              v24[0] = MEMORY[0x263EF8330];
              v24[1] = 3221225472;
              v24[2] = __41__PKPrinterBrowser_btleRssiUpdated_rssi___block_invoke;
              v24[3] = &unk_2649EF050;
              v24[4] = v6;
              [v12 resolveOnMainQueue:v24];
            }
          }
        }
        uint64_t v9 = [v8 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v9);
    }

    objc_sync_exit(obj);
    int v16 = [(PKPrinterBrowser *)v6 btDevices];
    objc_sync_enter(v16);
    v17 = [(PKPrinterBrowser *)v6 btDevices];
    v18 = [v17 objectForKey:v23];

    if (v18)
    {
      [v18 addObject:v22];
      if ((unint64_t)[v18 count] >= 6) {
        [v18 removeObjectAtIndex:0];
      }
    }
    else
    {
      uint64_t v19 = [MEMORY[0x263EFF980] arrayWithObject:v22];
      v20 = [(PKPrinterBrowser *)v6 btDevices];
      [v20 setObject:v19 forKey:v23];

      v18 = (void *)v19;
    }

    objc_sync_exit(v16);
  }
}

void __41__PKPrinterBrowser_btleRssiUpdated_rssi___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v3 = [*(id *)(a1 + 32) delegate];
  [v3 proximityUpdatedForPrinter:v4];
}

- (void)browserAdded:(id)a3 removed:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = _PKLogCategory(PKLogCategoryDiscovery[0]);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v6;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v7;
    _os_log_impl(&dword_22EA54000, v8, OS_LOG_TYPE_DEFAULT, "%@ %@", buf, 0x16u);
  }

  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  uint64_t v16 = 0;
  uint64_t v9 = [v6 count];
  uint64_t v16 = [v7 count] + v9;
  objc_initWeak(&location, self);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __41__PKPrinterBrowser_browserAdded_removed___block_invoke;
  v12[3] = &unk_2649EF078;
  objc_copyWeak(&v13, &location);
  v12[4] = buf;
  [v6 enumerateObjectsUsingBlock:v12];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __41__PKPrinterBrowser_browserAdded_removed___block_invoke_2;
  v10[3] = &unk_2649EF078;
  objc_copyWeak(&v11, &location);
  v10[4] = buf;
  [v7 enumerateObjectsUsingBlock:v10];
  objc_destroyWeak(&v11);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
  _Block_object_dispose(buf, 8);
}

void __41__PKPrinterBrowser_browserAdded_removed___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v7 = *(void *)(v6 + 24) - 1;
  *(void *)(v6 + 24) = v7;
  id v8 = WeakRetained;
  [WeakRetained printerAdded:v4 more:v7 != 0];
}

void __41__PKPrinterBrowser_browserAdded_removed___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v7 = *(void *)(v6 + 24) - 1;
  *(void *)(v6 + 24) = v7;
  id v8 = WeakRetained;
  [WeakRetained printerRemoved:v4 more:v7 != 0];
}

- (void)printerAdded:(id)a3 more:(BOOL)a4
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id obj = [(PKPrinterBrowser *)self printers];
  objc_sync_enter(obj);
  uint64_t v6 = [(PKPrinterBrowser *)self printers];
  uint64_t v7 = [v5 bonjourName];
  id v8 = [v6 objectForKeyedSubscript:v7];

  if (v8)
  {
    uint64_t v9 = [v5 btleUUID];

    if (v9)
    {
      uint64_t v10 = [v5 btleUUID];
      [v8 setBtleUUID:v10];

      objc_msgSend(v8, "setBtleMeasuredPower:", objc_msgSend(v5, "btleMeasuredPower"));
    }
    id v11 = v8;

    id v5 = v11;
  }
  else
  {
    uint64_t v12 = [v5 btleUUID];

    if (v12)
    {
      long long v49 = 0u;
      long long v50 = 0u;
      long long v48 = 0u;
      long long v47 = 0u;
      id v13 = [(PKPrinterBrowser *)self printers];
      v14 = [v13 allValues];

      uint64_t v15 = [v14 countByEnumeratingWithState:&v47 objects:v52 count:16];
      if (v15)
      {
        uint64_t v16 = *(void *)v48;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v48 != v16) {
              objc_enumerationMutation(v14);
            }
            v18 = *(void **)(*((void *)&v47 + 1) + 8 * i);
            uint64_t v19 = [v5 uuid];
            v20 = [v18 uuid];
            BOOL v21 = [v19 compare:v20] == 0;

            if (v21)
            {
              id v22 = [v5 btleUUID];
              [v18 setBtleUUID:v22];

              objc_msgSend(v18, "setBtleMeasuredPower:", objc_msgSend(v5, "btleMeasuredPower"));
            }
          }
          uint64_t v15 = [v14 countByEnumeratingWithState:&v47 objects:v52 count:16];
        }
        while (v15);
      }
    }
    id v23 = [(PKPrinterBrowser *)self printers];
    uint64_t v24 = [v5 bonjourName];
    [v23 setObject:v5 forKey:v24];

    id v8 = 0;
  }

  objc_sync_exit(obj);
  long long v25 = [v5 btleUUID];
  BOOL v26 = v25 == 0;

  if (v26)
  {
    BOOL v33 = 0;
  }
  else
  {
    long long v27 = [(PKPrinterBrowser *)self btDevices];
    objc_sync_enter(v27);
    long long v28 = [(PKPrinterBrowser *)self btDevices];
    v29 = [v5 btleUUID];
    uint64_t v30 = [v28 objectForKey:v29];

    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id v31 = v30;
    uint64_t v32 = [v31 countByEnumeratingWithState:&v43 objects:v51 count:16];
    BOOL v33 = v32 != 0;
    if (v32)
    {
      uint64_t v34 = *(void *)v44;
      do
      {
        for (uint64_t j = 0; j != v32; ++j)
        {
          if (*(void *)v44 != v34) {
            objc_enumerationMutation(v31);
          }
          [v5 addRSSIValue:*(void *)(*((void *)&v43 + 1) + 8 * j)];
        }
        uint64_t v32 = [v31 countByEnumeratingWithState:&v43 objects:v51 count:16];
      }
      while (v32);
    }

    objc_sync_exit(v27);
  }
  objc_initWeak(&location, self);
  v38[0] = MEMORY[0x263EF8330];
  v38[1] = 3221225472;
  v38[2] = __38__PKPrinterBrowser_printerAdded_more___block_invoke;
  v38[3] = &unk_2649EF0A0;
  objc_copyWeak(&v39, &location);
  BOOL v40 = a4;
  BOOL v41 = v33;
  [v5 resolveOnMainQueue:v38];
  objc_destroyWeak(&v39);
  objc_destroyWeak(&location);
}

void __38__PKPrinterBrowser_printerAdded_more___block_invoke(uint64_t a1, void *a2)
{
  id v11 = a2;
  id v3 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));

  if (WeakRetained)
  {
    id v5 = objc_loadWeakRetained((id *)(a1 + 32));
    uint64_t v6 = [v5 delegate];
    [v6 addPrinter:v11 moreComing:*(unsigned __int8 *)(a1 + 40)];

    if (*(unsigned char *)(a1 + 41))
    {
      id v7 = objc_loadWeakRetained((id *)(a1 + 32));
      int v8 = [v7 delegateRespondsToProximityUpdate];

      if (v8)
      {
        id v9 = objc_loadWeakRetained(v3);
        uint64_t v10 = [v9 delegate];
        [v10 proximityUpdatedForPrinter:v11];
      }
    }
  }
}

- (void)printerRemoved:(id)a3 more:(BOOL)a4
{
  id v6 = a3;
  id v7 = [(PKPrinterBrowser *)self printers];
  objc_sync_enter(v7);
  int v8 = [(PKPrinterBrowser *)self printers];
  id v9 = [v6 bonjourName];
  uint64_t v10 = [v8 objectForKeyedSubscript:v9];

  if (v10)
  {
    id v11 = v10;

    uint64_t v12 = [(PKPrinterBrowser *)self printers];
    id v13 = [v11 bonjourName];
    [v12 removeObjectForKey:v13];
  }
  else
  {
    id v11 = v6;
  }

  objc_sync_exit(v7);
  objc_initWeak(&location, self);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __40__PKPrinterBrowser_printerRemoved_more___block_invoke;
  v14[3] = &unk_2649EF0C8;
  objc_copyWeak(&v15, &location);
  BOOL v16 = a4;
  [v11 resolveOnMainQueue:v14];
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __40__PKPrinterBrowser_printerRemoved_more___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));

  if (WeakRetained)
  {
    id v4 = objc_loadWeakRetained((id *)(a1 + 32));
    id v5 = [v4 delegate];
    [v5 removePrinter:v6 moreGoing:*(unsigned __int8 *)(a1 + 40)];
  }
}

- (void)btlePrinterFound:(id)a3
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    id v5 = [v3 uuid];
    if (v5)
    {
      id v6 = [v4 btleUUID];

      if (v6)
      {
        id v31 = v4;
        id obj = [(PKPrinterBrowser *)self printers];
        objc_sync_enter(obj);
        long long v39 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        long long v42 = 0u;
        id v7 = [(PKPrinterBrowser *)self printers];
        int v8 = [v7 allValues];

        id v9 = v8;
        uint64_t v10 = 0;
        uint64_t v11 = [v8 countByEnumeratingWithState:&v39 objects:v44 count:16];
        if (v11)
        {
          uint64_t v12 = *(void *)v40;
          do
          {
            for (uint64_t i = 0; i != v11; ++i)
            {
              if (*(void *)v40 != v12) {
                objc_enumerationMutation(v9);
              }
              v14 = *(void **)(*((void *)&v39 + 1) + 8 * i);
              id v15 = [v14 uuid];
              if (v15)
              {
                BOOL v16 = [v14 uuid];
                uint64_t v17 = [v31 uuid];
                int v18 = [v16 isEqual:v17];

                if (v18)
                {
                  id v19 = v14;

                  v20 = [v31 btleUUID];
                  [v19 setBtleUUID:v20];

                  uint64_t v10 = v19;
                  objc_msgSend(v19, "setBtleMeasuredPower:", objc_msgSend(v31, "btleMeasuredPower"));
                }
              }
            }
            int v8 = v9;
            uint64_t v11 = [v9 countByEnumeratingWithState:&v39 objects:v44 count:16];
          }
          while (v11);
        }

        objc_sync_exit(obj);
        if (v10 && self->_delegateRespondsToProximityUpdate)
        {
          BOOL v21 = [(PKPrinterBrowser *)self btDevices];
          objc_sync_enter(v21);
          id v22 = [(PKPrinterBrowser *)self btDevices];
          id v23 = [v10 btleUUID];
          uint64_t v24 = [v22 objectForKey:v23];

          long long v37 = 0u;
          long long v38 = 0u;
          long long v35 = 0u;
          long long v36 = 0u;
          id v25 = v24;
          uint64_t v26 = [v25 countByEnumeratingWithState:&v35 objects:v43 count:16];
          if (v26)
          {
            uint64_t v27 = *(void *)v36;
            do
            {
              for (uint64_t j = 0; j != v26; ++j)
              {
                if (*(void *)v36 != v27) {
                  objc_enumerationMutation(v25);
                }
                [v10 addRSSIValue:*(void *)(*((void *)&v35 + 1) + 8 * j)];
              }
              uint64_t v26 = [v25 countByEnumeratingWithState:&v35 objects:v43 count:16];
            }
            while (v26);

            objc_sync_exit(v21);
            objc_initWeak(&location, self);
            v32[0] = MEMORY[0x263EF8330];
            v32[1] = 3221225472;
            v32[2] = __37__PKPrinterBrowser_btlePrinterFound___block_invoke;
            v32[3] = &unk_2649EF0F0;
            objc_copyWeak(&v33, &location);
            [v10 resolveOnMainQueue:v32];
            objc_destroyWeak(&v33);
            objc_destroyWeak(&location);
          }
          else
          {

            objc_sync_exit(v21);
          }
        }

        id v4 = v31;
      }
    }
  }
}

void __37__PKPrinterBrowser_btlePrinterFound___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  id v3 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained(v3);

  if (WeakRetained)
  {
    id v5 = objc_loadWeakRetained(v3);
    id v6 = [v5 delegate];
    [v6 proximityUpdatedForPrinter:v7];
  }
}

- (PKPrinterBrowserDelegate)delegate
{
  return self->_delegate;
}

- (NSMutableDictionary)printers
{
  return self->_printers;
}

- (void)setPrinters:(id)a3
{
}

- (NSMutableDictionary)btDevices
{
  return self->_btDevices;
}

- (void)setBtDevices:(id)a3
{
}

- (BOOL)delegateRespondsToProximityUpdate
{
  return self->_delegateRespondsToProximityUpdate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_btDevices, 0);
  objc_storeStrong((id *)&self->_printers, 0);

  objc_storeStrong((id *)&self->_browserClient, 0);
}

@end