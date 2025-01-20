@interface VUIMediaAPIRequestFactory
+ (id)_URLAddAdditionalParameter:(id)a3;
+ (id)_URLParameterFilterWithShowIdentifier:(id)a3;
+ (id)_URLParameterForAdditionalParameters;
+ (id)_URLParameterForExtend:(id)a3;
+ (id)_URLParameterForInclude:(id)a3;
+ (id)_URLParameterForIncludeType:(id)a3 includeRelationship:(id)a4;
+ (id)_URLParameterForLimit:(id)a3;
+ (id)_URLParameterForSort:(id)a3;
+ (id)_URLParameterTypeFilterWithTypes:(id)a3;
+ (id)_URLParameterWithGenreFilter:(id)a3;
+ (id)_URLParameterWithGenreIDsFilter:(id)a3;
+ (id)_URLParameterWithOwnerIdentifier:(id)a3;
+ (id)_URLParameterWithSharedPurchases;
+ (id)_URLRequestWithURLString:(id)a3;
+ (id)_purchasesEpisodesEndpoint;
+ (id)episodesRequestWithShowIdentifier:(id)a3 withOwnerIdentifier:(id)a4;
+ (id)familyMembersRequest;
+ (id)genresRequestForVUIFamilySharingGenre:(id)a3 withOwnerIdentifier:(id)a4;
+ (id)genresRequestForVUIFamilySharingGenreIDsFilter:(id)a3 withOwnerIdentifier:(id)a4;
+ (id)genresRequestWithOwnerIdentifier:(id)a3;
+ (id)moviesPurchasesRequestWithOwnerIdentifier:(id)a3 sortType:(unint64_t)a4;
+ (id)recentPurchasesRequestWithOwnerIdentifier:(id)a3;
+ (id)seasonsRequestWithShowIdentifier:(id)a3 withOwnerIdentifier:(id)a4;
+ (id)showsPurchasesRequestWithOwnerIdentifier:(id)a3 sortType:(unint64_t)a4;
+ (void)_addTypeFilterToURL:(id *)a3 forRequest:(id)a4;
@end

@implementation VUIMediaAPIRequestFactory

+ (id)familyMembersRequest
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:@"https://amp-api.videos.apple.com/v1/"];
  [v2 appendString:@"me/purchases/shared/members"];
  v3 = +[VUIMediaAPIRequestFactory _URLRequestWithURLString:v2];

  return v3;
}

+ (id)_URLRequestWithURLString:(id)a3
{
  v3 = [MEMORY[0x1E4F1CB10] URLWithString:a3];
  v4 = [MEMORY[0x1E4F290D0] requestWithURL:v3];

  return v4;
}

+ (id)recentPurchasesRequestWithOwnerIdentifier:(id)a3
{
  v23[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:@"https://amp-api.videos.apple.com/v1/"];
  [v4 appendString:@"me/purchases"];
  v5 = +[VUIMediaAPIRequestFactory _URLParameterForAdditionalParameters];
  [v4 appendString:v5];

  v23[0] = @"movies";
  v23[1] = @"tv-episodes";
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:2];
  v7 = +[VUIMediaAPIRequestFactory _URLParameterTypeFilterWithTypes:v6];
  [v4 appendString:v7];

  v8 = +[VUIMediaAPIRequestFactory _URLParameterForSort:@"mostRecent"];
  v9 = +[VUIMediaAPIRequestFactory _URLAddAdditionalParameter:v8];
  [v4 appendString:v9];

  v10 = +[VUIMediaAPIRequestFactory _URLParameterWithSharedPurchases];
  v11 = +[VUIMediaAPIRequestFactory _URLAddAdditionalParameter:v10];
  [v4 appendString:v11];

  v12 = [MEMORY[0x1E4F28ED0] numberWithInt:25];
  v13 = +[VUIMediaAPIRequestFactory _URLParameterForLimit:v12];
  v14 = +[VUIMediaAPIRequestFactory _URLAddAdditionalParameter:v13];
  [v4 appendString:v14];

  if (v3)
  {
    v15 = +[VUIMediaAPIRequestFactory _URLParameterWithOwnerIdentifier:v3];
    v16 = +[VUIMediaAPIRequestFactory _URLAddAdditionalParameter:v15];
    [v4 appendString:v16];
  }
  v22[0] = @"personalizedOffers";
  v22[1] = @"iTunesExtrasUrl";
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:2];
  v18 = +[VUIMediaAPIRequestFactory _URLParameterForExtend:v17];
  v19 = +[VUIMediaAPIRequestFactory _URLAddAdditionalParameter:v18];
  [v4 appendString:v19];

  v20 = +[VUIMediaAPIRequestFactory _URLRequestWithURLString:v4];

  return v20;
}

