@interface SBHEditingWidgetButton
- (SBHEditingWidgetButton)initWithFrame:(CGRect)a3 backgroundView:(id)a4;
@end

@implementation SBHEditingWidgetButton

- (SBHEditingWidgetButton)initWithFrame:(CGRect)a3 backgroundView:(id)a4
{
  return [(SBTitledHomeScreenButton *)self initWithFrame:a4, 0, @"plus", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height backgroundView type content];
}

@end