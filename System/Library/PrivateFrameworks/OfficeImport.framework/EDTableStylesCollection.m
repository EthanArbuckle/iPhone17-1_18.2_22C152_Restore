@interface EDTableStylesCollection
- (id)defaultPivotStyle;
- (id)defaultPivotStyleName;
- (id)defaultTableStyle;
- (id)defaultTableStyleName;
- (id)objectWithName:(id)a3;
- (void)setDefaultPivotStyleName:(id)a3;
- (void)setDefaultTableStyleName:(id)a3;
@end

@implementation EDTableStylesCollection

- (void)setDefaultTableStyleName:(id)a3
{
  v5 = (NSString *)a3;
  if (self->mDefaultTableStyleName != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->mDefaultTableStyleName, a3);
    v5 = v6;
  }
}

- (void)setDefaultPivotStyleName:(id)a3
{
  v5 = (NSString *)a3;
  if (self->mDefaultPivotStyleName != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->mDefaultPivotStyleName, a3);
    v5 = v6;
  }
}

- (id)objectWithName:(id)a3
{
  id v4 = a3;
  if (v4 && (unint64_t v5 = [(EDCollection *)self count]) != 0)
  {
    uint64_t v6 = 0;
    while (1)
    {
      v7 = [(EDCollection *)self objectAtIndex:v6];
      v8 = [v7 name];
      v9 = v8;
      if (v8)
      {
        if ([v8 isEqualToString:v4]) {
          break;
        }
      }

      if (v5 == ++v6) {
        goto LABEL_7;
      }
    }
  }
  else
  {
LABEL_7:
    v7 = 0;
  }

  return v7;
}

- (id)defaultTableStyle
{
  return [(EDTableStylesCollection *)self objectWithName:self->mDefaultTableStyleName];
}

- (id)defaultPivotStyle
{
  return [(EDTableStylesCollection *)self objectWithName:self->mDefaultPivotStyleName];
}

- (id)defaultTableStyleName
{
  return self->mDefaultTableStyleName;
}

- (id)defaultPivotStyleName
{
  return self->mDefaultPivotStyleName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mDefaultPivotStyleName, 0);
  objc_storeStrong((id *)&self->mDefaultTableStyleName, 0);
}

@end