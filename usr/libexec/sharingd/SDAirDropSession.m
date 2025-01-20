@interface SDAirDropSession
- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken;
- (BOOL)send;
- (NSString)clientBundleID;
- (SDAirDropSession)initWithPerson:(__SFNode *)a3 items:(id)a4 sandboxExtensions:(id)a5;
- (SDAirDropSessionDelegate)delegate;
- (int)clientPid;
- (void)addClientForNode:(__SFNode *)a3 shouldPublishProgress:(BOOL)a4;
- (void)airDropClient:(id)a3 event:(int64_t)a4 withResults:(id)a5;
- (void)consumeSandboxExtensions;
- (void)dealloc;
- (void)handleConversionProgress:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)postNotificationForTransferStatus:(int64_t)a3 progress:(double)a4;
- (void)releaseSandboxExtensions;
- (void)removeClientAlerts;
- (void)serversChanged:(id)a3;
- (void)setAuditToken:(id *)a3;
- (void)setClientBundleID:(id)a3;
- (void)setClientPid:(int)a3;
- (void)setDelegate:(id)a3;
- (void)setProperty:(id)a3 forKey:(id)a4;
- (void)start;
- (void)startProgress;
- (void)stop;
@end

@implementation SDAirDropSession

- (SDAirDropSession)initWithPerson:(__SFNode *)a3 items:(id)a4 sandboxExtensions:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v36.receiver = self;
  v36.super_class = (Class)SDAirDropSession;
  v11 = [(SDAirDropSession *)&v36 init];
  if (v11)
  {
    uint64_t v12 = objc_opt_new();
    airDropClients = v11->_airDropClients;
    v11->_airDropClients = (NSMutableArray *)v12;

    v11->_clientPid = 0;
    uint64_t v14 = +[NSProgress discreteProgressWithTotalUnitCount:0];
    conversionProgress = v11->_conversionProgress;
    v11->_conversionProgress = (NSProgress *)v14;

    uint64_t v16 = objc_opt_new();
    currentNames = v11->_currentNames;
    v11->_currentNames = (NSMutableArray *)v16;

    objc_storeWeak((id *)&v11->_delegate, 0);
    uint64_t v18 = +[SDAirDropDiscoveryLogger discoverabilityMetricsForNode:a3];
    discoveryMetrics = v11->_discoveryMetrics;
    v11->_discoveryMetrics = (NSDictionary *)v18;

    objc_storeStrong((id *)&v11->_items, a4);
    v11->_lastEvent = 1;
    uint64_t Copy = SFNodeCreateCopy();
    progress = v11->_progress;
    v11->_person = (__SFNode *)Copy;
    v11->_progress = 0;

    uint64_t v22 = objc_opt_new();
    properties = v11->_properties;
    v11->_properties = (NSMutableDictionary *)v22;

    uint64_t v24 = objc_opt_new();
    results = v11->_results;
    v11->_results = (NSMutableDictionary *)v24;

    uint64_t v26 = SFNodeCopyRealName();
    rootNodeName = v11->_rootNodeName;
    v11->_rootNodeName = (NSString *)v26;

    objc_storeStrong((id *)&v11->_sandboxExtensions, a5);
    uint64_t v28 = objc_opt_new();
    sandboxExtensionHandles = v11->_sandboxExtensionHandles;
    v11->_sandboxExtensionHandles = (NSMutableArray *)v28;

    v30 = (void *)SFNodeCopySiblingNodes();
    v31 = (NSMutableArray *)[v30 mutableCopy];
    siblingNodes = v11->_siblingNodes;
    v11->_siblingNodes = v31;

    v33 = (NSProgress *)objc_alloc_init((Class)NSProgress);
    transferProgress = v11->_transferProgress;
    v11->_transferProgress = v33;
  }
  return v11;
}

- (void)setProperty:(id)a3 forKey:(id)a4
{
  properties = self->_properties;
  if (a3) {
    [(NSMutableDictionary *)properties setObject:a3 forKeyedSubscript:a4];
  }
  else {
    [(NSMutableDictionary *)properties removeObjectForKey:a4];
  }
}

