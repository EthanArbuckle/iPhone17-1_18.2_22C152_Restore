@interface CRLIndeterminateRoundSpinnerView
- (_TtC8Freeform32CRLIndeterminateRoundSpinnerView)initWithCoder:(id)a3;
- (_TtC8Freeform32CRLIndeterminateRoundSpinnerView)initWithFrame:(CGRect)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
@end

@implementation CRLIndeterminateRoundSpinnerView

- (_TtC8Freeform32CRLIndeterminateRoundSpinnerView)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.isa
  + OBJC_IVAR____TtC8Freeform32CRLIndeterminateRoundSpinnerView_wantsLinkViewSublayerTransformAdjustedHitTestFrame) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC8Freeform32CRLIndeterminateRoundSpinnerView_backgroundLayer) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC8Freeform32CRLIndeterminateRoundSpinnerView_spinnerLayer) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8Freeform32CRLIndeterminateRoundSpinnerView_lineWidth) = (Class)0x4000000000000000;
  id v4 = a3;

  result = (_TtC8Freeform32CRLIndeterminateRoundSpinnerView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  id v8 = a4;
  v9 = self;
  id v10 = sub_1009A0CD8((uint64_t)a4, x, y);

  return v10;
}

- (_TtC8Freeform32CRLIndeterminateRoundSpinnerView)initWithFrame:(CGRect)a3
{
  result = (_TtC8Freeform32CRLIndeterminateRoundSpinnerView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform32CRLIndeterminateRoundSpinnerView_backgroundLayer));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8Freeform32CRLIndeterminateRoundSpinnerView_spinnerLayer);
}

@end