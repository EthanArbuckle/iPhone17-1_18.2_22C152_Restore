@interface NSCharacterSet(Cursive)
+ (uint64_t)arabicCharactersWithUniqueWritingRule;
+ (uint64_t)arabicGenericCharacters;
+ (uint64_t)arabicIsolatedCharacters;
+ (uint64_t)arabicPresentationFormCharacters;
+ (uint64_t)cyrillicCharacters;
+ (uint64_t)cyrillicCharactersWithUniqueWritingRule;
@end

@implementation NSCharacterSet(Cursive)

+ (uint64_t)cyrillicCharacters
{
  return objc_msgSend(MEMORY[0x263F08708], "characterSetWithRange:", 1024, 256);
}

+ (uint64_t)cyrillicCharactersWithUniqueWritingRule
{
  return [MEMORY[0x263F08708] characterSetWithCharactersInString:@"йёєб"];
}

+ (uint64_t)arabicCharactersWithUniqueWritingRule
{
  return [MEMORY[0x263F08708] characterSetWithCharactersInString:@"ﺐﺒﺑﺖﺘﺗﺚﺜﺛﺞﺠﺟﺦﺨﺧﺬﺰﺶﺸﺷﺾﻀﺿﻆﻈﻇﻎﻐﻏﻒﻔﻓﻖﻘﻗﻚﻦﻨﻧﻲﻴﻳﺂﺔﺆﺓﷲﻹﻼ"];
}

+ (uint64_t)arabicIsolatedCharacters
{
  return [MEMORY[0x263F08708] characterSetWithCharactersInString:@"ﺍﺏﺕﺙﺝﺡﺥﺩﺫﺭﺯﺱﺵﺹﺽﻁﻅﻉﻍﻑﻕﻙﻝﻡﻥﻩﻭﻱﺁﺓﻯﺀﻹﷲ"];
}

+ (uint64_t)arabicGenericCharacters
{
  return objc_msgSend(MEMORY[0x263F08708], "characterSetWithRange:", 1536, 256);
}

+ (uint64_t)arabicPresentationFormCharacters
{
  return objc_msgSend(MEMORY[0x263F08708], "characterSetWithRange:", 65136, 144);
}

@end