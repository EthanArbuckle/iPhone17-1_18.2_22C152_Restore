@interface MRTransitionOrigamiFlip
- (BOOL)controlsLayersTime;
- (BOOL)prerenderForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (BOOL)supportsDirectionOverride;
- (MRTransitionOrigamiFlip)initWithTransitionID:(id)a3;
- (void)_cleanupSwingTimings;
- (void)_setupSwingTimings;
- (void)cleanup;
- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (void)setAttributes:(id)a3;
@end

@implementation MRTransitionOrigamiFlip

- (MRTransitionOrigamiFlip)initWithTransitionID:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MRTransitionOrigamiFlip;
  v3 = [(MRTransition *)&v6 initWithTransitionID:a3];
  v4 = v3;
  if (v3) {
    [(MRTransitionOrigamiFlip *)v3 _setupSwingTimings];
  }
  return v4;
}

- (void)cleanup
{
  if (self->super.mDescription)
  {
    [(MRTransitionOrigamiFlip *)self _cleanupSwingTimings];
    v3.receiver = self;
    v3.super_class = (Class)MRTransitionOrigamiFlip;
    [(MRTransition *)&v3 cleanup];
  }
}

- (void)_setupSwingTimings
{
  self->mBigSwing = [[MROrigamiAnimationPath alloc] initWithSwingType:1];
  self->mSideSwing = [[MROrigamiAnimationPath alloc] initWithSwingType:2];
}

- (void)_cleanupSwingTimings
{
  self->mBigSwing = 0;
  self->mSideSwing = 0;
}

- (BOOL)controlsLayersTime
{
  return 1;
}

- (BOOL)supportsDirectionOverride
{
  return 1;
}

- (void)setAttributes:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MRTransitionOrigamiFlip;
  [(MRTransition *)&v4 setAttributes:a3];
  self->super._direction = 0;
}

- (BOOL)prerenderForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  v6.receiver = self;
  v6.super_class = (Class)MRTransitionOrigamiFlip;
  return [(MRTransition *)&v6 prerenderForTime:a4 inContext:a5 withArguments:a3];
}

- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  [a4 localAspectRatio];
  float v10 = 1.0 / v9;
  if ((float)(1.0 / v9) <= 0.0) {
    return;
  }
  uint64_t v11 = self->super._direction - 1;
  if v11 < 8 && ((0x8Bu >> v11)) {
    unsigned int v12 = dword_1650B0[v11];
  }
  else {
    unsigned int v12 = objc_msgSend(-[NSDictionary objectForKey:](self->super.mFlattenedAttributes, "objectForKey:", @"direction"), "unsignedIntegerValue");
  }
  objc_msgSend(-[NSDictionary objectForKey:](self->super.mFlattenedAttributes, "objectForKey:", @"offsetFromMiddle"), "floatValue");
  float v14 = v13;
  double v15 = v13;
  mSourceLayer = self->super.mSourceLayer;
  [(MRLayerClock *)[(MRLayer *)mSourceLayer clock] externalTime];
  id v17 = -[MRLayer patchworkAtTime:inContext:withArguments:](mSourceLayer, "patchworkAtTime:inContext:withArguments:", a4, a5);
  mTargetLayer = self->super.mTargetLayer;
  [(MRLayerClock *)[(MRLayer *)mTargetLayer clock] externalTime];
  id v19 = -[MRLayer patchworkAtTime:inContext:withArguments:](mTargetLayer, "patchworkAtTime:inContext:withArguments:", a4, a5);
  int v21 = v12 & 1;
  v22 = &OBJC_IVAR___MRTransitionOrigamiFlip_mSideSwing;
  if (v12) {
    float v23 = 1.0;
  }
  else {
    float v23 = v10;
  }
  if ((v12 & 1) == 0) {
    v22 = &OBJC_IVAR___MRTransitionOrigamiFlip_mBigSwing;
  }
  v24 = *(Class *)((char *)&self->super.super.isa + *v22);
  if (v12) {
    uint64_t v25 = 1;
  }
  else {
    uint64_t v25 = 2;
  }
  *(float *)&double v20 = a3;
  objc_msgSend(v24, "valueAtTime:", v20, *(void *)&a3);
  if (v12 >= 2) {
    v27 = v17;
  }
  else {
    v27 = v19;
  }
  if (v12 >= 2)
  {
    float v28 = 3.14159265 - v26;
    float v29 = v28;
  }
  else
  {
    id v19 = v17;
    float v29 = v26;
  }
  __float2 v30 = __sincosf_stret(v29);
  [a4 cull:v25];
  double v31 = v23;
  double v46 = (float)-v30.__cosval;
  double sinval = v30.__sinval;
  if (v14 <= 0.0)
  {
    if (v14 >= 0.0)
    {
      double v35 = 1.57079637;
      goto LABEL_26;
    }
    BOOL v33 = v21 == 0;
    v34 = (double *)&unk_165090;
  }
  else
  {
    BOOL v33 = v21 == 0;
    v34 = (double *)&unk_1650A0;
  }
  double v35 = v34[v33];
LABEL_26:
  float v36 = v23 * v14;
  float v37 = (v15 + (1.0 - v15) * v46) * v23;
  float v38 = (1.0 - v15) * sinval * v23;
  float v47 = v37;
  float v48 = v38;
  double v39 = v29;
  double v40 = v35;
  if (v35 >= v39)
  {
    if (v12 >= 2)
    {
      [v24 timeFirstAtRestValue];
      if (v41 <= v45) {
        goto LABEL_32;
      }
    }
    unsigned __int16 v49 = 3;
    char v50 = v12 & 1;
    char v51 = 0;
    float v52 = -v23;
    float v53 = -v23;
    uint64_t v54 = 0;
    float v55 = v36;
    float v56 = v36;
    uint64_t v57 = 0;
    float v58 = v23;
    float v59 = v47;
    *(float *)v60 = v48;
    memset(&v60[4], 0, 116);
    RenderPatchworkWithMesh(v27, &v49, a4);
  }
  if (v12 > 1 || ([v24 timeFirstAtRestValue], v42 > v45))
  {
LABEL_32:
    float v43 = (v15 + (v15 + 1.0) * v46) * v31;
    *(float *)&unsigned int v44 = (v15 + 1.0) * sinval * v31;
    unsigned __int16 v49 = 3;
    char v50 = v12 & 1;
    char v51 = 0;
    float v52 = -v23;
    float v53 = v43;
    uint64_t v54 = v44;
    float v55 = v36;
    float v56 = v36;
    uint64_t v57 = 0;
    float v58 = v23;
    float v59 = v23;
    memset(v60, 0, sizeof(v60));
    RenderPatchworkWithMesh(v19, &v49, a4);
  }
  if (v40 < v39)
  {
    unsigned __int16 v49 = 3;
    char v50 = v12 & 1;
    char v51 = 0;
    float v52 = -v23;
    float v53 = -v23;
    uint64_t v54 = 0;
    float v55 = v36;
    float v56 = v36;
    uint64_t v57 = 0;
    float v58 = v23;
    float v59 = v47;
    *(float *)v60 = v48;
    memset(&v60[4], 0, 116);
    RenderPatchworkWithMesh(v27, &v49, a4);
  }
  [a4 cull:0];
  [v27 removeImages];
  [v19 removeImages];
}

@end