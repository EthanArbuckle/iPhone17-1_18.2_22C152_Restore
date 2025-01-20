@interface SoftISPPipeline
- ($F61E096109CF133FD2477F48C7D0CEE7)auxiliaryPixelBufferSizeForAuxiliaryType:(int)a3 inputPixelFormat:(unsigned int)a4 width:(unsigned int)a5 height:(unsigned int)a6;
- (FigMetalContext)metal;
- (NSString)description;
- (SoftISPGraph)graph;
- (SoftISPPipeline)initWithGraph:(id)a3 metal:(id)a4 staticParameters:(id)a5;
- (SoftISPStaticParameters)staticParameters;
- (id)configForPrepareDescriptor:(id)a3 outputCompressionLevel:(int)a4;
- (id)createArgsWithConfig:(id)a3 bounds:(id)a4 inputFrame:(id)a5 outputFrame:(id)a6;
- (int)runWithArgs:(id)a3;
- (int)setReferenceFrameByUniqueID:(unint64_t)a3;
- (int)validateInputFrame:(id)a3 config:(id)a4;
- (uint64_t)applyConnectionToArgsForStage:(void *)a3 pipelineArgs:(void *)a4 currentStageArgs:(void *)a5 currentStageOutputConnections:;
- (uint64_t)applyInputConnectionsToArgsForStage:(void *)a3 pipelineArgs:;
- (uint64_t)applyOutputConnectionsToArgsForStage:(void *)a3 pipelineArgs:;
- (uint64_t)createArgsForStage:(void *)a3 pipelineArgs:;
- (unint64_t)bytesRequiredForConfig:(id)a3;
- (unsigned)auxiliaryPixelFormatForAuxiliaryType:(int)a3 inputPixelFormat:(unsigned int)a4 outputCompressionLevel:(int)a5;
- (unsigned)outputDownscaleFactor;
- (unsigned)outputPixelFormatForInputPixelFormat:(unsigned int)a3 outputCompressionLevel:(int)a4;
@end

@implementation SoftISPPipeline

- (unsigned)outputPixelFormatForInputPixelFormat:(unsigned int)a3 outputCompressionLevel:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = *(void *)&a3;
  v6 = self;
  uint64_t v34 = *MEMORY[0x263EF8340];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  v7 = -[RawNightModeInputFrame pixelBuffer]((uint64_t)self->_graph);
  uint64_t v28 = [v7 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (!v28)
  {
LABEL_22:
    LODWORD(v8) = 0;
    goto LABEL_23;
  }
  uint64_t v8 = 0;
  uint64_t v27 = *(void *)v30;
  do
  {
    uint64_t v9 = 0;
    do
    {
      if (*(void *)v30 != v27) {
        objc_enumerationMutation(v7);
      }
      uint64_t v10 = *(void *)(*((void *)&v29 + 1) + 8 * v9);
      v11 = -[RawNightModeInputFrame pixelBuffer](v10);
      if (([v11 isEqualToString:@"outputTex"] & 1) == 0)
      {
        v12 = -[RawNightModeInputFrame pixelBuffer](v10);
        if (![v12 isEqualToString:@"outputLumaTex"])
        {
          -[RawNightModeInputFrame pixelBuffer](v10);
          uint64_t v18 = v8;
          v19 = v6;
          uint64_t v20 = v5;
          uint64_t v21 = v4;
          v23 = v22 = v7;
          char v26 = [v23 isEqualToString:@"outputChromaTex"];

          v7 = v22;
          uint64_t v4 = v21;
          uint64_t v5 = v20;
          v6 = v19;
          uint64_t v8 = v18;

          if ((v26 & 1) == 0) {
            goto LABEL_15;
          }
          goto LABEL_10;
        }
      }
LABEL_10:
      v13 = -[SoftISPGraph stagesByName]((uint64_t)v6->_graph);
      v14 = -[SoftISPGraph connectionsBySourceStage](v10);
      v15 = [v13 objectForKeyedSubscript:v14];

      if (!v15
        || (uint64_t v16 = [v15 outputPixelFormatForInputPixelFormat:v5 outputCompressionLevel:v4], !v16)
        || (uint64_t v17 = v16, v8) && v8 != v16)
      {
        FigSignalErrorAt();

        goto LABEL_22;
      }

      uint64_t v8 = v17;
LABEL_15:
      ++v9;
    }
    while (v28 != v9);
    uint64_t v24 = [v7 countByEnumeratingWithState:&v29 objects:v33 count:16];
    uint64_t v28 = v24;
  }
  while (v24);
LABEL_23:

  return v8;
}

