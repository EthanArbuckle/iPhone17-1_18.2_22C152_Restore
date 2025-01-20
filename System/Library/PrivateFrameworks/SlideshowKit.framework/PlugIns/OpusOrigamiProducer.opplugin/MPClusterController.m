@interface MPClusterController
+ (id)sharedController;
+ (void)releaseSharedController;
- (MPClusterController)init;
- (id)allSlides;
- (id)allSlidesSortedByPaths:(id)a3;
- (id)allSlidesSortedByUsage;
- (id)allSlidesSortedChronologically;
- (id)clusterSlidesSortedByUserDefinedSortOrder:(id)a3 userDefinedSlideOrder:(id)a4;
- (id)clusterSlidesSortedChronologically:(id)a3;
- (id)clustersBasedOnOrderedPaths:(id)a3;
- (id)dayOfYearClusterForAssetAtPath:(id)a3;
- (id)dayOfYearClusters;
- (id)findBestChronologicalCluster:(id)a3 startingWithSlide:(id)a4;
- (id)findBestCluster:(id)a3;
- (id)findBestCluster:(id)a3 withMaxEffectSize:(int64_t)a4 idealEffectSize:(int64_t)a5;
- (id)findBestClusterBasedOnUserDefinedSlideOrder:(id)a3 startingWithSlide:(id)a4;
- (id)hourOfYearClusterForAssetAtPath:(id)a3;
- (id)hourOfYearClusters;
- (id)keywordClusters;
- (id)locationClusters;
- (id)minuteOfYearClusterForAssetAtPath:(id)a3;
- (id)minuteOfYearClusters;
- (id)monthClusterForAssetAtPath:(id)a3;
- (id)monthClusters;
- (id)monthOfYearClusterForAssetAtPath:(id)a3;
- (id)monthOfYearClusters;
- (id)nextLeastUsedSlides:(int64_t)a3 forLayer:(id)a4 markAsUsed:(BOOL)a5;
- (id)orderedAndPrioritizedSlideClusters;
- (id)prioritizedSlideClustersDictionary;
- (id)roundedFifteenMinuteOfYearClusterForAssetAtPath:(id)a3;
- (id)roundedFifteenMinuteOfYearClusters;
- (id)roundedFiveMinuteOfYearClusterForAssetAtPath:(id)a3;
- (id)roundedFiveMinuteOfYearClusters;
- (id)slideForPath:(id)a3;
- (id)userProvidedClusters;
- (id)yearClusterForAssetAtPath:(id)a3;
- (id)yearClusters;
- (int64_t)addSlideForPath:(id)a3 withIndex:(int64_t)a4;
- (void)_removeAllSingleSlideClustersForClusterCategory:(id)a3;
- (void)addKeywords:(id)a3 forSlide:(id)a4;
- (void)addPaths:(id)a3 toUserDefinedCluster:(id)a4;
- (void)createLocationClustersForPaths:(id)a3;
- (void)dealloc;
- (void)dumpClustersStatistics;
- (void)dumpSlidesStatistics;
- (void)flush;
- (void)flushClusters;
- (void)removeAllSingleSlideClusters;
- (void)resetAllUsageCounters;
- (void)setAuthoredDocument:(id)a3;
- (void)sortClusterSlidesChronologically:(id *)a3;
- (void)updateAllSlidesClusterWithSlide:(id)a3;
- (void)updateClusterRatings;
- (void)updateDayOfYearClustersWithDate:(id)a3 ofSlide:(id)a4;
- (void)updateHourOfYearClustersWithDate:(id)a3 ofSlide:(id)a4;
- (void)updateMinuteOfYearClustersWithDate:(id)a3 ofSlide:(id)a4;
- (void)updateMonthClustersWithDate:(id)a3 ofSlide:(id)a4;
- (void)updateMonthOfYearClustersWithDate:(id)a3 ofSlide:(id)a4;
- (void)updateRatingsForDayOfYearClusters;
- (void)updateRatingsForHourOfYearClusters;
- (void)updateRatingsForKeywordClusters;
- (void)updateRatingsForLocationClusters;
- (void)updateRatingsForMinuteOfYearClusters;
- (void)updateRatingsForMonthClusters;
- (void)updateRatingsForMonthOfYearClusters;
- (void)updateRatingsForRoundedFifteenMinuteOfYearClusters;
- (void)updateRatingsForRoundedFiveMinuteOfYearClusters;
- (void)updateRatingsForYearClusters;
- (void)updateRoundedFifteenMinuteOfYearClustersWithDate:(id)a3 ofSlide:(id)a4;
- (void)updateRoundedFiveMinuteOfYearClustersWithDate:(id)a3 ofSlide:(id)a4;
- (void)updateYearClustersWithDate:(id)a3 ofSlide:(id)a4;
@end

@implementation MPClusterController

+ (id)sharedController
{
  id result = (id)qword_1F1308;
  if (!qword_1F1308)
  {
    objc_sync_enter(a1);
    if (!qword_1F1308) {
      qword_1F1308 = objc_alloc_init(MPClusterController);
    }
    objc_sync_exit(a1);
    return (id)qword_1F1308;
  }
  return result;
}

+ (void)releaseSharedController
{
  if (qword_1F1308)
  {
    objc_sync_enter(a1);

    qword_1F1308 = 0;
    objc_sync_exit(a1);
  }
}

- (MPClusterController)init
{
  v5.receiver = self;
  v5.super_class = (Class)MPClusterController;
  v2 = [(MPClusterController *)&v5 init];
  if (v2)
  {
    v2->mSlides = (NSMutableDictionary *)+[NSMutableDictionary dictionary];
    v2->mSlideClusters = (NSMutableDictionary *)+[NSMutableDictionary dictionary];
    v3 = objc_alloc_init(MPCluster);
    v2->mAllSlidesCluster = v3;
    [(MPCluster *)v3 setName:@"allSlides"];
    [(MPCluster *)v2->mAllSlidesCluster setRating:0.0];
    v2->mMinimumRequiredClusterRating = 0.0;
    v2->mOldestSlideTimestamp = (NSDate *)[+[NSDate distantFuture] copy];
    v2->mNewestSlideTimestamp = (NSDate *)[+[NSDate distantPast] copy];
  }
  return v2;
}

- (void)dealloc
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = [(NSMutableDictionary *)self->mSlides objectEnumerator];
  id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * (void)v7) setUsableSlideClusters:0];
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  self->mSlideClusters = 0;
  self->mSlides = 0;

  self->mAllSlidesCluster = 0;
  self->mOldestSlideTimestamp = 0;

  self->mNewestSlideTimestamp = 0;
  v8.receiver = self;
  v8.super_class = (Class)MPClusterController;
  [(MPClusterController *)&v8 dealloc];
}

- (void)flush
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = [(NSMutableDictionary *)self->mSlides objectEnumerator];
  id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * (void)v7) setUsableSlideClusters:0];
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
  [(NSMutableDictionary *)self->mSlides removeAllObjects];
  [(NSMutableDictionary *)self->mSlideClusters removeAllObjects];

  objc_super v8 = objc_alloc_init(MPCluster);
  self->mAllSlidesCluster = v8;
  [(MPCluster *)v8 setName:@"allSlides"];
  [(MPCluster *)self->mAllSlidesCluster setRating:0.0];
}

- (void)setAuthoredDocument:(id)a3
{
  self->mAuthoredDocument = (MPDocument *)a3;
}

- (int64_t)addSlideForPath:(id)a3 withIndex:(int64_t)a4
{
  id v7 = -[MPDocument keywordsForPath:](self->mAuthoredDocument, "keywordsForPath:");
  objc_super v8 = [(MPDocument *)self->mAuthoredDocument creationDateForPath:a3];
  id v9 = +[NSMutableDictionary dictionary];
  if (!v8)
  {
    NSLog(@"Asset: %@ has no creation date metadata, using epoch as a workaround.", a3);
    objc_super v8 = +[NSDate dateWithTimeIntervalSince1970:0.0];
  }
  [(NSDate *)v8 timeIntervalSince1970];
  objc_msgSend(v9, "setObject:forKey:", a3, -[NSNumber stringValue](+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"), "stringValue"));
  p_mOldestSlideTimestamp = &self->mOldestSlideTimestamp;
  if ([(NSDate *)v8 compare:self->mOldestSlideTimestamp] == NSOrderedAscending
    || (p_mOldestSlideTimestamp = &self->mNewestSlideTimestamp,
        (char *)[(NSDate *)v8 compare:self->mNewestSlideTimestamp] == (char *)&dword_0 + 1))
  {

    *p_mOldestSlideTimestamp = (NSDate *)[(NSDate *)v8 copy];
  }
  long long v11 = (MPClusterSlide *)[(NSMutableDictionary *)self->mSlides objectForKey:a3];
  if (v11)
  {
    long long v12 = v11;
    [(MPClusterSlide *)v11 setReferenceCounter:(char *)[(MPClusterSlide *)v11 referenceCounter] + 1];
    int64_t v13 = [(MPClusterSlide *)v12 referenceCounter];
  }
  else
  {
    long long v12 = objc_alloc_init(MPClusterSlide);
    [(MPClusterSlide *)v12 setPath:a3];
    [(MPClusterSlide *)v12 setIndex:a4];
    int64_t v13 = 1;
    [(MPClusterSlide *)v12 setReferenceCounter:1];
    [(MPClusterSlide *)v12 setCaptureDate:v8];
    [(MPClusterController *)self addKeywords:v7 forSlide:v12];
    [(NSMutableDictionary *)self->mSlides setValue:v12 forKey:a3];
  }
  v14 = [(MPClusterSlide *)v12 captureDate];
  [(MPClusterController *)self updateYearClustersWithDate:v14 ofSlide:v12];
  [(MPClusterController *)self updateMonthClustersWithDate:v14 ofSlide:v12];
  [(MPClusterController *)self updateMonthOfYearClustersWithDate:v14 ofSlide:v12];
  [(MPClusterController *)self updateDayOfYearClustersWithDate:v14 ofSlide:v12];
  [(MPClusterController *)self updateHourOfYearClustersWithDate:v14 ofSlide:v12];
  [(MPClusterController *)self updateMinuteOfYearClustersWithDate:v14 ofSlide:v12];
  [(MPClusterController *)self updateRoundedFiveMinuteOfYearClustersWithDate:v14 ofSlide:v12];
  [(MPClusterController *)self updateRoundedFifteenMinuteOfYearClustersWithDate:v14 ofSlide:v12];
  [(MPClusterController *)self updateAllSlidesClusterWithSlide:v12];
  return v13;
}

- (void)addKeywords:(id)a3 forSlide:(id)a4
{
  id v7 = [(NSMutableDictionary *)self->mSlideClusters objectForKey:@"keywordClusters"];
  if (!v7)
  {
    id v7 = +[NSMutableDictionary dictionary];
    [(NSMutableDictionary *)self->mSlideClusters setObject:v7 forKey:@"keywordClusters"];
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v8 = [a3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(a3);
        }
        uint64_t v12 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        int64_t v13 = (MPCluster *)[v7 objectForKey:v12];
        if (!v13)
        {
          int64_t v13 = objc_alloc_init(MPCluster);
          [(MPCluster *)v13 setName:+[NSString stringWithFormat:@"keyword: %@", v12]];
          [v7 setObject:v13 forKey:v12];
        }
        [(MPCluster *)v13 addSlide:a4];
      }
      id v9 = [a3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }
}

- (id)allSlides
{
  return [(NSMutableDictionary *)self->mSlides allValues];
}

- (id)slideForPath:(id)a3
{
  return [(NSMutableDictionary *)self->mSlides objectForKey:a3];
}

- (id)allSlidesSortedByUsage
{
  char v3 = 1;
  return objc_msgSend(-[MPClusterController allSlides](self, "allSlides"), "sortedArrayUsingFunction:context:", sortSlidesByUsage1, &v3);
}

- (id)allSlidesSortedByPaths:(id)a3
{
  id v5 = +[NSMutableArray array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = [a3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(a3);
        }
        id v10 = [(NSMutableDictionary *)self->mSlides objectForKey:*(void *)(*((void *)&v12 + 1) + 8 * (void)v9)];
        if (v10) {
          [v5 addObject:v10];
        }
        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [a3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
  return v5;
}

- (id)nextLeastUsedSlides:(int64_t)a3 forLayer:(id)a4 markAsUsed:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = [(MPClusterController *)self allSlidesSortedByUsage];
  id v9 = +[NSMutableArray array];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = 0;
    uint64_t v13 = *(void *)v19;
    int64_t v17 = 1 - a3;
LABEL_3:
    uint64_t v14 = 0;
    while (1)
    {
      if (*(void *)v19 != v13) {
        objc_enumerationMutation(v8);
      }
      long long v15 = *(void **)(*((void *)&v18 + 1) + 8 * v14);
      objc_msgSend(v9, "addObject:", objc_msgSend(v15, "path"));
      if (v5) {
        objc_msgSend(v15, "setUsageCounterForLayer:to:", a4, (char *)objc_msgSend(v15, "overallUsageCounter") + 1);
      }
      if (!(v17 + v12 + v14)) {
        break;
      }
      if (v11 == (id)++v14)
      {
        id v11 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
        v12 += v14;
        if (v11) {
          goto LABEL_3;
        }
        return v9;
      }
    }
  }
  return v9;
}

- (id)allSlidesSortedChronologically
{
  char v3 = 1;
  return objc_msgSend(-[MPClusterController allSlides](self, "allSlides"), "sortedArrayUsingFunction:context:", sortSlidesByCaptureDate1, &v3);
}

- (id)clusterSlidesSortedChronologically:(id)a3
{
  char v4 = 1;
  return objc_msgSend(objc_msgSend(a3, "allSlides"), "sortedArrayUsingFunction:context:", sortSlidesByCaptureDate1, &v4);
}

- (id)clusterSlidesSortedByUserDefinedSortOrder:(id)a3 userDefinedSlideOrder:(id)a4
{
  id v5 = [a3 allSlides];
  return [v5 sortedArrayUsingFunction:sortSlidesByUserDefinedOrder1 context:a4];
}

- (void)sortClusterSlidesChronologically:(id *)a3
{
  id v4 = [*a3 allSlides];
  char v14 = 1;
  id v5 = [v4 sortedArrayUsingFunction:sortSlidesByCaptureDate1 context:&v14];
  [*a3 removeAllSlides];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*a3 addSlide:*(void *)(*((void *)&v10 + 1) + 8 * (void)v9)];
        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
    }
    while (v7);
  }
}

