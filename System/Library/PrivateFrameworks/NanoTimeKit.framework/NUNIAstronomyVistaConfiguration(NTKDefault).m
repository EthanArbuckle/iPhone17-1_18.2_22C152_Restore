@interface NUNIAstronomyVistaConfiguration(NTKDefault)
+ (id)defaultConfigurationWithDevice:()NTKDefault;
@end

@implementation NUNIAstronomyVistaConfiguration(NTKDefault)

+ (id)defaultConfigurationWithDevice:()NTKDefault
{
  v3 = (objc_class *)MEMORY[0x1E4F7A048];
  id v4 = a3;
  v5 = (void *)[[v3 alloc] initWithDevice:v4];
  [v5 setIsRTLLayout:CLKLayoutIsRTL()];
  [v5 setIsGPUEnabled:NTKGPUIsEnabled()];
  [v4 screenScale];
  double v7 = v6;

  [v5 setScreenScale:v7];
  [v5 setQuadViewOptions:32];

  return v5;
}

@end