@interface SoftISPPipelineConfig
- (NSDictionary)configForStages;
- (SoftISPGraph)graph;
- (SoftISPPipelineConfig)initWithStaticParameters:(id)a3 prepareDescriptor:(id)a4 outputCompressionLevel:(int)a5 graph:(id)a6;
@end

@implementation SoftISPPipelineConfig

- (SoftISPPipelineConfig)initWithStaticParameters:(id)a3 prepareDescriptor:(id)a4 outputCompressionLevel:(int)a5 graph:(id)a6
{
  uint64_t v7 = *(void *)&a5;
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v13 = v12;
  if (!v10 || !v11 || !v12)
  {
    FigDebugAssert3();
LABEL_23:
    FigSignalErrorAt();
LABEL_24:

    goto LABEL_25;
  }
  -[RawNightModeInputFrame metadata]((uint64_t)v12);
  v14 = (SoftISPPipelineConfig *)objc_claimAutoreleasedReturnValue();

  if (!v14
    || (-[SoftISPGraph outputStageName]((uint64_t)v13),
        v14 = (SoftISPPipelineConfig *)objc_claimAutoreleasedReturnValue(),
        v14,
        !v14))
  {
    FigSignalErrorAt();

    goto LABEL_19;
  }
  v49.receiver = self;
  v49.super_class = (Class)SoftISPPipelineConfig;
  v15 = [(SoftISPConfig *)&v49 initWithStaticParameters:v10];
  if (!v15)
  {
    FigDebugAssert3();
    FigSignalErrorAt();
LABEL_25:
    v14 = 0;
    goto LABEL_19;
  }
  self = v15;
  uint64_t v16 = objc_opt_new();
  if (!v16) {
    goto LABEL_23;
  }
  v17 = (NSDictionary *)v16;
  uint64_t v18 = objc_opt_new();
  if (!v18)
  {
    FigSignalErrorAt();

    goto LABEL_24;
  }
  v19 = (void *)v18;
  id v40 = a6;
  v41 = self;
  id v44 = v11;
  id v42 = v10;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  uint64_t v20 = (uint64_t)v13;
  -[SoftISPGraph stagesByName]((uint64_t)v13);
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v21 = [obj countByEnumeratingWithState:&v45 objects:v50 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v46;
    while (2)
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v46 != v23) {
          objc_enumerationMutation(obj);
        }
        uint64_t v25 = *(void *)(*((void *)&v45 + 1) + 8 * i);
        v26 = -[SoftISPGraph stagesByName](v20);
        v27 = [v26 objectForKeyedSubscript:v25];

        uint64_t v28 = [v27 configForPrepareDescriptor:v44 outputCompressionLevel:v7];
        if (!v28)
        {
          FigSignalErrorAt();

          v14 = 0;
          id v10 = v42;
          id v11 = v44;
          v13 = (void *)v20;
          goto LABEL_19;
        }
        v29 = (void *)v28;
        [(NSDictionary *)v17 setObject:v28 forKeyedSubscript:v25];
        v30 = [v29 auxiliaryPixelFormats];
        objc_msgSend(v19, "cmi_mergeEntriesFromDictionary:", v30);
      }
      uint64_t v22 = [obj countByEnumeratingWithState:&v45 objects:v50 count:16];
      if (v22) {
        continue;
      }
      break;
    }
  }

  v13 = (void *)v20;
  v31 = -[RawNightModeInputFrame metadata](v20);
  v32 = [(NSDictionary *)v17 objectForKeyedSubscript:v31];

  v33 = -[SoftISPGraph outputStageName](v20);
  v34 = [(NSDictionary *)v17 objectForKeyedSubscript:v33];

  objc_storeStrong((id *)&v41->_graph, v40);
  configForStages = v41->_configForStages;
  v41->_configForStages = v17;
  v36 = v17;

  -[SoftISPConfig setInputPixelFormat:](v41, "setInputPixelFormat:", [v32 inputPixelFormat]);
  v37 = [v32 inputMTLPixelFormatForPlane];
  [(SoftISPConfig *)v41 setInputMTLPixelFormatForPlane:v37];

  -[SoftISPConfig setOutputPixelFormat:](v41, "setOutputPixelFormat:", [v34 outputPixelFormat]);
  v38 = [v34 outputMTLPixelFormatForPlane];
  [(SoftISPConfig *)v41 setOutputMTLPixelFormatForPlane:v38];

  -[SoftISPConfig setMaximumOutputDimensions:](v41, "setMaximumOutputDimensions:", [v34 maximumOutputDimensions]);
  [(SoftISPConfig *)v41 setAuxiliaryPixelFormats:v19];
  v14 = v41;

  id v10 = v42;
  id v11 = v44;
LABEL_19:

  return v14;
}

- (SoftISPGraph)graph
{
  return self->_graph;
}

- (NSDictionary)configForStages
{
  return self->_configForStages;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configForStages, 0);

  objc_storeStrong((id *)&self->_graph, 0);
}

@end