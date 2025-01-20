@interface RTVisitPipelineModuleBurstNoiseFilter
+ (unint64_t)getIndexInArray:(id)a3 followedByCount:(unint64_t)a4;
- (BOOL)firstTimeProcessingModule;
- (NSMutableArray)potentialNoiseLocations;
- (RTDistanceCalculator)distanceCalculator;
- (RTVisitPipelineModuleBurstNoiseFilter)initWithHyperParameter:(id)a3;
- (RTVisitPipelineModuleBurstNoiseFilter)initWithMaximumFlankDistance:(double)a3 minimumNoiseToLeftFlankDistance:(double)a4 maximumWindowSize:(unint64_t)a5 maxHorizontalAccuracy:(double)a6;
- (RTVisitPipelineModuleBurstNoiseFilter)initWithMaximumFlankDistance:(double)a3 minimumNoiseToLeftFlankDistance:(double)a4 maximumWindowSize:(unint64_t)a5 maxHorizontalAccuracy:(double)a6 distanceCalculator:(id)a7;
- (double)maxHorizontalAccuracy;
- (double)maximumFlankDistance;
- (double)minimumNoiseToLeftFlankDistance;
- (id)getFilteredLocations;
- (id)process:(id)a3;
- (unint64_t)getFirstIndexToProcess;
- (unint64_t)getFirstUnprocessableIndex;
- (unint64_t)lastProcessedIndex;
- (unint64_t)maximumWindowSize;
- (void)addLocations:(id)a3;
- (void)discardObsoleteLocations;
- (void)filterNoise;
- (void)identifyNoiseInWindowRange:(_NSRange)a3;
- (void)removeNoiseLocations;
- (void)setLastProcessedIndex:(unint64_t)a3;
@end

@implementation RTVisitPipelineModuleBurstNoiseFilter

- (void)addLocations:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        [v9 horizontalUncertainty];
        if (v10 <= self->_maxHorizontalAccuracy)
        {
          potentialNoiseLocations = self->_potentialNoiseLocations;
          v12 = [[RTPotentialNoiseLocation alloc] initWithLocation:v9];
          [(NSMutableArray *)potentialNoiseLocations addObject:v12];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }
}

- (RTVisitPipelineModuleBurstNoiseFilter)initWithMaximumFlankDistance:(double)a3 minimumNoiseToLeftFlankDistance:(double)a4 maximumWindowSize:(unint64_t)a5 maxHorizontalAccuracy:(double)a6
{
  v11 = objc_opt_new();
  v12 = [(RTVisitPipelineModuleBurstNoiseFilter *)self initWithMaximumFlankDistance:a5 minimumNoiseToLeftFlankDistance:v11 maximumWindowSize:a3 maxHorizontalAccuracy:a4 distanceCalculator:a6];

  return v12;
}

- (RTVisitPipelineModuleBurstNoiseFilter)initWithMaximumFlankDistance:(double)a3 minimumNoiseToLeftFlankDistance:(double)a4 maximumWindowSize:(unint64_t)a5 maxHorizontalAccuracy:(double)a6 distanceCalculator:(id)a7
{
  id v13 = a7;
  v19.receiver = self;
  v19.super_class = (Class)RTVisitPipelineModuleBurstNoiseFilter;
  long long v14 = [(RTVisitPipelineModuleBurstNoiseFilter *)&v19 init];
  long long v15 = v14;
  if (v14)
  {
    v14->_firstTimeProcessingModule = 1;
    uint64_t v16 = objc_opt_new();
    potentialNoiseLocations = v15->_potentialNoiseLocations;
    v15->_potentialNoiseLocations = (NSMutableArray *)v16;

    v15->_lastProcessedIndex = 0;
    v15->_maximumFlankDistance = a3;
    v15->_minimumNoiseToLeftFlankDistance = a4;
    v15->_maximumWindowSize = a5;
    v15->_maxHorizontalAccuracy = a6;
    objc_storeStrong((id *)&v15->_distanceCalculator, a7);
  }

  return v15;
}

