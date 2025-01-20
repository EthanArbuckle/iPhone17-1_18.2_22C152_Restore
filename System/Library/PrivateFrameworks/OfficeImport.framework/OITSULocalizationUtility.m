@interface OITSULocalizationUtility
+ (id)displayStringForIndexSet:(id)a3;
+ (id)displayStringForStrings:(id)a3;
+ (id)displayStringForStrings:(id)a3 itemSeparator:(id)a4;
+ (id)displayStringForStrings:(id)a3 itemSeparator:(id)a4 lastItemSeparator:(id)a5;
@end

@implementation OITSULocalizationUtility

+ (id)displayStringForIndexSet:(id)a3
{
  v4 = (void *)[MEMORY[0x263F089D8] string];
  if (displayStringForIndexSet__onceToken != -1) {
    dispatch_once(&displayStringForIndexSet__onceToken, &__block_literal_global_17);
  }
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __53__OITSULocalizationUtility_displayStringForIndexSet___block_invoke_2;
  v6[3] = &unk_264D60FB8;
  v6[4] = v4;
  [a3 enumerateRangesUsingBlock:v6];
  return v4;
}

id __53__OITSULocalizationUtility_displayStringForIndexSet___block_invoke()
{
  displayStringForIndexSet__sIndexSeparator = (uint64_t)(id)[(id)SFUBundle() localizedStringForKey:@", ", &stru_26EBF24D8, @"TSUtility" value table];
  id result = (id)[(id)SFUBundle() localizedStringForKey:@"-" value:&stru_26EBF24D8 table:@"TSUtility"];
  displayStringForIndexSet__sRangeSeparator = (uint64_t)result;
  return result;
}

uint64_t __53__OITSULocalizationUtility_displayStringForIndexSet___block_invoke_2(uint64_t a1, uint64_t a2, unint64_t a3)
{
  if ([*(id *)(a1 + 32) length]) {
    [*(id *)(a1 + 32) appendString:displayStringForIndexSet__sIndexSeparator];
  }
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "appendString:", objc_msgSend(MEMORY[0x263F08A30], "localizedStringFromNumber:numberStyle:", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", a2), 1));
  if (a3 >= 2)
  {
    [*(id *)(a1 + 32) appendString:displayStringForIndexSet__sRangeSeparator];
    v7 = *(void **)(a1 + 32);
    uint64_t v8 = objc_msgSend(MEMORY[0x263F08A30], "localizedStringFromNumber:numberStyle:", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", a3 + a2 - 1), 1);
    return [v7 appendString:v8];
  }
  return result;
}

+ (id)displayStringForStrings:(id)a3
{
  if (displayStringForStrings__onceToken != -1) {
    dispatch_once(&displayStringForStrings__onceToken, &__block_literal_global_15_0);
  }
  uint64_t v5 = displayStringForStrings__sSeparator;
  return (id)[a1 displayStringForStrings:a3 itemSeparator:v5];
}

id __52__OITSULocalizationUtility_displayStringForStrings___block_invoke()
{
  id result = (id)[(id)SFUBundle() localizedStringForKey:@", ", &stru_26EBF24D8, @"TSUtility" value table];
  displayStringForStrings__sSeparator = (uint64_t)result;
  return result;
}

+ (id)displayStringForStrings:(id)a3 itemSeparator:(id)a4
{
  return (id)[a1 displayStringForStrings:a3 itemSeparator:a4 lastItemSeparator:0];
}

+ (id)displayStringForStrings:(id)a3 itemSeparator:(id)a4 lastItemSeparator:(id)a5
{
  uint64_t v8 = (void *)[MEMORY[0x263F089D8] string];
  uint64_t v9 = [a3 count];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __84__OITSULocalizationUtility_displayStringForStrings_itemSeparator_lastItemSeparator___block_invoke;
  v11[3] = &unk_264D61200;
  v11[4] = v8;
  v11[5] = a4;
  v11[6] = a5;
  v11[7] = v9;
  [a3 enumerateObjectsUsingBlock:v11];
  return v8;
}

uint64_t __84__OITSULocalizationUtility_displayStringForStrings_itemSeparator_lastItemSeparator___block_invoke(void *a1, uint64_t a2, unint64_t a3)
{
  if (a3)
  {
    unint64_t v5 = a1[7] - 1;
    v6 = (void *)a1[4];
    if (v5 > a3 || (uint64_t v7 = a1[6]) == 0) {
      uint64_t v7 = a1[5];
    }
    [v6 appendString:v7];
  }
  uint64_t v8 = (void *)a1[4];
  return [v8 appendString:a2];
}

@end