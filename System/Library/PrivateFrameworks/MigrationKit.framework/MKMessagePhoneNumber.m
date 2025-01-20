@interface MKMessagePhoneNumber
+ (id)addCountryCallingCode:(id)a3;
+ (id)addDefaultCountryCallingCode:(id)a3 number:(id)a4;
+ (id)countryCallingCode:(id)a3;
@end

@implementation MKMessagePhoneNumber

+ (id)addCountryCallingCode:(id)a3
{
  id v3 = a3;
  if (addCountryCallingCode__onceToken[0] != -1) {
    dispatch_once(addCountryCallingCode__onceToken, &__block_literal_global_5);
  }
  if (![v3 length]) {
    goto LABEL_39;
  }
  int v4 = [v3 hasPrefix:@"+"];
  id v5 = objc_alloc_init(MEMORY[0x263F089D8]);
  id v6 = objc_alloc_init(MEMORY[0x263F089D8]);
  if (![v3 length])
  {
LABEL_16:
    if (v4)
    {
      id v11 = [@"+" stringByAppendingString:v5];
      goto LABEL_18;
    }
    uint64_t v13 = PNCopyBestGuessNormalizedNumberForCountry();
    if (v13)
    {
      v14 = (void *)v13;
      v15 = [NSString stringWithUTF8String:v13];
      if ([v15 length])
      {
        id v16 = v15;

        id v3 = v16;
      }
      free(v14);
      long long v25 = *MEMORY[0x263F36D88];
      long long v26 = *(_OWORD *)(MEMORY[0x263F36D88] + 16);
      long long v27 = *(_OWORD *)(MEMORY[0x263F36D88] + 32);
      long long v28 = *(_OWORD *)(MEMORY[0x263F36D88] + 48);
      id v3 = v3;
      [v3 UTF8String];
      if (PNDecomposeForCountry())
      {
        if ((void)v25)
        {
          v17 = (void *)[[NSString alloc] initWithUTF8String:(void)v25];
          v18 = [@"+" stringByAppendingString:v17];
        }
        else
        {
          v18 = [@"+" stringByAppendingString:addCountryCallingCode__internationalCallingCodeDefault];
        }
        v20 = &stru_26DF6A8B0;
        if ((void)v26 && DWORD2(v26)) {
          v20 = (__CFString *)[[NSString alloc] initWithBytes:(void)v26 length:DWORD2(v26) encoding:4];
        }
        v21 = &stru_26DF6A8B0;
        if ((void)v27 && DWORD2(v27)) {
          v21 = (__CFString *)[[NSString alloc] initWithBytes:(void)v27 length:DWORD2(v27) encoding:4];
        }
        v22 = &stru_26DF6A8B0;
        if ((void)v28 && DWORD2(v28)) {
          v22 = (__CFString *)[[NSString alloc] initWithBytes:(void)v28 length:DWORD2(v28) encoding:4];
        }
        uint64_t v23 = [NSString stringWithFormat:@"%@%@%@%@", v18, v20, v21, v22];

        id v3 = (id)v23;
        goto LABEL_39;
      }
    }
    uint64_t v19 = +[MKMessagePhoneNumber addDefaultCountryCallingCode:addCountryCallingCode__internationalCallingCodeDefault number:v3];

    id v3 = (id)v19;
    goto LABEL_39;
  }
  unint64_t v7 = 0;
  char v8 = 0;
  do
  {
    while (1)
    {
      uint64_t v9 = [v3 characterAtIndex:v7];
      uint64_t v10 = v9;
      if ((v9 - 48) <= 9)
      {
        objc_msgSend(v5, "appendFormat:", @"%C", v9);
        objc_msgSend(v6, "appendFormat:", @"%C", v10);
        goto LABEL_10;
      }
      if ((v9 & 0xFFFFFFDF) - 65 >= 0x1A) {
        break;
      }
      objc_msgSend(v6, "appendFormat:", @"%C", v9);
      ++v7;
      char v8 = 1;
      if (v7 >= [v3 length]) {
        goto LABEL_15;
      }
    }
    if (v9 == 64) {
      goto LABEL_19;
    }
LABEL_10:
    ++v7;
  }
  while (v7 < [v3 length]);
  if ((v8 & 1) == 0) {
    goto LABEL_16;
  }
LABEL_15:
  id v11 = v6;
LABEL_18:
  id v12 = v11;

  id v3 = v12;
LABEL_19:

LABEL_39:
  return v3;
}

void __46__MKMessagePhoneNumber_addCountryCallingCode___block_invoke()
{
  v0 = [MEMORY[0x263EFF960] currentLocale];
  uint64_t v1 = [v0 countryCode];
  v2 = (void *)addCountryCallingCode__countryCode;
  addCountryCallingCode__countryCode = v1;

  if (![(id)addCountryCallingCode__countryCode length])
  {
    id v3 = (void *)addCountryCallingCode__countryCode;
    addCountryCallingCode__countryCode = @"US";
  }
  uint64_t v4 = _PNCopyInternationalCodeForCountry();
  id v5 = (void *)addCountryCallingCode__internationalCallingCodeDefault;
  addCountryCallingCode__internationalCallingCodeDefault = v4;

  if (![(id)addCountryCallingCode__internationalCallingCodeDefault length])
  {
    id v6 = (void *)addCountryCallingCode__internationalCallingCodeDefault;
    addCountryCallingCode__internationalCallingCodeDefault = @"1";
  }
}

+ (id)addDefaultCountryCallingCode:(id)a3 number:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  unint64_t v7 = objc_msgSend(v6, "stringByReplacingOccurrencesOfString:withString:options:range:", @"[^0-9]", &stru_26DF6A8B0, 1024, 0, objc_msgSend(v6, "length"));

  if ([v7 hasPrefix:@"0"])
  {
    uint64_t v8 = [v7 substringFromIndex:1];

    unint64_t v7 = (void *)v8;
  }
  uint64_t v9 = [NSString stringWithFormat:@"+%@%@", v5, v7];

  return v9;
}

+ (id)countryCallingCode:(id)a3
{
  id v3 = (void *)_PNCopyInternationalCodeForCountry();
  return v3;
}

@end