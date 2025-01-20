@interface PXHighlightDiagnosticsHelper
+ (BOOL)generateSectionTitles:(id *)a3 andTableContent:(id *)a4 forIndex:(int64_t)a5 sourceHighlight:(id)a6 sourceDictionary:(id)a7;
+ (id)preprocessDictionaryForHighlight:(id)a3 inPhotoLibrary:(id)a4;
@end

@implementation PXHighlightDiagnosticsHelper

+ (BOOL)generateSectionTitles:(id *)a3 andTableContent:(id *)a4 forIndex:(int64_t)a5 sourceHighlight:(id)a6 sourceDictionary:(id)a7
{
  v84[3] = *MEMORY[0x1E4F143B8];
  id v11 = a6;
  id v12 = a7;
  v13 = v12;
  if (a3) {
    BOOL v14 = a4 == 0;
  }
  else {
    BOOL v14 = 1;
  }
  BOOL v15 = !v14;
  if (!v14)
  {
    if (a5 == 3)
    {
      v39 = [v12 objectForKeyedSubscript:@"backingMoments"];
      v51 = objc_opt_new();
      v52 = objc_opt_new();
      v63[0] = MEMORY[0x1E4F143A8];
      v63[1] = 3221225472;
      v63[2] = __112__PXHighlightDiagnosticsHelper_generateSectionTitles_andTableContent_forIndex_sourceHighlight_sourceDictionary___block_invoke_3;
      v63[3] = &unk_1E5DBE2F8;
      v64 = v51;
      id v65 = v52;
      id v53 = v52;
      id v54 = v51;
      [v39 enumerateObjectsUsingBlock:v63];
      v49 = (__CFString *)v54;
      *a3 = v49;
      v50 = (__CFString *)v53;
      *a4 = v50;

      id v48 = v64;
LABEL_16:

      goto LABEL_17;
    }
    if (!a5)
    {
      [v12 objectForKeyedSubscript:@"debugInfo"];
      v16 = id v62 = v11;
      v84[0] = @"Generic";
      v84[1] = @"Enrichment";
      v84[2] = @"Graph Info";
      *a3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v84 count:3];
      v82[0] = @"Generic";
      v17 = [MEMORY[0x1E4F1CA48] array];
      v83[0] = v17;
      v82[1] = @"Enrichment";
      v18 = [MEMORY[0x1E4F1CA48] array];
      v83[1] = v18;
      v82[2] = @"Graph Info";
      v19 = [MEMORY[0x1E4F1CA48] array];
      v83[2] = v19;
      v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v83 forKeys:v82 count:3];
      v60 = (void *)[v20 mutableCopy];

      v21 = [v16 objectForKeyedSubscript:@"Enrichment Version"];
      v22 = [v16 objectForKeyedSubscript:@"Highlight Version"];
      int v23 = [v21 isEqual:v22];

      v24 = @"OUT-OF-DATE!!!";
      if (v23) {
        v24 = @"Up-to-Date";
      }
      v25 = v24;
      v59 = v25;
      v26 = [v16 objectForKeyedSubscript:@"Key Asset UUID"];
      BOOL v27 = v26 == 0;

      uint64_t v28 = [v16 objectForKeyedSubscript:@"Key Asset UUID"];
      v29 = (void *)v28;
      v30 = @"NO KEY ASSET!!!";
      if (v28) {
        v30 = (__CFString *)v28;
      }
      v61 = v30;

      v31 = [v16 objectForKeyedSubscript:@"Promotion Score"];
      [v31 doubleValue];
      BOOL v33 = v32 < 0.3;

      v80[0] = @"Is Up-to-Date";
      v80[1] = @"Key Asset UUID";
      v81[0] = v25;
      v81[1] = v61;
      v57 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v81 forKeys:v80 count:2];
      v78[0] = @"Is Up-to-Date";
      v34 = [NSNumber numberWithInt:v23 ^ 1u];
      v79[0] = v34;
      v78[1] = @"Key Asset UUID";
      v35 = [NSNumber numberWithInt:v27];
      v79[1] = v35;
      v78[2] = @"Promotion Score";
      v36 = [NSNumber numberWithBool:v33];
      v79[2] = v36;
      v56 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v79 forKeys:v78 count:3];

      v76[0] = @"Generic";
      v75[0] = @"UUID";
      v75[1] = @"Type";
      v75[2] = @"Kind";
      v75[3] = @"Category";
      v75[4] = @"Sharing Composition";
      v75[5] = @"Start Date (Local)";
      v75[6] = @"End Date (Local)";
      v75[7] = @"Start Date (UTC)";
      v75[8] = @"End Date (UTC)";
      v75[9] = @"Start TZ Offset";
      v75[10] = @"End TZ Offset";
      v75[11] = @"Number of Moments";
      v75[12] = @"Highlight Version";
      v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:v75 count:13];
      v76[1] = @"Enrichment";
      v77[0] = v37;
      v74[0] = @"Is Up-to-Date";
      v74[1] = @"Is Enriched";
      v74[2] = @"Enrichment State";
      v74[3] = @"Visibility State Private";
      v74[4] = @"Visibility State Shared";
      v74[5] = @"Visibility State Mixed";
      v74[6] = @"Enrichment Version";
      v74[7] = @"Title";
      v74[8] = @"Subtitle";
      v74[9] = @"Promotion Score";
      v74[10] = @"Meanings";
      v74[11] = @"Mood";
      v74[12] = @"Is Curated";
      v74[13] = @"Number of Assets";
      v74[14] = @"Key Asset UUID";
      v74[15] = @"Number of Curated Assets";
      v74[16] = @"Number of Extended Curated Assets";
      v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:v74 count:17];
      v77[1] = v38;
      v39 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v77 forKeys:v76 count:2];

      v69[0] = MEMORY[0x1E4F143A8];
      v69[1] = 3221225472;
      v69[2] = __112__PXHighlightDiagnosticsHelper_generateSectionTitles_andTableContent_forIndex_sourceHighlight_sourceDictionary___block_invoke;
      v69[3] = &unk_1E5DB2AD8;
      id v70 = v60;
      id v71 = v57;
      id v72 = v16;
      id v40 = v56;
      id v73 = v40;
      id v41 = v16;
      id v58 = v57;
      id v42 = v60;
      [v39 enumerateKeysAndObjectsUsingBlock:v69];
      v43 = [v42 objectForKeyedSubscript:@"Graph Info"];
      v44 = [v41 objectForKeyedSubscript:@"Graph Info"];
      v66[0] = MEMORY[0x1E4F143A8];
      v66[1] = 3221225472;
      v66[2] = __112__PXHighlightDiagnosticsHelper_generateSectionTitles_andTableContent_forIndex_sourceHighlight_sourceDictionary___block_invoke_2;
      v66[3] = &unk_1E5DCD770;
      id v67 = v40;
      id v68 = v43;
      id v45 = v43;
      id v46 = v40;
      [v44 enumerateKeysAndObjectsUsingBlock:v66];
      v47 = v42;
      id v11 = v62;
      id v48 = v47;
      *a4 = v48;

      v49 = v59;
      v50 = v61;

      goto LABEL_16;
    }
  }
