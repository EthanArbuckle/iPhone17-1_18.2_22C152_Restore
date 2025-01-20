@interface LKTFlowGPU
+ (void)_computeScalingFactor:(id)a1 dst_tex:(SEL)a2 scale_xy_inv:(id)a3 coeff:(id)a4;
- (BOOL)isBidirectional;
- (BOOL)isValid;
- (BOOL)needConversionBGRA2YUVA;
- (BOOL)useNonLocalRegularization;
- (CGSize)aux_size;
- (CGSize)ref_size;
- (LKTFlowGPU)initWithMetalContext:(id)a3 width:(int)a4 height:(int)a5 nscales:(int)a6;
- (MTLBuffer)keypoints;
- (float)nlreg_sigma_c;
- (float)nlreg_sigma_l;
- (float)nlreg_sigma_w;
- (id)newBufferWithPixelFormat:(unint64_t)a3 width:(int)a4 data:(const void *)a5;
- (int)_computeFeaturesDerivativesWithCommandBuffer:(id)a3 in_tex:(id)a4 out_tex:(id)a5;
- (int)_computeFeaturesWithCommandBuffer:(id)a3 in_tex:(id)a4 out_tex:(id)a5;
- (int)_computeOpticalFlow;
- (int)_computeOpticalFlowBidirectional;
- (int)_createImagePyramidWithCommandBuffer:(id)a3 in_pixelbuf:(__CVBuffer *)a4 I_idx:(int)a5;
- (int)_createImagePyramidWithCommandBuffer:(id)a3 in_tex:(id)a4 I_idx:(int)a5;
- (int)_doNLRegularizationWithCommandBuffer:(id)a3 in_uv_tex:(id)a4 join_tex:(id)a5 w_tex:(id)a6 out_uv_tex:(id)a7;
- (int)_doSolverWithCommandBuffer:(id)a3 scale:(int)a4 in_uv_tex:(id)a5 in_G0_tex:(id)a6 in_G1_tex:(id)a7 in_C0_tex:(id)a8 in_C1_tex:(id)a9 out_uv_tex:(id)a10 out_w_tex:(id)a11;
- (int)_downscale2XWithCommandBuffer:(id)a3 in_tex:(id)a4 out_tex:(id)a5;
- (int)_enqueueFlowConsistencyWithCommandBuffer:(id)a3 in_uv0_tex:(id)a4 in_uv1_tex:(id)a5 out_uv_tex:(id)a6;
- (int)_enqueueKeypointsFromFlowWithCommandBuffer:(id)a3 in_uv_fwd_tex:(id)a4 in_uv_bwd_tex:(id)a5 out_kpt_buf:(id)a6 block_size:(int)a7 bidirectional_error:(float)a8 out_num_keypoints:(unsigned __int16 *)a9;
- (int)_setupBuffer;
- (int)_zeroFlowWithCommandBuffer:(id)a3 uv_tex:(id)a4;
- (int)computeKeypointsFromForwardFlow:(__CVBuffer *)a3 backwardFlow:(__CVBuffer *)a4 bidirectionalError:(float)a5 blockSize:(int)a6 outNumKeypoints:(unsigned __int16 *)a7;
- (int)computeKeypointsFromTexForwardFlow:(id)a3 backwardFlow:(id)a4 bidirectionalError:(float)a5 blockSize:(int)a6 outNumKeypoints:(unsigned __int16 *)a7;
- (int)estimateFlowFromReference:(__CVBuffer *)a3 target:(__CVBuffer *)a4;
- (int)estimateFlowFromTexReference:(id)a3 target:(id)a4;
- (int)estimateFlowStream:(__CVBuffer *)a3;
- (int)estimateFlowStreamTex:(id)a3;
- (int)nlreg_padding;
- (int)nlreg_radius;
- (int)nscales;
- (int)nwarpings;
- (int)setOutputTexUV:(id)a3;
- (int)setOutputTexUVForward:(id)a3 backward:(id)a4;
- (int)setOutputUV:(__CVBuffer *)a3;
- (int)setOutputUVForward:(__CVBuffer *)a3 backward:(__CVBuffer *)a4;
- (int)streamFrameCount;
- (unint64_t)bytesPerPixelForTextureFormat:(unint64_t)a3;
- (void)_initMemory:(int)a3 height:(int)a4 nscales:(int)a5;
- (void)_setDefaultParameters;
- (void)_setupPipelines;
- (void)dealloc;
- (void)reset;
- (void)setIsBidirectional:(BOOL)a3;
- (void)setNeedConversionBGRA2YUVA:(BOOL)a3;
- (void)setNlreg_padding:(int)a3;
- (void)setNlreg_radius:(int)a3;
- (void)setNlreg_sigma_c:(float)a3;
- (void)setNlreg_sigma_l:(float)a3;
- (void)setNlreg_sigma_w:(float)a3;
- (void)setNwarpings:(int)a3;
- (void)setPreset:(int64_t)a3;
- (void)setUseNonLocalRegularization:(BOOL)a3;
- (void)waitUntilCompleted;
@end

@implementation LKTFlowGPU

- (LKTFlowGPU)initWithMetalContext:(id)a3 width:(int)a4 height:(int)a5 nscales:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  uint64_t v7 = *(void *)&a5;
  uint64_t v8 = *(void *)&a4;
  id v11 = a3;
  v18.receiver = self;
  v18.super_class = (Class)LKTFlowGPU;
  v12 = [(LKTFlowGPU *)&v18 init];
  v13 = v12;
  if (v12)
  {
    if ((v7 | v8))
    {
      id v17 = +[NSException exceptionWithName:@"Invalid parameter" reason:@"Odd image dimensions are not supported" userInfo:0];
      objc_exception_throw(v17);
    }
    objc_storeStrong((id *)&v12->_mtlContext, a3);
    uint64_t v14 = [v11 commandQueue];
    commandQueue = v13->_commandQueue;
    v13->_commandQueue = (MTLCommandQueue *)v14;

    [(LKTFlowGPU *)v13 _setDefaultParameters];
    [(LKTFlowGPU *)v13 _initMemory:v8 height:v7 nscales:v6];
    [(LKTFlowGPU *)v13 _setupPipelines];
    [(LKTFlowGPU *)v13 _setupBuffer];
  }

  return v13;
}

- (void)dealloc
{
  CVPixelBufferRelease(self->_G0_pxbuf);
  CVPixelBufferRelease(self->_G1_pxbuf);
  CVPixelBufferRelease(self->_C0_pxbuf);
  CVPixelBufferRelease(self->_C1_pxbuf);
  CVPixelBufferRelease(self->_w_pxbuf);
  CVPixelBufferRelease(self->_uv_fwd_pxbuf[0]);
  CVPixelBufferRelease(self->_uv_bwd_pxbuf[0]);
  CVPixelBufferRelease(self->_uv_fwd_pxbuf[1]);
  CVPixelBufferRelease(self->_uv_bwd_pxbuf[1]);
  v3.receiver = self;
  v3.super_class = (Class)LKTFlowGPU;
  [(LKTFlowGPU *)&v3 dealloc];
}

- (void)reset
{
  *(void *)&self->_current_frame_index = 0;
}

- (void)waitUntilCompleted
{
  id v2 = [(MTLCommandQueue *)self->_commandQueue commandBuffer];
  [v2 setLabel:@"LKT:waitUntilCompleted"];
  [v2 commit];
  [v2 waitUntilCompleted];
}

- (BOOL)isBidirectional
{
  return self->_uv_bwd_tex_user_ref != 0;
}

- (MTLBuffer)keypoints
{
  return self->_kpt_buf;
}

- (void)setPreset:(int64_t)a3
{
  switch(a3)
  {
    case 0:
      [(LKTFlowGPU *)self _setDefaultParameters];
      return;
    case 1:
      int v3 = 1;
      goto LABEL_8;
    case 2:
      int v3 = 3;
      goto LABEL_8;
    case 3:
      int v3 = 5;
LABEL_8:
      self->_nwarpings = v3;
      self->_useNonLocalRegularization = 0;
      break;
    case 4:
      self->_useNonLocalRegularization = 1;
      *(void *)&self->_nwarpings = 0x400000006;
      *(void *)&self->_nlreg_padding = 0x40C0000000000002;
      *(void *)&self->_nlreg_sigma_c = 0x3E80000040400000;
      break;
    default:
      id v4 = +[NSException exceptionWithName:@"Invalid parameter" reason:@"Unknown preset" userInfo:0];
      objc_exception_throw(v4);
  }
}

- (int)setOutputUV:(__CVBuffer *)a3
{
  return [(LKTFlowGPU *)self setOutputUVForward:a3 backward:0];
}

- (int)setOutputTexUV:(id)a3
{
  return [(LKTFlowGPU *)self setOutputTexUVForward:a3 backward:0];
}

- (int)setOutputTexUVForward:(id)a3 backward:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  p_uv_fwd_tex_user_ref = &self->_uv_fwd_tex_user_ref;
  if (v7)
  {
    objc_storeStrong((id *)p_uv_fwd_tex_user_ref, a3);
    objc_storeStrong((id *)&self->_uv_bwd_tex_user_ref, a4);
    self->_isValid = 1;
  }
  else
  {
    v10 = *p_uv_fwd_tex_user_ref;
    *p_uv_fwd_tex_user_ref = 0;
  }
  return 0;
}

