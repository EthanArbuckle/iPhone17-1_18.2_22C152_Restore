@interface STRegionRatings
+ (STRegionRatings)sharedRatings;
+ (void)loadRegionRatingsWithCompletionHandler:(id)a3;
+ (void)loadRegionRatingsWithUnrated:(BOOL)a3 completionHandler:(id)a4;
- (NSArray)localizedRegionAndCodePairs;
- (NSDictionary)localizedRegionsByCode;
- (NSDictionary)regionRatingsData;
- (NSString)preferredRegion;
- (id)_localizedLabelForRegion:(id)a3 rating:(id)a4;
- (id)_localizedRatingsForRegion:(id)a3 type:(id)a4 allContentKey:(id)a5 noContentKey:(id)a6;
- (id)_overrideValueForString:(id)a3;
- (id)getClosestRestrictionMatch:(id)a3 within:(id)a4 forPayloadKey:(id)a5;
- (id)getRatingSystemTypeFrom:(id)a3;
- (id)localizedAppRatingsForRegion:(id)a3;
- (id)localizedMovieRatingsForRegion:(id)a3;
- (id)localizedStringForAppRatingLabel:(id)a3;
- (id)localizedTVRatingsForRegion:(id)a3;
- (void)loadRegionRatingsDataWithCompletionHandler:(id)a3;
- (void)loadRegionRatingsDataWithUnrated:(BOOL)a3 completionHandler:(id)a4;
- (void)setRegionRatingsData:(id)a3;
@end

@implementation STRegionRatings

+ (void)loadRegionRatingsWithCompletionHandler:(id)a3
{
}

+ (void)loadRegionRatingsWithUnrated:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  id v5 = a4;
  v6 = objc_opt_new();
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __66__STRegionRatings_loadRegionRatingsWithUnrated_completionHandler___block_invoke;
  v9[3] = &unk_2647679D0;
  id v10 = v6;
  id v11 = v5;
  id v7 = v6;
  id v8 = v5;
  [v7 loadRegionRatingsDataWithUnrated:v4 completionHandler:v9];
}

uint64_t __66__STRegionRatings_loadRegionRatingsWithUnrated_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), a2);
}

+ (STRegionRatings)sharedRatings
{
  if (sharedRatings_onceToken != -1) {
    dispatch_once(&sharedRatings_onceToken, &__block_literal_global_13);
  }
  v2 = (void *)sharedRatings_sharedRatings;

  return (STRegionRatings *)v2;
}

uint64_t __32__STRegionRatings_sharedRatings__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = sharedRatings_sharedRatings;
  sharedRatings_sharedRatings = v0;

  return MEMORY[0x270F9A758](v0, v1);
}

- (void)loadRegionRatingsDataWithCompletionHandler:(id)a3
{
}

- (void)loadRegionRatingsDataWithUnrated:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = [(STRegionRatings *)self preferredRegion];
  id v8 = [MEMORY[0x263F27E58] createBagForSubProfile];
  id v9 = objc_alloc(MEMORY[0x263F27E58]);
  if (v4) {
    id v10 = (void *)[v9 initForAllMediaWithUnratedRatingsForStoreFront:v7 clientIdentifier:@"com.apple.ScreenTimeSettingsUI" useCase:1 bag:v8];
  }
  else {
    id v10 = (void *)[v9 initForAllMediaWithStoreFront:v7 clientIdentifier:@"com.apple.ScreenTimeSettingsUI" useCase:1 bag:v8];
  }
  id v11 = v10;
  v12 = [v10 performTask];
  v13 = [v12 promiseWithTimeout:20.0];

  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __70__STRegionRatings_loadRegionRatingsDataWithUnrated_completionHandler___block_invoke;
  v16[3] = &unk_264768090;
  id v17 = v7;
  id v18 = v6;
  v16[4] = self;
  id v14 = v7;
  id v15 = v6;
  [v13 addFinishBlock:v16];
}