- (id)clustersBasedOnOrderedPaths:(id)a3
{
  id v5 = +[NSMutableArray array];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v6 = [a3 countByEnumeratingWithState:&v37 objects:v41 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v38;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v38 != v8) {
          objc_enumerationMutation(a3);
        }
        uint64_t v10 = *(void *)(*((void *)&v37 + 1) + 8 * (void)v9);
        id v11 = +[NSMutableArray array];
        id v12 = [(MPClusterController *)self yearClusterForAssetAtPath:v10];
        if (v12)
        {
          long long v13 = v12;
          [v12 rating];
          if (v14 >= self->mMinimumRequiredClusterRating && (uint64_t)[v13 slideCount] >= 2) {
            [v11 addObject:v13];
          }
        }
        id v15 = [(MPClusterController *)self monthClusterForAssetAtPath:v10];
        if (v15)
        {
          long long v16 = v15;
          [v15 rating];
          if (v17 >= self->mMinimumRequiredClusterRating && (uint64_t)[v16 slideCount] >= 2) {
            [v11 addObject:v16];
          }
        }
        id v18 = [(MPClusterController *)self monthOfYearClusterForAssetAtPath:v10];
        if (v18)
        {
          long long v19 = v18;
          [v18 rating];
          if (v20 >= self->mMinimumRequiredClusterRating && (uint64_t)[v19 slideCount] >= 2) {
            [v11 addObject:v19];
          }
        }
        id v21 = [(MPClusterController *)self dayOfYearClusterForAssetAtPath:v10];
        if (v21)
        {
          v22 = v21;
          [v21 rating];
          if (v23 >= self->mMinimumRequiredClusterRating && (uint64_t)[v22 slideCount] >= 2) {
            [v11 addObject:v22];
          }
        }
        id v24 = [(MPClusterController *)self hourOfYearClusterForAssetAtPath:v10];
        if (v24)
        {
          v25 = v24;
          [v24 rating];
          if (v26 >= self->mMinimumRequiredClusterRating && (uint64_t)[v25 slideCount] >= 2) {
            [v11 addObject:v25];
          }
        }
        id v27 = [(MPClusterController *)self minuteOfYearClusterForAssetAtPath:v10];
        if (v27)
        {
          v28 = v27;
          [v27 rating];
          if (v29 >= self->mMinimumRequiredClusterRating && (uint64_t)[v28 slideCount] >= 2) {
            [v11 addObject:v28];
          }
        }
        id v30 = [(MPClusterController *)self roundedFiveMinuteOfYearClusterForAssetAtPath:v10];
        if (v30)
        {
          v31 = v30;
          [v30 rating];
          if (v32 >= self->mMinimumRequiredClusterRating && (uint64_t)[v31 slideCount] >= 2) {
            [v11 addObject:v31];
          }
        }
        id v33 = [(MPClusterController *)self roundedFifteenMinuteOfYearClusterForAssetAtPath:v10];
        if (v33)
        {
          v34 = v33;
          [v33 rating];
          if (v35 >= self->mMinimumRequiredClusterRating && (uint64_t)[v34 slideCount] >= 2) {
            [v11 addObject:v34];
          }
        }
        [v5 addObject:v11];
        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [a3 countByEnumeratingWithState:&v37 objects:v41 count:16];
    }
    while (v7);
  }
  return v5;
}

- (void)resetAllUsageCounters
{
  id v2 = [(MPClusterController *)self allSlides];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      id v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * (void)v6) resetAllUsageCounters];
        id v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)flushClusters
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = [(NSMutableDictionary *)self->mSlides objectEnumerator];
  id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      long long v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * (void)v7) setUsableSlideClusters:0];
        long long v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
  [(NSMutableDictionary *)self->mSlides removeAllObjects];
  [(NSMutableDictionary *)self->mSlideClusters removeAllObjects];

  long long v8 = objc_alloc_init(MPCluster);
  self->mAllSlidesCluster = v8;
  [(MPCluster *)v8 setName:@"allSlides"];
  [(MPCluster *)self->mAllSlidesCluster setRating:0.0];
}

