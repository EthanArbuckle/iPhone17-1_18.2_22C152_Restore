@interface SSWorldClockUtilities
+ (id)additionalTimeZonesStringForFormattedData:(id)a3;
+ (id)capitalCityInMultiTimeZoneCountryWithCountryCode:(id)a3;
+ (id)clockColor;
+ (id)clockImageForDate:(id)a3 timeZone:(id)a4 latitude:(double)a5 longitude:(double)a6;
+ (id)commandForFormattedData:(id)a3;
+ (id)compactCardSectionForFormattedData:(id)a3 primaryCityFormattedData:(id)a4;
+ (id)countryCodeForUnlocalizedCountryName:(id)a3;
+ (id)formattedLocationForCity:(id)a3 country:(id)a4;
+ (id)formattedTimeForDate:(id)a3 timeZone:(id)a4;
+ (id)inlineCardSectionForFormattedData:(id)a3 primaryCityFormattedData:(id)a4;
+ (id)onDeviceResultsForLocationQuery:(id)a3;
+ (id)timeZoneOffsetDescriptionForDate:(id)a3 timeZone:(id)a4;
+ (void)getFormattedWorldClockResultsFromTimeZoneLocations:(id)a3 shouldEmphasizeTimeZone:(BOOL)a4 completionHandler:(id)a5;
+ (void)getLocationAndTimeZoneForQuery:(id)a3 completionHandler:(id)a4;
+ (void)getWorldClockResultsForQuery:(id)a3 completionHandler:(id)a4;
+ (void)parseQueryForWorldClock:(id)a3 completionHandler:(id)a4;
+ (void)parseQueryForWorldClock:(id)a3 forceLoad:(BOOL)a4 completionHandler:(id)a5;
+ (void)sendResultsForQuery:(id)a3 detectedLocations:(id)a4 shouldEmphasizeTimeZone:(BOOL)a5 completionHandler:(id)a6;
+ (void)timeZoneMatchesForLocation:(id)a3 completionHandler:(id)a4;
@end

@implementation SSWorldClockUtilities

+ (void)getWorldClockResultsForQuery:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = objc_opt_class();
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __72__SSWorldClockUtilities_getWorldClockResultsForQuery_completionHandler___block_invoke;
  v11[3] = &unk_1E635A8F8;
  id v13 = v7;
  id v14 = a1;
  id v12 = v6;
  id v9 = v7;
  id v10 = v6;
  [v8 parseQueryForWorldClock:v10 completionHandler:v11];
}

void __72__SSWorldClockUtilities_getWorldClockResultsForQuery_completionHandler___block_invoke(uint64_t a1, uint64_t a2, char a3)
{
  if (a2)
  {
    id v6 = *(void **)(a1 + 48);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __72__SSWorldClockUtilities_getWorldClockResultsForQuery_completionHandler___block_invoke_2;
    v10[3] = &unk_1E635A8D0;
    id v13 = v6;
    id v11 = *(id *)(a1 + 32);
    char v14 = a3;
    id v12 = *(id *)(a1 + 40);
    [v6 timeZoneMatchesForLocation:a2 completionHandler:v10];
  }
  else
  {
    uint64_t v8 = *(void *)(a1 + 40);
    id v7 = *(void **)(a1 + 48);
    uint64_t v9 = *(void *)(a1 + 32);
    [v7 sendResultsForQuery:v9 detectedLocations:0 shouldEmphasizeTimeZone:0 completionHandler:v8];
  }
}

uint64_t __72__SSWorldClockUtilities_getWorldClockResultsForQuery_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 48) sendResultsForQuery:*(void *)(a1 + 32) detectedLocations:a2 shouldEmphasizeTimeZone:*(unsigned __int8 *)(a1 + 56) completionHandler:*(void *)(a1 + 40)];
}

+ (void)timeZoneMatchesForLocation:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __70__SSWorldClockUtilities_timeZoneMatchesForLocation_completionHandler___block_invoke;
  v10[3] = &unk_1E635A920;
  id v12 = v7;
  id v13 = a1;
  id v11 = v6;
  id v8 = v7;
  id v9 = v6;
  [a1 getLocationAndTimeZoneForQuery:v9 completionHandler:v10];
}

void __70__SSWorldClockUtilities_timeZoneMatchesForLocation_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, double a5, double a6)
{
  v29[1] = *MEMORY[0x1E4F143B8];
  id v11 = a2;
  id v12 = a3;
  id v13 = a4;
  char v14 = [*(id *)(a1 + 48) onDeviceResultsForLocationQuery:*(void *)(a1 + 32)];
  v15 = [v14 firstObject];
  v16 = WorldClockDebugLog();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
    __70__SSWorldClockUtilities_timeZoneMatchesForLocation_completionHandler___block_invoke_cold_3((uint64_t *)(a1 + 32), v15, v16);
  }

  v17 = [MEMORY[0x1E4F1CAF0] localTimeZone];
  if ([v12 isEqualToTimeZone:v17]) {
    BOOL v18 = [v14 count] != 0;
  }
  else {
    BOOL v18 = 0;
  }

  if (!v11 || !v12) {
    goto LABEL_11;
  }
  v19 = [v15 countryCode];
  if ([v13 isEqualToString:v19])
  {

LABEL_11:
    v22 = WorldClockDebugLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
      __70__SSWorldClockUtilities_timeZoneMatchesForLocation_completionHandler___block_invoke_cold_1((uint64_t *)(a1 + 32), v22);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    goto LABEL_14;
  }
  v20 = [v15 timeZone];
  int v21 = [v20 isEqualToTimeZone:v12] | v18;

  if (v21 == 1) {
    goto LABEL_11;
  }
  v23 = objc_opt_new();
  [v23 setLocation:v11];
  [v23 setTimeZone:v12];
  v24 = [MEMORY[0x1E4F28ED0] numberWithDouble:a5];
  [v23 setLatitude:v24];

  v25 = [MEMORY[0x1E4F28ED0] numberWithDouble:a6];
  [v23 setLongitude:v25];

  v26 = WorldClockDebugLog();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
    __70__SSWorldClockUtilities_timeZoneMatchesForLocation_completionHandler___block_invoke_cold_2((uint64_t *)(a1 + 32), v26);
  }

  uint64_t v27 = *(void *)(a1 + 40);
  if (v23)
  {
    v29[0] = v23;
    v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:1];
    (*(void (**)(uint64_t, void *))(v27 + 16))(v27, v28);
  }
  else
  {
    (*(void (**)(uint64_t, void))(v27 + 16))(v27, 0);
  }

