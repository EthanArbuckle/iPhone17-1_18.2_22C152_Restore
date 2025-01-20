@interface _UIEmptyEffect
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (id)_allEffects;
- (unint64_t)hash;
@end

@implementation _UIEmptyEffect

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)hash
{
  v2 = objc_opt_class();
  return [v2 hash];
}

- (BOOL)isEqual:(id)a3
{
  id v3 = a3;
  char v4 = [v3 isMemberOfClass:objc_opt_class()];

  return v4;
}

- (id)_allEffects
{
  return (id)MEMORY[0x1E4F1CBF0];
}

@end