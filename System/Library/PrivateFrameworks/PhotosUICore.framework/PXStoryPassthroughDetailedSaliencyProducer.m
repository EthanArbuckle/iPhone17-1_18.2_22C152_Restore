@interface PXStoryPassthroughDetailedSaliencyProducer
- (PXStoryPassthroughDetailedSaliencyProducer)init;
- (PXStoryPassthroughDetailedSaliencyProducer)initWithDetailedSaliency:(id)a3;
- (PXStorySaliencyDataSource)detailedSaliency;
- (id)requestDetailedSaliencyForDisplayAssets:(id)a3 options:(unint64_t)a4 resultHandler:(id)a5;
@end

@implementation PXStoryPassthroughDetailedSaliencyProducer

- (void).cxx_destruct
{
}

- (PXStorySaliencyDataSource)detailedSaliency
{
  return self->_detailedSaliency;
}

- (id)requestDetailedSaliencyForDisplayAssets:(id)a3 options:(unint64_t)a4 resultHandler:(id)a5
{
  id v7 = a5;
  v8 = [PXStoryProducerResult alloc];
  v9 = [(PXStoryPassthroughDetailedSaliencyProducer *)self detailedSaliency];
  v10 = [(PXStoryProducerResult *)v8 initWithObject:v9];
  (*((void (**)(id, PXStoryProducerResult *))a5 + 2))(v7, v10);

  return 0;
}

- (PXStoryPassthroughDetailedSaliencyProducer)initWithDetailedSaliency:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXStoryPassthroughDetailedSaliencyProducer;
  v6 = [(PXStoryPassthroughDetailedSaliencyProducer *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_detailedSaliency, a3);
  }

  return v7;
}

- (PXStoryPassthroughDetailedSaliencyProducer)init
{
  return [(PXStoryPassthroughDetailedSaliencyProducer *)self initWithDetailedSaliency:0];
}

@end