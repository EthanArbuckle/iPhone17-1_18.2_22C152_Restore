@interface PTFaceAttributesNetwork
- (PTFaceAttributesNetwork)init;
- (id)createRequest;
- (id)faceLandmarksInPixelBuffer:(__CVBuffer *)a3 faceRects:(id)a4 orientation:(unsigned int)a5;
- (void)createRequest;
- (void)init;
@end

@implementation PTFaceAttributesNetwork

- (PTFaceAttributesNetwork)init
{
  v49[1] = *MEMORY[0x1E4F143B8];
  v48.receiver = self;
  v48.super_class = (Class)PTFaceAttributesNetwork;
  v2 = [(PTFaceAttributesNetwork *)&v48 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    session = v2->_session;
    v2->_session = (VNSession *)v3;

    uint64_t v5 = [(PTFaceAttributesNetwork *)v2 createRequest];
    v6 = (void *)v5;
    if (v5)
    {
      v7 = v2->_session;
      v49[0] = v5;
      v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v49 count:1];
      id v47 = 0;
      char v9 = [(VNSession *)v7 prepareForPerformingRequests:v8 error:&v47];
      id v10 = v47;

      if ((v9 & 1) == 0)
      {
        v11 = _PTLogSystem();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          [(PTFaceAttributesNetwork *)(uint64_t)v10 init];
        }
      }
      uint64_t v18 = [objc_alloc(MEMORY[0x1E4F45960]) initWithSession:v2->_session];
      handler = v2->_handler;
      v2->_handler = (VNSequenceRequestHandler *)v18;

      if (v2->_handler)
      {
        v20 = MLAllComputeDevices();
        uint64_t v21 = [v20 indexOfObjectPassingTest:&__block_literal_global_7];
        if (v21 == 0x7FFFFFFFFFFFFFFFLL)
        {
          aneDevice = _PTLogSystem();
          if (os_log_type_enabled(aneDevice, OS_LOG_TYPE_ERROR)) {
            [(PTCVMNetwork *)aneDevice initWithMetalContext:v24 colorSize:v25 effectUtil:v26 util:v27 useHighResNetwork:v28 sharedResources:v29];
          }
        }
        else
        {
          uint64_t v45 = [v20 objectAtIndexedSubscript:v21];
          aneDevice = v2->_aneDevice;
          v2->_aneDevice = (MLComputeDeviceProtocol *)v45;
        }

        v30 = v2;
        goto LABEL_20;
      }
      v20 = _PTLogSystem();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        [(PTFaceAttributesNetwork *)v20 init];
      }
    }
    else
    {
      v20 = _PTLogSystem();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        [(PTFaceAttributesNetwork *)v20 init];
      }
      id v10 = 0;
    }
    v30 = 0;
LABEL_20:

    goto LABEL_21;
  }
  v30 = 0;
LABEL_21:

  return v30;
}

- (id)createRequest
{
  uint64_t v3 = objc_opt_new();
  v4 = +[PTInference ANEConfigForAsynchronousWork];
  objc_msgSend(v3, "setModelExecutionPriority:", objc_msgSend(v4, "VNRequestModelExecutionPriority"));

  id v24 = 0;
  char v5 = [v3 setRevision:3737841669 error:&v24];
  id v6 = v24;
  if ((v5 & 1) == 0)
  {
    v7 = _PTLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      [(PTFaceAttributesNetwork *)(uint64_t)v6 createRequest];
    }
  }
  uint64_t v14 = [MEMORY[0x1E4F458E8] defaultANEDevice];
  if (v14)
  {
    [v3 setComputeDevice:self->_aneDevice forComputeStage:*MEMORY[0x1E4F45BB8]];
    [v3 setComputeDevice:self->_aneDevice forComputeStage:*MEMORY[0x1E4F45BC0]];
  }
  else
  {
    uint64_t v15 = _PTLogSystem();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      [(PTFaceAttributesNetwork *)v15 createRequest];
    }
  }

  return v3;
}

uint64_t __31__PTFaceAttributesNetwork_init__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)faceLandmarksInPixelBuffer:(__CVBuffer *)a3 faceRects:(id)a4 orientation:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  v24[1] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  uint64_t v9 = [(PTFaceAttributesNetwork *)self createRequest];
  [v9 setInputFaceObservations:v8];

  if (v9)
  {
    handler = self->_handler;
    v24[0] = v9;
    uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];
    id v23 = 0;
    LODWORD(handler) = [(VNSequenceRequestHandler *)handler performRequests:v11 onCVPixelBuffer:a3 orientation:v5 error:&v23];
    id v12 = v23;

    if (handler)
    {
      uint64_t v13 = [v9 results];
      goto LABEL_8;
    }
  }
  else
  {
    uint64_t v14 = _PTLogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[PTFaceAttributesNetwork faceLandmarksInPixelBuffer:faceRects:orientation:](v14, v15, v16, v17, v18, v19, v20, v21);
    }

    id v12 = 0;
  }
  uint64_t v13 = 0;
LABEL_8:

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_aneDevice, 0);
  objc_storeStrong((id *)&self->_session, 0);

  objc_storeStrong((id *)&self->_handler, 0);
}

- (void)init
{
}

- (void)createRequest
{
}

- (void)faceLandmarksInPixelBuffer:(uint64_t)a3 faceRects:(uint64_t)a4 orientation:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end