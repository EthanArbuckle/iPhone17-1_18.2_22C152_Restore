@interface PyramidStorage
+ (id)createTextureAlias:(id)a3;
+ (int)allocatePyramidWithMetalContext:(id)a3 label:(id)a4 width:(unint64_t)a5 height:(unint64_t)a6 isFP16:(BOOL)a7 createLuma:(BOOL)a8 createChroma:(BOOL)a9 pyramid:(id)a10;
+ (int)allocatePyramidWithMetalContext:(id)a3 label:(id)a4 width:(unint64_t)a5 height:(unint64_t)a6 isFP16:(BOOL)a7 createLuma:(BOOL)a8 createChroma:(BOOL)a9 startingLevel:(BOOL)a10 testSize:(BOOL)a11 pyramid:(id)a12;
+ (int)allocatePyramidWithMetalContext:(id)a3 label:(id)a4 width:(unint64_t)a5 height:(unint64_t)a6 isFP16:(BOOL)a7 pyramid:(id)a8;
+ (int)allocatePyramidWithWidth:(unsigned __int16)a3 height:(unsigned __int16)a4 allocLevel0:(BOOL)a5 levels:(unsigned __int8)a6 texUsage:(unint64_t)a7 mtlSubAllocatorID:(unsigned int)a8 label:(id)a9 lumaFormat:(unint64_t)a10 chromaFormat:(unint64_t)a11 outPyramid:(id)a12 metal:(id)a13;
+ (int)overlappingLevelsMemorySize:(unsigned __int16)a3 height:(unsigned __int16)a4 allocLevel0:(BOOL)a5 levels:(unsigned __int8)a6 lumaFormat:(unint64_t)a7 chromaFormat:(unint64_t)a8 outSize:(unint64_t *)a9 metal:(id)a10;
+ (int)pyramidMemorySize:(unsigned __int16)a3 height:(unsigned __int16)a4 allocLevel0:(BOOL)a5 levels:(unsigned __int8)a6 lumaFormat:(unint64_t)a7 chromaFormat:(unint64_t)a8 outSize:(unint64_t *)a9 metal:(id)a10;
+ (int)pyramidMemorySize:(unsigned __int16)a3 height:(unsigned __int16)a4 overlapLevels:(BOOL)a5 allocLevel0:(BOOL)a6 levels:(unsigned __int8)a7 lumaFormat:(unint64_t)a8 chromaFormat:(unint64_t)a9 outSize:(unint64_t *)a10 metal:(id)a11;
+ (void)makePyramidAliasable:(id)a3 metal:(id)a4;
+ (void)makePyramidAliasable:(id)a3 metal:(id)a4 releaseBand0:(BOOL)a5;
- (int)setLumaTexture:(id)a3 chromaTexture:(id)a4 level:(int)a5 metal:(id)a6;
- (int)setLumaTexture:(id)a3 level:(int)a4;
- (int)setPixelBuffer:(__CVBuffer *)a3 level:(int)a4 metal:(id)a5;
- (int)setPixelBuffer:(__CVBuffer *)a3 level:(int)a4 texUsage:(unint64_t)a5 metal:(id)a6;
- (int)setPixelBuffer:(__CVBuffer *)a3 level:(int)a4 texUsage:(unint64_t)a5 metal:(id)a6 alignDims:(BOOL)a7;
- (int)setPixelBufferFloat16:(__CVBuffer *)a3 chromaBuffer:(__CVBuffer *)a4 level:(int)a5 metal:(id)a6;
- (int)setPixelBufferForLuma:(__CVBuffer *)a3 optionalChroma:(__CVBuffer *)a4 level:(int)a5 metal:(id)a6;
- (int)setYCbCrBand0Texture:(id)a3;
- (void)clearLevel:(int)a3;
- (void)dealloc;
- (void)releaseBuffers;
@end

@implementation PyramidStorage

+ (void)makePyramidAliasable:(id)a3 metal:(id)a4
{
}

+ (void)makePyramidAliasable:(id)a3 metal:(id)a4 releaseBand0:(BOOL)a5
{
  BOOL v5 = a5;
  v12 = a3;
  id v7 = a4;
  v8 = v12;
  if (v12)
  {
    int v9 = !v5;
    if (v12[2] > !v5)
    {
      v10 = &v12[2 * v9 + 124];
      do
      {
        if (*(v10 - 20)) {
          FigMetalDecRef();
        }
        if (*v10) {
          FigMetalDecRef();
        }
        v8 = v12;
        ++v10;
        ++v9;
      }
      while (v12[2] > v9);
    }
    if (v5)
    {
      v11 = (void *)*((void *)v8 + 82);
      *((void *)v8 + 82) = 0;
    }
  }
}

