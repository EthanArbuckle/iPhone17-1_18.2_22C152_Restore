@interface _OUFrame
- (OUCamera)camera;
- (OUCamera)sceneCamera;
- (_OUFrame)initWithDictionary:(id)a3;
- (_OUFrame)initWithFrame:(id)a3;
- (__CVBuffer)GetSceneColorBufferBGRA;
- (__CVBuffer)LoadImageToCVPixelBufferTest:(id)a3 PixelType:(unsigned int)a4;
- (__CVBuffer)colorBuffer;
- (__CVBuffer)sceneColorBuffer;
- (__CVBuffer)sceneDepthBuffer;
- (__CVBuffer)sceneDepthConfidenceBuffer;
- (__CVBuffer)semanticConfidenceBuffer;
- (__CVBuffer)semanticLabelBuffer;
- (__CVBuffer)semanticLabelBufferOnWideCamera;
- (__n128)initWithSceneYUV:(__n128)a3 sceneDepth:(__n128)a4 referenceOriginTranform:(__n128)a5 OUCamera:(uint64_t)a6;
- (__n128)referenceOriginTransform;
- (__n128)setReferenceOriginTransform:(__n128)a3;
- (__n64)GetSceneRgbToDepthRatio;
- (double)GetCameraPoseInVisionWorld;
- (double)GetProjectionMatrixInVisionWorld;
- (double)GetSceneCameraPoseInVisionWorld;
- (double)GetSceneCameraProjectionMatrixInVisionWorld;
- (double)timestamp;
- (id)LoadDepth:(id)a3;
- (id)LoadLabel:(id)a3;
- (id)LoadRgb:(id)a3;
- (id)LoadVote:(id)a3;
- (int64_t)deviceOrientation;
- (int64_t)vioTrackingState;
- (void)GetSceneColorBufferBGRA;
- (void)ReleaseBuffer;
- (void)dealloc;
- (void)setCamera:(id)a3;
- (void)setColorBuffer:(__CVBuffer *)a3;
- (void)setSceneCamera:(id)a3;
- (void)setSceneColorBuffer:(__CVBuffer *)a3;
- (void)setSceneDepthBuffer:(__CVBuffer *)a3;
- (void)setSceneDepthConfidenceBuffer:(__CVBuffer *)a3;
- (void)setSemanticConfidenceBuffer:(__CVBuffer *)a3;
- (void)setSemanticLabelBuffer:(__CVBuffer *)a3;
- (void)setSemanticLabelBufferOnWideCamera:(__CVBuffer *)a3;
- (void)setTimestamp:(double)a3;
- (void)setVioTrackingState:(int64_t)a3;
@end

@implementation _OUFrame

