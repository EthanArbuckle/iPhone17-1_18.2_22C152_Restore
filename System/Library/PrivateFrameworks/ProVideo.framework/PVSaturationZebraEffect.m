@interface PVSaturationZebraEffect
+ (void)registerEffectWithID:(id)a3 displayName:(id)a4;
- (HGRef<HGNode>)hgNodeForTime:(id *)a3 inputs:(const void *)a4 renderer:(const void *)a5 igContext:(HGRef<PVInstructionGraphContext>)a6;
@end

@implementation PVSaturationZebraEffect

+ (void)registerEffectWithID:(id)a3 displayName:(id)a4
{
  v14[3] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = @"effect.video.filter";
  v13[0] = @"FFEffectProperty_DisplayName";
  v13[1] = @"FFEffectProperty_Category";
  v14[0] = v6;
  v14[1] = @"Helium";
  v13[2] = @"FFEffectProperty_EffectType";
  v14[2] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:3];
  +[PVEffect registerEffectClass:objc_opt_class() forEffectID:v5 withProperties:v8];
  v11[0] = @"displayName";
  v11[1] = @"contentGroup";
  v12[0] = v6;
  v12[1] = @"BuiltIn";
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
  v10 = +[PVContentRegistry sharedInstance];
  [v10 registerContentClass:objc_opt_class() forID:v5 type:v7 withProperties:v9];
}

- (HGRef<HGNode>)hgNodeForTime:(id *)a3 inputs:(const void *)a4 renderer:(const void *)a5 igContext:(HGRef<PVInstructionGraphContext>)a6
{
  v9 = v6;
  PVInputHGNodeMap<unsigned int>::GetNode((uint64_t)a4, 0, &v49);
  v10 = PVInstructionGraphContext::WorkingColorSpace(*(PVInstructionGraphContext **)a6.m_Obj);
  int v11 = [v10 isRec2020LinearColorSpace];

  v12 = (HgcOverexposureCheck *)HGObject::operator new(0x1A0uLL);
  HgcOverexposureCheck::HgcOverexposureCheck(v12);
  (*(void (**)(HgcOverexposureCheck *, void, HGNode *))(*(void *)v12 + 120))(v12, 0, v49);
  {
    -[PVSaturationZebraEffect hgNodeForTime:inputs:renderer:igContext:]::chromaticitiesSDR = kPCChromaticities_ITU_R709_2;
    *(_OWORD *)algn_1E9EE4750 = *(_OWORD *)&qword_1B7E7C918;
  }
  {
    -[PVSaturationZebraEffect hgNodeForTime:inputs:renderer:igContext:]::chromaticitiesHDR = kPCChromaticities_ITU_R2020;
    unk_1E9EE4778 = *(_OWORD *)&dword_1B7E7C998;
  }
  {
    PCGetLuminanceCoefficients((float *)&-[PVSaturationZebraEffect hgNodeForTime:inputs:renderer:igContext:]::chromaticitiesSDR, -[PVSaturationZebraEffect hgNodeForTime:inputs:renderer:igContext:]::luminanceCoefficientsSDR);
  }
  {
    PCGetLuminanceCoefficients((float *)&-[PVSaturationZebraEffect hgNodeForTime:inputs:renderer:igContext:]::chromaticitiesHDR, -[PVSaturationZebraEffect hgNodeForTime:inputs:renderer:igContext:]::luminanceCoefficientsHDR);
  }
  if (v11) {
    v15 = (unsigned __int32 *)-[PVSaturationZebraEffect hgNodeForTime:inputs:renderer:igContext:]::luminanceCoefficientsHDR;
  }
  else {
    v15 = (unsigned __int32 *)-[PVSaturationZebraEffect hgNodeForTime:inputs:renderer:igContext:]::luminanceCoefficientsSDR;
  }
  v13.n128_u32[0] = *v15;
  v16 = (unsigned __int32 *)&-[PVSaturationZebraEffect hgNodeForTime:inputs:renderer:igContext:]::luminanceCoefficientsHDR[1];
  if (!v11) {
    v16 = (unsigned __int32 *)&-[PVSaturationZebraEffect hgNodeForTime:inputs:renderer:igContext:]::luminanceCoefficientsSDR[1];
  }
  v17 = &-[PVSaturationZebraEffect hgNodeForTime:inputs:renderer:igContext:]::luminanceCoefficientsHDR[2];
  if (!v11) {
    v17 = &-[PVSaturationZebraEffect hgNodeForTime:inputs:renderer:igContext:]::luminanceCoefficientsSDR[2];
  }
  v14.n128_u32[0] = *v16;
  (*(void (**)(HgcOverexposureCheck *, void, __n128, __n128, float, double))(*(void *)v12 + 96))(v12, 0, v13, v14, *v17, 0.0);
  v18 = (HgcZebraStripe *)HGObject::operator new(0x1A0uLL);
  HgcZebraStripe::HgcZebraStripe(v18);
  (*(void (**)(HgcZebraStripe *, void, HGNode *))(*(void *)v18 + 120))(v18, 0, v49);
  (*(void (**)(HgcZebraStripe *, uint64_t, HgcOverexposureCheck *))(*(void *)v18 + 120))(v18, 1, v12);
  [(NSLock *)self->super.super._inspectablePropertiesLock lock];
  v19 = [(NSMutableDictionary *)self->super.super._inspectableProperties objectForKeyedSubscript:@"SaturationZebraColor"];
  v20 = v19;
  if (!v19)
  {
    __n128 v43 = (__n128)xmmword_1B7E73E70;
    if (!v11) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
  [v19 SIMDFloat4Value];
  __n128 v43 = v21;
  if (v11)
  {
LABEL_16:
    v22 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DC98]);
    v23 = PVInstructionGraphContext::WorkingColorSpace(*(PVInstructionGraphContext **)a6.m_Obj);
    uint64_t v24 = [v23 cgColorSpace];

    unint64_t v45 = v43.n128_u64[0];
    unsigned __int32 v46 = v43.n128_u32[2];
    uint64_t v44 = 2;
    PCColorUtil::transform((PCToneMapMethod *)&v44, (uint64_t *)&v45, (uint64_t)v22, 0, v24, 1, (uint64_t)&v47);
    unint64_t v42 = v47;
    *(void *)&long long v25 = __PAIR64__(HIDWORD(v47), v48);
    long long v41 = v25;
    CGColorSpaceRelease(v22);
    v26.n128_u64[0] = v42;
    v26.n128_u64[1] = __PAIR64__(v43.n128_u32[3], v41);
    __n128 v43 = v26;
  }
