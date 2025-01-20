@interface SBFluidSwitcherTouchPassThroughScrollView
+ (BOOL)superclassRespondsToSetVelocityScaleFactor;
+ (BOOL)superclassRespondsToVelocityScaleFactor;
- (double)velocityScaleFactor;
- (void)setVelocityScaleFactor:(double)a3;
@end

@implementation SBFluidSwitcherTouchPassThroughScrollView

+ (BOOL)superclassRespondsToVelocityScaleFactor
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __84__SBFluidSwitcherTouchPassThroughScrollView_superclassRespondsToVelocityScaleFactor__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (superclassRespondsToVelocityScaleFactor_once != -1) {
    dispatch_once(&superclassRespondsToVelocityScaleFactor_once, block);
  }
  return superclassRespondsToVelocityScaleFactor_superclassRespondsToVelocityScaleFactor;
}

uint64_t __84__SBFluidSwitcherTouchPassThroughScrollView_superclassRespondsToVelocityScaleFactor__block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "superclass"), "instancesRespondToSelector:", NSSelectorFromString(&cfstr_Velocityscalef.isa));
  superclassRespondsToVelocityScaleFactor_superclassRespondsToVelocityScaleFactor = result;
  return result;
}

+ (BOOL)superclassRespondsToSetVelocityScaleFactor
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __87__SBFluidSwitcherTouchPassThroughScrollView_superclassRespondsToSetVelocityScaleFactor__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (superclassRespondsToSetVelocityScaleFactor_once != -1) {
    dispatch_once(&superclassRespondsToSetVelocityScaleFactor_once, block);
  }
  return superclassRespondsToSetVelocityScaleFactor_superclassRespondsToSetVelocityScaleFactor;
}

uint64_t __87__SBFluidSwitcherTouchPassThroughScrollView_superclassRespondsToSetVelocityScaleFactor__block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "superclass"), "instancesRespondToSelector:", NSSelectorFromString(&cfstr_Setvelocitysca.isa));
  superclassRespondsToSetVelocityScaleFactor_superclassRespondsToSetVelocityScaleFactor = result;
  return result;
}

- (double)velocityScaleFactor
{
  if (![(id)objc_opt_class() superclassRespondsToVelocityScaleFactor]) {
    return 0.001;
  }
  v4.receiver = self;
  v4.super_class = (Class)SBFluidSwitcherTouchPassThroughScrollView;
  [(SBFluidSwitcherTouchPassThroughScrollView *)&v4 _velocityScaleFactor];
  return result;
}

- (void)setVelocityScaleFactor:(double)a3
{
  if ([(id)objc_opt_class() superclassRespondsToSetVelocityScaleFactor])
  {
    v5.receiver = self;
    v5.super_class = (Class)SBFluidSwitcherTouchPassThroughScrollView;
    [(SBFluidSwitcherTouchPassThroughScrollView *)&v5 _setVelocityScaleFactor:a3];
  }
}

@end