@interface PUBarButtonItemCollection
- (NSArray)_previousResult;
- (NSArray)identifiersOrder;
- (NSCache)_configurationsCache;
- (NSDictionary)barButtonItems;
- (NSIndexSet)_previousRequestedSet;
- (NSIndexSet)centeredItemIdentifiers;
- (NSMutableDictionary)_barButtonItems;
- (PUBarButtonItemCollection)init;
- (PUBarButtonItemCollection)initWithOptions:(unint64_t)a3;
- (PUBarButtonItemCollectionDataSource)dataSource;
- (UIBarButtonItem)_flexibleSpaceBarButtonItem;
- (UIBarButtonItem)_placeholderBarButtonItem;
- (id)_arrangedBarButtonItems:(id)a3 identifiers:(id)a4;
- (id)_newEntryForIdentifiers:(id)a3;
- (id)barButtonItemForIdentifier:(int64_t)a3;
- (id)orderedBarButtonsItemsForIdentifiers:(id)a3;
- (int64_t)identifierForBarButtonItem:(id)a3;
- (int64_t)identifierForCustomButton:(id)a3;
- (unint64_t)_options;
- (void)_centersButtonsIfNeeded:(id)a3 identifiers:(id)a4;
- (void)_resetSet;
- (void)_setPreviousRequestedSet:(id)a3;
- (void)_setPreviousResult:(id)a3;
- (void)setCenteredItemIdentifiers:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setIdentifiersOrder:(id)a3;
@end

@implementation PUBarButtonItemCollection

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__placeholderBarButtonItem, 0);
  objc_storeStrong((id *)&self->__flexibleSpaceBarButtonItem, 0);
  objc_storeStrong((id *)&self->__previousResult, 0);
  objc_storeStrong((id *)&self->__previousRequestedSet, 0);
  objc_storeStrong((id *)&self->__barButtonItems, 0);
  objc_storeStrong((id *)&self->__configurationsCache, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_centeredItemIdentifiers, 0);
  objc_storeStrong((id *)&self->_identifiersOrder, 0);
}

- (UIBarButtonItem)_placeholderBarButtonItem
{
  return self->__placeholderBarButtonItem;
}

- (UIBarButtonItem)_flexibleSpaceBarButtonItem
{
  return self->__flexibleSpaceBarButtonItem;
}

- (void)_setPreviousResult:(id)a3
{
}

- (NSArray)_previousResult
{
  return self->__previousResult;
}

- (void)_setPreviousRequestedSet:(id)a3
{
}

- (NSIndexSet)_previousRequestedSet
{
  return self->__previousRequestedSet;
}

- (NSMutableDictionary)_barButtonItems
{
  return self->__barButtonItems;
}

- (NSCache)_configurationsCache
{
  return self->__configurationsCache;
}

- (unint64_t)_options
{
  return self->__options;
}

- (void)setDataSource:(id)a3
{
}

- (PUBarButtonItemCollectionDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (PUBarButtonItemCollectionDataSource *)WeakRetained;
}

- (void)setCenteredItemIdentifiers:(id)a3
{
}

- (NSIndexSet)centeredItemIdentifiers
{
  return self->_centeredItemIdentifiers;
}

- (NSArray)identifiersOrder
{
  return self->_identifiersOrder;
}

- (void)_centersButtonsIfNeeded:(id)a3 identifiers:(id)a4
{
  id v18 = a3;
  id v6 = a4;
  if ([v6 count] == 2 && -[NSIndexSet count](self->_centeredItemIdentifiers, "count"))
  {
    uint64_t v7 = [v6 firstIndex];
    uint64_t v8 = [v6 lastIndex];
    if ([(NSIndexSet *)self->_centeredItemIdentifiers containsIndex:v7])
    {
      uint64_t v9 = v7;
      uint64_t v7 = v8;
    }
    else
    {
      BOOL v10 = [(NSIndexSet *)self->_centeredItemIdentifiers containsIndex:v8];
      uint64_t v9 = v8;
      if (!v10) {
        goto LABEL_13;
      }
    }
    if (v9)
    {
      identifiersOrder = self->_identifiersOrder;
      v12 = objc_msgSend(NSNumber, "numberWithInteger:");
      unint64_t v13 = [(NSArray *)identifiersOrder indexOfObject:v12];

      v14 = self->_identifiersOrder;
      v15 = [NSNumber numberWithInteger:v7];
      unint64_t v16 = [(NSArray *)v14 indexOfObject:v15];

      if (v13 != 0x7FFFFFFFFFFFFFFFLL && v16 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v17 = [(PUBarButtonItemCollection *)self _placeholderBarButtonItem];
        if (v13 >= v16) {
          [v18 addObject:v17];
        }
        else {
          [v18 insertObject:v17 atIndex:0];
        }
      }
    }
  }
LABEL_13:
}

