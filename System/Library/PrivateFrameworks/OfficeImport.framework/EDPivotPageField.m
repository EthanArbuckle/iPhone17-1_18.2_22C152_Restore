@interface EDPivotPageField
+ (id)pivotPageField;
- (EDPivotPageField)init;
- (id)cap;
- (id)description;
- (id)name;
- (unint64_t)fieldId;
- (void)setCap:(id)a3;
- (void)setFieldId:(unint64_t)a3;
- (void)setName:(id)a3;
@end

@implementation EDPivotPageField

- (EDPivotPageField)init
{
  v3.receiver = self;
  v3.super_class = (Class)EDPivotPageField;
  result = [(EDPivotPageField *)&v3 init];
  if (result) {
    result->mFieldId = 0;
  }
  return result;
}

+ (id)pivotPageField
{
  id v2 = objc_alloc_init((Class)objc_opt_class());
  return v2;
}

- (unint64_t)fieldId
{
  return self->mFieldId;
}

- (void)setFieldId:(unint64_t)a3
{
  self->mFieldId = a3;
}

- (id)name
{
  return self->mName;
}

- (void)setName:(id)a3
{
  v5 = (NSString *)a3;
  mName = self->mName;
  p_mName = &self->mName;
  if (mName != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_mName, a3);
    v5 = v8;
  }
}

- (id)cap
{
  return self->mCap;
}

- (void)setCap:(id)a3
{
  v5 = (NSString *)a3;
  mCap = self->mCap;
  p_mCap = &self->mCap;
  if (mCap != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_mCap, a3);
    v5 = v8;
  }
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)EDPivotPageField;
  id v2 = [(EDPivotPageField *)&v4 description];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mName, 0);
  objc_storeStrong((id *)&self->mCap, 0);
}

@end