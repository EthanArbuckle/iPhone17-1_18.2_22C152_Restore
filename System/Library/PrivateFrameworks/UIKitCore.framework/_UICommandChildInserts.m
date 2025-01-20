@interface _UICommandChildInserts
- (NSArray)afterElements;
- (NSArray)beforeElements;
- (void)_setBeforeElements:(id)a3 afterElements:(id)a4;
@end

@implementation _UICommandChildInserts

- (void)_setBeforeElements:(id)a3 afterElements:(id)a4
{
  v6 = (NSArray *)a3;
  v7 = (NSArray *)a4;
  beforeElements = self->_beforeElements;
  self->_beforeElements = v6;
  v10 = v6;

  afterElements = self->_afterElements;
  self->_afterElements = v7;
}

- (NSArray)beforeElements
{
  return self->_beforeElements;
}

- (NSArray)afterElements
{
  return self->_afterElements;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_afterElements, 0);
  objc_storeStrong((id *)&self->_beforeElements, 0);
}

@end