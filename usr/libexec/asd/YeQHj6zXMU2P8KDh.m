@interface YeQHj6zXMU2P8KDh
+ (BOOL)sensitiveLoggingEnabled;
+ (id)sharedInstance;
- (YeQHj6zXMU2P8KDh)init;
- (void)cGauGmZFPJJkT1d3:(id)a3;
- (void)zQehSLHqShQPYsHo:(id)a3 kidVYacbY8LCJT8v:(_eipjLVDiD7LNwlPc *)a4;
@end

@implementation YeQHj6zXMU2P8KDh

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001E9D8;
  block[3] = &unk_10065ED90;
  block[4] = a1;
  if (qword_1006A5DB0 != -1) {
    dispatch_once(&qword_1006A5DB0, block);
  }
  v2 = (void *)qword_1006A5DA8;

  return v2;
}

- (YeQHj6zXMU2P8KDh)init
{
  v3 = (OS_os_log *)os_log_create("com.apple.asd", "dfLog");
  pqeBGOQoC53XfqEz = self->pqeBGOQoC53XfqEz;
  self->pqeBGOQoC53XfqEz = v3;

  return self;
}

+ (BOOL)sensitiveLoggingEnabled
{
  v2 = +[NSUserDefaults standardUserDefaults];
  unsigned __int8 v3 = [v2 BOOLForKey:@"debug.log-sensitive-data"];

  return v3;
}

- (void)cGauGmZFPJJkT1d3:(id)a3
{
  id v4 = a3;
  if (+[YeQHj6zXMU2P8KDh sensitiveLoggingEnabled])
  {
    id v18 = v4;
    v5 = [v4 description];
    unint64_t v6 = (unint64_t)[v5 length];
    if (v6)
    {
      unint64_t v7 = v6;
      unint64_t v8 = 0;
      uint64_t v9 = (v6 >> 9) + 1;
      uint64_t v10 = 1;
      do
      {
        if (v7 - v8 >= 0x200) {
          uint64_t v11 = 512;
        }
        else {
          uint64_t v11 = v7 - v8;
        }
        pqeBGOQoC53XfqEz = self->pqeBGOQoC53XfqEz;
        if (os_log_type_enabled(pqeBGOQoC53XfqEz, OS_LOG_TYPE_DEFAULT))
        {
          v13 = pqeBGOQoC53XfqEz;
          v14 = [v5 substringWithRange:v8, v11];
          *(_DWORD *)buf = 134218498;
          uint64_t v20 = v10;
          __int16 v21 = 2048;
          uint64_t v22 = v9;
          __int16 v23 = 2112;
          v24 = v14;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "InVal for IB (part %lu of %lu):\n%@", buf, 0x20u);
        }
        v8 += v11;
        ++v10;
      }
      while (v8 < v7);
    }

    id v4 = v18;
  }
  else
  {
    v15 = self->pqeBGOQoC53XfqEz;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v16 = v15;
      v17 = [v4 allKeys];
      *(_DWORD *)buf = 138412290;
      uint64_t v20 = (uint64_t)v17;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "InVal keys for IB: %@", buf, 0xCu);
    }
  }
}

- (void)zQehSLHqShQPYsHo:(id)a3 kidVYacbY8LCJT8v:(_eipjLVDiD7LNwlPc *)a4
{
  id v6 = a3;
  pqeBGOQoC53XfqEz = self->pqeBGOQoC53XfqEz;
  BOOL v8 = os_log_type_enabled(pqeBGOQoC53XfqEz, OS_LOG_TYPE_INFO);
  if (v6)
  {
    if (v8)
    {
      unsigned int var0 = a4->var0;
      unsigned int var1 = a4->var1;
      uint64_t v11 = pqeBGOQoC53XfqEz;
      id v12 = [v6 qfSDGTGvqd3Hruzg];
      v13 = [v6 GyF0atX3JpCKc9pK];
      int v16 = 67109890;
      unsigned int v17 = var0;
      __int16 v18 = 1024;
      unsigned int v19 = var1;
      __int16 v20 = 2048;
      id v21 = v12;
      __int16 v22 = 2112;
      __int16 v23 = v13;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "DF[%x, %d]: EC %ld, V: %@", (uint8_t *)&v16, 0x22u);
    }
  }
  else if (v8)
  {
    unsigned int v14 = a4->var0;
    unsigned int v15 = a4->var1;
    int v16 = 67109376;
    unsigned int v17 = v14;
    __int16 v18 = 1024;
    unsigned int v19 = v15;
    _os_log_impl((void *)&_mh_execute_header, pqeBGOQoC53XfqEz, OS_LOG_TYPE_INFO, "DF[%x, %d]: nil", (uint8_t *)&v16, 0xEu);
  }
}

- (void).cxx_destruct
{
}

@end