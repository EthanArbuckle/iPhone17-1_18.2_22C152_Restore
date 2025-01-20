@interface SSPhotosResultBuilder
+ (BOOL)isCoreSpotlightResult;
+ (BOOL)supportsResult:(id)a3;
+ (id)bundleId;
- (BOOL)isSyndicated;
- (NSArray)classificationLabelIndices;
- (NSArray)classificationLabelSynonymIndices;
- (NSArray)classificationLabelSynonyms;
- (NSArray)classificationLabels;
- (NSArray)locationKeywordIndices;
- (NSArray)locationKeywords;
- (NSArray)matchedPeople;
- (NSArray)peopleInPhoto;
- (NSArray)photoSceneTypes;
- (NSArray)sceneLabelsIndex;
- (NSArray)scenePhotoIdentifiers;
- (NSArray)sceneSynonymsCounts;
- (NSArray)sceneSynonymsIndex;
- (NSDate)dateCreated;
- (NSString)photoIdentifier;
- (NSString)photosDescription;
- (SSPhotosResultBuilder)initWithResult:(id)a3;
- (id)appBundleId;
- (id)buildCommand;
- (id)buildDescriptions;
- (id)buildDetailedRowCardSection;
- (id)buildImageCardSection;
- (id)buildOneUpCommand;
- (id)buildResult;
- (id)buildThumbnail;
- (id)createSceneFrom:(id)a3;
- (id)getValidStringFromArray:(id)a3 withMatchedIndices:(id)a4;
- (id)scenes;
- (int)sfSceneTypeFrom:(int64_t)a3;
- (void)setClassificationLabelIndices:(id)a3;
- (void)setClassificationLabelSynonymIndices:(id)a3;
- (void)setClassificationLabelSynonyms:(id)a3;
- (void)setClassificationLabels:(id)a3;
- (void)setDateCreated:(id)a3;
- (void)setIsSyndicated:(BOOL)a3;
- (void)setLocationKeywordIndices:(id)a3;
- (void)setLocationKeywords:(id)a3;
- (void)setMatchedPeople:(id)a3;
- (void)setPeopleInPhoto:(id)a3;
- (void)setPhotoIdentifier:(id)a3;
- (void)setPhotoSceneTypes:(id)a3;
- (void)setPhotosDescription:(id)a3;
- (void)setSceneLabelsIndex:(id)a3;
- (void)setScenePhotoIdentifiers:(id)a3;
- (void)setSceneSynonymsCounts:(id)a3;
- (void)setSceneSynonymsIndex:(id)a3;
@end

@implementation SSPhotosResultBuilder

+ (id)bundleId
{
  return @"com.apple.mobileslideshow";
}

+ (BOOL)supportsResult:(id)a3
{
  id v3 = a3;
  if (supportsResult__onceToken_0 != -1) {
    dispatch_once(&supportsResult__onceToken_0, &__block_literal_global_52);
  }
  v4 = (void *)MEMORY[0x1E4F1CAD0];
  v5 = [v3 contentTypeTree];
  v6 = [v4 setWithArray:v5];

  v7 = [v3 sectionBundleIdentifier];
  if (!SSSectionIsSyndicatedPhotos(v7))
  {
    if (isMacOS())
    {
      v8 = [v3 applicationBundleIdentifier];
      int v9 = [v8 isEqualToString:@"com.apple.mobileslideshow"];

      if (v9) {
        goto LABEL_7;
      }
    }
    else
    {
    }
    char v10 = 0;
    goto LABEL_10;
  }

LABEL_7:
  char v10 = [v6 intersectsSet:supportsResult__photosContentTypes];
LABEL_10:

  return v10;
}

void __40__SSPhotosResultBuilder_supportsResult___block_invoke()
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  v1 = [(id)*MEMORY[0x1E4F44400] identifier];
  v6[0] = v1;
  v2 = [(id)*MEMORY[0x1E4F44448] identifier];
  v6[1] = v2;
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];
  uint64_t v4 = [v0 setWithArray:v3];
  v5 = (void *)supportsResult__photosContentTypes;
  supportsResult__photosContentTypes = v4;
}

