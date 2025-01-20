@interface CRTextFeatureOrderV2
- (CRTextFeatureOrderV2)initWithAngleThresholdForRotatedCrops:(double)a3;
- (double)angleThresholdForRotatedCrops;
- (id)createCoarseCTLDConfig;
- (id)createFineCTLDConfig;
- (id)orderAndGroupRegions:(id)a3;
- (id)orderAndGroupRegions:(id)a3 coarseDelegate:(id)a4 fineDelegate:(id)a5;
- (id)orderAndGroupRegions:(id)a3 coarseDelegate:(id)a4 fineDelegate:(id)a5 coarseOnly:(BOOL)a6;
- (id)orderAndGroupRegions:(id)a3 tableGroups:(id)a4;
- (id)rowOrderLinesFromTable:(id)a3 cellGroups:(id)a4 outSortedCellGroups:(id)a5;
- (int64_t)textFeatureOrderMode;
- (void)setAngleThresholdForRotatedCrops:(double)a3;
- (void)setTextFeatureOrderMode:(int64_t)a3;
@end

@implementation CRTextFeatureOrderV2

- (CRTextFeatureOrderV2)initWithAngleThresholdForRotatedCrops:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CRTextFeatureOrderV2;
  result = [(CRTextFeatureOrderV2 *)&v5 init];
  if (result)
  {
    result->_textFeatureOrderMode = 0;
    result->_angleThresholdForRotatedCrops = a3;
  }
  return result;
}

- (id)orderAndGroupRegions:(id)a3
{
  v3 = [(CRTextFeatureOrderV2 *)self orderAndGroupRegions:a3 coarseDelegate:0 fineDelegate:0 coarseOnly:0];
  return v3;
}

- (id)orderAndGroupRegions:(id)a3 tableGroups:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    uint64_t v8 = +[CRCTLDDelegateTablesCoarse delegateWithTableGroups:v7 textRegions:v6];
    v9 = +[CRCTLDDelegateTablesCoarse delegateWithTableGroups:v7 textRegions:v6];
    v10 = (void *)v8;
  }
  else
  {
    v9 = 0;
    v10 = 0;
  }
  v11 = [(CRTextFeatureOrderV2 *)self orderAndGroupRegions:v6 coarseDelegate:v10 fineDelegate:v9 coarseOnly:0];

  return v11;
}

- (id)rowOrderLinesFromTable:(id)a3 cellGroups:(id)a4 outSortedCellGroups:(id)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a5;
  uint64_t v8 = (void *)MEMORY[0x1E4F1CA48];
  v9 = [v6 subregions];
  v10 = objc_msgSend(v8, "arrayWithCapacity:", objc_msgSend(v9, "count"));

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v11 = objc_msgSend(v6, "cells", 0);
  uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v11);
        }
        v15 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        [v7 addObject:v15];
        v16 = [v15 subregions];
        [v10 addObjectsFromArray:v16];
      }
      uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v12);
  }

  return v10;
}

