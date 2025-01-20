@interface VCPAV1Metal
- (BOOL)broken444;
- (BOOL)metalIsSupported;
- (id).cxx_construct;
- (id)compileFunction:(id)a3 constantValues:(id)a4;
- (id)dstTexture:(__CVBuffer *)a3 forPlane:(int)a4 bitdepth:(int)a5;
- (id)srcTexture:(__CVBuffer *)a3 forPlane:(int)a4 bitdepth:(int)a5;
- (int)applyFilmGrain:(void *)a3 forPicture:(Dav1dPicture *)a4 toPixelBuffer:(__CVBuffer *)a5;
- (int)compileBlitForPicture:(Dav1dPicture *)a3 andPixelBuffer:(__CVBuffer *)a4;
- (int)compileFilmGrainForPicture:(Dav1dPicture *)a3 andPixelBuffer:(__CVBuffer *)a4;
- (int)copyPicture:(Dav1dPicture *)a3 toPixelBuffer:(__CVBuffer *)a4;
- (int)copyPixelBuffer:(__CVBuffer *)a3 toPixelBuffer:(__CVBuffer *)a4;
- (int)maximumTextureDimension;
- (int)openDevice;
- (void)encodeBlit:(id)a3 forPicture:(Dav1dPicture *)a4 toPixelBuffer:(__CVBuffer *)a5 plane:(int)a6;
- (void)updatePictureFormat:(Dav1dPicture *)a3 pixelBuffer:(__CVBuffer *)a4;
@end

