@interface SDAirDropConnection
+ (id)disambiguatedModelName;
+ (id)fileInfoExpectedClassForKeyMap;
+ (id)validatedFileInfo:(id)a3;
+ (id)validatedFilesArray:(id)a3;
+ (id)validatedItemsArray:(id)a3;
- (BOOL)accept;
- (BOOL)allowAskRequestFromPerson:(__SFNode *)a3;
- (BOOL)contactsOnly;
- (BOOL)oneHundredContinue:(_CFHTTPServerRequest *)a3;
- (BOOL)senderInfoAvailable;
- (BOOL)senderIsBlocked;
- (BOOL)senderIsMe;
- (BOOL)senderIsTrusted:(id)a3;
- (BOOL)shouldExtractMediaFromPhotosBundles;
- (BOOL)startReceivingBody:(_CFHTTPServerRequest *)a3 error:(id *)a4;
- (BOOL)startReceivingFile:(_CFHTTPServerRequest *)a3 error:(id *)a4;
- (BOOL)thereIsEnoughFreeSpace;
- (BOOL)transferContainsPhotosAssetBundles;
- (BOOL)transferIsOverPrebufferLimit;
- (NSString)sessionID;
- (NSURL)destination;
- (SDAirDropConnection)initWithConnection:(_CFHTTPServerConnection *)a3;
- (SDAirDropConnectionDelegate)delegate;
- (__SFNode)createPersonForAskRequest;
- (double)getTransferRate;
- (double)getTransferSize;
- (id)compressionType;
- (id)whereFromInfo;
- (int64_t)getStatusCode:(_CFHTTPServerResponse *)a3;
- (void)addObservers;
- (void)adjustPropertiesForAutoAcceptSenderIsMe:(BOOL)a3;
- (void)adjustPropertiesForPhotosBundles;
- (void)cancelAndDecline;
- (void)convertURLStringsToURLs;
- (void)dealloc;
- (void)didCloseConnection;
- (void)didFailToSendResponse:(_CFHTTPServerResponse *)a3;
- (void)didReceiveError:(__CFError *)a3;
- (void)didReceiveRequest:(_CFHTTPServerRequest *)a3;
- (void)didSendResponse:(_CFHTTPServerResponse *)a3 forRequest:(_CFHTTPServerRequest *)a4;
- (void)enqueueBadResponseForRequest:(_CFHTTPServerRequest *)a3;
- (void)enqueueResponse:(_CFHTTPServerRequest *)a3 code:(int64_t)a4 body:(__CFData *)a5;
- (void)fileZipper:(id)a3 event:(int64_t)a4 withProperty:(void *)a5;
- (void)finishOperation;
- (void)handleAskRequest;
- (void)handleClosedConnection;
- (void)handleDiscoverRequest;
- (void)handleReadStreamEvent:(__CFReadStream *)a3 event:(unint64_t)a4;
- (void)handleTerminalCallBack;
- (void)logSenderIsBlocked;
- (void)makeDestinationDirectory;
- (void)notifyClient:(int64_t)a3 withResults:(id)a4;
- (void)notifyClientForEvent:(int64_t)a3;
- (void)notifyClientOfBytesCopied:(id)a3 timeRemaining:(id)a4;
- (void)parseAskRequest;
- (void)parseDiscoverRequest;
- (void)performBlockForAllProgresses:(id)a3;
- (void)processRequest;
- (void)releaseIdleSleepAssertion;
- (void)removeObservers;
- (void)schedule;
- (void)sendAskResponse:(int64_t)a3;
- (void)sendDiscoverResponse:(int64_t)a3 forKnownAlias:(id)a4;
- (void)sendUploadResponse:(int64_t)a3;
- (void)setCombinedFileURLsAndItems:(id)a3;
- (void)setContactsOnly:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setDestination:(id)a3;
- (void)setProperty:(void *)a3 forKey:(__CFString *)a4;
- (void)setSessionID:(id)a3;
- (void)setShouldExtractMediaFromPhotosBundles:(BOOL)a3;
- (void)silentlyCancelRequest;
- (void)silentlyCancelRequestOnMainThread;
- (void)start;
- (void)stop;
- (void)storeArrayValue:(__CFDictionary *)a3 forKey:(__CFString *)a4;
- (void)storeBooleanValue:(__CFDictionary *)a3 forKey:(__CFString *)a4;
- (void)storeDataValue:(__CFDictionary *)a3 forKey:(__CFString *)a4;
- (void)storeIconValue:(__CFDictionary *)a3 forKey:(__CFString *)a4;
- (void)storeNumberValue:(__CFDictionary *)a3 forKey:(__CFString *)a4;
- (void)storeRequestValue:(_CFHTTPServerRequest *)a3 forKey:(__CFString *)a4 convertToNumber:(BOOL)a5;
- (void)storeStringValue:(__CFDictionary *)a3 forKey:(__CFString *)a4;
- (void)systemWillSleep:(id)a3;
- (void)wirelessPowerChanged:(id)a3;
@end

@implementation SDAirDropConnection

- (SDAirDropConnection)initWithConnection:(_CFHTTPServerConnection *)a3
{
  v21.receiver = self;
  v21.super_class = (Class)SDAirDropConnection;
  v4 = [(SDAirDropConnection *)&v21 init];
  v5 = v4;
  if (v4)
  {
    zipper = v4->_zipper;
    v4->_zipper = 0;

    v5->_person = 0;
    v5->_startTime = 0.0;
    progress = v5->_progress;
    v5->_progress = 0;

    *(_WORD *)&v5->_contactsOnly = 0;
    v5->_askRequest = 0;
    v5->_readStream = 0;
    *(void *)&v5->_discover = 0;
    *(_WORD *)&v5->_connectionClosed = 0;
    destination = v5->_destination;
    v5->_destination = 0;

    v5->_clientTrust = 0;
    v5->_requestBuffer = 0;
    v5->_uploadRequest = 0;
    v5->_discoverRequest = 0;
    objc_storeStrong((id *)&v5->_queue, &_dispatch_main_q);
    uint64_t v9 = objc_opt_new();
    requestData = v5->_requestData;
    v5->_requestData = (NSMutableData *)v9;

    uint64_t v11 = objc_opt_new();
    properties = v5->_properties;
    v5->_properties = (NSMutableDictionary *)v11;

    v5->_powerAssertionID = 0;
    uint64_t v13 = +[SDStatusMonitor sharedMonitor];
    monitor = v5->_monitor;
    v5->_monitor = (SDStatusMonitor *)v13;

    v5->_lastEvent = 1;
    dispatch_semaphore_t v15 = dispatch_semaphore_create(0);
    askSemaphore = v5->_askSemaphore;
    v5->_askSemaphore = (OS_dispatch_semaphore *)v15;

    v5->_connection = (_CFHTTPServerConnection *)CFRetain(a3);
    v17 = +[PFMediaCapabilities capabilitiesForCurrentDevice];
    uint64_t v18 = [v17 opaqueRepresentation];
    mediaCapabilities = v5->_mediaCapabilities;
    v5->_mediaCapabilities = (NSData *)v18;

    [(SDAirDropConnection *)v5 addObservers];
  }
  return v5;
}

- (void)dealloc
{
  [(SDAirDropConnection *)self stop];
  [(SDAirDropConnection *)self removeObservers];
  person = self->_person;
  if (person) {
    CFRelease(person);
  }
  requestBuffer = self->_requestBuffer;
  if (requestBuffer) {
    free(requestBuffer);
  }
  clientTrust = self->_clientTrust;
  if (clientTrust) {
    CFRelease(clientTrust);
  }
  v6 = self->_progress;
  [(NSProgress *)v6 setCancellationHandler:0];
  dispatch_time_t v7 = sub_1001B1AF8(2.0);
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001C7F1C;
  block[3] = &unk_1008CA4B8;
  v12 = v6;
  uint64_t v9 = v6;
  dispatch_after(v7, queue, block);

  v10.receiver = self;
  v10.super_class = (Class)SDAirDropConnection;
  [(SDAirDropConnection *)&v10 dealloc];
}

- (void)didCloseConnection
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001C7F98;
  block[3] = &unk_1008CA4B8;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)systemWillSleep:(id)a3
{
  v4 = airdrop_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "System will sleep, stopping AirDrop connection.", v6, 2u);
  }

  [(SDAirDropConnection *)self stop];
  v5 = sub_100052DC0(-8, 0);
  [(NSMutableDictionary *)self->_properties setObject:v5 forKeyedSubscript:kSFOperationErrorKey];
  [(SDAirDropConnection *)self notifyClientForEvent:10];
}

- (void)wirelessPowerChanged:(id)a3
{
  if (![(SDStatusMonitor *)self->_monitor wirelessEnabled])
  {
    v4 = airdrop_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "WiFi is disabled, stopping AirDrop connection.", v6, 2u);
    }

    [(SDAirDropConnection *)self stop];
    v5 = sub_100052DC0(-7, 0);
    [(NSMutableDictionary *)self->_properties setObject:v5 forKeyedSubscript:kSFOperationErrorKey];
    [(SDAirDropConnection *)self notifyClientForEvent:10];
  }
}

- (void)addObservers
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"wirelessPowerChanged:" name:@"com.apple.sharingd.WirelessPowerChanged" object:0];
}

- (void)removeObservers
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];
}

- (void)handleTerminalCallBack
{
  if (self->_stopDeferred)
  {
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1001C825C;
    block[3] = &unk_1008CA4B8;
    void block[4] = self;
    dispatch_async(queue, block);
  }
}

- (void)notifyClient:(int64_t)a3 withResults:(id)a4
{
  id v8 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained)
  {
    self->_lastEvent = a3;
    id v7 = objc_loadWeakRetained((id *)&self->_delegate);
    [v7 airDropConnection:self event:a3 withResults:v8];
  }
}