- (int)setOutputUVForward:(__CVBuffer *)a3 backward:(__CVBuffer *)a4
{
  if (a3)
  {
    int Width = CVPixelBufferGetWidth(a3);
    double Height = (double)(int)CVPixelBufferGetHeight(a3);
    -[FigMetalContext bindPixelBufferToMTL2DTexture:pixelFormat:usage:textureSize:plane:](self->_mtlContext, "bindPixelBufferToMTL2DTexture:pixelFormat:usage:textureSize:plane:", a3, 65, 7, 0, (double)Width, Height);
    v9 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
    uv_fwd_tex_user_ref = self->_uv_fwd_tex_user_ref;
    self->_uv_fwd_tex_user_ref = v9;

    if (!self->_uv_fwd_tex_user_ref) {
      return -12786;
    }
    if (a4)
    {
      -[FigMetalContext bindPixelBufferToMTL2DTexture:pixelFormat:usage:textureSize:plane:](self->_mtlContext, "bindPixelBufferToMTL2DTexture:pixelFormat:usage:textureSize:plane:", a4, 65, 7, 0, (double)Width, Height);
      id v11 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
      uv_bwd_tex_user_ref = self->_uv_bwd_tex_user_ref;
      self->_uv_bwd_tex_user_ref = v11;

      if (!self->_uv_bwd_tex_user_ref) {
        return -12786;
      }
    }
    else
    {
      v15 = self->_uv_bwd_tex_user_ref;
      self->_uv_bwd_tex_user_ref = 0;
    }
    int result = 0;
    self->_isValid = 1;
  }
  else
  {
    uint64_t v14 = self->_uv_fwd_tex_user_ref;
    self->_uv_fwd_tex_user_ref = 0;

    return 0;
  }
  return result;
}

- (int)estimateFlowFromTexReference:(id)a3 target:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self->_isValid && !self->_streamFrameCount)
  {
    v9 = [(MTLCommandQueue *)self->_commandQueue commandBuffer];
    [v9 setLabel:@"LKT::Pyramid"];
    [(LKTFlowGPU *)self _zeroFlowWithCommandBuffer:v9 uv_tex:self->_uv_bwd_pxbuf[self->_nscales + 1]];
    if ([(LKTFlowGPU *)self isBidirectional]) {
      [(LKTFlowGPU *)self _zeroFlowWithCommandBuffer:v9 uv_tex:self->_uv_fwd_tex[1][self->_nscales + 9]];
    }
    [(LKTFlowGPU *)self _createImagePyramidWithCommandBuffer:v9 in_tex:v6 I_idx:0];
    [(LKTFlowGPU *)self _createImagePyramidWithCommandBuffer:v9 in_tex:v7 I_idx:1];
    [v9 commit];

    *(void *)&self->_current_frame_index = 0;
    if ([(LKTFlowGPU *)self isBidirectional]) {
      [(LKTFlowGPU *)self _computeOpticalFlowBidirectional];
    }
    else {
      [(LKTFlowGPU *)self _computeOpticalFlow];
    }
    int v8 = 0;
  }
  else
  {
    int v8 = -12782;
  }

  return v8;
}

- (int)estimateFlowFromReference:(__CVBuffer *)a3 target:(__CVBuffer *)a4
{
  if (!self->_isValid || self->_streamFrameCount) {
    return -12782;
  }
  int v8 = [(MTLCommandQueue *)self->_commandQueue commandBuffer];
  [v8 setLabel:@"LKT::Pyramid"];
  [(LKTFlowGPU *)self _zeroFlowWithCommandBuffer:v8 uv_tex:self->_uv_bwd_pxbuf[self->_nscales + 1]];
  if ([(LKTFlowGPU *)self isBidirectional]) {
    [(LKTFlowGPU *)self _zeroFlowWithCommandBuffer:v8 uv_tex:self->_uv_fwd_tex[1][self->_nscales + 9]];
  }
  [(LKTFlowGPU *)self _createImagePyramidWithCommandBuffer:v8 in_pixelbuf:a3 I_idx:0];
  [(LKTFlowGPU *)self _createImagePyramidWithCommandBuffer:v8 in_pixelbuf:a4 I_idx:1];
  [v8 commit];

  *(void *)&self->_current_frame_index = 0;
  if ([(LKTFlowGPU *)self isBidirectional]) {
    [(LKTFlowGPU *)self _computeOpticalFlowBidirectional];
  }
  else {
    [(LKTFlowGPU *)self _computeOpticalFlow];
  }
  return 0;
}

- (int)estimateFlowStream:(__CVBuffer *)a3
{
  int v3 = self;
  id v4 = [(FigMetalContext *)self->_mtlContext bindPixelBufferToMTL2DTexture:a3 pixelFormat:70 usage:7 plane:0];
  LODWORD(v3) = [(LKTFlowGPU *)v3 estimateFlowStreamTex:v4];

  return (int)v3;
}

- (int)estimateFlowStreamTex:(id)a3
{
  id v4 = a3;
  if (self->_isValid)
  {
    v5 = [(MTLCommandQueue *)self->_commandQueue commandBuffer];
    [v5 setLabel:@"LKT::Pyramid"];
    [(LKTFlowGPU *)self _zeroFlowWithCommandBuffer:v5 uv_tex:self->_uv_bwd_pxbuf[self->_nscales + 1]];
    if ([(LKTFlowGPU *)self isBidirectional]) {
      [(LKTFlowGPU *)self _zeroFlowWithCommandBuffer:v5 uv_tex:self->_uv_fwd_tex[1][self->_nscales + 9]];
    }
    [(LKTFlowGPU *)self _createImagePyramidWithCommandBuffer:v5 in_tex:v4 I_idx:self->_current_frame_index];
    [v5 commit];

    self->_current_frame_index ^= 1u;
    if (self->_streamFrameCount >= 1)
    {
      if ([(LKTFlowGPU *)self isBidirectional]) {
        [(LKTFlowGPU *)self _computeOpticalFlowBidirectional];
      }
      else {
        [(LKTFlowGPU *)self _computeOpticalFlow];
      }
    }
    int v6 = 0;
    ++self->_streamFrameCount;
  }
  else
  {
    int v6 = -12782;
  }

  return v6;
}

- (int)computeKeypointsFromForwardFlow:(__CVBuffer *)a3 backwardFlow:(__CVBuffer *)a4 bidirectionalError:(float)a5 blockSize:(int)a6 outNumKeypoints:(unsigned __int16 *)a7
{
  uint64_t v8 = *(void *)&a6;
  v12 = [(FigMetalContext *)self->_mtlContext bindPixelBufferToMTL2DTexture:a3 pixelFormat:65 usage:7 plane:0];
  v13 = [(FigMetalContext *)self->_mtlContext bindPixelBufferToMTL2DTexture:a4 pixelFormat:65 usage:7 plane:0];
  *(float *)&double v14 = a5;
  LODWORD(a7) = [(LKTFlowGPU *)self computeKeypointsFromTexForwardFlow:v12 backwardFlow:v13 bidirectionalError:v8 blockSize:a7 outNumKeypoints:v14];

  return (int)a7;
}

- (int)computeKeypointsFromTexForwardFlow:(id)a3 backwardFlow:(id)a4 bidirectionalError:(float)a5 blockSize:(int)a6 outNumKeypoints:(unsigned __int16 *)a7
{
  uint64_t v8 = *(void *)&a6;
  commandQueue = self->_commandQueue;
  id v13 = a4;
  id v14 = a3;
  v15 = [(MTLCommandQueue *)commandQueue commandBuffer];
  [v15 setLabel:@"LKT::KeypointsFromFlow"];
  *(float *)&double v16 = a5;
  [(LKTFlowGPU *)self _enqueueKeypointsFromFlowWithCommandBuffer:v15 in_uv_fwd_tex:v14 in_uv_bwd_tex:v13 out_kpt_buf:self->_kpt_buf block_size:v8 bidirectional_error:a7 out_num_keypoints:v16];

  [v15 commit];
  return 0;
}

- (void)_setDefaultParameters
{
  self->_useNonLocalRegularization = 0;
  *(void *)&self->_nwarpings = 0x400000003;
  *(void *)&self->_nlreg_padding = 0x40C0000000000002;
  *(void *)&self->_nlreg_sigma_c = 0x3E80000040400000;
}