- (void)consumeSandboxExtensions
{
  v3 = [(NSDictionary *)self->_sandboxExtensions allValues];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v4)
  {
    id v6 = v4;
    uint64_t v7 = *(void *)v18;
    *(void *)&long long v5 = 67109378;
    long long v16 = v5;
    do
    {
      v8 = 0;
      do
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v3);
        }
        id v9 = *(id *)(*((void *)&v17 + 1) + 8 * (void)v8);
        [v9 bytes];
        uint64_t v10 = sandbox_extension_consume();
        if (v10 < 0)
        {
          uint64_t v12 = airdrop_log();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            int v13 = *__error();
            *(_DWORD *)buf = v16;
            unsigned int v22 = v13;
            __int16 v23 = 2112;
            id v24 = v9;
            _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "sandbox_extension_consume failed with error %d for tokenData \"%@\"", buf, 0x12u);
          }
        }
        else
        {
          sandboxExtensionHandles = self->_sandboxExtensionHandles;
          uint64_t v12 = +[NSNumber numberWithLongLong:v10];
          [(NSMutableArray *)sandboxExtensionHandles addObject:v12];
        }

        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v3 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v6);
  }
  if ([(NSMutableArray *)self->_sandboxExtensionHandles count])
  {
    uint64_t v14 = airdrop_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v15 = [(NSMutableArray *)self->_sandboxExtensionHandles count];
      *(_DWORD *)buf = 67109120;
      unsigned int v22 = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Consumed %d sandbox extensions", buf, 8u);
    }
  }
}

- (void)releaseSandboxExtensions
{
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = self->_sandboxExtensionHandles;
  id v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      id v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * (void)v6) integerValue:v7];
        sandbox_extension_release();
        id v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)start
{
  id v3 = (OS_os_transaction *)os_transaction_create();
  transaction = self->_transaction;
  self->_transaction = v3;

  uint64_t v5 = airdrop_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    person = self->_person;
    *(_DWORD *)buf = 138412290;
    unsigned int v22 = person;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Start AirDrop session with %@", buf, 0xCu);
  }

  long long v7 = +[NSNotificationCenter defaultCenter];
  [v7 postNotificationName:@"com.apple.sharingd.AirDropTransferInitiated" object:0];

  [(SDAirDropSession *)self consumeSandboxExtensions];
  siblingNodes = self->_siblingNodes;
  if (siblingNodes)
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v9 = siblingNodes;
    id v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v17;
      do
      {
        int v13 = 0;
        do
        {
          if (*(void *)v17 != v12) {
            objc_enumerationMutation(v9);
          }
          -[SDAirDropSession addClientForNode:shouldPublishProgress:](self, "addClientForNode:shouldPublishProgress:", *(void *)(*((void *)&v16 + 1) + 8 * (void)v13), 0, (void)v16);
          int v13 = (char *)v13 + 1;
        }
        while (v11 != v13);
        id v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v11);
    }

    uint64_t v14 = +[NSNotificationCenter defaultCenter];
    [v14 addObserver:self selector:"serversChanged:" name:@"com.apple.sharingd.AirDropChanged" object:0];

    [(SDAirDropSession *)self serversChanged:0];
    [(SDAirDropSession *)self postNotificationForTransferStatus:11 progress:0.0];
  }
  else
  {
    [(SDAirDropSession *)self addClientForNode:self->_person shouldPublishProgress:1];
  }
  if (![(NSMutableArray *)self->_airDropClients count])
  {
    unsigned int v15 = airdrop_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "No session clients started at the moment, most likely we have not discovered the node over Bonjour yet", buf, 2u);
    }
  }
}

- (BOOL)send
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = self->_airDropClients;
  id v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    id v4 = v3;
    int v5 = 0;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v2);
        }
        v5 |= [*(id *)(*((void *)&v9 + 1) + 8 * i) send:v9];
      }
      id v4 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5 & 1;
}

- (void)serversChanged:(id)a3
{
  id v4 = +[SDServerBrowser sharedBrowser];
  int v5 = [v4 airDropNodesForDomain:@"local"];

  long long v17 = (void *)SFNodeCopyComputerName();
  uint64_t v6 = (void *)SFNodeCopyContactIdentifiers();
  if (!v6)
  {
    long long v7 = [(NSMutableArray *)self->_siblingNodes objectAtIndexedSubscript:0];
    uint64_t v6 = sub_1000507A4();
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v8 = v5;
  id v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v19;
    do
    {
      long long v12 = 0;
      do
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v18 + 1) + 8 * (void)v12);
        if (sub_10005068C())
        {
          uint64_t v14 = (void *)SFNodeCopyComputerName();
          if (![v14 isEqualToString:v17]) {
            goto LABEL_14;
          }
        }
        else
        {
          uint64_t v14 = sub_1000507A4();
          if (![v14 intersectsSet:v6]) {
            goto LABEL_14;
          }
        }
        currentNames = self->_currentNames;
        long long v16 = (void *)SFNodeCopyRealName();
        LOBYTE(currentNames) = [(NSMutableArray *)currentNames containsObject:v16];

        if ((currentNames & 1) == 0)
        {
          [(NSMutableArray *)self->_siblingNodes addObject:v13];
          [(SDAirDropSession *)self addClientForNode:v13 shouldPublishProgress:0];
        }
LABEL_14:

        long long v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v10);
  }
}

