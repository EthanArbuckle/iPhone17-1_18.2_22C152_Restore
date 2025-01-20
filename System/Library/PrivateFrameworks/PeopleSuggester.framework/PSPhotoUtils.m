@interface PSPhotoUtils
@end

@implementation PSPhotoUtils

void __40___PSPhotoUtils_prewarmPhotosFrameworks__block_invoke()
{
  v0 = [MEMORY[0x1E4F28B50] mainBundle];
  v1 = [v0 bundleIdentifier];
  v2 = +[_PSConstants mobileCoreDuetBundleId];
  int v3 = [v1 isEqual:v2];

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E4F93B10];
    [v4 runBlockWhenDeviceIsClassCUnlocked:&__block_literal_global_197];
  }
}

void __40___PSPhotoUtils_prewarmPhotosFrameworks__block_invoke_2()
{
  v0 = [MEMORY[0x1E4F93B18] autoreleasingSerialQueueWithLabel:"_PSPhotoUtils prewarm" qosClass:9];
  dispatch_async(v0, &__block_literal_global_201);
}

void __40___PSPhotoUtils_prewarmPhotosFrameworks__block_invoke_3()
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2050000000;
  v0 = (void *)getPHPhotoLibraryClass_softClass;
  uint64_t v8 = getPHPhotoLibraryClass_softClass;
  if (!getPHPhotoLibraryClass_softClass)
  {
    PhotosLibraryCore();
    v6[3] = (uint64_t)objc_getClass("PHPhotoLibrary");
    getPHPhotoLibraryClass_softClass = v6[3];
    v0 = (void *)v6[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v5, 8);
  v2 = [v1 sharedPhotoLibrary];
  [v2 isCloudPhotoLibraryEnabled];
  int v3 = (void *)[objc_alloc((Class)getPFSceneTaxonomyClass()) initWithLatestTaxonomy];
  id v4 = (id)[v3 digest];
}

@end