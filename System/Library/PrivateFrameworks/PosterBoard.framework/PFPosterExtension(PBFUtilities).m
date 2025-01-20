@interface PFPosterExtension(PBFUtilities)
- (uint64_t)pbf_supportsGalleryOrUserDefaultsHasItOverriddenToSupportGallery:()PBFUtilities;
@end

@implementation PFPosterExtension(PBFUtilities)

- (uint64_t)pbf_supportsGalleryOrUserDefaultsHasItOverriddenToSupportGallery:()PBFUtilities
{
  v5 = [a1 posterExtensionInfoPlist];
  char v6 = objc_msgSend(v5, "pbf_supportsGallery");

  if (v6) {
    return 1;
  }
  v8 = [a1 posterExtensionBundleIdentifier];
  v9 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  v10 = [v9 stringArrayForKey:@"ShowSamplePoster"];
  uint64_t v7 = [v10 containsObject:v8];

  if (a3) {
    *a3 = v7;
  }

  return v7;
}

@end