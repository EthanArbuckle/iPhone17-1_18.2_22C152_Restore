@interface RawDFZoomStage
+ (int)prewarmShaders:(id)a3;
+ (void)setOutputMetadata:(id)a3 withFrame:(id)a4;
- (RawDFZoomStage)initWithMetalContext:(id)a3;
- (int)applyMirrorWithParams:(RawDFZoomStage *)self inputTex:(SEL)a2 inputOffset:(id *)a3 outputTex:(id)a4 outputOffset:(id)a5;
- (int)applyZoomWithParams:(RawDFZoomStage *)self inputTex:(SEL)a2 inputOffset:(id *)a3 outputTex:(id)a4 outputOffset:(id)a5;
- (int)processFrame:(RawDFZoomStage *)self inputTex:(SEL)a2 inputOrigin:(id)a3 outputTex:(id)a4 outputOrigin:(id)a5 doZoom:(BOOL)a6;
- (int)processFrame:(id)a3 inputTex:(id)a4 outputTex:(id)a5;
- (int)processFrame:(id)a3 inputTex:(id)a4 outputTex:(id)a5 doZoom:(BOOL)a6;
- (int)shouldProcessFrame:(id)a3 shouldZoom:(BOOL *)a4 shouldMirror:(BOOL *)a5;
- (int)updatePropertiesForFrame:(id)a3 withZoomParams:(id *)a4;
- (unsigned)mirrorConfig;
- (void)setMirrorConfig:(unsigned __int16)a3;
@end

@implementation RawDFZoomStage

- (RawDFZoomStage)initWithMetalContext:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)RawDFZoomStage;
  v6 = [(RawDFZoomStage *)&v14 init];
  v7 = v6;
  if (v6
    && (objc_storeStrong((id *)&v6->_metal, a3), v7->_metal)
    && (v8 = [[RawDFZoomShaders alloc] initWithMetal:v5],
        shaders = v7->_shaders,
        v7->_shaders = v8,
        shaders,
        v7->_shaders))
  {
    v7->_mirrorConfig = 0;
    v7->_enableZoom = 1;
    v10 = v7;
  }
  else
  {
    v13 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    v10 = 0;
  }
  v11 = v10;

  return v11;
}

+ (int)prewarmShaders:(id)a3
{
  id v3 = a3;
  v4 = [[RawDFZoomShaders alloc] initWithMetal:v3];

  if (v4) {
    return 0;
  }
  v6 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
  os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  fig_log_call_emit_and_clean_up_after_send_and_compose();

  return -12786;
}

- (int)applyMirrorWithParams:(RawDFZoomStage *)self inputTex:(SEL)a2 inputOffset:(id *)a3 outputTex:(id)a4 outputOffset:(id)a5
{
  int v7 = v6;
  v8 = v5;
  int v9 = (int)a5;
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v12 = a4;
  id v13 = v8;
  objc_super v14 = [(FigMetalContext *)self->_metal commandQueue];
  uint64_t v15 = [v14 commandBuffer];

  if (v15)
  {
    v16 = [v15 computeCommandEncoder];
    if (v16)
    {
      v17 = v16;
      [v16 setImageblockWidth:32 height:32];
      int16x4_t v24 = vuzp1_s16((int16x4_t)vmovn_s64(vcvtq_s64_f64((float64x2_t)a3->var2.origin)), (int16x4_t)vmovn_s64(vcvtq_s64_f64(vaddq_f64((float64x2_t)a3->var2.origin, (float64x2_t)a3->var2.size))));
      int v25 = v9;
      int v26 = v7;
      [v17 setBytes:&v24 length:16 atIndex:0];
      [v17 setComputePipelineState:self->_shaders->_applyMirrorKernel];
      [v17 setTexture:v12 atIndex:0];
      [v17 setTexture:v13 atIndex:1];
      v23[0] = [v13 width];
      v23[1] = [v13 height];
      v23[2] = 1;
      int64x2_t v21 = vdupq_n_s64(0x20uLL);
      uint64_t v22 = 1;
      [v17 dispatchThreads:v23 threadsPerThreadgroup:&v21];
      [v17 endEncoding];
      [v15 commit];

      int v18 = 0;
    }
    else
    {
      int v28 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      v20 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();

      int v18 = -73276;
    }
  }
  else
  {
    FigDebugAssert3();
    int v18 = FigSignalErrorAt();
  }

  return v18;
}

