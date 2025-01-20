@interface BATelemetrySender
+ (BOOL)shouldReportBundleIDInTelemetry:(id)a3 date:(id)a4 deviceIdentifier:(unsigned __int8)a5[16];
+ (void)sendContentRequestTelemetryEvent:(id)a3;
@end

@implementation BATelemetrySender

+ (BOOL)shouldReportBundleIDInTelemetry:(id)a3 date:(id)a4 deviceIdentifier:(unsigned __int8)a5[16]
{
  id v7 = a3;
  id v8 = a4;
  if (v7 && ([v7 isEqualToString:&stru_10005DEF8] & 1) == 0)
  {
    v10 = +[NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
    unsigned int v11 = [v10 ordinalityOfUnit:16 inUnit:4 forDate:v8];
    unsigned int data = v11 + 366 * [v10 component:4 fromDate:v8];
    memset(&v15, 0, sizeof(v15));
    CC_SHA256_Init(&v15);
    CC_SHA256_Update(&v15, a5, 0x10u);
    CC_SHA256_Update(&v15, &data, 4u);
    v12 = (const char *)[v7 UTF8String];
    CC_LONG v13 = strlen(v12);
    CC_SHA256_Update(&v15, v12, v13);
    CC_SHA256_Final(md, &v15);
    BOOL v9 = *(unsigned __int16 *)md < 0x290u;
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

+ (void)sendContentRequestTelemetryEvent:(id)a3
{
  id v3 = a3;
  if (qword_100069520 != -1) {
    dispatch_once(&qword_100069520, &stru_10005CBB0);
  }
  v4 = [v3 eventName];
  v5 = [v3 payload];
  id v6 = [v5 mutableCopy];

  id v7 = [v6 valueForKey:@"BundleIdentifier"];
  if (os_variant_has_internal_diagnostics())
  {
    AnalyticsSendEvent();
    id v8 = sub_100013ABC();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412546;
      CC_LONG v13 = v4;
      __int16 v14 = 2112;
      id v15 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "BATelemetrySender: sent %@ event, payload: %@", (uint8_t *)&v12, 0x16u);
    }
  }
  else
  {
    BOOL v9 = +[NSDate date];
    unsigned __int8 v10 = +[BATelemetrySender shouldReportBundleIDInTelemetry:v7 date:v9 deviceIdentifier:&unk_100069510];

    if ((v10 & 1) == 0)
    {
      unsigned int v11 = +[NSNull null];
      [v6 setObject:v11 forKey:@"BundleIdentifier"];
    }
    AnalyticsSendEvent();
  }
}

@end