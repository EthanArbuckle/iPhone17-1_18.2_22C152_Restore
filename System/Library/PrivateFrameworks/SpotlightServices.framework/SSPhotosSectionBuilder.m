@interface SSPhotosSectionBuilder
+ (id)supportedBundleIds;
+ (unint64_t)maxVisibleColumnsInPhotosSection;
- (BOOL)useHorizontallyScrollingCardSectionUI;
- (id)buildBridgedResult;
- (id)buildCardSectionWithResult:(id)a3 resultBuilder:(id)a4;
- (id)buildCardSections;
- (id)buildCollectionStyle;
- (int64_t)maxCardSections;
@end

@implementation SSPhotosSectionBuilder

+ (id)supportedBundleIds
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = @"com.apple.searchd.syndicatedPhotos";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  return v2;
}

+ (unint64_t)maxVisibleColumnsInPhotosSection
{
  if (maxVisibleColumnsInPhotosSection_onceToken != -1) {
    dispatch_once(&maxVisibleColumnsInPhotosSection_onceToken, &__block_literal_global);
  }
  return maxVisibleColumnsInPhotosSection_numPhotoColumns;
}

uint64_t __58__SSPhotosSectionBuilder_maxVisibleColumnsInPhotosSection__block_invoke()
{
  v0 = (void *)MGCopyAnswer();
  int v1 = [v0 intValue];
  if (v0) {
    CFRelease(v0);
  }
  uint64_t result = isMacOS();
  uint64_t v3 = 5;
  if (result) {
    uint64_t v3 = 8;
  }
  if (v1 == 3) {
    uint64_t v3 = 7;
  }
  maxVisibleColumnsInPhotosSection_numPhotoColumns = v3;
  return result;
}

- (id)buildCardSectionWithResult:(id)a3 resultBuilder:(id)a4
{
  return (id)objc_msgSend(a4, "buildHorizontallyScrollingCardSection", a3);
}

- (id)buildBridgedResult
{
  v4.receiver = self;
  v4.super_class = (Class)SSPhotosSectionBuilder;
  v2 = [(SSSectionBuilder *)&v4 buildBridgedResult];
  [v2 setType:3];
  return v2;
}

- (id)buildCollectionStyle
{
  uint64_t v3 = [(SSSectionBuilder *)self section];
  if ([(SSPhotosSectionBuilder *)self useHorizontallyScrollingCardSectionUI])
  {
    objc_super v4 = objc_opt_new();
    if (isMacOS() && (SSSnippetModernizationEnabled() & 1) == 0)
    {
      [v4 setNumberOfRows:1];
    }
    else
    {
      v5 = [v3 results];
      unint64_t v6 = [v5 count];
      if (v6 < 2 * [(id)objc_opt_class() maxVisibleColumnsInPhotosSection]) {
        uint64_t v7 = 1;
      }
      else {
        uint64_t v7 = 2;
      }
      [v4 setNumberOfRows:v7];
    }
  }
  else
  {
    objc_super v4 = objc_opt_new();
  }
  objc_msgSend(v4, "setInitiallyVisibleCardSectionCount:", objc_msgSend(v3, "maxInitiallyVisibleResults"));

  return v4;
}

- (id)buildCardSections
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  v28.receiver = self;
  v28.super_class = (Class)SSPhotosSectionBuilder;
  v2 = [(SSSectionBuilder *)&v28 buildCardSections];
  id v23 = [MEMORY[0x1E4F28E78] string];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v3 = v2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v24 objects:v31 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v25 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v9 = v8;
          v10 = [v9 thumbnail];
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();

          if (isKindOfClass)
          {
            v12 = [v9 thumbnail];
            v13 = [v12 photoIdentifier];
            uint64_t v14 = [v13 length];

            if (v14)
            {
              v15 = [v12 photoIdentifier];
              [v9 setCardSectionId:v15];

              v16 = [v12 photoIdentifier];
              [v23 appendString:v16];

              [v23 appendString:@" "];
            }
          }
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v24 objects:v31 count:16];
    }
    while (v5);
  }

  v17 = logForCSLogCategoryPhotosQU();
  os_signpost_id_t v18 = os_signpost_id_generate(v17);
  v19 = v17;
  v20 = v19;
  if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
  {
    uint64_t v21 = [v23 UTF8String];
    *(_DWORD *)buf = 136315138;
    uint64_t v30 = v21;
    _os_signpost_emit_with_name_impl(&dword_1BDB2A000, v20, OS_SIGNPOST_EVENT, v18, "ResultPhotos", "%{name=photoIdentifiers}s", buf, 0xCu);
  }

  return v3;
}

- (BOOL)useHorizontallyScrollingCardSectionUI
{
  if (SSSnippetModernizationEnabled()) {
    return 1;
  }
  v4.receiver = self;
  v4.super_class = (Class)SSPhotosSectionBuilder;
  return [(SSSectionBuilder *)&v4 useHorizontallyScrollingCardSectionUI];
}

- (int64_t)maxCardSections
{
  if (SSSnippetModernizationEnabled()) {
    return [(SSSectionBuilder *)&v5 maxCardSections];
  }
  if (!isMacOS()) {
    return [(SSSectionBuilder *)&v4 maxCardSections];
  }
  if ([(SSPhotosSectionBuilder *)self useHorizontallyScrollingCardSectionUI]) {
    return -1;
  }
  return 6;
}

@end