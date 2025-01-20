@interface BKReportIssueModuleFactory
+ (void)instantiateWithAnalyticsContentId:(NSString *)a3 analyticsSupplementalContentCount:(NSNumber *)a4 analyticsTracker:(_TtC13BookAnalytics9BATracker *)a5 completionHandler:(id)a6;
- (BKReportIssueModuleFactory)init;
@end

@implementation BKReportIssueModuleFactory

+ (void)instantiateWithAnalyticsContentId:(NSString *)a3 analyticsSupplementalContentCount:(NSNumber *)a4 analyticsTracker:(_TtC13BookAnalytics9BATracker *)a5 completionHandler:(id)a6
{
  uint64_t v11 = sub_100058D18(&qword_100B27720);
  __chkstk_darwin(v11 - 8);
  v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = _Block_copy(a6);
  v15 = (void *)swift_allocObject();
  v15[2] = a3;
  v15[3] = a4;
  v15[4] = a5;
  v15[5] = v14;
  v15[6] = a1;
  uint64_t v16 = sub_1007FE150();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v13, 1, 1, v16);
  v17 = (void *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_100B3F6E0;
  v17[5] = v15;
  v18 = (void *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &unk_100B2C0F0;
  v18[5] = v17;
  v19 = a3;
  v20 = a4;
  v21 = a5;
  sub_1006EB59C((uint64_t)v13, (uint64_t)&unk_100B33060, (uint64_t)v18);
  swift_release();
}

- (BKReportIssueModuleFactory)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(BKReportIssueModuleFactory *)&v3 init];
}

@end