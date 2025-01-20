@interface PGLocationTripTitleUtility
+ (BOOL)visitedLocations:(id)a3 onlyDuringMoments:(id)a4 locationHelper:(id)a5;
+ (id)_filteredCityNodesByNameForCityNodes:(id)a3;
+ (void)_aoiTitleWithLocationNodes:(id)a3 momentNodes:(id)a4 allowLongAOI:(BOOL)a5 graph:(id)a6 locationHelper:(id)a7 result:(id)a8;
+ (void)_cityStateAndCountryNodesForLocationNodes:(id)a3 result:(id)a4;
- (BOOL)allowLongAOI;
- (BOOL)filterMomentsAndCities;
- (NSArray)usedTitleComponents;
- (NSSet)filteredLocationNodes;
- (NSSet)momentNodes;
- (NSSet)usedLocationNodes;
- (NSString)title;
- (PGIncompleteLocationResolver)incompleteLocationResolver;
- (PGLocationTripTitleUtility)initWithMomentNodes:(id)a3 filterMomentsAndCities:(BOOL)a4 allowLongAOI:(BOOL)a5 locationHelper:(id)a6;
- (PGLocationTripTitleUtility)initWithMomentNodes:(id)a3 filterMomentsAndCities:(BOOL)a4 locationHelper:(id)a5;
- (id)_bestAddressNodeForCityNodes:(id)a3 inMomentNodes:(id)a4;
- (id)_cityNodesFromMomentNodes:(id)a3;
- (id)_locationTitleWithLocationNode:(id)a3 addressNode:(id)a4 countryNode:(id)a5 allowSecondPart:(BOOL)a6;
- (unint64_t)tripTitleLocationType;
- (unint64_t)tripTitleType;
- (void)_cityTitleWithCityNode:(id)a3 countryNode:(id)a4 visitedCountryOnlyOnce:(BOOL)a5 momentNodes:(id)a6 result:(id)a7;
- (void)_generateLocationTitle;
- (void)_generateTitleForMomentNodes:(id)a3 resolvedMomentNodes:(id)a4 resolvedLocations:(id)a5;
- (void)_resolveMomentNodes:(id)a3 withResult:(id)a4;
- (void)setAllowLongAOI:(BOOL)a3;
- (void)setFilterMomentsAndCities:(BOOL)a3;
- (void)setFilteredLocationNodes:(id)a3;
- (void)setIncompleteLocationResolver:(id)a3;
- (void)setMomentNodes:(id)a3;
- (void)setTitle:(id)a3;
- (void)setUsedLocationNodes:(id)a3;
- (void)setUsedTitleComponents:(id)a3;
@end

@implementation PGLocationTripTitleUtility

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filteredLocationNodes, 0);
  objc_storeStrong((id *)&self->_usedTitleComponents, 0);
  objc_storeStrong((id *)&self->_incompleteLocationResolver, 0);
  objc_storeStrong((id *)&self->_momentNodes, 0);
  objc_storeStrong((id *)&self->_usedLocationNodes, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_locationHelper, 0);
}

- (void)setFilteredLocationNodes:(id)a3
{
}

- (NSSet)filteredLocationNodes
{
  return self->_filteredLocationNodes;
}

- (unint64_t)tripTitleLocationType
{
  return self->_tripTitleLocationType;
}

- (unint64_t)tripTitleType
{
  return self->_tripTitleType;
}

- (void)setUsedTitleComponents:(id)a3
{
}

- (NSArray)usedTitleComponents
{
  return self->_usedTitleComponents;
}

- (void)setIncompleteLocationResolver:(id)a3
{
}

- (PGIncompleteLocationResolver)incompleteLocationResolver
{
  return self->_incompleteLocationResolver;
}

- (void)setAllowLongAOI:(BOOL)a3
{
  self->_allowLongAOI = a3;
}

- (BOOL)allowLongAOI
{
  return self->_allowLongAOI;
}

- (void)setFilterMomentsAndCities:(BOOL)a3
{
  self->_filterMomentsAndCities = a3;
}

- (BOOL)filterMomentsAndCities
{
  return self->_filterMomentsAndCities;
}

- (void)setMomentNodes:(id)a3
{
}

- (NSSet)momentNodes
{
  return self->_momentNodes;
}

- (void)setUsedLocationNodes:(id)a3
{
}

- (NSSet)usedLocationNodes
{
  return self->_usedLocationNodes;
}

- (void)setTitle:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (id)_locationTitleWithLocationNode:(id)a3 addressNode:(id)a4 countryNode:(id)a5 allowSecondPart:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = +[PGLocationTitleUtility beautifiedLocationNodeStringWithPlaceNode:v10 locationHelper:self->_locationHelper];
  if (v6)
  {
    v14 = [v12 graph];
    v15 = [v14 supersetCountryNodes];

    if ([v15 containsNode:v12])
    {
    }
    else
    {
      v16 = [v12 name];
      BOOL v17 = +[PGCountrySize isLargeCountry:v16];

      if (v17) {
        uint64_t v18 = 8;
      }
      else {
        uint64_t v18 = 9;
      }
      id v19 = +[PGLocationTitleUtility _twoPartLocationTitleWithFirstPartTitle:v13 withDimension:v18 usedFirstPartLocationNode:v10 addressNode:v11 locationHelper:self->_locationHelper];

      if (v19) {
        goto LABEL_9;
      }
    }
  }
  id v19 = v13;
LABEL_9:

  return v19;
}

