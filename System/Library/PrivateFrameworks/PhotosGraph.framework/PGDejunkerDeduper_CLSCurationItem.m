@interface PGDejunkerDeduper_CLSCurationItem
- (BOOL)isJunkForItem:(id)a3;
- (BOOL)item:(id)a3 isStrongRequiredWithOptions:(id)a4;
- (BOOL)item:(id)a3 isWeaklyRequiredWithOptions:(id)a4;
- (NSSet)verifiedPersonLocalIdentifiers;
- (id)bestItemInItems:(id)a3 options:(id)a4;
- (id)bestItemsInItems:(id)a3 options:(id)a4;
- (id)debugPersonStringForItem:(id)a3;
- (id)dejunkedDedupedItemIdentifiersWithItems:(id)a3 options:(id)a4 debugInfo:(id *)a5;
- (id)dejunkedDedupedItemsInItems:(id)a3 options:(id)a4 debugInfo:(id)a5 progressBlock:(id)a6;
- (id)faceprintByPersonLocalIdentifierByItemIdentifierWithItems:(id)a3;
- (id)featureWithItem:(id)a3;
- (id)itemsSortedByScoreWithItems:(id)a3 options:(id)a4;
- (id)requiredItemsInItems:(id)a3 options:(id)a4 containStronglyRequiredItems:(BOOL *)a5;
- (void)_buildCachesWithItems:(id)a3 options:(id)a4;
- (void)setVerifiedPersonLocalIdentifiers:(id)a3;
@end

@implementation PGDejunkerDeduper_CLSCurationItem

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_verifiedPersonLocalIdentifiers, 0);
  objc_storeStrong((id *)&self->_averageFaceQualityByItemIdentifier, 0);
  objc_storeStrong((id *)&self->_peopleScenesByItemIdentifier, 0);
  objc_storeStrong((id *)&self->_personLocalIdentifiersByItemIdentifier, 0);
}

- (void)setVerifiedPersonLocalIdentifiers:(id)a3
{
}

- (NSSet)verifiedPersonLocalIdentifiers
{
  return self->_verifiedPersonLocalIdentifiers;
}

- (id)requiredItemsInItems:(id)a3 options:(id)a4 containStronglyRequiredItems:(BOOL *)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v20 = [v8 identifiersOfRequiredItems];
  v10 = [v8 identifiersOfEligibleItems];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v11 = v7;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (!v12)
  {
    char v21 = 0;
    goto LABEL_17;
  }
  uint64_t v13 = v12;
  char v21 = 0;
  uint64_t v14 = *(void *)v23;
  do
  {
    for (uint64_t i = 0; i != v13; ++i)
    {
      if (*(void *)v23 != v14) {
        objc_enumerationMutation(v11);
      }
      v16 = *(void **)(*((void *)&v22 + 1) + 8 * i);
      v17 = [v16 clsIdentifier];
      if (!v10
        || ([v10 containsObject:v17] & 1) != 0
        || [v20 containsObject:v17])
      {
        if ([(PGDejunkerDeduper_CLSCurationItem *)self item:v16 isStrongRequiredWithOptions:v8])
        {
          char v21 = 1;
        }
        else if (![(PGDejunkerDeduper_CLSCurationItem *)self item:v16 isWeaklyRequiredWithOptions:v8])
        {
          goto LABEL_13;
        }
        [v9 addObject:v16];
      }
LABEL_13:
    }
    uint64_t v13 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
  }
  while (v13);
LABEL_17:

  if (a5) {
    *a5 = v21 & 1;
  }

  return v9;
}

- (BOOL)item:(id)a3 isWeaklyRequiredWithOptions:(id)a4
{
  return [a3 clsIsLoopOrBounce];
}

- (BOOL)item:(id)a3 isStrongRequiredWithOptions:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 isFavorite])
  {
    char v7 = 1;
  }
  else
  {
    id v8 = [v6 identifiersOfRequiredItems];
    id v9 = [v5 clsIdentifier];
    char v7 = [v8 containsObject:v9];
  }
  return v7;
}

- (id)itemsSortedByScoreWithItems:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 useOnlyScenesForDeduping]) {
    char v8 = 0;
  }
  else {
    char v8 = [v7 useFaceQualityForElection];
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __73__PGDejunkerDeduper_CLSCurationItem_itemsSortedByScoreWithItems_options___block_invoke;
  v11[3] = &unk_1E68E6ED0;
  char v12 = v8;
  v11[4] = self;
  id v9 = [v6 sortedArrayUsingComparator:v11];

  return v9;
}

