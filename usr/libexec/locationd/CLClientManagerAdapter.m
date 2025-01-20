@interface CLClientManagerAdapter
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)syncgetDoSync:(id)a3;
- (BOOL)syncgetHasAuthorizedClients;
- (BOOL)syncgetIsMapsANonSystemLocationClient;
- (BOOL)syncgetSetLocationServicesEnabledStatically:(BOOL)a3 withEventSource:(id)a4;
- (CLClientManagerAdapter)init;
- (double)syncgetAndSetOrChangeAppClipAuthorizationTime:(double)a3 forClient:(id)a4;
- (id)syncgetApplyArchivedAuthorizationDecisionsAndDie:(id)a3 unlessTokenMatches:(id)a4;
- (id)syncgetArchivedAuthorizationDecisions;
- (id)syncgetCopyClients;
- (id)syncgetLocationClientKeys;
- (id)syncgetNonSystemLocationClientKey;
- (id)syncgetNonSystemLocationClientKeys;
- (id)syncgetTemporaryAuthorizationStatusForClient:(id)a3;
- (int)syncgetClientEffectiveRegistrationResultWithTransientAwareness:(id)a3;
- (int)syncgetRegistrationResultToAuthorizationStatus:(int)a3;
- (void)adaptee;
- (void)appLaunchedByAppLifecycleManager:(id)a3;
- (void)appsWithClientKeysAreInstalledOnAPairedDevice:(id)a3;
- (void)beginService;
- (void)calculateCheeseCoverage:(id)a3 interestInterval:(id)a4 withOptions:(id)a5 lookbackWindowStartDate:(id)a6 withReply:(id)a7;
- (void)checkAppInstallationStatus;
- (void)checkWeakPersistentClientWithIdentifier:(id)a3;
- (void)considerPromptingForTranscriptSession:(id)a3 dictionary:(id)a4 requestType:(int)a5 withReply:(id)a6;
- (void)deleteInterestZoneWithId:(id)a3 registeredForClientKey:(id)a4 withReply:(id)a5;
- (void)dingAllActiveTranscriptSubscriptions;
- (void)doAsync:(id)a3;
- (void)doAsync:(id)a3 withReply:(id)a4;
- (void)endService;
- (void)fetchClientStaticRegistrationResult:(id)a3 withReply:(id)a4;
- (void)fetchLocationClientKeysWithReply:(id)a3;
- (void)getClientManagerInternalStateWithReply:(id)a3;
- (void)getIncidentalUseModeForClient:(id)a3 withReply:(id)a4;
- (void)handleLiveActivityUpdate:(id)a3;
- (void)handleProvisionalIntermediationForService:(unint64_t)a3 forClientKey:(id)a4 at:(id)a5 withReply:(id)a6;
- (void)inUseAssertionInvalidatedDueToWatchConnectivityForClientKey:(id)a3;
- (void)markClientEmergencyEnablementTransition:(BOOL)a3;
- (void)markClientEmergencyEnablementTransition:(BOOL)a3 shouldOverrideDeauthorization:(BOOL)a4 forBeneficiary:(id)a5;
- (void)markClientTemporaryAuthorizationGranted:(BOOL)a3 forClientKey:(id)a4 andAuditToken:(id *)a5 byLocationButton:(BOOL)a6 voiceInteractionEnabled:(BOOL)a7;
- (void)markReceivingLocationInformation:(id)a3;
- (void)markTemporaryPreciseAuthorizationGranted:(BOOL)a3 forClientKey:(id)a4;
- (void)onCapabilityChange;
- (void)performMigrationWithReply:(id)a3;
- (void)reduceAccuracy:(id)a3 withReply:(id)a4;
- (void)registerCircularInterestZoneForClientKey:(id)a3 withId:(id)a4 latitude:(double)a5 longitude:(double)a6 serviceMaskOperator:(int)a7 provenanceType:(int)a8 radius:(double)a9 withReply:(id)a10;
- (void)registerPhenolicInterestZoneForClientKey:(id)a3 withId:(id)a4 phenolicLocation:(int)a5 serviceMaskOperator:(int)a6 provenanceType:(int)a7 withReply:(id)a8;
- (void)reportLocationUtilityEvent:(int)a3 atDate:(id)a4;
- (void)resetClient:(id)a3;
- (void)resetClients;
- (void)resetNotificationConsumedForIdentifier:(id)a3;
- (void)sendMetricForFunctionCallsForClientKey:(id)a3 info:(id)a4;
- (void)setAllowableAuthorizationMask:(unint64_t)a3 forClientKey:(id)a4;
- (void)setClient:(id)a3;
- (void)setClientAuthorization:(id)a3 zoneIdentifier:(id)a4 subIdentityIdentifier:(id)a5 status:(int)a6 correctiveCompensation:(int)a7 mayIncreaseAuth:(BOOL)a8 entity:(id)a9;
- (void)setClientBackgroundIndicator:(id)a3 enabled:(BOOL)a4 entity:(id)a5;
- (void)setClients:(id)a3 locationPushTo:(BOOL)a4;
- (void)setClients:(id)a3 regionOfType:(int)a4 to:(BOOL)a5;
- (void)setClients:(id)a3 significantLocationChangeTo:(BOOL)a4;
- (void)setClients:(id)a3 significantLocationVisitTo:(BOOL)a4;
- (void)setClients:(id)a3 transcriptSessionChangeTo:(BOOL)a4;
- (void)setIncidentalUseMode:(int)a3 forClient:(id)a4;
- (void)setLastLocationSettingsEventSource:(id)a3;
- (void)setLocationButtonUseMode:(int)a3 forClient:(id)a4;
- (void)setProvisionalAuthorization:(id)a3;
- (void)setPurpose:(id)a3 forClient:(id)a4;
- (void)setRelevance:(BOOL)a3 forInterestZoneWithId:(id)a4 registeredForClientKey:(id)a5;
- (void)setRelevance:(BOOL)a3 forInterestZoneWithId:(id)a4 registeredForClientKey:(id)a5 withReply:(id)a6;
- (void)setTemporaryAuthorizationStatusInfoForClient:(id)a3 data:(id)a4;
- (void)takeInUseAssertionForClientKey:(id)a3 reason:(id)a4 assertionLevel:(int)a5 withReply:(id)a6;
- (void)tearDownLocationAuthPrompt:(id)a3;
- (void)triggerAnalyticsCollect;
- (void)triggerClearAppClipAuthorizationIfNecessary;
- (void)updatePillButtonChoiceForOutstandingPrompt:(int)a3;
- (void)updatePromptedLatitude:(double)a3 longitude:(double)a4;
- (void)wakeUpLaunchdManagedClient:(id)a3;
@end

