@interface PLFrequentLocationProcessor
+ (double)_computeWeekendFrequencyForMoments:(id)a3;
+ (id)_clustersFromLocationsOfInterest:(id)a3 forItems:(id)a4 remainingItemsToCluster:(id *)a5 progressBlock:(id)a6;
+ (id)_coarseClustersForItems:(id)a3 progressBlock:(id)a4;
+ (id)_finalClustersFromCoarseClusters:(id)a3 progressBlock:(id)a4;
+ (id)processFrequentLocationsWithItemSubset:(id)a3 locationsOfInterest:(id)a4 progressBlock:(id)a5;
+ (id)processFrequentLocationsWithItems:(id)a3 locationsOfInterest:(id)a4 progressBlock:(id)a5;
+ (id)processFrequentLocationsWithSortedMoments:(id)a3 locationsOfInterest:(id)a4 progressBlock:(id)a5;
+ (id)sortDescriptorsForLocationsOfInterest;
@end

@implementation PLFrequentLocationProcessor

+ (id)sortDescriptorsForLocationsOfInterest
{
  v7[3] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"type" ascending:1 comparator:&__block_literal_global_29];
  v3 = objc_msgSend(MEMORY[0x1E4F29008], "sortDescriptorWithKey:ascending:comparator:", @"self", 1, &__block_literal_global_32, v2);
  v7[1] = v3;
  v4 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"identifier" ascending:1];
  v7[2] = v4;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:3];

  return v5;
}

uint64_t __68__PLFrequentLocationProcessor_sortDescriptorsForLocationsOfInterest__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  v6 = [v4 mapItemLocation];
  v7 = [v6 location];
  v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    v10 = [v4 routineLocation];
    id v9 = [v10 location];
  }
  v11 = [v5 mapItemLocation];
  v12 = [v11 location];
  v13 = v12;
  if (v12)
  {
    id v14 = v12;
  }
  else
  {
    v15 = [v5 routineLocation];
    id v14 = [v15 location];
  }
  v16 = NSNumber;
  [v9 coordinate];
  v17 = objc_msgSend(v16, "numberWithDouble:");
  uint64_t v18 = [v17 hash];
  v19 = NSNumber;
  [v9 coordinate];
  v21 = [v19 numberWithDouble:v20];
  uint64_t v22 = [v21 hash] ^ v18;

  v23 = NSNumber;
  [v14 coordinate];
  v24 = objc_msgSend(v23, "numberWithDouble:");
  uint64_t v25 = [v24 hash];
  v26 = NSNumber;
  [v14 coordinate];
  v28 = [v26 numberWithDouble:v27];
  uint64_t v29 = [v28 hash] ^ v25;

  v30 = [NSNumber numberWithUnsignedInteger:v22];
  v31 = [NSNumber numberWithUnsignedInteger:v29];
  uint64_t v32 = [v30 compare:v31];

  return v32;
}

uint64_t __68__PLFrequentLocationProcessor_sortDescriptorsForLocationsOfInterest__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = (int)[a2 intValue];
  int v6 = [v4 intValue];

  switch(v5)
  {
    case -1:
      unint64_t v7 = v6 + 1;
      if (v7 < 3)
      {
        v8 = &unk_19BA9ED28;
        return v8[v7];
      }
      break;
    case 1:
      unint64_t v7 = v6 + 1;
      if (v7 < 3)
      {
        v8 = &unk_19BA9ED10;
        return v8[v7];
      }
      break;
    case 0:
      unint64_t v7 = v6 + 1;
      if (v7 < 3)
      {
        v8 = &unk_19BA9ECF8;
        return v8[v7];
      }
      break;
  }
  return 0;
}

