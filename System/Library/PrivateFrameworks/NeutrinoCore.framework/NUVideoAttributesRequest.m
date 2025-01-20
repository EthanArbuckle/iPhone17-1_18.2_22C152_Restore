@interface NUVideoAttributesRequest
- (id)newRenderJob;
- (int64_t)mediaComponentType;
@end

@implementation NUVideoAttributesRequest

- (int64_t)mediaComponentType
{
  v2 = [(NURenderRequest *)self composition];
  uint64_t v3 = [v2 mediaType];

  if ((unint64_t)(v3 - 1) > 2) {
    return 0;
  }
  else {
    return qword_1A9A72EF0[v3 - 1];
  }
}

- (id)newRenderJob
{
  uint64_t v3 = [NUVideoAttributesJob alloc];

  return [(NURenderJob *)v3 initWithRequest:self];
}

@end