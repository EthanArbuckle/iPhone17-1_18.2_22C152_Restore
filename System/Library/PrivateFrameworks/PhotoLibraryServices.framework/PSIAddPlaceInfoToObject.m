@interface PSIAddPlaceInfoToObject
@end

@implementation PSIAddPlaceInfoToObject

void ___PSIAddPlaceInfoToObject_block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v5 = a2;
  if ([v5 length])
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = ___PSIAddPlaceInfoToObject_block_invoke_2;
    v8[3] = &unk_1E586CD18;
    id v6 = v5;
    id v9 = v6;
    v7 = (void *)MEMORY[0x19F38D650](v8);
    if (a3 <= 0xC && ((1 << a3) & 0x1420) != 0
      || [*(id *)(a1 + 32) indexOfObjectPassingTest:v7] == 0x7FFFFFFFFFFFFFFFLL)
    {
      [*(id *)(a1 + 40) addContentString:v6 category:(__int16)a3 owningCategory:0];
    }
  }
}

uint64_t ___PSIAddPlaceInfoToObject_block_invoke_2(uint64_t a1, void *a2)
{
  v3 = [a2 text];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

@end