@interface CMIColourConstancyRegistrationV1
- (CMIColourConstancyRegistrationV1)initWithMetalContext:(id)a3;
- (__n128)homography;
- (int)prepareToProcess:(int)a3;
- (int)purgeResources;
- (int)registerImage:(id)a3 referenceLumaTexture:(id)a4;
- (int)warpImage:(id)a3 outputWarpedTexture:(id)a4;
@end

@implementation CMIColourConstancyRegistrationV1

- (CMIColourConstancyRegistrationV1)initWithMetalContext:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CMIColourConstancyRegistrationV1;
  v6 = [(CMIColourConstancyRegistrationV1 *)&v11 init];
  v7 = (simd_float3 *)v6;
  if (v6 && v5)
  {
    objc_storeStrong((id *)&v6->_metalContext, a3);
    v7[2].i32[0] = 0;
    simd_float3 v8 = matrix_identity_float3x3.columns[1];
    v7[3] = matrix_identity_float3x3.columns[0];
    v7[4] = v8;
    v7[5] = matrix_identity_float3x3.columns[2];
    v9 = v7;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    FigSignalErrorAt();
    v9 = 0;
  }

  return v9;
}

- (int)purgeResources
{
  regWarpGPU = self->_regWarpGPU;
  self->_regWarpGPU = 0;

  warpStage = self->_warpStage;
  self->_warpStage = 0;

  return 0;
}

- (int)prepareToProcess:(int)a3
{
  self->_registrationProcessingType = a3;
  if (a3)
  {
    fig_log_get_emitter();
    goto LABEL_11;
  }
  long long v18 = 0u;
  memset(v17, 0, sizeof(v17));
  +[RegWarpPP getDefaults:v17];
  BYTE12(v18) = 0;
  DWORD1(v18) = 20;
  id v4 = objc_alloc((Class)FigRegWarpPPGPU);
  id v5 = [(FigMetalContext *)self->_metalContext commandQueue];
  v6 = (FigRegWarpPPGPU *)[v4 initWithOptionalCommandQueue:v5 config:v17];
  regWarpGPU = self->_regWarpGPU;
  self->_regWarpGPU = v6;

  if (!self->_regWarpGPU
    || ([(FigMetalContext *)self->_metalContext allocator],
        simd_float3 v8 = objc_claimAutoreleasedReturnValue(),
        v8,
        !v8))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return FigSignalErrorAt();
  }
  v9 = [(FigMetalContext *)self->_metalContext allocator];
  [(FigRegWarpPPGPU *)self->_regWarpGPU setAllocator:v9];

  int CFPreferenceNumberWithDefault = FigGetCFPreferenceNumberWithDefault();
  int result = 0;
  if (!CFPreferenceNumberWithDefault)
  {
    id v12 = objc_alloc((Class)CMIWarpStage);
    v13 = [(FigMetalContext *)self->_metalContext commandQueue];
    v14 = [(FigMetalContext *)self->_metalContext allocator];
    v15 = (CMIWarpStage *)[v12 initWithOptionalCommandQueue:v13 allocator:v14];
    warpStage = self->_warpStage;
    self->_warpStage = v15;

    if (self->_warpStage) {
      return 0;
    }
    fig_log_get_emitter();
LABEL_11:
    FigDebugAssert3();
    return 0;
  }
  return result;
}

- (int)registerImage:(id)a3 referenceLumaTexture:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  simd_float3 v8 = v7;
  int v9 = 0;
  int v17 = 0;
  memset(v16, 0, sizeof(v16));
  int v15 = 0;
  if (!self->_registrationProcessingType)
  {
    unsigned int v10 = -[FigRegWarpPPGPU allocateResources:imageHeight:imageFormat:externalMemory:externalMemorySize:](self->_regWarpGPU, "allocateResources:imageHeight:imageFormat:externalMemory:externalMemorySize:", [v7 width], objc_msgSend(v7, "height"), objc_msgSend(v7, "pixelFormat"), 0, 0);
    if (v10)
    {
      int v9 = v10;
      fig_log_get_emitter();
    }
    else
    {
      unsigned int v11 = [(FigRegWarpPPGPU *)self->_regWarpGPU processReferenceTexture:v8 regionOfInterest:0 numKeypoints:&v15];
      if (v11)
      {
        int v9 = v11;
        fig_log_get_emitter();
      }
      else
      {
        int v9 = [(FigRegWarpPPGPU *)self->_regWarpGPU processNonReferenceTexture:v6 outputTransform:v16];
        if (!v9)
        {
          HIDWORD(v12) = HIDWORD(v16[0]);
          long long v13 = *(_OWORD *)((char *)v16 + 12);
          *(_OWORD *)&self[1].super.isa = v16[0];
          *(_OWORD *)&self[1]._regWarpGPU = v13;
          *(void *)&long long v12 = *((void *)&v16[1] + 1);
          DWORD2(v12) = v17;
          *(_OWORD *)&self[1]._registrationProcessingType = v12;
          [(FigRegWarpPPGPU *)self->_regWarpGPU releaseResources];
          goto LABEL_6;
        }
        fig_log_get_emitter();
      }
    }
    FigDebugAssert3();
  }
LABEL_6:

  return v9;
}

- (int)warpImage:(id)a3 outputWarpedTexture:(id)a4
{
  int v4 = -[CMIWarpStage runWarpUsingTransform:inputTex:outputTex:](self->_warpStage, "runWarpUsingTransform:inputTex:outputTex:", a3, a4, *(double *)&self[1].super.isa, *(double *)&self[1]._regWarpGPU, *(double *)&self[1]._registrationProcessingType);
  if (v4)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }
  return v4;
}

- (__n128)homography
{
  return a1[3];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_warpStage, 0);
  objc_storeStrong((id *)&self->_regWarpGPU, 0);

  objc_storeStrong((id *)&self->_metalContext, 0);
}

@end