- (void)_initMemory:(int)a3 height:(int)a4 nscales:(int)a5
{
  int v6 = 0;
  self->_isValid = 0;
  if (a3 >= 8 && a4 >= 8)
  {
    int v6 = 0;
    int v7 = a4;
    int v8 = a3;
    do
    {
      int v9 = (v8 & 1) + v8;
      if (v9 >= 0) {
        int v10 = v9;
      }
      else {
        int v10 = v9 + 1;
      }
      int v11 = v10 >> 1;
      int v12 = v9 + 1;
      if (v11 >= 0) {
        int v13 = v11 & 1;
      }
      else {
        int v13 = -(v11 & 1);
      }
      int v14 = (v7 & 1) + v7;
      if (v14 >= 0) {
        int v15 = v14;
      }
      else {
        int v15 = v14 + 1;
      }
      int v16 = v15 >> 1;
      int v17 = v14 + 1;
      if (v16 >= 0) {
        int v18 = v16 & 1;
      }
      else {
        int v18 = -(v16 & 1);
      }
      int v19 = v12 + 2 * v13;
      int v8 = v19 >> 1;
      int v20 = v17 + 2 * v18;
      int v7 = v20 >> 1;
      ++v6;
    }
    while (v19 >= 16 && v20 > 15);
  }
  self->_ref_size.width = (double)a3;
  self->_ref_size.height = (double)a4;
  self->_aux_size.width = (double)a3;
  self->_aux_size.height = (double)a4;
  if (a5 >= 0) {
    int v22 = a5;
  }
  else {
    int v22 = v6;
  }
  self->_int nscales = v22;
  self->_maxThreadExecutionint Width = 0;
  self->_w_pxbuf = 0;
  *(_OWORD *)&self->_G0_pxbuf = 0u;
  *(_OWORD *)&self->_C0_pxbuf = 0u;
  uv_fwd_tex_user_ref = self->_uv_fwd_tex_user_ref;
  self->_uv_fwd_tex_user_ref = 0;

  *(void *)&self->_current_frame_index = 0;
  *(_OWORD *)self->_uv_fwd_pxbuf = 0u;
  *(_OWORD *)self->_uv_bwd_pxbuf = 0u;
  int nscales = self->_nscales;
  if (nscales > v6 || nscales >= 10)
  {
    id v25 = +[NSException exceptionWithName:@"Invalid parameter" reason:@"The number of scales specified is too large" userInfo:0];
    objc_exception_throw(v25);
  }
}

- (void)_setupPipelines
{
  uint64_t v3 = 0;
  computePipelines = self->_computePipelines;
  do
  {
    id v5 = [objc_alloc((Class)NSString) initWithUTF8String:(&off_18308)[v3]];
    int v6 = [(FigMetalContext *)self->_mtlContext computePipelineStateFor:v5 constants:0];
    objc_storeStrong((id *)&computePipelines[v3], v6);
    id v7 = [v6 threadExecutionWidth];
    maxThreadExecutionint Width = self->_maxThreadExecutionWidth;
    if (v7 > maxThreadExecutionWidth) {
      maxThreadExecutionint Width = [v6 threadExecutionWidth];
    }
    self->_maxThreadExecutionint Width = (unint64_t)maxThreadExecutionWidth;
    NSLog(@"%@::threadExecutionint Width = %d, maxTotalThreadsPerThreadgroup = %d", v5, [v6 threadExecutionWidth], objc_msgSend(v6, "maxTotalThreadsPerThreadgroup"));

    ++v3;
  }
  while (v3 != 11);
}

