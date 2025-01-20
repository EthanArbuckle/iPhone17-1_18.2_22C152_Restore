@interface RatingControlViewController.RatingControl
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtCC5Music27RatingControlViewControllerP33_74EAAB04F169518A744BEF384CEBD97713RatingControl)initWithCoder:(id)a3;
- (_TtCC5Music27RatingControlViewControllerP33_74EAAB04F169518A744BEF384CEBD97713RatingControl)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)panGestureRecognized:(void *)a3;
@end

@implementation RatingControlViewController.RatingControl

- (_TtCC5Music27RatingControlViewControllerP33_74EAAB04F169518A744BEF384CEBD97713RatingControl)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtCC5Music27RatingControlViewControllerP33_74EAAB04F169518A744BEF384CEBD97713RatingControl_starButtons) = (Class)_swiftEmptyArrayStorage;
  id v4 = a3;

  result = (_TtCC5Music27RatingControlViewControllerP33_74EAAB04F169518A744BEF384CEBD97713RatingControl *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1005498E4();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  v3 = self;
  double v4 = sub_10054AA98();
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  id v7 = a4;
  double v8 = self;
  [(RatingControlViewController.RatingControl *)v8 bounds];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  if (qword_101098358 != -1) {
    swift_once();
  }
  v20.origin.CGFloat x = sub_10003B5C8(v10, v12, v14, v16, *(double *)&qword_1010AE118, unk_1010AE120);
  v19.CGFloat x = x;
  v19.CGFloat y = y;
  BOOL v17 = CGRectContainsPoint(v20, v19);

  return v17;
}

- (void)panGestureRecognized:(void *)a3
{
  id v4 = a3;
  id v6 = a1;
  if ([v4 state] == (id)3)
  {
    [v4 locationInView:v6];
    sub_10054A314(v5);
  }
}

- (_TtCC5Music27RatingControlViewControllerP33_74EAAB04F169518A744BEF384CEBD97713RatingControl)initWithFrame:(CGRect)a3
{
  CGSize result = (_TtCC5Music27RatingControlViewControllerP33_74EAAB04F169518A744BEF384CEBD97713RatingControl *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCC5Music27RatingControlViewControllerP33_74EAAB04F169518A744BEF384CEBD97713RatingControl_panGestureRecognizer));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCC5Music27RatingControlViewControllerP33_74EAAB04F169518A744BEF384CEBD97713RatingControl_tapGestureRecognizer));

  swift_bridgeObjectRelease();
}

@end