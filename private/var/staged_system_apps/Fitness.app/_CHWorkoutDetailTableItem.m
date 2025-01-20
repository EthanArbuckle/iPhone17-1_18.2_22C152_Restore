@interface _CHWorkoutDetailTableItem
- (Class)cellClass;
- (NSArray)subItems;
- (void)setCellClass:(Class)a3;
- (void)setSubItems:(id)a3;
@end

@implementation _CHWorkoutDetailTableItem

- (Class)cellClass
{
  return self->_cellClass;
}

- (void)setCellClass:(Class)a3
{
}

- (NSArray)subItems
{
  return self->_subItems;
}

- (void)setSubItems:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subItems, 0);

  objc_storeStrong((id *)&self->_cellClass, 0);
}

@end