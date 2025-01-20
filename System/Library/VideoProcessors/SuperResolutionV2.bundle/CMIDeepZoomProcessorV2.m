@interface CMIDeepZoomProcessorV2
- (CMIDeepZoomProcessorV2)init;
- (MTLCommandQueue)metalCommandQueue;
- (NSArray)modelInputBindingNames;
- (NSArray)modelInputPixelFormats;
- (NSArray)modelInputSizes;
- (NSArray)modelInputSlicesCount;
- (NSArray)modelOutputBindingNames;
- (NSArray)modelOutputPixelFormats;
- (NSArray)modelOutputSizes;
- (NSArray)modelOutputSlicesCount;
- (NSDictionary)cameraInfoByPortType;
- (NSDictionary)tuningParameters;
- (NSString)modelNetworkBaseName;
- (NSString)portType;
- (__n128)tileCount;
- (__n128)tileOverlap;
- (__n128)tileSize;
- (double)inputROI;
- (double)zoomFactor;
- (id)_createOptionsDictionaryForTuningType:(unsigned int)a3;
- (id)_getTuningTypeStringForProcessingType:(unsigned int)a3;
- (int)clearOutputBuffer:(__CVBuffer *)a3;
- (int)createInputTiles:(id)a3 atPosition:(id)a4 inputFullPixelBuffers:(id *)a5 cmdBuffer:;
- (int)finishProcessing;
- (int)prepareToProcess:(unsigned int)a3;
- (int)prewarm;
- (int)process;
- (int)purgeResources;
- (int)resetState;
- (int)setup;
- (int)updateMetadata:(id)a3 forInputFullPixelBuffer:(__CVBuffer *)a4;
- (int)writeOutputTiles:(id)a3 atPosition:(__CVBuffer *)a4 outputPixelBuffer:(id)a5 inputTilePixelBuffers:(id)a6 inputFullPixelBuffers:(id *)a7 cmdBuffer:;
- (void)dealloc;
- (void)resetMetadata;
- (void)setCameraInfoByPortType:(id)a3;
- (void)setInputROI:(CMIDeepZoomProcessorV2 *)self;
- (void)setMetalCommandQueue:(id)a3;
- (void)setPortType:(id)a3;
- (void)setTuningParameters:(id)a3;
- (void)setZoomFactor:(CMIDeepZoomProcessorV2 *)self;
@end

@implementation CMIDeepZoomProcessorV2

- (CMIDeepZoomProcessorV2)init
{
  v6.receiver = self;
  v6.super_class = (Class)CMIDeepZoomProcessorV2;
  v2 = [(CMIDeepZoomProcessorV2 *)&v6 init];
  v3 = v2;
  if (v2) {
    v4 = v2;
  }

  return v3;
}

- (void)dealloc
{
  [(CMIDeepZoomProcessorV2 *)self finishProcessing];
  [(CMIDeepZoomProcessorV2 *)self purgeResources];
  v3.receiver = self;
  v3.super_class = (Class)CMIDeepZoomProcessorV2;
  [(CMIDeepZoomProcessorV2 *)&v3 dealloc];
}

- (id)_getTuningTypeStringForProcessingType:(unsigned int)a3
{
  if (a3 - 1 > 4) {
    return 0;
  }
  else {
    return *(&off_18380 + (int)(a3 - 1));
  }
}

- (id)_createOptionsDictionaryForTuningType:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  v5 = objc_opt_new();
  objc_super v6 = [(CMIDeepZoomProcessorV2 *)self _getTuningTypeStringForProcessingType:v3];
  v7 = v6;
  if (v6)
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    v8 = self->_tuningParameters;
    id v9 = [(NSDictionary *)v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v19;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v19 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v18 + 1) + 8 * i);
          v14 = -[NSDictionary objectForKeyedSubscript:](self->_tuningParameters, "objectForKeyedSubscript:", v13, (void)v18);
          v15 = [v14 objectForKeyedSubscript:v7];

          if (v15) {
            [v5 setObject:v15 forKeyedSubscript:v13];
          }
        }
        id v10 = [(NSDictionary *)v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v10);
    }

    objc_super v6 = v5;
  }
  id v16 = v6;

  return v16;
}

