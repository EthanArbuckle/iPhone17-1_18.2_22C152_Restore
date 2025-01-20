@interface NUPagingBlueprint
- (NSArray)allPages;
- (NSOrderedSet)blueprintItems;
- (NUPage)firstPage;
- (NUPage)lastPage;
- (NUPagingBlueprint)initWithPages:(id)a3;
- (id)pageAfterIdentifier:(id)a3;
- (id)pageBeforeForIdentifier:(id)a3;
- (id)pageForIdentifier:(id)a3;
- (void)forEachPage:(id)a3;
- (void)setBlueprintItems:(id)a3;
@end

@implementation NUPagingBlueprint

- (NUPagingBlueprint)initWithPages:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NUPagingBlueprint;
  v5 = [(NUPagingBlueprint *)&v11 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x263EFF9D8];
    v7 = objc_msgSend(v4, "fc_arrayByTransformingWithBlock:", &__block_literal_global_19);
    uint64_t v8 = [v6 orderedSetWithArray:v7];
    blueprintItems = v5->_blueprintItems;
    v5->_blueprintItems = (NSOrderedSet *)v8;
  }
  return v5;
}

NUPagingBlueprintItem *__35__NUPagingBlueprint_initWithPages___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[NUPagingBlueprintItem alloc] initWithPage:v2];

  return v3;
}

- (id)pageBeforeForIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [[NUPagingBlueprintItem alloc] initWithPageID:v4];

  v6 = [(NUPagingBlueprint *)self blueprintItems];
  uint64_t v7 = [v6 indexOfObject:v5];

  if (v7) {
    BOOL v8 = v7 == 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    objc_super v11 = 0;
  }
  else
  {
    v9 = [(NUPagingBlueprint *)self blueprintItems];
    v10 = [v9 objectAtIndex:v7 - 1];

    objc_super v11 = [v10 page];
  }

  return v11;
}

- (id)pageForIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [[NUPagingBlueprintItem alloc] initWithPageID:v4];

  v6 = [(NUPagingBlueprint *)self blueprintItems];
  uint64_t v7 = [v6 indexOfObject:v5];

  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    BOOL v8 = 0;
  }
  else
  {
    v9 = [(NUPagingBlueprint *)self blueprintItems];
    v10 = [v9 objectAtIndex:v7];

    BOOL v8 = [v10 page];
  }

  return v8;
}

- (id)pageAfterIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [[NUPagingBlueprintItem alloc] initWithPageID:v4];

  v6 = [(NUPagingBlueprint *)self blueprintItems];
  uint64_t v7 = [v6 indexOfObject:v5];

  if (v7 == 0x7FFFFFFFFFFFFFFFLL
    || (unint64_t v8 = v7 + 1,
        [(NUPagingBlueprint *)self blueprintItems],
        v9 = objc_claimAutoreleasedReturnValue(),
        unint64_t v10 = [v9 count],
        v9,
        v8 >= v10))
  {
    v13 = 0;
  }
  else
  {
    objc_super v11 = [(NUPagingBlueprint *)self blueprintItems];
    v12 = [v11 objectAtIndex:v8];

    v13 = [v12 page];
  }

  return v13;
}

- (void)forEachPage:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = (void (**)(id, void *))a3;
  if (v4)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    v5 = [(NUPagingBlueprint *)self blueprintItems];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v12;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v5);
          }
          unint64_t v10 = [*(id *)(*((void *)&v11 + 1) + 8 * v9) page];
          if (v10) {
            v4[2](v4, v10);
          }

          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v7);
    }
  }
}

- (NUPage)firstPage
{
  id v2 = [(NUPagingBlueprint *)self blueprintItems];
  v3 = [v2 firstObject];
  id v4 = [v3 page];

  return (NUPage *)v4;
}

- (NUPage)lastPage
{
  id v2 = [(NUPagingBlueprint *)self blueprintItems];
  v3 = [v2 lastObject];
  id v4 = [v3 page];

  return (NUPage *)v4;
}

- (NSArray)allPages
{
  id v2 = [(NUPagingBlueprint *)self blueprintItems];
  v3 = [v2 valueForKeyPath:@"page"];

  return (NSArray *)v3;
}

- (NSOrderedSet)blueprintItems
{
  return self->_blueprintItems;
}

- (void)setBlueprintItems:(id)a3
{
}

- (void).cxx_destruct
{
}

@end