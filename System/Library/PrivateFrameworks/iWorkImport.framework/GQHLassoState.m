@interface GQHLassoState
- (BOOL)drawablesNeedCssZOrdering;
- (BOOL)finishMainHtml;
- (BOOL)inProgressiveMode;
- (BOOL)writeIndexPageWithIFrame:(id)a3;
- (CGPoint)maxCanvasPoint;
- (GQHLassoState)initWithState:(id)a3;
- (__CFString)cssZOrderClassForDrawableUid:(const char *)a3;
- (__CFString)makeInlineStyle:(__CFString *)a3;
- (__CFString)writeTabsJS;
- (int)endSheet;
- (unsigned)currentDrawableZOrder;
- (void)addCachedStyle:(__CFString *)a3;
- (void)addStyle:(__CFString *)a3 className:(__CFString *)a4 srcStyle:(id)a5;
- (void)addedDrawableWithBounds:(CGRect)a3;
- (void)beginNewSheet:(const char *)a3 processorState:(id)a4;
- (void)cacheAnchorForIndexPage:(char *)a3;
- (void)dealloc;
- (void)writeAnchorInNavigationPage:(char *)a3;
- (void)writeIndexPageWithDocumentSize:(CGSize)a3;
- (void)writeNavigationPage:(id)a3;
@end

@implementation GQHLassoState

- (GQHLassoState)initWithState:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)GQHLassoState;
  v4 = -[GQHState initWithState:](&v8, "initWithState:");
  v5 = v4;
  if (v4)
  {
    v4->mMaxCanvasPoint = NSZeroPoint;
    v4->mSheetCssUriList = CFArrayCreateMutable(0, 0, &kCFTypeArrayCallBacks);
    v5->mSheetCssLastUriList = CFArrayCreateMutable(0, 0, &kCFTypeArrayCallBacks);
    v5->mSheetFilenameList = CFArrayCreateMutable(0, 0, &kCFTypeArrayCallBacks);
    v5->mSheetUriList = CFArrayCreateMutable(0, 0, &kCFTypeArrayCallBacks);
    v5->mSheetOneCss = CFStringCreateMutable(0, 0);
    v5->mSheetOneLastCSS = CFStringCreateMutable(0, 0);
    if ([a3 isGeneratingThumbnail])
    {
      v5->mIsProgressiveMode = 0;
LABEL_5:
      [(GQHLassoState *)v5 writeNavigationPage:a3];
      return v5;
    }
    [a3 outputBundle];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    v5->mIsProgressiveMode = isKindOfClass & 1;
    if ((isKindOfClass & 1) == 0) {
      goto LABEL_5;
    }
  }
  return v5;
}

- (void)dealloc
{
  mCssUri = self->mCssUri;
  if (mCssUri) {
    CFRelease(mCssUri);
  }
  mCurrentSheetFilename = self->mCurrentSheetFilename;
  if (mCurrentSheetFilename) {
    CFRelease(mCurrentSheetFilename);
  }
  mCurrentSheetUri = self->mCurrentSheetUri;
  if (mCurrentSheetUri) {
    CFRelease(mCurrentSheetUri);
  }
  mDrawableUidToCssZOrderClassMap = self->mDrawableUidToCssZOrderClassMap;
  if (mDrawableUidToCssZOrderClassMap) {
    CFRelease(mDrawableUidToCssZOrderClassMap);
  }
  mSheetCssUriList = self->mSheetCssUriList;
  if (mSheetCssUriList) {
    CFRelease(mSheetCssUriList);
  }
  mSheetCssFilename = self->mSheetCssFilename;
  if (mSheetCssFilename) {
    CFRelease(mSheetCssFilename);
  }
  mFirstWorkspaceName = self->mFirstWorkspaceName;
  if (mFirstWorkspaceName) {
    xmlFree(mFirstWorkspaceName);
  }
  mSheetOneCss = self->mSheetOneCss;
  if (mSheetOneCss) {
    CFRelease(mSheetOneCss);
  }
  mSheetOneLastCSS = self->mSheetOneLastCSS;
  if (mSheetOneLastCSS) {
    CFRelease(mSheetOneLastCSS);
  }
  mSheetFilenameList = self->mSheetFilenameList;
  if (mSheetFilenameList) {
    CFRelease(mSheetFilenameList);
  }
  mSheetUriList = self->mSheetUriList;
  if (mSheetUriList) {
    CFRelease(mSheetUriList);
  }
  mSheetCssLastUriList = self->mSheetCssLastUriList;
  if (mSheetCssLastUriList) {
    CFRelease(mSheetCssLastUriList);
  }
  mSheetCssLastFilename = self->mSheetCssLastFilename;
  if (mSheetCssLastFilename) {
    CFRelease(mSheetCssLastFilename);
  }
  mIndex = self->mIndex;
  if (mIndex) {

  }
  v17.receiver = self;
  v17.super_class = (Class)GQHLassoState;
  [(GQHState *)&v17 dealloc];
}

