@interface SDAirDropClient
- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken;
- (BOOL)connectionOverP2P:(__CFData *)a3;
- (BOOL)parseAskResponse:(__CFError *)a3;
- (BOOL)parseDiscoverResponse:(__CFError *)a3;
- (BOOL)receiverDeviceModelNameSuggestsMacPlatform;
- (BOOL)requireAWDL;
- (BOOL)send;
- (BOOL)shouldCancelTransferForError:(id)a3;
- (BOOL)shouldPublishProgress;
- (BOOL)splitOutFileURLs;
- (NSDictionary)discoveryMetrics;
- (NSString)clientBundleID;
- (NSString)personID;
- (SDAirDropClient)initWithPerson:(__SFNode *)a3 items:(id)a4 forDiscovery:(BOOL)a5;
- (SDAirDropClientDelegate)delegate;
- (__SecTrust)secTrustRef;
- (double)getTransferRate;
- (double)getTransferSize;
- (id)askBodyDataInFormat:(int64_t)a3;
- (id)askRequestClientBundleID;
- (id)discoverBodyDataInFormat:(int64_t)a3;
- (id)receiverMediaCapabilities;
- (id)whereFromInfo;
- (int)clientPid;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 didFinishCollectingMetrics:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 didSendBodyData:(int64_t)a5 totalBytesSent:(int64_t)a6 totalBytesExpectedToSend:(int64_t)a7;
- (void)URLSession:(id)a3 task:(id)a4 needNewBodyStream:(id)a5;
- (void)activate;
- (void)addHashesAndValidationRecordToRequest:(id)a3;
- (void)addObservers;
- (void)appendFileURL:(id)a3 withBase:(id)a4 toItems:(id)a5;
- (void)bonjourResolverDidChange:(id)a3;
- (void)cancelSendingClassroom;
- (void)convertMediaItemsWithCompletionHandler:(id)a3;
- (void)createSession;
- (void)dealloc;
- (void)didFail:(id)a3;
- (void)didFinishLoading;
- (void)didFinishSendingAskBodyData;
- (void)didStartSendingAskBodyData;
- (void)donateTransferInteractionToDuet;
- (void)evaluateReceiverTrust:(__SecTrust *)a3 completion:(id)a4;
- (void)fileZipper:(id)a3 event:(int64_t)a4 withProperty:(void *)a5;
- (void)finishOperation;
- (void)generatePreviewForFileURL:(id)a3;
- (void)invalidate;
- (void)logInterfaceUsedForSending:(id)a3;
- (void)notifyClientForEvent:(int64_t)a3 withProperty:(void *)a4;
- (void)notifyClientOfBytesCopied:(id)a3 timeRemaining:(id)a4;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)postNotificationForTransferStatus:(int64_t)a3 progress:(double)a4;
- (void)releaseIdleSleepAssertion;
- (void)releasePeerToPeerIfPossible:(id)a3;
- (void)removeFileIconsFromProperties;
- (void)removeObservers;
- (void)resolve;
- (void)retryRequestForError:(id)a3;
- (void)sendRequest:(id)a3;
- (void)setAuditToken:(id *)a3;
- (void)setClientBundleID:(id)a3;
- (void)setClientPid:(int)a3;
- (void)setDelegate:(id)a3;
- (void)setDiscoveryMetrics:(id)a3;
- (void)setProperty:(id)a3 forKey:(id)a4;
- (void)setShouldPublishProgress:(BOOL)a3;
- (void)startPublishingProgress;
- (void)startSending;
- (void)startSendingClassroom;
- (void)startZipping;
- (void)storeDataValue:(__CFDictionary *)a3 forKey:(__CFString *)a4;
- (void)storePropertyValue:(void *)a3 forKey:(__CFString *)a4;
- (void)storeStringValue:(__CFDictionary *)a3 forKey:(__CFString *)a4;
- (void)systemWillSleep:(id)a3;
- (void)validateAirDropItemsWithCompletionHandler:(id)a3;
- (void)wirelessPowerChanged:(id)a3;
@end

@implementation SDAirDropClient

- (SDAirDropClient)initWithPerson:(__SFNode *)a3 items:(id)a4 forDiscovery:(BOOL)a5
{
  id v9 = a4;
  v55.receiver = self;
  v55.super_class = (Class)SDAirDropClient;
  v10 = [(SDAirDropClient *)&v55 init];
  v11 = v10;
  if (v10)
  {
    askResponse = v10->_askResponse;
    v10->_askResponse = 0;

    askTask = v11->_askTask;
    v11->_askTask = 0;

    clientBundleID = v11->_clientBundleID;
    v11->_clientBundleID = 0;

    v11->_clientPid = 0;
    connectionKey = v11->_connectionKey;
    v11->_connectionKey = 0;

    uint64_t v16 = +[NSProgress discreteProgressWithTotalUnitCount:0];
    conversionProgress = v11->_conversionProgress;
    v11->_conversionProgress = (NSProgress *)v16;

    objc_storeWeak((id *)&v11->_delegate, 0);
    v11->_discover = a5;
    discoveryMetrics = v11->_discoveryMetrics;
    v11->_discoveryMetrics = (NSDictionary *)&__NSDictionary0__struct;

    discoverResponse = v11->_discoverResponse;
    v11->_discoverResponse = 0;

    discoverTask = v11->_discoverTask;
    v11->_discoverTask = 0;

    v11->_failCount = 0;
    v11->_fileIcon = 0;
    uint64_t v21 = objc_opt_new();
    filesToCleanup = v11->_filesToCleanup;
    v11->_filesToCleanup = (NSMutableArray *)v21;

    uint64_t v23 = objc_opt_new();
    fileURLs = v11->_fileURLs;
    v11->_fileURLs = (NSMutableArray *)v23;

    uint64_t v25 = objc_opt_new();
    fileURLToConversionNeeded = v11->_fileURLToConversionNeeded;
    v11->_fileURLToConversionNeeded = (NSMutableDictionary *)v25;

    uint64_t v27 = objc_opt_new();
    generatedFiles = v11->_generatedFiles;
    v11->_generatedFiles = (NSMutableSet *)v27;

    v11->_identity = 0;
    objc_storeStrong((id *)&v11->_items, a4);
    v11->_lastEvent = 1;
    uint64_t v29 = objc_opt_new();
    mediaFormatConversionDestinations = v11->_mediaFormatConversionDestinations;
    v11->_mediaFormatConversionDestinations = (NSMutableArray *)v29;

    uint64_t v31 = objc_getAssociatedObject(a3, @"SDAirDropPeerMetric");
    metric = v11->_metric;
    v11->_metric = (SDAirDropPeerMetric *)v31;

    uint64_t v33 = +[SDStatusMonitor sharedMonitor];
    monitor = v11->_monitor;
    v11->_monitor = (SDStatusMonitor *)v33;

    uint64_t v35 = objc_opt_new();
    otherStuff = v11->_otherStuff;
    v11->_otherStuff = (NSMutableArray *)v35;

    v11->_p2pRetained = 0;
    v11->_person = (__SFNode *)SFNodeCreateCopy();
    v11->_personAdded = 0;
    v11->_powerAssertionID = 0;
    progress = v11->_progress;
    v11->_progress = 0;

    uint64_t v38 = objc_opt_new();
    properties = v11->_properties;
    v11->_properties = (NSMutableDictionary *)v38;

    v11->_providedStream = 0;
    objc_storeStrong((id *)&v11->_queue, &_dispatch_main_q);
    v11->_queueSuspended = 0;
    uint64_t v40 = objc_opt_new();
    receiverData = v11->_receiverData;
    v11->_receiverData = (NSMutableData *)v40;

    resolver = v11->_resolver;
    v11->_resolver = 0;

    serverURL = v11->_serverURL;
    *(_OWORD *)&v11->_serverTrust = 0u;

    v11->_shouldPublishProgress = 1;
    v11->_transactionStarted = 0;
    *(_OWORD *)&v11->_smallFileIcon = 0u;
    v44 = (NSProgress *)objc_alloc_init((Class)NSProgress);
    transferProgress = v11->_transferProgress;
    v11->_transferProgress = v44;

    v11->_uploadFinished = 0;
    uploadResponse = v11->_uploadResponse;
    v11->_uploadResponse = 0;

    uploadTask = v11->_uploadTask;
    v11->_uploadTask = 0;

    zipper = v11->_zipper;
    v11->_zipper = 0;

    v11->_zipperFinished = 0;
    [(SDAirDropClient *)v11 addObservers];
    v49 = [[SDXPCHelperConnection alloc] initWithQueue:0];
    xpcHelperConnection = v11->_xpcHelperConnection;
    v11->_xpcHelperConnection = v49;

    v54[0] = _NSConcreteStackBlock;
    v54[1] = 3221225472;
    v54[2] = sub_1000698A0;
    v54[3] = &unk_1008CA4B8;
    v54[4] = v11;
    v51 = v11->_xpcHelperConnection;
    v52 = v11;
    [(SDXPCHelperConnection *)v51 setInvalidationHandler:v54];
  }
  return v11;
}

- (void)dealloc
{
  [(SDXPCHelperConnection *)self->_xpcHelperConnection invalidate];
  xpcHelperConnection = self->_xpcHelperConnection;
  self->_xpcHelperConnection = 0;

  if (self->_shouldPublishProgress) {
    [(NSProgress *)self->_progress _unpublish];
  }
  if (self->_conversionObserver) {
    [(NSProgress *)self->_conversionProgress removeObserver:self forKeyPath:@"fractionCompleted"];
  }
  [(SDAirDropClient *)self removeObservers];
  identity = self->_identity;
  if (identity) {
    CFRelease(identity);
  }
  fileIcon = self->_fileIcon;
  if (fileIcon) {
    CFRelease(fileIcon);
  }
  serverTrust = self->_serverTrust;
  if (serverTrust) {
    CFRelease(serverTrust);
  }
  smallFileIcon = self->_smallFileIcon;
  if (smallFileIcon) {
    CFRelease(smallFileIcon);
  }
  tmpDirectoryToCleanUp = self->_tmpDirectoryToCleanUp;
  if (tmpDirectoryToCleanUp) {
    sub_1001B2C50(tmpDirectoryToCleanUp);
  }
  CFRelease(self->_person);
  v9.receiver = self;
  v9.super_class = (Class)SDAirDropClient;
  [(SDAirDropClient *)&v9 dealloc];
}

- (void)systemWillSleep:(id)a3
{
  sub_100052DC0(-8, 0);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(SDAirDropClient *)self notifyClientForEvent:10 withProperty:v4];
}

- (void)wirelessPowerChanged:(id)a3
{
  if (![(SDStatusMonitor *)self->_monitor wirelessEnabled])
  {
    sub_100052DC0(-7, 0);
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    [(SDAirDropClient *)self notifyClientForEvent:10 withProperty:v4];
  }
}

- (void)addObservers
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"systemWillSleep:" name:@"com.apple.sharingd.SystemWillSleep" object:0];
  [v3 addObserver:self selector:"wirelessPowerChanged:" name:@"com.apple.sharingd.WirelessPowerChanged" object:0];
}

- (void)removeObservers
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];
}

- (BOOL)requireAWDL
{
  if ([(SDStatusMonitor *)self->_monitor forceAWDL]) {
    return 1;
  }
  else {
    return ![(SDStatusMonitor *)self->_monitor browseAllInterfaces];
  }
}

- (void)createSession
{
  id v3 = +[NSURLSessionConfiguration ephemeralSessionConfiguration];
  id v4 = objc_opt_new();
  if (!sub_1001B3C24() && ![(SDStatusMonitor *)self->_monitor enableDemoMode])
  {
    if ([(SDAirDropClient *)self requireAWDL])
    {
      CFStringRef v5 = @"awdl0";
      uint64_t v6 = kCFStreamPropertyBoundInterfaceIdentifier;
    }
    else
    {
      uint64_t v6 = _kCFStreamPropertyProhibitInfraWiFi;
      CFStringRef v5 = (const __CFString *)&__kCFBooleanTrue;
    }
    [v4 setObject:v5 forKeyedSubscript:v6];
    [v4 setObject:&__kCFBooleanTrue forKeyedSubscript:_kCFStreamPropertyDNSIncludeAWDL];
  }
  if (!self->_discover) {
    [v3 set_sourceApplicationSecondaryIdentifier:@"com.apple.airdrop"];
  }
  [v3 set_socketStreamProperties:v4];
  double v7 = 120.0;
  if (self->_discover) {
    double v7 = 15.0;
  }
  [v3 setTimeoutIntervalForRequest:v7];
  [v3 setRequestCachePolicy:1];
  [v3 set_connectionCachePurgeTimeout:86400.0];
  [v3 setConnectionProxyDictionary:&__NSDictionary0__struct];
  if (![(SDStatusMonitor *)self->_monitor disablePipelining] && sub_100052520())
  {
    [v3 setHTTPMaximumConnectionsPerHost:1];
    [v3 setHTTPShouldUsePipelining:1];
  }
  [v3 set_allowsTCPFastOpen:0];
  [v3 setTLSMaximumSupportedProtocol:10];
  CFStringRef v12 = @"User-Agent";
  CFStringRef v13 = @"AirDrop/1.0";
  v8 = +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
  [v3 setHTTPAdditionalHeaders:v8];

  objc_super v9 = +[NSOperationQueue mainQueue];
  v10 = +[NSURLSession sessionWithConfiguration:v3 delegate:self delegateQueue:v9];
  session = self->_session;
  self->_session = v10;
}

