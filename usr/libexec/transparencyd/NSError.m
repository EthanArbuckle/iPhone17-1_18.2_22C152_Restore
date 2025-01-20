@interface NSError
+ (NSError)errorWithDomain:(id)a3 code:(int64_t)a4 description:(id)a5;
+ (NSError)errorWithDomain:(id)a3 code:(int64_t)a4 description:(id)a5 underlying:(id)a6;
+ (NSError)errorWithDomain:(id)a3 code:(int64_t)a4 userInfo:(id)a5 description:(id)a6 underlying:(id)a7;
@end

@implementation NSError

+ (NSError)errorWithDomain:(id)a3 code:(int64_t)a4 description:(id)a5
{
  return +[NSError errorWithDomain:a3 code:a4 description:a5 underlying:0];
}

+ (NSError)errorWithDomain:(id)a3 code:(int64_t)a4 description:(id)a5 underlying:(id)a6
{
  return (NSError *)[a1 errorWithDomain:a3 code:a4 userInfo:0 description:a5 underlying:a6];
}

+ (NSError)errorWithDomain:(id)a3 code:(int64_t)a4 userInfo:(id)a5 description:(id)a6 underlying:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a3;
  if (a5) {
    +[NSMutableDictionary dictionaryWithDictionary:a5];
  }
  else {
  v14 = +[NSMutableDictionary dictionary];
  }
  [v14 setObject:v12 forKeyedSubscript:NSLocalizedDescriptionKey];

  [v14 setObject:v11 forKeyedSubscript:NSUnderlyingErrorKey];
  v15 = +[NSError errorWithDomain:v13 code:a4 userInfo:v14];

  return (NSError *)v15;
}

@end