@interface NUNIAstronomyLocationDotConfiguration
+ (CGSize)_defaultSizeForDevice:(id)a3;
+ (double)_defaultInnerDotDiameterForDevice:(id)a3;
+ (double)_defaultOuterDotDiameterForDevice:(id)a3;
- (CGSize)defaultSize;
- (NUNIAstronomyLocationDotConfiguration)init;
- (double)defaultInnerDotDiameter;
- (double)defaultOuterDotDiameter;
- (double)screenScale;
- (void)setDefaultInnerDotDiameter:(double)a3;
- (void)setDefaultOuterDotDiameter:(double)a3;
- (void)setDefaultSize:(CGSize)a3;
- (void)setScreenScale:(double)a3;
@end

@implementation NUNIAstronomyLocationDotConfiguration

- (NUNIAstronomyLocationDotConfiguration)init
{
  v11.receiver = self;
  v11.super_class = (Class)NUNIAstronomyLocationDotConfiguration;
  v2 = [(NUNIAstronomyLocationDotConfiguration *)&v11 init];
  if (v2)
  {
    v3 = [MEMORY[0x263EFD1F0] sharedRenderingContext];
    v4 = [v3 device];

    [v4 screenScale];
    v2->_screenScale = v5;
    [(id)objc_opt_class() _defaultSizeForDevice:v4];
    v2->_defaultSize.width = v6;
    v2->_defaultSize.height = v7;
    [(id)objc_opt_class() _defaultOuterDotDiameterForDevice:v4];
    v2->_defaultOuterDotDiameter = v8;
    [(id)objc_opt_class() _defaultInnerDotDiameterForDevice:v4];
    v2->_defaultInnerDotDiameter = v9;
  }
  return v2;
}

+ (double)_defaultOuterDotDiameterForDevice:(id)a3
{
  _LayoutConstants(a3);
  return v3;
}

+ (double)_defaultInnerDotDiameterForDevice:(id)a3
{
  _LayoutConstants(a3);
  return v3;
}

+ (CGSize)_defaultSizeForDevice:(id)a3
{
  double v3 = _LayoutConstants(a3);
  result.height = v4;
  result.width = v3;
  return result;
}

- (double)screenScale
{
  return self->_screenScale;
}

- (void)setScreenScale:(double)a3
{
  self->_screenScale = a3;
}

- (CGSize)defaultSize
{
  double width = self->_defaultSize.width;
  double height = self->_defaultSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setDefaultSize:(CGSize)a3
{
  self->_defaultSize = a3;
}

- (double)defaultOuterDotDiameter
{
  return self->_defaultOuterDotDiameter;
}

- (void)setDefaultOuterDotDiameter:(double)a3
{
  self->_defaultOuterDotDiameter = a3;
}

- (double)defaultInnerDotDiameter
{
  return self->_defaultInnerDotDiameter;
}

- (void)setDefaultInnerDotDiameter:(double)a3
{
  self->_defaultInnerDotDiameter = a3;
}

@end