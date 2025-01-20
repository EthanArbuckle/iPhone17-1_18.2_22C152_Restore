@interface PLSpotlightAlbumTranslator
+ (id)_keyAssetUUIDForAlbum:(id)a3;
+ (id)spotlightSearchableItemFromAlbum:(id)a3;
@end

@implementation PLSpotlightAlbumTranslator

+ (id)_keyAssetUUIDForAlbum:(id)a3
{
  id v3 = a3;
  v4 = [v3 keyAssets];
  v5 = [v4 firstObject];

  if (!v5)
  {
    v6 = [v3 assets];
    v5 = [v6 firstObject];
  }
  v7 = [v5 uuid];

  return v7;
}

+ (id)spotlightSearchableItemFromAlbum:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2, a1, @"PLSpotlightAlbumTranslator.m", 24, @"Invalid parameter not satisfying: %@", @"album" object file lineNumber description];
  }
  v6 = [a1 _keyAssetUUIDForAlbum:v5];
  if ([v6 length])
  {
    v7 = objc_opt_new();
    v8 = [v5 localizedTitle];
    if (v8)
    {
      [v7 setPhotosTitle:v8];
    }
    else
    {
      v12 = [v5 title];
      [v7 setPhotosTitle:v12];
    }
    [v7 setPhotosResultType:@"com.apple.photos.search.result.collection.album"];
    v13 = [v5 photoLibrary];
    v14 = [v13 libraryServicesManager];
    if ([v14 wellKnownPhotoLibraryIdentifier] == 3) {
      goto LABEL_17;
    }
    v15 = [v7 photosTitle];
    uint64_t v16 = [v15 length];

    if (v16)
    {
      if ([v5 kindValue] == 2)
      {
        v13 = [v5 uuid];
        v14 = PLServicesLocalizedFrameworkString();
        v17 = [v7 photosTitle];
        v18 = @"AlbumEntity";
LABEL_16:
        +[PLSpotlightTranslatorUtilities tagCSSearchableItem:v7 entityInstanceIdentifier:v13 typeIdentifier:v18 typeDisplayName:v14 displayTitle:v17 displaySubtitle:0];

LABEL_17:
        goto LABEL_18;
      }
      if ([v5 kindValue] == 1505)
      {
        v13 = [v5 uuid];
        v14 = PLServicesLocalizedFrameworkString();
        v17 = [v7 photosTitle];
        v18 = @"SharedAlbumEntity";
        goto LABEL_16;
      }
    }
LABEL_18:
    v19 = [v5 photoLibrary];
    v20 = [v19 libraryServicesManager];
    v21 = +[PLSpotlightDonationUtilities domainIdentifierForPhotoLibraryIdentifier:](PLSpotlightDonationUtilities, "domainIdentifierForPhotoLibraryIdentifier:", [v20 wellKnownPhotoLibraryIdentifier]);

    id v22 = objc_alloc(MEMORY[0x1E4F23840]);
    v23 = [v5 uuid];
    v11 = (void *)[v22 initWithUniqueIdentifier:v23 domainIdentifier:v21 attributeSet:v7];

    goto LABEL_19;
  }
  v9 = PLSearchBackendModelTranslationGetLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    v10 = [v5 uuid];
    *(_DWORD *)buf = 138412290;
    v27 = v10;
    _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_ERROR, "No assets found for Album. Not translating Album: %@", buf, 0xCu);
  }
  v11 = 0;
LABEL_19:

  return v11;
}

@end