- (id)_bestAddressNodeForCityNodes:(id)a3 inMomentNodes:(id)a4
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v27 = a4;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id obj = v5;
  uint64_t v28 = [obj countByEnumeratingWithState:&v51 objects:v57 count:16];
  if (v28)
  {
    id v6 = 0;
    uint64_t v26 = *(void *)v52;
    double v7 = -1.79769313e308;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v52 != v26)
        {
          uint64_t v9 = v8;
          objc_enumerationMutation(obj);
          uint64_t v8 = v9;
        }
        uint64_t v29 = v8;
        uint64_t v10 = *(void *)(*((void *)&v51 + 1) + 8 * v8);
        long long v47 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        long long v50 = 0u;
        id v30 = v27;
        uint64_t v11 = [v30 countByEnumeratingWithState:&v47 objects:v56 count:16];
        if (v11)
        {
          uint64_t v12 = *(void *)v48;
          do
          {
            for (uint64_t i = 0; i != v11; ++i)
            {
              if (*(void *)v48 != v12) {
                objc_enumerationMutation(v30);
              }
              v14 = *(void **)(*((void *)&v47 + 1) + 8 * i);
              uint64_t v43 = 0;
              v44 = (double *)&v43;
              uint64_t v45 = 0x2020000000;
              uint64_t v46 = 0;
              *(void *)buf = 0;
              v38 = buf;
              uint64_t v39 = 0x3032000000;
              v40 = __Block_byref_object_copy__49852;
              v41 = __Block_byref_object_dispose__49853;
              id v42 = 0;
              v36[0] = MEMORY[0x1E4F143A8];
              v36[1] = 3221225472;
              v36[2] = __73__PGLocationTripTitleUtility__bestAddressNodeForCityNodes_inMomentNodes___block_invoke;
              v36[3] = &unk_1E68EB160;
              v36[4] = self;
              v36[5] = v10;
              v36[6] = &v43;
              v36[7] = buf;
              [v14 enumerateAddressEdgesAndNodesUsingBlock:v36];
              double v15 = v44[3];
              if (v15 > v7)
              {
                id v16 = *((id *)v38 + 5);
                BOOL v17 = v6;
                id v6 = v16;

                double v7 = v15;
              }
              _Block_object_dispose(buf, 8);

              _Block_object_dispose(&v43, 8);
            }
            uint64_t v11 = [v30 countByEnumeratingWithState:&v47 objects:v56 count:16];
          }
          while (v11);
        }

        uint64_t v8 = v29 + 1;
      }
      while (v29 + 1 != v28);
      uint64_t v28 = [obj countByEnumeratingWithState:&v51 objects:v57 count:16];
    }
    while (v28);

    if (v6) {
      goto LABEL_32;
    }
  }
  else
  {
  }
  uint64_t v18 = +[PGLogging sharedLogging];
  id v19 = [v18 loggingConnection];

  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D1805000, v19, OS_LOG_TYPE_INFO, "Could not find best address for city in moments. Using any address", buf, 2u);
  }

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v20 = v27;
  uint64_t v21 = [v20 countByEnumeratingWithState:&v32 objects:v55 count:16];
  if (v21)
  {
    uint64_t v22 = *(void *)v33;
LABEL_24:
    uint64_t v23 = 0;
    while (1)
    {
      if (*(void *)v33 != v22) {
        objc_enumerationMutation(v20);
      }
      id v6 = [*(id *)(*((void *)&v32 + 1) + 8 * v23) bestAddressNode];
      if (v6) {
        break;
      }
      if (v21 == ++v23)
      {
        uint64_t v21 = [v20 countByEnumeratingWithState:&v32 objects:v55 count:16];
        if (v21) {
          goto LABEL_24;
        }
        goto LABEL_30;
      }
    }
  }
  else
  {
LABEL_30:
    id v6 = 0;
  }

LABEL_32:
  return v6;
}

void __73__PGLocationTripTitleUtility__bestAddressNodeForCityNodes_inMomentNodes___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  id v6 = [*(id *)(*(void *)(a1 + 32) + 8) cityNodeFromAddressNode:v5];
  double v7 = [v6 anyNode];

  if (!v7)
  {
    double v7 = [*(id *)(*(void *)(a1 + 32) + 48) resolvedLocationNodeForIncompleteAddressNode:v5 withTargetDimension:6];
  }
  if ([*(id *)(a1 + 40) isSameNodeAsNode:v7])
  {
    [v10 relevance];
    if (v8 > *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
    {
      [v10 relevance];
      *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v9;
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a3);
    }
  }
}

- (void)_cityTitleWithCityNode:(id)a3 countryNode:(id)a4 visitedCountryOnlyOnce:(BOOL)a5 momentNodes:(id)a6 result:(id)a7
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v28 = a3;
  id v10 = a4;
  id v11 = a6;
  uint64_t v12 = (void (**)(id, void *, void *))a7;
  uint64_t v34 = 0;
  long long v35 = &v34;
  uint64_t v36 = 0x2020000000;
  char v37 = 0;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v13 = v11;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v30 objects:v39 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v31;
LABEL_3:
    uint64_t v16 = 0;
    while (1)
    {
      if (*(void *)v31 != v15) {
        objc_enumerationMutation(v13);
      }
      BOOL v17 = *(void **)(*((void *)&v30 + 1) + 8 * v16);
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __107__PGLocationTripTitleUtility__cityTitleWithCityNode_countryNode_visitedCountryOnlyOnce_momentNodes_result___block_invoke;
      v29[3] = &unk_1E68EB138;
      v29[4] = &v34;
      [v17 enumerateROINodesUsingBlock:v29];
      if (*((unsigned char *)v35 + 24)) {
        break;
      }
      if (v14 == ++v16)
      {
        uint64_t v14 = [v13 countByEnumeratingWithState:&v30 objects:v39 count:16];
        if (v14) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  uint64_t v18 = v10;
  int v19 = *((unsigned __int8 *)v35 + 24);
  id v20 = v28;
  uint64_t v21 = v20;
  if (v19 || !a5)
  {
    v24 = [v20 name];
  }
  else
  {
    id v38 = v20;
    uint64_t v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v38 count:1];
    uint64_t v23 = [(PGLocationTripTitleUtility *)self _bestAddressNodeForCityNodes:v22 inMomentNodes:v13];

    v24 = [(PGLocationTripTitleUtility *)self _locationTitleWithLocationNode:v21 addressNode:v23 countryNode:v18 allowSecondPart:1];
  }
  if (v21) {
    [MEMORY[0x1E4F1CAD0] setWithObject:v21];
  }
  else {
  v25 = [MEMORY[0x1E4F1CAD0] set];
  }
  if (v12) {
    v12[2](v12, v24, v25);
  }

  _Block_object_dispose(&v34, 8);
}

void __107__PGLocationTripTitleUtility__cityTitleWithCityNode_countryNode_visitedCountryOnlyOnce_momentNodes_result___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = [a2 label];
  int v6 = [v5 isEqualToString:@"Urban"];

  if (v6)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a3 = 1;
  }
}

- (id)_cityNodesFromMomentNodes:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA48] array];
  int v6 = [MEMORY[0x1E4F28E10] mapTableWithKeyOptions:0 valueOptions:0];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = v4;
  uint64_t v7 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        v17[0] = MEMORY[0x1E4F143A8];
        v17[1] = 3221225472;
        v17[2] = __56__PGLocationTripTitleUtility__cityNodesFromMomentNodes___block_invoke;
        v17[3] = &unk_1E68EB0E8;
        v17[4] = self;
        id v18 = v6;
        id v19 = v5;
        [v11 enumerateAddressEdgesAndNodesUsingBlock:v17];
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v8);
  }

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __56__PGLocationTripTitleUtility__cityNodesFromMomentNodes___block_invoke_2;
  v15[3] = &unk_1E68EB110;
  id v16 = v6;
  id v12 = v6;
  [v5 sortUsingComparator:v15];

  return v5;
}

void __56__PGLocationTripTitleUtility__cityNodesFromMomentNodes___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v15 = a2;
  id v5 = a3;
  int v6 = [*(id *)(*(void *)(a1 + 32) + 8) closestLocationNodeFromLocationNode:v5 withDimension:6 reverse:0];
  uint64_t v7 = [v6 label];
  unint64_t v8 = +[PGCommonTitleUtility dimensionForLabel:v7];

  if (v8 >= 7)
  {
    uint64_t v9 = [*(id *)(*(void *)(a1 + 32) + 48) resolvedLocationNodeForIncompleteAddressNode:v5 withTargetDimension:6];
    id v10 = v9;
    if (v9)
    {
      id v11 = v9;

      unint64_t v8 = 6;
      int v6 = v11;
    }
  }
  if (v6)
  {
    id v12 = [v15 universalStartDate];
    uint64_t v13 = [*(id *)(a1 + 40) objectForKey:v6];
    uint64_t v14 = (void *)v13;
    if (v12 && (!v13 || [v12 compare:v13] == -1)) {
      [*(id *)(a1 + 40) setObject:v12 forKey:v6];
    }
    if (v8 == 6 && ([*(id *)(a1 + 48) containsObject:v6] & 1) == 0) {
      [*(id *)(a1 + 48) addObject:v6];
    }
  }
}

