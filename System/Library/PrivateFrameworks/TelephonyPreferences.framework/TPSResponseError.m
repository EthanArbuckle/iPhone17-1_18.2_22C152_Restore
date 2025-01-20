@interface TPSResponseError
+ (id)errorWithCode:(int64_t)a3 userInfo:(id)a4;
+ (id)errorWithDomain:(id)a3 code:(int64_t)a4 userInfo:(id)a5;
- (TPSResponseError)initWithCode:(int64_t)a3 userInfo:(id)a4;
- (TPSResponseError)initWithDomain:(id)a3 code:(int64_t)a4 userInfo:(id)a5;
@end

@implementation TPSResponseError

+ (id)errorWithCode:(int64_t)a3 userInfo:(id)a4
{
  id v5 = a4;
  v6 = [[TPSResponseError alloc] initWithCode:a3 userInfo:v5];

  return v6;
}

+ (id)errorWithDomain:(id)a3 code:(int64_t)a4 userInfo:(id)a5
{
  return 0;
}

- (TPSResponseError)initWithCode:(int64_t)a3 userInfo:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)TPSResponseError;
  return [(TPSResponseError *)&v5 initWithDomain:TPSResponseErrorDomain code:a3 userInfo:a4];
}

- (TPSResponseError)initWithDomain:(id)a3 code:(int64_t)a4 userInfo:(id)a5
{
  return 0;
}

@end