+ (int)allocatePyramidWithMetalContext:(id)a3 label:(id)a4 width:(unint64_t)a5 height:(unint64_t)a6 isFP16:(BOOL)a7 createLuma:(BOOL)a8 createChroma:(BOOL)a9 pyramid:(id)a10
{
  return +[PyramidStorage allocatePyramidWithMetalContext:label:width:height:isFP16:createLuma:createChroma:startingLevel:testSize:pyramid:](PyramidStorage, "allocatePyramidWithMetalContext:label:width:height:isFP16:createLuma:createChroma:startingLevel:testSize:pyramid:", a3, a4, a5, a6, a7, a8);
}

+ (int)allocatePyramidWithMetalContext:(id)a3 label:(id)a4 width:(unint64_t)a5 height:(unint64_t)a6 isFP16:(BOOL)a7 createLuma:(BOOL)a8 createChroma:(BOOL)a9 startingLevel:(BOOL)a10 testSize:(BOOL)a11 pyramid:(id)a12
{
  BOOL v43 = a8;
  id v44 = a3;
  id v15 = a4;
  v16 = a12;
  if (a5 & 1) != 0 || (a6)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v18 = 0;
LABEL_21:
    int v39 = FigSignalErrorAt();
    goto LABEL_19;
  }
  v17 = [v44 allocator];
  v18 = (void *)[v17 newTextureDescriptor];

  if (!v18)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    goto LABEL_21;
  }
  uint64_t v19 = a10;
  v20 = [v18 desc];
  [v20 setUsage:7];

  if (v16[2] > a10)
  {
    unint64_t v21 = a6 >> a10;
    unint64_t v22 = a5 >> a10;
    v23 = v16 + 166;
    v41 = v16;
    v24 = (void **)&v16[2 * a10 + 124];
    while (1)
    {
      if (a11 && ((v22 & 1) != 0 || (v21 & 1) != 0))
      {
LABEL_20:
        fig_log_get_emitter();
        FigDebugAssert3();
        v16 = v41;
        goto LABEL_21;
      }
      if (v43)
      {
        [v18 setLabel:0];
        v25 = [v18 desc];
        [v25 setWidth:v22];

        v26 = [v18 desc];
        [v26 setHeight:v21];

        v27 = [v18 desc];
        [v27 setPixelFormat:25];

        v28 = [v44 allocator];
        uint64_t v29 = [v28 newTextureWithDescriptor:v18];
        v30 = *(v24 - 20);
        *(v24 - 20) = (void *)v29;

        if (!*(v24 - 20)) {
          goto LABEL_20;
        }
        if (!a9)
        {
LABEL_15:
          v38 = *v24;
          *v24 = 0;

          goto LABEL_16;
        }
      }
      else
      {
        v37 = *(v24 - 20);
        *(v24 - 20) = 0;

        if (!a9) {
          goto LABEL_15;
        }
      }
      [v18 setLabel:0];
      v31 = [v18 desc];
      [v31 setWidth:v22 >> 1];

      v32 = [v18 desc];
      [v32 setHeight:v21 >> 1];

      v33 = [v18 desc];
      [v33 setPixelFormat:65];

      v34 = [v44 allocator];
      uint64_t v35 = [v34 newTextureWithDescriptor:v18];
      v36 = *v24;
      *v24 = (void *)v35;

      if (!*v24) {
        goto LABEL_20;
      }
LABEL_16:
      v22 >>= 1;
      v21 >>= 1;
      *((unsigned char *)v23 + v19++) = a7;
      ++v24;
      if (v41[2] <= (int)v19)
      {
        int v39 = 0;
        v16 = v41;
        goto LABEL_19;
      }
    }
  }
  int v39 = 0;
LABEL_19:

  return v39;
}

+ (int)allocatePyramidWithMetalContext:(id)a3 label:(id)a4 width:(unint64_t)a5 height:(unint64_t)a6 isFP16:(BOOL)a7 pyramid:(id)a8
{
  LOBYTE(v9) = 1;
  return +[PyramidStorage allocatePyramidWithMetalContext:a3 label:a4 width:a5 height:a6 isFP16:a7 createLuma:1 createChroma:v9 pyramid:a8];
}

