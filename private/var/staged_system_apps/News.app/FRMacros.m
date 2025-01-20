@interface FRMacros
+ (BOOL)disableAllAds;
+ (BOOL)iPad;
+ (BOOL)iPadPro;
+ (BOOL)iPhone;
+ (BOOL)iPhone4OrLess;
+ (BOOL)iPhone5;
+ (BOOL)iPhone5Landscape;
+ (BOOL)iPhone5OrLess;
+ (BOOL)iPhone6;
+ (BOOL)iPhone6OrLess;
+ (BOOL)iPhone6P;
+ (BOOL)iPhone6POrLess;
+ (BOOL)iPhoneFancyAF;
+ (BOOL)isHardwareKeyboardAttached;
+ (BOOL)isOrbDevice;
+ (BOOL)isSpectreDevice;
+ (BOOL)isUIAutomationRunning;
+ (BOOL)portrait;
+ (BOOL)retina;
+ (BOOL)splitScreen;
+ (BOOL)splitScreenEqual;
+ (BOOL)splitScreenOneThird;
+ (BOOL)splitScreenThreeQuarters;
+ (BOOL)splitScreenTwoThirds;
+ (BOOL)viewIsCompact:(id)a3;
+ (BOOL)windowIsLandscape;
+ (double)deviceScreenScaleFromPotentialBackgroundThread;
+ (double)maxScreenSide;
+ (double)minScreenSide;
+ (id)imageFromNewGraphicsContextWithSize:(CGSize)a3 opaque:(BOOL)a4 forceSRGB:(BOOL)a5 scale:(double)a6 contextBlock:(id)a7;
+ (id)imageFromNewGraphicsContextWithSize:(CGSize)a3 opaque:(BOOL)a4 scale:(double)a5 contextBlock:(id)a6;
+ (void)useManagedContextWithSize:(CGSize)a3 opaque:(BOOL)a4 forceSRGB:(BOOL)a5 scale:(double)a6 contextBlock:(id)a7;
+ (void)useManagedContextWithSize:(CGSize)a3 opaque:(BOOL)a4 scale:(double)a5 contextBlock:(id)a6;
@end

@implementation FRMacros

+ (BOOL)iPhone
{
  if (qword_1000EDFF8 != -1) {
    dispatch_once(&qword_1000EDFF8, &stru_1000C8688);
  }
  return byte_1000EE000;
}

+ (BOOL)iPad
{
  if (qword_1000EDFE8 != -1) {
    dispatch_once(&qword_1000EDFE8, &stru_1000C8668);
  }
  return byte_1000EDFF0;
}

+ (void)useManagedContextWithSize:(CGSize)a3 opaque:(BOOL)a4 scale:(double)a5 contextBlock:(id)a6
{
}

+ (void)useManagedContextWithSize:(CGSize)a3 opaque:(BOOL)a4 forceSRGB:(BOOL)a5 scale:(double)a6 contextBlock:(id)a7
{
  BOOL v8 = a5;
  BOOL v9 = a4;
  double height = a3.height;
  double width = a3.width;
  id v12 = a7;
  v13 = +[UIGraphicsImageRendererFormat preferredFormat];
  if (vabdd_f64(0.0, a6) < 0.00999999978)
  {
    +[FRMacros deviceScreenScaleFromPotentialBackgroundThread];
    a6 = v14;
  }
  [v13 setScale:a6];
  if (v8) {
    [v13 setPreferredRange:2];
  }
  [v13 setOpaque:v9];
  id v16 = [objc_alloc((Class)UIGraphicsImageRenderer) initWithSize:v13 format:width, height];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100047E70;
  v19[3] = &unk_1000C85E8;
  id v17 = v12;
  id v20 = v17;
  id v18 = [v16 imageWithActions:v19];
}

+ (id)imageFromNewGraphicsContextWithSize:(CGSize)a3 opaque:(BOOL)a4 scale:(double)a5 contextBlock:(id)a6
{
  return [a1 imageFromNewGraphicsContextWithSize:a4 opaque:0 forceSRGB:a6 scale:a3.width height:a3.height contextBlock:a5];
}

