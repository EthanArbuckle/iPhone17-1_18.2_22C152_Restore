@interface NUNIAstronomyVistaConfiguration
- (BOOL)isGPUEnabled;
- (BOOL)isRTLLayout;
- (CLKDevice)device;
- (NSString)textureSuffix;
- (NUNIAstronomyVistaConfiguration)initWithDevice:(id)a3;
- (double)screenScale;
- (float)maxAPL;
- (id)initialSetupOperation;
- (int64_t)colorSpace;
- (unint64_t)quadViewOptions;
- (unint64_t)rendererStyle;
- (void)setColorSpace:(int64_t)a3;
- (void)setDevice:(id)a3;
- (void)setInitialSetupOperation:(id)a3;
- (void)setIsGPUEnabled:(BOOL)a3;
- (void)setIsRTLLayout:(BOOL)a3;
- (void)setMaxAPL:(float)a3;
- (void)setQuadViewOptions:(unint64_t)a3;
- (void)setRendererStyle:(unint64_t)a3;
- (void)setScreenScale:(double)a3;
- (void)setTextureSuffix:(id)a3;
@end

@implementation NUNIAstronomyVistaConfiguration

- (NUNIAstronomyVistaConfiguration)initWithDevice:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NUNIAstronomyVistaConfiguration;
  v6 = [(NUNIAstronomyVistaConfiguration *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_device, a3);
    v7->_rendererStyle = 0;
    v7->_colorSpace = 0;
    textureSuffix = v7->_textureSuffix;
    v7->_textureSuffix = (NSString *)@"classic";
  }
  return v7;
}

- (BOOL)isRTLLayout
{
  return self->_isRTLLayout;
}

- (void)setIsRTLLayout:(BOOL)a3
{
  self->_isRTLLayout = a3;
}

- (BOOL)isGPUEnabled
{
  return self->_isGPUEnabled;
}

- (void)setIsGPUEnabled:(BOOL)a3
{
  self->_isGPUEnabled = a3;
}

- (unint64_t)quadViewOptions
{
  return self->_quadViewOptions;
}

- (void)setQuadViewOptions:(unint64_t)a3
{
  self->_quadViewOptions = a3;
}

- (NSString)textureSuffix
{
  return self->_textureSuffix;
}

- (void)setTextureSuffix:(id)a3
{
}

- (unint64_t)rendererStyle
{
  return self->_rendererStyle;
}

- (void)setRendererStyle:(unint64_t)a3
{
  self->_rendererStyle = a3;
}

- (int64_t)colorSpace
{
  return self->_colorSpace;
}

- (void)setColorSpace:(int64_t)a3
{
  self->_colorSpace = a3;
}

- (CLKDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
}

- (double)screenScale
{
  return self->_screenScale;
}

- (void)setScreenScale:(double)a3
{
  self->_screenScale = a3;
}

- (float)maxAPL
{
  return self->_maxAPL;
}

- (void)setMaxAPL:(float)a3
{
  self->_maxAPL = a3;
}

- (id)initialSetupOperation
{
  return self->_initialSetupOperation;
}

- (void)setInitialSetupOperation:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_initialSetupOperation, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_textureSuffix, 0);
}

@end