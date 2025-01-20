@interface FedStatsError
+ (id)errorWithCode:(int64_t)a3 description:(id)a4;
+ (id)errorWithCode:(int64_t)a3 underlyingError:(id)a4 description:(id)a5;
+ (id)errorWithCode:(int64_t)a3 underlyingErrors:(id)a4 description:(id)a5;
@end

@implementation FedStatsError

+ (id)errorWithCode:(int64_t)a3 description:(id)a4
{
  id v5 = a4;
  id v6 = objc_alloc((Class)NSError);
  NSErrorUserInfoKey v10 = NSLocalizedDescriptionKey;
  id v11 = v5;
  v7 = +[NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];

  id v8 = [v6 initWithDomain:@"com.apple.FedStats" code:a3 userInfo:v7];
  return v8;
}

+ (id)errorWithCode:(int64_t)a3 underlyingError:(id)a4 description:(id)a5
{
  if (a4)
  {
    id v7 = a5;
    id v8 = a4;
    id v9 = objc_alloc((Class)NSError);
    v15[0] = NSLocalizedDescriptionKey;
    v15[1] = NSUnderlyingErrorKey;
    v16[0] = v7;
    v16[1] = v8;
    NSErrorUserInfoKey v10 = +[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:2];

    id v11 = [v9 initWithDomain:@"com.apple.FedStats" code:a3 userInfo:v10];
  }
  else
  {
    id v12 = a5;
    id v13 = 0;
    id v11 = +[FedStatsError errorWithCode:a3 description:v12];
  }
  return v11;
}

+ (id)errorWithCode:(int64_t)a3 underlyingErrors:(id)a4 description:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = objc_alloc((Class)NSError);
  v13[0] = NSLocalizedDescriptionKey;
  v13[1] = NSMultipleUnderlyingErrorsKey;
  v14[0] = v7;
  v14[1] = v8;
  NSErrorUserInfoKey v10 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:2];

  id v11 = [v9 initWithDomain:@"com.apple.FedStats" code:a3 userInfo:v10];
  return v11;
}

@end