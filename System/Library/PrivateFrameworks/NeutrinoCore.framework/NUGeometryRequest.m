@interface NUGeometryRequest
- (NUGeometryRequest)initWithComposition:(id)a3;
- (NUScalePolicy)scalePolicy;
- (id)copyWithZone:(_NSZone *)a3;
- (id)newRenderJob;
- (int64_t)mediaComponentType;
- (void)setScalePolicy:(id)a3;
@end

@implementation NUGeometryRequest

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
  v2 = [(NURenderRequest *)self composition];
  uint64_t v3 = [v2 mediaType];

  if ((unint64_t)(v3 - 1) > 2) {
    return 0;
  }
  else {
    return qword_1A9A74770[v3 - 1];
  }
}

- (id)newRenderJob
{
  uint64_t v3 = [NUGeometryJob alloc];

  return [(NURenderJob *)v3 initWithRequest:self];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)NUGeometryRequest;
  v4 = [(NURenderRequest *)&v7 copyWithZone:a3];
  v5 = v4;
  if (v4) {
    objc_storeStrong(v4 + 19, self->_scalePolicy);
  }
  return v5;
}

- (NUGeometryRequest)initWithComposition:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)NUGeometryRequest;
  uint64_t v3 = [(NURenderRequest *)&v7 initWithComposition:a3];
  uint64_t v4 = +[NUFixedScalePolicy oneToOneScalePolicy];
  scalePolicy = v3->_scalePolicy;
  v3->_scalePolicy = (NUScalePolicy *)v4;

  return v3;
}

@end