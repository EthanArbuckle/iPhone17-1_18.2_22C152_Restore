@interface MultiPlayerContainerView
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (_TtC8VideosUI24MultiPlayerContainerView)initWithCoder:(id)a3;
- (_TtC8VideosUI24MultiPlayerContainerView)initWithFrame:(CGRect)a3;
- (void)dealloc;
- (void)layoutSubviews;
- (void)onHoverWithGesture:(id)a3;
- (void)singlePressWithGesture:(id)a3;
@end

@implementation MultiPlayerContainerView

- (void)dealloc
{
  v2 = self;
  sub_1E3638B1C();
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI24MultiPlayerContainerView____lazy_storage___controlsView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI24MultiPlayerContainerView____lazy_storage___volumeGradient));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI24MultiPlayerContainerView____lazy_storage___volumeIndicator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI24MultiPlayerContainerView____lazy_storage___dimmingView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI24MultiPlayerContainerView_snapshotView));
  sub_1E2C5FB90(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC8VideosUI24MultiPlayerContainerView_onSelect));
  sub_1E2C5FB90(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC8VideosUI24MultiPlayerContainerView_closeHandler));
  sub_1E2C5FB90(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC8VideosUI24MultiPlayerContainerView_fullscreenHandler));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI24MultiPlayerContainerView_playerViewController));
  swift_release();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI24MultiPlayerContainerView____lazy_storage___singlePressGesture));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8VideosUI24MultiPlayerContainerView____lazy_storage___hoverGestureRecognizer);
}

- (void)onHoverWithGesture:(id)a3
{
  id v4 = a3;
  v5 = self;
  v6 = (void *)OUTLINED_FUNCTION_0_25();
  sub_1E36392A8(v6);
}

- (_TtC8VideosUI24MultiPlayerContainerView)initWithCoder:(id)a3
{
  return 0;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1E363B0AC();
}

- (void)singlePressWithGesture:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1E363B768();
}

- (_TtC8VideosUI24MultiPlayerContainerView)initWithFrame:(CGRect)a3
{
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  v5 = self;
  LOBYTE(self) = sub_1E363BB30(v4);

  return self & 1;
}

@end