- (int)applyZoomWithParams:(RawDFZoomStage *)self inputTex:(SEL)a2 inputOffset:(id *)a3 outputTex:(id)a4 outputOffset:(id)a5
{
  unsigned int v7 = v6;
  v8 = v5;
  unsigned int v9 = a5;
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v12 = a4;
  id v13 = v8;
  objc_super v14 = [(FigMetalContext *)self->_metal commandQueue];
  uint64_t v15 = [v14 commandBuffer];

  if (!v15)
  {
    FigDebugAssert3();
    int v23 = FigSignalErrorAt();
    goto LABEL_10;
  }
  v16 = [v15 computeCommandEncoder];
  if (!v16)
  {
    int v32 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    int v25 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    int v23 = -73276;
    goto LABEL_10;
  }
  v17 = v16;
  [v16 setImageblockWidth:32 height:32];
  long long v29 = 0u;
  *(_OWORD *)v30[0].i8 = 0u;
  if (self->_mirrorConfig == 1)
  {
    CGSize size = a3->var3.size;
    int16x4_t v20 = vuzp1_s16((int16x4_t)vmovn_s64(vcvtq_s64_f64((float64x2_t)a3->var3.origin)), (int16x4_t)vmovn_s64(vcvtq_s64_f64(vaddq_f64((float64x2_t)a3->var3.origin, (float64x2_t)size))));
    int16x4_t v18 = v20;
  }
  else
  {
    if (self->_mirrorConfig)
    {
      int v32 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      uint64_t v22 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();

      goto LABEL_9;
    }
    int16x4_t v18 = vuzp1_s16((int16x4_t)vmovn_s64(vcvtq_s64_f64((float64x2_t)a3->var2.origin)), (int16x4_t)vmovn_s64(vcvtq_s64_f64(vaddq_f64((float64x2_t)a3->var2.origin, (float64x2_t)a3->var2.size))));
    CGSize size = a3->var3.size;
    int16x4_t v20 = vuzp1_s16((int16x4_t)vmovn_s64(vcvtq_s64_f64((float64x2_t)a3->var3.origin)), (int16x4_t)vmovn_s64(vcvtq_s64_f64(vaddq_f64((float64x2_t)a3->var3.origin, (float64x2_t)size))));
  }
  *(int16x4_t *)&long long v29 = v18;
  *((int16x4_t *)&v29 + 1) = vadd_s16(v20, (int16x4_t)vdup_n_s32(v9));
  CGSize v21 = a3->var4.size;
  v30[0] = vadd_s16((int16x4_t)vdup_n_s32(v7), vuzp1_s16((int16x4_t)vmovn_s64(vcvtq_s64_f64((float64x2_t)a3->var4.origin)), (int16x4_t)vmovn_s64(vcvtq_s64_f64(vaddq_f64((float64x2_t)a3->var4.origin, (float64x2_t)v21)))));
  v30[1] = (int16x4_t)vcvt_f32_f64(vdivq_f64((float64x2_t)v21, (float64x2_t)size));
  [v17 setBytes:&v29 length:32 atIndex:0];
  [v17 setComputePipelineState:self->_shaders->_applyZoomKernel];
  [v17 setTexture:v12 atIndex:0];
  [v17 setTexture:v13 atIndex:1];
  v28[0] = [v13 width];
  v28[1] = [v13 height];
  v28[2] = 1;
  int64x2_t v26 = vdupq_n_s64(0x20uLL);
  uint64_t v27 = 1;
  [v17 dispatchThreads:v28 threadsPerThreadgroup:&v26];
  [v17 endEncoding];
  [v15 commit];
LABEL_9:

  int v23 = 0;
LABEL_10:

  return v23;
}

