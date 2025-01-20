@interface SRResearchDataPerCategoryViewController
+ (void)initialize;
- (BOOL)sensorReader:(id)a3 fetchingRequest:(id)a4 didFetchResult:(id)a5;
- (NSArray)appBundles;
- (NSArray)writerAppBundles;
- (NSMutableArray)pruners;
- (NSMutableArray)readers;
- (NSMutableArray)tombstones;
- (NSMutableSet)authorizedBundleIds;
- (NSMutableSet)authorizedWriterBundleIds;
- (NSSet)sensorIdentifiers;
- (NSURL)exportedDataURL;
- (OS_dispatch_group)fetchGroup;
- (SRAuthorizationGroup)authGroup;
- (SRAuthorizationStore)authStore;
- (double)end;
- (double)start;
- (id)bundleForIndexPath:(id)a3;
- (id)cancelExportBlock;
- (id)prepareDayCell;
- (id)prepareDeleteCell;
- (id)prepareExportCell;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)datastoreBackend;
- (int64_t)daysFromDate:(id)a3 toDate:(id)a4;
- (int64_t)numberOfDays;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)sb_handle;
- (int64_t)tableSectionFromIndexPathSection:(int64_t)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)authorizationSwitchToggledWithValue:(BOOL)a3 indexPath:(id)a4;
- (void)cancelExport;
- (void)cleanupExportedFile;
- (void)confirmAuthChangeForBundle:(id)a3 value:(BOOL)a4 authService:(id)a5 authorizedBundleIds:(id)a6 setOverride:(BOOL)a7;
- (void)dealloc;
- (void)deleteAllUnreleasedData;
- (void)exportData;
- (void)navigateToAuthorization;
- (void)populateDays;
- (void)presentDownloadPath:(id)a3 sandboxExtensionToken:(id)a4;
- (void)sensorReader:(id)a3 didCompleteFetch:(id)a4;
- (void)sensorReader:(id)a3 fetchingRequest:(id)a4 failedWithError:(id)a5;
- (void)setAppBundles:(id)a3;
- (void)setAuthGroup:(id)a3;
- (void)setAuthStore:(id)a3;
- (void)setAuthorizedBundleIds:(id)a3;
- (void)setAuthorizedWriterBundleIds:(id)a3;
- (void)setCancelExportBlock:(id)a3;
- (void)setDatastoreBackend:(int64_t)a3;
- (void)setEnd:(double)a3;
- (void)setExportedDataURL:(id)a3;
- (void)setFetchGroup:(id)a3;
- (void)setNumberOfDays:(int64_t)a3;
- (void)setPruners:(id)a3;
- (void)setReaders:(id)a3;
- (void)setSb_handle:(int64_t)a3;
- (void)setSensorIdentifiers:(id)a3;
- (void)setStart:(double)a3;
- (void)setTombstones:(id)a3;
- (void)setWriterAppBundles:(id)a3;
- (void)showActionSheet;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation SRResearchDataPerCategoryViewController

+ (void)initialize
{
  if ((id)objc_opt_class() == a1) {
    SRResearchPerDataLog = (uint64_t)os_log_create("com.apple.SensorKit", "SRResearchPerData");
  }
}

