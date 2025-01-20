@interface PXTimelineScheduler
- (NSArray)bestContent;
- (NSArray)featuredPhotoTimelineEntries;
- (NSArray)memoryTimelineEntries;
- (NSArray)timelineCandidates;
- (PXTimelineDataSource)timelineDataSource;
- (PXTimelineScheduler)init;
- (PXTimelineScheduler)initWithTimelineDataSource:(id)a3;
- (id)_coalesceRepeatedTimelineEntries:(id)a3;
- (id)_findBestContentAndRemoveFromSourceAtDate:(id)a3 options:(id)a4;
- (id)_findBestFeaturedPhotoAndRemoveFromSource;
- (id)_scheduledTimelineEntriesWithOptions:(id)a3 atDate:(id)a4;
- (id)_sortedTimelineEntriesForMemoriesAtDate:(id)a3;
- (id)_timelineAtDate:(id)a3 startOfDayCandidatesIndex:(int64_t)a4 timelineEntryByBestContentInterval:(id)a5 options:(id)a6;
- (id)_timelineEntriesFromAssetCollections:(id)a3;
- (id)_timelineEntryByBestContentIntervalAtDate:(id)a3 numberOfDays:(int64_t)a4 options:(id)a5;
- (id)scheduledTimelineEntriesWithOptions:(id)a3;
- (int64_t)_startOfDayIndexWithOffsetDay:(int64_t)a3 entriesCount:(int64_t)a4 perDayLimit:(int64_t)a5 options:(id)a6;
- (void)_initTimelineEntriesAtDate:(id)a3 options:(id)a4;
- (void)setBestContent:(id)a3;
- (void)setFeaturedPhotoTimelineEntries:(id)a3;
- (void)setMemoryTimelineEntries:(id)a3;
- (void)setTimelineCandidates:(id)a3;
- (void)setTimelineDataSource:(id)a3;
@end

@implementation PXTimelineScheduler

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timelineCandidates, 0);
  objc_storeStrong((id *)&self->_bestContent, 0);
  objc_storeStrong((id *)&self->_featuredPhotoTimelineEntries, 0);
  objc_storeStrong((id *)&self->_memoryTimelineEntries, 0);
  objc_storeStrong((id *)&self->_timelineDataSource, 0);
}

- (void)setTimelineCandidates:(id)a3
{
}

- (NSArray)timelineCandidates
{
  return self->_timelineCandidates;
}

- (void)setBestContent:(id)a3
{
}

- (NSArray)bestContent
{
  return self->_bestContent;
}

- (void)setFeaturedPhotoTimelineEntries:(id)a3
{
}

- (NSArray)featuredPhotoTimelineEntries
{
  return self->_featuredPhotoTimelineEntries;
}

- (void)setMemoryTimelineEntries:(id)a3
{
}

- (NSArray)memoryTimelineEntries
{
  return self->_memoryTimelineEntries;
}

- (void)setTimelineDataSource:(id)a3
{
}

- (PXTimelineDataSource)timelineDataSource
{
  return self->_timelineDataSource;
}

- (id)_coalesceRepeatedTimelineEntries:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 firstObject];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v6 = v3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v23;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v23 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v22 + 1) + 8 * v10);
        v12 = objc_msgSend(v4, "localIdentifier", (void)v22);
        v13 = [v11 localIdentifier];
        int v14 = [v12 isEqualToString:v13];

        if (!v14)
        {
          [v5 addObject:v4];
          v17 = v4;
          id v4 = v11;
          goto LABEL_10;
        }
        v15 = [v11 endTime];
        [v4 setEndTime:v15];

        uint64_t v16 = [v4 proactiveCriterion];
        if (v16)
        {
          v17 = (void *)v16;
LABEL_10:

          goto LABEL_11;
        }
        v18 = [v11 proactiveCriterion];

        if (v18)
        {
          v17 = [v11 proactiveCriterion];
          [v4 setProactiveCriterion:v17];
          goto LABEL_10;
        }
