@interface PXStoryDefaultStylesProducer
- (NSArray)autoEditDecisionLists;
- (PXStoryDefaultStylesProducer)init;
- (PXStoryDefaultStylesProducer)initWithAutoEditDecisionLists:(id)a3;
- (id)requestStylesWithOptions:(unint64_t)a3 resultHandler:(id)a4;
@end

@implementation PXStoryDefaultStylesProducer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_autoEditDecisionLists, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

- (NSArray)autoEditDecisionLists
{
  return self->_autoEditDecisionLists;
}

- (id)requestStylesWithOptions:(unint64_t)a3 resultHandler:(id)a4
{
  v5 = (void (**)(id, PXStoryProducerResult *))a4;
  v6 = [(PXStoryDefaultStylesProducer *)self autoEditDecisionLists];
  uint64_t v7 = [v6 count];
  if (v6)
  {
    uint64_t v8 = v7;
    v9 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v7];
    if (v8 >= 1)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        v11 = [v6 objectAtIndexedSubscript:i];
        v12 = [v11 song];
        v13 = [PXStoryStyleConfiguration alloc];
        v14 = [v12 colorGradeCategory];
        v15 = [(PXStoryStyleConfiguration *)v13 initWithOriginalColorGradeCategory:v14 customColorGradeKind:0 songResource:v12 autoEditDecisionList:v11 isCustomized:0];

        [v9 addObject:v15];
      }
    }
    v16 = (void *)[v9 copy];
  }
  else
  {
    v16 = (void *)MEMORY[0x1E4F1CBF0];
  }
  v17 = [[PXStoryProducerResult alloc] initWithObject:v16];
  v5[2](v5, v17);

  return 0;
}

- (PXStoryDefaultStylesProducer)initWithAutoEditDecisionLists:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PXStoryDefaultStylesProducer;
  v6 = [(PXStoryDefaultStylesProducer *)&v13 init];
  if (v6)
  {
    uint64_t v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    id v8 = objc_claimAutoreleasedReturnValue();
    v9 = (const char *)[v8 UTF8String];

    os_log_t v10 = os_log_create((const char *)*MEMORY[0x1E4F8C518], v9);
    log = v6->_log;
    v6->_log = (OS_os_log *)v10;

    objc_storeStrong((id *)&v6->_autoEditDecisionLists, a3);
  }

  return v6;
}

- (PXStoryDefaultStylesProducer)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXStoryDefaultStylesProducer.m", 35, @"%s is not available as initializer", "-[PXStoryDefaultStylesProducer init]");

  abort();
}

@end