@interface AMBNRBuffers
+ (int)aliasAMBNRPyramidLevel:(id)a3 lvl:(int)a4 width:(int)a5 height:(int)a6 metal:(id)a7 scratchBuffer:(id)a8 offset:(unint64_t *)a9;
+ (int)createAMBNRPyramidForWidth:(int)a3 height:(int)a4 pyramid:(id)a5 metal:(id)a6 scratchBuffer:(id)a7 offset:(unint64_t *)a8;
+ (int)createAMBNRPyramidForWidth:(int)a3 height:(int)a4 startingLevel:(int)a5 pyramid:(id)a6 metal:(id)a7 scratchBuffer:(id)a8 offset:(unint64_t *)a9;
+ (unint64_t)calculateBytesRequiredForAMBNRPyramidWithWidth:(int)a3 height:(int)a4;
+ (unint64_t)calculateBytesRequiredForAMBNRPyramidWithWidth:(int)a3 height:(int)a4 startingLevel:(int)a5;
- (AMBNRBuffers)init;
- (void)releaseBuffers;
- (void)releasePyramidsBottom;
@end

@implementation AMBNRBuffers

- (AMBNRBuffers)init
{
  v11.receiver = self;
  v11.super_class = (Class)AMBNRBuffers;
  v2 = [(AMBNRBuffers *)&v11 init];
  if (v2)
  {
    v3 = objc_alloc_init(PyramidStorage_NRF);
    pyramid = v2->pyramid;
    v2->pyramid = v3;

    v2->pyramid->levels = 4;
    v5 = objc_alloc_init(PyramidStorage_NRF);
    noiseMapPyramid = v2->noiseMapPyramid;
    v2->noiseMapPyramid = v5;

    v2->noiseMapPyramid->levels = 4;
    v7 = objc_alloc_init(PyramidStorage_NRF);
    sharpeningPyramid = v2->sharpeningPyramid;
    v2->sharpeningPyramid = v7;

    v2->sharpeningPyramid->levels = 4;
    v9 = v2;
  }

  return v2;
}

- (void)releaseBuffers
{
  objc_msgSend_releaseBuffers(self->pyramid, a2, v2, v3);
  objc_msgSend_releaseBuffers(self->noiseMapPyramid, v5, v6, v7);
  sharpeningPyramid = self->sharpeningPyramid;

  objc_msgSend_releaseBuffers(sharpeningPyramid, v8, v9, v10);
}

- (void)releasePyramidsBottom
{
  objc_msgSend_clearLevel_(self->pyramid, a2, 0, v2);
  objc_msgSend_clearLevel_(self->noiseMapPyramid, v4, 0, v5);
  sharpeningPyramid = self->sharpeningPyramid;

  objc_msgSend_clearLevel_(sharpeningPyramid, v6, 0, v7);
}

