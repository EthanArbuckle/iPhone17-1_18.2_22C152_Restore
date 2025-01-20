@interface ToneMappingCurves
- (BOOL)enableSTF;
- (ToneMappingCurves)initWithWithContext:(id)a3;
- (int)estimateMaskRegionInTiles:(__CVBuffer *)a3;
- (int)regularizeLocalToneCurves:(const ltmCurves *)a3 mask:(__CVBuffer *)a4 tcrParams:(id)a5 imageDims:;
- (int)updateToneCurveAllocationsWithLTC:(const ltmCurves *)a3;
- (uint64_t)setToneCurvesWithLTC:(int32x4_t)a3 GTC:(int32x4_t)a4 backgroundCurves:(uint64_t)a5 colorCorrectionMatrix:(_WORD *)a6 enableUTM:(uint64_t)a7 dump:(_WORD *)a8;
- (void)dealloc;
- (void)setEnableSTF:(BOOL)a3;
@end

@implementation ToneMappingCurves

- (ToneMappingCurves)initWithWithContext:(id)a3
{
  id v4 = a3;
  v46.receiver = self;
  v46.super_class = (Class)ToneMappingCurves;
  v5 = [(ToneMappingCurves *)&v46 init];
  if (!v5)
  {
    FigDebugAssert3();
    v11 = 0;
    v7 = 0;
    goto LABEL_28;
  }
  v6 = objc_opt_new();
  v7 = v6;
  if (!v6) {
    goto LABEL_24;
  }
  [v6 setStorageMode:0];
  [v7 setHazardTrackingMode:2];
  [v7 setSize:204800];
  v8 = [v4 device];
  uint64_t v9 = [v8 newHeapWithDescriptor:v7];
  internalHeap = v5->_internalHeap;
  v5->_internalHeap = (MTLHeap *)v9;

  if (!v5->_internalHeap)
  {
LABEL_24:
    FigDebugAssert3();
    v11 = 0;
    goto LABEL_28;
  }
  v11 = objc_opt_new();
  if (!v11) {
    goto LABEL_27;
  }
  objc_msgSend(v11, "setResourceOptions:", -[MTLHeap resourceOptions](v5->_internalHeap, "resourceOptions"));
  v5->_newLTC = 0;
  v5->_bypassGTC = (unsigned __int16 *)malloc_type_calloc(0x101uLL, 2uLL, 0x1000040BDFB0063uLL);
  v5->_regGlobal = (float *)malloc_type_calloc(0x41uLL, 4uLL, 0x100004052888210uLL);
  v5->_regLocal = (float *)malloc_type_calloc(0x41uLL, 4uLL, 0x100004052888210uLL);
  v5->_maskTile = 0;
  v5->_isRegularized = 0;
  v5->_hasBeenRegularized = 0;
  v5->_highlightCompressionValid = 0;
  *(_WORD *)&v5->_isHazeCorrectionValid = 0;
  *(_DWORD *)&v5->_hazeCorrection[8] = 0;
  *(void *)v5->_hazeCorrection = 0;
  v45.receiver = v5;
  v45.super_class = (Class)ToneMappingCurves;
  v12 = [(ToneMappingCurves *)&v45 init];
  v5 = v12;
  if (!v12)
  {
LABEL_28:
    int v41 = FigSignalErrorAt();
    v38 = 0;
    if (v41) {
      goto LABEL_22;
    }
    goto LABEL_21;
  }
  uint64_t v13 = [(MTLHeap *)v12->_internalHeap newBufferWithLength:1024 options:[(MTLHeap *)v12->_internalHeap resourceOptions]];
  lumaHistogram = v5->_lumaHistogram;
  v5->_lumaHistogram = (MTLBuffer *)v13;

  if (!v5->_lumaHistogram) {
    goto LABEL_27;
  }
  uint64_t v15 = [(MTLHeap *)v5->_internalHeap newBufferWithLength:16 options:[(MTLHeap *)v5->_internalHeap resourceOptions]];
  blackWhiteStrengthCenter = v5->_blackWhiteStrengthCenter;
  v5->_blackWhiteStrengthCenter = (MTLBuffer *)v15;

  if (!v5->_blackWhiteStrengthCenter) {
    goto LABEL_27;
  }
  uint64_t v17 = 0;
  int64x2_t v18 = (int64x2_t)xmmword_263380330;
  bypassGTC = v5->_bypassGTC;
  uint64x2_t v20 = (uint64x2_t)vdupq_n_s64(0x101uLL);
  int64x2_t v21 = vdupq_n_s64(2uLL);
  do
  {
    if (vmovn_s64((int64x2_t)vcgtq_u64(v20, (uint64x2_t)v18)).u8[0]) {
      bypassGTC[v17] = (int)(float)((float)((float)(unsigned __int16)v17 * 0.0039062) * 65535.0);
    }
    if (vmovn_s64((int64x2_t)vcgtq_u64((uint64x2_t)vdupq_n_s64(0x101uLL), *(uint64x2_t *)&v18)).i32[1]) {
      bypassGTC[v17 + 1] = (int)(float)((float)((float)((unsigned __int16)v17 | 1u) * 0.0039062) * 65535.0);
    }
    v17 += 2;
    int64x2_t v18 = vaddq_s64(v18, v21);
  }
  while (v17 != 258);
  objc_msgSend(v11, "setTextureType:", 0, *(double *)v18.i64);
  [v11 setWidth:257];
  [v11 setHeight:1];
  [v11 setDepth:1];
  [v11 setPixelFormat:20];
  [v11 setUsage:1];
  uint64_t v22 = [(MTLHeap *)v5->_internalHeap newTextureWithDescriptor:v11];
  ltcGTCRatioTex = v5->_ltcGTCRatioTex;
  v5->_ltcGTCRatioTex = (MTLTexture *)v22;

  if (!v5->_ltcGTCRatioTex) {
    goto LABEL_27;
  }
  uint64_t v24 = [(MTLHeap *)v5->_internalHeap newTextureWithDescriptor:v11];
  ltcGTCRatioBackgroundTex = v5->_ltcGTCRatioBackgroundTex;
  v5->_ltcGTCRatioBackgroundTex = (MTLTexture *)v24;

  if (!v5->_ltcGTCRatioBackgroundTex) {
    goto LABEL_27;
  }
  [v11 setTextureType:0];
  [v11 setWidth:257];
  [v11 setHeight:1];
  [v11 setDepth:1];
  [v11 setPixelFormat:20];
  [v11 setUsage:1];
  uint64_t v26 = [(MTLHeap *)v5->_internalHeap newTextureWithDescriptor:v11];
  ltcGTCFinalTex = v5->_ltcGTCFinalTex;
  v5->_ltcGTCFinalTex = (MTLTexture *)v26;

  if (!v5->_ltcGTCFinalTex) {
    goto LABEL_27;
  }
  uint64_t v28 = [(MTLHeap *)v5->_internalHeap newTextureWithDescriptor:v11];
  ltcGTCFinalBackgroundTex = v5->_ltcGTCFinalBackgroundTex;
  v5->_ltcGTCFinalBackgroundTex = (MTLTexture *)v28;

  if (!v5->_ltcGTCFinalBackgroundTex) {
    goto LABEL_27;
  }
  [v11 setTextureType:0];
  [v11 setWidth:257];
  [v11 setHeight:1];
  [v11 setDepth:1];
  [v11 setPixelFormat:20];
  [v11 setUsage:1];
  uint64_t v30 = [(MTLHeap *)v5->_internalHeap newTextureWithDescriptor:v11];
  bypassGTCTex = v5->_bypassGTCTex;
  v5->_bypassGTCTex = (MTLTexture *)v30;

  v32 = v5->_bypassGTCTex;
  if (!v32) {
    goto LABEL_27;
  }
  memset(v42, 0, sizeof(v42));
  v33 = v5->_bypassGTC;
  long long v43 = xmmword_263480550;
  uint64_t v44 = 1;
  [(MTLTexture *)v32 replaceRegion:v42 mipmapLevel:0 slice:0 withBytes:v33 bytesPerRow:0 bytesPerImage:0];
  [v11 setTextureType:7];
  [v11 setWidth:3];
  [v11 setHeight:8];
  [v11 setDepth:6];
  [v11 setPixelFormat:115];
  [v11 setUsage:1];
  uint64_t v34 = [(MTLHeap *)v5->_internalHeap newTextureWithDescriptor:v11];
  spatialCCMTex = v5->_spatialCCMTex;
  v5->_spatialCCMTex = (MTLTexture *)v34;

  if (!v5->_spatialCCMTex) {
    goto LABEL_27;
  }
  [v11 setTextureType:0];
  [v11 setWidth:257];
  [v11 setHeight:1];
  [v11 setDepth:1];
  [v11 setPixelFormat:20];
  [v11 setUsage:1];
  uint64_t v36 = [(MTLHeap *)v5->_internalHeap newTextureWithDescriptor:v11];
  highlightCompression = v5->_highlightCompression;
  v5->_highlightCompression = (MTLTexture *)v36;

  if (!v5->_highlightCompression)
  {
LABEL_27:
    FigDebugAssert3();
    goto LABEL_28;
  }
LABEL_21:
  v38 = v5;
LABEL_22:
  v39 = v38;

  return v39;
}

