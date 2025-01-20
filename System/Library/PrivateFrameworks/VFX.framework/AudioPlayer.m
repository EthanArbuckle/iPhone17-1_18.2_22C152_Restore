@interface AudioPlayer
- (_TtC3VFX11AudioPlayer)init;
- (void)dealloc;
@end

@implementation AudioPlayer

- (void)dealloc
{
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC3VFX11AudioPlayer_url;
  uint64_t v4 = sub_1B6E30F48();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  v5 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC3VFX11AudioPlayer__lock);
}

- (_TtC3VFX11AudioPlayer)init
{
  result = (_TtC3VFX11AudioPlayer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end