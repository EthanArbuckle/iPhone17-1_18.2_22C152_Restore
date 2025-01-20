@interface PFSlowMotionRampConfiguration
- (PFSlowMotionRampConfiguration)init;
- (double)introTime;
- (double)outroTime;
- (double)rampTime;
- (double)volumeSuppressionIntroTime;
- (double)volumeSuppressionOutroTime;
- (float)exportRampCurveExponent;
- (float)playbackRampCurveExponent;
- (id)initForRampDown:(BOOL)a3;
- (unint64_t)exportNumIntermediateSteps;
- (unint64_t)playbackNumIntermediateSteps;
- (void)computeRampToTargetRate:(float)a3 forExport:(BOOL)a4 outTimeSteps:(id *)a5 outIntermediateRates:(id *)a6;
@end

@implementation PFSlowMotionRampConfiguration

- (float)exportRampCurveExponent
{
  return self->_exportRampCurveExponent;
}

- (float)playbackRampCurveExponent
{
  return self->_playbackRampCurveExponent;
}

- (unint64_t)exportNumIntermediateSteps
{
  return self->_exportNumIntermediateSteps;
}

- (unint64_t)playbackNumIntermediateSteps
{
  return self->_playbackNumIntermediateSteps;
}

- (double)volumeSuppressionOutroTime
{
  return self->_volumeSuppressionOutroTime;
}

- (double)volumeSuppressionIntroTime
{
  return self->_volumeSuppressionIntroTime;
}

- (double)outroTime
{
  return self->_outroTime;
}

- (double)introTime
{
  return self->_introTime;
}

- (double)rampTime
{
  return self->_rampTime;
}

- (void)computeRampToTargetRate:(float)a3 forExport:(BOOL)a4 outTimeSteps:(id *)a5 outIntermediateRates:(id *)a6
{
  BOOL v8 = a4;
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  v11 = [MEMORY[0x1E4F1CA48] array];
  v12 = [MEMORY[0x1E4F1CA48] array];
  if (v8) {
    unint64_t v13 = [(PFSlowMotionRampConfiguration *)self exportNumIntermediateSteps];
  }
  else {
    unint64_t v13 = [(PFSlowMotionRampConfiguration *)self playbackNumIntermediateSteps];
  }
  unint64_t v14 = v13;
  [(PFSlowMotionRampConfiguration *)self rampTime];
  double v16 = v15;
  [(PFSlowMotionRampConfiguration *)self introTime];
  double v18 = v17;
  [(PFSlowMotionRampConfiguration *)self outroTime];
  double v20 = v19;
  float v21 = 1.0;
  float v22 = 1.0 - a3;
  if (v14)
  {
    float v23 = v22 / (float)(v14 + 1);
    do
    {
      float v21 = v21 - v23;
      *(float *)&double v19 = v21;
      v24 = [NSNumber numberWithFloat:v19];
      [v12 addObject:v24];

      --v14;
    }
    while (v14);
  }
  if (v8) {
    [(PFSlowMotionRampConfiguration *)self exportRampCurveExponent];
  }
  else {
    [(PFSlowMotionRampConfiguration *)self playbackRampCurveExponent];
  }
  float v26 = v25;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  id v27 = v12;
  uint64_t v28 = [v27 countByEnumeratingWithState:&v56 objects:v60 count:16];
  if (v28)
  {
    uint64_t v29 = v28;
    float v30 = v16 - (v18 + v20);
    uint64_t v31 = *(void *)v57;
    float v32 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v29; ++i)
      {
        if (*(void *)v57 != v31) {
          objc_enumerationMutation(v27);
        }
        [*(id *)(*((void *)&v56 + 1) + 8 * i) floatValue];
        float v35 = v34;
        float v36 = powf((float)(1.0 - v34) / v22, v26);
        float v32 = v32 + v36;
        *(float *)&double v37 = v35 * (float)(v36 * v30);
        v38 = [NSNumber numberWithFloat:v37];
        [v11 addObject:v38];
      }
      uint64_t v29 = [v27 countByEnumeratingWithState:&v56 objects:v60 count:16];
    }
    while (v29);
  }
  else
  {
    float v32 = 0.0;
  }

  uint64_t v50 = MEMORY[0x1E4F143A8];
  uint64_t v51 = 3221225472;
  v52 = __101__PFSlowMotionRampConfiguration_computeRampToTargetRate_forExport_outTimeSteps_outIntermediateRates___block_invoke;
  v53 = &unk_1E5B2E248;
  float v55 = v32;
  id v39 = v11;
  id v54 = v39;
  [v39 enumerateObjectsUsingBlock:&v50];
  [(PFSlowMotionRampConfiguration *)self introTime];
  *(float *)&double v40 = v40;
  if (*(float *)&v40 > 0.0)
  {
    v41 = objc_msgSend(NSNumber, "numberWithFloat:");
    [v39 insertObject:v41 atIndex:0];

    LODWORD(v42) = 1.0;
    v43 = [NSNumber numberWithFloat:v42];
    [v27 insertObject:v43 atIndex:0];
  }
  [(PFSlowMotionRampConfiguration *)self outroTime];
  *(float *)&double v44 = v44;
  if (*(float *)&v44 > 0.0)
  {
    *(float *)&double v44 = *(float *)&v44 * a3;
    v45 = [NSNumber numberWithFloat:v44];
    [v39 addObject:v45];

    *(float *)&double v46 = a3;
    v47 = [NSNumber numberWithFloat:v46];
    [v27 addObject:v47];
  }
  id v48 = v39;
  *a5 = v48;
  id v49 = v27;
  *a6 = v49;
}

void __101__PFSlowMotionRampConfiguration_computeRampToTargetRate_forExport_outTimeSteps_outIntermediateRates___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  [a2 floatValue];
  float v5 = *(float *)(a1 + 40);
  v6 = *(void **)(a1 + 32);
  *(float *)&double v8 = v7 / v5;
  id v9 = [NSNumber numberWithFloat:v8];
  [v6 replaceObjectAtIndex:a3 withObject:v9];
}

- (PFSlowMotionRampConfiguration)init
{
  return 0;
}

- (id)initForRampDown:(BOOL)a3
{
  BOOL v3 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PFSlowMotionRampConfiguration;
  id result = [(PFSlowMotionRampConfiguration *)&v10 init];
  if (result)
  {
    double v5 = 0.35;
    if (v3) {
      double v5 = 0.56;
    }
    double v6 = 0.08;
    double v7 = 0.1;
    if (v3) {
      double v6 = 0.1;
    }
    else {
      double v7 = 0.07;
    }
    uint64_t v8 = 20;
    if (v3) {
      uint64_t v8 = 34;
    }
    float v9 = 1.2;
    if (!v3) {
      float v9 = 2.0;
    }
    *((double *)result + 2) = v5;
    *((double *)result + 3) = v6;
    *((_OWORD *)result + 2) = xmmword_1A42D3630;
    *((double *)result + 6) = v7;
    *((void *)result + 7) = v8;
    *((void *)result + 8) = 5;
    *((float *)result + 2) = v9;
    *((_DWORD *)result + 3) = 1069547520;
  }
  return result;
}

@end