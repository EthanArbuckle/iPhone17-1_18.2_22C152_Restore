@interface PXGPolarBlurKernel
- (BOOL)_encodePolarBlur:(int)a3 sourceTexture:(id)a4 destinationTexture:(id)a5 params:(const void *)a6 length:(unint64_t)a7 commandBuffer:(id)a8;
- (PXGPolarBlurKernel)init;
- (double)rotationAngle;
- (double)scaleFactor;
- (void)encodeToCommandBuffer:(id)a3 sourceTexture:(id)a4 destinationTexture:(id)a5 targetScale:(double)a6;
- (void)setRotationAngle:(double)a3;
- (void)setScaleFactor:(double)a3;
@end

@implementation PXGPolarBlurKernel

- (double)rotationAngle
{
  return self->_rotationAngle;
}

- (double)scaleFactor
{
  return self->_scaleFactor;
}

- (void)encodeToCommandBuffer:(id)a3 sourceTexture:(id)a4 destinationTexture:(id)a5 targetScale:(double)a6
{
  uint64_t v78 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v69 = a5;
  uint64_t v11 = [v10 width];
  uint64_t v12 = [v10 height];
  unint64_t v13 = (unint64_t)[v10 width] >> 1;
  id v68 = v10;
  unint64_t v14 = [v10 height];
  v15 = [MEMORY[0x263F12A50] texture2DDescriptorWithPixelFormat:115 width:v13 height:v14 >> 1 mipmapped:0];
  [v15 setStorageMode:2];
  [v15 setUsage:3];
  float v16 = sqrt((double)(unint64_t)(v11 * v11 + v12 * v12)) * 0.5;
  double v17 = log(fmax(self->_scaleFactor, 1.0 / self->_scaleFactor));
  float v18 = v17 / log((float)(2.0 / v16) + 1.0);
  v76 = (double *)self;
  float v19 = self->_rotationAngle * v16 * 0.5;
  if (v19 >= v18) {
    float v18 = self->_rotationAngle * v16 * 0.5;
  }
  float v20 = fminf(fmaxf(v18, 1.0), 81.0);
  LODWORD(a5) = vcvtps_s32_f32(logf(fmaxf(v20, 3.0)) / 2.1972);
  if ((int)a5 <= 0) {
    __assert_rtn("-[PXGPolarBlurKernel encodeToCommandBuffer:sourceTexture:destinationTexture:targetScale:]", "PXGPolarBlurKernel.m", 151, "n > 0");
  }
  id v67 = v15;
  if (a5 == 1)
  {
    v22 = v9;
    id v70 = 0;
    v23 = &v80;
LABEL_9:
    *(v23 - 32) = 0;
    goto LABEL_10;
  }
  v21 = [MEMORY[0x263F133D8] temporaryImageWithCommandBuffer:v9 textureDescriptor:v15];
  id v71 = v21;
  if (a5 < 3)
  {
    v22 = v9;
    v23 = &v79;
    goto LABEL_9;
  }
  v22 = v9;
  v21 = [MEMORY[0x263F133D8] temporaryImageWithCommandBuffer:v9 textureDescriptor:v15];
  id v70 = v21;
LABEL_10:
  uint64_t v66 = (uint64_t)&v66;
  MEMORY[0x270FA5388](v21);
  v25 = (char *)&v66 - v24;
  float v26 = factorize((__int16)a5, 9, (uint64_t *)((char *)&v66 - v24), v20);
  double v27 = v76[2];
  long double v28 = -0.5 / (double)(int)a5;
  double v29 = v28 * v27;
  double v30 = v26;
  double v31 = v27 / v26;
  long double v32 = v76[1];
  double v33 = pow(v32, v28);
  long double v34 = pow(v32, 1.0 / v30);
  int v35 = a5 & 1;
  __double2 v36 = __sincos_stret(v29);
  v37 = 0;
  *(float *)v38.i32 = v33 * v36.__cosval;
  *(float *)&__int32 v39 = v33 * v36.__sinval;
  *(float *)v40.i32 = -*(float *)&v39;
  v40.i32[1] = v38.i32[0];
  v38.i32[1] = v39;
  int8x16_t v75 = (int8x16_t)vzip1q_s32(v38, v40);
  __asm { FMOV            V0.2D, #0.5 }
  float64x2_t v73 = _Q0;
  int8x16_t v74 = vextq_s8(v75, v75, 8uLL);
  __asm { FMOV            V0.2D, #1.0 }
  float64x2_t v72 = _Q0;
  do
  {
    if (v37)
    {
      if ((v37 & 1) == v35) {
        v47 = &v79;
      }
      else {
        v47 = &v80;
      }
      id v48 = [(id)*(v47 - 32) texture];
    }
    else
    {
      id v48 = v68;
    }
    v49 = v48;
    if ((void *)(a5 - 1) == v37)
    {
      id v50 = v69;
    }
    else
    {
      if ((v37 & 1) == v35) {
        v51 = &v80;
      }
      else {
        v51 = &v79;
      }
      id v50 = [(id)*(v51 - 32) texture];
    }
    v52 = v50;
    uint64_t v53 = *(__int16 *)&v25[2 * (void)v37];
    memset(v77, 0, sizeof(v77));
    uint64_t v54 = [v50 width];
    uint64_t v55 = [v52 height];
    v56.i64[0] = v54;
    v56.i64[1] = v55;
    *(float32x2_t *)&v77[0] = vcvt_f32_f64(vmulq_f64(vcvtq_f64_u64(v56), v73));
    *((void *)&v77[0] + 1) = v75.i64[0];
    *(void *)&v77[1] = v74.i64[0];
    __double2 v57 = __sincos_stret(v31);
    *(float *)v58.i32 = v34 * v57.__cosval;
    *(float *)&__int32 v59 = v34 * v57.__sinval;
    *(float *)v60.i32 = -*(float *)&v59;
    v60.i32[1] = v58.i32[0];
    v58.i32[1] = v59;
    *(int32x4_t *)((char *)&v77[1] + 8) = vzip1q_s32(v58, v60);
    uint64_t v61 = [v52 width];
    uint64_t v62 = [v52 height];
    v63.i64[0] = v61;
    v63.i64[1] = v62;
    *((float32x2_t *)&v77[2] + 1) = vcvt_f32_f64(vdivq_f64(v72, vcvtq_f64_u64(v63)));
    long double v34 = pow(v34, (double)(int)v53);
    double v31 = v31 * (double)(int)v53;
    [v76 _encodePolarBlur:v53 sourceTexture:v49 destinationTexture:v52 params:v77 length:48 commandBuffer:v22];

    v37 = (char *)v37 + 1;
  }
  while (a5 != v37);
  id v64 = v71;
  [v71 setReadCount:0];
  id v65 = v70;
  [v70 setReadCount:0];
}

- (BOOL)_encodePolarBlur:(int)a3 sourceTexture:(id)a4 destinationTexture:(id)a5 params:(const void *)a6 length:(unint64_t)a7 commandBuffer:(id)a8
{
  uint64_t v10 = *(void *)&a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a8;
  __int16 v33 = v10;
  id v14 = objc_alloc_init(MEMORY[0x263F128B0]);
  [v14 setConstantValue:&v33 type:41 atIndex:0];
  v15 = [NSString stringWithFormat:@"%@(%d)", @"pxg::polar_blur", v10];
  float v16 = [v13 device];
  double v17 = +[PXGKernel pipelineStateForFunctionWithName:@"pxg::polar_blur" constants:v14 key:v15 device:v16];

  float v18 = v11;
  if (v17)
  {
    float v19 = [v13 computeCommandEncoder];
    [v19 pushDebugGroup:@"pxg::polar_blur"];
    [v19 setComputePipelineState:v17];
    [v19 setTexture:v11 atIndex:0];
    [v19 setTexture:v12 atIndex:1];
    [v19 setBytes:a6 length:a7 atIndex:0];
    uint64_t v20 = [v12 width];
    uint64_t v21 = [v12 height];
    long long v31 = 0uLL;
    uint64_t v32 = 0;
    *(void *)&long long v29 = v20;
    *((void *)&v29 + 1) = v21;
    uint64_t v30 = 1;
    +[PXGKernel groupSizeForImageSize:&v29 pipelineState:v17];
    long long v29 = 0uLL;
    uint64_t v30 = 0;
    long long v27 = v31;
    uint64_t v28 = v32;
    *(void *)&long long v25 = v20;
    *((void *)&v25 + 1) = v21;
    uint64_t v26 = 1;
    +[PXGKernel gridSizeForThreadGroupSize:&v27 imageSize:&v25];
    long long v27 = v29;
    uint64_t v28 = v30;
    long long v25 = v31;
    uint64_t v26 = v32;
    [v19 dispatchThreadgroups:&v27 threadsPerThreadgroup:&v25];
    [v19 popDebugGroup];
    [v19 endEncoding];
  }
  return v17 != 0;
}

- (void)setRotationAngle:(double)a3
{
  self->_rotationAngle = fmin(fmax(a3, -6.28318531), 6.28318531);
}

- (void)setScaleFactor:(double)a3
{
  self->_scaleFactor = fmin(fmax(a3, 0.1), 10.0);
}

- (PXGPolarBlurKernel)init
{
  v3.receiver = self;
  v3.super_class = (Class)PXGPolarBlurKernel;
  result = [(PXGPolarBlurKernel *)&v3 init];
  if (result)
  {
    result->_scaleFactor = 1.0;
    result->_rotationAngle = 0.0;
  }
  return result;
}

@end