- (double)getTransferRate
{
  id v3 = [(NSMutableDictionary *)self->_properties objectForKeyedSubscript:kSFOperationTotalBytesKey];
  v4 = v3;
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

- (void)performBlockForAllProgresses:(id)a3
{
}

- (void)notifyClientForEvent:(int64_t)a3
{
  if (a3 != 7)
  {
    double v5 = airdrop_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      if ((unint64_t)(a3 - 1) > 0xE) {
        CFStringRef v6 = @"?";
      }
      else {
        CFStringRef v6 = *(&off_1008CFEF0 + a3 - 1);
      }
      *(_DWORD *)buf = 138412290;
      CFStringRef v35 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "SDAirDropConnection event: %@", buf, 0xCu);
    }
  }
  unint64_t lastEvent = self->_lastEvent;
  BOOL v8 = lastEvent > 0xA;
  uint64_t v9 = (1 << lastEvent) & 0x610;
  if (v8 || v9 == 0)
  {
    switch(a3)
    {
      case 2:
        if (!self->_queueSuspended)
        {
          self->_queueSuspended = 1;
          uint64_t v11 = sub_10004FCC0();
          dispatch_suspend(v11);

          sub_100050064(self->_properties, self);
        }
        id v12 = [(NSMutableDictionary *)self->_properties copy];
        uint64_t v13 = self;
        uint64_t v14 = 2;
        goto LABEL_21;
      case 4:
        [(SDAirDropConnection *)self performBlockForAllProgresses:&stru_1008CFE18];
        id v12 = [(NSMutableDictionary *)self->_properties copy];
        uint64_t v13 = self;
        uint64_t v14 = 4;
        goto LABEL_21;
      case 5:
        v33[0] = _NSConcreteStackBlock;
        v33[1] = 3221225472;
        v33[2] = sub_1001C8910;
        v33[3] = &unk_1008CB4D8;
        v33[4] = self;
        [(SDAirDropConnection *)self performBlockForAllProgresses:v33];
        id v12 = [(NSMutableDictionary *)self->_properties copy];
        uint64_t v13 = self;
        uint64_t v14 = 5;
        goto LABEL_21;
      case 7:
        v32[0] = _NSConcreteStackBlock;
        v32[1] = 3221225472;
        v32[2] = sub_1001C899C;
        v32[3] = &unk_1008CB4D8;
        v32[4] = self;
        [(SDAirDropConnection *)self performBlockForAllProgresses:v32];
        id v12 = [(NSMutableDictionary *)self->_properties copy];
        uint64_t v13 = self;
        uint64_t v14 = 7;
LABEL_21:
        [(SDAirDropConnection *)v13 notifyClient:v14 withResults:v12];
        goto LABEL_27;
      case 9:
        if (!self->_discover)
        {
          v16 = [(NSMutableDictionary *)self->_properties objectForKeyedSubscript:kSFOperationSenderModelNameKey];
          [(SDAirDropConnection *)self getTransferRate];
          double v18 = v17;
          [(SDAirDropConnection *)self getTransferSize];
          sub_100045F38(0, v16, 0, [(SDStatusMonitor *)self->_monitor discoverableLevel], 0, &__NSDictionary0__struct, v18, v19);
        }
        v20 = [(NSMutableDictionary *)self->_properties objectForKeyedSubscript:kSFOperationItemsKey];
        id v12 = v20;
        if (v20) {
          sub_10004665C(0, (uint64_t)[v20 count]);
        }
        [(SDAirDropConnection *)self performBlockForAllProgresses:&stru_1008CFDF8];
        id v21 = [(NSMutableDictionary *)self->_properties copy];
        [(SDAirDropConnection *)self notifyClient:9 withResults:v21];

LABEL_27:
        break;
      case 10:
        uint64_t v22 = kSFOperationErrorKey;
        v23 = [(NSMutableDictionary *)self->_properties objectForKeyedSubscript:kSFOperationErrorKey];

        if (!self->_discover)
        {
          v24 = [(NSMutableDictionary *)self->_properties objectForKeyedSubscript:kSFOperationSenderModelNameKey];
          [(SDAirDropConnection *)self getTransferSize];
          sub_1000462E0(0, v24, 0, (__CFError *)v23, [(SDStatusMonitor *)self->_monitor discoverableLevel], 0, &__NSDictionary0__struct, v25);
        }
        v26 = airdrop_log();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
          sub_1001CE8CC();
        }

        v27 = (const void *)kCFErrorDomainSFOperation;
        CFErrorDomain Domain = CFErrorGetDomain((CFErrorRef)v23);
        if (CFEqual(v27, Domain))
        {
          id v29 = [(NSMutableDictionary *)self->_properties copy];
          [(SDAirDropConnection *)self notifyClient:10 withResults:v29];
        }
        else
        {
          sub_100052DC0(-1, v23);
          id v29 = (id)objc_claimAutoreleasedReturnValue();
          id v30 = [(NSMutableDictionary *)self->_properties mutableCopy];
          [v30 setObject:v29 forKeyedSubscript:v22];
          [(SDAirDropConnection *)self notifyClient:10 withResults:v30];
        }
        v31[0] = _NSConcreteStackBlock;
        v31[1] = 3221225472;
        v31[2] = sub_1001C8AA4;
        v31[3] = &unk_1008CB4D8;
        v31[4] = self;
        [(SDAirDropConnection *)self performBlockForAllProgresses:v31];
        break;
      default:
        id v15 = [(NSMutableDictionary *)self->_properties copy];
        [(SDAirDropConnection *)self notifyClient:a3 withResults:v15];

        break;
    }
  }
}

- (void)didReceiveError:(__CFError *)a3
{
  double v5 = airdrop_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    sub_1001CE968();
  }

  [(SDAirDropConnection *)self handleTerminalCallBack];
  if ([(SDAirDropConnection *)self senderInfoAvailable])
  {
    [(NSMutableDictionary *)self->_properties setObject:a3 forKeyedSubscript:kSFOperationErrorKey];
    [(SDAirDropConnection *)self notifyClientForEvent:10];
  }
  else
  {
    CFStringRef v6 = airdrop_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1001CE934();
    }

    [(SDAirDropConnection *)self silentlyCancelRequest];
  }
}

- (void)setProperty:(void *)a3 forKey:(__CFString *)a4
{
  properties = self->_properties;
  if (a3) {
    CFDictionarySetValue((CFMutableDictionaryRef)properties, a4, a3);
  }
  else {
    CFDictionaryRemoveValue((CFMutableDictionaryRef)properties, a4);
  }
}

+ (id)fileInfoExpectedClassForKeyMap
{
  if (qword_100980308 != -1) {
    dispatch_once(&qword_100980308, &stru_1008CFE38);
  }
  v2 = (void *)qword_100980310;

  return v2;
}

+ (id)validatedFileInfo:(id)a3
{
  id v3 = a3;
  if (!v3)
  {
    id v15 = 0;
    goto LABEL_22;
  }
  double v4 = +[SDAirDropConnection fileInfoExpectedClassForKeyMap];
  double v5 = +[NSMutableDictionary dictionary];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  CFStringRef v6 = [v4 allKeys];
  id v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v20;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        [v4 objectForKeyedSubscript:v11];
        id v12 = [v3 objectForKeyedSubscript:v11];
        if (v12 && (objc_opt_isKindOfClass() & 1) == 0)
        {
          v16 = airdrop_log();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
            sub_1001CEA38((uint64_t)v12, v11, v16);
          }

          goto LABEL_20;
        }
        [v5 setObject:v12 forKeyedSubscript:v11];
      }
      id v8 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

  uint64_t v13 = [v5 objectForKeyedSubscript:kSFOperationFileBomPathKey];
  CFStringRef v6 = v13;
  if (v13 && !sub_100052FD4(v13))
  {
    id v12 = airdrop_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_1001CE9D0();
    }
    goto LABEL_20;
  }
  uint64_t v14 = [v5 objectForKeyedSubscript:kSFOperationFileNameKey];
  id v12 = v14;
  if (v14 && !sub_1000530AC(v14))
  {
    double v18 = airdrop_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_1001CE9D0();
    }

LABEL_20:
    id v15 = 0;
    goto LABEL_21;
  }
  id v15 = +[NSDictionary dictionaryWithDictionary:v5];
LABEL_21:

LABEL_22:

  return v15;
}

+ (id)validatedFilesArray:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    uint64_t v21 = objc_opt_class();
    double v4 = +[NSArray arrayWithObjects:&v21 count:1];
    double v5 = +[NSSet setWithArray:v4];

    if (NSArrayValidateClasses())
    {
      CFStringRef v6 = +[NSMutableArray array];
      long long v16 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      id v7 = v3;
      id v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v8)
      {
        id v9 = v8;
        uint64_t v10 = *(void *)v17;
        while (2)
        {
          for (i = 0; i != v9; i = (char *)i + 1)
          {
            if (*(void *)v17 != v10) {
              objc_enumerationMutation(v7);
            }
            uint64_t v12 = +[SDAirDropConnection validatedFileInfo:](SDAirDropConnection, "validatedFileInfo:", *(void *)(*((void *)&v16 + 1) + 8 * i), (void)v16);
            if (!v12)
            {

              goto LABEL_16;
            }
            uint64_t v13 = (void *)v12;
            [v6 addObject:v12];
          }
          id v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
          if (v9) {
            continue;
          }
          break;
        }
      }

      CFStringRef v6 = v6;
      uint64_t v14 = v6;
    }
    else
    {
      CFStringRef v6 = airdrop_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        sub_1001CEAEC();
      }
LABEL_16:
      uint64_t v14 = 0;
    }
  }
  else
  {
    uint64_t v14 = 0;
  }

  return v14;
}

+ (id)validatedItemsArray:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    v9[0] = objc_opt_class();
    v9[1] = objc_opt_class();
    double v4 = +[NSArray arrayWithObjects:v9 count:2];
    double v5 = +[NSSet setWithArray:v4];

    if (NSArrayValidateClasses()) {
      CFStringRef v6 = v3;
    }
    else {
      CFStringRef v6 = 0;
    }
    id v7 = v6;
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (void)storeArrayValue:(__CFDictionary *)a3 forKey:(__CFString *)a4
{
  Value = (void *)CFDictionaryGetValue(a3, a4);
  if (Value)
  {
    id v7 = Value;
    CFTypeID TypeID = CFArrayGetTypeID();
    if (TypeID != CFGetTypeID(v7))
    {
      id v9 = airdrop_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_1001CEB88();
      }
      goto LABEL_20;
    }
    id v9 = v7;
    if ((__CFString *)kSFOperationFilesKey == a4 || a4 && kSFOperationFilesKey && CFEqual(a4, kSFOperationFilesKey))
    {
      uint64_t v10 = +[SDAirDropConnection validatedFilesArray:v9];
    }
    else
    {
      if ((__CFString *)kSFOperationItemsKey != a4
        && (!a4 || !kSFOperationItemsKey || !CFEqual(a4, kSFOperationItemsKey)))
      {
        uint64_t v11 = airdrop_log();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          sub_1001CEB20();
        }
        goto LABEL_19;
      }
      uint64_t v10 = +[SDAirDropConnection validatedItemsArray:v9];
    }
    uint64_t v11 = v10;
    [(SDAirDropConnection *)self setProperty:v10 forKey:a4];
LABEL_19:

LABEL_20:
    return;
  }

  [(SDAirDropConnection *)self setProperty:0 forKey:a4];
}

