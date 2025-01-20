@interface PIDepthAdjustmentController
+ (id)apertureKey;
+ (id)depthInfoKey;
+ (id)focusRectKey;
+ (id)glassesMatteAllowedKey;
- (BOOL)canAdjustApertureValue;
- (BOOL)canRenderDepth;
- (NSDictionary)depthInfo;
- (NSDictionary)focusRect;
- (NSNumber)glassesMatteAllowed;
- (PIDepthAdjustmentController)initWithAdjustment:(id)a3;
- (double)aperture;
- (double)maximumAperture;
- (double)minimumAperture;
- (id)capturedAperture;
- (id)capturedFocusRect;
- (id)pasteKeysForMediaType:(int64_t)a3;
- (void)setAperture:(double)a3;
- (void)setDepthInfo:(id)a3;
- (void)setFocusRect:(id)a3;
- (void)setGlassesMatteAllowed:(id)a3;
@end

@implementation PIDepthAdjustmentController

- (id)pasteKeysForMediaType:(int64_t)a3
{
  v7[2] = *MEMORY[0x1E4F143B8];
  v3 = +[PIAdjustmentController enabledKey];
  v7[0] = v3;
  v4 = +[PIDepthAdjustmentController apertureKey];
  v7[1] = v4;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:2];

  return v5;
}

- (NSNumber)glassesMatteAllowed
{
  v2 = [(PIAdjustmentController *)self adjustment];
  v3 = +[PIDepthAdjustmentController glassesMatteAllowedKey];
  v4 = [v2 objectForKeyedSubscript:v3];
  int v5 = [v4 BOOLValue];

  if (v5) {
    return (NSNumber *)MEMORY[0x1E4F1CC38];
  }
  else {
    return 0;
  }
}

- (void)setGlassesMatteAllowed:(id)a3
{
  int v4 = [a3 BOOLValue];
  id v8 = [(PIAdjustmentController *)self adjustment];
  int v5 = +[PIDepthAdjustmentController glassesMatteAllowedKey];
  if (v4)
  {
    uint64_t v6 = MEMORY[0x1E4F1CC38];
    v7 = v8;
  }
  else
  {
    v7 = v8;
    uint64_t v6 = 0;
  }
  [v7 setObject:v6 forKeyedSubscript:v5];
}

- (id)capturedFocusRect
{
  v2 = [(PIAdjustmentController *)self adjustment];
  v3 = +[PIDepthAdjustmentController depthInfoKey];
  int v4 = [v2 objectForKeyedSubscript:v3];
  int v5 = [v4 objectForKeyedSubscript:@"focusRect"];

  return v5;
}

- (NSDictionary)focusRect
{
  v2 = [(PIAdjustmentController *)self adjustment];
  v3 = +[PIDepthAdjustmentController focusRectKey];
  int v4 = [v2 objectForKeyedSubscript:v3];

  return (NSDictionary *)v4;
}

- (void)setFocusRect:(id)a3
{
  id v4 = a3;
  id v6 = [(PIAdjustmentController *)self adjustment];
  int v5 = +[PIDepthAdjustmentController focusRectKey];
  [v6 setObject:v4 forKeyedSubscript:v5];
}

- (id)capturedAperture
{
  v2 = [(PIAdjustmentController *)self adjustment];
  v3 = +[PIDepthAdjustmentController depthInfoKey];
  id v4 = [v2 objectForKeyedSubscript:v3];
  int v5 = [v4 objectForKeyedSubscript:@"capturedAperture"];

  return v5;
}

- (double)aperture
{
  v2 = [(PIAdjustmentController *)self adjustment];
  v3 = +[PIDepthAdjustmentController apertureKey];
  id v4 = [v2 objectForKeyedSubscript:v3];
  [v4 floatValue];
  double v6 = v5;

  return v6;
}

- (void)setAperture:(double)a3
{
  id v6 = [NSNumber numberWithDouble:a3];
  id v4 = [(PIAdjustmentController *)self adjustment];
  float v5 = +[PIDepthAdjustmentController apertureKey];
  [v4 setObject:v6 forKeyedSubscript:v5];
}

- (NSDictionary)depthInfo
{
  v2 = [(PIAdjustmentController *)self adjustment];
  v3 = +[PIDepthAdjustmentController depthInfoKey];
  id v4 = [v2 objectForKeyedSubscript:v3];

  return (NSDictionary *)v4;
}

- (void)setDepthInfo:(id)a3
{
  id v6 = (id)[a3 copy];
  id v4 = [(PIAdjustmentController *)self adjustment];
  float v5 = +[PIDepthAdjustmentController depthInfoKey];
  [v4 setObject:v6 forKeyedSubscript:v5];
}

- (double)maximumAperture
{
  v2 = [(PIDepthAdjustmentController *)self depthInfo];
  v3 = [v2 objectForKeyedSubscript:@"maximumAperture"];
  [v3 floatValue];
  double v5 = v4;

  return v5;
}

- (double)minimumAperture
{
  v2 = [(PIDepthAdjustmentController *)self depthInfo];
  v3 = [v2 objectForKeyedSubscript:@"minimumAperture"];
  [v3 floatValue];
  double v5 = v4;

  return v5;
}

- (BOOL)canAdjustApertureValue
{
  [(PIDepthAdjustmentController *)self minimumAperture];
  if (v3 <= 0.0) {
    return 0;
  }
  [(PIDepthAdjustmentController *)self maximumAperture];
  return v4 > 0.0;
}

- (BOOL)canRenderDepth
{
  v2 = [(PIDepthAdjustmentController *)self depthInfo];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (PIDepthAdjustmentController)initWithAdjustment:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PIDepthAdjustmentController;
  return [(PIAdjustmentController *)&v4 initWithAdjustment:a3];
}

+ (id)glassesMatteAllowedKey
{
  return @"glassesMatteAllowed";
}

+ (id)focusRectKey
{
  return @"focusRect";
}

+ (id)apertureKey
{
  return @"aperture";
}

+ (id)depthInfoKey
{
  return @"depthInfo";
}

@end