LABEL_11:
        ++v10;
      }
      while (v8 != v10);
      uint64_t v19 = [v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
      uint64_t v8 = v19;
    }
    while (v19);
  }

  id v20 = [v5 lastObject];

  if (v4 != v20) {
    [v5 addObject:v4];
  }

  return v5;
}

- (id)_timelineAtDate:(id)a3 startOfDayCandidatesIndex:(int64_t)a4 timelineEntryByBestContentInterval:(id)a5 options:(id)a6
{
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  v39 = self;
  v12 = [(PXTimelineScheduler *)self timelineCandidates];
  uint64_t v40 = [v12 count];

  v37 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  v13 = [v37 startOfDayForDate:v9];
  id v14 = [MEMORY[0x1E4F1C9C8] distantPast];
  v41 = v10;
  v15 = [v10 allKeys];
  uint64_t v16 = [v15 sortedArrayUsingSelector:sel_compare_];

  v42 = v16;
  v17 = [v16 objectAtIndexedSubscript:0];
  v38 = v11;
  [v11 timelineEntryDuration];
  double v19 = v18;
  v45 = v9;
  id v20 = [v9 dateByAddingTimeInterval:86400.0];
  id v43 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v46 = v20;
  if ([v20 compare:v14] == 1)
  {
    uint64_t v44 = 0;
    unint64_t v21 = 0x1E4F28000uLL;
    unint64_t v22 = v40;
    do
    {
      long long v23 = [v13 dateByAddingTimeInterval:v19];

      long long v24 = (void *)[objc_alloc(*(Class *)(v21 + 3096)) initWithStartDate:v13 endDate:v23];
      long long v25 = [v24 intersectionWithDateInterval:v17];
      [v25 duration];
      if (v26 <= 0.0)
      {
        if ([v45 compare:v23] == -1)
        {
          v34 = [(PXTimelineScheduler *)v39 timelineCandidates];
          v35 = [v34 objectAtIndex:a4];
          v29 = (void *)[v35 copy];

          unint64_t v22 = v40;
        }
        else
        {
          v29 = 0;
        }
        a4 = (a4 + 1) % v22;
        if (!v29) {
          goto LABEL_17;
        }
      }
      else
      {
        uint64_t v27 = [v17 endDate];
        uint64_t v28 = [v23 laterDate:v27];

        if ([v45 compare:v28] == -1)
        {
          v30 = [v41 objectForKeyedSubscript:v17];
          v29 = (void *)[v30 copy];
        }
        else
        {
          v29 = 0;
        }
        uint64_t v31 = [v42 count];
        if (v44 + 1 < (unint64_t)(v31 - 1)) {
          uint64_t v32 = v44 + 1;
        }
        else {
          uint64_t v32 = v31 - 1;
        }
        uint64_t v44 = v32;
        uint64_t v33 = [v42 objectAtIndexedSubscript:v32];

        v17 = (void *)v33;
        long long v23 = (void *)v28;
        unint64_t v21 = 0x1E4F28000;
        if (!v29) {
          goto LABEL_17;
        }
      }
      [v29 setStartTime:v13];
      [v29 setEndTime:v23];
      [v43 addObject:v29];
LABEL_17:
      id v14 = v23;

      v13 = v14;
    }
    while ([v46 compare:v14] == 1);
  }

  return v43;
}

- (int64_t)_startOfDayIndexWithOffsetDay:(int64_t)a3 entriesCount:(int64_t)a4 perDayLimit:(int64_t)a5 options:(id)a6
{
  id v9 = a6;
  unint64_t v10 = [v9 numberOfTimelines];
  int64_t v11 = 0;
  if (a4 && a5 && v10)
  {
    if (a3)
    {
      if (a3 >= 0) {
        int64_t v12 = a3;
      }
      else {
        int64_t v12 = -a3;
      }
      int64_t v13 = a5 % a4;
      do
      {
        int64_t v13 = (v13 + a5) % a4;
        --v12;
      }
      while (v12);
      if (a3 >= 0) {
        a3 = v13 - a5 % a4;
      }
      else {
        a3 = a5 % a4 - v13;
      }
    }
    int64_t v11 = ((uint64_t)([v9 timelineIndex] * a4 / v10 + a3) % a4 + a4) % a4;
  }

  return v11;
}

