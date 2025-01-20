@interface SUItemList
- (BOOL)ignoresEmptySections;
- (NSArray)sectionIndexTitles;
- (id)_groupAtExternalIndex:(int64_t)a3;
- (id)copyItems;
- (id)copyWithZone:(_NSZone *)a3;
- (id)hintTextForKey:(id)a3;
- (id)indexPathOfItem:(id)a3;
- (id)indexPathOfItemWithIdentifier:(unint64_t)a3;
- (id)itemAtIndexPath:(id)a3;
- (id)itemsForSectionAtIndex:(int64_t)a3;
- (id)sectionItemForSectionAtIndex:(int64_t)a3;
- (int64_t)numberOfItems;
- (int64_t)numberOfSections;
- (int64_t)sectionIndexForIndexTitle:(id)a3 atIndex:(int64_t)a4;
- (void)_removeHiddenItemsFromArray:(id)a3;
- (void)dealloc;
- (void)enumerateItemsUsingBlock:(id)a3;
- (void)insertItems:(id)a3 atIndexPath:(id)a4;
- (void)removeItemAtIndexPath:(id)a3;
- (void)replaceItemAtIndexPath:(id)a3 withItems:(id)a4;
- (void)setHintText:(id)a3;
- (void)setIgnoresEmptySections:(BOOL)a3;
- (void)setItems:(id)a3;
- (void)setItemsFromPropertyList:(id)a3;
@end

@implementation SUItemList

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SUItemList;
  [(SUItemList *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(void *)(v5 + 8) = [(NSMutableArray *)self->_groups mutableCopyWithZone:a3];
  *(void *)(v5 + 16) = [(NSDictionary *)self->_hintText copyWithZone:a3];
  *(unsigned char *)(v5 + 24) = self->_ignoresEmptySections;
  return (id)v5;
}

- (id)copyItems
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  groups = self->_groups;
  uint64_t v5 = [(NSMutableArray *)groups countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(groups);
        }
        objc_msgSend(v3, "addObjectsFromArray:", objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v8++), "items"));
      }
      while (v6 != v8);
      uint64_t v6 = [(NSMutableArray *)groups countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
  return v3;
}

- (void)enumerateItemsUsingBlock:(id)a3
{
  unsigned __int8 v15 = 0;
  uint64_t v4 = [(NSMutableArray *)self->_groups count];
  if (v4 >= 1)
  {
    uint64_t v5 = v4;
    uint64_t v6 = 0;
    do
    {
      uint64_t v7 = objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->_groups, "objectAtIndex:", v6), "items");
      uint64_t v8 = [v7 count];
      int v9 = v15;
      if (v8 >= 1 && v15 == 0)
      {
        uint64_t v11 = v8;
        uint64_t v12 = 1;
        do
        {
          uint64_t v13 = [v7 objectAtIndex:v12 - 1];
          (*((void (**)(id, uint64_t, uint64_t, unsigned __int8 *))a3 + 2))(a3, v13, [MEMORY[0x263F088C8] indexPathForRow:v12 - 1 inSection:v6], &v15);
          int v9 = v15;
          if (v12 >= v11) {
            break;
          }
          ++v12;
        }
        while (!v15);
      }
      ++v6;
    }
    while (v6 < v5 && !v9);
  }
}

- (id)indexPathOfItem:(id)a3
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000;
  int v9 = __Block_byref_object_copy__28;
  long long v10 = __Block_byref_object_dispose__28;
  uint64_t v11 = 0;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __30__SUItemList_indexPathOfItem___block_invoke;
  v5[3] = &unk_264813CD0;
  v5[4] = a3;
  v5[5] = &v6;
  [(SUItemList *)self enumerateItemsUsingBlock:v5];
  id v3 = (void *)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

void *__30__SUItemList_indexPathOfItem___block_invoke(void *result, uint64_t a2, void *a3, unsigned char *a4)
{
  if (result[4] == a2)
  {
    uint64_t v5 = result;
    result = a3;
    *(void *)(*(void *)(v5[5] + 8) + 40) = result;
    *a4 = 1;
  }
  return result;
}

