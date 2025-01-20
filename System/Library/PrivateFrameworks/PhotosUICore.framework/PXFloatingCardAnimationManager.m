@interface PXFloatingCardAnimationManager
- (PXFloatingCardAnimation)heightAnimation;
- (id)defaultHeightAnimation;
- (void)popHeightAnimation;
- (void)pushHeightAnimation:(id)a3;
@end

@implementation PXFloatingCardAnimationManager

- (void).cxx_destruct
{
}

- (void)popHeightAnimation
{
  unint64_t heightAnimationPushCount = self->_heightAnimationPushCount;
  if (!heightAnimationPushCount)
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"PXFloatingCardAnimationManager.m" lineNumber:218 description:@"Calls to popHeightAnimation must mirror push calls"];

    unint64_t heightAnimationPushCount = self->_heightAnimationPushCount;
  }
  unint64_t v4 = heightAnimationPushCount - 1;
  self->_unint64_t heightAnimationPushCount = v4;
  if (!v4)
  {
    heightAnimation = self->_heightAnimation;
    self->_heightAnimation = 0;
  }
}

- (void)pushHeightAnimation:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"PXFloatingCardAnimationManager.m", 208, @"Invalid parameter not satisfying: %@", @"animation" object file lineNumber description];

    id v6 = 0;
  }
  unint64_t heightAnimationPushCount = self->_heightAnimationPushCount;
  self->_unint64_t heightAnimationPushCount = heightAnimationPushCount + 1;
  if (!heightAnimationPushCount)
  {
    id v9 = v6;
    objc_storeStrong((id *)&self->_heightAnimation, a3);
    id v6 = v9;
  }
}

- (PXFloatingCardAnimation)heightAnimation
{
  heightAnimation = self->_heightAnimation;
  if (heightAnimation)
  {
    v3 = heightAnimation;
  }
  else
  {
    v3 = [(PXFloatingCardAnimationManager *)self defaultHeightAnimation];
  }
  return v3;
}

- (id)defaultHeightAnimation
{
  if (defaultHeightAnimation_onceToken != -1) {
    dispatch_once(&defaultHeightAnimation_onceToken, &__block_literal_global_5924);
  }
  v2 = (void *)defaultHeightAnimation_defaultAnimation;
  return v2;
}

void __56__PXFloatingCardAnimationManager_defaultHeightAnimation__block_invoke()
{
  uint64_t v0 = +[PXFloatingCardAnimation animationUsingDefaultSpringWithInitialVelocity:0.0 delay:0.0];
  v1 = (void *)defaultHeightAnimation_defaultAnimation;
  defaultHeightAnimation_defaultAnimation = v0;
}

@end