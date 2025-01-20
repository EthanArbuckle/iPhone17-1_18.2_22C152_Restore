@interface GrayGhostDetection
+ (int)prewarmShaders:(id)a3;
- (GrayGhostDetection)initWithMetalContext:(id)a3;
- (float)getGrayGhostResultSync;
- (int)runGrayGhostDetection:(id)a3 ev0Bands:(id)a4 evmProperties:(const frameProperties_t *)a5 ev0Properties:(const frameProperties_t *)a6 hasChromaBias:(BOOL)a7 atBand:(int)a8 params:(const GrayGhostParams *)a9;
@end

@implementation GrayGhostDetection

- (GrayGhostDetection)initWithMetalContext:(id)a3
{
  id v5 = a3;
  v31.receiver = self;
  v31.super_class = (Class)GrayGhostDetection;
  v6 = [(GrayGhostDetection *)&v31 init];
  v7 = (uint64_t *)v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_metal, a3);
    v11 = objc_msgSend_sharedInstance(GrayGhostDetectionShared, v8, v9, v10);
    uint64_t v14 = objc_msgSend_getShaders_(v11, v12, v7[1], v13);
    v15 = (void *)v7[2];
    v7[2] = v14;

    if (!v7[2]) {
      goto LABEL_7;
    }
    v19 = objc_msgSend_device((void *)v7[1], v16, v17, v18);
    uint64_t v21 = objc_msgSend_newBufferWithLength_options_(v19, v20, 4, 0);
    v22 = (void *)v7[4];
    v7[4] = v21;

    v26 = (void *)v7[4];
    if (v26)
    {
      *(_DWORD *)objc_msgSend_contents(v26, v23, v24, v25) = 0;
    }
    else
    {
LABEL_7:
      FigDebugAssert3();
      int v30 = FigSignalErrorAt();
      v27 = 0;
      if (v30) {
        goto LABEL_6;
      }
    }
  }
  v27 = v7;
LABEL_6:
  v28 = v27;

  return v28;
}

+ (int)prewarmShaders:(id)a3
{
  id v3 = a3;
  v4 = [GrayGhostDetectionShaders alloc];
  v7 = objc_msgSend_initWithMetal_(v4, v5, (uint64_t)v3, v6);

  if (v7) {
    int v8 = 0;
  }
  else {
    int v8 = -12786;
  }

  return v8;
}

