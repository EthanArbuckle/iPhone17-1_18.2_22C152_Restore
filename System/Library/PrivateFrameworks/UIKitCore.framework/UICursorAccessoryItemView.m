@interface UICursorAccessoryItemView
@end

@implementation UICursorAccessoryItemView

void __46___UICursorAccessoryItemView__recomputeColors__block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isSelected]) {
    +[UIColor systemFillColor];
  }
  else {
  v2 = +[UIColor clearColor];
  }
  [*(id *)(*(void *)(a1 + 32) + 472) setBackgroundColor:v2];

  if ([*(id *)(a1 + 32) isSelected]) {
    +[UIColor systemBlackColor];
  }
  else {
  v3 = +[UIColor systemWhiteColor];
  }
  [*(id *)(*(void *)(a1 + 32) + 464) setTintColor:v3];

  if ([*(id *)(a1 + 32) isSelected]) {
    +[UIColor systemBlackColor];
  }
  else {
  id v4 = +[UIColor systemWhiteColor];
  }
  [*(id *)(*(void *)(a1 + 32) + 456) setTextColor:v4];
}

uint64_t __45___UICursorAccessoryItemView_setHighlighted___block_invoke(uint64_t a1)
{
  CGAffineTransformMakeScale(&v5, 0.9, 0.9);
  v2 = *(void **)(a1 + 32);
  CGAffineTransform v4 = v5;
  return [v2 setTransform:&v4];
}

uint64_t __45___UICursorAccessoryItemView_setHighlighted___block_invoke_3(uint64_t a1)
{
  CGAffineTransformMakeScale(&v5, 1.0, 1.0);
  v2 = *(void **)(a1 + 32);
  CGAffineTransform v4 = v5;
  return [v2 setTransform:&v4];
}

@end