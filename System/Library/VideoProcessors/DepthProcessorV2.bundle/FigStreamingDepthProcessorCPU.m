@interface FigStreamingDepthProcessorCPU
+ (void)initialize;
- (BOOL)allocateResources;
- (BOOL)streamingGDRFilterEnabled;
- (BOOL)streamingSMPFilterEnabled;
- (FigStreamingDepthProcessorCPU)initWithParameters:(depthProcessorParameters *)a3 commandQueue:(id)a4;
- (NSDictionary)cameraInfoByPortType;
- (OS_dispatch_queue)workerQueue;
- (int)_convertInputShifts:(__CVBuffer *)a3 disparityOut:(float *)a4 resX:(int)a5 resY:(int)a6 extendedWidth:(int)a7 inputInvalidDisparityValue:(float)a8 outputDisparitySaturationValue:(float)a9;
- (int)_convertInputYUV:(__CVBuffer *)a3;
- (int)_copyToDepthImage:(__CVBuffer *)a3 disparityIn:(float *)a4 resX:(int)a5 resY:(int)a6 extendedWidth:(int)a7;
- (int)_performGDRFilterOnDisparity:(float *)a3 yuvBuffer:(__CVBuffer *)a4 disparityOut:(float *)a5;
- (int)_performSMPFilterOnDisparity:(float *)a3 depthBuffer:(__CVBuffer *)a4 inputInvalidDisparityValue:(float)a5 outputInvalidDisparityValue:(float)a6 disparityOut:(float *)a7;
- (int)_performSMPFilterOnDisparity:(float *)a3 inputInvalidDisparityValue:(float)a4 outputInvalidDisparityValue:(float)a5 disparityOut:(float *)a6;
- (int)processDepthBuffer:(__CVBuffer *)a3 yuvBuffer:(__CVBuffer *)a4 parametersDictionary:(id)a5 outputDisparityBuffer:(__CVBuffer *)a6;
- (int)processDepthBuffer:(__CVBuffer *)a3 yuvBuffer:(__CVBuffer *)a4 personSegmentationMaskBuffer:(__CVBuffer *)a5 instanceSegmentationMaskBufferArray:(id)a6 instanceSegmentationConfidences:(id)a7 parametersDictionary:(id)a8 outputDisparityBuffer:(__CVBuffer *)a9;
- (int)processDepthBuffer:(__CVBuffer *)a3 yuvBuffer:(__CVBuffer *)a4 rgbSegmentationMaskBuffer:(__CVBuffer *)a5 parametersDictionary:(id)a6 outputDisparityBuffer:(__CVBuffer *)a7;
- (void)_endSMPFilteringTrace;
- (void)_startSMPFilteringTrace;
- (void)dealloc;
- (void)releaseResources;
- (void)setCameraInfoByPortType:(id)a3;
- (void)setStreamingGDRFilterEnabled:(BOOL)a3;
- (void)setStreamingSMPFilterEnabled:(BOOL)a3;
- (void)setWorkerQueue:(id)a3;
@end

@implementation FigStreamingDepthProcessorCPU

+ (void)initialize
{
}

- (FigStreamingDepthProcessorCPU)initWithParameters:(depthProcessorParameters *)a3 commandQueue:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)FigStreamingDepthProcessorCPU;
  result = [(FigStreamingDepthProcessorCPU *)&v8 init];
  if (result)
  {
    *(_WORD *)&result->_resourcesAllocated = 0;
    result->_streamingGDRFilterEnabled = 1;
    int32x2_t v6 = vmovn_s64(*(int64x2_t *)&a3->var0);
    *(int32x2_t *)&result->_resX = v6;
    unint64_t v7 = a3->var2 >> 2;
    if (!v7) {
      LODWORD(v7) = v6.i32[0];
    }
    result->_extendedWidth = v7;
    result->_gdr = 0;
    result->_streamingSMPFilterEnabled = 1;
    result->_smpFilter = 0;
  }
  return result;
}

- (void)dealloc
{
  objc_msgSend_releaseResources(self, a2, v2, v3, v4, v5);
  v7.receiver = self;
  v7.super_class = (Class)FigStreamingDepthProcessorCPU;
  [(FigStreamingDepthProcessorCPU *)&v7 dealloc];
}