+ (id)moviesPurchasesRequestWithOwnerIdentifier:(id)a3 sortType:(unint64_t)a4
{
  v29[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:@"https://amp-api.videos.apple.com/v1/"];
  [v6 appendString:@"me/purchases"];
  v7 = +[VUIMediaAPIRequestFactory _URLParameterForAdditionalParameters];
  [v6 appendString:v7];

  v29[0] = @"movies";
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:1];
  v9 = +[VUIMediaAPIRequestFactory _URLParameterTypeFilterWithTypes:v8];
  [v6 appendString:v9];

  v10 = +[VUIMediaAPIRequestFactory _URLParameterWithSharedPurchases];
  v11 = +[VUIMediaAPIRequestFactory _URLAddAdditionalParameter:v10];
  [v6 appendString:v11];

  v12 = @"name";
  if (a4 == 3) {
    v12 = @"mostRecent";
  }
  if (a4 == 1) {
    v13 = @"artistName";
  }
  else {
    v13 = v12;
  }
  v14 = +[VUIMediaAPIRequestFactory _URLParameterForSort:v13];
  v15 = +[VUIMediaAPIRequestFactory _URLAddAdditionalParameter:v14];
  [v6 appendString:v15];

  v16 = [MEMORY[0x1E4F28ED0] numberWithInt:25];
  v17 = +[VUIMediaAPIRequestFactory _URLParameterForLimit:v16];
  v18 = +[VUIMediaAPIRequestFactory _URLAddAdditionalParameter:v17];
  [v6 appendString:v18];

  if (v5)
  {
    v19 = +[VUIMediaAPIRequestFactory _URLParameterWithOwnerIdentifier:v5];
    v20 = +[VUIMediaAPIRequestFactory _URLAddAdditionalParameter:v19];
    [v6 appendString:v20];
  }
  v21 = +[VUIMediaAPIRequestFactory _URLParameterForIncludeType:@"include[movies]" includeRelationship:@"playback-position"];
  v22 = +[VUIMediaAPIRequestFactory _URLAddAdditionalParameter:v21];
  [v6 appendString:v22];

  v28[0] = @"personalizedOffers";
  v28[1] = @"iTunesExtrasUrl";
  v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:2];
  v24 = +[VUIMediaAPIRequestFactory _URLParameterForExtend:v23];
  v25 = +[VUIMediaAPIRequestFactory _URLAddAdditionalParameter:v24];
  [v6 appendString:v25];

  v26 = +[VUIMediaAPIRequestFactory _URLRequestWithURLString:v6];

  return v26;
}

+ (id)seasonsRequestWithShowIdentifier:(id)a3 withOwnerIdentifier:(id)a4
{
  v26[2] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  v6 = (objc_class *)MEMORY[0x1E4F28E78];
  id v7 = a3;
  v8 = (void *)[[v6 alloc] initWithString:@"https://amp-api.videos.apple.com/v1/"];
  v9 = +[VUIMediaAPIRequestFactory _purchasesEpisodesEndpoint];
  [v8 appendString:v9];

  v10 = +[VUIMediaAPIRequestFactory _URLParameterForAdditionalParameters];
  [v8 appendString:v10];

  v11 = +[VUIMediaAPIRequestFactory _URLParameterWithSharedPurchases];
  [v8 appendString:v11];

  v12 = +[VUIMediaAPIRequestFactory _URLParameterFilterWithShowIdentifier:v7];

  v13 = +[VUIMediaAPIRequestFactory _URLAddAdditionalParameter:v12];
  [v8 appendString:v13];

  v14 = [MEMORY[0x1E4F28ED0] numberWithInt:25];
  v15 = +[VUIMediaAPIRequestFactory _URLParameterForLimit:v14];
  v16 = +[VUIMediaAPIRequestFactory _URLAddAdditionalParameter:v15];
  [v8 appendString:v16];

  if (v5)
  {
    v17 = +[VUIMediaAPIRequestFactory _URLParameterWithOwnerIdentifier:v5];
    v18 = +[VUIMediaAPIRequestFactory _URLAddAdditionalParameter:v17];
    [v8 appendString:v18];
  }
  v19 = +[VUIMediaAPIRequestFactory _URLParameterForInclude:@"seasons"];
  v20 = +[VUIMediaAPIRequestFactory _URLAddAdditionalParameter:v19];
  [v8 appendString:v20];

  v26[0] = @"personalizedOffers";
  v26[1] = @"iTunesExtrasUrl";
  v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:2];
  v22 = +[VUIMediaAPIRequestFactory _URLParameterForExtend:v21];
  v23 = +[VUIMediaAPIRequestFactory _URLAddAdditionalParameter:v22];
  [v8 appendString:v23];

  v24 = +[VUIMediaAPIRequestFactory _URLRequestWithURLString:v8];

  return v24;
}

