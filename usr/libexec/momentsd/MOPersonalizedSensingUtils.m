@interface MOPersonalizedSensingUtils
+ (BOOL)_shouldRemoveBundle:(id)a3 checkVisibilityCategoryForUI:(BOOL)a4;
+ (id)getPersonalizedSensingAllowedBundles:(id)a3 allowVisits:(BOOL)a4;
@end

@implementation MOPersonalizedSensingUtils

+ (BOOL)_shouldRemoveBundle:(id)a3 checkVisibilityCategoryForUI:(BOOL)a4
{
  LODWORD(v4) = a4;
  id v5 = a3;
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    if ([v5 interfaceType] == (id)15
      && ([v5 bundleSubType] == (id)902 || objc_msgSend(v5, "bundleSubType") == (id)906))
    {
      v4 = _mo_log_facility_get_os_log(&MOLogFacilityPersonalizedSensing);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        v6 = [v5 bundleIdentifier];
        v7 = [v5 suggestionID];
        id v8 = [v5 bundleSubType];
        v9 = [v5 labels];
        v10 = [v9 firstObject];
        int v30 = 138413058;
        v31 = v6;
        __int16 v32 = 2112;
        v33 = v7;
        __int16 v34 = 2048;
        id v35 = v8;
        __int16 v36 = 2112;
        v37 = v10;
        v11 = "#bundlecuration, filtered cluster bundle, reason shouldAllowActivityBundles=False & activity cluster, bund"
              "leId %@, suggestionId %@, bundleSubType %lu, label, %@";
LABEL_25:
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, v11, (uint8_t *)&v30, 0x2Au);

        goto LABEL_26;
      }
      goto LABEL_27;
    }
    if ([v5 interfaceType] == (id)12 && objc_msgSend(v5, "bundleSuperType") == (id)2)
    {
      v4 = _mo_log_facility_get_os_log(&MOLogFacilityPersonalizedSensing);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        v6 = [v5 bundleIdentifier];
        v7 = [v5 suggestionID];
        id v12 = [v5 bundleSubType];
        v9 = [v5 labels];
        v10 = [v9 firstObject];
        int v30 = 138413058;
        v31 = v6;
        __int16 v32 = 2112;
        v33 = v7;
        __int16 v34 = 2048;
        id v35 = v12;
        __int16 v36 = 2112;
        v37 = v10;
        v11 = "#bundlecuration, filtered activity summary bundle, reason shouldAllowActivityBundles=False & activity bund"
              "le, bundleId %@, suggestionId %@, bundleSubType %lu, label, %@";
        goto LABEL_25;
      }
