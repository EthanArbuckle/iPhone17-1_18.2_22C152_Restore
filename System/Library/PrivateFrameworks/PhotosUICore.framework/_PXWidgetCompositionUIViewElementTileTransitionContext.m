@interface _PXWidgetCompositionUIViewElementTileTransitionContext
- (PXBasicTileAnimationOptions)animationOptions;
- (id)alongsideAnimation;
- (id)alongsideAnimationCompletion;
- (void)setAlongsideAnimation:(id)a3;
- (void)setAlongsideAnimationCompletion:(id)a3;
- (void)setAnimationOptions:(id)a3;
@end

@implementation _PXWidgetCompositionUIViewElementTileTransitionContext

- (void).cxx_destruct
{
  objc_storeStrong(&self->_alongsideAnimationCompletion, 0);
  objc_storeStrong(&self->_alongsideAnimation, 0);
  objc_storeStrong((id *)&self->_animationOptions, 0);
}

- (void)setAlongsideAnimationCompletion:(id)a3
{
}

- (id)alongsideAnimationCompletion
{
  return self->_alongsideAnimationCompletion;
}

- (void)setAlongsideAnimation:(id)a3
{
}

- (id)alongsideAnimation
{
  return self->_alongsideAnimation;
}

- (void)setAnimationOptions:(id)a3
{
}

- (PXBasicTileAnimationOptions)animationOptions
{
  return self->_animationOptions;
}

@end