- (void)addClientForNode:(__SFNode *)a3 shouldPublishProgress:(BOOL)a4
{
  BOOL v4 = a4;
  long long v7 = (void *)SFNodeCopyKinds();
  unsigned int v8 = [v7 containsObject:kSFNodeKindRapport];
  airdrop_log();
  id v9 = (SDAirDropClient *)objc_claimAutoreleasedReturnValue();
  BOOL v10 = os_log_type_enabled(&v9->super, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v10)
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v26 = a3;
      _os_log_impl((void *)&_mh_execute_header, &v9->super, OS_LOG_TYPE_DEFAULT, "SDAirDropSession: skip Rapport node %@", buf, 0xCu);
    }
  }
  else
  {
    if (v10)
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v26 = a3;
      _os_log_impl((void *)&_mh_execute_header, &v9->super, OS_LOG_TYPE_DEFAULT, "Start session client for %@", buf, 0xCu);
    }

    id v9 = [[SDAirDropClient alloc] initWithPerson:a3 items:self->_items forDiscovery:0];
    uint64_t v11 = kSFOperationFileIconKey;
    long long v12 = [(NSMutableDictionary *)self->_properties objectForKeyedSubscript:kSFOperationFileIconKey];
    [(SDAirDropClient *)v9 setProperty:v12 forKey:v11];

    uint64_t v13 = kSFOperationSessionIDKey;
    uint64_t v14 = [(NSMutableDictionary *)self->_properties objectForKeyedSubscript:kSFOperationSessionIDKey];
    [(SDAirDropClient *)v9 setProperty:v14 forKey:v13];

    uint64_t v15 = kSFOperationSmallFileIconKey;
    long long v16 = [(NSMutableDictionary *)self->_properties objectForKeyedSubscript:kSFOperationSmallFileIconKey];
    [(SDAirDropClient *)v9 setProperty:v16 forKey:v15];

    uint64_t v17 = kSFOperationItemsDescriptionKey;
    long long v18 = [(NSMutableDictionary *)self->_properties objectForKeyedSubscript:kSFOperationItemsDescriptionKey];
    [(SDAirDropClient *)v9 setProperty:v18 forKey:v17];

    uint64_t v19 = kSFOperationFromShareSheet;
    long long v20 = [(NSMutableDictionary *)self->_properties objectForKeyedSubscript:kSFOperationFromShareSheet];
    [(SDAirDropClient *)v9 setProperty:v20 forKey:v19];

    long long v21 = *(_OWORD *)&self->_auditToken.val[4];
    v24[0] = *(_OWORD *)self->_auditToken.val;
    v24[1] = v21;
    [(SDAirDropClient *)v9 setAuditToken:v24];
    [(SDAirDropClient *)v9 setClientBundleID:self->_clientBundleID];
    [(SDAirDropClient *)v9 setDiscoveryMetrics:self->_discoveryMetrics];
    [(SDAirDropClient *)v9 setShouldPublishProgress:v4];
    if (self->_clientPid) {
      -[SDAirDropClient setClientPid:](v9, "setClientPid:");
    }
    [(SDAirDropClient *)v9 setDelegate:self];
    [(SDAirDropClient *)v9 activate];
    [(NSMutableArray *)self->_airDropClients addObject:v9];
    currentNames = self->_currentNames;
    __int16 v23 = (void *)SFNodeCopyRealName();
    [(NSMutableArray *)currentNames addObject:v23];
  }
}

- (void)stop
{
  id v3 = airdrop_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    person = self->_person;
    *(_DWORD *)buf = 138412290;
    long long v21 = person;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Stop AirDrop session with %@", buf, 0xCu);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  int v5 = self->_airDropClients;
  id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v15 + 1) + 8 * (void)v9) invalidate:v15];
        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  BOOL v10 = +[NSNotificationCenter defaultCenter];
  [v10 removeObserver:self name:@"com.apple.sharingd.AirDropChanged" object:0];

  airDropClients = self->_airDropClients;
  self->_airDropClients = 0;

  currentNames = self->_currentNames;
  self->_currentNames = 0;

  responseClient = self->_responseClient;
  self->_responseClient = 0;

  transaction = self->_transaction;
  self->_transaction = 0;
}