LABEL_27:

      LOBYTE(v4) = 1;
      goto LABEL_30;
    }
  }
  if ([v5 interfaceType] == (id)13)
  {
    v13 = [v5 rankingDictionary];
    v14 = [v13 objectForKeyedSubscript:@"visibilityCategoryForUI"];
    unsigned int v15 = [v14 intValue];

    if (v15 != 4)
    {
LABEL_29:
      LOBYTE(v4) = 0;
      goto LABEL_30;
    }
  }
  if ([v5 bundleSuperType] == (id)9)
  {
    v16 = [v5 clusterMetadata];
    unsigned int v17 = [v16 isFiltered];

    if (v17)
    {
      v4 = _mo_log_facility_get_os_log(&MOLogFacilityPersonalizedSensing);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        v6 = [v5 bundleIdentifier];
        v7 = [v5 suggestionID];
        id v18 = [v5 bundleSubType];
        v9 = [v5 labels];
        v10 = [v9 firstObject];
        int v30 = 138413058;
        v31 = v6;
        __int16 v32 = 2112;
        v33 = v7;
        __int16 v34 = 2048;
        id v35 = v18;
        __int16 v36 = 2112;
        v37 = v10;
        v11 = "#bundlecuration, filtered cluster bundle, reason clusterMetadata.isFiltered, bundleId %@, suggestionId %@,"
              " bundleSubType %lu, label, %@";
        goto LABEL_25;
      }
      goto LABEL_27;
    }
    v26 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v5 bundleSubType]);
    int v27 = [&off_1002F8C48 containsObject:v26];

    if ((v27 & 1) == 0)
    {
      v4 = _mo_log_facility_get_os_log(&MOLogFacilityPersonalizedSensing);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        v6 = [v5 bundleIdentifier];
        v7 = [v5 suggestionID];
        id v28 = [v5 bundleSubType];
        v9 = [v5 labels];
        v10 = [v9 firstObject];
        int v30 = 138413058;
        v31 = v6;
        __int16 v32 = 2112;
        v33 = v7;
        __int16 v34 = 2048;
        id v35 = v28;
        __int16 v36 = 2112;
        v37 = v10;
        v11 = "#bundlecuration, filtered cluster bundle, reason unsupported subtype, bundleId %@, suggestionId %@, bundle"
              "SubType %lu, label, %@";
        goto LABEL_25;
      }
      goto LABEL_27;
    }
    goto LABEL_29;
  }
  if (v4)
  {
    v19 = [v5 rankingDictionary];
    v20 = [v19 objectForKeyedSubscript:@"visibilityCategoryForUI"];
    if ([v20 intValue] == 4)
    {
      v21 = [v5 rankingDictionary];
      v22 = [v21 objectForKeyedSubscript:@"isBundleOrSubBundlesSelectedOrQuickAdded"];
      unsigned __int8 v23 = [v22 BOOLValue];

      if ((v23 & 1) == 0)
      {
        v4 = _mo_log_facility_get_os_log(&MOLogFacilityPersonalizedSensing);
        if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
        {
          v6 = [v5 bundleIdentifier];
          v7 = [v5 suggestionID];
          v24 = [v5 labels];
          v25 = [v24 firstObject];
          int v30 = 138412802;
          v31 = v6;
          __int16 v32 = 2112;
          v33 = v7;
          __int16 v34 = 2112;
          id v35 = v25;
          _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "#bundlecuration, filtered bundle, reason UIrejected, id, %@, suggestion id, %@, label, %@", (uint8_t *)&v30, 0x20u);

LABEL_26:
          goto LABEL_27;
        }
        goto LABEL_27;
      }
    }
    else
    {
    }
    goto LABEL_29;
  }
LABEL_30:

  return (char)v4;
}

+ (id)getPersonalizedSensingAllowedBundles:(id)a3 allowVisits:(BOOL)a4
{
  id v6 = a3;
  id v7 = [v6 count];
  id v8 = _mo_log_facility_get_os_log(&MOLogFacilityPersonalizedSensing);
  v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      id v37 = [v6 count];
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "total count of fetched bundles %lu", buf, 0xCu);
    }

    v10 = +[NSMutableSet setWithObjects:](NSMutableSet, "setWithObjects:", &off_1002F4340, &off_1002F4358, &off_1002F4370, &off_1002F4388, &off_1002F43A0, &off_1002F43B8, 0);
    v11 = objc_opt_new();
    id v12 = objc_opt_new();
    if (_os_feature_enabled_impl())
    {
      [v10 addObject:&off_1002F43D0];
    }
    else
    {
      v14 = +[NSPredicate predicateWithFormat:@"interfaceType == %luu AND bundleSuperType == %luu", 12, 2];
      unsigned int v15 = [v6 filteredArrayUsingPredicate:v14];
      v33[0] = _NSConcreteStackBlock;
      v33[1] = 3221225472;
      v33[2] = __79__MOPersonalizedSensingUtils_getPersonalizedSensingAllowedBundles_allowVisits___block_invoke;
      v33[3] = &unk_1002C9590;
      id v16 = v11;
      id v34 = v16;
      id v35 = v12;
      [v15 enumerateObjectsUsingBlock:v33];
      unsigned int v17 = _mo_log_facility_get_os_log(&MOLogFacilityPersonalizedSensing);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        id v18 = [v16 count];
        *(_DWORD *)buf = 134217984;
        id v37 = v18;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Activity bundle was disabled. Collecting subBundleIDs of activity summaries to recover visit subbundles. subBundleID count=%lu", buf, 0xCu);
      }

      v19 = _mo_log_facility_get_os_log(&MOLogFacilityPersonalizedSensing);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
        +[MOPersonalizedSensingUtils getPersonalizedSensingAllowedBundles:allowVisits:]();
      }

      v20 = _mo_log_facility_get_os_log(&MOLogFacilityPersonalizedSensing);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
        +[MOPersonalizedSensingUtils getPersonalizedSensingAllowedBundles:allowVisits:]();
      }
    }
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = __79__MOPersonalizedSensingUtils_getPersonalizedSensingAllowedBundles_allowVisits___block_invoke_117;
    v26[3] = &unk_1002C95B8;
    BOOL v32 = a4;
    id v27 = v10;
    id v28 = v11;
    id v29 = v12;
    id v31 = a1;
    id v21 = (id)objc_opt_new();
    id v30 = v21;
    id v22 = v12;
    id v23 = v11;
    v9 = v10;
    [v6 enumerateObjectsUsingBlock:v26];
    v24 = v30;
    id v13 = v21;
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "no bundle context is extracted due to 0 bundle fetched", buf, 2u);
    }
    id v13 = &__NSArray0__struct;
  }

  return v13;
}

