@interface RAPLayoutCache
+ (id)_layoutURLForType:(int64_t)a3;
+ (id)configForLayoutType:(int64_t)a3;
+ (void)setConfig:(id)a3 forLayoutType:(int64_t)a4;
@end

@implementation RAPLayoutCache

+ (id)_layoutURLForType:(int64_t)a3
{
  v4 = +[RAPFileManager baseLayoutFilePath];
  v5 = v4;
  if ((unint64_t)a3 > 5) {
    CFStringRef v6 = &stru_101324E70;
  }
  else {
    CFStringRef v6 = *(&off_10131CAC8 + a3);
  }
  v7 = [v4 URLByAppendingPathComponent:v6];

  return v7;
}

+ (void)setConfig:(id)a3 forLayoutType:(int64_t)a4
{
  id v6 = a3;
  if ((unint64_t)a4 > 5) {
    CFStringRef v7 = &stru_101324E70;
  }
  else {
    CFStringRef v7 = *(&off_10131CAC8 + a4);
  }
  v8 = sub_100576674();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v19 = 138412546;
    CFStringRef v20 = v7;
    __int16 v21 = 1024;
    unsigned int v22 = [v6 ttl];
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Saving a config of type %@ with TTL %u", (uint8_t *)&v19, 0x12u);
  }

  if (v6)
  {
    v9 = sub_100576674();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = [a1 _layoutURLForType:a4];
      int v19 = 138412290;
      CFStringRef v20 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Will attempt to save config at path %@", (uint8_t *)&v19, 0xCu);
    }
    v11 = [v6 data];
    v12 = +[RAPFileManager baseLayoutFilePath];
    unsigned int v13 = +[RAPFileManager saveData:v11 toDirectory:v12 filename:v7];

    v14 = sub_100576674();
    v15 = v14;
    if (v13)
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        int v19 = 138412290;
        CFStringRef v20 = v7;
        v16 = "Successfully saved layout of type %@";
        v17 = v15;
        os_log_type_t v18 = OS_LOG_TYPE_INFO;
LABEL_14:
        _os_log_impl((void *)&_mh_execute_header, v17, v18, v16, (uint8_t *)&v19, 0xCu);
      }
    }
    else if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      int v19 = 138412290;
      CFStringRef v20 = v7;
      v16 = "Failed to save layout of type %@";
      v17 = v15;
      os_log_type_t v18 = OS_LOG_TYPE_ERROR;
      goto LABEL_14;
    }

    goto LABEL_16;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
  {
    LOWORD(v19) = 0;
    _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Assertion failed: config != ((void *)0)", (uint8_t *)&v19, 2u);
  }
LABEL_16:
}

+ (id)configForLayoutType:(int64_t)a3
{
  v4 = [a1 _layoutURLForType:];
  uint64_t v5 = +[RAPFileManager dataAtFileURL:v4];
  id v6 = (void *)v5;
  if ((unint64_t)a3 <= 5)
  {
    CFStringRef v7 = *(&off_10131CAC8 + a3);
    if (v5) {
      goto LABEL_3;
    }
LABEL_11:
    v8 = sub_100576674();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v22 = 138412290;
      CFStringRef v23 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "We do not have a layout of type %@", (uint8_t *)&v22, 0xCu);
    }
    goto LABEL_23;
  }
  CFStringRef v7 = &stru_101324E70;
  if (!v5) {
    goto LABEL_11;
  }
LABEL_3:
  v8 = [objc_alloc((Class)GEORPFeedbackLayoutFormConfig) initWithData:v5];
  v9 = sub_100576674();
  v10 = v9;
  if (!v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v22 = 138412290;
      CFStringRef v23 = v7;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Trying to create a form config with malformed data of type %@.  We should delete this data", (uint8_t *)&v22, 0xCu);
    }

    +[RAPFileManager removeItemAtFilePath:v4];
    v8 = 0;
    goto LABEL_23;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    int v22 = 138412290;
    CFStringRef v23 = v7;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Found a layout of type %@ from cache", (uint8_t *)&v22, 0xCu);
  }

  v11 = +[NSDate date];
  unsigned int v12 = +[RAPFileManager haveContentsOfFilePathExpired:v4 withSuggestedRetryDate:v11 withTimeToLive:(double)[v8 ttl]];

  if (v12)
  {
    unsigned int v13 = +[RAPFileManager removeItemAtFilePath:v4];
    v14 = sub_100576674();
    v15 = v14;
    if (v13)
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        int v22 = 138412290;
        CFStringRef v23 = v7;
        v16 = "Successfully deleted expired layout of type %@";
        v17 = v15;
        os_log_type_t v18 = OS_LOG_TYPE_INFO;
LABEL_21:
        _os_log_impl((void *)&_mh_execute_header, v17, v18, v16, (uint8_t *)&v22, 0xCu);
      }
    }
    else if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      int v22 = 138412290;
      CFStringRef v23 = v7;
      v16 = "Failed to delete expired layout of type %@";
      v17 = v15;
      os_log_type_t v18 = OS_LOG_TYPE_ERROR;
      goto LABEL_21;
    }

LABEL_23:
    CFStringRef v20 = 0;
    goto LABEL_24;
  }
  int v19 = sub_100576674();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    int v22 = 138412290;
    CFStringRef v23 = v7;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Returning layout of type %@ from cache since it has not expired", (uint8_t *)&v22, 0xCu);
  }

  v8 = v8;
  CFStringRef v20 = v8;
LABEL_24:

  return v20;
}

@end