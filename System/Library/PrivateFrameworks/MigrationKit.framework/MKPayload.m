@interface MKPayload
- (MKFeaturePayload)accessibilitySettings;
- (MKFeaturePayload)accounts;
- (MKFeaturePayload)bookmarks;
- (MKFeaturePayload)calendars;
- (MKFeaturePayload)contacts;
- (MKFeaturePayload)displaySettings;
- (MKFeaturePayload)files;
- (MKFeaturePayload)messages;
- (MKFeaturePayload)photos;
- (MKFeaturePayload)videos;
- (MKFeaturePayload)whatsapp;
- (MKPayload)init;
- (NSString)androidAPILevel;
- (NSString)androidBrand;
- (NSString)androidLocale;
- (NSString)androidModel;
- (NSString)androidOSVersion;
- (NSString)androidVersion;
- (NSString)androidVersionCode;
- (NSString)state;
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
- (void)setWhatsapp:(id)a3;
@end

@implementation MKPayload

- (MKPayload)init
{
  v16.receiver = self;
  v16.super_class = (Class)MKPayload;
  v2 = [(MKPayload *)&v16 init];
  v3 = v2;
  if (v2)
  {
    [(MKPayload *)v2 setAndroidAPILevel:@"?"];
    [(MKPayload *)v3 setAndroidBrand:@"?"];
    [(MKPayload *)v3 setAndroidLocale:@"?"];
    [(MKPayload *)v3 setAndroidModel:@"?"];
    [(MKPayload *)v3 setAndroidOSVersion:@"?"];
    [(MKPayload *)v3 setAndroidVersion:@"?"];
    [(MKPayload *)v3 setAndroidVersionCode:@"?"];
    [(MKPayload *)v3 setState:@"?"];
    v4 = objc_alloc_init(MKFeaturePayload);
    [(MKPayload *)v3 setMessages:v4];

    v5 = objc_alloc_init(MKFeaturePayload);
    [(MKPayload *)v3 setPhotos:v5];

    v6 = objc_alloc_init(MKFeaturePayload);
    [(MKPayload *)v3 setVideos:v6];

    v7 = objc_alloc_init(MKFeaturePayload);
    [(MKPayload *)v3 setContacts:v7];

    v8 = objc_alloc_init(MKFeaturePayload);
    [(MKPayload *)v3 setCalendars:v8];

    v9 = objc_alloc_init(MKFeaturePayload);
    [(MKPayload *)v3 setBookmarks:v9];

    v10 = objc_alloc_init(MKFeaturePayload);
    [(MKPayload *)v3 setAccounts:v10];

    v11 = objc_alloc_init(MKFeaturePayload);
    [(MKPayload *)v3 setFiles:v11];

    v12 = objc_alloc_init(MKFeaturePayload);
    [(MKPayload *)v3 setWhatsapp:v12];

    v13 = objc_alloc_init(MKFeaturePayload);
    [(MKPayload *)v3 setAccessibilitySettings:v13];

    v14 = objc_alloc_init(MKFeaturePayload);
    [(MKPayload *)v3 setDisplaySettings:v14];
  }
  return v3;
}