+ (int)aliasAMBNRPyramidLevel:(id)a3 lvl:(int)a4 width:(int)a5 height:(int)a6 metal:(id)a7 scratchBuffer:(id)a8 offset:(unint64_t *)a9
{
  uint64_t v11 = *(void *)&a6;
  uint64_t v12 = *(void *)&a5;
  v14 = a3;
  id v15 = a7;
  id v17 = a8;
  if (a9)
  {
    unint64_t v18 = *a9;
    objc_msgSend_create2DTextureFromBuffer_offset_width_height_format_usage_(v15, v16, (uint64_t)v17, *a9, v12, v11, 25, 7);
  }
  else
  {
    unint64_t v18 = 0;
    objc_msgSend_create2DTextureFromBuffer_offset_width_height_format_usage_(v15, v16, (uint64_t)v17, 0, v12, v11, 25, 7);
  uint64_t v19 = };
  v20 = (void *)v14[a4 + 42];
  v14[a4 + 42] = v19;

  if (v14[a4 + 42]
    && (uint64_t v22 = a4,
        uint64_t v23 = v18 + ((2 * v12 + 63) & 0xFFFFFFC0) * (uint64_t)(int)v11,
        objc_msgSend_create2DTextureFromBuffer_offset_width_height_format_usage_(v15, v21, (uint64_t)v17, v23, ((int)v12 >> 1), ((int)v11 >> 1), 65, 7), uint64_t v24 = objc_claimAutoreleasedReturnValue(), v25 = (void *)v14[v22 + 62], v14[v22 + 62] = v24, v25, v14[v22 + 62]))
  {
    int v26 = 0;
    if (a9) {
      *a9 = v23 + ((((2 * v12) & 0xFFFFFFFC) + 63) & 0xFFFFFFC0) * ((unint64_t)(int)v11 >> 1);
    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v26 = FigSignalErrorAt();
  }

  return v26;
}

+ (unint64_t)calculateBytesRequiredForAMBNRPyramidWithWidth:(int)a3 height:(int)a4 startingLevel:(int)a5
{
  if ((a3 & 1) == 0 && (a4 & 1) == 0)
  {
    if (a5 > 3) {
      return 0;
    }
    unint64_t result = 0;
    unint64_t v6 = a4 >> a5;
    unint64_t v7 = a3 >> a5;
    int v8 = a5 - 4;
    while ((v7 & 1) == 0 && (v6 & 1) == 0)
    {
      int v9 = 2 * v7;
      uint64_t v10 = (2 * v7 + 63) & 0xFFFFFFC0;
      v7 >>= 1;
      unint64_t v11 = result + v10 * v6;
      v6 >>= 1;
      unint64_t result = v11 + (((v9 & 0xFFFFFFFC) + 63) & 0xFFFFFFC0) * v6;
      if (__CFADD__(v8++, 1)) {
        return result;
      }
    }
  }
  fig_log_get_emitter();
  FigDebugAssert3();
  return (int)FigSignalErrorAt();
}

+ (unint64_t)calculateBytesRequiredForAMBNRPyramidWithWidth:(int)a3 height:(int)a4
{
  return MEMORY[0x270F9A6D0](AMBNRBuffers, sel_calculateBytesRequiredForAMBNRPyramidWithWidth_height_startingLevel_, *(void *)&a3, *(void *)&a4);
}

+ (int)createAMBNRPyramidForWidth:(int)a3 height:(int)a4 startingLevel:(int)a5 pyramid:(id)a6 metal:(id)a7 scratchBuffer:(id)a8 offset:(unint64_t *)a9
{
  LODWORD(v11) = a5;
  v14 = a6;
  id v15 = a7;
  id v17 = a8;
  if ((a3 & 1) == 0 && (a4 & 1) == 0)
  {
    v14[2] = 4;
    if (v14[2] <= (int)v11)
    {
LABEL_14:
      int v26 = 0;
      goto LABEL_15;
    }
    unint64_t v18 = a4 >> v11;
    unint64_t v19 = a3 >> v11;
    uint64_t v11 = (int)v11;
    while ((v19 & 1) == 0 && (v18 & 1) == 0)
    {
      if (v17)
      {
        if (objc_msgSend_aliasAMBNRPyramidLevel_lvl_width_height_metal_scratchBuffer_offset_(AMBNRBuffers, v16, (uint64_t)v14, v11, v19, v18, v15, v17, a9))break; {
        *((unsigned char *)v14 + v11 + 664) = 1;
        }
        v19 >>= 1;
        v18 >>= 1;
      }
      else
      {
        uint64_t PixelBuffer = CreatePixelBuffer();
        if (!PixelBuffer) {
          break;
        }
        v21 = (const void *)PixelBuffer;
        v19 >>= 1;
        v18 >>= 1;
        uint64_t v22 = (const void *)CreatePixelBuffer();
        id v23 = v15;
        int v25 = objc_msgSend_setPixelBufferForLuma_optionalChroma_level_metal_(v14, v24, (uint64_t)v21, (uint64_t)v22, v11, v15);
        CFRelease(v21);
        CFRelease(v22);
        if (v25)
        {
          fig_log_get_emitter();
          FigDebugAssert3();
          id v15 = v23;
          goto LABEL_17;
        }
        id v15 = v23;
      }
      if (++v11 >= (int)v14[2]) {
        goto LABEL_14;
      }
    }
  }
  fig_log_get_emitter();
  FigDebugAssert3();
LABEL_17:
  int v26 = FigSignalErrorAt();
LABEL_15:

  return v26;
}

+ (int)createAMBNRPyramidForWidth:(int)a3 height:(int)a4 pyramid:(id)a5 metal:(id)a6 scratchBuffer:(id)a7 offset:(unint64_t *)a8
{
  return objc_msgSend_createAMBNRPyramidForWidth_height_startingLevel_pyramid_metal_scratchBuffer_offset_(AMBNRBuffers, a2, *(uint64_t *)&a3, *(uint64_t *)&a4, 1, a5, a6, a7, a8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->sharpeningPyramid, 0);
  objc_storeStrong((id *)&self->noiseMapPyramid, 0);

  objc_storeStrong((id *)&self->pyramid, 0);
}

@end