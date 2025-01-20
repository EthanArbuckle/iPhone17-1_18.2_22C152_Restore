@interface SFUIActivityImageRequest
- (NSString)contentSizeCategory;
- (NSString)uti;
- (SFUIActivityImageRequest)initWithRequestID:(int)a3 activity:(id)a4 contentSizeCategory:(id)a5 userInterfaceStyle:(int64_t)a6 imageSymbolConfiguration:(id)a7 synchronous:(BOOL)a8 resultHandler:(id)a9;
- (SFUIActivityImageRequest)initWithRequestID:(int)a3 identifier:(id)a4 activityCategory:(int64_t)a5 contentSizeCategory:(id)a6 userInterfaceStyle:(int64_t)a7 iconFormat:(int)a8 synchronous:(BOOL)a9 resultHandler:(id)a10;
- (SFUIActivityImageRequest)initWithRequestID:(int)a3 uti:(id)a4 activityCategory:(int64_t)a5 contentSizeCategory:(id)a6 userInterfaceStyle:(int64_t)a7 iconFormat:(int)a8 synchronous:(BOOL)a9 resultHandler:(id)a10;
- (UIActivity)activity;
- (UIImageSymbolConfiguration)imageSymbolConfiguration;
- (int)iconFormat;
- (int64_t)activityCategory;
- (int64_t)userInterfaceStyle;
@end

@implementation SFUIActivityImageRequest

- (SFUIActivityImageRequest)initWithRequestID:(int)a3 identifier:(id)a4 activityCategory:(int64_t)a5 contentSizeCategory:(id)a6 userInterfaceStyle:(int64_t)a7 iconFormat:(int)a8 synchronous:(BOOL)a9 resultHandler:(id)a10
{
  uint64_t v15 = *(void *)&a3;
  id v17 = a6;
  v21.receiver = self;
  v21.super_class = (Class)SFUIActivityImageRequest;
  v18 = [(SFUIImageRequest *)&v21 initWithRequestID:v15 identifier:a4 synchronous:a9 resultHandler:a10];
  v19 = v18;
  if (v18)
  {
    v18->_activityCategory = a5;
    objc_storeStrong((id *)&v18->_contentSizeCategory, a6);
    v19->_userInterfaceStyle = a7;
    v19->_iconFormat = a8;
  }

  return v19;
}

- (SFUIActivityImageRequest)initWithRequestID:(int)a3 uti:(id)a4 activityCategory:(int64_t)a5 contentSizeCategory:(id)a6 userInterfaceStyle:(int64_t)a7 iconFormat:(int)a8 synchronous:(BOOL)a9 resultHandler:(id)a10
{
  uint64_t v14 = *(void *)&a3;
  id v16 = a4;
  id v17 = a6;
  v22.receiver = self;
  v22.super_class = (Class)SFUIActivityImageRequest;
  v18 = [(SFUIImageRequest *)&v22 initWithRequestID:v14 identifier:v16 synchronous:a9 resultHandler:a10];
  v19 = v18;
  if (v18)
  {
    v18->_activityCategory = a5;
    objc_storeStrong((id *)&v18->_contentSizeCategory, a6);
    v19->_userInterfaceStyle = a7;
    v19->_iconFormat = a8;
    objc_storeStrong((id *)&v19->_uti, a4);
  }

  return v19;
}

- (SFUIActivityImageRequest)initWithRequestID:(int)a3 activity:(id)a4 contentSizeCategory:(id)a5 userInterfaceStyle:(int64_t)a6 imageSymbolConfiguration:(id)a7 synchronous:(BOOL)a8 resultHandler:(id)a9
{
  BOOL v9 = a8;
  uint64_t v13 = *(void *)&a3;
  id v15 = a4;
  id v23 = a5;
  id v22 = a7;
  id v16 = a9;
  id v17 = [v15 activityUUID];
  v18 = [v17 UUIDString];
  v24.receiver = self;
  v24.super_class = (Class)SFUIActivityImageRequest;
  v19 = [(SFUIImageRequest *)&v24 initWithRequestID:v13 identifier:v18 synchronous:v9 resultHandler:v16];

  if (v19)
  {
    objc_storeStrong((id *)&v19->_activity, a4);
    objc_storeStrong((id *)&v19->_contentSizeCategory, a5);
    v19->_userInterfaceStyle = a6;
    objc_storeStrong((id *)&v19->_imageSymbolConfiguration, a7);
  }

  return v19;
}

- (int64_t)activityCategory
{
  return self->_activityCategory;
}

- (NSString)contentSizeCategory
{
  return self->_contentSizeCategory;
}

- (int64_t)userInterfaceStyle
{
  return self->_userInterfaceStyle;
}

- (int)iconFormat
{
  return self->_iconFormat;
}

- (UIActivity)activity
{
  return self->_activity;
}

- (UIImageSymbolConfiguration)imageSymbolConfiguration
{
  return self->_imageSymbolConfiguration;
}

- (NSString)uti
{
  return self->_uti;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uti, 0);
  objc_storeStrong((id *)&self->_imageSymbolConfiguration, 0);
  objc_storeStrong((id *)&self->_activity, 0);
  objc_storeStrong((id *)&self->_contentSizeCategory, 0);
}

@end