uint64_t __56__PGLocationTripTitleUtility__cityNodesFromMomentNodes___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  uint64_t v7 = [v5 objectForKey:a2];
  unint64_t v8 = [*(id *)(a1 + 32) objectForKey:v6];

  if (v7)
  {
    if (v8) {
      uint64_t v9 = [v7 compare:v8];
    }
    else {
      uint64_t v9 = -1;
    }
  }
  else
  {
    uint64_t v9 = 1;
  }

  return v9;
}

- (void)_resolveMomentNodes:(id)a3 withResult:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void *, void *))a4;
  unint64_t v8 = [[PGLocationsResolver alloc] initWithSortedMomentNodes:v6 incompleteLocationResolver:self->_incompleteLocationResolver locationHelper:self->_locationHelper];
  if (self->_filterMomentsAndCities)
  {
    uint64_t v9 = [v6 firstObject];
    id v10 = [v9 graph];

    id v11 = [(MAElementCollection *)[PGGraphMomentNodeCollection alloc] initWithArray:v6 graph:v10];
    id v12 = [(PGGraphMomentNodeCollection *)v11 frequentLocationNodes];

    uint64_t v13 = [v12 addressNodes];
    uint64_t v14 = [v13 cityNodes];

    id v15 = [v14 temporarySet];
    [(PGLocationsResolver *)v8 setIgnoredLocationNodes:v15];
  }
  id v16 = [(PGLocationsResolver *)v8 resolvedMomentNodes];
  BOOL v17 = [(PGLocationsResolver *)v8 resolvedLocationNodes];
  if (![v16 count])
  {
    id v18 = +[PGLogging sharedLogging];
    id v19 = [v18 loggingConnection];

    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v24 = 0;
      _os_log_impl(&dword_1D1805000, v19, OS_LOG_TYPE_INFO, "Filtered out all moments. Resetting to all moments.", v24, 2u);
    }

    id v20 = v6;
    id v16 = v20;
  }
  if (![v17 count])
  {
    uint64_t v21 = [(PGLocationTripTitleUtility *)self _cityNodesFromMomentNodes:v16];

    BOOL v17 = (void *)v21;
  }
  if (self->_filterMomentsAndCities)
  {
    long long v22 = [[PGLocationsFilterer alloc] initWithSortedMomentNodes:v6 locationNodes:v17 incompleteLocationResolver:self->_incompleteLocationResolver];
    uint64_t v23 = [(PGLocationsFilterer *)v22 filteredLocationNodes];

    BOOL v17 = (void *)v23;
  }
  if (v7) {
    v7[2](v7, v16, v17);
  }
}

- (void)_generateTitleForMomentNodes:(id)a3 resolvedMomentNodes:(id)a4 resolvedLocations:(id)a5
{
  uint64_t v276 = *MEMORY[0x1E4F143B8];
  id v188 = a3;
  id v7 = a4;
  id v186 = a5;
  v187 = v7;
  unint64_t v8 = [v7 firstObject];
  v189 = [v8 graph];

  if (v189)
  {
    *(void *)buf = 0;
    v253 = buf;
    uint64_t v254 = 0x3032000000;
    v255 = __Block_byref_object_copy__49852;
    v256 = __Block_byref_object_dispose__49853;
    id v257 = 0;
    uint64_t v246 = 0;
    v247 = &v246;
    uint64_t v248 = 0x3032000000;
    v249 = __Block_byref_object_copy__49852;
    v250 = __Block_byref_object_dispose__49853;
    id v251 = [MEMORY[0x1E4F1CAD0] set];
    uint64_t v240 = 0;
    v241 = &v240;
    uint64_t v242 = 0x3032000000;
    v243 = __Block_byref_object_copy__49852;
    v244 = __Block_byref_object_dispose__49853;
    id v245 = [MEMORY[0x1E4F1CAD0] set];
    uint64_t v234 = 0;
    v235 = &v234;
    uint64_t v236 = 0x3032000000;
    v237 = __Block_byref_object_copy__49852;
    v238 = __Block_byref_object_dispose__49853;
    id v239 = 0;
    uint64_t v228 = 0;
    v229 = &v228;
    uint64_t v230 = 0x3032000000;
    v231 = __Block_byref_object_copy__49852;
    v232 = __Block_byref_object_dispose__49853;
    id v233 = 0;
    uint64_t v222 = 0;
    v223 = &v222;
    uint64_t v224 = 0x3032000000;
    v225 = __Block_byref_object_copy__49852;
    v226 = __Block_byref_object_dispose__49853;
    id v227 = 0;
    uint64_t v9 = objc_opt_class();
    v221[0] = MEMORY[0x1E4F143A8];
    v221[1] = 3221225472;
    v221[2] = __97__PGLocationTripTitleUtility__generateTitleForMomentNodes_resolvedMomentNodes_resolvedLocations___block_invoke;
    v221[3] = &unk_1E68EAFD0;
    v221[4] = &v234;
    v221[5] = &v228;
    v221[6] = &v222;
    [v9 _cityStateAndCountryNodesForLocationNodes:v186 result:v221];
    if (![(id)v223[5] count])
    {
      id v10 = [MEMORY[0x1E4F1CA48] array];
      id v11 = [MEMORY[0x1E4F1CA48] array];
      long long v219 = 0u;
      long long v220 = 0u;
      long long v217 = 0u;
      long long v218 = 0u;
      id obj = v188;
      uint64_t v12 = [obj countByEnumeratingWithState:&v217 objects:v275 count:16];
      if (v12)
      {
        uint64_t v13 = *(void *)v218;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v218 != v13) {
              objc_enumerationMutation(obj);
            }
            id v15 = [*(id *)(*((void *)&v217 + 1) + 8 * i) collection];
            id v16 = [v15 addressNodes];
            BOOL v17 = [v16 stateNodes];
            v214[0] = MEMORY[0x1E4F143A8];
            v214[1] = 3221225472;
            v214[2] = __97__PGLocationTripTitleUtility__generateTitleForMomentNodes_resolvedMomentNodes_resolvedLocations___block_invoke_2;
            v214[3] = &unk_1E68EB020;
            id v215 = v11;
            id v216 = v10;
            [v17 enumerateNodesUsingBlock:v214];
          }
          uint64_t v12 = [obj countByEnumeratingWithState:&v217 objects:v275 count:16];
        }
        while (v12);
      }

      id v18 = (void *)v223[5];
      v223[5] = (uint64_t)v10;
      id v19 = v10;

      id v20 = (void *)v229[5];
      v229[5] = (uint64_t)v11;
    }
    if ([(id)v223[5] count] == 1
      && ([(id)v223[5] firstObject],
          uint64_t v21 = objc_claimAutoreleasedReturnValue(),
          [v21 name],
          long long v22 = objc_claimAutoreleasedReturnValue(),
          BOOL v23 = +[PGCountrySize isLargeCountry:v22],
          v22,
          v21,
          v23))
    {
      uint64_t v24 = [(id)v229[5] count];
      int v183 = 1;
    }
    else
    {
      uint64_t v24 = [(id)v223[5] count];
      int v183 = 0;
    }
    id obja = [v189 supersetCountryNodes];
    unint64_t v182 = v24;
    v191 = [v189 supersetStateNodes];
    long long v212 = 0u;
    long long v213 = 0u;
    long long v210 = 0u;
    long long v211 = 0u;
    id v25 = (id)v223[5];
    uint64_t v26 = [v25 countByEnumeratingWithState:&v210 objects:v274 count:16];
    if (v26)
    {
      uint64_t v27 = *(void *)v211;
      while (2)
      {
        for (uint64_t j = 0; j != v26; ++j)
        {
          if (*(void *)v211 != v27) {
            objc_enumerationMutation(v25);
          }
          if (([obja containsNode:*(void *)(*((void *)&v210 + 1) + 8 * j)] & 1) == 0)
          {
            int v184 = 0;
            goto LABEL_25;
          }
        }
        uint64_t v26 = [v25 countByEnumeratingWithState:&v210 objects:v274 count:16];
        if (v26) {
          continue;
        }
        break;
      }
    }
    int v184 = 1;