- (RTVisitPipelineModuleBurstNoiseFilter)initWithHyperParameter:(id)a3
{
  id v4 = a3;
  [v4 maxNonFlankDistance];
  double v6 = v5;
  [v4 minNoiseToLeftFlankDistance];
  double v8 = v7;
  uint64_t v9 = [v4 maxBurstNoiseLength];
  [v4 maxHorizontalAccuracy];
  double v11 = v10;

  return [(RTVisitPipelineModuleBurstNoiseFilter *)self initWithMaximumFlankDistance:v9 minimumNoiseToLeftFlankDistance:v6 maximumWindowSize:v8 maxHorizontalAccuracy:v11];
}

- (void)identifyNoiseInWindowRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  if (!a3.location)
  {
    double v6 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v45 = "-[RTVisitPipelineModuleBurstNoiseFilter identifyNoiseInWindowRange:]";
      __int16 v46 = 1024;
      int v47 = 89;
      _os_log_error_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: windowRange.location > 0 (in %s:%d)", buf, 0x12u);
    }
  }
  unint64_t v7 = location + length;
  if (v7 >= [(NSMutableArray *)self->_potentialNoiseLocations count])
  {
    double v8 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v45 = "-[RTVisitPipelineModuleBurstNoiseFilter identifyNoiseInWindowRange:]";
      __int16 v46 = 1024;
      int v47 = 90;
      _os_log_error_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: windowRange.location + windowRange.length < _potentialNoiseLocations.count (in %s:%d)", buf, 0x12u);
    }
  }
  NSUInteger v9 = location - 1;
  double v10 = [(NSMutableArray *)self->_potentialNoiseLocations objectAtIndexedSubscript:location - 1];
  if (([v10 isNoise] & 1) == 0)
  {
    double v11 = [(NSMutableArray *)self->_potentialNoiseLocations objectAtIndexedSubscript:v7];
    char v12 = [v11 isNoise];

    if (v12) {
      return;
    }
    id v13 = [(NSMutableArray *)self->_potentialNoiseLocations objectAtIndexedSubscript:location - 1];
    uint64_t v14 = [v13 location];

    long long v15 = [(NSMutableArray *)self->_potentialNoiseLocations objectAtIndexedSubscript:v7];
    uint64_t v16 = [v15 location];

    distanceCalculator = self->_distanceCalculator;
    id v43 = 0;
    v40 = (void *)v16;
    [(RTDistanceCalculator *)distanceCalculator distanceFromLocation:v14 toLocation:v16 error:&v43];
    double v19 = v18;
    v20 = (char *)v43;
    if (v20)
    {
      v22 = _rt_log_facility_get_os_log(RTLogFacilityLocation);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v45 = v20;
        _os_log_debug_impl(&dword_1D9BFA000, v22, OS_LOG_TYPE_DEBUG, "Distance Calculator error, %@", buf, 0xCu);
      }
    }
    v41 = (void *)v14;
    if (v19 >= self->_maximumFlankDistance) {
      goto LABEL_29;
    }
    unint64_t lastProcessedIndex = self->_lastProcessedIndex;
    if (location <= lastProcessedIndex + 1) {
      NSUInteger location = lastProcessedIndex + 1;
    }
    if (location >= v7)
    {
LABEL_29:
      v26 = v20;
    }
    else
    {
      *(void *)&long long v21 = 138412290;
      long long v39 = v21;
      do
      {
        v24 = -[NSMutableArray objectAtIndexedSubscript:](self->_potentialNoiseLocations, "objectAtIndexedSubscript:", location, v39);
        char v25 = [v24 isNoise];

        if (v25)
        {
          v26 = v20;
        }
        else
        {
          v27 = self->_distanceCalculator;
          NSUInteger v28 = v9;
          v29 = [(NSMutableArray *)self->_potentialNoiseLocations objectAtIndexedSubscript:v9];
          v30 = [v29 location];
          v31 = [(NSMutableArray *)self->_potentialNoiseLocations objectAtIndexedSubscript:location];
          v32 = [v31 location];
          v42 = v20;
          [(RTDistanceCalculator *)v27 distanceFromLocation:v30 toLocation:v32 error:&v42];
          double v34 = v33;
          v26 = v42;

          if (v34 > self->_minimumNoiseToLeftFlankDistance)
          {
            v35 = [(NSMutableArray *)self->_potentialNoiseLocations objectAtIndexedSubscript:location];
            [v35 setNoise:1];

            v36 = _rt_log_facility_get_os_log(RTLogFacilityLocation);
            if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
            {
              v37 = [(NSMutableArray *)self->_potentialNoiseLocations objectAtIndexedSubscript:location];
              v38 = [v37 location];
              *(_DWORD *)buf = v39;
              v45 = v38;
              _os_log_impl(&dword_1D9BFA000, v36, OS_LOG_TYPE_INFO, "Noisy Location: %@", buf, 0xCu);
            }
          }
          NSUInteger v9 = v28;
        }
        ++location;
        v20 = v26;
      }
      while (v7 != location);
    }

    double v10 = v41;
  }
}

