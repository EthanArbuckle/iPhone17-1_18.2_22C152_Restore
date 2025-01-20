@interface _UIImageSymbolVariant
+ (BOOL)supportsSecureCoding;
+ (_UIImageSymbolVariant)variantWithFillVariant:(int64_t)a3;
+ (id)filledVariant;
+ (id)unfilledVariant;
- (BOOL)isEqual:(id)a3;
- (BOOL)isUnspecified;
- (_UIImageSymbolVariant)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)fillVariant;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setFillVariant:(int64_t)a3;
@end

@implementation _UIImageSymbolVariant

- (BOOL)isUnspecified
{
  return [(_UIImageSymbolVariant *)self fillVariant] == 0;
}

- (int64_t)fillVariant
{
  return self->_fillVariant;
}

+ (_UIImageSymbolVariant)variantWithFillVariant:(int64_t)a3
{
  v4 = objc_opt_new();
  v4[1] = a3;
  return (_UIImageSymbolVariant *)v4;
}

+ (id)filledVariant
{
  return (id)[a1 variantWithFillVariant:1];
}

+ (id)unfilledVariant
{
  return (id)[a1 variantWithFillVariant:2];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (_UIImageSymbolVariant *)a3;
  if (v4 == self)
  {
    BOOL v7 = 1;
  }
  else
  {
    v5 = self;
    char isKindOfClass = objc_opt_isKindOfClass();

    BOOL v7 = (isKindOfClass & 1) != 0 && self->_fillVariant == v4->_fillVariant;
  }

  return v7;
}

- (unint64_t)hash
{
  return self->_fillVariant;
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_opt_class();
  id result = (id)objc_opt_new();
  *((void *)result + 1) = self->_fillVariant;
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (_UIImageSymbolVariant)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)_UIImageSymbolVariant;
  v5 = [(_UIImageSymbolVariant *)&v7 init];
  if (v5) {
    v5->_fillVariant = [v4 decodeIntegerForKey:@"fillVariant"];
  }

  return v5;
}

- (void)setFillVariant:(int64_t)a3
{
  self->_fillVariant = a3;
}

@end