@implementation VCPAV1Metal

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 104) = 0u;
  *(_OWORD *)((char *)self + 88) = 0u;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_offsetsTex, 0);
  objc_storeStrong((id *)&self->_offsets, 0);
  objc_storeStrong((id *)&self->_scalingLUT, 0);
  objc_storeStrong((id *)&self->_grainTextureUV, 0);
  objc_storeStrong((id *)&self->_grainTextureY, 0);
  objc_storeStrong((id *)&self->_grainPatch, 0);
  for (uint64_t i = 0; i != -2; --i)
    sub_224AAE09C((const void **)&self->_textureCacheDst[i + 1].value_);
  for (uint64_t j = 0; j != -2; --j)
    sub_224AAE09C((const void **)&self->_textureCacheSrc[j + 1].value_);
  objc_storeStrong((id *)&self->_filmGrainChroma, 0);
  objc_storeStrong((id *)&self->_filmGrainLuma, 0);
  objc_storeStrong((id *)&self->_blitKernelChroma, 0);
  objc_storeStrong((id *)&self->_blitKernelLuma, 0);
  objc_storeStrong((id *)&self->_blitKernelUnorm, 0);
  objc_storeStrong((id *)&self->_library, 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

- (BOOL)broken444
{
  return self->_broken444;
}

- (int)maximumTextureDimension
{
  return self->_maximumTextureDimension;
}

- (int)applyFilmGrain:(void *)a3 forPicture:(Dav1dPicture *)a4 toPixelBuffer:(__CVBuffer *)a5
{
  uint64_t v85 = *MEMORY[0x263EF8340];
  var18 = a4->var18;
  var1 = a4->var1;
  int v11 = [(VCPAV1Metal *)self compileFilmGrainForPicture:a4 andPixelBuffer:a5];
  if (v11) {
    return v11;
  }
  v55 = var18;
  uint64_t v12 = [(MTLBuffer *)self->_grainPatch contents];
  sub_224B03EF0((char *)a3, (uint64_t)v76);
  v13 = (char *)a3 + 36784;
  (*((void (**)(unsigned char *, void *, uint64_t))a3 + 4598))(v76, a3, v12);
  uint64_t v14 = [(MTLBuffer *)self->_scalingLUT contents];
  uint64_t v15 = [(MTLBuffer *)self->_scalingLUT length];
  int v16 = (unsigned __int16)v77 >> 13;
  uint64_t v17 = 768 << v16;
  if (v15 == 768 << v16)
  {
    if ((unsigned __int16)v77 >> 13)
    {
      uint64_t v18 = 0;
      do
      {
        (*((void (**)(unsigned char *, uint8_t *, uint64_t))v13 + 1))(v76, buf, v18);
        uint64_t v19 = 0;
        int v20 = (unsigned __int16)v77 >> 13;
        do
        {
          unint64_t v21 = (unint64_t)v19 >> v20;
          if (!v20 || v21 == 255) {
            LOBYTE(v22) = buf[v21];
          }
          else {
            int v22 = (((1 << (v20 - 1)) + (buf[v21 + 1] - buf[v21]) * ((int)v19 - (v21 << v20))) >> v20)
          }
                + buf[v21];
          *(unsigned char *)(v14 + v19) = v22;
          int v20 = (unsigned __int16)v77 >> 13;
          ++v19;
        }
        while (v19 < 256 << v20);
        v14 += v19;
        uint64_t v18 = (v18 + 1);
      }
      while (v18 != 3);
    }
    else
    {
      for (uint64_t i = 0; i != 3; ++i)
      {
        (*((void (**)(unsigned char *, uint64_t, uint64_t))v13 + 1))(v76, v14, i);
        v14 += 256;
      }
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "Invalid length %zu for bitdepth %d, expected %d\n", v15, v16 | 8, v17);
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218496;
      uint64_t v79 = v15;
      LOWORD(v80) = 1024;
      *(_DWORD *)((char *)&v80 + 2) = ((unsigned __int16)v77 >> 13) | 8;
      HIWORD(v80) = 1024;
      LODWORD(v81) = v17;
      _os_log_impl(&dword_224A74000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Invalid length %zu for bitdepth %d, expected %d", buf, 0x18u);
    }
  }
  (*((void (**)(uint64_t, void, void, void, void))v13 + 2))([(MTLBuffer *)self->_offsets contents], self->_offsetsStride, ((a4->var4.var0 + 31) >> 5), ((a4->var4.var1 + 31) >> 5), *(_DWORD *)a4->var1);
  v24 = a4->var1;
  unsigned int v25 = a4->var4.var3 - 8;
  int v26 = (256 << (LOBYTE(a4->var4.var3) - 8)) - 1;
  *(_DWORD *)buf = 0;
  LODWORD(v79) = v26;
  HIDWORD(v79) = v26;
  if (*((_DWORD *)v24 + 54))
  {
    *(_DWORD *)buf = 16 << v25;
    LODWORD(v79) = 235 << v25;
    if (*((_DWORD *)a4->var0 + 6)) {
      int v27 = 240 << v25;
    }
    else {
      int v27 = 235 << v25;
    }
    HIDWORD(v79) = v27;
  }
  int v28 = *((_DWORD *)v24 + 53);
  LODWORD(v80) = *((_DWORD *)v24 + 22);
  HIDWORD(v80) = v28;
  uint64_t v81 = *(void *)((char *)v24 + 36);
  int v82 = *((_DWORD *)v24 + 11);
  int8x16_t v83 = vextq_s8(*(int8x16_t *)((char *)v24 + 188), *(int8x16_t *)((char *)v24 + 188), 8uLL);
  uint32x2_t v84 = vshl_u32(*(uint32x2_t *)((char *)v24 + 204), (uint32x2_t)vdup_n_s32(v25));
  if (*((int *)var1 + 10) > 0 || *((int *)var1 + 11) > 0) {
    goto LABEL_24;
  }
  if (!*((_DWORD *)var1 + 9))
  {
    BOOL v29 = 0;
    goto LABEL_25;
  }
  if (*((_DWORD *)var1 + 54)) {
LABEL_24:
  }
    BOOL v29 = 1;
  else {
    BOOL v29 = *((_DWORD *)var1 + 1) != 0;
  }
LABEL_25:
  int gpuBitdepth = self->_gpuBitdepth;
  v30 = [(MTLCommandQueue *)self->_commandQueue commandBuffer];
  v31 = v30;
  if (*((_DWORD *)var1 + 1)) {
    int v32 = 1;
  }
  else {
    int v32 = v29;
  }
  if (v32 == 1)
  {
    v33 = [v30 blitCommandEncoder];
    v34 = v33;
    if (*((_DWORD *)var1 + 1))
    {
      int64x2_t v72 = vdupq_n_s64(0x40uLL);
      uint64_t v73 = 1;
      grainPatch = self->_grainPatch;
      grainTextureY = self->_grainTextureY;
      memset(v71, 0, sizeof(v71));
      [v33 copyFromBuffer:grainPatch sourceOffset:0 sourceBytesPerRow:128 sourceBytesPerImage:0x2000 sourceSize:&v72 toTexture:grainTextureY destinationSlice:0 destinationLevel:0 destinationOrigin:v71];
    }
    if (v29)
    {
      v37 = self->_grainPatch;
      int64x2_t v69 = vdupq_n_s64(0x40uLL);
      uint64_t v70 = 1;
      grainTextureUV = self->_grainTextureUV;
      memset(v68, 0, sizeof(v68));
      [v34 copyFromBuffer:v37 sourceOffset:0x2000 sourceBytesPerRow:256 sourceBytesPerImage:0x4000 sourceSize:&v69 toTexture:grainTextureUV destinationSlice:0 destinationLevel:0 destinationOrigin:v68];
    }
    [v34 endEncoding];
  }
  [v31 computeCommandEncoder];
  v40 = v39 = v55;
  v41 = [(VCPAV1Metal *)self srcTexture:*v55 forPlane:0 bitdepth:a4->var4.var3];
  if (*((_DWORD *)var1 + 1))
  {
    v42 = [(VCPAV1Metal *)self dstTexture:a5 forPlane:0 bitdepth:a4->var4.var3];
    uint64_t v43 = [v42 width];
    uint64_t v44 = [v42 height];
    [v40 setComputePipelineState:self->_filmGrainLuma];
    [v40 setTexture:v42 atIndex:0];
    [v40 setTexture:v41 atIndex:1];
    [v40 setTexture:self->_offsetsTex atIndex:2];
    [v40 setTexture:self->_grainTextureY atIndex:3];
    [v40 setBytes:buf length:56 atIndex:0];
    [v40 setBuffer:self->_scalingLUT offset:0 atIndex:1];
    if (self->_supportsNonUniformThreadgroup)
    {
      v67[0] = v43;
      v67[1] = v44;
      v67[2] = 1;
      int64x2_t v65 = vdupq_n_s64(0x10uLL);
      uint64_t v66 = 1;
      [v40 dispatchThreads:v67 threadsPerThreadgroup:&v65];
    }
    else
    {
      v64[0] = (unint64_t)(v43 + 15) >> 4;
      v64[1] = (unint64_t)(v44 + 15) >> 4;
      v64[2] = 1;
      int64x2_t v62 = vdupq_n_s64(0x10uLL);
      uint64_t v63 = 1;
      [v40 dispatchThreadgroups:v64 threadsPerThreadgroup:&v62];
    }

    v39 = v55;
  }
  else
  {
    [(VCPAV1Metal *)self encodeBlit:v40 forPicture:a4 toPixelBuffer:a5 plane:0];
  }
  if (a4->var4.var2)
  {
    if (v29)
    {
      v45 = [(VCPAV1Metal *)self srcTexture:v39[1] forPlane:1 bitdepth:a4->var4.var3];
      v46 = [(VCPAV1Metal *)self srcTexture:v39[2] forPlane:2 bitdepth:a4->var4.var3];
      v47 = [(VCPAV1Metal *)self dstTexture:a5 forPlane:1 bitdepth:a4->var4.var3];
      uint64_t v48 = [v47 width];
      uint64_t v49 = [v47 height];
      [v40 setComputePipelineState:self->_filmGrainChroma];
      [v40 setTexture:v47 atIndex:0];
      [v40 setTexture:v41 atIndex:1];
      [v40 setTexture:self->_offsetsTex atIndex:2];
      [v40 setTexture:self->_grainTextureUV atIndex:3];
      [v40 setTexture:v45 atIndex:4];
      [v40 setTexture:v46 atIndex:5];
      [v40 setBytes:buf length:56 atIndex:0];
      [v40 setBuffer:self->_scalingLUT offset:256 << (gpuBitdepth - 8) atIndex:1];
      [v40 setBuffer:self->_scalingLUT offset:512 << (gpuBitdepth - 8) atIndex:2];
      if (self->_supportsNonUniformThreadgroup)
      {
        v61[0] = v48;
        v61[1] = v49;
        v61[2] = 1;
        int64x2_t v59 = vdupq_n_s64(0x10uLL);
        uint64_t v60 = 1;
        [v40 dispatchThreads:v61 threadsPerThreadgroup:&v59];
      }
      else
      {
        v58[0] = (unint64_t)(v48 + 15) >> 4;
        v58[1] = (unint64_t)(v49 + 15) >> 4;
        v58[2] = 1;
        int64x2_t v56 = vdupq_n_s64(0x10uLL);
        uint64_t v57 = 1;
        [v40 dispatchThreadgroups:v58 threadsPerThreadgroup:&v56];
      }
    }
    else
    {
      [(VCPAV1Metal *)self encodeBlit:v40 forPicture:a4 toPixelBuffer:a5 plane:1];
    }
  }
  [v40 endEncoding];
  [v31 commit];
  [v31 waitUntilCompleted];
  v50 = [v31 error];
  BOOL v51 = v50 == 0;

  if (v51)
  {
    int v11 = 0;
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      v53 = [v31 error];
      *(_DWORD *)v74 = 138412290;
      v75 = v53;
      _os_log_error_impl(&dword_224A74000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Error %@ in metal execution", v74, 0xCu);
    }
    int v11 = -12911;
  }

  return v11;
}

- (int)copyPixelBuffer:(__CVBuffer *)a3 toPixelBuffer:(__CVBuffer *)a4
{
  v5 = self;
  uint64_t v37 = *MEMORY[0x263EF8340];
  v34 = self;
  v33 = a3;
  int v6 = [(VCPAV1Metal *)self openDevice];
  if (!v6)
  {
    if (!v5->_blitKernelUnorm)
    {
      v7 = objc_opt_new();
      [v7 setConstantValue:&v5->_supportsNonUniformThreadgroup type:33 atIndex:0];
      uint64_t v8 = [(VCPAV1Metal *)v34 compileFunction:@"BlitKernel_Unorm" constantValues:v7];
      v5 = v34;
      blitKernelUnorm = v34->_blitKernelUnorm;
      v34->_blitKernelUnorm = (MTLComputePipelineState *)v8;

      *(_WORD *)&v5->_onePixelPerWrite = 1;
    }
    v32[0] = &v33;
    v32[1] = &v34;
    v10 = [(MTLCommandQueue *)v5->_commandQueue commandBuffer];
    int v11 = [v10 computeCommandEncoder];
    OSType PixelFormatType = CVPixelBufferGetPixelFormatType(a4);
    uint64_t v13 = sub_224B0E038(PixelFormatType);
    uint64_t v14 = sub_224AAED98((uint64_t)v32, 0);
    unsigned int v25 = sub_224AAED98((uint64_t)v32, 1uLL);
    uint64_t v15 = [(VCPAV1Metal *)v34 dstTexture:a4 forPlane:0 bitdepth:v13];
    int v16 = [(VCPAV1Metal *)v34 dstTexture:a4 forPlane:1 bitdepth:v13];
    uint64_t v17 = [v15 width];
    uint64_t v18 = [v15 height];
    uint64_t v19 = [v16 width];
    uint64_t v20 = [v16 height];
    [v11 setComputePipelineState:v34->_blitKernelUnorm];
    [v11 setTexture:v15 atIndex:0];
    [v11 setTexture:v14 atIndex:1];
    v31[0] = v17;
    v31[1] = v18;
    v31[2] = 1;
    int64x2_t v29 = vdupq_n_s64(0x10uLL);
    uint64_t v30 = 1;
    [v11 dispatchThreads:v31 threadsPerThreadgroup:&v29];
    if (CVPixelBufferGetPlaneCount(a4) >= 2)
    {
      [v11 setComputePipelineState:v34->_blitKernelUnorm];
      [v11 setTexture:v16 atIndex:0];
      [v11 setTexture:v25 atIndex:1];
      v28[0] = v19;
      v28[1] = v20;
      v28[2] = 1;
      int64x2_t v26 = vdupq_n_s64(0x10uLL);
      uint64_t v27 = 1;
      [v11 dispatchThreads:v28 threadsPerThreadgroup:&v26];
    }
    [v11 endEncoding];
    [v10 commit];
    [v10 waitUntilCompleted];
    unint64_t v21 = [v10 error];
    BOOL v22 = v21 == 0;

    if (v22)
    {
      int v6 = 0;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        v24 = [v10 error];
        *(_DWORD *)buf = 138412290;
        v36 = v24;
        _os_log_error_impl(&dword_224A74000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Error %@ in metal execution", buf, 0xCu);
      }
      int v6 = -12911;
    }
  }
  return v6;
}

- (int)copyPicture:(Dav1dPicture *)a3 toPixelBuffer:(__CVBuffer *)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  var18 = a3->var18;
  int v8 = -[VCPAV1Metal compileBlitForPicture:andPixelBuffer:](self, "compileBlitForPicture:andPixelBuffer:");
  if (!v8)
  {
    v9 = [(MTLCommandQueue *)self->_commandQueue commandBuffer];
    v10 = [v9 computeCommandEncoder];
    if (!var18[24]) {
      [(VCPAV1Metal *)self encodeBlit:v10 forPicture:a3 toPixelBuffer:a4 plane:0];
    }
    if (a3->var4.var2) {
      [(VCPAV1Metal *)self encodeBlit:v10 forPicture:a3 toPixelBuffer:a4 plane:1];
    }
    [v10 endEncoding];
    [v9 commit];
    [v9 waitUntilCompleted];
    int v11 = [v9 error];

    if (v11)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        uint64_t v13 = [v9 error];
        int v14 = 138412290;
        uint64_t v15 = v13;
        _os_log_error_impl(&dword_224A74000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Error %@ in metal execution", (uint8_t *)&v14, 0xCu);
      }
      int v8 = -12911;
    }
    else
    {
      int v8 = 0;
    }
  }
  return v8;
}