- (_OUFrame)initWithFrame:(id)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)_OUFrame;
  v5 = [(_OUFrame *)&v23 init];
  if (v5)
  {
    [v4 timestamp];
    v5->_timestamp = v6;
    uint64_t v7 = [v4 camera];
    camera = v5->_camera;
    v5->_camera = (OUCamera *)v7;

    [v4 referenceOriginTransform];
    *(_OWORD *)&v5[1].super.isa = v9;
    *(_OWORD *)&v5[1]._timestamp = v10;
    *(_OWORD *)&v5[1]._colorBuffer = v11;
    *(_OWORD *)&v5[1]._sceneColorBuffer = v12;
    v5->_colorBuffer = CVPixelBufferRetain((CVPixelBufferRef)[v4 colorBuffer]);
    uint64_t v13 = [v4 sceneCamera];
    sceneCamera = v5->_sceneCamera;
    v5->_sceneCamera = (OUCamera *)v13;

    v5->_sceneColorBuffer = CVPixelBufferRetain((CVPixelBufferRef)[v4 sceneColorBuffer]);
    v5->_sceneDepthBuffer = CVPixelBufferRetain((CVPixelBufferRef)[v4 sceneDepthBuffer]);
    v5->_sceneDepthConfidenceBuffer = CVPixelBufferRetain((CVPixelBufferRef)[v4 sceneDepthConfidenceBuffer]);
    v5->_semanticLabelBuffer = CVPixelBufferRetain((CVPixelBufferRef)[v4 semanticLabelBuffer]);
    v5->_semanticConfidenceBuffer = CVPixelBufferRetain((CVPixelBufferRef)[v4 semanticConfidenceBuffer]);
    v5->_deviceOrientation = [v4 deviceOrientation];
    v5->_semanticLabelBufferOnWideCamera = 0;
    v5->sceneColorBufferBGRA = 0;
    v15 = _OULoggingGetOSLogForCategoryObjectUnderstanding();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      size_t Width = CVPixelBufferGetWidth(v5->_colorBuffer);
      size_t Height = CVPixelBufferGetHeight(v5->_colorBuffer);
      size_t v19 = CVPixelBufferGetWidth(v5->_sceneDepthBuffer);
      size_t v20 = CVPixelBufferGetHeight(v5->_sceneDepthBuffer);
      size_t v21 = CVPixelBufferGetWidth(v5->_semanticLabelBuffer);
      size_t v22 = CVPixelBufferGetHeight(v5->_semanticLabelBuffer);
      *(_DWORD *)buf = 134219264;
      size_t v25 = Width;
      __int16 v26 = 2048;
      size_t v27 = Height;
      __int16 v28 = 2048;
      size_t v29 = v19;
      __int16 v30 = 2048;
      size_t v31 = v20;
      __int16 v32 = 2048;
      size_t v33 = v21;
      __int16 v34 = 2048;
      size_t v35 = v22;
      _os_log_debug_impl(&dword_237C17000, v15, OS_LOG_TYPE_DEBUG, "The input arframe has rgb-image (%zu x %zu), sem-depth (%zu, %zu), sem (%zu, %zu)", buf, 0x3Eu);
    }
  }
  return v5;
}

