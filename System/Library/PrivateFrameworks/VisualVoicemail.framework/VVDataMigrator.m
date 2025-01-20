@interface VVDataMigrator
+ (id)carrierServiceName;
- (BOOL)shouldPerformMigration;
- (NSString)isoCountryCode;
- (NSString)normalizedPhoneNumber;
- (NSURL)accountDir;
- (NSUUID)label;
- (void)createFoldersIfNecessary;
- (void)performIMAPFilePathMigration;
- (void)performMigrationIfNecessary;
- (void)setAccountDir:(id)a3;
- (void)setIsoCountryCode:(id)a3;
- (void)setLabel:(id)a3;
- (void)setNormalizedPhoneNumber:(id)a3;
@end

@implementation VVDataMigrator

+ (id)carrierServiceName
{
  CFPreferencesAppSynchronize(@"com.apple.voicemail.datamigration");
  v2 = (void *)CFPreferencesCopyAppValue(@"DataMigrationStatus", @"com.apple.voicemail.datamigration");
  return v2;
}

- (BOOL)shouldPerformMigration
{
  Boolean keyExistsAndHasValidFormat = 0;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"DataMigrationStatus", @"com.apple.voicemail.datamigration", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    BOOL v3 = AppBooleanValue == 0;
  }
  else {
    BOOL v3 = 0;
  }
  return !v3;
}

- (void)createFoldersIfNecessary
{
  v2 = [(VVDataMigrator *)self accountDir];
  BOOL v3 = [v2 path];

  v4 = +[NSFileManager defaultManager];
  unsigned __int8 v5 = [v4 fileExistsAtPath:v3];

  if ((v5 & 1) == 0)
  {
    v6 = +[NSFileManager defaultManager];
    id v10 = 0;
    unsigned __int8 v7 = [v6 createDirectoryAtPath:v3 withIntermediateDirectories:1 attributes:0 error:&v10];
    id v8 = v10;

    if ((v7 & 1) == 0 && v8)
    {
      v9 = vm_vmd_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_100081C08((uint64_t)v3, (uint64_t)v8, v9);
      }
    }
  }
}

- (void)performMigrationIfNecessary
{
}

