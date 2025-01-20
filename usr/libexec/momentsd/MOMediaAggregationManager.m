@interface MOMediaAggregationManager
- (BOOL)_isInSongOnRepetBundles:(id)a3 mediaTitle:(id)a4;
- (id)_UpdateAssetPriority:(id)a3 parameters:(id)a4 isSong:(BOOL)a5 isFirstPartyApp:(BOOL)a6;
- (id)_calculateEndDateFromEventBundles:(id)a3;
- (id)_calculateStartDateFromEventBundles:(id)a3;
- (id)_createMediaDictionaryFromBundles:(id)a3;
- (id)_getEventBundleBasedOnMediaTypeEnum:(id)a3 playSessionMediaType:(unint64_t)a4 startTime:(id)a5 endTime:(id)a6;
- (id)_getEventBundleBasedOnMediaTypeEnumForThirdPartyApps:(id)a3 startTime:(id)a4 endTime:(id)a5;
- (id)_getEventBundleByCategoryGroup:(id)a3 isFirstPartyApp:(BOOL)a4;
- (id)_getMediaOnRepeatMegaBundle:(id)a3 mediaTypeEnum:(unint64_t)a4 parameters:(id)a5;
- (id)_getMediaOnRepeatMegaBundleForThirdParty:(id)a3 mediaTypeEnum:(unint64_t)a4 parameters:(id)a5;
- (id)_getPlayedMediaMegaBundle:(id)a3 mediaTypeEnum:(unint64_t)a4 paramters:(id)a5;
- (id)_getPlayedMediaMegaBundleForThirdParty:(id)a3 mediaTypeEnum:(unint64_t)a4 paramters:(id)a5;
- (id)_groupBundleByApps:(id)a3;
- (id)_limitMOResourcesAndUpdatePriority:(id)a3 parameters:(id)a4 isSong:(BOOL)a5 isFirstPartyApp:(BOOL)a6;
- (id)_megaBundlesForCoarseGranularityFromMediaPlaySessionsBundles:(id)a3 paramters:(id)a4;
- (id)_megaBundlesFromMediaPlaySessionsBundles:(id)a3 paramters:(id)a4;
- (id)_sortAndLimitBundlesForThirdPartyApps:(id)a3 playtimeDict:(id)a4;
- (id)_sortAndMergeBundlesForThirdPartyApps:(id)a3 playtimeDict:(id)a4 paramters:(id)a5 mediaActionIsRepeat:(BOOL)a6;
- (id)_sortBundlesBySumPlaytime:(id)a3;
- (id)_sortResourcesBySumPlaytime:(id)a3;
- (id)getMediaOnRepeatBundleDaily:(id)a3 mediaTypeEnum:(unint64_t)a4 parameters:(id)a5;
- (id)getMediaOnRepeatBundleDailyForThirdPartyApp:(id)a3 mediaTypeEnum:(unint64_t)a4 parameters:(id)a5;
- (id)getPlayedMediaBundleDaily:(id)a3 mediaTypeEnum:(unint64_t)a4 parameters:(id)a5 isPlayedSong:(BOOL)a6 songOnRepeatBundles:(id)a7;
- (id)getPlayedMediaBundleDailyForThirdPartyApp:(id)a3 mediaTypeEnum:(unint64_t)a4 parameters:(id)a5 songOnRepeatBundles:(id)a6;
- (unsigned)_isFirstPartyApp:(id)a3;
- (void)_aggregateBundlesForCoarseGranularity:(id)a3 withParameters:(id)a4 handler:(id)a5;
- (void)_aggregateBundlesForFineGranularity:(id)a3 withParameters:(id)a4 handler:(id)a5;
- (void)_updateMOResourceDictionary:(id)a3 dictKey:(id)a4 dictValue:(id)a5;
- (void)_updateRankingDictionary:(id)a3 mediaLength:(double)a4 sumPlaytime:(double)a5 mediaActionIsRepeat:(BOOL)a6;
- (void)aggregateBundles:(id)a3 withParameters:(id)a4 granularity:(unint64_t)a5 handler:(id)a6;
@end

@implementation MOMediaAggregationManager

- (void)aggregateBundles:(id)a3 withParameters:(id)a4 granularity:(unint64_t)a5 handler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if (a5 == 2)
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = __81__MOMediaAggregationManager_aggregateBundles_withParameters_granularity_handler___block_invoke_107;
    v15[3] = &unk_1002CA140;
    id v16 = v12;
    [(MOMediaAggregationManager *)self _aggregateBundlesForCoarseGranularity:v10 withParameters:v11 handler:v15];
    v14 = v16;
  }
  else
  {
    if (a5 != 1)
    {
      (*((void (**)(id, void, void))v12 + 2))(v12, 0, 0);
      goto LABEL_7;
    }
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = __81__MOMediaAggregationManager_aggregateBundles_withParameters_granularity_handler___block_invoke;
    v17[3] = &unk_1002CA140;
    id v18 = v12;
    [(MOMediaAggregationManager *)self _aggregateBundlesForFineGranularity:v10 withParameters:v11 handler:v17];
    v14 = v18;
  }

LABEL_7:
}

void __81__MOMediaAggregationManager_aggregateBundles_withParameters_granularity_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v8 = 134217984;
    id v9 = [v5 count];
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "FineGranularityAggregation for Media: media eventBundles count, %lu", (uint8_t *)&v8, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __81__MOMediaAggregationManager_aggregateBundles_withParameters_granularity_handler___block_invoke_107(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v8 = 134217984;
    id v9 = [v5 count];
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "CoarseGranularityAggregation for Media: output eventBundles count, %lu", (uint8_t *)&v8, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_aggregateBundlesForFineGranularity:(id)a3 withParameters:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *, void))a5;
  id v11 = [v8 count];
  id v12 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_INFO);
  if (v11)
  {
    if (v13)
    {
      int v17 = 134217984;
      id v18 = [v8 count];
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "FineGranularityAggregation for Media: input eventBundles count, %lu", (uint8_t *)&v17, 0xCu);
    }

    v14 = [(MOMediaAggregationManager *)self _megaBundlesFromMediaPlaySessionsBundles:v8 paramters:v9];
    v15 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      id v16 = [v14 count];
      int v17 = 134217984;
      id v18 = v16;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "FineGranularityAggregation for Media: output eventBundles count, %lu", (uint8_t *)&v17, 0xCu);
    }

    v10[2](v10, v14, 0);
    id v10 = (void (**)(id, void *, void))v14;
  }
  else
  {
    if (v13)
    {
      LOWORD(v17) = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "FineGranularityAggregation for Media: No eventBundle to be proccessed", (uint8_t *)&v17, 2u);
    }

    v10[2](v10, 0, 0);
  }
}

- (void)_aggregateBundlesForCoarseGranularity:(id)a3 withParameters:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *, void))a5;
  id v12 = [v8 count];
  BOOL v13 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_INFO);
  if (v12)
  {
    if (v14)
    {
      int v19 = 134217984;
      id v20 = [v8 count];
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "CoarseGranularityAggregation for media: input eventBundles count, %lu", (uint8_t *)&v19, 0xCu);
    }

    v15 = [(MOMediaAggregationManager *)self _megaBundlesForCoarseGranularityFromMediaPlaySessionsBundles:v8 paramters:v9];
    id v16 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      id v17 = [v15 count];
      int v19 = 134217984;
      id v20 = v17;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "CoarseGranularityAggregation for media: output eventBundles count, %lu", (uint8_t *)&v19, 0xCu);
    }

    v10[2](v10, v15, 0);
  }
  else
  {
    if (v14)
    {
      LOWORD(v19) = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "CoarseGranularityAggregation for media: No eventBundle to be proccessed", (uint8_t *)&v19, 2u);
    }

    v10[2](v10, 0, 0);
  }
}

- (id)_sortResourcesBySumPlaytime:(id)a3
{
  return [a3 sortedArrayUsingComparator:&__block_literal_global_28];
}

int64_t __57__MOMediaAggregationManager__sortResourcesBySumPlaytime___block_invoke(id a1, MOResource *a2, MOResource *a3)
{
  v4 = a2;
  id v5 = a3;
  v7 = [(MOResource *)v4 getDictionary];
  id v8 = [v7 objectForKey:@"MOMediaPlayMetaDataKeyPlayerSumPlaytime"];

  id v9 = [(MOResource *)v5 getDictionary];
  id v10 = [v9 objectForKey:@"MOMediaPlayMetaDataKeyPlayerSumPlaytime"];

  [v8 doubleValue];
  double v12 = v11;
  [v10 doubleValue];
  if (v12 >= v13)
  {
    [v8 doubleValue];
    double v16 = v15;
    [v10 doubleValue];
    if (v16 <= v17)
    {
      id v18 = [(MOResource *)v4 identifier];
      int v19 = [(MOResource *)v5 identifier];
      int64_t v14 = (int64_t)[v18 compare:v19];
    }
    else
    {
      int64_t v14 = -1;
    }
  }
  else
  {
    int64_t v14 = 1;
  }

  return v14;
}

- (id)_sortBundlesBySumPlaytime:(id)a3
{
  return [a3 sortedArrayUsingComparator:&__block_literal_global_111];
}

int64_t __55__MOMediaAggregationManager__sortBundlesBySumPlaytime___block_invoke(id a1, MOEventBundle *a2, MOEventBundle *a3)
{
  v4 = a2;
  id v5 = a3;
  v7 = [(MOEventBundle *)v4 resources];
  id v8 = [v7 firstObject];
  id v9 = [v8 getDictionary];
  id v10 = [v9 objectForKey:@"MOMediaPlayMetaDataKeyPlayerSumPlaytime"];

  double v11 = [(MOEventBundle *)v5 resources];
  double v12 = [v11 firstObject];
  double v13 = [v12 getDictionary];
  int64_t v14 = [v13 objectForKey:@"MOMediaPlayMetaDataKeyPlayerSumPlaytime"];

  [v10 doubleValue];
  double v16 = v15;
  [v14 doubleValue];
  if (v16 >= v17)
  {
    [v10 doubleValue];
    double v20 = v19;
    [v14 doubleValue];
    if (v20 <= v21)
    {
      v22 = [(MOEventBundle *)v4 bundleIdentifier];
      v23 = [(MOEventBundle *)v5 bundleIdentifier];
      int64_t v18 = (int64_t)[v22 compare:v23];
    }
    else
    {
      int64_t v18 = -1;
    }
  }
  else
  {
    int64_t v18 = 1;
  }

  return v18;
}

- (id)_groupBundleByApps:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = v3;
  id v5 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v19 = *(void *)v21;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v21 != v19) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        id v10 = [v8 resources];
        double v11 = [v10 firstObject];
        double v12 = [v11 getDictionary];
        double v13 = [v12 objectForKey:@"MOMediaPlayMetaDataKeyPlayerBundleID"];

        if (v13)
        {
          int64_t v14 = [v4 objectForKey:v13];

          if (v14)
          {
            double v15 = [v4 objectForKey:v13];
          }
          else
          {
            double v15 = objc_opt_new();
          }
          double v16 = v15;
          [v15 addObject:v8];
          [v4 setObject:v16 forKey:v13];
        }
      }
      id v6 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v6);
  }

  return v4;
}

- (id)_limitMOResourcesAndUpdatePriority:(id)a3 parameters:(id)a4 isSong:(BOOL)a5 isFirstPartyApp:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = [v10 count];
  if (v12 <= [v11 mediaBundleMaxResourcesPerBundle])
  {
    v38 = [(MOMediaAggregationManager *)self _UpdateAssetPriority:v10 parameters:v11 isSong:v7 isFirstPartyApp:v6];
  }
  else
  {
    v40 = self;
    BOOL v44 = v7;
    BOOL v41 = v6;
    v42 = v11;
    v45 = objc_opt_new();
    double v13 = objc_opt_new();
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    id v43 = v10;
    id v14 = v10;
    id v15 = [v14 countByEnumeratingWithState:&v50 objects:v55 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v51;
      int64_t v18 = &MOMediaPlayMetaDataKeyPlayerAlbumName;
      if (!v7) {
        int64_t v18 = &MOMediaPlayMetaDataKeyPlayerArtist;
      }
      uint64_t v19 = *v18;
      do
      {
        for (i = 0; i != v16; i = (char *)i + 1)
        {
          if (*(void *)v51 != v17) {
            objc_enumerationMutation(v14);
          }
          long long v21 = *(void **)(*((void *)&v50 + 1) + 8 * i);
          if (v21)
          {
            long long v23 = [v21 getDictionary];
            v24 = [v23 objectForKey:v19];

            if (v24)
            {
              v25 = [v13 objectForKey:v24];

              if (v25)
              {
                v26 = [v13 objectForKey:v24];
              }
              else
              {
                v26 = objc_opt_new();
              }
              v27 = v26;
              if (v26)
              {
                [v26 addObject:v21];
                [v13 setObject:v27 forKey:v24];
              }
            }
          }
        }
        id v16 = [v14 countByEnumeratingWithState:&v50 objects:v55 count:16];
      }
      while (v16);
    }

    id v11 = v42;
    if ((uint64_t)[v42 mediaBundleMaxResourcesPerBundle] >= 1)
    {
      uint64_t v28 = 0;
      int v29 = 0;
      do
      {
        long long v48 = 0u;
        long long v49 = 0u;
        long long v46 = 0u;
        long long v47 = 0u;
        v30 = [v13 allKeys:v40];
        id v31 = [v30 countByEnumeratingWithState:&v46 objects:v54 count:16];
        if (v31)
        {
          id v32 = v31;
          uint64_t v33 = *(void *)v47;
          while (2)
          {
            for (j = 0; j != v32; j = (char *)j + 1)
            {
              if (*(void *)v47 != v33) {
                objc_enumerationMutation(v30);
              }
              v35 = [v13 objectForKey:*(void *)(*((void *)&v46 + 1) + 8 * (void)j)];
              v36 = v35;
              if (v35)
              {
                if ((unint64_t)[v35 count] > v28)
                {
                  v37 = [v36 objectAtIndexedSubscript:v28];
                  [v45 addObject:v37];

                  ++v29;
                }
                if ((uint64_t)[v42 mediaBundleMaxResourcesPerBundle] <= v29)
                {

                  goto LABEL_34;
                }
              }
            }
            id v32 = [v30 countByEnumeratingWithState:&v46 objects:v54 count:16];
            if (v32) {
              continue;
            }
            break;
          }
        }
LABEL_34:

        if ((uint64_t)[v42 mediaBundleMaxResourcesPerBundle] <= v29) {
          break;
        }
        ++v28;
      }
      while ((uint64_t)[v42 mediaBundleMaxResourcesPerBundle] > v28);
    }
    v38 = -[MOMediaAggregationManager _UpdateAssetPriority:parameters:isSong:isFirstPartyApp:](v40, "_UpdateAssetPriority:parameters:isSong:isFirstPartyApp:", v45, v42, v44, v41, v40);

    id v10 = v43;
  }

  return v38;
}

