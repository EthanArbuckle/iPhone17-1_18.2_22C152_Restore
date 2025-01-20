@interface WelcomeModule
- (_TtC8StocksUI13WelcomeModule)init;
- (id)createViewController;
@end

@implementation WelcomeModule

- (id)createViewController
{
  uint64_t v3 = sub_20A8C7770();
  uint64_t v4 = *(void *)(v3 - 8);
  double v5 = MEMORY[0x270FA5388](v3);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t, double))(v4 + 104))(v7, *MEMORY[0x263F7A6E8], v3, v5);
  v8 = self;
  sub_20A8C4890();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
  __swift_project_boxed_opaque_existential_1((Class *)((char *)&v8->super.isa + OBJC_IVAR____TtC8StocksUI13WelcomeModule_resolver), *(void *)&v8->resolver[OBJC_IVAR____TtC8StocksUI13WelcomeModule_resolver + 16]);
  type metadata accessor for WelcomeViewController();
  swift_retain();
  v9 = (void *)sub_20A8C5B80();
  id result = (id)swift_release();
  if (v9)
  {

    swift_release();
    return v9;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (_TtC8StocksUI13WelcomeModule)init
{
  id result = (_TtC8StocksUI13WelcomeModule *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC8StocksUI13WelcomeModule_resolver);

  swift_release();
}

@end