- (_OUFrame)initWithDictionary:(id)a3
{
  v110[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v108.receiver = self;
  v108.super_class = (Class)_OUFrame;
  v5 = [(_OUFrame *)&v108 init];
  double v6 = v5;
  if (!v5) {
    goto LABEL_36;
  }
  uint64_t v7 = [v4 objectForKeyedSubscript:@"timestamp"];
  [(id)v7 doubleValue];
  *((void *)v5 + 2) = v8;

  long long v9 = [v4 objectForKeyedSubscript:@"reference_origin_transform"];
  LOBYTE(v7) = v9 == 0;

  if ((v7 & 1) == 0)
  {
    long long v10 = [v4 objectForKeyedSubscript:@"reference_origin_transform"];
    float4x4FromNSArray(v10, (simd_float4x4 *)(v5 + 112));
  }
  long long v11 = [v4 objectForKeyedSubscript:@"vio_tracking_state"];
  BOOL v12 = v11 == 0;

  if (!v12)
  {
    uint64_t v13 = [v4 objectForKeyedSubscript:@"vio_tracking_state"];
    *((void *)v5 + 11) = (int)[v13 intValue];
  }
  v14 = [v4 objectForKeyedSubscript:@"device_orientation"];
  BOOL v15 = v14 == 0;

  if (!v15)
  {
    v16 = [v4 objectForKeyedSubscript:@"device_orientation"];
    *((void *)v5 + 12) = (int)[v16 intValue];
  }
  v17 = [v4 objectForKeyedSubscript:@"camera"];
  BOOL v18 = v17 == 0;

  if (!v18)
  {
    size_t v19 = [v4 objectForKeyedSubscript:@"camera"];
    uint64_t v20 = OUCameraFromDictionary(v19);
    size_t v21 = (void *)*((void *)v5 + 3);
    *((void *)v5 + 3) = v20;
  }
  size_t v22 = [v4 objectForKeyedSubscript:@"scene_camera"];
  BOOL v23 = v22 == 0;

  if (!v23)
  {
    v24 = [v4 objectForKeyedSubscript:@"scene_camera"];
    uint64_t v25 = OUCameraFromDictionary(v24);
    __int16 v26 = (void *)*((void *)v5 + 5);
    *((void *)v5 + 5) = v25;
  }
  uint64_t v109 = *MEMORY[0x263F04130];
  v110[0] = MEMORY[0x263EFFA78];
  CFDictionaryRef v27 = [NSDictionary dictionaryWithObjects:v110 forKeys:&v109 count:1];
  __int16 v28 = [v4 objectForKeyedSubscript:@"color_buffer"];
  BOOL v29 = v28 == 0;

  __int16 v30 = (CFAllocatorRef *)MEMORY[0x263EFFB08];
  if (!v29)
  {
    size_t v31 = [v4 objectForKeyedSubscript:@"color_width"];
    size_t v32 = [v31 unsignedIntegerValue];

    size_t v33 = [v4 objectForKeyedSubscript:@"color_height"];
    size_t v34 = [v33 unsignedIntegerValue];

    size_t v35 = (CVPixelBufferRef *)(v5 + 32);
    if (CVPixelBufferCreate(*v30, v32, v34, 0x34323066u, v27, (CVPixelBufferRef *)v5 + 4)) {
      goto LABEL_33;
    }
    uint64_t v36 = [v4 objectForKeyedSubscript:@"color_buffer"];
    CVPixelBufferLockBaseAddress(*v35, 0);
    BaseAddress = CVPixelBufferGetBaseAddress(*v35);
    size_t DataSize = CVPixelBufferGetDataSize(*v35);
    id v39 = v36;
    memcpy(BaseAddress, (const void *)[v39 bytes], DataSize);
    CVPixelBufferUnlockBaseAddress(*v35, 0);
  }
  v40 = [v4 objectForKeyedSubscript:@"scene_color_buffer"];
  BOOL v41 = v40 == 0;

  if (!v41)
  {
    v42 = [v4 objectForKeyedSubscript:@"scene_color_width"];
    size_t v43 = [v42 unsignedIntegerValue];

    v44 = [v4 objectForKeyedSubscript:@"scene_color_height"];
    size_t v45 = [v44 unsignedIntegerValue];

    v46 = (CVPixelBufferRef *)(v5 + 48);
    if (CVPixelBufferCreate(*v30, v43, v45, 0x34323066u, v27, (CVPixelBufferRef *)v5 + 6)) {
      goto LABEL_33;
    }
    v47 = [v4 objectForKeyedSubscript:@"scene_color_buffer"];
    CVPixelBufferLockBaseAddress(*v46, 0);
    v48 = CVPixelBufferGetBaseAddress(*v46);
    size_t v49 = CVPixelBufferGetDataSize(*v46);
    id v50 = v47;
    memcpy(v48, (const void *)[v50 bytes], v49);
    CVPixelBufferUnlockBaseAddress(*v46, 0);
  }
  v51 = [v4 objectForKeyedSubscript:@"scene_color_buffer_bgra"];
  BOOL v52 = v51 == 0;

  if (v52)
  {
    *((void *)v5 + 1) = 0;
  }
  else
  {
    v53 = [v4 objectForKeyedSubscript:@"scene_color_width"];
    size_t v54 = [v53 unsignedIntegerValue];

    v55 = [v4 objectForKeyedSubscript:@"scene_color_height"];
    size_t v56 = [v55 unsignedIntegerValue];

    v57 = (CVPixelBufferRef *)(v5 + 8);
    if (CVPixelBufferCreate(*v30, v54, v56, 0x42475241u, v27, (CVPixelBufferRef *)v5 + 1)) {
      goto LABEL_33;
    }
    v58 = [v4 objectForKeyedSubscript:@"scene_color_buffer_bgra"];
    CVPixelBufferLockBaseAddress(*v57, 0);
    v59 = CVPixelBufferGetBaseAddress(*v57);
    size_t v60 = CVPixelBufferGetDataSize(*v57);
    id v61 = v58;
    memcpy(v59, (const void *)[v61 bytes], v60);
    CVPixelBufferUnlockBaseAddress(*v57, 0);
  }
  v62 = [v4 objectForKeyedSubscript:@"semantic_label_buffer"];
  BOOL v63 = v62 == 0;

  if (!v63)
  {
    v64 = [v4 objectForKeyedSubscript:@"semantic_label_width"];
    size_t v65 = [v64 unsignedIntegerValue];

    v66 = [v4 objectForKeyedSubscript:@"semantic_label_height"];
    size_t v67 = [v66 unsignedIntegerValue];

    v68 = (CVPixelBufferRef *)(v5 + 72);
    if (CVPixelBufferCreate(*v30, v65, v67, 0x4C303038u, v27, (CVPixelBufferRef *)v5 + 9)) {
      goto LABEL_33;
    }
    v69 = [v4 objectForKeyedSubscript:@"semantic_label_buffer"];
    CVPixelBufferLockBaseAddress(*v68, 0);
    v70 = CVPixelBufferGetBaseAddress(*v68);
    size_t v71 = CVPixelBufferGetDataSize(*v68);
    id v72 = v69;
    memcpy(v70, (const void *)[v72 bytes], v71);
    CVPixelBufferUnlockBaseAddress(*v68, 0);
  }
  v73 = [v4 objectForKeyedSubscript:@"semantic_confidence_buffer"];
  BOOL v74 = v73 == 0;

  if (!v74)
  {
    v75 = [v4 objectForKeyedSubscript:@"semantic_confidence_width"];
    size_t v76 = [v75 unsignedIntegerValue];

    v77 = [v4 objectForKeyedSubscript:@"semantic_confidence_height"];
    size_t v78 = [v77 unsignedIntegerValue];

    v79 = (CVPixelBufferRef *)(v5 + 80);
    if (CVPixelBufferCreate(*v30, v76, v78, 0x4C303066u, v27, (CVPixelBufferRef *)v5 + 10)) {
      goto LABEL_33;
    }
    v80 = [v4 objectForKeyedSubscript:@"semantic_confidence_buffer"];
    CVPixelBufferLockBaseAddress(*v79, 0);
    v81 = CVPixelBufferGetBaseAddress(*v79);
    size_t v82 = CVPixelBufferGetDataSize(*v79);
    id v83 = v80;
    memcpy(v81, (const void *)[v83 bytes], v82);
    CVPixelBufferUnlockBaseAddress(*v79, 0);
  }
  v84 = [v4 objectForKeyedSubscript:@"scene_depth_buffer"];
  BOOL v85 = v84 == 0;

  if (v85)
  {
LABEL_31:
    v95 = [v4 objectForKeyedSubscript:@"scene_depth_confidence_buffer"];
    BOOL v96 = v95 == 0;

    if (!v96)
    {
      v97 = [v4 objectForKeyedSubscript:@"scene_depth_confidence_width"];
      size_t v98 = [v97 unsignedIntegerValue];

      v99 = [v4 objectForKeyedSubscript:@"scene_depth_confidence_height"];
      size_t v100 = [v99 unsignedIntegerValue];

      v101 = (CVPixelBufferRef *)(v5 + 64);
      if (CVPixelBufferCreate(*v30, v98, v100, 0x66646570u, v27, v101)) {
        goto LABEL_33;
      }
      v103 = [v4 objectForKeyedSubscript:@"scene_depth_confidence_buffer"];
      CVPixelBufferLockBaseAddress(*v101, 0);
      v104 = CVPixelBufferGetBaseAddress(*v101);
      size_t v105 = CVPixelBufferGetDataSize(*v101);
      id v106 = v103;
      memcpy(v104, (const void *)[v106 bytes], v105);
      CVPixelBufferUnlockBaseAddress(*v101, 0);
    }
LABEL_36:
    v102 = v6;
    goto LABEL_37;
  }
  v86 = [v4 objectForKeyedSubscript:@"scene_depth_width"];
  size_t v87 = [v86 unsignedIntegerValue];

  v88 = [v4 objectForKeyedSubscript:@"scene_depth_height"];
  size_t v89 = [v88 unsignedIntegerValue];

  v90 = (CVPixelBufferRef *)(v5 + 56);
  if (!CVPixelBufferCreate(*v30, v87, v89, 0x66646570u, v27, (CVPixelBufferRef *)v5 + 7))
  {
    v91 = [v4 objectForKeyedSubscript:@"scene_depth_buffer"];
    CVPixelBufferLockBaseAddress(*v90, 0);
    v92 = CVPixelBufferGetBaseAddress(*v90);
    size_t v93 = CVPixelBufferGetDataSize(*v90);
    id v94 = v91;
    memcpy(v92, (const void *)[v94 bytes], v93);
    CVPixelBufferUnlockBaseAddress(*v90, 0);

    goto LABEL_31;
  }
LABEL_33:

  v102 = 0;
LABEL_37:

  return v102;
}

- (void)ReleaseBuffer
{
  sceneDepthBuffer = self->_sceneDepthBuffer;
  if (sceneDepthBuffer)
  {
    CVPixelBufferRelease(sceneDepthBuffer);
    self->_sceneDepthBuffer = 0;
  }
  sceneDepthConfidenceBuffer = self->_sceneDepthConfidenceBuffer;
  if (sceneDepthConfidenceBuffer)
  {
    CVPixelBufferRelease(sceneDepthConfidenceBuffer);
    self->_sceneDepthConfidenceBuffer = 0;
  }
  semanticLabelBuffer = self->_semanticLabelBuffer;
  if (semanticLabelBuffer)
  {
    CVPixelBufferRelease(semanticLabelBuffer);
    self->_semanticLabelBuffer = 0;
  }
  semanticLabelBufferOnWideCamera = self->_semanticLabelBufferOnWideCamera;
  if (semanticLabelBufferOnWideCamera)
  {
    CVPixelBufferRelease(semanticLabelBufferOnWideCamera);
    self->_semanticLabelBufferOnWideCamera = 0;
  }
  semanticConfidenceBuffer = self->_semanticConfidenceBuffer;
  if (semanticConfidenceBuffer)
  {
    CVPixelBufferRelease(semanticConfidenceBuffer);
    self->_semanticConfidenceBuffer = 0;
  }
  colorBuffer = self->_colorBuffer;
  if (colorBuffer)
  {
    CVPixelBufferRelease(colorBuffer);
    self->_colorBuffer = 0;
  }
  sceneColorBuffer = self->_sceneColorBuffer;
  if (sceneColorBuffer)
  {
    CVPixelBufferRelease(sceneColorBuffer);
    self->_sceneColorBuffer = 0;
  }
  sceneColorBufferBGRA = self->sceneColorBufferBGRA;
  if (sceneColorBufferBGRA)
  {
    CVPixelBufferRelease(sceneColorBufferBGRA);
    self->sceneColorBufferBGRA = 0;
  }
}

- (void)dealloc
{
  [(_OUFrame *)self ReleaseBuffer];
  v3.receiver = self;
  v3.super_class = (Class)_OUFrame;
  [(_OUFrame *)&v3 dealloc];
}

- (double)GetCameraPoseInVisionWorld
{
  float32x4_t v18 = (float32x4_t)ARKit_VW_RW;
  float32x4_t v20 = (float32x4_t)xmmword_26AF26880;
  float32x4_t v14 = (float32x4_t)xmmword_26AF268A0;
  float32x4_t v16 = (float32x4_t)xmmword_26AF26890;
  simd_float4x4 v27 = __invert_f4(*(simd_float4x4 *)(a1 + 112));
  uint64_t v2 = 0;
  simd_float4x4 v22 = v27;
  do
  {
    *(float32x4_t *)((char *)&v23 + v2 * 16) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v18, COERCE_FLOAT(*(_OWORD *)&v22.columns[v2])), v20, *(float32x2_t *)v22.columns[v2].f32, 1), v16, (float32x4_t)v22.columns[v2], 2), v14, (float32x4_t)v22.columns[v2], 3);
    ++v2;
  }
  while (v2 != 4);
  float32x4_t v19 = v23;
  float32x4_t v21 = v24;
  float32x4_t v15 = v26;
  float32x4_t v17 = v25;
  [*(id *)(a1 + 24) transform];
  uint64_t v3 = 0;
  v22.columns[0] = v4;
  v22.columns[1] = v5;
  v22.columns[2] = v6;
  v22.columns[3] = v7;
  do
  {
    *(float32x4_t *)((char *)&v23 + v3 * 16) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v19, COERCE_FLOAT(*(_OWORD *)&v22.columns[v3])), v21, *(float32x2_t *)v22.columns[v3].f32, 1), v17, (float32x4_t)v22.columns[v3], 2), v15, (float32x4_t)v22.columns[v3], 3);
    ++v3;
  }
  while (v3 != 4);
  uint64_t v8 = 0;
  float32x4_t v9 = v23;
  float32x4_t v10 = v24;
  float32x4_t v11 = v25;
  float32x4_t v12 = v26;
  simd_float4x4 v22 = *(simd_float4x4 *)RC_VC;
  do
  {
    *(float32x4_t *)((char *)&v23 + v8 * 16) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v9, COERCE_FLOAT(*(_OWORD *)&v22.columns[v8])), v10, *(float32x2_t *)v22.columns[v8].f32, 1), v11, (float32x4_t)v22.columns[v8], 2), v12, (float32x4_t)v22.columns[v8], 3);
    ++v8;
  }
  while (v8 != 4);
  return *(double *)v23.i64;
}