- (id)_arrangedBarButtonItems:(id)a3 identifiers:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6 || ![v6 count])
  {
    BOOL v10 = 0;
    goto LABEL_15;
  }
  [(PUBarButtonItemCollection *)self _centersButtonsIfNeeded:v6 identifiers:v7];
  if ((-[PUBarButtonItemCollection _options](self, "_options") & 2) != 0 && [v6 count] == 1)
  {
    uint64_t v8 = [(PUBarButtonItemCollection *)self _flexibleSpaceBarButtonItem];
    [v6 insertObject:v8 atIndex:0];

    uint64_t v9 = [(PUBarButtonItemCollection *)self _flexibleSpaceBarButtonItem];
    [v6 addObject:v9];
  }
  else
  {
    if ((-[PUBarButtonItemCollection _options](self, "_options") & 4) == 0 || [v6 count] != 1)
    {
      if (([(PUBarButtonItemCollection *)self _options] & 1) != 0
        && (unint64_t)[v6 count] >= 2)
      {
        v11 = [MEMORY[0x1E4F1CA48] array];
        v15[0] = MEMORY[0x1E4F143A8];
        v15[1] = 3221225472;
        v15[2] = __65__PUBarButtonItemCollection__arrangedBarButtonItems_identifiers___block_invoke;
        v15[3] = &unk_1E5F23E40;
        v15[4] = self;
        id v12 = v11;
        id v16 = v12;
        [v6 enumerateObjectsUsingBlock:v15];
        id v13 = v12;

        id v6 = v13;
      }
      goto LABEL_14;
    }
    uint64_t v9 = [(PUBarButtonItemCollection *)self _flexibleSpaceBarButtonItem];
    [v6 insertObject:v9 atIndex:0];
  }

LABEL_14:
  id v6 = v6;
  BOOL v10 = v6;
LABEL_15:

  return v10;
}

void __65__PUBarButtonItemCollection__arrangedBarButtonItems_identifiers___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v6 = a2;
  if (a3)
  {
    v5 = [*(id *)(a1 + 32) _flexibleSpaceBarButtonItem];
    [*(id *)(a1 + 40) addObject:v5];
  }
  [*(id *)(a1 + 40) addObject:v6];
}

- (id)_newEntryForIdentifiers:(id)a3
{
  id v4 = a3;
  v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  identifiersOrder = self->_identifiersOrder;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __53__PUBarButtonItemCollection__newEntryForIdentifiers___block_invoke;
  v11[3] = &unk_1E5F23E18;
  id v12 = v4;
  id v13 = self;
  id v14 = v5;
  id v7 = v5;
  id v8 = v4;
  [(NSArray *)identifiersOrder enumerateObjectsUsingBlock:v11];
  uint64_t v9 = [(PUBarButtonItemCollection *)self _arrangedBarButtonItems:v7 identifiers:v8];

  return v9;
}

void __53__PUBarButtonItemCollection__newEntryForIdentifiers___block_invoke(id *a1, void *a2)
{
  uint64_t v3 = [a2 integerValue];
  if ([a1[4] containsIndex:v3])
  {
    id v4 = [a1[5] barButtonItemForIdentifier:v3];
    if (v4)
    {
      v5 = v4;
      [a1[6] addObject:v4];
      id v4 = v5;
    }
  }
}

- (id)orderedBarButtonsItemsForIdentifiers:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4 && [v4 count])
  {
    id v6 = [(PUBarButtonItemCollection *)self _previousRequestedSet];
    int v7 = [v5 isEqualToIndexSet:v6];

    if (!v7
      || ([(PUBarButtonItemCollection *)self _previousResult],
          (id v8 = (id)objc_claimAutoreleasedReturnValue()) == 0))
    {
      uint64_t v9 = (void *)[v5 copy];
      BOOL v10 = [(PUBarButtonItemCollection *)self _configurationsCache];
      id v8 = [v10 objectForKey:v9];

      if (!v8)
      {
        id v8 = [(PUBarButtonItemCollection *)self _newEntryForIdentifiers:v9];
        v11 = [(PUBarButtonItemCollection *)self _configurationsCache];
        id v12 = v11;
        if (v8)
        {
          [v11 setObject:v8 forKey:v9];
        }
        else
        {
          id v14 = [MEMORY[0x1E4F1CA98] null];
          [v12 setObject:v14 forKey:v9];
        }
      }
      [(PUBarButtonItemCollection *)self _setPreviousRequestedSet:v9];
      [(PUBarButtonItemCollection *)self _setPreviousResult:v8];
    }
    v15 = [MEMORY[0x1E4F1CA98] null];
    if ([v8 isEqual:v15]) {
      id v16 = 0;
    }
    else {
      id v16 = v8;
    }
    id v13 = v16;
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

- (int64_t)identifierForCustomButton:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  v5 = [(PUBarButtonItemCollection *)self _barButtonItems];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __55__PUBarButtonItemCollection_identifierForCustomButton___block_invoke;
  v9[3] = &unk_1E5F23DF0;
  id v6 = v4;
  id v10 = v6;
  v11 = &v12;
  [v5 enumerateKeysAndObjectsUsingBlock:v9];

  int64_t v7 = v13[3];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __55__PUBarButtonItemCollection_identifierForCustomButton___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v9 = a2;
  int64_t v7 = *(void **)(a1 + 32);
  id v8 = [a3 customView];
  LODWORD(v7) = [v7 isDescendantOfView:v8];

  if (v7)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v9 integerValue];
    *a4 = 1;
  }
}

