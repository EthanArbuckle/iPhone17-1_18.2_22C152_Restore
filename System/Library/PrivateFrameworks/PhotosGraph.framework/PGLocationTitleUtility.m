@interface PGLocationTitleUtility
+ (BOOL)_titleComponentsAreInSameSupersetCity:(id)a3 graph:(id)a4 locationHelper:(id)a5;
+ (BOOL)containsAmusementParkPOIFromMomentNodes:(id)a3;
+ (double)_weightForAreaNode:(id)a3 withAddressNodes:(id)a4;
+ (id)_aoiSubsetsFromAOI:(id)a3 idx:(unint64_t)a4 currentSubset:(id)a5 subsetSize:(unint64_t)a6;
+ (id)_aoiSubsetsFromAOI:(id)a3 maxSubsetSize:(unint64_t)a4;
+ (id)_beautifiedLocationStringWithTitleComponents:(id)a3 momentNodes:(id)a4 lineBreakBehavior:(unint64_t)a5 keyAssetAddressNode:(id)a6 curationAddressNodes:(id)a7 isMatchingKeyAsset:(BOOL *)a8 useDistrict:(BOOL)a9 allowFamilyHome:(BOOL)a10 showAllCities:(BOOL)a11 locationHelper:(id)a12 serviceManager:(id)a13;
+ (id)_commonCityTitleComponentsFromMomentNodes:(id)a3 remainingAddressNodes:(id)a4 ignoredAddressNodes:(id)a5 incompleteLocationResolver:(id)a6 locationHelper:(id)a7;
+ (id)_filteredAOINodeCombinationsForCombinations:(id)a3 minSize:(unint64_t)a4 maxSize:(unint64_t)a5 maxTitleLength:(unint64_t)a6 minNumberOfAssets:(unint64_t)a7 aoiNodesToAddressNodesMapTable:(id)a8 assetCountByAddressNodeIdentifier:(id)a9 locationHelper:(id)a10;
+ (id)_filteredAOINodesForAddressNodes:(id)a3 aoiTitleMaximumLength:(unint64_t)a4 locationHelper:(id)a5;
+ (id)_filteredAddressNodesWithAddressNodes:(id)a3 momentNodes:(id)a4 incompleteLocationResolver:(id)a5 filterSignificantLocationsOption:(unint64_t)a6 locationHelper:(id)a7;
+ (id)_firstComponentInTimeFromComponents:(id)a3 momentNodes:(id)a4 curationAddressNodes:(id)a5 allowFamilyHome:(BOOL)a6 serviceManager:(id)a7;
+ (id)_localizedStringForMultipleLocationsWithFirstComponentForTitle:(id)a3 secondComponentForTitle:(id)a4 firstLocation:(id)a5 otherLocation:(id)a6;
+ (id)_localizedStringForTwoLocationsWithFirstComponentForTitle:(id)a3 secondComponentForTitle:(id)a4 firstLocation:(id)a5 otherLocation:(id)a6;
+ (id)_locationStringWithDistrictsFromTitleComponents:(id)a3 momentNodes:(id)a4 lineBreakBehavior:(unint64_t)a5 allowFamilyHome:(BOOL)a6 locationHelper:(id)a7 serviceManager:(id)a8;
+ (id)_peopleLocationFromAddressNode:(id)a3 serviceManager:(id)a4;
+ (id)_sortedAOINodeCombinationsForCombinations:(id)a3 aoiNodesToAddressNodesMapTable:(id)a4 assetCountByAddressNodeIdentifier:(id)a5 locationHelper:(id)a6;
+ (id)_sortedComponentsFromComponents:(id)a3;
+ (id)_titleWithLineBreakBehavior:(unint64_t)a3 forTitle:(id)a4 titleComponents:(id)a5;
+ (id)_twoPartLocationTitleWithFirstPartTitle:(id)a3 withDimension:(unint64_t)a4 usedFirstPartLocationNode:(id)a5 addressNode:(id)a6 locationHelper:(id)a7;
+ (id)beautifiedLocationNodeStringWithPlaceNode:(id)a3 locationHelper:(id)a4;
+ (id)businessNodeForTitlingFromMomentNodes:(id)a3 businessNodesByMomentNode:(id)a4;
+ (id)commonAOIComponentsForMomentNodes:(id)a3 addressNodes:(id)a4 aoiDisplayType:(unint64_t)a5 containsAmusementParkPOI:(BOOL)a6 locationHelper:(id)a7;
+ (id)commonCityTitleComponentsFromMomentNodes:(id)a3 addressNodes:(id)a4 incompleteLocationResolver:(id)a5 locationHelper:(id)a6;
+ (id)peopleLocationTitleComponentsFromAddressNodes:(id)a3 peopleDisplayType:(unint64_t)a4 serviceManager:(id)a5;
+ (id)peopleLocationTitleComponentsFromAddressNodesSet:(id)a3 peopleDisplayType:(unint64_t)a4 serviceManager:(id)a5;
+ (void)generateBusinessItemLocationWithOptions:(id)a3 result:(id)a4;
+ (void)generateHighlightLocationTitleForTripWithMomentNodes:(id)a3 lineBreakBehavior:(unint64_t)a4 locationHelper:(id)a5 result:(id)a6;
+ (void)generateLocationTitleForTripWithMomentNodes:(id)a3 locationHelper:(id)a4 result:(id)a5;
+ (void)generateLocationTitleWithOptions:(id)a3 locationHelper:(id)a4 serviceManager:(id)a5 result:(id)a6;
@end

@implementation PGLocationTitleUtility

+ (id)_peopleLocationFromAddressNode:(id)a3 serviceManager:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__69020;
  v30 = __Block_byref_object_dispose__69021;
  id v31 = 0;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__69020;
  v24 = __Block_byref_object_dispose__69021;
  id v25 = 0;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x2020000000;
  char v19 = 0;
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  v12 = __72__PGLocationTitleUtility__peopleLocationFromAddressNode_serviceManager___block_invoke;
  v13 = &unk_1E68EFA50;
  id v7 = v6;
  id v14 = v7;
  v15 = &v26;
  v16 = &v20;
  v17 = v18;
  [v5 enumerateNeighborEdgesAndNodesThroughEdgesWithLabel:@"IS_HOME_WORK" domain:202 usingBlock:&v10];
  if (v21[5] && v27[5])
  {
    v8 = objc_alloc_init(PGLocationTitleComponent);
    -[PGLocationTitleComponent setNode:](v8, "setNode:", v21[5], v10, v11, v12, v13);
    [(PGLocationTitleComponent *)v8 setEdge:v27[5]];
    [(PGLocationTitleComponent *)v8 addAddressNode:v5];
  }
  else
  {
    v8 = 0;
  }

  _Block_object_dispose(v18, 8);
  _Block_object_dispose(&v20, 8);

  _Block_object_dispose(&v26, 8);
  return v8;
}

void __72__PGLocationTitleUtility__peopleLocationFromAddressNode_serviceManager___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7 = a2;
  id v8 = a3;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __72__PGLocationTitleUtility__peopleLocationFromAddressNode_serviceManager___block_invoke_2;
  v12[3] = &unk_1E68EFA28;
  id v13 = *(id *)(a1 + 32);
  id v14 = v8;
  long long v16 = *(_OWORD *)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 56);
  id v15 = v7;
  uint64_t v17 = v9;
  uint64_t v18 = a4;
  id v10 = v7;
  id v11 = v8;
  [v11 enumerateNeighborNodesThroughEdgesWithLabel:@"IS_OWNED_BY" domain:202 usingBlock:v12];
}

void __72__PGLocationTitleUtility__peopleLocationFromAddressNode_serviceManager___block_invoke_2(uint64_t a1, void *a2, unsigned char *a3)
{
  id v17 = a2;
  id v6 = +[PGPeopleTitleUtility nameFromPersonNode:serviceManager:](PGPeopleTitleUtility, "nameFromPersonNode:serviceManager:");
  if ([v6 length])
  {
    int v7 = [v17 isMeNode];
    id v8 = [*(id *)(a1 + 40) label];
    int v9 = [v8 isEqualToString:@"Home"];

    id v10 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) targetNode];
    id v11 = [v10 label];
    int v12 = [v11 isEqualToString:@"Home"];

    if (v7)
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), a2);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 1;
      uint64_t v13 = *(void *)(*(void *)(a1 + 56) + 8);
      uint64_t v15 = *(void *)(v13 + 40);
      id v14 = (id *)(v13 + 40);
      if (!v15 || ((v12 | v9 ^ 1) & 1) == 0)
      {
        objc_storeStrong(v14, *(id *)(a1 + 48));
        if (v9)
        {
          **(unsigned char **)(a1 + 80) = 1;
          *a3 = 1;
        }
      }
    }
    else
    {
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24)) {
        int v16 = 0;
      }
      else {
        int v16 = v9;
      }
      if (v16 == 1 && !*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
      {
        objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), a2);
        objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), *(id *)(a1 + 48));
      }
    }
  }
}

+ (id)peopleLocationTitleComponentsFromAddressNodesSet:(id)a3 peopleDisplayType:(unint64_t)a4 serviceManager:(id)a5
{
  unint64_t v21 = a4;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v24 = a5;
  id v23 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = 0;
    uint64_t v12 = *(void *)v30;
    obuint64_t j = v8;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v30 != v12) {
          objc_enumerationMutation(obj);
        }
        id v14 = objc_msgSend(a1, "_peopleLocationFromAddressNode:serviceManager:", *(void *)(*((void *)&v29 + 1) + 8 * i), v24, v21);
        if (v14)
        {
          ++v11;
          long long v27 = 0u;
          long long v28 = 0u;
          long long v25 = 0u;
          long long v26 = 0u;
          id v15 = v23;
          uint64_t v16 = [v15 countByEnumeratingWithState:&v25 objects:v33 count:16];
          if (v16)
          {
            uint64_t v17 = v16;
            uint64_t v18 = *(void *)v26;
            while (2)
            {
              for (uint64_t j = 0; j != v17; ++j)
              {
                if (*(void *)v26 != v18) {
                  objc_enumerationMutation(v15);
                }
                if ([*(id *)(*((void *)&v25 + 1) + 8 * j) canMergeWithTitleComponent:v14])
                {

                  goto LABEL_17;
                }
              }
              uint64_t v17 = [v15 countByEnumeratingWithState:&v25 objects:v33 count:16];
              if (v17) {
                continue;
              }
              break;
            }
          }

          [v15 addObject:v14];
        }
LABEL_17:
      }
      id v8 = obj;
      uint64_t v10 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v10);
  }
  else
  {
    uint64_t v11 = 0;
  }

  if (v21 == 2 && [v8 count] && v11 != objc_msgSend(v8, "count")) {
    [v23 removeAllObjects];
  }

  return v23;
}

+ (id)peopleLocationTitleComponentsFromAddressNodes:(id)a3 peopleDisplayType:(unint64_t)a4 serviceManager:(id)a5
{
  id v7 = a5;
  id v8 = [a3 set];
  uint64_t v9 = +[PGLocationTitleUtility peopleLocationTitleComponentsFromAddressNodesSet:v8 peopleDisplayType:a4 serviceManager:v7];

  return v9;
}

+ (id)beautifiedLocationNodeStringWithPlaceNode:(id)a3 locationHelper:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 name];
  id v8 = v7;
  if (v7)
  {
    if ([v7 length])
    {
      uint64_t v9 = [v5 label];
      int v10 = [v9 isEqualToString:@"Country"];

      if (!v10)
      {
        if (([v5 supportsNameShortening] & 1) == 0
          || (+[PGAOINameShortener shortenedAOIForLocationOrAreaNode:v5 locationHelper:v6], (id v16 = (id)objc_claimAutoreleasedReturnValue()) == 0))
        {
          id v16 = v8;
        }
        goto LABEL_17;
      }
      id v11 = v8;
      char v12 = shouldLocationRemoveParenthesesForCountryCode(v11);
      uint64_t v13 = [MEMORY[0x1E4F1CA20] currentLocale];
      id v14 = [v13 localizedStringForCountryCode:v11];
      id v15 = v14;
      if (v14 && [v14 length])
      {
        id v16 = v15;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          int v20 = 138412290;
          id v21 = v11;
          _os_log_error_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Could not find name for country code %@", (uint8_t *)&v20, 0xCu);
        }
        id v16 = 0;
      }

      if (!v16)
      {
        id v16 = v11;
        uint64_t v17 = v16;
        if ((v12 & 1) == 0) {
          goto LABEL_18;
        }
        goto LABEL_17;
      }
      uint64_t v17 = v16;
      if (v12)
      {
LABEL_17:
        uint64_t v17 = objc_msgSend(v16, "pg_stringByRemovingParentheses");

        id v16 = v17;
      }
    }
    else
    {
      uint64_t v17 = 0;
      id v16 = v8;
    }
  }
  else
  {
    id v16 = 0;
    uint64_t v17 = 0;
  }
LABEL_18:
  id v18 = v16;

  return v18;
}

+ (id)_twoPartLocationTitleWithFirstPartTitle:(id)a3 withDimension:(unint64_t)a4 usedFirstPartLocationNode:(id)a5 addressNode:(id)a6 locationHelper:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if (a4 - 10 < 0xFFFFFFFFFFFFFFF7)
  {
    id v16 = v12;
    goto LABEL_15;
  }
  uint64_t v17 = 0;
  id v18 = 0;
  do
  {
    char v19 = v18;
    id v18 = [v15 closestLocationNodeFromLocationNode:v14 withDimension:a4 remapMatchingDimensionBlock:&__block_literal_global_438];

    if (v18)
    {
      int v20 = [a1 beautifiedLocationNodeStringWithPlaceNode:v18 locationHelper:v15];

      id v21 = [v13 name];
      int v22 = [v20 isEqualToString:v21];

      uint64_t v17 = v20;
      if (!v22) {
        break;
      }
    }
    ++a4;
  }
  while (a4 != 10);
  if (![v17 length])
  {
    id v25 = v12;
    goto LABEL_13;
  }
  id v16 = 0;
  if ([v12 rangeOfString:v17 options:0] == 0x7FFFFFFFFFFFFFFFLL)
  {
    if ([v12 length])
    {
      id v23 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      id v24 = [v23 localizedStringForKey:@"PGLocationTitleFormatTwoPartWithFirstLocation %@ secondLocation %@ invisibleSeparator %@" value:@"PGLocationTitleFormatTwoPartWithFirstLocation %@ secondLocation %@ invisibleSeparator %@" table:@"Localizable"];

      objc_msgSend(NSString, "localizedStringWithFormat:", v24, v12, v17, @"\n");
      id v16 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_14;
    }
    id v25 = v17;
LABEL_13:
    id v16 = v25;
  }
LABEL_14:

LABEL_15:
  return v16;
}

uint64_t __133__PGLocationTitleUtility__twoPartLocationTitleWithFirstPartTitle_withDimension_usedFirstPartLocationNode_addressNode_locationHelper___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = a2;
  uint64_t v3 = a2 - 2;
  if (unint64_t)(a2 - 2) <= 5 && ((0x2Bu >> v3)) {
    return qword_1D1F50148[v3];
  }
  return result;
}

+ (id)_titleWithLineBreakBehavior:(unint64_t)a3 forTitle:(id)a4 titleComponents:(id)a5
{
  char v6 = a3;
  id v7 = a4;
  id v8 = a5;
  if ((v6 & 2) != 0)
  {
    uint64_t v10 = [v7 stringByReplacingOccurrencesOfString:@"\n" withString:&stru_1F283BC78];

    uint64_t v9 = +[PGCommonTitleUtility titleWithNoLineBreakSpaceForTitle:v10 andUsedNames:v8];
    id v7 = (id)v10;
  }
  else
  {
    if ((v6 & 1) == 0) {
      goto LABEL_6;
    }
    uint64_t v9 = +[PGCommonTitleUtility titleWithLineBreakForTitle:v7 andUsedNames:v8];
  }

  id v7 = (id)v9;
LABEL_6:

  return v7;
}

+ (id)_sortedComponentsFromComponents:(id)a3
{
  uint64_t v3 = [a3 allObjects];
  v4 = [v3 sortedArrayUsingComparator:&__block_literal_global_69058];

  return v4;
}

