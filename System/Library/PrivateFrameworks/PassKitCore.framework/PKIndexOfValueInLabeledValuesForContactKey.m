@interface PKIndexOfValueInLabeledValuesForContactKey
@end

@implementation PKIndexOfValueInLabeledValuesForContactKey

uint64_t ___PKIndexOfValueInLabeledValuesForContactKey_block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  if ([v6 isEqualIgnoringIdentifiers:*(void *)(a1 + 32)])
  {
    uint64_t v7 = 1;
  }
  else if ([*(id *)(a1 + 40) isEqualToString:*MEMORY[0x1E4F1AF10]])
  {
    v8 = [v6 value];
    v9 = (void *)[v8 mutableCopy];
    PKCorrectCountryCodeIfNecessaryForPostalAddress(v9);
    objc_claimAutoreleasedReturnValue();
    v10 = [v6 labeledValueBySettingValue:v9];

    uint64_t v7 = [v10 isEqualIgnoringIdentifiers:*(void *)(a1 + 32)];
  }
  else
  {
    uint64_t v7 = 0;
  }
  *a4 = v7;

  return v7;
}

@end