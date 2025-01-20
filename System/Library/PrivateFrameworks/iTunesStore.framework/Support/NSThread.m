@interface NSThread
+ (id)beginManagedContextSession;
+ (id)beginPrivateManagedContextSession;
+ (void)endManagedContextSession;
+ (void)endPrivateManagedContextSession;
@end

@implementation NSThread

+ (id)beginManagedContextSession
{
  v2 = (void *)sub_10004BA8C(0);

  return [v2 beginThreadContextSession];
}

+ (id)beginPrivateManagedContextSession
{
  v2 = (void *)sub_10004BA8C(1);

  return [v2 beginThreadContextSession];
}

+ (void)endManagedContextSession
{
  v2 = (void *)sub_10004BA8C(0);

  [v2 endThreadContextSession];
}

+ (void)endPrivateManagedContextSession
{
  v2 = (void *)sub_10004BA8C(1);

  [v2 endThreadContextSession];
}

@end