- (void)encodeBlit:(id)a3 forPicture:(Dav1dPicture *)a4 toPixelBuffer:(__CVBuffer *)a5 plane:(int)a6
{
  id v10 = a3;
  var18 = a4->var18;
  if (a6)
  {
    uint64_t v12 = [(VCPAV1Metal *)self srcTexture:var18[1] forPlane:1 bitdepth:a4->var4.var3];
    uint64_t v13 = [(VCPAV1Metal *)self srcTexture:var18[2] forPlane:2 bitdepth:a4->var4.var3];
    int v14 = [(VCPAV1Metal *)self dstTexture:a5 forPlane:1 bitdepth:a4->var4.var3];
    uint64_t v15 = [v14 width];
    uint64_t v16 = [v14 height];
    [v10 setComputePipelineState:self->_blitKernelChroma];
    [v10 setTexture:v14 atIndex:0];
    [v10 setTexture:v12 atIndex:1];
    [v10 setTexture:v13 atIndex:2];
    if (self->_supportsNonUniformThreadgroup)
    {
      v24[0] = v15;
      v24[1] = v16;
      v24[2] = 1;
      int64x2_t v22 = vdupq_n_s64(0x10uLL);
      uint64_t v23 = 1;
      [v10 dispatchThreads:v24 threadsPerThreadgroup:&v22];
    }
    else
    {
      v21[0] = (unint64_t)(v15 + 15) >> 4;
      v21[1] = (unint64_t)(v16 + 15) >> 4;
      v21[2] = 1;
      int64x2_t v19 = vdupq_n_s64(0x10uLL);
      uint64_t v20 = 1;
      [v10 dispatchThreadgroups:v21 threadsPerThreadgroup:&v19];
    }
  }
  else
  {
    uint64_t v12 = [(VCPAV1Metal *)self srcTexture:*var18 forPlane:0 bitdepth:a4->var4.var3];
    uint64_t v13 = [(VCPAV1Metal *)self dstTexture:a5 forPlane:0 bitdepth:a4->var4.var3];
    uint64_t v17 = [v13 width];
    uint64_t v18 = [v13 height];
    [v10 setComputePipelineState:self->_blitKernelLuma];
    [v10 setTexture:v13 atIndex:0];
    [v10 setTexture:v12 atIndex:1];
    if (self->_supportsNonUniformThreadgroup)
    {
      v30[0] = v17;
      v30[1] = v18;
      v30[2] = 1;
      int64x2_t v28 = vdupq_n_s64(0x10uLL);
      uint64_t v29 = 1;
      [v10 dispatchThreads:v30 threadsPerThreadgroup:&v28];
    }
    else
    {
      v27[0] = (unint64_t)(v17 + 15) >> 4;
      v27[1] = (unint64_t)(v18 + 15) >> 4;
      v27[2] = 1;
      int64x2_t v25 = vdupq_n_s64(0x10uLL);
      uint64_t v26 = 1;
      [v10 dispatchThreadgroups:v27 threadsPerThreadgroup:&v25];
    }
  }
}

