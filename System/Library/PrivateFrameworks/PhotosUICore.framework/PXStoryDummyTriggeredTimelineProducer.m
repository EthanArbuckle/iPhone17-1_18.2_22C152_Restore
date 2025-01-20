@interface PXStoryDummyTriggeredTimelineProducer
- (PXStoryDummyTimelineProducer)timelineProducer;
- (PXStoryDummyTriggeredTimelineProducer)init;
- (PXStoryDummyTriggeredTimelineProducer)initWithNumberOfIterations:(int64_t)a3;
- (PXStoryTimelineProducerConfiguration)configuration;
- (id)requestTimelineWithConfiguration:(id)a3 options:(unint64_t)a4 resultHandler:(id)a5;
- (id)resultHandler;
- (int64_t)currentIteration;
- (int64_t)numberOfIterations;
- (void)setConfiguration:(id)a3;
- (void)setCurrentIteration:(int64_t)a3;
- (void)setResultHandler:(id)a3;
- (void)trigger;
@end

@implementation PXStoryDummyTriggeredTimelineProducer

- (void).cxx_destruct
{
  objc_storeStrong(&self->_resultHandler, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_timelineProducer, 0);
}

- (id)resultHandler
{
  return self->_resultHandler;
}

- (void)setConfiguration:(id)a3
{
}

- (PXStoryTimelineProducerConfiguration)configuration
{
  return self->_configuration;
}

- (void)setCurrentIteration:(int64_t)a3
{
  self->_currentIteration = a3;
}

- (int64_t)currentIteration
{
  return self->_currentIteration;
}

- (PXStoryDummyTimelineProducer)timelineProducer
{
  return self->_timelineProducer;
}

- (int64_t)numberOfIterations
{
  return self->_numberOfIterations;
}

- (void)trigger
{
  uint64_t v3 = [(PXStoryDummyTriggeredTimelineProducer *)self currentIteration];
  double v4 = (double)v3 / (double)[(PXStoryDummyTriggeredTimelineProducer *)self numberOfIterations];
  v5 = [(PXStoryDummyTriggeredTimelineProducer *)self timelineProducer];
  v6 = [(PXStoryDummyTriggeredTimelineProducer *)self configuration];
  id v10 = [v5 createTimelineWithConfiguration:v6 detailsFraction:v4];

  v7 = [(PXStoryDummyTriggeredTimelineProducer *)self resultHandler];
  v8 = [[PXStoryProducerResult alloc] initWithObject:v10];
  v9 = [(PXStoryProducerResult *)v8 flags:v4 < 1.0];
  ((void (**)(void, void *))v7)[2](v7, v9);

  [(PXStoryDummyTriggeredTimelineProducer *)self setCurrentIteration:v3 + 1];
}

- (id)requestTimelineWithConfiguration:(id)a3 options:(unint64_t)a4 resultHandler:(id)a5
{
  id v7 = a5;
  [(PXStoryDummyTriggeredTimelineProducer *)self setConfiguration:a3];
  [(PXStoryDummyTriggeredTimelineProducer *)self setResultHandler:v7];

  [(PXStoryDummyTriggeredTimelineProducer *)self trigger];
  return 0;
}

- (void)setResultHandler:(id)a3
{
  id v5 = a3;
  id resultHandler = self->_resultHandler;
  if (resultHandler != v5)
  {
    id v10 = v5;
    if (resultHandler)
    {
      v9 = [MEMORY[0x1E4F28B00] currentHandler];
      [v9 handleFailureInMethod:a2 object:self file:@"PXStoryDummyTriggeredTimelineProducer.m" lineNumber:39 description:@"not supporting multiple concurrent requests"];
    }
    id v7 = (void *)[v10 copy];
    id v8 = self->_resultHandler;
    self->_id resultHandler = v7;

    id v5 = v10;
  }
}

- (PXStoryDummyTriggeredTimelineProducer)initWithNumberOfIterations:(int64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PXStoryDummyTriggeredTimelineProducer;
  double v4 = [(PXStoryDummyTriggeredTimelineProducer *)&v8 init];
  if (v4)
  {
    id v5 = objc_alloc_init(PXStoryDummyTimelineProducer);
    timelineProducer = v4->_timelineProducer;
    v4->_timelineProducer = v5;

    v4->_numberOfIterations = a3;
  }
  return v4;
}

- (PXStoryDummyTriggeredTimelineProducer)init
{
  return [(PXStoryDummyTriggeredTimelineProducer *)self initWithNumberOfIterations:10];
}

@end