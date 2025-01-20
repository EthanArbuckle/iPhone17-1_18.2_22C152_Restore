@interface THApplicationSettings
+ (id)_singletonAlloc;
+ (id)allocWithZone:(_NSZone *)a3;
+ (id)sharedSettings;
- (double)flowFontScale;
- (double)flowFontScaleForFontSize:(unint64_t)a3;
- (unint64_t)flowSizeScale;
- (unint64_t)retainCount;
- (void)setFlowSizeScale:(unint64_t)a3;
@end

@implementation THApplicationSettings

+ (id)_singletonAlloc
{
  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___THApplicationSettings;
  return [super allocWithZone:0];
}

+ (id)sharedSettings
{
  id result = (id)qword_5731C8;
  if (!qword_5731C8)
  {
    objc_sync_enter(a1);
    if (!qword_5731C8)
    {
      id v4 = objc_msgSend(objc_msgSend(a1, "_singletonAlloc"), "init");
      __dmb(0xBu);
      qword_5731C8 = (uint64_t)v4;
      if (!v4) {
        [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[THApplicationSettings sharedSettings]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THApplicationSettings.m") lineNumber:46 description:@"Couldn't create singleton instance of %@", a1];
      }
    }
    objc_sync_exit(a1);
    return (id)qword_5731C8;
  }
  return result;
}

+ (id)allocWithZone:(_NSZone *)a3
{
  return 0;
}

- (unint64_t)retainCount
{
  return 0xFFFFFFFFLL;
}

- (unint64_t)flowSizeScale
{
  v2 = +[NSUserDefaults standardUserDefaults];
  id v3 = [(NSUserDefaults *)v2 objectForKey:kTHApplicationSettingsFlowSizeScale];
  if (!v3) {
    return 3;
  }
  unint64_t result = (unint64_t)[v3 unsignedIntegerValue];
  if (result >= 0xB) {
    return 11;
  }
  return result;
}

- (void)setFlowSizeScale:(unint64_t)a3
{
  if (a3 >= 0xB) {
    unint64_t v3 = 11;
  }
  else {
    unint64_t v3 = a3;
  }
  id v4 = +[NSUserDefaults standardUserDefaults];
  [(NSUserDefaults *)v4 setInteger:v3 forKey:kTHApplicationSettingsFlowSizeScale];
  v5 = +[NSNotificationCenter defaultCenter];
  v6 = THFlowFontScaleChangedNotification;

  [(NSNotificationCenter *)v5 postNotificationName:v6 object:0];
}

- (double)flowFontScale
{
  return dbl_344078[[(THApplicationSettings *)self flowSizeScale]];
}

- (double)flowFontScaleForFontSize:(unint64_t)a3
{
  return dbl_344078[a3];
}

@end