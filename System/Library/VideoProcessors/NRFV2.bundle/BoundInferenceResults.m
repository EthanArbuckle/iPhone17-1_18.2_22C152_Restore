@interface BoundInferenceResults
- (BoundInferenceResults)initWithResult:(id)a3 andMetal:(id)a4;
- (MTLTexture)personMask;
- (MTLTexture)skinMask;
- (MTLTexture)skyMask;
- (NSArray)faceLandmarks;
- (NSArray)instanceMasks;
- (NSArray)maskConfidences;
- (NSArray)skinToneClassification;
- (NSString)sceneType;
- (__CVBuffer)skinMaskPixelBuffer;
- (__CVBuffer)skyMaskPixelBuffer;
- (void)dealloc;
- (void)setFaceLandmarks:(id)a3;
- (void)setInstanceMasks:(id)a3;
- (void)setMaskConfidences:(id)a3;
- (void)setPersonMask:(id)a3;
- (void)setSceneType:(id)a3;
- (void)setSkinMask:(id)a3;
- (void)setSkinMaskPixelBuffer:(__CVBuffer *)a3;
- (void)setSkinToneClassification:(id)a3;
- (void)setSkyMask:(id)a3;
- (void)setSkyMaskPixelBuffer:(__CVBuffer *)a3;
@end

@implementation BoundInferenceResults

- (BoundInferenceResults)initWithResult:(id)a3 andMetal:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v81.receiver = self;
  v81.super_class = (Class)BoundInferenceResults;
  v11 = [(BoundInferenceResults *)&v81 init];
  if (v11)
  {
    if (!v6 || !v7) {
      goto LABEL_32;
    }
    int v12 = objc_msgSend_status(v6, v8, v9, v10);
    if (v12)
    {
      int v80 = v12;
      FigDebugAssert3();
      objc_msgSend_status(v6, v77, v78, v79, v80);
LABEL_33:
      v75 = 0;
      goto LABEL_28;
    }
    v11->_skinMaskPixelBuffer = 0;
    if (objc_msgSend_skinMask(v6, v13, v14, v15))
    {
      uint64_t v19 = objc_msgSend_skinMask(v6, v16, v17, v18);
      uint64_t v21 = objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_(v7, v20, v19, 10, 1, 0);
      skinMask = v11->_skinMask;
      v11->_skinMask = (MTLTexture *)v21;

      if (!v11->_skinMask) {
        goto LABEL_32;
      }
      v26 = objc_msgSend_skinMask(v6, v23, v24, v25);
      if (v26) {
        v26 = (void *)CFRetain(v26);
      }
      v11->_skinMaskPixelBuffer = (__CVBuffer *)v26;
    }
    v11->_skyMaskPixelBuffer = 0;
    if (!objc_msgSend_skyMask(v6, v16, v17, v18)) {
      goto LABEL_15;
    }
    uint64_t v30 = objc_msgSend_skyMask(v6, v27, v28, v29);
    uint64_t v32 = objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_(v7, v31, v30, 10, 1, 0);
    skyMask = v11->_skyMask;
    v11->_skyMask = (MTLTexture *)v32;

    if (v11->_skyMask)
    {
      v37 = objc_msgSend_skyMask(v6, v34, v35, v36);
      if (v37) {
        v37 = (void *)CFRetain(v37);
      }
      v11->_skyMaskPixelBuffer = (__CVBuffer *)v37;
LABEL_15:
      if (!objc_msgSend_personMask(v6, v27, v28, v29)
        || (uint64_t v41 = objc_msgSend_personMask(v6, v38, v39, v40),
            objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_(v7, v42, v41, 25, 1, 0),
            uint64_t v43 = objc_claimAutoreleasedReturnValue(),
            personMask = v11->_personMask,
            v11->_personMask = (MTLTexture *)v43,
            personMask,
            v11->_personMask))
      {
        v45 = objc_msgSend_faceLandmarks(v6, v38, v39, v40);

        if (v45)
        {
          uint64_t v49 = objc_msgSend_faceLandmarks(v6, v46, v47, v48);
          faceLandmarks = v11->_faceLandmarks;
          v11->_faceLandmarks = (NSArray *)v49;
        }
        v51 = objc_msgSend_lowResPersonInstanceMasks(v6, v46, v47, v48);

        if (v51)
        {
          uint64_t v55 = objc_msgSend_lowResPersonInstanceMasks(v6, v52, v53, v54);
          instanceMasks = v11->_instanceMasks;
          v11->_instanceMasks = (NSArray *)v55;
        }
        v57 = objc_msgSend_skinToneClassificationsForFaces(v6, v52, v53, v54);

        if (v57)
        {
          uint64_t v61 = objc_msgSend_skinToneClassificationsForFaces(v6, v58, v59, v60);
          skinToneClassification = v11->_skinToneClassification;
          v11->_skinToneClassification = (NSArray *)v61;
        }
        v63 = objc_msgSend_lowResPersonInstanceConfidences(v6, v58, v59, v60);

        if (v63)
        {
          uint64_t v67 = objc_msgSend_lowResPersonInstanceConfidences(v6, v64, v65, v66);
          maskConfidences = v11->_maskConfidences;
          v11->_maskConfidences = (NSArray *)v67;
        }
        v69 = objc_msgSend_smartCameraSceneType(v6, v64, v65, v66);

        if (v69)
        {
          uint64_t v73 = objc_msgSend_smartCameraSceneType(v6, v70, v71, v72);
          sceneType = v11->_sceneType;
          v11->_sceneType = (NSString *)v73;
        }
        goto LABEL_27;
      }
    }
LABEL_32:
    FigDebugAssert3();
    FigSignalErrorAt();
    goto LABEL_33;
  }
