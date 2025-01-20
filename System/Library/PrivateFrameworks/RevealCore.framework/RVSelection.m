@interface RVSelection
+ (_NSRange)revealRangeAtIndex:(unint64_t)a3 selectedRanges:(id)a4 shouldUpdateSelection:(BOOL *)a5;
+ (_NSRange)searchRangeForString:(id)a3 aroundLocation:(unint64_t)a4;
+ (unint64_t)maxContextLength;
@end

@implementation RVSelection

+ (unint64_t)maxContextLength
{
  return 400;
}

+ (_NSRange)searchRangeForString:(id)a3 aroundLocation:(unint64_t)a4
{
  id v5 = a3;
  unint64_t v6 = [v5 length];
  unint64_t v7 = v6 - 1;
  if (v6 > a4) {
    unint64_t v7 = a4;
  }
  if (!a4) {
    unint64_t v7 = 0;
  }
  if (v7 >= 0x12D) {
    unint64_t v8 = v7 - 300;
  }
  else {
    unint64_t v8 = 0;
  }
  if (v7 + 200 >= v6 || v7 >= v6) {
    unint64_t v10 = v6;
  }
  else {
    unint64_t v10 = v7 + 200;
  }
  if (v10 == v8)
  {
LABEL_21:
    NSUInteger v12 = 0;
  }
  else
  {
    while (([v5 characterAtIndex:v8] & 0xFC00) == 0xDC00)
    {
      if (v10 == ++v8) {
        goto LABEL_21;
      }
    }
    uint64_t v11 = 0;
    while (([v5 characterAtIndex:v10 - 1 + v11] & 0xFC00) == 0xD800)
    {
      if (--v11 + v10 == v8) {
        goto LABEL_21;
      }
    }
    NSUInteger v12 = v10 - v8 + v11;
    a4 = v8;
  }

  NSUInteger v13 = a4;
  NSUInteger v14 = v12;
  result.length = v14;
  result.location = v13;
  return result;
}

+ (_NSRange)revealRangeAtIndex:(unint64_t)a3 selectedRanges:(id)a4 shouldUpdateSelection:(BOOL *)a5
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v7 = a4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v7);
        }
        unint64_t v11 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "rangeValue", (void)v18);
        if (a3 >= v11 && a3 - v11 < v12)
        {
          unint64_t v14 = v11;
          unint64_t v15 = v12;
          LODWORD(v8) = 1;
          goto LABEL_14;
        }
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v8);
  }
  unint64_t v15 = 0;
  unint64_t v14 = a3;
LABEL_14:

  if (a5) {
    *a5 = v8 ^ 1;
  }
  if (!v8 || (unint64_t)[v7 count] > 1 || v15 >= 0x1F4)
  {
    unint64_t v15 = 0;
    unint64_t v14 = a3;
  }

  NSUInteger v16 = v14;
  NSUInteger v17 = v15;
  result.length = v17;
  result.location = v16;
  return result;
}

@end