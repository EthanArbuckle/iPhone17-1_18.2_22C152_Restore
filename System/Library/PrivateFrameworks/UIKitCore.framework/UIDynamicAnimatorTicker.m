@interface UIDynamicAnimatorTicker
- (UIDynamicAnimator)animator;
- (void)_displayLinkTick:(id)a3;
- (void)_uiUpdateSequenceTick:(double)a3;
- (void)setAnimator:(id)a3;
@end

@implementation UIDynamicAnimatorTicker

- (void)_displayLinkTick:(id)a3
{
  [a3 timestamp];
  double v5 = v4;
  id v6 = [(UIDynamicAnimatorTicker *)self animator];
  [v6 _performAnimationTickForTimestamp:v5];
}

- (void)_uiUpdateSequenceTick:(double)a3
{
  id v4 = [(UIDynamicAnimatorTicker *)self animator];
  [v4 _performAnimationTickForTimestamp:a3];
}

- (UIDynamicAnimator)animator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_animator);
  return (UIDynamicAnimator *)WeakRetained;
}

- (void)setAnimator:(id)a3
{
}

- (void).cxx_destruct
{
}

@end