- (double)getTransferRate
{
  id v3 = [(NSMutableDictionary *)self->_properties objectForKeyedSubscript:kSFOperationTotalBytesKey];
  id v4 = v3;
  if (v3)
  {
    double v5 = (double)(uint64_t)[v3 longLongValue];
    double v6 = v5 / (CFAbsoluteTimeGetCurrent() - self->_startTime);
  }
  else
  {
    double v6 = -1.0;
  }

  return v6;
}

- (double)getTransferSize
{
  v2 = [(NSMutableDictionary *)self->_properties objectForKeyedSubscript:kSFOperationTotalBytesKey];
  id v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = -1.0;
  }

  return v5;
}

- (void)releaseIdleSleepAssertion
{
  if (self->_powerAssertionID)
  {
    id v3 = airdrop_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int powerAssertionID = self->_powerAssertionID;
      *(_DWORD *)buf = 67109120;
      unsigned int v12 = powerAssertionID;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Power assertion released (%d)", buf, 8u);
    }

    unsigned int v5 = self->_powerAssertionID;
    self->_unsigned int powerAssertionID = 0;
    dispatch_time_t v6 = sub_1001B1AF8(3.0);
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10006A000;
    block[3] = &unk_1008CB410;
    unsigned int v10 = v5;
    dispatch_after(v6, queue, block);
  }
  transaction = self->_transaction;
  self->_transaction = 0;
}

- (void)notifyClientForEvent:(int64_t)a3 withProperty:(void *)a4
{
  unint64_t lastEvent = self->_lastEvent;
  BOOL v5 = lastEvent > 0xA;
  uint64_t v6 = (1 << lastEvent) & 0x610;
  if (v5 || v6 == 0)
  {
    v11 = objc_opt_new();
    unsigned int v12 = v11;
    switch(a3)
    {
      case 3:
        [v11 addEntriesFromDictionary:self->_properties];
        if (self->_shouldPublishProgress)
        {
          [(NSProgress *)self->_progress setSf_transferState:2];
          double v13 = 0.0;
          v14 = self;
          uint64_t v15 = 3;
          goto LABEL_35;
        }
        break;
      case 4:
        [v11 addEntriesFromDictionary:self->_properties];
        if (self->_shouldPublishProgress)
        {
          [(NSProgress *)self->_progress setSf_transferState:4];
          [(SDAirDropClient *)self postNotificationForTransferStatus:4 progress:0.0];
        }
        uint64_t v16 = (void *)SFNodeCopyKinds();
        if ([v16 containsObject:kSFNodeKindClassroom]) {
          [(SDAirDropClient *)self cancelSendingClassroom];
        }
        else {
          [(SDAirDropClient *)self invalidate];
        }

        break;
      case 5:
        [v11 addEntriesFromDictionary:self->_properties];
        if (self->_shouldPublishProgress)
        {
          [(NSProgress *)self->_progress setSf_transferState:3];
          v17 = [v12 objectForKeyedSubscript:kSFOperationTotalBytesKey];
          -[NSProgress setTotalUnitCount:](self->_transferProgress, "setTotalUnitCount:", [v17 longLongValue]);

          transferProgress = self->_transferProgress;
          goto LABEL_38;
        }
        break;
      case 7:
        uint64_t v19 = kSFOperationBytesCopiedKey;
        [(SDAirDropClient *)self storePropertyValue:a4 forKey:kSFOperationBytesCopiedKey];
        uint64_t v20 = kSFOperationTimeRemainingKey;
        [(SDAirDropClient *)self storePropertyValue:a4 forKey:kSFOperationTimeRemainingKey];
        if (a4) {
          sub_100052630((const __CFDictionary *)self->_properties, (CFDictionaryRef)a4);
        }
        [v12 addEntriesFromDictionary:self->_properties];
        if (self->_shouldPublishProgress)
        {
          uint64_t v21 = [v12 objectForKeyedSubscript:v19];
          -[NSProgress setCompletedUnitCount:](self->_transferProgress, "setCompletedUnitCount:", [v21 longLongValue]);

          LODWORD(v21) = self->_conversionNotified;
          [(NSProgress *)self->_transferProgress fractionCompleted];
          double v23 = v22 * 100.0;
          if (v21) {
            double v23 = v23 * 0.8 + 20.0;
          }
          [(NSProgress *)self->_progress setCompletedUnitCount:(uint64_t)v23];
          progress = self->_progress;
          uint64_t v25 = [v12 objectForKeyedSubscript:v20];
          [(NSProgress *)progress setUserInfoObject:v25 forKey:NSProgressEstimatedTimeRemainingKey];

          double v13 = (double)[(NSProgress *)self->_progress completedUnitCount];
          v14 = self;
          uint64_t v15 = 7;
          goto LABEL_35;
        }
        break;
      case 9:
        [(SDAirDropClient *)self setSpotlightMetadata:self->_fileURLs];
        [v12 addEntriesFromDictionary:self->_properties];
        if (!self->_discover)
        {
          [(SDAirDropClient *)self donateTransferInteractionToDuet];
          clientBundleID = self->_clientBundleID;
          uint64_t v27 = [(NSMutableDictionary *)self->_properties objectForKeyedSubscript:kSFOperationReceiverModelNameKey];
          [(SDAirDropClient *)self getTransferRate];
          double v29 = v28;
          [(SDAirDropClient *)self getTransferSize];
          double v31 = v30;
          uint64_t v32 = [(SDStatusMonitor *)self->_monitor discoverableLevel];
          uint64_t v33 = [(NSMutableDictionary *)self->_properties objectForKeyedSubscript:kSFOperationFromShareSheet];
          sub_100045F38(clientBundleID, v27, 1, v32, (uint64_t)[v33 BOOLValueSafe], self->_discoveryMetrics, v29, v31);

          sub_10004665C(1, [(NSArray *)self->_items count]);
          v34 = +[SDServerBrowser sharedBrowser];
          [v34 incrementTransfersCompleted];
        }
        if (self->_shouldPublishProgress)
        {
          [(NSProgress *)self->_progress setSf_transferState:6];
          uint64_t v35 = [(NSProgress *)self->_progress sf_personRealName];

          if (v35)
          {
            double v13 = 0.0;
            v14 = self;
            uint64_t v15 = 9;
            goto LABEL_35;
          }
        }
        break;
      case 10:
        if (!self->_discover)
        {
          v36 = self->_clientBundleID;
          v37 = [(NSMutableDictionary *)self->_properties objectForKeyedSubscript:kSFOperationReceiverModelNameKey];
          [(SDAirDropClient *)self getTransferSize];
          double v39 = v38;
          uint64_t v40 = [(SDStatusMonitor *)self->_monitor discoverableLevel];
          v41 = [(NSMutableDictionary *)self->_properties objectForKeyedSubscript:kSFOperationFromShareSheet];
          sub_1000462E0(v36, v37, 1, (__CFError *)a4, v40, [v41 BOOLValueSafe], self->_discoveryMetrics, v39);
        }
        v42 = airdrop_log();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
          sub_10007160C();
        }

        v43 = (const void *)kCFErrorDomainSFOperation;
        CFErrorDomain Domain = CFErrorGetDomain((CFErrorRef)a4);
        if (CFEqual(v43, Domain))
        {
          uint64_t v45 = kSFOperationErrorKey;
          [v12 setObject:a4 forKeyedSubscript:kSFOperationErrorKey];
        }
        else
        {
          v46 = sub_100052DC0(-1, a4);
          uint64_t v45 = kSFOperationErrorKey;
          [v12 setObject:v46 forKeyedSubscript:kSFOperationErrorKey];
        }
        [v12 addEntriesFromDictionary:self->_properties];
        if (self->_shouldPublishProgress)
        {
          v47 = self->_progress;
          v48 = [v12 objectForKeyedSubscript:v45];
          v49 = [v48 localizedDescription];
          [(NSProgress *)v47 sf_failedWithError:v49];

          [(SDAirDropClient *)self postNotificationForTransferStatus:10 progress:0.0];
        }
        [(SDAirDropClient *)self invalidate];
        break;
      case 11:
        if (self->_shouldPublishProgress)
        {
          [(NSProgress *)self->_progress setSf_transferState:2];
          double v13 = 0.0;
          v14 = self;
          uint64_t v15 = 11;
LABEL_35:
          [(SDAirDropClient *)v14 postNotificationForTransferStatus:v15 progress:v13];
        }
        break;
      case 14:
        break;
      case 15:
        if (self->_shouldPublishProgress)
        {
          [(NSProgress *)self->_progress setSf_transferState:1];
          transferProgress = self->_progress;
LABEL_38:
          [(NSProgress *)transferProgress setCompletedUnitCount:0];
        }
        break;
      default:
        [v11 addEntriesFromDictionary:self->_properties];
        break;
    }
    self->_unint64_t lastEvent = a3;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained airDropClient:self event:a3 withResults:v12];
  }
}

- (void)postNotificationForTransferStatus:(int64_t)a3 progress:(double)a4
{
  uint64_t v6 = +[NSNumber numberWithDouble:a4];
  double v7 = [(NSProgress *)self->_progress sf_personRealName];
  uint64_t v8 = [(NSMutableDictionary *)self->_properties objectForKeyedSubscript:kSFOperationSessionIDKey];
  objc_super v9 = (void *)v8;
  if (v6) {
    BOOL v10 = v7 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (!v10 && v8 != 0)
  {
    unsigned int v12 = +[NSNotificationCenter defaultCenter];
    v15[0] = @"TransferProgress";
    v15[1] = @"RealName";
    v16[0] = v6;
    v16[1] = v7;
    v16[2] = v9;
    v15[2] = @"SessionID";
    v15[3] = @"TransferText";
    double v13 = +[NSNumber numberWithLong:a3];
    v16[3] = v13;
    v14 = +[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:4];
    [v12 postNotificationName:@"TransferUpdated" object:self userInfo:v14];
  }
}

- (void)didStartSendingAskBodyData
{
  if ([(SDStatusMonitor *)self->_monitor disableTLS]) {
    [(SDAirDropClient *)self notifyClientForEvent:3 withProperty:0];
  }
  if ([(NSMutableArray *)self->_fileURLs count]
    && ![(SDStatusMonitor *)self->_monitor disablePipelining]
    && sub_100052520())
  {
    [(SDAirDropClient *)self startZipping];
  }
}

- (void)didFinishSendingAskBodyData
{
  if (![(NSMutableArray *)self->_fileURLs count])
  {
    [(SDAirDropClient *)self releaseIdleSleepAssertion];
  }
}

- (id)whereFromInfo
{
  v2 = objc_opt_new();
  id v3 = (void *)SFNodeCopyDisplayName();
  double v4 = (void *)SFNodeCopyComputerName();
  if (v3) {
    [v2 addObject:v3];
  }
  if (v4 && ([v3 isEqualToString:v4] & 1) == 0) {
    [v2 addObject:v4];
  }

  return v2;
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6
{
  id v9 = a5;
  BOOL v10 = (void (**)(id, uint64_t))a6;
  uint64_t v11 = (uint64_t)[v9 statusCode];
  uint64_t v12 = v11;
  if (v11 <= 400)
  {
    if (v11 != 200 && v11 != 204)
    {
      if (v11 != 400) {
        goto LABEL_20;
      }
      goto LABEL_26;
    }
    CFURLRef v14 = [v9 URL];
    CFStringRef v15 = CFURLCopyStrictPath(v14, 0);

    if (!v15)
    {
      double v22 = airdrop_log();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        sub_1000716DC();
      }

LABEL_26:
      NSErrorDomain v19 = NSPOSIXErrorDomain;
      uint64_t v20 = 94;
      goto LABEL_27;
    }
    if (CFEqual(v15, @"Discover"))
    {
      if (v12 == 200)
      {
        objc_storeStrong((id *)&self->_discoverResponse, a5);
        uint64_t v16 = airdrop_log();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          v17 = [(SDAirDropClient *)self personID];
          LODWORD(v25) = 138412290;
          *(void *)((char *)&v25 + 4) = v17;
          v18 = "Got Discover response from %@";
LABEL_39:
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, v18, (uint8_t *)&v25, 0xCu);

          goto LABEL_40;
        }
        goto LABEL_40;
      }
      v24 = airdrop_log();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        sub_100071778();
      }
    }
    else if (CFEqual(v15, @"Ask"))
    {
      if (v12 == 200)
      {
        [(SDAirDropClient *)self logInterfaceUsedForSending:v9];
        objc_storeStrong((id *)&self->_askResponse, a5);
        uint64_t v16 = airdrop_log();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          v17 = [(SDAirDropClient *)self personID];
          LODWORD(v25) = 138412290;
          *(void *)((char *)&v25 + 4) = v17;
          v18 = "Got Ask response from %@";
          goto LABEL_39;
        }
LABEL_40:

        double v23 = 0;
        goto LABEL_46;
      }
      v24 = airdrop_log();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        sub_100071744();
      }
    }
    else
    {
      if (CFEqual(v15, @"Upload"))
      {
        objc_storeStrong((id *)&self->_uploadResponse, a5);
        uint64_t v16 = airdrop_log();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          v17 = [(SDAirDropClient *)self personID];
          LODWORD(v25) = 138412290;
          *(void *)((char *)&v25 + 4) = v17;
          v18 = "Got Upload response from %@";
          goto LABEL_39;
        }
        goto LABEL_40;
      }
      v24 = airdrop_log();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        sub_100071710();
      }
    }

    double v23 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:94 userInfo:0];
