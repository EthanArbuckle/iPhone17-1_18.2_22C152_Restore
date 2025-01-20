@interface RawNightModePostFusionInference
- (BOOL)isFirstBatch;
- (FigMetalContext)metalContext;
- (MTLTexture)ggMaxFusionWeights;
- (MTLTexture)noiseMapTexture;
- (NSDictionary)rawNightModeTuningParameters;
- (NSMutableArray)accumPyrTexArray;
- (NSMutableArray)clippingMaskPyrTexArray;
- (NSMutableArray)framesPyrTileTexArray;
- (NSMutableArray)scratchPyramidTexArray;
- (RawNightModeFusionInferencePyramid)pyramid;
- (RawNightModeFusionMetalStage)fusionMetalStage;
- (RawNightModeFusionParams)fusionParams;
- (RawNightModePostFusionInference)init;
- (float)greenGhostThreshold;
- (int)encodeWithTileBounds:(RawNightModeInferenceTileBounds *)a3 inputTiles:(id)a4 outputTiles:(id)a5;
- (int)preWarm;
- (int)setContext:(id)a3;
- (unint64_t)nonReferenceFramesCount;
- (void)setAccumPyrTexArray:(id)a3;
- (void)setClippingMaskPyrTexArray:(id)a3;
- (void)setFramesPyrTileTexArray:(id)a3;
- (void)setFusionMetalStage:(id)a3;
- (void)setFusionParams:(RawNightModeFusionParams *)a3;
- (void)setGgMaxFusionWeights:(id)a3;
- (void)setGreenGhostThreshold:(float)a3;
- (void)setIsFirstBatch:(BOOL)a3;
- (void)setNoiseMapTexture:(id)a3;
- (void)setNonReferenceFramesCount:(unint64_t)a3;
- (void)setPyramid:(id)a3;
- (void)setRawNightModeTuningParameters:(id)a3;
- (void)setScratchPyramidTexArray:(id)a3;
@end

@implementation RawNightModePostFusionInference

- (RawNightModePostFusionInference)init
{
  v6.receiver = self;
  v6.super_class = (Class)RawNightModePostFusionInference;
  v2 = [(RawNightModePostFusionInference *)&v6 init];
  v3 = v2;
  if (v2) {
    v4 = v2;
  }
  else {
    FigDebugAssert3();
  }

  return v3;
}

- (int)setContext:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    objc_storeStrong((id *)&self->_metalContext, a3);
    int v6 = 0;
  }
  else
  {
    FigDebugAssert3();
    int v6 = 2;
  }

  return v6;
}

- (int)preWarm
{
  return 0;
}