- (void)beginNewSheet:(const char *)a3 processorState:(id)a4
{
  ++self->mSheetCount;
  self->mTableCount = 0;
  self->mMaxCanvasPoint = NSZeroPoint;
  mCurrentSheetFilename = self->mCurrentSheetFilename;
  if (mCurrentSheetFilename) {
    CFRelease(mCurrentSheetFilename);
  }
  mCurrentSheetUri = self->mCurrentSheetUri;
  if (mCurrentSheetUri) {
    CFRelease(mCurrentSheetUri);
  }
  self->mCurrentSheetFilename = (__CFString *)CFStringCreateWithFormat(kCFAllocatorDefault, 0, off_9D1C8, self->mSheetCount);
  self->mCurrentSheetUri = (__CFString *)objc_msgSend(-[GQSDocument outputBundle](self->super.mProcessorState, "outputBundle"), "createUriForResource:", self->mCurrentSheetFilename);
  if (self->mIsProgressiveMode)
  {
    mSheetOneCss = self->mSheetOneCss;
    if (mSheetOneCss) {
      CFRelease(mSheetOneCss);
    }
    mSheetOneLastCSS = self->mSheetOneLastCSS;
    if (mSheetOneLastCSS) {
      CFRelease(mSheetOneLastCSS);
    }
    self->mSheetOneCss = CFStringCreateMutable(0, 0);
    self->mSheetOneLastCSS = CFStringCreateMutable(0, 0);
    objc_msgSend(objc_msgSend(a4, "outputBundle"), "setCurrentSheetUri:", self->mCurrentSheetUri);
  }
  v11 = [[GQHXML alloc] initEmptyWithFilename:self->mCurrentSheetFilename useExternalCss:1];
  self->super.mHtmlDoc = v11;
  [(GQHXML *)v11 startElement:"head"];
  if (self->mIsProgressiveMode)
  {
    mSheetCssFilename = self->mSheetCssFilename;
    if (mSheetCssFilename) {
      CFRelease(mSheetCssFilename);
    }
    mSheetCssLastFilename = self->mSheetCssLastFilename;
    if (mSheetCssLastFilename) {
      CFRelease(mSheetCssLastFilename);
    }
    self->mSheetCssFilename = (__CFString *)CFStringCreateWithFormat(kCFAllocatorDefault, 0, off_9D1D0, self->mSheetCount);
    self->mSheetCssLastFilename = (__CFString *)CFStringCreateWithFormat(kCFAllocatorDefault, 0, off_9D1D8, self->mSheetCount);
    id v14 = objc_msgSend(objc_msgSend(a4, "outputBundle"), "createUriForResource:", self->mSheetCssFilename);
    id v15 = objc_msgSend(objc_msgSend(a4, "outputBundle"), "createUriForResource:", self->mSheetCssLastFilename);
    CFArrayAppendValue(self->mSheetCssUriList, v14);
    mSheetCssUriList = self->mSheetCssUriList;
    v21.length = CFArrayGetCount(mSheetCssUriList);
    v21.location = 0;
    CFArrayApplyFunction(mSheetCssUriList, v21, (CFArrayApplierFunction)sub_28C64, self->super.mHtmlDoc);
    CFArrayAppendValue(self->mSheetCssLastUriList, v15);
    mSheetCssLastUriList = self->mSheetCssLastUriList;
    v22.length = CFArrayGetCount(mSheetCssLastUriList);
    v22.location = 0;
    CFArrayApplyFunction(mSheetCssLastUriList, v22, (CFArrayApplierFunction)sub_28C64, self->super.mHtmlDoc);
    CFRelease(v14);
    CFRelease(v15);
  }
  else
  {
    [(GQHXML *)self->super.mHtmlDoc startElement:"link"];
    [(GQHXML *)self->super.mHtmlDoc setAttribute:"rel" value:"stylesheet"];
    [(GQHXML *)self->super.mHtmlDoc setAttribute:"type" value:"text/css"];
    [(GQHXML *)self->super.mHtmlDoc setAttribute:"href" cfStringValue:self->mCssUri];
    [(GQHXML *)self->super.mHtmlDoc endElement];
  }
  [(GQHXML *)self->super.mHtmlDoc addMetaTagWithTextFormat:@"UTF-8"];
  objc_msgSend(-[GQHState shapeContext](self, "shapeContext"), "addScriptTagToHtml:state:", self->super.mHtmlDoc, -[GQHState processorState](self, "processorState"));
  [(GQHXML *)self->super.mHtmlDoc endElement];
  [(GQHXML *)self->super.mHtmlDoc startElement:"body"];
  [(GQHXML *)self->super.mHtmlDoc startElement:"div"];
  [(GQHXML *)self->super.mHtmlDoc setAttribute:"id" value:"sheetBody"];
  [(GQHXML *)self->super.mHtmlDoc startElement:"div"];
  v18 = objc_alloc_init(GQHStyle);
  [(GQHStyle *)v18 addAttribute:off_9CEF0 pxValue:10];
  [(GQHStyle *)v18 addAttribute:off_9CF18 value:off_9D040];
  [(GQHStyle *)v18 setStyleOnCurrentNode:self];

  if (self->mIsProgressiveMode)
  {
    int mSheetCount = self->mSheetCount;
    [(GQHLassoState *)self cacheAnchorForIndexPage:a3];
    if (mSheetCount == 1) {
      self->mFirstWorkspaceName = (char *)xmlStrdup((const xmlChar *)a3);
    }
  }
  else
  {
    [(GQHLassoState *)self writeAnchorInNavigationPage:a3];
  }
  mDrawableUidToCssZOrderClassMap = self->mDrawableUidToCssZOrderClassMap;
  if (mDrawableUidToCssZOrderClassMap) {
    CFRelease(mDrawableUidToCssZOrderClassMap);
  }
  self->mDrawableUidToCssZOrderClassMap = CFDictionaryCreateMutable(0, 0, (const CFDictionaryKeyCallBacks *)&unk_85110, &kCFTypeDictionaryValueCallBacks);
  self->mCurrentDrawableZOrder = 0;
}

