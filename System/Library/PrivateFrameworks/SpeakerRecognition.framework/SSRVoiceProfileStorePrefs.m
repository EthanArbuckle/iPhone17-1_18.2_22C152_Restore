@interface SSRVoiceProfileStorePrefs
+ (id)sharedStorePrefs;
- (id)getAllContentsOfVoiceProfileStorePrefs;
- (id)loadEnrollmentSamplingMetaDataDict;
- (id)loadKnownUserVoiceProfiles;
- (id)loadRequestIdsToAudioIdsMapping;
- (int64_t)getVoiceProfileStoreVersion;
- (unint64_t)loadRPIDataRemovalStatus;
- (void)applyContentsToVoiceProfileStorePrefs:(id)a3;
- (void)saveEnrollmentSamplingMetaDataDict:(id)a3;
- (void)saveKnownUserVoiceProfiles:(id)a3;
- (void)saveRPIDataRemovalStatus:(unint64_t)a3;
- (void)saveRequestIdsToAudioIdsMapping:(id)a3;
- (void)setVoiceProfileStoreVersion:(unint64_t)a3;
@end

@implementation SSRVoiceProfileStorePrefs

- (void)applyContentsToVoiceProfileStorePrefs:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  v4 = (void *)MEMORY[0x263F08928];
  id v5 = a3;
  id v19 = 0;
  v6 = [v4 unarchivedObjectOfClass:objc_opt_class() fromData:v5 error:&v19];

  id v7 = v19;
  if (v7) {
    BOOL v8 = 1;
  }
  else {
    BOOL v8 = v6 == 0;
  }
  if (v8)
  {
    v9 = (void *)*MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
    {
      v10 = v9;
      v11 = [v7 localizedDescription];
      *(_DWORD *)buf = 136315394;
      v21 = "-[SSRVoiceProfileStorePrefs applyContentsToVoiceProfileStorePrefs:]";
      __int16 v22 = 2112;
      v23 = v11;
      _os_log_error_impl(&dword_21C8A5000, v10, OS_LOG_TYPE_ERROR, "%s Unable to decode blob, not restoring with error %@", buf, 0x16u);
    }
  }
  else
  {
    uint64_t v12 = [v6 vpArray];
    if (v12
      && (v13 = (void *)v12,
          [v6 vpArray],
          v14 = objc_claimAutoreleasedReturnValue(),
          uint64_t v15 = [v14 count],
          v14,
          v13,
          v15))
    {
      v16 = [v6 version];
      -[SSRVoiceProfileStorePrefs setVoiceProfileStoreVersion:](self, "setVoiceProfileStoreVersion:", [v16 integerValue]);

      v17 = [v6 vpArray];
      [(SSRVoiceProfileStorePrefs *)self saveKnownUserVoiceProfiles:v17];
    }
    else
    {
      v18 = *MEMORY[0x263F38100];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v21 = "-[SSRVoiceProfileStorePrefs applyContentsToVoiceProfileStorePrefs:]";
        _os_log_error_impl(&dword_21C8A5000, v18, OS_LOG_TYPE_ERROR, "%s Empty known users, not restoring", buf, 0xCu);
      }
    }
  }
}

- (id)getAllContentsOfVoiceProfileStorePrefs
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  CFPreferencesAppSynchronize(@"com.apple.speakerrecognition");
  v3 = [(SSRVoiceProfileStorePrefs *)self loadKnownUserVoiceProfiles];
  if (v3)
  {
    int64_t v4 = [(SSRVoiceProfileStorePrefs *)self getVoiceProfileStoreVersion];
    id v5 = [SSRVoiceProfileStoreData alloc];
    v6 = [NSNumber numberWithInteger:v4];
    id v7 = [(SSRVoiceProfileStoreData *)v5 initWithVoiceProfileArray:v3 withVersion:v6];

    id v16 = 0;
    BOOL v8 = [MEMORY[0x263F08910] archivedDataWithRootObject:v7 requiringSecureCoding:1 error:&v16];
    id v9 = v16;
    if (v9 || !v8)
    {
      uint64_t v12 = (void *)*MEMORY[0x263F38100];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
      {
        v14 = v12;
        uint64_t v15 = [v9 localizedDescription];
        *(_DWORD *)buf = 136315394;
        v18 = "-[SSRVoiceProfileStorePrefs getAllContentsOfVoiceProfileStorePrefs]";
        __int16 v19 = 2112;
        v20 = v15;
        _os_log_error_impl(&dword_21C8A5000, v14, OS_LOG_TYPE_ERROR, "%s Failed to serialize dict with err %@", buf, 0x16u);
      }
      id v10 = 0;
    }
    else
    {
      id v10 = v8;
    }
  }
  else
  {
    v11 = *MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v18 = "-[SSRVoiceProfileStorePrefs getAllContentsOfVoiceProfileStorePrefs]";
      _os_log_error_impl(&dword_21C8A5000, v11, OS_LOG_TYPE_ERROR, "%s Empty known users", buf, 0xCu);
    }
    id v10 = 0;
  }

  return v10;
}

