@interface PVMotionEffectComponent
+ (id)motionEffectPropertyKeyToPublishedParameterNameMap;
- (BOOL)motionEffect:(id)a3 propertiesDisableCache:(id)a4 time:(id *)a5 forcePosterFrame:(BOOL)a6;
- (BOOL)motionEffect:(id)a3 shouldInvalidateCachedRenderForProperty:(id)a4 oldValue:(id)a5 newValue:(id)a6;
- (PVMotionEffect)motionEffect;
- (PVMotionEffectComponent)initWithMotionEffect:(id)a3;
- (id)motionEffectPropertyKeysThatInvalidateCachedRender:(id)a3;
- (void)effect:(id)a3 updateProperties:(id)a4 allProperties:(id)a5;
- (void)motionEffect:(id)a3 didBecomeReady:(const void *)a4 properties:(id)a5;
- (void)motionEffect:(id)a3 didLoad:(const void *)a4;
- (void)motionEffect:(id)a3 willOpenMedia:(const void *)a4 properties:(id)a5;
- (void)motionEffect:(id)a3 willRender:(const void *)a4 properties:(id)a5 time:(id *)a6;
- (void)motionEffectDidFailToLoad:(id)a3;
- (void)motionEffectDidStartLoading:(id)a3;
- (void)setMotionEffect:(id)a3;
@end

@implementation PVMotionEffectComponent

- (PVMotionEffectComponent)initWithMotionEffect:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PVMotionEffectComponent;
  v5 = [(PVEffectComponent *)&v8 initWithEffect:v4];
  v6 = v5;
  if (v5) {
    [(PVMotionEffectComponent *)v5 setMotionEffect:v4];
  }

  return v6;
}

- (void)effect:(id)a3 updateProperties:(id)a4 allProperties:(id)a5
{
  v10.receiver = self;
  v10.super_class = (Class)PVMotionEffectComponent;
  [(PVEffectComponent *)&v10 effect:a3 updateProperties:a4 allProperties:a5];
  p_motionEffect = &self->_motionEffect;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_motionEffect);
  [WeakRetained assertDocumentIsLocked];

  id v8 = objc_loadWeakRetained((id *)p_motionEffect);
  [v8 assertDocumentStatusIsLoadedOrReady];

  id v9 = objc_loadWeakRetained((id *)p_motionEffect);
  [v9 assertInspectablePropertiesAreLocked];
}

- (void)motionEffectDidStartLoading:(id)a3
{
  p_motionEffect = &self->_motionEffect;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_motionEffect);
  [WeakRetained assertDocumentIsLocked];

  id v5 = objc_loadWeakRetained((id *)p_motionEffect);
  [v5 assertDocumentStatusIsInProgress];
}

- (void)motionEffect:(id)a3 didLoad:(const void *)a4
{
  p_motionEffect = &self->_motionEffect;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_motionEffect);
  [WeakRetained assertDocumentIsLocked];

  id v6 = objc_loadWeakRetained((id *)p_motionEffect);
  [v6 assertDocumentStatusIsLoaded];
}

- (void)motionEffect:(id)a3 willOpenMedia:(const void *)a4 properties:(id)a5
{
  p_motionEffect = &self->_motionEffect;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_motionEffect);
  [WeakRetained assertDocumentIsLocked];

  id v7 = objc_loadWeakRetained((id *)p_motionEffect);
  [v7 assertDocumentStatusIsLoaded];

  id v8 = objc_loadWeakRetained((id *)p_motionEffect);
  [v8 assertInspectablePropertiesAreLocked];
}

- (void)motionEffect:(id)a3 didBecomeReady:(const void *)a4 properties:(id)a5
{
  p_motionEffect = &self->_motionEffect;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_motionEffect);
  [WeakRetained assertDocumentIsLocked];

  id v7 = objc_loadWeakRetained((id *)p_motionEffect);
  [v7 assertDocumentStatusIsReady];

  id v8 = objc_loadWeakRetained((id *)p_motionEffect);
  [v8 assertInspectablePropertiesAreLocked];
}

- (void)motionEffect:(id)a3 willRender:(const void *)a4 properties:(id)a5 time:(id *)a6
{
  p_motionEffect = &self->_motionEffect;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_motionEffect);
  [WeakRetained assertDocumentIsLocked];

  id v8 = objc_loadWeakRetained((id *)p_motionEffect);
  [v8 assertDocumentStatusIsReady];

  id v9 = objc_loadWeakRetained((id *)p_motionEffect);
  [v9 assertInspectablePropertiesAreLocked];
}

- (void)motionEffectDidFailToLoad:(id)a3
{
  p_motionEffect = &self->_motionEffect;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_motionEffect);
  [WeakRetained assertDocumentIsLocked];

  id v5 = objc_loadWeakRetained((id *)p_motionEffect);
  [v5 assertDocumentStatusIsError];
}

+ (id)motionEffectPropertyKeyToPublishedParameterNameMap
{
  return 0;
}

- (BOOL)motionEffect:(id)a3 propertiesDisableCache:(id)a4 time:(id *)a5 forcePosterFrame:(BOOL)a6
{
  return 0;
}

- (id)motionEffectPropertyKeysThatInvalidateCachedRender:(id)a3
{
  return 0;
}

- (BOOL)motionEffect:(id)a3 shouldInvalidateCachedRenderForProperty:(id)a4 oldValue:(id)a5 newValue:(id)a6
{
  return 0;
}

- (PVMotionEffect)motionEffect
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_motionEffect);

  return (PVMotionEffect *)WeakRetained;
}

- (void)setMotionEffect:(id)a3
{
}

- (void).cxx_destruct
{
}

@end