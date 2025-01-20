@interface PXStoryTimelineProducerConfiguration
- (PXStoryErrorReporter)errorReporter;
- (PXStoryLoadingCoordinator)loadingCoordinator;
- (PXStoryResourcesDataSource)resourcesDataSource;
- (PXStoryStyle)style;
- (PXStoryTimelineProducerConfiguration)init;
- (PXStoryTimelineProducerConfiguration)initWithResourcesDataSource:(id)a3 style:(id)a4 spec:(id)a5 options:(unint64_t)a6 loadingCoordinator:(id)a7 errorReporter:(id)a8;
- (PXStoryTimelineSpec)spec;
- (_NSRange)rangeOfPrioritizedDisplayAssetResources;
- (id)scorerFactory;
- (unint64_t)options;
- (void)setRangeOfPrioritizedDisplayAssetResources:(_NSRange)a3;
- (void)setScorerFactory:(id)a3;
@end

@implementation PXStoryTimelineProducerConfiguration

- (void).cxx_destruct
{
  objc_storeStrong(&self->_scorerFactory, 0);
  objc_storeStrong((id *)&self->_errorReporter, 0);
  objc_storeStrong((id *)&self->_loadingCoordinator, 0);
  objc_storeStrong((id *)&self->_spec, 0);
  objc_storeStrong((id *)&self->_style, 0);
  objc_storeStrong((id *)&self->_resourcesDataSource, 0);
}

- (void)setScorerFactory:(id)a3
{
}

- (id)scorerFactory
{
  return self->_scorerFactory;
}

- (void)setRangeOfPrioritizedDisplayAssetResources:(_NSRange)a3
{
  self->_rangeOfPrioritizedDisplayAssetResources = a3;
}

- (_NSRange)rangeOfPrioritizedDisplayAssetResources
{
  NSUInteger length = self->_rangeOfPrioritizedDisplayAssetResources.length;
  NSUInteger location = self->_rangeOfPrioritizedDisplayAssetResources.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (PXStoryErrorReporter)errorReporter
{
  return self->_errorReporter;
}

- (PXStoryLoadingCoordinator)loadingCoordinator
{
  return self->_loadingCoordinator;
}

- (unint64_t)options
{
  return self->_options;
}

- (PXStoryTimelineSpec)spec
{
  return self->_spec;
}

- (PXStoryStyle)style
{
  return self->_style;
}

- (PXStoryResourcesDataSource)resourcesDataSource
{
  return self->_resourcesDataSource;
}

- (PXStoryTimelineProducerConfiguration)initWithResourcesDataSource:(id)a3 style:(id)a4 spec:(id)a5 options:(unint64_t)a6 loadingCoordinator:(id)a7 errorReporter:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v26 = a7;
  id v17 = a8;
  if (v14)
  {
    if (v15) {
      goto LABEL_3;
    }
LABEL_8:
    v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"PXStoryTimelineProducer.m", 23, @"Invalid parameter not satisfying: %@", @"style != nil" object file lineNumber description];

    if (v16) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  v21 = [MEMORY[0x1E4F28B00] currentHandler];
  [v21 handleFailureInMethod:a2, self, @"PXStoryTimelineProducer.m", 22, @"Invalid parameter not satisfying: %@", @"resourcesDataSource != nil" object file lineNumber description];

  if (!v15) {
    goto LABEL_8;
  }
LABEL_3:
  if (v16) {
    goto LABEL_4;
  }
LABEL_9:
  v23 = [MEMORY[0x1E4F28B00] currentHandler];
  [v23 handleFailureInMethod:a2, self, @"PXStoryTimelineProducer.m", 24, @"Invalid parameter not satisfying: %@", @"spec != nil" object file lineNumber description];

LABEL_4:
  v27.receiver = self;
  v27.super_class = (Class)PXStoryTimelineProducerConfiguration;
  v18 = [(PXStoryTimelineProducerConfiguration *)&v27 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_resourcesDataSource, a3);
    objc_storeStrong((id *)&v19->_style, a4);
    objc_storeStrong((id *)&v19->_spec, a5);
    v19->_options = a6;
    objc_storeStrong((id *)&v19->_loadingCoordinator, a7);
    objc_storeStrong((id *)&v19->_errorReporter, a8);
    v19->_rangeOfPrioritizedDisplayAssetResources = (_NSRange)xmmword_1AB359BD0;
  }

  return v19;
}

- (PXStoryTimelineProducerConfiguration)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXStoryTimelineProducer.m", 18, @"%s is not available as initializer", "-[PXStoryTimelineProducerConfiguration init]");

  abort();
}

@end