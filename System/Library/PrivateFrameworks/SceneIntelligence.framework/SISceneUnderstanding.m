@interface SISceneUnderstanding
+ (CGSize)inputResolution;
- (BOOL)initMLNetworkWithComputeEngine:(int64_t)a3;
- (SISceneUnderstanding)initWithComputeEngine:(int64_t)a3;
- (_SITensorDim)labelTensorDimensions;
- (_SITensorDim)normalTensorDimensions;
- (_SITensorDim)probabilitiesTensorDimensions;
- (int64_t)evaluateImage:(__CVBuffer *)a3 results:(id)a4;
- (void)dealloc;
@end

@implementation SISceneUnderstanding

- (SISceneUnderstanding)initWithComputeEngine:(int64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SISceneUnderstanding;
  v4 = [(SISceneUnderstanding *)&v8 init];
  v5 = v4;
  if (v4 && [(SISceneUnderstanding *)v4 initMLNetworkWithComputeEngine:a3])
  {
    v5->_parameters.input.resolution = (CGSize)kSISceneUnderstandingNetworkResolution;
    v5->_parameters.output = (outputparams_t)kSISceneUnderstandingNetworkResolution;
    *(_OWORD *)&v5->_parameters.input.preprocessor.bias_r = xmmword_21B6CAB50;
    v5->_parameters.input.preprocessor.network_wants_bgr = 0;
    v6 = v5;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (CGSize)inputResolution
{
  double v2 = 256.0;
  double v3 = 192.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (_SITensorDim)labelTensorDimensions
{
  long long v3 = *(_OWORD *)&self[4].value[2];
  *(_OWORD *)retstr->value = *(_OWORD *)self[4].value;
  *(_OWORD *)&retstr->value[2] = v3;
  return self;
}

- (_SITensorDim)normalTensorDimensions
{
  long long v3 = *(_OWORD *)&self[5].value[2];
  *(_OWORD *)retstr->value = *(_OWORD *)self[5].value;
  *(_OWORD *)&retstr->value[2] = v3;
  return self;
}

- (_SITensorDim)probabilitiesTensorDimensions
{
  long long v3 = *(_OWORD *)&self[6].value[2];
  *(_OWORD *)retstr->value = *(_OWORD *)self[6].value;
  *(_OWORD *)&retstr->value[2] = v3;
  return self;
}

- (BOOL)initMLNetworkWithComputeEngine:(int64_t)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  context = (void *)espresso_create_context();
  self->_context = context;
  if (!context) {
    return 0;
  }
  Espresso::get_internal_context(&v26, (Espresso *)context, v5);
  *(_DWORD *)(v26 + 68) = 1;
  self->_plan = (void *)espresso_create_plan();
  v6 = +[SIMSceneUnderstanding compiledModelPath];
  v7 = v6;
  if (!v6)
  {
    objc_super v8 = __SceneIntelligenceLogSharedInstance();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = [0 UTF8String];
      *(_DWORD *)buf = 136381187;
      *(void *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Features/SceneUnderstanding/SI"
                           "SceneUnderstanding.mm";
      *(_WORD *)&buf[12] = 1025;
      *(_DWORD *)&buf[14] = 348;
      *(_WORD *)&buf[18] = 2081;
      *(void *)&buf[20] = v12;
      _os_log_impl(&dword_21B697000, v8, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Could not load network %{private}s ***", buf, 0x1Cu);
    }
    goto LABEL_47;
  }
  objc_super v8 = [v6 stringByAppendingPathComponent:@"model.espresso.net"];
  [v8 UTF8String];
  if (espresso_plan_add_network())
  {
    v9 = __SceneIntelligenceLogSharedInstance();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = [v7 UTF8String];
      *(_DWORD *)buf = 136381187;
      *(void *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Features/SceneUnderstanding/SI"
                           "SceneUnderstanding.mm";
      *(_WORD *)&buf[12] = 1025;
      *(_DWORD *)&buf[14] = 357;
      *(_WORD *)&buf[18] = 2081;
      *(void *)&buf[20] = v10;
      _os_log_impl(&dword_21B697000, v9, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Could not add espresso network %{private}s ***", buf, 0x1Cu);
    }
    goto LABEL_46;
  }
  if (espresso_plan_build())
  {
    v9 = __SceneIntelligenceLogSharedInstance();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = [v7 UTF8String];
      *(_DWORD *)buf = 136381187;
      *(void *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Features/SceneUnderstanding/SI"
                           "SceneUnderstanding.mm";
      *(_WORD *)&buf[12] = 1025;
      *(_DWORD *)&buf[14] = 363;
      *(_WORD *)&buf[18] = 2081;
      *(void *)&buf[20] = v13;
      _os_log_impl(&dword_21B697000, v9, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Could not build espresso plan %{private}s ***", buf, 0x1Cu);
    }
    goto LABEL_46;
  }
  memset(buf, 0, 32);
  [kSIMSceneUnderstandingInputTensorName UTF8String];
  if (espresso_network_query_blob_dimensions())
  {
    v9 = __SceneIntelligenceLogSharedInstance();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = [v7 UTF8String];
      *(_DWORD *)v28 = 136381187;
      v29 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Features/SceneUnderstanding/SISceneUnderstanding.mm";
      __int16 v30 = 1025;
      int v31 = 370;
      __int16 v32 = 2081;
      uint64_t v33 = v14;
      v15 = " %{private}s:%{private}d *** Failure to bind input tensor for scene understanding %{private}s ***";
LABEL_45:
      _os_log_impl(&dword_21B697000, v9, OS_LOG_TYPE_ERROR, v15, v28, 0x1Cu);
    }
  }
  else
  {
    [kSIMSceneUnderstandingOutputLabelsTensorName UTF8String];
    if (espresso_network_query_blob_dimensions())
    {
      v9 = __SceneIntelligenceLogSharedInstance();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        uint64_t v16 = [v7 UTF8String];
        *(_DWORD *)v28 = 136381187;
        v29 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Features/SceneUnderstanding/SISceneUnderstanding.mm";
        __int16 v30 = 1025;
        int v31 = 376;
        __int16 v32 = 2081;
        uint64_t v33 = v16;
        v15 = " %{private}s:%{private}d *** Failure to determine output tensor shape for scene understanding %{private}s ***";
        goto LABEL_45;
      }
    }
    else
    {
      [kSIMSceneUnderstandingOutputNormalsTensorName UTF8String];
      if (espresso_network_query_blob_dimensions())
      {
        v9 = __SceneIntelligenceLogSharedInstance();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          uint64_t v17 = [v7 UTF8String];
          *(_DWORD *)v28 = 136381187;
          v29 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Features/SceneUnderstanding/SISceneUnderstanding.mm";
          __int16 v30 = 1025;
          int v31 = 382;
          __int16 v32 = 2081;
          uint64_t v33 = v17;
          v15 = " %{private}s:%{private}d *** Failure to determine output tensor shape for scene understanding %{private}s ***";
          goto LABEL_45;
        }
      }
      else
      {
        [kSIMSceneUnderstandingOutputProbabilitiesTensorName UTF8String];
        if (espresso_network_query_blob_dimensions())
        {
          v9 = __SceneIntelligenceLogSharedInstance();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          {
            uint64_t v18 = [v7 UTF8String];
            *(_DWORD *)v28 = 136381187;
            v29 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Features/SceneUnderstanding/SISceneUnderstanding.mm";
            __int16 v30 = 1025;
            int v31 = 388;
            __int16 v32 = 2081;
            uint64_t v33 = v18;
            v15 = " %{private}s:%{private}d *** Failure to determine output tensor shape for scene understanding %{private}s ***";
            goto LABEL_45;
          }
        }
        else if (*(void *)buf == self->_variables.output.labels.value[0])
        {
          if (*(void *)&buf[8] == self->_variables.output.labels.value[1])
          {
            if (*(void *)&buf[16] == 3)
            {
              if (self->_variables.output.labels.value[2] == 1)
              {
                if (*(void *)&buf[24] == self->_variables.output.labels.value[3])
                {
                  if (*(void *)&buf[8] == 192)
                  {
                    BOOL v11 = 1;
                    goto LABEL_48;
                  }
                  v9 = __SceneIntelligenceLogSharedInstance();
                  if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
                    goto LABEL_46;
                  }
                  uint64_t v24 = [v7 UTF8String];
                  *(_DWORD *)v28 = 136381187;
                  v29 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Features/SceneUnderstanding/SISce"
                        "neUnderstanding.mm";
                  __int16 v30 = 1025;
                  int v31 = 423;
                  __int16 v32 = 2081;
                  uint64_t v33 = v24;
                  v15 = " %{private}s:%{private}d *** Input-Output channel [1] not expected size %{private}s ***";
                  goto LABEL_45;
                }
                v9 = __SceneIntelligenceLogSharedInstance();
                if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
                {
                  uint64_t v23 = [v7 UTF8String];
                  *(_DWORD *)v28 = 136381187;
                  v29 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Features/SceneUnderstanding/SISce"
                        "neUnderstanding.mm";
                  __int16 v30 = 1025;
                  int v31 = 413;
                  __int16 v32 = 2081;
                  uint64_t v33 = v23;
                  v15 = " %{private}s:%{private}d *** Input-Output channel [3] size mismatch %{private}s ***";
                  goto LABEL_45;
                }
              }
              else
              {
                v9 = __SceneIntelligenceLogSharedInstance();
                if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
                {
                  uint64_t v22 = [v7 UTF8String];
                  *(_DWORD *)v28 = 136381187;
                  v29 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Features/SceneUnderstanding/SISce"
                        "neUnderstanding.mm";
                  __int16 v30 = 1025;
                  int v31 = 408;
                  __int16 v32 = 2081;
                  uint64_t v33 = v22;
                  v15 = " %{private}s:%{private}d *** Output channel [2] size mismatch %{private}s ***";
                  goto LABEL_45;
                }
              }
            }
            else
            {
              v9 = __SceneIntelligenceLogSharedInstance();
              if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
              {
                uint64_t v21 = [v7 UTF8String];
                *(_DWORD *)v28 = 136381187;
                v29 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Features/SceneUnderstanding/SIScene"
                      "Understanding.mm";
                __int16 v30 = 1025;
                int v31 = 403;
                __int16 v32 = 2081;
                uint64_t v33 = v21;
                v15 = " %{private}s:%{private}d *** Input channel [2] size mismatch %{private}s ***";
                goto LABEL_45;
              }
            }
          }
          else
          {
            v9 = __SceneIntelligenceLogSharedInstance();
            if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
            {
              uint64_t v20 = [v7 UTF8String];
              *(_DWORD *)v28 = 136381187;
              v29 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Features/SceneUnderstanding/SISceneUnderstanding.mm";
              __int16 v30 = 1025;
              int v31 = 398;
              __int16 v32 = 2081;
              uint64_t v33 = v20;
              v15 = " %{private}s:%{private}d *** Input-Output channel [1] size mismatch %{private}s ***";
              goto LABEL_45;
            }
          }
        }
        else
        {
          v9 = __SceneIntelligenceLogSharedInstance();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          {
            uint64_t v19 = [v7 UTF8String];
            *(_DWORD *)v28 = 136381187;
            v29 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Features/SceneUnderstanding/SISceneUnderstanding.mm";
            __int16 v30 = 1025;
            int v31 = 393;
            __int16 v32 = 2081;
            uint64_t v33 = v19;
            v15 = " %{private}s:%{private}d *** Input-Output channel [0] size mismatch %{private}s ***";
            goto LABEL_45;
          }
        }
      }
    }
  }
LABEL_46:

LABEL_47:
  BOOL v11 = 0;
LABEL_48:

  if (v27) {
    std::__shared_weak_count::__release_shared[abi:nn180100](v27);
  }
  return v11;
}

- (int64_t)evaluateImage:(__CVBuffer *)a3 results:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a4;
  size_t Width = CVPixelBufferGetWidth(a3);
  size_t Height = CVPixelBufferGetHeight(a3);
  kdebug_trace();
  if (Width != 256 || Height != 192)
  {
    objc_super v8 = __SceneIntelligenceLogSharedInstance();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v16 = 136380931;
      uint64_t v17 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Features/SceneUnderstanding/SISceneUnderstanding.mm";
      __int16 v18 = 1025;
      int v19 = 439;
      _os_log_impl(&dword_21B697000, v8, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Unexpected input resolution ***", (uint8_t *)&v16, 0x12u);
    }
    goto LABEL_10;
  }
  if (CVPixelBufferGetPixelFormatType(a3) == 1111970369)
  {
    [kSIMSceneUnderstandingInputTensorName UTF8String];
    if (espresso_network_bind_cvpixelbuffer())
    {
      objc_super v8 = __SceneIntelligenceLogSharedInstance();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        int v16 = 136380931;
        uint64_t v17 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Features/SceneUnderstanding/SISceneUnderstanding.mm";
        __int16 v18 = 1025;
        int v19 = 454;
        _os_log_impl(&dword_21B697000, v8, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Failure to bind network image to espresso input ***", (uint8_t *)&v16, 0x12u);
      }
LABEL_10:

      kdebug_trace();
      int64_t v9 = 1;
      goto LABEL_25;
    }
    [kSIMSceneUnderstandingOutputLabelsTensorName UTF8String];
    [v5 labelsTensor];
    if (espresso_network_bind_buffer())
    {
      BOOL v11 = __SceneIntelligenceLogSharedInstance();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        int v16 = 136380931;
        uint64_t v17 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Features/SceneUnderstanding/SISceneUnderstanding.mm";
        __int16 v18 = 1025;
        int v19 = 461;
        uint64_t v12 = " %{private}s:%{private}d *** Failure to bind output labels tensor for scene understanding ***";
LABEL_23:
        _os_log_impl(&dword_21B697000, v11, OS_LOG_TYPE_ERROR, v12, (uint8_t *)&v16, 0x12u);
        goto LABEL_24;
      }
      goto LABEL_24;
    }
    [kSIMSceneUnderstandingOutputProbabilitiesTensorName UTF8String];
    [v5 probabilitiesTensor];
    if (espresso_network_bind_buffer())
    {
      BOOL v11 = __SceneIntelligenceLogSharedInstance();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        int v16 = 136380931;
        uint64_t v17 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Features/SceneUnderstanding/SISceneUnderstanding.mm";
        __int16 v18 = 1025;
        int v19 = 468;
        uint64_t v12 = " %{private}s:%{private}d *** Failure to bind output probabilities tensor for scene understanding ***";
        goto LABEL_23;
      }
LABEL_24:

      kdebug_trace();
      int64_t v9 = 3;
      goto LABEL_25;
    }
    [kSIMSceneUnderstandingOutputNormalsTensorName UTF8String];
    [v5 normalsTensor];
    if (espresso_network_bind_buffer())
    {
      BOOL v11 = __SceneIntelligenceLogSharedInstance();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        int v16 = 136380931;
        uint64_t v17 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Features/SceneUnderstanding/SISceneUnderstanding.mm";
        __int16 v18 = 1025;
        int v19 = 475;
        uint64_t v12 = " %{private}s:%{private}d *** Failure to bind output normals tensor for scene understanding ***";
        goto LABEL_23;
      }
      goto LABEL_24;
    }
    kdebug_trace();
    int v14 = espresso_plan_execute_sync();
    kdebug_trace();
    if (v14)
    {
      v15 = __SceneIntelligenceLogSharedInstance();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        int v16 = 136380931;
        uint64_t v17 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Features/SceneUnderstanding/SISceneUnderstanding.mm";
        __int16 v18 = 1025;
        int v19 = 484;
        _os_log_impl(&dword_21B697000, v15, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Failure to run network ***", (uint8_t *)&v16, 0x12u);
      }

      kdebug_trace();
      int64_t v9 = 4;
    }
    else
    {
      kdebug_trace();
      int64_t v9 = 0;
    }
  }
  else
  {
    uint64_t v10 = __SceneIntelligenceLogSharedInstance();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v16 = 136380931;
      uint64_t v17 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Features/SceneUnderstanding/SISceneUnderstanding.mm";
      __int16 v18 = 1025;
      int v19 = 446;
      _os_log_impl(&dword_21B697000, v10, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Unexpected input pixel format ***", (uint8_t *)&v16, 0x12u);
    }

    kdebug_trace();
    int64_t v9 = 2;
  }
LABEL_25:

  return v9;
}

- (void)dealloc
{
  espresso_plan_destroy();
  espresso_context_destroy();
  v3.receiver = self;
  v3.super_class = (Class)SISceneUnderstanding;
  [(SISceneUnderstanding *)&v3 dealloc];
}

@end