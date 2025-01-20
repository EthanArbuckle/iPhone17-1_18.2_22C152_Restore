@interface MLPData
- (NSData)classDist;
- (NSData)oneHot;
- (NSData)pixels;
- (unsigned)label;
- (void)setClassDist:(id)a3;
- (void)setLabel:(unsigned int)a3;
- (void)setOneHot:(id)a3;
- (void)setPixels:(id)a3;
@end

@implementation MLPData

- (unsigned)label
{
  return self->_label;
}

- (void)setLabel:(unsigned int)a3
{
  self->_label = a3;
}

- (NSData)oneHot
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
}

- (void)setOneHot:(id)a3
{
}

- (NSData)pixels
{
  return (NSData *)objc_getProperty(self, a2, 24, 1);
}

- (void)setPixels:(id)a3
{
}

- (NSData)classDist
{
  return (NSData *)objc_getProperty(self, a2, 32, 1);
}

- (void)setClassDist:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_classDist, 0);
  objc_storeStrong((id *)&self->_pixels, 0);

  objc_storeStrong((id *)&self->_oneHot, 0);
}

@end