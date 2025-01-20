@interface MLSEOSVariant
+ (BOOL)isInternalDevice;
@end

@implementation MLSEOSVariant

+ (BOOL)isInternalDevice
{
  return MEMORY[0x270EDAB10]("com.apple.ProactiveShareSheetDataHarvestingLighthouse.ProactiveShareSheetDataHarvestingLighthousePlugin", a2);
}

@end