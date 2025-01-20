@interface NRDiffBase
+ (BOOL)supportsSecureCoding;
+ (id)enclosedClassTypes;
- (BOOL)isEqual:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation NRDiffBase

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (self) {
    BOOL v6 = v4 == 0;
  }
  else {
    BOOL v6 = 0;
  }
  BOOL v7 = !v6;
  return (isKindOfClass & 1) != 0 && v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v3 = (void *)[(id)objc_opt_class() allocWithZone:a3];

  return (id)[v3 init];
}

+ (id)enclosedClassTypes
{
  return (id)[MEMORY[0x1E4F1CAD0] set];
}

@end