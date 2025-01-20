@interface SAUIUserUtteranceView
+ (id)userUtteranceView;
- (NSString)text;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setText:(id)a3;
@end

@implementation SAUIUserUtteranceView

- (id)groupIdentifier
{
  return @"com.apple.ace.assistant";
}

- (id)encodedClassName
{
  return @"UserUtteranceView";
}

+ (id)userUtteranceView
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)text
{
  return (NSString *)[(AceObject *)self propertyForKey:@"text"];
}

- (void)setText:(id)a3
{
}

@end