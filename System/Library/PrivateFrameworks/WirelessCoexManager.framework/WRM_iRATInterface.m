@interface WRM_iRATInterface
- (WRM_iRATInterface)init;
- (int)getStatusUpdateMessageType:(int)a3;
- (int)getSubscribeMessageType:(int)a3;
- (void)_expediteBBAssertionBGAppActive_sync:(BOOL)a3 handler:(id)a4;
- (void)addAppType:(id)a3;
- (void)addProximityLinkRecommendationType:(id)a3;
- (void)assertCommCenterBaseBandMode:(int)a3;
- (void)expediteBBAssertionBGAppActive:(BOOL)a3 handler:(id)a4;
- (void)expediteCellularForReason:(BOOL)a3 reason:(id)a4;
- (void)getLinkRecommendationMetrics:(id)a3;
- (void)getMLPredictedThroughput:(id)a3 options:(id)a4;
- (void)getProximityLinkRecommendation:(BOOL)a3 recommendation:(id)a4;
- (void)getStreamingInfo:(id)a3 linkType:(int)a4;
- (void)handleNotification:(id)a3 :(BOOL)a4;
- (void)processBTLQMNotification:(id)a3;
- (void)processLowPowerModePeriodicWakeUpNotification;
- (void)processMetricsNotificationReport:(id)a3;
- (void)processNotificationList:(id)a3 :(unint64_t)a4;
- (void)processNotificationListForTerminus:(id)a3;
- (void)processOperatingModeNotification:(id)a3;
- (void)reConnect;
- (void)registerClient:(int)a3 queue:(id)a4;
- (void)removeAppType:(id)a3;
- (void)removeProximityLinkRecommendationType:(id)a3;
- (void)setTelephonyEnabled:(BOOL)a3;
- (void)statusUpdateAppLinkPreference:(int)a3 status:(BOOL)a4;
- (void)statusUpdateAppType:(int)a3 linkType:(int)a4 serviceStatus:(BOOL)a5;
- (void)subscribeAppType:(id)a3 observer:(id)a4;
- (void)subscribeBtLqmScoreNotification:(id)a3;
- (void)subscribeDataLinkRecommendation:(id)a3;
- (void)subscribeMultipleAppTypes:(id)a3 observer:(id)a4;
- (void)subscribeOperatingModeChangeNotification:(id)a3;
- (void)subscribeProximityLinkRecommendation:(id)a3;
- (void)subscribeStandaloneLinkRecommendation:(id)a3;
- (void)unregisterClient;
@end

@implementation WRM_iRATInterface

- (WRM_iRATInterface)init
{
  v15.receiver = self;
  v15.super_class = (Class)WRM_iRATInterface;
  v2 = [(WRMClientInterface *)&v15 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    mAppLists = v2->mAppLists;
    v2->mAppLists = v3;

    v2->mClientSupportsMultipleAppTypes = 0;
    id mObserver = v2->mObserver;
    v2->id mObserver = 0;

    id mOppModeObserver = v2->mOppModeObserver;
    v2->id mOppModeObserver = 0;

    id mProximitySubscribeLinkRecommendationHandler = v2->mProximitySubscribeLinkRecommendationHandler;
    v2->id mProximitySubscribeLinkRecommendationHandler = 0;

    id mProximityGetLinkRecommendationHandler = v2->mProximityGetLinkRecommendationHandler;
    v2->id mProximityGetLinkRecommendationHandler = 0;

    id mOppBtLQMObserver = v2->mOppBtLQMObserver;
    v2->id mOppBtLQMObserver = 0;

    id mLowPowerModePeriodicWakeUpCb = v2->mLowPowerModePeriodicWakeUpCb;
    v2->id mLowPowerModePeriodicWakeUpCb = 0;

    v2->mLinkPreferenceSubscriptionEnabled = 0;
    v2->mTelephoneAssertionEnabled = 0;
    v2->mLocationAssertionEnabled = 0;
    v2->mLocationState = 0;
    v2->mTelephonyStateEnabled = 1;
    v2->mProximitySubscribeLinkRecommendationEnabled = 0;
    v2->mProximityGetLinkRecommendationEnabled = 0;
    v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    mProximityLinkRecommendationList = v2->mProximityLinkRecommendationList;
    v2->mProximityLinkRecommendationList = v11;

    v13 = v2;
  }

  return v2;
}

- (void)addAppType:(id)a3
{
}

- (void)removeAppType:(id)a3
{
  mAppLists = self->mAppLists;
  if (mAppLists) {
    [(NSMutableArray *)mAppLists removeObject:a3];
  }
}

- (void)addProximityLinkRecommendationType:(id)a3
{
}