- (id)dstTexture:(__CVBuffer *)a3 forPlane:(int)a4 bitdepth:(int)a5
{
  v23[1] = *MEMORY[0x263EF8340];
  size_t v9 = a4;
  size_t WidthOfPlane = CVPixelBufferGetWidthOfPlane(a3, a4);
  size_t HeightOfPlane = CVPixelBufferGetHeightOfPlane(a3, v9);
  uint64_t v12 = 13;
  if (a4) {
    uint64_t v12 = 33;
  }
  if (self->_integerWrites)
  {
    uint64_t v13 = 23;
    if (a4) {
      uint64_t v13 = 63;
    }
    if (a5 > 8) {
      uint64_t v12 = v13;
    }
    uint64_t v14 = 113;
    if (a5 == 8) {
      uint64_t v14 = 73;
    }
    unint64_t v15 = (WidthOfPlane + 1) >> 1;
    if (!a4) {
      unint64_t v15 = (WidthOfPlane + 3) >> 2;
    }
    if (self->_onePixelPerWrite)
    {
      MTLPixelFormat v16 = v12;
    }
    else
    {
      size_t WidthOfPlane = v15;
      MTLPixelFormat v16 = v14;
    }
  }
  else
  {
    MTLPixelFormat v16 = sub_224AAEF20(a3, a4);
  }
  BOOL v17 = a4 != 0;
  uint64_t v22 = *MEMORY[0x263F04070];
  v23[0] = &unk_26D7D6638;
  CFDictionaryRef v18 = [NSDictionary dictionaryWithObjects:v23 forKeys:&v22 count:1];
  CVMetalTextureRef image = 0;
  if (CVMetalTextureCacheCreateTextureFromImage(0, self->_textureCacheDst[v17].value_, a3, v18, v16, WidthOfPlane, HeightOfPlane, v9, &image))
  {
    int64x2_t v19 = 0;
  }
  else
  {
    int64x2_t v19 = CVMetalTextureGetTexture(image);
  }
  sub_224AAEFC4((const void **)&image);

  return v19;
}

