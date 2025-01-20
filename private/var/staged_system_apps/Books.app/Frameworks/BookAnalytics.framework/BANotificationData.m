@interface BANotificationData
- (BANotificationData)init;
- (BANotificationData)initWithNotificationContentID:(id)a3 notificationID:(id)a4 notificationType:(int64_t)a5 recoType:(int64_t)a6 goalType:(int64_t)a7 titleCode:(id)a8 title:(id)a9 messageCode:(id)a10 message:(id)a11;
@end

@implementation BANotificationData

- (BANotificationData)initWithNotificationContentID:(id)a3 notificationID:(id)a4 notificationType:(int64_t)a5 recoType:(int64_t)a6 goalType:(int64_t)a7 titleCode:(id)a8 title:(id)a9 messageCode:(id)a10 message:(id)a11
{
  if (a3) {
    uint64_t v12 = sub_27DEF0();
  }
  else {
    uint64_t v12 = 0;
  }
  uint64_t v13 = (uint64_t)a10;
  uint64_t v14 = sub_27DDB0();
  uint64_t v16 = v15;
  if (a8)
  {
    uint64_t v17 = sub_27DDB0();
    uint64_t v19 = v18;
  }
  else
  {
    uint64_t v17 = 0;
    uint64_t v19 = 0;
  }
  uint64_t v20 = sub_27DDB0();
  uint64_t v22 = v21;
  if (!a10)
  {
    uint64_t v24 = 0;
    if (a11) {
      goto LABEL_9;
    }
LABEL_11:
    uint64_t v25 = 0;
    uint64_t v26 = 0;
    return (BANotificationData *)BridgedNotificationData.init(notificationContentID:notificationID:notificationType:recoType:goalType:titleCode:title:messageCode:message:)(v12, v14, v16, a5, a6, a7, v17, v19, v20, v22, v13, v24, v25, v26);
  }
  uint64_t v13 = sub_27DDB0();
  uint64_t v24 = v23;
  if (!a11) {
    goto LABEL_11;
  }
LABEL_9:
  uint64_t v25 = sub_27DDB0();
  return (BANotificationData *)BridgedNotificationData.init(notificationContentID:notificationID:notificationType:recoType:goalType:titleCode:title:messageCode:message:)(v12, v14, v16, a5, a6, a7, v17, v19, v20, v22, v13, v24, v25, v26);
}

- (BANotificationData)init
{
  result = (BANotificationData *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end