- (id)findBestCluster:(id)a3
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [a3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (!v4) {
    return 0;
  }
  id v5 = v4;
  id v6 = 0;
  long long v7 = 0;
  uint64_t v8 = *(void *)v13;
  do
  {
    for (i = 0; i != v5; i = (char *)i + 1)
    {
      if (*(void *)v13 != v8) {
        objc_enumerationMutation(a3);
      }
      long long v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
      if ((uint64_t)[v10 slideCount] > (uint64_t)v6)
      {
        id v6 = [v10 slideCount];
        long long v7 = v10;
      }
    }
    id v5 = [a3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  }
  while (v5);
  return v7;
}

- (id)findBestCluster:(id)a3 withMaxEffectSize:(int64_t)a4 idealEffectSize:(int64_t)a5
{
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v8 = [a3 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (!v8) {
    return 0;
  }
  id v9 = v8;
  int64_t v10 = 0;
  long long v11 = 0;
  uint64_t v12 = *(void *)v22;
  while (2)
  {
    for (i = 0; i != v9; i = (char *)i + 1)
    {
      uint64_t v14 = v10;
      if (*(void *)v22 != v12) {
        objc_enumerationMutation(a3);
      }
      long long v15 = *(void **)(*((void *)&v21 + 1) + 8 * i);
      id v16 = [v15 slideCount];
      int64_t v10 = (int64_t)v16 - a5;
      if (v16 == (id)a5) {
        return v15;
      }
      if ((uint64_t)v16 <= a4)
      {
        if (v10 < 1 || (double v17 = v15, v14) && v10 >= v14)
        {
          BOOL v18 = v14 < 1;
          BOOL v19 = v10 > a5;
          if (v18 && v19) {
            int64_t v10 = (int64_t)v16;
          }
          else {
            int64_t v10 = v14;
          }
          if (v18 && v19) {
            double v17 = v15;
          }
          else {
            double v17 = v11;
          }
        }
      }
      else
      {
        int64_t v10 = v14;
        double v17 = v11;
      }
      if (v17) {
        long long v11 = v17;
      }
      else {
        long long v11 = v15;
      }
    }
    id v9 = [a3 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v9) {
      continue;
    }
    break;
  }
  return v11;
}

- (id)findBestChronologicalCluster:(id)a3 startingWithSlide:(id)a4
{
  id v7 = +[NSMutableArray array];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = [a3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      long long v11 = 0;
      do
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(a3);
        }
        uint64_t v12 = *(void **)(*((void *)&v15 + 1) + 8 * (void)v11);
        if (objc_msgSend(v12, "clusterContainsSlideAtPath:", objc_msgSend(a4, "path")))
        {
          id v13 = [v12 allSlidesSortedChronologically];
          if ([v13 count])
          {
            if ([v13 objectAtIndex:0] == a4) {
              [v7 addObject:v12];
            }
          }
        }
        long long v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [a3 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }
  return [(MPClusterController *)self findBestCluster:v7];
}

- (id)findBestClusterBasedOnUserDefinedSlideOrder:(id)a3 startingWithSlide:(id)a4
{
  id v7 = +[NSMutableArray array];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = [a3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      long long v11 = 0;
      do
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(a3);
        }
        uint64_t v12 = *(void **)(*((void *)&v15 + 1) + 8 * (void)v11);
        if (objc_msgSend(v12, "clusterContainsSlideAtPath:", objc_msgSend(a4, "path")))
        {
          id v13 = objc_msgSend(objc_msgSend(v12, "allSlides"), "sortedArrayUsingFunction:context:", sortSlidesByUserDefinedOrder1, 0);
          if ([v13 count])
          {
            if ([v13 objectAtIndex:0] == a4) {
              [v7 addObject:v12];
            }
          }
        }
        long long v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [a3 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }
  return [(MPClusterController *)self findBestCluster:v7];
}

- (void)removeAllSingleSlideClusters
{
  [(MPClusterController *)self _removeAllSingleSlideClustersForClusterCategory:@"yearClusters"];
  [(MPClusterController *)self _removeAllSingleSlideClustersForClusterCategory:@"monthClusters"];
  [(MPClusterController *)self _removeAllSingleSlideClustersForClusterCategory:@"monthOfYearClusters"];
  [(MPClusterController *)self _removeAllSingleSlideClustersForClusterCategory:@"dayOfYearClusters"];
  [(MPClusterController *)self _removeAllSingleSlideClustersForClusterCategory:@"hourOfYearClusters"];
  [(MPClusterController *)self _removeAllSingleSlideClustersForClusterCategory:@"minuteOfYearClusters"];
  [(MPClusterController *)self _removeAllSingleSlideClustersForClusterCategory:@"roundedFiveMinuteOfYearClusters"];
  [(MPClusterController *)self _removeAllSingleSlideClustersForClusterCategory:@"roundedFifteenMinuteOfYearClusters"];
  [(MPClusterController *)self _removeAllSingleSlideClustersForClusterCategory:@"keywordYearClusters"];
  [(MPClusterController *)self _removeAllSingleSlideClustersForClusterCategory:@"locationClusters"];
}

- (void)updateYearClustersWithDate:(id)a3 ofSlide:(id)a4
{
  id v6 = [a3 descriptionWithFormat:@"'Y:'yyyy"];
  id v7 = [(NSMutableDictionary *)self->mSlideClusters objectForKey:@"yearClusters"];
  if (!v7)
  {
    id v7 = +[NSMutableDictionary dictionary];
    [(NSMutableDictionary *)self->mSlideClusters setObject:v7 forKey:@"yearClusters"];
  }
  id v8 = (MPCluster *)[v7 objectForKey:v6];
  if (!v8)
  {
    id v8 = objc_alloc_init(MPCluster);
    [(MPCluster *)v8 setName:v6];
    [v7 setObject:v8 forKey:v6];
  }
  [(MPCluster *)v8 addSlide:a4];
}

- (void)updateMonthClustersWithDate:(id)a3 ofSlide:(id)a4
{
  id v6 = [a3 descriptionWithFormat:@"'M:'MM"];
  id v7 = [(NSMutableDictionary *)self->mSlideClusters objectForKey:@"monthClusters"];
  if (!v7)
  {
    id v7 = +[NSMutableDictionary dictionary];
    [(NSMutableDictionary *)self->mSlideClusters setObject:v7 forKey:@"monthClusters"];
  }
  id v8 = (MPCluster *)[v7 objectForKey:v6];
  if (!v8)
  {
    id v8 = objc_alloc_init(MPCluster);
    [(MPCluster *)v8 setName:v6];
    [v7 setObject:v8 forKey:v6];
  }
  [(MPCluster *)v8 addSlide:a4];
}

- (void)updateMonthOfYearClustersWithDate:(id)a3 ofSlide:(id)a4
{
  id v6 = [a3 descriptionWithFormat:@"'Y-M:'yyyy-MM"];
  id v7 = [(NSMutableDictionary *)self->mSlideClusters objectForKey:@"monthOfYearClusters"];
  if (!v7)
  {
    id v7 = +[NSMutableDictionary dictionary];
    [(NSMutableDictionary *)self->mSlideClusters setObject:v7 forKey:@"monthOfYearClusters"];
  }
  id v8 = (MPCluster *)[v7 objectForKey:v6];
  if (!v8)
  {
    id v8 = objc_alloc_init(MPCluster);
    [(MPCluster *)v8 setName:v6];
    [v7 setObject:v8 forKey:v6];
  }
  [(MPCluster *)v8 addSlide:a4];
}

- (void)updateDayOfYearClustersWithDate:(id)a3 ofSlide:(id)a4
{
  id v6 = [a3 descriptionWithFormat:@"'Y-M-D:'yyyy-MM-dd"];
  id v7 = [(NSMutableDictionary *)self->mSlideClusters objectForKey:@"dayOfYearClusters"];
  if (!v7)
  {
    id v7 = +[NSMutableDictionary dictionary];
    [(NSMutableDictionary *)self->mSlideClusters setObject:v7 forKey:@"dayOfYearClusters"];
  }
  id v8 = (MPCluster *)[v7 objectForKey:v6];
  if (!v8)
  {
    id v8 = objc_alloc_init(MPCluster);
    [(MPCluster *)v8 setName:v6];
    [v7 setValue:v8 forKey:v6];
  }
  [(MPCluster *)v8 addSlide:a4];
}

- (void)updateHourOfYearClustersWithDate:(id)a3 ofSlide:(id)a4
{
  id v6 = [a3 descriptionWithFormat:@"'Y-M-D-H:'yyyy-MM-dd-HH"];
  id v7 = [(NSMutableDictionary *)self->mSlideClusters objectForKey:@"hourOfYearClusters"];
  if (!v7)
  {
    id v7 = +[NSMutableDictionary dictionary];
    [(NSMutableDictionary *)self->mSlideClusters setObject:v7 forKey:@"hourOfYearClusters"];
  }
  id v8 = (MPCluster *)[v7 objectForKey:v6];
  if (!v8)
  {
    id v8 = objc_alloc_init(MPCluster);
    [(MPCluster *)v8 setName:v6];
    [v7 setObject:v8 forKey:v6];
  }
  [(MPCluster *)v8 addSlide:a4];
}

- (void)updateMinuteOfYearClustersWithDate:(id)a3 ofSlide:(id)a4
{
  id v6 = [a3 descriptionWithFormat:@"'Y-M-D-H-M:'yyyy-MM-dd-HH-mm"];
  id v7 = [(NSMutableDictionary *)self->mSlideClusters objectForKey:@"minuteOfYearClusters"];
  if (!v7)
  {
    id v7 = +[NSMutableDictionary dictionary];
    [(NSMutableDictionary *)self->mSlideClusters setObject:v7 forKey:@"minuteOfYearClusters"];
  }
  id v8 = (MPCluster *)[v7 objectForKey:v6];
  if (!v8)
  {
    id v8 = objc_alloc_init(MPCluster);
    [(MPCluster *)v8 setName:v6];
    [v7 setObject:v8 forKey:v6];
  }
  [(MPCluster *)v8 addSlide:a4];
}

- (void)updateRoundedFiveMinuteOfYearClustersWithDate:(id)a3 ofSlide:(id)a4
{
  id v6 = objc_msgSend(objc_msgSend(a3, "roundMinuteToNearstFive"), "descriptionWithFormat:", @"'Y-M-D-H-r5M:'yyyy-MM-dd-HH-mm");
  id v7 = [(NSMutableDictionary *)self->mSlideClusters objectForKey:@"roundedFiveMinuteOfYearClusters"];
  if (!v7)
  {
    id v7 = +[NSMutableDictionary dictionary];
    [(NSMutableDictionary *)self->mSlideClusters setObject:v7 forKey:@"roundedFiveMinuteOfYearClusters"];
  }
  id v8 = (MPCluster *)[v7 objectForKey:v6];
  if (!v8)
  {
    id v8 = objc_alloc_init(MPCluster);
    [(MPCluster *)v8 setName:v6];
    [v7 setObject:v8 forKey:v6];
  }
  [(MPCluster *)v8 addSlide:a4];
}

- (void)updateRoundedFifteenMinuteOfYearClustersWithDate:(id)a3 ofSlide:(id)a4
{
  id v6 = objc_msgSend(objc_msgSend(a3, "roundMinuteToNearstFifteen"), "descriptionWithFormat:", @"'Y-M-D-H-r15M:'yyyy-MM-dd-HH-mm");
  id v7 = [(NSMutableDictionary *)self->mSlideClusters objectForKey:@"roundedFifteenMinuteOfYearClusters"];
  if (!v7)
  {
    id v7 = +[NSMutableDictionary dictionary];
    [(NSMutableDictionary *)self->mSlideClusters setObject:v7 forKey:@"roundedFifteenMinuteOfYearClusters"];
  }
  id v8 = (MPCluster *)[v7 objectForKey:v6];
  if (!v8)
  {
    id v8 = objc_alloc_init(MPCluster);
    [(MPCluster *)v8 setName:v6];
    [v7 setObject:v8 forKey:v6];
  }
  [(MPCluster *)v8 addSlide:a4];
}

- (void)updateAllSlidesClusterWithSlide:(id)a3
{
}

- (id)yearClusters
{
  id v2 = [(NSMutableDictionary *)self->mSlideClusters objectForKey:@"yearClusters"];
  return [v2 allValues];
}

- (id)monthClusters
{
  id v2 = [(NSMutableDictionary *)self->mSlideClusters objectForKey:@"monthClusters"];
  return [v2 allValues];
}

- (id)monthOfYearClusters
{
  id v2 = [(NSMutableDictionary *)self->mSlideClusters objectForKey:@"monthOfYearClusters"];
  return [v2 allValues];
}

- (id)dayOfYearClusters
{
  id v2 = [(NSMutableDictionary *)self->mSlideClusters objectForKey:@"dayOfYearClusters"];
  return [v2 allValues];
}

- (id)hourOfYearClusters
{
  id v2 = [(NSMutableDictionary *)self->mSlideClusters objectForKey:@"hourOfYearClusters"];
  return [v2 allValues];
}

- (id)minuteOfYearClusters
{
  id v2 = [(NSMutableDictionary *)self->mSlideClusters objectForKey:@"minuteOfYearClusters"];
  return [v2 allValues];
}

- (id)roundedFiveMinuteOfYearClusters
{
  id v2 = [(NSMutableDictionary *)self->mSlideClusters objectForKey:@"roundedFiveMinuteOfYearClusters"];
  return [v2 allValues];
}

- (id)roundedFifteenMinuteOfYearClusters
{
  id v2 = [(NSMutableDictionary *)self->mSlideClusters objectForKey:@"roundedFifteenMinuteOfYearClusters"];
  return [v2 allValues];
}

- (id)keywordClusters
{
  id v2 = [(NSMutableDictionary *)self->mSlideClusters objectForKey:@"keywordClusters"];
  return [v2 allValues];
}

- (id)locationClusters
{
  id v2 = [(NSMutableDictionary *)self->mSlideClusters objectForKey:@"locationClusters"];
  return [v2 allValues];
}

- (id)userProvidedClusters
{
  id v2 = [(NSMutableDictionary *)self->mSlideClusters objectForKey:@"userDefinedClusters"];
  return [v2 allValues];
}

- (id)yearClusterForAssetAtPath:(id)a3
{
  id v5 = [(NSMutableDictionary *)self->mSlideClusters objectForKey:@"yearClusters"];
  id v6 = objc_msgSend(-[MPDocument creationDateForPath:](self->mAuthoredDocument, "creationDateForPath:", a3), "descriptionWithFormat:", @"'Y:'yyyy");
  return [v5 objectForKey:v6];
}

- (id)monthClusterForAssetAtPath:(id)a3
{
  id v5 = [(NSMutableDictionary *)self->mSlideClusters objectForKey:@"monthClusters"];
  id v6 = objc_msgSend(-[MPDocument creationDateForPath:](self->mAuthoredDocument, "creationDateForPath:", a3), "descriptionWithFormat:", @"'M:'MM");
  return [v5 objectForKey:v6];
}

- (id)monthOfYearClusterForAssetAtPath:(id)a3
{
  id v5 = [(NSMutableDictionary *)self->mSlideClusters objectForKey:@"monthOfYearClusters"];
  id v6 = objc_msgSend(-[MPDocument creationDateForPath:](self->mAuthoredDocument, "creationDateForPath:", a3), "descriptionWithFormat:", @"'Y-M:'yyyy-MM");
  return [v5 objectForKey:v6];
}

- (id)dayOfYearClusterForAssetAtPath:(id)a3
{
  id v5 = [(NSMutableDictionary *)self->mSlideClusters objectForKey:@"dayOfYearClusters"];
  id v6 = objc_msgSend(-[MPDocument creationDateForPath:](self->mAuthoredDocument, "creationDateForPath:", a3), "descriptionWithFormat:", @"'Y-M-D:'yyyy-MM-dd");
  return [v5 objectForKey:v6];
}

- (id)hourOfYearClusterForAssetAtPath:(id)a3
{
  id v5 = [(NSMutableDictionary *)self->mSlideClusters objectForKey:@"hourOfYearClusters"];
  id v6 = objc_msgSend(-[MPDocument creationDateForPath:](self->mAuthoredDocument, "creationDateForPath:", a3), "descriptionWithFormat:", @"'Y-M-D-H:'yyyy-MM-dd-HH");
  return [v5 objectForKey:v6];
}

- (id)minuteOfYearClusterForAssetAtPath:(id)a3
{
  id v5 = [(NSMutableDictionary *)self->mSlideClusters objectForKey:@"minuteOfYearClusters"];
  id v6 = objc_msgSend(-[MPDocument creationDateForPath:](self->mAuthoredDocument, "creationDateForPath:", a3), "descriptionWithFormat:", @"'Y-M-D-H-M:'yyyy-MM-dd-HH-mm");
  return [v5 objectForKey:v6];
}

- (id)roundedFiveMinuteOfYearClusterForAssetAtPath:(id)a3
{
  id v5 = [(NSMutableDictionary *)self->mSlideClusters objectForKey:@"roundedFiveMinuteOfYearClusters"];
  id v6 = objc_msgSend(objc_msgSend(-[MPDocument creationDateForPath:](self->mAuthoredDocument, "creationDateForPath:", a3), "roundMinuteToNearstFive"), "descriptionWithFormat:", @"'Y-M-D-H-r5M:'yyyy-MM-dd-HH-mm");
  return [v5 objectForKey:v6];
}

- (id)roundedFifteenMinuteOfYearClusterForAssetAtPath:(id)a3
{
  id v5 = [(NSMutableDictionary *)self->mSlideClusters objectForKey:@"roundedFifteenMinuteOfYearClusters"];
  id v6 = objc_msgSend(objc_msgSend(-[MPDocument creationDateForPath:](self->mAuthoredDocument, "creationDateForPath:", a3), "roundMinuteToNearstFifteen"), "descriptionWithFormat:", @"'Y-M-D-H-r15M:'yyyy-MM-dd-HH-mm");
  return [v5 objectForKey:v6];
}

- (void)addPaths:(id)a3 toUserDefinedCluster:(id)a4
{
  id v7 = [a3 count];
  if (a4 && v7)
  {
    id v8 = [(NSMutableDictionary *)self->mSlideClusters objectForKey:@"userDefinedClusters"];
    if (!v8)
    {
      id v8 = +[NSMutableDictionary dictionary];
      [(NSMutableDictionary *)self->mSlideClusters setObject:v8 forKey:@"userDefinedClusters"];
    }
    id v9 = (MPCluster *)[v8 objectForKey:a4];
    if (!v9)
    {
      id v9 = objc_alloc_init(MPCluster);
      [v8 setObject:v9 forKey:a4];
      [(MPCluster *)v9 setRating:10.0];
    }
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v10 = [a3 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v17;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v17 != v12) {
            objc_enumerationMutation(a3);
          }
          uint64_t v14 = *(void *)(*((void *)&v16 + 1) + 8 * i);
          long long v15 = (MPClusterSlide *)[(NSMutableDictionary *)self->mSlides objectForKey:v14];
          if (!v15)
          {
            long long v15 = objc_alloc_init(MPClusterSlide);
            [(MPClusterSlide *)v15 setPath:v14];
          }
          [(MPCluster *)v9 addSlide:v15];
        }
        id v11 = [a3 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v11);
    }
  }
}

