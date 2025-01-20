@interface AutocompleteItemManager
- (AutocompleteContext)autocompleteContext;
- (AutocompleteItemManager)init;
- (BOOL)canMoveItem:(id)a3 toSection:(id)a4 withSortedSections:(id)a5 wrappedItems:(id)a6;
- (BOOL)clientRankingScoreInfluencedResults;
- (BOOL)mapsSuggestionsIsTouristHereScoreValid;
- (BOOL)shouldUseDistanceFeatureServerResults;
- (BOOL)topSectionIsQuerySuggestions;
- (BOOL)useClientRankingScore;
- (BOOL)usePriority;
- (GEOMapServiceTraits)traits;
- (NSArray)completionSections;
- (NSArray)sections;
- (NSNumber)interleavedSectionIndex;
- (double)clientRankingScoreForItem:(id)a3 withSuggestionEntry:(id)a4 hasContributionsFromDiscreteFeaturesResult:(BOOL *)a5;
- (double)clientRankingScoreOfFirstItemInSection:(id)a3 wrappedItems:(id)a4;
- (double)mapsSuggestionsIsTouristHereScore;
- (id)defaultSectionsWithCompletionSections:(id)a3;
- (id)excludingRuleWithClientOnlyAutocompleteType:(int)a3;
- (id)excludingRulesWithTypes:(id)a3;
- (id)filterDuplicateContactsFromServerResultUsingItems:(id)a3;
- (id)includingRulesWithTypes:(id)a3;
- (id)indexOfSectionWithItem:(id)a3;
- (id)ruleWithClientOnlyAutocompleteType:(int)a3;
- (id)sectionsWithWrappedItems:(id)a3;
- (id)wrappedItems:(id)a3;
- (void)_gatherItemsWithShouldCancel:(id)a3 completion:(id)a4;
- (void)autocompleteSessionDidEnd;
- (void)computeClientRankingScoresForResolvedItemsIfNeeded:(id)a3 completion:(id)a4;
- (void)logClientRankingScore:(double)a3 forItem:(id)a4 withSignalPack:(id)a5 serverScore:(id)a6;
- (void)logSortedItemsWithSections:(id)a3;
- (void)setAutocompleteContext:(id)a3;
- (void)setCompletionSections:(id)a3;
- (void)setInterleavedSectionIndex:(id)a3;
- (void)setMapsSuggestionsIsTouristHereScore:(double)a3;
- (void)setMapsSuggestionsIsTouristHereScoreValid:(BOOL)a3;
- (void)setPriorityFunction:(id)a3;
- (void)setShouldUseDistanceFeatureServerResults:(BOOL)a3;
- (void)setTopSectionIsQuerySuggestions:(BOOL)a3;
- (void)setTraits:(id)a3;
- (void)sortWrappedItems:(id)a3;
@end

@implementation AutocompleteItemManager

- (AutocompleteItemManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)AutocompleteItemManager;
  v2 = [(PersonalizedItemManager *)&v6 init];
  if (v2)
  {
    v3 = +[PersonalizedItemPriorityFunction defaultPriorityFunctionForAutocomplete];
    v5.receiver = v2;
    v5.super_class = (Class)AutocompleteItemManager;
    [(PersonalizedItemManager *)&v5 setPriorityFunction:v3];
  }
  return v2;
}

- (void)setPriorityFunction:(id)a3
{
  id v4 = a3;
  objc_super v5 = v4;
  if (!v4)
  {
    objc_super v5 = +[PersonalizedItemPriorityFunction defaultPriorityFunctionForAutocomplete];
  }
  v6.receiver = self;
  v6.super_class = (Class)AutocompleteItemManager;
  [(PersonalizedItemManager *)&v6 setPriorityFunction:v5];
  if (!v4) {
}
  }

- (void)autocompleteSessionDidEnd
{
}

- (void)_gatherItemsWithShouldCancel:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = sub_100109E50();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "AutocompleteItemManager - collecting results", buf, 2u);
  }

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1006B86F0;
  v12[3] = &unk_1012F4C80;
  v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  v11.receiver = self;
  v11.super_class = (Class)AutocompleteItemManager;
  id v9 = v7;
  id v10 = v6;
  [(PersonalizedItemManager *)&v11 _gatherItemsWithShouldCancel:v10 completion:v12];
}

- (BOOL)useClientRankingScore
{
  v2 = [(PersonalizedItemManager *)self _clientRankingFunction];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)usePriority
{
  BOOL v3 = [(PersonalizedItemManager *)self _clientRankingFunction];
  if (v3)
  {
    BOOL v4 = 0;
  }
  else
  {
    objc_super v5 = [(PersonalizedItemManager *)self _priorityFunction];
    BOOL v4 = v5 != 0;
  }
  return v4;
}

- (id)wrappedItems:(id)a3
{
  id v4 = a3;
  objc_super v5 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v4 count]);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        v12 = [AutocompleteItemManagerItemWrapper alloc];
        id v13 = -[AutocompleteItemManagerItemWrapper initWithItem:compoundItem:](v12, "initWithItem:compoundItem:", v11, v11, (void)v16);
        if ([(AutocompleteItemManager *)self usePriority])
        {
          id v14 = [(PersonalizedItemManager *)self _priorityFunction];
          -[AutocompleteItemManagerItemWrapper setPriority:](v13, "setPriority:", [v14 priorityForPersonalizedAutocompleteItem:v11]);
        }
        [v5 addObject:v13];
      }
      id v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)sectionsWithWrappedItems:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(AutocompleteItemManager *)self completionSections];
  v42 = [(AutocompleteItemManager *)self defaultSectionsWithCompletionSections:v5];

  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  id obj = v4;
  id v44 = [obj countByEnumeratingWithState:&v65 objects:v73 count:16];
  if (v44)
  {
    uint64_t v41 = *(void *)v66;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v66 != v41) {
          objc_enumerationMutation(obj);
        }
        uint64_t v47 = v6;
        id v7 = *(void **)(*((void *)&v65 + 1) + 8 * v6);
        id v8 = [(AutocompleteItemManager *)self indexOfSectionWithItem:v7];
        long long v61 = 0u;
        long long v62 = 0u;
        long long v63 = 0u;
        long long v64 = 0u;
        id v9 = v42;
        id v10 = [v9 countByEnumeratingWithState:&v61 objects:v72 count:16];
        if (v10)
        {
          id v11 = v10;
          uint64_t v12 = *(void *)v62;
          while (2)
          {
            for (i = 0; i != v11; i = (char *)i + 1)
            {
              if (*(void *)v62 != v12) {
                objc_enumerationMutation(v9);
              }
              id v14 = *(void **)(*((void *)&v61 + 1) + 8 * i);
              v15 = [v7 compoundItem];
              unsigned int v16 = [v14 itemIsAllowed:v15 indexInCompletionSections:v8];

              if (v16)
              {
                long long v17 = [v7 item];
                [v7 poiRelevanceScore];
                [v14 addItem:v17];

                [v7 setSection:v14];
                goto LABEL_16;
              }
            }
            id v11 = [v9 countByEnumeratingWithState:&v61 objects:v72 count:16];
            if (v11) {
              continue;
            }
            break;
          }
        }
