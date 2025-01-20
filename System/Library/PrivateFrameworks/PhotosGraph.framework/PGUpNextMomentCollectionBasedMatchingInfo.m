@interface PGUpNextMomentCollectionBasedMatchingInfo
+ (id)representativeDateForMomentNodes:(id)a3;
+ (id)representativeDateForMomentNodesUniversalDateInterval:(id)a3;
+ (id)representativeLocationForLocations:(id)a3;
+ (id)representativeLocationForMomentNodes:(id)a3;
+ (id)representativeMeaningNodesForEligibleMeaningNodesByMomentNode:(id)a3;
+ (id)representativeMeaningNodesForMomentNodes:(id)a3;
+ (id)representativePersonNodesForMomentNodes:(id)a3;
+ (id)representativePersonNodesForPersonNodesByMomentNode:(id)a3;
+ (id)representativeSceneNodesForMomentNodes:(id)a3;
+ (id)representativeSceneNodesForSceneNodesByMomentNode:(id)a3;
- (BOOL)_implIsTripMemory;
- (BOOL)isTripMemory;
- (CLLocation)representativeLocation;
- (NSDate)representativeDate;
- (NSString)debugInfo;
- (PGGraphFeatureNodeCollection)memoryFeatureNodes;
- (PGGraphMeaningNodeCollection)meaningNodes;
- (PGGraphMomentNodeCollection)momentNodes;
- (PGGraphPersonNodeCollection)personNodes;
- (PGGraphSceneNodeCollection)sceneNodes;
- (PGUpNextMomentCollectionBasedMatchingInfo)initWithMomentNodes:(id)a3;
- (PGUpNextMomentCollectionBasedMatchingInfo)initWithMomentNodes:(id)a3 personNodes:(id)a4 sceneNodes:(id)a5 meaningNodes:(id)a6 isTripMemory:(BOOL)a7 representativeLocation:(id)a8 representativeDate:(id)a9;
@end

@implementation PGUpNextMomentCollectionBasedMatchingInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_momentNodes, 0);
  objc_storeStrong((id *)&self->_representativeDate, 0);
  objc_storeStrong((id *)&self->_representativeLocation, 0);
  objc_storeStrong((id *)&self->_meaningNodes, 0);
  objc_storeStrong((id *)&self->_sceneNodes, 0);
  objc_storeStrong((id *)&self->_personNodes, 0);
}

- (PGGraphMomentNodeCollection)momentNodes
{
  return self->_momentNodes;
}

- (NSString)debugInfo
{
  v2 = NSString;
  v3 = [(PGGraphMomentNodeCollection *)self->_momentNodes uuids];
  v4 = [v2 stringWithFormat:@"Moment uuids %@", v3];

  return (NSString *)v4;
}

- (NSDate)representativeDate
{
  if (!self->_representativeDateIsResolved)
  {
    v3 = [(id)objc_opt_class() representativeDateForMomentNodes:self->_momentNodes];
    representativeDate = self->_representativeDate;
    self->_representativeDate = v3;

    self->_representativeDateIsResolved = 1;
  }
  v5 = self->_representativeDate;
  return v5;
}

- (CLLocation)representativeLocation
{
  if (!self->_representativeLocationIsResolved)
  {
    v3 = [(id)objc_opt_class() representativeLocationForMomentNodes:self->_momentNodes];
    representativeLocation = self->_representativeLocation;
    self->_representativeLocation = v3;

    self->_representativeLocationIsResolved = 1;
  }
  v5 = self->_representativeLocation;
  return v5;
}

- (BOOL)_implIsTripMemory
{
  return 0;
}

- (BOOL)isTripMemory
{
  if (self->_isTripMemoryIsResolved) {
    return self->_isTripMemory;
  }
  BOOL result = [(PGUpNextMomentCollectionBasedMatchingInfo *)self _implIsTripMemory];
  self->_isTripMemory = result;
  self->_isTripMemoryIsResolved = 1;
  return result;
}