uint64_t __58__PGLocationTitleUtility__sortedComponentsFromComponents___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  [v4 weight];
  double v7 = v6;
  [v5 weight];
  if (v7 <= v8)
  {
    if (v7 < v8)
    {
      uint64_t v9 = 1;
      goto LABEL_39;
    }
    uint64_t v10 = [v4 node];
    id v11 = [v5 node];
    int v12 = [v10 domain];
    int v13 = [v11 domain];
    if (v12 == 300 && v13 != 300) {
      goto LABEL_8;
    }
    if (v13 != 300 && v12 == 300) {
      goto LABEL_11;
    }
    if (v12 == 300 && v13 == 300)
    {
      id v14 = [v10 graph];
      id v15 = +[PGGraphNodeCollection nodesInGraph:v14];

      int v16 = [v15 containsNode:v10];
      int v17 = [v15 containsNode:v11];
      if (v16 && !v17)
      {
        uint64_t v9 = -1;
LABEL_37:

        goto LABEL_38;
      }
      char v18 = v17 ^ 1;
      if ((v16 | v17 ^ 1) != 1) {
        goto LABEL_31;
      }
      if (!v16) {
        char v18 = v17;
      }
      if ((v18 & 1) == 0)
      {
        char v19 = [v4 edge];
        int v20 = [v19 targetNode];

        id v21 = [v5 edge];
        int v22 = [v21 targetNode];

        id v23 = [v20 label];
        int v24 = [v23 isEqualToString:@"Home"];

        id v25 = [v22 label];
        int v26 = [v25 isEqualToString:@"Home"];

        if (v24 && (v26 & 1) == 0)
        {

          goto LABEL_34;
        }

        if ((v24 | v26 ^ 1) != 1)
        {
LABEL_31:
          uint64_t v9 = 1;
          goto LABEL_37;
        }
      }
    }
    [v4 timestampStart];
    double v28 = v27;
    [v5 timestampStart];
    if (v28 < v29)
    {
LABEL_8:
      uint64_t v9 = -1;
LABEL_38:

      goto LABEL_39;
    }
    if (v28 > v29)
    {
LABEL_11:
      uint64_t v9 = 1;
      goto LABEL_38;
    }
    id v15 = [v10 name];
    uint64_t v30 = [v11 name];
    int v20 = (void *)v30;
    if (!v15 && v30)
    {
      id v15 = 0;
      uint64_t v9 = 1;
LABEL_36:

      goto LABEL_37;
    }
    if (!v15 || v30)
    {
      uint64_t v9 = [v15 localizedCompare:v30];
      goto LABEL_36;
    }
LABEL_34:
    uint64_t v9 = -1;
    goto LABEL_36;
  }
  uint64_t v9 = -1;
LABEL_39:

  return v9;
}

+ (id)_firstComponentInTimeFromComponents:(id)a3 momentNodes:(id)a4 curationAddressNodes:(id)a5 allowFamilyHome:(BOOL)a6 serviceManager:(id)a7
{
  BOOL v51 = a6;
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v58 = a4;
  id v11 = a5;
  id v54 = a7;
  uint64_t v73 = 0;
  v74 = &v73;
  uint64_t v75 = 0x3032000000;
  v76 = __Block_byref_object_copy__69020;
  v77 = __Block_byref_object_dispose__69021;
  id v78 = 0;
  uint64_t v69 = 0;
  v70 = (double *)&v69;
  uint64_t v71 = 0x2020000000;
  uint64_t v72 = 0x7FEFFFFFFFFFFFFFLL;
  uint64_t v65 = 0;
  v66 = (double *)&v65;
  uint64_t v67 = 0x2020000000;
  unint64_t v68 = 0xFFEFFFFFFFFFFFFFLL;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  obuint64_t j = v10;
  uint64_t v12 = [obj countByEnumeratingWithState:&v61 objects:v79 count:16];
  if (v12)
  {
    uint64_t v57 = *(void *)v62;
    do
    {
      uint64_t v59 = v12;
      for (uint64_t i = 0; i != v59; ++i)
      {
        if (*(void *)v62 != v57) {
          objc_enumerationMutation(obj);
        }
        id v14 = *(void **)(*((void *)&v61 + 1) + 8 * i);
        [v14 updateWithMomentNodes:v58];
        if ([v11 count])
        {
          id v15 = [v14 addressNodes];
          char v16 = [v15 intersectsSet:v11];

          if ((v16 & 1) == 0) {
            continue;
          }
        }
        [v14 timestampStart];
        double v18 = v17;
        [v14 weight];
        double v20 = v19;
        id v21 = [v14 node];
        int v22 = [v21 name];

        if (![v22 length]) {
          goto LABEL_14;
        }
        if (!v74[5] || (double v23 = v70[3], v23 > v18))
        {
          BOOL v24 = 1;
          goto LABEL_15;
        }
        if (v23 == v18) {
          BOOL v24 = v66[3] < v20;
        }
        else {
LABEL_14:
        }
          BOOL v24 = 0;
LABEL_15:
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = __126__PGLocationTitleUtility__firstComponentInTimeFromComponents_momentNodes_curationAddressNodes_allowFamilyHome_serviceManager___block_invoke;
        aBlock[3] = &unk_1E68EF998;
        *(double *)&aBlock[8] = v18;
        *(double *)&aBlock[9] = v20;
        aBlock[6] = &v65;
        aBlock[7] = &v73;
        aBlock[4] = v14;
        aBlock[5] = &v69;
        id v25 = (void (**)(void))_Block_copy(aBlock);
        int v26 = v25;
        if (v24)
        {
          v25[2](v25);
LABEL_39:

          continue;
        }
        double v27 = (void *)v74[5];
        if (!v27 || v70[3] != v18 || v66[3] != v20) {
          goto LABEL_39;
        }
        double v28 = [v27 node];
        int v29 = [v28 domain];

        uint64_t v30 = [v14 node];
        int v31 = [v30 domain];

        if (v29 != 300 && v31 == 300)
        {
          v26[2](v26);
          goto LABEL_39;
        }
        if (v29 == 300 && v31 == 300)
        {
          long long v32 = [v14 node];
          v33 = [v32 graph];
          v34 = +[PGGraphNodeCollection nodesInGraph:v33];

          uint64_t v35 = [v14 node];
          int v36 = [v34 containsNode:v35];

          if (v36) {
            goto LABEL_24;
          }
          v38 = [(id)v74[5] edge];
          v39 = [v38 targetNode];

          v40 = [v14 edge];
          v55 = [v40 targetNode];

          v41 = [v39 label];
          int v42 = [v41 isEqualToString:@"Home"];

          v43 = [v55 label];
          int v44 = [v43 isEqualToString:@"Home"];

          if ((v42 | v44 ^ 1))
          {
            if (v42 == v44)
            {
              v52 = [(id)v74[5] node];
              v45 = [(id)v74[5] edge];
              v46 = +[PGPeopleTitleUtility beautifiedLocationStringWithPersonNode:v52 peopleAddressEdge:v45 titleComponent:v74[5] insertLineBreak:0 allowFamilyHome:v51 serviceManager:v54];

              v53 = [v14 node];
              v47 = [v14 edge];
              v48 = +[PGPeopleTitleUtility beautifiedLocationStringWithPersonNode:v53 peopleAddressEdge:v47 titleComponent:v14 insertLineBreak:0 allowFamilyHome:v51 serviceManager:v54];

              if ([v48 length]
                && (![v46 length] || objc_msgSend(v46, "localizedCompare:", v48) == 1))
              {
                v26[2](v26);
              }
            }
          }
          else
          {
            v26[2](v26);
          }
        }
        else
        {
          if (v29 == 300) {
            goto LABEL_39;
          }
          v37 = [(id)v74[5] node];
          v34 = [v37 name];

          if ([v34 localizedCompare:v22] == 1) {
LABEL_24:
          }
            v26[2](v26);
        }

        goto LABEL_39;
      }
      uint64_t v12 = [obj countByEnumeratingWithState:&v61 objects:v79 count:16];
    }
    while (v12);
  }

  id v49 = (id)v74[5];
  _Block_object_dispose(&v65, 8);
  _Block_object_dispose(&v69, 8);
  _Block_object_dispose(&v73, 8);

  return v49;
}

void __126__PGLocationTitleUtility__firstComponentInTimeFromComponents_momentNodes_curationAddressNodes_allowFamilyHome_serviceManager___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *(void *)(a1 + 64);
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(void *)(a1 + 72);
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), *(id *)(a1 + 32));
}

+ (BOOL)_titleComponentsAreInSameSupersetCity:(id)a3 graph:(id)a4 locationHelper:(id)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v28 = a5;
  if ([v7 count])
  {
    uint64_t v9 = [MEMORY[0x1E4F1CA80] set];
    id v10 = [v8 supersetCityNodes];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v11 = v7;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v30;
      id v26 = v8;
      id v27 = v7;
      while (2)
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v30 != v14) {
            objc_enumerationMutation(v11);
          }
          char v16 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          double v17 = [v16 node];
          double v18 = [v17 label];
          int v19 = [v18 isEqualToString:@"City"];

          if (v19)
          {
            id v20 = v17;
          }
          else
          {
            if ([v17 domain] != 300)
            {
              id v20 = 0;
LABEL_17:

              BOOL v24 = 0;
              id v8 = v26;
              id v7 = v27;
              goto LABEL_18;
            }
            id v21 = [v16 edge];
            int v22 = [v21 sourceNode];

            double v23 = [v28 cityNodeFromAddressNode:v22];
            id v20 = [v23 anyNode];

            if (!v20) {
              goto LABEL_17;
            }
          }
          [v9 addObject:v20];
          if (![v10 containsNode:v20]) {
            goto LABEL_17;
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v29 objects:v33 count:16];
        id v8 = v26;
        id v7 = v27;
        if (v13) {
          continue;
        }
        break;
      }
    }

    BOOL v24 = [v9 count] == 1;
LABEL_18:
  }
  else
  {
    BOOL v24 = 0;
  }

  return v24;
}

