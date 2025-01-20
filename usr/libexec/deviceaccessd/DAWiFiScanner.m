@interface DAWiFiScanner
- (BOOL)scanning;
- (CWFInterface)wifiInterface;
- (DAWiFiScanner)init;
- (NSArray)descriptors;
- (NSMutableSet)SSIDs;
- (NSMutableSet)prefixes;
- (NSMutableSet)reportedNetworks;
- (id)_coalesceResults:(id)a3 descriptors:(id)a4;
- (id)_defaultScanParameters;
- (id)resultsHandler;
- (void)_performScan;
- (void)_queueNextScan;
- (void)setDescriptors:(id)a3;
- (void)setPrefixes:(id)a3;
- (void)setReportedNetworks:(id)a3;
- (void)setResultsHandler:(id)a3;
- (void)setSSIDs:(id)a3;
- (void)setScanning:(BOOL)a3;
- (void)setWifiInterface:(id)a3;
- (void)startScanningWithDescriptors:(id)a3;
- (void)stopScanning;
@end

@implementation DAWiFiScanner

- (DAWiFiScanner)init
{
  v9.receiver = self;
  v9.super_class = (Class)DAWiFiScanner;
  v2 = [(DAWiFiScanner *)&v9 init];
  if (v2)
  {
    v3 = (CWFInterface *)[objc_alloc((Class)CWFInterface) initWithServiceType:2];
    wifiInterface = v2->_wifiInterface;
    v2->_wifiInterface = v3;

    [(CWFInterface *)v2->_wifiInterface activate];
    v2->_scanning = 0;
    uint64_t v5 = +[NSMutableSet set];
    reportedNetworks = v2->_reportedNetworks;
    v2->_reportedNetworks = (NSMutableSet *)v5;

    v7 = v2;
  }

  return v2;
}