- (void)viewDidLoad
{
  uint64_t v92 = *MEMORY[0x263EF8340];
  v84.receiver = self;
  v84.super_class = (Class)SRResearchDataPerCategoryViewController;
  [(SRResearchDataPerCategoryViewController *)&v84 viewDidLoad];
  id v55 = (id)[MEMORY[0x263EFF9C0] set];
  v52 = (void *)[MEMORY[0x263EFF9C0] set];
  obuint64_t j = (id)[(SRAuthorizationStore *)[(SRResearchDataPerCategoryViewController *)self authStore] readerAuthorizationBundleIdValues];
  long long v82 = 0u;
  long long v83 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  uint64_t v48 = [obj countByEnumeratingWithState:&v80 objects:v91 count:16];
  if (v48)
  {
    uint64_t v46 = *(void *)v81;
    do
    {
      uint64_t v2 = 0;
      do
      {
        if (*(void *)v81 != v46)
        {
          uint64_t v3 = v2;
          objc_enumerationMutation(obj);
          uint64_t v2 = v3;
        }
        uint64_t v50 = v2;
        uint64_t v4 = *(void *)(*((void *)&v80 + 1) + 8 * v2);
        uint64_t v5 = objc_msgSend(MEMORY[0x263F086E0], "sk_bundleWithIdentifier:", v4, v46);
        if (v5)
        {
          long long v78 = 0u;
          long long v79 = 0u;
          long long v76 = 0u;
          long long v77 = 0u;
          v6 = (void *)[obj objectForKeyedSubscript:v4];
          uint64_t v7 = [v6 countByEnumeratingWithState:&v76 objects:v90 count:16];
          if (v7)
          {
            uint64_t v8 = *(void *)v77;
            do
            {
              for (uint64_t i = 0; i != v7; ++i)
              {
                if (*(void *)v77 != v8) {
                  objc_enumerationMutation(v6);
                }
                uint64_t v10 = *(void *)(*((void *)&v76 + 1) + 8 * i);
                v11 = (void *)MEMORY[0x230FC8920]();
                if (-[NSString isEqualToString:](-[SRAuthorizationGroup authorizationService](self->_authGroup, "authorizationService"), "isEqualToString:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F176A8], "sensorDescriptionForSensor:", v10), "authorizationService")))
                {
                  [v55 addObject:v5];
                  if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(obj, "objectForKeyedSubscript:", v4), "objectForKeyedSubscript:", v10), "BOOLValue"))objc_msgSend(v52, "addObject:", v4); {
                }
                  }
              }
              uint64_t v7 = [v6 countByEnumeratingWithState:&v76 objects:v90 count:16];
            }
            while (v7);
          }
        }
        uint64_t v2 = v50 + 1;
      }
      while (v50 + 1 != v48);
      uint64_t v48 = [obj countByEnumeratingWithState:&v80 objects:v91 count:16];
    }
    while (v48);
  }
  -[SRResearchDataPerCategoryViewController setAuthorizedBundleIds:](self, "setAuthorizedBundleIds:", [MEMORY[0x263EFF9C0] setWithSet:v52]);
  -[SRResearchDataPerCategoryViewController setAppBundles:](self, "setAppBundles:", objc_msgSend((id)objc_msgSend(v55, "allObjects"), "sortedArrayUsingComparator:", &__block_literal_global_2));
  [v55 removeAllObjects];
  [v52 removeAllObjects];
  id obja = (id)[(SRAuthorizationStore *)[(SRResearchDataPerCategoryViewController *)self authStore] writerAuthorizationValues];
  long long v74 = 0u;
  long long v75 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  uint64_t v49 = [obja countByEnumeratingWithState:&v72 objects:v89 count:16];
  if (v49)
  {
    uint64_t v47 = *(void *)v73;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v73 != v47)
        {
          uint64_t v13 = v12;
          objc_enumerationMutation(obja);
          uint64_t v12 = v13;
        }
        uint64_t v51 = v12;
        uint64_t v14 = *(void *)(*((void *)&v72 + 1) + 8 * v12);
        uint64_t v15 = objc_msgSend(MEMORY[0x263F086E0], "sk_bundleWithIdentifier:", v14, v47);
        if (v15)
        {
          long long v70 = 0u;
          long long v71 = 0u;
          long long v68 = 0u;
          long long v69 = 0u;
          v16 = (void *)[obja objectForKeyedSubscript:v14];
          uint64_t v17 = [v16 countByEnumeratingWithState:&v68 objects:v88 count:16];
          if (v17)
          {
            uint64_t v18 = *(void *)v69;
            do
            {
              for (uint64_t j = 0; j != v17; ++j)
              {
                if (*(void *)v69 != v18) {
                  objc_enumerationMutation(v16);
                }
                uint64_t v20 = *(void *)(*((void *)&v68 + 1) + 8 * j);
                v21 = (void *)MEMORY[0x230FC8920]();
                if (-[NSString isEqualToString:](-[SRAuthorizationGroup authorizationService](self->_authGroup, "authorizationService"), "isEqualToString:", -[SRAuthorizationGroup authorizationService](+[SRAuthorizationGroup authorizationGroupWithServiceName:](SRAuthorizationGroup, "authorizationGroupWithServiceName:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F176A8], "sensorDescriptionForSensor:", v20), "writerAuthorizationService")), "authorizationService")))
                {
                  [v55 addObject:v15];
                  if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(obja, "objectForKeyedSubscript:", v14), "objectForKeyedSubscript:", v20), "BOOLValue"))objc_msgSend(v52, "addObject:", v14); {
                }
                  }
              }
              uint64_t v17 = [v16 countByEnumeratingWithState:&v68 objects:v88 count:16];
            }
            while (v17);
          }
        }
        uint64_t v12 = v51 + 1;
      }
      while (v51 + 1 != v49);
      uint64_t v49 = [obja countByEnumeratingWithState:&v72 objects:v89 count:16];
    }
    while (v49);
  }
  -[SRResearchDataPerCategoryViewController setWriterAppBundles:](self, "setWriterAppBundles:", objc_msgSend((id)objc_msgSend(v55, "allObjects"), "sortedArrayUsingComparator:", &__block_literal_global_8));
  -[SRResearchDataPerCategoryViewController setAuthorizedWriterBundleIds:](self, "setAuthorizedWriterBundleIds:", [MEMORY[0x263EFF9C0] setWithSet:v52]);
  [(SRResearchDataPerCategoryViewController *)self setNumberOfDays:0];
  v22 = objc_msgSend(MEMORY[0x263F176A8], "sensorDescriptionsForAuthorizationService:", -[SRAuthorizationGroup authorizationService](self->_authGroup, "authorizationService"));
  id v23 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  long long v66 = 0u;
  long long v67 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  uint64_t v24 = [v22 countByEnumeratingWithState:&v64 objects:v87 count:16];
  if (v24)
  {
    uint64_t v25 = *(void *)v65;
    do
    {
      for (uint64_t k = 0; k != v24; ++k)
      {
        if (*(void *)v65 != v25) {
          objc_enumerationMutation(v22);
        }
        objc_msgSend(v23, "addObject:", objc_msgSend(*(id *)(*((void *)&v64 + 1) + 8 * k), "name"));
      }
      uint64_t v24 = [v22 countByEnumeratingWithState:&v64 objects:v87 count:16];
    }
    while (v24);
  }
  [(SRResearchDataPerCategoryViewController *)self setSensorIdentifiers:v23];

  v27 = objc_msgSend(MEMORY[0x263F176A8], "sensorDescriptionForSensor:", -[NSSet anyObject](-[SRResearchDataPerCategoryViewController sensorIdentifiers](self, "sensorIdentifiers"), "anyObject"));
  if (!v27)
  {
    v28 = SRResearchPerDataLog;
    if (os_log_type_enabled((os_log_t)SRResearchPerDataLog, OS_LOG_TYPE_FAULT))
    {
      id v45 = [(NSSet *)[(SRResearchDataPerCategoryViewController *)self sensorIdentifiers] anyObject];
      LODWORD(location[0]) = 138543362;
      *(id *)((char *)location + 4) = v45;
      _os_log_fault_impl(&dword_230B11000, v28, OS_LOG_TYPE_FAULT, "Failed to find sensor description for %{public}@", (uint8_t *)location, 0xCu);
    }
  }
  -[SRResearchDataPerCategoryViewController setDatastoreBackend:](self, "setDatastoreBackend:", [v27 datastoreBackend]);
  if (![(SRResearchDataPerCategoryViewController *)self datastoreBackend])
  {
    v29 = objc_msgSend(objc_alloc(MEMORY[0x263F176B8]), "initWithSensor:", -[NSSet anyObject](-[SRResearchDataPerCategoryViewController sensorIdentifiers](self, "sensorIdentifiers"), "anyObject"));
    [v29 serviceStartTime];
    -[SRResearchDataPerCategoryViewController setStart:](self, "setStart:");

    [(SRResearchDataPerCategoryViewController *)self start];
    if (v30 != 0.0)
    {
      -[SRResearchDataPerCategoryViewController setTombstones:](self, "setTombstones:", [MEMORY[0x263EFF980] array]);
      [(SRResearchDataPerCategoryViewController *)self setEnd:SRAbsoluteTimeGetCurrent()];
      v31 = dispatch_group_create();
      [(SRResearchDataPerCategoryViewController *)self setFetchGroup:v31];
      dispatch_release(v31);
      -[SRResearchDataPerCategoryViewController setReaders:](self, "setReaders:", [MEMORY[0x263EFF980] array]);
      -[SRResearchDataPerCategoryViewController setPruners:](self, "setPruners:", [MEMORY[0x263EFF980] array]);
      long long v62 = 0u;
      long long v63 = 0u;
      long long v60 = 0u;
      long long v61 = 0u;
      v56 = [(SRResearchDataPerCategoryViewController *)self sensorIdentifiers];
      uint64_t v32 = [(NSSet *)v56 countByEnumeratingWithState:&v60 objects:v85 count:16];
      if (v32)
      {
        uint64_t v33 = *(void *)v61;
        do
        {
          for (uint64_t m = 0; m != v32; ++m)
          {
            if (*(void *)v61 != v33) {
              objc_enumerationMutation(v56);
            }
            v35 = *(void **)(*((void *)&v60 + 1) + 8 * m);
            v36 = (void *)[objc_alloc(MEMORY[0x263F176B8]) initWithSensor:v35];
            [v36 earliestEligibleTime];
            double v38 = v37;
            [(SRResearchDataPerCategoryViewController *)self end];
            [(SRResearchDataPerCategoryViewController *)self setEnd:fmin(v38, v39)];

            v40 = objc_msgSend(objc_alloc(MEMORY[0x263F176B8]), "initWithSensor:", objc_msgSend(v35, "sr_sensorForDeletionRecordsFromSensor"));
            [v40 setDelegate:self];
            [(NSMutableArray *)[(SRResearchDataPerCategoryViewController *)self readers] addObject:v40];
            dispatch_group_enter((dispatch_group_t)[(SRResearchDataPerCategoryViewController *)self fetchGroup]);
            id v41 = objc_alloc_init(MEMORY[0x263F176A0]);
            [v41 setFrom:0.0];
            [v41 setTo:INFINITY];
            objc_msgSend(v41, "setDevice:", objc_msgSend(MEMORY[0x263F17698], "currentDevice"));
            [v40 fetch:v41];

            id v42 = objc_alloc(MEMORY[0x263F176B0]);
            v43 = objc_msgSend(v42, "initWithSensor:device:", v35, objc_msgSend(MEMORY[0x263F17698], "currentDevice"));
            [v43 setDelegate:self];
            [(NSMutableArray *)[(SRResearchDataPerCategoryViewController *)self pruners] addObject:v43];
          }
          uint64_t v32 = [(NSSet *)v56 countByEnumeratingWithState:&v60 objects:v85 count:16];
        }
        while (v32);
      }
      objc_initWeak(location, self);
      v44 = [(SRResearchDataPerCategoryViewController *)self fetchGroup];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __54__SRResearchDataPerCategoryViewController_viewDidLoad__block_invoke_14;
      block[3] = &unk_264BA2FC8;
      objc_copyWeak(&v59, location);
      dispatch_group_notify((dispatch_group_t)v44, MEMORY[0x263EF83A0], block);
      objc_destroyWeak(&v59);
      objc_destroyWeak(location);
    }
  }
}