- (void)storeRequestValue:(_CFHTTPServerRequest *)a3 forKey:(__CFString *)a4 convertToNumber:(BOOL)a5
{
  BOOL v5 = a5;
  CFStringRef v8 = (const __CFString *)_CFHTTPServerRequestCopyProperty();
  if (v8)
  {
    CFStringRef v9 = v8;
    CFTypeID v10 = CFGetTypeID(v8);
    if (v10 == CFStringGetTypeID())
    {
      CFStringRef v11 = CFURLCreateStringByReplacingPercentEscapes(0, v9, &stru_1008E7020);
      if (v11)
      {
        CFStringRef v12 = v11;
        if (v5)
        {
          CFNumberRef v13 = sub_1001B1C88(0, v9);
          if (v13)
          {
            CFNumberRef v14 = v13;
            CFDictionarySetValue((CFMutableDictionaryRef)self->_properties, a4, v13);
            CFRelease(v14);
          }
        }
        else
        {
          CFDictionarySetValue((CFMutableDictionaryRef)self->_properties, a4, v11);
        }
        CFRelease(v12);
        goto LABEL_17;
      }
      long long v16 = airdrop_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_1001CEC24();
      }
    }
    else
    {
      long long v16 = airdrop_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_1001CEC58();
      }
    }

LABEL_17:
    CFRelease(v9);
    return;
  }
  id v15 = airdrop_log();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
    sub_1001CEBF0();
  }
}

- (void)storeDataValue:(__CFDictionary *)a3 forKey:(__CFString *)a4
{
  Value = CFDictionaryGetValue(a3, a4);
  if (Value && (CFTypeID TypeID = CFDataGetTypeID(), TypeID != CFGetTypeID(Value)))
  {
    CFStringRef v8 = airdrop_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1001CEC8C();
    }
  }
  else
  {
    [(SDAirDropConnection *)self setProperty:Value forKey:a4];
  }
}

- (void)storeStringValue:(__CFDictionary *)a3 forKey:(__CFString *)a4
{
  Value = CFDictionaryGetValue(a3, a4);
  if (Value && (CFTypeID TypeID = CFStringGetTypeID(), TypeID != CFGetTypeID(Value)))
  {
    CFStringRef v8 = airdrop_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1001CECF4();
    }
  }
  else
  {
    [(SDAirDropConnection *)self setProperty:Value forKey:a4];
  }
}

- (void)storeNumberValue:(__CFDictionary *)a3 forKey:(__CFString *)a4
{
  Value = CFDictionaryGetValue(a3, a4);
  if (Value && (CFTypeID TypeID = CFNumberGetTypeID(), TypeID != CFGetTypeID(Value)))
  {
    CFStringRef v8 = airdrop_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1001CED5C();
    }
  }
  else
  {
    [(SDAirDropConnection *)self setProperty:Value forKey:a4];
  }
}

- (void)storeBooleanValue:(__CFDictionary *)a3 forKey:(__CFString *)a4
{
  Value = CFDictionaryGetValue(a3, a4);
  if (Value && (CFTypeID TypeID = CFBooleanGetTypeID(), TypeID != CFGetTypeID(Value)))
  {
    CFStringRef v8 = airdrop_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1001CEDC4();
    }
  }
  else
  {
    [(SDAirDropConnection *)self setProperty:Value forKey:a4];
  }
}

- (void)storeIconValue:(__CFDictionary *)a3 forKey:(__CFString *)a4
{
  CFDataRef Value = (const __CFData *)CFDictionaryGetValue(a3, a4);
  if (!Value) {
    return;
  }
  CFDataRef v7 = Value;
  CFTypeID v8 = CFGetTypeID(Value);
  if (v8 != CFDataGetTypeID())
  {
    CFStringRef v11 = airdrop_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1001CEE60();
    }
    goto LABEL_11;
  }
  CGImageRef v9 = sub_1000D8C3C(v7);
  if (!v9)
  {
    CFStringRef v11 = airdrop_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1001CEE2C();
    }
LABEL_11:

    return;
  }
  CGImageRef v10 = v9;
  [(NSMutableDictionary *)self->_properties setObject:v9 forKeyedSubscript:a4];

  CFRelease(v10);
}

- (void)sendDiscoverResponse:(int64_t)a3 forKnownAlias:(id)a4
{
  id v6 = a4;
  if (self->_discoverRequest)
  {
    ResponseMessage = (__CFHTTPMessage *)_CFHTTPServerRequestCreateResponseMessage();
    CFHTTPMessageSetHeaderFieldValue(ResponseMessage, @"Connection", @"close");
    if (a3 != 200)
    {
      long long v18 = airdrop_log();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        int64_t v29 = a3;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Responding to Discover request with code %ld", buf, 0xCu);
      }

      long long v19 = (const void *)_CFHTTPServerResponseCreateWithData();
      goto LABEL_26;
    }
    CFTypeID v8 = objc_opt_new();
    if (v6)
    {
      CGImageRef v9 = [(id)objc_opt_class() disambiguatedModelName];
      CGImageRef v10 = [(SDStatusMonitor *)self->_monitor someComputerName];
      CFStringRef v11 = [(SDStatusMonitor *)self->_monitor myAppleIDValidationRecord];
      CFStringRef v12 = [v11 objectForKeyedSubscript:@"AppleIDAccountValidationRecordData"];
      CFNumberRef v13 = +[SDNearbyAgent sharedNearbyAgent];
      CFNumberRef v14 = [v13 idSelfIdentity];

      [v8 setObject:v9 forKeyedSubscript:kSFOperationReceiverModelNameKey];
      [v8 setObject:v12 forKeyedSubscript:kSFOperationReceiverRecordDataKey];
      [v8 setObject:v10 forKeyedSubscript:kSFOperationReceiverComputerNameKey];
      id v15 = [v14 deviceIRKData];
      [v8 setObject:v15 forKeyedSubscript:kSFOperationReceiverDeviceIRKDataKey];

      long long v16 = [v14 edPKData];
      [v8 setObject:v16 forKeyedSubscript:kSFOperationReceiverEdPKDataKey];

      long long v17 = [v14 idsDeviceID];
      [v8 setObject:v17 forKeyedSubscript:kSFOperationReceiverIDSDeviceIDKey];

      [v8 setObject:v6 forKeyedSubscript:kSFOperationSendersKnownAliasKey];
    }
    else
    {
      if (self->_contactsOnly) {
        goto LABEL_10;
      }
      CGImageRef v9 = [(SDStatusMonitor *)self->_monitor someComputerName];
      [v8 setObject:v9 forKeyedSubscript:kSFOperationReceiverComputerNameKey];
    }

LABEL_10:
    [v8 setObject:self->_mediaCapabilities forKeyedSubscript:kSFOperationReceiverMediaCapabilitiesKey];
    CFErrorRef error = 0;
    unsigned int v20 = [(SDStatusMonitor *)self->_monitor enableXML];
    if (v20) {
      CFPropertyListFormat v21 = kCFPropertyListXMLFormat_v1_0;
    }
    else {
      CFPropertyListFormat v21 = kCFPropertyListBinaryFormat_v1_0;
    }
    long long v22 = off_1008CFA28;
    if (!v20) {
      long long v22 = off_1008CFA20;
    }
    CFHTTPMessageSetHeaderFieldValue(ResponseMessage, @"Content-Type", *v22);
    CFDataRef v23 = CFPropertyListCreateData(0, v8, v21, 0, &error);
    if (!v23)
    {
      v24 = airdrop_log();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        sub_1001CEE94();
      }

      CFRelease(error);
    }
    double v25 = airdrop_log();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      v26 = "known";
      if (!v6) {
        v26 = "unknown";
      }
      *(_DWORD *)buf = 136315138;
      int64_t v29 = (int64_t)v26;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Responding to Discover request from %s person", buf, 0xCu);
    }

    long long v19 = (const void *)_CFHTTPServerResponseCreateWithData();
    if (v23) {
      CFRelease(v23);
    }

LABEL_26:
    _CFHTTPServerResponseEnqueue();
    CFRelease(self->_discoverRequest);
    CFRelease(v19);
    CFRelease(ResponseMessage);
    self->_discoverRequest = 0;
  }
}

- (void)sendAskResponse:(int64_t)a3
{
  if (!self->_askRequest) {
    return;
  }
  BOOL v5 = airdrop_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    if ((int)a3 <= 399)
    {
      switch(a3)
      {
        case 0x64:
          CFStringRef v6 = @"Continue (100)";
          goto LABEL_23;
        case 0xC8:
          CFStringRef v6 = @"OK (200)";
          goto LABEL_23;
        case 0xCC:
          CFStringRef v6 = @"No Content (204)";
LABEL_23:
          *(_DWORD *)cf = 138412290;
          *(void *)&cf[4] = v6;
          _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Sending Ask response with code %@", cf, 0xCu);
          goto LABEL_24;
      }
    }
    else
    {
      if ((int)a3 <= 416)
      {
        switch((int)a3)
        {
          case 400:
            CFStringRef v6 = @"Bad Request (400)";
            break;
          case 401:
            CFStringRef v6 = @"Unauthorized (401)";
            break;
          case 403:
            CFStringRef v6 = @"Forbidden (403)";
            break;
          case 409:
            CFStringRef v6 = @"Conflict (409)";
            break;
          default:
            goto LABEL_22;
        }
        goto LABEL_23;
      }
      switch(a3)
      {
        case 0x1A1:
          CFStringRef v6 = @"Expectation Failed (417)";
          goto LABEL_23;
        case 0x1F4:
          CFStringRef v6 = @"Server Fail (500)";
          goto LABEL_23;
        case 0x1FB:
          CFStringRef v6 = @"Insufficient Storage (507)";
          goto LABEL_23;
      }
    }
LABEL_22:
    CFStringRef v6 = @"?";
    goto LABEL_23;
  }
LABEL_24:

  ResponseMessage = (__CFHTTPMessage *)_CFHTTPServerRequestCreateResponseMessage();
  if (a3 == 200)
  {
    *(void *)cf = 0;
    CFTypeID v8 = objc_opt_new();
    CGImageRef v9 = [(id)objc_opt_class() disambiguatedModelName];
    [v8 setObject:v9 forKeyedSubscript:kSFOperationReceiverModelNameKey];

    CGImageRef v10 = [(SDStatusMonitor *)self->_monitor someComputerName];
    [v8 setObject:v10 forKeyedSubscript:kSFOperationReceiverComputerNameKey];

    unsigned int v11 = [(SDStatusMonitor *)self->_monitor enableXML];
    if (v11) {
      CFPropertyListFormat v12 = kCFPropertyListXMLFormat_v1_0;
    }
    else {
      CFPropertyListFormat v12 = kCFPropertyListBinaryFormat_v1_0;
    }
    CFNumberRef v13 = off_1008CFA28;
    if (!v11) {
      CFNumberRef v13 = off_1008CFA20;
    }
    CFHTTPMessageSetHeaderFieldValue(ResponseMessage, @"Content-Type", *v13);
    CFDataRef Data = CFPropertyListCreateData(0, v8, v12, 0, (CFErrorRef *)cf);
    if (Data)
    {
      CFDataRef v15 = Data;
      long long v16 = (const void *)_CFHTTPServerResponseCreateWithData();
      CFRelease(v15);
    }
    else
    {
      long long v17 = airdrop_log();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_1001CEE94();
      }

      CFRelease(*(CFTypeRef *)cf);
      long long v16 = (const void *)_CFHTTPServerResponseCreateWithData();
    }
  }
  else
  {
    long long v16 = (const void *)_CFHTTPServerResponseCreateWithData();
  }
  _CFHTTPServerResponseEnqueue();
  CFRelease(self->_askRequest);
  CFRelease(v16);
  CFRelease(ResponseMessage);
  self->_askRequest = 0;
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
      unsigned int v11 = powerAssertionID;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Power assertion released (%d)", buf, 8u);
    }

    unsigned int v5 = self->_powerAssertionID;
    self->_unsigned int powerAssertionID = 0;
    dispatch_time_t v6 = sub_1001B1AF8(3.0);
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1001CA274;
    block[3] = &unk_1008CB410;
    unsigned int v9 = v5;
    dispatch_after(v6, queue, block);
  }
}

