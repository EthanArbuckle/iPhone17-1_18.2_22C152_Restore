@interface PGCuratorInvestigationFeeder
- (PGCuratorInvestigationFeeder)initWithItems:(id)a3;
- (id)allItems;
- (id)approximateLocation;
- (id)itemAtIndex:(unint64_t)a3;
- (id)localEndDateComponents;
- (id)localStartDateComponents;
- (id)privateItems;
- (id)sharedItems;
- (id)universalEndDate;
- (id)universalStartDate;
- (unint64_t)numberOfItems;
- (void)enumerateItemsUsingBlock:(id)a3;
- (void)enumerateItemsWithOptions:(unint64_t)a3 usingBlock:(id)a4;
@end

@implementation PGCuratorInvestigationFeeder

- (void).cxx_destruct
{
}

- (void)enumerateItemsWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
}

- (void)enumerateItemsUsingBlock:(id)a3
{
}

- (id)itemAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_items objectAtIndex:a3];
}

- (id)sharedItems
{
  items = self->_items;
  v3 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"clsIsInSharedLibrary == YES"];
  v4 = [(NSArray *)items filteredArrayUsingPredicate:v3];

  return v4;
}

- (id)privateItems
{
  items = self->_items;
  v3 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"clsIsInSharedLibrary == NO"];
  v4 = [(NSArray *)items filteredArrayUsingPredicate:v3];

  return v4;
}

- (id)allItems
{
  return self->_items;
}

- (id)approximateLocation
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v2 = self->_items;
  uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "clsLocation", (void)v10);
        if (v7)
        {
          v8 = (void *)v7;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [(NSArray *)v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  v8 = 0;
LABEL_11:

  return v8;
}

- (id)localEndDateComponents
{
  v2 = [(NSArray *)self->_items lastObject];
  uint64_t v3 = objc_msgSend(v2, "cls_localDateComponents");

  return v3;
}

- (id)localStartDateComponents
{
  v2 = [(NSArray *)self->_items firstObject];
  uint64_t v3 = objc_msgSend(v2, "cls_localDateComponents");

  return v3;
}

- (id)universalEndDate
{
  v2 = [(NSArray *)self->_items lastObject];
  uint64_t v3 = objc_msgSend(v2, "cls_universalDate");

  return v3;
}

- (id)universalStartDate
{
  v2 = [(NSArray *)self->_items firstObject];
  uint64_t v3 = objc_msgSend(v2, "cls_universalDate");

  return v3;
}

- (unint64_t)numberOfItems
{
  return [(NSArray *)self->_items count];
}

- (PGCuratorInvestigationFeeder)initWithItems:(id)a3
{
  v13[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PGCuratorInvestigationFeeder;
  uint64_t v5 = [(CLSInvestigationFeeder *)&v12 init];
  if (v5)
  {
    v6 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"cls_universalDate" ascending:1];
    v13[0] = v6;
    uint64_t v7 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"clsIdentifier" ascending:1];
    v13[1] = v7;
    v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
    uint64_t v9 = [v4 sortedArrayUsingDescriptors:v8];
    items = v5->_items;
    v5->_items = (NSArray *)v9;
  }
  return v5;
}

@end