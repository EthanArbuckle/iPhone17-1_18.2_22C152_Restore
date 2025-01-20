@interface EDPivotArea
+ (id)pivotArea;
- (BOOL)grandCol;
- (BOOL)grandRow;
- (BOOL)outline;
- (EDPivotArea)init;
- (id)description;
- (id)offset;
- (id)references;
- (int)type;
- (void)setGrandCol:(BOOL)a3;
- (void)setGrandRow:(BOOL)a3;
- (void)setOffset:(id)a3;
- (void)setOutline:(BOOL)a3;
- (void)setType:(int)a3;
@end

@implementation EDPivotArea

- (EDPivotArea)init
{
  v7.receiver = self;
  v7.super_class = (Class)EDPivotArea;
  v2 = [(EDPivotArea *)&v7 init];
  v3 = v2;
  if (v2)
  {
    *(_WORD *)&v2->mGrandCol = 0;
    v2->mOutline = 0;
    v2->mType = 3;
    v4 = objc_alloc_init(EDCollection);
    mReferences = v3->mReferences;
    v3->mReferences = v4;
  }
  return v3;
}

+ (id)pivotArea
{
  id v2 = objc_alloc_init((Class)objc_opt_class());
  return v2;
}

- (BOOL)grandRow
{
  return self->mGrandRow;
}

- (void)setGrandRow:(BOOL)a3
{
  self->mGrandRow = a3;
}

- (BOOL)grandCol
{
  return self->mGrandCol;
}

- (void)setGrandCol:(BOOL)a3
{
  self->mGrandCol = a3;
}

- (BOOL)outline
{
  return self->mOutline;
}

- (void)setOutline:(BOOL)a3
{
  self->mOutline = a3;
}

- (int)type
{
  return self->mType;
}

- (void)setType:(int)a3
{
  self->mType = a3;
}

- (id)offset
{
  return self->mOffset;
}

- (void)setOffset:(id)a3
{
  v5 = (EDReference *)a3;
  mOffset = self->mOffset;
  p_mOffset = &self->mOffset;
  if (mOffset != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_mOffset, a3);
    v5 = v8;
  }
}

- (id)references
{
  return self->mReferences;
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)EDPivotArea;
  id v2 = [(EDPivotArea *)&v4 description];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mOffset, 0);
  objc_storeStrong((id *)&self->mReferences, 0);
}

@end