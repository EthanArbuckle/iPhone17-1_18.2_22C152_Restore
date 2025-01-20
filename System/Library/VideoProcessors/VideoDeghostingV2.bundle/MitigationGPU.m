@interface MitigationGPU
- (MitigationGPU)initWithMetalToolBox:(id)a3 metalContext:(id)a4 imageDimensions:(id)a5;
- (int)_compileShaders;
- (signed)roiClusterCnt;
- (void)_commitCmdBuffer:(id)a3 waitForComplete:(BOOL)a4;
- (void)_encodeFuseYUVToCommandBuffer:(id)a3 inputTexture:(id)a4 temporalMitTexture:(id)a5 spatialMitTexture:(id)a6 outputTexture:(id)a7 metaBuf:(id)a8;
- (void)_encodeSpatialTemporalRepairYUVToCommandBuffer:(__n128)a3 input:(__n128)a4 strongRepairSpatial:(__n128)a5 frRef0:(__n128)a6 frRef1:(__n128)a7 trRef0:(uint64_t)a8 trRef1:(void *)a9 hmgrphy0:(void *)a10 hmgrphy1:(void *)a11 spatialOutput:(void *)a12 temporalOutput:(void *)a13 strongTempOutput:(void *)a14 inputCopy:(id)a15 metaBuf:(id)a16 ref0MetaBuf:(id)a17 ref1MetaBuf:(id)a18;
- (void)dealloc;
- (void)setRoiClusterCnt:(signed __int16)a3;
- (void)spatialTemporalRepairThenFuseInplaceYUVInput:(double)a3 frRef0:(double)a4 frRef1:(double)a5 trRef0:(double)a6 trRef1:(double)a7 hmgrphy0:(uint64_t)a8 hmgrphy1:(void *)a9 metaBuf:(void *)a10 ref0MetaBuf:(void *)a11 ref1MetaBuf:(void *)a12 trInput:(void *)a13 waitForComplete:(void *)a14;
@end

@implementation MitigationGPU

- (MitigationGPU)initWithMetalToolBox:(id)a3 metalContext:(id)a4 imageDimensions:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = v9;
  if (!v8 || !v9)
  {
    fig_log_get_emitter();
LABEL_16:
    FigDebugAssert3();
LABEL_17:
    v25 = 0;
    goto LABEL_12;
  }
  v27.receiver = self;
  v27.super_class = (Class)MitigationGPU;
  v11 = [(MitigationGPU *)&v27 init];
  self = v11;
  if (!v11) {
    goto LABEL_17;
  }
  objc_storeStrong((id *)&v11->_metalToolbox, a3);
  objc_storeStrong((id *)&self->_metalContext, a4);
  v12 = [v10 device];
  device = self->_device;
  self->_device = v12;

  v14 = [v10 commandQueue];
  commandQueue = self->_commandQueue;
  self->_commandQueue = v14;

  if ([(MitigationGPU *)self _compileShaders]) {
    goto LABEL_17;
  }
  *(_WORD *)&self->_forceWaitForComplete = 0;
  PixelBuffer = (__CVBuffer *)CreatePixelBuffer();
  self->_temporalMitigated = PixelBuffer;
  if (!PixelBuffer) {
    goto LABEL_15;
  }
  v17 = (__CVBuffer *)CreatePixelBuffer();
  self->_spatialMitigated = v17;
  if (!v17) {
    goto LABEL_15;
  }
  v18 = (__CVBuffer *)CreatePixelBuffer();
  self->_inputCopy = v18;
  if (!v18) {
    goto LABEL_15;
  }
  sub_10550(self->_temporalMitigated, self->_metalContext, 0, 0);
  v19 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
  temporalMitigatedTexture = self->_temporalMitigatedTexture;
  self->_temporalMitigatedTexture = v19;

  if (!self->_temporalMitigatedTexture) {
    goto LABEL_15;
  }
  sub_10550(self->_spatialMitigated, self->_metalContext, 0, 0);
  v21 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
  spatialMitigatedTexture = self->_spatialMitigatedTexture;
  self->_spatialMitigatedTexture = v21;

  if (!self->_spatialMitigatedTexture
    || (sub_10550(self->_inputCopy, self->_metalContext, 0, 0),
        v23 = (MTLTexture *)objc_claimAutoreleasedReturnValue(),
        inputCopyTexture = self->_inputCopyTexture,
        self->_inputCopyTexture = v23,
        inputCopyTexture,
        !self->_inputCopyTexture))
  {
LABEL_15:
    fig_log_get_emitter();
    goto LABEL_16;
  }
  self->_roiClusterCnt = 0;
  self = self;
  v25 = self;
LABEL_12:

  return v25;
}