+ (BOOL)isCoreSpotlightResult
{
  return 1;
}

- (SSPhotosResultBuilder)initWithResult:(id)a3
{
  id v4 = a3;
  v59.receiver = self;
  v59.super_class = (Class)SSPhotosResultBuilder;
  v5 = [(SSResultBuilder *)&v59 initWithResult:v4];
  if (v5)
  {
    if (initWithResult__onceToken != -1) {
      dispatch_once(&initWithResult__onceToken, &__block_literal_global_13_0);
    }
    v6 = [v4 valueForAttribute:*MEMORY[0x1E4F23310] withType:objc_opt_class()];
    v7 = [v6 firstObject];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v8 = v6;
    }
    else {
      v8 = 0;
    }
    id v9 = v8;

    char v10 = [v4 valueForAttribute:*MEMORY[0x1E4F232F8] withType:objc_opt_class()];
    v11 = [v10 firstObject];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v12 = v10;
    }
    else {
      v12 = 0;
    }
    id v13 = v12;

    v14 = [v4 valueForAttribute:*MEMORY[0x1E4F23308] withType:objc_opt_class()];
    v15 = objc_opt_new();
    v16 = objc_opt_new();
    v54[0] = MEMORY[0x1E4F143A8];
    v54[1] = 3221225472;
    v54[2] = __40__SSPhotosResultBuilder_initWithResult___block_invoke_2;
    v54[3] = &unk_1E635A3C8;
    id v53 = v9;
    id v55 = v53;
    id v17 = v15;
    id v56 = v17;
    id v51 = v14;
    id v57 = v51;
    id v18 = v16;
    id v58 = v18;
    [v13 enumerateObjectsUsingBlock:v54];

    v19 = [v4 valueForAttribute:*MEMORY[0x1E4F23338] withType:objc_opt_class()];
    v20 = [v4 valueForAttribute:*MEMORY[0x1E4F23368] withType:objc_opt_class()];
    uint64_t v47 = *MEMORY[0x1E4F23348];
    v21 = [v4 valueForAttribute:*MEMORY[0x1E4F23348] withType:objc_opt_class()];
    uint64_t v48 = *MEMORY[0x1E4F23360];
    v22 = [v4 valueForAttribute:*MEMORY[0x1E4F23360] withType:objc_opt_class()];
    v23 = [v4 valueForAttribute:*MEMORY[0x1E4F23358] withType:objc_opt_class()];
    v52 = v17;
    [(SSPhotosResultBuilder *)v5 setPeopleInPhoto:v17];
    v50 = v18;
    v24 = [v18 array];
    [(SSPhotosResultBuilder *)v5 setMatchedPeople:v24];

    v25 = [v19 firstObject];
    objc_opt_class();
    v49 = v19;
    if (objc_opt_isKindOfClass()) {
      v26 = v19;
    }
    else {
      v26 = 0;
    }
    [(SSPhotosResultBuilder *)v5 setScenePhotoIdentifiers:v26];

    v27 = [v20 firstObject];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v28 = v20;
    }
    else {
      v28 = 0;
    }
    [(SSPhotosResultBuilder *)v5 setPhotoSceneTypes:v28];

    v29 = [v21 firstObject];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v30 = v21;
    }
    else {
      v30 = 0;
    }
    [(SSPhotosResultBuilder *)v5 setSceneLabelsIndex:v30];

    v31 = [v22 firstObject];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v32 = v22;
    }
    else {
      v32 = 0;
    }
    [(SSPhotosResultBuilder *)v5 setSceneSynonymsIndex:v32];

    v33 = [v23 firstObject];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v34 = v23;
    }
    else {
      v34 = 0;
    }
    [(SSPhotosResultBuilder *)v5 setSceneSynonymsCounts:v34];

    v35 = (void *)initWithResult__syndicatedBundles;
    v36 = [(SSPhotosResultBuilder *)v5 appBundleId];
    -[SSPhotosResultBuilder setIsSyndicated:](v5, "setIsSyndicated:", [v35 containsObject:v36]);

    if (isMacOS()) {
      [v4 valueForAttribute:*MEMORY[0x1E4F22F38] withType:objc_opt_class()];
    }
    else {
    v37 = [v4 identifier];
    }
    [(SSPhotosResultBuilder *)v5 setPhotoIdentifier:v37];

    v38 = [v4 valueForAttribute:*MEMORY[0x1E4F22C38] withType:objc_opt_class()];
    [(SSPhotosResultBuilder *)v5 setDateCreated:v38];

    v39 = [v4 valueForAttribute:*MEMORY[0x1E4F23260] withType:objc_opt_class()];
    [(SSPhotosResultBuilder *)v5 setPhotosDescription:v39];

    v40 = [v4 valueForAttribute:*MEMORY[0x1E4F23340] withType:objc_opt_class()];
    [(SSPhotosResultBuilder *)v5 setClassificationLabels:v40];

    v41 = [v4 valueForAttribute:v47 withType:objc_opt_class()];
    [(SSPhotosResultBuilder *)v5 setClassificationLabelIndices:v41];

    v42 = [v4 valueForAttribute:*MEMORY[0x1E4F23350] withType:objc_opt_class()];
    [(SSPhotosResultBuilder *)v5 setClassificationLabelSynonyms:v42];

    v43 = [v4 valueForAttribute:v48 withType:objc_opt_class()];
    [(SSPhotosResultBuilder *)v5 setClassificationLabelSynonymIndices:v43];

    v44 = [v4 valueForAttribute:*MEMORY[0x1E4F232B0] withType:objc_opt_class()];
    [(SSPhotosResultBuilder *)v5 setLocationKeywords:v44];

    v45 = [v4 valueForAttribute:*MEMORY[0x1E4F232B8] withType:objc_opt_class()];
    [(SSPhotosResultBuilder *)v5 setLocationKeywordIndices:v45];
  }
  return v5;
}

