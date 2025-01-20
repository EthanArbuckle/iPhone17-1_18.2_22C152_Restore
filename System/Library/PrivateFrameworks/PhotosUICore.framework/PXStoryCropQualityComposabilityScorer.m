@interface PXStoryCropQualityComposabilityScorer
- (_PXStoryAutoEditCropScoreInfo)_computeCropScoreForDisplayAsset:(id)a3 diptychAspectRatio:(double)a4 triptychAspectRatio:(double)a5;
- (id).cxx_construct;
- (id)computeComposabilityScoresForDisplayAssets:(id)a3 error:(id *)a4;
- (id)diagnosticDescription;
@end

@implementation PXStoryCropQualityComposabilityScorer

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  *((void *)self + 3) = 0;
  return self;
}

- (void).cxx_destruct
{
  begin = self->_scores.__begin_;
  if (begin)
  {
    self->_scores.__end_ = begin;
    operator delete(begin);
  }
}

- (_PXStoryAutoEditCropScoreInfo)_computeCropScoreForDisplayAsset:(id)a3 diptychAspectRatio:(double)a4 triptychAspectRatio:(double)a5
{
  uint64_t v109 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  [v5 acceptableCropRect];
  uint64_t v90 = v7;
  uint64_t v91 = v6;
  uint64_t v92 = v8;
  uint64_t v10 = v9;
  [v5 preferredCropRect];
  uint64_t v86 = v12;
  uint64_t v87 = v11;
  uint64_t v88 = v14;
  uint64_t v89 = v13;
  uint64_t v79 = v10;
  [v5 faceAreaRect];
  double x = v111.origin.x;
  double y = v111.origin.y;
  double width = v111.size.width;
  double height = v111.size.height;
  v19 = (double *)MEMORY[0x1E4F1DB20];
  double v20 = *MEMORY[0x1E4F1DB20];
  double v21 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  double v22 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  double v23 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  BOOL IsNull = CGRectIsNull(v111);
  double v25 = 1.0 - (y + height);
  if (IsNull) {
    double v26 = v20;
  }
  else {
    double v26 = x;
  }
  if (IsNull) {
    double v25 = v21;
  }
  double v82 = v25;
  double v83 = v26;
  if (IsNull) {
    double v27 = v22;
  }
  else {
    double v27 = width;
  }
  if (IsNull) {
    double v28 = v23;
  }
  else {
    double v28 = height;
  }
  double v84 = v28;
  double v85 = v27;
  double v96 = 0.0;
  objc_msgSend(MEMORY[0x1E4F8CBF8], "bestCropRectV2ForAspectRatio:withFocusRegion:sourcePixelWidth:sourcePixelHeight:sourcePreferredCropRectNormalized:sourceAcceptableCropRectNormalized:sourceFaceAreaRectNormalized:outputCropScore:", objc_msgSend(v5, "pixelWidth"), objc_msgSend(v5, "pixelHeight"), &v96, a4, *v19, v19[1], v19[2], v19[3], v87, v86, v89, v88, v91, v90, v79, v92,
    *(void *)&v83,
    *(void *)&v82,
    *(void *)&v27,
    *(void *)&v28);
  uint64_t v78 = v29;
  uint64_t v31 = v30;
  uint64_t v33 = v32;
  uint64_t v35 = v34;
  double v95 = 0.0;
  objc_msgSend(MEMORY[0x1E4F8CBF8], "bestCropRectV2ForAspectRatio:withFocusRegion:sourcePixelWidth:sourcePixelHeight:sourcePreferredCropRectNormalized:sourceAcceptableCropRectNormalized:sourceFaceAreaRectNormalized:outputCropScore:", objc_msgSend(v5, "pixelWidth"), objc_msgSend(v5, "pixelHeight"), &v95, 1.0 / a4, *v19, v19[1], v19[2], v19[3], v87, v86, v89, v88, v91, v90, v79, v92,
    *(void *)&v83,
    *(void *)&v82,
    *(void *)&v85,
    *(void *)&v84);
  uint64_t v37 = v36;
  uint64_t v39 = v38;
  uint64_t v41 = v40;
  uint64_t v43 = v42;
  v44 = PLStoryGetLog();
  if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
  {
    v45 = [v5 uuid];
    id v46 = (id)[[NSString alloc] initWithFormat:@"{{%.2f, %.2f}, {%.2f, %.2f}}", v31, v78, v33, v35];
    double v47 = v96;
    v48 = (void *)[[NSString alloc] initWithFormat:@"{{%.2f, %.2f}, {%.2f, %.2f}}", v37, v39, v41, v43];
    *(_DWORD *)buf = 138544642;
    v98 = v45;
    __int16 v99 = 2048;
    double v100 = a4;
    __int16 v101 = 2114;
    id v102 = v46;
    __int16 v103 = 2048;
    double v104 = v47;
    __int16 v105 = 2114;
    v106 = v48;
    __int16 v107 = 2048;
    double v108 = v95;
    _os_log_impl(&dword_1A9AE7000, v44, OS_LOG_TYPE_DEBUG, "best crop rect for asset %{public}@ with aspect ratio: %0.3f horizontal crop=%{public}@ score=%0.3f, vertical crop=%{public}@ score=%0.3f", buf, 0x3Eu);
  }
  double v94 = 0.0;
  objc_msgSend(MEMORY[0x1E4F8CBF8], "bestCropRectV2ForAspectRatio:withFocusRegion:sourcePixelWidth:sourcePixelHeight:sourcePreferredCropRectNormalized:sourceAcceptableCropRectNormalized:sourceFaceAreaRectNormalized:outputCropScore:", objc_msgSend(v5, "pixelWidth"), objc_msgSend(v5, "pixelHeight"), &v94, a5, *v19, v19[1], v19[2], v19[3], v87, v86, v89, v88, v91, v90, v79, v92,
    *(void *)&v83,
    *(void *)&v82,
    *(void *)&v85,
    *(void *)&v84);
  uint64_t v50 = v49;
  uint64_t v52 = v51;
  uint64_t v54 = v53;
  uint64_t v56 = v55;
  double v93 = 0.0;
  objc_msgSend(MEMORY[0x1E4F8CBF8], "bestCropRectV2ForAspectRatio:withFocusRegion:sourcePixelWidth:sourcePixelHeight:sourcePreferredCropRectNormalized:sourceAcceptableCropRectNormalized:sourceFaceAreaRectNormalized:outputCropScore:", objc_msgSend(v5, "pixelWidth"), objc_msgSend(v5, "pixelHeight"), &v93, 1.0 / a5, *v19, v19[1], v19[2], v19[3], v87, v86, v89, v88, v91, v90, v79, v92,
    *(void *)&v83,
    *(void *)&v82,
    *(void *)&v85,
    *(void *)&v84);
  uint64_t v58 = v57;
  uint64_t v60 = v59;
  uint64_t v62 = v61;
  uint64_t v64 = v63;
  v65 = PLStoryGetLog();
  if (os_log_type_enabled(v65, OS_LOG_TYPE_DEBUG))
  {
    v66 = [v5 uuid];
    id v67 = (id)[[NSString alloc] initWithFormat:@"{{%.2f, %.2f}, {%.2f, %.2f}}", v50, v52, v54, v56];
    double v68 = v94;
    v69 = (void *)[[NSString alloc] initWithFormat:@"{{%.2f, %.2f}, {%.2f, %.2f}}", v58, v60, v62, v64];
    *(_DWORD *)buf = 138544642;
    v98 = v66;
    __int16 v99 = 2048;
    double v100 = a5;
    __int16 v101 = 2114;
    id v102 = v67;
    __int16 v103 = 2048;
    double v104 = v68;
    __int16 v105 = 2114;
    v106 = v69;
    __int16 v107 = 2048;
    double v108 = v93;
    _os_log_impl(&dword_1A9AE7000, v65, OS_LOG_TYPE_DEBUG, "best crop rect for asset %{public}@ with aspect ratio: %0.3f horizontal crop=%{public}@ score=%0.3f, vertical crop=%{public}@ score=%0.3f", buf, 0x3Eu);
  }
  double v71 = v94;
  double v70 = v95;
  double v72 = v96;
  double v73 = v93;

  float v74 = v70;
  float v75 = v72;
  float v76 = v73;
  float v77 = v71;
  result.var1.var1 = v77;
  result.var1.var0 = v76;
  result.var0.var1 = v75;
  result.var0.var0 = v74;
  return result;
}

