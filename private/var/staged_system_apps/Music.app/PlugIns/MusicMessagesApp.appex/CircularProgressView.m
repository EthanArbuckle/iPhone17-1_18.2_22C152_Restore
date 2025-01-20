@interface CircularProgressView
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC11MusicCoreUI20CircularProgressView)initWithCoder:(id)a3;
- (_TtC11MusicCoreUI20CircularProgressView)initWithFrame:(CGRect)a3;
- (double)accessibilityProgressValue;
- (void)layoutSubviews;
- (void)tintColorDidChange;
@end

@implementation CircularProgressView

- (_TtC11MusicCoreUI20CircularProgressView)initWithCoder:(id)a3
{
  id v3 = a3;
  _s11MusicCoreUI20CircularProgressViewC5coderACSgSo7NSCoderC_tcfc_0();
}

- (void)tintColorDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  id v2 = v3.receiver;
  [(CircularProgressView *)&v3 tintColorDidChange];
  sub_1003C7684();
}

- (void)layoutSubviews
{
  id v2 = self;
  CircularProgressView.layoutSubviews()();
}

- (CGSize)intrinsicContentSize
{
  id v2 = (double *)((char *)self + OBJC_IVAR____TtC11MusicCoreUI20CircularProgressView_preferredSize);
  swift_beginAccess();
  double v3 = *v2;
  double v4 = v2[1];
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3 = (double *)((char *)self + OBJC_IVAR____TtC11MusicCoreUI20CircularProgressView_preferredSize);
  swift_beginAccess();
  double v4 = *v3;
  double v5 = v3[1];
  result.height = v5;
  result.width = v4;
  return result;
}

- (double)accessibilityProgressValue
{
  id v2 = (char *)self + OBJC_IVAR____TtC11MusicCoreUI20CircularProgressView__state;
  double result = 0.0;
  if ((self->preferredSize[OBJC_IVAR____TtC11MusicCoreUI20CircularProgressView__state + 2] & 1) == 0)
  {
    double v4 = *(double *)v2;
    __int16 v5 = *((_WORD *)v2 + 4);
    if ((v5 & 0x100) != 0)
    {
      if (!(*(void *)&v4 | v5)) {
        return 1.0;
      }
    }
    else
    {
      double result = v4;
      if (v5) {
        return 0.0;
      }
    }
  }
  return result;
}

- (_TtC11MusicCoreUI20CircularProgressView)initWithFrame:(CGRect)a3
{
  double result = (_TtC11MusicCoreUI20CircularProgressView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11MusicCoreUI20CircularProgressView_imageView));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11MusicCoreUI20CircularProgressView_progressLayer));
  double v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC11MusicCoreUI20CircularProgressView_trackLayer);
}

@end