- (void)dealloc
{
  unregularizedLTC = self->_unregularizedLTC;
  if (unregularizedLTC) {
    free(unregularizedLTC);
  }
  unregularizedForegroundLTC = self->_unregularizedForegroundLTC;
  if (unregularizedForegroundLTC) {
    free(unregularizedForegroundLTC);
  }
  free(self->_newLTC);
  free(self->_bypassGTC);
  free(self->_regGlobal);
  free(self->_regLocal);
  free(self->_maskTile);
  v5.receiver = self;
  v5.super_class = (Class)ToneMappingCurves;
  [(ToneMappingCurves *)&v5 dealloc];
}

- (int)estimateMaskRegionInTiles:(__CVBuffer *)a3
{
  if (CVPixelBufferLockBaseAddress(a3, 0)) {
    return -73266;
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
    int64x2_t v18 = &BaseAddress[offX];
    do
    {
      uint64_t v19 = 0;
      uint64x2_t v20 = &v18[(offY + v12 * v17) * BytesPerRow];
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
  __n128 v137 = v6;
  uint64_t v139 = *MEMORY[0x263EF8340];
  float v10 = (float *)a5;
  if (!v10) {
    goto LABEL_17;
  }
  unint64_t v138 = v5;
  self->_isRegularized = 1;
  if (self->_enableSTF) {
    self->_hasBeenRegularized = 1;
  }
  self->_unint64_t ltmBinsX = getLTM_validWidth(a3);
  self->_unint64_t ltmBinsY = getLTM_validHeight(a3);
  uint64_t LTM_ltmCurveEntryCount = getLTM_ltmCurveEntryCount(a3);
  LTM_lutssize_t BytesPerRow = getLTM_lutsBytesPerRow(a3);
  uint64_t LTM_lutsBytesPerColumn = getLTM_lutsBytesPerColumn(a3);
  unint64_t v136 = LTM_lutsBytesPerRow;
  uint64_t v14 = getLTM_topPadding(a3) * LTM_lutsBytesPerRow;
  uint64_t LTM_leftPadding = getLTM_leftPadding(a3);
  uint64_t v135 = LTM_lutsBytesPerColumn;
  uint64_t LTM_data = getLTM_data(a3, (unint64_t)(v14 + LTM_leftPadding * LTM_lutsBytesPerColumn) >> 1);
  LTM_tilesize_t Width = getLTM_tileWidth(a3);
  LTM_tilesize_t Height = getLTM_tileHeight(a3);
  unint64_t ltmBinsX = self->_ltmBinsX;
  unint64_t ltmBinsY = self->_ltmBinsY;
  size_t Width = CVPixelBufferGetWidth(a4);
  size_t Height = CVPixelBufferGetHeight(a4);
  unint64_t v22 = self->_ltmBinsX;
  if (v22 == 16)
  {
    if (self->_ltmBinsY != 12)
    {
LABEL_17:
      FigDebugAssert3();
      int v32 = -12780;
      goto LABEL_77;
    }
  }
  else if (v22 != 8 || self->_ltmBinsY != 6)
  {
    goto LABEL_17;
  }
  if (LTM_ltmCurveEntryCount != 33 && LTM_ltmCurveEntryCount != 65 || !LTM_data) {
    goto LABEL_17;
  }
  unint64_t v138 = Height;
  unint64_t v23 = ltmBinsX * LTM_tileWidth;
  [(ToneMappingCurves *)self updateToneCurveAllocationsWithLTC:a3];
  __n128 v29 = v137;
  if (v137.n128_i32[0] >= v23 && v137.n128_i32[1] >= ltmBinsY * LTM_tileHeight)
  {
    int v30 = (int)(float)((float)((float)((float)(v137.n128_i32[1] - ltmBinsY * LTM_tileHeight) * 0.5) * (float)v138)
                     / (float)v137.n128_i32[1]);
    self->_uint64_t offX = (int)(float)((float)((float)((float)(v137.n128_i32[0] - v23) * 0.5) * (float)Width)
                             / (float)v137.n128_i32[0]);
    self->_uint64_t offY = v30;
    [(ToneMappingCurves *)self estimateMaskRegionInTiles:a4];
  }
  if (self->_isRegularized)
  {
    float v31 = 1.0 - v10[3];
    v29.n128_f32[0] = 1.0 - v10[2];
  }
  else
  {
    float v31 = 1.0;
    v29.n128_u32[0] = 1.0;
  }
  uint64_t v33 = 0;
  int v34 = 0;
  regLocal = self->_regLocal;
  unint64_t v36 = self->_ltmBinsY;
  uint64_t v37 = 2 * (v136 >> 1);
  uint64_t v38 = 2 * (int)(v135 >> 1);
  v24.n128_u32[0] = 1199570688;
  uint64_t v39 = LTM_data;
  do
  {
    regLocal[v33] = 0.0;
    if ((int)v36 >= 1)
    {
      uint64_t v40 = 0;
      uint64_t v41 = 0;
      unint64_t v42 = self->_ltmBinsX;
      v25.n128_u64[0] = 0;
      long long v43 = (_WORD *)v39;
      do
      {
        if ((int)v42 >= 1)
        {
          uint64_t v44 = &self->_maskTile[v40];
          uint64_t v45 = v42;
          objc_super v46 = v43;
          do
          {
            unsigned int v47 = *(_DWORD *)v44;
            if (*v44 > v10[4])
            {
              LOWORD(v47) = *v46;
              v25.n128_f32[0] = v25.n128_f32[0] + (float)((float)v47 / 65535.0);
              regLocal[v33] = v25.n128_f32[0];
              ++v34;
            }
            objc_super v46 = (_WORD *)((char *)v46 + v38);
            ++v44;
            --v45;
          }
          while (v45);
        }
        ++v41;
        long long v43 = (_WORD *)((char *)v43 + v37);
        v40 += v42;
      }
      while (v41 != v36);
    }
    ++v33;
    v39 += 2;
  }
  while (v33 != LTM_ltmCurveEntryCount);
  v25.n128_u32[0] = 1.0;
  if (v10[5] < (float)v34)
  {
    v48 = self->_regLocal;
    uint64_t v49 = LTM_ltmCurveEntryCount;
    do
    {
      float *v48 = *v48 / (float)((float)v34 / (float)(unint64_t)LTM_ltmCurveEntryCount);
      ++v48;
      --v49;
    }
    while (v49);
    uint64_t v50 = 0;
    v25.n128_u64[0] = 0;
    uint64_t v51 = LTM_data;
    do
    {
      if ((int)self->_ltmBinsY >= 1)
      {
        uint64_t v52 = 0;
        uint64_t v53 = 0;
        unint64_t v54 = self->_ltmBinsX;
        v55 = (_WORD *)v51;
        do
        {
          if ((int)v54 >= 1)
          {
            v56 = &self->_maskTile[v52];
            uint64_t v57 = self->_ltmBinsX;
            v58 = v55;
            do
            {
              if (*v56 > v10[4])
              {
                LOWORD(v28) = *v58;
                float v28 = (float)LODWORD(v28) / -65535.0;
                v25.n128_f32[0] = v25.n128_f32[0] + fabsf(self->_regLocal[v50] + v28);
              }
              v58 = (_WORD *)((char *)v58 + v38);
              ++v56;
              --v57;
            }
            while (v57);
          }
          ++v53;
          v55 = (_WORD *)((char *)v55 + v37);
          v52 += v54;
        }
        while (v53 != self->_ltmBinsY);
      }
      ++v50;
      v51 += 2;
    }
    while (v50 != LTM_ltmCurveEntryCount);
    v27.n128_u32[1] = 0;
    float v59 = fminf(fmaxf((float)(v25.n128_f32[0] - v10[6]) / (float)(v10[7] - v10[6]), 0.0), 1.0);
    v25.n128_f32[0] = (float)((float)(1.0 - v10[8]) * (float)((float)(v59 * v59) * (float)((float)(v59 * -2.0) + 3.0)))
                    + (float)(v31 * (float)(1.0 - (float)((float)(v59 * v59) * (float)((float)(v59 * -2.0) + 3.0))));
  }
  unint64_t v60 = self->_ltmBinsY;
  if ((int)v60 >= 1)
  {
    uint64_t v61 = 0;
    v26.n128_u32[0] = 1.0;
    v27.n128_f32[0] = 1.0 - v29.n128_f32[0];
    unint64_t v62 = self->_ltmBinsX;
    __n128 v63 = (__n128)xmmword_263480560;
    __n128 v64 = (__n128)xmmword_263380330;
    __n128 v65 = (__n128)xmmword_263380160;
    __asm { FMOV            V16.4S, #1.0 }
    uint64_t v71 = 1132396544;
    uint64_t v72 = LTM_data;
    do
    {
      if ((int)v62 >= 1)
      {
        uint64_t v73 = 0;
        v74 = (char *)v72;
        do
        {
          uint64_t v71 = MEMORY[0x270FA5388](v71, v72, v73, v74, &v133, (4 * self->_ltmBinsY * v62 + 15) & 0xFFFFFFFFFFFFFFF0, v29, v24, v25, v26, v27, v63, v64, v65);
          v89 = (char *)&v133 - v88;
          unint64_t v90 = self->_ltmBinsY;
          if ((int)v90 < 1)
          {
            float v96 = 0.0;
          }
          else
          {
            uint64_t v91 = 0;
            unint64_t v92 = self->_ltmBinsX;
            *(float *)v85.i32 = (float)(int)v75;
            uint64x2_t v93 = (uint64x2_t)vdupq_n_s64((unint64_t)v92 - 1);
            float32x4_t v94 = (float32x4_t)vdupq_lane_s32(v85, 0);
            v95 = v89 + 8;
            float v96 = 0.0;
            do
            {
              if ((int)v92 >= 1)
              {
                v86.f32[0] = (float)((float)(int)v91 - v84) * (float)((float)(int)v91 - v84);
                v97 = v95;
                float32x4_t v86 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v86.f32, 0);
                uint64_t v98 = (v92 + 3) & 0x1FFFFFFFCLL;
                int64x2_t v99 = (int64x2_t)v64;
                int64x2_t v100 = (int64x2_t)v63;
                int32x4_t v101 = (int32x4_t)v65;
                do
                {
                  int32x4_t v102 = (int32x4_t)vcgeq_u64(v93, (uint64x2_t)v99);
                  *(int32x2_t *)v87.i8 = vmovn_s64((int64x2_t)v102);
                  int32x2_t v103 = (int32x2_t)vmovn_s32(v87);
                  float32x4_t v104 = vsubq_f32(vcvtq_f32_s32(v101), v94);
                  float32x4_t v105 = vaddq_f32(v86, vmulq_f32(v104, v104));
                  int8x16_t v106 = vbicq_s8((int8x16_t)vdivq_f32(v80, v105), (int8x16_t)vceqzq_f32(v105));
                  if (v103.i8[0]) {
                    *((_DWORD *)v97 - 2) = v106.i32[0];
                  }
                  if (vmovn_s32(v87).i8[2]) {
                    *((_DWORD *)v97 - 1) = v106.i32[1];
                  }
                  int32x4_t v87 = (int32x4_t)vcgeq_u64(v93, (uint64x2_t)v100);
                  int32x2_t v107 = (int32x2_t)vmovn_s32(vmovn_hight_s64(v103, (int64x2_t)v87));
                  if (v107.i8[4]) {
                    *(_DWORD *)v97 = v106.i32[2];
                  }
                  if (vmovn_s32(vmovn_hight_s64(v107, *(int64x2_t *)&v87)).i8[6]) {
                    *((_DWORD *)v97 + 1) = v106.i32[3];
                  }
                  int8x16_t v108 = vbslq_s8((int8x16_t)vuzp1q_s32(v102, v87), v106, v81);
                  float v96 = (float)((float)((float)(v96 + *(float *)v108.i32) + *(float *)&v108.i32[1])
                              + *(float *)&v108.i32[2])
                      + *(float *)&v108.i32[3];
                  int64x2_t v100 = vaddq_s64(v100, v82);
                  int64x2_t v99 = vaddq_s64(v99, v82);
                  int32x4_t v101 = vaddq_s32(v101, v83);
                  v97 += 16;
                  v98 -= 4;
                }
                while (v98);
              }
              ++v91;
              v95 += 4 * (int)v92;
            }
            while (v91 != v90);
          }
          uint64_t v109 = 0;
          regGlobal = self->_regGlobal;
          uint64_t v111 = LTM_data;
          do
          {
            regGlobal[v109] = 0.0;
            if ((int)v90 >= 1)
            {
              uint64_t v112 = 0;
              unint64_t v113 = self->_ltmBinsX;
              float v114 = 0.0;
              v115 = (__int16 *)v111;
              v116 = (float *)v89;
              do
              {
                uint64_t v117 = v113;
                v118 = v115;
                v119 = v116;
                if ((int)v113 >= 1)
                {
                  do
                  {
                    float v120 = *v119++;
                    v86.i16[0] = *v118;
                    v86.f32[0] = (float)v86.u32[0];
                    float v114 = v114 + (float)((float)((float)(v120 / v96) * v86.f32[0]) / v24.n128_f32[0]);
                    v118 = (__int16 *)((char *)v118 + v77);
                    --v117;
                  }
                  while (v117);
                  regGlobal[v109] = v114;
                }
                ++v112;
                v116 += (int)v113;
                v115 = (__int16 *)((char *)v115 + v37);
              }
              while (v112 != v90);
            }
            ++v109;
            v111 += 2;
          }
          while (v109 != v79);
          float v121 = self->_maskTile[v75 + self->_ltmBinsX * v61] / *(float *)&v71;
          float v122 = (float)(v26.n128_f32[0] - v121) + (float)(v25.n128_f32[0] * v121);
          v124 = self->_regGlobal;
          v123 = self->_regLocal;
          uint64_t v125 = v79;
          v126 = v76;
          do
          {
            float v127 = *v123++;
            float v128 = v127;
            unsigned int v129 = *v126++;
            unsigned int v130 = (int)(float)((float)(v122 * (float)v129)
                              + (float)((float)((float)(v26.n128_f32[0] - v122) * v128) * v24.n128_f32[0]));
            float v131 = *v124++;
            *v78++ = (int)(float)((float)(v29.n128_f32[0] * (float)v130)
                                + (float)((float)(v27.n128_f32[0] * v131) * v24.n128_f32[0]));
            --v125;
          }
          while (v125);
          uint64_t v73 = v75 + 1;
          unint64_t v62 = self->_ltmBinsX;
          v74 = (char *)v76 + v77;
        }
        while (v73 < (int)v62);
        unint64_t v60 = self->_ltmBinsY;
      }
      ++v61;
      v72 += v37;
    }
    while (v61 < (int)v60);
  }
  int v32 = 0;
LABEL_77:

  return v32;
}

- (int)updateToneCurveAllocationsWithLTC:(const ltmCurves *)a3
{
  if (a3)
  {
    LTM_validsize_t Width = getLTM_validWidth(a3);
    LTM_validsize_t Height = getLTM_validHeight(a3);
    newLTC = self->_newLTC;
    if (!newLTC || self->_ltmBinsX != LTM_validWidth || self->_ltmBinsY != LTM_validHeight)
    {
      free(newLTC);
      self->_newLTC = (unsigned __int16 *)malloc_type_calloc(65 * LTM_validHeight * LTM_validWidth, 2uLL, 0x1000040BDFB0063uLL);
    }
    maskTile = self->_maskTile;
    if (!maskTile || self->_ltmBinsX != LTM_validWidth || self->_ltmBinsY != LTM_validHeight)
    {
      free(maskTile);
      self->_maskTile = (float *)malloc_type_calloc(LTM_validHeight * LTM_validWidth, 4uLL, 0x100004052888210uLL);
    }
    ltcBinsTexD3x = self->_ltcBinsTexD3x;
    if (ltcBinsTexD3x
      && [(MTLTexture *)ltcBinsTexD3x height] == LTM_validWidth
      && [(MTLTexture *)self->_ltcBinsTexD3x depth] == LTM_validHeight)
    {
      goto LABEL_18;
    }
    float v10 = objc_opt_new();
    if (v10)
    {
      objc_msgSend(v10, "setResourceOptions:", -[MTLHeap resourceOptions](self->_internalHeap, "resourceOptions"));
      [(MTLTexture *)self->_ltcBinsTexD3x makeAliasable];
      [(MTLTexture *)self->_ltcBinsTexD4x makeAliasable];
      [(MTLTexture *)self->_ltcBinsBackgroundTexD4x makeAliasable];
      [v10 setTextureType:7];
      [v10 setWidth:33];
      [v10 setHeight:LTM_validWidth];
      [v10 setDepth:LTM_validHeight];
      [v10 setPixelFormat:20];
      [v10 setUsage:1];
      v11 = (MTLTexture *)[(MTLHeap *)self->_internalHeap newTextureWithDescriptor:v10];
      uint64_t v12 = self->_ltcBinsTexD3x;
      self->_ltcBinsTexD3x = v11;

      uint64_t v13 = self->_ltcBinsTexD3x;
      if (v13)
      {
        objc_storeStrong((id *)&self->_ltcBinsTex, v13);
        [v10 setWidth:65];
        uint64_t v14 = (MTLTexture *)[(MTLHeap *)self->_internalHeap newTextureWithDescriptor:v10];
        ltcBinsTexD4x = self->_ltcBinsTexD4x;
        self->_ltcBinsTexD4x = v14;

        if (self->_ltcBinsTexD4x)
        {
          unint64_t v16 = (MTLTexture *)[(MTLHeap *)self->_internalHeap newTextureWithDescriptor:v10];
          ltcBinsBackgroundTexD4x = self->_ltcBinsBackgroundTexD4x;
          self->_ltcBinsBackgroundTexD4x = v16;

          if (self->_ltcBinsBackgroundTexD4x)
          {

LABEL_18:
            self->_unint64_t ltmBinsX = LTM_validWidth;
            self->_unint64_t ltmBinsY = LTM_validHeight;
            return 0;
          }
        }
      }
    }
    FigDebugAssert3();
    int v19 = FigSignalErrorAt();

    return v19;
  }
  else
  {
    FigDebugAssert3();
    return FigSignalErrorAt();
  }
}

- (uint64_t)setToneCurvesWithLTC:(int32x4_t)a3 GTC:(int32x4_t)a4 backgroundCurves:(uint64_t)a5 colorCorrectionMatrix:(_WORD *)a6 enableUTM:(uint64_t)a7 dump:(_WORD *)a8
{
  uint64_t v165 = *MEMORY[0x263EF8340];
  v123 = malloc_type_calloc(0x101uLL, 2uLL, 0x1000040BDFB0063uLL);
  if (!v123) {
    goto LABEL_94;
  }
  uint64_t LTM_ltmCurveEntryCount = getLTM_ltmCurveEntryCount(a6);
  LTM_validsize_t Width = getLTM_validWidth(a6);
  LTM_validsize_t Height = getLTM_validHeight(a6);
  LTM_lutssize_t BytesPerRow = getLTM_lutsBytesPerRow(a6);
  uint64_t LTM_lutsBytesPerColumn = getLTM_lutsBytesPerColumn(a6);
  uint64_t v134 = LTM_lutsBytesPerRow;
  uint64_t v16 = getLTM_topPadding(a6) * LTM_lutsBytesPerRow;
  uint64_t LTM_leftPadding = getLTM_leftPadding(a6);
  uint64_t v131 = LTM_lutsBytesPerColumn;
  uint64_t LTM_data = getLTM_data(a6, (unint64_t)(v16 + LTM_leftPadding * LTM_lutsBytesPerColumn) >> 1);
  uint64_t v142 = getLTM_ltmCurveEntryCount(a8);
  unint64_t v18 = getLTM_validWidth(a8);
  unint64_t v19 = getLTM_validHeight(a8);
  uint64_t v20 = getLTM_lutsBytesPerRow(a8);
  uint64_t v21 = getLTM_lutsBytesPerColumn(a8);
  uint64_t v140 = v20;
  uint64_t v22 = getLTM_topPadding(a8) * v20;
  uint64_t v23 = getLTM_leftPadding(a8);
  uint64_t v137 = v21;
  uint64_t v24 = getLTM_data(a8, (unint64_t)(v22 + v23 * v21) >> 1);
  if ((LTM_validWidth != 8 || LTM_validHeight != 6) && (LTM_validWidth != 16 || LTM_validHeight != 12)
    || LTM_ltmCurveEntryCount != 33 && LTM_ltmCurveEntryCount != 65
    || !LTM_data
    || (v18 != 8 || v19 != 6) && (v18 != 16 || v19 != 12)
    || v142 != 33 && v142 != 65
    || !v24
    || LTM_validWidth != v18
    || LTM_validHeight != v19)
  {
    goto LABEL_28;
  }
  uint64_t v129 = v24;
  [(id)a1 updateToneCurveAllocationsWithLTC:a6];
  uint64_t v125 = a1;
  if (*(float *)(a7 + 223048) > 1.01 && (a9 & 1) != 0)
  {
    uint64_t v25 = 0;
    int v26 = 0;
    int v27 = 0;
    int v28 = *(unsigned __int16 *)(a7 + 221750);
    do
    {
      int v29 = *(unsigned __int16 *)(a7 + 221752 + 2 * v25) - v28;
      if (v29 > v26) {
        int v27 = v25;
      }
      uint64_t v30 = v25 + 1;
      if (v29 > v26) {
        int v26 = v29;
      }
      int v28 = *(unsigned __int16 *)(a7 + 221752 + 2 * v25++);
    }
    while (v30 != 256);
    float v31 = fminf(fmaxf((float)((float)v27 + -8.0) * 0.5, 0.0), 1.0);
    float v32 = fminf(fmaxf((float)((float)v27 + -12.0) / 3.0, 0.0), 1.0);
    int v33 = (int)(float)((float)((float)((float)((float)(v32 * v32) * (float)((float)(v32 * -2.0) + 3.0))
                                     + (float)((float)(v32 * v32) * (float)((float)(v32 * -2.0) + 3.0)))
                             + (float)((float)((float)(v31 * v31) * (float)((float)(v31 * -2.0) + 3.0)) * 2.0))
                     + 0.5);
    if (dword_26B430EE8)
    {
      LODWORD(v157) = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      int v34 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    *(unsigned char *)(a1 + 161) = v33 > 0;
    if (v33 > 256) {
      goto LABEL_37;
    }
  }
  else
  {
    int v33 = 0;
    *(unsigned char *)(a1 + 161) = 0;
  }
  LODWORD(v37) = 257 - v33;
  if (257 - v33 <= 1) {
    uint64_t v37 = 1;
  }
  else {
    uint64_t v37 = v37;
  }
  uint64_t v38 = v123;
  uint64_t v39 = (__int16 *)(a7 + 2 * v33 + 221750);
  do
  {
    __int16 v40 = *v39++;
    *v38++ = v40;
    --v37;
  }
  while (v37);
  if (v33 >= 1)
  {
LABEL_37:
    uint64_t v41 = v123 + 256;
    uint64_t v42 = v33;
    do
    {
      *v41-- = *(_WORD *)(a7 + 222262);
      --v42;
    }
    while (v42);
  }
  if (!*(unsigned char *)(a1 + 252)) {
    goto LABEL_52;
  }
  if (!*(void *)(a1 + 96)
    && (long long v43 = malloc_type_calloc(LTM_validWidth * LTM_ltmCurveEntryCount * LTM_validHeight, 2uLL, 0x1000040BDFB0063uLL),
        (*(void *)(a1 + 96) = v43) == 0)
    || !*(void *)(a1 + 104)
    && (uint64_t v44 = malloc_type_calloc(LTM_validWidth * LTM_ltmCurveEntryCount * LTM_validHeight, 2uLL, 0x1000040BDFB0063uLL),
        (*(void *)(a1 + 104) = v44) == 0))
  {
LABEL_94:
    FigDebugAssert3();
    uint64_t v36 = FigSignalErrorAt();
    goto LABEL_104;
  }
  uint64_t v45 = 0;
  uint64_t v46 = 0;
  size_t v47 = 2 * LTM_ltmCurveEntryCount;
  unint64_t v151 = LTM_validWidth * LTM_ltmCurveEntryCount;
  do
  {
    uint64_t v48 = 0;
    uint64_t v49 = 2 * v46;
    uint64_t v148 = v151 + v46;
    do
    {
      uint64_t v50 = getLTM_data(a8, 0);
      uint64_t v51 = getLTM_topPadding(a8) + v45;
      uint64_t v52 = v50 + v51 * getLTM_lutsBytesPerRow(a8);
      uint64_t v53 = getLTM_leftPadding(a8) + v48;
      uint64_t v54 = getLTM_lutsBytesPerColumn(a8);
      memcpy((void *)(*(void *)(v125 + 96) + v49), (const void *)(v52 + v53 * v54), v47);
      ++v48;
      v49 += v47;
    }
    while (LTM_validWidth != v48);
    uint64_t v46 = v148;
    ++v45;
  }
  while (v45 != LTM_validHeight);
  uint64_t v55 = 0;
  uint64_t v56 = 0;
  do
  {
    uint64_t v57 = 0;
    uint64_t v58 = 2 * v56;
    uint64_t v149 = v151 + v56;
    do
    {
      uint64_t v59 = getLTM_data(a6, 0);
      uint64_t v60 = getLTM_topPadding(a6) + v55;
      uint64_t v61 = v59 + v60 * getLTM_lutsBytesPerRow(a6);
      uint64_t v62 = getLTM_leftPadding(a6) + v57;
      uint64_t v63 = getLTM_lutsBytesPerColumn(a6);
      memcpy((void *)(*(void *)(v125 + 104) + v58), (const void *)(v61 + v62 * v63), v47);
      ++v57;
      v58 += v47;
    }
    while (LTM_validWidth != v57);
    uint64_t v56 = v149;
    ++v55;
  }
  while (v55 != LTM_validHeight);
LABEL_52:
  __n128 v64 = a6 + 110616;
  uint64_t v65 = 200;
  if (LTM_ltmCurveEntryCount == 33) {
    uint64_t v65 = 184;
  }
  a1 = v125;
  objc_storeStrong((id *)(v125 + 8), *(id *)(v125 + v65));
  v66 = *(void **)(v125 + 8);
  memset(v161, 0, 24);
  *((void *)&v161[1] + 1) = LTM_ltmCurveEntryCount;
  *(void *)&v161[2] = LTM_validWidth;
  *((void *)&v161[2] + 1) = LTM_validHeight;
  [v66 replaceRegion:v161 mipmapLevel:0 slice:0 withBytes:LTM_data bytesPerRow:v131 bytesPerImage:v134];
  v67 = *(void **)(v125 + 16);
  memset(v161, 0, 24);
  *((void *)&v161[1] + 1) = *v64;
  int64x2_t v152 = vdupq_n_s64(1uLL);
  v161[2] = v152;
  [v67 replaceRegion:v161 mipmapLevel:0 slice:0 withBytes:a6 + 110617 bytesPerRow:0 bytesPerImage:0];
  v68 = *(void **)(v125 + 24);
  memset(v161, 0, 24);
  *((void *)&v161[1] + 1) = *(unsigned __int16 *)(a7 + 221748);
  v161[2] = v152;
  [v68 replaceRegion:v161 mipmapLevel:0 slice:0 withBytes:v123 bytesPerRow:0 bytesPerImage:0];
  objc_storeStrong((id *)(a1 + 32), *(id *)(a1 + 208));
  v69 = *(void **)(v125 + 32);
  int v70 = *(unsigned __int8 *)(v125 + 240);
  uint64_t v71 = v129;
  if (*(unsigned char *)(v125 + 240))
  {
    uint64_t v71 = *(void *)(v125 + 112);
    uint64_t v72 = 2 * v142;
  }
  else
  {
    uint64_t v72 = v137;
  }
  v161[0] = 0uLL;
  if (v70) {
    uint64_t v73 = 2 * v142 * LTM_validWidth;
  }
  else {
    uint64_t v73 = v140;
  }
  *(void *)&v161[1] = 0;
  *((void *)&v161[1] + 1) = v142;
  *(void *)&v161[2] = LTM_validWidth;
  *((void *)&v161[2] + 1) = LTM_validHeight;
  objc_msgSend(v69, "replaceRegion:mipmapLevel:slice:withBytes:bytesPerRow:bytesPerImage:", v161, 0, 0, v71, v72, v73, v118, v119);
  v74 = *(void **)(v125 + 40);
  memset(v161, 0, 24);
  *((void *)&v161[1] + 1) = (unsigned __int16)a8[110616];
  int64x2_t v155 = vdupq_n_s64(1uLL);
  v161[2] = v155;
  [v74 replaceRegion:v161 mipmapLevel:0 slice:0 withBytes:a8 + 110617 bytesPerRow:0 bytesPerImage:0];
  uint64_t v75 = *(void **)(v125 + 48);
  memset(v161, 0, 24);
  *((void *)&v161[1] + 1) = (unsigned __int16)a8[110874];
  v161[2] = v155;
  [v75 replaceRegion:v161 mipmapLevel:0 slice:0 withBytes:a8 + 110875 bytesPerRow:0 bytesPerImage:0];
  LTM_spatialCCMEntryCount = getLTM_spatialCCMEntryCount(a6 + 55308);
  *(unsigned char *)(v125 + 88) = LTM_spatialCCMEntryCount != 0;
  if (!LTM_spatialCCMEntryCount)
  {
    v35 = 0;
    goto LABEL_86;
  }
  if (LTM_spatialCCMEntryCount != (_WORD *)27
    || (unint64_t v77 = getLTM_validWidth(a6 + 55308), v78 = getLTM_validHeight(a6 + 55308), v141 = v77, v77 > 0x20)
    || (unint64_t v79 = v78, v78 >= 0x21))
  {
LABEL_28:
    FigDebugAssert3();
    v35 = 0;
    uint64_t v36 = 4294954516;
    goto LABEL_93;
  }
  if (v77 != [*(id *)(v125 + 72) height] || v79 != objc_msgSend(*(id *)(v125 + 72), "depth"))
  {
    [*(id *)(v125 + 72) makeAliasable];
    float32x4_t v80 = objc_opt_new();
    if (v80)
    {
      objc_msgSend(v80, "setResourceOptions:", objc_msgSend(*(id *)(v125 + 192), "resourceOptions"));
      [v80 setTextureType:7];
      [v80 setWidth:3];
      [v80 setHeight:v141];
      [v80 setDepth:v79];
      [v80 setPixelFormat:115];
      [v80 setUsage:1];
      uint64_t v81 = [*(id *)(v125 + 192) newTextureWithDescriptor:v80];
      int64x2_t v82 = *(void **)(v125 + 72);
      *(void *)(v125 + 72) = v81;

      if (*(void *)(v125 + 72))
      {

        goto LABEL_69;
      }
    }
    FigDebugAssert3();
    uint64_t v36 = FigSignalErrorAt();

LABEL_104:
    v35 = 0;
    goto LABEL_93;
  }
LABEL_69:
  int32x4_t v83 = vzip1q_s32(a2, a4);
  v166.columns[0] = (simd_float3)vzip1q_s32(v83, a3);
  v166.columns[1] = (simd_float3)vzip2q_s32(v83, vdupq_lane_s32(*(int32x2_t *)a3.i8, 1));
  v166.columns[0].i32[3] = 0;
  v166.columns[2] = (simd_float3)vzip1q_s32(vzip2q_s32(a2, a4), vdupq_laneq_s32(a3, 2));
  float32x4_t v130 = (float32x4_t)v166.columns[1];
  v166.columns[1].i32[3] = 0;
  v166.columns[2].i32[3] = 0;
  simd_float3x3 v167 = __invert_f3(v166);
  simd_float3 v135 = v167.columns[1];
  simd_float3 v138 = v167.columns[0];
  simd_float3 v132 = v167.columns[2];
  v35 = malloc_type_malloc(24 * v141 * v79, 0x1000040BDFB0063uLL);
  if (!v35)
  {
    FigDebugAssert3();
    uint64_t v36 = 4294954510;
    goto LABEL_93;
  }
  if (!v79)
  {
LABEL_84:
    a1 = v125;
    float v114 = *(void **)(v125 + 72);
    memset(v161, 0, 24);
    *((void *)&v161[1] + 1) = 3;
    *(void *)&v161[2] = v141;
    *((void *)&v161[2] + 1) = v79;
    [v114 replaceRegion:v161 mipmapLevel:0 slice:0 withBytes:v35 bytesPerRow:24 bytesPerImage:24 * v141];
    __n128 v64 = a6 + 110616;
LABEL_86:
    if (*((unsigned char *)v64 + 1812))
    {
      v115 = *(void **)(a1 + 136);
      memset(v161, 0, 24);
      *(_OWORD *)((char *)&v161[1] + 8) = xmmword_263480550;
      char v116 = 1;
      *((void *)&v161[2] + 1) = 1;
      [v115 replaceRegion:v161 mipmapLevel:0 slice:0 withBytes:a6 + 111265 bytesPerRow:0 bytesPerImage:0];
    }
    else
    {
      char v116 = 0;
    }
    *(unsigned char *)(a1 + 128) = v116;
    uint64_t v36 = 0;
    if (*(unsigned char *)(a7 + 223072))
    {
      *(unsigned char *)(a1 + 160) = 1;
      *(_OWORD *)(a1 + 144) = *(_OWORD *)(a7 + 223056);
    }
    else
    {
      *(void *)(a1 + 144) = 0;
      *(void *)(a1 + 152) = 0;
      *(unsigned char *)(a1 + 160) = 0;
    }
    goto LABEL_93;
  }
  uint64_t v84 = 0;
  int32x4_t v85 = vzip1q_s32(a2, a3);
  v85.i32[2] = a4.i32[0];
  int32x4_t v86 = vzip2q_s32(a2, a3);
  v86.i32[2] = a4.i32[2];
  simd_float3 v87 = v138;
  v87.i32[3] = 0;
  simd_float3 v139 = v87;
  simd_float3 v88 = v135;
  v88.i32[3] = 0;
  simd_float3 v136 = v88;
  simd_float3 v89 = v132;
  v89.i32[3] = 0;
  simd_float3 v133 = v89;
  unint64_t v124 = v79;
  float32x4_t v127 = (float32x4_t)v86;
  float32x4_t v128 = (float32x4_t)v85;
  while (!v141)
  {
LABEL_83:
    ++v84;
    unint64_t v79 = v124;
    if (v84 == v124) {
      goto LABEL_84;
    }
  }
  uint64_t v90 = 0;
  while (1)
  {
    *(double *)v91.i64 = getLTM_spatialCCMEntry(a6 + 55308, v90, v84, 0);
    v91.i32[3] = 0;
    v92.i32[3] = 0;
    float32x4_t v150 = v92;
    v93.i32[3] = 0;
    float32x4_t v153 = v93;
    float32x4_t v156 = v91;
    *(double *)v94.i64 = getLTM_spatialCCMEntry(a6 + 55308, v90, v84, 1);
    v94.i32[3] = 0;
    v95.i32[3] = 0;
    float32x4_t v145 = v95;
    float32x4_t v147 = v94;
    v96.i32[3] = 0;
    float32x4_t v143 = v96;
    *(double *)v97.i64 = getLTM_spatialCCMEntry(a6 + 55308, v90, v84, 2);
    uint32x4_t v100 = (uint32x4_t)vandq_s8(vandq_s8((int8x16_t)vceqq_f32(v156, v147), (int8x16_t)vceqq_f32(v150, v145)), (int8x16_t)vceqq_f32(v153, v143));
    v100.i32[3] = v100.i32[2];
    if ((vminvq_u32(v100) & 0x80000000) == 0) {
      break;
    }
    v99.i32[3] = 0;
    v98.i32[3] = 0;
    v97.i32[3] = 0;
    uint32x4_t v101 = (uint32x4_t)vandq_s8(vandq_s8((int8x16_t)vceqq_f32(v97, v147), (int8x16_t)vceqq_f32(v98, v145)), (int8x16_t)vceqq_f32(v99, v143));
    v101.i32[3] = v101.i32[2];
    if ((vminvq_u32(v101) & 0x80000000) == 0) {
      break;
    }
    unint64_t v102 = 0;
    long long v158 = 0u;
    long long v159 = 0u;
    long long v157 = 0u;
    float32x4_t v162 = v147;
    float32x4_t v163 = v145;
    float32x4_t v164 = v143;
    memset(v161, 0, 48);
    do
    {
      v161[v102 / 4] = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v128, COERCE_FLOAT(*(_OWORD *)((char *)&v162 + v102 * 4))), v130, *(float32x2_t *)&v162.f32[v102], 1), v127, *(float32x4_t *)((char *)&v162 + v102 * 4), 2);
      v102 += 4;
    }
    while (v102 != 12);
    unint64_t v103 = 0;
    float32x4_t v104 = (float32x4_t)v161[0];
    float32x4_t v105 = (float32x4_t)v161[1];
    float32x4_t v106 = (float32x4_t)v161[2];
    float32x4_t v162 = (float32x4_t)v139;
    float32x4_t v163 = (float32x4_t)v136;
    float32x4_t v164 = (float32x4_t)v133;
    memset(v161, 0, 48);
    do
    {
      v161[v103 / 4] = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v104, COERCE_FLOAT(*(_OWORD *)((char *)&v162 + v103 * 4))), v105, *(float32x2_t *)&v162.f32[v103], 1), v106, *(float32x4_t *)((char *)&v162 + v103 * 4), 2);
      v103 += 4;
    }
    while (v103 != 12);
    uint64_t v107 = 0;
    DWORD2(v157) = DWORD2(v161[0]);
    DWORD2(v158) = DWORD2(v161[1]);
    *(void *)&long long v157 = *(void *)&v161[0];
    *(void *)&long long v158 = *(void *)&v161[1];
    DWORD2(v159) = DWORD2(v161[2]);
    *(void *)&long long v159 = *(void *)&v161[2];
    do
    {
      unsigned int v108 = v107 / 3u;
      _S0 = *(_DWORD *)((unint64_t)(&v157 + v108) & 0xFFFFFFFFFFFFFFF3 | (4
                                                                                 * ((v107 % 3u) & 3)));
      __asm { FCVT            H0, S0 }
      v35[4 * v108 + ((12 * (v90 + v84 * v141)) | (v107++ % 3u))] = _S0;
    }
    while (v107 != 9);
    if (++v90 == v141) {
      goto LABEL_83;
    }
  }
  FigDebugAssert3();
  uint64_t v36 = 4294954516;
  a1 = v125;
