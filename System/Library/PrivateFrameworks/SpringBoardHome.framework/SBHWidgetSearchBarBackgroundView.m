@interface SBHWidgetSearchBarBackgroundView
- (SBHWidgetSearchBarBackgroundView)initWithAddWidgetSheetStyle:(unint64_t)a3;
@end

@implementation SBHWidgetSearchBarBackgroundView

- (SBHWidgetSearchBarBackgroundView)initWithAddWidgetSheetStyle:(unint64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SBHWidgetSearchBarBackgroundView;
  v4 = [(SBHWidgetSearchBarBackgroundView *)&v8 init];
  v5 = v4;
  if (v4)
  {
    double v6 = 15.0;
    if (a3 == 1) {
      double v6 = 9.0;
    }
    [(SBHWidgetSearchBarBackgroundView *)v4 _setContinuousCornerRadius:v6];
  }
  return v5;
}

@end