- (id)computeComposabilityScoresForDisplayAssets:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v55 = -[PXStoryComposabilityScoresArray initWithCapacity:]([PXStoryComposabilityScoresMutableArray alloc], "initWithCapacity:", [v5 count]);
  uint64_t v6 = +[PXStorySettings sharedInstance];
  [v6 autoEditDiptychCropAspectMax];
  double v8 = v7;
  uint64_t v54 = v6;
  [v6 autoEditTriptychCropAspectMax];
  double v10 = v9;
  self->_scores.__end_ = self->_scores.__begin_;
  unint64_t v11 = [v5 count];
  unint64_t v12 = v11;
  begin = self->_scores.__begin_;
  if (v11 > self->_scores.__end_cap_.__value_ - begin)
  {
    if (v11 >> 60) {
      std::vector<PXStoryAutoEditComposabilityScores>::__throw_length_error[abi:ne180100]();
    }
    end = self->_scores.__end_;
    v15 = (char *)operator new(16 * v11);
    v16 = (_PXStoryAutoEditCropScoreInfo *)&v15[((char *)end - (char *)begin) & 0xFFFFFFFFFFFFFFF0];
    v17 = v16;
    if (end != begin)
    {
      v18 = (_PXStoryAutoEditCropScoreInfo *)&v15[((char *)end - (char *)begin) & 0xFFFFFFFFFFFFFFF0];
      do
      {
        v17 = v18 - 1;
        v18[-1] = end[-1];
        --end;
        --v18;
      }
      while (end != begin);
    }
    self->_scores.__begin_ = v17;
    self->_scores.__end_ = v16;
    self->_scores.__end_cap_.__value_ = (_PXStoryAutoEditCropScoreInfo *)&v15[16 * v12];
    if (begin) {
      operator delete(begin);
    }
  }
  for (uint64_t i = 0; i < [v5 count]; ++i)
  {
    double v20 = [v5 objectAtIndexedSubscript:i];
    [(PXStoryCropQualityComposabilityScorer *)self _computeCropScoreForDisplayAsset:v20 diptychAspectRatio:v8 triptychAspectRatio:v10];
    float v25 = v21;
    float v26 = v22;
    float v27 = v23;
    float v28 = v24;
    uint64_t v30 = self->_scores.__end_;
    value = self->_scores.__end_cap_.__value_;
    if (v30 >= value)
    {
      uint64_t v32 = self->_scores.__begin_;
      uint64_t v33 = v30 - v32;
      unint64_t v34 = v33 + 1;
      if ((unint64_t)(v33 + 1) >> 60) {
        std::vector<PXStoryAutoEditComposabilityScores>::__throw_length_error[abi:ne180100]();
      }
      uint64_t v35 = (char *)value - (char *)v32;
      if (v35 >> 3 > v34) {
        unint64_t v34 = v35 >> 3;
      }
      if ((unint64_t)v35 >= 0x7FFFFFFFFFFFFFF0) {
        unint64_t v36 = 0xFFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v36 = v34;
      }
      if (v36)
      {
        if (v36 >> 60) {
          std::__throw_bad_array_new_length[abi:ne180100]();
        }
        uint64_t v37 = (char *)operator new(16 * v36);
      }
      else
      {
        uint64_t v37 = 0;
      }
      uint64_t v38 = &v37[16 * v33];
      *(float *)uint64_t v38 = v25;
      *((float *)v38 + 1) = v26;
      *((float *)v38 + 2) = v27;
      *((float *)v38 + 3) = v28;
      uint64_t v39 = (_PXStoryAutoEditCropScoreInfo *)v38;
      if (v30 != v32)
      {
        do
        {
          v39[-1] = v30[-1];
          --v39;
          --v30;
        }
        while (v30 != v32);
        uint64_t v30 = self->_scores.__begin_;
      }
      uint64_t v31 = (_PXStoryAutoEditCropScoreInfo *)(v38 + 16);
      self->_scores.__begin_ = v39;
      self->_scores.__end_ = (_PXStoryAutoEditCropScoreInfo *)(v38 + 16);
      self->_scores.__end_cap_.__value_ = (_PXStoryAutoEditCropScoreInfo *)&v37[16 * v36];
      if (v30) {
        operator delete(v30);
      }
    }
    else
    {
      v30->var0.float var0 = v21;
      v30->var0.float var1 = v22;
      uint64_t v31 = v30 + 1;
      v30->var1.float var0 = v23;
      v30->var1.float var1 = v24;
    }
    self->_scores.__end_ = v31;
  }
  uint64_t v40 = 0;
  uint64_t v41 = 0;
  float v42 = 0.0;
  float v43 = 0.0;
  float v44 = 0.0;
  float v45 = 0.0;
  while (v41 < [v5 count])
  {
    id v46 = &self->_scores.__begin_[v40];
    if (v46->var0.var1 >= v46->var0.var0) {
      float var0 = v46->var0.var0;
    }
    else {
      float var0 = v46->var0.var1;
    }
    float var1 = v46->var1.var1;
    if (var1 >= v46->var1.var0) {
      float var1 = v46->var1.var0;
    }
    float v49 = fminf(fmaxf((float)(var1 + -0.5) * 4.0, 0.0), 1.0);
    if ((unint64_t)v41 >= 2)
    {
      LODWORD(v50) = cbrtf((float)(v43 * v45) * v49);
      LODWORD(v51) = sqrtf(v42 * v44);
      -[PXStoryComposabilityScoresMutableArray addComposabilityScores:](v55, "addComposabilityScores:", v51, v50);
    }
    ++v41;
    float v42 = v44;
    float v44 = fminf(fmaxf((float)(var0 + -0.5) * 4.0, 0.0), 1.0);
    ++v40;
    float v43 = v45;
    float v45 = v49;
  }
  if ([v5 count] >= 2)
  {
    *(float *)&double v52 = sqrtf(v42 * v44);
    -[PXStoryComposabilityScoresMutableArray addComposabilityScores:](v55, "addComposabilityScores:", v52, 0.0);
  }

  return v55;
}

