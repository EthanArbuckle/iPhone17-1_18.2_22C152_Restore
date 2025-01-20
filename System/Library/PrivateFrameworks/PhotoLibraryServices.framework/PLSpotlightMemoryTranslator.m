@interface PLSpotlightMemoryTranslator
+ (id)spotlightSearchableItemFromMemory:(id)a3;
@end

@implementation PLSpotlightMemoryTranslator

+ (id)spotlightSearchableItemFromMemory:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a2, a1, @"PLSpotlightMemoryTranslator.m", 24, @"Invalid parameter not satisfying: %@", @"memory" object file lineNumber description];
  }
  if ([v5 isEligibleForSearchIndexing])
  {
    v6 = [v5 keyAsset];
    v7 = [v6 uuid];

    if ([v7 length])
    {
      v8 = objc_opt_new();
      [v8 setPhotosResultType:@"com.apple.photos.search.result.collection.memory"];
      v9 = [v5 title];
      v10 = [v9 stringByReplacingOccurrencesOfString:@"\n" withString:&stru_1EEB2EB80];
      [v8 setPhotosTitle:v10];

      v11 = [v5 photoLibrary];
      v12 = [v11 libraryServicesManager];
      if ([v12 wellKnownPhotoLibraryIdentifier] != 3)
      {
        v13 = [v8 photosTitle];
        uint64_t v14 = [v13 length];

        if (!v14)
        {
LABEL_9:
          v17 = [v5 photoLibrary];
          v18 = [v17 libraryServicesManager];
          v19 = +[PLSpotlightDonationUtilities domainIdentifierForPhotoLibraryIdentifier:](PLSpotlightDonationUtilities, "domainIdentifierForPhotoLibraryIdentifier:", [v18 wellKnownPhotoLibraryIdentifier]);

          id v20 = objc_alloc(MEMORY[0x1E4F23840]);
          v21 = [v5 uuid];
          v22 = (void *)[v20 initWithUniqueIdentifier:v21 domainIdentifier:v19 attributeSet:v8];

          goto LABEL_16;
        }
        v11 = [v5 uuid];
        v12 = PLServicesLocalizedFrameworkString();
        v15 = [v8 photosTitle];
        v16 = [v5 subtitle];
        +[PLSpotlightTranslatorUtilities tagCSSearchableItem:v8 entityInstanceIdentifier:v11 typeIdentifier:@"MemoryEntity" typeDisplayName:v12 displayTitle:v15 displaySubtitle:v16];
      }
      goto LABEL_9;
    }
    v23 = PLSearchBackendModelTranslationGetLog();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v24 = [v5 uuid];
      *(_DWORD *)buf = 138412290;
      v28 = v24;
      _os_log_impl(&dword_19B3C7000, v23, OS_LOG_TYPE_ERROR, "No assets found for Memory. Not indexing Memory: %@", buf, 0xCu);
    }
    goto LABEL_14;
  }
  v7 = PLSearchBackendModelTranslationGetLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v23 = [v5 uuid];
    *(_DWORD *)buf = 138412290;
    v28 = v23;
    _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_INFO, "Unsupported Memory. Not indexing Memory: %@", buf, 0xCu);
LABEL_14:
  }
  v22 = 0;
LABEL_16:

  return v22;
}

@end