+ (id)_coarseClustersForItems:(id)a3 progressBlock:(id)a4
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v46 = a4;
  int v6 = [MEMORY[0x1E4F1CA48] array];
  unint64_t v7 = [MEMORY[0x1E4F1CA60] dictionary];
  v8 = [MEMORY[0x1E4F1CA70] orderedSet];
  v70[0] = MEMORY[0x1E4F143A8];
  v70[1] = 3221225472;
  v70[2] = __69__PLFrequentLocationProcessor__coarseClustersForItems_progressBlock___block_invoke;
  v70[3] = &unk_1E5871280;
  id v9 = v8;
  id v71 = v9;
  id v59 = v7;
  id v72 = v59;
  id v45 = v6;
  id v73 = v45;
  v10 = (void (**)(void))MEMORY[0x19F38D650](v70);
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  id obj = v5;
  uint64_t v11 = [obj countByEnumeratingWithState:&v66 objects:v76 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v67;
    v48 = v10;
    id v49 = v9;
    uint64_t v47 = *(void *)v67;
    do
    {
      uint64_t v14 = 0;
      uint64_t v50 = v12;
      do
      {
        if (*(void *)v67 != v13) {
          objc_enumerationMutation(obj);
        }
        uint64_t v55 = v14;
        v15 = *(void **)(*((void *)&v66 + 1) + 8 * v14);
        v16 = objc_msgSend(v15, "pl_startDate");
        v17 = objc_msgSend(v15, "pl_endDate");
        v54 = v16;
        v53 = [v16 dateByAddingTimeInterval:-7776000.0];
        v10[2](v10);
        if (![v59 count]) {
          goto LABEL_25;
        }
        uint64_t v64 = 0;
        uint64_t v65 = 0;
        v52 = v15;
        objc_msgSend(v15, "pl_coordinate");
        uint64_t v64 = v18;
        uint64_t v65 = v19;
        long long v60 = 0u;
        long long v61 = 0u;
        long long v62 = 0u;
        long long v63 = 0u;
        id v20 = v9;
        uint64_t v21 = [v20 countByEnumeratingWithState:&v60 objects:v75 count:16];
        if (!v21)
        {

LABEL_25:
          v37 = [PLFrequentLocation alloc];
          v38 = v15;
          v39 = v37;
          v74 = v38;
          v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v74 count:1];
          v41 = [(PLFrequentLocation *)v39 initWithSortedMoments:v40];

          [v59 setObject:v41 forKeyedSubscript:v17];
          [v9 addObject:v17];

          goto LABEL_26;
        }
        uint64_t v22 = v21;
        unint64_t v23 = 0;
        v24 = 0;
        uint64_t v25 = 0;
        id v57 = v20;
        uint64_t v58 = *(void *)v61;
        char v56 = 1;
        do
        {
          for (uint64_t i = 0; i != v22; ++i)
          {
            double v27 = v17;
            if (*(void *)v61 != v58) {
              objc_enumerationMutation(v57);
            }
            v28 = *(void **)(*((void *)&v60 + 1) + 8 * i);
            uint64_t v29 = [v59 objectForKeyedSubscript:v28];
            [v29 coordinate];
            CLLocationCoordinate2DGetDistanceFrom();
            double v31 = v30;
            uint64_t v32 = [v29 sortedMoments];
            unint64_t v33 = [v32 count];

            if (v31 < 5000.0 && v33 > v23)
            {
              id v35 = v29;

              id v36 = v28;
              char v56 = 0;
              unint64_t v23 = v33;
              v24 = v35;
              uint64_t v25 = v36;
            }
            v17 = v27;
          }
          uint64_t v22 = [v57 countByEnumeratingWithState:&v60 objects:v75 count:16];
        }
        while (v22);

        uint64_t v13 = v47;
        v10 = v48;
        v15 = v52;
        if (v24)
        {
          [v24 addMomentToSortedMoments:v52];
          [v59 removeObjectForKey:v25];
          [v59 setObject:v24 forKeyedSubscript:v27];
          [v57 removeObject:v25];
          [v57 addObject:v27];
        }

        id v9 = v49;
        uint64_t v12 = v50;
        if (v56) {
          goto LABEL_25;
        }
LABEL_26:

        uint64_t v14 = v55 + 1;
      }
      while (v55 + 1 != v12);
      uint64_t v12 = [obj countByEnumeratingWithState:&v66 objects:v76 count:16];
    }
    while (v12);
  }

  v42 = [MEMORY[0x1E4F1C9C8] distantFuture];
  ((void (*)(void (**)(void), void *))v10[2])(v10, v42);

  id v43 = v45;
  return v43;
}

void __69__PLFrequentLocationProcessor__coarseClustersForItems_progressBlock___block_invoke(id *a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([a1[4] count])
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v5 = a1[4];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v15;
LABEL_4:
      uint64_t v9 = 0;
      while (1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v14 + 1) + 8 * v9);
        if (objc_msgSend(v10, "compare:", v3, (void)v14) == 1) {
          break;
        }
        [v4 addObject:v10];
        uint64_t v11 = [a1[5] objectForKeyedSubscript:v10];
        uint64_t v12 = [v11 sortedMoments];
        unint64_t v13 = [v12 count];

        if (v13 >= 7) {
          [a1[6] addObject:v11];
        }

        if (v7 == ++v9)
        {
          uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
          if (v7) {
            goto LABEL_4;
          }
          break;
        }
      }
    }

    if ([v4 count])
    {
      [a1[4] removeObjectsInArray:v4];
      [a1[5] removeObjectsForKeys:v4];
    }
  }
}

