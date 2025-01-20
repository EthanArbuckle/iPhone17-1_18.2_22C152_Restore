@interface OUSemanticSegmentation
- (BOOL)setupRotater:(id)a3;
- (OUSemanticSegmentation)init;
- (__CVBuffer)generateSemanticOnWideCameraWithFrame:(id)a3;
@end

@implementation OUSemanticSegmentation

- (OUSemanticSegmentation)init
{
  v6.receiver = self;
  v6.super_class = (Class)OUSemanticSegmentation;
  v2 = [(OUSemanticSegmentation *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->deviceOrientation = 0;
    *(_WORD *)&v2->_initRotater = 0;
    v4 = v2;
  }

  return v3;
}

- (BOOL)setupRotater:(id)a3
{
  id v4 = a3;
  if ([v4 semanticLabelBuffer])
  {
    if (!self->_initRotater)
    {
      uint64_t PixelFormatType = CVPixelBufferGetPixelFormatType((CVPixelBufferRef)[v4 colorBuffer]);
      uint64_t v6 = CVPixelBufferGetPixelFormatType((CVPixelBufferRef)[v4 semanticLabelBuffer]);
      size_t Width = CVPixelBufferGetWidth((CVPixelBufferRef)[v4 colorBuffer]);
      size_t Height = CVPixelBufferGetHeight((CVPixelBufferRef)[v4 colorBuffer]);
      v9 = -[OUCVPixelBufferRotate initForRotationDegree:resolution:pixelFormat:]([OUCVPixelBufferRotate alloc], "initForRotationDegree:resolution:pixelFormat:", 90, PixelFormatType, (float)Height, (float)Width);
      cvRotate90 = self->cvRotate90;
      self->cvRotate90 = v9;

      v11 = -[OUCVPixelBufferRotate initForRotationDegree:resolution:pixelFormat:]([OUCVPixelBufferRotate alloc], "initForRotationDegree:resolution:pixelFormat:", 270, v6, 256.0, 192.0);
      cvRotate90r = self->cvRotate90r;
      self->cvRotate90r = v11;

      v13 = -[OUCVPixelBufferRotate initForRotationDegree:resolution:pixelFormat:]([OUCVPixelBufferRotate alloc], "initForRotationDegree:resolution:pixelFormat:", 180, PixelFormatType, (float)Width, (float)Height);
      cvRotate180 = self->cvRotate180;
      self->cvRotate180 = v13;

      v15 = -[OUCVPixelBufferRotate initForRotationDegree:resolution:pixelFormat:]([OUCVPixelBufferRotate alloc], "initForRotationDegree:resolution:pixelFormat:", 180, v6, 256.0, 192.0);
      cvRotate180r = self->cvRotate180r;
      self->cvRotate180r = v15;

      v17 = -[OUCVPixelBufferRotate initForRotationDegree:resolution:pixelFormat:]([OUCVPixelBufferRotate alloc], "initForRotationDegree:resolution:pixelFormat:", 270, PixelFormatType, (float)Height, (float)Width);
      cvRotate270 = self->cvRotate270;
      self->cvRotate270 = v17;

      v19 = -[OUCVPixelBufferRotate initForRotationDegree:resolution:pixelFormat:]([OUCVPixelBufferRotate alloc], "initForRotationDegree:resolution:pixelFormat:", 90, v6, 256.0, 192.0);
      cvRotate270r = self->cvRotate270r;
      self->cvRotate270r = v19;

      self->_initRotater = 1;
    }
    if (self->_initSegModel
      && (int64_t deviceOrientation = self->deviceOrientation, deviceOrientation == [v4 deviceOrientation]))
    {
      BOOL v22 = 1;
    }
    else
    {
      self->int64_t deviceOrientation = [v4 deviceOrientation];
      v23 = (SISceneSegmentationNetworkConfiguration *)objc_alloc_init(MEMORY[0x263F66F38]);
      semanticConfig = self->semanticConfig;
      self->semanticConfig = v23;

      switch([v4 deviceOrientation])
      {
        case 1:
        case 2:
          [(SISceneSegmentationNetworkConfiguration *)self->semanticConfig setNetworkModeEnum:2];
          v25 = (SISceneSegmentationData *)objc_msgSend(objc_alloc(MEMORY[0x263F66F28]), "initWithOutputResolution:", 192.0, 256.0);
          break;
        case 3:
        case 4:
          [(SISceneSegmentationNetworkConfiguration *)self->semanticConfig setNetworkModeEnum:1];
          v25 = (SISceneSegmentationData *)objc_msgSend(objc_alloc(MEMORY[0x263F66F28]), "initWithOutputResolution:", 256.0, 192.0);
          break;
        default:
          v32 = _OULoggingGetOSLogForCategoryObjectUnderstanding();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG)) {
            -[OUSemanticSegmentation setupRotater:]();
          }

          goto LABEL_14;
      }
      semResultData = self->semResultData;
      self->semResultData = v25;

      self->semanticModel = [(SISceneSegmentationNetworkConfiguration *)self->semanticConfig networkModeEnum];
      [(SISceneSegmentationNetworkConfiguration *)self->semanticConfig setEngineType:1];
      [(SISceneSegmentationNetworkConfiguration *)self->semanticConfig setRunByE5RT:1];
      LODWORD(v27) = 1053609165;
      [(SISceneSegmentationNetworkConfiguration *)self->semanticConfig setUncertaintyThreshold:v27];
      [(SISceneSegmentationNetworkConfiguration *)self->semanticConfig setModelConfig:0];
      id v28 = objc_alloc(MEMORY[0x263F66F18]);
      BOOL v22 = 1;
      LODWORD(v29) = 1053609165;
      v30 = (SISceneSegmentationAlgorithm *)[v28 initWithComputeEngine:1 andNetworkConfiguration:0 uncertaintyThreshold:v29];
      siSceneSegmentationAlgorithm = self->siSceneSegmentationAlgorithm;
      self->siSceneSegmentationAlgorithm = v30;

      self->_initSegModel = 1;
    }
  }
  else
  {
LABEL_14:
    BOOL v22 = 0;
  }

  return v22;
}