- (id)diagnosticDescription
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [v3 appendString:@"-- Diptych Crop Score Details --\n"];
  [v3 appendString:@"Idx\tVert.\tHoriz.\tScore\n"];
  begin = self->_scores.__begin_;
  end = self->_scores.__end_;
  if (begin != end)
  {
    uint64_t v6 = 0;
    do
    {
      float var1 = begin->var0.var1;
      if (var1 >= begin->var0.var0) {
        float var0 = begin->var0.var0;
      }
      else {
        float var0 = begin->var0.var1;
      }
      objc_msgSend(v3, "appendFormat:", @"%lu\t%0.3f\t%0.3f\t%0.3f\n", v6++, begin->var0.var0, var1, fminf(fmaxf((float)(var0 + -0.5) * 4.0, 0.0), 1.0));
      ++begin;
    }
    while (begin != end);
  }
  [v3 appendString:@"\n"];
  [v3 appendString:@"-- Triptych Crop Score Details --\n"];
  [v3 appendString:@"Idx\tVert.\tHoriz.\tScore\n"];
  double v9 = self->_scores.__begin_;
  double v10 = self->_scores.__end_;
  if (v9 != v10)
  {
    uint64_t v11 = 0;
    do
    {
      float v12 = v9->var1.var0;
      float v13 = v9->var1.var1;
      if (v13 >= v12) {
        float v14 = v9->var1.var0;
      }
      else {
        float v14 = v9->var1.var1;
      }
      objc_msgSend(v3, "appendFormat:", @"%lu\t%0.3f\t%0.3f\t%0.3f\n", v11++, v12, v13, fminf(fmaxf((float)(v14 + -0.5) * 4.0, 0.0), 1.0));
      ++v9;
    }
    while (v9 != v10);
  }
  [v3 appendString:@"\n"];
  return v3;
}

@end