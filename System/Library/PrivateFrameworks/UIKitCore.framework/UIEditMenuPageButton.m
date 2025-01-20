@interface UIEditMenuPageButton
@end

@implementation UIEditMenuPageButton

void __55___UIEditMenuPageButton__configureButtonWithGroupName___block_invoke(uint64_t a1, void *a2)
{
  id v16 = a2;
  v3 = [v16 configuration];
  if ([v16 isHighlighted])
  {
    v4 = [*(id *)(a1 + 32) menuHighlightBackgroundColor];
    v5 = [v3 background];
    [v5 setBackgroundColor:v4];

    v6 = [*(id *)(a1 + 32) menuHighlightBackgroundEffect];
    v7 = [v3 background];
    [v7 setVisualEffect:v6];

    v8 = [v3 background];
    v9 = v8;
    uint64_t v10 = 0;
  }
  else
  {
    v11 = +[UIColor clearColor];
    v12 = [v3 background];
    [v12 setBackgroundColor:v11];

    v13 = [*(id *)(a1 + 32) menuBackgroundEffect];
    v14 = [v3 background];
    [v14 setVisualEffect:v13];

    uint64_t v15 = *(void *)(a1 + 40);
    v8 = [v3 background];
    v9 = v8;
    uint64_t v10 = v15;
  }
  [v8 _setVisualEffectGroupName:v10];

  [v16 setConfiguration:v3];
}

@end