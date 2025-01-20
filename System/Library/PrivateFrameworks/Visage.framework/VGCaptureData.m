@interface VGCaptureData
+ (BOOL)supportsSecureCoding;
+ (__CVBuffer)_createColorFromYCbCr:(__CVBuffer *)a3;
+ (double)_dataToMatrix33:(void *)a3;
+ (double)_dataToMatrix44:(void *)a3;
+ (id)_matrix33ToData:(__n128)a3;
+ (id)_matrix44ToData:(__n128)a3;
+ (id)computeYuvHighResChromaticAdaptationReverted:(id)a3 chromaticAdaptationMatrix:(id *)a4;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)mirrored;
- (IOSurface)mcamLeftYuvHighRes;
- (IOSurface)mcamLeftYuvHighResChromaticAdaptationReverted;
- (IOSurface)mcamLeftYuvHighResUndistortionLut;
- (IOSurface)yuvHighRes;
- (IOSurface)yuvHighResChromaticAdaptationReverted;
- (IOSurface)yuvHighResUndistortionLut;
- (NSArray)allFaces;
- (NSDictionary)faceTrackingResult;
- (VGCaptureData)initWithCoder:(id)a3;
- (VGFaceMetadata)face;
- (VGFaceMetadata)mcamLeftFaceMetadata;
- (VGSkeleton)skeleton;
- (__CVBuffer)depth;
- (__CVBuffer)mcamLeftColorRGB;
- (__CVBuffer)mcamLeftColorRGBChromaticAdaptationReverted;
- (__CVBuffer)mcamLeftColorYuv;
- (__CVBuffer)mcamLeftColorYuvChromaticAdaptationReverted;
- (__CVBuffer)mcamLeftDepth;
- (__CVBuffer)rgbRectified;
- (__CVBuffer)yuvRectified;
- (__n128)cameraToDeviceTransform;
- (__n128)chromaticAdaptationMatrix;
- (__n128)depthIntrinsics;
- (__n128)mcamLeftChromaticAdaptationMatrix;
- (__n128)mcamLeftColorIntrinsics;
- (__n128)mcamLeftDepthIntrinsics;
- (__n128)mcamLeftToDeviceTransform;
- (__n128)setCameraToDeviceTransform:(__n128)a3;
- (__n128)setChromaticAdaptationMatrix:(__n128)a3;
- (__n128)setDepthIntrinsics:(__n128)a3;
- (__n128)setMcamLeftChromaticAdaptationMatrix:(__n128)a3;
- (__n128)setMcamLeftColorIntrinsics:(__n128)a3;
- (__n128)setMcamLeftDepthIntrinsics:(__n128)a3;
- (__n128)setMcamLeftToDeviceTransform:(__n128)a3;
- (__n128)setVideoIntrinsics:(__n128)a3;
- (__n128)videoIntrinsics;
- (id)copyWithZone:(_NSZone *)a3;
- (id)getFaceCaptureData;
- (unint64_t)enrollmentPhase;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)saveAtPath:(id)a3;
- (void)setAllFaces:(id)a3;
- (void)setDepth:(__CVBuffer *)a3;
- (void)setEnrollmentPhase:(unint64_t)a3;
- (void)setFace:(id)a3;
- (void)setFaceTrackingResult:(id)a3;
- (void)setMcamLeftColorRGB:(__CVBuffer *)a3;
- (void)setMcamLeftColorYuv:(__CVBuffer *)a3;
- (void)setMcamLeftDepth:(__CVBuffer *)a3;
- (void)setMcamLeftYuvHighRes:(id)a3;
- (void)setMcamLeftYuvHighResUndistortionLut:(id)a3;
- (void)setMirrored:(BOOL)a3;
- (void)setRgbRectified:(__CVBuffer *)a3;
- (void)setSkeleton:(id)a3;
- (void)setTimestamp:(id *)a3;
- (void)setYuvHighRes:(id)a3;
- (void)setYuvHighResUndistortionLut:(id)a3;
- (void)setYuvRectified:(__CVBuffer *)a3;
@end

@implementation VGCaptureData

+ (__CVBuffer)_createColorFromYCbCr:(__CVBuffer *)a3
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  v4 = VGLogVGCaptureData();
  if (os_signpost_enabled(v4))
  {
    *(_WORD *)buf.opaque = 0;
    _os_signpost_emit_with_name_impl(&dword_260C8D000, v4, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "CreateColorFromYCbCr", (const char *)&unk_260D385D9, buf.opaque, 2u);
  }

  CVPixelBufferLockBaseAddress(a3, 1uLL);
  v37[0] = MEMORY[0x263EF8330];
  v37[1] = 3221225472;
  v37[2] = __39__VGCaptureData__createColorFromYCbCr___block_invoke_2;
  v37[3] = &__block_descriptor_40_e5_v8__0l;
  v37[4] = a3;
  v5 = (void (**)(void))MEMORY[0x261227FC0](v37);
  BaseAddressOfPlane = CVPixelBufferGetBaseAddressOfPlane(a3, 0);
  vImagePixelCount WidthOfPlane = CVPixelBufferGetWidthOfPlane(a3, 0);
  srcYp.data = BaseAddressOfPlane;
  srcYp.height = CVPixelBufferGetHeightOfPlane(a3, 0);
  srcYp.width = WidthOfPlane;
  srcYp.rowBytes = CVPixelBufferGetBytesPerRowOfPlane(a3, 0);
  v8 = CVPixelBufferGetBaseAddressOfPlane(a3, 1uLL);
  vImagePixelCount v9 = CVPixelBufferGetWidthOfPlane(a3, 1uLL);
  srcCbCr.data = v8;
  srcCbCr.height = CVPixelBufferGetHeightOfPlane(a3, 1uLL);
  srcCbCr.width = v9;
  srcCbCr.rowBytes = CVPixelBufferGetBytesPerRowOfPlane(a3, 1uLL);
  dest.data = malloc_type_malloc(4 * srcYp.width * srcYp.height, 0xD18F1F0EuLL);
  *(_OWORD *)&dest.height = *(_OWORD *)&srcYp.height;
  dest.rowBytes = 4 * srcYp.width;
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = __39__VGCaptureData__createColorFromYCbCr___block_invoke_2;
  v32[3] = &__block_descriptor_64_e5_v8__0l;
  vImage_Buffer v33 = dest;
  v10 = (void (**)(void))MEMORY[0x261227FC0](v32);
  OSType PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  v12.i32[0] = 875704422;
  v13.i32[0] = PixelFormatType;
  int8x8_t v14 = vbsl_s8((int8x8_t)vdup_lane_s32(vceq_s32(v13, v12), 0), (int8x8_t)0x1000000FFLL, (int8x8_t)0x10000000EBLL);
  if (PixelFormatType == 875704422) {
    int32_t v15 = 255;
  }
  else {
    int32_t v15 = 240;
  }
  pixelRange.Yp_bias = 16 * (PixelFormatType != 875704422);
  pixelRange.CbCr_bias = 128;
  pixelRange.YpRangeMax = v14.i32[0];
  pixelRange.CbCrRangeMax = v15;
  *(int8x8_t *)&pixelRange.YpMax = v14;
  pixelRange.CbCrMax = v15;
  pixelRange.CbCrMin = pixelRange.Yp_bias;
  if (vImageConvert_YpCbCrToARGB_GenerateConversion((const vImage_YpCbCrToARGBMatrix *)*MEMORY[0x263EFAA38], &pixelRange, &buf, kvImage420Yp8_CbCr8, kvImageARGB8888, 0)|| (*(_DWORD *)permuteMap = 50462976, vImageConvert_420Yp8_CbCr8ToARGB8888(&srcYp, &srcCbCr, &dest, &buf, permuteMap, 0xFFu, 0x100u)))
  {
    v16 = 0;
  }
  else
  {
    id v18 = objc_alloc(MEMORY[0x263F0ED00]);
    v38[0] = *MEMORY[0x263F0ECF8];
    v19 = [NSNumber numberWithUnsignedLong:dest.width];
    v39[0] = v19;
    v38[1] = *MEMORY[0x263F0ECC0];
    v20 = [NSNumber numberWithUnsignedLong:dest.height];
    uint64_t v21 = *MEMORY[0x263F0ECA0];
    v39[1] = v20;
    v39[2] = &unk_270CFDB70;
    uint64_t v22 = *MEMORY[0x263F0ECA8];
    v38[2] = v21;
    v38[3] = v22;
    v23 = [NSNumber numberWithUnsignedLong:dest.rowBytes];
    v38[4] = *MEMORY[0x263F0ECC8];
    v39[3] = v23;
    v39[4] = &unk_270CFDB88;
    v24 = [NSDictionary dictionaryWithObjects:v39 forKeys:v38 count:5];
    v25 = (void *)[v18 initWithProperties:v24];

    if (v25)
    {
      [v25 lockWithOptions:0 seed:0];
      id v26 = v25;
      v27 = (void *)[v26 baseAddress];
      memcpy(v27, dest.data, dest.height * dest.rowBytes);
      [v26 unlockWithOptions:0 seed:0];
      CVPixelBufferRef v29 = 0;
      if (CVPixelBufferCreateWithIOSurface(0, (IOSurfaceRef)v26, 0, &v29)) {
        v16 = 0;
      }
      else {
        v16 = v29;
      }
    }
    else
    {
      v28 = __VGLogSharedInstance();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v29) = 0;
        _os_log_impl(&dword_260C8D000, v28, OS_LOG_TYPE_ERROR, " Failed to create IOSurface ", (uint8_t *)&v29, 2u);
      }

      v16 = 0;
    }
  }
  v10[2](v10);

  v5[2](v5);
  __39__VGCaptureData__createColorFromYCbCr___block_invoke();
  return v16;
}