void __79__MOPersonalizedSensingUtils_getPersonalizedSensingAllowedBundles_allowVisits___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v4 subBundleIDs];
  [v3 addObjectsFromArray:v5];

  id v6 = *(void **)(a1 + 40);
  id v7 = [v4 subSuggestionIDs];

  [v6 addObjectsFromArray:v7];
}

void __79__MOPersonalizedSensingUtils_getPersonalizedSensingAllowedBundles_allowVisits___block_invoke_117(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (!*(unsigned char *)(a1 + 72))
  {
    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    v11 = [v3 events];
    id v12 = [v11 countByEnumeratingWithState:&v53 objects:v69 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v54;
      while (2)
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v54 != v14) {
            objc_enumerationMutation(v11);
          }
          if ([*(id *)(*((void *)&v53 + 1) + 8 * i) category] == (id)1)
          {
            id v16 = _mo_log_facility_get_os_log(&MOLogFacilityPersonalizedSensing);
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
              __79__MOPersonalizedSensingUtils_getPersonalizedSensingAllowedBundles_allowVisits___block_invoke_117_cold_3();
            }

            goto LABEL_37;
          }
        }
        id v13 = [v11 countByEnumeratingWithState:&v53 objects:v69 count:16];
        if (v13) {
          continue;
        }
        break;
      }
    }
  }
  id v5 = *(void **)(a1 + 32);
  id v6 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v4 interfaceType]);
  LOBYTE(v5) = [v5 containsObject:v6];

  if ((v5 & 1) == 0)
  {
    v10 = _mo_log_facility_get_os_log(&MOLogFacilityPersonalizedSensing);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      __79__MOPersonalizedSensingUtils_getPersonalizedSensingAllowedBundles_allowVisits___block_invoke_117_cold_2(v4, v10);
    }
    goto LABEL_36;
  }
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    id v7 = *(void **)(a1 + 40);
    id v8 = [v4 bundleIdentifier];
    v9 = [v8 UUIDString];
    if ([v7 containsObject:v9])
    {

      goto LABEL_21;
    }
    unsigned int v17 = *(void **)(a1 + 48);
    id v18 = [v4 suggestionID];
    v19 = [v18 UUIDString];
    LODWORD(v17) = [v17 containsObject:v19];

    if (v17)
    {
LABEL_21:
      if ([v4 bundleSuperType] != (id)2)
      {
        v20 = [v4 rankingDictionary];
        id v21 = [v20 objectForKeyedSubscript:@"kRejectedByVisitHeuristicsFilter"];
        if (([v21 BOOLValue] & 1) == 0)
        {
          id v22 = [v4 rankingDictionary];
          id v23 = [v22 objectForKeyedSubscript:@"bundleGoodnessScore"];
          [v23 floatValue];
          float v25 = v24;
          v26 = [v4 rankingDictionary];
          id v27 = [v26 objectForKeyedSubscript:@"suggestionAcceptThreshold"];
          [v27 floatValue];
          if (v25 > v28)
          {
            unsigned __int8 v29 = [*(id *)(a1 + 64) _shouldRemoveBundle:v4 checkVisibilityCategoryForUI:0];

            if ((v29 & 1) == 0)
            {
              id v30 = _mo_log_facility_get_os_log(&MOLogFacilityPersonalizedSensing);
              if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
              {
                id v31 = [v4 bundleIdentifier];
                BOOL v32 = [v4 suggestionID];
                id v33 = [v4 bundleSubType];
                id v34 = [v4 rankingDictionary];
                id v35 = [v34 objectForKeyedSubscript:@"bundleGoodnessScore"];
                [v35 floatValue];
                double v37 = v36;
                v38 = [v4 rankingDictionary];
                v39 = [v38 objectForKeyedSubscript:@"suggestionAcceptThreshold"];
                [v39 floatValue];
                *(_DWORD *)buf = 138413314;
                v58 = v31;
                __int16 v59 = 2112;
                v60 = v32;
                __int16 v61 = 2048;
                id v62 = v33;
                __int16 v63 = 2048;
                double v64 = v37;
                __int16 v65 = 2048;
                double v66 = v40;
                _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "SubBundle of activity summary was recovered. bundleID %@, suggestionID %@, bundleSubType %lu, goodnessScore %.3f, acceptThreshold %.3f", buf, 0x34u);
              }
              goto LABEL_31;
            }
            goto LABEL_34;
          }
        }
      }