void __70__STRegionRatings_loadRegionRatingsDataWithUnrated_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = +[STUILog contentPrivacy];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v19 = v5;
    __int16 v20 = 2112;
    id v21 = v6;
    _os_log_impl(&dword_225B06000, v7, OS_LOG_TYPE_DEFAULT, "AMSRatingsProvider returned: %@ %@", buf, 0x16u);
  }

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __70__STRegionRatings_loadRegionRatingsDataWithUnrated_completionHandler___block_invoke_22;
  block[3] = &unk_264768068;
  id v13 = v5;
  id v17 = *(id *)(a1 + 48);
  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = *(void **)(a1 + 40);
  id v14 = v6;
  uint64_t v15 = v8;
  id v16 = v9;
  id v10 = v6;
  id v11 = v5;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __70__STRegionRatings_loadRegionRatingsDataWithUnrated_completionHandler___block_invoke_22(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v55 = *MEMORY[0x263EF8340];
  if (*(void *)(a1 + 32))
  {
    v2 = objc_opt_new();
    v3 = [*(id *)(v1 + 32) ratingsStoreFronts];
    if ([v3 count] == 1)
    {
      v31 = v3;
      BOOL v4 = [v3 firstObject];
      id v5 = [v4 ratingSystems];

      long long v45 = 0u;
      long long v46 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      id v6 = v5;
      uint64_t v36 = [v6 countByEnumeratingWithState:&v43 objects:v52 count:16];
      if (v36)
      {
        v34 = v2;
        uint64_t v35 = *(void *)v44;
        id v32 = v6;
        uint64_t v33 = v1;
        while (2)
        {
          for (uint64_t i = 0; i != v36; ++i)
          {
            if (*(void *)v44 != v35) {
              objc_enumerationMutation(v6);
            }
            uint64_t v8 = *(void **)(*((void *)&v43 + 1) + 8 * i);
            if ([v6 count])
            {
              id v9 = [v8 contentRatings];
              id v10 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v9, "count"));
              id v11 = *(void **)(v1 + 48);
              v12 = [v8 types];
              uint64_t v13 = [v11 getRatingSystemTypeFrom:v12];

              if (!v13)
              {
                uint64_t v29 = *(void *)(v1 + 64);
                v30 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F67300] code:103 userInfo:0];
                (*(void (**)(uint64_t, void *))(v29 + 16))(v29, v30);

                goto LABEL_29;
              }
              v37 = (void *)v13;
              uint64_t v38 = i;
              long long v41 = 0u;
              long long v42 = 0u;
              long long v39 = 0u;
              long long v40 = 0u;
              id v14 = v9;
              uint64_t v15 = [v14 countByEnumeratingWithState:&v39 objects:v51 count:16];
              if (v15)
              {
                uint64_t v16 = v15;
                uint64_t v17 = *(void *)v40;
                do
                {
                  for (uint64_t j = 0; j != v16; ++j)
                  {
                    if (*(void *)v40 != v17) {
                      objc_enumerationMutation(v14);
                    }
                    id v19 = *(void **)(*((void *)&v39 + 1) + 8 * j);
                    __int16 v20 = [v19 value];
                    if (([v20 isEqual:&unk_26D967180] & 1) == 0)
                    {
                      v49[1] = @"rating";
                      v50[0] = v20;
                      v49[0] = @"rank";
                      id v21 = [v19 name];
                      v50[1] = v21;
                      uint64_t v22 = [NSDictionary dictionaryWithObjects:v50 forKeys:v49 count:2];
                      [v10 addObject:v22];
                    }
                  }
                  uint64_t v16 = [v14 countByEnumeratingWithState:&v39 objects:v51 count:16];
                }
                while (v16);
              }

              v2 = v34;
              [v34 setValue:v10 forKey:v37];

              id v6 = v32;
              uint64_t v1 = v33;
              uint64_t i = v38;
            }
          }
          uint64_t v36 = [v6 countByEnumeratingWithState:&v43 objects:v52 count:16];
          if (v36) {
            continue;
          }
          break;
        }
      }

      uint64_t v47 = *(void *)(v1 + 56);
      v48 = v2;
      v23 = [NSDictionary dictionaryWithObjects:&v48 forKeys:&v47 count:1];
      [*(id *)(v1 + 48) setRegionRatingsData:v23];

      v24 = +[STUILog contentPrivacy];
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        v25 = [*(id *)(v1 + 48) regionRatingsData];
        *(_DWORD *)buf = 138412290;
        v54 = v25;
        _os_log_impl(&dword_225B06000, v24, OS_LOG_TYPE_DEFAULT, "STRegionRatings loadRegionRatingsDataWithCompletionHandler returning ratings data: %@", buf, 0xCu);
      }
      (*(void (**)(void))(*(void *)(v1 + 64) + 16))();
LABEL_29:
      v3 = v31;
    }
    else
    {
      uint64_t v27 = *(void *)(v1 + 64);
      v28 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F67300] code:102 userInfo:0];
      (*(void (**)(uint64_t, void *))(v27 + 16))(v27, v28);
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    v2 = +[STUILog contentPrivacy];
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v26 = *(void **)(v1 + 40);
      *(_DWORD *)buf = 138412290;
      v54 = v26;
      _os_log_impl(&dword_225B06000, v2, OS_LOG_TYPE_DEFAULT, "STRegionRatings loadRegionRatingsDataWithCompletionHandler returned error: %@", buf, 0xCu);
    }
  }
}