- (id)orderAndGroupRegions:(id)a3 coarseDelegate:(id)a4 fineDelegate:(id)a5 coarseOnly:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v41 = a5;
  v34 = v9;
  v35 = v10;
  if ([v9 count])
  {
    v32 = [(CRTextFeatureOrderV2 *)self createCoarseCTLDConfig];
    v40 = objc_alloc_init(CRCTLD);
    v33 = [(CRCTLD *)v40 groupAndOrderRegions:v9 config:v32 delegate:v10];
    if (v6)
    {
      v11 = v33;
      id v12 = v33;
    }
    else
    {
      v39 = [(CRTextFeatureOrderV2 *)self createFineCTLDConfig];
      id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v50 = 0u;
      long long v51 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      obuint64_t j = v33;
      uint64_t v13 = [obj countByEnumeratingWithState:&v48 objects:v53 count:16];
      if (v13)
      {
        uint64_t v38 = *(void *)v49;
        do
        {
          uint64_t v42 = v13;
          for (uint64_t i = 0; i != v42; ++i)
          {
            if (*(void *)v49 != v38) {
              objc_enumerationMutation(obj);
            }
            v15 = *(void **)(*((void *)&v48 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v16 = v15;
              v17 = [v16 subregions];
              id v18 = [(CRCTLD *)v40 groupAndOrderRegions:v17 config:v39 delegate:v41];

              long long v19 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v18, "count"));
              v43 = [(CRTextFeatureOrderV2 *)self rowOrderLinesFromTable:v16 cellGroups:v18 outSortedCellGroups:v19];
              long long v20 = [CRTableGroupRegion alloc];
              long long v21 = [v16 boundingQuad];
              uint64_t v22 = [v16 layoutDirection];
              uint64_t v23 = [v16 rowQuads];
              v24 = [v16 columnQuads];
              v25 = [(CRTableGroupRegion *)v20 initWithBoundingQuad:v21 layoutDirection:v22 cells:v19 lineRegions:v43 rowQuads:v23 columnQuads:v24];
              [v12 addObject:v25];
            }
            else
            {
              v26 = [v15 subregions];
              v27 = [(CRCTLD *)v40 groupAndOrderRegions:v26 config:v39 delegate:v41];

              long long v46 = 0u;
              long long v47 = 0u;
              long long v44 = 0u;
              long long v45 = 0u;
              id v18 = v27;
              uint64_t v28 = [v18 countByEnumeratingWithState:&v44 objects:v52 count:16];
              if (v28)
              {
                uint64_t v29 = *(void *)v45;
                do
                {
                  for (uint64_t j = 0; j != v28; ++j)
                  {
                    if (*(void *)v45 != v29) {
                      objc_enumerationMutation(v18);
                    }
                    [v12 addObject:*(void *)(*((void *)&v44 + 1) + 8 * j)];
                  }
                  uint64_t v28 = [v18 countByEnumeratingWithState:&v44 objects:v52 count:16];
                }
                while (v28);
              }
              id v16 = v18;
            }
          }
          uint64_t v13 = [obj countByEnumeratingWithState:&v48 objects:v53 count:16];
        }
        while (v13);
      }

      v11 = v33;
    }
  }
  else
  {
    id v12 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v12;
}

- (id)orderAndGroupRegions:(id)a3 coarseDelegate:(id)a4 fineDelegate:(id)a5
{
  objc_super v5 = [(CRTextFeatureOrderV2 *)self orderAndGroupRegions:a3 coarseDelegate:a4 fineDelegate:a5 coarseOnly:0];
  return v5;
}

- (id)createCoarseCTLDConfig
{
  v3 = objc_alloc_init(CRCTLDConfig);
  double angleThresholdForRotatedCrops = self->_angleThresholdForRotatedCrops;
  *(float *)&double angleThresholdForRotatedCrops = angleThresholdForRotatedCrops;
  [(CRCTLDConfig *)v3 setAngleThresholdForRotationCorrection:angleThresholdForRotatedCrops];
  [(CRCTLDConfig *)v3 setFlatMergeJumps:0];
  int64_t v5 = [(CRTextFeatureOrderV2 *)self textFeatureOrderMode];
  if (v5)
  {
    if (v5 != 1) {
      goto LABEL_6;
    }
    LODWORD(v6) = 1062501089;
    [(CRCTLDConfig *)v3 setAllowedOverlap:v6];
    [(CRCTLDConfig *)v3 setMaxRegions:123];
    [(CRCTLDConfig *)v3 setMaxQueueCapacity:0xFFFFFFFFLL];
    LODWORD(v7) = 1072902963;
    [(CRCTLDConfig *)v3 setMinWhitespaceWidth:v7];
    LODWORD(v8) = 1070889697;
    [(CRCTLDConfig *)v3 setMinWhitespaceHeight:v8];
    [(CRCTLDConfig *)v3 setNumLookupElements:38];
    [(CRCTLDConfig *)v3 setNumPointsForSegmentsIntersection:5];
    LODWORD(v9) = 1076593951;
    [(CRCTLDConfig *)v3 setQualityHeightFactor:v9];
    LODWORD(v10) = 1054615798;
  }
  else
  {
    LODWORD(v6) = 1063675494;
    [(CRCTLDConfig *)v3 setAllowedOverlap:v6];
    [(CRCTLDConfig *)v3 setMaxRegions:60];
    [(CRCTLDConfig *)v3 setMaxQueueCapacity:0xFFFFFFFFLL];
    LODWORD(v11) = 1047904911;
    [(CRCTLDConfig *)v3 setMinWhitespaceWidth:v11];
    LODWORD(v12) = 1073993482;
    [(CRCTLDConfig *)v3 setMinWhitespaceHeight:v12];
    [(CRCTLDConfig *)v3 setNumLookupElements:40];
    [(CRCTLDConfig *)v3 setNumPointsForSegmentsIntersection:9];
    LODWORD(v13) = 1081333514;
    [(CRCTLDConfig *)v3 setQualityHeightFactor:v13];
    LODWORD(v10) = 1065688760;
  }
  [(CRCTLDConfig *)v3 setQualityWidthFactor:v10];
  LODWORD(v14) = 8.0;
  [(CRCTLDConfig *)v3 setMinSubRectangleSize:v14];
  LODWORD(v15) = 1035122882;
  [(CRCTLDConfig *)v3 setMinQuadrilateralRotation:v15];
  LODWORD(v16) = 1065185444;
  [(CRCTLDConfig *)v3 setMinWhitespaceHeightForReadingOrder:v16];
LABEL_6:
  return v3;
}

