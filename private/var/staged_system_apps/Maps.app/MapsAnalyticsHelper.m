@interface MapsAnalyticsHelper
+ (id)acSuggestionEntriesFromAutoCompleteObjects:(id)a3 context:(id)a4 mapsSuggestionsInsights:(id)a5 skipReportASearchItems:(BOOL)a6 traits:(id)a7;
+ (id)acSuggestionEntriesFromAutoCompleteObjects:(id)a3 personalizedItems:(id)a4 context:(id)a5 mapsSuggestionsInsights:(id)a6 skipReportASearchItems:(BOOL)a7 traits:(id)a8 usedForLogging:(BOOL)a9 shouldUseDistanceFeatureServerResults:(BOOL)a10;
+ (id)acSuggestionEntriesFromSections:(id)a3 personalizedItems:(id)a4 context:(id)a5 mapsSuggestionsInsights:(id)a6 skipReportASearchItems:(BOOL)a7 selectedChildItemIndexPath:(id)a8 indexOfResultWithSelectedChildItem:(id)a9 traits:(id)a10 usedForLogging:(BOOL)a11 shouldUseDistanceFeatureServerResults:(BOOL)a12 placeSummaryMetadata:(id)a13;
+ (id)analyticsResultsInfoArrayFromAutoCompleteResultsArray:(id)a3 selectedIndex:(unint64_t)a4;
+ (id)hyperlinkMetadataWithTemplate:(id)a3 mapItem:(id)a4 metadata:(id)a5;
- (GEOPlaceActionDetails)actionDetails;
- (MapsAnalyticsHelper)init;
- (MapsAnalyticsHelper)initWithLabelMarker:(id)a3;
- (MapsAnalyticsHelper)initWithMapItem:(id)a3;
- (NSString)eventValue;
- (id)populateTapEvent;
- (int)tapAction;
- (int)target;
@end

@implementation MapsAnalyticsHelper

+ (id)analyticsResultsInfoArrayFromAutoCompleteResultsArray:(id)a3 selectedIndex:(unint64_t)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init((Class)NSMutableArray);
  if ([v5 count])
  {
    uint64_t v7 = 0;
    uint64_t v37 = CRRecentContactMetadataFrom;
    uint64_t v36 = CRRecentContactMetadataFromAddressKind;
    v8 = &OBJC_METACLASS___GeoRequestCounterInterfaces;
    v9 = &NavigationConfig_Dodgeball_ETAU_FakeIncidentHideTriggerPointAllowTruncating_ptr;
    uint64_t v34 = CRAddressKindPhoneNumber;
    uint64_t v35 = CRAddressKindEmail;
    while (1)
    {
      v10 = [v5 objectAtIndexedSubscript:v7];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v11 = [v10 autocompleteObject];

        v10 = (void *)v11;
      }
      id v12 = objc_alloc_init((Class)v9[265]);
      [v12 setSuggestionsAcType:0];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
      [v12 setSuggestionsAcType:10];
      if (a4 == v7) {
        goto LABEL_22;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v12 setSuggestionsAcType:4];
        id v15 = v10;
        [v15 historyEntry];
        id v16 = v5;
        id v17 = v6;
        unint64_t v18 = a4;
        v20 = v19 = v8;
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        uint64_t v22 = 4;
        v8 = v19;
        a4 = v18;
        id v6 = v17;
        id v5 = v16;
        if (isKindOfClass) {
          goto LABEL_20;
        }
        v23 = [v15 historyEntry:4];
        objc_opt_class();
        char v24 = objc_opt_isKindOfClass();

        if (v24)
        {
          uint64_t v22 = 6;
          goto LABEL_20;
        }
        v25 = [v15 historyEntry];
        objc_opt_class();
        char v26 = objc_opt_isKindOfClass();

        if (v26)
        {
          uint64_t v22 = 5;
LABEL_20:
          [v12 setSuggestionsAcType:v22];
        }

        v9 = &NavigationConfig_Dodgeball_ETAU_FakeIncidentHideTriggerPointAllowTruncating_ptr;
        goto LABEL_22;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v13 = v12;
        uint64_t v14 = 7;
        goto LABEL_7;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
      {
        v13 = v12;
        uint64_t v14 = 1;
        goto LABEL_7;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v12 setSuggestionsAcType:3];
        v27 = [v10 metadata];
        v28 = [v27 objectForKeyedSubscript:v37];

        v9 = &NavigationConfig_Dodgeball_ETAU_FakeIncidentHideTriggerPointAllowTruncating_ptr;
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v29 = [v28 objectForKeyedSubscript:v36];
          if ([v29 isEqual:v35])
          {
            uint64_t v30 = 3;
            goto LABEL_38;
          }
          if ([v29 isEqual:v34])
          {
            uint64_t v30 = 2;
LABEL_38:
            [v12 setSuggestionsAcType:v30];
          }
        }
        goto LABEL_22;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v31 = v10;
        if ([v31 type] != 4 && objc_msgSend(v31, "type") != 3) {
          [v12 setSuggestionsAcType:8];
        }

        goto LABEL_22;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        unint64_t v32 = (unint64_t)[v10 type] - 1;
        if (v32 > 5) {
          uint64_t v14 = 10;
        }
        else {
          uint64_t v14 = dword_100F72A00[v32];
        }
        v13 = v12;
        goto LABEL_7;
      }
LABEL_22:
      [v6 addObject:v12];

      if (++v7 >= (unint64_t)[v5 count]) {
        goto LABEL_43;
      }
    }
    v13 = v12;
    uint64_t v14 = 9;
LABEL_7:
    [v13 setSuggestionsAcType:v14];
    goto LABEL_22;
  }
LABEL_43:

  return v6;
}

+ (id)acSuggestionEntriesFromAutoCompleteObjects:(id)a3 context:(id)a4 mapsSuggestionsInsights:(id)a5 skipReportASearchItems:(BOOL)a6 traits:(id)a7
{
  LOWORD(v8) = 1;
  return [a1 acSuggestionEntriesFromAutoCompleteObjects:a3 personalizedItems:a4 context:a5 mapsSuggestionsInsights:a6 skipReportASearchItems:a7 traits:a8 usedForLogging:v8 shouldUseDistanceFeatureServerResults:0];
}

+ (id)acSuggestionEntriesFromAutoCompleteObjects:(id)a3 personalizedItems:(id)a4 context:(id)a5 mapsSuggestionsInsights:(id)a6 skipReportASearchItems:(BOOL)a7 traits:(id)a8 usedForLogging:(BOOL)a9 shouldUseDistanceFeatureServerResults:(BOOL)a10
{
  BOOL v11 = a7;
  BOOL v16 = a9;
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  id v21 = a8;
  if ([v17 count])
  {
    uint64_t v29 = +[AutocompleteSection sectionWithTitle:0 items:v17 isQuerySuggestionsSection:0];
    id v22 = a1;
    BOOL v23 = v11;
    char v24 = (void *)v29;
    v25 = +[NSArray arrayWithObjects:&v29 count:1];

    BOOL v11 = v23;
    a1 = v22;
    BOOL v16 = a9;
  }
  else
  {
    v25 = &__NSArray0__struct;
  }
  BYTE1(v28) = a10;
  LOBYTE(v28) = v16;
  char v26 = [a1 acSuggestionEntriesFromSections:v25 personalizedItems:v18 context:v19 mapsSuggestionsInsights:v20 skipReportASearchItems:0 selectedChildItemIndexPath:0 indexOfResultWithSelectedChildItem:0 traits:v21 usedForLogging:0 shouldUseDistanceFeatureServerResults:v28 placeSummaryMetadata:0];

  return v26;
}

