@interface LabelsStrip
- (CGSize)intrinsicContentSize;
- (_TtC7Measure11LabelsStrip)initWithCoder:(id)a3;
- (_TtC7Measure11LabelsStrip)initWithFrame:(CGRect)a3;
@end

@implementation LabelsStrip

- (_TtC7Measure11LabelsStrip)initWithFrame:(CGRect)a3
{
  return (_TtC7Measure11LabelsStrip *)sub_1000BED78(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC7Measure11LabelsStrip)initWithCoder:(id)a3
{
  return (_TtC7Measure11LabelsStrip *)sub_1000BF4C4(a3);
}

- (CGSize)intrinsicContentSize
{
  uint64_t v2 = qword_1004C27E0;
  v3 = self;
  if (v2 != -1) {
    swift_once();
  }
  uint64_t v4 = qword_1004F7DF8;
  id v5 = [self currentTraitCollection];
  id v6 = [v5 preferredContentSizeCategory];

  LOBYTE(v5) = UIContentSizeCategory.isAccessibilityCategory.getter();
  double v7 = 222.0;
  if ((v5 & 1) == 0) {
    double v7 = 88.0;
  }
  double v8 = *(double *)&v4;
  result.height = v7;
  result.width = v8;
  return result;
}

- (void).cxx_destruct
{
  v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7Measure11LabelsStrip_secondaryLabelStack);
}

@end