LABEL_17:

  return v15;
}

void __112__PXHighlightDiagnosticsHelper_generateSectionTitles_andTableContent_forIndex_sourceHighlight_sourceDictionary___block_invoke(id *a1, void *a2, void *a3)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v24 = v5;
  uint64_t v28 = [a1[4] objectForKeyedSubscript:v5];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id obj = v6;
  uint64_t v30 = [obj countByEnumeratingWithState:&v31 objects:v39 count:16];
  if (v30)
  {
    uint64_t v29 = *(void *)v32;
    uint64_t v27 = *MEMORY[0x1E4FB06F8];
    double v7 = *MEMORY[0x1E4FB09C8];
    double v8 = *MEMORY[0x1E4FB09B8];
    uint64_t v26 = *MEMORY[0x1E4FB0700];
    do
    {
      for (uint64_t i = 0; i != v30; ++i)
      {
        if (*(void *)v32 != v29) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v31 + 1) + 8 * i);
        id v11 = [a1[5] objectForKeyedSubscript:v10];
        if (!v11)
        {
          id v11 = [a1[6] objectForKeyedSubscript:v10];
          if (!v11) {
            continue;
          }
        }
        id v12 = objc_alloc(MEMORY[0x1E4F28E48]);
        v13 = [NSString stringWithFormat:@"[ %@ ] ", v10];
        uint64_t v37 = v27;
        BOOL v14 = [MEMORY[0x1E4FB08E0] systemFontOfSize:15.0 weight:v7];
        v38 = v14;
        BOOL v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v38 forKeys:&v37 count:1];
        v16 = (void *)[v12 initWithString:v13 attributes:v15];

        id v17 = objc_alloc(MEMORY[0x1E4F28B18]);
        v18 = [NSString stringWithFormat:@"%@", v11];
        v35[0] = v27;
        v19 = [MEMORY[0x1E4FB08E0] systemFontOfSize:15.0 weight:v8];
        v35[1] = v26;
        v36[0] = v19;
        v20 = [a1[7] objectForKeyedSubscript:v10];
        if ([v20 BOOLValue]) {
          [MEMORY[0x1E4FB1618] redColor];
        }
        else {
        v21 = [MEMORY[0x1E4FB1618] labelColor];
        }
        v36[1] = v21;
        v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:v35 count:2];
        int v23 = (void *)[v17 initWithString:v18 attributes:v22];
        [v16 appendAttributedString:v23];

        [v28 addObject:v16];
      }
      uint64_t v30 = [obj countByEnumeratingWithState:&v31 objects:v39 count:16];
    }
    while (v30);
  }
}