- (id)indexPathOfItemWithIdentifier:(unint64_t)a3
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000;
  int v9 = __Block_byref_object_copy__28;
  long long v10 = __Block_byref_object_dispose__28;
  uint64_t v11 = 0;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __44__SUItemList_indexPathOfItemWithIdentifier___block_invoke;
  v5[3] = &unk_264813CF8;
  v5[4] = &v6;
  v5[5] = a3;
  [(SUItemList *)self enumerateItemsUsingBlock:v5];
  id v3 = (void *)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __44__SUItemList_indexPathOfItemWithIdentifier___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id result = (id)[a2 itemIdentifier];
  if (result == *(id *)(a1 + 40))
  {
    id result = a3;
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = result;
    *a4 = 1;
  }
  return result;
}

- (id)itemAtIndexPath:(id)a3
{
  if ([a3 length] != 2) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SUItemList.m", 100, @"Index path must contain 2 indices");
  }
  uint64_t v6 = objc_msgSend(-[SUItemList _groupAtExternalIndex:](self, "_groupAtExternalIndex:", objc_msgSend(a3, "indexAtPosition:", 0)), "items");
  uint64_t v7 = [a3 indexAtPosition:1];

  return (id)[v6 objectAtIndex:v7];
}

- (id)itemsForSectionAtIndex:(int64_t)a3
{
  id v3 = [(SUItemList *)self _groupAtExternalIndex:a3];

  return (id)[v3 items];
}

- (int64_t)numberOfItems
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  groups = self->_groups;
  uint64_t v3 = [(NSMutableArray *)groups countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (!v3) {
    return 0;
  }
  uint64_t v4 = v3;
  int64_t v5 = 0;
  uint64_t v6 = *(void *)v10;
  do
  {
    for (uint64_t i = 0; i != v4; ++i)
    {
      if (*(void *)v10 != v6) {
        objc_enumerationMutation(groups);
      }
      v5 += objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * i), "items"), "count");
    }
    uint64_t v4 = [(NSMutableArray *)groups countByEnumeratingWithState:&v9 objects:v13 count:16];
  }
  while (v4);
  return v5;
}

- (int64_t)numberOfSections
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  int64_t v3 = [(NSMutableArray *)self->_groups count];
  if (self->_ignoresEmptySections)
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    groups = self->_groups;
    uint64_t v5 = [(NSMutableArray *)groups countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v11;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(groups);
          }
          int64_t v3 = (__PAIR128__(v3, objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "items"), "count"))- 1) >> 64;
        }
        uint64_t v6 = [(NSMutableArray *)groups countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v6);
    }
  }
  return v3;
}

- (int64_t)sectionIndexForIndexTitle:(id)a3 atIndex:(int64_t)a4
{
  if (!self->_ignoresEmptySections || a4 < 1) {
    return a4;
  }
  uint64_t v7 = 0;
  int64_t v8 = a4;
  do
    int64_t v8 = (__PAIR128__(v8, objc_msgSend((id)objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->_groups, "objectAtIndex:", v7++), "items"), "count"))- 1) >> 64;
  while (a4 != v7);
  return v8;
}

- (NSArray)sectionIndexTitles
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  int64_t v3 = (NSArray *)[MEMORY[0x263EFF980] array];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  groups = self->_groups;
  uint64_t v5 = [(NSMutableArray *)groups countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(groups);
        }
        long long v9 = (void *)[*(id *)(*((void *)&v11 + 1) + 8 * v8) indexBarTitle];
        if ([v9 length]) {
          [(NSArray *)v3 addObject:v9];
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [(NSMutableArray *)groups countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
  return v3;
}

- (id)sectionItemForSectionAtIndex:(int64_t)a3
{
  id v4 = [(SUItemList *)self _groupAtExternalIndex:a3];
  uint64_t v5 = v4;
  if (self->_ignoresEmptySections && !objc_msgSend((id)objc_msgSend(v4, "items"), "count")) {
    uint64_t v5 = 0;
  }

  return (id)[v5 separatorItem];
}

- (void)insertItems:(id)a3 atIndexPath:(id)a4
{
  if ([a4 length] != 2) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SUItemList.m", 165, @"Index path must contain 2 indices");
  }
  id v8 = -[SUItemList _groupAtExternalIndex:](self, "_groupAtExternalIndex:", [a4 indexAtPosition:0]);
  uint64_t v9 = [a4 indexAtPosition:1];
  long long v10 = (void *)[v8 items];
  uint64_t v11 = objc_msgSend(MEMORY[0x263F088D0], "indexSetWithIndexesInRange:", v9, objc_msgSend(a3, "count"));

  [v10 insertObjects:a3 atIndexes:v11];
}

