@interface TSTTableDataConditionalStyleSet
- (BOOL)isEqual:(id)a3;
- (id)description;
- (id)initObjectWithConditionalStyleSet:(id)a3;
- (unint64_t)hash;
- (void)dealloc;
@end

@implementation TSTTableDataConditionalStyleSet

- (id)initObjectWithConditionalStyleSet:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TSTTableDataConditionalStyleSet;
  v4 = [(TSTTableDataConditionalStyleSet *)&v6 init];
  if (v4)
  {
    v4->mConditionalStyleSet = (TSTConditionalStyleSet *)a3;
    v4->super.mRefCount = 1;
  }
  return v4;
}

- (unint64_t)hash
{
  return [(TSTConditionalStyleSet *)self->mConditionalStyleSet hash];
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  mConditionalStyleSet = self->mConditionalStyleSet;
  uint64_t v6 = *((void *)a3 + 2);

  return [(TSTConditionalStyleSet *)mConditionalStyleSet isEqual:v6];
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"refCount: %d   mStyle: %@", self->super.mRefCount, self->mConditionalStyleSet];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TSTTableDataConditionalStyleSet;
  [(TSTTableDataConditionalStyleSet *)&v3 dealloc];
}

@end