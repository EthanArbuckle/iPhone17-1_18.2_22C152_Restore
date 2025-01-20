@interface CSDPowerLogReporter
- (CSDPowerLogReporter)init;
- (NSDictionary)callStateContext;
- (NSDictionary)visibilityContext;
- (NSMutableDictionary)screeningCalls;
- (id)_bundleIdentifierForCall:(id)a3;
- (id)_contextDictionaryWithCall:(id)a3;
- (id)eventBlock;
- (id)systemTimeProvider;
- (void)_registerCallBackgroundedEvent;
- (void)_registerCallForegroundedEventForCall:(id)a3;
- (void)_registerCallStartEventForCall:(id)a3;
- (void)_registerCallStopEvent;
- (void)_registerEventWithContext:(id)a3 status:(id)a4;
- (void)_reportScreeningDurationEventForCall:(id)a3;
- (void)_reportScreeningEnabledEvent:(BOOL)a3;
- (void)_reportScreeningEventForCall:(id)a3;
- (void)_stopScreeningEventIfNecessaryForCall:(id)a3;
- (void)allCallsBackgroundedForReportingController:(id)a3;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)reportingController:(id)a3 callEnteredForeground:(id)a4;
- (void)reportingController:(id)a3 didEndSession:(id)a4 startDate:(id)a5 endDate:(id)a6;
- (void)reportingController:(id)a3 screeningChangedForCall:(id)a4;
- (void)reportingController:(id)a3 statusChangedForCall:(id)a4 totalCallCount:(unint64_t)a5;
- (void)setCallStateContext:(id)a3;
- (void)setEventBlock:(id)a3;
- (void)setScreeningCalls:(id)a3;
- (void)setSystemTimeProvider:(id)a3;
- (void)setVisibilityContext:(id)a3;
@end

@implementation CSDPowerLogReporter

- (CSDPowerLogReporter)init
{
  v10.receiver = self;
  v10.super_class = (Class)CSDPowerLogReporter;
  v2 = [(CSDPowerLogReporter *)&v10 init];
  v3 = v2;
  if (v2)
  {
    id eventBlock = v2->_eventBlock;
    v2->_id eventBlock = &stru_100506ED8;

    v5 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    screeningCalls = v3->_screeningCalls;
    v3->_screeningCalls = v5;

    id systemTimeProvider = v3->_systemTimeProvider;
    v3->_id systemTimeProvider = &stru_100506F38;

    v8 = +[NSUserDefaults tu_defaults];
    [v8 addObserver:v3 forKeyPath:TUCallScreeningDisabledKey options:0 context:&off_100506F58];
  }
  return v3;
}

- (void)dealloc
{
  v3 = +[NSUserDefaults tu_defaults];
  [v3 removeObserver:self forKeyPath:TUCallScreeningDisabledKey context:&off_100506F58];

  v4.receiver = self;
  v4.super_class = (Class)CSDPowerLogReporter;
  [(CSDPowerLogReporter *)&v4 dealloc];
}

- (void)reportingController:(id)a3 screeningChangedForCall:(id)a4
{
}

- (void)reportingController:(id)a3 statusChangedForCall:(id)a4 totalCallCount:(unint64_t)a5
{
  id v10 = a4;
  unsigned int v7 = [v10 status];
  if (!v7 || v7 == 6)
  {
    [(CSDPowerLogReporter *)self _stopScreeningEventIfNecessaryForCall:v10];
    v9 = [(CSDPowerLogReporter *)self callStateContext];

    if (!a5 && v9) {
      [(CSDPowerLogReporter *)self _registerCallStopEvent];
    }
  }
  else if (v7 == 1)
  {
    v8 = [(CSDPowerLogReporter *)self callStateContext];

    if (v8) {
      [(CSDPowerLogReporter *)self _registerCallStopEvent];
    }
    [(CSDPowerLogReporter *)self _registerCallStartEventForCall:v10];
  }
}

- (void)reportingController:(id)a3 callEnteredForeground:(id)a4
{
  id v6 = a4;
  v5 = [(CSDPowerLogReporter *)self visibilityContext];

  if (v5) {
    [(CSDPowerLogReporter *)self _registerCallBackgroundedEvent];
  }
  [(CSDPowerLogReporter *)self _registerCallForegroundedEventForCall:v6];
}

- (void)allCallsBackgroundedForReportingController:(id)a3
{
  objc_super v4 = [(CSDPowerLogReporter *)self visibilityContext];

  if (v4)
  {
    [(CSDPowerLogReporter *)self _registerCallBackgroundedEvent];
  }
}

