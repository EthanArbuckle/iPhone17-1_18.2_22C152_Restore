@interface JSMusicVideoDetailViewController
- (_TtC16MusicApplication32JSMusicVideoDetailViewController)initWithCoder:(id)a3;
- (_TtC16MusicApplication32JSMusicVideoDetailViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation JSMusicVideoDetailViewController

- (_TtC16MusicApplication32JSMusicVideoDetailViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC16MusicApplication32JSMusicVideoDetailViewController_detailHeaderLockupView) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC16MusicApplication32JSMusicVideoDetailViewController_contentItem) = 0;
  id v4 = a3;

  result = (_TtC16MusicApplication32JSMusicVideoDetailViewController *)sub_AB8280();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_60B40();
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_612DC();
}

- (_TtC16MusicApplication32JSMusicVideoDetailViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC16MusicApplication32JSMusicVideoDetailViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication32JSMusicVideoDetailViewController_musicVideoViewModel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication32JSMusicVideoDetailViewController_detailHeaderLockupView));
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC16MusicApplication32JSMusicVideoDetailViewController_contentItem);
}

@end