- (void)removeNoiseLocations
{
  potentialNoiseLocations = self->_potentialNoiseLocations;
  id v3 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_69];
  [(NSMutableArray *)potentialNoiseLocations filterUsingPredicate:v3];
}

uint64_t __61__RTVisitPipelineModuleBurstNoiseFilter_removeNoiseLocations__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isNoise] ^ 1;
}

+ (unint64_t)getIndexInArray:(id)a3 followedByCount:(unint64_t)a4
{
  id v5 = a3;
  if ([v5 count] - 1 >= a4) {
    unint64_t v6 = [v5 count] + ~a4;
  }
  else {
    unint64_t v6 = 0;
  }

  return v6;
}

- (unint64_t)getFirstUnprocessableIndex
{
  unint64_t result = [(id)objc_opt_class() getIndexInArray:self->_potentialNoiseLocations followedByCount:self->_maximumWindowSize - 1];
  unint64_t lastProcessedIndex = self->_lastProcessedIndex;
  if (result <= lastProcessedIndex) {
    return lastProcessedIndex + 1;
  }
  return result;
}

- (unint64_t)getFirstIndexToProcess
{
  if (self->_firstTimeProcessingModule) {
    return 0;
  }
  else {
    return self->_lastProcessedIndex + 1;
  }
}

- (void)discardObsoleteLocations
{
  unint64_t v2 = self->_lastProcessedIndex + 1;
  unint64_t maximumWindowSize = self->_maximumWindowSize;
  unint64_t v4 = v2 - maximumWindowSize;
  if (v2 > maximumWindowSize)
  {
    -[NSMutableArray removeObjectsInRange:](self->_potentialNoiseLocations, "removeObjectsInRange:", 0, v2 - maximumWindowSize);
    self->_lastProcessedIndex -= v4;
  }
}

- (id)getFilteredLocations
{
  id v3 = objc_opt_new();
  for (unint64_t i = [(RTVisitPipelineModuleBurstNoiseFilter *)self getFirstIndexToProcess];
        i < [(RTVisitPipelineModuleBurstNoiseFilter *)self getFirstUnprocessableIndex];
        ++i)
  {
    id v5 = [(NSMutableArray *)self->_potentialNoiseLocations objectAtIndexedSubscript:i];
    unint64_t v6 = [v5 location];
    [v3 addObject:v6];
  }
  unint64_t lastProcessedIndex = self->_lastProcessedIndex;
  if (lastProcessedIndex < [(RTVisitPipelineModuleBurstNoiseFilter *)self getFirstUnprocessableIndex]- 1)
  {
    self->_unint64_t lastProcessedIndex = [(RTVisitPipelineModuleBurstNoiseFilter *)self getFirstUnprocessableIndex]- 1;
    self->_firstTimeProcessingModule = 0;
  }
  if ([v3 count])
  {
    double v8 = [RTVisitCluster alloc];
    NSUInteger v9 = [[RTVisitLocationPoints alloc] initWithLocations:v3];
    double v10 = [(RTVisitCluster *)v8 initWithPoints:v9];
  }
  else
  {
    double v10 = 0;
  }

  return v10;
}