- (PGGraphFeatureNodeCollection)memoryFeatureNodes
{
  return 0;
}

- (PGGraphMeaningNodeCollection)meaningNodes
{
  meaningNodes = self->_meaningNodes;
  if (!meaningNodes)
  {
    v4 = [(id)objc_opt_class() representativeMeaningNodesForMomentNodes:self->_momentNodes];
    v5 = self->_meaningNodes;
    self->_meaningNodes = v4;

    meaningNodes = self->_meaningNodes;
  }
  return meaningNodes;
}

- (PGGraphSceneNodeCollection)sceneNodes
{
  sceneNodes = self->_sceneNodes;
  if (!sceneNodes)
  {
    v4 = [(id)objc_opt_class() representativeSceneNodesForMomentNodes:self->_momentNodes];
    v5 = self->_sceneNodes;
    self->_sceneNodes = v4;

    sceneNodes = self->_sceneNodes;
  }
  return sceneNodes;
}

- (PGGraphPersonNodeCollection)personNodes
{
  personNodes = self->_personNodes;
  if (!personNodes)
  {
    v4 = [(id)objc_opt_class() representativePersonNodesForMomentNodes:self->_momentNodes];
    v5 = self->_personNodes;
    self->_personNodes = v4;

    personNodes = self->_personNodes;
  }
  return personNodes;
}

- (PGUpNextMomentCollectionBasedMatchingInfo)initWithMomentNodes:(id)a3 personNodes:(id)a4 sceneNodes:(id)a5 meaningNodes:(id)a6 isTripMemory:(BOOL)a7 representativeLocation:(id)a8 representativeDate:(id)a9
{
  id v24 = a3;
  id v23 = a4;
  id v22 = a5;
  id v15 = a6;
  id v16 = a8;
  id v17 = a9;
  v25.receiver = self;
  v25.super_class = (Class)PGUpNextMomentCollectionBasedMatchingInfo;
  v18 = [(PGUpNextMomentCollectionBasedMatchingInfo *)&v25 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_momentNodes, a3);
    objc_storeStrong((id *)&v19->_personNodes, a4);
    objc_storeStrong((id *)&v19->_sceneNodes, a5);
    objc_storeStrong((id *)&v19->_meaningNodes, a6);
    v19->_isTripMemory = a7;
    objc_storeStrong((id *)&v19->_representativeLocation, a8);
    objc_storeStrong((id *)&v19->_representativeDate, a9);
    *(_WORD *)&v19->_isTripMemoryIsResolved = 257;
    v19->_representativeDateIsResolved = 1;
  }

  return v19;
}

- (PGUpNextMomentCollectionBasedMatchingInfo)initWithMomentNodes:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PGUpNextMomentCollectionBasedMatchingInfo;
  v6 = [(PGUpNextMomentCollectionBasedMatchingInfo *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_momentNodes, a3);
  }

  return v7;
}

+ (id)representativeDateForMomentNodesUniversalDateInterval:(id)a3
{
  id v3 = a3;
  [v3 duration];
  if (v4 <= 2592000.0)
  {
    v6 = [v3 startDate];
    [v3 duration];
    id v5 = [v6 dateByAddingTimeInterval:v7 * 0.5];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

+ (id)representativeDateForMomentNodes:(id)a3
{
  double v4 = [a3 universalDateInterval];
  id v5 = [a1 representativeDateForMomentNodesUniversalDateInterval:v4];

  return v5;
}

+ (id)representativeLocationForLocations:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  unint64_t v4 = [v3 count];
  if (v4 > 1)
  {
    double v6 = (double)v4;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v7 = v3;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v29 objects:v34 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v30;
      double v11 = 0.0;
      double v12 = 0.0;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v30 != v10) {
            objc_enumerationMutation(v7);
          }
          v14 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          [v14 coordinate];
          double v12 = v12 + v15;
          [v14 coordinate];
          double v11 = v11 + v16;
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v29 objects:v34 count:16];
      }
      while (v9);
    }
    else
    {
      double v11 = 0.0;
      double v12 = 0.0;
    }

    id v17 = (void *)[objc_alloc(MEMORY[0x1E4F1E5F0]) initWithLatitude:v12 / v6 longitude:v11 / v6];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v18 = v7;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v25 objects:v33 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v26;
      while (2)
      {
        for (uint64_t j = 0; j != v20; ++j)
        {
          if (*(void *)v26 != v21) {
            objc_enumerationMutation(v18);
          }
          objc_msgSend(*(id *)(*((void *)&v25 + 1) + 8 * j), "distanceFromLocation:", v17, (void)v25);
          if (v23 > 50000.0)
          {

            id v5 = 0;
            goto LABEL_22;
          }
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v25 objects:v33 count:16];
        if (v20) {
          continue;
        }
        break;
      }
    }

    id v5 = v17;
