@interface UIHoverAutomaticEffect
+ (UIHoverAutomaticEffect)effect;
- (UIHoverAutomaticEffect)init;
@end

@implementation UIHoverAutomaticEffect

- (UIHoverAutomaticEffect)init
{
  v3.receiver = self;
  v3.super_class = (Class)UIHoverAutomaticEffect;
  return [(UIHoverAutomaticEffect *)&v3 init];
}

+ (UIHoverAutomaticEffect)effect
{
  return (UIHoverAutomaticEffect *)sub_1858B5A80((uint64_t)a1, (uint64_t)a2, &qword_1E8FB0B30, (void **)&qword_1E8FD5A88);
}

@end