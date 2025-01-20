@interface SAMPSetOutputSource
+ (id)setOutputSource;
- (BOOL)requiresResponse;
- (NSURL)outputSourceId;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setOutputSourceId:(id)a3;
@end

@implementation SAMPSetOutputSource

- (id)groupIdentifier
{
  return @"com.apple.ace.media";
}

- (id)encodedClassName
{
  return @"SetOutputSource";
}

+ (id)setOutputSource
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSURL)outputSourceId
{
  return (NSURL *)AceObjectURLForProperty(self, @"outputSourceId");
}

- (void)setOutputSourceId:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end