- (id)_UpdateAssetPriority:(id)a3 parameters:(id)a4 isSong:(BOOL)a5 isFirstPartyApp:(BOOL)a6
{
  BOOL v47 = a5;
  id v9 = a3;
  id v10 = a4;
  id v11 = v10;
  if (a6)
  {
    id v42 = v10;
    id v43 = v9;
    id v12 = [(MOMediaAggregationManager *)self _sortResourcesBySumPlaytime:v9];
    double v13 = objc_opt_new();
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    id obj = v12;
    id v14 = [obj countByEnumeratingWithState:&v53 objects:v58 count:16];
    if (v14)
    {
      id v15 = v14;
      int v16 = 0;
      uint64_t v48 = *(void *)v54;
      if (v47) {
        uint64_t v17 = &MOMediaPlayMetaDataKeyPlayerAlbumName;
      }
      else {
        uint64_t v17 = &MOMediaPlayMetaDataKeyPlayerArtist;
      }
      int64_t v18 = *v17;
      do
      {
        uint64_t v19 = 0;
        int v44 = v16;
        int v45 = -v16;
        do
        {
          if (*(void *)v54 != v48) {
            objc_enumerationMutation(obj);
          }
          long long v20 = *(void **)(*((void *)&v53 + 1) + 8 * (void)v19);
          long long v22 = [v20 getDictionary];
          long long v23 = [v22 objectForKey:v18];

          v24 = [v13 objectForKey:v23];

          if (v24)
          {
            v25 = [v20 getDictionary];
            id v26 = [v25 mutableCopy];

            v27 = MOMediaPlayMetaDataKeyPlayerMediaTypeSongAlbum;
            if (!v47) {
              v27 = MOMediaPlayMetaDataKeyPlayerMediaTypePodcastArtist;
            }
            [v26 setObject:*v27 forKeyedSubscript:@"MOMediaPlayMetaDataKeyPlayerMediaTypeKey"];
            uint64_t v28 = [MOResource alloc];
            int v29 = [v20 name];
            v30 = -[MOResource initWithName:type:dict:value:](v28, "initWithName:type:dict:value:", v29, [v20 type], v26, 0.0);

            id v31 = [v20 sourceEventIdentifier];
            [(MOResource *)v30 setSourceEventIdentifier:v31];

            -[MOResource setSourceEventAccessType:](v30, "setSourceEventAccessType:", [v20 sourceEventAccessType]);
            id v32 = [v13 objectForKey:v23];
            [v32 priorityScore];
            -[MOResource setPriorityScore:](v30, "setPriorityScore:");

            [v13 setObject:v30 forKeyedSubscript:v23];
          }
          else
          {
            double v33 = 200.0;
            if (v45 == v19) {
              double v33 = 100.0;
            }
            [v20 setPriorityScore:v33];
            [v13 setObject:v20 forKeyedSubscript:v23];
          }

          uint64_t v19 = (char *)v19 + 1;
        }
        while (v15 != v19);
        int v16 = v44 + v15;
        id v15 = [obj countByEnumeratingWithState:&v53 objects:v58 count:16];
      }
      while (v15);
    }

    id v34 = (id)objc_opt_new();
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    id v35 = v13;
    id v36 = [v35 countByEnumeratingWithState:&v49 objects:v57 count:16];
    if (v36)
    {
      id v37 = v36;
      uint64_t v38 = *(void *)v50;
      do
      {
        for (i = 0; i != v37; i = (char *)i + 1)
        {
          if (*(void *)v50 != v38) {
            objc_enumerationMutation(v35);
          }
          v40 = [v35 objectForKeyedSubscript:*(void *)(*((void *)&v49 + 1) + 8 * i)];
          [v34 addObject:v40];
        }
        id v37 = [v35 countByEnumeratingWithState:&v49 objects:v57 count:16];
      }
      while (v37);
    }

    id v11 = v42;
    id v9 = v43;
  }
  else
  {
    id v34 = v9;
  }

  return v34;
}

- (id)_megaBundlesFromMediaPlaySessionsBundles:(id)a3 paramters:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    id v8 = objc_opt_new();
    id v9 = +[NSPredicate predicateWithFormat:@"%K = %lu", @"interfaceType", 5];
    id v10 = [v6 filteredArrayUsingPredicate:v9];
    if ([v10 count])
    {
      v71 = v9;
      v72 = v6;
      v77 = v8;
      uint64_t v91 = objc_opt_new();
      v90 = objc_opt_new();
      long long v100 = 0u;
      long long v101 = 0u;
      long long v102 = 0u;
      long long v103 = 0u;
      v70 = v10;
      id v11 = v10;
      id v12 = [v11 countByEnumeratingWithState:&v100 objects:v114 count:16];
      if (v12)
      {
        id v13 = v12;
        uint64_t v14 = *(void *)v101;
        do
        {
          id v15 = v11;
          for (i = 0; i != v13; i = (char *)i + 1)
          {
            if (*(void *)v101 != v14) {
              objc_enumerationMutation(v15);
            }
            uint64_t v17 = *(void **)(*((void *)&v100 + 1) + 8 * i);
            int64_t v18 = [v17 events];
            id v19 = [v18 count];

            if (v19)
            {
              long long v20 = [v17 events];
              long long v21 = [v20 firstObject];
              unsigned int v22 = [(MOMediaAggregationManager *)self _isFirstPartyApp:v21];

              if (v22) {
                long long v23 = (void *)v91;
              }
              else {
                long long v23 = v90;
              }
              [v23 addObject:v17];
            }
          }
          id v11 = v15;
          id v13 = [v15 countByEnumeratingWithState:&v100 objects:v114 count:16];
        }
        while (v13);
      }

      v24 = +[NSCalendar currentCalendar];
      v25 = [v72 getTimeSpanOfMOEventBundleArray];
      id v26 = [v25 startDate];
      uint64_t v27 = [v24 components:28 fromDate:v26];

      v69 = (void *)v27;
      uint64_t v28 = [v24 dateFromComponents:v27];
      v76 = v24;
      uint64_t v29 = [v24 dateByAddingUnit:16 value:1 toDate:v28 options:0];
      v78 = v25;
      v30 = [v25 endDate];
      id v31 = [v28 compare:v30];

      if (v31 == (id)-1)
      {
        v74 = v11;
        id v8 = v77;
        id v42 = (void *)v29;
        id v75 = v7;
        v73 = self;
        do
        {
          id v43 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
          v89 = v42;
          if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
          {
            v67 = [v78 startDate];
            v68 = [v78 endDate];
            *(_DWORD *)buf = 138413058;
            id v107 = v28;
            __int16 v108 = 2112;
            v109 = v89;
            __int16 v110 = 2112;
            v111 = v67;
            __int16 v112 = 2112;
            v113 = v68;
            _os_log_debug_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEBUG, "FineGranularityAggregation: process media bundles with start time, %@, end time, %@, event bundles start date, %@, end date, %@", buf, 0x2Au);

            id v42 = v89;
          }

          uint64_t v44 = [(MOMediaAggregationManager *)self _getEventBundleBasedOnMediaTypeEnum:v91 playSessionMediaType:1 startTime:v28 endTime:v42];
          uint64_t v45 = [(MOMediaAggregationManager *)self getMediaOnRepeatBundleDaily:v44 mediaTypeEnum:1 parameters:v7];
          if (v45) {
            [v8 addObject:v45];
          }
          v85 = [(MOMediaAggregationManager *)self _getEventBundleBasedOnMediaTypeEnum:v91 playSessionMediaType:2 startTime:v28 endTime:v42];
          long long v46 = -[MOMediaAggregationManager getPlayedMediaBundleDaily:mediaTypeEnum:parameters:isPlayedSong:songOnRepeatBundles:](self, "getPlayedMediaBundleDaily:mediaTypeEnum:parameters:isPlayedSong:songOnRepeatBundles:");
          if (v46) {
            [v8 addObject:v46];
          }
          v84 = [(MOMediaAggregationManager *)self _getEventBundleBasedOnMediaTypeEnum:v91 playSessionMediaType:3 startTime:v28 endTime:v42];
          uint64_t v47 = -[MOMediaAggregationManager getPlayedMediaBundleDaily:mediaTypeEnum:parameters:isPlayedSong:songOnRepeatBundles:](self, "getPlayedMediaBundleDaily:mediaTypeEnum:parameters:isPlayedSong:songOnRepeatBundles:");
          if (v47) {
            [v8 addObject:v47];
          }
          v87 = (void *)v44;
          uint64_t v48 = v44;
          id v49 = v7;
          uint64_t v50 = [(MOMediaAggregationManager *)self getPlayedMediaBundleDaily:v48 mediaTypeEnum:1 parameters:v7 isPlayedSong:1 songOnRepeatBundles:v45];
          if (v50) {
            [v8 addObject:v50];
          }
          v82 = (void *)v50;
          uint64_t v51 = [(MOMediaAggregationManager *)self _getEventBundleBasedOnMediaTypeEnumForThirdPartyApps:v90 startTime:v28 endTime:v42];
          id v52 = v49;
          uint64_t v53 = [(MOMediaAggregationManager *)self getMediaOnRepeatBundleDailyForThirdPartyApp:v51 mediaTypeEnum:5 parameters:v49];
          if (v53) {
            [v8 addObject:v53];
          }
          v83 = (void *)v47;
          v86 = (void *)v45;
          v88 = v28;
          v81 = (void *)v51;
          uint64_t v54 = [(MOMediaAggregationManager *)self getPlayedMediaBundleDailyForThirdPartyApp:v51 mediaTypeEnum:5 parameters:v52 songOnRepeatBundles:v53];
          if (v54) {
            [v8 addObject:v54];
          }
          v79 = (void *)v54;
          v80 = (void *)v53;
          long long v98 = 0u;
          long long v99 = 0u;
          long long v96 = 0u;
          long long v97 = 0u;
          id v55 = v74;
          id v56 = [v55 countByEnumeratingWithState:&v96 objects:v105 count:16];
          if (v56)
          {
            id v57 = v56;
            uint64_t v58 = *(void *)v97;
            do
            {
              for (j = 0; j != v57; j = (char *)j + 1)
              {
                v60 = v46;
                if (*(void *)v97 != v58) {
                  objc_enumerationMutation(v55);
                }
                v61 = *(void **)(*((void *)&v96 + 1) + 8 * (void)j);
                v62 = [v61 action];
                v63 = [v62 actionName];
                unsigned int v64 = [v63 isEqualToString:@"played_media_sessions"];

                if (v64) {
                  [v61 setIsAggregatedAndSuppressed:1];
                }
                long long v46 = v60;
              }
              id v57 = [v55 countByEnumeratingWithState:&v96 objects:v105 count:16];
            }
            while (v57);
          }

          double v33 = [v76 dateByAddingUnit:16 value:1 toDate:v88 options:0];

          id v32 = [v76 dateByAddingUnit:16 value:1 toDate:v89 options:0];

          v65 = [v78 endDate];
          id v66 = [v33 compare:v65];

          uint64_t v28 = v33;
          id v42 = v32;
          id v7 = v75;
          id v8 = v77;
          self = v73;
        }
        while (v66 == (id)-1);
      }
      else
      {
        id v32 = (void *)v29;
        double v33 = v28;
        id v8 = v77;
      }
      long long v94 = 0u;
      long long v95 = 0u;
      long long v92 = 0u;
      long long v93 = 0u;
      id v34 = v8;
      id v35 = [v34 countByEnumeratingWithState:&v92 objects:v104 count:16];
      if (v35)
      {
        id v36 = v35;
        uint64_t v37 = *(void *)v93;
        do
        {
          for (k = 0; k != v36; k = (char *)k + 1)
          {
            if (*(void *)v93 != v37) {
              objc_enumerationMutation(v34);
            }
            [*(id *)(*((void *)&v92 + 1) + 8 * (void)k) setSummarizationGranularity:1];
          }
          id v36 = [v34 countByEnumeratingWithState:&v92 objects:v104 count:16];
        }
        while (v36);
      }

      v39 = v34;
      id v9 = v71;
      id v6 = v72;
      id v10 = v70;
      v40 = v91;
    }
    else
    {
      v40 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
      if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_INFO, "FineGranularityAggregation: media play sessions bundles are filtered.", buf, 2u);
      }
      v39 = 0;
    }
  }
  else
  {
    id v8 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      id v107 = [v6 count];
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "FineGranularityAggregation: no needed to generate media bundles since bundles  count is: %lu", buf, 0xCu);
    }
    v39 = 0;
  }

  return v39;
}

- (id)_getEventBundleByCategoryGroup:(id)a3 isFirstPartyApp:(BOOL)a4
{
  BOOL v18 = a4;
  id v4 = a3;
  id v16 = (id)objc_opt_new();
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = v4;
  id v5 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v20;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        id v11 = [v9 resources];
        id v12 = [v11 firstObject];
        id v13 = [v12 getDictionary];
        uint64_t v14 = [v13 objectForKey:@"MOMediaPlayMetaDataKeyPlayerBundleID"];

        if (v14
          && +[MOMediaPlaySession isFirstPartyApp:v14] == v18)
        {
          [v16 addObject:v9];
        }
      }
      id v6 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v6);
  }

  return v16;
}

- (id)_getEventBundleBasedOnMediaTypeEnumForThirdPartyApps:(id)a3 startTime:(id)a4 endTime:(id)a5
{
  id v7 = a3;
  id v26 = a4;
  id v24 = a5;
  id v23 = (id)objc_opt_new();
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id obj = v7;
  id v8 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v28;
    do
    {
      id v11 = 0;
      do
      {
        if (*(void *)v28 != v10) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(void **)(*((void *)&v27 + 1) + 8 * (void)v11);
        uint64_t v14 = [v12 resources];
        id v15 = [v14 firstObject];
        id v16 = [v15 getDictionary];
        uint64_t v17 = [v16 objectForKey:@"MOMediaPlayMetaDataKeyPlayerBundleID"];

        BOOL v18 = [v12 startDate];
        if (([v18 isAfterDate:v26] & 1) == 0) {
          goto LABEL_10;
        }
        long long v19 = [v12 startDate];
        if (![v19 isBeforeDate:v24]
          || +[MOMediaPlaySession isFirstPartyApp:v17])
        {

LABEL_10:
          goto LABEL_11;
        }
        unsigned __int8 v20 = [v17 hasPrefix:@"com.apple"];

        if ((v20 & 1) == 0) {
          [v23 addObject:v12];
        }
LABEL_11:

        id v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v21 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
      id v9 = v21;
    }
    while (v21);
  }

  return v23;
}

- (unsigned)_isFirstPartyApp:(id)a3
{
  id v3 = [a3 mediaEvent];
  id v4 = [v3 mediaPlayerBundleId];

  unsigned __int8 v5 = v4 && ([v4 hasPrefix:@"com.apple."] & 1) != 0;
  return v5;
}

- (id)_getEventBundleBasedOnMediaTypeEnum:(id)a3 playSessionMediaType:(unint64_t)a4 startTime:(id)a5 endTime:(id)a6
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a6;
  id v21 = (id)objc_opt_new();
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v11 = v8;
  id v12 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v23;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v23 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        uint64_t v17 = [v16 startDate];
        if ([v17 isAfterDate:v9])
        {
          BOOL v18 = [v16 startDate];
          unsigned int v19 = [v18 isBeforeDate:v10];

          if (v19) {
            [v21 addObject:v16];
          }
        }
        else
        {
        }
      }
      id v13 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v13);
  }

  return v21;
}

