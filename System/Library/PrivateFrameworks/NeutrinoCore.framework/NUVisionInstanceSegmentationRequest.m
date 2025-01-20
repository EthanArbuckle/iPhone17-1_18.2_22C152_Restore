@interface NUVisionInstanceSegmentationRequest
+ (int64_t)maximumTargetPoints;
- (NSArray)targetSamplePoints;
- (NUScalePolicy)scalePolicy;
- (NUVisionInstanceSegmentationRequest)initWithComposition:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)newRenderJob;
- (int64_t)mediaComponentType;
- (void)setScalePolicy:(id)a3;
- (void)setTargetSamplePoints:(id)a3;
@end

@implementation NUVisionInstanceSegmentationRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetSamplePoints, 0);

  objc_storeStrong((id *)&self->_scalePolicy, 0);
}

- (void)setTargetSamplePoints:(id)a3
{
}

- (NSArray)targetSamplePoints
{
  return self->_targetSamplePoints;
}

- (void)setScalePolicy:(id)a3
{
}

- (NUScalePolicy)scalePolicy
{
  return self->_scalePolicy;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)NUVisionInstanceSegmentationRequest;
  v4 = [(NURenderRequest *)&v10 copyWithZone:a3];
  if (v4)
  {
    uint64_t v5 = [(NUVisionInstanceSegmentationRequest *)self targetSamplePoints];
    v6 = (void *)v4[20];
    v4[20] = v5;

    uint64_t v7 = [(NUVisionInstanceSegmentationRequest *)self scalePolicy];
    v8 = (void *)v4[19];
    v4[19] = v7;
  }
  return v4;
}

- (int64_t)mediaComponentType
{
  return 1;
}

- (id)newRenderJob
{
  v3 = [NUVisionInstanceSegmentationJob alloc];

  return [(NURenderJob *)v3 initWithRequest:self];
}

- (NUVisionInstanceSegmentationRequest)initWithComposition:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)NUVisionInstanceSegmentationRequest;
  v3 = [(NURenderRequest *)&v8 initWithComposition:a3];
  uint64_t v4 = +[NUGlobalSettings inpaintSegmentationMaxInputSize];
  if (v4 < 1)
  {
    uint64_t v5 = +[NUFixedScalePolicy oneToOneScalePolicy];
  }
  else
  {
    uint64_t v5 = [[NUPixelCountScalePolicy alloc] initWithTargetPixelCount:v4];
  }
  v6 = v5;
  [(NUVisionInstanceSegmentationRequest *)v3 setScalePolicy:v5];

  [(NURenderRequest *)v3 setSampleMode:2];
  [(NURenderRequest *)v3 setIsOneShot:1];
  return v3;
}

+ (int64_t)maximumTargetPoints
{
  int64_t result = _maximumTargetPoints;
  if (!_maximumTargetPoints)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F45838]);
    int64_t v4 = [v3 maximumTargetPoints];

    return v4;
  }
  return result;
}

@end