void __40__SSPhotosResultBuilder_initWithResult___block_invoke()
{
  v2[5] = *MEMORY[0x1E4F143B8];
  v2[0] = @"com.apple.MobileSMS";
  v2[1] = @"com.apple.mobilenotes";
  v2[2] = @"com.apple.CloudDocs.MobileDocumentsFileProvider";
  v2[3] = @"com.apple.FileProvider.LocalStorage";
  v2[4] = @"com.apple.CloudDocs.iCloudDriveFileProvider";
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:5];
  v1 = (void *)initWithResult__syndicatedBundles;
  initWithResult__syndicatedBundles = v0;
}

void __40__SSPhotosResultBuilder_initWithResult___block_invoke_2(uint64_t a1, void *a2, unint64_t a3)
{
  id v5 = a2;
  id v9 = (id)objc_opt_new();
  [v9 setDisplayName:v5];

  if ([*(id *)(a1 + 32) count] <= a3)
  {
    [v9 setPhotosIdentifier:0];
  }
  else
  {
    v6 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a3];
    [v9 setPhotosIdentifier:v6];
  }
  [*(id *)(a1 + 40) addObject:v9];
  v7 = *(void **)(a1 + 48);
  v8 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a3];
  LODWORD(v7) = [v7 containsObject:v8];

  if (v7) {
    [*(id *)(a1 + 56) addObject:v9];
  }
}

- (id)appBundleId
{
  v2 = [(SSResultBuilder *)self result];
  id v3 = [v2 resultBundleId];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [v2 applicationBundleIdentifier];
  }
  v6 = v5;

  return v6;
}

- (id)buildResult
{
  v4.receiver = self;
  v4.super_class = (Class)SSPhotosResultBuilder;
  v2 = [(SSResultBuilder *)&v4 buildResult];
  [v2 setRenderHorizontallyWithOtherResultsInCategory:1];
  return v2;
}