- (void)writeAnchorInNavigationPage:(char *)a3
{
  [(GQHXML *)self->mNavigation startElement:"a"];
  CFStringRef v5 = CFStringCreateWithFormat(0, 0, @"javascript:gotoSheet('%@'); return false;", self->mCurrentSheetUri);
  [(GQHXML *)self->mNavigation setAttribute:"onclick" cfStringValue:v5];
  CFRelease(v5);
  [(GQHXML *)self->mNavigation setAttribute:"href" value:"#"];
  [(GQHXML *)self->mNavigation setAttribute:"title" value:a3];
  [(GQHXML *)self->mNavigation setAttribute:"class" value:"navpane-sheet"];
  [(GQHXML *)self->mNavigation startElement:"div"];
  [(GQHXML *)self->mNavigation setAttribute:"id" cfStringValue:self->mCurrentSheetUri];
  if (self->mSheetCount == 1) {
    [(GQHXML *)self->mNavigation setAttribute:"class" value:"navpane-activesheet"];
  }
  [(GQHXML *)self->mNavigation startElement:"img"];
  [(GQHXML *)self->mNavigation setAttribute:"src" cfStringValue:[(GQSDocument *)self->super.mProcessorState uriForBundleResource:@"sl-icon_sheet" ofType:@"tiff"]];
  [(GQHXML *)self->mNavigation setAttribute:"width" cfStringValue:@"35"];
  [(GQHXML *)self->mNavigation endElement];
  [(GQHXML *)self->mNavigation addCharRef:"&ensp;"];
  [(GQHXML *)self->mNavigation addXmlCharContent:a3];
  [(GQHXML *)self->mNavigation endElement];
  mNavigation = self->mNavigation;
  [(GQHXML *)mNavigation endElement];
}

- (void)cacheAnchorForIndexPage:(char *)a3
{
  CFStringRef v4 = CFStringCreateWithCString(0, a3, 0x8000100u);
  CFArrayAppendValue(self->mSheetUriList, self->mCurrentSheetUri);
  CFArrayAppendValue(self->mSheetFilenameList, v4);
  if (v4)
  {
    CFRelease(v4);
  }
}

- (int)endSheet
{
  [(GQHXML *)self->super.mHtmlDoc endElement];
  [(GQHXML *)self->super.mHtmlDoc endElement];
  [(GQHXML *)self->super.mHtmlDoc endElement];
  [(GQHXML *)self->super.mHtmlDoc endElement];
  if (self->mIsProgressiveMode)
  {
    CFDataRef ExternalRepresentation = CFStringCreateExternalRepresentation(0, self->mSheetOneCss, 0x8000100u, 0x30u);
    CFDataRef v4 = CFStringCreateExternalRepresentation(0, self->mSheetOneLastCSS, 0x8000100u, 0x30u);
    CFRelease(self->mSheetOneCss);
    self->mSheetOneCss = 0;
    CFRelease(self->mSheetOneLastCSS);
    self->mSheetOneLastCSS = 0;
    if (ExternalRepresentation)
    {
      objc_msgSend(-[GQSDocument outputBundle](self->super.mProcessorState, "outputBundle"), "setData:mimeType:forNamedResource:", ExternalRepresentation, @"text/css", self->mSheetCssFilename);
      CFRelease(ExternalRepresentation);
    }
    if (v4)
    {
      objc_msgSend(-[GQSDocument outputBundle](self->super.mProcessorState, "outputBundle"), "setData:mimeType:forNamedResource:", v4, @"text/css", self->mSheetCssLastFilename);
      CFRelease(v4);
    }
  }
  [(GQHXML *)self->super.mHtmlDoc writeToOutputBundle:[(GQSDocument *)self->super.mProcessorState outputBundle] isThumbnail:[(GQSDocument *)self->super.mProcessorState isGeneratingThumbnail]];

  self->super.mHtmlDoc = 0;
  return self->mSheetCount;
}

