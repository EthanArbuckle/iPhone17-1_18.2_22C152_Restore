@interface WLContext
+ (BOOL)supportsSecureCoding;
- (BOOL)isEnabled;
- (WLContext)init;
- (WLContext)initWithCoder:(id)a3;
- (WLImportContext)accessibilitySetting;
- (WLImportContext)account;
- (WLImportContext)album;
- (WLImportContext)application;
- (WLImportContext)bookmark;
- (WLImportContext)calendar;
- (WLImportContext)callHistory;
- (WLImportContext)contact;
- (WLImportContext)container;
- (WLImportContext)displaySetting;
- (WLImportContext)file;
- (WLImportContext)image;
- (WLImportContext)message;
- (WLImportContext)placeholder;
- (WLImportContext)sim;
- (WLImportContext)video;
- (WLImportContext)voiceMemo;
- (void)encodeWithCoder:(id)a3;
- (void)setAccessibilitySetting:(id)a3;
- (void)setAccount:(id)a3;
- (void)setAlbum:(id)a3;
- (void)setApplication:(id)a3;
- (void)setBookmark:(id)a3;
- (void)setCalendar:(id)a3;
- (void)setCallHistory:(id)a3;
- (void)setContact:(id)a3;
- (void)setContainer:(id)a3;
- (void)setDisplaySetting:(id)a3;
- (void)setFile:(id)a3;
- (void)setImage:(id)a3;
- (void)setIsEnabled:(BOOL)a3;
- (void)setMessage:(id)a3;
- (void)setPlaceholder:(id)a3;
- (void)setSim:(id)a3;
- (void)setVideo:(id)a3;
- (void)setVoiceMemo:(id)a3;
@end

@implementation WLContext

- (WLContext)init
{
  v22.receiver = self;
  v22.super_class = (Class)WLContext;
  v2 = [(WLContext *)&v22 init];
  v3 = v2;
  if (v2)
  {
    [(WLContext *)v2 setIsEnabled:1];
    v4 = objc_alloc_init(WLImportContext);
    [(WLContext *)v3 setApplication:v4];

    v5 = objc_alloc_init(WLImportContext);
    [(WLContext *)v3 setAccount:v5];

    v6 = objc_alloc_init(WLImportContext);
    [(WLContext *)v3 setMessage:v6];

    v7 = objc_alloc_init(WLImportContext);
    [(WLContext *)v3 setContact:v7];

    v8 = objc_alloc_init(WLImportContext);
    [(WLContext *)v3 setCallHistory:v8];

    v9 = objc_alloc_init(WLImportContext);
    [(WLContext *)v3 setCalendar:v9];

    v10 = objc_alloc_init(WLImportContext);
    [(WLContext *)v3 setBookmark:v10];

    v11 = objc_alloc_init(WLImportContext);
    [(WLContext *)v3 setFile:v11];

    v12 = objc_alloc_init(WLImportContext);
    [(WLContext *)v3 setImage:v12];

    v13 = objc_alloc_init(WLImportContext);
    [(WLContext *)v3 setVideo:v13];

    v14 = objc_alloc_init(WLImportContext);
    [(WLContext *)v3 setAlbum:v14];

    v15 = objc_alloc_init(WLImportContext);
    [(WLContext *)v3 setVoiceMemo:v15];

    v16 = objc_alloc_init(WLImportContext);
    [(WLContext *)v3 setContainer:v16];

    v17 = objc_alloc_init(WLImportContext);
    [(WLContext *)v3 setAccessibilitySetting:v17];

    v18 = objc_alloc_init(WLImportContext);
    [(WLContext *)v3 setDisplaySetting:v18];

    v19 = objc_alloc_init(WLImportContext);
    [(WLContext *)v3 setPlaceholder:v19];

    v20 = objc_alloc_init(WLImportContext);
    [(WLContext *)v3 setSim:v20];
  }
  return v3;
}

