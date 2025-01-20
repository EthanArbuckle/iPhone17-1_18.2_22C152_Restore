@interface CRTextDetectorModelInput
- (CRTextDetectorModelInput)initWithData:(__CVBuffer *)a3;
- (NSSet)featureNames;
- (__CVBuffer)data;
- (id)featureValueForName:(id)a3;
- (void)setData:(__CVBuffer *)a3;
@end

@implementation CRTextDetectorModelInput

- (CRTextDetectorModelInput)initWithData:(__CVBuffer *)a3
{
  if (self) {
    self->_data = a3;
  }
  return self;
}

- (NSSet)featureNames
{
  return (NSSet *)[MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F3933358];
}

- (id)featureValueForName:(id)a3
{
  if ([a3 isEqualToString:@"data"])
  {
    v4 = [MEMORY[0x1E4F1E950] featureValueWithPixelBuffer:self->_data];
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (__CVBuffer)data
{
  return self->_data;
}

- (void)setData:(__CVBuffer *)a3
{
  self->_data = a3;
}

@end