LABEL_14:
}

+ (id)onDeviceResultsForLocationQuery:(id)a3
{
  v135[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v103 = objc_opt_new();
  v93 = [MEMORY[0x1E4F4BE38] sharedManager];
  v104 = v3;
  v4 = [v93 citiesMatchingName:v3];
  v5 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"name" ascending:1];
  v135[0] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v135 count:1];
  id v7 = [v4 sortedArrayUsingDescriptors:v6];

  id v8 = WorldClockDebugLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    +[SSWorldClockUtilities onDeviceResultsForLocationQuery:v8];
  }

  v96 = objc_opt_new();
  v91 = objc_opt_new();
  long long v126 = 0u;
  long long v127 = 0u;
  long long v128 = 0u;
  long long v129 = 0u;
  obuint64_t j = v7;
  uint64_t v9 = [obj countByEnumeratingWithState:&v126 objects:v134 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v127;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v127 != v11) {
          objc_enumerationMutation(obj);
        }
        id v13 = *(void **)(*((void *)&v126 + 1) + 8 * i);
        char v14 = [v13 countryName];
        v15 = [v14 commonPrefixWithString:v104 options:129];
        uint64_t v16 = [v15 length];
        uint64_t v17 = [v104 length];

        if (v16 == v17)
        {
          BOOL v18 = [v13 timeZone];
          v19 = [MEMORY[0x1E4F1CAF0] timeZoneWithName:v18];
          if (v19)
          {
            v20 = [v96 objectForKeyedSubscript:v18];

            if (!v20)
            {
              int v21 = objc_opt_new();
              [v96 setObject:v21 forKeyedSubscript:v18];
            }
            v22 = [v96 objectForKeyedSubscript:v18];
            [v22 addObject:v13];
          }
        }
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v126 objects:v134 count:16];
    }
    while (v10);
  }

  if (![v96 count])
  {
    v63 = 0;
    v107 = 0;
    v62 = v91;
    goto LABEL_55;
  }
  v23 = [v96 keyEnumerator];
  v24 = [v23 allObjects];
  v124[0] = MEMORY[0x1E4F143A8];
  v124[1] = 3221225472;
  v124[2] = __57__SSWorldClockUtilities_onDeviceResultsForLocationQuery___block_invoke;
  v124[3] = &unk_1E635A948;
  id v25 = v96;
  id v125 = v25;
  v26 = [v24 sortedArrayUsingComparator:v124];

  uint64_t v27 = [v26 firstObject];
  v94 = v25;
  v28 = [v25 objectForKeyedSubscript:v27];
  v29 = [v28 firstObject];

  v105 = v29;
  v30 = [v29 unlocalizedCountryName];
  uint64_t v31 = [a1 countryCodeForUnlocalizedCountryName:v30];

  v90 = (void *)v31;
  v32 = [a1 capitalCityInMultiTimeZoneCountryWithCountryCode:v31];
  v33 = (void *)MEMORY[0x1E4F1CAF0];
  v107 = v32;
  v34 = [v32 timeZone];
  v35 = [v33 timeZoneWithName:v34];

  v106 = objc_opt_new();
  long long v120 = 0u;
  long long v121 = 0u;
  long long v122 = 0u;
  long long v123 = 0u;
  id v97 = v26;
  v36 = v93;
  v92 = v35;
  uint64_t v101 = [v97 countByEnumeratingWithState:&v120 objects:v133 count:16];
  if (!v101) {
    goto LABEL_46;
  }
  uint64_t v100 = *(void *)v121;
  do
  {
    for (uint64_t j = 0; j != v101; ++j)
    {
      if (*(void *)v121 != v100) {
        objc_enumerationMutation(v97);
      }
      v38 = *(void **)(*((void *)&v120 + 1) + 8 * j);
      v39 = [MEMORY[0x1E4F1CAF0] timeZoneWithName:v38];
      uint64_t v40 = [v39 secondsFromGMT];
      v41 = [MEMORY[0x1E4F28ED0] numberWithInteger:v40];
      v42 = [v106 objectForKeyedSubscript:v41];

      if (!v42)
      {
        if (v107 && [v35 secondsFromGMT] == v40)
        {
          id v43 = v107;
LABEL_43:
          v57 = [MEMORY[0x1E4F28ED0] numberWithInteger:v40];
          [v106 setObject:v43 forKeyedSubscript:v57];

          goto LABEL_44;
        }
        v44 = [v105 timeZone];
        int v45 = [v38 isEqualToString:v44];

        if (v107 || v45)
        {
          v46 = [v36 defaultCityForTimeZone:v39];
          v47 = [v46 unlocalizedCountryName];
          v48 = [v105 unlocalizedCountryName];
          int v49 = [v47 isEqualToString:v48];

          if (v49)
          {
            id v43 = v46;
          }
          else
          {
            v95 = v46;
            v50 = [v94 objectForKeyedSubscript:v38];
            long long v116 = 0u;
            long long v117 = 0u;
            long long v118 = 0u;
            long long v119 = 0u;
            id v98 = v50;
            id v43 = (id)[v98 countByEnumeratingWithState:&v116 objects:v132 count:16];
            if (v43)
            {
              uint64_t v51 = *(void *)v117;
              while (2)
              {
                for (k = 0; k != v43; k = (char *)k + 1)
                {
                  if (*(void *)v117 != v51) {
                    objc_enumerationMutation(v98);
                  }
                  v53 = *(void **)(*((void *)&v116 + 1) + 8 * (void)k);
                  v54 = [v53 unlocalizedCountryName];
                  v55 = [v105 unlocalizedCountryName];
                  int v56 = [v54 isEqualToString:v55];

                  if (v56)
                  {
                    id v43 = v53;
                    goto LABEL_40;
                  }
                }
                id v43 = (id)[v98 countByEnumeratingWithState:&v116 objects:v132 count:16];
                if (v43) {
                  continue;
                }
                break;
              }
LABEL_40:
              v35 = v92;
              v36 = v93;
            }

            v46 = v95;
          }

          if (v43) {
            goto LABEL_43;
          }
        }
      }
LABEL_44:
    }
    uint64_t v101 = [v97 countByEnumeratingWithState:&v120 objects:v133 count:16];
  }
  while (v101);
