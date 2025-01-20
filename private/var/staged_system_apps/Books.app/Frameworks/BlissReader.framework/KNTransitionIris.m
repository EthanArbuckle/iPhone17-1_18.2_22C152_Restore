@interface KNTransitionIris
+ (BOOL)isTransition;
+ (id)defaultAttributes;
+ (id)supportedTypes;
- (void)renderFrameWithContext:(id)a3;
@end

@implementation KNTransitionIris

+ (BOOL)isTransition
{
  return 1;
}

+ (id)supportedTypes
{
  return &off_4999E0;
}

+ (id)defaultAttributes
{
  CFStringRef v4 = @"KNTransitionAttributesDuration";
  v5 = &off_498FB8;
  v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];

  return v2;
}

- (void)renderFrameWithContext:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)KNTransitionIris;
  [(KNIrisBase *)&v3 renderFrameWithContext:a3];
}

@end