@interface DOCDefaultSourceUIManager
- (_TtC5Files25DOCDefaultSourceUIManager)init;
- (_TtC5Files25DOCDefaultSourceUIManager)initWithConfiguration:(id)a3 sourceObserver:(id)a4 presentAlertsOn:(id)a5;
- (void)applicationDidBecomeActive:(id)a3;
- (void)dealloc;
- (void)ubiquityIdentityDidChange:(id)a3;
@end

@implementation DOCDefaultSourceUIManager

- (_TtC5Files25DOCDefaultSourceUIManager)initWithConfiguration:(id)a3 sourceObserver:(id)a4 presentAlertsOn:(id)a5
{
  return (_TtC5Files25DOCDefaultSourceUIManager *)sub_1000346EC(a3, a4, a5);
}

- (void)applicationDidBecomeActive:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10001666C((uint64_t)&unk_1006A9EC8, (uint64_t)sub_1000D6C0C, (uint64_t)&unk_1006A9EE0);
}

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  id v4 = self;
  v5 = self;
  id v6 = [v4 defaultCenter];
  [v6 removeObserver:v5];

  CFNotificationCenterRef DistributedCenter = CFNotificationCenterGetDistributedCenter();
  if (DistributedCenter)
  {
    v8 = DistributedCenter;
    CFNotificationCenterRemoveEveryObserver(v8, v5);

    v9.receiver = v5;
    v9.super_class = ObjectType;
    [(DOCDefaultSourceUIManager *)&v9 dealloc];
  }
  else
  {
    __break(1u);
  }
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Files25DOCDefaultSourceUIManager_sourceObserver);
}

- (void)ubiquityIdentityDidChange:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10001666C((uint64_t)&unk_1006AA3A0, (uint64_t)sub_1000D6C10, (uint64_t)&unk_1006AA3B8);
}

- (_TtC5Files25DOCDefaultSourceUIManager)init
{
  result = (_TtC5Files25DOCDefaultSourceUIManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end