- (void)releaseResources
{
  gdr = self->_gdr;
  if (gdr)
  {
    uint64_t v4 = sub_262EAE390(gdr, a2);
    MEMORY[0x263E61D10](v4, 0x10A0C406C794524);
  }
  image = self->_image;
  if (image) {
    MEMORY[0x263E61CF0](image, 0x1000C8052888210);
  }
  disparity = self->_disparity;
  if (disparity) {
    MEMORY[0x263E61CF0](disparity, 0x1000C8052888210);
  }
  smpFilter = self->_smpFilter;
  if (smpFilter)
  {
    objc_super v8 = *(void (**)(void))(*(void *)smpFilter + 8);
    v8();
  }
}

- (BOOL)allocateResources
{
  if (self->_resourcesAllocated) {
    return 1;
  }
  uint64_t v3 = (_DWORD *)MEMORY[0x263F00E10];
  if (self->_streamingGDRFilterEnabled)
  {
    if (self->_isFrontFacing) {
      uint64_t v4 = (int *)&unk_26A997BF8;
    }
    else {
      uint64_t v4 = (int *)&unk_26A997C44;
    }
    int resY = self->_resY;
    *uint64_t v4 = self->_resX;
    v4[1] = resY;
    if (*v3 == 1) {
      kdebug_trace();
    }
    operator new();
  }
  if (self->_streamingSMPFilterEnabled)
  {
    if (*MEMORY[0x263F00E10] == 1) {
      kdebug_trace();
    }
    operator new();
  }
  BOOL result = 1;
  self->_resourcesAllocated = 1;
  return result;
}

- (void)setCameraInfoByPortType:(id)a3
{
  objc_super v7 = objc_msgSend_objectForKeyedSubscript_(a3, a2, *MEMORY[0x263F2C278], v3, v4, v5);
  self->_isFrontFacing = v7 != 0;
}

- (void)setStreamingGDRFilterEnabled:(BOOL)a3
{
  self->_streamingGDRFilterEnabled = a3;
}

- (BOOL)streamingGDRFilterEnabled
{
  return self->_streamingGDRFilterEnabled;
}

- (void)setStreamingSMPFilterEnabled:(BOOL)a3
{
  self->_streamingSMPFilterEnabled = a3;
}

- (BOOL)streamingSMPFilterEnabled
{
  return self->_streamingSMPFilterEnabled;
}

- (void)setWorkerQueue:(id)a3
{
}

- (OS_dispatch_queue)workerQueue
{
  return self->_workerQueue;
}

