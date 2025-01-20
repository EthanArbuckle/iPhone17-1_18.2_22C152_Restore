@interface NUAuxiliaryPropertiesRequest
- (NUAuxiliaryPropertiesRequest)initWithComposition:(id)a3;
- (id)newRenderJob;
- (int64_t)mediaComponentType;
@end

@implementation NUAuxiliaryPropertiesRequest

- (id)newRenderJob
{
  v3 = [NUAuxiliaryPropertiesRenderJob alloc];

  return [(NURenderJob *)v3 initWithRequest:self];
}

- (int64_t)mediaComponentType
{
  return 1;
}

- (NUAuxiliaryPropertiesRequest)initWithComposition:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NUAuxiliaryPropertiesRequest;
  return [(NURenderRequest *)&v4 initWithComposition:a3];
}

@end