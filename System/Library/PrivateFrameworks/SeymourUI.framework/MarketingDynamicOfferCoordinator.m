@interface MarketingDynamicOfferCoordinator
- (_TtC9SeymourUI32MarketingDynamicOfferCoordinator)init;
- (void)dynamicViewController:(id)a3 didFinishCarrierLinkingWithResult:(id)a4 error:(id)a5;
- (void)dynamicViewController:(id)a3 didFinishPurchaseWithResult:(id)a4 error:(id)a5;
- (void)dynamicViewController:(id)a3 didFinishWithPurchaseResult:(id)a4 error:(id)a5;
@end

@implementation MarketingDynamicOfferCoordinator

- (void)dynamicViewController:(id)a3 didFinishWithPurchaseResult:(id)a4 error:(id)a5
{
  uint64_t v9 = sub_23A7FC498();
  uint64_t v10 = *(void *)(v9 - 8);
  __n128 v11 = MEMORY[0x270FA5388](v9);
  v13 = (char *)&v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (MEMORY[0x23ECB8640]((char *)self + OBJC_IVAR____TtC9SeymourUI32MarketingDynamicOfferCoordinator_eventHub, v11))
  {
    swift_getObjectType();
    id v18 = a5;
    id v14 = a3;
    id v15 = a4;
    v16 = self;
    sub_23A7FC488();
    sub_23A6F4770();
    sub_23A7FDB18();
    swift_unknownObjectRelease();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v13, v9);
  }
}

- (void)dynamicViewController:(id)a3 didFinishPurchaseWithResult:(id)a4 error:(id)a5
{
}

- (void)dynamicViewController:(id)a3 didFinishCarrierLinkingWithResult:(id)a4 error:(id)a5
{
}

- (_TtC9SeymourUI32MarketingDynamicOfferCoordinator)init
{
  *(void *)&self->eventHub[OBJC_IVAR____TtC9SeymourUI32MarketingDynamicOfferCoordinator_eventHub] = 0;
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for MarketingDynamicOfferCoordinator();
  return [(MarketingDynamicOfferCoordinator *)&v4 init];
}

- (void).cxx_destruct
{
  sub_239C1AE10((uint64_t)self + OBJC_IVAR____TtC9SeymourUI32MarketingDynamicOfferCoordinator_eventHub);

  swift_unknownObjectWeakDestroy();
}

@end