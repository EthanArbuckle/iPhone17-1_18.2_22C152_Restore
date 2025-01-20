@interface NAUIDeviceUtilities
+ (BOOL)hasOrbCapability;
+ (BOOL)naui_isPad;
+ (BOOL)naui_isUsingLandscapeOrientation;
+ (BOOL)naui_shouldUseLargeiPadLayout;
+ (BOOL)naui_shouldUseLargeiPadLayoutForSize:(CGSize)a3;
+ (NSString)localizedProductName;
+ (NSString)operatingSystemName;
+ (NSString)productClass;
+ (NSString)productHardwareModel;
+ (NSString)productHardwareModelName;
+ (NSString)productType;
+ (NSString)uniqueDeviceIdentifier;
+ (double)mainScreenScale;
+ (id)productBuildVersion;
+ (id)productVersion;
+ (int)deviceClass;
- (NAUIDeviceUtilities)init;
@end

@implementation NAUIDeviceUtilities

+ (BOOL)naui_isPad
{
  v2 = [MEMORY[0x263F1C5C0] currentDevice];
  BOOL v3 = [v2 userInterfaceIdiom] == 1;

  return v3;
}

+ (BOOL)naui_shouldUseLargeiPadLayout
{
  BOOL v3 = [MEMORY[0x263F1C408] sharedApplication];
  v4 = [v3 keyWindow];
  [v4 frame];
  double v6 = v5;
  double v8 = v7;

  return objc_msgSend(a1, "naui_shouldUseLargeiPadLayoutForSize:", v6, v8);
}

+ (BOOL)naui_shouldUseLargeiPadLayoutForSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  BOOL result = objc_msgSend(a1, "naui_isPad");
  if (width >= height) {
    double v6 = height;
  }
  else {
    double v6 = width;
  }
  if (v6 <= 768.0) {
    return 0;
  }
  return result;
}

+ (BOOL)naui_isUsingLandscapeOrientation
{
  v2 = [MEMORY[0x263F1C408] sharedApplication];
  BOOL v3 = (unint64_t)([v2 statusBarOrientation] - 3) < 2;

  return v3;
}

- (NAUIDeviceUtilities)init
{
  return 0;
}

+ (id)productVersion
{
  if (productVersion___once != -1) {
    dispatch_once(&productVersion___once, &__block_literal_global_0);
  }
  v2 = (void *)[(id)productVersion___value copy];
  return v2;
}

uint64_t __37__NAUIDeviceUtilities_productVersion__block_invoke()
{
  productVersion___value = MGCopyAnswer();
  return MEMORY[0x270F9A758]();
}

+ (id)productBuildVersion
{
  if (productBuildVersion___once != -1) {
    dispatch_once(&productBuildVersion___once, &__block_literal_global_4);
  }
  v2 = (void *)[(id)productBuildVersion___value copy];
  return v2;
}

uint64_t __42__NAUIDeviceUtilities_productBuildVersion__block_invoke()
{
  productBuildVersion___value = MGCopyAnswer();
  return MEMORY[0x270F9A758]();
}

+ (NSString)productType
{
  if (productType___once != -1) {
    dispatch_once(&productType___once, &__block_literal_global_9_0);
  }
  v2 = (void *)[(id)productType___value copy];
  return (NSString *)v2;
}

uint64_t __34__NAUIDeviceUtilities_productType__block_invoke()
{
  productType___value = MGCopyAnswer();
  return MEMORY[0x270F9A758]();
}

+ (NSString)productHardwareModel
{
  if (productHardwareModel___once != -1) {
    dispatch_once(&productHardwareModel___once, &__block_literal_global_14_0);
  }
  v2 = (void *)[(id)productHardwareModel___value copy];
  return (NSString *)v2;
}

uint64_t __43__NAUIDeviceUtilities_productHardwareModel__block_invoke()
{
  productHardwareModel___value = MGCopyAnswer();
  return MEMORY[0x270F9A758]();
}

