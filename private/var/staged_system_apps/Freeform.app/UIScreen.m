@interface UIScreen
+ (BOOL)crl_deviceCanUseSidebar;
+ (BOOL)crl_deviceIsLandscape;
+ (BOOL)crl_is3xScreenScale;
+ (BOOL)crl_isHorizontallyCompactOnLandscape;
+ (BOOL)crl_pad1080H;
+ (BOOL)crl_pad1112H;
+ (BOOL)crl_pad1180H;
+ (BOOL)crl_pad1194H;
+ (BOOL)crl_pad1366H;
+ (BOOL)crl_pad1366HOrLarger;
+ (BOOL)crl_phoneUI568H;
+ (BOOL)crl_phoneUI568HOrSmaller;
+ (BOOL)crl_phoneUI667H;
+ (BOOL)crl_phoneUI667HOrSmaller;
+ (BOOL)crl_phoneUI693H;
+ (BOOL)crl_phoneUI736H;
+ (BOOL)crl_phoneUI812H;
+ (BOOL)crl_phoneUI812HOrLarger;
+ (BOOL)crl_phoneUI844H;
+ (BOOL)crl_phoneUI896H;
+ (BOOL)crl_phoneUI926H;
+ (BOOL)crl_screenClassPhoneUIRegularOrLarge;
+ (BOOL)crl_screenClassPhoneUISmallOrRegularZoom;
+ (double)crl_expectedScreenScale;
+ (double)crl_screenScale;
+ (double)crl_screenZoomScale;
+ (int64_t)crl_screenClass;
+ (int64_t)p_crl_uncachedScreenClass;
+ (void)crl_resetScreenScaleCache;
@end

@implementation UIScreen

+ (int64_t)crl_screenClass
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1003CC3E4;
  block[3] = &unk_1014CC6D8;
  block[4] = a1;
  if (qword_1016A98E0 != -1) {
    dispatch_once(&qword_1016A98E0, block);
  }
  return qword_1016A98D8;
}

+ (int64_t)p_crl_uncachedScreenClass
{
  v2 = +[UIScreen mainScreen];
  [v2 bounds];
  double v4 = v3;
  double v6 = v5;

  if (!+[UIDevice crl_phoneUI]) {
    return 0;
  }
  if (v4 < v6) {
    double v4 = v6;
  }
  if (v4 <= 667.0)
  {
    if (v4 != 557.0)
    {
      int64_t v7 = 1;
      if (v4 == 568.0) {
        return v7;
      }
      if (fabs(v4 + -557.0) < 0.000556999999) {
        return v7;
      }
      int64_t v7 = 1;
      if (v4 == 667.0 || fabs(v4 + -568.0) < 0.000567999999) {
        return v7;
      }
      if (fabs(v4 + -667.0) >= 0.000666999998)
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount];
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014F5C88);
        }
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_1010AC6C4();
        }
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014F5CA8);
        }
        v8 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_10106590C(v8);
        }
        v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[UIScreen(CRLAdditions) p_crl_uncachedScreenClass]");
        v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/UIScreen_CRLAdditions.m"];
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 34, 0, "New device size not handled (%f). Defaulting to CRLUIScreenClassPhoneUISmall.", *(void *)&v4);
        int64_t v7 = 1;
        goto LABEL_77;
      }
    }
    return 1;
  }
  if (v4 <= 693.0)
  {
    if (v4 == 693.0 || fabs(v4 + -693.0) < 0.000692999998) {
      return 2;
    }
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F5CC8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010AC638();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F5CE8);
    }
    v11 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v11);
    }
    v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[UIScreen(CRLAdditions) p_crl_uncachedScreenClass]");
    v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/UIScreen_CRLAdditions.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 37, 0, "New device size not handled (%f). Defaulting to CRLUIScreenClassPhoneUIRegularZoom.", *(void *)&v4);
    int64_t v7 = 2;
    goto LABEL_77;
  }
  if (v4 <= 736.0)
  {
    if (v4 == 736.0 || fabs(v4 + -736.0) < 0.000735999998) {
      return 4;
    }
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F5D08);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010AC5AC();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F5D28);
    }
    v13 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v13);
    }
    v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[UIScreen(CRLAdditions) p_crl_uncachedScreenClass]");
    v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/UIScreen_CRLAdditions.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 40, 0, "New device size not handled (%f). Defaulting to CRLUIScreenClassPhoneUIRegularPlus.", *(void *)&v4);
    int64_t v7 = 4;
    goto LABEL_77;
  }
  if (v4 <= 844.0)
  {
    if (v4 != 812.0)
    {
      int64_t v7 = 3;
      if (v4 == 844.0 || fabs(v4 + -812.0) < 0.000811999998) {
        return v7;
      }
      if (fabs(v4 + -844.0) >= 0.000843999998)
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount];
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014F5D48);
        }
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_1010AC520();
        }
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014F5D68);
        }
        v14 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_10106590C(v14);
        }
        v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[UIScreen(CRLAdditions) p_crl_uncachedScreenClass]");
        v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/UIScreen_CRLAdditions.m"];
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 43, 0, "New device size not handled (%f). Defaulting to CRLUIScreenClassPhoneUIRegular.", *(void *)&v4);
        int64_t v7 = 3;
        goto LABEL_77;
      }
    }
    return 3;
  }
  if (v4 == 896.0) {
    return 5;
  }
  int64_t v7 = 5;
  if (v4 != 926.0 && fabs(v4 + -896.0) >= 0.000895999998)
  {
    if (fabs(v4 + -926.0) < 0.000925999998) {
      return 5;
    }
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F5D88);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010AC494();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F5DA8);
    }
    v12 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v12);
    }
    v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[UIScreen(CRLAdditions) p_crl_uncachedScreenClass]");
    v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/UIScreen_CRLAdditions.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 46, 0, "New device size not handled (%f). Defaulting to CRLUIScreenClassPhoneUILarge.", *(void *)&v4);
    int64_t v7 = 5;
