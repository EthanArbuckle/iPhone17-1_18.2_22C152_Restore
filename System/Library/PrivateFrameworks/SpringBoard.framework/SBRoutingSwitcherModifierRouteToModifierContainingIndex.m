@interface SBRoutingSwitcherModifierRouteToModifierContainingIndex
@end

@implementation SBRoutingSwitcherModifierRouteToModifierContainingIndex

id ___SBRoutingSwitcherModifierRouteToModifierContainingIndex_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  v6 = *(void **)(a1 + 32);
  id v7 = a3;
  v8 = [v6 objectForKey:v7];
  uint64_t v9 = [v8 unsignedIntegerValue];

  v10 = [NSString stringWithFormat:@"(<%@: %p>: %lu)", objc_opt_class(), v7, v9];

  if ([v5 length])
  {
    id v11 = [NSString stringWithFormat:@"%@, %@", v5, v10];
  }
  else
  {
    id v11 = v10;
  }
  v12 = v11;

  return v12;
}

@end