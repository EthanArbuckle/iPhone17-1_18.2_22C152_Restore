@interface NSMutableDictionary
@end

@implementation NSMutableDictionary

uint64_t __52__NSMutableDictionary_Utilities__mt_removeNaNValues__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v3 = (void *)MEMORY[0x263F087B0];
  id v4 = a3;
  v5 = [v3 notANumber];
  uint64_t v6 = [v4 isEqual:v5];

  return v6;
}

@end