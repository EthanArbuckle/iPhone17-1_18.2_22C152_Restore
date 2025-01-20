@interface CRGroupRegionGeometry
- (BOOL)isIsolatedClosestRegionDistance:(double)a3;
- (BOOL)shouldBeConsiderForFiltering;
- (BOOL)shouldBeConsideredForNearestDistanceCalculation;
- (CRGroupRegion)groupRegion;
- (CRGroupRegionGeometry)initWithGroupRegion:(id)a3;
- (CRTextRegion)firstTextRegion;
- (double)_distanceFromQuad1:(id)a3 toQuad2:(id)a4;
- (double)calculateMinimumDistanceFromOtherGeometries:(id)a3;
- (double)diagonalDistance;
@end

@implementation CRGroupRegionGeometry

- (CRGroupRegionGeometry)initWithGroupRegion:(id)a3
{
  id v5 = a3;
  v28.receiver = self;
  v28.super_class = (Class)CRGroupRegionGeometry;
  v6 = [(CRGroupRegionGeometry *)&v28 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_groupRegion, a3);
    v8 = [v5 boundingQuad];
    [v8 topLeft];
    double v10 = v9;
    double v12 = v11;
    v13 = [v5 boundingQuad];
    [v13 bottomRight];
    double v15 = v14;
    double v17 = v16;
    v18 = [v5 boundingQuad];
    [v18 normalizationSize];
    if (v19 > 0.0 && v20 > 0.0)
    {
      double v10 = v10 * v19;
      double v12 = v12 * v20;
      double v15 = v15 * v19;
      double v17 = v17 * v20;
    }
    v7->_diagonalDistance = sqrt((v12 - v17) * (v12 - v17) + (v10 - v15) * (v10 - v15));

    v21 = [v5 subregions];
    v22 = [v21 firstObject];
    int v23 = [v22 conformsToProtocol:&unk_1F39415E8];

    if (v23)
    {
      v24 = [v5 subregions];
      uint64_t v25 = [v24 firstObject];
      firstTextRegion = v7->_firstTextRegion;
      v7->_firstTextRegion = (CRTextRegion *)v25;
    }
  }

  return v7;
}

- (BOOL)isIsolatedClosestRegionDistance:(double)a3
{
  id v5 = [(CRGroupRegionGeometry *)self groupRegion];
  v6 = [v5 subregions];
  if ([v6 count] == 1)
  {
    v7 = [(CRGroupRegionGeometry *)self firstTextRegion];
    v8 = [v7 text];
    unint64_t v9 = [v8 length];

    if (v9 <= 2)
    {
      [(CRGroupRegionGeometry *)self diagonalDistance];
      if (v10 * 20.0 < a3) {
        return 1;
      }
    }
  }
  else
  {
  }
  return 0;
}

- (BOOL)shouldBeConsiderForFiltering
{
  v3 = [(CRGroupRegionGeometry *)self groupRegion];
  v4 = [v3 subregions];
  if ([v4 count] == 1)
  {
    id v5 = [(CRGroupRegionGeometry *)self firstTextRegion];
    v6 = [v5 text];
    BOOL v7 = (unint64_t)[v6 length] < 3;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)shouldBeConsideredForNearestDistanceCalculation
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v2 = [(CRGroupRegionGeometry *)self groupRegion];
  v3 = [v2 subregions];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v3);
        }
        BOOL v7 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if ([v7 conformsToProtocol:&unk_1F39415E8])
        {
          v8 = [v7 text];
          unint64_t v9 = [v8 length];

          if (v9 > 1)
          {
            LOBYTE(v4) = 1;
            goto LABEL_12;
          }
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return v4;
}

- (double)calculateMinimumDistanceFromOtherGeometries:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = a3;
  uint64_t v4 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v21;
    double v7 = 1.79769313e308;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v21 != v6) {
          objc_enumerationMutation(obj);
        }
        unint64_t v9 = *(CRGroupRegionGeometry **)(*((void *)&v20 + 1) + 8 * i);
        if (v9 != self)
        {
          if ([*(id *)(*((void *)&v20 + 1) + 8 * i) shouldBeConsideredForNearestDistanceCalculation])
          {
            double v10 = [(CRGroupRegionGeometry *)self groupRegion];
            long long v11 = [v10 boundingQuad];
            long long v12 = [v11 denormalizedQuad];
            long long v13 = [(CRGroupRegionGeometry *)v9 groupRegion];
            long long v14 = [v13 boundingQuad];
            double v15 = [v14 denormalizedQuad];
            [(CRGroupRegionGeometry *)self _distanceFromQuad1:v12 toQuad2:v15];
            double v17 = v16;

            if (v17 < v7) {
              double v7 = v17;
            }
          }
        }
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v5);
  }
  else
  {
    double v7 = 1.79769313e308;
  }

  return v7;
}

- (double)_distanceFromQuad1:(id)a3 toQuad2:(id)a4
{
  v19[8] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  [v5 topLeft];
  v19[0] = v7;
  v19[1] = v8;
  [v5 topRight];
  v19[2] = v9;
  v19[3] = v10;
  [v5 bottomRight];
  v19[4] = v11;
  v19[5] = v12;
  [v5 bottomLeft];
  uint64_t v13 = 0;
  v19[6] = v14;
  v19[7] = v15;
  double v16 = 1.79769313e308;
  do
  {
    objc_msgSend(v6, "shortestDistanceFromPoint:", *(double *)&v19[v13], *(double *)&v19[v13 + 1]);
    if (v17 < v16) {
      double v16 = v17;
    }
    v13 += 2;
  }
  while (v13 != 8);

  return v16;
}

- (CRGroupRegion)groupRegion
{
  return (CRGroupRegion *)objc_getProperty(self, a2, 8, 1);
}

- (double)diagonalDistance
{
  return self->_diagonalDistance;
}

- (CRTextRegion)firstTextRegion
{
  return (CRTextRegion *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_firstTextRegion, 0);
  objc_storeStrong((id *)&self->_groupRegion, 0);
}

@end