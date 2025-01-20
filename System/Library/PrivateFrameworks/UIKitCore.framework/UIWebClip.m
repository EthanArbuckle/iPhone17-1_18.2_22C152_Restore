@interface UIWebClip
+ (BOOL)_webClipFullScreenValueForMetaTagContent:(id)a3;
+ (BOOL)bundleIdentifierContainsWebClipIdentifier:(id)a3;
+ (BOOL)webClipClassicModeValueForWebDocumentView:(id)a3;
+ (BOOL)webClipFullScreenValueForWebDocumentView:(id)a3;
+ (BOOL)webClipWithIdentifierExists:(id)a3;
+ (id)_contentForMetaName:(id)a3 inWebDocumentView:(id)a4;
+ (id)_normalizedWebClipIdentifierFromBundleIdentifier:(id)a3;
+ (id)_webClipLinkTagsFromWebDocumentView:(id)a3;
+ (id)appClips;
+ (id)clipsIncludingWebClips:(BOOL)a3 includingAppClips:(BOOL)a4;
+ (id)clipsIncludingWebClips:(BOOL)a3 includingAppClips:(BOOL)a4 trustedByClientBundleIdentifier:(id)a5;
+ (id)pathForWebClipCacheWithIdentifier:(id)a3;
+ (id)pathForWebClipStorageWithIdentifier:(id)a3;
+ (id)pathForWebClipWithIdentifier:(id)a3;
+ (id)urlForWebClipWithIdentifier:(id)a3;
+ (id)webClipIconsForWebClipLinkTags:(id)a3 pageURL:(id)a4;
+ (id)webClipIconsForWebDocumentView:(id)a3;
+ (id)webClipIdentifierFromBundleIdentifier:(id)a3;
+ (id)webClipTitleForWebDocumentView:(id)a3;
+ (id)webClipWithDictionaryRepresentation:(id)a3;
+ (id)webClipWithIdentifier:(id)a3;
+ (id)webClipWithURL:(id)a3;
+ (id)webClipWithUUID:(id)a3;
+ (id)webClips;
+ (id)webClipsDirectoryPath;
+ (int64_t)_webClipStatusBarStyleForMetaTagContent:(id)a3;
+ (int64_t)webClipStatusBarStyleForWebDocumentView:(id)a3;
+ (unint64_t)_determineEligibility;
+ (unint64_t)_webClipOrientationsForMetaTagContent:(id)a3;
+ (unint64_t)webClipOrientationsForWebDocumentView:(id)a3;
- (BOOL)_createApplicationRecord;
- (BOOL)_hasPlaceholderBundle;
- (BOOL)_requiresPlaceholderBundle;
- (BOOL)_subjectToEligibilityUpdates;
- (BOOL)_writeIconImage:(id)a3 toDiskWithFileName:(id)a4;
- (BOOL)_writeImage:(id)a3 toDiskWithFileName:(id)a4;
- (BOOL)addTrustedClientBundleIdentifier:(id)a3;
- (BOOL)alternativeFullScreen;
- (BOOL)classicMode;
- (BOOL)configurationIsManaged;
- (BOOL)createOnDisk;
- (BOOL)ensurePlaceholderBundle;
- (BOOL)fullScreen;
- (BOOL)iconIsPrecomposed;
- (BOOL)iconIsPrerendered;
- (BOOL)iconIsScreenShotBased;
- (BOOL)ignoreManifestScope;
- (BOOL)isAppClip;
- (BOOL)needsWebAppDeletionStrings;
- (BOOL)removalDisallowed;
- (BOOL)removeFromDisk;
- (BOOL)scenelessBackgroundLaunch;
- (BOOL)tryLoadingNextCustomIcon;
- (BOOL)updateOnDisk;
- (NSArray)icons;
- (NSSet)trustedClientBundleIdentifiers;
- (NSString)applicationBundleIdentifier;
- (NSString)iconImagePath;
- (NSString)identifier;
- (NSString)placeholderBundleIdentifier;
- (NSString)shortcutIdentifier;
- (NSString)title;
- (NSURL)applicationLaunchURL;
- (NSURL)manifestId;
- (NSURL)pageURL;
- (NSURL)startupImageURL;
- (NSURL)startupLandscapeImageURL;
- (NSUUID)uuid;
- (NSUserActivity)appClipUserActivity;
- (UIImage)darkIconImage;
- (UIImage)iconImage;
- (UIImage)initialLaunchImage;
- (UIImage)startupImage;
- (UIImage)startupLandscapeImage;
- (UIImage)tintableIconImage;
- (WebClipDelegate)delegate;
- (id)_bundleImageWithName:(id)a3;
- (id)_bundleResourceWithName:(id)a3;
- (id)_createPlaceholderBundleIdentifier;
- (id)_defaultBrowserName;
- (id)_info;
- (id)_initWithIdentifier:(id)a3 dictionaryRepresentation:(id)a4;
- (id)_launchURLWithScheme:(id)a3;
- (id)bundleIdentifier;
- (id)eligibilityAlert:(id)a3;
- (id)generateIconImageForFormat:(int)a3 scale:(double)a4;
- (id)getStartupImage:(int64_t)a3;
- (int64_t)statusBarStyle;
- (unint64_t)bundleVersion;
- (unint64_t)contentMode;
- (unint64_t)eligibilityStatus;
- (unint64_t)supportedOrientations;
- (unint64_t)webClipStatusBarStyle;
- (void)_readPropertiesFromInfoPlist:(id)a3;
- (void)_reloadProperties;
- (void)_removePlaceholderBundleAndClearBadge;
- (void)_removePlaceholderBundleWithCompletion:(id)a3;
- (void)_setIconImage:(id)a3 isPrecomposed:(BOOL)a4 isScreenShotBased:(BOOL)a5;
- (void)_updateWebClipWithEligibility:(unint64_t)a3;
- (void)cancelMediaUpdate;
- (void)configureWithMetaTags:(id)a3 linkTags:(id)a4;
- (void)connection:(id)a3 didFailWithError:(id)a4;
- (void)connection:(id)a3 didReceiveData:(id)a4;
- (void)connection:(id)a3 didReceiveResponse:(id)a4;
- (void)connectionDidFinishLoading:(id)a3;
- (void)coordinator:(id)a3 canceledWithReason:(id)a4 client:(unint64_t)a5;
- (void)coordinatorDidCompleteSuccessfully:(id)a3 forApplicationRecord:(id)a4;
- (void)dealloc;
- (void)requestCustomIconUpdate;
- (void)requestCustomLandscapeStartupImageUpdate;
- (void)requestCustomPortraitStartupImageUpdate;
- (void)requestIconUpdateInSpringBoard;
- (void)setApplicationBundleIdentifier:(id)a3;
- (void)setClassicMode:(BOOL)a3;
- (void)setConfigurationIsManaged:(BOOL)a3;
- (void)setContentMode:(unint64_t)a3;
- (void)setContentModeWithString:(id)a3;
- (void)setDarkIconImage:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFullScreen:(BOOL)a3;
- (void)setIconImage:(id)a3 isPrecomposed:(BOOL)a4;
- (void)setIconImageFromScreenshot:(id)a3;
- (void)setIcons:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setIgnoreManifestScope:(BOOL)a3;
- (void)setInitialLaunchImage:(id)a3;
- (void)setIsAppClip:(BOOL)a3;
- (void)setManifestId:(id)a3;
- (void)setPageURL:(id)a3;
- (void)setPlaceholderBundleIdentifier:(id)a3;
- (void)setRemovalDisallowed:(BOOL)a3;
- (void)setScenelessBackgroundLaunch:(BOOL)a3;
- (void)setShortcutIdentifier:(id)a3;
- (void)setStartupImage:(id)a3;
- (void)setStartupImageURL:(id)a3;
- (void)setStartupLandscapeImage:(id)a3;
- (void)setStartupLandscapeImageURL:(id)a3;
- (void)setStatusBarStyle:(int64_t)a3;
- (void)setSupportedOrientations:(unint64_t)a3;
- (void)setTintableIconImage:(id)a3;
- (void)setTitle:(id)a3;
- (void)setWebClipStatusBarStyle:(unint64_t)a3;
- (void)stopLoadingCustomIcon;
- (void)stopLoadingStartupImage;
- (void)stopLoadingStartupLandscapeImage;
- (void)updateCustomMediaLocationsFromWebDocumentView:(id)a3;
- (void)updateCustomMediaLocationsWithWebClipLinkTags:(id)a3 baseURL:(id)a4;
@end

@implementation UIWebClip

+ (id)clipsIncludingWebClips:(BOOL)a3 includingAppClips:(BOOL)a4 trustedByClientBundleIdentifier:(id)a5
{
  BOOL v30 = a3;
  BOOL v31 = a4;
  id v34 = a5;
  id v32 = [MEMORY[0x1E4F1CA48] array];
  id v6 = [a1 webClipsDirectoryPath];
  v7 = opendir((const char *)[v6 fileSystemRepresentation]);
  if (v7)
  {
    v8 = v7;
    v9 = readdir(v7);
    if (v9)
    {
      v10 = v9;
      unint64_t v11 = 0x1E4F29000uLL;
      unint64_t v12 = 0x1E4F28000uLL;
      v13 = @"Info.plist";
      v33 = v8;
      do
      {
        v14 = (void *)[objc_alloc(*(Class *)(v11 + 24)) initWithUTF8String:v10->d_name];
        v15 = [v14 lastPathComponent];
        v16 = [v15 stringByDeletingPathExtension];

        if (v16)
        {
          v17 = [v6 stringByAppendingPathComponent:v14];
          v18 = [v17 stringByAppendingPathComponent:v13];

          v19 = [*(id *)(v12 + 3256) defaultManager];
          int v20 = [v19 fileExistsAtPath:v18];

          if (v20)
          {
            id v21 = v6;
            unint64_t v22 = v11;
            v23 = v13;
            unint64_t v24 = v12;
            v25 = +[UIWebClip webClipWithIdentifier:v16];
            v26 = v25;
            if (v30 && v31
              || v31 && ([v25 isAppClip] & 1) != 0
              || v30 && ([v26 isAppClip] & 1) == 0)
            {
              if (!v34
                || ([v26 trustedClientBundleIdentifiers],
                    v27 = objc_claimAutoreleasedReturnValue(),
                    int v28 = [v27 containsObject:v34],
                    v27,
                    v28))
              {
                [v32 addObject:v26];
              }
            }

            unint64_t v12 = v24;
            v13 = v23;
            unint64_t v11 = v22;
            id v6 = v21;
            v8 = v33;
          }
        }
        v10 = readdir(v8);
      }
      while (v10);
    }
    closedir(v8);
  }

  return v32;
}

+ (id)webClipsDirectoryPath
{
  v2 = [(id)CPSharedResourcesDirectory() stringByAppendingPathComponent:@"Library/WebClips"];
  v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  objc_msgSend(v3, "_web_createDirectoryAtPathWithIntermediateDirectories:attributes:", v2, 0);

  return v2;
}

+ (id)clipsIncludingWebClips:(BOOL)a3 includingAppClips:(BOOL)a4
{
  return (id)[a1 clipsIncludingWebClips:a3 includingAppClips:a4 trustedByClientBundleIdentifier:0];
}

+ (id)webClips
{
  v2 = objc_opt_class();
  return (id)[v2 clipsIncludingWebClips:1 includingAppClips:0];
}

- (void)configureWithMetaTags:(id)a3 linkTags:(id)a4
{
  id v20 = a3;
  id v6 = (void *)MEMORY[0x1E4F29128];
  id v7 = a4;
  v8 = [v6 UUID];
  v9 = [v8 UUIDString];
  v10 = [v9 stringByReplacingOccurrencesOfString:@"-" withString:&stru_1ED0E84C0];

  [(UIWebClip *)self setIdentifier:v10];
  unint64_t v11 = [v20 objectForKey:@"apple-mobile-web-app-title"];
  unint64_t v12 = objc_msgSend(v11, "_web_stringByTrimmingWhitespace");

  if ([v12 length]) {
    [(UIWebClip *)self setTitle:v12];
  }
  v13 = objc_opt_class();
  v14 = objc_msgSend(v20, "_web_stringForKey:", @"apple-mobile-web-app-capable");
  uint64_t v15 = [v13 _webClipFullScreenValueForMetaTagContent:v14];

  [(UIWebClip *)self setFullScreen:v15];
  v16 = objc_msgSend(v20, "_web_stringForKey:", @"apple-mobile-web-app-status-bar-style");
  self->_webClipStatusBarStyle = UIWebClipStatusBarStyleForMetaTagContent(v16);

  v17 = objc_opt_class();
  v18 = objc_msgSend(v20, "_web_stringForKey:", @"Orientations");
  uint64_t v19 = [v17 _webClipOrientationsForMetaTagContent:v18];

  [(UIWebClip *)self setSupportedOrientations:v19];
  [(UIWebClip *)self updateCustomMediaLocationsWithWebClipLinkTags:v7 baseURL:self->pageURL];
}

