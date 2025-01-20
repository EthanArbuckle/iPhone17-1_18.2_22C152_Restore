@interface OADFill
- (BOOL)definedByStyle;
- (BOOL)isEqual:(id)a3;
- (BOOL)isOverridden;
- (BOOL)usesPlaceholderColor;
- (float)alpha;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)setDefinedByStyle:(BOOL)a3;
@end

@implementation OADFill

- (BOOL)isEqual:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_class();
  LOBYTE(v4) = v4 == objc_opt_class();

  return v4;
}

- (float)alpha
{
  return 1.0;
}

- (unint64_t)hash
{
  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return 0;
}

- (BOOL)usesPlaceholderColor
{
  return 0;
}

- (BOOL)isOverridden
{
  return ![(OADFill *)self definedByStyle];
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)OADFill;
  v2 = [(OADProperties *)&v4 description];
  return v2;
}

- (BOOL)definedByStyle
{
  return *((unsigned char *)&self->super + 18) & 1;
}

- (void)setDefinedByStyle:(BOOL)a3
{
  *((unsigned char *)&self->super + 18) = a3;
}

@end