+ (id)imageFromNewGraphicsContextWithSize:(CGSize)a3 opaque:(BOOL)a4 forceSRGB:(BOOL)a5 scale:(double)a6 contextBlock:(id)a7
{
  BOOL v8 = a5;
  BOOL v9 = a4;
  double height = a3.height;
  double width = a3.width;
  id v12 = a7;
  v13 = +[UIGraphicsImageRendererFormat preferredFormat];
  if (vabdd_f64(0.0, a6) < 0.00999999978)
  {
    +[FRMacros deviceScreenScaleFromPotentialBackgroundThread];
    a6 = v14;
  }
  [v13 setScale:a6];
  [v13 setOpaque:v9];
  if (v8) {
    [v13 setPreferredRange:2];
  }
  id v16 = [objc_alloc((Class)UIGraphicsImageRenderer) initWithSize:v13 format:width, height];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100048044;
  v20[3] = &unk_1000C85E8;
  id v17 = v12;
  id v21 = v17;
  id v18 = [v16 imageWithActions:v20];

  return v18;
}

+ (BOOL)viewIsCompact:(id)a3
{
  v3 = [a3 traitCollection];
  v4 = +[UITraitCollection traitCollectionWithHorizontalSizeClass:1];
  unsigned __int8 v5 = [v3 containsTraitsInCollection:v4];

  return v5;
}

+ (BOOL)windowIsLandscape
{
  v2 = +[UIApplication sharedApplication];
  v3 = [v2 key_window];

  [v3 frame];
  double v5 = v4;
  [v3 frame];
  LOBYTE(v2) = v5 > v6;

  return (char)v2;
}

+ (BOOL)disableAllAds
{
  int v2 = NFInternalBuild();
  if (v2)
  {
    v3 = +[NSUserDefaults standardUserDefaults];
    unsigned __int8 v4 = [v3 BOOLForKey:@"disable-all-ads"];

    LOBYTE(v2) = v4;
  }
  return v2;
}

+ (double)maxScreenSide
{
  if (qword_1000EDFB8 != -1) {
    dispatch_once(&qword_1000EDFB8, &stru_1000C8608);
  }
  return *(double *)&qword_1000EDFC0;
}

+ (double)minScreenSide
{
  if (qword_1000EDFC8 != -1) {
    dispatch_once(&qword_1000EDFC8, &stru_1000C8628);
  }
  return *(double *)&qword_1000EDFD0;
}

+ (BOOL)splitScreen
{
  +[NSThread isMainThread];
  int v2 = +[UIApplication sharedApplication];
  v3 = [v2 key_window];

  unsigned __int8 v4 = +[UIScreen mainScreen];
  [v3 frame];
  double Width = CGRectGetWidth(v8);
  [v4 bounds];
  BOOL v6 = Width != CGRectGetWidth(v9);

  return v6;
}

