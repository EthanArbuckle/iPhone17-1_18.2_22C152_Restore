@interface SAPhoneCallStarted
+ (id)callStarted;
- (BOOL)requiresResponse;
- (NSURL)phoneLogId;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setPhoneLogId:(id)a3;
@end

@implementation SAPhoneCallStarted

- (id)groupIdentifier
{
  return @"com.apple.ace.phone";
}

- (id)encodedClassName
{
  return @"CallStarted";
}

+ (id)callStarted
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSURL)phoneLogId
{
  return (NSURL *)AceObjectURLForProperty(self, @"phoneLogId");
}

- (void)setPhoneLogId:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end