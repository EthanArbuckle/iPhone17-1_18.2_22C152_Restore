@interface SiriUIUtilities
+ (BOOL)shouldShowHeaderForDirectActionEvent:(int64_t)a3;
+ (BOOL)string:(id)a3 equalToString:(id)a4;
+ (BOOL)string:(id)a3 isSameAsUserUtterance:(id)a4;
+ (id)_normalizeTextString:(id)a3;
+ (id)defaultBrowserBundleIdentifier;
+ (id)descriptionForAceView:(id)a3;
+ (id)descriptionForDialog:(id)a3;
+ (id)descriptionForSayIt:(id)a3;
+ (id)deviceSpecificKeyForDefaultKey:(id)a3;
+ (id)stringForDeviceType;
+ (id)stringForSiriUIBackgroundBlurReason:(int64_t)a3;
@end

@implementation SiriUIUtilities

+ (id)stringForSiriUIBackgroundBlurReason:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 4) {
    return @"SiriUIBackgroundBlurReasonForceDismissal";
  }
  else {
    return off_26469F9C0[a3 - 1];
  }
}

+ (id)stringForDeviceType
{
  v2 = [MEMORY[0x263F1C5C0] currentDevice];
  v3 = [v2 model];

  return v3;
}

+ (id)deviceSpecificKeyForDefaultKey:(id)a3
{
  id v3 = a3;
  v4 = +[SiriUIUtilities stringForDeviceType];
  if ([v4 containsString:@"iPhone"])
  {
    v5 = @"_IPHONE";
LABEL_7:
    id v6 = [v3 stringByAppendingString:v5];
    goto LABEL_8;
  }
  if ([v4 containsString:@"iPad"])
  {
    v5 = @"_IPAD";
    goto LABEL_7;
  }
  if ([v4 containsString:@"iPod"])
  {
    v5 = @"_IPOD";
    goto LABEL_7;
  }
  id v6 = v3;
LABEL_8:
  v7 = v6;

  return v7;
}

+ (BOOL)string:(id)a3 isSameAsUserUtterance:(id)a4
{
  id v6 = a4;
  v7 = [a1 _normalizeTextString:a3];
  v8 = [v6 bestTextInterpretation];

  v9 = [a1 _normalizeTextString:v8];
  LOBYTE(v6) = [v7 localizedStandardCompare:v9] == 0;

  return (char)v6;
}

+ (id)_normalizeTextString:(id)a3
{
  id v3 = (void *)MEMORY[0x263F08708];
  id v4 = a3;
  v5 = [v3 whitespaceCharacterSet];
  id v6 = [v4 stringByTrimmingCharactersInSet:v5];

  v7 = [v6 stringByReplacingOccurrencesOfString:@"’" withString:@"'"];
  v8 = [v7 stringByReplacingOccurrencesOfString:@"“" withString:@"\""];

  return v8;
}

+ (id)defaultBrowserBundleIdentifier
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2050000000;
  v2 = (void *)getSearchUIDefaultBrowserAppIconImageClass_softClass;
  uint64_t v10 = getSearchUIDefaultBrowserAppIconImageClass_softClass;
  if (!getSearchUIDefaultBrowserAppIconImageClass_softClass)
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __getSearchUIDefaultBrowserAppIconImageClass_block_invoke;
    v6[3] = &unk_26469F170;
    v6[4] = &v7;
    __getSearchUIDefaultBrowserAppIconImageClass_block_invoke((uint64_t)v6);
    v2 = (void *)v8[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v7, 8);
  id v4 = [v3 defaultBrowserBundleIdentifier];
  return v4;
}

+ (BOOL)shouldShowHeaderForDirectActionEvent:(int64_t)a3
{
  return ((unint64_t)a3 < 0x12) & (0x3803Eu >> a3);
}

+ (id)descriptionForDialog:(id)a3
{
  return (id)[MEMORY[0x263F75508] descriptionForDialog:a3];
}

+ (id)descriptionForAceView:(id)a3
{
  return (id)[MEMORY[0x263F75508] descriptionForAceView:a3];
}

+ (id)descriptionForSayIt:(id)a3
{
  return (id)[MEMORY[0x263F75508] descriptionForSayIt:a3];
}

+ (BOOL)string:(id)a3 equalToString:(id)a4
{
  return [MEMORY[0x263F75508] string:a3 equalToString:a4];
}

@end