- (int64_t)identifierForBarButtonItem:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  v5 = [(PUBarButtonItemCollection *)self _barButtonItems];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __56__PUBarButtonItemCollection_identifierForBarButtonItem___block_invoke;
  v9[3] = &unk_1E5F23DF0;
  id v6 = v4;
  id v10 = v6;
  v11 = &v12;
  [v5 enumerateKeysAndObjectsUsingBlock:v9];

  int64_t v7 = v13[3];
  _Block_object_dispose(&v12, 8);

  return v7;
}

uint64_t __56__PUBarButtonItemCollection_identifierForBarButtonItem___block_invoke(uint64_t result, void *a2, uint64_t a3, unsigned char *a4)
{
  if (*(void *)(result + 32) == a3)
  {
    uint64_t v5 = result;
    result = [a2 integerValue];
    *(void *)(*(void *)(*(void *)(v5 + 40) + 8) + 24) = result;
    *a4 = 1;
  }
  return result;
}

- (id)barButtonItemForIdentifier:(int64_t)a3
{
  uint64_t v5 = [(PUBarButtonItemCollection *)self _barButtonItems];
  id v6 = [NSNumber numberWithInteger:a3];
  int64_t v7 = [v5 objectForKeyedSubscript:v6];

  if (!v7)
  {
    id v8 = [(PUBarButtonItemCollection *)self dataSource];
    int64_t v7 = [v8 barButtonItemCollection:self newBarButtonItemForIdentifier:a3];

    id v9 = [(PUBarButtonItemCollection *)self _barButtonItems];
    id v10 = [NSNumber numberWithInteger:a3];
    [v9 setObject:v7 forKeyedSubscript:v10];
  }
  return v7;
}

- (NSDictionary)barButtonItems
{
  return (NSDictionary *)self->__barButtonItems;
}

- (void)setIdentifiersOrder:(id)a3
{
  uint64_t v5 = (NSArray *)a3;
  id v6 = v5;
  if (self->_identifiersOrder != v5)
  {
    id v8 = v5;
    BOOL v7 = -[NSArray isEqualToArray:](v5, "isEqualToArray:");
    id v6 = v8;
    if (!v7)
    {
      objc_storeStrong((id *)&self->_identifiersOrder, a3);
      [(PUBarButtonItemCollection *)self _resetSet];
      id v6 = v8;
    }
  }
}

- (void)_resetSet
{
  uint64_t v3 = [(PUBarButtonItemCollection *)self _configurationsCache];
  [v3 removeAllObjects];

  [(PUBarButtonItemCollection *)self _setPreviousRequestedSet:0];
  [(PUBarButtonItemCollection *)self _setPreviousResult:0];
}

- (PUBarButtonItemCollection)initWithOptions:(unint64_t)a3
{
  v14.receiver = self;
  v14.super_class = (Class)PUBarButtonItemCollection;
  id v4 = [(PUBarButtonItemCollection *)&v14 init];
  if (v4)
  {
    uint64_t v5 = (NSCache *)objc_alloc_init(MEMORY[0x1E4F1C998]);
    configurationsCache = v4->__configurationsCache;
    v4->__configurationsCache = v5;

    uint64_t v7 = [MEMORY[0x1E4F1CA60] dictionary];
    barButtonItems = v4->__barButtonItems;
    v4->__barButtonItems = (NSMutableDictionary *)v7;

    v4->__options = a3;
    uint64_t v9 = [objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:5 target:0 action:0];
    flexibleSpaceBarButtonItem = v4->__flexibleSpaceBarButtonItem;
    v4->__flexibleSpaceBarButtonItem = (UIBarButtonItem *)v9;

    uint64_t v11 = [objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:6 target:0 action:0];
    placeholderBarButtonItem = v4->__placeholderBarButtonItem;
    v4->__placeholderBarButtonItem = (UIBarButtonItem *)v11;

    [(UIBarButtonItem *)v4->__placeholderBarButtonItem setWidth:44.0];
  }
  return v4;
}

- (PUBarButtonItemCollection)init
{
  return [(PUBarButtonItemCollection *)self initWithOptions:0];
}

@end