- (double)GetSceneCameraPoseInVisionWorld
{
  float32x4_t v18 = (float32x4_t)ARKit_VW_RW;
  float32x4_t v20 = (float32x4_t)xmmword_26AF26880;
  float32x4_t v14 = (float32x4_t)xmmword_26AF268A0;
  float32x4_t v16 = (float32x4_t)xmmword_26AF26890;
  simd_float4x4 v27 = __invert_f4(*(simd_float4x4 *)(a1 + 112));
  uint64_t v2 = 0;
  simd_float4x4 v22 = v27;
  do
  {
    *(float32x4_t *)((char *)&v23 + v2 * 16) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v18, COERCE_FLOAT(*(_OWORD *)&v22.columns[v2])), v20, *(float32x2_t *)v22.columns[v2].f32, 1), v16, (float32x4_t)v22.columns[v2], 2), v14, (float32x4_t)v22.columns[v2], 3);
    ++v2;
  }
  while (v2 != 4);
  float32x4_t v19 = v23;
  float32x4_t v21 = v24;
  float32x4_t v15 = v26;
  float32x4_t v17 = v25;
  [*(id *)(a1 + 40) transform];
  uint64_t v3 = 0;
  v22.columns[0] = v4;
  v22.columns[1] = v5;
  v22.columns[2] = v6;
  v22.columns[3] = v7;
  do
  {
    *(float32x4_t *)((char *)&v23 + v3 * 16) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v19, COERCE_FLOAT(*(_OWORD *)&v22.columns[v3])), v21, *(float32x2_t *)v22.columns[v3].f32, 1), v17, (float32x4_t)v22.columns[v3], 2), v15, (float32x4_t)v22.columns[v3], 3);
    ++v3;
  }
  while (v3 != 4);
  uint64_t v8 = 0;
  float32x4_t v9 = v23;
  float32x4_t v10 = v24;
  float32x4_t v11 = v25;
  float32x4_t v12 = v26;
  simd_float4x4 v22 = *(simd_float4x4 *)RC_VC;
  do
  {
    *(float32x4_t *)((char *)&v23 + v8 * 16) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v9, COERCE_FLOAT(*(_OWORD *)&v22.columns[v8])), v10, *(float32x2_t *)v22.columns[v8].f32, 1), v11, (float32x4_t)v22.columns[v8], 2), v12, (float32x4_t)v22.columns[v8], 3);
    ++v8;
  }
  while (v8 != 4);
  return *(double *)v23.i64;
}