- (int)encodeWithTileBounds:(RawNightModeInferenceTileBounds *)a3 inputTiles:(id)a4 outputTiles:(id)a5
{
  uint64_t v150 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a5;
  v10 = v9;
  int8x8_t v11 = 0;
  memset(v149, 0, 128);
  memset(v148, 0, sizeof(v148));
  memset(v147, 0, sizeof(v147));
  memset(v146, 0, sizeof(v146));
  memset(v145, 0, sizeof(v145));
  memset(v144, 0, sizeof(v144));
  if (self->_metalContext)
  {
    int32x2_t v12 = *(int32x2_t *)&a3->var3;
    unsigned int var9_low = LOWORD(a3->var9);
    int var5 = a3->var5;
    v11.i16[2] = a3->var6;
    int8x8_t v118 = v11;
    if ([v9 count] == 4)
    {
      if (self->_rawNightModeTuningParameters)
      {
        int8x8_t v116 = (int8x8_t)vdup_n_s32(var9_low);
        int8x8_t v117 = (int8x8_t)vsub_s32(v12, vdup_n_s32(2 * var9_low));
        int v114 = (unsigned __int16)(var5 / v117.u16[0]);
        uint64_t v131 = (var5 / v117.u16[0]) & 1;
        v132 = a3;
        id v115 = v8;
        v15 = [v8 objectAtIndexedSubscript:0];
        v130 = [v15 texture];

        uint64_t v16 = 0;
        uint64_t v17 = 0;
        v129 = v10;
        do
        {
          v18 = [v10 objectAtIndexedSubscript:v17];
          uint64_t v19 = [v18 texture];
          v20 = (void *)v148[v17];
          v148[v17] = v19;

          v21 = [(RawNightModeFusionInferencePyramid *)self->_pyramid bandTextures];
          uint64_t v22 = [v21 objectAtIndexedSubscript:v17];
          v23 = (void *)v147[v17];
          v147[v17] = v22;

          uint64_t v24 = [(NSMutableArray *)self->_scratchPyramidTexArray objectAtIndexedSubscript:v131 | (2 * v17)];
          v25 = (void *)*((void *)v144 + v17);
          *((void *)v144 + v17) = v24;

          uint64_t v26 = 4;
          uint64_t v27 = v16;
          do
          {
            uint64_t v28 = [(NSMutableArray *)self->_framesPyrTileTexArray objectAtIndexedSubscript:v27];
            v29 = (void *)v149[v27];
            v149[v27] = v28;

            ++v27;
            --v26;
          }
          while (v26);
          if (v17)
          {
            uint64_t v30 = [(NSMutableArray *)self->_accumPyrTexArray objectAtIndexedSubscript:(v17 - 1)];
            v31 = (void *)v146[(v17 - 1)];
            v146[(v17 - 1)] = v30;
          }
          clippingMaskPyrTexArray = self->_clippingMaskPyrTexArray;
          v10 = v129;
          if (clippingMaskPyrTexArray)
          {
            uint64_t v33 = [(NSMutableArray *)clippingMaskPyrTexArray objectAtIndexedSubscript:v17];
            v34 = (void *)*((void *)v145 + v17);
            *((void *)v145 + v17) = v33;
          }
          ++v17;
          v16 += 4;
        }
        while (v17 != 4);
        if ([(RawNightModeFusionMetalStage *)self->_fusionMetalStage zeroPyramidsWithContext:self->_metalContext withFusionPyramids:v149 withAccumPyramidTile:v146])
        {
          FigDebugAssert3();
          int v86 = 2;
        }
        else
        {
          fusionMetalStage = self->_fusionMetalStage;
          v36 = [(RawNightModeFusionInferencePyramid *)self->_pyramid bandTextures];
          v37 = [v36 objectAtIndexedSubscript:1];
          HIWORD(v143) = WORD2(*(void *)&a3->var5);
          LOWORD(v143) = *(void *)&a3->var5;
          HIWORD(v142) = v116.i16[2];
          LOWORD(v142) = v116.i16[0];
          WORD1(v107) = v117.i16[2];
          LOWORD(v107) = v117.i16[0];
          HIDWORD(v109) = self->_nonReferenceFramesCount;
          LOBYTE(v109) = self->_isFirstBatch;
          LODWORD(fusionMetalStage) = -[RawNightModeFusionMetalStage updateNoiseMapWithWeightPyramidTile:withNetworkInputTileTexForRefNoise:withInputFusedBand1:noiseMapAccumulationTex:tileCoordOffset:fullCoordOffset:outputTileSize:encodeToContext:isFirstBatch:nonReferenceFrameCount:](fusionMetalStage, "updateNoiseMapWithWeightPyramidTile:withNetworkInputTileTexForRefNoise:withInputFusedBand1:noiseMapAccumulationTex:tileCoordOffset:fullCoordOffset:outputTileSize:encodeToContext:isFirstBatch:nonReferenceFrameCount:", v148, v130, v37, self->_noiseMapTexture, v142, v143, v107, self->_metalContext, v109);

          if (!fusionMetalStage)
          {
            uint64_t v38 = v131 | 6;
            int8x8_t v39 = vand_s8(v116, (int8x8_t)0xFFFF0000FFFFLL);
            unsigned __int32 v122 = v39.i32[0];
            unsigned __int32 v40 = v39.u32[1];
            int8x8_t v41 = vand_s8(v117, (int8x8_t)0xFFFF0000FFFFLL);
            unsigned __int32 v120 = v41.i32[0];
            unsigned __int32 v42 = v41.u32[1];
            uint64_t v43 = 4;
            int8x8_t v119 = vand_s8(v118, (int8x8_t)0xFFFF0000FFFFLL);
            while (1)
            {
              v44 = self->_fusionMetalStage;
              float greenGhostThreshold = self->_greenGhostThreshold;
              ggMaxFusionWeights = self->_ggMaxFusionWeights;
              v47 = [(NSMutableArray *)self->_scratchPyramidTexArray objectAtIndexedSubscript:v38];
              int8x8_t v48 = vand_s8((int8x8_t)vdup_n_s32(1 << --v43), (int8x8_t)0xFFFF0000FFFFLL);
              unsigned __int32 v49 = v48.u32[1];
              unsigned __int32 v50 = v48.i32[0];
              unsigned int v51 = v122 / v48.i32[0];
              int v52 = v40 / v48.i32[1];
              int8x8_t v53 = vand_s8(*(int8x8_t *)&v132->var5, (int8x8_t)0xFFFF0000FFFFLL);
              HIDWORD(v113) = self->_nonReferenceFramesCount;
              LOBYTE(v113) = self->_isFirstBatch;
              LODWORD(v110) = v43;
              WORD1(v112) = v119.i32[1] / v49;
              LOWORD(v112) = v119.i32[0] / v50;
              HIWORD(v111) = v42 / v49;
              WORD2(v111) = v120 / v50;
              WORD1(v111) = v53.i32[1] / v49;
              LOWORD(v111) = v53.i32[0] / v50;
              HIWORD(v110) = v52;
              WORD2(v110) = v51;
              int v54 = -[RawNightModeFusionMetalStage fuseInputFramesTile:withGGMaxFusionWeights:withGreenGhostThreshold:withInputWeightPyramidTile:withInputAccPyramid:withFramePyramidTile:withAccumPyramidTile:withClippingMaskPyrTexArray:withScratchPyrTexArray:toScratchTex:forBandIndex:tilePaddingSize:outputPyrBandOffset:outputTileSize:scratchOffset:encodeToContext:isFirstBatch:nonReferenceFrameCount:fusionParams:](v44, "fuseInputFramesTile:withGGMaxFusionWeights:withGreenGhostThreshold:withInputWeightPyramidTile:withInputAccPyramid:withFramePyramidTile:withAccumPyramidTile:withClippingMaskPyrTexArray:withScratchPyrTexArray:toScratchTex:forBandIndex:tilePaddingSize:outputPyrBandOffset:outputTileSize:scratchOffset:encodeToContext:isFirstBatch:nonReferenceFrameCount:fusionParams:", v130, ggMaxFusionWeights, v148, v147, v149, v146, COERCE_DOUBLE(__PAIR64__(v119.u32[1], LODWORD(greenGhostThreshold))), v145, v144, v47, v110, v111, v112, self->_metalContext,
                      v113,
                      &self->_fusionParams);

              if (v54) {
                break;
              }
              v38 -= 2;
              if (!v43)
              {
                int v56 = v132->var5;
                int var6 = v132->var6;
                int v57 = var6 + v117.u16[2];
                int var8 = v132->var8;
                if (v56 + v117.u16[0] < v132->var7 || v57 < var8)
                {
                  int v86 = 0;
                  if (!v114 || v57 < var8) {
                    goto LABEL_34;
                  }
                  int v87 = v131 | 6;
                  uint64_t v88 = 3;
                  int8x8_t v89 = vand_s8((int8x8_t)__PAIR64__(var6, v56 - v117.u16[0]), (int8x8_t)0xFFFF0000FFFFLL);
                  int8x8_t v90 = vand_s8(v116, (int8x8_t)0xFFFF0000FFFFLL);
                  unsigned __int32 v128 = v90.i32[0];
                  unsigned __int32 v91 = v90.u32[1];
                  int8x8_t v92 = vand_s8(v117, (int8x8_t)0xFFFF0000FFFFLL);
                  unsigned __int32 v125 = v92.i32[0];
                  unsigned __int32 v93 = v92.u32[1];
                  while (1)
                  {
                    v94 = self->_fusionMetalStage;
                    v95 = [(RawNightModeFusionInferencePyramid *)self->_pyramid bandTextures];
                    v96 = [v95 objectAtIndexedSubscript:v88];
                    v97 = [(NSMutableArray *)self->_scratchPyramidTexArray objectAtIndexedSubscript:v87 ^ 1u];
                    int8x8_t v98 = vand_s8((int8x8_t)vdup_n_s32(1 << v88), (int8x8_t)0xFFFF0000FFFFLL);
                    HIWORD(v135) = v89.i32[1] / (unsigned __int32)v98.i32[1];
                    LOWORD(v135) = v89.i32[0] / (unsigned __int32)v98.i32[0];
                    HIWORD(v134) = v91 / v98.i32[1];
                    LOWORD(v134) = v128 / v98.i32[0];
                    HIWORD(v133) = v93 / v98.i32[1];
                    LOWORD(v133) = v125 / v98.i32[0];
                    HIDWORD(v108) = v88;
                    LOBYTE(v108) = self->_isFirstBatch;
                    int v99 = -[RawNightModeFusionMetalStage writeOutToAccumulator:fromScratchAccumulator:outputPyrBandOffset:scratchOffset:tilePaddingSize:outputTileSize:encodeToContext:isFirstBatch:bandIndex:](v94, "writeOutToAccumulator:fromScratchAccumulator:outputPyrBandOffset:scratchOffset:tilePaddingSize:outputTileSize:encodeToContext:isFirstBatch:bandIndex:", v96, v97, v135, 0, v134, v133, self->_metalContext, v108);

                    if (v99) {
                      break;
                    }
                    --v88;
                    v87 -= 2;
                    if (v88 == -1)
                    {
LABEL_33:
                      int v86 = 0;
                      goto LABEL_34;
                    }
                  }
                }
                else
                {
                  int v59 = ((_BYTE)v114 - 1) & 1;
                  if (v114 < 1) {
                    int v59 = -v59;
                  }
                  uint64_t v60 = v59 + 6;
                  uint64_t v61 = 3;
                  int8x8_t v62 = vand_s8((int8x8_t)__PAIR64__(var6, v56 - v117.u16[0]), (int8x8_t)0xFFFF0000FFFFLL);
                  unsigned __int32 v126 = v62.i32[0];
                  unsigned __int32 v63 = v62.u32[1];
                  int8x8_t v64 = vand_s8(v116, (int8x8_t)0xFFFF0000FFFFLL);
                  unsigned __int32 v123 = v64.i32[0];
                  unsigned __int32 v65 = v64.u32[1];
                  int8x8_t v66 = vand_s8(v117, (int8x8_t)0xFFFF0000FFFFLL);
                  unsigned __int32 v121 = v66.i32[0];
                  unsigned __int32 v67 = v66.u32[1];
                  while (1)
                  {
                    v68 = self->_fusionMetalStage;
                    v69 = [(RawNightModeFusionInferencePyramid *)self->_pyramid bandTextures];
                    v70 = [v69 objectAtIndexedSubscript:v61];
                    v71 = [(NSMutableArray *)self->_scratchPyramidTexArray objectAtIndexedSubscript:v60];
                    int8x8_t v72 = vand_s8((int8x8_t)vdup_n_s32(1 << v61), (int8x8_t)0xFFFF0000FFFFLL);
                    HIWORD(v141) = v63 / v72.i32[1];
                    LOWORD(v141) = v126 / v72.i32[0];
                    HIWORD(v140) = v65 / v72.i32[1];
                    LOWORD(v140) = v123 / v72.i32[0];
                    HIWORD(v139) = v67 / v72.i32[1];
                    LOWORD(v139) = v121 / v72.i32[0];
                    HIDWORD(v108) = v61;
                    LOBYTE(v108) = self->_isFirstBatch;
                    LODWORD(v68) = -[RawNightModeFusionMetalStage writeOutToAccumulator:fromScratchAccumulator:outputPyrBandOffset:scratchOffset:tilePaddingSize:outputTileSize:encodeToContext:isFirstBatch:bandIndex:](v68, "writeOutToAccumulator:fromScratchAccumulator:outputPyrBandOffset:scratchOffset:tilePaddingSize:outputTileSize:encodeToContext:isFirstBatch:bandIndex:", v70, v71, v141, 0, v140, v139, self->_metalContext, v108);

                    if (v68) {
                      break;
                    }
                    --v61;
                    v60 -= 2;
                    if (v61 == -1)
                    {
                      uint64_t v73 = v131 | 6;
                      uint64_t v74 = 3;
                      int8x8_t v75 = vand_s8(*(int8x8_t *)&v132->var5, (int8x8_t)0xFFFF0000FFFFLL);
                      int8x8_t v76 = vand_s8(v116, (int8x8_t)0xFFFF0000FFFFLL);
                      unsigned __int32 v127 = v76.i32[0];
                      unsigned __int32 v77 = v76.u32[1];
                      int8x8_t v78 = vand_s8(v117, (int8x8_t)0xFFFF0000FFFFLL);
                      unsigned __int32 v124 = v78.i32[0];
                      unsigned __int32 v79 = v78.u32[1];
                      while (1)
                      {
                        v80 = self->_fusionMetalStage;
                        v81 = [(RawNightModeFusionInferencePyramid *)self->_pyramid bandTextures];
                        v82 = [v81 objectAtIndexedSubscript:v74];
                        v83 = [(NSMutableArray *)self->_scratchPyramidTexArray objectAtIndexedSubscript:v73];
                        int8x8_t v84 = vand_s8((int8x8_t)vdup_n_s32(1 << v74), (int8x8_t)0xFFFF0000FFFFLL);
                        HIWORD(v138) = v75.i32[1] / (unsigned __int32)v84.i32[1];
                        LOWORD(v138) = v75.i32[0] / (unsigned __int32)v84.i32[0];
                        HIWORD(v137) = v77 / v84.i32[1];
                        LOWORD(v137) = v127 / v84.i32[0];
                        HIWORD(v136) = v79 / v84.i32[1];
                        LOWORD(v136) = v124 / v84.i32[0];
                        HIDWORD(v108) = v74;
                        LOBYTE(v108) = self->_isFirstBatch;
                        int v85 = -[RawNightModeFusionMetalStage writeOutToAccumulator:fromScratchAccumulator:outputPyrBandOffset:scratchOffset:tilePaddingSize:outputTileSize:encodeToContext:isFirstBatch:bandIndex:](v80, "writeOutToAccumulator:fromScratchAccumulator:outputPyrBandOffset:scratchOffset:tilePaddingSize:outputTileSize:encodeToContext:isFirstBatch:bandIndex:", v82, v83, v138, 0, v137, v136, self->_metalContext, v108);

                        if (v85) {
                          goto LABEL_49;
                        }
                        --v74;
                        v73 -= 2;
                        if (v74 == -1) {
                          goto LABEL_33;
                        }
                      }
                    }
                  }
                }
                break;
              }
            }
          }
LABEL_49:
          FigDebugAssert3();
          int v86 = 2;
LABEL_34:
          id v8 = v115;
          v10 = v129;
        }
      }
      else
      {
        FigDebugAssert3();
        int v86 = 8;
      }
    }
    else
    {
      FigDebugAssert3();
      int v86 = 0;
    }
  }
  else
  {
    FigDebugAssert3();
    int v86 = 2;
  }
  for (uint64_t i = 24; i != -8; i -= 8)

  for (uint64_t j = 24; j != -8; j -= 8)
  for (uint64_t k = 2; k != -1; --k)

  for (uint64_t m = 3; m != -1; --m)
  for (uint64_t n = 3; n != -1; --n)

  for (iuint64_t i = 15; ii != -1; --ii)
  return v86;
}

