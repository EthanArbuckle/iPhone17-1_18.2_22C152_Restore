@interface NRFProcessorInferenceResults
- (NSArray)faceLandmarks;
- (NSArray)lowResPersonInstanceBoundingBoxes;
- (NSArray)lowResPersonInstanceConfidences;
- (NSArray)lowResPersonInstanceMasks;
- (NSArray)skinToneClassificationsForFaces;
- (NSDictionary)smartCameraClassifications;
- (NSString)smartCameraSceneType;
- (__CVBuffer)hairMask;
- (__CVBuffer)highResPersonMask;
- (__CVBuffer)personMask;
- (__CVBuffer)skinMask;
- (__CVBuffer)skyMask;
- (int)status;
- (void)dealloc;
- (void)setFaceLandmarks:(id)a3;
- (void)setHairMask:(__CVBuffer *)a3;
- (void)setHighResPersonMask:(__CVBuffer *)a3;
- (void)setLowResPersonInstanceBoundingBoxes:(id)a3;
- (void)setLowResPersonInstanceConfidences:(id)a3;
- (void)setLowResPersonInstanceMasks:(id)a3;
- (void)setPersonMask:(__CVBuffer *)a3;
- (void)setSkinMask:(__CVBuffer *)a3;
- (void)setSkinToneClassificationsForFaces:(id)a3;
- (void)setSkyMask:(__CVBuffer *)a3;
- (void)setSmartCameraClassifications:(id)a3;
- (void)setSmartCameraSceneType:(id)a3;
- (void)setStatus:(int)a3;
@end

@implementation NRFProcessorInferenceResults

- (void)dealloc
{
  CVPixelBufferRelease(self->_skinMask);
  CVPixelBufferRelease(self->_hairMask);
  CVPixelBufferRelease(self->_skyMask);
  CVPixelBufferRelease(self->_personMask);
  CVPixelBufferRelease(self->_highResPersonMask);
  v3.receiver = self;
  v3.super_class = (Class)NRFProcessorInferenceResults;
  [(NRFProcessorInferenceResults *)&v3 dealloc];
}

- (__CVBuffer)skinMask
{
  return self->_skinMask;
}

- (void)setSkinMask:(__CVBuffer *)a3
{
}

- (__CVBuffer)hairMask
{
  return self->_hairMask;
}

- (void)setHairMask:(__CVBuffer *)a3
{
}

- (__CVBuffer)skyMask
{
  return self->_skyMask;
}

- (void)setSkyMask:(__CVBuffer *)a3
{
}

- (__CVBuffer)personMask
{
  return self->_personMask;
}

- (void)setPersonMask:(__CVBuffer *)a3
{
}

- (__CVBuffer)highResPersonMask
{
  return self->_highResPersonMask;
}

- (void)setHighResPersonMask:(__CVBuffer *)a3
{
}

- (NSArray)faceLandmarks
{
  return self->_faceLandmarks;
}

- (void)setFaceLandmarks:(id)a3
{
}

- (int)status
{
  return self->_status;
}

- (void)setStatus:(int)a3
{
  self->_status = a3;
}

- (NSArray)lowResPersonInstanceMasks
{
  return self->_lowResPersonInstanceMasks;
}

- (void)setLowResPersonInstanceMasks:(id)a3
{
}

- (NSArray)lowResPersonInstanceConfidences
{
  return self->_lowResPersonInstanceConfidences;
}

- (void)setLowResPersonInstanceConfidences:(id)a3
{
}

- (NSArray)lowResPersonInstanceBoundingBoxes
{
  return self->_lowResPersonInstanceBoundingBoxes;
}

- (void)setLowResPersonInstanceBoundingBoxes:(id)a3
{
}

- (NSDictionary)smartCameraClassifications
{
  return self->_smartCameraClassifications;
}

- (void)setSmartCameraClassifications:(id)a3
{
}

- (NSString)smartCameraSceneType
{
  return self->_smartCameraSceneType;
}

- (void)setSmartCameraSceneType:(id)a3
{
}

- (NSArray)skinToneClassificationsForFaces
{
  return self->_skinToneClassificationsForFaces;
}

- (void)setSkinToneClassificationsForFaces:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_skinToneClassificationsForFaces, 0);
  objc_storeStrong((id *)&self->_smartCameraSceneType, 0);
  objc_storeStrong((id *)&self->_smartCameraClassifications, 0);
  objc_storeStrong((id *)&self->_lowResPersonInstanceBoundingBoxes, 0);
  objc_storeStrong((id *)&self->_lowResPersonInstanceConfidences, 0);
  objc_storeStrong((id *)&self->_lowResPersonInstanceMasks, 0);

  objc_storeStrong((id *)&self->_faceLandmarks, 0);
}

@end