- (double)GetProjectionMatrixInVisionWorld
{
  [a1[3] intrinsics];
  v2.i32[3] = 0;
  v3.i32[3] = 0;
  float32x4_t v8 = v3;
  float32x4_t v9 = v2;
  v4.i32[3] = 0;
  float32x4_t v7 = v4;
  [a1 GetCameraPoseInVisionWorld];
  simd_float4x4 v13 = __invert_f4(v12);
  uint64_t v5 = 0;
  simd_float4x4 v10 = v13;
  do
  {
    *(long long *)((char *)&v11 + v5 * 16) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v9, COERCE_FLOAT(*(_OWORD *)&v10.columns[v5])), v8, *(float32x2_t *)v10.columns[v5].f32, 1), v7, (float32x4_t)v10.columns[v5], 2), (float32x4_t)xmmword_237CB4480, (float32x4_t)v10.columns[v5], 3);
    ++v5;
  }
  while (v5 != 4);
  return *(double *)&v11;
}

- (double)GetSceneCameraProjectionMatrixInVisionWorld
{
  [a1[5] intrinsics];
  v2.i32[3] = 0;
  v3.i32[3] = 0;
  float32x4_t v8 = v3;
  float32x4_t v9 = v2;
  v4.i32[3] = 0;
  float32x4_t v7 = v4;
  [a1 GetSceneCameraPoseInVisionWorld];
  simd_float4x4 v13 = __invert_f4(v12);
  uint64_t v5 = 0;
  simd_float4x4 v10 = v13;
  do
  {
    *(long long *)((char *)&v11 + v5 * 16) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v9, COERCE_FLOAT(*(_OWORD *)&v10.columns[v5])), v8, *(float32x2_t *)v10.columns[v5].f32, 1), v7, (float32x4_t)v10.columns[v5], 2), (float32x4_t)xmmword_237CB4480, (float32x4_t)v10.columns[v5], 3);
    ++v5;
  }
  while (v5 != 4);
  return *(double *)&v11;
}