- (void)reportingController:(id)a3 didEndSession:(id)a4 startDate:(id)a5 endDate:(id)a6
{
  id v16 = a4;
  id v9 = a5;
  id v10 = a6;
  id v11 = [v16 activity];
  v12 = [v11 bundleIdentifier];
  v13 = v12;
  if (v9 && v12)
  {

    if (!v10) {
      goto LABEL_6;
    }
    id v11 = objc_alloc_init((Class)NSMutableDictionary);
    v14 = [v16 activity];
    v15 = [v14 bundleIdentifier];
    [v11 setObject:v15 forKeyedSubscript:@"bundleID"];

    [v11 setObject:v9 forKeyedSubscript:@"timestamp"];
    [v11 setObject:v10 forKeyedSubscript:@"timestampEnd"];
    v13 = [(CSDPowerLogReporter *)self eventBlock];
    ((void (**)(void, const __CFString *, id))v13)[2](v13, @"GroupSessionEventEnded", v11);
  }

LABEL_6:
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (a6 == &off_100506F58 && objc_msgSend(a3, "isEqualToString:", TUCallScreeningDisabledKey, a4, a5))
  {
    uint64_t v7 = TUCallScreeningDisabledUserDefault() ^ 1;
    [(CSDPowerLogReporter *)self _reportScreeningEnabledEvent:v7];
  }
}

- (void)_registerEventWithContext:(id)a3 status:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  if (v10)
  {
    if (v6)
    {
      uint64_t v7 = [(CSDPowerLogReporter *)self eventBlock];

      if (v7)
      {
        id v8 = [v10 mutableCopy];
        [v8 setObject:v6 forKeyedSubscript:@"status"];
        id v9 = [(CSDPowerLogReporter *)self eventBlock];
        ((void (**)(void, const __CFString *, id))v9)[2](v9, @"CallState", v8);
      }
    }
  }
}

- (void)_registerCallStartEventForCall:(id)a3
{
  objc_super v4 = [(CSDPowerLogReporter *)self _contextDictionaryWithCall:a3];
  [(CSDPowerLogReporter *)self setCallStateContext:v4];

  id v5 = [(CSDPowerLogReporter *)self callStateContext];
  [(CSDPowerLogReporter *)self _registerEventWithContext:v5 status:@"callStart"];
}

- (void)_registerCallStopEvent
{
  v3 = [(CSDPowerLogReporter *)self callStateContext];
  [(CSDPowerLogReporter *)self _registerEventWithContext:v3 status:@"callStop"];

  [(CSDPowerLogReporter *)self setCallStateContext:0];
}

- (void)_registerCallForegroundedEventForCall:(id)a3
{
  objc_super v4 = [(CSDPowerLogReporter *)self _contextDictionaryWithCall:a3];
  [(CSDPowerLogReporter *)self setVisibilityContext:v4];

  id v5 = [(CSDPowerLogReporter *)self visibilityContext];
  [(CSDPowerLogReporter *)self _registerEventWithContext:v5 status:@"callForegrounded"];
}

- (void)_registerCallBackgroundedEvent
{
  v3 = [(CSDPowerLogReporter *)self visibilityContext];
  [(CSDPowerLogReporter *)self _registerEventWithContext:v3 status:@"callBackgrounded"];

  [(CSDPowerLogReporter *)self setVisibilityContext:0];
}

- (void)_reportScreeningEventForCall:(id)a3
{
  id v7 = a3;
  if ([v7 isScreening])
  {
    objc_super v4 = +[NSNumber numberWithUnsignedLongLong:(*((uint64_t (**)(void))self->_systemTimeProvider + 2))()];
    id v5 = [(CSDPowerLogReporter *)self screeningCalls];
    id v6 = [v7 uniqueProxyIdentifier];
    [v5 setObject:v4 forKeyedSubscript:v6];
  }
  else
  {
    [(CSDPowerLogReporter *)self _reportScreeningDurationEventForCall:v7];
  }
}

- (void)_stopScreeningEventIfNecessaryForCall:(id)a3
{
  id v9 = a3;
  objc_super v4 = [(CSDPowerLogReporter *)self screeningCalls];
  id v5 = [v9 uniqueProxyIdentifier];
  id v6 = [v4 objectForKeyedSubscript:v5];

  if (v6)
  {
    [(CSDPowerLogReporter *)self _reportScreeningDurationEventForCall:v9];
    id v7 = [(CSDPowerLogReporter *)self screeningCalls];
    id v8 = [v9 uniqueProxyIdentifier];
    [v7 setObject:0 forKeyedSubscript:v8];
  }
}