- (id)getMediaOnRepeatBundleDaily:(id)a3 mediaTypeEnum:(unint64_t)a4 parameters:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  if ([v7 count])
  {
    id v63 = v8;
    id v64 = v7;
    v65 = self;
    id v9 = [(MOMediaAggregationManager *)self _sortBundlesBySumPlaytime:v7];
    v68 = objc_opt_new();
    v69 = objc_opt_new();
    long long v74 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    long long v77 = 0u;
    id obj = v9;
    id v71 = [obj countByEnumeratingWithState:&v74 objects:v86 count:16];
    if (v71)
    {
      uint64_t v70 = *(void *)v75;
      double v10 = 0.0;
      double v11 = 0.0;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v75 != v70) {
            objc_enumerationMutation(obj);
          }
          id v13 = *(MOEventBundle **)(*((void *)&v74 + 1) + 8 * v12);
          uint64_t v14 = [(MOEventBundle *)v13 events];
          id v15 = [v14 count];
          id v16 = [(MOEventBundle *)v13 resources];
          id v17 = [v16 count];

          uint64_t v72 = v12;
          if (v15 == v17)
          {
            BOOL v18 = [(MOEventBundle *)v13 resources];
            id v19 = [v18 count];

            if (v19)
            {
              unint64_t v20 = 0;
              do
              {
                long long v22 = [(MOEventBundle *)v13 resources];
                long long v23 = [v22 objectAtIndexedSubscript:v20];

                long long v24 = [v23 getDictionary];
                long long v25 = [v24 objectForKey:@"MOMediaPlayMetaDataKeyPlayerSumPlaytime"];

                id v26 = [v23 getDictionary];
                long long v27 = [v26 objectForKey:@"MOMediaPlayMetaDataKeyPlayerDuration"];

                long long v28 = [v23 getDictionary];
                long long v29 = [v28 objectForKey:@"media_type"];
                uint64_t v30 = (int)[v29 intValue];

                if (v30 == a4)
                {
                  id v31 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
                  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
                  {
                    BOOL v41 = [v23 getDictionary];
                    id v42 = [v41 objectForKey:@"MOMediaPlayMetaDataKeyPlayerTitle"];
                    v67 = +[MOMediaPlaySession redactString:v42];
                    *(_DWORD *)buf = 136315906;
                    v79 = "-[MOMediaAggregationManager getMediaOnRepeatBundleDaily:mediaTypeEnum:parameters:]";
                    __int16 v80 = 2112;
                    v81 = v67;
                    __int16 v82 = 2112;
                    v83 = v27;
                    __int16 v84 = 2112;
                    v85 = v25;
                    _os_log_debug_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEBUG, "%s, media on repeat daily bundle with media title, %@, duration, %@, total play time, %@", buf, 0x2Au);
                  }
                  if (v27)
                  {
                    if ((int)[v27 intValue] >= 1)
                    {
                      [v25 doubleValue];
                      double v33 = v32;
                      [v27 doubleValue];
                      if (v33 / v34 >= 2.95)
                      {
                        [v25 doubleValue];
                        double v11 = v11 + v35;
                        [v27 doubleValue];
                        double v10 = v10 + v36;
                        uint64_t v37 = [(MOEventBundle *)v13 events];
                        uint64_t v38 = [v37 objectAtIndexedSubscript:v20];
                        [v69 addObject:v38];

                        [v68 addObject:v23];
                      }
                    }
                  }
                }

                ++v20;
                v39 = [(MOEventBundle *)v13 resources];
                id v40 = [v39 count];
              }
              while ((unint64_t)v40 > v20);
            }
          }
          else
          {
            id v43 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
            if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 136315394;
              v79 = "-[MOMediaAggregationManager getMediaOnRepeatBundleDaily:mediaTypeEnum:parameters:]";
              __int16 v80 = 2112;
              v81 = v13;
              _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_INFO, "%s, media bundle had bad data, %@", buf, 0x16u);
            }
          }
          uint64_t v12 = v72 + 1;
        }
        while ((id)(v72 + 1) != v71);
        id v71 = [obj countByEnumeratingWithState:&v74 objects:v86 count:16];
      }
      while (v71);
    }
    else
    {
      double v10 = 0.0;
      double v11 = 0.0;
    }

    uint64_t v45 = v68;
    if ([v68 count])
    {
      long long v46 = [(MOMediaAggregationManager *)v65 _sortResourcesBySumPlaytime:v68];
      uint64_t v47 = [MOEventBundle alloc];
      id v48 = [objc_alloc((Class)NSSet) initWithArray:v69];
      uint64_t v44 = [(MOEventBundle *)v47 initWithEventSet:v48 filtered:0];

      [(MOEventBundle *)v44 setInterfaceType:5];
      id v49 = @"song_on_repeat";
      if ((unint64_t)[v68 count] >= 2)
      {
        uint64_t v50 = @"songs_on_repeat";

        id v49 = v50;
      }
      [(MOEventBundle *)v44 setBundleSuperType:4];
      [(MOEventBundle *)v44 setBundleSubType:401];
      uint64_t v51 = [obj firstObject];
      id v52 = [v51 promptLanguage];
      uint64_t v53 = +[NSString stringWithFormat:@"%@, etc.", v52];
      [(MOEventBundle *)v44 setPromptLanguage:v53];

      uint64_t v54 = [[MOAction alloc] initWithActionName:v49 actionType:1 actionSubtype:6];
      [(MOEventBundle *)v44 setAction:v54];

      id v55 = [v69 firstObject];
      id v56 = [v55 eventIdentifier];
      id v57 = [(MOEventBundle *)v44 action];
      [v57 setSourceEventIdentifier:v56];

      uint64_t v58 = [obj firstObject];
      v59 = [v58 labels];
      [(MOEventBundle *)v44 setLabels:v59];

      id v8 = v63;
      v60 = [(MOMediaAggregationManager *)v65 _limitMOResourcesAndUpdatePriority:v46 parameters:v63 isSong:1 isFirstPartyApp:1];
      [(MOEventBundle *)v44 setResources:v60];

      [(MOMediaAggregationManager *)v65 _updateRankingDictionary:v44 mediaLength:1 sumPlaytime:v10 mediaActionIsRepeat:v11];
      v61 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
      if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v79 = "-[MOMediaAggregationManager getMediaOnRepeatBundleDaily:mediaTypeEnum:parameters:]";
        __int16 v80 = 2112;
        v81 = v44;
        _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_INFO, "%s, bundle, %@, event category, Song on repeat", buf, 0x16u);
      }

      uint64_t v45 = v68;
    }
    else
    {
      uint64_t v44 = 0;
      id v8 = v63;
    }

    id v7 = v64;
  }
  else
  {
    uint64_t v44 = 0;
  }

  return v44;
}

- (id)getMediaOnRepeatBundleDailyForThirdPartyApp:(id)a3 mediaTypeEnum:(unint64_t)a4 parameters:(id)a5
{
  id v7 = a3;
  id v77 = a5;
  __int16 v82 = self;
  long long v74 = v7;
  id v8 = [(MOMediaAggregationManager *)self _groupBundleByApps:v7];
  long long v76 = objc_opt_new();
  long long v75 = objc_opt_new();
  long long v97 = 0u;
  long long v98 = 0u;
  long long v99 = 0u;
  long long v100 = 0u;
  id obj = [v8 allKeys];
  id v9 = [obj countByEnumeratingWithState:&v97 objects:v110 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v98;
    uint64_t v78 = *(void *)v98;
    v79 = v8;
    do
    {
      uint64_t v12 = 0;
      id v80 = v10;
      do
      {
        if (*(void *)v98 != v11) {
          objc_enumerationMutation(obj);
        }
        id v13 = [v8 objectForKey:*(void *)(*((void *)&v97 + 1) + 8 * (void)v12)];
        uint64_t v14 = v13;
        if (v13 && [v13 count])
        {
          v83 = v14;
          __int16 v84 = v12;
          id v15 = [(MOMediaAggregationManager *)v82 _sortBundlesBySumPlaytime:v14];
          v86 = objc_opt_new();
          v85 = objc_opt_new();
          long long v93 = 0u;
          long long v94 = 0u;
          long long v95 = 0u;
          long long v96 = 0u;
          id v16 = v15;
          id v89 = [v16 countByEnumeratingWithState:&v93 objects:v109 count:16];
          if (v89)
          {
            uint64_t v87 = *(void *)v94;
            v88 = v16;
            double v17 = 0.0;
            double v18 = 0.0;
            do
            {
              uint64_t v19 = 0;
              do
              {
                if (*(void *)v94 != v87) {
                  objc_enumerationMutation(v16);
                }
                unint64_t v20 = *(MOEventBundle **)(*((void *)&v93 + 1) + 8 * v19);
                long long v22 = [(MOEventBundle *)v20 events];
                id v23 = [v22 count];
                long long v24 = [(MOEventBundle *)v20 resources];
                id v25 = [v24 count];

                context = v21;
                uint64_t v91 = v19;
                if (v23 == v25)
                {
                  id v26 = [(MOEventBundle *)v20 resources];
                  id v27 = [v26 count];

                  if (v27)
                  {
                    unint64_t v28 = 0;
                    do
                    {
                      uint64_t v30 = [(MOEventBundle *)v20 resources];
                      id v31 = [v30 objectAtIndexedSubscript:v28];

                      double v32 = [v31 getDictionary];
                      double v33 = [v32 objectForKey:@"MOMediaPlayMetaDataKeyPlayerSumPlaytime"];

                      double v34 = [v31 getDictionary];
                      double v35 = [v34 objectForKey:@"MOMediaPlayMetaDataKeyPlayerDuration"];

                      double v36 = [v31 getDictionary];
                      uint64_t v37 = [v36 objectForKey:@"media_type"];
                      uint64_t v38 = (int)[v37 intValue];

                      if (v38 == a4)
                      {
                        v39 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
                        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
                        {
                          id v49 = [v31 getDictionary];
                          uint64_t v50 = [v49 objectForKey:@"MOMediaPlayMetaDataKeyPlayerTitle"];
                          uint64_t v51 = +[MOMediaPlaySession redactString:v50];
                          *(_DWORD *)buf = 136315906;
                          long long v102 = "-[MOMediaAggregationManager getMediaOnRepeatBundleDailyForThirdPartyApp:mediaTypeEnum:parameters:]";
                          __int16 v103 = 2112;
                          v104 = v51;
                          __int16 v105 = 2112;
                          v106 = v35;
                          __int16 v107 = 2112;
                          __int16 v108 = v33;
                          _os_log_debug_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEBUG, "%s, third party media on repeat daily bundle with media title, %@, duration, %@, total play time, %@", buf, 0x2Au);
                        }
                        if (v35)
                        {
                          if ((int)[v35 intValue] >= 1)
                          {
                            [v33 doubleValue];
                            double v41 = v40;
                            [v35 doubleValue];
                            if (v41 / v42 >= 2.95)
                            {
                              [v33 doubleValue];
                              double v18 = v18 + v43;
                              [v35 doubleValue];
                              double v17 = v17 + v44;
                              uint64_t v45 = [(MOEventBundle *)v20 events];
                              long long v46 = [v45 objectAtIndexedSubscript:v28];
                              [v85 addObject:v46];

                              [v86 addObject:v31];
                            }
                          }
                        }
                      }

                      ++v28;
                      uint64_t v47 = [(MOEventBundle *)v20 resources];
                      id v48 = [v47 count];
                    }
                    while ((unint64_t)v48 > v28);
                  }
                }
                else
                {
                  id v52 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
                  if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 136315394;
                    long long v102 = "-[MOMediaAggregationManager getMediaOnRepeatBundleDailyForThirdPartyApp:mediaTypeEnum:parameters:]";
                    __int16 v103 = 2112;
                    v104 = v20;
                    _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_INFO, "%s, media bundle had bad data, %@", buf, 0x16u);
                  }
                }
                uint64_t v19 = v91 + 1;
                id v16 = v88;
              }
              while ((id)(v91 + 1) != v89);
              id v89 = [v88 countByEnumeratingWithState:&v93 objects:v109 count:16];
            }
            while (v89);
          }
          else
          {
            double v17 = 0.0;
            double v18 = 0.0;
          }

          uint64_t v53 = v86;
          if ([v86 count])
          {
            uint64_t v54 = [(MOMediaAggregationManager *)v82 _sortResourcesBySumPlaytime:v86];
            id v55 = [MOEventBundle alloc];
            id v56 = [objc_alloc((Class)NSSet) initWithArray:v85];
            id v57 = [(MOEventBundle *)v55 initWithEventSet:v56 filtered:0];

            [(MOEventBundle *)v57 setInterfaceType:5];
            uint64_t v58 = @"media_on_repeat_third_party";
            [(MOEventBundle *)v57 setBundleSuperType:4];
            [(MOEventBundle *)v57 setBundleSubType:407];
            v59 = [v16 firstObject];
            v60 = [v59 promptLanguage];
            v61 = +[NSString stringWithFormat:@"%@, etc.", v60];
            [(MOEventBundle *)v57 setPromptLanguage:v61];

            v62 = [[MOAction alloc] initWithActionName:v58 actionType:1 actionSubtype:6];
            [(MOEventBundle *)v57 setAction:v62];

            id v63 = [v16 firstObject];
            id v64 = [v63 labels];
            [(MOEventBundle *)v57 setLabels:v64];

            v65 = [(MOMediaAggregationManager *)v82 _limitMOResourcesAndUpdatePriority:v54 parameters:v77 isSong:1 isFirstPartyApp:0];
            [(MOEventBundle *)v57 setResources:v65];

            [(MOEventBundle *)v57 setIsAggregatedAndSuppressed:1];
            [(MOMediaAggregationManager *)v82 _updateRankingDictionary:v57 mediaLength:1 sumPlaytime:v17 mediaActionIsRepeat:v18];
            id v66 = +[NSNumber numberWithDouble:v18];
            v67 = [(MOEventBundle *)v57 resources];
            v68 = [v67 firstObject];
            v69 = [v68 getDictionary];
            uint64_t v70 = [v69 objectForKey:@"MOMediaPlayMetaDataKeyPlayerBundleID"];
            [v76 setValue:v66 forKey:v70];

            [v75 addObject:v57];
            id v71 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
            if (os_log_type_enabled(v71, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 136315394;
              long long v102 = "-[MOMediaAggregationManager getMediaOnRepeatBundleDailyForThirdPartyApp:mediaTypeEnum:parameters:]";
              __int16 v103 = 2112;
              v104 = v57;
              _os_log_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_INFO, "%s, bundle, %@, event category, Media on repeat for third party apps", buf, 0x16u);
            }

            uint64_t v53 = v86;
          }

          uint64_t v11 = v78;
          id v8 = v79;
          id v10 = v80;
          uint64_t v14 = v83;
          uint64_t v12 = v84;
        }

        uint64_t v12 = (char *)v12 + 1;
      }
      while (v12 != v10);
      id v10 = [obj countByEnumeratingWithState:&v97 objects:v110 count:16];
    }
    while (v10);
  }

  uint64_t v72 = [(MOMediaAggregationManager *)v82 _sortAndMergeBundlesForThirdPartyApps:v75 playtimeDict:v76 paramters:v77 mediaActionIsRepeat:1];

  return v72;
}

- (id)_sortAndLimitBundlesForThirdPartyApps:(id)a3 playtimeDict:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ((unint64_t)[v5 count] > 2)
  {
    id v23 = v6;
    id v7 = [v6 keysSortedByValueUsingComparator:&__block_literal_global_139];
    id v26 = (id)objc_opt_new();
    unint64_t v28 = v7;
    if ([v7 count])
    {
      int v8 = 0;
      uint64_t v9 = 0;
      id v24 = v5;
      do
      {
        int v25 = v8;
        long long v31 = 0u;
        long long v32 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        id obj = v5;
        id v10 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
        if (v10)
        {
          id v11 = v10;
          uint64_t v12 = *(void *)v30;
          do
          {
            for (i = 0; i != v11; i = (char *)i + 1)
            {
              if (*(void *)v30 != v12) {
                objc_enumerationMutation(obj);
              }
              uint64_t v14 = *(void **)(*((void *)&v29 + 1) + 8 * i);
              id v16 = [v14 resources];
              double v17 = [v16 firstObject];
              double v18 = [v17 getDictionary];
              uint64_t v19 = [v18 objectForKey:@"MOMediaPlayMetaDataKeyPlayerBundleID"];

              unint64_t v20 = [v28 objectAtIndexedSubscript:v9];
              LODWORD(v17) = [v20 isEqualToString:v19];

              if (v17) {
                [v26 addObject:v14];
              }
            }
            id v11 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
          }
          while (v11);
        }

        BOOL v21 = (unint64_t)[v28 count] > v9 + 1;
        uint64_t v9 = 1;
        int v8 = 1;
        id v5 = v24;
      }
      while ((v21 & ~v25 & 1) != 0);
    }

    id v6 = v23;
  }
  else
  {
    id v26 = v5;
  }

  return v26;
}

int64_t __80__MOMediaAggregationManager__sortAndLimitBundlesForThirdPartyApps_playtimeDict___block_invoke(id a1, id a2, id a3)
{
  return (int64_t)[a3 compare:a2];
}

- (void)_updateRankingDictionary:(id)a3 mediaLength:(double)a4 sumPlaytime:(double)a5 mediaActionIsRepeat:(BOOL)a6
{
  BOOL v6 = a6;
  id v9 = a3;
  id v10 = +[NSNumber numberWithDouble:a4];
  [v9 addMetaDataForRankForKey:@"MediaLength" value:v10];

  id v11 = +[NSNumber numberWithDouble:a5];
  [v9 addMetaDataForRankForKey:@"MediaTotalPlayTime" value:v11];

  id v12 = +[NSNumber numberWithBool:v6];
  [v9 addMetaDataForRankForKey:@"MediaActionIsRepeat" value:v12];
}

