@interface MKContext
- (MKContext)init;
- (MKImportContext)accessibilitySetting;
- (MKImportContext)account;
- (MKImportContext)album;
- (MKImportContext)application;
- (MKImportContext)bookmark;
- (MKImportContext)calendar;
- (MKImportContext)callHistory;
- (MKImportContext)contact;
- (MKImportContext)container;
- (MKImportContext)displaySetting;
- (MKImportContext)file;
- (MKImportContext)image;
- (MKImportContext)message;
- (MKImportContext)placeholder;
- (MKImportContext)sim;
- (MKImportContext)video;
- (MKImportContext)voiceMemo;
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
- (void)setMessage:(id)a3;
- (void)setPlaceholder:(id)a3;
- (void)setSim:(id)a3;
- (void)setVideo:(id)a3;
- (void)setVoiceMemo:(id)a3;
@end

@implementation MKContext

- (MKContext)init
{
  v21.receiver = self;
  v21.super_class = (Class)MKContext;
  v2 = [(MKContext *)&v21 init];
  if (v2)
  {
    v3 = objc_alloc_init(MKImportContext);
    [(MKContext *)v2 setApplication:v3];

    v4 = objc_alloc_init(MKImportContext);
    [(MKContext *)v2 setAccount:v4];

    v5 = objc_alloc_init(MKImportContext);
    [(MKContext *)v2 setMessage:v5];

    v6 = objc_alloc_init(MKImportContext);
    [(MKContext *)v2 setContact:v6];

    v7 = objc_alloc_init(MKImportContext);
    [(MKContext *)v2 setCallHistory:v7];

    v8 = objc_alloc_init(MKImportContext);
    [(MKContext *)v2 setCalendar:v8];

    v9 = objc_alloc_init(MKImportContext);
    [(MKContext *)v2 setBookmark:v9];

    v10 = objc_alloc_init(MKImportContext);
    [(MKContext *)v2 setFile:v10];

    v11 = objc_alloc_init(MKImportContext);
    [(MKContext *)v2 setImage:v11];

    v12 = objc_alloc_init(MKImportContext);
    [(MKContext *)v2 setVideo:v12];

    v13 = objc_alloc_init(MKImportContext);
    [(MKContext *)v2 setVoiceMemo:v13];

    v14 = objc_alloc_init(MKImportContext);
    [(MKContext *)v2 setAlbum:v14];

    v15 = objc_alloc_init(MKImportContext);
    [(MKContext *)v2 setContainer:v15];

    v16 = objc_alloc_init(MKImportContext);
    [(MKContext *)v2 setAccessibilitySetting:v16];

    v17 = objc_alloc_init(MKImportContext);
    [(MKContext *)v2 setDisplaySetting:v17];

    v18 = objc_alloc_init(MKImportContext);
    [(MKContext *)v2 setPlaceholder:v18];

    v19 = objc_alloc_init(MKImportContext);
    [(MKContext *)v2 setSim:v19];
  }
  return v2;
}

- (MKImportContext)application
{
  return self->_application;
}

- (void)setApplication:(id)a3
{
}

- (MKImportContext)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
}

- (MKImportContext)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
}

- (MKImportContext)contact
{
  return self->_contact;
}

- (void)setContact:(id)a3
{
}

- (MKImportContext)callHistory
{
  return self->_callHistory;
}

- (void)setCallHistory:(id)a3
{
}

- (MKImportContext)calendar
{
  return self->_calendar;
}

- (void)setCalendar:(id)a3
{
}

- (MKImportContext)bookmark
{
  return self->_bookmark;
}

- (void)setBookmark:(id)a3
{
}

- (MKImportContext)file
{
  return self->_file;
}

- (void)setFile:(id)a3
{
}

- (MKImportContext)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
}

- (MKImportContext)video
{
  return self->_video;
}

- (void)setVideo:(id)a3
{
}

- (MKImportContext)voiceMemo
{
  return self->_voiceMemo;
}

- (void)setVoiceMemo:(id)a3
{
}

- (MKImportContext)album
{
  return self->_album;
}

- (void)setAlbum:(id)a3
{
}

- (MKImportContext)container
{
  return self->_container;
}

- (void)setContainer:(id)a3
{
}

- (MKImportContext)accessibilitySetting
{
  return self->_accessibilitySetting;
}

- (void)setAccessibilitySetting:(id)a3
{
}

- (MKImportContext)displaySetting
{
  return self->_displaySetting;
}

- (void)setDisplaySetting:(id)a3
{
}

- (MKImportContext)placeholder
{
  return self->_placeholder;
}

- (void)setPlaceholder:(id)a3
{
}

- (MKImportContext)sim
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