- (void)addStyle:(__CFString *)a3 className:(__CFString *)a4 srcStyle:(id)a5
{
  if (a5)
  {
    if ([(GQHState *)self className:a5]) {
      return;
    }
    CFDictionarySetValue(self->super.mStyleNameMap, a5, a4);
  }
  if (self->mIsProgressiveMode) {
    uint64_t v9 = 304;
  }
  else {
    uint64_t v9 = 184;
  }
  v10 = *(Class *)((char *)&self->super.super.isa + v9);
  if (v10)
  {
    objc_msgSend(v10, "addStyleClass:", a3, a4);
  }
  else
  {
    mSheetOneCss = self->mSheetOneCss;
    CFStringAppend(mSheetOneCss, a3);
  }
}

- (__CFString)makeInlineStyle:(__CFString *)a3
{
  if (self->mIsProgressiveMode) {
    uint64_t v5 = 304;
  }
  else {
    uint64_t v5 = 184;
  }
  if (*(Class *)((char *)&self->super.super.isa + v5))
  {
    return -[GQHState makeInlineStyle:inDocument:](self, "makeInlineStyle:inDocument:");
  }
  else
  {
    Value = (__CFString *)CFDictionaryGetValue(self->super.mInlineStyles, a3);
    if (!Value)
    {
      uint64_t v7 = (self->super.mInlineStyleIndex + 1);
      self->super.mInlineStyleIndex = v7;
      Value = (__CFString *)CFStringCreateWithFormat(0, 0, @"i%d", v7);
      CFDictionarySetValue(self->super.mInlineStyles, a3, Value);
      CFRelease(Value);
      CFStringRef v8 = CFStringCreateWithFormat(0, 0, @".%@ { %@ }\n", Value, a3);
      CFStringAppend(self->mSheetOneLastCSS, v8);
      CFRelease(v8);
    }
    return Value;
  }
}

- (void)addCachedStyle:(__CFString *)a3
{
  if (self->mIsProgressiveMode) {
    uint64_t v3 = 304;
  }
  else {
    uint64_t v3 = 184;
  }
  CFDataRef v4 = *(Class *)((char *)&self->super.super.isa + v3);
  if (v4) {
    [v4 addStyleClass:a3];
  }
  else {
    CFStringAppend(self->mSheetOneCss, a3);
  }
}

- (BOOL)finishMainHtml
{
  [(GQHXML *)self->mNavigation endElement];
  [(GQHXML *)self->mNavigation endElement];
  if ([(GQHXML *)self->mNavigation isProgressive])
  {
    uint64_t v3 = [(GQHXML *)self->mNavigation createProgressiveHtml];
    id v4 = [(GQSDocument *)self->super.mProcessorState outputBundle];
    [v4 appendData:v3 mimeType:@"text/html" resourceName:off_9D1E0];
    CFRelease(v3);
  }
  BOOL v5 = [(GQHXML *)self->mNavigation writeToOutputBundle:[(GQSDocument *)self->super.mProcessorState outputBundle] isThumbnail:[(GQSDocument *)self->super.mProcessorState isGeneratingThumbnail]];
  if (v5 && [(GQHXML *)self->mNavigation isProgressive])
  {
    id v6 = [(GQSDocument *)self->super.mProcessorState outputBundle];
    [v6 closeAttachment:off_9D1E0];
  }
  return v5;
}

- (CGPoint)maxCanvasPoint
{
  double x = self->mMaxCanvasPoint.x;
  double y = self->mMaxCanvasPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)addedDrawableWithBounds:(CGRect)a3
{
  double x = a3.origin.x + a3.size.width;
  if (self->mMaxCanvasPoint.x >= x) {
    double x = self->mMaxCanvasPoint.x;
  }
  double y = a3.origin.y + a3.size.height;
  if (self->mMaxCanvasPoint.y >= y) {
    double y = self->mMaxCanvasPoint.y;
  }
  self->mMaxCanvasPoint.double x = x;
  self->mMaxCanvasPoint.double y = y;
}

- (BOOL)drawablesNeedCssZOrdering
{
  return 1;
}