LABEL_46:

  long long v114 = 0u;
  long long v115 = 0u;
  long long v112 = 0u;
  long long v113 = 0u;
  v58 = [v106 keyEnumerator];
  v59 = [v58 allObjects];
  v60 = [v59 sortedArrayUsingSelector:sel_compare_];

  uint64_t v61 = [v60 countByEnumeratingWithState:&v112 objects:v131 count:16];
  v63 = v90;
  v62 = v91;
  if (v61)
  {
    uint64_t v64 = v61;
    uint64_t v65 = *(void *)v113;
    do
    {
      for (uint64_t m = 0; m != v64; ++m)
      {
        if (*(void *)v113 != v65) {
          objc_enumerationMutation(v60);
        }
        v67 = [v106 objectForKeyedSubscript:*(void *)(*((void *)&v112 + 1) + 8 * m)];
        [v91 addObject:v67];
      }
      uint64_t v64 = [v60 countByEnumeratingWithState:&v112 objects:v131 count:16];
    }
    while (v64);
  }

LABEL_55:
  if (![v62 count])
  {
    v68 = [obj firstObject];

    if (v68)
    {
      v69 = [obj firstObject];
      [v62 addObject:v69];
    }
  }
  long long v110 = 0u;
  long long v111 = 0u;
  long long v108 = 0u;
  long long v109 = 0u;
  id v70 = v62;
  uint64_t v71 = [v70 countByEnumeratingWithState:&v108 objects:v130 count:16];
  if (v71)
  {
    uint64_t v72 = v71;
    uint64_t v73 = *(void *)v109;
    do
    {
      for (uint64_t n = 0; n != v72; ++n)
      {
        if (*(void *)v109 != v73) {
          objc_enumerationMutation(v70);
        }
        v75 = *(void **)(*((void *)&v108 + 1) + 8 * n);
        v76 = objc_opt_new();
        if ([v63 length] && objc_msgSend(v70, "count") == 1)
        {
          v77 = [v75 countryName];
          [v76 setLocation:v77];
        }
        else
        {
          v77 = [v75 name];
          v78 = [v75 countryName];
          v79 = [a1 formattedLocationForCity:v77 country:v78];
          [v76 setLocation:v79];
        }
        v80 = (void *)MEMORY[0x1E4F28ED0];
        [v75 latitude];
        v81 = objc_msgSend(v80, "numberWithFloat:");
        [v76 setLatitude:v81];

        v82 = (void *)MEMORY[0x1E4F28ED0];
        [v75 longitude];
        v83 = objc_msgSend(v82, "numberWithFloat:");
        [v76 setLongitude:v83];

        v84 = [v75 countryName];
        [v76 setCountryName:v84];

        v85 = (void *)MEMORY[0x1E4F1CAF0];
        v86 = [v75 timeZone];
        v87 = [v85 timeZoneWithName:v86];
        [v76 setTimeZone:v87];

        [v76 setCountryCode:v63];
        [v76 setIsCapital:v75 == v107];
        [v103 addObject:v76];
      }
      uint64_t v72 = [v70 countByEnumeratingWithState:&v108 objects:v130 count:16];
    }
    while (v72);
  }

  v88 = (void *)[v103 copy];
  return v88;
}

uint64_t __57__SSWorldClockUtilities_onDeviceResultsForLocationQuery___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v5 = *(void **)(a1 + 32);
  id v6 = a2;
  id v7 = [v5 objectForKeyedSubscript:a3];
  uint64_t v8 = [v7 count];
  uint64_t v9 = [*(id *)(a1 + 32) objectForKeyedSubscript:v6];

  uint64_t v10 = v8 - [v9 count];
  return v10;
}

+ (void)getLocationAndTimeZoneForQuery:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [MEMORY[0x1E4F64710] sharedService];
  uint64_t v9 = [v8 ticketForSearchQuery:v6 filters:0 maxResults:1 traits:0];

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __74__SSWorldClockUtilities_getLocationAndTimeZoneForQuery_completionHandler___block_invoke;
  v12[3] = &unk_1E635A970;
  id v14 = v7;
  id v15 = a1;
  id v13 = v6;
  id v10 = v7;
  id v11 = v6;
  [v9 submitWithRefinedHandler:v12 networkActivity:0];
}

void __74__SSWorldClockUtilities_getLocationAndTimeZoneForQuery_completionHandler___block_invoke(void *a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = [a2 firstObject];
  uint64_t v8 = v7;
  if (v7)
  {
    uint64_t v9 = (void *)a1[6];
    id v10 = [v7 addressObject];
    id v11 = [v10 cityDisplayNameWithFallback:1];
    id v12 = [v8 addressObject];
    id v13 = [v12 countryName];
    id v14 = [v9 formattedLocationForCity:v11 country:v13];
  }
  else
  {
    id v14 = 0;
  }
  id v15 = [v8 addressDictionary];
  uint64_t v16 = [v15 objectForKeyedSubscript:@"Street"];
  if ([v16 length])
  {

LABEL_7:
    v19 = 0;
    int v20 = 1;
    goto LABEL_8;
  }
  uint64_t v17 = [v15 objectForKeyedSubscript:@"SubLocality"];
  uint64_t v18 = [v17 length];

  if (v18) {
    goto LABEL_7;
  }
  int v20 = 0;
  v19 = v14;
LABEL_8:
  id v21 = v19;

  v22 = [v8 timezone];
  v23 = [v8 _bestAvailableCountryCode];
  v24 = WorldClockDebugLog();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v28 = a1[4];
    int v29 = 138413826;
    uint64_t v30 = v28;
    __int16 v31 = 2112;
    v32 = v15;
    __int16 v33 = 1024;
    int v34 = v20;
    __int16 v35 = 2112;
    id v36 = v21;
    __int16 v37 = 2112;
    v38 = v22;
    __int16 v39 = 2112;
    uint64_t v40 = v23;
    __int16 v41 = 2112;
    id v42 = v6;
    _os_log_debug_impl(&dword_1BDB2A000, v24, OS_LOG_TYPE_DEBUG, "Result from GeoServices query “%@“: %@ (isAddress: %d, parsed location: %@, time zone: %@, country code: %@, error: %@)", (uint8_t *)&v29, 0x44u);
  }

  uint64_t v25 = a1[5];
  [v8 coordinate];
  double v27 = v26;
  [v8 coordinate];
  (*(void (**)(uint64_t, id, void *, void *, double))(v25 + 16))(v25, v21, v22, v23, v27);
}