- (void)performIMAPFilePathMigration
{
  BOOL v3 = sub_10006D758();
  v4 = [v3 URLByAppendingPathComponent:@"com.apple.voicemail.imap.parameters.plist"];
  unsigned __int8 v5 = [v4 path];

  v6 = [(VVDataMigrator *)self accountDir];
  unsigned __int8 v7 = [v6 URLByAppendingPathComponent:@"com.apple.voicemail.imap.parameters.plist"];
  id v8 = [v7 path];

  v9 = +[NSFileManager defaultManager];
  LODWORD(v6) = [v9 fileExistsAtPath:v8];

  if (v6)
  {
    id v10 = vm_vmd_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v8;
      v11 = "Determined that file exists at destination path: %@, skipping migration";
LABEL_16:
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, v11, buf, 0xCu);
      goto LABEL_33;
    }
    goto LABEL_33;
  }
  v12 = +[NSFileManager defaultManager];
  unsigned int v13 = [v12 fileExistsAtPath:v5];

  id v10 = vm_vmd_log();
  BOOL v14 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v13)
  {
    if (v14)
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v5;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Determined that file exists at fromFilePath: %@", buf, 0xCu);
    }

    id v10 = [objc_alloc((Class)NSDictionary) initWithContentsOfFile:v5];
    v52 = [v10 objectForKeyedSubscript:@"AccountSettings"];
    v15 = [v52 objectForKeyedSubscript:@"name"];
    long long v16 = *((_OWORD *)&INIT_DECOMPOSED_PHONE_NUMBER + 1);
    *(_OWORD *)buf = *(_OWORD *)&INIT_DECOMPOSED_PHONE_NUMBER;
    long long v63 = v16;
    long long v17 = *((_OWORD *)&INIT_DECOMPOSED_PHONE_NUMBER + 3);
    *(_OWORD *)numBytes = *((_OWORD *)&INIT_DECOMPOSED_PHONE_NUMBER + 2);
    *(_OWORD *)v65 = v17;
    id v18 = [(VVDataMigrator *)self normalizedPhoneNumber];
    [v18 cStringUsingEncoding:1];
    v19 = [(VVDataMigrator *)self isoCountryCode];
    PNDecomposeForCountry();

    v20 = (__CFString *)CFStringCreateWithBytes(kCFAllocatorDefault, (const UInt8 *)numBytes[0], LODWORD(numBytes[1]), 0x8000100u, 0);
    v21 = (__CFString *)CFStringCreateWithBytes(kCFAllocatorDefault, (const UInt8 *)v65[0], LODWORD(v65[1]), 0x8000100u, 0);
    v22 = +[NSString stringWithFormat:@"%@%@", v20, v21];
    v23 = vm_vmd_log();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v56 = 138412546;
      v57 = v15;
      __int16 v58 = 2112;
      v59 = v22;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Determined userName:%@ strippedPhoneNumberString:%@", v56, 0x16u);
    }

    v53 = v15;
    if (![v15 containsString:v22])
    {
      v27 = vm_vmd_log();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        v33 = [(VVDataMigrator *)self normalizedPhoneNumber];
        *(_DWORD *)v56 = 138412802;
        v57 = v5;
        __int16 v58 = 2112;
        v59 = v33;
        __int16 v60 = 2112;
        v61 = v53;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Determined that this is not the account we want to migrate: %@, searchHint:%@, userName: %@", v56, 0x20u);
      }
      goto LABEL_32;
    }
    v47 = v22;
    v24 = [objc_alloc((Class)NSURL) initFileURLWithPath:v5];
    id v25 = [objc_alloc((Class)NSURL) initFileURLWithPath:v8];
    v26 = +[NSFileManager defaultManager];
    id v55 = 0;
    v50 = v25;
    v51 = v24;
    LODWORD(v25) = [v26 copyItemAtURL:v24 toURL:v25 error:&v55];
    v27 = v55;

    v28 = vm_vmd_log();
    BOOL v29 = os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT);
    v48 = v21;
    v49 = v20;
    int v46 = (int)v25;
    if ((v25 & 1) != 0 || !v27)
    {
      if (v29)
      {
        *(_DWORD *)v56 = 138412546;
        v57 = v51;
        __int16 v58 = 2112;
        v59 = v50;
        v30 = "Performed migration fromURL:%@ toURL:%@";
        v31 = v28;
        uint32_t v32 = 22;
        goto LABEL_21;
      }
    }
    else if (v29)
    {
      *(_DWORD *)v56 = 138412802;
      v57 = v51;
      __int16 v58 = 2112;
      v59 = v50;
      __int16 v60 = 2112;
      v61 = v27;
      v30 = "Error while performing migration fromURL:%@ toURL:%@ error:%@";
      v31 = v28;
      uint32_t v32 = 32;
LABEL_21:
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, v30, v56, v32);
    }

    v34 = sub_10006D758();
    v35 = [v34 URLByAppendingPathComponent:@"Checkpoint.plist"];

    v36 = [(VVDataMigrator *)self accountDir];
    v37 = [v36 URLByAppendingPathComponent:@"Checkpoint.plist"];

    v38 = +[NSFileManager defaultManager];
    id v54 = 0;
    unsigned int v39 = [v38 copyItemAtURL:v35 toURL:v37 error:&v54];
    v40 = v54;

    v41 = vm_vmd_log();
    BOOL v42 = os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT);
    v22 = v47;
    if ((v39 & 1) != 0 || !v40)
    {
      if (v42)
      {
        *(_DWORD *)v56 = 138412546;
        v57 = v35;
        __int16 v58 = 2112;
        v59 = v37;
        v43 = "Performed migration fromCheckpointURL:%@ toCheckpointURL:%@";
        v44 = v41;
        uint32_t v45 = 22;
        goto LABEL_28;
      }
    }
    else if (v42)
    {
      *(_DWORD *)v56 = 138412802;
      v57 = v35;
      __int16 v58 = 2112;
      v59 = v37;
      __int16 v60 = 2112;
      v61 = v40;
      v43 = "Error while performing migration fromCheckpointURL:%@ toCheckpointURL:%@ error:%@";
      v44 = v41;
      uint32_t v45 = 32;
LABEL_28:
      _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, v43, v56, v45);
    }

    if ((v46 & v39) == 1)
    {
      CFPreferencesSetAppValue(@"DataMigrationStatus", @"NO", @"com.apple.voicemail.datamigration");
      CFPreferencesAppSynchronize(@"com.apple.voicemail.datamigration");
    }

    v21 = v48;
    v20 = v49;
LABEL_32:

    goto LABEL_33;
  }
  if (v14)
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&buf[4] = v5;
    v11 = "Determined that file does not exist at filePath, skipping migration: %@";
    goto LABEL_16;
  }
LABEL_33:
}

- (NSUUID)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (NSURL)accountDir
{
  return self->_accountDir;
}

- (void)setAccountDir:(id)a3
{
}

- (NSString)normalizedPhoneNumber
{
  return self->_normalizedPhoneNumber;
}

- (void)setNormalizedPhoneNumber:(id)a3
{
}

- (NSString)isoCountryCode
{
  return self->_isoCountryCode;
}

- (void)setIsoCountryCode:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_isoCountryCode, 0);
  objc_storeStrong((id *)&self->_normalizedPhoneNumber, 0);
  objc_storeStrong((id *)&self->_accountDir, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end