- (void)removeProximityLinkRecommendationType:(id)a3
{
  mProximityLinkRecommendationList = self->mProximityLinkRecommendationList;
  if (mProximityLinkRecommendationList) {
    [(NSMutableArray *)mProximityLinkRecommendationList removeObject:a3];
  }
}

- (void)processBTLQMNotification:(id)a3
{
  id v4 = a3;
  mQueue = self->super.mQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __46__WRM_iRATInterface_processBTLQMNotification___block_invoke;
  v7[3] = &unk_26422A2B0;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_async(mQueue, v7);
}

- (void)processLowPowerModePeriodicWakeUpNotification
{
  mQueue = self->super.mQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __66__WRM_iRATInterface_processLowPowerModePeriodicWakeUpNotification__block_invoke;
  block[3] = &unk_26422A2D8;
  block[4] = self;
  dispatch_async(mQueue, block);
}

- (void)processOperatingModeNotification:(id)a3
{
  id v4 = a3;
  mQueue = self->super.mQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __54__WRM_iRATInterface_processOperatingModeNotification___block_invoke;
  v7[3] = &unk_26422A2B0;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_async(mQueue, v7);
}

- (void)processMetricsNotificationReport:(id)a3
{
  id v4 = a3;
  mQueue = self->super.mQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __54__WRM_iRATInterface_processMetricsNotificationReport___block_invoke;
  v7[3] = &unk_26422A2B0;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_async(mQueue, v7);
}

- (void)processNotificationListForTerminus:(id)a3
{
  id v4 = a3;
  size_t count = xpc_array_get_count(v4);
  [(NSMutableArray *)self->mProximityLinkRecommendationList removeAllObjects];
  mQueue = self->super.mQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__WRM_iRATInterface_processNotificationListForTerminus___block_invoke;
  block[3] = &unk_26422A300;
  v10 = self;
  size_t v11 = count;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(mQueue, block);
}

- (void)processNotificationList:(id)a3 :(unint64_t)a4
{
  id v6 = a3;
  size_t count = xpc_array_get_count(v6);
  if (count)
  {
    size_t v8 = count;
    for (size_t i = 0; i != v8; ++i)
    {
      v10 = xpc_array_get_value(v6, i);
      uint64_t uint64 = xpc_dictionary_get_uint64(v10, "kWRMApplicationType");
      uint64_t v12 = xpc_dictionary_get_uint64(v10, "kWRMLinkType");
      xpc_dictionary_get_uint64(v10, "kWRMLinkTypeChangeReasonCode");
      if (a4 == 1301)
      {
        LODWORD(v15) = 0;
        v13 = [MEMORY[0x263F08D40] valueWithBytes:&v15 objCType:"{?=i}"];
        LODWORD(v15) = xpc_dictionary_get_uint64(v10, "kWRMSubscriptionType");
      }
      else if (a4 == 1302)
      {
        long long v15 = 0u;
        long long v16 = 0u;
        *(void *)&long long v15 = xpc_dictionary_get_uint64(v10, "kWRMCurrentLinkBandwidthEstimateMin");
        *((void *)&v15 + 1) = xpc_dictionary_get_uint64(v10, "kWRMCurrentLinkBandwidthEstimateMax");
        *(void *)&long long v16 = xpc_dictionary_get_uint64(v10, "kWRMCurrentLinkMovBandwidthEstimateMin");
        *((void *)&v16 + 1) = xpc_dictionary_get_uint64(v10, "kWRMCurrentLinkMovBandwidthEstimateMax");
        v13 = [MEMORY[0x263F08D40] valueWithBytes:&v15 objCType:"{?=QQQQ}"];
      }
      else
      {
        *(void *)&long long v15 = 0;
        v13 = [MEMORY[0x263F08D40] valueWithBytes:&v15 objCType:"{?=Q}"];
        *(void *)&long long v15 = 0;
      }
      id mObserver = (void (**)(id, uint64_t, uint64_t, void *))self->mObserver;
      if (mObserver) {
        mObserver[2](mObserver, uint64, v12, v13);
      }
    }
  }
}