LABEL_25:

    uint64_t v29 = self;
    v185 = [(MAElementCollection *)[PGGraphMomentNodeCollection alloc] initWithSet:self->_momentNodes graph:v189];
    if (v223[5])
    {
      long long v30 = [PGGraphLocationCountryNodeCollection alloc];
      long long v31 = [(MAElementCollection *)v30 initWithArray:v223[5] graph:v189];
      long long v32 = [(PGGraphLocationHelper *)self->_locationHelper addressNodesFromLocationNodes:v31];
      unsigned int v180 = [(id)objc_opt_class() visitedLocations:v32 onlyDuringMoments:v185 locationHelper:self->_locationHelper];

      uint64_t v29 = self;
    }
    else
    {
      unsigned int v180 = 0;
    }
    long long v35 = v229;
    if (v229[5])
    {
      uint64_t v36 = [PGGraphLocationStateNodeCollection alloc];
      char v37 = [(MAElementCollection *)v36 initWithArray:v229[5] graph:v189];
      id v38 = [(PGGraphLocationHelper *)v29->_locationHelper addressNodesFromLocationNodes:v37];
      int v181 = [(id)objc_opt_class() visitedLocations:v38 onlyDuringMoments:v185 locationHelper:v29->_locationHelper];

      long long v35 = v229;
    }
    else
    {
      int v181 = 0;
    }
    long long v208 = 0u;
    long long v209 = 0u;
    long long v206 = 0u;
    long long v207 = 0u;
    id v39 = (id)v35[5];
    uint64_t v40 = [v39 countByEnumeratingWithState:&v206 objects:v273 count:16];
    if (v40)
    {
      uint64_t v41 = *(void *)v207;
      while (2)
      {
        for (uint64_t k = 0; k != v40; ++k)
        {
          if (*(void *)v207 != v41) {
            objc_enumerationMutation(v39);
          }
          if ([v191 containsNode:*(void *)(*((void *)&v206 + 1) + 8 * k)])
          {
            int v179 = 1;
            goto LABEL_44;
          }
        }
        uint64_t v40 = [v39 countByEnumeratingWithState:&v206 objects:v273 count:16];
        if (v40) {
          continue;
        }
        break;
      }
    }
    int v179 = 0;