- (void)sendUploadResponse:(int64_t)a3
{
  if (self->_uploadRequest)
  {
    unsigned int v5 = airdrop_log();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
LABEL_24:

      CFDataRef v7 = CFDataCreate(0, 0, 0);
      [(SDAirDropConnection *)self enqueueResponse:self->_uploadRequest code:a3 body:v7];
      [(SDAirDropConnection *)self releaseIdleSleepAssertion];
      CFRelease(self->_uploadRequest);
      CFRelease(v7);
      self->_uploadRequest = 0;
      return;
    }
    if ((int)a3 <= 399)
    {
      switch(a3)
      {
        case 0x64:
          CFStringRef v6 = @"Continue (100)";
          goto LABEL_23;
        case 0xC8:
          CFStringRef v6 = @"OK (200)";
          goto LABEL_23;
        case 0xCC:
          CFStringRef v6 = @"No Content (204)";
LABEL_23:
          int v8 = 138412290;
          CFStringRef v9 = v6;
          _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Sending Upload response with code %@", (uint8_t *)&v8, 0xCu);
          goto LABEL_24;
      }
    }
    else
    {
      if ((int)a3 <= 416)
      {
        switch((int)a3)
        {
          case 400:
            CFStringRef v6 = @"Bad Request (400)";
            break;
          case 401:
            CFStringRef v6 = @"Unauthorized (401)";
            break;
          case 403:
            CFStringRef v6 = @"Forbidden (403)";
            break;
          case 409:
            CFStringRef v6 = @"Conflict (409)";
            break;
          default:
            goto LABEL_22;
        }
        goto LABEL_23;
      }
      switch(a3)
      {
        case 0x1A1:
          CFStringRef v6 = @"Expectation Failed (417)";
          goto LABEL_23;
        case 0x1F4:
          CFStringRef v6 = @"Server Fail (500)";
          goto LABEL_23;
        case 0x1FB:
          CFStringRef v6 = @"Insufficient Storage (507)";
          goto LABEL_23;
      }
    }
LABEL_22:
    CFStringRef v6 = @"?";
    goto LABEL_23;
  }
}

- (__SFNode)createPersonForAskRequest
{
  id v3 = [(NSMutableDictionary *)self->_properties objectForKeyedSubscript:kSFOperationSenderIDKey];
  if (sub_100052608(v3))
  {
    double v4 = [(NSMutableDictionary *)self->_properties objectForKeyedSubscript:kSFOperationSenderComputerNameKey];
    if (![v4 length])
    {
      unsigned int v11 = airdrop_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_1001CEEFC();
      }
      unsigned int v5 = 0;
      goto LABEL_32;
    }
    unsigned int v5 = (__SFNode *)SFNodeCreate();
    CFStringRef v6 = [(SDStatusMonitor *)self->_monitor copyMyAppleIDSecIdentity];
    if (v6)
    {
      CFDataRef v7 = v6;
      int v8 = [(NSMutableDictionary *)self->_properties objectForKeyedSubscript:kSFOperationSenderModelNameKey];
      CFStringRef v9 = [(NSMutableDictionary *)self->_properties objectForKeyedSubscript:kSFOperationSenderRecordDataKey];
      if (self->_clientTrust)
      {
        SFNodeSetModel();
        clientTrust = self->_clientTrust;
      }
      else
      {
        clientTrust = 0;
      }
      id v12 = sub_10005247C(v9, clientTrust, (uint64_t)v5);
      CFRelease(v7);
    }
    unsigned int v11 = objc_opt_new();
    CFNumberRef v13 = [(NSMutableDictionary *)self->_properties objectForKeyedSubscript:kSFOperationSenderIconHashKey];
    if (!v13)
    {
LABEL_29:
      int Boolean = GestaltGetBoolean();
      uint64_t v21 = 2023;
      if (!Boolean) {
        uint64_t v21 = 999;
      }
      *(void *)v24 = v21;
      CFNumberRef v22 = CFNumberCreate(0, kCFNumberLongType, v24);
      SFNodeSetFlags();
      SFNodeAddKind();
      SFNodeAddKind();
      SFNodeSetDomain();
      SFNodeSetServiceName();
      SFNodeSetComputerName();
      sub_100050F5C(v5, 0, v11, 0);
      CFRelease(v22);

LABEL_32:
      goto LABEL_33;
    }
    CFNumberRef v14 = airdrop_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v24 = 138412290;
      *(void *)&v24[4] = v3;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "SDAirDropConnection: icon hash is available for %@", v24, 0xCu);
    }

    SFNodeSetIconHash();
    CFDataRef v15 = [(NSMutableDictionary *)self->_properties objectForKeyedSubscript:kSFOperationSenderIconKey];
    long long v16 = v15;
    if (!v15)
    {
      long long v18 = airdrop_log();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_1001CEF30();
      }
      goto LABEL_28;
    }
    long long v17 = sub_1001B24DC(v15);
    long long v18 = v17;
    if (v17)
    {
      if ([v17 isEqual:v13])
      {
        [v11 setObject:v16 forKeyedSubscript:v13];
LABEL_28:

        goto LABEL_29;
      }
      long long v19 = airdrop_log();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        sub_1001CEF98();
      }
    }
    else
    {
      long long v19 = airdrop_log();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        sub_1001CEF64();
      }
    }

    goto LABEL_28;
  }
  double v4 = airdrop_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_1001CEFCC();
  }
  unsigned int v5 = 0;
LABEL_33:

  return v5;
}

- (void)logSenderIsBlocked
{
  id v3 = [(SDStatusMonitor *)self->_monitor myAppleID];
  [(SDAirDropConnection *)self senderIsMe];
  SFMetricsLogUnexpectedEvent();
}

- (BOOL)senderIsBlocked
{
  id v3 = [(NSMutableDictionary *)self->_properties objectForKeyedSubscript:kSFOperationSenderRecordDataKey];
  clientTrust = self->_clientTrust;
  id v20 = 0;
  id v21 = 0;
  sub_1000518D0(v3, clientTrust, 0, &v21, &v20);
  id v5 = v21;
  id v6 = v20;
  [(SDStatusMonitor *)self->_monitor contactsForEmailHash:v5 phoneHash:v6];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  id v8 = [v7 countByEnumeratingWithState:&v16 objects:v22 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v17;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if (v12
          && -[SDStatusMonitor contactIsBlocked:](self->_monitor, "contactIsBlocked:", *(void *)(*((void *)&v16 + 1) + 8 * i), (void)v16))
        {
          CFNumberRef v14 = airdrop_log();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
            sub_1001CF034(v7, v12, v14);
          }

          [(SDAirDropConnection *)self logSenderIsBlocked];
          BOOL v13 = 1;
          goto LABEL_14;
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v16 objects:v22 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  BOOL v13 = 0;
LABEL_14:

  return v13;
}

- (BOOL)senderIsTrusted:(id)a3
{
  id v4 = a3;
  id v5 = sub_100051754(self->_clientTrust);
  if (v5)
  {
    id v6 = v5;
    id v7 = [(SDStatusMonitor *)self->_monitor verifiedIdentityForAppleID:v4];
    if (v7)
    {
      id v12 = 0;
      int v8 = sub_1002309F0(v6, v7, &v12);
      id v9 = v12;
      if (v8)
      {
        [(NSMutableDictionary *)self->_properties setObject:v4 forKeyedSubscript:kSFOperationSenderEmailKey];
        [(NSMutableDictionary *)self->_properties setObject:&__kCFBooleanTrue forKeyedSubscript:kSFOperationVerifiableIdentityKey];
      }
      else
      {
        uint64_t v10 = airdrop_log();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
          sub_1001CF1A8();
        }
      }
    }
    else
    {
      id v9 = airdrop_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_1001CF174();
      }
      LOBYTE(v8) = 0;
    }

    CFRelease(v6);
  }
  else
  {
    id v7 = airdrop_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1001CF10C();
    }
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (BOOL)senderIsMe
{
  clientTrust = self->_clientTrust;
  if (clientTrust)
  {
    id v4 = sub_100051754(clientTrust);
    if (![(__CFArray *)v4 count])
    {
      BOOL v13 = airdrop_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_1001CF210();
      }

      unsigned __int8 v12 = 0;
      goto LABEL_19;
    }
    int v24 = 0;
    if (!SFAppleIDVerifyCertificateChainSync())
    {
      id v5 = airdrop_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        sub_1001CF334((uint64_t)&v24, v5, v6, v7, v8, v9, v10, v11);
      }
      unsigned __int8 v12 = 0;
      goto LABEL_18;
    }
    [(__CFArray *)v4 objectAtIndexedSubscript:0];

    int v14 = SFAppleIDCommonNameForCertificate();
    id v5 = 0;
    int v24 = v14;
    if (v14)
    {
      CFDataRef v15 = airdrop_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        sub_1001CF2C4((uint64_t)&v24, v15, v16, v17, v18, v19, v20, v21);
      }
    }
    else
    {
      CFDataRef v15 = [(SDStatusMonitor *)self->_monitor myAppleIDCommonName];
      if ([v15 length])
      {
        unsigned __int8 v12 = [v5 isEqualToString:v15];
        goto LABEL_17;
      }
      CFDataRef v23 = airdrop_log();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        sub_1001CF290();
      }
    }
    unsigned __int8 v12 = 0;
LABEL_17:

LABEL_18:
LABEL_19:

    return v12;
  }
  return 0;
}

- (void)silentlyCancelRequestOnMainThread
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001CAE10;
  block[3] = &unk_1008CA4B8;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)convertURLStringsToURLs
{
  uint64_t v3 = kSFOperationItemsKey;
  id v4 = [(NSMutableDictionary *)self->_properties objectForKeyedSubscript:kSFOperationItemsKey];
  if (v4)
  {
    id v6 = v4;
    id v5 = [v4 cuFilteredArrayUsingBlock:&stru_1008CFE78];
    [(NSMutableDictionary *)self->_properties setObject:v5 forKeyedSubscript:v3];

    id v4 = v6;
  }
}

