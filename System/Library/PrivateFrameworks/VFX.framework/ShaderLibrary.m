@interface ShaderLibrary
- (_TtC3VFX13ShaderLibrary)init;
- (void)dealloc;
@end

@implementation ShaderLibrary

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  id v2 = v3.receiver;
  [(ShaderLibrary *)&v3 dealloc];
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  objc_super v3 = (char *)self + OBJC_IVAR____TtC3VFX13ShaderLibrary_libraryURL;
  uint64_t v4 = sub_1B6E30F48();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();

  swift_release();
}

- (_TtC3VFX13ShaderLibrary)init
{
  result = (_TtC3VFX13ShaderLibrary *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end