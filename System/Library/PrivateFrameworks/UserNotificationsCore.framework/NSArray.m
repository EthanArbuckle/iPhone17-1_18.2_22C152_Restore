@interface NSArray
@end

@implementation NSArray

void __57__NSArray_UserNotificationsCore__unc_map_usingLibrarian___block_invoke(void *a1, uint64_t a2)
{
  v2 = (void *)a1[4];
  uint64_t v3 = (*(void (**)(void, uint64_t, void))(a1[6] + 16))(a1[6], a2, a1[5]);
  id v5 = (id)v3;
  if (v3)
  {
    [v2 addObject:v3];
  }
  else
  {
    v4 = [MEMORY[0x263EFF9D0] null];
    [v2 addObject:v4];
  }
}

@end