- (int)_setupBuffer
{
  int width = (int)self->_ref_size.width;
  int height = (int)self->_ref_size.height;
  double v5 = self->_aux_size.width;
  double v6 = self->_aux_size.height;
  maxThreadExecutionint Width = self->_maxThreadExecutionWidth;
  int v8 = (__CVBuffer *)sub_E918(width, height, 0x32433068u);
  self->_G0_pxbuf = v8;
  if (v8)
  {
    int v9 = (__CVBuffer *)sub_E918((int)v5, (int)v6, 0x32433068u);
    self->_G1_pxbuf = v9;
    if (v9)
    {
      int v10 = (__CVBuffer *)sub_E918(width, height, 0x52476841u);
      self->_C0_pxbuf = v10;
      if (v10)
      {
        int v11 = (__CVBuffer *)sub_E918((int)v5, (int)v6, 0x52476841u);
        self->_C1_pxbuf = v11;
        if (v11)
        {
          int v12 = (__CVBuffer *)sub_E918(width, height, 0x4C303068u);
          self->_w_pxbuf = v12;
          if (v12)
          {
            uint64_t v13 = 0;
            int v14 = (width + (int)maxThreadExecutionWidth - 1)
                / (int)maxThreadExecutionWidth
                * maxThreadExecutionWidth
                * height;
            Adiagb_buf = self->_Adiagb_buf;
            Ixy_buf = self->_Ixy_buf;
            uv_bwd_pxbuf = self->_uv_bwd_pxbuf;
            uv_fwd_pxbuf = self->_uv_fwd_pxbuf;
            char v17 = 1;
            while (1)
            {
              char v18 = v17;
              int v19 = [(FigMetalContext *)self->_mtlContext device];
              int v20 = (MTLBuffer *)[v19 newBufferWithLength:8 * v14 options:0];
              v21 = Adiagb_buf[v13];
              Adiagb_buf[v13] = v20;

              if (!Adiagb_buf[v13]) {
                break;
              }
              int v22 = [(FigMetalContext *)self->_mtlContext device];
              v23 = (MTLBuffer *)[v22 newBufferWithLength:2 * v14 options:0];
              v24 = Ixy_buf[v13];
              Ixy_buf[v13] = v23;

              if (!Ixy_buf[v13]) {
                break;
              }
              id v25 = (__CVBuffer *)sub_E918(width, height, 0x32433068u);
              uv_fwd_pxbuf[v13] = v25;
              if (!v25) {
                break;
              }
              v26 = (__CVBuffer *)sub_E918(width, height, 0x32433068u);
              uv_bwd_pxbuf[v13] = v26;
              if (!v26) {
                break;
              }
              char v17 = 0;
              uint64_t v13 = 1;
              if ((v18 & 1) == 0)
              {
                v27 = [(FigMetalContext *)self->_mtlContext device];
                v28 = (MTLBuffer *)[v27 newBufferWithLength:4 * v14 options:0];
                idt_buf = self->_idt_buf;
                self->_idt_buf = v28;

                if (!self->_idt_buf) {
                  return -12786;
                }
                if (self->_nscales < 1)
                {
LABEL_68:
                  v109 = [(LKTFlowGPU *)self newBufferWithPixelFormat:115 width:0x8000 data:0];
                  kpt_buf = self->_kpt_buf;
                  self->_kpt_buf = v109;

                  return 0;
                }
                uint64_t v30 = 0;
                int32x2_t v31 = vmovn_s64(vcvtq_s64_f64((float64x2_t)self->_aux_size));
                G1_tex = self->_G1_tex;
                G0_tex = self->_G0_tex;
                C1_tex = self->_C1_tex;
                C0_tex = self->_C0_tex;
                w_tex = self->_w_tex;
                int32x2_t v32 = vmovn_s64(vcvtq_s64_f64((float64x2_t)self->_ref_size));
                I_u32_alias_tex = self->_I_u32_alias_tex;
                I_tex = self->_I_tex;
                v112 = self->_I_u32_alias_tex[1];
                v113 = self->_I_tex[1];
LABEL_15:
                int v125 = v32.i32[0];
                double v33 = (double)v32.i32[0];
                int v127 = v32.i32[1];
                double v34 = (double)v32.i32[1];
                int v35 = v31.i32[0];
                double v36 = (double)v31.i32[0];
                int v37 = v31.i32[1];
                double v38 = (double)v31.i32[1];
                v39 = &self->_ref_pyr_size[v30];
                v39->int width = (double)v32.i32[0];
                v39->int height = (double)v32.i32[1];
                v40 = &self->_aux_pyr_size[v30];
                v40->int width = (double)v31.i32[0];
                v40->int height = (double)v31.i32[1];
                uint64_t v41 = -[FigMetalContext bindPixelBufferToMTL2DTexture:pixelFormat:usage:textureSize:plane:](self->_mtlContext, "bindPixelBufferToMTL2DTexture:pixelFormat:usage:textureSize:plane:", self->_G0_pxbuf, 65, 23, 0, (double)v32.i32[0], (double)v32.i32[1]);
                v42 = G0_tex[v30];
                G0_tex[v30] = (MTLTexture *)v41;

                if (G0_tex[v30])
                {
                  uint64_t v43 = -[FigMetalContext bindPixelBufferToMTL2DTexture:pixelFormat:usage:textureSize:plane:](self->_mtlContext, "bindPixelBufferToMTL2DTexture:pixelFormat:usage:textureSize:plane:", self->_G1_pxbuf, 65, 23, 0, v36, v38);
                  v44 = G1_tex[v30];
                  G1_tex[v30] = (MTLTexture *)v43;

                  if (G1_tex[v30])
                  {
                    uint64_t v45 = -[FigMetalContext bindPixelBufferToMTL2DTexture:pixelFormat:usage:textureSize:plane:](self->_mtlContext, "bindPixelBufferToMTL2DTexture:pixelFormat:usage:textureSize:plane:", self->_C0_pxbuf, 115, 23, 0, v33, v34);
                    v46 = C0_tex[v30];
                    C0_tex[v30] = (MTLTexture *)v45;

                    if (C0_tex[v30])
                    {
                      uint64_t v47 = -[FigMetalContext bindPixelBufferToMTL2DTexture:pixelFormat:usage:textureSize:plane:](self->_mtlContext, "bindPixelBufferToMTL2DTexture:pixelFormat:usage:textureSize:plane:", self->_C1_pxbuf, 115, 23, 0, v36, v38);
                      v48 = C1_tex[v30];
                      C1_tex[v30] = (MTLTexture *)v47;

                      if (C1_tex[v30])
                      {
                        int v122 = v35;
                        int v123 = v37;
                        uint64_t v49 = -[FigMetalContext bindPixelBufferToMTL2DTexture:pixelFormat:usage:textureSize:plane:](self->_mtlContext, "bindPixelBufferToMTL2DTexture:pixelFormat:usage:textureSize:plane:", self->_w_pxbuf, 25, 23, 0, v33, v34);
                        v50 = w_tex[v30];
                        w_tex[v30] = (MTLTexture *)v49;

                        uint64_t v51 = 0;
                        char v52 = 1;
                        while (1)
                        {
                          char v53 = v52;
                          uint64_t v54 = -[FigMetalContext bindPixelBufferToMTL2DTexture:pixelFormat:usage:textureSize:plane:](self->_mtlContext, "bindPixelBufferToMTL2DTexture:pixelFormat:usage:textureSize:plane:", uv_fwd_pxbuf[v51], 65, 23, 0, v33, v34);
                          v55 = (id *)&self->_uv_fwd_tex[v51][v30];
                          id v56 = *v55;
                          id *v55 = (id)v54;

                          if (!*v55) {
                            break;
                          }
                          uint64_t v57 = -[FigMetalContext bindPixelBufferToMTL2DTexture:pixelFormat:usage:textureSize:plane:](self->_mtlContext, "bindPixelBufferToMTL2DTexture:pixelFormat:usage:textureSize:plane:", uv_bwd_pxbuf[v51], 65, 23, 0, v33, v34);
                          v58 = (id *)&self->_uv_bwd_tex[v51][v30];
                          id v59 = *v58;
                          id *v58 = (id)v57;

                          if (!*v58) {
                            break;
                          }
                          v60 = (MTLTexture *)[*v55 newTextureViewWithPixelFormat:53];
                          uint64_t v61 = v51;
                          v62 = self->_uv_fwd_u32_alias_tex[v61];
                          v63 = v62[v30];
                          v62[v30] = v60;

                          v64 = (MTLTexture *)[*v58 newTextureViewWithPixelFormat:53];
                          v65 = self->_uv_bwd_u32_alias_tex[v61];
                          v66 = v65[v30];
                          v65[v30] = v64;

                          char v52 = 0;
                          uint64_t v51 = 1;
                          if ((v53 & 1) == 0)
                          {
                            v121 = +[MTLTextureDescriptor texture2DDescriptorWithPixelFormat:70 width:v125 height:v127 mipmapped:0];
                            [v121 setUsage:19];
                            v67 = [(FigMetalContext *)self->_mtlContext device];
                            v68 = (MTLTexture *)[v67 newTextureWithDescriptor:v121];
                            v69 = (*I_tex)[v30];
                            (*I_tex)[v30] = v68;

                            v70 = (MTLTexture *)[(MTLTexture *)(*I_tex)[v30] newTextureViewWithPixelFormat:53];
                            v71 = (*I_u32_alias_tex)[v30];
                            (*I_u32_alias_tex)[v30] = v70;

                            int v72 = v125 & 1;
                            if (v125 < 0) {
                              int v72 = -v72;
                            }
                            int v73 = v127 & 1;
                            if (v127 < 0) {
                              int v73 = -v73;
                            }
                            int v74 = v72 + v125;
                            if (v74 >= 0) {
                              int v75 = v74;
                            }
                            else {
                              int v75 = v74 + 1;
                            }
                            int v76 = v75 >> 1;
                            if (v76 >= 0) {
                              int v77 = v76 & 1;
                            }
                            else {
                              int v77 = -(v76 & 1);
                            }
                            int v78 = v73 + v127;
                            if (v78 >= 0) {
                              int v79 = v78;
                            }
                            else {
                              int v79 = v78 + 1;
                            }
                            int v80 = v79 >> 1;
                            if (v80 >= 0) {
                              int v81 = v80 & 1;
                            }
                            else {
                              int v81 = -(v80 & 1);
                            }
                            int v82 = v74 + 2 * v77;
                            if (v82 + 1 >= 0) {
                              int v83 = v82 + 1;
                            }
                            else {
                              int v83 = v82 + 2;
                            }
                            int v84 = v83 >> 1;
                            int v85 = v78 + 2 * v81;
                            if (v85 + 1 >= 0) {
                              int v86 = v85 + 1;
                            }
                            else {
                              int v86 = v85 + 2;
                            }
                            v87.i32[0] = v84;
                            v87.i32[1] = v86 >> 1;
                            int32x2_t v128 = v87;

                            v126 = +[MTLTextureDescriptor texture2DDescriptorWithPixelFormat:70 width:v122 height:v123 mipmapped:0];
                            [v126 setUsage:19];
                            v88 = [(FigMetalContext *)self->_mtlContext device];
                            v89 = (MTLTexture *)[v88 newTextureWithDescriptor:v126];
                            v90 = v113[v30];
                            v113[v30] = v89;

                            v91 = (MTLTexture *)[(MTLTexture *)v113[v30] newTextureViewWithPixelFormat:53];
                            v92 = v112[v30];
                            v112[v30] = v91;

                            int v93 = v122 & 1;
                            if (v122 < 0) {
                              int v93 = -v93;
                            }
                            int v94 = v123 & 1;
                            if (v123 < 0) {
                              int v94 = -v94;
                            }
                            int v95 = v93 + v122;
                            if (v95 >= 0) {
                              int v96 = v95;
                            }
                            else {
                              int v96 = v95 + 1;
                            }
                            int v97 = v96 >> 1;
                            if (v97 >= 0) {
                              int v98 = v97 & 1;
                            }
                            else {
                              int v98 = -(v97 & 1);
                            }
                            int v99 = v94 + v123;
                            if (v99 >= 0) {
                              int v100 = v99;
                            }
                            else {
                              int v100 = v99 + 1;
                            }
                            int v101 = v100 >> 1;
                            if (v101 >= 0) {
                              int v102 = v101 & 1;
                            }
                            else {
                              int v102 = -(v101 & 1);
                            }
                            int v103 = v95 + 2 * v98;
                            if (v103 + 1 >= 0) {
                              int v104 = v103 + 1;
                            }
                            else {
                              int v104 = v103 + 2;
                            }
                            int v105 = v104 >> 1;
                            int v106 = v99 + 2 * v102;
                            if (v106 + 1 >= 0) {
                              int v107 = v106 + 1;
                            }
                            else {
                              int v107 = v106 + 2;
                            }
                            v108.i32[0] = v105;
                            v108.i32[1] = v107 >> 1;
                            int32x2_t v124 = v108;

                            int32x2_t v31 = v124;
                            int32x2_t v32 = v128;
                            if (++v30 < self->_nscales) {
                              goto LABEL_15;
                            }
                            goto LABEL_68;
                          }
                        }
                      }
                    }
                  }
                }
                return -12786;
              }
            }
          }
        }
      }
    }
  }
  return -12786;
}

- (int)_computeOpticalFlow
{
  int nscales = self->_nscales;
  uint64_t v3 = (nscales - 1);
  if (nscales >= 1)
  {
    double v5 = 0;
    uint64_t v6 = 0;
    I_tex = self->_I_tex;
    G0_tex = self->_G0_tex;
    C0_tex = self->_C0_tex;
    G1_tex = self->_G1_tex;
    uv_fwd_tex = self->_uv_fwd_tex;
    p_uv_fwd_tex_user_ref = &self->_uv_fwd_tex_user_ref;
    C1_tex = self->_C1_tex;
    w_tex = self->_w_tex;
    I_u32_alias_tex = self->_I_u32_alias_tex;
    uv_fwd_u32_alias_tex = self->_uv_fwd_u32_alias_tex;
    int v8 = nscales - 1;
    do
    {
      int v9 = v5;
      int v10 = I_tex[self->_current_frame_index][v3];
      int v11 = I_tex[self->_current_frame_index ^ 1][v3];
      double v5 = [(MTLCommandQueue *)self->_commandQueue commandBuffer];

      int v12 = +[NSString stringWithFormat:@"LKT:ComputeFlow level %d", v3];
      [v5 setLabel:v12];

      [(LKTFlowGPU *)self _computeFeaturesWithCommandBuffer:v5 in_tex:v10 out_tex:G0_tex[v3]];
      [(LKTFlowGPU *)self _computeFeaturesWithCommandBuffer:v5 in_tex:v11 out_tex:G1_tex[v3]];
      [(LKTFlowGPU *)self _computeFeaturesDerivativesWithCommandBuffer:v5 in_tex:G0_tex[v3] out_tex:C0_tex[v3]];
      [(LKTFlowGPU *)self _computeFeaturesDerivativesWithCommandBuffer:v5 in_tex:G1_tex[v3] out_tex:C1_tex[v3]];
      int nwarpings = self->_nwarpings;
      if (nwarpings < 1)
      {
        int v15 = 0;
      }
      else
      {
        v26 = v11;
        v27 = v10;
        int v14 = 0;
        int v15 = 0;
        do
        {
          int v16 = v14 + 1;
          if (v3 || v16 != nwarpings || (char v17 = (id *)p_uv_fwd_tex_user_ref, self->_useNonLocalRegularization)) {
            char v17 = (id *)&uv_fwd_tex[v6 ^ 1][v3];
          }
          id v18 = *v17;
          if (self->_useNonLocalRegularization && v16 == self->_nwarpings)
          {
            int v19 = w_tex[v3];

            int v15 = v19;
          }
          [(LKTFlowGPU *)self _doSolverWithCommandBuffer:v5 scale:v3 in_uv_tex:uv_fwd_tex[v6][v8] in_G0_tex:G0_tex[v3] in_G1_tex:G1_tex[v3] in_C0_tex:C0_tex[v3] in_C1_tex:C1_tex[v3] out_uv_tex:v18 out_w_tex:v15];
          v6 ^= 1uLL;

          int nwarpings = self->_nwarpings;
          ++v14;
          int v8 = v3;
        }
        while (v14 < nwarpings);
        int v8 = v3;
        int v11 = v26;
        int v10 = v27;
      }
      if (self->_useNonLocalRegularization)
      {
        int v20 = &uv_fwd_tex[v6 ^ 1][v3];
        if (!v3) {
          int v20 = p_uv_fwd_tex_user_ref;
        }
        [(LKTFlowGPU *)self _doNLRegularizationWithCommandBuffer:v5 in_uv_tex:uv_fwd_u32_alias_tex[v6][v3] join_tex:I_u32_alias_tex[self->_current_frame_index][v3] w_tex:v15 out_uv_tex:*v20];
        v6 ^= 1uLL;
      }
      [v5 commit];
    }
    while (v3-- > 0);
  }
  return 0;
}