LABEL_44:

    long long v204 = 0u;
    long long v205 = 0u;
    long long v202 = 0u;
    long long v203 = 0u;
    id v43 = (id)v223[5];
    uint64_t v44 = [v43 countByEnumeratingWithState:&v202 objects:v272 count:16];
    if (v44)
    {
      uint64_t v45 = *(void *)v203;
      int v46 = 1;
      int v47 = 1;
      do
      {
        for (uint64_t m = 0; m != v44; ++m)
        {
          if (*(void *)v203 != v45) {
            objc_enumerationMutation(v43);
          }
          long long v49 = *(void **)(*((void *)&v202 + 1) + 8 * m);
          int v50 = [obja containsNode:v49];
          long long v51 = [v49 name];
          BOOL v52 = +[PGCountrySize isLargeCountry:v51];

          v47 &= v50 ^ 1;
          v46 &= !v52;
        }
        uint64_t v44 = [v43 countByEnumeratingWithState:&v202 objects:v272 count:16];
      }
      while (v44);
    }
    else
    {
      int v46 = 1;
      int v47 = 1;
    }

    long long v53 = [v188 firstObject];
    long long v54 = [v188 lastObject];
    v55 = [v54 universalEndDate];
    v56 = [v53 universalStartDate];
    [v55 timeIntervalSinceDate:v56];
    double v58 = v57;

    BOOL v59 = v58 >= 1209600.0 && (unint64_t)[(id)v223[5] count] > 4;
    uint64_t v60 = [(id)objc_opt_class() _filteredCityNodesByNameForCityNodes:v235[5]];
    v61 = (void *)v235[5];
    v235[5] = v60;

    unint64_t v62 = [(id)v235[5] count];
    unint64_t v63 = v62;
    BOOL v65 = (float)((float)v182 * 1.2) > (float)v62 && v62 != 0;
    v66 = self->_locationHelper;
    uint64_t v67 = [(id)v229[5] count];
    int v68 = v183 | v184;
    if (v67 != 1) {
      int v68 = 0;
    }
    if ((v68 & v181) == 1)
    {
      v69 = [(id)v229[5] firstObject];
      uint64_t v70 = +[PGLocationTitleUtility beautifiedLocationNodeStringWithPlaceNode:v69 locationHelper:v66];
      v71 = (void *)v70;
      if (v70)
      {
        uint64_t v271 = v70;
        uint64_t v72 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v271 count:1];
        v73 = (void *)*((void *)v253 + 5);
        *((void *)v253 + 5) = v72;

        uint64_t v74 = [MEMORY[0x1E4F1CAD0] setWithObject:v69];
        v75 = (void *)v247[5];
        v247[5] = v74;

        uint64_t v76 = [MEMORY[0x1E4F1CAD0] setWithObject:v69];
        v77 = (void *)v241[5];
        v241[5] = v76;

        self->_tripTitleLocationType = 2;
        if (v184) {
          self->_tripTitleType = 2;
        }
      }
    }
    else
    {
      uint64_t v78 = [(id)v223[5] count];
      int v79 = v183;
      if (v78 != 1) {
        int v79 = 1;
      }
      if ((v184 | v79) & 1) != 0 || ((v180 ^ 1))
      {
        if (v63 == 1)
        {
          v69 = [(id)v235[5] firstObject];
          v87 = [(id)v223[5] firstObject];
          v201[0] = MEMORY[0x1E4F143A8];
          v201[1] = 3221225472;
          v201[2] = __97__PGLocationTripTitleUtility__generateTitleForMomentNodes_resolvedMomentNodes_resolvedLocations___block_invoke_4;
          v201[3] = &unk_1E68EB048;
          v201[6] = &v246;
          v201[7] = &v240;
          v201[4] = self;
          v201[5] = buf;
          [(PGLocationTripTitleUtility *)self _cityTitleWithCityNode:v69 countryNode:v87 visitedCountryOnlyOnce:v180 momentNodes:v187 result:v201];

          goto LABEL_110;
        }
        if (((v179 | v183 ^ 1) & 1) != 0 || v63 < 3)
        {
          int v99 = v46 ^ 1;
          if (v63 < 3) {
            int v99 = 1;
          }
          if ((v99 | v47 ^ 1 | v59))
          {
            if (v65) {
              goto LABEL_93;
            }
            char v100 = v184 ^ 1;
            if (v63 - 1 > 3) {
              char v100 = 1;
            }
            if (v100)
            {
              if (!v183
                || ![(id)v229[5] count]
                || (unint64_t)[(id)v229[5] count] >= 5)
              {
                if (!v184)
                {
                  if (![(id)v223[5] count]) {
                    goto LABEL_111;
                  }
                  v69 = [(id)v223[5] firstObject];
                  v160 = [(id)v223[5] lastObject];
                  v161 = +[PGLocationTitleUtility beautifiedLocationNodeStringWithPlaceNode:v69 locationHelper:v66];
                  v162 = +[PGLocationTitleUtility beautifiedLocationNodeStringWithPlaceNode:v160 locationHelper:v66];
                  uint64_t v163 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", v69, v160, 0);
                  v164 = (void *)v247[5];
                  v247[5] = v163;

                  uint64_t v165 = [MEMORY[0x1E4F1CAD0] setWithArray:v223[5]];
                  v166 = (void *)v241[5];
                  v241[5] = v165;

                  self->_tripTitleLocationType = 3;
                  if (v161)
                  {
                    int v167 = [v69 isSameNodeAsNode:v160];
                    if (v162) {
                      int v168 = v167;
                    }
                    else {
                      int v168 = 1;
                    }
                    if (v168 == 1)
                    {
                      v261 = v161;
                      uint64_t v169 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v261 count:1];
                      v170 = (void *)*((void *)v253 + 5);
                      *((void *)v253 + 5) = v169;
                    }
                    else if (v59)
                    {
                      v173 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
                      v174 = [v173 localizedStringForKey:@"PGLocationTitleFormatTripWorldTrip" value:@"PGLocationTitleFormatTripWorldTrip" table:@"Localizable"];
                      v259 = v174;
                      uint64_t v175 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v259 count:1];
                      v176 = (void *)*((void *)v253 + 5);
                      *((void *)v253 + 5) = v175;
                    }
                    else
                    {
                      v260[0] = v161;
                      v260[1] = v162;
                      uint64_t v177 = [MEMORY[0x1E4F1C978] arrayWithObjects:v260 count:2];
                      v178 = (void *)*((void *)v253 + 5);
                      *((void *)v253 + 5) = v177;

                      if ((unint64_t)[(id)v223[5] count] >= 3) {
                        self->_tripTitleType = 4;
                      }
                    }
                  }

                  goto LABEL_110;
                }
                if (![(id)v229[5] count]) {
                  goto LABEL_111;
                }
              }
              v69 = [(id)v229[5] firstObject];
              v147 = [(id)v229[5] lastObject];
              v148 = +[PGLocationTitleUtility beautifiedLocationNodeStringWithPlaceNode:v69 locationHelper:v66];
              v149 = +[PGLocationTitleUtility beautifiedLocationNodeStringWithPlaceNode:v147 locationHelper:v66];
              uint64_t v150 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", v69, v147, 0);
              v151 = (void *)v247[5];
              v247[5] = v150;

              uint64_t v152 = [MEMORY[0x1E4F1CAD0] setWithArray:v229[5]];
              v153 = (void *)v241[5];
              v241[5] = v152;

              self->_tripTitleLocationType = 2;
              if (v148)
              {
                int v154 = [v69 isSameNodeAsNode:v147];
                if (v149) {
                  int v155 = v154;
                }
                else {
                  int v155 = 1;
                }
                if (v155 == 1)
                {
                  v263 = v148;
                  uint64_t v156 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v263 count:1];
                  v157 = (void *)*((void *)v253 + 5);
                  *((void *)v253 + 5) = v156;
                }
                else
                {
                  v262[0] = v148;
                  v262[1] = v149;
                  uint64_t v171 = [MEMORY[0x1E4F1C978] arrayWithObjects:v262 count:2];
                  v172 = (void *)*((void *)v253 + 5);
                  *((void *)v253 + 5) = v171;

                  if ((unint64_t)[(id)v229[5] count] >= 3) {
                    self->_tripTitleType = 4;
                  }
                }
              }
            }
            else
            {
LABEL_93:
              aBlock[0] = MEMORY[0x1E4F143A8];
              aBlock[1] = 3221225472;
              aBlock[2] = __97__PGLocationTripTitleUtility__generateTitleForMomentNodes_resolvedMomentNodes_resolvedLocations___block_invoke_5;
              aBlock[3] = &unk_1E68EB098;
              id v197 = v187;
              v101 = v66;
              v198 = v101;
              v199 = self;
              v200 = &v234;
              v102 = _Block_copy(aBlock);
              v103 = (*((void (**)(void *, void, void))v102 + 2))(v102, 0, 0);
              v104 = (*((void (**)(void *, uint64_t, void *))v102 + 2))(v102, 1, v103);
              uint64_t v105 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", v103, v104, 0);
              v106 = (void *)v247[5];
              v247[5] = v105;

              uint64_t v107 = [MEMORY[0x1E4F1CAD0] setWithArray:v235[5]];
              v108 = (void *)v241[5];
              v241[5] = v107;

              self->_tripTitleLocationType = 1;
              v109 = +[PGLocationTitleUtility beautifiedLocationNodeStringWithPlaceNode:v103 locationHelper:v101];
              uint64_t v110 = +[PGLocationTitleUtility beautifiedLocationNodeStringWithPlaceNode:v104 locationHelper:v101];
              v111 = (void *)v110;
              if (v109)
              {
                if (v110 && ![v103 isSameNodeAsNode:v104])
                {
                  v264[0] = v109;
                  v264[1] = v111;
                  uint64_t v158 = [MEMORY[0x1E4F1C978] arrayWithObjects:v264 count:2];
                  v159 = (void *)*((void *)v253 + 5);
                  *((void *)v253 + 5) = v158;

                  if ((unint64_t)[(id)v235[5] count] >= 3) {
                    self->_tripTitleType = 4;
                  }
                }
                else
                {
                  v265 = v109;
                  uint64_t v112 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v265 count:1];
                  v113 = (void *)*((void *)v253 + 5);
                  *((void *)v253 + 5) = v112;
                }
              }

              v69 = v197;
            }
LABEL_110:

