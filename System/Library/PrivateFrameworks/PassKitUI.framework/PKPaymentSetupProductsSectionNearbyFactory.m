@interface PKPaymentSetupProductsSectionNearbyFactory
+ (BOOL)_itemsContainRegionData:(id)a3;
+ (id)_createNearbySectionFromCandidates:(id)a3;
+ (id)_polygonFromListItem:(id)a3;
+ (id)_regionalListItemsUsingContext:(id)a3 listItems:(id)a4;
+ (id)_sortedItemsBasedUponProximityUsingContext:(id)a3 listItems:(id)a4;
+ (id)generateSectionWithDefaultSortingForItems:(id)a3 withContext:(id)a4;
+ (void)_sortContainedProducts:(id)a3;
+ (void)_sortExternalProducts:(id)a3 withMapping:(id)a4;
@end

@implementation PKPaymentSetupProductsSectionNearbyFactory

+ (id)generateSectionWithDefaultSortingForItems:(id)a3 withContext:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v7 location];
  if (v8 && (v9 = (void *)v8, int v10 = [a1 _itemsContainRegionData:v6], v9, v10))
  {
    v11 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      int v19 = 138412290;
      uint64_t v20 = (uint64_t)v7;
      _os_log_debug_impl(&dword_19F450000, v11, OS_LOG_TYPE_DEBUG, "Nearby: Calculating nearby products for %@", (uint8_t *)&v19, 0xCu);
    }

    v12 = PKLocalizedString(&cfstr_Nearby.isa);
    v13 = [[PKPaymentSetupProductsSectionListSection alloc] initWithIdentifier:v12];
    v14 = [a1 _regionalListItemsUsingContext:v7 listItems:v6];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v17 = [v14 count];
      int v19 = 134217984;
      uint64_t v20 = v17;
      _os_log_debug_impl(&dword_19F450000, v11, OS_LOG_TYPE_DEBUG, "Nearby: Found %lu products in user's current region", (uint8_t *)&v19, 0xCu);
    }

    v15 = [a1 _sortedItemsBasedUponProximityUsingContext:v7 listItems:v14];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v18 = [v15 count];
      int v19 = 134217984;
      uint64_t v20 = v18;
      _os_log_debug_impl(&dword_19F450000, v11, OS_LOG_TYPE_DEBUG, "Nearby: Found %lu nearby products", (uint8_t *)&v19, 0xCu);
    }

    [(PKPaymentSetupProductsSectionListSection *)v13 setSectionListItems:v15];
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

+ (id)_sortedItemsBasedUponProximityUsingContext:(id)a3 listItems:(id)a4
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = objc_msgSend(a4, "pk_objectsPassingTest:", &__block_literal_global_239);
  uint64_t v8 = objc_msgSend(v7, "pk_objectsPassingTest:", &__block_literal_global_15_0);
  v9 = (void *)[v8 mutableCopy];
  [a1 _sortContainedProducts:v9];
  if ((unint64_t)[v9 count] < 3)
  {
    v47 = v8;
    id v49 = v6;
    v11 = [v6 location];
    [v11 coordinate];
    double v13 = v12;
    double v15 = v14;

    v48 = v7;
    v16 = objc_msgSend(v7, "pk_arrayByRemovingObjectsInArray:", v9);
    id v17 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v64 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    id v18 = v16;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v64 objects:v71 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v65;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v65 != v21) {
            objc_enumerationMutation(v18);
          }
          v23 = *(void **)(*((void *)&v64 + 1) + 8 * i);
          v24 = [v23 identifier];
          v25 = [a1 _polygonFromListItem:v23];
          [v17 safelySetObject:v25 forKey:v24];
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v64 objects:v71 count:16];
      }
      while (v20);
    }
    v46 = v9;

    id v53 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v26 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v60 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    id v27 = v18;
    uint64_t v28 = [v27 countByEnumeratingWithState:&v60 objects:v70 count:16];
    if (!v28)
    {
LABEL_28:

      v39 = (void *)[v53 mutableCopy];
      [a1 _sortContainedProducts:v39];
      v9 = v46;
      [v46 addObjectsFromArray:v39];
      if ((unint64_t)[v46 count] < 3)
      {
        id v41 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        v54[0] = MEMORY[0x1E4F143A8];
        v54[1] = 3221225472;
        v54[2] = __99__PKPaymentSetupProductsSectionNearbyFactory__sortedItemsBasedUponProximityUsingContext_listItems___block_invoke_18;
        v54[3] = &unk_1E59E01B0;
        double v57 = v15;
        double v58 = v13;
        id v55 = v17;
        id v56 = v41;
        id v42 = v41;
        v40 = v26;
        v43 = objc_msgSend(v26, "pk_objectsPassingTest:", v54);
        v44 = (void *)[v43 mutableCopy];
        [a1 _sortExternalProducts:v44 withMapping:v42];
        [v46 addObjectsFromArray:v44];
        int v10 = [a1 _createNearbySectionFromCandidates:v46];
      }
      else
      {
        int v10 = [a1 _createNearbySectionFromCandidates:v46];
        v40 = v26;
      }

      id v7 = v48;
      id v6 = v49;
      uint64_t v8 = v47;
      goto LABEL_32;
    }
    uint64_t v29 = v28;
    uint64_t v30 = *(void *)v61;
