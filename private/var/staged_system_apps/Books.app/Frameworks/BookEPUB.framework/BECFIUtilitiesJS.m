@interface BECFIUtilitiesJS
+ (id)cfisForHrefsScript:(id)a3;
+ (id)clientRectsForAnnotationCFIs:(id)a3;
+ (id)getClientRectsForLocationsScript:(id)a3;
+ (id)getSelectedRangeScript:(id)a3;
+ (id)textNodeCharacterCountsScriptForSpineIndex:(unint64_t)a3 documentOrdinal:(int64_t)a4;
+ (id)updateScriptWithOptions:(id)a3 gapBetweenPages:(double)a4 paginatedTopToBottom:(BOOL)a5;
+ (id)upgradeAnnotationsScript:(id)a3;
- (BECFIUtilitiesJS)initWithOptions:(id)a3 gapBetweenPages:(double)a4 paginatedTopToBottom:(BOOL)a5;
- (BECFIUtilitiesJSOptions)options;
- (BOOL)paginatedTopToBottom;
- (double)gapBetweenPages;
- (id)anyFrameJavascript:(int64_t)a3;
- (id)anyFrameJavascriptURL:(int64_t)a3;
- (id)mainFrameJavascriptURL:(int64_t)a3;
- (id)mainFrameOnlyJavascript:(int64_t)a3;
- (void)setGapBetweenPages:(double)a3;
- (void)setOptions:(id)a3;
- (void)setPaginatedTopToBottom:(BOOL)a3;
@end

@implementation BECFIUtilitiesJS

- (BECFIUtilitiesJS)initWithOptions:(id)a3 gapBetweenPages:(double)a4 paginatedTopToBottom:(BOOL)a5
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)BECFIUtilitiesJS;
  v10 = [(BECFIUtilitiesJS *)&v13 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_options, a3);
    v11->_gapBetweenPages = a4;
    v11->_paginatedTopToBottom = a5;
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
    v3 = @"document.addEventListener('click', __ibooks_cfi_utilities.stashCFIForClickedElement, true);";
  }
  else
  {
    v19[0] = @"bookInfo";
    uint64_t v5 = [(BECFIUtilitiesJSOptions *)self->_options jsonRepresentation];
    v6 = (void *)v5;
    CFStringRef v7 = &stru_3D7B70;
    if (v5) {
      CFStringRef v7 = (const __CFString *)v5;
    }
    v20[0] = v7;
    v19[1] = @"gapBetweenPages";
    v8 = +[NSNumber numberWithDouble:self->_gapBetweenPages];
    uint64_t v9 = [v8 stringValue];
    v10 = (void *)v9;
    if (v9) {
      CFStringRef v11 = (const __CFString *)v9;
    }
    else {
      CFStringRef v11 = @"0";
    }
    v20[1] = v11;
    v19[2] = @"paginatedVertically";
    v12 = +[NSNumber numberWithBool:self->_paginatedTopToBottom];
    uint64_t v13 = [v12 stringValue];
    v14 = (void *)v13;
    if (v13) {
      CFStringRef v15 = (const __CFString *)v13;
    }
    else {
      CFStringRef v15 = @"0";
    }
    v20[2] = v15;
    v16 = +[NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:3];

    v17 = +[cfi_utilities source];
    v3 = +[BESimpleTemplate javascriptStringFromJavascriptSource:v17 replacements:v16];
  }

  return v3;
}

- (id)anyFrameJavascriptURL:(int64_t)a3
{
  v3 = +[cfi_utilities sourceName];
  v4 = BEJavascriptProviderUniqueURLForFilename((uint64_t)v3);

  return v4;
}

+ (id)updateScriptWithOptions:(id)a3 gapBetweenPages:(double)a4 paginatedTopToBottom:(BOOL)a5
{
  BOOL v5 = a5;
  CFStringRef v7 = [a3 jsonRepresentation];
  v8 = +[NSNumber numberWithDouble:a4];
  uint64_t v9 = +[NSNumber numberWithBool:v5];
  v10 = +[NSString stringWithFormat:@"__ibooks_cfi_utilities.updateDocumentInfo('%@', %@, %@)", v7, v8, v9];

  return v10;
}