- (id)getPlayedMediaBundleDaily:(id)a3 mediaTypeEnum:(unint64_t)a4 parameters:(id)a5 isPlayedSong:(BOOL)a6 songOnRepeatBundles:(id)a7
{
  BOOL v86 = a6;
  id v10 = a3;
  id v92 = a5;
  id v11 = a7;
  if (![v10 count])
  {
    id v57 = 0;
    goto LABEL_53;
  }
  v90 = objc_opt_new();
  uint64_t v91 = objc_opt_new();
  __int16 v82 = v10;
  [(MOMediaAggregationManager *)self _sortBundlesBySumPlaytime:v10];
  long long v95 = 0u;
  long long v96 = 0u;
  long long v97 = 0u;
  long long v98 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  long long v94 = self;
  id v88 = [obj countByEnumeratingWithState:&v95 objects:v107 count:16];
  if (!v88)
  {
    double v12 = 0.0;
    double v13 = 0.0;
    goto LABEL_41;
  }
  uint64_t v87 = *(void *)v96;
  double v12 = 0.0;
  double v13 = 0.0;
  do
  {
    uint64_t v14 = 0;
    do
    {
      if (*(void *)v96 != v87) {
        objc_enumerationMutation(obj);
      }
      id v15 = *(MOEventBundle **)(*((void *)&v95 + 1) + 8 * v14);
      id v16 = [(MOEventBundle *)v15 events];
      id v17 = [v16 count];
      double v18 = [(MOEventBundle *)v15 resources];
      id v19 = [v18 count];

      uint64_t v89 = v14;
      if (v17 == v19)
      {
        unint64_t v20 = [(MOEventBundle *)v15 resources];
        id v21 = [v20 count];

        if (v21)
        {
          unint64_t v22 = 0;
          do
          {
            id v24 = [(MOEventBundle *)v15 resources];
            int v25 = [v24 objectAtIndexedSubscript:v22];

            id v26 = [v25 getDictionary];
            id v27 = [v26 objectForKey:@"MOMediaPlayMetaDataKeyPlayerTitle"];

            if ([(MOMediaAggregationManager *)self _isInSongOnRepetBundles:v11 mediaTitle:v27])
            {
              unint64_t v28 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
              if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 136315394;
                long long v100 = "-[MOMediaAggregationManager getPlayedMediaBundleDaily:mediaTypeEnum:parameters:isPlayedSong:songO"
                       "nRepeatBundles:]";
                __int16 v101 = 2112;
                long long v102 = v27;
                _os_log_debug_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEBUG, "%s, played song filtered by song on repeat bundle with title, %@", buf, 0x16u);
              }
              goto LABEL_27;
            }
            id v29 = v11;
            long long v30 = [v25 getDictionary];
            long long v31 = [v30 objectForKey:@"media_type"];
            uint64_t v32 = (int)[v31 intValue];

            if (v32 != a4)
            {
              id v11 = v29;
              self = v94;
              goto LABEL_29;
            }
            double v33 = [v25 getDictionary];
            unint64_t v28 = [v33 objectForKey:@"MOMediaPlayMetaDataKeyPlayerSumPlaytime"];

            double v34 = [v25 getDictionary];
            double v35 = [v34 objectForKey:@"MOMediaPlayMetaDataKeyPlayerDuration"];

            double v36 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
            if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
            {
              id v55 = [v25 getDictionary];
              v83 = [v55 objectForKey:@"MOMediaPlayMetaDataKeyPlayerTitle"];
              __int16 v84 = +[MOMediaPlaySession redactString:v83];
              *(_DWORD *)buf = 136315906;
              long long v100 = "-[MOMediaAggregationManager getPlayedMediaBundleDaily:mediaTypeEnum:parameters:isPlayedSong:songOnRepeatBundles:]";
              __int16 v101 = 2112;
              long long v102 = v84;
              __int16 v103 = 2112;
              v104 = v35;
              __int16 v105 = 2112;
              v106 = v28;
              _os_log_debug_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEBUG, "%s, played media with media title inside daily media bundle, %@, duration, %@, total play time, %@", buf, 0x2Au);
            }
            if (!v35
              || (int)[v35 intValue] < 1
              || ([v28 doubleValue],
                  double v38 = v37,
                  [v35 doubleValue],
                  double v40 = v38 / v39,
                  objc_msgSend(v92, "coarseGranularity_mediaBundleAggregationPodcastPlayTimePercentageThreshold"),
                  v40 < v41))
            {
              float v42 = (float)(uint64_t)[v28 longValue];
              [v92 coarseGranularity_mediaBundleAggregationPodcastTotalPlayTimeThreshold];
              if (v43 > v42)
              {
                if (v35
                  && (int)[v35 intValue] >= 1
                  && ([v28 doubleValue],
                      double v45 = v44,
                      [v35 doubleValue],
                      double v47 = v45 / v46,
                      objc_msgSend(v92, "coarseGranularity_mediaBundleAggregationPodcastPlayTimePercentageThreshold"),
                      v47 >= v48))
                {
                  if (!v86) {
                    goto LABEL_26;
                  }
                }
                else if ((uint64_t)[v28 longValue] < 90 || !v86)
                {
                  goto LABEL_26;
                }
              }
            }
            [v90 addObject:v25];
            id v49 = [(MOEventBundle *)v15 events];
            uint64_t v50 = [v49 objectAtIndexedSubscript:v22];
            [v91 addObject:v50];

            [v28 doubleValue];
            double v13 = v13 + v51;
            [v35 doubleValue];
            double v12 = v12 + v52;
LABEL_26:

            id v11 = v29;
            self = v94;
LABEL_27:

LABEL_29:
            ++v22;
            uint64_t v53 = [(MOEventBundle *)v15 resources];
            id v54 = [v53 count];
          }
          while ((unint64_t)v54 > v22);
        }
      }
      else
      {
        id v56 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
        if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          long long v100 = "-[MOMediaAggregationManager getPlayedMediaBundleDaily:mediaTypeEnum:parameters:isPlayedSong:songOnRepeatBundles:]";
          __int16 v101 = 2112;
          long long v102 = v15;
          _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_INFO, "%s, media bundle has bad data, %@", buf, 0x16u);
        }
      }
      uint64_t v14 = v89 + 1;
    }
    while ((id)(v89 + 1) != v88);
    id v88 = [obj countByEnumeratingWithState:&v95 objects:v107 count:16];
  }
  while (v88);
LABEL_41:

  uint64_t v58 = v90;
  if ([v90 count])
  {
    v59 = [(MOMediaAggregationManager *)self _sortResourcesBySumPlaytime:v90];
    v60 = [MOEventBundle alloc];
    id v61 = [objc_alloc((Class)NSSet) initWithArray:v91];
    id v57 = [(MOEventBundle *)v60 initWithEventSet:v61 filtered:0];

    [(MOEventBundle *)v57 setInterfaceType:5];
    v62 = [(MOMediaAggregationManager *)self _limitMOResourcesAndUpdatePriority:v59 parameters:v92 isSong:v86 isFirstPartyApp:1];
    [(MOEventBundle *)v57 setResources:v62];

    [(MOEventBundle *)v57 setBundleSuperType:4];
    id v10 = v82;
    if (v86)
    {
      id v63 = @"played_song";
      [(MOEventBundle *)v57 setBundleSubType:402];
    }
    else
    {
      id v64 = v11;
      id v66 = [(MOEventBundle *)v57 resources];
      v67 = [v66 firstObject];
      v68 = [v67 getDictionary];
      v69 = [v68 objectForKey:@"MOMediaPlayMetaDataKeyPlayerMediaTypeKey"];

      uint64_t v70 = kMOMediaPlayAnnotationManagerStringPrefixPlayedPodcasts;
      if ((unint64_t)[v90 count] <= 1
        && ![v69 isEqualToString:MOMediaPlayMetaDataKeyPlayerMediaTypePodcastArtist[0]])
      {
        uint64_t v70 = kMOMediaPlayAnnotationManagerStringPrefixPlayedPodcast;
      }
      id v63 = *v70;
      [(MOEventBundle *)v57 setBundleSubType:403];

      id v11 = v64;
    }
    id v71 = [v82 firstObject];
    uint64_t v72 = [v71 promptLanguage];
    v73 = +[NSString stringWithFormat:@"%@, etc.", v72];
    [(MOEventBundle *)v57 setPromptLanguage:v73];

    long long v74 = [[MOAction alloc] initWithActionName:v63 actionType:1 actionSubtype:6];
    [(MOEventBundle *)v57 setAction:v74];

    long long v75 = [v91 firstObject];
    long long v76 = [v75 eventIdentifier];
    id v77 = [(MOEventBundle *)v57 action];
    [v77 setSourceEventIdentifier:v76];

    uint64_t v78 = [v82 firstObject];
    v79 = [v78 labels];
    [(MOEventBundle *)v57 setLabels:v79];

    [(MOMediaAggregationManager *)v94 _updateRankingDictionary:v57 mediaLength:0 sumPlaytime:v12 mediaActionIsRepeat:v13];
    id v80 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
    if (os_log_type_enabled(v80, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      long long v100 = "-[MOMediaAggregationManager getPlayedMediaBundleDaily:mediaTypeEnum:parameters:isPlayedSong:songOnRepeatBundles:]";
      __int16 v101 = 2112;
      long long v102 = v57;
      _os_log_impl((void *)&_mh_execute_header, v80, OS_LOG_TYPE_INFO, "%s, bundle, %@, event category, Played Media", buf, 0x16u);
    }

    uint64_t v58 = v90;
  }
  else
  {
    id v57 = 0;
    id v10 = v82;
  }

LABEL_53:

  return v57;
}

- (BOOL)_isInSongOnRepetBundles:(id)a3 mediaTitle:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v5)
  {
    id v7 = [v5 resources];

    LOBYTE(v8) = 0;
    if (v6 && v7)
    {
      [v5 resources];
      long long v18 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      id v9 = (id)objc_claimAutoreleasedReturnValue();
      id v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v10)
      {
        id v11 = v10;
        uint64_t v12 = *(void *)v19;
        while (2)
        {
          for (i = 0; i != v11; i = (char *)i + 1)
          {
            if (*(void *)v19 != v12) {
              objc_enumerationMutation(v9);
            }
            int v8 = *(void **)(*((void *)&v18 + 1) + 8 * i);
            if (!v8) {
              goto LABEL_20;
            }
            id v15 = [v8 getDictionary:v18];

            if (!v15)
            {
              LOBYTE(v8) = 0;
LABEL_20:
              goto LABEL_21;
            }
            id v16 = [v8 getDictionary];
            int v8 = [v16 objectForKey:@"MOMediaPlayMetaDataKeyPlayerTitle"];

            if (v8 && [v8 isEqualToString:v6])
            {

              LOBYTE(v8) = 1;
              goto LABEL_20;
            }
          }
          id v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
          LOBYTE(v8) = 0;
          if (v11) {
            continue;
          }
          break;
        }
      }
      else
      {
        LOBYTE(v8) = 0;
      }
LABEL_21:
    }
  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return (char)v8;
}

- (id)getPlayedMediaBundleDailyForThirdPartyApp:(id)a3 mediaTypeEnum:(unint64_t)a4 parameters:(id)a5 songOnRepeatBundles:(id)a6
{
  id v9 = a3;
  id v90 = a5;
  id v10 = a6;
  long long v97 = self;
  id v11 = [(MOMediaAggregationManager *)self _groupBundleByApps:v9];
  uint64_t v78 = objc_opt_new();
  id v77 = objc_opt_new();
  long long v102 = 0u;
  long long v103 = 0u;
  long long v104 = 0u;
  long long v105 = 0u;
  __int16 v82 = v11;
  id obj = [v11 allKeys];
  id v83 = [obj countByEnumeratingWithState:&v102 objects:v115 count:16];
  if (v83)
  {
    uint64_t v81 = *(void *)v103;
    id v95 = v10;
    id v80 = v9;
    do
    {
      for (i = 0; i != v83; i = (char *)i + 1)
      {
        if (*(void *)v103 != v81) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void *)(*((void *)&v102 + 1) + 8 * i);
        id v15 = [v82 objectForKey:v13];
        if ([v9 count])
        {
          v85 = v14;
          BOOL v86 = i;
          long long v94 = objc_opt_new();
          long long v93 = objc_opt_new();
          __int16 v84 = v15;
          id v16 = [(MOMediaAggregationManager *)v97 _sortBundlesBySumPlaytime:v15];
          long long v98 = 0u;
          long long v99 = 0u;
          long long v100 = 0u;
          long long v101 = 0u;
          id v89 = v16;
          id v92 = [v89 countByEnumeratingWithState:&v98 objects:v114 count:16];
          if (!v92)
          {
            double v17 = 0.0;
            double v18 = 0.0;
            goto LABEL_38;
          }
          uint64_t v91 = *(void *)v99;
          double v17 = 0.0;
          double v18 = 0.0;
          while (1)
          {
            for (j = 0; j != v92; j = (char *)j + 1)
            {
              if (*(void *)v99 != v91) {
                objc_enumerationMutation(v89);
              }
              long long v20 = *(MOEventBundle **)(*((void *)&v98 + 1) + 8 * (void)j);
              long long v21 = [(MOEventBundle *)v20 events];
              id v22 = [v21 count];
              id v23 = [(MOEventBundle *)v20 resources];
              id v24 = [v23 count];

              if (v22 == v24)
              {
                int v25 = [(MOEventBundle *)v20 resources];
                id v26 = [v25 count];

                if (v26)
                {
                  unint64_t v27 = 0;
                  while (1)
                  {
                    id v29 = [(MOEventBundle *)v20 resources];
                    long long v30 = [v29 objectAtIndexedSubscript:v27];

                    long long v31 = [v30 getDictionary];
                    uint64_t v32 = [v31 objectForKey:@"MOMediaPlayMetaDataKeyPlayerTitle"];

                    if ([(MOMediaAggregationManager *)v97 _isInSongOnRepetBundles:v10 mediaTitle:v32])
                    {
                      break;
                    }
                    double v34 = [v30 getDictionary];
                    double v35 = [v34 objectForKey:@"media_type"];
                    uint64_t v36 = (int)[v35 intValue];

                    if (v36 == a4)
                    {
                      double v37 = [v30 getDictionary];
                      double v33 = [v37 objectForKey:@"MOMediaPlayMetaDataKeyPlayerSumPlaytime"];

                      double v38 = [v30 getDictionary];
                      double v39 = [v38 objectForKey:@"MOMediaPlayMetaDataKeyPlayerDuration"];

                      double v40 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
                      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
                      {
                        id v54 = [v30 getDictionary];
                        uint64_t v87 = [v54 objectForKey:@"MOMediaPlayMetaDataKeyPlayerTitle"];
                        id v88 = +[MOMediaPlaySession redactString:v87];
                        *(_DWORD *)buf = 136315906;
                        __int16 v107 = "-[MOMediaAggregationManager getPlayedMediaBundleDailyForThirdPartyApp:mediaTypeEnum:param"
                               "eters:songOnRepeatBundles:]";
                        __int16 v108 = 2112;
                        v109 = v88;
                        __int16 v110 = 2112;
                        v111 = v39;
                        __int16 v112 = 2112;
                        v113 = v33;
                        _os_log_debug_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEBUG, "%s, third party played media with media title inside daily media bundle, %@, duration, %@, total play time, %@", buf, 0x2Au);
                      }
                      if (!v39
                        || ![v39 intValue]
                        || (int)[v39 intValue] >= 1
                        && (([v33 doubleValue],
                             double v42 = v41,
                             [v39 doubleValue],
                             double v44 = v42 / v43,
                             objc_msgSend(v90, "coarseGranularity_mediaBundleAggregationPodcastPlayTimePercentageThreshold"), v44 >= v45)|| (float v46 = (float)(uint64_t)-[NSObject longValue](v33, "longValue"), objc_msgSend(v90, "coarseGranularity_mediaBundleAggregationPodcastTotalPlayTimeThreshold"), v47 <= v46)))
                      {
                        [v94 addObject:v30];
                        float v48 = [(MOEventBundle *)v20 events];
                        id v49 = [v48 objectAtIndexedSubscript:v27];
                        [v93 addObject:v49];

                        [v33 doubleValue];
                        double v18 = v18 + v50;
                        [v39 doubleValue];
                        double v17 = v17 + v51;
                      }

                      id v10 = v95;
                      goto LABEL_28;
                    }
LABEL_29:

                    ++v27;
                    double v52 = [(MOEventBundle *)v20 resources];
                    id v53 = [v52 count];

                    if ((unint64_t)v53 <= v27) {
                      goto LABEL_34;
                    }
                  }
                  double v33 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
                  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 136315394;
                    __int16 v107 = "-[MOMediaAggregationManager getPlayedMediaBundleDailyForThirdPartyApp:mediaTypeEnum:parameter"
                           "s:songOnRepeatBundles:]";
                    __int16 v108 = 2112;
                    v109 = v32;
                    _os_log_debug_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEBUG, "%s, played song filtered by song on repeat bundle with title, %@", buf, 0x16u);
                  }
LABEL_28:

                  goto LABEL_29;
                }
              }
              else
              {
                id v55 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
                if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 136315394;
                  __int16 v107 = "-[MOMediaAggregationManager getPlayedMediaBundleDailyForThirdPartyApp:mediaTypeEnum:parameters:"
                         "songOnRepeatBundles:]";
                  __int16 v108 = 2112;
                  v109 = v20;
                  _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_INFO, "%s, media bundle has bad data, %@", buf, 0x16u);
                }
              }
LABEL_34:
              ;
            }
            id v92 = [v89 countByEnumeratingWithState:&v98 objects:v114 count:16];
            if (!v92)
            {
LABEL_38:

              id v56 = v93;
              id v9 = v80;
              if ([v93 count])
              {
                id v57 = [(MOMediaAggregationManager *)v97 _sortResourcesBySumPlaytime:v94];
                uint64_t v58 = [MOEventBundle alloc];
                id v59 = [objc_alloc((Class)NSSet) initWithArray:v93];
                v60 = [(MOEventBundle *)v58 initWithEventSet:v59 filtered:0];

                [(MOEventBundle *)v60 setInterfaceType:5];
                id v61 = [(MOMediaAggregationManager *)v97 _limitMOResourcesAndUpdatePriority:v57 parameters:v90 isSong:1 isFirstPartyApp:0];
                [(MOEventBundle *)v60 setResources:v61];

                v62 = @"played_media_third_party";
                [(MOEventBundle *)v60 setBundleSuperType:4];
                [(MOEventBundle *)v60 setBundleSubType:408];
                id v63 = [v80 firstObject];
                id v64 = [v63 promptLanguage];
                v65 = +[NSString stringWithFormat:@"%@, etc.", v64];
                [(MOEventBundle *)v60 setPromptLanguage:v65];

                id v66 = [[MOAction alloc] initWithActionName:v62 actionType:1 actionSubtype:6];
                [(MOEventBundle *)v60 setAction:v66];

                v67 = [v80 firstObject];
                v68 = [v67 labels];
                [(MOEventBundle *)v60 setLabels:v68];

                [(MOEventBundle *)v60 setIsAggregatedAndSuppressed:1];
                [(MOMediaAggregationManager *)v97 _updateRankingDictionary:v60 mediaLength:0 sumPlaytime:v17 mediaActionIsRepeat:v18];
                v69 = +[NSNumber numberWithDouble:v18];
                uint64_t v70 = [(MOEventBundle *)v60 resources];
                id v71 = [v70 firstObject];
                uint64_t v72 = [v71 getDictionary];
                v73 = [v72 objectForKey:@"MOMediaPlayMetaDataKeyPlayerBundleID"];
                [v77 setValue:v69 forKey:v73];

                [v78 addObject:v60];
                long long v74 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
                if (os_log_type_enabled(v74, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 136315394;
                  __int16 v107 = "-[MOMediaAggregationManager getPlayedMediaBundleDailyForThirdPartyApp:mediaTypeEnum:parameters:"
                         "songOnRepeatBundles:]";
                  __int16 v108 = 2112;
                  v109 = v60;
                  _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_INFO, "%s, bundle, %@, event category, third party Played Media", buf, 0x16u);
                }

                id v10 = v95;
                id v56 = v93;
              }

              uint64_t v14 = v85;
              i = v86;
              id v15 = v84;
              break;
            }
          }
        }
      }
      id v83 = [obj countByEnumeratingWithState:&v102 objects:v115 count:16];
    }
    while (v83);
  }

  long long v75 = [(MOMediaAggregationManager *)v97 _sortAndMergeBundlesForThirdPartyApps:v78 playtimeDict:v77 paramters:v90 mediaActionIsRepeat:0];

  return v75;
}

