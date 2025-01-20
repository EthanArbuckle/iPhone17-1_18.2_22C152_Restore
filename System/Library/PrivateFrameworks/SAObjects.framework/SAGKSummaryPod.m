@interface SAGKSummaryPod
+ (id)summaryPod;
- (NSString)caption;
- (NSString)text;
- (SAUIImageResource)imageResource;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setCaption:(id)a3;
- (void)setImageResource:(id)a3;
- (void)setText:(id)a3;
@end

@implementation SAGKSummaryPod

- (id)groupIdentifier
{
  return @"com.apple.ace.generalknowledge";
}

- (id)encodedClassName
{
  return @"SummaryPod";
}

+ (id)summaryPod
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)caption
{
  return (NSString *)[(AceObject *)self propertyForKey:@"caption"];
}

- (void)setCaption:(id)a3
{
}

- (SAUIImageResource)imageResource
{
  return (SAUIImageResource *)AceObjectAceObjectForProperty(self, @"imageResource");
}

- (void)setImageResource:(id)a3
{
}

- (NSString)text
{
  return (NSString *)[(AceObject *)self propertyForKey:@"text"];
}

- (void)setText:(id)a3
{
}

@end