LABEL_111:
            v130 = objc_opt_class();
            uint64_t v131 = v247[5];
            BOOL allowLongAOI = self->_allowLongAOI;
            v195[0] = MEMORY[0x1E4F143A8];
            v195[1] = 3221225472;
            v195[2] = __97__PGLocationTripTitleUtility__generateTitleForMomentNodes_resolvedMomentNodes_resolvedLocations___block_invoke_7;
            v195[3] = &unk_1E68EB0C0;
            v195[6] = &v246;
            v195[7] = &v240;
            v195[4] = self;
            v195[5] = buf;
            [v130 _aoiTitleWithLocationNodes:v131 momentNodes:v187 allowLongAOI:allowLongAOI graph:v189 locationHelper:v66 result:v195];
            v133 = [*((id *)v253 + 5) firstObject];
            v134 = [*((id *)v253 + 5) lastObject];
            if ([*((id *)v253 + 5) count] == 1 && objc_msgSend(v133, "length"))
            {
              if (self->_tripTitleType != 2) {
                self->_tripTitleType = 1;
              }
              v135 = v133;
            }
            else
            {
              if ((unint64_t)[*((id *)v253 + 5) count] < 2
                || ![v133 length]
                || ![v134 length])
              {
                goto LABEL_124;
              }
              if (self->_tripTitleType == 4)
              {
                v136 = NSString;
                v137 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
                [v137 localizedStringForKey:@"PGLocationTitleTitleFormatTripMultipleLocationsWithLocation %@ otherLocation %@" value:@"PGLocationTitleTitleFormatTripMultipleLocationsWithLocation %@ otherLocation %@" table:@"Localizable"];
              }
              else
              {
                self->_tripTitleType = 3;
                v136 = NSString;
                v137 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
                [v137 localizedStringForKey:@"PGLocationTitleFormatTwoLocationsWithLocation %@ otherLocation %@" value:@"PGLocationTitleFormatTwoLocationsWithLocation %@ otherLocation %@" table:@"Localizable"];
              v138 = };
              v139 = objc_msgSend(v136, "localizedStringWithFormat:", v138, v133, v134);

              v258[0] = v133;
              v258[1] = v134;
              v140 = [MEMORY[0x1E4F1C978] arrayWithObjects:v258 count:2];
              v135 = +[PGCommonTitleUtility titleWithLineBreakForTitle:v139 andUsedNames:v140];
            }
            if (v135)
            {
LABEL_127:
              title = self->_title;
              self->_title = v135;
              v146 = v135;

              objc_storeStrong((id *)&self->_usedLocationNodes, (id)v247[5]);
              objc_storeStrong((id *)&self->_filteredLocationNodes, (id)v241[5]);
              objc_storeStrong((id *)&self->_usedTitleComponents, *((id *)v253 + 5));

              _Block_object_dispose(&v222, 8);
              _Block_object_dispose(&v228, 8);

              _Block_object_dispose(&v234, 8);
              _Block_object_dispose(&v240, 8);

              _Block_object_dispose(&v246, 8);
              _Block_object_dispose(buf, 8);

              goto LABEL_128;
            }
LABEL_124:
            v141 = +[PGLogging sharedLogging];
            v142 = [v141 loggingConnection];

            if (os_log_type_enabled(v142, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)v194 = 0;
              _os_log_impl(&dword_1D1805000, v142, OS_LOG_TYPE_INFO, "Falling back to normal title generation", v194, 2u);
            }

            v143 = (void *)v247[5];
            v247[5] = 0;

            v144 = (void *)v241[5];
            v241[5] = 0;

            v135 = 0;
            goto LABEL_127;
          }
          v69 = [(id)v223[5] firstObject];
          v88 = [(id)v223[5] lastObject];
          v89 = +[PGLocationTitleUtility beautifiedLocationNodeStringWithPlaceNode:v69 locationHelper:v66];
          v90 = +[PGLocationTitleUtility beautifiedLocationNodeStringWithPlaceNode:v88 locationHelper:v66];
          uint64_t v114 = [MEMORY[0x1E4F1CAD0] setWithArray:v223[5]];
          v115 = (void *)v241[5];
          v241[5] = v114;

          self->_tripTitleLocationType = 3;
          if (v89)
          {
            int v116 = [v69 isSameNodeAsNode:v88];
            if (v90) {
              int v117 = v116;
            }
            else {
              int v117 = 1;
            }
            if (v117 == 1)
            {
              v267 = v89;
              uint64_t v118 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v267 count:1];
              v119 = (void *)*((void *)v253 + 5);
              *((void *)v253 + 5) = v118;

              uint64_t v120 = [MEMORY[0x1E4F1CAD0] setWithObject:v69];
              v121 = (void *)v247[5];
              v247[5] = v120;
            }
            else
            {
              v266[0] = v89;
              v266[1] = v90;
              uint64_t v126 = [MEMORY[0x1E4F1C978] arrayWithObjects:v266 count:2];
              v127 = (void *)*((void *)v253 + 5);
              *((void *)v253 + 5) = v126;

              uint64_t v128 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", v69, v88, 0);
              v129 = (void *)v247[5];
              v247[5] = v128;

              if ((unint64_t)[(id)v223[5] count] >= 3) {
                self->_tripTitleType = 4;
              }
            }
          }
        }
        else
        {
          v69 = [(id)v229[5] firstObject];
          v88 = [(id)v229[5] lastObject];
          v89 = +[PGLocationTitleUtility beautifiedLocationNodeStringWithPlaceNode:v69 locationHelper:v66];
          v90 = +[PGLocationTitleUtility beautifiedLocationNodeStringWithPlaceNode:v88 locationHelper:v66];
          uint64_t v91 = [MEMORY[0x1E4F1CAD0] setWithArray:v229[5]];
          v92 = (void *)v241[5];
          v241[5] = v91;

          self->_tripTitleLocationType = 2;
          if (v89)
          {
            int v93 = [v69 isSameNodeAsNode:v88];
            if (v90) {
              int v94 = v93;
            }
            else {
              int v94 = 1;
            }
            if (v94 == 1)
            {
              v269 = v89;
              uint64_t v95 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v269 count:1];
              v96 = (void *)*((void *)v253 + 5);
              *((void *)v253 + 5) = v95;

              uint64_t v97 = [MEMORY[0x1E4F1CAD0] setWithObject:v69];
              v98 = (void *)v247[5];
              v247[5] = v97;
            }
            else
            {
              v268[0] = v89;
              v268[1] = v90;
              uint64_t v122 = [MEMORY[0x1E4F1C978] arrayWithObjects:v268 count:2];
              v123 = (void *)*((void *)v253 + 5);
              *((void *)v253 + 5) = v122;

              uint64_t v124 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", v69, v88, 0);
              v125 = (void *)v247[5];
              v247[5] = v124;

              if ((unint64_t)[(id)v229[5] count] >= 3) {
                self->_tripTitleType = 4;
              }
            }
          }
        }

        goto LABEL_110;
      }
      v69 = [(id)v223[5] firstObject];
      uint64_t v80 = +[PGLocationTitleUtility beautifiedLocationNodeStringWithPlaceNode:v69 locationHelper:v66];
      v71 = (void *)v80;
      if (v80)
      {
        uint64_t v270 = v80;
        uint64_t v81 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v270 count:1];
        v82 = (void *)*((void *)v253 + 5);
        *((void *)v253 + 5) = v81;

        uint64_t v83 = [MEMORY[0x1E4F1CAD0] setWithObject:v69];
        v84 = (void *)v247[5];
        v247[5] = v83;

        uint64_t v85 = [MEMORY[0x1E4F1CAD0] setWithObject:v69];
        v86 = (void *)v241[5];
        v241[5] = v85;

        self->_tripTitleLocationType = 3;
      }
    }

    goto LABEL_110;
  }
  long long v33 = +[PGLogging sharedLogging];
  uint64_t v34 = [v33 loggingConnection];

  if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D1805000, v34, OS_LOG_TYPE_INFO, "No filtered moment nodes, falling back to normal title generation", buf, 2u);
  }

LABEL_128:
}

