@interface UIWillPresentNotificationActionResponse
+ (id)responseWithOptions:(unint64_t)a3;
- (UIWillPresentNotificationActionResponse)initWithInfo:(id)a3 error:(id)a4;
- (UIWillPresentNotificationActionResponse)initWithOptions:(unint64_t)a3;
- (id)keyDescriptionForSetting:(unint64_t)a3;
- (unint64_t)options;
@end

@implementation UIWillPresentNotificationActionResponse

+ (id)responseWithOptions:(unint64_t)a3
{
  v3 = (void *)[objc_alloc((Class)a1) initWithOptions:a3];
  return v3;
}

- (UIWillPresentNotificationActionResponse)initWithOptions:(unint64_t)a3
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F4F7A0]);
  v6 = [NSNumber numberWithUnsignedInteger:a3];
  [v5 setObject:v6 forSetting:1];

  v9.receiver = self;
  v9.super_class = (Class)UIWillPresentNotificationActionResponse;
  v7 = [(UIWillPresentNotificationActionResponse *)&v9 initWithInfo:v5 error:0];

  return v7;
}

- (UIWillPresentNotificationActionResponse)initWithInfo:(id)a3 error:(id)a4
{
  return -[UIWillPresentNotificationActionResponse initWithOptions:](self, "initWithOptions:", 0, a4);
}

- (unint64_t)options
{
  v2 = [(UIWillPresentNotificationActionResponse *)self info];
  v3 = [v2 objectForSetting:1];
  unint64_t v4 = [v3 unsignedIntegerValue];

  return v4;
}

- (id)keyDescriptionForSetting:(unint64_t)a3
{
  if (a3 == 1) {
    return @"options";
  }
  else {
    return 0;
  }
}

@end