void __39__VGCaptureData__createColorFromYCbCr___block_invoke()
{
  v0 = VGLogVGCaptureData();
  if (os_signpost_enabled(v0))
  {
    *(_WORD *)v1 = 0;
    _os_signpost_emit_with_name_impl(&dword_260C8D000, v0, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "CreateColorFromYCbCr", (const char *)&unk_260D385D9, v1, 2u);
  }
}

uint64_t __39__VGCaptureData__createColorFromYCbCr___block_invoke_2(uint64_t a1)
{
  return CVPixelBufferUnlockBaseAddress(*(CVPixelBufferRef *)(a1 + 32), 1uLL);
}

void __39__VGCaptureData__createColorFromYCbCr___block_invoke_2(uint64_t a1)
{
}

+ (id)computeYuvHighResChromaticAdaptationReverted:(id)a3 chromaticAdaptationMatrix:(id *)a4
{
  v40[4] = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = VGLogVGCaptureData();
  if (os_signpost_enabled(v6))
  {
    *(_WORD *)vImage_YpCbCrToARGB buf = 0;
    _os_signpost_emit_with_name_impl(&dword_260C8D000, v6, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "computeYuvHighResChromaticAdaptationReverted", (const char *)&unk_260D385D9, buf, 2u);
  }

  if (v5)
  {
    uint32x4_t v7 = (uint32x4_t)vandq_s8(vandq_s8((int8x16_t)vceqq_f32(*((float32x4_t *)a4 + 1), *(float32x4_t *)(MEMORY[0x263EF89A0] + 16)), (int8x16_t)vceqq_f32(*(float32x4_t *)a4, *MEMORY[0x263EF89A0])), (int8x16_t)vceqq_f32(*((float32x4_t *)a4 + 2), *(float32x4_t *)(MEMORY[0x263EF89A0] + 32)));
    v7.i32[3] = v7.i32[2];
    if ((vminvq_u32(v7) & 0x80000000) != 0)
    {
      id v24 = v5;
    }
    else
    {
      id v8 = objc_alloc(MEMORY[0x263F0ED00]);
      v39[0] = *MEMORY[0x263F0ECF8];
      vImagePixelCount v9 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v5, "width"));
      v40[0] = v9;
      v39[1] = *MEMORY[0x263F0ECC0];
      v10 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v5, "height"));
      uint64_t v11 = *MEMORY[0x263F0ECA0];
      v40[1] = v10;
      v40[2] = &unk_270CFDB70;
      uint64_t v12 = *MEMORY[0x263F0ECC8];
      v39[2] = v11;
      v39[3] = v12;
      v40[3] = &unk_270CFDB88;
      int32x2_t v13 = [NSDictionary dictionaryWithObjects:v40 forKeys:v39 count:4];
      int8x8_t v14 = (vg *)[v8 initWithProperties:v13];

      objc_msgSend(v5, "vg_convert420Yp8_CbCr8ToARGB8888:", v14);
      int32_t v15 = __VGLogSharedInstance();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)vImage_YpCbCrToARGB buf = 0;
        _os_log_impl(&dword_260C8D000, v15, OS_LOG_TYPE_INFO, " Inverting MCAM chromatic adaptation ", buf, 2u);
      }

      simd_float3x3 v42 = __invert_f3(*(simd_float3x3 *)_PromotedConst);
      float32x4_t v28 = (float32x4_t)v42.columns[1];
      float32x4_t v29 = (float32x4_t)v42.columns[0];
      float32x4_t v27 = (float32x4_t)v42.columns[2];
      long long v31 = 0u;
      long long v32 = 0u;
      IOSurface v30 = (IOSurface)0;
      v42.columns[1] = (simd_float3)*((_OWORD *)a4 + 1);
      v42.columns[2] = (simd_float3)*((_OWORD *)a4 + 2);
      int32x4_t v16 = vzip1q_s32(*(int32x4_t *)a4, (int32x4_t)v42.columns[2]);
      v42.columns[0] = (simd_float3)vzip1q_s32(v16, (int32x4_t)v42.columns[1]);
      v42.columns[2] = (simd_float3)vzip1q_s32(vzip2q_s32(*(int32x4_t *)a4, (int32x4_t)v42.columns[2]), vdupq_laneq_s32((int32x4_t)v42.columns[1], 2));
      v42.columns[1] = (simd_float3)vzip2q_s32(v16, vdupq_lane_s32(*(int32x2_t *)v42.columns[1].f32, 1));
      simd_float3x3 v43 = __invert_f3(v42);
      uint64_t v18 = 0;
      long long v33 = xmmword_260D21A40;
      long long v34 = xmmword_260D21A50;
      long long v35 = xmmword_260D21A60;
      do
      {
        *(float32x4_t *)&buf[v18] = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)v43.columns[0], COERCE_FLOAT(*(long long *)((char *)&v33 + v18))), (float32x4_t)v43.columns[1], *(float32x2_t *)((char *)&v33 + v18), 1), (float32x4_t)v43.columns[2], *(float32x4_t *)((char *)&v33 + v18), 2);
        v18 += 16;
      }
      while (v18 != 48);
      uint64_t v19 = 0;
      long long v33 = *(_OWORD *)buf;
      long long v34 = v37;
      long long v35 = v38;
      do
      {
        *(float32x4_t *)&buf[v19] = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v29, COERCE_FLOAT(*(long long *)((char *)&v33 + v19))), v28, *(float32x2_t *)((char *)&v33 + v19), 1), v27, *(float32x4_t *)((char *)&v33 + v19), 2);
        v19 += 16;
      }
      while (v19 != 48);
      LODWORD(v30._impl) = *(_DWORD *)&buf[8];
      DWORD2(v31) = DWORD2(v37);
      v30.super.isa = *(Class *)buf;
      *(void *)&long long v31 = v37;
      DWORD2(v32) = DWORD2(v38);
      *(void *)&long long v32 = v38;
      v20 = vg::createSurfaceFromSurfaceWithTransform(v14, &v30, v17);
      uint64_t v21 = __VGLogSharedInstance();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)vImage_YpCbCrToARGB buf = 0;
        _os_log_impl(&dword_260C8D000, v21, OS_LOG_TYPE_INFO, " Finished inverting MCAM chromatic adaptation ", buf, 2u);
      }

      uint64_t v22 = [v5 allAttachments];
      v23 = [v22 objectForKeyedSubscript:@"CreationProperties"];

      id v24 = (id)[objc_alloc(MEMORY[0x263F0ED00]) initWithProperties:v23];
      if (v24)
      {
        objc_msgSend(v20, "vg_convertARGB8888To420Yp8_CbCr8:", v24);
        id v25 = v24;
      }
    }
  }
  else
  {
    id v24 = 0;
  }
  __88__VGCaptureData_computeYuvHighResChromaticAdaptationReverted_chromaticAdaptationMatrix___block_invoke();

  return v24;
}

void __88__VGCaptureData_computeYuvHighResChromaticAdaptationReverted_chromaticAdaptationMatrix___block_invoke()
{
  v0 = VGLogVGCaptureData();
  if (os_signpost_enabled(v0))
  {
    *(_WORD *)v1 = 0;
    _os_signpost_emit_with_name_impl(&dword_260C8D000, v0, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "computeYuvHighResChromaticAdaptationReverted", (const char *)&unk_260D385D9, v1, 2u);
  }
}

- (id)getFaceCaptureData
{
  v3 = objc_alloc_init(VGFaceCaptureData);
  [(VGFaceCaptureData *)v3 setYuvRectified:[(VGCaptureData *)self yuvRectified]];
  [(VGFaceCaptureData *)v3 setDepth:[(VGCaptureData *)self depth]];
  [(VGCaptureData *)self videoIntrinsics];
  -[VGFaceCaptureData setVideoIntrinsics:](v3, "setVideoIntrinsics:");
  [(VGCaptureData *)self depthIntrinsics];
  -[VGFaceCaptureData setDepthIntrinsics:](v3, "setDepthIntrinsics:");
  [(VGCaptureData *)self chromaticAdaptationMatrix];
  -[VGFaceCaptureData setChromaticAdaptationMatrix:](v3, "setChromaticAdaptationMatrix:");
  v4 = [(VGCaptureData *)self face];
  [(VGFaceCaptureData *)v3 setFace:v4];

  id v5 = [(VGCaptureData *)self allFaces];
  [(VGFaceCaptureData *)v3 setAllFaces:v5];

  [(VGCaptureData *)self timestamp];
  long long v7 = v9;
  uint64_t v8 = v10;
  [(VGFaceCaptureData *)v3 setTimestamp:&v7];

  return v3;
}

+ (id)_matrix33ToData:(__n128)a3
{
  v10[0] = a1;
  v10[1] = a2;
  v10[2] = a3;
  id v3 = (id) [objc_alloc(MEMORY[0x263EFF990]) initWithLength:36];
  uint64_t v4 = [v3 mutableBytes];
  for (uint64_t i = 0; i != 3; ++i)
  {
    uint64_t v6 = 0;
    long long v7 = v10[i];
    do
    {
      long long v9 = v7;
      *(_DWORD *)(v4 + 4 * v6) = *(_DWORD *)((unint64_t)&v9 & 0xFFFFFFFFFFFFFFF3 | (4 * (v6 & 3)));
      ++v6;
    }
    while (v6 != 3);
    v4 += 12;
  }

  return v3;
}

+ (id)_matrix44ToData:(__n128)a3
{
  v11[0] = a1;
  v11[1] = a2;
  v11[2] = a3;
  v11[3] = a4;
  id v4 = (id) [objc_alloc(MEMORY[0x263EFF990]) initWithLength:64];
  uint64_t v5 = [v4 mutableBytes];
  for (uint64_t i = 0; i != 4; ++i)
  {
    uint64_t v7 = 0;
    long long v8 = v11[i];
    do
    {
      long long v10 = v8;
      *(_DWORD *)(v5 + 4 * v7) = *(_DWORD *)((unint64_t)&v10 & 0xFFFFFFFFFFFFFFF3 | (4 * (v7 & 3)));
      ++v7;
    }
    while (v7 != 4);
    v5 += 16;
  }

  return v4;
}