- (__CVBuffer)generateSemanticOnWideCameraWithFrame:(id)a3
{
  id v4 = a3;
  if ([(OUSemanticSegmentation *)self setupRotater:v4])
  {
    uint64_t v5 = [v4 sceneColorBuffer];
    uint64_t v6 = _OULoggingGetOSLogForCategoryObjectUnderstanding();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[OUSemanticSegmentation generateSemanticOnWideCameraWithFrame:]();
    }

    uint64_t v7 = [v4 deviceOrientation];
    uint64_t v8 = 16;
    uint64_t v9 = 8;
    switch(v7)
    {
      case 1:
        goto LABEL_16;
      case 2:
        uint64_t v8 = 48;
        uint64_t v9 = 40;
        goto LABEL_16;
      case 3:
        siSceneSegmentationAlgorithm = self->siSceneSegmentationAlgorithm;
        IOSurfaceRef IOSurface = CVPixelBufferGetIOSurface((CVPixelBufferRef)[(SISceneSegmentationData *)self->semResultData semantic]);
        IOSurfaceRef v14 = CVPixelBufferGetIOSurface((CVPixelBufferRef)[(SISceneSegmentationData *)self->semResultData confidence]);
        [(SISceneSegmentationAlgorithm *)siSceneSegmentationAlgorithm runWithInput:v5 output:IOSurface confidenceOutput:v14 uncertaintyOutput:CVPixelBufferGetIOSurface((CVPixelBufferRef)[(SISceneSegmentationData *)self->semResultData uncertainty]) resampleOutput:1 networkConfiguration:1];
        v11 = (__CVBuffer *)[(SISceneSegmentationData *)self->semResultData semantic];
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
          -[OUSemanticSegmentation generateSemanticOnWideCameraWithFrame:]();
        }
        goto LABEL_14;
      case 4:
        uint64_t v8 = 32;
        uint64_t v9 = 24;
LABEL_16:
        v10 = *(id *)((char *)&self->super.isa + v9);
        id v15 = *(id *)((char *)&self->super.isa + v8);
        uint64_t v16 = [v10 rotateImage:v5];
        v17 = self->siSceneSegmentationAlgorithm;
        IOSurfaceRef v18 = CVPixelBufferGetIOSurface((CVPixelBufferRef)[(SISceneSegmentationData *)self->semResultData semantic]);
        IOSurfaceRef v19 = CVPixelBufferGetIOSurface((CVPixelBufferRef)[(SISceneSegmentationData *)self->semResultData confidence]);
        [(SISceneSegmentationAlgorithm *)v17 runWithInput:v16 output:v18 confidenceOutput:v19 uncertaintyOutput:CVPixelBufferGetIOSurface((CVPixelBufferRef)[(SISceneSegmentationData *)self->semResultData uncertainty]) resampleOutput:1 networkConfiguration:self->semanticModel];
        v11 = (__CVBuffer *)objc_msgSend(v15, "rotateImage:", -[SISceneSegmentationData semantic](self->semResultData, "semantic"));
        if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v21 = 0;
          _os_log_impl(&dword_237C17000, v6, OS_LOG_TYPE_INFO, "Generating semantic over wide (rotation) camera end", v21, 2u);
        }

        break;
      default:
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
          -[OUSemanticSegmentation generateSemanticOnWideCameraWithFrame:]();
        }
        v11 = 0;
LABEL_14:
        v10 = v6;
        break;
    }
  }
  else
  {
    v10 = _OULoggingGetOSLogForCategoryObjectUnderstanding();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[OUSemanticSegmentation generateSemanticOnWideCameraWithFrame:].cold.4();
    }
    v11 = 0;
  }

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->semResultData, 0);
  objc_storeStrong((id *)&self->semanticConfig, 0);
  objc_storeStrong((id *)&self->siSceneSegmentationAlgorithm, 0);
  objc_storeStrong((id *)&self->cvRotate270r, 0);
  objc_storeStrong((id *)&self->cvRotate270, 0);
  objc_storeStrong((id *)&self->cvRotate180r, 0);
  objc_storeStrong((id *)&self->cvRotate180, 0);
  objc_storeStrong((id *)&self->cvRotate90r, 0);
  objc_storeStrong((id *)&self->cvRotate90, 0);
}

- (void)setupRotater:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_237C17000, v0, v1, "frame.deviceOrientation is not supported.", v2, v3, v4, v5, v6);
}

- (void)generateSemanticOnWideCameraWithFrame:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_237C17000, v0, v1, "[Save ARFrame Error]: invalid device orientation. Skip data saving.", v2, v3, v4, v5, v6);
}

- (void)generateSemanticOnWideCameraWithFrame:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_237C17000, v0, v1, "Generating semantic over wide (left-landscape) camera end", v2, v3, v4, v5, v6);
}

- (void)generateSemanticOnWideCameraWithFrame:.cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_237C17000, v0, v1, "Generating semantic over wide camera starts", v2, v3, v4, v5, v6);
}

- (void)generateSemanticOnWideCameraWithFrame:.cold.4()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_237C17000, v0, v1, "SetupRotater fail", v2, v3, v4, v5, v6);
}

@end