- (id)_calculateStartDateFromEventBundles:(id)a3
{
  id v3 = a3;
  if ([v3 count])
  {
    id v4 = +[NSDate distantFuture];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v5 = v3;
    id v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v17;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v17 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          id v11 = [v10 startDate:v16];
          uint64_t v12 = [v11 earlierDate:v4];
          uint64_t v13 = [v10 startDate];

          if (v12 == v13)
          {
            uint64_t v14 = [v10 startDate];

            id v4 = (void *)v14;
          }
        }
        id v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v7);
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)_calculateEndDateFromEventBundles:(id)a3
{
  id v3 = a3;
  if ([v3 count])
  {
    id v4 = +[NSDate distantPast];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v5 = v3;
    id v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v17;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v17 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          id v11 = [v10 endDate:v16];
          uint64_t v12 = [v11 laterDate:v4];
          uint64_t v13 = [v10 endDate];

          if (v12 == v13)
          {
            uint64_t v14 = [v10 endDate];

            id v4 = (void *)v14;
          }
        }
        id v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v7);
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)_megaBundlesForCoarseGranularityFromMediaPlaySessionsBundles:(id)a3 paramters:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (![v6 count])
  {
    id v11 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      id v77 = [v6 count];
      uint64_t v12 = "CoarseGranularityAggregation: no needed to generate media bundles since bundles  count is: %lu";
      uint64_t v13 = v11;
      uint32_t v14 = 12;
      goto LABEL_7;
    }
LABEL_8:
    id v15 = 0;
    goto LABEL_43;
  }
  uint64_t v8 = [v7 aggregationDateInterval];
  [v8 duration];
  double v10 = v9;

  if (v10 < 604800.0)
  {
    id v11 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      uint64_t v12 = "CoarseGranularityAggregation for contact: no needed to contact bundles since aggregation time interval is less than 7 days";
      uint64_t v13 = v11;
      uint32_t v14 = 2;
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, v12, buf, v14);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  id v64 = objc_opt_new();
  long long v17 = +[NSPredicate predicateWithFormat:@"%K = %lu", @"interfaceType", 5];
  long long v18 = [v6 filteredArrayUsingPredicate:v17];
  if ([v18 count])
  {
    v60 = v17;
    context = v16;
    id v62 = v7;
    id v63 = v6;
    long long v19 = objc_opt_new();
    long long v20 = objc_opt_new();
    long long v70 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    id obj = v18;
    id v21 = [obj countByEnumeratingWithState:&v70 objects:v75 count:16];
    if (v21)
    {
      id v22 = v21;
      uint64_t v23 = *(void *)v71;
      do
      {
        for (i = 0; i != v22; i = (char *)i + 1)
        {
          if (*(void *)v71 != v23) {
            objc_enumerationMutation(obj);
          }
          int v25 = *(void **)(*((void *)&v70 + 1) + 8 * i);
          id v26 = [v25 events];
          id v27 = [v26 count];

          if (v27)
          {
            unint64_t v28 = [v25 events];
            id v29 = [v28 firstObject];
            unsigned int v30 = [(MOMediaAggregationManager *)self _isFirstPartyApp:v29];

            if (v30) {
              long long v31 = v19;
            }
            else {
              long long v31 = v20;
            }
            [v31 addObject:v25];
          }
        }
        id v22 = [obj countByEnumeratingWithState:&v70 objects:v75 count:16];
      }
      while (v22);
    }

    uint64_t v32 = +[NSCalendar currentCalendar];
    id v33 = objc_alloc((Class)NSDate);
    double v34 = +[NSDate date];
    id v35 = [v33 initWithTimeInterval:v34 sinceDate:-604800.0];
    uint64_t v36 = [v32 startOfDayForDate:v35];

    double v37 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
    if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v77 = (id)v36;
      _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_INFO, "CoarseGranularityAggregation for media: the earliest date for media bundle to be aggregated for coarse granularity: %@", buf, 0xCu);
    }

    double v38 = +[NSDate date];
    uint64_t v39 = [(MOMediaAggregationManager *)self _getEventBundleBasedOnMediaTypeEnum:v19 playSessionMediaType:1 startTime:v36 endTime:v38];

    uint64_t v58 = (void *)v39;
    id v7 = v62;
    uint64_t v40 = [(MOMediaAggregationManager *)self _getMediaOnRepeatMegaBundle:v39 mediaTypeEnum:1 parameters:v62];
    if (v40) {
      [v64 addObject:v40];
    }
    id v57 = (void *)v40;
    double v41 = +[NSDate date];
    uint64_t v42 = [(MOMediaAggregationManager *)self _getEventBundleBasedOnMediaTypeEnum:v19 playSessionMediaType:2 startTime:v36 endTime:v41];

    id v56 = (void *)v42;
    uint64_t v43 = [(MOMediaAggregationManager *)self _getPlayedMediaMegaBundle:v42 mediaTypeEnum:2 paramters:v62];
    if (v43) {
      [v64 addObject:v43];
    }
    id v55 = (void *)v43;
    double v44 = +[NSDate date];
    float v45 = [(MOMediaAggregationManager *)self _getEventBundleBasedOnMediaTypeEnum:v20 playSessionMediaType:5 startTime:v36 endTime:v44];

    float v46 = [(MOMediaAggregationManager *)self _getMediaOnRepeatMegaBundleForThirdParty:v45 mediaTypeEnum:5 parameters:v62];
    if (v46) {
      [v64 addObject:v46];
    }
    id v59 = (void *)v36;
    float v47 = [(MOMediaAggregationManager *)self _getPlayedMediaMegaBundleForThirdParty:v45 mediaTypeEnum:5 paramters:v62];
    if (v47) {
      [v64 addObject:v47];
    }
    long long v68 = 0u;
    long long v69 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    float v48 = v64;
    id v49 = [v48 countByEnumeratingWithState:&v66 objects:v74 count:16];
    if (v49)
    {
      id v50 = v49;
      uint64_t v51 = *(void *)v67;
      do
      {
        for (j = 0; j != v50; j = (char *)j + 1)
        {
          if (*(void *)v67 != v51) {
            objc_enumerationMutation(v48);
          }
          [*(id *)(*((void *)&v66 + 1) + 8 * (void)j) setSummarizationGranularity:2];
        }
        id v50 = [v48 countByEnumeratingWithState:&v66 objects:v74 count:16];
      }
      while (v50);
    }

    id v11 = v48;
    id v15 = v11;
    id v6 = v63;
  }
  else
  {
    id v53 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
    if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_INFO, "CoarseGranularityAggregation: media play sessions bundles are filtered.", buf, 2u);
    }

    id v15 = 0;
    id v11 = v64;
  }
LABEL_43:

  return v15;
}

- (id)_getMediaOnRepeatMegaBundle:(id)a3 mediaTypeEnum:(unint64_t)a4 parameters:(id)a5
{
  id v8 = a3;
  id v77 = a5;
  if (![v8 count])
  {
    id v53 = 0;
    goto LABEL_57;
  }
  uint64_t v78 = objc_opt_new();
  v79 = objc_opt_new();
  long long v76 = self;
  [(MOMediaAggregationManager *)self _createMediaDictionaryFromBundles:v8];
  long long v99 = 0u;
  long long v100 = 0u;
  long long v101 = 0u;
  v82 = long long v102 = 0u;
  id obj = [v82 allKeys];
  id v83 = [obj countByEnumeratingWithState:&v99 objects:v112 count:16];
  if (!v83)
  {
    double v9 = 0.0;
    double v10 = 0.0;
    goto LABEL_49;
  }
  uint64_t v81 = *(void *)v100;
  double v9 = 0.0;
  double v10 = 0.0;
  do
  {
    for (i = 0; i != v83; i = (char *)i + 1)
    {
      if (*(void *)v100 != v81) {
        objc_enumerationMutation(obj);
      }
      uint64_t v12 = *(void *)(*((void *)&v99 + 1) + 8 * i);
      uint64_t v94 = v12;
      uint64_t v13 = [v82 objectForKeyedSubscript:v12];
      uint64_t v87 = objc_opt_new();
      long long v95 = 0u;
      long long v96 = 0u;
      long long v97 = 0u;
      long long v98 = 0u;
      id v14 = v13;
      id v93 = [v14 countByEnumeratingWithState:&v95 objects:v111 count:16];
      if (v93)
      {
        __int16 v84 = i;
        id v88 = 0;
        uint64_t v15 = *(void *)v96;
        double v16 = 0.0;
        double v17 = 0.0;
        id v92 = v14;
        id v90 = 0;
        uint64_t v91 = *(void *)v96;
        do
        {
          long long v18 = 0;
          do
          {
            if (*(void *)v96 != v15) {
              objc_enumerationMutation(v14);
            }
            long long v19 = *(MOEventBundle **)(*((void *)&v95 + 1) + 8 * (void)v18);
            long long v20 = [(MOEventBundle *)v19 events];
            id v21 = [v20 count];
            id v22 = [(MOEventBundle *)v19 resources];
            id v23 = [v22 count];

            if (v21 == v23)
            {
              id v24 = [(MOEventBundle *)v19 resources];
              id v25 = [v24 count];

              if (!v25) {
                goto LABEL_23;
              }
              unint64_t v26 = 0;
              while (1)
              {
                unint64_t v28 = [(MOEventBundle *)v19 resources];
                id v29 = [v28 objectAtIndexedSubscript:v26];

                unsigned int v30 = [v29 getDictionary];
                long long v31 = [v30 objectForKey:@"media_type"];
                uint64_t v32 = (int)[v31 intValue];

                if (v32 == a4)
                {
                  id v33 = [v29 getDictionary];
                  double v34 = [v33 objectForKey:@"MOMediaPlayMetaDataKeyPlayerTitle"];

                  if ([v34 isEqualToString:v94])
                  {
                    if (!v90)
                    {
                      double v38 = [v29 getDictionary];
                      id v90 = [v38 objectForKey:@"MOMediaPlayMetaDataKeyPlayerDuration"];
                    }
                    uint64_t v39 = [v29 getDictionary];
                    id v89 = [v39 objectForKey:@"MOMediaPlayMetaDataKeyPlayerSumPlaytime"];

                    uint64_t v40 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
                    uint64_t v15 = v91;
                    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
                    {
                      BOOL v86 = +[MOMediaPlaySession redactString:v34];
                      *(_DWORD *)buf = 136315906;
                      long long v104 = "-[MOMediaAggregationManager _getMediaOnRepeatMegaBundle:mediaTypeEnum:parameters:]";
                      __int16 v105 = 2112;
                      v106 = v86;
                      __int16 v107 = 2112;
                      __int16 v108 = v90;
                      __int16 v109 = 2112;
                      double v110 = *(double *)&v89;
                      _os_log_debug_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEBUG, "%s, media title inside media on repeat weekly summary bundle, %@, duration, %@, total play time, %@", buf, 0x2Au);
                    }
                    [v89 doubleValue];
                    double v17 = v17 + v41;
                    double v10 = v10 + v17;
                    [v90 doubleValue];
                    double v16 = v16 + v42;
                    double v9 = v9 + v16;
                    uint64_t v43 = [(MOEventBundle *)v19 events];
                    double v44 = [v43 objectAtIndexedSubscript:v26];
                    [v87 addObject:v44];

                    id v88 = v29;
                    id v14 = v92;
                    goto LABEL_23;
                  }
                }
                ++v26;
                id v35 = [(MOEventBundle *)v19 resources];
                id v36 = [v35 count];

                if ((unint64_t)v36 <= v26)
                {
                  uint64_t v15 = v91;
                  id v14 = v92;
                  goto LABEL_23;
                }
              }
            }
            double v37 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
            if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 136315394;
              long long v104 = "-[MOMediaAggregationManager _getMediaOnRepeatMegaBundle:mediaTypeEnum:parameters:]";
              __int16 v105 = 2112;
              v106 = v19;
              _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_INFO, "%s, media bundle has bad data, %@", buf, 0x16u);
            }

LABEL_23:
            long long v18 = (char *)v18 + 1;
          }
          while (v18 != v93);
          id v45 = [v14 countByEnumeratingWithState:&v95 objects:v111 count:16];
          id v93 = v45;
        }
        while (v45);

        float v46 = v88;
        if (v88)
        {
          i = v84;
          if (![v87 count]) {
            goto LABEL_36;
          }
          float v47 = v90;
          if (!v90 || (int)[v90 intValue] < 1) {
            goto LABEL_37;
          }
          [v90 doubleValue];
          if (v17 / v48 < 2.95)
          {
LABEL_36:
            float v47 = v90;
LABEL_37:
            float v46 = v88;
            goto LABEL_44;
          }
          id v49 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
          if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
          {
            id v50 = [v88 getDictionary];
            uint64_t v51 = [v50 objectForKey:@"MOMediaPlayMetaDataKeyPlayerTitle"];
            double v52 = +[MOMediaPlaySession redactString:v51];
            *(_DWORD *)buf = 136315906;
            long long v104 = "-[MOMediaAggregationManager _getMediaOnRepeatMegaBundle:mediaTypeEnum:parameters:]";
            __int16 v105 = 2112;
            v106 = v52;
            __int16 v107 = 2112;
            __int16 v108 = v90;
            __int16 v109 = 2048;
            double v110 = v17;
            _os_log_debug_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEBUG, "%s, media on repeat weekly summary with media title, %@, duration, %@, total play time, %lf", buf, 0x2Au);
          }
          [v78 addObject:v88];
          [v79 addObjectsFromArray:v87];
          float v46 = v88;
        }
        else
        {
          i = v84;
        }
        float v47 = v90;
      }
      else
      {

        float v47 = 0;
        float v46 = 0;
      }