- (void)_readPropertiesFromInfoPlist:(id)a3
{
  id v34 = a3;
  uint64_t v4 = [v34 count];
  v5 = v34;
  if (!v4) {
    goto LABEL_89;
  }
  id v6 = [v34 objectForKey:@"URL"];
  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = [MEMORY[0x1E4F1CB10] URLWithString:v6 encodingInvalidCharacters:0];
      [(UIWebClip *)self setPageURL:v7];
    }
  }
  v8 = [v34 objectForKey:@"Title"];

  if (v8)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(UIWebClip *)self setTitle:v8];
    }
  }
  v9 = [v34 objectForKey:@"ConfigurationIsManaged"];

  if (v9)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      self->_configurationIsManaged = [v9 BOOLValue];
    }
  }
  v10 = [v34 objectForKey:@"ApplicationBundleIdentifier"];

  if (v10)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_storeStrong((id *)&self->applicationBundleIdentifier, v10);
    }
  }
  unint64_t v11 = [v34 objectForKey:@"PlaceholderBundleIdentifier"];

  if (v11)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_storeStrong((id *)&self->placeholderBundleIdentifier, v11);
    }
  }
  unint64_t v12 = [v34 objectForKey:@"TrustedClientBundleIdentifiers"];

  if (v12)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13 = [MEMORY[0x1E4F1CAD0] setWithArray:v12];
      trustedClientBundleIdentifiers = self->_trustedClientBundleIdentifiers;
      self->_trustedClientBundleIdentifiers = v13;
    }
  }
  uint64_t v15 = [v34 objectForKey:@"ShortcutIdentifier"];

  if (v15)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_storeStrong((id *)&self->_shortcutIdentifier, v15);
    }
  }
  v16 = [v34 objectForKey:@"FullScreen"];

  if (v16)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[UIWebClip setFullScreen:](self, "setFullScreen:", [v16 BOOLValue]);
    }
  }
  v17 = [v34 objectForKey:@"ClassicMode"];

  if (v17)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[UIWebClip setClassicMode:](self, "setClassicMode:", [v17 BOOLValue]);
    }
  }
  v18 = [v34 objectForKey:@"Eligibility"];

  if (v18)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      self->_eligibilityStatus = [v18 unsignedIntegerValue];
    }
  }
  uint64_t v19 = [v34 objectForKey:@"IconIsScreenShotBased"];

  if (v19)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      self->iconIsScreenShotBased = [v19 BOOLValue];
    }
  }
  id v20 = [v34 objectForKey:@"IconIsPrecomposed"];

  if (v20)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      *(_WORD *)&self->iconIsPrecomposed = [v20 BOOLValue];
    }
  }
  id v21 = [v34 objectForKey:@"ApplicationBundleVersion"];

  if (v21 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    unint64_t v22 = [v21 unsignedIntegerValue];
  }
  else {
    unint64_t v22 = 0;
  }
  self->bundleVersion = v22;
  v23 = [v34 objectForKey:@"IsAppClip"];

  if (v23)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && [(NSString *)self->applicationBundleIdentifier length]
      && ![(NSString *)self->applicationBundleIdentifier isEqualToString:@"com.apple.shortcuts"])
    {
      -[UIWebClip setIsAppClip:](self, "setIsAppClip:", [v23 BOOLValue]);
    }
  }
  unint64_t v24 = [v34 objectForKey:@"ScenelessBackgroundLaunch"];

  if (v24)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      self->_scenelessBackgroundLaunch = [v24 BOOLValue];
    }
  }
  v25 = [v34 objectForKey:@"RemovalDisallowed"];

  if (v25)
  {
    if (!self->_isAppClip)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        -[UIWebClip setRemovalDisallowed:](self, "setRemovalDisallowed:", [v25 BOOLValue]);
      }
    }
  }
  v26 = [v34 objectForKey:@"ContentMode"];

  if (v26)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(UIWebClip *)self setContentModeWithString:v26];
    }
  }
  v27 = [v34 objectForKey:@"IgnoreManifestScope"];

  if (v27)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      self->_ignoreManifestScope = [v27 BOOLValue];
    }
  }
  int v28 = [v34 objectForKey:@"WebClipStatusBarStyle"];

  if (v28 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v29 = v28;
    if ([v29 caseInsensitiveCompare:@"UIWebClipStatusBarStyleDefault"])
    {
      if ([v29 caseInsensitiveCompare:@"UIWebClipStatusBarStyleLegacyBlack"])
      {
        if ([v29 caseInsensitiveCompare:@"UIWebClipStatusBarStyleLegacyBlackTranslucent"])
        {
          if ([v29 caseInsensitiveCompare:@"UIWebClipStatusBarStyleHidden"])
          {
            if ([v29 caseInsensitiveCompare:@"UIWebClipStatusBarStyleLightContent"])
            {
              if ([v29 caseInsensitiveCompare:@"UIWebClipStatusBarStyleDarkContent"]) {
                unint64_t v30 = 0;
              }
              else {
                unint64_t v30 = 5;
              }
            }
            else
            {
              unint64_t v30 = 4;
            }
          }
          else
          {
            unint64_t v30 = 3;
          }
        }
        else
        {
          unint64_t v30 = 2;
        }
      }
      else
      {
        unint64_t v30 = 1;
      }
    }
    else
    {
      unint64_t v30 = 0;
    }
  }
  else
  {
    id v29 = [v34 objectForKey:@"UIStatusBarStyle"];

    if (!v29 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      id v32 = v34;
      goto LABEL_85;
    }
    int64_t v31 = +[UIApplication statusBarStyleForString:v29];
    if (v31 == 2)
    {
      unint64_t v30 = 1;
    }
    else if (v31 == 1)
    {
      unint64_t v30 = 2;
    }
    else
    {
      unint64_t v30 = 0;
    }
  }
  id v32 = v34;
  self->_webClipStatusBarStyle = v30;
LABEL_85:
  v33 = [v32 objectForKey:@"Orientations"];

  if (v33)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[UIWebClip setSupportedOrientations:](self, "setSupportedOrientations:", [v33 unsignedIntValue]);
    }
  }

  v5 = v34;
LABEL_89:
}

- (void)_reloadProperties
{
  if (self->_readOnlyDictionaryRepresentation)
  {
    -[UIWebClip _readPropertiesFromInfoPlist:](self, "_readPropertiesFromInfoPlist:");
  }
  else
  {
    v3 = +[UIWebClip urlForWebClipWithIdentifier:self->identifier];
    if (v3)
    {
      id v7 = v3;
      uint64_t v4 = [MEMORY[0x1E4F28B50] bundleWithURL:v3];
      CFURLRef v5 = [v4 bundleURL];
      CFDictionaryRef v6 = CFBundleCopyInfoDictionaryForURL(v5);

      [(UIWebClip *)self _readPropertiesFromInfoPlist:v6];
      v3 = v7;
    }
  }
}

- (NSUUID)uuid
{
  v2 = [(UIWebClip *)self identifier];
  if ([v2 length] == 32)
  {
    v3 = NSString;
    uint64_t v4 = objc_msgSend(v2, "substringWithRange:", 0, 8);
    CFURLRef v5 = objc_msgSend(v2, "substringWithRange:", 8, 4);
    CFDictionaryRef v6 = objc_msgSend(v2, "substringWithRange:", 12, 4);
    id v7 = objc_msgSend(v2, "substringWithRange:", 16, 4);
    v8 = objc_msgSend(v2, "substringWithRange:", 20, 12);
    v9 = [v3 stringWithFormat:@"%@-%@-%@-%@-%@", v4, v5, v6, v7, v8];

    v10 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v9];
  }
  else
  {
    v10 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v2];
  }

  return (NSUUID *)v10;
}

- (NSURL)pageURL
{
  pageURL = self->pageURL;
  if (pageURL) {
    goto LABEL_5;
  }
  [(UIWebClip *)self _reloadProperties];
  pageURL = self->pageURL;
  if (pageURL) {
    goto LABEL_5;
  }
  if (self->applicationBundleIdentifier)
  {
    pageURL = 0;
LABEL_5:
    uint64_t v4 = pageURL;
    goto LABEL_6;
  }
  uint64_t v4 = [MEMORY[0x1E4F1CB10] URLWithString:@"about:blank"];
LABEL_6:
  return v4;
}

- (NSString)title
{
  title = self->title;
  if (title || ([(UIWebClip *)self _reloadProperties], (title = self->title) != 0)) {
    uint64_t v4 = title;
  }
  else {
    uint64_t v4 = @"Untitled";
  }
  return (NSString *)v4;
}

- (NSString)applicationBundleIdentifier
{
  if (!self->applicationBundleIdentifier) {
    [(UIWebClip *)self _reloadProperties];
  }
  if (self->_isAppClip && self->_scenelessBackgroundLaunch)
  {
    v3 = @"com.apple.ClipViewService";
  }
  else
  {
    applicationBundleIdentifier = self->applicationBundleIdentifier;
    if (applicationBundleIdentifier) {
      v3 = applicationBundleIdentifier;
    }
    else {
      v3 = 0;
    }
  }
  return (NSString *)v3;
}

- (NSString)placeholderBundleIdentifier
{
  placeholderBundleIdentifier = self->placeholderBundleIdentifier;
  if (!placeholderBundleIdentifier)
  {
    [(UIWebClip *)self _reloadProperties];
    placeholderBundleIdentifier = self->placeholderBundleIdentifier;
  }
  return placeholderBundleIdentifier;
}

- (NSSet)trustedClientBundleIdentifiers
{
  trustedClientBundleIdentifiers = self->_trustedClientBundleIdentifiers;
  if (!trustedClientBundleIdentifiers)
  {
    [(UIWebClip *)self _reloadProperties];
    trustedClientBundleIdentifiers = self->_trustedClientBundleIdentifiers;
  }
  return trustedClientBundleIdentifiers;
}

- (void)setFullScreen:(BOOL)a3
{
  self->fullScreen = a3;
}

- (BOOL)fullScreen
{
  [(UIWebClip *)self _reloadProperties];
  if (self->_eligibilityStatus != 2 || (int v3 = _os_feature_enabled_impl()) != 0) {
    LOBYTE(v3) = self->fullScreen;
  }
  return v3;
}

- (BOOL)alternativeFullScreen
{
  [(UIWebClip *)self _reloadProperties];
  int v3 = _os_feature_enabled_impl();
  if (v3)
  {
    int v3 = [(UIWebClip *)self fullScreen];
    if (v3) {
      LOBYTE(v3) = self->_eligibilityStatus == 2;
    }
  }
  return v3;
}

- (void)setApplicationBundleIdentifier:(id)a3
{
  id v5 = a3;
  id v9 = v5;
  if (!self->_configurationIsManaged
    || ([v5 lowercaseString],
        CFDictionaryRef v6 = objc_claimAutoreleasedReturnValue(),
        char v7 = [v6 hasPrefix:@"com.apple"],
        v6,
        v8 = v9,
        (v7 & 1) == 0))
  {
    objc_storeStrong((id *)&self->applicationBundleIdentifier, a3);
    v8 = v9;
  }
}

- (BOOL)addTrustedClientBundleIdentifier:(id)a3
{
  id v4 = a3;
  if (![v4 length]) {
    goto LABEL_5;
  }
  trustedClientBundleIdentifiers = self->_trustedClientBundleIdentifiers;
  if (!trustedClientBundleIdentifiers)
  {
    [(UIWebClip *)self _reloadProperties];
    trustedClientBundleIdentifiers = self->_trustedClientBundleIdentifiers;
  }
  if (![(NSSet *)trustedClientBundleIdentifiers containsObject:v4])
  {
    char v7 = self->_trustedClientBundleIdentifiers;
    if (v7) {
      [(NSSet *)v7 setByAddingObject:v4];
    }
    else {
    v8 = [MEMORY[0x1E4F1CAD0] setWithObject:v4];
    }
    id v9 = self->_trustedClientBundleIdentifiers;
    self->_trustedClientBundleIdentifiers = v8;

    BOOL v6 = 1;
  }
  else
  {
LABEL_5:
    BOOL v6 = 0;
  }

  return v6;
}

- (NSURL)applicationLaunchURL
{
  if (self->_isAppClip && self->_scenelessBackgroundLaunch)
  {
    int v3 = @"appclip:";
LABEL_4:
    id v4 = [(UIWebClip *)self _launchURLWithScheme:v3];
    goto LABEL_9;
  }
  if (self->applicationBundleIdentifier
    || ![(UIWebClip *)self fullScreen]
    || [(UIWebClip *)self alternativeFullScreen])
  {
    id v4 = [(UIWebClip *)self pageURL];
  }
  else
  {
    BOOL v6 = [(UIWebClip *)self identifier];

    if (v6)
    {
      int v3 = @"webapp:";
      goto LABEL_4;
    }
    id v4 = 0;
  }
LABEL_9:
  return (NSURL *)v4;
}

- (id)_launchURLWithScheme:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1CB10];
  id v5 = NSString;
  id v6 = a3;
  char v7 = [(UIWebClip *)self identifier];
  v8 = [v5 stringWithFormat:@"%@%@", v6, v7];

  id v9 = [v4 URLWithString:v8];

  return v9;
}

- (NSUserActivity)appClipUserActivity
{
  if (self->_isAppClip && self->pageURL)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F29230]);
    id v4 = (void *)[v3 initWithActivityType:*MEMORY[0x1E4F28AC0]];
    [v4 setWebpageURL:self->pageURL];
    uint64_t v10 = 0;
    unint64_t v11 = &v10;
    uint64_t v12 = 0x2050000000;
    id v5 = (void *)qword_1EB2653B0;
    uint64_t v13 = qword_1EB2653B0;
    if (!qword_1EB2653B0)
    {
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __getAPActivationPayloadClass_block_invoke;
      v9[3] = &unk_1E52D9900;
      v9[4] = &v10;
      __getAPActivationPayloadClass_block_invoke((uint64_t)v9);
      id v5 = (void *)v11[3];
    }
    id v6 = v5;
    _Block_object_dispose(&v10, 8);
    char v7 = (void *)[[v6 alloc] initWithURL:self->pageURL];
    [v4 setAppClipActivationPayload:v7];
  }
  else
  {
    id v4 = 0;
  }
  return (NSUserActivity *)v4;
}

