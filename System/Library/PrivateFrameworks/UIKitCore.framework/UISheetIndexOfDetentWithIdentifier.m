@interface UISheetIndexOfDetentWithIdentifier
@end

@implementation UISheetIndexOfDetentWithIdentifier

uint64_t ___UISheetIndexOfDetentWithIdentifier_block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 identifier];
  v4 = *(void **)(a1 + 32);
  id v5 = v3;
  id v6 = v4;
  v7 = v6;
  if (v5 == v6)
  {
    uint64_t v8 = 1;
  }
  else
  {
    uint64_t v8 = 0;
    if (v5 && v6) {
      uint64_t v8 = [v5 isEqual:v6];
    }
  }

  return v8;
}

@end