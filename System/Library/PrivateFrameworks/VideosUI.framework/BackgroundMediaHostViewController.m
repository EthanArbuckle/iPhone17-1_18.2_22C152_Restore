@interface BackgroundMediaHostViewController
- (_TtC8VideosUI33BackgroundMediaHostViewController)initWithCoder:(id)a3;
- (_TtC8VideosUI33BackgroundMediaHostViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)vui_viewDidLayoutSubviews;
@end

@implementation BackgroundMediaHostViewController

- (_TtC8VideosUI33BackgroundMediaHostViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1E35BCF08();
}

- (void)vui_viewDidLayoutSubviews
{
  v2 = self;
  sub_1E35BD044();
}

- (_TtC8VideosUI33BackgroundMediaHostViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    sub_1E387C928();
  }
  id v5 = a4;
  sub_1E35BD468();
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI33BackgroundMediaHostViewController____lazy_storage___mediaController));
  swift_bridgeObjectRelease();
}

@end