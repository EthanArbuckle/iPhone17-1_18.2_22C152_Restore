@interface UADiagnosticManager
+ (id)sharedManager;
- (UADiagnosticManager)init;
- (id)firstPartyActivityTypeOrUnknown:(id)a3;
- (unint64_t)roundNum:(unint64_t)a3 to:(unint64_t)a4;
- (void)submitDidSendLocalPasteboard:(id)a3;
- (void)submitRemotePasteboardBecameAvailable;
- (void)submitRemotePasteboardBecameUnavailable:(unint64_t)a3;
- (void)submitRemotePasteboardTypeInfoRequested:(id)a3;
- (void)submitRemotePasteboardWasRequested:(id)a3;
- (void)submitUserActivityBecameCurrent:(id)a3 withToken:(id *)a4;
- (void)submitUserActivityWasContinuedInfo:(id)a3;
- (void)submitUserActivityWasDiscovered:(id)a3;
- (void)submitUserActivityWasSuggestedInfo:(id)a3;
@end

@implementation UADiagnosticManager

- (void)submitUserActivityBecameCurrent:(id)a3 withToken:(id *)a4
{
  id v6 = a3;
  if (!a4
    || (long long v7 = *(_OWORD *)&a4->var0[4],
        v12[0] = *(_OWORD *)a4->var0,
        v12[1] = v7,
        sub_10000C6B4(v12),
        (v8 = (__CFString *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    v8 = @"unknown";
  }
  v9 = objc_alloc_init(UAActivityBecameCurrentEvent);
  v10 = [(UADiagnosticManager *)self firstPartyActivityTypeOrUnknown:v6];
  [(UAActivityBecameCurrentEvent *)v9 setActivityType:v10];

  [(UAActivityBecameCurrentEvent *)v9 setBundleIdentifier:v8];
  [(UAAnalyticsEvent *)v9 sendEvent];
  v11 = sub_10000BA18(@"Diagnostic");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    LODWORD(v12[0]) = 138477827;
    *(void *)((char *)v12 + 4) = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Submitted UAActivityBecameCurrentEvent: %{private}@", (uint8_t *)v12, 0xCu);
  }
}

- (id)firstPartyActivityTypeOrUnknown:(id)a3
{
  id v3 = a3;
  if (([v3 hasPrefix:@":com.apple."] & 1) != 0
    || ([v3 hasPrefix:@"com.apple."] & 1) != 0
    || [v3 isEqualToString:@"NSUserActivityTypeBrowsingWeb"])
  {
    v4 = (__CFString *)v3;
  }
  else
  {
    v4 = @"unknown";
  }
  v5 = sub_10000BA18(@"Diagnostic");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v7 = 138478083;
    id v8 = v3;
    __int16 v9 = 2113;
    v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Metric AT for %{private}@ is %{private}@", (uint8_t *)&v7, 0x16u);
  }

  return v4;
}

+ (id)sharedManager
{
  if (qword_1000E6818 != -1) {
    dispatch_once(&qword_1000E6818, &stru_1000C5A40);
  }
  v2 = (void *)qword_1000E6810;

  return v2;
}

- (UADiagnosticManager)init
{
  v3.receiver = self;
  v3.super_class = (Class)UADiagnosticManager;
  return [(UADiagnosticManager *)&v3 init];
}

- (void)submitUserActivityWasDiscovered:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(UAActivityWasDiscoveredEvent);
  id v6 = [(UADiagnosticManager *)self firstPartyActivityTypeOrUnknown:v4];

  [(UAActivityWasDiscoveredEvent *)v5 setActivityType:v6];
  [(UAAnalyticsEvent *)v5 sendEvent];
  int v7 = sub_10000BA18(@"Diagnostic");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v8 = 138477827;
    __int16 v9 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Submitted UAActivityWasDiscoveredEvent: %{private}@", (uint8_t *)&v8, 0xCu);
  }
}

