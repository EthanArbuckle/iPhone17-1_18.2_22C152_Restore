@interface NUImagePropertiesRequest
- (id)newRenderJob;
- (int64_t)mediaComponentType;
@end

@implementation NUImagePropertiesRequest

- (int64_t)mediaComponentType
{
  v2 = [(NURenderRequest *)self internalComposition];
  uint64_t v3 = [v2 mediaType];

  if (v3 == 2) {
    return 2;
  }
  else {
    return 1;
  }
}

- (id)newRenderJob
{
  uint64_t v3 = [NUImagePropertiesJob alloc];

  return [(NURenderJob *)v3 initWithRequest:self];
}

@end