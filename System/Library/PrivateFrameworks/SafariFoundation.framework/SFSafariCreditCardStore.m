@interface SFSafariCreditCardStore
+ (id)savedCreditCardsWithError:(id *)a3;
+ (void)showCreditCardSettings;
@end

@implementation SFSafariCreditCardStore

+ (id)savedCreditCardsWithError:(id *)a3
{
  v17[7] = *MEMORY[0x263EF8340];
  uint64_t v4 = *MEMORY[0x263F170B0];
  v16[0] = *MEMORY[0x263F16E80];
  v16[1] = v4;
  uint64_t v5 = *MEMORY[0x263F171C8];
  uint64_t v6 = *MEMORY[0x263F17090];
  v16[2] = *MEMORY[0x263F171B8];
  v16[3] = v6;
  v17[2] = v5;
  v17[3] = @"SafariCreditCardEntries";
  uint64_t v7 = *MEMORY[0x263F17528];
  v16[4] = *MEMORY[0x263F17400];
  v16[5] = v7;
  v17[4] = *MEMORY[0x263F17408];
  v17[5] = MEMORY[0x263EFFA80];
  v17[0] = @"com.apple.safari.credit-cards";
  v17[1] = MEMORY[0x263EFFA88];
  v16[6] = *MEMORY[0x263F17520];
  v17[6] = MEMORY[0x263EFFA88];
  CFDictionaryRef v8 = [NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:7];
  v15 = 0;
  OSStatus v9 = SecItemCopyMatching(v8, (CFTypeRef *)&v15);
  int v10 = v9;
  if (v9 != -25300)
  {
    if (!v9)
    {
      v11 = v15;
      v12 = objc_msgSend(v15, "safari_mapAndFilterObjectsUsingBlock:", &__block_literal_global_8);

      goto LABEL_9;
    }
    v13 = WBS_LOG_CHANNEL_PREFIXAutoFill();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      +[SFSafariCreditCardStore savedCreditCardsWithError:](v10, v13);
    }
    if (a3) {
      *a3 = (id)SecCopyLastError();
    }
  }
  v12 = (void *)MEMORY[0x263EFFA68];
LABEL_9:

  return v12;
}

id __53__SFSafariCreditCardStore_savedCreditCardsWithError___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = [MEMORY[0x263F08AC0] propertyListWithData:a2 options:0 format:0 error:0];
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v3 = [MEMORY[0x263EFF9A0] dictionary];
    uint64_t v4 = [v2 objectForKeyedSubscript:@"CardNameUIString"];
    if (v4) {
      [v3 setObject:v4 forKeyedSubscript:@"CardNameUIString"];
    }

    uint64_t v5 = [v2 objectForKeyedSubscript:@"CardNumber"];
    if (v5) {
      [v3 setObject:v5 forKeyedSubscript:@"CardNumber"];
    }

    uint64_t v6 = [v2 objectForKeyedSubscript:@"ExpirationDate"];
    if (v6) {
      [v3 setObject:v6 forKeyedSubscript:@"ExpirationDate"];
    }

    uint64_t v7 = [v2 objectForKeyedSubscript:@"CardholderName"];
    if (v7) {
      [v3 setObject:v7 forKeyedSubscript:@"CardholderName"];
    }

    CFDictionaryRef v8 = [v2 objectForKeyedSubscript:@"CardSecurityCode"];
    if (v8) {
      [v3 setObject:v8 forKeyedSubscript:@"CardSecurityCode"];
    }

    OSStatus v9 = (void *)[v3 copy];
  }
  else
  {
    OSStatus v9 = 0;
  }

  return v9;
}

+ (void)showCreditCardSettings
{
  [NSURL URLWithString:@"prefs:root=SAFARI&path=AUTO_FILL/CreditCardList"];
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = [MEMORY[0x263F01880] defaultWorkspace];
  [v2 openSensitiveURL:v3 withOptions:0];
}

+ (void)savedCreditCardsWithError:(int)a1 .cold.1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_218FBF000, a2, OS_LOG_TYPE_ERROR, "SecItemCopyMatching failed with error %d", (uint8_t *)v2, 8u);
}

@end