@implementation CLClientManagerAdapter

- (int)syncgetClientEffectiveRegistrationResultWithTransientAwareness:(id)a3
{
  (*((void (**)(void **__return_ptr, id, SEL))a3 + 2))(v6, a3, a2);
  id v4 = +[CLClientKeyPath clientKeyPathFromName:v6];
  if (v19 < 0) {
    operator delete(__p);
  }
  if (v17 < 0) {
    operator delete(v16);
  }
  if (v15 < 0) {
    operator delete(v14);
  }
  if (v13 < 0) {
    operator delete(v12);
  }
  if (v11 < 0) {
    operator delete(v10);
  }
  if (v9 < 0) {
    operator delete(v8);
  }
  if (v7 < 0) {
    operator delete(v6[0]);
  }
  return sub_1001B3054((uint64_t)[(CLClientManagerAdapter *)self adaptee], (uint64_t)v4);
}

- (void)markReceivingLocationInformation:(id)a3
{
  (*((void (**)(void **__return_ptr, id, SEL))a3 + 2))(v5, a3, a2);
  id v4 = +[CLClientKeyPath clientKeyPathFromName:v5];
  if (v18 < 0) {
    operator delete(__p);
  }
  if (v16 < 0) {
    operator delete(v15);
  }
  if (v14 < 0) {
    operator delete(v13);
  }
  if (v12 < 0) {
    operator delete(v11);
  }
  if (v10 < 0) {
    operator delete(v9);
  }
  if (v8 < 0) {
    operator delete(v7);
  }
  if (v6 < 0) {
    operator delete(v5[0]);
  }
  sub_100103838((uint64_t)[(CLClientManagerAdapter *)self adaptee], (uint64_t)v4, 1, 0);
}

- (void)setClients:(id)a3 significantLocationChangeTo:(BOOL)a4
{
  BOOL v4 = a4;
  char v6 = (long long *)sub_10001F790(a3);
  if (v6)
  {
    sub_100089AE0((char *)__dst, v6);
    id v7 = +[CLClientKeyPath clientKeyPathFromName:__dst];
    if (v23 < 0) {
      operator delete(__p);
    }
    if (v21 < 0) {
      operator delete(v20);
    }
    if (v19 < 0) {
      operator delete(v18);
    }
    if (v17 < 0) {
      operator delete(v16);
    }
    if (v15 < 0) {
      operator delete(v14);
    }
    if (v13 < 0) {
      operator delete(v12);
    }
    if (v11 < 0) {
      operator delete(__dst[0]);
    }
    char v8 = [(CLClientManagerAdapter *)self adaptee];
    double Current = CFAbsoluteTimeGetCurrent();
    sub_1001005FC((uint64_t)v8, (uint64_t)v7, 3, v4, 0, 0, Current);
  }
}

- (void)takeInUseAssertionForClientKey:(id)a3 reason:(id)a4 assertionLevel:(int)a5 withReply:(id)a6
{
  id v9 = sub_100103D58((uint64_t)[(CLClientManagerAdapter *)self adaptee], (uint64_t)+[CLClientKeyPath clientKeyPathWithLegacyClientKey:a3]);
  char v10 = [(CLClientManagerAdapter *)self adaptee];
  sub_100134750(&__p, (char *)[a4 UTF8String]);
  sub_100018728((uint64_t)v10, (uint64_t)v9, &__p, a5, v12);
  sub_1001C219C();
}

- (void)dingAllActiveTranscriptSubscriptions
{
  uint64_t v2 = *((void *)[(CLClientManagerAdapter *)self adaptee] + 127);

  sub_100096B30(v2, v3);
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
}

