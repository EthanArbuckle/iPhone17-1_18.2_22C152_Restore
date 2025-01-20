@interface InStoreTopUpTokenModel
- (_TtC9PassKitUI22InStoreTopUpTokenModel)init;
- (void)dealloc;
- (void)didUpdateInStoreTopUpToken:(id)a3 forAccountIdentifier:(id)a4;
@end

@implementation InStoreTopUpTokenModel

- (void)dealloc
{
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9PassKitUI22InStoreTopUpTokenModel_accountService);
  if (v3) {
    objc_msgSend(v3, sel_unregisterObserver_, self);
  }
  else {
    v4 = self;
  }
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for InStoreTopUpTokenModel();
  [(InStoreTopUpTokenModel *)&v5 dealloc];
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC9PassKitUI22InStoreTopUpTokenModel__state;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E94B3CE0);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  objc_super v5 = (char *)self + OBJC_IVAR____TtC9PassKitUI22InStoreTopUpTokenModel__displayableError;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E94A59A0);
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);

  swift_unknownObjectRelease();
  v7 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9PassKitUI22InStoreTopUpTokenModel_paymentWebService);
}

- (void)didUpdateInStoreTopUpToken:(id)a3 forAccountIdentifier:(id)a4
{
  if (a4)
  {
    uint64_t v6 = sub_1A03B4988();
    uint64_t v8 = v7;
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v8 = 0;
  }
  id v9 = a3;
  v10 = self;
  sub_19FBD8F80(a3, v6, v8);

  swift_bridgeObjectRelease();
}

- (_TtC9PassKitUI22InStoreTopUpTokenModel)init
{
  result = (_TtC9PassKitUI22InStoreTopUpTokenModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end