- (int)prepareToProcess:(unsigned int)a3
{
  self->_processingType = a3;
  if (a3 - 6 < 0xFFFFFFFB)
  {
    id v9 = 0;
    int v39 = -12782;
    goto LABEL_14;
  }
  uint64_t v3 = *(void *)&a3;
  id v5 = objc_alloc((Class)FigMetalContext);
  objc_super v6 = +[NSBundle bundleForClass:objc_opt_class()];
  v7 = (FigMetalContext *)[v5 initWithbundle:v6 andOptionalCommandQueue:self->_metalCommandQueue];
  metalContext = self->_metalContext;
  self->_metalContext = v7;

  if (!self->_metalContext)
  {
    id v9 = 0;
LABEL_17:
    int v39 = -12786;
    goto LABEL_14;
  }
  id v9 = objc_opt_new();
  id v10 = [(CMIDeepZoomProcessorV2 *)self _createOptionsDictionaryForTuningType:v3];
  [v9 setObject:v10 forKeyedSubscript:@"TuningParameters"];

  switch((int)v3)
  {
    case 1:
      uint64_t v11 = CMIDeepZoomLiteMetalStageV2;
      goto LABEL_6;
    case 2:
      uint64_t v11 = CMIDeepZoomStandardMetalStageV2;
LABEL_6:
      v12 = (CMIDeepZoomTransferMetalStageV2 *)[v11 alloc];
      uint64_t v13 = self->_metalContext;
      v14 = 0;
      goto LABEL_11;
    case 3:
      v15 = &off_18F78;
      goto LABEL_10;
    case 4:
      v15 = &off_18F90;
      goto LABEL_10;
    case 5:
      v15 = &off_18FA8;
LABEL_10:
      [v9 setObject:v15 forKeyedSubscript:@"DeepTransferNetwork"];
      v12 = [CMIDeepZoomTransferMetalStageV2 alloc];
      uint64_t v13 = self->_metalContext;
      v14 = v9;
LABEL_11:
      id v16 = [(CMIDeepZoomTransferMetalStageV2 *)v12 initWithMetalContext:v13 options:v14];
      deepZoomMetalStage = self->_deepZoomMetalStage;
      self->_deepZoomMetalStage = v16;

      break;
    default:
      break;
  }
  long long v18 = self->_deepZoomMetalStage;
  if (!v18) {
    goto LABEL_17;
  }
  long long v19 = [(CMIDeepZoomMetalStageV2 *)v18 modelNetworkBaseName];
  modelNetworkBaseName = self->_modelNetworkBaseName;
  self->_modelNetworkBaseName = v19;

  long long v21 = [(CMIDeepZoomMetalStageV2 *)self->_deepZoomMetalStage modelInputBindingNames];
  modelInputBindingNames = self->_modelInputBindingNames;
  self->_modelInputBindingNames = v21;

  v23 = [(CMIDeepZoomMetalStageV2 *)self->_deepZoomMetalStage modelInputSizes];
  modelInputSizes = self->_modelInputSizes;
  self->_modelInputSizes = v23;

  v25 = [(CMIDeepZoomMetalStageV2 *)self->_deepZoomMetalStage modelInputPixelFormats];
  modelInputPixelFormats = self->_modelInputPixelFormats;
  self->_modelInputPixelFormats = v25;

  v27 = [(CMIDeepZoomMetalStageV2 *)self->_deepZoomMetalStage modelInputSlicesCount];
  modelInputSlicesCount = self->_modelInputSlicesCount;
  self->_modelInputSlicesCount = v27;

  v29 = [(CMIDeepZoomMetalStageV2 *)self->_deepZoomMetalStage modelOutputBindingNames];
  modelOutputBindingNames = self->_modelOutputBindingNames;
  self->_modelOutputBindingNames = v29;

  v31 = [(CMIDeepZoomMetalStageV2 *)self->_deepZoomMetalStage modelOutputSizes];
  modelOutputSizes = self->_modelOutputSizes;
  self->_modelOutputSizes = v31;

  v33 = [(CMIDeepZoomMetalStageV2 *)self->_deepZoomMetalStage modelOutputPixelFormats];
  modelOutputPixelFormats = self->_modelOutputPixelFormats;
  self->_modelOutputPixelFormats = v33;

  v35 = [(CMIDeepZoomMetalStageV2 *)self->_deepZoomMetalStage modelOutputSlicesCount];
  modelOutputSlicesCount = self->_modelOutputSlicesCount;
  self->_modelOutputSlicesCount = v35;

  [(CMIDeepZoomMetalStageV2 *)self->_deepZoomMetalStage tileSize];
  *(_WORD *)&self->_tileSize[2] = v37;
  *(_WORD *)self->_tileSize = v38;
  [(CMIDeepZoomMetalStageV2 *)self->_deepZoomMetalStage tileOverlap];
  int v39 = 0;
  *(_WORD *)&self->_tileOverlap[2] = v40;
  *(_WORD *)self->_tileOverlap = v41;
LABEL_14:

  return v39;
}

