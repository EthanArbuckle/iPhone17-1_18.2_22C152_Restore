@interface SBMoveFloatingOverFullScreenGestureSwitcherModifier
- (SBSwitcherAsyncRenderingAttributes)asyncRenderingAttributesForAppLayout:(id)a3;
- (id)handleTransitionEvent:(id)a3;
@end

@implementation SBMoveFloatingOverFullScreenGestureSwitcherModifier

- (id)handleTransitionEvent:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SBMoveFloatingOverFullScreenGestureSwitcherModifier;
  id v4 = a3;
  v5 = [(SBGestureSwitcherModifier *)&v8 handleTransitionEvent:v4];
  uint64_t v6 = objc_msgSend(v4, "phase", v8.receiver, v8.super_class);

  if (v6 == 2) {
    [(SBChainableModifier *)self setState:1];
  }
  return v5;
}

- (SBSwitcherAsyncRenderingAttributes)asyncRenderingAttributesForAppLayout:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F42948] currentDevice];
  int v6 = objc_msgSend(v5, "sbf_isLowEndForSlideOverMoveGesture");

  if (v6)
  {
    unsigned __int16 v7 = SBSwitcherAsyncRenderingAttributesMake(1u, 0);
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)SBMoveFloatingOverFullScreenGestureSwitcherModifier;
    unsigned __int16 v7 = (unsigned __int16)[(SBMoveFloatingOverFullScreenGestureSwitcherModifier *)&v10 asyncRenderingAttributesForAppLayout:v4];
  }
  SBSwitcherAsyncRenderingAttributes v8 = (SBSwitcherAsyncRenderingAttributes)v7;

  return v8;
}

@end