@interface UIEditMenuAppendMenuToSnapshot
@end

@implementation UIEditMenuAppendMenuToSnapshot

void ___UIEditMenuAppendMenuToSnapshot_block_invoke(uint64_t a1, void *a2)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([v3 _isVisible])
  {
    if ([v3 _isInlineGroup])
    {
      _UIEditMenuAppendMenuToSnapshot(v3, *(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 40));
    }
    else
    {
      v4 = +[_UIEditMenuListItem itemWithMenuElement:v3 preferredDisplayMode:*(void *)(a1 + 40)];
      [v4 setWantsPasteSlotView:*(unsigned __int8 *)(a1 + 48)];
      v5 = *(void **)(a1 + 32);
      v7[0] = v4;
      v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
      [v5 appendItemsWithIdentifiers:v6];
    }
  }
}

@end