- (id)_info
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  pageURL = self->pageURL;
  if (pageURL)
  {
    id v5 = [(NSURL *)pageURL absoluteString];
    if (v5) {
      [v3 setObject:v5 forKey:@"URL"];
    }
  }
  title = self->title;
  if (title) {
    [v3 setObject:title forKey:@"Title"];
  }
  applicationBundleIdentifier = self->applicationBundleIdentifier;
  if (applicationBundleIdentifier) {
    [v3 setObject:applicationBundleIdentifier forKey:@"ApplicationBundleIdentifier"];
  }
  placeholderBundleIdentifier = self->placeholderBundleIdentifier;
  if (placeholderBundleIdentifier) {
    [v3 setObject:placeholderBundleIdentifier forKey:@"PlaceholderBundleIdentifier"];
  }
  if ([(NSSet *)self->_trustedClientBundleIdentifiers count])
  {
    id v9 = [(NSSet *)self->_trustedClientBundleIdentifiers allObjects];
    [v3 setObject:v9 forKey:@"TrustedClientBundleIdentifiers"];
  }
  shortcutIdentifier = self->_shortcutIdentifier;
  if (shortcutIdentifier) {
    [v3 setObject:shortcutIdentifier forKey:@"ShortcutIdentifier"];
  }
  if (self->removalDisallowed)
  {
    unint64_t v11 = [NSNumber numberWithBool:1];
    [v3 setObject:v11 forKey:@"RemovalDisallowed"];
  }
  if (self->bundleVersion)
  {
    uint64_t v12 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
    [v3 setObject:v12 forKey:@"ApplicationBundleVersion"];
  }
  uint64_t v13 = [NSNumber numberWithBool:self->fullScreen];
  [v3 setObject:v13 forKey:@"FullScreen"];

  v14 = [NSNumber numberWithBool:self->classicMode];
  [v3 setObject:v14 forKey:@"ClassicMode"];

  uint64_t v15 = [NSNumber numberWithUnsignedInteger:self->_eligibilityStatus];
  [v3 setObject:v15 forKey:@"Eligibility"];

  v16 = [NSNumber numberWithBool:self->_isAppClip];
  [v3 setObject:v16 forKey:@"IsAppClip"];

  v17 = [NSNumber numberWithBool:self->_scenelessBackgroundLaunch];
  [v3 setObject:v17 forKey:@"ScenelessBackgroundLaunch"];

  unint64_t contentMode = self->_contentMode;
  if (contentMode > 2) {
    uint64_t v19 = 0;
  }
  else {
    uint64_t v19 = off_1E5310AB8[contentMode];
  }
  [v3 setObject:v19 forKey:@"ContentMode"];
  id v20 = [NSNumber numberWithBool:self->_ignoreManifestScope];
  [v3 setObject:v20 forKey:@"IgnoreManifestScope"];

  id v21 = [NSNumber numberWithBool:self->_configurationIsManaged];
  [v3 setObject:v21 forKey:@"ConfigurationIsManaged"];

  unint64_t v22 = [NSNumber numberWithBool:self->iconIsScreenShotBased];
  [v3 setObject:v22 forKey:@"IconIsScreenShotBased"];

  v23 = [NSNumber numberWithBool:self->iconIsPrecomposed];
  [v3 setObject:v23 forKey:@"IconIsPrecomposed"];

  unint64_t webClipStatusBarStyle = self->_webClipStatusBarStyle;
  if (webClipStatusBarStyle > 5) {
    v25 = 0;
  }
  else {
    v25 = off_1E5310AD0[webClipStatusBarStyle];
  }
  [v3 setObject:v25 forKey:@"WebClipStatusBarStyle"];
  v26 = [NSNumber numberWithUnsignedInteger:self->supportedOrientations];
  [v3 setObject:v26 forKey:@"Orientations"];

  return v3;
}

- (void)setContentModeWithString:(id)a3
{
  id v4 = [a3 lowercaseString];
  if ([v4 containsString:@"mobile"])
  {
    unint64_t v5 = 1;
  }
  else if ([v4 containsString:@"desktop"])
  {
    unint64_t v5 = 2;
  }
  else
  {
    unint64_t v5 = 0;
  }

  self->_unint64_t contentMode = v5;
}

- (BOOL)_writeImage:(id)a3 toDiskWithFileName:(id)a4
{
  id v6 = a3;
  char v7 = (void *)MEMORY[0x1E4F1CB10];
  identifier = self->identifier;
  id v9 = a4;
  uint64_t v10 = +[UIWebClip pathForWebClipWithIdentifier:identifier];
  unint64_t v11 = [v10 stringByAppendingPathComponent:v9];

  CFURLRef v12 = [v7 fileURLWithPath:v11];

  uint64_t v13 = CGImageDestinationCreateWithURL(v12, @"public.png", 1uLL, 0);
  if (v13)
  {
    v14 = v13;
    CGImageDestinationAddImage(v13, (CGImageRef)[v6 imageRef], 0);
    BOOL v15 = CGImageDestinationFinalize(v14);
    CFRelease(v14);
  }
  else
  {
    BOOL v15 = 0;
  }

  return v15;
}

- (BOOL)_writeIconImage:(id)a3 toDiskWithFileName:(id)a4
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  BOOL v7 = [(UIWebClip *)self _writeImage:a3 toDiskWithFileName:v6];
  BOOL v8 = v7;
  if (a3 && v7)
  {
    id v9 = +[UIWebClip pathForWebClipWithIdentifier:self->identifier];
    uint64_t v10 = [v9 stringByAppendingPathComponent:v6];
    unint64_t v11 = [MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v17 = *MEMORY[0x1E4F28370];
    v18[0] = *MEMORY[0x1E4F28378];
    CFURLRef v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
    id v16 = 0;
    char v13 = [v11 setAttributes:v12 ofItemAtPath:v10 error:&v16];
    id v14 = v16;

    if ((v13 & 1) == 0) {
      NSLog(&cfstr_CouldnTChangeW.isa, v14);
    }
  }
  return v8;
}

- (id)_createPlaceholderBundleIdentifier
{
  v2 = NSString;
  id v3 = [(UIWebClip *)self identifier];
  id v4 = [v2 stringWithFormat:@"com.apple.WebKit.PushBundle.%@", v3];

  return v4;
}

- (BOOL)_subjectToEligibilityUpdates
{
  return self->fullScreen && self->applicationBundleIdentifier == 0;
}

- (BOOL)_requiresPlaceholderBundle
{
  if (self->fullScreen || (int v3 = _os_feature_enabled_impl()) != 0) {
    LOBYTE(v3) = self->applicationBundleIdentifier == 0;
  }
  return v3;
}

- (BOOL)_hasPlaceholderBundle
{
  v2 = self;
  uint64_t v3 = [(UIWebClip *)self _createPlaceholderBundleIdentifier];
  placeholderBundleIdentifier = v2->placeholderBundleIdentifier;
  v2->placeholderBundleIdentifier = (NSString *)v3;

  id v5 = objc_alloc(MEMORY[0x1E4F223C8]);
  id v6 = v2->placeholderBundleIdentifier;
  uint64_t v9 = 0;
  BOOL v7 = (void *)[v5 initWithBundleIdentifier:v6 allowPlaceholder:1 error:&v9];
  LOBYTE(v2) = v7 != 0;

  return (char)v2;
}

- (BOOL)ensurePlaceholderBundle
{
  if (![(UIWebClip *)self _requiresPlaceholderBundle]
    || [(UIWebClip *)self _hasPlaceholderBundle])
  {
    return 1;
  }
  if (!self->manifestId) {
    objc_storeStrong((id *)&self->manifestId, self->pageURL);
  }
  BOOL v4 = [(UIWebClip *)self _createApplicationRecord];
  [(UIWebClip *)self updateOnDisk];
  return v4;
}

