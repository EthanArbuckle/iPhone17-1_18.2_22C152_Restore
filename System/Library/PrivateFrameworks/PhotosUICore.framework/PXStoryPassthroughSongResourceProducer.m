@interface PXStoryPassthroughSongResourceProducer
- (PXStoryPassthroughSongResourceProducer)init;
- (PXStoryPassthroughSongResourceProducer)initWithSongResource:(id)a3;
- (PXStorySongResource)songResource;
- (id)requestSongResourceWithOptions:(unint64_t)a3 resultHandler:(id)a4;
- (unint64_t)logContext;
- (void)setLogContext:(unint64_t)a3;
@end

@implementation PXStoryPassthroughSongResourceProducer

- (void).cxx_destruct
{
}

- (PXStorySongResource)songResource
{
  return self->_songResource;
}

- (void)setLogContext:(unint64_t)a3
{
  self->logContext = a3;
}

- (unint64_t)logContext
{
  return self->logContext;
}

- (id)requestSongResourceWithOptions:(unint64_t)a3 resultHandler:(id)a4
{
  id v6 = a4;
  v7 = [PXStoryProducerResult alloc];
  v8 = [(PXStoryPassthroughSongResourceProducer *)self songResource];
  v9 = [(PXStoryProducerResult *)v7 initWithObject:v8];
  (*((void (**)(id, PXStoryProducerResult *))a4 + 2))(v6, v9);

  return 0;
}

- (PXStoryPassthroughSongResourceProducer)init
{
  return [(PXStoryPassthroughSongResourceProducer *)self initWithSongResource:0];
}

- (PXStoryPassthroughSongResourceProducer)initWithSongResource:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXStoryPassthroughSongResourceProducer;
  id v6 = [(PXStoryPassthroughSongResourceProducer *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_songResource, a3);
  }

  return v7;
}

@end