@interface NSKeyedArchiver
+ (id)crl_securelyArchiveRoot:(id)a3;
@end

@implementation NSKeyedArchiver

+ (id)crl_securelyArchiveRoot:(id)a3
{
  id v3 = a3;
  id v20 = 0;
  v4 = +[NSKeyedArchiver archivedDataWithRootObject:v3 requiringSecureCoding:1 error:&v20];
  id v5 = v20;
  if (!v4)
  {
    int v6 = +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D0848);
    }
    v7 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
    {
      v15 = v7;
      v16 = (objc_class *)objc_opt_class();
      v17 = NSStringFromClass(v16);
      v18 = [v5 domain];
      id v19 = [v5 code];
      *(_DWORD *)buf = 67111170;
      int v22 = v6;
      __int16 v23 = 2082;
      v24 = "+[NSKeyedArchiver(CRLAdditions) crl_securelyArchiveRoot:]";
      __int16 v25 = 2082;
      v26 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/NSKeyedArchiver_CRLAdditions.m";
      __int16 v27 = 1024;
      int v28 = 17;
      __int16 v29 = 2112;
      id v30 = v3;
      __int16 v31 = 2114;
      v32 = v17;
      __int16 v33 = 2114;
      v34 = v18;
      __int16 v35 = 2048;
      id v36 = v19;
      __int16 v37 = 2112;
      id v38 = v5;
      _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Unable to encode object %@: errorClass=%{public}@, domain=%{public}@, code=%zd (%@) ", buf, 0x54u);
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D0868);
    }
    v8 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101066770(v8, v6);
    }
    v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[NSKeyedArchiver(CRLAdditions) crl_securelyArchiveRoot:]");
    v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/NSKeyedArchiver_CRLAdditions.m"];
    v11 = (objc_class *)objc_opt_class();
    v12 = NSStringFromClass(v11);
    v13 = [v5 domain];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 17, 0, "Unable to encode object %@: errorClass=%{public}@, domain=%{public}@, code=%zd (%@) ", v3, v12, v13, [v5 code], v5);
  }

  return v4;
}

@end