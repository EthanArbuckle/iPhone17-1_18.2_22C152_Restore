@interface EDPivotItem
+ (id)pivotItem;
- (EDPivotItem)init;
- (id)description;
- (id)itemIndexes;
- (int)type;
- (unsigned)repeatedItemCounts;
- (void)setRepeatedItemCounts:(unsigned int)a3;
- (void)setType:(int)a3;
@end

@implementation EDPivotItem

+ (id)pivotItem
{
  id v2 = objc_alloc_init((Class)objc_opt_class());
  return v2;
}

- (EDPivotItem)init
{
  v7.receiver = self;
  v7.super_class = (Class)EDPivotItem;
  id v2 = [(EDPivotItem *)&v7 init];
  v3 = v2;
  if (v2)
  {
    *(void *)&v2->mRepeatedItemCounts = 0x100000000;
    v4 = objc_alloc_init(EDCollection);
    mItemIndexes = v3->mItemIndexes;
    v3->mItemIndexes = v4;
  }
  return v3;
}

- (void)setType:(int)a3
{
  self->mType = a3;
}

- (id)itemIndexes
{
  return self->mItemIndexes;
}

- (unsigned)repeatedItemCounts
{
  return self->mRepeatedItemCounts;
}

- (int)type
{
  return self->mType;
}

- (void)setRepeatedItemCounts:(unsigned int)a3
{
  self->mRepeatedItemCounts = a3;
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)EDPivotItem;
  id v2 = [(EDPivotItem *)&v4 description];
  return v2;
}

- (void).cxx_destruct
{
}

@end