LABEL_46:
    CFRelease(v15);
    if (v23) {
      goto LABEL_29;
    }
    goto LABEL_47;
  }
  if (v11 <= 499)
  {
    if (v11 != 401)
    {
      if (v11 != 417) {
        goto LABEL_20;
      }
      goto LABEL_12;
    }
    [(SDAirDropClient *)self notifyClientForEvent:4 withProperty:0];
LABEL_47:
    v10[2](v10, 1);
    goto LABEL_48;
  }
  if (v11 != 500)
  {
    if (v11 != 507)
    {
LABEL_20:
      uint64_t v21 = airdrop_log();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        sub_100071674();
      }

      NSErrorDomain v19 = NSPOSIXErrorDomain;
      uint64_t v20 = 100;
      goto LABEL_27;
    }
LABEL_12:
    uint64_t v13 = sub_100052DC0(-2, 0);
    goto LABEL_28;
  }
  NSErrorDomain v19 = NSPOSIXErrorDomain;
  uint64_t v20 = 32;
LABEL_27:
  uint64_t v13 = +[NSError errorWithDomain:v19 code:v20 userInfo:0];
LABEL_28:
  double v23 = (void *)v13;
  if (!v13) {
    goto LABEL_47;
  }
LABEL_29:
  -[SDAirDropClient notifyClientForEvent:withProperty:](self, "notifyClientForEvent:withProperty:", 10, v23, v25);
  v10[2](v10, 0);

LABEL_48:
}

- (void)setProperty:(id)a3 forKey:(id)a4
{
}

- (void)storePropertyValue:(void *)a3 forKey:(__CFString *)a4
{
  CFTypeID v7 = CFGetTypeID(a3);
  if (CFHTTPMessageGetTypeID() == v7)
  {
    CFStringRef v8 = CFHTTPMessageCopyHeaderFieldValue((CFHTTPMessageRef)a3, a4);
    properties = self->_properties;
    if (v8)
    {
      CFStringRef v10 = v8;
      CFStringRef v11 = CFURLCreateStringByReplacingPercentEscapes(0, v8, &stru_1008E7020);
      sub_1001B1C40((__CFDictionary *)properties, a4, v11);
      CFRelease(v10);
    }
    else
    {
      [(NSMutableDictionary *)properties setObject:0 forKeyedSubscript:a4];
    }
  }
  else if (CFDictionaryGetTypeID() == v7)
  {
    Value = CFDictionaryGetValue((CFDictionaryRef)a3, a4);
    [(SDAirDropClient *)self setProperty:Value forKey:a4];
  }
  else
  {
    uint64_t v13 = airdrop_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_1000717AC();
    }
  }
}

- (void)storeDataValue:(__CFDictionary *)a3 forKey:(__CFString *)a4
{
  Value = CFDictionaryGetValue(a3, a4);
  if (Value && (CFTypeID TypeID = CFDataGetTypeID(), TypeID != CFGetTypeID(Value)))
  {
    CFStringRef v8 = airdrop_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100071814();
    }
  }
  else
  {
    [(SDAirDropClient *)self setProperty:Value forKey:a4];
  }
}

- (void)storeStringValue:(__CFDictionary *)a3 forKey:(__CFString *)a4
{
  Value = CFDictionaryGetValue(a3, a4);
  if (Value && (CFTypeID TypeID = CFStringGetTypeID(), TypeID != CFGetTypeID(Value)))
  {
    CFStringRef v8 = airdrop_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10007187C();
    }
  }
  else
  {
    [(SDAirDropClient *)self setProperty:Value forKey:a4];
  }
}

- (BOOL)parseAskResponse:(__CFError *)a3
{
  CFTypeID v3 = (CFTypeID)a3;
  CFPropertyListRef v5 = CFPropertyListCreateWithData(0, (CFDataRef)self->_receiverData, 0, 0, a3);
  if (v5)
  {
    uint64_t v6 = v5;
    CFTypeID v3 = CFGetTypeID(v5);
    LOBYTE(v3) = v3 == CFDictionaryGetTypeID();
    if ((_BYTE)v3)
    {
      [(SDAirDropClient *)self storeDataValue:v6 forKey:kSFOperationReceiverIconKey];
      [(SDAirDropClient *)self storeDataValue:v6 forKey:kSFOperationReceiverRecordDataKey];
      [(SDAirDropClient *)self storeStringValue:v6 forKey:kSFOperationReceiverIconHashKey];
      [(SDAirDropClient *)self storeStringValue:v6 forKey:kSFOperationReceiverModelNameKey];
      [(SDAirDropClient *)self storeStringValue:v6 forKey:kSFOperationReceiverComputerNameKey];
    }
    else
    {
      CFStringRef v8 = airdrop_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_100071950();
      }
    }
    CFRelease(v6);
  }
  else if (v3)
  {
    CFTypeID v7 = airdrop_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1000718E4();
    }

    LOBYTE(v3) = 0;
  }
  return v3;
}

- (BOOL)parseDiscoverResponse:(__CFError *)a3
{
  CFTypeID v3 = (CFTypeID)a3;
  CFPropertyListRef v5 = CFPropertyListCreateWithData(0, (CFDataRef)self->_receiverData, 0, 0, a3);
  if (v5)
  {
    uint64_t v6 = v5;
    CFTypeID v3 = CFGetTypeID(v5);
    LOBYTE(v3) = v3 == CFDictionaryGetTypeID();
    if ((_BYTE)v3)
    {
      [(SDAirDropClient *)self storeDataValue:v6 forKey:kSFOperationReceiverRecordDataKey];
      [(SDAirDropClient *)self storeDataValue:v6 forKey:kSFOperationReceiverMediaCapabilitiesKey];
      [(SDAirDropClient *)self storeStringValue:v6 forKey:kSFOperationReceiverModelNameKey];
      [(SDAirDropClient *)self storeStringValue:v6 forKey:kSFOperationReceiverComputerNameKey];
      [(SDAirDropClient *)self storeDataValue:v6 forKey:kSFOperationReceiverDeviceIRKDataKey];
      [(SDAirDropClient *)self storeDataValue:v6 forKey:kSFOperationReceiverEdPKDataKey];
      [(SDAirDropClient *)self storeStringValue:v6 forKey:kSFOperationReceiverIDSDeviceIDKey];
      [(SDAirDropClient *)self storeStringValue:v6 forKey:kSFOperationSendersKnownAliasKey];
    }
    else
    {
      CFStringRef v8 = airdrop_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_100071950();
      }
    }
    CFRelease(v6);
  }
  else if (v3)
  {
    CFTypeID v7 = airdrop_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100071984();
    }

    LOBYTE(v3) = 0;
  }
  return v3;
}

- (void)notifyClientOfBytesCopied:(id)a3 timeRemaining:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  usleep(0x186A0u);
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006B3C8;
  block[3] = &unk_1008CAF18;
  id v12 = v6;
  id v13 = v7;
  CFURLRef v14 = self;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (void)finishOperation
{
  CFTypeID v3 = sub_1001B1BE4();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006B4D8;
  block[3] = &unk_1008CA4B8;
  void block[4] = self;
  dispatch_async(v3, block);
}

- (void)retryRequestForError:(id)a3
{
  id v4 = a3;
  int v5 = self->_failCount + 1;
  self->_failCount = v5;
  if (v5 == 10 || self->_cancelled)
  {
    [(SDAirDropClient *)self notifyClientForEvent:10 withProperty:v4];
  }
  else
  {
    long double v6 = exp((double)v5);
    dispatch_time_t v7 = dispatch_time(0, (uint64_t)(v6 * 0.125 * 1000000000.0));
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10006B854;
    block[3] = &unk_1008CA4B8;
    void block[4] = self;
    dispatch_after(v7, queue, block);
  }
}

- (void)didFinishLoading
{
  CFTypeRef cf = 0;
  if (self->_askResponse)
  {
    if ([(SDAirDropClient *)self parseAskResponse:&cf])
    {
      [(SDAirDropClient *)self notifyClientForEvent:6 withProperty:0];
      if ([(NSMutableArray *)self->_fileURLs count])
      {
        if ([(SDStatusMonitor *)self->_monitor disablePipelining] || !sub_100052520())
        {
          [(SDAirDropClient *)self startZipping];
        }
        else if (!self->_zipperFinished)
        {
          self->_startTime = CFAbsoluteTimeGetCurrent();
          [(SDAirDropClient *)self notifyClientForEvent:5 withProperty:0];
        }
      }
      else
      {
        [(SDAirDropClient *)self finishOperation];
      }
    }
    else
    {
      [(SDAirDropClient *)self retryRequestForError:cf];
      CFRelease(cf);
    }
    askResponse = self->_askResponse;
    self->_askResponse = 0;
    goto LABEL_21;
  }
  if (self->_discoverResponse)
  {
    if ([(SDAirDropClient *)self parseDiscoverResponse:&cf])
    {
      [(SDAirDropClient *)self notifyClientForEvent:9 withProperty:0];
    }
    else
    {
      [(SDAirDropClient *)self retryRequestForError:cf];
      CFRelease(cf);
    }
    askResponse = self->_discoverResponse;
    self->_discoverResponse = 0;
LABEL_21:

    return;
  }
  if (self->_uploadResponse)
  {
    self->_uploadFinished = 1;
    if (self->_zipperFinished)
    {
      if (self->_startTime == 0.0) {
        [(SDAirDropClient *)self finishOperation];
      }
      else {
        [(SDAirDropClient *)self notifyClientForEvent:9 withProperty:0];
      }
    }
    uploadResponse = self->_uploadResponse;
    self->_uploadResponse = 0;
  }
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5
{
  -[NSMutableData appendData:](self->_receiverData, "appendData:", a5, a4);
  if ([(NSMutableData *)self->_receiverData length] > 0x100000)
  {
    id v6 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:27 userInfo:0];
    [(SDAirDropClient *)self notifyClientForEvent:10 withProperty:v6];
  }
}

- (void)URLSession:(id)a3 task:(id)a4 didSendBodyData:(int64_t)a5 totalBytesSent:(int64_t)a6 totalBytesExpectedToSend:(int64_t)a7
{
  id v13 = a3;
  id v12 = (NSURLSessionUploadTask *)a4;
  if (self->_askTask == v12)
  {
    if (a5 == a6)
    {
      [(SDAirDropClient *)self didStartSendingAskBodyData];
    }
    else if (a6 >= a7)
    {
      [(SDAirDropClient *)self didFinishSendingAskBodyData];
    }
  }
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v13 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = v9;
  if (!v9)
  {
    [(SDAirDropClient *)self didFinishLoading];
    goto LABEL_8;
  }
  CFStringRef v11 = [v9 domain];
  if (![v11 isEqual:NSURLErrorDomain])
  {

    goto LABEL_7;
  }
  id v12 = [v10 code];

  if (v12 != (id)-999) {
LABEL_7:
  }
    [(SDAirDropClient *)self didFail:v10];
LABEL_8:
}

