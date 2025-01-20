@interface PSBluetoothSettingsDetail
+ (BOOL)isEnabled;
+ (id)iconImage;
+ (id)preferencesURL;
+ (void)setEnabled:(BOOL)a3;
@end

@implementation PSBluetoothSettingsDetail

+ (id)preferencesURL
{
  return (id)[MEMORY[0x1E4F1CB10] URLWithString:@"prefs:root=Bluetooth"];
}

+ (id)iconImage
{
  return (id)objc_msgSend(MEMORY[0x1E4F42A80], "ps_synchronousIconWithTypeIdentifier:", @"com.apple.graphic-icon.bluetooth");
}

+ (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v4 = _PSLoggingFacility();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    v7 = "+[PSBluetoothSettingsDetail setEnabled:]";
    __int16 v8 = 1024;
    BOOL v9 = v3;
    _os_log_impl(&dword_1A6597000, v4, OS_LOG_TYPE_DEFAULT, "######## %s - enabled: %d", (uint8_t *)&v6, 0x12u);
  }

  v5 = [MEMORY[0x1E4F50B70] sharedInstance];
  [v5 setEnabled:v3];
}

+ (BOOL)isEnabled
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F50B70] sharedInstance];
  int v3 = [v2 available];

  v4 = _PSLoggingFacility();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      int v15 = 136315138;
      v16 = "+[PSBluetoothSettingsDetail isEnabled]";
      _os_log_impl(&dword_1A6597000, v4, OS_LOG_TYPE_DEFAULT, "######## %s - BT is already available", (uint8_t *)&v15, 0xCu);
    }

    int v6 = [MEMORY[0x1E4F50B70] sharedInstance];
    int v7 = [v6 enabled];
  }
  else
  {
    if (v5)
    {
      int v15 = 136315138;
      v16 = "+[PSBluetoothSettingsDetail isEnabled]";
      _os_log_impl(&dword_1A6597000, v4, OS_LOG_TYPE_DEFAULT, "######## %s - BT not available, checking SCDynamicStore", (uint8_t *)&v15, 0xCu);
    }

    __int16 v8 = SCDynamicStoreCreate(0, @"com.apple.settings.bluetooth", 0, 0);
    if (!v8)
    {
      int v7 = 0;
      goto LABEL_16;
    }
    BOOL v9 = v8;
    int v6 = (void *)SCDynamicStoreCopyValue(v8, @"com.apple.MobileBluetooth");
    uint64_t v10 = _PSLoggingFacility();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 136315394;
      v16 = "+[PSBluetoothSettingsDetail isEnabled]";
      __int16 v17 = 2112;
      v18 = v6;
      _os_log_impl(&dword_1A6597000, v10, OS_LOG_TYPE_DEFAULT, "######## %s - SCDynamicStore shows: %@", (uint8_t *)&v15, 0x16u);
    }

    v11 = [v6 objectForKey:@"Powered"];
    v12 = v11;
    if (v11) {
      int v7 = [v11 BOOLValue];
    }
    else {
      int v7 = 0;
    }
    CFRelease(v9);
  }
LABEL_16:
  v13 = _PSLoggingFacility();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 136315394;
    v16 = "+[PSBluetoothSettingsDetail isEnabled]";
    __int16 v17 = 1024;
    LODWORD(v18) = v7;
    _os_log_impl(&dword_1A6597000, v13, OS_LOG_TYPE_DEFAULT, "######## %s - enabled: %d", (uint8_t *)&v15, 0x12u);
  }

  return v7;
}

@end