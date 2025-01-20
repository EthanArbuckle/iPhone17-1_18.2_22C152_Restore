@interface _UICellAccessoryConfigurationDisclosureIndicator
+ (BOOL)supportsSecureCoding;
- (_UICellAccessoryConfigurationDisclosureIndicator)init;
- (id)_identifier;
- (int64_t)_systemType;
@end

@implementation _UICellAccessoryConfigurationDisclosureIndicator

- (_UICellAccessoryConfigurationDisclosureIndicator)init
{
  v5.receiver = self;
  v5.super_class = (Class)_UICellAccessoryConfigurationDisclosureIndicator;
  v2 = [(_UICellAccessoryConfiguration *)&v5 init];
  v3 = v2;
  if (v2) {
    [(_UICellAccessoryConfiguration *)v2 setUsesDefaultLayoutWidth:0];
  }
  return v3;
}

- (int64_t)_systemType
{
  return 0;
}

- (id)_identifier
{
  return @"DisclosureIndicator";
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end