- (SoftISPPipeline)initWithGraph:(id)a3 metal:(id)a4 staticParameters:(id)a5
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = v11;
  if (!v9 || !v10 || !v11)
  {
    FigDebugAssert3();
    goto LABEL_24;
  }
  v39.receiver = self;
  v39.super_class = (Class)SoftISPPipeline;
  v13 = [(SoftISPPipeline *)&v39 init];
  self = v13;
  if (!v13)
  {
    FigDebugAssert3();
    FigSignalErrorAt();
    goto LABEL_21;
  }
  objc_storeStrong((id *)&v13->_graph, a3);
  objc_storeStrong((id *)&self->_metal, a4);
  objc_storeStrong((id *)&self->_staticParameters, a5);
  -[SoftISPGraph executionOrder]((uint64_t)v9);
  v14 = (NSArray *)objc_claimAutoreleasedReturnValue();
  executionOrder = self->_executionOrder;
  self->_executionOrder = v14;

  if (!self->_executionOrder)
  {
LABEL_24:
    FigSignalErrorAt();
LABEL_27:

    self = 0;
    goto LABEL_21;
  }
  p_graph = (uint64_t *)&self->_graph;
  self->_outputDownscaleFactor = 1;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  uint64_t v16 = -[RawNightModeInputFrame pixelBuffer]((uint64_t)v9);
  uint64_t v17 = [v16 countByEnumeratingWithState:&v35 objects:v40 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v36;
    id v32 = v10;
    id v33 = v9;
    long long v30 = self;
    long long v31 = v12;
LABEL_8:
    uint64_t v20 = 0;
    while (1)
    {
      if (*(void *)v36 != v19) {
        objc_enumerationMutation(v16);
      }
      uint64_t v21 = *(void *)(*((void *)&v35 + 1) + 8 * v20);
      v22 = -[RawNightModeInputFrame pixelBuffer](v21);
      if ([v22 isEqualToString:@"outputTex"]) {
        break;
      }
      v23 = -[RawNightModeInputFrame pixelBuffer](v21);
      int v24 = [v23 isEqualToString:@"outputLumaTex"];

      if (v24) {
        goto LABEL_17;
      }
      if (v18 == ++v20)
      {
        uint64_t v18 = [v16 countByEnumeratingWithState:&v35 objects:v40 count:16];
        id v10 = v32;
        id v9 = v33;
        self = v30;
        v12 = v31;
        if (v18) {
          goto LABEL_8;
        }
        goto LABEL_20;
      }
    }

LABEL_17:
    v25 = -[SoftISPGraph stagesByName](*p_graph);
    char v26 = -[SoftISPGraph connectionsBySourceStage](v21);
    uint64_t v27 = [v25 objectForKeyedSubscript:v26];

    if (v27)
    {
      unsigned int v28 = [v27 outputDownscaleFactor];
      self = v30;
      v12 = v31;
      v30->_outputDownscaleFactor = v28;
      id v10 = v32;
      id v9 = v33;
      if (v28)
      {

        goto LABEL_20;
      }
    }
    else
    {
      id v10 = v32;
      id v9 = v33;
      self = v30;
      v12 = v31;
    }
    FigSignalErrorAt();

    goto LABEL_27;
  }
LABEL_20:

LABEL_21:
  return self;
}

- (NSString)description
{
  v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"%@(graph=%@)", v5, self->_graph];

  return (NSString *)v6;
}

- (id)configForPrepareDescriptor:(id)a3 outputCompressionLevel:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  v7 = [[SoftISPPipelineConfig alloc] initWithStaticParameters:self->_staticParameters prepareDescriptor:v6 outputCompressionLevel:v4 graph:self->_graph];

  return v7;
}