+ (id)episodesRequestWithShowIdentifier:(id)a3 withOwnerIdentifier:(id)a4
{
  v32[1] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  v6 = (objc_class *)MEMORY[0x1E4F28E78];
  id v7 = a3;
  v8 = (void *)[[v6 alloc] initWithString:@"https://amp-api.videos.apple.com/v1/"];
  v9 = +[VUIMediaAPIRequestFactory _purchasesEpisodesEndpoint];
  [v8 appendString:v9];

  v10 = +[VUIMediaAPIRequestFactory _URLParameterForAdditionalParameters];
  [v8 appendString:v10];

  v32[0] = @"tv-episodes";
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:1];
  v12 = +[VUIMediaAPIRequestFactory _URLParameterTypeFilterWithTypes:v11];
  [v8 appendString:v12];

  v13 = +[VUIMediaAPIRequestFactory _URLParameterWithSharedPurchases];
  v14 = +[VUIMediaAPIRequestFactory _URLAddAdditionalParameter:v13];
  [v8 appendString:v14];

  v15 = +[VUIMediaAPIRequestFactory _URLParameterFilterWithShowIdentifier:v7];

  v16 = +[VUIMediaAPIRequestFactory _URLAddAdditionalParameter:v15];
  [v8 appendString:v16];

  v17 = [MEMORY[0x1E4F28ED0] numberWithInt:25];
  v18 = +[VUIMediaAPIRequestFactory _URLParameterForLimit:v17];
  v19 = +[VUIMediaAPIRequestFactory _URLAddAdditionalParameter:v18];
  [v8 appendString:v19];

  if (v5)
  {
    v20 = +[VUIMediaAPIRequestFactory _URLParameterWithOwnerIdentifier:v5];
    v21 = +[VUIMediaAPIRequestFactory _URLAddAdditionalParameter:v20];
    [v8 appendString:v21];
  }
  v22 = +[VUIMediaAPIRequestFactory _URLParameterForInclude:@"seasons"];
  v23 = +[VUIMediaAPIRequestFactory _URLAddAdditionalParameter:v22];
  [v8 appendString:v23];

  v24 = +[VUIMediaAPIRequestFactory _URLParameterForIncludeType:@"include[tv-episodes]" includeRelationship:@"playback-position"];
  v25 = +[VUIMediaAPIRequestFactory _URLAddAdditionalParameter:v24];
  [v8 appendString:v25];

  v31[0] = @"personalizedOffers";
  v31[1] = @"iTunesExtrasUrl";
  v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:2];
  v27 = +[VUIMediaAPIRequestFactory _URLParameterForExtend:v26];
  v28 = +[VUIMediaAPIRequestFactory _URLAddAdditionalParameter:v27];
  [v8 appendString:v28];

  v29 = +[VUIMediaAPIRequestFactory _URLRequestWithURLString:v8];

  return v29;
}

