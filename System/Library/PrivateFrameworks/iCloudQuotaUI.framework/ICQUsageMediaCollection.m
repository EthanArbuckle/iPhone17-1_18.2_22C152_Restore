@interface ICQUsageMediaCollection
- (BOOL)isGrouped;
- (NSArray)itemSizes;
- (NSArray)items;
- (float)totalSize;
- (void)removeItemAtIndex:(unint64_t)a3;
- (void)setGrouped:(BOOL)a3;
- (void)setItemSizes:(id)a3;
- (void)setItems:(id)a3;
- (void)setTotalSize:(float)a3;
- (void)sortItemsByMediaKey:(id)a3;
@end

@implementation ICQUsageMediaCollection

- (void)removeItemAtIndex:(unint64_t)a3
{
  v5 = -[NSMutableArray objectAtIndexedSubscript:](self->_itemSizes, "objectAtIndexedSubscript:");
  [v5 floatValue];
  self->_totalSize = self->_totalSize - v6;

  [(NSMutableArray *)self->_items removeObjectAtIndex:a3];
  itemSizes = self->_itemSizes;
  [(NSMutableArray *)itemSizes removeObjectAtIndex:a3];
}

- (void)sortItemsByMediaKey:(id)a3
{
  if ([(ICQUsageMediaCollection *)self isGrouped])
  {
    v4 = [NSDictionary dictionaryWithObjects:self->_itemSizes forKeys:self->_items];
    items = self->_items;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __47__ICQUsageMediaCollection_sortItemsByMediaKey___block_invoke;
    v8[3] = &unk_264922368;
    id v9 = v4;
    id v6 = v4;
    [(NSMutableArray *)items sortUsingComparator:v8];
    [(NSMutableArray *)self->_itemSizes sortUsingComparator:&__block_literal_global_16];
  }
  else
  {
    v7 = self->_items;
    [(NSMutableArray *)v7 sortUsingComparator:&__block_literal_global_69];
  }
}

uint64_t __47__ICQUsageMediaCollection_sortItemsByMediaKey___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v5 = *(void **)(a1 + 32);
  id v6 = a2;
  v7 = [v5 objectForKey:a3];
  v8 = [*(id *)(a1 + 32) objectForKey:v6];

  uint64_t v9 = [v7 compare:v8];
  return v9;
}

uint64_t __47__ICQUsageMediaCollection_sortItemsByMediaKey___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 compare:a2];
}

uint64_t __47__ICQUsageMediaCollection_sortItemsByMediaKey___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *MEMORY[0x263F11298];
  id v5 = a2;
  uint64_t v6 = [a3 valueForProperty:v4];
  v7 = (void *)v6;
  if (v6) {
    v8 = (void *)v6;
  }
  else {
    v8 = &unk_26E01ED98;
  }
  id v9 = v8;

  v10 = [v5 valueForProperty:v4];

  if (v10) {
    v11 = v10;
  }
  else {
    v11 = &unk_26E01ED98;
  }
  id v12 = v11;

  uint64_t v13 = [v9 compare:v12];
  return v13;
}

- (void)setItems:(id)a3
{
  if (self->_items != a3)
  {
    uint64_t v4 = (NSMutableArray *)[a3 mutableCopy];
    items = self->_items;
    self->_items = v4;
  }
}

- (void)setItemSizes:(id)a3
{
  if (self->_itemSizes != a3)
  {
    uint64_t v4 = (NSMutableArray *)[a3 mutableCopy];
    itemSizes = self->_itemSizes;
    self->_itemSizes = v4;
  }
}

- (BOOL)isGrouped
{
  return self->_grouped;
}

- (void)setGrouped:(BOOL)a3
{
  self->_grouped = a3;
}

- (NSArray)items
{
  return &self->_items->super;
}

- (NSArray)itemSizes
{
  return &self->_itemSizes->super;
}

- (float)totalSize
{
  return self->_totalSize;
}

- (void)setTotalSize:(float)a3
{
  self->_totalSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemSizes, 0);
  objc_storeStrong((id *)&self->_items, 0);
}

@end