- (void)dealloc
{
  if (self->_conversionObserver) {
    [(NSProgress *)self->_conversionProgress removeObserver:self forKeyPath:@"fractionCompleted"];
  }
  [(SDAirDropSession *)self releaseSandboxExtensions];
  [(NSProgress *)self->_progress _unpublish];
  CFRelease(self->_person);
  v3.receiver = self;
  v3.super_class = (Class)SDAirDropSession;
  [(SDAirDropSession *)&v3 dealloc];
}

- (void)removeClientAlerts
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  objc_super v3 = self->_airDropClients;
  id v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(SDAirDropClient **)(*((void *)&v9 + 1) + 8 * (void)v7);
        if (v8 != self->_responseClient) {
          [(SDAirDropClient *)v8 invalidate];
        }
        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void)airDropClient:(id)a3 event:(int64_t)a4 withResults:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  id v11 = [v10 mutableCopy];
  [v11 addEntriesFromDictionary:self->_results];
  if (a4 == 7)
  {
LABEL_2:
    long long v12 = [v10 objectForKeyedSubscript:kSFOperationBytesCopiedKey];
    -[NSProgress setCompletedUnitCount:](self->_transferProgress, "setCompletedUnitCount:", [v12 longLongValue]);

    LODWORD(v12) = self->_hadConversion;
    [(NSProgress *)self->_transferProgress fractionCompleted];
    double v14 = v13 * 100.0;
    if (v12) {
      double v14 = v14 * 0.8 + 20.0;
    }
    [(NSProgress *)self->_progress setCompletedUnitCount:(uint64_t)v14];
    progress = self->_progress;
    long long v16 = [v10 objectForKeyedSubscript:kSFOperationTimeRemainingKey];
    [(NSProgress *)progress setUserInfoObject:v16 forKey:NSProgressEstimatedTimeRemainingKey];

    double v17 = (double)[(NSProgress *)self->_progress completedUnitCount];
    long long v18 = self;
    uint64_t v19 = 7;
  }
  else
  {
    long long v21 = airdrop_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
      sub_100017918(a4, (uint64_t)v11, v21);
    }

    switch(a4)
    {
      case 3:
        if (self->_conversionActive) {
          goto LABEL_6;
        }
        self->_allowedWaiting = 1;
        [(NSProgress *)self->_progress setSf_transferState:2];
        double v17 = 0.0;
        long long v18 = self;
        uint64_t v19 = 3;
        break;
      case 4:
        objc_storeStrong((id *)&self->_responseClient, a3);
        [(SDAirDropSession *)self removeClientAlerts];
        [(NSProgress *)self->_progress setSf_transferState:4];
        double v17 = 0.0;
        long long v18 = self;
        uint64_t v19 = 4;
        break;
      case 5:
        objc_storeStrong((id *)&self->_responseClient, a3);
        [(SDAirDropSession *)self removeClientAlerts];
        if (self->_conversionObserver)
        {
          self->_conversionObserver = 0;
          [(NSProgress *)self->_conversionProgress removeObserver:self forKeyPath:@"fractionCompleted"];
        }
        if (self->_hadConversion) {
          uint64_t v22 = 20;
        }
        else {
          uint64_t v22 = 0;
        }
        [(NSProgress *)self->_progress setCompletedUnitCount:v22];
        [(NSProgress *)self->_conversionProgress cancel];
        __int16 v23 = airdrop_log();
        os_signpost_id_t v24 = os_signpost_id_make_with_pointer(v23, self);

        uint64_t v25 = kSFOperationTotalBytesKey;
        uint64_t v26 = [v10 objectForKeyedSubscript:kSFOperationTotalBytesKey];
        uint64_t v27 = (uint64_t)[v26 longLongValue];

        uint64_t v28 = airdrop_log();
        v29 = v28;
        if (v24 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
        {
          LOWORD(v43) = 0;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v29, OS_SIGNPOST_INTERVAL_BEGIN, v24, "TransferTime", "", (uint8_t *)&v43, 2u);
        }

        v30 = airdrop_log();
        v31 = v30;
        if (v24 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v30))
        {
          int v43 = 134349056;
          uint64_t v44 = 102400 * (v27 / 102400);
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v31, OS_SIGNPOST_INTERVAL_BEGIN, v24, "TransferTimeBytes", "totalBytes=%{public, signpost.telemetry:number1}lld", (uint8_t *)&v43, 0xCu);
        }

        [(NSProgress *)self->_progress setSf_transferState:3];
        v32 = [v10 objectForKeyedSubscript:v25];
        -[NSProgress setTotalUnitCount:](self->_transferProgress, "setTotalUnitCount:", [v32 longLongValue]);

        [(NSProgress *)self->_transferProgress setCompletedUnitCount:0];
        *(_WORD *)&self->_conversionActive = 0;
        goto LABEL_6;
      case 7:
        goto LABEL_2;
      case 9:
        v33 = airdrop_log();
        os_signpost_id_t v34 = os_signpost_id_make_with_pointer(v33, self);

        v35 = airdrop_log();
        objc_super v36 = v35;
        if (v34 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v35))
        {
          LOWORD(v43) = 0;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v36, OS_SIGNPOST_INTERVAL_END, v34, "TransferTime", " enableTelemetry=YES ", (uint8_t *)&v43, 2u);
        }

        v37 = airdrop_log();
        v38 = v37;
        if (v34 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v37))
        {
          LOWORD(v43) = 0;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v38, OS_SIGNPOST_INTERVAL_END, v34, "TransferTimeBytes", " enableTelemetry=YES ", (uint8_t *)&v43, 2u);
        }

        [(NSProgress *)self->_progress setSf_transferState:6];
        v39 = [(NSProgress *)self->_progress sf_personRealName];

        if (!v39) {
          goto LABEL_6;
        }
        double v17 = 0.0;
        long long v18 = self;
        uint64_t v19 = 9;
        break;
      case 10:
        v40 = self->_progress;
        v41 = [v10 objectForKeyedSubscript:kSFOperationErrorKey];
        v42 = [v41 localizedDescription];
        [(NSProgress *)v40 sf_failedWithError:v42];

        double v17 = 0.0;
        long long v18 = self;
        uint64_t v19 = 10;
        break;
      case 11:
        if (self->_conversionActive) {
          goto LABEL_6;
        }
        [(NSProgress *)self->_progress setSf_transferState:2];
        double v17 = 0.0;
        long long v18 = self;
        uint64_t v19 = 11;
        break;
      case 15:
        [(NSProgress *)self->_progress setSf_transferState:1];
        [(NSProgress *)self->_progress setCompletedUnitCount:0];
        goto LABEL_6;
      default:
        goto LABEL_6;
    }
  }
  [(SDAirDropSession *)v18 postNotificationForTransferStatus:v19 progress:v17];
