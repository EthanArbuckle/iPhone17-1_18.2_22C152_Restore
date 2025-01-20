@interface _UIFocusRegionDebugDrawingConfiguration
+ (id)containerGuideConfigurationForRegion:(id)a3;
+ (id)guideConfigurationForRegion:(id)a3;
+ (id)itemConfigurationForRegion:(id)a3;
+ (id)promiseConfigurationForRegion:(id)a3;
- (BOOL)dashedStroke;
- (CGPattern)pattern;
- (UIColor)color;
- (_UIFocusRegionDebugDrawingConfiguration)initWithRegion:(id)a3 baseHue:(double)a4 patternAlpha:(double)a5 dashedStroke:(BOOL)a6;
- (double)patternAlpha;
- (id)associatedObject;
@end

@implementation _UIFocusRegionDebugDrawingConfiguration

+ (id)itemConfigurationForRegion:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithRegion:v4 baseHue:0 patternAlpha:0.75 dashedStroke:0.3];

  return v5;
}

+ (id)guideConfigurationForRegion:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithRegion:v4 baseHue:0 patternAlpha:0.53 dashedStroke:0.1];

  return v5;
}

+ (id)containerGuideConfigurationForRegion:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithRegion:v4 baseHue:1 patternAlpha:0.53 dashedStroke:0.4];

  return v5;
}

+ (id)promiseConfigurationForRegion:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithRegion:v4 baseHue:0 patternAlpha:0.75 dashedStroke:0.3];

  return v5;
}

- (_UIFocusRegionDebugDrawingConfiguration)initWithRegion:(id)a3 baseHue:(double)a4 patternAlpha:(double)a5 dashedStroke:(BOOL)a6
{
  uint64_t v10 = (uint64_t)a3;
  v16.receiver = self;
  v16.super_class = (Class)_UIFocusRegionDebugDrawingConfiguration;
  v11 = [(_UIFocusRegionDebugDrawingConfiguration *)&v16 init];
  if (v11)
  {
    uint64_t v12 = v10 / 21 % 6;
    uint64_t v13 = +[UIColor colorWithHue:(double)v12 * 0.01 + a4 saturation:1.0 brightness:1.0 alpha:1.0];
    color = v11->_color;
    v11->_color = (UIColor *)v13;

    v11->_patternAlpha = a5;
    v11->_pattern = (CGPattern *)(v12 + 1);
    v11->_dashedStroke = a6;
  }

  return v11;
}

- (id)associatedObject
{
  return self->_associatedObject;
}

- (UIColor)color
{
  return self->_color;
}

- (double)patternAlpha
{
  return self->_patternAlpha;
}

- (CGPattern)pattern
{
  return self->_pattern;
}

- (BOOL)dashedStroke
{
  return self->_dashedStroke;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong(&self->_associatedObject, 0);
}

@end