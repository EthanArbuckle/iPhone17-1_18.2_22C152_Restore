@interface EDPivotConditionalFormat
+ (id)pivotConditionalFormat;
- (EDPivotConditionalFormat)init;
- (id)description;
- (id)pivotAreas;
- (int)scope;
- (int)type;
- (unint64_t)priority;
- (void)setPriority:(unint64_t)a3;
- (void)setScope:(int)a3;
- (void)setType:(int)a3;
@end

@implementation EDPivotConditionalFormat

- (EDPivotConditionalFormat)init
{
  v7.receiver = self;
  v7.super_class = (Class)EDPivotConditionalFormat;
  v2 = [(EDPivotConditionalFormat *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->mPriority = 0;
    *(void *)&v2->mType = 0x300000004;
    v4 = objc_alloc_init(EDCollection);
    mPivotAreas = v3->mPivotAreas;
    v3->mPivotAreas = v4;
  }
  return v3;
}

+ (id)pivotConditionalFormat
{
  id v2 = objc_alloc_init((Class)objc_opt_class());
  return v2;
}

- (unint64_t)priority
{
  return self->mPriority;
}

- (void)setPriority:(unint64_t)a3
{
  self->mPriority = a3;
}

- (int)type
{
  return self->mType;
}

- (void)setType:(int)a3
{
  self->mType = a3;
}

- (int)scope
{
  return self->mScope;
}

- (void)setScope:(int)a3
{
  self->mScope = a3;
}

- (id)pivotAreas
{
  return self->mPivotAreas;
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)EDPivotConditionalFormat;
  id v2 = [(EDPivotConditionalFormat *)&v4 description];
  return v2;
}

- (void).cxx_destruct
{
}

@end