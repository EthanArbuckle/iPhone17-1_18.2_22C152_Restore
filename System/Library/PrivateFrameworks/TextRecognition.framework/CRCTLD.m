@interface CRCTLD
- (CRCTLD)initWithDelegate:(id)a3;
- (CRCTLDDelegate)delegate;
- (CTLDRegion)CTLDRegionFromCRRegion:(SEL)a3 index:(id)a4 imageSize:(int)a5 rotationAngle:(CGSize)a6 mainDirection:(float)a7;
- (double)angleThresholdForRotationCorrection;
- (double)getBaselineAngle:(id)a3;
- (double)getQuadrantOrientation:(id)a3;
- (float)getFeaturesGlobalAngle:(id)a3;
- (id)groupAndOrderRegions:(id)a3 config:(id)a4;
- (id)groupAndOrderRegions:(id)a3 config:(id)a4 delegate:(id)a5;
- (id)singleCTLDGroupingPass:(CRConstrainedTextLineDetectionImpl *)a3 textRegions:(id)a4;
- (unint64_t)getFeaturesMainLayoutDirection:(id)a3;
- (void)enforceQuadrilateralOrder:(CGPoint *)a3;
- (void)mirrorAxisX:(CGPoint *)a3;
- (void)setAngleThresholdForRotationCorrection:(double)a3;
@end

@implementation CRCTLD

- (CRCTLD)initWithDelegate:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CRCTLD;
  v5 = [(CRCTLD *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_delegate, v4);
  }

  return v6;
}

- (void)enforceQuadrilateralOrder:(CGPoint *)a3
{
  uint64_t v3 = 1;
  uint64_t v4 = 16;
  do
  {
    CGPoint v5 = a3[v3];
    uint64_t v6 = v4;
    uint64_t v7 = v3;
    while (1)
    {
      uint64_t v8 = v7 - 1;
      v9 = &a3[(v7 - 1)];
      if (v9->x <= v5.x) {
        break;
      }
      *(CGPoint *)((char *)a3 + v6) = *v9;
      v6 -= 16;
      --v7;
      if (v8 + 1 <= 1)
      {
        LODWORD(v7) = 0;
        break;
      }
    }
    a3[(int)v7] = v5;
    ++v3;
    v4 += 16;
  }
  while (v3 != 4);
  double y = a3->y;
  v11 = a3 + 1;
  double v12 = a3[1].y;
  if (y >= v12) {
    v13 = a3 + 1;
  }
  else {
    v13 = a3;
  }
  if (y >= v12) {
    v11 = a3;
  }
  CGPoint v14 = *v11;
  v15 = a3 + 2;
  double v16 = a3[2].y;
  double v17 = a3[3].y;
  if (v16 >= v17) {
    v18 = a3 + 3;
  }
  else {
    v18 = a3 + 2;
  }
  if (v16 < v17) {
    v15 = a3 + 3;
  }
  CGPoint v19 = *v15;
  CGPoint v20 = *v18;
  *a3 = *v13;
  a3[1] = v20;
  a3[2] = v14;
  a3[3] = v19;
}

- (double)getBaselineAngle:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 boundingQuad];
  CGPoint v5 = [v4 denormalizedQuad];
  [v5 bottomLeft];
  double v7 = v6;
  double v9 = v8;

  v10 = [v3 boundingQuad];
  v11 = [v10 denormalizedQuad];
  [v11 bottomRight];
  double v13 = v12;
  double v15 = v14;

  double v16 = atan2(-(v15 - v9), v13 - v7);
  return v16;
}

- (void)mirrorAxisX:(CGPoint *)a3
{
  for (uint64_t i = 0; i != 4; ++i)
    a3[i].x = -a3[i].x;
  CGPoint v4 = *a3;
  *a3 = a3[1];
  a3[1] = v4;
  CGPoint v5 = a3[2];
  a3[2] = a3[3];
  a3[3] = v5;
}

- (CTLDRegion)CTLDRegionFromCRRegion:(SEL)a3 index:(id)a4 imageSize:(int)a5 rotationAngle:(CGSize)a6 mainDirection:(float)a7
{
  double height = a6.height;
  double width = a6.width;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v15 = a4;
  double v16 = [v15 boundingQuad];
  double v17 = [v16 denormalizedQuad];

  [v17 topLeft];
  *(void *)&long long v28 = v18;
  *((void *)&v28 + 1) = v19;
  [v17 topRight];
  *(void *)&long long v29 = v20;
  *((void *)&v29 + 1) = v21;
  [v17 bottomLeft];
  *(void *)&long long v30 = v22;
  *((void *)&v30 + 1) = v23;
  [v17 bottomRight];
  *(void *)&long long v31 = v24;
  *((void *)&v31 + 1) = v25;
  [(CRCTLD *)self angleThresholdForRotationCorrection];
  if (v26 < fabsf(a7)) {
    rotatePolygon(&v28, (double *)&v28, width * 0.5, height * 0.5, a7);
  }
  [(CRCTLD *)self enforceQuadrilateralOrder:&v28];
  if (a8 == 2) {
    [(CRCTLD *)self mirrorAxisX:&v28];
  }
  CRTextRecognition::CRCTLD::CTLDRegion::CTLDRegion((uint64_t)retstr, &v28, &v29, &v30, &v31, a5, v15);

  return result;
}

