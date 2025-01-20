@interface SSScreenCapturerScreenshotOptions
- (UIImage)preparedImage;
- (unint64_t)externalFlashLayerRenderID;
- (unsigned)externalFlashLayerContextID;
- (void)setExternalFlashLayerContextID:(unsigned int)a3;
- (void)setExternalFlashLayerRenderID:(unint64_t)a3;
- (void)setPreparedImage:(id)a3;
@end

@implementation SSScreenCapturerScreenshotOptions

- (UIImage)preparedImage
{
  return self->_preparedImage;
}

- (void)setPreparedImage:(id)a3
{
}

- (unint64_t)externalFlashLayerRenderID
{
  return self->_externalFlashLayerRenderID;
}

- (void)setExternalFlashLayerRenderID:(unint64_t)a3
{
  self->_externalFlashLayerRenderID = a3;
}

- (unsigned)externalFlashLayerContextID
{
  return self->_externalFlashLayerContextID;
}

- (void)setExternalFlashLayerContextID:(unsigned int)a3
{
  self->_externalFlashLayerContextID = a3;
}

- (void).cxx_destruct
{
}

@end