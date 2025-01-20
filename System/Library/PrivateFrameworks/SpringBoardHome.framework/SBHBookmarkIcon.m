@interface SBHBookmarkIcon
- (BOOL)canBeAddedToMultiItemDrag;
- (BOOL)canBeAddedToSubfolder;
- (BOOL)displaysAppStoreURLShortcutItem;
- (BOOL)displaysShareBookmarkShortcutItem;
- (BOOL)isAppClipIcon;
- (BOOL)isBookmarkIcon;
- (BOOL)isWebAppIcon;
- (CPSWebClip)appClip;
- (NSURL)launchURL;
- (SBHBookmark)bookmark;
- (SBHBookmarkIcon)initWithBookmark:(id)a3;
- (UIWebClip)webClip;
- (id)_sbhIconLibraryOverrideCollationSectionTitle;
- (id)copyWithZone:(_NSZone *)a3;
- (id)draggingUserActivity;
- (id)uninstallAlertBody;
- (id)uninstallAlertTitle;
- (uint64_t)_isSaneURL;
- (void)setBookmark:(id)a3;
@end

@implementation SBHBookmarkIcon

- (SBHBookmarkIcon)initWithBookmark:(id)a3
{
  id v5 = a3;
  v6 = [v5 identifier];
  v9.receiver = self;
  v9.super_class = (Class)SBHBookmarkIcon;
  v7 = [(SBLeafIcon *)&v9 initWithLeafIdentifier:v6 applicationBundleID:0];

  if (v7)
  {
    objc_storeStrong((id *)&v7->_bookmark, a3);
    [(SBLeafIcon *)v7 addIconDataSource:v5];
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  bookmark = self->_bookmark;
  return (id)[v4 initWithBookmark:bookmark];
}

- (void)setBookmark:(id)a3
{
  id v5 = (SBHBookmark *)a3;
  if (self->_bookmark != v5)
  {
    v6 = v5;
    -[SBLeafIcon removeIconDataSource:](self, "removeIconDataSource:");
    objc_storeStrong((id *)&self->_bookmark, a3);
    [(SBLeafIcon *)self addIconDataSource:self->_bookmark];
    [(SBIcon *)self _notifyImageDidUpdate];
    [(SBIcon *)self _notifyAccessoriesDidUpdate];
    id v5 = v6;
  }
}

- (UIWebClip)webClip
{
  return [(SBHBookmark *)self->_bookmark webClip];
}

- (CPSWebClip)appClip
{
  return [(SBHBookmark *)self->_bookmark appClip];
}

- (NSURL)launchURL
{
  return [(SBHBookmark *)self->_bookmark launchURL];
}

- (BOOL)displaysShareBookmarkShortcutItem
{
  if (!-[SBHBookmarkIcon _isSaneURL](self)) {
    return 0;
  }
  if ([(SBHBookmarkIcon *)self isAppClipIcon]) {
    return 1;
  }
  id v4 = [(SBHBookmarkIcon *)self webClip];
  id v5 = [v4 applicationBundleIdentifier];

  if (v5) {
    char v3 = [v5 isEqualToString:@"com.apple.mobilesafari"];
  }
  else {
    char v3 = 1;
  }

  return v3;
}

- (uint64_t)_isSaneURL
{
  if (!a1) {
    return 0;
  }
  v1 = [a1 webClip];
  v2 = [v1 pageURL];

  uint64_t v3 = [v2 isFileURL] ^ 1;
  return v3;
}

- (BOOL)displaysAppStoreURLShortcutItem
{
  if (![(SBHBookmarkIcon *)self isAppClipIcon]) {
    return 0;
  }
  uint64_t v3 = [(SBHBookmarkIcon *)self appClip];
  id v4 = [v3 fullAppStoreURL];

  BOOL v5 = v4 != 0;
  return v5;
}

- (BOOL)canBeAddedToMultiItemDrag
{
  if ([(SBHBookmarkIcon *)self isAppClipIcon]) {
    return 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)SBHBookmarkIcon;
  return [(SBIcon *)&v4 canBeAddedToMultiItemDrag];
}

- (BOOL)canBeAddedToSubfolder
{
  if ([(SBHBookmarkIcon *)self isAppClipIcon]) {
    return 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)SBHBookmarkIcon;
  return [(SBIcon *)&v4 canBeAddedToSubfolder];
}

- (id)uninstallAlertTitle
{
  if ([(SBHBookmarkIcon *)self isAppClipIcon])
  {
    uint64_t v3 = SBHBundle();
    objc_super v4 = v3;
    BOOL v5 = @"UNINSTALL_APPCLIP_TITLE";
  }
  else
  {
    if ([(SBHBookmarkIcon *)self isWebAppIcon])
    {
      v6 = NSString;
      objc_super v4 = SBHBundle();
      v7 = [v4 localizedStringForKey:@"UNINSTALL_WEBAPP_TITLE" value:&stru_1F2FA0300 table:@"SpringBoardHome"];
      v8 = [(SBIcon *)self displayName];
      objc_super v9 = objc_msgSend(v6, "stringWithFormat:", v7, v8);

      goto LABEL_7;
    }
    uint64_t v3 = SBHBundle();
    objc_super v4 = v3;
    BOOL v5 = @"UNINSTALL_BOOKMARK_TITLE";
  }
  objc_super v9 = [v3 localizedStringForKey:v5 value:&stru_1F2FA0300 table:@"SpringBoardHome"];
LABEL_7:

  return v9;
}

- (id)uninstallAlertBody
{
  if ([(SBHBookmarkIcon *)self isAppClipIcon])
  {
    uint64_t v3 = NSString;
    objc_super v4 = SBHBundle();
    BOOL v5 = v4;
    v6 = @"UNINSTALL_APPCLIP_BODY_DELETE_DATA";
  }
  else
  {
    if ([(SBHBookmarkIcon *)self isWebAppIcon])
    {
      BOOL v5 = SBHBundle();
      v7 = [v5 localizedStringForKey:@"UNINSTALL_WEBAPP_BODY_DELETE_DATA" value:&stru_1F2FA0300 table:@"SpringBoardHome"];
      goto LABEL_7;
    }
    uint64_t v3 = NSString;
    objc_super v4 = SBHBundle();
    BOOL v5 = v4;
    v6 = @"UNINSTALL_BOOKMARK_BODY_DELETE_DATA";
  }
  v8 = [v4 localizedStringForKey:v6 value:&stru_1F2FA0300 table:@"SpringBoardHome"];
  objc_super v9 = [(SBIcon *)self displayName];
  v7 = objc_msgSend(v3, "stringWithFormat:", v8, v9);

LABEL_7:
  return v7;
}

- (id)draggingUserActivity
{
  if ([(SBHBookmarkIcon *)self isAppClipIcon])
  {
    uint64_t v3 = [(SBHBookmarkIcon *)self bookmark];
    objc_super v4 = [v3 webClip];
    BOOL v5 = [v4 appClipUserActivity];
  }
  else
  {
    BOOL v5 = 0;
  }
  return v5;
}

- (BOOL)isBookmarkIcon
{
  return 1;
}

- (BOOL)isAppClipIcon
{
  return [(SBHBookmark *)self->_bookmark isAppClip];
}

- (BOOL)isWebAppIcon
{
  uint64_t v3 = [(SBHBookmarkIcon *)self webClip];
  if (objc_opt_respondsToSelector())
  {
    objc_super v4 = [(SBHBookmarkIcon *)self webClip];
    char v5 = [v4 needsWebAppDeletionStrings];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (id)_sbhIconLibraryOverrideCollationSectionTitle
{
  uint64_t v3 = [(SBHBookmarkIcon *)self webClip];
  int v4 = [v3 isAppClip];

  if (v4)
  {
    id v5 = (id)*MEMORY[0x1E4FB2F38];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SBHBookmarkIcon;
    id v5 = [(SBIcon *)&v7 _sbhIconLibraryOverrideCollationSectionTitle];
  }
  return v5;
}

- (SBHBookmark)bookmark
{
  return self->_bookmark;
}

- (void).cxx_destruct
{
}

@end