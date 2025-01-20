@interface PyramidStorage_NRF
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

@implementation PyramidStorage_NRF

+ (void)makePyramidAliasable:(id)a3 metal:(id)a4
{
}

+ (void)makePyramidAliasable:(id)a3 metal:(id)a4 releaseBand0:(BOOL)a5
{
  BOOL v5 = a5;
  v10 = a3;
  id v7 = a4;
  if (v10)
  {
    int v8 = !v5;
    if (v10[2] > !v5)
    {
      v9 = &v10[2 * v8 + 124];
      do
      {
        if (*(v9 - 20)) {
          FigMetalDecRef();
        }
        if (*v9) {
          FigMetalDecRef();
        }
        ++v9;
        ++v8;
      }
      while (v10[2] > v8);
    }
  }
}

+ (int)allocatePyramidWithMetalContext:(id)a3 label:(id)a4 width:(unint64_t)a5 height:(unint64_t)a6 isFP16:(BOOL)a7 createLuma:(BOOL)a8 createChroma:(BOOL)a9 pyramid:(id)a10
{
  return objc_msgSend_allocatePyramidWithMetalContext_label_width_height_isFP16_createLuma_createChroma_startingLevel_testSize_pyramid_(PyramidStorage_NRF, a2, (uint64_t)a3, (uint64_t)a4, a5, a6, a7, a8);
}

+ (int)allocatePyramidWithMetalContext:(id)a3 label:(id)a4 width:(unint64_t)a5 height:(unint64_t)a6 isFP16:(BOOL)a7 createLuma:(BOOL)a8 createChroma:(BOOL)a9 startingLevel:(BOOL)a10 testSize:(BOOL)a11 pyramid:(id)a12
{
  BOOL v98 = a8;
  id v99 = a3;
  id v15 = a4;
  v19 = a12;
  if (a5 & 1) != 0 || (a6)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v24 = 0;
LABEL_21:
    int v94 = FigSignalErrorAt();
    goto LABEL_19;
  }
  v20 = objc_msgSend_allocator(v99, v16, v17, v18);
  v24 = objc_msgSend_newTextureDescriptor(v20, v21, v22, v23);

  if (!v24)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    goto LABEL_21;
  }
  uint64_t v28 = a10;
  v29 = objc_msgSend_desc(v24, v25, v26, v27);
  objc_msgSend_setUsage_(v29, v30, 7, v31);

  if (v19[2] > a10)
  {
    unint64_t v34 = a6 >> a10;
    unint64_t v35 = a5 >> a10;
    v36 = v19 + 166;
    v96 = v19;
    v37 = (void **)&v19[2 * a10 + 124];
    while (1)
    {
      if (a11 && ((v35 & 1) != 0 || (v34 & 1) != 0))
      {
LABEL_20:
        fig_log_get_emitter();
        FigDebugAssert3();
        v19 = v96;
        goto LABEL_21;
      }
      if (v98)
      {
        objc_msgSend_setLabel_(v24, v32, 0, v33);
        v41 = objc_msgSend_desc(v24, v38, v39, v40);
        objc_msgSend_setWidth_(v41, v42, v35, v43);

        v47 = objc_msgSend_desc(v24, v44, v45, v46);
        objc_msgSend_setHeight_(v47, v48, v34, v49);

        v53 = objc_msgSend_desc(v24, v50, v51, v52);
        objc_msgSend_setPixelFormat_(v53, v54, 25, v55);

        v59 = objc_msgSend_allocator(v99, v56, v57, v58);
        uint64_t v62 = objc_msgSend_newTextureWithDescriptor_(v59, v60, (uint64_t)v24, v61);
        v63 = *(v37 - 20);
        *(v37 - 20) = (void *)v62;

        if (!*(v37 - 20)) {
          goto LABEL_20;
        }
        if (!a9)
        {
LABEL_15:
          v93 = *v37;
          *v37 = 0;

          goto LABEL_16;
        }
      }
      else
      {
        v92 = *(v37 - 20);
        *(v37 - 20) = 0;

        if (!a9) {
          goto LABEL_15;
        }
      }
      objc_msgSend_setLabel_(v24, v64, 0, v65);
      v69 = objc_msgSend_desc(v24, v66, v67, v68);
      objc_msgSend_setWidth_(v69, v70, v35 >> 1, v71);

      v75 = objc_msgSend_desc(v24, v72, v73, v74);
      objc_msgSend_setHeight_(v75, v76, v34 >> 1, v77);

      v81 = objc_msgSend_desc(v24, v78, v79, v80);
      objc_msgSend_setPixelFormat_(v81, v82, 65, v83);

      v87 = objc_msgSend_allocator(v99, v84, v85, v86);
      uint64_t v90 = objc_msgSend_newTextureWithDescriptor_(v87, v88, (uint64_t)v24, v89);
      v91 = *v37;
      *v37 = (void *)v90;

      if (!*v37) {
        goto LABEL_20;
      }
LABEL_16:
      v35 >>= 1;
      v34 >>= 1;
      *((unsigned char *)v36 + v28++) = a7;
      ++v37;
      if (v96[2] <= (int)v28)
      {
        int v94 = 0;
        v19 = v96;
        goto LABEL_19;
      }
    }
  }
  int v94 = 0;