+ (NSString)productHardwareModelName
{
  if (productHardwareModelName___once != -1) {
    dispatch_once(&productHardwareModelName___once, &__block_literal_global_19);
  }
  v2 = (void *)[(id)productHardwareModelName___value copy];
  return (NSString *)v2;
}

uint64_t __47__NAUIDeviceUtilities_productHardwareModelName__block_invoke()
{
  productHardwareModelName___value = MGCopyAnswer();
  return MEMORY[0x270F9A758]();
}

+ (NSString)productClass
{
  if (productClass___once != -1) {
    dispatch_once(&productClass___once, &__block_literal_global_24);
  }
  v2 = (void *)[(id)productClass___value copy];
  return (NSString *)v2;
}

uint64_t __35__NAUIDeviceUtilities_productClass__block_invoke()
{
  productClass___value = MGCopyAnswer();
  return MEMORY[0x270F9A758]();
}

+ (int)deviceClass
{
  if (deviceClass___once != -1) {
    dispatch_once(&deviceClass___once, &__block_literal_global_29);
  }
  return deviceClass___value;
}

void __34__NAUIDeviceUtilities_deviceClass__block_invoke()
{
  v0 = (void *)MGCopyAnswer();
  int v1 = [v0 intValue];
  if (v0) {
    CFRelease(v0);
  }
  if ((v1 - 1) > 5) {
    int v2 = -1;
  }
  else {
    int v2 = dword_2227BC1A8[v1 - 1];
  }
  deviceClass___value = v2;
}

+ (NSString)localizedProductName
{
  if (localizedProductName___once != -1) {
    dispatch_once(&localizedProductName___once, &__block_literal_global_34);
  }
  int v2 = (void *)[(id)localizedProductName___value copy];
  return (NSString *)v2;
}

uint64_t __43__NAUIDeviceUtilities_localizedProductName__block_invoke()
{
  localizedProductName___value = MGCopyAnswer();
  return MEMORY[0x270F9A758]();
}

+ (NSString)operatingSystemName
{
  if (operatingSystemName___once != -1) {
    dispatch_once(&operatingSystemName___once, &__block_literal_global_39);
  }
  int v2 = (void *)[(id)operatingSystemName___value copy];
  return (NSString *)v2;
}

uint64_t __42__NAUIDeviceUtilities_operatingSystemName__block_invoke()
{
  operatingSystemName___value = MGCopyAnswer();
  return MEMORY[0x270F9A758]();
}

+ (NSString)uniqueDeviceIdentifier
{
  if (uniqueDeviceIdentifier___once != -1) {
    dispatch_once(&uniqueDeviceIdentifier___once, &__block_literal_global_44);
  }
  int v2 = (void *)[(id)uniqueDeviceIdentifier___value copy];
  return (NSString *)v2;
}

uint64_t __45__NAUIDeviceUtilities_uniqueDeviceIdentifier__block_invoke()
{
  uniqueDeviceIdentifier___value = MGCopyAnswer();
  return MEMORY[0x270F9A758]();
}

+ (BOOL)hasOrbCapability
{
  if (hasOrbCapability___once != -1) {
    dispatch_once(&hasOrbCapability___once, &__block_literal_global_49);
  }
  return hasOrbCapability___value;
}

uint64_t __39__NAUIDeviceUtilities_hasOrbCapability__block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  hasOrbCapability___value = result;
  return result;
}

+ (double)mainScreenScale
{
  if (mainScreenScale___once != -1) {
    dispatch_once(&mainScreenScale___once, &__block_literal_global_54);
  }
  return *(double *)&mainScreenScale_mainScreenScale;
}

void __38__NAUIDeviceUtilities_mainScreenScale__block_invoke()
{
  id v1 = [MEMORY[0x263F1C920] mainScreen];
  [v1 scale];
  mainScreenScale_mainScreenScale = v0;
}

@end