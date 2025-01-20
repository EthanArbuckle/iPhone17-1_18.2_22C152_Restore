@interface SLShareableContentActionResponse
+ (BOOL)supportsBSXPCSecureCoding;
+ (BOOL)supportsSecureCoding;
+ (id)response;
- (SLShareableContentActionResponse)init;
@end

@implementation SLShareableContentActionResponse

+ (id)response
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (SLShareableContentActionResponse)init
{
  v3.receiver = self;
  v3.super_class = (Class)SLShareableContentActionResponse;
  return [(SLShareableContentActionResponse *)&v3 init];
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end