- (id)_timelineEntryByBestContentIntervalAtDate:(id)a3 numberOfDays:(int64_t)a4 options:(id)a5
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  [v8 bestContentEntryDuration];
  long double v10 = v9;
  [v8 timelineEntryDuration];
  long double v12 = v11;
  if (fmod(v10, v11) != 0.0) {
    PXAssertGetLog();
  }
  int64_t v13 = [v8 bestContentStartTimeHours];
  if ([v13 count])
  {
    id v47 = v8;
    id v48 = v7;
    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    v46 = v13;
    id v14 = v13;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v56 objects:v60 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v57;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v57 != v17) {
            objc_enumerationMutation(v14);
          }
          double v19 = *(void **)(*((void *)&v56 + 1) + 8 * i);
          if ([v19 integerValue] < 0 || objc_msgSend(v19, "integerValue") >= 24) {
            PXAssertGetLog();
          }
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v56 objects:v60 count:16];
      }
      while (v16);
    }

    id v20 = [(PXTimelineScheduler *)self bestContent];
    unint64_t v21 = [v20 count];

    unint64_t v22 = [v14 count];
    if (v21 >= v22) {
      unint64_t v23 = v22;
    }
    else {
      unint64_t v23 = v21;
    }
    int64_t v24 = a4;
    int64_t v25 = v23 * a4;
    double v26 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v23 * a4];
    v45 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    [v45 startOfDayForDate:v48];
    v50 = unint64_t v49 = v25;
    if (v25)
    {
      uint64_t v28 = 0;
      *(void *)&long long v27 = 138412290;
      long long v44 = v27;
      do
      {
        uint64_t v55 = v28;
        uint64_t v29 = v28 / v24;
        v30 = objc_msgSend(v14, "objectAtIndexedSubscript:", v28 / v24, v44);
        double v31 = (double)[v30 integerValue] * 3600.0;
        if (fmod(v31, v12) != 0.0) {
          PXAssertGetLog();
        }
        v54 = v30;
        uint64_t v32 = [v50 dateByAddingTimeInterval:v31];
        uint64_t v33 = [objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v32 duration:(double)v10];
        v34 = [(PXTimelineScheduler *)self bestContent];
        [v34 objectAtIndexedSubscript:v29];
        v36 = v35 = self;
        v53 = (void *)v33;
        [v26 setObject:v36 forKeyedSubscript:v33];

        id v37 = v32;
        v52 = v37;
        int64_t v38 = a4 - 1;
        if ((unint64_t)v24 >= 2)
        {
          do
          {
            uint64_t v39 = [v37 dateByAddingTimeInterval:86400.0];

            uint64_t v40 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v39 duration:(double)v10];
            v41 = [(PXTimelineScheduler *)v35 bestContent];
            v42 = [v41 objectAtIndexedSubscript:v29];
            [v26 setObject:v42 forKeyedSubscript:v40];

            id v37 = (id)v39;
            --v38;
          }
          while (v38);
        }

        int64_t v24 = a4;
        uint64_t v28 = v55 + a4;
        self = v35;
      }
      while (v55 + a4 < v49);
    }

    id v8 = v47;
    id v7 = v48;
    int64_t v13 = v46;
  }
  else
  {
    if ([v13 count]) {
      PXAssertGetLog();
    }
    double v26 = (void *)MEMORY[0x1E4F1CC08];
  }

  return v26;
}