- (int)updatePropertiesForFrame:(id)a3 withZoomParams:(id *)a4
{
  id v5 = a3;
  float64x2_t v6 = vcvtq_f64_u64(*(uint64x2_t *)&a4->var0);
  v140.columns[2] = (simd_float3)vdivq_f64((float64x2_t)a4->var3.origin, v6);
  *(float32x2_t *)v140.columns[2].f32 = vcvt_f32_f64((float64x2_t)v140.columns[2]);
  *(float *)&unsigned int v7 = a4->var3.size.width / v6.f64[0];
  float v8 = a4->var3.size.height / v6.f64[1];
  float32x2_t v9 = vcvt_f32_f64(vdivq_f64((float64x2_t)a4->var4.origin, v6));
  *(float *)v6.f64 = a4->var4.size.width / v6.f64[0];
  float v10 = a4->var4.size.height / v6.f64[1];
  v140.columns[0] = (simd_float3)v7;
  v140.columns[1].i32[0] = 0;
  v140.columns[1].i64[1] = 0;
  v140.columns[1].f32[1] = v8;
  v140.columns[2].i32[2] = 1.0;
  unsigned int v11 = LODWORD(v6.f64[0]);
  LODWORD(v6.f64[0]) = 0;
  *((float *)v6.f64 + 1) = v10;
  float32x4_t v129 = (float32x4_t)*(unint64_t *)&v6.f64[0];
  float32x4_t v133 = (float32x4_t)v11;
  __asm { FMOV            V3.4S, #1.0 }
  *(float32x2_t *)_Q3.f32 = v9;
  float32x4_t v126 = _Q3;
  CGAffineTransform v141 = (CGAffineTransform)__invert_f3(v140);
  uint64_t v17 = 0;
  CGAffineTransform v138 = v141;
  memset(&v139, 0, sizeof(v139));
  do
  {
    *(float32x4_t *)((char *)&v139.a + v17) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v133, COERCE_FLOAT(*(_OWORD *)((char *)&v138.a + v17))), v129, *(float32x2_t *)((char *)&v138.a + v17), 1), v126, *(float32x4_t *)((char *)&v138.a + v17), 2);
    v17 += 16;
  }
  while (v17 != 48);
  int32x4_t v130 = *(int32x4_t *)&v139.a;
  int32x4_t v134 = *(int32x4_t *)&v139.c;
  int32x4_t v127 = *(int32x4_t *)&v139.tx;
  int16x4_t v18 = [v5 properties];
  v19 = [v18 meta];
  [v19 setZoomApplied:1];

  int16x4_t v20 = [v5 properties];
  CGSize v21 = [v20 meta];
  v137[0] = vcvtq_f64_f32(*(float32x2_t *)v130.i8);
  v137[1] = vcvtq_f64_f32(*(float32x2_t *)v134.i8);
  v137[2] = vcvtq_f64_f32(*(float32x2_t *)v127.i8);
  [v21 setZoomTransform:v137];

  uint64_t v22 = [v5 properties];
  int v23 = (long long *)[v22 regHomography];
  long long v124 = v23[1];
  long long v125 = *v23;
  long long v123 = v23[2];

  int32x4_t v24 = vzip1q_s32(v130, v127);
  v142.columns[0] = (simd_float3)vzip1q_s32(v24, v134);
  v142.columns[0].i32[3] = 0;
  v142.columns[2] = (simd_float3)vzip1q_s32(vzip2q_s32(v130, v127), vdupq_laneq_s32(v134, 2));
  v142.columns[1] = (simd_float3)vzip2q_s32(v24, vdupq_lane_s32(*(int32x2_t *)v134.i8, 1));
  v142.columns[1].i32[3] = 0;
  v142.columns[2].i32[3] = 0;
  simd_float3 v131 = v142.columns[2];
  simd_float3 v135 = v142.columns[0];
  simd_float3 v128 = v142.columns[1];
  simd_float3x3 v143 = __invert_f3(v142);
  float32x4_t v121 = (float32x4_t)v143.columns[1];
  float32x4_t v122 = (float32x4_t)v143.columns[0];
  float32x4_t v120 = (float32x4_t)v143.columns[2];
  int v25 = [v5 properties];
  uint64_t v26 = [v25 regHomography];
  uint64_t v27 = 0;
  *(_OWORD *)&v138.CGFloat a = v125;
  *(_OWORD *)&v138.c = v124;
  *(_OWORD *)&v138.tdouble x = v123;
  memset(&v139, 0, sizeof(v139));
  do
  {
    *(float32x4_t *)((char *)&v139.a + v27) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v122, COERCE_FLOAT(*(_OWORD *)((char *)&v138.a + v27))), v121, *(float32x2_t *)((char *)&v138.a + v27), 1), v120, *(float32x4_t *)((char *)&v138.a + v27), 2);
    v27 += 16;
  }
  while (v27 != 48);
  uint64_t v28 = 0;
  float32x4_t v29 = *(float32x4_t *)&v139.a;
  float32x4_t v30 = *(float32x4_t *)&v139.c;
  float32x4_t v31 = *(float32x4_t *)&v139.tx;
  *(simd_float3 *)&v138.CGFloat a = v135;
  *(simd_float3 *)&v138.c = v128;
  *(simd_float3 *)&v138.tdouble x = v131;
  memset(&v139, 0, sizeof(v139));
  do
  {
    *(float32x4_t *)((char *)&v139.a + v28) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v29, COERCE_FLOAT(*(_OWORD *)((char *)&v138.a + v28))), v30, *(float32x2_t *)((char *)&v138.a + v28), 1), v31, *(float32x4_t *)((char *)&v138.a + v28), 2);
    v28 += 16;
  }
  while (v28 != 48);
  CGFloat a = v139.a;
  long long v33 = *(_OWORD *)&v139.c;
  long long v34 = *(_OWORD *)&v139.tx;
  *(_DWORD *)(v26 + 8) = LODWORD(v139.b);
  *(_DWORD *)(v26 + 24) = DWORD2(v33);
  *(CGFloat *)uint64_t v26 = a;
  *(void *)(v26 + 16) = v33;
  *(_DWORD *)(v26 + 40) = DWORD2(v34);
  *(void *)(v26 + 32) = v34;

  memset(&v139, 0, sizeof(v139));
  v35 = [v5 properties];
  v36 = [v35 meta];
  v37 = v36;
  if (v36) {
    [v36 zoomTransform];
  }
  else {
    memset(&v139, 0, sizeof(v139));
  }

  for (unint64_t i = 0; ; ++i)
  {
    v39 = [v5 properties];
    v40 = [v39 meta];
    v41 = [v40 faces];
    unint64_t v42 = [v41 count];

    if (i >= v42) {
      break;
    }
    v43 = [v5 properties];
    v44 = [v43 meta];
    v45 = [v44 faces];
    v46 = [v45 objectAtIndexedSubscript:i];
    [v46 rect];
    CGFloat v48 = v47;
    CGFloat v50 = v49;
    CGFloat v52 = v51;
    CGFloat v54 = v53;

    CGAffineTransform v138 = v139;
    v144.origin.double x = v48;
    v144.origin.double y = v50;
    v144.size.double width = v52;
    v144.size.double height = v54;
    CGRect v145 = CGRectApplyAffineTransform(v144, &v138);
    double x = v145.origin.x;
    double y = v145.origin.y;
    double width = v145.size.width;
    double height = v145.size.height;
    v59 = [v5 properties];
    v60 = [v59 meta];
    v61 = [v60 faces];
    v62 = [v61 objectAtIndexedSubscript:i];
    objc_msgSend(v62, "setRect:", x, y, width, height);
  }
  for (unint64_t j = 0; ; ++j)
  {
    v64 = [v5 properties];
    v65 = [v64 meta];
    v66 = [v65 bodies];
    unint64_t v67 = [v66 count];

    if (j >= v67) {
      break;
    }
    v68 = [v5 properties];
    v69 = [v68 meta];
    v70 = [v69 bodies];
    v71 = [v70 objectAtIndexedSubscript:j];
    [v71 rect];
    CGFloat v73 = v72;
    CGFloat v75 = v74;
    CGFloat v77 = v76;
    CGFloat v79 = v78;

    CGAffineTransform v138 = v139;
    v146.origin.double x = v73;
    v146.origin.double y = v75;
    v146.size.double width = v77;
    v146.size.double height = v79;
    CGRect v147 = CGRectApplyAffineTransform(v146, &v138);
    double v80 = v147.origin.x;
    double v81 = v147.origin.y;
    double v82 = v147.size.width;
    double v83 = v147.size.height;
    v84 = [v5 properties];
    v85 = [v84 meta];
    v86 = [v85 bodies];
    v87 = [v86 objectAtIndexedSubscript:j];
    objc_msgSend(v87, "setRect:", v80, v81, v82, v83);
  }
  v88 = [v5 properties];
  v89 = [v88 meta];
  char v90 = [v89 hasValidClippingData];

  if (v90)
  {
    float64x2_t v91 = vdivq_f64((float64x2_t)a4->var4.size, (float64x2_t)a4->var3.size);
    int32x2_t v132 = (int32x2_t)vcvt_f32_f64(v91);
    float32x4_t v136 = vcvt_hight_f32_f64(v132, v91);
    v92 = [v5 properties];
    v93 = [v92 meta];
    uint64_t v94 = *(void *)([v93 clippingData] + 8);

    int v95 = *(__int16 *)(v94 + 10);
    uint16x4_t v96 = *(uint16x4_t *)(v94 + 12);
    *(_WORD *)(v94 + 8) = (int)(a4->var4.origin.x
                              + ((double)*(__int16 *)(v94 + 8) - a4->var3.origin.x) * *(float *)v132.i32);
    *(_WORD *)(v94 + 10) = (int)(a4->var4.origin.y + ((double)v95 - a4->var3.origin.y) * *(float *)&v132.i32[1]);
    *(int16x4_t *)(v94 + 12) = vmovn_s32((int32x4_t)vcvtq_u32_f32(vmulq_f32(v136, vcvtq_f32_u32(vmovl_u16(v96)))));
  }
  [v5 width];
  [v5 height];
  v97 = [v5 properties];
  v98 = [v97 meta];
  if ([v98 hasFinalCropRect])
  {
    v99 = [v5 properties];
    v100 = [v99 meta];
    [v100 finalCropRect];
  }
  v101 = [v5 properties];
  v102 = [v101 meta];
  [v102 finalAspectRatio];
  FigCaptureMetadataUtilitiesComputeDenormalizedStillImageCropRect();
  CGFloat v104 = v103;
  CGFloat v106 = v105;
  CGFloat v108 = v107;
  CGFloat v110 = v109;

  v148.origin.double x = v104;
  v148.origin.double y = v106;
  v148.size.double width = v108;
  v148.size.double height = v110;
  BOOL v111 = CGRectEqualToRect(v148, a4->var3);
  v112 = [v5 properties];
  v113 = [v112 meta];
  v114 = [v113 zoomRelatedMetadata];
  FigCaptureMetadataUtilitiesUpdateMetadataForStillImageCrop();

  if (v111)
  {
    FigCaptureMetadataUtilitiesNormalizeCropRect();
    CFDictionaryRef DictionaryRepresentation = CGRectCreateDictionaryRepresentation(v149);
    v116 = [v5 properties];
    v117 = [v116 meta];
    v118 = [v117 zoomRelatedMetadata];
    [v118 setObject:DictionaryRepresentation forKeyedSubscript:*MEMORY[0x263F2EFB0]];
  }
  return 0;
}