LABEL_6:
  self->_lastEvent = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained airDropSession:self event:a4 withResults:v11];
}

- (void)postNotificationForTransferStatus:(int64_t)a3 progress:(double)a4
{
  uint64_t v6 = +[NSNumber numberWithDouble:a4];
  progress = self->_progress;
  if (progress)
  {
    uint64_t v8 = [(NSProgress *)progress sf_personRealName];
  }
  else
  {
    uint64_t v8 = self->_rootNodeName;
  }
  id v9 = v8;
  uint64_t v10 = [(NSMutableDictionary *)self->_properties objectForKeyedSubscript:kSFOperationSessionIDKey];
  id v11 = (void *)v10;
  if (self->_siblingNodes)
  {
    if (v6) {
      BOOL v12 = v9 == 0;
    }
    else {
      BOOL v12 = 1;
    }
    if (!v12 && v10 != 0)
    {
      double v14 = +[NSNotificationCenter defaultCenter];
      v17[0] = @"TransferProgress";
      v17[1] = @"RealName";
      v18[0] = v6;
      v18[1] = v9;
      v18[2] = v11;
      v17[2] = @"SessionID";
      v17[3] = @"TransferText";
      long long v15 = +[NSNumber numberWithLong:a3];
      v18[3] = v15;
      long long v16 = +[NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:4];
      [v14 postNotificationName:@"TransferUpdated" object:self userInfo:v16];
    }
  }
}

