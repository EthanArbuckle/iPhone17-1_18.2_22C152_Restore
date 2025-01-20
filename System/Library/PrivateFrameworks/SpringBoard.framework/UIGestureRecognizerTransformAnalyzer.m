@interface UIGestureRecognizerTransformAnalyzer
- (UIGestureRecognizerTransformAnalyzer)init;
- (UIGestureRecognizerTransformAnalyzerInfo)smoothedInfo;
- (double)pinchingWeight;
- (double)rotationWeight;
- (double)translationWeight;
- (id)analyzeTouches:(id)a3;
- (int)dominantComponent;
- (void)reset;
- (void)setPinchingWeight:(double)a3;
- (void)setRotationWeight:(double)a3;
- (void)setTranslationWeight:(double)a3;
@end

@implementation UIGestureRecognizerTransformAnalyzer

- (UIGestureRecognizerTransformAnalyzer)init
{
  v12.receiver = self;
  v12.super_class = (Class)UIGestureRecognizerTransformAnalyzer;
  v2 = [(UIGestureRecognizerTransformAnalyzer *)&v12 init];
  v3 = v2;
  if (v2)
  {
    __asm { FMOV            V0.2D, #1.0 }
    *(_OWORD *)&v2->_translationWeight = _Q0;
    v2->_rotationWeight = 1.0;
    v9 = objc_alloc_init(UIGestureRecognizerTransformAnalyzerInfo);
    smoothedInfo = v3->_smoothedInfo;
    v3->_smoothedInfo = v9;
  }
  return v3;
}

- (void)reset
{
}

- (id)analyzeTouches:(id)a3
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 count];
  double v6 = *MEMORY[0x1E4F1DAD8];
  double v7 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  double v8 = 0.0;
  if (v5)
  {
    unint64_t v9 = v5;
    if (v5 == 1)
    {
      v10 = [v4 anyObject];
      [v10 _locationInSceneReferenceSpace];
      double v12 = v11;
      double v14 = v13;
      [v10 _previousLocationInSceneReferenceSpace];
      double v16 = v12 - v15;
      double v18 = v14 - v17;
      double v6 = vabdd_f64(v12, v15);
      double v7 = vabdd_f64(v14, v17);

      double v19 = 0.0;
    }
    else
    {
      double v20 = _CentroidOfTouches(v4, 0);
      double v69 = v21;
      double v70 = v20;
      long long v71 = 0u;
      long long v72 = 0u;
      long long v73 = 0u;
      long long v74 = 0u;
      id v22 = v4;
      uint64_t v23 = [v22 countByEnumeratingWithState:&v71 objects:v75 count:16];
      if (v23)
      {
        uint64_t v24 = v23;
        uint64_t v25 = *(void *)v72;
        double v26 = 0.0;
        double v27 = v7;
        double v28 = v6;
        do
        {
          for (uint64_t i = 0; i != v24; ++i)
          {
            if (*(void *)v72 != v25) {
              objc_enumerationMutation(v22);
            }
            v30 = *(void **)(*((void *)&v71 + 1) + 8 * i);
            objc_msgSend(v30, "_locationInSceneReferenceSpace", *(void *)&v69);
            double v32 = v31;
            double v34 = v33;
            [v30 _previousLocationInSceneReferenceSpace];
            double v36 = v32 - v35;
            double v38 = v34 - v37;
            double v28 = v28 + v32 - v35;
            double v27 = v27 + v34 - v37;
            double v6 = v6 + vabdd_f64(v32, v35);
            double v7 = v7 + vabdd_f64(v34, v37);
            float v39 = (v34 - v69) * (v34 - v69) + (v32 - v70) * (v32 - v70);
            double v40 = sqrtf(v39);
            double v41 = (v32 - v70) / v40;
            double v42 = (v34 - v69) / v40;
            double v8 = v8 + v38 * v42 + v36 * v41;
            double v26 = v26 + v36 * v42 - v38 * v41;
          }
          uint64_t v24 = [v22 countByEnumeratingWithState:&v71 objects:v75 count:16];
        }
        while (v24);
      }
      else
      {
        double v26 = 0.0;
        double v27 = v7;
        double v28 = v6;
      }

      double v16 = v28 / (double)v9;
      double v18 = v27 / (double)v9;
      double v6 = v6 / (double)v9;
      double v7 = v7 / (double)v9;
      double v19 = v8 / (double)v9;
      double v8 = v26 / (double)v9;
    }
  }
  else
  {
    double v19 = 0.0;
    double v18 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    double v16 = *MEMORY[0x1E4F1DAD8];
  }
  float v43 = v18 * v18 + v16 * v16;
  double v44 = sqrtf(v43);
  v45 = objc_alloc_init(UIGestureRecognizerTransformAnalyzerInfo);
  -[UIGestureRecognizerTransformAnalyzerInfo _setTranslation:](v45, "_setTranslation:", v16, v18);
  [(UIGestureRecognizerTransformAnalyzerInfo *)v45 _setTranslationMagnitude:v44];
  -[UIGestureRecognizerTransformAnalyzerInfo _setAbsoluteTranslation:](v45, "_setAbsoluteTranslation:", v6, v7);
  [(UIGestureRecognizerTransformAnalyzerInfo *)v45 _setScale:v19];
  [(UIGestureRecognizerTransformAnalyzerInfo *)v45 _setRotation:v8];
  smoothedInfo = self->_smoothedInfo;
  [(UIGestureRecognizerTransformAnalyzerInfo *)smoothedInfo translationMagnitude];
  [(UIGestureRecognizerTransformAnalyzerInfo *)smoothedInfo _setTranslationMagnitude:v47 * 0.6 + v44 * 0.4];
  v48 = self->_smoothedInfo;
  [(UIGestureRecognizerTransformAnalyzerInfo *)v48 scale];
  [(UIGestureRecognizerTransformAnalyzerInfo *)v48 _setScale:v49 * 0.6 + v19 * 0.4];
  v50 = self->_smoothedInfo;
  [(UIGestureRecognizerTransformAnalyzerInfo *)v50 rotation];
  [(UIGestureRecognizerTransformAnalyzerInfo *)v50 _setRotation:v51 * 0.6 + v8 * 0.4];
  [(UIGestureRecognizerTransformAnalyzerInfo *)self->_smoothedInfo translation];
  double v53 = v52 * 0.6 + v16 * 0.4;
  [(UIGestureRecognizerTransformAnalyzerInfo *)self->_smoothedInfo translation];
  -[UIGestureRecognizerTransformAnalyzerInfo _setTranslation:](self->_smoothedInfo, "_setTranslation:", v53, v54 * 0.6 + v18 * 0.4);
  [(UIGestureRecognizerTransformAnalyzerInfo *)self->_smoothedInfo absoluteTranslation];
  double v56 = v55 * 0.6 + v6 * 0.4;
  [(UIGestureRecognizerTransformAnalyzerInfo *)self->_smoothedInfo absoluteTranslation];
  -[UIGestureRecognizerTransformAnalyzerInfo _setAbsoluteTranslation:](self->_smoothedInfo, "_setAbsoluteTranslation:", v56, v57 * 0.6 + v7 * 0.4);
  [(UIGestureRecognizerTransformAnalyzerInfo *)self->_smoothedInfo translationMagnitude];
  double v59 = fabs(v58) * self->_translationWeight;
  [(UIGestureRecognizerTransformAnalyzerInfo *)self->_smoothedInfo scale];
  double v61 = fabs(v60) * self->_pinchingWeight;
  [(UIGestureRecognizerTransformAnalyzerInfo *)self->_smoothedInfo rotation];
  double v63 = fabs(v62) * self->_rotationWeight;
  double v64 = 1.0;
  if (v61 <= 0.0) {
    double v65 = 1.0;
  }
  else {
    double v65 = v61;
  }
  if (v63 <= 0.0) {
    double v66 = 1.0;
  }
  else {
    double v66 = v63;
  }
  if (v59 / v65 > 1.4 && v59 / v66 > 1.4)
  {
    int v67 = 1;
LABEL_32:
    self->_dominantComponent = v67;
    goto LABEL_33;
  }
  if (v59 > 0.0) {
    double v64 = v59;
  }
  if (v61 / v64 > 1.4 && v61 / v66 > 1.4)
  {
    int v67 = 2;
    goto LABEL_32;
  }
  if (v63 / v64 > 1.4 && v63 / v65 > 1.4)
  {
    int v67 = 3;
    goto LABEL_32;
  }
  self->_dominantComponent = 0;
LABEL_33:

  return v45;
}

- (double)translationWeight
{
  return self->_translationWeight;
}

- (void)setTranslationWeight:(double)a3
{
  self->_translationWeight = a3;
}

- (double)pinchingWeight
{
  return self->_pinchingWeight;
}

- (void)setPinchingWeight:(double)a3
{
  self->_pinchingWeight = a3;
}

- (double)rotationWeight
{
  return self->_rotationWeight;
}

- (void)setRotationWeight:(double)a3
{
  self->_rotationWeight = a3;
}

- (int)dominantComponent
{
  return self->_dominantComponent;
}

- (UIGestureRecognizerTransformAnalyzerInfo)smoothedInfo
{
  return self->_smoothedInfo;
}

- (void).cxx_destruct
{
}

@end