+ (id)_locationStringWithDistrictsFromTitleComponents:(id)a3 momentNodes:(id)a4 lineBreakBehavior:(unint64_t)a5 allowFamilyHome:(BOOL)a6 locationHelper:(id)a7 serviceManager:(id)a8
{
  BOOL v90 = a6;
  uint64_t v144 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v102 = a4;
  id v104 = a7;
  id v92 = a8;
  uint64_t v134 = 0;
  v135 = &v134;
  uint64_t v136 = 0x2020000000;
  char v137 = 0;
  uint64_t v130 = 0;
  v131 = &v130;
  uint64_t v132 = 0x2020000000;
  uint64_t v133 = 0x7FFFFFFFFFFFFFFFLL;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __150__PGLocationTitleUtility__locationStringWithDistrictsFromTitleComponents_momentNodes_lineBreakBehavior_allowFamilyHome_locationHelper_serviceManager___block_invoke;
  aBlock[3] = &unk_1E68EF970;
  aBlock[4] = &v134;
  aBlock[5] = &v130;
  v101 = (void (**)(void *, void *))_Block_copy(aBlock);
  v93 = [MEMORY[0x1E4F1CA80] set];
  v103 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v127 = 0u;
  long long v128 = 0u;
  long long v125 = 0u;
  long long v126 = 0u;
  obuint64_t j = v11;
  uint64_t v12 = [obj countByEnumeratingWithState:&v125 objects:v143 count:16];
  char v13 = 0;
  if (v12)
  {
    id v97 = *(id *)v126;
LABEL_3:
    uint64_t v95 = v12;
    uint64_t v14 = 0;
    while (1)
    {
      if (*(id *)v126 != v97) {
        objc_enumerationMutation(obj);
      }
      if (*((unsigned char *)v135 + 24)) {
        break;
      }
      id v15 = *(void **)(*((void *)&v125 + 1) + 8 * v14);
      v99 = [v15 node];
      char v16 = [v99 label];
      int v17 = [v16 isEqualToString:@"City"];

      if (v17)
      {
        double v18 = [v99 collection];
        v101[2](v101, v18);

        if (*((unsigned char *)v135 + 24)) {
          goto LABEL_36;
        }
        int v19 = [v15 addressNodes];
        long long v123 = 0u;
        long long v124 = 0u;
        long long v121 = 0u;
        long long v122 = 0u;
        id v20 = v19;
        uint64_t v21 = [v20 countByEnumeratingWithState:&v121 objects:v142 count:16];
        if (v21)
        {
          uint64_t v22 = *(void *)v122;
          while (2)
          {
            for (uint64_t i = 0; i != v21; ++i)
            {
              if (*(void *)v122 != v22) {
                objc_enumerationMutation(v20);
              }
              uint64_t v24 = *(void *)(*((void *)&v121 + 1) + 8 * i);
              id v25 = [v104 districtNodeFromAddressNode:v24];
              id v26 = [v25 anyNode];

              if (!v26)
              {
                *((unsigned char *)v135 + 24) = 1;
                goto LABEL_31;
              }
              id v27 = [v103 objectForKeyedSubscript:v26];
              if (!v27)
              {
                id v27 = objc_alloc_init(PGLocationTitleComponent);
                [(PGLocationTitleComponent *)v27 setNode:v26];
                [v103 setObject:v27 forKeyedSubscript:v26];
              }
              [(PGLocationTitleComponent *)v27 addAddressNode:v24];

              char v13 = 1;
            }
            uint64_t v21 = [v20 countByEnumeratingWithState:&v121 objects:v142 count:16];
            if (v21) {
              continue;
            }
            break;
          }
        }
LABEL_31:
      }
      else
      {
        id v28 = [v15 addressNodes];
        long long v119 = 0u;
        long long v120 = 0u;
        long long v117 = 0u;
        long long v118 = 0u;
        id v20 = v28;
        uint64_t v29 = [v20 countByEnumeratingWithState:&v117 objects:v141 count:16];
        if (v29)
        {
          uint64_t v30 = *(void *)v118;
LABEL_22:
          uint64_t v31 = 0;
          while (1)
          {
            if (*(void *)v118 != v30) {
              objc_enumerationMutation(v20);
            }
            long long v32 = [v104 cityNodeFromAddressNode:*(void *)(*((void *)&v117 + 1) + 8 * v31)];
            v101[2](v101, v32);
            BOOL v33 = *((unsigned char *)v135 + 24) == 0;

            if (!v33) {
              break;
            }
            if (v29 == ++v31)
            {
              uint64_t v29 = [v20 countByEnumeratingWithState:&v117 objects:v141 count:16];
              if (v29) {
                goto LABEL_22;
              }
              break;
            }
          }
        }

        if (*((unsigned char *)v135 + 24))
        {

LABEL_36:
          break;
        }
        [v93 addObject:v15];
      }

      if (++v14 == v95)
      {
        uint64_t v12 = [obj countByEnumeratingWithState:&v125 objects:v143 count:16];
        if (v12) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  uint64_t v34 = v135;
  char v35 = (*((unsigned char *)v135 + 24) != 0) | ~v13;
  *((unsigned char *)v135 + 24) = *((unsigned char *)v135 + 24) != 0 || (v13 & 1) == 0;
  if (v35)
  {
    int v36 = 0;
    *((unsigned char *)v34 + 24) = 1;
    goto LABEL_106;
  }
  BOOL v37 = v131[3] == 0x7FFFFFFFFFFFFFFFLL;
  *((unsigned char *)v34 + 24) = v37;
  if (v37)
  {
    int v36 = 0;
    goto LABEL_106;
  }
  v38 = [v102 anyObject];
  v39 = [v38 graph];
  v86 = [v39 nodeForIdentifier:v131[3]];

  v87 = [a1 beautifiedLocationNodeStringWithPlaceNode:v86 locationHelper:v104];
  if (![v87 length])
  {
    int v36 = 0;
    goto LABEL_105;
  }
  v40 = [v103 allValues];
  [v93 addObjectsFromArray:v40];

  long long v115 = 0u;
  long long v116 = 0u;
  long long v113 = 0u;
  long long v114 = 0u;
  id v41 = v93;
  uint64_t v42 = [v41 countByEnumeratingWithState:&v113 objects:v140 count:16];
  if (v42)
  {
    uint64_t v43 = *(void *)v114;
    do
    {
      for (uint64_t j = 0; j != v42; ++j)
      {
        if (*(void *)v114 != v43) {
          objc_enumerationMutation(v41);
        }
        [*(id *)(*((void *)&v113 + 1) + 8 * j) updateWithMomentNodes:v102];
      }
      uint64_t v42 = [v41 countByEnumeratingWithState:&v113 objects:v140 count:16];
    }
    while (v42);
  }

  uint64_t v45 = [a1 _firstComponentInTimeFromComponents:v41 momentNodes:v102 curationAddressNodes:0 allowFamilyHome:v90 serviceManager:v92];
  v85 = (void *)v45;
  if (!v45)
  {
    int v36 = 0;
    goto LABEL_104;
  }
  v46 = [MEMORY[0x1E4F1CA48] arrayWithObject:v45];
  if ((unint64_t)[v41 count] >= 2)
  {
    v47 = (void *)[v41 mutableCopy];
    [v47 removeObject:v85];
    v48 = [a1 _sortedComponentsFromComponents:v47];
    [v46 addObjectsFromArray:v48];
  }
  v100 = [MEMORY[0x1E4F1CA48] array];
  v96 = [MEMORY[0x1E4F1CA48] array];
  long long v111 = 0u;
  long long v112 = 0u;
  long long v109 = 0u;
  long long v110 = 0u;
  id v98 = v46;
  uint64_t v49 = [v98 countByEnumeratingWithState:&v109 objects:v139 count:16];
  if (!v49) {
    goto LABEL_73;
  }
  uint64_t v50 = *(void *)v110;
  while (2)
  {
    for (uint64_t k = 0; k != v49; ++k)
    {
      if (*(void *)v110 != v50) {
        objc_enumerationMutation(v98);
      }
      v52 = *(void **)(*((void *)&v109 + 1) + 8 * k);
      v53 = [v52 node];
      if ([v53 domain] == 300)
      {
        id v54 = [v52 edge];
        v55 = +[PGPeopleTitleUtility beautifiedLocationStringWithPersonNode:v53 peopleAddressEdge:v54 titleComponent:v52 insertLineBreak:a5 & 1 allowFamilyHome:v90 serviceManager:v92];

        if (!v55 || ([v100 containsObject:v55] & 1) != 0) {
          goto LABEL_66;
        }
LABEL_65:
        [v100 addObject:v55];
        [v96 addObject:v52];
        goto LABEL_66;
      }
      v56 = [v53 label];
      int v57 = [v56 isEqualToString:@"District"];

      if (!v57) {
        goto LABEL_67;
      }
      v55 = [a1 beautifiedLocationNodeStringWithPlaceNode:v53 locationHelper:v104];
      if (![v55 length])
      {
        *((unsigned char *)v135 + 24) = 1;

        goto LABEL_73;
      }
      if (([v100 containsObject:v55] & 1) == 0) {
        goto LABEL_65;
      }
LABEL_66:

LABEL_67:
    }
    uint64_t v49 = [v98 countByEnumeratingWithState:&v109 objects:v139 count:16];
    if (v49) {
      continue;
    }
    break;
  }
LABEL_73:

  if (*((unsigned char *)v135 + 24))
  {
    int v36 = 0;
    goto LABEL_103;
  }
  id v58 = [v87 componentsSeparatedByString:@" "];
  long long v107 = 0u;
  long long v108 = 0u;
  long long v105 = 0u;
  long long v106 = 0u;
  id v91 = v100;
  uint64_t v59 = [v91 countByEnumeratingWithState:&v105 objects:v138 count:16];
  if (v59)
  {
    uint64_t v60 = *(void *)v106;
    while (2)
    {
      uint64_t v61 = v59;
      for (uint64_t m = 0; m != v61; ++m)
      {
        if (*(void *)v106 != v60) {
          objc_enumerationMutation(v91);
        }
        long long v63 = [*(id *)(*((void *)&v105 + 1) + 8 * m) componentsSeparatedByString:@" "];
        unint64_t v64 = [v63 count];
        unint64_t v65 = [v58 count];
        unint64_t v66 = v64 - v65;
        if (v64 >= v65)
        {
          uint64_t v67 = 0;
          while (1)
          {
            unint64_t v68 = objc_msgSend(v63, "subarrayWithRange:", v67, v65);
            char v69 = [v68 isEqualToArray:v58];

            if (v69) {
              break;
            }
            if (++v67 > v66) {
              goto LABEL_84;
            }
          }

          int v36 = 0;
          goto LABEL_100;
        }
LABEL_84:
      }
      uint64_t v59 = [v91 countByEnumeratingWithState:&v105 objects:v138 count:16];
      if (v59) {
        continue;
      }
      break;
    }
  }

  uint64_t v70 = [v91 count];
  if (v70 != 2)
  {
    if (v70 == 1)
    {
      uint64_t v71 = NSString;
      uint64_t v72 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      uint64_t v73 = [v72 localizedStringForKey:@"PGLocationTitleFormatOneDistrict %@ city %@" value:@"PGLocationTitleFormatOneDistrict %@ city %@" table:@"Localizable"];
      v74 = [v91 firstObject];
      uint64_t v75 = objc_msgSend(v71, "localizedStringWithFormat:", v73, v74, v87);
      goto LABEL_98;
    }
    goto LABEL_101;
  }
  uint64_t v72 = [v91 firstObject];
  uint64_t v73 = [v91 lastObject];
  v76 = [v96 firstObject];
  uint64_t v77 = [v76 type];

  id v78 = [v96 lastObject];
  uint64_t v79 = [v78 type];

  if (v77 || v79 != 1)
  {
    v83 = NSString;
    if (v77 != 1 || v79)
    {
      v74 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v81 = [v74 localizedStringForKey:@"PGLocationTitleFormatDistrict %@ otherDistrict %@ inCity %@" value:@"PGLocationTitleFormatDistrict %@ otherDistrict %@ inCity %@" table:@"Localizable"];
      uint64_t v82 = objc_msgSend(v83, "localizedStringWithFormat:", v81, v72, v73, v87);
    }
    else
    {
      v74 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v81 = [v74 localizedStringForKey:@"PGLocationTitleFormatHomeAndDistrict %@ inCity %@" value:@"PGLocationTitleFormatHomeAndDistrict %@ inCity %@" table:@"Localizable"];
      uint64_t v82 = objc_msgSend(v83, "localizedStringWithFormat:", v81, v73, v87);
    }
  }
  else
  {
    uint64_t v80 = NSString;
    v74 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v81 = [v74 localizedStringForKey:@"PGLocationTitleFormatDistrict %@ andHomeInCity %@" value:@"PGLocationTitleFormatDistrict %@ andHomeInCity %@" table:@"Localizable"];
    uint64_t v82 = objc_msgSend(v80, "localizedStringWithFormat:", v81, v72, v87);
  }
  uint64_t v75 = v82;

LABEL_98:
  if (v75)
  {
    [v91 addObject:v87];
    int v36 = [a1 _titleWithLineBreakBehavior:a5 forTitle:v75 titleComponents:v91];
    id v91 = (id)v75;
LABEL_100:
  }
  else
  {
LABEL_101:
    int v36 = 0;
  }

LABEL_103:
LABEL_104:

LABEL_105:
LABEL_106:

  _Block_object_dispose(&v130, 8);
  _Block_object_dispose(&v134, 8);

  return v36;
}

void __150__PGLocationTitleUtility__locationStringWithDistrictsFromTitleComponents_momentNodes_lineBreakBehavior_allowFamilyHome_locationHelper_serviceManager___block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  if ([v8 count])
  {
    uint64_t v3 = [v8 elementIdentifiers];
    uint64_t v4 = [v3 firstElement];

    uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v6 = *(void *)(v5 + 24);
    id v7 = v8;
    if (v4 != v6)
    {
      if (v6 == 0x7FFFFFFFFFFFFFFFLL) {
        *(void *)(v5 + 24) = v4;
      }
      else {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
      }
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    id v7 = v8;
  }
}

+ (id)_localizedStringForMultipleLocationsWithFirstComponentForTitle:(id)a3 secondComponentForTitle:(id)a4 firstLocation:(id)a5 otherLocation:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = [v9 type];
  uint64_t v14 = [v10 type];
  switch(v13)
  {
    case 0:
      switch(v14)
      {
        case 0:
          id v15 = NSString;
          char v16 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
          int v17 = [v16 localizedStringForKey:@"PGLocationTitleFormatMultipleLocationsWithLocation %@ otherLocation %@" value:@"PGLocationTitleFormatMultipleLocationsWithLocation %@ otherLocation %@" table:@"Localizable"];
          id v47 = v12;
          goto LABEL_18;
        case 1:
          id v15 = NSString;
          uint64_t v24 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
          char v16 = v24;
          id v25 = @"PGLocationTitleFormatMultipleLocationsWithLocation %@ andHome";
          goto LABEL_17;
        case 2:
          id v15 = NSString;
          uint64_t v24 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
          char v16 = v24;
          id v25 = @"PGLocationTitleFormatMultipleLocationsWithLocation %@ andWork";
          goto LABEL_17;
        case 3:
          id v26 = NSString;
          char v16 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
          int v17 = [v16 localizedStringForKey:@"PGLocationTitleFormatMultipleLocationsWithLocation %@ andSomeonesHome %@" value:@"PGLocationTitleFormatMultipleLocationsWithLocation %@ andSomeonesHome %@" table:@"Localizable"];
          double v23 = [v10 personName];
          objc_msgSend(v26, "localizedStringWithFormat:", v17, v11, v23);
          goto LABEL_42;
        case 4:
          id v15 = NSString;
          uint64_t v24 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
          char v16 = v24;
          id v25 = @"PGLocationTitleFormatMultipleLocationsWithLocation %@ andFamilyHome";
LABEL_17:
          int v17 = [v24 localizedStringForKey:v25 value:v25 table:@"Localizable"];
LABEL_18:
          objc_msgSend(v15, "localizedStringWithFormat:", v17, v11, v47);
          break;
        default:
          goto LABEL_49;
      }
      id v27 = LABEL_19:;
      goto LABEL_44;
    case 1:
      switch(v14)
      {
        case 0:
          double v18 = NSString;
          int v19 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
          char v16 = v19;
          id v20 = @"PGLocationTitleFormatMultipleLocationsWithHomeAndLocation %@";
          goto LABEL_12;
        case 1:
          id v28 = +[PGLogging sharedLogging];
          uint64_t v29 = [v28 loggingConnection];

          if (!os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
            goto LABEL_48;
          }
          __int16 v50 = 0;
          uint64_t v30 = "Attempted to create location string with two title components both of type Home";
          uint64_t v31 = (uint8_t *)&v50;
          break;
        case 2:
          long long v32 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
          char v16 = v32;
          BOOL v33 = @"PGLocationTitleFormatMultipleLocationsWithHomeAndWork";
          goto LABEL_37;
        case 3:
          uint64_t v21 = NSString;
          uint64_t v34 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
          char v16 = v34;
          char v35 = @"PGLocationTitleFormatMultipleLocationsWithHomeAndSomeonesHome %@";
          goto LABEL_39;
        case 4:
          long long v32 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
          char v16 = v32;
          BOOL v33 = @"PGLocationTitleFormatMultipleLocationsWithHomeAndFamilyHome";
          goto LABEL_37;
        default:
          goto LABEL_49;
      }
      goto LABEL_54;
    case 2:
      switch(v14)
      {
        case 0:
          double v18 = NSString;
          int v19 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
          char v16 = v19;
          id v20 = @"PGLocationTitleFormatMultipleLocationsWithWorkAndLocation %@";
          goto LABEL_12;
        case 1:
          long long v32 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
          char v16 = v32;
          BOOL v33 = @"PGLocationTitleFormatMultipleLocationsWithWorkAndHome";
          goto LABEL_37;
        case 2:
          int v36 = +[PGLogging sharedLogging];
          uint64_t v29 = [v36 loggingConnection];

          if (!os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
            goto LABEL_48;
          }
          __int16 v49 = 0;
          uint64_t v30 = "Attempted to create location string with two title components both of type Work";
          uint64_t v31 = (uint8_t *)&v49;
          break;
        case 3:
          uint64_t v21 = NSString;
          uint64_t v34 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
          char v16 = v34;
          char v35 = @"PGLocationTitleFormatMultipleLocationsWithWorkAndSomeonesHome %@";
          goto LABEL_39;
        case 4:
          long long v32 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
          char v16 = v32;
          BOOL v33 = @"PGLocationTitleFormatMultipleLocationsWithWorkAndFamilyHome";
          goto LABEL_37;
        default:
          goto LABEL_49;
      }
LABEL_54:
      _os_log_error_impl(&dword_1D1805000, v29, OS_LOG_TYPE_ERROR, v30, v31, 2u);
LABEL_48:

      goto LABEL_49;
    case 3:
      switch(v14)
      {
        case 0:
          uint64_t v21 = NSString;
          char v16 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
          int v17 = [v16 localizedStringForKey:@"PGLocationTitleFormatMultipleLocationsWithSomeonesHome %@ andLocation %@" value:@"PGLocationTitleFormatMultipleLocationsWithSomeonesHome %@ andLocation %@" table:@"Localizable"];
          uint64_t v22 = [v9 personName];
          double v23 = (void *)v22;
          id v47 = v12;
          goto LABEL_41;
        case 1:
          uint64_t v21 = NSString;
          BOOL v37 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
          char v16 = v37;
          v38 = @"PGLocationTitleFormatMultipleLocationsWithSomeonesHome %@ andHome";
          break;
        case 2:
          uint64_t v21 = NSString;
          BOOL v37 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
          char v16 = v37;
          v38 = @"PGLocationTitleFormatMultipleLocationsWithSomeonesHome %@ andWork";
          break;
        case 3:
          v39 = NSString;
          char v16 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
          int v17 = [v16 localizedStringForKey:@"PGLocationTitleFormatMultipleLocationsWithSomeonesHome %@ andAnothersHome %@" value:@"PGLocationTitleFormatMultipleLocationsWithSomeonesHome %@ andAnothersHome %@" table:@"Localizable"];
          double v23 = [v9 personName];
          v40 = [v10 personName];
          id v27 = objc_msgSend(v39, "localizedStringWithFormat:", v17, v23, v40);

          goto LABEL_43;
        case 4:
          uint64_t v21 = NSString;
          BOOL v37 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
          char v16 = v37;
          v38 = @"PGLocationTitleFormatMultipleLocationsWithSomeonesHome %@ andFamilyHome";
          break;
        default:
          goto LABEL_49;
      }
      int v17 = [v37 localizedStringForKey:v38 value:v38 table:@"Localizable"];
      id v41 = v9;
LABEL_40:
      uint64_t v22 = [v41 personName];
      double v23 = (void *)v22;
LABEL_41:
      objc_msgSend(v21, "localizedStringWithFormat:", v17, v22, v47);
      id v27 = LABEL_42:;
LABEL_43:

LABEL_44:
LABEL_45:

      if (!v27) {
        goto LABEL_49;
      }
      goto LABEL_50;
    case 4:
      switch(v14)
      {
        case 0:
          double v18 = NSString;
          int v19 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
          char v16 = v19;
          id v20 = @"PGLocationTitleFormatMultipleLocationsWithFamilyHomeAndLocation %@";
LABEL_12:
          int v17 = [v19 localizedStringForKey:v20 value:v20 table:@"Localizable"];
          objc_msgSend(v18, "localizedStringWithFormat:", v17, v12, v47);
          goto LABEL_19;
        case 1:
          long long v32 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
          char v16 = v32;
          BOOL v33 = @"PGLocationTitleFormatMultipleLocationsWithFamilyHomeAndHome";
          goto LABEL_37;
        case 2:
          long long v32 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
          char v16 = v32;
          BOOL v33 = @"PGLocationTitleFormatMultipleLocationsWithFamilyHomeAndWork";
LABEL_37:
          id v27 = [v32 localizedStringForKey:v33 value:v33 table:@"Localizable"];
          goto LABEL_45;
        case 3:
          uint64_t v21 = NSString;
          uint64_t v34 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
          char v16 = v34;
          char v35 = @"PGLocationTitleFormatMultipleLocationsWithFamilyHomeAndSomeonesHome %@";
LABEL_39:
          int v17 = [v34 localizedStringForKey:v35 value:v35 table:@"Localizable"];
          id v41 = v10;
          goto LABEL_40;
        case 4:
          uint64_t v42 = +[PGLogging sharedLogging];
          uint64_t v29 = [v42 loggingConnection];

          if (!os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
            goto LABEL_48;
          }
          *(_WORD *)buf = 0;
          uint64_t v30 = "Attempted to create location string with Multiple title components both of type Family Home";
          uint64_t v31 = buf;
          goto LABEL_54;
        default:
          goto LABEL_49;
      }
    default:
LABEL_49:
      uint64_t v43 = NSString;
      int v44 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      uint64_t v45 = [v44 localizedStringForKey:@"PGLocationTitleFormatMultipleLocationsWithLocation %@ otherLocation %@" value:@"PGLocationTitleFormatMultipleLocationsWithLocation %@ otherLocation %@" table:@"Localizable"];
      id v27 = objc_msgSend(v43, "localizedStringWithFormat:", v45, v11, v12);

LABEL_50:
      return v27;
  }
}

+ (id)_localizedStringForTwoLocationsWithFirstComponentForTitle:(id)a3 secondComponentForTitle:(id)a4 firstLocation:(id)a5 otherLocation:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = [v9 type];
  uint64_t v14 = [v10 type];
  switch(v13)
  {
    case 0:
      switch(v14)
      {
        case 0:
          id v15 = NSString;
          char v16 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
          int v17 = [v16 localizedStringForKey:@"PGLocationTitleFormatTwoLocationsWithLocation %@ otherLocation %@" value:@"PGLocationTitleFormatTwoLocationsWithLocation %@ otherLocation %@" table:@"Localizable"];
          id v47 = v12;
          goto LABEL_18;
        case 1:
          id v15 = NSString;
          uint64_t v24 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
          char v16 = v24;
          id v25 = @"PGLocationTitleFormatTwoLocationsWithLocation %@ andHome";
          goto LABEL_17;
        case 2:
          id v15 = NSString;
          uint64_t v24 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
          char v16 = v24;
          id v25 = @"PGLocationTitleFormatTwoLocationsWithLocation %@ andWork";
          goto LABEL_17;
        case 3:
          id v26 = NSString;
          char v16 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
          int v17 = [v16 localizedStringForKey:@"PGLocationTitleFormatTwoLocationsWithLocation %@ andSomeonesHome %@" value:@"PGLocationTitleFormatTwoLocationsWithLocation %@ andSomeonesHome %@" table:@"Localizable"];
          double v23 = [v10 personName];
          objc_msgSend(v26, "localizedStringWithFormat:", v17, v11, v23);
          goto LABEL_42;
        case 4:
          id v15 = NSString;
          uint64_t v24 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
          char v16 = v24;
          id v25 = @"PGLocationTitleFormatTwoLocationsWithLocation %@ andFamilyHome";
LABEL_17:
          int v17 = [v24 localizedStringForKey:v25 value:v25 table:@"Localizable"];
LABEL_18:
          objc_msgSend(v15, "localizedStringWithFormat:", v17, v11, v47);
          break;
        default:
          goto LABEL_49;
      }
      id v27 = LABEL_19:;
      goto LABEL_44;
    case 1:
      switch(v14)
      {
        case 0:
          double v18 = NSString;
          int v19 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
          char v16 = v19;
          id v20 = @"PGLocationTitleFormatTwoLocationsWithHomeAndLocation %@";
          goto LABEL_12;
        case 1:
          id v28 = +[PGLogging sharedLogging];
          uint64_t v29 = [v28 loggingConnection];

          if (!os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
            goto LABEL_48;
          }
          __int16 v50 = 0;
          uint64_t v30 = "Attempted to create location string with two title components both of type Home";
          uint64_t v31 = (uint8_t *)&v50;
          break;
        case 2:
          long long v32 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
          char v16 = v32;
          BOOL v33 = @"PGLocationTitleFormatTwoLocationsWithHomeAndWork";
          goto LABEL_37;
        case 3:
          uint64_t v21 = NSString;
          uint64_t v34 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
          char v16 = v34;
          char v35 = @"PGLocationTitleFormatTwoLocationsWithHomeAndSomeonesHome %@";
          goto LABEL_39;
        case 4:
          long long v32 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
          char v16 = v32;
          BOOL v33 = @"PGLocationTitleFormatTwoLocationsWithHomeAndFamilyHome";
          goto LABEL_37;
        default:
          goto LABEL_49;
      }
      goto LABEL_54;
    case 2:
      switch(v14)
      {
        case 0:
          double v18 = NSString;
          int v19 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
          char v16 = v19;
          id v20 = @"PGLocationTitleFormatTwoLocationsWithWorkAndLocation %@";
          goto LABEL_12;
        case 1:
          long long v32 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
          char v16 = v32;
          BOOL v33 = @"PGLocationTitleFormatTwoLocationsWithWorkAndHome";
          goto LABEL_37;
        case 2:
          int v36 = +[PGLogging sharedLogging];
          uint64_t v29 = [v36 loggingConnection];

          if (!os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
            goto LABEL_48;
          }
          __int16 v49 = 0;
          uint64_t v30 = "Attempted to create location string with two title components both of type Work";
          uint64_t v31 = (uint8_t *)&v49;
          break;
        case 3:
          uint64_t v21 = NSString;
          uint64_t v34 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
          char v16 = v34;
          char v35 = @"PGLocationTitleFormatTwoLocationsWithWorkAndSomeonesHome %@";
          goto LABEL_39;
        case 4:
          long long v32 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
          char v16 = v32;
          BOOL v33 = @"PGLocationTitleFormatTwoLocationsWithWorkAndFamilyHome";
          goto LABEL_37;
        default:
          goto LABEL_49;
      }
LABEL_54:
      _os_log_error_impl(&dword_1D1805000, v29, OS_LOG_TYPE_ERROR, v30, v31, 2u);
LABEL_48:

      goto LABEL_49;
    case 3:
      switch(v14)
      {
        case 0:
          uint64_t v21 = NSString;
          char v16 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
          int v17 = [v16 localizedStringForKey:@"PGLocationTitleFormatTwoLocationsWithSomeonesHome %@ andLocation %@" value:@"PGLocationTitleFormatTwoLocationsWithSomeonesHome %@ andLocation %@" table:@"Localizable"];
          uint64_t v22 = [v9 personName];
          double v23 = (void *)v22;
          id v47 = v12;
          goto LABEL_41;
        case 1:
          uint64_t v21 = NSString;
          BOOL v37 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
          char v16 = v37;
          v38 = @"PGLocationTitleFormatTwoLocationsWithSomeonesHome %@ andHome";
          break;
        case 2:
          uint64_t v21 = NSString;
          BOOL v37 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
          char v16 = v37;
          v38 = @"PGLocationTitleFormatTwoLocationsWithSomeonesHome %@ andWork";
          break;
        case 3:
          v39 = NSString;
          char v16 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
          int v17 = [v16 localizedStringForKey:@"PGLocationTitleFormatTwoLocationsWithSomeonesHome %@ andAnothersHome %@" value:@"PGLocationTitleFormatTwoLocationsWithSomeonesHome %@ andAnothersHome %@" table:@"Localizable"];
          double v23 = [v9 personName];
          v40 = [v10 personName];
          id v27 = objc_msgSend(v39, "localizedStringWithFormat:", v17, v23, v40);

          goto LABEL_43;
        case 4:
          uint64_t v21 = NSString;
          BOOL v37 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
          char v16 = v37;
          v38 = @"PGLocationTitleFormatTwoLocationsWithSomeonesHome %@ andFamilyHome";
          break;
        default:
          goto LABEL_49;
      }
      int v17 = [v37 localizedStringForKey:v38 value:v38 table:@"Localizable"];
      id v41 = v9;
LABEL_40:
      uint64_t v22 = [v41 personName];
      double v23 = (void *)v22;
LABEL_41:
      objc_msgSend(v21, "localizedStringWithFormat:", v17, v22, v47);
      id v27 = LABEL_42:;
LABEL_43:

LABEL_44:
LABEL_45:

      if (!v27) {
        goto LABEL_49;
      }
      goto LABEL_50;
    case 4:
      switch(v14)
      {
        case 0:
          double v18 = NSString;
          int v19 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
          char v16 = v19;
          id v20 = @"PGLocationTitleFormatTwoLocationsWithFamilyHomeAndLocation %@";
LABEL_12:
          int v17 = [v19 localizedStringForKey:v20 value:v20 table:@"Localizable"];
          objc_msgSend(v18, "localizedStringWithFormat:", v17, v12, v47);
          goto LABEL_19;
        case 1:
          long long v32 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
          char v16 = v32;
          BOOL v33 = @"PGLocationTitleFormatTwoLocationsWithFamilyHomeAndHome";
          goto LABEL_37;
        case 2:
          long long v32 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
          char v16 = v32;
          BOOL v33 = @"PGLocationTitleFormatTwoLocationsWithFamilyHomeAndWork";
LABEL_37:
          id v27 = [v32 localizedStringForKey:v33 value:v33 table:@"Localizable"];
          goto LABEL_45;
        case 3:
          uint64_t v21 = NSString;
          uint64_t v34 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
          char v16 = v34;
          char v35 = @"PGLocationTitleFormatTwoLocationsWithFamilyHomeAndSomeonesHome %@";
LABEL_39:
          int v17 = [v34 localizedStringForKey:v35 value:v35 table:@"Localizable"];
          id v41 = v10;
          goto LABEL_40;
        case 4:
          uint64_t v42 = +[PGLogging sharedLogging];
          uint64_t v29 = [v42 loggingConnection];

          if (!os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
            goto LABEL_48;
          }
          *(_WORD *)buf = 0;
          uint64_t v30 = "Attempted to create location string with two title components both of type Family Home";
          uint64_t v31 = buf;
          goto LABEL_54;
        default:
          goto LABEL_49;
      }
    default:
LABEL_49:
      uint64_t v43 = NSString;
      int v44 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      uint64_t v45 = [v44 localizedStringForKey:@"PGLocationTitleFormatTwoLocationsWithLocation %@ otherLocation %@" value:@"PGLocationTitleFormatTwoLocationsWithLocation %@ otherLocation %@" table:@"Localizable"];
      id v27 = objc_msgSend(v43, "localizedStringWithFormat:", v45, v11, v12);

LABEL_50:
      return v27;
  }
}

+ (id)_beautifiedLocationStringWithTitleComponents:(id)a3 momentNodes:(id)a4 lineBreakBehavior:(unint64_t)a5 keyAssetAddressNode:(id)a6 curationAddressNodes:(id)a7 isMatchingKeyAsset:(BOOL *)a8 useDistrict:(BOOL)a9 allowFamilyHome:(BOOL)a10 showAllCities:(BOOL)a11 locationHelper:(id)a12 serviceManager:(id)a13
{
  BOOL v18 = a10;
  uint64_t v150 = *MEMORY[0x1E4F143B8];
  id v19 = a3;
  id v20 = a4;
  id v21 = a6;
  id v22 = a7;
  double v23 = v20;
  id v24 = a12;
  id v25 = a13;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __233__PGLocationTitleUtility__beautifiedLocationStringWithTitleComponents_momentNodes_lineBreakBehavior_keyAssetAddressNode_curationAddressNodes_isMatchingKeyAsset_useDistrict_allowFamilyHome_showAllCities_locationHelper_serviceManager___block_invoke;
  aBlock[3] = &unk_1E68EF920;
  unint64_t v113 = a5;
  unint64_t v111 = a5 & 1;
  char v146 = a5 & 1;
  BOOL v147 = a10;
  id v115 = v25;
  id v116 = a1;
  id v143 = v115;
  id v145 = a1;
  id v26 = v19;
  id v114 = v24;
  id v144 = v114;
  v129 = (void (**)(void *, void *))_Block_copy(aBlock);
  long long v126 = v21;
  if (a9)
  {
    id v117 = [v20 anyObject];
    long long v127 = [v117 graph];
    if (objc_msgSend(v116, "_titleComponentsAreInSameSupersetCity:graph:locationHelper:", v19))
    {
      id v27 = [v116 _locationStringWithDistrictsFromTitleComponents:v19 momentNodes:v20 lineBreakBehavior:a5 allowFamilyHome:a10 locationHelper:v114 serviceManager:v115];
      if (v27)
      {
        id v28 = v27;
        uint64_t v29 = v28;
        goto LABEL_106;
      }
    }
  }
  if (a11)
  {
    uint64_t v30 = [v116 _firstComponentInTimeFromComponents:v19 momentNodes:v20 curationAddressNodes:0 allowFamilyHome:a10 serviceManager:v115];
    if (v30)
    {
      id v122 = v22;
      id v105 = v20;
      id v117 = v30;
      uint64_t v31 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithObject:");
      if ((unint64_t)[v19 count] >= 2)
      {
        long long v32 = (void *)[v19 mutableCopy];
        [v32 removeObject:v117];
        BOOL v33 = [v116 _sortedComponentsFromComponents:v32];
        [v31 addObjectsFromArray:v33];
      }
      id v108 = v19;
      uint64_t v34 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v19, "count"));
      long long v138 = 0u;
      long long v139 = 0u;
      long long v140 = 0u;
      long long v141 = 0u;
      id v35 = v31;
      uint64_t v36 = [v35 countByEnumeratingWithState:&v138 objects:v149 count:16];
      long long v127 = v35;
      if (v36)
      {
        uint64_t v37 = v36;
        uint64_t v38 = *(void *)v139;
        do
        {
          for (uint64_t i = 0; i != v37; ++i)
          {
            if (*(void *)v139 != v38) {
              objc_enumerationMutation(v35);
            }
            v40 = *(void **)(*((void *)&v138 + 1) + 8 * i);
            id v41 = [v40 node];
            if ([v41 domain] == 200)
            {
              uint64_t v42 = [v41 label];
              if ([v42 isEqualToString:@"City"])
              {
              }
              else
              {
                int v43 = [v41 domain];

                BOOL v93 = v43 == 300;
                id v35 = v127;
                if (!v93) {
                  goto LABEL_26;
                }
              }
            }
            else if ([v41 domain] != 300)
            {
              goto LABEL_26;
            }
            int v44 = v129[2](v129, v40);
            if (v44 && ([v34 containsObject:v44] & 1) == 0) {
              [v34 addObject:v44];
            }

LABEL_26:
          }
          uint64_t v37 = [v35 countByEnumeratingWithState:&v138 objects:v149 count:16];
        }
        while (v37);
      }

      if ((unint64_t)[v34 count] > 2)
      {
        v81 = [v34 lastObject];
        uint64_t v82 = objc_msgSend(v34, "subarrayWithRange:", 0, objc_msgSend(v34, "count") - 1);
        v83 = NSString;
        v84 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        v85 = [v84 localizedStringForKey:@"PGLocationTitleFormatMultipleLocationsWithConcatenatedLocations %@ lastLocation %@" value:@"PGLocationTitleFormatMultipleLocationsWithConcatenatedLocations %@ lastLocation %@" table:@"Localizable"];
        v86 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        v87 = [v86 localizedStringForKey:@"PGLocationTitleFormatMultipleLocationsConcatenator" value:@"PGLocationTitleFormatMultipleLocationsConcatenator" table:@"Localizable"];
        v88 = [v82 componentsJoinedByString:v87];
        objc_msgSend(v83, "localizedStringWithFormat:", v85, v88, v81);
        id v28 = (id)objc_claimAutoreleasedReturnValue();

        uint64_t v29 = [v116 _titleWithLineBreakBehavior:v113 forTitle:v28 titleComponents:v34];

        double v23 = v105;
        id v26 = v108;
        id v22 = v122;
        goto LABEL_106;
      }

      double v23 = v105;
      id v26 = v108;
      id v21 = v126;
      uint64_t v30 = v117;
      BOOL v18 = a10;
    }
  }
  uint64_t v45 = [v116 _firstComponentInTimeFromComponents:v26 momentNodes:v23 curationAddressNodes:v22 allowFamilyHome:v18 serviceManager:v115];
  long long v128 = v129[2](v129, v45);
  id v117 = v45;
  if (v21)
  {
    v46 = [v45 addressNodes];
    int v120 = [v46 containsObject:v21];

    uint64_t v45 = v117;
  }
  else
  {
    int v120 = 1;
  }
  int v47 = [v26 count] == 1;
  uint64_t v48 = [v26 count];
  unint64_t v49 = [v26 count];
  id v50 = 0;
  id v51 = v116;
  if (!v45 || v49 < 2)
  {
    uint64_t v70 = 0;
    goto LABEL_66;
  }
  uint64_t v119 = v48;
  char v123 = v47;
  v52 = (void *)[v26 mutableCopy];
  [v52 removeObject:v45];
  id v104 = v52;
  uint64_t v53 = [v116 _sortedComponentsFromComponents:v52];
  id v54 = v45;
  v55 = (void *)v53;
  v56 = [v54 node];
  long long v134 = 0u;
  long long v135 = 0u;
  long long v136 = 0u;
  long long v137 = 0u;
  obuint64_t j = v55;
  uint64_t v57 = [obj countByEnumeratingWithState:&v134 objects:v148 count:16];
  if (!v57)
  {
    id v50 = 0;
    uint64_t v70 = 0;
    goto LABEL_65;
  }
  uint64_t v58 = v57;
  long long v106 = v23;
  long long v109 = v26;
  long long v118 = 0;
  uint64_t v59 = *(void *)v135;
  do
  {
    uint64_t v60 = 0;
    do
    {
      if (*(void *)v135 != v59) {
        objc_enumerationMutation(obj);
      }
      uint64_t v61 = *(void **)(*((void *)&v134 + 1) + 8 * v60);
      long long v62 = [v61 node];
      if ([v22 count])
      {
        long long v63 = [v61 addressNodes];
        int v64 = [v63 intersectsSet:v22];

        if (!v64) {
          goto LABEL_55;
        }
      }
      if ([v56 domain] == 200 && objc_msgSend(v62, "domain") == 200)
      {
        unint64_t v65 = [v56 label];
        unint64_t v66 = [v62 label];
        int v67 = [v65 isEqualToString:v66];

        if (!v67) {
          goto LABEL_55;
        }
      }
      if (v126)
      {
        unint64_t v68 = [v61 addressNodes];
        int v69 = [v68 containsObject:v126];

        char v123 = v69;
        if ((v120 | v69) != 1) {
          goto LABEL_55;
        }
      }
      else
      {
        char v123 = 1;
      }
      uint64_t v70 = v129[2](v129, v61);
      if (![v70 length] || !objc_msgSend(v128, "length")) {
        goto LABEL_54;
      }
      if ([v128 isEqualToString:v70])
      {
        --v119;
LABEL_54:

LABEL_55:
        goto LABEL_56;
      }
      id v50 = v61;

      if (v50) {
        goto LABEL_62;
      }
      long long v118 = v70;
LABEL_56:
      ++v60;
    }
    while (v58 != v60);
    uint64_t v71 = [obj countByEnumeratingWithState:&v134 objects:v148 count:16];
    uint64_t v58 = v71;
  }
  while (v71);
  id v50 = 0;
  uint64_t v70 = v118;