- (BOOL)shouldCancelTransferForError:(id)a3
{
  id v3 = a3;
  unint64_t v4 = (unint64_t)[v3 code];
  int v5 = [v3 domain];

  if ([v5 isEqual:kCFErrorDomainCFNetwork])
  {
    BOOL v6 = v4 == 303 || v4 == -1017;
    goto LABEL_7;
  }
  if ([v5 isEqual:NSURLErrorDomain])
  {
    BOOL v6 = (v4 & 0xFFFFFFFFFFFFFFEFLL) == -1021;
LABEL_7:
    BOOL v7 = v6;
    goto LABEL_13;
  }
  unsigned __int8 v8 = [v5 isEqual:NSPOSIXErrorDomain];
  if (v4 == 54) {
    BOOL v7 = v8;
  }
  else {
    BOOL v7 = 0;
  }
LABEL_13:

  return v7;
}

- (void)didFail:(id)a3
{
  id v4 = a3;
  int v5 = (void *)SFNodeCopyServiceName();
  if (self->_discover || ![(SDAirDropClient *)self shouldCancelTransferForError:v4])
  {
    BOOL v7 = airdrop_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1000719F0();
    }

    if (self->_discover)
    {
      [(SDAirDropClient *)self retryRequestForError:v4];
      goto LABEL_20;
    }
    unsigned __int8 v8 = [v4 domain];
    if (([v8 isEqual:kCFErrorDomainCFNetwork] & 1) != 0
      || [v8 isEqual:NSURLErrorDomain])
    {
      id v9 = [v4 code];
      if (v9 == (id)-1004)
      {
        [(SDAirDropClient *)self retryRequestForError:v4];
        goto LABEL_19;
      }
      if (v9 == (id)-1202)
      {
        id v10 = (void *)SFNodeCopySecondaryName();
        if (!v10) {
          id v10 = (void *)SFNodeCopyDisplayName();
        }
        CFStringRef v11 = sub_100052DC0(-3, v10);
        [(SDAirDropClient *)self notifyClientForEvent:10 withProperty:v11];

        goto LABEL_19;
      }
    }
    [(SDAirDropClient *)self notifyClientForEvent:10 withProperty:v4];
LABEL_19:

    goto LABEL_20;
  }
  BOOL v6 = airdrop_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412546;
    id v13 = v5;
    __int16 v14 = 2112;
    id v15 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Connection to %@ canceled (%@)", (uint8_t *)&v12, 0x16u);
  }

  [(SDAirDropClient *)self notifyClientForEvent:4 withProperty:0];
LABEL_20:
}

- (void)evaluateReceiverTrust:(__SecTrust *)a3 completion:(id)a4
{
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (v6)
  {
    BOOL v7 = (void *)SFNodeCopyAppleID();
    if (v7 && (unsigned __int8 v8 = sub_100051754(a3)) != 0)
    {
      id v9 = v8;
      id v10 = [(SDStatusMonitor *)self->_monitor verifiedIdentityForAppleID:v7];
      queue = self->_queue;
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_10006C0C8;
      v12[3] = &unk_1008CB438;
      id v13 = v6;
      sub_10023070C(v9, v10, queue, v12);
    }
    else
    {
      (*((void (**)(id, BOOL))v6 + 2))(v6, v7 == 0);
    }
  }
}

- (BOOL)connectionOverP2P:(__CFData *)a3
{
  BytePtr = CFDataGetBytePtr(a3);
  if (BytePtr[1] != 30)
  {
    unsigned __int8 v8 = airdrop_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v11 = [(SDAirDropClient *)self personID];
      int v13 = 138412290;
      __int16 v14 = v11;
      int v12 = "AirDrop sending to %@ over IPv4";
LABEL_11:
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v13, 0xCu);
    }
LABEL_14:

    return 0;
  }
  unsigned int v5 = *((_DWORD *)BytePtr + 6);
  if (!v5)
  {
    unsigned __int8 v8 = airdrop_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v11 = [(SDAirDropClient *)self personID];
      int v13 = 138412290;
      __int16 v14 = v11;
      int v12 = "AirDrop sending to %@ over IPv6";
      goto LABEL_11;
    }
    goto LABEL_14;
  }
  *(void *)v17 = 0;
  uint64_t v18 = 0;
  id v6 = if_indextoname(v5, v17);
  BOOL v7 = airdrop_log();
  unsigned __int8 v8 = v7;
  if (!v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100071A8C(v5, v8);
    }
    goto LABEL_14;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [(SDAirDropClient *)self personID];
    int v13 = 138412546;
    __int16 v14 = v9;
    __int16 v15 = 2080;
    uint64_t v16 = v17;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "AirDrop sending to %@ over %s", (uint8_t *)&v13, 0x16u);
  }
  return strncasecmp(v17, "p2p", 3uLL) == 0;
}

- (void)releasePeerToPeerIfPossible:(id)a3
{
  id v4 = a3;
  if (self->_p2pRetained)
  {
    id v6 = v4;
    [v4 _CFURLResponse];
    unsigned int v5 = (const void *)CFURLResponseCopyPeerAddress();
    id v4 = v6;
    if (v5)
    {
      if (![(SDAirDropClient *)self connectionOverP2P:v5])
      {
        sub_1001B1BF0();
        self->_p2pRetained = 0;
      }
      CFRelease(v5);
      id v4 = v6;
    }
  }
}

- (void)logInterfaceUsedForSending:(id)a3
{
  [a3 _CFURLResponse];
  uint64_t v4 = CFURLResponseCopyPeerAddress();
  if (v4)
  {
    unsigned int v5 = (const void *)v4;
    [(SDAirDropClient *)self connectionOverP2P:v4];
    CFRelease(v5);
  }
}

- (__SecTrust)secTrustRef
{
  return self->_serverTrust;
}

- (void)URLSession:(id)a3 task:(id)a4 didFinishCollectingMetrics:(id)a5
{
  id v6 = a5;
  BOOL v7 = [v6 transactionMetrics];
  id v8 = [v7 count];

  if (v8 != (id)1)
  {
    id v9 = airdrop_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v27 = 134217984;
      id v28 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "NSURLSessionTaskTransactionMetrics count %lu is not expected, expecting 1", (uint8_t *)&v27, 0xCu);
    }
  }
  id v10 = [v6 transactionMetrics];
  CFStringRef v11 = [v10 firstObject];

  if (v11)
  {
    int v12 = [v11 _remoteAddressAndPort];
    if (v12)
    {
    }
    else
    {
      int v13 = [v11 _localAddressAndPort];

      if (!v13)
      {
LABEL_12:
        uint64_t v18 = [v11 secureConnectionStartDate];
        NSErrorDomain v19 = [v11 fetchStartDate];
        [v18 timeIntervalSinceDate:v19];
        uint64_t v20 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
        [(SDAirDropPeerMetric *)self->_metric setTcpConnectionComplete:v20];

        uint64_t v21 = [v11 secureConnectionEndDate];
        double v22 = [v11 secureConnectionStartDate];
        [v21 timeIntervalSinceDate:v22];
        double v23 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
        [(SDAirDropPeerMetric *)self->_metric setTlsHandshakeComplete:v23];

        v24 = [v11 responseEndDate];
        long long v25 = [v11 secureConnectionEndDate];
        [v24 timeIntervalSinceDate:v25];
        v26 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
        [(SDAirDropPeerMetric *)self->_metric setIdentityQueryComplete:v26];

        goto LABEL_13;
      }
    }
    __int16 v14 = airdrop_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v15 = [(SDAirDropClient *)self personID];
      uint64_t v16 = [v11 _localAddressAndPort];
      v17 = [v11 _remoteAddressAndPort];
      int v27 = 138412802;
      id v28 = v15;
      __int16 v29 = 2112;
      double v30 = v16;
      __int16 v31 = 2112;
      uint64_t v32 = v17;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Connected to %@ from [%@] => [%@]", (uint8_t *)&v27, 0x20u);
    }
    goto LABEL_12;
  }
LABEL_13:
}

- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5
{
  id v7 = a5;
  id v8 = [a4 protectionSpace];
  id v9 = [v8 authenticationMethod];
  if ([v9 isEqual:NSURLAuthenticationMethodServerTrust])
  {
    id v10 = [v8 serverTrust];
    if (v10)
    {
      serverTrust = self->_serverTrust;
      if (serverTrust) {
        CFRelease(serverTrust);
      }
      self->_serverTrust = (__SecTrust *)CFRetain(v10);
    }
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_10006CA5C;
    v23[3] = &unk_1008CB460;
    v23[4] = self;
    id v24 = v7;
    id v25 = v10;
    [(SDAirDropClient *)self evaluateReceiverTrust:v10 completion:v23];

    goto LABEL_21;
  }
  if ([v9 isEqual:NSURLAuthenticationMethodClientCertificate])
  {
    if (self->_identity)
    {
      int v12 = [(SDStatusMonitor *)self->_monitor copyMyAppleIDIntermediateCertificate];
      if (v12)
      {
        int v13 = v12;
        __int16 v14 = airdrop_log();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v15 = [(SDAirDropClient *)self personID];
          *(_DWORD *)buf = 138412290;
          id v28 = v15;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "SDAirDropClient: sending client certificate to %@", buf, 0xCu);
        }
        identity = self->_identity;
        v26 = v13;
        v17 = +[NSArray arrayWithObjects:&v26 count:1];
        uint64_t v18 = +[NSURLCredential credentialWithIdentity:identity certificates:v17 persistence:1];

        (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v18);
        CFRelease(v13);

        goto LABEL_21;
      }
      double v22 = [(SDStatusMonitor *)self->_monitor myAppleID];
      SFMetricsLogUnexpectedEvent();

      uint64_t v20 = airdrop_log();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        sub_100071B04(self);
      }
    }
    else
    {
      uint64_t v20 = airdrop_log();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v21 = [(SDAirDropClient *)self personID];
        *(_DWORD *)buf = 138412290;
        id v28 = v21;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "SDAirDropClient: identity not available. Sending to %@ with no Apple ID certificate", buf, 0xCu);
      }
    }

    (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
    goto LABEL_21;
  }
  NSErrorDomain v19 = airdrop_log();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
    sub_100071B88();
  }

  (*((void (**)(id, uint64_t, void))v7 + 2))(v7, 3, 0);
LABEL_21:
}

- (void)URLSession:(id)a3 task:(id)a4 needNewBodyStream:(id)a5
{
  id v8 = a3;
  id v9 = (NSURLSessionUploadTask *)a4;
  id v10 = (void (**)(id, void))a5;
  if (self->_providedStream) {
    goto LABEL_6;
  }
  if (self->_uploadTask != v9)
  {
    CFStringRef v11 = airdrop_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412290;
      __int16 v15 = v9;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "SDAirDropClient: needNewBodyStream invoked for task %@", (uint8_t *)&v14, 0xCu);
    }

    goto LABEL_6;
  }
  zipper = self->_zipper;
  if (!zipper)
  {
LABEL_6:
    v10[2](v10, 0);
    goto LABEL_7;
  }
  int v13 = [(SDAirDropFileZipper *)zipper copyReadStream];
  self->_providedStream = 1;
  ((void (**)(id, __CFReadStream *))v10)[2](v10, v13);
  if (v13) {
    CFRelease(v13);
  }
LABEL_7:
}

- (void)fileZipper:(id)a3 event:(int64_t)a4 withProperty:(void *)a5
{
  id v8 = a3;
  id v9 = v8;
  switch(a4)
  {
    case 5:
      id v14 = v8;
      [(SDAirDropClient *)self storePropertyValue:a5 forKey:kSFOperationTotalBytesKey];
      [(SDAirDropClient *)self sendRequest:@"Upload"];
      if ([(SDStatusMonitor *)self->_monitor disablePipelining]
        || (v10 = sub_100052520(), id v9 = v14, (v10 & 1) == 0))
      {
        self->_startTime = CFAbsoluteTimeGetCurrent();
        CFStringRef v11 = self;
        uint64_t v12 = 5;
        int v13 = 0;
        goto LABEL_12;
      }
      break;
    case 7:
      if (self->_startTime != 0.0)
      {
        CFStringRef v11 = self;
        uint64_t v12 = 7;
        goto LABEL_11;
      }
      break;
    case 9:
      id v14 = v8;
      self->_zipperFinished = 1;
      if (self->_uploadFinished)
      {
        if (self->_startTime == 0.0) {
          [(SDAirDropClient *)self finishOperation];
        }
        else {
          [(SDAirDropClient *)self notifyClientForEvent:9 withProperty:a5];
        }
      }
      [(SDAirDropClient *)self releaseIdleSleepAssertion];
      goto LABEL_15;
    case 10:
      CFStringRef v11 = self;
      uint64_t v12 = 10;
LABEL_11:
      int v13 = a5;
      id v14 = v9;
LABEL_12:
      [(SDAirDropClient *)v11 notifyClientForEvent:v12 withProperty:v13];
LABEL_15:
      id v9 = v14;
      break;
    default:
      break;
  }
}