- (double)getQuadrantOrientation:(id)a3
{
  v19[2] = *MEMORY[0x1E4F143B8];
  v19[0] = 0;
  v19[1] = 0;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v4);
        }
        -[CRCTLD getBaselineAngle:](self, "getBaselineAngle:", *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14);
        if (v8 <= 3.14159265)
        {
          if (v8 <= -3.14159265) {
            double v8 = v8 + 6.28318531;
          }
        }
        else
        {
          double v8 = v8 + -6.28318531;
        }
        double v9 = (v8 + 0.785398163 + 3.14159265) / 1.57079633;
        if ((int)v9 <= 0) {
          int v10 = -(-(int)v9 & 3);
        }
        else {
          int v10 = (int)v9 & 3;
        }
        ++*((_DWORD *)v19 + v10);
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v5);
  }

  uint64_t v11 = 0;
  int v12 = 0;
  do
  {
    if (*((_DWORD *)v19 + v12) < *((_DWORD *)v19 + v11)) {
      int v12 = v11;
    }
    ++v11;
  }
  while (v11 != 4);

  return (double)v12 * 1.57079633 + -3.14159265;
}

- (float)getFeaturesGlobalAngle:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count])
  {
    [(CRCTLD *)self getQuadrantOrientation:v4];
    double v6 = v5;
    double v7 = [MEMORY[0x1E4F1CA48] array];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v8 = v4;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v24 != v10) {
            objc_enumerationMutation(v8);
          }
          [(CRCTLD *)self getBaselineAngle:*(void *)(*((void *)&v23 + 1) + 8 * i)];
          double v13 = v12 - v6;
          if (v13 <= 3.14159265)
          {
            if (v13 <= -3.14159265) {
              double v13 = v13 + 6.28318531;
            }
          }
          else
          {
            double v13 = v13 + -6.28318531;
          }
          double v14 = -v13;
          if (v13 >= 0.0) {
            double v14 = v13;
          }
          if (v14 > 0.785398163)
          {
            if (v14 <= 2.35619449)
            {
              if (v13 >= 0.0) {
                double v13 = v13 + -1.57079633;
              }
              else {
                double v13 = v13 + 1.57079633;
              }
            }
            else
            {
              double v13 = v13 + 3.14159265;
              if (v13 <= 3.14159265)
              {
                if (v13 <= -3.14159265) {
                  double v13 = v13 + 6.28318531;
                }
              }
              else
              {
                double v13 = v13 + -6.28318531;
              }
            }
          }
          *(float *)&double v13 = v13;
          long long v15 = [NSNumber numberWithFloat:v13];
          [v7 addObject:v15];
        }
        uint64_t v9 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v9);
    }

    long long v16 = [v7 sortedArrayUsingSelector:sel_compare_];
    long long v17 = objc_msgSend(v16, "objectAtIndexedSubscript:", (unint64_t)objc_msgSend(v16, "count") >> 1);
    [v17 floatValue];
    double v19 = v6 + v18;
    if (v19 <= 3.14159265)
    {
      if (v19 > -3.14159265)
      {
LABEL_33:

        float v21 = v19;
        goto LABEL_34;
      }
      double v20 = 6.28318531;
    }
    else
    {
      double v20 = -6.28318531;
    }
    double v19 = v19 + v20;
    goto LABEL_33;
  }
  float v21 = 0.0;
LABEL_34:

  return v21;
}

- (unint64_t)getFeaturesMainLayoutDirection:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v24;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v24 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * v8), "layoutDirection"));
        uint64_t v10 = [v4 objectForKey:v9];
        BOOL v11 = v10 == 0;

        if (v11)
        {
          uint64_t v13 = 0;
        }
        else
        {
          double v12 = [v4 objectForKeyedSubscript:v9];
          uint64_t v13 = [v12 integerValue];
        }
        double v14 = [NSNumber numberWithInteger:v13 + 1];
        [v4 setObject:v14 forKeyedSubscript:v9];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v6);
  }

  uint64_t v19 = 0;
  double v20 = &v19;
  uint64_t v21 = 0x2020000000;
  uint64_t v22 = 0;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x2020000000;
  v18[3] = 0;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __41__CRCTLD_getFeaturesMainLayoutDirection___block_invoke;
  v17[3] = &unk_1E6CDB448;
  v17[4] = v18;
  v17[5] = &v19;
  [v4 enumerateKeysAndObjectsUsingBlock:v17];
  unint64_t v15 = v20[3];
  _Block_object_dispose(v18, 8);
  _Block_object_dispose(&v19, 8);

  return v15;
}