- (BOOL)_createApplicationRecord
{
  v102[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(UIWebClip *)self _createPlaceholderBundleIdentifier];
  placeholderBundleIdentifier = self->placeholderBundleIdentifier;
  self->placeholderBundleIdentifier = v3;

  id v5 = (void *)[objc_alloc((Class)getIXApplicationIdentityClass()) initWithBundleIdentifier:self->placeholderBundleIdentifier];
  id IXAppInstallCoordinatorClass = getIXAppInstallCoordinatorClass();
  BOOL v7 = [MEMORY[0x1E4F28C58] errorWithDomain:@"WKErrorDomain" code:1 userInfo:0];
  uint64_t v89 = 0;
  [IXAppInstallCoordinatorClass cancelCoordinatorForAppWithIdentity:v5 withReason:v7 client:25 error:&v89];

  char v88 = 0;
  uint64_t v95 = 0;
  v96 = &v95;
  uint64_t v97 = 0x2050000000;
  BOOL v8 = (void *)qword_1EB2653C0;
  uint64_t v98 = qword_1EB2653C0;
  if (!qword_1EB2653C0)
  {
    uint64_t v90 = MEMORY[0x1E4F143A8];
    uint64_t v91 = 3221225472;
    v92 = __getIXRestoringDemotedAppInstallCoordinatorClass_block_invoke;
    v93 = &unk_1E52D9900;
    v94 = &v95;
    __getIXRestoringDemotedAppInstallCoordinatorClass_block_invoke((uint64_t)&v90);
    BOOL v8 = (void *)v96[3];
  }
  id v9 = v8;
  _Block_object_dispose(&v95, 8);
  id v87 = 0;
  uint64_t v10 = [v9 processScopedCoordinatorForAppWithIdentity:v5 withClientID:25 createIfNotExisting:1 created:&v88 error:&v87];
  id v11 = v87;
  CFURLRef v12 = v11;
  if (v10)
  {
    if (v88)
    {
      [v10 setObserver:self];
      uint64_t v95 = 0;
      v96 = &v95;
      uint64_t v97 = 0x2050000000;
      char v13 = (void *)qword_1EB2653C8;
      uint64_t v98 = qword_1EB2653C8;
      if (!qword_1EB2653C8)
      {
        uint64_t v90 = MEMORY[0x1E4F143A8];
        uint64_t v91 = 3221225472;
        v92 = __getIXPlaceholderClass_block_invoke;
        v93 = &unk_1E52D9900;
        v94 = &v95;
        __getIXPlaceholderClass_block_invoke((uint64_t)&v90);
        char v13 = (void *)v96[3];
      }
      id v14 = v13;
      _Block_object_dispose(&v95, 8);
      id v15 = [v14 alloc];
      title = self->title;
      uint64_t v17 = self->placeholderBundleIdentifier;
      id v84 = v12;
      v18 = (void *)[v15 initAppPlaceholderWithBundleName:title bundleID:v17 installType:8 client:25 error:&v84];
      id v19 = v84;

      if (!v18)
      {
        id v32 = self->placeholderBundleIdentifier;
        v33 = [v19 description];
        NSLog(&cfstr_UnableToCreate_5.isa, v32, v33);

        CFURLRef v12 = [MEMORY[0x1E4F28C58] errorWithDomain:@"WKErrorDomain" code:1 userInfo:0];
        id v83 = v19;
        [v10 cancelForReason:v12 client:25 error:&v83];
        id v30 = v83;
        BOOL v31 = 0;
LABEL_34:

        goto LABEL_35;
      }
      uint64_t v95 = 0;
      v96 = &v95;
      uint64_t v97 = 0x2050000000;
      id v20 = (void *)qword_1EB2653D0;
      uint64_t v98 = qword_1EB2653D0;
      if (!qword_1EB2653D0)
      {
        uint64_t v90 = MEMORY[0x1E4F143A8];
        uint64_t v91 = 3221225472;
        v92 = __getIXPlaceholderAttributesClass_block_invoke;
        v93 = &unk_1E52D9900;
        v94 = &v95;
        __getIXPlaceholderAttributesClass_block_invoke((uint64_t)&v90);
        id v20 = (void *)v96[3];
      }
      id v21 = v20;
      _Block_object_dispose(&v95, 8);
      CFURLRef v12 = objc_opt_new();
      [v12 setLaunchProhibited:1];
      manifestId = self->manifestId;
      if (manifestId)
      {
        v101 = @"manifestId";
        v23 = [(NSURL *)manifestId absoluteString];
        v102[0] = v23;
        unint64_t v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v102 forKeys:&v101 count:1];
        [v12 setWebKitPushBundleMetadata:v24];
      }
      else
      {
        NSLog(&cfstr_NoManifestidFo.isa, self->placeholderBundleIdentifier);
      }
      id v82 = v19;
      char v34 = [v18 setPlaceholderAttributes:v12 error:&v82];
      id v35 = v82;

      if ((v34 & 1) == 0)
      {
        v49 = self->placeholderBundleIdentifier;
        v50 = [v35 description];
        NSLog(&cfstr_UnableToSetPla.isa, v49, v50);

        id v19 = [MEMORY[0x1E4F28C58] errorWithDomain:@"WKErrorDomain" code:1 userInfo:0];
        id v81 = v35;
        [v10 cancelForReason:v19 client:25 error:&v81];
        id v30 = v81;
        BOOL v31 = 0;
LABEL_33:

        goto LABEL_34;
      }
      v36 = self->placeholderBundleIdentifier;
      v99[0] = @"com.apple.private.usernotifications.bundle-identifiers";
      v99[1] = @"com.apple.private.usernotifications.notification-simulator";
      v100[0] = v36;
      v100[1] = MEMORY[0x1E4F1CC38];
      v99[2] = @"com.apple.developer.app-management-domain";
      v99[3] = @"com.apple.private.webkit.pushbundle";
      v100[2] = @"com.apple.WebKit.PushBundles";
      v100[3] = MEMORY[0x1E4F1CC38];
      id v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v100 forKeys:v99 count:4];
      uint64_t v95 = 0;
      v96 = &v95;
      uint64_t v97 = 0x2050000000;
      v37 = (void *)qword_1EB2653D8;
      uint64_t v98 = qword_1EB2653D8;
      if (!qword_1EB2653D8)
      {
        uint64_t v90 = MEMORY[0x1E4F143A8];
        uint64_t v91 = 3221225472;
        v92 = __getIXPromisedInMemoryDictionaryClass_block_invoke;
        v93 = &unk_1E52D9900;
        v94 = &v95;
        __getIXPromisedInMemoryDictionaryClass_block_invoke((uint64_t)&v90);
        v37 = (void *)v96[3];
      }
      v38 = v37;
      _Block_object_dispose(&v95, 8);
      id v39 = [v38 alloc];
      v40 = [NSString stringWithFormat:@"Entitlements Promise for %@", self->placeholderBundleIdentifier];
      uint64_t v70 = [v39 initWithName:v40 client:25 dictionary:v19];

      if (v70)
      {

        id v79 = 0;
        char v41 = [v18 setEntitlementsPromise:v70 error:&v79];
        id v42 = v79;
        id v35 = v42;
        if (v41)
        {
          v43 = [(UIWebClip *)self iconImage];
          v44 = v43;
          if (v43)
          {
            v68 = UIImagePNGRepresentation(v43);
            if (v68)
            {
              v67 = (void *)[objc_alloc((Class)getIXPromisedInMemoryDataClass()) initWithName:@"Placeholder icon" client:25 data:v68];
              id v77 = v35;
              char v45 = [v18 setIconPromise:v67 error:&v77];
              id v46 = v77;

              if ((v45 & 1) == 0)
              {
                v47 = self->placeholderBundleIdentifier;
                v48 = [v46 description];
                NSLog(&cfstr_FailedToSetPla_0.isa, v47, v48);
              }
            }
            else
            {
              NSLog(&cfstr_FailedToSetPla_1.isa, self->placeholderBundleIdentifier);
              id v46 = v35;
            }
          }
          else
          {
            NSLog(&cfstr_FailedToSetPla_2.isa, self->placeholderBundleIdentifier);
            id v46 = v35;
          }
          id v76 = v46;
          char v55 = [v18 setConfigurationCompleteWithError:&v76];
          id v56 = v76;

          if (v55)
          {
            id v74 = v56;
            char v57 = [v10 setPlaceholderPromise:v18 error:&v74];
            id v69 = v74;

            if (v57)
            {
              id v35 = (id)[objc_alloc((Class)getIXPromisedOutOfBandTransferClass()) initWithName:@"Empty user data promise" client:25 diskSpaceNeeded:0];
              [v35 setPercentComplete:1.0];
              [v35 setComplete:1];
              id v72 = v69;
              char v58 = [v10 setUserDataPromise:v35 error:&v72];
              id v30 = v72;

              if (v58)
              {
                notify_post("com.apple.webclip.placeholder.added");
                BOOL v31 = 1;
              }
              else
              {
                v63 = self->placeholderBundleIdentifier;
                v64 = [v30 description];
                NSLog(&cfstr_FailedToSetUse_0.isa, v63, v64);

                v65 = [MEMORY[0x1E4F28C58] errorWithDomain:@"WKErrorDomain" code:1 userInfo:0];
                id v71 = v30;
                [v10 cancelForReason:v65 client:25 error:&v71];
                id v66 = v71;

                BOOL v31 = 0;
                id v30 = v66;
              }
              goto LABEL_32;
            }
            v61 = self->placeholderBundleIdentifier;
            v62 = [v69 description];
            NSLog(&cfstr_FailedToSetPla_4.isa, v61, v62);

            id v35 = [MEMORY[0x1E4F28C58] errorWithDomain:@"WKErrorDomain" code:1 userInfo:0];
            id v73 = v69;
            [v10 cancelForReason:v35 client:25 error:&v73];
            id v30 = v73;
          }
          else
          {
            v59 = self->placeholderBundleIdentifier;
            v60 = [v56 description];
            NSLog(&cfstr_FailedToSetPla_3.isa, v59, v60);

            id v35 = [MEMORY[0x1E4F28C58] errorWithDomain:@"WKErrorDomain" code:1 userInfo:0];
            id v75 = v56;
            [v10 cancelForReason:v35 client:25 error:&v75];
            id v30 = v75;
          }
LABEL_31:
          BOOL v31 = 0;
LABEL_32:

          id v35 = (id)v70;
          goto LABEL_33;
        }
        v52 = self->placeholderBundleIdentifier;
        v53 = [v42 description];
        NSLog(&cfstr_FailedToSetPla.isa, v52, v53);

        v44 = [MEMORY[0x1E4F28C58] errorWithDomain:@"WKErrorDomain" code:1 userInfo:0];
        id v78 = v35;
        [v10 cancelForReason:v44 client:25 error:&v78];
        v51 = v78;
      }
      else
      {
        NSLog(&cfstr_UnableToCreate_6.isa, self->placeholderBundleIdentifier);
        v44 = [MEMORY[0x1E4F28C58] errorWithDomain:@"WKErrorDomain" code:1 userInfo:0];
        id v80 = v35;
        [v10 cancelForReason:v44 client:25 error:&v80];
        v51 = v80;
      }
      id v30 = v51;
      goto LABEL_31;
    }
    NSLog(&cfstr_ExistingInstal.isa, self->placeholderBundleIdentifier);
    id v29 = getIXAppInstallCoordinatorClass();
    v18 = [MEMORY[0x1E4F28C58] errorWithDomain:@"WKErrorDomain" code:1 userInfo:0];
    v85 = v12;
    [v29 cancelCoordinatorForAppWithIdentity:v5 withReason:v18 client:25 error:&v85];
    int v28 = v85;
  }
  else
  {
    v25 = self->placeholderBundleIdentifier;
    v26 = [v11 description];
    NSLog(&cfstr_UnableToCreate_4.isa, v25, v26);

    id v27 = getIXAppInstallCoordinatorClass();
    v18 = [MEMORY[0x1E4F28C58] errorWithDomain:@"WKErrorDomain" code:1 userInfo:0];
    v86 = v12;
    [v27 cancelCoordinatorForAppWithIdentity:v5 withReason:v18 client:25 error:&v86];
    int v28 = v86;
  }
  id v30 = v28;
  BOOL v31 = 0;
LABEL_35:

  return v31;
}

- (BOOL)updateOnDisk
{
  v22[1] = *MEMORY[0x1E4F143B8];
  if (!self->_isAppClip)
  {
    BOOL v4 = +[UIWebClip pathForWebClipWithIdentifier:self->identifier];
    id v5 = [v4 stringByAppendingPathComponent:@"Info.plist"];
    id v6 = [(UIWebClip *)self _info];
    char v7 = [v6 writeToFile:v5 atomically:1];

    if (v7)
    {
      BOOL v8 = [MEMORY[0x1E4F28CB8] defaultManager];
      uint64_t v21 = *MEMORY[0x1E4F28370];
      v22[0] = *MEMORY[0x1E4F28378];
      id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
      id v20 = 0;
      char v10 = [v8 setAttributes:v9 ofItemAtPath:v5 error:&v20];
      id v11 = v20;

      if ((v10 & 1) == 0) {
        NSLog(&cfstr_CouldnTChangeW_0.isa, v11);
      }
      iconImage = self->iconImage;
      if (iconImage
        && ![(UIWebClip *)self _writeIconImage:iconImage toDiskWithFileName:@"icon.png"])
      {
        NSLog(&cfstr_CouldNotSaveWe.isa);
      }
      else
      {
        darkIconImage = self->darkIconImage;
        if (darkIconImage
          && ![(UIWebClip *)self _writeIconImage:darkIconImage toDiskWithFileName:@"dark-icon.png"])
        {
          NSLog(&cfstr_CouldNotSaveWe_0.isa);
        }
        else
        {
          tintableIconImage = self->tintableIconImage;
          if (tintableIconImage
            && ![(UIWebClip *)self _writeIconImage:tintableIconImage toDiskWithFileName:@"tintable-icon.png"])
          {
            NSLog(&cfstr_CouldNotSaveWe_1.isa);
          }
          else
          {
            startupImage = self->startupImage;
            if (startupImage
              && ![(UIWebClip *)self _writeImage:startupImage toDiskWithFileName:@"startup.png"])
            {
              NSLog(&cfstr_CouldNotSaveWe_2.isa);
            }
            else
            {
              startupLandscapeImage = self->startupLandscapeImage;
              if (startupLandscapeImage
                && ![(UIWebClip *)self _writeImage:startupLandscapeImage toDiskWithFileName:@"startup-landscape.png"])
              {
                NSLog(&cfstr_CouldNotSaveWe_3.isa);
              }
              else
              {
                initialLaunchImage = self->initialLaunchImage;
                if (!initialLaunchImage
                  || [(UIWebClip *)self _writeImage:initialLaunchImage toDiskWithFileName:@"initial-launch-image.png"])
                {
                  v18 = self->iconImage;
                  self->iconImage = 0;

                  [(UIWebClip *)self setDarkIconImage:0];
                  [(UIWebClip *)self setTintableIconImage:0];
                  [(UIWebClip *)self setStartupImage:0];
                  [(UIWebClip *)self setStartupLandscapeImage:0];
                  [(UIWebClip *)self setInitialLaunchImage:0];
                  if ([(UIWebClip *)self _requiresPlaceholderBundle]) {
                    notify_post("com.apple.webclip.placeholder.updated");
                  }
                  BOOL v2 = 1;
                  goto LABEL_29;
                }
                NSLog(&cfstr_CouldNotSaveWe_4.isa);
              }
            }
          }
        }
      }
    }
    else
    {
      NSLog(&cfstr_CouldnTSaveWeb.isa);
      id v11 = 0;
    }
    BOOL v2 = 0;
LABEL_29:

    return v2;
  }
  NSLog(&cfstr_UiwebclipUpdat.isa, a2);
  return 0;
}

- (BOOL)createOnDisk
{
  if (self->_isAppClip)
  {
    NSLog(&cfstr_UiwebclipCreat.isa, a2);
    return 0;
  }
  else
  {
    BOOL v4 = +[UIWebClip pathForWebClipWithIdentifier:self->identifier];
    id v5 = [MEMORY[0x1E4F28CB8] defaultManager];
    if ([v5 createDirectoryAtPath:v4 withIntermediateDirectories:1 attributes:0 error:0])
    {
      if ([(UIWebClip *)self _requiresPlaceholderBundle]) {
        [(UIWebClip *)self _createApplicationRecord];
      }
      if (!self->bundleVersion) {
        self->bundleVersion = 1;
      }
      if (_os_feature_enabled_impl()
        && [(UIWebClip *)self _subjectToEligibilityUpdates]
        && [(id)objc_opt_class() _determineEligibility] == 4)
      {
        self->_eligibilityStatus = 2;
      }
      BOOL v2 = [(UIWebClip *)self updateOnDisk];
    }
    else
    {
      NSLog(&cfstr_CouldnTCreateW.isa);
      BOOL v2 = 0;
    }
  }
  return v2;
}

- (BOOL)removeFromDisk
{
  if ([(UIWebClip *)self _requiresPlaceholderBundle])
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __27__UIWebClip_removeFromDisk__block_invoke;
    v7[3] = &unk_1E52DC3A0;
    v7[4] = self;
    [(UIWebClip *)self _removePlaceholderBundleWithCompletion:v7];
    return 1;
  }
  else
  {
    BOOL v4 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v5 = +[UIWebClip pathForWebClipWithIdentifier:self->identifier];
    char v6 = [v4 removeItemAtPath:v5 error:0];

    return v6;
  }
}

void __27__UIWebClip_removeFromDisk__block_invoke(uint64_t a1, char a2)
{
  if (a2)
  {
    uint64_t v10 = 0;
    id v11 = &v10;
    uint64_t v12 = 0x2050000000;
    uint64_t v3 = (void *)qword_1EB2653E0;
    uint64_t v13 = qword_1EB2653E0;
    if (!qword_1EB2653E0)
    {
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __getSFWebAppDataControllerClass_block_invoke;
      v9[3] = &unk_1E52D9900;
      v9[4] = &v10;
      __getSFWebAppDataControllerClass_block_invoke((uint64_t)v9);
      uint64_t v3 = (void *)v11[3];
    }
    BOOL v4 = v3;
    _Block_object_dispose(&v10, 8);
    id v5 = (void *)[[v4 alloc] initWithWebClipIdentifier:*(void *)(*(void *)(a1 + 32) + 8)];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __27__UIWebClip_removeFromDisk__block_invoke_2;
    v8[3] = &unk_1E52D9F70;
    v8[4] = *(void *)(a1 + 32);
    [v5 clearWebsiteDataWithCompletion:v8];
  }
  else
  {
    char v6 = [MEMORY[0x1E4F28CB8] defaultManager];
    char v7 = +[UIWebClip pathForWebClipWithIdentifier:*(void *)(*(void *)(a1 + 32) + 8)];
    [v6 removeItemAtPath:v7 error:0];

    NSLog(&cfstr_WebclipDeletio.isa);
  }
}

