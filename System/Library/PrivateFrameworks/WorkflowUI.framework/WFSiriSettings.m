@interface WFSiriSettings
+ (BOOL)isHeySiriEnabled;
+ (BOOL)isSiriEnabled;
+ (id)localizedTriggerPhrase;
+ (id)localizedTriggerPhraseWithMessage:(id)a3;
@end

@implementation WFSiriSettings

+ (BOOL)isHeySiriEnabled
{
  v2 = [MEMORY[0x263F85AF0] sharedPreferences];
  char v3 = [v2 voiceTriggerEnabled];

  return v3;
}

+ (id)localizedTriggerPhrase
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F285A0] sharedPreferences];
  char v3 = [v2 languageCode];

  v4 = [MEMORY[0x263F85AF0] sharedPreferences];
  if (![v4 isCompactVoiceTriggerAvailableForLanguageCode:v3])
  {
    v8 = [v4 localizedTriggerPhraseForLanguageCode:v3];
    goto LABEL_14;
  }
  id v11 = 0;
  uint64_t v5 = [v4 getUserPreferredVoiceTriggerPhraseTypeForDeviceType:0 endpointId:0 error:&v11];
  id v6 = v11;
  if (v6)
  {
    v7 = getWFGeneralLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v13 = "+[WFSiriSettings localizedTriggerPhrase]";
      __int16 v14 = 2112;
      id v15 = v6;
      _os_log_impl(&dword_22D994000, v7, OS_LOG_TYPE_ERROR, "%s Error getting Siri phrase type: %@", buf, 0x16u);
    }

    goto LABEL_6;
  }
  if (v5 == 1)
  {
    uint64_t v9 = [v4 localizedCompactTriggerPhraseForLanguageCode:v3];
    goto LABEL_12;
  }
  if (!v5)
  {
    uint64_t v9 = [v4 localizedTriggerPhraseForLanguageCode:v3];
LABEL_12:
    v8 = (void *)v9;
    goto LABEL_13;
  }
LABEL_6:
  v8 = 0;
LABEL_13:

LABEL_14:
  return v8;
}

+ (id)localizedTriggerPhraseWithMessage:(id)a3
{
  id v3 = a3;
  v4 = +[WFSiriSettings localizedTriggerPhrase];
  uint64_t v5 = WFLocalizedStringWithKey(@"SIRI_TRIGGER_PHRASE_FORMAT", @"%@, %@");
  id v6 = objc_msgSend(NSString, "localizedStringWithFormat:", v5, v4, v3);

  return v6;
}

+ (BOOL)isSiriEnabled
{
  v2 = [MEMORY[0x263F285A0] sharedPreferences];
  char v3 = [v2 assistantIsEnabled];

  return v3;
}

@end