uint64_t __54__SRResearchDataPerCategoryViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = objc_msgSend(a2, "sk_appName");
  uint64_t v5 = objc_msgSend(a3, "sk_appName");
  return [v4 compare:v5];
}

uint64_t __54__SRResearchDataPerCategoryViewController_viewDidLoad__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = objc_msgSend(a2, "sk_appName");
  uint64_t v5 = objc_msgSend(a3, "sk_appName");
  return [v4 compare:v5];
}

uint64_t __54__SRResearchDataPerCategoryViewController_viewDidLoad__block_invoke_14(uint64_t a1)
{
  Weauint64_t k = objc_loadWeak((id *)(a1 + 32));
  return [Weak populateDays];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = (void *)MEMORY[0x263F1C6D0];
  authGroup = self->_authGroup;
  objc_msgSend((id)-[SRResearchDataPerCategoryViewController tableView](self, "tableView"), "frame");
  objc_msgSend((id)-[SRResearchDataPerCategoryViewController tableView](self, "tableView"), "setTableHeaderView:", objc_msgSend(v5, "skui_imageViewForAuthGroup:parentSize:", authGroup, v7, v8));
  [(SRResearchDataPerCategoryViewController *)self setSb_handle:-1];
  v9.receiver = self;
  v9.super_class = (Class)SRResearchDataPerCategoryViewController;
  [(SRResearchDataPerCategoryViewController *)&v9 viewWillAppear:v3];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  [(SRResearchDataPerCategoryViewController *)self setFetchGroup:0];
  [(SRResearchDataPerCategoryViewController *)self cleanupExportedFile];
  v5.receiver = self;
  v5.super_class = (Class)SRResearchDataPerCategoryViewController;
  [(SRResearchDataPerCategoryViewController *)&v5 viewWillDisappear:v3];
}

- (void)dealloc
{
  [(SRResearchDataPerCategoryViewController *)self setAuthorizedBundleIds:0];
  [(SRResearchDataPerCategoryViewController *)self setAuthorizedWriterBundleIds:0];
  [(SRResearchDataPerCategoryViewController *)self setAppBundles:0];
  [(SRResearchDataPerCategoryViewController *)self setWriterAppBundles:0];
  [(SRResearchDataPerCategoryViewController *)self setAuthGroup:0];
  [(SRResearchDataPerCategoryViewController *)self setReaders:0];
  [(SRResearchDataPerCategoryViewController *)self setPruners:0];
  [(SRResearchDataPerCategoryViewController *)self setSensorIdentifiers:0];
  [(SRResearchDataPerCategoryViewController *)self setTombstones:0];
  [(SRResearchDataPerCategoryViewController *)self setCancelExportBlock:0];
  [(SRResearchDataPerCategoryViewController *)self setAuthStore:0];
  [(SRResearchDataPerCategoryViewController *)self setFetchGroup:0];
  [(SRResearchDataPerCategoryViewController *)self setExportedDataURL:0];
  v3.receiver = self;
  v3.super_class = (Class)SRResearchDataPerCategoryViewController;
  [(SRResearchDataPerCategoryViewController *)&v3 dealloc];
}

