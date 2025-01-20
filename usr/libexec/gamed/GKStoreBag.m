@interface GKStoreBag
+ (BOOL)shouldIncludeClientInfoAuthHeaderForBagKey:(id)a3;
+ (id)appleIdSession;
+ (id)deviceInfo;
+ (id)protocolVersionForClient:(id)a3;
+ (id)storeBagForEnvironment:(int64_t)a3;
+ (id)storeBagForEnvironment:(int64_t)a3 dataRequestManager:(id)a4;
+ (id)storeBagForURL:(id)a3 dataRequestManager:(id)a4;
+ (id)storeBagURLForEnvironment:(int64_t)a3;
+ (id)storeBagURLTemplateForEnvironment:(int64_t)a3;
+ (void)addAppOriginHeadersToRequest:(id)a3 clientProxy:(id)a4;
+ (void)addAppOriginHeadersToRequest:(id)a3 signatureType:(id)a4 isFirstPartyApple:(id)a5;
+ (void)addAuthHeadersToRequest:(id)a3;
+ (void)addClientInfoAuthHeaderToRequest:(id)a3;
- (BOOL)_isExpired;
- (BOOL)_isFetching;
- (BOOL)_isLastProtocolVersionUsedValid;
- (BOOL)_isValid;
- (BOOL)_isValidAndNotExpired;
- (BOOL)_shouldUseHTTPPipelining;
- (BOOL)isLoadValidForBagKey:(id)a3 date:(id)a4;
- (BOOL)shouldUseHTTPPipelining;
- (GKActivity)activity;
- (GKDataRequestManager)dataRequestManager;
- (GKStoreBag)initWithURL:(id)a3 dataRequestManager:(id)a4;
- (NSDate)expiration;
- (NSDictionary)internalBag;
- (NSError)error;
- (NSNumber)metricsPassthroughPercentage;
- (NSSet)APNSRequired;
- (NSSet)responseSignatureRequired;
- (NSSet)signatureRequired;
- (NSURL)url;
- (double)mescalSetupStartTimeStamp;
- (id)_bagKeyValidationDict;
- (id)_networkSynchonizationQueue;
- (id)_storeBagForData:(id)a3 error:(id *)a4;
- (id)description;
- (id)omnitureQueryParametersForContext:(id)a3;
- (id)requestWithURL:(id)a3 playerID:(id)a4 authToken:(id)a5 pushToken:(id)a6 client:(id)a7 postData:(id)a8 includeUDID:(BOOL)a9 includeAPNS:(BOOL)a10 sapSession:(id)a11;
- (id)requestWithURL:(id)a3 playerID:(id)a4 authToken:(id)a5 pushToken:(id)a6 client:(id)a7 postData:(id)a8 includeUDID:(BOOL)a9 includeAPNS:(BOOL)a10 sapSession:(id)a11 includeAppOriginHeaders:(BOOL)a12;
- (id)requestWithURL:(id)a3 playerID:(id)a4 authToken:(id)a5 pushToken:(id)a6 client:(id)a7 postData:(id)a8 includeUDID:(BOOL)a9 includeAPNS:(BOOL)a10 sapSession:(id)a11 includeAppOriginHeaders:(BOOL)a12 includeClientInfoAuthHeader:(BOOL)a13;
- (id)valueForUndefinedKey:(id)a3;
- (id)verifyEligibilityForBagKey:(id)a3 checkingAllowedRequestKeys:(id)a4 client:(id)a5;
- (int)hashForPlayerID:(id)a3;
- (int64_t)_achievementsThrottleThreshold;
- (int64_t)_gkSessionRateLimiting;
- (int64_t)_scoresThrottleThreshold;
- (int64_t)achievementsThrottleThreshold;
- (int64_t)gkSessionRateLimiting;
- (int64_t)scoresThrottleThreshold;
- (void)_fetchBagWithHandler:(id)a3;
- (void)_fetchFromCacheWithHandler:(id)a3;
- (void)_fetchFromServerWithHandler:(id)a3;
- (void)_loadDataForBagKey:(id)a3 postData:(id)a4 client:(id)a5 credential:(id)a6 completion:(id)a7;
- (void)_metricsThrottleThreshold:(id)a3;
- (void)_sendAsynchronousRequest:(id)a3 responseMustBeSigned:(BOOL)a4 completion:(id)a5;
- (void)_sendOneAsyncTryWithRequest:(id)a3 responseMustBeSigned:(BOOL)a4 session:(id)a5 retryCount:(int)a6 completionHandler:(id)a7;
- (void)_setupAPNSRequired:(id)a3;
- (void)_setupResponseSignatureRequired:(id)a3;
- (void)_setupSignatureRequired:(id)a3;
- (void)_updatePlayerIDHashParameters;
- (void)dealloc;
- (void)getURLForKey:(id)a3 queue:(id)a4 handler:(id)a5;
- (void)getValuesForKeys:(id)a3 queue:(id)a4 completion:(id)a5;
- (void)getValuesWithCompletion:(id)a3;
- (void)invalidateBagKeys:(id)a3;
- (void)performAsync:(id)a3;
- (void)performSync:(id)a3;
- (void)readDataForBagKey:(id)a3 postData:(id)a4 client:(id)a5 credential:(id)a6 completion:(id)a7;
- (void)readDataForURL:(id)a3 postData:(id)a4 client:(id)a5 credential:(id)a6 includeUDID:(BOOL)a7 includeAPNS:(BOOL)a8 completion:(id)a9;
- (void)setAPNSRequired:(id)a3;
- (void)setActivity:(id)a3;
- (void)setDataRequestManager:(id)a3;
- (void)setError:(id)a3;
- (void)setExpiration:(id)a3;
- (void)setInternalBag:(id)a3;
- (void)setMescalSetupStartTimeStamp:(double)a3;
- (void)setMetricsPassthroughPercentage:(id)a3;
- (void)setResponseSignatureRequired:(id)a3;
- (void)setSignatureRequired:(id)a3;
- (void)setUrl:(id)a3;
- (void)signRequest:(id)a3 sapSession:(id)a4 postData:(id)a5;
- (void)updateURLPatternCache;
- (void)verifyEligibilityForBagKey:(id)a3 replyQueue:(id)a4 client:(id)a5 completion:(id)a6;
- (void)writeDataForBagKey:(id)a3 postData:(id)a4 client:(id)a5 credential:(id)a6 completion:(id)a7;
@end

