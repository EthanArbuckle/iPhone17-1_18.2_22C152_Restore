@interface _PSDBSCAN
- (NSMutableArray)clusters;
- (NSMutableArray)noisePoints;
- (NSMutableArray)pointsArray;
- (NSMutableSet)clusteredPoints;
- (NSMutableSet)visitedPoints;
- (_PSDBSCAN)initWithMinimumPointsForClustering:(unint64_t)a3 MaxNeighborDistance:(double)a4;
- (double)eps;
- (id)expandClusterForPoint:(id)a3 withNeighborIndices:(id)a4;
- (id)getNeighborIndices:(unint64_t)a3;
- (unint64_t)minPts;
- (void)emptyCollections;
- (void)fitData:(id)a3;
- (void)mergeCurrNeighbors:(id)a3 withArray:(id)a4 andUpdateSet:(id)a5;
- (void)setClusteredPoints:(id)a3;
- (void)setClusters:(id)a3;
- (void)setNoisePoints:(id)a3;
- (void)setPointsArray:(id)a3;
- (void)setVisitedPoints:(id)a3;
@end

@implementation _PSDBSCAN

- (_PSDBSCAN)initWithMinimumPointsForClustering:(unint64_t)a3 MaxNeighborDistance:(double)a4
{
  v17.receiver = self;
  v17.super_class = (Class)_PSDBSCAN;
  v6 = [(_PSDBSCAN *)&v17 init];
  v7 = v6;
  if (v6)
  {
    v6->_minPts = a3;
    v6->_eps = a4;
    uint64_t v8 = [MEMORY[0x1E4F1CA80] set];
    visitedPoints = v7->_visitedPoints;
    v7->_visitedPoints = (NSMutableSet *)v8;

    uint64_t v10 = [MEMORY[0x1E4F1CA80] set];
    clusteredPoints = v7->_clusteredPoints;
    v7->_clusteredPoints = (NSMutableSet *)v10;

    uint64_t v12 = [MEMORY[0x1E4F1CA48] array];
    noisePoints = v7->_noisePoints;
    v7->_noisePoints = (NSMutableArray *)v12;

    uint64_t v14 = [MEMORY[0x1E4F1CA48] array];
    clusters = v7->_clusters;
    v7->_clusters = (NSMutableArray *)v14;
  }
  return v7;
}

- (void)emptyCollections
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  [(_PSDBSCAN *)self setPointsArray:v3];

  v4 = [MEMORY[0x1E4F1CA80] set];
  [(_PSDBSCAN *)self setClusteredPoints:v4];

  v5 = [MEMORY[0x1E4F1CA80] set];
  [(_PSDBSCAN *)self setVisitedPoints:v5];

  v6 = [MEMORY[0x1E4F1CA48] array];
  [(_PSDBSCAN *)self setClusters:v6];

  id v7 = [MEMORY[0x1E4F1CA48] array];
  [(_PSDBSCAN *)self setNoisePoints:v7];
}

- (void)fitData:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v4 = (void *)[a3 mutableCopy];
  [(_PSDBSCAN *)self setPointsArray:v4];

  v5 = [(_PSDBSCAN *)self pointsArray];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    unint64_t v7 = 0;
    do
    {
      uint64_t v8 = [(_PSDBSCAN *)self pointsArray];
      v9 = [v8 objectAtIndexedSubscript:v7];

      uint64_t v10 = [(_PSDBSCAN *)self visitedPoints];
      char v11 = [v10 containsObject:v9];

      if ((v11 & 1) == 0)
      {
        uint64_t v12 = [(_PSDBSCAN *)self visitedPoints];
        [v12 addObject:v9];

        v13 = [(_PSDBSCAN *)self getNeighborIndices:v7];
        unint64_t v14 = [v13 count] + 1;
        if (v14 >= [(_PSDBSCAN *)self minPts])
        {
          v15 = [(_PSDBSCAN *)self expandClusterForPoint:v9 withNeighborIndices:v13];
          v16 = [(_PSDBSCAN *)self clusters];
          [v16 addObject:v15];
        }
        else
        {
          v15 = [(_PSDBSCAN *)self noisePoints];
          [v15 addObject:v9];
        }
      }
      ++v7;
      objc_super v17 = [(_PSDBSCAN *)self pointsArray];
      unint64_t v18 = [v17 count];
    }
    while (v7 < v18);
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  v19 = [(_PSDBSCAN *)self clusters];
  uint64_t v20 = [v19 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v25;
    do
    {
      uint64_t v23 = 0;
      do
      {
        if (*(void *)v25 != v22) {
          objc_enumerationMutation(v19);
        }
        [*(id *)(*((void *)&v24 + 1) + 8 * v23++) computeConvexHull];
      }
      while (v21 != v23);
      uint64_t v21 = [v19 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v21);
  }
}

