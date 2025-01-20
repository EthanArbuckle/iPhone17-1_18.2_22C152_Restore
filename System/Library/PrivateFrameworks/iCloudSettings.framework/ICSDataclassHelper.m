@interface ICSDataclassHelper
+ (id)attributedLinkForDataclass:(id)a3;
+ (id)dataclassAttributedLinkDictionary;
+ (id)dataclassSubTitleDictionary:(id)a3 idmsAccount:(id)a4 securityLevel:(unint64_t)a5;
+ (id)dataclassTitleDictionary;
+ (id)healthDataclassSubtitleForSecurityLevel:(unint64_t)a3;
+ (id)localizedSubTitleForDataclass:(id)a3 idmsAccount:(id)a4 securityLevel:(unint64_t)a5;
+ (id)localizedTitleForDataclass:(id)a3;
+ (unint64_t)currentSecurityLevel:(unint64_t)a3;
@end

@implementation ICSDataclassHelper

+ (id)localizedTitleForDataclass:(id)a3
{
  id v4 = a3;
  v5 = [a1 dataclassTitleDictionary];
  v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

+ (id)localizedSubTitleForDataclass:(id)a3 idmsAccount:(id)a4 securityLevel:(unint64_t)a5
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a3;
  v10 = LogSubsystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412546;
    id v15 = v8;
    __int16 v16 = 2048;
    unint64_t v17 = a5;
    _os_log_impl(&dword_262993000, v10, OS_LOG_TYPE_DEFAULT, "localizedSubTitleForDataclass idmsAccount: %@, securityLevel: %lu", (uint8_t *)&v14, 0x16u);
  }

  v11 = [a1 dataclassSubTitleDictionary:v9 idmsAccount:v8 securityLevel:a5];
  v12 = [v11 objectForKeyedSubscript:v9];

  return v12;
}

+ (id)attributedLinkForDataclass:(id)a3
{
  id v4 = a3;
  v5 = [a1 dataclassAttributedLinkDictionary];
  v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

+ (id)dataclassTitleDictionary
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__ICSDataclassHelper_dataclassTitleDictionary__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (dataclassTitleDictionary_onceToken != -1) {
    dispatch_once(&dataclassTitleDictionary_onceToken, block);
  }
  v2 = (void *)dataclassTitleDictionary_dataclassTitleMap;

  return v2;
}

void __46__ICSDataclassHelper_dataclassTitleDictionary__block_invoke()
{
  id v32 = objc_alloc_init(MEMORY[0x263F25820]);
  id v0 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v1 = NSString;
  v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v3 = [v2 localizedStringForKey:@"NOTES_DATACLASS_TITLE" value:&stru_270DEF3F8 table:@"Localizable-AppleID"];
  id v4 = [v32 deviceClass];
  v5 = objc_msgSend(v1, "stringWithFormat:", v3, v4);
  [v0 setObject:v5 forKeyedSubscript:*MEMORY[0x263EFACE8]];

  v6 = NSString;
  v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v8 = [v7 localizedStringForKey:@"MESSAGES_DATACLASS_TITLE" value:&stru_270DEF3F8 table:@"Localizable-AppleID"];
  id v9 = [v32 deviceClass];
  v10 = objc_msgSend(v6, "stringWithFormat:", v8, v9);
  [v0 setObject:v10 forKeyedSubscript:*MEMORY[0x263EFACC8]];

  v11 = [MEMORY[0x263F25810] sharedManager];
  uint64_t v12 = *MEMORY[0x263EFAC90];
  LODWORD(v7) = [v11 appIsNeitherInstalledOrPlaceholder:*MEMORY[0x263EFAC90]];

  v13 = NSString;
  int v14 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v15 = v14;
  if (v7) {
    __int16 v16 = @"HEALTH_DATA_DATACLASS_TITLE";
  }
  else {
    __int16 v16 = @"HEALTH_DATACLASS_TITLE";
  }
  unint64_t v17 = [v14 localizedStringForKey:v16 value:&stru_270DEF3F8 table:@"Localizable-AppleID"];
  uint64_t v18 = [v32 deviceClass];
  v19 = objc_msgSend(v13, "stringWithFormat:", v17, v18);
  [v0 setObject:v19 forKeyedSubscript:v12];

  v20 = NSString;
  v21 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v22 = [v21 localizedStringForKey:@"KEYCHAIN_DATACLASS_TITLE" value:&stru_270DEF3F8 table:@"Localizable-AppleID"];
  v23 = [v32 deviceClass];
  v24 = objc_msgSend(v20, "stringWithFormat:", v22, v23);
  [v0 setObject:v24 forKeyedSubscript:*MEMORY[0x263EFACB0]];

  v25 = NSString;
  v26 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v27 = [v26 localizedStringForKey:@"ICLOUD_DRIVE_DATACLASS_TITLE" value:&stru_270DEF3F8 table:@"Localizable-AppleID"];
  v28 = [v32 deviceClass];
  v29 = objc_msgSend(v25, "stringWithFormat:", v27, v28);
  [v0 setObject:v29 forKeyedSubscript:*MEMORY[0x263EFAD48]];

  uint64_t v30 = [v0 copy];
  v31 = (void *)dataclassTitleDictionary_dataclassTitleMap;
  dataclassTitleDictionary_dataclassTitleMap = v30;
}

