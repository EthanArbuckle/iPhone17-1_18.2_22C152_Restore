@interface WLPayload
- (NSString)androidAPILevel;
- (NSString)androidBrand;
- (NSString)androidLocale;
- (NSString)androidModel;
- (NSString)androidOSVersion;
- (NSString)androidVersion;
- (NSString)androidVersionCode;
- (NSString)state;
- (WLFeaturePayload)accessibilitySettings;
- (WLFeaturePayload)accounts;
- (WLFeaturePayload)bookmarks;
- (WLFeaturePayload)calendars;
- (WLFeaturePayload)callHistory;
- (WLFeaturePayload)contacts;
- (WLFeaturePayload)displaySettings;
- (WLFeaturePayload)files;
- (WLFeaturePayload)messages;
- (WLFeaturePayload)photos;
- (WLFeaturePayload)videos;
- (WLFeaturePayload)voiceMemos;
- (WLPayload)init;
- (id)dictionary;
- (unint64_t)data;
- (unint64_t)dataSize;
- (unint64_t)elapsedTime;
- (void)setAccessibilitySettings:(id)a3;
- (void)setAccounts:(id)a3;
- (void)setAndroidAPILevel:(id)a3;
- (void)setAndroidBrand:(id)a3;
- (void)setAndroidLocale:(id)a3;
- (void)setAndroidModel:(id)a3;
- (void)setAndroidOSVersion:(id)a3;
- (void)setAndroidVersion:(id)a3;
- (void)setAndroidVersionCode:(id)a3;
- (void)setBookmarks:(id)a3;
- (void)setCalendars:(id)a3;
- (void)setContacts:(id)a3;
- (void)setData:(unint64_t)a3;
- (void)setDataSize:(unint64_t)a3;
- (void)setDisplaySettings:(id)a3;
- (void)setElapsedTime:(unint64_t)a3;
- (void)setFiles:(id)a3;
- (void)setMessages:(id)a3;
- (void)setPhotos:(id)a3;
- (void)setState:(id)a3;
- (void)setVideos:(id)a3;
@end

@implementation WLPayload

- (WLPayload)init
{
  v15.receiver = self;
  v15.super_class = (Class)WLPayload;
  v2 = [(WLPayload *)&v15 init];
  v3 = v2;
  if (v2)
  {
    [(WLPayload *)v2 setAndroidAPILevel:@"?"];
    [(WLPayload *)v3 setAndroidBrand:@"?"];
    [(WLPayload *)v3 setAndroidLocale:@"?"];
    [(WLPayload *)v3 setAndroidModel:@"?"];
    [(WLPayload *)v3 setAndroidOSVersion:@"?"];
    [(WLPayload *)v3 setAndroidVersion:@"?"];
    [(WLPayload *)v3 setAndroidVersionCode:@"?"];
    [(WLPayload *)v3 setState:@"?"];
    v4 = objc_alloc_init(WLFeaturePayload);
    [(WLPayload *)v3 setMessages:v4];

    v5 = objc_alloc_init(WLFeaturePayload);
    [(WLPayload *)v3 setPhotos:v5];

    v6 = objc_alloc_init(WLFeaturePayload);
    [(WLPayload *)v3 setVideos:v6];

    v7 = objc_alloc_init(WLFeaturePayload);
    [(WLPayload *)v3 setContacts:v7];

    v8 = objc_alloc_init(WLFeaturePayload);
    [(WLPayload *)v3 setCalendars:v8];

    v9 = objc_alloc_init(WLFeaturePayload);
    [(WLPayload *)v3 setBookmarks:v9];

    v10 = objc_alloc_init(WLFeaturePayload);
    [(WLPayload *)v3 setAccounts:v10];

    v11 = objc_alloc_init(WLFeaturePayload);
    [(WLPayload *)v3 setFiles:v11];

    v12 = objc_alloc_init(WLFeaturePayload);
    [(WLPayload *)v3 setAccessibilitySettings:v12];

    v13 = objc_alloc_init(WLFeaturePayload);
    [(WLPayload *)v3 setDisplaySettings:v13];
  }
  return v3;
}

