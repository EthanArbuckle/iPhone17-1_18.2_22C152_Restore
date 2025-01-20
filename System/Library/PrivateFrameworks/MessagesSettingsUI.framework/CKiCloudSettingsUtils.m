@interface CKiCloudSettingsUtils
+ (id)iCloudSettingsSyncText;
+ (id)lastSyncedDateStringForDate:(id)a3 inContext:(int64_t)a4;
+ (id)localizedStringWithKey:(id)a3 inPlistNamed:(id)a4;
+ (id)sharedNumberFormatter;
+ (id)specifierWithTitle:(id)a3 target:(id)a4 selector:(SEL)a5;
@end

@implementation CKiCloudSettingsUtils

+ (id)specifierWithTitle:(id)a3 target:(id)a4 selector:(SEL)a5
{
  v7 = (void *)MEMORY[0x263F5FC40];
  id v8 = a3;
  v9 = [v7 preferenceSpecifierNamed:v8 target:a4 set:0 get:a5 detail:0 cell:-1 edit:0];
  [v9 setIdentifier:v8];

  [v9 setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F600A8]];
  [v9 setProperty:objc_opt_class() forKey:*MEMORY[0x263F5FFE0]];
  return v9;
}

+ (id)iCloudSettingsSyncText
{
  v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v3 = [v2 localizedStringForKey:@"USE_ON_THIS_DEVICE" value:&stru_2704C4418 table:@"iCloudMessagesSettings"];

  return v3;
}

+ (id)localizedStringWithKey:(id)a3 inPlistNamed:(id)a4
{
  v5 = (void *)MEMORY[0x263F086E0];
  id v6 = a4;
  id v7 = a3;
  id v8 = [v5 bundleForClass:objc_opt_class()];
  v9 = [v8 localizedStringForKey:v7 value:&stru_2704C4418 table:v6];

  return v9;
}

+ (id)lastSyncedDateStringForDate:(id)a3 inContext:(int64_t)a4
{
  id v5 = a3;
  id v6 = v5;
  if (lastSyncedDateStringForDate_inContext__onceToken == -1)
  {
    if (v5)
    {
LABEL_3:
      id v7 = [MEMORY[0x263EFF960] currentLocale];
      [(id)lastSyncedDateStringForDate_inContext__dateFormatter setLocale:v7];
      [(id)lastSyncedDateStringForDate_inContext__timeFormatter setLocale:v7];
      id v8 = [MEMORY[0x263EFF910] now];
      [v8 timeIntervalSinceDate:v6];
      double v10 = v9;

      if (v10 >= 60.0)
      {
        v12 = [(id)lastSyncedDateStringForDate_inContext__dateFormatter stringFromDate:v6];
        v11 = [v12 lowercaseStringWithLocale:v7];

        v13 = [(id)lastSyncedDateStringForDate_inContext__timeFormatter stringFromDate:v6];
        v14 = @"SYNC_COMPLETE_ON_DAY_AT_TIME";
        if (!a4) {
          v14 = @"SYNC_DETAILS_FOOTER_TEXT";
        }
        v15 = NSString;
        v16 = (void *)MEMORY[0x263F086E0];
        v17 = v14;
        v18 = [v16 bundleForClass:objc_opt_class()];
        v19 = [v18 localizedStringForKey:v17 value:&stru_2704C4418 table:@"iCloudMessagesSettings"];

        a4 = objc_msgSend(v15, "stringWithFormat:", v19, v11, v13);
      }
      else
      {
        v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        a4 = [v11 localizedStringForKey:@"SYNC_COMPLETE_JUST_NOW" value:&stru_2704C4418 table:@"iCloudMessagesSettings"];
      }

      goto LABEL_12;
    }
  }
  else
  {
    dispatch_once(&lastSyncedDateStringForDate_inContext__onceToken, &__block_literal_global);
    if (v6) {
      goto LABEL_3;
    }
  }
  if (!a4) {
    goto LABEL_13;
  }
  id v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  a4 = [v7 localizedStringForKey:@"NOT_SYNCED" value:&stru_2704C4418 table:@"iCloudMessagesSettings"];
LABEL_12:

LABEL_13:
  return (id)a4;
}

uint64_t __63__CKiCloudSettingsUtils_lastSyncedDateStringForDate_inContext___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263F08790]);
  v1 = (void *)lastSyncedDateStringForDate_inContext__dateFormatter;
  lastSyncedDateStringForDate_inContext__dateFormatter = (uint64_t)v0;

  [(id)lastSyncedDateStringForDate_inContext__dateFormatter setDoesRelativeDateFormatting:1];
  [(id)lastSyncedDateStringForDate_inContext__dateFormatter setDateStyle:1];
  id v2 = objc_alloc_init(MEMORY[0x263F08790]);
  v3 = (void *)lastSyncedDateStringForDate_inContext__timeFormatter;
  lastSyncedDateStringForDate_inContext__timeFormatter = (uint64_t)v2;

  v4 = (void *)lastSyncedDateStringForDate_inContext__timeFormatter;
  return [v4 setTimeStyle:1];
}

+ (id)sharedNumberFormatter
{
  if (sharedNumberFormatter_onceToken != -1) {
    dispatch_once(&sharedNumberFormatter_onceToken, &__block_literal_global_52);
  }
  id v2 = (void *)sharedNumberFormatter_numberFormatter;
  return v2;
}

uint64_t __46__CKiCloudSettingsUtils_sharedNumberFormatter__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263F08A30]);
  v1 = (void *)sharedNumberFormatter_numberFormatter;
  sharedNumberFormatter_numberFormatter = (uint64_t)v0;

  id v2 = [MEMORY[0x263EFF960] currentLocale];
  [(id)sharedNumberFormatter_numberFormatter setLocale:v2];

  [(id)sharedNumberFormatter_numberFormatter setNumberStyle:1];
  v3 = (void *)sharedNumberFormatter_numberFormatter;
  return [v3 setUsesGroupingSeparator:1];
}

@end