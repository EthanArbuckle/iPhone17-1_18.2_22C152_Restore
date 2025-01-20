@interface UIDynamicAnimationGroup
@end

@implementation UIDynamicAnimationGroup

uint64_t __48___UIDynamicAnimationGroup__animateForInterval___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(*(void *)(a1 + 32) + 24);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __42___UIDynamicAnimationGroup_setAnimations___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(*(void *)(a1 + 32) + 24);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 4);
  }
  return result;
}

uint64_t __41___UIDynamicAnimationGroup_addAnimation___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(*(void *)(a1 + 32) + 24);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 4);
  }
  return result;
}

@end