LABEL_22:
  }
  else
  {
    id v5 = [v3 firstObject];
  }

  return v5;
}

+ (id)representativeLocationForMomentNodes:(id)a3
{
  unint64_t v4 = [a3 addressNodes];
  id v5 = [v4 locations];
  double v6 = [a1 representativeLocationForLocations:v5];

  return v6;
}

+ (id)representativeMeaningNodesForEligibleMeaningNodesByMomentNode:(id)a3
{
  id v3 = a3;
  unint64_t v4 = objc_msgSend(v3, "targetsWithMinimumCount:", vcvtps_u32_f32((float)(unint64_t)objc_msgSend(v3, "sourcesCount") * 0.25));

  return v4;
}

+ (id)representativeMeaningNodesForMomentNodes:(id)a3
{
  unint64_t v4 = (void *)MEMORY[0x1E4F71E88];
  id v5 = a3;
  double v6 = +[PGGraphMomentNode meaningOfMoment];
  id v7 = self;
  uint64_t v8 = [v4 adjacencyWithSources:v5 relation:v6 targetsClass:v7];

  uint64_t v9 = [v5 graph];

  uint64_t v10 = +[PGGraphMeaningNodeCollection meaningNodesWithMeaning:16 inGraph:v9];

  double v11 = [v8 subtractingTargetsWith:v10];

  double v12 = [a1 representativeMeaningNodesForEligibleMeaningNodesByMomentNode:v11];

  return v12;
}

+ (id)representativeSceneNodesForSceneNodesByMomentNode:(id)a3
{
  id v3 = a3;
  unint64_t v4 = objc_msgSend(v3, "targetsWithMinimumCount:", vcvtps_u32_f32((float)(unint64_t)objc_msgSend(v3, "sourcesCount") * 0.25));

  return v4;
}

+ (id)representativeSceneNodesForMomentNodes:(id)a3
{
  unint64_t v4 = (void *)MEMORY[0x1E4F71E88];
  id v5 = a3;
  double v6 = +[PGGraphMomentNode sceneOfMoment];
  id v7 = self;
  uint64_t v8 = [v4 adjacencyWithSources:v5 relation:v6 targetsClass:v7];

  uint64_t v9 = [a1 representativeSceneNodesForSceneNodesByMomentNode:v8];

  return v9;
}

+ (id)representativePersonNodesForPersonNodesByMomentNode:(id)a3
{
  id v3 = a3;
  unint64_t v4 = objc_msgSend(v3, "targetsWithMinimumCount:", vcvtps_u32_f32((float)(unint64_t)objc_msgSend(v3, "sourcesCount") * 0.25));

  return v4;
}

+ (id)representativePersonNodesForMomentNodes:(id)a3
{
  unint64_t v4 = (void *)MEMORY[0x1E4F71E88];
  id v5 = a3;
  double v6 = +[PGGraphMomentNode personExcludingMeInMoment];
  id v7 = self;
  uint64_t v8 = [v4 adjacencyWithSources:v5 relation:v6 targetsClass:v7];

  uint64_t v9 = [a1 representativePersonNodesForPersonNodesByMomentNode:v8];

  return v9;
}

@end