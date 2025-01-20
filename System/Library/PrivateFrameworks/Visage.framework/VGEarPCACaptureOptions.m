@interface VGEarPCACaptureOptions
+ (BOOL)defaultUseEarSideSmoothPredictor;
+ (BOOL)defaultUseMotionBlurFilter;
+ (float)defaultBboxVisibilityThreshold;
+ (float)defaultEarOcclusionThreshold;
+ (float)defaultEarPresenceThreshold;
+ (float)defaultEarSideSmoothPredictorConfidenceThreshold;
+ (float)defaultFaceYawLimit;
+ (float)defaultLandmarkVisibilityThreshold;
+ (float)defaultMotionBlurFilterThreshold;
+ (unsigned)defaultEarSideSmoothPredictorBufferCapacity;
+ (unsigned)defaultImageHeight;
+ (unsigned)defaultImageWidth;
+ (unsigned)frameCountThreshold;
- (BOOL)useEarSideSmoothPredictor;
- (BOOL)useMotionBlurFilter;
- (BOOL)writeDebugData;
- (NSString)debugDataPath;
- (NSString)modelsRootPath;
- (VGEarPCACaptureOptions)init;
- (VGEarPCACaptureOptions)initWithSuiteName:(id)a3;
- (float)bboxVisibilityThreshold;
- (float)earOcclusionThreshold;
- (float)earPresenceThreshold;
- (float)earSideSmoothPredictorConfidenceThreshold;
- (float)faceYawLimit;
- (float)landmarkVisibilityThreshold;
- (float)motionBlurFilterThreshold;
- (id)description;
- (unsigned)earSideSmoothPredictorBufferCapacity;
- (unsigned)frameCountThreshold;
- (unsigned)imageHeight;
- (unsigned)imageWidth;
- (void)setBboxVisibilityThreshold:(float)a3;
- (void)setDebugDataPath:(id)a3;
- (void)setDefaultsWithSuiteName:(id)a3;
- (void)setEarOcclusionThreshold:(float)a3;
- (void)setEarPresenceThreshold:(float)a3;
- (void)setEarSideSmoothPredictorBufferCapacity:(unsigned int)a3;
- (void)setEarSideSmoothPredictorConfidenceThreshold:(float)a3;
- (void)setFaceYawLimit:(float)a3;
- (void)setFrameCountThreshold:(unsigned int)a3;
- (void)setImageHeight:(unsigned int)a3;
- (void)setImageWidth:(unsigned int)a3;
- (void)setLandmarkVisibilityThreshold:(float)a3;
- (void)setModelsRootPath:(id)a3;
- (void)setMotionBlurFilterThreshold:(float)a3;
- (void)setUseEarSideSmoothPredictor:(BOOL)a3;
- (void)setUseMotionBlurFilter:(BOOL)a3;
- (void)setWriteDebugData:(BOOL)a3;
@end

@implementation VGEarPCACaptureOptions

- (VGEarPCACaptureOptions)init
{
  v14.receiver = self;
  v14.super_class = (Class)VGEarPCACaptureOptions;
  v2 = [(VGEarPCACaptureOptions *)&v14 init];
  if (v2)
  {
    v2->_imageWidth = [(id)objc_opt_class() defaultImageWidth];
    v2->_imageHeight = [(id)objc_opt_class() defaultImageHeight];
    [(id)objc_opt_class() defaultEarPresenceThreshold];
    v2->_earPresenceThreshold = v3;
    [(id)objc_opt_class() defaultEarOcclusionThreshold];
    v2->_earOcclusionThreshold = v4;
    [(id)objc_opt_class() defaultBboxVisibilityThreshold];
    v2->_bboxVisibilityThreshold = v5;
    v2->_useMotionBlurFilter = [(id)objc_opt_class() defaultUseMotionBlurFilter];
    [(id)objc_opt_class() defaultMotionBlurFilterThreshold];
    v2->_motionBlurFilterThreshold = v6;
    v2->_frameCountThreshold = [(id)objc_opt_class() frameCountThreshold];
    [(id)objc_opt_class() defaultLandmarkVisibilityThreshold];
    v2->_landmarkVisibilityThreshold = v7;
    v2->_useEarSideSmoothPredictor = [(id)objc_opt_class() defaultUseEarSideSmoothPredictor];
    v2->_earSideSmoothPredictorBufferCapacity = [(id)objc_opt_class() defaultEarSideSmoothPredictorBufferCapacity];
    [(id)objc_opt_class() defaultEarSideSmoothPredictorConfidenceThreshold];
    v2->_earSideSmoothPredictorConfidenceThreshold = v8;
    [(id)objc_opt_class() defaultFaceYawLimit];
    v2->_faceYawLimit = v9;
    v2->_writeDebugData = 0;
    debugDataPath = v2->_debugDataPath;
    v2->_debugDataPath = 0;

    modelsRootPath = v2->_modelsRootPath;
    v2->_modelsRootPath = 0;

    v12 = v2;
  }

  return v2;
}

