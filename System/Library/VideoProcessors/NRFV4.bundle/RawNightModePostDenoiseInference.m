@interface RawNightModePostDenoiseInference
- (FigMetalContext)metalContext;
- (MTLBuffer)dnrBiasBuffer;
- (MTLTexture)inputRGBTexture;
- (MTLTexture)lscGainsTexture;
- (MTLTexture)noiseMapTexture;
- (MTLTexture)opcTexture;
- (MTLTexture)outputChromaTex;
- (MTLTexture)outputClippingMapTex;
- (MTLTexture)outputDenoisedBand3LumaTexture;
- (MTLTexture)outputLocalDNRBiasTexture;
- (MTLTexture)outputLumaTex;
- (NSMutableArray)addbackClippingPyrTextures;
- (NSMutableArray)bodyMaskPyrTextures;
- (NSMutableArray)denoisedLumaPyrTextures;
- (NSMutableArray)localDNRBiasPyrTextures;
- (NSMutableArray)lumaWithAddbackPyrTextures;
- (NSMutableArray)noisyLumaPyrTextures;
- (NSMutableArray)skinMaskPyrTextures;
- (NSMutableArray)skyMaskPyrTextures;
- (NSMutableArray)snrMapTextures;
- (RawNightModeDenoiseMetalStage)denoiseMetalStage;
- (RawNightModePostDenoiseInference)init;
- (RawNightModeSemanticMasks)semanticMasks;
- (int)encodeWithTileBounds:(RawNightModeInferenceTileBounds *)a3 inputTiles:(id)a4 outputTiles:(id)a5;
- (int)preWarm;
- (int)setContext:(id)a3;
- (void)setAddbackClippingPyrTextures:(id)a3;
- (void)setBodyMaskPyrTextures:(id)a3;
- (void)setDenoiseMetalStage:(id)a3;
- (void)setDenoisedLumaPyrTextures:(id)a3;
- (void)setDnrBiasBuffer:(id)a3;
- (void)setInputRGBTexture:(id)a3;
- (void)setLocalDNRBiasPyrTextures:(id)a3;
- (void)setLscGainsTexture:(id)a3;
- (void)setLumaWithAddbackPyrTextures:(id)a3;
- (void)setNoiseMapTexture:(id)a3;
- (void)setNoisyLumaPyrTextures:(id)a3;
- (void)setOpcTexture:(id)a3;
- (void)setOutputChromaTex:(id)a3;
- (void)setOutputClippingMapTex:(id)a3;
- (void)setOutputDenoisedBand3LumaTexture:(id)a3;
- (void)setOutputLocalDNRBiasTexture:(id)a3;
- (void)setOutputLumaTex:(id)a3;
- (void)setSemanticMasks:(id)a3;
- (void)setSkinMaskPyrTextures:(id)a3;
- (void)setSkyMaskPyrTextures:(id)a3;
- (void)setSnrMapTextures:(id)a3;
@end

@implementation RawNightModePostDenoiseInference

