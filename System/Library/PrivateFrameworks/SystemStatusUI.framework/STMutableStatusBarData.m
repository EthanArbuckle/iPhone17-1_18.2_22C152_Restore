@interface STMutableStatusBarData
@end

@implementation STMutableStatusBarData

void __68__STMutableStatusBarData_Testing__subsetOfEntryKeys_withPercentage___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:"))
  {
    [*(id *)(a1 + 40) addObject:v6];
    if ([*(id *)(a1 + 40) count] == *(void *)(a1 + 48)) {
      *a4 = 1;
    }
  }
}

uint64_t __45__STMutableStatusBarData_Testing__legacyData__block_invoke(uint64_t a1, unsigned int a2, void *a3)
{
  if (a3) {
    char v5 = [a3 isEnabled];
  }
  else {
    char v5 = 0;
  }
  *(unsigned char *)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) + a2) = v5;
  return *(unsigned __int8 *)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) + a2);
}

@end