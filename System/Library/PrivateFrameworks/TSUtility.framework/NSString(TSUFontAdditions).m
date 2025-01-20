@interface NSString(TSUFontAdditions)
- (double)tsu_boundingSizeWithFont:()TSUFontAdditions;
@end

@implementation NSString(TSUFontAdditions)

- (double)tsu_boundingSizeWithFont:()TSUFontAdditions
{
  v7[1] = *MEMORY[0x263EF8340];
  uint64_t v4 = [a3 platformFont];
  if (!v4) {
    return *MEMORY[0x263F001B0];
  }
  uint64_t v6 = *MEMORY[0x263F1C238];
  v7[0] = v4;
  objc_msgSend(a1, "sizeWithAttributes:", objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v7, &v6, 1));
  return result;
}

@end