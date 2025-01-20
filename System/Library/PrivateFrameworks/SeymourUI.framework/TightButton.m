@interface TightButton
- (CGSize)intrinsicContentSize;
- (_TtC9SeymourUI11TightButton)initWithCoder:(id)a3;
- (_TtC9SeymourUI11TightButton)initWithFrame:(CGRect)a3;
- (float)contentHuggingPriorityForAxis:(int64_t)a3;
- (void)setContentHuggingPriority:(float)a3 forAxis:(int64_t)a4;
- (void)setImage:(id)a3 forState:(unint64_t)a4;
@end

@implementation TightButton

- (float)contentHuggingPriorityForAxis:(int64_t)a3
{
  type metadata accessor for UILayoutPriority(0);
  sub_239C85874();
  sub_23A7FEE38();
  return v4;
}

- (CGSize)intrinsicContentSize
{
  v2 = self;
  id v3 = [(TightButton *)v2 titleLabel];
  if (v3)
  {
    float v4 = v3;
    objc_msgSend(v3, sel_intrinsicContentSize);

    sub_23A8004B8();
  }
  else
  {
    v11.receiver = v2;
    v11.super_class = (Class)type metadata accessor for TightButton();
    [(TightButton *)&v11 intrinsicContentSize];
  }
  double v7 = v5;
  double v8 = v6;

  double v9 = v7;
  double v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void)setContentHuggingPriority:(float)a3 forAxis:(int64_t)a4
{
}

- (void)setImage:(id)a3 forState:(unint64_t)a4
{
}

- (_TtC9SeymourUI11TightButton)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for TightButton();
  return -[TightButton initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (_TtC9SeymourUI11TightButton)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for TightButton();
  return [(TightButton *)&v5 initWithCoder:a3];
}

@end