- (__n64)GetSceneRgbToDepthRatio
{
  float Width = (float)CVPixelBufferGetWidth(*(CVPixelBufferRef *)(a1 + 48));
  float Height = (float)CVPixelBufferGetHeight(*(CVPixelBufferRef *)(a1 + 48));
  float v4 = (float)CVPixelBufferGetWidth(*(CVPixelBufferRef *)(a1 + 56));
  size_t v5 = CVPixelBufferGetHeight(*(CVPixelBufferRef *)(a1 + 56));
  result.n64_f32[0] = Width / v4;
  result.n64_f32[1] = Height / (float)v5;
  return result;
}

- (__CVBuffer)GetSceneColorBufferBGRA
{
  p_sceneColorBufferBGRA = &self->sceneColorBufferBGRA;
  __n64 result = self->sceneColorBufferBGRA;
  if (!result)
  {
    if (utils::ConvertColor420fTo32BGRA(self->_sceneColorBuffer, p_sceneColorBufferBGRA, v2))
    {
      simd_float4 v6 = _OULoggingGetOSLogForCategoryObjectUnderstanding();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        -[_OUFrame GetSceneColorBufferBGRA]();
      }

      exception = __cxa_allocate_exception(0x10uLL);
      MEMORY[0x237E2C1F0](exception, &unk_237CC3E0E);
      __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
    }
    return *p_sceneColorBufferBGRA;
  }
  return result;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (OUCamera)camera
{
  return self->_camera;
}