LABEL_16:

        uint64_t v6 = v47 + 1;
      }
      while ((id)(v47 + 1) != v44);
      id v44 = [obj countByEnumeratingWithState:&v65 objects:v73 count:16];
    }
    while (v44);
  }

  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id v18 = v42;
  id v19 = [v18 countByEnumeratingWithState:&v57 objects:v71 count:16];
  if (v19)
  {
    id v20 = v19;
    uint64_t v21 = *(void *)v58;
    uint64_t v43 = *(void *)v58;
    do
    {
      v22 = 0;
      id v45 = v20;
      do
      {
        if (*(void *)v58 != v21) {
          objc_enumerationMutation(v18);
        }
        v23 = *(void **)(*((void *)&v57 + 1) + 8 * (void)v22);
        if ([v23 isSectionForClientOnlyResults])
        {
          v48 = v22;
          long long v55 = 0u;
          long long v56 = 0u;
          long long v53 = 0u;
          long long v54 = 0u;
          id v24 = obj;
          id v25 = [v24 countByEnumeratingWithState:&v53 objects:v70 count:16];
          if (v25)
          {
            id v26 = v25;
            uint64_t v27 = *(void *)v54;
            do
            {
              for (j = 0; j != v26; j = (char *)j + 1)
              {
                if (*(void *)v54 != v27) {
                  objc_enumerationMutation(v24);
                }
                v29 = *(void **)(*((void *)&v53 + 1) + 8 * (void)j);
                if ([(AutocompleteItemManager *)self canMoveItem:v29 toSection:v23 withSortedSections:v18 wrappedItems:v24])
                {
                  v30 = [v29 section];
                  v31 = [v29 item];
                  [v29 poiRelevanceScore];
                  [v30 removeItem:v31];

                  v32 = [v29 item];
                  [v29 poiRelevanceScore];
                  [v23 addItem:v32];
                }
              }
              id v26 = [v24 countByEnumeratingWithState:&v53 objects:v70 count:16];
            }
            while (v26);
          }

          uint64_t v21 = v43;
          id v20 = v45;
          v22 = v48;
        }
        v22 = (char *)v22 + 1;
      }
      while (v22 != v20);
      id v20 = [v18 countByEnumeratingWithState:&v57 objects:v71 count:16];
    }
    while (v20);
  }

  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id v33 = v18;
  id v34 = [v33 countByEnumeratingWithState:&v49 objects:v69 count:16];
  if (v34)
  {
    id v35 = v34;
    uint64_t v36 = *(void *)v50;
    do
    {
      for (k = 0; k != v35; k = (char *)k + 1)
      {
        if (*(void *)v50 != v36) {
          objc_enumerationMutation(v33);
        }
        [*(id *)(*((void *)&v49 + 1) + 8 * (void)k) resortItemsToEnforceServerResultsOrderIfNeeded];
      }
      id v35 = [v33 countByEnumeratingWithState:&v49 objects:v69 count:16];
    }
    while (v35);
  }

  v38 = +[NSPredicate predicateWithBlock:&stru_1012F4CC0];
  v39 = [v33 filteredArrayUsingPredicate:v38];

  return v39;
}

- (void)computeClientRankingScoresForResolvedItemsIfNeeded:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  if (![(AutocompleteItemManager *)self useClientRankingScore]) {
    goto LABEL_67;
  }
  if ((unint64_t)[v6 count] <= 1)
  {
    id v8 = [v6 count];
    id v9 = sub_100109E50();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
    if (v8)
    {
      if (v10)
      {
        *(_WORD *)buf = 0;
        id v11 = "Skipping computing AC ranking scores because we only have 1 item";
LABEL_65:
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, v11, buf, 2u);
      }
    }
    else if (v10)
    {
      *(_WORD *)buf = 0;
      id v11 = "Skipping computing AC ranking scores because we have no items";
      goto LABEL_65;
    }