void __112__PXHighlightDiagnosticsHelper_generateSectionTitles_andTableContent_forIndex_sourceHighlight_sourceDictionary___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = [v5 componentsJoinedByString:@", "];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      double v8 = NSString;
      [v5 doubleValue];
      objc_msgSend(v8, "stringWithFormat:", @"%.3f", v9);
    }
    else
    {
      [v5 description];
    uint64_t v7 = };
  }
  uint64_t v10 = (void *)v7;
  id v11 = objc_alloc(MEMORY[0x1E4F28E48]);
  id v12 = [NSString stringWithFormat:@"[ %@ ] ", v6];
  uint64_t v26 = *MEMORY[0x1E4FB06F8];
  uint64_t v13 = v26;
  BOOL v14 = [MEMORY[0x1E4FB08E0] systemFontOfSize:15.0 weight:*MEMORY[0x1E4FB09C8]];
  v27[0] = v14;
  BOOL v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:&v26 count:1];
  v16 = (void *)[v11 initWithString:v12 attributes:v15];

  id v17 = objc_alloc(MEMORY[0x1E4F28B18]);
  v24[0] = v13;
  v18 = [MEMORY[0x1E4FB08E0] systemFontOfSize:15.0 weight:*MEMORY[0x1E4FB09B8]];
  v25[0] = v18;
  v24[1] = *MEMORY[0x1E4FB0700];
  uint64_t v19 = a1;
  v20 = [*(id *)(a1 + 32) objectForKeyedSubscript:v6];

  if ([v20 BOOLValue]) {
    [MEMORY[0x1E4FB1618] redColor];
  }
  else {
  v21 = [MEMORY[0x1E4FB1618] labelColor];
  }
  v25[1] = v21;
  v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:2];
  int v23 = (void *)[v17 initWithString:v10 attributes:v22];
  [v16 appendAttributedString:v23];

  [*(id *)(v19 + 40) addObject:v16];
}

void __112__PXHighlightDiagnosticsHelper_generateSectionTitles_andTableContent_forIndex_sourceHighlight_sourceDictionary___block_invoke_3(uint64_t a1, void *a2, int a3)
{
  v37[4] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v30 = objc_msgSend(NSString, "stringWithFormat:", @"Moment %d", (a3 + 1));
  [v30 stringByAppendingString:@" - Scores"];
  long long v32 = v31 = a1;
  objc_msgSend(*(id *)(a1 + 32), "addObject:");
  id v6 = NSString;
  uint64_t v29 = [v5 objectForKeyedSubscript:@"numberOfAssets"];
  uint64_t v7 = objc_msgSend(v6, "stringWithFormat:", @"Asset Count: %lu", objc_msgSend(v29, "unsignedIntegerValue"));
  v37[0] = v7;
  double v8 = NSString;
  uint64_t v9 = [v5 objectForKeyedSubscript:@"curationScore"];
  [v9 floatValue];
  id v11 = objc_msgSend(v8, "stringWithFormat:", @"Curation: %.3f", v10);
  v37[1] = v11;
  id v12 = NSString;
  uint64_t v13 = [v5 objectForKeyedSubscript:@"graphScore"];
  [v13 floatValue];
  BOOL v15 = objc_msgSend(v12, "stringWithFormat:", @"Graph: %.3f", v14);
  v37[2] = v15;
  v16 = NSString;
  id v17 = [v5 objectForKeyedSubscript:@"neighborScore"];
  [v17 floatValue];
  uint64_t v19 = objc_msgSend(v16, "stringWithFormat:", @"Neighbor: %.3f", v18);
  v37[3] = v19;
  v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:4];
  v21 = (void *)[v20 mutableCopy];

  v22 = [v5 objectForKeyedSubscript:@"matchingScore"];

  if (v22)
  {
    int v23 = NSString;
    v24 = [v5 objectForKeyedSubscript:@"matchingScore"];
    [v24 floatValue];
    uint64_t v26 = objc_msgSend(v23, "stringWithFormat:", @"Matching: %.3f", v25);
    [v21 addObject:v26];
  }
  [*(id *)(v31 + 40) setObject:v21 forKeyedSubscript:v32];
  uint64_t v27 = [v5 objectForKeyedSubscript:@"keywords"];
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __112__PXHighlightDiagnosticsHelper_generateSectionTitles_andTableContent_forIndex_sourceHighlight_sourceDictionary___block_invoke_4;
  v33[3] = &unk_1E5DBE320;
  id v34 = v30;
  id v35 = *(id *)(v31 + 32);
  id v36 = *(id *)(v31 + 40);
  id v28 = v30;
  [v27 enumerateKeysAndObjectsUsingBlock:v33];
}