+ (id)formattedLocationForCity:(id)a3 country:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 length]
    && [v6 length]
    && ![v5 isEqualToString:v6])
  {
    uint64_t v9 = NSString;
    id v10 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v11 = [v10 localizedStringForKey:@"TIME_ZONE_LOCATION_FORMAT" value:&stru_1F1824018 table:@"SpotlightServices"];
    objc_msgSend(v9, "stringWithFormat:", v11, v5, v6);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if ([v5 length]) {
      id v7 = v5;
    }
    else {
      id v7 = v6;
    }
    id v8 = v7;
  }

  return v8;
}

+ (void)getFormattedWorldClockResultsFromTimeZoneLocations:(id)a3 shouldEmphasizeTimeZone:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v47 = a4;
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int v45 = (void (**)(id, void *, void *, void *))a5;
  int v49 = objc_opt_new();
  v48 = objc_opt_new();
  v54 = [MEMORY[0x1E4F1C9C8] date];
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  obuint64_t j = v6;
  uint64_t v51 = [obj countByEnumeratingWithState:&v58 objects:v64 count:16];
  id v7 = 0;
  if (v51)
  {
    uint64_t v50 = *(void *)v59;
    do
    {
      for (uint64_t i = 0; i != v51; ++i)
      {
        if (*(void *)v59 != v50) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v58 + 1) + 8 * i);
        id v10 = [v9 timeZone];
        if (v10)
        {
          uint64_t v11 = [a1 formattedTimeForDate:v54 timeZone:v10];
          uint64_t v12 = [MEMORY[0x1E4F1CA20] currentLocale];
          id v13 = objc_opt_new();
          id v14 = [v9 location];
          [v13 setLocation:v14];

          id v15 = [v9 countryName];
          [v13 setCountryName:v15];

          v55 = (void *)v11;
          [v13 setTime:v11];
          uint64_t v16 = [a1 timeZoneOffsetDescriptionForDate:v54 timeZone:v10];
          [v13 setTimeZoneOffsetDescription:v16];

          if ([v10 isDaylightSavingTime]) {
            uint64_t v17 = 2;
          }
          else {
            uint64_t v17 = 0;
          }
          v52 = (void *)v12;
          uint64_t v18 = [v10 localizedName:v17 locale:v12];
          [v13 setTimeZoneDescription:v18];

          v19 = [v10 name];
          [v13 setTimeZoneName:v19];

          int v20 = [v10 abbreviation];
          [v13 setTimeZoneAbbreviation:v20];

          id v21 = [v13 timeZoneOffsetDescription];
          if (v21)
          {
            v22 = NSString;
            v23 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
            v24 = [v23 localizedStringForKey:@"TIME_AND_TIME_ZONE_OFFSET_FORMAT" value:&stru_1F1824018 table:@"SpotlightServices"];
            uint64_t v25 = [v13 timeZoneOffsetDescription];
            double v26 = objc_msgSend(v22, "stringWithFormat:", v24, v55, v25);
            [v13 setTimeAndTimeZoneOffsetDescription:v26];
          }
          else
          {
            [v13 setTimeAndTimeZoneOffsetDescription:v11];
          }

          [v13 setShouldEmphasizeTimeZone:v47];
          double v27 = [v9 latitude];
          [v27 doubleValue];
          double v29 = v28;
          uint64_t v30 = [v9 longitude];
          [v30 doubleValue];
          v32 = [a1 clockImageForDate:v54 timeZone:v10 latitude:v29 longitude:v31];
          [v13 setClockImage:v32];

          int v33 = [v9 isCapital];
          if (v7) {
            int v34 = v33;
          }
          else {
            int v34 = 1;
          }
          if (v34) {
            __int16 v35 = v13;
          }
          else {
            __int16 v35 = v7;
          }
          id v36 = v35;

          __int16 v37 = objc_opt_new();
          [v37 setApplicationBundleIdentifier:@"com.apple.mobiletimer"];
          v38 = (void *)[objc_alloc(MEMORY[0x1E4F22488]) initWithActivityType:@"com.apple.clock.worldclock"];
          v62[0] = @"TimeZone";
          __int16 v39 = [v10 name];
          v63[0] = v39;
          v62[1] = @"Latitude";
          uint64_t v40 = [v9 latitude];
          v63[1] = v40;
          v62[2] = @"Longitude";
          __int16 v41 = [v9 longitude];
          v63[2] = v41;
          id v42 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v63 forKeys:v62 count:3];
          [v38 setUserInfo:v42];

          v56[0] = MEMORY[0x1E4F143A8];
          v56[1] = 3221225472;
          v56[2] = __118__SSWorldClockUtilities_getFormattedWorldClockResultsFromTimeZoneLocations_shouldEmphasizeTimeZone_completionHandler___block_invoke;
          v56[3] = &unk_1E635A998;
          id v57 = v37;
          id v43 = v37;
          [v38 _createUserActivityStringsWithOptions:0 completionHandler:v56];
          [v13 setPunchoutCommand:v43];
          [v49 addObject:v13];
          v44 = [v13 location];
          [v48 addObject:v44];

          id v7 = v36;
        }
      }
      uint64_t v51 = [obj countByEnumeratingWithState:&v58 objects:v64 count:16];
    }
    while (v51);
  }

  v45[2](v45, v49, v7, v48);
}

uint64_t __118__SSWorldClockUtilities_getFormattedWorldClockResultsFromTimeZoneLocations_shouldEmphasizeTimeZone_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setUserActivityRequiredString:a2];
}

+ (void)sendResultsForQuery:(id)a3 detectedLocations:(id)a4 shouldEmphasizeTimeZone:(BOOL)a5 completionHandler:(id)a6
{
  BOOL v6 = a5;
  id v9 = a6;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __105__SSWorldClockUtilities_sendResultsForQuery_detectedLocations_shouldEmphasizeTimeZone_completionHandler___block_invoke;
  v11[3] = &unk_1E635A9C0;
  id v12 = v9;
  id v13 = a1;
  id v10 = v9;
  [a1 getFormattedWorldClockResultsFromTimeZoneLocations:a4 shouldEmphasizeTimeZone:v6 completionHandler:v11];
}

