@interface BEContentSupportJS
+ (NSString)performAfterLoad;
+ (id)_javascriptForAttributes:(id)a3;
+ (id)javascriptForDocumentTheme:(id)a3 level:(int64_t)a4;
+ (id)javascriptForSwappingAllImages;
+ (id)javascriptForUpdatedDisplaySetting:(BOOL)a3 imageFilterMode:(unint64_t)a4 lineGuideEnabled:(BOOL)a5;
+ (id)javascriptForUpdatedImageFilterMode:(unint64_t)a3;
+ (id)javascriptForUpdatedLineGuideDisplayChange;
+ (id)javascriptForUpdatedLineGuideDisplayEnabled:(BOOL)a3;
- (BEContentSupportJS)initWithMode:(unint64_t)a3 forDisplay:(BOOL)a4 attributes:(id)a5 imageFilterMode:(unint64_t)a6 lineGuideEnabled:(BOOL)a7;
- (BEContentSupportJS)initWithMode:(unint64_t)a3 forDisplay:(BOOL)a4 imageFilterMode:(unint64_t)a5 lineGuideEnabled:(BOOL)a6;
- (BOOL)forDisplay;
- (BOOL)lineGuideEnabled;
- (BOOL)singleTapEnabled;
- (NSDictionary)attributes;
- (NSDictionary)configurationDictionary;
- (id)anyFrameJavascript:(int64_t)a3;
- (id)anyFrameJavascriptURL:(int64_t)a3;
- (id)mainFrameJavascriptURL:(int64_t)a3;
- (id)mainFrameOnlyJavascript:(int64_t)a3;
- (int64_t)_interfaceLevel;
- (unint64_t)imageFilterMode;
- (unint64_t)mode;
- (void)setAttributes:(id)a3;
- (void)setForDisplay:(BOOL)a3;
- (void)setMode:(unint64_t)a3;
- (void)setSingleTapEnabled:(BOOL)a3;
@end

@implementation BEContentSupportJS

- (BEContentSupportJS)initWithMode:(unint64_t)a3 forDisplay:(BOOL)a4 imageFilterMode:(unint64_t)a5 lineGuideEnabled:(BOOL)a6
{
  return [(BEContentSupportJS *)self initWithMode:a3 forDisplay:a4 attributes:0 imageFilterMode:a5 lineGuideEnabled:a6];
}

- (BEContentSupportJS)initWithMode:(unint64_t)a3 forDisplay:(BOOL)a4 attributes:(id)a5 imageFilterMode:(unint64_t)a6 lineGuideEnabled:(BOOL)a7
{
  id v12 = a5;
  v18.receiver = self;
  v18.super_class = (Class)BEContentSupportJS;
  v13 = [(BEContentSupportJS *)&v18 init];
  v14 = v13;
  if (v13)
  {
    v13->_mode = a3;
    v13->_forDisplay = a4;
    v15 = (NSDictionary *)[v12 copy];
    attributes = v14->_attributes;
    v14->_attributes = v15;

    v14->_imageFilterMode = a6;
    v14->_singleTapEnabled = 1;
    v14->_lineGuideEnabled = a7;
  }

  return v14;
}

- (int64_t)_interfaceLevel
{
  v2 = +[UITraitCollection currentTraitCollection];
  id v3 = [v2 be_contentSupportInterfaceLevel];

  return (int64_t)v3;
}

- (id)mainFrameOnlyJavascript:(int64_t)a3
{
  return 0;
}

- (id)mainFrameJavascriptURL:(int64_t)a3
{
  if (a3 == 1)
  {
    id v3 = +[content_support sourceName];
    v4 = BEJavascriptProviderUniqueURLForFilename((uint64_t)v3);
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)anyFrameJavascript:(int64_t)a3
{
  if (a3)
  {
    if (self->_mode == 4)
    {
      v4 = 0;
    }
    else
    {
      +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"__ibooks_content_support._updateImageVisibilityAndFilter(%lu);",
      v4 = [(BEContentSupportJS *)self imageFilterMode]);
    }
  }
  else
  {
    v16[0] = @"mode";
    v5 = +[NSNumber numberWithUnsignedInteger:self->_mode];
    uint64_t v6 = [v5 stringValue];
    v7 = (void *)v6;
    CFStringRef v8 = @"0";
    if (v6) {
      CFStringRef v8 = (const __CFString *)v6;
    }
    v17[0] = v8;
    v16[1] = @"configuration";
    v9 = sub_6DA4(self->_forDisplay, [(BEContentSupportJS *)self _interfaceLevel], [(BEContentSupportJS *)self imageFilterMode], self->_singleTapEnabled, self->_lineGuideEnabled);
    v17[1] = v9;
    v16[2] = @"image_mime_types";
    v10 = BESupportedImageMimeTypesJSON();
    v17[2] = v10;
    v11 = +[NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:3];

    id v12 = +[content_support source];
    v4 = +[BESimpleTemplate javascriptStringFromJavascriptSource:v12 replacements:v11];
  }
  v13 = +[BEContentSupportJS _javascriptForAttributes:self->_attributes];
  v14 = [v4 stringByAppendingString:v13];

  return v14;
}