- (id)_timelineEntriesFromAssetCollections:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v30 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id obj = v3;
  uint64_t v4 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v35;
    unint64_t v7 = 0x1E4F39000uLL;
    do
    {
      uint64_t v8 = 0;
      uint64_t v31 = v5;
      do
      {
        if (*(void *)v35 != v6) {
          objc_enumerationMutation(obj);
        }
        double v9 = *(void **)(*((void *)&v34 + 1) + 8 * v8);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v10 = v6;
          unint64_t v11 = v7;
          long double v12 = [(PXTimelineScheduler *)self timelineDataSource];
          int64_t v13 = [v12 keyAssetByFeaturedPhotoLocalIdentifier];
          id v14 = [v9 localIdentifier];
          uint64_t v15 = [v13 objectForKeyedSubscript:v14];

          uint64_t v16 = [(PXTimelineScheduler *)self timelineDataSource];
          uint64_t v17 = [v16 suggestedCropByFeaturedPhotoLocalIdentifier];
          double v18 = [v9 localIdentifier];
          double v19 = [v17 objectForKeyedSubscript:v18];

          id v20 = [(PXTimelineScheduler *)self timelineDataSource];
          uint64_t v21 = [v20 sourceType];
          unint64_t v22 = [PXTimelineEntry alloc];
          unint64_t v23 = v22;
          if (v21 == 1)
          {
            int64_t v24 = [v20 sourceIdentifier];
            int64_t v25 = [(PXTimelineEntry *)v23 initWithAlbumFeaturedPhoto:v9 localAlbumIdentifier:v24 andFeaturedPhotoKeyAsset:v15 suggestedCrop:v19];
          }
          else
          {
            int64_t v25 = [(PXTimelineEntry *)v22 initWithFeaturedPhoto:v9 andFeaturedPhotoKeyAsset:v15 suggestedCrop:v19];
          }

          unint64_t v7 = v11;
          uint64_t v6 = v10;
          uint64_t v5 = v31;
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            goto LABEL_15;
          }
          double v26 = [(PXTimelineScheduler *)self timelineDataSource];
          long long v27 = [v26 keyAssetByMemoryLocalIdentifier];
          uint64_t v28 = [v9 localIdentifier];
          uint64_t v15 = [v27 objectForKeyedSubscript:v28];

          int64_t v25 = [[PXTimelineEntry alloc] initWithMemory:v9 andMemoryKeyAsset:v15];
        }

        if (v25)
        {
          [v30 addObject:v25];
        }
LABEL_15:
        ++v8;
      }
      while (v5 != v8);
      uint64_t v5 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
    }
    while (v5);
  }

  return v30;
}

- (id)_sortedTimelineEntriesForMemoriesAtDate:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(PXTimelineScheduler *)self timelineDataSource];
  uint64_t v6 = [v5 memories];

  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __63__PXTimelineScheduler__sortedTimelineEntriesForMemoriesAtDate___block_invoke;
  v29[3] = &unk_1E5DC00D8;
  id v21 = v4;
  id v30 = v21;
  unint64_t v7 = [v6 sortedArrayUsingComparator:v29];
  unint64_t v22 = v6;
  id v24 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v6, "count"));
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = v7;
  uint64_t v8 = [obj countByEnumeratingWithState:&v25 objects:v31 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v26 != v10) {
          objc_enumerationMutation(obj);
        }
        long double v12 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        int64_t v13 = [(PXTimelineScheduler *)self timelineDataSource];
        id v14 = [v13 keyAssetByMemoryLocalIdentifier];
        uint64_t v15 = [v12 localIdentifier];
        uint64_t v16 = [v14 objectForKeyedSubscript:v15];

        uint64_t v17 = [[PXTimelineEntry alloc] initWithMemory:v12 andMemoryKeyAsset:v16];
        if (v17) {
          [v24 addObject:v17];
        }
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v25 objects:v31 count:16];
    }
    while (v9);
  }

  if ([v24 count] == 1)
  {
    double v18 = [v24 firstObject];
    double v19 = (void *)[v18 copy];
    [v24 addObject:v19];
  }
  return v24;
}

