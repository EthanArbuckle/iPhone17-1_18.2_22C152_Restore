@interface MOEmbedding
- (MOEmbedding)initWithEventBundle:(id)a3 forEmbeddingType:(unint64_t)a4;
- (NSDictionary)activityContextEmbedding;
- (NSDictionary)extraContextEmbedding;
- (NSDictionary)locationContextEmbedding;
- (NSDictionary)socialContextEmbedding;
- (NSDictionary)timeContextEmbedding;
- (NSUUID)bundleIdentifier;
- (NSUUID)suggestionID;
- (double)getActivityContextDistanceFrom:(id)a3 withWeights:(id)a4;
- (double)getDistanceFrom:(id)a3 withWeights:(id)a4;
- (double)getExtraContextDistanceFrom:(id)a3 withWeights:(id)a4;
- (double)getLocationContextDistanceFrom:(id)a3 withWeights:(id)a4;
- (double)getSocialContextDistanceFrom:(id)a3 withWeights:(id)a4;
- (double)getTimeContextDistanceFrom:(id)a3 withWeights:(id)a4;
- (id)dayOfWeekString:(unint64_t)a3;
- (id)description;
- (id)extractActivtyContextEmbedding:(id)a3;
- (id)extractExtraContextEmbedding:(id)a3;
- (id)extractLocationContextEmbedding:(id)a3;
- (id)extractSocialContextEmbedding:(id)a3;
- (id)extractTimeContextEmbedding:(id)a3;
- (id)summaryDictionary;
- (unint64_t)embeddingType;
- (void)extractContextsFromPhotoTraits:(id)a3;
- (void)setActivityContextEmbedding:(id)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setEmbeddingType:(unint64_t)a3;
- (void)setExtraContextEmbedding:(id)a3;
- (void)setLocationContextEmbedding:(id)a3;
- (void)setSocialContextEmbedding:(id)a3;
- (void)setSuggestionID:(id)a3;
- (void)setTimeContextEmbedding:(id)a3;
@end

@implementation MOEmbedding

- (MOEmbedding)initWithEventBundle:(id)a3 forEmbeddingType:(unint64_t)a4
{
  id v7 = a3;
  if (v7)
  {
    v28.receiver = self;
    v28.super_class = (Class)MOEmbedding;
    v8 = [(MOEmbedding *)&v28 init];
    if (v8)
    {
      uint64_t v9 = [v7 bundleIdentifier];
      bundleIdentifier = v8->_bundleIdentifier;
      v8->_bundleIdentifier = (NSUUID *)v9;

      uint64_t v11 = [v7 suggestionID];
      suggestionID = v8->_suggestionID;
      v8->_suggestionID = (NSUUID *)v11;

      v8->_embeddingType = a4;
      uint64_t v13 = [(MOEmbedding *)v8 extractActivtyContextEmbedding:v7];
      activityContextEmbedding = v8->_activityContextEmbedding;
      v8->_activityContextEmbedding = (NSDictionary *)v13;

      uint64_t v15 = [(MOEmbedding *)v8 extractTimeContextEmbedding:v7];
      timeContextEmbedding = v8->_timeContextEmbedding;
      v8->_timeContextEmbedding = (NSDictionary *)v15;

      uint64_t v17 = [(MOEmbedding *)v8 extractLocationContextEmbedding:v7];
      locationContextEmbedding = v8->_locationContextEmbedding;
      v8->_locationContextEmbedding = (NSDictionary *)v17;

      uint64_t v19 = [(MOEmbedding *)v8 extractSocialContextEmbedding:v7];
      socialContextEmbedding = v8->_socialContextEmbedding;
      v8->_socialContextEmbedding = (NSDictionary *)v19;

      uint64_t v21 = [(MOEmbedding *)v8 extractExtraContextEmbedding:v7];
      extraContextEmbedding = v8->_extraContextEmbedding;
      v8->_extraContextEmbedding = (NSDictionary *)v21;

      v23 = [v7 photoTraits];
      [(MOEmbedding *)v8 extractContextsFromPhotoTraits:v23];
    }
    self = v8;
    v24 = self;
  }
  else
  {
    v25 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      -[MOEmbedding initWithEventBundle:forEmbeddingType:]();
    }

    v26 = +[NSAssertionHandler currentHandler];
    [v26 handleFailureInMethod:a2 object:self file:@"MOEmbedding.m" lineNumber:29 description:@"Invalid parameter not satisfying: eventBundle"];

    v24 = 0;
  }

  return v24;
}

- (id)extractActivtyContextEmbedding:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  v5 = [v3 getSuperTypeString];
  [v4 setObject:v5 forKeyedSubscript:@"topLevelActivityType"];

  v6 = [v3 action];

  id v7 = [v6 actionName];
  [v4 setObject:v7 forKeyedSubscript:@"secondLevelActivityType"];

  return v4;
}

- (id)extractTimeContextEmbedding:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_new();
  v6 = [v4 localStartDate];
  id v7 = +[NSCalendar currentCalendar];
  v8 = v7;
  unint64_t embeddingType = self->_embeddingType;
  if (embeddingType == 2)
  {
    __double2 v32 = __sincos_stret((double)(uint64_t)[v7 component:4096 fromDate:v6] * 6.28318531 / 5.0);
    __double2 v33 = __sincos_stret((double)(uint64_t)[v8 component:8 fromDate:v6] * 6.28318531 / 12.0);
    v34 = +[NSNumber numberWithDouble:v32.__cosval];
    [v5 setObject:v34 forKeyedSubscript:@"weekOfMonthCos"];

    v35 = +[NSNumber numberWithDouble:v32.__sinval];
    [v5 setObject:v35 forKeyedSubscript:@"weekOfMonthSin"];

    v36 = +[NSNumber numberWithDouble:v33.__cosval];
    [v5 setObject:v36 forKeyedSubscript:@"monthCos"];

    v37 = +[NSNumber numberWithDouble:v33.__sinval];
    [v5 setObject:v37 forKeyedSubscript:@"monthSin"];

    id v31 = v5;
  }
  else if (embeddingType == 1)
  {
    [v4 duration];
    double v11 = v10 / 86400.0;
    v12 = [v8 components:96 fromDate:v6];
    __double2 v13 = __sincos_stret(((double)(uint64_t)[v12 minute] / 60.0 + (double)(uint64_t)objc_msgSend(v12, "hour"))* 6.28318531/ 24.0);
    id v14 = [v8 component:512 fromDate:v6];
    double v15 = (double)(uint64_t)v14;
    __double2 v16 = __sincos_stret((double)(uint64_t)v14 * 6.28318531 / 7.0);
    BOOL v18 = v14 == (id)1 || v14 == (id)7;
    double v19 = (double)(uint64_t)[v8 component:0x2000 fromDate:v6];
    v20 = +[NSNumber numberWithDouble:v11];
    [v5 setObject:v20 forKeyedSubscript:@"normalizedDuration"];

    uint64_t v21 = +[NSNumber numberWithDouble:v13.__cosval];
    [v5 setObject:v21 forKeyedSubscript:@"timeOfDayCos"];

    v22 = +[NSNumber numberWithDouble:v13.__sinval];
    [v5 setObject:v22 forKeyedSubscript:@"timeOfDaySin"];

    v23 = +[NSNumber numberWithDouble:v16.__cosval];
    [v5 setObject:v23 forKeyedSubscript:@"dayOfWeekCos"];

    v24 = +[NSNumber numberWithDouble:v16.__sinval];
    [v5 setObject:v24 forKeyedSubscript:@"dayOfWeekSin"];

    v25 = +[NSNumber numberWithBool:v18];
    [v5 setObject:v25 forKeyedSubscript:@"isWeekend"];

    v26 = [v4 localStartDate];
    v27 = [v4 localEndDate];
    objc_super v28 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", +[MOTime simpleTimetagFromStartDate:v26 endDate:v27]);
    [v5 setObject:v28 forKeyedSubscript:@"timeTag"];

    v29 = +[NSNumber numberWithDouble:v15];
    [v5 setObject:v29 forKeyedSubscript:@"dayOfWeek"];

    v30 = +[NSNumber numberWithDouble:v19];
    [v5 setObject:v30 forKeyedSubscript:@"weekOfYear"];

    id v31 = v5;
  }
  else
  {
    v38 = _mo_log_facility_get_os_log(&MOLogFacilityPatternEmbedding);
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
      -[MOEmbedding extractTimeContextEmbedding:]();
    }

    id v31 = 0;
  }

  return v31;
}

- (id)extractLocationContextEmbedding:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  v5 = [v3 place];

  if (v5)
  {
    v6 = [v3 place];
    id v7 = [v6 placeName];
    id v8 = [v7 length];

    if (v8)
    {
      uint64_t v9 = [v3 place];
      double v10 = [v9 placeName];
      [v4 setObject:v10 forKeyedSubscript:@"placeName"];
    }
    double v11 = [v3 place];
    v12 = [v11 enclosingArea];
    id v13 = [v12 length];

    if (v13)
    {
      id v14 = [v3 place];
      v12 = [v14 enclosingArea];
      [v4 setObject:v12 forKeyedSubscript:@"enclosingAreaName"];
    }
    double v15 = [v3 place];
    id v16 = [v15 placeType];
    if (v16 == (id)2
      || ([v3 place],
          v12 = objc_claimAutoreleasedReturnValue(),
          [v12 placeType] == (id)3))
    {
      uint64_t v17 = [v3 place];
      BOOL v18 = [v17 poiCategory];
      id v19 = [v18 length];

      if (v16 != (id)2) {
      if (!v19)
      }
      {
LABEL_13:
        v20 = [v3 place];
        if ([v20 placeUserType])
        {
          uint64_t v21 = [v3 place];
          id v22 = [v21 placeUserType];

          if (v22 == (id)100) {
            goto LABEL_17;
          }
          v20 = [v3 place];
          v23 = +[MOEventRoutine stringOfPlaceUserType:](MOEventRoutine, "stringOfPlaceUserType:", [v20 placeUserType]);
          [v4 setObject:v23 forKeyedSubscript:@"combinedPlaceType"];
        }
LABEL_17:
        v24 = [v3 place];
        v25 = [v24 location];
        [v25 latitude];
        if (v26 != 0.0)
        {
          v27 = [v3 place];
          objc_super v28 = [v27 location];
          [v28 longitude];
          double v30 = v29;

          if (v30 == 0.0)
          {
LABEL_21:
            v35 = [v3 place];
            [v35 familiarityIndexLOI];
            v36 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
            [v4 setObject:v36 forKeyedSubscript:@"placeFamiliarityIndexLOI"];

            goto LABEL_22;
          }
          id v31 = [v3 place];
          __double2 v32 = [v31 location];
          [v32 latitude];
          __double2 v33 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
          [v4 setObject:v33 forKeyedSubscript:@"placeLatitude"];

          v24 = [v3 place];
          v25 = [v24 location];
          [v25 longitude];
          v34 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
          [v4 setObject:v34 forKeyedSubscript:@"placeLongitude"];
        }
        goto LABEL_21;
      }
      double v15 = [v3 place];
      v12 = [v15 poiCategory];
      [v4 setObject:v12 forKeyedSubscript:@"combinedPlaceType"];
    }

    goto LABEL_13;
  }