uint64_t __27__UIWebClip_removeFromDisk__block_invoke_2(uint64_t a1)
{
  BOOL v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v3 = +[UIWebClip pathForWebClipWithIdentifier:*(void *)(*(void *)(a1 + 32) + 8)];
  [v2 removeItemAtPath:v3 error:0];

  return notify_post("com.apple.webclip.placeholder.removed");
}

- (void)_removePlaceholderBundleWithCompletion:(id)a3
{
  id v4 = a3;
  if ([(UIWebClip *)self _hasPlaceholderBundle])
  {
    uint64_t v13 = 0;
    id v14 = &v13;
    uint64_t v15 = 0x2050000000;
    id v5 = (void *)getIXUninstallOptionsClass_softClass;
    uint64_t v16 = getIXUninstallOptionsClass_softClass;
    if (!getIXUninstallOptionsClass_softClass)
    {
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __getIXUninstallOptionsClass_block_invoke;
      v12[3] = &unk_1E52D9900;
      v12[4] = &v13;
      __getIXUninstallOptionsClass_block_invoke((uint64_t)v12);
      id v5 = (void *)v14[3];
    }
    char v6 = v5;
    _Block_object_dispose(&v13, 8);
    id v7 = objc_alloc_init(v6);
    id IXAppInstallCoordinatorClass = getIXAppInstallCoordinatorClass();
    id v9 = (void *)[objc_alloc((Class)getIXApplicationIdentityClass()) initWithBundleIdentifier:self->placeholderBundleIdentifier];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __52__UIWebClip__removePlaceholderBundleWithCompletion___block_invoke;
    v10[3] = &unk_1E53109E8;
    id v11 = v4;
    [IXAppInstallCoordinatorClass uninstallAppWithIdentity:v9 options:v7 completion:v10];
  }
  else if (v4)
  {
    (*((void (**)(id, void))v4 + 2))(v4, 0);
  }
}

void __52__UIWebClip__removePlaceholderBundleWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v7 = v5;
  if (a2) {
    NSLog(&cfstr_WebAppPlacehol_0.isa);
  }
  else {
    NSLog(&cfstr_WebAppPlacehol.isa, v5);
  }
  uint64_t v6 = *(void *)(a1 + 32);
  if (v6) {
    (*(void (**)(uint64_t, uint64_t))(v6 + 16))(v6, 1);
  }
}

- (id)_initWithIdentifier:(id)a3 dictionaryRepresentation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)UIWebClip;
  BOOL v8 = [(UIWebClip *)&v12 init];
  if (v8)
  {
    id v9 = +[UIWebClip _normalizedWebClipIdentifierFromBundleIdentifier:v6];
    [(UIWebClip *)v8 setIdentifier:v9];

    [(UIWebClip *)v8 setFullScreen:0];
    [(UIWebClip *)v8 setClassicMode:0];
    [(UIWebClip *)v8 setStatusBarStyle:0];
    v8->iconIsPrerendered = 1;
    objc_storeStrong((id *)&v8->_readOnlyDictionaryRepresentation, a4);
    [(UIWebClip *)v8 _reloadProperties];
    uint64_t v10 = +[UIWebClipEligibilityObserver sharedObserver];
    [v10 startObservingEligibility];
  }
  return v8;
}

- (void)setPageURL:(id)a3
{
  id v5 = a3;
  if (([v5 isFileURL] & 1) == 0) {
    objc_storeStrong((id *)&self->pageURL, a3);
  }
}

- (id)_bundleResourceWithName:(id)a3
{
  id v4 = a3;
  id v5 = +[UIWebClip urlForWebClipWithIdentifier:self->identifier];
  if (v5)
  {
    id v6 = [MEMORY[0x1E4F28B50] bundleWithURL:v5];
    id v7 = [v6 bundlePath];
    BOOL v8 = [NSString stringWithFormat:@"%@.png", v4];
    id v9 = [v7 stringByAppendingPathComponent:v8];

    uint64_t v10 = [MEMORY[0x1E4F28CB8] defaultManager];
    LODWORD(v8) = [v10 fileExistsAtPath:v9];

    if (v8) {
      id v11 = v9;
    }
    else {
      id v11 = 0;
    }
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (id)_bundleImageWithName:(id)a3
{
  uint64_t v3 = [(UIWebClip *)self _bundleResourceWithName:a3];
  if (v3)
  {
    id v4 = +[UIImage imageWithContentsOfFile:v3];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (NSString)iconImagePath
{
  return (NSString *)[(UIWebClip *)self _bundleResourceWithName:@"icon"];
}

- (id)generateIconImageForFormat:(int)a3 scale:(double)a4
{
  uint64_t v5 = *(void *)&a3;
  [(UIWebClip *)self _reloadProperties];
  id v7 = [(UIWebClip *)self iconImage];
  BOOL v8 = objc_msgSend(v7, "_applicationIconImageForFormat:precomposed:scale:", v5, -[UIWebClip iconIsPrecomposed](self, "iconIsPrecomposed"), a4);

  return v8;
}

- (UIImage)iconImage
{
  iconImage = self->iconImage;
  if (iconImage)
  {
    uint64_t v3 = iconImage;
  }
  else
  {
    uint64_t v3 = [(UIWebClip *)self _bundleImageWithName:@"icon"];
    if (!v3)
    {
      if (self->_isAppClip)
      {
        uint64_t v5 = objc_opt_new();
        [v5 setShape:5];
        [v5 setScale:2.0];
        objc_msgSend(v5, "setSize:", 167.0, 167.0);
        id v6 = [MEMORY[0x1E4F6F248] genericApplicationIcon];
        id v7 = [v6 prepareImageForDescriptor:v5];

        uint64_t v8 = [v7 CGImage];
        [v7 scale];
        +[UIImage imageWithCGImage:scale:orientation:](UIImage, "imageWithCGImage:scale:orientation:", v8, 0);
        uint64_t v3 = (UIImage *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        uint64_t v3 = 0;
      }
    }
  }
  return v3;
}

- (UIImage)darkIconImage
{
  darkIconImage = self->darkIconImage;
  if (darkIconImage)
  {
    uint64_t v3 = darkIconImage;
  }
  else
  {
    uint64_t v3 = [(UIWebClip *)self _bundleImageWithName:@"dark-icon"];
    if (!v3)
    {
      uint64_t v3 = [(UIWebClip *)self iconImage];
    }
  }
  return v3;
}

- (UIImage)tintableIconImage
{
  tintableIconImage = self->tintableIconImage;
  if (tintableIconImage)
  {
    uint64_t v3 = tintableIconImage;
  }
  else
  {
    uint64_t v3 = [(UIWebClip *)self _bundleImageWithName:@"tintable-icon"];
    if (!v3)
    {
      uint64_t v3 = [(UIWebClip *)self iconImage];
    }
  }
  return v3;
}

- (void)_setIconImage:(id)a3 isPrecomposed:(BOOL)a4 isScreenShotBased:(BOOL)a5
{
  self->iconIsScreenShotBased = a5;
  self->iconIsPrecomposed = a4;
}

- (void)setIconImage:(id)a3 isPrecomposed:(BOOL)a4
{
}

- (void)setIconImageFromScreenshot:(id)a3
{
}

- (UIImage)startupImage
{
  startupImage = self->startupImage;
  if (startupImage)
  {
    uint64_t v3 = startupImage;
  }
  else
  {
    uint64_t v3 = [(UIWebClip *)self _bundleImageWithName:@"startup"];
  }
  return v3;
}

- (UIImage)startupLandscapeImage
{
  startupLandscapeImage = self->startupLandscapeImage;
  if (startupLandscapeImage)
  {
    uint64_t v3 = startupLandscapeImage;
  }
  else
  {
    uint64_t v3 = [(UIWebClip *)self _bundleImageWithName:@"startup-landscape"];
  }
  return v3;
}

- (UIImage)initialLaunchImage
{
  initialLaunchImage = self->initialLaunchImage;
  if (initialLaunchImage)
  {
    uint64_t v3 = initialLaunchImage;
  }
  else
  {
    uint64_t v3 = [(UIWebClip *)self _bundleImageWithName:@"initial-launch-image"];
  }
  return v3;
}

- (void)dealloc
{
  [(UIWebClip *)self cancelMediaUpdate];
  v3.receiver = self;
  v3.super_class = (Class)UIWebClip;
  [(UIWebClip *)&v3 dealloc];
}

- (id)_defaultBrowserName
{
  id v4 = [MEMORY[0x1E4F1CB10] URLWithString:@"http://"];
  if (!v4)
  {
    uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"UIWebClip.m" lineNumber:1181 description:@"HTTP URL should always construct"];
  }
  uint64_t v11 = 0;
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F22408]) initWithURL:v4 error:&v11];
  id v6 = v5;
  if (v5)
  {
    id v7 = [v5 bundleRecord];
    uint64_t v8 = [v7 localizedName];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (id)eligibilityAlert:(id)a3
{
  id v4 = a3;
  uint64_t v10 = [(UIWebClip *)self _defaultBrowserName];
  if (v10) {
    _UILocalizedFormat(@"OPEN_IN_BROWSER_TITLE", @"open web page in browser alert title", @"Open “%@” in %@?", v5, v6, v7, v8, v9, (uint64_t)self->title);
  }
  else {
  uint64_t v11 = _UILocalizedFormat(@"OPEN_IN_BROWSER_TITLE_BACKUP", @"open web page in browser alert title", @"Open “%@” in your browser?", v5, v6, v7, v8, v9, (uint64_t)self->title);
  }
  objc_super v12 = _UILocalizedString(@"OPEN_IN_BROWSER_BODY", @"open web page in browser alert title", @"In your region, web apps now open in your default browser.");
  uint64_t v13 = _UILocalizedString(@"OPEN_IN_BROWSER", @"open web page in the browser alert action", @"Open");
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __30__UIWebClip_eligibilityAlert___block_invoke;
  v23[3] = &unk_1E5310A10;
  v23[4] = self;
  id v14 = v4;
  id v24 = v14;
  uint64_t v15 = +[UIAlertAction actionWithTitle:v13 style:0 handler:v23];

  uint64_t v16 = _UILocalizedString(@"Cancel", @"cancel alert action", @"Cancel");
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __30__UIWebClip_eligibilityAlert___block_invoke_2;
  v21[3] = &unk_1E5310A10;
  v21[4] = self;
  id v22 = v14;
  id v17 = v14;
  v18 = +[UIAlertAction actionWithTitle:v16 style:0 handler:v21];

  id v19 = +[UIAlertController alertControllerWithTitle:v11 message:v12 preferredStyle:1];
  [v19 addAction:v18];
  [v19 addAction:v15];

  return v19;
}

uint64_t __30__UIWebClip_eligibilityAlert___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(v2 + 272);
  *(void *)(v2 + 272) = 2;
  [*(id *)(a1 + 32) updateOnDisk];
  if (!v3) {
    [*(id *)(a1 + 32) _removePlaceholderBundleAndClearBadge];
  }
  id v4 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v4();
}

uint64_t __30__UIWebClip_eligibilityAlert___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (!*(void *)(v2 + 272))
  {
    *(void *)(v2 + 272) = 1;
    [*(id *)(a1 + 32) updateOnDisk];
    [*(id *)(a1 + 32) _removePlaceholderBundleAndClearBadge];
  }
  uint64_t v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v3();
}

+ (id)webClipWithIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = [[UIWebClip alloc] _initWithIdentifier:v3 dictionaryRepresentation:0];

  return v4;
}

+ (id)webClipWithUUID:(id)a3
{
  id v4 = [a3 UUIDString];
  uint64_t v5 = [v4 stringByReplacingOccurrencesOfString:@"-" withString:&stru_1ED0E84C0];

  uint64_t v6 = [a1 webClipWithIdentifier:v5];

  return v6;
}