- (void)bonjourResolverDidChange:(id)a3
{
  id v4 = a3;
  signed int v5 = [v4 error];
  if (v5 == -65568)
  {
    NSErrorDomain v26 = NSPOSIXErrorDomain;
    uint64_t v27 = 60;
  }
  else
  {
    if (!v5)
    {
      id v6 = [v4 url];
      serverURL = self->_serverURL;
      self->_serverURL = v6;

      id v8 = [(NSURL *)self->_serverURL host];
      id v9 = [(NSURL *)self->_serverURL port];
      char v10 = +[NSString stringWithFormat:@"[%@:%@]", v8, v9];

      double Current = CFAbsoluteTimeGetCurrent();
      uint64_t v12 = [(SDAirDropPeerMetric *)self->_metric bonjourResolveComplete];
      [v12 doubleValue];
      id v14 = +[NSNumber numberWithDouble:Current - v13];
      [(SDAirDropPeerMetric *)self->_metric setBonjourResolveComplete:v14];

      __int16 v15 = [(SDAirDropPeerMetric *)self->_metric bonjourResolveComplete];
      [v15 doubleValue];
      double v17 = v16;

      uint64_t v18 = airdrop_log();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        NSErrorDomain v19 = [(SDAirDropClient *)self personID];
        *(_DWORD *)buf = 138412546;
        double v30 = v19;
        __int16 v31 = 1024;
        LODWORD(v32) = (int)(v17 * 1000.0);
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Bonjour resolved %@ in %d ms", buf, 0x12u);
      }
      uint64_t v20 = airdrop_log();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        if (self->_discover) {
          uint64_t v21 = "Connecting to";
        }
        else {
          uint64_t v21 = "Sending to";
        }
        double v22 = [(SDAirDropClient *)self personID];
        *(_DWORD *)buf = 136315650;
        double v30 = v21;
        __int16 v31 = 2112;
        uint64_t v32 = v22;
        __int16 v33 = 2112;
        v34 = v10;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%s %@ at %@", buf, 0x20u);
      }
      double v23 = &off_1008CABA8;
      if (!self->_discover) {
        double v23 = &off_1008CAB98;
      }
      [(SDAirDropClient *)self sendRequest:*v23];
      resolver = self->_resolver;
      if (resolver)
      {
        [(SDBonjourResolver *)resolver setDelegate:0];
        [(SDBonjourResolver *)self->_resolver cancel];
        id v25 = self->_resolver;
        self->_resolver = 0;
      }
      goto LABEL_19;
    }
    NSErrorDomain v26 = NSOSStatusErrorDomain;
    uint64_t v27 = v5;
  }
  char v10 = +[NSError errorWithDomain:v26 code:v27 userInfo:0];
  id v28 = airdrop_log();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
    sub_100071D10(v4, (uint64_t)v10, v28);
  }

  [(SDAirDropClient *)self retryRequestForError:v10];
LABEL_19:
}

- (void)addHashesAndValidationRecordToRequest:(id)a3
{
  id v7 = a3;
  id v4 = [(SDStatusMonitor *)self->_monitor copyMyAppleIDSecIdentity];
  self->_identity = v4;
  if (v4)
  {
    signed int v5 = [(SDStatusMonitor *)self->_monitor myAppleIDValidationRecord];
    id v6 = [v5 objectForKeyedSubscript:@"AppleIDAccountValidationRecordData"];
    if (v6) {
      [v7 setObject:v6 forKeyedSubscript:kSFOperationSenderRecordDataKey];
    }
  }
}

- (id)askRequestClientBundleID
{
  v2 = self->_clientBundleID;
  if ([(__CFString *)v2 isEqualToString:@"com.apple.Passwords.remoteservice"])
  {

    id v3 = airdrop_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 138412290;
      CFStringRef v6 = @"com.apple.Preferences";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Ask request sender bundle ID: %@", (uint8_t *)&v5, 0xCu);
    }

    v2 = @"com.apple.Preferences";
  }

  return v2;
}

- (id)askBodyDataInFormat:(int64_t)a3
{
  int v5 = objc_opt_new();
  [(SDAirDropClient *)self addHashesAndValidationRecordToRequest:v5];
  [v5 setObject:self->_otherStuff forKeyedSubscript:kSFOperationItemsKey];
  uint64_t v6 = kSFOperationFilesKey;
  id v7 = [(NSMutableDictionary *)self->_properties objectForKeyedSubscript:kSFOperationFilesKey];
  if (v7) {
    [v5 setObject:v7 forKeyedSubscript:v6];
  }
  id v8 = [(SDStatusMonitor *)self->_monitor modelName];
  [v5 setObject:v8 forKeyedSubscript:kSFOperationSenderModelNameKey];

  uint64_t v9 = kSFOperationItemsDescriptionKey;
  char v10 = [(NSMutableDictionary *)self->_properties objectForKeyedSubscript:kSFOperationItemsDescriptionKey];
  CFStringRef v11 = [(SDAirDropClient *)self askRequestClientBundleID];
  [v5 setObject:v11 forKeyedSubscript:kSFOperationBundleIDKey];

  uint64_t v12 = [(SDStatusMonitor *)self->_monitor someComputerName];
  [v5 setObject:v12 forKeyedSubscript:kSFOperationSenderComputerNameKey];

  double v13 = (__CFString *)sub_10004FD54(0, 0);
  [v5 setObject:v13 forKeyedSubscript:kSFOperationSenderIDKey];

  if (v10) {
    [v5 setObject:v10 forKeyedSubscript:v9];
  }
  fileIcon = self->_fileIcon;
  if (fileIcon)
  {
    __int16 v15 = sub_1000D8D24(fileIcon, 0);
    [v5 setObject:v15 forKeyedSubscript:kSFOperationFileIconKey];
  }
  smallFileIcon = self->_smallFileIcon;
  if (smallFileIcon)
  {
    double v17 = sub_1000D8D24(smallFileIcon, 0);
    [v5 setObject:v17 forKeyedSubscript:kSFOperationSmallFileIconKey];
  }
  uint64_t v18 = kSFOperationConvertMediaFormatsKey;
  NSErrorDomain v19 = [(NSMutableDictionary *)self->_properties objectForKeyedSubscript:kSFOperationConvertMediaFormatsKey];
  if (v19) {
    [v5 setObject:v19 forKeyedSubscript:v18];
  }
  CFDataRef Data = CFPropertyListCreateData(0, v5, (CFPropertyListFormat)a3, 0, 0);

  return Data;
}

- (id)discoverBodyDataInFormat:(int64_t)a3
{
  int v5 = objc_opt_new();
  [(SDAirDropClient *)self addHashesAndValidationRecordToRequest:v5];
  CFDataRef Data = CFPropertyListCreateData(0, v5, (CFPropertyListFormat)a3, 0, 0);

  return Data;
}

- (void)sendRequest:(id)a3
{
  id v4 = a3;
  int v5 = +[NSData data];
  uint64_t v6 = [(NSURL *)self->_serverURL URLByAppendingPathComponent:v4 isDirectory:0];
  id v7 = +[NSMutableURLRequest requestWithURL:v6];
  [v7 setHTTPMethod:@"POST"];
  if ([v4 isEqual:@"Discover"])
  {
    unsigned int v8 = [(SDStatusMonitor *)self->_monitor enableXML];
    if (v8) {
      uint64_t v9 = 100;
    }
    else {
      uint64_t v9 = 200;
    }
    char v10 = off_1008CFA28;
    if (!v8) {
      char v10 = off_1008CFA20;
    }
    [v7 setValue:*v10 forHTTPHeaderField:@"Content-Type"];
    uint64_t v11 = [(SDAirDropClient *)self discoverBodyDataInFormat:v9];

    [v7 setValue:@"close" forHTTPHeaderField:@"Connection"];
    goto LABEL_18;
  }
  if ([v4 isEqual:@"Ask"])
  {
    if ([(SDStatusMonitor *)self->_monitor enableXML])
    {
      [v7 setValue:@"text/xml" forHTTPHeaderField:@"Content-Type"];
      uint64_t v12 = self;
      uint64_t v13 = 100;
    }
    else
    {
      [v7 setValue:@"application/octet-stream" forHTTPHeaderField:@"Content-Type"];
      uint64_t v12 = self;
      uint64_t v13 = 200;
    }
    uint64_t v11 = [(SDAirDropClient *)v12 askBodyDataInFormat:v13];

LABEL_18:
    int v5 = (void *)v11;
    goto LABEL_19;
  }
  if ([v4 isEqual:@"Upload"])
  {
    uint64_t v14 = kSFOperationTotalBytesKey;
    __int16 v15 = [(NSMutableDictionary *)self->_properties objectForKeyedSubscript:kSFOperationTotalBytesKey];
    double v16 = v15;
    if (v15)
    {
      double v17 = [v15 stringValue];
      [v7 setValue:v17 forHTTPHeaderField:v14];
    }
    uint64_t v18 = [(SDAirDropFileZipper *)self->_zipper zipCompressionType];
    if ([v18 isEqualToString:@"pkzip"])
    {
      NSErrorDomain v19 = off_1008CFA08;
    }
    else if ([v18 isEqualToString:@"dvzip"])
    {
      NSErrorDomain v19 = off_1008CFA18;
    }
    else
    {
      if (![v18 isEqualToString:@"gzip"])
      {
        NSErrorDomain v26 = airdrop_log();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT)) {
          sub_100071DC0();
        }
      }
      NSErrorDomain v19 = off_1008CFA10;
    }
    [v7 setValue:*v19 forHTTPHeaderField:@"Content-Type"];
    if ([(SDStatusMonitor *)self->_monitor disablePipelining] || (sub_100052520() & 1) == 0) {
      [v7 setValue:@"100-continue" forHTTPHeaderField:@"Expect"];
    }
    [v7 setValue:@"close" forHTTPHeaderField:@"Connection"];
  }
LABEL_19:
  if (![(SDStatusMonitor *)self->_monitor disablePipelining] && sub_100052520())
  {
    id v20 = v7;
    [v20 _CFURLRequest];
    CFURLRequestSetShouldPipelineHTTP();
    id v21 = v20;
    [v21 _CFURLRequest];
    _CFURLRequestSetShouldSkipPipelineProbe();
    [v21 _CFURLRequest];
    _CFURLRequestSetShouldPipelineNonIdempotentHTTP();
  }
  if ([v4 isEqual:@"Discover"])
  {
    double v22 = [(NSURLSession *)self->_session uploadTaskWithRequest:v7 fromData:v5];
    discoverTask = self->_discoverTask;
    self->_discoverTask = v22;
LABEL_28:

    goto LABEL_29;
  }
  if ([v4 isEqual:@"Ask"])
  {
    double v22 = [(NSURLSession *)self->_session uploadTaskWithRequest:v7 fromData:v5];
    discoverTask = self->_askTask;
    self->_askTask = v22;
    goto LABEL_28;
  }
  if ([v4 isEqual:@"Upload"])
  {
    double v22 = [(NSURLSession *)self->_session uploadTaskWithStreamedRequest:v7];
    discoverTask = self->_uploadTask;
    self->_uploadTask = v22;
    goto LABEL_28;
  }
  double v22 = 0;
LABEL_29:
  id v24 = airdrop_log();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    id v25 = [(SDAirDropClient *)self personID];
    int v27 = 138412546;
    id v28 = v4;
    __int16 v29 = 2112;
    double v30 = v25;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Sending %@ request to %@", (uint8_t *)&v27, 0x16u);
  }
  [(NSURLSessionUploadTask *)v22 resume];
}

