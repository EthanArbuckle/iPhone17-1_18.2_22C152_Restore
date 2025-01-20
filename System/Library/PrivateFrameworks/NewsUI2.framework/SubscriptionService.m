@interface SubscriptionService
- (_TtC7NewsUI219SubscriptionService)init;
- (void)handlePurchaseAddedNotificationWithNotification:(id)a3;
- (void)handlePurchaseRemovedNotificationWithNotification:(id)a3;
- (void)subscriptionController:(id)a3 didAddTags:(id)a4 changeTags:(id)a5 moveTags:(id)a6 removeTags:(id)a7 subscriptionType:(unint64_t)a8;
- (void)subscriptionController:(id)a3 didFindTagsWithNotificationSupport:(id)a4;
@end

@implementation SubscriptionService

- (_TtC7NewsUI219SubscriptionService)init
{
  result = (_TtC7NewsUI219SubscriptionService *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI219SubscriptionService_pushNotificationDataManager);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI219SubscriptionService_notificationService);

  swift_unknownObjectRelease();
}

- (void)handlePurchaseAddedNotificationWithNotification:(id)a3
{
}

- (void)handlePurchaseRemovedNotificationWithNotification:(id)a3
{
}

- (void)subscriptionController:(id)a3 didFindTagsWithNotificationSupport:(id)a4
{
  if (a4) {
    uint64_t v6 = sub_1DFDFE5D0();
  }
  else {
    uint64_t v6 = 0;
  }
  id v7 = a3;
  v8 = self;
  sub_1DFCDC92C(v6);

  swift_bridgeObjectRelease();
}

- (void)subscriptionController:(id)a3 didAddTags:(id)a4 changeTags:(id)a5 moveTags:(id)a6 removeTags:(id)a7 subscriptionType:(unint64_t)a8
{
  uint64_t v11 = (uint64_t)a5;
  if (a4)
  {
    uint64_t v14 = sub_1DFDFE5D0();
    if (!v11) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  uint64_t v14 = 0;
  if (a5) {
LABEL_3:
  }
    uint64_t v11 = sub_1DFDFE5D0();
LABEL_4:
  if (a6) {
    a6 = (id)sub_1DFDFE5D0();
  }
  if (a7) {
    a7 = (id)sub_1DFDFE5D0();
  }
  id v15 = a3;
  v16 = self;
  sub_1DFCD99E0(v15, v14, v11, (uint64_t)a6, (uint64_t)a7, a8);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end