- (void)createLocationClustersForPaths:(id)a3
{
  id v21 = +[NSMutableDictionary dictionary];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v4 = [a3 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v23;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v23 != v6) {
          objc_enumerationMutation(a3);
        }
        uint64_t v8 = *(void *)(*((void *)&v22 + 1) + 8 * i);
        id v9 = [(MPDocument *)self->mAuthoredDocument latitudeForPath:v8];
        id v10 = [(MPDocument *)self->mAuthoredDocument longitudeForPath:v8];
        if (v9) {
          BOOL v11 = v10 == 0;
        }
        else {
          BOOL v11 = 1;
        }
        uint64_t v12 = &stru_1AC850;
        if (!v11) {
          uint64_t v12 = (__CFString *)[&stru_1AC850 stringByAppendingPathComponent:+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@:%@", v9, v10)];
        }
        id v13 = [(MPDocument *)self->mAuthoredDocument placeForPath:v8];
        if (v13) {
          uint64_t v12 = (__CFString *)[(__CFString *)v12 stringByAppendingPathComponent:v13];
        }
        id v14 = [(MPDocument *)self->mAuthoredDocument cityForPath:v8];
        if (v14) {
          uint64_t v12 = (__CFString *)[(__CFString *)v12 stringByAppendingPathComponent:v14];
        }
        id v15 = [(MPDocument *)self->mAuthoredDocument stateForPath:v8];
        if (v15) {
          uint64_t v12 = (__CFString *)[(__CFString *)v12 stringByAppendingPathComponent:v15];
        }
        id v16 = [(MPDocument *)self->mAuthoredDocument countryForPath:v8];
        if (v16) {
          uint64_t v12 = (__CFString *)[(__CFString *)v12 stringByAppendingPathComponent:v16];
        }
        if ([(__CFString *)v12 length])
        {
          id v17 = v21;
          if ([(__CFString *)v12 length])
          {
            id v17 = v21;
            do
            {
              id v18 = [(__CFString *)v12 lastPathComponent];
              id v17 = [v17 objectForKey:v18];
              if (!v17)
              {
                objc_msgSend(0, "setObject:forKey:", +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"), v18);
                id v17 = [0 objectForKey:v18];
              }
              uint64_t v12 = (__CFString *)[(__CFString *)v12 stringByDeletingLastPathComponent];
            }
            while ([(__CFString *)v12 length]);
          }
          id v19 = [v17 objectForKey:@"photos"];
          if (!v19)
          {
            id v19 = +[NSMutableArray array];
            [v17 setObject:v19 forKey:@"photos"];
          }
          [v19 addObject:v8];
        }
      }
      id v5 = [a3 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v5);
  }
}

- (id)orderedAndPrioritizedSlideClusters
{
  id v3 = [(MPClusterController *)self prioritizedSlideClustersDictionary];
  id v4 = [v3 allKeys];
  id v5 = +[NSMutableArray array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v4);
        }
        id v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        [v10 floatValue];
        if (self->mMinimumRequiredClusterRating <= v11) {
          [v5 addObject:v10];
        }
      }
      id v7 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }
  id v12 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithArray:", objc_msgSend(v5, "sortedArrayUsingSelector:", "compare:"));
  id v13 = +[NSMutableArray array];
  id v14 = (char *)[v12 count] - 1;
  if ((uint64_t)v14 >= 0)
  {
    do
      objc_msgSend(v13, "addObjectsFromArray:", objc_msgSend(v3, "objectForKey:", objc_msgSend(v12, "objectAtIndex:", v14--)));
    while (v14 != (char *)-1);
  }
  if (![v13 count]) {
    [v13 addObject:self->mAllSlidesCluster];
  }

  return v13;
}