+ (id)dataclassSubTitleDictionary:(id)a3 idmsAccount:(id)a4 securityLevel:(unint64_t)a5
{
  int v8 = [a3 isEqualToString:*MEMORY[0x263EFAC90]];
  if (a4 && v8)
  {
    id v9 = [a1 healthDataclassSubtitleForSecurityLevel:a5];
  }
  else
  {
    v10 = LogSubsystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_262993000, v10, OS_LOG_TYPE_DEFAULT, "IdMS account is nil. Proceeding with default subtitles for Health dataclass.", buf, 2u);
    }

    v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v12 = [MEMORY[0x263F82670] modelSpecificLocalizedStringKeyForKey:@"HEALTH_DATACLASS_SUBTITLE_DEFAULT"];
    id v9 = [v11 localizedStringForKey:v12 value:&stru_270DEF3F8 table:@"Localizable-AppleID"];
  }
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __76__ICSDataclassHelper_dataclassSubTitleDictionary_idmsAccount_securityLevel___block_invoke;
  v17[3] = &unk_2655B5EF0;
  id v18 = v9;
  id v19 = a1;
  uint64_t v13 = dataclassSubTitleDictionary_idmsAccount_securityLevel__onceToken;
  id v14 = v9;
  if (v13 != -1) {
    dispatch_once(&dataclassSubTitleDictionary_idmsAccount_securityLevel__onceToken, v17);
  }
  id v15 = (id)dataclassSubTitleDictionary_idmsAccount_securityLevel__dataclassSubTitleMap;

  return v15;
}

void __76__ICSDataclassHelper_dataclassSubTitleDictionary_idmsAccount_securityLevel___block_invoke(uint64_t a1)
{
  id v12 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v3 = [v2 localizedStringForKey:@"NOTES_DATACLASS_SUBTITLE" value:&stru_270DEF3F8 table:@"Localizable-AppleID"];
  [v12 setObject:v3 forKeyedSubscript:*MEMORY[0x263EFACE8]];

  id v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v5 = [v4 localizedStringForKey:@"MESSAGES_DATACLASS_SUBTITLE" value:&stru_270DEF3F8 table:@"Localizable-AppleID"];
  [v12 setObject:v5 forKeyedSubscript:*MEMORY[0x263EFACC8]];

  [v12 setObject:*(void *)(a1 + 32) forKeyedSubscript:*MEMORY[0x263EFAC90]];
  v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v7 = [v6 localizedStringForKey:@"KEYCHAIN_DATACLASS_SUBTITLE" value:&stru_270DEF3F8 table:@"Localizable-AppleID"];
  [v12 setObject:v7 forKeyedSubscript:*MEMORY[0x263EFACB0]];

  int v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v9 = [v8 localizedStringForKey:@"ICLOUD_DRIVE_DATACLASS_SUBTITLE" value:&stru_270DEF3F8 table:@"Localizable-AppleID"];
  [v12 setObject:v9 forKeyedSubscript:*MEMORY[0x263EFAD48]];

  uint64_t v10 = [v12 copy];
  v11 = (void *)dataclassSubTitleDictionary_idmsAccount_securityLevel__dataclassSubTitleMap;
  dataclassSubTitleDictionary_idmsAccount_securityLevel__dataclassSubTitleMap = v10;
}

