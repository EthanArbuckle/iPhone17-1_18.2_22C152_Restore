@interface BEContentCleanupJS
+ (id)updateScriptWithOptions:(id)a3 pageLength:(double)a4 gapBetweenPages:(double)a5;
- (BEContentCleanupJS)initWithOptions:(id)a3 pageLength:(double)a4 gapBetweenPages:(double)a5;
- (BEContentCleanupJSOptions)options;
- (double)gapBetweenPages;
- (double)pageLength;
- (id)anyFrameJavascript:(int64_t)a3;
- (id)anyFrameJavascriptURL:(int64_t)a3;
- (id)mainFrameJavascriptURL:(int64_t)a3;
- (id)mainFrameOnlyJavascript:(int64_t)a3;
- (void)setGapBetweenPages:(double)a3;
- (void)setOptions:(id)a3;
- (void)setPageLength:(double)a3;
@end

@implementation BEContentCleanupJS

- (BEContentCleanupJS)initWithOptions:(id)a3 pageLength:(double)a4 gapBetweenPages:(double)a5
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)BEContentCleanupJS;
  v10 = [(BEContentCleanupJS *)&v13 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_options, a3);
    v11->_pageLength = a4;
    v11->_gapBetweenPages = a5;
  }

  return v11;
}

- (id)mainFrameOnlyJavascript:(int64_t)a3
{
  return 0;
}

- (id)mainFrameJavascriptURL:(int64_t)a3
{
  return 0;
}

- (id)anyFrameJavascript:(int64_t)a3
{
  if (a3)
  {
    v3 = 0;
  }
  else
  {
    v24[0] = @"bookInfo";
    uint64_t v5 = [(BEContentCleanupJSOptions *)self->_options jsonRepresentation];
    v6 = (void *)v5;
    if (v5) {
      CFStringRef v7 = (const __CFString *)v5;
    }
    else {
      CFStringRef v7 = &stru_3D7B70;
    }
    v25[0] = v7;
    v24[1] = @"pageLength";
    v23 = +[NSNumber numberWithDouble:self->_pageLength];
    uint64_t v8 = [v23 stringValue];
    id v9 = (void *)v8;
    if (v8) {
      CFStringRef v10 = (const __CFString *)v8;
    }
    else {
      CFStringRef v10 = &stru_3D7B70;
    }
    v25[1] = v10;
    v24[2] = @"gapBetweenPages";
    v11 = +[NSNumber numberWithDouble:self->_gapBetweenPages];
    uint64_t v12 = [v11 stringValue];
    objc_super v13 = (void *)v12;
    if (v12) {
      CFStringRef v14 = (const __CFString *)v12;
    }
    else {
      CFStringRef v14 = &stru_3D7B70;
    }
    v25[2] = v14;
    v24[3] = @"readingMode";
    v15 = +[NSNumber numberWithUnsignedInteger:[(BEContentCleanupJSOptions *)self->_options readingMode]];
    v16 = [v15 stringValue];
    v25[3] = v16;
    v24[4] = @"altTextPlaceholder";
    v17 = BookEPUBBundle();
    v18 = [v17 localizedStringForKey:@"Image" value:&stru_3D7B70 table:0];
    v19 = +[NSString stringWithFormat:@"\"%@\"", v18];
    v25[4] = v19;
    v20 = +[NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:5];

    v21 = +[content_cleanup source];
    v3 = +[BESimpleTemplate javascriptStringFromJavascriptSource:v21 replacements:v20];
  }

  return v3;
}

- (id)anyFrameJavascriptURL:(int64_t)a3
{
  if (a3)
  {
    v3 = 0;
  }
  else
  {
    v4 = +[content_cleanup sourceName];
    v3 = BEJavascriptProviderUniqueURLForFilename((uint64_t)v4);
  }

  return v3;
}

+ (id)updateScriptWithOptions:(id)a3 pageLength:(double)a4 gapBetweenPages:(double)a5
{
  id v7 = a3;
  uint64_t v8 = [v7 jsonRepresentation];
  id v9 = +[NSNumber numberWithDouble:a4];
  CFStringRef v10 = [v9 stringValue];
  v11 = +[NSNumber numberWithDouble:a5];
  uint64_t v12 = [v11 stringValue];
  id v13 = [v7 readingMode];

  CFStringRef v14 = +[NSNumber numberWithUnsignedInteger:v13];
  v15 = [v14 stringValue];
  v16 = +[NSString stringWithFormat:@"__ibooks_content_cleanup.updateConfiguration('%@', %@, %@, %@)", v8, v10, v12, v15];

  return v16;
}

- (BEContentCleanupJSOptions)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
}

- (double)pageLength
{
  return self->_pageLength;
}

- (void)setPageLength:(double)a3
{
  self->_pageLength = a3;
}

- (double)gapBetweenPages
{
  return self->_gapBetweenPages;
}

- (void)setGapBetweenPages:(double)a3
{
  self->_gapBetweenPages = a3;
}

- (void).cxx_destruct
{
}

@end