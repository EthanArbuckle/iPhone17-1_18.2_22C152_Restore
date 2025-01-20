@interface VUIPlayerTabsConfig
- (BOOL)infoTabMustHaveImageToDisplay;
- (VUIPlayerTabsConfig)init;
- (void)setInfoTabMustHaveImageToDisplay:(BOOL)a3;
@end

@implementation VUIPlayerTabsConfig

- (void)setInfoTabMustHaveImageToDisplay:(BOOL)a3
{
  self->_infoTabMustHaveImageToDisplay = a3;
}

- (VUIPlayerTabsConfig)init
{
  v3.receiver = self;
  v3.super_class = (Class)VUIPlayerTabsConfig;
  result = [(VUIPlayerTabsConfig *)&v3 init];
  if (result) {
    result->_infoTabMustHaveImageToDisplay = 0;
  }
  return result;
}

- (BOOL)infoTabMustHaveImageToDisplay
{
  return self->_infoTabMustHaveImageToDisplay;
}

@end