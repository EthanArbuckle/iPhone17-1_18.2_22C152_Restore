@interface NSString(TSUEmailAddressAdditions)
- (BOOL)tsu_isLegalEmailAddress;
- (id)tsu_uncommentedAddress;
- (id)tsu_uncommentedAddressRespectingGroups;
@end

@implementation NSString(TSUEmailAddressAdditions)

- (id)tsu_uncommentedAddress
{
  unint64_t v2 = [a1 length];
  v3 = (char *)NSZoneMalloc(0, 2 * v2 + 2);
  v4 = v3;
  uint64_t v5 = MEMORY[0x263EF8318];
  v6 = v3;
  if (v2)
  {
    unint64_t v7 = 0;
    int v8 = 0;
    char v9 = 0;
    char v19 = 0;
    char v20 = 1;
    v6 = v3;
    do
    {
      unsigned int v10 = [a1 characterAtIndex:v7];
      unsigned int v11 = v10;
      if (v10 == 92)
      {
        if (v7 + 1 >= v2)
        {
          if ((v9 & 1) == 0)
          {
            if (v8 < 1) {
              goto LABEL_18;
            }
LABEL_15:
            char v9 = 0;
            v8 -= v10 == 41;
            goto LABEL_24;
          }
LABEL_10:
          *(_WORD *)v6 = v10;
          v6 += 2;
          v9 &= v10 != 34;
          goto LABEL_24;
        }
        *(_WORD *)v6 = 92;
        *((_WORD *)v6 + 1) = [a1 characterAtIndex:v7 + 1];
        v6 += 4;
        ++v7;
      }
      else
      {
        if (v9) {
          goto LABEL_10;
        }
        if (v10 == 40)
        {
          char v9 = 0;
          ++v8;
        }
        else
        {
          if (v8 > 0) {
            goto LABEL_15;
          }
          if (v10 != 60)
          {
            if ((v19 & (v10 == 62)) != 0) {
              break;
            }
            if (v10 > 0x7F)
            {
              if (__maskrune(v10, 0x4000uLL))
              {
LABEL_19:
                char v9 = 0;
                if ((v20 & 1) == 0)
                {
                  *(_WORD *)v6 = 32;
                  v6 += 2;
                }
                char v20 = 1;
                goto LABEL_24;
              }
            }
            else
            {
LABEL_18:
              if ((*(_DWORD *)(v5 + 4 * v10 + 60) & 0x4000) != 0) {
                goto LABEL_19;
              }
            }
            char v20 = 0;
            *(_WORD *)v6 = v11;
            v6 += 2;
            v9 |= v11 == 34;
            goto LABEL_24;
          }
          char v9 = 0;
          char v19 = 1;
          v6 = v4;
        }
      }
LABEL_24:
      ++v7;
    }
    while (v7 < v2);
  }
  uint64_t v12 = v6 - v4;
  do
  {
    v13 = v6;
    uint64_t v14 = v12;
    if (v6 <= v4) {
      break;
    }
    v6 -= 2;
    unint64_t v15 = *((unsigned __int16 *)v13 - 1);
    int v16 = v15 > 0x7F ? __maskrune(v15, 0x4000uLL) : *(_DWORD *)(v5 + 4 * v15 + 60) & 0x4000;
    uint64_t v12 = v14 - 2;
  }
  while (v16);
  *(_WORD *)v13 = 0;
  v17 = (void *)[[NSString alloc] initWithCharacters:v4 length:v14 >> 1];
  NSZoneFree(0, v4);
  return v17;
}

- (id)tsu_uncommentedAddressRespectingGroups
{
  uint64_t v2 = [a1 rangeOfString:@"@"];
  uint64_t v3 = [a1 rangeOfString:@"<"];
  if (v2 == 0x7FFFFFFFFFFFFFFFLL && v3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v5 = a1;
  }
  else
  {
    objc_msgSend(a1, "tsu_uncommentedAddress");
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (BOOL)tsu_isLegalEmailAddress
{
  uint64_t v2 = objc_msgSend(a1, "tsu_uncommentedAddressRespectingGroups");
  uint64_t v3 = (void *)tsu_isLegalEmailAddress_re;
  if (!tsu_isLegalEmailAddress_re)
  {
    v4 = [[OISFURegularExpression alloc] initWithExpressionString:@"^([^][:space:]()<>@,;:\\\".[]+(\\.[^][:space:]()<>@,;:\\\".[]+)*(@[[:alnum:]_+-]+(\\.[[:alnum:]_+-]+)*)?|([^]()<>@,;:\\\".[]|\"[^\"\\\r\n]*\")*<[^][:space:]()<>@,;:\\\".[]+(\\.[^][:space:]()<>@,;:\\\".[]+)*(@[[:alnum:]_+-]+(\\.[[:alnum:]_+-]+)*)?>)$"];
    id v5 = (void *)tsu_isLegalEmailAddress_re;
    tsu_isLegalEmailAddress_re = (uint64_t)v4;

    uint64_t v3 = (void *)tsu_isLegalEmailAddress_re;
  }
  uint64_t v6 = [v3 getBytesForString:v2 lossByte:10];
  uint64_t v7 = [v2 length];
  uint64_t v8 = objc_msgSend((id)tsu_isLegalEmailAddress_re, "matchedRangeForCString:range:subexpressionRanges:count:", v6, 0, v7, 0, 0);
  uint64_t v10 = v9;
  unint64_t v11 = [a1 rangeOfString:@"@"];
  unint64_t v12 = [a1 rangeOfString:@"." options:4];
  BOOL v13 = 0;
  if (!v8) {
    BOOL v13 = v10 == v7 && v11 != 0x7FFFFFFFFFFFFFFFLL && v12 != 0x7FFFFFFFFFFFFFFFLL && v12 > v11;
  }

  return v13;
}

@end