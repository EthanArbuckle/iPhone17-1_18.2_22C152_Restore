@interface JSAPersistence
+ (JSACookieStorage)cookieStorage;
+ (JSAFileStorage)fileStorage;
+ (JSAKeychainStorage)keychainStorage;
+ (JSALocalStorage)localStorage;
+ (JSASessionStorage)sessionStorage;
@end

@implementation JSAPersistence

+ (JSACookieStorage)cookieStorage
{
  return +[JSACookieStorage sharedInstance];
}

+ (JSAKeychainStorage)keychainStorage
{
  return +[JSAKeychainStorage sharedInstance];
}

+ (JSALocalStorage)localStorage
{
  return +[JSALocalStorage sharedInstance];
}

+ (JSASessionStorage)sessionStorage
{
  return +[JSASessionStorage sharedInstance];
}

+ (JSAFileStorage)fileStorage
{
  return +[JSAFileStorage sharedInstance];
}

@end