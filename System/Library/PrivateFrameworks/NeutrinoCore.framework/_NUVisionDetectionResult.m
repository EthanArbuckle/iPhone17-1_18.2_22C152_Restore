@interface _NUVisionDetectionResult
- ($0AC6E346AE4835514AAA8AC86D8F4844)imageSize;
- (NSArray)observations;
- (NSString)description;
- (void)setImageSize:(id)a3;
- (void)setObservations:(id)a3;
@end

@implementation _NUVisionDetectionResult

- (void).cxx_destruct
{
}

- (void)setImageSize:(id)a3
{
  $0AC6E346AE4835514AAA8AC86D8F4844 v3 = a3;
  objc_copyStruct(&self->imageSize, &v3, 16, 1, 0);
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)imageSize
{
  objc_copyStruct(v4, &self->imageSize, 16, 1, 0);
  int64_t v2 = v4[0];
  int64_t v3 = v4[1];
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

- (void)setObservations:(id)a3
{
}

- (NSArray)observations
{
  return self->observations;
}

- (NSString)description
{
  int64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = [(_NUVisionDetectionResult *)self imageSize];
  v7 = [NSString stringWithFormat:@"{%ld, %ld}", v5, v6];
  v8 = [(_NUVisionDetectionResult *)self observations];
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; imageSize = %@, observationCount = %lu>",
    v4,
    self,
    v7,
  v9 = [v8 count]);

  return (NSString *)v9;
}

@end