LABEL_22:

  return v4;
}

- (id)extractSocialContextEmbedding:(id)a3
{
  id v3 = a3;
  id v4 = [v3 persons];
  id v5 = [v4 count];

  if (v5)
  {
    uint64_t v29 = objc_opt_new();
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v28 = v3;
    v6 = [v3 persons];
    id v7 = [v6 countByEnumeratingWithState:&v35 objects:v43 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v33 = 0;
      uint64_t v34 = 0;
      uint64_t v31 = 0;
      uint64_t v32 = 0;
      uint64_t v30 = 0;
      uint64_t v9 = *(void *)v36;
      double v10 = (void *)v29;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v36 != v9) {
            objc_enumerationMutation(v6);
          }
          v12 = *(void **)(*((void *)&v35 + 1) + 8 * i);
          id v13 = [v12 name];

          if (v13 && ([v12 isMePerson] & 1) == 0) {
            [v10 addObject:v12];
          }
          uint64_t v14 = +[MOClusteringUtility getTheBestPersonRelationtshipTagFor:v12];
          double v15 = _mo_log_facility_get_os_log(&MOLogFacilityPatternEmbedding);
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
          {
            id v16 = [v12 name];
            uint64_t v17 = [v16 mask];
            *(_DWORD *)buf = 138412546;
            v40 = v17;
            __int16 v41 = 2048;
            uint64_t v42 = v14;
            _os_log_debug_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "Relationship Tag for person %@:%lu", buf, 0x16u);

            double v10 = (void *)v29;
          }

          if (v14 <= 20)
          {
            if (v14 == 4)
            {
              ++v30;
            }
            else if (v14 == 15)
            {
              ++v33;
            }
          }
          else
          {
            switch(v14)
            {
              case 21:
                ++v32;
                break;
              case 22:
                ++v31;
                break;
              case 27:
                ++v34;
                break;
            }
          }
        }
        id v8 = [v6 countByEnumeratingWithState:&v35 objects:v43 count:16];
      }
      while (v8);
    }
    else
    {
      uint64_t v33 = 0;
      uint64_t v34 = 0;
      uint64_t v31 = 0;
      uint64_t v32 = 0;
      uint64_t v30 = 0;
      double v10 = (void *)v29;
    }

    id v5 = (id)objc_opt_new();
    BOOL v18 = v10;
    id v19 = [v10 copy];
    [v5 setObject:v19 forKeyedSubscript:@"persons"];

    v20 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v18 count] != 0);
    [v5 setObject:v20 forKeyedSubscript:@"withContact"];

    uint64_t v21 = +[NSNumber numberWithInt:v30 != 0];
    [v5 setObject:v21 forKeyedSubscript:@"withFamily"];

    id v22 = +[NSNumber numberWithInt:v31 != 0];
    [v5 setObject:v22 forKeyedSubscript:@"withCoworker"];

    v23 = +[NSNumber numberWithInt:v32 != 0];
    [v5 setObject:v23 forKeyedSubscript:@"withFriend"];

    v24 = +[NSNumber numberWithInt:v33 != 0];
    [v5 setObject:v24 forKeyedSubscript:@"withChild"];

    v25 = +[NSNumber numberWithInt:v34 != 0];
    [v5 setObject:v25 forKeyedSubscript:@"withMyPet"];

    double v26 = _mo_log_facility_get_os_log(&MOLogFacilityPatternEmbedding);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
      -[MOEmbedding extractSocialContextEmbedding:]((uint64_t)v5, v26);
    }

    id v3 = v28;
  }

  return v5;
}

- (id)extractExtraContextEmbedding:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  id v5 = [v3 rankingDictionary];
  v6 = [v5 objectForKeyedSubscript:@"bundleGoodnessScore"];

  if (v6)
  {
    id v7 = [v3 rankingDictionary];
    id v8 = [v7 objectForKeyedSubscript:@"bundleGoodnessScore"];
    [v4 setObject:v8 forKeyedSubscript:@"bundleGoodnessScore"];
  }
  uint64_t v9 = [v3 resources];
  id v10 = [v9 count];

  if (v10)
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    double v11 = [v3 resources];
    id v12 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v12)
    {
      id v13 = v12;
      LODWORD(v14) = 0;
      uint64_t v15 = *(void *)v20;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v20 != v15) {
            objc_enumerationMutation(v11);
          }
          if ([*(id *)(*((void *)&v19 + 1) + 8 * i) type] == (id)2) {
            uint64_t v14 = (v14 + 1);
          }
          else {
            uint64_t v14 = v14;
          }
        }
        id v13 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v13);
    }
    else
    {
      uint64_t v14 = 0;
    }

    uint64_t v17 = +[NSNumber numberWithInt:v14];
    [v4 setObject:v17 forKeyedSubscript:@"photoCount"];
  }
  else
  {
    [v4 setObject:&off_1002F6080 forKeyedSubscript:@"photoCount"];
  }

  return v4;
}

