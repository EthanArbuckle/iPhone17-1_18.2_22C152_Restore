@interface NSCharacterSet(Arabic)
+ (uint64_t)numberCombiningCharacterSet;
@end

@implementation NSCharacterSet(Arabic)

+ (uint64_t)numberCombiningCharacterSet
{
  return [MEMORY[0x263F08708] characterSetWithCharactersInString:@",.:٬٫"];
}

@end