@interface PRUISModalEntryPointAmbientEditingSwitcher
+ (BOOL)supportsBSXPCSecureCoding;
- (BOOL)isEqual:(id)a3;
- (id)_BSXPCSecureCodingEntryPointTypeString;
@end

@implementation PRUISModalEntryPointAmbientEditingSwitcher

- (BOOL)isEqual:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (id)_BSXPCSecureCodingEntryPointTypeString
{
  return @"AmbientEditingSwitcher";
}

@end