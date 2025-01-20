@interface _UIGestureRecognizerTransformAnalyzer
- (_UIGestureRecognizerTransformAnalyzer)init;
- (double)pinchingWeight;
- (double)rotationWeight;
- (double)translationWeight;
- (int64_t)dominantComponent;
- (void)analyzeTouches:(id)a3;
- (void)reset;
- (void)setPinchingWeight:(double)a3;
- (void)setRotationWeight:(double)a3;
- (void)setTranslationWeight:(double)a3;
@end

@implementation _UIGestureRecognizerTransformAnalyzer

- (void)setPinchingWeight:(double)a3
{
  self->_pinchingWeight = a3;
}

- (void)reset
{
  self->_lowPassTranslationMagnitudeDelta = 0.0;
  self->_lowPassScaleDelta = 0.0;
  self->_lowPassRotationDelta = 0.0;
}

- (void)setRotationWeight:(double)a3
{
  self->_rotationWeight = a3;
}

- (void)setTranslationWeight:(double)a3
{
  self->_translationWeight = a3;
}

- (_UIGestureRecognizerTransformAnalyzer)init
{
  v8.receiver = self;
  v8.super_class = (Class)_UIGestureRecognizerTransformAnalyzer;
  result = [(_UIGestureRecognizerTransformAnalyzer *)&v8 init];
  if (result)
  {
    __asm { FMOV            V0.2D, #1.0 }
    *(_OWORD *)&result->_translationWeight = _Q0;
    result->_rotationWeight = 1.0;
  }
  return result;
}

- (void)analyzeTouches:(id)a3
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  int v5 = [a3 count];
  int v6 = v5;
  if (v5 == 1)
  {
    v7 = [a3 anyObject];
    [v7 _locationInSceneReferenceSpace];
    double v9 = v8;
    double v11 = v10;
    [v7 _previousLocationInSceneReferenceSpace];
    double v13 = v9 - v12;
    double v15 = v11 - v14;

LABEL_12:
    double v39 = 0.0;
    double v40 = 0.0;
    goto LABEL_15;
  }
  double v13 = *MEMORY[0x1E4F1DAD8];
  double v15 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  if (v5 < 1) {
    goto LABEL_12;
  }
  double v16 = _CentroidOfTouches(a3, 0);
  double v18 = v17;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id v19 = a3;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v55 objects:v59 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v56;
    double v23 = 0.0;
    double v24 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v56 != v22) {
          objc_enumerationMutation(v19);
        }
        v26 = *(void **)(*((void *)&v55 + 1) + 8 * i);
        objc_msgSend(v26, "_locationInSceneReferenceSpace", (void)v55);
        double v28 = v27;
        double v30 = v29;
        [v26 _previousLocationInSceneReferenceSpace];
        double v32 = v28 - v31;
        double v34 = v30 - v33;
        double v13 = v13 + v32;
        double v15 = v15 + v34;
        float v35 = (v28 - v16) * (v28 - v16) + (v30 - v18) * (v30 - v18);
        double v36 = sqrtf(v35);
        double v37 = (v28 - v16) / v36;
        double v38 = (v30 - v18) / v36;
        double v24 = v24 + v32 * v37 + v34 * v38;
        double v23 = v23 + v32 * v38 - v34 * v37;
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v55 objects:v59 count:16];
    }
    while (v21);
  }
  else
  {
    double v23 = 0.0;
    double v24 = 0.0;
  }

  double v13 = v13 / (double)v6;
  double v40 = v24 / (double)v6 * 0.4;
  double v39 = v23 / (double)v6 * 0.4;
  double v15 = v15 / (double)v6;
LABEL_15:
  float v41 = v15 * v15 + v13 * v13;
  double v42 = self->_lowPassTranslationMagnitudeDelta * 0.6 + sqrtf(v41) * 0.4;
  double v43 = v40 + self->_lowPassScaleDelta * 0.6;
  double translationWeight = self->_translationWeight;
  double v45 = self->_lowPassRotationDelta * 0.6;
  self->_lowPassTranslationMagnitudeDelta = v42;
  self->_lowPassScaleDelta = v43;
  double v46 = v39 + v45;
  self->_lowPassRotationDelta = v46;
  double v47 = translationWeight * fabs(v42);
  double v48 = fabs(v43) * self->_pinchingWeight;
  double v49 = fabs(v46) * self->_rotationWeight;
  double v50 = 1.0;
  if (v48 <= 0.0) {
    double v51 = 1.0;
  }
  else {
    double v51 = v48;
  }
  if (v48 != 0.0 && v47 / v51 <= 1.4) {
    goto LABEL_24;
  }
  if (v49 > 0.0) {
    double v50 = v49;
  }
  int64_t v52 = 1;
  if (v49 != 0.0 && v47 / v50 <= 1.4)
  {
LABEL_24:
    double v53 = 1.0;
    if (v47 <= 0.0) {
      double v54 = 1.0;
    }
    else {
      double v54 = v47;
    }
    if (v47 != 0.0 && v48 / v54 <= 1.4) {
      goto LABEL_36;
    }
    if (v49 > 0.0) {
      double v53 = v49;
    }
    int64_t v52 = 2;
    if (v49 != 0.0 && v48 / v53 <= 1.4)
    {
LABEL_36:
      if (v47 != 0.0 && v49 / v54 <= 1.4 || (int64_t v52 = 3, v48 != 0.0) && v49 / v51 <= 1.4) {
        int64_t v52 = 0;
      }
    }
  }
  self->_dominantComponent = v52;
}

- (double)translationWeight
{
  return self->_translationWeight;
}

- (double)pinchingWeight
{
  return self->_pinchingWeight;
}

- (double)rotationWeight
{
  return self->_rotationWeight;
}

- (int64_t)dominantComponent
{
  return self->_dominantComponent;
}

@end