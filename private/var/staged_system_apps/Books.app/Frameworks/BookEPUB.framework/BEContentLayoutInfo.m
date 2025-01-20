@interface BEContentLayoutInfo
+ (NSString)anchorFramesScript;
+ (NSString)expandableContentFramesScript;
+ (NSString)mediaFramesScript;
+ (NSString)scrollingElementSizeScript;
+ (NSString)textContentScript;
+ (NSString)textDirectionScript;
+ (NSString)writingModeScript;
+ (id)javascriptForContentOptions:(unint64_t)a3;
+ (id)updateScriptWithOptions:(id)a3;
- (BEContentLayoutInfo)initWithOptions:(id)a3;
- (BEWebViewFactoryPaginationOptions)options;
- (id)anyFrameJavascript:(int64_t)a3;
- (id)anyFrameJavascriptURL:(int64_t)a3;
- (id)mainFrameJavascriptURL:(int64_t)a3;
- (id)mainFrameOnlyJavascript:(int64_t)a3;
- (void)setOptions:(id)a3;
@end

@implementation BEContentLayoutInfo

- (BEContentLayoutInfo)initWithOptions:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BEContentLayoutInfo;
  v6 = [(BEContentLayoutInfo *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_options, a3);
  }

  return v7;
}

- (id)mainFrameOnlyJavascript:(int64_t)a3
{
  if (a3)
  {
    v3 = 0;
  }
  else
  {
    CFStringRef v10 = @"bookInfo";
    uint64_t v4 = [(BEWebViewFactoryPaginationOptions *)self->_options jsonRepresentation];
    id v5 = (void *)v4;
    CFStringRef v6 = &stru_3D7B70;
    if (v4) {
      CFStringRef v6 = (const __CFString *)v4;
    }
    CFStringRef v11 = v6;
    v7 = +[NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];

    v8 = +[content_layout_info source];
    v3 = +[BESimpleTemplate javascriptStringFromJavascriptSource:v8 replacements:v7];
  }

  return v3;
}

- (id)mainFrameJavascriptURL:(int64_t)a3
{
  if (a3)
  {
    v3 = 0;
  }
  else
  {
    uint64_t v4 = +[content_layout_info sourceName];
    v3 = BEJavascriptProviderUniqueURLForFilename((uint64_t)v4);
  }

  return v3;
}

- (id)anyFrameJavascript:(int64_t)a3
{
  return 0;
}

- (id)anyFrameJavascriptURL:(int64_t)a3
{
  return 0;
}

+ (id)javascriptForContentOptions:(unint64_t)a3
{
  v3 = +[NSNumber numberWithUnsignedInteger:a3];
  uint64_t v4 = +[NSString stringWithFormat:@"__ibooks_content_layout_info.getFramesAndPageOffsets(%@)", v3];

  return v4;
}

+ (id)updateScriptWithOptions:(id)a3
{
  v3 = [a3 jsonRepresentation];
  uint64_t v4 = +[NSString stringWithFormat:@"__ibooks_content_layout_info.updateDocumentInfo('%@')", v3];

  return v4;
}

+ (NSString)anchorFramesScript
{
  return (NSString *)@"__ibooks_content_layout_info._anchorFrames()";
}

+ (NSString)mediaFramesScript
{
  return (NSString *)@"__ibooks_content_layout_info._mediaFrames()";
}

+ (NSString)expandableContentFramesScript
{
  return (NSString *)@"__ibooks_content_layout_info._expandableContentFrames()";
}

+ (NSString)textContentScript
{
  return (NSString *)@"__ibooks_content_layout_info._textContent()";
}

+ (NSString)textDirectionScript
{
  return (NSString *)@"__ibooks_content_layout_info._effectiveTextDirection()";
}

+ (NSString)writingModeScript
{
  return (NSString *)@"__ibooks_content_layout_info._effectiveWritingMode()";
}

+ (NSString)scrollingElementSizeScript
{
  return (NSString *)@"__ibooks_content_layout_info._scrollingElementSize()";
}

- (BEWebViewFactoryPaginationOptions)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
}

- (void).cxx_destruct
{
}

@end