LABEL_67:
    v7[2](v7);
    goto LABEL_68;
  }
  v105 = self;
  v101 = v7;
  v104 = +[NSMutableArray array];
  v106 = +[NSMutableArray array];
  uint64_t v12 = +[NSMutableArray array];
  v103 = v6;
  id v13 = 0;
  if ([v6 count])
  {
    unint64_t v14 = 0;
    do
    {
      v15 = [v6 objectAtIndexedSubscript:v14];
      [v15 setClientRankingScore:-3.40282347e38];
      unsigned int v16 = [v15 item];
      unsigned __int8 v17 = [v16 isCompoundPersonalizedAutocompleteItem];
      id v18 = [v15 item];
      id v19 = v18;
      if (v17)
      {
        [v18 leafPersonalizedAutocompleteItems];
      }
      else
      {
        v126 = v18;
        +[NSArray arrayWithObjects:&v126 count:1];
      id v20 = };

      [v104 addObjectsFromArray:v20];
      long long v117 = 0u;
      long long v118 = 0u;
      long long v115 = 0u;
      long long v116 = 0u;
      id v21 = v20;
      id v22 = [v21 countByEnumeratingWithState:&v115 objects:v125 count:16];
      if (v22)
      {
        id v23 = v22;
        uint64_t v24 = *(void *)v116;
        do
        {
          for (i = 0; i != v23; i = (char *)i + 1)
          {
            if (*(void *)v116 != v24) {
              objc_enumerationMutation(v21);
            }
            id v26 = [*(id *)(*((void *)&v115 + 1) + 8 * i) autocompleteObject];

            if (v26)
            {
              uint64_t v27 = [v15 compoundItem];
              [v106 addObject:v27];

              v28 = +[NSNumber numberWithUnsignedInteger:v14];
              [v12 addObject:v28];

              ++v13;
            }
          }
          id v23 = [v21 countByEnumeratingWithState:&v115 objects:v125 count:16];
        }
        while (v23);
      }

      ++v14;
      id v6 = v103;
    }
    while (v14 < (unint64_t)[v103 count]);
  }
  v29 = [(AutocompleteItemManager *)self autocompleteContext];
  v30 = sub_100018584();
  v31 = [v30 oneInsights];
  v32 = [(AutocompleteItemManager *)self traits];
  BYTE1(v100) = [(AutocompleteItemManager *)self shouldUseDistanceFeatureServerResults];
  LOBYTE(v100) = 0;
  id v33 = +[MapsAnalyticsHelper acSuggestionEntriesFromAutoCompleteObjects:personalizedItems:context:mapsSuggestionsInsights:skipReportASearchItems:traits:usedForLogging:shouldUseDistanceFeatureServerResults:](MapsAnalyticsHelper, "acSuggestionEntriesFromAutoCompleteObjects:personalizedItems:context:mapsSuggestionsInsights:skipReportASearchItems:traits:usedForLogging:shouldUseDistanceFeatureServerResults:", v106, v104, v29, v31, 0, v32, v100);

  id v34 = self;
  if (![(AutocompleteItemManager *)self mapsSuggestionsIsTouristHereScoreValid])
  {
    [(AutocompleteItemManager *)self setMapsSuggestionsIsTouristHereScoreValid:1];
    id v35 = [(AutocompleteItemManager *)self traits];
    [v35 isTourist];
    -[AutocompleteItemManager setMapsSuggestionsIsTouristHereScore:](self, "setMapsSuggestionsIsTouristHereScore:");

    id v34 = self;
  }
  long long v113 = 0u;
  long long v114 = 0u;
  long long v111 = 0u;
  long long v112 = 0u;
  id v36 = v33;
  id v37 = [v36 countByEnumeratingWithState:&v111 objects:v124 count:16];
  if (v37)
  {
    id v38 = v37;
    uint64_t v39 = *(void *)v112;
    do
    {
      for (j = 0; j != v38; j = (char *)j + 1)
      {
        if (*(void *)v112 != v39) {
          objc_enumerationMutation(v36);
        }
        uint64_t v41 = *(void **)(*((void *)&v111 + 1) + 8 * (void)j);
        [(AutocompleteItemManager *)v34 mapsSuggestionsIsTouristHereScore];
        [v41 setMapsSuggestionsIsTouristScore:];
      }
      id v38 = [v36 countByEnumeratingWithState:&v111 objects:v124 count:16];
    }
    while (v38);
  }

  v42 = (char *)[v36 count];
  uint64_t v43 = sub_100109E50();
  id v44 = v43;
  if (v42 == v13)
  {
    BOOL v45 = os_log_type_enabled(v43, OS_LOG_TYPE_INFO);

    if (v45)
    {
      v46 = sub_100109E50();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
      {
        id v47 = [v6 count];
        id v48 = [v104 count];
        *(_DWORD *)buf = 134218240;
        id v121 = v47;
        __int16 v122 = 2048;
        id v123 = v48;
        _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_INFO, "Computing AC ranking scores for %lu items (%lu leaf items)", buf, 0x16u);
      }

      long long v49 = [(PersonalizedItemManager *)v34 _clientRankingFunction];
      long long v50 = sub_100109E50();
      [v49 describeInLog:v50 withType:1];
    }
    v102 = v36;
    if ([v36 count])
    {
      unint64_t v51 = 0;
      do
      {
        long long v52 = [v12 objectAtIndexedSubscript:v51];
        id v53 = [v52 unsignedIntegerValue];

        long long v54 = [v6 objectAtIndexedSubscript:v53];
        buf[0] = 0;
        long long v55 = [v104 objectAtIndexedSubscript:v51];
        long long v56 = [v36 objectAtIndexedSubscript:v51];
        [(AutocompleteItemManager *)v34 clientRankingScoreForItem:v55 withSuggestionEntry:v56 hasContributionsFromDiscreteFeaturesResult:buf];
        double v58 = v57;

        id v36 = v102;
        long long v59 = [v102 objectAtIndexedSubscript:v51];
        [v59 mapsSuggestionsPoiRevelanceScore];
        double v61 = v60;

        [v54 clientRankingScore];
        if (v58 > v62)
        {
          [v54 clientRankingScore];
          if (v63 > v58)
          {
            [v54 clientRankingScore];
            double v58 = v64;
          }
          [v54 setClientRankingScore:v58];
          long long v65 = [v54 compoundItem];
          long long v66 = [v65 autocompleteAnalytics];

          if (!v66)
          {
            long long v67 = objc_alloc_init(PersonalizedCompoundItemAutocompleteAnalytics);
            long long v68 = [v54 compoundItem];
            [v68 setAutocompleteAnalytics:v67];
          }
          uint64_t v69 = buf[0];
          v70 = [v54 compoundItem];
          v71 = [v70 autocompleteAnalytics];
          [v71 setDiscreteFeatureValuesContributedToLatestClientRankingScore:v69];

          id v36 = v102;
        }
        v72 = [v36 objectAtIndexedSubscript:v51];
        unsigned int v73 = [v72 suggestionType];

        if (v73 == 9)
        {
          [v54 poiRelevanceScore];
          if (v74 > v61)
          {
            [v54 poiRelevanceScore];
            double v61 = v75;
          }
          [v54 setPoiRelevanceScore:v61];
        }

        ++v51;
      }
      while (v51 < (unint64_t)[v36 count]);
    }
    v76 = +[NSUserDefaults standardUserDefaults];
    unsigned __int8 v77 = [v76 BOOLForKey:@"EnableSearchDebug"];

    if ((v77 & 1) == 0) {
      goto LABEL_62;
    }
    long long v109 = 0u;
    long long v110 = 0u;
    long long v107 = 0u;
    long long v108 = 0u;
    id v44 = v6;
    id v78 = [v44 countByEnumeratingWithState:&v107 objects:v119 count:16];
    if (v78)
    {
      id v79 = v78;
      uint64_t v80 = *(void *)v108;
      do
      {
        for (k = 0; k != v79; k = (char *)k + 1)
        {
          if (*(void *)v108 != v80) {
            objc_enumerationMutation(v44);
          }
          v82 = *(void **)(*((void *)&v107 + 1) + 8 * (void)k);
          v83 = [v82 item];
          unsigned int v84 = [v83 conformsToProtocol:&OBJC_PROTOCOL___AutocompleteItemWithMatchInfo];

          if (v84)
          {
            [v82 clientRankingScore];
            double v86 = v85;
            v87 = [v82 item];
            v88 = [v87 matchInfo];
            [v88 setClientRankingDebug:v86];
          }
          [v82 clientRankingScore];
          double v90 = v89;
          v91 = [(AutocompleteItemManager *)v105 autocompleteContext];
          v92 = [v82 item];
          v93 = [v92 autocompleteObject];
          v94 = [v91 matchInfoForObject:v93];
          [v94 setClientRankingDebug:v90];

          [v82 clientRankingScore];
          double v96 = v95;
          v97 = [v82 compoundItem];
          v98 = [v97 matchInfo];
          [v98 setClientRankingDebug:v96];
        }
        id v79 = [v44 countByEnumeratingWithState:&v107 objects:v119 count:16];
      }
      while (v79);
      id v36 = v102;
      id v6 = v103;
    }
  }
  else if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
  {
    id v99 = [v36 count];
    *(_DWORD *)buf = 134218240;
    id v121 = v13;
    __int16 v122 = 2048;
    id v123 = v99;
    _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_ERROR, "Skipping computing AC ranking scores because the number of items (%lu) does not match the number of suggestionEntries produced (%lu)", buf, 0x16u);
  }