- (void)extractContextsFromPhotoTraits:(id)a3
{
  id v4 = a3;
  id v5 = _mo_log_facility_get_os_log(&MOLogFacilityPatternEmbedding);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[MOEmbedding extractContextsFromPhotoTraits:].cold.7(v4, v5);
  }

  if ([v4 count])
  {
    v94 = self;
    v99 = objc_opt_new();
    v98 = objc_opt_new();
    v96 = objc_opt_new();
    v97 = objc_opt_new();
    v95 = objc_opt_new();
    long long v101 = 0u;
    long long v102 = 0u;
    long long v103 = 0u;
    long long v104 = 0u;
    id obj = v4;
    id v6 = [obj countByEnumeratingWithState:&v101 objects:v111 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v102;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v102 != v8) {
            objc_enumerationMutation(obj);
          }
          id v10 = *(void **)(*((void *)&v101 + 1) + 8 * i);
          double v11 = [v10 name];
          id v12 = [v11 length];

          if (v12)
          {
            id v13 = _mo_log_facility_get_os_log(&MOLogFacilityPatternEmbedding);
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
              -[MOEmbedding extractContextsFromPhotoTraits:].cold.6(v109, v10, &v110, v13);
            }

            uint64_t v14 = [v10 name];
            uint64_t v15 = [v14 lowercaseString];
            unsigned int v16 = [&off_1002F8E58 containsObject:v15];

            if (v16)
            {
              uint64_t v17 = [v10 name];
              BOOL v18 = [v17 lowercaseString];
              id v19 = [&off_1002F8E58 indexOfObject:v18];

              long long v20 = +[NSNumber numberWithUnsignedInteger:v19];
              long long v21 = [v10 name];
              long long v22 = [v21 lowercaseString];
              [v99 setObject:v20 forKey:v22];

              v23 = _mo_log_facility_get_os_log(&MOLogFacilityPatternEmbedding);
              if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
              {
                v64 = [v10 name];
                *(_DWORD *)buf = 138412546;
                v106 = v64;
                __int16 v107 = 2048;
                id v108 = v19;
                _os_log_debug_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEBUG, "Photo trait was found from activity type list: traitName=%@, rankFromList=%lu", buf, 0x16u);
              }
            }
            v24 = [v10 name];
            v25 = [v24 lowercaseString];
            unsigned int v26 = [&off_1002F8E88 containsObject:v25];

            if (v26)
            {
              v27 = [v10 name];
              id v28 = [v27 lowercaseString];
              id v29 = [&off_1002F8E88 indexOfObject:v28];

              uint64_t v30 = +[NSNumber numberWithUnsignedInteger:v29];
              uint64_t v31 = [v10 name];
              uint64_t v32 = [v31 lowercaseString];
              [v98 setObject:v30 forKey:v32];

              uint64_t v33 = _mo_log_facility_get_os_log(&MOLogFacilityPatternEmbedding);
              if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
              {
                v65 = [v10 name];
                *(_DWORD *)buf = 138412546;
                v106 = v65;
                __int16 v107 = 2048;
                id v108 = v29;
                _os_log_debug_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEBUG, "Photo trait was found from time context list:traitName=%@, rankFromList=%lu", buf, 0x16u);
              }
            }
            uint64_t v34 = [v10 name];
            long long v35 = [v34 lowercaseString];
            unsigned int v36 = [&off_1002F8E70 containsObject:v35];

            if (v36)
            {
              long long v37 = [v10 name];
              long long v38 = [v37 lowercaseString];
              id v39 = [&off_1002F8E70 indexOfObject:v38];

              v40 = +[NSNumber numberWithUnsignedInteger:v39];
              __int16 v41 = [v10 name];
              uint64_t v42 = [v41 lowercaseString];
              [v96 setObject:v40 forKey:v42];

              v43 = _mo_log_facility_get_os_log(&MOLogFacilityPatternEmbedding);
              if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
              {
                v66 = [v10 name];
                *(_DWORD *)buf = 138412546;
                v106 = v66;
                __int16 v107 = 2048;
                id v108 = v39;
                _os_log_debug_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEBUG, "Photo trait was found from place type list:traitName=%@, rankFromList=%lu", buf, 0x16u);
              }
            }
            v44 = [v10 name];
            v45 = [v44 lowercaseString];
            unsigned int v46 = [&off_1002F8EA0 containsObject:v45];

            if (v46)
            {
              v47 = [v10 name];
              v48 = [v47 lowercaseString];
              id v49 = [&off_1002F8EA0 indexOfObject:v48];

              v50 = +[NSNumber numberWithUnsignedInteger:v49];
              v51 = [v10 name];
              v52 = [v51 lowercaseString];
              [v97 setObject:v50 forKey:v52];

              v53 = _mo_log_facility_get_os_log(&MOLogFacilityPatternEmbedding);
              if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
              {
                v67 = [v10 name];
                *(_DWORD *)buf = 138412546;
                v106 = v67;
                __int16 v107 = 2048;
                id v108 = v49;
                _os_log_debug_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEBUG, "Photo trait was found from social event list:traitName=%@, rankFromList=%lu", buf, 0x16u);
              }
            }
            v54 = [v10 name];
            v55 = [v54 lowercaseString];
            unsigned int v56 = [&__NSArray0__struct containsObject:v55];

            if (v56)
            {
              v57 = [v10 name];
              v58 = [v57 lowercaseString];
              id v59 = [&__NSArray0__struct indexOfObject:v58];

              v60 = +[NSNumber numberWithUnsignedInteger:v59];
              v61 = [v10 name];
              v62 = [v61 lowercaseString];
              [v95 setObject:v60 forKey:v62];

              v63 = _mo_log_facility_get_os_log(&MOLogFacilityPatternEmbedding);
              if (os_log_type_enabled(v63, OS_LOG_TYPE_DEBUG))
              {
                v68 = [v10 name];
                *(_DWORD *)buf = 138412546;
                v106 = v68;
                __int16 v107 = 2048;
                id v108 = v59;
                _os_log_debug_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_DEBUG, "Photo trait was found from other subject list:traitName=%@, rankFromList=%lu", buf, 0x16u);
              }
            }
          }
        }
        id v7 = [obj countByEnumeratingWithState:&v101 objects:v111 count:16];
      }
      while (v7);
    }

    if ([v99 count])
    {
      v69 = [v99 keysSortedByValueUsingComparator:&__block_literal_global_30];
      v70 = _mo_log_facility_get_os_log(&MOLogFacilityPatternEmbedding);
      if (os_log_type_enabled(v70, OS_LOG_TYPE_DEBUG)) {
        -[MOEmbedding extractContextsFromPhotoTraits:].cold.5();
      }

      v71 = [(MOEmbedding *)v94 activityContextEmbedding];
      id v72 = [v71 mutableCopy];

      v73 = [v69 objectAtIndex:0];
      [v72 setObject:v73 forKeyedSubscript:@"activityTypeFromPhotoTraits"];

      [(MOEmbedding *)v94 setActivityContextEmbedding:v72];
    }
    if ([v98 count])
    {
      v74 = [v98 keysSortedByValueUsingComparator:&__block_literal_global_123];
      v75 = _mo_log_facility_get_os_log(&MOLogFacilityPatternEmbedding);
      if (os_log_type_enabled(v75, OS_LOG_TYPE_DEBUG)) {
        -[MOEmbedding extractContextsFromPhotoTraits:].cold.4();
      }

      v76 = [(MOEmbedding *)v94 timeContextEmbedding];
      id v77 = [v76 mutableCopy];

      v78 = [v74 objectAtIndex:0];
      [v77 setObject:v78 forKeyedSubscript:@"timeContextFromPhotoTraits"];

      [(MOEmbedding *)v94 setTimeContextEmbedding:v77];
    }
    if ([v96 count])
    {
      v79 = [v96 keysSortedByValueUsingComparator:&__block_literal_global_126_0];
      v80 = _mo_log_facility_get_os_log(&MOLogFacilityPatternEmbedding);
      if (os_log_type_enabled(v80, OS_LOG_TYPE_DEBUG)) {
        -[MOEmbedding extractContextsFromPhotoTraits:]();
      }

      v81 = [(MOEmbedding *)v94 locationContextEmbedding];
      id v82 = [v81 mutableCopy];

      v83 = [v79 objectAtIndex:0];
      [v96 setObject:v83 forKeyedSubscript:@"placeTypeFromPhotoTraits"];

      [(MOEmbedding *)v94 setLocationContextEmbedding:v82];
    }
    if ([v97 count])
    {
      v84 = [v97 keysSortedByValueUsingComparator:&__block_literal_global_129_0];
      v85 = _mo_log_facility_get_os_log(&MOLogFacilityPatternEmbedding);
      if (os_log_type_enabled(v85, OS_LOG_TYPE_DEBUG)) {
        -[MOEmbedding extractContextsFromPhotoTraits:]();
      }

      v86 = [(MOEmbedding *)v94 socialContextEmbedding];
      id v87 = [v86 mutableCopy];

      v88 = [v84 objectAtIndex:0];
      [v87 setObject:v88 forKeyedSubscript:@"socialEventFromPhotoTraits"];

      [(MOEmbedding *)v94 setSocialContextEmbedding:v87];
    }
    if ([v95 count])
    {
      v89 = [v95 keysSortedByValueUsingComparator:&__block_literal_global_132_0];
      v90 = _mo_log_facility_get_os_log(&MOLogFacilityPatternEmbedding);
      if (os_log_type_enabled(v90, OS_LOG_TYPE_DEBUG)) {
        -[MOEmbedding extractContextsFromPhotoTraits:]();
      }

      v91 = [(MOEmbedding *)v94 extraContextEmbedding];
      id v92 = [v91 mutableCopy];

      v93 = [v89 objectAtIndex:0];
      [v92 setObject:v93 forKeyedSubscript:@"otherSubjectFromPhotoTraits"];

      [(MOEmbedding *)v94 setExtraContextEmbedding:v92];
    }
  }
}

int64_t __46__MOEmbedding_extractContextsFromPhotoTraits___block_invoke(id a1, id a2, id a3)
{
  return (int64_t)[a2 compare:a3];
}

int64_t __46__MOEmbedding_extractContextsFromPhotoTraits___block_invoke_121(id a1, id a2, id a3)
{
  return (int64_t)[a2 compare:a3];
}

int64_t __46__MOEmbedding_extractContextsFromPhotoTraits___block_invoke_124(id a1, id a2, id a3)
{
  return (int64_t)[a2 compare:a3];
}

int64_t __46__MOEmbedding_extractContextsFromPhotoTraits___block_invoke_127(id a1, id a2, id a3)
{
  return (int64_t)[a2 compare:a3];
}

int64_t __46__MOEmbedding_extractContextsFromPhotoTraits___block_invoke_130(id a1, id a2, id a3)
{
  return (int64_t)[a2 compare:a3];
}

- (double)getDistanceFrom:(id)a3 withWeights:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = _mo_log_facility_get_os_log(&MOLogFacilityPatternEmbedding);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[MOEmbedding getDistanceFrom:withWeights:](self, v7);
  }

  id v10 = [(MOEmbedding *)self bundleIdentifier];
  double v11 = [v7 bundleIdentifier];
  if ([v10 isEqual:v11])
  {

    goto LABEL_6;
  }
  id v12 = [(MOEmbedding *)self suggestionID];
  id v13 = [v7 suggestionID];
  unsigned int v14 = [v12 isEqual:v13];

  if (v14)
  {
LABEL_6:
    uint64_t v15 = _mo_log_facility_get_os_log(&MOLogFacilityPatternEmbedding);
    double v16 = 0.0;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      -[MOEmbedding getDistanceFrom:withWeights:]();
    }
    goto LABEL_26;
  }
  SEL v51 = a2;
  [(MOEmbedding *)self getActivityContextDistanceFrom:v7 withWeights:v8];
  double v18 = v17;
  [(MOEmbedding *)self getTimeContextDistanceFrom:v7 withWeights:v8];
  double v20 = v19;
  [(MOEmbedding *)self getLocationContextDistanceFrom:v7 withWeights:v8];
  double v22 = v21;
  [(MOEmbedding *)self getSocialContextDistanceFrom:v7 withWeights:v8];
  double v53 = v23;
  [(MOEmbedding *)self getExtraContextDistanceFrom:v7 withWeights:v8];
  double v52 = v24;
  uint64_t v25 = [v8 objectForKeyedSubscript:@"embeddingDistWeight_activityContext"];
  if (!v25)
  {
    double v28 = 0.2;
    goto LABEL_15;
  }
  unsigned int v26 = (void *)v25;
  uint64_t v27 = [v8 objectForKeyedSubscript:@"embeddingDistWeight_timeContext"];
  double v28 = 0.2;
  if (!v27)
  {
LABEL_18:
    double v39 = 0.2;
    double v42 = 0.2;
    double v45 = 0.2;
    double v47 = 0.2;
    goto LABEL_19;
  }
  id v29 = (void *)v27;
  uint64_t v30 = [v8 objectForKeyedSubscript:@"embeddingDistWeight_locationContext"];
  if (!v30)
  {
LABEL_17:

    goto LABEL_18;
  }
  uint64_t v31 = (void *)v30;
  uint64_t v32 = [v8 objectForKeyedSubscript:];
  if (!v32)
  {

    goto LABEL_17;
  }
  uint64_t v33 = (void *)v32;
  uint64_t v34 = [v8 objectForKeyedSubscript:];

  if (v34)
  {
    long long v35 = [v8 objectForKeyedSubscript:@"embeddingDistWeight_activityContext"];
    [v35 doubleValue];
    double v28 = v36;

    long long v37 = [v8 objectForKeyedSubscript:@"embeddingDistWeight_timeContext"];
    [v37 doubleValue];
    double v39 = v38;

    v40 = [v8 objectForKeyedSubscript:@"embeddingDistWeight_locationContext"];
    [v40 doubleValue];
    double v42 = v41;

    v43 = [v8 objectForKeyedSubscript:@"embeddingDistWeight_socialContext"];
    [v43 doubleValue];
    double v45 = v44;

    unsigned int v26 = [v8 objectForKeyedSubscript:@"embeddingDistWeight_extraContext"];
    [v26 doubleValue];
    double v47 = v46;
LABEL_19:

    goto LABEL_20;
  }
  double v28 = 0.2;
LABEL_15:
  double v39 = 0.2;
  double v42 = 0.2;
  double v45 = 0.2;
  double v47 = 0.2;