- (id)featureWithItem:(id)a3
{
  id v4 = a3;
  id v5 = [v4 clsIdentifier];
  id v6 = [(NSDictionary *)self->_personLocalIdentifiersByItemIdentifier objectForKeyedSubscript:v5];
  if (v6)
  {
    id v7 = 0;
  }
  else
  {
    id v7 = [(NSDictionary *)self->_peopleScenesByItemIdentifier objectForKeyedSubscript:v5];
  }
  char v8 = [PGDejunkerDeduperFeature alloc];
  uint64_t v9 = [v4 isVideo];

  v10 = [(PGDejunkerDeduperFeature *)v8 initWithPersonLocalIdentifiers:v6 peopleScenes:v7 isVideo:v9];
  return v10;
}

- (id)faceprintByPersonLocalIdentifierByItemIdentifierWithItems:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v24 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id obj = v3;
  uint64_t v25 = [obj countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v25)
  {
    uint64_t v23 = *(void *)v34;
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v34 != v23) {
          objc_enumerationMutation(obj);
        }
        uint64_t v27 = v4;
        id v5 = *(void **)(*((void *)&v33 + 1) + 8 * v4);
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();
        id v7 = (void *)MEMORY[0x1E4F1CBF0];
        if (isKindOfClass)
        {
          id v7 = [v5 faceInfos];
        }
        v26 = v5;
        id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        long long v29 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        id v9 = v7;
        uint64_t v10 = [v9 countByEnumeratingWithState:&v29 objects:v37 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v30;
          do
          {
            for (uint64_t i = 0; i != v11; ++i)
            {
              if (*(void *)v30 != v12) {
                objc_enumerationMutation(v9);
              }
              uint64_t v14 = *(void **)(*((void *)&v29 + 1) + 8 * i);
              v15 = [v14 objectForKeyedSubscript:@"faceprint"];
              if (v15)
              {
                id v16 = objc_alloc(MEMORY[0x1E4F45800]);
                id v28 = 0;
                v17 = (void *)[v16 initWithState:v15 error:&v28];
                id v18 = v28;
                if (v17)
                {
                  v19 = [v14 objectForKeyedSubscript:@"personLocalIdentifier"];
                  [v8 setObject:v17 forKeyedSubscript:v19];
                }
              }
            }
            uint64_t v11 = [v9 countByEnumeratingWithState:&v29 objects:v37 count:16];
          }
          while (v11);
        }

        v20 = [v26 clsIdentifier];
        [v24 setObject:v8 forKeyedSubscript:v20];

        uint64_t v4 = v27 + 1;
      }
      while (v27 + 1 != v25);
      uint64_t v25 = [obj countByEnumeratingWithState:&v33 objects:v38 count:16];
    }
    while (v25);
  }

  return v24;
}

- (id)debugPersonStringForItem:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = [(PGDejunkerDeduper_CLSCurationItem *)self featureWithItem:a3];
  uint64_t v4 = [v3 personLocalIdentifiers];
  id v5 = [v3 peopleScenes];
  if ([v4 count])
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v7 = v4;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "substringToIndex:", 8, (void)v16);
          [v6 addObject:v12];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v9);
    }

    [v6 sortUsingSelector:sel_compare_];
    uint64_t v13 = [v6 componentsJoinedByString:@", "];
    goto LABEL_12;
  }
  if ([v5 count])
  {
    id v6 = [v5 allObjects];
    uint64_t v14 = [v6 sortedArrayUsingSelector:sel_compare_];
    uint64_t v13 = [v14 componentsJoinedByString:@", "];

LABEL_12:
    goto LABEL_13;
  }
  uint64_t v13 = @"nobody";
LABEL_13:

  return v13;
}

- (BOOL)isJunkForItem:(id)a3
{
  [a3 clsContentScore];
  return v3 == *MEMORY[0x1E4F8E750];
}