- (void)handleProvisionalIntermediationForService:(unint64_t)a3 forClientKey:(id)a4 at:(id)a5 withReply:(id)a6
{
  id v7 = a5;
  if (!a5)
  {
    id v11 = objc_alloc((Class)CLLocation);
    uint64_t v21 = 0;
    uint64_t v22 = 0;
    long long v23 = xmmword_101D1C320;
    __asm { FMOV            V0.2D, #-1.0 }
    long long v24 = _Q0;
    long long v25 = _Q0;
    long long v26 = _Q0;
    int v20 = 0xFFFF;
    int v27 = 0;
    unint64_t v28 = 0xBFF0000000000000;
    uint64_t v29 = 0;
    uint64_t v30 = 0;
    unint64_t v32 = 0xBFF0000000000000;
    int v31 = 0;
    int v33 = 0x7FFFFFFF;
    uint64_t v35 = 0;
    uint64_t v36 = 0;
    uint64_t v34 = 0;
    char v37 = 0;
    id v7 = [v11 initWithClientLocation:&v20];
  }
  char v17 = +[CLClientKeyPath clientKeyPathWithLegacyClientKey:a4];
  char v18 = [(CLClientManagerAdapter *)self adaptee];
  if (v7) {
    [v7 clientLocation];
  }
  else {
    memset(v19, 0, 156);
  }
  sub_10006810C((uint64_t)v18, a3, (uint64_t)v17, v19, (void (**)(void, void))a6);
}

- (id)syncgetNonSystemLocationClientKeys
{
  uint64_t v2 = [(CLClientManagerAdapter *)self adaptee];

  return sub_1000545D0((uint64_t)v2);
}

- (void)adaptee
{
  result = [(CLNotifierServiceAdapter *)self notifier];
  if (result)
  {
  }
  return result;
}

- (void)wakeUpLaunchdManagedClient:(id)a3
{
  sub_100134750(__p, (char *)[a3 UTF8String]);
  BOOL v4 = [(CLNotifierServiceAdapter *)self notifier];
  if (v4) {
  sub_100033874((uint64_t)v4, (uint64_t *)__p);
  }
  if (v6 < 0) {
    operator delete(__p[0]);
  }
}

- (int)syncgetRegistrationResultToAuthorizationStatus:(int)a3
{
  int v4 = a3;
  return sub_1001191C8((uint64_t)[(CLClientManagerAdapter *)self adaptee], &v4);
}

- (BOOL)syncgetHasAuthorizedClients
{
  uint64_t v2 = [(CLClientManagerAdapter *)self adaptee];

  return sub_1001B45D8((uint64_t)v2);
}

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5 = a4 + 1;
  if (a4 + 1 < (unint64_t)[a3 count]) {
    [objc_msgSend(a3, "objectAtIndexedSubscript:", v5) becameFatallyBlocked:a3 index:v5];
  }
}

+ (id)getSilo
{
  if (qword_10247E148 != -1) {
    dispatch_once(&qword_10247E148, &stru_1022C92B0);
  }
  return (id)qword_10247E140;
}

- (CLClientManagerAdapter)init
{
  v3.receiver = self;
  v3.super_class = (Class)CLClientManagerAdapter;
  return [(CLClientManagerAdapter *)&v3 initWithInboundProtocol:&OBJC_PROTOCOL___CLClientManagerProtocol outboundProtocol:&OBJC_PROTOCOL___CLClientManagerClientProtocol];
}

- (void)beginService
{
  [(CLNotifierServiceAdapter *)self setAdaptedNotifier:sub_1007A0618((uint64_t)[(CLClientManagerAdapter *)self universe])];
  if (![(CLNotifierServiceAdapter *)self notifier])
  {
    objc_super v3 = (CLClientManagerAdapter *)sub_101A6E918();
    [(CLClientManagerAdapter *)v3 endService];
  }
}

- (void)endService
{
  uint64_t v2 = *(void (**)(void))(*(void *)[(CLNotifierServiceAdapter *)self notifier] + 16);

  v2();
}

- (void)doAsync:(id)a3
{
  SEL v4 = [(CLClientManagerAdapter *)self adaptee];
  unint64_t v5 = (void (*)(id, void *))*((void *)a3 + 2);

  v5(a3, v4);
}

- (void)doAsync:(id)a3 withReply:(id)a4
{
  (*((void (**)(id, void *))a3 + 2))(a3, [(CLClientManagerAdapter *)self adaptee]);
  unint64_t v5 = (void (*)(id))*((void *)a4 + 2);

  v5(a4);
}

- (BOOL)syncgetDoSync:(id)a3
{
  return 0;
}

- (void)setProvisionalAuthorization:(id)a3
{
  SEL v4 = (long long *)sub_10001F790(a3);
  if (v4)
  {
    sub_100089AE0((char *)__dst, v4);
    id v5 = +[CLClientKeyPath clientKeyPathFromName:__dst];
    if (v21 < 0) {
      operator delete(__p);
    }
    if (v19 < 0) {
      operator delete(v18);
    }
    if (v17 < 0) {
      operator delete(v16);
    }
    if (v15 < 0) {
      operator delete(v14);
    }
    if (v13 < 0) {
      operator delete(v12);
    }
    if (v11 < 0) {
      operator delete(v10);
    }
    if (v9 < 0) {
      operator delete(__dst[0]);
    }
    char v6 = [(CLClientManagerAdapter *)self adaptee];
    id v7 = sub_100103D58((uint64_t)v6, (uint64_t)v5);
    sub_1007DC2D0((uint64_t)v6, (uint64_t)v7, 0, 0);
  }
}

- (void)setClients:(id)a3 regionOfType:(int)a4 to:(BOOL)a5
{
  BOOL v5 = a5;
  char v8 = (long long *)sub_10001F790(a3);
  if (v8)
  {
    sub_100089AE0((char *)__dst, v8);
    id v9 = +[CLClientKeyPath clientKeyPathFromName:__dst];
    if (v23 < 0) {
      operator delete(__p);
    }
    if (v21 < 0) {
      operator delete(v20);
    }
    if (v19 < 0) {
      operator delete(v18);
    }
    if (v17 < 0) {
      operator delete(v16);
    }
    if (v15 < 0) {
      operator delete(v14);
    }
    if (v13 < 0) {
      operator delete(v12);
    }
    if (v11 < 0) {
      operator delete(__dst[0]);
    }
    sub_1007A98C0((uint64_t)[(CLClientManagerAdapter *)self adaptee], (uint64_t)v9, a4, v5);
  }
}