- (id)buildImageCardSection
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v3 = [(SSPhotosResultBuilder *)self buildThumbnail];
  int v4 = isMacOS();
  double v5 = 170.0;
  if (v4) {
    double v5 = 72.5;
  }
  objc_msgSend(v3, "setSize:", v5, v5);
  v6 = objc_opt_new();
  [v6 setThumbnail:v3];
  if ([(SSResultBuilder *)self hasTextContentMatch])
  {
    v7 = objc_opt_new();
    [v7 setSymbolName:@"text.viewfinder"];
    [v7 setIsTemplate:1];
    v8 = objc_opt_new();
    [v6 setThumbnailOverlayText:v8];

    v23[0] = v7;
    id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
    char v10 = [v6 thumbnailOverlayText];
    [v10 setIcons:v9];
  }
  else
  {
    v11 = (void *)MEMORY[0x1E4F442D8];
    v12 = [(SSResultBuilder *)self result];
    id v13 = [v12 contentType];
    v14 = [v11 typeWithIdentifier:v13];
    int v15 = [v14 conformsToType:*MEMORY[0x1E4F44448]];

    if (!v15) {
      goto LABEL_9;
    }
    v16 = [(SSResultBuilder *)self result];
    v7 = [v16 valueForAttribute:*MEMORY[0x1E4F22D38] withType:objc_opt_class()];

    if (v7)
    {
      id v17 = (void *)MEMORY[0x1E4F9A378];
      [v7 doubleValue];
      id v18 = +[SSDateFormatManager stringFromTimeInterval:](SSDateFormatManager, "stringFromTimeInterval:");
      v19 = [v17 textWithString:v18];
      [v6 setThumbnailOverlayText:v19];
    }
  }

LABEL_9:
  v20 = [(SSResultBuilder *)self buildPreviewButtonItems];
  [v6 setPreviewButtonItems:v20];

  v21 = [(SSPhotosResultBuilder *)self appBundleId];
  [v6 setCommandDetail:v21];

  [(SSResultBuilder *)self buildDefaultPropertiesForCardSection:v6];
  return v6;
}

- (id)buildThumbnail
{
  id v3 = objc_opt_new();
  int v4 = [(SSPhotosResultBuilder *)self photoIdentifier];
  [v3 setPhotoIdentifier:v4];

  objc_msgSend(v3, "setIsSyndicated:", -[SSPhotosResultBuilder isSyndicated](self, "isSyndicated"));
  double v5 = [(SSPhotosResultBuilder *)self peopleInPhoto];
  [v3 setPeopleInPhoto:v5];

  return v3;
}

- (int)sfSceneTypeFrom:(int64_t)a3
{
  if ((unint64_t)a3 >= 4) {
    return 1;
  }
  else {
    return a3;
  }
}

- (id)buildDetailedRowCardSection
{
  v26[1] = *MEMORY[0x1E4F143B8];
  v24.receiver = self;
  v24.super_class = (Class)SSPhotosResultBuilder;
  id v3 = [(SSResultBuilder *)&v24 buildDetailedRowCardSection];
  int v4 = [(SSPhotosResultBuilder *)self dateCreated];

  if (v4)
  {
    double v5 = [(SSPhotosResultBuilder *)self dateCreated];
    int v4 = +[SSDateFormatManager fullDateTimeStringsFromDate:v5];
  }
  uint64_t v6 = [(SSResultBuilder *)self buildHighlightedMatchedTextWithTitle:0 headTruncation:1];
  if (v6)
  {
    v7 = (void *)v6;
    v8 = 0;
    int v9 = 0;
    goto LABEL_14;
  }
  char v10 = [(SSPhotosResultBuilder *)self locationKeywords];
  uint64_t v11 = [v10 count];

  if (v11)
  {
    v12 = [(SSPhotosResultBuilder *)self locationKeywords];
    id v13 = [(SSPhotosResultBuilder *)self locationKeywordIndices];
    v8 = [(SSPhotosResultBuilder *)self getValidStringFromArray:v12 withMatchedIndices:v13];

    if (v8)
    {
      int v9 = 0;
      goto LABEL_10;
    }
  }
  v14 = [v4 firstObject];
  uint64_t v15 = [v14 length];

  if (v15)
  {
    v8 = [v4 firstObject];
    int v9 = 1;
    if (v8)
    {
LABEL_10:
      v7 = [MEMORY[0x1E4F9A378] textWithString:v8];
      if (v7) {
        goto LABEL_14;
      }
    }
  }
  else
  {
    v8 = 0;
    int v9 = 0;
  }
  v23.receiver = self;
  v23.super_class = (Class)SSPhotosResultBuilder;
  v7 = [(SSResultBuilder *)&v23 buildTitle];
LABEL_14:
  [v3 setTitle:v7];
  if ([v4 count])
  {
    if (v9 && (unint64_t)[v4 count] >= 2)
    {
      v16 = (void *)MEMORY[0x1E4F9A378];
      id v17 = [v4 objectAtIndexedSubscript:1];
      id v18 = [v16 textWithString:v17];
      v26[0] = v18;
      v19 = (void **)v26;
    }
    else
    {
      v20 = (void *)MEMORY[0x1E4F9A378];
      id v17 = [v4 componentsJoinedByString:@" · "];
      id v18 = [v20 textWithString:v17];
      v25 = v18;
      v19 = &v25;
    }
    v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
    [v3 setDescriptions:v21];
  }
  return v3;
}