+ (id)showsPurchasesRequestWithOwnerIdentifier:(id)a3 sortType:(unint64_t)a4
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:@"https://amp-api.videos.apple.com/v1/"];
  [v6 appendString:@"me/purchases"];
  id v7 = +[VUIMediaAPIRequestFactory _URLParameterForAdditionalParameters];
  [v6 appendString:v7];

  v27[0] = @"tv-episodes";
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:1];
  v9 = +[VUIMediaAPIRequestFactory _URLParameterTypeFilterWithTypes:v8];
  [v6 appendString:v9];

  v10 = +[VUIMediaAPIRequestFactory _URLParameterWithSharedPurchases];
  v11 = +[VUIMediaAPIRequestFactory _URLAddAdditionalParameter:v10];
  [v6 appendString:v11];

  v12 = @"artistName";
  if (a4 == 3) {
    v12 = @"mostRecent";
  }
  if (a4 == 2) {
    v13 = @"name";
  }
  else {
    v13 = v12;
  }
  v14 = +[VUIMediaAPIRequestFactory _URLParameterForSort:v13];
  v15 = +[VUIMediaAPIRequestFactory _URLAddAdditionalParameter:v14];
  [v6 appendString:v15];

  v16 = [MEMORY[0x1E4F28ED0] numberWithInt:25];
  v17 = +[VUIMediaAPIRequestFactory _URLParameterForLimit:v16];
  v18 = +[VUIMediaAPIRequestFactory _URLAddAdditionalParameter:v17];
  [v6 appendString:v18];

  if (v5)
  {
    v19 = +[VUIMediaAPIRequestFactory _URLParameterWithOwnerIdentifier:v5];
    v20 = +[VUIMediaAPIRequestFactory _URLAddAdditionalParameter:v19];
    [v6 appendString:v20];
  }
  v26[0] = @"personalizedOffers";
  v26[1] = @"iTunesExtrasUrl";
  v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:2];
  v22 = +[VUIMediaAPIRequestFactory _URLParameterForExtend:v21];
  v23 = +[VUIMediaAPIRequestFactory _URLAddAdditionalParameter:v22];
  [v6 appendString:v23];

  v24 = +[VUIMediaAPIRequestFactory _URLRequestWithURLString:v6];

  return v24;
}

+ (id)genresRequestForVUIFamilySharingGenre:(id)a3 withOwnerIdentifier:(id)a4
{
  void v27[2] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  v6 = (objc_class *)MEMORY[0x1E4F28E78];
  id v7 = a3;
  v8 = (void *)[[v6 alloc] initWithString:@"https://amp-api.videos.apple.com/v1/"];
  [v8 appendString:@"me/purchases"];
  v9 = +[VUIMediaAPIRequestFactory _URLParameterForAdditionalParameters];
  [v8 appendString:v9];

  v27[0] = @"movies";
  v27[1] = @"tv-episodes";
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:2];
  v11 = +[VUIMediaAPIRequestFactory _URLParameterTypeFilterWithTypes:v10];
  [v8 appendString:v11];

  v12 = +[VUIMediaAPIRequestFactory _URLParameterWithGenreFilter:v7];

  v13 = +[VUIMediaAPIRequestFactory _URLAddAdditionalParameter:v12];
  [v8 appendString:v13];

  v14 = +[VUIMediaAPIRequestFactory _URLParameterWithSharedPurchases];
  v15 = +[VUIMediaAPIRequestFactory _URLAddAdditionalParameter:v14];
  [v8 appendString:v15];

  v16 = [MEMORY[0x1E4F28ED0] numberWithInt:25];
  v17 = +[VUIMediaAPIRequestFactory _URLParameterForLimit:v16];
  v18 = +[VUIMediaAPIRequestFactory _URLAddAdditionalParameter:v17];
  [v8 appendString:v18];

  if (v5)
  {
    v19 = +[VUIMediaAPIRequestFactory _URLParameterWithOwnerIdentifier:v5];
    v20 = +[VUIMediaAPIRequestFactory _URLAddAdditionalParameter:v19];
    [v8 appendString:v20];
  }
  v26[0] = @"personalizedOffers";
  v26[1] = @"iTunesExtrasUrl";
  v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:2];
  v22 = +[VUIMediaAPIRequestFactory _URLParameterForExtend:v21];
  v23 = +[VUIMediaAPIRequestFactory _URLAddAdditionalParameter:v22];
  [v8 appendString:v23];

  v24 = +[VUIMediaAPIRequestFactory _URLRequestWithURLString:v8];

  return v24;
}

