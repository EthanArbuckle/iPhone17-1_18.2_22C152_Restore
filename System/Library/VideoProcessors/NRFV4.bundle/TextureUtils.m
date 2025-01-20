@interface TextureUtils
+ (int)prewarmShaders:(id)a3;
- (TextureUtils)initWithMetalContext:(id)a3;
- (int)_fillTexturePaddedArea10BitPacked:(__CVBuffer *)a3 roi:(const CGRect *)a4 fullWidth:(unsigned int)a5 fullHeight:(unsigned int)a6;
- (int)_fillTexturePaddedArea:(id)a3 roi:(const CGRect *)a4;
- (int)clearTexture:(id)a3;
- (int)copyTexture:(TextureUtils *)self inputROI:(SEL)a2 outTex:(id)a3 outputROI:(id)a4;
- (int)copyTexture:(id)a3 outTex:(id)a4;
- (int)fillPaddedAreaInFrame:(__CVBuffer *)a3;
- (int)fillPaddedAreaInFrame:(__CVBuffer *)a3 roi:(const CGRect *)a4 contentExtended:(BOOL *)a5 extendedDimensions:;
- (int)fillPaddedAreaInFrame:(__CVBuffer *)a3 roi:(const CGRect *)a4 didExtend:(BOOL *)a5;
@end

@implementation TextureUtils

- (TextureUtils)initWithMetalContext:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)TextureUtils;
  v6 = [(TextureUtils *)&v14 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_metal, a3);
    v8 = +[TextureUtilsShared sharedInstance];
    uint64_t v9 = [v8 getShaders:v7->_metal];
    shaders = v7->_shaders;
    v7->_shaders = (TextureUtilsShaders *)v9;

    v11 = v7;
    if (!v7->_shaders)
    {
      FigDebugAssert3();
      if (FigSignalErrorAt()) {
        v11 = 0;
      }
      else {
        v11 = v7;
      }
    }
  }
  else
  {
    v11 = 0;
  }
  v12 = v11;

  return v12;
}

+ (int)prewarmShaders:(id)a3
{
  id v3 = a3;
  v4 = [[TextureUtilsShaders alloc] initWithMetal:v3];

  if (v4) {
    int v5 = 0;
  }
  else {
    int v5 = -12786;
  }

  return v5;
}

