@interface VisionCoreLKTSparseGPU
- (CGSize)ref_size;
- (CGSize)tgt_size;
- (MTLBuffer)keypointsStatus;
- (MTLBuffer)keypointsTarget;
- (VisionCoreLKTSparseGPU)initWithMetalContext:(id)a3 width:(int)a4 height:(int)a5 nscales:(int)a6;
- (int)_enqueueFeaturesDerivativesWithCommandBuffer:(id)a3 in_tex:(id)a4 out_tex:(id)a5;
- (int)_enqueueFeaturesWithCommandBuffer:(id)a3 in_tex:(id)a4 out_tex:(id)a5;
- (int)_enqueueImagePyramidWithCommandBuffer:(id)a3 inputTexture:(id)a4 index:(int)a5;
- (int)_enqueueMatchingBidirectionalWithCommandBuffer:(id)a3 in_f0_tex:(id)a4 in_f1_tex:(id)a5 in_f0_dxdy_tex:(id)a6 in_f1_dxdy_tex:(id)a7 in_kpts_buf:(id)a8 in_kptd_buf:(id)a9 out_kptd_buf:(id)a10 out_status_buf:(id)a11 bidirectional_error:(float)a12 num_keypoints:(unsigned __int16)a13 scale_kpts:(float)a14 scale_kptd:(float)a15;
- (int)_enqueueMatchingWithCommandBuffer:(id)a3 in_f0_tex:(id)a4 in_f1_tex:(id)a5 in_f0_dxdy_tex:(id)a6 in_kpts_buf:(id)a7 in_kptd_buf:(id)a8 out_kptd_buf:(id)a9 out_status_buf:(id)a10 num_keypoints:(unsigned __int16)a11 scale_kpts:(float)a12 scale_kptd:(float)a13;
- (int)_setupBuffer;
- (int)computeMatchingBidirectionalFromReferenceTexture:(id)a3 targetTexture:(id)a4 kptsBuffer:(id)a5 bidirectionalError:(float)a6 numKeypoints:(unsigned __int16)a7;
- (int)computeMatchingFromReferenceTexture:(id)a3 targetTexture:(id)a4 kptsBuffer:(id)a5 numKeypoints:(unsigned __int16)a6;
- (int)nscales;
- (void)_initMemory:(int)a3 height:(int)a4 nscales:(int)a5;
- (void)_setupPipelines;
- (void)dealloc;
- (void)waitUntilCompleted;
@end

@implementation VisionCoreLKTSparseGPU

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_status_buf, 0);
  objc_storeStrong((id *)&self->_kptd_buf, 0);
  for (uint64_t i = 0; i != -10; --i)
    objc_storeStrong((id *)&self->_F1_dxdy_tex[i + 9], 0);
  for (uint64_t j = 0; j != -10; --j)
    objc_storeStrong((id *)&self->_F0_dxdy_tex[j + 9], 0);
  for (uint64_t k = 0; k != -10; --k)
    objc_storeStrong((id *)&self->_F1_tex[k + 9], 0);
  for (uint64_t m = 0; m != -10; --m)
    objc_storeStrong((id *)&self->_F0_tex[m + 9], 0);
  for (uint64_t n = 0; n != -20; --n)
    objc_storeStrong((id *)&self->_I_tex[1][n + 9], 0);
  for (iuint64_t i = 64; ii != 16; ii -= 8)
    objc_storeStrong((id *)((char *)&self->super.isa + ii), 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);
  objc_storeStrong((id *)&self->_mtlContext, 0);
}

- (int)nscales
{
  return self->_nscales;
}