LABEL_62:
  id v7 = v101;
  v101[2](v101);

LABEL_68:
}

- (double)clientRankingScoreForItem:(id)a3 withSuggestionEntry:(id)a4 hasContributionsFromDiscreteFeaturesResult:(BOOL *)a5
{
  id v8 = a3;
  id v9 = a4;
  double v10 = 0.0;
  if ([(AutocompleteItemManager *)self useClientRankingScore])
  {
    id v11 = [[PersonalizedItemSignalPack alloc] initWithItem:v8 suggestionEntry:v9];
    uint64_t v12 = [(PersonalizedItemManager *)self _clientRankingFunction];
    id v13 = [v8 serverResultScoreMetadata];
    [v12 clientRankingScoreForPersonalizedItemSignalPack:v11 withServerScore:v13 hasContributionsFromDiscreteFeaturesResult:a5];
    double v10 = v14;

    v15 = [v8 serverResultScoreMetadata];
    [(AutocompleteItemManager *)self logClientRankingScore:v8 forItem:v11 withSignalPack:v15 serverScore:v10];
  }
  return v10;
}

- (id)filterDuplicateContactsFromServerResultUsingItems:(id)a3
{
  id v3 = [a3 mutableCopy];
  id v35 = +[NSMutableArray array];
  id v4 = +[NSMutableArray array];
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v58 objects:v68 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v59;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v59 != v8) {
          objc_enumerationMutation(v5);
        }
        double v10 = *(void **)(*((void *)&v58 + 1) + 8 * i);
        if ([v10 containsPossiblePersonalizedItemSourceType:4]) {
          [v35 addObject:v10];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v58 objects:v68 count:16];
    }
    while (v7);
  }

  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id obj = v5;
  id v11 = [obj countByEnumeratingWithState:&v54 objects:v67 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v55;
    do
    {
      for (j = 0; j != v12; j = (char *)j + 1)
      {
        if (*(void *)v55 != v13) {
          objc_enumerationMutation(obj);
        }
        v15 = *(void **)(*((void *)&v54 + 1) + 8 * (void)j);
        if ([v15 containsPossiblePersonalizedItemSourceType:1]) {
          [v4 addObject:v15];
        }
      }
      id v12 = [obj countByEnumeratingWithState:&v54 objects:v67 count:16];
    }
    while (v12);
  }

  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v32 = v4;
  id v34 = [v32 countByEnumeratingWithState:&v50 objects:v66 count:16];
  if (v34)
  {
    uint64_t v33 = *(void *)v51;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v51 != v33) {
          objc_enumerationMutation(v32);
        }
        uint64_t v36 = v16;
        unsigned __int8 v17 = *(void **)(*((void *)&v50 + 1) + 8 * v16);
        long long v46 = 0u;
        long long v47 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        id v37 = v35;
        id v39 = [v37 countByEnumeratingWithState:&v46 objects:v65 count:16];
        if (v39)
        {
          uint64_t v38 = *(void *)v47;
          do
          {
            uint64_t v18 = 0;
            do
            {
              if (*(void *)v47 != v38) {
                objc_enumerationMutation(v37);
              }
              uint64_t v40 = v18;
              id v19 = *(void **)(*((void *)&v46 + 1) + 8 * v18);
              long long v42 = 0u;
              long long v43 = 0u;
              long long v44 = 0u;
              long long v45 = 0u;
              id v20 = [v19 keys];
              id v21 = [v20 countByEnumeratingWithState:&v42 objects:v64 count:16];
              if (v21)
              {
                id v22 = v21;
                uint64_t v23 = *(void *)v43;
                do
                {
                  for (k = 0; k != v22; k = (char *)k + 1)
                  {
                    if (*(void *)v43 != v23) {
                      objc_enumerationMutation(v20);
                    }
                    id v25 = *(void **)(*((void *)&v42 + 1) + 8 * (void)k);
                    id v26 = [v17 keys];
                    uint64_t v27 = [v26 allObjects];
                    v28 = [v27 firstObject];

                    if (v28 && [v25 isEqual:v28])
                    {
                      v29 = sub_100109E50();
                      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
                      {
                        *(_DWORD *)buf = 138412290;
                        double v63 = v19;
                        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "AutocompleteItemManager - Found a duplicate contact:%@ with server address", buf, 0xCu);
                      }

                      [obj removeObject:v19];
                    }
                  }
                  id v22 = [v20 countByEnumeratingWithState:&v42 objects:v64 count:16];
                }
                while (v22);
              }

              uint64_t v18 = v40 + 1;
            }
            while ((id)(v40 + 1) != v39);
            id v39 = [v37 countByEnumeratingWithState:&v46 objects:v65 count:16];
          }
          while (v39);
        }

        uint64_t v16 = v36 + 1;
      }
      while ((id)(v36 + 1) != v34);
      id v34 = [v32 countByEnumeratingWithState:&v50 objects:v66 count:16];
    }
    while (v34);
  }

  id v30 = [obj copy];

  return v30;
}