LABEL_20:
  if (fabs(v28 + v39 + v42 + v45 + v47 + -1.0) >= 0.00001)
  {
    v48 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
      -[MOEmbedding getDistanceFrom:withWeights:]();
    }

    id v49 = +[NSAssertionHandler currentHandler];
    [v49 handleFailureInMethod:v51, self, @"MOEmbedding.m", 360, @"Sum of full distance weight is not 1, sum=%.3f (in %s:%d)", v28 + v39 + v42 + v45 + v47, "-[MOEmbedding getDistanceFrom:withWeights:]", 360 object file lineNumber description];
  }
  double v16 = v20 * v39 + v28 * v18 + v42 * v22 + v45 * v53 + v47 * v52;
  uint64_t v15 = _mo_log_facility_get_os_log(&MOLogFacilityPatternEmbedding);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134219264;
    double v55 = v16;
    __int16 v56 = 2048;
    double v57 = v18;
    __int16 v58 = 2048;
    double v59 = v20;
    __int16 v60 = 2048;
    double v61 = v22;
    __int16 v62 = 2048;
    double v63 = v53;
    __int16 v64 = 2048;
    double v65 = v52;
    _os_log_debug_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "Full distance=%.3f (activity=%.3f,time=%.3f,location=%.3f,social=%.3f, extra=%.3f)", buf, 0x3Eu);
  }
LABEL_26:

  return v16;
}

- (double)getActivityContextDistanceFrom:(id)a3 withWeights:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(MOEmbedding *)self activityContextEmbedding];
  uint64_t v9 = [v7 activityContextEmbedding];

  uint64_t v10 = [v8 objectForKeyedSubscript:@"topLevelActivityType"];
  double v11 = 1.0;
  double v12 = 1.0;
  if (v10)
  {
    id v13 = (void *)v10;
    unsigned int v14 = [v9 objectForKeyedSubscript:@"topLevelActivityType"];

    if (v14)
    {
      uint64_t v15 = [v8 objectForKeyedSubscript:@"topLevelActivityType"];
      double v16 = [v9 objectForKeyedSubscript:@"topLevelActivityType"];
      if ([v15 isEqualToString:v16]) {
        double v12 = 0.0;
      }
      else {
        double v12 = 1.0;
      }
    }
  }
  uint64_t v17 = [v8 objectForKeyedSubscript:@"secondLevelActivityType"];
  if (v17)
  {
    double v18 = (void *)v17;
    double v19 = [v9 objectForKeyedSubscript:@"secondLevelActivityType"];

    if (v19)
    {
      double v20 = [v8 objectForKeyedSubscript:@"secondLevelActivityType"];
      double v21 = [v9 objectForKeyedSubscript:@"secondLevelActivityType"];
      if ([v20 isEqualToString:v21]) {
        double v11 = 0.0;
      }
      else {
        double v11 = 1.0;
      }
    }
  }
  uint64_t v22 = [v8 objectForKeyedSubscript:@"activityTypeFromPhotoTraits"];
  double v23 = 1.0;
  if (v22)
  {
    double v24 = (void *)v22;
    uint64_t v25 = [v9 objectForKeyedSubscript:@"activityTypeFromPhotoTraits"];

    if (v25)
    {
      unsigned int v26 = [v8 objectForKeyedSubscript:@"activityTypeFromPhotoTraits"];
      uint64_t v27 = [v9 objectForKeyedSubscript:@"activityTypeFromPhotoTraits"];
      if ([v26 isEqualToString:v27]) {
        double v23 = 0.0;
      }
      else {
        double v23 = 1.0;
      }
    }
  }
  uint64_t v28 = [v6 objectForKeyedSubscript:@"embeddingDistWeight_topLevelActivityType"];
  if (!v28)
  {
    double v35 = 0.333333343;
    double v38 = 0.333333343;
    double v40 = 0.333333343;
    goto LABEL_27;
  }
  id v29 = (void *)v28;
  double v46 = self;
  uint64_t v30 = [v6 objectForKeyedSubscript:@"embeddingDistWeight_secondLevelActivityType"];
  if (!v30)
  {
    double v35 = 0.333333343;
    double v38 = 0.333333343;
    double v40 = 0.333333343;
    goto LABEL_25;
  }
  uint64_t v31 = (void *)v30;
  uint64_t v32 = [v6 objectForKeyedSubscript:@"embeddingDistWeight_activityTypeFromPhotoTraits"];

  if (v32)
  {
    uint64_t v33 = [v6 objectForKeyedSubscript:@"embeddingDistWeight_topLevelActivityType"];
    [v33 doubleValue];
    double v35 = v34;

    double v36 = [v6 objectForKeyedSubscript:@"embeddingDistWeight_secondLevelActivityType"];
    [v36 doubleValue];
    double v38 = v37;

    id v29 = [v6 objectForKeyedSubscript:@"embeddingDistWeight_activityTypeFromPhotoTraits"];
    [v29 doubleValue];
    double v40 = v39;
LABEL_25:
    self = v46;

    goto LABEL_27;
  }
  double v35 = 0.333333343;
  double v38 = 0.333333343;
  double v40 = 0.333333343;
  self = v46;
LABEL_27:
  if (fabs(v35 + v38 + v40 + -1.0) >= 0.00001)
  {
    double v41 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
      -[MOEmbedding getActivityContextDistanceFrom:withWeights:]();
    }

    double v42 = +[NSAssertionHandler currentHandler];
    [v42 handleFailureInMethod:a2, self, @"MOEmbedding.m", 396, @"Sum of activity context distance weight is not 1, sum=%.3f (in %s:%d)", v35 + v38 + v40, "-[MOEmbedding getActivityContextDistanceFrom:withWeights:]", 396 object file lineNumber description];
  }
  double v43 = v11 * v38 + v35 * v12 + v40 * v23;
  double v44 = _mo_log_facility_get_os_log(&MOLogFacilityPatternEmbedding);
  if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218752;
    double v49 = v43;
    __int16 v50 = 2048;
    double v51 = v12;
    __int16 v52 = 2048;
    double v53 = v11;
    __int16 v54 = 2048;
    double v55 = v23;
    _os_log_debug_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEBUG, "Activity context distance=%.3f (topLevelActivityTypeDist=%.3f,secondLevelActivityTypeDist=%.3f,activityFromPhotoTraits=%.3f)", buf, 0x2Au);
  }

  return v43;
}

- (double)getTimeContextDistanceFrom:(id)a3 withWeights:(id)a4
{
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = [(MOEmbedding *)self timeContextEmbedding];
  uint64_t v10 = [v8 timeContextEmbedding];

  unint64_t embeddingType = self->_embeddingType;
  if (embeddingType == 2)
  {
    v80 = _mo_log_facility_get_os_log(&MOLogFacilityPatternEmbedding);
    double v12 = 0.0;
    if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR)) {
      -[MOEmbedding getTimeContextDistanceFrom:withWeights:]();
    }
    goto LABEL_41;
  }
  double v12 = 0.0;
  if (embeddingType == 1)
  {
    id v13 = [v10 objectForKeyedSubscript:@"normalizedDuration"];
    [v13 doubleValue];
    double v93 = v14;
    uint64_t v15 = [v9 objectForKeyedSubscript:@"normalizedDuration"];
    [v15 doubleValue];
    double v92 = v16;

    uint64_t v17 = [v9 objectForKeyedSubscript:@"timeOfDayCos"];
    [v17 doubleValue];
    double v19 = v18;
    double v20 = [v10 objectForKeyedSubscript:@"timeOfDayCos"];
    [v20 doubleValue];
    double v22 = v21;
    double v23 = [v9 objectForKeyedSubscript:@"timeOfDaySin"];
    [v23 doubleValue];
    double v25 = v24;
    unsigned int v26 = [v10 objectForKeyedSubscript:@"timeOfDaySin"];
    [v26 doubleValue];
    double v28 = v25 * v27 + v19 * v22;

    long double v29 = 1.0;
    long double v30 = 1.0;
    if (v28 <= 1.0)
    {
      long double v30 = v28;
      if (v28 < -1.0) {
        long double v30 = -1.0;
      }
    }
    double v31 = acos(v30);
    uint64_t v32 = [v9 objectForKeyedSubscript:@"dayOfWeekCos"];
    [v32 doubleValue];
    double v34 = v33;
    double v35 = [v10 objectForKeyedSubscript:@"dayOfWeekCos"];
    [v35 doubleValue];
    double v37 = v36;
    double v38 = [v9 objectForKeyedSubscript:@"dayOfWeekSin"];
    [v38 doubleValue];
    double v40 = v39;
    double v41 = [v10 objectForKeyedSubscript:@"dayOfWeekSin"];
    [v41 doubleValue];
    double v43 = v40 * v42 + v34 * v37;

    if (v43 <= 1.0)
    {
      long double v29 = v43;
      if (v43 < -1.0) {
        long double v29 = -1.0;
      }
    }
    double v89 = acos(v29);
    uint64_t v44 = [v9 objectForKeyedSubscript:@"isWeekend"];
    double v45 = 1.0;
    double v46 = 1.0;
    if (v44)
    {
      double v47 = (void *)v44;
      v48 = [v10 objectForKeyedSubscript:@"isWeekend"];

      if (v48)
      {
        double v49 = [v9 objectForKeyedSubscript:@"isWeekend"];
        unsigned int v50 = [v49 BOOLValue];
        double v51 = [v10 objectForKeyedSubscript:@"isWeekend"];
        if (v50 != [v51 BOOLValue]) {
          double v46 = 1.0;
        }
        else {
          double v46 = 0.0;
        }
      }
    }
    uint64_t v52 = [v9 objectForKeyedSubscript:@"timeContextFromPhotoTraits"];
    if (v52)
    {
      double v53 = (void *)v52;
      __int16 v54 = [v10 objectForKeyedSubscript:@"timeContextFromPhotoTraits"];

      if (v54)
      {
        double v55 = [v9 objectForKeyedSubscript:@"timeContextFromPhotoTraits"];
        __int16 v56 = [v10 objectForKeyedSubscript:@"timeContextFromPhotoTraits"];
        if ([v55 isEqualToString:v56]) {
          double v45 = 0.0;
        }
        else {
          double v45 = 1.0;
        }
      }
    }
    double v90 = v46;
    double v91 = v45;
    uint64_t v57 = [v7 objectForKeyedSubscript:@"embeddingDistWeight_normalizedDuration"];
    if (!v57)
    {
      double v60 = 0.2;
      double v81 = 0.2;
      double v74 = 0.2;
      double v77 = 0.2;
      double v79 = 0.2;
LABEL_35:
      double v82 = vabdd_f64(v93, v92);
      double v83 = v60 + v81 + v74 + v77 + v79;
      if (fabs(v83 + -1.0) >= 0.00001)
      {
        double v94 = v81;
        v84 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
        if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR)) {
          -[MOEmbedding getTimeContextDistanceFrom:withWeights:]();
        }

        v85 = +[NSAssertionHandler currentHandler];
        [v85 handleFailureInMethod:a2, self, @"MOEmbedding.m", 460, @"Sum of time context distance weight is not 1, sum=%.3f (in %s:%d)", *(void *)&v83, "-[MOEmbedding getTimeContextDistanceFrom:withWeights:]", 460 object file lineNumber description];

        double v81 = v94;
      }
      double v12 = v31 / 3.14159265 * v81 + v60 * v82 + v74 * (v89 / 3.14159265) + v77 * v90 + v79 * v91;
      v80 = _mo_log_facility_get_os_log(&MOLogFacilityPatternEmbedding);
      if (os_log_type_enabled(v80, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134219264;
        double v96 = v12;
        __int16 v97 = 2048;
        double v98 = v82;
        __int16 v99 = 2048;
        double v100 = v31 / 3.14159265;
        __int16 v101 = 2048;
        double v102 = v89 / 3.14159265;
        __int16 v103 = 2048;
        double v104 = v90;
        __int16 v105 = 2048;
        double v106 = v91;
        _os_log_debug_impl((void *)&_mh_execute_header, v80, OS_LOG_TYPE_DEBUG, "Time context distance=%.3f (durationNormDist=%.3f,timeOfDayDist=%.3f,dayOfWeekDist=%.3f,isWeekendDist=%.3f, timeContextFromPhotoTraits=%.3f)", buf, 0x3Eu);
      }
LABEL_41:

      goto LABEL_42;
    }
    __int16 v58 = (void *)v57;
    uint64_t v59 = [v7 objectForKeyedSubscript:@"embeddingDistWeight_timeOfDay"];
    double v60 = 0.2;
    if (v59)
    {
      double v61 = (void *)v59;
      uint64_t v62 = [v7 objectForKeyedSubscript:];
      if (v62)
      {
        double v63 = (void *)v62;
        v88 = a2;
        uint64_t v64 = [v7 objectForKeyedSubscript:];
        if (v64)
        {
          double v65 = (void *)v64;
          [v7 objectForKeyedSubscript:];
          v66 = id v87 = v7;

          if (!v66)
          {
            double v60 = 0.2;
            double v81 = 0.2;
            double v74 = 0.2;
            double v77 = 0.2;
            double v79 = 0.2;
            a2 = v88;
            id v7 = v87;
            goto LABEL_35;
          }
          id v7 = v87;
          v67 = [v87 objectForKeyedSubscript:@"embeddingDistWeight_normalizedDuration"];
          [v67 doubleValue];
          double v60 = v68;

          v69 = [v87 objectForKeyedSubscript:@"embeddingDistWeight_timeOfDay"];
          [v69 doubleValue];
          uint64_t v71 = v70;

          id v72 = [v87 objectForKeyedSubscript:@"embeddingDistWeight_dayOfWeek"];
          [v72 doubleValue];
          double v74 = v73;

          v75 = [v87 objectForKeyedSubscript:@"embeddingDistWeight_isWeekend"];
          [v75 doubleValue];
          double v77 = v76;

          __int16 v58 = [v87 objectForKeyedSubscript:@"embeddingDistWeight_timeContextFromPhotoTrait"];
          [v58 doubleValue];
          double v79 = v78;
        }
        else
        {

          *(double *)&uint64_t v71 = 0.2;
          double v74 = 0.2;
          double v77 = 0.2;
          double v79 = 0.2;
        }
        a2 = v88;
        goto LABEL_34;
      }
    }
    *(double *)&uint64_t v71 = 0.2;
    double v74 = 0.2;
    double v77 = 0.2;
    double v79 = 0.2;
