@interface LegacyMailAccountCreator
- (_TtC19iCloudMailAccountUI24LegacyMailAccountCreator)init;
- (id)parentViewControllerForObjectModel:(id)a3;
- (id)sessionConfigurationForLoader:(id)a3;
- (int64_t)supportedInterfaceOrientationsForObjectModel:(id)a3 page:(id)a4;
- (void)loader:(id)a3 didReceiveHTTPResponse:(id)a4 forRequest:(id)a5;
- (void)loader:(id)a3 receivedObjectModel:(id)a4 topActionSignal:(id)a5;
- (void)objectModel:(id)a3 pressedButton:(id)a4 attributes:(id)a5;
- (void)objectModel:(id)a3 pressedLink:(id)a4 httpMethod:(id)a5;
@end

@implementation LegacyMailAccountCreator

- (_TtC19iCloudMailAccountUI24LegacyMailAccountCreator)init
{
  result = (_TtC19iCloudMailAccountUI24LegacyMailAccountCreator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19iCloudMailAccountUI24LegacyMailAccountCreator_presenter));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19iCloudMailAccountUI24LegacyMailAccountCreator_appleAccount));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19iCloudMailAccountUI24LegacyMailAccountCreator_accountStore));
  sub_262947914(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC19iCloudMailAccountUI24LegacyMailAccountCreator_completionHandler));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19iCloudMailAccountUI24LegacyMailAccountCreator____lazy_storage___navigationController));
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC19iCloudMailAccountUI24LegacyMailAccountCreator____lazy_storage___ruiLoader);
}

- (void)loader:(id)a3 didReceiveHTTPResponse:(id)a4 forRequest:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A980AC8);
  MEMORY[0x270FA5388](v9 - 8);
  v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a5)
  {
    sub_26297BDE0();
    uint64_t v12 = sub_26297BE10();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v11, 0, 1, v12);
  }
  else
  {
    uint64_t v13 = sub_26297BE10();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v11, 1, 1, v13);
  }
  id v14 = a3;
  id v15 = a4;
  v16 = self;
  sub_262977904(a4, (uint64_t)v11);

  sub_262947654((uint64_t)v11, &qword_26A980AC8);
}

- (id)sessionConfigurationForLoader:(id)a3
{
  v5 = self;
  id v6 = a3;
  v7 = self;
  id v8 = objc_msgSend(v5, sel_defaultSessionConfiguration);
  id v9 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F29120]), sel_init);
  objc_msgSend(v8, sel_set_appleIDContext_, v9);

  return v8;
}

- (void)loader:(id)a3 receivedObjectModel:(id)a4 topActionSignal:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  sub_262977FF0(a4, a5);
}

- (int64_t)supportedInterfaceOrientationsForObjectModel:(id)a3 page:(id)a4
{
  return 30;
}

- (void)objectModel:(id)a3 pressedLink:(id)a4 httpMethod:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A980AC0);
  MEMORY[0x270FA5388](v9 - 8);
  v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4)
  {
    sub_26297BF00();
    uint64_t v12 = sub_26297BF30();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v11, 0, 1, v12);
  }
  else
  {
    uint64_t v13 = sub_26297BF30();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v11, 1, 1, v13);
  }
  if (a5)
  {
    uint64_t v14 = sub_26297CA60();
    a5 = v15;
  }
  else
  {
    uint64_t v14 = 0;
  }
  id v16 = a3;
  uint64_t v17 = self;
  sub_262976FF8(a3, (uint64_t)v11, v14, (uint64_t)a5);

  swift_bridgeObjectRelease();
  sub_262947654((uint64_t)v11, &qword_26A980AC0);
}

- (void)objectModel:(id)a3 pressedButton:(id)a4 attributes:(id)a5
{
  if (a4)
  {
    uint64_t v8 = sub_26297CA60();
    uint64_t v10 = v9;
    if (!a5) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  uint64_t v8 = 0;
  uint64_t v10 = 0;
  if (a5) {
LABEL_3:
  }
    sub_26297CA20();
LABEL_4:
  id v11 = a3;
  uint64_t v12 = self;
  sub_26297874C(v8, v10);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (id)parentViewControllerForObjectModel:(id)a3
{
  id v4 = a3;
  v5 = self;
  id v6 = sub_262973C70();

  return v6;
}

@end