- (int)_computeOpticalFlowBidirectional
{
  id v2 = self;
  uint64_t v3 = self->_nscales - 1;
  uv_fwd_tex = self->_uv_fwd_tex;
  v55 = self->_uv_fwd_tex[0][v3];
  uv_bwd_tex = v2->_uv_bwd_tex;
  uint64_t v54 = v2->_uv_bwd_tex[0][v3];
  if (v2->_uv_bwd_tex_user_ref)
  {
    uint64_t nscales = v2->_nscales;
    if ((int)nscales < 1)
    {
      double v5 = 0;
    }
    else
    {
      double v5 = 0;
      uint64_t v6 = 0;
      I_tex = v2->_I_tex;
      G1_tex = v2->_G1_tex;
      G0_tex = v2->_G0_tex;
      C1_tex = v2->_C1_tex;
      C0_tex = v2->_C0_tex;
      p_uv_fwd_tex_user_ref = &v2->_uv_fwd_tex_user_ref;
      p_uv_bwd_tex_user_ref = &v2->_uv_bwd_tex_user_ref;
      int v35 = v2->_uv_bwd_tex[1];
      int v42 = v3;
      int v41 = v3;
      do
      {
        id v7 = v5;
        uint64_t v34 = nscales;
        uint64_t v8 = nscales - 1;
        int v9 = I_tex[v2->_current_frame_index][(nscales - 1)];
        int v10 = I_tex[v2->_current_frame_index ^ 1][v8];
        int v11 = [(MTLCommandQueue *)v2->_commandQueue commandBuffer];

        int v12 = +[NSString stringWithFormat:@"LKT:ComputeFlow level %d", v8];
        [v11 setLabel:v12];

        double v33 = v9;
        [(LKTFlowGPU *)v2 _computeFeaturesWithCommandBuffer:v11 in_tex:v9 out_tex:G0_tex[v8]];
        int32x2_t v32 = v10;
        [(LKTFlowGPU *)v2 _computeFeaturesWithCommandBuffer:v11 in_tex:v10 out_tex:G1_tex[v8]];
        [(LKTFlowGPU *)v2 _computeFeaturesDerivativesWithCommandBuffer:v11 in_tex:G0_tex[v8] out_tex:C0_tex[v8]];
        uint64_t v49 = v11;
        [(LKTFlowGPU *)v2 _computeFeaturesDerivativesWithCommandBuffer:v11 in_tex:G1_tex[v8] out_tex:C1_tex[v8]];
        uint64_t v48 = v8;
        if (v2->_nwarpings >= 1)
        {
          int v13 = 0;
          uint64_t v43 = v8;
          v39 = (id *)&(*uv_bwd_tex)[v8];
          do
          {
            if ((v13 + 1))
            {
              char v52 = G0_tex[v43];
              uint64_t v51 = G1_tex[v43];
              v50 = C0_tex[v43];
              int v14 = C1_tex[v43];
              id v25 = uv_fwd_tex[v6];
              int v15 = v25[v42];
              uint64_t v53 = v6 ^ 1;
              int v16 = uv_fwd_tex[v6 ^ 1][v43];
              uint64_t v17 = v48;
              if (v48) {
                BOOL v26 = 1;
              }
              else {
                BOOL v26 = v13 + 3 <= v2->_nwarpings;
              }
              v27 = (id *)&v25[v43];
              if (!v26) {
                v27 = (id *)p_uv_fwd_tex_user_ref;
              }
              id v28 = *v27;
              v21 = v2;
              int v22 = v54;
              v23 = (MTLTexture *)v28;

              v24 = v23;
              int v42 = v48;
              uint64_t v54 = v22;
            }
            else
            {
              char v52 = G1_tex[v43];
              uint64_t v51 = G0_tex[v43];
              v50 = C1_tex[v43];
              int v14 = C0_tex[v43];
              int v15 = (*uv_bwd_tex)[v41];
              int v16 = v35[v43];
              uint64_t v17 = v48;
              if (v48) {
                BOOL v18 = 1;
              }
              else {
                BOOL v18 = v13 + 3 <= v2->_nwarpings;
              }
              int v19 = (id *)p_uv_bwd_tex_user_ref;
              if (v18) {
                int v19 = v39;
              }
              id v20 = *v19;
              v21 = v2;
              int v22 = v55;
              v23 = (MTLTexture *)v20;

              uint64_t v53 = v6 ^ 1;
              int v41 = v48;
              uint64_t v54 = v23;
              v24 = v22;
            }
            v55 = v24;
            [(LKTFlowGPU *)v21 _enqueueFlowConsistencyWithCommandBuffer:v49 in_uv0_tex:v22 in_uv1_tex:v15 out_uv_tex:v16];
            [(LKTFlowGPU *)v21 _doSolverWithCommandBuffer:v49 scale:v17 in_uv_tex:v16 in_G0_tex:v52 in_G1_tex:v51 in_C0_tex:v50 in_C1_tex:v14 out_uv_tex:v23 out_w_tex:0];

            ++v13;
            id v2 = v21;
            uint64_t v6 = v53;
          }
          while (v13 < v21->_nwarpings);
        }
        double v5 = v49;
        [v49 commit];

        uint64_t nscales = v48;
      }
      while (v34 > 1);
    }
    int v29 = 0;
  }
  else
  {
    double v5 = 0;
    int v29 = -12780;
  }

  return v29;
}

- (int)_createImagePyramidWithCommandBuffer:(id)a3 in_tex:(id)a4 I_idx:(int)a5
{
  id v8 = a3;
  id v9 = a4;
  int v10 = v9;
  if (self->_needConversionBGRA2YUVA)
  {
    id v11 = [v8 computeCommandEncoder];
    [v11 setComputePipelineState:self->_computePipelines[0]];
    [v11 setTexture:v10 atIndex:0];
    [v11 setTexture:self->_I_tex[a5][0] atIndex:1];
    signed int v12 = [(MTLComputePipelineState *)self->_computePipelines[0] threadExecutionWidth];
    int v13 = (int)[(MTLComputePipelineState *)self->_computePipelines[0] maxTotalThreadsPerThreadgroup]/ v12;
    v46[0] = (int)(v12 + [v10 width] - 1) / v12;
    v46[1] = (int)(v13 + [v10 height] - 1) / v13;
    v46[2] = 1;
    v45[0] = v12;
    v45[1] = v13;
    v45[2] = 1;
    [v11 dispatchThreadgroups:v46 threadsPerThreadgroup:v45];
    [v11 endEncoding];
  }
  else
  {
    int v44 = a5;
    int v14 = self->_I_tex[a5][0];
    id v15 = v9;
    int v16 = v14;
    id v17 = v8;
    BOOL v18 = objc_opt_new();
    [v18 setNormalizedCoordinates:1];
    [v18 setMinFilter:1];
    [v18 setMagFilter:1];
    int v19 = [v15 device];
    id v20 = [v19 newSamplerStateWithDescriptor:v18];

    id v11 = v15;
    v21 = v16;
    id v22 = v20;
    id v23 = v17;
    if (!qword_1E508)
    {
      id v42 = v22;
      uint64_t v24 = objc_opt_new();
      uint64_t v43 = [v11 device];
      +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "#include <metal_stdlib>\nusing namespace metal;\n"
        "kernel void copyTexture(texture2d<float, access::sample> inputTexture [[texture(0)]],\n"
        "texture2d<float, access::write> outputTexture [[texture(1)]],\n"
        "sampler smp [[sampler(0)]],\n"
        "uint2 gid [[ thread_position_in_grid ]])\n"
        "{\n"
        "    float2 samplePos = (float2(gid) + 0.5) / float2(outputTexture.get_width(), outputTexture.get_height());\n"
        "    float4 color = inputTexture.sample(smp, samplePos);\n"
        "    outputTexture.write(color, gid);\n"
      id v25 = "}");
      id v50 = 0;
      int v41 = (void *)v24;
      id v26 = [v43 newLibraryWithSource:v25 options:v24 error:&v50];
      id v27 = v50;
      id v28 = (void *)qword_1E510;
      qword_1E510 = (uint64_t)v26;

      if (v27) {
        sub_10C58();
      }
      id v29 = [(id)qword_1E510 newFunctionWithName:@"copyTexture"];
      if (!v29) {
        sub_10C00();
      }
      uint64_t v30 = v29;
      int32x2_t v31 = [v11 device];
      id v32 = [v31 newComputePipelineStateWithFunction:v30 error:0];
      double v33 = (void *)qword_1E508;
      qword_1E508 = (uint64_t)v32;

      if (!qword_1E508) {
        sub_10C2C();
      }

      id v22 = v42;
    }
    [v23 setLabel:@"copyTexture"];
    uint64_t v34 = [v23 computeCommandEncoder];
    [v34 setComputePipelineState:qword_1E508];
    [v34 setTexture:v11 atIndex:0];
    [v34 setTexture:v21 atIndex:1];
    [v34 setSamplerState:v22 atIndex:0];
    v49[0] = [(MTLTexture *)v21 width];
    v49[1] = [(MTLTexture *)v21 height];
    v49[2] = 1;
    long long v47 = xmmword_13810;
    uint64_t v48 = 1;
    [v34 dispatchThreads:v49 threadsPerThreadgroup:&v47];
    [v34 endEncoding];

    a5 = v44;
  }

  if (self->_nscales >= 2)
  {
    uint64_t v35 = 0;
    do
    {
      double v36 = (char *)self + 80 * a5 + 8 * v35;
      uint64_t v37 = *((void *)v36 + 56);
      id v38 = *((id *)v36 + 55);
      [(LKTFlowGPU *)self _downscale2XWithCommandBuffer:v8 in_tex:v38 out_tex:v37];

      uint64_t v39 = v35 + 2;
      ++v35;
    }
    while (v39 < self->_nscales);
  }

  return 0;
}

