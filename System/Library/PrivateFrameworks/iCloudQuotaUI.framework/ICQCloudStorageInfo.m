@interface ICQCloudStorageInfo
+ (id)backupInfoHeaders;
+ (id)backupInfoHeadersForAccount:(id)a3;
@end

@implementation ICQCloudStorageInfo

+ (id)backupInfoHeaders
{
  v3 = [MEMORY[0x263EFB210] defaultStore];
  v4 = objc_msgSend(v3, "aa_primaryAppleAccount");

  v5 = [a1 backupInfoHeadersForAccount:v4];

  return v5;
}

+ (id)backupInfoHeadersForAccount:(id)a3
{
  v3 = (void *)MEMORY[0x263EFF9A0];
  id v4 = a3;
  v5 = [v3 dictionary];
  if ([v4 isEnabledForDataclass:*MEMORY[0x263EFB3B8]]) {
    v6 = @"ON";
  }
  else {
    v6 = @"OFF";
  }
  [v5 setObject:v6 forKey:@"X-Client-Backup"];
  v7 = [MEMORY[0x263F82670] currentDevice];
  v8 = [v7 name];
  v9 = [v8 dataUsingEncoding:4];
  v10 = [v9 base64EncodedStringWithOptions:0];

  [v5 setObject:v10 forKey:@"X-Client-DeviceName"];
  id v30 = 0;
  v11 = (void *)[objc_alloc(MEMORY[0x263F559D8]) initWithAccount:v4 delegate:0 eventQueue:0 error:&v30];

  id v12 = v30;
  if (v12)
  {
    v13 = _ICQGetLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      +[ICQCloudStorageInfo backupInfoHeadersForAccount:]((uint64_t)v12, v13);
    }
    goto LABEL_11;
  }
  v13 = [v11 backupState];
  if ([v13 state] != 6)
  {
LABEL_11:
    v17 = @"SUCCESS";
    goto LABEL_12;
  }
  v14 = [v13 error];
  uint64_t v15 = [v14 code];

  if (v15 == 303)
  {
    v16 = objc_msgSend(NSString, "stringWithFormat:", @"%llu", objc_msgSend(v11, "nextBackupSize"));
    [v5 setObject:v16 forKey:@"X-Client-LastBackupSizeBytes"];
  }
  v17 = @"FAIL";
LABEL_12:

  [v5 setObject:v17 forKey:@"X-Client-LastBackupState"];
  v18 = (void *)MGCopyAnswer();
  if (v18) {
    [v5 setObject:v18 forKey:@"X-Client-Device-Color"];
  }
  v19 = (void *)MGCopyAnswer();
  if (v19) {
    [v5 setObject:v19 forKey:@"X-Client-Device-Enclosure-Color"];
  }
  v20 = (void *)MGCopyAnswer();
  v21 = v20;
  if (v20)
  {
    v22 = [v20 stringValue];
    [v5 setObject:v22 forKey:@"X-Client-Device-CoverGlassColor"];
  }
  v23 = (void *)MGCopyAnswer();
  v24 = v23;
  if (v23)
  {
    v25 = [v23 stringValue];
    [v5 setObject:v25 forKey:@"X-Client-Device-HousingColor"];
  }
  v26 = (void *)MGCopyAnswer();
  v27 = v26;
  if (v26)
  {
    v28 = [v26 stringValue];
    [v5 setObject:v28 forKey:@"X-Client-Device-BackingColor"];
  }
  return v5;
}

+ (void)backupInfoHeadersForAccount:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 136315394;
  v3 = "+[ICQCloudStorageInfo backupInfoHeadersForAccount:]";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_22C821000, a2, OS_LOG_TYPE_ERROR, "%s unable to init MBManager with error: %@", (uint8_t *)&v2, 0x16u);
}

@end