- (void)setCamera:(id)a3
{
}

- (__n128)referenceOriginTransform
{
  return a1[7];
}

- (__n128)setReferenceOriginTransform:(__n128)a3
{
  result[7] = a2;
  result[8] = a3;
  result[9] = a4;
  result[10] = a5;
  return result;
}

- (__CVBuffer)colorBuffer
{
  return self->_colorBuffer;
}

- (void)setColorBuffer:(__CVBuffer *)a3
{
  self->_colorBuffer = a3;
}

- (OUCamera)sceneCamera
{
  return self->_sceneCamera;
}

- (void)setSceneCamera:(id)a3
{
}

- (__CVBuffer)sceneColorBuffer
{
  return self->_sceneColorBuffer;
}

- (void)setSceneColorBuffer:(__CVBuffer *)a3
{
  self->_sceneColorBuffer = a3;
}

- (__CVBuffer)sceneDepthBuffer
{
  return self->_sceneDepthBuffer;
}

- (void)setSceneDepthBuffer:(__CVBuffer *)a3
{
  self->_sceneDepthBuffer = a3;
}

- (__CVBuffer)sceneDepthConfidenceBuffer
{
  return self->_sceneDepthConfidenceBuffer;
}

- (void)setSceneDepthConfidenceBuffer:(__CVBuffer *)a3
{
  self->_sceneDepthConfidenceBuffer = a3;
}