- (NSString)preferredRegion
{
  v2 = [MEMORY[0x263EFF960] currentLocale];
  v3 = [v2 countryCode];
  BOOL v4 = [v3 lowercaseString];

  if ([v4 length]) {
    id v5 = v4;
  }
  else {
    id v5 = @"us";
  }

  return (NSString *)v5;
}

- (id)_overrideValueForString:(id)a3
{
  id v3 = a3;
  BOOL v4 = +[STScreenTimeSettingsUIBundle bundle];
  id v5 = [v4 localizedStringForKey:v3 value:@"xx" table:@"RatingProviders"];

  if (v5 == @"xx")
  {
    uint64_t v13 = 0;
  }
  else
  {
    id v6 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:@"(\\d+)" options:0 error:0];
    id v7 = objc_msgSend(v6, "firstMatchInString:options:range:", v3, 0, 0, objc_msgSend(v3, "length"));
    uint64_t v8 = v7;
    if (v7)
    {
      uint64_t v9 = [v7 range];
      id v11 = objc_msgSend(v3, "substringWithRange:", v9, v10);
      uint64_t v12 = [v11 integerValue];
    }
    else
    {
      uint64_t v12 = 0;
    }
    uint64_t v13 = objc_msgSend(NSString, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v5, @"%ld", 0, v12);
  }

  return v13;
}

- (id)_localizedLabelForRegion:(id)a3 rating:(id)a4
{
  id v6 = NSString;
  id v7 = a4;
  uint64_t v8 = [v6 stringWithFormat:@"%@_%@", a3, v7];
  uint64_t v9 = [(STRegionRatings *)self _overrideValueForString:v8];
  uint64_t v10 = v9;
  if (!v9) {
    uint64_t v9 = v7;
  }
  id v11 = v9;

  return v11;
}

- (NSDictionary)localizedRegionsByCode
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = [(STRegionRatings *)self regionRatingsData];
  BOOL v4 = [v3 allKeys];

  id v5 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v12 = -[STRegionRatings _overrideValueForString:](self, "_overrideValueForString:", v11, (void)v16);
        if (v12)
        {
          [v5 setObject:v12 forKeyedSubscript:v11];
        }
        else
        {
          uint64_t v13 = [MEMORY[0x263EFF960] currentLocale];
          id v14 = [v13 localizedStringForCountryCode:v11];
          [v5 setObject:v14 forKeyedSubscript:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  return (NSDictionary *)v5;
}

- (NSArray)localizedRegionAndCodePairs
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v2 = [(STRegionRatings *)self localizedRegionsByCode];
  id v3 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v2, "count"));
  BOOL v4 = [v2 keysSortedByValueUsingSelector:sel_localizedStandardCompare_];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v10 = [v2 objectForKeyedSubscript:v9];
        uint64_t v11 = [[STKeyValuePair alloc] initWithKey:v10 value:v9];
        [v3 addObject:v11];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (id)_localizedRatingsForRegion:(id)a3 type:(id)a4 allContentKey:(id)a5 noContentKey:(id)a6
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  long long v14 = [(STRegionRatings *)self regionRatingsData];
  long long v15 = [v14 objectForKeyedSubscript:v10];
  long long v16 = [v15 objectForKeyedSubscript:v11];

  if (!v16)
  {
    v25 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:2];
    if (!v13) {
      goto LABEL_14;
    }
    goto LABEL_12;
  }
  id v36 = v13;
  id v37 = v12;
  id v38 = v11;
  v34 = [v16 valueForKey:@"rank"];
  long long v17 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v34, "count"));
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  uint64_t v35 = v16;
  id v18 = v16;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v39 objects:v43 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v40 != v21) {
          objc_enumerationMutation(v18);
        }
        v23 = [*(id *)(*((void *)&v39 + 1) + 8 * i) objectForKeyedSubscript:@"rating"];
        v24 = [(STRegionRatings *)self _localizedLabelForRegion:v10 rating:v23];
        [v17 addObject:v24];
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v39 objects:v43 count:16];
    }
    while (v20);
  }

  v25 = [MEMORY[0x263EFF9A0] dictionaryWithObjects:v17 forKeys:v34];

  id v12 = v37;
  id v11 = v38;
  long long v16 = v35;
  id v13 = v36;
  if (v36)
  {
LABEL_12:
    v26 = [v25 objectForKeyedSubscript:&unk_26D967180];

    if (!v26)
    {
      uint64_t v27 = +[STScreenTimeSettingsUIBundle bundle];
      v28 = [v27 localizedStringForKey:v13 value:@"xx" table:@"RatingProviders"];
      [v25 setObject:v28 forKeyedSubscript:&unk_26D967180];
    }
  }
