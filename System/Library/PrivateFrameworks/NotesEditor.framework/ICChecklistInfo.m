@interface ICChecklistInfo
- (unint64_t)numberOfCheckedItems;
- (unint64_t)numberOfItems;
- (unint64_t)numberOfUncheckedItems;
- (void)setNumberOfCheckedItems:(unint64_t)a3;
- (void)setNumberOfItems:(unint64_t)a3;
- (void)setNumberOfUncheckedItems:(unint64_t)a3;
@end

@implementation ICChecklistInfo

- (unint64_t)numberOfItems
{
  return self->_numberOfItems;
}

- (void)setNumberOfItems:(unint64_t)a3
{
  self->_numberOfItems = a3;
}

- (unint64_t)numberOfCheckedItems
{
  return self->_numberOfCheckedItems;
}

- (void)setNumberOfCheckedItems:(unint64_t)a3
{
  self->_numberOfCheckedItems = a3;
}

- (unint64_t)numberOfUncheckedItems
{
  return self->_numberOfUncheckedItems;
}

- (void)setNumberOfUncheckedItems:(unint64_t)a3
{
  self->_numberOfUncheckedItems = a3;
}

@end