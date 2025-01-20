@interface _NUFaceDetectionResult
- ($0AC6E346AE4835514AAA8AC86D8F4844)imageSize;
- (NSArray)faces;
- (void)setFaces:(id)a3;
- (void)setImageSize:(id)a3;
@end

@implementation _NUFaceDetectionResult

- (void).cxx_destruct
{
}

- (void)setImageSize:(id)a3
{
  $0AC6E346AE4835514AAA8AC86D8F4844 v3 = a3;
  objc_copyStruct(&self->_imageSize, &v3, 16, 1, 0);
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)imageSize
{
  objc_copyStruct(v4, &self->_imageSize, 16, 1, 0);
  int64_t v2 = v4[0];
  int64_t v3 = v4[1];
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

- (void)setFaces:(id)a3
{
}

- (NSArray)faces
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

@end