- (void)submitUserActivityWasSuggestedInfo:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    id v4 = [[UAActivityWasSuggestedEvent alloc] initWithAnalyticsInfo:v3];

    [(UAActivityWasSuggestedEvent *)v4 sendEvent];
    v5 = sub_10000BA18(@"Diagnostic");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v6 = 138477827;
      int v7 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Submitted UAActivityWasSuggestedEvent: %{private}@", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (void)submitUserActivityWasContinuedInfo:(id)a3
{
  id v3 = a3;
  if (([v3 payloadRequested] & 1) != 0 || !objc_msgSend(v3, "isCancelled"))
  {
    id v4 = [[UAActivityWasContinuedEvent alloc] initWithAnalyticsInfo:v3];
    [(UAAnalyticsEvent *)v4 sendEvent];
    v5 = sub_10000BA18(@"Diagnostic");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v6 = [v3 uuid];
      int v7 = 138412547;
      int v8 = v6;
      __int16 v9 = 2113;
      v10 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Submitted UAActivityWasContinuedEvent for %@: %{private}@", (uint8_t *)&v7, 0x16u);
    }
  }
  else
  {
    sub_10000BA18(@"Diagnostic");
    id v4 = (UAActivityWasContinuedEvent *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v4->super.super, OS_LOG_TYPE_INFO))
    {
      LOWORD(v7) = 0;
      _os_log_impl((void *)&_mh_execute_header, &v4->super.super, OS_LOG_TYPE_INFO, "Not reporting activity was continued becasuse payload was never requested.", (uint8_t *)&v7, 2u);
    }
  }
}

- (void)submitRemotePasteboardWasRequested:(id)a3
{
  id v3 = a3;
  [v3 sendEvent];
  id v4 = sub_10000BA18(@"Diagnostic");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = [v3 description];
    int v6 = sub_100063FF0(v5);
    int v7 = 138477827;
    int v8 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Submitted UARemotePasteboardWasRequestedEvent: %{private}@", (uint8_t *)&v7, 0xCu);
  }
}

- (void)submitDidSendLocalPasteboard:(id)a3
{
  id v3 = a3;
  [v3 sendEvent];
  id v4 = sub_10000BA18(@"Diagnostic");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = [v3 description];
    int v6 = sub_100063FF0(v5);
    int v7 = 138477827;
    int v8 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Submitted UARemotePasteboardDidSendLocalEvent: %{private}@", (uint8_t *)&v7, 0xCu);
  }
}

- (void)submitRemotePasteboardTypeInfoRequested:(id)a3
{
  id v3 = a3;
  [v3 sendEvent];
  id v4 = sub_10000BA18(@"Diagnostic");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = [v3 description];
    int v6 = sub_100063FF0(v5);
    int v7 = 138477827;
    int v8 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Submitted UARemotePasteboardTypeInfoRequestedEvent: %{private}@", (uint8_t *)&v7, 0xCu);
  }
}

- (void)submitRemotePasteboardBecameAvailable
{
  v2 = objc_alloc_init(UARemotePasteboardBecameAvailableEvent);
  [(UAAnalyticsEvent *)v2 sendEvent];
  id v3 = sub_10000BA18(@"Diagnostic");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    id v4 = [(UAAnalyticsEvent *)v2 description];
    v5 = sub_100063FF0(v4);
    int v6 = 138477827;
    int v7 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Submitted UARemotePasteboardBecameAvailableEvent: %{private}@", (uint8_t *)&v6, 0xCu);
  }
}

- (void)submitRemotePasteboardBecameUnavailable:(unint64_t)a3
{
  id v4 = objc_alloc_init(UARemotePasteboardBecameUnavailableEvent);
  [(UARemotePasteboardBecameUnavailableEvent *)v4 setReason:a3];
  [(UAAnalyticsEvent *)v4 sendEvent];
  v5 = sub_10000BA18(@"Diagnostic");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 138477827;
    int v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Submitted UARemotePasteboardBecameUnavailableEvent: %{private}@", (uint8_t *)&v6, 0xCu);
  }
}

- (unint64_t)roundNum:(unint64_t)a3 to:(unint64_t)a4
{
  return (unint64_t)(ceil((double)a3 / (double)a4) * (double)a4);
}

@end