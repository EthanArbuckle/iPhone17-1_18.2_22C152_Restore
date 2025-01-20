@interface PLSpotlightDonationUtilities
+ (BOOL)isUniversalSearchEnabledForPhotoLibrary:(id)a3;
+ (BOOL)shouldDisablePhotosLegacySearchDonation;
+ (BOOL)shouldUseSpotlightPrivateIndexForLibraryIdentifier:(int64_t)a3;
+ (BOOL)spotlightPrivateIndexEnabled;
+ (id)bundleIdentifierForAsset:(id)a3;
+ (id)bundleIdentifierForAsset:(id)a3 wellKnownLibraryIdentifier:(int64_t)a4;
+ (id)domainIdentifierForPhotoLibraryIdentifier:(int64_t)a3;
+ (id)photosBundleIdentifier;
+ (id)spotlightUniqueIdentifierForAsset:(id)a3;
+ (int64_t)wellKnownPhotoLibraryIdentifierFromPLPhotoLibrary:(id)a3;
+ (unint64_t)universalSearchIneligibilityReasonsForPhotoLibraryWithURL:(id)a3;
@end

@implementation PLSpotlightDonationUtilities

+ (BOOL)shouldDisablePhotosLegacySearchDonation
{
  return _os_feature_enabled_impl();
}

+ (unint64_t)universalSearchIneligibilityReasonsForPhotoLibraryWithURL:(id)a3
{
  return 0;
}

+ (BOOL)isUniversalSearchEnabledForPhotoLibrary:(id)a3
{
  v3 = [a3 libraryServicesManager];
  uint64_t v4 = [v3 wellKnownPhotoLibraryIdentifier];

  return ((v4 - 1) & 0xFFFFFFFFFFFFFFFDLL) == 0;
}

+ (BOOL)shouldUseSpotlightPrivateIndexForLibraryIdentifier:(int64_t)a3
{
  if ((unint64_t)a3 > 1) {
    return 0;
  }
  else {
    return [a1 spotlightPrivateIndexEnabled];
  }
}

+ (BOOL)spotlightPrivateIndexEnabled
{
  return 0;
}

+ (id)spotlightUniqueIdentifierForAsset:(id)a3
{
  id v4 = a3;
  v5 = [v4 photoLibrary];
  uint64_t v6 = [a1 wellKnownPhotoLibraryIdentifierFromPLPhotoLibrary:v5];

  if (v6 == 3)
  {
    v7 = [v4 additionalAttributes];

    v8 = [v7 syndicationIdentifier];
    id v4 = v7;
  }
  else
  {
    v8 = [v4 uuid];
  }

  return v8;
}

+ (id)domainIdentifierForPhotoLibraryIdentifier:(int64_t)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  switch(a3)
  {
    case 0:
      return @"com.apple.mobileslideshow.search";
    case 2:
      id v4 = PLSearchBackendDonationsGetLog();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        v5 = @"messages photolibrary";
        int v6 = 138543362;
        v7 = @"messages photolibrary";
        _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_ERROR, "Unsupported PhotoLibrary: %{public}@", (uint8_t *)&v6, 0xCu);
      }
      return 0;
    case 1:
      return @"com.apple.mobileslideshow.search";
    default:
      return 0;
  }
}

+ (id)bundleIdentifierForAsset:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 photoLibrary];
  if (v5)
  {
    int v6 = objc_msgSend(a1, "bundleIdentifierForAsset:wellKnownLibraryIdentifier:", v4, objc_msgSend(a1, "wellKnownPhotoLibraryIdentifierFromPLPhotoLibrary:", v5));
  }
  else
  {
    v7 = PLSearchBackendDonationsGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = [v4 uuid];
      int v10 = 138543362;
      v11 = v8;
      _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_ERROR, "No PhotoLibrary for asset %{public}@", (uint8_t *)&v10, 0xCu);
    }
    int v6 = 0;
  }

  return v6;
}

+ (id)bundleIdentifierForAsset:(id)a3 wellKnownLibraryIdentifier:(int64_t)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  int v6 = v5;
  if ((unint64_t)a4 < 2)
  {
    v7 = @"com.apple.mobileslideshow";
  }
  else
  {
    if (a4 == 2)
    {
      uint64_t v8 = PLSearchBackendDonationsGetLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v9 = @"messages photolibrary";
        int v11 = 138412290;
        uint64_t v12 = @"messages photolibrary";
        _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_ERROR, "Unsupported library identifier: %@", (uint8_t *)&v11, 0xCu);
      }
    }
    else if (a4 == 3)
    {
      v7 = [v5 importedByBundleIdentifier];
      goto LABEL_10;
    }
    v7 = 0;
  }
LABEL_10:

  return v7;
}

+ (int64_t)wellKnownPhotoLibraryIdentifierFromPLPhotoLibrary:(id)a3
{
  id v3 = a3;
  id v4 = [v3 libraryServicesManager];
  id v5 = v4;
  if (v4)
  {
    int64_t v6 = [v4 wellKnownPhotoLibraryIdentifier];
  }
  else
  {
    v7 = (void *)MEMORY[0x1E4F8B980];
    uint64_t v8 = [v3 pathManager];
    v9 = [v8 libraryURL];
    int64_t v6 = [v7 wellKnownPhotoLibraryIdentifierForURL:v9];

    if (!v6)
    {
      int v10 = [v3 pathManager];
      unsigned int v11 = [v10 isSystemPhotoLibraryPathManager];

      int64_t v6 = v11;
    }
  }

  return v6;
}

+ (id)photosBundleIdentifier
{
  return @"com.apple.mobileslideshow";
}

@end