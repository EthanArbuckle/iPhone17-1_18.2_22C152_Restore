@interface OADIndexedColor
+ (id)indexedColorWithIndex:(unint64_t)a3;
- (BOOL)isEqual:(id)a3;
- (OADIndexedColor)initWithIndex:(unint64_t)a3;
- (id)colorFromPalette:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (unint64_t)index;
@end

@implementation OADIndexedColor

- (OADIndexedColor)initWithIndex:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)OADIndexedColor;
  result = [(OADIndexedColor *)&v5 init];
  if (result) {
    result->mIndex = a3;
  }
  return result;
}

+ (id)indexedColorWithIndex:(unint64_t)a3
{
  v3 = (void *)[objc_alloc((Class)objc_opt_class()) initWithIndex:a3];
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithIndex:", self->mIndex);
  v6 = [(OADColor *)self transforms];
  v7 = (void *)[v6 copyWithZone:a3];

  [v5 setTransforms:v7];
  return v5;
}

- (unint64_t)index
{
  return self->mIndex;
}

- (id)colorFromPalette:(id)a3
{
  v3 = [a3 colorWithIndex:self->mIndex];
  return v3;
}

- (unint64_t)hash
{
  unint64_t mIndex = self->mIndex;
  v4.receiver = self;
  v4.super_class = (Class)OADIndexedColor;
  return [(OADColor *)&v4 hash] ^ mIndex;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (unint64_t v5 = -[OADIndexedColor hash](self, "hash"), v5 == [v4 hash]))
  {
    v8.receiver = self;
    v8.super_class = (Class)OADIndexedColor;
    BOOL v6 = [(OADColor *)&v8 isEqual:v4];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

@end