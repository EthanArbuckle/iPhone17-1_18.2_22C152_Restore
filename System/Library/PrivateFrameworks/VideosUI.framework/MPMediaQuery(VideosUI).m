@interface MPMediaQuery(VideosUI)
+ (id)_vui_moviesQueryWithMediaLibrary:()VideosUI rentals:;
+ (id)vui_GenresQueryWithMediaLibrary:()VideosUI;
+ (id)vui_episodesQueryWithMediaLibrary:()VideosUI;
+ (id)vui_homeVideosQueryWithMediaLibrary:()VideosUI;
+ (id)vui_movieRentalsQueryWithMediaLibrary:()VideosUI;
+ (id)vui_tvShowsQueryWithMediaLibrary:()VideosUI;
+ (uint64_t)vui_hasEpisodesInSeasonsQueryWithMediaLibrary:()VideosUI seasonCanonicalIds:;
+ (uint64_t)vui_moviesQueryWithMediaLibrary:()VideosUI;
- (void)_vui_configureMediaQueryWithMediaLibrary:()VideosUI;
- (void)vui_excludePreorderContent;
@end

@implementation MPMediaQuery(VideosUI)

+ (uint64_t)vui_moviesQueryWithMediaLibrary:()VideosUI
{
  return objc_msgSend(a1, "_vui_moviesQueryWithMediaLibrary:rentals:", a3, 0);
}

+ (id)vui_homeVideosQueryWithMediaLibrary:()VideosUI
{
  id v4 = a3;
  v5 = [a1 homeVideosQuery];
  objc_msgSend(v5, "_vui_configureMediaQueryWithMediaLibrary:", v4);

  return v5;
}

+ (id)vui_GenresQueryWithMediaLibrary:()VideosUI
{
  v35[2] = *MEMORY[0x1E4F143B8];
  v3 = (objc_class *)MEMORY[0x1E4F31970];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  [v5 setGroupingType:5];
  v6 = objc_msgSend(MEMORY[0x1E4F31960], "vui_isLocalPredicate:comparison:", 1, 0);
  uint64_t v7 = *MEMORY[0x1E4F31420];
  v29 = [MEMORY[0x1E4F31968] predicateWithValue:&unk_1F3F3D0E8 forProperty:*MEMORY[0x1E4F31420]];
  v8 = [MEMORY[0x1E4F31968] predicateWithValue:&unk_1F3F3D100 forProperty:v7];
  v9 = [MEMORY[0x1E4FB3D20] sharedInstance];
  char v10 = [v9 allowsShowingUndownloadedMovies];

  v11 = 0;
  if ((v10 & 1) == 0)
  {
    v12 = (void *)MEMORY[0x1E4F318F0];
    v35[0] = v6;
    v35[1] = v29;
    v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:2];
    v11 = [v12 predicateMatchingPredicates:v13];
  }
  v14 = [MEMORY[0x1E4FB3D20] sharedInstance];
  int v15 = [v14 allowsShowingUndownloadedTVShows];

  if (v15)
  {
    if (v11)
    {
      v16 = 0;
      goto LABEL_10;
    }
  }
  else
  {
    v17 = (void *)MEMORY[0x1E4F318F0];
    v34[0] = v6;
    v34[1] = v8;
    v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:2];
    v16 = [v17 predicateMatchingPredicates:v18];

    if (v11 && v16)
    {
      v19 = (void *)MEMORY[0x1E4F318F8];
      v33[0] = v11;
      v33[1] = v16;
      v20 = (void *)MEMORY[0x1E4F1C978];
      v21 = v33;
LABEL_11:
      v22 = [v20 arrayWithObjects:v21 count:2];
      v23 = [v19 predicateMatchingPredicates:v22];
      goto LABEL_15;
    }
    if (v11)
    {
LABEL_10:
      v19 = (void *)MEMORY[0x1E4F318F8];
      v32[0] = v11;
      v32[1] = v8;
      v20 = (void *)MEMORY[0x1E4F1C978];
      v21 = v32;
      goto LABEL_11;
    }
    if (v16)
    {
      v19 = (void *)MEMORY[0x1E4F318F8];
      v31[0] = v29;
      v31[1] = v16;
      v20 = (void *)MEMORY[0x1E4F1C978];
      v21 = v31;
      goto LABEL_11;
    }
  }
  v24 = (void *)MEMORY[0x1E4F318F8];
  v30[0] = v29;
  v30[1] = v8;
  v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:2];
  v23 = [v24 predicateMatchingPredicates:v22];
  v16 = 0;
LABEL_15:

  if (v23) {
    [v5 addFilterPredicate:v23];
  }
  uint64_t v25 = MEMORY[0x1E4F1CC28];
  v26 = [MEMORY[0x1E4F31968] predicateWithValue:MEMORY[0x1E4F1CC28] forProperty:*MEMORY[0x1E4F31408]];
  v27 = [MEMORY[0x1E4F31968] predicateWithValue:v25 forProperty:*MEMORY[0x1E4F313D0]];
  [v5 addFilterPredicate:v26];
  [v5 addFilterPredicate:v27];
  objc_msgSend(v5, "vui_excludePreorderContent");
  [v5 setMediaLibrary:v4];

  return v5;
}