LABEL_62:
  double v23 = v106;
  id v26 = v109;
LABEL_65:

  int v47 = v123 & 1;
  id v51 = v116;
  uint64_t v45 = v117;
  uint64_t v48 = v119;
LABEL_66:
  if (a8)
  {
    char v72 = v120 | v47;
    if (!v45) {
      char v72 = 0;
    }
    *a8 = v72;
  }
  if (!v50 || ![v70 length])
  {
    id v73 = v128;
    uint64_t v75 = v73;
    goto LABEL_89;
  }
  id v73 = v128;
  if (![v128 length])
  {
    uint64_t v75 = 0;
    goto LABEL_89;
  }
  v130[0] = MEMORY[0x1E4F143A8];
  v130[1] = 3221225472;
  v130[2] = __233__PGLocationTitleUtility__beautifiedLocationStringWithTitleComponents_momentNodes_lineBreakBehavior_keyAssetAddressNode_curationAddressNodes_isMatchingKeyAsset_useDistrict_allowFamilyHome_showAllCities_locationHelper_serviceManager___block_invoke_2;
  v130[3] = &unk_1E68EF948;
  id v133 = v51;
  id v117 = v45;
  id v131 = v117;
  id v50 = v50;
  id v132 = v50;
  v74 = (void (**)(void *, void *, void *, uint64_t))_Block_copy(v130);
  uint64_t v75 = v74[2](v74, v128, v70, v48);
  if ((unint64_t)[v75 length] < 0x17
    || ([v128 containsString:v70] & 1) == 0
    && ![v70 containsString:v128])
  {
    goto LABEL_88;
  }
  id v124 = v22;
  long long v107 = v23;
  long long v110 = v26;
  if (!v126)
  {
LABEL_85:
    id v78 = v50;
    id v79 = 0;
    v76 = v117;
    goto LABEL_86;
  }
  if ((v120 & 1) == 0)
  {
    if (v47)
    {
      id v77 = v50;
      id v80 = v70;
      v76 = v117;
      id v78 = v50;
      goto LABEL_87;
    }
    goto LABEL_85;
  }
  v76 = v117;
  id v77 = v117;
  id v78 = v50;
  id v79 = v128;
  id v80 = v79;
  if (!v77)
  {
LABEL_86:
    v89 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", v76, v78, 0);
    BOOL v90 = [v116 _sortedComponentsFromComponents:v89];
    id v77 = [v90 firstObject];
    v129[2](v129, v77);
    id v80 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_87:
  id v91 = v77;

  id v92 = v80;
  id v50 = 0;
  uint64_t v70 = 0;
  long long v128 = v92;
  id v117 = v91;
  uint64_t v75 = v92;
  double v23 = v107;
  id v26 = v110;
  id v22 = v124;
LABEL_88:

  id v73 = v128;
LABEL_89:
  long long v127 = v73;
  if (v73)
  {
    BOOL v93 = !v111 || v70 == 0;
    BOOL v94 = !v93;
    if ((v113 & 2) != 0 || v94)
    {
      id v125 = v50;
      uint64_t v95 = [v75 stringByReplacingOccurrencesOfString:@"\n" withString:&stru_1F283BC78];
      v96 = [MEMORY[0x1E4F1CA48] array];
      id v97 = [v73 stringByReplacingOccurrencesOfString:@"\n" withString:&stru_1F283BC78];
      [v96 addObject:v97];
      if (v70)
      {
        id v98 = v23;
        v99 = v26;
        v100 = [v70 stringByReplacingOccurrencesOfString:@"\n" withString:&stru_1F283BC78];
        [v96 addObject:v100];
        if (v111)
        {
          uint64_t v101 = +[PGCommonTitleUtility titleWithLineBreakForTitle:v95 andUsedNames:v96];

          uint64_t v95 = (void *)v101;
        }

        id v26 = v99;
        double v23 = v98;
      }
      if ((v113 & 2) != 0)
      {
        uint64_t v102 = +[PGCommonTitleUtility titleWithNoLineBreakSpaceForTitle:v95 andUsedNames:v96];

        uint64_t v95 = (void *)v102;
      }

      uint64_t v75 = v95;
      id v50 = v125;
    }
  }
  id v28 = v75;

  uint64_t v29 = v28;
LABEL_106:

  return v29;
}