- (void)startZipping
{
  if (!self->_zipper)
  {
    id v3 = objc_alloc_init(SDAirDropFileZipper);
    zipper = self->_zipper;
    self->_zipper = v3;

    long long v5 = *(_OWORD *)&self->_auditToken.val[4];
    v6[0] = *(_OWORD *)self->_auditToken.val;
    v6[1] = v5;
    [(SDAirDropFileZipper *)self->_zipper setAuditToken:v6];
    [(SDAirDropFileZipper *)self->_zipper setSkipReadableCheckFiles:self->_generatedFiles];
    [(SDAirDropFileZipper *)self->_zipper setDisableAdaptiveCompressionForZipping:!self->_receiverSupportsDVZip];
    [(SDAirDropFileZipper *)self->_zipper setSourceFiles:self->_fileURLs];
    [(SDAirDropFileZipper *)self->_zipper setClientPid:self->_clientPid];
    [(SDAirDropFileZipper *)self->_zipper setDelegate:self];
    [(SDAirDropFileZipper *)self->_zipper zip];
  }
}

- (BOOL)splitOutFileURLs
{
  unint64_t v3 = sub_100052484();
  id v4 = (void *)SFNodeCopyRealName();
  long long v5 = (void *)SFNodeCopyKinds();
  uint64_t v6 = +[SDAirDropLegacyHelper preprocessItems:forClientBundleID:receiverIdentifier:receiverSupportsURLs:receiverIsUnknown:](SDAirDropLegacyHelper, "preprocessItems:forClientBundleID:receiverIdentifier:receiverSupportsURLs:receiverIsUnknown:", self->_items, self->_clientBundleID, v4, v3, [v5 containsObject:kSFNodeKindUnknown]);
  if ([v6 success])
  {
    id v7 = [v6 files];

    if (v7)
    {
      fileURLs = self->_fileURLs;
      uint64_t v9 = [v6 files];
      [(NSMutableArray *)fileURLs addObjectsFromArray:v9];
    }
    char v10 = [v6 otherStuff];

    if (v10)
    {
      otherStuff = self->_otherStuff;
      uint64_t v12 = [v6 otherStuff];
      [(NSMutableArray *)otherStuff addObjectsFromArray:v12];
    }
    uint64_t v13 = [v6 filesToCleanup];

    if (v13)
    {
      filesToCleanup = self->_filesToCleanup;
      __int16 v15 = [v6 filesToCleanup];
      [(NSMutableArray *)filesToCleanup addObjectsFromArray:v15];
    }
  }
  unsigned __int8 v16 = [v6 success];

  return v16;
}

- (void)validateAirDropItemsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  if ([(NSArray *)self->_items count] && self->_items)
  {
    long long v5 = airdrop_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      NSUInteger v6 = [(NSArray *)self->_items count];
      items = self->_items;
      *(_DWORD *)buf = 134218242;
      NSUInteger v12 = v6;
      __int16 v13 = 2112;
      uint64_t v14 = items;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Validating %lu items to send: %@", buf, 0x16u);
    }
  }
  else
  {
    long long v5 = airdrop_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100071E34();
    }
  }

  if ([(NSMutableArray *)self->_fileURLs count])
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10006DE80;
    v9[3] = &unk_1008CAD20;
    v9[4] = self;
    id v10 = v4;
    [(SDAirDropClient *)self convertMediaItemsWithCompletionHandler:v9];
  }
  else if ([(NSMutableArray *)self->_otherStuff count])
  {
    (*((void (**)(id, void))v4 + 2))(v4, 0);
  }
  else
  {
    unsigned int v8 = sub_100052DC0(-4, 0);
    (*((void (**)(id, void *))v4 + 2))(v4, v8);
  }
}

- (void)appendFileURL:(id)a3 withBase:(id)a4 toItems:(id)a5
{
  id v8 = a3;
  CFURLRef v9 = (const __CFURL *)a4;
  id v10 = a5;
  id v45 = 0;
  id v44 = 0;
  unsigned int v11 = [v8 getResourceValue:&v45 forKey:NSURLNameKey error:&v44];
  id v12 = v45;
  id v13 = v44;
  if (v11)
  {
    double v38 = self;
    uint64_t v14 = objc_opt_new();
    __int16 v15 = +[NSNumber numberWithBool:sub_1001B1A10((const __CFURL *)v8)];
    [v14 setObject:v15 forKeyedSubscript:kSFOperationFileIsDirectoryKey];

    [v14 setObject:v12 forKeyedSubscript:kSFOperationFileNameKey];
    id v43 = 0;
    id v42 = 0;
    LODWORD(v15) = [v8 getResourceValue:&v43 forKey:NSURLTypeIdentifierKey error:&v42];
    unsigned __int8 v16 = (__CFString *)v43;
    id v17 = v42;

    if (!v15)
    {
      id v20 = airdrop_log();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        sub_100071F78();
      }
      goto LABEL_31;
    }
    [v14 setObject:v16 forKeyedSubscript:kSFOperationFileTypeKey];
    if (![(__CFString *)v16 isEqual:kUTTypePhotosAssetBundle])
    {
      if (([(__CFString *)v16 isEqual:kUTTypeLivePhoto] & 1) == 0
        && !UTTypeConformsTo(v16, kUTTypeLivePhoto))
      {
        goto LABEL_32;
      }
      v36 = v16;
      id v21 = airdrop_log();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT)) {
        sub_100071F38();
      }

      id v37 = [objc_alloc((Class)PFVideoComplement) initWithBundleAtURL:v8];
      double v22 = [v37 imagePath];
      double v23 = +[NSURL fileURLWithPath:v22];
      id v39 = 0;
      [v23 getResourceValue:&v39 forKey:NSURLTypeIdentifierKey error:0];
      id v24 = v39;

      LODWORD(v22) = [v24 isEqual:kUTTypeJPEG];
      id v25 = @"public.heic";
      if (v22) {
        id v25 = (__CFString *)kUTTypeJPEG;
      }
      id v20 = v25;
LABEL_29:

      if (v20)
      {
        [v14 setObject:v20 forKeyedSubscript:kSFOperationtFileSubTypeKey];
LABEL_31:
      }
LABEL_32:
      uint64_t v30 = -[NSMutableDictionary objectForKeyedSubscript:](v38->_fileURLToConversionNeeded, "objectForKeyedSubscript:", v8, v36);
      __int16 v31 = (void *)v30;
      if (v30) {
        uint64_t v32 = (void *)v30;
      }
      else {
        uint64_t v32 = &__kCFBooleanFalse;
      }
      [v14 setObject:v32 forKeyedSubscript:kSFOperationConvertMediaFormatsKey];

      __int16 v33 = sub_1001B1F9C(v8, v9);
      if (v33)
      {
        v34 = v33;
        uint64_t v35 = +[NSString stringWithUTF8String:v33];
        if (v35) {
          [v14 setObject:v35 forKeyedSubscript:kSFOperationFileBomPathKey];
        }
        free(v34);
      }
      [v10 addObject:v14];

      goto LABEL_40;
    }
    id v37 = [objc_alloc((Class)PFAssetBundle) initWithAssetBundleAtURL:v8];
    if ([v37 mediaType] == (id)2)
    {
      uint64_t v18 = [v37 fullSizeVideoURL];
      if (!v18)
      {
        NSErrorDomain v19 = [v37 videoURL];
        goto LABEL_22;
      }
    }
    else
    {
      if ([v37 mediaType] != (id)1) {
        goto LABEL_28;
      }
      uint64_t v18 = [v37 fullSizePhotoURL];
      if (!v18)
      {
        NSErrorDomain v19 = [v37 photoURL];
LABEL_22:
        NSErrorDomain v26 = v19;

        if (v26)
        {
          id v40 = 0;
          id v41 = 0;
          v36 = v26;
          unsigned __int8 v27 = [(__CFString *)v26 getResourceValue:&v41 forKey:NSURLTypeIdentifierKey error:&v40];
          id v20 = v41;
          id v28 = v40;
          if ((v27 & 1) == 0)
          {
            __int16 v29 = airdrop_log();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
              sub_100071ED0();
            }
          }
          goto LABEL_29;
        }
LABEL_28:
        id v20 = 0;
        goto LABEL_29;
      }
    }
    NSErrorDomain v19 = v18;
    uint64_t v18 = v19;
    goto LABEL_22;
  }
  uint64_t v14 = airdrop_log();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
    sub_100071FE0();
  }
  id v17 = v13;
LABEL_40:
}

- (void)removeFileIconsFromProperties
{
  uint64_t v3 = kSFOperationFileIconKey;
  id v4 = [(NSMutableDictionary *)self->_properties objectForKeyedSubscript:kSFOperationFileIconKey];
  self->_fileIcon = v4;

  uint64_t v5 = kSFOperationSmallFileIconKey;
  NSUInteger v6 = [(NSMutableDictionary *)self->_properties objectForKeyedSubscript:kSFOperationSmallFileIconKey];
  self->_smallFileIcon = v6;

  fileIcon = self->_fileIcon;
  if (fileIcon)
  {
    CFRetain(fileIcon);
    [(NSMutableDictionary *)self->_properties setObject:0 forKeyedSubscript:v3];
  }
  smallFileIcon = self->_smallFileIcon;
  if (smallFileIcon)
  {
    CFRetain(smallFileIcon);
    properties = self->_properties;
    [(NSMutableDictionary *)properties setObject:0 forKeyedSubscript:v5];
  }
}

- (void)startPublishingProgress
{
  if (!self->_progress)
  {
    if (self->_clientBundleID)
    {
      uint64_t v3 = [(SDAirDropClient *)self personID];

      if (v3)
      {
        id v4 = [(NSMutableDictionary *)self->_properties objectForKeyedSubscript:kSFOperationSessionIDKey];
        if (v4)
        {
          id location = 0;
          objc_initWeak(&location, self);
          id v5 = objc_alloc((Class)NSProgress);
          clientBundleID = self->_clientBundleID;
          id v7 = [(SDAirDropClient *)self personID];
          [v5 sf_initWithAppBundle:clientBundleID sessionID:v4 andPersonRealName:v7];
          id v8 = (NSProgress *)objc_claimAutoreleasedReturnValue();
          progress = self->_progress;
          self->_progress = v8;

          [(NSProgress *)self->_progress setTotalUnitCount:100];
          unsigned int v11 = _NSConcreteStackBlock;
          uint64_t v12 = 3221225472;
          id v13 = sub_10006E8F4;
          uint64_t v14 = &unk_1008CA3B0;
          objc_copyWeak(&v15, &location);
          [(NSProgress *)self->_progress setCancellationHandler:&v11];
          [(NSProgress *)self->_progress _publish];
          objc_destroyWeak(&v15);
          objc_destroyWeak(&location);
        }
        else
        {
          id v10 = airdrop_log();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
            sub_100072048();
          }
        }
      }
    }
  }
}

- (void)startSendingClassroom
{
  fileIcon = self->_fileIcon;
  properties = self->_properties;
  uint64_t v5 = kSFOperationFileIconKey;
  if (fileIcon)
  {
    [(NSMutableDictionary *)properties setObject:fileIcon forKeyedSubscript:kSFOperationFileIconKey];
  }
  else
  {
    NSUInteger v6 = [(NSMutableDictionary *)properties objectForKeyedSubscript:kSFOperationFileIconKey];
    [(NSMutableDictionary *)self->_properties setObject:v6 forKeyedSubscript:v5];
  }
  uint64_t v7 = kSFOperationSessionIDKey;
  id v8 = [(NSMutableDictionary *)self->_properties objectForKeyedSubscript:kSFOperationSessionIDKey];
  if (v8)
  {
    [(NSMutableDictionary *)self->_properties setObject:v8 forKeyedSubscript:v7];
  }
  else
  {
    CFURLRef v9 = objc_opt_new();
    id v10 = [v9 UUIDString];
    [(NSMutableDictionary *)self->_properties setObject:v10 forKeyedSubscript:v7];
  }
  id v11 = [(NSMutableArray *)self->_otherStuff count];
  uint64_t v12 = 184;
  if (!v11) {
    uint64_t v12 = 112;
  }
  id v13 = *(id *)((char *)&self->super.isa + v12);
  id v18 = +[SDClassroomBrowser sharedBrowser];
  uint64_t v14 = self->_properties;
  id v15 = [(SDAirDropClient *)self personID];
  clientBundleID = self->_clientBundleID;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [v18 startSendingItems:v13 withProperties:v14 toPersonWithID:v15 clientBundleID:clientBundleID airDropClientDelegate:WeakRetained];
}

- (void)cancelSendingClassroom
{
  id v5 = [(NSMutableDictionary *)self->_properties objectForKeyedSubscript:kSFOperationSessionIDKey];
  uint64_t v3 = +[SDClassroomBrowser sharedBrowser];
  id v4 = [(SDAirDropClient *)self personID];
  [v3 cancelSendingItemsToPersonWithID:v4 sessionID:v5 clientBundleID:self->_clientBundleID];
}

