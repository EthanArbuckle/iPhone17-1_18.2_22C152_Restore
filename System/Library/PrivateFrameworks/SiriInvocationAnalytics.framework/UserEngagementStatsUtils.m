@interface UserEngagementStatsUtils
- (_TtC23SiriInvocationAnalytics24UserEngagementStatsUtils)init;
@end

@implementation UserEngagementStatsUtils

- (_TtC23SiriInvocationAnalytics24UserEngagementStatsUtils)init
{
  return (_TtC23SiriInvocationAnalytics24UserEngagementStatsUtils *)sub_25C9FC268();
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC23SiriInvocationAnalytics24UserEngagementStatsUtils_timeZone;
  sub_25CA455A8();
  OUTLINED_FUNCTION_18_0();
  (*(void (**)(char *))(v4 + 8))(v3);
  v5 = (char *)self + OBJC_IVAR____TtC23SiriInvocationAnalytics24UserEngagementStatsUtils_calendar;
  sub_25CA45588();
  OUTLINED_FUNCTION_18_0();
  v8 = *(void (**)(char *, uint64_t))(v7 + 8);
  v8(v5, v6);
}

@end