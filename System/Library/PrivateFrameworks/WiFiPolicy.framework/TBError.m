@interface TBError
+ (id)fetchMissingParametersErrorWithUserInfo:(id)a3;
+ (id)fetchUnsupportedErrorWithUserInfo:(id)a3;
+ (id)responseErrorWithUserInfo:(id)a3;
- (TBError)initWithType:(int64_t)a3 userInfo:(id)a4;
@end

@implementation TBError

- (TBError)initWithType:(int64_t)a3 userInfo:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)TBError;
  return [(TBError *)&v5 initWithDomain:@"com.apple.wifi.threebars" code:a3 userInfo:a4];
}

+ (id)responseErrorWithUserInfo:(id)a3
{
  id v4 = a3;
  objc_super v5 = (void *)[objc_alloc((Class)a1) initWithType:200 userInfo:v4];

  return v5;
}

+ (id)fetchUnsupportedErrorWithUserInfo:(id)a3
{
  id v4 = a3;
  objc_super v5 = (void *)[objc_alloc((Class)a1) initWithType:100 userInfo:v4];

  return v5;
}

+ (id)fetchMissingParametersErrorWithUserInfo:(id)a3
{
  id v4 = a3;
  objc_super v5 = (void *)[objc_alloc((Class)a1) initWithType:101 userInfo:v4];

  return v5;
}

@end