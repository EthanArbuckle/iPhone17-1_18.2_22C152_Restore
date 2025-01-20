@interface UIWatchKitExtensionRequestActionResponse
+ (id)responseWithWatchKitExtensionResult:(id)a3;
- (NSDictionary)result;
- (UIWatchKitExtensionRequestActionResponse)initWithWatchKitExtensionResult:(id)a3;
- (id)keyDescriptionForSetting:(unint64_t)a3;
@end

@implementation UIWatchKitExtensionRequestActionResponse

+ (id)responseWithWatchKitExtensionResult:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithWatchKitExtensionResult:v4];

  return v5;
}

- (UIWatchKitExtensionRequestActionResponse)initWithWatchKitExtensionResult:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4F4F7A0];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  [v6 setObject:v5 forSetting:1];

  v9.receiver = self;
  v9.super_class = (Class)UIWatchKitExtensionRequestActionResponse;
  v7 = [(UIWatchKitExtensionRequestActionResponse *)&v9 initWithInfo:v6 error:0];

  return v7;
}

- (NSDictionary)result
{
  v2 = [(UIWatchKitExtensionRequestActionResponse *)self info];
  v3 = [v2 objectForSetting:1];

  return (NSDictionary *)v3;
}

- (id)keyDescriptionForSetting:(unint64_t)a3
{
  if (a3 == 1) {
    return @"watchkitRequestResult";
  }
  else {
    return 0;
  }
}

@end