+ (id)healthDataclassSubtitleForSecurityLevel:(unint64_t)a3
{
  switch([a1 currentSecurityLevel:a3])
  {
    case 0:
      v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v4 = (void *)MEMORY[0x263F82670];
      v5 = @"HEALTH_DATACLASS_SUBTITLE_DEFAULT";
      goto LABEL_7;
    case 1:
      v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v4 = (void *)MEMORY[0x263F82670];
      v5 = @"HEALTH_DATACLASS_SUBTITLE_PASSCODE_HSA2";
      goto LABEL_7;
    case 2:
      v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v4 = (void *)MEMORY[0x263F82670];
      v5 = @"HEALTH_DATACLASS_SUBTITLE_PASSCODE";
      goto LABEL_7;
    case 3:
      v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v4 = (void *)MEMORY[0x263F82670];
      v5 = @"HEALTH_DATACLASS_SUBTITLE_NO_PASSCODE_HSA2";
LABEL_7:
      v7 = [v4 modelSpecificLocalizedStringKeyForKey:v5];
      v6 = [v3 localizedStringForKey:v7 value:&stru_270DEF3F8 table:@"Localizable-AppleID"];

      break;
    default:
      v6 = 0;
      break;
  }

  return v6;
}

+ (unint64_t)currentSecurityLevel:(unint64_t)a3
{
  id v4 = [MEMORY[0x263F343A8] sharedInstance];
  int v5 = [v4 hasLocalSecret];

  unint64_t v6 = 1;
  if (a3 != 4) {
    unint64_t v6 = 2;
  }
  unint64_t v7 = 3;
  if (a3 != 4) {
    unint64_t v7 = 0;
  }
  if (v5) {
    return v6;
  }
  else {
    return v7;
  }
}

+ (id)dataclassAttributedLinkDictionary
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55__ICSDataclassHelper_dataclassAttributedLinkDictionary__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (dataclassAttributedLinkDictionary_onceToken != -1) {
    dispatch_once(&dataclassAttributedLinkDictionary_onceToken, block);
  }
  v2 = (void *)dataclassAttributedLinkDictionary_dataclassAttributedLinksMap;

  return v2;
}

void __55__ICSDataclassHelper_dataclassAttributedLinkDictionary__block_invoke()
{
  id v10 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v0 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v1 = [v0 localizedStringForKey:@"NOTES_LEARN_MORE_LINK" value:&stru_270DEF3F8 table:@"Localizable-AppleID"];
  [v10 setObject:v1 forKeyedSubscript:*MEMORY[0x263EFACE8]];

  v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v3 = [v2 localizedStringForKey:@"MESSAGES_LEARN_MORE_LINK" value:&stru_270DEF3F8 table:@"Localizable-AppleID"];
  [v10 setObject:v3 forKeyedSubscript:*MEMORY[0x263EFACC8]];

  id v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  int v5 = [v4 localizedStringForKey:@"HEALTH_LEARN_MORE_LINK" value:&stru_270DEF3F8 table:@"Localizable-AppleID"];
  [v10 setObject:v5 forKeyedSubscript:*MEMORY[0x263EFAC90]];

  unint64_t v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  unint64_t v7 = [v6 localizedStringForKey:@"ICLOUD_DRIVE_LEARN_MORE_LINK" value:&stru_270DEF3F8 table:@"Localizable-AppleID"];
  [v10 setObject:v7 forKeyedSubscript:*MEMORY[0x263EFAD48]];

  uint64_t v8 = [v10 copy];
  id v9 = (void *)dataclassAttributedLinkDictionary_dataclassAttributedLinksMap;
  dataclassAttributedLinkDictionary_dataclassAttributedLinksMap = v8;
}

@end