- (void)reConnect
{
  v7.receiver = self;
  v7.super_class = (Class)WRM_iRATInterface;
  [(WRMClientInterface *)&v7 unregisterClient];
  [(WRM_iRATInterface *)self registerClient:self->super.mProcessId queue:self->super.mQueue];
  if (self->mLinkPreferenceSubscriptionEnabled)
  {
    mAppLists = self->mAppLists;
    if (self->mClientSupportsMultipleAppTypes)
    {
      [(WRM_iRATInterface *)self subscribeMultipleAppTypes:mAppLists observer:self->mObserver];
    }
    else if (mAppLists)
    {
      uint64_t v5 = 0;
      uint64_t v6 = 0;
      id v4 = [(NSMutableArray *)mAppLists objectAtIndex:0];
      [v4 getValue:&v5];
      -[WRM_iRATInterface subscribeAppType:observer:](self, "subscribeAppType:observer:", v5, v6, self->mObserver);
    }
  }
  if (self->mTelephoneAssertionEnabled) {
    [(WRM_iRATInterface *)self setTelephonyEnabled:self->mTelephonyStateEnabled];
  }
  if (self->mLocationAssertionEnabled) {
    [(WRM_iRATInterface *)self assertCommCenterBaseBandMode:self->mLocationState];
  }
  if (self->mBBAssertionBGAppActive)
  {
    self->mBBAssertionBGAppActive = 0;
    [(WRM_iRATInterface *)self expediteBBAssertionBGAppActive:1 handler:0];
  }
  if (self->mProximitySubscribeLinkRecommendationEnabled) {
    [(WRM_iRATInterface *)self subscribeProximityLinkRecommendation:self->mProximitySubscribeLinkRecommendationHandler];
  }
  if (self->mProximityGetLinkRecommendationEnabled) {
    [(WRM_iRATInterface *)self getProximityLinkRecommendation:0 recommendation:self->mProximityGetLinkRecommendationHandler];
  }
}

- (void)handleNotification:(id)a3 :(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  xpc_object_t xdict = v6;
  if (v4)
  {
    NSLog(&cfstr_InvokingReconn.isa);
    [(WRM_iRATInterface *)self reConnect];
  }
  else
  {
    uint64_t uint64 = xpc_dictionary_get_uint64(v6, "kMessageId");
    size_t v8 = xpc_dictionary_get_value(xdict, "kMessageArgs");
    id v9 = v8;
    switch(uint64)
    {
      case 0x518uLL:
        [(WRM_iRATInterface *)self processOperatingModeNotification:v8];
        break;
      case 0x519uLL:
        if (v8)
        {
          uint64_t v10 = xpc_dictionary_get_value(v8, "kWRMApplicationTypeList");
          if (v10)
          {
            size_t v11 = (void *)v10;
            NSLog(&cfstr_ReceviedMessag.isa);
            if (self->mProximityGetLinkRecommendationEnabled || self->mProximitySubscribeLinkRecommendationEnabled) {
              [(WRM_iRATInterface *)self processNotificationListForTerminus:v11];
            }
            else {
              NSLog(&cfstr_IsProximityLin.isa, 0, 0);
            }
          }
        }
        break;
      case 0x51CuLL:
        [(WRM_iRATInterface *)self processMetricsNotificationReport:v8];
        break;
      case 0x51DuLL:
        [(WRM_iRATInterface *)self processBTLQMNotification:v8];
        goto LABEL_13;
      case 0x51EuLL:
        break;
      case 0x51FuLL:
        [(WRM_iRATInterface *)self processLowPowerModePeriodicWakeUpNotification];
        break;
      default:
LABEL_13:
        if (v9)
        {
          uint64_t v12 = xpc_dictionary_get_value(v9, "kWRMApplicationTypeList");
          if (v12)
          {
            v13 = (void *)v12;
            NSLog(&cfstr_ReceviedMessag_0.isa, xdict, v12);
            [(WRM_iRATInterface *)self processNotificationList:v13 :uint64];
          }
        }
        break;
    }
  }
}

- (void)registerClient:(int)a3 queue:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  objc_super v7 = v6;
  if (!v6)
  {
    objc_super v7 = (void *)MEMORY[0x263EF83A0];
    id v8 = MEMORY[0x263EF83A0];
  }
  objc_storeStrong((id *)&self->super.mQueue, v7);
  if (!v6) {

  }
  self->super.mProcessId = v4;
  objc_initWeak(&location, self);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __42__WRM_iRATInterface_registerClient_queue___block_invoke;
  v12[3] = &unk_26422A250;
  objc_copyWeak(&v13, &location);
  id v9 = (void *)MEMORY[0x2166AEE70](v12);
  mQueue = self->super.mQueue;
  v11.receiver = self;
  v11.super_class = (Class)WRM_iRATInterface;
  [(WRMClientInterface *)&v11 registerClient:v4 queue:mQueue notificationHandler:v9];
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

- (int)getSubscribeMessageType:(int)a3
{
  if ((a3 - 11) > 0xF) {
    return 400;
  }
  else {
    return dword_214B4A260[a3 - 11];
  }
}