- (BOOL)canMoveItem:(id)a3 toSection:(id)a4 withSortedSections:(id)a5 wrappedItems:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  double v14 = [v10 compoundItem];
  if (([v11 itemIsAllowed:v14 indexInCompletionSections:0] & 1) == 0)
  {

    goto LABEL_8;
  }
  id v15 = [v10 section];

  if (v15 == v11)
  {
LABEL_8:
    BOOL v22 = 0;
    goto LABEL_9;
  }
  [v10 clientRankingScore];
  double v17 = v16;
  uint64_t v18 = (char *)[v12 indexOfObject:v11];
  id v19 = [v10 section];
  id v20 = (char *)[v12 indexOfObject:v19];

  id v21 = v18 + 1;
  do
  {
    BOOL v22 = v21 >= v20;
    if (v21 >= v20) {
      break;
    }
    uint64_t v23 = [v12 objectAtIndexedSubscript:v21];
    [(AutocompleteItemManager *)self clientRankingScoreOfFirstItemInSection:v23 wrappedItems:v13];
    double v25 = v24;

    ++v21;
  }
  while (v25 <= v17);
LABEL_9:

  return v22;
}

- (double)clientRankingScoreOfFirstItemInSection:(id)a3 wrappedItems:(id)a4
{
  id v5 = a4;
  id v6 = [a3 items];
  id v7 = [v6 firstObject];

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v8 = v5;
  id v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  double v10 = 0.0;
  if (v9)
  {
    id v11 = v9;
    uint64_t v12 = *(void *)v19;
    while (2)
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v8);
        }
        double v14 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        id v15 = [v14 item:v18];

        if (v7 == v15)
        {
          [v14 clientRankingScore];
          double v10 = v16;
          goto LABEL_11;
        }
      }
      id v11 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v10;
}

- (void)logClientRankingScore:(double)a3 forItem:(id)a4 withSignalPack:(id)a5 serverScore:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  uint64_t v12 = sub_100109E50();
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_INFO);

  if (v13)
  {
    if ([v9 conformsToProtocol:&OBJC_PROTOCOL___PersonalizedItem])
    {
      double v14 = [v9 title];
      id v37 = [v14 value];

      id v15 = [v9 subtitle];
      double v16 = [v15 value];
    }
    else
    {
      double v16 = 0;
      id v37 = 0;
    }
    double v17 = +[NSMutableString string];
    if ([v9 hasServerItemIndex]) {
      [v17 appendFormat:@"ServerSection,Index=%lu,%lu; "];
    }
        [v9 serverSectionIndex],
        [v9 serverItemIndexInSection]);
    if (v11)
    {
      [v11 normalizedScore];
      [v17 appendFormat:@"ServerScore=%f; ", v18];
    }
    id v38 = v11;
    long long v19 = (char *)[v9 sourceType] - 1;
    if ((unint64_t)v19 > 9) {
      CFStringRef v20 = @"Unknown";
    }
    else {
      CFStringRef v20 = *(&off_1012F4D28 + (void)v19);
    }
    long long v21 = (char *)[v9 sourceSubtype];
    if ((unint64_t)(v21 - 1) > 0x23) {
      CFStringRef v22 = @"Unknown";
    }
    else {
      CFStringRef v22 = *(&off_1012F4D78 + (void)(v21 - 1));
    }
    [v17 appendFormat:@"SourceType,Subtype=%@,%@; ", v20, v22];
    id v23 = [v10 itemSuggestionTypeSource];
    if (v23 >= 0xF)
    {
      double v24 = +[NSString stringWithFormat:@"(unknown: %i)", v23];
    }
    else
    {
      double v24 = *(&off_1012F4E98 + (int)v23);
    }
    [v17 appendFormat:@"SuggestionType=%@; ", v24];

    id v25 = [v10 itemServerEntryTypeSource];
    if (v25 >= 4)
    {
      id v26 = +[NSString stringWithFormat:@"(unknown: %i)", v25];
    }
    else
    {
      id v26 = *(&off_1012F4F10 + (int)v25);
    }
    [v17 appendFormat:@"ServerEntryType=%@; ", v26];

    uint64_t v27 = [v9 autocompleteObject];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0 && v27)
    {
      v29 = [v9 autocompleteObject];
      id v30 = [v29 description];
      [v17 appendFormat:@"\nAutcompletePerson=<<%@>>;\n", v30];
    }
    [v17 appendString:@"Features { "];
    char v31 = 1;
    unint64_t v32 = -1;
    do
    {
      unint64_t v33 = v32 + 1;
      if ([v10 hasValueForFeatureType:v32 + 1])
      {
        if ((v31 & 1) == 0) {
          [v17 appendString:@"; "];
        }
        CFStringRef v34 = @"Unknown";
        if (v32 <= 0x28) {
          CFStringRef v34 = *(&off_1012F4F30 + v32);
        }
        [v10 valueForFeatureType:v32 + 1];
        [v17 appendFormat:@"%@=%f", v34, v35];
        char v31 = 0;
      }
      ++v32;
    }
    while (v33 != 41);
    [v17 appendString:@" }"];
    uint64_t v36 = sub_100109E50();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138478595;
      uint64_t v40 = v37;
      __int16 v41 = 2113;
      long long v42 = v16;
      __int16 v43 = 2048;
      double v44 = a3;
      __int16 v45 = 2112;
      long long v46 = v17;
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_INFO, "AC item title=\"%{private}@\"; subtitle=\"%{private}@\": ranking score = %f; %@",
        buf,
        0x2Au);
    }

    id v11 = v38;
  }
}

