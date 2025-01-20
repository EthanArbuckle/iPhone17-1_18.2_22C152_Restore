@interface CRGreedyTrackingAssociator
+ (id)performAssociationOnCandidates:(id)a3 useRegionsAtOCRDispatchTime:(BOOL)a4 existingRegions:(id)a5 fineGrainedResults:(id)a6 newRegionHandler:(id)a7 matchedRegionHandler:(id)a8;
@end

@implementation CRGreedyTrackingAssociator

+ (id)performAssociationOnCandidates:(id)a3 useRegionsAtOCRDispatchTime:(BOOL)a4 existingRegions:(id)a5 fineGrainedResults:(id)a6 newRegionHandler:(id)a7 matchedRegionHandler:(id)a8
{
  BOOL v9 = a4;
  id v10 = a3;
  id v11 = a5;
  v40 = [MEMORY[0x1E4F1CA48] array];
  v41 = [MEMORY[0x1E4F1CA48] array];
  v38 = [MEMORY[0x1E4F1CA48] array];
  v39 = [MEMORY[0x1E4F1CA48] array];
  if ([v10 count])
  {
    unint64_t v12 = 0;
    do
    {
      if (![v11 count]) {
        goto LABEL_14;
      }
      unint64_t v13 = 0;
      char v14 = 0;
      do
      {
        v15 = [v11 objectAtIndexedSubscript:v13];
        v16 = v15;
        if (v9) {
          [v15 boundingQuadAtOCRDispatch];
        }
        else {
        v17 = [v15 boundingQuad];
        }

        v18 = [v10 objectAtIndexedSubscript:v12];
        v19 = [v18 boundingQuad];
        int v20 = [v17 overlapsNormalizedQuad:v19];

        if (v20)
        {
          v21 = [v11 objectAtIndexedSubscript:v13];
          v22 = [v21 trackingID];
          char v23 = [v41 containsObject:v22];

          if ((v23 & 1) == 0)
          {
            v24 = [v11 objectAtIndexedSubscript:v13];
            v25 = [v24 trackingID];
            [v41 addObject:v25];

            v26 = [v11 objectAtIndexedSubscript:v13];
            [v40 addObject:v26];
          }
          char v14 = 1;
        }

        ++v13;
      }
      while ([v11 count] > v13);
      if ((v14 & 1) == 0)
      {
LABEL_14:
        v27 = [v10 objectAtIndexedSubscript:v12];
        [v40 addObject:v27];

        v28 = [v10 objectAtIndexedSubscript:v12];
        v29 = [v28 trackingID];
        [v39 addObject:v29];
      }
      ++v12;
    }
    while ([v10 count] > v12);
  }
  if ([v11 count])
  {
    unint64_t v30 = 0;
    do
    {
      v31 = [v11 objectAtIndexedSubscript:v30];
      v32 = [v31 trackingID];
      char v33 = [v41 containsObject:v32];

      if ((v33 & 1) == 0)
      {
        v34 = [v11 objectAtIndexedSubscript:v30];
        v35 = [v34 trackingID];
        [v38 addObject:v35];
      }
      ++v30;
    }
    while ([v11 count] > v30);
  }
  v36 = -[CRTrackingAssociatorResults initWithTotalError:tracked:updatedRegionIDs:removedRegionIDs:addedRegionIDs:]([CRTrackingAssociatorResults alloc], v40, v41, v38, v39, 0.0);

  return v36;
}

@end