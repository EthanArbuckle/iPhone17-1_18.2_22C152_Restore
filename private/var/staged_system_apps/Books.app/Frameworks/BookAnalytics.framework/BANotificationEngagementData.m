@interface BANotificationEngagementData
- (BANotificationEngagementData)init;
- (BANotificationEngagementData)initWithActionType:(int64_t)a3 actionUrl:(id)a4 targetID:(id)a5 targetType:(int64_t)a6;
@end

@implementation BANotificationEngagementData

- (BANotificationEngagementData)initWithActionType:(int64_t)a3 actionUrl:(id)a4 targetID:(id)a5 targetType:(int64_t)a6
{
  uint64_t v10 = sub_27DDB0();
  uint64_t v12 = v11;
  if (a5) {
    v13 = (objc_class *)sub_27DEF0();
  }
  else {
    v13 = 0;
  }
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___BANotificationEngagementData_actionType) = (Class)a3;
  v14 = (uint64_t *)((char *)self + OBJC_IVAR___BANotificationEngagementData_actionUrl);
  uint64_t *v14 = v10;
  v14[1] = v12;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___BANotificationEngagementData_targetID) = v13;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___BANotificationEngagementData_targetType) = (Class)a6;
  v16.receiver = self;
  v16.super_class = (Class)type metadata accessor for BridgedNotificationEngagementData();
  return [(BANotificationEngagementData *)&v16 init];
}

- (BANotificationEngagementData)init
{
  result = (BANotificationEngagementData *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end