@interface GQDTexturedImageFill
+ (const)stateForReading;
- (id)color;
- (id)imageBinary;
- (int)readAttributesFromReader:(_xmlTextReader *)a3 processor:(id)a4;
- (int)technique;
- (void)dealloc;
- (void)invalidateFilteredImage;
- (void)setColor:(id)a3;
@end

@implementation GQDTexturedImageFill

+ (const)stateForReading
{
  return (const StateSpec *)&unk_9FC40;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)GQDTexturedImageFill;
  [(GQDTexturedImageFill *)&v3 dealloc];
}

- (int)technique
{
  return self->mTechnique;
}

- (id)color
{
  return self->mColor;
}

- (id)imageBinary
{
  return [(GQDFilteredImage *)self->mFilteredImage imageBinary];
}

- (int)readAttributesFromReader:(_xmlTextReader *)a3 processor:(id)a4
{
  if (sub_43A9C(a3, qword_A35E8, (xmlChar *)"technique", (uint64_t)&dword_A40E8, &self->mTechnique)) {
    return 1;
  }
  else {
    return 3;
  }
}

- (void)invalidateFilteredImage
{
  self->mFilteredImage = 0;
}

- (void)setColor:(id)a3
{
  mColor = self->mColor;
  if (mColor != a3)
  {

    self->mColor = (GQDColor *)a3;
  }
}

@end