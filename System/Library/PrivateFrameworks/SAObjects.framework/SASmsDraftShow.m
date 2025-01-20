@interface SASmsDraftShow
+ (id)draftShow;
- (BOOL)requiresResponse;
- (NSURL)smsIdentifier;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setSmsIdentifier:(id)a3;
@end

@implementation SASmsDraftShow

- (id)groupIdentifier
{
  return @"com.apple.ace.sms";
}

- (id)encodedClassName
{
  return @"DraftShow";
}

+ (id)draftShow
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSURL)smsIdentifier
{
  return (NSURL *)AceObjectURLForProperty(self, @"smsIdentifier");
}

- (void)setSmsIdentifier:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end