- (int64_t)tableSectionFromIndexPathSection:(int64_t)a3
{
  int64_t v3 = a3;
  if ((unint64_t)(a3 - 2) >= 4)
  {
    if (a3 != 1) {
      return v3;
    }
    BOOL v8 = [(NSArray *)[(SRResearchDataPerCategoryViewController *)self appBundles] count] == 0;
    int64_t v7 = 1;
  }
  else
  {
    NSUInteger v5 = [(NSArray *)[(SRResearchDataPerCategoryViewController *)self appBundles] count];
    NSUInteger v6 = [(NSArray *)[(SRResearchDataPerCategoryViewController *)self writerAppBundles] count];
    if (v5) {
      int64_t v7 = v3;
    }
    else {
      int64_t v7 = v3 + 1;
    }
    BOOL v8 = v6 == 0;
  }
  if (v8) {
    return v7 + 1;
  }
  else {
    return v7;
  }
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  if ([(NSArray *)[(SRResearchDataPerCategoryViewController *)self writerAppBundles] count])
  {
    uint64_t v4 = 6;
  }
  else
  {
    uint64_t v4 = 5;
  }
  uint64_t v5 = (__PAIR128__(v4, [(NSArray *)[(SRResearchDataPerCategoryViewController *)self appBundles] count])- 1) >> 64;
  return v5 - ([(SRResearchDataPerCategoryViewController *)self datastoreBackend] == 1);
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  [(SRResearchDataPerCategoryViewController *)self tableSectionFromIndexPathSection:a4];
  uint64_t v5 = [(SRResearchDataPerCategoryViewController *)self writerAppBundles];
  return [(NSArray *)v5 count];
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  int64_t v4 = [(SRResearchDataPerCategoryViewController *)self tableSectionFromIndexPathSection:a4];
  if ((unint64_t)(v4 - 1) > 2) {
    return 0;
  }
  uint64_t v5 = qword_230B1FB10[v4 - 1];
  NSUInteger v6 = NSString;
  return (id)objc_msgSend(v6, "srui_localizedStringForCode:", v5);
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  NSUInteger v6 = 0;
  switch([(SRResearchDataPerCategoryViewController *)self tableSectionFromIndexPathSection:a4])
  {
    case 0:
    case 6:
      return v6;
    case 1:
      if ([(SRResearchDataPerCategoryViewController *)self tableView:a3 numberOfRowsInSection:1])
      {
        uint64_t v7 = 13;
      }
      else
      {
        uint64_t v7 = 14;
      }
      goto LABEL_20;
    case 2:
      uint64_t v8 = objc_msgSend(NSString, "srui_localizedStringForCode:", 15);
      uint64_t v14 = 0;
      NSUInteger v6 = (void *)[NSString stringWithValidatedFormat:v8, @"%@", &v14, -[SRAuthorizationGroup localizedDisplayName](self->_authGroup, "localizedDisplayName") validFormatSpecifiers error];
      if (!v6)
      {
        objc_super v9 = SRResearchPerDataLog;
        if (os_log_type_enabled((os_log_t)SRResearchPerDataLog, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138543362;
          uint64_t v16 = v14;
          _os_log_fault_impl(&dword_230B11000, v9, OS_LOG_TYPE_FAULT, "Failed to localize string because %{public}@", buf, 0xCu);
        }
      }
      return v6;
    case 3:
      int64_t v11 = [(SRResearchDataPerCategoryViewController *)self datastoreBackend];
      if (v11 == 1) {
        uint64_t v7 = 92;
      }
      else {
        uint64_t v7 = 16 * (v11 == 0);
      }
      goto LABEL_20;
    case 4:
      if (-[NSString isEqualToString:](-[SRAuthorizationGroup authorizationService](-[SRResearchDataPerCategoryViewController authGroup](self, "authGroup"), "authorizationService"), "isEqualToString:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F176A8], "sensorDescriptionForSensor:", *MEMORY[0x263F176E0]), "authorizationService")))
      {
        uint64_t v12 = 91;
      }
      else
      {
        uint64_t v12 = 17;
      }
      if ([(SRResearchDataPerCategoryViewController *)self datastoreBackend] == 1) {
        uint64_t v7 = 93;
      }
      else {
        uint64_t v7 = v12;
      }
      goto LABEL_20;
    case 5:
      uint64_t v7 = 18;
      goto LABEL_20;
    default:
      uint64_t v7 = 0;
LABEL_20:
      uint64_t v13 = NSString;
      return (id)objc_msgSend(v13, "srui_localizedStringForCode:", v7);
  }
}

- (id)bundleForIndexPath:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  unint64_t v5 = -[SRResearchDataPerCategoryViewController tableSectionFromIndexPathSection:](self, "tableSectionFromIndexPathSection:", [a3 section]);
  if (v5 - 3 < 4) {
    return 0;
  }
  if (v5 >= 2)
  {
    if (v5 != 2)
    {
      uint64_t v7 = 0;
      goto LABEL_8;
    }
    NSUInteger v6 = [(SRResearchDataPerCategoryViewController *)self writerAppBundles];
  }
  else
  {
    NSUInteger v6 = [(SRResearchDataPerCategoryViewController *)self appBundles];
  }
  uint64_t v7 = v6;
LABEL_8:
  unint64_t v8 = [a3 row];
  if ([(NSArray *)v7 count] <= v8)
  {
    uint64_t v10 = SRResearchPerDataLog;
    if (os_log_type_enabled((os_log_t)SRResearchPerDataLog, OS_LOG_TYPE_FAULT))
    {
      int64_t v11 = [(SRAuthorizationGroup *)self->_authGroup localizedDisplayName];
      int v12 = 138543874;
      uint64_t v13 = v11;
      __int16 v14 = 2048;
      uint64_t v15 = [(NSArray *)v7 count];
      __int16 v16 = 2048;
      unint64_t v17 = v8 + 1;
      _os_log_fault_impl(&dword_230B11000, v10, OS_LOG_TYPE_FAULT, "Not enough bundle IDs found for category %{public}@. Have %lu, expecting %lu", (uint8_t *)&v12, 0x20u);
    }
    return 0;
  }
  return [(NSArray *)v7 objectAtIndexedSubscript:v8];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v7 = [a4 row];
  switch(-[SRResearchDataPerCategoryViewController tableSectionFromIndexPathSection:](self, "tableSectionFromIndexPathSection:", [a4 section]))
  {
    case 0:
      if (v7 == 1)
      {
        uint64_t v24 = (void *)MEMORY[0x263F1CA48];
        return (id)objc_msgSend(v24, "skui_tableViewCellForDataSample:", a3);
      }
      else
      {
        if (v7) {
          goto LABEL_15;
        }
        uint64_t v8 = *MEMORY[0x263F1D260];
        uint64_t v9 = [MEMORY[0x263F1C660] preferredFontDescriptorWithTextStyle:*MEMORY[0x263F1D260] addingSymbolicTraits:2 options:2];
        uint64_t v10 = [MEMORY[0x263F1C658] fontWithDescriptor:v9 size:0.0];
        uint64_t v11 = [MEMORY[0x263F1C658] preferredFontForTextStyle:v8];
        id v12 = +[SRAuthorizationCategoryDetailCell categoryDetailCellForAuthGroup:bundle:titleFont:bodyFont:textColor:OBKStyle:](SRAuthorizationCategoryDetailCell, "categoryDetailCellForAuthGroup:bundle:titleFont:bodyFont:textColor:OBKStyle:", self->_authGroup, 0, v10, v11, [MEMORY[0x263F1C550] labelColor], 0);
        [a3 separatorInset];
        objc_msgSend((id)objc_msgSend(v12, "contentView"), "setLayoutMargins:", 18.0, v13, 16.0, v14);
        return v12;
      }
    case 1:
      id v21 = [(SRResearchDataPerCategoryViewController *)self bundleForIndexPath:a4];
      if (!v21) {
        goto LABEL_15;
      }
      unint64_t v17 = v21;
      uint64_t v18 = objc_msgSend(v21, "sk_appName");
      v19 = NSNumber;
      uint64_t v20 = [(SRResearchDataPerCategoryViewController *)self authorizedBundleIds];
      goto LABEL_12;
    case 2:
      id v16 = [(SRResearchDataPerCategoryViewController *)self bundleForIndexPath:a4];
      if (!v16) {
        goto LABEL_15;
      }
      unint64_t v17 = v16;
      uint64_t v18 = objc_msgSend(v16, "sk_appName");
      v19 = NSNumber;
      uint64_t v20 = [(SRResearchDataPerCategoryViewController *)self authorizedWriterBundleIds];
LABEL_12:
      uint64_t v22 = objc_msgSend(v19, "numberWithBool:", -[NSMutableSet containsObject:](v20, "containsObject:", objc_msgSend(v17, "bundleIdentifier")));
      id result = +[SRAuthorizationCell authorizationCellForIndexPath:a4 title:v18 state:v22 delegate:self tableView:a3];
      break;
    case 3:
      return [(SRResearchDataPerCategoryViewController *)self prepareDeleteCell];
    case 4:
      return [(SRResearchDataPerCategoryViewController *)self prepareExportCell];
    case 5:
      return [(SRResearchDataPerCategoryViewController *)self prepareDayCell];
    default:
LABEL_15:
      id v23 = objc_opt_new();
      id result = v23;
      break;
  }
  return result;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  switch(-[SRResearchDataPerCategoryViewController tableSectionFromIndexPathSection:](self, "tableSectionFromIndexPathSection:", [a4 section]))
  {
    case 0:
      if ([a4 row] == 1)
      {
        id v7 = +[SRSampleViewController sampleViewControllerForAuthGroup:self->_authGroup];
        goto LABEL_9;
      }
      break;
    case 3:
      int64_t v8 = [(SRResearchDataPerCategoryViewController *)self datastoreBackend];
      if (v8 == 1)
      {
        [(SRResearchDataPerCategoryViewController *)self navigateToAuthorization];
      }
      else if (!v8)
      {
        [(SRResearchDataPerCategoryViewController *)self showActionSheet];
      }
      break;
    case 4:
      [(SRResearchDataPerCategoryViewController *)self exportData];
      break;
    case 5:
      id v7 = (id)objc_opt_new();
      objc_msgSend(v7, "setNumberOfDays:", -[SRResearchDataPerCategoryViewController numberOfDays](self, "numberOfDays"));
      [(SRResearchDataPerCategoryViewController *)self end];
      objc_msgSend(v7, "setEnd:");
      objc_msgSend(v7, "setTombstones:", -[SRResearchDataPerCategoryViewController tombstones](self, "tombstones"));
LABEL_9:
      objc_msgSend((id)-[SRResearchDataPerCategoryViewController navigationController](self, "navigationController"), "pushViewController:animated:", v7, 1);
      break;
    default:
      break;
  }
  [a3 deselectRowAtIndexPath:a4 animated:1];
}

- (id)prepareDayCell
{
  int64_t v3 = (SRDetailedTableCell *)objc_msgSend((id)-[SRResearchDataPerCategoryViewController tableView](self, "tableView"), "dequeueReusableCellWithIdentifier:", @"SRDataDayRowReuseIdentifier");
  if (!v3) {
    int64_t v3 = [[SRDetailedTableCell alloc] initWithStyle:1 reuseIdentifier:@"SRDataDayRowReuseIdentifier"];
  }
  BOOL v4 = [(SRResearchDataPerCategoryViewController *)self numberOfDays] > 0;
  [(SRDetailedTableCell *)v3 setAccessoryType:v4];
  [(SRDetailedTableCell *)v3 setUserInteractionEnabled:v4];
  -[UILabel setText:](-[SRDetailedTableCell titleLabel](v3, "titleLabel"), "setText:", objc_msgSend(NSString, "srui_localizedStringForCode:", 19));
  if (([(SRResearchDataPerCategoryViewController *)self numberOfDays] & 0x8000000000000000) == 0)
  {
    unint64_t v5 = objc_opt_new();
    objc_msgSend(v5, "setDay:", -[SRResearchDataPerCategoryViewController numberOfDays](self, "numberOfDays"));
    -[UILabel setText:](-[SRDetailedTableCell detailLabel](v3, "detailLabel"), "setText:", [MEMORY[0x263F08780] localizedStringFromDateComponents:v5 unitsStyle:3]);
  }
  return v3;
}

- (id)prepareDeleteCell
{
  id v3 = (id)objc_msgSend((id)-[SRResearchDataPerCategoryViewController tableView](self, "tableView"), "dequeueReusableCellWithIdentifier:", @"SRDataDeleteRowReuseIdentifier");
  if (!v3) {
    id v3 = (id)[objc_alloc(MEMORY[0x263F1CA48]) initWithStyle:0 reuseIdentifier:@"SRDataDeleteRowReuseIdentifier"];
  }
  int64_t v4 = [(SRResearchDataPerCategoryViewController *)self datastoreBackend];
  if (v4 == 1)
  {
    uint64_t v5 = [MEMORY[0x263F1C550] systemBlueColor];
    uint64_t v6 = 95;
    goto LABEL_7;
  }
  if (!v4)
  {
    uint64_t v5 = [MEMORY[0x263F1C550] redColor];
    uint64_t v6 = 20;
LABEL_7:
    objc_msgSend((id)objc_msgSend(v3, "textLabel"), "setTextColor:", v5);
    objc_msgSend((id)objc_msgSend(v3, "textLabel"), "setText:", objc_msgSend(NSString, "srui_localizedStringForCode:", v6));
  }
  objc_msgSend((id)objc_msgSend(v3, "textLabel"), "setLineBreakMode:", 0);
  objc_msgSend((id)objc_msgSend(v3, "textLabel"), "setNumberOfLines:", 0);
  return v3;
}

- (id)prepareExportCell
{
  id v2 = (id)objc_msgSend((id)-[SRResearchDataPerCategoryViewController tableView](self, "tableView"), "dequeueReusableCellWithIdentifier:", @"SRDataExportRowReuseIdentifier");
  if (!v2)
  {
    id v2 = (id)[objc_alloc(MEMORY[0x263F1CA48]) initWithStyle:0 reuseIdentifier:@"SRDataExportRowReuseIdentifier"];
    objc_msgSend((id)objc_msgSend(v2, "textLabel"), "setTextColor:", objc_msgSend(MEMORY[0x263F1C550], "systemBlueColor"));
  }
  objc_msgSend((id)objc_msgSend(v2, "textLabel"), "setText:", objc_msgSend(NSString, "srui_localizedStringForCode:", 21));
  objc_msgSend((id)objc_msgSend(v2, "textLabel"), "setLineBreakMode:", 0);
  objc_msgSend((id)objc_msgSend(v2, "textLabel"), "setNumberOfLines:", 0);
  return v2;
}

- (void)authorizationSwitchToggledWithValue:(BOOL)a3 indexPath:(id)a4
{
  BOOL v5 = a3;
  id v7 = [(SRResearchDataPerCategoryViewController *)self bundleForIndexPath:a4];
  if (v7 && self->_authGroup)
  {
    id v8 = v7;
    int64_t v9 = -[SRResearchDataPerCategoryViewController tableSectionFromIndexPathSection:](self, "tableSectionFromIndexPathSection:", [a4 section]);
    int64_t v10 = v9;
    if (v9 == 1)
    {
      uint64_t v11 = [(SRAuthorizationGroup *)self->_authGroup authorizationService];
      id v12 = [(SRResearchDataPerCategoryViewController *)self authorizedBundleIds];
    }
    else
    {
      if (v9 != 2) {
        return;
      }
      uint64_t v11 = [(SRAuthorizationGroup *)self->_authGroup writerAuthorizationService];
      id v12 = [(SRResearchDataPerCategoryViewController *)self authorizedWriterBundleIds];
    }
    double v13 = v12;
    if (v5) {
      goto LABEL_10;
    }
    double v14 = (void *)MEMORY[0x263F1C3F8];
    authGroup = self->_authGroup;
    uint64_t v16 = [(SRResearchDataPerCategoryViewController *)self tableView];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __89__SRResearchDataPerCategoryViewController_authorizationSwitchToggledWithValue_indexPath___block_invoke;
    v18[3] = &unk_264BA2FF0;
    v18[4] = self;
    v18[5] = v8;
    BOOL v19 = v5;
    v18[6] = v11;
    v18[7] = v13;
    BOOL v20 = v10 == 1;
    uint64_t v17 = objc_msgSend(v14, "skui_alertControllerForRequiredAuthorizationIfNeccesaryForBundle:authGroup:tableView:indexPath:destructiveHandler:", v8, authGroup, v16, a4, v18);
    if (!v17) {
LABEL_10:
    }
      [(SRResearchDataPerCategoryViewController *)self confirmAuthChangeForBundle:v8 value:v5 authService:v11 authorizedBundleIds:v13 setOverride:v10 == 1];
    else {
      [(SRResearchDataPerCategoryViewController *)self presentViewController:v17 animated:1 completion:0];
    }
  }
}

uint64_t __89__SRResearchDataPerCategoryViewController_authorizationSwitchToggledWithValue_indexPath___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) confirmAuthChangeForBundle:*(void *)(a1 + 40) value:*(unsigned __int8 *)(a1 + 64) authService:*(void *)(a1 + 48) authorizedBundleIds:*(void *)(a1 + 56) setOverride:*(unsigned __int8 *)(a1 + 65)];
}