- (void)parseDiscoverRequest
{
  CFErrorRef error = 0;
  uint64_t v3 = (__CFError *)CFPropertyListCreateWithData(0, (CFDataRef)self->_requestData, 0, 0, &error);
  if (v3)
  {
    id v4 = v3;
    CFTypeID v5 = CFGetTypeID(v3);
    CFTypeID TypeID = CFDictionaryGetTypeID();
    uint64_t v7 = airdrop_log();
    uint64_t v8 = v7;
    if (v5 == TypeID)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v11 = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Parsing Discover request", (uint8_t *)&v11, 2u);
      }

      [(SDAirDropConnection *)self storeDataValue:v4 forKey:kSFOperationSenderRecordDataKey];
    }
    else
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_1001CF40C();
      }
    }
    CFErrorRef v10 = v4;
  }
  else
  {
    uint64_t v9 = airdrop_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1001CF3A4();
    }

    CFErrorRef v10 = error;
  }
  CFRelease(v10);
}

- (void)handleDiscoverRequest
{
  uint64_t v3 = [(NSMutableDictionary *)self->_properties objectForKeyedSubscript:kSFOperationSenderRecordDataKey];
  id v4 = sub_10005247C(v3, self->_clientTrust, 0);
  if (!v4)
  {
    unsigned int v5 = 0;
    int v6 = 0;
    goto LABEL_17;
  }
  if ([(SDStatusMonitor *)self->_monitor disableTLS]) {
    unsigned int v5 = 1;
  }
  else {
    unsigned int v5 = [(SDAirDropConnection *)self senderIsTrusted:v4];
  }
  unsigned int v7 = [(SDAirDropConnection *)self senderIsBlocked];
  unsigned int v8 = v7;
  int v6 = 0;
  if (!v5 || (v7 & 1) != 0) {
    goto LABEL_10;
  }
  uint64_t v9 = [(SDStatusMonitor *)self->_monitor copyMyAppleIDSecIdentity];
  if (v9)
  {
    CFRelease(v9);
    int v6 = 1;
LABEL_10:
    if (!v8) {
      goto LABEL_17;
    }
    goto LABEL_11;
  }
  int v6 = 0;
  if (!v8) {
    goto LABEL_17;
  }
LABEL_11:
  if (![(SDAirDropConnection *)self senderIsMe])
  {
    int v11 = v5 & v6;
    uint64_t v12 = 401;
    goto LABEL_18;
  }
  CFErrorRef v10 = airdrop_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Sender is me, ignore self block.", v14, 2u);
  }

LABEL_17:
  int v11 = v5 & v6;
  uint64_t v12 = 200;
LABEL_18:
  if (v11) {
    BOOL v13 = v4;
  }
  else {
    BOOL v13 = 0;
  }
  [(SDAirDropConnection *)self sendDiscoverResponse:v12 forKnownAlias:v13];
}

- (void)parseAskRequest
{
  CFErrorRef error = 0;
  uint64_t v3 = (__CFError *)CFPropertyListCreateWithData(0, (CFDataRef)self->_requestData, 0, 0, &error);
  if (v3)
  {
    id v4 = v3;
    CFTypeID v5 = CFGetTypeID(v3);
    CFTypeID TypeID = CFDictionaryGetTypeID();
    unsigned int v7 = airdrop_log();
    unsigned int v8 = v7;
    if (v5 == TypeID)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v11 = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Parsing Ask request", (uint8_t *)&v11, 2u);
      }

      [(SDAirDropConnection *)self storeArrayValue:v4 forKey:kSFOperationFilesKey];
      [(SDAirDropConnection *)self storeArrayValue:v4 forKey:kSFOperationItemsKey];
      [(SDAirDropConnection *)self storeStringValue:v4 forKey:kSFOperationBundleIDKey];
      [(SDAirDropConnection *)self storeStringValue:v4 forKey:kSFOperationSenderIDKey];
      [(SDAirDropConnection *)self storeDataValue:v4 forKey:kSFOperationSenderRecordDataKey];
      [(SDAirDropConnection *)self storeIconValue:v4 forKey:kSFOperationFileIconKey];
      [(SDAirDropConnection *)self storeIconValue:v4 forKey:kSFOperationSmallFileIconKey];
      [(SDAirDropConnection *)self storeStringValue:v4 forKey:kSFOperationSenderModelNameKey];
      [(SDAirDropConnection *)self storeStringValue:v4 forKey:kSFOperationItemsDescriptionKey];
      [(SDAirDropConnection *)self storeStringValue:v4 forKey:kSFOperationSenderComputerNameKey];
      [(SDAirDropConnection *)self convertURLStringsToURLs];
    }
    else
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_1001CF40C();
      }
    }
    CFErrorRef v10 = v4;
  }
  else
  {
    uint64_t v9 = airdrop_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1001CF3A4();
    }

    CFErrorRef v10 = error;
  }
  CFRelease(v10);
}

- (BOOL)allowAskRequestFromPerson:(__SFNode *)a3
{
  if (!a3)
  {
    id v4 = airdrop_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_1001CF440();
    }
    goto LABEL_6;
  }
  id v4 = SFNodeCopyAppleID();
  if (![(SDStatusMonitor *)self->_monitor disableTLS])
  {
    if (v4)
    {
      BOOL v5 = [(SDAirDropConnection *)self senderIsTrusted:v4];
      goto LABEL_9;
    }
    if (self->_contactsOnly)
    {
      unsigned int v7 = airdrop_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_1001CF474();
      }

LABEL_6:
      BOOL v5 = 0;
      goto LABEL_9;
    }
  }
  BOOL v5 = 1;
LABEL_9:

  return v5;
}

- (BOOL)transferContainsPhotosAssetBundles
{
  [(NSMutableDictionary *)self->_properties objectForKeyedSubscript:kSFOperationFilesKey];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v13;
    uint64_t v6 = kSFOperationFileTypeKey;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v2);
        }
        unsigned int v8 = [[*(id *)(*((void *)&v12 + 1) + 8 * i) objectForKeyedSubscript:v6];
        char v9 = SFIsPhotosAssetBundle();

        if (v9)
        {
          BOOL v10 = 1;
          goto LABEL_11;
        }
      }
      id v4 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  BOOL v10 = 0;
LABEL_11:

  return v10;
}

- (void)adjustPropertiesForAutoAcceptSenderIsMe:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v5 = [(SDStatusMonitor *)self->_monitor disableAutoAccept];
  monitor = self->_monitor;
  if (v5)
  {
    [(SDStatusMonitor *)monitor disableAutoAcceptForPhotosAssetBundles];
    return;
  }
  unsigned int v7 = [(SDStatusMonitor *)monitor alwaysAutoAccept] || v3;
  unsigned int v8 = [(SDStatusMonitor *)self->_monitor disableAutoAcceptForPhotosAssetBundles];
  if (v7 != 1 || v8 == 0)
  {
    if (!v7) {
      return;
    }
  }
  else if ([(SDAirDropConnection *)self transferContainsPhotosAssetBundles])
  {
    __int16 v11 = airdrop_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "SDAirDropConnection: Prevented auto-accept because transfer contains All Photos Data Photos bundles.", v14, 2u);
    }

    return;
  }
  properties = self->_properties;
  uint64_t v13 = kSFOperationAutoAcceptKey;

  [(NSMutableDictionary *)properties setObject:&__kCFBooleanTrue forKeyedSubscript:v13];
}

- (void)adjustPropertiesForPhotosBundles
{
  BOOL v3 = objc_opt_new();
  uint64_t v16 = self;
  uint64_t v15 = kSFOperationFilesKey;
  id v4 = -[NSMutableDictionary objectForKeyedSubscript:](self->_properties, "objectForKeyedSubscript:");
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v18;
    uint64_t v8 = kSFOperationFileTypeKey;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v4);
        }
        BOOL v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        __int16 v11 = [v10 objectForKeyedSubscript:v8];
        if (SFIsPhotosAssetBundle())
        {
          id v12 = [v10 mutableCopy];
          uint64_t v13 = v12;
          CFStringRef v14 = @"com.apple.photos.asset-bundle";
LABEL_8:
          [v12 setObject:v14 forKeyedSubscript:v8];
          [v3 addObject:v13];

          goto LABEL_13;
        }
        if (SFIsLivePhotos() && [v11 isEqualToString:kUTTypeFolder])
        {
          id v12 = [v10 mutableCopy];
          uint64_t v13 = v12;
          CFStringRef v14 = @"com.apple.private.live-photo-bundle";
          goto LABEL_8;
        }
        [v3 addObject:v10];
LABEL_13:
      }
      id v6 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v6);
  }
  [(NSMutableDictionary *)v16->_properties setObject:v3 forKeyedSubscript:v15];
}

- (void)handleAskRequest
{
  BOOL v3 = [(NSMutableDictionary *)self->_properties objectForKeyedSubscript:kSFOperationSenderIDKey];
  if (v3)
  {
    uint64_t v4 = kSFOperationFilesKey;
    id v5 = [(NSMutableDictionary *)self->_properties objectForKeyedSubscript:kSFOperationFilesKey];
    id v6 = [(NSMutableDictionary *)self->_properties objectForKeyedSubscript:kSFOperationItemsKey];
    if ([v5 count] || objc_msgSend(v6, "count"))
    {
      uint64_t v7 = [(SDAirDropConnection *)self createPersonForAskRequest];
      self->_person = v7;
      if ([(SDAirDropConnection *)self allowAskRequestFromPerson:v7])
      {
        BOOL v8 = [(SDAirDropConnection *)self senderIsMe];
        if ([(SDStatusMonitor *)self->_monitor finderAirDropEnabled])
        {
          self->_personAdded = 1;
          char v9 = +[SDConnectedBrowser sharedBrowser];
          [v9 addAirDropPerson:self->_person];
          double v10 = 0.3;
        }
        else
        {
          char v9 = (void *)SFNodeCopyIconData();
          if (!v9)
          {
            char v9 = sub_1000509EC(0, 0, 0, 0);
            if (!v9)
            {
              double v10 = 0.0;
              goto LABEL_16;
            }
          }
          [(NSMutableDictionary *)self->_properties setObject:v9 forKeyedSubscript:kSFOperationSenderIconKey];
          double v10 = 0.0;
        }

LABEL_16:
        Name = (void *)SFNodeCopyLastName();
        CFStringRef v14 = (void *)SFNodeCopyFirstName();
        uint64_t v15 = (void *)SFNodeCopyDisplayName();
        [(NSMutableDictionary *)self->_properties setObject:Name forKeyedSubscript:kSFOperationSenderLastNameKey];
        [(NSMutableDictionary *)self->_properties setObject:v14 forKeyedSubscript:kSFOperationSenderFirstNameKey];
        [(NSMutableDictionary *)self->_properties setObject:v15 forKeyedSubscript:kSFOperationSenderCompositeNameKey];
        [(NSMutableDictionary *)self->_properties setObject:self->_person forKeyedSubscript:kSFOperationSenderNodeKey];
        [(SDAirDropConnection *)self adjustPropertiesForAutoAcceptSenderIsMe:v8];
        uint64_t v16 = +[NSNumber numberWithBool:v8];
        [(NSMutableDictionary *)self->_properties setObject:v16 forKeyedSubscript:kSFOperationSenderIsMeKey];

        [(SDAirDropConnection *)self adjustPropertiesForPhotosBundles];
        dispatch_time_t v17 = sub_1001B1AF8(v10);
        queue = self->_queue;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_1001CBC90;
        block[3] = &unk_1008CA4B8;
        void block[4] = self;
        dispatch_after(v17, queue, block);
        long long v19 = [(NSMutableDictionary *)self->_properties objectForKeyedSubscript:v4];
        if (![v19 count]) {
          [(SDAirDropConnection *)self releaseIdleSleepAssertion];
        }

        goto LABEL_22;
      }
      id v12 = airdrop_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_1001CF510();
      }
    }
    else
    {
      id v12 = airdrop_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_1001CF4DC();
      }
    }

    [(SDAirDropConnection *)self silentlyCancelRequestOnMainThread];