- (int)_convertInputYUV:(__CVBuffer *)a3
{
  int resX = self->_resX;
  int resY = self->_resY;
  image = self->_image;
  int BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(a3, 0);
  int v9 = 1;
  int v10 = CVPixelBufferGetBytesPerRowOfPlane(a3, 1uLL);
  if (!CVPixelBufferLockBaseAddress(a3, 1uLL))
  {
    BaseAddressOfPlane = CVPixelBufferGetBaseAddressOfPlane(a3, 0);
    v12 = CVPixelBufferGetBaseAddressOfPlane(a3, 1uLL);
    if (self->_resY >= 1)
    {
      int v16 = 0;
      int v17 = resY * resX;
      int v18 = 2 * resY * resX;
      uint64_t v19 = BytesPerRowOfPlane;
      uint64_t v20 = 2 * BytesPerRowOfPlane;
      uint64_t v21 = v10;
      uint64_t v78 = 2 * resY * resX;
      uint64_t v77 = resY * resX;
      v22 = &BaseAddressOfPlane[BytesPerRowOfPlane];
      v23.i64[0] = 0xC3000000C3000000;
      v23.i64[1] = 0xC3000000C3000000;
      float32x4_t v24 = (float32x4_t)vdupq_n_s32(0x3FB374BCu);
      float32x4_t v25 = (float32x4_t)vdupq_n_s32(0x437F0000u);
      float32x4_t v26 = (float32x4_t)vdupq_n_s32(0x3B808081u);
      float32x4_t v27 = (float32x4_t)vdupq_n_s32(0xBEB02DE0);
      float32x4_t v28 = (float32x4_t)vdupq_n_s32(0xBF36CF42);
      float32x4_t v29 = (float32x4_t)vdupq_n_s32(0x3FE2D0E5u);
      do
      {
        LODWORD(v30) = self->_resX;
        if ((int)v30 < 16)
        {
          uint64_t v31 = 0;
        }
        else
        {
          uint64_t v31 = 0;
          do
          {
            v32 = &BaseAddressOfPlane[v31];
            v33 = &v12[v31];
            float32x4_t v79 = (float32x4_t)vld2_s8(v32);
            v34 = &v32[v19];
            float32x4_t v80 = (float32x4_t)vld2_s8(v33);
            uint16x8_t v35 = vmovl_u8(*(uint8x8_t *)v79.f32);
            float32x4_t v36 = vcvtq_f32_u32(vmovl_u16(*(uint16x4_t *)v35.i8));
            float32x4_t v37 = vcvtq_f32_u32(vmovl_high_u16(v35));
            float32x4_t v79 = (float32x4_t)vmovl_u8(*(uint8x8_t *)&v79.u32[2]);
            uint32x4_t v38 = vmovl_high_u16((uint16x8_t)v79);
            float32x4_t v39 = vcvtq_f32_u32(vmovl_u16(*(uint16x4_t *)v79.f32));
            float32x4_t v79 = (float32x4_t)vmovl_u8(*(uint8x8_t *)v80.f32);
            *(float32x4_t *)((char *)&v79 + 8) = vaddq_f32(vcvtq_f32_u32(vmovl_u16(*(uint16x4_t *)v79.f32)), v23);
            float32x4_t v79 = vaddq_f32(vcvtq_f32_u32(vmovl_high_u16((uint16x8_t)v79)), v23);
            float32x4_t v80 = (float32x4_t)vmovl_u8(*(uint8x8_t *)&v80.u32[2]);
            float32x4_t v40 = vcvtq_f32_u32(v38);
            *(float32x4_t *)((char *)&v80 + 8) = vaddq_f32(vcvtq_f32_u32(vmovl_u16(*(uint16x4_t *)v80.f32)), v23);
            float32x4_t v80 = vaddq_f32(vcvtq_f32_u32(vmovl_high_u16((uint16x8_t)v80)), v23);
            v84.val[0] = vmulq_f32(vminq_f32(vmaxq_f32(vmlaq_f32(v36, v24, *(float32x4_t *)((char *)&v80 + 8)), (float32x4_t)0), v25), v26);
            v41 = &image[v31];
            v42 = v41;
            v84.val[1] = vmulq_f32(vminq_f32(vmaxq_f32(vmlaq_f32(v39, v24, *(float32x4_t *)((char *)&v80 + 8)), (float32x4_t)0), v25), v26);
            v85.val[0] = vmulq_f32(vminq_f32(vmaxq_f32(vmlaq_f32(v37, v24, v80), (float32x4_t)0), v25), v26);
            v43 = v41 + 8;
            v85.val[1] = vmulq_f32(vminq_f32(vmaxq_f32(vmlaq_f32(v40, v24, v80), (float32x4_t)0), v25), v26);
            v44 = &v41[v17];
            vst2q_f32(v42, v84);
            v45 = &v42[v78];
            v46 = v44;
            vst2q_f32(v43, v85);
            v85.val[0] = vmulq_f32(vminq_f32(vmaxq_f32(vmlaq_f32(vmlaq_f32(v36, v27, *(float32x4_t *)((char *)&v79 + 8)), v28, *(float32x4_t *)((char *)&v80 + 8)), (float32x4_t)0), v25), v26);
            v85.val[1] = vmulq_f32(vminq_f32(vmaxq_f32(vmlaq_f32(vmlaq_f32(v39, v27, *(float32x4_t *)((char *)&v79 + 8)), v28, *(float32x4_t *)((char *)&v80 + 8)), (float32x4_t)0), v25), v26);
            v83.val[0] = vmulq_f32(vminq_f32(vmaxq_f32(vmlaq_f32(vmlaq_f32(v37, v27, v79), v28, v80), (float32x4_t)0), v25), v26);
            v81.val[0] = vmulq_f32(vminq_f32(vmaxq_f32(vmlaq_f32(v36, v29, *(float32x4_t *)((char *)&v79 + 8)), (float32x4_t)0), v25), v26);
            v81.val[1] = vmulq_f32(vminq_f32(vmaxq_f32(vmlaq_f32(v39, v29, *(float32x4_t *)((char *)&v79 + 8)), (float32x4_t)0), v25), v26);
            v47 = v45;
            v83.val[1] = vmulq_f32(vminq_f32(vmaxq_f32(vmlaq_f32(vmlaq_f32(v40, v27, v79), v28, v80), (float32x4_t)0), v25), v26);
            vst2q_f32(v46, v85);
            v46 += 8;
            vst2q_f32(v46, v83);
            vst2q_f32(v47, v81);
            v47 += 8;
            v82.val[0] = vmulq_f32(vminq_f32(vmaxq_f32(vmlaq_f32(v37, v29, v79), (float32x4_t)0), v25), v26);
            v82.val[1] = vmulq_f32(vminq_f32(vmaxq_f32(vmlaq_f32(v40, v29, v79), (float32x4_t)0), v25), v26);
            vst2q_f32(v47, v82);
            *(int8x8x2_t *)((char *)&v36 - 8) = vld2_s8(v34);
            v82.val[1] = (float32x4_t)vmovl_u8(*(uint8x8_t *)v37.f32);
            v82.val[0] = vcvtq_f32_u32(vmovl_u16(*(uint16x4_t *)v82.val[1].f32));
            uint16x8_t v48 = vmovl_u8(*(uint8x8_t *)v36.f32);
            float32x4_t v49 = vcvtq_f32_u32(vmovl_high_u16((uint16x8_t)v82.val[1]));
            v82.val[1] = vcvtq_f32_u32(vmovl_u16(*(uint16x4_t *)v48.i8));
            float32x4_t v50 = vcvtq_f32_u32(vmovl_high_u16(v48));
            v51 = &v41[self->_resX];
            v85.val[0] = vmulq_f32(vminq_f32(vmaxq_f32(vmlaq_f32(v82.val[0], v24, *(float32x4_t *)((char *)&v80 + 8)), (float32x4_t)0), v25), v26);
            v85.val[1] = vmulq_f32(vminq_f32(vmaxq_f32(vmlaq_f32(v82.val[1], v24, *(float32x4_t *)((char *)&v80 + 8)), (float32x4_t)0), v25), v26);
            vst2q_f32(v51, v85);
            v85.val[0] = vmulq_f32(vminq_f32(vmaxq_f32(vmlaq_f32(v49, v24, v80), (float32x4_t)0), v25), v26);
            v85.val[1] = vmulq_f32(vminq_f32(vmaxq_f32(vmlaq_f32(v50, v24, v80), (float32x4_t)0), v25), v26);
            v83.val[1] = vmulq_f32(vminq_f32(vmaxq_f32(vmlaq_f32(vmlaq_f32(v82.val[0], v27, *(float32x4_t *)((char *)&v79 + 8)), v28, *(float32x4_t *)((char *)&v80 + 8)), (float32x4_t)0), v25), v26);
            v84.val[0] = vmulq_f32(vminq_f32(vmaxq_f32(vmlaq_f32(vmlaq_f32(v82.val[1], v27, *(float32x4_t *)((char *)&v79 + 8)), v28, *(float32x4_t *)((char *)&v80 + 8)), (float32x4_t)0), v25), v26);
            v52 = &v41[self->_resX + 8];
            vst2q_f32(v52, v85);
            v53 = &v44[self->_resX];
            v84.val[1] = vmulq_f32(vminq_f32(vmaxq_f32(vmlaq_f32(vmlaq_f32(v49, v27, v79), v28, v80), (float32x4_t)0), v25), v26);
            v85.val[0] = vmulq_f32(vminq_f32(vmaxq_f32(vmlaq_f32(vmlaq_f32(v50, v27, v79), v28, v80), (float32x4_t)0), v25), v26);
            vst2q_f32(v53, v84);
            v54 = &v44[self->_resX + 8];
            vst2q_f32(v54, *(float32x4x2_t *)((char *)&v84 + 16));
            v82.val[0] = vmulq_f32(vminq_f32(vmaxq_f32(vmlaq_f32(v82.val[0], v29, *(float32x4_t *)((char *)&v79 + 8)), (float32x4_t)0), v25), v26);
            v82.val[1] = vmulq_f32(vminq_f32(vmaxq_f32(vmlaq_f32(v82.val[1], v29, *(float32x4_t *)((char *)&v79 + 8)), (float32x4_t)0), v25), v26);
            v55 = &v45[self->_resX];
            float32x4_t v56 = vmlaq_f32(v50, v29, v79);
            vst2q_f32(v55, v82);
            float32x4_t v13 = vminq_f32(vmaxq_f32(vmlaq_f32(v49, v29, v79), (float32x4_t)0), v25);
            float32x4_t v14 = vminq_f32(vmaxq_f32(v56, (float32x4_t)0), v25);
            float32x4_t v15 = vmulq_f32(v13, v26);
            *(float32x4_t *)((char *)&v80 + 8) = vmulq_f32(v14, v26);
            v57 = &v45[self->_resX + 8];
            vst2q_f32(v57, *(float32x4x2_t *)v15.f32);
            v31 += 16;
            uint64_t v30 = self->_resX;
          }
          while ((v31 | 0xF) < v30);
          uint64_t v31 = v31;
        }
        if ((int)v31 < (int)v30)
        {
          v58 = &image[v78];
          uint64_t v59 = 4 * v31 + 4 * (int)v30;
          v60 = &image[v77];
          v61 = &image[v31 + 1 + (int)v30];
          do
          {
            v13.i8[0] = v12[v31];
            v14.i8[0] = BaseAddressOfPlane[v31];
            v15.i8[0] = v12[v31 | 1];
            float v62 = (float)v14.u32[0];
            float v63 = (float)v13.u32[0] + -128.0;
            float v64 = (float)v15.u32[0] + -128.0;
            float v65 = fmaxf((float)v14.u32[0] + (float)(v64 * 1.402), 0.0);
            v14.i32[0] = 1132396544;
            float v66 = fminf(v65, 255.0);
            v15.i32[0] = 998277249;
            image[v31] = v66 * 0.0039216;
            v60[v31] = fminf(fmaxf((float)(v62 + (float)(v63 * -0.3441)) + (float)(v64 * -0.7141), 0.0), 255.0)
                     * 0.0039216;
            *(float *)&unsigned int v67 = fminf(fmaxf(v62 + (float)(v63 * 1.772), 0.0), 255.0) * 0.0039216;
            v58[v31] = *(float *)&v67;
            LOBYTE(v67) = BaseAddressOfPlane[v31 | 1];
            float v68 = (float)v67;
            image[v31 | 1] = fminf(fmaxf(v68 + (float)(v64 * 1.402), 0.0), 255.0) * 0.0039216;
            image[(int)((v31 | 1) + v17)] = fminf(fmaxf((float)(v68 + (float)(v63 * -0.3441)) + (float)(v64 * -0.7141), 0.0), 255.0)* 0.0039216;
            *(float *)&unsigned int v69 = fminf(fmaxf(v68 + (float)(v63 * 1.772), 0.0), 255.0) * 0.0039216;
            image[(int)((v31 | 1) + v18)] = *(float *)&v69;
            LOBYTE(v69) = v22[v31];
            float v70 = (float)v69;
            *(v61 - 1) = fminf(fmaxf(v70 + (float)(v64 * 1.402), 0.0), 255.0) * 0.0039216;
            float v71 = fminf(fmaxf((float)(v70 + (float)(v63 * -0.3441)) + (float)(v64 * -0.7141), 0.0), 255.0);
            v72 = (float *)((char *)v60 + v59);
            *(float *)&unsigned int v73 = fminf(fmaxf(v70 + (float)(v63 * 1.772), 0.0), 255.0) * 0.0039216;
            float *v72 = v71 * 0.0039216;
            v74 = (char *)v58 + v59;
            *(float *)v74 = *(float *)&v73;
            LOBYTE(v73) = v22[v31 + 1];
            float v75 = (float)v73;
            float *v61 = fminf(fmaxf(v75 + (float)(v64 * 1.402), 0.0), 255.0) * 0.0039216;
            v61 += 2;
            v72[1] = fminf(fmaxf((float)(v75 + (float)(v63 * -0.3441)) + (float)(v64 * -0.7141), 0.0), 255.0)
                   * 0.0039216;
            v13.f32[0] = fminf(fmaxf(v75 + (float)(v63 * 1.772), 0.0), 255.0) * 0.0039216;
            *((_DWORD *)v74 + 1) = v13.i32[0];
            v31 += 2;
            v59 += 8;
          }
          while (v31 < (int)v30);
        }
        image += 2 * (int)v30;
        BaseAddressOfPlane += v20;
        v12 += v21;
        v16 += 2;
        v22 += v20;
      }
      while (v16 < self->_resY);
    }
    CVPixelBufferUnlockBaseAddress(a3, 1uLL);
    return 0;
  }
  return v9;
}