+ (id)webClipWithURL:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 scheme];
  if (([v5 isEqualToString:@"webclip"] & 1) != 0
    || [v5 isEqualToString:@"webapp"])
  {
    uint64_t v6 = [v4 resourceSpecifier];
    if (v6)
    {
      uint64_t v7 = [a1 webClipWithIdentifier:v6];
    }
    else
    {
      uint64_t v7 = 0;
    }
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

+ (id)webClipWithDictionaryRepresentation:(id)a3
{
  id v3 = a3;
  id v4 = [v3 objectForKeyedSubscript:@"DictionaryRepresentationIdentifier"];
  if ([v4 length]) {
    id v5 = [[UIWebClip alloc] _initWithIdentifier:v4 dictionaryRepresentation:v3];
  }
  else {
    id v5 = 0;
  }

  return v5;
}

+ (id)appClips
{
  uint64_t v2 = objc_opt_class();
  return (id)[v2 clipsIncludingWebClips:0 includingAppClips:1];
}

+ (BOOL)webClipWithIdentifierExists:(id)a3
{
  id v3 = [a1 pathForWebClipWithIdentifier:a3];
  id v4 = [v3 stringByAppendingPathComponent:@"Info.plist"];

  if (v4)
  {
    id v5 = [MEMORY[0x1E4F28CB8] defaultManager];
    char v6 = [v5 fileExistsAtPath:v4];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

+ (BOOL)bundleIdentifierContainsWebClipIdentifier:(id)a3
{
  return [a3 hasPrefix:@"com.apple.webapp-"];
}

+ (id)webClipIdentifierFromBundleIdentifier:(id)a3
{
  id v3 = a3;
  if ([v3 hasPrefix:@"com.apple.webapp-"])
  {
    id v4 = [v3 substringFromIndex:objc_msgSend(@"com.apple.webapp-", "length")];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

+ (id)_normalizedWebClipIdentifierFromBundleIdentifier:(id)a3
{
  v8[2] = *MEMORY[0x1E4F143B8];
  v8[0] = @"com.apple.webapp-";
  v8[1] = @"com.apple.appclip-";
  id v3 = (void *)MEMORY[0x1E4F1C978];
  id v4 = a3;
  id v5 = [v3 arrayWithObjects:v8 count:2];
  char v6 = objc_msgSend(v4, "_uikit_stringByRemovingFirstMatchFromPrefixes:", v5);

  return v6;
}

+ (id)_contentForMetaName:(id)a3 inWebDocumentView:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  WebThreadLock();
  uint64_t v7 = [v6 webView];
  uint64_t v8 = [v7 mainFrame];
  uint64_t v9 = [v8 DOMDocument];
  uint64_t v10 = v9;
  if (v9)
  {
    id v20 = v8;
    uint64_t v21 = v7;
    id v22 = v6;
    uint64_t v11 = [v9 getElementsByTagName:@"meta"];
    objc_super v12 = 0;
    if ([v11 length])
    {
      uint64_t v13 = 0;
      do
      {
        id v14 = [v11 item:v13];
        uint64_t v15 = [v14 getAttribute:@"name"];
        uint64_t v16 = [v5 caseInsensitiveCompare:v15];

        if (!v16)
        {
          uint64_t v17 = [v14 getAttribute:@"content"];

          objc_super v12 = (void *)v17;
        }

        uint64_t v13 = (v13 + 1);
      }
      while (v13 < [v11 length]);
    }

    uint64_t v7 = v21;
    id v6 = v22;
    uint64_t v8 = v20;
  }
  else
  {
    objc_super v12 = 0;
  }
  id v18 = v12;

  return v18;
}

+ (int64_t)_webClipStatusBarStyleForMetaTagContent:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    if ([v3 caseInsensitiveCompare:@"black"]) {
      int64_t v5 = [v4 caseInsensitiveCompare:@"black-translucent"] == 0;
    }
    else {
      int64_t v5 = 2;
    }
  }
  else
  {
    int64_t v5 = 0;
  }

  return v5;
}

+ (int64_t)webClipStatusBarStyleForWebDocumentView:(id)a3
{
  id v4 = [a1 _contentForMetaName:@"apple-mobile-web-app-status-bar-style" inWebDocumentView:a3];
  int64_t v5 = [a1 _webClipStatusBarStyleForMetaTagContent:v4];

  return v5;
}

+ (BOOL)_webClipFullScreenValueForMetaTagContent:(id)a3
{
  return objc_msgSend(a3, "_web_isCaseInsensitiveEqualToString:", @"yes");
}

+ (BOOL)webClipFullScreenValueForWebDocumentView:(id)a3
{
  id v3 = a1;
  id v4 = [a1 _contentForMetaName:@"apple-mobile-web-app-capable" inWebDocumentView:a3];
  LOBYTE(v3) = [v3 _webClipFullScreenValueForMetaTagContent:v4];

  return (char)v3;
}

+ (id)webClipTitleForWebDocumentView:(id)a3
{
  return (id)[a1 _contentForMetaName:@"apple-mobile-web-app-title" inWebDocumentView:a3];
}

+ (BOOL)webClipClassicModeValueForWebDocumentView:(id)a3
{
  return [a3 isClassicViewportMode];
}

+ (unint64_t)_webClipOrientationsForMetaTagContent:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@","];
    int64_t v5 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@" \t\n\f\r"];
    uint64_t v16 = (void *)v4;
    id v17 = v3;
    id v6 = [v3 componentsSeparatedByCharactersInSet:v4];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      unint64_t v9 = 0;
      uint64_t v10 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v19 != v10) {
            objc_enumerationMutation(v6);
          }
          objc_super v12 = [*(id *)(*((void *)&v18 + 1) + 8 * i) stringByTrimmingCharactersInSet:v5];
          if ([v12 caseInsensitiveCompare:@"portrait"])
          {
            if ([v12 caseInsensitiveCompare:@"portrait-upside-down"])
            {
              if ([v12 caseInsensitiveCompare:@"landscape-right"])
              {
                if ([v12 caseInsensitiveCompare:@"landscape-left"])
                {
                  if ([v12 caseInsensitiveCompare:@"portrait-any"])
                  {
                    if ([v12 caseInsensitiveCompare:@"landscape-any"])
                    {
                      if (![v12 caseInsensitiveCompare:@"any"]) {
                        v9 |= 0x1EuLL;
                      }
                    }
                    else
                    {
                      v9 |= 0x18uLL;
                    }
                  }
                  else
                  {
                    v9 |= 6uLL;
                  }
                }
                else
                {
                  v9 |= 0x10uLL;
                }
              }
              else
              {
                v9 |= 8uLL;
              }
            }
            else
            {
              v9 |= 4uLL;
            }
          }
          else
          {
            v9 |= 2uLL;
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v8);
    }
    else
    {
      unint64_t v9 = 0;
    }
    if ((v9 & 0x10) != 0) {
      unint64_t v14 = 0;
    }
    else {
      unint64_t v14 = v9;
    }
    if ((~(_BYTE)v9 & 0xE) != 0) {
      unint64_t v13 = v9;
    }
    else {
      unint64_t v13 = v14;
    }

    id v3 = v17;
  }
  else
  {
    unint64_t v13 = 0;
  }

  return v13;
}

+ (unint64_t)webClipOrientationsForWebDocumentView:(id)a3
{
  uint64_t v4 = [a1 _contentForMetaName:@"apple-mobile-web-app-orientations" inWebDocumentView:a3];
  unint64_t v5 = [a1 _webClipOrientationsForMetaTagContent:v4];

  return v5;
}

- (void)cancelMediaUpdate
{
  [(UIWebClip *)self stopLoadingCustomIcon];
  [(UIWebClip *)self stopLoadingStartupImage];
  [(UIWebClip *)self stopLoadingStartupLandscapeImage];
}

- (void)stopLoadingCustomIcon
{
  iconConnection = self->_iconConnection;
  if (iconConnection)
  {
    [(NSURLConnection *)iconConnection cancel];
    uint64_t v4 = self->_iconConnection;
    self->_iconConnection = 0;

    customIconData = self->_customIconData;
    self->_customIconData = 0;
  }
}

- (void)stopLoadingStartupImage
{
  startupImageConnection = self->_startupImageConnection;
  if (startupImageConnection)
  {
    [(NSURLConnection *)startupImageConnection cancel];
    uint64_t v4 = self->_startupImageConnection;
    self->_startupImageConnection = 0;

    customStartupImageData = self->_customStartupImageData;
    self->_customStartupImageData = 0;
  }
}

- (void)stopLoadingStartupLandscapeImage
{
  startupLandscapeImageConnection = self->_startupLandscapeImageConnection;
  if (startupLandscapeImageConnection)
  {
    [(NSURLConnection *)startupLandscapeImageConnection cancel];
    uint64_t v4 = self->_startupLandscapeImageConnection;
    self->_startupLandscapeImageConnection = 0;

    customStartupLandscapeImageData = self->_customStartupLandscapeImageData;
    self->_customStartupLandscapeImageData = 0;
  }
}

- (void)connection:(id)a3 didReceiveData:(id)a4
{
  objc_super v12 = (NSURLConnection *)a3;
  id v6 = a4;
  if (self->_iconConnection == v12)
  {
    customIconData = self->_customIconData;
    if (!customIconData)
    {
      uint64_t v10 = (NSMutableData *)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithData:v6];
      customStartupImageData = self->_customIconData;
      self->_customIconData = v10;
      goto LABEL_11;
    }
LABEL_9:
    [(NSMutableData *)customIconData appendData:v6];
    goto LABEL_12;
  }
  if (self->_startupImageConnection == v12)
  {
    customIconData = self->_customStartupImageData;
    if (!customIconData)
    {
      uint64_t v11 = (NSMutableData *)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithData:v6];
      customStartupImageData = self->_customStartupImageData;
      self->_customStartupImageData = v11;
      goto LABEL_11;
    }
    goto LABEL_9;
  }
  if (self->_startupLandscapeImageConnection != v12) {
    goto LABEL_12;
  }
  customIconData = self->_customStartupLandscapeImageData;
  if (customIconData) {
    goto LABEL_9;
  }
  uint64_t v8 = (NSMutableData *)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithData:v6];
  customStartupImageData = self->_customStartupLandscapeImageData;
  self->_customStartupLandscapeImageData = v8;
LABEL_11:

LABEL_12:
}

- (id)bundleIdentifier
{
  id v3 = [(UIWebClip *)self identifier];
  if ([(UIWebClip *)self isAppClip])
  {
    uint64_t v4 = @"com.apple.appclip-";
LABEL_5:
    id v5 = [(__CFString *)v4 stringByAppendingString:v3];
    goto LABEL_7;
  }
  if ([(UIWebClip *)self fullScreen])
  {
    uint64_t v4 = @"com.apple.webapp-";
    goto LABEL_5;
  }
  id v5 = v3;
LABEL_7:
  id v6 = v5;

  return v6;
}

- (void)requestIconUpdateInSpringBoard
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  CFStringRef v2 = [(UIWebClip *)self bundleIdentifier];
  id v3 = (__CFString *)v2;
  if (v2)
  {
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    *(_OWORD *)buffer = 0u;
    long long v18 = 0u;
    if (CFStringGetCString(v2, buffer, 1024, 0x8000100u))
    {
      uint64_t v13 = 0;
      unint64_t v14 = &v13;
      uint64_t v15 = 0x2020000000;
      uint64_t v4 = (uint64_t (*)(void))off_1EB2653F8;
      uint64_t v16 = off_1EB2653F8;
      if (!off_1EB2653F8)
      {
        id v5 = SpringBoardServicesLibrary_3();
        v14[3] = (uint64_t)dlsym(v5, "SBSSpringBoardServerPort");
        off_1EB2653F8 = (_UNKNOWN *)v14[3];
        uint64_t v4 = (uint64_t (*)(void))v14[3];
      }
      _Block_object_dispose(&v13, 8);
      if (v4)
      {
        uint64_t v6 = v4();
        uint64_t v13 = 0;
        unint64_t v14 = &v13;
        uint64_t v15 = 0x2020000000;
        uint64_t v7 = (void (*)(uint64_t, char *))off_1EB2653F0;
        uint64_t v16 = off_1EB2653F0;
        if (!off_1EB2653F0)
        {
          uint64_t v8 = SpringBoardServicesLibrary_3();
          v14[3] = (uint64_t)dlsym(v8, "SBReloadIconForIdentifier");
          off_1EB2653F0 = (_UNKNOWN *)v14[3];
          uint64_t v7 = (void (*)(uint64_t, char *))v14[3];
        }
        _Block_object_dispose(&v13, 8);
        if (v7)
        {
          v7(v6, buffer);
          goto LABEL_10;
        }
        uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
        objc_super v12 = objc_msgSend(NSString, "stringWithUTF8String:", "kern_return_t softLink_SBReloadIconForIdentifier(mach_port_t, char *)");
        objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, @"UIWebClip.m", 49, @"%s", dlerror());
      }
      else
      {
        unint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
        uint64_t v10 = [NSString stringWithUTF8String:"mach_port_t softLink_SBSSpringBoardServerPort(void)"];
        objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, @"UIWebClip.m", 48, @"%s", dlerror());
      }
      __break(1u);
    }
  }
LABEL_10:
}

