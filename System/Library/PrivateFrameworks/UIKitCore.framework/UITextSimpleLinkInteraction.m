@interface UITextSimpleLinkInteraction
@end

@implementation UITextSimpleLinkInteraction

void __42___UITextSimpleLinkInteraction_highlight___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) highlight];
  v2 = *(void **)(a1 + 32);
  v3 = (id *)(*(void *)(a1 + 40) + 136);
  objc_storeStrong(v3, v2);
}

void __42___UITextSimpleLinkInteraction_highlight___block_invoke_2(uint64_t a1)
{
  v2 = *(void **)(a1 + 40);
  id v11 = *(id *)(*(void *)(a1 + 32) + 136);
  id v3 = v2;
  if (v11 == v3)
  {

    v6 = v11;
  }
  else
  {
    v4 = v3;
    if (v11) {
      BOOL v5 = v3 == 0;
    }
    else {
      BOOL v5 = 1;
    }
    if (v5)
    {
    }
    else
    {
      char v7 = [v11 isEqual:v3];

      if (v7) {
        return;
      }
    }
    [*(id *)(*(void *)(a1 + 32) + 136) unhighlight];
    [*(id *)(a1 + 40) highlight];
    uint64_t v9 = a1 + 32;
    uint64_t v8 = *(void *)(a1 + 32);
    id v10 = *(id *)(v9 + 8);
    v6 = *(void **)(v8 + 136);
    *(void *)(v8 + 136) = v10;
  }
}

void __42___UITextSimpleLinkInteraction_highlight___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) unhighlight];
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = *(void **)(v2 + 136);
  *(void *)(v2 + 136) = 0;
}

@end