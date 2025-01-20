@interface MBChunkStoreBatch
+ (id)batch;
- (MBChunkStoreBatch)init;
- (NSArray)items;
- (id)itemAtIndex:(unint64_t)a3;
- (id)itemEnumerator;
- (unint64_t)itemCount;
- (unint64_t)totalSize;
- (void)addItem:(id)a3;
- (void)dealloc;
- (void)removeAllItems;
@end

@implementation MBChunkStoreBatch

+ (id)batch
{
  v2 = objc_alloc_init(MBChunkStoreBatch);
  return v2;
}

- (MBChunkStoreBatch)init
{
  v4.receiver = self;
  v4.super_class = (Class)MBChunkStoreBatch;
  v2 = [(MBChunkStoreBatch *)&v4 init];
  if (v2) {
    v2->_items = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  }
  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MBChunkStoreBatch;
  [(MBChunkStoreBatch *)&v3 dealloc];
}

- (unint64_t)itemCount
{
  return (unint64_t)[(NSMutableArray *)self->_items count];
}

- (NSArray)items
{
  return &self->_items->super;
}

- (id)itemAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_items objectAtIndexedSubscript:a3];
}

- (id)itemEnumerator
{
  return [(NSMutableArray *)self->_items objectEnumerator];
}

- (void)addItem:(id)a3
{
  self->_totalSize += (unint64_t)[a3 size];
}

- (void)removeAllItems
{
  self->_totalSize = 0;
}

- (unint64_t)totalSize
{
  return self->_totalSize;
}

@end