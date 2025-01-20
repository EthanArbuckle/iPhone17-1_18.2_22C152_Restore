@interface SKUIFieldSettingDescriptionView
- (BOOL)enabled;
- (void)beginEdits;
- (void)commitEdits;
- (void)setEnabled:(BOOL)a3;
@end

@implementation SKUIFieldSettingDescriptionView

- (void)beginEdits
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIFieldSettingDescriptionView beginEdits]";
}

- (void)commitEdits
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIFieldSettingDescriptionView commitEdits]";
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

@end