- (void)logSortedItemsWithSections:(id)a3
{
  id v3 = a3;
  id v4 = sub_100109E50();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);

  if (v5 && [v3 count])
  {
    unint64_t v7 = 0;
    *(void *)&long long v6 = 138412546;
    long long v28 = v6;
    v29 = v3;
    do
    {
      id v8 = [v3 objectAtIndexedSubscript:v7];
      id v9 = sub_100109E50();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        id v10 = [v8 title];
        id v11 = [v8 items];
        id v12 = [v11 count];
        *(_DWORD *)buf = v28;
        unint64_t v31 = (unint64_t)v10;
        __int16 v32 = 2048;
        unint64_t v33 = (unint64_t)v12;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Displaying AC section title=\"%@\", items.count=%lu", buf, 0x16u);
      }
      BOOL v13 = [v8 items];
      id v14 = [v13 count];

      if (v14)
      {
        unint64_t v15 = 0;
        do
        {
          double v16 = [v8 items];
          double v17 = [v16 objectAtIndexedSubscript:v15];

          if ([v17 conformsToProtocol:&OBJC_PROTOCOL___PersonalizedItem])
          {
            if ([v17 sourceType] == (id)4)
            {
              float v18 = @"REDACTED - Contact name";
              long long v19 = @"REDACTED - Contact address";
            }
            else
            {
              CFStringRef v20 = [v17 title];
              float v18 = [v20 value];

              long long v21 = [v17 subtitle];
              long long v19 = [v21 value];
            }
          }
          else
          {
            float v18 = 0;
            long long v19 = 0;
          }
          if ([v17 isCompoundPersonalizedAutocompleteItem])
          {
            CFStringRef v22 = [v17 leafPersonalizedAutocompleteItems];
            BOOL v23 = (unint64_t)[v22 count] > 1;
          }
          else
          {
            BOOL v23 = 0;
          }
          double v24 = sub_100109E50();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 134219011;
            CFStringRef v25 = @"NO";
            if (v23) {
              CFStringRef v25 = @"YES";
            }
            unint64_t v31 = v7;
            __int16 v32 = 2048;
            unint64_t v33 = v15;
            __int16 v34 = 2113;
            uint64_t v35 = v18;
            __int16 v36 = 2113;
            id v37 = v19;
            __int16 v38 = 2112;
            CFStringRef v39 = v25;
            _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "AC item at DisplayedSection,Index=%lu,%lu: title=\"%{private}@\"; subtitle=\"%{private}@\"; deduped=%@",
              buf,
              0x34u);
          }

          ++v15;
          id v26 = [v8 items];
          id v27 = [v26 count];
        }
        while (v15 < (unint64_t)v27);
      }

      ++v7;
      id v3 = v29;
    }
    while (v7 < (unint64_t)[v29 count]);
  }
}

- (void)sortWrappedItems:(id)a3
{
  id v4 = a3;
  if ((unint64_t)[v4 count] >= 2)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_1006BAE0C;
    v5[3] = &unk_1012F4CE0;
    unsigned __int8 v6 = [(AutocompleteItemManager *)self useClientRankingScore];
    [v4 sortWithOptions:16 usingComparator:v5];
  }
}

- (id)indexOfSectionWithItem:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 compoundItem];
  unsigned __int8 v6 = [v5 containsPossiblePersonalizedItemSourceType:1];

  if ((v6 & 1) == 0)
  {
    id v11 = [(AutocompleteItemManager *)self interleavedSectionIndex];
    goto LABEL_29;
  }
  unint64_t v7 = [v4 item];
  id v8 = [v7 autocompleteObject];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v9 = v8;
  }
  else {
    id v9 = 0;
  }
  id v10 = v9;

  if (v10)
  {
    if (!v8) {
      goto LABEL_27;
    }
  }
  else
  {
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v12 = [v4 compoundItem];
    BOOL v13 = [v12 items];

    id v14 = [v13 countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v32;
LABEL_11:
      uint64_t v17 = 0;
      while (1)
      {
        if (*(void *)v32 != v16) {
          objc_enumerationMutation(v13);
        }
        float v18 = *(void **)(*((void *)&v31 + 1) + 8 * v17);
        if ([v18 conformsToProtocol:&OBJC_PROTOCOL___PersonalizedAutocompleteItem])
        {
          id v8 = [v18 autocompleteObject];
          objc_opt_class();
          long long v19 = (objc_opt_isKindOfClass() & 1) != 0 ? v8 : 0;
          id v20 = v19;

          if (v20) {
            break;
          }
        }
        if (v15 == (id)++v17)
        {
          id v15 = [v13 countByEnumeratingWithState:&v31 objects:v35 count:16];
          if (v15) {
            goto LABEL_11;
          }
          goto LABEL_21;
        }
      }
    }
    else
    {
LABEL_21:
      id v8 = 0;
    }

    if (!v8) {
      goto LABEL_27;
    }
  }
  long long v21 = [(AutocompleteItemManager *)self completionSections];
  id v22 = [v21 count];

  if (v22)
  {
    unint64_t v23 = 0;
    while (1)
    {
      double v24 = [(AutocompleteItemManager *)self completionSections];
      CFStringRef v25 = [v24 objectAtIndex:v23];

      id v26 = [v25 results];
      unsigned int v27 = [v26 containsObject:v8];

      if (v27) {
        break;
      }

      ++v23;
      long long v28 = [(AutocompleteItemManager *)self completionSections];
      id v29 = [v28 count];

      if (v23 >= (unint64_t)v29) {
        goto LABEL_27;
      }
    }
    id v11 = +[NSNumber numberWithUnsignedInteger:v23];

    goto LABEL_28;
  }
LABEL_27:
  id v11 = 0;
LABEL_28:

LABEL_29:

  return v11;
}