- (int)getStatusUpdateMessageType:(int)a3
{
  if ((a3 - 11) > 0xF) {
    return 401;
  }
  else {
    return dword_214B4A2A0[a3 - 11];
  }
}

- (void)subscribeBtLqmScoreNotification:(id)a3
{
  id v4 = a3;
  mQueue = self->super.mQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __53__WRM_iRATInterface_subscribeBtLqmScoreNotification___block_invoke;
  v7[3] = &unk_26422A328;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(mQueue, v7);
}

- (void)subscribeOperatingModeChangeNotification:(id)a3
{
  self->id mOppModeObserver = (id)MEMORY[0x2166AEE70](a3, a2);
  MEMORY[0x270F9A758]();
}

- (void)subscribeProximityLinkRecommendation:(id)a3
{
  id v4 = a3;
  unsigned int mProcessId = self->super.mProcessId;
  if (mProcessId < 0x2A && ((0x3EEEFFFFFFFuLL >> mProcessId) & 1) != 0)
  {
    id v6 = off_26422A4D8[mProcessId];
  }
  else if (mProcessId == 42)
  {
    id v6 = "WRMSOS";
  }
  else
  {
    id v6 = "INVALID_PROC_ID!!!";
  }
  NSLog(&cfstr_ReceivedSubscr.isa, v6);
  mQueue = self->super.mQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __58__WRM_iRATInterface_subscribeProximityLinkRecommendation___block_invoke;
  block[3] = &unk_26422A328;
  void block[4] = self;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(mQueue, block);
}

- (void)getLinkRecommendationMetrics:(id)a3
{
  id v4 = a3;
  unsigned int mProcessId = self->super.mProcessId;
  if (mProcessId < 0x2A && ((0x3EEEFFFFFFFuLL >> mProcessId) & 1) != 0)
  {
    id v6 = off_26422A4D8[mProcessId];
  }
  else if (mProcessId == 42)
  {
    id v6 = "WRMSOS";
  }
  else
  {
    id v6 = "INVALID_PROC_ID!!!";
  }
  NSLog(&cfstr_ReceivedGetlin.isa, v6);
  mQueue = self->super.mQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __50__WRM_iRATInterface_getLinkRecommendationMetrics___block_invoke;
  block[3] = &unk_26422A328;
  void block[4] = self;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(mQueue, block);
}

- (void)getProximityLinkRecommendation:(BOOL)a3 recommendation:(id)a4
{
  id v6 = a4;
  unsigned int mProcessId = self->super.mProcessId;
  if (mProcessId < 0x2A && ((0x3EEEFFFFFFFuLL >> mProcessId) & 1) != 0)
  {
    id v8 = off_26422A4D8[mProcessId];
  }
  else if (mProcessId == 42)
  {
    id v8 = "WRMSOS";
  }
  else
  {
    id v8 = "INVALID_PROC_ID!!!";
  }
  NSLog(&cfstr_ReceivedGetpro.isa, v8);
  mQueue = self->super.mQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __67__WRM_iRATInterface_getProximityLinkRecommendation_recommendation___block_invoke;
  block[3] = &unk_26422A350;
  void block[4] = self;
  id v12 = v6;
  BOOL v13 = a3;
  id v10 = v6;
  dispatch_async(mQueue, block);
}

- (void)statusUpdateAppLinkPreference:(int)a3 status:(BOOL)a4
{
  if (a3 >= 3)
  {
    objc_super v7 = "INVALID_AppLinkPreferenceType!!!";
    if (a3 == 3) {
      objc_super v7 = "Cellular";
    }
  }
  else
  {
    objc_super v7 = off_26422A4C0[a3];
  }
  id v8 = "No";
  if (a4) {
    id v8 = "Yes";
  }
  NSLog(&cfstr_SLinkpreftypeS.isa, a2, "-[WRM_iRATInterface statusUpdateAppLinkPreference:status:]", v7, v8);
  mQueue = self->super.mQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __58__WRM_iRATInterface_statusUpdateAppLinkPreference_status___block_invoke;
  block[3] = &unk_26422A378;
  void block[4] = self;
  int v11 = a3;
  BOOL v12 = a4;
  dispatch_async(mQueue, block);
}

- (void)getStreamingInfo:(id)a3 linkType:(int)a4
{
  id v6 = a3;
  mQueue = self->super.mQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__WRM_iRATInterface_getStreamingInfo_linkType___block_invoke;
  block[3] = &unk_26422A3A0;
  void block[4] = self;
  id v10 = v6;
  int v11 = a4;
  id v8 = v6;
  dispatch_async(mQueue, block);
}

