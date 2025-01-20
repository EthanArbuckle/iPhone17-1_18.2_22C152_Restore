@interface MarketingPurchaseCoordinator
- (_TtC9SeymourUI28MarketingPurchaseCoordinator)init;
- (void)purchase:(id)a3 handleAuthenticateRequest:(id)a4 completion:(id)a5;
- (void)purchase:(id)a3 handleDialogRequest:(id)a4 completion:(id)a5;
- (void)purchase:(id)a3 handleEngagementRequest:(id)a4 completion:(id)a5;
@end

@implementation MarketingPurchaseCoordinator

- (_TtC9SeymourUI28MarketingPurchaseCoordinator)init
{
  swift_unknownObjectWeakInit();
  *(void *)&self->bag[OBJC_IVAR____TtC9SeymourUI28MarketingPurchaseCoordinator_eventHub] = 0;
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for MarketingPurchaseCoordinator();
  return [(MarketingPurchaseCoordinator *)&v4 init];
}

- (void).cxx_destruct
{
  sub_239C1AE10((uint64_t)self + OBJC_IVAR____TtC9SeymourUI28MarketingPurchaseCoordinator_bag);
  sub_239C1AE10((uint64_t)self + OBJC_IVAR____TtC9SeymourUI28MarketingPurchaseCoordinator_eventHub);
  swift_unknownObjectWeakDestroy();

  swift_unknownObjectWeakDestroy();
}

- (void)purchase:(id)a3 handleAuthenticateRequest:(id)a4 completion:(id)a5
{
  v8 = _Block_copy(a5);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  id v10 = a3;
  id v11 = a4;
  v12 = self;
  sub_23A774CA0(v11, (uint64_t)sub_23A7750F4, v9, (uint64_t)&unk_26EDB2470, (uint64_t)sub_23A7750E4, (uint64_t)&block_descriptor_50_3);

  swift_release();
}

- (void)purchase:(id)a3 handleDialogRequest:(id)a4 completion:(id)a5
{
  v8 = _Block_copy(a5);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  id v10 = a3;
  id v11 = a4;
  v12 = self;
  sub_23A774CA0(v11, (uint64_t)sub_23A774FB4, v9, (uint64_t)&unk_26EDB23D0, (uint64_t)sub_23A775068, (uint64_t)&block_descriptor_37_1);

  swift_release();
}

- (void)purchase:(id)a3 handleEngagementRequest:(id)a4 completion:(id)a5
{
  v8 = _Block_copy(a5);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  id v10 = a3;
  id v11 = a4;
  v12 = self;
  sub_23A774CA0(v11, (uint64_t)sub_23A7750F4, v9, (uint64_t)&unk_26EDB2308, (uint64_t)sub_23A774FD4, (uint64_t)&block_descriptor_174);

  swift_release();
}

@end