@interface NSError
+ (id)errorDomainMSDWithCode:(int64_t)a3 message:(id)a4;
+ (id)errorDomainMSDWithCode:(int64_t)a3 message:(id)a4 reason:(id)a5;
+ (id)masterServerErrorRetryAfter:(id)a3;
+ (id)masterServerErrorWithCode:(int64_t)a3 mesage:(id)a4 reason:(id)a5;
- (NSError)initWithDomainMSDCode:(int64_t)a3 message:(id)a4;
- (NSError)initWithDomainMSDCode:(int64_t)a3 message:(id)a4 reason:(id)a5;
@end

@implementation NSError

+ (id)errorDomainMSDWithCode:(int64_t)a3 message:(id)a4
{
  id v5 = a4;
  id v6 = [objc_alloc((Class)NSError) initWithDomainMSDCode:a3 message:v5];

  return v6;
}

+ (id)errorDomainMSDWithCode:(int64_t)a3 message:(id)a4 reason:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = [objc_alloc((Class)NSError) initWithDomainMSDCode:a3 message:v8 reason:v7];

  return v9;
}

+ (id)masterServerErrorWithCode:(int64_t)a3 mesage:(id)a4 reason:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = +[NSMutableDictionary dictionaryWithCapacity:0];
  v10 = v9;
  if (v7) {
    [v9 setObject:v7 forKey:NSLocalizedDescriptionKey];
  }
  if (v8) {
    [v10 setObject:v8 forKey:NSLocalizedFailureReasonErrorKey];
  }
  id v11 = [objc_alloc((Class)NSError) initWithDomain:@"MSDMasterServerErrorDomain" code:a3 userInfo:v10];

  return v11;
}

+ (id)masterServerErrorRetryAfter:(id)a3
{
  id v3 = a3;
  v4 = +[NSMutableDictionary dictionaryWithCapacity:0];
  [v4 setObject:v3 forKey:@"RetryAfter"];

  id v5 = [objc_alloc((Class)NSError) initWithDomain:@"MSDMasterServerErrorDomain" code:202 userInfo:v4];

  return v5;
}

- (NSError)initWithDomainMSDCode:(int64_t)a3 message:(id)a4
{
  id v6 = +[NSDictionary dictionaryWithObject:a4 forKey:NSLocalizedDescriptionKey];
  id v7 = [(NSError *)self initWithDomain:@"MSDDemodErrorDomain" code:a3 userInfo:v6];

  return v7;
}

- (NSError)initWithDomainMSDCode:(int64_t)a3 message:(id)a4 reason:(id)a5
{
  id v7 = +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", a4, NSLocalizedDescriptionKey, a5, NSLocalizedFailureReasonErrorKey, 0);
  id v8 = [(NSError *)self initWithDomain:@"MSDDemodErrorDomain" code:a3 userInfo:v7];

  return v8;
}

@end