@interface CRTextDetectorModelV3Input
- (CRTextDetectorModelV3Input)initWithImg_input:(__CVBuffer *)a3;
- (NSSet)featureNames;
- (__CVBuffer)img_input;
- (id)featureValueForName:(id)a3;
- (void)setImg_input:(__CVBuffer *)a3;
@end

@implementation CRTextDetectorModelV3Input

- (CRTextDetectorModelV3Input)initWithImg_input:(__CVBuffer *)a3
{
  if (self) {
    self->_img_input = a3;
  }
  return self;
}

- (NSSet)featureNames
{
  return (NSSet *)[MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F3935B90];
}

- (id)featureValueForName:(id)a3
{
  if ([a3 isEqualToString:@"img_input"])
  {
    v4 = [MEMORY[0x1E4F1E950] featureValueWithPixelBuffer:self->_img_input];
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (__CVBuffer)img_input
{
  return self->_img_input;
}

- (void)setImg_input:(__CVBuffer *)a3
{
  self->_img_input = a3;
}

@end