LABEL_14:
  if (v12)
  {
    uint64_t v29 = [v25 objectForKeyedSubscript:&unk_26D967150];

    if (!v29)
    {
      v30 = +[STScreenTimeSettingsUIBundle bundle];
      v31 = [v30 localizedStringForKey:v12 value:@"xx" table:@"RatingProviders"];
      [v25 setObject:v31 forKeyedSubscript:&unk_26D967150];
    }
  }
  id v32 = (void *)[v25 copy];

  return v32;
}

- (id)localizedMovieRatingsForRegion:(id)a3
{
  return [(STRegionRatings *)self _localizedRatingsForRegion:a3 type:@"ratingMovies" allContentKey:@"AllowAll" noContentKey:@"DontAllow"];
}

- (id)localizedTVRatingsForRegion:(id)a3
{
  return [(STRegionRatings *)self _localizedRatingsForRegion:a3 type:@"ratingTVShows" allContentKey:@"AllowAll" noContentKey:@"DontAllow"];
}

- (id)localizedAppRatingsForRegion:(id)a3
{
  return [(STRegionRatings *)self _localizedRatingsForRegion:a3 type:@"ratingApps" allContentKey:0 noContentKey:@"DontAllow"];
}

- (id)localizedStringForAppRatingLabel:(id)a3
{
  return [(STRegionRatings *)self _localizedLabelForRegion:@"us" rating:a3];
}

- (id)getRatingSystemTypeFrom:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (getRatingSystemTypeFrom__onceToken != -1) {
    dispatch_once(&getRatingSystemTypeFrom__onceToken, &__block_literal_global_64);
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = objc_msgSend((id)getRatingSystemTypeFrom__typeValues, "objectForKeyedSubscript:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
        if (v9)
        {
          id v10 = (void *)v9;
          goto LABEL_13;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  id v10 = 0;
LABEL_13:

  return v10;
}

void __43__STRegionRatings_getRatingSystemTypeFrom___block_invoke()
{
  v3[7] = *MEMORY[0x263EF8340];
  v2[0] = @"movies";
  v2[1] = @"movie-bundles";
  v3[0] = @"ratingMovies";
  v3[1] = @"ratingMovies";
  v2[2] = @"tv-seasons";
  v2[3] = @"tv-episodes";
  v3[2] = @"ratingTVShows";
  v3[3] = @"ratingTVShows";
  v2[4] = @"apps";
  v2[5] = @"in-apps";
  v3[4] = @"ratingApps";
  v3[5] = @"ratingApps";
  v2[6] = @"app-bundles";
  v3[6] = @"ratingApps";
  uint64_t v0 = [NSDictionary dictionaryWithObjects:v3 forKeys:v2 count:7];
  uint64_t v1 = (void *)getRatingSystemTypeFrom__typeValues;
  getRatingSystemTypeFrom__typeValues = v0;
}

- (id)getClosestRestrictionMatch:(id)a3 within:(id)a4 forPayloadKey:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [v7 integerValue];
  id v11 = [v9 componentsSeparatedByString:@"."];

  long long v12 = [v11 lastObject];

  if ([v12 isEqualToString:@"ratingApps"]) {
    long long v13 = &unk_26D967168;
  }
  else {
    long long v13 = &unk_26D967150;
  }
  if ([v7 isEqual:v13])
  {
    id v14 = v7;
  }
  else
  {
    long long v15 = [v8 sortedArrayUsingComparator:&__block_literal_global_91];

    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __67__STRegionRatings_getClosestRestrictionMatch_within_forPayloadKey___block_invoke_2;
    v18[3] = &__block_descriptor_40_e25_B32__0__NSNumber_8Q16_B24l;
    v18[4] = v10;
    uint64_t v16 = [v15 indexOfObjectPassingTest:v18];
    if (v16 == 0x7FFFFFFFFFFFFFFFLL)
    {
      id v14 = &unk_26D967180;
    }
    else
    {
      id v14 = [v15 objectAtIndexedSubscript:v16];
    }
    id v8 = v15;
  }

  return v14;
}

uint64_t __67__STRegionRatings_getClosestRestrictionMatch_within_forPayloadKey___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 compare:a2];
}

BOOL __67__STRegionRatings_getClosestRestrictionMatch_within_forPayloadKey___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  if ([a2 integerValue] > *(void *)(a1 + 32)) {
    return *a4 != 0;
  }
  BOOL result = 1;
  *a4 = 1;
  return result;
}

- (NSDictionary)regionRatingsData
{
  return self->_regionRatingsData;
}

- (void)setRegionRatingsData:(id)a3
{
}

- (void).cxx_destruct
{
}

@end