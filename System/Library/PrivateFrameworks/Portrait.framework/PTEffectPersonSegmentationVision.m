@interface PTEffectPersonSegmentationVision
+ ($F99D9A4FB75BC57F3386B8DC8EE08D7A)segmentationSizeForColorSize:(SEL)a3;
- (PTEffectPersonSegmentationVision)initWithMetalContext:(id)a3 colorSize:(CGSize)a4;
- (id)debugTextures;
- (id)runPersonSegmentationForPixelBuffer:(__CVBuffer *)a3;
- (unsigned)reset;
@end

@implementation PTEffectPersonSegmentationVision

- (PTEffectPersonSegmentationVision)initWithMetalContext:(id)a3 colorSize:(CGSize)a4
{
  id v6 = a3;
  v30.receiver = self;
  v30.super_class = (Class)PTEffectPersonSegmentationVision;
  v7 = [(PTEffectPersonSegmentationVision *)&v30 init];
  v8 = v7;
  if (!v7) {
    goto LABEL_10;
  }
  objc_storeStrong((id *)&v7->_metalContext, a3);
  v9 = (VNSession *)objc_alloc_init(MEMORY[0x1E4F45968]);
  visionSession = v8->_visionSession;
  v8->_visionSession = v9;

  if (!v8->_visionSession)
  {
    v14 = _PTLogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[PTEffectPersonSegmentationVision initWithMetalContext:colorSize:](v14, v15, v16, v17, v18, v19, v20, v21);
    }
    goto LABEL_9;
  }
  uint64_t v11 = [objc_alloc(MEMORY[0x1E4F45960]) initWithSession:v8->_visionSession];
  visionRequestHandler = v8->_visionRequestHandler;
  v8->_visionRequestHandler = (VNSequenceRequestHandler *)v11;

  if (!v8->_visionRequestHandler)
  {
    v14 = _PTLogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[PTEffectPersonSegmentationVision initWithMetalContext:colorSize:](v14, v22, v23, v24, v25, v26, v27, v28);
    }
LABEL_9:

LABEL_10:
    v13 = 0;
    goto LABEL_11;
  }
  v13 = v8;
LABEL_11:

  return v13;
}

+ ($F99D9A4FB75BC57F3386B8DC8EE08D7A)segmentationSizeForColorSize:(SEL)a3
{
  *(_OWORD *)&retstr->var0 = xmmword_1D0820250;
  retstr->var2 = 1;
  return result;
}

- (id)runPersonSegmentationForPixelBuffer:(__CVBuffer *)a3
{
  v25[1] = *MEMORY[0x1E4F143B8];
  v5 = (VNGeneratePersonSegmentationRequest *)objc_opt_new();
  personSegmentationRequest = self->_personSegmentationRequest;
  self->_personSegmentationRequest = v5;

  v7 = +[PTInference ANEConfigForSynchronousWork];
  -[VNGeneratePersonSegmentationRequest setModelExecutionPriority:](self->_personSegmentationRequest, "setModelExecutionPriority:", [v7 VNRequestModelExecutionPriority]);

  [(VNGeneratePersonSegmentationRequest *)self->_personSegmentationRequest setQualityLevel:1];
  [(VNGeneratePersonSegmentationRequest *)self->_personSegmentationRequest setOutputPixelFormat:1278226488];
  visionRequestHandler = self->_visionRequestHandler;
  v25[0] = self->_personSegmentationRequest;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:1];
  id v24 = 0;
  LOBYTE(visionRequestHandler) = [(VNSequenceRequestHandler *)visionRequestHandler performRequests:v9 onCVPixelBuffer:a3 error:&v24];
  id v10 = v24;

  if ((visionRequestHandler & 1) == 0)
  {
    uint64_t v11 = _PTLogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[PTEffectPersonSegmentationVision runPersonSegmentationForPixelBuffer:]((uint64_t)v10, v11, v12, v13, v14, v15, v16, v17);
    }
  }
  uint64_t v18 = [(VNGeneratePersonSegmentationRequest *)self->_personSegmentationRequest results];
  if ([v18 count])
  {
    uint64_t v19 = [v18 objectAtIndexedSubscript:0];
    uint64_t v20 = [v19 pixelBuffer];
    uint64_t v21 = [(PTMetalContext *)self->_metalContext device];
    uint64_t v22 = +[PTPixelBufferUtil createTextureFromPixelBuffer:v20 device:v21];
  }
  else
  {
    uint64_t v22 = 0;
  }

  return v22;
}

- (id)debugTextures
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (unsigned)reset
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personSegmentationRequest, 0);
  objc_storeStrong((id *)&self->_visionRequestHandler, 0);
  objc_storeStrong((id *)&self->_visionSession, 0);

  objc_storeStrong((id *)&self->_metalContext, 0);
}

- (void)initWithMetalContext:(uint64_t)a3 colorSize:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMetalContext:(uint64_t)a3 colorSize:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)runPersonSegmentationForPixelBuffer:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end