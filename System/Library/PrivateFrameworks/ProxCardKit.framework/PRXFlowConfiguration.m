@interface PRXFlowConfiguration
+ (PRXFlowConfiguration)defaultConfiguration;
- (BOOL)supportsDarkMode;
- (PRXFlowConfiguration)init;
- (UIColor)customBackgroundColor;
- (int64_t)overrideInterfaceStyle;
- (void)setCustomBackgroundColor:(id)a3;
- (void)setOverrideInterfaceStyle:(int64_t)a3;
- (void)setSupportsDarkMode:(BOOL)a3;
@end

@implementation PRXFlowConfiguration

+ (PRXFlowConfiguration)defaultConfiguration
{
  if (defaultConfiguration_onceToken != -1) {
    dispatch_once(&defaultConfiguration_onceToken, &__block_literal_global);
  }
  v2 = (void *)defaultConfiguration_flowConfiguration;
  return (PRXFlowConfiguration *)v2;
}

uint64_t __44__PRXFlowConfiguration_defaultConfiguration__block_invoke()
{
  v0 = objc_alloc_init(PRXFlowConfiguration);
  v1 = (void *)defaultConfiguration_flowConfiguration;
  defaultConfiguration_flowConfiguration = (uint64_t)v0;

  uint64_t v2 = _os_feature_enabled_impl();
  v3 = (void *)defaultConfiguration_flowConfiguration;
  return [v3 setSupportsDarkMode:v2];
}

- (PRXFlowConfiguration)init
{
  v3.receiver = self;
  v3.super_class = (Class)PRXFlowConfiguration;
  result = [(PRXFlowConfiguration *)&v3 init];
  result->_overrideInterfaceStyle = 0;
  return result;
}

- (BOOL)supportsDarkMode
{
  return self->_supportsDarkMode;
}

- (void)setSupportsDarkMode:(BOOL)a3
{
  self->_supportsDarkMode = a3;
}

- (UIColor)customBackgroundColor
{
  return self->_customBackgroundColor;
}

- (void)setCustomBackgroundColor:(id)a3
{
}

- (int64_t)overrideInterfaceStyle
{
  return self->_overrideInterfaceStyle;
}

- (void)setOverrideInterfaceStyle:(int64_t)a3
{
  self->_overrideInterfaceStyle = a3;
}

- (void).cxx_destruct
{
}

@end