+ (id)acSuggestionEntriesFromSections:(id)a3 personalizedItems:(id)a4 context:(id)a5 mapsSuggestionsInsights:(id)a6 skipReportASearchItems:(BOOL)a7 selectedChildItemIndexPath:(id)a8 indexOfResultWithSelectedChildItem:(id)a9 traits:(id)a10 usedForLogging:(BOOL)a11 shouldUseDistanceFeatureServerResults:(BOOL)a12 placeSummaryMetadata:(id)a13
{
  id v339 = a3;
  id v17 = a4;
  id v318 = a5;
  id v305 = a6;
  id v309 = a8;
  id v315 = a9;
  id v18 = a10;
  id v322 = a13;
  v304 = v18;
  id v324 = [v18 copy];
  v355 = v17;
  if (v17)
  {
    long long v408 = 0u;
    long long v407 = 0u;
    long long v406 = 0u;
    long long v405 = 0u;
    id obj = v339;
    id v351 = [obj countByEnumeratingWithState:&v405 objects:v423 count:16];
    if (v351)
    {
      uint64_t v348 = *(void *)v406;
      do
      {
        uint64_t v19 = 0;
        do
        {
          if (*(void *)v406 != v348)
          {
            uint64_t v20 = v19;
            objc_enumerationMutation(obj);
            uint64_t v19 = v20;
          }
          uint64_t v353 = v19;
          id v21 = *(void **)(*((void *)&v405 + 1) + 8 * v19);
          id v22 = [v21 items];
          BOOL v23 = [v22 count] == 0;

          if (!v23)
          {
            unint64_t v24 = 0;
            do
            {
              v25 = [v355 objectAtIndexedSubscript:v24];
              char v26 = [v21 items];
              v27 = [v26 objectAtIndexedSubscript:v24];
              BOOL v28 = v25 == v27;

              if (!v28)
              {
                uint64_t v29 = [v21 items];
                uint64_t v30 = [v29 objectAtIndexedSubscript:v24];

                objc_opt_class();
                if (objc_opt_isKindOfClass()) {
                  id v31 = v30;
                }
                else {
                  id v31 = 0;
                }
                id v32 = v31;

                long long v404 = 0u;
                long long v403 = 0u;
                long long v402 = 0u;
                long long v401 = 0u;
                v33 = [v32 items];
                id v34 = [v33 countByEnumeratingWithState:&v401 objects:v422 count:16];
                if (v34)
                {
                  uint64_t v35 = *(void *)v402;
LABEL_15:
                  uint64_t v36 = 0;
                  while (1)
                  {
                    if (*(void *)v402 != v35) {
                      objc_enumerationMutation(v33);
                    }
                    uint64_t v37 = [*(id *)(*((void *)&v401 + 1) + 8 * v36) autocompleteObject];
                    v38 = [v355 objectAtIndexedSubscript:v24];
                    v39 = [v38 autocompleteObject];
                    BOOL v40 = v37 == v39;

                    if (v40) {
                      break;
                    }
                    if (v34 == (id)++v36)
                    {
                      id v34 = [v33 countByEnumeratingWithState:&v401 objects:v422 count:16];
                      if (v34) {
                        goto LABEL_15;
                      }
                      break;
                    }
                  }
                }
              }
              v41 = [v21 items];
              id v42 = [v41 count];

              ++v24;
            }
            while (v24 < (unint64_t)v42);
          }
          uint64_t v19 = v353 + 1;
        }
        while ((id)(v353 + 1) != v351);
        id v351 = [obj countByEnumeratingWithState:&v405 objects:v423 count:16];
      }
      while (v351);
    }
  }
  v43 = +[MKLocationManager sharedLocationManager];
  v306 = [v43 currentLocation];

  if (v306)
  {
    [v306 coordinate];
    double v312 = v44;
    double v46 = v45;
  }
  else
  {
    double v46 = -180.0;
    double v312 = -180.0;
  }
  id v327 = +[NSMutableArray array];
  v325 = +[NSMutableArray array];
  v326 = +[NSMutableArray array];
  long long v399 = 0u;
  long long v400 = 0u;
  long long v397 = 0u;
  long long v398 = 0u;
  id v311 = v339;
  id v308 = [v311 countByEnumeratingWithState:&v397 objects:v421 count:16];
  if (v308)
  {
    BOOL v47 = v312 < -180.0;
    if (v312 > 180.0) {
      BOOL v47 = 1;
    }
    BOOL v316 = v47;
    uint64_t v307 = *(void *)v398;
    do
    {
      uint64_t v48 = 0;
      do
      {
        if (*(void *)v398 != v307)
        {
          uint64_t v49 = v48;
          objc_enumerationMutation(v311);
          uint64_t v48 = v49;
        }
        uint64_t v310 = v48;
        v328 = *(void **)(*((void *)&v397 + 1) + 8 * v48);
        v50 = [v328 items];
        BOOL v51 = [v50 count] == 0;

        if (!v51)
        {
          v335 = 0;
          while (1)
          {
            v52 = [v328 items];
            v349 = [v52 objectAtIndexedSubscript:v335];

            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0
              || ([v349 autocompleteObject],
                  v53 = objc_claimAutoreleasedReturnValue(),
                  BOOL v54 = v53 == 0,
                  v53,
                  v54))
            {
              id v337 = 0;
            }
            else
            {
              id v337 = v349;
              v349 = [v337 autocompleteObject];
            }
            id v55 = objc_alloc_init((Class)GEOClientACSuggestionEntry);
            uint64_t v56 = [v355 objectAtIndexedSubscript:v335];
            v57 = (void *)v56;
            v58 = v337;
            if (v56) {
              v58 = (void *)v56;
            }
            id v331 = v58;

            v59 = v337;
            if (([v337 hasServerItemIndex] & 1) != 0
              || (v59 = v331, [v331 hasServerItemIndex]))
            {
              [v55 setServerSectionIndex:[v59 serverSectionIndex]];
              [v55 setServerItemIndexInSection:[v59 serverItemIndexInSection]];
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              break;
            }
            if (!a7)
            {
              [v327 addObject:v55];
              v60 = +[NSNull null];
              [v325 addObject:v60];

              v340 = +[NSNull null];
              [v326 addObject:v340];
            }
LABEL_216:

            v176 = [v328 items];
            v177 = (char *)[v176 count];

            if (++v335 >= v177) {
              goto LABEL_259;
            }
          }
          v61 = [v318 matchInfoForObject:v349];
          if (v61)
          {
            id v341 = v61;
          }
          else
          {
            id v341 = [v337 matchInfo];

            if (!v341)
            {
              if ([v349 conformsToProtocol:&OBJC_PROTOCOL___AutocompleteItemWithMatchInfo])
              {
                id v341 = [v349 matchInfo];
              }
              else
              {
                id v341 = 0;
              }
            }
          }
          *(void *)buf = 0;
          *(void *)&buf[8] = buf;
          *(void *)&buf[16] = 0x3032000000;
          v418 = sub_100104144;
          v419 = sub_100104920;
          id v420 = 0;
          [v55 setSuggestionType:0];
          [v55 setShownToUser:[v341 shownToUser]];
          v62 = [v337 autocompleteAnalytics];
          unsigned int v63 = [v62 hasDiscreteFeatureValuesContributedToLatestClientRankingScore];

          if (v63)
          {
            v64 = [v337 autocompleteAnalytics];
            [v55 setDiscreteFeatureValuesAvailable:[v64 discreteFeatureValuesContributedToLatestClientRankingScore]];
          }
          uint64_t v392 = 0;
          v393 = &v392;
          uint64_t v394 = 0x3010000000;
          v395 = &unk_1011B93F2;
          long long v396 = xmmword_100F729F0;
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            [v55 setSuggestionType:9];
            id v65 = v349;
            v66 = [v65 mapItem];
            uint64_t v67 = [v66 _geoMapItem];
            v68 = *(void **)(*(void *)&buf[8] + 40);
            *(void *)(*(void *)&buf[8] + 40) = v67;

            long long v391 = 0uLL;
            if ([v65 getCoordinate:&v391])
            {
              *((_OWORD *)v393 + 2) = v391;
              if (!*(void *)(*(void *)&buf[8] + 40))
              {
                id v69 = objc_alloc((Class)CLLocation);
                id v70 = [v69 initWithLatitude:v391];
                id v71 = [objc_alloc((Class)MKMapItem) initWithCLLocation:v70 placeType:[v65 _placeType]];
                uint64_t v72 = [v71 _geoMapItem];
                v73 = *(void **)(*(void *)&buf[8] + 40);
                *(void *)(*(void *)&buf[8] + 40) = v72;
              }
            }
            v74 = (char *)[v65 _type] - 1;
            if ((unint64_t)v74 < 3) {
              uint64_t v75 = (v74 + 1);
            }
            else {
              uint64_t v75 = 0;
            }
            [v55 setServerEntryType:v75];
            v76 = [v65 mapItem];
            v77 = [v76 _geoMapItem];
            v78 = [v77 _childItems];
            id v79 = [v78 count];
            if (v79)
            {
              BOOL v80 = 1;
            }
            else
            {
              v314 = [v65 childItems];
              BOOL v80 = v314 != 0;
            }
            [v55 setIsProminentResult:v80];
            if (!v79) {

            }
            v122 = (char *)[v65 autocompleteCellType] - 1;
            if ((unint64_t)v122 < 4) {
              uint64_t v123 = (v122 + 1);
            }
            else {
              uint64_t v123 = 0;
            }
            [v55 setAutocompleteResultCellType:v123];
            [v55 setTapBehavior:[v65 entryTapBehavior] == (id)1];
            if (v322)
            {
              v124 = +[PlaceSummaryTemplateFactory autocompleteTemplateWithCompletion:v65 metadata:v322];
              v125 = [v65 mapItem];
              v126 = [a1 hyperlinkMetadataWithTemplate:v124 mapItem:v125 metadata:v322];
              [v55 setHyperlinkMetadata:v126];
            }
            id v127 = objc_alloc((Class)NSMutableArray);
            v128 = [v65 childItems];
            id v129 = [v127 initWithCapacity:[v128 count]];

            long long v389 = 0u;
            long long v390 = 0u;
            long long v387 = 0u;
            long long v388 = 0u;
            v130 = [v65 childItems];
            id v131 = [v130 countByEnumeratingWithState:&v387 objects:v416 count:16];
            if (v131)
            {
              uint64_t v132 = *(void *)v388;
              do
              {
                for (i = 0; i != v131; i = (char *)i + 1)
                {
                  if (*(void *)v388 != v132) {
                    objc_enumerationMutation(v130);
                  }
                  v134 = *(void **)(*((void *)&v387 + 1) + 8 * i);
                  v135 = [v134 childItemAction];
                  BOOL v136 = [v135 childActionType] == (id)8;

                  if (v136)
                  {
                    v137 = +[MapsOfflineUIHelper sharedHelper];
                    v138 = [*(id *)(*(void *)&buf[8] + 40) offlineDownloadRegion];
                    unsigned __int8 v139 = [v137 isRegionDownloaded:v138 requireFullyDownloaded:0];

                    if (v139) {
                      continue;
                    }
                  }
                  [v129 addObject:v134];
                }
                id v131 = [v130 countByEnumeratingWithState:&v387 objects:v416 count:16];
              }
              while (v131);
            }

            if ([v129 count])
            {
              if (!v315) {
                goto LABEL_154;
              }
              id v140 = [v311 indexOfObject:v328];
              if (v140 == [v315 section])
              {
                if (v335 != [v315 row])
                {
                  id v141 = 0;
                  goto LABEL_156;
                }
LABEL_154:
                id v141 = v309;
              }
              else
              {
                id v141 = 0;
              }
LABEL_156:
              v156 = +[GEOSubactionMetaData subactionMetaDataWithChildItems:v129 selectedChildItemIndexPath:v141];
              [v55 setSubactionMetaData:v156];
            }
LABEL_157:

LABEL_158:
            v100 = 0;
LABEL_159:

LABEL_160:
            v157 = (double *)v393;
            double v158 = *((double *)v393 + 4);
            double v159 = *((double *)v393 + 5);
            BOOL v160 = v159 < -180.0;
            if (v159 > 180.0) {
              BOOL v160 = 1;
            }
            if (v158 < -90.0) {
              BOOL v160 = 1;
            }
            if (v158 > 90.0) {
              BOOL v160 = 1;
            }
            if (!v160 && !v316 && v46 >= -90.0 && v46 <= 90.0)
            {
              if (a12 && !a11
                || a11 && (unsigned int v161 = [v55 suggestionType], v157 = (double *)v393, v161 != 9))
              {
                GEOCalculateDistance();
                [v55 setDistanceToSuggestion:(int)v162];
                v157 = (double *)v393;
              }
            }
            double v163 = v157[5];
            if (v163 >= -180.0 && v163 <= 180.0)
            {
              double v164 = v157[4];
              if (v164 >= -90.0
                && v164 <= 90.0
                && [v324 hasMapRegion]
                && (!a11 || [v55 suggestionType] == 9))
              {
                v165 = [v324 mapRegion];
                [v55 setIsContainedInViewport:[v165 containsCoordinate:*((double *)v393 + 4), *((double *)v393 + 5)]];
                [v165 centerLat];
                double v167 = v166;
                [v165 centerLng];
                if (v168 >= -180.0 && v168 <= 180.0 && v167 >= -90.0 && v167 <= 90.0)
                {
                  GEOCalculateDistance();
                  [v55 setDistanceToSuggestionFromViewportCenter:];
                }
              }
            }
            if ([v324 hasTimeSinceMapViewportChanged] && !a11) {
              [v55 setTimeSinceMapViewportChangedSeconds:[v324 timeSinceMapViewportChanged]];
            }
            if (v337 && [v337 containsPossiblePersonalizedItemSourceSubtype:1]) {
              [v55 setIsFavorite:1];
            }
            if (![*(id *)(*(void *)&buf[8] + 40) _hasBusinessHours]) {
              goto LABEL_204;
            }
            if (([*(id *)(*(void *)&buf[8] + 40) _openingHoursOptions] & 0x20) != 0)
            {
              uint64_t v169 = 3;
            }
            else if (([*(id *)(*(void *)&buf[8] + 40) _openingHoursOptions] & 0x40) != 0)
            {
              uint64_t v169 = 4;
            }
            else
            {
              if (([*(id *)(*(void *)&buf[8] + 40) _openingHoursOptions] & 4) == 0
                && ([*(id *)(*(void *)&buf[8] + 40) _openingHoursOptions] & 8) == 0)
              {
                if (([*(id *)(*(void *)&buf[8] + 40) _openingHoursOptions] & 2) != 0
                  || ([*(id *)(*(void *)&buf[8] + 40) _openingHoursOptions] & 0x10) != 0)
                {
                  uint64_t v169 = 2;
                  goto LABEL_203;
                }
LABEL_204:
                uint64_t v170 = [v328 title];
                v171 = (void *)v170;
                if (v170) {
                  CFStringRef v172 = (const __CFString *)v170;
                }
                else {
                  CFStringRef v172 = &stru_101324E70;
                }
                [v55 setSuggestionSectionType:v172];

                [v327 addObject:v55];
                v173 = v100;
                if (!v100)
                {
                  v320 = +[NSNull null];
                  v173 = v320;
                }
                [v325 addObject:v173];
                if (!v100) {

                }
                v174 = *(void **)(*(void *)&buf[8] + 40);
                v175 = v174;
                if (!v174)
                {
                  v319 = +[NSNull null];
                  v175 = v319;
                }
                [v326 addObject:v175];
                if (!v174) {

                }
                _Block_object_dispose(&v392, 8);
                _Block_object_dispose(buf, 8);

                goto LABEL_216;
              }
              uint64_t v169 = 0;
            }
LABEL_203:
            [v55 setPoiOpenState:v169];
            goto LABEL_204;
          }
          [v55 setSuggestionType:10];
          [v341 fractionOfMatch];
          [v55 setFractionOfMatch:];
          v81 = [v341 prefixLastTokenMatchCover];
          BOOL v82 = v81 == 0;

          if (!v82)
          {
            v83 = [v341 prefixLastTokenMatchCover];
            [v83 floatValue];
            [v55 setPrefixLastTokenMatchCover];
          }
          v84 = [v341 prefixMatchCover];
          BOOL v85 = v84 == 0;

          if (!v85)
          {
            v86 = [v341 prefixMatchCover];
            [v86 floatValue];
            [v55 setPrefixMatchCover];
          }
          v87 = [v341 prefixMatchPosition];
          BOOL v88 = v87 == 0;

          if (!v88)
          {
            v89 = [v341 prefixMatchPosition];
            [v55 setPrefixMatchPosition:[v89 intValue]];
          }
          [v55 setPrefixMatchWordBoundary:[v341 prefixMatchesWordBoundary]];
          v90 = [v341 firstPrefixToken];
          BOOL v91 = v90 == 0;

          if (!v91)
          {
            v92 = [v341 firstPrefixToken];
            [v55 setPrefixTokenMatchLengthFirstQueryToken:[v92 matchLength]];
            [v55 setPrefixTokenMatchPositionFirstQueryToken:[v92 matchPostion]];
            [v55 setPrefixTokenIsNumberFirstQueryToken:[v92 isNumber]];
            [v55 setPrefixTokenMatchLocationFirstQueryToken:[v92 matchLocation]];
          }
          v93 = [v341 secondPrefixToken];
          BOOL v94 = v93 == 0;

          if (!v94)
          {
            v95 = [v341 secondPrefixToken];
            [v55 setPrefixTokenMatchLengthSecondQueryToken:[v95 matchLength]];
            [v55 setPrefixTokenMatchPositionSecondQueryToken:[v95 matchPostion]];
            [v55 setPrefixTokenIsNumberSecondQueryToken:[v95 isNumber]];
            [v55 setPrefixTokenMatchLocationSecondQueryToken:[v95 matchLocation]];
          }
          if (([v341 matchType] & 4) != 0) {
            [v55 setMatchedUsingAddress:1];
          }
          if (([v341 matchType] & 0x10) != 0) {
            [v55 setMatchedUsingEventName:1];
          }
          if (([v341 matchType] & 8) != 0) {
            [v55 setMatchedUsingLabel:1];
          }
          if ([v341 matchType]) {
            [v55 setMatchedUsingName:1];
          }
          if (([v341 matchType] & 2) != 0) {
            [v55 setMatchedUsingOrganization:1];
          }
          [v341 peopleSuggesterRank];
          if (v96 != 0.0)
          {
            [v341 peopleSuggesterRank];
            [v55 setPeopleSuggesterRank:(int)v97];
          }
          if (([v341 ageInSeconds] & 0x80000000) == 0) {
            [v55 setAge:[v341 ageInSeconds]];
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            [v55 setSuggestionType:4];
            v98 = [v349 historyEntry];
            v384[0] = _NSConcreteStackBlock;
            v384[1] = 3221225472;
            v384[2] = sub_100928A94;
            v384[3] = &unk_1012F18C0;
            id v385 = v55;
            v386 = &v392;
            v380[0] = _NSConcreteStackBlock;
            v380[1] = 3221225472;
            v380[2] = sub_100928B34;
            v380[3] = &unk_101302300;
            id v381 = v385;
            v382 = buf;
            v383 = &v392;
            v376[0] = _NSConcreteStackBlock;
            v376[1] = 3221225472;
            v376[2] = sub_100928C38;
            v376[3] = &unk_101302328;
            id v377 = v381;
            v378 = &v392;
            v379 = buf;
            [v98 ifSearch:v384 ifRoute:v380 ifPlaceDisplay:v376 ifTransitLineItem:&stru_101302348];

            goto LABEL_158;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            [v55 setSuggestionType:7];
            id v99 = v349;
            v100 = [v99 contact];
            v101 = [v99 geocodedMapItem];

            if (v101)
            {
              v102 = [v99 geocodedMapItem];
              [v102 _coordinate];
              uint64_t v104 = v103;
              uint64_t v106 = v105;

              v107 = v393;
              v393[4] = v104;
              v107[5] = v106;
              v108 = [v99 geocodedMapItem];
              uint64_t v109 = [v108 _geoMapItem];
              v110 = *(void **)(*(void *)&buf[8] + 40);
              *(void *)(*(void *)&buf[8] + 40) = v109;
            }
            if (a11) {
              goto LABEL_159;
            }
            long long v374 = 0u;
            long long v375 = 0u;
            long long v372 = 0u;
            long long v373 = 0u;
            v111 = [v100 postalAddresses];
            id v112 = [v111 countByEnumeratingWithState:&v372 objects:v415 count:16];
            if (v112)
            {
              uint64_t v113 = *(void *)v373;
              do
              {
                for (j = 0; j != v112; j = (char *)j + 1)
                {
                  if (*(void *)v373 != v113) {
                    objc_enumerationMutation(v111);
                  }
                  v115 = *(void **)(*((void *)&v372 + 1) + 8 * (void)j);
                  v116 = [v115 label];
                  unsigned int v117 = [v116 isEqualToString:CNLabelHome];

                  if (v117)
                  {
                    [v55 setIsContactWithHomeLocation:1];
                  }
                  else
                  {
                    v118 = [v115 label];
                    unsigned int v119 = [v118 isEqualToString:CNLabelWork];

                    if (v119)
                    {
                      [v55 setIsContactWithWorkLocation:1];
                    }
                    else
                    {
                      v120 = [v115 label];
                      unsigned int v121 = [v120 isEqualToString:CNLabelSchool];

                      if (v121) {
                        [v55 setIsContactWithSchoolLocation:1];
                      }
                      else {
                        [v55 setIsContactWithOtherLocation:1];
                      }
                    }
                  }
                }
                id v112 = [v111 countByEnumeratingWithState:&v372 objects:v415 count:16];
              }
              while (v112);
            }
            goto LABEL_254;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            [v55 setSuggestionType:7];
            id v142 = v349;
            v143 = [v142 handle];
            BOOL v144 = v143 == 0;

            if (!v144) {
              [v55 setIsContactWithLiveLocation:1];
            }
            v145 = [v142 contact];
            v100 = v145;
            if (a11) {
              goto LABEL_159;
            }
            long long v370 = 0u;
            long long v371 = 0u;
            long long v368 = 0u;
            long long v369 = 0u;
            v111 = [v145 postalAddresses];
            id v146 = [v111 countByEnumeratingWithState:&v368 objects:v414 count:16];
            if (v146)
            {
              uint64_t v147 = *(void *)v369;
              do
              {
                for (k = 0; k != v146; k = (char *)k + 1)
                {
                  if (*(void *)v369 != v147) {
                    objc_enumerationMutation(v111);
                  }
                  v149 = *(void **)(*((void *)&v368 + 1) + 8 * (void)k);
                  v150 = [v149 label];
                  unsigned int v151 = [v150 isEqualToString:CNLabelHome];

                  if (v151)
                  {
                    [v55 setIsContactWithHomeLocation:1];
                  }
                  else
                  {
                    v152 = [v149 label];
                    unsigned int v153 = [v152 isEqualToString:CNLabelWork];

                    if (v153)
                    {
                      [v55 setIsContactWithWorkLocation:1];
                    }
                    else
                    {
                      v154 = [v149 label];
                      unsigned int v155 = [v154 isEqualToString:CNLabelSchool];

                      if (v155) {
                        [v55 setIsContactWithSchoolLocation:1];
                      }
                      else {
                        [v55 setIsContactWithOtherLocation:1];
                      }
                    }
                  }
                }
                id v146 = [v111 countByEnumeratingWithState:&v368 objects:v414 count:16];
              }
              while (v146);
            }
LABEL_254:

            goto LABEL_159;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
          {
            uint64_t v178 = 1;
            goto LABEL_221;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            if ([v331 sourceType] == (id)5 && objc_msgSend(v331, "sourceSubtype") == (id)4
              || [v331 sourceType] != (id)5
              || [v331 sourceSubtype] != (id)5)
            {
              uint64_t v178 = 3;
            }
            else
            {
              uint64_t v178 = 2;
            }
LABEL_221:
            [v55 setSuggestionType:v178];
LABEL_222:
            v100 = 0;
            goto LABEL_160;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v188 = v349;
              id v189 = [v188 type];
              uint64_t v190 = 1;
              switch((unint64_t)v189)
              {
                case 1uLL:
                case 2uLL:
                case 3uLL:
                case 4uLL:
                  goto LABEL_236;
                case 5uLL:
                  uint64_t v190 = 4;
                  goto LABEL_236;
                case 6uLL:
                  [v55 setSuggestionType:8];
                  [v55 setIsFavorite:1];
                  goto LABEL_237;
                case 7uLL:
                  uint64_t v190 = 12;
                  goto LABEL_236;
                default:
                  uint64_t v190 = 10;
LABEL_236:
                  [v55 setSuggestionType:v190];
LABEL_237:
                  v191 = [v188 MKMapItem];
                  id v129 = v191;
                  if (v191)
                  {
                    [v191 _coordinate];
                    v192 = v393;
                    v393[4] = v193;
                    v192[5] = v194;
                    uint64_t v195 = [v129 _geoMapItem];
                    v196 = *(void **)(*(void *)&buf[8] + 40);
                    *(void *)(*(void *)&buf[8] + 40) = v195;
                  }
                  break;
              }
              goto LABEL_157;
            }
            if ([v349 conformsToProtocol:&OBJC_PROTOCOL___PersonalizedItem])
            {
              id v197 = v349;
              v111 = [v197 mapItem];
              uint64_t v198 = [v111 _geoMapItem];
              v199 = *(void **)(*(void *)&buf[8] + 40);
              *(void *)(*(void *)&buf[8] + 40) = v198;

              if (v111)
              {
                [v111 _coordinate];
                v200 = v393;
                v393[4] = v201;
                v200[5] = v202;
              }
              v203 = [v197 address];
              BOOL v204 = v203 == 0;

              if (v204)
              {
                v214 = [v197 locationOfInterest];
                BOOL v215 = v214 == 0;

                if (v215) {
                  uint64_t v216 = 10;
                }
                else {
                  uint64_t v216 = 1;
                }
                [v55 setSuggestionType:v216];
                v100 = 0;
              }
              else
              {
                [v55 setSuggestionType:7];
                v205 = [v197 address];
                v100 = [v205 contact];
              }
              goto LABEL_254;
            }
            goto LABEL_222;
          }
          id v179 = v349;
          v180 = [v179 mapItem];
          uint64_t v181 = [v180 _geoMapItem];
          v182 = *(void **)(*(void *)&buf[8] + 40);
          *(void *)(*(void *)&buf[8] + 40) = v181;

          [v179 coordinate];
          double v184 = v183;
          double v186 = v185;
          unsigned int v187 = [v179 type];
          if (v187 == 3)
          {
            uint64_t v206 = 13;
          }
          else
          {
            if (v187 == 4)
            {
              [v55 setSuggestionType:11];
              double v184 = v46;
              double v186 = v312;
              goto LABEL_248;
            }
            uint64_t v206 = 8;
          }
          [v55 setSuggestionType:v206];
LABEL_248:
          v207 = (double *)v393;
          *((double *)v393 + 4) = v184;
          v207[5] = v186;
          v208 = [v179 mapItem];
          v209 = [v208 _geoMapItem];
          v210 = [v209 _childItems];
          [v55 setIsProminentResult:[v210 count] != 0];

          if (v322)
          {
            v211 = +[PlaceSummaryTemplateFactory autocompleteTemplateWithSearchResult:v179];
            v212 = [v179 mapItem];
            v213 = [a1 hyperlinkMetadataWithTemplate:v211 mapItem:v212 metadata:v322];
            [v55 setHyperlinkMetadata:v213];
          }
          goto LABEL_158;
        }
LABEL_259:
        uint64_t v48 = v310 + 1;
      }
      while ((id)(v310 + 1) != v308);
      id v308 = [v311 countByEnumeratingWithState:&v397 objects:v421 count:16];
    }
    while (v308);
  }

  if (!v305) {
    goto LABEL_357;
  }
  v338 = +[NSMutableArray array];
  v336 = +[NSMutableArray array];
  v354 = +[NSMutableArray array];
  v350 = +[NSMutableArray array];
  v352 = +[NSMutableArray array];
  long long v366 = 0u;
  long long v367 = 0u;
  long long v364 = 0u;
  long long v365 = 0u;
  id v321 = v311;
  id v329 = [v321 countByEnumeratingWithState:&v364 objects:v413 count:16];
  if (!v329) {
    goto LABEL_302;
  }
  uint64_t v323 = *(void *)v365;
  do
  {
    uint64_t v217 = 0;
    do
    {
      if (*(void *)v365 != v323)
      {
        uint64_t v218 = v217;
        objc_enumerationMutation(v321);
        uint64_t v217 = v218;
      }
      uint64_t v332 = v217;
      v342 = *(void **)(*((void *)&v364 + 1) + 8 * v217);
      v219 = [v342 items];
      BOOL v220 = [v219 count] == 0;

      if (!v220)
      {
        uint64_t v221 = 0;
        while (1)
        {
          id v222 = [v326 objectAtIndexedSubscript:v221];
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            break;
          }
          id obja = [v326 objectAtIndexedSubscript:v221];

          if (obja)
          {
            +[GEOMapItemStorage mapItemStorageForGEOMapItem:](GEOMapItemStorage, "mapItemStorageForGEOMapItem:");
            id v222 = (id)objc_claimAutoreleasedReturnValue();

            if (!v222) {
              goto LABEL_276;
            }
            [v338 addObject:v222];
            v223 = +[NSNumber numberWithUnsignedInteger:v221];
            [v336 addObject:v223];

            goto LABEL_274;
          }
          id obja = 0;
LABEL_276:
          v224 = [v325 objectAtIndexedSubscript:v221];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v225 = 0;
          }
          else
          {
            id v225 = [v325 objectAtIndexedSubscript:v221];

            if (!v225) {
              goto LABEL_288;
            }
            if ([v354 count])
            {
              unint64_t v226 = 0;
              char v227 = 0;
              do
              {
                while (1)
                {
                  v228 = [v354 objectAtIndexedSubscript:v226];
                  v229 = [v228 identifier];
                  v230 = [v225 identifier];
                  unsigned __int8 v231 = [v229 isEqualToString:v230];

                  if ((v231 & 1) == 0) {
                    break;
                  }
                  v232 = [v352 objectAtIndexedSubscript:v226];
                  v233 = +[NSNumber numberWithUnsignedInteger:v221];
                  v234 = [v232 arrayByAddingObject:v233];
                  [v352 setObject:v234 atIndexedSubscript:v226];

                  ++v226;
                  char v227 = 1;
                  if (v226 >= (unint64_t)[v354 count]) {
                    goto LABEL_288;
                  }
                }
                ++v226;
              }
              while (v226 < (unint64_t)[v354 count]);
              if (v227) {
                goto LABEL_288;
              }
            }
            v237 = [v225 postalAddresses];
            BOOL v238 = [v237 count] == 0;

            if (v238)
            {
              [v354 addObject:v225];
              v245 = +[NSNull null];
              [v350 addObject:v245];

              v224 = +[NSNumber numberWithUnsignedInteger:v221];
              v410 = v224;
              v246 = +[NSArray arrayWithObjects:&v410 count:1];
              [v352 addObject:v246];
            }
            else
            {
              long long v362 = 0u;
              long long v363 = 0u;
              long long v360 = 0u;
              long long v361 = 0u;
              v224 = [v225 postalAddresses];
              id v239 = [v224 countByEnumeratingWithState:&v360 objects:v412 count:16];
              if (v239)
              {
                uint64_t v240 = *(void *)v361;
                do
                {
                  for (m = 0; m != v239; m = (char *)m + 1)
                  {
                    if (*(void *)v361 != v240) {
                      objc_enumerationMutation(v224);
                    }
                    uint64_t v242 = *(void *)(*((void *)&v360 + 1) + 8 * (void)m);
                    [v354 addObject:v225];
                    [v350 addObject:v242];
                    v243 = +[NSNumber numberWithUnsignedInteger:v221];
                    v411 = v243;
                    v244 = +[NSArray arrayWithObjects:&v411 count:1];
                    [v352 addObject:v244];
                  }
                  id v239 = [v224 countByEnumeratingWithState:&v360 objects:v412 count:16];
                }
                while (v239);
              }
            }
          }

LABEL_288:
          v235 = [v342 items];
          id v236 = [v235 count];

          if (++v221 >= (unint64_t)v236) {
            goto LABEL_300;
          }
        }
        id obja = 0;
LABEL_274:

        goto LABEL_276;
      }