- (void)setZoomFactor:(CMIDeepZoomProcessorV2 *)self
{
  if (*(float *)&v2 != 0.0 && *((float *)&v2 + 1) != 0.0)
  {
    unsigned int v3 = *(unsigned __int16 *)&self->_inputROI[6];
    if (*(_WORD *)&self->_inputROI[4]) {
      BOOL v4 = v3 == 0;
    }
    else {
      BOOL v4 = 1;
    }
    if (!v4)
    {
      int v5 = (int)(float)((float)((float)((float)((float)*(unsigned __int16 *)self->_tileSize
                                              + (float)(*(float *)&v2 * (float)*(unsigned __int16 *)&self->_inputROI[4]))
                                      - (float)*(unsigned __int16 *)self->_tileOverlap)
                              + -1.0)
                      / (float)(*(unsigned __int16 *)self->_tileSize - *(unsigned __int16 *)self->_tileOverlap));
      *(void *)self->_zoomFactor = v2;
      *(_WORD *)&self->_tileCount[2] = (int)(float)((float)((float)((float)((float)*(unsigned __int16 *)&self->_tileSize[2]
                                                                          + (float)(*((float *)&v2 + 1) * (float)v3))
                                                                  - (float)*(unsigned __int16 *)&self->_tileOverlap[2])
                                                          + -1.0)
                                                  / (float)(*(unsigned __int16 *)&self->_tileSize[2]
                                                          - *(unsigned __int16 *)&self->_tileOverlap[2]));
      *(_WORD *)self->_tileCount = v5;
    }
  }
}

- (int)clearOutputBuffer:(__CVBuffer *)a3
{
  if (!a3) {
    return -12780;
  }
  if (!self->_portType) {
    return -12780;
  }
  deepZoomMetalStage = self->_deepZoomMetalStage;
  if (!deepZoomMetalStage) {
    return -12780;
  }
  unsigned int processingType = self->_processingType;
  if (processingType == 2)
  {
    id v9 = -[NSDictionary objectForKeyedSubscript:](self->_tuningParameters, "objectForKeyedSubscript:", 0, 0, 0, 0);
    id v10 = [v9 objectForKeyedSubscript:@"Standard"];
    uint64_t v11 = [v10 objectForKeyedSubscript:@"LumaGainCoefX"];

    if ([v11 count] == &dword_4)
    {
      v12 = [(NSDictionary *)self->_tuningParameters objectForKeyedSubscript:self->_portType];
      uint64_t v13 = [v12 objectForKeyedSubscript:@"Standard"];
      v14 = [v13 objectForKeyedSubscript:@"LumaGainCoefY"];

      if ([v14 count] == &dword_4)
      {
        for (uint64_t i = 0; i != 4; ++i)
        {
          id v16 = [v11 objectAtIndexedSubscript:i];
          [v16 floatValue];
          v17 = (_DWORD *)&v22 + i;
          _DWORD *v17 = v18;

          long long v19 = [v14 objectAtIndexedSubscript:i];
          [v19 floatValue];
          v17[4] = v20;
        }
        if (![(CMIDeepZoomMetalStageV2 *)self->_deepZoomMetalStage configurePostProcess:&v22])
        {
          deepZoomMetalStage = self->_deepZoomMetalStage;

          return [(CMIDeepZoomMetalStageV2 *)deepZoomMetalStage clearBuffer:a3];
        }
        int v8 = -12782;
LABEL_23:

        return v8;
      }
    }
    else
    {
      v14 = 0;
    }
    int v8 = -12780;
    goto LABEL_23;
  }
  if (processingType != 1) {
    return [(CMIDeepZoomMetalStageV2 *)deepZoomMetalStage clearBuffer:a3];
  }
  if (COERCE_FLOAT(*(void *)self->_zoomFactor) == 2.0 && COERCE_FLOAT(HIDWORD(*(void *)self->_zoomFactor)) == 2.0) {
    return [(CMIDeepZoomMetalStageV2 *)deepZoomMetalStage clearBuffer:a3];
  }
  return -12786;
}

