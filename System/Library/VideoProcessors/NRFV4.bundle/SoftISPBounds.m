@interface SoftISPBounds
- (SoftISPBounds)initWithInputFrame:(id)a3 outputFrame:(id)a4 quadraBinned:(BOOL)a5;
- (uint64_t)awbRegionOfInterestWithinInputBufferInPixels;
- (uint64_t)hiqhQualityProcessingRegionWithinOutputBufferInPixels;
- (uint64_t)processingRegionWithinInputBufferInPixels;
- (uint64_t)processingRegionWithinOutputBufferInPixels;
- (uint64_t)processingRegionWithinSensorInReadoutPixels;
@end

@implementation SoftISPBounds

- (SoftISPBounds)initWithInputFrame:(id)a3 outputFrame:(id)a4 quadraBinned:(BOOL)a5
{
  id v7 = a3;
  id v8 = a4;
  v76.receiver = self;
  v76.super_class = (Class)SoftISPBounds;
  v9 = [(SoftISPBounds *)&v76 init];
  int v10 = -[SoftISPInputFrame cfaLayout]((uint64_t)v7);
  unsigned int v11 = -[SoftISPInputFrame quadraBinningFactor]((uint64_t)v7);
  unsigned int v72 = -[SoftISPOutputFrame outputDownscaleFactor]((uint64_t)v8);
  uint64_t v12 = -[SoftISPInputFrame validBufferRect]((uint64_t)v7);
  uint64_t v13 = -[SoftISPInputFrame sensorReadoutRect]((uint64_t)v7);
  uint64_t v70 = -[SoftISPInputFrame highQualitySensorReadoutRect]((uint64_t)v7);
  uint64_t v14 = -[SoftISPInputFrame sensorCropRect]((uint64_t)v7);
  uint64_t v15 = -[SoftISPInputFrame awbRegionOfInterestRectWithinSensorCropRect]((uint64_t)v7);
  uint64_t v66 = v16;
  uint64_t v67 = v15;
  int32x2_t v17 = (int32x2_t)-[SoftISPOutputFrame outputBufferRectWithinSensorCropRect]((uint64_t)v8);
  uint64_t v19 = v18;
  int32x2_t v75 = vdup_n_s32(v11);
  uint64_t v20 = (uint64_t)vmul_s32(v75, (int32x2_t)v13);
  uint64_t v21 = SoftISPRectIntersection(*(void *)&v17, v18, v20);
  int32x2_t v22 = vadd_s32((int32x2_t)v21, (int32x2_t)v14);
  v23.i32[0] = v22.i32[0] / (int)v11;
  v23.i32[1] = v22.i32[1] / (int)v11;
  v26.i32[0] = v24 / v11;
  v26.i32[1] = v25 / v11;
  *((int32x2_t *)v9 + 1) = v23;
  *((int32x2_t *)v9 + 2) = v26;
  if (v10 == 3) {
    unsigned int v27 = 3;
  }
  else {
    unsigned int v27 = 1;
  }
  int8x8_t v28 = (int8x8_t)vdup_n_s32(v27);
  uint32x2_t v29 = (uint32x2_t)vceqz_s32((int32x2_t)vand_s8((int8x8_t)v23, v28));
  if ((vpmin_u32(v29, v29).u32[0] & 0x80000000) == 0) {
    goto LABEL_21;
  }
  uint32x2_t v30 = (uint32x2_t)vceqz_s32((int32x2_t)vand_s8((int8x8_t)v26, v28));
  if ((vpmin_u32(v30, v30).u32[0] & 0x80000000) == 0) {
    goto LABEL_21;
  }
  int32x2_t v31 = vmul_s32(v23, v75);
  int v32 = (v10 & 0xFFFFFFFE) == 2 ? 2 : 1;
  v31.i32[0] /= v32;
  v31.i32[1] /= v32;
  int32x2_t v33 = vmul_s32(v26, v75);
  v33.i32[0] /= v32;
  v33.i32[1] /= v32;
  *((int32x2_t *)v9 + 3) = v31;
  *((int32x2_t *)v9 + 4) = v33;
  v34.i32[0] = (int)v21 / v75.i32[0];
  v34.i32[1] = SHIDWORD(v21) / v75.i32[1];
  int32x2_t v35 = vadd_s32(vsub_s32(v34, (int32x2_t)v13), (int32x2_t)v12);
  *((int32x2_t *)v9 + 5) = v35;
  *((int32x2_t *)v9 + 6) = v26;
  uint32x2_t v36 = (uint32x2_t)vcgt_s32(v35, (int32x2_t)-1);
  if ((vpmin_u32(v36, v36).u32[0] & 0x80000000) == 0) {
    goto LABEL_21;
  }
  int32x2_t v68 = (int32x2_t)v21;
  int32x2_t v69 = v26;
  int32x2_t v37 = vadd_s32(v35, v26);
  -[SoftISPInputFrame sensorCropRect]((uint64_t)v7);
  uint64_t v71 = v38;
  unsigned int v39 = -[SoftISPInputFrame quadraBinningFactor]((uint64_t)v7);
  v40.i32[0] = v71 / v39;
  v40.i32[1] = HIDWORD(v71) / v39;
  uint32x2_t v41 = (uint32x2_t)vcge_s32(v40, v37);
  if ((vpmin_u32(v41, v41).u32[0] & 0x80000000) == 0) {
    goto LABEL_21;
  }
  uint32x2_t v42 = (uint32x2_t)vceqz_s32((int32x2_t)vand_s8(*(int8x8_t *)(v9 + 40), v28));
  if ((vpmin_u32(v42, v42).u32[0] & 0x80000000) == 0) {
    goto LABEL_21;
  }
  uint32x2_t v43 = (uint32x2_t)vceqz_s32((int32x2_t)vand_s8(*(int8x8_t *)(v9 + 48), v28));
  if ((vpmin_u32(v43, v43).u32[0] & 0x80000000) == 0) {
    goto LABEL_21;
  }
  int32x2_t v44 = vsub_s32(v68, v17);
  v45.i32[0] = v44.i32[0] / v75.i32[0] / (int)(v72 >> a5);
  v45.i32[1] = v44.i32[1] / v75.i32[1] / (int)(v72 >> a5);
  v46.i32[0] = v69.i32[0] / (v72 >> a5);
  v46.i32[1] = v69.i32[1] / (v72 >> a5);
  *((int32x2_t *)v9 + 7) = v45;
  *((int32x2_t *)v9 + 8) = v46;
  uint32x2_t v47 = (uint32x2_t)vcgt_s32(v45, (int32x2_t)-1);
  if ((vpmin_u32(v47, v47).u32[0] & 0x80000000) == 0) {
    goto LABEL_21;
  }
  uint32x2_t v48 = (uint32x2_t)vcge_s32((int32x2_t)-[RawNightModeInputFrame lscGainsTex]((uint64_t)v8), vadd_s32(v46, v45));
  if ((vpmin_u32(v48, v48).u32[0] & 0x80000000) == 0) {
    goto LABEL_21;
  }
  int32x2_t v74 = vdup_n_s32(v72 >> a5);
  int32x2_t v49 = vsub_s32((int32x2_t)SoftISPRectIntersection(*(void *)&v17, v19, *(void *)&vmul_s32(vadd_s32((int32x2_t)v70, (int32x2_t)v13), v75)), v17);
  v50.i32[0] = v49.i32[0] / v75.i32[0] / v74.i32[0];
  v50.i32[1] = v49.i32[1] / v75.i32[1] / v74.i32[1];
  v53.i32[0] = v51 / v75.i32[0] / v74.i32[0];
  v53.i32[1] = v52 / v75.i32[1] / v74.i32[1];
  *((int32x2_t *)v9 + 9) = v50;
  *((int32x2_t *)v9 + 10) = v53;
  uint32x2_t v54 = (uint32x2_t)vcgt_s32(v50, (int32x2_t)-1);
  if ((vpmin_u32(v54, v54).u32[0] & 0x80000000) == 0) {
    goto LABEL_21;
  }
  uint32x2_t v55 = (uint32x2_t)vcge_s32((int32x2_t)-[RawNightModeInputFrame lscGainsTex]((uint64_t)v8), vadd_s32(v53, v50));
  if ((vpmin_u32(v55, v55).u32[0] & 0x80000000) == 0) {
    goto LABEL_21;
  }
  uint64_t v56 = SoftISPRectIntersection(v67, v66, v20);
  v57.i32[0] = (int)v56 / v75.i32[0];
  v57.i32[1] = SHIDWORD(v56) / v75.i32[1];
  int8x8_t v58 = (int8x8_t)vadd_s32(vsub_s32(v57, (int32x2_t)v13), (int32x2_t)v12);
  v61.i32[0] = v59 / v75.i32[0];
  v61.i32[1] = v60 / v75.i32[1];
  *((int8x8_t *)v9 + 11) = v58;
  *((int8x8_t *)v9 + 12) = v61;
  uint32x2_t v62 = (uint32x2_t)vceqz_s32((int32x2_t)vand_s8(v58, v28));
  if ((vpmin_u32(v62, v62).u32[0] & 0x80000000) == 0) {
    goto LABEL_21;
  }
  uint32x2_t v63 = (uint32x2_t)vceqz_s32((int32x2_t)vand_s8(v61, v28));
  if ((vpmin_u32(v63, v63).u32[0] & 0x80000000) != 0)
  {
    v64 = v9;
  }
  else
  {
LABEL_21:
    FigSignalErrorAt();
    v64 = 0;
  }

  return v64;
}

- (uint64_t)processingRegionWithinSensorInReadoutPixels
{
  if (result) {
    return *(void *)(result + 8);
  }
  return result;
}

- (uint64_t)processingRegionWithinInputBufferInPixels
{
  if (result) {
    return *(void *)(result + 40);
  }
  return result;
}

- (uint64_t)processingRegionWithinOutputBufferInPixels
{
  if (result) {
    return *(void *)(result + 56);
  }
  return result;
}

- (uint64_t)hiqhQualityProcessingRegionWithinOutputBufferInPixels
{
  if (result) {
    return *(void *)(result + 72);
  }
  return result;
}

- (uint64_t)awbRegionOfInterestWithinInputBufferInPixels
{
  if (result) {
    return *(void *)(result + 88);
  }
  return result;
}

@end