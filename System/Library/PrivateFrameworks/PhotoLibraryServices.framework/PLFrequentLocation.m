@interface PLFrequentLocation
- (BOOL)isEqual:(id)a3;
- (BOOL)isSimilarToFrequentLocation:(id)a3;
- (BOOL)isWithinDistance:(double)a3 toCoordinate:(CLLocationCoordinate2D)a4;
- (CLLocationCoordinate2D)coordinate;
- (NSDateInterval)dateInterval;
- (NSMutableArray)sortedMoments;
- (NSSet)momentsSet;
- (NSString)description;
- (PLFrequentLocation)initWithSortedMoments:(id)a3;
- (PLMomentProcessingProtocol)centroid;
- (void)_invalidateLazyProperties;
- (void)addMomentToSortedMoments:(id)a3;
- (void)setCentroid:(id)a3;
- (void)setCoordinate:(CLLocationCoordinate2D)a3;
- (void)setDateInterval:(id)a3;
- (void)setMomentsSet:(id)a3;
- (void)setSortedMoments:(id)a3;
@end

@implementation PLFrequentLocation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_centroid, 0);
  objc_storeStrong((id *)&self->_momentsSet, 0);
  objc_storeStrong((id *)&self->_dateInterval, 0);
  objc_storeStrong((id *)&self->_sortedMoments, 0);
}

- (void)setCentroid:(id)a3
{
}

- (void)setMomentsSet:(id)a3
{
}

- (void)setDateInterval:(id)a3
{
}

- (void)setCoordinate:(CLLocationCoordinate2D)a3
{
  self->_coordinate = a3;
}

- (CLLocationCoordinate2D)coordinate
{
  double latitude = self->_coordinate.latitude;
  double longitude = self->_coordinate.longitude;
  result.double longitude = longitude;
  result.double latitude = latitude;
  return result;
}

- (void)setSortedMoments:(id)a3
{
}

- (NSMutableArray)sortedMoments
{
  return self->_sortedMoments;
}

- (PLMomentProcessingProtocol)centroid
{
  v2 = PLResultWithUnfairLock();
  return (PLMomentProcessingProtocol *)v2;
}

id __30__PLFrequentLocation_centroid__block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1 + 32);
  v3 = (void *)v2[5];
  if (!v3)
  {
    [v2 coordinate];
    uint64_t v24 = v4;
    uint64_t v25 = v5;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    v6 = [*(id *)(a1 + 32) sortedMoments];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v26 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v21;
      double v10 = 1.79769313e308;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v21 != v9) {
            objc_enumerationMutation(v6);
          }
          v12 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          objc_msgSend(v12, "pl_coordinate", 0, 0);
          uint64_t v18 = v13;
          uint64_t v19 = v14;
          CLLocationCoordinate2DGetDistanceFrom();
          if (v15 < v10)
          {
            double v16 = v15;
            objc_storeStrong((id *)(*(void *)(a1 + 32) + 40), v12);
            double v10 = v16;
          }
        }
        uint64_t v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v26, 16, v18, v19);
      }
      while (v8);
    }

    v3 = *(void **)(*(void *)(a1 + 32) + 40);
  }
  return v3;
}

- (NSSet)momentsSet
{
  v2 = PLResultWithUnfairLock();
  return (NSSet *)v2;
}

id __32__PLFrequentLocation_momentsSet__block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3 = (void *)v2[4];
  if (!v3)
  {
    uint64_t v4 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v5 = [v2 sortedMoments];
    uint64_t v6 = [v4 setWithArray:v5];
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = *(void **)(v7 + 32);
    *(void *)(v7 + 32) = v6;

    v3 = *(void **)(*(void *)(a1 + 32) + 32);
  }
  return v3;
}

- (NSDateInterval)dateInterval
{
  v2 = PLResultWithUnfairLock();
  return (NSDateInterval *)v2;
}

id __34__PLFrequentLocation_dateInterval__block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3 = (void *)v2[3];
  if (!v3)
  {
    uint64_t v4 = [v2 sortedMoments];
    uint64_t v5 = [v4 firstObject];
    uint64_t v6 = [v4 lastObject];
    uint64_t v7 = (void *)v6;
    if (v5) {
      BOOL v8 = v6 == 0;
    }
    else {
      BOOL v8 = 1;
    }
    if (!v8)
    {
      id v9 = objc_alloc(MEMORY[0x1E4F28C18]);
      double v10 = objc_msgSend(v5, "pl_startDate");
      v11 = objc_msgSend(v7, "pl_endDate");
      uint64_t v12 = [v9 initWithStartDate:v10 endDate:v11];
      uint64_t v13 = *(void *)(a1 + 32);
      uint64_t v14 = *(void **)(v13 + 24);
      *(void *)(v13 + 24) = v12;
    }
    v3 = *(void **)(*(void *)(a1 + 32) + 24);
  }
  return v3;
}

- (void)_invalidateLazyProperties
{
}

void __47__PLFrequentLocation__invalidateLazyProperties__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 24);
  *(void *)(v2 + 24) = 0;

  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(v4 + 32);
  *(void *)(v4 + 32) = 0;

  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = 0;
}