id __233__PGLocationTitleUtility__beautifiedLocationStringWithTitleComponents_momentNodes_lineBreakBehavior_keyAssetAddressNode_curationAddressNodes_isMatchingKeyAsset_useDistrict_allowFamilyHome_showAllCities_locationHelper_serviceManager___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 node];
  uint64_t v5 = v4;
  if (v4)
  {
    if ([v4 domain] == 300)
    {
      uint64_t v6 = [v3 edge];
      id v7 = +[PGPeopleTitleUtility beautifiedLocationStringWithPersonNode:v5 peopleAddressEdge:v6 titleComponent:v3 insertLineBreak:*(unsigned __int8 *)(a1 + 56) allowFamilyHome:*(unsigned __int8 *)(a1 + 57) serviceManager:*(void *)(a1 + 32)];
    }
    else
    {
      id v7 = [*(id *)(a1 + 48) beautifiedLocationNodeStringWithPlaceNode:v5 locationHelper:*(void *)(a1 + 40)];
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

id __233__PGLocationTitleUtility__beautifiedLocationStringWithTitleComponents_momentNodes_lineBreakBehavior_keyAssetAddressNode_curationAddressNodes_isMatchingKeyAsset_useDistrict_allowFamilyHome_showAllCities_locationHelper_serviceManager___block_invoke_2(void *a1, void *a2, void *a3, uint64_t a4)
{
  id v7 = a2;
  id v8 = a3;
  if (!v8 || a4 == 1)
  {
    id v12 = v7;
  }
  else
  {
    uint64_t v10 = a1[5];
    id v9 = (void *)a1[6];
    uint64_t v11 = a1[4];
    if (a4 == 2) {
      [v9 _localizedStringForTwoLocationsWithFirstComponentForTitle:v11 secondComponentForTitle:v10 firstLocation:v7 otherLocation:v8];
    }
    else {
    id v12 = [v9 _localizedStringForMultipleLocationsWithFirstComponentForTitle:v11 secondComponentForTitle:v10 firstLocation:v7 otherLocation:v8];
    }
  }
  uint64_t v13 = v12;

  return v13;
}

+ (id)_commonCityTitleComponentsFromMomentNodes:(id)a3 remainingAddressNodes:(id)a4 ignoredAddressNodes:(id)a5 incompleteLocationResolver:(id)a6 locationHelper:(id)a7
{
  uint64_t v111 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v76 = v11;
  id v73 = v14;
  char v16 = [[PGLocationsResolver alloc] initWithMomentNodes:v11 incompleteLocationResolver:v14 locationHelper:v15];
  [(PGLocationsResolver *)v16 setShouldCreateLocationToAddressMapTable:1];
  v74 = v13;
  [(PGLocationsResolver *)v16 setIgnoredAddressNodes:v13];
  LODWORD(v17) = 1051931443;
  [(PGLocationsResolver *)v16 setMaximumMissingLocationsThreshold:v17];
  char v72 = v16;
  BOOL v18 = [(PGLocationsResolver *)v16 resolvedLocationNodesToAddressNodesMapTable];
  long long v102 = 0u;
  long long v103 = 0u;
  long long v104 = 0u;
  long long v105 = 0u;
  id v19 = [v18 keyEnumerator];
  id v20 = [v19 allObjects];

  uint64_t v21 = [v20 countByEnumeratingWithState:&v102 objects:v110 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v103;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v103 != v23) {
          objc_enumerationMutation(v20);
        }
        uint64_t v25 = *(void *)(*((void *)&v102 + 1) + 8 * i);
        id v26 = [v18 objectForKey:v25];
        if (([v26 intersectsSet:v12] & 1) == 0) {
          [v18 removeObjectForKey:v25];
        }
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v102 objects:v110 count:16];
    }
    while (v22);
  }
  uint64_t v75 = v12;

  long long v100 = 0u;
  long long v101 = 0u;
  long long v98 = 0u;
  long long v99 = 0u;
  id v27 = [v18 keyEnumerator];
  id v28 = [v27 allObjects];

  uint64_t v29 = [v28 countByEnumeratingWithState:&v98 objects:v109 count:16];
  if (v29)
  {
    uint64_t v30 = v29;
    uint64_t v31 = *(void *)v99;
    id v78 = v28;
    id v79 = v15;
    uint64_t v77 = *(void *)v99;
    do
    {
      uint64_t v32 = 0;
      uint64_t v80 = v30;
      do
      {
        if (*(void *)v99 != v31) {
          objc_enumerationMutation(v28);
        }
        BOOL v33 = *(void **)(*((void *)&v98 + 1) + 8 * v32);
        uint64_t v34 = [v33 name];
        id v35 = [v34 lowercaseString];

        if (v35)
        {
          uint64_t v82 = v35;
          if ([v35 length])
          {
            uint64_t v81 = v32;
            id v36 = [v33 label];
            if ([v36 isEqualToString:@"City"])
            {
              uint64_t v37 = [v18 objectForKey:v33];

              uint64_t v32 = v81;
              if (!v37) {
                goto LABEL_45;
              }
              id v36 = v33;
              uint64_t v38 = [v15 countyNodeFromCityNode:v36];
              v39 = [v38 anyNode];

              if (v39)
              {
                v40 = [v39 name];
                [v40 lowercaseString];
                id v41 = v85 = v39;
                int v42 = [v41 containsString:v35];

                v39 = v85;
                if (v42)
                {
                  v84 = [v18 objectForKey:v36];
                  v83 = [MEMORY[0x1E4F1CA80] set];
                  long long v94 = 0u;
                  long long v95 = 0u;
                  long long v96 = 0u;
                  long long v97 = 0u;
                  int v43 = [v18 keyEnumerator];
                  int v44 = [v43 allObjects];

                  uint64_t v45 = [v44 countByEnumeratingWithState:&v94 objects:v108 count:16];
                  if (v45)
                  {
                    uint64_t v46 = v45;
                    uint64_t v47 = *(void *)v95;
                    do
                    {
                      for (uint64_t j = 0; j != v46; ++j)
                      {
                        if (*(void *)v95 != v47) {
                          objc_enumerationMutation(v44);
                        }
                        unint64_t v49 = *(void **)(*((void *)&v94 + 1) + 8 * j);
                        if (([v36 isSameNodeAsNode:v49] & 1) == 0)
                        {
                          id v50 = [v49 label];
                          int v51 = [v50 isEqualToString:@"City"];

                          if (v51)
                          {
                            id v52 = v49;
                            uint64_t v53 = [v52 collection];
                            id v54 = [v53 countyNodes];
                            v55 = [v54 anyNode];

                            if ([v85 isSameNodeAsNode:v55])
                            {
                              v56 = [v18 objectForKey:v52];
                              [v84 unionSet:v56];
                              [v83 addObject:v52];
                            }
                          }
                        }
                      }
                      uint64_t v46 = [v44 countByEnumeratingWithState:&v94 objects:v108 count:16];
                    }
                    while (v46);
                  }

                  id v15 = v79;
                  uint64_t v31 = v77;
                  if ([v83 count])
                  {
                    [v18 setObject:v84 forKey:v85];
                    long long v92 = 0u;
                    long long v93 = 0u;
                    long long v90 = 0u;
                    long long v91 = 0u;
                    id v57 = v83;
                    uint64_t v58 = [v57 countByEnumeratingWithState:&v90 objects:v107 count:16];
                    if (v58)
                    {
                      uint64_t v59 = v58;
                      uint64_t v60 = *(void *)v91;
                      do
                      {
                        for (uint64_t k = 0; k != v59; ++k)
                        {
                          if (*(void *)v91 != v60) {
                            objc_enumerationMutation(v57);
                          }
                          [v18 removeObjectForKey:*(void *)(*((void *)&v90 + 1) + 8 * k)];
                        }
                        uint64_t v59 = [v57 countByEnumeratingWithState:&v90 objects:v107 count:16];
                      }
                      while (v59);
                    }

                    [v18 removeObjectForKey:v36];
                  }

                  id v28 = v78;
                  uint64_t v30 = v80;
                  v39 = v85;
                }
              }
            }
            uint64_t v32 = v81;
            id v35 = v82;
          }
        }
LABEL_45:

        ++v32;
      }
      while (v32 != v30);
      uint64_t v30 = [v28 countByEnumeratingWithState:&v98 objects:v109 count:16];
    }
    while (v30);
  }

  long long v62 = [MEMORY[0x1E4F1CA80] set];
  long long v86 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  long long v63 = [v18 keyEnumerator];
  uint64_t v64 = [v63 countByEnumeratingWithState:&v86 objects:v106 count:16];
  if (v64)
  {
    uint64_t v65 = v64;
    uint64_t v66 = *(void *)v87;
    do
    {
      for (uint64_t m = 0; m != v65; ++m)
      {
        if (*(void *)v87 != v66) {
          objc_enumerationMutation(v63);
        }
        uint64_t v68 = *(void *)(*((void *)&v86 + 1) + 8 * m);
        int v69 = objc_alloc_init(PGLocationTitleComponent);
        [(PGLocationTitleComponent *)v69 setNode:v68];
        uint64_t v70 = [v18 objectForKey:v68];
        [(PGLocationTitleComponent *)v69 setAddressNodes:v70];

        [v62 addObject:v69];
      }
      uint64_t v65 = [v63 countByEnumeratingWithState:&v86 objects:v106 count:16];
    }
    while (v65);
  }

  return v62;
}