LABEL_44:
    }
    id v83 = [obj countByEnumeratingWithState:&v99 objects:v112 count:16];
  }
  while (v83);
LABEL_49:

  id v54 = v78;
  if ([v78 count])
  {
    id v55 = [MOEventBundle alloc];
    id v56 = [objc_alloc((Class)NSSet) initWithArray:v79];
    id v53 = [(MOEventBundle *)v55 initWithEventSet:v56 filtered:0];

    id v57 = [(MOMediaAggregationManager *)v76 _sortResourcesBySumPlaytime:v78];
    [(MOEventBundle *)v53 setInterfaceType:5];
    uint64_t v58 = @"song_on_repeat";
    if ((unint64_t)[v78 count] >= 2)
    {
      id v59 = @"songs_on_repeat";

      uint64_t v58 = v59;
    }
    [(MOEventBundle *)v53 setBundleSuperType:4];
    [(MOEventBundle *)v53 setBundleSubType:404];
    v60 = [v8 firstObject];
    id v61 = [v60 promptLanguage];
    id v62 = +[NSString stringWithFormat:@"%@, etc.", v61];
    [(MOEventBundle *)v53 setPromptLanguage:v62];

    id v63 = [[MOAction alloc] initWithActionName:v58 actionType:1 actionSubtype:6];
    [(MOEventBundle *)v53 setAction:v63];

    id v64 = [v79 firstObject];
    v65 = [v64 eventIdentifier];
    long long v66 = [(MOEventBundle *)v53 action];
    [v66 setSourceEventIdentifier:v65];

    long long v67 = [(MOMediaAggregationManager *)v76 _limitMOResourcesAndUpdatePriority:v57 parameters:v77 isSong:1 isFirstPartyApp:1];
    [(MOEventBundle *)v53 setResources:v67];

    long long v68 = +[NSCalendar currentCalendar];
    id v69 = objc_alloc((Class)NSDate);
    long long v70 = +[NSDate date];
    id v71 = [v69 initWithTimeInterval:v70 sinceDate:-604800.0];
    long long v72 = [v68 startOfDayForDate:v71];
    [(MOEventBundle *)v53 setStartDate:v72];

    long long v73 = +[NSDate date];
    [(MOEventBundle *)v53 setEndDate:v73];

    [(MOMediaAggregationManager *)v76 _updateRankingDictionary:v53 mediaLength:1 sumPlaytime:v9 mediaActionIsRepeat:v10];
    long long v74 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
    if (os_log_type_enabled(v74, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      long long v104 = "-[MOMediaAggregationManager _getMediaOnRepeatMegaBundle:mediaTypeEnum:parameters:]";
      __int16 v105 = 2112;
      v106 = v53;
      _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_INFO, "%s, bundle, %@, event category, Song on repeat mega bundle", buf, 0x16u);
    }

    id v54 = v78;
  }
  else
  {
    id v53 = 0;
  }

LABEL_57:

  return v53;
}

- (id)_getMediaOnRepeatMegaBundleForThirdParty:(id)a3 mediaTypeEnum:(unint64_t)a4 parameters:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  if ([v7 count])
  {
    id v88 = v8;
    id v89 = v7;
    id v93 = self;
    double v9 = [(MOMediaAggregationManager *)self _groupBundleByApps:v7];
    uint64_t v87 = objc_opt_new();
    BOOL v86 = objc_opt_new();
    long long v121 = 0u;
    long long v122 = 0u;
    long long v123 = 0u;
    long long v124 = 0u;
    uint64_t v91 = v9;
    id obj = [v9 allKeys];
    id v92 = [obj countByEnumeratingWithState:&v121 objects:v135 count:16];
    if (v92)
    {
      uint64_t v90 = *(void *)v122;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v122 != v90)
          {
            uint64_t v11 = v10;
            objc_enumerationMutation(obj);
            uint64_t v10 = v11;
          }
          uint64_t v94 = v10;
          uint64_t v12 = *(void *)(*((void *)&v121 + 1) + 8 * v10);
          uint64_t v13 = objc_opt_new();
          long long v95 = objc_opt_new();
          id v14 = [v91 objectForKeyedSubscript:v12];
          uint64_t v15 = [(MOMediaAggregationManager *)v93 _createMediaDictionaryFromBundles:v14];

          long long v119 = 0u;
          long long v120 = 0u;
          long long v117 = 0u;
          long long v118 = 0u;
          long long v99 = v15;
          id v96 = [v15 allKeys];
          long long v97 = v13;
          id v100 = [v96 countByEnumeratingWithState:&v117 objects:v134 count:16];
          if (v100)
          {
            uint64_t v98 = *(void *)v118;
            double v16 = 0.0;
            double v17 = 0.0;
            do
            {
              for (i = 0; i != v100; i = (char *)i + 1)
              {
                if (*(void *)v118 != v98) {
                  objc_enumerationMutation(v96);
                }
                long long v102 = i;
                uint64_t v19 = *(void *)(*((void *)&v117 + 1) + 8 * i);
                long long v20 = [v99 objectForKeyedSubscript:v19];
                long long v104 = objc_opt_new();
                long long v113 = 0u;
                long long v114 = 0u;
                long long v115 = 0u;
                long long v116 = 0u;
                id v21 = v20;
                id v110 = [v21 countByEnumeratingWithState:&v113 objects:v133 count:16];
                if (v110)
                {
                  __int16 v105 = 0;
                  uint64_t v22 = *(void *)v114;
                  double v23 = 0.0;
                  double v24 = 0.0;
                  id v109 = v21;
                  __int16 v107 = 0;
                  uint64_t v108 = *(void *)v114;
                  do
                  {
                    id v25 = 0;
                    do
                    {
                      if (*(void *)v114 != v22) {
                        objc_enumerationMutation(v21);
                      }
                      unint64_t v26 = *(MOEventBundle **)(*((void *)&v113 + 1) + 8 * (void)v25);
                      id v27 = [(MOEventBundle *)v26 events];
                      id v28 = [v27 count];
                      id v29 = [(MOEventBundle *)v26 resources];
                      id v30 = [v29 count];

                      if (v28 == v30)
                      {
                        long long v31 = [(MOEventBundle *)v26 resources];
                        id v32 = [v31 count];

                        if (!v32) {
                          goto LABEL_28;
                        }
                        unint64_t v33 = 0;
                        while (1)
                        {
                          id v35 = [(MOEventBundle *)v26 resources];
                          id v36 = [v35 objectAtIndexedSubscript:v33];

                          double v37 = [v36 getDictionary];
                          double v38 = [v37 objectForKey:@"media_type"];
                          uint64_t v39 = (int)[v38 intValue];

                          if (v39 == a4)
                          {
                            uint64_t v40 = [v36 getDictionary];
                            double v41 = [v40 objectForKey:@"MOMediaPlayMetaDataKeyPlayerTitle"];

                            if ([v41 isEqualToString:v19])
                            {
                              if (!v107)
                              {
                                id v45 = [v36 getDictionary];
                                __int16 v107 = [v45 objectForKey:@"MOMediaPlayMetaDataKeyPlayerDuration"];
                              }
                              float v46 = [v36 getDictionary];
                              v106 = [v46 objectForKey:@"MOMediaPlayMetaDataKeyPlayerSumPlaytime"];

                              float v47 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
                              uint64_t v22 = v108;
                              if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
                              {
                                long long v103 = +[MOMediaPlaySession redactString:v41];
                                *(_DWORD *)buf = 136315906;
                                v126 = "-[MOMediaAggregationManager _getMediaOnRepeatMegaBundleForThirdParty:mediaTypeEnum:parameters:]";
                                __int16 v127 = 2112;
                                v128 = v103;
                                __int16 v129 = 2112;
                                v130 = v107;
                                __int16 v131 = 2112;
                                double v132 = *(double *)&v106;
                                _os_log_debug_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEBUG, "%s, third party media title inside media on repeat weekly summary bundle, %@, duration, %@, total play time, %@", buf, 0x2Au);
                              }
                              [v106 doubleValue];
                              double v24 = v24 + v48;
                              double v17 = v17 + v24;
                              [v107 doubleValue];
                              double v23 = v23 + v49;
                              double v16 = v16 + v23;
                              id v50 = [(MOEventBundle *)v26 events];
                              uint64_t v51 = [v50 objectAtIndexedSubscript:v33];
                              [v104 addObject:v51];

                              __int16 v105 = v36;
                              id v21 = v109;
                              goto LABEL_28;
                            }
                          }
                          ++v33;
                          double v42 = [(MOEventBundle *)v26 resources];
                          id v43 = [v42 count];

                          if ((unint64_t)v43 <= v33)
                          {
                            uint64_t v22 = v108;
                            id v21 = v109;
                            goto LABEL_28;
                          }
                        }
                      }
                      double v44 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
                      if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
                      {
                        *(_DWORD *)buf = 136315394;
                        v126 = "-[MOMediaAggregationManager _getMediaOnRepeatMegaBundleForThirdParty:mediaTypeEnum:parameters:]";
                        __int16 v127 = 2112;
                        v128 = v26;
                        _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_INFO, "%s, third party media bundle has bad data, %@", buf, 0x16u);
                      }

LABEL_28:
                      id v25 = (char *)v25 + 1;
                    }
                    while (v25 != v110);
                    id v52 = [v21 countByEnumeratingWithState:&v113 objects:v133 count:16];
                    id v110 = v52;
                  }
                  while (v52);

                  if (v105)
                  {
                    uint64_t v13 = v97;
                    id v53 = v101;
                    i = v102;
                    id v54 = v107;
                    if ([v104 count]
                      && v107
                      && (int)[v107 intValue] >= 1
                      && ([v107 doubleValue], v24 / v55 >= 2.95))
                    {
                      id v57 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
                      if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG))
                      {
                        uint64_t v58 = [v105 getDictionary];
                        id v59 = [v58 objectForKey:@"MOMediaPlayMetaDataKeyPlayerTitle"];
                        v60 = +[MOMediaPlaySession redactString:v59];
                        *(_DWORD *)buf = 136315906;
                        v126 = "-[MOMediaAggregationManager _getMediaOnRepeatMegaBundleForThirdParty:mediaTypeEnum:parameters:]";
                        __int16 v127 = 2112;
                        v128 = v60;
                        __int16 v129 = 2112;
                        v130 = v107;
                        __int16 v131 = 2048;
                        double v132 = v24;
                        _os_log_debug_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_DEBUG, "%s, third party media on repeat weekly summary with media title, %@, duration, %@, total play time, %lf", buf, 0x2Au);
                      }
                      id v56 = v105;
                      [v97 addObject:v105];
                      [v95 addObjectsFromArray:v104];
                    }
                    else
                    {
                      id v56 = v105;
                    }
                  }
                  else
                  {
                    id v56 = 0;
                    uint64_t v13 = v97;
                    id v53 = v101;
                    i = v102;
                    id v54 = v107;
                  }
                }
                else
                {

                  id v54 = 0;
                  id v56 = 0;
                  id v53 = v101;
                }
              }
              id v100 = [v96 countByEnumeratingWithState:&v117 objects:v134 count:16];
            }
            while (v100);
          }
          else
          {
            double v16 = 0.0;
            double v17 = 0.0;
          }

          if ([v13 count])
          {
            id v61 = [MOEventBundle alloc];
            id v62 = [objc_alloc((Class)NSSet) initWithArray:v95];
            id v63 = [(MOEventBundle *)v61 initWithEventSet:v62 filtered:0];

            id v64 = [(MOMediaAggregationManager *)v93 _sortResourcesBySumPlaytime:v13];
            [(MOEventBundle *)v63 setInterfaceType:5];
            v65 = @"media_on_repeat_third_party";
            [(MOEventBundle *)v63 setBundleSuperType:4];
            [(MOEventBundle *)v63 setBundleSubType:409];
            long long v66 = [v89 firstObject];
            long long v67 = [v66 promptLanguage];
            long long v68 = +[NSString stringWithFormat:@"%@, etc.", v67];
            [(MOEventBundle *)v63 setPromptLanguage:v68];

            id v69 = [[MOAction alloc] initWithActionName:v65 actionType:1 actionSubtype:6];
            [(MOEventBundle *)v63 setAction:v69];

            long long v70 = [(MOMediaAggregationManager *)v93 _limitMOResourcesAndUpdatePriority:v64 parameters:v88 isSong:1 isFirstPartyApp:0];
            [(MOEventBundle *)v63 setResources:v70];

            id v71 = +[NSCalendar currentCalendar];
            id v72 = objc_alloc((Class)NSDate);
            long long v73 = +[NSDate date];
            id v74 = [v72 initWithTimeInterval:v73 sinceDate:-604800.0];
            long long v75 = [v71 startOfDayForDate:v74];
            [(MOEventBundle *)v63 setStartDate:v75];

            long long v76 = +[NSDate date];
            [(MOEventBundle *)v63 setEndDate:v76];

            [(MOEventBundle *)v63 setIsAggregatedAndSuppressed:1];
            [(MOMediaAggregationManager *)v93 _updateRankingDictionary:v63 mediaLength:1 sumPlaytime:v16 mediaActionIsRepeat:v17];
            id v77 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
            if (os_log_type_enabled(v77, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 136315394;
              v126 = "-[MOMediaAggregationManager _getMediaOnRepeatMegaBundleForThirdParty:mediaTypeEnum:parameters:]";
              __int16 v127 = 2112;
              v128 = v63;
              _os_log_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_INFO, "%s, bundle, %@, event category, third party Media on repeat mega bundle", buf, 0x16u);
            }

            uint64_t v78 = +[NSNumber numberWithDouble:v17];
            v79 = [(MOEventBundle *)v63 resources];
            id v80 = [v79 firstObject];
            uint64_t v81 = [v80 getDictionary];
            __int16 v82 = [v81 objectForKey:@"MOMediaPlayMetaDataKeyPlayerBundleID"];
            [v86 setValue:v78 forKey:v82];

            [v87 addObject:v63];
            uint64_t v13 = v97;
          }

          uint64_t v10 = v94 + 1;
        }
        while ((id)(v94 + 1) != v92);
        id v92 = [obj countByEnumeratingWithState:&v121 objects:v135 count:16];
      }
      while (v92);
    }

    id v8 = v88;
    id v83 = [(MOMediaAggregationManager *)v93 _sortAndMergeBundlesForThirdPartyApps:v87 playtimeDict:v86 paramters:v88 mediaActionIsRepeat:1];

    id v7 = v89;
  }
  else
  {
    id v83 = 0;
  }

  return v83;
}

