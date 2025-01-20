@interface NTKUpNextPhotosSampleDataSource
+ (id)bundleIdentifier;
- (id)supportedSections;
- (void)getElementsInSection:(id)a3 withHandler:(id)a4;
@end

@implementation NTKUpNextPhotosSampleDataSource

+ (id)bundleIdentifier
{
  return @"com.apple.NanoPhotos";
}

- (id)supportedSections
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = *MEMORY[0x1E4F94A10];
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];

  return v2;
}

- (void)getElementsInSection:(id)a3 withHandler:(id)a4
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  id v4 = a4;
  REUISampleRelevanceProviderForSamplePosition();
  objc_claimAutoreleasedReturnValue();
  NTKImageNamed(@"SG_Photo_Sample");
}

@end