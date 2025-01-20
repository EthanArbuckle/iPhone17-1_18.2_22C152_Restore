@interface PXSelectedItemsStack
- (NSArray)topItemReferences;
- (NSArray)topItems;
- (PXSelectedItemsStack)init;
- (PXSelectedItemsStack)initWithDepth:(int64_t)a3;
- (int64_t)depth;
- (void)performChanges:(id)a3;
- (void)setTopItemReferences:(id)a3;
- (void)setTopItems:(id)a3;
- (void)updateWithSelectedItemsSnapshot:(id)a3;
@end

@implementation PXSelectedItemsStack

- (PXSelectedItemsStack)initWithDepth:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PXSelectedItemsStack;
  result = [(PXSelectedItemsStack *)&v5 init];
  if (result) {
    result->_depth = a3;
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topItemReferences, 0);
  objc_storeStrong((id *)&self->_topItems, 0);
}

- (void)setTopItemReferences:(id)a3
{
}

- (NSArray)topItemReferences
{
  return self->_topItemReferences;
}

- (NSArray)topItems
{
  return self->_topItems;
}

- (int64_t)depth
{
  return self->_depth;
}

- (void)updateWithSelectedItemsSnapshot:(id)a3
{
  id v24 = a3;
  unint64_t v4 = [(PXSelectedItemsStack *)self depth];
  objc_super v5 = [(PXSelectedItemsStack *)self topItemReferences];
  v6 = (void *)[v5 mutableCopy];
  v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v8 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v4];
  }
  v9 = v8;

  v10 = [(PXSelectedItemsStack *)self topItems];
  v11 = (void *)[v10 mutableCopy];
  v12 = v11;
  if (v11)
  {
    id v13 = v11;
  }
  else
  {
    id v13 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v4];
  }
  v14 = v13;

  if ([v9 count])
  {
    unint64_t v15 = 0;
    do
    {
      v16 = [v9 objectAtIndexedSubscript:v15];
      v17 = [v24 containsItemReference:v16];

      if (v17)
      {
        [v9 replaceObjectAtIndex:v15++ withObject:v17];
      }
      else
      {
        [v9 removeObjectAtIndex:v15];
        [v14 removeObjectAtIndex:v15];
      }
    }
    while (v15 < [v9 count]);
  }
  uint64_t v18 = [v24 count];
  if (v18 >= 1)
  {
    uint64_t v19 = v18;
    for (uint64_t i = 0; i != v19; ++i)
    {
      if ([v14 count] >= v4) {
        break;
      }
      v21 = [v24 itemReferenceAtIndex:i];
      if (([v9 containsObject:v21] & 1) == 0)
      {
        v22 = [v24 itemForItemReference:v21];
        v23 = [MEMORY[0x1E4F1CA98] null];

        if (v22 != v23)
        {
          [v9 addObject:v21];
          [v14 addObject:v22];
        }
      }
    }
  }
  [(PXSelectedItemsStack *)self setTopItemReferences:v9];
  [(PXSelectedItemsStack *)self setTopItems:v14];
}

- (void)performChanges:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)PXSelectedItemsStack;
  [(PXSelectedItemsStack *)&v3 performChanges:a3];
}

- (void)setTopItems:(id)a3
{
  id v8 = (NSArray *)a3;
  unint64_t v4 = self->_topItems;
  if (v4 == v8)
  {
  }
  else
  {
    char v5 = [(NSArray *)v8 isEqual:v4];

    if ((v5 & 1) == 0)
    {
      v6 = (NSArray *)[(NSArray *)v8 copy];
      topItems = self->_topItems;
      self->_topItems = v6;

      [(PXSelectedItemsStack *)self signalChange:1];
    }
  }
}

- (PXSelectedItemsStack)init
{
  return [(PXSelectedItemsStack *)self initWithDepth:3];
}

@end