LABEL_34:
      v10 = _mo_log_facility_get_os_log(&MOLogFacilityPersonalizedSensing);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v41 = [v4 bundleIdentifier];
        v42 = [v4 suggestionID];
        id v52 = [v4 bundleSubType];
        v43 = [v4 rankingDictionary];
        v44 = [v43 objectForKeyedSubscript:@"kRejectedByVisitHeuristicsFilter"];
        v45 = [v4 rankingDictionary];
        v46 = [v45 objectForKeyedSubscript:@"bundleGoodnessScore"];
        [v46 floatValue];
        double v48 = v47;
        v49 = [v4 rankingDictionary];
        v50 = [v49 objectForKeyedSubscript:@"suggestionAcceptThreshold"];
        [v50 floatValue];
        *(_DWORD *)buf = 138413570;
        v58 = v41;
        __int16 v59 = 2112;
        v60 = v42;
        __int16 v61 = 2048;
        id v62 = v52;
        __int16 v63 = 2112;
        double v64 = *(double *)&v44;
        __int16 v65 = 2048;
        double v66 = v48;
        __int16 v67 = 2048;
        double v68 = v51;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "SubBundle of activity summary was suppressed. bundleID %@, suggestionID %@, bundleSubType %lu, rejectedByVisitHeuristicsFilter, %@ goodnessScore %.3f, acceptThreshold %.3f", buf, 0x3Eu);
      }
LABEL_36:

      goto LABEL_37;
    }
  }
  if ([*(id *)(a1 + 64) _shouldRemoveBundle:v4 checkVisibilityCategoryForUI:1])
  {
    v10 = _mo_log_facility_get_os_log(&MOLogFacilityPersonalizedSensing);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      __79__MOPersonalizedSensingUtils_getPersonalizedSensingAllowedBundles_allowVisits___block_invoke_117_cold_1();
    }
    goto LABEL_36;
  }
LABEL_31:
  [*(id *)(a1 + 56) addObject:v4];
LABEL_37:
}

+ (void)getPersonalizedSensingAllowedBundles:allowVisits:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "subSuggestionIDs=%@", v2, v3, v4, v5, v6);
}

+ (void)getPersonalizedSensingAllowedBundles:allowVisits:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "subBundleIDs=%@", v2, v3, v4, v5, v6);
}

void __79__MOPersonalizedSensingUtils_getPersonalizedSensingAllowedBundles_allowVisits___block_invoke_117_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "Not allowed bundle: %@", v2, v3, v4, v5, v6);
}

void __79__MOPersonalizedSensingUtils_getPersonalizedSensingAllowedBundles_allowVisits___block_invoke_117_cold_2(void *a1, NSObject *a2)
{
  [a1 interfaceType];
  OUTLINED_FUNCTION_1();
  __int16 v5 = 2112;
  uint8_t v6 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Not allowed bundle by category (%lu): %@", v4, 0x16u);
}

void __79__MOPersonalizedSensingUtils_getPersonalizedSensingAllowedBundles_allowVisits___block_invoke_117_cold_3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "Not allowed visit bundle: %@", v2, v3, v4, v5, v6);
}

@end