- (VGEarPCACaptureOptions)initWithSuiteName:(id)a3
{
  id v4 = a3;
  float v5 = [(VGEarPCACaptureOptions *)self init];
  float v6 = v5;
  if (v5)
  {
    [(VGEarPCACaptureOptions *)v5 setDefaultsWithSuiteName:v4];
    float v7 = v6;
  }

  return v6;
}

- (void)setDefaultsWithSuiteName:(id)a3
{
  id v22 = a3;
  id v4 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:v22];
  float v5 = [v4 objectForKey:@"earPresenceThreshold"];

  if (v5)
  {
    [v4 floatForKey:@"earPresenceThreshold"];
    self->_earPresenceThreshold = v6;
  }
  float v7 = [v4 objectForKey:@"earOcclusionThreshold"];

  if (v7)
  {
    [v4 floatForKey:@"earOcclusionThreshold"];
    self->_earOcclusionThreshold = v8;
  }
  float v9 = [v4 objectForKey:@"earBoxVisibilityThreshold"];

  if (v9)
  {
    [v4 floatForKey:@"earBoxVisibilityThreshold"];
    self->_bboxVisibilityThreshold = v10;
  }
  v11 = [v4 objectForKey:@"useEarMotionBlurFilter"];

  if (v11) {
    self->_useMotionBlurFilter = [v4 BOOLForKey:@"useEarMotionBlurFilter"];
  }
  v12 = [v4 objectForKey:@"earMotionBlurFilterThreshold"];

  if (v12) {
    self->_motionBlurFilterThreshold = (float)[v4 BOOLForKey:@"earMotionBlurFilterThreshold"];
  }
  v13 = [v4 objectForKey:@"numberOfEarFrame"];

  if (v13) {
    self->_frameCountThreshold = [v4 integerForKey:@"numberOfEarFrame"];
  }
  objc_super v14 = [v4 objectForKey:@"earLandmarkVisibility"];

  if (v14)
  {
    [v4 floatForKey:@"earLandmarkVisibility"];
    self->_landmarkVisibilityThreshold = v15;
  }
  v16 = [v4 objectForKey:@"useEarSideSmoothPredictor"];

  if (v16) {
    self->_useEarSideSmoothPredictor = [v4 BOOLForKey:@"useEarSideSmoothPredictor"];
  }
  v17 = [v4 objectForKey:@"earSideSmoothPredictorBufferCapacity"];

  if (v17) {
    self->_earSideSmoothPredictorBufferCapacity = [v4 integerForKey:@"earSideSmoothPredictorBufferCapacity"];
  }
  v18 = [v4 objectForKey:@"earSideSmoothPredictorConfidenceThreshold"];

  if (v18)
  {
    [v4 floatForKey:@"earSideSmoothPredictorConfidenceThreshold"];
    self->_earSideSmoothPredictorConfidenceThreshold = v19;
  }
  v20 = [v4 objectForKey:@"faceYawLimitForEarPose"];

  if (v20)
  {
    [v4 floatForKey:@"faceYawLimitForEarPose"];
    self->_faceYawLimit = v21;
  }
}

- (id)description
{
  v2 = @"YES";
  if (self->_useEarSideSmoothPredictor) {
    float v3 = @"YES";
  }
  else {
    float v3 = @"NO";
  }
  if (!self->_useMotionBlurFilter) {
    v2 = @"NO";
  }
  return (id)[NSString stringWithFormat:@"Input image size (%u x %u) Frame count threshold %u Ear bbox detection visibility threshold %f Ear landmark detection visibility threshold %f Use ear side smooth predictor %@ (buffer capacity: %u, confidence threshold: %f) Use motion blur filter %@ Motion blur filter threshold %fFace yaw limit %f", self->_imageWidth, self->_imageHeight, self->_frameCountThreshold, self->_bboxVisibilityThreshold, self->_landmarkVisibilityThreshold, v3, self->_earSideSmoothPredictorBufferCapacity, self->_earSideSmoothPredictorConfidenceThreshold, v2, self->_motionBlurFilterThreshold, self->_faceYawLimit];
}