- (id)getValidStringFromArray:(id)a3 withMatchedIndices:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if ([v5 count])
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v7 = v6;
    v8 = (void *)[v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v15;
      while (2)
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v7);
          }
          uint64_t v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          unint64_t v12 = objc_msgSend(v11, "unsignedIntegerValue", (void)v14);
          if (v12 < [v5 count])
          {
            v8 = objc_msgSend(v5, "objectAtIndexedSubscript:", objc_msgSend(v11, "unsignedIntegerValue"));
            goto LABEL_12;
          }
        }
        v8 = (void *)[v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)buildDescriptions
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v3 = [(SSPhotosResultBuilder *)self dateCreated];

  if (v3)
  {
    int v4 = (void *)MEMORY[0x1E4F9A378];
    id v5 = [(SSPhotosResultBuilder *)self dateCreated];
    id v6 = +[SSDateFormatManager dynamicDateTimeStringsFromDate:v5];
    id v7 = [v6 componentsJoinedByString:@" · "];
    v8 = [v4 textWithString:v7];
    v12[0] = v8;
    uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)SSPhotosResultBuilder;
    uint64_t v9 = [(SSResultBuilder *)&v11 buildDescriptions];
  }
  return v9;
}

- (id)createSceneFrom:(id)a3
{
  unint64_t v4 = [a3 unsignedLongValue];
  id v5 = [(SSPhotosResultBuilder *)self scenePhotoIdentifiers];
  id v6 = [v5 objectAtIndex:v4];

  id v7 = objc_opt_new();
  v8 = [(SSPhotosResultBuilder *)self photoSceneTypes];
  uint64_t v9 = [v8 objectAtIndex:v4];
  int v10 = [v9 intValue];

  objc_msgSend(v7, "setSceneIdentifier:", objc_msgSend(v6, "unsignedLongLongValue"));
  objc_super v11 = [(SSPhotosResultBuilder *)self photoSceneTypes];
  if (v4 >= [v11 count]) {
    uint64_t v12 = 1;
  }
  else {
    uint64_t v12 = [(SSPhotosResultBuilder *)self sfSceneTypeFrom:v10];
  }
  [v7 setSceneType:v12];

  return v7;
}