- (int)_createImagePyramidWithCommandBuffer:(id)a3 in_pixelbuf:(__CVBuffer *)a4 I_idx:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  mtlContext = self->_mtlContext;
  id v9 = a3;
  int v10 = [(FigMetalContext *)mtlContext bindPixelBufferToMTL2DTexture:a4 pixelFormat:70 usage:7 plane:0];
  LODWORD(v5) = [(LKTFlowGPU *)self _createImagePyramidWithCommandBuffer:v9 in_tex:v10 I_idx:v5];

  return v5;
}

- (int)_zeroFlowWithCommandBuffer:(id)a3 uv_tex:(id)a4
{
  id v6 = a4;
  id v7 = [a3 computeCommandEncoder];
  [v7 setComputePipelineState:self->_computePipelines[1]];
  [v7 setTexture:v6 atIndex:0];
  signed int v8 = [(MTLComputePipelineState *)self->_computePipelines[1] threadExecutionWidth];
  int v9 = (int)[(MTLComputePipelineState *)self->_computePipelines[1] maxTotalThreadsPerThreadgroup]/ v8;
  int v10 = (int)(v8 + [v6 width] - 1) / v8;
  LODWORD(self) = [v6 height];

  v13[0] = v10;
  v13[1] = (v9 + (int)self - 1) / v9;
  v13[2] = 1;
  v12[0] = v8;
  v12[1] = v9;
  v12[2] = 1;
  [v7 dispatchThreadgroups:v13 threadsPerThreadgroup:v12];
  [v7 endEncoding];

  return 0;
}

- (int)_downscale2XWithCommandBuffer:(id)a3 in_tex:(id)a4 out_tex:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  int v10 = [a3 computeCommandEncoder];
  [v10 setComputePipelineState:self->_computePipelines[2]];
  [v10 setTexture:v9 atIndex:0];

  [v10 setTexture:v8 atIndex:1];
  LODWORD(a3) = [(MTLComputePipelineState *)self->_computePipelines[2] threadExecutionWidth];
  int v11 = (int)[(MTLComputePipelineState *)self->_computePipelines[2] maxTotalThreadsPerThreadgroup]/ (int)a3;
  int v12 = (int)(a3 + [v8 width] - 1) / (int)a3;
  LODWORD(self) = [v8 height];

  v15[0] = v12;
  v15[1] = (v11 + (int)self - 1) / v11;
  v15[2] = 1;
  v14[0] = (int)a3;
  v14[1] = v11;
  v14[2] = 1;
  [v10 dispatchThreadgroups:v15 threadsPerThreadgroup:v14];
  [v10 endEncoding];

  return 0;
}

- (int)_computeFeaturesWithCommandBuffer:(id)a3 in_tex:(id)a4 out_tex:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  int v10 = [a3 computeCommandEncoder];
  [v10 setComputePipelineState:self->_computePipelines[3]];
  [v10 setTexture:v9 atIndex:0];
  [v10 setTexture:v8 atIndex:1];

  LODWORD(a3) = [(MTLComputePipelineState *)self->_computePipelines[3] threadExecutionWidth];
  LODWORD(v8) = (int)[(MTLComputePipelineState *)self->_computePipelines[3] maxTotalThreadsPerThreadgroup]/ (int)a3;
  int v11 = (int)(a3 + [v9 width] - 1) / (int)a3;
  LODWORD(self) = [v9 height];

  v14[0] = v11;
  v14[1] = ((int)v8 + (int)self - 1) / (int)v8;
  v14[2] = 1;
  v13[0] = (int)a3;
  v13[1] = (int)v8;
  v13[2] = 1;
  [v10 dispatchThreadgroups:v14 threadsPerThreadgroup:v13];
  [v10 endEncoding];

  return 0;
}

- (int)_computeFeaturesDerivativesWithCommandBuffer:(id)a3 in_tex:(id)a4 out_tex:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  int v10 = [a3 computeCommandEncoder];
  [v10 setComputePipelineState:self->_computePipelines[4]];
  [v10 setTexture:v9 atIndex:0];
  [v10 setTexture:v8 atIndex:1];

  LODWORD(a3) = [(MTLComputePipelineState *)self->_computePipelines[4] threadExecutionWidth];
  LODWORD(v8) = (int)[(MTLComputePipelineState *)self->_computePipelines[4] maxTotalThreadsPerThreadgroup]/ (int)a3;
  int v11 = (int)(a3 + [v9 width] - 1) / (int)a3;
  LODWORD(self) = [v9 height];

  v14[0] = v11;
  v14[1] = ((int)v8 + (int)self - 1) / (int)v8;
  v14[2] = 1;
  v13[0] = (int)a3;
  v13[1] = (int)v8;
  v13[2] = 1;
  [v10 dispatchThreadgroups:v14 threadsPerThreadgroup:v13];
  [v10 endEncoding];

  return 0;
}

