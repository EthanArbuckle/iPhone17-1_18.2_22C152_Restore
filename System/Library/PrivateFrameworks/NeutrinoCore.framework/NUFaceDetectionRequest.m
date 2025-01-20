@interface NUFaceDetectionRequest
- (NSString)description;
- (NUFaceDetectionRequest)initWithComposition:(id)a3;
- (NUScalePolicy)scalePolicy;
- (id)copyWithZone:(_NSZone *)a3;
- (id)newRenderJob;
- (int64_t)maxFaceCount;
- (int64_t)mediaComponentType;
- (void)setMaxFaceCount:(int64_t)a3;
- (void)setScalePolicy:(id)a3;
@end

@implementation NUFaceDetectionRequest

- (void).cxx_destruct
{
}

- (void)setScalePolicy:(id)a3
{
}

- (NUScalePolicy)scalePolicy
{
  return (NUScalePolicy *)objc_getProperty(self, a2, 160, 1);
}

- (void)setMaxFaceCount:(int64_t)a3
{
  self->_maxFaceCount = a3;
}

- (int64_t)maxFaceCount
{
  return self->_maxFaceCount;
}

- (int64_t)mediaComponentType
{
  return 1;
}

- (id)newRenderJob
{
  v3 = [NUFaceDetectionJob alloc];

  return [(NUFaceDetectionJob *)v3 initWithFaceDetectionRequest:self];
}

- (NSString)description
{
  v8.receiver = self;
  v8.super_class = (Class)NUFaceDetectionRequest;
  v3 = [(NURenderRequest *)&v8 description];
  int64_t v4 = [(NUFaceDetectionRequest *)self maxFaceCount];
  v5 = [(NUFaceDetectionRequest *)self scalePolicy];
  v6 = [v3 stringByAppendingFormat:@" Max Face Count: %ld, Scale Policy: %@", v4, v5];

  return (NSString *)v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)NUFaceDetectionRequest;
  int64_t v4 = [(NURenderRequest *)&v7 copyWithZone:a3];
  v5 = v4;
  if (v4)
  {
    v4[19] = self->_maxFaceCount;
    objc_storeStrong(v4 + 20, self->_scalePolicy);
  }
  return v5;
}

- (NUFaceDetectionRequest)initWithComposition:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)NUFaceDetectionRequest;
  v3 = [(NURenderRequest *)&v7 initWithComposition:a3];
  v3->_maxFaceCount = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v4 = +[NUFixedScalePolicy oneToOneScalePolicy];
  scalePolicy = v3->_scalePolicy;
  v3->_scalePolicy = (NUScalePolicy *)v4;

  return v3;
}

@end