@implementation GKStoreBag

- (void)getValuesWithCompletion:(id)a3
{
  if (!os_log_GKGeneral) {
    GKOSLoggers();
  }
  v5 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "GKStorebag: getBagWithHandler", buf, 2u);
  }
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100006324;
  v6[3] = &unk_1002DB8B8;
  v6[4] = self;
  v6[5] = a3;
  [(GKStoreBag *)self performAsync:v6];
}

- (void)verifyEligibilityForBagKey:(id)a3 replyQueue:(id)a4 client:(id)a5 completion:(id)a6
{
  objc_initWeak(&location, self);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100016D24;
  v11[3] = &unk_1002DBAF0;
  objc_copyWeak(&v12, &location);
  v11[4] = a3;
  v11[5] = a5;
  v11[6] = a4;
  v11[7] = a6;
  [(GKStoreBag *)self getValuesWithCompletion:v11];
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (id)verifyEligibilityForBagKey:(id)a3 checkingAllowedRequestKeys:(id)a4 client:(id)a5
{
  v8 = objc_alloc_init(GKPlayerInternalProvider);
  id v9 = [[-[GKPlayerInternalProvider localPlayer](v8, "localPlayer") hasAcknowledgedLatestGDPR];

  v10 = [GKNetworkRequestEligibilityChecker alloc];
  if ([a3 isEqualToString:@"gk-app-init"]) {
    id v11 = 0;
  }
  else {
    id v11 = [a5 isAppUnlistedAndDisallowed];
  }
  id v12 = [(GKNetworkRequestEligibilityChecker *)v10 initWithHasAcknowledgedLatestGDPR:v9 alwaysAllowedBagKeysObject:a4 isAppUnlistedAndDisallowed:v11];
  id v13 = [(GKNetworkRequestEligibilityChecker *)v12 verifyEligibilityWithBagKey:a3];

  return v13;
}

+ (id)storeBagForEnvironment:(int64_t)a3 dataRequestManager:(id)a4
{
  id v6 = a4;
  v7 = [a1 storeBagURLForEnvironment:a3];
  if (v7)
  {
    v8 = [a1 storeBagForURL:v7 dataRequestManager:v6];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)storeBagURLForEnvironment:(int64_t)a3
{
  v4 = @"jgubuxqd";
  if (a3 != 4)
  {
    if (a3 == 7)
    {
      v5 = +[GKPreferences shared];
      id v6 = [v5 storeBagURL];

      if (v6)
      {
        uint64_t v7 = +[NSURL URLWithString:v6];
        if (v7)
        {
          v8 = (void *)v7;
          goto LABEL_10;
        }
      }
    }
    if (!_os_feature_enabled_impl()) {
      v4 = @"3";
    }
  }
  id v9 = v4;
  id v6 = +[GKStoreBag storeBagURLTemplateForEnvironment:a3];
  v10 = [v6 stringByReplacingOccurrencesOfString:@"{ix}" withString:v9];

  v8 = +[NSURL URLWithString:v10];

LABEL_10:

  return v8;
}

+ (id)storeBagURLTemplateForEnvironment:(int64_t)a3
{
  if ((unint64_t)(a3 - 3) > 7) {
    return @"https://init.gc.apple.com/WebObjects/GKInit.woa/wa/getBag?ix={ix}";
  }
  else {
    return off_1002D9A38[a3 - 3];
  }
}

+ (id)storeBagForURL:(id)a3 dataRequestManager:(id)a4
{
  if (qword_1003298A8 != -1) {
    dispatch_once(&qword_1003298A8, &stru_1002DB728);
  }
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x3052000000;
  id v12 = sub_10011EAE8;
  id v13 = sub_10011EAF8;
  uint64_t v14 = 0;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10011EB04;
  block[3] = &unk_1002DB750;
  block[5] = a4;
  block[6] = &v9;
  block[4] = a3;
  dispatch_sync((dispatch_queue_t)qword_100329898, block);
  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);
  return v6;
}

- (void)performAsync:(id)a3
{
}

- (BOOL)_isValidAndNotExpired
{
  NSUInteger v3 = [(NSDictionary *)self->_internalBag count];
  if (v3)
  {
    [(NSDate *)self->_expiration timeIntervalSinceNow];
    LOBYTE(v3) = v4 > 0.0;
  }
  return v3;
}

+ (void)addAppOriginHeadersToRequest:(id)a3 clientProxy:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  +[GKClientAppSigningStatus headerValueForSignatureType:](GKClientAppSigningStatus, "headerValueForSignatureType:", [v5 appSignatureType]);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = objc_alloc((Class)NSNumber);
  id v8 = [v5 distributorIsFirstPartyApple];

  id v9 = [v7 initWithBool:v8];
  +[GKStoreBag addAppOriginHeadersToRequest:v6 signatureType:v10 isFirstPartyApple:v9];
}

+ (void)addAppOriginHeadersToRequest:(id)a3 signatureType:(id)a4 isFirstPartyApple:(id)a5
{
  id v9 = a3;
  id v7 = a5;
  [v9 setValue:a4 forHTTPHeaderField:@"x-gk-app-sig"];
  if (v7)
  {
    if ([v7 BOOLValue]) {
      CFStringRef v8 = @"true";
    }
    else {
      CFStringRef v8 = @"false";
    }
    [v9 setValue:v8 forHTTPHeaderField:@"x-gk-app-store"];
  }
}

+ (id)storeBagForEnvironment:(int64_t)a3
{
  double v4 = +[GKDataRequestManager sharedManager];
  id v5 = +[GKStoreBag storeBagForEnvironment:a3 dataRequestManager:v4];

  return v5;
}

- (void)performSync:(id)a3
{
  syncQueue = self->_syncQueue;
  if (dispatch_get_current_queue() == syncQueue) {
    +[NSException raise:format:](NSException, "raise:format:", @"GameKit Exception", @"%@", +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (dispatch_get_current_queue() != queue)\n[%s (%s:%d)]", +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s invoked on the same queue(\"%s\"), would deadlock at %@", "-[GKStoreBag performSync:]", dispatch_queue_get_label(syncQueue), +[NSThread callStackSymbols](NSThread, "callStackSymbols")), "-[GKStoreBag performSync:]", -[NSString UTF8String](-[NSString lastPathComponent](+[NSString stringWithUTF8String:](
  }
              NSString,
              "stringWithUTF8String:",
              "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKStoreBag+NoARC.m"),
            "lastPathComponent"),
          "UTF8String"),
        112));

  dispatch_sync(syncQueue, a3);
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)GKStoreBag;
  return +[NSString stringWithFormat:@"%@ : %@", [(GKStoreBag *)&v3 description], [(GKStoreBag *)self url]];
}

