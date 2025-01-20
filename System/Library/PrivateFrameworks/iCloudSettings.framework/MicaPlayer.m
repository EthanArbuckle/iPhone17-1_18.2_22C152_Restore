@interface MicaPlayer
- (_TtC14iCloudSettings10MicaPlayer)init;
- (id)copyWithZone:(void *)a3;
- (void)dealloc;
@end

@implementation MicaPlayer

- (void)dealloc
{
  uint64_t v3 = OBJC_IVAR____TtC14iCloudSettings10MicaPlayer_playbackTimer;
  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14iCloudSettings10MicaPlayer_playbackTimer);
  v5 = self;
  if (v4)
  {
    objc_msgSend(v4, sel_invalidate);
    v6 = *(Class *)((char *)&self->super.isa + v3);
    *(Class *)((char *)&self->super.isa + v3) = 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for MicaPlayer();
  [(MicaPlayer *)&v7 dealloc];
}

- (void).cxx_destruct
{
  uint64_t v3 = (char *)self + OBJC_IVAR____TtC14iCloudSettings10MicaPlayer_url;
  uint64_t v4 = sub_262B02A38();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  sub_262A4A318((uint64_t)self + OBJC_IVAR____TtC14iCloudSettings10MicaPlayer_delegate);
  swift_bridgeObjectRelease();
  v5 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14iCloudSettings10MicaPlayer_playbackTimer);
}

- (id)copyWithZone:(void *)a3
{
  uint64_t v4 = sub_262B02A38();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  objc_super v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = self;
  sub_262ACFA04();
  v10 = v9;
  uint64_t v11 = sub_262ABA288(*(uint64_t *)((char *)&v8->super.isa + OBJC_IVAR____TtC14iCloudSettings10MicaPlayer_publishedObjects));
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, (uint64_t)v8 + OBJC_IVAR____TtC14iCloudSettings10MicaPlayer_url, v4);
  id v12 = objc_allocWithZone((Class)type metadata accessor for MicaPlayer());
  id v13 = sub_262AB9AF8((uint64_t)v7, v10, v11);

  return v13;
}

- (_TtC14iCloudSettings10MicaPlayer)init
{
  result = (_TtC14iCloudSettings10MicaPlayer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end