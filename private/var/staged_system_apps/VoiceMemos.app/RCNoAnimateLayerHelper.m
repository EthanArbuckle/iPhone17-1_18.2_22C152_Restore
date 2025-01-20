@interface RCNoAnimateLayerHelper
+ (id)sharedNoAnimationHelper;
- (id)actionForLayer:(id)a3 forKey:(id)a4;
@end

@implementation RCNoAnimateLayerHelper

+ (id)sharedNoAnimationHelper
{
  if (qword_10026A7A0 != -1) {
    dispatch_once(&qword_10026A7A0, &stru_100221ED0);
  }
  v2 = (void *)qword_10026A798;

  return v2;
}

- (id)actionForLayer:(id)a3 forKey:(id)a4
{
  v4 = +[NSNull null];

  return v4;
}

@end