- (GKStoreBag)initWithURL:(id)a3 dataRequestManager:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)GKStoreBag;
  id v6 = [(GKStoreBag *)&v8 init];
  if (v6)
  {
    v6->_url = (NSURL *)[a3 copy];
    v6->_syncQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.GameKit.GKStoreBag.sync", 0);
    *(int32x2_t *)&v6->_playerIDHashMod = vdup_n_s32(0xF4240u);
    v6->_activity = (GKActivity *)+[GKActivity named:@"GKStoreBag initWithURL:"];
    v6->_dataRequestManager = (GKDataRequestManager *)a4;
  }
  return v6;
}

- (void)dealloc
{
  dispatch_release((dispatch_object_t)self->_syncQueue);
  v3.receiver = self;
  v3.super_class = (Class)GKStoreBag;
  [(GKStoreBag *)&v3 dealloc];
}

- (BOOL)_isExpired
{
  [(NSDate *)self->_expiration timeIntervalSinceNow];
  return v2 <= 0.0;
}

- (BOOL)_isValid
{
  return [(NSDictionary *)self->_internalBag count] != 0;
}

- (BOOL)_isFetching
{
  return self->_fetchGroup != 0;
}

- (BOOL)_isLastProtocolVersionUsedValid
{
  id v2 = [(id)objc_opt_class() protocolVersionForClient:0];
  objc_super v3 = +[NSUserDefaults standardUserDefaults];
  id v4 = [(NSUserDefaults *)v3 valueForKey:GKLastProtocolVersionUsedKey];

  return [v2 isEqualToString:v4];
}