- (void)setClients:(id)a3 transcriptSessionChangeTo:(BOOL)a4
{
  BOOL v4 = a4;
  char v6 = (long long *)sub_10001F790(a3);
  if (v6)
  {
    sub_100089AE0((char *)__dst, v6);
    id v7 = +[CLClientKeyPath clientKeyPathFromName:__dst];
    if (v23 < 0) {
      operator delete(__p);
    }
    if (v21 < 0) {
      operator delete(v20);
    }
    if (v19 < 0) {
      operator delete(v18);
    }
    if (v17 < 0) {
      operator delete(v16);
    }
    if (v15 < 0) {
      operator delete(v14);
    }
    if (v13 < 0) {
      operator delete(v12);
    }
    if (v11 < 0) {
      operator delete(__dst[0]);
    }
    char v8 = [(CLClientManagerAdapter *)self adaptee];
    double Current = CFAbsoluteTimeGetCurrent();
    sub_1001005FC((uint64_t)v8, (uint64_t)v7, 16, v4, 0, 0, Current);
  }
}

- (void)setClients:(id)a3 significantLocationVisitTo:(BOOL)a4
{
  BOOL v4 = a4;
  char v6 = (long long *)sub_10001F790(a3);
  if (v6)
  {
    sub_100089AE0((char *)__dst, v6);
    id v7 = +[CLClientKeyPath clientKeyPathFromName:__dst];
    if (v23 < 0) {
      operator delete(__p);
    }
    if (v21 < 0) {
      operator delete(v20);
    }
    if (v19 < 0) {
      operator delete(v18);
    }
    if (v17 < 0) {
      operator delete(v16);
    }
    if (v15 < 0) {
      operator delete(v14);
    }
    if (v13 < 0) {
      operator delete(v12);
    }
    if (v11 < 0) {
      operator delete(__dst[0]);
    }
    char v8 = [(CLClientManagerAdapter *)self adaptee];
    double Current = CFAbsoluteTimeGetCurrent();
    sub_1001005FC((uint64_t)v8, (uint64_t)v7, 6, v4, 0, 0, Current);
  }
}

- (void)setClients:(id)a3 locationPushTo:(BOOL)a4
{
  BOOL v4 = a4;
  char v6 = (long long *)sub_10001F790(a3);
  if (v6)
  {
    sub_100089AE0((char *)__dst, v6);
    id v7 = +[CLClientKeyPath clientKeyPathFromName:__dst];
    if (v23 < 0) {
      operator delete(__p);
    }
    if (v21 < 0) {
      operator delete(v20);
    }
    if (v19 < 0) {
      operator delete(v18);
    }
    if (v17 < 0) {
      operator delete(v16);
    }
    if (v15 < 0) {
      operator delete(v14);
    }
    if (v13 < 0) {
      operator delete(v12);
    }
    if (v11 < 0) {
      operator delete(__dst[0]);
    }
    char v8 = [(CLClientManagerAdapter *)self adaptee];
    double Current = CFAbsoluteTimeGetCurrent();
    sub_1001005FC((uint64_t)v8, (uint64_t)v7, 15, v4, 0, 0, Current);
  }
}

- (void)considerPromptingForTranscriptSession:(id)a3 dictionary:(id)a4 requestType:(int)a5 withReply:(id)a6
{
  char v10 = +[CLClientKeyPath clientKeyPathWithLegacyClientKey:a3];
  char v11 = [(CLClientManagerAdapter *)self adaptee];

  sub_1007A7100((uint64_t)v11, (uint64_t)v10, (uint64_t)a4, a5, (uint64_t)a6);
}

- (void)updatePillButtonChoiceForOutstandingPrompt:(int)a3
{
  *((_DWORD *)[(CLClientManagerAdapter *)self adaptee] + 78) = a3;
}

- (void)updatePromptedLatitude:(double)a3 longitude:(double)a4
{
  char v6 = [(CLClientManagerAdapter *)self adaptee];
  v6[20] = CLLocationCoordinate2DMake(a3, a4);
}

- (void)markClientTemporaryAuthorizationGranted:(BOOL)a3 forClientKey:(id)a4 andAuditToken:(id *)a5 byLocationButton:(BOOL)a6 voiceInteractionEnabled:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  BOOL v9 = a3;
  char v11 = +[CLClientKeyPath clientKeyPathWithLegacyClientKey:a4];
  char v12 = [(CLClientManagerAdapter *)self adaptee];

  sub_1007AE950((uint64_t)v12, (uint64_t)v11, v13, v9, v8, v7);
}

- (void)markTemporaryPreciseAuthorizationGranted:(BOOL)a3 forClientKey:(id)a4
{
  BOOL v4 = a3;
  char v6 = +[CLClientKeyPath clientKeyPathWithLegacyClientKey:a4];
  BOOL v7 = [(CLClientManagerAdapter *)self adaptee];

  sub_1007AEDD0((uint64_t)v7, v6, v4);
}

- (void)tearDownLocationAuthPrompt:(id)a3
{
  BOOL v4 = +[CLClientKeyPath clientKeyPathWithLegacyClientKey:a3];
  BOOL v5 = [(CLClientManagerAdapter *)self adaptee];

  sub_1007D5754((uint64_t)v5, 2, v4);
}

- (void)markClientEmergencyEnablementTransition:(BOOL)a3
{
  unsigned int v3 = a3;
  BOOL v4 = [(CLClientManagerAdapter *)self adaptee];

  sub_1007AEF6C((uint64_t)v4, v3, 0, 0);
}

- (void)markClientEmergencyEnablementTransition:(BOOL)a3 shouldOverrideDeauthorization:(BOOL)a4 forBeneficiary:(id)a5
{
  BOOL v6 = a4;
  unsigned int v7 = a3;
  if ([a5 isEqualToString:@"*nobody*"]) {
    BOOL v9 = 0;
  }
  else {
    BOOL v9 = +[CLClientKeyPath clientKeyPathWithLegacyClientKey:a5];
  }
  char v10 = [(CLClientManagerAdapter *)self adaptee];

  sub_1007AEF6C((uint64_t)v10, v7, v6, (uint64_t)v9);
}