+ (int)pyramidMemorySize:(unsigned __int16)a3 height:(unsigned __int16)a4 overlapLevels:(BOOL)a5 allocLevel0:(BOOL)a6 levels:(unsigned __int8)a7 lumaFormat:(unint64_t)a8 chromaFormat:(unint64_t)a9 outSize:(unint64_t *)a10 metal:(id)a11
{
  BOOL v25 = a5;
  unsigned int v26 = a7;
  BOOL v12 = a6;
  unsigned int v13 = a4;
  unsigned int v14 = a3;
  id v27 = a11;
  if (!a10
    || (v14 & 1) != 0
    || (v13 & 1) != 0
    || !(a9 | a8)
    || (unsigned int v15 = !v12, v26 <= v15)
    || a8 && ![v27 getPixelSizeInBytes:a8]
    || a9 && ![v27 getPixelSizeInBytes:a9])
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v23 = FigSignalErrorAt();
  }
  else
  {
    unint64_t v16 = 0;
    do
    {
      uint64_t v17 = v13 >> v15;
      unint64_t v18 = computeTextureStrideForBufferAllocation(v14 >> v15, a8, v27) * v17;
      uint64_t v20 = computeTextureStrideForBufferAllocation(v14 >> v15 >> 1, a9, v27);
      uint64_t v19 = v17 >> 1;
      unint64_t v21 = v20 * v19;
      if (v25)
      {
        if (v16 <= v18) {
          unint64_t v22 = v18;
        }
        else {
          unint64_t v22 = v16;
        }
        if (v22 <= v21) {
          unint64_t v16 = v20 * v19;
        }
        else {
          unint64_t v16 = v22;
        }
      }
      else
      {
        v16 += v18 + v21;
      }
      ++v15;
    }
    while (v26 != v15);
    int v23 = 0;
    *a10 = v16;
  }

  return v23;
}

+ (int)pyramidMemorySize:(unsigned __int16)a3 height:(unsigned __int16)a4 allocLevel0:(BOOL)a5 levels:(unsigned __int8)a6 lumaFormat:(unint64_t)a7 chromaFormat:(unint64_t)a8 outSize:(unint64_t *)a9 metal:(id)a10
{
  return +[PyramidStorage pyramidMemorySize:a3 height:a4 overlapLevels:0 allocLevel0:a5 levels:a6 lumaFormat:a7 chromaFormat:a8 outSize:a9 metal:a10];
}

+ (int)overlappingLevelsMemorySize:(unsigned __int16)a3 height:(unsigned __int16)a4 allocLevel0:(BOOL)a5 levels:(unsigned __int8)a6 lumaFormat:(unint64_t)a7 chromaFormat:(unint64_t)a8 outSize:(unint64_t *)a9 metal:(id)a10
{
  return +[PyramidStorage pyramidMemorySize:a3 height:a4 overlapLevels:1 allocLevel0:a5 levels:a6 lumaFormat:a7 chromaFormat:a8 outSize:a9 metal:a10];
}

+ (int)allocatePyramidWithWidth:(unsigned __int16)a3 height:(unsigned __int16)a4 allocLevel0:(BOOL)a5 levels:(unsigned __int8)a6 texUsage:(unint64_t)a7 mtlSubAllocatorID:(unsigned int)a8 label:(id)a9 lumaFormat:(unint64_t)a10 chromaFormat:(unint64_t)a11 outPyramid:(id)a12 metal:(id)a13
{
  uint64_t v13 = *(void *)&a8;
  unsigned int v15 = a6;
  BOOL v16 = a5;
  unsigned int v17 = a4;
  unsigned int v18 = a3;
  id v56 = a9;
  uint64_t v19 = a12;
  id v20 = a13;
  unint64_t v21 = v20;
  unsigned int v61 = v18;
  if ((v18 & 1) != 0 || (v17 & 1) != 0 || __PAIR128__(a11, a10) == 0 || (uint64_t v22 = !v16, v15 <= v22))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v24 = 0;
    v28 = 0;
    goto LABEL_36;
  }
  if (!v19)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v24 = 0;
LABEL_34:
    v28 = 0;
    goto LABEL_36;
  }
  v19[2] = v15;
  int v23 = [v20 allocator];
  v24 = (void *)[v23 newTextureDescriptor:v13];

  if (!v24)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    goto LABEL_34;
  }
  BOOL v25 = [v24 desc];
  [v25 setUsage:a7];

  unsigned int v26 = [v24 desc];
  [v26 setPixelFormat:a10];

  id v27 = [v21 allocator];
  v28 = (void *)[v27 newTextureDescriptor:v13];

  if (!v28)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