- (void)_fetchFromCacheWithHandler:(id)a3
{
  current_queue = dispatch_get_current_queue();
  syncQueue = self->_syncQueue;
  if (current_queue != syncQueue)
  {
    label = dispatch_queue_get_label(current_queue);
    +[NSException raise:format:](NSException, "raise:format:", @"GameKit Exception", @"%@", +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (_actualCurrentQueue == _syncQueue)\n[%s (%s:%d)]", +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s invoked on the wrong queue (got:%s expected:%s) at %@", "-[GKStoreBag _fetchFromCacheWithHandler:]", label, dispatch_queue_get_label(syncQueue), +[NSThread callStackSymbols](NSThread, "callStackSymbols")), "-[GKStoreBag _fetchFromCacheWithHandler:]", -[NSString UTF8String](-[NSString lastPathComponent](
            +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKStoreBag+NoARC.m"], "lastPathComponent"), "UTF8String"), 216));
  }
  if ([(GKStoreBag *)self _isLastProtocolVersionUsedValid])
  {
    id v8 = [[[GKInsecureCacheRoot() stringByAppendingPathComponent:@"StoreBag"] stringByAppendingPathComponent:-[NSURL cacheKeyRepresentation](-[GKStoreBag url](self, "url"), "cacheKeyRepresentation")];
    id v9 = objc_alloc_init((Class)NSFileManager);
    id v10 = +[NSData dataWithContentsOfFile:v8];
    [v9 _gkExpirationIntervalOfFileAtPath:v8];
    double v12 = v11;

    uint64_t v17 = 0;
    if (v10)
    {
      id v10 = [(GKStoreBag *)self _storeBagForData:v10 error:&v17];
      id v13 = +[NSDate dateWithTimeIntervalSinceNow:v12];
      [(GKStoreBag *)self _setupAPNSRequired:v10];
      [(GKStoreBag *)self _setupSignatureRequired:v10];
      [(GKStoreBag *)self _setupResponseSignatureRequired:v10];
      uint64_t v14 = v17;
    }
    else
    {
      uint64_t v14 = 0;
      id v13 = 0;
    }
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10011F034;
    v16[3] = &unk_1002DB7A0;
    v16[4] = self;
    v16[5] = v10;
    v16[6] = v13;
    v16[7] = v14;
    v16[8] = a3;
    v15 = v16;
  }
  else
  {
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10011F024;
    v18[3] = &unk_1002DB778;
    v18[4] = a3;
    v15 = v18;
  }
  [(GKStoreBag *)self performAsync:v15];
}

+ (id)protocolVersionForClient:(id)a3
{
  if (a3)
  {
    return _[a3 protocolVersion];
  }
  else
  {
    [+[GKPreferences shared](GKPreferences, "shared", v3) useTestProtocols];
    return (id)GKGetProtocolVersionString();
  }
}

- (void)_fetchFromServerWithHandler:(id)a3
{
  current_queue = dispatch_get_current_queue();
  syncQueue = self->_syncQueue;
  if (current_queue != syncQueue)
  {
    label = dispatch_queue_get_label(current_queue);
    +[NSException raise:format:](NSException, "raise:format:", @"GameKit Exception", @"%@", +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (_actualCurrentQueue == _syncQueue)\n[%s (%s:%d)]", +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s invoked on the wrong queue (got:%s expected:%s) at %@", "-[GKStoreBag _fetchFromServerWithHandler:]", label, dispatch_queue_get_label(syncQueue), +[NSThread callStackSymbols](NSThread, "callStackSymbols")), "-[GKStoreBag _fetchFromServerWithHandler:]", -[NSString UTF8String](-[NSString lastPathComponent](
            +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKStoreBag+NoARC.m"], "lastPathComponent"), "UTF8String"), 269));
  }
  id v8 = [(GKStoreBag *)self url];
  id v9 = [(id)objc_opt_class() protocolVersionForClient:0];
  id v10 = +[NSMutableURLRequest _gkHTTPRequestWithURL:v8 postData:0 protocolVersion:v9];
  [v10 setRequestPriority:2];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10011F2BC;
  v11[3] = &unk_1002DB7F0;
  v11[4] = self;
  v11[5] = v9;
  v11[6] = v8;
  v11[7] = a3;
  [(id)objc_opt_class() _gkSendAsynchronousRequest:v10 completionHandler:v11];
}

- (void)_fetchBagWithHandler:(id)a3
{
  if (!os_log_GKGeneral) {
    GKOSLoggers();
  }
  id v5 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "GKStorebag: _fetchBagWithHandler:", buf, 2u);
  }
  current_queue = dispatch_get_current_queue();
  syncQueue = self->_syncQueue;
  if (current_queue != syncQueue)
  {
    label = dispatch_queue_get_label(current_queue);
    +[NSException raise:format:](NSException, "raise:format:", @"GameKit Exception", @"%@", +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (_actualCurrentQueue == _syncQueue)\n[%s (%s:%d)]", +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s invoked on the wrong queue (got:%s expected:%s) at %@", "-[GKStoreBag _fetchBagWithHandler:]", label, dispatch_queue_get_label(syncQueue), +[NSThread callStackSymbols](NSThread, "callStackSymbols")), "-[GKStoreBag _fetchBagWithHandler:]", -[NSString UTF8String](-[NSString lastPathComponent](
            +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKStoreBag+NoARC.m"], "lastPathComponent"), "UTF8String"), 335));
  }
  id v9 = +[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKStoreBag+NoARC.m", 336, "-[GKStoreBag _fetchBagWithHandler:]"));
  id v10 = v9;
  fetchGroup = self->_fetchGroup;
  if (fetchGroup)
  {
    double v12 = self->_syncQueue;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10011F94C;
    v15[3] = &unk_1002DB818;
    v15[4] = self;
    v15[5] = a3;
    [(GKDispatchGroup *)v9 join:fetchGroup queue:v12 block:v15];
  }
  else
  {
    self->_fetchGroup = v9;
    if ([(GKStoreBag *)self _isValid])
    {
      v14[12] = _NSConcreteStackBlock;
      v14[13] = 3221225472;
      v14[14] = sub_10011F970;
      v14[15] = &unk_1002DB840;
      v14[16] = self;
    }
    else
    {
      v14[6] = _NSConcreteStackBlock;
      v14[7] = 3221225472;
      v14[8] = sub_10011F9F0;
      v14[9] = &unk_1002DB890;
      v14[10] = self;
      v14[11] = v10;
    }
    -[GKDispatchGroup perform:](v10, "perform:");
    id v13 = self->_syncQueue;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10011FB80;
    v14[3] = &unk_1002DB8B8;
    v14[4] = self;
    v14[5] = a3;
    [(GKDispatchGroup *)v10 notifyOnQueue:v13 block:v14];
  }
}

- (void)_setupAPNSRequired:(id)a3
{
  uint64_t v4 = (_UNKNOWN **)[a3 objectForKey:@"gk-push-token-required"];
  if (v4) {
    id v5 = v4;
  }
  else {
    id v5 = &off_1002F2F30;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    +[NSException raise:format:](NSException, "raise:format:", @"GameKit Exception", @"%@", +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ ([APNSRequiredArray isKindOfClass:[NSArray class]])\n[%s (%s:%d)]", +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"got %@, expected NSArray", objc_opt_class()), "-[GKStoreBag _setupAPNSRequired:]", -[NSString UTF8String](-[NSString lastPathComponent](+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:",
  }
              "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKStoreBag+NoARC.m"),
            "lastPathComponent"),
          "UTF8String"),
        425));
  id v6 = +[NSSet setWithArray:v5];

  [(GKStoreBag *)self setAPNSRequired:v6];
}

- (void)_setupSignatureRequired:(id)a3
{
  id v4 = [a3 objectForKey:@"gk-sap-signed-requests"];
  [(GKStoreBag *)self setSignatureRequired:0];
  if (v4)
  {
    id v5 = +[NSSet setWithArray:v4];
    [(GKStoreBag *)self setSignatureRequired:v5];
  }
}

- (void)_metricsThrottleThreshold:(id)a3
{
  id v4 = [a3 objectForKey:@"gk-metrics-pct"];

  [(GKStoreBag *)self setMetricsPassthroughPercentage:v4];
}

- (void)_setupResponseSignatureRequired:(id)a3
{
  id v4 = [a3 objectForKey:@"gk-sap-signed-response-include-patterns"];
  [(GKStoreBag *)self setResponseSignatureRequired:0];
  if (v4)
  {
    id v5 = +[NSSet setWithArray:v4];
    [(GKStoreBag *)self setResponseSignatureRequired:v5];
  }
}

- (void)getURLForKey:(id)a3 queue:(id)a4 handler:(id)a5
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10011FF24;
  v5[3] = &unk_1002DB958;
  v5[4] = self;
  v5[5] = a3;
  v5[6] = a4;
  v5[7] = a5;
  -[GKActivity childNamed:execute:](-[GKStoreBag activity](self, "activity"), "childNamed:execute:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKStoreBag+NoARC.m", 458, "-[GKStoreBag getURLForKey:queue:handler:]"), v5);
}

- (void)getValuesForKeys:(id)a3 queue:(id)a4 completion:(id)a5
{
  if (!os_log_GKGeneral) {
    GKOSLoggers();
  }
  id v9 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "GKStoreBag: getValuesForKeys", buf, 2u);
  }
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100120164;
  v10[3] = &unk_1002DB930;
  v10[4] = a3;
  v10[5] = a4;
  v10[6] = self;
  v10[7] = a5;
  [(GKStoreBag *)self getValuesWithCompletion:v10];
}

- (id)valueForUndefinedKey:(id)a3
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3052000000;
  id v9 = sub_10011EAE8;
  id v10 = sub_10011EAF8;
  uint64_t v11 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100120308;
  v5[3] = &unk_1002DB750;
  v5[5] = a3;
  v5[6] = &v6;
  v5[4] = self;
  [(GKStoreBag *)self performSync:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)omnitureQueryParametersForContext:(id)a3
{
  id v4 = [(NSDictionary *)self->_internalBag objectForKey:GKQueryParamsBagKey];

  return [v4 objectForKey:a3];
}

