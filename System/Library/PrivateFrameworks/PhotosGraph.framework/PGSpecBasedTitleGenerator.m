@interface PGSpecBasedTitleGenerator
- (NSSet)features;
- (NSSet)momentNodes;
- (PGSpecBasedTitleGenerator)initWithMomentNodes:(id)a3 features:(id)a4 meaningLabel:(id)a5 isAggregation:(BOOL)a6 titleGenerationContext:(id)a7;
- (PGSpecBasedTitleGenerator)initWithMomentNodes:(id)a3 features:(id)a4 specCollection:(id)a5 titleGenerationContext:(id)a6;
- (PGSpecBasedTitleGenerator)initWithMomentNodes:(id)a3 meaningLabel:(id)a4 titleGenerationContext:(id)a5;
- (PGSpecBasedTitleGenerator)initWithMomentNodes:(id)a3 memoryCategory:(unint64_t)a4 subcategory:(unint64_t)a5 titleGenerationContext:(id)a6;
- (PGSpecBasedTitleGenerator)initWithMomentNodes:(id)a3 personNodes:(id)a4 memoryCategory:(unint64_t)a5 subcategory:(unint64_t)a6 titleGenerationContext:(id)a7;
- (PGSpecBasedTitleGenerator)initWithMomentNodes:(id)a3 specCollection:(id)a4 titleGenerationContext:(id)a5;
- (PGSpecBasedTitleGeneratorDelegate)delegate;
- (PGTitle)title;
- (PGTitleSpecCollection)specCollection;
- (id)_title;
- (id)_titleFromSpecs:(id)a3;
- (id)titleSpec:(id)a3 inputForArgument:(id)a4;
- (unint64_t)lineBreakBehavior;
- (void)setDelegate:(id)a3;
- (void)setFeatures:(id)a3;
- (void)setLineBreakBehavior:(unint64_t)a3;
- (void)setMomentNodes:(id)a3;
- (void)setSpecCollection:(id)a3;
@end

@implementation PGSpecBasedTitleGenerator

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_specCollection, 0);
  objc_storeStrong((id *)&self->_features, 0);
  objc_storeStrong((id *)&self->_momentNodes, 0);
  objc_storeStrong((id *)&self->_titleGenerationContext, 0);
}

- (void)setLineBreakBehavior:(unint64_t)a3
{
  self->_lineBreakBehavior = a3;
}

- (unint64_t)lineBreakBehavior
{
  return self->_lineBreakBehavior;
}

- (void)setDelegate:(id)a3
{
}

- (PGSpecBasedTitleGeneratorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PGSpecBasedTitleGeneratorDelegate *)WeakRetained;
}

- (void)setSpecCollection:(id)a3
{
}

- (PGTitleSpecCollection)specCollection
{
  return self->_specCollection;
}

- (void)setFeatures:(id)a3
{
}

- (NSSet)features
{
  return self->_features;
}

- (void)setMomentNodes:(id)a3
{
}

- (NSSet)momentNodes
{
  return self->_momentNodes;
}

- (id)titleSpec:(id)a3 inputForArgument:(id)a4
{
  id v5 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v7 = [WeakRetained titleGenerator:self inputForArgument:v5];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_titleFromSpecs:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = (void *)[v5 mutableCopy];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v7 = [(PGSpecBasedTitleGenerator *)self momentNodes];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v24;
    double v11 = 1.79769313e308;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v24 != v10) {
          objc_enumerationMutation(v7);
        }
        v13 = [*(id *)(*((void *)&v23 + 1) + 8 * i) universalStartDate];
        [v13 timeIntervalSince1970];
        double v11 = fmin(v11, v14);
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v9);
    unint64_t v3 = (unint64_t)v11;
  }

  v15 = [PGTitleSpecArgumentEvaluationContext alloc];
  v16 = [(PGTitleGenerationContext *)self->_titleGenerationContext locationHelper];
  v17 = [(PGTitleGenerationContext *)self->_titleGenerationContext serviceManager];
  v18 = [(PGTitleSpecArgumentEvaluationContext *)v15 initWithLocationHelper:v16 serviceManager:v17];

  while (1)
  {

    if (![v6 count])
    {
      v21 = 0;
      goto LABEL_18;
    }
    v16 = objc_msgSend(v6, "objectAtIndexedSubscript:", v3 % objc_msgSend(v6, "count"));
    objc_msgSend(v16, "setInsertNonBreakableSpace:", (self->_lineBreakBehavior >> 1) & 1 & ~objc_msgSend(v16, "hasSpecArgumentHandlingLineBreakBehavior"));
    [v16 setDelegate:self];
    momentNodes = self->_momentNodes;
    features = self->_features;
    if (features) {
      [v16 titleWithMomentNodes:momentNodes features:features argumentEvaluationContext:v18];
    }
    else {
    v21 = [v16 titleWithMomentNodes:momentNodes argumentEvaluationContext:v18];
    }
    if (v21) {
      break;
    }
    [v6 removeObject:v16];
  }