- (int)_fillTexturePaddedArea:(id)a3 roi:(const CGRect *)a4
{
  id v6 = a3;
  if ([v6 iosurface]) {
    IOSurfaceID ID = IOSurfaceGetID((IOSurfaceRef)[v6 iosurface]);
  }
  else {
    IOSurfaceID ID = 0;
  }
  v8 = (_DWORD *)MEMORY[0x263F00E10];
  if (*MEMORY[0x263F00E10] == 1) {
    kdebug_trace();
  }
  uint64_t v9 = [(FigMetalContext *)self->_metal commandQueue];
  v10 = [v9 commandBuffer];

  if (v10 && ([v10 computeCommandEncoder], (v11 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v12 = v11;
    IOSurfaceID v31 = ID;
    [v11 setComputePipelineState:self->_shaders->_fillTexturePaddedArea];
    [v12 setTexture:v6 atIndex:0];
    unsigned int v13 = [v6 width];
    unsigned int v14 = [v6 height];
    unsigned int v15 = v14;
    v16.i64[0] = 0;
    v16.i64[1] = __PAIR64__(v14, v13);
    int32x4_t v44 = v16;
    if (a4) {
      int32x4_t v44 = vuzp1q_s32((int32x4_t)vcvtq_u64_f64((float64x2_t)a4->origin), (int32x4_t)vcvtq_u64_f64((float64x2_t)a4->size));
    }
    [v12 setBytes:&v44 length:16 atIndex:0];
    [v12 setImageblockWidth:32 height:32];
    uint64_t v17 = v44.u32[0];
    __int32 v18 = v44.i32[2];
    unsigned int v19 = v44.i32[1] + v44.i32[3];
    unint64_t v20 = ((unint64_t)v44.u32[1] + 31) >> 5;
    if (v44.i32[1])
    {
      long long v43 = 0uLL;
      [v12 setBytes:&v43 length:16 atIndex:1];
      unint64_t v40 = ((unint64_t)v13 + 31) >> 5;
      unint64_t v41 = v20;
      uint64_t v42 = 1;
      int64x2_t v38 = vdupq_n_s64(0x20uLL);
      uint64_t v39 = 1;
      [v12 dispatchThreadgroups:&v40 threadsPerThreadgroup:&v38];
    }
    if (v19 != v15)
    {
      LODWORD(v21) = 0;
      HIDWORD(v21) = 0;
      *(void *)((char *)&v21 + 4) = v19 & 0xFFFFFFE0;
      long long v43 = v21;
      [v12 setBytes:&v43 length:16 atIndex:1];
      unint64_t v40 = ((unint64_t)v13 + 31) >> 5;
      unint64_t v41 = (((unint64_t)v15 + 31) >> 5) - (v19 >> 5);
      uint64_t v42 = 1;
      int64x2_t v38 = vdupq_n_s64(0x20uLL);
      uint64_t v39 = 1;
      [v12 dispatchThreadgroups:&v40 threadsPerThreadgroup:&v38];
    }
    unsigned int v22 = v17 + v18;
    unsigned int v23 = v19 >> 5;
    if (v17)
    {
      LODWORD(v24) = 0;
      HIDWORD(v24) = 32 * v20;
      long long v43 = v24;
      [v12 setBytes:&v43 length:16 atIndex:1];
      unint64_t v40 = (unint64_t)(v17 + 31) >> 5;
      unint64_t v41 = v23 - v20;
      uint64_t v42 = 1;
      int64x2_t v38 = vdupq_n_s64(0x20uLL);
      uint64_t v39 = 1;
      [v12 dispatchThreadgroups:&v40 threadsPerThreadgroup:&v38];
    }
    if (v22 != v13)
    {
      LODWORD(v25) = v22 & 0xFFFFFFE0;
      HIDWORD(v25) = 32 * v20;
      long long v43 = v25;
      [v12 setBytes:&v43 length:16 atIndex:1];
      unint64_t v40 = (((unint64_t)v13 + 31) >> 5) - (v22 >> 5);
      unint64_t v41 = v23 - v20;
      uint64_t v42 = 1;
      int64x2_t v38 = vdupq_n_s64(0x20uLL);
      uint64_t v39 = 1;
      [v12 dispatchThreadgroups:&v40 threadsPerThreadgroup:&v38];
    }
    [v12 endEncoding];
    v8 = (_DWORD *)MEMORY[0x263F00E10];
    if (*MEMORY[0x263F00E10])
    {
      v26 = [v10 commandQueue];
      v27 = [v26 commandBuffer];

      [v27 setLabel:@"KTRACE_MTLCMDBUF"];
      v35[0] = MEMORY[0x263EF8330];
      v35[1] = 3221225472;
      v35[2] = __43__TextureUtils__fillTexturePaddedArea_roi___block_invoke;
      v35[3] = &unk_2655C7338;
      id v28 = v6;
      id v36 = v28;
      IOSurfaceID v37 = v31;
      [v27 addCompletedHandler:v35];
      [v27 commit];
      v32[0] = MEMORY[0x263EF8330];
      v32[1] = 3221225472;
      v32[2] = __43__TextureUtils__fillTexturePaddedArea_roi___block_invoke_2;
      v32[3] = &unk_2655C7338;
      id v33 = v28;
      IOSurfaceID v34 = v31;
      [v10 addCompletedHandler:v32];
    }
    [v10 commit];

    int v29 = 0;
  }
  else
  {
    FigDebugAssert3();
    int v29 = FigSignalErrorAt();
  }
  if (*v8 == 1) {
    kdebug_trace();
  }

  return v29;
}

uint64_t __43__TextureUtils__fillTexturePaddedArea_roi___block_invoke()
{
  if (*MEMORY[0x263F00E10] == 1) {
    return kdebug_trace();
  }
  return result;
}

void __43__TextureUtils__fillTexturePaddedArea_roi___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 status] == 4)
  {
    [v2 GPUEndTime];
    [v2 GPUStartTime];
  }
  else
  {
    [v2 status];
  }
  if (*MEMORY[0x263F00E10] == 1) {
    kdebug_trace();
  }
}

