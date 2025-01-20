@interface FullScreenMusicView
- (_TtC7Journal19FullScreenMusicView)initWithCoder:(id)a3;
- (_TtC7Journal19FullScreenMusicView)initWithFrame:(CGRect)a3;
- (void)playButtonTapped;
@end

@implementation FullScreenMusicView

- (void)playButtonTapped
{
  uint64_t v3 = sub_100010218(&qword_1007FA1D0);
  __chkstk_darwin(v3 - 8);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  type metadata accessor for MainActor();
  v7 = self;
  uint64_t v8 = static MainActor.shared.getter();
  v9 = (void *)swift_allocObject();
  v9[2] = v8;
  v9[3] = &protocol witness table for MainActor;
  v9[4] = v7;
  sub_100328A60((uint64_t)v5, (uint64_t)&unk_10080F758, (uint64_t)v9);
  swift_release();
}

- (_TtC7Journal19FullScreenMusicView)initWithFrame:(CGRect)a3
{
  return (_TtC7Journal19FullScreenMusicView *)sub_1004DC02C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC7Journal19FullScreenMusicView)initWithCoder:(id)a3
{
  return (_TtC7Journal19FullScreenMusicView *)sub_1004DC260(a3);
}

- (void).cxx_destruct
{
  uint64_t v3 = (char *)self + OBJC_IVAR____TtC7Journal19FullScreenMusicView_playConfig;
  uint64_t v4 = type metadata accessor for UIButton.Configuration();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
  v5((char *)self + OBJC_IVAR____TtC7Journal19FullScreenMusicView_pauseConfig, v4);

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Journal19FullScreenMusicView_backgroundView));
  uint64_t v6 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7Journal19FullScreenMusicView_dropShadowView);
}

@end