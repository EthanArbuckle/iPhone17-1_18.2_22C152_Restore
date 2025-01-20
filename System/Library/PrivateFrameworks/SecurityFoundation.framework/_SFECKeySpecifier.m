@interface _SFECKeySpecifier
+ (BOOL)supportsSecureCoding;
+ (Class)keyClass;
- (_SFECKeySpecifier)initWithCoder:(id)a3;
- (_SFECKeySpecifier)initWithCurve:(int64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)curve;
- (void)setCurve:(int64_t)a3;
@end

@implementation _SFECKeySpecifier

+ (Class)keyClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_SFECKeySpecifier)initWithCurve:(int64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)_SFECKeySpecifier;
  v4 = [(_SFECKeySpecifier *)&v8 init];
  if (v4)
  {
    v5 = objc_alloc_init(SFECKeySpecifier_Ivars);
    id ecKeySpecifierInternal = v4->_ecKeySpecifierInternal;
    v4->_id ecKeySpecifierInternal = v5;

    *((void *)v4->_ecKeySpecifierInternal + 1) = a3;
  }
  return v4;
}

- (_SFECKeySpecifier)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_SFECKeySpecifier;
  return [(_SFECKeySpecifier *)&v4 init];
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  uint64_t v5 = *((void *)self->_ecKeySpecifierInternal + 1);
  return (id)[v4 initWithCurve:v5];
}

- (id)description
{
  if (*((void *)self->_ecKeySpecifierInternal + 1) >= 8uLL) {
    v2 = 0;
  }
  else {
    v2 = @"nistp521-compressed";
  }
  v7.receiver = self;
  v7.super_class = (Class)_SFECKeySpecifier;
  v3 = [(_SFECKeySpecifier *)&v7 description];
  objc_super v4 = [NSString stringWithFormat:@" curve: %@", v2];
  uint64_t v5 = [v3 stringByAppendingString:v4];

  return v5;
}

- (int64_t)curve
{
  return *((void *)self->_ecKeySpecifierInternal + 1);
}

- (void)setCurve:(int64_t)a3
{
  *((void *)self->_ecKeySpecifierInternal + 1) = a3;
}

- (void).cxx_destruct
{
}

@end