+ (id)_finalClustersFromCoarseClusters:(id)a3 progressBlock:(id)a4
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v8 = [(PLDataClustering *)[PLDBSCANClustering alloc] initWithDistanceBlock:&__block_literal_global_20];
  [(PLDataDensityClustering *)v8 setMaximumDistance:250.0];
  [(PLDataDensityClustering *)v8 setMinimumNumberOfObjects:7];
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id obj = v5;
  uint64_t v33 = [obj countByEnumeratingWithState:&v45 objects:v50 count:16];
  if (v33)
  {
    uint64_t v32 = *(void *)v46;
    v38 = v8;
    id v39 = v6;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v46 != v32) {
          objc_enumerationMutation(obj);
        }
        uint64_t v36 = v9;
        v10 = *(void **)(*((void *)&v45 + 1) + 8 * v9);
        context = (void *)MEMORY[0x19F38D3B0]();
        uint64_t v11 = [v10 sortedMoments];
        unint64_t v40 = [v11 count];
        v34 = v11;
        if (v40 < 0x801)
        {
          id v20 = [(PLDBSCANClustering *)v8 performWithDataset:v11 progressBlock:v6];
        }
        else
        {
          v37 = [MEMORY[0x1E4F1CA48] array];
          unint64_t v12 = 0;
          unint64_t v13 = vcvtpd_u64_f64((double)v40 / ceil((double)v40 * 0.00048828125));
          unint64_t v14 = v40;
          do
          {
            long long v15 = (void *)MEMORY[0x19F38D3B0]();
            unint64_t v16 = v14 - v13;
            if (v14 >= v13) {
              unint64_t v17 = v13;
            }
            else {
              unint64_t v17 = v14;
            }
            uint64_t v18 = objc_msgSend(v11, "subarrayWithRange:", v12, v17);
            uint64_t v19 = [(PLDBSCANClustering *)v8 performWithDataset:v18 progressBlock:v39];
            [v37 addObjectsFromArray:v19];

            uint64_t v8 = v38;
            v12 += v13;
            unint64_t v14 = v16;
          }
          while (v12 < v40);
          id v20 = v37;
        }
        long long v43 = 0u;
        long long v44 = 0u;
        long long v41 = 0u;
        long long v42 = 0u;
        id v21 = v20;
        uint64_t v22 = [v21 countByEnumeratingWithState:&v41 objects:v49 count:16];
        if (v22)
        {
          uint64_t v23 = v22;
          uint64_t v24 = *(void *)v42;
          do
          {
            for (uint64_t i = 0; i != v23; ++i)
            {
              if (*(void *)v42 != v24) {
                objc_enumerationMutation(v21);
              }
              v26 = [*(id *)(*((void *)&v41 + 1) + 8 * i) objects];
              double v27 = +[PLMediaMiningUtilities sortDescriptorsForSortingItemsByTime];
              v28 = [v26 sortedArrayUsingDescriptors:v27];

              uint64_t v29 = [[PLFrequentLocation alloc] initWithSortedMoments:v28];
              [v7 addObject:v29];
            }
            uint64_t v23 = [v21 countByEnumeratingWithState:&v41 objects:v49 count:16];
          }
          while (v23);
        }

        uint64_t v9 = v36 + 1;
        uint64_t v8 = v38;
        id v6 = v39;
      }
      while (v36 + 1 != v33);
      uint64_t v33 = [obj countByEnumeratingWithState:&v45 objects:v50 count:16];
    }
    while (v33);
  }

  return v7;
}

uint64_t __78__PLFrequentLocationProcessor__finalClustersFromCoarseClusters_progressBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  objc_msgSend(a2, "pl_coordinate");
  objc_msgSend(v4, "pl_coordinate");

  return CLLocationCoordinate2DGetDistanceFrom();
}

