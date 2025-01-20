@interface OADPlaceholderColor
- (BOOL)isEqual:(id)a3;
- (id)colorForStyleColor:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
@end

@implementation OADPlaceholderColor

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = [(OADColor *)self transforms];
  v7 = (void *)[v6 copyWithZone:a3];
  [v5 setTransforms:v7];

  return v5;
}

- (id)colorForStyleColor:(id)a3
{
  id v4 = a3;
  v5 = [(OADColor *)self transforms];
  v6 = [v4 transforms];
  if (v5 && [v5 count] && (!v6 || !objc_msgSend(v6, "count")))
  {
    v7 = (void *)[v4 copy];

    id v4 = v7;
    [v7 setTransforms:v5];
  }

  return v4;
}

- (unint64_t)hash
{
  v3.receiver = self;
  v3.super_class = (Class)OADPlaceholderColor;
  return [(OADColor *)&v3 hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v7.receiver = self;
    v7.super_class = (Class)OADPlaceholderColor;
    BOOL v5 = [(OADColor *)&v7 isEqual:v4];
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

@end