- (void)resetMetadata
{
}

- (int)updateMetadata:(id)a3 forInputFullPixelBuffer:(__CVBuffer *)a4
{
  return [(CMIDeepZoomMetalStageV2 *)self->_deepZoomMetalStage updateMetadata:a3 forInputFullPixelBuffer:a4];
}

- (int)createInputTiles:(id)a3 atPosition:(id)a4 inputFullPixelBuffers:(id *)a5 cmdBuffer:
{
  uint64_t v6 = v5;
  int v8 = (int)a4;
  id v10 = a3;
  uint64_t v11 = a5;
  uint64_t v20 = 0;
  if ([v10 count])
  {
    id v12 = [v11 count];
    int v13 = -12780;
    if (v6)
    {
      if (v12)
      {
        uint64_t v14 = *(void *)self->_zoomFactor;
        if (*(float *)&v14 != 0.0 && *((float *)&v14 + 1) != 0.0)
        {
          uint64_t v15 = *(void *)self->_inputROI;
          v16.i32[0] = HIWORD(v15);
          v16.i32[1] = WORD2(v15);
          int32x2_t v17 = vceqz_s32((int32x2_t)vand_s8(v16, (int8x8_t)0xFFFF0000FFFFLL));
          if (((v17.i32[1] | v17.i32[0]) & 1) == 0)
          {
            LODWORD(v20) = v8;
            uint64_t v19 = *(void *)self->_tileSize;
            uint64_t v21 = v14;
            uint64_t v22 = v15;
            int v13 = [(CMIDeepZoomMetalStageV2 *)self->_deepZoomMetalStage cutTilesFrom:v11 to:v10 params:&v19 outCommandBuffer:v6];
          }
        }
      }
    }
  }
  else
  {
    int v13 = -12780;
  }

  return v13;
}

- (int)writeOutputTiles:(id)a3 atPosition:(__CVBuffer *)a4 outputPixelBuffer:(id)a5 inputTilePixelBuffers:(id)a6 inputFullPixelBuffers:(id *)a7 cmdBuffer:
{
  uint64_t v8 = v7;
  unsigned int v12 = a4;
  id v14 = a3;
  id v15 = a6;
  int8x8_t v16 = a7;
  id v17 = [v14 count];
  int v18 = -12780;
  if (a5)
  {
    if (v17)
    {
      if ([v15 count])
      {
        id v19 = [v16 count];
        if (v8)
        {
          if (v19)
          {
            uint64_t v20 = *(void *)self->_zoomFactor;
            if (*(float *)&v20 != 0.0 && *((float *)&v20 + 1) != 0.0)
            {
              uint64_t v21 = *(void *)self->_inputROI;
              v22.i32[0] = HIWORD(v21);
              v22.i32[1] = WORD2(v21);
              uint16x4_t v23 = (uint16x4_t)vceqz_s32((int32x2_t)vand_s8(v22, (int8x8_t)0xFFFF0000FFFFLL));
              if (((v23.i32[1] | v23.i32[0]) & 1) == 0)
              {
                unsigned int v28 = v12;
                uint64_t v27 = *(void *)self->_tileSize;
                int v24 = (unsigned __int16)v12;
                if ((_WORD)v12)
                {
                  if ((unsigned __int16)v12 == *(unsigned __int16 *)self->_tileCount - 1) {
                    int v24 = 2;
                  }
                  else {
                    int v24 = 1;
                  }
                }
                v23.i32[0] = v24;
                v23.i16[0] = vmovl_u16(v23).u16[0];
                if (v12 >= 0x10000)
                {
                  if (*(unsigned __int16 *)&self->_tileCount[2] - 1 == HIWORD(v12)) {
                    __int16 v25 = 2;
                  }
                  else {
                    __int16 v25 = 1;
                  }
                }
                else
                {
                  __int16 v25 = 0;
                }
                __int16 v30 = v25;
                __int16 v29 = v23.i16[0];
                uint64_t v31 = v21;
                int v18 = [(CMIDeepZoomMetalStageV2 *)self->_deepZoomMetalStage pasteTilesFrom:v15 with:v14 inputFullPixelBuffers:v16 to:a5 params:&v27 outCommandBuffer:v8];
              }
            }
          }
        }
      }
    }
  }

  return v18;
}

