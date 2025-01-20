@interface SAUIUpdateViews
+ (id)updateViews;
- (BOOL)requiresResponse;
- (NSArray)views;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setViews:(id)a3;
@end

@implementation SAUIUpdateViews

- (id)groupIdentifier
{
  return @"com.apple.ace.assistant";
}

- (id)encodedClassName
{
  return @"UpdateViews";
}

+ (id)updateViews
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)views
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"views", v3);
}

- (void)setViews:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end