void __97__PGLocationTripTitleUtility__generateTitleForMomentNodes_resolvedMomentNodes_resolvedLocations___block_invoke(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = *(void *)(a1[4] + 8);
  id v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v7;
  id v17 = v7;

  uint64_t v12 = *(void *)(a1[5] + 8);
  uint64_t v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v8;
  id v14 = v8;

  uint64_t v15 = *(void *)(a1[6] + 8);
  id v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v9;
}

void __97__PGLocationTripTitleUtility__generateTitleForMomentNodes_resolvedMomentNodes_resolvedLocations___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (([*(id *)(a1 + 32) containsObject:v3] & 1) == 0) {
    [*(id *)(a1 + 32) addObject:v3];
  }
  id v4 = [v3 collection];
  id v5 = [v4 countryNodes];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __97__PGLocationTripTitleUtility__generateTitleForMomentNodes_resolvedMomentNodes_resolvedLocations___block_invoke_3;
  v6[3] = &unk_1E68EAFF8;
  id v7 = *(id *)(a1 + 40);
  [v5 enumerateNodesUsingBlock:v6];
}

void __97__PGLocationTripTitleUtility__generateTitleForMomentNodes_resolvedMomentNodes_resolvedLocations___block_invoke_4(void *a1, void *a2, void *a3)
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (a2)
  {
    v12[0] = a2;
    id v7 = (void *)MEMORY[0x1E4F1C978];
    id v8 = a2;
    uint64_t v9 = [v7 arrayWithObjects:v12 count:1];
    uint64_t v10 = *(void *)(a1[5] + 8);
    id v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;

    objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), a3);
    objc_storeStrong((id *)(*(void *)(a1[7] + 8) + 40), a3);
    *(void *)(a1[4] + 72) = 1;
  }
}

id __97__PGLocationTripTitleUtility__generateTitleForMomentNodes_resolvedMomentNodes_resolvedLocations___block_invoke_5(uint64_t a1, unsigned int a2, void *a3)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v24 = a3;
  id v5 = *(void **)(a1 + 32);
  if (a2)
  {
    id v6 = [v5 reverseObjectEnumerator];
  }
  else
  {
    id v6 = v5;
  }
  id v7 = v6;
  BOOL v23 = [v24 name];
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id obj = v7;
  uint64_t v8 = [obj countByEnumeratingWithState:&v41 objects:v45 count:16];
  if (v8)
  {
    uint64_t v22 = *(void *)v42;
LABEL_6:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v42 != v22) {
        objc_enumerationMutation(obj);
      }
      uint64_t v10 = *(void **)(*((void *)&v41 + 1) + 8 * v9);
      v40[0] = 0;
      v40[1] = v40;
      v40[2] = 0x2020000000;
      v40[3] = a2 - 1;
      uint64_t v34 = 0;
      long long v35 = &v34;
      uint64_t v36 = 0x3032000000;
      char v37 = __Block_byref_object_copy__49852;
      id v38 = __Block_byref_object_dispose__49853;
      id v39 = 0;
      id v11 = [v10 collection];
      uint64_t v12 = [v11 addressNodes];
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __97__PGLocationTripTitleUtility__generateTitleForMomentNodes_resolvedMomentNodes_resolvedLocations___block_invoke_6;
      v25[3] = &unk_1E68EB070;
      id v13 = *(id *)(a1 + 40);
      uint64_t v14 = *(void *)(a1 + 48);
      id v26 = v13;
      uint64_t v27 = v14;
      id v15 = v24;
      uint64_t v16 = *(void *)(a1 + 56);
      id v28 = v15;
      uint64_t v30 = v16;
      id v17 = v23;
      char v33 = a2;
      id v29 = v17;
      long long v31 = v40;
      long long v32 = &v34;
      [v12 enumerateNodesUsingBlock:v25];

      id v18 = (void *)v35[5];
      if (v18) {
        id v21 = v18;
      }

      _Block_object_dispose(&v34, 8);
      _Block_object_dispose(v40, 8);
      if (v18) {
        break;
      }
      if (v8 == ++v9)
      {
        uint64_t v8 = [obj countByEnumeratingWithState:&v41 objects:v45 count:16];
        if (v8) {
          goto LABEL_6;
        }
        goto LABEL_14;
      }
    }
  }
  else
  {
LABEL_14:
    id v21 = 0;
  }

  return v21;
}

void __97__PGLocationTripTitleUtility__generateTitleForMomentNodes_resolvedMomentNodes_resolvedLocations___block_invoke_7(void *a1, void *a2, void *a3)
{
  id v7 = a2;
  id v6 = a3;
  if ([v7 count])
  {
    objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), a2);
    objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), a3);
    objc_storeStrong((id *)(*(void *)(a1[7] + 8) + 40), a3);
    *(void *)(a1[4] + 72) = 4;
  }
}

void __97__PGLocationTripTitleUtility__generateTitleForMomentNodes_resolvedMomentNodes_resolvedLocations___block_invoke_6(uint64_t a1, void *a2)
{
  id v11 = a2;
  id v3 = objc_msgSend(*(id *)(a1 + 32), "cityNodeFromAddressNode:");
  id v4 = [v3 anyNode];

  if (!v4)
  {
    id v4 = [*(id *)(*(void *)(a1 + 40) + 48) resolvedLocationNodeForIncompleteAddressNode:v11 withTargetDimension:6];
    if (!v4) {
      goto LABEL_10;
    }
  }
  if ([v4 isSameNodeAsNode:*(void *)(a1 + 48)]) {
    goto LABEL_10;
  }
  if (![*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) containsObject:v4]) {
    goto LABEL_10;
  }
  id v5 = *(void **)(a1 + 56);
  if (v5)
  {
    id v6 = [v4 name];
    char v7 = [v5 isEqualToString:v6];

    if (v7) {
      goto LABEL_10;
    }
  }
  unint64_t v8 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) indexOfObject:v4];
  unint64_t v9 = v8;
  unint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
  if (*(unsigned char *)(a1 + 88))
  {
    if (v8 < v10) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  if (v8 < v10)
  {
LABEL_9:
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40), v4);
    *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = v9;
  }
LABEL_10:
}

void __97__PGLocationTripTitleUtility__generateTitleForMomentNodes_resolvedMomentNodes_resolvedLocations___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:") & 1) == 0) {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

- (void)_generateLocationTitle
{
  v10[1] = *MEMORY[0x1E4F143B8];
  momentNodes = self->_momentNodes;
  id v4 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"timestampUTCStart" ascending:1];
  v10[0] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  id v6 = [(NSSet *)momentNodes sortedArrayUsingDescriptors:v5];

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __52__PGLocationTripTitleUtility__generateLocationTitle__block_invoke;
  v8[3] = &unk_1E68EAFA8;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [(PGLocationTripTitleUtility *)self _resolveMomentNodes:v7 withResult:v8];
}

uint64_t __52__PGLocationTripTitleUtility__generateLocationTitle__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _generateTitleForMomentNodes:*(void *)(a1 + 40) resolvedMomentNodes:a2 resolvedLocations:a3];
}