- (id)prioritizedSlideClustersDictionary
{
  [(MPClusterController *)self updateClusterRatings];
  id v3 = +[NSMutableDictionary dictionary];
  id v4 = [(MPClusterController *)self yearClusters];
  long long v155 = 0u;
  long long v156 = 0u;
  long long v157 = 0u;
  long long v158 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v155 objects:v169 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v156;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v156 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v155 + 1) + 8 * i);
        if ((uint64_t)[v9 slideCount] >= 2)
        {
          [v9 rating];
          float v11 = v10;
          *(float *)&double v10 = v11;
          id v12 = objc_msgSend(v3, "objectForKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v10));
          if (!v12)
          {
            id v12 = +[NSMutableArray array];
            *(float *)&double v13 = v11;
            objc_msgSend(v3, "setObject:forKey:", v12, +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v13));
          }
          [v12 addObject:v9];
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v155 objects:v169 count:16];
    }
    while (v6);
  }
  id v14 = [(MPClusterController *)self monthClusters];
  long long v151 = 0u;
  long long v152 = 0u;
  long long v153 = 0u;
  long long v154 = 0u;
  id v15 = [v14 countByEnumeratingWithState:&v151 objects:v168 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v152;
    do
    {
      for (j = 0; j != v16; j = (char *)j + 1)
      {
        if (*(void *)v152 != v17) {
          objc_enumerationMutation(v14);
        }
        long long v19 = *(void **)(*((void *)&v151 + 1) + 8 * (void)j);
        if ((uint64_t)[v19 slideCount] >= 2)
        {
          [v19 rating];
          float v21 = v20;
          *(float *)&double v20 = v21;
          id v22 = objc_msgSend(v3, "objectForKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v20));
          if (!v22)
          {
            id v22 = +[NSMutableArray array];
            *(float *)&double v23 = v21;
            objc_msgSend(v3, "setObject:forKey:", v22, +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v23));
          }
          [v22 addObject:v19];
        }
      }
      id v16 = [v14 countByEnumeratingWithState:&v151 objects:v168 count:16];
    }
    while (v16);
  }
  id v24 = [(MPClusterController *)self monthOfYearClusters];
  long long v147 = 0u;
  long long v148 = 0u;
  long long v149 = 0u;
  long long v150 = 0u;
  id v25 = [v24 countByEnumeratingWithState:&v147 objects:v167 count:16];
  if (v25)
  {
    id v26 = v25;
    uint64_t v27 = *(void *)v148;
    do
    {
      for (k = 0; k != v26; k = (char *)k + 1)
      {
        if (*(void *)v148 != v27) {
          objc_enumerationMutation(v24);
        }
        double v29 = *(void **)(*((void *)&v147 + 1) + 8 * (void)k);
        if ((uint64_t)[v29 slideCount] >= 2)
        {
          [v29 rating];
          float v31 = v30;
          *(float *)&double v30 = v31;
          id v32 = objc_msgSend(v3, "objectForKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v30));
          if (!v32)
          {
            id v32 = +[NSMutableArray array];
            *(float *)&double v33 = v31;
            objc_msgSend(v3, "setObject:forKey:", v32, +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v33));
          }
          [v32 addObject:v29];
        }
      }
      id v26 = [v24 countByEnumeratingWithState:&v147 objects:v167 count:16];
    }
    while (v26);
  }
  id v34 = [(MPClusterController *)self dayOfYearClusters];
  long long v143 = 0u;
  long long v144 = 0u;
  long long v145 = 0u;
  long long v146 = 0u;
  id v35 = [v34 countByEnumeratingWithState:&v143 objects:v166 count:16];
  if (v35)
  {
    id v36 = v35;
    uint64_t v37 = *(void *)v144;
    do
    {
      for (m = 0; m != v36; m = (char *)m + 1)
      {
        if (*(void *)v144 != v37) {
          objc_enumerationMutation(v34);
        }
        long long v39 = *(void **)(*((void *)&v143 + 1) + 8 * (void)m);
        if ((uint64_t)[v39 slideCount] >= 2)
        {
          [v39 rating];
          float v41 = v40;
          *(float *)&double v40 = v41;
          id v42 = objc_msgSend(v3, "objectForKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v40));
          if (!v42)
          {
            id v42 = +[NSMutableArray array];
            *(float *)&double v43 = v41;
            objc_msgSend(v3, "setObject:forKey:", v42, +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v43));
          }
          [v42 addObject:v39];
        }
      }
      id v36 = [v34 countByEnumeratingWithState:&v143 objects:v166 count:16];
    }
    while (v36);
  }
  id v44 = [(MPClusterController *)self hourOfYearClusters];
  long long v139 = 0u;
  long long v140 = 0u;
  long long v141 = 0u;
  long long v142 = 0u;
  id v45 = [v44 countByEnumeratingWithState:&v139 objects:v165 count:16];
  if (v45)
  {
    id v46 = v45;
    uint64_t v47 = *(void *)v140;
    do
    {
      for (n = 0; n != v46; n = (char *)n + 1)
      {
        if (*(void *)v140 != v47) {
          objc_enumerationMutation(v44);
        }
        v49 = *(void **)(*((void *)&v139 + 1) + 8 * (void)n);
        if ((uint64_t)[v49 slideCount] >= 2)
        {
          [v49 rating];
          float v51 = v50;
          *(float *)&double v50 = v51;
          id v52 = objc_msgSend(v3, "objectForKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v50));
          if (!v52)
          {
            id v52 = +[NSMutableArray array];
            *(float *)&double v53 = v51;
            objc_msgSend(v3, "setObject:forKey:", v52, +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v53));
          }
          [v52 addObject:v49];
        }
      }
      id v46 = [v44 countByEnumeratingWithState:&v139 objects:v165 count:16];
    }
    while (v46);
  }
  id v54 = [(MPClusterController *)self minuteOfYearClusters];
  long long v135 = 0u;
  long long v136 = 0u;
  long long v137 = 0u;
  long long v138 = 0u;
  id v55 = [v54 countByEnumeratingWithState:&v135 objects:v164 count:16];
  if (v55)
  {
    id v56 = v55;
    uint64_t v57 = *(void *)v136;
    do
    {
      for (ii = 0; ii != v56; ii = (char *)ii + 1)
      {
        if (*(void *)v136 != v57) {
          objc_enumerationMutation(v54);
        }
        v59 = *(void **)(*((void *)&v135 + 1) + 8 * (void)ii);
        if ((uint64_t)[v59 slideCount] >= 2)
        {
          [v59 rating];
          float v61 = v60;
          *(float *)&double v60 = v61;
          id v62 = objc_msgSend(v3, "objectForKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v60));
          if (!v62)
          {
            id v62 = +[NSMutableArray array];
            *(float *)&double v63 = v61;
            objc_msgSend(v3, "setObject:forKey:", v62, +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v63));
          }
          [v62 addObject:v59];
        }
      }
      id v56 = [v54 countByEnumeratingWithState:&v135 objects:v164 count:16];
    }
    while (v56);
  }
  id v64 = [(MPClusterController *)self roundedFiveMinuteOfYearClusters];
  long long v131 = 0u;
  long long v132 = 0u;
  long long v133 = 0u;
  long long v134 = 0u;
  id v65 = [v64 countByEnumeratingWithState:&v131 objects:v163 count:16];
  if (v65)
  {
    id v66 = v65;
    uint64_t v67 = *(void *)v132;
    do
    {
      for (jj = 0; jj != v66; jj = (char *)jj + 1)
      {
        if (*(void *)v132 != v67) {
          objc_enumerationMutation(v64);
        }
        v69 = *(void **)(*((void *)&v131 + 1) + 8 * (void)jj);
        if ((uint64_t)[v69 slideCount] >= 2)
        {
          [v69 rating];
          float v71 = v70;
          *(float *)&double v70 = v71;
          id v72 = objc_msgSend(v3, "objectForKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v70));
          if (!v72)
          {
            id v72 = +[NSMutableArray array];
            *(float *)&double v73 = v71;
            objc_msgSend(v3, "setObject:forKey:", v72, +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v73));
          }
          [v72 addObject:v69];
        }
      }
      id v66 = [v64 countByEnumeratingWithState:&v131 objects:v163 count:16];
    }
    while (v66);
  }
  id v74 = [(MPClusterController *)self roundedFifteenMinuteOfYearClusters];
  long long v127 = 0u;
  long long v128 = 0u;
  long long v129 = 0u;
  long long v130 = 0u;
  id v75 = [v74 countByEnumeratingWithState:&v127 objects:v162 count:16];
  if (v75)
  {
    id v76 = v75;
    uint64_t v77 = *(void *)v128;
    do
    {
      for (kk = 0; kk != v76; kk = (char *)kk + 1)
      {
        if (*(void *)v128 != v77) {
          objc_enumerationMutation(v74);
        }
        v79 = *(void **)(*((void *)&v127 + 1) + 8 * (void)kk);
        if ((uint64_t)[v79 slideCount] >= 2)
        {
          [v79 rating];
          float v81 = v80;
          *(float *)&double v80 = v81;
          id v82 = objc_msgSend(v3, "objectForKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v80));
          if (!v82)
          {
            id v82 = +[NSMutableArray array];
            *(float *)&double v83 = v81;
            objc_msgSend(v3, "setObject:forKey:", v82, +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v83));
          }
          [v82 addObject:v79];
        }
      }
      id v76 = [v74 countByEnumeratingWithState:&v127 objects:v162 count:16];
    }
    while (v76);
  }
  id v84 = [(MPClusterController *)self keywordClusters];
  long long v123 = 0u;
  long long v124 = 0u;
  long long v125 = 0u;
  long long v126 = 0u;
  id v85 = [v84 countByEnumeratingWithState:&v123 objects:v161 count:16];
  if (v85)
  {
    id v86 = v85;
    uint64_t v87 = *(void *)v124;
    do
    {
      for (mm = 0; mm != v86; mm = (char *)mm + 1)
      {
        if (*(void *)v124 != v87) {
          objc_enumerationMutation(v84);
        }
        v89 = *(void **)(*((void *)&v123 + 1) + 8 * (void)mm);
        if ((uint64_t)[v89 slideCount] >= 2)
        {
          [v89 rating];
          float v91 = v90;
          *(float *)&double v90 = v91;
          id v92 = objc_msgSend(v3, "objectForKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v90));
          if (!v92)
          {
            id v92 = +[NSMutableArray array];
            *(float *)&double v93 = v91;
            objc_msgSend(v3, "setObject:forKey:", v92, +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v93));
          }
          [v92 addObject:v89];
        }
      }
      id v86 = [v84 countByEnumeratingWithState:&v123 objects:v161 count:16];
    }
    while (v86);
  }
  id v94 = [(MPClusterController *)self locationClusters];
  long long v119 = 0u;
  long long v120 = 0u;
  long long v121 = 0u;
  long long v122 = 0u;
  id v95 = [v94 countByEnumeratingWithState:&v119 objects:v160 count:16];
  if (v95)
  {
    id v96 = v95;
    uint64_t v97 = *(void *)v120;
    do
    {
      for (nn = 0; nn != v96; nn = (char *)nn + 1)
      {
        if (*(void *)v120 != v97) {
          objc_enumerationMutation(v94);
        }
        v99 = *(void **)(*((void *)&v119 + 1) + 8 * (void)nn);
        if ((uint64_t)[v99 slideCount] >= 2)
        {
          [v99 rating];
          float v101 = v100;
          *(float *)&double v100 = v101;
          id v102 = objc_msgSend(v3, "objectForKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v100));
          if (!v102)
          {
            id v102 = +[NSMutableArray array];
            *(float *)&double v103 = v101;
            objc_msgSend(v3, "setObject:forKey:", v102, +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v103));
          }
          [v102 addObject:v99];
        }
      }
      id v96 = [v94 countByEnumeratingWithState:&v119 objects:v160 count:16];
    }
    while (v96);
  }
  id v104 = [(MPClusterController *)self userProvidedClusters];
  long long v115 = 0u;
  long long v116 = 0u;
  long long v117 = 0u;
  long long v118 = 0u;
  id v105 = [v104 countByEnumeratingWithState:&v115 objects:v159 count:16];
  if (v105)
  {
    id v106 = v105;
    uint64_t v107 = *(void *)v116;
    do
    {
      for (i1 = 0; i1 != v106; i1 = (char *)i1 + 1)
      {
        if (*(void *)v116 != v107) {
          objc_enumerationMutation(v104);
        }
        v109 = *(void **)(*((void *)&v115 + 1) + 8 * (void)i1);
        if ((uint64_t)[v109 slideCount] >= 2)
        {
          [v109 rating];
          float v111 = v110;
          *(float *)&double v110 = v111;
          id v112 = objc_msgSend(v3, "objectForKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v110));
          if (!v112)
          {
            id v112 = +[NSMutableArray array];
            *(float *)&double v113 = v111;
            objc_msgSend(v3, "setObject:forKey:", v112, +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v113));
          }
          [v112 addObject:v109];
        }
      }
      id v106 = [v104 countByEnumeratingWithState:&v115 objects:v159 count:16];
    }
    while (v106);
  }
  return v3;
}

- (void)updateClusterRatings
{
  [(MPClusterController *)self removeAllSingleSlideClusters];
  [(MPClusterController *)self updateRatingsForYearClusters];
  [(MPClusterController *)self updateRatingsForMonthClusters];
  [(MPClusterController *)self updateRatingsForMonthOfYearClusters];
  [(MPClusterController *)self updateRatingsForDayOfYearClusters];
  [(MPClusterController *)self updateRatingsForHourOfYearClusters];
  [(MPClusterController *)self updateRatingsForMinuteOfYearClusters];
  [(MPClusterController *)self updateRatingsForRoundedFiveMinuteOfYearClusters];
  [(MPClusterController *)self updateRatingsForRoundedFifteenMinuteOfYearClusters];
  [(MPClusterController *)self updateRatingsForKeywordClusters];
  [(MPClusterController *)self updateRatingsForLocationClusters];
}

- (void)updateRatingsForYearClusters
{
  id v2 = [(MPClusterController *)self yearClusters];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v3 = [v2 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = 0;
    uint64_t v6 = *(void *)v24;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v24 != v6) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        objc_msgSend(objc_msgSend(v8, "name"), "intValue");
        v5 += (uint64_t)[v8 slideCount];
      }
      id v4 = [v2 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v4);
    double v9 = (double)v5;
  }
  else
  {
    double v9 = 0.0;
  }
  id v10 = [v2 count];
  if ((uint64_t)v10 >= 3)
  {
    if ((unint64_t)v10 >= 6)
    {
      if ((unint64_t)v10 >= 0xB) {
        double v11 = 0.25;
      }
      else {
        double v11 = 0.2;
      }
    }
    else
    {
      double v11 = 0.1;
    }
  }
  else
  {
    double v11 = 0.05;
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v12 = [v2 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v20;
    do
    {
      for (j = 0; j != v13; j = (char *)j + 1)
      {
        if (*(void *)v20 != v14) {
          objc_enumerationMutation(v2);
        }
        id v16 = *(void **)(*((void *)&v19 + 1) + 8 * (void)j);
        id v17 = [v16 slideCount];
        double v18 = 0.0;
        if ((uint64_t)v17 >= 2) {
          double v18 = 1.0 - (double)(uint64_t)objc_msgSend(v16, "slideCount", 0.0) / v9;
        }
        [v16 setRating:v18 * 5.0 + v11 * 5.0];
      }
      id v13 = [v2 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v13);
  }
}

- (void)updateRatingsForMonthClusters
{
  id v2 = [(MPClusterController *)self monthClusters];
  id v3 = [v2 count];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v4 = [v2 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = 0;
    uint64_t v7 = *(void *)v23;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v23 != v7) {
          objc_enumerationMutation(v2);
        }
        v6 += (uint64_t)[*(id *)(*((void *)&v22 + 1) + 8 * i) slideCount];
      }
      id v5 = [v2 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v5);
    double v9 = (double)v6;
  }
  else
  {
    double v9 = 0.0;
  }
  if ((uint64_t)v3 >= 3)
  {
    if ((unint64_t)v3 >= 5)
    {
      if ((unint64_t)v3 >= 9) {
        double v10 = 0.25;
      }
      else {
        double v10 = 0.2;
      }
    }
    else
    {
      double v10 = 0.1;
    }
  }
  else
  {
    double v10 = 0.05;
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v11 = [v2 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v19;
    do
    {
      for (j = 0; j != v12; j = (char *)j + 1)
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v2);
        }
        id v15 = *(void **)(*((void *)&v18 + 1) + 8 * (void)j);
        id v16 = [v15 slideCount];
        double v17 = 0.0;
        if ((uint64_t)v16 >= 2) {
          double v17 = 1.0 - (double)(uint64_t)objc_msgSend(v15, "slideCount", 0.0) / v9;
        }
        [v15 setRating:v17 * 5.0 + v10 * 5.0];
      }
      id v12 = [v2 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v12);
  }
}

