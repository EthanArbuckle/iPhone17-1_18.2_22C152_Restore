@interface CRLLabelView_mi
- (_TtC8Freeform15CRLLabelView_mi)initWithCoder:(id)a3;
- (_TtC8Freeform15CRLLabelView_mi)initWithFrame:(CGRect)a3;
@end

@implementation CRLLabelView_mi

- (_TtC8Freeform15CRLLabelView_mi)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for CRLLabelView_mi();
  return -[CRLLabelView_mi initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC8Freeform15CRLLabelView_mi)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for CRLLabelView_mi();
  return [(CRLLabelView_mi *)&v5 initWithCoder:a3];
}

@end