- (id)dictionary
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  [v3 setObject:self->_androidAPILevel forKey:@"android_api_level"];
  [v3 setObject:self->_androidBrand forKey:@"android_brand"];
  [v3 setObject:self->_androidLocale forKey:@"android_locale"];
  [v3 setObject:self->_androidModel forKey:@"android_model"];
  [v3 setObject:self->_androidOSVersion forKey:@"android_os_version"];
  [v3 setObject:self->_androidVersion forKey:@"android_version"];
  [v3 setObject:self->_androidVersionCode forKey:@"android_version_code"];
  [v3 setObject:self->_state forKey:@"state"];
  messages = self->_messages;
  long long v36 = *(_OWORD *)&self->_photos;
  calendars = self->_calendars;
  bookmarks = self->_bookmarks;
  contacts = self->_contacts;
  v38 = calendars;
  v39 = bookmarks;
  long long v40 = *(_OWORD *)&self->_accounts;
  displaySettings = self->_displaySettings;
  accessibilitySettings = self->_accessibilitySettings;
  v42 = displaySettings;
  v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:&messages count:10];
  unint64_t v8 = 0x263F08000uLL;
  if ([v7 count])
  {
    v31 = self;
    v32 = v7;
    uint64_t v9 = 0;
    unint64_t v10 = 0;
    unint64_t v11 = 0;
    do
    {
      v12 = [&unk_26E8EB4E0 objectAtIndexedSubscript:v11];
      v13 = [v7 objectAtIndexedSubscript:v11];
      uint64_t v14 = [v13 count];
      unint64_t v15 = [v13 size];
      unint64_t v33 = v15 >> 30;
      unint64_t v34 = [v13 elapsedTime] / 0x3CuLL;
      v10 += v15;
      v16 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v13, "enabled"));
      v17 = [NSString stringWithFormat:@"%@_enabled", v12];
      [v3 setObject:v16 forKey:v17];

      v18 = [NSNumber numberWithUnsignedLongLong:v14];
      v19 = [NSString stringWithFormat:@"%@", v12];
      [v3 setObject:v18 forKey:v19];

      v20 = [NSNumber numberWithUnsignedLongLong:v33];
      v21 = [NSString stringWithFormat:@"%@_size", v12];
      [v3 setObject:v20 forKey:v21];

      v22 = [NSNumber numberWithUnsignedLongLong:v34];
      v23 = [NSString stringWithFormat:@"%@_elapsed_time", v12];
      [v3 setObject:v22 forKey:v23];

      v24 = [v13 state];
      v9 += v14;
      v25 = [NSString stringWithFormat:@"%@_state", v12];
      [v3 setObject:v24 forKey:v25];

      v7 = v32;
      ++v11;
    }
    while (v11 < [v32 count]);
    unint64_t v26 = v10 >> 30;
    self = v31;
    unint64_t v8 = 0x263F08000;
  }
  else
  {
    unint64_t v26 = 0;
    uint64_t v9 = 0;
  }
  v27 = [*(id *)(v8 + 2584) numberWithUnsignedLongLong:v9];
  [v3 setObject:v27 forKey:@"data"];

  v28 = [*(id *)(v8 + 2584) numberWithUnsignedLongLong:v26];
  [v3 setObject:v28 forKey:@"data_size"];

  v29 = [*(id *)(v8 + 2584) numberWithUnsignedLongLong:self->_elapsedTime / 0x3C];
  [v3 setObject:v29 forKey:@"elapsed_time"];

  return v3;
}

- (NSString)androidAPILevel
{
  return self->_androidAPILevel;
}

- (void)setAndroidAPILevel:(id)a3
{
}

- (NSString)androidBrand
{
  return self->_androidBrand;
}