- (void)addMomentToSortedMoments:(id)a3
{
  id v30 = a3;
  uint64_t v4 = [(PLFrequentLocation *)self sortedMoments];
  unint64_t v5 = [v4 count];

  if (v5)
  {
    [(PLFrequentLocation *)self coordinate];
    double v7 = v6;
    double v9 = v8;
    objc_msgSend(v30, "pl_coordinate");
    PLCentroidForCoordinates(v7, v9, (double)v5, v10, v11, 1.0);
  }
  else
  {
    objc_msgSend(v30, "pl_coordinate");
  }
  -[PLFrequentLocation setCoordinate:](self, "setCoordinate:");
  uint64_t v12 = [(PLFrequentLocation *)self sortedMoments];
  uint64_t v13 = [v12 count];

  uint64_t v14 = 0;
  if (v13)
  {
    while (1)
    {
      double v15 = [(PLFrequentLocation *)self sortedMoments];
      double v16 = [v15 objectAtIndexedSubscript:v14];

      v17 = objc_msgSend(v30, "pl_startDate");
      uint64_t v18 = objc_msgSend(v16, "pl_startDate");
      uint64_t v19 = [v17 compare:v18];

      if (v19 == -1) {
        break;
      }
      if (v13 == ++v14)
      {
        uint64_t v14 = v13;
        break;
      }
    }
  }
  uint64_t v20 = v14;
  while (1)
  {
    uint64_t v21 = v20 - 1;
    if (v20 - 1 < 0)
    {
      uint64_t v20 = v14;
      goto LABEL_15;
    }
    long long v22 = [(PLFrequentLocation *)self sortedMoments];
    long long v23 = [v22 objectAtIndexedSubscript:v20 - 1];

    uint64_t v24 = objc_msgSend(v30, "pl_startDate");
    uint64_t v25 = objc_msgSend(v23, "pl_startDate");
    uint64_t v26 = [v24 compare:v25];

    if (v26) {
      break;
    }
    unint64_t v27 = [v30 hash];
    unint64_t v28 = [v23 hash];

    --v20;
    if (v27 > v28)
    {
      uint64_t v20 = v21 + 1;
      goto LABEL_15;
    }
  }

LABEL_15:
  v29 = [(PLFrequentLocation *)self sortedMoments];
  [v29 insertObject:v30 atIndex:v20];

  [(PLFrequentLocation *)self _invalidateLazyProperties];
}

- (BOOL)isWithinDistance:(double)a3 toCoordinate:(CLLocationCoordinate2D)a4
{
  BOOL v5 = CLLocationCoordinate2DIsValid(a4);
  if (v5)
  {
    CLLocationCoordinate2DGetDistanceFrom();
    LOBYTE(v5) = v6 <= a3;
  }
  return v5;
}

- (BOOL)isSimilarToFrequentLocation:(id)a3
{
  id v4 = a3;
  [v4 coordinate];
  if (-[PLFrequentLocation isWithinDistance:toCoordinate:](self, "isWithinDistance:toCoordinate:", 50.0, v5, v6))
  {
    double v7 = [(PLFrequentLocation *)self dateInterval];
    double v8 = [v4 dateInterval];
    double v9 = [v7 intersectionWithDateInterval:v8];
    [v9 duration];
    double v11 = v10;

    [v7 duration];
    double v13 = v12;
    [v8 duration];
    if (v13 >= v14) {
      double v14 = v13;
    }
    BOOL v15 = v11 / v14 >= 0.8;
  }
  else
  {
    BOOL v15 = 0;
  }

  return v15;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PLFrequentLocation *)a3;
  if (v4 == self)
  {
    char v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      double v5 = v4;
      double v6 = [(PLFrequentLocation *)self sortedMoments];
      double v7 = [(PLFrequentLocation *)v5 sortedMoments];

      char v8 = [v6 isEqualToArray:v7];
    }
    else
    {
      char v8 = 0;
    }
  }

  return v8;
}

- (NSString)description
{
  v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)PLFrequentLocation;
  id v4 = [(PLFrequentLocation *)&v11 description];
  double v5 = [(PLFrequentLocation *)self dateInterval];
  double v6 = [v5 startDate];
  double v7 = [(PLFrequentLocation *)self dateInterval];
  char v8 = [v7 endDate];
  double v9 = [v3 stringWithFormat:@"%@ [%@ - %@] <%f,%f> %lu moments", v4, v6, v8, *(void *)&self->_coordinate.latitude, *(void *)&self->_coordinate.longitude, -[NSMutableArray count](self->_sortedMoments, "count")];

  return (NSString *)v9;
}

- (PLFrequentLocation)initWithSortedMoments:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PLFrequentLocation;
  double v5 = [(PLFrequentLocation *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 mutableCopy];
    sortedMoments = v5->_sortedMoments;
    v5->_sortedMoments = (NSMutableArray *)v6;

    if ([v4 count] == 1)
    {
      char v8 = [v4 firstObject];
      objc_msgSend(v8, "pl_coordinate");
      v5->_coordinate.double latitude = v9;
      v5->_coordinate.double longitude = v10;
    }
    else if ((unint64_t)[v4 count] < 2)
    {
      v5->_coordinate = (CLLocationCoordinate2D)*MEMORY[0x1E4F1E750];
    }
    else
    {
      v5->_coordinate.double latitude = PLCentroidForMoments(v4);
      v5->_coordinate.double longitude = v11;
    }
    v5->_lock._os_unfair_lock_opaque = 0;
  }

  return v5;
}

@end