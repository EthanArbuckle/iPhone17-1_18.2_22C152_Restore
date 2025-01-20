@interface PHFetchOptions(PhotosUICore)
+ (id)px_standardFetchOptions;
+ (void)px_defaultDetectionTypes;
@end

@implementation PHFetchOptions(PhotosUICore)

+ (void)px_defaultDetectionTypes
{
  return &unk_1F02D5638;
}

+ (id)px_standardFetchOptions
{
  v0 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
  v1 = objc_msgSend(v0, "px_standardLibrarySpecificFetchOptions");

  return v1;
}

@end