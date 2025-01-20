@interface PREditingColorItemsAggregateDataSource
- (NSArray)dataSources;
- (PREditingColorItemsAggregateDataSource)initWithDataSources:(id)a3;
- (id)colorItemForIndex:(unint64_t)a3;
- (id)firstColorItemPassingTest:(id)a3;
- (unint64_t)indexForItem:(id)a3;
- (unint64_t)numberOfItems;
- (void)setDataSources:(id)a3;
@end

@implementation PREditingColorItemsAggregateDataSource

- (PREditingColorItemsAggregateDataSource)initWithDataSources:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PREditingColorItemsAggregateDataSource;
  v5 = [(PREditingColorItemsAggregateDataSource *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    dataSources = v5->_dataSources;
    v5->_dataSources = (NSArray *)v6;
  }
  return v5;
}

- (unint64_t)numberOfItems
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = self->_dataSources;
  uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    unint64_t v5 = 0;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v2);
        }
        v5 += objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * i), "numberOfItems", (void)v9);
      }
      uint64_t v4 = [(NSArray *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
}

- (id)firstColorItemPassingTest:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  unint64_t v5 = self->_dataSources;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "firstColorItemPassingTest:", v4, (void)v13);
        if (v10)
        {
          long long v11 = (void *)v10;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  long long v11 = 0;
LABEL_11:

  return v11;
}

- (unint64_t)indexForItem:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  unint64_t v5 = self->_dataSources;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  unint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t v9 = 0;
    uint64_t v10 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v5);
        }
        long long v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v13 = objc_msgSend(v12, "indexForItem:", v4, (void)v15);
        if (v13 != 0x7FFFFFFFFFFFFFFFLL)
        {
          unint64_t v7 = v13 + v9;
          goto LABEL_11;
        }
        v9 += [v12 numberOfItems];
      }
      uint64_t v8 = [(NSArray *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v8) {
        continue;
      }
      break;
    }
    unint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
  }
LABEL_11:

  return v7;
}

- (id)colorItemForIndex:(unint64_t)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = self->_dataSources;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = 0;
    uint64_t v8 = *(void *)v16;
    while (2)
    {
      uint64_t v9 = 0;
      uint64_t v10 = v7;
      do
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v4);
        }
        long long v11 = *(void **)(*((void *)&v15 + 1) + 8 * v9);
        uint64_t v12 = objc_msgSend(v11, "numberOfItems", (void)v15);
        uint64_t v7 = v12 + v10;
        if (v12 + v10 - 1 >= a3)
        {
          uint64_t v13 = [v11 colorItemForIndex:a3 - v10];
          goto LABEL_11;
        }
        ++v9;
        v10 += v12;
      }
      while (v6 != v9);
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  uint64_t v13 = 0;
LABEL_11:

  return v13;
}

- (NSArray)dataSources
{
  return self->_dataSources;
}

- (void)setDataSources:(id)a3
{
}

- (void).cxx_destruct
{
}

@end