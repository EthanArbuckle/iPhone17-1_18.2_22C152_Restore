@interface SUIAButtonEmanatingSiriShockwaveStyle
- (SUIAButtonEmanatingSiriShockwaveStyle)initWithNormalizedButtonEdgeLocation:(CGRect)a3 shockwaveViewBounds:(CGRect)a4;
- (id)chromaticAberrationConfigurationForState:(int64_t)a3;
- (id)edgeLightOverlayConfigurationForState:(int64_t)a3;
- (id)fillLightConfigurationForState:(int64_t)a3;
- (id)meshConfigurationForState:(int64_t)a3;
@end

@implementation SUIAButtonEmanatingSiriShockwaveStyle

- (SUIAButtonEmanatingSiriShockwaveStyle)initWithNormalizedButtonEdgeLocation:(CGRect)a3 shockwaveViewBounds:(CGRect)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v9.receiver = self;
  v9.super_class = (Class)SUIAButtonEmanatingSiriShockwaveStyle;
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
  if ([v5 siriButtonChromaticAberrationEnabled])
  {
    int64_t v6 = +[_SUIAShockwaveChromaticAberrationConfiguration configurationType];
    v7 = [(SUIAAbstractShockwaveStyle *)self _configurationForType:v6 state:a3];
    if (!v7)
    {
      [(SUIAAbstractShockwaveStyle *)self shockwaveBounds];
      v7 = +[_SUIAShockwaveChromaticAberrationConfiguration chromaticAberrationConfigurationForState:variant:buttonEmanating:normalizedStartLocation:settings:bounds:usesIntelligentFillLight:](_SUIAShockwaveChromaticAberrationConfiguration, "chromaticAberrationConfigurationForState:variant:buttonEmanating:normalizedStartLocation:settings:bounds:usesIntelligentFillLight:", a3, 1, 1, v5, [(SUIAAbstractShockwaveStyle *)self usesIntelligentFillLight], self->_normalizedButtonLocation.origin.x, self->_normalizedButtonLocation.origin.y, self->_normalizedButtonLocation.size.width, self->_normalizedButtonLocation.size.height, v8, v9, v10, v11);
      [(SUIAAbstractShockwaveStyle *)self _setConfiguration:v7 forType:v6 state:a3];
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)meshConfigurationForState:(int64_t)a3
{
  v5 = [(SUIAAbstractShockwaveStyle *)self _shockwaveSettings];
  [(SUIAAbstractShockwaveStyle *)self shockwaveBounds];
  if (objc_msgSend(v5, "shouldBehaveLikeLargeScreen:", v6, v7))
  {
    if (([v5 siriButtonMeshEnabledLargeScreen] & 1) == 0)
    {
LABEL_3:
      double v8 = 0;
      goto LABEL_7;
    }
  }
  else if (![v5 siriButtonMeshEnabled])
  {
    goto LABEL_3;
  }
  int64_t v9 = +[_SUIAShockwaveMeshConfiguration configurationType];
  double v8 = [(SUIAAbstractShockwaveStyle *)self _configurationForType:v9 state:a3];
  if (!v8)
  {
    [(SUIAAbstractShockwaveStyle *)self shockwaveBounds];
    double v8 = +[_SUIAShockwaveMeshConfiguration meshConfigurationForState:variant:normalizedStartLocation:settings:bounds:usesIntelligentFillLight:](_SUIAShockwaveMeshConfiguration, "meshConfigurationForState:variant:normalizedStartLocation:settings:bounds:usesIntelligentFillLight:", a3, 1, v5, [(SUIAAbstractShockwaveStyle *)self usesIntelligentFillLight], self->_normalizedButtonLocation.origin.x, self->_normalizedButtonLocation.origin.y, self->_normalizedButtonLocation.size.width, self->_normalizedButtonLocation.size.height, v10, v11, v12, v13);
    [(SUIAAbstractShockwaveStyle *)self _setConfiguration:v8 forType:v9 state:a3];
  }
LABEL_7:

  return v8;
}

- (id)fillLightConfigurationForState:(int64_t)a3
{
  v5 = [(SUIAAbstractShockwaveStyle *)self _shockwaveSettings];
  if ([v5 siriButtonFillLightEnabled])
  {
    int64_t v6 = +[_SUIAShockwaveFillLightConfiguration configurationType];
    double v7 = [(SUIAAbstractShockwaveStyle *)self _configurationForType:v6 state:a3];
    if (!v7)
    {
      [(SUIAAbstractShockwaveStyle *)self shockwaveBounds];
      double v7 = +[_SUIAShockwaveFillLightConfiguration fillLightConfigurationForState:variant:normalizedStartLocation:settings:bounds:usesIntelligentFillLight:](_SUIAShockwaveFillLightConfiguration, "fillLightConfigurationForState:variant:normalizedStartLocation:settings:bounds:usesIntelligentFillLight:", a3, 1, v5, [(SUIAAbstractShockwaveStyle *)self usesIntelligentFillLight], self->_normalizedButtonLocation.origin.x, self->_normalizedButtonLocation.origin.y, self->_normalizedButtonLocation.size.width, self->_normalizedButtonLocation.size.height, v8, v9, v10, v11);
      [(SUIAAbstractShockwaveStyle *)self _setConfiguration:v7 forType:v6 state:a3];
    }
  }
  else
  {
    double v7 = 0;
  }

  return v7;
}

- (id)edgeLightOverlayConfigurationForState:(int64_t)a3
{
  v5 = [(SUIAAbstractShockwaveStyle *)self _shockwaveSettings];
  if ([v5 siriButtonEdgeLightEnabled])
  {
    int64_t v6 = +[_SUIAShockwaveEdgeLightOverlayConfiguration configurationType];
    double v7 = [(SUIAAbstractShockwaveStyle *)self _configurationForType:v6 state:a3];
    if (!v7)
    {
      [(SUIAAbstractShockwaveStyle *)self shockwaveBounds];
      double v7 = +[_SUIAShockwaveEdgeLightOverlayConfiguration edgeLightOverlayConfigurationForState:variant:normalizedStartLocation:settings:bounds:](_SUIAShockwaveEdgeLightOverlayConfiguration, "edgeLightOverlayConfigurationForState:variant:normalizedStartLocation:settings:bounds:", a3, 1, v5, self->_normalizedButtonLocation.origin.x, self->_normalizedButtonLocation.origin.y, self->_normalizedButtonLocation.size.width, self->_normalizedButtonLocation.size.height, v8, v9, v10, v11);
      [(SUIAAbstractShockwaveStyle *)self _setConfiguration:v7 forType:v6 state:a3];
    }
  }
  else
  {
    double v7 = 0;
  }

  return v7;
}

@end