- (id)scenes
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  v37 = objc_opt_new();
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id v3 = [(SSPhotosResultBuilder *)self sceneLabelsIndex];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v50 objects:v57 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v51;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v51 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v50 + 1) + 8 * i);
        unint64_t v9 = [v8 unsignedLongValue];
        int v10 = [(SSPhotosResultBuilder *)self scenePhotoIdentifiers];
        if (v9 >= [v10 count])
        {
        }
        else
        {
          char v11 = [v37 containsObject:v8];

          if ((v11 & 1) == 0) {
            [v37 addObject:v8];
          }
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v50 objects:v57 count:16];
    }
    while (v5);
  }

  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  obuint64_t j = [(SSPhotosResultBuilder *)self sceneSynonymsIndex];
  uint64_t v12 = [obj countByEnumeratingWithState:&v46 objects:v56 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v36 = *(void *)v47;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v47 != v36) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = [*(id *)(*((void *)&v46 + 1) + 8 * j) longValue];
        long long v42 = 0u;
        long long v43 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        long long v16 = [(SSPhotosResultBuilder *)self sceneSynonymsCounts];
        uint64_t v17 = [v16 countByEnumeratingWithState:&v42 objects:v55 count:16];
        if (v17)
        {
          uint64_t v18 = v17;
          uint64_t v19 = 0;
          uint64_t v20 = *(void *)v43;
          while (2)
          {
            uint64_t v21 = 0;
            uint64_t v22 = v19 + v18;
            do
            {
              if (*(void *)v43 != v20) {
                objc_enumerationMutation(v16);
              }
              v15 -= [*(id *)(*((void *)&v42 + 1) + 8 * v21) longValue];
              if (v15 < 0)
              {
                uint64_t v22 = v19 + v21;
                goto LABEL_28;
              }
              ++v21;
            }
            while (v18 != v21);
            uint64_t v18 = [v16 countByEnumeratingWithState:&v42 objects:v55 count:16];
            uint64_t v19 = v22;
            if (v18) {
              continue;
            }
            break;
          }
        }
        else
        {
          uint64_t v22 = 0;
        }
LABEL_28:

        objc_super v23 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLong:v22];
        unsigned int v24 = [v23 unsignedIntValue];
        v25 = [(SSPhotosResultBuilder *)self scenePhotoIdentifiers];
        if ([v25 count] <= (unint64_t)v24)
        {
        }
        else
        {
          char v26 = [v37 containsObject:v23];

          if ((v26 & 1) == 0) {
            [v37 addObject:v23];
          }
        }
      }
      uint64_t v13 = [obj countByEnumeratingWithState:&v46 objects:v56 count:16];
    }
    while (v13);
  }

  v27 = objc_opt_new();
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v28 = v37;
  uint64_t v29 = [v28 countByEnumeratingWithState:&v38 objects:v54 count:16];
  if (v29)
  {
    uint64_t v30 = v29;
    uint64_t v31 = *(void *)v39;
    do
    {
      for (uint64_t k = 0; k != v30; ++k)
      {
        if (*(void *)v39 != v31) {
          objc_enumerationMutation(v28);
        }
        v33 = [(SSPhotosResultBuilder *)self createSceneFrom:*(void *)(*((void *)&v38 + 1) + 8 * k)];
        [v27 addObject:v33];
      }
      uint64_t v30 = [v28 countByEnumeratingWithState:&v38 objects:v54 count:16];
    }
    while (v30);
  }

  return v27;
}

- (id)buildCommand
{
  if (buildCommand_onceToken_0 != -1) {
    dispatch_once(&buildCommand_onceToken_0, &__block_literal_global_40);
  }
  if (buildCommand_isSpotlight)
  {
    id v3 = [(SSPhotosResultBuilder *)self buildOneUpCommand];
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)SSPhotosResultBuilder;
    id v3 = [(SSResultBuilder *)&v5 buildCommand];
  }
  return v3;
}

void __37__SSPhotosResultBuilder_buildCommand__block_invoke()
{
  id v1 = [MEMORY[0x1E4F28B50] mainBundle];
  uint64_t v0 = [v1 bundleIdentifier];
  buildCommand_isSpotlight = [v0 isEqualToString:@"com.apple.Spotlight"];
}

