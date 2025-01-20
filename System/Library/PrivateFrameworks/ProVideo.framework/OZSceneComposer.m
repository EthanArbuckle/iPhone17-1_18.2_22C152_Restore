@interface OZSceneComposer
+ (unint64_t)sceneMeshCategoryBitMask;
- (__n128)doIntersectionFrom:(uint64_t)a3 lookingAt:(uint64_t)a4 scene:(void *)a5;
- (uint64_t)calcFloorPositionBeneath:(double)a3 scene:;
@end

@implementation OZSceneComposer

+ (unint64_t)sceneMeshCategoryBitMask
{
  return 2;
}

- (__n128)doIntersectionFrom:(uint64_t)a3 lookingAt:(uint64_t)a4 scene:(void *)a5
{
  v44[4] = *MEMORY[0x1E4F143B8];
  v5 = (void *)[a5 rootNode];
  uint64_t v6 = *MEMORY[0x1E4F3B2E0];
  v43[0] = *MEMORY[0x1E4F3B2F0];
  v43[1] = v6;
  v44[0] = &unk_1F11EC490;
  v44[1] = MEMORY[0x1E4F1CC28];
  uint64_t v7 = *MEMORY[0x1E4F3B2D0];
  v43[2] = *MEMORY[0x1E4F3B2E8];
  v43[3] = v7;
  v44[2] = &unk_1F11EC4A8;
  v44[3] = MEMORY[0x1E4F1CC28];
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v44 forKeys:v43 count:4];
  int32x4_t v9 = (int32x4_t)vmulq_f32(a2, a2);
  v9.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v9, 2), vadd_f32(*(float32x2_t *)v9.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v9.i8, 1))).u32[0];
  float32x2_t v10 = vrsqrte_f32((float32x2_t)v9.u32[0]);
  float32x2_t v11 = vmul_f32(v10, vrsqrts_f32((float32x2_t)v9.u32[0], vmul_f32(v10, v10)));
  float32x2_t v12 = vmul_f32(v11, v11);
  float32x4_t v13 = vmulq_f32(vmulq_n_f32(a2, vmul_f32(v11, vrsqrts_f32((float32x2_t)v9.u32[0], v12)).f32[0]), (float32x4_t)vdupq_n_s32(0x466A6000u));
  float32x4_t v14 = vaddq_f32(a1, v13);
  v12.i32[0] = a1.i32[2];
  v13.i32[0] = a1.i32[1];
  LODWORD(v15) = v14.i32[1];
  LODWORD(v16) = v14.i32[2];
  v17 = objc_msgSend(v5, "hitTestWithSegmentFromPoint:toPoint:options:", v8, *(double *)a1.i64, *(double *)v13.i64, *(double *)&v12, *(double *)v14.i64, v15, v16);
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v36 = 0u;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v38 objects:v42 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v39;
    float v21 = 3.4028e38;
    __asm { FMOV            V0.4S, #1.0 }
    long long v34 = _Q0;
    long long v36 = 0u;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v39 != v20) {
          objc_enumerationMutation(v17);
        }
        objc_msgSend(*(id *)(*((void *)&v38 + 1) + 8 * i), "simdWorldCoordinates", v34);
        float32x4_t v29 = vsubq_f32(v28, a1);
        float32x4_t v30 = vmulq_f32(v29, v29);
        float v31 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v30, 2), vaddq_f32(v30, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v30.f32, 1))).f32[0];
        if (v31 < v21)
        {
          *(void *)&long long v32 = v28.i64[0];
          *((void *)&v32 + 1) = __PAIR64__(HIDWORD(v34), v28.u32[2]);
          long long v36 = v32;
          float v21 = v31;
        }
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v38 objects:v42 count:16];
    }
    while (v19);
  }
  return (__n128)v36;
}

- (uint64_t)calcFloorPositionBeneath:(double)a3 scene:
{
  return objc_msgSend(a1, "doIntersectionFrom:lookingAt:scene:", a3, -0.0078125);
}

@end