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
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  v49.receiver = self;
  v49.super_class = (Class)BoundInferenceResults;
  v9 = [(BoundInferenceResults *)&v49 init];
  if (v9)
  {
    if (!v7 || !v8) {
      goto LABEL_45;
    }
    int v10 = [v7 status];
    if (v10)
    {
      LODWORD(v48) = v10;
      FigDebugAssert3();
      objc_msgSend(v7, "status", v48, v4);
LABEL_46:
      v45 = 0;
      goto LABEL_40;
    }
    v9->_skinMaskPixelBuffer = 0;
    if ([v7 skinMask])
    {
      uint64_t v11 = objc_msgSend(v8, "bindPixelBufferToMTL2DTexture:pixelFormat:usage:plane:", objc_msgSend(v7, "skinMask"), 10, 1, 0);
      skinMask = v9->_skinMask;
      v9->_skinMask = (MTLTexture *)v11;

      if (!v9->_skinMask) {
        goto LABEL_45;
      }
      v13 = (void *)[v7 skinMask];
      if (v13) {
        v13 = (void *)CFRetain(v13);
      }
      v9->_skinMaskPixelBuffer = (__CVBuffer *)v13;
    }
    v9->_skyMaskPixelBuffer = 0;
    if (![v7 skyMask]) {
      goto LABEL_15;
    }
    uint64_t v14 = objc_msgSend(v8, "bindPixelBufferToMTL2DTexture:pixelFormat:usage:plane:", objc_msgSend(v7, "skyMask"), 10, 1, 0);
    skyMask = v9->_skyMask;
    v9->_skyMask = (MTLTexture *)v14;

    if (v9->_skyMask)
    {
      v16 = (void *)[v7 skyMask];
      if (v16) {
        v16 = (void *)CFRetain(v16);
      }
      v9->_skyMaskPixelBuffer = (__CVBuffer *)v16;
LABEL_15:
      if (![v7 highResPersonMask] && !objc_msgSend(v7, "personMask")) {
        goto LABEL_23;
      }
      uint64_t v17 = [v7 highResPersonMask];
      if (!v17) {
        uint64_t v17 = [v7 personMask];
      }
      uint64_t v18 = [v7 highResPersonMask] ? 10 : 25;
      uint64_t v19 = [v8 bindPixelBufferToMTL2DTexture:v17 pixelFormat:v18 usage:1 plane:0];
      personMask = v9->_personMask;
      v9->_personMask = (MTLTexture *)v19;

      if (v9->_personMask)
      {
LABEL_23:
        v21 = [v7 faceLandmarks];

        if (v21)
        {
          uint64_t v22 = [v7 faceLandmarks];
          faceLandmarks = v9->_faceLandmarks;
          v9->_faceLandmarks = (NSArray *)v22;
        }
        v24 = [v7 lowResPersonInstanceMasks];

        if (v24)
        {
          v25 = (NSArray *)objc_opt_new();
          v26 = [v7 lowResPersonInstanceMasks];
          uint64_t v27 = [v26 count];

          if (v27)
          {
            unint64_t v28 = 0;
            do
            {
              v29 = [v7 lowResPersonInstanceMasks];
              v30 = [v29 objectAtIndexedSubscript:v28];

              if (v30)
              {
                uint64_t v31 = [v8 bindPixelBufferToMTL2DTexture:v30 pixelFormat:25 usage:1 plane:0];
                if (!v31)
                {
                  v47 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                  os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT);
                  fig_log_call_emit_and_clean_up_after_send_and_compose();

                  goto LABEL_46;
                }
                v32 = (void *)v31;
                [(NSArray *)v25 addObject:v31];
              }
              ++v28;
              v33 = [v7 lowResPersonInstanceMasks];
              unint64_t v34 = [v33 count];
            }
            while (v34 > v28);
          }
          instanceMasks = v9->_instanceMasks;
          v9->_instanceMasks = v25;
        }
        v36 = [v7 skinToneClassificationsForFaces];

        if (v36)
        {
          uint64_t v37 = [v7 skinToneClassificationsForFaces];
          skinToneClassification = v9->_skinToneClassification;
          v9->_skinToneClassification = (NSArray *)v37;
        }
        v39 = [v7 lowResPersonInstanceConfidences];

        if (v39)
        {
          uint64_t v40 = [v7 lowResPersonInstanceConfidences];
          maskConfidences = v9->_maskConfidences;
          v9->_maskConfidences = (NSArray *)v40;
        }
        v42 = [v7 smartCameraSceneType];

        if (v42)
        {
          uint64_t v43 = [v7 smartCameraSceneType];
          sceneType = v9->_sceneType;
          v9->_sceneType = (NSString *)v43;
        }
        goto LABEL_39;
      }
    }
LABEL_45:
    FigDebugAssert3();
    FigSignalErrorAt();
    goto LABEL_46;
  }
LABEL_39:
  v45 = v9;
LABEL_40:

  return v45;
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