- (RawNightModePostDenoiseInference)init
{
  v6.receiver = self;
  v6.super_class = (Class)RawNightModePostDenoiseInference;
  v2 = [(RawNightModePostDenoiseInference *)&v6 init];
  v3 = v2;
  if (v2) {
    v4 = v2;
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
  uint64_t v81 = *MEMORY[0x263EF8340];
  memset(v80, 0, sizeof(v80));
  memset(v79, 0, sizeof(v79));
  memset(v78, 0, sizeof(v78));
  memset(v77, 0, sizeof(v77));
  memset(v76, 0, sizeof(v76));
  memset(v75, 0, sizeof(v75));
  memset(v74, 0, sizeof(v74));
  memset(v73, 0, sizeof(v73));
  memset(v72, 0, sizeof(v72));
  int v6 = objc_msgSend(a5, "objectAtIndexedSubscript:", 0, a4);
  v7 = [v6 texture];

  if (!v7
    || (metalContext = self->_metalContext) == 0
    || ([(FigMetalContext *)metalContext allocator],
        v9 = objc_claimAutoreleasedReturnValue(),
        v9,
        !v9))
  {
    int v54 = 4;
    goto LABEL_39;
  }
  if ([(NSMutableArray *)self->_denoisedLumaPyrTextures count] != 4
    || [(NSMutableArray *)self->_noisyLumaPyrTextures count] != 4
    || [(NSMutableArray *)self->_lumaWithAddbackPyrTextures count] != 3
    || [(NSMutableArray *)self->_snrMapTextures count] != 4
    || (bodyMaskPyrTextures = self->_bodyMaskPyrTextures) != 0
    && [(NSMutableArray *)bodyMaskPyrTextures count] != 4
    || (skyMaskPyrTextures = self->_skyMaskPyrTextures) != 0
    && [(NSMutableArray *)skyMaskPyrTextures count] != 4)
  {
    int v54 = 7;
    goto LABEL_39;
  }
  v71 = v7;
  if ([(NSMutableArray *)self->_denoisedLumaPyrTextures count])
  {
    uint64_t v12 = 0;
    do
    {
      v13 = [(NSMutableArray *)self->_denoisedLumaPyrTextures objectAtIndexedSubscript:v12];

      if (!v13) {
        goto LABEL_58;
      }
      uint64_t v14 = [(NSMutableArray *)self->_denoisedLumaPyrTextures objectAtIndexedSubscript:v12];
      v15 = (void *)*((void *)v80 + v12);
      *((void *)v80 + v12) = v14;

      v16 = [(NSMutableArray *)self->_noisyLumaPyrTextures objectAtIndexedSubscript:v12];

      if (!v16) {
        goto LABEL_58;
      }
      uint64_t v17 = [(NSMutableArray *)self->_noisyLumaPyrTextures objectAtIndexedSubscript:v12];
      v18 = (void *)*((void *)v79 + v12);
      *((void *)v79 + v12) = v17;

      v19 = [(NSMutableArray *)self->_snrMapTextures objectAtIndexedSubscript:v12];

      if (!v19) {
        goto LABEL_58;
      }
      uint64_t v20 = [(NSMutableArray *)self->_snrMapTextures objectAtIndexedSubscript:v12];
      v21 = (void *)*((void *)v77 + v12);
      *((void *)v77 + v12) = v20;

      v22 = self->_bodyMaskPyrTextures;
      if (v22)
      {
        v23 = [(NSMutableArray *)v22 objectAtIndexedSubscript:v12];

        if (!v23) {
          goto LABEL_58;
        }
        uint64_t v24 = [(NSMutableArray *)self->_bodyMaskPyrTextures objectAtIndexedSubscript:v12];
        v25 = (void *)*((void *)v76 + v12);
        *((void *)v76 + v12) = v24;
      }
      skinMaskPyrTextures = self->_skinMaskPyrTextures;
      if (skinMaskPyrTextures)
      {
        v27 = [(NSMutableArray *)skinMaskPyrTextures objectAtIndexedSubscript:v12];

        if (!v27) {
          goto LABEL_58;
        }
        uint64_t v28 = [(NSMutableArray *)self->_skinMaskPyrTextures objectAtIndexedSubscript:v12];
        v29 = (void *)*((void *)v75 + v12);
        *((void *)v75 + v12) = v28;
      }
      v30 = self->_skyMaskPyrTextures;
      if (v30)
      {
        v31 = [(NSMutableArray *)v30 objectAtIndexedSubscript:v12];

        if (!v31) {
          goto LABEL_58;
        }
        uint64_t v32 = [(NSMutableArray *)self->_skyMaskPyrTextures objectAtIndexedSubscript:v12];
        v33 = (void *)*((void *)v74 + v12);
        *((void *)v74 + v12) = v32;
      }
      addbackClippingPyrTextures = self->_addbackClippingPyrTextures;
      if (addbackClippingPyrTextures)
      {
        v35 = [(NSMutableArray *)addbackClippingPyrTextures objectAtIndexedSubscript:v12];

        if (!v35) {
          goto LABEL_58;
        }
        uint64_t v36 = [(NSMutableArray *)self->_addbackClippingPyrTextures objectAtIndexedSubscript:v12];
        v37 = (void *)*((void *)v73 + v12);
        *((void *)v73 + v12) = v36;
      }
      localDNRBiasPyrTextures = self->_localDNRBiasPyrTextures;
      if (localDNRBiasPyrTextures)
      {
        v39 = [(NSMutableArray *)localDNRBiasPyrTextures objectAtIndexedSubscript:v12];

        if (!v39) {
          goto LABEL_58;
        }
        uint64_t v40 = [(NSMutableArray *)self->_localDNRBiasPyrTextures objectAtIndexedSubscript:v12];
        v41 = (void *)*((void *)v72 + v12);
        *((void *)v72 + v12) = v40;
      }
    }
    while ([(NSMutableArray *)self->_denoisedLumaPyrTextures count] > (unint64_t)++v12);
  }
  if ([(NSMutableArray *)self->_lumaWithAddbackPyrTextures count])
  {
    uint64_t v42 = 0;
    while (1)
    {
      v43 = [(NSMutableArray *)self->_lumaWithAddbackPyrTextures objectAtIndexedSubscript:v42];

      if (!v43) {
        break;
      }
      uint64_t v44 = [(NSMutableArray *)self->_lumaWithAddbackPyrTextures objectAtIndexedSubscript:v42];
      v45 = (void *)v78[v42];
      v78[v42] = v44;

      if ([(NSMutableArray *)self->_lumaWithAddbackPyrTextures count] <= (unint64_t)++v42) {
        goto LABEL_37;
      }
    }
LABEL_58:
    int v54 = 8;
    goto LABEL_39;
  }
LABEL_37:
  int var9_low = LOWORD(a3->var9);
  int32x2_t v68 = vsub_s32(*(int32x2_t *)&a3->var3, vdup_n_s32(2 * var9_low));
  noiseMapTexture = self->_noiseMapTexture;
  denoiseMetalStage = self->_denoiseMetalStage;
  inputRGBTexture = self->_inputRGBTexture;
  lscGainsTexture = self->_lscGainsTexture;
  v50 = [(RawNightModeSemanticMasks *)self->_semanticMasks skyMaskTexture];
  v51 = [(RawNightModeSemanticMasks *)self->_semanticMasks personMaskTexture];
  v52 = [(RawNightModeSemanticMasks *)self->_semanticMasks skinMaskTexture];
  v53 = [(RawNightModeSemanticMasks *)self->_semanticMasks hairMaskTexture];
  WORD1(v67) = v68.i16[2];
  LOWORD(v67) = v68.i16[0];
  HIWORD(v66) = WORD2(*(void *)&a3->var5);
  WORD2(v66) = *(void *)&a3->var5;
  WORD1(v66) = var9_low;
  LOWORD(v66) = var9_low;
  HIDWORD(v67) = a3->var0;
  v65 = inputRGBTexture;
  v7 = v71;
  int v54 = -[RawNightModeDenoiseMetalStage writeDenoisedRgbTile:withDenoisedLumaPyrBands:withNoisyLumaPyrBands:withLumaAddbackPyrBands:withSnrMapPyrBands:withSkyMaskPyrBands:withSkinMaskPyrBands:withBodyMaskPyrBands:withAddbackClippingPyrBands:withLocalDNRBiasPyrBands:withNoisyRgbImage:withNoiseMap:withLSCGainsMap:withSkyMask:withPersonMask:withSkinMask:withHairMask:withOPCTexture:withDnrBiasBuffer:toOutputLuma:toOutputChroma:toOutputClippingMap:toOutputBand3DenoisedLumaMap:toOutputLocalBiasMap:tileCoordOffset:fullCoordOffset:outputTileSize:tileIndex:encodeToContext:](denoiseMetalStage, "writeDenoisedRgbTile:withDenoisedLumaPyrBands:withNoisyLumaPyrBands:withLumaAddbackPyrBands:withSnrMapPyrBands:withSkyMaskPyrBands:withSkinMaskPyrBands:withBodyMaskPyrBands:withAddbackClippingPyrBands:withLocalDNRBiasPyrBands:withNoisyRgbImage:withNoiseMap:withLSCGainsMap:withSkyMask:withPersonMask:withSkinMask:withHairMask:withOPCTexture:withDnrBiasBuffer:toOutputLuma:toOutputChroma:toOutputClippingMap:toOutputBand3DenoisedLumaMap:toOutputLocalBiasMap:tileCoordOffset:fullCoordOffset:outputTileSize:tileIndex:encodeToContext:", v71, v80, v79, v78, v77, v74, v75, v76, v73, v72, v65, noiseMapTexture, lscGainsTexture,
          v50,
          v51,
          v52,
          v53,
          self->_opcTexture,
          self->_dnrBiasBuffer,
          self->_outputLumaTex,
          self->_outputChromaTex,
          self->_outputClippingMapTex,
          self->_outputDenoisedBand3LumaTexture,
          self->_outputLocalDNRBiasTexture,
          v66,
          v67,
          self->_metalContext);

  if (v54) {
    int v54 = 2;
  }
LABEL_39:

  for (uint64_t i = 24; i != -8; i -= 8)
  for (uint64_t j = 24; j != -8; j -= 8)

  for (uint64_t k = 24; k != -8; k -= 8)
  for (uint64_t m = 24; m != -8; m -= 8)

  for (uint64_t n = 24; n != -8; n -= 8)
  for (iuint64_t i = 24; ii != -8; ii -= 8)

  for (juint64_t j = 2; jj != -1; --jj)
  for (kuint64_t k = 24; kk != -8; kk -= 8)

  for (muint64_t m = 24; mm != -8; mm -= 8)
  return v54;
}

- (MTLTexture)noiseMapTexture
{
  return self->_noiseMapTexture;
}

- (void)setNoiseMapTexture:(id)a3
{
}

- (RawNightModeDenoiseMetalStage)denoiseMetalStage
{
  return self->_denoiseMetalStage;
}

- (void)setDenoiseMetalStage:(id)a3
{
}

- (FigMetalContext)metalContext
{
  return self->_metalContext;
}

- (MTLTexture)inputRGBTexture
{
  return self->_inputRGBTexture;
}

- (void)setInputRGBTexture:(id)a3
{
}

- (MTLTexture)lscGainsTexture
{
  return self->_lscGainsTexture;
}

- (void)setLscGainsTexture:(id)a3
{
}

- (MTLBuffer)dnrBiasBuffer
{
  return self->_dnrBiasBuffer;
}

- (void)setDnrBiasBuffer:(id)a3
{
}

- (MTLTexture)outputDenoisedBand3LumaTexture
{
  return self->_outputDenoisedBand3LumaTexture;
}

- (void)setOutputDenoisedBand3LumaTexture:(id)a3
{
}

- (MTLTexture)outputLocalDNRBiasTexture
{
  return self->_outputLocalDNRBiasTexture;
}

- (void)setOutputLocalDNRBiasTexture:(id)a3
{
}

- (MTLTexture)opcTexture
{
  return self->_opcTexture;
}

- (void)setOpcTexture:(id)a3
{
}

- (RawNightModeSemanticMasks)semanticMasks
{
  return self->_semanticMasks;
}

- (void)setSemanticMasks:(id)a3
{
}

- (NSMutableArray)denoisedLumaPyrTextures
{
  return self->_denoisedLumaPyrTextures;
}

- (void)setDenoisedLumaPyrTextures:(id)a3
{
}

- (NSMutableArray)noisyLumaPyrTextures
{
  return self->_noisyLumaPyrTextures;
}

- (void)setNoisyLumaPyrTextures:(id)a3
{
}

- (NSMutableArray)lumaWithAddbackPyrTextures
{
  return self->_lumaWithAddbackPyrTextures;
}

- (void)setLumaWithAddbackPyrTextures:(id)a3
{
}

- (NSMutableArray)snrMapTextures
{
  return self->_snrMapTextures;
}

- (void)setSnrMapTextures:(id)a3
{
}

- (NSMutableArray)bodyMaskPyrTextures
{
  return self->_bodyMaskPyrTextures;
}

- (void)setBodyMaskPyrTextures:(id)a3
{
}

- (NSMutableArray)skinMaskPyrTextures
{
  return self->_skinMaskPyrTextures;
}

- (void)setSkinMaskPyrTextures:(id)a3
{
}

- (NSMutableArray)skyMaskPyrTextures
{
  return self->_skyMaskPyrTextures;
}

- (void)setSkyMaskPyrTextures:(id)a3
{
}

- (NSMutableArray)addbackClippingPyrTextures
{
  return self->_addbackClippingPyrTextures;
}

- (void)setAddbackClippingPyrTextures:(id)a3
{
}

- (NSMutableArray)localDNRBiasPyrTextures
{
  return self->_localDNRBiasPyrTextures;
}

- (void)setLocalDNRBiasPyrTextures:(id)a3
{
}

- (MTLTexture)outputLumaTex
{
  return self->_outputLumaTex;
}

- (void)setOutputLumaTex:(id)a3
{
}

- (MTLTexture)outputChromaTex
{
  return self->_outputChromaTex;
}

- (void)setOutputChromaTex:(id)a3
{
}

- (MTLTexture)outputClippingMapTex
{
  return self->_outputClippingMapTex;
}

- (void)setOutputClippingMapTex:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputClippingMapTex, 0);
  objc_storeStrong((id *)&self->_outputChromaTex, 0);
  objc_storeStrong((id *)&self->_outputLumaTex, 0);
  objc_storeStrong((id *)&self->_localDNRBiasPyrTextures, 0);
  objc_storeStrong((id *)&self->_addbackClippingPyrTextures, 0);
  objc_storeStrong((id *)&self->_skyMaskPyrTextures, 0);
  objc_storeStrong((id *)&self->_skinMaskPyrTextures, 0);
  objc_storeStrong((id *)&self->_bodyMaskPyrTextures, 0);
  objc_storeStrong((id *)&self->_snrMapTextures, 0);
  objc_storeStrong((id *)&self->_lumaWithAddbackPyrTextures, 0);
  objc_storeStrong((id *)&self->_noisyLumaPyrTextures, 0);
  objc_storeStrong((id *)&self->_denoisedLumaPyrTextures, 0);
  objc_storeStrong((id *)&self->_semanticMasks, 0);
  objc_storeStrong((id *)&self->_opcTexture, 0);
  objc_storeStrong((id *)&self->_outputLocalDNRBiasTexture, 0);
  objc_storeStrong((id *)&self->_outputDenoisedBand3LumaTexture, 0);
  objc_storeStrong((id *)&self->_dnrBiasBuffer, 0);
  objc_storeStrong((id *)&self->_lscGainsTexture, 0);
  objc_storeStrong((id *)&self->_inputRGBTexture, 0);
  objc_storeStrong((id *)&self->_metalContext, 0);
  objc_storeStrong((id *)&self->_denoiseMetalStage, 0);

  objc_storeStrong((id *)&self->_noiseMapTexture, 0);
}

@end