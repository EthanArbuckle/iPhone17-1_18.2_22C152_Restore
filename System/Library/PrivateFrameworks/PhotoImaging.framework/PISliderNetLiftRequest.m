@interface PISliderNetLiftRequest
- (id)newRenderJob;
- (int64_t)mediaComponentType;
@end

@implementation PISliderNetLiftRequest

- (id)newRenderJob
{
  v3 = [PISliderNetLiftJob alloc];
  return [(NURenderJob *)v3 initWithRequest:self];
}

- (int64_t)mediaComponentType
{
  return 1;
}

@end