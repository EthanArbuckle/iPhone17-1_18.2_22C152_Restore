@interface ConfigurationIntentHandler
- (_TtC25RemindersIntentsFramework26ConfigurationIntentHandler)init;
- (id)defaultListForConfiguration:(id)a3;
- (void)handleConfiguration:(id)a3 completion:(id)a4;
- (void)provideListOptionsCollectionForConfiguration:(id)a3 searchTerm:(id)a4 withCompletion:(id)a5;
- (void)provideListOptionsForConfiguration:(id)a3 searchTerm:(id)a4 withCompletion:(id)a5;
@end

@implementation ConfigurationIntentHandler

- (void)handleConfiguration:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  _Block_copy(v6);
  id v7 = a3;
  v8 = self;
  sub_25AF73374(v7, (uint64_t)v6);
  _Block_release(v6);
  _Block_release(v6);
}

- (void)provideListOptionsForConfiguration:(id)a3 searchTerm:(id)a4 withCompletion:(id)a5
{
  v8 = _Block_copy(a5);
  if (a4)
  {
    uint64_t v9 = sub_25AF79640();
    a4 = v10;
  }
  else
  {
    uint64_t v9 = 0;
  }
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v8;
  id v12 = a3;
  v13 = self;
  sub_25AF6EE78(v12, v9, (uint64_t)a4, (uint64_t)sub_25AF736B0, v11);

  swift_release();
  swift_bridgeObjectRelease();
}

- (void)provideListOptionsCollectionForConfiguration:(id)a3 searchTerm:(id)a4 withCompletion:(id)a5
{
  v8 = _Block_copy(a5);
  if (a4)
  {
    uint64_t v9 = sub_25AF79640();
    a4 = v10;
  }
  else
  {
    uint64_t v9 = 0;
  }
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v8;
  id v12 = a3;
  v13 = self;
  sub_25AF6EE78(v12, v9, (uint64_t)a4, (uint64_t)sub_25AF72B34, v11);

  swift_release();
  swift_bridgeObjectRelease();
}

- (id)defaultListForConfiguration:(id)a3
{
  id v4 = a3;
  v5 = self;
  id v6 = sub_25AF71C90(v4);

  return v6;
}

- (_TtC25RemindersIntentsFramework26ConfigurationIntentHandler)init
{
  result = (_TtC25RemindersIntentsFramework26ConfigurationIntentHandler *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC25RemindersIntentsFramework26ConfigurationIntentHandler_store));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC25RemindersIntentsFramework26ConfigurationIntentHandler_queue));
  v3 = (char *)self + OBJC_IVAR____TtC25RemindersIntentsFramework26ConfigurationIntentHandler_dataSource;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v3);
}

@end