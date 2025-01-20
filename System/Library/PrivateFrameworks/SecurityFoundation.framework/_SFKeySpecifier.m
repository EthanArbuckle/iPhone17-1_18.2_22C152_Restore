@interface _SFKeySpecifier
+ (BOOL)supportsSecureCoding;
+ (Class)keyClass;
- (_SFKeySpecifier)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation _SFKeySpecifier

- (void).cxx_destruct
{
}

+ (Class)keyClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_SFKeySpecifier)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_SFKeySpecifier;
  return [(_SFKeySpecifier *)&v4 init];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v3 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  return (id)[v3 init];
}

@end