@interface NMSSequentialItemEnumerator
- (NMSSequentialItemEnumerator)initWithItemEnumerators:(id)a3;
- (id)nextItem;
@end

@implementation NMSSequentialItemEnumerator

- (NMSSequentialItemEnumerator)initWithItemEnumerators:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NMSSequentialItemEnumerator;
  v5 = [(NMSSequentialItemEnumerator *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 mutableCopy];
    itemEnumerators = v5->_itemEnumerators;
    v5->_itemEnumerators = (NSMutableArray *)v6;
  }
  return v5;
}

- (id)nextItem
{
  for (i = self->_itemEnumerators; [(NSMutableArray *)i count]; i = self->_itemEnumerators)
  {
    id v4 = [(NSMutableArray *)self->_itemEnumerators firstObject];
    v5 = [v4 nextItem];

    if (v5) {
      goto LABEL_6;
    }
    [(NSMutableArray *)self->_itemEnumerators removeObjectAtIndex:0];
  }
  v5 = 0;
LABEL_6:

  return v5;
}

- (void).cxx_destruct
{
}

@end