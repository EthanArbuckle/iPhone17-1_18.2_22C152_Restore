@interface NUClassifyPipelineImageCorrectionRequest
- (NSString)description;
- (NUClassifyPipelineImageCorrectionRequest)initWithComposition:(id)a3;
- (NUScalePolicy)scalePolicy;
- (id)copyWithZone:(_NSZone *)a3;
- (id)newRenderJob;
- (int64_t)mediaComponentType;
- (void)setScalePolicy:(id)a3;
@end

@implementation NUClassifyPipelineImageCorrectionRequest

- (void).cxx_destruct
{
}

- (void)setScalePolicy:(id)a3
{
}

- (NUScalePolicy)scalePolicy
{
  return (NUScalePolicy *)objc_getProperty(self, a2, 152, 1);
}

- (int64_t)mediaComponentType
{
  return 1;
}

- (id)newRenderJob
{
  v3 = [NUClassifyPipelineImageCorrectionJob alloc];

  return [(NUClassifyPipelineImageCorrectionJob *)v3 initWithClassifyPipelineImageCorrectionRequest:self];
}

- (NSString)description
{
  v7.receiver = self;
  v7.super_class = (Class)NUClassifyPipelineImageCorrectionRequest;
  v3 = [(NURenderRequest *)&v7 description];
  v4 = [(NUClassifyPipelineImageCorrectionRequest *)self scalePolicy];
  v5 = [v3 stringByAppendingFormat:@" Scale Policy: %@", v4];

  return (NSString *)v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)NUClassifyPipelineImageCorrectionRequest;
  v4 = [(NURenderRequest *)&v7 copyWithZone:a3];
  v5 = v4;
  if (v4) {
    objc_storeStrong(v4 + 19, self->_scalePolicy);
  }
  return v5;
}

- (NUClassifyPipelineImageCorrectionRequest)initWithComposition:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)NUClassifyPipelineImageCorrectionRequest;
  v3 = [(NURenderRequest *)&v7 initWithComposition:a3];
  uint64_t v4 = +[NUFixedScalePolicy oneToOneScalePolicy];
  scalePolicy = v3->_scalePolicy;
  v3->_scalePolicy = (NUScalePolicy *)v4;

  return v3;
}

@end