- (id)createFineCTLDConfig
{
  v3 = objc_alloc_init(CRCTLDConfig);
  double angleThresholdForRotatedCrops = self->_angleThresholdForRotatedCrops;
  *(float *)&double angleThresholdForRotatedCrops = angleThresholdForRotatedCrops;
  [(CRCTLDConfig *)v3 setAngleThresholdForRotationCorrection:angleThresholdForRotatedCrops];
  [(CRCTLDConfig *)v3 setFlatMergeJumps:1];
  int64_t v5 = [(CRTextFeatureOrderV2 *)self textFeatureOrderMode];
  if (v5)
  {
    if (v5 != 1) {
      goto LABEL_6;
    }
    LODWORD(v6) = 1065185444;
    [(CRCTLDConfig *)v3 setAllowedOverlap:v6];
    [(CRCTLDConfig *)v3 setMaxRegions:163];
    [(CRCTLDConfig *)v3 setMaxQueueCapacity:0xFFFFFFFFLL];
    LODWORD(v7) = 1053609165;
    [(CRCTLDConfig *)v3 setMinWhitespaceWidth:v7];
    LODWORD(v8) = 1065688760;
    [(CRCTLDConfig *)v3 setMinWhitespaceHeight:v8];
    [(CRCTLDConfig *)v3 setNumLookupElements:46];
    [(CRCTLDConfig *)v3 setNumPointsForSegmentsIntersection:10];
    LODWORD(v9) = 1068876431;
    [(CRCTLDConfig *)v3 setQualityHeightFactor:v9];
    LODWORD(v10) = 1046562734;
  }
  else
  {
    LODWORD(v6) = 1050589266;
    [(CRCTLDConfig *)v3 setAllowedOverlap:v6];
    [(CRCTLDConfig *)v3 setMaxRegions:169];
    [(CRCTLDConfig *)v3 setMaxQueueCapacity:0xFFFFFFFFLL];
    LODWORD(v11) = 1051260355;
    [(CRCTLDConfig *)v3 setMinWhitespaceWidth:v11];
    LODWORD(v12) = 1063843267;
    [(CRCTLDConfig *)v3 setMinWhitespaceHeight:v12];
    [(CRCTLDConfig *)v3 setNumLookupElements:57];
    [(CRCTLDConfig *)v3 setNumPointsForSegmentsIntersection:4];
    LODWORD(v13) = 1078523331;
    [(CRCTLDConfig *)v3 setQualityHeightFactor:v13];
    LODWORD(v10) = 1066863165;
  }
  [(CRCTLDConfig *)v3 setQualityWidthFactor:v10];
  LODWORD(v14) = 8.0;
  [(CRCTLDConfig *)v3 setMinSubRectangleSize:v14];
  LODWORD(v15) = 1035122882;
  [(CRCTLDConfig *)v3 setMinQuadrilateralRotation:v15];
  LODWORD(v16) = 1060320051;
  [(CRCTLDConfig *)v3 setMinWhitespaceHeightForReadingOrder:v16];
LABEL_6:
  return v3;
}

- (int64_t)textFeatureOrderMode
{
  return self->_textFeatureOrderMode;
}

- (void)setTextFeatureOrderMode:(int64_t)a3
{
  self->_textFeatureOrderMode = a3;
}

- (double)angleThresholdForRotatedCrops
{
  return self->_angleThresholdForRotatedCrops;
}

- (void)setAngleThresholdForRotatedCrops:(double)a3
{
  self->_double angleThresholdForRotatedCrops = a3;
}

@end