LABEL_34:

    double v81 = *(double *)&v71;
    goto LABEL_35;
  }
LABEL_42:

  return v12;
}

- (double)getLocationContextDistanceFrom:(id)a3 withWeights:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  double v74 = self;
  id v8 = [(MOEmbedding *)self locationContextEmbedding];
  uint64_t v9 = [v7 locationContextEmbedding];

  uint64_t v10 = [v8 objectForKeyedSubscript:@"placeName"];
  double v11 = 1.0;
  double v12 = 1.0;
  if (v10)
  {
    id v13 = (void *)v10;
    double v14 = [v9 objectForKeyedSubscript:@"placeName"];

    if (v14)
    {
      uint64_t v15 = [v8 objectForKeyedSubscript:@"placeName"];
      double v16 = [v9 objectForKeyedSubscript:@"placeName"];
      if ([v15 isEqualToString:v16]) {
        double v12 = 0.0;
      }
      else {
        double v12 = 1.0;
      }
    }
  }
  uint64_t v17 = [v8 objectForKeyedSubscript:@"combinedPlaceType"];
  if (v17)
  {
    double v18 = (void *)v17;
    double v19 = [v9 objectForKeyedSubscript:@"combinedPlaceType"];

    if (v19)
    {
      double v20 = [v8 objectForKeyedSubscript:@"combinedPlaceType"];
      double v21 = [v9 objectForKeyedSubscript:@"combinedPlaceType"];
      if ([v20 isEqualToString:v21]) {
        double v11 = 0.0;
      }
      else {
        double v11 = 1.0;
      }
    }
  }
  uint64_t v22 = [v8 objectForKeyedSubscript:@"placeTypeFromPhotoTraits"];
  double v23 = 1.0;
  double v24 = 1.0;
  if (v22)
  {
    double v25 = (void *)v22;
    unsigned int v26 = [v9 objectForKeyedSubscript:@"placeTypeFromPhotoTraits"];

    if (v26)
    {
      double v27 = [v8 objectForKeyedSubscript:@"placeTypeFromPhotoTraits"];
      double v28 = [v9 objectForKeyedSubscript:@"placeTypeFromPhotoTraits"];
      if ([v27 isEqualToString:v28]) {
        double v24 = 0.0;
      }
      else {
        double v24 = 1.0;
      }
    }
  }
  uint64_t v29 = [v8 objectForKeyedSubscript:@"placeLatitude"];
  double v75 = v12;
  if (v29)
  {
    long double v30 = (void *)v29;
    uint64_t v31 = [v8 objectForKeyedSubscript:@"placeLongitude"];
    if (v31)
    {
      uint64_t v32 = (void *)v31;
      uint64_t v33 = [v9 objectForKeyedSubscript:@"placeLatitude"];
      if (v33)
      {
        double v34 = (void *)v33;
        double v35 = [v9 objectForKeyedSubscript:@"placeLongitude"];

        if (v35)
        {
          double v36 = [v8 objectForKeyedSubscript:@"placeLatitude"];
          [v36 doubleValue];
          double v38 = v37;

          double v39 = [v8 objectForKeyedSubscript:@"placeLongitude"];
          [v39 doubleValue];
          double v41 = v40;

          double v42 = [v9 objectForKeyedSubscript:@"placeLatitude"];
          [v42 doubleValue];
          double v44 = v43;

          double v45 = [v9 objectForKeyedSubscript:@"placeLongitude"];
          [v45 doubleValue];
          double v47 = v46;

          +[RTLocation distanceFromlat1:v38 lon1:v41 tolat2:v44 lon2:v47];
          double v49 = v48 * 0.00062137;
          if (v49 >= 200.0) {
            double v23 = 1.0;
          }
          else {
            double v23 = v49 / 200.0;
          }
        }
        goto LABEL_28;
      }
    }
  }
LABEL_28:
  uint64_t v50 = [v6 objectForKeyedSubscript:@"embeddingDistWeight_placeName"];
  if (!v50)
  {
    double v53 = 0.25;
    goto LABEL_34;
  }
  double v51 = (void *)v50;
  uint64_t v52 = [v6 objectForKeyedSubscript:@"embeddingDistWeight_placeType"];
  double v53 = 0.25;
  if (!v52)
  {
LABEL_36:
    double v62 = 0.25;
    double v65 = 0.25;
    double v67 = 0.25;
    goto LABEL_37;
  }
  __int16 v54 = (void *)v52;
  uint64_t v55 = [v6 objectForKeyedSubscript:@"embeddingDistWeight_geoProximity"];
  if (!v55)
  {

    goto LABEL_36;
  }
  __int16 v56 = (void *)v55;
  uint64_t v57 = [v6 objectForKeyedSubscript:];

  if (!v57)
  {
LABEL_34:
    double v62 = 0.25;
    double v65 = 0.25;
    double v67 = 0.25;
    goto LABEL_38;
  }
  __int16 v58 = [v6 objectForKeyedSubscript:@"embeddingDistWeight_placeName"];
  [v58 doubleValue];
  double v53 = v59;

  double v60 = [v6 objectForKeyedSubscript:@"embeddingDistWeight_placeType"];
  [v60 doubleValue];
  double v62 = v61;

  double v63 = [v6 objectForKeyedSubscript:@"embeddingDistWeight_geoProximity"];
  [v63 doubleValue];
  double v65 = v64;

  double v51 = [v6 objectForKeyedSubscript:@"embeddingDistWeight_placeTypeFromPhotoTraits"];
  [v51 doubleValue];
  double v67 = v66;
LABEL_37:

LABEL_38:
  if (fabs(v53 + v62 + v65 + v67 + -1.0) >= 0.00001)
  {
    double v68 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR)) {
      -[MOEmbedding getLocationContextDistanceFrom:withWeights:]();
    }

    v69 = +[NSAssertionHandler currentHandler];
    [v69 handleFailureInMethod:a2, v74, @"MOEmbedding.m", 512, @"Sum of location context distance weight is not 1, sum=%.3f (in %s:%d)", v53 + v62 + v65 + v67, "-[MOEmbedding getLocationContextDistanceFrom:withWeights:]", 512 object file lineNumber description];
  }
  double v70 = v11 * v62 + v53 * v75 + v65 * v23 + v67 * v24;
  uint64_t v71 = _mo_log_facility_get_os_log(&MOLogFacilityPatternEmbedding);
  if (os_log_type_enabled(v71, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134219008;
    double v77 = v70;
    __int16 v78 = 2048;
    double v79 = v75;
    __int16 v80 = 2048;
    double v81 = v11;
    __int16 v82 = 2048;
    double v83 = v23;
    __int16 v84 = 2048;
    double v85 = v24;
    _os_log_debug_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_DEBUG, "Location context distance=%.3f (placeNameDist=%.3f,combinedPlaceTypeDist=%.3f,geoProxDist=%.3f,placeTypeFromPhotoTraits=%.3f)", buf, 0x34u);
  }

  return v70;
}