+ (id)_clustersFromLocationsOfInterest:(id)a3 forItems:(id)a4 remainingItemsToCluster:(id *)a5 progressBlock:(id)a6
{
  long long v45 = a5;
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v46 = a6;
  uint64_t v49 = MEMORY[0x19F38D650]();
  id v47 = [MEMORY[0x1E4F1CA48] array];
  v10 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
  long long v67 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  id v11 = v8;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v67 objects:v76 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v68;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v68 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v67 + 1) + 8 * i);
        unint64_t v17 = objc_msgSend(MEMORY[0x1E4F1CA48], "array", v45);
        [v10 setObject:v17 forKey:v16];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v67 objects:v76 count:16];
    }
    while (v13);
  }

  unint64_t v18 = [v9 count];
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  id obj = v9;
  uint64_t v19 = (void (**)(void, void, double))v49;
  uint64_t v51 = [obj countByEnumeratingWithState:&v63 objects:v75 count:16];
  if (v51)
  {
    double v20 = 1.0 / (double)v18;
    uint64_t v50 = *(void *)v64;
    double v21 = 0.0;
    while (2)
    {
      for (uint64_t j = 0; j != v51; ++j)
      {
        if (*(void *)v64 != v50) {
          objc_enumerationMutation(obj);
        }
        uint64_t v23 = *(void **)(*((void *)&v63 + 1) + 8 * j);
        uint64_t v24 = (void *)MEMORY[0x19F38D3B0]();
        if (v19)
        {
          char v62 = 0;
          ((void (**)(void, char *, double))v19)[2](v19, &v62, v21);
          if (v62)
          {
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67109120;
              int v74 = 265;
              _os_log_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d", buf, 8u);
            }
            long long v43 = obj;

            v34 = (void *)MEMORY[0x1E4F1CBF0];
            long long v42 = v46;
            goto LABEL_44;
          }
        }
        uint64_t v25 = objc_msgSend(v23, "pl_location", v45);
        if (v25)
        {
          v52 = v23;
          v53 = v24;
          long long v60 = 0u;
          long long v61 = 0u;
          long long v58 = 0u;
          long long v59 = 0u;
          id v26 = v11;
          uint64_t v27 = [v26 countByEnumeratingWithState:&v58 objects:v72 count:16];
          if (v27)
          {
            uint64_t v28 = v27;
            uint64_t v29 = *(void *)v59;
            while (2)
            {
              for (uint64_t k = 0; k != v28; ++k)
              {
                if (*(void *)v59 != v29) {
                  objc_enumerationMutation(v26);
                }
                double v31 = *(void **)(*((void *)&v58 + 1) + 8 * k);
                [v31 distanceFromLocation:v25];
                if (v32 <= 500.0)
                {
                  uint64_t v33 = [v10 objectForKey:v31];
                  [v33 addObject:v52];

                  goto LABEL_26;
                }
              }
              uint64_t v28 = [v26 countByEnumeratingWithState:&v58 objects:v72 count:16];
              if (v28) {
                continue;
              }
              break;
            }
          }

          [v47 addObject:v52];
LABEL_26:
          uint64_t v19 = (void (**)(void, void, double))v49;
          uint64_t v24 = v53;
        }
        double v21 = v20 + v21;
      }
      uint64_t v51 = [obj countByEnumeratingWithState:&v63 objects:v75 count:16];
      if (v51) {
        continue;
      }
      break;
    }
  }

  v34 = [MEMORY[0x1E4F1CA48] array];
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  id v35 = v11;
  uint64_t v36 = [v35 countByEnumeratingWithState:&v54 objects:v71 count:16];
  if (v36)
  {
    uint64_t v37 = v36;
    uint64_t v38 = *(void *)v55;
    do
    {
      for (uint64_t m = 0; m != v37; ++m)
      {
        if (*(void *)v55 != v38) {
          objc_enumerationMutation(v35);
        }
        unint64_t v40 = objc_msgSend(v10, "objectForKey:", *(void *)(*((void *)&v54 + 1) + 8 * m), v45);
        if ([v40 count])
        {
          long long v41 = [[PLFrequentLocation alloc] initWithSortedMoments:v40];
          [v34 addObject:v41];
        }
      }
      uint64_t v37 = [v35 countByEnumeratingWithState:&v54 objects:v71 count:16];
    }
    while (v37);
  }

  if (v45) {
    *long long v45 = v47;
  }
  long long v42 = v46;
  uint64_t v19 = (void (**)(void, void, double))v49;
  long long v43 = obj;
LABEL_44:

  return v34;
}

+ (double)_computeWeekendFrequencyForMoments:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    unint64_t v8 = 0;
    uint64_t v9 = *(void *)v18;
    while (1)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v5);
        }
        id v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v12 = objc_msgSend(v11, "pl_startDate", (void)v17);
        if ([v4 isDateInWeekend:v12])
        {
        }
        else
        {
          uint64_t v13 = objc_msgSend(v11, "pl_endDate");
          int v14 = [v4 isDateInWeekend:v13];

          if (!v14) {
            continue;
          }
        }
        ++v8;
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (!v7) {
        goto LABEL_14;
      }
    }
  }
  unint64_t v8 = 0;
LABEL_14:

  unint64_t v15 = [v5 count];
  return (double)v8 / (double)v15;
}