- (void)dealloc
{
  temporalMitigated = self->_temporalMitigated;
  if (temporalMitigated) {
    CFRelease(temporalMitigated);
  }
  spatialMitigated = self->_spatialMitigated;
  if (spatialMitigated) {
    CFRelease(spatialMitigated);
  }
  inputCopy = self->_inputCopy;
  if (inputCopy) {
    CFRelease(inputCopy);
  }
  v6.receiver = self;
  v6.super_class = (Class)MitigationGPU;
  [(MitigationGPU *)&v6 dealloc];
}

- (int)_compileShaders
{
  v3 = [(FigMetalContext *)self->_metalContext computePipelineStateFor:@"mitigationGPU::spatialTemporalRepairYUV" constants:0];
  spatialTemporalRepairYUV = self->_spatialTemporalRepairYUV;
  self->_spatialTemporalRepairYUV = v3;

  if (self->_spatialTemporalRepairYUV)
  {
    v5 = [(FigMetalContext *)self->_metalContext computePipelineStateFor:@"mitigationGPU::fuseYUV" constants:0];
    fuseYUV = self->_fuseYUV;
    self->_fuseYUV = v5;

    if (self->_fuseYUV) {
      return 0;
    }
  }
  fig_log_get_emitter();
  FigDebugAssert3();

  return FigSignalErrorAt();
}

- (void)_encodeSpatialTemporalRepairYUVToCommandBuffer:(__n128)a3 input:(__n128)a4 strongRepairSpatial:(__n128)a5 frRef0:(__n128)a6 frRef1:(__n128)a7 trRef0:(uint64_t)a8 trRef1:(void *)a9 hmgrphy0:(void *)a10 hmgrphy1:(void *)a11 spatialOutput:(void *)a12 temporalOutput:(void *)a13 strongTempOutput:(void *)a14 inputCopy:(id)a15 metaBuf:(id)a16 ref0MetaBuf:(id)a17 ref1MetaBuf:(id)a18
{
  v50[0] = a2;
  v50[1] = a3;
  v50[2] = a4;
  v49[0] = a5;
  v49[1] = a6;
  v49[2] = a7;
  id v44 = a22;
  id v43 = a21;
  id v42 = a20;
  id v25 = a19;
  id v41 = a18;
  id v26 = a17;
  id v27 = a16;
  id v28 = a15;
  id v29 = a14;
  id v30 = a13;
  id v31 = a12;
  id v32 = a11;
  id v33 = a10;
  v34 = [a9 computeCommandEncoder];
  [v34 setComputePipelineState:*(void *)(a1 + 40)];
  [v34 setTexture:v33 atIndex:0];

  [v34 setTexture:v32 atIndex:6];
  [v34 setTexture:v31 atIndex:1];

  [v34 setTexture:v30 atIndex:2];
  [v34 setTexture:v29 atIndex:17];

  [v34 setTexture:v28 atIndex:18];
  [v34 setTexture:v27 atIndex:3];

  [v34 setTexture:v26 atIndex:4];
  [v34 setTexture:v25 atIndex:5];

  [v34 setTexture:v41 atIndex:16];
  [v34 setBuffer:v42 offset:0 atIndex:0];
  [v34 setBuffer:v43 offset:0 atIndex:4];

  [v34 setBuffer:v44 offset:0 atIndex:5];
  [v34 setBytes:v50 length:48 atIndex:1];
  [v34 setBytes:v49 length:48 atIndex:2];
  [v34 setImageblockWidth:32 height:32];
  id v35 = v42;
  v36 = (char *)[v35 contents];

  uint64x2_t v47 = vshrq_n_u64((uint64x2_t)vaddw_s32(vdupq_n_s64(0x1FuLL), vadd_s32(*(int32x2_t *)(v36 + 20), (int32x2_t)0x8400000084)), 5uLL);
  uint64_t v48 = 1;
  int64x2_t v45 = vdupq_n_s64(0x20uLL);
  uint64_t v46 = 1;
  [v34 dispatchThreadgroups:&v47 threadsPerThreadgroup:&v45];
  [v34 endEncoding];
}

- (void)_encodeFuseYUVToCommandBuffer:(id)a3 inputTexture:(id)a4 temporalMitTexture:(id)a5 spatialMitTexture:(id)a6 outputTexture:(id)a7 metaBuf:(id)a8
{
  id v14 = a8;
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  v19 = [a3 computeCommandEncoder];
  [v19 setComputePipelineState:self->_fuseYUV];
  [v19 setBuffer:v14 offset:0 atIndex:0];
  [v19 setTexture:v18 atIndex:0];

  [v19 setTexture:v17 atIndex:2];
  [v19 setTexture:v16 atIndex:3];

  [v19 setTexture:v15 atIndex:4];
  [v19 setImageblockWidth:32 height:32];
  id v20 = v14;
  v21 = (char *)[v20 contents];

  uint64x2_t v24 = vshrq_n_u64(vaddw_u32((uint64x2_t)vdupq_n_s64(0x1FuLL), (uint32x2_t)vadd_s32(*(int32x2_t *)(v21 + 20), (int32x2_t)0x8400000084)), 5uLL);
  uint64_t v25 = 1;
  int64x2_t v22 = vdupq_n_s64(0x20uLL);
  uint64_t v23 = 1;
  [v19 dispatchThreadgroups:&v24 threadsPerThreadgroup:&v22];
  [v19 endEncoding];
}