uint64_t __63__PXTimelineScheduler__sortedTimelineEntriesForMemoriesAtDate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  [v5 relevanceScoreAtDate:*(void *)(a1 + 32)];
  double v8 = v7;
  [v6 relevanceScoreAtDate:*(void *)(a1 + 32)];
  if (v8 == v9)
  {
    uint64_t v10 = [v6 creationDate];
    unint64_t v11 = [v5 creationDate];
    uint64_t v12 = [v10 compare:v11];
  }
  else if (v8 < v9)
  {
    uint64_t v12 = 1;
  }
  else
  {
    uint64_t v12 = -1;
  }

  return v12;
}

- (id)_findBestFeaturedPhotoAndRemoveFromSource
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v3 = [(PXTimelineScheduler *)self featuredPhotoTimelineEntries];
  id v4 = [v3 firstObject];

  if (v4)
  {
    id v5 = [(PXTimelineScheduler *)self memoryTimelineEntries];
    uint64_t v6 = [v5 count];
    double v7 = [(PXTimelineScheduler *)self featuredPhotoTimelineEntries];
    unint64_t v8 = [v7 count] + v6;

    if (v8 >= 0xB)
    {
      double v9 = [(PXTimelineScheduler *)self featuredPhotoTimelineEntries];
      uint64_t v10 = (void *)[v9 mutableCopy];

      [v10 removeObjectAtIndex:0];
      [(PXTimelineScheduler *)self setFeaturedPhotoTimelineEntries:v10];
    }
    v13[0] = v4;
    unint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  }
  else
  {
    unint64_t v11 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v11;
}

- (id)_findBestContentAndRemoveFromSourceAtDate:(id)a3 options:(id)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = [(PXTimelineScheduler *)self timelineDataSource];
  double v9 = [v8 memories];
  uint64_t v10 = [v9 count];

  if (v10)
  {
    unint64_t v11 = [(PXTimelineScheduler *)self _sortedTimelineEntriesForMemoriesAtDate:v6];
    uint64_t v12 = [v7 bestContentStartTimeHours];
    unint64_t v13 = [v12 count];

    unint64_t v14 = [v11 count];
    if (v13 >= v14) {
      unint64_t v15 = v14;
    }
    else {
      unint64_t v15 = v13;
    }
    uint64_t v16 = objc_msgSend(v11, "subarrayWithRange:", 0, v15);
    uint64_t v17 = (void *)[v16 mutableCopy];

    unint64_t v18 = [v7 timelineIndex];
    unint64_t v19 = v18 % [v17 count];
    id v20 = PLMemoriesGetLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      id v21 = +[PXTimelineSize sizeDescriptionForSizeClass:](PXTimelineSize, "sizeDescriptionForSizeClass:", [v7 timelineForSize]);
      *(_DWORD *)buf = 138412546;
      v41 = v21;
      __int16 v42 = 2048;
      unint64_t v43 = v19;
      _os_log_impl(&dword_1A9AE7000, v20, OS_LOG_TYPE_DEBUG, "[%@] best content rotation: %tu", buf, 0x16u);
    }
    while (v19)
    {
      --v19;
      unint64_t v22 = [v17 firstObject];
      [v17 addObject:v22];

      [v17 removeObjectAtIndex:0];
    }
    unint64_t v23 = [(PXTimelineScheduler *)self memoryTimelineEntries];
    uint64_t v24 = [v23 count];
    long long v25 = [(PXTimelineScheduler *)self featuredPhotoTimelineEntries];
    unint64_t v26 = [v25 count] + v24;

    if (v26 < 0xB)
    {
      long long v37 = 0u;
      long long v38 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      long long v28 = [(PXTimelineScheduler *)self memoryTimelineEntries];
      uint64_t v29 = [v28 countByEnumeratingWithState:&v35 objects:v39 count:16];
      if (v29)
      {
        uint64_t v30 = v29;
        uint64_t v31 = *(void *)v36;
        do
        {
          for (uint64_t i = 0; i != v30; ++i)
          {
            if (*(void *)v36 != v31) {
              objc_enumerationMutation(v28);
            }
            uint64_t v33 = *(void **)(*((void *)&v35 + 1) + 8 * i);
            if ([v17 containsObject:v33]) {
              [v33 setProactiveCriterion:0];
            }
          }
          uint64_t v30 = [v28 countByEnumeratingWithState:&v35 objects:v39 count:16];
        }
        while (v30);
      }
    }
    else
    {
      long long v27 = [(PXTimelineScheduler *)self memoryTimelineEntries];
      long long v28 = (void *)[v27 mutableCopy];

      [v28 removeObjectsInArray:v17];
      [(PXTimelineScheduler *)self setMemoryTimelineEntries:v28];
    }
  }
  else
  {
    uint64_t v17 = [(PXTimelineScheduler *)self _findBestFeaturedPhotoAndRemoveFromSource];
  }

  return v17;
}