+ (unsigned)defaultImageWidth
{
  return 1440;
}

+ (unsigned)defaultImageHeight
{
  return 1920;
}

+ (unsigned)frameCountThreshold
{
  return 15;
}

+ (float)defaultEarPresenceThreshold
{
  return 0.8;
}

+ (float)defaultEarOcclusionThreshold
{
  return 0.8;
}

+ (float)defaultBboxVisibilityThreshold
{
  return 0.8;
}

+ (float)defaultLandmarkVisibilityThreshold
{
  return 0.8;
}

+ (BOOL)defaultUseEarSideSmoothPredictor
{
  return 1;
}

+ (unsigned)defaultEarSideSmoothPredictorBufferCapacity
{
  return 10;
}

+ (float)defaultEarSideSmoothPredictorConfidenceThreshold
{
  return 0.8;
}

+ (BOOL)defaultUseMotionBlurFilter
{
  return 1;
}

+ (float)defaultMotionBlurFilterThreshold
{
  return 4.8;
}

+ (float)defaultFaceYawLimit
{
  return 35.0;
}

- (unsigned)frameCountThreshold
{
  return self->_frameCountThreshold;
}

- (void)setFrameCountThreshold:(unsigned int)a3
{
  self->_frameCountThreshold = a3;
}

- (float)earPresenceThreshold
{
  return self->_earPresenceThreshold;
}

- (void)setEarPresenceThreshold:(float)a3
{
  self->_earPresenceThreshold = a3;
}

- (float)earOcclusionThreshold
{
  return self->_earOcclusionThreshold;
}

- (void)setEarOcclusionThreshold:(float)a3
{
  self->_earOcclusionThreshold = a3;
}

- (float)bboxVisibilityThreshold
{
  return self->_bboxVisibilityThreshold;
}

- (void)setBboxVisibilityThreshold:(float)a3
{
  self->_bboxVisibilityThreshold = a3;
}

- (float)landmarkVisibilityThreshold
{
  return self->_landmarkVisibilityThreshold;
}

- (void)setLandmarkVisibilityThreshold:(float)a3
{
  self->_landmarkVisibilityThreshold = a3;
}

- (BOOL)useEarSideSmoothPredictor
{
  return self->_useEarSideSmoothPredictor;
}

- (void)setUseEarSideSmoothPredictor:(BOOL)a3
{
  self->_useEarSideSmoothPredictor = a3;
}

- (unsigned)earSideSmoothPredictorBufferCapacity
{
  return self->_earSideSmoothPredictorBufferCapacity;
}

- (void)setEarSideSmoothPredictorBufferCapacity:(unsigned int)a3
{
  self->_earSideSmoothPredictorBufferCapacity = a3;
}

- (float)earSideSmoothPredictorConfidenceThreshold
{
  return self->_earSideSmoothPredictorConfidenceThreshold;
}

- (void)setEarSideSmoothPredictorConfidenceThreshold:(float)a3
{
  self->_earSideSmoothPredictorConfidenceThreshold = a3;
}

- (float)faceYawLimit
{
  return self->_faceYawLimit;
}

- (void)setFaceYawLimit:(float)a3
{
  self->_faceYawLimit = a3;
}

- (unsigned)imageWidth
{
  return self->_imageWidth;
}

- (void)setImageWidth:(unsigned int)a3
{
  self->_imageWidth = a3;
}

- (unsigned)imageHeight
{
  return self->_imageHeight;
}

- (void)setImageHeight:(unsigned int)a3
{
  self->_imageHeight = a3;
}

- (BOOL)writeDebugData
{
  return self->_writeDebugData;
}

- (void)setWriteDebugData:(BOOL)a3
{
  self->_writeDebugData = a3;
}

- (NSString)debugDataPath
{
  return self->_debugDataPath;
}

- (void)setDebugDataPath:(id)a3
{
}

- (NSString)modelsRootPath
{
  return self->_modelsRootPath;
}

- (void)setModelsRootPath:(id)a3
{
}

- (BOOL)useMotionBlurFilter
{
  return self->_useMotionBlurFilter;
}

- (void)setUseMotionBlurFilter:(BOOL)a3
{
  self->_useMotionBlurFilter = a3;
}

- (float)motionBlurFilterThreshold
{
  return self->_motionBlurFilterThreshold;
}

- (void)setMotionBlurFilterThreshold:(float)a3
{
  self->_motionBlurFilterThreshold = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelsRootPath, 0);

  objc_storeStrong((id *)&self->_debugDataPath, 0);
}

@end