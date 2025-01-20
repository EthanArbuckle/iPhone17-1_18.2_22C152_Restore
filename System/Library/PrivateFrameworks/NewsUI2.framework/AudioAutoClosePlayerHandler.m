@interface AudioAutoClosePlayerHandler
- (_TtC7NewsUI227AudioAutoClosePlayerHandler)init;
- (void)sessionDidDisconnect:(id)a3;
@end

@implementation AudioAutoClosePlayerHandler

- (_TtC7NewsUI227AudioAutoClosePlayerHandler)init
{
  result = (_TtC7NewsUI227AudioAutoClosePlayerHandler *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI227AudioAutoClosePlayerHandler_paidBundleConfigManager);

  v3 = (uint64_t (*)(uint64_t))MEMORY[0x1E4F27928];
  sub_1DEA0949C((uint64_t)self + OBJC_IVAR____TtC7NewsUI227AudioAutoClosePlayerHandler_idledAt, (unint64_t *)&qword_1EBAA6DB0, MEMORY[0x1E4F27928]);
  sub_1DEA0949C((uint64_t)self + OBJC_IVAR____TtC7NewsUI227AudioAutoClosePlayerHandler_autoCloseAt, (unint64_t *)&qword_1EBAA6DB0, v3);

  swift_unknownObjectRelease();
  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7NewsUI227AudioAutoClosePlayerHandler_logDateFormatter);
}

- (void)sessionDidDisconnect:(id)a3
{
  sub_1DE9B646C();
  id v5 = a3;
  v6 = self;
  v7 = (void *)sub_1DFDFF620();
  sub_1DFDFEA60();
  sub_1DFDF00C0();

  *(void *)(swift_allocObject() + 16) = v6;
  v8 = v6;
  sub_1DFDEE310();

  swift_release();
}

@end