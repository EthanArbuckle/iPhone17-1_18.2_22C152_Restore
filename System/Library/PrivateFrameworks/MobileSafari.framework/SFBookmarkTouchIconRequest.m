@interface SFBookmarkTouchIconRequest
+ (id)requestWithBookmark:(id)a3 iconGenerationEnabled:(BOOL)a4;
- (BOOL)isEqual:(id)a3;
- (SFBookmarkTouchIconRequest)initWithBookmark:(id)a3 iconGenerationEnabled:(BOOL)a4;
- (WebBookmark)bookmark;
@end

@implementation SFBookmarkTouchIconRequest

- (SFBookmarkTouchIconRequest)initWithBookmark:(id)a3 iconGenerationEnabled:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  v8 = (void *)MEMORY[0x1E4F1CB10];
  v9 = [v7 address];
  v10 = objc_msgSend(v8, "safari_URLWithUserTypedString:", v9);

  v11 = [v7 title];
  +[_SFSiteIcon minimumAcceptableSizeForDownloadedIcon];
  double v13 = v12;
  double v15 = v14;
  +[_SFSiteIcon defaultSize];
  v21.receiver = self;
  v21.super_class = (Class)SFBookmarkTouchIconRequest;
  v18 = -[WBSTouchIconRequest initWithTitle:url:minimumIconSize:maximumIconSize:monogramConfiguration:options:](&v21, sel_initWithTitle_url_minimumIconSize_maximumIconSize_monogramConfiguration_options_, v11, v10, 0, v4 | 2, v13, v15, v16, v17);

  if (v18)
  {
    objc_storeStrong((id *)&v18->_bookmark, a3);
    v19 = v18;
  }

  return v18;
}

- (void).cxx_destruct
{
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SFBookmarkTouchIconRequest;
  if ([(WBSTouchIconRequest *)&v9 isEqual:v4])
  {
    bookmark = self->_bookmark;
    v6 = [v4 bookmark];
    char v7 = [(WebBookmark *)bookmark isEqual:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (WebBookmark)bookmark
{
  return self->_bookmark;
}

+ (id)requestWithBookmark:(id)a3 iconGenerationEnabled:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  char v7 = (void *)[objc_alloc((Class)a1) initWithBookmark:v6 iconGenerationEnabled:v4];

  return v7;
}

@end