- (int64_t)getVoiceProfileStoreVersion
{
  CFPreferencesAppSynchronize(@"com.apple.speakerrecognition");
  v2 = (void *)CFPreferencesCopyAppValue(@"Voice Profile Store Version", @"com.apple.speakerrecognition");
  v3 = v2;
  if (v2) {
    int64_t v4 = [v2 unsignedIntegerValue];
  }
  else {
    int64_t v4 = -1;
  }

  return v4;
}

- (id)loadEnrollmentSamplingMetaDataDict
{
  CFPreferencesAppSynchronize(@"com.apple.speakerrecognition");
  v2 = (void *)CFPreferencesCopyAppValue(@"Enrollment Sampling Meta Data", @"com.apple.speakerrecognition");

  return v2;
}

- (id)loadRequestIdsToAudioIdsMapping
{
  CFPreferencesAppSynchronize(@"com.apple.speakerrecognition");
  v2 = (void *)CFPreferencesCopyAppValue(@"requestId to audioId mapping", @"com.apple.speakerrecognition");

  return v2;
}

- (id)loadKnownUserVoiceProfiles
{
  CFPreferencesAppSynchronize(@"com.apple.speakerrecognition");
  v2 = (void *)CFPreferencesCopyAppValue(@"Known User Voice Profiles", @"com.apple.speakerrecognition");

  return v2;
}

- (void)saveRequestIdsToAudioIdsMapping:(id)a3
{
  id value = a3;
  CFPreferencesAppSynchronize(@"com.apple.speakerrecognition");
  CFPreferencesSetAppValue(@"requestId to audioId mapping", value, @"com.apple.speakerrecognition");
}

- (void)setVoiceProfileStoreVersion:(unint64_t)a3
{
  CFPreferencesAppSynchronize(@"com.apple.speakerrecognition");
  id v4 = [NSNumber numberWithUnsignedInteger:a3];
  CFPreferencesSetAppValue(@"Voice Profile Store Version", v4, @"com.apple.speakerrecognition");
}

- (void)saveEnrollmentSamplingMetaDataDict:(id)a3
{
  id value = a3;
  CFPreferencesAppSynchronize(@"com.apple.speakerrecognition");
  CFPreferencesSetAppValue(@"Enrollment Sampling Meta Data", value, @"com.apple.speakerrecognition");
}

- (void)saveKnownUserVoiceProfiles:(id)a3
{
  id value = a3;
  CFPreferencesAppSynchronize(@"com.apple.speakerrecognition");
  CFPreferencesSetAppValue(@"Known User Voice Profiles", value, @"com.apple.speakerrecognition");
}

- (unint64_t)loadRPIDataRemovalStatus
{
  CFPreferencesAppSynchronize(@"com.apple.speakerrecognition");
  v2 = (void *)CFPreferencesCopyAppValue(@"RPI Sampling data removal status", @"com.apple.speakerrecognition");
  v3 = v2;
  if (v2) {
    unint64_t v4 = [v2 unsignedIntegerValue];
  }
  else {
    unint64_t v4 = 0;
  }

  return v4;
}

- (void)saveRPIDataRemovalStatus:(unint64_t)a3
{
  CFPreferencesAppSynchronize(@"com.apple.speakerrecognition");
  id v4 = [NSNumber numberWithUnsignedInteger:a3];
  CFPreferencesSetAppValue(@"RPI Sampling data removal status", v4, @"com.apple.speakerrecognition");
}

+ (id)sharedStorePrefs
{
  if (sharedStorePrefs_onceToken != -1) {
    dispatch_once(&sharedStorePrefs_onceToken, &__block_literal_global_8606);
  }
  v2 = (void *)sharedStorePrefs_sharedStorePrefs;

  return v2;
}

uint64_t __45__SSRVoiceProfileStorePrefs_sharedStorePrefs__block_invoke()
{
  v0 = objc_alloc_init(SSRVoiceProfileStorePrefs);
  v1 = (void *)sharedStorePrefs_sharedStorePrefs;
  sharedStorePrefs_sharedStorePrefs = (uint64_t)v0;

  return SSRLogInitIfNeeded();
}

@end