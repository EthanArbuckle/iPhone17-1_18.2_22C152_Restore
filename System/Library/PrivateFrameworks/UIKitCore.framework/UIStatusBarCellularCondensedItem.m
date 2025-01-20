@interface UIStatusBarCellularCondensedItem
@end

@implementation UIStatusBarCellularCondensedItem

BOOL __63___UIStatusBarCellularCondensedItem_applyUpdate_toDisplayItem___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 isEnabled])
  {
    v3 = [v2 string];
    BOOL v4 = [v3 length] != 0;
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

__CFString *__63___UIStatusBarCellularCondensedItem_applyUpdate_toDisplayItem___block_invoke_2(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  if ([v5 status] == 5 || (objc_msgSend(v5, "wifiCallingEnabled") & 1) != 0)
  {
    *a3 = 1;
LABEL_4:
    v6 = [v5 string];
    goto LABEL_5;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  *a3 = 0;
  if ([v5 status] != 1 && objc_msgSend(v5, "status") != 2) {
    goto LABEL_4;
  }
  v6 = @"– –";
LABEL_5:

  return v6;
}

uint64_t __69___UIStatusBarCellularCondensedItem_prepareAnimation_forDisplayItem___block_invoke(uint64_t result, uint64_t a2)
{
  if (!a2) {
    return [*(id *)(result + 32) setMarqueeRunning:1];
  }
  return result;
}

void __69___UIStatusBarCellularCondensedItem_prepareAnimation_forDisplayItem___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (!a2)
  {
    BOOL v4 = [*(id *)(a1 + 32) stringViews];
    id v5 = [v4 firstObject];
    [v5 setMarqueeRunning:1];

    id v7 = [*(id *)(a1 + 32) stringViews];
    v6 = [v7 lastObject];
    [v6 setMarqueeRunning:1];
  }
}

uint64_t __71___UIStatusBarCellularCondensedItem_entryForDisplayItemWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 isEnabled]) {
    uint64_t v3 = [v2 isBootstrapCellular] ^ 1;
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

uint64_t __71___UIStatusBarCellularCondensedItem_entryForDisplayItemWithIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 type]) {
    uint64_t v3 = [v2 isBootstrapCellular] ^ 1;
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

uint64_t __71___UIStatusBarCellularCondensedItem_entryForDisplayItemWithIdentifier___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 wifiCallingEnabled]) {
    uint64_t v3 = [v2 isBootstrapCellular] ^ 1;
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

@end