- (id)getNeighborIndices:(unint64_t)a3
{
  v5 = [(_PSDBSCAN *)self pointsArray];
  uint64_t v6 = [v5 objectAtIndexedSubscript:a3];

  unint64_t v7 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v8 = [(_PSDBSCAN *)self pointsArray];
  uint64_t v9 = [v8 count];

  if (v9)
  {
    unint64_t v10 = 0;
    do
    {
      if (a3 != v10)
      {
        char v11 = [(NSMutableArray *)self->_pointsArray objectAtIndexedSubscript:v10];
        [v6 euclideanDistanceToPoint:v11];
        double v13 = v12;
        [(_PSDBSCAN *)self eps];
        double v15 = v14;

        if (v13 <= v15)
        {
          v16 = [NSNumber numberWithInteger:v10];
          [v7 addObject:v16];
        }
      }
      ++v10;
      objc_super v17 = [(_PSDBSCAN *)self pointsArray];
      unint64_t v18 = [v17 count];
    }
    while (v10 < v18);
  }

  return v7;
}

- (id)expandClusterForPoint:(id)a3 withNeighborIndices:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_alloc_init(_PSCluster);
  [(_PSCluster *)v8 addPointToCluster:v6];
  [(NSMutableSet *)self->_clusteredPoints addObject:v6];
  uint64_t v9 = [MEMORY[0x1E4F1CA80] setWithArray:v7];
  if ([v7 count])
  {
    unint64_t v10 = 0;
    do
    {
      char v11 = [v7 objectAtIndexedSubscript:v10];
      uint64_t v12 = [v11 integerValue];

      double v13 = [(_PSDBSCAN *)self pointsArray];
      double v14 = [v13 objectAtIndexedSubscript:v12];

      double v15 = [(_PSDBSCAN *)self visitedPoints];
      char v16 = [v15 containsObject:v14];

      if ((v16 & 1) == 0)
      {
        objc_super v17 = [(_PSDBSCAN *)self visitedPoints];
        [v17 addObject:v14];

        unint64_t v18 = [(_PSDBSCAN *)self getNeighborIndices:v12];
        unint64_t v19 = [v18 count] + 1;
        if (v19 >= [(_PSDBSCAN *)self minPts]) {
          [(_PSDBSCAN *)self mergeCurrNeighbors:v7 withArray:v18 andUpdateSet:v9];
        }
        uint64_t v20 = [(_PSDBSCAN *)self clusteredPoints];
        char v21 = [v20 containsObject:v14];

        if ((v21 & 1) == 0)
        {
          [(_PSCluster *)v8 addPointToCluster:v14];
          uint64_t v22 = [(_PSDBSCAN *)self clusteredPoints];
          [v22 addObject:v14];
        }
      }

      ++v10;
    }
    while (v10 < [v7 count]);
  }

  return v8;
}

- (void)mergeCurrNeighbors:(id)a3 withArray:(id)a4 andUpdateSet:(id)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v8);
        }
        uint64_t v14 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        if (([v9 containsObject:v14] & 1) == 0)
        {
          [v7 addObject:v14];
          [v9 addObject:v14];
        }
      }
      uint64_t v11 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v11);
  }
}

- (unint64_t)minPts
{
  return self->_minPts;
}

- (double)eps
{
  return self->_eps;
}

- (NSMutableArray)pointsArray
{
  return (NSMutableArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setPointsArray:(id)a3
{
}

- (NSMutableSet)visitedPoints
{
  return (NSMutableSet *)objc_getProperty(self, a2, 32, 1);
}

- (void)setVisitedPoints:(id)a3
{
}

- (NSMutableArray)noisePoints
{
  return (NSMutableArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setNoisePoints:(id)a3
{
}

- (NSMutableSet)clusteredPoints
{
  return (NSMutableSet *)objc_getProperty(self, a2, 48, 1);
}

- (void)setClusteredPoints:(id)a3
{
}

- (NSMutableArray)clusters
{
  return (NSMutableArray *)objc_getProperty(self, a2, 56, 1);
}

- (void)setClusters:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clusters, 0);
  objc_storeStrong((id *)&self->_clusteredPoints, 0);
  objc_storeStrong((id *)&self->_noisePoints, 0);
  objc_storeStrong((id *)&self->_visitedPoints, 0);

  objc_storeStrong((id *)&self->_pointsArray, 0);
}

@end