void __105__SSWorldClockUtilities_sendResultsForQuery_detectedLocations_shouldEmphasizeTimeZone_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if ([v7 count])
  {
    id v10 = objc_opt_new();
    [v10 setSectionBundleIdentifier:@"com.apple.worldclock"];
    uint64_t v11 = NSString;
    id v12 = [v9 componentsJoinedByString:@"/"];
    id v13 = [v11 stringWithFormat:@"%@:%@", @"com.apple.worldclock", v12];
    [v10 setIdentifier:v13];

    objc_msgSend(v10, "setTopHit:", SSSetTopHitWithReasonString(2, v10, @"SSWorldClock direct", 1));
    [v10 setType:2];
    [v10 setResultBundleId:@"com.apple.worldclock"];
    id v14 = objc_opt_new();
    [v10 setInlineCard:v14];

    id v15 = [*(id *)(a1 + 40) inlineCardSectionForFormattedData:v7 primaryCityFormattedData:v8];
    v22[0] = v15;
    uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];
    uint64_t v17 = [v10 inlineCard];
    [v17 setCardSections:v16];

    if (NavdRecentLocationsEntitlment_block_invoke_onceToken != -1) {
      dispatch_once(&NavdRecentLocationsEntitlment_block_invoke_onceToken, &__block_literal_global_54);
    }
    uint64_t v18 = objc_opt_new();
    [v18 setBundleIdentifier:@"com.apple.worldclock"];
    id v21 = v10;
    v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v21 count:1];
    [v18 setResults:v19];

    [v18 setGroupName:NavdRecentLocationsEntitlment_block_invoke_clockAppName];
    int v20 = [v18 groupName];
    [v18 setTitle:v20];
  }
  else
  {
    uint64_t v18 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __105__SSWorldClockUtilities_sendResultsForQuery_detectedLocations_shouldEmphasizeTimeZone_completionHandler___block_invoke_2()
{
  id v2 = (id)[objc_alloc(MEMORY[0x1E4F223C8]) initWithBundleIdentifier:@"com.apple.mobiletimer" allowPlaceholder:1 error:0];
  uint64_t v0 = [v2 localizedName];
  v1 = (void *)NavdRecentLocationsEntitlment_block_invoke_clockAppName;
  NavdRecentLocationsEntitlment_block_invoke_clockAppName = v0;
}

+ (id)countryCodeForUnlocalizedCountryName:(id)a3
{
  uint64_t v3 = countryCodeForUnlocalizedCountryName__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&countryCodeForUnlocalizedCountryName__onceToken, &__block_literal_global_195);
  }
  id v5 = [(id)countryCodeForUnlocalizedCountryName__countryCodesForUnlocalizedCountryNames objectForKeyedSubscript:v4];
  BOOL v6 = v5;
  if (!v5) {
    id v5 = v4;
  }
  id v7 = v5;

  return v7;
}

void __62__SSWorldClockUtilities_countryCodeForUnlocalizedCountryName___block_invoke()
{
  uint64_t v0 = (void *)countryCodeForUnlocalizedCountryName__countryCodesForUnlocalizedCountryNames;
  countryCodeForUnlocalizedCountryName__countryCodesForUnlocalizedCountryNames = (uint64_t)&unk_1F1864A10;
}

+ (id)capitalCityInMultiTimeZoneCountryWithCountryCode:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (capitalCityInMultiTimeZoneCountryWithCountryCode__onceToken != -1) {
    dispatch_once(&capitalCityInMultiTimeZoneCountryWithCountryCode__onceToken, &__block_literal_global_258);
  }
  id v4 = [(id)capitalCityInMultiTimeZoneCountryWithCountryCode__capitalCityIdentifiersForCountryCodes objectForKeyedSubscript:v3];
  if (v4)
  {
    id v5 = [MEMORY[0x1E4F4BE38] sharedManager];
    v10[0] = v4;
    BOOL v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
    id v7 = [v5 citiesWithIdentifiers:v6];
    id v8 = [v7 firstObject];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

void __74__SSWorldClockUtilities_capitalCityInMultiTimeZoneCountryWithCountryCode___block_invoke()
{
  uint64_t v0 = (void *)capitalCityInMultiTimeZoneCountryWithCountryCode__capitalCityIdentifiersForCountryCodes;
  capitalCityInMultiTimeZoneCountryWithCountryCode__capitalCityIdentifiersForCountryCodes = (uint64_t)&unk_1F1864A38;
}

+ (id)inlineCardSectionForFormattedData:(id)a3 primaryCityFormattedData:(id)a4
{
  v40[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x1E4F9A378];
  id v9 = [v7 timeZoneDescription];
  uint64_t v10 = [v8 textWithString:v9];

  uint64_t v11 = (void *)MEMORY[0x1E4F9A378];
  id v12 = [v7 location];
  id v13 = [v11 textWithString:v12];

  id v14 = objc_opt_new();
  id v15 = [v7 clockImage];
  [v14 setThumbnail:v15];

  if ([v7 shouldEmphasizeTimeZone])
  {
    objc_msgSend(v14, "setTitle:", v10, v10);
    uint64_t v16 = (void *)MEMORY[0x1E4F9A378];
    uint64_t v17 = [v7 timeAndTimeZoneOffsetDescription];
    uint64_t v18 = [v16 textWithString:v17];
    v40[0] = v18;
    v19 = (void *)MEMORY[0x1E4F9A378];
    int v20 = [v7 location];
    id v21 = [v19 textWithString:v20];
    v40[1] = v21;
    v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:2];
    [v14 setDescriptions:v22];
  }
  else
  {
    objc_msgSend(v14, "setTitle:", v13, v10);
    v23 = [v7 timeZoneOffsetDescription];

    if (v23)
    {
      v24 = [v7 timeZoneAbbreviation];
      v39[0] = v24;
      uint64_t v25 = [v7 timeZoneOffsetDescription];
      v39[1] = v25;
      uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:2];
    }
    else
    {
      v24 = [v7 timeZoneDescription];
      v38 = v24;
      uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v38 count:1];
    }

    double v26 = (void *)MEMORY[0x1E4F9A378];
    double v27 = [v17 componentsJoinedByString:@" · "];
    uint64_t v18 = [v26 textWithString:v27];

    __int16 v37 = v18;
    double v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v37 count:1];
    [v14 setDescriptions:v28];

    double v29 = (void *)MEMORY[0x1E4F9A0E0];
    int v20 = [v7 time];
    id v21 = [v29 textWithString:v20];
    [v14 setTrailingMiddleText:v21];
  }

  if ((unint64_t)[v6 count] >= 2)
  {
    uint64_t v30 = (void *)MEMORY[0x1E4F9A0E0];
    double v31 = [a1 additionalTimeZonesStringForFormattedData:v6];
    v32 = [v30 textWithString:v31];
    [v14 setTrailingBottomText:v32];
  }
  int v33 = [a1 commandForFormattedData:v6];
  [v14 setCommand:v33];

  int v34 = [a1 clockColor];
  [v14 setBackgroundColor:v34];

  return v14;
}

