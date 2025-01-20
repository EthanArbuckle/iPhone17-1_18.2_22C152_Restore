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
  block[2] = sub_10000F310;
  block[3] = &unk_100071ED8;
  block[4] = a1;
  if (qword_10007DC00 != -1) {
    dispatch_once(&qword_10007DC00, block);
  }
  return qword_10007DBF8;
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
        if (CRLAssertCat_init_token != -1) {
          dispatch_once(&CRLAssertCat_init_token, &stru_100071EF8);
        }
        if (os_log_type_enabled((os_log_t)CRLAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
          sub_10005BD40();
        }
        if (CRLAssertCat_init_token != -1) {
          dispatch_once(&CRLAssertCat_init_token, &stru_100071F18);
        }
        v8 = CRLAssertCat_log_t;
        if (os_log_type_enabled((os_log_t)CRLAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
          sub_10005AE34(v8);
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
    if (CRLAssertCat_init_token != -1) {
      dispatch_once(&CRLAssertCat_init_token, &stru_100071F38);
    }
    if (os_log_type_enabled((os_log_t)CRLAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_10005BCB4();
    }
    if (CRLAssertCat_init_token != -1) {
      dispatch_once(&CRLAssertCat_init_token, &stru_100071F58);
    }
    v11 = CRLAssertCat_log_t;
    if (os_log_type_enabled((os_log_t)CRLAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_10005AE34(v11);
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
    if (CRLAssertCat_init_token != -1) {
      dispatch_once(&CRLAssertCat_init_token, &stru_100071F78);
    }
    if (os_log_type_enabled((os_log_t)CRLAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_10005BC28();
    }
    if (CRLAssertCat_init_token != -1) {
      dispatch_once(&CRLAssertCat_init_token, &stru_100071F98);
    }
    v13 = CRLAssertCat_log_t;
    if (os_log_type_enabled((os_log_t)CRLAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_10005AE34(v13);
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
        if (CRLAssertCat_init_token != -1) {
          dispatch_once(&CRLAssertCat_init_token, &stru_100071FB8);
        }
        if (os_log_type_enabled((os_log_t)CRLAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
          sub_10005BB9C();
        }
        if (CRLAssertCat_init_token != -1) {
          dispatch_once(&CRLAssertCat_init_token, &stru_100071FD8);
        }
        v14 = CRLAssertCat_log_t;
        if (os_log_type_enabled((os_log_t)CRLAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
          sub_10005AE34(v14);
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
    if (CRLAssertCat_init_token != -1) {
      dispatch_once(&CRLAssertCat_init_token, &stru_100071FF8);
    }
    if (os_log_type_enabled((os_log_t)CRLAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_10005BB10();
    }
    if (CRLAssertCat_init_token != -1) {
      dispatch_once(&CRLAssertCat_init_token, &stru_100072018);
    }
    v12 = CRLAssertCat_log_t;
    if (os_log_type_enabled((os_log_t)CRLAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_10005AE34(v12);
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
  if (qword_10007DC10 != -1) {
    dispatch_once(&qword_10007DC10, &stru_100072038);
  }
  return byte_10007DC08;
}

+ (BOOL)crl_screenClassPhoneUISmallOrRegularZoom
{
  if (qword_10007DC20 != -1) {
    dispatch_once(&qword_10007DC20, &stru_100072058);
  }
  return byte_10007DC18;
}

+ (double)crl_screenZoomScale
{
  if (qword_10007DC28 != -1) {
    dispatch_once(&qword_10007DC28, &stru_100072078);
  }
  return *(double *)&qword_10007C5C0;
}

+ (BOOL)crl_pad1080H
{
  if (qword_10007DC38 != -1) {
    dispatch_once(&qword_10007DC38, &stru_100072098);
  }
  return byte_10007DC30;
}

+ (BOOL)crl_pad1112H
{
  if (qword_10007DC48 != -1) {
    dispatch_once(&qword_10007DC48, &stru_1000720B8);
  }
  return byte_10007DC40;
}

+ (BOOL)crl_pad1180H
{
  if (qword_10007DC58 != -1) {
    dispatch_once(&qword_10007DC58, &stru_1000720D8);
  }
  return byte_10007DC50;
}

+ (BOOL)crl_pad1194H
{
  if (qword_10007DC68 != -1) {
    dispatch_once(&qword_10007DC68, &stru_1000720F8);
  }
  return byte_10007DC60;
}

+ (BOOL)crl_pad1366H
{
  if (qword_10007DC78 != -1) {
    dispatch_once(&qword_10007DC78, &stru_100072118);
  }
  return byte_10007DC70;
}

+ (BOOL)crl_pad1366HOrLarger
{
  if (qword_10007DC88 != -1) {
    dispatch_once(&qword_10007DC88, &stru_100072138);
  }
  return byte_10007DC80;
}

+ (BOOL)crl_phoneUI568H
{
  if (qword_10007DC98 != -1) {
    dispatch_once(&qword_10007DC98, &stru_100072158);
  }
  return byte_10007DC90;
}

+ (BOOL)crl_phoneUI568HOrSmaller
{
  if (qword_10007DCA8 != -1) {
    dispatch_once(&qword_10007DCA8, &stru_100072178);
  }
  return byte_10007DCA0;
}

+ (BOOL)crl_phoneUI667H
{
  if (qword_10007DCB8 != -1) {
    dispatch_once(&qword_10007DCB8, &stru_100072198);
  }
  return byte_10007DCB0;
}

+ (BOOL)crl_phoneUI667HOrSmaller
{
  if (qword_10007DCC8 != -1) {
    dispatch_once(&qword_10007DCC8, &stru_1000721B8);
  }
  return byte_10007DCC0;
}

+ (BOOL)crl_phoneUI693H
{
  if (qword_10007DCD8 != -1) {
    dispatch_once(&qword_10007DCD8, &stru_1000721D8);
  }
  return byte_10007DCD0;
}

+ (BOOL)crl_phoneUI736H
{
  if (qword_10007DCE8 != -1) {
    dispatch_once(&qword_10007DCE8, &stru_1000721F8);
  }
  return byte_10007DCE0;
}

+ (BOOL)crl_phoneUI812H
{
  if (qword_10007DCF8 != -1) {
    dispatch_once(&qword_10007DCF8, &stru_100072218);
  }
  return byte_10007DCF0;
}

+ (BOOL)crl_phoneUI812HOrLarger
{
  if (qword_10007DD08 != -1) {
    dispatch_once(&qword_10007DD08, &stru_100072238);
  }
  return byte_10007DD00;
}

+ (BOOL)crl_phoneUI844H
{
  if (qword_10007DD18 != -1) {
    dispatch_once(&qword_10007DD18, &stru_100072258);
  }
  return byte_10007DD10;
}

+ (BOOL)crl_phoneUI896H
{
  if (qword_10007DD28 != -1) {
    dispatch_once(&qword_10007DD28, &stru_100072278);
  }
  return byte_10007DD20;
}

+ (BOOL)crl_phoneUI926H
{
  if (qword_10007DD38 != -1) {
    dispatch_once(&qword_10007DD38, &stru_100072298);
  }
  return byte_10007DD30;
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
  if (*(double *)&qword_10007C5C8 >= 0.0)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (CRLAssertCat_init_token != -1) {
      dispatch_once(&CRLAssertCat_init_token, &stru_1000722B8);
    }
    if (os_log_type_enabled((os_log_t)CRLAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_10005BDCC();
    }
    if (CRLAssertCat_init_token != -1) {
      dispatch_once(&CRLAssertCat_init_token, &stru_1000722D8);
    }
    double v2 = CRLAssertCat_log_t;
    if (os_log_type_enabled((os_log_t)CRLAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_10005AE34(v2);
    }
    double v3 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[UIScreen(CRLAdditions) crl_resetScreenScaleCache]");
    double v4 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/UIScreen_CRLAdditions.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v3, v4, 327, 0, "No one should look at the screen scale before the application has finished launching, because the value isn't ready yet and may change! To debug, break in UIScreen.crl_screenScale and re-launch the app.");
  }
  qword_10007C5C8 = 0xBFF0000000000000;
}

+ (double)crl_screenScale
{
  double result = *(double *)&qword_10007C5C8;
  if (*(double *)&qword_10007C5C8 < 0.0)
  {
    double v3 = +[UIScreen mainScreen];
    [v3 scale];
    qword_10007C5C8 = v4;

    return *(double *)&qword_10007C5C8;
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
    if (CRLAssertCat_init_token != -1) {
      dispatch_once(&CRLAssertCat_init_token, &stru_1000722F8);
    }
    if (os_log_type_enabled((os_log_t)CRLAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_10005BE64();
    }
    if (CRLAssertCat_init_token != -1) {
      dispatch_once(&CRLAssertCat_init_token, &stru_100072318);
    }
    double v5 = CRLAssertCat_log_t;
    if (os_log_type_enabled((os_log_t)CRLAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_10005AE34(v5);
    }
    double v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[UIScreen(CRLAdditions) crl_is3xScreenScale]");
    int64_t v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/UIScreen_CRLAdditions.m"];
    +[CRLAssertionHandler handleFailureInFunction:v6 file:v7 lineNumber:347 isFatal:0 description:"Unsupported screen scale."];
  }
  return v3 < 0.00000011920929;
}

@end