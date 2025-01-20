@interface OADSchemeColor
+ (id)schemeColorWithIndex:(int)a3;
- (BOOL)isEqual:(id)a3;
- (OADSchemeColor)initWithSchemeColorIndex:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int)schemeColorIndex;
- (unint64_t)hash;
@end

@implementation OADSchemeColor

- (OADSchemeColor)initWithSchemeColorIndex:(int)a3
{
  v5.receiver = self;
  v5.super_class = (Class)OADSchemeColor;
  result = [(OADSchemeColor *)&v5 init];
  if (result) {
    result->mIndex = a3;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (unint64_t v5 = -[OADSchemeColor hash](self, "hash"), v5 == [v4 hash]))
  {
    v8.receiver = self;
    v8.super_class = (Class)OADSchemeColor;
    BOOL v6 = [(OADColor *)&v8 isEqual:v4];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  uint64_t mIndex = self->mIndex;
  v4.receiver = self;
  v4.super_class = (Class)OADSchemeColor;
  return [(OADColor *)&v4 hash] ^ mIndex;
}

- (int)schemeColorIndex
{
  return self->mIndex;
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithSchemeColorIndex:", self->mIndex);
  BOOL v6 = [(OADColor *)self transforms];
  v7 = (void *)[v6 copyWithZone:a3];

  [v5 setTransforms:v7];
  return v5;
}

+ (id)schemeColorWithIndex:(int)a3
{
  v3 = [[OADSchemeColor alloc] initWithSchemeColorIndex:*(void *)&a3];
  return v3;
}

@end