- (void)inUseAssertionInvalidatedDueToWatchConnectivityForClientKey:(id)a3
{
  BOOL v4 = +[CLClientKeyPath clientKeyPathWithClientKey:a3];
  BOOL v5 = [(CLClientManagerAdapter *)self adaptee];

  sub_1007AB1EC((uint64_t)v5, (uint64_t)v4);
}

- (void)reduceAccuracy:(id)a3 withReply:(id)a4
{
  BOOL v6 = [(CLClientManagerAdapter *)self adaptee];
  if (a3) {
    [a3 clientLocation];
  }
  else {
    memset(v7, 0, 156);
  }
  sub_1007B2398((uint64_t)v6, v7, (uint64_t)a4);
}

- (void)onCapabilityChange
{
  uint64_t v2 = [(CLClientManagerAdapter *)self adaptee];
  unsigned int v3 = (void *)v2[17];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1007DD16C;
  v4[3] = &unk_1022C8D28;
  v4[4] = v2;
  [v3 iterateAllAnchorKeyPathsWithBlock:v4];
}

- (void)appLaunchedByAppLifecycleManager:(id)a3
{
  BOOL v4 = +[CLClientKeyPath clientKeyPathWithLegacyClientKey:a3];
  BOOL v5 = [(CLClientManagerAdapter *)self adaptee];

  sub_1007CADD8((uint64_t)v5, (uint64_t)v4);
}

- (void)performMigrationWithReply:(id)a3
{
  sub_1007CB228((uint64_t)[(CLClientManagerAdapter *)self adaptee]);
  if (a3)
  {
    BOOL v4 = (void (*)(id))*((void *)a3 + 2);
    v4(a3);
  }
}

- (void)resetNotificationConsumedForIdentifier:(id)a3
{
  BOOL v4 = [(CLClientManagerAdapter *)self adaptee];

  sub_1007CB550((uint64_t)v4, a3);
}

- (void)setClientBackgroundIndicator:(id)a3 enabled:(BOOL)a4 entity:(id)a5
{
  BOOL v6 = a4;
  (*((void (**)(void **__return_ptr, id, SEL))a3 + 2))(v10, a3, a2);
  id v8 = +[CLClientKeyPath clientKeyPathFromName:v10];
  if (v23 < 0) {
    operator delete(__p);
  }
  if (v21 < 0) {
    operator delete(v20);
  }
  if (v19 < 0) {
    operator delete(v18);
  }
  if (v17 < 0) {
    operator delete(v16);
  }
  if (v15 < 0) {
    operator delete(v14);
  }
  if (v13 < 0) {
    operator delete(v12);
  }
  if (v11 < 0) {
    operator delete(v10[0]);
  }
  BOOL v9 = [(CLClientManagerAdapter *)self adaptee];
  [a5 UTF8String];
  sub_1007CBB1C((uint64_t)v9, (uint64_t)v8, v6);
}

- (void)setClientAuthorization:(id)a3 zoneIdentifier:(id)a4 subIdentityIdentifier:(id)a5 status:(int)a6 correctiveCompensation:(int)a7 mayIncreaseAuth:(BOOL)a8 entity:(id)a9
{
  BOOL v9 = a8;
  uint64_t v10 = *(void *)&a7;
  (*((void (**)(void **__return_ptr, id, SEL))a3 + 2))(v21, a3, a2);
  id v15 = +[CLClientKeyPath clientKeyPathFromName:v21];
  if (v34 < 0) {
    operator delete(__p);
  }
  if (v32 < 0) {
    operator delete(v31);
  }
  if (v30 < 0) {
    operator delete(v29);
  }
  if (v28 < 0) {
    operator delete(v27);
  }
  if (v26 < 0) {
    operator delete(v25);
  }
  if (v24 < 0) {
    operator delete(v23);
  }
  if (v22 < 0) {
    operator delete(v21[0]);
  }
  if ((unint64_t)a4 | (unint64_t)a5)
  {
    if (a4) {
      unsigned int v16 = 122;
    }
    else {
      unsigned int v16 = 0;
    }
    if (a5) {
      id v17 = a5;
    }
    else {
      id v17 = a4;
    }
    if (a5) {
      uint64_t v18 = 119;
    }
    else {
      uint64_t v18 = v16;
    }
    id v15 = [v15 clientKeyPathWithReplacementSubIdentityId:v17 subIdentityType:v18];
  }
  char v19 = [(CLClientManagerAdapter *)self adaptee];
  [a9 UTF8String];
  sub_1007C7A1C((uint64_t)v19, (uint64_t)v15, a6, v10, v20, v9, 1);
}

- (void)setLastLocationSettingsEventSource:(id)a3
{
  BOOL v4 = [(CLClientManagerAdapter *)self adaptee];
  sub_100134750(&__str, (char *)[a3 UTF8String]);
  std::string::operator=((std::string *)(v4 + 952), &__str);
  if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__str.__r_.__value_.__l.__data_);
  }
}

- (void)sendMetricForFunctionCallsForClientKey:(id)a3 info:(id)a4
{
  BOOL v6 = +[CLClientKeyPath clientKeyPathWithClientAnchor:a3 anchorType:105];
  unsigned int v7 = [(CLClientManagerAdapter *)self adaptee];

  sub_1007BB154((uint64_t)v7, v6, a4);
}