- (id)bestItemsInItems:(id)a3 options:(id)a4
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  char v45 = 0;
  uint64_t v8 = [(PGDejunkerDeduper_CLSCurationItem *)self requiredItemsInItems:v6 options:v7 containStronglyRequiredItems:&v45];
  uint64_t v9 = v8;
  if (v45)
  {
    id v10 = v8;
    goto LABEL_33;
  }
  if ([v7 useOnlyScenesForDeduping]) {
    int v11 = 0;
  }
  else {
    int v11 = [v7 useFaceQualityForElection];
  }
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v12 = v6;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v41 objects:v46 count:16];
  if (!v13)
  {

    v15 = 0;
    goto LABEL_31;
  }
  uint64_t v14 = v13;
  id v38 = v6;
  uint64_t v39 = self;
  long long v36 = v9;
  id v37 = v7;
  v15 = 0;
  int v16 = 0;
  uint64_t v17 = *(void *)v42;
  double v18 = -1.79769313e308;
  double v19 = -1.79769313e308;
  id obj = v12;
  do
  {
    for (uint64_t i = 0; i != v14; ++i)
    {
      if (*(void *)v42 != v17) {
        objc_enumerationMutation(obj);
      }
      uint64_t v21 = *(void **)(*((void *)&v41 + 1) + 8 * i);
      int v22 = [v21 isFavorite];
      [v21 clsContentScore];
      double v24 = v23;
      if (v11
        && (averageFaceQualityByItemIdentifier = v39->_averageFaceQualityByItemIdentifier,
            [v21 clsIdentifier],
            v26 = objc_claimAutoreleasedReturnValue(),
            [(NSDictionary *)averageFaceQualityByItemIdentifier objectForKeyedSubscript:v26], uint64_t v27 = objc_claimAutoreleasedReturnValue(), v26, v27))
      {
        [v27 doubleValue];
        double v29 = v28;
        if (!v15) {
          goto LABEL_23;
        }
      }
      else
      {
        [v21 clsAestheticScore];
        double v29 = v30;
        uint64_t v27 = 0;
        if (!v15) {
          goto LABEL_23;
        }
      }
      int v31 = v22 & (v16 ^ 1);
      if (v31 & 1) != 0 || ((v16 ^ v22))
      {
        if (!v31) {
          goto LABEL_24;
        }
LABEL_23:
        id v33 = v21;

        v15 = v33;
        int v16 = v22;
        double v18 = v24;
        double v19 = v29;
        goto LABEL_24;
      }
      BOOL v32 = v29 > v19;
      if (v24 != v18) {
        BOOL v32 = v24 > v18;
      }
      if (v32) {
        goto LABEL_23;
      }
LABEL_24:
    }
    uint64_t v14 = [obj countByEnumeratingWithState:&v41 objects:v46 count:16];
  }
  while (v14);

  if (v15)
  {
    uint64_t v9 = v36;
    id v7 = v37;
    id v6 = v38;
    if (![v36 containsObject:v15])
    {
      id v34 = [v36 arrayByAddingObject:v15];
      goto LABEL_32;
    }
  }
  else
  {
    id v7 = v37;
    id v6 = v38;
    uint64_t v9 = v36;
  }
LABEL_31:
  id v34 = v9;
LABEL_32:
  id v10 = v34;

LABEL_33:
  return v10;
}

- (id)bestItemInItems:(id)a3 options:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v7 useOnlyScenesForDeduping]) {
    int v8 = 0;
  }
  else {
    int v8 = [v7 useFaceQualityForElection];
  }
  double v29 = v7;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (!v10)
  {
    id v12 = 0;
    goto LABEL_26;
  }
  uint64_t v11 = v10;
  id v12 = 0;
  uint64_t v13 = *(void *)v31;
  double v14 = -1.79769313e308;
  double v15 = -1.79769313e308;
  do
  {
    uint64_t v16 = 0;
    double v17 = v15;
    do
    {
      if (*(void *)v31 != v13) {
        objc_enumerationMutation(v9);
      }
      double v18 = *(void **)(*((void *)&v30 + 1) + 8 * v16);
      [v18 clsContentScore];
      double v20 = v19;
      if (v8
        && (averageFaceQualityByItemIdentifier = self->_averageFaceQualityByItemIdentifier,
            [v18 clsIdentifier],
            int v22 = objc_claimAutoreleasedReturnValue(),
            [(NSDictionary *)averageFaceQualityByItemIdentifier objectForKeyedSubscript:v22], double v23 = objc_claimAutoreleasedReturnValue(), v22, v23))
      {
        [v23 doubleValue];
        double v15 = v24;
        if (!v12) {
          goto LABEL_21;
        }
      }
      else
      {
        [v18 clsAestheticScore];
        double v15 = v25;
        double v23 = 0;
        if (!v12) {
          goto LABEL_21;
        }
      }
      if (v20 <= v14 && (v20 != v14 || v15 <= v17))
      {
        double v15 = v17;
        goto LABEL_22;
      }
LABEL_21:
      id v27 = v18;

      double v14 = v20;
      id v12 = v27;
      double v17 = v15;
LABEL_22:

      ++v16;
    }
    while (v11 != v16);
    uint64_t v11 = [v9 countByEnumeratingWithState:&v30 objects:v34 count:16];
  }
  while (v11);
