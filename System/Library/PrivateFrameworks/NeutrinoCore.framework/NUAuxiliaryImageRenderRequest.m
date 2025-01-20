@interface NUAuxiliaryImageRenderRequest
- (BOOL)skipRenderIfNotRequired;
- (NUAuxiliaryImageRenderRequest)initWithComposition:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)newRenderJob;
- (int64_t)auxiliaryImageType;
- (int64_t)mediaComponentType;
- (void)setAuxiliaryImageType:(int64_t)a3;
- (void)setSkipRenderIfNotRequired:(BOOL)a3;
@end

@implementation NUAuxiliaryImageRenderRequest

- (void)setSkipRenderIfNotRequired:(BOOL)a3
{
  self->_skipRenderIfNotRequired = a3;
}

- (BOOL)skipRenderIfNotRequired
{
  return self->_skipRenderIfNotRequired;
}

- (void)setAuxiliaryImageType:(int64_t)a3
{
  self->_auxiliaryImageType = a3;
}

- (int64_t)auxiliaryImageType
{
  return self->_auxiliaryImageType;
}

- (id)newRenderJob
{
  v3 = [NUAuxiliaryImageRenderJob alloc];

  return [(NURenderJob *)v3 initWithRequest:self];
}

- (int64_t)mediaComponentType
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NUAuxiliaryImageRenderRequest;
  id result = [(NURenderRequest *)&v5 copyWithZone:a3];
  *((void *)result + 20) = self->_auxiliaryImageType;
  *((unsigned char *)result + 152) = self->_skipRenderIfNotRequired;
  return result;
}

- (NUAuxiliaryImageRenderRequest)initWithComposition:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NUAuxiliaryImageRenderRequest;
  id result = [(NURenderRequest *)&v4 initWithComposition:a3];
  result->_auxiliaryImageType = 0;
  return result;
}

@end