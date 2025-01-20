@interface FMDNVRAMUtil
+ (id)sharedInstance;
- (id)dataValueForKey:(id)a3;
- (id)stringValueForKey:(id)a3;
- (void)clearPropertyWithKey:(id)a3;
- (void)setDataPropertyWithKey:(id)a3 value:(id)a4;
- (void)setStringPropertyWithKey:(id)a3 value:(id)a4;
@end

@implementation FMDNVRAMUtil

+ (id)sharedInstance
{
  if (qword_10031E830 != -1) {
    dispatch_once(&qword_10031E830, &stru_1002DADE8);
  }
  v2 = (void *)qword_10031E828;

  return v2;
}

- (void)setStringPropertyWithKey:(id)a3 value:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (v6 && v7)
  {
    v9 = [v7 dataUsingEncoding:4];
    [(FMDNVRAMUtil *)self setDataPropertyWithKey:v6 value:v9];
  }
  else
  {
    v10 = sub_100004238();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412546;
      id v12 = v6;
      __int16 v13 = 2112;
      v14 = v8;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "#nvram - Cannot save NULL to NVRAM key %@ value %@", (uint8_t *)&v11, 0x16u);
    }
  }
}

- (id)stringValueForKey:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = [(FMDNVRAMUtil *)self dataValueForKey:v4];
    if (v5)
    {
      id v6 = [objc_alloc((Class)NSString) initWithData:v5 encoding:4];
      id v7 = sub_100004238();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v9 = 138412546;
        id v10 = v6;
        __int16 v11 = 2112;
        id v12 = v4;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#nvram - retrieved string value %@ for key %@", (uint8_t *)&v9, 0x16u);
      }
    }
    else
    {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (void)clearPropertyWithKey:(id)a3
{
  if (a3)
  {
    v3 = (__CFString *)a3;
    id v4 = +[NSData data];
    int v5 = sub_100044504(v3, v4);

    if (v5)
    {
      id v6 = sub_100004238();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        sub_10023D9F4(v5, v6);
      }
    }
  }
}

- (void)setDataPropertyWithKey:(id)a3 value:(id)a4
{
  int v5 = (__CFString *)a3;
  id v6 = a4;
  id v7 = v6;
  if (!v5 || !v6)
  {
    v8 = sub_100004238();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#nvram - Cannot save data since data or key is nil", v9, 2u);
    }
    goto LABEL_8;
  }
  if (sub_100044504(v5, v6))
  {
    v8 = sub_100004238();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10023DA6C((uint64_t)v5, v7, v8);
    }
LABEL_8:
  }
}

- (id)dataValueForKey:(id)a3
{
  CFStringRef v3 = (const __CFString *)a3;
  id v4 = (__CFString *)v3;
  if (v3)
  {
    CFDataRef v13 = 0;
    int v5 = sub_10004462C(v3, &v13);
    if (v5)
    {
      int v6 = v5;
      id v7 = sub_100004238();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_10023DB0C(v6, v7);
      }
      CFDataRef v8 = 0;
    }
    else
    {
      CFDataRef v8 = v13;
      id v7 = sub_100004238();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        if (v8) {
          CFStringRef v10 = @"(not-nil)";
        }
        else {
          CFStringRef v10 = @"(nil)";
        }
        id v11 = [(__CFData *)v8 length];
        *(_DWORD *)buf = 138412802;
        CFStringRef v15 = v10;
        __int16 v16 = 2048;
        id v17 = v11;
        __int16 v18 = 2112;
        v19 = v4;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#nvram - read data value %@ of length %lu for key %@", buf, 0x20u);
      }
    }
  }
  else
  {
    int v9 = sub_100004238();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "#nvram - nil key provided to retrieve data from nvram", buf, 2u);
    }

    CFDataRef v8 = 0;
  }

  return v8;
}

@end