- (void)setCompletionSections:(id)a3
{
  id v4 = a3;
  BOOL v5 = (NSArray *)[v4 copy];
  completionSections = self->_completionSections;
  self->_completionSections = v5;

  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = sub_100103E8C;
  BOOL v13 = sub_1001047D0;
  id v14 = 0;
  unint64_t v7 = [(AutocompleteItemManager *)self completionSections];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1006BB31C;
  v8[3] = &unk_1012F4D08;
  v8[4] = &v9;
  [v7 enumerateObjectsUsingBlock:v8];

  objc_storeStrong((id *)&self->_interleavedSectionIndex, (id)v10[5]);
  _Block_object_dispose(&v9, 8);
}

- (id)defaultSectionsWithCompletionSections:(id)a3
{
  id v4 = a3;
  double v44 = +[NSMutableArray array];
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id obj = v4;
  id v5 = [obj countByEnumeratingWithState:&v48 objects:v54 count:16];
  if (!v5)
  {
    char v45 = 0;
    id v8 = v44;
    goto LABEL_27;
  }
  id v6 = v5;
  char v45 = 0;
  uint64_t v7 = 0;
  uint64_t v47 = *(void *)v49;
  id v8 = v44;
  do
  {
    uint64_t v9 = 0;
    do
    {
      if (*(void *)v49 != v47) {
        objc_enumerationMutation(obj);
      }
      id v10 = *(void **)(*((void *)&v48 + 1) + 8 * (void)v9);
      if (objc_msgSend(v10, "shouldInterleaveClientResults", v44))
      {
        id v11 = objc_alloc((Class)NSMutableArray);
        id v12 = [v10 includedClientResultTypes];
        id v13 = [v11 initWithCapacity:[v12 count]];

        id v14 = [v10 includedClientResultTypes];
        id v15 = [v14 count];

        if (v15)
        {
          uint64_t v16 = [v10 includedClientResultTypes];
          uint64_t v17 = [(AutocompleteItemManager *)self includingRulesWithTypes:v16];

          if ([v17 count]) {
            [v13 addObjectsFromArray:v17];
          }
        }
        else
        {
          uint64_t v17 = +[NSNumber numberWithUnsignedInteger:v7];
          long long v34 = +[AutocompleteSectionRule ruleMatchingAnySourceTypeWithIndexInCompletionSections:v17];
          [v13 addObject:v34];
        }
        uint64_t v35 = [v10 excludedClientResultTypes];
        unint64_t v23 = [(AutocompleteItemManager *)self excludingRulesWithTypes:v35];

        __int16 v36 = [AutocompleteMutableSection alloc];
        CFStringRef v25 = [v10 title];
        long long v28 = [(AutocompleteMutableSection *)v36 initWithRules:v13 excludingRules:v23 title:v25 isQuerySuggestionsSection:0 isSectionForClientOnlyResults:0];
        char v45 = 1;
        goto LABEL_20;
      }
      if (![v10 isSectionForClientOnlyResults]
        || ([v10 includedClientResultTypes],
            float v18 = objc_claimAutoreleasedReturnValue(),
            id v19 = [v18 count],
            v18,
            !v19))
      {
        id v29 = +[NSNumber numberWithUnsignedInteger:v7];
        id v13 = +[AutocompleteSectionRule ruleWithSourceType:1 indexInCompletionSections:v29];

        unsigned int v30 = [(AutocompleteItemManager *)self topSectionIsQuerySuggestions];
        if (v7) {
          uint64_t v31 = 0;
        }
        else {
          uint64_t v31 = v30;
        }
        long long v32 = [AutocompleteMutableSection alloc];
        id v53 = v13;
        unint64_t v23 = +[NSArray arrayWithObjects:&v53 count:1];
        CFStringRef v25 = [v10 title];
        uint64_t v33 = v31;
        id v8 = v44;
        long long v28 = [(AutocompleteMutableSection *)v32 initWithRules:v23 excludingRules:0 title:v25 isQuerySuggestionsSection:v33 isSectionForClientOnlyResults:0];
        goto LABEL_20;
      }
      id v20 = objc_alloc((Class)NSMutableArray);
      long long v21 = [v10 includedClientResultTypes];
      id v13 = [v20 initWithCapacity:[v21 count]];

      id v22 = [v10 includedClientResultTypes];
      unint64_t v23 = [(AutocompleteItemManager *)self includingRulesWithTypes:v22];

      if ([v23 count])
      {
        [v13 addObjectsFromArray:v23];
        double v24 = [v10 excludedClientResultTypes];
        CFStringRef v25 = [(AutocompleteItemManager *)self excludingRulesWithTypes:v24];

        id v26 = [AutocompleteMutableSection alloc];
        unsigned int v27 = [v10 title];
        long long v28 = [(AutocompleteMutableSection *)v26 initWithRules:v13 excludingRules:v25 title:v27 isQuerySuggestionsSection:0 isSectionForClientOnlyResults:1];

        id v8 = v44;
LABEL_20:

        -[AutocompleteMutableSection setEnforceServerResultsOrder:](v28, "setEnforceServerResultsOrder:", [v10 enforceServerResultsOrder]);
        -[AutocompleteMutableSection setEnableMapsSuggestServerReranking:](v28, "setEnableMapsSuggestServerReranking:", [v10 enableMapsSuggestServerReranking]);
        [v8 addObject:v28];
        ++v7;
        id v13 = v28;
        goto LABEL_21;
      }

LABEL_21:
      uint64_t v9 = (char *)v9 + 1;
    }
    while (v6 != v9);
    id v37 = [obj countByEnumeratingWithState:&v48 objects:v54 count:16];
    id v6 = v37;
  }
  while (v37);
LABEL_27:

  if (![v8 count] || (v45 & 1) == 0)
  {
    __int16 v38 = [AutocompleteMutableSection alloc];
    CFStringRef v39 = +[AutocompleteSectionRule ruleMatchingAnySourceType];
    long long v52 = v39;
    uint64_t v40 = +[NSArray arrayWithObjects:&v52 count:1];
    __int16 v41 = [(AutocompleteMutableSection *)v38 initWithRules:v40 excludingRules:0 title:0 isQuerySuggestionsSection:0 isSectionForClientOnlyResults:0];
    [v44 addObject:v41];

    id v8 = v44;
  }
  id v42 = [v8 copy:v44];

  return v42;
}

