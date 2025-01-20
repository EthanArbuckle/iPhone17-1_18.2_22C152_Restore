@interface PreviewDebugOverlay.OverlayView
- (CGSize)intrinsicContentSize;
- (_TtCC19PreviewsOSSupportUI19PreviewDebugOverlayP33_2167D653BE9BA0FB6EEBD3EBB5DDB07011OverlayView)init;
- (_TtCC19PreviewsOSSupportUI19PreviewDebugOverlayP33_2167D653BE9BA0FB6EEBD3EBB5DDB07011OverlayView)initWithCoder:(id)a3;
- (_TtCC19PreviewsOSSupportUI19PreviewDebugOverlayP33_2167D653BE9BA0FB6EEBD3EBB5DDB07011OverlayView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation PreviewDebugOverlay.OverlayView

- (_TtCC19PreviewsOSSupportUI19PreviewDebugOverlayP33_2167D653BE9BA0FB6EEBD3EBB5DDB07011OverlayView)init
{
  return (_TtCC19PreviewsOSSupportUI19PreviewDebugOverlayP33_2167D653BE9BA0FB6EEBD3EBB5DDB07011OverlayView *)sub_23B5343C0();
}

- (_TtCC19PreviewsOSSupportUI19PreviewDebugOverlayP33_2167D653BE9BA0FB6EEBD3EBB5DDB07011OverlayView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtCC19PreviewsOSSupportUI19PreviewDebugOverlayP33_2167D653BE9BA0FB6EEBD3EBB5DDB07011OverlayView_labelPadding) = (Class)0x4010000000000000;
  id v4 = a3;

  result = (_TtCC19PreviewsOSSupportUI19PreviewDebugOverlayP33_2167D653BE9BA0FB6EEBD3EBB5DDB07011OverlayView *)sub_23B5525C0();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for PreviewDebugOverlay.OverlayView();
  v2 = (char *)v4.receiver;
  [(PreviewDebugOverlay.OverlayView *)&v4 layoutSubviews];
  v3 = *(void **)&v2[OBJC_IVAR____TtCC19PreviewsOSSupportUI19PreviewDebugOverlayP33_2167D653BE9BA0FB6EEBD3EBB5DDB07011OverlayView_label];
  objc_msgSend(v2, sel_bounds, v4.receiver, v4.super_class);
  CGRect v6 = CGRectInset(v5, *(CGFloat *)&v2[OBJC_IVAR____TtCC19PreviewsOSSupportUI19PreviewDebugOverlayP33_2167D653BE9BA0FB6EEBD3EBB5DDB07011OverlayView_labelPadding], 0.0);
  objc_msgSend(v3, sel_setFrame_, v6.origin.x, v6.origin.y, v6.size.width, v6.size.height);
}

- (CGSize)intrinsicContentSize
{
  v2 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtCC19PreviewsOSSupportUI19PreviewDebugOverlayP33_2167D653BE9BA0FB6EEBD3EBB5DDB07011OverlayView_label);
  v3 = self;
  objc_msgSend(v2, sel_intrinsicContentSize);
  double v5 = v4
     + *(double *)((char *)&v3->super.super.super.isa
                 + OBJC_IVAR____TtCC19PreviewsOSSupportUI19PreviewDebugOverlayP33_2167D653BE9BA0FB6EEBD3EBB5DDB07011OverlayView_labelPadding);
  objc_msgSend(v2, sel_intrinsicContentSize);
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (_TtCC19PreviewsOSSupportUI19PreviewDebugOverlayP33_2167D653BE9BA0FB6EEBD3EBB5DDB07011OverlayView)initWithFrame:(CGRect)a3
{
  CGSize result = (_TtCC19PreviewsOSSupportUI19PreviewDebugOverlayP33_2167D653BE9BA0FB6EEBD3EBB5DDB07011OverlayView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC19PreviewsOSSupportUI19PreviewDebugOverlayP33_2167D653BE9BA0FB6EEBD3EBB5DDB07011OverlayView_label));
}

@end