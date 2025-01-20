@interface NumericalValuesForKeyPath
@end

@implementation NumericalValuesForKeyPath

void ___NumericalValuesForKeyPath_block_invoke(void *a1)
{
  uint64_t v2 = [MEMORY[0x1E4F8A7F0] distinctValuesForKeyPath:a1[4] inManagedObjectContext:a1[5]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void ___NumericalValuesForKeyPath_block_invoke_3(uint64_t a1, void *a2)
{
  id v6 = a2;
  [v6 doubleValue];
  if (v3 > 0.0)
  {
    v4 = [*(id *)(a1 + 32) stringFromNumber:v6];
    v5 = [[PXLabeledValue alloc] initWithValue:v6 localizedLabel:v4];
    [*(id *)(a1 + 40) addObject:v5];
  }
}

uint64_t ___NumericalValuesForKeyPath_block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

@end