@interface UIAction(Utilities)
+ (id)vk_itemWithTitle:()Utilities subtitle:;
+ (uint64_t)vk_itemWithTitle:()Utilities;
@end

@implementation UIAction(Utilities)

+ (uint64_t)vk_itemWithTitle:()Utilities
{
  return objc_msgSend(a1, "vk_itemWithTitle:subtitle:", a3, 0);
}

+ (id)vk_itemWithTitle:()Utilities subtitle:
{
  v5 = &stru_1F35566F8;
  if (a3) {
    v5 = a3;
  }
  v6 = v5;
  id v7 = a4;
  v8 = [MEMORY[0x1E4F426E8] actionWithTitle:v6 image:0 identifier:0 handler:&__block_literal_global_19];

  [v8 setDiscoverabilityTitle:v7];
  return v8;
}

@end