- (id)_scheduledTimelineEntriesWithOptions:(id)a3 atDate:(id)a4
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  PLTimelineGetLog();
  unint64_t v8 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v9 = os_signpost_id_make_with_pointer(v8, self);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v10 = v9;
    if (os_signpost_enabled(v8))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v10, "ScheduleTimeline", " enableTelemetry=YES ", buf, 2u);
    }
  }

  [(PXTimelineScheduler *)self _initTimelineEntriesAtDate:v7 options:v6];
  unint64_t v11 = [(PXTimelineScheduler *)self timelineCandidates];
  uint64_t v12 = [v11 count];

  if (v12)
  {
    unint64_t v13 = [(PXTimelineScheduler *)self timelineDataSource];
    unint64_t v14 = [v13 memories];
    unint64_t v15 = [v14 firstObject];
    uint64_t v16 = [v15 creationDate];
    uint64_t v17 = v16;
    id v47 = v13;
    if (v16)
    {
      unint64_t v18 = v16;
    }
    else
    {
      uint64_t v24 = [v13 featuredPhotos];
      long long v25 = [v24 firstObject];
      unint64_t v18 = [v25 creationDate];
    }
    unint64_t v26 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    uint64_t v27 = [v26 startOfDayForDate:v18];
    v45 = [v26 startOfDayForDate:v7];
    v46 = (void *)v27;
    long long v28 = objc_msgSend(v26, "components:fromDate:toDate:options:", 16, v27);
    uint64_t v29 = [v28 day];

    uint64_t v30 = PLMemoriesGetLog();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v49 = v29;
      _os_log_impl(&dword_1A9AE7000, v30, OS_LOG_TYPE_DEBUG, "Timeline - day difference: %ld", buf, 0xCu);
    }

    uint64_t v31 = [(PXTimelineScheduler *)self _timelineEntryByBestContentIntervalAtDate:v7 numberOfDays:2 options:v6];
    [v6 bestContentEntryDuration];
    double v33 = v32 * (double)(unint64_t)[v31 count] * -0.5 + 86400.0;
    [v6 timelineEntryDuration];
    if (fmod(v33, v34) != 0.0) {
      PXAssertGetLog();
    }
    [v6 timelineEntryDuration];
    int64_t v36 = [(PXTimelineScheduler *)self _startOfDayIndexWithOffsetDay:v29 entriesCount:v12 perDayLimit:(uint64_t)(v33 / v35) options:v6];
    long long v37 = PLMemoriesGetLog();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
    {
      long long v38 = +[PXTimelineSize sizeDescriptionForSizeClass:](PXTimelineSize, "sizeDescriptionForSizeClass:", [v6 timelineForSize]);
      *(_DWORD *)buf = 138412802;
      uint64_t v49 = (uint64_t)v38;
      __int16 v50 = 2048;
      int64_t v51 = v36;
      __int16 v52 = 2048;
      uint64_t v53 = v12;
      _os_log_impl(&dword_1A9AE7000, v37, OS_LOG_TYPE_DEBUG, "Scheduler start of day index for [%@]: %zd, candidates count: %tu", buf, 0x20u);
    }
    uint64_t v39 = [(PXTimelineScheduler *)self _timelineAtDate:v7 startOfDayCandidatesIndex:v36 timelineEntryByBestContentInterval:v31 options:v6];
    unint64_t v22 = [(PXTimelineScheduler *)self _coalesceRepeatedTimelineEntries:v39];
    uint64_t v40 = [v22 firstObject];
    [v40 setStartTime:v7];

    PLTimelineGetLog();
    v41 = (id)objc_claimAutoreleasedReturnValue();
    os_signpost_id_t v42 = os_signpost_id_make_with_pointer(v41, self);
    if (v42 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v43 = v42;
      if (os_signpost_enabled(v41))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v41, OS_SIGNPOST_INTERVAL_END, v43, "ScheduleTimeline", " enableTelemetry=YES ", buf, 2u);
      }
    }

    unint64_t v23 = v47;
  }
  else
  {
    unint64_t v19 = PLMemoriesGetLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A9AE7000, v19, OS_LOG_TYPE_ERROR, "No timeline candidates", buf, 2u);
    }

    PLTimelineGetLog();
    unint64_t v18 = (id)objc_claimAutoreleasedReturnValue();
    os_signpost_id_t v20 = os_signpost_id_make_with_pointer(v18, self);
    if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v21 = v20;
      if (os_signpost_enabled(v18))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v18, OS_SIGNPOST_INTERVAL_END, v21, "ScheduleTimeline", " enableTelemetry=YES ", buf, 2u);
      }
    }
    unint64_t v22 = (void *)MEMORY[0x1E4F1CBF0];
    unint64_t v23 = v18;
  }

  return v22;
}

