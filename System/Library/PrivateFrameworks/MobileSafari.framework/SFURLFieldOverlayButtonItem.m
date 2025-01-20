@interface SFURLFieldOverlayButtonItem
- (UIAction)action;
- (int64_t)theme;
- (void)setAction:(id)a3;
- (void)setTheme:(int64_t)a3;
@end

@implementation SFURLFieldOverlayButtonItem

- (UIAction)action
{
  return self->_action;
}

- (void)setAction:(id)a3
{
}

- (int64_t)theme
{
  return self->_theme;
}

- (void)setTheme:(int64_t)a3
{
  self->_theme = a3;
}

- (void).cxx_destruct
{
}

@end