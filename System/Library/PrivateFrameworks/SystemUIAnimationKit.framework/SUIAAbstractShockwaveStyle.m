@interface SUIAAbstractShockwaveStyle
- (BOOL)usesChromaticAberation;
- (BOOL)usesEdgeLight;
- (BOOL)usesFillLight;
- (BOOL)usesIntelligentFillLight;
- (BOOL)usesMeshTransform;
- (CGRect)shockwaveBounds;
- (SUIAAbstractShockwaveStyle)initWithShockwaveViewBounds:(CGRect)a3;
- (double)recommendedPresentationDurationForState:(int64_t)a3;
- (id)_configurationForType:(int64_t)a3 state:(int64_t)a4;
- (id)_shockwaveSettings;
- (id)chromaticAberrationConfigurationForState:(int64_t)a3;
- (id)edgeLightOverlayConfigurationForState:(int64_t)a3;
- (id)fillLightConfigurationForState:(int64_t)a3;
- (id)meshConfigurationForState:(int64_t)a3;
- (id)rootViewConfigurationForState:(int64_t)a3;
- (void)_setConfiguration:(id)a3 forType:(int64_t)a4 state:(int64_t)a5;
- (void)setShockwaveBounds:(CGRect)a3;
- (void)setUsesIntelligentFillLight:(BOOL)a3;
- (void)settings:(id)a3 changedValueForKeyPath:(id)a4;
@end

@implementation SUIAAbstractShockwaveStyle

- (SUIAAbstractShockwaveStyle)initWithShockwaveViewBounds:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v13.receiver = self;
  v13.super_class = (Class)SUIAAbstractShockwaveStyle;
  v7 = [(SUIAAbstractShockwaveStyle *)&v13 init];
  v8 = v7;
  if (v7)
  {
    v7->_shockwaveBounds.origin.CGFloat x = x;
    v7->_shockwaveBounds.origin.CGFloat y = y;
    v7->_shockwaveBounds.size.CGFloat width = width;
    v7->_shockwaveBounds.size.CGFloat height = height;
    uint64_t v9 = [MEMORY[0x263EFF9A0] dictionary];
    configurations = v8->_configurations;
    v8->_configurations = (NSMutableDictionary *)v9;

    v11 = [(SUIAAbstractShockwaveStyle *)v8 _shockwaveSettings];
    [v11 addKeyPathObserver:v8];
  }
  return v8;
}

- (id)_shockwaveSettings
{
  prototypeSettings = self->_prototypeSettings;
  if (!prototypeSettings)
  {
    v4 = +[SUIAnimationKitPrototypeSettingsDomain rootSettings];
    v5 = [v4 shockwaveSettings];
    v6 = self->_prototypeSettings;
    self->_prototypeSettings = v5;

    prototypeSettings = self->_prototypeSettings;
  }
  return prototypeSettings;
}

- (void)settings:(id)a3 changedValueForKeyPath:(id)a4
{
}

- (void)setShockwaveBounds:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  if (!CGRectEqualToRect(a3, self->_shockwaveBounds))
  {
    self->_shockwaveBounds.origin.CGFloat x = x;
    self->_shockwaveBounds.origin.CGFloat y = y;
    self->_shockwaveBounds.size.CGFloat width = width;
    self->_shockwaveBounds.size.CGFloat height = height;
    configurations = self->_configurations;
    [(NSMutableDictionary *)configurations removeAllObjects];
  }
}

- (void)setUsesIntelligentFillLight:(BOOL)a3
{
  if (self->_usesIntelligentFillLight != a3)
  {
    self->_usesIntelligentFillLight = a3;
    [(NSMutableDictionary *)self->_configurations removeAllObjects];
  }
}

- (double)recommendedPresentationDurationForState:(int64_t)a3
{
  double result = 1.79769313e308;
  switch(a3)
  {
    case 1:
    case 4:
      v4 = [(SUIAAbstractShockwaveStyle *)self _shockwaveSettings];
      [v4 maximumHintDuration];
      goto LABEL_4;
    case 2:
    case 5:
      v4 = [(SUIAAbstractShockwaveStyle *)self _shockwaveSettings];
      [v4 totalDuration];
LABEL_4:
      double v6 = v5;

      goto LABEL_6;
    case 3:
      return result;
    default:
      double v6 = 0.0;
LABEL_6:
      UIAnimationDragCoefficient();
      return v6 * v7;
  }
}

- (BOOL)usesChromaticAberation
{
  v2 = [(SUIAAbstractShockwaveStyle *)self chromaticAberrationConfigurationForState:0];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)usesMeshTransform
{
  v2 = [(SUIAAbstractShockwaveStyle *)self meshConfigurationForState:0];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)usesFillLight
{
  v2 = [(SUIAAbstractShockwaveStyle *)self fillLightConfigurationForState:0];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)usesEdgeLight
{
  v2 = [(SUIAAbstractShockwaveStyle *)self edgeLightOverlayConfigurationForState:0];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)rootViewConfigurationForState:(int64_t)a3
{
  int64_t v5 = +[_SUIAShockwaveRootViewConfiguration configurationType];
  double v6 = [(SUIAAbstractShockwaveStyle *)self _configurationForType:v5 state:a3];
  if (!v6)
  {
    double v6 = objc_alloc_init(_SUIAShockwaveRootViewConfiguration);
    [(_SUIAShockwaveRootViewConfiguration *)v6 _setHidden:a3 == 3];
    [(SUIAAbstractShockwaveStyle *)self _setConfiguration:v6 forType:v5 state:a3];
  }
  return v6;
}

- (id)chromaticAberrationConfigurationForState:(int64_t)a3
{
  return 0;
}

- (id)meshConfigurationForState:(int64_t)a3
{
  return 0;
}

- (id)fillLightConfigurationForState:(int64_t)a3
{
  return 0;
}

- (id)edgeLightOverlayConfigurationForState:(int64_t)a3
{
  return 0;
}

- (id)_configurationForType:(int64_t)a3 state:(int64_t)a4
{
  configurations = self->_configurations;
  double v6 = [NSNumber numberWithInteger:a3];
  float v7 = [(NSMutableDictionary *)configurations objectForKey:v6];

  v8 = [NSNumber numberWithInteger:a4];
  uint64_t v9 = [v7 objectForKey:v8];

  return v9;
}

- (void)_setConfiguration:(id)a3 forType:(int64_t)a4 state:(int64_t)a5
{
  configurations = self->_configurations;
  uint64_t v9 = NSNumber;
  id v10 = a3;
  v11 = [v9 numberWithInteger:a4];
  id v15 = [(NSMutableDictionary *)configurations objectForKey:v11];

  if (!v15)
  {
    id v15 = [MEMORY[0x263EFF9A0] dictionary];
    v12 = self->_configurations;
    objc_super v13 = [NSNumber numberWithInteger:a4];
    [(NSMutableDictionary *)v12 setObject:v15 forKey:v13];
  }
  v14 = [NSNumber numberWithInteger:a5];
  [v15 setObject:v10 forKey:v14];
}

- (CGRect)shockwaveBounds
{
  double x = self->_shockwaveBounds.origin.x;
  double y = self->_shockwaveBounds.origin.y;
  double width = self->_shockwaveBounds.size.width;
  double height = self->_shockwaveBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (BOOL)usesIntelligentFillLight
{
  return self->_usesIntelligentFillLight;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configurations, 0);
  objc_storeStrong((id *)&self->_prototypeSettings, 0);
}

@end