+ (id)vui_tvShowsQueryWithMediaLibrary:()VideosUI
{
  v1 = objc_msgSend(a1, "vui_episodesQueryWithMediaLibrary:");
  [v1 setGroupingType:8];
  return v1;
}

+ (id)vui_episodesQueryWithMediaLibrary:()VideosUI
{
  id v4 = a3;
  id v5 = [a1 tvShowsQuery];
  objc_msgSend(v5, "_vui_configureMediaQueryWithMediaLibrary:", v4);
  v6 = (void *)MEMORY[0x1E4F31960];
  uint64_t v7 = +[VUIMediaEntityType episode];
  v8 = objc_msgSend(v6, "vui_restrictionsPredicateWithMediaEntityType:mediaLibrary:", v7, v4);

  if (v8) {
    [v5 addFilterPredicate:v8];
  }

  return v5;
}

+ (id)vui_movieRentalsQueryWithMediaLibrary:()VideosUI
{
  v14[2] = *MEMORY[0x1E4F143B8];
  v3 = objc_msgSend(a1, "_vui_moviesQueryWithMediaLibrary:rentals:", a3, 1);
  id v4 = (void *)MEMORY[0x1E4F31968];
  id v5 = (void *)MEMORY[0x1E4F28ED0];
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  v6 = objc_msgSend(v5, "numberWithDouble:");
  uint64_t v7 = *MEMORY[0x1E4F31470];
  v8 = [v4 predicateWithValue:v6 forProperty:*MEMORY[0x1E4F31470] comparisonType:101];

  v9 = [MEMORY[0x1E4F31968] predicateWithValue:&unk_1F3F3D0D0 forProperty:v7 comparisonType:0];
  char v10 = (void *)MEMORY[0x1E4F318F8];
  v14[0] = v8;
  v14[1] = v9;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];
  v12 = [v10 predicateMatchingPredicates:v11];

  [v3 addFilterPredicate:v12];
  return v3;
}

+ (id)_vui_moviesQueryWithMediaLibrary:()VideosUI rentals:
{
  id v6 = a3;
  if (a4)
  {
    uint64_t v7 = [a1 movieRentalsQuery];
    +[VUIMediaEntityType movieRental];
  }
  else
  {
    uint64_t v7 = [a1 moviesQuery];
    +[VUIMediaEntityType movie];
  v8 = };
  objc_msgSend(v7, "_vui_configureMediaQueryWithMediaLibrary:", v6);
  v9 = objc_msgSend(MEMORY[0x1E4F31960], "vui_restrictionsPredicateWithMediaEntityType:mediaLibrary:", v8, v6);
  if (v9) {
    [v7 addFilterPredicate:v9];
  }
  objc_msgSend(v7, "vui_excludePreorderContent");

  return v7;
}

- (void)vui_excludePreorderContent
{
  id v2 = [MEMORY[0x1E4F31968] predicateWithValue:MEMORY[0x1E4F1CC38] forProperty:*MEMORY[0x1E4F31400] comparisonType:100];
  [a1 addFilterPredicate:v2];
}

- (void)_vui_configureMediaQueryWithMediaLibrary:()VideosUI
{
  id v4 = (void *)MEMORY[0x1E4F1CA48];
  id v5 = a3;
  id v11 = [v4 array];
  uint64_t v6 = MEMORY[0x1E4F1CC28];
  uint64_t v7 = [MEMORY[0x1E4F31968] predicateWithValue:MEMORY[0x1E4F1CC28] forProperty:*MEMORY[0x1E4F313C8]];
  objc_msgSend(v11, "vui_addObjectIfNotNil:", v7);
  v8 = [MEMORY[0x1E4F31968] predicateWithValue:v6 forProperty:*MEMORY[0x1E4F313E8]];
  objc_msgSend(v11, "vui_addObjectIfNotNil:", v8);
  v9 = [MEMORY[0x1E4F31968] predicateWithValue:v6 forProperty:*MEMORY[0x1E4F31398]];
  objc_msgSend(v11, "vui_addObjectIfNotNil:", v9);
  char v10 = [MEMORY[0x1E4F318F0] predicateMatchingPredicates:v11];
  [a1 addFilterPredicate:v10];
  [a1 setMediaLibrary:v5];
}

+ (uint64_t)vui_hasEpisodesInSeasonsQueryWithMediaLibrary:()VideosUI seasonCanonicalIds:
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = objc_msgSend(a1, "vui_episodesQueryWithMediaLibrary:", v6);
  objc_msgSend(v8, "_vui_configureMediaQueryWithMediaLibrary:", v6);
  [v8 setGroupingType:1];
  v9 = [MEMORY[0x1E4F1CAD0] setWithArray:v7];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  char v10 = objc_msgSend(v8, "collections", 0);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v20;
    uint64_t v14 = *MEMORY[0x1E4F312B0];
    while (2)
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v20 != v13) {
          objc_enumerationMutation(v10);
        }
        v16 = [*(id *)(*((void *)&v19 + 1) + 8 * v15) valueForProperty:v14];
        if (v16 && ([v9 containsObject:v16] & 1) != 0)
        {

          uint64_t v17 = 1;
          goto LABEL_12;
        }

        ++v15;
      }
      while (v12 != v15);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }
  uint64_t v17 = 0;
LABEL_12:

  return v17;
}

@end