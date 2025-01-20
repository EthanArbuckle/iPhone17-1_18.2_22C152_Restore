@interface GQDMedia
+ (const)stateForReading;
- (CGPath)alphaMaskBezier;
- (id)cropGeometry;
- (id)imageBinary;
- (id)maskingShapePath;
- (void)dealloc;
@end

@implementation GQDMedia

+ (const)stateForReading
{
  return (const StateSpec *)&unk_9EE50;
}

- (void)dealloc
{
  mAlphaMaskBezier = self->mAlphaMaskBezier;
  if (mAlphaMaskBezier) {
    CFRelease(mAlphaMaskBezier);
  }
  v4.receiver = self;
  v4.super_class = (Class)GQDMedia;
  [(GQDGraphic *)&v4 dealloc];
}

- (id)imageBinary
{
  if (self->mOriginalImageBinary) {
    return self->mOriginalImageBinary;
  }
  else {
    return [(GQDFilteredImage *)self->mFilteredImage imageBinary];
  }
}

- (id)cropGeometry
{
  return self->mCropGeometry;
}

- (id)maskingShapePath
{
  return self->mMaskingShapePath;
}

- (CGPath)alphaMaskBezier
{
  return self->mAlphaMaskBezier;
}

@end