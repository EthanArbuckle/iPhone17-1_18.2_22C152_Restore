@interface SBSUIProximityReaderSceneExtension
+ (id)clientSettingsExtensions;
+ (id)hostComponents;
@end

@implementation SBSUIProximityReaderSceneExtension

+ (id)hostComponents
{
  v4[3] = *MEMORY[0x1E4F143B8];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  v4[2] = objc_opt_class();
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:3];
  return v2;
}

+ (id)clientSettingsExtensions
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = objc_opt_class();
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  return v2;
}

@end