LABEL_19:

  return v94;
}

+ (int)allocatePyramidWithMetalContext:(id)a3 label:(id)a4 width:(unint64_t)a5 height:(unint64_t)a6 isFP16:(BOOL)a7 pyramid:(id)a8
{
  char v9 = 1;
  return objc_msgSend_allocatePyramidWithMetalContext_label_width_height_isFP16_createLuma_createChroma_pyramid_(PyramidStorage_NRF, a2, (uint64_t)a3, (uint64_t)a4, a5, a6, a7, 1, v9, a8);
}

+ (int)pyramidMemorySize:(unsigned __int16)a3 height:(unsigned __int16)a4 overlapLevels:(BOOL)a5 allocLevel0:(BOOL)a6 levels:(unsigned __int8)a7 lumaFormat:(unint64_t)a8 chromaFormat:(unint64_t)a9 outSize:(unint64_t *)a10 metal:(id)a11
{
  BOOL v27 = a5;
  unsigned int v28 = a7;
  BOOL v12 = a6;
  unsigned int v13 = a4;
  unsigned int v14 = a3;
  id v29 = a11;
  if (!a10
    || (v14 & 1) != 0
    || (v13 & 1) != 0
    || !(a9 | a8)
    || (unsigned int v17 = !v12, v28 <= v17)
    || a8 && !objc_msgSend_getPixelSizeInBytes_(v29, v15, a8, v16)
    || a9 && !objc_msgSend_getPixelSizeInBytes_(v29, v15, a9, v16))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v25 = FigSignalErrorAt();
  }
  else
  {
    unint64_t v18 = 0;
    do
    {
      uint64_t v19 = v13 >> v17;
      unint64_t v20 = sub_262F9E698(v14 >> v17, a8, v29) * v19;
      uint64_t v22 = sub_262F9E698(v14 >> v17 >> 1, a9, v29);
      uint64_t v21 = v19 >> 1;
      unint64_t v23 = v22 * v21;
      if (v27)
      {
        if (v18 <= v20) {
          unint64_t v24 = v20;
        }
        else {
          unint64_t v24 = v18;
        }
        if (v24 <= v23) {
          unint64_t v18 = v22 * v21;
        }
        else {
          unint64_t v18 = v24;
        }
      }
      else
      {
        v18 += v20 + v23;
      }
      ++v17;
    }
    while (v28 != v17);
    int v25 = 0;
    *a10 = v18;
  }

  return v25;
}

+ (int)pyramidMemorySize:(unsigned __int16)a3 height:(unsigned __int16)a4 allocLevel0:(BOOL)a5 levels:(unsigned __int8)a6 lumaFormat:(unint64_t)a7 chromaFormat:(unint64_t)a8 outSize:(unint64_t *)a9 metal:(id)a10
{
  return objc_msgSend_pyramidMemorySize_height_overlapLevels_allocLevel0_levels_lumaFormat_chromaFormat_outSize_metal_(PyramidStorage_NRF, a2, a3, a4, 0, a5, a6, a7, a8, a9, a10);
}

+ (int)overlappingLevelsMemorySize:(unsigned __int16)a3 height:(unsigned __int16)a4 allocLevel0:(BOOL)a5 levels:(unsigned __int8)a6 lumaFormat:(unint64_t)a7 chromaFormat:(unint64_t)a8 outSize:(unint64_t *)a9 metal:(id)a10
{
  return objc_msgSend_pyramidMemorySize_height_overlapLevels_allocLevel0_levels_lumaFormat_chromaFormat_outSize_metal_(PyramidStorage_NRF, a2, a3, a4, 1, a5, a6, a7, a8, a9, a10);
}

