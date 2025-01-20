@interface SBIconWidgetIntroductionView
- (NSArray)widgetIcons;
- (SBIconWidgetIntroductionView)initWithWidgetIcons:(id)a3;
@end

@implementation SBIconWidgetIntroductionView

- (SBIconWidgetIntroductionView)initWithWidgetIcons:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBIconWidgetIntroductionView;
  v5 = [(SBIconWidgetIntroductionView *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    widgetIcons = v5->_widgetIcons;
    v5->_widgetIcons = (NSArray *)v6;
  }
  return v5;
}

- (NSArray)widgetIcons
{
  return self->_widgetIcons;
}

- (void).cxx_destruct
{
}

@end