- (unsigned)auxiliaryPixelFormatForAuxiliaryType:(int)a3 inputPixelFormat:(unsigned int)a4 outputCompressionLevel:(int)a5
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  if (a3)
  {
    uint64_t v5 = *(void *)&a5;
    uint64_t v6 = *(void *)&a4;
    uint64_t v7 = *(void *)&a3;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    obj = self->_executionOrder;
    uint64_t v9 = [(NSArray *)obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      unsigned int v11 = 0;
      uint64_t v12 = *(void *)v22;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v22 != v12) {
            objc_enumerationMutation(obj);
          }
          uint64_t v14 = *(void *)(*((void *)&v21 + 1) + 8 * i);
          v15 = -[SoftISPGraph stagesByName]((uint64_t)self->_graph);
          uint64_t v16 = [v15 objectForKeyedSubscript:v14];

          if (!v16) {
            goto LABEL_20;
          }
          unsigned int v17 = [v16 auxiliaryPixelFormatForAuxiliaryType:v7 inputPixelFormat:v6 outputCompressionLevel:v5];
          if (!v11) {
            unsigned int v11 = v17;
          }
          if (v17 && v11 != v17)
          {
LABEL_20:
            FigSignalErrorAt();

            return 0;
          }
        }
        uint64_t v10 = [(NSArray *)obj countByEnumeratingWithState:&v21 objects:v25 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }
    else
    {
      unsigned int v11 = 0;
    }
  }
  else
  {
    FigSignalErrorAt();
    return 0;
  }
  return v11;
}

- ($F61E096109CF133FD2477F48C7D0CEE7)auxiliaryPixelBufferSizeForAuxiliaryType:(int)a3 inputPixelFormat:(unsigned int)a4 width:(unsigned int)a5 height:(unsigned int)a6
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  if (a3)
  {
    uint64_t v6 = *(void *)&a4;
    uint64_t v7 = *(void *)&a3;
    uint64_t v9 = *(void *)&a5;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    uint64_t v10 = self->_executionOrder;
    uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v25;
      while (2)
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v25 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void *)(*((void *)&v24 + 1) + 8 * i);
          uint64_t v16 = -[SoftISPGraph stagesByName]((uint64_t)self->_graph);
          unsigned int v17 = [v16 objectForKeyedSubscript:v15];

          if (!v17)
          {
            FigSignalErrorAt();
            goto LABEL_14;
          }
          if ([v17 auxiliaryPixelFormatForAuxiliaryType:v7 inputPixelFormat:v6 outputCompressionLevel:0])
          {
            uint64_t v18 = [v17 auxiliaryPixelBufferSizeForAuxiliaryType:v7 inputPixelFormat:v6 width:v9 height:a6];
            unsigned int v19 = v18;
            unint64_t v20 = v18 & 0xFFFFFFFF00000000;

            uint64_t v21 = v19;
            return ($F61E096109CF133FD2477F48C7D0CEE7)(v20 | v21);
          }
        }
        uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v24 objects:v28 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }
LABEL_14:
  }
  else
  {
    FigSignalErrorAt();
  }
  uint64_t v21 = 0;
  unint64_t v20 = 0;
  return ($F61E096109CF133FD2477F48C7D0CEE7)(v20 | v21);
}

- (unint64_t)bytesRequiredForConfig:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v5 = -[SoftISPGraph stagesByName]((uint64_t)self->_graph);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      unint64_t v8 = 0;
      uint64_t v9 = *(void *)v19;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v19 != v9) {
            objc_enumerationMutation(v5);
          }
          uint64_t v11 = *(void *)(*((void *)&v18 + 1) + 8 * i);
          uint64_t v12 = -[SoftISPGraph stagesByName]((uint64_t)self->_graph);
          uint64_t v13 = [v12 objectForKeyedSubscript:v11];

          if (!v13)
          {
            FigSignalErrorAt();
            goto LABEL_21;
          }
          uint64_t v14 = [v4 configForStages];
          uint64_t v15 = [v14 objectForKeyedSubscript:v11];

          if (!v15) {
            goto LABEL_20;
          }
          unint64_t v16 = [v13 bytesRequiredForConfig:v15];
          if (v16 == -1)
          {
            FigDebugAssert3();
LABEL_20:
            FigSignalErrorAt();

LABEL_21:
            goto LABEL_22;
          }
          if (v8 <= v16) {
            unint64_t v8 = v16;
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
    else
    {
      unint64_t v8 = 0;
    }
  }
  else
  {
    FigSignalErrorAt();
LABEL_22:
    unint64_t v8 = 0;
  }

  return v8;
}

