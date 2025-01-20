@interface UIIndexPathIdentityTracker
@end

@implementation UIIndexPathIdentityTracker

void __71___UIIndexPathIdentityTracker__mappingIdentifierForSanitizedIndexPath___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v8 = a2;
  if ([a3 isEqual:*(void *)(a1 + 32)])
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

void __69___UIIndexPathIdentityTracker__identifierBasedUpdateWithUpdateItems___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  uint64_t v6 = [a3 length];
  id v7 = *(id *)(*(void *)(a1 + 32) + 24);
  id v11 = v5;
  if (v6 == 1)
  {
    uint64_t v8 = [v7 indexForSectionIdentifier:v11];
    if (v8 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v9 = [MEMORY[0x1E4F28D58] indexPathWithIndex:v8];
      goto LABEL_8;
    }
  }
  else
  {
    v9 = [v7 indexPathForItemIdentifier:v11];
    if ([v9 section] != 0x7FFFFFFFFFFFFFFFLL && objc_msgSend(v9, "item") != 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_8;
    }
  }
  v9 = 0;
LABEL_8:

  v10 = *(void **)(*(void *)(a1 + 32) + 32);
  if (v9) {
    [v10 setObject:v9 forKey:v11];
  }
  else {
    [v10 removeObjectForKey:v11];
  }
}

void __62___UIIndexPathIdentityTracker__manuallyUpdateWithUpdateItems___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a2;
  uint64_t v7 = _manuallyUpdateSanitizedIndexPath(a3, v5, 1);
  uint64_t v8 = *(void **)(*(void *)(a1 + 40) + 32);
  id v9 = (id)v7;
  if (v7) {
    [v8 setObject:v7 forKey:v6];
  }
  else {
    [v8 removeObjectForKey:v6];
  }
}

void __62___UIIndexPathIdentityTracker__manuallyUpdateWithUpdateItems___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a2;
  uint64_t v7 = _manuallyUpdateSanitizedIndexPath(a3, v5, 0);
  uint64_t v8 = *(void **)(*(void *)(a1 + 40) + 32);
  id v9 = (id)v7;
  if (v7) {
    [v8 setObject:v7 forKey:v6];
  }
  else {
    [v8 removeObjectForKey:v6];
  }
}

uint64_t __62___UIIndexPathIdentityTracker__manuallyUpdateWithUpdateItems___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(*(void *)(a1 + 32) + 32) setObject:a3 forKey:a2];
}

@end