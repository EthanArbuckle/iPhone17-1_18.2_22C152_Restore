@interface OADSystemColor
- (BOOL)isEqual:(id)a3;
- (OADSystemColor)initWithSystemColorID:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int)systemColorID;
- (unint64_t)hash;
@end

@implementation OADSystemColor

- (OADSystemColor)initWithSystemColorID:(int)a3
{
  v5.receiver = self;
  v5.super_class = (Class)OADSystemColor;
  result = [(OADSystemColor *)&v5 init];
  if (result) {
    result->mSystemColorID = a3;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithSystemColorID:", self->mSystemColorID);
  v6 = [(OADColor *)self transforms];
  v7 = (void *)[v6 copyWithZone:a3];

  [v5 setTransforms:v7];
  return v5;
}

- (int)systemColorID
{
  return self->mSystemColorID;
}

- (unint64_t)hash
{
  uint64_t mSystemColorID = self->mSystemColorID;
  v4.receiver = self;
  v4.super_class = (Class)OADSystemColor;
  return [(OADColor *)&v4 hash] ^ mSystemColorID;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (unint64_t v5 = -[OADSystemColor hash](self, "hash"), v5 == [v4 hash]))
  {
    v8.receiver = self;
    v8.super_class = (Class)OADSystemColor;
    BOOL v6 = [(OADColor *)&v8 isEqual:v4];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

@end