- (void)confirmAuthChangeForBundle:(id)a3 value:(BOOL)a4 authService:(id)a5 authorizedBundleIds:(id)a6 setOverride:(BOOL)a7
{
  BOOL v8 = a4;
  if (-[SRAuthorizationStore setAuthorizationForBundleId:service:value:setOverride:](-[SRResearchDataPerCategoryViewController authStore](self, "authStore"), "setAuthorizationForBundleId:service:value:setOverride:", [a3 bundleIdentifier], a5, a4, a7))
  {
    uint64_t v10 = [a3 bundleIdentifier];
    if (v8)
    {
      [a6 addObject:v10];
    }
    else
    {
      [a6 removeObject:v10];
    }
  }
}

- (BOOL)sensorReader:(id)a3 fetchingRequest:(id)a4 didFetchResult:(id)a5
{
  if (objc_opt_isKindOfClass()) {
    -[NSMutableArray addObject:](self->_tombstones, "addObject:", [a5 sample]);
  }
  return 1;
}

- (void)sensorReader:(id)a3 didCompleteFetch:(id)a4
{
  if ([(SRResearchDataPerCategoryViewController *)self fetchGroup])
  {
    BOOL v5 = [(SRResearchDataPerCategoryViewController *)self fetchGroup];
    dispatch_group_leave((dispatch_group_t)v5);
  }
}

