@interface ExtensionsObserver.QueryObserver
- (_TtCC8Settings18ExtensionsObserverP33_8B62C04EFBF9C0BB57B71BCEDA4DE89713QueryObserver)init;
- (void)observerDidUpdate:(id)a3;
@end

@implementation ExtensionsObserver.QueryObserver

- (void)observerDidUpdate:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1E4D5DF74(v4);
}

- (_TtCC8Settings18ExtensionsObserverP33_8B62C04EFBF9C0BB57B71BCEDA4DE89713QueryObserver)init
{
  result = (_TtCC8Settings18ExtensionsObserverP33_8B62C04EFBF9C0BB57B71BCEDA4DE89713QueryObserver *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v2 = (char *)self
     + OBJC_IVAR____TtCC8Settings18ExtensionsObserverP33_8B62C04EFBF9C0BB57B71BCEDA4DE89713QueryObserver_continuation;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAE93580);
  id v4 = *(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8);
  v4(v2, v3);
}

@end