+ (id)genresRequestForVUIFamilySharingGenreIDsFilter:(id)a3 withOwnerIdentifier:(id)a4
{
  void v27[2] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  v6 = (objc_class *)MEMORY[0x1E4F28E78];
  id v7 = a3;
  v8 = (void *)[[v6 alloc] initWithString:@"https://amp-api.videos.apple.com/v1/"];
  [v8 appendString:@"me/purchases"];
  v9 = +[VUIMediaAPIRequestFactory _URLParameterForAdditionalParameters];
  [v8 appendString:v9];

  v27[0] = @"movies";
  v27[1] = @"tv-episodes";
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:2];
  v11 = +[VUIMediaAPIRequestFactory _URLParameterTypeFilterWithTypes:v10];
  [v8 appendString:v11];

  v12 = +[VUIMediaAPIRequestFactory _URLParameterWithGenreIDsFilter:v7];

  v13 = +[VUIMediaAPIRequestFactory _URLAddAdditionalParameter:v12];
  [v8 appendString:v13];

  v14 = +[VUIMediaAPIRequestFactory _URLParameterWithSharedPurchases];
  v15 = +[VUIMediaAPIRequestFactory _URLAddAdditionalParameter:v14];
  [v8 appendString:v15];

  v16 = [MEMORY[0x1E4F28ED0] numberWithInt:25];
  v17 = +[VUIMediaAPIRequestFactory _URLParameterForLimit:v16];
  v18 = +[VUIMediaAPIRequestFactory _URLAddAdditionalParameter:v17];
  [v8 appendString:v18];

  if (v5)
  {
    v19 = +[VUIMediaAPIRequestFactory _URLParameterWithOwnerIdentifier:v5];
    v20 = +[VUIMediaAPIRequestFactory _URLAddAdditionalParameter:v19];
    [v8 appendString:v20];
  }
  v26[0] = @"personalizedOffers";
  v26[1] = @"iTunesExtrasUrl";
  v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:2];
  v22 = +[VUIMediaAPIRequestFactory _URLParameterForExtend:v21];
  v23 = +[VUIMediaAPIRequestFactory _URLAddAdditionalParameter:v22];
  [v8 appendString:v23];

  v24 = +[VUIMediaAPIRequestFactory _URLRequestWithURLString:v8];

  return v24;
}

+ (id)genresRequestWithOwnerIdentifier:(id)a3
{
  v20[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:@"https://amp-api.videos.apple.com/v1/"];
  [v4 appendString:@"me/purchases/genres"];
  id v5 = +[VUIMediaAPIRequestFactory _URLParameterForAdditionalParameters];
  [v4 appendString:v5];

  v20[0] = @"movies";
  v20[1] = @"tv-episodes";
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:2];
  id v7 = +[VUIMediaAPIRequestFactory _URLParameterTypeFilterWithTypes:v6];
  [v4 appendString:v7];

  v8 = +[VUIMediaAPIRequestFactory _URLParameterForSort:@"name"];
  v9 = +[VUIMediaAPIRequestFactory _URLAddAdditionalParameter:v8];
  [v4 appendString:v9];

  if (v3)
  {
    v10 = +[VUIMediaAPIRequestFactory _URLParameterWithOwnerIdentifier:v3];
    v11 = +[VUIMediaAPIRequestFactory _URLAddAdditionalParameter:v10];
    [v4 appendString:v11];
  }
  v12 = +[VUIMediaAPIRequestFactory _URLParameterWithSharedPurchases];
  v13 = +[VUIMediaAPIRequestFactory _URLAddAdditionalParameter:v12];
  [v4 appendString:v13];

  v19[0] = @"personalizedOffers";
  v19[1] = @"iTunesExtrasUrl";
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];
  v15 = +[VUIMediaAPIRequestFactory _URLParameterForExtend:v14];
  v16 = +[VUIMediaAPIRequestFactory _URLAddAdditionalParameter:v15];
  [v4 appendString:v16];

  v17 = +[VUIMediaAPIRequestFactory _URLRequestWithURLString:v4];

  return v17;
}

+ (void)_addTypeFilterToURL:(id *)a3 forRequest:(id)a4
{
  v20 = a3;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a4;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  v21 = v4;
  v6 = [v4 mediaEntityTypes];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v23;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v23 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v22 + 1) + 8 * v10);
        uint64_t v12 = +[VUIMediaEntityType movie];
        if (v11 == (void *)v12)
        {

LABEL_12:
          v17 = @"movies";
          goto LABEL_13;
        }
        v13 = (void *)v12;
        v14 = +[VUIMediaEntityType movieRental];

        if (v11 == v14) {
          goto LABEL_12;
        }
        v15 = +[VUIMediaEntityType season];

        if (v11 == v15)
        {
          v17 = @"tv-seasons";
        }
        else
        {
          v16 = +[VUIMediaEntityType episode];

          if (v11 != v16) {
            goto LABEL_14;
          }
          v17 = @"tv-episodes";
        }