LABEL_22:

    goto LABEL_23;
  }
  __int16 v11 = airdrop_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    sub_1001CF4A8();
  }

  [(SDAirDropConnection *)self silentlyCancelRequestOnMainThread];
LABEL_23:
}

- (void)cancelAndDecline
{
  id v3 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:22 userInfo:0];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_properties, "setObject:forKeyedSubscript:");
  if (self->_discoverRequest)
  {
    [(SDAirDropConnection *)self sendDiscoverResponse:500 forKnownAlias:0];
  }
  else
  {
    [(SDAirDropConnection *)self sendAskResponse:500];
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_askSemaphore);
  }
}

- (void)processRequest
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained && (connection = self->_connection, WeakRetained, connection))
  {
    if (!self->_clientTrust) {
      self->_clientTrust = (__SecTrust *)_CFHTTPServerConnectionCopyProperty();
    }
    if (self->_discoverRequest)
    {
      [(SDAirDropConnection *)self parseDiscoverRequest];
      [(SDAirDropConnection *)self handleDiscoverRequest];
      return;
    }
    [(SDAirDropConnection *)self parseAskRequest];
    [(SDAirDropConnection *)self handleAskRequest];
  }
  else if (self->_discoverRequest)
  {
    return;
  }
  askSemaphore = self->_askSemaphore;

  dispatch_semaphore_signal(askSemaphore);
}

- (void)handleReadStreamEvent:(__CFReadStream *)a3 event:(unint64_t)a4
{
  if (a4 != 16)
  {
    if (a4 != 8)
    {
      if (a4 == 2)
      {
        CFIndex v6 = CFReadStreamRead(a3, (UInt8 *)self->_requestBuffer, 0x8000);
        if (v6 >= 1)
        {
          [(NSMutableData *)self->_requestData appendBytes:self->_requestBuffer length:v6];
          if ([(NSMutableData *)self->_requestData length] <= 0x100000) {
            return;
          }
          goto LABEL_6;
        }
        if ((v6 & 0x8000000000000000) == 0) {
          return;
        }
        BOOL v8 = airdrop_log();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
          sub_1001CF5B0();
        }
      }
      else
      {
        BOOL v8 = airdrop_log();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
          sub_1001CF544(a4, v8, v9, v10, v11, v12, v13, v14);
        }
      }

      [(SDAirDropConnection *)self cancelAndDecline];
      return;
    }
LABEL_6:
    [(SDAirDropConnection *)self cancelAndDecline];
    return;
  }
  if (self->_endEncountered)
  {
    uint64_t v7 = airdrop_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "SDAirDropConnection: kCFStreamEventEndEncountered fired again", v15, 2u);
    }
  }
  else
  {
    self->_endEncountered = 1;
    [(SDAirDropConnection *)self processRequest];
  }
}

- (BOOL)startReceivingBody:(_CFHTTPServerRequest *)a3 error:(id *)a4
{
  CFIndex v6 = (__CFReadStream *)_CFHTTPServerRequestCopyBodyStream();
  self->_readStream = v6;
  if (!v6)
  {
    uint64_t v11 = airdrop_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1001CF618();
    }

    if (!a4) {
      return 0;
    }
    id v10 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:22 userInfo:0];
    BOOL v8 = 0;
    goto LABEL_11;
  }
  self->_requestBuffer = (char *)malloc_type_malloc(0x8000uLL, 0xB8957D49uLL);
  clientContext.version = 0;
  clientContext.info = self;
  clientContext.retain = (void *(__cdecl *)(void *))&_CFRetain;
  clientContext.release = (void (__cdecl *)(void *))&_CFRelease;
  clientContext.copyDescription = (CFStringRef (__cdecl *)(void *))&CFCopyDescription;
  CFReadStreamSetClient(self->_readStream, 0x1AuLL, (CFReadStreamClientCallBack)sub_1001CC124, &clientContext);
  CFReadStreamSetDispatchQueue(self->_readStream, (dispatch_queue_t)self->_queue);
  int v7 = CFReadStreamOpen(self->_readStream);
  BOOL v8 = v7 != 0;
  if (!v7)
  {
    uint64_t v9 = airdrop_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1001CF64C();
    }

    if (a4)
    {
      id v10 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:12 userInfo:0];
LABEL_11:
      *a4 = v10;
    }
  }
  return v8;
}

- (id)compressionType
{
  id v2 = [(NSMutableDictionary *)self->_properties objectForKeyedSubscript:@"Content-Type"];
  if ([v2 isEqual:@"application/zip"])
  {
    id v3 = off_1008CF9E8;
LABEL_7:
    uint64_t v4 = *v3;
    goto LABEL_8;
  }
  if ([v2 isEqual:@"application/x-cpio"])
  {
    id v3 = off_1008CF9E0;
    goto LABEL_7;
  }
  if ([v2 isEqual:@"application/x-dvzip"])
  {
    id v3 = off_1008CF9F0;
    goto LABEL_7;
  }
  uint64_t v4 = 0;
LABEL_8:

  return v4;
}

- (BOOL)startReceivingFile:(_CFHTTPServerRequest *)a3 error:(id *)a4
{
  uint64_t v6 = _CFHTTPServerRequestCopyBodyStream();
  if (v6)
  {
    int v7 = (const void *)v6;
    destination = self->_destination;
    BOOL v9 = destination != 0;
    if (destination)
    {
      id v10 = objc_alloc_init(SDAirDropFileZipper);
      zipper = self->_zipper;
      self->_zipper = v10;

      uint64_t v12 = [(SDAirDropConnection *)self whereFromInfo];
      uint64_t v13 = [v12 firstObject];
      [(SDAirDropFileZipper *)self->_zipper setSenderName:v13];

      [(SDAirDropFileZipper *)self->_zipper setShouldExtractMediaFromPhotosBundles:[(SDAirDropConnection *)self shouldExtractMediaFromPhotosBundles]];
      id location = 0;
      objc_initWeak(&location, self);
      uint64_t v14 = self->_zipper;
      uint64_t v15 = [(NSMutableDictionary *)self->_properties objectForKeyedSubscript:kSFOperationFilesKey];
      CFNumberRef v22 = _NSConcreteStackBlock;
      uint64_t v23 = 3221225472;
      int v24 = sub_1001CC4D4;
      double v25 = &unk_1008CF240;
      objc_copyWeak(&v26, &location);
      [(SDAirDropFileZipper *)v14 setPlaceholderFiles:v15 withCreationCompletionHandler:&v22];

      uint64_t v16 = self->_zipper;
      dispatch_time_t v17 = -[NSMutableDictionary objectForKeyedSubscript:](self->_properties, "objectForKeyedSubscript:", kSFOperationTotalBytesKey, v22, v23, v24, v25);
      [(SDAirDropFileZipper *)v16 setTotalBytes:v17];

      long long v18 = [(SDAirDropConnection *)self compressionType];
      [(SDAirDropFileZipper *)self->_zipper setUnzipCompressionType:v18];

      [(SDAirDropFileZipper *)self->_zipper setDestination:self->_destination];
      [(SDAirDropFileZipper *)self->_zipper setReadStream:v7];
      [(SDAirDropFileZipper *)self->_zipper setDelegate:self];
      [(SDAirDropFileZipper *)self->_zipper unzip];
      objc_destroyWeak(&v26);
      objc_destroyWeak(&location);
    }
    else
    {
      long long v20 = airdrop_log();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        sub_1001CF680();
      }

      if (a4)
      {
        *a4 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:22 userInfo:0];
      }
    }
    CFRelease(v7);
  }
  else
  {
    long long v19 = airdrop_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_1001CF618();
    }

    if (a4)
    {
      +[NSError errorWithDomain:NSPOSIXErrorDomain code:22 userInfo:0];
      BOOL v9 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      return 0;
    }
  }
  return v9;
}

- (BOOL)thereIsEnoughFreeSpace
{
  if ([(SDStatusMonitor *)self->_monitor testDiskFull]) {
    return 0;
  }
  CFNumberRef propertyValueTypeRefPtr = 0;
  CFErrorRef error = 0;
  if (!CFURLCopyResourcePropertyForKey((CFURLRef)self->_destination, kCFURLVolumeAvailableCapacityKey, &propertyValueTypeRefPtr, &error))
  {
    int v7 = airdrop_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1001CF6B4();
    }

    CFRelease(error);
    return 1;
  }
  if (!propertyValueTypeRefPtr) {
    return 1;
  }
  uint64_t valuePtr = 0;
  if (CFNumberGetValue(propertyValueTypeRefPtr, kCFNumberSInt64Type, &valuePtr))
  {
    uint64_t v4 = [(NSMutableDictionary *)self->_properties objectForKeyedSubscript:kSFOperationTotalBytesKey];
    id v5 = v4;
    if (v4)
    {
      id v6 = [v4 longLongValue];
      BOOL v3 = valuePtr > (uint64_t)v6 + 20971520;
    }
    else
    {
      BOOL v3 = 1;
    }
  }
  else
  {
    BOOL v3 = 1;
  }
  CFRelease(propertyValueTypeRefPtr);
  return v3;
}

- (BOOL)senderInfoAvailable
{
  BOOL v3 = [(NSMutableDictionary *)self->_properties objectForKeyedSubscript:kSFOperationSenderIDKey];
  if (v3)
  {
    uint64_t v4 = [(NSMutableDictionary *)self->_properties objectForKeyedSubscript:kSFOperationSenderComputerNameKey];
    BOOL v5 = v4 != 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)silentlyCancelRequest
{
  BOOL v3 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:89 userInfo:0];
  uint64_t v5 = kSFOperationErrorKey;
  id v6 = v3;
  uint64_t v4 = +[NSDictionary dictionaryWithObjects:&v6 forKeys:&v5 count:1];
  [(SDAirDropConnection *)self notifyClient:10 withResults:v4];
}

