@interface SAGKAlternateResultsPod
+ (id)alternateResultsPod;
- (NSArray)alternateResults;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAlternateResults:(id)a3;
@end

@implementation SAGKAlternateResultsPod

- (id)groupIdentifier
{
  return @"com.apple.ace.generalknowledge";
}

- (id)encodedClassName
{
  return @"AlternateResultsPod";
}

+ (id)alternateResultsPod
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)alternateResults
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"alternateResults", v3);
}

- (void)setAlternateResults:(id)a3
{
}

@end