+ (id)processFrequentLocationsWithItemSubset:(id)a3 locationsOfInterest:(id)a4 progressBlock:(id)a5
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)MEMORY[0x19F38D650]();
  uint64_t v35 = 0;
  uint64_t v36 = &v35;
  uint64_t v37 = 0x2020000000;
  char v38 = 0;
  id v34 = 0;
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __104__PLFrequentLocationProcessor_processFrequentLocationsWithItemSubset_locationsOfInterest_progressBlock___block_invoke;
  v31[3] = &unk_1E5871238;
  id v12 = v11;
  id v32 = v12;
  uint64_t v33 = &v35;
  uint64_t v13 = [a1 _clustersFromLocationsOfInterest:v9 forItems:v8 remainingItemsToCluster:&v34 progressBlock:v31];
  id v14 = v34;
  if (!*((unsigned char *)v36 + 24))
  {
    uint64_t v16 = [MEMORY[0x1E4F1CA48] arrayWithArray:v13];
    if ([v14 count])
    {
      uint64_t v22 = v16;
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __104__PLFrequentLocationProcessor_processFrequentLocationsWithItemSubset_locationsOfInterest_progressBlock___block_invoke_10;
      v28[3] = &unk_1E5871238;
      id v17 = v12;
      id v29 = v17;
      double v30 = &v35;
      uint64_t v23 = [a1 _coarseClustersForItems:v14 progressBlock:v28];
      if (*((unsigned char *)v36 + 24))
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          int buf = 67109120;
          int v40 = 207;
          _os_log_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d", (uint8_t *)&buf, 8u);
        }

        uint64_t v16 = v22;
        goto LABEL_19;
      }
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __104__PLFrequentLocationProcessor_processFrequentLocationsWithItemSubset_locationsOfInterest_progressBlock___block_invoke_11;
      v25[3] = &unk_1E5871238;
      id v26 = v17;
      uint64_t v27 = &v35;
      [a1 _finalClustersFromCoarseClusters:v23 progressBlock:v25];
      long long v18 = v16 = v22;
      int v19 = *((unsigned __int8 *)v36 + 24);
      if (*((unsigned char *)v36 + 24))
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          int buf = 67109120;
          int v40 = 212;
          _os_log_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d", (uint8_t *)&buf, 8u);
        }
      }
      else
      {
        [v22 addObjectsFromArray:v18];
      }

      if (v19) {
        goto LABEL_19;
      }
    }
    objc_msgSend(v16, "sortUsingComparator:", &__block_literal_global_14, v22);
    if (!v12
      || (char v24 = 0,
          (*((void (**)(id, char *, double))v12 + 2))(v12, &v24, 1.0),
          char v20 = *((unsigned char *)v36 + 24) | v24,
          (*((unsigned char *)v36 + 24) = v20) == 0))
    {
      id v15 = v16;
      goto LABEL_21;
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      int buf = 67109120;
      int v40 = 230;
      _os_log_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d", (uint8_t *)&buf, 8u);
    }
LABEL_19:
    id v15 = (id)MEMORY[0x1E4F1CBF0];
LABEL_21:

    goto LABEL_22;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    int buf = 67109120;
    int v40 = 196;
    _os_log_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d", (uint8_t *)&buf, 8u);
  }
  id v15 = (id)MEMORY[0x1E4F1CBF0];
LABEL_22:

  _Block_object_dispose(&v35, 8);
  return v15;
}

uint64_t __104__PLFrequentLocationProcessor_processFrequentLocationsWithItemSubset_locationsOfInterest_progressBlock___block_invoke(uint64_t a1, unsigned char *a2, double a3)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    char v6 = 0;
    uint64_t result = (*(uint64_t (**)(uint64_t, char *, double))(result + 16))(result, &v6, a3 * 0.25);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) |= v6;
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
      *a2 = 1;
    }
  }
  return result;
}

uint64_t __104__PLFrequentLocationProcessor_processFrequentLocationsWithItemSubset_locationsOfInterest_progressBlock___block_invoke_10(uint64_t a1, unsigned char *a2, double a3)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    char v6 = 0;
    uint64_t result = (*(uint64_t (**)(uint64_t, char *, double))(result + 16))(result, &v6, a3 * 0.25 + 0.25);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) |= v6;
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
      *a2 = 1;
    }
  }
  return result;
}

uint64_t __104__PLFrequentLocationProcessor_processFrequentLocationsWithItemSubset_locationsOfInterest_progressBlock___block_invoke_11(uint64_t a1, unsigned char *a2, double a3)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    char v6 = 0;
    uint64_t result = (*(uint64_t (**)(uint64_t, char *, double))(result + 16))(result, &v6, a3 * 0.25 + 0.5);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) |= v6;
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
      *a2 = 1;
    }
  }
  return result;
}

uint64_t __104__PLFrequentLocationProcessor_processFrequentLocationsWithItemSubset_locationsOfInterest_progressBlock___block_invoke_12(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  char v6 = NSNumber;
  uint64_t v7 = [v4 sortedMoments];
  id v8 = objc_msgSend(v6, "numberWithUnsignedInteger:", objc_msgSend(v7, "count"));

  id v9 = NSNumber;
  id v10 = [v5 sortedMoments];
  id v11 = objc_msgSend(v9, "numberWithUnsignedInteger:", objc_msgSend(v10, "count"));

  uint64_t v12 = [v11 compare:v8];
  if (!v12)
  {
    uint64_t v13 = [v5 dateInterval];
    id v14 = [v4 dateInterval];
    uint64_t v12 = [v13 compare:v14];
  }
  return v12;
}