- (void)startSending
{
  uint64_t v3 = (void *)SFNodeCopyKinds();
  unsigned __int8 v4 = [v3 containsObject:kSFNodeKindClassroom];
  unsigned __int8 v5 = v4;
  if (!self->_shouldPublishProgress || (v4 & 1) != 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained startProgress];
  }
  else
  {
    [(SDAirDropClient *)self startPublishingProgress];
  }
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10006EC38;
  v7[3] = &unk_1008CB488;
  v7[4] = self;
  unsigned __int8 v8 = v5;
  [(SDAirDropClient *)self validateAirDropItemsWithCompletionHandler:v7];
}

- (void)activate
{
  [(SDXPCHelperConnection *)self->_xpcHelperConnection activate];
  [(SDAirDropClient *)self createSession];
  if (self->_discover)
  {
    [(SDAirDropClient *)self resolve];
  }
  else if ([(SDAirDropClient *)self splitOutFileURLs])
  {
    if ([(NSMutableArray *)self->_fileURLs count])
    {
      id v3 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSMutableArray count](self->_fileURLs, "count")];
      long long v19 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      unsigned __int8 v4 = self->_fileURLs;
      id v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v19 objects:v25 count:16];
      if (v5)
      {
        id v6 = v5;
        uint64_t v7 = *(void *)v20;
        do
        {
          for (i = 0; i != v6; i = (char *)i + 1)
          {
            if (*(void *)v20 != v7) {
              objc_enumerationMutation(v4);
            }
            CFURLRef v9 = +[NSFileAccessIntent readingIntentWithURL:*(void *)(*((void *)&v19 + 1) + 8 * i) options:131074];
            [v3 addObject:v9];
          }
          id v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v19 objects:v25 count:16];
        }
        while (v6);
      }

      id v10 = airdrop_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        id v11 = [(SDAirDropClient *)self personID];
        *(_DWORD *)buf = 138412290;
        id v24 = v11;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Starting file coordination for %@", buf, 0xCu);
      }
      id v12 = [objc_alloc((Class)NSFileCoordinator) initWithFilePresenter:0];
      id v13 = +[NSOperationQueue mainQueue];
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_10006F31C;
      v16[3] = &unk_1008CB4B0;
      id v17 = v3;
      id v18 = self;
      id v14 = v3;
      [v12 coordinateAccessWithIntents:v14 queue:v13 byAccessor:v16];
    }
    else
    {
      [(SDAirDropClient *)self startSending];
    }
  }
  else
  {
    id v15 = airdrop_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_1000720F8();
    }
  }
}

- (void)resolve
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained)
  {
    id v8 = (id)SFNodeCopyDomain();
    unsigned __int8 v4 = (void *)SFNodeCopyServiceName();
    id v5 = +[NSNumber numberWithDouble:CFAbsoluteTimeGetCurrent()];
    [(SDAirDropPeerMetric *)self->_metric setBonjourResolveComplete:v5];

    id v6 = [[SDBonjourResolver alloc] initWithName:v4 type:sub_1000D94A0() domain:v8 path:0 timeout:1];
    resolver = self->_resolver;
    self->_resolver = v6;

    [(SDBonjourResolver *)self->_resolver setDelegate:self];
    [(SDBonjourResolver *)self->_resolver resolve];
  }
}

- (BOOL)send
{
  if (self->_transactionStarted || self->_cancelled) {
    return 0;
  }
  unsigned __int8 v4 = (void *)SFNodeCopyComputerName();
  id v5 = airdrop_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    id v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Start transaction to \"%@\"", (uint8_t *)&v11, 0xCu);
  }

  self->_transactionStarted = 1;
  [(SDStatusMonitor *)self->_monitor airDropTransactionBegin:1];
  id v6 = +[SDServerBrowser sharedBrowser];
  [v6 incrementTransfersInitiated];

  uint64_t v7 = (OS_os_transaction *)os_transaction_create();
  transaction = self->_transaction;
  self->_transaction = v7;

  self->_unsigned int powerAssertionID = sub_100052784();
  CFURLRef v9 = airdrop_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int powerAssertionID = self->_powerAssertionID;
    int v11 = 67109120;
    LODWORD(v12) = powerAssertionID;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Power assertion retained (%d)", (uint8_t *)&v11, 8u);
  }

  [(SDAirDropClient *)self notifyClientForEvent:11 withProperty:0];
  [(SDAirDropClient *)self resolve];

  return 1;
}

- (NSString)personID
{
  v2 = (void *)SFNodeCopyRealName();

  return (NSString *)v2;
}

- (void)invalidate
{
  self->_cancelled = 1;
  [(NSURLSessionUploadTask *)self->_askTask cancel];
  askTask = self->_askTask;
  self->_askTask = 0;

  [(NSURLSessionUploadTask *)self->_uploadTask cancel];
  uploadTask = self->_uploadTask;
  self->_uploadTask = 0;

  [(NSURLSessionUploadTask *)self->_discoverTask cancel];
  discoverTask = self->_discoverTask;
  self->_discoverTask = 0;

  [(NSURLSession *)self->_session finishTasksAndInvalidate];
  session = self->_session;
  self->_session = 0;

  [(SDAirDropFileZipper *)self->_zipper setDelegate:0];
  [(SDAirDropFileZipper *)self->_zipper stop];
  zipper = self->_zipper;
  self->_zipper = 0;

  [(SDBonjourResolver *)self->_resolver setDelegate:0];
  [(SDBonjourResolver *)self->_resolver cancel];
  resolver = self->_resolver;
  self->_resolver = 0;

  [(SDXPCHelperConnection *)self->_xpcHelperConnection invalidate];
  xpcHelperConnection = self->_xpcHelperConnection;
  self->_xpcHelperConnection = 0;

  if (self->_personAdded)
  {
    id v10 = +[SDConnectedBrowser sharedBrowser];
    [v10 removeAirDropPerson:self->_person];

    self->_personAdded = 0;
  }
  filesToCleanup = self->_filesToCleanup;
  if (filesToCleanup)
  {
    long long v38 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v35 = 0u;
    id v12 = filesToCleanup;
    id v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v35 objects:v43 count:16];
    if (v13)
    {
      id v15 = v13;
      id v16 = 0;
      uint64_t v17 = *(void *)v36;
      *(void *)&long long v14 = 138412546;
      long long v31 = v14;
      do
      {
        id v18 = 0;
        long long v19 = v16;
        do
        {
          if (*(void *)v36 != v17) {
            objc_enumerationMutation(v12);
          }
          CFURLRef v20 = *(const __CFURL **)(*((void *)&v35 + 1) + 8 * (void)v18);
          id v34 = v19;
          BOOL v21 = sub_1001B2CB8(v20, &v34);
          id v16 = v34;

          if (!v21)
          {
            long long v22 = airdrop_log();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v31;
              CFURLRef v40 = v20;
              __int16 v41 = 2112;
              id v42 = v16;
              _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "SDAirDropClient: removeObjectAtURL(%@) failed %@", buf, 0x16u);
            }
          }
          id v18 = (char *)v18 + 1;
          long long v19 = v16;
        }
        while (v15 != v18);
        id v15 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v35 objects:v43 count:16];
      }
      while (v15);
    }
    else
    {
      id v16 = 0;
    }

    double v23 = self->_filesToCleanup;
    self->_filesToCleanup = 0;
  }
  [(PHMediaFormatConversionManager *)self->_conversionManager invalidate];
  conversionManager = self->_conversionManager;
  self->_conversionManager = 0;

  if (self->_p2pRetained)
  {
    double v25 = 1.5;
    dispatch_time_t v26 = sub_1001B1AF8(1.5);
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10006FAD8;
    block[3] = &unk_1008CA4B8;
    void block[4] = self;
    dispatch_after(v26, queue, block);
    self->_p2pRetained = 0;
  }
  else
  {
    double v25 = 0.0;
    if (!self->_queueSuspended) {
      goto LABEL_23;
    }
    sub_1000501E4(self);
    id v28 = sub_10004FCC0();
    dispatch_resume(v28);
  }
  self->_queueSuspended = 0;
LABEL_23:
  if (self->_transactionStarted)
  {
    self->_transactionStarted = 0;
    dispatch_time_t v29 = sub_1001B1AF8(v25);
    uint64_t v30 = self->_queue;
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_10006FB30;
    v32[3] = &unk_1008CA4B8;
    v32[4] = self;
    dispatch_after(v29, v30, v32);
  }
  [(SDAirDropClient *)self releaseIdleSleepAssertion];
}

- (void)generatePreviewForFileURL:(id)a3
{
  id v3 = a3;
  v63[4] = 0;
  CFErrorRef error = 0;
  v63[0] = _NSConcreteStackBlock;
  v63[1] = 3221225472;
  v63[2] = sub_100070490;
  v63[3] = &unk_1008CB370;
  unsigned __int8 v4 = objc_retainBlock(v63);
  id propertyValueTypeRefPtr = 0;
  if (CFURLCopyResourcePropertyForKey((CFURLRef)v3, kCFURLTypeIdentifierKey, &propertyValueTypeRefPtr, &error))
  {
    v52 = [v3 pathExtension];
    int v5 = SFIsCalendarEvent();
    if (([(NSString *)self->_clientBundleID isEqual:@"com.apple.mobilephone"] & 1) != 0
      || ([(NSString *)self->_clientBundleID isEqual:@"com.apple.MobileAddressBook"] & 1) != 0)
    {
      int v6 = 0;
    }
    else
    {
      int v6 = SFIsContact();
    }
    if ((v5 | v6))
    {
      id v61 = 0;
      v50 = +[NSData dataWithContentsOfURL:v3 options:0 error:&v61];
      id v51 = v61;
      if (!v50)
      {
        BOOL v21 = airdrop_log();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
          sub_100072264();
        }
        goto LABEL_66;
      }
      uint64_t v49 = kSFOperationItemsDescriptionKey;
      uint64_t v7 = -[NSMutableDictionary objectForKeyedSubscript:](self->_properties, "objectForKeyedSubscript:");
      id v8 = v7;
      if (v5)
      {
        id v9 = [objc_alloc((Class)EKEventStore) initWithOptions:16 path:@":memory:"];
        id v10 = [v9 defaultCalendarForNewEvents];
        int v11 = [v9 importICSData:v50 intoCalendar:v10 options:0];
        v48 = v9;

        long long v59 = 0u;
        long long v60 = 0u;
        long long v57 = 0u;
        long long v58 = 0u;
        id v12 = v11;
        id v13 = [v12 countByEnumeratingWithState:&v57 objects:v71 count:16];
        if (v13)
        {
          uint64_t v14 = *(void *)v58;
          while (2)
          {
            for (i = 0; i != v13; i = (char *)i + 1)
            {
              if (*(void *)v58 != v14) {
                objc_enumerationMutation(v12);
              }
              if (v8)
              {
                id v16 = *(void **)(*((void *)&v57 + 1) + 8 * i);
                uint64_t v17 = [v16 title];
                if (v17)
                {
                  id v18 = [v16 startDate];
                  BOOL v19 = v18 == 0;

                  if (!v19)
                  {
                    v70[0] = v8;
                    v69[0] = @"SFAirDropActivitySubjectMain";
                    v69[1] = @"SFAirDropActivitySubjectEventTitle";
                    dispatch_time_t v26 = [v16 title];
                    v70[1] = v26;
                    v69[2] = @"SFAirDropActivitySubjectEventStartDate";
                    unsigned __int8 v27 = [v16 startDate];
                    id v28 = SFDateToStringRFC3339();
                    v70[2] = v28;
                    v69[3] = @"SFAirDropActivitySubjectEventIsAllDay";
                    dispatch_time_t v29 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v16 isAllDay]);
                    v70[3] = v29;
                    CFURLRef v20 = +[NSDictionary dictionaryWithObjects:v70 forKeys:v69 count:4];

                    goto LABEL_30;
                  }
                }
              }
            }
            id v13 = [v12 countByEnumeratingWithState:&v57 objects:v71 count:16];
            if (v13) {
              continue;
            }
            break;
          }
        }
        CFURLRef v20 = 0;
LABEL_30:

        uint64_t v30 = 0;
        goto LABEL_51;
      }
      if (!v6)
      {
        CFURLRef v20 = 0;
        uint64_t v30 = 0;
LABEL_53:
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_properties, "setObject:forKeyedSubscript:", v8, v49, v47);
        id v39 = v30;
        BOOL v21 = v39;
        if (v39)
        {
          CFURLRef v40 = sub_1000D8E98((uint64_t)[v39 CGImage], 0x20000);
          CFDataRef v41 = v40;
          if (v40)
          {
            v55[0] = _NSConcreteStackBlock;
            v55[1] = 3221225472;
            v55[2] = sub_1000704A0;
            v55[3] = &unk_1008CB370;
            v55[4] = v40;
            uint64_t v42 = objc_retainBlock(v55);
            CGImageRef v43 = sub_1000D8A7C(v41);
            CGImageRef v44 = v43;
            if (v43)
            {
              v54[0] = _NSConcreteStackBlock;
              v54[1] = 3221225472;
              v54[2] = sub_1000704A8;
              v54[3] = &unk_1008CB370;
              v54[4] = v43;
              id v45 = objc_retainBlock(v54);
              [(NSMutableDictionary *)self->_properties setObject:v44 forKeyedSubscript:kSFOperationFileIconKey];
              ((void (*)(void *))v45[2])(v45);
            }
            else
            {
              v46 = airdrop_log();
              if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
                sub_100072300();
              }

              [(NSMutableDictionary *)self->_properties setObject:0 forKeyedSubscript:kSFOperationFileIconKey];
            }
            (*(void (**)(uint64_t))(v42 + 16))(v42);
          }
          else
          {
            uint64_t v42 = airdrop_log();
            if (os_log_type_enabled((os_log_t)v42, OS_LOG_TYPE_ERROR)) {
              sub_1000722CC();
            }
          }
        }
        else
        {
          [(NSMutableDictionary *)self->_properties setObject:0 forKeyedSubscript:kSFOperationFileIconKey];
        }