- (int)_fillTexturePaddedArea10BitPacked:(__CVBuffer *)a3 roi:(const CGRect *)a4 fullWidth:(unsigned int)a5 fullHeight:(unsigned int)a6
{
  v44[0] = a5;
  IOSurface = CVPixelBufferGetIOSurface(a3);
  v11 = IOSurface;
  if (IOSurface) {
    IOSurfaceID ID = IOSurfaceGetID(IOSurface);
  }
  else {
    IOSurfaceID ID = 0;
  }
  unsigned int v13 = (_DWORD *)MEMORY[0x263F00E10];
  if (*MEMORY[0x263F00E10] == 1) {
    kdebug_trace();
  }
  if (!CVPixelBufferIsPlanar(a3)
    || !CVPixelBufferGetPlaneCount(a3)
    || (BaseAddressOfPlane = IOSurfaceGetBaseAddressOfPlane(v11, 0),
        unsigned int v15 = IOSurfaceGetBaseAddressOfPlane(v11, 1uLL),
        BaseAddressOfPlane >= v15))
  {
    FigDebugAssert3();
    int v28 = FigSignalErrorAt();
    goto LABEL_16;
  }
  int v16 = (int)v15;
  unsigned int BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(a3, 0);
  unsigned int v42 = BytesPerRowOfPlane >> 3;
  unsigned int v43 = BytesPerRowOfPlane >> 2;
  __int32 v18 = [(FigMetalContext *)self->_metal device];
  unsigned int v19 = (void *)[v18 newBufferWithIOSurface:v11];

  if (!v19)
  {
    FigDebugAssert3();
    int v28 = FigSignalErrorAt();
LABEL_24:
    unsigned int v13 = (_DWORD *)MEMORY[0x263F00E10];
    goto LABEL_16;
  }
  unint64_t v20 = [(FigMetalContext *)self->_metal commandQueue];
  long long v21 = [v20 commandBuffer];

  if (!v21)
  {
    FigDebugAssert3();
    int v28 = FigSignalErrorAt();

    goto LABEL_24;
  }
  unsigned int v22 = [v21 computeCommandEncoder];
  if (!v22)
  {
    FigDebugAssert3();
    int v28 = FigSignalErrorAt();

    goto LABEL_24;
  }
  unsigned int v23 = v22;
  IOSurfaceID v30 = ID;
  [v22 setComputePipelineState:self->_shaders->_fillTexturePaddedArea10BitPacked_Luma];
  [v23 setBuffer:v19 offset:0 atIndex:0];
  [v23 setBytes:v44 length:4 atIndex:1];
  [v23 setBytes:&v43 length:4 atIndex:2];
  int32x4_t v41 = vuzp1q_s32((int32x4_t)vcvtq_u64_f64((float64x2_t)a4->origin), (int32x4_t)vcvtq_u64_f64((float64x2_t)a4->size));
  [v23 setBytes:&v41 length:16 atIndex:3];
  v40[0] = (v44[0] + 2) / 3uLL;
  v40[1] = a6;
  v40[2] = 1;
  long long v38 = xmmword_263380170;
  uint64_t v39 = 1;
  [v23 dispatchThreads:v40 threadsPerThreadgroup:&v38];
  [v23 endEncoding];
  v44[0] >>= 1;
  unint64_t v24 = [v21 computeCommandEncoder];

  if (!v24)
  {
    FigDebugAssert3();
    int v28 = FigSignalErrorAt();

    goto LABEL_24;
  }
  [v24 setComputePipelineState:self->_shaders->_fillTexturePaddedArea10BitPacked_Chroma];
  [v24 setBuffer:v19 offset:(v16 - BaseAddressOfPlane) atIndex:0];
  [v24 setBytes:v44 length:4 atIndex:1];
  [v24 setBytes:&v42 length:4 atIndex:2];
  uint32x4_t v25 = (uint32x4_t)vuzp1q_s32((int32x4_t)vcvtq_s64_f64((float64x2_t)a4->origin), (int32x4_t)vcvtq_s64_f64((float64x2_t)a4->size));
  int32x4_t v41 = vshrq_n_s32((int32x4_t)vsraq_n_u32(v25, v25, 0x1FuLL), 1uLL);
  [v24 setBytes:&v41 length:16 atIndex:3];
  v37[0] = (v44[0] + 2) / 3uLL;
  v37[1] = a6 >> 1;
  v37[2] = 1;
  long long v35 = xmmword_263380170;
  uint64_t v36 = 1;
  [v24 dispatchThreads:v37 threadsPerThreadgroup:&v35];
  [v24 endEncoding];
  unsigned int v13 = (_DWORD *)MEMORY[0x263F00E10];
  if (*MEMORY[0x263F00E10])
  {
    v26 = [v21 commandQueue];
    v27 = [v26 commandBuffer];

    [v27 setLabel:@"KTRACE_MTLCMDBUF"];
    v33[0] = MEMORY[0x263EF8330];
    v33[1] = 3221225472;
    v33[2] = __75__TextureUtils__fillTexturePaddedArea10BitPacked_roi_fullWidth_fullHeight___block_invoke;
    v33[3] = &__block_descriptor_44_e28_v16__0___MTLCommandBuffer__8l;
    v33[4] = a3;
    IOSurfaceID v34 = v30;
    [v27 addCompletedHandler:v33];
    [v27 commit];
    v31[0] = MEMORY[0x263EF8330];
    v31[1] = 3221225472;
    v31[2] = __75__TextureUtils__fillTexturePaddedArea10BitPacked_roi_fullWidth_fullHeight___block_invoke_2;
    v31[3] = &__block_descriptor_44_e28_v16__0___MTLCommandBuffer__8l;
    v31[4] = a3;
    IOSurfaceID v32 = v30;
    [v21 addCompletedHandler:v31];
  }
  [v21 commit];

  int v28 = 0;
LABEL_16:
  if (*v13 == 1) {
    kdebug_trace();
  }
  return v28;
}