LABEL_77:
  }
  return v7;
}

+ (BOOL)crl_screenClassPhoneUIRegularOrLarge
{
  if (qword_1016A98F0 != -1) {
    dispatch_once(&qword_1016A98F0, &stru_1014F5DC8);
  }
  return byte_1016A98E8;
}

+ (BOOL)crl_screenClassPhoneUISmallOrRegularZoom
{
  if (qword_1016A9900 != -1) {
    dispatch_once(&qword_1016A9900, &stru_1014F5DE8);
  }
  return byte_1016A98F8;
}

+ (double)crl_screenZoomScale
{
  if (qword_1016A9908 != -1) {
    dispatch_once(&qword_1016A9908, &stru_1014F5E08);
  }
  return *(double *)&qword_10166E180;
}

+ (BOOL)crl_pad1080H
{
  if (qword_1016A9918 != -1) {
    dispatch_once(&qword_1016A9918, &stru_1014F5E28);
  }
  return byte_1016A9910;
}

+ (BOOL)crl_pad1112H
{
  if (qword_1016A9928 != -1) {
    dispatch_once(&qword_1016A9928, &stru_1014F5E48);
  }
  return byte_1016A9920;
}

+ (BOOL)crl_pad1180H
{
  if (qword_1016A9938 != -1) {
    dispatch_once(&qword_1016A9938, &stru_1014F5E68);
  }
  return byte_1016A9930;
}

+ (BOOL)crl_pad1194H
{
  if (qword_1016A9948 != -1) {
    dispatch_once(&qword_1016A9948, &stru_1014F5E88);
  }
  return byte_1016A9940;
}

+ (BOOL)crl_pad1366H
{
  if (qword_1016A9958 != -1) {
    dispatch_once(&qword_1016A9958, &stru_1014F5EA8);
  }
  return byte_1016A9950;
}

+ (BOOL)crl_pad1366HOrLarger
{
  if (qword_1016A9968 != -1) {
    dispatch_once(&qword_1016A9968, &stru_1014F5EC8);
  }
  return byte_1016A9960;
}

+ (BOOL)crl_phoneUI568H
{
  if (qword_1016A9978 != -1) {
    dispatch_once(&qword_1016A9978, &stru_1014F5EE8);
  }
  return byte_1016A9970;
}

+ (BOOL)crl_phoneUI568HOrSmaller
{
  if (qword_1016A9988 != -1) {
    dispatch_once(&qword_1016A9988, &stru_1014F5F08);
  }
  return byte_1016A9980;
}

+ (BOOL)crl_phoneUI667H
{
  if (qword_1016A9998 != -1) {
    dispatch_once(&qword_1016A9998, &stru_1014F5F28);
  }
  return byte_1016A9990;
}

