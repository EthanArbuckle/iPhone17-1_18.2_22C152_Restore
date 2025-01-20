@interface NSMutableSet
@end

@implementation NSMutableSet

void __68__NSMutableSet_WFNetworkProfile___equivalentExistingNetworkProfile___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v6 = a2;
  if (+[WFNetworkProfile networkProfileRepresentSameNetwork:toNetworkProfile:](WFNetworkProfile, "networkProfileRepresentSameNetwork:toNetworkProfile:", *(void *)(a1 + 32)))
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a3 = 1;
  }
}

uint64_t __62__NSMutableSet_WiFiKit__compareAndUpdateDuplicateScanRecords___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  uint64_t v6 = [*(id *)(a1 + 32) ssid];
  if (v6)
  {
    v7 = [v5 ssid];
    v8 = [*(id *)(a1 + 32) ssid];
    int v9 = [v7 isEqual:v8];

    if (v9)
    {
      uint64_t v6 = 1;
      *a3 = 1;
    }
    else
    {
      uint64_t v6 = 0;
    }
  }

  return v6;
}

@end