- (double)getSocialContextDistanceFrom:(id)a3 withWeights:(id)a4
{
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = [(MOEmbedding *)self socialContextEmbedding];
  uint64_t v10 = [v8 socialContextEmbedding];

  uint64_t v11 = [v9 objectForKeyedSubscript:@"persons"];
  double v12 = 1.0;
  double v13 = 1.0;
  if (v11)
  {
    double v14 = (void *)v11;
    uint64_t v15 = [v10 objectForKeyedSubscript:@"persons"];

    if (v15)
    {
      double v16 = [v10 objectForKeyedSubscript:@"persons"];
      uint64_t v17 = [v16 valueForKey:@"name"];

      double v18 = [v10 objectForKeyedSubscript:@"persons"];
      double v19 = [v18 valueForKey:@"name"];

      if ([v17 count] && objc_msgSend(v19, "count"))
      {
        id v20 = [v17 mutableCopy];
        id v21 = [v17 mutableCopy];
        [v20 intersectSet:v19];
        [v21 unionSet:v19];
        double v22 = (double)(unint64_t)[v20 count];
        double v13 = 1.0 - v22 / (double)(unint64_t)[v21 count];
      }
    }
  }
  uint64_t v23 = [v9 objectForKeyedSubscript:@"withContact"];
  if (v23)
  {
    double v24 = (void *)v23;
    double v25 = [v10 objectForKeyedSubscript:@"withContact"];

    if (v25)
    {
      unsigned int v26 = [v9 objectForKeyedSubscript:@"withContact"];
      unsigned int v27 = [v26 BOOLValue];
      double v28 = [v10 objectForKeyedSubscript:@"withContact"];
      if (v27 != [v28 BOOLValue]) {
        double v12 = 1.0;
      }
      else {
        double v12 = 0.0;
      }
    }
  }
  uint64_t v29 = [v9 objectForKeyedSubscript:@"withFamily"];
  double v30 = 1.0;
  double v31 = 1.0;
  if (v29)
  {
    uint64_t v32 = (void *)v29;
    uint64_t v33 = [v10 objectForKeyedSubscript:@"withFamily"];

    if (v33)
    {
      double v34 = [v9 objectForKeyedSubscript:@"withFamily"];
      unsigned int v35 = [v34 BOOLValue];
      double v36 = [v10 objectForKeyedSubscript:@"withFamily"];
      if (v35 != [v36 BOOLValue]) {
        double v31 = 1.0;
      }
      else {
        double v31 = 0.0;
      }
    }
  }
  uint64_t v37 = [v9 objectForKeyedSubscript:@"withCoworker"];
  if (v37)
  {
    double v38 = (void *)v37;
    double v39 = [v10 objectForKeyedSubscript:@"withCoworker"];

    if (v39)
    {
      double v40 = [v9 objectForKeyedSubscript:@"withCoworker"];
      unsigned int v41 = [v40 BOOLValue];
      double v42 = [v10 objectForKeyedSubscript:@"withCoworker"];
      if (v41 != [v42 BOOLValue]) {
        double v30 = 1.0;
      }
      else {
        double v30 = 0.0;
      }
    }
  }
  uint64_t v43 = [v9 objectForKeyedSubscript:@"withFriend"];
  double v44 = 1.0;
  double v45 = 1.0;
  if (v43)
  {
    double v46 = (void *)v43;
    double v47 = [v10 objectForKeyedSubscript:@"withFriend"];

    if (v47)
    {
      double v48 = [v9 objectForKeyedSubscript:@"withFriend"];
      unsigned int v49 = [v48 BOOLValue];
      uint64_t v50 = [v10 objectForKeyedSubscript:@"withFriend"];
      if (v49 != [v50 BOOLValue]) {
        double v45 = 1.0;
      }
      else {
        double v45 = 0.0;
      }
    }
  }
  double v124 = v45;
  uint64_t v51 = [v9 objectForKeyedSubscript:@"withChild"];
  if (v51)
  {
    uint64_t v52 = (void *)v51;
    double v53 = [v10 objectForKeyedSubscript:@"withChild"];

    if (v53)
    {
      __int16 v54 = [v9 objectForKeyedSubscript:@"withChild"];
      unsigned int v55 = [v54 BOOLValue];
      __int16 v56 = [v10 objectForKeyedSubscript:@"withChild"];
      if (v55 != [v56 BOOLValue]) {
        double v44 = 1.0;
      }
      else {
        double v44 = 0.0;
      }
    }
  }
  uint64_t v57 = [v9 objectForKeyedSubscript:@"withMyPet"];
  double v58 = 1.0;
  double v59 = 1.0;
  if (v57)
  {
    double v60 = (void *)v57;
    double v61 = [v10 objectForKeyedSubscript:@"withMyPet"];

    if (v61)
    {
      double v62 = [v9 objectForKeyedSubscript:@"withMyPet"];
      unsigned int v63 = [v62 BOOLValue];
      double v64 = [v10 objectForKeyedSubscript:@"withMyPet"];
      if (v63 != [v64 BOOLValue]) {
        double v59 = 1.0;
      }
      else {
        double v59 = 0.0;
      }
    }
  }
  uint64_t v65 = [v9 objectForKeyedSubscript:@"socialEventFromPhotoTraits"];
  if (v65)
  {
    double v66 = (void *)v65;
    double v67 = [v10 objectForKeyedSubscript:@"socialEventFromPhotoTraits"];

    if (v67)
    {
      double v68 = [v9 objectForKeyedSubscript:@"socialEventFromPhotoTraits"];
      v69 = [v10 objectForKeyedSubscript:@"socialEventFromPhotoTraits"];
      if ([v68 isEqualToString:v69]) {
        double v58 = 0.0;
      }
      else {
        double v58 = 1.0;
      }
    }
  }
  uint64_t v70 = [v7 objectForKeyedSubscript:@"embeddingDistWeight_contactNames"];
  double v126 = v30;
  double v127 = v12;
  double v128 = v31;
  double v129 = v13;
  double v125 = v44;
  double v122 = v59;
  double v123 = v58;
  if (!v70)
  {
    double v105 = 0.125;
    double v104 = 0.125;
    double v87 = 0.125;
    double v90 = 0.125;
    double v106 = 0.125;
    double v96 = 0.125;
    double v99 = 0.125;
    double v102 = 0.125;
    goto LABEL_66;
  }
  uint64_t v71 = (void *)v70;
  uint64_t v72 = [v7 objectForKeyedSubscript:@"embeddingDistWeight_IsWithContact"];
  double v119 = 0.125;
  if (!v72)
  {
    double v104 = 0.125;
    double v87 = 0.125;
    double v90 = 0.125;
    double v93 = 0.125;
    double v96 = 0.125;
    double v99 = 0.125;
    double v102 = 0.125;
    goto LABEL_65;
  }
  double v73 = (void *)v72;
  uint64_t v74 = [v7 objectForKeyedSubscript:@"embeddingDistWeight_isWithFamily"];
  if (!v74)
  {

    double v104 = 0.125;
    double v87 = 0.125;
    double v90 = 0.125;
    double v93 = 0.125;
    double v96 = 0.125;
    double v99 = 0.125;
    double v102 = 0.125;
    goto LABEL_65;
  }
  double v75 = (void *)v74;
  uint64_t v76 = [v7 objectForKeyedSubscript:];
  double v77 = v7;
  if (!v76)
  {

    double v104 = 0.125;
    double v87 = 0.125;
    double v90 = 0.125;
    double v93 = 0.125;
    double v96 = 0.125;
    double v99 = 0.125;
    double v102 = 0.125;
    goto LABEL_65;
  }
  __int16 v78 = (void *)v76;
  v118 = v77;
  uint64_t v79 = [v77 objectForKeyedSubscript:];
  if (!v79)
  {
LABEL_64:

    double v104 = 0.125;
    double v87 = 0.125;
    double v90 = 0.125;
    double v93 = 0.125;
    double v96 = 0.125;
    double v99 = 0.125;
    double v102 = 0.125;
    id v7 = v118;
    goto LABEL_65;
  }
  __int16 v80 = (void *)v79;
  uint64_t v81 = [v118 objectForKeyedSubscript:];
  if (!v81)
  {
LABEL_63:

    goto LABEL_64;
  }
  v117 = (void *)v81;
  uint64_t v82 = [v118 objectForKeyedSubscript:];
  if (!v82)
  {

    goto LABEL_63;
  }
  v116 = (void *)v82;
  v120 = [v118 objectForKeyedSubscript:];

  if (v120)
  {
    id v7 = v118;
    double v83 = [v118 objectForKeyedSubscript:@"embeddingDistWeight_contactNames"];
    [v83 doubleValue];
    double v119 = v84;

    double v85 = [v118 objectForKeyedSubscript:@"embeddingDistWeight_isWithFamily"];
    [v85 doubleValue];
    double v87 = v86;

    v88 = [v118 objectForKeyedSubscript:@"embeddingDistWeight_isWithCoworker"];
    [v88 doubleValue];
    double v90 = v89;

    double v91 = [v118 objectForKeyedSubscript:@"embeddingDistWeight_isWithFriend"];
    [v91 doubleValue];
    double v93 = v92;

    double v94 = [v118 objectForKeyedSubscript:@"embeddingDistWeight_isWithChild"];
    [v94 doubleValue];
    double v96 = v95;

    __int16 v97 = [v118 objectForKeyedSubscript:@"embeddingDistWeight_isWithMyPet"];
    [v97 doubleValue];
    double v99 = v98;

    double v100 = [v118 objectForKeyedSubscript:@"embeddingDistWeight_SocialEventFromPhotoTraits "];
    [v100 doubleValue];
    double v102 = v101;

    uint64_t v71 = [v118 objectForKeyedSubscript:@"embeddingDistWeight_IsWithContact"];
    [v71 doubleValue];
    double v104 = v103;
LABEL_65:

    double v105 = v119;
    double v106 = v93;
    goto LABEL_66;
  }
  double v105 = 0.125;
  double v104 = 0.125;
  double v87 = 0.125;
  double v90 = 0.125;
  double v106 = 0.125;
  double v96 = 0.125;
  double v99 = 0.125;
  double v102 = 0.125;
  id v7 = v118;
LABEL_66:
  double v107 = v87;
  double v108 = v105 + v104 + v87 + v90 + v106 + v96 + v99 + v102;
  if (fabs(v108 + -1.0) >= 0.00001)
  {
    double v121 = v106;
    v109 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    if (os_log_type_enabled(v109, OS_LOG_TYPE_ERROR)) {
      -[MOEmbedding getSocialContextDistanceFrom:withWeights:]();
    }

    uint64_t v110 = +[NSAssertionHandler currentHandler];
    [v110 handleFailureInMethod:a2, self, @"MOEmbedding.m", 583, @"Sum of social context distance weight is not 1, sum=%.3f (in %s:%d)", *(void *)&v108, "-[MOEmbedding getSocialContextDistanceFrom:withWeights:]", 583 object file lineNumber description];

    double v106 = v121;
  }
  double v111 = v127 * v104 + v105 * v129 + v107 * v128 + v90 * v126 + v106 * v124 + v96 * v125 + v99 * v122;
  v112 = _mo_log_facility_get_os_log(&MOLogFacilityPatternEmbedding);
  if (os_log_type_enabled(v112, OS_LOG_TYPE_DEBUG)) {
    -[MOEmbedding getSocialContextDistanceFrom:withWeights:]((uint64_t)v9, (uint64_t)v10, v112);
  }
  double v113 = v111 + v102 * v123;

  v114 = _mo_log_facility_get_os_log(&MOLogFacilityPatternEmbedding);
  if (os_log_type_enabled(v114, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134220032;
    double v131 = v113;
    __int16 v132 = 2048;
    double v133 = v129;
    __int16 v134 = 2048;
    double v135 = v127;
    __int16 v136 = 2048;
    double v137 = v128;
    __int16 v138 = 2048;
    double v139 = v126;
    __int16 v140 = 2048;
    double v141 = v124;
    __int16 v142 = 2048;
    double v143 = v125;
    __int16 v144 = 2048;
    double v145 = v122;
    __int16 v146 = 2048;
    double v147 = v123;
    _os_log_debug_impl((void *)&_mh_execute_header, v114, OS_LOG_TYPE_DEBUG, "Social context distance=%.3f (contactNames=%.3f,isWithContact=%.3f,isWithFamily=%.3f,isWithCoworker=%.3f,isWithFriend=%.3f,isWithChild=%.3f,isWithMyPet=%.3f,socialEventFromPhotoTraits=%.3f)", buf, 0x5Cu);
  }

  return v113;
}

- (double)getExtraContextDistanceFrom:(id)a3 withWeights:(id)a4
{
  id v5 = a3;
  id v6 = [(MOEmbedding *)self extraContextEmbedding];
  id v7 = [v5 extraContextEmbedding];

  uint64_t v8 = [v6 objectForKeyedSubscript:@"otherSubjectFromPhotoTraits"];
  double v9 = 1.0;
  if (v8)
  {
    uint64_t v10 = (void *)v8;
    uint64_t v11 = [v7 objectForKeyedSubscript:@"otherSubjectFromPhotoTraits"];

    if (v11)
    {
      double v12 = [v6 objectForKeyedSubscript:@"otherSubjectFromPhotoTraits"];
      double v13 = [v7 objectForKeyedSubscript:@"otherSubjectFromPhotoTraits"];
      if ([v12 isEqualToString:v13]) {
        double v9 = 0.0;
      }
      else {
        double v9 = 1.0;
      }
    }
  }

  return v9;
}

- (id)description
{
  id v3 = [(MOEmbedding *)self bundleIdentifier];
  id v4 = [(MOEmbedding *)self suggestionID];
  unint64_t v5 = [(MOEmbedding *)self embeddingType];
  id v6 = [(MOEmbedding *)self activityContextEmbedding];
  id v7 = [(MOEmbedding *)self timeContextEmbedding];
  uint64_t v8 = [(MOEmbedding *)self locationContextEmbedding];
  double v9 = [(MOEmbedding *)self socialContextEmbedding];
  uint64_t v10 = [(MOEmbedding *)self extraContextEmbedding];
  uint64_t v11 = +[NSString stringWithFormat:@"<MOEmbedding bundleID:%@, suggestionID:%@, embeddingType:%lu, activityContextEmbedding:%@, timeContextEmbedding:%@, locationContextEmbedding:%@, socialContextEmbedding:%@, extraContextEmbedding:%@>", v3, v4, v5, v6, v7, v8, v9, v10];

  return v11;
}

- (id)summaryDictionary
{
  id v3 = objc_opt_new();
  id v4 = [(MOEmbedding *)self bundleIdentifier];
  [v3 setObject:v4 forKeyedSubscript:@"bundleID"];

  unint64_t v5 = [(MOEmbedding *)self suggestionID];
  [v3 setObject:v5 forKeyedSubscript:@"suggestionID"];

  id v6 = [(MOEmbedding *)self activityContextEmbedding];
  [v3 addEntriesFromDictionary:v6];

  id v7 = [(MOEmbedding *)self timeContextEmbedding];
  uint64_t v8 = [v7 objectForKeyedSubscript:@"normalizedDuration"];

  if (v8)
  {
    double v9 = [(MOEmbedding *)self timeContextEmbedding];
    uint64_t v10 = [v9 objectForKeyedSubscript:@"normalizedDuration"];
    [v3 setObject:v10 forKeyedSubscript:@"normalizedDuration"];
  }
  uint64_t v11 = [(MOEmbedding *)self timeContextEmbedding];
  double v12 = [v11 objectForKeyedSubscript:@"timeTag"];

  if (v12)
  {
    double v13 = [(MOEmbedding *)self timeContextEmbedding];
    double v14 = [v13 objectForKeyedSubscript:@"timeTag"];
    [v3 setObject:v14 forKeyedSubscript:@"timeTag"];
  }
  uint64_t v15 = [(MOEmbedding *)self timeContextEmbedding];
  double v16 = [v15 objectForKeyedSubscript:@"dayOfWeek"];

  if (v16)
  {
    uint64_t v17 = [(MOEmbedding *)self timeContextEmbedding];
    double v18 = [v17 objectForKeyedSubscript:@"dayOfWeek"];
    double v19 = -[MOEmbedding dayOfWeekString:](self, "dayOfWeekString:", (int)[v18 intValue]);
    [v3 setObject:v19 forKeyedSubscript:@"dayOfWeek"];
  }
  id v20 = [(MOEmbedding *)self timeContextEmbedding];
  id v21 = [v20 objectForKeyedSubscript:@"weekOfYear"];

  if (v21)
  {
    double v22 = [(MOEmbedding *)self timeContextEmbedding];
    uint64_t v23 = [v22 objectForKeyedSubscript:@"weekOfYear"];
    [v3 setObject:v23 forKeyedSubscript:@"weekOfYear"];
  }
  double v24 = [(MOEmbedding *)self timeContextEmbedding];
  double v25 = [v24 objectForKeyedSubscript:@"isWeekend"];

  if (v25)
  {
    unsigned int v26 = [(MOEmbedding *)self timeContextEmbedding];
    unsigned int v27 = [v26 objectForKeyedSubscript:@"isWeekend"];
    [v3 setObject:v27 forKeyedSubscript:@"isWeekend"];
  }
  double v28 = [(MOEmbedding *)self timeContextEmbedding];
  uint64_t v29 = [v28 objectForKeyedSubscript:@"timeContextFromPhotoTraits"];

  if (v29)
  {
    double v30 = [(MOEmbedding *)self timeContextEmbedding];
    double v31 = [v30 objectForKeyedSubscript:@"timeContextFromPhotoTraits"];
    [v3 setObject:v31 forKeyedSubscript:@"timeContextFromPhotoTraits"];
  }
  uint64_t v32 = [(MOEmbedding *)self locationContextEmbedding];
  uint64_t v33 = [v32 objectForKeyedSubscript:@"placeName"];

  if (v33)
  {
    double v34 = [(MOEmbedding *)self locationContextEmbedding];
    unsigned int v35 = [v34 objectForKeyedSubscript:@"placeName"];
    [v3 setObject:v35 forKeyedSubscript:@"placeName"];
  }
  double v36 = [(MOEmbedding *)self locationContextEmbedding];
  uint64_t v37 = [v36 objectForKeyedSubscript:@"combinedPlaceType"];

  if (v37)
  {
    double v38 = [(MOEmbedding *)self locationContextEmbedding];
    double v39 = [v38 objectForKeyedSubscript:@"combinedPlaceType"];
    [v3 setObject:v39 forKeyedSubscript:@"combinedPlaceType"];
  }
  double v40 = [(MOEmbedding *)self locationContextEmbedding];
  unsigned int v41 = [v40 objectForKeyedSubscript:@"enclosingAreaName"];

  if (v41)
  {
    double v42 = [(MOEmbedding *)self locationContextEmbedding];
    uint64_t v43 = [v42 objectForKeyedSubscript:@"enclosingAreaName"];
    [v3 setObject:v43 forKeyedSubscript:@"enclosingAreaName"];
  }
  double v44 = [(MOEmbedding *)self locationContextEmbedding];
  double v45 = [v44 objectForKeyedSubscript:@"placeTypeFromPhotoTraits"];

  if (v45)
  {
    double v46 = [(MOEmbedding *)self locationContextEmbedding];
    double v47 = [v46 objectForKeyedSubscript:@"placeTypeFromPhotoTraits"];
    [v3 setObject:v47 forKeyedSubscript:@"placeTypeFromPhotoTraits"];
  }
  double v48 = [(MOEmbedding *)self locationContextEmbedding];
  unsigned int v49 = [v48 objectForKeyedSubscript:@"placeFamiliarityIndexLOI"];

  if (v49)
  {
    uint64_t v50 = [(MOEmbedding *)self locationContextEmbedding];
    uint64_t v51 = [v50 objectForKeyedSubscript:@"placeFamiliarityIndexLOI"];
    [v3 setObject:v51 forKeyedSubscript:@"placeFamiliarityIndexLOI"];
  }
  uint64_t v52 = [(MOEmbedding *)self socialContextEmbedding];
  double v53 = [v52 objectForKeyedSubscript:@"persons"];

  if (v53)
  {
    __int16 v54 = [(MOEmbedding *)self socialContextEmbedding];
    unsigned int v55 = [v54 objectForKeyedSubscript:@"persons"];
    [v3 setObject:v55 forKeyedSubscript:@"persons"];
  }
  __int16 v56 = [(MOEmbedding *)self socialContextEmbedding];
  uint64_t v57 = [v56 objectForKeyedSubscript:@"withFamily"];

  if (v57)
  {
    double v58 = [(MOEmbedding *)self socialContextEmbedding];
    double v59 = [v58 objectForKeyedSubscript:@"withFamily"];
    [v3 setObject:v59 forKeyedSubscript:@"withFamily"];
  }
  double v60 = [(MOEmbedding *)self socialContextEmbedding];
  double v61 = [v60 objectForKeyedSubscript:@"withCoworker"];

  if (v61)
  {
    double v62 = [(MOEmbedding *)self socialContextEmbedding];
    unsigned int v63 = [v62 objectForKeyedSubscript:@"withCoworker"];
    [v3 setObject:v63 forKeyedSubscript:@"withCoworker"];
  }
  double v64 = [(MOEmbedding *)self socialContextEmbedding];
  uint64_t v65 = [v64 objectForKeyedSubscript:@"withFriend"];

  if (v65)
  {
    double v66 = [(MOEmbedding *)self socialContextEmbedding];
    double v67 = [v66 objectForKeyedSubscript:@"withFriend"];
    [v3 setObject:v67 forKeyedSubscript:@"withFriend"];
  }
  double v68 = [(MOEmbedding *)self socialContextEmbedding];
  v69 = [v68 objectForKeyedSubscript:@"withChild"];

  if (v69)
  {
    uint64_t v70 = [(MOEmbedding *)self socialContextEmbedding];
    uint64_t v71 = [v70 objectForKeyedSubscript:@"withChild"];
    [v3 setObject:v71 forKeyedSubscript:@"withChild"];
  }
  uint64_t v72 = [(MOEmbedding *)self socialContextEmbedding];
  double v73 = [v72 objectForKeyedSubscript:@"withMyPet"];

  if (v73)
  {
    uint64_t v74 = [(MOEmbedding *)self socialContextEmbedding];
    double v75 = [v74 objectForKeyedSubscript:@"withMyPet"];
    [v3 setObject:v75 forKeyedSubscript:@"withMyPet"];
  }
  uint64_t v76 = [(MOEmbedding *)self socialContextEmbedding];
  double v77 = [v76 objectForKeyedSubscript:@"socialEventFromPhotoTraits"];

  if (v77)
  {
    __int16 v78 = [(MOEmbedding *)self socialContextEmbedding];
    uint64_t v79 = [v78 objectForKeyedSubscript:@"socialEventFromPhotoTraits"];
    [v3 setObject:v79 forKeyedSubscript:@"socialEventFromPhotoTraits"];
  }
  __int16 v80 = [(MOEmbedding *)self extraContextEmbedding];
  [v3 addEntriesFromDictionary:v80];

  return v3;
}

- (id)dayOfWeekString:(unint64_t)a3
{
  if (a3 - 1 > 6) {
    return @"undefined";
  }
  else {
    return *(&off_1002CF758 + a3 - 1);
  }
}

- (NSUUID)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (NSUUID)suggestionID
{
  return self->_suggestionID;
}

- (void)setSuggestionID:(id)a3
{
}

- (unint64_t)embeddingType
{
  return self->_embeddingType;
}

- (void)setEmbeddingType:(unint64_t)a3
{
  self->_unint64_t embeddingType = a3;
}

- (NSDictionary)activityContextEmbedding
{
  return self->_activityContextEmbedding;
}

- (void)setActivityContextEmbedding:(id)a3
{
}

- (NSDictionary)timeContextEmbedding
{
  return self->_timeContextEmbedding;
}

- (void)setTimeContextEmbedding:(id)a3
{
}

- (NSDictionary)locationContextEmbedding
{
  return self->_locationContextEmbedding;
}

- (void)setLocationContextEmbedding:(id)a3
{
}

- (NSDictionary)socialContextEmbedding
{
  return self->_socialContextEmbedding;
}

- (void)setSocialContextEmbedding:(id)a3
{
}

- (NSDictionary)extraContextEmbedding
{
  return self->_extraContextEmbedding;
}

- (void)setExtraContextEmbedding:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extraContextEmbedding, 0);
  objc_storeStrong((id *)&self->_socialContextEmbedding, 0);
  objc_storeStrong((id *)&self->_locationContextEmbedding, 0);
  objc_storeStrong((id *)&self->_timeContextEmbedding, 0);
  objc_storeStrong((id *)&self->_activityContextEmbedding, 0);
  objc_storeStrong((id *)&self->_suggestionID, 0);

  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