+ (BOOL)splitScreenEqual
{
  +[NSThread isMainThread];
  v3 = +[UIApplication sharedApplication];
  unsigned __int8 v4 = [v3 key_window];

  double v5 = +[UIScreen mainScreen];
  if ([a1 splitScreen])
  {
    [v4 frame];
    double Width = CGRectGetWidth(v9);
    [v5 bounds];
    BOOL v7 = Width == CGRectGetWidth(v10) * 0.5 + -5.0;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

+ (BOOL)splitScreenOneThird
{
  +[NSThread isMainThread];
  v3 = +[UIApplication sharedApplication];
  unsigned __int8 v4 = [v3 key_window];

  double v5 = +[UIScreen mainScreen];
  if ([a1 splitScreen] && (objc_msgSend(a1, "splitScreenEqual") & 1) == 0)
  {
    [v4 frame];
    double Width = CGRectGetWidth(v9);
    [v5 bounds];
    BOOL v6 = Width < CGRectGetWidth(v10) * 0.5;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

+ (BOOL)splitScreenThreeQuarters
{
  +[NSThread isMainThread];
  v3 = +[UIApplication sharedApplication];
  unsigned __int8 v4 = [v3 key_window];

  double v5 = +[UIScreen mainScreen];
  if ([a1 splitScreen] && (objc_msgSend(a1, "portrait") & 1) == 0)
  {
    [v4 frame];
    double Width = CGRectGetWidth(v9);
    [v5 bounds];
    BOOL v6 = Width > CGRectGetWidth(v10) * 0.5;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

+ (BOOL)splitScreenTwoThirds
{
  +[NSThread isMainThread];
  v3 = +[UIApplication sharedApplication];
  unsigned __int8 v4 = [v3 key_window];

  double v5 = +[UIScreen mainScreen];
  if ([a1 splitScreen] && objc_msgSend(a1, "portrait"))
  {
    [v4 frame];
    double Width = CGRectGetWidth(v9);
    [v5 bounds];
    BOOL v7 = Width > CGRectGetWidth(v10) * 0.5;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

+ (BOOL)portrait
{
  +[NSThread isMainThread];
  int v2 = +[UIApplication sharedApplication];
  v3 = [v2 key_window];

  unsigned __int8 v4 = [v3 windowScene];
  double v5 = (char *)[v4 interfaceOrientation];

  return (unint64_t)(v5 - 1) < 2;
}

+ (BOOL)iPadPro
{
  if (qword_1000EDFD8 != -1) {
    dispatch_once(&qword_1000EDFD8, &stru_1000C8648);
  }
  return byte_1000EDFE0;
}

+ (BOOL)retina
{
  if (qword_1000EE008 != -1) {
    dispatch_once(&qword_1000EE008, &stru_1000C86A8);
  }
  return byte_1000EE010;
}

+ (BOOL)iPhone4OrLess
{
  if (qword_1000EE018 != -1) {
    dispatch_once(&qword_1000EE018, &stru_1000C86C8);
  }
  return byte_1000EE020;
}

+ (BOOL)iPhone5OrLess
{
  if (qword_1000EE028 != -1) {
    dispatch_once(&qword_1000EE028, &stru_1000C86E8);
  }
  return byte_1000EE030;
}

+ (BOOL)iPhone5
{
  if (qword_1000EE038 != -1) {
    dispatch_once(&qword_1000EE038, &stru_1000C8708);
  }
  return byte_1000EE040;
}

+ (BOOL)iPhone5Landscape
{
  if (!+[FRMacros iPhone]) {
    return 0;
  }
  int v2 = +[UIScreen mainScreen];
  [v2 bounds];
  BOOL v4 = v3 == 568.0;

  return v4;
}

+ (BOOL)iPhone6
{
  if (qword_1000EE048 != -1) {
    dispatch_once(&qword_1000EE048, &stru_1000C8728);
  }
  return byte_1000EE050;
}

+ (BOOL)iPhone6OrLess
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100048D1C;
  block[3] = &unk_1000C8748;
  block[4] = a1;
  if (qword_1000EE058 != -1) {
    dispatch_once(&qword_1000EE058, block);
  }
  return byte_1000EE060;
}

+ (BOOL)iPhone6P
{
  if (qword_1000EE068 != -1) {
    dispatch_once(&qword_1000EE068, &stru_1000C8768);
  }
  return byte_1000EE070;
}

+ (BOOL)iPhone6POrLess
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100048EE0;
  block[3] = &unk_1000C8748;
  block[4] = a1;
  if (qword_1000EE078 != -1) {
    dispatch_once(&qword_1000EE078, block);
  }
  return byte_1000EE080;
}

+ (BOOL)iPhoneFancyAF
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100048FC8;
  block[3] = &unk_1000C8748;
  block[4] = a1;
  if (qword_1000EE088 != -1) {
    dispatch_once(&qword_1000EE088, block);
  }
  return byte_1000EE090;
}

+ (BOOL)isSpectreDevice
{
  return _NFDeviceHasExtendedColorDisplay(a1, a2);
}

+ (BOOL)isOrbDevice
{
  if (qword_1000EE098 != -1) {
    dispatch_once(&qword_1000EE098, &stru_1000C8788);
  }
  return byte_1000EE091;
}

+ (BOOL)isUIAutomationRunning
{
  if (qword_1000EE0A8 != -1) {
    dispatch_once(&qword_1000EE0A8, &stru_1000C87A8);
  }
  return byte_1000EE0A0;
}

+ (double)deviceScreenScaleFromPotentialBackgroundThread
{
  if (+[NSThread isMainThread])
  {
    int v2 = +[UIScreen mainScreen];
    [v2 scale];
    double v4 = v3;

    return v4;
  }
  else
  {
    if (qword_1000EE0B8 != -1) {
      dispatch_once(&qword_1000EE0B8, &stru_1000C87C8);
    }
    return *(double *)&qword_1000EE0B0;
  }
}

+ (BOOL)isHardwareKeyboardAttached
{
  return GSEventIsHardwareKeyboardAttached() != 0;
}

@end