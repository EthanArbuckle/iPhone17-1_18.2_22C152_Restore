@interface PLSpotlightHighlightTranslator
+ (id)spotlightSearchableItemFromHighlight:(id)a3;
@end

@implementation PLSpotlightHighlightTranslator

+ (id)spotlightSearchableItemFromHighlight:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, a1, @"PLSpotlightHighlightTranslator.m", 24, @"Invalid parameter not satisfying: %@", @"highlight" object file lineNumber description];
  }
  if ([v5 isEligibleForSearchIndexing])
  {
    v6 = objc_opt_new();
    v7 = [v5 title];
    [v6 setPhotosTitle:v7];

    [v6 setPhotosResultType:@"com.apple.photos.search.result.collection.highlight"];
    v8 = [v5 photoLibrary];
    v9 = [v8 libraryServicesManager];
    v10 = +[PLSpotlightDonationUtilities domainIdentifierForPhotoLibraryIdentifier:](PLSpotlightDonationUtilities, "domainIdentifierForPhotoLibraryIdentifier:", [v9 wellKnownPhotoLibraryIdentifier]);

    id v11 = objc_alloc(MEMORY[0x1E4F23840]);
    v12 = [v5 uuid];
    v13 = (void *)[v11 initWithUniqueIdentifier:v12 domainIdentifier:v10 attributeSet:v6];
  }
  else
  {
    v14 = PLSearchBackendModelTranslationGetLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v15 = [v5 uuid];
      *(_DWORD *)buf = 138412290;
      v19 = v15;
      _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_INFO, "Unsupported Highlight. Not indexing Highlight: %@", buf, 0xCu);
    }
    v13 = 0;
  }

  return v13;
}

@end