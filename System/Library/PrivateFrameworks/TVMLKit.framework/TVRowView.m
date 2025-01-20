@interface TVRowView
@end

@implementation TVRowView

void __28___TVRowView_setComponents___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v5 = (id *)(*(void *)(a1 + 32) + 480);
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v5);

  if (WeakRetained == v6) {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
  }
}

@end