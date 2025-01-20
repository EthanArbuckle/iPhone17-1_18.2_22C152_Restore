@interface UIDuoShadowView
@end

@implementation UIDuoShadowView

uint64_t __39___UIDuoShadowView_setSecondaryShadow___block_invoke(uint64_t a1)
{
  v2 = [UIView alloc];
  [*(id *)(a1 + 32) bounds];
  uint64_t v3 = -[UIView initWithFrame:](v2, "initWithFrame:");
  uint64_t v4 = *(void *)(a1 + 32);
  v5 = *(void **)(v4 + 408);
  *(void *)(v4 + 408) = v3;

  v6 = [*(id *)(*(void *)(a1 + 32) + 408) layer];
  [v6 setShadowPathIsBounds:1];

  v7 = [*(id *)(*(void *)(a1 + 32) + 408) layer];
  [v7 setPunchoutShadow:1];

  v8 = [*(id *)(a1 + 32) layer];
  v9 = v8;
  if (v8)
  {
    [v8 cornerRadii];
  }
  else
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
  }
  v10 = [*(id *)(*(void *)(a1 + 32) + 408) layer];
  v12[0] = v13;
  v12[1] = v14;
  v12[2] = v15;
  v12[3] = v16;
  [v10 setCornerRadii:v12];

  return [*(id *)(a1 + 32) addSubview:*(void *)(*(void *)(a1 + 32) + 408)];
}

@end