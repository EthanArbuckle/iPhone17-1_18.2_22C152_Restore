@interface SAGKPodView
+ (id)podView;
- (NSString)title;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setTitle:(id)a3;
@end

@implementation SAGKPodView

- (id)groupIdentifier
{
  return @"com.apple.ace.generalknowledge";
}

- (id)encodedClassName
{
  return @"PodView";
}

+ (id)podView
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)title
{
  return (NSString *)[(AceObject *)self propertyForKey:@"title"];
}

- (void)setTitle:(id)a3
{
}

@end