+ (id)processFrequentLocationsWithSortedMoments:(id)a3 locationsOfInterest:(id)a4 progressBlock:(id)a5
{
  uint64_t v140 = *MEMORY[0x1E4F143B8];
  id v88 = a3;
  id v85 = a4;
  id v78 = a5;
  uint64_t v7 = PLBackendGetLog();
  os_signpost_id_t v8 = os_signpost_id_generate(v7);
  id v9 = v7;
  id v10 = v9;
  os_signpost_id_t spid = v8;
  unint64_t v74 = v8 - 1;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "ProcessFrequentLocationsWithSortedMoments", "", (uint8_t *)&buf, 2u);
  }
  v75 = v10;

  v86 = (void (**)(void, void, double))MEMORY[0x19F38D650](v78);
  uint64_t v122 = 0;
  v123 = &v122;
  uint64_t v124 = 0x2020000000;
  char v125 = 0;
  v81 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v11 = [v88 count];
  uint64_t v77 = [v88 firstObject];
  v76 = [v88 lastObject];
  v80 = objc_msgSend(v77, "pl_startDate");
  v79 = objc_msgSend(v76, "pl_endDate");
  [v80 timeIntervalSinceReferenceDate];
  double v13 = v12;
  v90 = [MEMORY[0x1E4F1CA48] array];
  if (v11)
  {
    uint64_t v14 = 0;
    if (v13 + -604800.0 >= -3000000000.0) {
      double v15 = v13 + -604800.0;
    }
    else {
      double v15 = -3000000000.0;
    }
    do
    {
      uint64_t v16 = (void *)MEMORY[0x19F38D3B0]();
      id v17 = [v88 objectAtIndexedSubscript:v14];
      long long v18 = objc_msgSend(v17, "pl_startDate");
      [v18 timeIntervalSinceReferenceDate];
      double v20 = v19;

      if (v20 > v15)
      {
        double v21 = [NSNumber numberWithUnsignedInteger:v14];
        [v90 addObject:v21];

        do
          double v15 = v15 + 15724800.0;
        while (v20 > v15);
      }

      ++v14;
    }
    while (v14 != v11);
  }
  uint64_t v22 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", v11, spid);
  [v90 addObject:v22];

  if ((unint64_t)[v90 count] <= 2)
  {
    uint64_t v23 = [NSNumber numberWithUnsignedInteger:v11];
    [v90 addObject:v23];
  }
  char v24 = PLBackendGetLog();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    int buf = 134218498;
    unint64_t v131 = v11;
    __int16 v132 = 2112;
    uint64_t v133 = (uint64_t)v80;
    __int16 v134 = 2112;
    uint64_t v135 = (uint64_t)v79;
    _os_log_impl(&dword_19B3C7000, v24, OS_LOG_TYPE_DEFAULT, "Processing Frequent Locations for %tu moments from %@ to %@", (uint8_t *)&buf, 0x20u);
  }

  [v79 timeIntervalSinceDate:v80];
  unint64_t v94 = 0;
  double v26 = 1.0 / ceil(v25 / 15724800.0);
  double v27 = v26;
  while (v94 < [v90 count] - 2)
  {
    v87 = (void *)MEMORY[0x19F38D3B0]();
    uint64_t v28 = [v90 objectAtIndexedSubscript:v94];
    uint64_t v29 = [v28 unsignedIntegerValue];

    double v30 = [v90 objectAtIndexedSubscript:v94 + 2];
    uint64_t v31 = [v30 unsignedIntegerValue];

    v91 = objc_msgSend(v88, "subarrayWithRange:", v29, v31 - v29);
    id v32 = PLBackendGetLog();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v33 = [v91 firstObject];
      id v34 = objc_msgSend(v33, "pl_startDate");
      uint64_t v35 = [v91 lastObject];
      uint64_t v36 = objc_msgSend(v35, "pl_endDate");
      int buf = 134219010;
      unint64_t v131 = v94;
      __int16 v132 = 2048;
      uint64_t v133 = v29;
      __int16 v134 = 2048;
      uint64_t v135 = v31;
      __int16 v136 = 2112;
      v137 = v34;
      __int16 v138 = 2112;
      v139 = v36;
      _os_log_impl(&dword_19B3C7000, v32, OS_LOG_TYPE_DEBUG, "Frequent Locations: Processing Batch %tu: indices %tu to %tu (from %@ to %@)", (uint8_t *)&buf, 0x34u);
    }
    v118[0] = MEMORY[0x1E4F143A8];
    v118[1] = 3221225472;
    v118[2] = __107__PLFrequentLocationProcessor_processFrequentLocationsWithSortedMoments_locationsOfInterest_progressBlock___block_invoke;
    v118[3] = &unk_1E58711F0;
    uint64_t v37 = v86;
    double v121 = v27;
    id v119 = v37;
    v120 = &v122;
    char v38 = [a1 processFrequentLocationsWithItemSubset:v91 locationsOfInterest:v85 progressBlock:v118];
    if ([v38 count])
    {
      if (*((unsigned char *)v123 + 24))
      {
        int v39 = 1;
        int v40 = MEMORY[0x1E4F14500];
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          int buf = 67109120;
          LODWORD(v131) = 125;
          _os_log_impl(&dword_19B3C7000, v40, OS_LOG_TYPE_INFO, "Cancelled at line %d", (uint8_t *)&buf, 8u);
        }
      }
      else
      {
        [v38 firstObject];
        v82 = v83 = v38;
        uint64_t v41 = [v82 momentsSet];
        unint64_t v97 = [v41 count];

        id v42 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
        long long v116 = 0u;
        long long v117 = 0u;
        long long v114 = 0u;
        long long v115 = 0u;
        id v43 = v81;
        uint64_t v44 = [v43 countByEnumeratingWithState:&v114 objects:v129 count:16];
        if (v44)
        {
          uint64_t v45 = *(void *)v115;
          do
          {
            for (uint64_t i = 0; i != v44; ++i)
            {
              if (*(void *)v115 != v45) {
                objc_enumerationMutation(v43);
              }
              id v47 = [*(id *)(*((void *)&v114 + 1) + 8 * i) momentsSet];
              [v42 unionSet:v47];
            }
            uint64_t v44 = [v43 countByEnumeratingWithState:&v114 objects:v129 count:16];
          }
          while (v44);
        }

        long long v112 = 0u;
        long long v113 = 0u;
        long long v110 = 0u;
        long long v111 = 0u;
        id obj = v83;
        uint64_t v48 = [obj countByEnumeratingWithState:&v110 objects:v128 count:16];
        if (v48)
        {
          uint64_t v92 = *(void *)v111;
LABEL_34:
          uint64_t v98 = 0;
          uint64_t v93 = v48;
          while (1)
          {
            if (*(void *)v111 != v92) {
              objc_enumerationMutation(obj);
            }
            uint64_t v49 = *(void **)(*((void *)&v110 + 1) + 8 * v98);
            context = (void *)MEMORY[0x19F38D3B0]();
            uint64_t v50 = [v49 momentsSet];
            unint64_t v99 = [v50 count];
            unint64_t v51 = v97;
            if (v97 <= 7) {
              unint64_t v51 = 7;
            }
            unint64_t v95 = v51;
            BOOL v52 = v99 < v51;

            if (!v52)
            {
              [v43 sortUsingComparator:&__block_literal_global_90947];
              long long v108 = 0u;
              long long v109 = 0u;
              long long v106 = 0u;
              long long v107 = 0u;
              id v100 = v43;
              uint64_t v53 = [v100 countByEnumeratingWithState:&v106 objects:v127 count:16];
              if (v53)
              {
                uint64_t v54 = *(void *)v107;
                while (2)
                {
                  for (uint64_t j = 0; j != v53; ++j)
                  {
                    if (*(void *)v107 != v54) {
                      objc_enumerationMutation(v100);
                    }
                    long long v56 = *(void **)(*((void *)&v106 + 1) + 8 * j);
                    long long v57 = [v49 momentsSet];
                    long long v58 = [v56 momentsSet];
                    int v59 = [v57 intersectsSet:v58];

                    if (v59)
                    {
                      long long v104 = 0u;
                      long long v105 = 0u;
                      long long v102 = 0u;
                      long long v103 = 0u;
                      long long v61 = [v49 sortedMoments];
                      uint64_t v62 = [v61 countByEnumeratingWithState:&v102 objects:v126 count:16];
                      if (v62)
                      {
                        uint64_t v63 = *(void *)v103;
                        do
                        {
                          for (uint64_t k = 0; k != v62; ++k)
                          {
                            if (*(void *)v103 != v63) {
                              objc_enumerationMutation(v61);
                            }
                            uint64_t v65 = *(void *)(*((void *)&v102 + 1) + 8 * k);
                            if (([v42 containsObject:v65] & 1) == 0)
                            {
                              [v56 addMomentToSortedMoments:v65];
                              [v42 addObject:v65];
                            }
                          }
                          uint64_t v62 = [v61 countByEnumeratingWithState:&v102 objects:v126 count:16];
                        }
                        while (v62);
                      }

                      goto LABEL_59;
                    }
                  }
                  uint64_t v53 = [v100 countByEnumeratingWithState:&v106 objects:v127 count:16];
                  if (v53) {
                    continue;
                  }
                  break;
                }
              }

              [v100 addObject:v49];
              long long v60 = [v49 momentsSet];
              [v42 unionSet:v60];

LABEL_59:
              unint64_t v97 = (unint64_t)((double)v97 * 0.5);
            }
            if (v99 < v95) {
              break;
            }
            if (++v98 == v93)
            {
              uint64_t v48 = [obj countByEnumeratingWithState:&v110 objects:v128 count:16];
              if (v48) {
                goto LABEL_34;
              }
              break;
            }
          }
        }

        int v39 = 0;
        double v27 = v26 + v27;
        char v38 = v83;
      }
    }
    else
    {
      double v27 = v26 + v27;
      int v39 = 9;
    }

    if (v39 != 9 && v39)
    {
      id v68 = (id)MEMORY[0x1E4F1CBF0];
      goto LABEL_78;
    }
    ++v94;
  }
  long long v66 = [v81 indexesOfObjectsPassingTest:&__block_literal_global_9_90948];
  [v81 removeObjectsAtIndexes:v66];
  if (v86
    && (char v101 = 0,
        ((void (**)(void, char *, double))v86)[2](v86, &v101, 1.0),
        char v67 = *((unsigned char *)v123 + 24) | v101,
        (*((unsigned char *)v123 + 24) = v67) != 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      int buf = 67109120;
      LODWORD(v131) = 180;
      _os_log_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d", (uint8_t *)&buf, 8u);
    }
    id v68 = (id)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    long long v69 = v75;
    long long v70 = v69;
    if (v74 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v69))
    {
      LOWORD(buf) = 0;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v70, OS_SIGNPOST_INTERVAL_END, spida, "ProcessFrequentLocationsWithSortedMoments", "", (uint8_t *)&buf, 2u);
    }

    id v68 = v81;
  }

