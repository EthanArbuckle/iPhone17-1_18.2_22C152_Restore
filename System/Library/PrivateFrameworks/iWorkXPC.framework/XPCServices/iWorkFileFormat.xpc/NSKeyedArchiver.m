@interface NSKeyedArchiver
+ (id)tsu_securelyArchiveRoot:(id)a3;
@end

@implementation NSKeyedArchiver

+ (id)tsu_securelyArchiveRoot:(id)a3
{
  id v3 = a3;
  id v19 = 0;
  v4 = +[NSKeyedArchiver archivedDataWithRootObject:v3 requiringSecureCoding:1 error:&v19];
  id v5 = v19;
  if (!v4)
  {
    unsigned int v6 = +[TSUAssertionHandler _atomicIncrementAssertCount];
    if (TSUAssertCat_init_token != -1) {
      dispatch_once(&TSUAssertCat_init_token, &stru_1001CBC68);
    }
    v7 = TSUAssertCat_log_t;
    if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR))
    {
      v14 = v7;
      v15 = (objc_class *)objc_opt_class();
      v16 = NSStringFromClass(v15);
      v17 = [v5 domain];
      id v18 = [v5 code];
      *(_DWORD *)buf = 67111170;
      unsigned int v21 = v6;
      __int16 v22 = 2082;
      v23 = "+[NSKeyedArchiver(TSUAdditions) tsu_securelyArchiveRoot:]";
      __int16 v24 = 2082;
      v25 = "/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/utility/NSKeyedArchiver_TSUAdditions.m";
      __int16 v26 = 1024;
      int v27 = 21;
      __int16 v28 = 2112;
      id v29 = v3;
      __int16 v30 = 2114;
      v31 = v16;
      __int16 v32 = 2114;
      v33 = v17;
      __int16 v34 = 2048;
      id v35 = v18;
      __int16 v36 = 2112;
      id v37 = v5;
      _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Unable to encode object %@: errorClass=%{public}@, domain=%{public}@, code=%zd (%@) ", buf, 0x54u);
    }
    v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[NSKeyedArchiver(TSUAdditions) tsu_securelyArchiveRoot:]");
    v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/utility/NSKeyedArchiver_TSUAdditions.m"];
    v10 = (objc_class *)objc_opt_class();
    v11 = NSStringFromClass(v10);
    v12 = [v5 domain];
    +[TSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](TSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 21, 0, "Unable to encode object %@: errorClass=%{public}@, domain=%{public}@, code=%zd (%@) ", v3, v11, v12, [v5 code], v5);

    +[TSUAssertionHandler logFullBacktrace];
  }

  return v4;
}

@end