- (int)validateInputFrame:(id)a3 config:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    obj = self->_executionOrder;
    uint64_t v8 = [(NSArray *)obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v22;
LABEL_4:
      uint64_t v11 = 0;
      while (1)
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void *)(*((void *)&v21 + 1) + 8 * v11);
        uint64_t v13 = -[SoftISPGraph stagesByName]((uint64_t)self->_graph);
        uint64_t v14 = [v13 objectForKeyedSubscript:v12];

        if (!v14)
        {
          int v18 = FigSignalErrorAt();
          goto LABEL_17;
        }
        uint64_t v15 = [v7 configForStages];
        unint64_t v16 = [v15 objectForKeyedSubscript:v12];

        if (!v16) {
          break;
        }
        int v17 = [v14 validateInputFrame:v6 config:v7];
        if (v17)
        {
          int v18 = v17;
          goto LABEL_16;
        }

        if (v9 == ++v11)
        {
          uint64_t v9 = [(NSArray *)obj countByEnumeratingWithState:&v21 objects:v25 count:16];
          if (v9) {
            goto LABEL_4;
          }
          goto LABEL_12;
        }
      }
      FigSignalErrorAt();
      int v18 = 0;
LABEL_16:

      goto LABEL_17;
    }
LABEL_12:
    int v18 = 0;
LABEL_17:
  }
  else
  {
    int v18 = FigSignalErrorAt();
  }

  return v18;
}

- (id)createArgsWithConfig:(id)a3 bounds:(id)a4 inputFrame:(id)a5 outputFrame:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  uint64_t v13 = [[SoftISPPipelineArgs alloc] initWithConfig:v12 bounds:v11 inputFrame:v10 outputFrame:v9];

  return v13;
}

- (int)runWithArgs:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!v4 || (uint64_t v5 = objc_opt_new()) == 0)
  {
    int v22 = FigSignalErrorAt();
    goto LABEL_34;
  }
  id v6 = v5;
  int v7 = -[SoftISPPipeline createArgsForStage:pipelineArgs:]((uint64_t)self, v5, v4);
  if (v7)
  {
    int v22 = v7;
LABEL_39:
    FigDebugAssert3();

    goto LABEL_34;
  }
  int v8 = -[SoftISPPipeline applyInputConnectionsToArgsForStage:pipelineArgs:]((uint64_t)self, v6, v4);
  if (v8)
  {
    int v22 = v8;
    goto LABEL_39;
  }
  int v9 = -[SoftISPPipeline applyOutputConnectionsToArgsForStage:pipelineArgs:]((uint64_t)self, v6, v4);
  if (v9)
  {
    int v22 = v9;
    goto LABEL_39;
  }
  uint64_t v26 = v4;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  obj = self->_executionOrder;
  uint64_t v10 = [(NSArray *)obj countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v10)
  {
    uint64_t v12 = v10;
    uint64_t v25 = *(void *)v28;
    while (1)
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v28 != v25) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void *)(*((void *)&v27 + 1) + 8 * v13);
        uint64_t v15 = (void *)MEMORY[0x263E64AA0](v10, v11);
        unint64_t v16 = -[SoftISPGraph stagesByName]((uint64_t)self->_graph);
        int v17 = [v16 objectForKeyedSubscript:v14];

        if (!v17) {
          goto LABEL_22;
        }
        uint64_t v18 = [v6 objectForKeyedSubscript:v14];
        if (!v18)
        {
          FigDebugAssert3();
LABEL_22:
          int v22 = FigSignalErrorAt();
          goto LABEL_27;
        }
        long long v19 = (void *)v18;
        long long v20 = -[SoftISPGraph connectionsBySourceStage]((uint64_t)self->_graph);
        long long v21 = [v20 objectForKeyedSubscript:v14];

        if (!v21)
        {
          FigDebugAssert3();
          int v22 = FigSignalErrorAt();

          goto LABEL_17;
        }
        if ([v17 runWithArgs:v19])
        {
          int v22 = FigSignalErrorAt();
        }
        else
        {
          int v22 = -[SoftISPPipeline applyConnectionToArgsForStage:pipelineArgs:currentStageArgs:currentStageOutputConnections:]((uint64_t)self, v6, v26, v19, v21);
          if (!v22)
          {
            [v6 removeObjectForKey:v14];

            LODWORD(v21) = 1;
            goto LABEL_17;
          }
          FigDebugAssert3();
        }