- (void)sensorReader:(id)a3 fetchingRequest:(id)a4 failedWithError:(id)a5
{
  if ([(SRResearchDataPerCategoryViewController *)self fetchGroup])
  {
    uint64_t v6 = [(SRResearchDataPerCategoryViewController *)self fetchGroup];
    dispatch_group_leave((dispatch_group_t)v6);
  }
}

- (void)populateDays
{
  v11[1] = *MEMORY[0x263EF8340];
  [(SRResearchDataPerCategoryViewController *)self start];
  double v4 = v3;
  [(SRResearchDataPerCategoryViewController *)self end];
  if (v4 < v5)
  {
    uint64_t v6 = (void *)MEMORY[0x263EFF910];
    [(SRResearchDataPerCategoryViewController *)self start];
    uint64_t v7 = objc_msgSend(v6, "dateWithSRAbsoluteTime:");
    BOOL v8 = (void *)MEMORY[0x263EFF910];
    [(SRResearchDataPerCategoryViewController *)self end];
    -[SRResearchDataPerCategoryViewController setNumberOfDays:](self, "setNumberOfDays:", -[SRResearchDataPerCategoryViewController daysFromDate:toDate:](self, "daysFromDate:toDate:", v7, objc_msgSend(v8, "dateWithSRAbsoluteTime:")));
    objc_msgSend((id)-[SRResearchDataPerCategoryViewController tableView](self, "tableView"), "beginUpdates");
    int64_t v9 = [(SRResearchDataPerCategoryViewController *)self numberOfSectionsInTableView:[(SRResearchDataPerCategoryViewController *)self tableView]]- 1;
    uint64_t v10 = (void *)[(SRResearchDataPerCategoryViewController *)self tableView];
    v11[0] = [MEMORY[0x263F088C8] indexPathForRow:0 inSection:v9];
    objc_msgSend(v10, "reloadRowsAtIndexPaths:withRowAnimation:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v11, 1), 100);
    objc_msgSend((id)-[SRResearchDataPerCategoryViewController tableView](self, "tableView"), "endUpdates");
  }
}

- (int64_t)daysFromDate:(id)a3 toDate:(id)a4
{
  uint64_t v8 = 0;
  uint64_t v9 = 0;
  uint64_t v6 = (void *)[MEMORY[0x263EFF8F0] currentCalendar];
  [v6 rangeOfUnit:16 startDate:&v9 interval:0 forDate:a3];
  [v6 rangeOfUnit:16 startDate:&v8 interval:0 forDate:a4];
  return objc_msgSend((id)objc_msgSend(v6, "components:fromDate:toDate:options:", 16, v9, v8, 0), "day") + 1;
}

- (void)showActionSheet
{
  objc_initWeak(&location, self);
  double v3 = objc_msgSend(MEMORY[0x263F1C3F8], "alertControllerWithTitle:message:preferredStyle:", objc_msgSend(NSString, "srui_localizedStringForCode:", 23), 0, 0);
  double v4 = (void *)MEMORY[0x263F1C3F0];
  uint64_t v5 = objc_msgSend(NSString, "srui_localizedStringForCode:", 25);
  uint64_t v7 = MEMORY[0x263EF8330];
  uint64_t v8 = 3221225472;
  uint64_t v9 = __58__SRResearchDataPerCategoryViewController_showActionSheet__block_invoke;
  uint64_t v10 = &unk_264BA3018;
  objc_copyWeak(&v11, &location);
  uint64_t v6 = [v4 actionWithTitle:v5 style:2 handler:&v7];
  objc_msgSend(v3, "addAction:", v6, v7, v8, v9, v10);
  objc_msgSend(v3, "addAction:", objc_msgSend(MEMORY[0x263F1C3F0], "actionWithTitle:style:handler:", objc_msgSend(NSString, "srui_localizedStringForCode:", 26), 1, 0));
  [(SRResearchDataPerCategoryViewController *)self presentViewController:v3 animated:1 completion:0];
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

uint64_t __58__SRResearchDataPerCategoryViewController_showActionSheet__block_invoke(uint64_t a1)
{
  Weauint64_t k = objc_loadWeak((id *)(a1 + 32));
  return [Weak deleteAllUnreleasedData];
}

- (void)exportData
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  double v3 = SRResearchPerDataLog;
  if (os_log_type_enabled((os_log_t)SRResearchPerDataLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_230B11000, v3, OS_LOG_TYPE_DEFAULT, "Export data", buf, 2u);
  }
  objc_initWeak(&location, self);
  *(void *)buf = 0;
  double v30 = buf;
  uint64_t v31 = 0x2020000000;
  char v32 = 0;
  double v4 = (void *)MEMORY[0x263F1C3F8];
  uint64_t v5 = objc_msgSend(NSString, "srui_localizedStringForCode:", 27);
  uint64_t v6 = objc_msgSend(v4, "alertControllerWithTitle:message:preferredStyle:", v5, objc_msgSend(NSString, "srui_localizedStringForCode:", 28), 1);
  uint64_t v7 = (void *)MEMORY[0x263F1C3F0];
  uint64_t v8 = objc_msgSend(NSString, "srui_localizedStringForCode:", 26);
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __53__SRResearchDataPerCategoryViewController_exportData__block_invoke;
  v27[3] = &unk_264BA3040;
  v27[4] = buf;
  objc_copyWeak(&v28, &location);
  objc_msgSend(v6, "addAction:", objc_msgSend(v7, "actionWithTitle:style:handler:", v8, 1, v27));
  [(SRResearchDataPerCategoryViewController *)self presentViewController:v6 animated:1 completion:0];
  uint64_t v9 = objc_msgSend(MEMORY[0x263F176A8], "sensorDescriptionsForAuthorizationService:", -[SRAuthorizationGroup authorizationService](self->_authGroup, "authorizationService"));
  uint64_t v10 = objc_msgSend(MEMORY[0x263EFF9C0], "setWithCapacity:", objc_msgSend(v9, "count"));
  uint64_t v18 = v6;
  BOOL v19 = self;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v11 = [v9 countByEnumeratingWithState:&v23 objects:v36 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v24 != v12) {
          objc_enumerationMutation(v9);
        }
        double v14 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        if ([v14 name])
        {
          objc_msgSend(v10, "addObject:", objc_msgSend(v14, "name"));
        }
        else
        {
          uint64_t v15 = SRResearchPerDataLog;
          if (os_log_type_enabled((os_log_t)SRResearchPerDataLog, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)v34 = 138543362;
            v35 = v14;
            _os_log_fault_impl(&dword_230B11000, v15, OS_LOG_TYPE_FAULT, "Trying to export a data stream without a name. %{public}@", v34, 0xCu);
          }
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v23 objects:v36 count:16];
    }
    while (v11);
  }
  if ([v10 count])
  {
    objc_initWeak((id *)v34, v19);
    uint64_t v16 = (void *)MEMORY[0x263F176B8];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __53__SRResearchDataPerCategoryViewController_exportData__block_invoke_54;
    v20[3] = &unk_264BA30B8;
    objc_copyWeak(&v21, (id *)v34);
    objc_copyWeak(&v22, &location);
    v20[4] = v18;
    v20[5] = buf;
    v19->_cancelExportBlocuint64_t k = (id)[v16 createExportDataForServices:v10 withCompletionHandler:v20];
    objc_destroyWeak(&v22);
    objc_destroyWeak(&v21);
    objc_destroyWeak((id *)v34);
  }
  else
  {
    uint64_t v17 = SRResearchPerDataLog;
    if (os_log_type_enabled((os_log_t)SRResearchPerDataLog, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v34 = 138543362;
      v35 = v9;
      _os_log_error_impl(&dword_230B11000, v17, OS_LOG_TYPE_ERROR, "Failed to find any sensors to export from %{public}@", v34, 0xCu);
    }
  }
  objc_destroyWeak(&v28);
  _Block_object_dispose(buf, 8);
  objc_destroyWeak(&location);
}