- (int)_doSolverWithCommandBuffer:(id)a3 scale:(int)a4 in_uv_tex:(id)a5 in_G0_tex:(id)a6 in_G1_tex:(id)a7 in_C0_tex:(id)a8 in_C1_tex:(id)a9 out_uv_tex:(id)a10 out_w_tex:(id)a11
{
  id v41 = a11;
  id v17 = a10;
  id v39 = a9;
  id v38 = a8;
  id v18 = a7;
  id v19 = a6;
  id v20 = a5;
  id v21 = a3;
  LODWORD(a3) = [v17 width];
  unsigned int v22 = [v17 height];
  int v40 = a3 - 1;
  LODWORD(a6) = ((int)a3 - 1 + LODWORD(self->_maxThreadExecutionWidth))
              / SLODWORD(self->_maxThreadExecutionWidth)
              * LODWORD(self->_maxThreadExecutionWidth);
  v55[0] = 1065353216;
  __asm { FMOV            V0.2S, #1.0 }
  uint64_t v54 = _D0;
  +[LKTFlowGPU _computeScalingFactor:v20 dst_tex:v17 scale_xy_inv:&v54 coeff:v55];
  v48[0] = a3;
  v48[1] = v22;
  uint64_t v49 = a6;
  uint64_t v50 = v54;
  uint64_t v51 = 0;
  id v28 = (const float *)v55;
  float32x2_t v29 = vld1_dup_f32(v28);
  float32x2_t v52 = v29;
  uint64_t v53 = 0;
  uint64_t v30 = [v21 computeCommandEncoder];
  [v30 setComputePipelineState:self->_computePipelines[5]];
  [v30 setTexture:v20 atIndex:0];
  [v30 setTexture:v19 atIndex:1];

  [v30 setTexture:v18 atIndex:2];
  [v30 setTexture:v38 atIndex:3];

  [v30 setTexture:v39 atIndex:4];
  [v30 setBuffer:self->_Adiagb_buf[0] offset:0 atIndex:0];
  [v30 setBuffer:self->_Ixy_buf[0] offset:0 atIndex:1];
  [v30 setBuffer:self->_idt_buf offset:0 atIndex:2];
  [v30 setBytes:v48 length:48 atIndex:3];
  LODWORD(v19) = [(MTLComputePipelineState *)self->_computePipelines[5] threadExecutionWidth];
  signed int v31 = [(MTLComputePipelineState *)self->_computePipelines[5] maxTotalThreadsPerThreadgroup];
  v47[0] = (v40 + (int)v19) / (int)v19;
  v47[1] = (int)(v22 - 1 + v31 / (int)v19) / (v31 / (int)v19);
  v47[2] = 1;
  v46[0] = (int)v19;
  v46[1] = v31 / (int)v19;
  v46[2] = 1;
  [v30 dispatchThreadgroups:v47 threadsPerThreadgroup:v46];
  [v30 endEncoding];

  id v32 = v21;
  double v33 = [v21 computeCommandEncoder];
  [v33 setComputePipelineState:self->_computePipelines[6]];
  [v33 setBuffer:self->_Adiagb_buf[0] offset:0 atIndex:0];
  [v33 setBuffer:self->_Ixy_buf[0] offset:0 atIndex:1];
  [v33 setBuffer:self->_Adiagb_buf[1] offset:0 atIndex:2];
  [v33 setBuffer:self->_Ixy_buf[1] offset:0 atIndex:3];
  [v33 setBytes:v48 length:48 atIndex:4];
  LODWORD(v19) = [(MTLComputePipelineState *)self->_computePipelines[6] threadExecutionWidth];
  signed int v34 = [(MTLComputePipelineState *)self->_computePipelines[6] maxTotalThreadsPerThreadgroup];
  v45[0] = (v40 + (int)v19) / (int)v19;
  v45[1] = (int)(v22 - 1 + v34 / (int)v19) / (v34 / (int)v19);
  v45[2] = 1;
  v44[0] = (int)v19;
  v44[1] = v34 / (int)v19;
  v44[2] = 1;
  [v33 dispatchThreadgroups:v45 threadsPerThreadgroup:v44];
  [v33 endEncoding];

  uint64_t v35 = [v32 computeCommandEncoder];

  [v35 setComputePipelineState:self->_computePipelines[7]];
  [v35 setBuffer:self->_Adiagb_buf[1] offset:0 atIndex:0];
  [v35 setBuffer:self->_Ixy_buf[1] offset:0 atIndex:1];
  [v35 setBuffer:self->_idt_buf offset:0 atIndex:2];
  [v35 setTexture:v20 atIndex:0];

  [v35 setTexture:v17 atIndex:1];
  [v35 setTexture:v41 atIndex:2];

  [v35 setBytes:v48 length:48 atIndex:3];
  LODWORD(v19) = [(MTLComputePipelineState *)self->_computePipelines[7] threadExecutionWidth];
  signed int v36 = [(MTLComputePipelineState *)self->_computePipelines[7] maxTotalThreadsPerThreadgroup];
  v43[0] = (v40 + (int)v19) / (int)v19;
  v43[1] = (int)(v22 - 1 + v36 / (int)v19) / (v36 / (int)v19);
  v43[2] = 1;
  v42[0] = (int)v19;
  v42[1] = v36 / (int)v19;
  v42[2] = 1;
  [v35 dispatchThreadgroups:v43 threadsPerThreadgroup:v42];
  [v35 endEncoding];

  return 0;
}

- (int)_enqueueFlowConsistencyWithCommandBuffer:(id)a3 in_uv0_tex:(id)a4 in_uv1_tex:(id)a5 out_uv_tex:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  LODWORD(a5) = [v10 width];
  unsigned int v14 = [v10 height];
  __asm { FMOV            V0.2S, #1.0 }
  uint64_t v36 = _D0;
  uint64_t v37 = _D0;
  int v35 = 1065353216;
  int v34 = 1065353216;
  +[LKTFlowGPU _computeScalingFactor:v12 dst_tex:v10 scale_xy_inv:&v37 coeff:&v35];
  +[LKTFlowGPU _computeScalingFactor:v11 dst_tex:v10 scale_xy_inv:&v36 coeff:&v34];
  uint64_t v29 = 0;
  v28[0] = a5;
  v28[1] = v14;
  uint64_t v30 = v37;
  uint64_t v31 = v36;
  id v20 = (const float *)&v35;
  float32x2_t v21 = vld1_dup_f32(v20);
  float32x2_t v22 = vld1_dup_f32((const float *)&v34);
  float32x2_t v32 = v21;
  float32x2_t v33 = v22;
  id v23 = [v13 computeCommandEncoder];

  [v23 setComputePipelineState:self->_computePipelines[8]];
  [v23 setTexture:v12 atIndex:0];

  [v23 setTexture:v11 atIndex:1];
  [v23 setTexture:v10 atIndex:2];
  [v23 setBytes:v28 length:48 atIndex:0];
  LODWORD(v11) = [(MTLComputePipelineState *)self->_computePipelines[8] threadExecutionWidth];
  LODWORD(v13) = (int)[(MTLComputePipelineState *)self->_computePipelines[8] maxTotalThreadsPerThreadgroup]/ (int)v11;
  int v24 = (int)(v11 + [v10 width] - 1) / (int)v11;
  LODWORD(self) = [v10 height];

  v27[0] = v24;
  v27[1] = ((int)v13 + (int)self - 1) / (int)v13;
  v27[2] = 1;
  v26[0] = (int)v11;
  v26[1] = (int)v13;
  v26[2] = 1;
  [v23 dispatchThreadgroups:v27 threadsPerThreadgroup:v26];
  [v23 endEncoding];

  return 0;
}

- (int)_enqueueKeypointsFromFlowWithCommandBuffer:(id)a3 in_uv_fwd_tex:(id)a4 in_uv_bwd_tex:(id)a5 out_kpt_buf:(id)a6 block_size:(int)a7 bidirectional_error:(float)a8 out_num_keypoints:(unsigned __int16 *)a9
{
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a3;
  int v20 = (int)[v16 width] / a7;
  int v21 = (int)[v16 height] / a7;
  int v29 = a7;
  __int16 v31 = v21;
  __int16 v30 = v20;
  uint64_t v32 = LODWORD(a8);
  float32x2_t v22 = [v19 computeCommandEncoder];

  if (v21 * v20 > 0x8000)
  {
    int v25 = -12780;
  }
  else
  {
    [v22 setComputePipelineState:self->_computePipelines[9]];
    [v22 setTexture:v16 atIndex:0];
    [v22 setTexture:v17 atIndex:1];
    [v22 setBuffer:v18 offset:0 atIndex:0];
    [v22 setBytes:&v29 length:16 atIndex:1];
    signed int v23 = [(MTLComputePipelineState *)self->_computePipelines[9] threadExecutionWidth];
    signed int v24 = [(MTLComputePipelineState *)self->_computePipelines[9] maxTotalThreadsPerThreadgroup];
    v28[0] = (v20 + v23 - 1) / v23;
    v28[1] = (v21 + v24 / v23 - 1) / (v24 / v23);
    _DWORD v28[2] = 1;
    v27[0] = v23;
    v27[1] = v24 / v23;
    v27[2] = 1;
    [v22 dispatchThreadgroups:v28 threadsPerThreadgroup:v27];
    [v22 endEncoding];
    int v25 = 0;
    *a9 = v21 * v20;
  }

  return v25;
}

- (int)_doNLRegularizationWithCommandBuffer:(id)a3 in_uv_tex:(id)a4 join_tex:(id)a5 w_tex:(id)a6 out_uv_tex:(id)a7
{
  v35[1] = 0;
  float32x2_t v12 = *(float32x2_t *)&self->_nlreg_sigma_l;
  v35[0] = *(void *)&self->_nlreg_radius;
  float32x2_t v13 = vadd_f32(v12, v12);
  __asm { FMOV            V1.2S, #1.0 }
  *(float32x2_t *)&long long v19 = vdiv_f32(_D1, v13);
  DWORD2(v19) = DWORD1(v19);
  *((float *)&v19 + 3) = 1.0 / (float)(self->_nlreg_sigma_w + self->_nlreg_sigma_w);
  long long v36 = v19;
  id v20 = a7;
  id v21 = a6;
  id v22 = a5;
  id v23 = a4;
  signed int v24 = [a3 computeCommandEncoder];
  [v24 setComputePipelineState:self->_computePipelines[10]];
  [v24 setTexture:v23 atIndex:0];
  [v24 setTexture:v22 atIndex:1];

  [v24 setTexture:v21 atIndex:2];
  [v24 setTexture:v20 atIndex:3];

  [v24 setBytes:v35 length:32 atIndex:0];
  signed int v25 = [(MTLComputePipelineState *)self->_computePipelines[10] threadExecutionWidth];
  int v26 = (int)[(MTLComputePipelineState *)self->_computePipelines[10] maxTotalThreadsPerThreadgroup]/ v25;
  int v27 = [v23 width];
  if (v27 >= 0) {
    int v28 = v27;
  }
  else {
    int v28 = v27 + 1;
  }
  int v29 = (v25 + (v28 >> 1) - 1) / v25;
  int v30 = [v23 height];

  if (v30 >= 0) {
    int v31 = v30;
  }
  else {
    int v31 = v30 + 1;
  }
  v34[0] = v29;
  v34[1] = (v26 + (v31 >> 1) - 1) / v26;
  v34[2] = 1;
  v33[0] = v25;
  v33[1] = v26;
  v33[2] = 1;
  [v24 dispatchThreadgroups:v34 threadsPerThreadgroup:v33];
  [v24 endEncoding];

  return 0;
}

+ (void)_computeScalingFactor:(id)a1 dst_tex:(SEL)a2 scale_xy_inv:(id)a3 coeff:(id)a4
{
  id v6 = v5;
  id v7 = v4;
  id v25 = a3;
  id v9 = a4;
  float v10 = (float)(unint64_t)[v9 width];
  float v11 = v10 / (float)(unint64_t)[v25 width];
  id v12 = [v9 height];
  id v13 = [v25 height];
  LODWORD(v14) = 1.5;
  *(float *)&double v15 = (float)(unint64_t)v12 / (float)(unint64_t)v13;
  if (v11 <= 1.5 || *(float *)&v15 <= 1.5)
  {
    id v17 = objc_msgSend(v9, "width", v14, v15);
    if (v17 != [v25 width] || (id v18 = objc_msgSend(v9, "height"), v18 != objc_msgSend(v25, "height"))) {
      sub_10C84();
    }
    __asm { FMOV            V0.2S, #1.0 }
    float v24 = 1.0;
  }
  else
  {
    _D0 = 0x3F0000003F000000;
    float v24 = 2.0;
  }
  *id v6 = v24;
  *id v7 = _D0;
}

- (id)newBufferWithPixelFormat:(unint64_t)a3 width:(int)a4 data:(const void *)a5
{
  uint64_t v7 = [(LKTFlowGPU *)self bytesPerPixelForTextureFormat:a3] * a4;
  id v8 = [(FigMetalContext *)self->_mtlContext device];
  id v9 = v8;
  if (a5) {
    id v10 = [v8 newBufferWithBytes:a5 length:v7 options:0];
  }
  else {
    id v10 = [v8 newBufferWithLength:v7 options:0];
  }
  float v11 = v10;

  return v11;
}

- (unint64_t)bytesPerPixelForTextureFormat:(unint64_t)a3
{
  unint64_t result = 1;
  switch(a3)
  {
    case 0xAuLL:
    case 0xCuLL:
    case 0xDuLL:
    case 0xEuLL:
      return result;
    case 0xBuLL:
    case 0xFuLL:
    case 0x10uLL:
    case 0x11uLL:
    case 0x12uLL:
    case 0x13uLL:
    case 0x15uLL:
    case 0x1AuLL:
    case 0x1BuLL:
    case 0x1CuLL:
    case 0x1DuLL:
    case 0x1FuLL:
    case 0x23uLL:
    case 0x24uLL:
    case 0x25uLL:
    case 0x26uLL:
    case 0x27uLL:
    case 0x28uLL:
    case 0x29uLL:
    case 0x2AuLL:
    case 0x2CuLL:
    case 0x2DuLL:
    case 0x2EuLL:
    case 0x2FuLL:
    case 0x30uLL:
    case 0x31uLL:
    case 0x32uLL:
    case 0x33uLL:
    case 0x34uLL:
    case 0x38uLL:
    case 0x39uLL:
    case 0x3AuLL:
    case 0x3BuLL:
    case 0x3DuLL:
    case 0x42uLL:
    case 0x43uLL:
    case 0x44uLL:
    case 0x45uLL:
    case 0x4BuLL:
    case 0x4CuLL:
    case 0x4DuLL:
    case 0x4EuLL:
    case 0x4FuLL:
      goto LABEL_12;
    case 0x14uLL:
    case 0x16uLL:
    case 0x17uLL:
    case 0x18uLL:
    case 0x19uLL:
    case 0x1EuLL:
    case 0x20uLL:
    case 0x21uLL:
    case 0x22uLL:
    case 0x2BuLL:
      return 2;
    case 0x35uLL:
    case 0x36uLL:
    case 0x37uLL:
    case 0x3CuLL:
    case 0x3EuLL:
    case 0x3FuLL:
    case 0x40uLL:
    case 0x41uLL:
    case 0x46uLL:
    case 0x47uLL:
    case 0x48uLL:
    case 0x49uLL:
    case 0x4AuLL:
    case 0x50uLL:
    case 0x51uLL:
      return 4;
    default:
      char v4 = a3 - 90;
      if (a3 - 90 > 0x23) {
        goto LABEL_11;
      }
      if (((1 << v4) & 0x3D0E000) != 0) {
        return 8;
      }
      if (((1 << v4) & 0xF) != 0) {
        return 4;
      }
      if (((1 << v4) & 0xE00000000) != 0) {
        return 16;
      }
LABEL_11:
      if (a3 != 1)
      {
LABEL_12:
        NSLog(@"Unidentified Metal format", a2);
        return 0;
      }
      return result;
  }
}

- (BOOL)isValid
{
  return self->_isValid;
}

- (BOOL)needConversionBGRA2YUVA
{
  return self->_needConversionBGRA2YUVA;
}

- (void)setNeedConversionBGRA2YUVA:(BOOL)a3
{
  self->_needConversionBGRA2YUVA = a3;
}

- (CGSize)ref_size
{
  double width = self->_ref_size.width;
  double height = self->_ref_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGSize)aux_size
{
  double width = self->_aux_size.width;
  double height = self->_aux_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (int)nscales
{
  return self->_nscales;
}

- (int)streamFrameCount
{
  return self->_streamFrameCount;
}

- (int)nwarpings
{
  return self->_nwarpings;
}

- (void)setNwarpings:(int)a3
{
  self->_int nwarpings = a3;
}

- (BOOL)useNonLocalRegularization
{
  return self->_useNonLocalRegularization;
}

- (void)setUseNonLocalRegularization:(BOOL)a3
{
  self->_useNonLocalRegularization = a3;
}

- (int)nlreg_radius
{
  return self->_nlreg_radius;
}

- (void)setNlreg_radius:(int)a3
{
  self->_nlreg_radius = a3;
}

- (int)nlreg_padding
{
  return self->_nlreg_padding;
}

- (void)setNlreg_padding:(int)a3
{
  self->_nlreg_padding = a3;
}

- (float)nlreg_sigma_l
{
  return self->_nlreg_sigma_l;
}

- (void)setNlreg_sigma_l:(float)a3
{
  self->_nlreg_sigma_l = a3;
}

- (float)nlreg_sigma_c
{
  return self->_nlreg_sigma_c;
}

- (void)setNlreg_sigma_c:(float)a3
{
  self->_nlreg_sigma_c = a3;
}

- (float)nlreg_sigma_w
{
  return self->_nlreg_sigma_w;
}

- (void)setNlreg_sigma_w:(float)a3
{
  self->_nlreg_sigma_w = a3;
}

- (void)setIsBidirectional:(BOOL)a3
{
  self->_isBidirectional = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_kpt_buf, 0);
  objc_storeStrong((id *)&self->_uv_bwd_tex_user_ref, 0);
  objc_storeStrong((id *)&self->_uv_fwd_tex_user_ref, 0);
  for (uint64_t i = 0; i != -20; --i)
    objc_storeStrong((id *)&self->_uv_bwd_u32_alias_tex[1][i + 9], 0);
  for (uint64_t j = 0; j != -20; --j)
    objc_storeStrong((id *)&self->_uv_fwd_u32_alias_tex[1][j + 9], 0);
  for (uint64_t k = 0; k != -20; --k)
    objc_storeStrong((id *)&self->_uv_bwd_tex[1][k + 9], 0);
  for (uint64_t m = 0; m != -20; --m)
    objc_storeStrong((id *)&self->_uv_fwd_tex[1][m + 9], 0);
  for (uint64_t n = 0; n != -10; --n)
    objc_storeStrong((id *)&self->_w_tex[n + 9], 0);
  objc_storeStrong((id *)&self->_idt_buf, 0);
  for (iuint64_t i = 0; ii != -2; --ii)
    objc_storeStrong((id *)&self->_Ixy_buf[ii + 1], 0);
  for (juint64_t j = 0; jj != -2; --jj)
    objc_storeStrong((id *)&self->_Adiagb_buf[jj + 1], 0);
  for (kuint64_t k = 0; kk != -10; --kk)
    objc_storeStrong((id *)&self->_C1_tex[kk + 9], 0);
  for (muint64_t m = 0; mm != -10; --mm)
    objc_storeStrong((id *)&self->_C0_tex[mm + 9], 0);
  for (nuint64_t n = 0; nn != -10; --nn)
    objc_storeStrong((id *)&self->_G1_tex[nn + 9], 0);
  for (uint64_t i1 = 0; i1 != -10; --i1)
    objc_storeStrong((id *)&self->_G0_tex[i1 + 9], 0);
  for (uint64_t i2 = 0; i2 != -20; --i2)
    objc_storeStrong((id *)&self->_I_u32_alias_tex[1][i2 + 9], 0);
  for (uint64_t i3 = 0; i3 != -20; --i3)
    objc_storeStrong((id *)&self->_I_tex[1][i3 + 9], 0);
  for (uint64_t i4 = 104; i4 != 16; i4 -= 8)
    objc_storeStrong((id *)((char *)&self->super.isa + i4), 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);

  objc_storeStrong((id *)&self->_mtlContext, 0);
}

@end