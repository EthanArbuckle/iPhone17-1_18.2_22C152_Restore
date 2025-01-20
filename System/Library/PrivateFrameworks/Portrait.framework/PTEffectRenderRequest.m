@interface PTEffectRenderRequest
+ (double)apertureSDOFRange;
+ (float)apertureSDOFDefault;
+ (float)relightStrengthStudioLightDefault;
- (BOOL)bilbyFloatingMode;
- (BOOL)focusOnAll;
- (BOOL)outBackgroundReplacementPostProcessingBufferUpdated;
- (BOOL)outColorBufferWriteSkipped;
- (CGAffineTransform)transform;
- (CGRect)inReactionVideoRect;
- (CGRect)inScreenCaptureRect;
- (CGRect)outColorROI;
- (CGSize)inReactionColorSize;
- (MTLTexture)inBilbyAlphaMaskTexture;
- (NSArray)reactions;
- (PTEffectRenderRequest)init;
- (__CFDictionary)detectedObjects;
- (__CVBuffer)inBackgroundReplacementBuffer;
- (__CVBuffer)inColorBuffer;
- (__CVBuffer)inExternalDisparityBuffer;
- (__CVBuffer)inScreenCaptureBuffer;
- (__CVBuffer)outBackgroundReplacementPostProcessingBuffer;
- (__CVBuffer)outColorBuffer;
- (__CVBuffer)outPersonSegmentationMatteBuffer;
- (double)frameTimeSeconds;
- (float)apertureSDOF;
- (float)focalLength;
- (float)luxLevel;
- (float)relightStrengthStudioLight;
- (float)remappedAperture;
- (id)detectedObjectsAsString;
- (int64_t)effectQuality;
- (uint64_t)reactionsCombinedCropRect;
- (unint64_t)effectType;
- (unint64_t)presenterOverlayMode;
- (void)dealloc;
- (void)setApertureSDOF:(float)a3;
- (void)setBilbyFloatingMode:(BOOL)a3;
- (void)setDetectedObjects:(__CFDictionary *)a3;
- (void)setEffectQuality:(int64_t)a3;
- (void)setEffectType:(unint64_t)a3;
- (void)setFocalLength:(float)a3;
- (void)setFocusOnAll:(BOOL)a3;
- (void)setFrameTimeSeconds:(double)a3;
- (void)setInBackgroundReplacementBuffer:(__CVBuffer *)a3;
- (void)setInBilbyAlphaMaskTexture:(id)a3;
- (void)setInColorBuffer:(__CVBuffer *)a3;
- (void)setInExternalDisparityBuffer:(__CVBuffer *)a3;
- (void)setInReactionColorSize:(CGSize)a3;
- (void)setInReactionVideoRect:(CGRect)a3;
- (void)setInScreenCaptureBuffer:(__CVBuffer *)a3;
- (void)setInScreenCaptureRect:(CGRect)a3;
- (void)setLuxLevel:(float)a3;
- (void)setOutBackgroundReplacementPostProcessingBuffer:(__CVBuffer *)a3;
- (void)setOutBackgroundReplacementPostProcessingBufferUpdated:(BOOL)a3;
- (void)setOutColorBuffer:(__CVBuffer *)a3;
- (void)setOutColorBufferWriteSkipped:(BOOL)a3;
- (void)setOutColorROI:(CGRect)a3;
- (void)setOutPersonSegmentationMatteBuffer:(__CVBuffer *)a3;
- (void)setPresenterOverlayMode:(unint64_t)a3;
- (void)setReactions:(id)a3;
- (void)setRelightStrengthStudioLight:(float)a3;
- (void)setTransform:(CGAffineTransform *)a3;
@end

@implementation PTEffectRenderRequest

- (void)setOutColorBuffer:(__CVBuffer *)a3
{
  self->_outColorBuffer = a3;
}

- (void)setInColorBuffer:(__CVBuffer *)a3
{
  self->_inColorBuffer = a3;
}

- (void)setInBackgroundReplacementBuffer:(__CVBuffer *)a3
{
  self->_inBackgroundReplacementBuffer = a3;
}

- (void)setApertureSDOF:(float)a3
{
  self->_apertureSDOF = a3;
}

- (void)setTransform:(CGAffineTransform *)a3
{
}

- (int64_t)effectQuality
{
  return self->_effectQuality;
}

- (void)setEffectQuality:(int64_t)a3
{
  self->_effectQuality = a3;
}

- (unint64_t)presenterOverlayMode
{
  return self->_presenterOverlayMode;
}

- (void)setInScreenCaptureRect:(CGRect)a3
{
  CGRect v3 = a3;
  objc_copyStruct(&self->_inScreenCaptureRect, &v3, 32, 1, 0);
}

- (void)setPresenterOverlayMode:(unint64_t)a3
{
  self->_presenterOverlayMode = a3;
}