+ (id)webClipIconsForWebClipLinkTags:(id)a3 pageURL:(id)a4
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v49 = a4;
  char v55 = [MEMORY[0x1E4F1CA48] array];
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v61 objects:v69 count:16];
  unint64_t v8 = 0x1E4F1C000uLL;
  v51 = v6;
  if (v7)
  {
    uint64_t v9 = v7;
    uint64_t v10 = *(void *)v62;
    double v11 = *MEMORY[0x1E4F1DB30];
    double v12 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    uint64_t v50 = *(void *)v62;
    do
    {
      uint64_t v13 = 0;
      uint64_t v52 = v9;
      do
      {
        if (*(void *)v62 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v58 = v13;
        unint64_t v14 = *(void **)(*((void *)&v61 + 1) + 8 * v13);
        v59 = [v14 rel];
        if ((objc_msgSend(v59, "_web_isCaseInsensitiveEqualToString:", @"apple-touch-icon") & 1) != 0
          || objc_msgSend(v59, "_web_isCaseInsensitiveEqualToString:", @"apple-touch-icon-precomposed"))
        {
          uint64_t v15 = [v14 href];
          if (![v15 length]) {
            goto LABEL_32;
          }
          char v57 = v15;
          uint64_t v16 = [*(id *)(v8 + 2832) URLWithString:v15 encodingInvalidCharacters:0];
          if (!v16) {
            goto LABEL_31;
          }
          id v56 = objc_alloc_init(UIWebClipIcon);
          -[UIWebClipIcon setPrecomposed:](v56, "setPrecomposed:", objc_msgSend(v59, "_web_isCaseInsensitiveEqualToString:", @"apple-touch-icon-precomposed"));
          id v17 = [v14 sizes];
          long long v18 = v55;
          if (v17)
          {
            long long v67 = 0u;
            long long v68 = 0u;
            long long v65 = 0u;
            long long v66 = 0u;
            id v54 = v17;
            long long v19 = [v17 componentsSeparatedByString:@" "];
            uint64_t v20 = [v19 countByEnumeratingWithState:&v65 objects:v70 count:16];
            if (v20)
            {
              uint64_t v21 = v20;
              v53 = v16;
              char v22 = 0;
              uint64_t v23 = *(void *)v66;
              double v24 = v12;
              double v25 = v11;
              do
              {
                for (uint64_t i = 0; i != v21; ++i)
                {
                  if (*(void *)v66 != v23) {
                    objc_enumerationMutation(v19);
                  }
                  long long v27 = [*(id *)(*((void *)&v65 + 1) + 8 * i) componentsSeparatedByString:@"x"];
                  if ([v27 count] == 2)
                  {
                    long long v28 = [v27 objectAtIndex:0];
                    uint64_t v29 = [v28 integerValue];

                    long long v30 = [v27 objectAtIndex:1];
                    uint64_t v31 = [v30 integerValue];

                    if (v29 >= 1 && v31 >= 1)
                    {
                      if (objc_msgSend(MEMORY[0x1E4F22478], "_compareApplicationIconCanvasSize:withSize:", (double)v29, (double)v31, v25, v24) == 1)
                      {
                        double v24 = (double)v31;
                        double v25 = (double)v29;
                      }
                      char v22 = 1;
                    }
                  }
                }
                uint64_t v21 = [v19 countByEnumeratingWithState:&v65 objects:v70 count:16];
              }
              while (v21);

              id v17 = v54;
              long long v18 = v55;
              uint64_t v10 = v50;
              id v6 = v51;
              unint64_t v8 = 0x1E4F1C000;
              uint64_t v9 = v52;
              uint64_t v16 = v53;
              if (v22)
              {
LABEL_30:

                -[UIWebClipIcon setBestSize:](v56, "setBestSize:", v25, v24);
                [(UIWebClipIcon *)v56 setUrl:v16];
                [v18 addObject:v56];

LABEL_31:
                uint64_t v15 = v57;
LABEL_32:

                goto LABEL_33;
              }
            }
            else
            {

              uint64_t v9 = v52;
              id v17 = v54;
            }
          }
          double v24 = 57.0;
          double v25 = 57.0;
          goto LABEL_30;
        }
LABEL_33:

        uint64_t v13 = v58 + 1;
      }
      while (v58 + 1 != v9);
      uint64_t v9 = [v6 countByEnumeratingWithState:&v61 objects:v69 count:16];
    }
    while (v9);
  }

  [MEMORY[0x1E4F22478] _applicationIconCanvasSize];
  double v34 = v33;
  double v36 = v35;
  long long v37 = objc_msgSend(NSString, "stringWithFormat:", @"%ldx%ld", (uint64_t)v33, (uint64_t)v35);
  long long v38 = objc_alloc_init(UIWebClipIcon);
  v60 = [NSString stringWithFormat:@"/apple-touch-icon-%@.png", v37];
  long long v39 = [*(id *)(v8 + 2832) URLWithString:v60 relativeToURL:v49];
  [(UIWebClipIcon *)v38 setUrl:v39];

  [(UIWebClipIcon *)v38 setSiteWide:1];
  -[UIWebClipIcon setBestSize:](v38, "setBestSize:", v34, v36);
  [v55 addObject:v38];
  long long v40 = objc_alloc_init(UIWebClipIcon);
  long long v41 = [NSString stringWithFormat:@"/apple-touch-icon-%@-precomposed.png", v37];
  long long v42 = [*(id *)(v8 + 2832) URLWithString:v41 relativeToURL:v49];
  [(UIWebClipIcon *)v40 setUrl:v42];

  [(UIWebClipIcon *)v40 setSiteWide:1];
  -[UIWebClipIcon setBestSize:](v40, "setBestSize:", v34, v36);
  [(UIWebClipIcon *)v40 setPrecomposed:1];
  [v55 addObject:v40];
  long long v43 = objc_alloc_init(UIWebClipIcon);
  [*(id *)(v8 + 2832) URLWithString:@"/apple-touch-icon.png" relativeToURL:v49];
  long long v45 = v44 = v8;
  [(UIWebClipIcon *)v43 setUrl:v45];

  [(UIWebClipIcon *)v43 setSiteWide:1];
  [v55 addObject:v43];
  long long v46 = objc_alloc_init(UIWebClipIcon);
  [(UIWebClipIcon *)v46 setPrecomposed:1];
  long long v47 = [*(id *)(v44 + 2832) URLWithString:@"/apple-touch-icon-precomposed.png" relativeToURL:v49];
  [(UIWebClipIcon *)v46 setUrl:v47];

  [(UIWebClipIcon *)v46 setSiteWide:1];
  [v55 addObject:v43];
  [v55 sortWithOptions:16 usingComparator:&__block_literal_global_670];

  return v55;
}

uint64_t __52__UIWebClip_webClipIconsForWebClipLinkTags_pageURL___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 compare:a2 preferringDeviceIconSizes:1];
}

+ (id)webClipIconsForWebDocumentView:(id)a3
{
  id v4 = a3;
  WebThreadLock();
  id v5 = baseURLForWebDocumentView(v4);
  id v6 = [a1 _webClipLinkTagsFromWebDocumentView:v4];

  uint64_t v7 = [a1 webClipIconsForWebClipLinkTags:v6 pageURL:v5];

  return v7;
}

- (void)updateCustomMediaLocationsWithWebClipLinkTags:(id)a3 baseURL:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v22 = a4;
  uint64_t v7 = [(id)objc_opt_class() webClipIconsForWebClipLinkTags:v6 pageURL:v22];
  uint64_t v21 = self;
  [(UIWebClip *)self setIcons:v7];

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    double v11 = 0;
    double v12 = 0;
    uint64_t v13 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v24 != v13) {
          objc_enumerationMutation(v8);
        }
        uint64_t v15 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        uint64_t v16 = [v15 rel];
        int v17 = objc_msgSend(v16, "_web_isCaseInsensitiveEqualToString:", @"apple-touch-startup-image");

        if (v17)
        {
          long long v18 = [v15 hrefURL];
          if (v18)
          {
            if ([v15 mediaMatchesPortraitOrientation])
            {
              id v19 = v18;

              double v12 = v19;
            }
            if ([v15 mediaMatchesLandscapeOrientation])
            {
              id v20 = v18;

              double v11 = v20;
            }
          }
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v10);
  }
  else
  {
    double v11 = 0;
    double v12 = 0;
  }

  [(UIWebClip *)v21 setStartupImageURL:v12];
  [(UIWebClip *)v21 setStartupLandscapeImageURL:v11];
  [(UIWebClip *)v21 requestCustomIconUpdate];
  if ([(UIWebClip *)v21 fullScreen])
  {
    [(UIWebClip *)v21 requestCustomPortraitStartupImageUpdate];
    [(UIWebClip *)v21 requestCustomLandscapeStartupImageUpdate];
  }
}

- (void)updateCustomMediaLocationsFromWebDocumentView:(id)a3
{
  id v4 = a3;
  WebThreadLock();
  baseURLForWebDocumentView(v4);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = [(id)objc_opt_class() _webClipLinkTagsFromWebDocumentView:v4];

  [(UIWebClip *)self updateCustomMediaLocationsWithWebClipLinkTags:v5 baseURL:v6];
}

+ (id)_webClipLinkTagsFromWebDocumentView:(id)a3
{
  id v3 = a3;
  WebThreadLock();
  id v4 = [MEMORY[0x1E4F1CA48] array];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  int v17 = __49__UIWebClip__webClipLinkTagsFromWebDocumentView___block_invoke;
  long long v18 = &unk_1E5310A38;
  id v5 = v4;
  id v19 = v5;
  id v6 = v16;
  uint64_t v7 = [v3 webView];
  id v8 = [v7 mainFrame];
  uint64_t v9 = [v8 DOMDocument];

  if (v9)
  {
    uint64_t v10 = [v9 getElementsByTagName:@"link"];
    int v11 = [v10 length];
    if (v11)
    {
      int v12 = v11;
      uint64_t v13 = 0;
      do
      {
        unint64_t v14 = [v10 item:v13];
        v17((uint64_t)v6, v14);

        uint64_t v13 = (v13 + 1);
      }
      while (v12 != v13);
    }
  }
  return v5;
}

void __49__UIWebClip__webClipLinkTagsFromWebDocumentView___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v8 = objc_alloc_init(UIWebClipLinkTag);
  id v4 = [v3 href];
  [(UIWebClipLinkTag *)v8 setHref:v4];

  id v5 = [v3 rel];
  [(UIWebClipLinkTag *)v8 setRel:v5];

  id v6 = [v3 getAttribute:@"sizes"];
  [(UIWebClipLinkTag *)v8 setSizes:v6];

  -[UIWebClipLinkTag setMediaMatchesPortraitOrientation:](v8, "setMediaMatchesPortraitOrientation:", [v3 _mediaQueryMatchesForOrientation:1]);
  uint64_t v7 = [v3 _mediaQueryMatchesForOrientation:2];

  [(UIWebClipLinkTag *)v8 setMediaMatchesLandscapeOrientation:v7];
  [*(id *)(a1 + 32) addObject:v8];
}

- (BOOL)tryLoadingNextCustomIcon
{
  p_icons = &self->icons;
  icons = self->icons;
  unint64_t v5 = (unint64_t)&p_icons[1]->super.isa + 1;
  self->currentIconIndex = v5;
  unint64_t v6 = [(NSArray *)icons count];
  if (v5 >= v6) {
    self->currentIconIndex = 0;
  }
  else {
    [(UIWebClip *)self requestCustomIconUpdate];
  }
  return v5 < v6;
}

- (void)connectionDidFinishLoading:(id)a3
{
  long long v46 = (NSURLConnection *)a3;
  id v4 = +[UIScreen mainScreen];
  [v4 scale];
  double v6 = v5;
  [v4 bounds];
  double v8 = v7;
  double v10 = v9;
  [(id)UIApp statusBarHeight];
  double v12 = v11;
  id WeakRetained = objc_loadWeakRetained((id *)&self->delegate);
  if (self->_iconConnection != v46)
  {
    double v14 = v10 - v12;
    double v15 = v6 * v8;
    double v16 = v6 * (v10 - v12);
    if (self->_startupImageConnection == v46)
    {
      int v17 = +[UIImage imageWithData:self->_customStartupImageData];
      if (objc_opt_respondsToSelector()) {
        [WeakRetained webClip:self startupImageRequestDidFinishWithImage:v17];
      }
      if (v17)
      {
        [v17 size];
        BOOL v41 = v40 == v8 && v39 == v14;
        if (v41 || (([v17 size], v43 == v15) ? (BOOL v44 = v42 == v16) : (BOOL v44 = 0), v44))
        {
          [(UIWebClip *)self setStartupImage:v17];
          [(UIWebClip *)self updateOnDisk];
        }
      }
      [(UIWebClip *)self stopLoadingStartupImage];
    }
    else
    {
      if (self->_startupLandscapeImageConnection != v46) {
        goto LABEL_50;
      }
      int v17 = +[UIImage imageWithData:self->_customStartupLandscapeImageData];
      if (objc_opt_respondsToSelector()) {
        [WeakRetained webClip:self startupLandscapeImageRequestDidFinishWithImage:v17];
      }
      if (v17)
      {
        double v18 = v8 - v12;
        double v19 = v12 + v14;
        [v17 size];
        BOOL v22 = v21 == v8 - v12 && v20 == v19;
        if (v22
          || ((v23 = v6 * v12, CGFloat v24 = v15 - v6 * v12, v25 = v23 + v16, [v17 size], v27 == v24)
            ? (BOOL v28 = v26 == v25)
            : (BOOL v28 = 0),
              v28))
        {
          [(UIWebClip *)self setStartupLandscapeImage:v17];
          [(UIWebClip *)self updateOnDisk];
        }
        else
        {
          [v17 size];
          double v31 = v29;
          double v32 = v30;
          BOOL v33 = v30 == v18 && v29 == v19;
          if (v33 || (v30 == v24 ? (BOOL v34 = v29 == v25) : (BOOL v34 = 0), v34))
          {
            _UIGraphicsBeginImageContextWithOptions(0, 0, v24, v25, 1.0);
            ContextStack = GetContextStack(0);
            if (*(int *)ContextStack < 1) {
              double v36 = 0;
            }
            else {
              double v36 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
            }
            CGContextTranslateCTM(v36, v32 * 0.5, v31 * 0.5);
            CGContextRotateCTM(v36, 1.57079633);
            CGContextTranslateCTM(v36, v31 * -0.5, v32 * -0.5);
            objc_msgSend(v17, "drawAtPoint:", 0.0, 0.0);
            long long v45 = _UIGraphicsGetImageFromCurrentImageContext(0);
            UIGraphicsEndImageContext();
            [(UIWebClip *)self setStartupLandscapeImage:v45];
            [(UIWebClip *)self updateOnDisk];
          }
        }
      }
      [(UIWebClip *)self stopLoadingStartupLandscapeImage];
    }
    goto LABEL_49;
  }
  long long v37 = [(NSArray *)self->icons objectAtIndex:self->currentIconIndex];
  uint64_t v38 = [v37 isPrecomposed];

  int v17 = +[UIImage imageWithData:self->_customIconData];
  if (!v17)
  {
    if ([(UIWebClip *)self tryLoadingNextCustomIcon]) {
      goto LABEL_50;
    }
    if ((objc_opt_respondsToSelector() & 1) == 0) {
      goto LABEL_46;
    }
    goto LABEL_45;
  }
  if (objc_opt_respondsToSelector())
  {
LABEL_45:
    [WeakRetained webClip:self iconRequestDidFinishWithImage:v17 precomposed:v38];
    goto LABEL_46;
  }
  [(UIWebClip *)self setIconImage:v17 isPrecomposed:v38];
  [(UIWebClip *)self updateOnDisk];
  [(UIWebClip *)self requestIconUpdateInSpringBoard];
LABEL_46:
  [(UIWebClip *)self stopLoadingCustomIcon];
LABEL_49:

LABEL_50:
}