- (int)runGrayGhostDetection:(id)a3 ev0Bands:(id)a4 evmProperties:(const frameProperties_t *)a5 ev0Properties:(const frameProperties_t *)a6 hasChromaBias:(BOOL)a7 atBand:(int)a8 params:(const GrayGhostParams *)a9
{
  v15 = a3;
  v19 = a4;
  if (self->_pendingResultCommandBuffer
    || (*(_DWORD *)objc_msgSend_contents(self->_grayGhostCountBuffer, v16, v17, v18) = 0, !a9)
    || (objc_msgSend_commandQueue(self->_metal, v20, v21, v22),
        v23 = objc_claimAutoreleasedReturnValue(),
        objc_msgSend_commandBuffer(v23, v24, v25, v26),
        v27 = objc_claimAutoreleasedReturnValue(),
        v23,
        !v27))
  {
    FigDebugAssert3();
    int v92 = FigSignalErrorAt();
    goto LABEL_9;
  }
  objc_super v31 = objc_msgSend_computeCommandEncoder(v27, v28, v29, v30);
  if (!v31)
  {
    FigDebugAssert3();
    int v92 = FigSignalErrorAt();
LABEL_13:

    goto LABEL_9;
  }
  v34 = v31;
  objc_msgSend_setComputePipelineState_(v31, v32, (uint64_t)self->_shaders->_computeGrayGhostCount, v33);
  if (!a5->meta.isEVMFrame || a6->meta.isEVMFrame || !a8)
  {
    FigDebugAssert3();
    int v92 = FigSignalErrorAt();

    goto LABEL_13;
  }
  v97 = v27;
  v35 = (void *)v15[a8 + 42];
  v36 = (void *)v15[a8 + 62];
  v98 = v15;
  v37 = (void *)v19[a8 + 42];
  id v38 = (id)v19[a8 + 62];
  id v94 = v37;
  id v95 = v36;
  id v96 = v35;
  objc_msgSend_setTexture_atIndex_(v34, v39, (uint64_t)v96, 0);
  objc_msgSend_setTexture_atIndex_(v34, v40, (uint64_t)v95, 1);
  objc_msgSend_setTexture_atIndex_(v34, v41, (uint64_t)v94, 2);
  objc_msgSend_setTexture_atIndex_(v34, v42, (uint64_t)v38, 3);
  float v43 = sub_262F98A00((uint64_t)&a5->meta.exposureParams, (uint64_t)&a6->meta.exposureParams, (uint64_t)a5);
  uint64_t v47 = objc_msgSend_width(v38, v44, v45, v46);
  uint64_t v51 = objc_msgSend_width(v38, v48, v49, v50);
  LOBYTE(v37) = a7;
  v55 = v19;
  uint64_t v56 = objc_msgSend_height(v38, v52, v53, v54);
  uint64_t v60 = objc_msgSend_height(v38, v57, v58, v59);
  v61.i64[0] = v56;
  v19 = v55;
  v61.i64[1] = v60;
  v62.i64[0] = v47;
  v62.i64[1] = v51;
  long long v63 = *(_OWORD *)&a5[1].meta.exposureParams.luxLevel;
  v102[0] = *(_OWORD *)&a5[1].meta.exposureParams.conversion_gain;
  v102[1] = v63;
  uint32x4_t v64 = vcvtq_u32_f32(vmulq_f32(vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(vcvtq_f64_u64(v62)), vcvtq_f64_u64(v61)), (float32x4_t)xmmword_263117D60));
  long long v65 = *(_OWORD *)&a6[1].meta.exposureParams.conversion_gain;
  long long v66 = *(_OWORD *)&a6[1].meta.exposureParams.luxLevel;
  v102[2] = *(_OWORD *)&a5[1].meta.exposureParams.CCT;
  v102[3] = v65;
  long long v67 = *(_OWORD *)&a6[1].meta.exposureParams.CCT;
  v102[4] = v66;
  v102[5] = v67;
  long long v103 = 0u;
  uint32x4_t v104 = v64;
  *(float *)&long long v103 = v43;
  long long v105 = xmmword_263117D70;
  long long v106 = 0u;
  LOBYTE(v106) = (_BYTE)v37;
  *(GrayGhostParams *)((char *)&v106 + 4) = *a9;
  objc_msgSend_setBytes_length_atIndex_(v34, v68, (uint64_t)v102, 160, 0);
  objc_msgSend_setBuffer_offset_atIndex_(v34, v69, (uint64_t)self->_grayGhostCountBuffer, 0, 1);
  v101[0] = (unint64_t)(objc_msgSend_width(v38, v70, v71, v72) + 7) >> 3;
  v101[1] = (unint64_t)(objc_msgSend_height(v38, v73, v74, v75) + 7) >> 3;
  v101[2] = 1;
  int64x2_t v99 = vdupq_n_s64(8uLL);
  uint64_t v100 = 1;
  objc_msgSend_dispatchThreadgroups_threadsPerThreadgroup_(v34, v76, (uint64_t)v101, (uint64_t)&v99);
  objc_msgSend_endEncoding(v34, v77, v78, v79);
  objc_msgSend_commit(v97, v80, v81, v82);
  pendingResultCommandBuffer = self->_pendingResultCommandBuffer;
  self->_pendingResultCommandBuffer = (MTLCommandBuffer *)v97;
  id v84 = v97;

  uint64_t v88 = objc_msgSend_width(v94, v85, v86, v87);
  self->_totalPixels = objc_msgSend_height(v94, v89, v90, v91) * v88;

  v15 = v98;
  int v92 = 0;
LABEL_9:

  return v92;
}

- (float)getGrayGhostResultSync
{
  pendingResultCommandBuffer = self->_pendingResultCommandBuffer;
  if (pendingResultCommandBuffer)
  {
    objc_msgSend_waitUntilCompleted(pendingResultCommandBuffer, a2, v2, v3);
    uint64_t v6 = self->_pendingResultCommandBuffer;
    self->_pendingResultCommandBuffer = 0;
  }
  return (float)*(unsigned int *)objc_msgSend_contents(self->_grayGhostCountBuffer, a2, v2, v3)
       / (float)self->_totalPixels;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_grayGhostCountBuffer, 0);
  objc_storeStrong((id *)&self->_pendingResultCommandBuffer, 0);
  objc_storeStrong((id *)&self->_shaders, 0);

  objc_storeStrong((id *)&self->_metal, 0);
}

@end