@interface SHInsightsError
+ (id)errorWithCode:(int64_t)a3 underlyingError:(id)a4;
+ (id)errorWithCode:(int64_t)a3 underlyingError:(id)a4 keyOverrides:(id)a5;
+ (id)messageForCode:(int64_t)a3;
@end

@implementation SHInsightsError

+ (id)messageForCode:(int64_t)a3
{
  v3 = @"There was a problem fetching the data";
  if (a3 == 200) {
    v3 = @"The requested data was not found, please amend your query";
  }
  if (a3 == 201) {
    return @"The data was found but it was invalid";
  }
  else {
    return v3;
  }
}

+ (id)errorWithCode:(int64_t)a3 underlyingError:(id)a4
{
  return (id)[a1 errorWithCode:a3 underlyingError:a4 keyOverrides:MEMORY[0x263EFFA78]];
}

+ (id)errorWithCode:(int64_t)a3 underlyingError:(id)a4 keyOverrides:(id)a5
{
  v8 = (void *)MEMORY[0x263EFF9A0];
  id v9 = a5;
  id v10 = a4;
  v11 = [v8 dictionary];
  [v11 setValue:v10 forKey:*MEMORY[0x263F08608]];

  v12 = [a1 messageForCode:a3];
  [v11 setValue:v12 forKey:*MEMORY[0x263F07F80]];

  [v11 setValuesForKeysWithDictionary:v9];
  v13 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.ShazamInsights" code:a3 userInfo:v11];

  return v13;
}

@end