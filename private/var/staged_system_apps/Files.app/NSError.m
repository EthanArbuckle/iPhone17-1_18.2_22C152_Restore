@interface NSError
+ (id)observerErrorWithUnderlyingErrors:(id)a3;
@end

@implementation NSError

+ (id)observerErrorWithUnderlyingErrors:(id)a3
{
  NSErrorUserInfoKey v8 = NSMultipleUnderlyingErrorsKey;
  id v9 = a3;
  id v3 = a3;
  v4 = +[NSDictionary dictionaryWithObjects:&v9 forKeys:&v8 count:1];
  id v5 = objc_alloc((Class)NSError);

  id v6 = [v5 initWithDomain:@"com.apple.DocumentManager.SourceObserver" code:1 userInfo:v4];

  return v6;
}

@end