+ (double)_dataToMatrix33:(void *)a3
{
  uint64_t v3 = [a3 bytes];
  uint64_t v4 = 0;
  long long v5 = *(_OWORD *)(MEMORY[0x263EF89A0] + 16);
  v12[0] = *MEMORY[0x263EF89A0];
  v12[1] = v5;
  v12[2] = *(_OWORD *)(MEMORY[0x263EF89A0] + 32);
  do
  {
    uint64_t v6 = 0;
    uint64_t v7 = &v12[v4];
    long long v8 = *v7;
    do
    {
      int v9 = *(_DWORD *)(v3 + 4 * v6);
      long long v11 = v8;
      *(_DWORD *)((unint64_t)&v11 & 0xFFFFFFFFFFFFFFF3 | (4 * (v6 & 3))) = v9;
      long long v8 = v11;
      ++v6;
    }
    while (v6 != 3);
    *((_DWORD *)v7 + 2) = DWORD2(v11);
    *(void *)uint64_t v7 = v8;
    ++v4;
    v3 += 12;
  }
  while (v4 != 3);
  return *(double *)v12;
}

+ (double)_dataToMatrix44:(void *)a3
{
  uint64_t v3 = [a3 bytes];
  uint64_t v4 = 0;
  long long v5 = *(_OWORD *)(MEMORY[0x263EF89A8] + 16);
  v12[0] = *MEMORY[0x263EF89A8];
  v12[1] = v5;
  long long v6 = *(_OWORD *)(MEMORY[0x263EF89A8] + 48);
  v12[2] = *(_OWORD *)(MEMORY[0x263EF89A8] + 32);
  _OWORD v12[3] = v6;
  do
  {
    uint64_t v7 = 0;
    long long v8 = v12[v4];
    do
    {
      int v9 = *(_DWORD *)(v3 + 4 * v7);
      long long v11 = v8;
      *(_DWORD *)((unint64_t)&v11 & 0xFFFFFFFFFFFFFFF3 | (4 * (v7 & 3))) = v9;
      long long v8 = v11;
      ++v7;
    }
    while (v7 != 4);
    v12[v4++] = v11;
    v3 += 16;
  }
  while (v4 != 4);
  return *(double *)v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  [v4 setRgbRectified:self->_rgbRectified];
  [v4 setMirrored:self->_mirrored];
  objc_msgSend(v4, "setVideoIntrinsics:", *(double *)self->_anon_d0, *(double *)&self->_anon_d0[16], *(double *)&self->_anon_d0[32]);
  objc_msgSend(v4, "setDepthIntrinsics:", *(double *)self->_anon_100, *(double *)&self->_anon_100[16], *(double *)&self->_anon_100[32]);
  objc_msgSend(v4, "setChromaticAdaptationMatrix:", *(double *)self->_anon_130, *(double *)&self->_anon_130[16], *(double *)&self->_anon_130[32]);
  [v4 setFace:self->_face];
  [v4 setAllFaces:self->_allFaces];
  $95D729B680665BEAEFA1D6FCA8238556 timestamp = self->_timestamp;
  [v4 setTimestamp:&timestamp];
  [v4 setFaceTrackingResult:self->_faceTrackingResult];
  [v4 setSkeleton:self->_skeleton];
  objc_msgSend(v4, "setCameraToDeviceTransform:", *(double *)self->_anon_1f0, *(double *)&self->_anon_1f0[16], *(double *)&self->_anon_1f0[32], *(double *)&self->_anon_1f0[48]);
  CVPixelBufferRef IOSurfaceBackedPixelBufferCopy = vg::createIOSurfaceBackedPixelBufferCopy(self->_depth, v5);
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __30__VGCaptureData_copyWithZone___block_invoke;
  v28[3] = &__block_descriptor_40_e5_v8__0l;
  v28[4] = IOSurfaceBackedPixelBufferCopy;
  uint64_t v7 = (void (**)(void))MEMORY[0x261227FC0](v28);
  [v4 setDepth:IOSurfaceBackedPixelBufferCopy];
  CVPixelBufferRef v9 = vg::createIOSurfaceBackedPixelBufferCopy(self->_yuvRectified, v8);
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __30__VGCaptureData_copyWithZone___block_invoke_2;
  v27[3] = &__block_descriptor_40_e5_v8__0l;
  v27[4] = v9;
  long long v10 = (void (**)(void))MEMORY[0x261227FC0](v27);
  [v4 setYuvRectified:v9];
  yuvHighRes = self->_yuvHighRes;
  if (yuvHighRes)
  {
    int32x2_t v13 = [(IOSurface *)yuvHighRes vg_copy];
    [v4 setYuvHighRes:v13];

    int8x8_t v14 = [(IOSurface *)self->_yuvHighResUndistortionLut vg_copy];
    [v4 setYuvHighResUndistortionLut:v14];
  }
  CVPixelBufferRef v15 = vg::createIOSurfaceBackedPixelBufferCopy(self->_mcamLeftColorYuv, v11);
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __30__VGCaptureData_copyWithZone___block_invoke_3;
  v26[3] = &__block_descriptor_40_e5_v8__0l;
  v26[4] = v15;
  int32x4_t v16 = (void (**)(void))MEMORY[0x261227FC0](v26);
  [v4 setMcamLeftColorYuv:v15];
  [v4 setMcamLeftColorRGB:self->_mcamLeftColorRGB];
  CVPixelBufferRef v18 = vg::createIOSurfaceBackedPixelBufferCopy(self->_mcamLeftDepth, v17);
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __30__VGCaptureData_copyWithZone___block_invoke_4;
  v25[3] = &__block_descriptor_40_e5_v8__0l;
  v25[4] = v18;
  uint64_t v19 = (void (**)(void))MEMORY[0x261227FC0](v25);
  [v4 setMcamLeftDepth:v18];
  mcamLeftYuvHighRes = self->_mcamLeftYuvHighRes;
  if (mcamLeftYuvHighRes)
  {
    uint64_t v21 = [(IOSurface *)mcamLeftYuvHighRes vg_copy];
    [v4 setMcamLeftYuvHighRes:v21];

    uint64_t v22 = [(IOSurface *)self->_mcamLeftYuvHighResUndistortionLut vg_copy];
    [v4 setMcamLeftYuvHighResUndistortionLut:v22];
  }
  objc_msgSend(v4, "setMcamLeftColorIntrinsics:", *(double *)self->_anon_160, *(double *)&self->_anon_160[16], *(double *)&self->_anon_160[32]);
  objc_msgSend(v4, "setMcamLeftDepthIntrinsics:", *(double *)self->_anon_190, *(double *)&self->_anon_190[16], *(double *)&self->_anon_190[32]);
  objc_msgSend(v4, "setMcamLeftChromaticAdaptationMatrix:", *(double *)self->_anon_1c0, *(double *)&self->_anon_1c0[16], *(double *)&self->_anon_1c0[32]);
  objc_msgSend(v4, "setMcamLeftToDeviceTransform:", *(double *)&self[1].super.isa, *(double *)&self[1]._rgbRectified, *(double *)&self[1]._mcamLeftColorYuvChromaticAdaptationReverted, *(double *)&self[1]._yuvHighResChromaticAdaptationReverted);
  [v4 setEnrollmentPhase:self->_enrollmentPhase];
  id v23 = v4;
  v19[2](v19);

  v16[2](v16);
  v10[2](v10);

  v7[2](v7);
  return v23;
}

void __30__VGCaptureData_copyWithZone___block_invoke(uint64_t a1)
{
}

void __30__VGCaptureData_copyWithZone___block_invoke_2(uint64_t a1)
{
}

void __30__VGCaptureData_copyWithZone___block_invoke_3(uint64_t a1)
{
}

void __30__VGCaptureData_copyWithZone___block_invoke_4(uint64_t a1)
{
}

- (void)saveAtPath:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v5 = (void *)[objc_alloc(NSURL) initFileURLWithPath:v4 isDirectory:0];
  long long v6 = [MEMORY[0x263F00650] imageWithCVPixelBuffer:self->_yuvRectified];
  id v7 = objc_alloc(MEMORY[0x263F00628]);
  long long v8 = (void *)[v7 initWithOptions:MEMORY[0x263EFFA78]];
  uint64_t v9 = [v6 colorSpace];
  uint64_t v10 = *MEMORY[0x263F008B0];
  id v14 = 0;
  [v8 writePNGRepresentationOfImage:v6 toURL:v5 format:v10 colorSpace:v9 options:MEMORY[0x263EFFA78] error:&v14];
  id v11 = v14;
  uint64_t v12 = __VGLogSharedInstance();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)vImage_YpCbCrToARGB buf = 138412290;
    id v16 = v5;
    _os_log_impl(&dword_260C8D000, v12, OS_LOG_TYPE_DEBUG, " VGCaptureData write at %@ ", buf, 0xCu);
  }

  if (v11)
  {
    int32x2_t v13 = __VGLogSharedInstance();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)vImage_YpCbCrToARGB buf = 138412290;
      id v16 = v11;
      _os_log_impl(&dword_260C8D000, v13, OS_LOG_TYPE_ERROR, " write error %@ ", buf, 0xCu);
    }
  }
}

- (IOSurface)yuvHighResChromaticAdaptationReverted
{
  uint64_t v3 = +[VGCaptureData computeYuvHighResChromaticAdaptationReverted:self->_yuvHighRes chromaticAdaptationMatrix:self->_anon_130];
  yuvHighResChromaticAdaptationReverted = self->_yuvHighResChromaticAdaptationReverted;
  self->_yuvHighResChromaticAdaptationReverted = v3;

  long long v5 = self->_yuvHighResChromaticAdaptationReverted;

  return v5;
}