- (int)finishProcessing
{
  return 0;
}

- (int)purgeResources
{
  deepZoomMetalStage = self->_deepZoomMetalStage;
  self->_deepZoomMetalStage = 0;

  metalContext = self->_metalContext;
  self->_metalContext = 0;

  return 0;
}

- (int)process
{
  uint64_t v2 = (objc_class *)objc_opt_class();
  unsigned int v3 = NSStringFromClass(v2);
  +[NSException raise:NSObjectNotAvailableException, @"process method should be not used for this class %@", v3 format];

  return 0;
}

- (int)setup
{
  return 0;
}

- (int)prewarm
{
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  uint64_t v2 = self->_tuningParameters;
  id v24 = [(NSDictionary *)v2 countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (!v24)
  {

    return 0;
  }
  obj = v2;
  int v3 = 0;
  int v4 = 0;
  int v5 = 0;
  uint64_t v22 = *(void *)v33;
  do
  {
    uint64_t v6 = 0;
    do
    {
      if (*(void *)v33 != v22) {
        objc_enumerationMutation(obj);
      }
      uint64_t v27 = v6;
      uint64_t v7 = *(void *)(*((void *)&v32 + 1) + 8 * v6);
      uint64_t v8 = [(NSDictionary *)self->_tuningParameters objectForKeyedSubscript:@"DefaultSensorIDs"];
      uint64_t v9 = [v8 objectForKeyedSubscript:v7];

      id v10 = [(NSDictionary *)self->_tuningParameters objectForKeyedSubscript:v7];
      v26 = (void *)v9;
      uint64_t v11 = [v10 objectForKeyedSubscript:v9];
      unsigned int v12 = [v11 objectForKeyedSubscript:@"DeepZoomParameters"];

      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      __int16 v25 = v12;
      int v13 = [v12 allKeys];
      id v14 = [v13 countByEnumeratingWithState:&v28 objects:v36 count:16];
      if (v14)
      {
        id v15 = v14;
        uint64_t v16 = *(void *)v29;
        do
        {
          for (uint64_t i = 0; i != v15; uint64_t i = (char *)i + 1)
          {
            if (*(void *)v29 != v16) {
              objc_enumerationMutation(v13);
            }
            int v18 = *(void **)(*((void *)&v28 + 1) + 8 * i);
            v5 |= [v18 isEqual:@"Lite"];
            v4 |= [v18 isEqual:@"Standard"];
            v3 |= [v18 isEqual:@"Transfer"];
          }
          id v15 = [v13 countByEnumeratingWithState:&v28 objects:v36 count:16];
        }
        while (v15);
      }

      uint64_t v6 = v27 + 1;
    }
    while ((id)(v27 + 1) != v24);
    id v24 = [(NSDictionary *)obj countByEnumeratingWithState:&v32 objects:v37 count:16];
  }
  while (v24);

  if ((v5 & 1) == 0)
  {
    int v19 = 0;
    if ((v4 & 1) == 0) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }
  int v19 = [(CMIDeepZoomProcessorV2 *)self prepareToProcess:1];
  if (v4) {
LABEL_20:
  }
    v19 |= [(CMIDeepZoomProcessorV2 *)self prepareToProcess:2];
LABEL_21:
  if (v3) {
    return [(CMIDeepZoomProcessorV2 *)self prepareToProcess:3] | v19;
  }
  return v19;
}

- (int)resetState
{
  modelNetworkBaseName = self->_modelNetworkBaseName;
  self->_modelNetworkBaseName = (NSString *)&stru_18528;

  modelInputBindingNames = self->_modelInputBindingNames;
  self->_modelInputBindingNames = (NSArray *)&__NSArray0__struct;

  modelInputSizes = self->_modelInputSizes;
  self->_modelInputSizes = (NSArray *)&__NSArray0__struct;

  modelInputPixelFormats = self->_modelInputPixelFormats;
  self->_modelInputPixelFormats = (NSArray *)&__NSArray0__struct;

  modelInputSlicesCount = self->_modelInputSlicesCount;
  self->_modelInputSlicesCount = (NSArray *)&__NSArray0__struct;

  modelOutputBindingNames = self->_modelOutputBindingNames;
  self->_modelOutputBindingNames = (NSArray *)&__NSArray0__struct;

  modelOutputSizes = self->_modelOutputSizes;
  self->_modelOutputSizes = (NSArray *)&__NSArray0__struct;

  modelOutputPixelFormats = self->_modelOutputPixelFormats;
  self->_modelOutputPixelFormats = (NSArray *)&__NSArray0__struct;

  modelOutputSlicesCount = self->_modelOutputSlicesCount;
  self->_modelOutputSlicesCount = (NSArray *)&__NSArray0__struct;

  *(void *)self->_tileSize = 0;
  *(_DWORD *)self->_tileCount = 0;
  *(void *)self->_inputROI = 0;
  *(void *)self->_zoomFactor = 0;
  portType = self->_portType;
  self->_portType = (NSString *)&stru_18528;

  return 0;
}

- (NSDictionary)tuningParameters
{
  return self->_tuningParameters;
}

- (void)setTuningParameters:(id)a3
{
}

- (MTLCommandQueue)metalCommandQueue
{
  return self->_metalCommandQueue;
}

- (void)setMetalCommandQueue:(id)a3
{
}

- (NSDictionary)cameraInfoByPortType
{
  return self->_cameraInfoByPortType;
}

- (void)setCameraInfoByPortType:(id)a3
{
}

- (NSString)modelNetworkBaseName
{
  return self->_modelNetworkBaseName;
}

- (NSArray)modelInputBindingNames
{
  return self->_modelInputBindingNames;
}

- (NSArray)modelInputSizes
{
  return self->_modelInputSizes;
}

- (NSArray)modelInputPixelFormats
{
  return self->_modelInputPixelFormats;
}

- (NSArray)modelInputSlicesCount
{
  return self->_modelInputSlicesCount;
}

- (NSArray)modelOutputBindingNames
{
  return self->_modelOutputBindingNames;
}

- (NSArray)modelOutputSizes
{
  return self->_modelOutputSizes;
}

- (NSArray)modelOutputPixelFormats
{
  return self->_modelOutputPixelFormats;
}

- (NSArray)modelOutputSlicesCount
{
  return self->_modelOutputSlicesCount;
}

- (__n128)tileSize
{
  LOWORD(v1) = *(_WORD *)(a1 + 28);
  WORD2(v1) = *(_WORD *)(a1 + 30);
  result.n128_u32[0] = v1;
  result.n128_u16[2] = WORD2(v1);
  return result;
}

- (__n128)tileOverlap
{
  LOWORD(v1) = *(_WORD *)(a1 + 32);
  WORD2(v1) = *(_WORD *)(a1 + 34);
  result.n128_u32[0] = v1;
  result.n128_u16[2] = WORD2(v1);
  return result;
}

- (__n128)tileCount
{
  LOWORD(v1) = *(_WORD *)(a1 + 36);
  WORD2(v1) = *(_WORD *)(a1 + 38);
  result.n128_u32[0] = v1;
  result.n128_u16[2] = WORD2(v1);
  return result;
}

- (double)inputROI
{
  return *(double *)(a1 + 136);
}

- (void)setInputROI:(CMIDeepZoomProcessorV2 *)self
{
  *(void *)self->_inputROI = v2;
}

- (double)zoomFactor
{
  return *(double *)(a1 + 144);
}

- (NSString)portType
{
  return self->_portType;
}

- (void)setPortType:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_portType, 0);
  objc_storeStrong((id *)&self->_modelOutputSlicesCount, 0);
  objc_storeStrong((id *)&self->_modelOutputPixelFormats, 0);
  objc_storeStrong((id *)&self->_modelOutputSizes, 0);
  objc_storeStrong((id *)&self->_modelOutputBindingNames, 0);
  objc_storeStrong((id *)&self->_modelInputSlicesCount, 0);
  objc_storeStrong((id *)&self->_modelInputPixelFormats, 0);
  objc_storeStrong((id *)&self->_modelInputSizes, 0);
  objc_storeStrong((id *)&self->_modelInputBindingNames, 0);
  objc_storeStrong((id *)&self->_modelNetworkBaseName, 0);
  objc_storeStrong((id *)&self->_cameraInfoByPortType, 0);
  objc_storeStrong((id *)&self->_metalCommandQueue, 0);
  objc_storeStrong((id *)&self->_tuningParameters, 0);
  objc_storeStrong((id *)&self->_deepZoomMetalStage, 0);

  objc_storeStrong((id *)&self->_metalContext, 0);
}

@end