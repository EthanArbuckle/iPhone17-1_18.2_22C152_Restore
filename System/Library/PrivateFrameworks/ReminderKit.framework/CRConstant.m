@interface CRConstant
+ (id)constant;
- (BOOL)isEqual:(id)a3;
@end

@implementation CRConstant

+ (id)constant
{
  v2 = objc_alloc_init(CRConstant);

  return v2;
}

- (BOOL)isEqual:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

@end