- (void)_initTimelineEntriesAtDate:(id)a3 options:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  unint64_t v8 = [(PXTimelineScheduler *)self timelineDataSource];
  os_signpost_id_t v9 = [v8 memories];
  os_signpost_id_t v10 = [(PXTimelineScheduler *)self _timelineEntriesFromAssetCollections:v9];
  [(PXTimelineScheduler *)self setMemoryTimelineEntries:v10];

  unint64_t v11 = [v8 featuredPhotos];
  uint64_t v12 = [(PXTimelineScheduler *)self _timelineEntriesFromAssetCollections:v11];
  [(PXTimelineScheduler *)self setFeaturedPhotoTimelineEntries:v12];

  unint64_t v13 = [(PXTimelineScheduler *)self _findBestContentAndRemoveFromSourceAtDate:v7 options:v6];

  [(PXTimelineScheduler *)self setBestContent:v13];
  id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  unint64_t v15 = [(PXTimelineScheduler *)self featuredPhotoTimelineEntries];
  [v14 addObjectsFromArray:v15];

  uint64_t v16 = [(PXTimelineScheduler *)self memoryTimelineEntries];
  [v14 addObjectsFromArray:v16];

  [(PXTimelineScheduler *)self setTimelineCandidates:v14];
  if ([v14 count])
  {
    uint64_t v17 = [(PXTimelineScheduler *)self bestContent];
    uint64_t v18 = [v17 count];

    if (!v18) {
      PXAssertGetLog();
    }
  }
}

- (id)scheduledTimelineEntriesWithOptions:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1C9C8];
  id v5 = a3;
  id v6 = [v4 date];
  id v7 = [(PXTimelineScheduler *)self _scheduledTimelineEntriesWithOptions:v5 atDate:v6];

  return v7;
}

- (PXTimelineScheduler)initWithTimelineDataSource:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PXTimelineScheduler;
  id v5 = [(PXTimelineScheduler *)&v8 init];
  id v6 = v5;
  if (v5) {
    [(PXTimelineScheduler *)v5 setTimelineDataSource:v4];
  }

  return v6;
}

- (PXTimelineScheduler)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXTimelineScheduler.m", 43, @"%s is not available as initializer", "-[PXTimelineScheduler init]");

  abort();
}

@end