void __41__CRCTLD_getFeaturesMainLayoutDirection___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if ([v5 integerValue] > *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v5 integerValue];
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v6 integerValue];
  }
}

- (id)singleCTLDGroupingPass:(CRConstrainedTextLineDetectionImpl *)a3 textRegions:(id)a4
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  [(CRCTLD *)self getFeaturesGlobalAngle:v8];
  float v10 = v9;
  uint64_t v11 = [(CRCTLD *)self getFeaturesMainLayoutDirection:v8];
  if ([v8 count])
  {
    double v12 = [v8 objectAtIndexedSubscript:0];
    uint64_t v13 = [v12 boundingQuad];
    [v13 normalizationSize];
    double v4 = v14;
    double v5 = v15;
  }
  uint64_t v52 = 0;
  v53 = 0;
  unint64_t v54 = 0;
  std::vector<CRTextRecognition::CRCTLD::CTLDRegion>::reserve(&v52, [v8 count]);
  for (unint64_t i = 0; [v8 count] > i; ++i)
  {
    long long v17 = [v8 objectAtIndexedSubscript:i];
    *(float *)&double v18 = v10;
    -[CRCTLD CTLDRegionFromCRRegion:index:imageSize:rotationAngle:mainDirection:](self, "CTLDRegionFromCRRegion:index:imageSize:rotationAngle:mainDirection:", v17, i, v11, v4, v5, v18);
    uint64_t v19 = v53;
    if ((unint64_t)v53 >= v54)
    {
      uint64_t v25 = std::vector<CRTextRecognition::CRCTLD::CTLDRegion>::__emplace_back_slow_path<CRTextRecognition::CRCTLD::CTLDRegion>(&v52, (uint64_t)&v55);
    }
    else
    {
      _DWORD *v53 = v55;
      uint64_t v20 = *((void *)&v55 + 1);
      *((void *)&v55 + 1) = 0;
      *((void *)v19 + 1) = v20;
      long long v21 = v57;
      *((_OWORD *)v19 + 1) = v56;
      *((_OWORD *)v19 + 2) = v21;
      long long v22 = v58;
      long long v23 = v59;
      long long v24 = v60;
      v19[24] = v61;
      *((_OWORD *)v19 + 4) = v23;
      *((_OWORD *)v19 + 5) = v24;
      *((_OWORD *)v19 + 3) = v22;
      *((void *)v19 + 13) = 0;
      *((void *)v19 + 14) = 0;
      *((void *)v19 + 15) = 0;
      *(_OWORD *)(v19 + 26) = v62;
      *((void *)v19 + 15) = v63;
      long long v62 = 0uLL;
      uint64_t v63 = 0;
      uint64_t v25 = (uint64_t)(v19 + 32);
    }
    v53 = (_DWORD *)v25;
    v50 = (void **)&v62;
    std::vector<CRTextRecognition::CRCTLD::CTLDRegion>::__destroy_vector::operator()[abi:ne180100](&v50);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  CRTextRecognition::CRCTLD::CRConstrainedTextLineDetectionImpl::groupRegions((CRTextRecognition::CRCTLD::CRConstrainedTextLineDetectionImpl *)a3, (uint64_t)&v52, v11, WeakRetained, (uint64_t *)&v50);

  id v48 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v27 = v50;
  if (v51 != v50)
  {
    unint64_t v28 = 0;
    double v29 = fabsf(v10);
    double v30 = (float)-v10;
    do
    {
      long long v31 = &v27[16 * v28];
      long long v55 = *((_OWORD *)v31 + 2);
      long long v56 = *((_OWORD *)v31 + 3);
      long long v57 = *((_OWORD *)v31 + 4);
      long long v58 = *((_OWORD *)v31 + 5);
      if (v11 == 2) {
        [(CRCTLD *)self mirrorAxisX:&v55];
      }
      [(CRCTLD *)self angleThresholdForRotationCorrection];
      if (v32 < v29) {
        rotatePolygon(&v55, (double *)&v55, v4 * 0.5, v5 * 0.5, v30);
      }
      v33 = [CRNormalizedQuad alloc];
      v34 = [CRImageSpaceQuad alloc];
      v35 = -[CRImageSpaceQuad initWithTopLeft:topRight:bottomRight:bottomLeft:](v34, "initWithTopLeft:topRight:bottomRight:bottomLeft:", v55, *(double *)&v56, *((double *)&v56 + 1), *(double *)&v58, *((double *)&v58 + 1), *(double *)&v57, *((double *)&v57 + 1));
      v36 = -[CRNormalizedQuad initWithDenormalizedQuad:size:](v33, "initWithDenormalizedQuad:size:", v35, v4, v5);

      v37 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:((unsigned char *)v50[16 * v28 + 14] - (unsigned char *)v50[16 * v28 + 13]) >> 7];
      v38 = v50[16 * v28 + 13];
      if (v50[16 * v28 + 14] != v38)
      {
        uint64_t v39 = 0;
        unint64_t v40 = 0;
        do
        {
          v41 = [v8 objectAtIndexedSubscript:*(int *)&v38[v39]];
          [v37 addObject:v41];

          ++v40;
          v38 = v50[16 * v28 + 13];
          v39 += 128;
        }
        while (v40 < ((unsigned char *)v50[16 * v28 + 14] - v38) >> 7);
      }
      id v42 = objc_loadWeakRetained((id *)&self->_delegate);
      char v43 = objc_opt_respondsToSelector();

      if (v43)
      {
        id v44 = objc_loadWeakRetained((id *)&self->_delegate);
        v45 = [v44 groupWithQuad:v36 layoutDirection:0 subregions:v37];

        if (!v45) {
          goto LABEL_22;
        }
      }
      else
      {
        v45 = [[CRGroupRegion alloc] initWithBoundingQuad:v36 layoutDirection:0 subregions:v37];
        if (!v45)
        {
LABEL_22:
          v46 = CROSLogForCategory(0);
          if (os_log_type_enabled(v46, OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1DD733000, v46, OS_LOG_TYPE_FAULT, "GroupRegion is NULL in singleCTLDGroupingPass", buf, 2u);
          }

          goto LABEL_25;
        }
      }
      [v48 addObject:v45];
LABEL_25:

      ++v28;
      v27 = v50;
    }
    while (v28 < ((char *)v51 - (char *)v50) >> 7);
  }
  *(void *)&long long v55 = &v50;
  std::vector<CRTextRecognition::CRCTLD::CTLDRegion>::__destroy_vector::operator()[abi:ne180100]((void ***)&v55);
  *(void *)&long long v55 = &v52;
  std::vector<CRTextRecognition::CRCTLD::CTLDRegion>::__destroy_vector::operator()[abi:ne180100]((void ***)&v55);

  return v48;
}

