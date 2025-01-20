@interface UIControlMenuUpdateVisibleMenu
@end

@implementation UIControlMenuUpdateVisibleMenu

id ___UIControlMenuUpdateVisibleMenu_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(unsigned char *)(v1 + 24))
  {
    id v2 = +[UIMenu menuWithChildren:MEMORY[0x1E4F1CBF0]];
  }
  else
  {
    *(unsigned char *)(v1 + 24) = 1;
    id v2 = *(id *)(a1 + 32);
  }
  return v2;
}

@end