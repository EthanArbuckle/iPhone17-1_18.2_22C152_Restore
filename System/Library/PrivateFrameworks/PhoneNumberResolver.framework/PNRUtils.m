@interface PNRUtils
+ (BOOL)_isValidPhoneNumber:(id)a3;
+ (id)_currentCountry;
+ (id)_currentLocale;
+ (id)_preferredLanguages;
+ (id)_stringByStrippingFormattingAndNotVisiblyAllowable:(id)a3;
+ (void)_countryCodeFromInternationalCode:(id)a3 result:(id)a4;
+ (void)_localizedCountryNameForISOCountryCode:(id)a3 result:(id)a4;
@end

@implementation PNRUtils

+ (id)_stringByStrippingFormattingAndNotVisiblyAllowable:(id)a3
{
  v3 = (const void *)_PNCreateStringByStrippingFormattingAndNotVisiblyAllowable();

  return (id)CFAutorelease(v3);
}

+ (void)_localizedCountryNameForISOCountryCode:(id)a3 result:(id)a4
{
  v10 = (void (**)(id, void *, void *))a4;
  v5 = (void *)MEMORY[0x263EFF960];
  id v6 = a3;
  v7 = [v5 currentLocale];
  v8 = [v7 displayNameForKey:*MEMORY[0x263EFF4D0] value:v6];

  if (v8)
  {
    v9 = 0;
  }
  else
  {
    v9 = [MEMORY[0x263F087E8] _PNRNotFoundErrorWithUserInfo:&unk_26ECC8D08];
  }
  v10[2](v10, v8, v9);
}

+ (BOOL)_isValidPhoneNumber:(id)a3
{
  v3 = (void *)MEMORY[0x263F08A98];
  id v4 = a3;
  v5 = [v3 predicateWithFormat:@"SELF MATCHES %@", @"\\+?[0-9]+"];
  char v6 = [v5 evaluateWithObject:v4];

  return v6;
}

+ (void)_countryCodeFromInternationalCode:(id)a3 result:(id)a4
{
  id v4 = (void (**)(void))a4;
  v5 = (const void *)_PNCopyCountryCodeForInternationalCode();
  if (v5)
  {
    uint64_t v6 = CFAutorelease(v5);
    v7 = 0;
  }
  else
  {
    v7 = [MEMORY[0x263F087E8] _PNRNotFoundErrorWithUserInfo:&unk_26ECC8D30];
    uint64_t v6 = 0;
  }
  id v8 = (id)v6;
  v4[2](v4);
}

+ (id)_currentCountry
{
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x2050000000;
  v2 = (void *)getGEOCountryConfigurationClass_softClass;
  uint64_t v11 = getGEOCountryConfigurationClass_softClass;
  if (!getGEOCountryConfigurationClass_softClass)
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __getGEOCountryConfigurationClass_block_invoke;
    v7[3] = &unk_264D9F5B8;
    v7[4] = &v8;
    __getGEOCountryConfigurationClass_block_invoke((uint64_t)v7);
    v2 = (void *)v9[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v8, 8);
  id v4 = [v3 sharedConfiguration];
  v5 = [v4 countryCode];

  return v5;
}

+ (id)_preferredLanguages
{
  v2 = [MEMORY[0x263EFF960] preferredLanguages];
  if (![v2 count])
  {

    v2 = &unk_26ECC8C00;
  }

  return v2;
}

+ (id)_currentLocale
{
  return (id)[MEMORY[0x263EFF960] currentLocale];
}

@end