- (IOSurface)mcamLeftYuvHighResChromaticAdaptationReverted
{
  mcamLeftYuvHighRes = self->_mcamLeftYuvHighRes;
  if (mcamLeftYuvHighRes)
  {
    id v4 = +[VGCaptureData computeYuvHighResChromaticAdaptationReverted:mcamLeftYuvHighRes chromaticAdaptationMatrix:self->_anon_1c0];
    mcamLeftYuvHighResChromaticAdaptationReverted = self->_mcamLeftYuvHighResChromaticAdaptationReverted;
    self->_mcamLeftYuvHighResChromaticAdaptationReverted = v4;

    long long v6 = self->_mcamLeftYuvHighResChromaticAdaptationReverted;
  }
  else
  {
    long long v6 = 0;
  }

  return v6;
}

- (VGFaceMetadata)mcamLeftFaceMetadata
{
  if ([(VGCaptureData *)self mcamLeftColorRGB])
  {
    CVPixelBufferGetIOSurface([(VGCaptureData *)self mcamLeftColorRGB]);
    uint64_t v3 = (vg::shared *)objc_claimAutoreleasedReturnValue();
    long long v5 = v3;
    if (v3)
    {
      long long v6 = vg::shared::VNGetLargestFaceObservation(v3, v4);
      id v7 = v6;
      if (v6)
      {
        [v6 boundingBox];
        double v9 = v8;
        [v7 boundingBox];
        double v11 = v10;
        [v7 boundingBox];
        double v13 = v12;
        [v7 boundingBox];
        double v15 = v14;
        [v7 boundingBox];
        double v17 = v16;
        CVPixelBufferRef v18 = [v7 yaw];
        [v18 doubleValue];
        double v20 = v19 * 57.2957795;

        if (v20 < 0.0) {
          double v20 = v20 + 360.0;
        }
        uint64_t v21 = [v7 roll];
        [v21 doubleValue];
        double v23 = v22 * -57.2957795;

        if (v23 >= 0.0) {
          double v24 = v23;
        }
        else {
          double v24 = v23 + 360.0;
        }
        id v25 = -[VGFaceMetadata initWithFaceId:bounds:yawAngle:rollAngle:]([VGFaceMetadata alloc], "initWithFaceId:bounds:yawAngle:rollAngle:", [v7 faceId], v9, 1.0 - (v11 + v13), v15, v17, round(v20), round(v24));
        mcamLeftFaceMetadata = self->_mcamLeftFaceMetadata;
        self->_mcamLeftFaceMetadata = v25;

        float32x4_t v27 = self->_mcamLeftFaceMetadata;
      }
      else
      {
        float32x4_t v27 = 0;
      }
    }
    else
    {
      float32x4_t v27 = 0;
    }
  }
  else
  {
    float32x4_t v27 = 0;
  }

  return v27;
}

- (void)setRgbRectified:(__CVBuffer *)a3
{
  rgbRectified = self->_rgbRectified;
  if (rgbRectified) {
    CVPixelBufferRelease(rgbRectified);
  }
  self->_rgbRectified = a3;
  if (a3)
  {
    CVPixelBufferRetain(a3);
  }
}

- (__CVBuffer)rgbRectified
{
  uint64_t v3 = VGLogVGCaptureData();
  if (os_signpost_enabled(v3))
  {
    *(_WORD *)long long v6 = 0;
    _os_signpost_emit_with_name_impl(&dword_260C8D000, v3, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "RgbRectified", (const char *)&unk_260D385D9, v6, 2u);
  }

  rgbRectified = self->_rgbRectified;
  if (!rgbRectified)
  {
    if (self->_yuvRectified)
    {
      rgbRectified = +[VGCaptureData _createColorFromYCbCr:](VGCaptureData, "_createColorFromYCbCr:");
      self->_rgbRectified = rgbRectified;
    }
    else
    {
      rgbRectified = 0;
    }
  }
  __29__VGCaptureData_rgbRectified__block_invoke();
  return rgbRectified;
}

void __29__VGCaptureData_rgbRectified__block_invoke()
{
  v0 = VGLogVGCaptureData();
  if (os_signpost_enabled(v0))
  {
    *(_WORD *)v1 = 0;
    _os_signpost_emit_with_name_impl(&dword_260C8D000, v0, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "RgbRectified", (const char *)&unk_260D385D9, v1, 2u);
  }
}

- (void)setYuvRectified:(__CVBuffer *)a3
{
  yuvRectified = self->_yuvRectified;
  if (yuvRectified) {
    CVPixelBufferRelease(yuvRectified);
  }
  self->_yuvRectified = a3;
  if (a3)
  {
    CVPixelBufferRetain(a3);
  }
}

- (void)setDepth:(__CVBuffer *)a3
{
  depth = self->_depth;
  if (depth) {
    CVPixelBufferRelease(depth);
  }
  self->_depth = a3;
  if (a3)
  {
    CVPixelBufferRetain(a3);
  }
}

- (void)setMcamLeftColorRGB:(__CVBuffer *)a3
{
  mcamLeftColorRGB = self->_mcamLeftColorRGB;
  if (mcamLeftColorRGB) {
    CVPixelBufferRelease(mcamLeftColorRGB);
  }
  self->_mcamLeftColorRGB = a3;
  if (a3)
  {
    CVPixelBufferRetain(a3);
  }
}

- (__CVBuffer)mcamLeftColorRGB
{
  uint64_t v3 = VGLogVGCaptureData();
  if (os_signpost_enabled(v3))
  {
    *(_WORD *)long long v6 = 0;
    _os_signpost_emit_with_name_impl(&dword_260C8D000, v3, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "mcamLeftColorRGB", (const char *)&unk_260D385D9, v6, 2u);
  }

  mcamLeftColorRGB = self->_mcamLeftColorRGB;
  if (!mcamLeftColorRGB)
  {
    if (self->_mcamLeftColorYuv)
    {
      mcamLeftColorRGB = +[VGCaptureData _createColorFromYCbCr:](VGCaptureData, "_createColorFromYCbCr:");
      self->_mcamLeftColorRGB = mcamLeftColorRGB;
    }
    else
    {
      mcamLeftColorRGB = 0;
    }
  }
  __33__VGCaptureData_mcamLeftColorRGB__block_invoke();
  return mcamLeftColorRGB;
}

void __33__VGCaptureData_mcamLeftColorRGB__block_invoke()
{
  v0 = VGLogVGCaptureData();
  if (os_signpost_enabled(v0))
  {
    *(_WORD *)v1 = 0;
    _os_signpost_emit_with_name_impl(&dword_260C8D000, v0, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "mcamLeftColorRGB", (const char *)&unk_260D385D9, v1, 2u);
  }
}

- (void)setMcamLeftColorYuv:(__CVBuffer *)a3
{
  mcamLeftColorYuv = self->_mcamLeftColorYuv;
  if (mcamLeftColorYuv) {
    CVPixelBufferRelease(mcamLeftColorYuv);
  }
  self->_mcamLeftColorYuv = a3;
  if (a3)
  {
    CVPixelBufferRetain(a3);
  }
}

- (__CVBuffer)mcamLeftColorYuvChromaticAdaptationReverted
{
  uint64_t v3 = VGLogVGCaptureData();
  if (os_signpost_enabled(v3))
  {
    *(_WORD *)double v9 = 0;
    _os_signpost_emit_with_name_impl(&dword_260C8D000, v3, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "mcamLeftColorYuvChromaticAdaptationReverted", (const char *)&unk_260D385D9, v9, 2u);
  }

  mcamLeftColorYuvChromaticAdaptationReverted = self->_mcamLeftColorYuvChromaticAdaptationReverted;
  if (!mcamLeftColorYuvChromaticAdaptationReverted)
  {
    mcamLeftColorYuv = self->_mcamLeftColorYuv;
    if (mcamLeftColorYuv)
    {
      long long v6 = IOSurfaceFromCVPixelBuffer(mcamLeftColorYuv);
      id v7 = +[VGCaptureData computeYuvHighResChromaticAdaptationReverted:v6 chromaticAdaptationMatrix:self->_anon_1c0];

      mcamLeftColorYuvChromaticAdaptationReverted = createCVPixelBufferFromIOSurface(v7);
      self->_mcamLeftColorYuvChromaticAdaptationReverted = mcamLeftColorYuvChromaticAdaptationReverted;
    }
    else
    {
      mcamLeftColorYuvChromaticAdaptationReverted = 0;
    }
  }
  __60__VGCaptureData_mcamLeftColorYuvChromaticAdaptationReverted__block_invoke();
  return mcamLeftColorYuvChromaticAdaptationReverted;
}

void __60__VGCaptureData_mcamLeftColorYuvChromaticAdaptationReverted__block_invoke()
{
  v0 = VGLogVGCaptureData();
  if (os_signpost_enabled(v0))
  {
    *(_WORD *)v1 = 0;
    _os_signpost_emit_with_name_impl(&dword_260C8D000, v0, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "mcamLeftColorYuvChromaticAdaptationReverted", (const char *)&unk_260D385D9, v1, 2u);
  }
}

