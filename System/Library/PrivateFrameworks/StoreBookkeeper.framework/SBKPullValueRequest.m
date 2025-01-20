@interface SBKPullValueRequest
+ (id)propertyListBodyWithTransaction:(id)a3;
+ (id)requestForTransaction:(id)a3;
- (id)canonicalResponseForResponse:(id)a3;
@end

@implementation SBKPullValueRequest

+ (id)requestForTransaction:(id)a3
{
  id v4 = a3;
  v5 = [v4 requestURL];
  v6 = [a1 requestWithRequestURL:v5];

  [v6 setMethod:1];
  v7 = [a1 propertyListBodyWithTransaction:v4];
  [v6 setBodyDataWithPropertyList:v7];

  [v6 setTransaction:v4];
  [v6 setIncludeDeviceGUID:1];
  return v6;
}

+ (id)propertyListBodyWithTransaction:(id)a3
{
  v13[3] = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = [v3 clientItemVersionAnchor];
  v5 = (void *)v4;
  v6 = @"0";
  if (v4) {
    v6 = (__CFString *)v4;
  }
  v7 = v6;

  v12[0] = @"domain";
  v8 = [v3 domain];
  v13[0] = v8;
  v13[1] = v7;
  v12[1] = @"since-version";
  v12[2] = @"key";
  v9 = [v3 requestedKey];

  v13[2] = v9;
  v10 = [NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:3];

  return v10;
}

- (id)canonicalResponseForResponse:(id)a3
{
  id v4 = a3;
  v5 = [(SBKRequest *)self transaction];
  v6 = +[SBKPullValueResponse responseWithResponse:v4 transaction:v5];

  return v6;
}

@end