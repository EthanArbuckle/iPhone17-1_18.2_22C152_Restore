@interface _UIHoverEmptyEffect
+ (id)effect;
- (id)_init;
@end

@implementation _UIHoverEmptyEffect

+ (id)effect
{
  v2 = (void *)effect___shared;
  if (!effect___shared)
  {
    id v3 = [[_UIHoverEmptyEffect alloc] _init];
    v4 = (void *)effect___shared;
    effect___shared = (uint64_t)v3;

    v2 = (void *)effect___shared;
  }
  return v2;
}

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)_UIHoverEmptyEffect;
  return [(_UIHoverEmptyEffect *)&v3 init];
}

@end