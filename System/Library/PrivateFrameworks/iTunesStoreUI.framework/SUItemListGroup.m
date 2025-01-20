@interface SUItemListGroup
- (NSMutableArray)items;
- (NSString)indexBarTitle;
- (SUItem)separatorItem;
- (id)description;
- (void)dealloc;
- (void)setItems:(id)a3;
- (void)setSeparatorItem:(id)a3;
@end

@implementation SUItemListGroup

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SUItemListGroup;
  [(SUItemListGroup *)&v3 dealloc];
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)SUItemListGroup;
  return (id)[NSString stringWithFormat:@"%@ (%@, %lu)", -[SUItemListGroup description](&v3, sel_description), -[SUItem title](self->_separatorItem, "title"), -[NSMutableArray count](self->_items, "count")];
}

- (NSString)indexBarTitle
{
  result = [(SUItem *)self->_separatorItem stringValueForProperty:@"index-title"];
  if (!result)
  {
    separatorItem = self->_separatorItem;
    return [(SUItem *)separatorItem title];
  }
  return result;
}

- (NSMutableArray)items
{
  return self->_items;
}

- (void)setItems:(id)a3
{
}

- (SUItem)separatorItem
{
  return self->_separatorItem;
}

- (void)setSeparatorItem:(id)a3
{
}

@end