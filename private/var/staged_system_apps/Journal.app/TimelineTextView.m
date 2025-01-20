@interface TimelineTextView
- (BOOL)_shouldStartDataDetectors;
- (CGSize)intrinsicContentSize;
- (_TtC7Journal16TimelineTextView)initWithCoder:(id)a3;
- (_TtC7Journal16TimelineTextView)initWithFrame:(CGRect)a3 textContainer:(id)a4;
- (id)textView:(id)a3 primaryActionForTextItem:(id)a4 defaultAction:(id)a5;
@end

@implementation TimelineTextView

- (_TtC7Journal16TimelineTextView)initWithFrame:(CGRect)a3 textContainer:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  return (_TtC7Journal16TimelineTextView *)sub_10012CBE0(a4, x, y, width, height);
}

- (_TtC7Journal16TimelineTextView)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.super.super.super.isa
  + OBJC_IVAR____TtC7Journal16TimelineTextView_isAlwaysTruncated) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC7Journal16TimelineTextView____lazy_storage___truncationFade) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC7Journal16TimelineTextView____lazy_storage___truncationIcon) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC7Journal16TimelineTextView_truncationFadeLength) = (Class)0x4044000000000000;
  id v4 = a3;

  result = (_TtC7Journal16TimelineTextView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (CGSize)intrinsicContentSize
{
  ObjectType = (objc_class *)swift_getObjectType();
  id v4 = self;
  id v5 = [(TimelineTextView *)v4 textStorage];
  id v6 = [v5 length];

  if (v6)
  {
    v13.receiver = v4;
    v13.super_class = ObjectType;
    [(CanvasTextView *)&v13 intrinsicContentSize];
    CGFloat v8 = v7;
    double v10 = v9;
  }
  else
  {
    CGFloat v8 = UIViewNoIntrinsicMetric;

    double v10 = 0.0;
  }
  double v11 = v8;
  double v12 = v10;
  result.double height = v12;
  result.double width = v11;
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7Journal16TimelineTextView____lazy_storage___truncationFade));
  v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC7Journal16TimelineTextView____lazy_storage___truncationIcon);
}

- (BOOL)_shouldStartDataDetectors
{
  return [(TimelineTextView *)self dataDetectorTypes] != 0;
}

- (id)textView:(id)a3 primaryActionForTextItem:(id)a4 defaultAction:(id)a5
{
  return a5;
}

@end