LABEL_300:
      uint64_t v217 = v332 + 1;
    }
    while ((id)(v332 + 1) != v329);
    id v329 = [v321 countByEnumeratingWithState:&v364 objects:v413 count:16];
  }
  while (v329);
LABEL_302:

  if ([v338 count])
  {
    id v247 = [v305 confidenceScoresForMapItems:v338];
  }
  else
  {
    id v247 = 0;
  }
  if (+[AddressBookManager addressBookAllowed]
    && [v354 count])
  {
    id objb = [v305 confidenceScoresForContacts:v354 addresses:v350];
  }
  else
  {
    id objb = 0;
  }
  if ([v338 count])
  {
    unint64_t v248 = 0;
    do
    {
      if ((unint64_t)[v247 count] > v248)
      {
        if (MapsSuggestionsLoggingIsVerbose())
        {
          GEOFindOrCreateLog();
          v249 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v249, OS_LOG_TYPE_DEBUG))
          {
            v250 = [v247 objectAtIndexedSubscript:v248];
            [v250 confidence];
            uint64_t v252 = v251;
            v253 = [v247 objectAtIndexedSubscript:v248];
            v254 = [v253 lastInteractionTime];
            *(_DWORD *)buf = 134218242;
            *(void *)&buf[4] = v252;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v254;
            _os_log_impl((void *)&_mh_execute_header, v249, OS_LOG_TYPE_DEBUG, "confidence: %f, time: %@", buf, 0x16u);
          }
        }
        v255 = [v247 objectAtIndexedSubscript:v248];
        [v255 confidence];
        double v257 = v256;

        v343 = [v247 objectAtIndexedSubscript:v248];
        v333 = [v343 lastInteractionTime];
        [v333 timeIntervalSinceNow];
        LODWORD(v255) = v258 >= 0.0;
        v259 = [v247 objectAtIndexedSubscript:v248];
        v260 = [v259 lastInteractionTime];
        [v260 timeIntervalSinceNow];
        if (!v255) {
          double v261 = -v261;
        }
        double v262 = 0.0;
        if (v261 > 0.0)
        {
          v330 = [v247 objectAtIndexedSubscript:v248];
          v263 = [v330 lastInteractionTime];
          [v263 timeIntervalSinceNow];
          BOOL v265 = v264 < 0.0;
          v266 = [v247 objectAtIndexedSubscript:v248];
          v267 = [v266 lastInteractionTime];
          [v267 timeIntervalSinceNow];
          if (v265) {
            double v262 = -v268;
          }
          else {
            double v262 = v268;
          }
        }
        v269 = [v336 objectAtIndexedSubscript:v248];
        id v270 = [v269 unsignedIntegerValue];

        v271 = [v327 objectAtIndexedSubscript:v270];
        [v271 setMapsSuggestionsPoiRevelanceScore:v257];

        v272 = [v327 objectAtIndexedSubscript:v270];
        [v272 setTimeSinceLastInteractedSeconds:v262];
      }
      ++v248;
    }
    while (v248 < (unint64_t)[v338 count]);
  }
  if ([v354 count])
  {
    unint64_t v273 = 0;
    do
    {
      if ((unint64_t)[objb count] > v273)
      {
        if (MapsSuggestionsLoggingIsVerbose())
        {
          GEOFindOrCreateLog();
          v274 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v274, OS_LOG_TYPE_DEBUG))
          {
            v275 = [objb objectAtIndexedSubscript:v273];
            [v275 confidence];
            uint64_t v277 = v276;
            v278 = [objb objectAtIndexedSubscript:v273];
            v279 = [v278 lastInteractionTime];
            *(_DWORD *)buf = 134218242;
            *(void *)&buf[4] = v277;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v279;
            _os_log_impl((void *)&_mh_execute_header, v274, OS_LOG_TYPE_DEBUG, "confidence: %f, time: %@", buf, 0x16u);
          }
        }
        v280 = [objb objectAtIndexedSubscript:v273];
        [v280 confidence];
        double v282 = v281;

        v283 = [objb objectAtIndexedSubscript:v273];
        v344 = [v283 lastInteractionTime];
        [v344 timeIntervalSinceNow];
        LODWORD(v280) = v284 >= 0.0;
        v285 = [objb objectAtIndexedSubscript:v273];
        v286 = [v285 lastInteractionTime];
        [v286 timeIntervalSinceNow];
        if (!v280) {
          double v287 = -v287;
        }
        double v288 = 0.0;
        if (v287 > 0.0)
        {
          v334 = [objb objectAtIndexedSubscript:v273];
          v289 = [v334 lastInteractionTime];
          [v289 timeIntervalSinceNow];
          BOOL v291 = v290 < 0.0;
          v292 = [objb objectAtIndexedSubscript:v273];
          v293 = [v292 lastInteractionTime];
          [v293 timeIntervalSinceNow];
          if (v291) {
            double v288 = -v294;
          }
          else {
            double v288 = v294;
          }
        }
        long long v358 = 0u;
        long long v359 = 0u;
        long long v356 = 0u;
        long long v357 = 0u;
        v295 = [v352 objectAtIndexedSubscript:v273];
        id v296 = [v295 countByEnumeratingWithState:&v356 objects:v409 count:16];
        if (v296)
        {
          uint64_t v297 = *(void *)v357;
          do
          {
            for (n = 0; n != v296; n = (char *)n + 1)
            {
              if (*(void *)v357 != v297) {
                objc_enumerationMutation(v295);
              }
              v299 = objc_msgSend(v327, "objectAtIndexedSubscript:", objc_msgSend(*(id *)(*((void *)&v356 + 1) + 8 * (void)n), "unsignedIntegerValue"));
              if (![v299 hasMapsSuggestionsContactRevelanceScore]
                || [v299 hasMapsSuggestionsContactRevelanceScore]
                && ([v299 mapsSuggestionsContactRevelanceScore], v282 > v300))
              {
                [v299 setMapsSuggestionsContactRevelanceScore:v282];
              }
              if (![v299 hasTimeSinceLastInteractedSeconds]
                || v288 > 0.0 && ([v299 timeSinceLastInteractedSeconds], v288 < v301))
              {
                [v299 setTimeSinceLastInteractedSeconds:v288];
              }
            }
            id v296 = [v295 countByEnumeratingWithState:&v356 objects:v409 count:16];
          }
          while (v296);
        }
      }
      ++v273;
    }
    while (v273 < (unint64_t)[v354 count]);
  }