- (id)_getPlayedMediaMegaBundle:(id)a3 mediaTypeEnum:(unint64_t)a4 paramters:(id)a5
{
  id v8 = a3;
  id v87 = a5;
  if ([v8 count])
  {
    double v9 = objc_opt_new();
    v85 = self;
    BOOL v86 = objc_opt_new();
    [(MOMediaAggregationManager *)self _createMediaDictionaryFromBundles:v8];
    long long v109 = 0u;
    long long v110 = 0u;
    long long v111 = 0u;
    id v92 = v112 = 0u;
    id obj = [v92 allKeys];
    id v89 = v9;
    id v90 = v8;
    id v93 = [obj countByEnumeratingWithState:&v109 objects:v122 count:16];
    if (v93)
    {
      uint64_t v91 = *(void *)v110;
      double v10 = 0.0;
      double v11 = 0.0;
      do
      {
        for (i = 0; i != v93; i = (char *)i + 1)
        {
          if (*(void *)v110 != v91) {
            objc_enumerationMutation(obj);
          }
          uint64_t v13 = *(void *)(*((void *)&v109 + 1) + 8 * i);
          uint64_t v102 = v13;
          uint64_t v15 = [v92 objectForKeyedSubscript:v13];
          long long v101 = objc_opt_new();
          long long v105 = 0u;
          long long v106 = 0u;
          long long v107 = 0u;
          long long v108 = 0u;
          id v16 = v15;
          id v98 = [v16 countByEnumeratingWithState:&v105 objects:v121 count:16];
          if (v98)
          {
            uint64_t v94 = v14;
            long long v95 = i;
            long long v103 = 0;
            long long v104 = 0;
            uint64_t v96 = *(void *)v106;
            long long v97 = v16;
            double v17 = 0.0;
            double v18 = 0.0;
            do
            {
              uint64_t v19 = 0;
              do
              {
                if (*(void *)v106 != v96) {
                  objc_enumerationMutation(v16);
                }
                long long v20 = *(MOEventBundle **)(*((void *)&v105 + 1) + 8 * v19);
                uint64_t v22 = [(MOEventBundle *)v20 events];
                id v23 = [v22 count];
                double v24 = [(MOEventBundle *)v20 resources];
                id v25 = [v24 count];

                context = v21;
                uint64_t v100 = v19;
                if (v23 == v25)
                {
                  unint64_t v26 = [(MOEventBundle *)v20 resources];
                  id v27 = [v26 count];

                  if (v27)
                  {
                    unint64_t v28 = 0;
                    do
                    {
                      id v30 = [(MOEventBundle *)v20 resources];
                      long long v31 = [v30 objectAtIndexedSubscript:v28];

                      id v32 = [v31 getDictionary];
                      unint64_t v33 = [v32 objectForKey:@"media_type"];
                      uint64_t v34 = (int)[v33 intValue];

                      if (v34 == a4)
                      {
                        id v35 = [v31 getDictionary];
                        id v36 = [v35 objectForKey:@"MOMediaPlayMetaDataKeyPlayerTitle"];

                        if ([v36 isEqualToString:v102])
                        {
                          uint64_t v37 = (uint64_t)v104;
                          if (!v104)
                          {
                            double v38 = [v31 getDictionary];
                            uint64_t v37 = [v38 objectForKey:@"MOMediaPlayMetaDataKeyPlayerDuration"];
                          }
                          long long v104 = (void *)v37;
                          unint64_t v39 = a4;
                          uint64_t v40 = [v31 getDictionary];
                          double v41 = [v40 objectForKey:@"MOMediaPlayMetaDataKeyPlayerSumPlaytime"];

                          double v42 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
                          if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
                          {
                            id v50 = +[MOMediaPlaySession redactString:v36];
                            *(_DWORD *)buf = 136315906;
                            long long v114 = "-[MOMediaAggregationManager _getPlayedMediaMegaBundle:mediaTypeEnum:paramters:]";
                            __int16 v115 = 2112;
                            long long v116 = v50;
                            __int16 v117 = 2112;
                            long long v118 = v104;
                            __int16 v119 = 2112;
                            long long v120 = v41;
                            _os_log_debug_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEBUG, "%s, played media with media title insdie weekly summary bundle, %@, duration, %@, total play time, %@", buf, 0x2Au);
                          }
                          [v41 doubleValue];
                          double v18 = v18 + v43;
                          double v11 = v11 + v18;
                          [v104 doubleValue];
                          double v17 = v17 + v44;
                          double v10 = v10 + v17;
                          id v45 = v31;

                          float v46 = [(MOEventBundle *)v20 events];
                          float v47 = [v46 objectAtIndexedSubscript:v28];
                          [v101 addObject:v47];

                          long long v103 = v45;
                          a4 = v39;
                        }
                      }
                      ++v28;
                      double v48 = [(MOEventBundle *)v20 resources];
                      id v49 = [v48 count];
                    }
                    while ((unint64_t)v49 > v28);
                  }
                }
                else
                {
                  uint64_t v51 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
                  if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 136315394;
                    long long v114 = "-[MOMediaAggregationManager _getPlayedMediaMegaBundle:mediaTypeEnum:paramters:]";
                    __int16 v115 = 2112;
                    long long v116 = v20;
                    _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_INFO, "%s, media bundle has bad data, %@", buf, 0x16u);
                  }
                }
                uint64_t v19 = v100 + 1;
                id v16 = v97;
              }
              while ((id)(v100 + 1) != v98);
              id v98 = [v97 countByEnumeratingWithState:&v105 objects:v121 count:16];
            }
            while (v98);

            id v52 = v103;
            if (v103)
            {
              double v9 = v89;
              id v8 = v90;
              id v14 = v94;
              i = v95;
              if ([v101 count])
              {
                if (v104
                  && (int)[v104 intValue] >= 1
                  && (double v53 = v18 / (double)(uint64_t)[v104 longValue],
                      objc_msgSend(v87, "coarseGranularity_mediaBundleAggregationPodcastPlayTimePercentageThreshold"),
                      v53 >= v54)
                  || (objc_msgSend(v87, "coarseGranularity_mediaBundleAggregationPodcastTotalPlayTimeThreshold"),
                      v18 >= v55))
                {
                  [v89 addObject:v103];
                  [v86 addObjectsFromArray:v101];
                }
              }
            }
            else
            {
              double v9 = v89;
              id v8 = v90;
              id v14 = v94;
              i = v95;
            }
            id v56 = v104;
          }
          else
          {

            id v56 = 0;
            id v52 = 0;
          }
        }
        id v93 = [obj countByEnumeratingWithState:&v109 objects:v122 count:16];
      }
      while (v93);
    }
    else
    {
      double v10 = 0.0;
      double v11 = 0.0;
    }

    if ([v9 count])
    {
      id v59 = [(MOMediaAggregationManager *)v85 _sortResourcesBySumPlaytime:v9];
      v60 = [MOEventBundle alloc];
      id v61 = [objc_alloc((Class)NSSet) initWithArray:v86];
      id v57 = [(MOEventBundle *)v60 initWithEventSet:v61 filtered:0];

      [(MOEventBundle *)v57 setInterfaceType:5];
      id v63 = [(MOMediaAggregationManager *)v85 _limitMOResourcesAndUpdatePriority:v59 parameters:v87 isSong:0 isFirstPartyApp:1];
      [(MOEventBundle *)v57 setResources:v63];

      id v64 = [(MOEventBundle *)v57 resources];
      v65 = [v64 firstObject];
      long long v66 = [v65 getDictionary];
      long long v67 = [v66 objectForKey:@"MOMediaPlayMetaDataKeyPlayerMediaTypeKey"];

      long long v68 = kMOMediaPlayAnnotationManagerStringPrefixPlayedPodcasts;
      if ((unint64_t)[v9 count] <= 1
        && ![v67 isEqualToString:MOMediaPlayMetaDataKeyPlayerMediaTypePodcastArtist[0]])
      {
        long long v68 = kMOMediaPlayAnnotationManagerStringPrefixPlayedPodcast;
      }
      id v69 = *v68;
      [(MOEventBundle *)v57 setBundleSuperType:4];
      [(MOEventBundle *)v57 setBundleSubType:405];
      long long v70 = [v8 firstObject];
      id v71 = [v70 promptLanguage];
      id v72 = +[NSString stringWithFormat:@"%@, etc.", v71];
      [(MOEventBundle *)v57 setPromptLanguage:v72];

      long long v73 = [[MOAction alloc] initWithActionName:v69 actionType:1 actionSubtype:6];
      [(MOEventBundle *)v57 setAction:v73];

      id v74 = [v86 firstObject];
      long long v75 = [v74 eventIdentifier];
      long long v76 = [(MOEventBundle *)v57 action];
      [v76 setSourceEventIdentifier:v75];

      id v77 = +[NSCalendar currentCalendar];
      id v78 = objc_alloc((Class)NSDate);
      v79 = +[NSDate date];
      id v80 = [v78 initWithTimeInterval:v79 sinceDate:-604800.0];
      uint64_t v81 = [v77 startOfDayForDate:v80];
      [(MOEventBundle *)v57 setStartDate:v81];

      __int16 v82 = +[NSDate date];
      [(MOEventBundle *)v57 setEndDate:v82];

      [(MOMediaAggregationManager *)v85 _updateRankingDictionary:v57 mediaLength:0 sumPlaytime:v10 mediaActionIsRepeat:v11];
      id v83 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
      if (os_log_type_enabled(v83, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        long long v114 = "-[MOMediaAggregationManager _getPlayedMediaMegaBundle:mediaTypeEnum:paramters:]";
        __int16 v115 = 2112;
        long long v116 = v57;
        _os_log_impl((void *)&_mh_execute_header, v83, OS_LOG_TYPE_INFO, "%s, bundle, %@, event category, Played Media mega bundle", buf, 0x16u);
      }

      double v9 = v89;
      id v8 = v90;
    }
    else
    {
      id v57 = 0;
    }
  }
  else
  {
    id v57 = 0;
  }

  return v57;
}

- (id)_getPlayedMediaMegaBundleForThirdParty:(id)a3 mediaTypeEnum:(unint64_t)a4 paramters:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if ([v8 count])
  {
    double v10 = [(MOMediaAggregationManager *)self _groupBundleByApps:v8];
    long long v95 = objc_opt_new();
    uint64_t v94 = objc_opt_new();
    long long v129 = 0u;
    long long v130 = 0u;
    long long v131 = 0u;
    long long v132 = 0u;
    long long v97 = v10;
    id obj = [v10 allKeys];
    id v98 = [obj countByEnumeratingWithState:&v129 objects:v143 count:16];
    if (!v98) {
      goto LABEL_59;
    }
    uint64_t v96 = *(void *)v130;
    long long v103 = v9;
    id v104 = v8;
    long long v105 = self;
    unint64_t v116 = a4;
    while (1)
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v130 != v96)
        {
          uint64_t v12 = v11;
          objc_enumerationMutation(obj);
          uint64_t v11 = v12;
        }
        uint64_t v100 = v11;
        uint64_t v13 = *(void *)(*((void *)&v129 + 1) + 8 * v11);
        id v14 = objc_opt_new();
        long long v101 = objc_opt_new();
        uint64_t v15 = [v97 objectForKeyedSubscript:v13];
        id v16 = [(MOMediaAggregationManager *)self _createMediaDictionaryFromBundles:v15];

        long long v127 = 0u;
        long long v128 = 0u;
        long long v125 = 0u;
        long long v126 = 0u;
        long long v108 = v16;
        id v102 = [v16 allKeys];
        long long v106 = v14;
        id v109 = [v102 countByEnumeratingWithState:&v125 objects:v142 count:16];
        if (!v109)
        {
          double v17 = 0.0;
          double v18 = 0.0;
          goto LABEL_50;
        }
        uint64_t v107 = *(void *)v126;
        double v17 = 0.0;
        double v18 = 0.0;
        do
        {
          for (i = 0; i != v109; i = (char *)i + 1)
          {
            if (*(void *)v126 != v107) {
              objc_enumerationMutation(v102);
            }
            uint64_t v20 = *(void *)(*((void *)&v125 + 1) + 8 * i);
            uint64_t v118 = v20;
            uint64_t v22 = [v108 objectForKeyedSubscript:v20];
            __int16 v117 = objc_opt_new();
            long long v121 = 0u;
            long long v122 = 0u;
            long long v123 = 0u;
            long long v124 = 0u;
            id v23 = v22;
            id v114 = [v23 countByEnumeratingWithState:&v121 objects:v141 count:16];
            if (v114)
            {
              long long v110 = v21;
              long long v111 = i;
              __int16 v119 = 0;
              long long v120 = 0;
              uint64_t v112 = *(void *)v122;
              long long v113 = v23;
              double v24 = 0.0;
              double v25 = 0.0;
              do
              {
                for (j = 0; j != v114; j = (char *)j + 1)
                {
                  if (*(void *)v122 != v112) {
                    objc_enumerationMutation(v23);
                  }
                  id v27 = *(MOEventBundle **)(*((void *)&v121 + 1) + 8 * (void)j);
                  id v29 = [(MOEventBundle *)v27 events];
                  id v30 = [v29 count];
                  long long v31 = [(MOEventBundle *)v27 resources];
                  id v32 = [v31 count];

                  context = v28;
                  if (v30 == v32)
                  {
                    unint64_t v33 = [(MOEventBundle *)v27 resources];
                    id v34 = [v33 count];

                    if (v34)
                    {
                      unint64_t v35 = 0;
                      do
                      {
                        uint64_t v37 = [(MOEventBundle *)v27 resources];
                        double v38 = [v37 objectAtIndexedSubscript:v35];

                        unint64_t v39 = [v38 getDictionary];
                        uint64_t v40 = [v39 objectForKey:@"media_type"];
                        uint64_t v41 = (int)[v40 intValue];

                        if (v41 == a4)
                        {
                          double v42 = [v38 getDictionary];
                          double v43 = [v42 objectForKey:@"MOMediaPlayMetaDataKeyPlayerTitle"];

                          if ([v43 isEqualToString:v118])
                          {
                            double v44 = v120;
                            if (!v120)
                            {
                              id v45 = [v38 getDictionary];
                              double v44 = [v45 objectForKey:@"MOMediaPlayMetaDataKeyPlayerDuration"];
                            }
                            float v46 = [v38 getDictionary];
                            float v47 = [v46 objectForKey:@"MOMediaPlayMetaDataKeyPlayerSumPlaytime"];

                            double v48 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
                            long long v120 = v44;
                            if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
                            {
                              id v56 = +[MOMediaPlaySession redactString:v43];
                              *(_DWORD *)buf = 136315906;
                              v134 = "-[MOMediaAggregationManager _getPlayedMediaMegaBundleForThirdParty:mediaTypeEnum:paramters:]";
                              __int16 v135 = 2112;
                              v136 = v56;
                              __int16 v137 = 2112;
                              v138 = v44;
                              __int16 v139 = 2112;
                              v140 = v47;
                              _os_log_debug_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEBUG, "%s, third party played media with media title insdie weekly summary bundle, %@, duration, %@, total play time, %@", buf, 0x2Au);
                            }
                            [v47 doubleValue];
                            double v25 = v25 + v49;
                            double v18 = v18 + v25;
                            [v44 doubleValue];
                            double v24 = v24 + v50;
                            double v17 = v17 + v24;
                            id v51 = v38;

                            id v52 = [(MOEventBundle *)v27 events];
                            double v53 = [v52 objectAtIndexedSubscript:v35];
                            [v117 addObject:v53];

                            __int16 v119 = v51;
                            a4 = v116;
                          }
                        }
                        ++v35;
                        float v54 = [(MOEventBundle *)v27 resources];
                        id v55 = [v54 count];
                      }
                      while ((unint64_t)v55 > v35);
                    }
                  }
                  else
                  {
                    id v57 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
                    if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
                    {
                      *(_DWORD *)buf = 136315394;
                      v134 = "-[MOMediaAggregationManager _getPlayedMediaMegaBundleForThirdParty:mediaTypeEnum:paramters:]";
                      __int16 v135 = 2112;
                      v136 = v27;
                      _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_INFO, "%s, third party media bundle has bad data, %@", buf, 0x16u);
                    }
                  }
                  id v23 = v113;
                }
                id v114 = [v113 countByEnumeratingWithState:&v121 objects:v141 count:16];
              }
              while (v114);

              if (v119)
              {
                id v9 = v103;
                id v8 = v104;
                self = v105;
                id v14 = v106;
                id v21 = v110;
                i = v111;
                if ([v117 count])
                {
                  uint64_t v58 = v120;
                  if (!v120
                    || ![v120 intValue]
                    || (int)[v120 intValue] >= 1
                    && (double v59 = v25 / (double)(uint64_t)[v120 longValue],
                        objc_msgSend(v103, "coarseGranularity_mediaBundleAggregationPodcastPlayTimePercentageThreshold"),
                        v59 >= v60))
                  {
                    id v61 = v119;
                    [v106 addObject:v119];
                    [v101 addObjectsFromArray:v117];
                    goto LABEL_46;
                  }
                }
                else
                {
                  uint64_t v58 = v120;
                }
                id v61 = v119;
              }
              else
              {
                id v61 = 0;
                id v9 = v103;
                id v8 = v104;
                self = v105;
                id v14 = v106;
                id v21 = v110;
                i = v111;
                uint64_t v58 = v120;
              }
            }
            else
            {

              uint64_t v58 = 0;
              id v61 = 0;
            }