LABEL_93:
  free(v123);
  free(v35);
  *(unsigned char *)(a1 + 240) = 0;
  return v36;
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
  objc_storeStrong((id *)&self->_ltcBinsBackgroundTexD4x, 0);
  objc_storeStrong((id *)&self->_ltcBinsTexD4x, 0);
  objc_storeStrong((id *)&self->_internalHeap, 0);
  objc_storeStrong((id *)&self->_ltcBinsTexD3x, 0);
  objc_storeStrong((id *)&self->_highlightCompression, 0);
  objc_storeStrong((id *)&self->_bypassGTCTex, 0);
  objc_storeStrong((id *)&self->_spatialCCMTex, 0);
  objc_storeStrong((id *)&self->_blackWhiteStrengthCenter, 0);
  objc_storeStrong((id *)&self->_lumaHistogram, 0);
  objc_storeStrong((id *)&self->_ltcGTCFinalBackgroundTex, 0);
  objc_storeStrong((id *)&self->_ltcGTCRatioBackgroundTex, 0);
  objc_storeStrong((id *)&self->_ltcBinsBackgroundTex, 0);
  objc_storeStrong((id *)&self->_ltcGTCFinalTex, 0);
  objc_storeStrong((id *)&self->_ltcGTCRatioTex, 0);

  objc_storeStrong((id *)&self->_ltcBinsTex, 0);
}

@end