+ (id)upgradeAnnotationsScript:(id)a3
{
  uint64_t v7 = 0;
  v3 = +[NSJSONSerialization dataWithJSONObject:a3 options:4 error:&v7];
  id v4 = [objc_alloc((Class)NSString) initWithData:v3 encoding:4];
  BOOL v5 = +[NSString stringWithFormat:@"__ibooks_cfi_utilities.cfiLocationsForRanges('%@')", v4];

  return v5;
}

+ (id)getClientRectsForLocationsScript:(id)a3
{
  id v3 = a3;
  if ([v3 count])
  {
    id v11 = 0;
    id v4 = +[NSJSONSerialization dataWithJSONObject:v3 options:0 error:&v11];
    id v5 = v11;
    v6 = v5;
    if (v4) {
      BOOL v7 = v5 == 0;
    }
    else {
      BOOL v7 = 0;
    }
    if (v7)
    {
      v8 = [objc_alloc((Class)NSString) initWithData:v4 encoding:4];
      +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"__ibooks_cfi_utilities.getClientRects(%@);",
        v8);
      uint64_t v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = _BookEPUBLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        id v13 = v3;
        __int16 v14 = 2112;
        CFStringRef v15 = v6;
        _os_log_impl(&def_7BFC0, v8, OS_LOG_TYPE_ERROR, "Error serialization locations: %@, error:%@", buf, 0x16u);
      }
      uint64_t v9 = &stru_3D7B70;
    }
  }
  else
  {
    uint64_t v9 = &stru_3D7B70;
  }

  return v9;
}

+ (id)textNodeCharacterCountsScriptForSpineIndex:(unint64_t)a3 documentOrdinal:(int64_t)a4
{
  id v4 = +[NSString stringWithFormat:@"/%lu/%lu!", 2 * a3 + 2, 2 * a4 + 2];
  id v5 = +[NSString stringWithFormat:@"__ibooks_cfi_utilities.textNodeCharacterCounts(document.documentElement, '%@')", v4];

  return v5;
}

+ (id)cfisForHrefsScript:(id)a3
{
  id v3 = a3;
  if ([v3 count])
  {
    id v4 = objc_alloc_init((Class)NSMutableArray);
    [v4 addObject:@"__ibooks_cfi_utilities.cfisForHrefs(["];
    id v5 = (char *)[v3 count];
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
      {
        if (i) {
          [v4 addObject:@","];
        }
        [v4 addObject:@"\""];
        v8 = [v3 objectAtIndexedSubscript:i];
        [v4 addObject:v8];

        [v4 addObject:@"\""];
      }
    }
    [v4 addObject:@"];"]);
    uint64_t v9 = [v4 componentsJoinedByString:&stru_3D7B70];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

+ (id)clientRectsForAnnotationCFIs:(id)a3
{
  uint64_t v7 = 0;
  id v3 = +[NSJSONSerialization dataWithJSONObject:a3 options:4 error:&v7];
  id v4 = [objc_alloc((Class)NSString) initWithData:v3 encoding:4];
  id v5 = +[NSString stringWithFormat:@"__ibooks_cfi_utilities.getClientRectsForAnnotationCFIS('%@')", v4];

  return v5;
}

+ (id)getSelectedRangeScript:(id)a3
{
  id v3 = a3;
  if ([v3 count])
  {
    id v10 = 0;
    id v4 = +[NSJSONSerialization dataWithJSONObject:v3 options:4 error:&v10];
    id v5 = v10;
    if (v5)
    {
      v6 = _BookEPUBLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v12 = v3;
        _os_log_impl(&def_7BFC0, v6, OS_LOG_TYPE_ERROR, "Unable to serialize physical page hrefs %@", buf, 0xCu);
      }
    }
    if (v4)
    {
      id v7 = [objc_alloc((Class)NSString) initWithData:v4 encoding:4];
      +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"__ibooks_cfi_utilities.getSelectedRangeWithPhysicalPage(%@);",
        v7);
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = @"__ibooks_cfi_utilities.getSelectedRange();";
    }
  }
  else
  {
    v8 = @"__ibooks_cfi_utilities.getSelectedRange();";
  }

  return v8;
}

- (BECFIUtilitiesJSOptions)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
}

- (BOOL)paginatedTopToBottom
{
  return self->_paginatedTopToBottom;
}

- (void)setPaginatedTopToBottom:(BOOL)a3
{
  self->_paginatedTopToBottom = a3;
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