+ (int)allocatePyramidWithWidth:(unsigned __int16)a3 height:(unsigned __int16)a4 allocLevel0:(BOOL)a5 levels:(unsigned __int8)a6 texUsage:(unint64_t)a7 mtlSubAllocatorID:(unsigned int)a8 label:(id)a9 lumaFormat:(unint64_t)a10 chromaFormat:(unint64_t)a11 outPyramid:(id)a12 metal:(id)a13
{
  uint64_t v13 = *(void *)&a8;
  unsigned int v15 = a6;
  BOOL v16 = a5;
  unsigned int v17 = a4;
  unsigned int v18 = a3;
  id v115 = a9;
  uint64_t v19 = a12;
  id v20 = a13;
  unint64_t v24 = v20;
  unsigned int v120 = v18;
  if ((v18 & 1) != 0 || (v17 & 1) != 0 || __PAIR128__(a11, a10) == 0 || (uint64_t v25 = !v16, v15 <= v25))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    id v29 = 0;
    v48 = 0;
    goto LABEL_37;
  }
  if (!v19)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    id v29 = 0;
LABEL_35:
    v48 = 0;
    goto LABEL_37;
  }
  v19[2] = v15;
  uint64_t v26 = objc_msgSend_allocator(v20, v21, v22, v23);
  id v29 = objc_msgSend_newTextureDescriptor_(v26, v27, v13, v28);

  if (!v29)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    goto LABEL_35;
  }
  uint64_t v33 = objc_msgSend_desc(v29, v30, v31, v32);
  objc_msgSend_setUsage_(v33, v34, a7, v35);

  uint64_t v39 = objc_msgSend_desc(v29, v36, v37, v38);
  objc_msgSend_setPixelFormat_(v39, v40, a10, v41);

  uint64_t v45 = objc_msgSend_allocator(v24, v42, v43, v44);
  v48 = objc_msgSend_newTextureDescriptor_(v45, v46, v13, v47);

  if (!v48)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
LABEL_37:
    v113 = v115;
LABEL_38:
    int v112 = FigSignalErrorAt();
    goto LABEL_30;
  }
  uint64_t v52 = objc_msgSend_desc(v48, v49, v50, v51);
  objc_msgSend_setUsage_(v52, v53, a7, v54);

  uint64_t v58 = objc_msgSend_desc(v48, v55, v56, v57);
  objc_msgSend_setPixelFormat_(v58, v59, a11, v60);

  if (v19[2] > (int)v25)
  {
    v122 = v48;
    if (a10) {
      BOOL v61 = 0;
    }
    else {
      BOOL v61 = a11 == 65;
    }
    char v62 = v61;
    char v116 = v62;
    unsigned int v117 = v17;
    uint64_t v63 = v25 | 0x298;
    uint64_t v64 = 2 * v25;
    v119 = v24;
    unsigned int v118 = v13;
    while (1)
    {
      uint64_t v65 = &v19[v64];
      v66 = *(const void **)&v19[v64 + 4];
      if (v66)
      {
        CFRelease(v66);
        *((void *)v65 + 2) = 0;
      }
      uint64_t v67 = (const void *)*((void *)v65 + 22);
      if (v67)
      {
        CFRelease(v67);
        *((void *)v65 + 22) = 0;
      }
      uint64_t v68 = v120 >> v25;
      uint64_t v69 = v17 >> v25;
      v70 = (void **)&v19[v64 + 84];
      FigMetalDecRef();
      v121 = (void **)&v19[v64 + 124];
      FigMetalDecRef();
      objc_msgSend_desc(v29, v71, v72, v73);
      v75 = uint64_t v74 = v19;
      objc_msgSend_setWidth_(v75, v76, v68, v77);

      v81 = objc_msgSend_desc(v29, v78, v79, v80);
      objc_msgSend_setHeight_(v81, v82, v69, v83);

      objc_msgSend_setLabel_(v29, v84, 0, v85);
      uint64_t v89 = objc_msgSend_desc(v122, v86, v87, v88);
      objc_msgSend_setWidth_(v89, v90, v68 >> 1, v91);

      v95 = objc_msgSend_desc(v122, v92, v93, v94);
      objc_msgSend_setHeight_(v95, v96, v69 >> 1, v97);

      objc_msgSend_setLabel_(v122, v98, 0, v99);
      if (a10 == 25)
      {
        *((unsigned char *)v74 + v63) = 1;
        uint64_t v19 = v74;
        unint64_t v24 = v119;
        uint64_t v103 = v118;
        objc_msgSend_allocator(v119, v100, v101, v102);
      }
      else
      {
        *((unsigned char *)v74 + v63) = v116;
        uint64_t v19 = v74;
        unint64_t v24 = v119;
        uint64_t v103 = v118;
        if (!a10) {
          goto LABEL_25;
        }
        objc_msgSend_allocator(v119, v100, v101, v102);
      v104 = };
      uint64_t v106 = objc_msgSend_newTextureWithDescriptor_subAllocatorID_(v104, v105, (uint64_t)v29, v103);
      v107 = *v70;
      const char *v70 = (void *)v106;

      if (!*v70) {
        goto LABEL_31;
      }
LABEL_25:
      if (a11)
      {
        v108 = objc_msgSend_allocator(v24, v100, v101, v102);
        uint64_t v110 = objc_msgSend_newTextureWithDescriptor_subAllocatorID_(v108, v109, (uint64_t)v122, v103);
        v111 = *v121;
        *v121 = (void *)v110;

        if (!*v121)
        {
LABEL_31:
          fig_log_get_emitter();
          FigDebugAssert3();
          v113 = v115;
          v48 = v122;
          goto LABEL_38;
        }
      }
      LODWORD(v25) = v25 + 1;
      ++v63;
      v64 += 2;
      unsigned int v17 = v117;
      if (v19[2] <= (int)v25)
      {
        int v112 = 0;
        v113 = v115;
        v48 = v122;
        goto LABEL_30;
      }
    }
  }
  int v112 = 0;
  v113 = v115;