- (MTLTexture)noiseMapTexture
{
  return self->_noiseMapTexture;
}

- (void)setNoiseMapTexture:(id)a3
{
}

- (RawNightModeFusionInferencePyramid)pyramid
{
  return self->_pyramid;
}

- (void)setPyramid:(id)a3
{
}

- (RawNightModeFusionMetalStage)fusionMetalStage
{
  return self->_fusionMetalStage;
}

- (void)setFusionMetalStage:(id)a3
{
}

- (BOOL)isFirstBatch
{
  return self->_isFirstBatch;
}

- (void)setIsFirstBatch:(BOOL)a3
{
  self->_isFirstBatch = a3;
}

- (NSMutableArray)framesPyrTileTexArray
{
  return self->_framesPyrTileTexArray;
}

- (void)setFramesPyrTileTexArray:(id)a3
{
}

- (NSMutableArray)accumPyrTexArray
{
  return self->_accumPyrTexArray;
}

- (void)setAccumPyrTexArray:(id)a3
{
}

- (NSMutableArray)clippingMaskPyrTexArray
{
  return self->_clippingMaskPyrTexArray;
}

- (void)setClippingMaskPyrTexArray:(id)a3
{
}

- (FigMetalContext)metalContext
{
  return self->_metalContext;
}

- (NSDictionary)rawNightModeTuningParameters
{
  return self->_rawNightModeTuningParameters;
}

