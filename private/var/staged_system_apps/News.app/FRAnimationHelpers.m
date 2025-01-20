@interface FRAnimationHelpers
+ (BOOL)changeWithoutRestartingEnabled;
+ (BOOL)feedScaleDisabled;
+ (BOOL)oldTimingEnabled;
+ (BOOL)overrideDurationEnabled;
+ (BOOL)prewarmDelayDisabled;
+ (BOOL)synchronousImageLoadingEnabled;
+ (double)animationDuration;
+ (id)animationType;
@end

@implementation FRAnimationHelpers

+ (BOOL)changeWithoutRestartingEnabled
{
  if (qword_1000EE0C8 != -1) {
    dispatch_once(&qword_1000EE0C8, &stru_1000C8BA0);
  }
  return byte_1000EE0C0;
}

+ (id)animationType
{
  if (+[FRAnimationHelpers changeWithoutRestartingEnabled])
  {
    v2 = +[NSUserDefaults standardUserDefaults];
    id v3 = [v2 stringForKey:@"animation_type"];
  }
  else
  {
    if (qword_1000EE0D8 != -1) {
      dispatch_once(&qword_1000EE0D8, &stru_1000C8BC0);
    }
    id v3 = (id)qword_1000EE0D0;
  }

  return v3;
}

+ (BOOL)overrideDurationEnabled
{
  if (+[FRAnimationHelpers changeWithoutRestartingEnabled])
  {
    v2 = +[NSUserDefaults standardUserDefaults];
    unsigned __int8 v3 = [v2 BOOLForKey:@"override_duration"];

    return v3;
  }
  else
  {
    if (qword_1000EE0E8 != -1) {
      dispatch_once(&qword_1000EE0E8, &stru_1000C8BE0);
    }
    return byte_1000EE0E0;
  }
}

+ (double)animationDuration
{
  if (+[FRAnimationHelpers changeWithoutRestartingEnabled])
  {
    v2 = +[NSUserDefaults standardUserDefaults];
    [v2 floatForKey:@"animation_duration"];
    double v4 = (float)(v3 / 10.0);
  }
  else
  {
    if (qword_1000EE0F8 != -1) {
      dispatch_once(&qword_1000EE0F8, &stru_1000C8C00);
    }
    if (byte_1000EE0F0) {
      return 1.0;
    }
    else {
      return 0.0;
    }
  }
  return v4;
}

+ (BOOL)oldTimingEnabled
{
  if (+[FRAnimationHelpers changeWithoutRestartingEnabled])
  {
    v2 = +[NSUserDefaults standardUserDefaults];
    unsigned __int8 v3 = [v2 BOOLForKey:@"animation_old_timing_enabled"];

    return v3;
  }
  else
  {
    if (qword_1000EE108 != -1) {
      dispatch_once(&qword_1000EE108, &stru_1000C8C20);
    }
    return byte_1000EE100;
  }
}

+ (BOOL)prewarmDelayDisabled
{
  if (+[FRAnimationHelpers changeWithoutRestartingEnabled])
  {
    v2 = +[NSUserDefaults standardUserDefaults];
    unsigned __int8 v3 = [v2 BOOLForKey:@"animation_prewarm_animation_disabled"];

    return v3;
  }
  else
  {
    if (qword_1000EE118 != -1) {
      dispatch_once(&qword_1000EE118, &stru_1000C8C40);
    }
    return byte_1000EE110;
  }
}

+ (BOOL)synchronousImageLoadingEnabled
{
  if (+[FRAnimationHelpers changeWithoutRestartingEnabled])
  {
    v2 = +[NSUserDefaults standardUserDefaults];
    unsigned __int8 v3 = [v2 BOOLForKey:@"animation_synchronously_load_headerimage"];

    return v3;
  }
  else
  {
    if (qword_1000EE128 != -1) {
      dispatch_once(&qword_1000EE128, &stru_1000C8C60);
    }
    return byte_1000EE120;
  }
}

+ (BOOL)feedScaleDisabled
{
  if (+[FRAnimationHelpers changeWithoutRestartingEnabled])
  {
    v2 = +[NSUserDefaults standardUserDefaults];
    unsigned __int8 v3 = [v2 BOOLForKey:@"animation_alternative_feedscale_disabled"];

    return v3;
  }
  else
  {
    if (qword_1000EE138 != -1) {
      dispatch_once(&qword_1000EE138, &stru_1000C8C80);
    }
    return byte_1000EE130;
  }
}

@end