- (void)_reportScreeningEnabledEvent:(BOOL)a3
{
  BOOL v3 = a3;
  id v7 = objc_alloc_init((Class)NSMutableDictionary);
  id v5 = +[NSNumber numberWithBool:v3];
  [v7 setObject:v5 forKeyedSubscript:@"Enabled"];

  id v6 = [(CSDPowerLogReporter *)self eventBlock];
  ((void (**)(void, const __CFString *, id))v6)[2](v6, @"CallScreeningEnabled", v7);
}

- (void)_reportScreeningDurationEventForCall:(id)a3
{
  id v15 = a3;
  objc_super v4 = [(CSDPowerLogReporter *)self screeningCalls];
  id v5 = [v15 uniqueProxyIdentifier];
  id v6 = [v4 objectForKeyedSubscript:v5];

  if (v6)
  {
    uint64_t v7 = (*((uint64_t (**)(void))self->_systemTimeProvider + 2))();
    id v8 = [(CSDPowerLogReporter *)self screeningCalls];
    id v9 = [v15 uniqueProxyIdentifier];
    id v10 = [v8 objectForKeyedSubscript:v9];
    double v11 = (double)(unint64_t)(v7 - (void)[v10 unsignedLongLongValue]);

    id v12 = objc_alloc_init((Class)NSMutableDictionary);
    v13 = +[NSNumber numberWithDouble:v11 / 1000000000.0];
    [v12 setObject:v13 forKeyedSubscript:@"Duration"];

    v14 = [(CSDPowerLogReporter *)self eventBlock];
    ((void (**)(void, const __CFString *, id))v14)[2](v14, @"CallScreeningDuration", v12);
  }
}

- (id)_contextDictionaryWithCall:(id)a3
{
  id v4 = a3;
  id v5 = +[NSMutableDictionary dictionary];
  id v6 = [(CSDPowerLogReporter *)self _bundleIdentifierForCall:v4];
  [v5 setObject:v6 forKeyedSubscript:@"bundleID"];

  uint64_t v7 = [v4 provider];
  uint64_t v8 = [v7 identifier];
  [v5 setObject:v8 forKeyedSubscript:@"providerIdentifier"];

  id v9 = [v4 provider];
  LOBYTE(v8) = [v9 isFaceTimeProvider];

  if ((v8 & 1) == 0)
  {
    id v10 = [v4 providerContext];
    [v5 setObject:v10 forKeyedSubscript:@"providerContext"];
  }
  double v11 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v4 isVideo]);
  [v5 setObject:v11 forKeyedSubscript:@"video"];

  id v12 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v4 isHostedOnCurrentDevice]);
  [v5 setObject:v12 forKeyedSubscript:@"hostedOnCurrentDevice"];

  v13 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v4 isEndpointOnCurrentDevice]);
  [v5 setObject:v13 forKeyedSubscript:@"endpointOnCurrentDevice"];

  return v5;
}

- (id)_bundleIdentifierForCall:(id)a3
{
  id v3 = a3;
  id v4 = [v3 provider];
  unsigned int v5 = [v4 isTelephonyProvider];

  if (v5)
  {
    if (+[TUCallCapabilities supportsPrimaryCalling])
    {
      id v6 = TUBundleIdentifierMobilePhoneApplication;
LABEL_6:
      id v9 = v6;
      goto LABEL_8;
    }
LABEL_5:
    TUPreferredFaceTimeBundleIdentifier();
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  uint64_t v7 = [v3 provider];
  unsigned int v8 = [v7 isFaceTimeProvider];

  if (v8) {
    goto LABEL_5;
  }
  id v10 = [v3 provider];
  id v9 = [v10 bundleIdentifier];

LABEL_8:

  return v9;
}

- (id)systemTimeProvider
{
  return self->_systemTimeProvider;
}

- (void)setSystemTimeProvider:(id)a3
{
}

- (id)eventBlock
{
  return self->_eventBlock;
}

- (void)setEventBlock:(id)a3
{
}

- (NSDictionary)callStateContext
{
  return self->_callStateContext;
}

- (void)setCallStateContext:(id)a3
{
}

- (NSDictionary)visibilityContext
{
  return self->_visibilityContext;
}

- (void)setVisibilityContext:(id)a3
{
}

- (NSMutableDictionary)screeningCalls
{
  return self->_screeningCalls;
}

- (void)setScreeningCalls:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_screeningCalls, 0);
  objc_storeStrong((id *)&self->_visibilityContext, 0);
  objc_storeStrong((id *)&self->_callStateContext, 0);
  objc_storeStrong(&self->_eventBlock, 0);

  objc_storeStrong(&self->_systemTimeProvider, 0);
}

@end