- (__CVBuffer)mcamLeftColorRGBChromaticAdaptationReverted
{
  uint64_t v3 = VGLogVGCaptureData();
  if (os_signpost_enabled(v3))
  {
    *(_WORD *)id v7 = 0;
    _os_signpost_emit_with_name_impl(&dword_260C8D000, v3, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "mcamLeftColorRGBChromaticAdaptationReverted", (const char *)&unk_260D385D9, v7, 2u);
  }

  mcamLeftColorRGBChromaticAdaptationReverted = self->_mcamLeftColorRGBChromaticAdaptationReverted;
  if (!mcamLeftColorRGBChromaticAdaptationReverted)
  {
    if ([(VGCaptureData *)self mcamLeftColorYuvChromaticAdaptationReverted])
    {
      mcamLeftColorRGBChromaticAdaptationReverted = vg::createARGBFromYCbCr(self->_mcamLeftColorYuvChromaticAdaptationReverted, v5);
      self->_mcamLeftColorRGBChromaticAdaptationReverted = mcamLeftColorRGBChromaticAdaptationReverted;
    }
    else
    {
      mcamLeftColorRGBChromaticAdaptationReverted = 0;
    }
  }
  __60__VGCaptureData_mcamLeftColorRGBChromaticAdaptationReverted__block_invoke();
  return mcamLeftColorRGBChromaticAdaptationReverted;
}

void __60__VGCaptureData_mcamLeftColorRGBChromaticAdaptationReverted__block_invoke()
{
  v0 = VGLogVGCaptureData();
  if (os_signpost_enabled(v0))
  {
    *(_WORD *)v1 = 0;
    _os_signpost_emit_with_name_impl(&dword_260C8D000, v0, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "mcamLeftColorRGBChromaticAdaptationReverted", (const char *)&unk_260D385D9, v1, 2u);
  }
}

- (void)setMcamLeftDepth:(__CVBuffer *)a3
{
  mcamLeftDepth = self->_mcamLeftDepth;
  if (mcamLeftDepth) {
    CVPixelBufferRelease(mcamLeftDepth);
  }
  self->_mcamLeftDepth = a3;
  if (a3)
  {
    CVPixelBufferRetain(a3);
  }
}

- (void)dealloc
{
  depth = self->_depth;
  if (depth) {
    CVPixelBufferRelease(depth);
  }
  yuvRectified = self->_yuvRectified;
  if (yuvRectified) {
    CVPixelBufferRelease(yuvRectified);
  }
  rgbRectified = self->_rgbRectified;
  if (rgbRectified) {
    CVPixelBufferRelease(rgbRectified);
  }
  mcamLeftColorYuv = self->_mcamLeftColorYuv;
  if (mcamLeftColorYuv) {
    CVPixelBufferRelease(mcamLeftColorYuv);
  }
  mcamLeftColorRGB = self->_mcamLeftColorRGB;
  if (mcamLeftColorRGB) {
    CVPixelBufferRelease(mcamLeftColorRGB);
  }
  mcamLeftColorYuvChromaticAdaptationReverted = self->_mcamLeftColorYuvChromaticAdaptationReverted;
  if (mcamLeftColorYuvChromaticAdaptationReverted) {
    CVPixelBufferRelease(mcamLeftColorYuvChromaticAdaptationReverted);
  }
  mcamLeftColorRGBChromaticAdaptationReverted = self->_mcamLeftColorRGBChromaticAdaptationReverted;
  if (mcamLeftColorRGBChromaticAdaptationReverted) {
    CVPixelBufferRelease(mcamLeftColorRGBChromaticAdaptationReverted);
  }
  mcamLeftDepth = self->_mcamLeftDepth;
  if (mcamLeftDepth) {
    CVPixelBufferRelease(mcamLeftDepth);
  }
  v11.receiver = self;
  v11.super_class = (Class)VGCaptureData;
  [(VGCaptureData *)&v11 dealloc];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v16 = a3;
  +[VGCoderUtilities encodePixelBuffer:forKey:encoder:](VGCoderUtilities, "encodePixelBuffer:forKey:encoder:", self->_yuvRectified, @"yuvRectified");
  +[VGCoderUtilities encodePixelBuffer:self->_depth forKey:@"depth" encoder:v16];
  [v16 encodeBool:self->_mirrored forKey:@"mirrored"];
  objc_msgSend(v16, "vg_encodeSurface:forKey:", self->_yuvHighRes, @"yuvHighRes");
  objc_msgSend(v16, "vg_encodeSurface:forKey:", self->_yuvHighResUndistortionLut, @"yuvHighResUndistortionLut");
  id v4 = +[VGCaptureData _matrix33ToData:](VGCaptureData, "_matrix33ToData:", *(double *)self->_anon_d0, *(double *)&self->_anon_d0[16], *(double *)&self->_anon_d0[32]);
  [v16 encodeObject:v4 forKey:@"videoIntrinsics"];

  long long v5 = +[VGCaptureData _matrix33ToData:](VGCaptureData, "_matrix33ToData:", *(double *)self->_anon_100, *(double *)&self->_anon_100[16], *(double *)&self->_anon_100[32]);
  [v16 encodeObject:v5 forKey:@"depthIntrinsics"];

  long long v6 = +[VGCaptureData _matrix33ToData:](VGCaptureData, "_matrix33ToData:", *(double *)self->_anon_130, *(double *)&self->_anon_130[16], *(double *)&self->_anon_130[32]);
  [v16 encodeObject:v6 forKey:@"chromaticAdaptationMatrix"];

  [v16 encodeObject:self->_face forKey:@"face"];
  [v16 encodeObject:self->_allFaces forKey:@"allFaces"];
  [v16 encodeObject:self->_faceTrackingResult forKey:@"faceTrackingResult"];
  [v16 encodeObject:self->_skeleton forKey:@"skeleton"];
  id v7 = +[VGCaptureData _matrix44ToData:](VGCaptureData, "_matrix44ToData:", *(double *)self->_anon_1f0, *(double *)&self->_anon_1f0[16], *(double *)&self->_anon_1f0[32], *(double *)&self->_anon_1f0[48]);
  [v16 encodeObject:v7 forKey:@"cameraToDeviceTransform"];

  [v16 encodeInt64:self->_timestamp.value forKey:@"timestampValue"];
  [v16 encodeInt64:self->_timestamp.epoch forKey:@"timestampEpoch"];
  [v16 encodeInt32:self->_timestamp.timescale forKey:@"timestampTimeScale"];
  [v16 encodeInt64:self->_timestamp.flags forKey:@"timestampFlags"];
  mcamLeftColorYuv = self->_mcamLeftColorYuv;
  if (mcamLeftColorYuv) {
    +[VGCoderUtilities encodePixelBuffer:mcamLeftColorYuv forKey:@"mcamLeftColorYuv" encoder:v16];
  }
  mcamLeftDepth = self->_mcamLeftDepth;
  if (mcamLeftDepth) {
    +[VGCoderUtilities encodePixelBuffer:mcamLeftDepth forKey:@"mcamLeftDepth" encoder:v16];
  }
  mcamLeftYuvHighRes = self->_mcamLeftYuvHighRes;
  if (mcamLeftYuvHighRes) {
    objc_msgSend(v16, "vg_encodeSurface:forKey:", mcamLeftYuvHighRes, @"mcamLeftYuvHighRes");
  }
  mcamLeftYuvHighResUndistortionLut = self->_mcamLeftYuvHighResUndistortionLut;
  if (mcamLeftYuvHighResUndistortionLut) {
    objc_msgSend(v16, "vg_encodeSurface:forKey:", mcamLeftYuvHighResUndistortionLut, @"mcamLeftYuvHighResUndistortionLut");
  }
  double v12 = +[VGCaptureData _matrix33ToData:](VGCaptureData, "_matrix33ToData:", *(double *)self->_anon_160, *(double *)&self->_anon_160[16], *(double *)&self->_anon_160[32]);
  [v16 encodeObject:v12 forKey:@"mcamLeftColorIntrinsics"];

  double v13 = +[VGCaptureData _matrix33ToData:](VGCaptureData, "_matrix33ToData:", *(double *)self->_anon_190, *(double *)&self->_anon_190[16], *(double *)&self->_anon_190[32]);
  [v16 encodeObject:v13 forKey:@"mcamLeftDepthIntrinsics"];

  double v14 = +[VGCaptureData _matrix33ToData:](VGCaptureData, "_matrix33ToData:", *(double *)self->_anon_1c0, *(double *)&self->_anon_1c0[16], *(double *)&self->_anon_1c0[32]);
  [v16 encodeObject:v14 forKey:@"mcamLeftChromaticAdaptationMatrix"];

  double v15 = +[VGCaptureData _matrix44ToData:](VGCaptureData, "_matrix44ToData:", *(double *)&self[1].super.isa, *(double *)&self[1]._rgbRectified, *(double *)&self[1]._mcamLeftColorYuvChromaticAdaptationReverted, *(double *)&self[1]._yuvHighResChromaticAdaptationReverted);
  [v16 encodeObject:v15 forKey:@"mcamLeftToDeviceTransform"];

  [v16 encodeInteger:self->_enrollmentPhase forKey:@"enrollmentPhase"];
}