+ (id)clockColor
{
  id v2 = objc_opt_new();
  [v2 setApplicationBundleIdentifier:@"com.apple.mobiletimer"];
  return v2;
}

+ (id)compactCardSectionForFormattedData:(id)a3 primaryCityFormattedData:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x1E4F9A378];
  id v9 = [v7 timeAndTimeZoneOffsetDescription];
  uint64_t v10 = [v8 textWithString:v9];

  uint64_t v11 = (void *)MEMORY[0x1E4F9A378];
  id v12 = [v7 location];
  id v13 = [v11 textWithString:v12];

  id v14 = objc_opt_new();
  id v15 = [v7 clockImage];
  [v14 setThumbnail:v15];

  if ([v7 shouldEmphasizeTimeZone])
  {
    uint64_t v16 = (void *)MEMORY[0x1E4F9A378];
    uint64_t v17 = [v7 timeZoneDescription];
    uint64_t v18 = [v16 textWithString:v17];
    [v14 setTitle:v18];

    uint64_t v30 = v10;
    double v31 = v13;
    v19 = (void *)MEMORY[0x1E4F1C978];
    int v20 = &v30;
    uint64_t v21 = 2;
  }
  else
  {
    [v14 setTitle:v10];
    double v29 = v13;
    v19 = (void *)MEMORY[0x1E4F1C978];
    int v20 = &v29;
    uint64_t v21 = 1;
  }
  v22 = objc_msgSend(v19, "arrayWithObjects:count:", v20, v21, v29, v30, v31, v32);
  if ((unint64_t)[v6 count] >= 2)
  {
    v23 = (void *)MEMORY[0x1E4F9A378];
    v24 = [a1 additionalTimeZonesStringForFormattedData:v6];
    uint64_t v25 = [v23 textWithString:v24];
    uint64_t v26 = [v22 arrayByAddingObject:v25];

    v22 = (void *)v26;
  }
  [v14 setDescriptions:v22];
  [v14 setShouldUseCompactDisplay:1];
  double v27 = [a1 commandForFormattedData:v6];
  [v14 setCommand:v27];

  return v14;
}

+ (id)additionalTimeZonesStringForFormattedData:(id)a3
{
  id v3 = NSString;
  id v4 = (void *)MEMORY[0x1E4F28B50];
  id v5 = a3;
  id v6 = [v4 bundleForClass:objc_opt_class()];
  id v7 = [v6 localizedStringForKey:@"ADDITIONAL_TIME_ZONES_FORMAT" value:&stru_1F1824018 table:@"SpotlightServices"];
  id v8 = (void *)MEMORY[0x1E4F28ED0];
  uint64_t v9 = [v5 count];

  uint64_t v10 = [v8 numberWithUnsignedInteger:v9 - 1];
  uint64_t v11 = objc_msgSend(v3, "stringWithFormat:", v7, v10);

  return v11;
}

+ (id)commandForFormattedData:(id)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ((unint64_t)[v4 count] < 2)
  {
    double v28 = [v4 firstObject];
    double v29 = [v28 punchoutCommand];
  }
  else
  {
    id v38 = a1;
    __int16 v41 = objc_opt_new();
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    obuint64_t j = v4;
    uint64_t v5 = [obj countByEnumeratingWithState:&v42 objects:v47 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v40 = *(void *)v43;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v43 != v40) {
            objc_enumerationMutation(obj);
          }
          id v8 = *(void **)(*((void *)&v42 + 1) + 8 * i);
          uint64_t v9 = objc_opt_new();
          uint64_t v10 = [v8 clockImage];
          [v9 setThumbnail:v10];

          uint64_t v11 = (void *)MEMORY[0x1E4F9A378];
          id v12 = [v8 timeZoneDescription];
          id v13 = [v11 textWithString:v12];
          [v9 setTitle:v13];

          id v14 = (void *)MEMORY[0x1E4F9A378];
          id v15 = [v8 location];
          uint64_t v16 = [v14 textWithString:v15];
          v46[0] = v16;
          uint64_t v17 = (void *)MEMORY[0x1E4F9A378];
          uint64_t v18 = [v8 timeZoneOffsetDescription];
          v19 = [v17 textWithString:v18];
          v46[1] = v19;
          int v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:2];
          [v9 setDescriptions:v20];

          uint64_t v21 = (void *)MEMORY[0x1E4F9A0E0];
          v22 = [v8 time];
          v23 = [v21 textWithString:v22];
          [v9 setTrailingMiddleText:v23];

          v24 = [v8 punchoutCommand];
          [v9 setCommand:v24];

          [v41 addObject:v9];
        }
        uint64_t v6 = [obj countByEnumeratingWithState:&v42 objects:v47 count:16];
      }
      while (v6);
    }

    if (commandForFormattedData__onceToken != -1) {
      dispatch_once(&commandForFormattedData__onceToken, &__block_literal_global_301);
    }
    uint64_t v25 = objc_opt_new();
    uint64_t v26 = v25;
    if (commandForFormattedData__isiPhone)
    {
      double v27 = [v38 clockColor];
      [v26 setBackgroundColor:v27];
    }
    else
    {
      [v25 setBackgroundColor:0];
    }
    [v26 setCardSections:v41];
    uint64_t v30 = NSString;
    double v31 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v32 = [v31 localizedStringForKey:@"COUNTRY_TIME_ZONE_FORMAT" value:&stru_1F1824018 table:@"SpotlightServices"];
    int v33 = [obj firstObject];
    int v34 = [v33 countryName];
    __int16 v35 = objc_msgSend(v30, "stringWithFormat:", v32, v34);
    [v26 setTitle:v35];

    id v36 = objc_opt_new();
    [v36 setSymbolName:@"clock.fill"];
    [v36 setIsTemplate:1];
    [v26 setTitleImage:v36];
    double v29 = objc_opt_new();
    [v29 setCard:v26];
  }
  return v29;
}

