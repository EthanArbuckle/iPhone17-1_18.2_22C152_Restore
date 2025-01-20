@interface PIAutoLoopAnalysisRequest
- (id)copyWithZone:(_NSZone *)a3;
- (id)newRenderJob;
- (int64_t)flavor;
- (int64_t)mediaComponentType;
- (void)setFlavor:(int64_t)a3;
@end

@implementation PIAutoLoopAnalysisRequest

- (void)setFlavor:(int64_t)a3
{
  self->_flavor = a3;
}

- (int64_t)flavor
{
  return self->_flavor;
}

- (int64_t)mediaComponentType
{
  return 2;
}

- (id)newRenderJob
{
  v3 = [PIAutoLoopAnalysisJob alloc];
  return [(NURenderJob *)v3 initWithRequest:self];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PIAutoLoopAnalysisRequest;
  id result = [(NURenderRequest *)&v5 copyWithZone:a3];
  *((void *)result + 19) = self->_flavor;
  return result;
}

@end