@interface MRTransitionOrigamiFold
- (BOOL)controlsLayersTime;
- (BOOL)prerenderForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (BOOL)supportsDirectionOverride;
- (MRTransitionOrigamiFold)initWithTransitionID:(id)a3;
- (void)_cleanupSwingTimings;
- (void)_setupSwingTimings;
- (void)cleanup;
- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (void)setAttributes:(id)a3;
@end

@implementation MRTransitionOrigamiFold

- (MRTransitionOrigamiFold)initWithTransitionID:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MRTransitionOrigamiFold;
  v3 = [(MRTransition *)&v6 initWithTransitionID:a3];
  v4 = v3;
  if (v3) {
    [(MRTransitionOrigamiFold *)v3 _setupSwingTimings];
  }
  return v4;
}

- (void)cleanup
{
  if (self->super.mDescription)
  {
    [(MRTransitionOrigamiFold *)self _cleanupSwingTimings];
    v3.receiver = self;
    v3.super_class = (Class)MRTransitionOrigamiFold;
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
  v4.super_class = (Class)MRTransitionOrigamiFold;
  [(MRTransition *)&v4 setAttributes:a3];
  self->super._direction = 0;
}

- (BOOL)prerenderForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  v6.receiver = self;
  v6.super_class = (Class)MRTransitionOrigamiFold;
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
    int v12 = dword_165BE8[v11];
  }
  else {
    LOBYTE(v12) = objc_msgSend(-[NSDictionary objectForKey:](self->super.mFlattenedAttributes, "objectForKey:", @"direction"), "unsignedIntegerValue");
  }
  unsigned int v13 = objc_msgSend(-[NSDictionary objectForKey:](self->super.mFlattenedAttributes, "objectForKey:", @"numberOfFoldings"), "unsignedCharValue");
  if (v12) {
    float v15 = 1.0;
  }
  else {
    float v15 = v10;
  }
  __int16 v83 = 0;
  char v84 = 0;
  long long v85 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  long long v90 = 0u;
  long long v91 = 0u;
  memset(v92, 0, sizeof(v92));
  int v82 = 0;
  long long v80 = 0u;
  long long v81 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  unsigned int v16 = (v13 + 1);
  float v17 = a3;
  float v18 = v17 * (float)v16;
  signed int v19 = vcvtms_s32_f32(v18);
  signed int v20 = v13 - 1;
  if ((int)(v13 - 1) <= v19) {
    unsigned __int8 v21 = v13 - 1;
  }
  else {
    unsigned __int8 v21 = v19;
  }
  int v67 = v12 & 1;
  int v68 = v21;
  float v22 = v18 - (float)v21;
  if (v20 <= v19)
  {
    v25 = &OBJC_IVAR___MRTransitionOrigamiFold_mSideSwing;
    if ((v12 & 1) == 0) {
      v25 = &OBJC_IVAR___MRTransitionOrigamiFold_mBigSwing;
    }
    v26 = *(Class *)((char *)&self->super.super.isa + *v25);
    float v27 = v22 * 0.5;
    *(float *)&double v14 = v22 * 0.5;
    [v26 valueAtTime:v14];
    float v24 = 3.1416 - v28;
    [v26 timeFirstAtRestValue];
    BOOL v23 = v27 >= *(float *)&v14;
  }
  else
  {
    BOOL v23 = 0;
    float v24 = (float)((float)((float)((float)(v22 * -3.0) * v22) + 1.0) + (float)((float)(v22 * (float)(v22 + v22)) * v22))
        * 3.1416;
  }
  int v29 = v12 & 0xFE;
  *(float *)&double v14 = (float)(v15 + v15) / (float)v16;
  float32x2_t v70 = *(float32x2_t *)&v14;
  __float2 v31 = __sincosf_stret(v24);
  float sinval = v31.__sinval;
  mSourceLayer = self->super.mSourceLayer;
  [(MRLayerClock *)[(MRLayer *)mSourceLayer clock] externalTime];
  id v69 = -[MRLayer patchworkAtTime:inContext:withArguments:](mSourceLayer, "patchworkAtTime:inContext:withArguments:", a4, a5);
  mTargetLayer = self->super.mTargetLayer;
  [(MRLayerClock *)[(MRLayer *)mTargetLayer clock] externalTime];
  id v34 = -[MRLayer patchworkAtTime:inContext:withArguments:](mTargetLayer, "patchworkAtTime:inContext:withArguments:", a4, a5);
  if (!v23)
  {
    int v36 = ~v68 + v16;
    float v37 = -(float)(v15 - (float)(v70.f32[0] * (float)v36));
    float v38 = v15 - (float)(v70.f32[0] * (float)v36);
    if (v29) {
      float v38 = -v15;
    }
    else {
      float v37 = v15;
    }
    LOWORD(v71[0]) = 2;
    WORD1(v71[0]) = v67;
    *((float *)v71 + 1) = v38;
    *((float *)v71 + 2) = v38;
    *(void *)((char *)v71 + 12) = 0;
    *((float *)&v71[1] + 1) = v37;
    *((float *)&v71[1] + 2) = v37;
    memset((char *)&v71[1] + 12, 0, 136);
    RenderPatchworkWithMesh(v69, (unsigned __int16 *)v71, a4);
  }
  if (v20 <= v19)
  {
    int v40 = v67;
    if (v67) {
      uint64_t v41 = 1;
    }
    else {
      uint64_t v41 = 2;
    }
    [a4 cull:v41];
    unsigned int v39 = 3;
  }
  else
  {
    unsigned int v39 = 2;
    int v40 = v67;
  }
  LOWORD(v72) = v39;
  BYTE2(v72) = v40;
  if (!v29)
  {
    *((float *)&v72 + 1) = -v15;
    *((float *)&v72 + 2) = -v15;
    HIDWORD(v72) = 0;
    LOBYTE(v73) = 0;
    *((float *)&v73 + 1) = -(float)(v15 - (float)(v70.f32[0] * (float)(v68 + 1)));
    *((float *)&v73 + 2) = *((float *)&v73 + 1);
    HIDWORD(v73) = 0;
    LOBYTE(v74) = 0;
    *((float *)&v74 + 1) = v70.f32[0] - (float)(v15 - (float)(v70.f32[0] * (float)(v68 + 1)));
    *((float *)&v74 + 2) = (float)(v70.f32[0] * v31.__cosval) - (float)(v15 - (float)(v70.f32[0] * (float)(v68 + 1)));
    *((float *)&v74 + 3) = v70.f32[0] * v31.__sinval;
    v46 = &v75;
    goto LABEL_32;
  }
  *((float *)&v72 + 4 * ((v39 - 1) & 3) + 1) = v15;
  char v42 = v39;
  *(float *)v35.i32 = (float)(v68 + 1);
  v43 = (float *)&v72 + 4 * v39 + 1;
  *(v43 - 3) = v15;
  *(v43 - 2) = 0.0;
  *(float32x2_t *)((char *)&v72 + 16 * v39 - 28) = vmls_lane_f32(*(float32x2_t *)((char *)&v72 + 16 * v39 - 12), (float32x2_t)vdup_lane_s32(v35, 0), v70, 0);
  *((unsigned char *)v43 - 4) = 0;
  v44 = (char *)&v72 + 16 * v39 - 28;
  *((_DWORD *)v44 + 2) = 0;
  v44[12] = 0;
  if (v20 <= v19)
  {
    float v45 = *((float *)v44 + 1);
    *((float *)&v72 + 1) = *((float *)&v72 + 4 * (v42 & 1) + 1) - v70.f32[0];
    *((float *)&v72 + 2) = v45 + (float)((float)-v70.f32[0] * v31.__cosval);
    *((float *)&v72 + 3) = v70.f32[0] * v31.__sinval;
    v46 = &v73;
LABEL_32:
    *(unsigned char *)v46 = 0;
  }
  v71[8] = v80;
  v71[9] = v81;
  LODWORD(v71[10]) = v82;
  v71[4] = v76;
  v71[5] = v77;
  v71[6] = v78;
  v71[7] = v79;
  v71[0] = v72;
  v71[1] = v73;
  v71[2] = v74;
  v71[3] = v75;
  RenderPatchworkWithMesh(v34, (unsigned __int16 *)v71, a4);
  if (!v23)
  {
    if (v20 > v19)
    {
      int v48 = v68 + 1;
      float v49 = v15 - (float)(v70.f32[0] * (float)(v68 + 1));
      if (v29) {
        float v50 = v15 - (float)(v70.f32[0] * (float)v48);
      }
      else {
        float v50 = (float)-v49 - v70.f32[0];
      }
      if (v29) {
        float v51 = v15 - (float)(v70.f32[0] * (float)v48);
      }
      else {
        float v51 = (float)(v70.f32[0] * v31.__cosval) - v49;
      }
      if (v29) {
        float v52 = 0.0;
      }
      else {
        float v52 = v70.f32[0] * v31.__sinval;
      }
      if (v29) {
        float v53 = v70.f32[0] + v49;
      }
      else {
        float v53 = -v49;
      }
      if (v29) {
        float v54 = v49 - (float)(v70.f32[0] * v31.__cosval);
      }
      else {
        float v54 = -v49;
      }
      if (v29) {
        float v55 = v70.f32[0] * v31.__sinval;
      }
      else {
        float v55 = 0.0;
      }
      if (v19)
      {
        if (v40) {
          uint64_t v56 = 2;
        }
        else {
          uint64_t v56 = 1;
        }
        *(float *)&double v47 = v70.f32[0] * v31.__sinval;
        objc_msgSend(a4, "cull:", v56, v47);
      }
      LOWORD(v71[0]) = 2;
      WORD1(v71[0]) = v40;
      *(void *)((char *)v71 + 4) = __PAIR64__(LODWORD(v51), LODWORD(v50));
      *((float *)v71 + 3) = v52;
      LODWORD(v71[1]) = 0;
      *(void *)((char *)&v71[1] + 4) = __PAIR64__(LODWORD(v54), LODWORD(v53));
      *((float *)&v71[1] + 3) = v55;
      memset(&v71[2], 0, 132);
      RenderPatchworkWithMesh(v69, (unsigned __int16 *)v71, a4);
      float sinval = v31.__sinval;
    }
    if (v68)
    {
      float v57 = v70.f32[0] * sinval;
      float v58 = v15 - (float)(v70.f32[0] * (float)(v68 - 1));
      float v59 = v15 - (float)(v70.f32[0] * (float)(v68 + 1));
      if (v29) {
        float v60 = v58 - v70.f32[0];
      }
      else {
        float v60 = -v58;
      }
      if (v29) {
        float v61 = v59 - (float)(v70.f32[0] * v31.__cosval);
      }
      else {
        float v61 = -v59;
      }
      if (v29) {
        float v62 = v57;
      }
      else {
        float v62 = 0.0;
      }
      if (v29) {
        float v63 = v58;
      }
      else {
        float v63 = v70.f32[0] - v58;
      }
      if (v29) {
        float v64 = v59;
      }
      else {
        float v64 = (float)(v70.f32[0] * v31.__cosval) - v59;
      }
      if (v29) {
        float v65 = 0.0;
      }
      else {
        float v65 = v57;
      }
      if (v40) {
        uint64_t v66 = 2;
      }
      else {
        uint64_t v66 = 1;
      }
      [a4 cull:v66];
      LOWORD(v71[0]) = 2;
      WORD1(v71[0]) = v40;
      *(void *)((char *)v71 + 4) = __PAIR64__(LODWORD(v61), LODWORD(v60));
      *((float *)v71 + 3) = v62;
      LOBYTE(v71[1]) = 0;
      *(_WORD *)((char *)&v71[1] + 1) = v83;
      BYTE3(v71[1]) = v84;
      *(void *)((char *)&v71[1] + 4) = __PAIR64__(LODWORD(v64), LODWORD(v63));
      *((float *)&v71[1] + 3) = v65;
      LOBYTE(v71[2]) = 0;
      *(_OWORD *)((char *)&v71[2] + 1) = v85;
      *(_OWORD *)((char *)&v71[6] + 1) = v89;
      *(_OWORD *)((char *)&v71[5] + 1) = v88;
      *(_OWORD *)((char *)&v71[4] + 1) = v87;
      *(_OWORD *)((char *)&v71[3] + 1) = v86;
      LODWORD(v71[10]) = *(_DWORD *)&v92[15];
      *(_OWORD *)((char *)&v71[9] + 1) = *(_OWORD *)v92;
      *(_OWORD *)((char *)&v71[8] + 1) = v91;
      *(_OWORD *)((char *)&v71[7] + 1) = v90;
      RenderPatchworkWithMesh(v69, (unsigned __int16 *)v71, a4);
    }
  }
  [a4 cull:0];
  [v69 removeImages];
  [v34 removeImages];
}

@end