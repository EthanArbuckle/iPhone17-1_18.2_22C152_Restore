@interface IMGridViewUpdateItem
- (IMGridViewUpdateItem)initWithAction:(int)a3 forIndex:(unint64_t)a4;
- (int)action;
- (int64_t)compareIndexes:(id)a3;
- (int64_t)inverseCompareIndexes:(id)a3;
- (unint64_t)index;
- (void)setAction:(int)a3;
- (void)setIndex:(unint64_t)a3;
@end

@implementation IMGridViewUpdateItem

- (IMGridViewUpdateItem)initWithAction:(int)a3 forIndex:(unint64_t)a4
{
  result = [(IMGridViewUpdateItem *)self init];
  if (result)
  {
    result->_action = a3;
    result->_index = a4;
  }
  return result;
}

- (int64_t)compareIndexes:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(IMGridViewUpdateItem *)self index];
  if (v5 <= (unint64_t)[v4 index])
  {
    unint64_t v7 = [(IMGridViewUpdateItem *)self index];
    if (v7 >= (unint64_t)[v4 index]) {
      int64_t v6 = 0;
    }
    else {
      int64_t v6 = -1;
    }
  }
  else
  {
    int64_t v6 = 1;
  }

  return v6;
}

- (int64_t)inverseCompareIndexes:(id)a3
{
  return (int64_t)_[a3 compareIndexes:self];
}

- (int)action
{
  return self->_action;
}

- (void)setAction:(int)a3
{
  self->_action = a3;
}

- (unint64_t)index
{
  return self->_index;
}

- (void)setIndex:(unint64_t)a3
{
  self->_index = a3;
}

@end