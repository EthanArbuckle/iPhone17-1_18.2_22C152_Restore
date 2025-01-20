@interface MPMediaPredicate(VideosUI)
+ (id)_vui_isNetworkPlayablePredicate:()VideosUI;
+ (id)_vui_isPlayablePredicate:()VideosUI;
+ (id)vui_isLocalPredicate:()VideosUI comparison:;
+ (id)vui_isPlayablePredicate:()VideosUI comparison:;
+ (id)vui_mediaEntityTypePredicate:()VideosUI comparison:;
+ (id)vui_restrictionsPredicateWithMediaEntityType:()VideosUI mediaLibrary:;
+ (id)vui_seasonIdentifierPredicate:()VideosUI comparison:;
+ (id)vui_seasonNumberPredicate:()VideosUI comparison:;
+ (id)vui_showPersistentIDPredicate:()VideosUI comparison:;
@end

@implementation MPMediaPredicate(VideosUI)

+ (id)vui_restrictionsPredicateWithMediaEntityType:()VideosUI mediaLibrary:
{
  id v6 = a3;
  if (!objc_msgSend(a4, "vui_isDeviceMediaLibrary"))
  {
    v9 = 0;
    goto LABEL_10;
  }
  v7 = [MEMORY[0x1E4FB3D20] sharedInstance];
  uint64_t v8 = [v6 mediaCategoryType];
  if (v8 != 1)
  {
    if (v8 || ([v7 allowsShowingUndownloadedMovies] & 1) != 0) {
      goto LABEL_5;
    }
LABEL_8:
    v9 = objc_msgSend(a1, "vui_isLocalPredicate:comparison:", 1, 0);
    goto LABEL_9;
  }
  if (([v7 allowsShowingUndownloadedTVShows] & 1) == 0) {
    goto LABEL_8;
  }
LABEL_5:
  v9 = 0;
LABEL_9:

LABEL_10:
  return v9;
}

+ (id)vui_isLocalPredicate:()VideosUI comparison:
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  if (a4 && a4 != 100) {
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3C8], @"Unsupported comparison (%lu)", a4);
  }
  id v6 = (void *)MEMORY[0x1E4F31968];
  v7 = [MEMORY[0x1E4F28ED0] numberWithBool:a3];
  v28 = [v6 predicateWithValue:v7 forProperty:*MEMORY[0x1E4F313E0] comparisonType:a4];

  uint64_t v8 = 100;
  if (a3) {
    uint64_t v8 = 0;
  }
  if (v8 == a4)
  {
    id v30 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    v9 = +[VUIMediaLibraryManager defaultManager];
    v10 = [v9 sidebandMediaLibrary];
    v11 = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F3F3E180];
    v12 = [v10 videosWithDownloadState:2 entitlementTypes:v11 sortDescriptors:0 useMainThreadContext:0];

    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id obj = v12;
    uint64_t v13 = [obj countByEnumeratingWithState:&v38 objects:v44 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v39;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v39 != v14) {
            objc_enumerationMutation(obj);
          }
          v16 = *(void **)(*((void *)&v38 + 1) + 8 * i);
          uint64_t v32 = 0;
          v33 = &v32;
          uint64_t v34 = 0x3032000000;
          v35 = __Block_byref_object_copy_;
          v36 = __Block_byref_object_dispose_;
          id v37 = 0;
          v17 = [v16 managedObjectContext];
          v31[0] = MEMORY[0x1E4F143A8];
          v31[1] = 3221225472;
          v31[2] = __62__MPMediaPredicate_VideosUI__vui_isLocalPredicate_comparison___block_invoke;
          v31[3] = &unk_1E6DF4130;
          v31[4] = v16;
          v31[5] = &v32;
          [v17 performBlockAndWait:v31];

          if (v33[5]) {
            objc_msgSend(v30, "addObject:");
          }
          _Block_object_dispose(&v32, 8);
        }
        uint64_t v13 = [obj countByEnumeratingWithState:&v38 objects:v44 count:16];
      }
      while (v13);
    }

    v18 = [MEMORY[0x1E4F31968] predicateWithValue:MEMORY[0x1E4F1CC28] forProperty:*MEMORY[0x1E4F31410]];
    v19 = (void *)MEMORY[0x1E4F318F0];
    v43[0] = v28;
    v43[1] = v18;
    v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v43 count:2];
    v21 = [v19 predicateMatchingPredicates:v20];

    if ([v30 count])
    {
      v22 = [MEMORY[0x1E4F31900] predicateWithProperty:*MEMORY[0x1E4F31500] values:v30];
      v23 = (void *)MEMORY[0x1E4F318F8];
      v42[0] = v21;
      v42[1] = v22;
      v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:2];
      id v25 = [v23 predicateMatchingPredicates:v24];
    }
    else
    {
      id v25 = v21;
    }

    v26 = v28;
  }
  else
  {
    v26 = v28;
    id v25 = v28;
  }

  return v25;
}

