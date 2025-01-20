@interface NTPBEvent(NSSAdditions)
+ (id)nss_eventWithIdentifier;
- (uint64_t)nss_setStartDate:()NSSAdditions;
- (void)nss_setEndDate:()NSSAdditions;
- (void)nss_setStartDate:()NSSAdditions endDate:;
@end

@implementation NTPBEvent(NSSAdditions)

+ (id)nss_eventWithIdentifier
{
  v0 = objc_opt_new();
  v1 = [MEMORY[0x1E4F29128] UUID];
  v2 = [v1 UUIDString];
  [v0 setAppAnalyticsEventIdentifier:v2];

  return v0;
}

- (uint64_t)nss_setStartDate:()NSSAdditions
{
  uint64_t v4 = NTPBEventDateToTimestamp(a3);
  return [a1 setStartTimestamp:v4];
}

- (void)nss_setStartDate:()NSSAdditions endDate:
{
  id v6 = a4;
  objc_msgSend(a1, "nss_setStartDate:", a3);
  objc_msgSend(a1, "nss_setEndDate:", v6);
}

- (void)nss_setEndDate:()NSSAdditions
{
  id v4 = a3;
  if (([a1 hasStartTimestamp] & 1) == 0 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[NTPBEvent(NSSAdditions) nss_setEndDate:]();
  }
  objc_msgSend(a1, "setDuration:", NTPBEventDateToTimestamp(v4) - objc_msgSend(a1, "startTimestamp"));
}

- (void)nss_setEndDate:()NSSAdditions .cold.1()
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v0 = (void *)[[NSString alloc] initWithFormat:@"unable to calculate the duration of an event without setting the startTimestamp"];
  int v1 = 136315906;
  v2 = "-[NTPBEvent(NSSAdditions) nss_setEndDate:]";
  __int16 v3 = 2080;
  id v4 = "NTPBNewsAnalytics+NSSAdditions.m";
  __int16 v5 = 1024;
  int v6 = 37;
  __int16 v7 = 2114;
  v8 = v0;
  _os_log_error_impl(&dword_1E0102000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v1, 0x26u);
}

@end