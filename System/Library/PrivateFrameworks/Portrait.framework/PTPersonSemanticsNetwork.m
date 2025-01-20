@interface PTPersonSemanticsNetwork
- (PTPersonSemanticsNetwork)initWithMetalContext:(id)a3 effectUtil:(id)a4 sharedResources:(id)a5;
- (id)espressoFileURLFor:(id)a3 prefix:(id)a4 chipId:(id)a5;
- (id)inRGBA;
- (id)outPersonMask;
- (id)outSkinMask;
- (unsigned)executeNetwork:(id)a3;
@end

@implementation PTPersonSemanticsNetwork

- (id)inRGBA
{
  return self->_inRGBA;
}

- (PTPersonSemanticsNetwork)initWithMetalContext:(id)a3 effectUtil:(id)a4 sharedResources:(id)a5
{
  uint64_t v97 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v93.receiver = self;
  v93.super_class = (Class)PTPersonSemanticsNetwork;
  v12 = [(PTPersonSemanticsNetwork *)&v93 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_metalContext, a3);
    kdebug_trace();
    if ((MGGetBoolAnswer() & 1) == 0)
    {
      uint64_t v16 = _PTLogSystem();
      if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_ERROR)) {
        -[PTPersonSemanticsNetwork initWithMetalContext:effectUtil:sharedResources:].cold.8();
      }
      v31 = 0;
      goto LABEL_54;
    }
    PTKTraceInit();
    objc_storeStrong((id *)&v13->_effectUtil, a4);
    inRGBAName = v13->_inRGBAName;
    v13->_inRGBAName = (NSString *)@"image__Placeholder__0";

    v15 = FTGetChipIdentifier();
    uint64_t v16 = [(PTPersonSemanticsNetwork *)v13 espressoFileURLFor:@"/System/Library/ImagingNetworks" prefix:@"personsemantics-preview-lowfps" chipId:v15];
    uint64_t v17 = [(PTPersonSemanticsNetwork *)v13 espressoFileURLFor:@"/System/Library/ImagingNetworks" prefix:@"personsemantics-preview" chipId:v15];
    if (!(v16 | v17))
    {
      v87 = v15;
      id v82 = v11;
      v18 = _PTLogSystem();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        -[PTPersonSemanticsNetwork initWithMetalContext:effectUtil:sharedResources:].cold.7();
      }
      id v83 = v10;
      id v85 = v9;

      v19 = [MEMORY[0x1E4F28CB8] defaultManager];
      v20 = [v19 contentsOfDirectoryAtPath:@"/System/Library/ImagingNetworks" error:0];

      long long v91 = 0u;
      long long v92 = 0u;
      long long v89 = 0u;
      long long v90 = 0u;
      id v21 = v20;
      uint64_t v22 = [v21 countByEnumeratingWithState:&v89 objects:v96 count:16];
      if (!v22)
      {
        v24 = 0;
        uint64_t v16 = 0;
        goto LABEL_26;
      }
      uint64_t v23 = v22;
      v24 = 0;
      uint64_t v16 = 0;
      uint64_t v25 = *(void *)v90;
      while (1)
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v90 != v25) {
            objc_enumerationMutation(v21);
          }
          v27 = *(void **)(*((void *)&v89 + 1) + 8 * i);
          if ([v27 hasSuffix:@".espresso.net"])
          {
            if ([v27 containsString:@"personsemantics-preview-lowfps"])
            {
              uint64_t v28 = [NSString stringWithFormat:@"%@/%@", @"/System/Library/ImagingNetworks", v27];
              v29 = (void *)v16;
              uint64_t v16 = v28;
            }
            else
            {
              if (![v27 containsString:@"personsemantics-preview"]) {
                continue;
              }
              uint64_t v30 = [NSString stringWithFormat:@"%@/%@", @"/System/Library/ImagingNetworks", v27];
              v29 = v24;
              v24 = (void *)v30;
            }
          }
        }
        uint64_t v23 = [v21 countByEnumeratingWithState:&v89 objects:v96 count:16];
        if (!v23)
        {
LABEL_26:

          id v10 = v83;
          id v9 = v85;
          id v11 = v82;
          v15 = v87;
          v32 = v24;
          goto LABEL_27;
        }
      }
    }
    v32 = (void *)v17;