- (void)reportLocationUtilityEvent:(int)a3 atDate:(id)a4
{
  BOOL v6 = [(CLClientManagerAdapter *)self adaptee];

  sub_1007ABAF8((uint64_t)v6, a3, a4);
}

- (void)resetClient:(id)a3
{
  BOOL v4 = +[CLClientKeyPath clientKeyPathWithLegacyClientKey:a3];
  BOOL v5 = [(CLClientManagerAdapter *)self adaptee];

  sub_1007ACB34((uint64_t)v5, (uint64_t)v4);
}

- (void)resetClients
{
  uint64_t v2 = [(CLClientManagerAdapter *)self adaptee];

  sub_1007C5804((uint64_t)v2);
}

- (void)setClient:(id)a3
{
  (*((void (**)(void **__return_ptr, id, SEL))a3 + 2))(v7, a3, a2);
  id v4 = +[CLClientKeyPath clientKeyPathFromName:v7];
  if (v20 < 0) {
    operator delete(__p);
  }
  if (v18 < 0) {
    operator delete(v17);
  }
  if (v16 < 0) {
    operator delete(v15);
  }
  if (v14 < 0) {
    operator delete(v13);
  }
  if (v12 < 0) {
    operator delete(v11);
  }
  if (v10 < 0) {
    operator delete(v9);
  }
  if (v8 < 0) {
    operator delete(v7[0]);
  }
  BOOL v5 = [(CLClientManagerAdapter *)self adaptee];
  id v6 = sub_100103D58((uint64_t)v5, (uint64_t)v4);
  sub_10009D93C((uint64_t)v5, v6, 1);
}

- (void)setPurpose:(id)a3 forClient:(id)a4
{
  (*((void (**)(void **__return_ptr, id, SEL))a4 + 2))(v7, a4, a2);
  id v6 = +[CLClientKeyPath clientKeyPathFromName:v7];
  if (v20 < 0) {
    operator delete(__p);
  }
  if (v18 < 0) {
    operator delete(v17);
  }
  if (v16 < 0) {
    operator delete(v15);
  }
  if (v14 < 0) {
    operator delete(v13);
  }
  if (v12 < 0) {
    operator delete(v11);
  }
  if (v10 < 0) {
    operator delete(v9);
  }
  if (v8 < 0) {
    operator delete(v7[0]);
  }
  sub_1007CC1FC((uint64_t)[(CLClientManagerAdapter *)self adaptee], (uint64_t)v6, (uint64_t)a3);
}

- (BOOL)syncgetSetLocationServicesEnabledStatically:(BOOL)a3 withEventSource:(id)a4
{
  id v6 = [(CLClientManagerAdapter *)self adaptee];
  sub_100134750(__p, (char *)[a4 UTF8String]);
  sub_1007A5528((uint64_t)v6, a3, (uint64_t *)__p);
  if (v9 < 0) {
    operator delete(__p[0]);
  }
  return 1;
}

- (void)checkAppInstallationStatus
{
  uint64_t v2 = [(CLClientManagerAdapter *)self adaptee];

  sub_1007B09FC((uint64_t)v2);
}

- (void)appsWithClientKeysAreInstalledOnAPairedDevice:(id)a3
{
  id v4 = [(CLClientManagerAdapter *)self adaptee];

  sub_1007CC364(v4, a3);
}

- (void)setAllowableAuthorizationMask:(unint64_t)a3 forClientKey:(id)a4
{
  id v6 = +[CLClientKeyPath clientKeyPathWithLegacyClientKey:a4];
  unsigned int v7 = [(CLClientManagerAdapter *)self adaptee];

  sub_1001B35C0((uint64_t)v7, (uint64_t)v6, a3, 0);
}

- (id)syncgetCopyClients
{
  uint64_t v2 = [(CLClientManagerAdapter *)self adaptee];

  return sub_1007CC4F8((uint64_t)v2, v3, 0);
}

- (id)syncgetLocationClientKeys
{
  uint64_t v2 = [(CLClientManagerAdapter *)self adaptee];

  return sub_1007CCC50((uint64_t)v2);
}

- (void)fetchLocationClientKeysWithReply:(id)a3
{
  id v4 = sub_1007CCC50((uint64_t)[(CLClientManagerAdapter *)self adaptee]);
  BOOL v5 = (void (*)(id, id))*((void *)a3 + 2);

  v5(a3, v4);
}

- (id)syncgetNonSystemLocationClientKey
{
  memset(&__p, 0, sizeof(__p));
  if (sub_1007CCE0C((uint64_t)[(CLClientManagerAdapter *)self adaptee], &__p))
  {
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      p_p = &__p;
    }
    else {
      p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
    }
    uint64_t v3 = +[NSString stringWithUTF8String:p_p];
  }
  else
  {
    uint64_t v3 = 0;
  }
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  return v3;
}

- (void)fetchClientStaticRegistrationResult:(id)a3 withReply:(id)a4
{
  (*((void (**)(void **__return_ptr, id, SEL))a3 + 2))(v8, a3, a2);
  id v6 = +[CLClientKeyPath clientKeyPathFromName:v8];
  if (v21 < 0) {
    operator delete(__p);
  }
  if (v19 < 0) {
    operator delete(v18);
  }
  if (v17 < 0) {
    operator delete(v16);
  }
  if (v15 < 0) {
    operator delete(v14);
  }
  if (v13 < 0) {
    operator delete(v12);
  }
  if (v11 < 0) {
    operator delete(v10);
  }
  if (v9 < 0) {
    operator delete(v8[0]);
  }
  id v7 = sub_1007A5CD8((uint64_t)[(CLClientManagerAdapter *)self adaptee], (uint64_t)v6);
  if (a4) {
    (*((void (**)(id, id))a4 + 2))(a4, v7);
  }
}

