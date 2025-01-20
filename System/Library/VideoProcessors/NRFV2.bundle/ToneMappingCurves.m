@interface ToneMappingCurves
- (BOOL)enableSTF;
- (ToneMappingCurves)initWithWithContext:(id)a3;
- (int)estimateMaskRegionInTiles:(__CVBuffer *)a3;
- (int)regularizeLocalToneCurves:(const ltmCurves *)a3 mask:(__CVBuffer *)a4 tcrParams:(id)a5 imageDims:;
- (uint64_t)setToneCurvesWithLTC:(int32x4_t)a3 GTC:(int32x4_t)a4 colorCorrectionMatrix:(uint64_t)a5 dump:(_WORD *)a6;
- (void)dealloc;
- (void)setEnableSTF:(BOOL)a3;
@end

@implementation ToneMappingCurves

- (ToneMappingCurves)initWithWithContext:(id)a3
{
  id v4 = a3;
  v122.receiver = self;
  v122.super_class = (Class)ToneMappingCurves;
  v5 = [(ToneMappingCurves *)&v122 init];
  if (!v5)
  {
    FigDebugAssert3();
    v9 = 0;
LABEL_17:
    v25 = 0;
    goto LABEL_21;
  }
  v6 = objc_opt_new();
  v9 = v6;
  if (!v6) {
    goto LABEL_16;
  }
  objc_msgSend_setStorageMode_(v6, v7, 0, v8);
  objc_msgSend_setHazardTrackingMode_(v9, v10, 2, v11);
  objc_msgSend_setSize_(v9, v12, 51200, v13);
  v17 = objc_msgSend_device(v4, v14, v15, v16);
  uint64_t v20 = objc_msgSend_newHeapWithDescriptor_(v17, v18, (uint64_t)v9, v19);
  internalHeap = v5->_internalHeap;
  v5->_internalHeap = (MTLHeap *)v20;

  if (!v5->_internalHeap)
  {
LABEL_16:
    FigDebugAssert3();
    goto LABEL_17;
  }
  v25 = objc_opt_new();
  if (!v25) {
    goto LABEL_20;
  }
  uint64_t v26 = objc_msgSend_resourceOptions(v5->_internalHeap, v22, v23, v24);
  objc_msgSend_setResourceOptions_(v25, v27, v26, v28);
  v5->_newLTC = (unsigned __int16 *)malloc_type_calloc(0xC30uLL, 2uLL, 0x1000040BDFB0063uLL);
  v5->_regGlobal = (float *)malloc_type_calloc(0x41uLL, 4uLL, 0x100004052888210uLL);
  v5->_regLocal = (float *)malloc_type_calloc(0x41uLL, 4uLL, 0x100004052888210uLL);
  v5->_maskTile = (float *)malloc_type_calloc(0x30uLL, 4uLL, 0x100004052888210uLL);
  v5->_isRegularized = 0;
  v5->_hasBeenRegularized = 0;
  v121.receiver = v5;
  v121.super_class = (Class)ToneMappingCurves;
  v29 = [(ToneMappingCurves *)&v121 init];
  v5 = v29;
  if (!v29)
  {
LABEL_21:
    int v120 = FigSignalErrorAt();
    v117 = 0;
    if (v120) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  v33 = v29->_internalHeap;
  uint64_t v34 = objc_msgSend_resourceOptions(v33, v30, v31, v32);
  uint64_t v36 = objc_msgSend_newBufferWithLength_options_(v33, v35, 1024, v34);
  lumaHistogram = v5->_lumaHistogram;
  v5->_lumaHistogram = (MTLBuffer *)v36;

  if (!v5->_lumaHistogram) {
    goto LABEL_20;
  }
  v41 = v5->_internalHeap;
  uint64_t v42 = objc_msgSend_resourceOptions(v41, v38, v39, v40);
  uint64_t v44 = objc_msgSend_newBufferWithLength_options_(v41, v43, 16, v42);
  blackWhiteStrengthCenter = v5->_blackWhiteStrengthCenter;
  v5->_blackWhiteStrengthCenter = (MTLBuffer *)v44;

  if (!v5->_blackWhiteStrengthCenter) {
    goto LABEL_20;
  }
  objc_msgSend_setTextureType_(v25, v46, 7, v47);
  objc_msgSend_setWidth_(v25, v48, 33, v49);
  objc_msgSend_setHeight_(v25, v50, 8, v51);
  objc_msgSend_setDepth_(v25, v52, 6, v53);
  objc_msgSend_setPixelFormat_(v25, v54, 20, v55);
  objc_msgSend_setUsage_(v25, v56, 1, v57);
  uint64_t v60 = objc_msgSend_newTextureWithDescriptor_(v5->_internalHeap, v58, (uint64_t)v25, v59);
  ltcBinsTexD3x = v5->_ltcBinsTexD3x;
  v5->_ltcBinsTexD3x = (MTLTexture *)v60;

  v62 = v5->_ltcBinsTexD3x;
  if (!v62) {
    goto LABEL_20;
  }
  objc_storeStrong((id *)&v5->_ltcBinsTex, v62);
  objc_msgSend_setWidth_(v25, v63, 65, v64);
  uint64_t v67 = objc_msgSend_newTextureWithDescriptor_(v5->_internalHeap, v65, (uint64_t)v25, v66);
  ltcBinsTexD4x = v5->_ltcBinsTexD4x;
  v5->_ltcBinsTexD4x = (MTLTexture *)v67;

  if (!v5->_ltcBinsTexD4x) {
    goto LABEL_20;
  }
  objc_msgSend_setTextureType_(v25, v69, 0, v70);
  objc_msgSend_setWidth_(v25, v71, 257, v72);
  objc_msgSend_setHeight_(v25, v73, 1, v74);
  objc_msgSend_setDepth_(v25, v75, 1, v76);
  objc_msgSend_setPixelFormat_(v25, v77, 20, v78);
  objc_msgSend_setUsage_(v25, v79, 1, v80);
  uint64_t v83 = objc_msgSend_newTextureWithDescriptor_(v5->_internalHeap, v81, (uint64_t)v25, v82);
  ltcGTCRatioTex = v5->_ltcGTCRatioTex;
  v5->_ltcGTCRatioTex = (MTLTexture *)v83;

  if (!v5->_ltcGTCRatioTex) {
    goto LABEL_20;
  }
  objc_msgSend_setTextureType_(v25, v85, 0, v86);
  objc_msgSend_setWidth_(v25, v87, 257, v88);
  objc_msgSend_setHeight_(v25, v89, 1, v90);
  objc_msgSend_setDepth_(v25, v91, 1, v92);
  objc_msgSend_setPixelFormat_(v25, v93, 20, v94);
  objc_msgSend_setUsage_(v25, v95, 1, v96);
  uint64_t v99 = objc_msgSend_newTextureWithDescriptor_(v5->_internalHeap, v97, (uint64_t)v25, v98);
  ltcGTCFinalTex = v5->_ltcGTCFinalTex;
  v5->_ltcGTCFinalTex = (MTLTexture *)v99;

  if (!v5->_ltcGTCFinalTex) {
    goto LABEL_20;
  }
  objc_msgSend_setTextureType_(v25, v101, 7, v102);
  objc_msgSend_setWidth_(v25, v103, 3, v104);
  objc_msgSend_setHeight_(v25, v105, 8, v106);
  objc_msgSend_setDepth_(v25, v107, 6, v108);
  objc_msgSend_setPixelFormat_(v25, v109, 115, v110);
  objc_msgSend_setUsage_(v25, v111, 1, v112);
  uint64_t v115 = objc_msgSend_newTextureWithDescriptor_(v5->_internalHeap, v113, (uint64_t)v25, v114);
  spatialCCMTex = v5->_spatialCCMTex;
  v5->_spatialCCMTex = (MTLTexture *)v115;

  if (!v5->_spatialCCMTex)
  {
LABEL_20:
    FigDebugAssert3();
    goto LABEL_21;
  }
LABEL_13:
  v117 = v5;
LABEL_14:
  v118 = v117;

  return v118;
}

- (void)dealloc
{
  unregularizedLTC = self->_unregularizedLTC;
  if (unregularizedLTC) {
    free(unregularizedLTC);
  }
  free(self->_newLTC);
  free(self->_regGlobal);
  free(self->_regLocal);
  free(self->_maskTile);
  v4.receiver = self;
  v4.super_class = (Class)ToneMappingCurves;
  [(ToneMappingCurves *)&v4 dealloc];
}

- (int)estimateMaskRegionInTiles:(__CVBuffer *)a3
{
  if (CVPixelBufferLockBaseAddress(a3, 0)) {
    return -1;
  }
  BaseAddress = (char *)CVPixelBufferGetBaseAddress(a3);
  size_t BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
  size_t Width = CVPixelBufferGetWidth(a3);
  size_t Height = CVPixelBufferGetHeight(a3);
  unint64_t ltmBinsY = self->_ltmBinsY;
  if (ltmBinsY)
  {
    uint64_t v12 = 0;
    uint64_t offX = self->_offX;
    uint64_t offY = self->_offY;
    unint64_t ltmBinsX = self->_ltmBinsX;
    unint64_t v16 = (Width - 2 * offX) / ltmBinsX;
    unint64_t v17 = (Height - 2 * offY) / ltmBinsY;
    v18 = &BaseAddress[offX];
    do
    {
      uint64_t v19 = 0;
      uint64_t v20 = &v18[(offY + v12 * v17) * BytesPerRow];
      maskTile = self->_maskTile;
      unint64_t v22 = v12 * ltmBinsX;
      do
      {
        uint64_t v23 = 0;
        maskTile[v19 + v22] = 0.0;
        float v24 = 0.0;
        do
        {
          uint64_t v25 = 0;
          uint64_t v26 = 8;
          do
          {
            LOBYTE(v10) = v20[(v17 >> 2) * BytesPerRow * v23 + v25 * (v16 >> 3)];
            float v10 = (float)LODWORD(v10) * 0.03125;
            float v24 = v24 + v10;
            maskTile[v19 + v22] = v24;
            ++v25;
            --v26;
          }
          while (v26);
          ++v23;
        }
        while (v23 != 4);
        ++v19;
        v20 += v16;
      }
      while (v19 != ltmBinsX);
      ++v12;
    }
    while (v12 != ltmBinsY);
  }
  CVPixelBufferUnlockBaseAddress(a3, 0);
  return 0;
}

- (int)regularizeLocalToneCurves:(const ltmCurves *)a3 mask:(__CVBuffer *)a4 tcrParams:(id)a5 imageDims:
{
  uint64_t v100 = v5;
  uint64_t v102 = *MEMORY[0x263EF8340];
  v9 = (float *)a5;
  if (!v9) {
    goto LABEL_52;
  }
  self->_isRegularized = 1;
  if (self->_enableSTF) {
    self->_hasBeenRegularized = 1;
  }
  self->_unint64_t ltmBinsX = sub_262FBABDC(a3);
  self->_unint64_t ltmBinsY = sub_262FBAC44(a3);
  uint64_t v10 = sub_262FBAEC8(a3);
  uint64_t v11 = sub_262FBAE0C(a3);
  uint64_t v12 = sub_262FBAE64(a3);
  unint64_t v99 = v11;
  uint64_t v13 = sub_262FBAD04(a3) * v11;
  uint64_t v14 = sub_262FBACAC(a3);
  uint64_t v15 = sub_262FBB03C(a3, (unint64_t)(v13 + v14 * v12) >> 1);
  uint64_t v16 = sub_262FBAD5C(a3);
  uint64_t v17 = sub_262FBADB4(a3);
  unint64_t ltmBinsY = self->_ltmBinsY;
  unint64_t v19 = self->_ltmBinsX * v16;
  size_t Width = CVPixelBufferGetWidth(a4);
  size_t Height = CVPixelBufferGetHeight(a4);
  if ((int)v100 >= v19 && SHIDWORD(v100) >= ltmBinsY * v17)
  {
    self->_uint64_t offX = (int)(float)((float)((float)((float)(v100 - v19) * 0.5) * (float)Width) / (float)(int)v100);
    self->_uint64_t offY = (int)(float)((float)((float)((float)(SHIDWORD(v100) - ltmBinsY * v17) * 0.5) * (float)Height)
                             / (float)SHIDWORD(v100));
    objc_msgSend_estimateMaskRegionInTiles_(self, v22, (uint64_t)a4, v23);
  }
  if (self->_isRegularized)
  {
    float v27 = 1.0 - v9[3];
    float v28 = 1.0 - v9[2];
  }
  else
  {
    float v27 = 1.0;
    float v28 = 1.0;
  }
  if (self->_ltmBinsX == 8 && self->_ltmBinsY == 6 && (v10 == 33 || v10 == 65) && v15)
  {
    uint64_t v29 = 0;
    int v30 = 0;
    regLocal = self->_regLocal;
    maskTile = self->_maskTile;
    uint64_t v33 = 2 * (v99 >> 1);
    uint64_t v34 = 2 * (int)(v12 >> 1);
    uint64_t v35 = v15;
    do
    {
      uint64_t v36 = 0;
      regLocal[v29] = 0.0;
      float v37 = 0.0;
      v38 = maskTile;
      uint64_t v39 = (_WORD *)v35;
      do
      {
        uint64_t v40 = 0;
        v41 = v39;
        do
        {
          float v42 = v38[v40];
          if (v42 > v9[4])
          {
            LOWORD(v42) = *v41;
            float v37 = v37 + (float)((float)LODWORD(v42) / 65535.0);
            regLocal[v29] = v37;
            ++v30;
          }
          v41 = (_WORD *)((char *)v41 + v34);
          ++v40;
        }
        while (v40 != 8);
        ++v36;
        uint64_t v39 = (_WORD *)((char *)v39 + v33);
        v38 += 8;
      }
      while (v36 != 6);
      ++v29;
      v35 += 2;
    }
    while (v29 != v10);
    float v43 = 1.0;
    if (v9[5] < (float)v30)
    {
      uint64_t v44 = self->_regLocal;
      uint64_t v45 = v10;
      do
      {
        *uint64_t v44 = *v44 / (float)((float)v30 / (float)(unint64_t)v10);
        ++v44;
        --v45;
      }
      while (v45);
      uint64_t v46 = 0;
      float v47 = 0.0;
      uint64_t v48 = v15;
      do
      {
        uint64_t v49 = 0;
        v50 = self->_maskTile;
        uint64_t v51 = (_WORD *)v48;
        do
        {
          uint64_t v52 = 0;
          uint64_t v53 = v51;
          do
          {
            if (v50[v52] > v9[4])
            {
              LOWORD(v24) = *v53;
              float v24 = (float)LODWORD(v24) / -65535.0;
              float v47 = v47 + fabsf(self->_regLocal[v46] + v24);
            }
            uint64_t v53 = (_WORD *)((char *)v53 + v34);
            ++v52;
          }
          while (v52 != 8);
          ++v49;
          uint64_t v51 = (_WORD *)((char *)v51 + v33);
          v50 += 8;
        }
        while (v49 != 6);
        ++v46;
        v48 += 2;
      }
      while (v46 != v10);
      float v54 = fminf(fmaxf((float)(v47 - v9[6]) / (float)(v9[7] - v9[6]), 0.0), 1.0);
      float v43 = (float)((float)(1.0 - v9[8]) * (float)((float)(v54 * v54) * (float)((float)(v54 * -2.0) + 3.0)))
          + (float)(v27 * (float)(1.0 - (float)((float)(v54 * v54) * (float)((float)(v54 * -2.0) + 3.0))));
    }
    uint64_t v55 = 0;
    newLTC = self->_newLTC;
    v58 = self->_regLocal;
    uint64_t v57 = self->_maskTile;
    uint64_t v59 = v10;
    regGlobal = self->_regGlobal;
    __asm { FMOV            V6.4S, #1.0 }
    v66.i64[0] = 0x400000004;
    v66.i64[1] = 0x400000004;
    uint64_t v67 = v15;
    do
    {
      uint64_t v68 = 0;
      v69 = (unsigned __int16 *)v67;
      do
      {
        uint64_t v70 = 0;
        memset(v101, 0, sizeof(v101));
        *(float *)v25.i32 = (float)(int)v68;
        float32x4_t v71 = (float32x4_t)vdupq_lane_s32(v25, 0);
        int32x2_t v25 = 0;
        uint64_t v72 = v101;
        do
        {
          uint64_t v73 = 0;
          v26.f32[0] = (float)((float)(int)v70 - (float)(int)v55) * (float)((float)(int)v70 - (float)(int)v55);
          float32x4_t v26 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v26.f32, 0);
          int32x4_t v74 = (int32x4_t)xmmword_2630179B0;
          do
          {
            float32x4_t v75 = vsubq_f32(vcvtq_f32_s32(v74), v71);
            float32x4_t v76 = vaddq_f32(v26, vmulq_f32(v75, v75));
            int8x16_t v77 = vbicq_s8((int8x16_t)vdivq_f32(_Q6, v76), (int8x16_t)vceqzq_f32(v76));
            v72[v73] = v77;
            *(float *)v25.i32 = (float)((float)((float)(*(float *)v25.i32 + *(float *)v77.i32) + *(float *)&v77.i32[1])
                                      + *(float *)&v77.i32[2])
                              + *(float *)&v77.i32[3];
            int32x4_t v74 = vaddq_s32(v74, v66);
            ++v73;
          }
          while (v73 != 2);
          ++v70;
          v72 += 2;
        }
        while (v70 != 6);
        uint64_t v78 = 0;
        uint64_t v79 = v15;
        do
        {
          uint64_t v80 = 0;
          regGlobal[v78] = 0.0;
          float v81 = 0.0;
          uint64_t v82 = v101;
          uint64_t v83 = (__int16 *)v79;
          do
          {
            uint64_t v84 = 0;
            v85 = v83;
            do
            {
              v74.i16[0] = *v85;
              *(float *)v74.i32 = (float)v74.u32[0];
              float v81 = v81
                  + (float)((float)((float)(*(float *)((char *)v82 + v84) / *(float *)v25.i32) * *(float *)v74.i32)
                          / 65535.0);
              v84 += 4;
              v85 = (__int16 *)((char *)v85 + v34);
            }
            while (v84 != 32);
            ++v80;
            v82 += 2;
            uint64_t v83 = (__int16 *)((char *)v83 + v33);
          }
          while (v80 != 6);
          regGlobal[v78++] = v81;
          v79 += 2;
        }
        while (v78 != v59);
        float v86 = v57[8 * v55 + v68] / 255.0;
        float v87 = (float)(1.0 - v86) + (float)(v43 * v86);
        uint64_t v88 = v59;
        v89 = v58;
        uint64_t v90 = regGlobal;
        v91 = v69;
        do
        {
          float v92 = *v89++;
          float v93 = v92;
          unsigned int v94 = *v91++;
          unsigned int v95 = (int)(float)((float)(v87 * (float)v94) + (float)((float)((float)(1.0 - v87) * v93) * 65535.0));
          float v96 = *v90++;
          *newLTC++ = (int)(float)((float)(v28 * (float)v95) + (float)((float)((float)(1.0 - v28) * v96) * 65535.0));
          --v88;
        }
        while (v88);
        ++v68;
        v69 = (unsigned __int16 *)((char *)v69 + v34);
      }
      while (v68 != 8);
      ++v55;
      v67 += v33;
    }
    while (v55 != 6);
    int v97 = 0;
  }
  else
  {
LABEL_52:
    FigDebugAssert3();
    int v97 = -12780;
  }

  return v97;
}

- (uint64_t)setToneCurvesWithLTC:(int32x4_t)a3 GTC:(int32x4_t)a4 colorCorrectionMatrix:(uint64_t)a5 dump:(_WORD *)a6
{
  uint64_t v10 = sub_262FBAEC8(a6);
  unint64_t v11 = sub_262FBABDC(a6);
  unint64_t v12 = sub_262FBAC44(a6);
  uint64_t v13 = sub_262FBAE0C(a6);
  uint64_t v14 = sub_262FBAE64(a6);
  uint64_t v15 = sub_262FBAD04(a6) * v13;
  uint64_t v16 = sub_262FBACAC(a6);
  uint64_t v17 = sub_262FBB03C(a6, (unint64_t)(v15 + v16 * v14) >> 1);
  if (v11 != 8 || v12 != 6 || v10 != 33 && v10 != 65 || !v17) {
    goto LABEL_46;
  }
  uint64_t v120 = v17;
  uint64_t v123 = v14;
  uint64_t v126 = a7;
  uint64_t v134 = v10;
  size_t v18 = 2 * v10;
  if (*(unsigned char *)(a1 + 160))
  {
    if (!*(void *)(a1 + 64))
    {
      unint64_t v19 = malloc_type_calloc(48 * v10, 2uLL, 0x1000040BDFB0063uLL);
      *(void *)(a1 + 64) = v19;
      if (!v19)
      {
        FigDebugAssert3();
        uint64_t v110 = FigSignalErrorAt();
        goto LABEL_58;
      }
    }
    uint64_t v20 = 0;
    uint64_t v21 = 0;
    do
    {
      uint64_t v22 = 0;
      uint64_t v23 = 2 * v21;
      v21 += 8 * v134;
      do
      {
        uint64_t v24 = sub_262FBB03C(a6, 0);
        uint64_t v25 = sub_262FBAD04(a6) + v20;
        uint64_t v26 = v24 + v25 * sub_262FBAE0C(a6);
        uint64_t v27 = sub_262FBACAC(a6) + v22;
        uint64_t v28 = sub_262FBAE64(a6);
        memcpy((void *)(*(void *)(a1 + 64) + v23), (const void *)(v26 + v27 * v28), v18);
        ++v22;
        v23 += v18;
      }
      while (v22 != 8);
      ++v20;
    }
    while (v20 != 6);
  }
  uint64_t v29 = 96;
  if (v134 == 33) {
    uint64_t v29 = 80;
  }
  objc_storeStrong((id *)(a1 + 8), *(id *)(a1 + v29));
  uint64_t v31 = *(void **)(a1 + 8);
  uint64_t v32 = v120;
  if (*(unsigned char *)(a1 + 128))
  {
    uint64_t v32 = *(void *)(a1 + 72);
    size_t v33 = v18;
  }
  else
  {
    size_t v33 = v123;
  }
  if (*(unsigned char *)(a1 + 128)) {
    uint64_t v34 = 16 * v134;
  }
  else {
    uint64_t v34 = v13;
  }
  float32x4_t v143 = 0uLL;
  v144.i64[0] = 0;
  v144.i64[1] = v134;
  long long v145 = xmmword_2630179C0;
  objc_msgSend_replaceRegion_mipmapLevel_slice_withBytes_bytesPerRow_bytesPerImage_(v31, v30, (uint64_t)&v143, 0, 0, v32, v33, v34);
  uint64_t v35 = *(void **)(a1 + 16);
  float32x4_t v143 = 0uLL;
  uint64_t v36 = (unsigned __int16)a6[110616];
  v144.i64[0] = 0;
  v144.i64[1] = v36;
  int64x2_t v135 = vdupq_n_s64(1uLL);
  long long v145 = (__int128)v135;
  objc_msgSend_replaceRegion_mipmapLevel_slice_withBytes_bytesPerRow_bytesPerImage_(v35, v37, (uint64_t)&v143, 0, 0, a6 + 110617, 0, 0);
  v38 = *(void **)(a1 + 24);
  uint64_t v39 = *(unsigned __int16 *)(v126 + 221748);
  float32x4_t v143 = 0uLL;
  v144.i64[0] = 0;
  v144.i64[1] = v39;
  long long v145 = (__int128)v135;
  objc_msgSend_replaceRegion_mipmapLevel_slice_withBytes_bytesPerRow_bytesPerImage_(v38, v40, (uint64_t)&v143, 0, 0, v126 + 221750, 0, 0);
  v41 = a6 + 55308;
  float v42 = sub_262FBB008(v41);
  *(unsigned char *)(a1 + 56) = v42 != 0;
  if (!v42)
  {
    uint64_t v78 = 0;
    goto LABEL_48;
  }
  if (v42 != (_WORD *)27
    || (v43 = sub_262FBABDC(v41), unint64_t v44 = sub_262FBAC44(v41), v124 = v43, v43 > 0x20)
    || (uint64_t v48 = v44, v44 >= 0x21))
  {
LABEL_46:
    FigDebugAssert3();
    uint64_t v78 = 0;
LABEL_50:
    uint64_t v110 = 4294954516;
    goto LABEL_51;
  }
  if (v43 == objc_msgSend_height(*(void **)(a1 + 48), v45, v46, v47)
    && v48 == objc_msgSend_depth(*(void **)(a1 + 48), v49, v50, v51))
  {
    goto LABEL_30;
  }
  objc_msgSend_makeAliasable(*(void **)(a1 + 48), v49, v50, v51);
  uint64_t v55 = objc_opt_new();
  if (!v55) {
    goto LABEL_57;
  }
  uint64_t v56 = objc_msgSend_resourceOptions(*(void **)(a1 + 88), v52, v53, v54);
  objc_msgSend_setResourceOptions_(v55, v57, v56, v58);
  objc_msgSend_setTextureType_(v55, v59, 7, v60);
  objc_msgSend_setWidth_(v55, v61, 3, v62);
  objc_msgSend_setHeight_(v55, v63, v43, v64);
  objc_msgSend_setDepth_(v55, v65, v48, v66);
  objc_msgSend_setPixelFormat_(v55, v67, 115, v68);
  objc_msgSend_setUsage_(v55, v69, 1, v70);
  uint64_t v73 = objc_msgSend_newTextureWithDescriptor_(*(void **)(a1 + 88), v71, (uint64_t)v55, v72);
  int32x4_t v74 = *(void **)(a1 + 48);
  *(void *)(a1 + 48) = v73;

  if (!*(void *)(a1 + 48))
  {
LABEL_57:
    FigDebugAssert3();
    uint64_t v110 = FigSignalErrorAt();

LABEL_58:
    uint64_t v78 = 0;
    goto LABEL_51;
  }

LABEL_30:
  int32x4_t v75 = vzip1q_s32(a2, a4);
  v146.columns[0] = (simd_float3)vzip1q_s32(v75, a3);
  v146.columns[1] = (simd_float3)vzip2q_s32(v75, vdupq_lane_s32(*(int32x2_t *)a3.i8, 1));
  v146.columns[0].i32[3] = 0;
  v146.columns[2] = (simd_float3)vzip1q_s32(vzip2q_s32(a2, a4), vdupq_laneq_s32(a3, 2));
  float32x4_t v115 = (float32x4_t)v146.columns[1];
  v146.columns[1].i32[3] = 0;
  v146.columns[2].i32[3] = 0;
  simd_float3x3 v147 = __invert_f3(v146);
  simd_float3 v118 = v147.columns[1];
  simd_float3 v121 = v147.columns[0];
  simd_float3 v116 = v147.columns[2];
  uint64_t v76 = 24 * v43;
  uint64_t v78 = malloc_type_malloc(24 * v124 * v48, 0x1000040BDFB0063uLL);
  if (!v78)
  {
    FigDebugAssert3();
    uint64_t v110 = 4294954510;
    goto LABEL_51;
  }
  if (v48)
  {
    uint64_t v79 = 0;
    int32x4_t v80 = vzip1q_s32(a2, a3);
    v80.i32[2] = a4.i32[0];
    int32x4_t v81 = vzip2q_s32(a2, a3);
    v81.i32[2] = a4.i32[2];
    simd_float3 v82 = v121;
    v82.i32[3] = 0;
    float32x4_t v122 = (float32x4_t)v82;
    simd_float3 v83 = v118;
    v83.i32[3] = 0;
    float32x4_t v119 = (float32x4_t)v83;
    simd_float3 v84 = v116;
    v84.i32[3] = 0;
    float32x4_t v117 = (float32x4_t)v84;
    uint64_t v112 = v48;
    float32x4_t v113 = (float32x4_t)v81;
    float32x4_t v114 = (float32x4_t)v80;
    while (!v124)
    {
LABEL_44:
      ++v79;
      uint64_t v48 = v112;
      if (v79 == v112) {
        goto LABEL_45;
      }
    }
    uint64_t v85 = 0;
    while (1)
    {
      *(double *)v86.i64 = sub_262FBB0A8(v41, v85, v79, 0);
      v86.i32[3] = 0;
      v87.i32[3] = 0;
      float32x4_t v131 = v87;
      v88.i32[3] = 0;
      float32x4_t v133 = v88;
      float32x4_t v136 = v86;
      *(double *)v89.i64 = sub_262FBB0A8(v41, v85, v79, 1);
      v89.i32[3] = 0;
      v90.i32[3] = 0;
      float32x4_t v127 = v90;
      float32x4_t v129 = v89;
      v91.i32[3] = 0;
      float32x4_t v125 = v91;
      *(double *)v92.i64 = sub_262FBB0A8(v41, v85, v79, 2);
      uint32x4_t v95 = (uint32x4_t)vandq_s8(vandq_s8((int8x16_t)vceqq_f32(v136, v129), (int8x16_t)vceqq_f32(v131, v127)), (int8x16_t)vceqq_f32(v133, v125));
      v95.i32[3] = v95.i32[2];
      if ((vminvq_u32(v95) & 0x80000000) == 0) {
        break;
      }
      v94.i32[3] = 0;
      v93.i32[3] = 0;
      v92.i32[3] = 0;
      uint32x4_t v96 = (uint32x4_t)vandq_s8(vandq_s8((int8x16_t)vceqq_f32(v92, v129), (int8x16_t)vceqq_f32(v93, v127)), (int8x16_t)vceqq_f32(v94, v125));
      v96.i32[3] = v96.i32[2];
      if ((vminvq_u32(v96) & 0x80000000) == 0) {
        break;
      }
      uint64_t v97 = 0;
      long long v138 = 0u;
      long long v139 = 0u;
      long long v137 = 0u;
      float32x4_t v140 = v129;
      float32x4_t v141 = v127;
      float32x4_t v142 = v125;
      float32x4_t v143 = 0u;
      float32x4_t v144 = 0u;
      long long v145 = 0u;
      do
      {
        *(float32x4_t *)((char *)&v143 + v97 * 4) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v114, COERCE_FLOAT(*(_OWORD *)((char *)&v140 + v97 * 4))), v115, *(float32x2_t *)&v140.f32[v97], 1), v113, *(float32x4_t *)((char *)&v140 + v97 * 4), 2);
        v97 += 4;
      }
      while (v97 != 12);
      uint64_t v98 = 0;
      float32x4_t v99 = v143;
      float32x4_t v100 = v144;
      float32x4_t v101 = (float32x4_t)v145;
      float32x4_t v140 = v122;
      float32x4_t v141 = v119;
      float32x4_t v142 = v117;
      float32x4_t v143 = 0uLL;
      float32x4_t v144 = 0uLL;
      long long v145 = 0uLL;
      do
      {
        *(float32x4_t *)((char *)&v143 + v98 * 4) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v99, COERCE_FLOAT(*(_OWORD *)((char *)&v140 + v98 * 4))), v100, *(float32x2_t *)&v140.f32[v98], 1), v101, *(float32x4_t *)((char *)&v140 + v98 * 4), 2);
        v98 += 4;
      }
      while (v98 != 12);
      uint64_t v102 = 0;
      DWORD2(v137) = v143.i32[2];
      DWORD2(v138) = v144.i32[2];
      *(void *)&long long v137 = v143.i64[0];
      *(void *)&long long v138 = v144.i64[0];
      DWORD2(v139) = DWORD2(v145);
      *(void *)&long long v139 = v145;
      do
      {
        unsigned int v103 = v102 / 3u;
        _S0 = *(_DWORD *)((unint64_t)(&v137 + v103) & 0xFFFFFFFFFFFFFFF3 | (4
                                                                                   * ((v102 % 3u) & 3)));
        __asm { FCVT            H0, S0 }
        v78[4 * v103 + ((12 * (v85 + v79 * v124)) | (v102++ % 3u))] = _S0;
      }
      while (v102 != 9);
      if (++v85 == v124) {
        goto LABEL_44;
      }
    }
    FigDebugAssert3();
    goto LABEL_50;
  }
