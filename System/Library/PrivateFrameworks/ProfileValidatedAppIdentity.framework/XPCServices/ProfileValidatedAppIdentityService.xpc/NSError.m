@interface NSError
+ (id)pvai_errorWithCode:(int64_t)a3;
+ (id)pvai_errorWithCode:(int64_t)a3 userInfo:(id)a4;
+ (id)pvai_wrappedError:(int64_t)a3 error:(id)a4;
@end

@implementation NSError

+ (id)pvai_errorWithCode:(int64_t)a3
{
  return objc_msgSend(a1, "pvai_errorWithCode:userInfo:", a3, 0);
}

+ (id)pvai_errorWithCode:(int64_t)a3 userInfo:(id)a4
{
  return +[NSError errorWithDomain:@"com.apple.devicecheck.error.pvappidentity" code:a3 userInfo:a4];
}

+ (id)pvai_wrappedError:(int64_t)a3 error:(id)a4
{
  id v5 = a4;
  v6 = v5;
  if (v5)
  {
    v7 = [v5 domain];
    unsigned __int8 v8 = [v7 isEqualToString:@"com.apple.devicecheck.error.pvappidentity"];

    if (v8)
    {
      id v9 = v6;
      goto LABEL_7;
    }
    id v10 = objc_alloc_init((Class)NSMutableDictionary);
    [v10 setObject:v6 forKeyedSubscript:NSUnderlyingErrorKey];
  }
  else
  {
    id v10 = objc_alloc_init((Class)NSMutableDictionary);
  }
  id v9 = +[NSError pvai_errorWithCode:a3 userInfo:v10];

LABEL_7:

  return v9;
}

@end