- (void)startScanningWithDescriptors:(id)a3
{
  id v5 = a3;
  if (self->_scanning)
  {
    if (dword_100043678 <= 30 && (dword_100043678 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
  else
  {
    self->_scanning = 1;
    objc_storeStrong((id *)&self->_descriptors, a3);
    v6 = +[NSMutableSet set];
    SSIDs = self->_SSIDs;
    self->_SSIDs = v6;

    v8 = +[NSMutableSet set];
    prefixes = self->_prefixes;
    self->_prefixes = v8;

    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    v10 = self->_descriptors;
    id v11 = [(NSArray *)v10 countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v31;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v31 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          uint64_t v16 = [v15 SSID];
          if (v16)
          {
            v17 = (void *)v16;
            v18 = [v15 SSID];
            id v19 = [v18 length];

            if (v19)
            {
              v20 = self->_SSIDs;
              v21 = [v15 SSID];
              [(NSMutableSet *)v20 addObject:v21];
            }
          }
          uint64_t v22 = [v15 prefix];
          if (v22)
          {
            v23 = (void *)v22;
            v24 = [v15 prefix];
            id v25 = [v24 length];

            if (v25)
            {
              v26 = self->_prefixes;
              v27 = [v15 prefix];
              [(NSMutableSet *)v26 addObject:v27];
            }
          }
        }
        id v12 = [(NSArray *)v10 countByEnumeratingWithState:&v30 objects:v34 count:16];
      }
      while (v12);
    }

    if ([(NSMutableSet *)self->_SSIDs count] || [(NSMutableSet *)self->_prefixes count])
    {
      [(DAWiFiScanner *)self _performScan];
    }
    else
    {
      resultsHandler = (void (**)(id, void *, void))self->_resultsHandler;
      v29 = DAErrorF();
      resultsHandler[2](resultsHandler, v29, 0);
    }
  }
}

- (void)_performScan
{
  if (self->_scanning)
  {
    v11[0] = 0;
    v11[1] = v11;
    v11[2] = 0x3032000000;
    v11[3] = sub_10001C440;
    v11[4] = sub_10001C450;
    id v12 = 0;
    v9[0] = 0;
    v9[1] = v9;
    v9[2] = 0x3032000000;
    v9[3] = sub_10001C440;
    v9[4] = sub_10001C450;
    id v10 = 0;
    v3 = [(DAWiFiScanner *)self _defaultScanParameters];
    v4 = [(NSMutableSet *)self->_SSIDs allObjects];
    [v3 setSSIDList:v4];

    if (dword_100043678 <= 30 && (dword_100043678 != -1 || _LogCategory_Initialize()))
    {
      SSIDs = self->_SSIDs;
      prefixes = self->_prefixes;
      LogPrintF();
    }
    id v5 = [(DAWiFiScanner *)self wifiInterface];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10001C458;
    v8[3] = &unk_10003D3D0;
    v8[5] = v9;
    v8[6] = v11;
    v8[4] = self;
    [v5 performScanWithParameters:v3 reply:v8];

    _Block_object_dispose(v9, 8);
    _Block_object_dispose(v11, 8);
  }
  else if (dword_100043678 <= 30 && (dword_100043678 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (void)_queueNextScan
{
  dispatch_time_t v3 = dispatch_time(0, 5000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001C7B8;
  block[3] = &unk_10003C950;
  block[4] = self;
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)stopScanning
{
  self->_scanning = 0;
  [(NSMutableSet *)self->_reportedNetworks removeAllObjects];
}

- (id)_defaultScanParameters
{
  id v2 = objc_alloc_init((Class)CWFScanParameters);
  [v2 setMergeScanResults:1];

  return v2;
}

- (id)_coalesceResults:(id)a3 descriptors:(id)a4
{
  id v27 = a3;
  id v6 = a4;
  id v25 = +[NSMutableDictionary dictionary];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id obj = v6;
  id v28 = [obj countByEnumeratingWithState:&v36 objects:v41 count:16];
  if (v28)
  {
    uint64_t v26 = *(void *)v37;
    do
    {
      for (i = 0; i != v28; i = (char *)i + 1)
      {
        if (*(void *)v37 != v26) {
          objc_enumerationMutation(obj);
        }
        v8 = *(NSMutableSet **)(*((void *)&v36 + 1) + 8 * i);
        if (dword_100043678 <= 30 && (dword_100043678 != -1 || _LogCategory_Initialize()))
        {
          [(NSMutableSet *)v8 scanResultPredicate];
          v23 = reportedNetworks = v8;
          LogPrintF();
        }
        objc_super v9 = [(NSMutableSet *)v8 scanResultPredicate];
        id v10 = [v27 filteredArrayUsingPredicate:v9];

        if (v10)
        {
          long long v31 = i;
          if (dword_100043678 <= 30 && (dword_100043678 != -1 || _LogCategory_Initialize()))
          {
            reportedNetworks = v8;
            v23 = v10;
            LogPrintF();
          }
          long long v30 = v8;
          id v11 = +[NSMutableArray array];
          long long v32 = 0u;
          long long v33 = 0u;
          long long v34 = 0u;
          long long v35 = 0u;
          v29 = v10;
          id v12 = v10;
          id v13 = [v12 countByEnumeratingWithState:&v32 objects:v40 count:16];
          if (v13)
          {
            id v14 = v13;
            uint64_t v15 = *(void *)v33;
            do
            {
              uint64_t v16 = 0;
              do
              {
                if (*(void *)v33 != v15) {
                  objc_enumerationMutation(v12);
                }
                v17 = *(void **)(*((void *)&v32 + 1) + 8 * (void)v16);
                v18 = objc_alloc_init(DAWiFiNetwork);
                id v19 = [v17 networkName];
                [(DAWiFiNetwork *)v18 setSSID:v19];

                -[DAWiFiNetwork setUnsecured:](v18, "setUnsecured:", [v17 isOpen]);
                if (dword_100043678 <= 30 && (dword_100043678 != -1 || _LogCategory_Initialize()))
                {
                  reportedNetworks = self->_reportedNetworks;
                  LogPrintF();
                }
                if (-[NSMutableSet containsObject:](self->_reportedNetworks, "containsObject:", v18, reportedNetworks))
                {
                  if (dword_100043678 <= 30 && (dword_100043678 != -1 || _LogCategory_Initialize()))
                  {
                    reportedNetworks = (NSMutableSet *)v18;
                    LogPrintF();
                  }
                }
                else
                {
                  [v11 addObject:v18];
                  [(NSMutableSet *)self->_reportedNetworks addObject:v18];
                }

                uint64_t v16 = (char *)v16 + 1;
              }
              while (v14 != v16);
              id v20 = [v12 countByEnumeratingWithState:&v32 objects:v40 count:16];
              id v14 = v20;
            }
            while (v20);
          }

          [v25 setObject:v11 forKey:v30];
          i = v31;
          id v10 = v29;
        }
      }
      id v28 = [obj countByEnumeratingWithState:&v36 objects:v41 count:16];
    }
    while (v28);
  }

  return v25;
}

- (id)resultsHandler
{
  return self->_resultsHandler;
}

- (void)setResultsHandler:(id)a3
{
}

- (CWFInterface)wifiInterface
{
  return self->_wifiInterface;
}

- (void)setWifiInterface:(id)a3
{
}

- (NSArray)descriptors
{
  return self->_descriptors;
}

- (void)setDescriptors:(id)a3
{
}

- (NSMutableSet)SSIDs
{
  return self->_SSIDs;
}

- (void)setSSIDs:(id)a3
{
}

- (NSMutableSet)prefixes
{
  return self->_prefixes;
}

- (void)setPrefixes:(id)a3
{
}

- (BOOL)scanning
{
  return self->_scanning;
}

- (void)setScanning:(BOOL)a3
{
  self->_scanning = a3;
}

- (NSMutableSet)reportedNetworks
{
  return self->_reportedNetworks;
}

- (void)setReportedNetworks:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reportedNetworks, 0);
  objc_storeStrong((id *)&self->_prefixes, 0);
  objc_storeStrong((id *)&self->_SSIDs, 0);
  objc_storeStrong((id *)&self->_descriptors, 0);
  objc_storeStrong((id *)&self->_wifiInterface, 0);

  objc_storeStrong(&self->_resultsHandler, 0);
}

@end