- (id)srcTexture:(__CVBuffer *)a3 forPlane:(int)a4 bitdepth:(int)a5
{
  v21[1] = *MEMORY[0x263EF8340];
  size_t Width = CVPixelBufferGetWidth(a3);
  size_t Height = CVPixelBufferGetHeight(a3);
  uint64_t v11 = 23;
  if (a5 == 8) {
    uint64_t v11 = 13;
  }
  uint64_t v12 = 63;
  if (a5 == 8) {
    uint64_t v12 = 33;
  }
  unint64_t v13 = (Width + 1) >> 1;
  uint64_t v14 = 113;
  if (a5 == 8) {
    uint64_t v14 = 73;
  }
  if (!a4)
  {
    unint64_t v13 = (Width + 3) >> 2;
    uint64_t v12 = v14;
  }
  if (self->_onePixelPerWrite)
  {
    MTLPixelFormat v15 = v11;
  }
  else
  {
    size_t Width = v13;
    MTLPixelFormat v15 = v12;
  }
  uint64_t v20 = *MEMORY[0x263F04070];
  v21[0] = &unk_26D7D6620;
  CFDictionaryRef v16 = [NSDictionary dictionaryWithObjects:v21 forKeys:&v20 count:1];
  CVMetalTextureRef image = 0;
  if (CVMetalTextureCacheCreateTextureFromImage(0, self->_textureCacheSrc[a4 > 0].value_, a3, v16, v15, Width, Height, 0, &image))
  {
    BOOL v17 = 0;
  }
  else
  {
    BOOL v17 = CVMetalTextureGetTexture(image);
  }
  sub_224AAEFC4((const void **)&image);

  return v17;
}