- (CGSize)tgt_size
{
  double width = self->_tgt_size.width;
  double height = self->_tgt_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGSize)ref_size
{
  double width = self->_ref_size.width;
  double height = self->_ref_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (int)_enqueueMatchingBidirectionalWithCommandBuffer:(id)a3 in_f0_tex:(id)a4 in_f1_tex:(id)a5 in_f0_dxdy_tex:(id)a6 in_f1_dxdy_tex:(id)a7 in_kpts_buf:(id)a8 in_kptd_buf:(id)a9 out_kptd_buf:(id)a10 out_status_buf:(id)a11 bidirectional_error:(float)a12 num_keypoints:(unsigned __int16)a13 scale_kpts:(float)a14 scale_kptd:(float)a15
{
  v39[0] = a13;
  *(float *)&v39[1] = a12;
  *(float *)&v39[2] = a14;
  *(float *)&v39[3] = a15;
  v21 = self->_computePipelines[5];
  id v34 = a11;
  id v33 = a10;
  id v32 = a9;
  id v22 = a8;
  id v23 = a7;
  id v24 = a6;
  id v25 = a5;
  id v26 = a4;
  id v27 = a3;
  unint64_t v28 = [(MTLComputePipelineState *)v21 maxTotalThreadsPerThreadgroup];
  v29 = [v27 computeCommandEncoder];

  [v29 setComputePipelineState:self->_computePipelines[5]];
  [v29 setTexture:v26 atIndex:0];

  [v29 setTexture:v25 atIndex:1];
  [v29 setTexture:v24 atIndex:2];

  [v29 setTexture:v23 atIndex:3];
  [v29 setBuffer:v22 offset:0 atIndex:0];

  [v29 setBuffer:v32 offset:0 atIndex:1];
  [v29 setBuffer:v33 offset:0 atIndex:2];

  [v29 setBuffer:v34 offset:0 atIndex:3];
  [v29 setBytes:v39 length:16 atIndex:4];
  unint64_t v37 = (v28 + a13 - 1) / v28;
  int64x2_t v38 = vdupq_n_s64(1uLL);
  unint64_t v35 = v28;
  int64x2_t v36 = v38;
  [v29 dispatchThreadgroups:&v37 threadsPerThreadgroup:&v35];
  [v29 endEncoding];

  return 0;
}

- (int)_enqueueMatchingWithCommandBuffer:(id)a3 in_f0_tex:(id)a4 in_f1_tex:(id)a5 in_f0_dxdy_tex:(id)a6 in_kpts_buf:(id)a7 in_kptd_buf:(id)a8 out_kptd_buf:(id)a9 out_status_buf:(id)a10 num_keypoints:(unsigned __int16)a11 scale_kpts:(float)a12 scale_kptd:(float)a13
{
  uint64_t v36 = a11;
  float v37 = a12;
  float v38 = a13;
  v20 = self->_computePipelines[4];
  id v31 = a10;
  id v30 = a9;
  id v29 = a8;
  id v21 = a7;
  id v22 = a6;
  id v23 = a5;
  id v24 = a4;
  id v25 = a3;
  unint64_t v26 = [(MTLComputePipelineState *)v20 maxTotalThreadsPerThreadgroup];
  id v27 = [v25 computeCommandEncoder];

  [v27 setComputePipelineState:self->_computePipelines[4]];
  [v27 setTexture:v24 atIndex:0];

  [v27 setTexture:v23 atIndex:1];
  [v27 setTexture:v22 atIndex:2];

  [v27 setBuffer:v21 offset:0 atIndex:0];
  [v27 setBuffer:v29 offset:0 atIndex:1];

  [v27 setBuffer:v30 offset:0 atIndex:2];
  [v27 setBuffer:v31 offset:0 atIndex:3];

  [v27 setBytes:&v36 length:16 atIndex:4];
  unint64_t v34 = (v26 + a11 - 1) / v26;
  int64x2_t v35 = vdupq_n_s64(1uLL);
  unint64_t v32 = v26;
  int64x2_t v33 = v35;
  [v27 dispatchThreadgroups:&v34 threadsPerThreadgroup:&v32];
  [v27 endEncoding];

  return 0;
}

- (int)_enqueueFeaturesDerivativesWithCommandBuffer:(id)a3 in_tex:(id)a4 out_tex:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  v10 = [a3 computeCommandEncoder];
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

- (int)_enqueueFeaturesWithCommandBuffer:(id)a3 in_tex:(id)a4 out_tex:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  v10 = [a3 computeCommandEncoder];
  [v10 setComputePipelineState:self->_computePipelines[2]];
  [v10 setTexture:v9 atIndex:0];
  [v10 setTexture:v8 atIndex:1];

  LODWORD(a3) = [(MTLComputePipelineState *)self->_computePipelines[2] threadExecutionWidth];
  LODWORD(v8) = (int)[(MTLComputePipelineState *)self->_computePipelines[2] maxTotalThreadsPerThreadgroup]/ (int)a3;
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

- (int)_enqueueImagePyramidWithCommandBuffer:(id)a3 inputTexture:(id)a4 index:(int)a5
{
  id v8 = a3;
  id v9 = a4;
  if ([v9 pixelFormat] == 10)
  {
    v10 = objc_msgSend(v8, "blitCommandEncoder", v9);
    [v10 copyFromTexture:v9 toTexture:self->_I_tex[a5][0]];
  }
  else
  {
    v10 = objc_msgSend(v8, "computeCommandEncoder", v9);
    [v10 setComputePipelineState:self->_computePipelines[0]];
    [v10 setTexture:v9 atIndex:0];
    [v10 setTexture:self->_I_tex[a5][0] atIndex:1];
    int v11 = [(MTLComputePipelineState *)self->_computePipelines[0] threadExecutionWidth];
    int v12 = (int)[(MTLComputePipelineState *)self->_computePipelines[0] maxTotalThreadsPerThreadgroup]/ v11;
    v32[0] = (int)(v11 + [v9 width] - 1) / v11;
    v32[1] = (int)(v12 + [v9 height] - 1) / v12;
    v32[2] = 1;
    v31[0] = v11;
    v31[1] = v12;
    v31[2] = 1;
    [v10 dispatchThreadgroups:v32 threadsPerThreadgroup:v31];
  }
  [v10 endEncoding];

  if (self->_nscales >= 2)
  {
    uint64_t v13 = 0;
    unint64_t v28 = (char *)self + 80 * a5;
    do
    {
      v14 = &v28[8 * v13];
      v15 = (void *)*((void *)v14 + 50);
      id v16 = *((id *)v14 + 51);
      id v17 = v15;
      v18 = [v8 computeCommandEncoder];
      [v18 setComputePipelineState:self->_computePipelines[1]];
      [v18 setTexture:v17 atIndex:0];
      [v18 setTexture:v16 atIndex:1];
      int v19 = [(MTLComputePipelineState *)self->_computePipelines[1] threadExecutionWidth];
      id v20 = v8;
      int v21 = (int)[(MTLComputePipelineState *)self->_computePipelines[1] maxTotalThreadsPerThreadgroup]/ v19;
      int v22 = (int)(v19 + [v16 width] - 1) / v19;
      int v23 = [v16 height];

      v30[0] = v22;
      v30[1] = (v21 + v23 - 1) / v21;
      v30[2] = 1;
      uint64_t v24 = v21;
      id v8 = v20;
      v29[0] = v19;
      v29[1] = v24;
      v29[2] = 1;
      [v18 dispatchThreadgroups:v30 threadsPerThreadgroup:v29];
      [v18 endEncoding];

      uint64_t v25 = v13 + 2;
      ++v13;
    }
    while (v25 < self->_nscales);
  }

  return 0;
}

- (int)_setupBuffer
{
  int width = (int)self->_ref_size.width;
  int height = (int)self->_ref_size.height;
  double v5 = self->_tgt_size.width;
  double v6 = self->_tgt_size.height;
  PixelBuffer = (__CVBuffer *)CreatePixelBuffer(width, height, 0x32433068u);
  self->_F0_pxbuf = PixelBuffer;
  if (PixelBuffer)
  {
    id v8 = (__CVBuffer *)CreatePixelBuffer((int)v5, (int)v6, 0x32433068u);
    self->_F1_pxbuf = v8;
    if (v8)
    {
      id v9 = (__CVBuffer *)CreatePixelBuffer(width, height, 0x52476841u);
      self->_F0_dxdy_pxbuf = v9;
      if (v9)
      {
        v10 = (__CVBuffer *)CreatePixelBuffer((int)v5, (int)v6, 0x52476841u);
        self->_F1_dxdy_pxbuf = v10;
        if (v10)
        {
          if (self->_nscales < 1) {
            return 0;
          }
          uint64_t v11 = 0;
          int32x2_t v12 = vmovn_s64(vcvtq_s64_f64((float64x2_t)self->_tgt_size));
          int32x2_t v13 = vmovn_s64(vcvtq_s64_f64((float64x2_t)self->_ref_size));
          v14 = self->_I_tex[1];
          for (uint64_t i = &self->_tgt_pyr_size[0].height; ; i += 2)
          {
            int v16 = v13.i32[0];
            double v17 = (double)v13.i32[0];
            int v18 = v13.i32[1];
            double v19 = (double)v13.i32[1];
            int v20 = v12.i32[0];
            double v21 = (double)v12.i32[0];
            int v22 = v12.i32[1];
            double v23 = (double)v12.i32[1];
            *(i - 21) = (double)v13.i32[0];
            *(i - 20) = (double)v13.i32[1];
            *(i - 1) = (double)v12.i32[0];
            *uint64_t i = (double)v12.i32[1];
            uint64_t v24 = -[VisionCoreMetalContext bindPixelBufferToMTL2DTexture:pixelFormat:textureSize:plane:](self->_mtlContext, "bindPixelBufferToMTL2DTexture:pixelFormat:textureSize:plane:", self->_F0_pxbuf, 65, 0, (double)v13.i32[0], (double)v13.i32[1], v73);
            uint64_t v25 = v14[12];
            v14[12] = (MTLTexture *)v24;

            if (!v14[12]) {
              break;
            }
            uint64_t v26 = -[VisionCoreMetalContext bindPixelBufferToMTL2DTexture:pixelFormat:textureSize:plane:](self->_mtlContext, "bindPixelBufferToMTL2DTexture:pixelFormat:textureSize:plane:", self->_F1_pxbuf, 65, 0, v21, v23);
            id v27 = v14[22];
            v14[22] = (MTLTexture *)v26;

            if (!v14[22]) {
              break;
            }
            uint64_t v28 = -[VisionCoreMetalContext bindPixelBufferToMTL2DTexture:pixelFormat:textureSize:plane:](self->_mtlContext, "bindPixelBufferToMTL2DTexture:pixelFormat:textureSize:plane:", self->_F0_dxdy_pxbuf, 115, 0, v17, v19);
            id v29 = v14[34];
            v14[34] = (MTLTexture *)v28;

            if (!v14[34]) {
              break;
            }
            uint64_t v30 = -[VisionCoreMetalContext bindPixelBufferToMTL2DTexture:pixelFormat:textureSize:plane:](self->_mtlContext, "bindPixelBufferToMTL2DTexture:pixelFormat:textureSize:plane:", self->_F1_dxdy_pxbuf, 115, 0, v21, v23);
            id v31 = v14[44];
            v14[44] = (MTLTexture *)v30;

            if (!v14[44]) {
              break;
            }
            unint64_t v32 = [MEMORY[0x263F12A50] texture2DDescriptorWithPixelFormat:10 width:v16 height:v18 mipmapped:0];
            [v32 setUsage:19];
            int64x2_t v33 = [(VisionCoreMetalContext *)self->_mtlContext device];
            uint64_t v34 = [v33 newTextureWithDescriptor:v32];
            int64x2_t v35 = *(v14 - 10);
            *(v14 - 10) = (MTLTexture *)v34;

            int v36 = v16 & 1;
            if (v16 < 0) {
              int v36 = -v36;
            }
            int v37 = v18 & 1;
            if (v18 < 0) {
              int v37 = -v37;
            }
            int v38 = v36 + v16;
            if (v38 >= 0) {
              int v39 = v38;
            }
            else {
              int v39 = v38 + 1;
            }
            int v40 = v39 >> 1;
            if (v40 >= 0) {
              int v41 = v40 & 1;
            }
            else {
              int v41 = -(v40 & 1);
            }
            int v42 = v37 + v18;
            if (v42 >= 0) {
              int v43 = v42;
            }
            else {
              int v43 = v42 + 1;
            }
            int v44 = v43 >> 1;
            if (v44 >= 0) {
              int v45 = v44 & 1;
            }
            else {
              int v45 = -(v44 & 1);
            }
            int v46 = v38 + 2 * v41;
            if (v46 + 1 >= 0) {
              int v47 = v46 + 1;
            }
            else {
              int v47 = v46 + 2;
            }
            int v48 = v47 >> 1;
            int v49 = v42 + 2 * v45;
            if (v49 + 1 >= 0) {
              int v50 = v49 + 1;
            }
            else {
              int v50 = v49 + 2;
            }
            v51.i32[0] = v48;
            v51.i32[1] = v50 >> 1;
            int32x2_t v74 = v51;

            v52 = [MEMORY[0x263F12A50] texture2DDescriptorWithPixelFormat:10 width:v20 height:v22 mipmapped:0];
            [v52 setUsage:19];
            v53 = [(VisionCoreMetalContext *)self->_mtlContext device];
            uint64_t v54 = [v53 newTextureWithDescriptor:v52];
            v55 = *v14;
            *v14++ = (MTLTexture *)v54;

            int v57 = v20 & 1;
            if (v20 < 0) {
              int v57 = -v57;
            }
            int v58 = v22 & 1;
            if (v22 < 0) {
              int v58 = -v58;
            }
            int v59 = v57 + v20;
            if (v59 >= 0) {
              int v60 = v59;
            }
            else {
              int v60 = v59 + 1;
            }
            int v61 = v60 >> 1;
            if (v61 >= 0) {
              int v62 = v61 & 1;
            }
            else {
              int v62 = -(v61 & 1);
            }
            int v63 = v58 + v22;
            if (v63 >= 0) {
              int v64 = v63;
            }
            else {
              int v64 = v63 + 1;
            }
            int v65 = v64 >> 1;
            if (v65 >= 0) {
              int v66 = v65 & 1;
            }
            else {
              int v66 = -(v65 & 1);
            }
            int v67 = v59 + 2 * v62;
            if (v67 + 1 >= 0) {
              int v68 = v67 + 1;
            }
            else {
              int v68 = v67 + 2;
            }
            int v69 = v68 >> 1;
            int v70 = v63 + 2 * v66;
            if (v70 + 1 >= 0) {
              int v71 = v70 + 1;
            }
            else {
              int v71 = v70 + 2;
            }
            LODWORD(v56) = v69;
            DWORD1(v56) = v71 >> 1;
            long long v73 = v56;

            int32x2_t v12 = (int32x2_t)v73;
            int32x2_t v13 = v74;
            if (++v11 >= self->_nscales) {
              return 0;
            }
          }
        }
      }
    }
  }
  return -12786;
}

- (void)_setupPipelines
{
  uint64_t v3 = 0;
  id v4 = 0;
  do
  {
    double v5 = v4;
    double v6 = (void *)[[NSString alloc] initWithUTF8String:kKernelNames[v3]];
    v7 = [(VisionCoreMetalContext *)self->_mtlContext library];
    id v12 = (id)[v7 newFunctionWithName:v6];

    id v8 = [(VisionCoreMetalContext *)self->_mtlContext device];
    id v9 = (void *)[v8 newComputePipelineStateWithFunction:v12 error:0];

    objc_storeStrong((id *)&self->_computePipelines[v3], v9);
    unint64_t v10 = [v9 threadExecutionWidth];
    unint64_t maxThreadExecutionWidth = self->_maxThreadExecutionWidth;
    if (v10 > maxThreadExecutionWidth) {
      unint64_t maxThreadExecutionWidth = [v9 threadExecutionWidth];
    }
    self->_unint64_t maxThreadExecutionWidth = maxThreadExecutionWidth;

    ++v3;
    id v4 = v12;
  }
  while (v3 != 6);
}

- (void)_initMemory:(int)a3 height:(int)a4 nscales:(int)a5
{
  int v5 = 0;
  if (a3 >= 8 && a4 >= 8)
  {
    int v5 = 0;
    int v6 = a4;
    int v7 = a3;
    do
    {
      int v8 = (v7 & 1) + v7;
      if (v8 >= 0) {
        int v9 = v8;
      }
      else {
        int v9 = v8 + 1;
      }
      int v10 = v9 >> 1;
      int v11 = v8 + 1;
      if (v10 >= 0) {
        int v12 = v10 & 1;
      }
      else {
        int v12 = -(v10 & 1);
      }
      int v13 = (v6 & 1) + v6;
      if (v13 >= 0) {
        int v14 = v13;
      }
      else {
        int v14 = v13 + 1;
      }
      int v15 = v14 >> 1;
      int v16 = v13 + 1;
      if (v15 >= 0) {
        int v17 = v15 & 1;
      }
      else {
        int v17 = -(v15 & 1);
      }
      int v18 = v11 + 2 * v12;
      int v7 = v18 >> 1;
      int v19 = v16 + 2 * v17;
      int v6 = v19 >> 1;
      ++v5;
    }
    while (v18 >= 16 && v19 > 15);
  }
  self->_ref_size.int width = (double)a3;
  self->_ref_size.int height = (double)a4;
  self->_tgt_size.int width = (double)a3;
  self->_tgt_size.int height = (double)a4;
  if (a5 >= 0) {
    int v21 = a5;
  }
  else {
    int v21 = v5;
  }
  self->_nscales = v21;
  self->_unint64_t maxThreadExecutionWidth = 0;
  if (v21 > v5 || v21 >= 10)
  {
    id v22 = [MEMORY[0x263EFF940] exceptionWithName:@"Invalid parameter" reason:@"The number of scales specified is too large" userInfo:0];
    objc_exception_throw(v22);
  }
}

- (int)computeMatchingBidirectionalFromReferenceTexture:(id)a3 targetTexture:(id)a4 kptsBuffer:(id)a5 bidirectionalError:(float)a6 numKeypoints:(unsigned __int16)a7
{
  uint64_t v7 = a7;
  v48[2] = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v46 = a5;
  v48[0] = [(VisionCoreMetalContext *)self->_mtlContext newBufferWithPixelFormat:65 width:v7 data:0];
  v48[1] = [(VisionCoreMetalContext *)self->_mtlContext newBufferWithPixelFormat:65 width:v7 data:0];
  __int16 v43 = v7;
  int v44 = [(VisionCoreMetalContext *)self->_mtlContext newBufferWithPixelFormat:1 width:v7 data:0];
  int v14 = [(MTLCommandQueue *)self->_commandQueue commandBuffer];
  [v14 setLabel:@"LKTSparse::Pyramid"];
  int v39 = v12;
  [(VisionCoreLKTSparseGPU *)self _enqueueImagePyramidWithCommandBuffer:v14 inputTexture:v12 index:0];
  int v38 = v13;
  [(VisionCoreLKTSparseGPU *)self _enqueueImagePyramidWithCommandBuffer:v14 inputTexture:v13 index:1];
  [v14 commit];
  uint64_t nscales = self->_nscales;
  if ((int)nscales < 1)
  {
    uint64_t v32 = 0;
  }
  else
  {
    uint64_t v16 = 0;
    F0_dxdy_tex = self->_F0_dxdy_tex;
    F1_dxdy_tex = self->_F1_dxdy_tex;
    int v18 = v14;
    F1_tex = self->_F1_tex;
    F0_tex = self->_F0_tex;
    do
    {
      uint64_t v19 = nscales - 1;
      int v20 = self->_I_tex[0][(nscales - 1)];
      int v47 = self->_I_tex[1][(nscales - 1)];
      uint64_t v45 = v16 ^ 1;
      id v21 = (id)v48[v16 ^ 1];
      id v22 = v46;
      float v23 = 1.0 / (float)(1 << (nscales - 1));
      if (nscales != self->_nscales)
      {
        id v22 = (void *)v48[v16];
        float v23 = 2.0;
      }
      uint64_t v24 = (nscales - 1);
      id v25 = v22;
      int v14 = [(MTLCommandQueue *)self->_commandQueue commandBuffer];

      uint64_t v26 = objc_msgSend(NSString, "stringWithFormat:", @"LKT::Matching level %d", nscales - 1);
      [v14 setLabel:v26];

      [(VisionCoreLKTSparseGPU *)self _enqueueFeaturesWithCommandBuffer:v14 in_tex:v20 out_tex:F0_tex[v24]];
      [(VisionCoreLKTSparseGPU *)self _enqueueFeaturesWithCommandBuffer:v14 in_tex:v47 out_tex:F1_tex[v24]];
      [(VisionCoreLKTSparseGPU *)self _enqueueFeaturesDerivativesWithCommandBuffer:v14 in_tex:F0_tex[v24] out_tex:F0_dxdy_tex[v24]];
      if (nscales == 1)
      {
        [(VisionCoreLKTSparseGPU *)self _enqueueFeaturesDerivativesWithCommandBuffer:v14 in_tex:F1_tex[v24] out_tex:F1_dxdy_tex[v24]];
        LOWORD(v37) = v43;
        *(float *)&double v29 = a6;
        *(float *)&double v30 = 1.0 / (float)(1 << v19);
        *(float *)&double v31 = v23;
        [(VisionCoreLKTSparseGPU *)self _enqueueMatchingBidirectionalWithCommandBuffer:v14 in_f0_tex:F0_tex[v24] in_f1_tex:F1_tex[v24] in_f0_dxdy_tex:F0_dxdy_tex[v24] in_f1_dxdy_tex:F1_dxdy_tex[v24] in_kpts_buf:v46 in_kptd_buf:v29 out_kptd_buf:v30 out_status_buf:v31 bidirectional_error:v25 num_keypoints:v21 scale_kpts:v44 scale_kptd:v37];
      }
      else
      {
        LOWORD(v36) = v43;
        *(float *)&double v27 = 1.0 / (float)(1 << v19);
        *(float *)&double v28 = v23;
        [(VisionCoreLKTSparseGPU *)self _enqueueMatchingWithCommandBuffer:v14 in_f0_tex:F0_tex[v24] in_f1_tex:F1_tex[v24] in_f0_dxdy_tex:F0_dxdy_tex[v24] in_kpts_buf:v46 in_kptd_buf:v25 out_kptd_buf:v27 out_status_buf:v28 num_keypoints:v21 scale_kpts:v44 scale_kptd:v36];
      }
      [v14 commit];

      --nscales;
      int v18 = v14;
      uint64_t v32 = v45;
      uint64_t v16 = v45;
    }
    while ((unint64_t)(v19 + 1) > 1);
  }

  objc_storeStrong((id *)&self->_kptd_buf, (id)v48[v32]);
  status_buf = self->_status_buf;
  self->_status_buf = v44;

  for (uint64_t i = 1; i != -1; --i)
  return 0;
}

- (int)computeMatchingFromReferenceTexture:(id)a3 targetTexture:(id)a4 kptsBuffer:(id)a5 numKeypoints:(unsigned __int16)a6
{
  uint64_t v6 = a6;
  v41[2] = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v39 = a5;
  v41[0] = [(VisionCoreMetalContext *)self->_mtlContext newBufferWithPixelFormat:65 width:v6 data:0];
  v41[1] = [(VisionCoreMetalContext *)self->_mtlContext newBufferWithPixelFormat:65 width:v6 data:0];
  __int16 v36 = v6;
  uint64_t v37 = [(VisionCoreMetalContext *)self->_mtlContext newBufferWithPixelFormat:1 width:v6 data:0];
  id v12 = [(MTLCommandQueue *)self->_commandQueue commandBuffer];
  [v12 setLabel:@"LKTSparse::Pyramid"];
  int64x2_t v35 = v10;
  [(VisionCoreLKTSparseGPU *)self _enqueueImagePyramidWithCommandBuffer:v12 inputTexture:v10 index:0];
  uint64_t v34 = v11;
  [(VisionCoreLKTSparseGPU *)self _enqueueImagePyramidWithCommandBuffer:v12 inputTexture:v11 index:1];
  [v12 commit];
  unint64_t nscales = self->_nscales;
  if ((int)nscales < 1)
  {
    uint64_t v29 = 0;
  }
  else
  {
    uint64_t v40 = 0;
    F0_tex = self->_F0_tex;
    F1_tex = self->_F1_tex;
    F0_dxdy_tex = self->_F0_dxdy_tex;
    int v17 = v12;
    do
    {
      int v18 = nscales - 1;
      uint64_t v19 = self->_I_tex[0][(nscales - 1)];
      int v20 = self->_I_tex[1][(nscales - 1)];
      commandQueue = self->_commandQueue;
      id v38 = (id)v41[v40 ^ 1];
      id v12 = [(MTLCommandQueue *)commandQueue commandBuffer];

      id v22 = objc_msgSend(NSString, "stringWithFormat:", @"LKT::Matching level %d", nscales - 1);
      [v12 setLabel:v22];

      [(VisionCoreLKTSparseGPU *)self _enqueueFeaturesWithCommandBuffer:v12 in_tex:v19 out_tex:F0_tex[(nscales - 1)]];
      [(VisionCoreLKTSparseGPU *)self _enqueueFeaturesWithCommandBuffer:v12 in_tex:v20 out_tex:F1_tex[(nscales - 1)]];
      [(VisionCoreLKTSparseGPU *)self _enqueueFeaturesDerivativesWithCommandBuffer:v12 in_tex:F0_tex[v18] out_tex:F0_dxdy_tex[v18]];
      float v23 = v39;
      float v24 = 1.0 / (float)(1 << (nscales - 1));
      if (nscales != self->_nscales)
      {
        float v23 = (void *)v41[v40];
        float v24 = 2.0;
      }
      id v25 = v23;
      F1_tex = self->_F1_tex;
      LOWORD(v33) = v36;
      *(float *)&double v26 = 1.0 / (float)(1 << v18);
      *(float *)&double v27 = v24;
      [(VisionCoreLKTSparseGPU *)self _enqueueMatchingWithCommandBuffer:v12 in_f0_tex:F0_tex[(nscales - 1)] in_f1_tex:self->_F1_tex[(nscales - 1)] in_f0_dxdy_tex:F0_dxdy_tex[(nscales - 1)] in_kpts_buf:v39 in_kptd_buf:v25 out_kptd_buf:v26 out_status_buf:v27 num_keypoints:v38 scale_kpts:v37 scale_kptd:v33];

      [v12 commit];
      unint64_t v28 = nscales--;
      int v17 = v12;
      uint64_t v29 = v40 ^ 1;
      v40 ^= 1uLL;
    }
    while (v28 > 1);
  }

  objc_storeStrong((id *)&self->_kptd_buf, (id)v41[v29]);
  status_buf = self->_status_buf;
  self->_status_buf = v37;

  for (uint64_t i = 1; i != -1; --i)
  return 0;
}

- (MTLBuffer)keypointsStatus
{
  return self->_status_buf;
}

- (MTLBuffer)keypointsTarget
{
  return self->_kptd_buf;
}

- (void)waitUntilCompleted
{
  id v2 = [(MTLCommandQueue *)self->_commandQueue commandBuffer];
  [v2 setLabel:@"LKT:waitUntilCompleted"];
  [v2 commit];
  [v2 waitUntilCompleted];
}

- (void)dealloc
{
  CVPixelBufferRelease(self->_F0_pxbuf);
  CVPixelBufferRelease(self->_F1_pxbuf);
  CVPixelBufferRelease(self->_F0_dxdy_pxbuf);
  CVPixelBufferRelease(self->_F1_dxdy_pxbuf);
  *(_OWORD *)&self->_F0_pxbuf = 0u;
  *(_OWORD *)&self->_F0_dxdy_pxbuf = 0u;
  v3.receiver = self;
  v3.super_class = (Class)VisionCoreLKTSparseGPU;
  [(VisionCoreLKTSparseGPU *)&v3 dealloc];
}

- (VisionCoreLKTSparseGPU)initWithMetalContext:(id)a3 width:(int)a4 height:(int)a5 nscales:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  uint64_t v7 = *(void *)&a5;
  uint64_t v8 = *(void *)&a4;
  id v11 = a3;
  v18.receiver = self;
  v18.super_class = (Class)VisionCoreLKTSparseGPU;
  id v12 = [(VisionCoreLKTSparseGPU *)&v18 init];
  id v13 = v12;
  if (v12)
  {
    if ((v7 | v8))
    {
      id v17 = [MEMORY[0x263EFF940] exceptionWithName:@"Invalid parameter" reason:@"Odd image dimensions are not supported" userInfo:0];
      objc_exception_throw(v17);
    }
    objc_storeStrong((id *)&v12->_mtlContext, a3);
    uint64_t v14 = [v11 commandQueue];
    commandQueue = v13->_commandQueue;
    v13->_commandQueue = (MTLCommandQueue *)v14;

    [(VisionCoreLKTSparseGPU *)v13 _setDefaultParameters];
    [(VisionCoreLKTSparseGPU *)v13 _initMemory:v8 height:v7 nscales:v6];
    [(VisionCoreLKTSparseGPU *)v13 _setupPipelines];
    [(VisionCoreLKTSparseGPU *)v13 _setupBuffer];
  }

  return v13;
}

@end