@interface AppEventObserver
- (_TtC11SessionCore16AppEventObserver)init;
- (void)applicationsDidInstall:(id)a3;
- (void)applicationsDidUninstall:(id)a3;
- (void)dealloc;
@end

@implementation AppEventObserver

- (void)dealloc
{
  sub_1C7CB9440((char *)self, (uint64_t)a2, &OBJC_IVAR____TtC11SessionCore16AppEventObserver_applicationWorkspace, (SEL *)&selRef_removeObserver_, v2, (uint64_t (*)(uint64_t))type metadata accessor for AppEventObserver);
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC11SessionCore16AppEventObserver_knownClientStore);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
}

- (_TtC11SessionCore16AppEventObserver)init
{
  result = (_TtC11SessionCore16AppEventObserver *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)applicationsDidUninstall:(id)a3
{
}

- (void)applicationsDidInstall:(id)a3
{
}

@end