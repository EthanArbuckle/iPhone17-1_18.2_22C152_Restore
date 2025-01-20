@interface PXStoryDummyStyleProducer
- (PXStoryDummyStyleProducer)init;
- (PXStoryDummyStyleProducer)initWithStyleConfiguration:(id)a3;
- (id)styleConfiguration;
- (id)styleWithCustomColorGradeKind:(int64_t)a3 originalColorGradeCategory:(id)a4 songResource:(id)a5 cueSource:(id)a6 autoEditDecisionList:(id)a7 styleOptions:(id)a8 isCustomized:(BOOL)a9;
@end

@implementation PXStoryDummyStyleProducer

- (void).cxx_destruct
{
}

- (id)styleConfiguration
{
  return self->_styleConfiguration;
}

- (id)styleWithCustomColorGradeKind:(int64_t)a3 originalColorGradeCategory:(id)a4 songResource:(id)a5 cueSource:(id)a6 autoEditDecisionList:(id)a7 styleOptions:(id)a8 isCustomized:(BOOL)a9
{
  v10 = [PXStoryDummyStyle alloc];
  v11 = [(PXStoryDummyStyleProducer *)self styleConfiguration];
  v12 = [(PXStoryDummyStyle *)v10 initWithConfiguration:v11];

  return v12;
}

- (PXStoryDummyStyleProducer)initWithStyleConfiguration:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXStoryDummyStyleProducer;
  v5 = [(PXStoryDummyStyleProducer *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    id styleConfiguration = v5->_styleConfiguration;
    v5->_id styleConfiguration = (id)v6;
  }
  return v5;
}

- (PXStoryDummyStyleProducer)init
{
  return [(PXStoryDummyStyleProducer *)self initWithStyleConfiguration:&__block_literal_global_8807];
}

@end