LABEL_18:
  return v21;
}

- (id)_title
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  unint64_t v3 = [(PGTitleSpecCollection *)self->_specCollection specPools];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    v6 = 0;
    uint64_t v7 = *(void *)v12;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v12 != v7) {
        objc_enumerationMutation(v3);
      }
      if (v6) {
        break;
      }
      uint64_t v9 = [*(id *)(*((void *)&v11 + 1) + 8 * v8) specs];
      v6 = [(PGSpecBasedTitleGenerator *)self _titleFromSpecs:v9];

      if (v5 == ++v8)
      {
        uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v5) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (PGTitle)title
{
  title = self->_title;
  if (!title)
  {
    uint64_t v4 = [(PGSpecBasedTitleGenerator *)self _title];
    uint64_t v5 = self->_title;
    self->_title = v4;

    title = self->_title;
  }
  return title;
}

- (PGSpecBasedTitleGenerator)initWithMomentNodes:(id)a3 features:(id)a4 specCollection:(id)a5 titleGenerationContext:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)PGSpecBasedTitleGenerator;
  v15 = [(PGSpecBasedTitleGenerator *)&v18 init];
  if (v15)
  {
    if (![v11 count])
    {
      uint64_t v16 = 0;
      goto LABEL_6;
    }
    objc_storeStrong((id *)&v15->_momentNodes, a3);
    objc_storeStrong((id *)&v15->_features, a4);
    objc_storeStrong((id *)&v15->_specCollection, a5);
    v15->_lineBreakBehavior = 1;
    objc_storeStrong((id *)&v15->_titleGenerationContext, a6);
  }
  uint64_t v16 = v15;
LABEL_6:

  return v16;
}

- (PGSpecBasedTitleGenerator)initWithMomentNodes:(id)a3 features:(id)a4 meaningLabel:(id)a5 isAggregation:(BOOL)a6 titleGenerationContext:(id)a7
{
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  if (v8) {
    +[PGAggregationsTitleSpecFactory specCollectionForMeaningLabel:v14 features:v13];
  }
  else {
  uint64_t v16 = +[PGTitleSpecFactory specCollectionForMeaningLabel:v14];
  }
  if (v16)
  {
    v17 = [(PGSpecBasedTitleGenerator *)self initWithMomentNodes:v12 features:v13 specCollection:v16 titleGenerationContext:v15];
  }
  else
  {

    v17 = 0;
  }

  return v17;
}

- (PGSpecBasedTitleGenerator)initWithMomentNodes:(id)a3 meaningLabel:(id)a4 titleGenerationContext:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = +[PGTitleSpecFactory specCollectionForMeaningLabel:a4];
  if (v10)
  {
    id v11 = [(PGSpecBasedTitleGenerator *)self initWithMomentNodes:v8 features:0 specCollection:v10 titleGenerationContext:v9];
  }
  else
  {

    id v11 = 0;
  }

  return v11;
}

- (PGSpecBasedTitleGenerator)initWithMomentNodes:(id)a3 personNodes:(id)a4 memoryCategory:(unint64_t)a5 subcategory:(unint64_t)a6 titleGenerationContext:(id)a7
{
  id v12 = a3;
  id v13 = a7;
  id v14 = +[PGTitleSpecFactory specCollectionForMemoryCategory:a5 subcategory:a6 personNodes:a4];
  if (v14)
  {
    id v15 = [(PGSpecBasedTitleGenerator *)self initWithMomentNodes:v12 features:0 specCollection:v14 titleGenerationContext:v13];
  }
  else
  {

    id v15 = 0;
  }

  return v15;
}

- (PGSpecBasedTitleGenerator)initWithMomentNodes:(id)a3 memoryCategory:(unint64_t)a4 subcategory:(unint64_t)a5 titleGenerationContext:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  id v12 = +[PGTitleSpecFactory specCollectionForMemoryCategory:a4 subcategory:a5];
  if (v12)
  {
    id v13 = [(PGSpecBasedTitleGenerator *)self initWithMomentNodes:v10 features:0 specCollection:v12 titleGenerationContext:v11];
  }
  else
  {

    id v13 = 0;
  }

  return v13;
}

- (PGSpecBasedTitleGenerator)initWithMomentNodes:(id)a3 specCollection:(id)a4 titleGenerationContext:(id)a5
{
  return [(PGSpecBasedTitleGenerator *)self initWithMomentNodes:a3 features:0 specCollection:a4 titleGenerationContext:a5];
}

@end