- (void)updateRatingsForMonthOfYearClusters
{
  id v2 = [(MPClusterController *)self monthOfYearClusters];
  id v3 = [v2 count];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v4 = [v2 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = 0;
    uint64_t v7 = *(void *)v23;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v23 != v7) {
          objc_enumerationMutation(v2);
        }
        v6 += (uint64_t)[*(id *)(*((void *)&v22 + 1) + 8 * i) slideCount];
      }
      id v5 = [v2 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v5);
    double v9 = (double)v6;
  }
  else
  {
    double v9 = 0.0;
  }
  if ((uint64_t)v3 >= 3)
  {
    if ((unint64_t)v3 >= 6)
    {
      if ((unint64_t)v3 >= 0xB) {
        double v10 = 0.25;
      }
      else {
        double v10 = 0.2;
      }
    }
    else
    {
      double v10 = 0.1;
    }
  }
  else
  {
    double v10 = 0.05;
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v11 = [v2 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v19;
    do
    {
      for (j = 0; j != v12; j = (char *)j + 1)
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v2);
        }
        id v15 = *(void **)(*((void *)&v18 + 1) + 8 * (void)j);
        id v16 = [v15 slideCount];
        double v17 = 0.0;
        if ((uint64_t)v16 >= 2) {
          double v17 = 1.0 - (double)(uint64_t)objc_msgSend(v15, "slideCount", 0.0) / v9;
        }
        [v15 setRating:v17 * 5.0 + v10 * 5.0];
      }
      id v12 = [v2 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v12);
  }
}

- (void)updateRatingsForDayOfYearClusters
{
  id v2 = [(MPClusterController *)self dayOfYearClusters];
  id v3 = [v2 count];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v4 = [v2 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = 0;
    uint64_t v7 = *(void *)v23;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v23 != v7) {
          objc_enumerationMutation(v2);
        }
        v6 += (uint64_t)[*(id *)(*((void *)&v22 + 1) + 8 * i) slideCount];
      }
      id v5 = [v2 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v5);
    double v9 = (double)v6;
  }
  else
  {
    double v9 = 0.0;
  }
  if ((uint64_t)v3 >= 3)
  {
    if ((unint64_t)v3 >= 6)
    {
      if ((unint64_t)v3 >= 0xB) {
        double v10 = 0.25;
      }
      else {
        double v10 = 0.2;
      }
    }
    else
    {
      double v10 = 0.1;
    }
  }
  else
  {
    double v10 = 0.05;
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v11 = [v2 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v19;
    do
    {
      for (j = 0; j != v12; j = (char *)j + 1)
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v2);
        }
        id v15 = *(void **)(*((void *)&v18 + 1) + 8 * (void)j);
        id v16 = [v15 slideCount];
        double v17 = 0.0;
        if ((uint64_t)v16 >= 2) {
          double v17 = 1.0 - (double)(uint64_t)objc_msgSend(v15, "slideCount", 0.0) / v9;
        }
        [v15 setRating:v17 * 5.0 + v10 * 5.0];
      }
      id v12 = [v2 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v12);
  }
}

- (void)updateRatingsForHourOfYearClusters
{
  [(NSDate *)self->mNewestSlideTimestamp timeIntervalSinceDate:self->mOldestSlideTimestamp];
  double v4 = v3;
  id v5 = [(MPClusterController *)self hourOfYearClusters];
  id v6 = [v5 count];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v7 = [v5 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = 0;
    uint64_t v10 = *(void *)v26;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v26 != v10) {
          objc_enumerationMutation(v5);
        }
        v9 += (uint64_t)[*(id *)(*((void *)&v25 + 1) + 8 * i) slideCount];
      }
      id v8 = [v5 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v8);
    double v12 = (double)v9;
  }
  else
  {
    double v12 = 0.0;
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v13 = [v5 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v13)
  {
    id v14 = v13;
    double v15 = (1.0 - 1.0 / (v4 / 3600.0)) * (1.0 - 1.0 / (double)(uint64_t)v6) * 0.3;
    uint64_t v16 = *(void *)v22;
    do
    {
      for (j = 0; j != v14; j = (char *)j + 1)
      {
        if (*(void *)v22 != v16) {
          objc_enumerationMutation(v5);
        }
        long long v18 = *(void **)(*((void *)&v21 + 1) + 8 * (void)j);
        id v19 = [v18 slideCount];
        double v20 = 0.0;
        if ((uint64_t)v19 >= 2) {
          double v20 = 1.0 - (double)(uint64_t)objc_msgSend(v18, "slideCount", 0.0) / v12;
        }
        [v18 setRating:v20 + v20 + v15 * 2.0];
      }
      id v14 = [v5 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v14);
  }
}

- (void)updateRatingsForMinuteOfYearClusters
{
  id v2 = [(MPClusterController *)self minuteOfYearClusters];
  id v3 = [v2 count];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v4 = [v2 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = 0;
    uint64_t v7 = *(void *)v23;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v23 != v7) {
          objc_enumerationMutation(v2);
        }
        v6 += (uint64_t)[*(id *)(*((void *)&v22 + 1) + 8 * i) slideCount];
      }
      id v5 = [v2 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v5);
    double v9 = (double)v6;
  }
  else
  {
    double v9 = 0.0;
  }
  if ((uint64_t)v3 >= 4)
  {
    if ((unint64_t)v3 >= 7)
    {
      if ((unint64_t)v3 >= 0xD) {
        double v10 = 0.25;
      }
      else {
        double v10 = 0.2;
      }
    }
    else
    {
      double v10 = 0.1;
    }
  }
  else
  {
    double v10 = 0.05;
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v11 = [v2 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v19;
    do
    {
      for (j = 0; j != v12; j = (char *)j + 1)
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v2);
        }
        double v15 = *(void **)(*((void *)&v18 + 1) + 8 * (void)j);
        id v16 = [v15 slideCount];
        double v17 = 0.0;
        if ((uint64_t)v16 >= 2) {
          double v17 = 1.0 - (double)(uint64_t)objc_msgSend(v15, "slideCount", 0.0) / v9;
        }
        [v15 setRating:v17 * 10.0 + v10 * 10.0];
      }
      id v12 = [v2 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v12);
  }
}

- (void)updateRatingsForRoundedFiveMinuteOfYearClusters
{
  id v2 = [(MPClusterController *)self roundedFiveMinuteOfYearClusters];
  id v3 = [v2 count];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v4 = [v2 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = 0;
    uint64_t v7 = *(void *)v23;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v23 != v7) {
          objc_enumerationMutation(v2);
        }
        v6 += (uint64_t)[*(id *)(*((void *)&v22 + 1) + 8 * i) slideCount];
      }
      id v5 = [v2 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v5);
    double v9 = (double)v6;
  }
  else
  {
    double v9 = 0.0;
  }
  if ((uint64_t)v3 >= 4)
  {
    if ((unint64_t)v3 >= 7)
    {
      if ((unint64_t)v3 >= 0xD) {
        double v10 = 0.25;
      }
      else {
        double v10 = 0.2;
      }
    }
    else
    {
      double v10 = 0.1;
    }
  }
  else
  {
    double v10 = 0.05;
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v11 = [v2 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v19;
    do
    {
      for (j = 0; j != v12; j = (char *)j + 1)
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v2);
        }
        double v15 = *(void **)(*((void *)&v18 + 1) + 8 * (void)j);
        id v16 = [v15 slideCount];
        double v17 = 0.0;
        if ((uint64_t)v16 >= 2) {
          double v17 = 1.0 - (double)(uint64_t)objc_msgSend(v15, "slideCount", 0.0) / v9;
        }
        [v15 setRating:v17 * 10.0 + v10 * 10.0];
      }
      id v12 = [v2 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v12);
  }
}

- (void)updateRatingsForRoundedFifteenMinuteOfYearClusters
{
  id v2 = [(MPClusterController *)self roundedFifteenMinuteOfYearClusters];
  id v3 = [v2 count];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v4 = [v2 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = 0;
    uint64_t v7 = *(void *)v23;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v23 != v7) {
          objc_enumerationMutation(v2);
        }
        v6 += (uint64_t)[*(id *)(*((void *)&v22 + 1) + 8 * i) slideCount];
      }
      id v5 = [v2 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v5);
    double v9 = (double)v6;
  }
  else
  {
    double v9 = 0.0;
  }
  if ((uint64_t)v3 >= 4)
  {
    if ((unint64_t)v3 >= 7)
    {
      if ((unint64_t)v3 >= 0xD) {
        double v10 = 0.25;
      }
      else {
        double v10 = 0.2;
      }
    }
    else
    {
      double v10 = 0.1;
    }
  }
  else
  {
    double v10 = 0.05;
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v11 = [v2 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v19;
    do
    {
      for (j = 0; j != v12; j = (char *)j + 1)
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v2);
        }
        double v15 = *(void **)(*((void *)&v18 + 1) + 8 * (void)j);
        id v16 = [v15 slideCount];
        double v17 = 0.0;
        if ((uint64_t)v16 >= 2) {
          double v17 = 1.0 - (double)(uint64_t)objc_msgSend(v15, "slideCount", 0.0) / v9;
        }
        [v15 setRating:v17 * 10.0 + v10 * 10.0];
      }
      id v12 = [v2 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v12);
  }
}

