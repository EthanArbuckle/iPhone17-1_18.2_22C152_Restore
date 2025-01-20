@interface DebugUtil
+ (BOOL)is17Net;
+ (BOOL)isDebugEnabled;
+ (BOOL)isInternalInstall;
+ (id)allViewControllers;
+ (id)applicationDocumentsDirectory;
+ (id)getIPAddress;
+ (id)sharedApplicationIfPossible;
@end

@implementation DebugUtil

+ (BOOL)isDebugEnabled
{
  if ([a1 isInternalInstall]) {
    return 1;
  }

  return [a1 is17Net];
}

+ (BOOL)isInternalInstall
{
  if (isInternalInstall_onceToken != -1) {
    dispatch_once(&isInternalInstall_onceToken, &__block_literal_global);
  }
  return isInternalInstall_isInternalInstall;
}

void __30__DebugUtil_isInternalInstall__block_invoke(id a1)
{
  id v1 = +[NSFileManager defaultManager];
  isInternalInstall_isInternalInstall = [v1 fileExistsAtPath:@"/AppleInternal"];
}

+ (BOOL)is17Net
{
  v2 = [a1 getIPAddress];
  if ([v2 hasPrefix:@"17."])
  {
    v3 = [v2 componentsSeparatedByString:@"."];
    BOOL v4 = [v3 count] == &dword_4;
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

+ (id)getIPAddress
{
  v10 = 0;
  int v2 = getifaddrs(&v10);
  v3 = 0;
  BOOL v4 = v10;
  if (!v2 && v10)
  {
    v3 = 0;
    do
    {
      if (v4->ifa_addr->sa_family == 2)
      {
        v5 = +[NSString stringWithUTF8String:v4->ifa_name];
        unsigned int v6 = [v5 isEqualToString:@"en0"];

        if (v6)
        {
          v7.s_addr = *(_DWORD *)&v4->ifa_addr->sa_data[2];
          uint64_t v8 = +[NSString stringWithUTF8String:inet_ntoa(v7)];

          v3 = (void *)v8;
        }
      }
      BOOL v4 = v4->ifa_next;
    }
    while (v4);
    BOOL v4 = v10;
  }
  freeifaddrs(v4);

  return v3;
}

+ (id)applicationDocumentsDirectory
{
  int v2 = +[NSFileManager defaultManager];
  v3 = [v2 URLsForDirectory:9 inDomains:1];
  BOOL v4 = [v3 lastObject];

  return v4;
}

+ (id)allViewControllers
{
  int v2 = [a1 sharedApplicationIfPossible];
  if (v2)
  {
    id v3 = objc_alloc_init((Class)NSMutableArray);
    BOOL v4 = [v2 delegate];
    v5 = [v4 window];

    uint64_t v6 = [v5 rootViewController];
    if (v6)
    {
      in_addr v7 = (void *)v6;
      do
      {
        [v3 addObject:v7];
        uint64_t v8 = [v7 presentedViewController];

        in_addr v7 = (void *)v8;
      }
      while (v8);
    }
  }
  else
  {
    id v3 = &__NSArray0__struct;
  }

  return v3;
}

+ (id)sharedApplicationIfPossible
{
  int v2 = [NSClassFromString(@"UIApplication") sharedApplication];
  id v3 = v2;
  if (v2) {
    id v4 = v2;
  }

  return v3;
}

@end