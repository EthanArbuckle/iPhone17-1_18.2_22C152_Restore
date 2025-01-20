@interface PIPhotoEffect3DHDR
- (CIImage)inputDepthMap;
- (float)inputThreshold;
- (void)configureFilter:(id)a3;
- (void)setInputDepthMap:(id)a3;
- (void)setInputThreshold:(float)a3;
@end

@implementation PIPhotoEffect3DHDR

- (void).cxx_destruct
{
}

- (void)setInputThreshold:(float)a3
{
  self->_inputThreshold = a3;
}

- (float)inputThreshold
{
  return self->_inputThreshold;
}

- (void)setInputDepthMap:(id)a3
{
}

- (CIImage)inputDepthMap
{
  return (CIImage *)objc_getProperty(self, a2, 96, 1);
}

- (void)configureFilter:(id)a3
{
  id v7 = a3;
  *(float *)&double v4 = self->_inputThreshold;
  v5 = [NSNumber numberWithFloat:v4];
  [v7 setValue:v5 forKey:@"inputThreshold"];

  inputDepthMap = self->_inputDepthMap;
  if (inputDepthMap) {
    [v7 setValue:inputDepthMap forKey:@"inputDepthMap"];
  }
}

@end