@interface COSWatchCursiveTextView
- (_TtC6Bridge23COSWatchCursiveTextView)initWithCoder:(id)a3;
- (_TtC6Bridge23COSWatchCursiveTextView)initWithFrame:(CGRect)a3;
- (void)configure;
- (void)layoutSubviews;
@end

@implementation COSWatchCursiveTextView

- (_TtC6Bridge23COSWatchCursiveTextView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC6Bridge23COSWatchCursiveTextView_animationTimer) = 0;
  uint64_t v4 = OBJC_IVAR____TtC6Bridge23COSWatchCursiveTextView_animationStartTime;
  id v5 = a3;
  *(CFAbsoluteTime *)((char *)&self->super.super.super.isa + v4) = CFAbsoluteTimeGetCurrent();

  result = (_TtC6Bridge23COSWatchCursiveTextView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)configure
{
  v2 = self;
  sub_10014AD08();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_10014B4D0();
}

- (_TtC6Bridge23COSWatchCursiveTextView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  sub_1001338A0((uint64_t)self + OBJC_IVAR____TtC6Bridge23COSWatchCursiveTextView_languageURL);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6Bridge23COSWatchCursiveTextView_cursiveTextView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6Bridge23COSWatchCursiveTextView_visualEffectView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6Bridge23COSWatchCursiveTextView_backgroundImageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6Bridge23COSWatchCursiveTextView_screenMaskView));
  v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC6Bridge23COSWatchCursiveTextView_animationTimer);
}

@end