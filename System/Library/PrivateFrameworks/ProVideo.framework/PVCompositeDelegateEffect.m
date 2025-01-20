@interface PVCompositeDelegateEffect
+ (void)registerEffects;
- (BOOL)loadEffect;
- (PVCompositeDelegate)renderDelegate;
- (PVCompositeDelegateEffect)initWithEffectID:(id)a3;
- (id)userContext;
- (void)releaseEffect;
- (void)setRenderDelegate:(id)a3;
- (void)setUserContext:(id)a3;
@end

@implementation PVCompositeDelegateEffect

+ (void)registerEffects
{
  objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithObjectsAndKeys:", @"CompositeDelegate", @"FFEffectProperty_DisplayName", @"Internal", @"FFEffectProperty_Category", @"effect.video.compositor", @"FFEffectProperty_EffectType", 0);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  +[PVEffect registerEffectClass:forEffectID:withProperties:](PVEffect, "registerEffectClass:forEffectID:withProperties:", objc_opt_class(), @"F3D8E4D0-686B-44C6-8966-E50856A94959");
  v2 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithObjectsAndKeys:", @"CompositeDelegate", @"displayName", @"BuiltIn", @"contentGroup", 0);
  v3 = +[PVContentRegistry sharedInstance];
  [v3 registerContentClass:objc_opt_class() forID:@"F3D8E4D0-686B-44C6-8966-E50856A94959" type:@"effect.video.compositor" withProperties:v2];
}

- (PVCompositeDelegateEffect)initWithEffectID:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PVCompositeDelegateEffect;
  result = [(PVEffect *)&v4 initWithEffectID:a3];
  if (result) {
    atomic_store(0, (unsigned int *)&result->_loaded);
  }
  return result;
}

- (BOOL)loadEffect
{
  uint64_t v3 = [(PVCompositeDelegateEffect *)self renderDelegate];
  if (v3)
  {
    objc_super v4 = (void *)v3;
    v5 = [(PVCompositeDelegateEffect *)self renderDelegate];
    char v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0 && !atomic_fetch_add(&self->_loaded.__a_.__a_value, 1u))
    {
      v7 = [(PVCompositeDelegateEffect *)self renderDelegate];
      v8 = [(PVCompositeDelegateEffect *)self userContext];
      [v7 loadWithUserContext:v8];
    }
  }
  v10.receiver = self;
  v10.super_class = (Class)PVCompositeDelegateEffect;
  return [(PVEffect *)&v10 loadEffect];
}

- (void)releaseEffect
{
  uint64_t v3 = [(PVCompositeDelegateEffect *)self renderDelegate];
  if (v3)
  {
    objc_super v4 = (void *)v3;
    v5 = [(PVCompositeDelegateEffect *)self renderDelegate];
    char v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0 && atomic_fetch_add(&self->_loaded.__a_.__a_value, 0xFFFFFFFF) == 1)
    {
      v7 = [(PVCompositeDelegateEffect *)self renderDelegate];
      v8 = [(PVCompositeDelegateEffect *)self userContext];
      [v7 unloadWithUserContext:v8];
    }
  }
  v9.receiver = self;
  v9.super_class = (Class)PVCompositeDelegateEffect;
  [(PVEffect *)&v9 releaseEffect];
}

- (PVCompositeDelegate)renderDelegate
{
  return self->_renderDelegate;
}

- (void)setRenderDelegate:(id)a3
{
}

- (id)userContext
{
  return self->_userContext;
}

- (void)setUserContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_userContext, 0);

  objc_storeStrong((id *)&self->_renderDelegate, 0);
}

@end