LABEL_27:
        LODWORD(v21) = 0;
LABEL_17:

        if (!v21)
        {

          goto LABEL_33;
        }
        ++v13;
      }
      while (v12 != v13);
      uint64_t v10 = [(NSArray *)obj countByEnumeratingWithState:&v27 objects:v31 count:16];
      uint64_t v12 = v10;
      if (!v10) {
        goto LABEL_32;
      }
    }
  }
  int v22 = 0;
LABEL_32:

  [(FigMetalContext *)self->_metal forceCommit];
LABEL_33:

  id v4 = v26;
LABEL_34:

  return v22;
}

- (uint64_t)createArgsForStage:(void *)a3 pipelineArgs:
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v26 = a2;
  id v5 = a3;
  id v6 = v5;
  uint64_t v28 = a1;
  if (a1)
  {
    uint64_t v7 = [v5 config];
    objc_opt_class();
    long long v27 = (void *)v7;
    if (objc_opt_isKindOfClass())
    {
      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      -[SoftISPGraph stagesByName](*(void *)(v28 + 40));
      id obj = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v25 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
      if (v25)
      {
        uint64_t v24 = *(void *)v30;
        unsigned int v22 = 0;
        do
        {
          uint64_t v8 = 0;
          do
          {
            if (*(void *)v30 != v24) {
              objc_enumerationMutation(obj);
            }
            uint64_t v9 = *(void *)(*((void *)&v29 + 1) + 8 * v8);
            uint64_t v10 = (void *)MEMORY[0x263E64AA0]();
            uint64_t v11 = -[SoftISPGraph stagesByName](*(void *)(v28 + 40));
            uint64_t v12 = [v11 objectForKeyedSubscript:v9];

            if (!v12)
            {
              unsigned int v22 = FigSignalErrorAt();
              goto LABEL_21;
            }
            uint64_t v13 = [v27 configForStages];
            uint64_t v14 = [v13 objectForKeyedSubscript:v9];

            if (v14)
            {
              uint64_t v15 = [v6 bounds];
              unint64_t v16 = [v6 inputFrame];
              int v17 = [v6 outputFrame];
              uint64_t v18 = [v12 createArgsWithConfig:v14 bounds:v15 inputFrame:v16 outputFrame:v17];

              if (v18)
              {
                [v26 setObject:v18 forKeyedSubscript:v9];
                int v19 = 0;
              }
              else
              {
                unsigned int v22 = FigSignalErrorAt();
                int v19 = 4;
              }
            }
            else
            {
              unsigned int v22 = FigSignalErrorAt();
              int v19 = 4;
            }

            if (v19) {
              goto LABEL_21;
            }
            ++v8;
          }
          while (v25 != v8);
          uint64_t v20 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
          uint64_t v25 = v20;
        }
        while (v20);
      }
      else
      {
        unsigned int v22 = 0;
      }
LABEL_21:

      a1 = v22;
    }
    else
    {
      a1 = FigSignalErrorAt();
    }
  }
  return a1;
}

- (uint64_t)applyInputConnectionsToArgsForStage:(void *)a3 pipelineArgs:
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v7 = -[RawNightModeInputFrame sampleBuffer](*(void *)(a1 + 40));
    uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v19;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v19 != v9) {
            objc_enumerationMutation(v7);
          }
          uint64_t v11 = *(void *)(*((void *)&v18 + 1) + 8 * i);
          uint64_t v12 = -[SoftISPConnection sourcePropertyName](v11);
          uint64_t v13 = objc_msgSend(v6, "valueForKey:", v12, (void)v18);

          if (!v13)
          {
            uint64_t v8 = FigSignalErrorAt();
            goto LABEL_14;
          }
          uint64_t v14 = -[RawNightModeInputFrame sampleBuffer](v11);
          uint64_t v15 = [v5 objectForKeyedSubscript:v14];

          if (!v15)
          {
            uint64_t v8 = FigSignalErrorAt();

            goto LABEL_14;
          }
          unint64_t v16 = -[RawNightModeInputFrame pixelBuffer](v11);
          [v15 setValue:v13 forKey:v16];
        }
        uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
