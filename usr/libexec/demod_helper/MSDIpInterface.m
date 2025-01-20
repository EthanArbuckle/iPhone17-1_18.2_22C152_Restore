@interface MSDIpInterface
+ (id)getIpv4Interfaces;
@end

@implementation MSDIpInterface

+ (id)getIpv4Interfaces
{
  v23 = 0;
  v2 = objc_opt_new();
  if (getifaddrs(&v23))
  {
    v20 = sub_100027250();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_100033254();
    }
    goto LABEL_26;
  }
  v3 = v23;
  if (!v23) {
    goto LABEL_20;
  }
  do
  {
    v4 = sub_100027250();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      int sa_family = v3->ifa_addr->sa_family;
      *(_DWORD *)buf = 136315394;
      v27 = "+[MSDIpInterface getIpv4Interfaces]";
      __int16 v28 = 1024;
      LODWORD(v29) = sa_family;
      _os_log_debug_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "%s - Address family:  %d", buf, 0x12u);
    }

    ifa_addr = v3->ifa_addr;
    if (ifa_addr->sa_family == 2)
    {
      v6 = inet_ntop(2, &ifa_addr->sa_data[2], v30, 0x10u);
      if (v6)
      {
        v7 = +[NSString stringWithUTF8String:v6];
        v8 = sub_100027250();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315394;
          v27 = "+[MSDIpInterface getIpv4Interfaces]";
          __int16 v28 = 2114;
          v29 = v7;
          _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "%s - Address:  %{public}@", buf, 0x16u);
        }

        if ([v7 isEqualToString:@"127.0.0.1"]) {
          goto LABEL_16;
        }
        v9 = inet_ntop(2, &v3->ifa_netmask->sa_data[2], v30, 0x10u);
        if (v9)
        {
          v10 = +[NSString stringWithUTF8String:v9];
          v11 = inet_ntop(2, &v3->ifa_dstaddr->sa_data[2], v30, 0x10u);
          if (v11)
          {
            v12 = +[NSString stringWithUTF8String:v11];
            uint64_t v13 = +[NSString stringWithUTF8String:v3->ifa_name];
            v14 = (void *)v13;
            if (v13)
            {
              v24[0] = @"name";
              v24[1] = @"address";
              v25[0] = v13;
              v25[1] = v7;
              v24[2] = @"netMask";
              v24[3] = @"broadcastAddr";
              v25[2] = v10;
              v25[3] = v12;
              v15 = +[NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:4];
              v16 = sub_100027250();
              if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 136315394;
                v27 = "+[MSDIpInterface getIpv4Interfaces]";
                __int16 v28 = 2114;
                v29 = v15;
                _os_log_debug_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "%s - interface:  %{public}@", buf, 0x16u);
              }

              [v2 addObject:v15];
LABEL_16:

              goto LABEL_17;
            }
            v22 = sub_100027250();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
              sub_100033214(buf, &buf[1], v22);
            }
          }
          else
          {
            v21 = sub_100027250();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
              sub_100033194();
            }
          }
        }
        else
        {
          v10 = sub_100027250();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
            sub_100033114();
          }
        }

        goto LABEL_36;
      }
      v20 = sub_100027250();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        sub_100033094();
      }
LABEL_26:

LABEL_36:
      if (v23) {
        freeifaddrs(v23);
      }
      id v18 = 0;
      goto LABEL_21;
    }
LABEL_17:
    v3 = v3->ifa_next;
  }
  while (v3);
  if (v23) {
    freeifaddrs(v23);
  }
LABEL_20:
  id v18 = v2;
LABEL_21:

  return v18;
}

@end