- (void)updateRatingsForKeywordClusters
{
  id v2 = [(MPClusterController *)self keywordClusters];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * (void)v6) setRating:7.5];
        uint64_t v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)updateRatingsForLocationClusters
{
  id v2 = [(MPClusterController *)self locationClusters];
  id v3 = [v2 count];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v4 = [v2 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = 0;
    uint64_t v7 = *(void *)v23;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v23 != v7) {
          objc_enumerationMutation(v2);
        }
        v6 += (uint64_t)[*(id *)(*((void *)&v22 + 1) + 8 * i) slideCount];
      }
      id v5 = [v2 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v5);
    double v9 = (double)v6;
  }
  else
  {
    double v9 = 0.0;
  }
  if ((uint64_t)v3 >= 4)
  {
    if ((unint64_t)v3 >= 7)
    {
      if ((unint64_t)v3 >= 0xD) {
        double v10 = 0.25;
      }
      else {
        double v10 = 0.2;
      }
    }
    else
    {
      double v10 = 0.1;
    }
  }
  else
  {
    double v10 = 0.05;
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v11 = [v2 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v19;
    do
    {
      for (j = 0; j != v12; j = (char *)j + 1)
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v2);
        }
        double v15 = *(void **)(*((void *)&v18 + 1) + 8 * (void)j);
        id v16 = [v15 slideCount];
        double v17 = 0.0;
        if ((uint64_t)v16 >= 2) {
          double v17 = 1.0 - (double)(uint64_t)objc_msgSend(v15, "slideCount", 0.0) / v9;
        }
        [v15 setRating:v17 * 5.0 + v10 * 5.0];
      }
      id v12 = [v2 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v12);
  }
}

- (void)dumpClustersStatistics
{
  NSLog(@"\n\n", a2);
  NSLog(@"--------------------");
  NSLog(@"Clusters statistics:");
  NSLog(@"--------------------");
  NSLog(@"Year clusters:");
  NSLog(@"--------------");
  long long v143 = self;
  long long v230 = 0u;
  long long v231 = 0u;
  long long v232 = 0u;
  long long v233 = 0u;
  id obj = [(MPClusterController *)self yearClusters];
  id v3 = [obj countByEnumeratingWithState:&v230 objects:v253 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v231;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v231 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void **)(*((void *)&v230 + 1) + 8 * i);
        id v8 = [v7 name];
        id v9 = [v7 usageCountDescription];
        [v7 rating];
        NSLog(@"cluster[%@]: usageCount = (%@), rating = (%.2f), slide count = %d", v8, v9, v10, [v7 slideCount]);
        long long v229 = 0u;
        long long v228 = 0u;
        long long v227 = 0u;
        long long v226 = 0u;
        id v11 = [v7 allSlides];
        id v12 = [v11 countByEnumeratingWithState:&v226 objects:v252 count:16];
        if (v12)
        {
          id v13 = v12;
          uint64_t v14 = 0;
          uint64_t v15 = *(void *)v227;
          do
          {
            for (j = 0; j != v13; j = (char *)j + 1)
            {
              if (*(void *)v227 != v15) {
                objc_enumerationMutation(v11);
              }
              NSLog(@"             slide[%d]:  %@", (char *)j + v14, objc_msgSend(objc_msgSend(*(id *)(*((void *)&v226 + 1) + 8 * (void)j), "path"), "lastPathComponent"));
            }
            id v13 = [v11 countByEnumeratingWithState:&v226 objects:v252 count:16];
            uint64_t v14 = (v14 + j);
          }
          while (v13);
        }
      }
      id v4 = [obj countByEnumeratingWithState:&v230 objects:v253 count:16];
    }
    while (v4);
  }
  NSLog(@"Month clusters:");
  NSLog(@"---------------");
  long long v222 = 0u;
  long long v223 = 0u;
  long long v224 = 0u;
  long long v225 = 0u;
  id obja = [(MPClusterController *)v143 monthClusters];
  id v17 = [obja countByEnumeratingWithState:&v222 objects:v251 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v223;
    do
    {
      for (k = 0; k != v18; k = (char *)k + 1)
      {
        if (*(void *)v223 != v19) {
          objc_enumerationMutation(obja);
        }
        long long v21 = *(void **)(*((void *)&v222 + 1) + 8 * (void)k);
        id v22 = [v21 name];
        id v23 = [v21 usageCountDescription];
        [v21 rating];
        NSLog(@"cluster[%@]: usageCount = (%@), rating = (%.2f), slide count = %d", v22, v23, v24, [v21 slideCount]);
        long long v221 = 0u;
        long long v220 = 0u;
        long long v219 = 0u;
        long long v218 = 0u;
        id v25 = [v21 allSlides];
        id v26 = [v25 countByEnumeratingWithState:&v218 objects:v250 count:16];
        if (v26)
        {
          id v27 = v26;
          uint64_t v28 = 0;
          uint64_t v29 = *(void *)v219;
          do
          {
            for (m = 0; m != v27; m = (char *)m + 1)
            {
              if (*(void *)v219 != v29) {
                objc_enumerationMutation(v25);
              }
              NSLog(@"             slide[%d]:  %@", (char *)m + v28, objc_msgSend(objc_msgSend(*(id *)(*((void *)&v218 + 1) + 8 * (void)m), "path"), "lastPathComponent"));
            }
            id v27 = [v25 countByEnumeratingWithState:&v218 objects:v250 count:16];
            uint64_t v28 = (v28 + m);
          }
          while (v27);
        }
      }
      id v18 = [obja countByEnumeratingWithState:&v222 objects:v251 count:16];
    }
    while (v18);
  }
  NSLog(@"MonthOfYear clusters:");
  NSLog(@"---------------------");
  long long v214 = 0u;
  long long v215 = 0u;
  long long v216 = 0u;
  long long v217 = 0u;
  id objb = [(MPClusterController *)v143 monthOfYearClusters];
  id v31 = [objb countByEnumeratingWithState:&v214 objects:v249 count:16];
  if (v31)
  {
    id v32 = v31;
    uint64_t v33 = *(void *)v215;
    do
    {
      for (n = 0; n != v32; n = (char *)n + 1)
      {
        if (*(void *)v215 != v33) {
          objc_enumerationMutation(objb);
        }
        id v35 = *(void **)(*((void *)&v214 + 1) + 8 * (void)n);
        id v36 = [v35 name];
        id v37 = [v35 usageCountDescription];
        [v35 rating];
        NSLog(@"cluster[%@]: usageCount = (%@), rating = (%.2f), slide count = %d", v36, v37, v38, [v35 slideCount]);
        long long v212 = 0u;
        long long v213 = 0u;
        long long v210 = 0u;
        long long v211 = 0u;
        id v39 = [v35 allSlides];
        id v40 = [v39 countByEnumeratingWithState:&v210 objects:v248 count:16];
        if (v40)
        {
          id v41 = v40;
          uint64_t v42 = 0;
          uint64_t v43 = *(void *)v211;
          do
          {
            for (ii = 0; ii != v41; ii = (char *)ii + 1)
            {
              if (*(void *)v211 != v43) {
                objc_enumerationMutation(v39);
              }
              NSLog(@"             slide[%d]:  %@", (char *)ii + v42, objc_msgSend(objc_msgSend(*(id *)(*((void *)&v210 + 1) + 8 * (void)ii), "path"), "lastPathComponent"));
            }
            id v41 = [v39 countByEnumeratingWithState:&v210 objects:v248 count:16];
            uint64_t v42 = (v42 + ii);
          }
          while (v41);
        }
      }
      id v32 = [objb countByEnumeratingWithState:&v214 objects:v249 count:16];
    }
    while (v32);
  }
  NSLog(@"DayOfYear clusters:");
  NSLog(@"-------------------");
  long long v206 = 0u;
  long long v207 = 0u;
  long long v208 = 0u;
  long long v209 = 0u;
  id objc = [(MPClusterController *)v143 dayOfYearClusters];
  id v45 = [objc countByEnumeratingWithState:&v206 objects:v247 count:16];
  if (v45)
  {
    id v46 = v45;
    uint64_t v47 = *(void *)v207;
    do
    {
      for (jj = 0; jj != v46; jj = (char *)jj + 1)
      {
        if (*(void *)v207 != v47) {
          objc_enumerationMutation(objc);
        }
        v49 = *(void **)(*((void *)&v206 + 1) + 8 * (void)jj);
        id v50 = [v49 name];
        id v51 = [v49 usageCountDescription];
        [v49 rating];
        NSLog(@"cluster[%@]: usageCount = (%@), rating = (%.2f), slide count = %d", v50, v51, v52, [v49 slideCount]);
        long long v204 = 0u;
        long long v205 = 0u;
        long long v202 = 0u;
        long long v203 = 0u;
        id v53 = [v49 allSlides];
        id v54 = [v53 countByEnumeratingWithState:&v202 objects:v246 count:16];
        if (v54)
        {
          id v55 = v54;
          uint64_t v56 = 0;
          uint64_t v57 = *(void *)v203;
          do
          {
            for (kk = 0; kk != v55; kk = (char *)kk + 1)
            {
              if (*(void *)v203 != v57) {
                objc_enumerationMutation(v53);
              }
              NSLog(@"             slide[%d]:  %@", (char *)kk + v56, objc_msgSend(objc_msgSend(*(id *)(*((void *)&v202 + 1) + 8 * (void)kk), "path"), "lastPathComponent"));
            }
            id v55 = [v53 countByEnumeratingWithState:&v202 objects:v246 count:16];
            uint64_t v56 = (v56 + kk);
          }
          while (v55);
        }
      }
      id v46 = [objc countByEnumeratingWithState:&v206 objects:v247 count:16];
    }
    while (v46);
  }
  NSLog(@"HourOfYear clusters:");
  NSLog(@"--------------------");
  long long v198 = 0u;
  long long v199 = 0u;
  long long v200 = 0u;
  long long v201 = 0u;
  id objd = [(MPClusterController *)v143 hourOfYearClusters];
  id v59 = [objd countByEnumeratingWithState:&v198 objects:v245 count:16];
  if (v59)
  {
    id v60 = v59;
    uint64_t v61 = *(void *)v199;
    do
    {
      for (mm = 0; mm != v60; mm = (char *)mm + 1)
      {
        if (*(void *)v199 != v61) {
          objc_enumerationMutation(objd);
        }
        double v63 = *(void **)(*((void *)&v198 + 1) + 8 * (void)mm);
        id v64 = [v63 name];
        id v65 = [v63 usageCountDescription];
        [v63 rating];
        NSLog(@"cluster[%@]: usageCount = (%@), rating = (%.2f), slide count = %d", v64, v65, v66, [v63 slideCount]);
        long long v196 = 0u;
        long long v197 = 0u;
        long long v194 = 0u;
        long long v195 = 0u;
        id v67 = [v63 allSlides];
        id v68 = [v67 countByEnumeratingWithState:&v194 objects:v244 count:16];
        if (v68)
        {
          id v69 = v68;
          uint64_t v70 = 0;
          uint64_t v71 = *(void *)v195;
          do
          {
            for (nn = 0; nn != v69; nn = (char *)nn + 1)
            {
              if (*(void *)v195 != v71) {
                objc_enumerationMutation(v67);
              }
              NSLog(@"             slide[%d]:  %@", (char *)nn + v70, objc_msgSend(objc_msgSend(*(id *)(*((void *)&v194 + 1) + 8 * (void)nn), "path"), "lastPathComponent"));
            }
            id v69 = [v67 countByEnumeratingWithState:&v194 objects:v244 count:16];
            uint64_t v70 = (v70 + nn);
          }
          while (v69);
        }
      }
      id v60 = [objd countByEnumeratingWithState:&v198 objects:v245 count:16];
    }
    while (v60);
  }
  NSLog(@"MinuteOfYear clusters:");
  NSLog(@"----------------------");
  long long v190 = 0u;
  long long v191 = 0u;
  long long v192 = 0u;
  long long v193 = 0u;
  id obje = [(MPClusterController *)v143 minuteOfYearClusters];
  id v73 = [obje countByEnumeratingWithState:&v190 objects:v243 count:16];
  if (v73)
  {
    id v74 = v73;
    uint64_t v75 = *(void *)v191;
    do
    {
      for (i1 = 0; i1 != v74; i1 = (char *)i1 + 1)
      {
        if (*(void *)v191 != v75) {
          objc_enumerationMutation(obje);
        }
        uint64_t v77 = *(void **)(*((void *)&v190 + 1) + 8 * (void)i1);
        id v78 = [v77 name];
        id v79 = [v77 usageCountDescription];
        [v77 rating];
        NSLog(@"cluster[%@]: usageCount = (%@), rating = (%.2f), slide count = %d", v78, v79, v80, [v77 slideCount]);
        long long v188 = 0u;
        long long v189 = 0u;
        long long v186 = 0u;
        long long v187 = 0u;
        id v81 = [v77 allSlides];
        id v82 = [v81 countByEnumeratingWithState:&v186 objects:v242 count:16];
        if (v82)
        {
          id v83 = v82;
          uint64_t v84 = 0;
          uint64_t v85 = *(void *)v187;
          do
          {
            for (i2 = 0; i2 != v83; i2 = (char *)i2 + 1)
            {
              if (*(void *)v187 != v85) {
                objc_enumerationMutation(v81);
              }
              NSLog(@"             slide[%d]:  %@", (char *)i2 + v84, objc_msgSend(objc_msgSend(*(id *)(*((void *)&v186 + 1) + 8 * (void)i2), "path"), "lastPathComponent"));
            }
            id v83 = [v81 countByEnumeratingWithState:&v186 objects:v242 count:16];
            uint64_t v84 = (v84 + i2);
          }
          while (v83);
        }
      }
      id v74 = [obje countByEnumeratingWithState:&v190 objects:v243 count:16];
    }
    while (v74);
  }
  NSLog(@"RoundedFiveMinuteOfYear clusters:");
  NSLog(@"----------------------");
  long long v182 = 0u;
  long long v183 = 0u;
  long long v184 = 0u;
  long long v185 = 0u;
  id objf = [(MPClusterController *)v143 roundedFiveMinuteOfYearClusters];
  id v87 = [objf countByEnumeratingWithState:&v182 objects:v241 count:16];
  if (v87)
  {
    id v88 = v87;
    uint64_t v89 = *(void *)v183;
    do
    {
      for (i3 = 0; i3 != v88; i3 = (char *)i3 + 1)
      {
        if (*(void *)v183 != v89) {
          objc_enumerationMutation(objf);
        }
        float v91 = *(void **)(*((void *)&v182 + 1) + 8 * (void)i3);
        id v92 = [v91 name];
        id v93 = [v91 usageCountDescription];
        [v91 rating];
        NSLog(@"cluster[%@]: usageCount = (%@), rating = (%.2f), slide count = %d", v92, v93, v94, [v91 slideCount]);
        long long v180 = 0u;
        long long v181 = 0u;
        long long v178 = 0u;
        long long v179 = 0u;
        id v95 = [v91 allSlides];
        id v96 = [v95 countByEnumeratingWithState:&v178 objects:v240 count:16];
        if (v96)
        {
          id v97 = v96;
          uint64_t v98 = 0;
          uint64_t v99 = *(void *)v179;
          do
          {
            for (i4 = 0; i4 != v97; i4 = (char *)i4 + 1)
            {
              if (*(void *)v179 != v99) {
                objc_enumerationMutation(v95);
              }
              NSLog(@"             slide[%d]:  %@", (char *)i4 + v98, objc_msgSend(objc_msgSend(*(id *)(*((void *)&v178 + 1) + 8 * (void)i4), "path"), "lastPathComponent"));
            }
            id v97 = [v95 countByEnumeratingWithState:&v178 objects:v240 count:16];
            uint64_t v98 = (v98 + i4);
          }
          while (v97);
        }
      }
      id v88 = [objf countByEnumeratingWithState:&v182 objects:v241 count:16];
    }
    while (v88);
  }
  NSLog(@"RoundedFifteenMinuteOfYear clusters:");
  NSLog(@"----------------------");
  long long v174 = 0u;
  long long v175 = 0u;
  long long v176 = 0u;
  long long v177 = 0u;
  id objg = [(MPClusterController *)v143 roundedFifteenMinuteOfYearClusters];
  id v101 = [objg countByEnumeratingWithState:&v174 objects:v239 count:16];
  if (v101)
  {
    id v102 = v101;
    uint64_t v103 = *(void *)v175;
    do
    {
      for (i5 = 0; i5 != v102; i5 = (char *)i5 + 1)
      {
        if (*(void *)v175 != v103) {
          objc_enumerationMutation(objg);
        }
        id v105 = *(void **)(*((void *)&v174 + 1) + 8 * (void)i5);
        id v106 = [v105 name];
        id v107 = [v105 usageCountDescription];
        [v105 rating];
        NSLog(@"cluster[%@]: usageCount = (%@), rating = (%.2f), slide count = %d", v106, v107, v108, [v105 slideCount]);
        long long v172 = 0u;
        long long v173 = 0u;
        long long v170 = 0u;
        long long v171 = 0u;
        id v109 = [v105 allSlides];
        id v110 = [v109 countByEnumeratingWithState:&v170 objects:v238 count:16];
        if (v110)
        {
          id v111 = v110;
          uint64_t v112 = 0;
          uint64_t v113 = *(void *)v171;
          do
          {
            for (i6 = 0; i6 != v111; i6 = (char *)i6 + 1)
            {
              if (*(void *)v171 != v113) {
                objc_enumerationMutation(v109);
              }
              NSLog(@"             slide[%d]:  %@", (char *)i6 + v112, objc_msgSend(objc_msgSend(*(id *)(*((void *)&v170 + 1) + 8 * (void)i6), "path"), "lastPathComponent"));
            }
            id v111 = [v109 countByEnumeratingWithState:&v170 objects:v238 count:16];
            uint64_t v112 = (v112 + i6);
          }
          while (v111);
        }
      }
      id v102 = [objg countByEnumeratingWithState:&v174 objects:v239 count:16];
    }
    while (v102);
  }
  NSLog(@"Keyword clusters:");
  NSLog(@"-----------------");
  long long v166 = 0u;
  long long v167 = 0u;
  long long v168 = 0u;
  long long v169 = 0u;
  id objh = [(MPClusterController *)v143 keywordClusters];
  id v115 = [objh countByEnumeratingWithState:&v166 objects:v237 count:16];
  if (v115)
  {
    id v116 = v115;
    uint64_t v117 = *(void *)v167;
    do
    {
      for (i7 = 0; i7 != v116; i7 = (char *)i7 + 1)
      {
        if (*(void *)v167 != v117) {
          objc_enumerationMutation(objh);
        }
        long long v119 = *(void **)(*((void *)&v166 + 1) + 8 * (void)i7);
        id v120 = [v119 name];
        id v121 = [v119 usageCountDescription];
        [v119 rating];
        NSLog(@"cluster[%@]: usageCount = (%@), rating = (%.2f), slide count = %d", v120, v121, v122, [v119 slideCount]);
        long long v164 = 0u;
        long long v165 = 0u;
        long long v162 = 0u;
        long long v163 = 0u;
        id v123 = [v119 allSlides];
        id v124 = [v123 countByEnumeratingWithState:&v162 objects:v236 count:16];
        if (v124)
        {
          id v125 = v124;
          uint64_t v126 = 0;
          uint64_t v127 = *(void *)v163;
          do
          {
            for (i8 = 0; i8 != v125; i8 = (char *)i8 + 1)
            {
              if (*(void *)v163 != v127) {
                objc_enumerationMutation(v123);
              }
              NSLog(@"             slide[%d]:  %@", (char *)i8 + v126, objc_msgSend(objc_msgSend(*(id *)(*((void *)&v162 + 1) + 8 * (void)i8), "path"), "lastPathComponent"));
            }
            id v125 = [v123 countByEnumeratingWithState:&v162 objects:v236 count:16];
            uint64_t v126 = (v126 + i8);
          }
          while (v125);
        }
      }
      id v116 = [objh countByEnumeratingWithState:&v166 objects:v237 count:16];
    }
    while (v116);
  }
  NSLog(@"Location clusters:");
  NSLog(@"------------------");
  long long v158 = 0u;
  long long v159 = 0u;
  long long v160 = 0u;
  long long v161 = 0u;
  id obji = [(MPClusterController *)v143 locationClusters];
  id v129 = [obji countByEnumeratingWithState:&v158 objects:v235 count:16];
  if (v129)
  {
    id v130 = v129;
    uint64_t v131 = *(void *)v159;
    do
    {
      for (i9 = 0; i9 != v130; i9 = (char *)i9 + 1)
      {
        if (*(void *)v159 != v131) {
          objc_enumerationMutation(obji);
        }
        long long v133 = *(void **)(*((void *)&v158 + 1) + 8 * (void)i9);
        id v134 = [v133 name];
        id v135 = [v133 usageCountDescription];
        [v133 rating];
        NSLog(@"cluster[%@]: usageCount = (%@), rating = (%.2f), slide count = %d", v134, v135, v136, [v133 slideCount]);
        long long v156 = 0u;
        long long v157 = 0u;
        long long v154 = 0u;
        long long v155 = 0u;
        id v137 = [v133 allSlides];
        id v138 = [v137 countByEnumeratingWithState:&v154 objects:v234 count:16];
        if (v138)
        {
          id v139 = v138;
          uint64_t v140 = 0;
          uint64_t v141 = *(void *)v155;
          do
          {
            for (i10 = 0; i10 != v139; i10 = (char *)i10 + 1)
            {
              if (*(void *)v155 != v141) {
                objc_enumerationMutation(v137);
              }
              NSLog(@"             slide[%d]:  %@", (char *)i10 + v140, objc_msgSend(objc_msgSend(*(id *)(*((void *)&v154 + 1) + 8 * (void)i10), "path"), "lastPathComponent"));
            }
            id v139 = [v137 countByEnumeratingWithState:&v154 objects:v234 count:16];
            uint64_t v140 = (v140 + i10);
          }
          while (v139);
        }
      }
      id v130 = [obji countByEnumeratingWithState:&v158 objects:v235 count:16];
    }
    while (v130);
  }
}

