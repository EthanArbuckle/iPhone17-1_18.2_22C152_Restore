@interface SocialProfileButtonUIView
- (BOOL)canBecomeFocused;
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (SocialProfileButtonUIView)initWithCoder:(id)a3;
- (SocialProfileButtonUIView)initWithFrame:(CGRect)a3;
- (void)_tapGestureAction:(id)a3;
- (void)layoutSubviews;
@end

@implementation SocialProfileButtonUIView

- (SocialProfileButtonUIView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_2296C4200();
}

- (CGSize)intrinsicContentSize
{
  double v2 = 34.0;
  double v3 = 34.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3 = 34.0;
  double v4 = 34.0;
  result.height = v4;
  result.width = v3;
  return result;
}

- (BOOL)canBecomeFocused
{
  return 1;
}

- (void)layoutSubviews
{
  double v2 = self;
  sub_2296C4404();
}

- (void)_tapGestureAction:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_2296C4B78();
}

- (SocialProfileButtonUIView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  swift_release();
}

@end