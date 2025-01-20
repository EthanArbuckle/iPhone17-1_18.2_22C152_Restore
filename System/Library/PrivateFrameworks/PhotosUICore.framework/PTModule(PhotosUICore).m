@interface PTModule(PhotosUICore)
+ (id)px_restoreDefaultsSection;
@end

@implementation PTModule(PhotosUICore)

+ (id)px_restoreDefaultsSection
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F94160];
  v1 = (void *)MEMORY[0x1E4F940F8];
  v2 = [MEMORY[0x1E4F94170] actionWithSettingsKeyPath:0];
  v3 = [v1 rowWithTitle:@"Restore Defaults" action:v2];
  v7[0] = v3;
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  v5 = [v0 sectionWithRows:v4];

  return v5;
}

@end