+ (id)commonCityTitleComponentsFromMomentNodes:(id)a3 addressNodes:(id)a4 incompleteLocationResolver:(id)a5 locationHelper:(id)a6
{
  uint64_t v10 = (objc_class *)MEMORY[0x1E4F1CAD0];
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  id v15 = objc_alloc_init(v10);
  char v16 = [a1 _commonCityTitleComponentsFromMomentNodes:v14 remainingAddressNodes:v13 ignoredAddressNodes:v15 incompleteLocationResolver:v12 locationHelper:v11];

  return v16;
}

+ (id)_filteredAOINodeCombinationsForCombinations:(id)a3 minSize:(unint64_t)a4 maxSize:(unint64_t)a5 maxTitleLength:(unint64_t)a6 minNumberOfAssets:(unint64_t)a7 aoiNodesToAddressNodesMapTable:(id)a8 assetCountByAddressNodeIdentifier:(id)a9 locationHelper:(id)a10
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v54 = a8;
  id v53 = a9;
  id v15 = a10;
  id v43 = [MEMORY[0x1E4F1CA80] set];
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  obuint64_t j = v14;
  uint64_t v16 = [obj countByEnumeratingWithState:&v63 objects:v69 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v64;
    unint64_t v47 = a4;
    unint64_t v48 = a5;
    uint64_t v46 = *(void *)v64;
    do
    {
      uint64_t v19 = 0;
      uint64_t v49 = v17;
      do
      {
        if (*(void *)v64 != v18) {
          objc_enumerationMutation(obj);
        }
        id v20 = *(void **)(*((void *)&v63 + 1) + 8 * v19);
        unint64_t v21 = objc_msgSend(v20, "count", v43);
        if (v21 >= a4 && v21 <= a5)
        {
          uint64_t v51 = v19;
          uint64_t v23 = [MEMORY[0x1E4F1CA80] set];
          long long v59 = 0u;
          long long v60 = 0u;
          long long v61 = 0u;
          long long v62 = 0u;
          id v24 = v20;
          uint64_t v25 = [v24 countByEnumeratingWithState:&v59 objects:v68 count:16];
          id v52 = v24;
          if (v25)
          {
            uint64_t v26 = v25;
            unint64_t v27 = 0;
            uint64_t v28 = *(void *)v60;
            do
            {
              for (uint64_t i = 0; i != v26; ++i)
              {
                if (*(void *)v60 != v28) {
                  objc_enumerationMutation(v52);
                }
                uint64_t v30 = *(void *)(*((void *)&v59 + 1) + 8 * i);
                uint64_t v31 = [a1 beautifiedLocationNodeStringWithPlaceNode:v30 locationHelper:v15];
                v27 += [v31 length];
                uint64_t v32 = [v54 objectForKey:v30];
                BOOL v33 = [v32 allObjects];
                [v23 addObjectsFromArray:v33];
              }
              uint64_t v26 = [v52 countByEnumeratingWithState:&v59 objects:v68 count:16];
            }
            while (v26);

            if (v27 > a6) {
              goto LABEL_31;
            }
          }
          else
          {
          }
          long long v57 = 0u;
          long long v58 = 0u;
          long long v55 = 0u;
          long long v56 = 0u;
          id v34 = v23;
          uint64_t v35 = [v34 countByEnumeratingWithState:&v55 objects:v67 count:16];
          if (v35)
          {
            uint64_t v36 = v35;
            unint64_t v37 = 0;
            uint64_t v38 = *(void *)v56;
            do
            {
              for (uint64_t j = 0; j != v36; ++j)
              {
                if (*(void *)v56 != v38) {
                  objc_enumerationMutation(v34);
                }
                v40 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(*((void *)&v55 + 1) + 8 * j), "identifier"));
                id v41 = [v53 objectForKeyedSubscript:v40];
                v37 += [v41 unsignedIntegerValue];
              }
              uint64_t v36 = [v34 countByEnumeratingWithState:&v55 objects:v67 count:16];
            }
            while (v36);
          }
          else
          {
            unint64_t v37 = 0;
          }

          if (v37 >= a7) {
            [v43 addObject:v52];
          }
LABEL_31:

          a4 = v47;
          a5 = v48;
          uint64_t v18 = v46;
          uint64_t v17 = v49;
          uint64_t v19 = v51;
        }
        ++v19;
      }
      while (v19 != v17);
      uint64_t v17 = [obj countByEnumeratingWithState:&v63 objects:v69 count:16];
    }
    while (v17);
  }

  return v43;
}

+ (id)_sortedAOINodeCombinationsForCombinations:(id)a3 aoiNodesToAddressNodesMapTable:(id)a4 assetCountByAddressNodeIdentifier:(id)a5 locationHelper:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = [a3 allObjects];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __148__PGLocationTitleUtility__sortedAOINodeCombinationsForCombinations_aoiNodesToAddressNodesMapTable_assetCountByAddressNodeIdentifier_locationHelper___block_invoke;
  v19[3] = &unk_1E68EF8F8;
  id v20 = v12;
  id v21 = v10;
  id v22 = v11;
  id v23 = a1;
  id v14 = v11;
  id v15 = v10;
  id v16 = v12;
  uint64_t v17 = [v13 sortedArrayUsingComparator:v19];

  return v17;
}

uint64_t __148__PGLocationTitleUtility__sortedAOINodeCombinationsForCombinations_aoiNodesToAddressNodesMapTable_assetCountByAddressNodeIdentifier_locationHelper___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v116 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v78 = a3;
  context = (void *)MEMORY[0x1D25FED50]();
  uint64_t v82 = [MEMORY[0x1E4F1CA80] set];
  long long v106 = 0u;
  long long v107 = 0u;
  long long v108 = 0u;
  long long v109 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v106 objects:v115 count:16];
  double v8 = 0.0;
  obuint64_t j = v6;
  if (v7)
  {
    uint64_t v9 = v7;
    unint64_t v10 = 0;
    uint64_t v11 = *(void *)v107;
    double v12 = 0.0;
    LOBYTE(v13) = 1;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v107 != v11) {
          objc_enumerationMutation(obj);
        }
        id v15 = *(void **)(*((void *)&v106 + 1) + 8 * i);
        id v16 = [*(id *)(a1 + 56) beautifiedLocationNodeStringWithPlaceNode:v15 locationHelper:*(void *)(a1 + 32)];
        v10 += [v16 length];
        uint64_t v17 = [*(id *)(a1 + 40) objectForKey:v15];
        uint64_t v18 = [v17 allObjects];
        [v82 addObjectsFromArray:v18];

        [v15 popularityScore];
        int v13 = (v19 != -1.0) & v13;
        if (v19 == -1.0) {
          double v19 = -0.0;
        }
        double v12 = v12 + v19;
      }
      id v6 = obj;
      uint64_t v9 = [obj countByEnumeratingWithState:&v106 objects:v115 count:16];
    }
    while (v9);
  }
  else
  {
    unint64_t v10 = 0;
    int v13 = 1;
    double v12 = 0.0;
  }

  unint64_t v20 = [v6 count];
  double v21 = v12 / (double)v20;
  if (!v20) {
    double v21 = 0.0;
  }
  if (v13) {
    double v22 = v21;
  }
  else {
    double v22 = 0.0;
  }
  uint64_t v81 = objc_msgSend(MEMORY[0x1E4F1CA80], "set", v21);
  long long v102 = 0u;
  long long v103 = 0u;
  long long v104 = 0u;
  long long v105 = 0u;
  id v23 = v78;
  uint64_t v24 = [v23 countByEnumeratingWithState:&v102 objects:v114 count:16];
  id v76 = v23;
  if (v24)
  {
    uint64_t v25 = v24;
    unint64_t v26 = 0;
    id v79 = *(id *)v103;
    double v8 = 0.0;
    do
    {
      for (uint64_t j = 0; j != v25; ++j)
      {
        if (*(id *)v103 != v79) {
          objc_enumerationMutation(v76);
        }
        uint64_t v28 = *(void **)(*((void *)&v102 + 1) + 8 * j);
        uint64_t v29 = [*(id *)(a1 + 56) beautifiedLocationNodeStringWithPlaceNode:v28 locationHelper:*(void *)(a1 + 32)];
        v26 += [v29 length];
        uint64_t v30 = [*(id *)(a1 + 40) objectForKey:v28];
        uint64_t v31 = [v30 allObjects];
        [v81 addObjectsFromArray:v31];

        [v28 popularityScore];
        BOOL v33 = v32 != -1.0;
        if (v32 == -1.0) {
          double v32 = -0.0;
        }
        double v8 = v8 + v32;
        v13 &= v33;
      }
      id v23 = v76;
      uint64_t v25 = [v76 countByEnumeratingWithState:&v102 objects:v114 count:16];
    }
    while (v25);
  }
  else
  {
    unint64_t v26 = 0;
  }

  unint64_t v34 = [v23 count];
  double v35 = 0.0;
  if (v13 && v34) {
    double v35 = v8 / (double)v34;
  }
  if (!_os_feature_enabled_impl()) {
    goto LABEL_35;
  }
  if (v22 <= v35)
  {
    if (v35 > v22) {
      goto LABEL_59;
    }
LABEL_35:
    long long v100 = 0u;
    long long v101 = 0u;
    long long v98 = 0u;
    long long v99 = 0u;
    id v37 = v82;
    uint64_t v38 = [v37 countByEnumeratingWithState:&v98 objects:v113 count:16];
    if (v38)
    {
      uint64_t v39 = v38;
      unint64_t v40 = 0;
      uint64_t v41 = *(void *)v99;
      do
      {
        for (uint64_t k = 0; k != v39; ++k)
        {
          if (*(void *)v99 != v41) {
            objc_enumerationMutation(v37);
          }
          id v43 = *(void **)(a1 + 48);
          int v44 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(*((void *)&v98 + 1) + 8 * k), "identifier"));
          uint64_t v45 = [v43 objectForKeyedSubscript:v44];
          v40 += [v45 unsignedIntegerValue];
        }
        uint64_t v39 = [v37 countByEnumeratingWithState:&v98 objects:v113 count:16];
      }
      while (v39);
    }
    else
    {
      unint64_t v40 = 0;
    }

    long long v96 = 0u;
    long long v97 = 0u;
    long long v94 = 0u;
    long long v95 = 0u;
    id v80 = v81;
    uint64_t v46 = [v80 countByEnumeratingWithState:&v94 objects:v112 count:16];
    if (v46)
    {
      uint64_t v47 = v46;
      unint64_t v48 = 0;
      uint64_t v49 = *(void *)v95;
      do
      {
        for (uint64_t m = 0; m != v47; ++m)
        {
          if (*(void *)v95 != v49) {
            objc_enumerationMutation(v80);
          }
          uint64_t v51 = *(void **)(a1 + 48);
          id v52 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(*((void *)&v94 + 1) + 8 * m), "identifier"));
          id v53 = [v51 objectForKeyedSubscript:v52];
          v48 += [v53 unsignedIntegerValue];
        }
        uint64_t v47 = [v80 countByEnumeratingWithState:&v94 objects:v112 count:16];
      }
      while (v47);
    }
    else
    {
      unint64_t v48 = 0;
    }

    if (v40 > v48)
    {
      uint64_t v36 = -1;
LABEL_57:
      id v23 = v76;
      goto LABEL_60;
    }
    if (v48 > v40)
    {
      uint64_t v36 = 1;
      goto LABEL_57;
    }
    unint64_t v54 = [obj count];
    id v23 = v76;
    if (v54 > [v76 count])
    {
LABEL_59:
      uint64_t v36 = 1;
      goto LABEL_60;
    }
    unint64_t v56 = [v76 count];
    if (v56 > [obj count]) {
      goto LABEL_33;
    }
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __148__PGLocationTitleUtility__sortedAOINodeCombinationsForCombinations_aoiNodesToAddressNodesMapTable_assetCountByAddressNodeIdentifier_locationHelper___block_invoke_2;
    aBlock[3] = &unk_1E68EF8D0;
    id v57 = *(id *)(a1 + 40);
    uint64_t v58 = *(void *)(a1 + 56);
    id v92 = v57;
    uint64_t v93 = v58;
    long long v59 = (double (**)(void *, id))_Block_copy(aBlock);
    double v60 = v59[2](v59, obj);
    double v61 = v59[2](v59, v76);
    if (v60 <= v61)
    {
      uint64_t v36 = 1;
      if (v61 > v60 || v10 > v26) {
        goto LABEL_64;
      }
      if (v26 <= v10)
      {
        long long v62 = [obj anyObject];
        unint64_t v63 = [v62 identifier];

        long long v89 = 0u;
        long long v90 = 0u;
        long long v87 = 0u;
        long long v88 = 0u;
        id v64 = obj;
        uint64_t v65 = [v64 countByEnumeratingWithState:&v87 objects:v111 count:16];
        if (v65)
        {
          uint64_t v66 = v65;
          uint64_t v67 = *(void *)v88;
          do
          {
            for (uint64_t n = 0; n != v66; ++n)
            {
              if (*(void *)v88 != v67) {
                objc_enumerationMutation(v64);
              }
              unint64_t v69 = [*(id *)(*((void *)&v87 + 1) + 8 * n) identifier];
              if (v63 >= v69) {
                unint64_t v63 = v69;
              }
            }
            uint64_t v66 = [v64 countByEnumeratingWithState:&v87 objects:v111 count:16];
          }
          while (v66);
        }

        long long v85 = 0u;
        long long v86 = 0u;
        long long v83 = 0u;
        long long v84 = 0u;
        id v70 = v76;
        uint64_t v71 = [v70 countByEnumeratingWithState:&v83 objects:v110 count:16];
        if (v71)
        {
          uint64_t v72 = v71;
          uint64_t v73 = *(void *)v84;
          uint64_t v36 = 1;
LABEL_79:
          uint64_t v74 = 0;
          while (1)
          {
            if (*(void *)v84 != v73) {
              objc_enumerationMutation(v70);
            }
            if ([*(id *)(*((void *)&v83 + 1) + 8 * v74) identifier] < v63) {
              break;
            }
            if (v72 == ++v74)
            {
              uint64_t v72 = [v70 countByEnumeratingWithState:&v83 objects:v110 count:16];
              if (v72) {
                goto LABEL_79;
              }
              goto LABEL_85;
            }
          }
        }
        else
        {
LABEL_85:
          uint64_t v36 = -1;
        }

        goto LABEL_64;
      }
    }
    uint64_t v36 = -1;
LABEL_64:

    goto LABEL_60;
  }
LABEL_33:
  uint64_t v36 = -1;
LABEL_60:

  return v36;
}

double __148__PGLocationTitleUtility__sortedAOINodeCombinationsForCombinations_aoiNodesToAddressNodesMapTable_assetCountByAddressNodeIdentifier_locationHelper___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    double v7 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        unint64_t v10 = [*(id *)(a1 + 32) objectForKey:v9];
        [*(id *)(a1 + 40) _weightForAreaNode:v9 withAddressNodes:v10];
        double v7 = v7 + v11;
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }
  else
  {
    double v7 = 0.0;
  }

  return v7;
}

+ (double)_weightForAreaNode:(id)a3 withAddressNodes:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    double v10 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        double v12 = [v5 anyEdgeFromNode:*(void *)(*((void *)&v16 + 1) + 8 * i)];
        [v12 relevance];
        double v14 = 1.0 - v13;

        double v10 = v10 + v14;
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }
  else
  {
    double v10 = 0.0;
  }

  return v10;
}

