@interface NMSMutableItemEnumerator
- (BOOL)hasItems;
- (NMSMutableItemEnumerator)init;
- (id)nextItem;
- (void)addItem:(id)a3;
@end

@implementation NMSMutableItemEnumerator

- (NMSMutableItemEnumerator)init
{
  v6.receiver = self;
  v6.super_class = (Class)NMSMutableItemEnumerator;
  v2 = [(NMSMutableItemEnumerator *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF980] array];
    items = v2->_items;
    v2->_items = (NSMutableArray *)v3;
  }
  return v2;
}

- (void)addItem:(id)a3
{
}

- (id)nextItem
{
  unint64_t itemIndex = self->_itemIndex;
  unint64_t v4 = [(NSMutableArray *)self->_items count];
  items = self->_items;
  if (itemIndex >= v4)
  {
    [(NSMutableArray *)items removeAllObjects];
    unint64_t v7 = 0;
    objc_super v6 = 0;
  }
  else
  {
    objc_super v6 = [(NSMutableArray *)items objectAtIndex:self->_itemIndex];
    unint64_t v7 = self->_itemIndex + 1;
  }
  self->_unint64_t itemIndex = v7;

  return v6;
}

- (BOOL)hasItems
{
  return [(NSMutableArray *)self->_items count] != 0;
}

- (void).cxx_destruct
{
}

@end