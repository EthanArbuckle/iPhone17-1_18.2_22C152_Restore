@interface BannerHeaderView
- (_TtC7MusicUIP33_250C7DB8BF276A87404B342AF809748C16BannerHeaderView)initWithContentView:(id)a3;
- (void)didMoveToWindow;
@end

@implementation BannerHeaderView

- (void)didMoveToWindow
{
  v2 = self;
  sub_229E692B0();
}

- (_TtC7MusicUIP33_250C7DB8BF276A87404B342AF809748C16BannerHeaderView)initWithContentView:(id)a3
{
  id v3 = a3;
  sub_229E69B20();
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  swift_bridgeObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7MusicUIP33_250C7DB8BF276A87404B342AF809748C16BannerHeaderView_hostingView));
  id v3 = (char *)self + OBJC_IVAR____TtC7MusicUIP33_250C7DB8BF276A87404B342AF809748C16BannerHeaderView_metricsContext;
  uint64_t v4 = sub_22A16FD40();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

@end