- (void)spatialTemporalRepairThenFuseInplaceYUVInput:(double)a3 frRef0:(double)a4 frRef1:(double)a5 trRef0:(double)a6 trRef1:(double)a7 hmgrphy0:(uint64_t)a8 hmgrphy1:(void *)a9 metaBuf:(void *)a10 ref0MetaBuf:(void *)a11 ref1MetaBuf:(void *)a12 trInput:(void *)a13 waitForComplete:(void *)a14
{
  id v61 = a9;
  id v24 = a10;
  id v25 = a11;
  id v26 = a12;
  id v27 = a13;
  id v28 = a14;
  id v29 = a15;
  id v30 = a16;
  id v31 = a17;
  v49 = v28;
  id v32 = (__int16 *)objc_msgSend(*(id *)(a1 + 8), "generateMetaContainerArrayBufFromMetaContainerBuf:imageRect:", v28, 0.0, 0.0, (float)(unint64_t)objc_msgSend(v61, "width"), (float)(unint64_t)objc_msgSend(v61, "height"));
  *(_WORD *)(a1 + 106) = v32[240];
  id v33 = [*(id *)(a1 + 32) commandBuffer];
  if (v33)
  {
    id v59 = v25;
    id v60 = v24;
    id v57 = v30;
    id v58 = v29;
    id v34 = v31;
    if (v32[240] >= 1)
    {
      uint64_t v35 = 0;
      id v50 = v26;
      do
      {
        v36 = *(void **)&v32[4 * v35];
        id v37 = v27;
        uint64_t v39 = *(void *)(a1 + 56);
        uint64_t v38 = *(void *)(a1 + 64);
        v40 = v32;
        id v41 = v33;
        id v42 = v34;
        uint64_t v43 = *(void *)(a1 + 72);
        id v44 = v36;
        uint64_t v48 = v43;
        id v34 = v42;
        id v33 = v41;
        id v32 = v40;
        uint64_t v47 = v39;
        id v27 = v37;
        uint64_t v46 = v38;
        id v26 = v50;
        objc_msgSend((id)a1, "_encodeSpatialTemporalRepairYUVToCommandBuffer:input:strongRepairSpatial:frRef0:frRef1:trRef0:trRef1:hmgrphy0:hmgrphy1:spatialOutput:temporalOutput:strongTempOutput:inputCopy:metaBuf:ref0MetaBuf:ref1MetaBuf:", v33, v61, 0, v60, v59, v50, a2, a3, a4, a5, a6, a7, v37, v46, v47, v34,
          v48,
          v44,
          v58,
          v57);
        [(id)a1 _encodeFuseYUVToCommandBuffer:v33 inputTexture:*(void *)(a1 + 72) temporalMitTexture:*(void *)(a1 + 56) spatialMitTexture:*(void *)(a1 + 64) outputTexture:v61 metaBuf:v44];

        ++v35;
      }
      while (v35 < v40[240]);
    }
    id v31 = v34;
    id v30 = v57;
    id v29 = v58;
    id v25 = v59;
    id v24 = v60;
    BOOL v45 = a18 || *(unsigned char *)(a1 + 105) != 0;
    [(id)a1 _commitCmdBuffer:v33 waitForComplete:v45];
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    FigSignalErrorAt();
  }
}

- (void)_commitCmdBuffer:(id)a3 waitForComplete:(BOOL)a4
{
  int v4 = self->_forceWaitForComplete || a4;
  sub_17E84(a3, v4);
}

- (signed)roiClusterCnt
{
  return self->_roiClusterCnt;
}

- (void)setRoiClusterCnt:(signed __int16)a3
{
  self->_roiClusterCnt = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputCopyTexture, 0);
  objc_storeStrong((id *)&self->_spatialMitigatedTexture, 0);
  objc_storeStrong((id *)&self->_temporalMitigatedTexture, 0);
  objc_storeStrong((id *)&self->_fuseYUV, 0);
  objc_storeStrong((id *)&self->_spatialTemporalRepairYUV, 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_metalContext, 0);

  objc_storeStrong((id *)&self->_metalToolbox, 0);
}

@end