- (PGLocationTripTitleUtility)initWithMomentNodes:(id)a3 filterMomentsAndCities:(BOOL)a4 allowLongAOI:(BOOL)a5 locationHelper:(id)a6
{
  id v11 = a3;
  id v12 = a6;
  v19.receiver = self;
  v19.super_class = (Class)PGLocationTripTitleUtility;
  id v13 = [(PGLocationTripTitleUtility *)&v19 init];
  uint64_t v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_momentNodes, a3);
    v14->_filterMomentsAndCities = a4;
    v14->_BOOL allowLongAOI = a5;
    id v15 = +[PGCommonTitleUtility addressNodesFromMomentNodes:v11];
    uint64_t v16 = [[PGIncompleteLocationResolver alloc] initWithAddressNodes:v15 locationHelper:v12];
    incompleteLocationResolver = v14->_incompleteLocationResolver;
    v14->_incompleteLocationResolver = v16;

    objc_storeStrong((id *)&v14->_locationHelper, a6);
    [(PGLocationTripTitleUtility *)v14 _generateLocationTitle];
  }
  return v14;
}

- (PGLocationTripTitleUtility)initWithMomentNodes:(id)a3 filterMomentsAndCities:(BOOL)a4 locationHelper:(id)a5
{
  return [(PGLocationTripTitleUtility *)self initWithMomentNodes:a3 filterMomentsAndCities:a4 allowLongAOI:0 locationHelper:a5];
}

+ (void)_cityStateAndCountryNodesForLocationNodes:(id)a3 result:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = (void (**)(id, id, id, id))a4;
  if ([v5 count])
  {
    id v7 = [v5 firstObject];
    unint64_t v8 = [v7 label];

    if ([v8 isEqualToString:@"City"])
    {
      id v9 = v5;
      id v10 = [MEMORY[0x1E4F1CA48] array];
      id v11 = [MEMORY[0x1E4F1CA48] array];
    }
    else
    {
      if ([v8 isEqualToString:@"State"])
      {
        id v10 = v5;
        id v11 = [MEMORY[0x1E4F1CA48] array];
      }
      else
      {
        if ([v8 isEqualToString:@"Country"]) {
          id v11 = v5;
        }
        else {
          id v11 = 0;
        }
        id v10 = 0;
      }
      id v9 = 0;
    }
    if (([v8 isEqualToString:@"Country"] & 1) == 0)
    {
      id v23 = v9;
      id v24 = v6;
      long long v29 = 0u;
      long long v30 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      id v25 = v5;
      id obj = v5;
      uint64_t v12 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v28;
        do
        {
          uint64_t v15 = 0;
          do
          {
            if (*(void *)v28 != v14) {
              objc_enumerationMutation(obj);
            }
            uint64_t v16 = *(void **)(*((void *)&v27 + 1) + 8 * v15);
            if (v10 && ([v8 isEqualToString:@"State"] & 1) == 0)
            {
              id v17 = [v16 locationNodeCollection];
              id v18 = [v17 nearestDeepParentLocationNodesWithLabel:@"State"];
              objc_super v19 = [v18 anyNode];

              if (v19 && ([v10 containsObject:v19] & 1) == 0) {
                [v10 addObject:v19];
              }
            }
            id v20 = objc_msgSend(v16, "locationNodeCollection", v23, v24, v25);
            id v21 = [v20 nearestDeepParentLocationNodesWithLabel:@"Country"];
            uint64_t v22 = [v21 anyNode];

            if (v22 && ([v11 containsObject:v22] & 1) == 0) {
              [v11 addObject:v22];
            }

            ++v15;
          }
          while (v13 != v15);
          uint64_t v13 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
        }
        while (v13);
      }

      id v6 = v24;
      id v5 = v25;
      id v9 = v23;
    }
    if (v6) {
      v6[2](v6, v9, v10, v11);
    }
  }
}

+ (BOOL)visitedLocations:(id)a3 onlyDuringMoments:(id)a4 locationHelper:(id)a5
{
  id v7 = a4;
  unint64_t v8 = [a5 momentNodesByAddressNodeIntersectingAddressNodes:a3];
  id v9 = [v8 subtractingTargetsWith:v7];

  LOBYTE(v8) = [v9 sourcesCount] == 0;
  return (char)v8;
}

+ (void)_aoiTitleWithLocationNodes:(id)a3 momentNodes:(id)a4 allowLongAOI:(BOOL)a5 graph:(id)a6 locationHelper:(id)a7 result:(id)a8
{
  BOOL v11 = a5;
  v55[2] = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a6;
  id v16 = a7;
  uint64_t v46 = (void (**)(id, void *, void *))a8;
  id v17 = [MEMORY[0x1E4F1CA80] set];
  id v18 = [MEMORY[0x1E4F1CA48] array];
  context = (void *)MEMORY[0x1D25FED50]();
  uint64_t v19 = [MEMORY[0x1E4F1CAD0] setWithArray:v14];
  BOOL v20 = +[PGLocationTitleUtility containsAmusementParkPOIFromMomentNodes:v19];
  long long v48 = v14;
  id v21 = [(MAElementCollection *)[PGGraphMomentNodeCollection alloc] initWithArray:v14 graph:v15];
  long long v49 = v13;
  int v47 = v15;
  uint64_t v22 = [(MAElementCollection *)[PGGraphLocationNodeCollection alloc] initWithSet:v13 graph:v15];
  long long v43 = v21;
  id v23 = [(PGGraphMomentNodeCollection *)v21 addressNodes];
  long long v42 = v22;
  id v24 = [(PGGraphLocationNodeCollection *)v22 addressNodes];
  id v25 = [v23 collectionByIntersecting:v24];

  if (v11) {
    uint64_t v26 = 2;
  }
  else {
    uint64_t v26 = 1;
  }
  long long v41 = v25;
  long long v27 = [v25 temporarySet];
  long long v44 = (void *)v19;
  long long v28 = +[PGLocationTitleUtility commonAOIComponentsForMomentNodes:v19 addressNodes:v27 aoiDisplayType:v26 containsAmusementParkPOI:v20 locationHelper:v16];

  long long v29 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"timestampStart" ascending:1];
  v55[0] = v29;
  long long v30 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"node.name" ascending:1];
  v55[1] = v30;
  long long v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v55 count:2];
  uint64_t v40 = v28;
  uint64_t v32 = [v28 sortedArrayUsingDescriptors:v31];

  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v33 = v32;
  uint64_t v34 = [v33 countByEnumeratingWithState:&v50 objects:v54 count:16];
  if (v34)
  {
    uint64_t v35 = v34;
    uint64_t v36 = *(void *)v51;
    do
    {
      for (uint64_t i = 0; i != v35; ++i)
      {
        if (*(void *)v51 != v36) {
          objc_enumerationMutation(v33);
        }
        id v38 = [*(id *)(*((void *)&v50 + 1) + 8 * i) node];
        id v39 = +[PGLocationTitleUtility beautifiedLocationNodeStringWithPlaceNode:v38 locationHelper:v16];
        if ([v39 length])
        {
          [v18 addObject:v39];
          [v17 addObject:v38];
        }
      }
      uint64_t v35 = [v33 countByEnumeratingWithState:&v50 objects:v54 count:16];
    }
    while (v35);
  }

  if (v46) {
    v46[2](v46, v18, v17);
  }
}

+ (id)_filteredCityNodesByNameForCityNodes:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  id v5 = [MEMORY[0x1E4F1CA80] set];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        BOOL v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v12 = objc_msgSend(v11, "name", (void)v14);
        if (v12 && ([v5 containsObject:v12] & 1) == 0)
        {
          [v4 addObject:v11];
          [v5 addObject:v12];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  return v4;
}

@end