- (WLContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)WLContext;
  v5 = [(WLContext *)&v24 init];
  if (v5)
  {
    -[WLContext setIsEnabled:](v5, "setIsEnabled:", [v4 decodeBoolForKey:@"is_enabled"]);
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"application"];
    [(WLContext *)v5 setApplication:v6];

    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"account"];
    [(WLContext *)v5 setAccount:v7];

    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"message"];
    [(WLContext *)v5 setMessage:v8];

    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"contact"];
    [(WLContext *)v5 setContact:v9];

    v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"call_history"];
    [(WLContext *)v5 setCallHistory:v10];

    v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"calendar"];
    [(WLContext *)v5 setCalendar:v11];

    v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bookmark"];
    [(WLContext *)v5 setBookmark:v12];

    v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"file"];
    [(WLContext *)v5 setFile:v13];

    v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"image"];
    [(WLContext *)v5 setImage:v14];

    v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"video"];
    [(WLContext *)v5 setVideo:v15];

    v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"album"];
    [(WLContext *)v5 setAlbum:v16];

    v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"voice_memo"];
    [(WLContext *)v5 setVoiceMemo:v17];

    v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"container"];
    [(WLContext *)v5 setContainer:v18];

    v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accessibility_setting"];
    [(WLContext *)v5 setAccessibilitySetting:v19];

    v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"display_setting"];
    [(WLContext *)v5 setDisplaySetting:v20];

    v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"placeholder"];
    [(WLContext *)v5 setPlaceholder:v21];

    objc_super v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sim"];
    [(WLContext *)v5 setSim:v22];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  BOOL isEnabled = self->_isEnabled;
  id v5 = a3;
  [v5 encodeBool:isEnabled forKey:@"is_enabled"];
  [v5 encodeObject:self->_application forKey:@"application"];
  [v5 encodeObject:self->_account forKey:@"account"];
  [v5 encodeObject:self->_message forKey:@"message"];
  [v5 encodeObject:self->_contact forKey:@"contact"];
  [v5 encodeObject:self->_callHistory forKey:@"call_history"];
  [v5 encodeObject:self->_calendar forKey:@"calendar"];
  [v5 encodeObject:self->_bookmark forKey:@"bookmark"];
  [v5 encodeObject:self->_file forKey:@"file"];
  [v5 encodeObject:self->_image forKey:@"image"];
  [v5 encodeObject:self->_video forKey:@"video"];
  [v5 encodeObject:self->_album forKey:@"album"];
  [v5 encodeObject:self->_voiceMemo forKey:@"voice_memo"];
  [v5 encodeObject:self->_container forKey:@"container"];
  [v5 encodeObject:self->_accessibilitySetting forKey:@"accessibility_setting"];
  [v5 encodeObject:self->_displaySetting forKey:@"display_setting"];
  [v5 encodeObject:self->_placeholder forKey:@"placeholder"];
  [v5 encodeObject:self->_sim forKey:@"sim"];
}

- (BOOL)isEnabled
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  long long v20 = *(_OWORD *)&self->_application;
  message = self->_message;
  long long v22 = *(_OWORD *)&self->_contact;
  calendar = self->_calendar;
  long long v3 = *(_OWORD *)&self->_image;
  long long v24 = *(_OWORD *)&self->_bookmark;
  long long v25 = v3;
  voiceMemo = self->_voiceMemo;
  album = self->_album;
  v27 = voiceMemo;
  accessibilitySetting = self->_accessibilitySetting;
  container = self->_container;
  v29 = accessibilitySetting;
  long long v30 = *(_OWORD *)&self->_displaySetting;
  sim = self->_sim;
  [MEMORY[0x263EFF8C0] arrayWithObjects:&v20 count:17];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v11, "importCount", (void)v15) || objc_msgSend(v11, "importErrorCount"))
        {
          char v12 = 1;
          goto LABEL_13;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      char v12 = 0;
      if (v8) {
        continue;
      }
      break;
    }
  }
  else
  {
    char v12 = 0;
  }
LABEL_13:

  if (self->_isEnabled) {
    BOOL v13 = v12;
  }
  else {
    BOOL v13 = 0;
  }

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setIsEnabled:(BOOL)a3
{
  self->_BOOL isEnabled = a3;
}

- (WLImportContext)application
{
  return self->_application;
}

- (void)setApplication:(id)a3
{
}

- (WLImportContext)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
}

- (WLImportContext)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
}

- (WLImportContext)contact
{
  return self->_contact;
}

- (void)setContact:(id)a3
{
}

- (WLImportContext)callHistory
{
  return self->_callHistory;
}

- (void)setCallHistory:(id)a3
{
}

- (WLImportContext)calendar
{
  return self->_calendar;
}

- (void)setCalendar:(id)a3
{
}

- (WLImportContext)bookmark
{
  return self->_bookmark;
}

- (void)setBookmark:(id)a3
{
}

- (WLImportContext)file
{
  return self->_file;
}

- (void)setFile:(id)a3
{
}

- (WLImportContext)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
}

- (WLImportContext)video
{
  return self->_video;
}

- (void)setVideo:(id)a3
{
}

- (WLImportContext)voiceMemo
{
  return self->_voiceMemo;
}

- (void)setVoiceMemo:(id)a3
{
}

- (WLImportContext)album
{
  return self->_album;
}

- (void)setAlbum:(id)a3
{
}

- (WLImportContext)container
{
  return self->_container;
}

- (void)setContainer:(id)a3
{
}

- (WLImportContext)accessibilitySetting
{
  return self->_accessibilitySetting;
}

- (void)setAccessibilitySetting:(id)a3
{
}

- (WLImportContext)displaySetting
{
  return self->_displaySetting;
}

- (void)setDisplaySetting:(id)a3
{
}

- (WLImportContext)placeholder
{
  return self->_placeholder;
}

- (void)setPlaceholder:(id)a3
{
}

- (WLImportContext)sim
{
  return self->_sim;
}

- (void)setSim:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sim, 0);
  objc_storeStrong((id *)&self->_placeholder, 0);
  objc_storeStrong((id *)&self->_displaySetting, 0);
  objc_storeStrong((id *)&self->_accessibilitySetting, 0);
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_album, 0);
  objc_storeStrong((id *)&self->_voiceMemo, 0);
  objc_storeStrong((id *)&self->_video, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_file, 0);
  objc_storeStrong((id *)&self->_bookmark, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_storeStrong((id *)&self->_callHistory, 0);
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_account, 0);

  objc_storeStrong((id *)&self->_application, 0);
}

@end