@interface PXStoryPersistedStyleProducer
- (PFStoryRecipe)persistedRecipe;
- (PXStoryAutoEditDecisionList)autoEditDecisionList;
- (PXStoryPersistedStyleProducer)initWithPersistedRecipe:(id)a3 songResource:(id)a4 autoEditDecisionList:(id)a5;
- (PXStorySongResource)songResource;
- (id)requestStylesWithOptions:(unint64_t)a3 resultHandler:(id)a4;
@end

@implementation PXStoryPersistedStyleProducer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_autoEditDecisionList, 0);
  objc_storeStrong((id *)&self->_songResource, 0);
  objc_storeStrong((id *)&self->_persistedRecipe, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

- (PXStoryAutoEditDecisionList)autoEditDecisionList
{
  return self->_autoEditDecisionList;
}

- (PXStorySongResource)songResource
{
  return self->_songResource;
}

- (PFStoryRecipe)persistedRecipe
{
  return self->_persistedRecipe;
}

- (id)requestStylesWithOptions:(unint64_t)a3 resultHandler:(id)a4
{
  v20[1] = *MEMORY[0x1E4F143B8];
  v5 = (void (**)(id, void *))a4;
  v6 = [(PXStoryPersistedStyleProducer *)self persistedRecipe];
  v7 = [v6 currentStyle];

  v8 = [(PXStoryPersistedStyleProducer *)self autoEditDecisionList];
  v9 = [(PXStoryPersistedStyleProducer *)self songResource];
  v10 = [v7 originalColorGradeCategory];
  uint64_t v11 = [v7 customColorGradeKind];
  uint64_t v12 = [v7 isCustomized];
  if (!v11)
  {
    v13 = +[PXStoryColorGradingRepositoryFactory sharedRepository];
    uint64_t v11 = [v13 colorGradeKindForColorGradeCategory:v10];
  }
  v14 = [[PXStoryStyleConfiguration alloc] initWithOriginalColorGradeCategory:v10 customColorGradeKind:v11 songResource:v9 autoEditDecisionList:v8 isCustomized:v12];
  v15 = [PXStoryProducerResult alloc];
  v20[0] = v14;
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
  v17 = [(PXStoryProducerResult *)v15 initWithObject:v16];
  v18 = [(PXStoryProducerResult *)v17 flags:v8 == 0];
  v5[2](v5, v18);

  return 0;
}

- (PXStoryPersistedStyleProducer)initWithPersistedRecipe:(id)a3 songResource:(id)a4 autoEditDecisionList:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)PXStoryPersistedStyleProducer;
  uint64_t v12 = [(PXStoryPersistedStyleProducer *)&v19 init];
  if (v12)
  {
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    id v14 = objc_claimAutoreleasedReturnValue();
    v15 = (const char *)[v14 UTF8String];

    os_log_t v16 = os_log_create((const char *)*MEMORY[0x1E4F8C518], v15);
    log = v12->_log;
    v12->_log = (OS_os_log *)v16;

    objc_storeStrong((id *)&v12->_songResource, a4);
    objc_storeStrong((id *)&v12->_persistedRecipe, a3);
    objc_storeStrong((id *)&v12->_autoEditDecisionList, a5);
  }

  return v12;
}

@end