@interface SUUIFieldSettingDescriptionView
- (BOOL)enabled;
- (void)setEnabled:(BOOL)a3;
@end

@implementation SUUIFieldSettingDescriptionView

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

@end