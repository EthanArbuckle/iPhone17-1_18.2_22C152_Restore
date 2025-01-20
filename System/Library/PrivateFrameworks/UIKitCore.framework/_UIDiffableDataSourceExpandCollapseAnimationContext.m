@interface _UIDiffableDataSourceExpandCollapseAnimationContext
- (id)indexPathsForChildItemsInCollapsingParent:(id)a3;
- (id)indexPathsForChildItemsInExpandingParent:(id)a3;
- (id)indexPathsForCollapsedParentItems;
- (id)indexPathsForExpandedParentItems;
- (uint64_t)_visibleIndexForIndex:(void *)a3 identifiers:(void *)a4 visibleIdentifiers:;
@end

@implementation _UIDiffableDataSourceExpandCollapseAnimationContext

- (uint64_t)_visibleIndexForIndex:(void *)a3 identifiers:(void *)a4 visibleIdentifiers:
{
  id v7 = a3;
  id v8 = a4;
  if (a1)
  {
    if ([v7 count] <= a2)
    {
      uint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else
    {
      v9 = [v7 objectAtIndexedSubscript:a2];
      uint64_t v10 = [v8 indexOfObject:v9];
    }
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (id)indexPathsForExpandedParentItems
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if ([(NSArray *)self->_identifiersOfExpandedItems count])
  {
    v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSArray count](self->_identifiersOfExpandedItems, "count"));
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    v4 = self->_identifiersOfExpandedItems;
    uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v13 != v7) {
            objc_enumerationMutation(v4);
          }
          NSUInteger v9 = -[NSOrderedSet indexOfObject:](self->_initialVisibleIdentifiers, "indexOfObject:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
          if (v9 != 0x7FFFFFFFFFFFFFFFLL)
          {
            uint64_t v10 = [MEMORY[0x1E4F28D58] indexPathForItem:v9 inSection:self->_sectionIndex];
            [v3 addObject:v10];
          }
        }
        uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v6);
    }
  }
  else
  {
    v3 = (void *)MEMORY[0x1E4F1CBF0];
  }
  return v3;
}

- (id)indexPathsForChildItemsInExpandingParent:(id)a3
{
  v4 = -[NSOrderedSet objectAtIndex:](self->_initialVisibleIdentifiers, "objectAtIndex:", [a3 item]);
  uint64_t v5 = [(NSDiffableDataSourceSectionSnapshot *)self->_finalSectionSnapshot _indexesOfChildrenForParent:v4 recursive:1];
  uint64_t v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v5, "count"));
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __96___UIDiffableDataSourceExpandCollapseAnimationContext_indexPathsForChildItemsInExpandingParent___block_invoke;
  v11[3] = &unk_1E52DADC0;
  v11[4] = self;
  id v7 = v6;
  id v12 = v7;
  [v5 enumerateIndexesUsingBlock:v11];
  id v8 = v12;
  id v9 = v7;

  return v9;
}

- (id)indexPathsForCollapsedParentItems
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if ([(NSArray *)self->_identifiersOfCollapsedItems count])
  {
    v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSArray count](self->_identifiersOfCollapsedItems, "count"));
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    v4 = self->_identifiersOfCollapsedItems;
    uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v13 != v7) {
            objc_enumerationMutation(v4);
          }
          NSUInteger v9 = -[NSOrderedSet indexOfObject:](self->_initialVisibleIdentifiers, "indexOfObject:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
          if (v9 != 0x7FFFFFFFFFFFFFFFLL)
          {
            uint64_t v10 = [MEMORY[0x1E4F28D58] indexPathForItem:v9 inSection:self->_sectionIndex];
            [v3 addObject:v10];
          }
        }
        uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v6);
    }
  }
  else
  {
    v3 = (void *)MEMORY[0x1E4F1CBF0];
  }
  return v3;
}

- (id)indexPathsForChildItemsInCollapsingParent:(id)a3
{
  v4 = -[NSOrderedSet objectAtIndex:](self->_initialVisibleIdentifiers, "objectAtIndex:", [a3 item]);
  uint64_t v5 = [(NSDiffableDataSourceSectionSnapshot *)self->_finalSectionSnapshot _indexesOfChildrenForParent:v4 recursive:1];
  uint64_t v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v5, "count"));
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __97___UIDiffableDataSourceExpandCollapseAnimationContext_indexPathsForChildItemsInCollapsingParent___block_invoke;
  v11[3] = &unk_1E52DADC0;
  v11[4] = self;
  id v7 = v6;
  id v12 = v7;
  [v5 enumerateIndexesUsingBlock:v11];
  id v8 = v12;
  id v9 = v7;

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifiersOfCollapsedItems, 0);
  objc_storeStrong((id *)&self->_identifiersOfExpandedItems, 0);
  objc_storeStrong((id *)&self->_finalVisibleIdentifiers, 0);
  objc_storeStrong((id *)&self->_initialVisibleIdentifiers, 0);
  objc_storeStrong((id *)&self->_finalIdentifiers, 0);
  objc_storeStrong((id *)&self->_initialIdentifiers, 0);
  objc_storeStrong((id *)&self->_finalSectionSnapshot, 0);
  objc_storeStrong((id *)&self->_initialSectionSnapshot, 0);
  objc_storeStrong((id *)&self->_initialSnapshot, 0);
}

@end