- (BOOL)shouldUseHTTPPipelining
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100120448;
  v4[3] = &unk_1002DB980;
  v4[4] = self;
  v4[5] = &v5;
  [(GKStoreBag *)self performSync:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (BOOL)_shouldUseHTTPPipelining
{
  id v3 = [[+[GKPreferences shared](GKPreferences, "shared") pipeliningSetting];
  if (v3 == (id)2) {
    return 1;
  }
  if (v3) {
    return 0;
  }
  return [[-[NSDictionary objectForKey:](self->_internalBag, "objectForKey:", @"gk-disable-http-pipelining") stringByAppendingPathComponent:@"DBCShutdownCookie"];
}

- (int64_t)gkSessionRateLimiting
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10012059C;
  v4[3] = &unk_1002DB980;
  v4[4] = self;
  v4[5] = &v5;
  [(GKStoreBag *)self performSync:v4];
  int64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (int64_t)_gkSessionRateLimiting
{
  int64_t result = (int64_t)[self->_internalBag valueForKey:@"valueForKey:GKSessionRateLimiting"];
  if (!result) {
    return 5;
  }
  return result;
}

- (int64_t)achievementsThrottleThreshold
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1001206C4;
  v4[3] = &unk_1002DB980;
  v4[4] = self;
  v4[5] = &v5;
  [(GKStoreBag *)self performSync:v4];
  int64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (int64_t)_achievementsThrottleThreshold
{
  int64_t result = (int64_t)[self->_internalBag valueForKey:@"GKAchievementsThrottleThreshold"];
  if (!result) {
    return 5;
  }
  return result;
}

- (int64_t)scoresThrottleThreshold
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1001207EC;
  v4[3] = &unk_1002DB980;
  v4[4] = self;
  v4[5] = &v5;
  [(GKStoreBag *)self performSync:v4];
  int64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (int64_t)_scoresThrottleThreshold
{
  int64_t result = (int64_t)[self->_internalBag valueForKey:@"GKScoresThrottleThreshold"];
  if (!result) {
    return 5;
  }
  return result;
}

- (id)_storeBagForData:(id)a3 error:(id *)a4
{
  uint64_t v22 = 100;
  id v5 = +[NSPropertyListSerialization propertyListWithData:a3 options:0 format:&v22 error:a4];
  if (!v5 || (uint64_t v6 = v5, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    if (!os_log_GKGeneral) {
      GKOSLoggers();
    }
    id v10 = os_log_GKDaemon;
    if (!os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO)) {
      goto LABEL_13;
    }
    uint64_t v11 = objc_opt_class();
    id v12 = *a4;
    *(_DWORD *)buf = 138412546;
    uint64_t v24 = v11;
    __int16 v25 = 2112;
    id v26 = v12;
    id v13 = "GKStoreBag: %@: bad responseDict: %@";
    uint64_t v14 = v10;
    uint32_t v15 = 22;
    goto LABEL_12;
  }
  id v7 = [v6 objectForKey:@"bag"];
  if (!v7)
  {
    if (!os_log_GKGeneral) {
      GKOSLoggers();
    }
    v20 = os_log_GKDaemon;
    if (!os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO)) {
      goto LABEL_13;
    }
    uint64_t v21 = objc_opt_class();
    *(_DWORD *)buf = 138412290;
    uint64_t v24 = v21;
    id v13 = "GKStoreBag: %@: bad bagData";
    uint64_t v14 = v20;
    uint32_t v15 = 12;
LABEL_12:
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, v13, buf, v15);
LABEL_13:
    id v8 = 0;
    goto LABEL_14;
  }
  id v8 = +[NSPropertyListSerialization propertyListWithData:v7 options:0 format:&v22 error:a4];
  if (v8)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v9 = 0;
      if (!a4) {
        return v8;
      }
      goto LABEL_15;
    }
  }
  if (!os_log_GKGeneral) {
    GKOSLoggers();
  }
  uint64_t v17 = os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    uint64_t v18 = objc_opt_class();
    id v19 = *a4;
    *(_DWORD *)buf = 138412546;
    uint64_t v24 = v18;
    __int16 v25 = 2112;
    id v26 = v19;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "GKStoreBag: %@: Could not unserialize the URL bag: %@", buf, 0x16u);
  }
LABEL_14:
  id v9 = +[NSError userErrorForCode:3 underlyingError:0];
  if (a4) {
LABEL_15:
  }
    *a4 = v9;
  return v8;
}

- (void)updateURLPatternCache
{
  if ([(GKDataRequestManager *)[(GKStoreBag *)self dataRequestManager] storeBag] != self)
  {
    if (!os_log_GKGeneral) {
      GKOSLoggers();
    }
    id v3 = os_log_GKDaemon;
    if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      id v4 = "Received update for bag that isn't current. Ignoring. See <rdar://problem/12960277>.";
      id v5 = v3;
      uint32_t v6 = 2;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, v4, buf, v6);
      return;
    }
    return;
  }
  id v7 = [(GKStoreBag *)self internalBag];
  id v8 = [(NSDictionary *)v7 objectForKeyedSubscript:@"gk-launch-gamecenter-host-patterns"];
  id v9 = [(NSDictionary *)v7 objectForKeyedSubscript:@"gk-launch-gamecenter-path-patterns"];
  if (!v8) {
    return;
  }
  id v10 = v9;
  if (!v9) {
    return;
  }
  uint64_t v11 = +[NSUserDefaults standardUserDefaults];
  id v12 = [(NSUserDefaults *)v11 URLForKey:@"GKURLPatternCacheBagURLUserDefaultsKey"];
  [[-[NSUserDefaults objectForKey:](v11, "objectForKey:", @"GKURLPatternCacheExpirationDateUserDefaultsKey") timeIntervalSinceDate:][GKStoreBag expiration](self, "expiration")];
  double v14 = v13;
  if ([(NSURL *)[(GKStoreBag *)self url] isEqual:v12])
  {
    if (v14 >= 0.0) {
      return;
    }
  }
  [(NSUserDefaults *)v11 setURL:[(GKStoreBag *)self url] forKey:@"GKURLPatternCacheBagURLUserDefaultsKey"];
  [(NSUserDefaults *)v11 setObject:[(GKStoreBag *)self expiration] forKey:@"GKURLPatternCacheExpirationDateUserDefaultsKey"];
  if (!os_log_GKGeneral) {
    GKOSLoggers();
  }
  uint32_t v15 = os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Updating URL pattern cache", buf, 2u);
  }
  v24[1] = @"gk-launch-gamecenter-path-patterns";
  v25[0] = v8;
  v24[0] = @"gk-launch-gamecenter-host-patterns";
  v25[1] = [v10 arrayByAddingObject:@"^/(me|players|friends|games|requests|challenges|htmlResources)($|/.*)"];
  v16 = +[NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:2];
  id v17 = [(id)CPSharedResourcesDirectory() stringByAppendingPathComponent:@"Library/Caches/com.apple.gamed/url-resolution.plist"];
  uint64_t v21 = 0;
  if (!-[NSFileManager createDirectoryAtPath:withIntermediateDirectories:attributes:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", [v17 stringByDeletingLastPathComponent], 1, 0, &v21))
  {
    if (!os_log_GKGeneral) {
      GKOSLoggers();
    }
    v20 = os_log_GKDaemon;
    if (!os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO)) {
      return;
    }
    *(_DWORD *)buf = 138412290;
    uint64_t v23 = v21;
    id v4 = "Failed to create folder for url pattern cache: %@";
LABEL_31:
    id v5 = v20;
    uint32_t v6 = 12;
    goto LABEL_6;
  }
  uint64_t v18 = +[NSPropertyListSerialization dataWithPropertyList:v16 format:200 options:0 error:&v21];
  if (!v18)
  {
    if (!os_log_GKGeneral) {
      GKOSLoggers();
    }
    v20 = os_log_GKDaemon;
    if (!os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO)) {
      return;
    }
    *(_DWORD *)buf = 138412290;
    uint64_t v23 = v21;
    id v4 = "Failed to decode data for url pattern cache: %@";
    goto LABEL_31;
  }
  if ([(NSData *)v18 writeToFile:v17 options:0 error:&v21])
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.gamed.changed-url-resolution", 0, 0, 1u);
    return;
  }
  if (!os_log_GKGeneral) {
    GKOSLoggers();
  }
  v20 = os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v23 = v21;
    id v4 = "Failed to write url pattern cache: %@";
    goto LABEL_31;
  }
}

