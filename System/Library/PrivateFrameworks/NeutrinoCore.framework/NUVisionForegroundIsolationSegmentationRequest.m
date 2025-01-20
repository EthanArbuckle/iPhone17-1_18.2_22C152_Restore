@interface NUVisionForegroundIsolationSegmentationRequest
- (NUVisionForegroundIsolationSegmentationRequest)initWithComposition:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)newRenderJob;
- (int64_t)mediaComponentType;
@end

@implementation NUVisionForegroundIsolationSegmentationRequest

- (id)copyWithZone:(_NSZone *)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NUVisionForegroundIsolationSegmentationRequest;
  return [(NURenderRequest *)&v4 copyWithZone:a3];
}

- (int64_t)mediaComponentType
{
  return 1;
}

- (id)newRenderJob
{
  v3 = [NUVisionForegroundIsolationSegmentationJob alloc];

  return [(NURenderJob *)v3 initWithRequest:self];
}

- (NUVisionForegroundIsolationSegmentationRequest)initWithComposition:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NUVisionForegroundIsolationSegmentationRequest;
  v3 = [(NURenderRequest *)&v5 initWithComposition:a3];
  [(NURenderRequest *)v3 setSampleMode:2];
  return v3;
}

@end