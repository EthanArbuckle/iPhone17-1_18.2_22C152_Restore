@interface _UIDirectionalMaskView
- (_TtC5UIKit22_UIDirectionalMaskView)initWithCoder:(id)a3;
- (_TtC5UIKit22_UIDirectionalMaskView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation _UIDirectionalMaskView

- (_TtC5UIKit22_UIDirectionalMaskView)initWithFrame:(CGRect)a3
{
  return (_TtC5UIKit22_UIDirectionalMaskView *)sub_185A08438(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)layoutSubviews
{
  v2 = self;
  sub_185A08A08();
}

- (_TtC5UIKit22_UIDirectionalMaskView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_185A09138();
}

- (void).cxx_destruct
{
}

@end