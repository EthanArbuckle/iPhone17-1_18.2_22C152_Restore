@interface CKAskToNotificationManager
+ (CKAskToNotificationManager)sharedManager;
- (CKAskToNotificationManager)init;
- (id)notificationActionsFromNotification:(id)a3;
- (void)handleResponse:(id)a3 completion:(id)a4;
@end

@implementation CKAskToNotificationManager

+ (CKAskToNotificationManager)sharedManager
{
  if (qword_100010AB8 != -1) {
    swift_once();
  }
  v2 = (void *)qword_100010AC0;

  return (CKAskToNotificationManager *)v2;
}

- (id)notificationActionsFromNotification:(id)a3
{
  id v4 = a3;
  v5 = self;
  id v6 = sub_100006230(v4);

  if (v6)
  {
    sub_100009EBC(0, &qword_100010A18);
    v7.super.isa = sub_10000A130().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v7.super.isa = 0;
  }

  return v7.super.isa;
}

- (void)handleResponse:(id)a3 completion:(id)a4
{
  id v6 = _Block_copy(a4);
  _Block_copy(v6);
  id v7 = a3;
  v8 = self;
  sub_10000904C(v7, (uint64_t)v8, (void (**)(const void *, void))v6);
  _Block_release(v6);
  _Block_release(v6);
}

- (CKAskToNotificationManager)init
{
  uint64_t v3 = OBJC_IVAR___CKAskToNotificationManager_actionIdentifierToResponsePayloadMap;
  id v4 = self;
  *(Class *)((char *)&self->super.isa + v3) = (Class)sub_100005DF0((uint64_t)&_swiftEmptyArrayStorage);

  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for AskToNotificationManager();
  return [(CKAskToNotificationManager *)&v6 init];
}

- (void).cxx_destruct
{
}

@end