LABEL_30:

  return v112;
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
        int v8 = v3 + 664;
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
      int v8 = self->pixelBuffer2[a3];
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
  id v14 = a4;
  if ((a5 & 0x80000000) == 0
    && self->levels > a5
    && (uint64_t v15 = objc_msgSend_pixelFormat(v10, v11, v12, v13),
        (v15 == 25) == (objc_msgSend_pixelFormat(v14, v16, v17, v18) == 65))
    && (self->isFP16[a5] = v15 == 25,
        uint64_t v19 = (id *)(&self->super.isa + a5),
        objc_storeStrong(v19 + 42, a3),
        v19[42])
    && (id v20 = (id *)(&self->super.isa + a5), objc_storeStrong(v20 + 62, a4), v20[62]))
  {
    if (!a5)
    {
      textureYCbCrBand0 = self->textureYCbCrBand0;
      self->textureYCbCrBand0 = 0;
    }
    int v22 = 0;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v22 = FigSignalErrorAt();
  }

  return v22;
}

- (int)setYCbCrBand0Texture:(id)a3
{
  return 0;
}

- (int)setPixelBuffer:(__CVBuffer *)a3 level:(int)a4 texUsage:(unint64_t)a5 metal:(id)a6
{
  return MEMORY[0x270F9A6D0](self, sel_setPixelBuffer_level_texUsage_metal_alignDims_, a3, *(void *)&a4);
}

- (int)setPixelBuffer:(__CVBuffer *)a3 level:(int)a4 texUsage:(unint64_t)a5 metal:(id)a6 alignDims:(BOOL)a7
{
  BOOL v7 = a7;
  id v13 = a6;
  if (a4 < 0 || self->levels <= a4) {
    goto LABEL_20;
  }
  pixelBuffer = self->pixelBuffer;
  uint64_t v15 = self->pixelBuffer[a4];
  if (v15)
  {
    CFRelease(v15);
    pixelBuffer[a4] = 0;
  }
  BOOL v16 = self->pixelBuffer2[a4];
  if (v16)
  {
    CFRelease(v16);
    self->pixelBuffer2[a4] = 0;
  }
  pixelBuffer[a4] = a3;
  if (a3) {
    CFRetain(a3);
  }
  unsigned int v17 = 1;
  if (v7) {
    unsigned int v17 = 1 << self->levels;
  }
  uint64_t v18 = objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_alignmentFactor_(v13, v12, (uint64_t)a3, 10, a5, 0, v17);
  uint64_t v19 = &self->super.isa + a4;
  Class v20 = v19[42];
  v19[42] = (Class)v18;

  if (!v19[42]) {
    goto LABEL_20;
  }
  if (v17 <= 1) {
    objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_alignmentFactor_(v13, v21, (uint64_t)a3, 30, a5, 1, 1);
  }
  else {
  uint64_t v22 = objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_alignmentFactor_(v13, v21, (uint64_t)a3, 30, a5, 1, v17 >> 1);
  }
  Class v23 = v19[62];
  v19[62] = (Class)v22;

  if (v19[62])
  {
    if (!a4)
    {
      textureYCbCrBand0 = self->textureYCbCrBand0;
      self->textureYCbCrBand0 = 0;
    }
    int v25 = 0;
    self->isFP16[a4] = 0;
  }
  else
  {
LABEL_20:
    fig_log_get_emitter();
    FigDebugAssert3();
    int v25 = FigSignalErrorAt();
  }

  return v25;
}

