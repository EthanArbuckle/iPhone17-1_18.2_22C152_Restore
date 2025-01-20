@interface SABaseCommand
+ (id)baseCommand;
- (id)encodedClassName;
- (id)groupIdentifier;
@end

@implementation SABaseCommand

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"BaseCommand";
}

+ (id)baseCommand
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

@end