LABEL_45:
  v109 = *(void **)(a1 + 48);
  float32x4_t v143 = 0uLL;
  v144.i64[0] = 0;
  v144.i64[1] = 3;
  *(void *)&long long v145 = v124;
  *((void *)&v145 + 1) = v48;
  objc_msgSend_replaceRegion_mipmapLevel_slice_withBytes_bytesPerRow_bytesPerImage_(v109, v77, (uint64_t)&v143, 0, 0, v78, 24, v76);
LABEL_48:
  uint64_t v110 = 0;
LABEL_51:
  free(v78);
  *(unsigned char *)(a1 + 128) = 0;
  return v110;
}

- (BOOL)enableSTF
{
  return self->_enableSTF;
}

- (void)setEnableSTF:(BOOL)a3
{
  self->_enableSTF = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ltcBinsTexD4x, 0);
  objc_storeStrong((id *)&self->_internalHeap, 0);
  objc_storeStrong((id *)&self->_ltcBinsTexD3x, 0);
  objc_storeStrong((id *)&self->_spatialCCMTex, 0);
  objc_storeStrong((id *)&self->_blackWhiteStrengthCenter, 0);
  objc_storeStrong((id *)&self->_lumaHistogram, 0);
  objc_storeStrong((id *)&self->_ltcGTCFinalTex, 0);
  objc_storeStrong((id *)&self->_ltcGTCRatioTex, 0);

  objc_storeStrong((id *)&self->_ltcBinsTex, 0);
}

@end