- (id)buildOneUpCommand
{
  id v3 = [(SSPhotosResultBuilder *)self buildThumbnail];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = objc_opt_new();
    [v4 setPhotosLibraryImage:v3];
    objc_super v5 = [(SSPhotosResultBuilder *)self matchedPeople];
    [v4 setMatchedPeople:v5];

    uint64_t v6 = [(SSPhotosResultBuilder *)self scenes];
    [v4 setMatchedScenes:v6];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (NSArray)scenePhotoIdentifiers
{
  return self->_scenePhotoIdentifiers;
}

- (void)setScenePhotoIdentifiers:(id)a3
{
}

- (NSArray)photoSceneTypes
{
  return self->_photoSceneTypes;
}

- (void)setPhotoSceneTypes:(id)a3
{
}

- (NSArray)sceneSynonymsIndex
{
  return self->_sceneSynonymsIndex;
}

- (void)setSceneSynonymsIndex:(id)a3
{
}

- (NSArray)sceneSynonymsCounts
{
  return self->_sceneSynonymsCounts;
}

- (void)setSceneSynonymsCounts:(id)a3
{
}

- (NSArray)sceneLabelsIndex
{
  return self->_sceneLabelsIndex;
}

- (void)setSceneLabelsIndex:(id)a3
{
}

- (BOOL)isSyndicated
{
  return self->_isSyndicated;
}

- (void)setIsSyndicated:(BOOL)a3
{
  self->_isSyndicated = a3;
}

- (NSDate)dateCreated
{
  return self->_dateCreated;
}

- (void)setDateCreated:(id)a3
{
}

- (NSString)photosDescription
{
  return self->_photosDescription;
}

- (void)setPhotosDescription:(id)a3
{
}

- (NSString)photoIdentifier
{
  return self->_photoIdentifier;
}

- (void)setPhotoIdentifier:(id)a3
{
}

- (NSArray)classificationLabels
{
  return self->_classificationLabels;
}

- (void)setClassificationLabels:(id)a3
{
}

- (NSArray)classificationLabelSynonyms
{
  return self->_classificationLabelSynonyms;
}

- (void)setClassificationLabelSynonyms:(id)a3
{
}

- (NSArray)locationKeywords
{
  return self->_locationKeywords;
}

- (void)setLocationKeywords:(id)a3
{
}

- (NSArray)classificationLabelIndices
{
  return self->_classificationLabelIndices;
}

- (void)setClassificationLabelIndices:(id)a3
{
}

- (NSArray)classificationLabelSynonymIndices
{
  return self->_classificationLabelSynonymIndices;
}

- (void)setClassificationLabelSynonymIndices:(id)a3
{
}

- (NSArray)locationKeywordIndices
{
  return self->_locationKeywordIndices;
}

- (void)setLocationKeywordIndices:(id)a3
{
}

- (NSArray)peopleInPhoto
{
  return self->_peopleInPhoto;
}

- (void)setPeopleInPhoto:(id)a3
{
}

- (NSArray)matchedPeople
{
  return self->_matchedPeople;
}

- (void)setMatchedPeople:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_matchedPeople, 0);
  objc_storeStrong((id *)&self->_peopleInPhoto, 0);
  objc_storeStrong((id *)&self->_locationKeywordIndices, 0);
  objc_storeStrong((id *)&self->_classificationLabelSynonymIndices, 0);
  objc_storeStrong((id *)&self->_classificationLabelIndices, 0);
  objc_storeStrong((id *)&self->_locationKeywords, 0);
  objc_storeStrong((id *)&self->_classificationLabelSynonyms, 0);
  objc_storeStrong((id *)&self->_classificationLabels, 0);
  objc_storeStrong((id *)&self->_photoIdentifier, 0);
  objc_storeStrong((id *)&self->_photosDescription, 0);
  objc_storeStrong((id *)&self->_dateCreated, 0);
  objc_storeStrong((id *)&self->_sceneLabelsIndex, 0);
  objc_storeStrong((id *)&self->_sceneSynonymsCounts, 0);
  objc_storeStrong((id *)&self->_sceneSynonymsIndex, 0);
  objc_storeStrong((id *)&self->_photoSceneTypes, 0);
  objc_storeStrong((id *)&self->_scenePhotoIdentifiers, 0);
}

@end