- (void)initWithEventBundle:forEmbeddingType:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4((void *)&_mh_execute_header, v0, v1, "Invalid parameter not satisfying: eventBundle", v2, v3, v4, v5, v6);
}

- (void)extractTimeContextEmbedding:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4((void *)&_mh_execute_header, v0, v1, "Unable to create time context embedding since embeddingType is unknown or unassigned", v2, v3, v4, v5, v6);
}

- (void)extractSocialContextEmbedding:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "socialContextEmbedding:%@", (uint8_t *)&v2, 0xCu);
}

- (void)extractContextsFromPhotoTraits:.cold.1()
{
  OUTLINED_FUNCTION_7_0();
  int v2 = [[OUTLINED_FUNCTION_5_5(v0, v1) objectAtIndex:];
  OUTLINED_FUNCTION_0_13();
  OUTLINED_FUNCTION_1_0((void *)&_mh_execute_header, v3, v4, "otherSubjectTraitsRankedDict=%@, selectedTrait=%@", v5, v6, v7, v8, v9);
}

- (void)extractContextsFromPhotoTraits:.cold.2()
{
  OUTLINED_FUNCTION_7_0();
  int v2 = [OUTLINED_FUNCTION_5_5(v0, v1) objectAtIndex:];
  OUTLINED_FUNCTION_0_13();
  OUTLINED_FUNCTION_1_0((void *)&_mh_execute_header, v3, v4, "socialEventTraitsRankedDict=%@, selectedTrait=%@", v5, v6, v7, v8, v9);
}

- (void)extractContextsFromPhotoTraits:.cold.3()
{
  OUTLINED_FUNCTION_7_0();
  int v2 = [[OUTLINED_FUNCTION_5_5(v0, v1) objectAtIndex:x0];
  OUTLINED_FUNCTION_0_13();
  OUTLINED_FUNCTION_1_0((void *)&_mh_execute_header, v3, v4, "placeTypeTraitsRankedDict=%@, selectedTrait=%@", v5, v6, v7, v8, v9);
}

- (void)extractContextsFromPhotoTraits:.cold.4()
{
  OUTLINED_FUNCTION_7_0();
  int v2 = [[OUTLINED_FUNCTION_5_5(v0, v1) objectAtIndex:0];
  OUTLINED_FUNCTION_0_13();
  OUTLINED_FUNCTION_1_0((void *)&_mh_execute_header, v3, v4, "timeContextTraitsRankedDict=%@, selectedTrait=%@", v5, v6, v7, v8, v9);
}

- (void)extractContextsFromPhotoTraits:.cold.5()
{
  OUTLINED_FUNCTION_7_0();
  int v2 = [(id)OUTLINED_FUNCTION_5_5(v0, v1) objectAtIndex:];
  OUTLINED_FUNCTION_0_13();
  OUTLINED_FUNCTION_1_0((void *)&_mh_execute_header, v3, v4, "activityTraitsRankedDict=%@, selectedTrait=%@", v5, v6, v7, v8, v9);
}

- (void)extractContextsFromPhotoTraits:(void *)a3 .cold.6(uint8_t *a1, void *a2, void *a3, NSObject *a4)
{
  uint64_t v7 = [a2 name];
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_debug_impl((void *)&_mh_execute_header, a4, OS_LOG_TYPE_DEBUG, "Current photo trait name:%@", a1, 0xCu);
}

- (void)extractContextsFromPhotoTraits:(void *)a1 .cold.7(void *a1, NSObject *a2)
{
  int v3 = 134217984;
  id v4 = [a1 count];
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Photo trait count:%lu", (uint8_t *)&v3, 0xCu);
}

- (void)getDistanceFrom:withWeights:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "Distance is 0 since input embeddings share bundleID or suggestionID", v1, 2u);
}

- (void)getDistanceFrom:withWeights:.cold.2()
{
  OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_3_3((void *)&_mh_execute_header, v0, v1, "Sum of full distance weight is not 1, sum=%.3f (in %s:%d)", v2, v3, v4, v5, v6);
}

- (void)getDistanceFrom:(void *)a1 withWeights:(void *)a2 .cold.3(void *a1, void *a2)
{
  uint64_t v3 = [a1 bundleIdentifier];
  uint64_t v10 = [a2 bundleIdentifier];
  OUTLINED_FUNCTION_1_0((void *)&_mh_execute_header, v4, v5, "Calculating distance between bundleIDs %@ and %@", v6, v7, v8, v9, 2u);
}

- (void)getActivityContextDistanceFrom:withWeights:.cold.1()
{
  OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_3_3((void *)&_mh_execute_header, v0, v1, "Sum of activity context distance weight is not 1, sum=%.3f (in %s:%d)", v2, v3, v4, v5, v6);
}

- (void)getTimeContextDistanceFrom:withWeights:.cold.1()
{
  OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_3_3((void *)&_mh_execute_header, v0, v1, "Sum of time context distance weight is not 1, sum=%.3f (in %s:%d)", v2, v3, v4, v5, v6);
}

- (void)getTimeContextDistanceFrom:withWeights:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4((void *)&_mh_execute_header, v0, v1, "Multi-year embedding is currently not supported. time embedding distance is set to default (0)", v2, v3, v4, v5, v6);
}

- (void)getLocationContextDistanceFrom:withWeights:.cold.1()
{
  OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_3_3((void *)&_mh_execute_header, v0, v1, "Sum of location context distance weight is not 1, sum=%.3f (in %s:%d)", v2, v3, v4, v5, v6);
}

- (void)getSocialContextDistanceFrom:(os_log_t)log withWeights:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "social context embeddings e1 %@, e2 %@", (uint8_t *)&v3, 0x16u);
}

- (void)getSocialContextDistanceFrom:withWeights:.cold.2()
{
  OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_3_3((void *)&_mh_execute_header, v0, v1, "Sum of social context distance weight is not 1, sum=%.3f (in %s:%d)", v2, v3, v4, v5, v6);
}

@end