- (void)enqueueResponse:(_CFHTTPServerRequest *)a3 code:(int64_t)a4 body:(__CFData *)a5
{
  ResponseMessage = (__CFHTTPMessage *)_CFHTTPServerRequestCreateResponseMessage();
  int v7 = ResponseMessage;
  if (a4 != 100) {
    CFHTTPMessageSetHeaderFieldValue(ResponseMessage, @"Connection", @"close");
  }
  BOOL v8 = (const void *)_CFHTTPServerResponseCreateWithData();
  _CFHTTPServerResponseEnqueue();
  CFRelease(v8);

  CFRelease(v7);
}

- (BOOL)oneHundredContinue:(_CFHTTPServerRequest *)a3
{
  BOOL v3 = (const void *)_CFHTTPServerRequestCopyProperty();
  if (!v3) {
    return 0;
  }
  uint64_t v4 = v3;
  BOOL v5 = CFEqual(v3, @"100-continue") != 0;
  CFRelease(v4);
  return v5;
}

- (void)makeDestinationDirectory
{
  BOOL v3 = sub_1001B2E7C();
  uint64_t v4 = [v3 URLByAppendingPathComponent:@"com.apple.AirDrop" isDirectory:1];

  BOOL v5 = [v4 URLByAppendingPathComponent:self->_sessionID isDirectory:1];

  id v6 = [v5 URLByAppendingPathComponent:@"Files" isDirectory:1];

  NSFileAttributeKey v14 = NSFileProtectionKey;
  NSFileProtectionType v15 = NSFileProtectionCompleteUntilFirstUserAuthentication;
  int v7 = +[NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
  BOOL v8 = +[NSFileManager defaultManager];
  id v13 = 0;
  unsigned int v9 = [v8 createDirectoryAtURL:v6 withIntermediateDirectories:1 attributes:v7 error:&v13];
  id v10 = v13;

  if (v9)
  {
    uint64_t v11 = v6;
    p_super = &self->_destination->super;
    self->_destination = v11;
  }
  else
  {
    p_super = airdrop_log();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR)) {
      sub_1001CF71C();
    }
  }
}

- (void)enqueueBadResponseForRequest:(_CFHTTPServerRequest *)a3
{
  if (!self->_discoverRequest)
  {
    if (self->_uploadRequest)
    {
      BOOL v5 = airdrop_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        sub_1001CF7EC();
      }
      goto LABEL_7;
    }
    CFURLRef v6 = sub_1001CCB34();
    if (CFEqual(v6, @"Upload"))
    {
      int v7 = airdrop_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_1001CF7B8();
      }
    }
    else
    {
      if (!self->_askRequest)
      {
LABEL_16:
        CFRelease(v6);
        goto LABEL_8;
      }
      int v7 = airdrop_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_1001CF784();
      }
    }

    goto LABEL_16;
  }
  BOOL v5 = airdrop_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    sub_1001CF820();
  }
LABEL_7:

LABEL_8:
  [(SDAirDropConnection *)self enqueueResponse:a3 code:400 body:0];
}

- (void)didReceiveRequest:(_CFHTTPServerRequest *)a3
{
  BOOL v5 = (const void *)_CFHTTPServerRequestCopyProperty();
  if (v5)
  {
    CFURLRef v6 = v5;
    if (CFEqual(v5, @"POST"))
    {
      CFURLRef v7 = sub_1001CCB34();
      if (v7)
      {
        CFURLRef v8 = v7;
        uint64_t v24 = 0;
        double v25 = &v24;
        uint64_t v26 = 0x3032000000;
        v27 = sub_1001CD04C;
        v28 = sub_1001CD05C;
        id v29 = 0;
        if (CFEqual(v7, @"Discover"))
        {
          self->_discover = 1;
          if (!self->_discoverRequest && !self->_askRequest && !self->_uploadRequest)
          {
            self->_discoverRequest = (_CFHTTPServerRequest *)CFRetain(a3);
            unsigned int v9 = airdrop_log();
            if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Received Discover request", buf, 2u);
            }

            id v10 = (id *)(v25 + 5);
            id obj = (id)v25[5];
            unsigned __int8 v11 = [(SDAirDropConnection *)self startReceivingBody:a3 error:&obj];
            objc_storeStrong(v10, obj);
            if ((v11 & 1) == 0)
            {
              [(NSMutableDictionary *)self->_properties setObject:v25[5] forKeyedSubscript:kSFOperationErrorKey];
              [(SDAirDropConnection *)self sendDiscoverResponse:500 forKnownAlias:0];
            }
            goto LABEL_32;
          }
        }
        else if (CFEqual(v8, @"Ask"))
        {
          if (!self->_discoverRequest && !self->_askRequest && !self->_uploadRequest)
          {
            self->_transactionStarted = 1;
            [(SDAirDropConnection *)self makeDestinationDirectory];
            [(SDStatusMonitor *)self->_monitor airDropTransactionBegin:0];
            self->_askRequest = (_CFHTTPServerRequest *)CFRetain(a3);
            NSFileAttributeKey v14 = airdrop_log();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Received Ask request", buf, 2u);
            }

            NSFileProtectionType v15 = (id *)(v25 + 5);
            id v21 = (id)v25[5];
            unsigned __int8 v16 = [(SDAirDropConnection *)self startReceivingBody:a3 error:&v21];
            objc_storeStrong(v15, v21);
            if ((v16 & 1) == 0)
            {
              [(NSMutableDictionary *)self->_properties setObject:v25[5] forKeyedSubscript:kSFOperationErrorKey];
              [(SDAirDropConnection *)self sendAskResponse:500];
              dispatch_semaphore_signal((dispatch_semaphore_t)self->_askSemaphore);
            }
            goto LABEL_32;
          }
        }
        else
        {
          if (!CFEqual(v8, @"Upload"))
          {
            dispatch_time_t v17 = airdrop_log();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
              sub_1001CF8F0();
            }

            [(SDAirDropConnection *)self enqueueResponse:a3 code:400 body:0];
            goto LABEL_32;
          }
          if (!self->_discoverRequest && !self->_uploadRequest && (self->_askRequest || self->_userAccepted))
          {
            self->_uploadRequest = (_CFHTTPServerRequest *)CFRetain(a3);
            long long v18 = airdrop_log();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Received Upload request", buf, 2u);
            }

            long long v19 = sub_1001B1BE4();
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472;
            block[2] = sub_1001CD064;
            block[3] = &unk_1008CFEA0;
            void block[4] = self;
            void block[5] = &v24;
            block[6] = a3;
            dispatch_async(v19, block);

            goto LABEL_32;
          }
        }
        [(SDAirDropConnection *)self enqueueBadResponseForRequest:a3];
LABEL_32:
        CFRelease(v8);
        _Block_object_dispose(&v24, 8);

        goto LABEL_33;
      }
      id v13 = airdrop_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_1001CF8BC();
      }
    }
    else
    {
      id v13 = airdrop_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_1001CF888();
      }
    }

    [(SDAirDropConnection *)self enqueueResponse:a3 code:400 body:0];
LABEL_33:
    CFRelease(v6);
    return;
  }
  uint64_t v12 = airdrop_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    sub_1001CF854();
  }

  [(SDAirDropConnection *)self enqueueResponse:a3 code:400 body:0];
}

- (int64_t)getStatusCode:(_CFHTTPServerResponse *)a3
{
  BOOL v3 = (__CFHTTPMessage *)_CFHTTPServerResponseCopyProperty();
  if (!v3) {
    return -1;
  }
  uint64_t v4 = v3;
  CFIndex ResponseStatusCode = CFHTTPMessageGetResponseStatusCode(v3);
  CFRelease(v4);
  return ResponseStatusCode;
}

- (void)notifyClientOfBytesCopied:(id)a3 timeRemaining:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  usleep(0x186A0u);
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001CD590;
  block[3] = &unk_1008CAF18;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (void)finishOperation
{
  self->_delayedFinish = 1;
  BOOL v3 = sub_1001B1BE4();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001CD68C;
  block[3] = &unk_1008CA4B8;
  void block[4] = self;
  dispatch_async(v3, block);
}

- (void)didSendResponse:(_CFHTTPServerResponse *)a3 forRequest:(_CFHTTPServerRequest *)a4
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained)
  {
    int64_t v7 = [(SDAirDropConnection *)self getStatusCode:a3];
    if (v7 == 400)
    {
      [(SDAirDropConnection *)self silentlyCancelRequest];
      return;
    }
    int64_t v8 = v7;
    id v9 = [(NSMutableDictionary *)self->_properties objectForKeyedSubscript:kSFOperationErrorKey];

    if (v9)
    {
      [(SDAirDropConnection *)self notifyClientForEvent:10];
      return;
    }
    id v10 = (const void *)_CFHTTPServerRequestCopyProperty();
    if (v10)
    {
      unsigned __int8 v11 = v10;
      if (CFEqual(v10, @"POST"))
      {
        CFURLRef v12 = sub_1001CCB34();
        if (v12)
        {
          CFURLRef v13 = v12;
          if (CFEqual(v12, @"Ask"))
          {
            NSFileAttributeKey v14 = [(NSMutableDictionary *)self->_properties objectForKeyedSubscript:kSFOperationFilesKey];
            if ([v14 count])
            {
              self->_startTime = CFAbsoluteTimeGetCurrent();
              [(SDAirDropConnection *)self notifyClientForEvent:5];
              [(NSMutableDictionary *)self->_properties removeObjectForKey:kSFOperationSmallFileIconKey];
              [(NSMutableDictionary *)self->_properties removeObjectForKey:kSFOperationFileIconKey];
            }
            else
            {
              [(SDAirDropConnection *)self finishOperation];
            }
          }
          else if (CFEqual(v13, @"Upload"))
          {
            if (v8 != 100) {
              [(SDAirDropConnection *)self notifyClientForEvent:9];
            }
          }
          else
          {
            if (!CFEqual(v13, @"Discover"))
            {
              dispatch_time_t v17 = airdrop_log();
              if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
                sub_1001CFA28();
              }
            }
            [(SDAirDropConnection *)self silentlyCancelRequest];
          }
          CFRelease(v13);
          goto LABEL_34;
        }
        unsigned __int8 v16 = airdrop_log();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
          sub_1001CF9F4();
        }
      }
      else
      {
        unsigned __int8 v16 = airdrop_log();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
          sub_1001CF9C0();
        }
      }

      [(SDAirDropConnection *)self silentlyCancelRequest];
LABEL_34:
      CFRelease(v11);
      return;
    }
    NSFileProtectionType v15 = airdrop_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_1001CF98C();
    }

    [(SDAirDropConnection *)self silentlyCancelRequest];
  }
  else if (self->_stopDeferred)
  {
    [(SDAirDropConnection *)self stop];
  }
}