+ (id)_aoiSubsetsFromAOI:(id)a3 maxSubsetSize:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v7 = [MEMORY[0x1E4F1CA80] set];
  if (a4)
  {
    unint64_t v8 = 1;
    do
    {
      uint64_t v9 = [MEMORY[0x1E4F1CAD0] set];
      double v10 = [a1 _aoiSubsetsFromAOI:v6 idx:0 currentSubset:v9 subsetSize:v8];
      [v7 unionSet:v10];

      ++v8;
    }
    while (v8 <= a4);
  }

  return v7;
}

+ (id)_aoiSubsetsFromAOI:(id)a3 idx:(unint64_t)a4 currentSubset:(id)a5 subsetSize:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a5;
  double v12 = [MEMORY[0x1E4F1CA80] set];
  if ([v10 count] != a4 || objc_msgSend(v11, "count") >= a6)
  {
    if ([v11 count] == a6)
    {
      [v12 addObject:v11];
    }
    else
    {
      unint64_t v13 = a4 + 1;
      double v14 = [a1 _aoiSubsetsFromAOI:v10 idx:a4 + 1 currentSubset:v11 subsetSize:a6];
      [v12 unionSet:v14];

      long long v15 = (void *)[v11 mutableCopy];
      long long v16 = [v10 objectAtIndexedSubscript:a4];
      [v15 addObject:v16];

      long long v17 = [a1 _aoiSubsetsFromAOI:v10 idx:v13 currentSubset:v15 subsetSize:a6];
      [v12 unionSet:v17];
    }
  }

  return v12;
}

+ (id)commonAOIComponentsForMomentNodes:(id)a3 addressNodes:(id)a4 aoiDisplayType:(unint64_t)a5 containsAmusementParkPOI:(BOOL)a6 locationHelper:(id)a7
{
  BOOL v8 = a6;
  uint64_t v105 = *MEMORY[0x1E4F143B8];
  id v55 = a3;
  id v11 = a4;
  id v62 = a7;
  id v70 = v11;
  if (![v11 count] || a5 - 1 >= 4)
  {
    id v41 = objc_alloc_init(MEMORY[0x1E4F1CAD0]);
    goto LABEL_40;
  }
  if (v8) {
    double v12 = 0.55;
  }
  else {
    double v12 = dbl_1D1F50128[a5 - 1];
  }
  BOOL v13 = a5 == 2 || a5 == 4;
  uint64_t v14 = 24;
  if (v13) {
    uint64_t v14 = 45;
  }
  uint64_t v59 = v14;
  uint64_t v71 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v99 = 0u;
  long long v100 = 0u;
  long long v97 = 0u;
  long long v98 = 0u;
  obuint64_t j = v55;
  unint64_t v15 = 0;
  uint64_t v16 = [obj countByEnumeratingWithState:&v97 objects:v104 count:16];
  if (v16)
  {
    uint64_t v74 = *(void *)v98;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v98 != v74) {
          objc_enumerationMutation(obj);
        }
        long long v18 = *(void **)(*((void *)&v97 + 1) + 8 * i);
        long long v19 = (void *)MEMORY[0x1D25FED50]();
        uint64_t v20 = [v18 numberOfAssets];
        id v21 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        v96[0] = 0;
        v96[1] = v96;
        v96[2] = 0x2020000000;
        v96[3] = 0;
        v92[0] = MEMORY[0x1E4F143A8];
        v92[1] = 3221225472;
        v92[2] = __128__PGLocationTitleUtility_commonAOIComponentsForMomentNodes_addressNodes_aoiDisplayType_containsAmusementParkPOI_locationHelper___block_invoke;
        v92[3] = &unk_1E68EF880;
        id v93 = v70;
        id v22 = v21;
        id v94 = v22;
        long long v95 = v96;
        [v18 enumerateAddressEdgesAndNodesUsingBlock:v92];
        v88[0] = MEMORY[0x1E4F143A8];
        v88[1] = 3221225472;
        v88[2] = __128__PGLocationTitleUtility_commonAOIComponentsForMomentNodes_addressNodes_aoiDisplayType_containsAmusementParkPOI_locationHelper___block_invoke_2;
        v88[3] = &unk_1E68EF8A8;
        long long v90 = v96;
        id v89 = v71;
        uint64_t v91 = v20;
        [v22 enumerateKeysAndObjectsUsingBlock:v88];

        _Block_object_dispose(v96, 8);
        v15 += v20;
      }
      uint64_t v16 = [obj countByEnumeratingWithState:&v97 objects:v104 count:16];
    }
    while (v16);
  }

  uint64_t v75 = [MEMORY[0x1E4F1CA60] dictionary];
  id obja = [MEMORY[0x1E4F28E10] mapTableWithKeyOptions:0 valueOptions:0];
  double v60 = [MEMORY[0x1E4F28E10] mapTableWithKeyOptions:0 valueOptions:0];
  long long v86 = 0u;
  long long v87 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  id v56 = v70;
  uint64_t v63 = [v56 countByEnumeratingWithState:&v84 objects:v103 count:16];
  unint64_t v23 = vcvtpd_u64_f64(v12 * (double)v15);
  unint64_t v54 = v23;
  if (!v63)
  {

LABEL_44:
    id v43 = [obja keyEnumerator];
    unint64_t v69 = [v43 allObjects];

    contexta = [a1 _aoiSubsetsFromAOI:v69 maxSubsetSize:2];
    uint64_t v65 = [a1 _filteredAOINodeCombinationsForCombinations:contexta minSize:1 maxSize:2 maxTitleLength:v59 minNumberOfAssets:v54 aoiNodesToAddressNodesMapTable:obja assetCountByAddressNodeIdentifier:v71 locationHelper:v62];
    int v44 = [a1 _sortedAOINodeCombinationsForCombinations:v65 aoiNodesToAddressNodesMapTable:obja assetCountByAddressNodeIdentifier:v71 locationHelper:v62];
    uint64_t v45 = [v44 firstObject];
    objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v45, "count"));
    id v41 = (id)objc_claimAutoreleasedReturnValue();
    long long v78 = 0u;
    long long v79 = 0u;
    long long v76 = 0u;
    long long v77 = 0u;
    id v46 = v45;
    uint64_t v47 = [v46 countByEnumeratingWithState:&v76 objects:v101 count:16];
    if (v47)
    {
      uint64_t v48 = *(void *)v77;
      do
      {
        for (uint64_t j = 0; j != v47; ++j)
        {
          if (*(void *)v77 != v48) {
            objc_enumerationMutation(v46);
          }
          uint64_t v50 = *(void *)(*((void *)&v76 + 1) + 8 * j);
          uint64_t v51 = [obja objectForKey:v50];
          id v52 = objc_alloc_init(PGLocationTitleComponent);
          [(PGLocationTitleComponent *)v52 setNode:v50];
          [(PGLocationTitleComponent *)v52 setAddressNodes:v51];
          [v41 addObject:v52];
        }
        uint64_t v47 = [v46 countByEnumeratingWithState:&v76 objects:v101 count:16];
      }
      while (v47);
    }

    goto LABEL_52;
  }
  unint64_t v53 = v15 - v23;
  unint64_t v57 = 0;
  uint64_t v58 = *(void *)v85;
  do
  {
    uint64_t v24 = 0;
    do
    {
      if (*(void *)v85 != v58)
      {
        uint64_t v25 = v24;
        objc_enumerationMutation(v56);
        uint64_t v24 = v25;
      }
      uint64_t v64 = v24;
      unint64_t v26 = *(void **)(*((void *)&v84 + 1) + 8 * v24);
      context = (void *)MEMORY[0x1D25FED50]();
      unint64_t v27 = [MEMORY[0x1E4F1CAD0] setWithObject:v26];
      uint64_t v68 = [a1 _filteredAOINodesForAddressNodes:v27 aoiTitleMaximumLength:v59 locationHelper:v62];

      [v60 setObject:v68 forKey:v26];
      uint64_t v28 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v26, "identifier"));
      uint64_t v29 = [v71 objectForKeyedSubscript:v28];
      uint64_t v30 = [v29 unsignedIntegerValue];

      if ([v68 count])
      {
        long long v82 = 0u;
        long long v83 = 0u;
        long long v80 = 0u;
        long long v81 = 0u;
        id v31 = v68;
        uint64_t v32 = [v31 countByEnumeratingWithState:&v80 objects:v102 count:16];
        if (v32)
        {
          uint64_t v33 = *(void *)v81;
          do
          {
            for (uint64_t k = 0; k != v32; ++k)
            {
              if (*(void *)v81 != v33) {
                objc_enumerationMutation(v31);
              }
              double v35 = *(void **)(*((void *)&v80 + 1) + 8 * k);
              uint64_t v36 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v35, "identifier"));
              id v37 = [v75 objectForKeyedSubscript:v36];
              uint64_t v38 = [v37 unsignedIntegerValue];

              uint64_t v39 = [NSNumber numberWithUnsignedInteger:v38 + v30];
              [v75 setObject:v39 forKeyedSubscript:v36];

              unint64_t v40 = [obja objectForKey:v35];
              if (!v40)
              {
                unint64_t v40 = [MEMORY[0x1E4F1CA80] set];
                [obja setObject:v40 forKey:v35];
              }
              [v40 addObject:v26];
            }
            uint64_t v32 = [v31 countByEnumeratingWithState:&v80 objects:v102 count:16];
          }
          while (v32);
        }
      }
      else
      {
        v57 += v30;
      }

      uint64_t v24 = v64 + 1;
    }
    while (v64 + 1 != v63);
    uint64_t v63 = [v56 countByEnumeratingWithState:&v84 objects:v103 count:16];
  }
  while (v63);

  if (v57 <= v53) {
    goto LABEL_44;
  }
  id v41 = objc_alloc_init(MEMORY[0x1E4F1CAD0]);
LABEL_52:

LABEL_40:
  return v41;
}

void __128__PGLocationTitleUtility_commonAOIComponentsForMomentNodes_addressNodes_aoiDisplayType_containsAmusementParkPOI_locationHelper___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  if ([*(id *)(a1 + 32) containsObject:v5])
  {
    [v11 relevance];
    double v7 = v6;
    BOOL v8 = objc_msgSend(NSNumber, "numberWithDouble:");
    uint64_t v9 = *(void **)(a1 + 40);
    id v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v5, "identifier"));
    [v9 setObject:v8 forKeyedSubscript:v10];

    *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v7
                                                                + *(double *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                            + 24);
  }
}

void __128__PGLocationTitleUtility_commonAOIComponentsForMomentNodes_addressNodes_aoiDisplayType_containsAmusementParkPOI_locationHelper___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  [a3 doubleValue];
  double v7 = v6 / *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  BOOL v8 = [*(id *)(a1 + 32) objectForKeyedSubscript:v5];
  unint64_t v9 = [v8 unsignedIntegerValue];

  id v10 = [NSNumber numberWithDouble:ceil(v7 * (double)*(unint64_t *)(a1 + 48)) + (double)v9];
  [*(id *)(a1 + 32) setObject:v10 forKeyedSubscript:v5];
}

+ (id)_filteredAOINodesForAddressNodes:(id)a3 aoiTitleMaximumLength:(unint64_t)a4 locationHelper:(id)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a5;
  BOOL v8 = [MEMORY[0x1E4F1CA80] set];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  obuint64_t j = v6;
  uint64_t v9 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v28 != v11) {
          objc_enumerationMutation(obj);
        }
        BOOL v13 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        uint64_t v14 = (void *)MEMORY[0x1D25FED50]();
        unint64_t v15 = [v13 collection];
        uint64_t v16 = [v7 areaNodesFromAddressNodes:v15];
        long long v17 = [v16 temporarySet];

        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        v23[2] = __96__PGLocationTitleUtility__filteredAOINodesForAddressNodes_aoiTitleMaximumLength_locationHelper___block_invoke;
        v23[3] = &unk_1E68EF858;
        id v25 = a1;
        id v24 = v7;
        unint64_t v26 = a4;
        long long v18 = [v17 objectsPassingTest:v23];
        [v8 unionSet:v18];
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v10);
  }

  return v8;
}

BOOL __96__PGLocationTitleUtility__filteredAOINodesForAddressNodes_aoiTitleMaximumLength_locationHelper___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (([v3 isBlocked] & 1) == 0
    && (([v3 popularityScore], v4 >= 500.0) || (objc_msgSend(v3, "popularityScore"), v5 == -1.0)))
  {
    id v7 = [*(id *)(a1 + 40) beautifiedLocationNodeStringWithPlaceNode:v3 locationHelper:*(void *)(a1 + 32)];
    BOOL v8 = v7;
    if (v7) {
      BOOL v6 = (unint64_t)[v7 length] <= *(void *)(a1 + 48);
    }
    else {
      BOOL v6 = 0;
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

+ (id)_filteredAddressNodesWithAddressNodes:(id)a3 momentNodes:(id)a4 incompleteLocationResolver:(id)a5 filterSignificantLocationsOption:(unint64_t)a6 locationHelper:(id)a7
{
  v36[3] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a7;
  id v13 = a5;
  id v14 = a4;
  unint64_t v15 = [[PGLocationsResolver alloc] initWithMomentNodes:v14 incompleteLocationResolver:v13 locationHelper:v12];

  LODWORD(v16) = 1051931443;
  [(PGLocationsResolver *)v15 setMaximumMissingLocationsThreshold:v16];
  long long v17 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"universalStartDate" ascending:1];
  v36[0] = v17;
  long long v18 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"universalEndDate" ascending:1];
  v36[1] = v18;
  long long v19 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"UUID" ascending:1];
  v36[2] = v19;
  uint64_t v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:3];

  id v21 = [v14 sortedArrayUsingDescriptors:v20];

  id v22 = [(PGLocationsResolver *)v15 resolvedLocationNodes];
  unint64_t v23 = [[PGLocationsFilterer alloc] initWithSortedMomentNodes:v21 locationNodes:v22 incompleteLocationResolver:v13];

  if (a6 == 3) {
    uint64_t v24 = 2;
  }
  else {
    uint64_t v24 = a6 == 2;
  }
  [(PGLocationsFilterer *)v23 setFilteringType:v24];
  id v25 = [(PGLocationsFilterer *)v23 filteredLocationNodes];
  unint64_t v26 = [v25 count];
  if (v26 < [v22 count] && objc_msgSend(v11, "count"))
  {
    long long v27 = [v11 anyObject];
    long long v28 = [v27 graph];

    double v35 = [(MAElementCollection *)[PGGraphAddressNodeCollection alloc] initWithSet:v11 graph:v28];
    long long v29 = [(MAElementCollection *)[PGGraphLocationNodeCollection alloc] initWithArray:v25 graph:v28];
    [(PGGraphLocationNodeCollection *)v29 addressNodes];
    id v31 = v30 = v11;
    uint64_t v32 = [(MAElementCollection *)v35 collectionByIntersecting:v31];
    uint64_t v34 = [v32 temporarySet];

    id v11 = (id)v34;
  }

  return v11;
}

+ (void)generateHighlightLocationTitleForTripWithMomentNodes:(id)a3 lineBreakBehavior:(unint64_t)a4 locationHelper:(id)a5 result:(id)a6
{
  uint64_t v10 = (void (**)(id, void *, void *))a6;
  id v11 = a5;
  id v12 = a3;
  id v13 = [[PGLocationTripTitleUtility alloc] initWithMomentNodes:v12 filterMomentsAndCities:1 allowLongAOI:0 locationHelper:v11];

  id v14 = [(PGLocationTripTitleUtility *)v13 usedTitleComponents];
  switch([(PGLocationTripTitleUtility *)v13 tripTitleType])
  {
    case 0uLL:
      uint64_t v20 = +[PGLogging sharedLogging];
      id v21 = [v20 loggingConnection];

      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D1805000, v21, OS_LOG_TYPE_ERROR, "Trip title type was not set properly, found to be PGTripTitleTypeOther", buf, 2u);
      }

      goto LABEL_12;
    case 1uLL:
    case 2uLL:
      unint64_t v15 = [v14 firstObject];
      double v16 = NSString;
      long long v17 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      long long v18 = [v17 localizedStringForKey:@"PGTripHighlightTitleFormatOneLocation %@" value:@"PGTripHighlightTitleFormatOneLocation %@" table:@"Localizable"];
      long long v19 = objc_msgSend(v16, "localizedStringWithFormat:", v18, v15);
      goto LABEL_9;
    case 3uLL:
      unint64_t v15 = [v14 firstObject];
      long long v17 = [v14 lastObject];
      id v22 = NSString;
      unint64_t v23 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      long long v18 = v23;
      uint64_t v24 = @"PGTripHighlightTitleFormatToLocation %@ andLocation %@";
      goto LABEL_8;
    case 4uLL:
      unint64_t v15 = [v14 firstObject];
      long long v17 = [v14 lastObject];
      id v22 = NSString;
      unint64_t v23 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      long long v18 = v23;
      uint64_t v24 = @"PGTripHighlightTitleFormatFromLocation %@ toLocation %@";
