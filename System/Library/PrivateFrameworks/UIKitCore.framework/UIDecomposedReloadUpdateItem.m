@interface UIDecomposedReloadUpdateItem
- (BOOL)isDecomposedFromReload;
- (id)pairedItem;
@end

@implementation UIDecomposedReloadUpdateItem

- (void).cxx_destruct
{
}

- (BOOL)isDecomposedFromReload
{
  return 1;
}

- (id)pairedItem
{
  if (WeakRetained)
  {
    WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 5);
    uint64_t v1 = vars8;
  }
  return WeakRetained;
}

@end