uint64_t __53__SRResearchDataPerCategoryViewController_exportData__block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  Weauint64_t k = objc_loadWeak((id *)(a1 + 40));
  return [Weak cancelExport];
}

void __53__SRResearchDataPerCategoryViewController_exportData__block_invoke_54(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v8 = SRResearchPerDataLog;
  if (os_log_type_enabled((os_log_t)SRResearchPerDataLog, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v14 = a3;
    _os_log_debug_impl(&dword_230B11000, v8, OS_LOG_TYPE_DEBUG, "Got sandbox extension token %{public}@", buf, 0xCu);
  }
  [objc_loadWeak((id *)(a1 + 48)) setExportedDataURL:a2];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  void v11[2] = __53__SRResearchDataPerCategoryViewController_exportData__block_invoke_55;
  v11[3] = &unk_264BA3090;
  objc_copyWeak(&v12, (id *)(a1 + 56));
  v11[4] = a4;
  v11[5] = a2;
  uint64_t v10 = *(void *)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 40);
  v11[7] = a3;
  v11[8] = v9;
  v11[6] = v10;
  dispatch_async(MEMORY[0x263EF83A0], v11);
  objc_destroyWeak(&v12);
}

void __53__SRResearchDataPerCategoryViewController_exportData__block_invoke_55(uint64_t a1)
{
  id location[3] = *(id *)MEMORY[0x263EF8340];
  id v2 = (id *)(a1 + 72);
  [objc_loadWeak((id *)(a1 + 72)) setCancelExportBlock:0];
  double v3 = *(void **)(a1 + 32);
  if (!v3 && *(void *)(a1 + 40)) {
    goto LABEL_7;
  }
  double v4 = SRResearchPerDataLog;
  if (os_log_type_enabled((os_log_t)SRResearchPerDataLog, OS_LOG_TYPE_ERROR))
  {
    LODWORD(location[0]) = 138412290;
    *(id *)((char *)location + 4) = v3;
    _os_log_error_impl(&dword_230B11000, v4, OS_LOG_TYPE_ERROR, "Failed to get exported file %@", (uint8_t *)location, 0xCu);
  }
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
  {
LABEL_7:
    uint64_t v7 = 0;
  }
  else
  {
    uint64_t v5 = (void *)MEMORY[0x263F1C3F8];
    uint64_t v6 = objc_msgSend(NSString, "srui_localizedStringForCode:", 27);
    uint64_t v7 = objc_msgSend(v5, "alertControllerWithTitle:message:preferredStyle:", v6, objc_msgSend(NSString, "srui_localizedStringForCode:", 29), 1);
    objc_initWeak(location, v7);
    uint64_t v8 = (void *)MEMORY[0x263F1C3F0];
    uint64_t v9 = objc_msgSend(NSString, "srui_localizedStringForCode:", 30);
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __53__SRResearchDataPerCategoryViewController_exportData__block_invoke_56;
    v15[3] = &unk_264BA3018;
    objc_copyWeak(&v16, location);
    objc_msgSend(v7, "addAction:", objc_msgSend(v8, "actionWithTitle:style:handler:", v9, 0, v15));
    objc_destroyWeak(&v16);
    objc_destroyWeak(location);
  }
  uint64_t v10 = *(void **)(a1 + 48);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __53__SRResearchDataPerCategoryViewController_exportData__block_invoke_2;
  v12[3] = &unk_264BA3068;
  objc_copyWeak(&v14, v2);
  uint64_t v11 = *(void *)(a1 + 40);
  v12[4] = v7;
  v12[5] = v11;
  long long v13 = *(_OWORD *)(a1 + 56);
  [v10 dismissViewControllerAnimated:0 completion:v12];
  objc_destroyWeak(&v14);
}

uint64_t __53__SRResearchDataPerCategoryViewController_exportData__block_invoke_56(uint64_t a1)
{
  Weauint64_t k = objc_loadWeak((id *)(a1 + 32));
  return [Weak dismissViewControllerAnimated:0 completion:0];
}

id __53__SRResearchDataPerCategoryViewController_exportData__block_invoke_2(uint64_t a1)
{
  id result = objc_loadWeak((id *)(a1 + 64));
  double v3 = result;
  if (*(void *)(a1 + 32))
  {
    return (id)objc_msgSend(result, "presentViewController:animated:completion:");
  }
  else if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    uint64_t v4 = [*(id *)(a1 + 40) path];
    uint64_t v5 = *(void *)(a1 + 48);
    return (id)[v3 presentDownloadPath:v4 sandboxExtensionToken:v5];
  }
  return result;
}

- (void)cancelExport
{
  double v3 = [(SRResearchDataPerCategoryViewController *)self cancelExportBlock];
  if (v3) {
    v3[2]();
  }
  [(SRResearchDataPerCategoryViewController *)self setCancelExportBlock:0];
}

- (void)cleanupExportedFile
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if ([(SRResearchDataPerCategoryViewController *)self exportedDataURL])
  {
    uint64_t v8 = 0;
    if ((objc_msgSend((id)objc_msgSend(MEMORY[0x263F08850], "defaultManager"), "removeItemAtURL:error:", -[SRResearchDataPerCategoryViewController exportedDataURL](self, "exportedDataURL"), &v8) & 1) == 0)
    {
      double v3 = SRResearchPerDataLog;
      if (os_log_type_enabled((os_log_t)SRResearchPerDataLog, OS_LOG_TYPE_ERROR))
      {
        uint64_t v5 = [(SRResearchDataPerCategoryViewController *)self exportedDataURL];
        *(_DWORD *)buf = 138543618;
        int64_t v10 = (int64_t)v5;
        __int16 v11 = 2114;
        uint64_t v12 = v8;
        _os_log_error_impl(&dword_230B11000, v3, OS_LOG_TYPE_ERROR, "Failed to remove exported URL %{public}@ because %{public}@", buf, 0x16u);
      }
    }
    [(SRResearchDataPerCategoryViewController *)self setExportedDataURL:0];
  }
  if ([(SRResearchDataPerCategoryViewController *)self sb_handle] != -1)
  {
    [(SRResearchDataPerCategoryViewController *)self sb_handle];
    if ((sandbox_extension_release() & 0x80000000) != 0)
    {
      uint64_t v4 = SRResearchPerDataLog;
      if (os_log_type_enabled((os_log_t)SRResearchPerDataLog, OS_LOG_TYPE_ERROR))
      {
        int64_t v6 = [(SRResearchDataPerCategoryViewController *)self sb_handle];
        int v7 = *__error();
        *(_DWORD *)buf = 134218240;
        int64_t v10 = v6;
        __int16 v11 = 1026;
        LODWORD(v12) = v7;
        _os_log_error_impl(&dword_230B11000, v4, OS_LOG_TYPE_ERROR, "Error releasing sandbox handle %lld because %{public, errno}d", buf, 0x12u);
      }
    }
    [(SRResearchDataPerCategoryViewController *)self setSb_handle:-1];
  }
}

