@interface _UICellAccessoryConfigurationReorder
+ (BOOL)supportsSecureCoding;
- (id)_identifier;
- (int64_t)_systemType;
@end

@implementation _UICellAccessoryConfigurationReorder

- (int64_t)_systemType
{
  return 4;
}

- (id)_identifier
{
  return @"Reorder";
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end