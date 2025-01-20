@interface SAHAFilter
+ (id)filter;
- (id)encodedClassName;
- (id)groupIdentifier;
@end

@implementation SAHAFilter

- (id)groupIdentifier
{
  return @"com.apple.ace.homeautomation";
}

- (id)encodedClassName
{
  return @"Filter";
}

+ (id)filter
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

@end