- (void)getIncidentalUseModeForClient:(id)a3 withReply:(id)a4
{
  (*((void (**)(void **__return_ptr, id, SEL))a3 + 2))(v7, a3, a2);
  id v6 = +[CLClientKeyPath clientKeyPathFromName:v7];
  if (v20 < 0) {
    operator delete(__p);
  }
  if (v18 < 0) {
    operator delete(v17);
  }
  if (v16 < 0) {
    operator delete(v15);
  }
  if (v14 < 0) {
    operator delete(v13);
  }
  if (v12 < 0) {
    operator delete(v11);
  }
  if (v10 < 0) {
    operator delete(v9);
  }
  if (v8 < 0) {
    operator delete(v7[0]);
  }
  sub_1007AB7C8((uint64_t)[(CLClientManagerAdapter *)self adaptee], (uint64_t)v6, (uint64_t)a4);
}

- (void)registerCircularInterestZoneForClientKey:(id)a3 withId:(id)a4 latitude:(double)a5 longitude:(double)a6 serviceMaskOperator:(int)a7 provenanceType:(int)a8 radius:(double)a9 withReply:(id)a10
{
  char v18 = [(CLClientManagerAdapter *)self adaptee];
  sub_100134750(v21, (char *)[a3 UTF8String]);
  sub_100134750(__p, (char *)[a4 UTF8String]);
  sub_1007CD2FC((uint64_t)v18, (uint64_t)v21, (uint64_t)__p, 1, 0, a7, a8, 1, a5, a6, a9, 0, (uint64_t)a10);
  if (v20 < 0) {
    operator delete(__p[0]);
  }
  if (v22 < 0) {
    operator delete(v21[0]);
  }
}

- (void)registerPhenolicInterestZoneForClientKey:(id)a3 withId:(id)a4 phenolicLocation:(int)a5 serviceMaskOperator:(int)a6 provenanceType:(int)a7 withReply:(id)a8
{
  uint64_t v11 = *(void *)&a5;
  char v14 = [(CLClientManagerAdapter *)self adaptee];
  sub_100134750(v17, (char *)[a3 UTF8String]);
  sub_100134750(__p, (char *)[a4 UTF8String]);
  sub_1007CD2FC((uint64_t)v14, (uint64_t)v17, (uint64_t)__p, 2, v11, a6, a7, 1, -1.0, -1.0, -1.0, 0, (uint64_t)a8);
  if (v16 < 0) {
    operator delete(__p[0]);
  }
  if (v18 < 0) {
    operator delete(v17[0]);
  }
}

- (void)setRelevance:(BOOL)a3 forInterestZoneWithId:(id)a4 registeredForClientKey:(id)a5 withReply:(id)a6
{
  BOOL v9 = a3;
  char v10 = [(CLClientManagerAdapter *)self adaptee];
  sub_100134750(v13, (char *)[a5 UTF8String]);
  sub_100134750(__p, (char *)[a4 UTF8String]);
  sub_1007CDFF0((uint64_t)v10, (char *)v13, (char *)__p, v9, (uint64_t)a6);
  if (v12 < 0) {
    operator delete(__p[0]);
  }
  if (v14 < 0) {
    operator delete(v13[0]);
  }
}

- (void)setRelevance:(BOOL)a3 forInterestZoneWithId:(id)a4 registeredForClientKey:(id)a5
{
  BOOL v7 = a3;
  char v8 = [(CLClientManagerAdapter *)self adaptee];
  sub_100134750(v11, (char *)[a5 UTF8String]);
  sub_100134750(__p, (char *)[a4 UTF8String]);
  sub_1007CDFF0((uint64_t)v8, (char *)v11, (char *)__p, v7, 0);
  if (v10 < 0) {
    operator delete(__p[0]);
  }
  if (v12 < 0) {
    operator delete(v11[0]);
  }
}

- (void)deleteInterestZoneWithId:(id)a3 registeredForClientKey:(id)a4 withReply:(id)a5
{
  char v8 = [(CLClientManagerAdapter *)self adaptee];
  sub_100134750(v11, (char *)[a4 UTF8String]);
  sub_100134750(__p, (char *)[a3 UTF8String]);
  sub_1007CE5D8((uint64_t)v8, (char *)v11, (char *)__p, (uint64_t)a5);
  if (v10 < 0) {
    operator delete(__p[0]);
  }
  if (v12 < 0) {
    operator delete(v11[0]);
  }
}

- (void)setIncidentalUseMode:(int)a3 forClient:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  (*((void (**)(void **__return_ptr, id, SEL))a4 + 2))(v7, a4, a2);
  id v6 = +[CLClientKeyPath clientKeyPathFromName:v7];
  if (v20 < 0) {
    operator delete(__p);
  }
  if (v18 < 0) {
    operator delete(v17);
  }
  if (v16 < 0) {
    operator delete(v15);
  }
  if (v14 < 0) {
    operator delete(v13);
  }
  if (v12 < 0) {
    operator delete(v11);
  }
  if (v10 < 0) {
    operator delete(v9);
  }
  if (v8 < 0) {
    operator delete(v7[0]);
  }
  sub_1007ACDB0((uint64_t)[(CLClientManagerAdapter *)self adaptee], v4, (uint64_t)v6);
}

