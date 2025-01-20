@interface PUIDPointerStateUpdateHandlerCollection
- (id)contentMatchMoveSourceTransitionCompletion;
- (id)overlayEffectTransitionCompletion;
- (id)portalSourceTransitionCompletion;
- (id)shapeTransitionCompletion;
- (id)visibilityTransitionCompletion;
- (void)performAllHandlersWithFinished:(BOOL)a3 retargeted:(BOOL)a4;
- (void)setContentMatchMoveSourceTransitionCompletion:(id)a3;
- (void)setOverlayEffectTransitionCompletion:(id)a3;
- (void)setPortalSourceTransitionCompletion:(id)a3;
- (void)setShapeTransitionCompletion:(id)a3;
- (void)setVisibilityTransitionCompletion:(id)a3;
@end

@implementation PUIDPointerStateUpdateHandlerCollection

- (void)performAllHandlersWithFinished:(BOOL)a3 retargeted:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  shapeTransitionCompletion = (void (**)(id, BOOL, BOOL))self->_shapeTransitionCompletion;
  if (shapeTransitionCompletion) {
    shapeTransitionCompletion[2](shapeTransitionCompletion, a3, a4);
  }
  visibilityTransitionCompletion = (void (**)(id, BOOL, BOOL))self->_visibilityTransitionCompletion;
  if (visibilityTransitionCompletion) {
    visibilityTransitionCompletion[2](visibilityTransitionCompletion, v5, v4);
  }
  portalSourceTransitionCompletion = (void (**)(id, BOOL, BOOL))self->_portalSourceTransitionCompletion;
  if (portalSourceTransitionCompletion) {
    portalSourceTransitionCompletion[2](portalSourceTransitionCompletion, v5, v4);
  }
  overlayEffectTransitionCompletion = (void (**)(id, BOOL, BOOL))self->_overlayEffectTransitionCompletion;
  if (overlayEffectTransitionCompletion) {
    overlayEffectTransitionCompletion[2](overlayEffectTransitionCompletion, v5, v4);
  }
  id contentMatchMoveSourceTransitionCompletion = self->_contentMatchMoveSourceTransitionCompletion;
  if (contentMatchMoveSourceTransitionCompletion)
  {
    v12 = (void (*)(void))*((void *)contentMatchMoveSourceTransitionCompletion + 2);
    v12();
  }
}

- (id)portalSourceTransitionCompletion
{
  return self->_portalSourceTransitionCompletion;
}

- (void)setPortalSourceTransitionCompletion:(id)a3
{
}

- (id)contentMatchMoveSourceTransitionCompletion
{
  return self->_contentMatchMoveSourceTransitionCompletion;
}

- (void)setContentMatchMoveSourceTransitionCompletion:(id)a3
{
}

- (id)overlayEffectTransitionCompletion
{
  return self->_overlayEffectTransitionCompletion;
}

- (void)setOverlayEffectTransitionCompletion:(id)a3
{
}

- (id)shapeTransitionCompletion
{
  return self->_shapeTransitionCompletion;
}

- (void)setShapeTransitionCompletion:(id)a3
{
}

- (id)visibilityTransitionCompletion
{
  return self->_visibilityTransitionCompletion;
}

- (void)setVisibilityTransitionCompletion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_visibilityTransitionCompletion, 0);
  objc_storeStrong(&self->_shapeTransitionCompletion, 0);
  objc_storeStrong(&self->_overlayEffectTransitionCompletion, 0);
  objc_storeStrong(&self->_contentMatchMoveSourceTransitionCompletion, 0);
  objc_storeStrong(&self->_portalSourceTransitionCompletion, 0);
}

@end