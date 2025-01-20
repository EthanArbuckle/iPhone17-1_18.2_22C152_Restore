@interface NMSAlternatingItemEnumerator
- (NMSAlternatingItemEnumerator)initWithItemEnumerators:(id)a3;
- (id)nextItem;
@end

@implementation NMSAlternatingItemEnumerator

- (NMSAlternatingItemEnumerator)initWithItemEnumerators:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NMSAlternatingItemEnumerator;
  v5 = [(NMSAlternatingItemEnumerator *)&v9 init];
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
    id v4 = [(NSMutableArray *)self->_itemEnumerators objectAtIndex:self->_itemEnumeratorIndex];
    v5 = [v4 nextItem];

    if (v5) {
      goto LABEL_6;
    }
    [(NSMutableArray *)self->_itemEnumerators removeObjectAtIndex:self->_itemEnumeratorIndex];
    unint64_t itemEnumeratorIndex = self->_itemEnumeratorIndex;
    self->_unint64_t itemEnumeratorIndex = itemEnumeratorIndex % [(NSMutableArray *)self->_itemEnumerators count];
  }
  v5 = 0;
LABEL_6:
  unint64_t v7 = self->_itemEnumeratorIndex + 1;
  self->_unint64_t itemEnumeratorIndex = v7 % [(NSMutableArray *)self->_itemEnumerators count];

  return v5;
}

- (void).cxx_destruct
{
}

@end