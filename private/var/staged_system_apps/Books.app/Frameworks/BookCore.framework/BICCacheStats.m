@interface BICCacheStats
+ (id)operationToLogString:(id)a3;
+ (void)addToCounter:(id)a3 amount:(unint64_t)a4;
+ (void)incrementCounter:(id)a3;
+ (void)logCounter:(id)a3 amount:(unint64_t)a4;
+ (void)logDescribedImage:(id)a3 withComment:(id)a4;
+ (void)logOperation:(id)a3 forRequest:(id)a4;
+ (void)prepare;
@end

@implementation BICCacheStats

+ (void)prepare
{
  if (qword_345C38 != -1) {
    dispatch_once(&qword_345C38, &stru_2C8658);
  }
}

+ (void)logOperation:(id)a3 forRequest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = mach_absolute_time();
  if (qword_345C48)
  {
    uint64_t v9 = v8;
    uint64_t v11 = dword_345C40;
    unint64_t v10 = *(unsigned int *)algn_345C44;
    v12 = BCImageCacheLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      unint64_t v13 = v9 * v11 / v10 / 0x186A0;
      v14 = [v7 identifier];
      *(_DWORD *)buf = 138413058;
      v22 = v14;
      __int16 v23 = 2112;
      id v24 = v6;
      __int16 v25 = 2048;
      unint64_t v26 = v13;
      __int16 v27 = 2048;
      id v28 = [v7 generation];
      _os_log_impl(&def_7D91C, v12, OS_LOG_TYPE_INFO, "BICCacheStats: Request$%@,%@,%llu,%lu", buf, 0x2Au);
    }
  }
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_BD3FC;
  v17[3] = &unk_2C4CB8;
  id v19 = v6;
  id v20 = a1;
  id v18 = v7;
  id v15 = v6;
  id v16 = v7;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_345C50);
  sub_BD3FC((uint64_t)v17);
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_345C50);
}

+ (void)logDescribedImage:(id)a3 withComment:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (qword_345C48)
  {
    id v7 = [v5 identifier];
    if (![v7 isEqualToString:qword_345C48])
    {
      if (!v7 || !qword_345C48) {
        goto LABEL_16;
      }
      unint64_t v10 = BCImageCacheLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v22 = v7;
        _os_log_impl(&def_7D91C, v10, OS_LOG_TYPE_INFO, "BICCacheStats: Skip %@", buf, 0xCu);
      }
      goto LABEL_15;
    }
    uint64_t v8 = [v5 image];
    id v9 = [v8 CGImage];

    if (!v9)
    {
LABEL_16:

      goto LABEL_17;
    }
    unint64_t v10 = +[NSString stringWithFormat:@"ID_%@-Timestamp_%llu-%@.png", v7, mach_absolute_time() * dword_345C40 / *(unsigned int *)algn_345C44 / 0xF4240, v6];
    id v11 = objc_alloc_init((Class)CIContext);
    id v12 = [objc_alloc((Class)CIImage) initWithCGImage:v9];
    unint64_t v13 = NSTemporaryDirectory();
    v14 = [v13 stringByAppendingPathComponent:v10];
    id v15 = +[NSURL fileURLWithPath:v14];

    id v20 = 0;
    [v11 writePNGRepresentationOfImage:v12 toURL:v15 format:kCIFormatRGBA8 colorSpace:[v12 colorSpace] options:&__NSDictionary0__struct error:&v20];
    id v16 = v20;
    v17 = BCImageCacheLog();
    id v18 = v17;
    if (v16)
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        id v19 = [v15 absoluteString];
        *(_DWORD *)buf = 138412802;
        v22 = v19;
        __int16 v23 = 2112;
        id v24 = v6;
        __int16 v25 = 2112;
        id v26 = v16;
        _os_log_error_impl(&def_7D91C, v18, OS_LOG_TYPE_ERROR, "BICCacheStats: Failed to %@ for %@, %@", buf, 0x20u);
LABEL_13:
      }
    }
    else if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      id v19 = [v15 absoluteString];
      *(_DWORD *)buf = 138412546;
      v22 = v19;
      __int16 v23 = 2112;
      id v24 = v6;
      _os_log_impl(&def_7D91C, v18, OS_LOG_TYPE_INFO, "BICCacheStats: %@ for %@", buf, 0x16u);
      goto LABEL_13;
    }

LABEL_15:
    goto LABEL_16;
  }
LABEL_17:
}

+ (void)incrementCounter:(id)a3
{
  id v3 = a3;
  if (qword_345C48)
  {
    v4 = BCImageCacheLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v5 = 138412290;
      id v6 = v3;
      _os_log_impl(&def_7D91C, v4, OS_LOG_TYPE_INFO, "BICCacheStats: Counter$%@,1", (uint8_t *)&v5, 0xCu);
    }
  }
}

+ (void)addToCounter:(id)a3 amount:(unint64_t)a4
{
  id v5 = a3;
  if (qword_345C48)
  {
    id v6 = BCImageCacheLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v7 = 138412546;
      id v8 = v5;
      __int16 v9 = 2048;
      unint64_t v10 = a4;
      _os_log_impl(&def_7D91C, v6, OS_LOG_TYPE_INFO, "BICCacheStats: Counter$%@,%llu", (uint8_t *)&v7, 0x16u);
    }
  }
}

+ (void)logCounter:(id)a3 amount:(unint64_t)a4
{
  id v5 = a3;
  if (qword_345C48)
  {
    id v6 = BCImageCacheLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v7 = 138412546;
      id v8 = v5;
      __int16 v9 = 2048;
      unint64_t v10 = a4;
      _os_log_impl(&def_7D91C, v6, OS_LOG_TYPE_INFO, "BICCacheStats: Value$%@,%llu", (uint8_t *)&v7, 0x16u);
    }
  }
}

+ (id)operationToLogString:(id)a3
{
  uint64_t v3 = qword_345C60;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&qword_345C60, &stru_2C8678);
  }
  id v5 = [(id)qword_345C58 indexOfObject:v4];

  return +[NSString stringWithFormat:@"%lu,", v5];
}

@end