- (VGCaptureData)initWithCoder:(id)a3
{
  v109[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v107.receiver = self;
  v107.super_class = (Class)VGCaptureData;
  long long v5 = [(VGCaptureData *)&v107 init];
  if (v5)
  {
    v5->_yuvRectified = +[VGCoderUtilities decodePixelBufferForKey:@"yuvRectified" decoder:v4];
    v5->_depth = +[VGCoderUtilities decodePixelBufferForKey:@"depth" decoder:v4];
    v5->_mirrored = [v4 decodeBoolForKey:@"mirrored"];
    uint64_t v6 = objc_msgSend(v4, "vg_decodeSurfaceForKey:", @"yuvHighRes");
    yuvHighRes = v5->_yuvHighRes;
    v5->_yuvHighRes = (IOSurface *)v6;

    uint64_t v8 = objc_msgSend(v4, "vg_decodeSurfaceForKey:", @"yuvHighResUndistortionLut");
    yuvHighResUndistortionLut = v5->_yuvHighResUndistortionLut;
    v5->_yuvHighResUndistortionLut = (IOSurface *)v8;

    double v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"videoIntrinsics"];
    objc_super v11 = v10;
    if (!v10 || (unint64_t)[v10 length] <= 0x23)
    {
      double v12 = __VGLogSharedInstance();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)vImage_YpCbCrToARGB buf = 0;
        _os_log_impl(&dword_260C8D000, v12, OS_LOG_TYPE_ERROR, " Unable to deserialize videoIntrinsics ", buf, 2u);
      }
      double v13 = 0;
      goto LABEL_81;
    }
    +[VGCaptureData _dataToMatrix33:v11];
    *(_DWORD *)&v5->_anon_d0[8] = v14;
    *(void *)v5->_anon_d0 = v15;
    *(_DWORD *)&v5->_anon_d0[24] = v16;
    *(void *)&v5->_anon_d0[16] = v17;
    *(_DWORD *)&v5->_anon_d0[40] = v18;
    *(void *)&v5->_anon_d0[32] = v19;
    double v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"videoIntrinsics"];
    double v12 = v20;
    if (!v20 || (unint64_t)[v20 length] <= 0x23)
    {
      uint64_t v21 = __VGLogSharedInstance();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)vImage_YpCbCrToARGB buf = 0;
        _os_log_impl(&dword_260C8D000, v21, OS_LOG_TYPE_ERROR, " Unable to deserialize depthIntrinsics ", buf, 2u);
      }
      double v13 = 0;
      goto LABEL_80;
    }
    +[VGCaptureData _dataToMatrix33:v12];
    *(_DWORD *)&v5->_anon_100[8] = v22;
    *(void *)v5->_anon_100 = v23;
    *(_DWORD *)&v5->_anon_100[24] = v24;
    *(void *)&v5->_anon_100[16] = v25;
    *(_DWORD *)&v5->_anon_100[40] = v26;
    *(void *)&v5->_anon_100[32] = v27;
    v105 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"chromaticAdaptationMatrix"];
    if (v105 && (unint64_t)[v105 length] >= 0x24)
    {
      +[VGCaptureData _dataToMatrix33:v105];
      *(_DWORD *)&v5->_anon_130[8] = v28;
      *(_DWORD *)&v5->_anon_130[24] = v29;
      *(void *)v5->_anon_130 = v30;
      *(void *)&v5->_anon_130[16] = v31;
      *(_DWORD *)&v5->_anon_130[40] = v32;
      *(void *)&v5->_anon_130[32] = v33;
    }
    else
    {
      uint64_t v34 = MEMORY[0x263EF89A0];
      long long v35 = *(_OWORD *)(MEMORY[0x263EF89A0] + 16);
      *(_OWORD *)v5->_anon_130 = *MEMORY[0x263EF89A0];
      *(_OWORD *)&v5->_anon_130[16] = v35;
      *(_OWORD *)&v5->_anon_130[32] = *(_OWORD *)(v34 + 32);
    }
    uint64_t v36 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"face"];
    face = v5->_face;
    v5->_face = (VGFaceMetadata *)v36;

    if ([v4 containsValueForKey:@"allFaces"])
    {
      long long v38 = (void *)MEMORY[0x263EFFA08];
      v109[0] = objc_opt_class();
      v109[1] = objc_opt_class();
      v39 = [MEMORY[0x263EFF8C0] arrayWithObjects:v109 count:2];
      v40 = [v38 setWithArray:v39];
      uint64_t v41 = [v4 decodeObjectOfClasses:v40 forKey:@"allFaces"];
      allFaces = v5->_allFaces;
      v5->_allFaces = (NSArray *)v41;
    }
    simd_float3x3 v43 = (void *)MEMORY[0x263EFFA08];
    v108[0] = objc_opt_class();
    v108[1] = objc_opt_class();
    v108[2] = objc_opt_class();
    v108[3] = objc_opt_class();
    v108[4] = objc_opt_class();
    v108[5] = objc_opt_class();
    v44 = [MEMORY[0x263EFF8C0] arrayWithObjects:v108 count:6];
    v45 = [v43 setWithArray:v44];
    uint64_t v46 = [v4 decodeObjectOfClasses:v45 forKey:@"faceTrackingResult"];
    faceTrackingResult = v5->_faceTrackingResult;
    v5->_faceTrackingResult = (NSDictionary *)v46;

    uint64_t v48 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"skeleton"];
    skeleton = v5->_skeleton;
    v5->_skeleton = (VGSkeleton *)v48;

    v50 = (_OWORD *)MEMORY[0x263EF89A8];
    long long v51 = *(_OWORD *)(MEMORY[0x263EF89A8] + 16);
    *(_OWORD *)v5->_anon_1f0 = *MEMORY[0x263EF89A8];
    *(_OWORD *)&v5->_anon_1f0[16] = v51;
    long long v52 = v50[3];
    *(_OWORD *)&v5->_anon_1f0[32] = v50[2];
    *(_OWORD *)&v5->_anon_1f0[48] = v52;
    if ([v4 containsValueForKey:@"cameraToDeviceTransform"])
    {
      v53 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cameraToDeviceTransform"];
      v54 = v53;
      if (!v53 || (unint64_t)[v53 length] <= 0x3F)
      {
        v55 = __VGLogSharedInstance();
        if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)vImage_YpCbCrToARGB buf = 0;
          _os_log_impl(&dword_260C8D000, v55, OS_LOG_TYPE_ERROR, " Unable to deserialize cameraToDeviceTransform ", buf, 2u);
        }
LABEL_78:

        double v13 = 0;
LABEL_79:
        uint64_t v21 = v105;
LABEL_80:

LABEL_81:
        goto LABEL_82;
      }
      +[VGCaptureData _dataToMatrix44:v54];
      *(_OWORD *)v5->_anon_1f0 = v56;
      *(_OWORD *)&v5->_anon_1f0[16] = v57;
      *(_OWORD *)&v5->_anon_1f0[32] = v58;
      *(_OWORD *)&v5->_anon_1f0[48] = v59;
    }
    else
    {
      v54 = __VGLogSharedInstance();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)vImage_YpCbCrToARGB buf = 0;
        _os_log_impl(&dword_260C8D000, v54, OS_LOG_TYPE_INFO, " VGCaptureData doesn't have cameraToDeviceTransform. Set to identity. ", buf, 2u);
      }
    }

    v5->_timestamp.value = [v4 decodeInt64ForKey:@"timestampValue"];
    v5->_timestamp.epoch = [v4 decodeInt64ForKey:@"timestampEpoch"];
    v5->_timestamp.timescale = [v4 decodeInt32ForKey:@"timestampTimeScale"];
    v5->_timestamp.flags = [v4 decodeInt64ForKey:@"timestampFlags"];
    if (+[VGCoderUtilities hasPixelBufferForKey:@"mcamLeftColorYuv" decoder:v4])
    {
      v5->_mcamLeftColorYuv = +[VGCoderUtilities decodePixelBufferForKey:@"mcamLeftColorYuv" decoder:v4];
    }
    else
    {
      v60 = __VGLogSharedInstance();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)vImage_YpCbCrToARGB buf = 0;
        _os_log_impl(&dword_260C8D000, v60, OS_LOG_TYPE_INFO, " VGCaptureData doesn't have mcamLeftColorYuv. Set to nil. ", buf, 2u);
      }
    }
    if (+[VGCoderUtilities hasPixelBufferForKey:@"mcamLeftDepth", v4, v5->_anon_100 decoder])
    {
      v5->_mcamLeftDepth = +[VGCoderUtilities decodePixelBufferForKey:@"mcamLeftDepth" decoder:v4];
    }
    else
    {
      v61 = __VGLogSharedInstance();
      if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)vImage_YpCbCrToARGB buf = 0;
        _os_log_impl(&dword_260C8D000, v61, OS_LOG_TYPE_INFO, " VGCaptureData doesn't have mcamLeftDepth. Set to nil. ", buf, 2u);
      }
    }
    uint64_t v62 = objc_msgSend(v4, "vg_decodeSurfaceForKey:", @"mcamLeftYuvHighRes");
    mcamLeftYuvHighRes = v5->_mcamLeftYuvHighRes;
    v5->_mcamLeftYuvHighRes = (IOSurface *)v62;

    if (!v5->_mcamLeftYuvHighRes)
    {
      v64 = __VGLogSharedInstance();
      if (os_log_type_enabled(v64, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)vImage_YpCbCrToARGB buf = 0;
        _os_log_impl(&dword_260C8D000, v64, OS_LOG_TYPE_INFO, " VGCaptureData doesn't have mcamLeftYuvHighRes. Set to nil. ", buf, 2u);
      }
    }
    uint64_t v65 = objc_msgSend(v4, "vg_decodeSurfaceForKey:", @"mcamLeftYuvHighResUndistortionLut");
    mcamLeftYuvHighResUndistortionLut = v5->_mcamLeftYuvHighResUndistortionLut;
    v5->_mcamLeftYuvHighResUndistortionLut = (IOSurface *)v65;

    if (!v5->_mcamLeftYuvHighResUndistortionLut)
    {
      v67 = __VGLogSharedInstance();
      if (os_log_type_enabled(v67, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)vImage_YpCbCrToARGB buf = 0;
        _os_log_impl(&dword_260C8D000, v67, OS_LOG_TYPE_INFO, " VGCaptureData doesn't have mcamLeftYuvHighResUndistortionLut. Set to nil. ", buf, 2u);
      }
    }
    if ([v4 containsValueForKey:@"mcamLeftColorIntrinsics"])
    {
      v68 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mcamLeftColorIntrinsics"];
      v54 = v68;
      if (!v68 || (unint64_t)[v68 length] <= 0x23)
      {
        v55 = __VGLogSharedInstance();
        if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)vImage_YpCbCrToARGB buf = 0;
          _os_log_impl(&dword_260C8D000, v55, OS_LOG_TYPE_ERROR, " Unable to deserialize mcamLeftColorIntrinsics ", buf, 2u);
        }
        goto LABEL_78;
      }
      +[VGCaptureData _dataToMatrix33:v54];
      *(_DWORD *)(v104 + 104) = v71;
      *(_DWORD *)(v104 + 120) = v72;
      *(void *)(v104 + 96) = v73;
      *(void *)(v104 + 112) = v74;
      *(_DWORD *)(v104 + 136) = v75;
      *(void *)(v104 + 128) = v76;
    }
    else
    {
      uint64_t v69 = MEMORY[0x263EF89A0];
      long long v70 = *(_OWORD *)(MEMORY[0x263EF89A0] + 16);
      *(_OWORD *)v5->_anon_160 = *MEMORY[0x263EF89A0];
      *(_OWORD *)&v5->_anon_160[16] = v70;
      *(_OWORD *)&v5->_anon_160[32] = *(_OWORD *)(v69 + 32);
      v54 = __VGLogSharedInstance();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)vImage_YpCbCrToARGB buf = 0;
        _os_log_impl(&dword_260C8D000, v54, OS_LOG_TYPE_INFO, " VGCaptureData doesn't have mcamLeftColorIntrinsics. Set to identity. ", buf, 2u);
      }
    }

    if ([v4 containsValueForKey:@"mcamLeftDepthIntrinsics"])
    {
      v77 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mcamLeftDepthIntrinsics"];
      v54 = v77;
      if (!v77 || (unint64_t)[v77 length] <= 0x23)
      {
        v55 = __VGLogSharedInstance();
        if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)vImage_YpCbCrToARGB buf = 0;
          _os_log_impl(&dword_260C8D000, v55, OS_LOG_TYPE_ERROR, " Unable to deserialize mcamLeftDepthIntrinsics ", buf, 2u);
        }
        goto LABEL_78;
      }
      +[VGCaptureData _dataToMatrix33:v54];
      *(_DWORD *)(v104 + 152) = v80;
      *(_DWORD *)(v104 + 168) = v81;
      *(void *)(v104 + 144) = v82;
      *(void *)(v104 + 160) = v83;
      *(_DWORD *)(v104 + 184) = v84;
      *(void *)(v104 + 176) = v85;
    }
    else
    {
      uint64_t v78 = MEMORY[0x263EF89A0];
      long long v79 = *(_OWORD *)(MEMORY[0x263EF89A0] + 16);
      *(_OWORD *)v5->_anon_190 = *MEMORY[0x263EF89A0];
      *(_OWORD *)&v5->_anon_190[16] = v79;
      *(_OWORD *)&v5->_anon_190[32] = *(_OWORD *)(v78 + 32);
      v54 = __VGLogSharedInstance();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)vImage_YpCbCrToARGB buf = 0;
        _os_log_impl(&dword_260C8D000, v54, OS_LOG_TYPE_INFO, " VGCaptureData doesn't have mcamLeftDepthIntrinsics. Set to identity. ", buf, 2u);
      }
    }

    if ([v4 containsValueForKey:@"mcamLeftChromaticAdaptationMatrix"])
    {
      v86 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mcamLeftChromaticAdaptationMatrix"];
      v54 = v86;
      if (!v86 || (unint64_t)[v86 length] <= 0x23)
      {
        v55 = __VGLogSharedInstance();
        if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)vImage_YpCbCrToARGB buf = 0;
          _os_log_impl(&dword_260C8D000, v55, OS_LOG_TYPE_ERROR, " Unable to deserialize mcamLeftChromaticAdaptationMatrix ", buf, 2u);
        }
        goto LABEL_78;
      }
      +[VGCaptureData _dataToMatrix33:v54];
      *(_DWORD *)(v104 + 200) = v89;
      *(_DWORD *)(v104 + 216) = v90;
      *(void *)(v104 + 192) = v91;
      *(void *)(v104 + 208) = v92;
      *(_DWORD *)(v104 + 232) = v93;
      *(void *)(v104 + 224) = v94;
    }
    else
    {
      uint64_t v87 = MEMORY[0x263EF89A0];
      long long v88 = *(_OWORD *)(MEMORY[0x263EF89A0] + 16);
      *(_OWORD *)v5->_anon_1c0 = *MEMORY[0x263EF89A0];
      *(_OWORD *)&v5->_anon_1c0[16] = v88;
      *(_OWORD *)&v5->_anon_1c0[32] = *(_OWORD *)(v87 + 32);
      v54 = __VGLogSharedInstance();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)vImage_YpCbCrToARGB buf = 0;
        _os_log_impl(&dword_260C8D000, v54, OS_LOG_TYPE_INFO, " VGCaptureData doesn't have mcamLeftChromaticAdaptationMatrix. Set to identity. ", buf, 2u);
      }
    }

    long long v95 = v50[1];
    *(_OWORD *)&v5[1].super.isa = *v50;
    *(_OWORD *)&v5[1]._rgbRectified = v95;
    long long v96 = v50[3];
    *(_OWORD *)&v5[1]._mcamLeftColorYuvChromaticAdaptationReverted = v50[2];
    *(_OWORD *)&v5[1]._yuvHighResChromaticAdaptationReverted = v96;
    if ([v4 containsValueForKey:@"mcamLeftToDeviceTransform"])
    {
      v97 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mcamLeftToDeviceTransform"];
      v54 = v97;
      if (!v97 || (unint64_t)[v97 length] <= 0x3F)
      {
        v55 = __VGLogSharedInstance();
        if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)vImage_YpCbCrToARGB buf = 0;
          _os_log_impl(&dword_260C8D000, v55, OS_LOG_TYPE_ERROR, " Unable to deserialize mcamLeftToDeviceTransform ", buf, 2u);
        }
        goto LABEL_78;
      }
      +[VGCaptureData _dataToMatrix44:v54];
      *(_OWORD *)&v5[1].super.isa = v99;
      *(_OWORD *)&v5[1]._rgbRectified = v100;
      *(_OWORD *)&v5[1]._mcamLeftColorYuvChromaticAdaptationReverted = v101;
      *(_OWORD *)&v5[1]._yuvHighResChromaticAdaptationReverted = v102;
    }
    else
    {
      v54 = __VGLogSharedInstance();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)vImage_YpCbCrToARGB buf = 0;
        _os_log_impl(&dword_260C8D000, v54, OS_LOG_TYPE_INFO, " VGCaptureData doesn't have mcamLeftToDeviceTransform. Set to identity. ", buf, 2u);
      }
    }

    v5->_enrollmentPhase = 0;
    if ([v4 containsValueForKey:@"enrollmentPhase"])
    {
      v5->_enrollmentPhase = [v4 decodeIntegerForKey:@"enrollmentPhase"];
    }
    else
    {
      v103 = __VGLogSharedInstance();
      if (os_log_type_enabled(v103, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)vImage_YpCbCrToARGB buf = 0;
        _os_log_impl(&dword_260C8D000, v103, OS_LOG_TYPE_INFO, " VGCaptureData doesn't have enrollmentPhase. Set to VGEnrollmentPhaseNone ", buf, 2u);
      }
    }
    double v13 = v5;
    goto LABEL_79;
  }
  double v13 = 0;