- (__CFString)cssZOrderClassForDrawableUid:(const char *)a3
{
  Value = (__CFString *)CFDictionaryGetValue(self->mDrawableUidToCssZOrderClassMap, a3);
  if (!Value)
  {
    uint64_t v6 = self->mZOrderedDrawableCount + 1;
    self->mZOrderedDrawableCount = v6;
    Value = (__CFString *)CFStringCreateWithFormat(0, 0, @"drawableZOrder_%u", v6);
    mDrawableUidToCssZOrderClassMap = self->mDrawableUidToCssZOrderClassMap;
    CFStringRef v8 = xmlStrdup((const xmlChar *)a3);
    CFDictionarySetValue(mDrawableUidToCssZOrderClassMap, v8, Value);
    CFRelease(Value);
  }
  return Value;
}

- (unsigned)currentDrawableZOrder
{
  unsigned int v2 = self->mCurrentDrawableZOrder + 1;
  self->mCurrentDrawableZOrder = v2;
  return v2;
}

- (void)writeIndexPageWithDocumentSize:(CGSize)a3
{
  id v9 = [[GQHXML alloc] initEmptyWithFilename:@"index.html" useExternalCss:1];
  [v9 startElement:"head"];
  [v9 startElement:"link"];
  [v9 setAttribute:"rel" value:"stylesheet"];
  [v9 setAttribute:"type" value:"text/css"];
  [v9 setAttribute:"href" cfStringValue:self->mCssUri];
  [v9 endElement];
  id v4 = [(GQSDocument *)self->super.mProcessorState filename];
  if (v4)
  {
    BOOL v5 = v4;
    [v9 startElement:"title"];
    [v9 addContent:v5];
    [v9 endElement];
  }
  [v9 endElement];
  [v9 startElement:"frameset"];
  CFStringRef v6 = CFStringCreateWithFormat(0, 0, @"%d, *", 170);
  [v9 setAttribute:"cols" cfStringValue:v6];
  CFRelease(v6);
  [v9 startElement:"frame"];
  id v7 = [(GQSDocument *)self->super.mProcessorState outputBundle];
  id v8 = [v7 createUriForResource:off_9D1E0];
  [v9 setAttribute:"src" cfStringValue:v8];
  CFRelease(v8);
  [v9 setAttribute:"name" value:"navPane"];
  [v9 endElement];
  [v9 startElement:"frame"];
  [v9 setAttribute:"src" cfStringValue:self->mCurrentSheetUri];
  [v9 setAttribute:"name" value:"sheetPane"];
  [v9 endElement];
  [v9 endElement];
  objc_msgSend(v9, "writeToOutputBundle:isThumbnail:", -[GQSDocument outputBundle](self->super.mProcessorState, "outputBundle"), -[GQSDocument isGeneratingThumbnail](self->super.mProcessorState, "isGeneratingThumbnail"));
}

