@interface PDAnimateEffectBehavior
- (BOOL)hasProperties;
- (BOOL)hasTransition;
- (NSMutableDictionary)propertyMap;
- (PDAnimateEffectBehavior)init;
- (int)transition;
- (void)setPropertyMap:(id)a3;
- (void)setTransition:(int)a3;
@end

@implementation PDAnimateEffectBehavior

- (PDAnimateEffectBehavior)init
{
  v6.receiver = self;
  v6.super_class = (Class)PDAnimateEffectBehavior;
  v2 = [(PDAnimateBehavior *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    mPropertyMap = v2->mPropertyMap;
    v2->mPropertyMap = (NSMutableDictionary *)v3;
  }
  return v2;
}

- (void)setTransition:(int)a3
{
  self->mHasTransition = 1;
  self->mTransition = a3;
}

- (BOOL)hasTransition
{
  return self->mHasTransition;
}

- (int)transition
{
  return self->mTransition;
}

- (BOOL)hasProperties
{
  return [(NSMutableDictionary *)self->mPropertyMap count] != 0;
}

- (NSMutableDictionary)propertyMap
{
  return self->mPropertyMap;
}

- (void)setPropertyMap:(id)a3
{
}

- (void).cxx_destruct
{
}

@end