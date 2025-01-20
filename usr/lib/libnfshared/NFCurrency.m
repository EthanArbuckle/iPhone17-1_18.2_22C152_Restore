@interface NFCurrency
+ (id)encodeBCDAmount:(unint64_t)a3;
+ (id)getCurrencyStringCodeFromNumericCode:(unsigned int)a3;
+ (int)getFractionDigitsFromCurrencyStringCode:(id)a3;
+ (unint64_t)decodeBCDAmount:(id)a3;
@end

@implementation NFCurrency

+ (unint64_t)decodeBCDAmount:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 bytes];
  if ([v3 length])
  {
    unint64_t v5 = 0;
    unint64_t v6 = 0;
    do
    {
      unint64_t v6 = (*(unsigned char *)(v4 + v5) & 0xF) + 10 * (*(unsigned __int8 *)(v4 + v5) >> 4) + 100 * v6;
      ++v5;
    }
    while ([v3 length] > v5);
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

+ (id)encodeBCDAmount:(unint64_t)a3
{
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithLength:6];
  if (a3)
  {
    uint64_t v5 = 5;
    do
    {
      char v9 = (a3 % 0xA) | (16 * (a3 / 0xA - 10 * ((a3 / 0xA * (unsigned __int128)0x199999999999999AuLL) >> 64)));
      [v4 replaceBytesInRange:v5 withBytes:&v9 length:1];
      if (v5-- == 0) {
        break;
      }
      BOOL v7 = a3 > 0x63;
      a3 /= 0x64uLL;
    }
    while (v7);
  }

  return v4;
}

+ (id)getCurrencyStringCodeFromNumericCode:(unsigned int)a3
{
  v17[1] = *MEMORY[0x1E4F143B8];
  if (qword_1EB4D28B0 != -1) {
    dispatch_once(&qword_1EB4D28B0, &__block_literal_global_4);
  }
  uint64_t v4 = [NSNumber numberWithUnsignedLong:(a3 & 0xF) + 10 * (a3 >> 4) + 100 * ((a3 >> 8) & 0xF) + 1000 * ((unsigned __int16)a3 >> 12)];
  id v5 = [(id)_MergedGlobals_5 objectForKey:v4];
  if (!v5)
  {
    v17[0] = 0;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    unint64_t v6 = [MEMORY[0x1E4F1CA20] ISOCurrencyCodes];
    id v5 = (id)[v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v5)
    {
      uint64_t v7 = *(void *)v13;
      while (2)
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v13 != v7) {
            objc_enumerationMutation(v6);
          }
          char v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
          [v9 getCharacters:v17 range:0, 3];
          int NumericCode = ucurr_getNumericCode();
          if ([v4 intValue] == NumericCode)
          {
            [(id)_MergedGlobals_5 setObject:v9 forKey:v4];
            id v5 = v9;
            goto LABEL_14;
          }
        }
        id v5 = (id)[v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }
LABEL_14:
  }

  return v5;
}

uint64_t __51__NFCurrency_getCurrencyStringCodeFromNumericCode___block_invoke()
{
  _MergedGlobals_5 = objc_opt_new();

  return MEMORY[0x1F41817F8]();
}

+ (int)getFractionDigitsFromCurrencyStringCode:(id)a3
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v7[0] = 0;
  if ((unint64_t)[v3 length] > 2) {
    uint64_t v4 = 3;
  }
  else {
    uint64_t v4 = [v3 length];
  }
  [v3 getCharacters:v7 range:0, v4];
  int DefaultFractionDigits = ucurr_getDefaultFractionDigits();

  return DefaultFractionDigits;
}

@end