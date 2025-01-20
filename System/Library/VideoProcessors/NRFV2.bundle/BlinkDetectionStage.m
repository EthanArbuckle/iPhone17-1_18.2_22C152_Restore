@interface BlinkDetectionStage
+ (int)prewarmShaders:(id)a3;
- (id)init:(id)a3;
- (int)runOnLumaBand1:(id)a3 lumaBand2:(id)a4 lumaBand3:(id)a5 withFaces:(FaceDetectionBuffer)a6[10] facesCount:(int)a7 plist:(id)a8 resultScore:(float *)a9 frameIdx:(int)a10;
@end

@implementation BlinkDetectionStage

+ (int)prewarmShaders:(id)a3
{
  id v3 = a3;
  v7 = objc_msgSend_sharedInstance(BlinkDetectionStageShared, v4, v5, v6);
  v10 = objc_msgSend_getShaders_(v7, v8, (uint64_t)v3, v9);

  if (v10) {
    int v11 = 0;
  }
  else {
    int v11 = -12786;
  }

  return v11;
}

- (id)init:(id)a3
{
  id v5 = a3;
  v25.receiver = self;
  v25.super_class = (Class)BlinkDetectionStage;
  uint64_t v6 = [(BlinkDetectionStage *)&v25 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_metal, a3);
    int v11 = objc_msgSend_sharedInstance(BlinkDetectionStageShared, v8, v9, v10);
    v14 = objc_msgSend_getShaders_(v11, v12, (uint64_t)v7->_metal, v13);

    if (v14)
    {
      v18 = objc_msgSend_device(v7->_metal, v15, v16, v17);
      uint64_t v20 = objc_msgSend_newBufferWithLength_options_(v18, v19, 4, 0);
      blinkDetectionResultBuffer = v7->_blinkDetectionResultBuffer;
      v7->_blinkDetectionResultBuffer = (MTLBuffer *)v20;

      if (v7->_blinkDetectionResultBuffer)
      {
        v22 = v7;
      }
      else
      {
        FigDebugAssert3();
        if (FigSignalErrorAt()) {
          v22 = 0;
        }
        else {
          v22 = v7;
        }
      }
    }
    else
    {
      FigDebugAssert3();
      v22 = 0;
    }
  }
  else
  {
    FigDebugAssert3();
    v22 = 0;
    v14 = 0;
  }
  v23 = v22;

  return v23;
}

