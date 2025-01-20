@interface ATLCurrency
+ (BOOL)checkSorted;
+ (id)currencyCodeForNumber:(unint64_t)a3 exponentOut:(signed __int16 *)a4;
@end

@implementation ATLCurrency

+ (id)currencyCodeForNumber:(unint64_t)a3 exponentOut:(signed __int16 *)a4
{
  if (a3 <= 0x3E8)
  {
    v8 = (unsigned __int16 *)&countryEntries;
    unint64_t v9 = 165;
    do
    {
      unint64_t v10 = v9 >> 1;
      v11 = &v8[4 * (v9 >> 1)];
      uint64_t v13 = *(void *)v11;
      v12 = v11 + 4;
      v9 += ~(v9 >> 1);
      if ((__int16)v13 < (int)a3) {
        v8 = v12;
      }
      else {
        unint64_t v9 = v10;
      }
    }
    while (v9);
    if (v8 == (unsigned __int16 *)&unk_1CA601E36 || *v8 != (unsigned __int16)a3)
    {
      v6 = 0;
    }
    else
    {
      if (a4) {
        *a4 = v8[1];
      }
      v6 = [NSString stringWithCString:v8 + 2 encoding:1];
    }
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

+ (BOOL)checkSorted
{
  uint64_t v2 = 8u;
  LOWORD(v3) = 8;
  do
  {
    __int16 v4 = v3;
    int v3 = *(__int16 *)((char *)&countryEntries + v2);
    if (v2 == 1312) {
      break;
    }
    v2 += 8;
  }
  while (v3 > v4);
  return v3 > v4;
}

@end