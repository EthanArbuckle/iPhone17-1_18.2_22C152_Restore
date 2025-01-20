@interface UIPreviewActionSheetItemView
@end

@implementation UIPreviewActionSheetItemView

void __54___UIPreviewActionSheetItemView_setSelected_animated___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) selected]) {
    +[UIColor colorWithWhite:0.74902 alpha:0.3];
  }
  else {
  id v2 = +[UIColor clearColor];
  }
  [*(id *)(a1 + 32) setBackgroundColor:v2];
}

uint64_t __54___UIPreviewActionSheetItemView_setSelected_animated___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end