LABEL_78:
  _Block_object_dispose(&v122, 8);

  return v68;
}

uint64_t __107__PLFrequentLocationProcessor_processFrequentLocationsWithSortedMoments_locationsOfInterest_progressBlock___block_invoke(uint64_t a1, unsigned char *a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    char v5 = 0;
    uint64_t result = (*(uint64_t (**)(uint64_t, char *, double))(result + 16))(result, &v5, *(double *)(a1 + 48));
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) |= v5;
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
      *a2 = 1;
    }
  }
  return result;
}

BOOL __107__PLFrequentLocationProcessor_processFrequentLocationsWithSortedMoments_locationsOfInterest_progressBlock___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 dateInterval];
  [v2 duration];
  BOOL v4 = v3 < 3888000.0;

  return v4;
}

BOOL __107__PLFrequentLocationProcessor_processFrequentLocationsWithSortedMoments_locationsOfInterest_progressBlock___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  char v6 = [v5 momentsSet];
  uint64_t v7 = [v6 count];
  os_signpost_id_t v8 = [v4 momentsSet];
  uint64_t v9 = [v8 count];

  if (v7 == v9)
  {
    id v10 = [v5 sortedMoments];

    uint64_t v11 = [v10 firstObject];
    double v12 = objc_msgSend(v11, "pl_startDate");
    double v13 = [v4 sortedMoments];
    uint64_t v14 = [v13 firstObject];
    double v15 = objc_msgSend(v14, "pl_startDate");
    BOOL v16 = v12 < v15;
  }
  else
  {
    id v10 = [v5 momentsSet];

    unint64_t v17 = [v10 count];
    uint64_t v11 = [v4 momentsSet];
    BOOL v16 = v17 > [v11 count];
  }

  return v16;
}