- (void)dumpSlidesStatistics
{
  NSLog(@"\n\n", a2);
  NSLog(@"==================");
  NSLog(@"Slides statistics:");
  NSLog(@"==================\n");
  id v3 = [(MPClusterController *)self allSlidesSortedByUsage];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = 0;
    uint64_t v7 = *(void *)v10;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v3);
        }
        NSLog(@"slide[%d]: usageCount = (%@), filename = %@", (char *)v8 + v6, [*(id *)(*((void *)&v9 + 1) + 8 * (void)v8) usageCountDescription], objc_msgSend(objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * (void)v8), "path"), "lastPathComponent"));
        id v8 = (char *)v8 + 1;
      }
      while (v5 != v8);
      id v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      uint64_t v6 = (v6 + v8);
    }
    while (v5);
  }
}

- (void)_removeAllSingleSlideClustersForClusterCategory:(id)a3
{
  id v5 = -[NSMutableDictionary objectForKey:](self->mSlideClusters, "objectForKey:");
  id v6 = +[NSMutableDictionary dictionary];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        id v12 = [v5 objectForKey:v11];
        if ((uint64_t)[v12 slideCount] >= 2) {
          [v6 setObject:v12 forKey:v11];
        }
      }
      id v8 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }
  [(NSMutableDictionary *)self->mSlideClusters setObject:v6 forKey:a3];
}

@end