- (int)_convertInputShifts:(__CVBuffer *)a3 disparityOut:(float *)a4 resX:(int)a5 resY:(int)a6 extendedWidth:(int)a7 inputInvalidDisparityValue:(float)a8 outputDisparitySaturationValue:(float)a9
{
  int32x2_t v29 = *(int32x2_t *)&a9;
  int32x2_t v28 = *(int32x2_t *)&a8;
  size_t BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
  if (CVPixelBufferLockBaseAddress(a3, 1uLL)) {
    return 3;
  }
  BaseAddress = (float *)CVPixelBufferGetBaseAddress(a3);
  if (a6 >= 1)
  {
    int v16 = 0;
    float32x4_t v17 = (float32x4_t)vdupq_lane_s32(v29, 0);
    float32x4_t v18 = (float32x4_t)vdupq_lane_s32(v28, 0);
    do
    {
      if (a5 < 4)
      {
        uint64_t v25 = 0;
      }
      else
      {
        uint64_t v19 = 0;
        uint64_t v20 = 0;
        do
        {
          float32x4_t v21 = *(float32x4_t *)&BaseAddress[v19];
          int32x4_t v22 = vcgtq_f32(v21, v18);
          *(int8x16_t *)&a4[v19] = vbslq_s8((int8x16_t)vmovl_s16((int16x4_t)vand_s8(vbic_s8((int8x8_t)vmovn_s32((int32x4_t)vorrq_s8((int8x16_t)vcltzq_f32(v21), (int8x16_t)vcgezq_f32(v21))), (int8x8_t)vmovn_s32((int32x4_t)vandq_s8((int8x16_t)vcgtq_f32(v17, v21), (int8x16_t)v22))), (int8x8_t)vmovn_s32(v22))), (int8x16_t)v21, (int8x16_t)v18);
          unsigned int v23 = v20 + 4;
          v19 += 4;
          uint64_t v24 = v20 + 7;
          v20 += 4;
        }
        while (v24 < a5);
        uint64_t v25 = v23;
      }
      if ((int)v25 < a5)
      {
        do
        {
          float v26 = BaseAddress[v25];
          if (v26 <= *(float *)v28.i32) {
            float v26 = *(float *)v28.i32;
          }
          if (v26 <= *(float *)v29.i32) {
            float v26 = *(float *)v29.i32;
          }
          a4[v25++] = v26;
        }
        while (a5 != v25);
      }
      ++v16;
      a4 += a7;
      BaseAddress += BytesPerRow >> 2;
    }
    while (v16 != a6);
  }
  CVPixelBufferUnlockBaseAddress(a3, 1uLL);
  return 0;
}

