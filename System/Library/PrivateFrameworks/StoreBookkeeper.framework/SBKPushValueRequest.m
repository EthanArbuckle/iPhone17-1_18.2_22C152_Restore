@interface SBKPushValueRequest
+ (id)propertyListBodyWithTransaction:(id)a3;
+ (id)requestForTransaction:(id)a3;
- (id)canonicalResponseForResponse:(id)a3;
@end

@implementation SBKPushValueRequest

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
  v15[3] = *MEMORY[0x263EF8340];
  id v3 = a3;
  v14[0] = @"domain";
  id v4 = [v3 domain];
  v15[0] = v4;
  v14[1] = @"key";
  v5 = [v3 requestItemPayloadPair];
  v6 = [v5 kvsKey];
  v15[1] = v6;
  v14[2] = @"value";
  v7 = [v3 requestItemPayloadPair];
  v8 = [v7 kvsPayload];
  v15[2] = v8;
  v9 = [NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:3];
  v10 = (void *)[v9 mutableCopy];

  v11 = [v3 requestItemVersionAnchor];

  if (v11)
  {
    v12 = [v3 requestItemVersionAnchor];
    [v10 setObject:v12 forKeyedSubscript:@"base-version"];
  }
  return v10;
}

- (id)canonicalResponseForResponse:(id)a3
{
  id v4 = a3;
  v5 = [(SBKRequest *)self transaction];
  v6 = +[SBKPushValueResponse responseWithResponse:v4 transaction:v5];

  return v6;
}

@end