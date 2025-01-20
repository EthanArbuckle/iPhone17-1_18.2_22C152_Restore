@interface UITraitCollection
+ (id)crl_baseTraitCollection;
+ (id)crl_elevatedTraitCollection;
+ (void)crl_withTraitCollectionAsCurrent:(id)a3 performBlock:(id)a4;
- (BOOL)crl_hasSameUserInterfaceStyleWith:(id)a3;
- (BOOL)crl_isCompactHeight;
- (BOOL)crl_isCompactWidth;
- (BOOL)crl_isUnspecified;
- (BOOL)crl_isUserInterfaceStyleDark;
- (BOOL)crl_isUserInterfaceStyleLight;
- (BOOL)crl_isUserInterfaceStyleUnspecified;
@end

@implementation UITraitCollection

- (BOOL)crl_isCompactWidth
{
  UIUserInterfaceSizeClass v3 = [(UITraitCollection *)self horizontalSizeClass];
  if (v3 == UIUserInterfaceSizeClassUnspecified)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (CRLAssertCat_init_token != -1) {
      dispatch_once(&CRLAssertCat_init_token, &stru_100071DD8);
    }
    if (os_log_type_enabled((os_log_t)CRLAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_10005B9D0();
    }
    if (CRLAssertCat_init_token != -1) {
      dispatch_once(&CRLAssertCat_init_token, &stru_100071DF8);
    }
    v4 = CRLAssertCat_log_t;
    if (os_log_type_enabled((os_log_t)CRLAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_10005ACE8(v4);
    }
    v5 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[UITraitCollection(CRLAdditions) crl_isCompactWidth]");
    v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/UITraitCollection_CRLAdditions.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, v6, 22, 0, "expected inequality between %{public}s and %{public}s", "horizontalSizeClass", "UIUserInterfaceSizeClassUnspecified");
  }
  UIUserInterfaceSizeClass v7 = [(UITraitCollection *)self verticalSizeClass];
  if (v7 == UIUserInterfaceSizeClassUnspecified)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (CRLAssertCat_init_token != -1) {
      dispatch_once(&CRLAssertCat_init_token, &stru_100071E18);
    }
    if (os_log_type_enabled((os_log_t)CRLAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_10005B930();
    }
    if (CRLAssertCat_init_token != -1) {
      dispatch_once(&CRLAssertCat_init_token, &stru_100071E38);
    }
    v8 = CRLAssertCat_log_t;
    if (os_log_type_enabled((os_log_t)CRLAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_10005ACE8(v8);
    }
    v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[UITraitCollection(CRLAdditions) crl_isCompactWidth]");
    v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/UITraitCollection_CRLAdditions.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 27, 0, "expected inequality between %{public}s and %{public}s", "verticalSizeClass", "UIUserInterfaceSizeClassUnspecified");
  }
  BOOL v12 = v3 == UIUserInterfaceSizeClassRegular && v7 == UIUserInterfaceSizeClassCompact;
  return v3 == UIUserInterfaceSizeClassCompact || v12;
}

- (BOOL)crl_isCompactHeight
{
  UIUserInterfaceSizeClass v2 = [(UITraitCollection *)self verticalSizeClass];
  if (v2 == UIUserInterfaceSizeClassUnspecified)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (CRLAssertCat_init_token != -1) {
      dispatch_once(&CRLAssertCat_init_token, &stru_100071E58);
    }
    if (os_log_type_enabled((os_log_t)CRLAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_10005BA70();
    }
    if (CRLAssertCat_init_token != -1) {
      dispatch_once(&CRLAssertCat_init_token, &stru_100071E78);
    }
    UIUserInterfaceSizeClass v3 = CRLAssertCat_log_t;
    if (os_log_type_enabled((os_log_t)CRLAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_10005ACE8(v3);
    }
    v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[UITraitCollection(CRLAdditions) crl_isCompactHeight]");
    v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/UITraitCollection_CRLAdditions.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 48, 0, "expected inequality between %{public}s and %{public}s", "verticalSizeClass", "UIUserInterfaceSizeClassUnspecified");
  }
  return v2 == UIUserInterfaceSizeClassCompact;
}

- (BOOL)crl_isUnspecified
{
  return [(UITraitCollection *)self horizontalSizeClass] == UIUserInterfaceSizeClassUnspecified
      || [(UITraitCollection *)self verticalSizeClass] == UIUserInterfaceSizeClassUnspecified;
}

- (BOOL)crl_isUserInterfaceStyleLight
{
  return (id)[(UITraitCollection *)self userInterfaceStyle] == (id)1;
}

- (BOOL)crl_isUserInterfaceStyleDark
{
  return (id)[(UITraitCollection *)self userInterfaceStyle] == (id)2;
}

- (BOOL)crl_isUserInterfaceStyleUnspecified
{
  return [(UITraitCollection *)self userInterfaceStyle] == UIUserInterfaceStyleUnspecified;
}

- (BOOL)crl_hasSameUserInterfaceStyleWith:(id)a3
{
  id v4 = a3;
  UIUserInterfaceStyle v5 = [(UITraitCollection *)self userInterfaceStyle];
  id v6 = [v4 userInterfaceStyle];

  return v5 == (void)v6;
}

+ (void)crl_withTraitCollectionAsCurrent:(id)a3 performBlock:(id)a4
{
  UIUserInterfaceStyle v5 = (void (**)(void))a4;
  id v6 = a3;
  id v7 = +[UITraitCollection currentTraitCollection];
  +[UITraitCollection setCurrentTraitCollection:v6];

  v5[2](v5);
  +[UITraitCollection setCurrentTraitCollection:v7];
}

+ (id)crl_baseTraitCollection
{
  if (qword_10007DBE8 != -1) {
    dispatch_once(&qword_10007DBE8, &stru_100071E98);
  }
  UIUserInterfaceSizeClass v2 = (void *)qword_10007DBD8;

  return v2;
}

+ (id)crl_elevatedTraitCollection
{
  if (qword_10007DBF0 != -1) {
    dispatch_once(&qword_10007DBF0, &stru_100071EB8);
  }
  UIUserInterfaceSizeClass v2 = (void *)qword_10007DBE0;

  return v2;
}

@end