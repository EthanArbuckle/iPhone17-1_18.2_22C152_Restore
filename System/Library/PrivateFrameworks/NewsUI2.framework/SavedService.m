@interface SavedService
- (_TtC7NewsUI212SavedService)init;
- (void)dealloc;
- (void)readingList:(id)a3 didAddArticles:(id)a4 removeArticles:(id)a5 eventInitiationLevel:(int64_t)a6;
@end

@implementation SavedService

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7NewsUI212SavedService_readingList);
  v5 = self;
  objc_msgSend(v4, sel_removeObserver_, v5);
  v6.receiver = v5;
  v6.super_class = ObjectType;
  [(SavedService *)&v6 dealloc];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI212SavedService_headlineModelFactory);
  v3 = (char *)self + OBJC_IVAR____TtC7NewsUI212SavedService_headlineService;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v3);
}

- (_TtC7NewsUI212SavedService)init
{
  result = (_TtC7NewsUI212SavedService *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)readingList:(id)a3 didAddArticles:(id)a4 removeArticles:(id)a5 eventInitiationLevel:(int64_t)a6
{
  uint64_t v8 = sub_1DFDFE220();
  uint64_t v9 = sub_1DFDFE220();
  id v10 = a3;
  v11 = self;
  sub_1DF046E5C(v8, v9);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end