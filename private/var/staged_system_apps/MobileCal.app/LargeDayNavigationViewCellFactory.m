@interface LargeDayNavigationViewCellFactory
- (Class)cellClass;
- (double)roundedRectHeight;
- (id)createCellWithFrame:(CGRect)a3;
- (void)contentSizeCategoryChanged;
- (void)localeChanged;
@end

@implementation LargeDayNavigationViewCellFactory

- (id)createCellWithFrame:(CGRect)a3
{
  v3 = -[LargeDayNavigationViewCell initWithFrame:]([LargeDayNavigationViewCell alloc], "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(LargeDayNavigationViewCell *)v3 setUsesRoundedRectInsteadOfCircle:EKUIUsesRoundedRectsInsteadOfCircles()];

  return v3;
}

- (void)localeChanged
{
}

- (void)contentSizeCategoryChanged
{
}

- (Class)cellClass
{
  return (Class)objc_opt_class();
}

- (double)roundedRectHeight
{
  +[DayNavigationViewCell roundedRectHeight];
  return result;
}

@end