- (void)_updatePlayerIDHashParameters
{
  int64_t v2 = [(GKStoreBag *)self internalBag];
  id v3 = [(NSDictionary *)v2 objectForKey:GKPlayerIDHashModKey];
  id v4 = [(NSDictionary *)v2 objectForKey:GKPlayerIDHashAddKey];
  if (v3) {
    BOOL v5 = v4 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (!v5)
  {
    uint32_t v6 = v4;
    do
      [v3 integerValue];
    while (!GKAtomicCompareAndSwap32Barrier());
    do
      [v6 integerValue];
    while (!GKAtomicCompareAndSwap32Barrier());
  }
}

- (int)hashForPlayerID:(id)a3
{
  uint64_t v4 = (uint64_t)[a3 hash];
  if (v4 >= 0) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = -v4;
  }
  return self->_playerIDHashAdd + v5 % self->_playerIDHashMod;
}

- (void)signRequest:(id)a3 sapSession:(id)a4 postData:(id)a5
{
  [a3 _gkSetSAPSession:a4];
  [a3 setHTTPShouldUsePipelining:-[GKStoreBag _shouldUseHTTPPipelining](self, "_shouldUseHTTPPipelining")];
  if (a4)
  {
    if (a5)
    {
      id v9 = [[objc_msgSend(a3, "HTTPBody") _gkZippedData];
      if (v9)
      {
        id v10 = v9;
        uint64_t v15 = 0;
        if (CC_SHA1([v9 bytes], (CC_LONG)objc_msgSend(v9, "length"), md))
        {
          uint64_t v11 = +[NSData dataWithBytes:md length:20];
        }
        else
        {
          if (!os_log_GKGeneral) {
            GKOSLoggers();
          }
          id v12 = os_log_GKDaemon;
          if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "GKStoreBag:ISSHA1DataForBytes failed", buf, 2u);
          }
          uint64_t v11 = 0;
        }
        [a3 setHTTPBody:v10];
        [a3 setSAPSignature:[a4 signatureForData:v11 error:&v15]];
        [a3 setSAPversion:[a4 SAPVersion]];
        [a3 setValue:@"gzip" forHTTPHeaderField:@"content-encoding"];
        if (!os_log_GKGeneral) {
          GKOSLoggers();
        }
        double v13 = os_log_GKDaemon;
        if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
        {
          id v14 = [a3 loggableHeaders];
          *(_DWORD *)md = 138412546;
          id v18 = a3;
          __int16 v19 = 2112;
          id v20 = v14;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "MESCAL:signed body of request:%@ %@", md, 0x16u);
        }
      }
    }
  }
}

- (id)requestWithURL:(id)a3 playerID:(id)a4 authToken:(id)a5 pushToken:(id)a6 client:(id)a7 postData:(id)a8 includeUDID:(BOOL)a9 includeAPNS:(BOOL)a10 sapSession:(id)a11
{
  LOBYTE(v13) = 0;
  LOWORD(v12) = __PAIR16__(a10, a9);
  return -[GKStoreBag requestWithURL:playerID:authToken:pushToken:client:postData:includeUDID:includeAPNS:sapSession:includeAppOriginHeaders:](self, "requestWithURL:playerID:authToken:pushToken:client:postData:includeUDID:includeAPNS:sapSession:includeAppOriginHeaders:", a3, a4, a5, a6, a7, a8, v12, a11, v13);
}

- (id)requestWithURL:(id)a3 playerID:(id)a4 authToken:(id)a5 pushToken:(id)a6 client:(id)a7 postData:(id)a8 includeUDID:(BOOL)a9 includeAPNS:(BOOL)a10 sapSession:(id)a11 includeAppOriginHeaders:(BOOL)a12
{
  LOWORD(v14) = a12;
  LOWORD(v13) = __PAIR16__(a10, a9);
  return -[GKStoreBag requestWithURL:playerID:authToken:pushToken:client:postData:includeUDID:includeAPNS:sapSession:includeAppOriginHeaders:includeClientInfoAuthHeader:](self, "requestWithURL:playerID:authToken:pushToken:client:postData:includeUDID:includeAPNS:sapSession:includeAppOriginHeaders:includeClientInfoAuthHeader:", a3, a4, a5, a6, a7, a8, v13, a11, v14);
}