- (void)setLocationButtonUseMode:(int)a3 forClient:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  (*((void (**)(void **__return_ptr, id, SEL))a4 + 2))(v7, a4, a2);
  id v6 = +[CLClientKeyPath clientKeyPathFromName:v7];
  if (v20 < 0) {
    operator delete(__p);
  }
  if (v18 < 0) {
    operator delete(v17);
  }
  if (v16 < 0) {
    operator delete(v15);
  }
  if (v14 < 0) {
    operator delete(v13);
  }
  if (v12 < 0) {
    operator delete(v11);
  }
  if (v10 < 0) {
    operator delete(v9);
  }
  if (v8 < 0) {
    operator delete(v7[0]);
  }
  sub_1007AD134((uint64_t)[(CLClientManagerAdapter *)self adaptee], v4, (uint64_t)v6);
}

- (BOOL)syncgetIsMapsANonSystemLocationClient
{
  uint64_t v2 = [(CLClientManagerAdapter *)self adaptee];
  uint64_t v3 = +[CLClientKeyPath clientKeyPathWithClientAnchor:@"com.apple.Maps" anchorType:105];

  return sub_1007CEC70((uint64_t)v2, (uint64_t)v3);
}

- (id)syncgetApplyArchivedAuthorizationDecisionsAndDie:(id)a3 unlessTokenMatches:(id)a4
{
  id v6 = [(CLClientManagerAdapter *)self adaptee];

  return sub_1007B44F8((uint64_t)v6, (uint64_t)a3, a4);
}

- (id)syncgetArchivedAuthorizationDecisions
{
  uint64_t v2 = [(CLClientManagerAdapter *)self adaptee];

  return sub_1007B40F8((uint64_t)v2);
}

- (void)checkWeakPersistentClientWithIdentifier:(id)a3
{
  uint64_t v4 = [(CLClientManagerAdapter *)self adaptee];
  (*((void (**)(void **__return_ptr, id))a3 + 2))(v5, a3);
  sub_1007A9744((uint64_t)v4, (uint64_t *)v5);
  if (v8 < 0) {
    operator delete(__p);
  }
  if (v6 < 0) {
    operator delete(v5[0]);
  }
}

- (void)setTemporaryAuthorizationStatusInfoForClient:(id)a3 data:(id)a4
{
  (*((void (**)(void **__return_ptr, id, SEL))a3 + 2))(v7, a3, a2);
  id v6 = +[CLClientKeyPath clientKeyPathFromName:v7];
  if (v20 < 0) {
    operator delete(__p);
  }
  if (v18 < 0) {
    operator delete(v17);
  }
  if (v16 < 0) {
    operator delete(v15);
  }
  if (v14 < 0) {
    operator delete(v13);
  }
  if (v12 < 0) {
    operator delete(v11);
  }
  if (v10 < 0) {
    operator delete(v9);
  }
  if (v8 < 0) {
    operator delete(v7[0]);
  }
  sub_1007CEF0C((uint64_t)[(CLClientManagerAdapter *)self adaptee], (uint64_t)v6, (uint64_t)a4);
}

- (id)syncgetTemporaryAuthorizationStatusForClient:(id)a3
{
  (*((void (**)(void **__return_ptr, id, SEL))a3 + 2))(v6, a3, a2);
  id v4 = +[CLClientKeyPath clientKeyPathFromName:v6];
  if (v19 < 0) {
    operator delete(__p);
  }
  if (v17 < 0) {
    operator delete(v16);
  }
  if (v15 < 0) {
    operator delete(v14);
  }
  if (v13 < 0) {
    operator delete(v12);
  }
  if (v11 < 0) {
    operator delete(v10);
  }
  if (v9 < 0) {
    operator delete(v8);
  }
  if (v7 < 0) {
    operator delete(v6[0]);
  }
  return sub_1007CFE68((uint64_t)[(CLClientManagerAdapter *)self adaptee], (uint64_t)v4);
}

- (double)syncgetAndSetOrChangeAppClipAuthorizationTime:(double)a3 forClient:(id)a4
{
  (*((void (**)(void **__return_ptr, id, SEL))a4 + 2))(v8, a4, a2);
  id v6 = +[CLClientKeyPath clientKeyPathFromName:v8];
  if (v21 < 0) {
    operator delete(__p);
  }
  if (v19 < 0) {
    operator delete(v18);
  }
  if (v17 < 0) {
    operator delete(v16);
  }
  if (v15 < 0) {
    operator delete(v14);
  }
  if (v13 < 0) {
    operator delete(v12);
  }
  if (v11 < 0) {
    operator delete(v10);
  }
  if (v9 < 0) {
    operator delete(v8[0]);
  }
  sub_1007D0478((uint64_t)[(CLClientManagerAdapter *)self adaptee], v6, a3);
  return -1.0;
}

- (void)triggerClearAppClipAuthorizationIfNecessary
{
  uint64_t v2 = [(CLClientManagerAdapter *)self adaptee];

  sub_1007D08A8((uint64_t)v2, 14400.0);
}

- (void)triggerAnalyticsCollect
{
}

- (void)handleLiveActivityUpdate:(id)a3
{
  id v4 = [(CLClientManagerAdapter *)self adaptee];

  sub_1007D0C48((uint64_t)v4, a3);
}

- (void)calculateCheeseCoverage:(id)a3 interestInterval:(id)a4 withOptions:(id)a5 lookbackWindowStartDate:(id)a6 withReply:(id)a7
{
  char v12 = +[CLClientKeyPath clientKeyPathWithLegacyClientKey:a3];
  char v13 = [(CLClientManagerAdapter *)self adaptee];

  sub_1007BBD00((uint64_t)v13, (uint64_t)v12, a4, a5, (uint64_t)a6, (uint64_t)a7);
}

- (void)getClientManagerInternalStateWithReply:(id)a3
{
  id v4 = sub_1007BA8A0((uint64_t)[(CLClientManagerAdapter *)self adaptee]);
  BOOL v5 = (void (*)(id, id))*((void *)a3 + 2);

  v5(a3, v4);
}

@end