- (id)dictionary
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  [v3 setObject:self->_androidAPILevel forKey:@"android_api_level"];
  [v3 setObject:self->_androidBrand forKey:@"android_brand"];
  [v3 setObject:self->_androidLocale forKey:@"android_locale"];
  [v3 setObject:self->_androidModel forKey:@"android_model"];
  [v3 setObject:self->_androidOSVersion forKey:@"android_os_version"];
  [v3 setObject:self->_androidVersion forKey:@"android_version"];
  [v3 setObject:self->_androidVersionCode forKey:@"android_version_code"];
  [v3 setObject:self->_state forKey:@"state"];
  long long v38 = *(_OWORD *)&self->_messages;
  videos = self->_videos;
  long long v40 = *(_OWORD *)&self->_contacts;
  bookmarks = self->_bookmarks;
  long long v4 = *(_OWORD *)&self->_whatsapp;
  long long v42 = *(_OWORD *)&self->_accounts;
  long long v43 = v4;
  displaySettings = self->_displaySettings;
  v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v38 count:11];
  unint64_t v6 = 0x263F08000uLL;
  if ([v5 count])
  {
    v34 = self;
    v35 = v5;
    uint64_t v7 = 0;
    unint64_t v8 = 0;
    unint64_t v9 = 0;
    do
    {
      v10 = [&unk_26DF7B0A0 objectAtIndexedSubscript:v9];
      v11 = [v5 objectAtIndexedSubscript:v9];
      uint64_t v12 = [v11 count];
      unint64_t v13 = [v11 size];
      unint64_t v36 = v13 >> 30;
      unint64_t v37 = [v11 totalElapsedTime] / 0x3CuLL;
      v14 = [v11 importElapsedTime];
      [v14 doubleValue];
      double v16 = v15 / 60.0;

      v8 += v13;
      v17 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v11, "enabled"));
      v18 = [NSString stringWithFormat:@"%@_enabled", v10];
      [v3 setObject:v17 forKey:v18];

      v19 = [NSNumber numberWithUnsignedLongLong:v12];
      v20 = [NSString stringWithFormat:@"%@", v10];
      [v3 setObject:v19 forKey:v20];

      v21 = [NSNumber numberWithUnsignedLongLong:v36];
      v22 = [NSString stringWithFormat:@"%@_size", v10];
      [v3 setObject:v21 forKey:v22];

      v23 = [NSNumber numberWithUnsignedLongLong:v37];
      v24 = [NSString stringWithFormat:@"%@_elapsed_time", v10];
      [v3 setObject:v23 forKey:v24];

      v7 += v12;
      v25 = [NSNumber numberWithDouble:v16];
      v26 = [NSString stringWithFormat:@"%@_import_time", v10];
      [v3 setObject:v25 forKey:v26];

      v27 = [v11 state];
      v28 = [NSString stringWithFormat:@"%@_state", v10];
      [v3 setObject:v27 forKey:v28];

      v5 = v35;
      ++v9;
    }
    while (v9 < [v35 count]);
    unint64_t v29 = v8 >> 30;
    self = v34;
    unint64_t v6 = 0x263F08000;
  }
  else
  {
    unint64_t v29 = 0;
    uint64_t v7 = 0;
  }
  v30 = [*(id *)(v6 + 2584) numberWithUnsignedLongLong:v7];
  [v3 setObject:v30 forKey:@"data"];

  v31 = [*(id *)(v6 + 2584) numberWithUnsignedLongLong:v29];
  [v3 setObject:v31 forKey:@"data_size"];

  v32 = [*(id *)(v6 + 2584) numberWithUnsignedLongLong:self->_elapsedTime / 0x3C];
  [v3 setObject:v32 forKey:@"elapsed_time"];

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

- (MKFeaturePayload)messages
{
  return self->_messages;
}

- (void)setMessages:(id)a3
{
}

- (MKFeaturePayload)photos
{
  return self->_photos;
}

- (void)setPhotos:(id)a3
{
}

- (MKFeaturePayload)videos
{
  return self->_videos;
}

- (void)setVideos:(id)a3
{
}

- (MKFeaturePayload)contacts
{
  return self->_contacts;
}

- (void)setContacts:(id)a3
{
}

- (MKFeaturePayload)calendars
{
  return self->_calendars;
}

- (void)setCalendars:(id)a3
{
}

- (MKFeaturePayload)bookmarks
{
  return self->_bookmarks;
}

- (void)setBookmarks:(id)a3
{
}

- (MKFeaturePayload)accounts
{
  return self->_accounts;
}

- (void)setAccounts:(id)a3
{
}

- (MKFeaturePayload)files
{
  return self->_files;
}

- (void)setFiles:(id)a3
{
}

- (MKFeaturePayload)whatsapp
{
  return self->_whatsapp;
}

- (void)setWhatsapp:(id)a3
{
}

- (MKFeaturePayload)accessibilitySettings
{
  return self->_accessibilitySettings;
}

- (void)setAccessibilitySettings:(id)a3
{
}

- (MKFeaturePayload)displaySettings
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
  objc_storeStrong((id *)&self->_whatsapp, 0);
  objc_storeStrong((id *)&self->_files, 0);
  objc_storeStrong((id *)&self->_accounts, 0);
  objc_storeStrong((id *)&self->_bookmarks, 0);
  objc_storeStrong((id *)&self->_calendars, 0);
  objc_storeStrong((id *)&self->_contacts, 0);
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