- (BOOL)writeIndexPageWithIFrame:(id)a3
{
  id v4 = [[GQHXML alloc] initEmptyWithFilename:@"index.html" useExternalCss:1];
  self->mIndedouble x = v4;
  [(GQHXML *)v4 startElement:"head"];
  [(GQHXML *)self->mIndex startElement:"link"];
  [(GQHXML *)self->mIndex setAttribute:"rel" value:"stylesheet"];
  [(GQHXML *)self->mIndex setAttribute:"type" value:"text/css"];
  -[GQHXML setAttribute:cfStringValue:](self->mIndex, "setAttribute:cfStringValue:");
  [(GQHXML *)self->mIndex endElement];
  BOOL v5 = [(GQSDocument *)self->super.mProcessorState filename];
  if (v5)
  {
    CFStringRef v6 = v5;
    [(GQHXML *)self->mIndex startElement:"title"];
    [(GQHXML *)self->mIndex addContent:v6];
    [(GQHXML *)self->mIndex endElement];
  }
  [(GQHXML *)self->mIndex addMetaTagWithTextFormat:@"UTF-8"];
  [(GQHLassoState *)self writeTabsJS];
  [(GQHXML *)self->mIndex startElement:"link"];
  [(GQHXML *)self->mIndex setAttribute:"rel" value:"stylesheet"];
  [(GQHXML *)self->mIndex setAttribute:"type" value:"text/css"];
  [(GQHXML *)self->mIndex startElement:"style"];
  [(GQHLassoState *)self maxCanvasPoint];
  if ((int)v7) {
    int v8 = (int)v7;
  }
  else {
    int v8 = 900;
  }
  CFStringRef v9 = CFStringCreateWithFormat(0, 0, @"body {margin: 0;}\n.navpane-sheet {display:inline-block; padding-left:%dpx; width:%d; height:%d; font-size:20; font-family:\"Helvetica\"; color:black; text-decoration:none; line-height: 1; white-space: nowrap; overflow:hidden; text-overflow:ellipsis; background-color: RGB(210,216,226); cursor: pointer;}\n.navpane-sheet:hover {text-overflow:visible;}\n.navpane-sheet.selected {background-color:RGB(156,172,198);}\nimg {vertical-align: middle;}\n",
         4,
         170,
         30);
  [(GQHXML *)self->mIndex addContent:v9];
  CFRelease(v9);
  [(GQHXML *)self->mIndex endElement];
  [(GQHXML *)self->mIndex endElement];
  [(GQHXML *)self->mIndex endElement];
  [(GQHXML *)self->mIndex startElement:"body"];
  [(GQHXML *)self->mIndex startElement:"div"];
  [(GQHXML *)self->mIndex setAttribute:"id" cfStringValue:@"wrapper"];
  int Count = CFArrayGetCount(self->mSheetFilenameList);
  int v11 = Count;
  float v12 = (float)v8 / 170.0;
  float v13 = ceilf(v12);
  if (v12 <= (float)(int)v12)
  {
    int v14 = v8;
  }
  else
  {
    float v12 = v13;
    int v14 = (int)(float)(v13 * 170.0);
  }
  CFStringRef v15 = CFStringCreateWithFormat(0, 0, @"position:absolute; top:%d; left:0; right:0;",
          30 * vcvtps_s32_f32((float)Count / v12) + 2);
  [(GQHXML *)self->mIndex setAttribute:"style" cfStringValue:v15];
  CFRelease(v15);
  [(GQHXML *)self->mIndex startElement:"iframe"];
  [(GQHXML *)self->mIndex setAttribute:"id" cfStringValue:@"SheetFrame"];
  [(GQHXML *)self->mIndex setAttribute:"src" cfStringValue:CFArrayGetValueAtIndex(self->mSheetUriList, 0)];
  [(GQHXML *)self->mIndex setAttribute:"style" cfStringValue:@"border:0; width:100%; height:100%;"];
  [(GQHXML *)self->mIndex setAttribute:"name" value:"sheetPane"];
  [(GQHXML *)self->mIndex endElement];
  [(GQHXML *)self->mIndex endElement];
  if (v11 >= 1)
  {
    if (CFArrayGetCount(self->mSheetUriList) < 1)
    {
      uint64_t v17 = 0;
      uint64_t v16 = 0;
    }
    else
    {
      uint64_t v16 = 0;
      uint64_t v17 = 0;
      uint64_t v18 = 1;
      do
      {
        ValueAtIndedouble x = CFArrayGetValueAtIndex(self->mSheetFilenameList, 0);
        v20 = CFArrayGetValueAtIndex(self->mSheetUriList, 0);
        [(GQHXML *)self->mIndex startElement:"div"];
        CFStringRef v21 = CFStringCreateWithFormat(0, 0, @"javascript:SelectSheet(%d, '%@');", v18, v20);
        [(GQHXML *)self->mIndex setAttribute:"onclick" cfStringValue:v21];
        CFRelease(v21);
        CFStringRef v22 = CFStringCreateWithFormat(0, 0, @"Tab%d", v18);
        [(GQHXML *)self->mIndex setAttribute:"id" cfStringValue:v22];
        CFRelease(v22);
        [(GQHXML *)self->mIndex setAttribute:"href" value:"#"];
        [(GQHXML *)self->mIndex setAttribute:"title" cfStringValue:ValueAtIndex];
        if (v18 == 1) {
          v23 = "navpane-sheet selected";
        }
        else {
          v23 = "navpane-sheet";
        }
        [(GQHXML *)self->mIndex setAttribute:"class" value:v23];
        CFStringRef v24 = CFStringCreateWithFormat(0, 0, @"position:absolute; overflow:hidden; top:%d; left:%d;",
                v17,
                v16);
        [(GQHXML *)self->mIndex setAttribute:"style" cfStringValue:v24];
        CFRelease(v24);
        [(GQHXML *)self->mIndex startElement:"span"];
        [(GQHXML *)self->mIndex startElement:"img"];
        [(GQHXML *)self->mIndex setAttribute:"src" cfStringValue:[(GQSDocument *)self->super.mProcessorState uriForBundleResource:@"sl-icon_sheet" ofType:@"tiff"]];
        [(GQHXML *)self->mIndex setAttribute:"width" intValue:35];
        [(GQHXML *)self->mIndex endElement];
        [(GQHXML *)self->mIndex endElement];
        [(GQHXML *)self->mIndex startElement:"span"];
        CFStringRef v25 = CFStringCreateWithFormat(0, 0, @"text-overflow: ellipsis; display: inline-block; overflow: hidden; white-space: nowrap; width: %d; padding-left: 2px;",
                131);
        [(GQHXML *)self->mIndex setAttribute:"style" cfStringValue:v25];
        CFRelease(v25);
        [(GQHXML *)self->mIndex addContent:ValueAtIndex];
        [(GQHXML *)self->mIndex endElement];
        [(GQHXML *)self->mIndex endElement];
        int v26 = v16 + 170;
        if ((int)v16 + 170 >= v14) {
          uint64_t v16 = 0;
        }
        else {
          uint64_t v16 = v26;
        }
        if (v26 >= v14) {
          uint64_t v17 = (v17 + 29);
        }
        else {
          uint64_t v17 = v17;
        }
        CFArrayRemoveValueAtIndex(self->mSheetFilenameList, 0);
        CFArrayRemoveValueAtIndex(self->mSheetUriList, 0);
        uint64_t v18 = (v18 + 1);
      }
      while (CFArrayGetCount(self->mSheetUriList) > 0);
    }
    if ((int)v16 >= 1 && (int)v16 < v14)
    {
      do
      {
        [(GQHXML *)self->mIndex startElement:"div"];
        [(GQHXML *)self->mIndex setAttribute:"class" value:"navpane-sheet"];
        CFStringRef v27 = CFStringCreateWithFormat(0, 0, @"position:absolute; overflow:hidden;  top:%d; left:%d; width:%d; height:%d;",
                v17,
                v16,
                170,
                30);
        [(GQHXML *)self->mIndex setAttribute:"style" cfStringValue:v27];
        CFRelease(v27);
        [(GQHXML *)self->mIndex endElement];
        uint64_t v16 = (v16 + 170);
      }
      while ((int)v16 < v14);
    }
  }
  [(GQHXML *)self->mIndex endElement];
  mIndedouble x = self->mIndex;
  id v29 = [(GQSDocument *)self->super.mProcessorState outputBundle];
  BOOL v30 = [(GQSDocument *)self->super.mProcessorState isGeneratingThumbnail];
  return [(GQHXML *)mIndex writeToOutputBundle:v29 isThumbnail:v30];
}

