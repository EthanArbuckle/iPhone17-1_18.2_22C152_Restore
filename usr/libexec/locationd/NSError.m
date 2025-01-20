@interface NSError
+ (id)_cl_DurianErrorWithCode:(int64_t)a3;
+ (id)_cl_DurianFeatureNotSupportedError;
@end

@implementation NSError

+ (id)_cl_DurianErrorWithCode:(int64_t)a3
{
  NSErrorUserInfoKey v6 = NSLocalizedDescriptionKey;
  CFStringRef v7 = sub_101640864(a3);
  v4 = +[NSDictionary dictionaryWithObjects:&v7 forKeys:&v6 count:1];
  return +[NSError errorWithDomain:kCLErrorDomainPrivate code:a3 userInfo:v4];
}

+ (id)_cl_DurianFeatureNotSupportedError
{
  return [a1 _cl_DurianErrorWithCode:38];
}

@end