@interface ReadingLoupeOverlayView
- (_TtC8BookEPUB23ReadingLoupeOverlayView)initWithCoder:(id)a3;
- (_TtC8BookEPUB23ReadingLoupeOverlayView)initWithFrame:(CGRect)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)dealloc;
@end

@implementation ReadingLoupeOverlayView

- (_TtC8BookEPUB23ReadingLoupeOverlayView)initWithFrame:(CGRect)a3
{
  return (_TtC8BookEPUB23ReadingLoupeOverlayView *)ReadingLoupeOverlayView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8BookEPUB23ReadingLoupeOverlayView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_189ECC();
}

- (void)dealloc
{
  v2 = self;
  ReadingLoupeOverlayView.__deallocating_deinit();
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  sub_4F924((uint64_t)self + OBJC_IVAR____TtC8BookEPUB23ReadingLoupeOverlayView_readingSettingsProvider);
  swift_release();
  swift_release();
  sub_4F924((uint64_t)self + OBJC_IVAR____TtC8BookEPUB23ReadingLoupeOverlayView_bookLayoutModeProvider);
  swift_release();
  sub_18A034(*(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8BookEPUB23ReadingLoupeOverlayView_currentTheme), *(void *)&self->readingLoupeView[OBJC_IVAR____TtC8BookEPUB23ReadingLoupeOverlayView_currentTheme]);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8BookEPUB23ReadingLoupeOverlayView_topGradientLayer));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8BookEPUB23ReadingLoupeOverlayView_bottomGradientLayer);
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    v9 = (void *)Strong;
    id v10 = a4;
    v11 = self;
    [v9 frame];
    v15.CGFloat x = x;
    v15.CGFloat y = y;
    BOOL v12 = CGRectContainsPoint(v16, v15);

    if (!v12) {
      goto LABEL_5;
    }
  }
  v11 = 0;
LABEL_5:

  return v11;
}

@end