LABEL_26:

  return v12;
}

- (void)_buildCachesWithItems:(id)a3 options:(id)a4
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  int v8 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v44 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v9 = [MEMORY[0x1E4F1CAD0] setWithObject:@"#people#"];
  if ([v6 useOnlyScenesForDeduping]) {
    int v10 = 0;
  }
  else {
    int v10 = [v6 useAllPersonsForDeduping];
  }
  long long v65 = 0u;
  long long v66 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  id v11 = v5;
  uint64_t v54 = [v11 countByEnumeratingWithState:&v63 objects:v68 count:16];
  if (v54)
  {
    uint64_t v12 = *(void *)v64;
    v50 = v9;
    id v51 = v6;
    v48 = v7;
    v49 = v8;
    id v47 = v11;
    int v46 = v10;
    uint64_t v45 = *(void *)v64;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v64 != v12) {
          objc_enumerationMutation(v11);
        }
        double v14 = *(void **)(*((void *)&v63 + 1) + 8 * v13);
        [v14 clsIdentifier];
        v56 = uint64_t v55 = v13;
        if (v10)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            double v15 = v8;
            uint64_t v16 = v9;
            id v17 = v14;
            double v18 = [v17 faceInfos];
            if (![v18 count])
            {
              id v58 = 0;
              goto LABEL_45;
            }
            id v53 = v17;
            id v58 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
            long long v59 = 0u;
            long long v60 = 0u;
            long long v61 = 0u;
            long long v62 = 0u;
            v52 = v18;
            id v19 = v18;
            uint64_t v20 = [v19 countByEnumeratingWithState:&v59 objects:v67 count:16];
            uint64_t v21 = v14;
            if (!v20)
            {
              unint64_t v23 = 0;
              double v25 = 0.0;
              goto LABEL_38;
            }
            uint64_t v22 = v20;
            unint64_t v23 = 0;
            uint64_t v24 = *(void *)v60;
            double v25 = 0.0;
            while (1)
            {
              for (uint64_t i = 0; i != v22; ++i)
              {
                if (*(void *)v60 != v24) {
                  objc_enumerationMutation(v19);
                }
                id v27 = *(void **)(*((void *)&v59 + 1) + 8 * i);
                double v28 = [v27 objectForKeyedSubscript:@"personLocalIdentifier"];
                if (v28)
                {
                  double v29 = [v27 objectForKeyedSubscript:@"size"];
                  [v29 doubleValue];
                  if (v30 >= 0.05)
                  {
                  }
                  else
                  {
                    BOOL v31 = [(NSSet *)self->_verifiedPersonLocalIdentifiers containsObject:v28];

                    if (!v31)
                    {
LABEL_27:
                      double v14 = v21;
                      goto LABEL_28;
                    }
                  }
                  [v58 addObject:v28];
                  long long v32 = [v27 objectForKeyedSubscript:@"quality"];
                  [v32 doubleValue];
                  double v34 = v33;

                  if (v34 >= 0.0) {
                    ++v23;
                  }
                  double v35 = -0.0;
                  if (v34 >= 0.0) {
                    double v35 = v34;
                  }
                  double v25 = v25 + v35;
                  goto LABEL_27;
                }
LABEL_28:
              }
              uint64_t v22 = [v19 countByEnumeratingWithState:&v59 objects:v67 count:16];
              if (!v22)
              {
LABEL_38:

                if ([v58 count])
                {
                  double v15 = v49;
                  uint64_t v16 = v50;
                  id v11 = v47;
                  id v7 = v48;
                  uint64_t v12 = v45;
                  if (v23) {
                    double v37 = v25 / (double)v23;
                  }
                  else {
                    double v37 = 0.0;
                  }
                  int v10 = v46;
                  id v38 = [NSNumber numberWithDouble:v37];
                  [(NSDictionary *)v44 setObject:v38 forKeyedSubscript:v56];

                  double v14 = v21;
                }
                else
                {
                  double v15 = v49;
                  uint64_t v16 = v50;
                  id v11 = v47;
                  id v7 = v48;
                  int v10 = v46;
                  uint64_t v12 = v45;
                }
                double v18 = v52;
                id v17 = v53;
LABEL_45:

                id v9 = v16;
                int v8 = v15;
                id v6 = v51;
LABEL_46:

                long long v36 = v58;
                goto LABEL_47;
              }
            }
          }
        }
        if (([v6 useOnlyScenesForDeduping] & 1) == 0)
        {
          id v17 = [v14 clsPersonLocalIdentifiers];
          if ([v17 count])
          {
            id v58 = [MEMORY[0x1E4F1CAD0] setWithArray:v17];
          }
          else
          {
            id v58 = 0;
          }
          goto LABEL_46;
        }
        long long v36 = 0;
