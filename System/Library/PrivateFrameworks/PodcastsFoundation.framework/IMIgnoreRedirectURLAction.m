@interface IMIgnoreRedirectURLAction
+ (id)ignoreRedirectAction;
- (id)redirectURL;
- (int64_t)actionType;
@end

@implementation IMIgnoreRedirectURLAction

+ (id)ignoreRedirectAction
{
  v2 = objc_alloc_init(IMIgnoreRedirectURLAction);
  return v2;
}

- (int64_t)actionType
{
  return 0;
}

- (id)redirectURL
{
  return 0;
}

@end