LABEL_36:
    v54 = v56;
LABEL_37:
    int v53 = FigSignalErrorAt();
    goto LABEL_29;
  }
  uint64_t v29 = [v28 desc];
  [v29 setUsage:a7];

  v30 = [v28 desc];
  [v30 setPixelFormat:a11];

  if (v19[2] > (int)v22)
  {
    v63 = v28;
    if (a10) {
      BOOL v31 = 0;
    }
    else {
      BOOL v31 = a11 == 65;
    }
    char v32 = v31;
    char v57 = v32;
    unsigned int v58 = v17;
    uint64_t v33 = v22 | 0x298;
    uint64_t v34 = 2 * v22;
    v60 = v21;
    unsigned int v59 = v13;
    while (1)
    {
      uint64_t v35 = &v19[v34];
      v36 = *(const void **)&v19[v34 + 4];
      if (v36)
      {
        CFRelease(v36);
        *((void *)v35 + 2) = 0;
      }
      v37 = (const void *)*((void *)v35 + 22);
      if (v37)
      {
        CFRelease(v37);
        *((void *)v35 + 22) = 0;
      }
      uint64_t v38 = v61 >> v22;
      uint64_t v39 = v17 >> v22;
      v40 = (void **)&v19[v34 + 84];
      FigMetalDecRef();
      v62 = (void **)&v19[v34 + 124];
      FigMetalDecRef();
      [v24 desc];
      v42 = v41 = v19;
      [v42 setWidth:v38];

      BOOL v43 = [v24 desc];
      [v43 setHeight:v39];

      [v24 setLabel:0];
      id v44 = [v63 desc];
      [v44 setWidth:v38 >> 1];

      v45 = [v63 desc];
      [v45 setHeight:v39 >> 1];

      [v63 setLabel:0];
      if (a10 == 25)
      {
        *((unsigned char *)v41 + v33) = 1;
        uint64_t v19 = v41;
        unint64_t v21 = v60;
        uint64_t v46 = v59;
      }
      else
      {
        *((unsigned char *)v41 + v33) = v57;
        uint64_t v19 = v41;
        unint64_t v21 = v60;
        uint64_t v46 = v59;
        if (!a10) {
          goto LABEL_24;
        }
      }
      v47 = [v21 allocator];
      uint64_t v48 = [v47 newTextureWithDescriptor:v24 subAllocatorID:v46];
      v49 = *v40;
      *v40 = (void *)v48;

      if (!*v40) {
        goto LABEL_30;
      }
LABEL_24:
      if (a11)
      {
        v50 = [v21 allocator];
        uint64_t v51 = [v50 newTextureWithDescriptor:v63 subAllocatorID:v46];
        v52 = *v62;
        *v62 = (void *)v51;

        if (!*v62)
        {
LABEL_30:
          fig_log_get_emitter();
          FigDebugAssert3();
          v54 = v56;
          v28 = v63;
          goto LABEL_37;
        }
      }
      LODWORD(v22) = v22 + 1;
      ++v33;
      v34 += 2;
      unsigned int v17 = v58;
      if (v19[2] <= (int)v22)
      {
        int v53 = 0;
        v54 = v56;
        v28 = v63;
        goto LABEL_29;
      }
    }
  }
  int v53 = 0;
  v54 = v56;
LABEL_29:

  return v53;
}

