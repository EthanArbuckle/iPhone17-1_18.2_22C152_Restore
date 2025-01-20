@interface OABTableSortedIntArray
- (OABTableSortedIntArray)initWithIntSet:(id)a3;
- (int)dim;
- (int)indexOfInt:(int)a3;
- (int)intAtIndex:(int)a3;
@end

@implementation OABTableSortedIntArray

- (OABTableSortedIntArray)initWithIntSet:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)OABTableSortedIntArray;
  v5 = [(OABTableSortedIntArray *)&v10 init];
  if (v5)
  {
    v6 = [v4 allObjects];
    uint64_t v7 = [v6 sortedArrayUsingSelector:sel_compare_];
    mIntArray = v5->mIntArray;
    v5->mIntArray = (NSArray *)v7;
  }
  return v5;
}

- (int)indexOfInt:(int)a3
{
  mIntArray = self->mIntArray;
  id v4 = [NSNumber numberWithInt:*(void *)&a3];
  uint64_t v5 = [(NSArray *)mIntArray indexOfObject:v4];

  TCVerifyInputMeetsCondition(v5 != 0x7FFFFFFFFFFFFFFFLL);
  return v5;
}

- (int)intAtIndex:(int)a3
{
  v3 = [(NSArray *)self->mIntArray objectAtIndex:a3];
  int v4 = [v3 intValue];

  return v4;
}

- (int)dim
{
  return [(NSArray *)self->mIntArray count];
}

- (void).cxx_destruct
{
}

@end