- (int)_copyToDepthImage:(__CVBuffer *)a3 disparityIn:(float *)a4 resX:(int)a5 resY:(int)a6 extendedWidth:(int)a7
{
  size_t BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
  if (CVPixelBufferLockBaseAddress(a3, 0)) {
    return 5;
  }
  BaseAddress = (float *)CVPixelBufferGetBaseAddress(a3);
  if (a4)
  {
    if (a6 >= 1)
    {
      int v14 = 0;
      do
      {
        if (a5 < 8)
        {
          uint64_t v21 = 0;
        }
        else
        {
          uint64_t v15 = 0;
          uint64_t v16 = 0;
          do
          {
            long long v17 = *(_OWORD *)&a4[v15 + 4];
            float32x4_t v18 = &BaseAddress[v15];
            *(_OWORD *)float32x4_t v18 = *(_OWORD *)&a4[v15];
            *((_OWORD *)v18 + 1) = v17;
            unsigned int v19 = v16 + 8;
            v15 += 8;
            uint64_t v20 = v16 + 15;
            v16 += 8;
          }
          while (v20 < a5);
          uint64_t v21 = v19;
        }
        if ((int)v21 < a5)
        {
          do
          {
            BaseAddress[v21] = a4[v21];
            ++v21;
          }
          while (a5 != v21);
        }
        ++v14;
        BaseAddress += BytesPerRow >> 2;
        a4 += a7;
      }
      while (v14 != a6);
    }
    int v22 = 0;
  }
  else
  {
    int v22 = 3;
  }
  CVPixelBufferUnlockBaseAddress(a3, 0);
  return v22;
}

