@interface NSError
+ (id)error:(int64_t)a3 description:(id)a4;
+ (id)error:(int64_t)a3 description:(id)a4 underlyingError:(id)a5;
@end

@implementation NSError

+ (id)error:(int64_t)a3 description:(id)a4
{
  if (a4)
  {
    v5 = +[NSDictionary dictionaryWithObject:a4 forKey:NSLocalizedDescriptionKey];
    int64_t v6 = a3;
  }
  else
  {
    v5 = +[NSDictionary dictionaryWithObject:@"Unknown Error (description cannot be nil)" forKey:NSLocalizedDescriptionKey];
    int64_t v6 = 0;
  }
  v7 = +[NSError errorWithDomain:@"PerformanceTraceError" code:v6 userInfo:v5];

  return v7;
}

+ (id)error:(int64_t)a3 description:(id)a4 underlyingError:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  v9 = v8;
  if (v7)
  {
    if (v8)
    {
      v16[0] = NSLocalizedDescriptionKey;
      v16[1] = NSUnderlyingErrorKey;
      v17[0] = v7;
      v17[1] = v8;
      v10 = +[NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:2];
      int64_t v11 = a3;
      goto LABEL_7;
    }
    NSErrorUserInfoKey v12 = NSLocalizedDescriptionKey;
    CFStringRef v13 = @"Unknown Error (underlyingError cannot be nil)";
  }
  else
  {
    NSErrorUserInfoKey v12 = NSLocalizedDescriptionKey;
    CFStringRef v13 = @"Unknown Error (description cannot be nil)";
  }
  v10 = +[NSDictionary dictionaryWithObject:v13 forKey:v12];
  int64_t v11 = 0;
LABEL_7:
  v14 = +[NSError errorWithDomain:@"PerformanceTraceError" code:v11 userInfo:v10];

  return v14;
}

@end