LABEL_357:
  id v302 = v327;

  return v302;
}

+ (id)hyperlinkMetadataWithTemplate:(id)a3 mapItem:(id)a4 metadata:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (!sub_1009DB5CC())
  {
    id v14 = 0;
    goto LABEL_29;
  }
  if (![v7 containsUserGeneratedGuideUnit])
  {
LABEL_8:
    if ([v7 containsCuratedGuideUnit])
    {
      id v15 = [v8 _placeCollections];
      id v16 = [v15 count];

      if (v16 == (id)1)
      {
        id v14 = objc_alloc_init((Class)GEOHyperlinkMetaData);
        id v17 = [v8 _placeCollections];
        BOOL v11 = [v17 firstObject];

        [v14 setHyperlinkType:1];
        id v18 = [v11 publisherAttribution];
        uint64_t v19 = [v18 displayName];
        uint64_t v20 = [v11 collectionTitle];
        id v21 = +[NSString stringWithFormat:@"%@: %@", v19, v20];
        [v14 setDisplayedString:v21];

        goto LABEL_28;
      }
      id v22 = [v8 _placeCollections];
      id v23 = [v22 count];

      if ((unint64_t)v23 >= 2)
      {
        id v14 = objc_alloc_init((Class)GEOHyperlinkMetaData);
        [v14 setHyperlinkType:1];
        unint64_t v24 = [v8 _placeCollections];
        v25 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Featured in %lu Guides", [v24 count]);
        [v14 setDisplayedString:v25];

        goto LABEL_29;
      }
    }
    if ([v7 containsContainmentParentUnit])
    {
      char v26 = [v8 _geoMapItem];
      v27 = [v26 _containedPlace];
      BOOL v28 = [v27 parent];
      BOOL v11 = [v28 _identifier];

      if (v11)
      {
        id v29 = [v11 muid];
        if (v29)
        {
LABEL_16:
          id v14 = objc_alloc_init((Class)GEOHyperlinkMetaData);
          [v14 setHyperlinkType:2];
          uint64_t v30 = +[NSString stringWithFormat:@"Location %llu", v29];
          [v14 setDisplayedString:v30];

          goto LABEL_28;
        }
      }
      else
      {
        id v31 = [v8 _venueInfo];
        id v32 = [v31 parent];
        id v29 = [v32 businessID];

        if (v29) {
          goto LABEL_16;
        }
      }
    }
    v33 = [v8 _geoMapItem];
    id v34 = [v33 _identifier];
    unsigned int v35 = [v7 containsTappableEntityWithIdentifier:v34 metadata:v9];

    if (v35)
    {
      id v36 = objc_alloc_init((Class)GEOHyperlinkMetaData);
      id v14 = v36;
      uint64_t v37 = 3;
    }
    else
    {
      if (![v7 containsTransitShieldsUnit]
        || ![v8 _hasTransitLabels])
      {
        BOOL v11 = [v7 stringUnitContent];
        if ([v11 length])
        {
          id v14 = objc_alloc_init((Class)GEOHyperlinkMetaData);
          [v14 setHyperlinkType:4];
          [v14 setDisplayedString:v11];
        }
        else
        {
          id v14 = 0;
        }
        goto LABEL_28;
      }
      id v36 = objc_alloc_init((Class)GEOHyperlinkMetaData);
      id v14 = v36;
      uint64_t v37 = 4;
    }
    [v36 setHyperlinkType:v37];
    goto LABEL_29;
  }
  v10 = +[CollectionManager sharedManager];
  BOOL v11 = [v10 firstUserGuideContainingMapItem:v8 requiresOrdering:1];

  if (!v11
    || ([v11 title],
        id v12 = objc_claimAutoreleasedReturnValue(),
        id v13 = [v12 length],
        v12,
        !v13))
  {

    goto LABEL_8;
  }
  id v14 = objc_alloc_init((Class)GEOHyperlinkMetaData);
  [v14 setHyperlinkType:0];