+ (id)createTextureAlias:(id)a3
{
  v3 = (char *)a3;
  if (v3)
  {
    uint64_t v4 = objc_opt_new();
    BOOL v5 = (id *)v4;
    if (v4)
    {
      *(_DWORD *)(v4 + 8) = *((_DWORD *)v3 + 2);
      if (*((int *)v3 + 2) >= 1)
      {
        uint64_t v6 = 0;
        uint64_t v7 = 0;
        v8 = v3 + 664;
        uint64_t v9 = v4 + 664;
        do
        {
          objc_storeStrong((id *)(v9 + v6 - 328), *(id *)&v8[v6 - 328]);
          objc_storeStrong((id *)(v9 + v6 - 168), *(id *)&v8[v6 - 168]);
          *(unsigned char *)(v9 + v7) = v8[v7];
          ++v7;
          v6 += 8;
        }
        while (v7 < *((int *)v3 + 2));
      }
      objc_storeStrong(v5 + 82, *((id *)v3 + 82));
    }
    else
    {
      fig_log_get_emitter();
      FigDebugAssert3();
    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    BOOL v5 = 0;
  }

  return v5;
}

- (void)clearLevel:(int)a3
{
  int levels = self->levels;
  if (levels)
  {
    if (a3 < 0 || levels <= a3)
    {
      fig_log_get_emitter();
      FigDebugAssert3();
    }
    else
    {
      pixelBuffer = self->pixelBuffer;
      uint64_t v7 = self->pixelBuffer[a3];
      if (v7)
      {
        CFRelease(v7);
        pixelBuffer[a3] = 0;
      }
      v8 = self->pixelBuffer2[a3];
      if (v8)
      {
        CFRelease(v8);
        self->pixelBuffer2[a3] = 0;
      }
      uint64_t v9 = &self->super.isa + a3;
      Class v10 = v9[42];
      v9[42] = 0;

      Class v11 = v9[62];
      v9[62] = 0;

      if (!a3)
      {
        textureYCbCrBand0 = self->textureYCbCrBand0;
        self->textureYCbCrBand0 = 0;
      }
      self->isFP16[a3] = 0;
    }
  }
}

- (int)setLumaTexture:(id)a3 chromaTexture:(id)a4 level:(int)a5 metal:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  if ((a5 & 0x80000000) == 0
    && self->levels > a5
    && (uint64_t v12 = [v10 pixelFormat], (v12 == 25) == (objc_msgSend(v11, "pixelFormat") == 65))
    && (self->isFP16[a5] = v12 == 25,
        uint64_t v13 = (id *)(&self->super.isa + a5),
        objc_storeStrong(v13 + 42, a3),
        v13[42])
    && (unsigned int v14 = (id *)(&self->super.isa + a5), objc_storeStrong(v14 + 62, a4), v14[62]))
  {
    if (!a5)
    {
      textureYCbCrBand0 = self->textureYCbCrBand0;
      self->textureYCbCrBand0 = 0;
    }
    int v16 = 0;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v16 = FigSignalErrorAt();
  }

  return v16;
}

- (int)setLumaTexture:(id)a3 level:(int)a4
{
  id v7 = a3;
  v8 = v7;
  if (a4 < 0
    || self->levels <= a4
    || (self->isFP16[a4] = [v7 pixelFormat] == 25,
        uint64_t v9 = (id *)(&self->super.isa + a4),
        objc_storeStrong(v9 + 42, a3),
        !v9[42]))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v11 = FigSignalErrorAt();
  }
  else
  {
    if (!a4)
    {
      textureYCbCrBand0 = self->textureYCbCrBand0;
      self->textureYCbCrBand0 = 0;
    }
    int v11 = 0;
  }

  return v11;
}

- (int)setYCbCrBand0Texture:(id)a3
{
  return 0;
}

- (int)setPixelBuffer:(__CVBuffer *)a3 level:(int)a4 texUsage:(unint64_t)a5 metal:(id)a6
{
  return [(PyramidStorage *)self setPixelBuffer:a3 level:*(void *)&a4 texUsage:a5 metal:a6 alignDims:0];
}

- (int)setPixelBuffer:(__CVBuffer *)a3 level:(int)a4 texUsage:(unint64_t)a5 metal:(id)a6 alignDims:(BOOL)a7
{
  BOOL v7 = a7;
  id v12 = a6;
  if (a4 < 0 || self->levels <= a4) {
    goto LABEL_20;
  }
  pixelBuffer = self->pixelBuffer;
  unsigned int v14 = self->pixelBuffer[a4];
  if (v14)
  {
    CFRelease(v14);
    pixelBuffer[a4] = 0;
  }
  unsigned int v15 = self->pixelBuffer2[a4];
  if (v15)
  {
    CFRelease(v15);
    self->pixelBuffer2[a4] = 0;
  }
  pixelBuffer[a4] = a3;
  if (a3) {
    CFRetain(a3);
  }
  unsigned int v16 = 1;
  if (v7) {
    unsigned int v16 = 1 << self->levels;
  }
  uint64_t v17 = [v12 bindPixelBufferToMTL2DTexture:a3 pixelFormat:10 usage:a5 plane:0 alignmentFactor:v16];
  unsigned int v18 = &self->super.isa + a4;
  Class v19 = v18[42];
  v18[42] = (Class)v17;

  if (!v18[42]) {
    goto LABEL_20;
  }
  uint64_t v20 = v16 <= 1 ? 1 : v16 >> 1;
  uint64_t v21 = [v12 bindPixelBufferToMTL2DTexture:a3 pixelFormat:30 usage:a5 plane:1 alignmentFactor:v20];
  Class v22 = v18[62];
  v18[62] = (Class)v21;

  if (v18[62])
  {
    if (!a4)
    {
      textureYCbCrBand0 = self->textureYCbCrBand0;
      self->textureYCbCrBand0 = 0;
    }
    int v24 = 0;
    self->isFP16[a4] = 0;
  }
  else
  {
LABEL_20:
    fig_log_get_emitter();
    FigDebugAssert3();
    int v24 = FigSignalErrorAt();
  }

  return v24;
}