- (void)setBilbyFloatingMode:(BOOL)a3
{
  unint64_t v3 = 4;
  if (!a3) {
    unint64_t v3 = 0;
  }
  self->_presenterOverlayMode = v3;
}

- (CGRect)inScreenCaptureRect
{
  objc_copyStruct(v6, &self->_inScreenCaptureRect, 32, 1, 0);
  double v2 = *(double *)v6;
  double v3 = *(double *)&v6[1];
  double v4 = *(double *)&v6[2];
  double v5 = *(double *)&v6[3];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (BOOL)bilbyFloatingMode
{
  return self->_presenterOverlayMode > 2;
}

- (unint64_t)effectType
{
  return self->_effectType;
}

- (NSArray)reactions
{
  return self->_reactions;
}

- (__CVBuffer)outPersonSegmentationMatteBuffer
{
  return self->_outPersonSegmentationMatteBuffer;
}

- (void)setRelightStrengthStudioLight:(float)a3
{
  double v3 = a3;
  if (v3 > 1.0) {
    double v3 = 1.0;
  }
  float v4 = fmax(v3, 0.0);
  self->_relightStrengthStudioLight = v4;
}

- (PTEffectRenderRequest)init
{
  v9.receiver = self;
  v9.super_class = (Class)PTEffectRenderRequest;
  double v2 = [(PTEffectRenderRequest *)&v9 init];
  if (v2)
  {
    [(PTEffectRenderRequest *)v2 setFrameTimeSeconds:CACurrentMediaTime()];
    [(PTEffectRenderRequest *)v2 setEffectType:-1];
    [(PTEffectRenderRequest *)v2 setEffectQuality:-1];
    v2->_apertureSDOF = 0.5;
    +[PTEffectRenderRequest relightStrengthStudioLightDefault];
    v2->_relightStrengthStudioLight = v3;
    [(PTEffectRenderRequest *)v2 setFocusOnAll:0];
    -[PTEffectRenderRequest setInScreenCaptureRect:](v2, "setInScreenCaptureRect:", 0.028125, 0.05, 0.6, 0.666666667);
    -[PTEffectRenderRequest setInReactionVideoRect:](v2, "setInReactionVideoRect:", 0.0, 0.0, 1.0, 1.0);
    -[PTEffectRenderRequest setOutColorROI:](v2, "setOutColorROI:", 0.0, 0.0, 1.0, 1.0);
    LODWORD(v4) = 2143289344;
    [(PTEffectRenderRequest *)v2 setLuxLevel:v4];
    v2->_detectedObjects = 0;
    uint64_t v5 = MEMORY[0x1E4F1DAB8];
    long long v6 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&v2->_transform.a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&v2->_transform.c = v6;
    *(_OWORD *)&v2->_transform.tx = *(_OWORD *)(v5 + 32);
    v7 = v2;
  }

  return v2;
}

- (void)setFrameTimeSeconds:(double)a3
{
  self->_frameTimeSeconds = a3;
}

- (void)setEffectType:(unint64_t)a3
{
  self->_effectType = a3;
}

- (void)setLuxLevel:(float)a3
{
  self->_luxLevel = a3;
}

- (void)setFocusOnAll:(BOOL)a3
{
  self->_focusOnAll = a3;
}

- (void)setOutColorROI:(CGRect)a3
{
  CGRect v3 = a3;
  objc_copyStruct(&self->_outColorROI, &v3, 32, 1, 0);
}

- (void)setInReactionVideoRect:(CGRect)a3
{
  CGRect v3 = a3;
  objc_copyStruct(&self->_inReactionVideoRect, &v3, 32, 1, 0);
}

+ (float)relightStrengthStudioLightDefault
{
  return 0.5;
}

- (__CVBuffer)outColorBuffer
{
  return self->_outColorBuffer;
}

- (__CVBuffer)inColorBuffer
{
  return self->_inColorBuffer;
}

- (BOOL)outColorBufferWriteSkipped
{
  return self->_outColorBufferWriteSkipped;
}

- (void)setDetectedObjects:(__CFDictionary *)a3
{
  detectedObjects = self->_detectedObjects;
  if (detectedObjects)
  {
    CFRelease(detectedObjects);
    self->_detectedObjects = 0;
  }
  if (a3) {
    self->_detectedObjects = (__CFDictionary *)CFRetain(a3);
  }
}

- (double)frameTimeSeconds
{
  return self->_frameTimeSeconds;
}

- (void)setOutColorBufferWriteSkipped:(BOOL)a3
{
  self->_outColorBufferWriteSkipped = a3;
}

- (CGAffineTransform)transform
{
  objc_copyStruct(retstr, &self->_transform, 48, 1, 0);
  return result;
}

- (__CFDictionary)detectedObjects
{
  return self->_detectedObjects;
}

- (void)setReactions:(id)a3
{
}

- (float)remappedAperture
{
  [(PTEffectRenderRequest *)self apertureSDOF];
  float v3 = v2;
  if (v2 > 1.1)
  {
    +[PTEffectRenderRequest apertureSDOFRange];
    if (v5 >= v3) {
      float v6 = v3;
    }
    else {
      float v6 = v5;
    }
    if (v4 >= v6) {
      float v6 = v4;
    }
    float v3 = (float)(v6 - v4) / (float)(v5 - v4);
  }
  if (v3 <= 0.5) {
    return (float)(v3 * 3.2) + 1.4;
  }
  float v7 = v3 + -0.5 + v3 + -0.5;
  return (float)((float)(v3 * 3.2) + 1.4) + (float)(powf(v7, 4.0) * 5.4);
}

- (float)apertureSDOF
{
  return self->_apertureSDOF;
}

+ (double)apertureSDOFRange
{
  return 512.000122;
}

- (void)dealloc
{
  detectedObjects = self->_detectedObjects;
  if (detectedObjects)
  {
    CFRelease(detectedObjects);
    self->_detectedObjects = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)PTEffectRenderRequest;
  [(PTEffectRenderRequest *)&v4 dealloc];
}

- (float)relightStrengthStudioLight
{
  return self->_relightStrengthStudioLight;
}

+ (float)apertureSDOFDefault
{
  return 0.5;
}

- (__CVBuffer)inExternalDisparityBuffer
{
  return self->_inExternalDisparityBuffer;
}

- (void)setInExternalDisparityBuffer:(__CVBuffer *)a3
{
  self->_inExternalDisparityBuffer = a3;
}

- (__CVBuffer)inScreenCaptureBuffer
{
  return self->_inScreenCaptureBuffer;
}

- (void)setInScreenCaptureBuffer:(__CVBuffer *)a3
{
  self->_inScreenCaptureBuffer = a3;
}

- (CGRect)inReactionVideoRect
{
  objc_copyStruct(v6, &self->_inReactionVideoRect, 32, 1, 0);
  double v2 = *(double *)v6;
  double v3 = *(double *)&v6[1];
  double v4 = *(double *)&v6[2];
  double v5 = *(double *)&v6[3];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGSize)inReactionColorSize
{
  objc_copyStruct(v4, &self->_inReactionColorSize, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setInReactionColorSize:(CGSize)a3
{
  CGSize v3 = a3;
  objc_copyStruct(&self->_inReactionColorSize, &v3, 16, 1, 0);
}

- (CGRect)outColorROI
{
  objc_copyStruct(v6, &self->_outColorROI, 32, 1, 0);
  double v2 = *(double *)v6;
  double v3 = *(double *)&v6[1];
  double v4 = *(double *)&v6[2];
  double v5 = *(double *)&v6[3];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setOutPersonSegmentationMatteBuffer:(__CVBuffer *)a3
{
  self->_outPersonSegmentationMatteBuffer = a3;
}

- (__CVBuffer)inBackgroundReplacementBuffer
{
  return self->_inBackgroundReplacementBuffer;
}

- (__CVBuffer)outBackgroundReplacementPostProcessingBuffer
{
  return self->_outBackgroundReplacementPostProcessingBuffer;
}

- (void)setOutBackgroundReplacementPostProcessingBuffer:(__CVBuffer *)a3
{
  self->_outBackgroundReplacementPostProcessingBuffer = a3;
}

- (BOOL)outBackgroundReplacementPostProcessingBufferUpdated
{
  return self->_outBackgroundReplacementPostProcessingBufferUpdated;
}

- (void)setOutBackgroundReplacementPostProcessingBufferUpdated:(BOOL)a3
{
  self->_outBackgroundReplacementPostProcessingBufferUpdated = a3;
}

- (BOOL)focusOnAll
{
  return self->_focusOnAll;
}

- (float)luxLevel
{
  return self->_luxLevel;
}

- (float)focalLength
{
  return self->_focalLength;
}

- (void)setFocalLength:(float)a3
{
  self->_focalLength = a3;
}

- (MTLTexture)inBilbyAlphaMaskTexture
{
  return self->_inBilbyAlphaMaskTexture;
}

- (void)setInBilbyAlphaMaskTexture:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inBilbyAlphaMaskTexture, 0);

  objc_storeStrong((id *)&self->_reactions, 0);
}

- (uint64_t)reactionsCombinedCropRect
{
  [a1 outColorROI];
  v3.f64[1] = v2;
  v5.f64[1] = v4;
  *(void *)&double v12 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v5), v3).u64[0];
  [a1 inReactionVideoRect];
  v7.f64[1] = v6;
  v9.f64[1] = v8;
  *(void *)&double v10 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v9), v7).u64[0];

  return (uint64_t)+[PTEffectUtil multiplyRectTransform:v12 withRectTransform:v10];
}

- (id)detectedObjectsAsString
{
  return &stru_1F269F3B0;
}

@end