LABEL_28:

LABEL_29:

  return v14;
}

- (MapsAnalyticsHelper)init
{
  v7.receiver = self;
  v7.super_class = (Class)MapsAnalyticsHelper;
  v2 = [(MapsAnalyticsHelper *)&v7 init];
  v3 = v2;
  if (v2)
  {
    *(void *)&v2->_tapAction = 0;
    v4 = (GEOPlaceActionDetails *)objc_alloc_init((Class)GEOPlaceActionDetails);
    actionDetails = v3->_actionDetails;
    v3->_actionDetails = v4;
  }
  return v3;
}

- (MapsAnalyticsHelper)initWithLabelMarker:(id)a3
{
  id v4 = a3;
  id v5 = [(MapsAnalyticsHelper *)self init];
  if (v5)
  {
    id v6 = [v4 featureAnnotation];
    id v7 = v6;
    if (!v6 || ![v6 conformsToProtocol:&OBJC_PROTOCOL___CustomPOIAnnotation])
    {
      if ([v4 isFlyoverTour])
      {
        +[GEOPlaceActionDetails actionDetailsWithTargetID:](GEOPlaceActionDetails, "actionDetailsWithTargetID:", [v4 featureID]);
        id v14 = (GEOPlaceActionDetails *)objc_claimAutoreleasedReturnValue();
        id v15 = 0;
        id v16 = 0;
        int v17 = 1037;
      }
      else if ([v4 isTransitLine])
      {
        if (objc_msgSend(v4, "_maps_numLines") == (id)1)
        {
          +[GEOPlaceActionDetails actionDetailsWithTargetID:](GEOPlaceActionDetails, "actionDetailsWithTargetID:", [v4 featureID]);
          id v14 = (GEOPlaceActionDetails *)objc_claimAutoreleasedReturnValue();
          id v15 = 0;
          id v16 = 0;
        }
        else
        {
          [v4 _maps_analyticsEventValue];
          id v16 = (NSString *)objc_claimAutoreleasedReturnValue();
          id v15 = 0;
          id v14 = 0;
        }
        int v17 = 1035;
      }
      else if ([v4 isTrafficIncident])
      {
        id v15 = 0;
        id v14 = 0;
        id v16 = 0;
        int v17 = 1031;
      }
      else if ([v4 isCluster])
      {
        id v55 = v4;
        uint64_t v56 = v5;
        char v26 = [v4 clusterFeatureAnnotations];
        id v57 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v26, "count"));
        v27 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v26 count]);
        long long v61 = 0u;
        long long v62 = 0u;
        long long v63 = 0u;
        long long v64 = 0u;
        id v28 = v26;
        id v29 = [v28 countByEnumeratingWithState:&v61 objects:v67 count:16];
        if (v29)
        {
          id v30 = v29;
          uint64_t v31 = *(void *)v62;
          do
          {
            id v32 = 0;
            v33 = v7;
            do
            {
              if (*(void *)v62 != v31) {
                objc_enumerationMutation(v28);
              }
              id v7 = *(id *)(*((void *)&v61 + 1) + 8 * (void)v32);

              if ([v7 conformsToProtocol:&OBJC_PROTOCOL___CustomPOIAnnotation])
              {
                id v34 = [v7 searchResult];
                if (v34)
                {
                  [v57 addObject:v34];
                  unsigned int v35 = [v34 mapItem];
                  id v36 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v35 _muid]);
                  [v27 addObject:v36];
                }
              }
              id v32 = (char *)v32 + 1;
              v33 = v7;
            }
            while (v30 != v32);
            id v30 = [v28 countByEnumeratingWithState:&v61 objects:v67 count:16];
          }
          while (v30);
        }

        id v16 = [v27 componentsJoinedByString:@", "];
        v59[0] = _NSConcreteStackBlock;
        v59[1] = 3221225472;
        v59[2] = sub_100929BB0;
        v59[3] = &unk_1012E5D08;
        id v60 = v57;
        id v37 = v57;
        id v15 = objc_retainBlock(v59);

        id v7 = 0;
        id v14 = 0;
        int v17 = 1018;
        id v4 = v55;
        id v5 = v56;
      }
      else
      {
        if (objc_msgSend(v4, "_mapkit_hasMUID"))
        {
          id v42 = +[UIApplication sharedMapsDelegate];
          v43 = [v42 poiSearchManager];
          [v4 identifier];
          v45 = double v44 = v4;
          double v46 = [v43 searchResultForIdentifier:v45];

          id v47 = [v46 mapItem];
          if (!v47) {
            id v47 = [objc_alloc((Class)MKMapItem) _initWithLabelMarker:v44];
          }
          uint64_t v48 = [v47 _geoMapItem];
          id v14 = +[GEOPlaceActionDetails actionDetailsWithMapItem:v48 timestamp:0xFFFFFFFFLL resultIndex:0.0];

          id v4 = v44;
          if ([v44 isTransitAccessPoint])
          {
            int v17 = 1062;
          }
          else if ([v44 isTransit])
          {
            int v17 = 1011;
          }
          else if ([v44 isVenueButton])
          {
            int v17 = 1053;
          }
          else if ([v44 hasBusinessID])
          {
            int v17 = 1010;
          }
          else
          {
            int v17 = 144;
          }

          id v15 = 0;
        }
        else
        {
          id v15 = 0;
          id v14 = 0;
          int v17 = 0;
        }
        id v16 = 0;
      }
      goto LABEL_19;
    }
    id v8 = v4;
    id v7 = v7;
    id v9 = [v7 parkedCar];
    v10 = [v7 searchResult];
    BOOL v11 = [v7 mapItem];
    id v12 = v11;
    if (v9)
    {
      id v13 = [v11 _geoMapItem];
      id v14 = +[GEOPlaceActionDetails actionDetailsWithMapItem:v13 timestamp:0xFFFFFFFFLL resultIndex:0.0];

LABEL_6:
      id v15 = 0;
      id v16 = 0;
      int v17 = 1010;
LABEL_16:

      id v4 = v8;
LABEL_19:
      v5->_tapAction = v17;
      v5->_target = 502;
      actionDetails = v5->_actionDetails;
      v5->_actionDetails = v14;
      uint64_t v20 = v14;

      eventValue = v5->_eventValue;
      v5->_eventValue = v16;
      id v22 = v16;

      id v23 = objc_retainBlock(v15);
      id populateTapEvent = v5->_populateTapEvent;
      v5->_id populateTapEvent = v23;

      goto LABEL_20;
    }
    id v18 = [v7 searchDotPlace];

    if (v18)
    {
      id v15 = 0;
      id v14 = 0;
      id v16 = 0;
      int v17 = 194;
      goto LABEL_16;
    }
    if (v10)
    {
      v38 = [v10 mapItem];
      v39 = [v38 _geoMapItem];
      id v14 = +[GEOPlaceActionDetails actionDetailsWithMapItem:v39 timestamp:0xFFFFFFFFLL resultIndex:0.0];

      if ([v10 isHomeOrWork]) {
        goto LABEL_6;
      }
      unsigned int v40 = [v10 type];
      if (v40 <= 0xC)
      {
        if (((1 << v40) & 0x221) != 0)
        {
          v65[0] = _NSConcreteStackBlock;
          v65[1] = 3221225472;
          v65[2] = sub_1009299EC;
          v65[3] = &unk_1012E5D08;
          id v50 = v10;
          id v66 = v50;
          id v15 = objc_retainBlock(v65);
          BOOL v51 = [v50 mapItem];
          unsigned int v58 = [v51 _hasHikeInfo];

          if (v58)
          {
            v52 = [v50 mapItem];
            +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%llu", [v52 _muid]);
            id v16 = (NSString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            id v16 = 0;
          }

          int v17 = 1017;
        }
        else
        {
          if (v40 == 4) {
            int v41 = 1034;
          }
          else {
            int v41 = 0;
          }
          id v15 = 0;
          if (((1 << v40) & 0x1008) != 0) {
            int v17 = 1020;
          }
          else {
            int v17 = v41;
          }
          id v16 = 0;
        }
        goto LABEL_16;
      }
      id v15 = 0;
    }
    else
    {
      if (v12 && [v12 _hasMUID])
      {
        uint64_t v49 = [v12 _geoMapItem];
        id v14 = +[GEOPlaceActionDetails actionDetailsWithMapItem:v49 timestamp:0xFFFFFFFFLL resultIndex:0.0];

        if ([v8 isTransit])
        {
          id v15 = 0;
          id v16 = 0;
          int v17 = 1011;
        }
        else
        {
          v53 = [v12 _geoMapItem];
          unsigned int v54 = [v53 _isInLinkedPlaceRelationship];

          id v15 = 0;
          id v16 = 0;
          if (v54) {
            int v17 = 1017;
          }
          else {
            int v17 = 1010;
          }
        }
        goto LABEL_16;
      }
      id v15 = 0;
      id v14 = 0;
    }
    int v17 = 0;
    id v16 = 0;
    goto LABEL_16;
  }
LABEL_20:

  return v5;
}

- (MapsAnalyticsHelper)initWithMapItem:(id)a3
{
  id v4 = a3;
  id v5 = [(MapsAnalyticsHelper *)self init];
  if (v5)
  {
    id v6 = [v4 _geoMapItem];
    uint64_t v7 = +[GEOPlaceActionDetails actionDetailsWithMapItem:v6 timestamp:0xFFFFFFFFLL resultIndex:0.0];
    actionDetails = v5->_actionDetails;
    v5->_actionDetails = (GEOPlaceActionDetails *)v7;
  }
  return v5;
}

- (int)tapAction
{
  return self->_tapAction;
}

- (int)target
{
  return self->_target;
}

- (GEOPlaceActionDetails)actionDetails
{
  return self->_actionDetails;
}

- (NSString)eventValue
{
  return self->_eventValue;
}

- (id)populateTapEvent
{
  return self->_populateTapEvent;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_populateTapEvent, 0);
  objc_storeStrong((id *)&self->_eventValue, 0);

  objc_storeStrong((id *)&self->_actionDetails, 0);
}

@end