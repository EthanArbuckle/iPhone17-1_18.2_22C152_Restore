@interface SDCompanionCommon
+ (id)myIPAddress;
@end

@implementation SDCompanionCommon

+ (id)myIPAddress
{
  v11 = 0;
  int v2 = getifaddrs(&v11);
  v3 = 0;
  v4 = v11;
  if (!v2 && v11)
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
      v4 = v4->ifa_next;
    }
    while (v4);
    v4 = v11;
  }
  freeifaddrs(v4);
  v9 = daemon_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_1000C155C((uint64_t)v3, v9);
  }

  return v3;
}

@end