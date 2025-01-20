@interface WFIconHostingView
+ (id)renderIcon:(id)a3 size:(CGSize)a4;
- (BOOL)useAccentColor;
- (CGSize)iconSize;
- (WFIcon)icon;
- (WFIconHostingView)initWithCoder:(id)a3;
- (WFIconHostingView)initWithFrame:(CGRect)a3;
- (WFIconHostingView)initWithIcon:(id)a3 size:(CGSize)a4;
- (void)setIcon:(id)a3;
- (void)setIconSize:(CGSize)a3;
- (void)setUseAccentColor:(BOOL)a3;
@end

@implementation WFIconHostingView

- (WFIcon)icon
{
  v2 = sub_23536D5A0();
  return (WFIcon *)v2;
}

- (void)setIcon:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_23536D644(a3);
}

- (CGSize)iconSize
{
  double v2 = sub_23536D89C();
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setIconSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v5 = self;
  sub_23536D93C(width, height);
}

- (BOOL)useAccentColor
{
  return sub_23536DB00() & 1;
}

- (void)setUseAccentColor:(BOOL)a3
{
  v4 = self;
  sub_23536DB94(a3);
}

- (WFIconHostingView)initWithIcon:(id)a3 size:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v7 = a3;
  return (WFIconHostingView *)IconHostingView.init(icon:size:)(a3, width, height);
}

- (WFIconHostingView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_23536DE9C();
}

+ (id)renderIcon:(id)a3 size:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v6 = a3;
  id v7 = (void *)static IconHostingView.render(icon:with:)(v6, width, height);

  return v7;
}

- (WFIconHostingView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  id v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___WFIconHostingView_hostingView);
}

@end