- (int)setPixelBuffer:(__CVBuffer *)a3 level:(int)a4 metal:(id)a5
{
  return MEMORY[0x270F9A6D0](self, sel_setPixelBuffer_level_texUsage_metal_, a3, *(void *)&a4);
}

- (int)setPixelBufferFloat16:(__CVBuffer *)a3 chromaBuffer:(__CVBuffer *)a4 level:(int)a5 metal:(id)a6
{
  id v11 = a6;
  if (a5 < 0 || self->levels <= a5) {
    goto LABEL_15;
  }
  pixelBuffer = self->pixelBuffer;
  id v13 = self->pixelBuffer[a5];
  if (v13)
  {
    CFRelease(v13);
    pixelBuffer[a5] = 0;
  }
  pixelBuffer2 = self->pixelBuffer2;
  uint64_t v15 = self->pixelBuffer2[a5];
  if (v15) {
    CFRelease(v15);
  }
  pixelBuffer[a5] = a3;
  pixelBuffer2[a5] = a4;
  BOOL v16 = a4;
  if (a3)
  {
    CFRetain(a3);
    BOOL v16 = pixelBuffer2[a5];
  }
  if (v16) {
    CFRetain(v16);
  }
  uint64_t v17 = objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_(v11, v10, (uint64_t)a3, 25, 7, 0);
  uint64_t v18 = &self->super.isa + a5;
  Class v19 = v18[42];
  v18[42] = (Class)v17;

  if (!v18[42]) {
    goto LABEL_15;
  }
  uint64_t v21 = objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_(v11, v20, (uint64_t)a4, 65, 7, 0);
  Class v22 = v18[62];
  v18[62] = (Class)v21;

  if (v18[62])
  {
    textureYCbCrBand0 = self->textureYCbCrBand0;
    self->textureYCbCrBand0 = 0;

    int v24 = 0;
    self->isFP16[a5] = 1;
  }
  else
  {
LABEL_15:
    fig_log_get_emitter();
    FigDebugAssert3();
    int v24 = FigSignalErrorAt();
  }

  return v24;
}

- (int)setPixelBufferForLuma:(__CVBuffer *)a3 optionalChroma:(__CVBuffer *)a4 level:(int)a5 metal:(id)a6
{
  if (a4) {
    return MEMORY[0x270F9A6D0](self, sel_setPixelBufferFloat16_chromaBuffer_level_metal_, a3, a4);
  }
  else {
    return MEMORY[0x270F9A6D0](self, sel_setPixelBuffer_level_texUsage_metal_alignDims_, a3, *(void *)&a5);
  }
}

- (void)releaseBuffers
{
  if (self->levels >= 1)
  {
    uint64_t v4 = 0;
    do
    {
      objc_msgSend_clearLevel_(self, a2, v4, v2);
      uint64_t v4 = (v4 + 1);
    }
    while ((int)v4 < self->levels);
  }
}

- (void)dealloc
{
  objc_msgSend_releaseBuffers(self, a2, v2, v3);
  v5.receiver = self;
  v5.super_class = (Class)PyramidStorage_NRF;
  [(PyramidStorage_NRF *)&v5 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->textureYCbCrBand0, 0);
  for (uint64_t i = 0; i != -20; --i)
    objc_storeStrong((id *)&self->textureUV[i + 19], 0);
  uint64_t v4 = 0;
  objc_super v5 = &self->textureY[19];
  do
    objc_storeStrong((id *)&v5[v4--], 0);
  while (v4 != -20);
}

@end