LABEL_8:
      id v25 = [v23 localizedStringForKey:v24 value:v24 table:@"Localizable"];
      long long v19 = objc_msgSend(v22, "localizedStringWithFormat:", v25, v15, v17);

LABEL_9:
      if (!v19) {
        goto LABEL_12;
      }
      unint64_t v26 = [a1 _titleWithLineBreakBehavior:a4 forTitle:v19 titleComponents:v14];

      if (!v10) {
        goto LABEL_14;
      }
      goto LABEL_13;
    default:
LABEL_12:
      unint64_t v26 = 0;
      if (v10)
      {
LABEL_13:
        long long v27 = [(PGLocationTripTitleUtility *)v13 usedLocationNodes];
        v10[2](v10, v26, v27);
      }
LABEL_14:

      return;
  }
}

+ (void)generateLocationTitleForTripWithMomentNodes:(id)a3 locationHelper:(id)a4 result:(id)a5
{
  id v12 = (void (**)(id, void *, void *))a5;
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = [[PGLocationTripTitleUtility alloc] initWithMomentNodes:v8 filterMomentsAndCities:1 locationHelper:v7];

  if (v12)
  {
    uint64_t v10 = [(PGLocationTripTitleUtility *)v9 title];
    id v11 = [(PGLocationTripTitleUtility *)v9 usedLocationNodes];
    v12[2](v12, v10, v11);
  }
}

+ (BOOL)containsAmusementParkPOIFromMomentNodes:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v15 = 0;
  double v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = a3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v19 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v12;
LABEL_3:
    uint64_t v6 = 0;
    while (1)
    {
      if (*(void *)v12 != v5) {
        objc_enumerationMutation(v3);
      }
      id v7 = *(void **)(*((void *)&v11 + 1) + 8 * v6);
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __66__PGLocationTitleUtility_containsAmusementParkPOIFromMomentNodes___block_invoke;
      v10[3] = &unk_1E68EF830;
      v10[4] = &v15;
      [v7 enumeratePOINodesUsingBlock:v10];
      if (*((unsigned char *)v16 + 24)) {
        break;
      }
      if (v4 == ++v6)
      {
        uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v19 count:16];
        if (v4) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  BOOL v8 = *((unsigned char *)v16 + 24) != 0;
  _Block_object_dispose(&v15, 8);

  return v8;
}

void __66__PGLocationTitleUtility_containsAmusementParkPOIFromMomentNodes___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v5 = [a2 label];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v5 isEqualToString:@"AmusementPark"];

  *a3 = *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
}

+ (void)generateLocationTitleWithOptions:(id)a3 locationHelper:(id)a4 serviceManager:(id)a5 result:(id)a6
{
  uint64_t v103 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v71 = a4;
  id v67 = a5;
  unint64_t v69 = (void (**)(id, void, void *))a6;
  id v70 = v10;
  uint64_t v68 = [v10 momentNodes];
  if ([v68 count])
  {
    long long v11 = v10;
    if ([v10 useBusinessItems])
    {
      uint64_t v94 = 0;
      long long v95 = &v94;
      uint64_t v96 = 0x3032000000;
      long long v97 = __Block_byref_object_copy__69020;
      long long v98 = __Block_byref_object_dispose__69021;
      id v99 = 0;
      uint64_t v88 = 0;
      id v89 = &v88;
      uint64_t v90 = 0x3032000000;
      uint64_t v91 = __Block_byref_object_copy__69020;
      id v92 = __Block_byref_object_dispose__69021;
      id v93 = 0;
      v87[0] = MEMORY[0x1E4F143A8];
      v87[1] = 3221225472;
      v87[2] = __96__PGLocationTitleUtility_generateLocationTitleWithOptions_locationHelper_serviceManager_result___block_invoke;
      v87[3] = &unk_1E68EF800;
      v87[4] = &v94;
      v87[5] = &v88;
      +[PGLocationTitleUtility generateBusinessItemLocationWithOptions:v10 result:v87];
      if (v95[5])
      {
        if (v69)
        {
          if (v89[5]) {
            objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObject:");
          }
          else {
          unint64_t v57 = [MEMORY[0x1E4F1CAD0] set];
          }
          v69[2](v69, v95[5], v57);
        }
        _Block_object_dispose(&v88, 8);

        _Block_object_dispose(&v94, 8);
        goto LABEL_88;
      }
      _Block_object_dispose(&v88, 8);

      _Block_object_dispose(&v94, 8);
      long long v11 = v10;
    }
    uint64_t v64 = [v11 keyAssetAddressNode];
    uint64_t v63 = [v10 curationAddressNodes];
    uint64_t v72 = [v10 lineBreakBehavior];
    long long v12 = [MEMORY[0x1E4F1CA80] set];
    long long v85 = 0u;
    long long v86 = 0u;
    long long v83 = 0u;
    long long v84 = 0u;
    id v13 = v68;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v83 objects:v102 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v84;
      double v16 = 1.79769313e308;
      double v17 = -1.79769313e308;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v84 != v15) {
            objc_enumerationMutation(v13);
          }
          long long v19 = *(void **)(*((void *)&v83 + 1) + 8 * i);
          [v19 timestampUTCStart];
          double v21 = v20;
          [v19 timestampUTCEnd];
          if (v21 < v16) {
            double v16 = v21;
          }
          if (v22 > v17) {
            double v17 = v22;
          }
          unint64_t v23 = [v19 addressNodes];
          if (v23) {
            [v12 unionSet:v23];
          }
        }
        uint64_t v14 = [v13 countByEnumeratingWithState:&v83 objects:v102 count:16];
      }
      while (v14);
    }
    else
    {
      double v16 = 1.79769313e308;
      double v17 = -1.79769313e308;
    }

    uint64_t v24 = [v12 count];
    if (v69 && !v24) {
      v69[2](v69, 0, 0);
    }
    uint64_t v25 = [v70 filterSignificantLocationsType];
    int v26 = [v70 useTripTitleForLongDuration];
    if (v17 - v16 > 172800.0) {
      int v27 = v26;
    }
    else {
      int v27 = 0;
    }
    if (v27 == 1)
    {
      long long v28 = [[PGLocationTripTitleUtility alloc] initWithMomentNodes:v13 filterMomentsAndCities:v25 != 0 locationHelper:v71];
      uint64_t v66 = [(PGLocationTripTitleUtility *)v28 title];
      double v61 = [(PGLocationTripTitleUtility *)v28 usedLocationNodes];

      if (v66)
      {
        uint64_t v73 = v61;
LABEL_82:
        if (v69) {
          ((void (**)(id, void *, void *))v69)[2](v69, v66, v73);
        }

        goto LABEL_88;
      }
    }
    else
    {
      double v61 = 0;
    }
    id v62 = [[PGIncompleteLocationResolver alloc] initWithAddressNodes:v12 locationHelper:v71];
    if (v25)
    {
      long long v29 = objc_msgSend(a1, "_filteredAddressNodesWithAddressNodes:momentNodes:incompleteLocationResolver:filterSignificantLocationsOption:locationHelper:", v12, v13, v62, objc_msgSend(v70, "filterSignificantLocationsType"), v71);
      if (v29 != v12 || (uint64_t v30 = [v12 count], v30 != objc_msgSend(v12, "count")))
      {
        uint64_t v31 = [MEMORY[0x1E4F1CA80] setWithSet:v29];

        long long v12 = (void *)v31;
      }
    }
    uint64_t v32 = [MEMORY[0x1E4F1CA80] set];
    if ([v70 peopleDisplayType])
    {
      uint64_t v33 = objc_msgSend((id)objc_opt_class(), "peopleLocationTitleComponentsFromAddressNodesSet:peopleDisplayType:serviceManager:", v12, objc_msgSend(v70, "peopleDisplayType"), v67);
      [v32 unionSet:v33];
    }
    uint64_t v74 = [MEMORY[0x1E4F1CA80] set];
    long long v81 = 0u;
    long long v82 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    id v34 = v32;
    uint64_t v35 = [v34 countByEnumeratingWithState:&v79 objects:v101 count:16];
    if (v35)
    {
      uint64_t v36 = *(void *)v80;
      do
      {
        for (uint64_t j = 0; j != v35; ++j)
        {
          if (*(void *)v80 != v36) {
            objc_enumerationMutation(v34);
          }
          uint64_t v38 = [*(id *)(*((void *)&v79 + 1) + 8 * j) addressNodes];
          [v74 unionSet:v38];
          [v12 minusSet:v38];
        }
        uint64_t v35 = [v34 countByEnumeratingWithState:&v79 objects:v101 count:16];
      }
      while (v35);
    }

    uint64_t v39 = [v70 aoiDisplayType];
    if ((unint64_t)(v39 - 1) > 3)
    {
      uint64_t v65 = 0;
    }
    else
    {
      uint64_t v65 = objc_msgSend(a1, "commonAOIComponentsForMomentNodes:addressNodes:aoiDisplayType:containsAmusementParkPOI:locationHelper:", v13, v12, v39, objc_msgSend(a1, "containsAmusementParkPOIFromMomentNodes:", v13), v71);
    }
    if ([v70 useCities])
    {
      double v60 = [a1 _commonCityTitleComponentsFromMomentNodes:v13 remainingAddressNodes:v12 ignoredAddressNodes:v74 incompleteLocationResolver:v62 locationHelper:v71];
      if (![v65 count])
      {
        if (v60) {
          objc_msgSend(v34, "unionSet:");
        }
        else {
          double v60 = 0;
        }
        goto LABEL_58;
      }
    }
    else
    {
      double v60 = 0;
      if (![v65 count]) {
        goto LABEL_58;
      }
    }
    [v34 unionSet:v65];
LABEL_58:
    char v40 = [v70 showAllCities];
    char v41 = [v70 useDistrict];
    char v42 = [v70 allowFamilyHome];
    LOBYTE(v94) = 0;
    BYTE2(v58) = v40;
    BYTE1(v58) = v42;
    LOBYTE(v58) = v41;
    uint64_t v66 = objc_msgSend(a1, "_beautifiedLocationStringWithTitleComponents:momentNodes:lineBreakBehavior:keyAssetAddressNode:curationAddressNodes:isMatchingKeyAsset:useDistrict:allowFamilyHome:showAllCities:locationHelper:serviceManager:", v34, v13, v72, v64, v63, &v94, v58, v71, v67);
    if (!(_BYTE)v94 && [v65 count])
    {
      [v34 minusSet:v65];
      if ([v60 count]) {
        [v34 unionSet:v60];
      }
      BYTE2(v59) = v40;
      BYTE1(v59) = v42;
      LOBYTE(v59) = v41;
      uint64_t v43 = objc_msgSend(a1, "_beautifiedLocationStringWithTitleComponents:momentNodes:lineBreakBehavior:keyAssetAddressNode:curationAddressNodes:isMatchingKeyAsset:useDistrict:allowFamilyHome:showAllCities:locationHelper:serviceManager:", v34, v13, v72, v64, v63, &v94, v59, v71, v67);

      uint64_t v66 = (void *)v43;
    }
    uint64_t v73 = [MEMORY[0x1E4F1CA80] set];
    long long v77 = 0u;
    long long v78 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    id v44 = v34;
    uint64_t v45 = [v44 countByEnumeratingWithState:&v75 objects:v100 count:16];
    if (v45)
    {
      uint64_t v46 = *(void *)v76;
      do
      {
        uint64_t v47 = 0;
        do
        {
          if (*(void *)v76 != v46) {
            objc_enumerationMutation(v44);
          }
          uint64_t v48 = *(void **)(*((void *)&v75 + 1) + 8 * v47);
          uint64_t v49 = [v48 node];
          uint64_t v50 = v49;
          if (v49)
          {
            if ([v49 domain] == 200 || objc_msgSend(v50, "domain") == 201)
            {
              [v73 addObject:v50];
            }
            else if ([v50 domain] == 300)
            {
              uint64_t v51 = [v48 edge];
              id v52 = v51;
              if (v51)
              {
                unint64_t v53 = [v51 sourceNode];
                unint64_t v54 = [v71 cityNodeFromAddressNode:v53];
                id v55 = [v54 anyNode];

                if (v55) {
                  [v73 addObject:v55];
                }
              }
            }
          }

          ++v47;
        }
        while (v45 != v47);
        uint64_t v56 = [v44 countByEnumeratingWithState:&v75 objects:v100 count:16];
        uint64_t v45 = v56;
      }
      while (v56);
    }

    goto LABEL_82;
  }
  if (v69) {
    v69[2](v69, 0, 0);
  }
LABEL_88:
}

void __96__PGLocationTitleUtility_generateLocationTitleWithOptions_locationHelper_serviceManager_result___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  BOOL v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

+ (id)businessNodeForTitlingFromMomentNodes:(id)a3 businessNodesByMomentNode:(id)a4
{
  id v5 = a3;
  id v6 = [a4 intersectingSourcesWith:v5];
  uint64_t v7 = [v6 targets];
  uint64_t v8 = [v7 count];

  if (v8 == 1)
  {
    v21[0] = 0;
    v21[1] = v21;
    v21[2] = 0x2020000000;
    char v22 = 1;
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    double v17 = __90__PGLocationTitleUtility_businessNodeForTitlingFromMomentNodes_businessNodesByMomentNode___block_invoke;
    char v18 = &unk_1E68EF7D8;
    id v9 = v6;
    id v19 = v9;
    double v20 = v21;
    [v5 enumerateIdentifiersAsCollectionsWithBlock:&v15];
    id v10 = objc_msgSend(v9, "targets", v15, v16, v17, v18);
    id v11 = [v10 anyNode];

    long long v12 = [v11 name];
    if ((unint64_t)[v12 length] <= 0x1E && objc_msgSend(v12, "length")) {
      id v13 = v11;
    }
    else {
      id v13 = 0;
    }

    _Block_object_dispose(v21, 8);
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

void __90__PGLocationTitleUtility_businessNodeForTitlingFromMomentNodes_businessNodesByMomentNode___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  id v6 = objc_msgSend(*(id *)(a1 + 32), "targetsForSources:");
  uint64_t v7 = [v6 count];

  if (!v7)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 1;
  }
}

+ (void)generateBusinessItemLocationWithOptions:(id)a3 result:(id)a4
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void *, void *))a4;
  if (v7)
  {
    uint64_t v8 = [v6 momentNodes];
    id v9 = [v8 anyObject];
    id v10 = [v9 graph];

    if ([v8 count] && v10)
    {
      id v11 = [(MAElementCollection *)[PGGraphMomentNodeCollection alloc] initWithSet:v8 graph:v10];
      long long v12 = (void *)MEMORY[0x1E4F71E88];
      id v13 = +[PGGraphMomentNode businessOfMoment];
      uint64_t v14 = [v12 adjacencyWithSources:v11 relation:v13 targetsClass:objc_opt_class()];

      uint64_t v15 = [a1 businessNodeForTitlingFromMomentNodes:v11 businessNodesByMomentNode:v14];
      uint64_t v16 = v15;
      if (v15)
      {
        double v17 = [v15 name];
        uint64_t v21 = [v6 lineBreakBehavior];
        v22[0] = v17;
        [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];
        id v19 = v18 = v14;
        double v20 = [a1 _titleWithLineBreakBehavior:v21 forTitle:v17 titleComponents:v19];

        uint64_t v14 = v18;
        v7[2](v7, v20, v16);
      }
      else
      {
        v7[2](v7, 0, 0);
      }
    }
    else
    {
      v7[2](v7, 0, 0);
    }
  }
}

@end