- (int)_performSMPFilterOnDisparity:(float *)a3 depthBuffer:(__CVBuffer *)a4 inputInvalidDisparityValue:(float)a5 outputInvalidDisparityValue:(float)a6 disparityOut:(float *)a7
{
  if (a3)
  {
    return objc_msgSend__performSMPFilterOnDisparity_inputInvalidDisparityValue_outputInvalidDisparityValue_disparityOut_(self, a2, (uint64_t)a3, (uint64_t)a7, (uint64_t)a7, v7);
  }
  else if (CVPixelBufferLockBaseAddress(a4, 1uLL))
  {
    return 3;
  }
  else
  {
    BaseAddress = CVPixelBufferGetBaseAddress(a4);
    *(float *)&double v15 = a5;
    *(float *)&double v16 = a6;
    int v20 = objc_msgSend__performSMPFilterOnDisparity_inputInvalidDisparityValue_outputInvalidDisparityValue_disparityOut_(self, v17, (uint64_t)BaseAddress, (uint64_t)a7, v18, v19, v15, v16);
    CVPixelBufferUnlockBaseAddress(a4, 1uLL);
    return v20;
  }
}

- (int)_performSMPFilterOnDisparity:(float *)a3 inputInvalidDisparityValue:(float)a4 outputInvalidDisparityValue:(float)a5 disparityOut:(float *)a6
{
  objc_msgSend__startSMPFilteringTrace(self, a2, (uint64_t)a3, (uint64_t)a6, v6, v7);
  *(float *)&double v13 = a4;
  sub_262E990D8((uint64_t)self->_smpFilter, a3, 0, &v21, v13, a5);
  objc_msgSend__endSMPFilteringTrace(self, v14, v15, v16, v17, v18);
  if (v21)
  {
    int v19 = 0;
    *a6 = v21;
  }
  else
  {
    int v19 = 3;
  }
  if (v22) {
    sub_262E97B00(v22);
  }
  return v19;
}