LABEL_13:
        [v5 addObject:v17];
LABEL_14:
        ++v10;
      }
      while (v8 != v10);
      uint64_t v18 = [v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
      uint64_t v8 = v18;
    }
    while (v18);
  }

  v19 = +[VUIMediaAPIRequestFactory _URLParameterTypeFilterWithTypes:v5];
  [*v20 appendString:v19];
}

+ (id)_URLParameterTypeFilterWithTypes:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v19;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v18 + 1) + 8 * v9);
        if ([v10 isEqualToString:@"movies"])
        {
          v11 = @"movies";
          if ([v4 length]) {
            goto LABEL_8;
          }
          goto LABEL_9;
        }
        if ([v10 isEqualToString:@"tv-seasons"])
        {
          v11 = @"tv-seasons";
          if ([v4 length]) {
            goto LABEL_8;
          }
          goto LABEL_9;
        }
        if ([v10 isEqualToString:@"tv-episodes"])
        {
          v11 = @"tv-episodes";
          if (![v4 length]) {
            goto LABEL_9;
          }
LABEL_8:
          [v4 appendString:@","];
LABEL_9:
          [v4 appendString:v11];
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v12 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
      uint64_t v7 = v12;
    }
    while (v12);
  }

  id v13 = objc_alloc(MEMORY[0x1E4F28E78]);
  v14 = [NSString stringWithFormat:@"%@=%@", @"types", v4, (void)v18];
  v15 = (void *)[v13 initWithString:v14];

  v16 = (void *)[v15 copy];
  return v16;
}

+ (id)_URLParameterWithOwnerIdentifier:(id)a3
{
  return (id)[NSString stringWithFormat:@"%@=%@", @"filter[owner]", a3];
}

+ (id)_URLParameterFilterWithShowIdentifier:(id)a3
{
  return (id)[NSString stringWithFormat:@"%@=%@", @"filter[tvShowId]", a3];
}

+ (id)_URLParameterWithGenreFilter:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = objc_msgSend(v3, "genreIdentifiers", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        if (([v4 isEqualToString:&stru_1F3E921E0] & 1) == 0) {
          [v4 appendString:@","];
        }
        [v4 appendString:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  v11 = +[VUIMediaAPIRequestFactory _URLParameterWithGenreIDsFilter:v4];

  return v11;
}

+ (id)_URLParameterWithGenreIDsFilter:(id)a3
{
  return (id)[NSString stringWithFormat:@"%@=%@", @"filter[genres]", a3];
}

+ (id)_URLParameterWithSharedPurchases
{
  return (id)[NSString stringWithFormat:@"%@=%@", @"with", @"sharedPurchases"];
}

+ (id)_URLParameterForSort:(id)a3
{
  return (id)[NSString stringWithFormat:@"%@=%@", @"sort", a3];
}

+ (id)_URLParameterForLimit:(id)a3
{
  return (id)[NSString stringWithFormat:@"%@=%d", @"limit", objc_msgSend(a3, "intValue")];
}

+ (id)_URLParameterForInclude:(id)a3
{
  return +[VUIMediaAPIRequestFactory _URLParameterForIncludeType:@"include" includeRelationship:a3];
}

+ (id)_URLParameterForIncludeType:(id)a3 includeRelationship:(id)a4
{
  return (id)[NSString stringWithFormat:@"%@=%@", a3, a4];
}

+ (id)_URLParameterForExtend:(id)a3
{
  id v3 = [a3 componentsJoinedByString:@","];
  id v4 = [NSString stringWithFormat:@"%@=%@", @"extend", v3];

  return v4;
}

+ (id)_URLParameterForAdditionalParameters
{
  return @"?";
}

+ (id)_URLAddAdditionalParameter:(id)a3
{
  return (id)[NSString stringWithFormat:@"&%@", a3];
}

+ (id)_purchasesEpisodesEndpoint
{
  return (id)[NSString stringWithFormat:@"%@/%@", @"me/purchases", @"tv-episodes"];
}

@end