+ (BOOL)crl_phoneUI667HOrSmaller
{
  if (qword_1016A99A8 != -1) {
    dispatch_once(&qword_1016A99A8, &stru_1014F5F48);
  }
  return byte_1016A99A0;
}

+ (BOOL)crl_phoneUI693H
{
  if (qword_1016A99B8 != -1) {
    dispatch_once(&qword_1016A99B8, &stru_1014F5F68);
  }
  return byte_1016A99B0;
}

+ (BOOL)crl_phoneUI736H
{
  if (qword_1016A99C8 != -1) {
    dispatch_once(&qword_1016A99C8, &stru_1014F5F88);
  }
  return byte_1016A99C0;
}

+ (BOOL)crl_phoneUI812H
{
  if (qword_1016A99D8 != -1) {
    dispatch_once(&qword_1016A99D8, &stru_1014F5FA8);
  }
  return byte_1016A99D0;
}

+ (BOOL)crl_phoneUI812HOrLarger
{
  if (qword_1016A99E8 != -1) {
    dispatch_once(&qword_1016A99E8, &stru_1014F5FC8);
  }
  return byte_1016A99E0;
}

+ (BOOL)crl_phoneUI844H
{
  if (qword_1016A99F8 != -1) {
    dispatch_once(&qword_1016A99F8, &stru_1014F5FE8);
  }
  return byte_1016A99F0;
}

+ (BOOL)crl_phoneUI896H
{
  if (qword_1016A9A08 != -1) {
    dispatch_once(&qword_1016A9A08, &stru_1014F6008);
  }
  return byte_1016A9A00;
}

+ (BOOL)crl_phoneUI926H
{
  if (qword_1016A9A18 != -1) {
    dispatch_once(&qword_1016A9A18, &stru_1014F6028);
  }
  return byte_1016A9A10;
}

+ (BOOL)crl_isHorizontallyCompactOnLandscape
{
  if (objc_msgSend(a1, "crl_phoneUI667HOrSmaller")) {
    return 1;
  }

  return [a1 crl_phoneUI812H];
}

+ (BOOL)crl_deviceCanUseSidebar
{
  return +[UIScreen crl_pad1366H];
}

+ (BOOL)crl_deviceIsLandscape
{
  v2 = +[UIScreen mainScreen];
  [v2 bounds];
  double v4 = v3;
  double v6 = v5;

  return v4 > v6;
}

+ (double)crl_expectedScreenScale
{
  +[UIScreen crl_screenScale];
  double v3 = v2;
  if (v2 > 2.0 && +[UIScreen crl_phoneUI667H]) {
    return 2.0;
  }
  return v3;
}

+ (void)crl_resetScreenScaleCache
{
  if (*(double *)&qword_10166E188 >= 0.0)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F6048);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010AC750();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F6068);
    }
    double v2 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v2);
    }
    double v3 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[UIScreen(CRLAdditions) crl_resetScreenScaleCache]");
    double v4 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/UIScreen_CRLAdditions.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v3, v4, 327, 0, "No one should look at the screen scale before the application has finished launching, because the value isn't ready yet and may change! To debug, break in UIScreen.crl_screenScale and re-launch the app.");
  }
  qword_10166E188 = 0xBFF0000000000000;
}

+ (double)crl_screenScale
{
  double result = *(double *)&qword_10166E188;
  if (*(double *)&qword_10166E188 < 0.0)
  {
    double v3 = +[UIScreen mainScreen];
    [v3 scale];
    qword_10166E188 = v4;

    return *(double *)&qword_10166E188;
  }
  return result;
}

+ (BOOL)crl_is3xScreenScale
{
  +[UIScreen crl_screenScale];
  double v3 = vabdd_f64(3.0, v2);
  if (vabdd_f64(2.0, v2) >= 0.00000011920929 && v3 >= 0.00000011920929)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F6088);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010AC7E8();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F60A8);
    }
    double v5 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v5);
    }
    double v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[UIScreen(CRLAdditions) crl_is3xScreenScale]");
    int64_t v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/UIScreen_CRLAdditions.m"];
    +[CRLAssertionHandler handleFailureInFunction:v6 file:v7 lineNumber:347 isFatal:0 description:"Unsupported screen scale."];
  }
  return v3 < 0.00000011920929;
}

@end