LABEL_82:

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v5 = (unsigned __int8 *)v4;
    if (!checkEqualPixelBuffers(self->_yuvRectified, *((__CVBuffer **)v5 + 9))) {
      goto LABEL_10;
    }
    if (!checkEqualPixelBuffers(self->_depth, *((__CVBuffer **)v5 + 10))) {
      goto LABEL_10;
    }
    if (self->_mirrored != v5[8]) {
      goto LABEL_10;
    }
    if (!checkEqualSurfaces(self->_yuvHighRes, *((IOSurface **)v5 + 11))) {
      goto LABEL_10;
    }
    if (!checkEqualSurfaces(self->_yuvHighResUndistortionLut, *((IOSurface **)v5 + 12))) {
      goto LABEL_10;
    }
    uint32x4_t v6 = (uint32x4_t)vandq_s8(vandq_s8((int8x16_t)vceqq_f32(*(float32x4_t *)&self->_anon_d0[16], *((float32x4_t *)v5 + 14)), (int8x16_t)vceqq_f32(*(float32x4_t *)self->_anon_d0, *((float32x4_t *)v5 + 13))), (int8x16_t)vceqq_f32(*(float32x4_t *)&self->_anon_d0[32], *((float32x4_t *)v5 + 15)));
    v6.i32[3] = v6.i32[2];
    if ((vminvq_u32(v6) & 0x80000000) == 0) {
      goto LABEL_10;
    }
    uint32x4_t v7 = (uint32x4_t)vandq_s8(vandq_s8((int8x16_t)vceqq_f32(*(float32x4_t *)&self->_anon_100[16], *((float32x4_t *)v5 + 17)), (int8x16_t)vceqq_f32(*(float32x4_t *)self->_anon_100, *((float32x4_t *)v5 + 16))), (int8x16_t)vceqq_f32(*(float32x4_t *)&self->_anon_100[32], *((float32x4_t *)v5 + 18)));
    v7.i32[3] = v7.i32[2];
    if ((vminvq_u32(v7) & 0x80000000) == 0) {
      goto LABEL_10;
    }
    uint32x4_t v8 = (uint32x4_t)vandq_s8(vandq_s8((int8x16_t)vceqq_f32(*(float32x4_t *)&self->_anon_130[16], *((float32x4_t *)v5 + 20)), (int8x16_t)vceqq_f32(*(float32x4_t *)self->_anon_130, *((float32x4_t *)v5 + 19))), (int8x16_t)vceqq_f32(*(float32x4_t *)&self->_anon_130[32], *((float32x4_t *)v5 + 21)));
    v8.i32[3] = v8.i32[2];
    if ((vminvq_u32(v8) & 0x80000000) == 0) {
      goto LABEL_10;
    }
    face = self->_face;
    if ((unint64_t)face | *((void *)v5 + 13))
    {
      if (!-[VGFaceMetadata isEqual:](face, "isEqual:")) {
        goto LABEL_10;
      }
    }
    allFaces = self->_allFaces;
    if ((unint64_t)allFaces | *((void *)v5 + 14) && !-[NSArray isEqualToArray:](allFaces, "isEqualToArray:")) {
      goto LABEL_10;
    }
    skeleton = self->_skeleton;
    if ((unint64_t)skeleton | *((void *)v5 + 16) && !-[VGSkeleton isEqual:](skeleton, "isEqual:")) {
      goto LABEL_10;
    }
    if ((vminvq_u32((uint32x4_t)vandq_s8(vandq_s8((int8x16_t)vceqq_f32(*(float32x4_t *)&self->_anon_1f0[16], *((float32x4_t *)v5 + 32)), (int8x16_t)vceqq_f32(*(float32x4_t *)self->_anon_1f0, *((float32x4_t *)v5 + 31))), vandq_s8((int8x16_t)vceqq_f32(*(float32x4_t *)&self->_anon_1f0[32], *((float32x4_t *)v5 + 33)), (int8x16_t)vceqq_f32(*(float32x4_t *)&self->_anon_1f0[48], *((float32x4_t *)v5 + 34))))) & 0x80000000) == 0)goto LABEL_10; {
    CMTime time1 = (CMTime)self->_timestamp;
    }
    CMTime v17 = *(CMTime *)(v5 + 176);
    if (CMTimeCompare(&time1, &v17)) {
      goto LABEL_10;
    }
    if (checkEqualPixelBuffers(self->_mcamLeftColorYuv, *((__CVBuffer **)v5 + 17))
      && checkEqualPixelBuffers(self->_mcamLeftDepth, *((__CVBuffer **)v5 + 18))
      && checkEqualSurfaces(self->_mcamLeftYuvHighRes, *((IOSurface **)v5 + 19))
      && checkEqualSurfaces(self->_mcamLeftYuvHighResUndistortionLut, *((IOSurface **)v5 + 20))
      && (uint32x4_t v14 = (uint32x4_t)vandq_s8(vandq_s8((int8x16_t)vceqq_f32(*(float32x4_t *)&self->_anon_160[16], *((float32x4_t *)v5 + 23)), (int8x16_t)vceqq_f32(*(float32x4_t *)self->_anon_160, *((float32x4_t *)v5 + 22))), (int8x16_t)vceqq_f32(*(float32x4_t *)&self->_anon_160[32], *((float32x4_t *)v5 + 24))), v14.i32[3] = v14.i32[2], (vminvq_u32(v14) & 0x80000000) != 0)&& (v15 = (uint32x4_t)vandq_s8(vandq_s8((int8x16_t)vceqq_f32(*(float32x4_t *)&self->_anon_190[16], *((float32x4_t *)v5 + 26)), (int8x16_t)vceqq_f32(*(float32x4_t *)self->_anon_190, *((float32x4_t *)v5 + 25))), (int8x16_t)vceqq_f32(*(float32x4_t *)&self->_anon_190[32], *((float32x4_t *)v5 + 27))), v15.i32[3] = v15.i32[2], (vminvq_u32(v15) & 0x80000000) != 0)&& (v16 = (uint32x4_t)vandq_s8(vandq_s8((int8x16_t)vceqq_f32(*(float32x4_t *)&self->_anon_1c0[16], *((float32x4_t *)v5 + 29)), (int8x16_t)vceqq_f32(*(float32x4_t *)self->_anon_1c0, *((float32x4_t *)v5 + 28))), (int8x16_t)vceqq_f32(*(float32x4_t *)&self->_anon_1c0[32], *((float32x4_t *)v5 + 30))), v16.i32[3] = v16.i32[2],
          (vminvq_u32(v16) & 0x80000000) != 0)
      && (vminvq_u32((uint32x4_t)vandq_s8(vandq_s8((int8x16_t)vceqq_f32(*(float32x4_t *)&self[1]._rgbRectified, *((float32x4_t *)v5 + 36)), (int8x16_t)vceqq_f32(*(float32x4_t *)&self[1].super.isa, *((float32x4_t *)v5 + 35))), vandq_s8((int8x16_t)vceqq_f32(*(float32x4_t *)&self[1]._mcamLeftColorYuvChromaticAdaptationReverted, *((float32x4_t *)v5 + 37)), (int8x16_t)vceqq_f32(*(float32x4_t *)&self[1]._yuvHighResChromaticAdaptationReverted, *((float32x4_t *)v5 + 38))))) & 0x80000000) != 0)
    {
      BOOL v9 = self->_enrollmentPhase == *((void *)v5 + 21);
    }
    else
    {
LABEL_10:
      BOOL v9 = 0;
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (__CVBuffer)yuvRectified
{
  return self->_yuvRectified;
}

- (__CVBuffer)depth
{
  return self->_depth;
}

- (BOOL)mirrored
{
  return self->_mirrored;
}

- (void)setMirrored:(BOOL)a3
{
  self->_mirrored = a3;
}

- (IOSurface)yuvHighRes
{
  return self->_yuvHighRes;
}

- (void)setYuvHighRes:(id)a3
{
}

- (IOSurface)yuvHighResUndistortionLut
{
  return self->_yuvHighResUndistortionLut;
}

- (void)setYuvHighResUndistortionLut:(id)a3
{
}

- (__n128)videoIntrinsics
{
  return a1[13];
}

- (__n128)setVideoIntrinsics:(__n128)a3
{
  result[13] = a2;
  result[14] = a3;
  result[15] = a4;
  return result;
}

- (__n128)depthIntrinsics
{
  return a1[16];
}

- (__n128)setDepthIntrinsics:(__n128)a3
{
  result[16] = a2;
  result[17] = a3;
  result[18] = a4;
  return result;
}

- (__n128)chromaticAdaptationMatrix
{
  return a1[19];
}

- (__n128)setChromaticAdaptationMatrix:(__n128)a3
{
  result[19] = a2;
  result[20] = a3;
  result[21] = a4;
  return result;
}

- (VGFaceMetadata)face
{
  return self->_face;
}

- (void)setFace:(id)a3
{
}

- (NSArray)allFaces
{
  return self->_allFaces;
}

- (void)setAllFaces:(id)a3
{
}

- (NSDictionary)faceTrackingResult
{
  return self->_faceTrackingResult;
}

- (void)setFaceTrackingResult:(id)a3
{
}

- (VGSkeleton)skeleton
{
  return self->_skeleton;
}

- (void)setSkeleton:(id)a3
{
}

- (__n128)cameraToDeviceTransform
{
  return a1[31];
}

- (__n128)setCameraToDeviceTransform:(__n128)a3
{
  result[31] = a2;
  result[32] = a3;
  result[33] = a4;
  result[34] = a5;
  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timestamp
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 176);
  return self;
}

- (void)setTimestamp:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->_timestamp.epoch = a3->var3;
  *(_OWORD *)&self->_timestamp.value = v3;
}

- (__CVBuffer)mcamLeftColorYuv
{
  return self->_mcamLeftColorYuv;
}

- (__CVBuffer)mcamLeftDepth
{
  return self->_mcamLeftDepth;
}

- (IOSurface)mcamLeftYuvHighRes
{
  return self->_mcamLeftYuvHighRes;
}

- (void)setMcamLeftYuvHighRes:(id)a3
{
}

- (IOSurface)mcamLeftYuvHighResUndistortionLut
{
  return self->_mcamLeftYuvHighResUndistortionLut;
}

- (void)setMcamLeftYuvHighResUndistortionLut:(id)a3
{
}

- (__n128)mcamLeftColorIntrinsics
{
  return a1[22];
}

- (__n128)setMcamLeftColorIntrinsics:(__n128)a3
{
  result[22] = a2;
  result[23] = a3;
  result[24] = a4;
  return result;
}

- (__n128)mcamLeftDepthIntrinsics
{
  return a1[25];
}

- (__n128)setMcamLeftDepthIntrinsics:(__n128)a3
{
  result[25] = a2;
  result[26] = a3;
  result[27] = a4;
  return result;
}

- (__n128)mcamLeftChromaticAdaptationMatrix
{
  return a1[28];
}

- (__n128)setMcamLeftChromaticAdaptationMatrix:(__n128)a3
{
  result[28] = a2;
  result[29] = a3;
  result[30] = a4;
  return result;
}

- (__n128)mcamLeftToDeviceTransform
{
  return a1[35];
}

- (__n128)setMcamLeftToDeviceTransform:(__n128)a3
{
  result[35] = a2;
  result[36] = a3;
  result[37] = a4;
  result[38] = a5;
  return result;
}

- (unint64_t)enrollmentPhase
{
  return self->_enrollmentPhase;
}

- (void)setEnrollmentPhase:(unint64_t)a3
{
  self->_enrollmentPhase = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mcamLeftYuvHighResUndistortionLut, 0);
  objc_storeStrong((id *)&self->_mcamLeftYuvHighRes, 0);
  objc_storeStrong((id *)&self->_skeleton, 0);
  objc_storeStrong((id *)&self->_faceTrackingResult, 0);
  objc_storeStrong((id *)&self->_allFaces, 0);
  objc_storeStrong((id *)&self->_face, 0);
  objc_storeStrong((id *)&self->_yuvHighResUndistortionLut, 0);
  objc_storeStrong((id *)&self->_yuvHighRes, 0);
  objc_storeStrong((id *)&self->_mcamLeftFaceMetadata, 0);
  objc_storeStrong((id *)&self->_mcamLeftYuvHighResChromaticAdaptationReverted, 0);

  objc_storeStrong((id *)&self->_yuvHighResChromaticAdaptationReverted, 0);
}

@end