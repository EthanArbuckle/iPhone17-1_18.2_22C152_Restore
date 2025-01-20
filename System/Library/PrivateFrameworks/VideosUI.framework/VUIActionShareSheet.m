@interface VUIActionShareSheet
- (CGRect)sourceRect;
- (NSDictionary)groupActivityMetadata;
- (NSString)imageURLStr;
- (NSString)previewUrlStr;
- (NSString)sharedWatchId;
- (NSString)subtitle;
- (NSString)title;
- (NSString)urlString;
- (NSURL)sharedWatchUrl;
- (UIView)sourceView;
- (VUIActionShareSheet)initWithContextData:(id)a3 sourceRect:(CGRect)a4;
- (VUIActionShareSheet)initWithContextData:(id)a3 sourceView:(id)a4;
- (void)performWithTargetResponder:(id)a3 completionHandler:(id)a4;
- (void)setGroupActivityMetadata:(id)a3;
- (void)setImageURLStr:(id)a3;
- (void)setPreviewUrlStr:(id)a3;
- (void)setSharedWatchId:(id)a3;
- (void)setSharedWatchUrl:(id)a3;
- (void)setSourceRect:(CGRect)a3;
- (void)setSourceView:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
- (void)setUrlString:(id)a3;
@end

@implementation VUIActionShareSheet

- (VUIActionShareSheet)initWithContextData:(id)a3 sourceView:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v31.receiver = self;
  v31.super_class = (Class)VUIActionShareSheet;
  v8 = [(VUIActionShareSheet *)&v31 init];
  if (v8)
  {
    uint64_t v9 = objc_msgSend(v6, "vui_stringForKey:", @"shareURL");
    urlString = v8->_urlString;
    v8->_urlString = (NSString *)v9;

    uint64_t v11 = objc_msgSend(v6, "vui_stringForKey:", @"shareTitle");
    title = v8->_title;
    v8->_title = (NSString *)v11;

    uint64_t v13 = objc_msgSend(v6, "vui_stringForKey:", @"shareSubtitle");
    subtitle = v8->_subtitle;
    v8->_subtitle = (NSString *)v13;

    uint64_t v15 = objc_msgSend(v6, "vui_stringForKey:", @"shareImageURL");
    imageURLStr = v8->_imageURLStr;
    v8->_imageURLStr = (NSString *)v15;

    uint64_t v17 = objc_msgSend(v6, "vui_stringForKey:", @"shareSharedWatchId");
    sharedWatchId = v8->_sharedWatchId;
    v8->_sharedWatchId = (NSString *)v17;

    uint64_t v19 = objc_msgSend(v6, "vui_URLForKey:", @"shareSharedWatchUrl");
    sharedWatchUrl = v8->_sharedWatchUrl;
    v8->_sharedWatchUrl = (NSURL *)v19;

    uint64_t v21 = objc_msgSend(v6, "vui_dictionaryForKey:", @"groupActivityMetadata");
    groupActivityMetadata = v8->_groupActivityMetadata;
    v8->_groupActivityMetadata = (NSDictionary *)v21;

    objc_storeStrong((id *)&v8->_sourceView, a4);
    [v7 bounds];
    v8->_sourceRect.origin.x = v23;
    v8->_sourceRect.origin.y = v24;
    v8->_sourceRect.size.width = v25;
    v8->_sourceRect.size.height = v26;
    uint64_t v27 = objc_msgSend(v6, "vui_stringForKey:", @"previewURL");
    previewUrlStr = v8->_previewUrlStr;
    v8->_previewUrlStr = (NSString *)v27;

    if (!v8->_urlString || !v8->_sourceView || ![(NSString *)v8->_imageURLStr length])
    {
      v29 = VUIDefaultLogObject();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
        -[VUIActionShareSheet initWithContextData:sourceView:](v29);
      }
    }
  }

  return v8;
}

- (VUIActionShareSheet)initWithContextData:(id)a3 sourceRect:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v9 = a3;
  v10 = [[VUIActionShareSheet alloc] initWithContextData:v9 sourceView:0];

  -[VUIActionShareSheet setSourceRect:](v10, "setSourceRect:", x, y, width, height);
  return v10;
}

- (void)performWithTargetResponder:(id)a3 completionHandler:(id)a4
{
  id v6 = (UIView *)a3;
  id v7 = (void (**)(id, uint64_t))a4;
  if (self->_urlString)
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    sourceView = v6;
    if ((isKindOfClass & 1) == 0) {
      sourceView = self->_sourceView;
    }
    v10 = sourceView;
    groupActivityMetadata = self->_groupActivityMetadata;
    if (groupActivityMetadata && [(NSDictionary *)groupActivityMetadata count]) {
      +[VUIShareActivityViewController_iOS shareMediaItem:self->_urlString previewURLString:0 title:self->_title subtitle:self->_subtitle imageURLStr:self->_imageURLStr groupActivityMetadata:self->_groupActivityMetadata sourceView:v10 completionHandler:v7];
    }
    else {
      +[VUIShareActivityViewController_iOS shareMediaItem:self->_urlString previewURLString:0 title:self->_title subtitle:self->_subtitle imageURLStr:self->_imageURLStr sharedWatchId:self->_sharedWatchId sharedWatchUrl:self->_sharedWatchUrl sourceView:v10 completionHandler:v7];
    }
  }
  else
  {
    v12 = VUIDefaultLogObject();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[VUIActionShareSheet performWithTargetResponder:completionHandler:](v12);
    }

    if (v7) {
      v7[2](v7, 1);
    }
  }
}

- (NSString)urlString
{
  return self->_urlString;
}

- (void)setUrlString:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
}

- (NSString)imageURLStr
{
  return self->_imageURLStr;
}

- (void)setImageURLStr:(id)a3
{
}

- (NSString)sharedWatchId
{
  return self->_sharedWatchId;
}

- (void)setSharedWatchId:(id)a3
{
}

- (NSURL)sharedWatchUrl
{
  return self->_sharedWatchUrl;
}

- (void)setSharedWatchUrl:(id)a3
{
}

- (NSString)previewUrlStr
{
  return self->_previewUrlStr;
}

- (void)setPreviewUrlStr:(id)a3
{
}

- (UIView)sourceView
{
  return self->_sourceView;
}

- (void)setSourceView:(id)a3
{
}

- (CGRect)sourceRect
{
  double x = self->_sourceRect.origin.x;
  double y = self->_sourceRect.origin.y;
  double width = self->_sourceRect.size.width;
  double height = self->_sourceRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setSourceRect:(CGRect)a3
{
  self->_sourceRect = a3;
}

- (NSDictionary)groupActivityMetadata
{
  return self->_groupActivityMetadata;
}

- (void)setGroupActivityMetadata:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupActivityMetadata, 0);
  objc_storeStrong((id *)&self->_sourceView, 0);
  objc_storeStrong((id *)&self->_previewUrlStr, 0);
  objc_storeStrong((id *)&self->_sharedWatchUrl, 0);
  objc_storeStrong((id *)&self->_sharedWatchId, 0);
  objc_storeStrong((id *)&self->_imageURLStr, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_urlString, 0);
}

- (void)initWithContextData:(os_log_t)log sourceView:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1E2BD7000, log, OS_LOG_TYPE_ERROR, "SHARESHEET: One of required params to share (URL, source view, image) are missing", v1, 2u);
}

- (void)performWithTargetResponder:(os_log_t)log completionHandler:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1E2BD7000, log, OS_LOG_TYPE_ERROR, "SHARESHEET: Required params Share URL and Source View are missing", v1, 2u);
}

@end