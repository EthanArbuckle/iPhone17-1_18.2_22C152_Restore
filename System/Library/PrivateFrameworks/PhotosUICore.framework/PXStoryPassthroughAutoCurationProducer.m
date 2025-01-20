@interface PXStoryPassthroughAutoCurationProducer
- (PXDisplayAssetFetchResult)assets;
- (PXStoryPassthroughAutoCurationProducer)init;
- (id)requestCuratedAssetsWithOptions:(unint64_t)a3 targetOverallDurationInfo:(id *)a4 resultHandler:(id)a5;
- (id)requestCurationLengthsWithOptions:(unint64_t)a3 allAssets:(id)a4 curatedAssets:(id)a5 resultHandler:(id)a6;
- (unint64_t)availableLengths;
- (void)setAssets:(id)a3;
- (void)setAvailableLengths:(unint64_t)a3;
@end

@implementation PXStoryPassthroughAutoCurationProducer

- (void).cxx_destruct
{
}

- (void)setAssets:(id)a3
{
}

- (PXDisplayAssetFetchResult)assets
{
  return self->_assets;
}

- (void)setAvailableLengths:(unint64_t)a3
{
  self->_availableLengths = a3;
}

- (unint64_t)availableLengths
{
  return self->_availableLengths;
}

- (id)requestCuratedAssetsWithOptions:(unint64_t)a3 targetOverallDurationInfo:(id *)a4 resultHandler:(id)a5
{
  v6 = (void (**)(id, PXStoryProducerResult *))a5;
  v7 = [(PXStoryPassthroughAutoCurationProducer *)self assets];

  if (v7)
  {
    v8 = [PXStoryProducerResult alloc];
    v9 = [(PXStoryPassthroughAutoCurationProducer *)self assets];
    v10 = [(PXStoryProducerResult *)v8 initWithObject:v9];
    v6[2](v6, v10);
  }
  else
  {
    v11 = PLStoryGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v20) = 0;
      _os_log_impl(&dword_1A9AE7000, v11, OS_LOG_TYPE_ERROR, "requestCuratedAssetsWithOptions is not supported.", (uint8_t *)&v20, 2u);
    }

    v9 = PXStoryErrorCreateWithCodeDebugFormat(16, @"Target Duration Curation Not Supported", v12, v13, v14, v15, v16, v17, v20);
    v10 = [[PXStoryProducerResult alloc] initWithObject:0];
    v18 = [(PXStoryProducerResult *)v10 error:v9];
    v6[2](v6, v18);
  }
  return 0;
}

- (id)requestCurationLengthsWithOptions:(unint64_t)a3 allAssets:(id)a4 curatedAssets:(id)a5 resultHandler:(id)a6
{
  v7 = (void (**)(id, PXStoryProducerResult *))a6;
  v8 = [[PXStoryCurationLengthInfo alloc] initWithAvailableLengths:[(PXStoryPassthroughAutoCurationProducer *)self availableLengths] defaultLength:0];
  v9 = [[PXStoryProducerResult alloc] initWithObject:v8];
  v7[2](v7, v9);

  return 0;
}

- (PXStoryPassthroughAutoCurationProducer)init
{
  v3.receiver = self;
  v3.super_class = (Class)PXStoryPassthroughAutoCurationProducer;
  result = [(PXStoryPassthroughAutoCurationProducer *)&v3 init];
  if (result) {
    result->_availableLengths = 0;
  }
  return result;
}

@end