- (int)shouldProcessFrame:(id)a3 shouldZoom:(BOOL *)a4 shouldMirror:(BOOL *)a5
{
  id v7 = a3;
  float v8 = [v7 properties];
  float32x2_t v9 = [v8 meta];
  char v10 = [v9 hasZoomRects];

  unsigned int v11 = [v7 properties];
  id v12 = [v11 meta];
  [v12 zoomSrcRect];
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  CGFloat v20 = v19;

  CGSize v21 = [v7 properties];
  uint64_t v22 = [v21 meta];
  [v22 zoomDstRect];
  CGFloat v24 = v23;
  CGFloat v26 = v25;
  CGFloat v28 = v27;
  CGFloat v30 = v29;

  v44.origin.double x = v14;
  v44.origin.double y = v16;
  v44.size.double width = v18;
  v44.size.double height = v20;
  v46.origin.double x = v24;
  v46.origin.double y = v26;
  v46.size.double width = v28;
  v46.size.double height = v30;
  BOOL v31 = CGRectEqualToRect(v44, v46);
  if (a4) {
    *a4 = v10 & !v31;
  }
  if ([v7 width] && objc_msgSend(v7, "height"))
  {
    int v32 = [v7 properties];
    long long v33 = [v32 meta];
    uint64_t v34 = [v33 ROI];
    CGFloat v35 = *(double *)v34;
    CGFloat v36 = *(double *)(v34 + 8);
    CGFloat v37 = *(double *)(v34 + 16);
    CGFloat v38 = *(double *)(v34 + 24);

    CGFloat v39 = (double)(unint64_t)[v7 width];
    v47.size.double height = (double)(unint64_t)[v7 height];
    v47.origin.double x = 0.0;
    v47.origin.double y = 0.0;
    v45.origin.double x = v35;
    v45.origin.double y = v36;
    v45.size.double width = v37;
    v45.size.double height = v38;
    v47.size.double width = v39;
    BOOL v40 = CGRectEqualToRect(v45, v47);
    int v41 = 0;
    if (a5) {
      *a5 = !v40;
    }
  }
  else
  {
    int v41 = -73276;
    if (dword_26B430EE8)
    {
      v43 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }

  return v41;
}

- (int)processFrame:(id)a3 inputTex:(id)a4 outputTex:(id)a5 doZoom:(BOOL)a6
{
  return [(RawDFZoomStage *)self processFrame:a3 inputTex:a4 inputOrigin:0 outputTex:a5 outputOrigin:0 doZoom:a6];
}

- (int)processFrame:(id)a3 inputTex:(id)a4 outputTex:(id)a5
{
  return [(RawDFZoomStage *)self processFrame:a3 inputTex:a4 inputOrigin:0 outputTex:a5 outputOrigin:0 doZoom:1];
}

- (int)processFrame:(RawDFZoomStage *)self inputTex:(SEL)a2 inputOrigin:(id)a3 outputTex:(id)a4 outputOrigin:(id)a5 doZoom:(BOOL)a6
{
  int v8 = v7;
  uint64_t v9 = v6;
  BOOL v10 = a6;
  uint64_t v63 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = a4;
  id v16 = (id)v10;
  double v17 = v16;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  if (!v15 || !v16) {
    goto LABEL_17;
  }
  if (v15 == v16)
  {
    v55 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT);
    int v52 = -73276;
    goto LABEL_21;
  }
  CGFloat v18 = [v14 rgbTex];

  if (!v18)
  {
    int v52 = -73276;
    if (!dword_26B430EE8) {
      goto LABEL_16;
    }
    v55 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT);
LABEL_21:
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    goto LABEL_16;
  }
  double v19 = [v14 rgbTex];
  unint64_t v20 = [v19 width];
  v56[0] = v20;

  CGSize v21 = [v14 rgbTex];
  unint64_t v22 = [v21 height];
  v56[1] = v22;

  if ([v15 width] + (unint64_t)(unsigned __int16)a5 > v20
    || [v15 height] + (unint64_t)(a5 >> 16) > v22
    || [v17 width] + (unint64_t)(unsigned __int16)v9 > v20
    || [v17 height] + (unint64_t)WORD1(v9) > v22)
  {
LABEL_17:
    CGFloat v54 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    int v52 = 0;
    goto LABEL_16;
  }
  double v23 = [v14 properties];
  CGFloat v24 = [v23 meta];
  double v25 = (long long *)[v24 ROI];
  long long v26 = v25[1];
  long long v57 = *v25;
  long long v58 = v26;

  double v27 = [v14 properties];
  CGFloat v28 = [v27 meta];
  int v29 = [v28 hasZoomRects];

  CGFloat v30 = [v14 properties];
  BOOL v31 = [v30 meta];
  [v31 zoomSrcRect];
  CGFloat v33 = v32;
  CGFloat v35 = v34;
  CGFloat v37 = v36;
  CGFloat v39 = v38;
  *(double *)&long long v59 = v32;
  *((double *)&v59 + 1) = v34;
  *(double *)&long long v60 = v36;
  *((double *)&v60 + 1) = v38;

  BOOL v40 = [v14 properties];
  int v41 = [v40 meta];
  [v41 zoomDstRect];
  CGFloat v43 = v42;
  CGFloat v45 = v44;
  CGFloat v47 = v46;
  CGFloat v49 = v48;
  *(double *)&long long v61 = v42;
  *((double *)&v61 + 1) = v44;
  *(double *)&long long v62 = v46;
  *((double *)&v62 + 1) = v48;

  v64.origin.double x = v33;
  v64.origin.double y = v35;
  v64.size.double width = v37;
  v64.size.double height = v39;
  v65.origin.double x = v43;
  v65.origin.double y = v45;
  v65.size.double width = v47;
  v65.size.double height = v49;
  BOOL v50 = CGRectEqualToRect(v64, v65);
  if (v8 && v29 && !v50)
  {
    int v51 = [(RawDFZoomStage *)self applyZoomWithParams:v56 inputTex:v15 inputOffset:a5 outputTex:v17 outputOffset:v9];
    if (!v51) {
      int v51 = [(RawDFZoomStage *)self updatePropertiesForFrame:v14 withZoomParams:v56];
    }
  }
  else
  {
    int v51 = [(RawDFZoomStage *)self applyMirrorWithParams:v56 inputTex:v15 inputOffset:a5 outputTex:v17 outputOffset:v9];
  }
  int v52 = v51;
LABEL_16:

  return v52;
}

+ (void)setOutputMetadata:(id)a3 withFrame:(id)a4
{
  id v12 = a3;
  id v5 = a4;
  uint64_t v6 = [v5 properties];
  int v7 = [v6 meta];
  int v8 = [v7 zoomApplied];

  if (v8)
  {
    uint64_t v9 = [v5 properties];
    BOOL v10 = [v9 meta];
    unsigned int v11 = [v10 zoomRelatedMetadata];
    [v12 addEntriesFromDictionary:v11];
  }
}

- (unsigned)mirrorConfig
{
  return self->_mirrorConfig;
}

- (void)setMirrorConfig:(unsigned __int16)a3
{
  self->_mirrorConfig = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shaders, 0);

  objc_storeStrong((id *)&self->_metal, 0);
}

@end