- (void)removeItemAtIndexPath:(id)a3
{
  if ([a3 length] != 2) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SUItemList.m", 172, @"Index path must contain 2 indices");
  }
  uint64_t v6 = objc_msgSend(-[SUItemList _groupAtExternalIndex:](self, "_groupAtExternalIndex:", objc_msgSend(a3, "indexAtPosition:", 0)), "items");
  uint64_t v7 = [a3 indexAtPosition:1];

  [v6 removeObjectAtIndex:v7];
}

- (void)replaceItemAtIndexPath:(id)a3 withItems:(id)a4
{
  -[SUItemList removeItemAtIndexPath:](self, "removeItemAtIndexPath:");

  [(SUItemList *)self insertItems:a4 atIndexPath:a3];
}

- (void)setItems:(id)a3
{
  self->_groups = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  long long v10 = objc_alloc_init(SUItemListGroup);
  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v6 = [a3 count];
  if (v6 >= 1)
  {
    uint64_t v7 = v6;
    for (uint64_t i = 0; i != v7; ++i)
    {
      uint64_t v9 = (void *)[a3 objectAtIndex:i];
      if ([v9 itemType] == 7)
      {
        if (i)
        {
          [(SUItemListGroup *)v10 setItems:v5];

          [(NSMutableArray *)self->_groups addObject:v10];
          long long v10 = objc_alloc_init(SUItemListGroup);
          id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
        }
        [(SUItemListGroup *)v10 setSeparatorItem:v9];
      }
      else
      {
        [v5 addObject:v9];
      }
    }
  }
  [(SUItemListGroup *)v10 setItems:v5];

  [(NSMutableArray *)self->_groups addObject:v10];
}

- (void)setItemsFromPropertyList:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v6 = +[SUItemDataSource sharedDataSource];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v7 = [a3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(a3);
        }
        uint64_t v11 = [v6 newItemWithItemDictionary:*(void *)(*((void *)&v13 + 1) + 8 * v10)];
        if (v11)
        {
          long long v12 = (void *)v11;
          [v5 addObject:v11];
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [a3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }
  [(SUItemList *)self _removeHiddenItemsFromArray:v5];
  [(SUItemList *)self setItems:v5];
}

- (id)hintTextForKey:(id)a3
{
  if (a3) {
    return -[NSDictionary objectForKey:](self->_hintText, "objectForKey:");
  }
  else {
    return 0;
  }
}

- (void)setHintText:(id)a3
{
  hintText = self->_hintText;
  if (hintText != a3)
  {

    self->_hintText = (NSDictionary *)a3;
  }
}

- (id)_groupAtExternalIndex:(int64_t)a3
{
  if (self->_ignoresEmptySections)
  {
    uint64_t v5 = [(NSMutableArray *)self->_groups count];
    if ((a3 & 0x8000000000000000) == 0)
    {
      int64_t v6 = v5;
      if (v5 >= 1)
      {
        int64_t v7 = 0;
        do
        {
          if (!objc_msgSend((id)objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->_groups, "objectAtIndex:", v7), "items"), "count"))++a3; {
          BOOL v8 = v7++ < a3;
          }
          BOOL v8 = v8 && v7 < v6;
        }
        while (v8);
      }
    }
  }
  if (a3 >= (unint64_t)[(NSMutableArray *)self->_groups count]) {
    return 0;
  }
  groups = self->_groups;

  return (id)[(NSMutableArray *)groups objectAtIndex:a3];
}

- (void)_removeHiddenItemsFromArray:(id)a3
{
  uint64_t v4 = [a3 count];
  if (v4 >= 1)
  {
    unint64_t v5 = v4 + 1;
    do
    {
      if ((objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", v5 - 2), "isDisplayable:", 0) & 1) == 0) {
        [a3 removeObjectAtIndex:v5 - 2];
      }
      --v5;
    }
    while (v5 > 1);
  }
}

- (BOOL)ignoresEmptySections
{
  return self->_ignoresEmptySections;
}

- (void)setIgnoresEmptySections:(BOOL)a3
{
  self->_ignoresEmptySections = a3;
}

@end