- (void)connection:(id)a3 didFailWithError:(id)a4
{
  double v6 = (NSURLConnection *)a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->delegate);
  if (self->_iconConnection == v6)
  {
    [(UIWebClip *)self stopLoadingCustomIcon];
    if (![(UIWebClip *)self tryLoadingNextCustomIcon]
      && (objc_opt_respondsToSelector() & 1) != 0)
    {
      [WeakRetained webClip:self iconRequestDidFinishWithImage:0 precomposed:0];
    }
  }
  else if (self->_startupImageConnection == v6)
  {
    [(UIWebClip *)self stopLoadingStartupImage];
    if (objc_opt_respondsToSelector()) {
      [WeakRetained webClip:self startupImageRequestDidFinishWithImage:0];
    }
  }
  else if (self->_startupLandscapeImageConnection == v6)
  {
    [(UIWebClip *)self stopLoadingStartupLandscapeImage];
    if (objc_opt_respondsToSelector()) {
      [WeakRetained webClip:self startupLandscapeImageRequestDidFinishWithImage:0];
    }
  }
}

- (void)connection:(id)a3 didReceiveResponse:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v6 statusCode] >= 400) {
    [(UIWebClip *)self connection:v7 didFailWithError:0];
  }
}

- (void)requestCustomIconUpdate
{
  if (self->_iconConnection) {
    [(UIWebClip *)self stopLoadingCustomIcon];
  }
  unint64_t currentIconIndex = self->currentIconIndex;
  if (currentIconIndex >= [(NSArray *)self->icons count]) {
    goto LABEL_6;
  }
  id v4 = (void *)MEMORY[0x1E4F18DA8];
  double v5 = [(NSArray *)self->icons objectAtIndex:self->currentIconIndex];
  id v6 = [v5 url];
  id WeakRetained = [v4 requestWithURL:v6 cachePolicy:0 timeoutInterval:60.0];

  if (WeakRetained)
  {
    id v7 = [MEMORY[0x1E4F18D80] connectionWithRequest:WeakRetained delegate:self];
    iconConnection = self->_iconConnection;
    self->_iconConnection = v7;
  }
  else
  {
LABEL_6:
    id WeakRetained = objc_loadWeakRetained((id *)&self->delegate);
    if (objc_opt_respondsToSelector()) {
      [WeakRetained webClip:self iconRequestDidFinishWithImage:0 precomposed:0];
    }
  }
}

- (void)requestCustomPortraitStartupImageUpdate
{
  if (self->_startupImageConnection) {
    [(UIWebClip *)self stopLoadingStartupImage];
  }
  uint64_t v3 = [MEMORY[0x1E4F18DA8] requestWithURL:self->startupImageURL cachePolicy:0 timeoutInterval:60.0];
  id v6 = (id)v3;
  if (v3)
  {
    id v4 = [MEMORY[0x1E4F18D80] connectionWithRequest:v3 delegate:self];
    startupImageConnection = self->_startupImageConnection;
    self->_startupImageConnection = v4;
  }
  else
  {
    startupImageConnection = objc_loadWeakRetained((id *)&self->delegate);
    if (objc_opt_respondsToSelector()) {
      [startupImageConnection webClip:self startupImageRequestDidFinishWithImage:0];
    }
  }
}

- (void)requestCustomLandscapeStartupImageUpdate
{
  if (self->_startupLandscapeImageConnection) {
    [(UIWebClip *)self stopLoadingStartupLandscapeImage];
  }
  uint64_t v3 = [MEMORY[0x1E4F18DA8] requestWithURL:self->startupLandscapeImageURL cachePolicy:0 timeoutInterval:60.0];
  id v6 = (id)v3;
  if (v3)
  {
    id v4 = [MEMORY[0x1E4F18D80] connectionWithRequest:v3 delegate:self];
    startupLandscapeImageConnection = self->_startupLandscapeImageConnection;
    self->_startupLandscapeImageConnection = v4;
  }
  else
  {
    startupLandscapeImageConnection = objc_loadWeakRetained((id *)&self->delegate);
    if (objc_opt_respondsToSelector()) {
      [startupLandscapeImageConnection webClip:self startupLandscapeImageRequestDidFinishWithImage:0];
    }
  }
}

+ (id)pathForWebClipWithIdentifier:(id)a3
{
  id v4 = a3;
  double v5 = [a1 webClipsDirectoryPath];
  id v6 = [v5 stringByAppendingPathComponent:v4];

  id v7 = [v6 stringByAppendingPathExtension:@"webclip"];

  return v7;
}

+ (id)pathForWebClipStorageWithIdentifier:(id)a3
{
  uint64_t v3 = [a1 pathForWebClipWithIdentifier:a3];
  id v4 = [v3 stringByAppendingPathComponent:@"Storage"];

  double v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  objc_msgSend(v5, "_web_createDirectoryAtPathWithIntermediateDirectories:attributes:", v4, 0);

  return v4;
}

+ (id)pathForWebClipCacheWithIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 1uLL, 1);
  double v5 = [v4 objectAtIndex:0];
  id v6 = [v5 stringByAppendingPathComponent:@"Caches/WebClips"];

  id v7 = [v6 stringByAppendingPathComponent:v3];

  double v8 = [MEMORY[0x1E4F28CB8] defaultManager];
  objc_msgSend(v8, "_web_createDirectoryAtPathWithIntermediateDirectories:attributes:", v7, 0);

  return v7;
}

+ (id)urlForWebClipWithIdentifier:(id)a3
{
  id v3 = [a1 pathForWebClipWithIdentifier:a3];
  if (v3) {
    id v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initFileURLWithPath:v3];
  }
  else {
    id v4 = 0;
  }

  return v4;
}

+ (unint64_t)_determineEligibility
{
  _os_feature_enabled_impl();
  uint64_t domain_answer = os_eligibility_get_domain_answer();
  if (domain_answer) {
    NSLog(&cfstr_ErrorWhenDeter.isa, domain_answer);
  }
  else {
    NSLog(&cfstr_UnableToDeterm.isa);
  }
  return 0;
}

- (void)_updateWebClipWithEligibility:(unint64_t)a3
{
  if (a3 == 2)
  {
    if (self->_eligibilityStatus - 1 <= 1)
    {
      self->_eligibilityStatus = 0;
      [(UIWebClip *)self updateOnDisk];
    }
  }
  else if (a3 == 4 && !self->_eligibilityStatus)
  {
    self->_eligibilityStatus = 1;
    [(UIWebClip *)self updateOnDisk];
    [(UIWebClip *)self _removePlaceholderBundleAndClearBadge];
  }
}

- (void)_removePlaceholderBundleAndClearBadge
{
  if ((_os_feature_enabled_impl() & 1) == 0 && [(UIWebClip *)self _hasPlaceholderBundle])
  {
    id v3 = (id)[objc_alloc(MEMORY[0x1E4FB3398]) initWithBundleIdentifier:self->placeholderBundleIdentifier];
    [v3 setBadgeValue:0];
    [(UIWebClip *)self _removePlaceholderBundleWithCompletion:0];
  }
}

- (id)getStartupImage:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 1) {
    [(UIWebClip *)self startupLandscapeImage];
  }
  else {
  id v3 = [(UIWebClip *)self startupImage];
  }
  return v3;
}

- (BOOL)needsWebAppDeletionStrings
{
  return self->fullScreen && self->applicationBundleIdentifier == 0;
}

- (void)coordinatorDidCompleteSuccessfully:(id)a3 forApplicationRecord:(id)a4
{
  objc_msgSend(a4, "bundleIdentifier", a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  NSLog(&cfstr_WebClipPlaceho.isa, v4);
}

- (void)coordinator:(id)a3 canceledWithReason:(id)a4 client:(unint64_t)a5
{
  objc_msgSend(a4, "description", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  NSLog(&cfstr_WebClipPlaceho_0.isa, v5);
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setIdentifier:(id)a3
{
}

- (NSArray)icons
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setIcons:(id)a3
{
}

- (NSURL)startupImageURL
{
  return (NSURL *)objc_getProperty(self, a2, 40, 1);
}

- (void)setStartupImageURL:(id)a3
{
}

- (NSURL)startupLandscapeImageURL
{
  return (NSURL *)objc_getProperty(self, a2, 48, 1);
}

- (void)setStartupLandscapeImageURL:(id)a3
{
}

- (void)setTitle:(id)a3
{
}

- (void)setPlaceholderBundleIdentifier:(id)a3
{
}

- (NSURL)manifestId
{
  return self->manifestId;
}

- (void)setManifestId:(id)a3
{
}

- (unint64_t)bundleVersion
{
  return self->bundleVersion;
}

- (BOOL)classicMode
{
  return self->classicMode;
}

- (void)setClassicMode:(BOOL)a3
{
  self->classicMode = a3;
}

- (BOOL)removalDisallowed
{
  return self->removalDisallowed;
}

- (void)setRemovalDisallowed:(BOOL)a3
{
  self->removalDisallowed = a3;
}

- (BOOL)iconIsScreenShotBased
{
  return self->iconIsScreenShotBased;
}

- (BOOL)iconIsPrecomposed
{
  return self->iconIsPrecomposed;
}

- (BOOL)iconIsPrerendered
{
  return self->iconIsPrerendered;
}

- (unint64_t)supportedOrientations
{
  return self->supportedOrientations;
}

- (void)setSupportedOrientations:(unint64_t)a3
{
  self->supportedOrientations = a3;
}

- (int64_t)statusBarStyle
{
  return self->statusBarStyle;
}

- (void)setStatusBarStyle:(int64_t)a3
{
  self->statusBarStyle = a3;
}

- (void)setStartupImage:(id)a3
{
}

- (void)setStartupLandscapeImage:(id)a3
{
}

- (void)setInitialLaunchImage:(id)a3
{
}

- (WebClipDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->delegate);
  return (WebClipDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void)setDarkIconImage:(id)a3
{
}

- (void)setTintableIconImage:(id)a3
{
}

- (NSString)shortcutIdentifier
{
  return self->_shortcutIdentifier;
}

- (void)setShortcutIdentifier:(id)a3
{
}

- (BOOL)isAppClip
{
  return self->_isAppClip;
}

- (void)setIsAppClip:(BOOL)a3
{
  self->_isAppClip = a3;
}

- (BOOL)scenelessBackgroundLaunch
{
  return self->_scenelessBackgroundLaunch;
}

- (void)setScenelessBackgroundLaunch:(BOOL)a3
{
  self->_scenelessBackgroundLaunch = a3;
}

- (unint64_t)contentMode
{
  return self->_contentMode;
}

- (void)setContentMode:(unint64_t)a3
{
  self->_unint64_t contentMode = a3;
}

- (BOOL)ignoreManifestScope
{
  return self->_ignoreManifestScope;
}

- (void)setIgnoreManifestScope:(BOOL)a3
{
  self->_ignoreManifestScope = a3;
}

- (BOOL)configurationIsManaged
{
  return self->_configurationIsManaged;
}

- (void)setConfigurationIsManaged:(BOOL)a3
{
  self->_configurationIsManaged = a3;
}

- (unint64_t)webClipStatusBarStyle
{
  return self->_webClipStatusBarStyle;
}

- (void)setWebClipStatusBarStyle:(unint64_t)a3
{
  self->_unint64_t webClipStatusBarStyle = a3;
}

- (unint64_t)eligibilityStatus
{
  return self->_eligibilityStatus;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shortcutIdentifier, 0);
  objc_storeStrong((id *)&self->tintableIconImage, 0);
  objc_storeStrong((id *)&self->darkIconImage, 0);
  objc_storeStrong((id *)&self->_trustedClientBundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_readOnlyDictionaryRepresentation, 0);
  objc_storeStrong((id *)&self->_startupLandscapeImageConnection, 0);
  objc_storeStrong((id *)&self->_customStartupLandscapeImageData, 0);
  objc_storeStrong((id *)&self->_startupImageConnection, 0);
  objc_storeStrong((id *)&self->_customStartupImageData, 0);
  objc_storeStrong((id *)&self->_iconConnection, 0);
  objc_storeStrong((id *)&self->_customIconData, 0);
  objc_destroyWeak((id *)&self->delegate);
  objc_storeStrong((id *)&self->initialLaunchImage, 0);
  objc_storeStrong((id *)&self->startupLandscapeImage, 0);
  objc_storeStrong((id *)&self->startupImage, 0);
  objc_storeStrong((id *)&self->iconImage, 0);
  objc_storeStrong((id *)&self->manifestId, 0);
  objc_storeStrong((id *)&self->placeholderBundleIdentifier, 0);
  objc_storeStrong((id *)&self->applicationBundleIdentifier, 0);
  objc_storeStrong((id *)&self->title, 0);
  objc_storeStrong((id *)&self->startupLandscapeImageURL, 0);
  objc_storeStrong((id *)&self->startupImageURL, 0);
  objc_storeStrong((id *)&self->icons, 0);
  objc_storeStrong((id *)&self->pageURL, 0);
  objc_storeStrong((id *)&self->identifier, 0);
}

@end