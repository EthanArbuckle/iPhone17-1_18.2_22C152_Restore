@interface SUIAButtonEmanatingCaptureShockwaveStyle
- (SUIAButtonEmanatingCaptureShockwaveStyle)initWithNormalizedButtonEdgeLocation:(CGRect)a3 shockwaveViewBounds:(CGRect)a4;
- (id)chromaticAberrationConfigurationForState:(int64_t)a3;
- (id)edgeLightOverlayConfigurationForState:(int64_t)a3;
- (id)fillLightConfigurationForState:(int64_t)a3;
- (id)meshConfigurationForState:(int64_t)a3;
@end

@implementation SUIAButtonEmanatingCaptureShockwaveStyle

- (SUIAButtonEmanatingCaptureShockwaveStyle)initWithNormalizedButtonEdgeLocation:(CGRect)a3 shockwaveViewBounds:(CGRect)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v9.receiver = self;
  v9.super_class = (Class)SUIAButtonEmanatingCaptureShockwaveStyle;
  result = -[SUIAAbstractShockwaveStyle initWithShockwaveViewBounds:](&v9, sel_initWithShockwaveViewBounds_, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  if (result)
  {
    result->_normalizedButtonLocation.origin.CGFloat x = x;
    result->_normalizedButtonLocation.origin.CGFloat y = y;
    result->_normalizedButtonLocation.size.CGFloat width = width;
    result->_normalizedButtonLocation.size.CGFloat height = height;
  }
  return result;
}

- (id)chromaticAberrationConfigurationForState:(int64_t)a3
{
  v5 = [(SUIAAbstractShockwaveStyle *)self _shockwaveSettings];
  int v6 = [v5 captureChromaticAberrationEnabled];

  if (v6)
  {
    int64_t v7 = +[_SUIAShockwaveChromaticAberrationConfiguration configurationType];
    v8 = [(SUIAAbstractShockwaveStyle *)self _configurationForType:v7 state:a3];
    if (!v8)
    {
      objc_super v9 = [(SUIAAbstractShockwaveStyle *)self _shockwaveSettings];
      [(SUIAAbstractShockwaveStyle *)self shockwaveBounds];
      v8 = +[_SUIAShockwaveChromaticAberrationConfiguration chromaticAberrationConfigurationForState:variant:buttonEmanating:normalizedStartLocation:settings:bounds:usesIntelligentFillLight:](_SUIAShockwaveChromaticAberrationConfiguration, "chromaticAberrationConfigurationForState:variant:buttonEmanating:normalizedStartLocation:settings:bounds:usesIntelligentFillLight:", a3, 0, 1, v9, [(SUIAAbstractShockwaveStyle *)self usesIntelligentFillLight], self->_normalizedButtonLocation.origin.x, self->_normalizedButtonLocation.origin.y, self->_normalizedButtonLocation.size.width, self->_normalizedButtonLocation.size.height, v10, v11, v12, v13);

      [(SUIAAbstractShockwaveStyle *)self _setConfiguration:v8 forType:v7 state:a3];
    }
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (id)meshConfigurationForState:(int64_t)a3
{
  v5 = [(SUIAAbstractShockwaveStyle *)self _shockwaveSettings];
  if ([v5 captureMeshEnabled])
  {
    int64_t v6 = +[_SUIAShockwaveMeshConfiguration configurationType];
    int64_t v7 = [(SUIAAbstractShockwaveStyle *)self _configurationForType:v6 state:a3];
    if (!v7)
    {
      [(SUIAAbstractShockwaveStyle *)self shockwaveBounds];
      int64_t v7 = +[_SUIAShockwaveMeshConfiguration meshConfigurationForState:variant:normalizedStartLocation:settings:bounds:usesIntelligentFillLight:](_SUIAShockwaveMeshConfiguration, "meshConfigurationForState:variant:normalizedStartLocation:settings:bounds:usesIntelligentFillLight:", a3, 0, v5, [(SUIAAbstractShockwaveStyle *)self usesIntelligentFillLight], self->_normalizedButtonLocation.origin.x, self->_normalizedButtonLocation.origin.y, self->_normalizedButtonLocation.size.width, self->_normalizedButtonLocation.size.height, v8, v9, v10, v11);
      [(SUIAAbstractShockwaveStyle *)self _setConfiguration:v7 forType:v6 state:a3];
    }
  }
  else
  {
    int64_t v7 = 0;
  }

  return v7;
}

- (id)fillLightConfigurationForState:(int64_t)a3
{
  v5 = [(SUIAAbstractShockwaveStyle *)self _shockwaveSettings];
  int64_t v6 = +[_SUIAShockwaveFillLightConfiguration configurationType];
  int64_t v7 = [(SUIAAbstractShockwaveStyle *)self _configurationForType:v6 state:a3];
  if (!v7)
  {
    [(SUIAAbstractShockwaveStyle *)self shockwaveBounds];
    int64_t v7 = +[_SUIAShockwaveFillLightConfiguration fillLightConfigurationForState:variant:normalizedStartLocation:settings:bounds:usesIntelligentFillLight:](_SUIAShockwaveFillLightConfiguration, "fillLightConfigurationForState:variant:normalizedStartLocation:settings:bounds:usesIntelligentFillLight:", a3, 0, v5, [(SUIAAbstractShockwaveStyle *)self usesIntelligentFillLight], self->_normalizedButtonLocation.origin.x, self->_normalizedButtonLocation.origin.y, self->_normalizedButtonLocation.size.width, self->_normalizedButtonLocation.size.height, v8, v9, v10, v11);
    [(SUIAAbstractShockwaveStyle *)self _setConfiguration:v7 forType:v6 state:a3];
  }

  return v7;
}

- (id)edgeLightOverlayConfigurationForState:(int64_t)a3
{
  return 0;
}

@end