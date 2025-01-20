@interface PendingProvisioningManager.PendingProvisioningMessageManager
- (_TtCC5passd26PendingProvisioningManager33PendingProvisioningMessageManager)init;
- (id)applicationMessageSink:(id)a3 createContentForMessageWithRegistration:(id)a4;
- (void)applicationMessageSink:(id)a3 removedMessageWithRegistration:(id)a4;
- (void)connectApplicationMessageSink:(id)a3;
@end

@implementation PendingProvisioningManager.PendingProvisioningMessageManager

- (void)connectApplicationMessageSink:(id)a3
{
  swift_unknownObjectRetain();
  v5 = self;
  sub_1004FBF04((uint64_t)a3);
  swift_unknownObjectRelease();
}

- (id)applicationMessageSink:(id)a3 createContentForMessageWithRegistration:(id)a4
{
  swift_unknownObjectRetain();
  id v6 = a4;
  v7 = self;
  id v8 = sub_1004FFF80(v6);
  swift_unknownObjectRelease();

  return v8;
}

- (void)applicationMessageSink:(id)a3 removedMessageWithRegistration:(id)a4
{
  swift_unknownObjectRetain();
  id v6 = a4;
  v7 = self;
  sub_100500214(v6);
  swift_unknownObjectRelease();
}

- (_TtCC5passd26PendingProvisioningManager33PendingProvisioningMessageManager)init
{
  result = (_TtCC5passd26PendingProvisioningManager33PendingProvisioningMessageManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_100500428((uint64_t)self + OBJC_IVAR____TtCC5passd26PendingProvisioningManager33PendingProvisioningMessageManager_dataSource);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC5passd26PendingProvisioningManager33PendingProvisioningMessageManager_carKeyRequirementsChecker));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC5passd26PendingProvisioningManager33PendingProvisioningMessageManager_notificationManager));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC5passd26PendingProvisioningManager33PendingProvisioningMessageManager_applicationMessageManager));
  swift_unknownObjectRelease();
}

@end