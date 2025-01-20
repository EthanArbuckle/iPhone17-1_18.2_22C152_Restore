@interface TIKeyboardBehaviors
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (TIKeyboardBehaviors)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)keyBehaviorsForState:(id)a3;
- (unint64_t)hash;
@end

@implementation TIKeyboardBehaviors

- (unint64_t)hash
{
  v2 = objc_opt_class();

  return [v2 hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = objc_opt_class();

  return [(TIKeyboardBehaviors *)self isMemberOfClass:v4];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v3 = (void *)[(id)objc_opt_class() allocWithZone:a3];

  return (id)[v3 init];
}

- (id)keyBehaviorsForState:(id)a3
{
  return 0;
}

- (TIKeyboardBehaviors)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)TIKeyboardBehaviors;
  return [(TIKeyboardBehaviors *)&v4 init];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end