LABEL_46:
          }
          id v109 = [v102 countByEnumeratingWithState:&v125 objects:v142 count:16];
        }
        while (v109);
LABEL_50:

        if ([v14 count])
        {
          id v62 = [(MOMediaAggregationManager *)self _sortResourcesBySumPlaytime:v14];
          id v63 = [MOEventBundle alloc];
          id v64 = [objc_alloc((Class)NSSet) initWithArray:v101];
          v65 = [(MOEventBundle *)v63 initWithEventSet:v64 filtered:0];

          [(MOEventBundle *)v65 setInterfaceType:5];
          long long v66 = [(MOMediaAggregationManager *)self _limitMOResourcesAndUpdatePriority:v62 parameters:v9 isSong:0 isFirstPartyApp:0];
          [(MOEventBundle *)v65 setResources:v66];

          long long v67 = [(MOEventBundle *)v65 resources];
          long long v68 = [v67 firstObject];
          id v69 = [v68 getDictionary];
          long long v70 = [v69 objectForKey:@"MOMediaPlayMetaDataKeyPlayerMediaTypeKey"];

          id v71 = [v14 count];
          id v72 = @"played_podcasts";
          if ((unint64_t)v71 <= 1)
          {
            unsigned int v73 = [v70 isEqualToString:MOMediaPlayMetaDataKeyPlayerMediaTypePodcastArtist[0]];
            id v72 = @"played_podcast";
            if (v73) {
              id v72 = @"played_podcasts";
            }
          }
          id v74 = v72;
          [(MOEventBundle *)v65 setBundleSuperType:4];
          [(MOEventBundle *)v65 setBundleSubType:410];
          [(MOEventBundle *)v65 setIsAggregatedAndSuppressed:1];
          long long v75 = [v8 firstObject];
          long long v76 = [v75 promptLanguage];
          id v77 = +[NSString stringWithFormat:@"%@, etc.", v76];
          [(MOEventBundle *)v65 setPromptLanguage:v77];

          id v78 = [[MOAction alloc] initWithActionName:v74 actionType:1 actionSubtype:6];
          [(MOEventBundle *)v65 setAction:v78];

          v79 = +[NSCalendar currentCalendar];
          id v80 = objc_alloc((Class)NSDate);
          uint64_t v81 = +[NSDate date];
          id v82 = [v80 initWithTimeInterval:v81 sinceDate:-604800.0];
          id v83 = [v79 startOfDayForDate:v82];
          [(MOEventBundle *)v65 setStartDate:v83];

          __int16 v84 = +[NSDate date];
          [(MOEventBundle *)v65 setEndDate:v84];

          [(MOMediaAggregationManager *)v105 _updateRankingDictionary:v65 mediaLength:0 sumPlaytime:v17 mediaActionIsRepeat:v18];
          v85 = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
          if (os_log_type_enabled(v85, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315394;
            v134 = "-[MOMediaAggregationManager _getPlayedMediaMegaBundleForThirdParty:mediaTypeEnum:paramters:]";
            __int16 v135 = 2112;
            v136 = v65;
            _os_log_impl((void *)&_mh_execute_header, v85, OS_LOG_TYPE_INFO, "%s, bundle, %@, event category, third party Played Media mega bundle", buf, 0x16u);
          }

          BOOL v86 = +[NSNumber numberWithDouble:v18];
          id v87 = [(MOEventBundle *)v65 resources];
          id v88 = [v87 firstObject];
          id v89 = [v88 getDictionary];
          id v90 = [v89 objectForKey:@"MOMediaPlayMetaDataKeyPlayerBundleID"];
          [v94 setValue:v86 forKey:v90];

          [v95 addObject:v65];
          id v9 = v103;
          id v8 = v104;
          self = v105;
          id v14 = v106;
          a4 = v116;
        }

        uint64_t v11 = v100 + 1;
      }
      while ((id)(v100 + 1) != v98);
      id v98 = [obj countByEnumeratingWithState:&v129 objects:v143 count:16];
      if (!v98)
      {
LABEL_59:

        uint64_t v91 = [(MOMediaAggregationManager *)self _sortAndMergeBundlesForThirdPartyApps:v95 playtimeDict:v94 paramters:v9 mediaActionIsRepeat:0];

        goto LABEL_61;
      }
    }
  }
  uint64_t v91 = 0;
LABEL_61:

  return v91;
}

- (void)_updateMOResourceDictionary:(id)a3 dictKey:(id)a4 dictValue:(id)a5
{
  id v7 = a3;
  id v26 = a4;
  id v8 = a5;
  id v9 = [v7 resources];
  double v10 = [v9 firstObject];

  if (v10)
  {
    uint64_t v11 = objc_opt_new();
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    double v24 = v7;
    id obj = [v7 resources];
    id v12 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v28;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v28 != v14) {
            objc_enumerationMutation(obj);
          }
          id v16 = *(void **)(*((void *)&v27 + 1) + 8 * (void)v15);
          double v18 = [v16 getDictionary];
          id v19 = [v18 mutableCopy];

          [v19 setObject:v8 forKeyedSubscript:v26];
          uint64_t v20 = [MOResource alloc];
          id v21 = [v16 name];
          uint64_t v22 = -[MOResource initWithName:type:dict:value:](v20, "initWithName:type:dict:value:", v21, [v16 type], v19, 0.0);

          id v23 = [v16 sourceEventIdentifier];
          [(MOResource *)v22 setSourceEventIdentifier:v23];

          -[MOResource setSourceEventAccessType:](v22, "setSourceEventAccessType:", [v16 sourceEventAccessType]);
          [v16 priorityScore];
          -[MOResource setPriorityScore:](v22, "setPriorityScore:");
          [v11 addObject:v22];

          uint64_t v15 = (char *)v15 + 1;
        }
        while (v13 != v15);
        id v13 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
      }
      while (v13);
    }

    id v7 = v24;
    [v24 setResources:v11];
  }
}

- (id)_sortAndMergeBundlesForThirdPartyApps:(id)a3 playtimeDict:(id)a4 paramters:(id)a5 mediaActionIsRepeat:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ([v10 count])
  {
    if ([v10 count] == (id)1)
    {
      id v13 = [v10 objectAtIndexedSubscript:0];
      [v13 setIsAggregatedAndSuppressed:0];

      uint64_t v14 = [v10 firstObject];
      uint64_t v15 = [v14 events];
      id v16 = +[MOContextAnnotationUtilities dominantMediaNameFromEvents:v15];

      if (v16)
      {
        double v17 = [v16 objectForKeyedSubscript:@"DominantMediaNameKey"];

        if (v17)
        {
          double v18 = [v10 objectAtIndexedSubscript:0];
          id v19 = [v16 objectForKey:@"DominantMediaNameKey"];
          [(MOMediaAggregationManager *)self _updateMOResourceDictionary:v18 dictKey:@"third_party_dominate_value" dictValue:v19];
        }
      }
      uint64_t v20 = [v10 firstObject];
    }
    else
    {
      BOOL context = v6;
      v85 = self;
      BOOL v86 = v12;
      id v83 = v11;
      id v90 = [v11 keysSortedByValueUsingComparator:&__block_literal_global_143];
      uint64_t v91 = objc_opt_new();
      id v21 = objc_opt_new();
      long long v92 = 0u;
      long long v93 = 0u;
      long long v94 = 0u;
      long long v95 = 0u;
      id v84 = v10;
      id v22 = v10;
      id v23 = [v22 countByEnumeratingWithState:&v92 objects:v96 count:16];
      if (v23)
      {
        id v24 = v23;
        uint64_t v25 = *(void *)v93;
        double v26 = 0.0;
        do
        {
          for (i = 0; i != v24; i = (char *)i + 1)
          {
            if (*(void *)v93 != v25) {
              objc_enumerationMutation(v22);
            }
            long long v28 = *(void **)(*((void *)&v92 + 1) + 8 * i);
            long long v29 = [v28 events];
            [v21 addObjectsFromArray:v29];

            long long v30 = [v28 metaDataForRank];
            long long v31 = [v30 objectForKey:@"MediaLength"];

            if (v31)
            {
              id v32 = [v28 metaDataForRank];
              unint64_t v33 = [v32 objectForKey:@"MediaLength"];
              [v33 doubleValue];
              double v26 = v26 + v34;
            }
            unint64_t v35 = [v28 metaDataForRank];
            id v36 = [v35 objectForKey:@"MediaTotalPlayTime"];

            if (v36)
            {
              uint64_t v37 = [v28 metaDataForRank];
              double v38 = [v37 objectForKey:@"MediaTotalPlayTime"];
              [v38 doubleValue];
              double v26 = v26 + v39;
            }
          }
          id v24 = [v22 countByEnumeratingWithState:&v92 objects:v96 count:16];
        }
        while (v24);
      }
      else
      {
        double v26 = 0.0;
      }

      uint64_t v40 = [MOEventBundle alloc];
      id v41 = [objc_alloc((Class)NSSet) initWithArray:v21];
      double v42 = [(MOEventBundle *)v40 initWithEventSet:v41 filtered:0];

      double v43 = [v22 firstObject];
      -[MOEventBundle setInterfaceType:](v42, "setInterfaceType:", [v43 interfaceType]);

      double v44 = [v22 firstObject];
      -[MOEventBundle setBundleSuperType:](v42, "setBundleSuperType:", [v44 bundleSuperType]);

      id v45 = [v22 firstObject];
      -[MOEventBundle setBundleSubType:](v42, "setBundleSubType:", [v45 bundleSubType]);

      float v46 = [v22 firstObject];
      float v47 = [v46 promptLanguage];
      [(MOEventBundle *)v42 setPromptLanguage:v47];

      double v48 = [v22 firstObject];
      double v49 = [v48 action];
      [(MOEventBundle *)v42 setAction:v49];

      double v50 = [v22 firstObject];
      id v51 = [v50 labels];
      [(MOEventBundle *)v42 setLabels:v51];

      [(MOMediaAggregationManager *)v85 _updateRankingDictionary:v42 mediaLength:context sumPlaytime:v26 mediaActionIsRepeat:0.0];
      id v52 = [v86 mediaBundleMaxResourcesPerBundle];
      unsigned int v53 = v52;
      double v54 = (double)(uint64_t)v52;
      id v55 = v90;
      id v82 = v42;
      if ([v90 count])
      {
        unint64_t v56 = 0;
        int v57 = 0;
        do
        {
          uint64_t v58 = [v22 objectAtIndexedSubscript:v56];
          double v59 = [v58 resources];
          v57 += [v59 count];

          ++v56;
        }
        while ((unint64_t)[v90 count] > v56);
      }
      else
      {
        int v57 = 0;
      }
      double v60 = (double)v57;
      if ((double)v57 >= v54) {
        uint64_t v61 = v53;
      }
      else {
        uint64_t v61 = v57;
      }
      uint64_t v87 = v61;
      int v62 = v61 - 1;
      if ((int)v61 >= 1)
      {
        unint64_t v63 = 0;
        uint64_t v64 = 0;
        do
        {
          if ([v55 count])
          {
            uint64_t v65 = 0;
            while (1)
            {
              long long v66 = [v22 objectAtIndexedSubscript:v65];
              long long v67 = [v66 resources];
              id v68 = [v67 count];

              if ((unint64_t)v68 <= v63)
              {
                uint64_t v74 = v64;
              }
              else
              {
                id v69 = [v22 objectAtIndexedSubscript:v65];
                long long v70 = [v69 resources];
                id v71 = [v70 objectAtIndexedSubscript:v63];
                id v72 = [v71 copy];

                if (v64)
                {
                  if ((int)v64 > 3) {
                    uint64_t v73 = v64 + 297;
                  }
                  else {
                    uint64_t v73 = (int)v64 + 199;
                  }
                  double v75 = (double)(unint64_t)v73;
                }
                else
                {
                  double v75 = 100.0;
                }
                id v55 = v90;
                [v72 setPriorityScore:v75];
                uint64_t v74 = (v64 + 1);
                [v91 addObject:v72];

                BOOL v76 = (int)v64 < v62;
                uint64_t v64 = v74;
                if (!v76) {
                  goto LABEL_46;
                }
              }
              if ((unint64_t)[v55 count] <= ++v65) {
                goto LABEL_46;
              }
            }
          }
          uint64_t v74 = v64;
LABEL_46:
          ++v63;
          uint64_t v64 = v74;
        }
        while (v63 != v87);
      }
      uint64_t v20 = v82;
      -[MOEventBundle setResources:](v82, "setResources:", v91, v60);
      id v77 = [(MOEventBundle *)v82 events];
      id v78 = +[MOContextAnnotationUtilities dominantMediaNameFromEvents:v77];

      if (v78)
      {
        v79 = [v78 objectForKeyedSubscript:@"DominantMediaNameKey"];

        if (v79)
        {
          id v80 = [v78 objectForKey:@"DominantMediaNameKey"];
          [(MOMediaAggregationManager *)v85 _updateMOResourceDictionary:v82 dictKey:@"third_party_dominate_value" dictValue:v80];
        }
      }

      id v11 = v83;
      id v10 = v84;
      id v12 = v86;
    }
  }
  else
  {
    uint64_t v20 = 0;
  }

  return v20;
}

int64_t __110__MOMediaAggregationManager__sortAndMergeBundlesForThirdPartyApps_playtimeDict_paramters_mediaActionIsRepeat___block_invoke(id a1, id a2, id a3)
{
  return (int64_t)[a3 compare:a2];
}

- (id)_createMediaDictionaryFromBundles:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = v3;
  id v22 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v22)
  {
    uint64_t v21 = *(void *)v29;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v29 != v21) {
          objc_enumerationMutation(obj);
        }
        uint64_t v23 = v5;
        BOOL v6 = *(void **)(*((void *)&v28 + 1) + 8 * v5);
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        id v7 = [v6 resources];
        id v8 = [v7 countByEnumeratingWithState:&v24 objects:v32 count:16];
        if (v8)
        {
          id v9 = v8;
          uint64_t v10 = *(void *)v25;
          do
          {
            for (i = 0; i != v9; i = (char *)i + 1)
            {
              if (*(void *)v25 != v10) {
                objc_enumerationMutation(v7);
              }
              id v12 = *(void **)(*((void *)&v24 + 1) + 8 * i);
              uint64_t v14 = [v12 getDictionary];
              uint64_t v15 = [v14 objectForKey:@"MOMediaPlayMetaDataKeyPlayerTitle"];

              if (v15)
              {
                id v16 = [v4 objectForKeyedSubscript:v15];

                if (!v16)
                {
                  double v17 = objc_opt_new();
                  [v4 setObject:v17 forKeyedSubscript:v15];
                }
                double v18 = [v4 objectForKeyedSubscript:v15];
                [v18 addObject:v6];
              }
            }
            id v9 = [v7 countByEnumeratingWithState:&v24 objects:v32 count:16];
          }
          while (v9);
        }

        uint64_t v5 = v23 + 1;
      }
      while ((id)(v23 + 1) != v22);
      id v22 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v22);
  }

  return v4;
}

@end