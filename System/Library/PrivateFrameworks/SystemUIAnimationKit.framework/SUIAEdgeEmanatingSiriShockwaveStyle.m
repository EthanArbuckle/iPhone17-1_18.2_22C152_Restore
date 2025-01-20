@interface SUIAEdgeEmanatingSiriShockwaveStyle
- (SUIAEdgeEmanatingSiriShockwaveStyle)initWithEdge:(unint64_t)a3 shockwaveViewBounds:(CGRect)a4;
- (id)chromaticAberrationConfigurationForState:(int64_t)a3;
- (id)edgeLightOverlayConfigurationForState:(int64_t)a3;
- (id)fillLightConfigurationForState:(int64_t)a3;
- (id)meshConfigurationForState:(int64_t)a3;
@end

@implementation SUIAEdgeEmanatingSiriShockwaveStyle

- (SUIAEdgeEmanatingSiriShockwaveStyle)initWithEdge:(unint64_t)a3 shockwaveViewBounds:(CGRect)a4
{
  v6.receiver = self;
  v6.super_class = (Class)SUIAEdgeEmanatingSiriShockwaveStyle;
  result = -[SUIAAbstractShockwaveStyle initWithShockwaveViewBounds:](&v6, sel_initWithShockwaveViewBounds_, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  if (result) {
    result->_edge = a3;
  }
  return result;
}

- (id)chromaticAberrationConfigurationForState:(int64_t)a3
{
  v5 = [(SUIAAbstractShockwaveStyle *)self _shockwaveSettings];
  if ([v5 siriEdgeChromaticAberrationEnabled])
  {
    int64_t v6 = +[_SUIAShockwaveChromaticAberrationConfiguration configurationType];
    v7 = [(SUIAAbstractShockwaveStyle *)self _configurationForType:v6 state:a3];
    if (!v7)
    {
      double v8 = SUIANormalizedRectSpanningRectEdge(self->_edge);
      double v10 = v9;
      double v12 = v11;
      double v14 = v13;
      [(SUIAAbstractShockwaveStyle *)self shockwaveBounds];
      v7 = +[_SUIAShockwaveChromaticAberrationConfiguration chromaticAberrationConfigurationForState:variant:buttonEmanating:normalizedStartLocation:settings:bounds:usesIntelligentFillLight:](_SUIAShockwaveChromaticAberrationConfiguration, "chromaticAberrationConfigurationForState:variant:buttonEmanating:normalizedStartLocation:settings:bounds:usesIntelligentFillLight:", a3, 2, 0, v5, [(SUIAAbstractShockwaveStyle *)self usesIntelligentFillLight], v8, v10, v12, v14, v15, v16, v17, v18);
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
    if (([v5 siriEdgeMeshEnabledLargeScreen] & 1) == 0)
    {
LABEL_3:
      double v8 = 0;
      goto LABEL_7;
    }
  }
  else if (![v5 siriEdgeMeshEnabled])
  {
    goto LABEL_3;
  }
  int64_t v9 = +[_SUIAShockwaveMeshConfiguration configurationType];
  double v8 = [(SUIAAbstractShockwaveStyle *)self _configurationForType:v9 state:a3];
  if (!v8)
  {
    double v10 = SUIANormalizedRectSpanningRectEdge(self->_edge);
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    [(SUIAAbstractShockwaveStyle *)self shockwaveBounds];
    double v8 = +[_SUIAShockwaveMeshConfiguration meshConfigurationForState:variant:normalizedStartLocation:settings:bounds:usesIntelligentFillLight:](_SUIAShockwaveMeshConfiguration, "meshConfigurationForState:variant:normalizedStartLocation:settings:bounds:usesIntelligentFillLight:", a3, 2, v5, [(SUIAAbstractShockwaveStyle *)self usesIntelligentFillLight], v10, v12, v14, v16, v17, v18, v19, v20);
    [(SUIAAbstractShockwaveStyle *)self _setConfiguration:v8 forType:v9 state:a3];
  }
LABEL_7:

  return v8;
}

- (id)fillLightConfigurationForState:(int64_t)a3
{
  v5 = [(SUIAAbstractShockwaveStyle *)self _shockwaveSettings];
  if ([v5 siriEdgeFillLightEnabled])
  {
    int64_t v6 = +[_SUIAShockwaveFillLightConfiguration configurationType];
    double v7 = [(SUIAAbstractShockwaveStyle *)self _configurationForType:v6 state:a3];
    if (!v7)
    {
      double v8 = SUIANormalizedRectSpanningRectEdge(self->_edge);
      double v10 = v9;
      double v12 = v11;
      double v14 = v13;
      [(SUIAAbstractShockwaveStyle *)self shockwaveBounds];
      double v7 = +[_SUIAShockwaveFillLightConfiguration fillLightConfigurationForState:variant:normalizedStartLocation:settings:bounds:usesIntelligentFillLight:](_SUIAShockwaveFillLightConfiguration, "fillLightConfigurationForState:variant:normalizedStartLocation:settings:bounds:usesIntelligentFillLight:", a3, 2, v5, [(SUIAAbstractShockwaveStyle *)self usesIntelligentFillLight], v8, v10, v12, v14, v15, v16, v17, v18);
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
  if ([v5 siriEdgeEdgeLightEnabled])
  {
    int64_t v6 = +[_SUIAShockwaveEdgeLightOverlayConfiguration configurationType];
    double v7 = [(SUIAAbstractShockwaveStyle *)self _configurationForType:v6 state:a3];
    if (!v7)
    {
      double v8 = SUIANormalizedRectSpanningRectEdge(self->_edge);
      double v10 = v9;
      double v12 = v11;
      double v14 = v13;
      [(SUIAAbstractShockwaveStyle *)self shockwaveBounds];
      double v7 = +[_SUIAShockwaveEdgeLightOverlayConfiguration edgeLightOverlayConfigurationForState:variant:normalizedStartLocation:settings:bounds:](_SUIAShockwaveEdgeLightOverlayConfiguration, "edgeLightOverlayConfigurationForState:variant:normalizedStartLocation:settings:bounds:", a3, 2, v5, v8, v10, v12, v14, v15, v16, v17, v18);
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