void __112__PXHighlightDiagnosticsHelper_generateSectionTitles_andTableContent_forIndex_sourceHighlight_sourceDictionary___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  if ([v5 count])
  {
    id v6 = [NSString stringWithFormat:@"%@ - %@", *(void *)(a1 + 32), v7];
    [*(id *)(a1 + 40) addObject:v6];
    [*(id *)(a1 + 48) setObject:v5 forKeyedSubscript:v6];
  }
}

+ (id)preprocessDictionaryForHighlight:(id)a3 inPhotoLibrary:(id)a4
{
  id v5 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init(v5);
  uint64_t v9 = [v7 localIdentifier];
  uint64_t v66 = 0;
  uint64_t v10 = [v6 highlightDebugInformationForHighlightWithLocalIdentifier:v9 error:&v66];

  v60 = v8;
  v63 = (void *)v10;
  [v8 addEntriesFromDictionary:v10];
  id v11 = [v6 librarySpecificFetchOptions];
  [v11 setShouldPrefetchCount:1];
  id v12 = [MEMORY[0x1E4F38EB8] fetchAssetsInAssetCollection:v7 options:v11];
  v61 = [MEMORY[0x1E4F38EB8] fetchKeyCuratedAssetInAssetCollection:v7 referenceAsset:0];
  [v11 setHighlightCurationType:1];
  id v65 = [MEMORY[0x1E4F38EB8] fetchAssetsInAssetCollection:v7 options:v11];
  [v11 setHighlightCurationType:2];
  uint64_t v13 = [MEMORY[0x1E4F38EB8] fetchAssetsInAssetCollection:v7 options:v11];
  float v14 = [v7 uuid];
  BOOL v15 = [v6 librarySpecificFetchOptions];

  v16 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"highlight.uuid == %@", v14];
  [v15 setInternalPredicate:v16];

  [v15 setShouldPrefetchCount:1];
  id v62 = v15;
  v64 = [MEMORY[0x1E4F38EE8] fetchMomentsWithOptions:v15];
  id v17 = [MEMORY[0x1E4F1CA60] dictionary];
  [v17 setObject:v14 forKeyedSubscript:@"UUID"];
  float v18 = [v7 localizedTitle];
  [v17 setObject:v18 forKeyedSubscript:@"Title"];

  uint64_t v19 = [v7 localizedSubtitle];
  v20 = [v19 stringByReplacingOccurrencesOfString:@"\n" withString:@"\\n"];
  [v17 setObject:v20 forKeyedSubscript:@"Subtitle"];

  id v21 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v22 = [MEMORY[0x1E4F1CAF0] timeZoneWithName:@"UTC"];
  [v21 setTimeZone:v22];

  [v21 setDateStyle:1];
  [v21 setTimeStyle:2];
  int v23 = [v7 startDate];
  v24 = [v21 stringFromDate:v23];
  [v17 setObject:v24 forKeyedSubscript:@"Start Date (UTC)"];

  float v25 = [v7 endDate];
  uint64_t v26 = [v21 stringFromDate:v25];
  [v17 setObject:v26 forKeyedSubscript:@"End Date (UTC)"];

  uint64_t v27 = [v7 localStartDate];
  id v28 = [v21 stringFromDate:v27];
  [v17 setObject:v28 forKeyedSubscript:@"Start Date (Local)"];

  uint64_t v29 = [v7 localEndDate];
  uint64_t v30 = [v21 stringFromDate:v29];
  [v17 setObject:v30 forKeyedSubscript:@"End Date (Local)"];

  uint64_t v31 = objc_msgSend(NSString, "stringWithFormat:", @"%+0.1f hours", (double)objc_msgSend(v7, "startTimeZoneOffset") / 3600.0);
  [v17 setObject:v31 forKeyedSubscript:@"Start TZ Offset"];

  long long v32 = objc_msgSend(NSString, "stringWithFormat:", @"%+0.1f hours", (double)objc_msgSend(v7, "endTimeZoneOffset") / 3600.0);
  [v17 setObject:v32 forKeyedSubscript:@"End TZ Offset"];

  [v7 type];
  long long v33 = PHShortDescriptionForPhotosHighlightType();
  [v17 setObject:v33 forKeyedSubscript:@"Type"];

  [v7 kind];
  id v34 = PHShortDescriptionForPhotosHighlightKind();
  [v17 setObject:v34 forKeyedSubscript:@"Kind"];

  [v7 category];
  id v35 = PHShortDescriptionForPhotosHighlightCategory();
  [v17 setObject:v35 forKeyedSubscript:@"Category"];

  [v7 sharingComposition];
  id v36 = PHDescriptionForSharingComposition();
  [v17 setObject:v36 forKeyedSubscript:@"Sharing Composition"];

  uint64_t v37 = NSString;
  [v7 promotionScore];
  v39 = objc_msgSend(v37, "stringWithFormat:", @"%.3f", v38);
  [v17 setObject:v39 forKeyedSubscript:@"Promotion Score"];

  if ([v7 isEnriched]) {
    uint64_t v40 = @"YES";
  }
  else {
    uint64_t v40 = @"NO";
  }
  [v17 setObject:v40 forKeyedSubscript:@"Is Enriched"];
  [v7 enrichmentState];
  id v41 = PHShortDescriptionForPhotosHighlightEnrichmentState();
  [v17 setObject:v41 forKeyedSubscript:@"Enrichment State"];

  [v7 visibilityState];
  id v42 = PHShortDescriptionForPhotosHighlightVisibilityState();
  [v17 setObject:v42 forKeyedSubscript:@"Visibility State Private"];

  [v7 visibilityStateShared];
  v43 = PHShortDescriptionForPhotosHighlightVisibilityState();
  [v17 setObject:v43 forKeyedSubscript:@"Visibility State Shared"];

  [v7 visibilityStateMixed];
  v44 = PHShortDescriptionForPhotosHighlightVisibilityState();
  [v17 setObject:v44 forKeyedSubscript:@"Visibility State Mixed"];

  [v7 mood];
  id v45 = PHStringForMemoryMood();
  [v17 setObject:v45 forKeyedSubscript:@"Mood"];

  id v46 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v12, "count"));
  [v17 setObject:v46 forKeyedSubscript:@"Number of Assets"];

  v47 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v13, "count"));
  [v17 setObject:v47 forKeyedSubscript:@"Number of Extended Curated Assets"];

  id v48 = [v61 firstObject];
  v49 = [v48 uuid];
  [v17 setObject:v49 forKeyedSubscript:@"Key Asset UUID"];

  v50 = objc_msgSend(NSNumber, "numberWithShort:", objc_msgSend(v7, "highlightVersion"));
  [v17 setObject:v50 forKeyedSubscript:@"Highlight Version"];

  v51 = objc_msgSend(NSNumber, "numberWithShort:", objc_msgSend(v7, "enrichmentVersion"));
  [v17 setObject:v51 forKeyedSubscript:@"Enrichment Version"];

  int v52 = [v7 kind];
  if (v52 != 3)
  {
    if (v52) {
      goto LABEL_8;
    }
    id v53 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v64, "count"));
    [v17 setObject:v53 forKeyedSubscript:@"Number of Moments"];
  }
  id v54 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v65, "count"));
  [v17 setObject:v54 forKeyedSubscript:@"Number of Curated Assets"];

LABEL_8:
  v55 = [v63 objectForKeyedSubscript:@"sortedMeaningLabels"];
  v56 = v55;
  if (v55)
  {
    v57 = [v55 componentsJoinedByString:@", "];
    [v17 setObject:v57 forKeyedSubscript:@"Meanings"];
  }
  else
  {
    [v17 setObject:@"-" forKeyedSubscript:@"Meanings"];
  }
  id v58 = [v63 objectForKeyedSubscript:@"collectionsInfo"];
  if (v58) {
    [v17 setObject:v58 forKeyedSubscript:@"Graph Info"];
  }
  [v60 setObject:v17 forKeyedSubscript:@"debugInfo"];

  return v60;
}

@end