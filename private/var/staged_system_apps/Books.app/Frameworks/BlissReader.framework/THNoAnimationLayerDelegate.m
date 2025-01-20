@interface THNoAnimationLayerDelegate
+ (id)_singletonAlloc;
+ (id)allocWithZone:(_NSZone *)a3;
+ (id)sharedInstance;
- (id)actionForLayer:(id)a3 forKey:(id)a4;
- (unint64_t)retainCount;
@end

@implementation THNoAnimationLayerDelegate

+ (id)_singletonAlloc
{
  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___THNoAnimationLayerDelegate;
  return [super allocWithZone:0];
}

+ (id)sharedInstance
{
  id result = (id)qword_5732C8;
  if (!qword_5732C8)
  {
    objc_sync_enter(a1);
    if (!qword_5732C8)
    {
      id v4 = objc_msgSend(objc_msgSend(a1, "_singletonAlloc"), "init");
      __dmb(0xBu);
      qword_5732C8 = (uint64_t)v4;
      if (!v4) {
        [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[THNoAnimationLayerDelegate sharedInstance]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Utility/THNoAnimationLayerDelegate.m") lineNumber:16 description:@"Couldn't create singleton instance of %@", a1];
      }
    }
    objc_sync_exit(a1);
    return (id)qword_5732C8;
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

- (id)actionForLayer:(id)a3 forKey:(id)a4
{
  return +[NSNull null];
}

@end