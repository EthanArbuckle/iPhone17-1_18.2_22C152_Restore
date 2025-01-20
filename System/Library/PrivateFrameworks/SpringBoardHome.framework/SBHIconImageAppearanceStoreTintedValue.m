@interface SBHIconImageAppearanceStoreTintedValue
- (BOOL)isEqual:(id)a3;
- (unint64_t)hash;
- (void)initWithValue:(void *)a3 imageAppearance:;
@end

@implementation SBHIconImageAppearanceStoreTintedValue

- (void)initWithValue:(void *)a3 imageAppearance:
{
  id v6 = a2;
  id v7 = a3;
  if (a1)
  {
    v12.receiver = a1;
    v12.super_class = (Class)SBHIconImageAppearanceStoreTintedValue;
    id v8 = objc_msgSendSuper2(&v12, sel_init);
    a1 = v8;
    if (v8)
    {
      objc_storeStrong((id *)v8 + 1, a2);
      uint64_t v9 = [v7 copy];
      v10 = (void *)a1[2];
      a1[2] = v9;
    }
  }

  return a1;
}

- (unint64_t)hash
{
  uint64_t v3 = [self->_value hash];
  return [(SBHIconImageAppearance *)self->_imageAppearance hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SBHIconImageAppearanceStoreTintedValue *)a3;
  if (self == v4)
  {
    char v8 = 1;
  }
  else
  {
    v5 = self;
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      id v7 = v4;
      if (BSEqualObjects()) {
        char v8 = BSEqualObjects();
      }
      else {
        char v8 = 0;
      }
    }
    else
    {
      char v8 = 0;
    }
  }

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageAppearance, 0);
  objc_storeStrong(&self->_value, 0);
}

@end