- (void)startProgress
{
  if (!self->_progress && self->_clientBundleID)
  {
    objc_super v3 = self->_rootNodeName;
    if (v3)
    {
      id v4 = [(NSMutableDictionary *)self->_properties objectForKeyedSubscript:kSFOperationSessionIDKey];
      if (v4)
      {
        id location = 0;
        objc_initWeak(&location, self);
        id v5 = objc_alloc((Class)NSProgress);
        [v5 sf_initWithAppBundle:self->_clientBundleID sessionID:v4 andPersonRealName:v3];
        uint64_t v6 = (NSProgress *)objc_claimAutoreleasedReturnValue();
        progress = self->_progress;
        self->_progress = v6;

        [(NSProgress *)self->_progress setTotalUnitCount:100];
        v9[0] = _NSConcreteStackBlock;
        v9[1] = 3221225472;
        v9[2] = sub_1000173CC;
        v9[3] = &unk_1008CA248;
        objc_copyWeak(&v11, &location);
        id v10 = v4;
        [(NSProgress *)self->_progress setCancellationHandler:v9];
        [(NSProgress *)self->_progress _publish];

        objc_destroyWeak(&v11);
        objc_destroyWeak(&location);
      }
      else
      {
        uint64_t v8 = airdrop_log();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
          sub_1000179C4(v8);
        }
      }
    }
  }
}

- (void)handleConversionProgress:(id)a3
{
  id v7 = a3;
  conversionProgress = self->_conversionProgress;
  if (!conversionProgress)
  {
    id v5 = +[NSProgress discreteProgressWithTotalUnitCount:0];
    uint64_t v6 = self->_conversionProgress;
    self->_conversionProgress = v5;

    conversionProgress = self->_conversionProgress;
  }
  self->_conversionActive = 1;
  [(NSProgress *)conversionProgress setTotalUnitCount:(char *)[(NSProgress *)conversionProgress totalUnitCount] + 100];
  [(NSProgress *)self->_conversionProgress addChild:v7 withPendingUnitCount:100];
  if (!self->_conversionObserver && !self->_allowedWaiting)
  {
    self->_conversionObserver = 1;
    [(NSProgress *)self->_conversionProgress addObserver:self forKeyPath:@"fractionCompleted" options:0 context:0];
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  double v13 = +[NSThread mainThread];

  if (v13)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v14 = v11;
      long long v15 = v14;
      if (!self->_conversionNotified
        && ([v14 isCancelled] & 1) == 0
        && self->_conversionActive)
      {
        self->_conversionNotified = 1;
        [(SDAirDropSession *)self airDropClient:0 event:15 withResults:0];
      }
      if (([v15 isCancelled] & 1) == 0 && !self->_hadConversion)
      {
        [v15 fractionCompleted];
        [(NSProgress *)self->_progress setCompletedUnitCount:(uint64_t)(v16 * 100.0 * 0.2)];
        [(SDAirDropSession *)self postNotificationForTransferStatus:15 progress:(double)[(NSProgress *)self->_progress completedUnitCount]];
      }
      [v15 fractionCompleted];
      if (v17 == 1.0 || [v15 isCancelled])
      {
        self->_hadConversion = 1;
        *(_WORD *)&self->_conversionActive = 0;
        if (self->_conversionObserver)
        {
          self->_conversionObserver = 0;
          [(NSProgress *)self->_conversionProgress removeObserver:self forKeyPath:@"fractionCompleted"];
          conversionProgress = self->_conversionProgress;
          self->_conversionProgress = 0;
        }
      }
    }
  }
  else
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100017784;
    block[3] = &unk_1008CA270;
    block[4] = self;
    id v20 = v10;
    id v21 = v11;
    id v22 = v12;
    __int16 v23 = a6;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken
{
  objc_copyStruct(retstr, &self->_auditToken, 32, 1, 0);
  return result;
}

- (void)setAuditToken:(id *)a3
{
}

- (int)clientPid
{
  return self->_clientPid;
}

- (void)setClientPid:(int)a3
{
  self->_clientPid = a3;
}

- (NSString)clientBundleID
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setClientBundleID:(id)a3
{
}

- (SDAirDropSessionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SDAirDropSessionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_transferProgress, 0);
  objc_storeStrong((id *)&self->_siblingNodes, 0);
  objc_storeStrong((id *)&self->_sandboxExtensionHandles, 0);
  objc_storeStrong((id *)&self->_sandboxExtensions, 0);
  objc_storeStrong((id *)&self->_rootNodeName, 0);
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_responseClient, 0);
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_discoveryMetrics, 0);
  objc_storeStrong((id *)&self->_currentNames, 0);
  objc_storeStrong((id *)&self->_conversionProgress, 0);
  objc_storeStrong((id *)&self->_clientBundleID, 0);

  objc_storeStrong((id *)&self->_airDropClients, 0);
}

@end