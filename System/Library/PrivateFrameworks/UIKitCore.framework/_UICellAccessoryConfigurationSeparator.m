@interface _UICellAccessoryConfigurationSeparator
+ (BOOL)supportsSecureCoding;
- (_UICellAccessoryConfigurationSeparator)init;
- (id)_identifier;
- (int64_t)_systemType;
@end

@implementation _UICellAccessoryConfigurationSeparator

- (_UICellAccessoryConfigurationSeparator)init
{
  v5.receiver = self;
  v5.super_class = (Class)_UICellAccessoryConfigurationSeparator;
  v2 = [(_UICellAccessoryConfiguration *)&v5 init];
  v3 = v2;
  if (v2) {
    [(_UICellAccessoryConfiguration *)v2 setUsesDefaultLayoutWidth:0];
  }
  return v3;
}

- (int64_t)_systemType
{
  return 8;
}

- (id)_identifier
{
  return @"Separator";
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end