uint64_t __75__TextureUtils__fillTexturePaddedArea10BitPacked_roi_fullWidth_fullHeight___block_invoke()
{
  if (*MEMORY[0x263F00E10] == 1) {
    return kdebug_trace();
  }
  return result;
}

void __75__TextureUtils__fillTexturePaddedArea10BitPacked_roi_fullWidth_fullHeight___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 status] == 4)
  {
    [v2 GPUEndTime];
    [v2 GPUStartTime];
  }
  else
  {
    [v2 status];
  }
  if (*MEMORY[0x263F00E10] == 1) {
    kdebug_trace();
  }
}

- (int)fillPaddedAreaInFrame:(__CVBuffer *)a3
{
  return [(TextureUtils *)self fillPaddedAreaInFrame:a3 roi:0 didExtend:0];
}

- (int)fillPaddedAreaInFrame:(__CVBuffer *)a3 roi:(const CGRect *)a4 didExtend:(BOOL *)a5
{
  if (CVPixelBufferIsPlanar(a3))
  {
    unsigned int WidthOfPlane = CVPixelBufferGetWidthOfPlane(a3, 0);
    unsigned int HeightOfPlane = CVPixelBufferGetHeightOfPlane(a3, 0);
    v35[0] = 0;
    v35[1] = 0;
    *(double *)&v35[2] = (double)WidthOfPlane;
    *(double *)&v35[3] = (double)HeightOfPlane;
    v11 = (const CGRect *)v35;
    if (a4) {
      v12 = a4;
    }
    else {
      v12 = (const CGRect *)v35;
    }
    uint64_t v13 = (WidthOfPlane + 15) & 0xFFFFFFF0;
    uint64_t v14 = (HeightOfPlane + 15) & 0xFFFFFFF0;
    if (v12->origin.x == 0.0)
    {
      if (a4) {
        v11 = a4;
      }
      if (v11->origin.y == 0.0)
      {
        unsigned int v15 = (const CGRect *)v35;
        int v16 = a4 ? a4 : (const CGRect *)v35;
        if (v16->size.width == (double)v13)
        {
          if (a4) {
            unsigned int v15 = a4;
          }
          if (v15->size.height == (double)v14)
          {
            uint64_t v17 = 0;
            __int32 v18 = 0;
LABEL_51:
            int v24 = 0;
            goto LABEL_52;
          }
        }
      }
    }
    signed int PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
    int v20 = 0;
    if (PixelFormatType > 792225327)
    {
      if (PixelFormatType > 2084070959)
      {
        if (PixelFormatType == 2084070960) {
          goto LABEL_29;
        }
        int v21 = 2088265264;
      }
      else
      {
        if (PixelFormatType == 792225328) {
          goto LABEL_29;
        }
        int v21 = 796419632;
      }
    }
    else
    {
      if (PixelFormatType <= 758670895)
      {
        if (PixelFormatType != 641230384)
        {
          int v21 = 645424688;
          goto LABEL_28;
        }
LABEL_29:
        int v20 = 1;
LABEL_30:
        int v22 = 1;
        if (PixelFormatType <= 796419631)
        {
          if (PixelFormatType == 645424688) {
            goto LABEL_37;
          }
          int v23 = 762865200;
        }
        else
        {
          if (PixelFormatType == 796419632 || PixelFormatType == 2088265264) {
            goto LABEL_37;
          }
          int v23 = 1885745712;
        }
        if (PixelFormatType != v23)
        {
LABEL_38:
          size_t extraRowsOnBottom = 0;
          CVPixelBufferGetExtendedPixels(a3, 0, 0, 0, &extraRowsOnBottom);
          int v24 = -73267;
          if (CVPixelBufferGetBytesPerRowOfPlane(a3, 0) < v13) {
            goto LABEL_40;
          }
          size_t v25 = CVPixelBufferGetHeightOfPlane(a3, 0);
          if (extraRowsOnBottom + v25 < v14) {
            goto LABEL_40;
          }
          if ((v20 | v22))
          {
            __int32 v18 = [(FigMetalContext *)self->_metal bindPixelBufferToMTL2DTexture:a3 pixelFormat:+[LumaChromaImage getMetalLumaFormat:a3] usage:7 plane:0 alignmentFactor:16];
            if (v18)
            {
              int v26 = [(TextureUtils *)self _fillTexturePaddedArea:v18 roi:v12];
              if (!v26)
              {
                v27 = (const CGRect *)v35;
                if (a4) {
                  v27 = a4;
                }
                double v28 = (double)((int)v27->origin.y / 2);
                int width = (int)v27->size.width;
                int height = (int)v27->size.height;
                v33[0] = (double)((int)v12->origin.x / 2);
                v33[1] = v28;
                v33[2] = (double)(width / 2);
                v33[3] = (double)(height / 2);
                uint64_t v17 = [(FigMetalContext *)self->_metal bindPixelBufferToMTL2DTexture:a3 pixelFormat:+[LumaChromaImage getMetalChromaFormat:a3] usage:7 plane:1 alignmentFactor:8];
                if (!v17)
                {
                  FigDebugAssert3();
                  int v24 = FigSignalErrorAt();
                  goto LABEL_52;
                }
                int v31 = [(TextureUtils *)self _fillTexturePaddedArea:v17 roi:v33];
                if (v31)
                {
                  int v24 = v31;
                  FigDebugAssert3();
                  goto LABEL_52;
                }
                if (!a5) {
                  goto LABEL_51;
                }
LABEL_49:
                int v24 = 0;
                *a5 = 1;
                goto LABEL_52;
              }
              int v24 = v26;
              FigDebugAssert3();
            }
            else
            {
              FigDebugAssert3();
              int v24 = FigSignalErrorAt();
            }
            uint64_t v17 = 0;
            goto LABEL_52;
          }
          [(TextureUtils *)self _fillTexturePaddedArea10BitPacked:a3 roi:v12 fullWidth:v13 fullHeight:v14];
          uint64_t v17 = 0;
          __int32 v18 = 0;
          if (!a5) {
            goto LABEL_51;
          }
          goto LABEL_49;
        }
LABEL_37:
        int v22 = 0;
        goto LABEL_38;
      }
      if (PixelFormatType == 758670896) {
        goto LABEL_29;
      }
      int v21 = 762865200;
    }
LABEL_28:
    if (PixelFormatType != v21) {
      goto LABEL_30;
    }
    goto LABEL_29;
  }
  FigDebugAssert3();
  int v24 = FigSignalErrorAt();
LABEL_40:
  uint64_t v17 = 0;
  __int32 v18 = 0;
LABEL_52:

  return v24;
}