- (void)getMLPredictedThroughput:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  mQueue = self->super.mQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__WRM_iRATInterface_getMLPredictedThroughput_options___block_invoke;
  block[3] = &unk_26422A3C8;
  id v12 = v7;
  id v13 = v6;
  void block[4] = self;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(mQueue, block);
}

- (void)assertCommCenterBaseBandMode:(int)a3
{
  mQueue = self->super.mQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __50__WRM_iRATInterface_assertCommCenterBaseBandMode___block_invoke;
  v4[3] = &unk_26422A3F0;
  v4[4] = self;
  int v5 = a3;
  dispatch_async(mQueue, v4);
}

- (void)expediteCellularForReason:(BOOL)a3 reason:(id)a4
{
  mQueue = self->super.mQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__WRM_iRATInterface_expediteCellularForReason_reason___block_invoke;
  block[3] = &unk_26422A350;
  BOOL v7 = a3;
  void block[4] = self;
  id v6 = 0;
  dispatch_async(mQueue, block);
}

- (void)setTelephonyEnabled:(BOOL)a3
{
  mQueue = self->super.mQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __41__WRM_iRATInterface_setTelephonyEnabled___block_invoke;
  v4[3] = &unk_26422A440;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(mQueue, v4);
}

- (void)subscribeStandaloneLinkRecommendation:(id)a3
{
}

- (void)subscribeDataLinkRecommendation:(id)a3
{
}

- (void)subscribeAppType:(id)a3 observer:(id)a4
{
  uint64_t v4 = *(void *)&a3.var2;
  uint64_t v5 = *(void *)&a3.var0;
  id v7 = a4;
  mQueue = self->super.mQueue;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __47__WRM_iRATInterface_subscribeAppType_observer___block_invoke;
  v10[3] = &unk_26422A468;
  uint64_t v12 = v5;
  uint64_t v13 = v4;
  v10[4] = self;
  id v11 = v7;
  id v9 = v7;
  dispatch_async(mQueue, v10);
}

- (void)subscribeMultipleAppTypes:(id)a3 observer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  mQueue = self->super.mQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__WRM_iRATInterface_subscribeMultipleAppTypes_observer___block_invoke;
  block[3] = &unk_26422A3C8;
  id v12 = v6;
  id v13 = v7;
  void block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(mQueue, block);
}

- (void)statusUpdateAppType:(int)a3 linkType:(int)a4 serviceStatus:(BOOL)a5
{
  mQueue = self->super.mQueue;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __64__WRM_iRATInterface_statusUpdateAppType_linkType_serviceStatus___block_invoke;
  v6[3] = &unk_26422A378;
  v6[4] = self;
  int v7 = a3;
  BOOL v8 = a5;
  dispatch_async(mQueue, v6);
}

- (void)_expediteBBAssertionBGAppActive_sync:(BOOL)a3 handler:(id)a4
{
  id v6 = a4;
  mQueue = self->super.mQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __66__WRM_iRATInterface__expediteBBAssertionBGAppActive_sync_handler___block_invoke;
  block[3] = &unk_26422A350;
  BOOL v11 = a3;
  void block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(mQueue, block);
}

- (void)expediteBBAssertionBGAppActive:(BOOL)a3 handler:(id)a4
{
  id v6 = (void *)MEMORY[0x2166AEE70](a4, a2);
  mQueue = self->super.mQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __60__WRM_iRATInterface_expediteBBAssertionBGAppActive_handler___block_invoke;
  block[3] = &unk_26422A350;
  BOOL v11 = a3;
  void block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(mQueue, block);
}

- (void)unregisterClient
{
  v5.receiver = self;
  v5.super_class = (Class)WRM_iRATInterface;
  [(WRMClientInterface *)&v5 unregisterClient];
  mQueue = self->super.mQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __37__WRM_iRATInterface_unregisterClient__block_invoke;
  block[3] = &unk_26422A2D8;
  void block[4] = self;
  dispatch_async(mQueue, block);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mProximityLinkRecommendationList, 0);
  objc_storeStrong(&self->mLowPowerModePeriodicWakeUpCb, 0);
  objc_storeStrong(&self->mOppBtLQMObserver, 0);
  objc_storeStrong(&self->mGetLinkRecommendationMetricsHandler, 0);
  objc_storeStrong(&self->mProximityGetLinkRecommendationHandler, 0);
  objc_storeStrong(&self->mProximitySubscribeLinkRecommendationHandler, 0);
  objc_storeStrong(&self->mOppModeObserver, 0);
  objc_storeStrong(&self->mObserver, 0);
  objc_storeStrong((id *)&self->mAppLists, 0);
}

@end