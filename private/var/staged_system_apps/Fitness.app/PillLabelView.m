@interface PillLabelView
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC10FitnessAppP33_4EA4BC32C3BA0CE5667C98FF7F64C93913PillLabelView)initWithCoder:(id)a3;
- (_TtC10FitnessAppP33_4EA4BC32C3BA0CE5667C98FF7F64C93913PillLabelView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation PillLabelView

- (_TtC10FitnessAppP33_4EA4BC32C3BA0CE5667C98FF7F64C93913PillLabelView)initWithFrame:(CGRect)a3
{
  return (_TtC10FitnessAppP33_4EA4BC32C3BA0CE5667C98FF7F64C93913PillLabelView *)sub_1006BD7C4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC10FitnessAppP33_4EA4BC32C3BA0CE5667C98FF7F64C93913PillLabelView)initWithCoder:(id)a3
{
  return (_TtC10FitnessAppP33_4EA4BC32C3BA0CE5667C98FF7F64C93913PillLabelView *)sub_1006BDA24(a3);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  [*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC10FitnessAppP33_4EA4BC32C3BA0CE5667C98FF7F64C93913PillLabelView_label) sizeThatFits:a3.width, a3.height];
  double v4 = v3 + 6.0 + 2.0;
  double v6 = v5 + 2.0 + 6.0;
  result.height = v6;
  result.width = v4;
  return result;
}

- (CGSize)intrinsicContentSize
{
  [*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC10FitnessAppP33_4EA4BC32C3BA0CE5667C98FF7F64C93913PillLabelView_label) intrinsicContentSize];
  double v3 = v2 + 6.0 + 2.0;
  double v5 = v4 + 2.0 + 6.0;
  result.height = v5;
  result.width = v3;
  return result;
}

- (void)layoutSubviews
{
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for PillLabelView();
  double v2 = (char *)v9.receiver;
  [(PillLabelView *)&v9 layoutSubviews];
  double v3 = *(void **)&v2[OBJC_IVAR____TtC10FitnessAppP33_4EA4BC32C3BA0CE5667C98FF7F64C93913PillLabelView_label];
  [v3 sizeToFit];
  [v2 bounds];
  CGFloat x = v10.origin.x;
  CGFloat y = v10.origin.y;
  CGFloat width = v10.size.width;
  CGFloat height = v10.size.height;
  double MidX = CGRectGetMidX(v10);
  v11.origin.CGFloat x = x;
  v11.origin.CGFloat y = y;
  v11.size.CGFloat width = width;
  v11.size.CGFloat height = height;
  [v3 setCenter:MidX, CGRectGetMidY(v11)];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessAppP33_4EA4BC32C3BA0CE5667C98FF7F64C93913PillLabelView_label));

  swift_bridgeObjectRelease();
}

@end