- (int)compileFilmGrainForPicture:(Dav1dPicture *)a3 andPixelBuffer:(__CVBuffer *)a4
{
  int v7 = [(VCPAV1Metal *)self openDevice];
  if (v7) {
    return v7;
  }
  int v7 = [(VCPAV1Metal *)self compileBlitForPicture:a3 andPixelBuffer:a4];
  if (v7) {
    return v7;
  }
  int var0 = a3->var4.var0;
  if (self->_width == var0)
  {
    int var1 = a3->var4.var1;
    if (self->_height == var1) {
      goto LABEL_8;
    }
  }
  else
  {
    int var1 = a3->var4.var1;
  }
  int v10 = var0 + 31;
  int v11 = var1 + 31;
  int v12 = [(MTLDevice *)self->_device minimumLinearTextureAlignmentForPixelFormat:73];
  self->_offsetsStride = (((unint64_t)v12 >> 2) + (v10 >> 5) - 1) & -(int)((unint64_t)v12 >> 2);
  unint64_t v13 = [MEMORY[0x263F12A50] texture2DDescriptorWithPixelFormat:73 width:(uint64_t)v10 >> 5 height:(uint64_t)v11 >> 5 mipmapped:0];
  [v13 setStorageMode:0];
  uint64_t v14 = (MTLBuffer *)[(MTLDevice *)self->_device newBufferWithLength:4 * self->_offsetsStride * (v11 >> 5) options:0];
  offsets = self->_offsets;
  self->_offsets = v14;

  CFDictionaryRef v16 = (MTLTexture *)[(MTLBuffer *)self->_offsets newTextureWithDescriptor:v13 offset:0 bytesPerRow:4 * self->_offsetsStride];
  offsetsTex = self->_offsetsTex;
  self->_offsetsTex = v16;

  self->_width = a3->var4.var0;
  self->_height = a3->var4.var1;

LABEL_8:
  if (self->_filmGrainLuma && self->_filmGrainChroma) {
    return 0;
  }
  int var2 = a3->var4.var2;
  BOOL v38 = var2 != 3;
  BOOL v39 = var2 == 1;
  int64x2_t v19 = objc_opt_new();
  [v19 setConstantValue:&self->_supportsNonUniformThreadgroup type:33 atIndex:0];
  [v19 setConstantValue:&self->_gpuBitdepth type:33 atIndex:1];
  [v19 setConstantValue:&v38 type:33 atIndex:2];
  [v19 setConstantValue:&v39 type:33 atIndex:3];
  if (self->_integerWrites)
  {
    uint64_t v20 = [(VCPAV1Metal *)self compileFunction:@"FilmGrainLumaKernel_Uint" constantValues:v19];
    filmGrainLuma = self->_filmGrainLuma;
    self->_filmGrainLuma = v20;

    [(VCPAV1Metal *)self compileFunction:@"FilmGrainChromaKernel_Uint" constantValues:v19];
  }
  else
  {
    uint64_t v23 = [(VCPAV1Metal *)self compileFunction:@"FilmGrainLumaKernel_Unorm" constantValues:v19];
    v24 = self->_filmGrainLuma;
    self->_filmGrainLuma = v23;

    [(VCPAV1Metal *)self compileFunction:@"FilmGrainChromaKernel_Unorm" constantValues:v19];
  }
  uint64_t v22 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
  filmGrainChroma = self->_filmGrainChroma;
  self->_filmGrainChroma = v22;

  if (self->_filmGrainLuma && self->_filmGrainChroma)
  {
    uint64_t v26 = [MEMORY[0x263F12A50] texture2DDescriptorWithPixelFormat:24 width:64 height:64 mipmapped:0];
    uint64_t v27 = [MEMORY[0x263F12A50] texture2DDescriptorWithPixelFormat:64 width:64 height:64 mipmapped:0];
    [v26 setStorageMode:2];
    [v27 setStorageMode:2];
    [v26 setUsage:1];
    [v27 setUsage:1];
    int64x2_t v28 = (MTLTexture *)[(MTLDevice *)self->_device newTextureWithDescriptor:v26];
    grainTextureY = self->_grainTextureY;
    self->_grainTextureY = v28;

    uint64_t v30 = (MTLTexture *)[(MTLDevice *)self->_device newTextureWithDescriptor:v27];
    grainTextureUV = self->_grainTextureUV;
    self->_grainTextureUV = v30;

    int v32 = (MTLBuffer *)[(MTLDevice *)self->_device newBufferWithLength:24576 options:0];
    grainPatch = self->_grainPatch;
    self->_grainPatch = v32;

    v34 = (MTLBuffer *)[(MTLDevice *)self->_device newBufferWithLength:3 * (256 << (self->_gpuBitdepth - 8)) options:0];
    scalingLUT = self->_scalingLUT;
    self->_scalingLUT = v34;

    int v7 = 0;
  }
  else
  {
    fwrite("Unable to compile blit kernels\n", 0x1FuLL, 1uLL, (FILE *)*MEMORY[0x263EF8348]);
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v37 = 0;
      _os_log_impl(&dword_224A74000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Unable to compile blit kernels", v37, 2u);
    }
    int v7 = -12911;
  }

  return v7;
}

