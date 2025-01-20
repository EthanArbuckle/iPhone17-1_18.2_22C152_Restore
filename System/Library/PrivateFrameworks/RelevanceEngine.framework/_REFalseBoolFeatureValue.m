@interface _REFalseBoolFeatureValue
- (BOOL)BOOLValue;
- (BOOL)isEqual:(id)a3;
- (unint64_t)hash;
@end

@implementation _REFalseBoolFeatureValue

- (BOOL)BOOLValue
{
  return 0;
}

- (unint64_t)hash
{
  return 842849807;
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3)
  {
    char isKindOfClass = 1;
  }
  else
  {
    id v3 = a3;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  return isKindOfClass & 1;
}

@end