LABEL_27:
    v33 = (void *)v16;
    if (v16 || (v33 = v32) != 0)
    {
      v34 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v33];
      v35 = [v11 segmentationNetwork];

      if (v35)
      {
        uint64_t v36 = [v11 segmentationNetwork];
        executor = v13->_executor;
        v13->_executor = (PTEspressoGenericExecutor *)v36;
      }
      else
      {
        v84 = v32;
        uint64_t v86 = v16;
        v88 = v15;
        executor = +[PTInference ANEConfigForAsynchronousWork];
        v38 = [PTEspressoGenericExecutor alloc];
        metalContext = v13->_metalContext;
        v95 = v13->_inRGBAName;
        v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v95 count:1];
        v94[0] = @"skin:0";
        v94[1] = @"person:0";
        v41 = [MEMORY[0x1E4F1C978] arrayWithObjects:v94 count:2];
        uint64_t v42 = [(PTEspressoGenericExecutor *)v38 initWithMetalContext:metalContext url:v34 inputNames:v40 outputNames:v41 tensorSwapNames:0 reshapeNetworkSize:0 configuration:0 ANEConfig:executor];
        v43 = v13->_executor;
        v13->_executor = (PTEspressoGenericExecutor *)v42;

        if (!v13->_executor)
        {
          v59 = _PTLogSystem();
          v32 = v84;
          if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR)) {
            -[PTPersonSemanticsNetwork initWithMetalContext:effectUtil:sharedResources:](v59, v60, v61, v62, v63, v64, v65, v66);
          }

          v31 = 0;
          uint64_t v16 = v86;
          v15 = v88;
          goto LABEL_53;
        }
        objc_msgSend(v11, "setSegmentationNetwork:");
        uint64_t v16 = v86;
        v15 = v88;
        v32 = v84;
      }

      kdebug_trace();
      v44 = v13->_executor;
      if (v44)
      {
        uint64_t v45 = [(PTEspressoGenericExecutor *)v44 getInputResourceWithName:v13->_inRGBAName];
        inRGBA = v13->_inRGBA;
        v13->_inRGBA = (MTLTexture *)v45;

        if (v13->_inRGBA)
        {
          uint64_t v47 = [(PTEspressoGenericExecutor *)v13->_executor getOutputResourceWithName:@"skin:0"];
          outSkinMask = v13->_outSkinMask;
          v13->_outSkinMask = (MTLTexture *)v47;

          if (v13->_outSkinMask)
          {
            uint64_t v49 = [(PTEspressoGenericExecutor *)v13->_executor getOutputResourceWithName:@"person:0"];
            outPersonMask = v13->_outPersonMask;
            v13->_outPersonMask = (MTLTexture *)v49;

            if (v13->_outPersonMask)
            {
              v31 = v13;
LABEL_53:

LABEL_54:
              goto LABEL_55;
            }
            v51 = _PTLogSystem();
            if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR)) {
              -[PTPersonSemanticsNetwork initWithMetalContext:effectUtil:sharedResources:].cold.6(v51, v74, v75, v76, v77, v78, v79, v80);
            }
          }
          else
          {
            v51 = _PTLogSystem();
            if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR)) {
              -[PTPersonSemanticsNetwork initWithMetalContext:effectUtil:sharedResources:].cold.5(v51, v67, v68, v69, v70, v71, v72, v73);
            }
          }
        }
        else
        {
          v51 = _PTLogSystem();
          if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR)) {
            -[PTPersonSemanticsNetwork initWithMetalContext:effectUtil:sharedResources:].cold.4(v51, v52, v53, v54, v55, v56, v57, v58);
          }
        }
      }
      else
      {
        v51 = _PTLogSystem();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR)) {
          -[PTPersonSemanticsNetwork initWithMetalContext:effectUtil:sharedResources:]();
        }
      }
    }
    else
    {
      v34 = _PTLogSystem();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
        -[PTPersonSemanticsNetwork initWithMetalContext:effectUtil:sharedResources:]();
      }
    }
    v31 = 0;
    goto LABEL_53;
  }
  v31 = 0;
LABEL_55:

  return v31;
}

- (id)espressoFileURLFor:(id)a3 prefix:(id)a4 chipId:(id)a5
{
  if (a5)
  {
    v5 = [NSString stringWithFormat:@"%@/%@.%@.espresso.net", a3, a4, a5];
    v6 = [MEMORY[0x1E4F28CB8] defaultManager];
    int v7 = [v6 fileExistsAtPath:v5];

    if (v7) {
      id v8 = v5;
    }
    else {
      id v8 = 0;
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)outSkinMask
{
  return self->_outSkinMask;
}

- (id)outPersonMask
{
  return self->_outPersonMask;
}

- (unsigned)executeNetwork:(id)a3
{
  id v4 = a3;
  kdebug_trace();
  executor = self->_executor;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __43__PTPersonSemanticsNetwork_executeNetwork___block_invoke;
  v7[3] = &unk_1E6884200;
  v7[4] = self;
  LODWORD(self) = [(PTEspressoGenericExecutor *)executor executeAsync:v7 metalContext:v4];

  return self;
}

void __43__PTPersonSemanticsNetwork_executeNetwork___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(*(void *)(a1 + 32) + 16) commandQueue];
  [v1 hash];
  kdebug_trace();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_effectUtil, 0);
  objc_storeStrong((id *)&self->_inRGBAName, 0);
  objc_storeStrong((id *)&self->_outPersonMask, 0);
  objc_storeStrong((id *)&self->_outSkinMask, 0);
  objc_storeStrong((id *)&self->_inRGBA, 0);
  objc_storeStrong((id *)&self->_metalContext, 0);

  objc_storeStrong((id *)&self->_executor, 0);
}

- (void)initWithMetalContext:effectUtil:sharedResources:.cold.1()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3_2(&dword_1D0778000, v0, v1, "personsemantics not found", v2, v3, v4, v5, v6);
}

- (void)initWithMetalContext:(uint64_t)a3 effectUtil:(uint64_t)a4 sharedResources:(uint64_t)a5 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMetalContext:effectUtil:sharedResources:.cold.3()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3_2(&dword_1D0778000, v0, v1, "Error PTEspressoGenericExecutor init nil", v2, v3, v4, v5, v6);
}

- (void)initWithMetalContext:(uint64_t)a3 effectUtil:(uint64_t)a4 sharedResources:(uint64_t)a5 .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMetalContext:(uint64_t)a3 effectUtil:(uint64_t)a4 sharedResources:(uint64_t)a5 .cold.5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMetalContext:(uint64_t)a3 effectUtil:(uint64_t)a4 sharedResources:(uint64_t)a5 .cold.6(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMetalContext:effectUtil:sharedResources:.cold.7()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3_2(&dword_1D0778000, v0, v1, "Cannot find personsemantics network. Using file search to find network", v2, v3, v4, v5, v6);
}

- (void)initWithMetalContext:effectUtil:sharedResources:.cold.8()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3_2(&dword_1D0778000, v0, v1, "ANE not found", v2, v3, v4, v5, v6);
}

@end