- (void)setRawNightModeTuningParameters:(id)a3
{
}

- (MTLTexture)ggMaxFusionWeights
{
  return self->_ggMaxFusionWeights;
}

- (void)setGgMaxFusionWeights:(id)a3
{
}

- (NSMutableArray)scratchPyramidTexArray
{
  return self->_scratchPyramidTexArray;
}

- (void)setScratchPyramidTexArray:(id)a3
{
}

- (unint64_t)nonReferenceFramesCount
{
  return self->_nonReferenceFramesCount;
}

- (void)setNonReferenceFramesCount:(unint64_t)a3
{
  self->_nonReferenceFramesCount = a3;
}

- (RawNightModeFusionParams)fusionParams
{
  *(_OWORD *)&retstr->band0FusionWeightsModulationStrength = *(_OWORD *)&self[3].deghostingThresholdUpperBound;
  *(_OWORD *)&retstr->strongEdgeFusionWeightsModulationStrength = *(_OWORD *)&self[4].strongEdgeFusionWeightsModulationEnabled;
  return self;
}

- (void)setFusionParams:(RawNightModeFusionParams *)a3
{
  long long v3 = *(_OWORD *)&a3->band0FusionWeightsModulationStrength;
  *(_OWORD *)&self->_fusionParams.strongEdgeFusionWeightsModulationStrength = *(_OWORD *)&a3->strongEdgeFusionWeightsModulationStrength;
  *(_OWORD *)&self->_fusionParams.band0FusionWeightsModulationStrength = v3;
}

- (float)greenGhostThreshold
{
  return self->_greenGhostThreshold;
}

- (void)setGreenGhostThreshold:(float)a3
{
  self->_float greenGhostThreshold = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scratchPyramidTexArray, 0);
  objc_storeStrong((id *)&self->_ggMaxFusionWeights, 0);
  objc_storeStrong((id *)&self->_rawNightModeTuningParameters, 0);
  objc_storeStrong((id *)&self->_metalContext, 0);
  objc_storeStrong((id *)&self->_clippingMaskPyrTexArray, 0);
  objc_storeStrong((id *)&self->_accumPyrTexArray, 0);
  objc_storeStrong((id *)&self->_framesPyrTileTexArray, 0);
  objc_storeStrong((id *)&self->_fusionMetalStage, 0);
  objc_storeStrong((id *)&self->_pyramid, 0);

  objc_storeStrong((id *)&self->_noiseMapTexture, 0);
}

@end