- (int)compileBlitForPicture:(Dav1dPicture *)a3 andPixelBuffer:(__CVBuffer *)a4
{
  int v7 = [(VCPAV1Metal *)self openDevice];
  if (!v7)
  {
    [(VCPAV1Metal *)self updatePictureFormat:a3 pixelBuffer:a4];
    if (self->_blitKernelLuma && self->_blitKernelChroma)
    {
      return 0;
    }
    else
    {
      int v8 = objc_opt_new();
      [v8 setConstantValue:&self->_supportsNonUniformThreadgroup type:33 atIndex:0];
      [v8 setConstantValue:&self->_gpuBitdepth type:33 atIndex:1];
      if (self->_integerWrites)
      {
        if (self->_onePixelPerWrite)
        {
          size_t v9 = [(VCPAV1Metal *)self compileFunction:@"BlitLumaKernel_Uint" constantValues:v8];
          blitKernelLuma = self->_blitKernelLuma;
          self->_blitKernelLuma = v9;

          [(VCPAV1Metal *)self compileFunction:@"BlitChromaKernel_Uint" constantValues:v8];
        }
        else
        {
          uint64_t v14 = [(VCPAV1Metal *)self compileFunction:@"BlitLumaKernel_UintPacked" constantValues:v8];
          MTLPixelFormat v15 = self->_blitKernelLuma;
          self->_blitKernelLuma = v14;

          [(VCPAV1Metal *)self compileFunction:@"BlitChromaKernel_UintPacked" constantValues:v8];
        }
        int v11 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        int v12 = [(VCPAV1Metal *)self compileFunction:@"BlitLumaKernel_Unorm" constantValues:v8];
        unint64_t v13 = self->_blitKernelLuma;
        self->_blitKernelLuma = v12;

        int v11 = [(VCPAV1Metal *)self compileFunction:@"BlitChromaKernel_Unorm" constantValues:v8];
      }
      blitKernelChroma = self->_blitKernelChroma;
      self->_blitKernelChroma = v11;

      if (self->_blitKernelLuma && self->_blitKernelChroma)
      {
        int v7 = 0;
      }
      else
      {
        fwrite("Unable to compile blit kernels\n", 0x1FuLL, 1uLL, (FILE *)*MEMORY[0x263EF8348]);
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)CFDictionaryRef v18 = 0;
          _os_log_impl(&dword_224A74000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Unable to compile blit kernels", v18, 2u);
        }
        int v7 = -12911;
      }
    }
  }
  return v7;
}

- (void)updatePictureFormat:(Dav1dPicture *)a3 pixelBuffer:(__CVBuffer *)a4
{
  OSType PixelFormatType = CVPixelBufferGetPixelFormatType(a4);
  int v7 = sub_224B0E50C(PixelFormatType);
  int var1 = a3->var1;
  if (!*((_DWORD *)var1 + 1) && !*((_DWORD *)var1 + 10) && !*((_DWORD *)var1 + 11))
  {
    if (!*((_DWORD *)var1 + 54))
    {
      BOOL v9 = v7;
      goto LABEL_5;
    }
    BOOL v9 = v7;
    if (!*((_DWORD *)var1 + 9)) {
      goto LABEL_5;
    }
  }
  BOOL v9 = 1;
LABEL_5:
  int v10 = v7 ^ 1;
  if (self->_gpuBitdepth != a3->var4.var3
    || self->_layout != a3->var4.var2
    || self->_onePixelPerWrite != v9
    || self->_integerWrites != v10)
  {
    blitKernelLuma = self->_blitKernelLuma;
    self->_blitKernelLuma = 0;

    blitKernelChroma = self->_blitKernelChroma;
    self->_blitKernelChroma = 0;

    filmGrainLuma = self->_filmGrainLuma;
    self->_filmGrainLuma = 0;

    filmGrainChroma = self->_filmGrainChroma;
    self->_filmGrainChroma = 0;

    *(int32x2_t *)&self->_int gpuBitdepth = vrev64_s32(*(int32x2_t *)&a3->var4.var2);
    self->_onePixelPerWrite = v9;
    self->_integerWrites = v10;
  }
}

- (id)compileFunction:(id)a3 constantValues:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  library = self->_library;
  if (!library)
  {
    int v12 = 0;
    goto LABEL_14;
  }
  if (v7)
  {
    id v16 = 0;
    BOOL v9 = (void *)[(MTLLibrary *)library newFunctionWithName:v6 constantValues:v7 error:&v16];
    id v10 = v16;
    if (v9) {
      goto LABEL_4;
    }
LABEL_10:
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v6;
      _os_log_impl(&dword_224A74000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Unable to find kernel %@", buf, 0xCu);
    }
    int v12 = 0;
    id v13 = v10;
    goto LABEL_13;
  }
  BOOL v9 = (void *)[(MTLLibrary *)library newFunctionWithName:v6];
  id v10 = 0;
  if (!v9) {
    goto LABEL_10;
  }
LABEL_4:
  device = self->_device;
  id v15 = v10;
  int v12 = (void *)[(MTLDevice *)device newComputePipelineStateWithFunction:v9 error:&v15];
  id v13 = v15;

  if (!v12 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    id v18 = v6;
    __int16 v19 = 2112;
    id v20 = v13;
    _os_log_error_impl(&dword_224A74000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Failed compiling %@ with error %@", buf, 0x16u);
  }

LABEL_13:
LABEL_14:

  return v12;
}

