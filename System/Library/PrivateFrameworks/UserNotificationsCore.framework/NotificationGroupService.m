@interface NotificationGroupService
- (void)summaryServiceDidReceiveGroupSummaries:(id)a3;
@end

@implementation NotificationGroupService

- (void)summaryServiceDidReceiveGroupSummaries:(id)a3
{
  sub_2608DED7C(0, &qword_26A8C5388);
  uint64_t v3 = sub_260A84D70();
  swift_retain();
  NotificationGroupService.summaryServiceDidReceiveGroupSummaries(_:)((Swift::OpaquePointer)v3);
  swift_release();

  swift_bridgeObjectRelease();
}

@end