- (id)requestWithURL:(id)a3 playerID:(id)a4 authToken:(id)a5 pushToken:(id)a6 client:(id)a7 postData:(id)a8 includeUDID:(BOOL)a9 includeAPNS:(BOOL)a10 sapSession:(id)a11 includeAppOriginHeaders:(BOOL)a12 includeClientInfoAuthHeader:(BOOL)a13
{
  id v19 = +[NSMutableURLRequest _gkHTTPRequestWithURL:postData:protocolVersion:](NSMutableURLRequest, "_gkHTTPRequestWithURL:postData:protocolVersion:", a3, a8, [(id)objc_opt_class() protocolVersionForClient:a7]);
  [v19 setPlayerID:a4 hash:[self hashForPlayerID:a4] authToken:a5];
  if (a10) {
    [v19 setPushToken:a6];
  }
  [v19 setGameDescriptor:[a7 gameDescriptor]];
  [v19 setLocale:[a7 locale]];
  if (a9) {
    [v19 setDeviceUniqueID];
  }
  if (a12) {
    +[GKStoreBag addAppOriginHeadersToRequest:v19 clientProxy:a7];
  }
  if (a13) {
    [(id)objc_opt_class() addClientInfoAuthHeaderToRequest:v19];
  }
  [(GKStoreBag *)self signRequest:v19 sapSession:a11 postData:a8];
  return v19;
}

+ (id)appleIdSession
{
  if (qword_1003298B8 != -1) {
    dispatch_once(&qword_1003298B8, &stru_1002DB9A0);
  }
  return (id)qword_1003298B0;
}

+ (id)deviceInfo
{
  if (qword_1003298C8 != -1) {
    dispatch_once(&qword_1003298C8, &stru_1002DB9C0);
  }
  return (id)qword_1003298C0;
}

+ (BOOL)shouldIncludeClientInfoAuthHeaderForBagKey:(id)a3
{
  unsigned int v4 = [[+[GKPreferences shared](GKPreferences, "shared") requestHeadersPrivacyEnabled];
  if (v4)
  {
    LOBYTE(v4) = [a3 isEqualToString:@"gk-authenticate-user"];
  }
  return v4;
}

+ (void)addClientInfoAuthHeaderToRequest:(id)a3
{
  id v4 = +[GKStoreBag deviceInfo];

  [a3 setValue:v4 forHTTPHeaderField:@"X-MMe-Client-Info"];
}

+ (void)addAuthHeadersToRequest:(id)a3
{
  id v4 = [(id)objc_opt_class() appleIdSession];
  if (([[GKPreferences shared](GKPreferences, "shared") requestHeadersPrivacyEnabled] & 1) == 0)[[objc_opt_class() addClientInfoAuthHeaderToRequest:a3];
  id v5 = [v4 appleIDHeadersForRequest:a3];
  }
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100121610;
  v6[3] = &unk_1002DB9E8;
  unsigned __int8 v7 = [[+[GKPreferences shared](GKPreferences, "shared") requestHeadersPrivacyEnabled];
  v6[4] = a3;
  [v5 enumerateKeysAndObjectsUsingBlock:v6];
}

- (void)_sendAsynchronousRequest:(id)a3 responseMustBeSigned:(BOOL)a4 completion:(id)a5
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100121764;
  v5[3] = &unk_1002DBA38;
  v5[4] = self;
  v5[5] = a3;
  BOOL v6 = a4;
  v5[6] = a5;
  -[GKActivity childNamed:execute:](-[GKStoreBag activity](self, "activity"), "childNamed:execute:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKStoreBag+NoARC.m", 959, "-[GKStoreBag _sendAsynchronousRequest:responseMustBeSigned:completion:]"), v5);
}

- (void)_sendOneAsyncTryWithRequest:(id)a3 responseMustBeSigned:(BOOL)a4 session:(id)a5 retryCount:(int)a6 completionHandler:(id)a7
{
  if (a3)
  {
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = os_log_GKHTTP;
    if (os_log_type_enabled(os_log_GKHTTP, OS_LOG_TYPE_INFO))
    {
      if (!os_log_GKGeneral)
      {
        GKOSLoggers();
        uint64_t v14 = os_log_GKHTTP;
      }
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v22 = a3;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "timestamp at which REQUEST %@ was sent", buf, 0xCu);
      }
    }
    +[GKStoreBag addAuthHeadersToRequest:a3];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100121A7C;
    v18[3] = &unk_1002DBA60;
    v18[4] = a5;
    void v18[5] = a3;
    int v19 = a6;
    BOOL v20 = a4;
    v18[6] = self;
    v18[7] = a7;
    [v13 _gkSendAsynchronousRequest:a3 completionHandler:v18];
  }
  else if (a7)
  {
    id v15 = +[NSError userErrorForCode:userInfo:](NSError, "userErrorForCode:userInfo:", 17, 0, a5, *(void *)&a6);
    v16 = (void (*)(id, void, id, __n128))*((void *)a7 + 2);
    v17.n128_u64[0] = 0;
    v16(a7, 0, v15, v17);
  }
}

- (id)_bagKeyValidationDict
{
  if (qword_1003298D8 != -1) {
    dispatch_once(&qword_1003298D8, &stru_1002DBA80);
  }
  return (id)qword_1003298D0;
}

- (void)invalidateBagKeys:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1001224E4;
  v4[3] = &unk_1002DBAA8;
  v4[4] = a3;
  v4[5] = +[NSDate date];
  [self _bagKeyValidationDict].writeToDictionary:v4;
}

