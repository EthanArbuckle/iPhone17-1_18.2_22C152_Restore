@interface SBHWidgetAddSheetTransitionContext
- (SBHAddWidgetSheetGalleryCollectionViewCell)sourceCell;
- (SBHWidgetAddSheetAnimationController)animationController;
- (SBHWidgetAddSheetTransitionContext)initWithSourceCell:(id)a3;
- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5;
- (void)interruptAnimation;
- (void)setAnimationController:(id)a3;
- (void)setSourceCell:(id)a3;
@end

@implementation SBHWidgetAddSheetTransitionContext

- (SBHWidgetAddSheetTransitionContext)initWithSourceCell:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBHWidgetAddSheetTransitionContext;
  v6 = [(SBHWidgetAddSheetTransitionContext *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_sourceCell, a3);
  }

  return v7;
}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  animationController = self->_animationController;
  if (!animationController)
  {
    v7 = [[SBHWidgetAddSheetAnimationController alloc] initWithSourceCell:self->_sourceCell];
    v8 = self->_animationController;
    self->_animationController = v7;

    animationController = self->_animationController;
  }
  return animationController;
}

- (void)interruptAnimation
{
}

- (SBHAddWidgetSheetGalleryCollectionViewCell)sourceCell
{
  return self->_sourceCell;
}

- (void)setSourceCell:(id)a3
{
}

- (SBHWidgetAddSheetAnimationController)animationController
{
  return self->_animationController;
}

- (void)setAnimationController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animationController, 0);
  objc_storeStrong((id *)&self->_sourceCell, 0);
}

@end