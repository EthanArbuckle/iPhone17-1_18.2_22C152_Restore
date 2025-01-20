@interface EDPivotField
+ (id)pivotField;
- (BOOL)compact;
- (BOOL)dataField;
- (BOOL)insertBlankRow;
- (BOOL)outlineItems;
- (BOOL)showAllItems;
- (BOOL)showDefaultSubTotal;
- (BOOL)subtotalTop;
- (EDPivotField)init;
- (id)description;
- (id)pivotFieldItems;
- (int)axis;
- (unint64_t)numFmtId;
- (void)setAxis:(int)a3;
- (void)setCompact:(BOOL)a3;
- (void)setDataField:(BOOL)a3;
- (void)setInsertBlankRow:(BOOL)a3;
- (void)setNumFmtId:(unint64_t)a3;
- (void)setOutlineItems:(BOOL)a3;
- (void)setShowAllItems:(BOOL)a3;
- (void)setShowDefaultSubTotal:(BOOL)a3;
- (void)setSubtotalTop:(BOOL)a3;
@end

@implementation EDPivotField

+ (id)pivotField
{
  id v2 = objc_alloc_init((Class)objc_opt_class());
  return v2;
}

- (EDPivotField)init
{
  v7.receiver = self;
  v7.super_class = (Class)EDPivotField;
  id v2 = [(EDPivotField *)&v7 init];
  v3 = v2;
  if (v2)
  {
    *(_WORD *)&v2->mOutlineItems = 0;
    *(void *)&v2->mAxis = 3;
    v2->mNumFmtId = 0;
    v4 = objc_alloc_init(EDCollection);
    mPivotFieldItems = v3->mPivotFieldItems;
    v3->mPivotFieldItems = v4;
  }
  return v3;
}

- (void)setNumFmtId:(unint64_t)a3
{
  self->mNumFmtId = a3;
}

- (void)setAxis:(int)a3
{
  self->mAxis = a3;
}

- (void)setCompact:(BOOL)a3
{
  self->mCompact = a3;
}

- (void)setDataField:(BOOL)a3
{
  self->mDataField = a3;
}

- (void)setShowDefaultSubTotal:(BOOL)a3
{
  self->mShowDefaultSubTotal = a3;
}

- (void)setInsertBlankRow:(BOOL)a3
{
  self->mInsertBlankRow = a3;
}

- (void)setOutlineItems:(BOOL)a3
{
  self->mOutlineItems = a3;
}

- (void)setShowAllItems:(BOOL)a3
{
  self->mShowAllItems = a3;
}

- (void)setSubtotalTop:(BOOL)a3
{
  self->mSubtotalTop = a3;
}

- (id)pivotFieldItems
{
  return self->mPivotFieldItems;
}

- (BOOL)compact
{
  return self->mCompact;
}

- (BOOL)dataField
{
  return self->mDataField;
}

- (BOOL)showDefaultSubTotal
{
  return self->mShowDefaultSubTotal;
}

- (BOOL)insertBlankRow
{
  return self->mInsertBlankRow;
}

- (BOOL)outlineItems
{
  return self->mOutlineItems;
}

- (BOOL)showAllItems
{
  return self->mShowAllItems;
}

- (BOOL)subtotalTop
{
  return self->mSubtotalTop;
}

- (unint64_t)numFmtId
{
  return self->mNumFmtId;
}

- (int)axis
{
  return self->mAxis;
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)EDPivotField;
  id v2 = [(EDPivotField *)&v4 description];
  return v2;
}

- (void).cxx_destruct
{
}

@end