- (int)fillPaddedAreaInFrame:(__CVBuffer *)a3 roi:(const CGRect *)a4 contentExtended:(BOOL *)a5 extendedDimensions:
{
  id v6 = v5;
  BOOL v13 = 0;
  int v9 = [(TextureUtils *)self fillPaddedAreaInFrame:a3 roi:a4 didExtend:&v13];
  if (v9)
  {
    FigDebugAssert3();
  }
  else
  {
    BOOL v10 = v13;
    *a5 = v13;
    if (v10)
    {
      unsigned int WidthOfPlane = CVPixelBufferGetWidthOfPlane(a3, 0);
      unint64_t *v6 = *(void *)&vadd_s32((int32x2_t)__PAIR64__(CVPixelBufferGetHeightOfPlane(a3, 0), WidthOfPlane), (int32x2_t)0xF0000000FLL) & 0xFFFFFFF0FFFFFFF0;
    }
  }
  return v9;
}

- (int)copyTexture:(id)a3 outTex:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [v7 width];
  [v7 height];
  [v6 width];
  [v6 height];
  LODWORD(self) = [(TextureUtils *)self copyTexture:v7 inputROI:v6 outTex:0.0 outputROI:0.0];

  return (int)self;
}

- (int)copyTexture:(TextureUtils *)self inputROI:(SEL)a2 outTex:(id)a3 outputROI:(id)a4
{
  int8x16_t v25 = v6;
  int8x16_t v26 = v5;
  v33[16] = *MEMORY[0x263EF8340];
  id v9 = a3;
  int8x16_t v32 = v26;
  int8x16_t v31 = v25;
  id v10 = a4;
  v11 = [(FigMetalContext *)self->_metal commandQueue];
  v12 = [v11 commandBuffer];

  if (!v12)
  {
    uint64_t v24 = v4;
    LODWORD(v23) = 0;
    FigDebugAssert3();
    int v20 = FigSignalErrorAt();
    BOOL v13 = 0;
    goto LABEL_29;
  }
  BOOL v13 = [v12 computeCommandEncoder];
  if (!v13)
  {
    uint64_t v24 = v4;
    LODWORD(v23) = 0;
    FigDebugAssert3();
    int v20 = FigSignalErrorAt();
    goto LABEL_29;
  }
  int v14 = [v10 isCompressed];
  if (v14) {
    uint64_t v15 = 32;
  }
  else {
    uint64_t v15 = 4;
  }
  if (v14) {
    uint64_t v16 = 32;
  }
  else {
    uint64_t v16 = 64;
  }
  if (([v10 pixelFormat] == 588 || objc_msgSend(v10, "pixelFormat") == 589)
    && (vorrq_s8((int8x16_t)vdupq_lane_s32(*(int32x2_t *)v26.i8, 1), v26).u32[0]
     || v26.i64[1] != __PAIR64__([v9 height], objc_msgSend(v9, "width"))
     || vorrq_s8((int8x16_t)vdupq_lane_s32(*(int32x2_t *)v25.i8, 1), v25).u32[0]
     || v25.i64[1] != __PAIR64__([v10 height], objc_msgSend(v10, "width")))
    || v26.i64[1] != v25.i64[1])
  {
    int v30 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    int v22 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    int v20 = -73267;
LABEL_29:
    uint64_t v17 = v10;
    goto LABEL_27;
  }
  if (([v10 isCompressed] & 1) != 0 || objc_msgSend(v10, "pixelFormat") != 588)
  {
    if (([v10 isCompressed] & 1) != 0 || objc_msgSend(v10, "pixelFormat") != 589)
    {
      [v13 setBytes:&v32 length:16 atIndex:0];
      [v13 setBytes:&v31 length:16 atIndex:1];
      [v13 setComputePipelineState:self->_shaders->_copyTexture];
      uint64_t v17 = v10;
      goto LABEL_26;
    }
    uint64_t v17 = [(FigMetalContext *)self->_metal rebindTex:v10 format:103 usage:6 plane:1 xFactor:3];

    if (v17)
    {
      kernelPack10BitCbCr = self->_shaders->_kernelPack10BitCbCr;
      goto LABEL_24;
    }
    uint64_t v24 = v4;
    LODWORD(v23) = 0;
LABEL_34:
    FigDebugAssert3();
    int v20 = FigSignalErrorAt();
    goto LABEL_27;
  }
  uint64_t v17 = [(FigMetalContext *)self->_metal rebindTex:v10 format:53 usage:6 plane:0 xFactor:3];

  if (!v17)
  {
    uint64_t v24 = v4;
    LODWORD(v23) = 0;
    goto LABEL_34;
  }
  kernelPack10BitCbCr = self->_shaders->_kernelPack10BitY;
LABEL_24:
  [v13 setComputePipelineState:kernelPack10BitCbCr];
LABEL_26:
  [v13 setTexture:v9 atIndex:0];
  [v13 setTexture:v17 atIndex:1];
  *(void *)&long long v19 = v31.u32[2];
  *((void *)&v19 + 1) = v31.u32[3];
  long long v27 = v19;
  uint64_t v28 = 1;
  v33[0] = v16;
  v33[1] = v15;
  v33[2] = 1;
  [v13 dispatchThreads:&v27 threadsPerThreadgroup:v33];
  [v13 endEncoding];

  [v12 commit];
  BOOL v13 = 0;
  int v20 = 0;
LABEL_27:
  objc_msgSend(v13, "endEncoding", v23, v24);

  return v20;
}