- (int)setPixelBuffer:(__CVBuffer *)a3 level:(int)a4 metal:(id)a5
{
  return -[PyramidStorage setPixelBuffer:level:texUsage:metal:](self, "setPixelBuffer:level:texUsage:metal:", a3);
}

- (int)setPixelBufferFloat16:(__CVBuffer *)a3 chromaBuffer:(__CVBuffer *)a4 level:(int)a5 metal:(id)a6
{
  id v10 = a6;
  if (a5 < 0 || self->levels <= a5) {
    goto LABEL_15;
  }
  pixelBuffer = self->pixelBuffer;
  id v12 = self->pixelBuffer[a5];
  if (v12)
  {
    CFRelease(v12);
    pixelBuffer[a5] = 0;
  }
  pixelBuffer2 = self->pixelBuffer2;
  unsigned int v14 = self->pixelBuffer2[a5];
  if (v14) {
    CFRelease(v14);
  }
  pixelBuffer[a5] = a3;
  pixelBuffer2[a5] = a4;
  unsigned int v15 = a4;
  if (a3)
  {
    CFRetain(a3);
    unsigned int v15 = pixelBuffer2[a5];
  }
  if (v15) {
    CFRetain(v15);
  }
  uint64_t v16 = [v10 bindPixelBufferToMTL2DTexture:a3 pixelFormat:25 usage:7 plane:0];
  uint64_t v17 = &self->super.isa + a5;
  Class v18 = v17[42];
  v17[42] = (Class)v16;

  if (!v17[42]) {
    goto LABEL_15;
  }
  uint64_t v19 = [v10 bindPixelBufferToMTL2DTexture:a4 pixelFormat:65 usage:7 plane:0];
  Class v20 = v17[62];
  v17[62] = (Class)v19;

  if (v17[62])
  {
    textureYCbCrBand0 = self->textureYCbCrBand0;
    self->textureYCbCrBand0 = 0;

    int v22 = 0;
    self->isFP16[a5] = 1;
  }
  else
  {
LABEL_15:
    fig_log_get_emitter();
    FigDebugAssert3();
    int v22 = FigSignalErrorAt();
  }

  return v22;
}

- (int)setPixelBufferForLuma:(__CVBuffer *)a3 optionalChroma:(__CVBuffer *)a4 level:(int)a5 metal:(id)a6
{
  if (a4) {
    return [(PyramidStorage *)self setPixelBufferFloat16:a3 chromaBuffer:a4 level:*(void *)&a5 metal:a6];
  }
  uint64_t v7 = 7;
  if (!a5) {
    uint64_t v7 = 1;
  }
  return [(PyramidStorage *)self setPixelBuffer:a3 level:*(void *)&a5 texUsage:v7 metal:a6 alignDims:a5 == 0];
}

- (void)releaseBuffers
{
  if (self->levels >= 1)
  {
    uint64_t v3 = 0;
    do
    {
      [(PyramidStorage *)self clearLevel:v3];
      uint64_t v3 = (v3 + 1);
    }
    while ((int)v3 < self->levels);
  }
}

- (void)dealloc
{
  [(PyramidStorage *)self releaseBuffers];
  v3.receiver = self;
  v3.super_class = (Class)PyramidStorage;
  [(PyramidStorage *)&v3 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->textureYCbCrBand0, 0);
  for (uint64_t i = 0; i != -20; --i)
    objc_storeStrong((id *)&self->textureUV[i + 19], 0);
  uint64_t v4 = 0;
  BOOL v5 = &self->textureY[19];
  do
    objc_storeStrong((id *)&v5[v4--], 0);
  while (v4 != -20);
}

@end