- (int)runOnLumaBand1:(id)a3 lumaBand2:(id)a4 lumaBand3:(id)a5 withFaces:(FaceDetectionBuffer)a6[10] facesCount:(int)a7 plist:(id)a8 resultScore:(float *)a9 frameIdx:(int)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  v22 = (unsigned __int16 *)a8;
  if (!a9 || !v16 || !v17 || !v18) {
    goto LABEL_26;
  }
  *a9 = 0.0;
  if (a7 < 1)
  {
    int v85 = 0;
LABEL_23:
    v34 = 0;
    v63 = 0;
    v64 = 0;
    goto LABEL_25;
  }
  v23 = objc_msgSend_sharedInstance(BlinkDetectionStageShared, v19, v20, v21);
  uint64_t v26 = objc_msgSend_getShaders_(v23, v24, (uint64_t)self->_metal, v25);

  v89 = (void *)v26;
  if (!v26)
  {
LABEL_26:
    FigDebugAssert3();
    int v85 = FigSignalErrorAt();
    goto LABEL_23;
  }
  uint64_t v88 = (uint64_t)v17;
  v30 = objc_msgSend_commandQueue(self->_metal, v27, v28, v29);
  v34 = objc_msgSend_commandBuffer(v30, v31, v32, v33);

  if (!v34)
  {
    FigDebugAssert3();
    int v85 = FigSignalErrorAt();
    v63 = 0;
    id v17 = (id)v88;
    v64 = v89;
    goto LABEL_25;
  }
  v87 = self;
  uint64_t v38 = 0;
  v96[0] = 0;
  memset(v95, 0, sizeof(v95));
  int v94 = 0;
  uint64_t v39 = a7;
  p_yaw = &a6->yaw;
  do
  {
    if (*(p_yaw - 2) > v22[5] && !*p_yaw)
    {
      char v41 = *((unsigned char *)v22 + 8);
      if (v41)
      {
        float v49 = *((float *)v22 + 7);
        float v50 = *((float *)v22 + 8);
        float v51 = *((float *)v22 + 9);
        float v52 = *((float *)v22 + 10);
        float v53 = *((float *)v22 + 16);
        unint64_t v54 = objc_msgSend_height(v16, v35, v36, v37);
        sub_262F97C9C((uint64_t)a6, v38, &v94, (uint64_t)v95, v54, v96, v49, v50, v51, v52, v53, v55);
        char v41 = *((unsigned char *)v22 + 8);
        if ((v41 & 2) == 0)
        {
LABEL_13:
          if ((v41 & 4) == 0) {
            goto LABEL_15;
          }
LABEL_14:
          float v42 = *((float *)v22 + 11);
          float v43 = *((float *)v22 + 12);
          float v44 = *((float *)v22 + 13);
          float v45 = *((float *)v22 + 14);
          float v46 = *((float *)v22 + 17);
          unint64_t v47 = objc_msgSend_height(v16, v35, v36, v37);
          sub_262F97C9C((uint64_t)a6, v38, &v94, (uint64_t)v95, v47, v96, v42, v43, v44, v45, v46, v48);
          goto LABEL_15;
        }
      }
      else if ((v22[4] & 2) == 0)
      {
        goto LABEL_13;
      }
      float v56 = *((float *)v22 + 3);
      float v57 = *((float *)v22 + 4);
      float v58 = *((float *)v22 + 5);
      float v59 = *((float *)v22 + 6);
      float v60 = *((float *)v22 + 15);
      unint64_t v61 = objc_msgSend_height(v16, v35, v36, v37);
      sub_262F97C9C((uint64_t)a6, v38, &v94, (uint64_t)v95, v61, v96, v56, v57, v58, v59, v60, v62);
      if ((v22[4] & 4) != 0) {
        goto LABEL_14;
      }
    }
LABEL_15:
    p_yaw += 20;
    ++v38;
  }
  while (v39 != v38);
  if (v94 < 1)
  {
    int v85 = 0;
    v63 = 0;
    id v17 = (id)v88;
    v64 = v89;
  }
  else
  {
    LOWORD(v95[0]) = v94;
    v63 = objc_msgSend_computeCommandEncoder(v34, v35, v36, v37);
    v64 = (void *)v26;
    objc_msgSend_setComputePipelineState_(v63, v65, *(void *)(v26 + 8), v66);
    objc_msgSend_setTexture_atIndex_(v63, v67, (uint64_t)v16, 0);
    objc_msgSend_setTexture_atIndex_(v63, v68, v88, 1);
    objc_msgSend_setTexture_atIndex_(v63, v69, (uint64_t)v18, 2);
    objc_msgSend_setBytes_length_atIndex_(v63, v70, (uint64_t)v95, 416, 0);
    objc_msgSend_setBuffer_offset_atIndex_(v63, v71, (uint64_t)v87->_blinkDetectionResultBuffer, 0, 1);
    unint64_t v92 = v96[0];
    id v17 = (id)v88;
    int64x2_t v93 = vdupq_n_s64(1uLL);
    unint64_t v90 = v96[0];
    int64x2_t v91 = v93;
    objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v63, v72, (uint64_t)&v92, (uint64_t)&v90);
    objc_msgSend_endEncoding(v63, v73, v74, v75);
    objc_msgSend_commit(v34, v76, v77, v78);
    objc_msgSend_waitUntilCompleted(v34, v79, v80, v81);
    int v85 = 0;
    *a9 = *(float *)objc_msgSend_contents(v87->_blinkDetectionResultBuffer, v82, v83, v84);
  }
LABEL_25:

  return v85;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metal, 0);

  objc_storeStrong((id *)&self->_blinkDetectionResultBuffer, 0);
}

@end