- (int)clearTexture:(id)a3
{
  id v4 = a3;
  int8x16_t v5 = [(FigMetalContext *)self->_metal commandQueue];
  int8x16_t v6 = [v5 commandBuffer];

  if (v6
    && ([MEMORY[0x263F129A0] renderPassDescriptor],
        (id v7 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v8 = v7;
    id v9 = [v7 colorAttachments];
    id v10 = [v9 objectAtIndexedSubscript:0];
    [v10 setTexture:v4];

    v11 = [v8 colorAttachments];
    v12 = [v11 objectAtIndexedSubscript:0];
    [v12 setLoadAction:2];

    BOOL v13 = [v8 colorAttachments];
    int v14 = [v13 objectAtIndexedSubscript:0];
    [v14 setStoreAction:1];

    uint64_t v15 = [v8 colorAttachments];
    uint64_t v16 = [v15 objectAtIndexedSubscript:0];
    objc_msgSend(v16, "setClearColor:", 0.0, 0.0, 0.0, 1.0);

    uint64_t v17 = [v6 renderCommandEncoderWithDescriptor:v8];
    if (v17)
    {
      __int32 v18 = v17;
      [v17 endEncoding];
      [v6 commit];

      int v19 = 0;
    }
    else
    {
      FigDebugAssert3();
      int v19 = FigSignalErrorAt();
    }
  }
  else
  {
    FigDebugAssert3();
    int v19 = FigSignalErrorAt();
  }

  return v19;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shaders, 0);

  objc_storeStrong((id *)&self->_metal, 0);
}

@end