- (int)_performGDRFilterOnDisparity:(float *)a3 yuvBuffer:(__CVBuffer *)a4 disparityOut:(float *)a5
{
  int v9 = objc_msgSend__convertInputYUV_(self, a2, (uint64_t)a4, (uint64_t)a4, (uint64_t)a5, v5);
  if (!v9)
  {
    int v10 = (_DWORD *)MEMORY[0x263F00E10];
    if (*MEMORY[0x263F00E10] == 1) {
      kdebug_trace();
    }
    sub_262EAE394((uint64_t)self->_gdr, self->_image, (int8x16_t *)a3);
    if (*v10 == 1) {
      kdebug_trace();
    }
    *a5 = a3;
  }
  return v9;
}

- (int)processDepthBuffer:(__CVBuffer *)a3 yuvBuffer:(__CVBuffer *)a4 parametersDictionary:(id)a5 outputDisparityBuffer:(__CVBuffer *)a6
{
  id v12 = a5;
  int v19 = 0;
  if (!self->_resourcesAllocated)
  {
    int v15 = 4;
    goto LABEL_22;
  }
  if (self->_streamingGDRFilterEnabled && !self->_gdr)
  {
    int v15 = 1;
    goto LABEL_22;
  }
  if (self->_streamingSMPFilterEnabled)
  {
    int v15 = 1;
    if (!a4 || !a3 || !self->_smpFilter) {
      goto LABEL_22;
    }
LABEL_11:
    if (self->_streamingGDRFilterEnabled)
    {
      LODWORD(v14) = 1036831949;
      LODWORD(v13) = -1.0;
      int v15 = objc_msgSend__convertInputShifts_disparityOut_resX_resY_extendedWidth_inputInvalidDisparityValue_outputDisparitySaturationValue_(self, v10, (uint64_t)a3, (uint64_t)self->_disparity, self->_resX, self->_resY, self->_extendedWidth, v13, v14);
      if (v15) {
        goto LABEL_22;
      }
      disparity = self->_disparity;
      LODWORD(v13) = -1.0;
      if (self->_streamingSMPFilterEnabled) {
        goto LABEL_14;
      }
    }
    else
    {
      disparity = 0;
      LODWORD(v13) = 2143289344;
      if (self->_streamingSMPFilterEnabled)
      {
LABEL_14:
        LODWORD(v14) = LODWORD(v13);
        int v15 = objc_msgSend__performSMPFilterOnDisparity_depthBuffer_inputInvalidDisparityValue_outputInvalidDisparityValue_disparityOut_(self, v10, (uint64_t)disparity, (uint64_t)a3, (uint64_t)&v19, v11, v13, v14);
        if (v15) {
          goto LABEL_22;
        }
        uint64_t v17 = (uint64_t)v19;
        disparity = v19;
LABEL_18:
        if (self->_streamingGDRFilterEnabled)
        {
          int v15 = objc_msgSend__performGDRFilterOnDisparity_yuvBuffer_disparityOut_(self, v10, (uint64_t)disparity, (uint64_t)a4, (uint64_t)&v19, v11);
          if (v15) {
            goto LABEL_22;
          }
          uint64_t v17 = (uint64_t)v19;
        }
        int v15 = objc_msgSend__copyToDepthImage_disparityIn_resX_resY_extendedWidth_(self, v10, (uint64_t)a6, v17, self->_resX, self->_resY, self->_extendedWidth);
        goto LABEL_22;
      }
    }
    uint64_t v17 = 0;
    goto LABEL_18;
  }
  int v15 = 1;
  if (a3 && a4) {
    goto LABEL_11;
  }
LABEL_22:

  return v15;
}