+ (id)vui_mediaEntityTypePredicate:()VideosUI comparison:
{
  v30[3] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a4 && a4 != 100) {
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3C8], @"Unsupported comparison (%lu)", a4);
  }
  uint64_t v6 = +[VUIMediaEntityType season];
  v7 = v5;
  if ((id)v6 == v5) {
    goto LABEL_12;
  }
  uint64_t v8 = (void *)v6;
  uint64_t v9 = +[VUIMediaEntityType show];
  if ((id)v9 == v5)
  {

    v7 = v8;
LABEL_12:

    goto LABEL_13;
  }
  v10 = (void *)v9;
  id v11 = +[VUIMediaEntityType episode];

  if (v11 == v5)
  {
LABEL_13:
    v16 = (void *)MEMORY[0x1E4F31968];
    v17 = [MEMORY[0x1E4F28ED0] numberWithInteger:512];
    v15 = [v16 predicateWithValue:v17 forProperty:*MEMORY[0x1E4F31420] comparisonType:a4];

    goto LABEL_14;
  }
  id v12 = +[VUIMediaEntityType movie];

  if (v12 == v5)
  {
    v19 = [MEMORY[0x1E4F31968] predicateWithValue:&unk_1F3F3C320 forProperty:*MEMORY[0x1E4F31420] comparisonType:a4];
    v30[0] = v19;
    uint64_t v20 = MEMORY[0x1E4F1CC28];
    v21 = [MEMORY[0x1E4F31968] predicateWithValue:MEMORY[0x1E4F1CC28] forProperty:*MEMORY[0x1E4F31408] comparisonType:a4];
    v30[1] = v21;
    v22 = [MEMORY[0x1E4F31968] predicateWithValue:v20 forProperty:*MEMORY[0x1E4F313D0] comparisonType:a4];
    v30[2] = v22;
    v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:3];

    v24 = (id *)0x1E4F318F0;
    if (a4) {
      v24 = (id *)0x1E4F318F8;
    }
    v15 = [*v24 predicateMatchingPredicates:v23];
  }
  else
  {
    id v13 = +[VUIMediaEntityType movieRental];

    if (v13 == v5)
    {
      id v25 = [MEMORY[0x1E4F31968] predicateWithValue:&unk_1F3F3C320 forProperty:*MEMORY[0x1E4F31420] comparisonType:a4];
      v29[0] = v25;
      v26 = [MEMORY[0x1E4F31968] predicateWithValue:MEMORY[0x1E4F1CC38] forProperty:*MEMORY[0x1E4F31408] comparisonType:a4];
      v29[1] = v26;
      v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:2];

      v28 = (id *)0x1E4F318F0;
      if (a4) {
        v28 = (id *)0x1E4F318F8;
      }
      v15 = [*v28 predicateMatchingPredicates:v27];
    }
    else
    {
      id v14 = +[VUIMediaEntityType homeVideo];

      if (v14 == v5)
      {
        v15 = [MEMORY[0x1E4F31968] predicateWithValue:&unk_1F3F3C338 forProperty:*MEMORY[0x1E4F31420] comparisonType:a4];
      }
      else
      {
        [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"Unsupported media entity type (%@)", v5 format];
        v15 = 0;
      }
    }
  }
LABEL_14:

  return v15;
}