LABEL_12:
    uint64_t v31 = 0;
    while (1)
    {
      if (*(void *)v61 != v30) {
        objc_enumerationMutation(v27);
      }
      v32 = *(void **)(*((void *)&v60 + 1) + 8 * v31);
      v33 = objc_msgSend(v32, "identifier", v46);
      v34 = [v17 objectForKey:v33];

      char v59 = 0;
      if (v34)
      {
        if (objc_msgSend(v34, "containsPoint:inExclusionaryRegion:", &v59, v15, v13))
        {
          v35 = PKLogFacilityTypeGetObject();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
          {
            v51 = [v32 product];
            v50 = [v51 productIdentifier];
            *(_DWORD *)buf = 138412290;
            v69 = v50;
            _os_log_debug_impl(&dword_19F450000, v35, OS_LOG_TYPE_DEBUG, "Nearby: Product inside inside region - %@", buf, 0xCu);
          }
          v36 = v53;
          goto LABEL_25;
        }
        if (v59)
        {
          v37 = PKLogFacilityTypeGetObject();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
          {
            v52 = [v32 product];
            v38 = [v52 productIdentifier];
            *(_DWORD *)buf = 138412290;
            v69 = v38;
            _os_log_debug_impl(&dword_19F450000, v37, OS_LOG_TYPE_DEBUG, "Nearby: Product inside exclusionary region - %@", buf, 0xCu);
          }
          goto LABEL_26;
        }
      }
      v36 = v26;
LABEL_25:
      [v36 addObject:v32];
LABEL_26:

      if (v29 == ++v31)
      {
        uint64_t v29 = [v27 countByEnumeratingWithState:&v60 objects:v70 count:16];
        if (!v29) {
          goto LABEL_28;
        }
        goto LABEL_12;
      }
    }
  }
  int v10 = [a1 _createNearbySectionFromCandidates:v9];
LABEL_32:

  return v10;
}

BOOL __99__PKPaymentSetupProductsSectionNearbyFactory__sortedItemsBasedUponProximityUsingContext_listItems___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 product];
  v3 = [v2 regionData];
  BOOL v4 = v3 != 0;

  return v4;
}

uint64_t __99__PKPaymentSetupProductsSectionNearbyFactory__sortedItemsBasedUponProximityUsingContext_listItems___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 product];
  v3 = [v2 regionData];

  uint64_t v4 = [v3 isPersistent];
  return v4;
}

