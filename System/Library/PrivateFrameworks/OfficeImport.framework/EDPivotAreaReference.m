@interface EDPivotAreaReference
+ (id)pivotAreaReference;
- (BOOL)byPosition;
- (BOOL)relative;
- (BOOL)selected;
- (EDPivotAreaReference)init;
- (id)description;
- (unint64_t)count;
- (unint64_t)fieldId;
- (void)setByPosition:(BOOL)a3;
- (void)setCount:(unint64_t)a3;
- (void)setFieldId:(unint64_t)a3;
- (void)setRelative:(BOOL)a3;
- (void)setSelected:(BOOL)a3;
@end

@implementation EDPivotAreaReference

- (EDPivotAreaReference)init
{
  v3.receiver = self;
  v3.super_class = (Class)EDPivotAreaReference;
  result = [(EDPivotAreaReference *)&v3 init];
  if (result)
  {
    *(_WORD *)&result->mByPosition = 0;
    result->mSelected = 0;
    result->mFieldId = 0;
    result->mCount = 0;
  }
  return result;
}

+ (id)pivotAreaReference
{
  id v2 = objc_alloc_init((Class)objc_opt_class());
  return v2;
}

- (BOOL)byPosition
{
  return self->mByPosition;
}

- (void)setByPosition:(BOOL)a3
{
  self->mByPosition = a3;
}

- (BOOL)relative
{
  return self->mRelative;
}

- (void)setRelative:(BOOL)a3
{
  self->mRelative = a3;
}

- (BOOL)selected
{
  return self->mSelected;
}

- (void)setSelected:(BOOL)a3
{
  self->mSelected = a3;
}

- (unint64_t)fieldId
{
  return self->mFieldId;
}

- (void)setFieldId:(unint64_t)a3
{
  self->mFieldId = a3;
}

- (unint64_t)count
{
  return self->mCount;
}

- (void)setCount:(unint64_t)a3
{
  self->mCount = a3;
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)EDPivotAreaReference;
  id v2 = [(EDPivotAreaReference *)&v4 description];
  return v2;
}

@end