- (void)writeNavigationPage:(id)a3
{
  BOOL v5 = [GQHXML alloc];
  self->mNavigation = -[GQHXML initWithFilename:documentSize:outputBundle:useExternalCss:](v5, "initWithFilename:documentSize:outputBundle:useExternalCss:", off_9D1E0, 0, [a3 outputBundle], 1);
  BOOL mIsProgressiveMode = self->mIsProgressiveMode;
  id v7 = [a3 outputBundle];
  int v8 = [(GQHXML *)self->mNavigation cssFilename];
  if (mIsProgressiveMode) {
    [v7 setData:0 mimeType:@"text/css" forNamedResource:v8];
  }
  else {
    self->mCssUri = (__CFString *)[v7 createUriForResource:v8];
  }
  [(GQHXML *)self->mNavigation startElement:"script"];
  [(GQHXML *)self->mNavigation setAttribute:"type" value:"text/javascript"];
  mCurrentSheetUri = self->mCurrentSheetUri;
  if (mCurrentSheetUri)
  {
    CFRetain(mCurrentSheetUri);
    v10 = self->mCurrentSheetUri;
  }
  else
  {
    v10 = (__CFString *)objc_msgSend(objc_msgSend(a3, "outputBundle"), "createUriForResource:", @"sheet_1.html");
  }
  CFStringRef v11 = CFStringCreateWithFormat(0, 0, @"var currentSheetUri = '%@';\nfunction gotoSheet(sheet)\n{\n    if (sheet != currentSheetUri)\n    {\n        parent.frames['sheetPane'].location = sheet;\n        document.getElementById(currentSheetUri).className = '';\n        document.getElementById(sheet).className = 'navpane-activesheet';\n        currentSheetUri = sheet;\n    }\n}\n",
          v10);
  CFRelease(v10);
  [(GQHXML *)self->mNavigation addContent:v11];
  CFRelease(v11);
  [(GQHXML *)self->mNavigation endElement];
  [(GQHXML *)self->mNavigation startElement:"link"];
  [(GQHXML *)self->mNavigation setAttribute:"rel" value:"stylesheet"];
  [(GQHXML *)self->mNavigation setAttribute:"type" value:"text/css"];
  [(GQHXML *)self->mNavigation startElement:"style"];
  [(GQHXML *)self->mNavigation addContent:@"body {background-color: RGB(210,216,226); margin: 0;}\na {font-size: 11; font-family: \"Lucida Grande\"; color: black; text-decoration:none; line-height: 1.8; white-space: nowrap;}\ndiv.navpane-activesheet {background-color: RGB(156,172,198);}\ndiv {padding-left: 10px; overflow:hidden; text-overflow:ellipsis;}\na.navpane-table {padding-left:26px;}\nimg {vertical-align: middle;}\n"];
  CFRelease(@"body {background-color: RGB(210,216,226); margin: 0;}\na {font-size: 11; font-family: \"Lucida Grande\"; color: black; text-decoration:none; line-height: 1.8; white-space: nowrap;}\ndiv.navpane-activesheet {background-color: RGB(156,172,198);}\ndiv {padding-left: 10px; overflow:hidden; text-overflow:ellipsis;}\na.navpane-table {padding-left:26px;}\nimg {vertical-align: middle;}\n");
  [(GQHXML *)self->mNavigation endElement];
  [(GQHXML *)self->mNavigation endElement];
  [(GQHXML *)self->mNavigation startElement:"body"];
  [(GQHXML *)self->mNavigation setAttribute:"id" value:"body"];
  +[GQHTextBox createExternalWrapSandbagStyles:self->mNavigation];
  if (self->mIsProgressiveMode)
  {
    [(GQHLassoState *)self writeAnchorInNavigationPage:self->mFirstWorkspaceName];
    float v12 = [(GQHXML *)self->mNavigation createProgressiveHtml];
    id v13 = [(GQSDocument *)self->super.mProcessorState outputBundle];
    [v13 appendData:v12 mimeType:@"text/html" resourceName:off_9D1E0];
    CFRelease(v12);
  }
}

