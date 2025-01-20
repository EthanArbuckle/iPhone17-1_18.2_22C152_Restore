@interface EDTableStyle
+ (id)tableStyle;
- (EDTableStyle)init;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)name;
- (id)tableStyleElements;
- (void)setName:(id)a3;
@end

@implementation EDTableStyle

+ (id)tableStyle
{
  id v2 = objc_alloc_init((Class)objc_opt_class());
  return v2;
}

- (EDTableStyle)init
{
  v6.receiver = self;
  v6.super_class = (Class)EDTableStyle;
  id v2 = [(EDTableStyle *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(EDKeyedCollection);
    mTableStyleElements = v2->mTableStyleElements;
    v2->mTableStyleElements = v3;
  }
  return v2;
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

- (id)tableStyleElements
{
  return self->mTableStyleElements;
}

- (id)name
{
  return self->mName;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init((Class)objc_opt_class());
  if (v4)
  {
    uint64_t v5 = [(NSString *)self->mName copy];
    objc_super v6 = (void *)v4[1];
    v4[1] = v5;

    uint64_t v7 = [(EDKeyedCollection *)self->mTableStyleElements copy];
    v8 = (void *)v4[2];
    v4[2] = v7;

    v9 = v4;
  }

  return v4;
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)EDTableStyle;
  id v2 = [(EDTableStyle *)&v4 description];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mTableStyleElements, 0);
  objc_storeStrong((id *)&self->mName, 0);
}

@end