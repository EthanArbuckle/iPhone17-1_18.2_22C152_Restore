@interface NUVisionSegmentationRequest
+ (void)warmUp;
- (BOOL)produceConfidenceMap;
- (NUScalePolicy)scalePolicy;
- (NUVisionSegmentationRequest)initWithComposition:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)newRenderJob;
- (int64_t)mediaComponentType;
- (int64_t)segmentationType;
- (int64_t)visionSegmentationPolicy;
- (void)setProduceConfidenceMap:(BOOL)a3;
- (void)setScalePolicy:(id)a3;
- (void)setSegmentationType:(int64_t)a3;
- (void)setVisionSegmentationPolicy:(int64_t)a3;
- (void)takePropertiesFromRequest:(id)a3;
@end

@implementation NUVisionSegmentationRequest

- (void).cxx_destruct
{
}

- (void)setScalePolicy:(id)a3
{
}

- (NUScalePolicy)scalePolicy
{
  return self->_scalePolicy;
}

- (void)setVisionSegmentationPolicy:(int64_t)a3
{
  self->_visionSegmentationPolicy = a3;
}

- (int64_t)visionSegmentationPolicy
{
  return self->_visionSegmentationPolicy;
}

- (void)setProduceConfidenceMap:(BOOL)a3
{
  self->_produceConfidenceMap = a3;
}

- (BOOL)produceConfidenceMap
{
  return self->_produceConfidenceMap;
}

- (void)setSegmentationType:(int64_t)a3
{
  self->_segmentationType = a3;
}

- (int64_t)segmentationType
{
  return self->_segmentationType;
}

- (int64_t)mediaComponentType
{
  return 1;
}

- (id)newRenderJob
{
  v3 = [NUVisionSegmentationJob alloc];

  return [(NUVisionSegmentationJob *)v3 initWithVisionSegmentationRequest:self];
}

- (id)description
{
  v11.receiver = self;
  v11.super_class = (Class)NUVisionSegmentationRequest;
  v3 = [(NURenderRequest *)&v11 description];
  unint64_t v4 = [(NUVisionSegmentationRequest *)self segmentationType] - 1;
  if (v4 > 2) {
    v5 = @"Unknown";
  }
  else {
    v5 = off_1E5D95400[v4];
  }
  unint64_t v6 = [(NUVisionSegmentationRequest *)self visionSegmentationPolicy] - 1;
  if (v6 > 2) {
    v7 = @"First";
  }
  else {
    v7 = off_1E5D95418[v6];
  }
  v8 = [(NUVisionSegmentationRequest *)self scalePolicy];
  v9 = [v3 stringByAppendingFormat:@"Segmentation Type: %@, Vision Segmentation Policy: %@, Scale Policy: %@", v5, v7, v8];

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)NUVisionSegmentationRequest;
  unint64_t v4 = [(NURenderRequest *)&v7 copyWithZone:a3];
  v5 = v4;
  if (v4)
  {
    objc_storeStrong(v4 + 22, self->_scalePolicy);
    v5[20] = self->_segmentationType;
    v5[21] = self->_visionSegmentationPolicy;
    *((unsigned char *)v5 + 152) = self->_produceConfidenceMap;
  }
  return v5;
}

- (void)takePropertiesFromRequest:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(NURenderRequest *)self sampleMode];
  v6.receiver = self;
  v6.super_class = (Class)NUVisionSegmentationRequest;
  [(NURenderRequest *)&v6 takePropertiesFromRequest:v4];

  [(NURenderRequest *)self setSampleMode:v5];
}

- (NUVisionSegmentationRequest)initWithComposition:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)NUVisionSegmentationRequest;
  v3 = [(NURenderRequest *)&v7 initWithComposition:a3];
  id v4 = [[NUPixelCountScalePolicy alloc] initWithTargetPixelCount:3048192];
  scalePolicy = v3->_scalePolicy;
  v3->_scalePolicy = (NUScalePolicy *)v4;

  [(NURenderRequest *)v3 setSampleMode:2];
  return v3;
}

+ (void)warmUp
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v3 = objc_alloc_init(MEMORY[0x1E4F45850]);
  [v3 setRevision:1];
  [v3 setQualityLevel:1];
  [v2 addObject:v3];

  id v4 = objc_alloc_init(MEMORY[0x1E4F45818]);
  [v2 addObject:v4];

  id v5 = objc_alloc_init(MEMORY[0x1E4F45858]);
  [v2 addObject:v5];

  objc_super v6 = +[NUFactory sharedFactory];
  objc_super v7 = [v6 visionSession];
  id v11 = 0;
  char v8 = [v7 prepareForPerformingRequests:v2 error:&v11];
  id v9 = v11;

  if ((v8 & 1) == 0)
  {
    if (_NULogOnceToken != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_227);
    }
    v10 = _NULogger;
    if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v13 = v9;
      _os_log_error_impl(&dword_1A9892000, v10, OS_LOG_TYPE_ERROR, "Failed to warmUp Vision segmentation requests, error: %{public}@", buf, 0xCu);
    }
  }
}

@end