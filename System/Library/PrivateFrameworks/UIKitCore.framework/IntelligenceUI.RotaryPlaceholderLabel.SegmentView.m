@interface IntelligenceUI.RotaryPlaceholderLabel.SegmentView
- (_TtCCO5UIKit14IntelligenceUI22RotaryPlaceholderLabelP33_6F0AB2EDC77A7506E9CF9A7668188D4F11SegmentView)initWithCoder:(id)a3;
- (_TtCCO5UIKit14IntelligenceUI22RotaryPlaceholderLabelP33_6F0AB2EDC77A7506E9CF9A7668188D4F11SegmentView)initWithFrame:(CGRect)a3;
- (void)didMoveToWindow;
- (void)drawRect:(CGRect)a3;
@end

@implementation IntelligenceUI.RotaryPlaceholderLabel.SegmentView

- (_TtCCO5UIKit14IntelligenceUI22RotaryPlaceholderLabelP33_6F0AB2EDC77A7506E9CF9A7668188D4F11SegmentView)initWithCoder:(id)a3
{
  result = (_TtCCO5UIKit14IntelligenceUI22RotaryPlaceholderLabelP33_6F0AB2EDC77A7506E9CF9A7668188D4F11SegmentView *)sub_186A1F60C();
  __break(1u);
  return result;
}

- (void)didMoveToWindow
{
  v7.receiver = self;
  v7.super_class = (Class)_s22RotaryPlaceholderLabelC11SegmentViewCMa(0);
  id v2 = v7.receiver;
  [(UIView *)&v7 didMoveToWindow];
  id v3 = objc_msgSend(v2, sel_layer, v7.receiver, v7.super_class);
  id v4 = objc_msgSend(v2, sel_traitCollection);
  objc_msgSend(v4, sel_displayScale);
  double v6 = v5;

  objc_msgSend(v3, sel_setContentsScale_, v6);
}

- (void)drawRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v10 = self;
  objc_super v7 = UIGraphicsGetCurrentContext();
  if (v7)
  {
    v8 = v7;
    v12.origin.double x = x;
    v12.origin.double y = y;
    v12.size.CGFloat width = width;
    v12.size.CGFloat height = height;
    CGContextClearRect(v7, v12);
    objc_msgSend(*(id *)((char *)&v10->super.super.super.isa+ OBJC_IVAR____TtCCO5UIKit14IntelligenceUI22RotaryPlaceholderLabelP33_6F0AB2EDC77A7506E9CF9A7668188D4F11SegmentView_fragment), sel_drawAtPoint_inContext_, v8, x, y);

    v9 = (_TtCCO5UIKit14IntelligenceUI22RotaryPlaceholderLabelP33_6F0AB2EDC77A7506E9CF9A7668188D4F11SegmentView *)v8;
  }
  else
  {
    v9 = v10;
  }
}

- (_TtCCO5UIKit14IntelligenceUI22RotaryPlaceholderLabelP33_6F0AB2EDC77A7506E9CF9A7668188D4F11SegmentView)initWithFrame:(CGRect)a3
{
  result = (_TtCCO5UIKit14IntelligenceUI22RotaryPlaceholderLabelP33_6F0AB2EDC77A7506E9CF9A7668188D4F11SegmentView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_185A972B8((uint64_t)self+ OBJC_IVAR____TtCCO5UIKit14IntelligenceUI22RotaryPlaceholderLabelP33_6F0AB2EDC77A7506E9CF9A7668188D4F11SegmentView_segment, _s22RotaryPlaceholderLabelC11TextSegmentVMa);
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtCCO5UIKit14IntelligenceUI22RotaryPlaceholderLabelP33_6F0AB2EDC77A7506E9CF9A7668188D4F11SegmentView_fragment);
}

@end