- (id)groupAndOrderRegions:(id)a3 config:(id)a4 delegate:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [v9 allowedOverlap];
  int v12 = v11;
  int v13 = [v9 maxRegions];
  int v14 = [v9 maxQueueCapacity];
  [v9 minWhitespaceWidth];
  int v16 = v15;
  [v9 minWhitespaceHeight];
  int v18 = v17;
  int v19 = [v9 numLookupElements];
  int v20 = [v9 numPointsForSegmentsIntersection];
  [v9 qualityHeightFactor];
  int v22 = v21;
  [v9 qualityWidthFactor];
  int v24 = v23;
  [v9 minSubRectangleSize];
  int v26 = v25;
  [v9 minQuadrilateralRotation];
  int v28 = v27;
  char v29 = [v9 flatMergeJumps];
  [v9 minWhitespaceHeightForReadingOrder];
  v34[0] = v12;
  v34[1] = v13;
  v34[2] = v14;
  v34[3] = v16;
  v34[4] = v18;
  v34[5] = v26;
  v34[6] = v28;
  v34[7] = v30;
  v34[8] = v19;
  v34[9] = v20;
  v34[10] = v22;
  v34[11] = v24;
  char v35 = v29;
  [v9 angleThresholdForRotationCorrection];
  self->_angleThresholdForRotationCorrection = v31;
  objc_storeWeak((id *)&self->_delegate, v10);
  double v32 = [(CRCTLD *)self singleCTLDGroupingPass:v34 textRegions:v8];

  return v32;
}

- (id)groupAndOrderRegions:(id)a3 config:(id)a4
{
  double v4 = [(CRCTLD *)self groupAndOrderRegions:a3 config:a4 delegate:0];
  return v4;
}

- (double)angleThresholdForRotationCorrection
{
  return self->_angleThresholdForRotationCorrection;
}

- (void)setAngleThresholdForRotationCorrection:(double)a3
{
  self->_angleThresholdForRotationCorrection = a3;
}

- (CRCTLDDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CRCTLDDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end