- (id)anyFrameJavascriptURL:(int64_t)a3
{
  if (a3)
  {
    id v3 = 0;
  }
  else
  {
    v4 = +[content_support sourceName];
    id v3 = BEJavascriptProviderUniqueURLForFilename((uint64_t)v4);
  }

  return v3;
}

+ (NSString)performAfterLoad
{
  return (NSString *)@"__ibooks_content_support._performAfterLoad()";
}

+ (id)javascriptForDocumentTheme:(id)a3 level:(int64_t)a4
{
  id v5 = a3;
  uint64_t v6 = +[NSUserDefaults standardUserDefaults];
  unsigned int v7 = [v6 BOOLForKey:@"BKFlowingBookViewControllerInvertImagesKey"];

  uint64_t v8 = +[NSNumber numberWithInteger:a4];
  v9 = (void *)v8;
  CFStringRef v10 = @"0";
  if (v7) {
    CFStringRef v10 = @"1";
  }
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"__ibooks_content_support.setDocumentTheme('%@','%@','%@');",
    v5,
    v8,
  v11 = v10);

  return v11;
}

+ (id)javascriptForUpdatedDisplaySetting:(BOOL)a3 imageFilterMode:(unint64_t)a4 lineGuideEnabled:(BOOL)a5
{
  id v5 = sub_6DA4(a3, 0, a4, 1, a5);
  uint64_t v6 = +[NSString stringWithFormat:@"__ibooks_content_support.updateConfiguration('%@')", v5];

  return v6;
}

+ (id)javascriptForSwappingAllImages
{
  return @"__ibooks_content_support.useBookProtocolForAllImages()";
}

+ (id)javascriptForUpdatedImageFilterMode:(unint64_t)a3
{
  id v3 = +[NSNumber numberWithUnsignedInteger:a3];
  v4 = [v3 stringValue];
  id v5 = +[NSString stringWithFormat:@"__ibooks_content_support.refetchVisibleImages(%@)", v4];

  return v5;
}

+ (id)javascriptForUpdatedLineGuideDisplayEnabled:(BOOL)a3
{
  id v3 = +[NSNumber numberWithBool:a3];
  v4 = [v3 stringValue];
  id v5 = +[NSString stringWithFormat:@"__ibooks_content_support.updateLineGuideEnabledStatus(%@)", v4];

  return v5;
}

+ (id)javascriptForUpdatedLineGuideDisplayChange
{
  return @"__ibooks_content_support.notifyNativeOfVisibleElementCFIs()";
}

+ (id)_javascriptForAttributes:(id)a3
{
  if (a3)
  {
    id v3 = +[NSJSONSerialization dataWithJSONObject:a3 options:4 error:0];
    id v4 = [objc_alloc((Class)NSString) initWithData:v3 encoding:4];
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"__ibooks_content_support.setDocumentAttributes('%@');",
      v4);
    id v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v5 = &stru_3D7B70;
  }

  return v5;
}

- (unint64_t)imageFilterMode
{
  return self->_imageFilterMode;
}

- (BOOL)lineGuideEnabled
{
  return self->_lineGuideEnabled;
}

- (unint64_t)mode
{
  return self->_mode;
}

- (void)setMode:(unint64_t)a3
{
  self->_mode = a3;
}

- (BOOL)forDisplay
{
  return self->_forDisplay;
}

- (void)setForDisplay:(BOOL)a3
{
  self->_forDisplay = a3;
}

- (NSDictionary)attributes
{
  return self->_attributes;
}

- (void)setAttributes:(id)a3
{
}

- (BOOL)singleTapEnabled
{
  return self->_singleTapEnabled;
}

- (void)setSingleTapEnabled:(BOOL)a3
{
  self->_singleTapEnabled = a3;
}

- (NSDictionary)configurationDictionary
{
  return self->_configurationDictionary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configurationDictionary, 0);

  objc_storeStrong((id *)&self->_attributes, 0);
}

@end