@interface UIView.Separator
- (CGSize)intrinsicContentSize;
- (_TtCE16MusicApplicationCSo6UIView9Separator)initWithCoder:(id)a3;
- (_TtCE16MusicApplicationCSo6UIView9Separator)initWithFrame:(CGRect)a3;
@end

@implementation UIView.Separator

- (_TtCE16MusicApplicationCSo6UIView9Separator)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v11.receiver = self;
  v11.super_class = (Class)_s9SeparatorCMa();
  v7 = -[UIView.Separator initWithFrame:](&v11, "initWithFrame:", x, y, width, height);
  uint64_t v8 = qword_DBDE30;
  v9 = v7;
  if (v8 != -1) {
    swift_once();
  }
  [(UIView.Separator *)v9 setBackgroundColor:qword_E4A920];

  return v9;
}

- (_TtCE16MusicApplicationCSo6UIView9Separator)initWithCoder:(id)a3
{
  result = (_TtCE16MusicApplicationCSo6UIView9Separator *)sub_AB8280();
  __break(1u);
  return result;
}

- (CGSize)intrinsicContentSize
{
  v2 = self;
  id v3 = [(UIView.Separator *)v2 traitCollection];
  [v3 displayScale];
  double v5 = v4;

  double v6 = 1.0 / v5;
  double v7 = UIViewNoIntrinsicMetric;
  result.double height = v6;
  result.double width = v7;
  return result;
}

@end