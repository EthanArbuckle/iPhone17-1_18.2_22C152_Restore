@interface CompactDayNavigationViewCellFactory
- (Class)cellClass;
- (double)roundedRectHeight;
- (id)createCellWithFrame:(CGRect)a3;
- (void)localeChanged;
@end

@implementation CompactDayNavigationViewCellFactory

- (id)createCellWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v7 = [CompactDayNavigationViewCell alloc];
  v8 = CUIKGetOverlayCalendar();
  v9 = -[CompactDayNavigationViewCell initWithFrame:loadMonthAnimationState:hasOverlay:sizeClass:](v7, "initWithFrame:loadMonthAnimationState:hasOverlay:sizeClass:", 0, v8 != 0, 1, x, y, width, height);

  [(CompactDayNavigationViewCell *)v9 setMatchesMonthView:1];

  return v9;
}

- (void)localeChanged
{
}

- (Class)cellClass
{
  return (Class)objc_opt_class();
}

- (double)roundedRectHeight
{
  +[CompactDayNavigationViewCell roundedRectHeightToMatchMonthView];
  return result;
}

@end