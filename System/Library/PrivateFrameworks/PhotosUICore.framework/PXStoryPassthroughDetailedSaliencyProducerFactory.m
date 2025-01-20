@interface PXStoryPassthroughDetailedSaliencyProducerFactory
- (PXStoryDetailedSaliencyProducer)detailedSaliencyProducer;
- (PXStoryPassthroughDetailedSaliencyProducerFactory)init;
- (PXStoryPassthroughDetailedSaliencyProducerFactory)initWithDetailedSaliencyProducer:(id)a3;
- (id)detailedSaliencyProducerForConfiguration:(id)a3;
- (void)setDetailedSaliencyProducer:(id)a3;
@end

@implementation PXStoryPassthroughDetailedSaliencyProducerFactory

- (void).cxx_destruct
{
}

- (void)setDetailedSaliencyProducer:(id)a3
{
}

- (PXStoryDetailedSaliencyProducer)detailedSaliencyProducer
{
  return self->_detailedSaliencyProducer;
}

- (id)detailedSaliencyProducerForConfiguration:(id)a3
{
  v3 = [(PXStoryPassthroughDetailedSaliencyProducerFactory *)self detailedSaliencyProducer];
  v4 = v3;
  if (v3) {
    v5 = v3;
  }
  else {
    v5 = objc_alloc_init(PXStoryPassthroughDetailedSaliencyProducer);
  }
  v6 = v5;

  return v6;
}

- (PXStoryPassthroughDetailedSaliencyProducerFactory)initWithDetailedSaliencyProducer:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXStoryPassthroughDetailedSaliencyProducerFactory;
  v6 = [(PXStoryPassthroughDetailedSaliencyProducerFactory *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_detailedSaliencyProducer, a3);
  }

  return v7;
}

- (PXStoryPassthroughDetailedSaliencyProducerFactory)init
{
  return [(PXStoryPassthroughDetailedSaliencyProducerFactory *)self initWithDetailedSaliencyProducer:0];
}

@end