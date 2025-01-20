@interface UIMainMenuSystem
@end

@implementation UIMainMenuSystem

void __34___UIMainMenuSystem__sharedSystem__block_invoke(uint64_t a1)
{
  uint64_t v1 = [objc_alloc(*(Class *)(a1 + 32)) _init];
  v2 = (void *)qword_1EB25CB18;
  qword_1EB25CB18 = v1;
}

id __91___UIMainMenuSystem__buildMenuWithBuilder_fromResponderChain_atLocation_inCoordinateSpace___block_invoke(uint64_t a1, void *a2)
{
  v3 = (void *)MEMORY[0x1E4F1CA48];
  id v4 = a2;
  v5 = objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count") + 1);
  v6 = [*(id *)(a1 + 32) children];
  [v5 addObjectsFromArray:v6];

  [v5 addObjectsFromArray:v4];
  return v5;
}

@end