LABEL_14:
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (uint64_t)applyOutputConnectionsToArgsForStage:(void *)a3 pipelineArgs:
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v7 = -[RawNightModeInputFrame pixelBuffer](*(void *)(a1 + 40));
    uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v19;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v19 != v9) {
            objc_enumerationMutation(v7);
          }
          uint64_t v11 = *(void *)(*((void *)&v18 + 1) + 8 * i);
          uint64_t v12 = -[RawNightModeInputFrame pixelBuffer](v11);
          uint64_t v13 = objc_msgSend(v6, "valueForKey:", v12, (void)v18);

          if (!v13)
          {
            uint64_t v8 = FigSignalErrorAt();
            goto LABEL_14;
          }
          uint64_t v14 = -[SoftISPGraph connectionsBySourceStage](v11);
          uint64_t v15 = [v5 objectForKeyedSubscript:v14];

          if (!v15)
          {
            uint64_t v8 = FigSignalErrorAt();

            goto LABEL_14;
          }
          unint64_t v16 = -[SoftISPConnection sourcePropertyName](v11);
          [v15 setValue:v13 forKey:v16];
        }
        uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
LABEL_14:
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (uint64_t)applyConnectionToArgsForStage:(void *)a3 pipelineArgs:(void *)a4 currentStageArgs:(void *)a5 currentStageOutputConnections:
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v27 = a2;
  id v26 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = v10;
  if (a1)
  {
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id obj = v10;
    uint64_t v12 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v12)
    {
      uint64_t v25 = v11;
      uint64_t v13 = *(void *)v30;
      while (2)
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v30 != v13) {
            objc_enumerationMutation(obj);
          }
          uint64_t v15 = *(void *)(*((void *)&v29 + 1) + 8 * i);
          -[SoftISPConnection sourcePropertyName](v15);
          unint64_t v16 = (NSString *)objc_claimAutoreleasedReturnValue();
          NSSelectorFromString(v16);
          char v17 = objc_opt_respondsToSelector();

          if ((v17 & 1) == 0
            || (-[SoftISPConnection sourcePropertyName](v15),
                long long v18 = objc_claimAutoreleasedReturnValue(),
                [v9 valueForKey:v18],
                long long v19 = objc_claimAutoreleasedReturnValue(),
                v18,
                !-[SoftISPConnection isNullable](v15))
            && !v19)
          {
            uint64_t v12 = FigSignalErrorAt();
            goto LABEL_19;
          }
          long long v20 = -[RawNightModeInputFrame sampleBuffer](v15);
          if (+[SoftISPConnection destinationNameIsOutput:]((uint64_t)SoftISPConnection, v20))
          {
            id v21 = v26;
          }
          else
          {
            unsigned int v22 = -[RawNightModeInputFrame sampleBuffer](v15);
            id v21 = [v27 objectForKeyedSubscript:v22];
          }
          if (!v21)
          {
            uint64_t v12 = FigSignalErrorAt();

            goto LABEL_19;
          }
          uint64_t v23 = -[RawNightModeInputFrame pixelBuffer](v15);
          [v21 setValue:v19 forKey:v23];
        }
        uint64_t v12 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
        if (v12) {
          continue;
        }
        break;
      }
LABEL_19:
      uint64_t v11 = v25;
    }
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

- (int)setReferenceFrameByUniqueID:(unint64_t)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = -[SoftISPGraph executionOrder]((uint64_t)self->_graph);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v11 = -[SoftISPGraph stagesByName]((uint64_t)self->_graph);
        uint64_t v12 = [v11 objectForKeyedSubscript:v10];

        if (!v12)
        {
          int v14 = FigSignalErrorAt();
LABEL_14:

          goto LABEL_15;
        }
        if (objc_opt_respondsToSelector())
        {
          int v13 = [v12 setReferenceFrameByUniqueID:a3];
          if (v13)
          {
            int v14 = v13;
            FigDebugAssert3();
            goto LABEL_14;
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  int v14 = 0;
LABEL_15:

  return v14;
}

- (FigMetalContext)metal
{
  return self->_metal;
}

- (SoftISPStaticParameters)staticParameters
{
  return self->_staticParameters;
}

- (unsigned)outputDownscaleFactor
{
  return self->_outputDownscaleFactor;
}

- (SoftISPGraph)graph
{
  return self->_graph;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_graph, 0);
  objc_storeStrong((id *)&self->_staticParameters, 0);
  objc_storeStrong((id *)&self->_metal, 0);

  objc_storeStrong((id *)&self->_executionOrder, 0);
}

@end