uint64_t __49__SSWorldClockUtilities_commandForFormattedData___block_invoke()
{
  uint64_t result = MGGetSInt32Answer();
  commandForFormattedData__isiPhone = result == 1;
  return result;
}

+ (void)parseQueryForWorldClock:(id)a3 completionHandler:(id)a4
{
}

+ (void)parseQueryForWorldClock:(id)a3 forceLoad:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v6 = a4;
  v49[3] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  if (v6)
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4F28C10]);
    [v9 setDateFormat:@"MM/dd/yyyy"];
    uint64_t v10 = [v9 dateFromString:@"9/30/2020"];
    v48[0] = @"date";
    v48[1] = @"kMDQueryOptionContextIdentifier";
    v49[0] = v10;
    v49[1] = @"com.apple.Spotlight";
    v48[2] = @"waitForLoad";
    v49[2] = MEMORY[0x1E4F1CC38];
    uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v49 forKeys:v48 count:3];
  }
  else
  {
    uint64_t v11 = 0;
  }
  id v12 = SSQueryParseResultsForQueryString(v7, v11, 0, 0, 1);
  [v12 objectForKeyedSubscript:@"attributedParses"];
  v22 = v12;
  v23 = v11;
  v24 = (void (**)(void, void, void))v8;
  uint64_t v25 = v7;
  uint64_t v35 = 0;
  id v36 = &v35;
  uint64_t v37 = 0x3032000000;
  id v38 = __Block_byref_object_copy__11;
  __int16 v39 = __Block_byref_object_dispose__11;
  id v40 = 0;
  uint64_t v31 = 0;
  uint64_t v32 = &v31;
  uint64_t v33 = 0x2020000000;
  char v34 = 0;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v14 = [v13 countByEnumeratingWithState:&v27 objects:v47 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v28 != v15) {
          objc_enumerationMutation(v13);
        }
        uint64_t v17 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        uint64_t v18 = objc_msgSend(v17, "length", v22, v23, v24, v25);
        v26[0] = MEMORY[0x1E4F143A8];
        v26[1] = 3221225472;
        v26[2] = __77__SSWorldClockUtilities_parseQueryForWorldClock_forceLoad_completionHandler___block_invoke;
        v26[3] = &unk_1E635AA10;
        v26[4] = &v35;
        v26[5] = &v31;
        objc_msgSend(v17, "enumerateAttributesInRange:options:usingBlock:", 0, v18, 0, v26);
      }
      uint64_t v14 = [v13 countByEnumeratingWithState:&v27 objects:v47 count:16];
    }
    while (v14);
  }

  v19 = WorldClockDebugLog();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v20 = v36[5];
    int v21 = *((unsigned __int8 *)v32 + 24);
    *(_DWORD *)buf = 138412802;
    long long v42 = v25;
    __int16 v43 = 2112;
    uint64_t v44 = v20;
    __int16 v45 = 1024;
    int v46 = v21;
    _os_log_debug_impl(&dword_1BDB2A000, v19, OS_LOG_TYPE_DEBUG, "Parsing query “%@“ for World Clock: location string parsed: %@, isTimeZoneQuery: %d", buf, 0x1Cu);
  }

  v24[2](v24, v36[5], *((unsigned __int8 *)v32 + 24));
  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v35, 8);
}

uint64_t __77__SSWorldClockUtilities_parseQueryForWorldClock_forceLoad_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __77__SSWorldClockUtilities_parseQueryForWorldClock_forceLoad_completionHandler___block_invoke_2;
  v8[3] = &unk_1E635A9E8;
  long long v9 = *(_OWORD *)(a1 + 32);
  uint64_t result = [a2 enumerateKeysAndObjectsUsingBlock:v8];
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)) {
    *a5 = 1;
  }
  return result;
}

void __77__SSWorldClockUtilities_parseQueryForWorldClock_forceLoad_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v11 = a3;
  id v8 = a2;
  char v9 = [v8 isEqualToString:@"kQPTimeLocation"];
  int v10 = [v8 isEqualToString:@"kQPTimezoneLocation"];

  if ((v9 & 1) != 0 || v10)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v10;
    *a4 = 1;
  }
}

+ (id)formattedTimeForDate:(id)a3 timeZone:(id)a4
{
  uint64_t v5 = formattedTimeForDate_timeZone__onceToken;
  id v6 = a4;
  id v7 = a3;
  if (v5 != -1) {
    dispatch_once(&formattedTimeForDate_timeZone__onceToken, &__block_literal_global_344);
  }
  [(id)formattedTimeForDate_timeZone__formatter setTimeZone:v6];

  id v8 = [(id)formattedTimeForDate_timeZone__formatter stringFromDate:v7];

  return v8;
}

uint64_t __55__SSWorldClockUtilities_formattedTimeForDate_timeZone___block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)formattedTimeForDate_timeZone__formatter;
  formattedTimeForDate_timeZone__formatter = v0;

  id v2 = (void *)formattedTimeForDate_timeZone__formatter;
  return [v2 setTimeStyle:1];
}

