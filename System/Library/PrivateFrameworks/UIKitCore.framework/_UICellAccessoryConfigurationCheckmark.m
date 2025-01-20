@interface _UICellAccessoryConfigurationCheckmark
+ (BOOL)supportsSecureCoding;
- (id)_identifier;
- (int64_t)_systemType;
@end

@implementation _UICellAccessoryConfigurationCheckmark

- (int64_t)_systemType
{
  return 1;
}

- (id)_identifier
{
  return @"Checkmark";
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end