- (void)didFailToSendResponse:(_CFHTTPServerResponse *)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained)
  {
    if (a3)
    {
      id v6 = [(NSMutableDictionary *)self->_properties objectForKeyedSubscript:kSFOperationErrorKey];

      if (v6)
      {
        [(SDAirDropConnection *)self notifyClientForEvent:10];
      }
      else
      {
        [(SDAirDropConnection *)self silentlyCancelRequest];
      }
    }
  }
  else if (self->_stopDeferred)
  {
    [(SDAirDropConnection *)self stop];
  }
}

- (void)handleClosedConnection
{
  if (self->_delayedFinish)
  {
    BOOL v3 = [(NSMutableDictionary *)self->_properties objectForKeyedSubscript:kSFOperationSenderIDKey];
    uint64_t v4 = airdrop_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      sub_1001CFA5C();
    }
  }
  else
  {
    [(SDAirDropConnection *)self stop];
    if ([(SDAirDropConnection *)self senderInfoAvailable])
    {
      BOOL v5 = [(NSMutableDictionary *)self->_properties objectForKeyedSubscript:kSFOperationSenderIDKey];
      id v6 = airdrop_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        int v8 = 138412290;
        id v9 = v5;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Connection from %@ closed", (uint8_t *)&v8, 0xCu);
      }

      [(SDAirDropConnection *)self notifyClientForEvent:4];
    }
    else
    {
      int64_t v7 = airdrop_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v8) = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Connection closed (cancel suppressed)", (uint8_t *)&v8, 2u);
      }

      [(SDAirDropConnection *)self silentlyCancelRequest];
    }
  }
}

- (id)whereFromInfo
{
  id v2 = objc_opt_new();
  BOOL v3 = (void *)SFNodeCopyDisplayName();
  uint64_t v4 = (void *)SFNodeCopyComputerName();
  if (v3) {
    [v2 addObject:v3];
  }
  if (v4 && ([v3 isEqualToString:v4] & 1) == 0) {
    [v2 addObject:v4];
  }

  return v2;
}

- (void)setCombinedFileURLsAndItems:(id)a3
{
  id v7 = a3;
  uint64_t v4 = objc_opt_new();
  uint64_t v5 = kSFOperationItemsKey;
  id v6 = [(NSMutableDictionary *)self->_properties objectForKeyedSubscript:kSFOperationItemsKey];
  if (v6) {
    [v4 addObjectsFromArray:v6];
  }
  [v4 addObjectsFromArray:v7];
  [(NSMutableDictionary *)self->_properties setObject:v4 forKeyedSubscript:v5];
}

- (BOOL)transferIsOverPrebufferLimit
{
  if (self->_userAccepted) {
    return 0;
  }
  BOOL v3 = [(NSMutableDictionary *)self->_properties objectForKeyedSubscript:kSFOperationBytesCopiedKey];
  BOOL v2 = (uint64_t)[v3 longLongValue] > 629145600;

  return v2;
}

- (void)fileZipper:(id)a3 event:(int64_t)a4 withProperty:(void *)a5
{
  id v8 = a3;
  if (a4 == 10)
  {
    id v12 = v8;
    [(NSMutableDictionary *)self->_properties setObject:a5 forKeyedSubscript:kSFOperationErrorKey];
    id v10 = self;
    uint64_t v11 = 500;
LABEL_8:
    [(SDAirDropConnection *)v10 sendUploadResponse:v11];
    goto LABEL_9;
  }
  if (a4 == 9)
  {
    id v12 = v8;
    [(SDAirDropConnection *)self setSpotlightMetadata:a5];
    [(SDAirDropConnection *)self setCombinedFileURLsAndItems:a5];
    id v10 = self;
    uint64_t v11 = 200;
    goto LABEL_8;
  }
  if (a4 != 7) {
    goto LABEL_10;
  }
  id v12 = v8;
  sub_100052630((const __CFDictionary *)self->_properties, (CFDictionaryRef)a5);
  [(SDAirDropConnection *)self storeNumberValue:a5 forKey:kSFOperationBytesCopiedKey];
  [(SDAirDropConnection *)self storeNumberValue:a5 forKey:kSFOperationTimeRemainingKey];
  if ([(SDAirDropConnection *)self transferIsOverPrebufferLimit])
  {
    id v9 = sub_100052DC0(-2, 0);
    [(NSMutableDictionary *)self->_properties setObject:v9 forKeyedSubscript:kSFOperationErrorKey];
    [(SDAirDropConnection *)self notifyClientForEvent:10];

LABEL_9:
    id v8 = v12;
    goto LABEL_10;
  }
  id v8 = v12;
  if (self->_startTime != 0.0)
  {
    [(SDAirDropConnection *)self notifyClientForEvent:7];
    goto LABEL_9;
  }
LABEL_10:
}

+ (id)disambiguatedModelName
{
  BOOL v2 = +[SDStatusMonitor sharedMonitor];
  BOOL v3 = [v2 modelName];

  if ([(__CFString *)v3 isEqualToString:@"Mac"])
  {
    uint64_t v4 = +[SDStatusMonitor sharedMonitor];
    uint64_t v5 = [v4 modelCode];

    if (([v5 isEqualToString:@"Mac13,1"] & 1) != 0
      || [v5 isEqualToString:@"Mac13,2"])
    {

      BOOL v3 = @"Mac mini";
    }
    if ([v5 isEqualToString:@"Mac14,2"])
    {

      BOOL v3 = @"MacBook Air";
    }
    if ([v5 isEqualToString:@"Mac14,7"])
    {

      BOOL v3 = @"MacBook Pro";
    }
  }

  return v3;
}

- (void)schedule
{
  connection = self->_connection;
  CFRunLoopRef Main = CFRunLoopGetMain();

  __CFHTTPServerConnectionScheduleWithRunLoopAndMode(connection, Main, kCFRunLoopDefaultMode);
}

- (void)start
{
  BOOL v3 = (OS_os_transaction *)os_transaction_create();
  transaction = self->_transaction;
  self->_transaction = v3;

  self->_unsigned int powerAssertionID = sub_100052784();
  uint64_t v5 = airdrop_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int powerAssertionID = self->_powerAssertionID;
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&uint8_t buf[4] = powerAssertionID;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Power assertion retained (%d)", buf, 8u);
  }

  *(_OWORD *)buf = unk_1008CFEC0;
  long long v8 = *(_OWORD *)off_1008CFED0;
  long long v9 = *(_OWORD *)&off_1008CFEE0;
  sub_100050338(self->_connection, self);
  _CFHTTPServerConnectionSetClient();
  _CFHTTPServerConnectionSetProperty();
}

- (BOOL)accept
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001CE494;
  block[3] = &unk_1008CA4B8;
  void block[4] = self;
  dispatch_async(queue, block);
  return 1;
}

- (void)stop
{
  askRequest = self->_askRequest;
  if (!askRequest)
  {
    discoverRequest = self->_discoverRequest;
    if (!discoverRequest) {
      goto LABEL_8;
    }
    if (!self->_connectionClosed)
    {
      self->_stopDeferred = 1;
      [(SDAirDropConnection *)self sendDiscoverResponse:401 forKnownAlias:0];
      goto LABEL_27;
    }
LABEL_7:
    CFRelease(discoverRequest);
    self->_discoverRequest = 0;
    goto LABEL_8;
  }
  if (!self->_connectionClosed)
  {
    self->_stopDeferred = 1;
    [(SDAirDropConnection *)self sendAskResponse:401];
    goto LABEL_27;
  }
  CFRelease(askRequest);
  self->_askRequest = 0;
  discoverRequest = self->_discoverRequest;
  if (discoverRequest) {
    goto LABEL_7;
  }
LABEL_8:
  uploadRequest = self->_uploadRequest;
  if (uploadRequest)
  {
    CFRelease(uploadRequest);
    self->_uploadRequest = 0;
  }
  zipper = self->_zipper;
  if (zipper)
  {
    [(SDAirDropFileZipper *)zipper setDelegate:0];
    [(SDAirDropFileZipper *)self->_zipper stop];
    id v7 = self->_zipper;
    self->_zipper = 0;
  }
  readStream = self->_readStream;
  if (readStream)
  {
    CFReadStreamSetClient(readStream, 0, 0, 0);
    CFReadStreamSetDispatchQueue(self->_readStream, 0);
    CFReadStreamClose(self->_readStream);
    CFRelease(self->_readStream);
    self->_readStream = 0;
  }
  connection = self->_connection;
  if (connection)
  {
    sub_10005042C(connection);
    id v10 = airdrop_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = self->_connection;
      int v15 = 134217984;
      unsigned __int8 v16 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Invalidated AirDrop connection %p", (uint8_t *)&v15, 0xCu);
    }

    _CFHTTPServerConnectionInvalidate();
    CFRelease(self->_connection);
    self->_connection = 0;
  }
  if (self->_queueSuspended)
  {
    sub_1000501E4(self);
    id v12 = sub_10004FCC0();
    dispatch_resume(v12);

    self->_queueSuspended = 0;
  }
  if (self->_personAdded)
  {
    CFURLRef v13 = +[SDConnectedBrowser sharedBrowser];
    [v13 removeAirDropPerson:self->_person];

    self->_personAdded = 0;
  }
  if (self->_transactionStarted)
  {
    self->_transactionStarted = 0;
    [(SDStatusMonitor *)self->_monitor airDropTransactionEnd:0];
  }
  [(SDAirDropConnection *)self releaseIdleSleepAssertion];
LABEL_27:
  transaction = self->_transaction;
  self->_transaction = 0;
}

- (BOOL)contactsOnly
{
  return self->_contactsOnly;
}

- (void)setContactsOnly:(BOOL)a3
{
  self->_contactsOnly = a3;
}

- (NSURL)destination
{
  return (NSURL *)objc_getProperty(self, a2, 32, 1);
}

- (void)setDestination:(id)a3
{
}

- (NSString)sessionID
{
  return (NSString *)objc_getProperty(self, a2, 200, 1);
}

- (void)setSessionID:(id)a3
{
}

- (BOOL)shouldExtractMediaFromPhotosBundles
{
  return self->_shouldExtractMediaFromPhotosBundles;
}

- (void)setShouldExtractMediaFromPhotosBundles:(BOOL)a3
{
  self->_shouldExtractMediaFromPhotosBundles = a3;
}

- (SDAirDropConnectionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SDAirDropConnectionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_mediaCapabilities, 0);
  objc_storeStrong((id *)&self->_askSemaphore, 0);
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_zipper, 0);
  objc_storeStrong((id *)&self->_requestData, 0);
  objc_storeStrong((id *)&self->_monitor, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_progress, 0);

  objc_storeStrong((id *)&self->_destination, 0);
}

@end