BOOL __99__PKPaymentSetupProductsSectionNearbyFactory__sortedItemsBasedUponProximityUsingContext_listItems___block_invoke_18(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  v5 = [v3 identifier];
  id v6 = [v4 objectForKey:v5];

  if (v6)
  {
    objc_msgSend(v6, "closestDistanceToPoint:", *(double *)(a1 + 48), *(double *)(a1 + 56));
    double v8 = v7;
    v9 = [v3 product];
    int v10 = [v9 regionData];
    [v10 maximumMatchingDistance];
    double v12 = v11;

    double v13 = PKLogFacilityTypeGetObject();
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG);
    BOOL v15 = v8 < v12;
    if (v8 >= v12)
    {
      if (!v14) {
        goto LABEL_9;
      }
      uint64_t v21 = [v3 product];
      id v17 = [v21 productIdentifier];
      int v22 = 138412802;
      v23 = v17;
      __int16 v24 = 2048;
      double v25 = v8;
      __int16 v26 = 2048;
      double v27 = v12;
      _os_log_debug_impl(&dword_19F450000, v13, OS_LOG_TYPE_DEBUG, "Nearby: Product %@ discarded because it is %.1fkm away with a max distance of %.1fkm", (uint8_t *)&v22, 0x20u);
    }
    else
    {
      if (v14)
      {
        uint64_t v19 = [v3 product];
        uint64_t v20 = [v19 productIdentifier];
        int v22 = 138412546;
        v23 = v20;
        __int16 v24 = 2048;
        double v25 = v8;
        _os_log_debug_impl(&dword_19F450000, v13, OS_LOG_TYPE_DEBUG, "Nearby: Product %@ is %.1fkm away", (uint8_t *)&v22, 0x16u);
      }
      v16 = *(void **)(a1 + 40);
      double v13 = [NSNumber numberWithDouble:v8];
      id v17 = [v3 identifier];
      [v16 safelySetObject:v13 forKey:v17];
    }

LABEL_9:
    goto LABEL_10;
  }
  BOOL v15 = 0;
LABEL_10:

  return v15;
}

+ (void)_sortContainedProducts:(id)a3
{
}

uint64_t __69__PKPaymentSetupProductsSectionNearbyFactory__sortContainedProducts___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = [v4 product];
  double v7 = [v6 regionData];
  [v7 priority];

  double v8 = [v5 product];
  v9 = [v8 regionData];
  [v9 priority];

  uint64_t v10 = PKComparePaymentSetupProductRegionPriority();
  if (!v10)
  {
    double v11 = [v4 title];
    double v12 = [v5 title];
    uint64_t v10 = [v11 localizedCaseInsensitiveCompare:v12];
  }
  return v10;
}

+ (void)_sortExternalProducts:(id)a3 withMapping:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __80__PKPaymentSetupProductsSectionNearbyFactory__sortExternalProducts_withMapping___block_invoke;
  v7[3] = &unk_1E59CD528;
  id v8 = v5;
  id v6 = v5;
  [a3 sortUsingComparator:v7];
}

uint64_t __80__PKPaymentSetupProductsSectionNearbyFactory__sortExternalProducts_withMapping___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  double v7 = *(void **)(a1 + 32);
  id v8 = [v5 identifier];
  v9 = [v7 objectForKey:v8];
  [v9 doubleValue];
  double v11 = v10;

  double v12 = *(void **)(a1 + 32);
  double v13 = [v6 identifier];
  BOOL v14 = [v12 objectForKey:v13];
  [v14 doubleValue];
  double v16 = v15;

  id v17 = [v5 product];
  id v18 = [v17 regionData];
  [v18 priority];

  uint64_t v19 = [v6 product];
  uint64_t v20 = [v19 regionData];
  [v20 priority];

  if (v11 >= v16)
  {
    if (v16 >= v11)
    {
      uint64_t v21 = PKComparePaymentSetupProductRegionPriority();
      if (!v21)
      {
        int v22 = [v5 title];
        v23 = [v6 title];
        uint64_t v21 = [v22 localizedCaseInsensitiveCompare:v23];
      }
    }
    else
    {
      uint64_t v21 = 1;
    }
  }
  else
  {
    uint64_t v21 = -1;
  }

  return v21;
}

+ (BOOL)_itemsContainRegionData:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = a3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v3);
        }
        double v7 = objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "product", (void)v10);
        id v8 = [v7 regionData];

        if (v8)
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v4;
}