- (void)setAndroidBrand:(id)a3
{
}

- (NSString)androidLocale
{
  return self->_androidLocale;
}

- (void)setAndroidLocale:(id)a3
{
}

- (NSString)androidModel
{
  return self->_androidModel;
}

- (void)setAndroidModel:(id)a3
{
}

- (NSString)androidOSVersion
{
  return self->_androidOSVersion;
}

- (void)setAndroidOSVersion:(id)a3
{
}

- (NSString)androidVersion
{
  return self->_androidVersion;
}

- (void)setAndroidVersion:(id)a3
{
}

- (NSString)androidVersionCode
{
  return self->_androidVersionCode;
}

- (void)setAndroidVersionCode:(id)a3
{
}

- (unint64_t)data
{
  return self->_data;
}

- (void)setData:(unint64_t)a3
{
  self->_data = a3;
}

- (unint64_t)dataSize
{
  return self->_dataSize;
}

- (void)setDataSize:(unint64_t)a3
{
  self->_dataSize = a3;
}

- (unint64_t)elapsedTime
{
  return self->_elapsedTime;
}

- (void)setElapsedTime:(unint64_t)a3
{
  self->_elapsedTime = a3;
}

- (NSString)state
{
  return self->_state;
}

- (void)setState:(id)a3
{
}

- (WLFeaturePayload)messages
{
  return self->_messages;
}

- (void)setMessages:(id)a3
{
}

- (WLFeaturePayload)photos
{
  return self->_photos;
}

- (void)setPhotos:(id)a3
{
}

- (WLFeaturePayload)videos
{
  return self->_videos;
}

- (void)setVideos:(id)a3
{
}

- (WLFeaturePayload)voiceMemos
{
  return self->_voiceMemos;
}

- (WLFeaturePayload)contacts
{
  return self->_contacts;
}

- (void)setContacts:(id)a3
{
}

- (WLFeaturePayload)callHistory
{
  return self->_callHistory;
}

- (WLFeaturePayload)calendars
{
  return self->_calendars;
}

- (void)setCalendars:(id)a3
{
}

- (WLFeaturePayload)bookmarks
{
  return self->_bookmarks;
}

- (void)setBookmarks:(id)a3
{
}

- (WLFeaturePayload)accounts
{
  return self->_accounts;
}

- (void)setAccounts:(id)a3
{
}

- (WLFeaturePayload)files
{
  return self->_files;
}

- (void)setFiles:(id)a3
{
}

- (WLFeaturePayload)accessibilitySettings
{
  return self->_accessibilitySettings;
}

- (void)setAccessibilitySettings:(id)a3
{
}

- (WLFeaturePayload)displaySettings
{
  return self->_displaySettings;
}

- (void)setDisplaySettings:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displaySettings, 0);
  objc_storeStrong((id *)&self->_accessibilitySettings, 0);
  objc_storeStrong((id *)&self->_files, 0);
  objc_storeStrong((id *)&self->_accounts, 0);
  objc_storeStrong((id *)&self->_bookmarks, 0);
  objc_storeStrong((id *)&self->_calendars, 0);
  objc_storeStrong((id *)&self->_callHistory, 0);
  objc_storeStrong((id *)&self->_contacts, 0);
  objc_storeStrong((id *)&self->_voiceMemos, 0);
  objc_storeStrong((id *)&self->_videos, 0);
  objc_storeStrong((id *)&self->_photos, 0);
  objc_storeStrong((id *)&self->_messages, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_androidVersionCode, 0);
  objc_storeStrong((id *)&self->_androidVersion, 0);
  objc_storeStrong((id *)&self->_androidOSVersion, 0);
  objc_storeStrong((id *)&self->_androidModel, 0);
  objc_storeStrong((id *)&self->_androidLocale, 0);
  objc_storeStrong((id *)&self->_androidBrand, 0);

  objc_storeStrong((id *)&self->_androidAPILevel, 0);
}

@end