- (id)includingRulesWithTypes:(id)a3
{
  id v4 = a3;
  id v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472;
  id v10 = sub_1006BB9F0;
  id v11 = &unk_1012EC5A0;
  id v12 = self;
  id v5 = objc_alloc_init((Class)NSMutableArray);
  id v13 = v5;
  [v4 enumerateObjectsUsingBlock:&v8];

  if (objc_msgSend(v5, "count", v8, v9, v10, v11, v12)) {
    id v6 = [v5 copy];
  }
  else {
    id v6 = 0;
  }

  return v6;
}

- (id)excludingRulesWithTypes:(id)a3
{
  id v4 = a3;
  id v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472;
  id v10 = sub_1006BBB48;
  id v11 = &unk_1012EC5A0;
  id v12 = self;
  id v5 = objc_alloc_init((Class)NSMutableArray);
  id v13 = v5;
  [v4 enumerateObjectsUsingBlock:&v8];

  if (objc_msgSend(v5, "count", v8, v9, v10, v11, v12)) {
    id v6 = [v5 copy];
  }
  else {
    id v6 = 0;
  }

  return v6;
}

- (id)ruleWithClientOnlyAutocompleteType:(int)a3
{
  id v3 = 0;
  switch(a3)
  {
    case 1:
      uint64_t v4 = 6;
      goto LABEL_9;
    case 2:
      uint64_t v5 = 5;
      uint64_t v6 = 5;
      goto LABEL_13;
    case 3:
      uint64_t v5 = 5;
      uint64_t v6 = 4;
      goto LABEL_13;
    case 4:
      uint64_t v5 = 7;
      uint64_t v6 = 11;
      goto LABEL_13;
    case 5:
      uint64_t v5 = 7;
      uint64_t v6 = 9;
      goto LABEL_13;
    case 6:
      uint64_t v5 = 7;
      uint64_t v6 = 10;
      goto LABEL_13;
    case 7:
      uint64_t v4 = 4;
LABEL_9:
      id v3 = +[AutocompleteSectionRule ruleWithSourceType:v4];
      break;
    case 8:
      uint64_t v5 = 9;
      uint64_t v6 = 18;
      goto LABEL_13;
    case 12:
      uint64_t v5 = 9;
      uint64_t v6 = 19;
      goto LABEL_13;
    case 13:
      uint64_t v5 = 3;
      uint64_t v6 = 2;
LABEL_13:
      id v3 = +[AutocompleteSectionRule ruleWithSourceType:v5 sourceSubtype:v6];
      break;
    default:
      break;
  }

  return v3;
}

- (id)excludingRuleWithClientOnlyAutocompleteType:(int)a3
{
  id v3 = 0;
  switch(a3)
  {
    case 1:
      uint64_t v4 = 6;
      goto LABEL_9;
    case 2:
      uint64_t v5 = 5;
      uint64_t v6 = 5;
      goto LABEL_13;
    case 3:
      uint64_t v5 = 5;
      uint64_t v6 = 4;
      goto LABEL_13;
    case 4:
      uint64_t v5 = 7;
      uint64_t v6 = 11;
      goto LABEL_13;
    case 5:
      uint64_t v5 = 7;
      uint64_t v6 = 9;
      goto LABEL_13;
    case 6:
      uint64_t v5 = 7;
      uint64_t v6 = 10;
      goto LABEL_13;
    case 7:
      uint64_t v4 = 4;
LABEL_9:
      id v3 = +[AutocompleteSectionRule ruleExcludingSourceType:v4];
      break;
    case 8:
      uint64_t v5 = 9;
      uint64_t v6 = 18;
      goto LABEL_13;
    case 12:
      uint64_t v5 = 9;
      uint64_t v6 = 19;
      goto LABEL_13;
    case 13:
      uint64_t v5 = 3;
      uint64_t v6 = 2;
LABEL_13:
      id v3 = +[AutocompleteSectionRule ruleExcludingSourceType:v5 sourceSubtype:v6];
      break;
    default:
      break;
  }

  return v3;
}

- (AutocompleteContext)autocompleteContext
{
  return self->_autocompleteContext;
}

- (void)setAutocompleteContext:(id)a3
{
}

- (GEOMapServiceTraits)traits
{
  return self->_traits;
}

- (void)setTraits:(id)a3
{
}

- (NSArray)sections
{
  return self->_sections;
}

- (NSArray)completionSections
{
  return self->_completionSections;
}

- (BOOL)topSectionIsQuerySuggestions
{
  return self->_topSectionIsQuerySuggestions;
}

- (void)setTopSectionIsQuerySuggestions:(BOOL)a3
{
  self->_topSectionIsQuerySuggestions = a3;
}

- (BOOL)shouldUseDistanceFeatureServerResults
{
  return self->_shouldUseDistanceFeatureServerResults;
}

- (void)setShouldUseDistanceFeatureServerResults:(BOOL)a3
{
  self->_shouldUseDistanceFeatureServerResults = a3;
}

- (BOOL)clientRankingScoreInfluencedResults
{
  return self->_clientRankingScoreInfluencedResults;
}

- (BOOL)mapsSuggestionsIsTouristHereScoreValid
{
  return self->_mapsSuggestionsIsTouristHereScoreValid;
}

- (void)setMapsSuggestionsIsTouristHereScoreValid:(BOOL)a3
{
  self->_mapsSuggestionsIsTouristHereScoreValid = a3;
}

- (double)mapsSuggestionsIsTouristHereScore
{
  return self->_mapsSuggestionsIsTouristHereScore;
}

- (void)setMapsSuggestionsIsTouristHereScore:(double)a3
{
  self->_mapsSuggestionsIsTouristHereScore = a3;
}

- (NSNumber)interleavedSectionIndex
{
  return self->_interleavedSectionIndex;
}

- (void)setInterleavedSectionIndex:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interleavedSectionIndex, 0);
  objc_storeStrong((id *)&self->_completionSections, 0);
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_traits, 0);

  objc_storeStrong((id *)&self->_autocompleteContext, 0);
}

@end