- (BOOL)isLoadValidForBagKey:(id)a3 date:(id)a4
{
  id v5 = [[-[GKStoreBag _bagKeyValidationDict](self, "_bagKeyValidationDict") objectForKey:a3];
  if (!v5) {
    return 1;
  }
  [a4 timeIntervalSinceDate:v5];
  return v6 > 0.0;
}

- (id)_networkSynchonizationQueue
{
  if (qword_1003298E8 != -1) {
    dispatch_once(&qword_1003298E8, &stru_1002DBAC8);
  }
  return (id)qword_1003298E0;
}

- (void)_loadDataForBagKey:(id)a3 postData:(id)a4 client:(id)a5 credential:(id)a6 completion:(id)a7
{
  id v13 = a5;
  if (!a5)
  {
    if (!os_log_GKGeneral) {
      GKOSLoggers();
    }
    uint64_t v14 = os_log_GKTrace;
    if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "_loadDataForBagKey: nil client provided, will instantiate one", buf, 2u);
    }
    id v13 = +[GKClientProxy gameCenterClient];
  }
  *(void *)buf = 0;
  id v22 = buf;
  uint64_t v23 = 0x3052000000;
  uint64_t v24 = sub_10011EAE8;
  __int16 v25 = sub_10011EAF8;
  uint64_t v26 = 0;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3052000000;
  v20[3] = sub_10011EAE8;
  v20[4] = sub_10011EAF8;
  v20[5] = 0;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x2020000000;
  v19[3] = 0;
  dispatch_group_t v15 = dispatch_group_create();
  v16 = +[NSDate date];
  if (!a4)
  {
    if ([a3 isEqual:@"gk-sap-setup-cert-url"]) {
      a4 = 0;
    }
    else {
      a4 = -[NSDictionary _gkPlistXMLDataForClient:player:](+[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v16, @"gk-post-data", 0), "_gkPlistXMLDataForClient:player:", v13, [a6 playerInternal]);
    }
  }
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100122998;
  v17[3] = &unk_1002DBC00;
  v17[4] = self;
  v17[5] = v15;
  v17[6] = a3;
  v17[7] = v13;
  v17[8] = a6;
  v17[9] = a4;
  v17[12] = v20;
  v17[13] = buf;
  v17[14] = v19;
  v17[10] = v16;
  v17[11] = a7;
  BOOL v18 = a5 == 0;
  -[GKActivity childNamed:execute:](-[GKStoreBag activity](self, "activity"), "childNamed:execute:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKStoreBag+NoARC.m", 1220, "-[GKStoreBag _loadDataForBagKey:postData:client:credential:completion:]"), v17);
  _Block_object_dispose(v19, 8);
  _Block_object_dispose(v20, 8);
  _Block_object_dispose(buf, 8);
}

- (void)writeDataForBagKey:(id)a3 postData:(id)a4 client:(id)a5 credential:(id)a6 completion:(id)a7
{
  if (!os_log_GKGeneral) {
    GKOSLoggers();
  }
  id v13 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "GKStoreBag: writeDataForBagKey", buf, 2u);
  }
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100123444;
  v14[3] = &unk_1002DBC50;
  v14[4] = self;
  v14[5] = a3;
  v14[6] = a4;
  v14[7] = a5;
  v14[8] = a6;
  v14[9] = a7;
  dispatch_barrier_async((dispatch_queue_t)[(GKStoreBag *)self _networkSynchonizationQueue], v14);
}

- (void)readDataForBagKey:(id)a3 postData:(id)a4 client:(id)a5 credential:(id)a6 completion:(id)a7
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001235C4;
  v7[3] = &unk_1002DBC50;
  v7[4] = self;
  v7[5] = a3;
  v7[6] = a4;
  v7[7] = a5;
  v7[8] = a6;
  v7[9] = a7;
  -[GKActivity childNamed:execute:](-[GKStoreBag activity](self, "activity"), "childNamed:execute:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKStoreBag+NoARC.m", 1369, "-[GKStoreBag readDataForBagKey:postData:client:credential:completion:]"), v7);
}

- (void)readDataForURL:(id)a3 postData:(id)a4 client:(id)a5 credential:(id)a6 includeUDID:(BOOL)a7 includeAPNS:(BOOL)a8 completion:(id)a9
{
  id v10 = a5;
  if (!a5) {
    id v10 = +[GKClientProxy gameCenterClient];
  }
  v24[0] = 0;
  v24[1] = v24;
  void v24[2] = 0x3052000000;
  v24[3] = sub_10011EAE8;
  v24[4] = sub_10011EAF8;
  v24[5] = 0;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x3052000000;
  v23[3] = sub_10011EAE8;
  v23[4] = sub_10011EAF8;
  v23[5] = 0;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x2020000000;
  v22[3] = 0;
  uint64_t v14 = dispatch_group_create();
  dispatch_group_enter(v14);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001238A8;
  block[3] = &unk_1002DBCA0;
  block[4] = self;
  block[5] = a3;
  block[6] = a6;
  void block[7] = v10;
  BOOL v20 = a7;
  BOOL v21 = a8;
  block[8] = a4;
  block[9] = v14;
  block[10] = v24;
  block[11] = v22;
  block[12] = v23;
  dispatch_async((dispatch_queue_t)[(GKStoreBag *)self _networkSynchonizationQueue], block);
  global_queue = dispatch_get_global_queue(0, 0);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100123AB4;
  v18[3] = &unk_1002DBCC8;
  v18[4] = a9;
  void v18[5] = v24;
  v18[6] = v22;
  v18[7] = v23;
  dispatch_group_notify(v14, global_queue, v18);
  dispatch_release(v14);
  _Block_object_dispose(v22, 8);
  _Block_object_dispose(v23, 8);
  _Block_object_dispose(v24, 8);
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (NSSet)APNSRequired
{
  return (NSSet *)objc_getProperty(self, a2, 48, 1);
}

- (void)setAPNSRequired:(id)a3
{
}

- (NSSet)signatureRequired
{
  return (NSSet *)objc_getProperty(self, a2, 56, 1);
}

- (void)setSignatureRequired:(id)a3
{
}

- (NSSet)responseSignatureRequired
{
  return (NSSet *)objc_getProperty(self, a2, 64, 1);
}

- (void)setResponseSignatureRequired:(id)a3
{
}

- (NSNumber)metricsPassthroughPercentage
{
  return self->_metricsPassthroughPercentage;
}

- (void)setMetricsPassthroughPercentage:(id)a3
{
}

- (NSDictionary)internalBag
{
  return self->_internalBag;
}

- (void)setInternalBag:(id)a3
{
}

- (NSDate)expiration
{
  return self->_expiration;
}

- (void)setExpiration:(id)a3
{
}

- (double)mescalSetupStartTimeStamp
{
  return self->_mescalSetupStartTimeStamp;
}

- (void)setMescalSetupStartTimeStamp:(double)a3
{
  self->_mescalSetupStartTimeStamp = a3;
}

- (GKActivity)activity
{
  return self->_activity;
}

- (void)setActivity:(id)a3
{
}

- (GKDataRequestManager)dataRequestManager
{
  return self->_dataRequestManager;
}

- (void)setDataRequestManager:(id)a3
{
}

@end