+ (id)vui_seasonIdentifierPredicate:()VideosUI comparison:
{
  id v6 = a3;
  if (a4 && a4 != 100) {
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3C8], @"Unsupported comparison (%lu)", a4);
  }
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v8 = [v6 persistentID];
  uint64_t v9 = objc_msgSend(a1, "vui_showPersistentIDPredicate:comparison:", objc_msgSend(v8, "unsignedIntegerValue"), a4);
  [v7 addObject:v9];
  v10 = [v6 seasonNumber];
  id v11 = objc_msgSend(a1, "vui_seasonNumberPredicate:comparison:", objc_msgSend(v10, "unsignedIntegerValue"), a4);
  [v7 addObject:v11];
  if ([v7 count] == 1)
  {
    uint64_t v12 = [v7 firstObject];
  }
  else
  {
    if ((unint64_t)[v7 count] < 2)
    {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"Invalid season Identifier (%@)", v6 format];
      id v14 = 0;
      goto LABEL_13;
    }
    if (a4) {
      id v13 = (void *)MEMORY[0x1E4F318F8];
    }
    else {
      id v13 = (void *)MEMORY[0x1E4F318F0];
    }
    uint64_t v12 = [v13 predicateMatchingPredicates:v7];
  }
  id v14 = (void *)v12;
LABEL_13:

  return v14;
}

+ (id)vui_showPersistentIDPredicate:()VideosUI comparison:
{
  id v5 = (void *)MEMORY[0x1E4F31968];
  id v6 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:");
  id v7 = [v5 predicateWithValue:v6 forProperty:*MEMORY[0x1E4F31300] comparisonType:a4];

  return v7;
}

+ (id)vui_seasonNumberPredicate:()VideosUI comparison:
{
  id v5 = (void *)MEMORY[0x1E4F31968];
  id v6 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:");
  id v7 = [v5 predicateWithValue:v6 forProperty:*MEMORY[0x1E4F314A0] comparisonType:a4];

  return v7;
}

+ (id)vui_isPlayablePredicate:()VideosUI comparison:
{
  if (a4 && a4 != 100) {
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3C8], @"Unsupported comparison (%lu)", a4);
  }
  uint64_t v7 = 100;
  if (a3) {
    uint64_t v7 = 0;
  }
  uint64_t v8 = objc_msgSend(a1, "_vui_isPlayablePredicate:", v7 == a4);
  return v8;
}

+ (id)_vui_isNetworkPlayablePredicate:()VideosUI
{
  v13[2] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *MEMORY[0x1E4F31500];
  if (a3)
  {
    v4 = [MEMORY[0x1E4F31968] predicateWithValue:&unk_1F3F3C380 forProperty:v3 comparisonType:100];
    id v5 = [MEMORY[0x1E4F31968] predicateWithValue:&unk_1F3F3C380 forProperty:*MEMORY[0x1E4F313B8] comparisonType:100];
    id v6 = (void *)MEMORY[0x1E4F318F8];
    v13[0] = v4;
    v13[1] = v5;
    uint64_t v7 = (void *)MEMORY[0x1E4F1C978];
    uint64_t v8 = v13;
  }
  else
  {
    v4 = [MEMORY[0x1E4F31968] predicateWithValue:&unk_1F3F3C380 forProperty:v3 comparisonType:0];
    id v5 = [MEMORY[0x1E4F31968] predicateWithValue:&unk_1F3F3C380 forProperty:*MEMORY[0x1E4F313B8] comparisonType:0];
    id v6 = (void *)MEMORY[0x1E4F318F0];
    v12[0] = v4;
    v12[1] = v5;
    uint64_t v7 = (void *)MEMORY[0x1E4F1C978];
    uint64_t v8 = v12;
  }
  uint64_t v9 = [v7 arrayWithObjects:v8 count:2];
  v10 = [v6 predicateMatchingPredicates:v9];

  return v10;
}

+ (id)_vui_isPlayablePredicate:()VideosUI
{
  v15[2] = *MEMORY[0x1E4F143B8];
  id v5 = objc_msgSend(a1, "vui_isLocalPredicate:comparison:", a3, 0);
  uint64_t v6 = objc_msgSend(a1, "_vui_isNetworkPlayablePredicate:", a3);
  uint64_t v7 = (void *)v6;
  if (a3)
  {
    uint64_t v8 = (void *)MEMORY[0x1E4F318F8];
    v15[0] = v5;
    v15[1] = v6;
    uint64_t v9 = (void *)MEMORY[0x1E4F1C978];
    v10 = v15;
  }
  else
  {
    uint64_t v8 = (void *)MEMORY[0x1E4F318F0];
    v14[0] = v5;
    v14[1] = v6;
    uint64_t v9 = (void *)MEMORY[0x1E4F1C978];
    v10 = v14;
  }
  id v11 = [v9 arrayWithObjects:v10 count:2];
  uint64_t v12 = [v8 predicateMatchingPredicates:v11];

  return v12;
}

@end