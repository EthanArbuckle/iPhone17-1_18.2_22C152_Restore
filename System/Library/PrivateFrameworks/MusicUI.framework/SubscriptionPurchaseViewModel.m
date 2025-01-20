@interface SubscriptionPurchaseViewModel
- (_TtC7MusicUI29SubscriptionPurchaseViewModel)init;
- (void)purchase:(id)a3 handleAuthenticateRequest:(id)a4 completion:(id)a5;
- (void)purchase:(id)a3 handleDialogRequest:(id)a4 completion:(id)a5;
- (void)purchase:(id)a3 handleEngagementRequest:(id)a4 completion:(id)a5;
@end

@implementation SubscriptionPurchaseViewModel

- (_TtC7MusicUI29SubscriptionPurchaseViewModel)init
{
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC7MusicUI29SubscriptionPurchaseViewModel__state;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268328B30);
  OUTLINED_FUNCTION_3_3();
  (*(void (**)(char *))(v4 + 8))(v3);

  swift_unknownObjectRelease();
  swift_release();
  v5 = (char *)self + OBJC_IVAR____TtC7MusicUI29SubscriptionPurchaseViewModel_actionDispatcher;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26ADA7C00);
  OUTLINED_FUNCTION_3_3();
  (*(void (**)(char *))(v6 + 8))(v5);

  swift_bridgeObjectRelease();
  v7 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC7MusicUI29SubscriptionPurchaseViewModel_presentingViewController);
}

- (void)purchase:(id)a3 handleAuthenticateRequest:(id)a4 completion:(id)a5
{
  v8 = _Block_copy(a5);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  id v10 = a3;
  id v11 = a4;
  v12 = self;
  sub_229C92208((uint64_t)v12, v11, (void (*)(void, id))sub_229C92E84, v9, (void (*)(uint64_t, id, id, void (*)(void, void), uint64_t, uint64_t))sub_229E9C458);

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
  sub_229C92208((uint64_t)v12, v11, (void (*)(void, id))sub_229C92CB4, v9, (void (*)(uint64_t, id, id, void (*)(void, void), uint64_t, uint64_t))sub_229E9C674);

  swift_release();
}

- (void)purchase:(id)a3 handleEngagementRequest:(id)a4 completion:(id)a5
{
  v8 = _Block_copy(a5);
  *(void *)(swift_allocObject() + 16) = v8;
  id v9 = a3;
  id v10 = a4;
  id v11 = self;
  sub_229C9263C((uint64_t)v11, v10, (void (*)(void, id))sub_229C92E84);

  swift_release();
}

@end