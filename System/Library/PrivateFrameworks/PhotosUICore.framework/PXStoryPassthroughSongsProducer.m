@interface PXStoryPassthroughSongsProducer
- (PXStoryPassthroughSongsProducer)init;
- (PXStoryPassthroughSongsProducer)initWithSongs:(id)a3;
- (PXStoryPassthroughSongsProducer)initWithSongsConfiguration:(id)a3;
- (PXStorySongsConfiguration)songsConfiguration;
- (id)requestSongsWithOptions:(unint64_t)a3 resultHandler:(id)a4;
- (unint64_t)logContext;
- (void)setLogContext:(unint64_t)a3;
@end

@implementation PXStoryPassthroughSongsProducer

- (void).cxx_destruct
{
}

- (PXStorySongsConfiguration)songsConfiguration
{
  return self->_songsConfiguration;
}

- (void)setLogContext:(unint64_t)a3
{
  self->logContext = a3;
}

- (unint64_t)logContext
{
  return self->logContext;
}

- (id)requestSongsWithOptions:(unint64_t)a3 resultHandler:(id)a4
{
  id v6 = a4;
  v7 = [PXStoryProducerResult alloc];
  v8 = [(PXStoryPassthroughSongsProducer *)self songsConfiguration];
  v9 = [(PXStoryProducerResult *)v7 initWithObject:v8];
  (*((void (**)(id, PXStoryProducerResult *))a4 + 2))(v6, v9);

  return 0;
}

- (PXStoryPassthroughSongsProducer)initWithSongsConfiguration:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXStoryPassthroughSongsProducer;
  id v6 = [(PXStoryPassthroughSongsProducer *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_songsConfiguration, a3);
  }

  return v7;
}

- (PXStoryPassthroughSongsProducer)initWithSongs:(id)a3
{
  id v4 = a3;
  id v5 = [[PXStorySongsConfiguration alloc] initWithCuratedAudioAssets:v4];

  id v6 = [(PXStoryPassthroughSongsProducer *)self initWithSongsConfiguration:v5];
  return v6;
}

- (PXStoryPassthroughSongsProducer)init
{
  return [(PXStoryPassthroughSongsProducer *)self initWithSongs:0];
}

@end