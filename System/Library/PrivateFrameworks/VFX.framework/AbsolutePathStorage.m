@interface AbsolutePathStorage
- (_TtC3VFX19AbsolutePathStorage)init;
@end

@implementation AbsolutePathStorage

- (_TtC3VFX19AbsolutePathStorage)init
{
  result = (_TtC3VFX19AbsolutePathStorage *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC3VFX19AbsolutePathStorage_absoluteURL;
  uint64_t v4 = sub_1B6E30F48();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  v5 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC3VFX19AbsolutePathStorage_pathResolver);
}

@end