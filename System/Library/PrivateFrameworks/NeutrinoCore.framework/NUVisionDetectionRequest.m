@interface NUVisionDetectionRequest
+ (void)warmUpRequests:(id)a3;
- (NSArray)visionRequests;
- (NSString)description;
- (NUScalePolicy)scalePolicy;
- (NUVisionDetectionRequest)initWithComposition:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)newRenderJob;
- (id)submitGenericSynchronous:(id *)a3;
- (int64_t)mediaComponentType;
- (void)setScalePolicy:(id)a3;
- (void)setVisionRequests:(id)a3;
@end

@implementation NUVisionDetectionRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visionRequests, 0);

  objc_storeStrong((id *)&self->_scalePolicy, 0);
}

- (void)setVisionRequests:(id)a3
{
}

- (NSArray)visionRequests
{
  return self->_visionRequests;
}

- (void)setScalePolicy:(id)a3
{
}

- (NUScalePolicy)scalePolicy
{
  return self->_scalePolicy;
}

- (id)submitGenericSynchronous:(id *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NUVisionDetectionRequest;
  v3 = [(NURenderRequest *)&v5 submitGenericSynchronous:a3];

  return v3;
}

- (int64_t)mediaComponentType
{
  return 1;
}

- (id)newRenderJob
{
  v3 = [NUVisionDetectionJob alloc];

  return [(NUVisionDetectionJob *)v3 initWithVisionDetectionRequest:self];
}

- (NSString)description
{
  v7.receiver = self;
  v7.super_class = (Class)NUVisionDetectionRequest;
  v3 = [(NURenderRequest *)&v7 description];
  v4 = [(NUVisionDetectionRequest *)self scalePolicy];
  objc_super v5 = [v3 stringByAppendingFormat:@" Scale Policy: %@", v4];

  return (NSString *)v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)NUVisionDetectionRequest;
  objc_super v5 = -[NURenderRequest copyWithZone:](&v10, sel_copyWithZone_);
  v6 = v5;
  if (v5)
  {
    objc_storeStrong(v5 + 19, self->_scalePolicy);
    uint64_t v7 = [(NSArray *)self->_visionRequests copyWithZone:a3];
    id v8 = v6[20];
    v6[20] = (id)v7;
  }
  return v6;
}

- (NUVisionDetectionRequest)initWithComposition:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)NUVisionDetectionRequest;
  v3 = [(NURenderRequest *)&v8 initWithComposition:a3];
  uint64_t v4 = +[NUFixedScalePolicy oneToOneScalePolicy];
  scalePolicy = v3->_scalePolicy;
  v3->_scalePolicy = (NUScalePolicy *)v4;

  visionRequests = v3->_visionRequests;
  v3->_visionRequests = (NSArray *)MEMORY[0x1E4F1CBF0];

  [(NURenderRequest *)v3 setSampleMode:2];
  return v3;
}

+ (void)warmUpRequests:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = +[NUFactory sharedFactory];
  objc_super v5 = [(id)v4 visionSession];

  id v8 = 0;
  LOBYTE(v4) = [v5 prepareForPerformingRequests:v3 error:&v8];

  id v6 = v8;
  if ((v4 & 1) == 0)
  {
    if (_NULogOnceToken != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_15866);
    }
    uint64_t v7 = _NULogger;
    if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v10 = v6;
      _os_log_error_impl(&dword_1A9892000, v7, OS_LOG_TYPE_ERROR, "Failed to warm up Vision requests, error: %{public}@", buf, 0xCu);
    }
  }
}

@end