- (int)openDevice
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  if (self->_openAttempted)
  {
    if (self->_library) {
      return 0;
    }
    else {
      return -12910;
    }
  }
  else
  {
    self->_openAttempted = 1;
    device = self->_device;
    if (device
      || (v5 = (MTLDevice *)MTLCreateSystemDefaultDevice(),
          id v6 = self->_device,
          self->_device = v5,
          v6,
          (device = self->_device) != 0))
    {
      if (([(MTLDevice *)device supportsFamily:3003] & 1) != 0
        || ([(MTLDevice *)self->_device supportsFamily:2002] & 1) != 0)
      {
        int v7 = 1;
      }
      else
      {
        int v7 = [(MTLDevice *)self->_device supportsFamily:1004];
      }
      self->_supportsNonUniformThreadgroup = v7;
      self->_int maximumTextureDimension = 0x2000;
      if (([(MTLDevice *)self->_device supportsFamily:1003] & 1) != 0
        || ([(MTLDevice *)self->_device supportsFamily:2002] & 1) != 0)
      {
        int maximumTextureDimension = 0x4000;
        self->_int maximumTextureDimension = 0x4000;
      }
      else
      {
        int maximumTextureDimension = self->_maximumTextureDimension;
      }
      self->_int maximumTextureDimension = maximumTextureDimension - 1;
      BOOL v9 = self->_device;
      id v10 = [(MTLDevice *)v9 vendorName];
      self->_broken444 = [v10 containsString:@"Intel"];

      uint64_t v11 = 0;
      char v12 = 1;
      while (1)
      {
        char v13 = v12;
        uint64_t v14 = self->_device;
        id v15 = &self->_textureCacheSrc[v11];
        if (v15->value_)
        {
          CFRelease(v15->value_);
          v15->value_ = 0;
        }
        CVReturn v3 = CVMetalTextureCacheCreate(0, 0, v14, 0, &self->_textureCacheSrc[v11].value_);
        if (v3) {
          break;
        }
        id v16 = self->_device;
        BOOL v17 = &self->_textureCacheDst[v11];
        if (v17->value_)
        {
          CFRelease(v17->value_);
          v17->value_ = 0;
        }
        CVReturn v3 = CVMetalTextureCacheCreate(0, 0, v16, 0, &self->_textureCacheDst[v11].value_);
        if (v3) {
          break;
        }
        char v12 = 0;
        uint64_t v11 = 1;
        if ((v13 & 1) == 0)
        {
          id v18 = (MTLCommandQueue *)[(MTLDevice *)self->_device newCommandQueue];
          commandQueue = self->_commandQueue;
          self->_commandQueue = v18;

          if (self->_commandQueue)
          {
            id v20 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
            uint64_t v21 = self->_device;
            id v32 = 0;
            uint64_t v22 = (MTLLibrary *)[(MTLDevice *)v21 newDefaultLibraryWithBundle:v20 error:&v32];
            id v23 = v32;
            library = self->_library;
            self->_library = v22;

            if (self->_library)
            {
              CVReturn v3 = 0;
            }
            else
            {
              int64x2_t v25 = [NSURL fileURLWithPath:@"/System/Library/VideoDecoders/AV1SW.metallib"];
              uint64_t v26 = self->_device;
              id v31 = v23;
              uint64_t v27 = (MTLLibrary *)[(MTLDevice *)v26 newLibraryWithURL:v25 error:&v31];
              id v28 = v31;

              uint64_t v29 = self->_library;
              self->_library = v27;

              if (self->_library)
              {
                fwrite("Using /System/Library/VideoDecoders/AV1SW.metallib\n", 0x33uLL, 1uLL, (FILE *)*MEMORY[0x263EF8348]);
                if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_224A74000, &_os_log_internal, OS_LOG_TYPE_INFO, "Using /System/Library/VideoDecoders/AV1SW.metallib", buf, 2u);
                }
              }

              if (self->_library)
              {
                CVReturn v3 = 0;
              }
              else
              {
                if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  id v34 = v28;
                  _os_log_error_impl(&dword_224A74000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Unable to get metal library, error: %@", buf, 0xCu);
                }
                CVReturn v3 = -12911;
              }
              id v23 = v28;
            }
          }
          else
          {
            fwrite("Unable to get command queue\n\n", 0x1DuLL, 1uLL, (FILE *)*MEMORY[0x263EF8348]);
            if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_224A74000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Unable to get command queue\n", buf, 2u);
            }
            CVReturn v3 = -12911;
          }
          break;
        }
      }
    }
    else
    {
      fwrite("Unable to get metal device\n\n", 0x1CuLL, 1uLL, (FILE *)*MEMORY[0x263EF8348]);
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_224A74000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Unable to get metal device\n", buf, 2u);
      }
      return -12911;
    }
  }
  return v3;
}

- (BOOL)metalIsSupported
{
  return self->_library != 0;
}

@end