- (__CVBuffer)semanticLabelBuffer
{
  return self->_semanticLabelBuffer;
}

- (void)setSemanticLabelBuffer:(__CVBuffer *)a3
{
  self->_semanticLabelBuffer = a3;
}

- (__CVBuffer)semanticConfidenceBuffer
{
  return self->_semanticConfidenceBuffer;
}

- (void)setSemanticConfidenceBuffer:(__CVBuffer *)a3
{
  self->_semanticConfidenceBuffer = a3;
}

- (int64_t)vioTrackingState
{
  return self->_vioTrackingState;
}

- (void)setVioTrackingState:(int64_t)a3
{
  self->_vioTrackingState = a3;
}

- (int64_t)deviceOrientation
{
  return self->_deviceOrientation;
}

- (__CVBuffer)semanticLabelBufferOnWideCamera
{
  return self->_semanticLabelBufferOnWideCamera;
}

- (void)setSemanticLabelBufferOnWideCamera:(__CVBuffer *)a3
{
  self->_semanticLabelBufferOnWideCamera = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneCamera, 0);
  objc_storeStrong((id *)&self->_camera, 0);
}

- (__n128)initWithSceneYUV:(__n128)a3 sceneDepth:(__n128)a4 referenceOriginTranform:(__n128)a5 OUCamera:(uint64_t)a6
{
  id v13 = a9;
  v21.receiver = a1;
  v21.super_class = (Class)_OUFrame;
  float32x4_t v14 = [(_OUFrame *)&v21 init];
  float32x4_t v15 = (__n128 *)v14;
  if (v14)
  {
    v14->_sceneColorBuffer = a7;
    v14->_sceneDepthBuffer = a8;
    objc_storeStrong((id *)&v14->_sceneCamera, a9);
    v15[7] = a2;
    v15[8] = a3;
    v15[9] = a4;
    v15[10] = a5;
    v15->n128_u64[1] = 0;
  }

  return v15;
}

- (id)LoadDepth:(id)a3
{
  float32x4_t v3 = (NSString *)a3;
  float v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  LoadDepthToDictionary(v3, v4);

  return v4;
}

- (id)LoadRgb:(id)a3
{
  float32x4_t v3 = (NSString *)a3;
  float v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  LoadRGBToDictionary(v3, v4);

  return v4;
}

- (id)LoadLabel:(id)a3
{
  float32x4_t v3 = (NSString *)a3;
  float v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  LoadSemanticToDictionary(v3, v4);

  return v4;
}

- (id)LoadVote:(id)a3
{
  float32x4_t v3 = (NSString *)a3;
  float v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  LoadSemanticConfToDictionary(v3, v4);

  return v4;
}

- (__CVBuffer)LoadImageToCVPixelBufferTest:(id)a3 PixelType:(unsigned int)a4
{
  return LoadImageToCVPixelBuffer((NSString *)a3, a4);
}

- (void)GetSceneColorBufferBGRA
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_237C17000, v0, v1, "Failed to convert yuv buffer to bgra buffer.", v2, v3, v4, v5, v6);
}

@end