+ (id)timeZoneOffsetDescriptionForDate:(id)a3 timeZone:(id)a4
{
  id v5 = a3;
  uint64_t v6 = [a4 secondsFromGMT];
  id v7 = [MEMORY[0x1E4F1CAF0] localTimeZone];
  uint64_t v8 = [v7 secondsFromGMT];

  uint64_t v9 = v6 - v8;
  if (v6 == v8)
  {
    int v10 = 0;
  }
  else
  {
    id v11 = [v5 dateByAddingTimeInterval:(double)v9];
    id v12 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    char v13 = [v12 isDate:v5 inSameDayAsDate:v11];

    if (v13)
    {
      uint64_t v14 = 0;
    }
    else
    {
      if (timeZoneOffsetDescriptionForDate_timeZone__onceToken != -1) {
        dispatch_once(&timeZoneOffsetDescriptionForDate_timeZone__onceToken, &__block_literal_global_347);
      }
      uint64_t v14 = [(id)timeZoneOffsetDescriptionForDate_timeZone__formatter stringFromDate:v11];
    }
    if (timeZoneOffsetDescriptionForDate_timeZone__onceToken_348 != -1) {
      dispatch_once(&timeZoneOffsetDescriptionForDate_timeZone__onceToken_348, &__block_literal_global_350);
    }
    uint64_t v15 = [(id)timeZoneOffsetDescriptionForDate_timeZone__offsetFormatter stringFromTimeInterval:(double)v9];
    if ((v9 & 0x8000000000000000) == 0)
    {
      uint64_t v16 = NSString;
      uint64_t v17 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      uint64_t v18 = [v17 localizedStringForKey:@"POSITIVE_TIME_FORMAT" value:&stru_1F1824018 table:@"SpotlightServices"];
      uint64_t v19 = objc_msgSend(v16, "stringWithFormat:", v18, v15);

      uint64_t v15 = (void *)v19;
    }
    uint64_t v20 = @"TIME_ZONE_OFFSET_FORMAT_HOURS";
    if (v9 >= 0) {
      unint64_t v21 = v9;
    }
    else {
      unint64_t v21 = -v9;
    }
    if (v21 < 0xE10) {
      uint64_t v20 = @"TIME_ZONE_OFFSET_FORMAT_MINUTES";
    }
    v22 = NSString;
    v23 = (void *)MEMORY[0x1E4F28B50];
    v24 = v20;
    uint64_t v25 = [v23 bundleForClass:objc_opt_class()];
    uint64_t v26 = [v25 localizedStringForKey:v24 value:&stru_1F1824018 table:@"SpotlightServices"];

    int v10 = objc_msgSend(v22, "stringWithFormat:", v26, v15);

    if (v14)
    {
      long long v27 = NSString;
      long long v28 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      long long v29 = [v28 localizedStringForKey:@"TIME_ZONE_DATE_AND_OFFSET_FORMAT" value:&stru_1F1824018 table:@"SpotlightServices"];
      uint64_t v30 = objc_msgSend(v27, "stringWithFormat:", v29, v14, v10);

      int v10 = (void *)v30;
    }
  }
  return v10;
}

uint64_t __67__SSWorldClockUtilities_timeZoneOffsetDescriptionForDate_timeZone___block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)timeZoneOffsetDescriptionForDate_timeZone__formatter;
  timeZoneOffsetDescriptionForDate_timeZone__formatter = v0;

  [(id)timeZoneOffsetDescriptionForDate_timeZone__formatter setDateStyle:1];
  [(id)timeZoneOffsetDescriptionForDate_timeZone__formatter setTimeStyle:0];
  id v2 = (void *)timeZoneOffsetDescriptionForDate_timeZone__formatter;
  return [v2 setDoesRelativeDateFormatting:1];
}

uint64_t __67__SSWorldClockUtilities_timeZoneOffsetDescriptionForDate_timeZone___block_invoke_2()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)timeZoneOffsetDescriptionForDate_timeZone__offsetFormatter;
  timeZoneOffsetDescriptionForDate_timeZone__offsetFormatter = v0;

  [(id)timeZoneOffsetDescriptionForDate_timeZone__offsetFormatter setUnitsStyle:0];
  id v2 = (void *)timeZoneOffsetDescriptionForDate_timeZone__offsetFormatter;
  return [v2 setZeroFormattingBehavior:14];
}

+ (id)clockImageForDate:(id)a3 timeZone:(id)a4 latitude:(double)a5 longitude:(double)a6
{
  uint64_t v9 = (void *)MEMORY[0x1E4F1C9A8];
  id v10 = a4;
  id v11 = a3;
  id v12 = [v9 currentCalendar];
  char v13 = [v12 componentsInTimeZone:v10 fromDate:v11];

  uint64_t v14 = objc_opt_new();
  [v11 timeIntervalSinceReferenceDate];
  double v16 = v15;

  objc_msgSend(v14, "calculateAstronomicalTimeForLocation:time:", a5, a6, v16);
  int v17 = [v14 isDayLight];
  uint64_t v18 = [v13 hour];
  uint64_t v19 = v18 + 12;
  if (v17) {
    uint64_t v19 = v18;
  }
  if (v18 > 11) {
    uint64_t v19 = v18;
  }
  if (v18 < 12 || v17 == 0) {
    uint64_t v21 = v19;
  }
  else {
    uint64_t v21 = v18 - 12;
  }
  v22 = objc_opt_new();
  v23 = [MEMORY[0x1E4F28ED0] numberWithInteger:v21];
  [v22 setHour:v23];

  v24 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", objc_msgSend(v13, "minute"));
  [v22 setMinute:v24];

  return v22;
}

void __70__SSWorldClockUtilities_timeZoneMatchesForLocation_completionHandler___block_invoke_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_1BDB2A000, a2, OS_LOG_TYPE_DEBUG, "Returning on-device city results for location “%@“", (uint8_t *)&v3, 0xCu);
}

void __70__SSWorldClockUtilities_timeZoneMatchesForLocation_completionHandler___block_invoke_cold_2(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_1BDB2A000, a2, OS_LOG_TYPE_DEBUG, "Returning GEOServices result for location “%@“", (uint8_t *)&v3, 0xCu);
}

void __70__SSWorldClockUtilities_timeZoneMatchesForLocation_completionHandler___block_invoke_cold_3(uint64_t *a1, void *a2, NSObject *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = *a1;
  uint64_t v6 = [a2 location];
  id v7 = [a2 timeZone];
  uint64_t v8 = [a2 countryCode];
  int v9 = 138413058;
  uint64_t v10 = v5;
  __int16 v11 = 2112;
  id v12 = v6;
  __int16 v13 = 2112;
  uint64_t v14 = v7;
  __int16 v15 = 2112;
  double v16 = v8;
  _os_log_debug_impl(&dword_1BDB2A000, a3, OS_LOG_TYPE_DEBUG, "First result from on-device cities for location “%@“: %@ (time zone: %@, country code: %@)", (uint8_t *)&v9, 0x2Au);
}

+ (void)onDeviceResultsForLocationQuery:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_debug_impl(&dword_1BDB2A000, log, OS_LOG_TYPE_DEBUG, "[ALCityManager citiesMatchingName:] for location “%@“: %@", (uint8_t *)&v3, 0x16u);
}

@end