- (void)presentDownloadPath:(id)a3 sandboxExtensionToken:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  if (a4)
  {
    [a4 UTF8String];
    [(SRResearchDataPerCategoryViewController *)self setSb_handle:sandbox_extension_consume()];
    int64_t v7 = [(SRResearchDataPerCategoryViewController *)self sb_handle];
    uint64_t v8 = SRResearchPerDataLog;
    if (v7 == -1)
    {
      if (os_log_type_enabled((os_log_t)SRResearchPerDataLog, OS_LOG_TYPE_ERROR))
      {
        int v18 = *__error();
        *(_DWORD *)buf = 138543618;
        id v24 = a4;
        __int16 v25 = 1026;
        LODWORD(v26) = v18;
        _os_log_error_impl(&dword_230B11000, v8, OS_LOG_TYPE_ERROR, "Error consuming sandbox extension token %{public}@ because %{public, errno}d", buf, 0x12u);
      }
    }
    else if (os_log_type_enabled((os_log_t)SRResearchPerDataLog, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543618;
      id v24 = a4;
      __int16 v25 = 2114;
      id v26 = a3;
      _os_log_debug_impl(&dword_230B11000, v8, OS_LOG_TYPE_DEBUG, "Consumed sandbox extension token %{public}@ for %{public}@", buf, 0x16u);
    }
  }
  uint64_t v9 = [NSURL fileURLWithPath:a3];
  id v10 = objc_alloc(MEMORY[0x263F1C3E8]);
  uint64_t v22 = v9;
  __int16 v11 = objc_msgSend(v10, "initWithActivityItems:applicationActivities:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", &v22, 1), 0);
  uint64_t v12 = *MEMORY[0x263F1CFD8];
  v21[0] = *MEMORY[0x263F1CFF0];
  v21[1] = v12;
  uint64_t v13 = *MEMORY[0x263F1D008];
  v21[2] = *MEMORY[0x263F1D000];
  v21[3] = v13;
  uint64_t v14 = *MEMORY[0x263F1CFA8];
  v21[4] = *MEMORY[0x263F1CFB0];
  v21[5] = v14;
  uint64_t v15 = *MEMORY[0x263F1CF98];
  v21[6] = *MEMORY[0x263F1D010];
  v21[7] = v15;
  uint64_t v16 = *MEMORY[0x263F1CFF8];
  v21[8] = *MEMORY[0x263F1CFE0];
  v21[9] = v16;
  v21[10] = *MEMORY[0x263F1CFE8];
  v21[11] = v15;
  uint64_t v17 = *MEMORY[0x263F1CFC0];
  v21[12] = *MEMORY[0x263F1CFD0];
  v21[13] = v17;
  objc_msgSend(v11, "setExcludedActivityTypes:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v21, 14));
  [(SRResearchDataPerCategoryViewController *)self presentViewController:v11 animated:1 completion:&__block_literal_global_62];
  objc_initWeak((id *)buf, self);
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __85__SRResearchDataPerCategoryViewController_presentDownloadPath_sandboxExtensionToken___block_invoke_2;
  v19[3] = &unk_264BA30E0;
  v19[4] = v11;
  objc_copyWeak(&v20, (id *)buf);
  [v11 setCompletionWithItemsHandler:v19];
  objc_destroyWeak(&v20);
  objc_destroyWeak((id *)buf);
}

uint64_t __85__SRResearchDataPerCategoryViewController_presentDownloadPath_sandboxExtensionToken___block_invoke_2(uint64_t a1)
{
  Weauint64_t k = objc_loadWeak((id *)(a1 + 40));
  return [Weak cleanupExportedFile];
}

- (void)deleteAllUnreleasedData
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  [(SRResearchDataPerCategoryViewController *)self end];
  if (v3 <= SRAbsoluteTimeGetCurrent())
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    uint64_t v4 = [(SRResearchDataPerCategoryViewController *)self pruners];
    uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v12;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void **)(*((void *)&v11 + 1) + 8 * v8);
          [(SRResearchDataPerCategoryViewController *)self end];
          [v9 removeSamplesFrom:v10 to:SRAbsoluteTimeGetCurrent()];
          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v6);
    }
  }
}

- (void)navigateToAuthorization
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v4 = 0;
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F01880], "defaultWorkspace"), "openSensitiveURL:withOptions:error:", +[NSURL sk_PreferencesMotionAndFitness](), 0, &v4);
  if (v4)
  {
    id v2 = SRResearchPerDataLog;
    if (os_log_type_enabled((os_log_t)SRResearchPerDataLog, OS_LOG_TYPE_ERROR))
    {
      uint64_t v3 = +[NSURL sk_PreferencesMotionAndFitness]();
      *(_DWORD *)buf = 138543618;
      uint64_t v6 = v3;
      __int16 v7 = 2114;
      uint64_t v8 = v4;
      _os_log_error_impl(&dword_230B11000, v2, OS_LOG_TYPE_ERROR, "Error opening %{public}@ because %{public}@", buf, 0x16u);
    }
  }
}

- (SRAuthorizationGroup)authGroup
{
  return self->_authGroup;
}

- (void)setAuthGroup:(id)a3
{
}

- (SRAuthorizationStore)authStore
{
  return (SRAuthorizationStore *)objc_getProperty(self, a2, 1032, 1);
}

- (void)setAuthStore:(id)a3
{
}

- (NSMutableSet)authorizedBundleIds
{
  return self->_authorizedBundleIds;
}

- (void)setAuthorizedBundleIds:(id)a3
{
}

- (NSMutableSet)authorizedWriterBundleIds
{
  return self->_authorizedWriterBundleIds;
}

- (void)setAuthorizedWriterBundleIds:(id)a3
{
}

- (NSArray)appBundles
{
  return self->_appBundles;
}

- (void)setAppBundles:(id)a3
{
}

- (NSArray)writerAppBundles
{
  return self->_writerAppBundles;
}

- (void)setWriterAppBundles:(id)a3
{
}

- (NSSet)sensorIdentifiers
{
  return self->_sensorIdentifiers;
}

- (void)setSensorIdentifiers:(id)a3
{
}

- (NSMutableArray)readers
{
  return self->_readers;
}

- (void)setReaders:(id)a3
{
}

- (NSMutableArray)pruners
{
  return self->_pruners;
}

- (void)setPruners:(id)a3
{
}

- (double)start
{
  return self->_start;
}

- (void)setStart:(double)a3
{
  self->_start = a3;
}

- (double)end
{
  return self->_end;
}

- (void)setEnd:(double)a3
{
  self->_end = a3;
}

- (OS_dispatch_group)fetchGroup
{
  return self->_fetchGroup;
}

- (void)setFetchGroup:(id)a3
{
}

- (NSMutableArray)tombstones
{
  return self->_tombstones;
}

- (void)setTombstones:(id)a3
{
}

- (int64_t)numberOfDays
{
  return self->_numberOfDays;
}

- (void)setNumberOfDays:(int64_t)a3
{
  self->_numberOfDays = a3;
}

- (id)cancelExportBlock
{
  return objc_getProperty(self, a2, 1136, 1);
}

- (void)setCancelExportBlock:(id)a3
{
}

- (int64_t)datastoreBackend
{
  return self->_datastoreBackend;
}

- (void)setDatastoreBackend:(int64_t)a3
{
  self->_datastoreBackend = a3;
}

- (NSURL)exportedDataURL
{
  return self->_exportedDataURL;
}

- (void)setExportedDataURL:(id)a3
{
}

- (int64_t)sb_handle
{
  return self->_sb_handle;
}

- (void)setSb_handle:(int64_t)a3
{
  self->_sb_handle = a3;
}

@end