- (void)filterNoise
{
  for (unint64_t i = self->_maximumWindowSize; i; --i)
  {
    for (unint64_t j = self->_lastProcessedIndex + 1; i + j < [(NSMutableArray *)self->_potentialNoiseLocations count]; ++j)
      -[RTVisitPipelineModuleBurstNoiseFilter identifyNoiseInWindowRange:](self, "identifyNoiseInWindowRange:", j, i);
    [(RTVisitPipelineModuleBurstNoiseFilter *)self removeNoiseLocations];
  }
}

- (id)process:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  obunint64_t j = a3;
  uint64_t v4 = [obj countByEnumeratingWithState:&v26 objects:v35 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    unint64_t v6 = 0;
    uint64_t v25 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v27 != v25) {
          objc_enumerationMutation(obj);
        }
        double v8 = *(RTVisitCluster **)(*((void *)&v26 + 1) + 8 * i);
        NSUInteger v9 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          double v19 = (objc_class *)objc_opt_class();
          v20 = NSStringFromClass(v19);
          *(_DWORD *)buf = 138412546;
          v32 = v20;
          __int16 v33 = 2112;
          double v34 = v8;
          _os_log_debug_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_DEBUG, "%@ working on cluster, %@", buf, 0x16u);
        }
        double v10 = [(RTVisitCluster *)v8 points];
        double v11 = [v10 locations];
        [(RTVisitPipelineModuleBurstNoiseFilter *)self addLocations:v11];

        [(RTVisitPipelineModuleBurstNoiseFilter *)self filterNoise];
        char v12 = [RTVisitCluster alloc];
        id v13 = [(RTVisitPipelineModuleBurstNoiseFilter *)self getFilteredLocations];
        uint64_t v14 = [v13 points];
        long long v15 = [(RTVisitCluster *)v8 visit];
        uint64_t v16 = [(RTVisitCluster *)v12 initWithPoints:v14 visit:v15];

        [(RTVisitPipelineModuleBurstNoiseFilter *)self discardObsoleteLocations];
        v17 = _rt_log_facility_get_os_log(RTLogFacilityVisit);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          long long v21 = (objc_class *)objc_opt_class();
          v22 = NSStringFromClass(v21);
          *(_DWORD *)buf = 138412546;
          v32 = v22;
          __int16 v33 = 2112;
          double v34 = v16;
          _os_log_debug_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_DEBUG, "%@ adding to output clusters, %@", buf, 0x16u);
        }
        if (v16)
        {
          v30 = v16;
          uint64_t v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v30 count:1];

          unint64_t v6 = (void *)v18;
        }
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v26 objects:v35 count:16];
    }
    while (v5);
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

- (void)setLastProcessedIndex:(unint64_t)a3
{
  self->_unint64_t lastProcessedIndex = a3;
}

- (BOOL)firstTimeProcessingModule
{
  return self->_firstTimeProcessingModule;
}

- (NSMutableArray)potentialNoiseLocations
{
  return self->_potentialNoiseLocations;
}

- (unint64_t)lastProcessedIndex
{
  return self->_lastProcessedIndex;
}

- (double)maximumFlankDistance
{
  return self->_maximumFlankDistance;
}

- (double)minimumNoiseToLeftFlankDistance
{
  return self->_minimumNoiseToLeftFlankDistance;
}

- (unint64_t)maximumWindowSize
{
  return self->_maximumWindowSize;
}

- (double)maxHorizontalAccuracy
{
  return self->_maxHorizontalAccuracy;
}

- (RTDistanceCalculator)distanceCalculator
{
  return self->_distanceCalculator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_distanceCalculator, 0);

  objc_storeStrong((id *)&self->_potentialNoiseLocations, 0);
}

@end