+ (id)_polygonFromListItem:(id)a3
{
  id v3 = [a3 product];
  uint64_t v4 = [v3 regionData];

  if (([v4 isPersistent] & 1) != 0
    || ([v4 inclusionaryZones], uint64_t v5 = objc_claimAutoreleasedReturnValue(), v5, !v5))
  {
    long long v10 = 0;
  }
  else
  {
    id v6 = [v4 inclusionaryZones];
    double v7 = objc_msgSend(v6, "pk_arrayByApplyingBlock:", &__block_literal_global_25);

    id v8 = [v4 exclusionaryZones];

    if (v8)
    {
      v9 = [v4 exclusionaryZones];
      id v8 = objc_msgSend(v9, "pk_arrayByApplyingBlock:", &__block_literal_global_31);
    }
    long long v10 = [[PKPaymentSetupProductRegionDataComplexPolygon alloc] initWithInclusionaryZones:v7 exclusionaryZones:v8];
  }

  return v10;
}

uint64_t __67__PKPaymentSetupProductsSectionNearbyFactory__polygonFromListItem___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "pk_arrayByApplyingBlock:", &__block_literal_global_28_0);
}

uint64_t __67__PKPaymentSetupProductsSectionNearbyFactory__polygonFromListItem___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 longitude];
  double v4 = v3;
  [v2 latitude];
  double v6 = v5;

  double v7 = (void *)MEMORY[0x1E4F29238];

  return objc_msgSend(v7, "valueWithCGPoint:", v4, v6);
}

uint64_t __67__PKPaymentSetupProductsSectionNearbyFactory__polygonFromListItem___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "pk_arrayByApplyingBlock:", &__block_literal_global_33_3);
}

uint64_t __67__PKPaymentSetupProductsSectionNearbyFactory__polygonFromListItem___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 longitude];
  double v4 = v3;
  [v2 latitude];
  double v6 = v5;

  double v7 = (void *)MEMORY[0x1E4F29238];

  return objc_msgSend(v7, "valueWithCGPoint:", v4, v6);
}

+ (id)_createNearbySectionFromCandidates:(id)a3
{
  id v3 = a3;
  if ((unint64_t)[v3 count] <= 3) {
    uint64_t v4 = [v3 count];
  }
  else {
    uint64_t v4 = 3;
  }
  double v5 = objc_msgSend(v3, "subarrayWithRange:", 0, v4);
  double v6 = (void *)[v5 mutableCopy];

  return v6;
}

+ (id)_regionalListItemsUsingContext:(id)a3 listItems:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  double v7 = [v6 primaryRegion];
  id v8 = [v6 secondaryRegion];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __87__PKPaymentSetupProductsSectionNearbyFactory__regionalListItemsUsingContext_listItems___block_invoke;
  v13[3] = &unk_1E59E0218;
  id v14 = v7;
  id v15 = v8;
  id v9 = v8;
  id v10 = v7;
  long long v11 = objc_msgSend(v5, "pk_objectsPassingTest:", v13);

  return v11;
}

uint64_t __87__PKPaymentSetupProductsSectionNearbyFactory__regionalListItemsUsingContext_listItems___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v3 = objc_msgSend(a2, "product", 0);
  uint64_t v4 = [v3 regions];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v23;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v23 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        id v10 = *(void **)(a1 + 32);
        if (v10)
        {
          id v11 = v9;
          id v12 = v10;
          if (v11 == v12) {
            goto LABEL_21;
          }
          long long v13 = v12;
          if (v11)
          {
            char v14 = [v11 isEqualToString:v12];

            if (v14) {
              goto LABEL_22;
            }
          }
          else
          {
          }
        }
        id v15 = *(void **)(a1 + 40);
        if (v15)
        {
          id v16 = v9;
          id v17 = v15;
          if (v16 == v17)
          {
LABEL_21:

LABEL_22:
            uint64_t v20 = 1;
            goto LABEL_24;
          }
          id v18 = v17;
          if (v16)
          {
            char v19 = [v16 isEqualToString:v17];

            if (v19) {
              goto LABEL_22;
            }
          }
          else
          {
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v22 objects:v26 count:16];
      uint64_t v20 = 0;
      if (v6) {
        continue;
      }
      break;
    }
  }
  else
  {
    uint64_t v20 = 0;
  }
LABEL_24:

  return v20;
}

@end