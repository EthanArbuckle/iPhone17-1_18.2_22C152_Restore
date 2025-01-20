@interface CSHealthWrapErrorHelper
+ (void)assignError:(id *)a3 code:(int)a4 format:(id)a5;
+ (void)assignError:(id *)a3 code:(int64_t)a4 description:(id)a5;
@end

@implementation CSHealthWrapErrorHelper

+ (void)assignError:(id *)a3 code:(int64_t)a4 description:(id)a5
{
  if (a3)
  {
    NSErrorUserInfoKey v10 = NSLocalizedDescriptionKey;
    id v11 = a5;
    id v7 = a5;
    v8 = +[NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];
    v9 = +[NSError errorWithDomain:@"com.apple.coresafety.healthwrap" code:a4 userInfo:v8];

    *a3 = v9;
  }
}

+ (void)assignError:(id *)a3 code:(int)a4 format:(id)a5
{
  id v8 = a5;
  id v9 = [objc_alloc((Class)NSString) initWithFormat:v8 arguments:&v10];

  [a1 assignError:a3 code:a4 description:v9];
}

@end