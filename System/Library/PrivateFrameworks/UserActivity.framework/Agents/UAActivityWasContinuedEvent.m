@interface UAActivityWasContinuedEvent
- (UAActivityWasContinuedEvent)initWithAnalyticsInfo:(id)a3;
- (UAUserActivityAnalyticsInfo)info;
- (id)eventName;
- (id)eventPayload;
- (id)reportedActivityType;
- (id)stringForInteraction;
- (void)setInfo:(id)a3;
@end

@implementation UAActivityWasContinuedEvent

- (UAActivityWasContinuedEvent)initWithAnalyticsInfo:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)UAActivityWasContinuedEvent;
  v5 = [(UAActivityWasContinuedEvent *)&v8 init];
  v6 = v5;
  if (v5) {
    [(UAActivityWasContinuedEvent *)v5 setInfo:v4];
  }

  return v6;
}

- (id)eventName
{
  return @"com.apple.UserActivity.Handoff.WasContinued";
}

- (id)eventPayload
{
  v3 = [(UAActivityWasContinuedEvent *)self info];
  id v4 = [v3 error];

  if (v4)
  {
    v5 = [(UAActivityWasContinuedEvent *)self info];
    v6 = [v5 error];
    +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v6 code]);
    v61 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v61 = (__CFString *)&off_1000CC888;
  }
  v7 = [(UAActivityWasContinuedEvent *)self info];
  objc_super v8 = [v7 remoteDeviceType];

  if (!v8)
  {
    v9 = sub_10000BA18(0);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "No remote device type set", buf, 2u);
    }

    v10 = [(UAActivityWasContinuedEvent *)self info];
    [v10 setRemoteDeviceType:@"Unknown"];
  }
  v63[0] = @"activityType";
  uint64_t v11 = [(UAActivityWasContinuedEvent *)self reportedActivityType];
  v60 = (void *)v11;
  if (v11) {
    CFStringRef v12 = (const __CFString *)v11;
  }
  else {
    CFStringRef v12 = @"-";
  }
  v64[0] = v12;
  v63[1] = @"bundleIdentifier";
  v59 = [(UAActivityWasContinuedEvent *)self info];
  uint64_t v13 = [v59 bundleIdentifier];
  v58 = (void *)v13;
  if (v13) {
    CFStringRef v14 = (const __CFString *)v13;
  }
  else {
    CFStringRef v14 = @"-";
  }
  v64[1] = v14;
  v63[2] = @"suggestedActionType";
  v57 = [(UAActivityWasContinuedEvent *)self info];
  uint64_t v15 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v57 suggestedActionType]);
  v56 = (void *)v15;
  if (v15) {
    CFStringRef v16 = (const __CFString *)v15;
  }
  else {
    CFStringRef v16 = @"-";
  }
  v64[2] = v16;
  v63[3] = @"payloadSize";
  v55 = [(UAActivityWasContinuedEvent *)self info];
  uint64_t v17 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v55 payloadSize]);
  v54 = (void *)v17;
  if (v17) {
    CFStringRef v18 = (const __CFString *)v17;
  }
  else {
    CFStringRef v18 = @"-";
  }
  v64[3] = v18;
  v63[4] = @"transferSpeed";
  v53 = [(UAActivityWasContinuedEvent *)self info];
  [v53 transferSpeed];
  uint64_t v20 = +[NSNumber numberWithDouble:round(v19)];
  v52 = (void *)v20;
  if (v20) {
    CFStringRef v21 = (const __CFString *)v20;
  }
  else {
    CFStringRef v21 = @"-";
  }
  v64[4] = v21;
  v63[5] = @"transferDurationSec";
  v51 = [(UAActivityWasContinuedEvent *)self info];
  [v51 transferDuration];
  uint64_t v22 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v50 = (void *)v22;
  if (v22) {
    CFStringRef v23 = (const __CFString *)v22;
  }
  else {
    CFStringRef v23 = @"-";
  }
  v64[5] = v23;
  v63[6] = @"canceled";
  v49 = [(UAActivityWasContinuedEvent *)self info];
  uint64_t v24 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v49 isCancelled]);
  v48 = (void *)v24;
  if (v24) {
    CFStringRef v25 = (const __CFString *)v24;
  }
  else {
    CFStringRef v25 = @"-";
  }
  v64[6] = v25;
  v63[7] = @"broweserFallback";
  v47 = [(UAActivityWasContinuedEvent *)self info];
  uint64_t v26 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v47 isBrowserFallback]);
  v27 = (void *)v26;
  if (v26) {
    CFStringRef v28 = (const __CFString *)v26;
  }
  else {
    CFStringRef v28 = @"-";
  }
  v64[7] = v28;
  v63[8] = @"webToNative";
  v29 = [(UAActivityWasContinuedEvent *)self info];
  uint64_t v30 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v29 webToNative]);
  v31 = (void *)v30;
  if (v30) {
    CFStringRef v32 = (const __CFString *)v30;
  }
  else {
    CFStringRef v32 = @"-";
  }
  v64[8] = v32;
  v63[9] = @"supportsContinuityStreams";
  v33 = [(UAActivityWasContinuedEvent *)self info];
  uint64_t v34 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v33 supportsContinuityStreams]);
  v35 = (void *)v34;
  if (v34) {
    CFStringRef v36 = (const __CFString *)v34;
  }
  else {
    CFStringRef v36 = @"-";
  }
  v64[9] = v36;
  v63[10] = @"remoteDeviceType";
  v37 = [(UAActivityWasContinuedEvent *)self info];
  uint64_t v38 = [v37 remoteDeviceType];
  v39 = (void *)v38;
  if (v38) {
    CFStringRef v40 = (const __CFString *)v38;
  }
  else {
    CFStringRef v40 = @"-";
  }
  if (v61) {
    CFStringRef v41 = v61;
  }
  else {
    CFStringRef v41 = @"-";
  }
  v64[10] = v40;
  v64[11] = v41;
  v63[11] = @"errorCode";
  v63[12] = @"interactionType";
  uint64_t v42 = [(UAActivityWasContinuedEvent *)self stringForInteraction];
  v43 = (void *)v42;
  if (v42) {
    CFStringRef v44 = (const __CFString *)v42;
  }
  else {
    CFStringRef v44 = @"-";
  }
  v64[12] = v44;
  v45 = +[NSDictionary dictionaryWithObjects:v64 forKeys:v63 count:13];

  return v45;
}