+ (id)processFrequentLocationsWithItems:(id)a3 locationsOfInterest:(id)a4 progressBlock:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = (void (**)(void, void, double))MEMORY[0x19F38D650]();
  double v12 = [MEMORY[0x1E4F1CAD0] set];
  if ([v8 count])
  {
    double v13 = +[PLMediaMiningUtilities sortDescriptorsForSortingItemsByTime];
    uint64_t v14 = [v8 sortedArrayUsingDescriptors:v13];

    double v15 = [a1 sortDescriptorsForLocationsOfInterest];
    BOOL v16 = [v9 sortedArrayUsingDescriptors:v15];

    unint64_t v17 = [a1 processFrequentLocationsWithSortedMoments:v14 locationsOfInterest:v16 progressBlock:v10];
    if (v11 && (char v21 = 0, ((void (**)(void, char *, double))v11)[2](v11, &v21, 1.0), v21))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)int buf = 67109120;
        int v23 = 55;
        _os_log_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d", buf, 8u);
      }
      id v18 = v12;
    }
    else
    {
      id v18 = [MEMORY[0x1E4F1CAD0] setWithArray:v17];
    }
    double v19 = v18;
  }
  else
  {
    double v19 = [MEMORY[0x1E4F1CAD0] set];
  }

  return v19;
}

@end