LABEL_47:
        if ([v36 count]) {
          [(NSDictionary *)v7 setObject:v36 forKeyedSubscript:v56];
        }
        if ([v14 clsIsInhabited]) {
          [(NSDictionary *)v8 setObject:v9 forKeyedSubscript:v56];
        }

        uint64_t v13 = v55 + 1;
      }
      while (v55 + 1 != v54);
      uint64_t v54 = [v11 countByEnumeratingWithState:&v63 objects:v68 count:16];
    }
    while (v54);
  }

  personLocalIdentifiersByItemIdentifier = self->_personLocalIdentifiersByItemIdentifier;
  self->_personLocalIdentifiersByItemIdentifier = v7;
  v40 = v7;

  peopleScenesByItemIdentifier = self->_peopleScenesByItemIdentifier;
  self->_peopleScenesByItemIdentifier = v8;
  long long v42 = v8;

  averageFaceQualityByItemIdentifier = self->_averageFaceQualityByItemIdentifier;
  self->_averageFaceQualityByItemIdentifier = v44;
}

- (id)dejunkedDedupedItemIdentifiersWithItems:(id)a3 options:(id)a4 debugInfo:(id *)a5
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v10 = objc_alloc_init(MEMORY[0x1E4F8E778]);
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __95__PGDejunkerDeduper_CLSCurationItem_dejunkedDedupedItemIdentifiersWithItems_options_debugInfo___block_invoke;
  v31[3] = &unk_1E68EBF78;
  id v24 = v10;
  id v32 = v24;
  id v11 = v8;
  id v33 = v11;
  id v12 = v9;
  id v34 = v12;
  v26 = v7;
  [v7 enumerateKeysAndObjectsUsingBlock:v31];
  uint64_t v13 = [[PGDejunkerDeduperOptions alloc] initWithDictionaryRepresentation:v11];
  double v14 = (void *)[objc_alloc(MEMORY[0x1E4F76C78]) initWithItems:v12];
  double v15 = [(PGDejunkerDeduper_CLSCurationItem *)self dejunkedDedupedItemsInItems:v12 options:v13 debugInfo:v14 progressBlock:0];
  uint64_t v16 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v15, "count"));
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v17 = v15;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v27 objects:v35 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v28 != v20) {
          objc_enumerationMutation(v17);
        }
        uint64_t v22 = [*(id *)(*((void *)&v27 + 1) + 8 * i) clsIdentifier];
        [v16 addObject:v22];
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v27 objects:v35 count:16];
    }
    while (v19);
  }

  if (a5)
  {
    *a5 = [v14 dictionaryRepresentationWithAppendExtraItemInfoBlock:0];
  }

  return v16;
}

- (id)dejunkedDedupedItemsInItems:(id)a3 options:(id)a4 debugInfo:(id)a5 progressBlock:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  [(PGDejunkerDeduper_CLSCurationItem *)self _buildCachesWithItems:v13 options:v12];
  v16.receiver = self;
  v16.super_class = (Class)PGDejunkerDeduper_CLSCurationItem;
  double v14 = [(PGDejunkerDeduper *)&v16 dejunkedDedupedItemsInItems:v13 options:v12 debugInfo:v11 progressBlock:v10];

  return v14;
}

@end