- (id)reportedActivityType
{
  v3 = [(UAActivityWasContinuedEvent *)self info];
  id v4 = [v3 activityType];
  v5 = [(UAAnalyticsEvent *)self firstPartyActivityTypeOrUnknown:v4];

  return v5;
}

- (id)stringForInteraction
{
  v2 = [(UAActivityWasContinuedEvent *)self info];
  uint64_t v3 = (uint64_t)[v2 interactionType];

  CFStringRef v4 = @"unknown";
  CFStringRef v5 = @"spotlight";
  if (v3 != 805306369) {
    CFStringRef v5 = @"unknown";
  }
  if (v3 == 805306368) {
    CFStringRef v6 = @"proxy-object";
  }
  else {
    CFStringRef v6 = v5;
  }
  if (v3 == 536870913) {
    CFStringRef v7 = @"multi-tasker";
  }
  else {
    CFStringRef v7 = @"unknown";
  }
  if (v3 == 0x20000000) {
    CFStringRef v8 = @"lock-screen";
  }
  else {
    CFStringRef v8 = v7;
  }
  if (v3 <= 805306367) {
    CFStringRef v9 = v8;
  }
  else {
    CFStringRef v9 = v6;
  }
  if (v3 == 268435458) {
    CFStringRef v4 = @"notification-center";
  }
  if (v3 == 268435457) {
    CFStringRef v4 = @"dock";
  }
  if (v3 == 0x10000000) {
    CFStringRef v4 = @"command-tab";
  }
  if (v3 <= 0x1FFFFFFF) {
    return (id)v4;
  }
  else {
    return (id)v9;
  }
}

- (UAUserActivityAnalyticsInfo)info
{
  return (UAUserActivityAnalyticsInfo *)objc_getProperty(self, a2, 8, 1);
}

- (void)setInfo:(id)a3
{
}

- (void).cxx_destruct
{
}

@end