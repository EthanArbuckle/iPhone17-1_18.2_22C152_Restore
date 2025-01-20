@interface UIHomeAffordanceBSActionToClient
@end

@implementation UIHomeAffordanceBSActionToClient

uint64_t __63___UIHomeAffordanceBSActionToClient_appendDescriptionToStream___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  if ([*(id *)(a1 + 40) actionType]) {
    v2 = &stru_1ED0E84C0;
  }
  else {
    v2 = @"doubleTapGestureDidSucceed";
  }
  return [v1 appendString:v2 withName:@"actionType"];
}

@end