LABEL_27:
  v75 = v11;
LABEL_28:

  return v75;
}

- (void)dealloc
{
  skyMaskPixelBuffer = self->_skyMaskPixelBuffer;
  if (skyMaskPixelBuffer)
  {
    CFRelease(skyMaskPixelBuffer);
    self->_skyMaskPixelBuffer = 0;
  }
  skinMaskPixelBuffer = self->_skinMaskPixelBuffer;
  if (skinMaskPixelBuffer)
  {
    CFRelease(skinMaskPixelBuffer);
    self->_skinMaskPixelBuffer = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)BoundInferenceResults;
  [(BoundInferenceResults *)&v5 dealloc];
}

- (MTLTexture)skinMask
{
  return self->_skinMask;
}

- (void)setSkinMask:(id)a3
{
}

- (__CVBuffer)skinMaskPixelBuffer
{
  return self->_skinMaskPixelBuffer;
}

- (void)setSkinMaskPixelBuffer:(__CVBuffer *)a3
{
  self->_skinMaskPixelBuffer = a3;
}

- (MTLTexture)skyMask
{
  return self->_skyMask;
}

- (void)setSkyMask:(id)a3
{
}

- (__CVBuffer)skyMaskPixelBuffer
{
  return self->_skyMaskPixelBuffer;
}

- (void)setSkyMaskPixelBuffer:(__CVBuffer *)a3
{
  self->_skyMaskPixelBuffer = a3;
}

- (MTLTexture)personMask
{
  return self->_personMask;
}

- (void)setPersonMask:(id)a3
{
}

- (NSArray)faceLandmarks
{
  return self->_faceLandmarks;
}

- (void)setFaceLandmarks:(id)a3
{
}

- (NSArray)skinToneClassification
{
  return self->_skinToneClassification;
}

- (void)setSkinToneClassification:(id)a3
{
}

- (NSArray)maskConfidences
{
  return self->_maskConfidences;
}

- (void)setMaskConfidences:(id)a3
{
}

- (NSArray)instanceMasks
{
  return self->_instanceMasks;
}

- (void)setInstanceMasks:(id)a3
{
}

- (NSString)sceneType
{
  return self->_sceneType;
}

- (void)setSceneType:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneType, 0);
  objc_storeStrong((id *)&self->_instanceMasks, 0);
  objc_storeStrong((id *)&self->_maskConfidences, 0);
  objc_storeStrong((id *)&self->_skinToneClassification, 0);
  objc_storeStrong((id *)&self->_faceLandmarks, 0);
  objc_storeStrong((id *)&self->_personMask, 0);
  objc_storeStrong((id *)&self->_skyMask, 0);

  objc_storeStrong((id *)&self->_skinMask, 0);
}

@end