LABEL_66:
        goto LABEL_67;
      }

      id v56 = v51;
      v48 = +[CNContactVCardSerialization contactsWithData:v50 error:&v56];
      id v47 = v56;

      long long v22 = (char *)[v48 count];
      if (!v22)
      {
        id v12 = airdrop_log();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          long long v31 = [v47 localizedDescription];
          sub_100072334(v31, &buf, v12);
        }
        uint64_t v30 = 0;
        CFURLRef v20 = 0;
        id v8 = 0;
        goto LABEL_50;
      }
      id v12 = [v48 firstObject];
      double v23 = +[CNContactFormatter stringFromContact:v12 style:0];
      id v8 = v23;
      if (!v23)
      {
        uint64_t v30 = 0;
        CFURLRef v20 = 0;
LABEL_49:

LABEL_50:
        id v51 = v47;
LABEL_51:

        if (v20)
        {
          long long v37 = +[NSJSONSerialization dataWithJSONObject:v20 options:0 error:0];
          id v38 = [objc_alloc((Class)NSString) initWithData:v37 encoding:4];

          id v8 = v38;
        }
        goto LABEL_53;
      }
      id v24 = v23;
      if ((unint64_t)v22 < 2)
      {
        CFURLRef v20 = 0;
      }
      else
      {
        v67[0] = @"SFAirDropActivitySubjectMain";
        v67[1] = @"SFAirDropActivitySubjectOtherContactsCount";
        v68[0] = v24;
        double v25 = +[NSNumber numberWithUnsignedInteger:v22 - 1];
        v68[1] = v25;
        CFURLRef v20 = +[NSDictionary dictionaryWithObjects:v68 forKeys:v67 count:2];
      }
      uint64_t v32 = -[SDXPCHelperConnection monogramImageDataForContact:style:diameter:monogramsAsFlatImages:isContactImage:](self->_xpcHelperConnection, "monogramImageDataForContact:style:diameter:monogramsAsFlatImages:isContactImage:", v12, 2, 1, 0, 70.0, v47);
      if (v32)
      {
        __int16 v33 = (const void *)SFCreateCGImageFromData();
        uint64_t v30 = 0;
        for (char j = 1; v33 && (j & 1) != 0; char j = 0)
        {
          uint64_t v35 = +[UIImage imageWithCGImage:v33];

          CFRelease(v33);
          uint64_t v30 = (void *)v35;
        }
        if (v30) {
          goto LABEL_48;
        }
        long long v36 = airdrop_log();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
          sub_1000723CC(&buf, v66, v36);
        }
      }
      else
      {
        long long v36 = airdrop_log();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
          sub_10007238C(&buf, v66, v36);
        }
      }

      uint64_t v30 = 0;
LABEL_48:

      goto LABEL_49;
    }
  }
  else
  {
    v52 = airdrop_log();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR)) {
      sub_1000721F8();
    }
  }
LABEL_67:

  ((void (*)(void *))v4[2])(v4);
}

- (void)convertMediaItemsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  uint64_t v14 = [(SDAirDropClient *)self receiverMediaCapabilities];
  unsigned int v13 = sub_100052554();
  unsigned int v12 = sub_1000525D4();
  char v5 = sub_100052588();
  fileURLs = self->_fileURLs;
  clientBundleID = self->_clientBundleID;
  conversionManager = self->_conversionManager;
  queue = self->_queue;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100070618;
  v17[3] = &unk_1008CB4D8;
  v17[4] = self;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100070730;
  v15[3] = &unk_1008CB528;
  void v15[4] = self;
  id v16 = v4;
  id v10 = v4;
  LOBYTE(v11) = v5;
  +[SDAirDropLegacyHelper convertMediaItemsWithFileURLs:fileURLs clientBundleID:clientBundleID conversionManager:conversionManager mediaCapabilities:v14 supportsLivePhoto:v13 supportsAssetBundles:v12 supportsWideGamut:v11 queue:queue progressHandler:v17 completionHandler:v15];
}

- (id)receiverMediaCapabilities
{
  id v3 = (void *)SFNodeCopyMediaCapabilities();
  if (v3)
  {
    id v4 = [objc_alloc((Class)PFMediaCapabilities) initWithOpaqueRepresentation:v3];
    if ([(SDAirDropClient *)self receiverDeviceModelNameSuggestsMacPlatform])
    {
      uint64_t v7 = PFMediaCapabilitiesOutOfBandHintsPlatformKey;
      id v8 = &off_1009026E8;
      char v5 = +[NSDictionary dictionaryWithObjects:&v8 forKeys:&v7 count:1];
      [v4 setOutOfBandHints:v5];
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (BOOL)receiverDeviceModelNameSuggestsMacPlatform
{
  v2 = (void *)SFNodeCopyModel();
  id v3 = v2;
  if (v2)
  {
    id v4 = [v2 lowercaseString];
    unsigned __int8 v5 = [v4 containsString:@"mac"];
  }
  else
  {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  unsigned int v13 = +[NSThread mainThread];

  if (v13)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v14 = v11;
      if (!self->_conversionNotified)
      {
        self->_conversionNotified = 1;
        [(SDAirDropClient *)self notifyClientForEvent:15 withProperty:0];
      }
      [v14 fractionCompleted];
      [(NSProgress *)self->_progress setCompletedUnitCount:(uint64_t)(v15 * 100.0 * 0.2)];
      [(SDAirDropClient *)self postNotificationForTransferStatus:15 progress:(double)[(NSProgress *)self->_progress completedUnitCount]];
    }
  }
  else
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100070DE4;
    block[3] = &unk_1008CA270;
    void block[4] = self;
    id v17 = v10;
    id v18 = v11;
    id v19 = v12;
    CFURLRef v20 = a6;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)donateTransferInteractionToDuet
{
  id v3 = objc_alloc_init((Class)_CDInteraction);
  [v3 setBundleId:self->_clientBundleID];
  [v3 setTargetBundleId:UIActivityTypeAirDrop];
  [v3 setDirection:1];
  [v3 setMechanism:13];
  id v4 = +[NSDate date];
  [v3 setEndDate:v4];

  id v5 = objc_alloc((Class)_CDContact);
  int v6 = (void *)SFNodeCopyAppleID();
  uint64_t v7 = (void *)SFNodeCopyDisplayName();
  id v8 = (void *)SFNodeCopyContactIdentifier();
  id v9 = [v5 initWithIdentifier:v6 type:2 displayName:v7 personId:v8 personIdType:3];

  dispatch_time_t v29 = v9;
  id v41 = v9;
  id v10 = +[NSArray arrayWithObjects:&v41 count:1];
  long long v31 = v3;
  [v3 setRecipients:v10];

  id v34 = objc_opt_new();
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  uint64_t v30 = self;
  obchar j = self->_fileURLs;
  id v11 = [(NSMutableArray *)obj countByEnumeratingWithState:&v35 objects:v40 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v36;
    CFStringRef v14 = kUTTagClassFilenameExtension;
    do
    {
      double v15 = 0;
      id v32 = v12;
      do
      {
        if (*(void *)v36 != v13) {
          objc_enumerationMutation(obj);
        }
        id v16 = *(void **)(*((void *)&v35 + 1) + 8 * (void)v15);
        id v17 = objc_alloc_init((Class)_CDAttachment);
        id v18 = [v16 pathExtension];
        PreferredIdentifierForTag = (__CFString *)UTTypeCreatePreferredIdentifierForTag(v14, v18, 0);
        [v17 setUti:PreferredIdentifierForTag];
        if ([(__CFString *)v18 isEqualToString:@"txt"])
        {
          CFStringRef v20 = v14;
          BOOL v21 = [v16 path];
          long long v22 = +[NSString stringWithContentsOfFile:v21 encoding:4 error:0];

          if (v22) {
            [v17 setContentText:v22];
          }

          CFStringRef v14 = v20;
          id v12 = v32;
        }
        [v34 addObject:v17];

        double v15 = (char *)v15 + 1;
      }
      while (v12 != v15);
      id v12 = [(NSMutableArray *)obj countByEnumeratingWithState:&v35 objects:v40 count:16];
    }
    while (v12);
  }

  if ([(NSMutableArray *)v30->_otherStuff count])
  {
    unint64_t v23 = 0;
    do
    {
      id v24 = [(NSMutableArray *)v30->_otherStuff objectAtIndexedSubscript:v23];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        double v25 = +[NSURL URLWithString:v24];
        if (v25)
        {
          id v26 = objc_alloc_init((Class)_CDAttachment);
          [v26 setContentURL:v25];
          [v26 setUti:kUTTypeURL];
          [v34 addObject:v26];
        }
      }

      ++v23;
    }
    while ((unint64_t)[(NSMutableArray *)v30->_otherStuff count] > v23);
  }
  [v31 setAttachments:v34];
  unsigned __int8 v27 = +[_CDInteractionRecorder interactionRecorder];
  id v39 = v31;
  id v28 = +[NSArray arrayWithObjects:&v39 count:1];
  [v27 recordInteractions:v28 completionHandler:&stru_1008CB548];
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
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setClientBundleID:(id)a3
{
}

- (NSDictionary)discoveryMetrics
{
  return (NSDictionary *)objc_getProperty(self, a2, 424, 1);
}

- (void)setDiscoveryMetrics:(id)a3
{
}

- (BOOL)shouldPublishProgress
{
  return self->_shouldPublishProgress;
}

- (void)setShouldPublishProgress:(BOOL)a3
{
  self->_shouldPublishProgress = a3;
}

- (SDAirDropClientDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SDAirDropClientDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_discoveryMetrics, 0);
  objc_storeStrong((id *)&self->_zipper, 0);
  objc_storeStrong((id *)&self->_xpcHelperConnection, 0);
  objc_storeStrong((id *)&self->_filesToCleanup, 0);
  objc_storeStrong((id *)&self->_uploadTask, 0);
  objc_storeStrong((id *)&self->_uploadResponse, 0);
  objc_storeStrong((id *)&self->_transferProgress, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_tmpDirectoryToCleanUp, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_serverURL, 0);
  objc_storeStrong((id *)&self->_sendingLivePhotoJPEGs, 0);
  objc_storeStrong((id *)&self->_resolver, 0);
  objc_storeStrong((id *)&self->_receiverData, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_otherStuff, 0);
  objc_storeStrong((id *)&self->_monitor, 0);
  objc_storeStrong((id *)&self->_metric, 0);
  objc_storeStrong((id *)&self->_mediaFormatConversionDestinations, 0);
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_generatedFiles, 0);
  objc_storeStrong((id *)&self->_fileURLToConversionNeeded, 0);
  objc_storeStrong((id *)&self->_fileURLs, 0);
  objc_storeStrong((id *)&self->_discoverTask, 0);
  objc_storeStrong((id *)&self->_discoverResponse, 0);
  objc_storeStrong((id *)&self->_conversionProgress, 0);
  objc_storeStrong((id *)&self->_conversionManager, 0);
  objc_storeStrong((id *)&self->_connectionKey, 0);
  objc_storeStrong((id *)&self->_clientBundleID, 0);
  objc_storeStrong((id *)&self->_askTask, 0);

  objc_storeStrong((id *)&self->_askResponse, 0);
}

@end