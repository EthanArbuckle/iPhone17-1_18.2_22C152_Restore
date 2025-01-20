@interface GQDFilteredImage
+ (const)stateForReading;
- (id)imageBinary;
- (void)dealloc;
@end

@implementation GQDFilteredImage

- (id)imageBinary
{
  id result = self->mFilteredImageBinary;
  if (!result) {
    return self->mOriginalImageBinary;
  }
  return result;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)GQDFilteredImage;
  [(GQDFilteredImage *)&v3 dealloc];
}

+ (const)stateForReading
{
  return (const StateSpec *)&unk_A3E90;
}

@end