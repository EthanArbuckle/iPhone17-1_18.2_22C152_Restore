@interface SXDarkModeConfiguration
- (BOOL)isAutoDarkModeEnabled;
- (NSDictionary)colors;
- (SXDarkModeConfiguration)initWithAutoDarkModeEnabled:(BOOL)a3 inversionBehavior:(unint64_t)a4 saturationThreshold:(double)a5 colors:(id)a6;
- (double)saturationThreshold;
- (unint64_t)inversionBehavior;
@end

@implementation SXDarkModeConfiguration

- (SXDarkModeConfiguration)initWithAutoDarkModeEnabled:(BOOL)a3 inversionBehavior:(unint64_t)a4 saturationThreshold:(double)a5 colors:(id)a6
{
  id v10 = a6;
  v16.receiver = self;
  v16.super_class = (Class)SXDarkModeConfiguration;
  v11 = [(SXDarkModeConfiguration *)&v16 init];
  v12 = v11;
  if (v11)
  {
    v11->_autoDarkModeEnabled = a3;
    v11->_inversionBehavior = a4;
    v11->_saturationThreshold = a5;
    uint64_t v13 = [v10 copy];
    colors = v12->_colors;
    v12->_colors = (NSDictionary *)v13;
  }
  return v12;
}

- (BOOL)isAutoDarkModeEnabled
{
  return self->_autoDarkModeEnabled;
}

- (unint64_t)inversionBehavior
{
  return self->_inversionBehavior;
}

- (double)saturationThreshold
{
  return self->_saturationThreshold;
}

- (NSDictionary)colors
{
  return self->_colors;
}

- (void).cxx_destruct
{
}

@end