- (int)processDepthBuffer:(__CVBuffer *)a3 yuvBuffer:(__CVBuffer *)a4 rgbSegmentationMaskBuffer:(__CVBuffer *)a5 parametersDictionary:(id)a6 outputDisparityBuffer:(__CVBuffer *)a7
{
  return 17;
}

- (int)processDepthBuffer:(__CVBuffer *)a3 yuvBuffer:(__CVBuffer *)a4 personSegmentationMaskBuffer:(__CVBuffer *)a5 instanceSegmentationMaskBufferArray:(id)a6 instanceSegmentationConfidences:(id)a7 parametersDictionary:(id)a8 outputDisparityBuffer:(__CVBuffer *)a9
{
  return 17;
}

- (void)_startSMPFilteringTrace
{
  int resX = self->_resX;
  if (resX <= self->_resY) {
    int resX = self->_resY;
  }
  if (resX > 639)
  {
    if ((resX == 656 || resX == 640) && *MEMORY[0x263F00E10] == 1) {
      goto LABEL_13;
    }
  }
  else
  {
    if (resX == 180)
    {
      if (*MEMORY[0x263F00E10] != 1) {
        return;
      }
      goto LABEL_13;
    }
    if (resX == 320 && *MEMORY[0x263F00E10] == 1) {
LABEL_13:
    }
      kdebug_trace();
  }
}

- (void)_endSMPFilteringTrace
{
  int resX = self->_resX;
  if (resX <= self->_resY) {
    int resX = self->_resY;
  }
  if (resX > 639)
  {
    if ((resX == 656 || resX == 640) && *MEMORY[0x263F00E10] == 1) {
      goto LABEL_13;
    }
  }
  else
  {
    if (resX == 180)
    {
      if (*MEMORY[0x263F00E10] != 1) {
        return;
      }
      goto LABEL_13;
    }
    if (resX == 320 && *MEMORY[0x263F00E10] == 1) {
LABEL_13:
    }
      kdebug_trace();
  }
}

- (NSDictionary)cameraInfoByPortType
{
  return self->_cameraInfoByPortType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cameraInfoByPortType, 0);

  objc_storeStrong((id *)&self->_workerQueue, 0);
}

@end