LABEL_17:
  v27 = [(NSMutableDictionary *)self->super.super._inspectableProperties objectForKeyedSubscript:@"SaturationZebraLineWidth", v41];
  v28 = v27;
  if (v27)
  {
    [v27 floatValue];
    float v30 = v29;
  }
  else
  {
    float v30 = 3.0;
  }
  v31 = [(NSMutableDictionary *)self->super.super._inspectableProperties objectForKeyedSubscript:@"SaturationZebraThresholdOffset"];
  v32 = v31;
  if (v31)
  {
    [v31 floatValue];
    float v34 = v33;
  }
  else
  {
    float v34 = 0.05;
  }
  v35 = [(NSMutableDictionary *)self->super.super._inspectableProperties objectForKeyedSubscript:@"SaturationZebraSpacing"];
  v36 = v35;
  float v37 = v30;
  if (v35)
  {
    [v35 floatValue];
    float v37 = v38;
  }
  [(NSLock *)self->super.super._inspectablePropertiesLock unlock];
  float v39 = 1.0;
  if (v11) {
    float v39 = 12.0;
  }
  (*(void (**)(HgcZebraStripe *, uint64_t, float, double, double, double))(*(void *)v18 + 96))(v18, 1, v39 - v34, 0.0, 0.0, 0.0);
  (*(void (**)(HgcZebraStripe *, uint64_t, float, double, double, double))(*(void *)v18 + 96))(v18, 2, v30, 0.0, 0.0, 0.0);
  (*(void (**)(HgcZebraStripe *, uint64_t, float, double, double, double))(*(void *)v18 + 96))(v18, 3, v37, 0.0, 0.0, 0.0);
  (*(void (**)(HgcZebraStripe *, void, __n128, float, float, float))(*(void *)v18 + 96))(v18, 0, v43, v43.n128_f32[1], v43.n128_f32[2], v43.n128_f32[3]);
  void *v9 = v18;

  (*(void (**)(HgcOverexposureCheck *))(*(void *)v12 + 24))(v12);
  v40 = v49;
  if (v49) {
    return (HGRef<HGNode>)(*(uint64_t (**)(HGNode *))(*(void *)v49 + 24))(v49);
  }
  return (HGRef<HGNode>)v40;
}

@end