- (BOOL)inProgressiveMode
{
  return self->mIsProgressiveMode;
}

- (__CFString)writeTabsJS
{
  mIndedouble x = self->mIndex;
  [(GQHXML *)mIndex startElement:"script"];
  [(GQHXML *)mIndex setAttribute:"type" value:"text/javascript"];
  [(GQHXML *)mIndex addContent:@"Element.prototype.addClassName = function addClassName(className){\n    if (!this.hasClassName(className))\n        this.className += ' ' + className;\n};\n\n"];
  [(GQHXML *)mIndex addContent:@"Element.prototype.removeClassName = function removeClassName(className){\n    // Test for the simple case before using a RegExp.\n    if (this.className === className)\n        this.className = \"\";\n    else\n        this.removeMatchingClassNames(className.escapeForRegExp());\n};\n\n"];
  [(GQHXML *)mIndex addContent:@"Element.prototype.removeMatchingClassNames = function removeMatchingClassNames(classNameRegex){\n    var regedouble x = new RegExp(\"(^|\\\\s+)\" + classNameRegex + \"($|\\\\s+)\");\n    if (regex.test(this.className))\n        this.className = this.className.replace(regex, \" \");\n};\n\n"];
  [(GQHXML *)mIndex addContent:@"Element.prototype.hasClassName = function hasClassName(className){\n    if (!className)\n        return false;\n    if (this.className === className)\n        return true;\n    var regedouble x = new RegExp(\"(^|\\\\s)\" + className.escapeForRegExp() + \"($|\\\\s)\");\n    return regex.test(this.className);\n};\n\n"];
  [(GQHXML *)mIndex addContent:@"String.prototype.escapeForRegExp = function escapeForRegExp(){\n    return this.escapeCharacters(\"^[]{}()\\.$*+?|\");\n};\n\n"];
  [(GQHXML *)mIndex addContent:@"String.prototype.escapeCharacters = function escapeCharacters(chars){\n    var foundChar = false;\n    for (var i = 0; i < chars.length; ++i) {\n        if (this.indexOf(chars.charAt(i)) !== -1) {\n            foundChar = true;\n            break;\n        }\n    }\n\n    if (!foundChar)\n        return this;\n\n    var CGPoint result = \"\";\n    for (var j = 0; j < this.length; ++j) {\n        if (chars.indexOf(this.charAt(j)) !== -1)\n            result += \"\\\\\";\n        result += this.charAt(j);\n    }\n\n    return result;\n};\n\n"];
  [(GQHXML *)mIndex addContent:@"var _tabChanged = false;\nfunction SelectSheet(sheetNumber, sheetURL){\n    _tabChanged = true;\n    var children = document.getElementsByClassName('navpane-sheet');\n    for (var i=0; i < children.length; i++) {\n        var child = children[i];\n        var elementName = child.id;\n        if (elementName == (\"Tab\"+sheetNumber)) {\n            child.addClassName(\"selected\");\n            document.getElementById('SheetFrame').src = sheetURL;\n        } else if (elementName !== \"Wrapper\") {\n            child.removeClassName(\"selected\");\n        }\n    }\n}\n\n"];
  [(GQHXML *)mIndex addContent:@"function ReloadFirstSheetIfNeeded(sheetURL)\n{\n    if (_tabChanged == false) {\n        SelectSheet(0, sheetURL);\n    }\n}\n\n"];
  [(GQHXML *)mIndex endElement];
  return 0;
}

@end