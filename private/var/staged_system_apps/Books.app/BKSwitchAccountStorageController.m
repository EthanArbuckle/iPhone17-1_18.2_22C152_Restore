@interface BKSwitchAccountStorageController
- (BKSwitchAccountStorageController)init;
@end

@implementation BKSwitchAccountStorageController

- (BKSwitchAccountStorageController)init
{
  uint64_t ObjectType = swift_getObjectType();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___BKSwitchAccountStorageController_cancellables) = (Class)&_swiftEmptySetSingleton;
  *(void *)(swift_allocObject() + 16) = ObjectType;
  sub_100058D18(&qword_100B28D08);
  swift_allocObject();
  v4 = self;
  *(Class *)((char *)&v4->super.isa + OBJC_IVAR___BKSwitchAccountStorageController_accountsState) = (Class)sub_1007F7800();

  v7.receiver = v4;
  v7.super_class = (Class)type metadata accessor for SwitchAccountStorageController();
  v5 = [(BKSwitchAccountStorageController *)&v7 init];
  sub_10028F91C();

  return v5;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_release();
}

@end