@interface NMSItemGroupEnumerator
- (NMSItemGroupEnumerator)initWithItemGroup:(id)a3;
- (id)nextItem;
@end

@implementation NMSItemGroupEnumerator

- (NMSItemGroupEnumerator)initWithItemGroup:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NMSItemGroupEnumerator;
  v6 = [(NMSItemGroupEnumerator *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_itemGroup, a3);
  }

  return v7;
}

- (id)nextItem
{
  itemList = self->_itemList;
  if (!itemList)
  {
    if (self->_itemIndex)
    {
      itemList = 0;
      return [(NSArray *)itemList objectAtIndex:self->_itemIndex++];
    }
    v6 = [(NMSMediaItemGroup *)self->_itemGroup itemList];
    v7 = self->_itemList;
    self->_itemList = v6;

    itemList = self->_itemList;
    if (!itemList) {
      return [(NSArray *)itemList objectAtIndex:self->_itemIndex++];
    }
  }
  unint64_t itemIndex = self->_itemIndex;
  unint64_t v5 = [(NSArray *)itemList count];
  itemList = self->_itemList;
  if (itemIndex >= v5)
  {
    self->_itemList = 0;

    itemList = self->_itemList;
  }
  return [(NSArray *)itemList objectAtIndex:self->_itemIndex++];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemList, 0);

  objc_storeStrong((id *)&self->_itemGroup, 0);
}

@end