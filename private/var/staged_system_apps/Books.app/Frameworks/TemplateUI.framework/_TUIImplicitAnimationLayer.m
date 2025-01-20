@interface _TUIImplicitAnimationLayer
+ (id)defaultActionForKey:(id)a3;
@end

@implementation _TUIImplicitAnimationLayer

+ (id)defaultActionForKey:(id)a3
{
  if (qword_2DF548) {
    [(id)qword_2DF548 animationForKeyPath:a3];
  }
  else {
  v3 = +[NSNull null];
  }

  return v3;
}

@end