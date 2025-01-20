@interface GQHXML
- (BOOL)isProgressive;
- (BOOL)writeToOutputBundle:(id)a3 isThumbnail:(BOOL)a4;
- (GQHXML)initWithFilename:(__CFString *)a3 documentSize:(CGSize *)a4 outputBundle:(id)a5 useExternalCss:(BOOL)a6;
- (__CFData)createProgressiveHtml;
- (__CFData)createProgressiveeCSSwithStyleTags:(unsigned __int8)a3;
- (__CFString)cssFilename;
- (id)initEmptyWithFilename:(__CFString *)a3 useExternalCss:(BOOL)a4;
- (void)addCharRef:(const char *)a3;
- (void)addContent:(__CFString *)a3;
- (void)addMetaTagWithTextFormat:(__CFString *)a3;
- (void)addStyleClass:(__CFString *)a3;
- (void)addStyleClassLast:(__CFString *)a3;
- (void)addViewportMetaTagForDocumentSize:(CGSize)a3;
- (void)addViewportMetaTagForDocumentSize:(CGSize)a3 maximumScale:(float)a4;
- (void)addXmlCharContent:(const char *)a3;
- (void)dealloc;
- (void)endElement;
- (void)endElementWithExpectedName:(const char *)a3;
- (void)setAttribute:(const char *)a3 cfStringValue:(__CFString *)a4;
- (void)setAttribute:(const char *)a3 floatValue:(float)a4;
- (void)setAttribute:(const char *)a3 intValue:(int)a4;
- (void)setAttribute:(const char *)a3 value:(const char *)a4;
- (void)startElement:(const char *)a3;
@end

@implementation GQHXML

- (id)initEmptyWithFilename:(__CFString *)a3 useExternalCss:(BOOL)a4
{
  BOOL v4 = a4;
  v10.receiver = self;
  v10.super_class = (Class)GQHXML;
  v6 = [(GQHXML *)&v10 init];
  v7 = v6;
  if (v6)
  {
    v6->mFilename = a3;
    CFRetain(a3);
    v8 = off_80088;
    v7->mUseExternalCss = v4;
    if (!v4) {
      v8 = off_80068;
    }
    v7->mOutput = (GQHXMLOutput *)[objc_alloc(*v8) initEmpty];
    v7->isProgressive = 0;
  }
  return v7;
}

- (GQHXML)initWithFilename:(__CFString *)a3 documentSize:(CGSize *)a4 outputBundle:(id)a5 useExternalCss:(BOOL)a6
{
  BOOL v6 = a6;
  v17.receiver = self;
  v17.super_class = (Class)GQHXML;
  objc_super v10 = [(GQHXML *)&v17 init];
  if (v10)
  {
    objc_opt_class();
    v10->isProgressive = objc_opt_isKindOfClass() & 1;
    v10->mFilename = a3;
    CFRetain(a3);
    v11 = off_80088;
    v10->mUseExternalCss = v6;
    if (!v6) {
      v11 = off_80068;
    }
    v10->mOutput = (GQHXMLOutput *)[objc_alloc(*v11) initWithHead];
    v18.length = CFStringGetLength(v10->mFilename);
    v18.location = 0;
    if (CFStringFindWithOptions(v10->mFilename, @".", v18, 4uLL, &result))
    {
      v19.length = result.location;
      v19.location = 0;
      CFStringRef v12 = CFStringCreateWithSubstring(0, v10->mFilename, v19);
      v10->CFStringRef mCssFilename = (__CFString *)CFStringCreateWithFormat(0, 0, @"%@.css", v12);
      CFRelease(v12);
      CFStringRef mCssFilename = v10->mCssFilename;
    }
    else
    {
      CFStringRef mCssFilename = CFStringCreateWithFormat(0, 0, @"%@.css", v10->mFilename);
      v10->CFStringRef mCssFilename = (__CFString *)mCssFilename;
    }
    id v14 = [a5 createUriForResource:mCssFilename];
    [(GQHXML *)v10 startElement:"link"];
    [(GQHXML *)v10 setAttribute:"rel" value:"stylesheet"];
    [(GQHXML *)v10 setAttribute:"type" value:"text/css"];
    [(GQHXML *)v10 setAttribute:"href" cfStringValue:v14];
    [(GQHXML *)v10 endElement];
    CFRelease(v14);
    v10->mCss = CFStringCreateMutable(0, 0);
    v10->mLastCss = CFStringCreateMutable(0, 0);
    if (a4) {
      -[GQHXML addViewportMetaTagForDocumentSize:](v10, "addViewportMetaTagForDocumentSize:", a4->width, a4->height);
    }
  }
  return v10;
}

- (void)dealloc
{
  mCss = self->mCss;
  if (mCss)
  {
    CFRelease(mCss);
    self->mCss = 0;
  }
  mLastCss = self->mLastCss;
  if (mLastCss)
  {
    CFRelease(mLastCss);
    self->mLastCss = 0;
  }
  mFilename = self->mFilename;
  if (mFilename)
  {
    CFRelease(mFilename);
    self->mFilename = 0;
  }
  CFStringRef mCssFilename = self->mCssFilename;
  if (mCssFilename)
  {
    CFRelease(mCssFilename);
    self->CFStringRef mCssFilename = 0;
  }

  self->mOutput = 0;
  v7.receiver = self;
  v7.super_class = (Class)GQHXML;
  [(GQHXML *)&v7 dealloc];
}

- (void)startElement:(const char *)a3
{
}

- (void)endElement
{
}

- (void)endElementWithExpectedName:(const char *)a3
{
}

- (void)setAttribute:(const char *)a3 value:(const char *)a4
{
}

- (void)setAttribute:(const char *)a3 cfStringValue:(__CFString *)a4
{
  if (a4)
  {
    CStringPtr = CFStringGetCStringPtr(a4, 0x8000100u);
    if (!CStringPtr)
    {
      CFIndex Length = CFStringGetLength(a4);
      CFIndex v9 = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u) + 1;
      objc_super v10 = (char *)malloc_type_malloc(v9, 0x100004077774924uLL);
      CFStringGetCString(a4, v10, v9, 0x8000100u);
      [(GQHXMLOutput *)self->mOutput setAttribute:a3 value:v10];
      free(v10);
      return;
    }
  }
  else
  {
    CStringPtr = "";
  }
  mOutput = self->mOutput;
  [(GQHXMLOutput *)mOutput setAttribute:a3 value:CStringPtr];
}

- (void)setAttribute:(const char *)a3 intValue:(int)a4
{
  sub_43A60(a4, __str, 0x80uLL);
  [(GQHXML *)self setAttribute:a3 value:__str];
}

- (void)setAttribute:(const char *)a3 floatValue:(float)a4
{
  sub_439BC(v6, 0x80uLL, a4);
  [(GQHXML *)self setAttribute:a3 value:v6];
}

- (void)addContent:(__CFString *)a3
{
  CStringPtr = CFStringGetCStringPtr(a3, 0x8000100u);
  if (CStringPtr)
  {
    BOOL v6 = CStringPtr;
    mOutput = self->mOutput;
    [(GQHXMLOutput *)mOutput addXmlCharContent:v6];
  }
  else if (a3)
  {
    CFIndex Length = CFStringGetLength(a3);
    CFIndex v9 = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u) + 1;
    objc_super v10 = (char *)malloc_type_malloc(v9, 0x100004077774924uLL);
    CFStringGetCString(a3, v10, v9, 0x8000100u);
    [(GQHXMLOutput *)self->mOutput addXmlCharContent:v10];
    free(v10);
  }
}

- (void)addXmlCharContent:(const char *)a3
{
}

- (void)addCharRef:(const char *)a3
{
}

- (void)addStyleClass:(__CFString *)a3
{
}

- (void)addStyleClassLast:(__CFString *)a3
{
  mLastCss = self->mLastCss;
  if (mLastCss) {
    CFStringAppend(mLastCss, a3);
  }
}

- (__CFString)cssFilename
{
  return self->mCssFilename;
}

- (void)addMetaTagWithTextFormat:(__CFString *)a3
{
  [(GQHXML *)self startElement:"meta"];
  [(GQHXML *)self setAttribute:"http-equiv" value:"Content-type"];
  CFStringRef v5 = CFStringCreateWithFormat(0, 0, @"text/html; charset=%@", a3);
  [(GQHXML *)self setAttribute:"content" cfStringValue:v5];
  CFRelease(v5);
  [(GQHXML *)self endElementWithExpectedName:"meta"];
}

- (void)addViewportMetaTagForDocumentSize:(CGSize)a3
{
  CGFloat width = a3.width;
  -[GQHXML startElement:](self, "startElement:", "meta", a3.width, a3.height);
  [(GQHXML *)self setAttribute:"name" value:"viewport"];
  CFStringRef v5 = CFStringCreateWithFormat(0, 0, @"width=%f", *(void *)&width);
  [(GQHXML *)self setAttribute:"content" cfStringValue:v5];
  CFRelease(v5);
  [(GQHXML *)self endElement];
}

- (void)addViewportMetaTagForDocumentSize:(CGSize)a3 maximumScale:(float)a4
{
  CGFloat width = a3.width;
  -[GQHXML startElement:](self, "startElement:", "meta", a3.width, a3.height);
  [(GQHXML *)self setAttribute:"name" value:"viewport"];
  CFStringRef v7 = CFStringCreateWithFormat(0, 0, @"width=%f, maximum-scale=%f", *(void *)&width, a4);
  [(GQHXML *)self setAttribute:"content" cfStringValue:v7];
  CFRelease(v7);
  [(GQHXML *)self endElement];
}

- (BOOL)writeToOutputBundle:(id)a3 isThumbnail:(BOOL)a4
{
  if (self->isProgressive)
  {
    id v6 = [(GQHXMLOutput *)self->mOutput createProgressiveHtml];
    unsigned __int8 v7 = 1;
    v8 = [(GQHXML *)self createProgressiveeCSSwithStyleTags:1];
    [a3 setDataForMainHtmlResource:v8];
    [a3 setDataForMainHtmlResource:v6];
    CFRelease(v6);
    CFRelease(v8);
    [a3 closeAttachment:self->mCssFilename];
    return v7;
  }
  mCss = self->mCss;
  if (mCss) {
    CFStringAppend(mCss, self->mLastCss);
  }
  if (!self->mUseExternalCss)
  {
    id v12 = -[GQHXMLOutput createHtmlWithCss:](self->mOutput, "createHtmlWithCss:", self->mCss, a4);
    unsigned __int8 v7 = 0;
    if (!v12) {
      return v7;
    }
    goto LABEL_12;
  }
  objc_super v10 = self->mCss;
  if (v10)
  {
    CFDataRef ExternalRepresentation = CFStringCreateExternalRepresentation(0, v10, 0x8000100u, 0x30u);
    unsigned __int8 v7 = [a3 setData:ExternalRepresentation mimeType:@"text/css" forNamedResource:self->mCssFilename];
    CFRelease(ExternalRepresentation);
  }
  else
  {
    unsigned __int8 v7 = 0;
  }
  id v12 = [(GQHXMLOutput *)self->mOutput createHtml];
  if (v12)
  {
LABEL_12:
    if (CFStringCompare(self->mFilename, @"index.html", 0)) {
      unsigned __int8 v13 = [a3 setData:v12 mimeType:@"text/html" forNamedResource:self->mFilename];
    }
    else {
      unsigned __int8 v13 = [a3 setDataForMainHtmlResource:v12];
    }
    unsigned __int8 v7 = v13;
    CFRelease(v12);
  }
  return v7;
}

- (__CFData)createProgressiveHtml
{
  return (__CFData *)[(GQHXMLOutput *)self->mOutput createProgressiveHtml];
}

- (__CFData)createProgressiveeCSSwithStyleTags:(unsigned __int8)a3
{
  int v3 = a3;
  CFStringAppend(self->mCss, self->mLastCss);
  CFRelease(self->mLastCss);
  if (v3)
  {
    CFMutableStringRef Mutable = CFStringCreateMutable(0, 0);
    CFStringAppend(Mutable, @"<style type=\"text/css\">");
    CFStringAppend(Mutable, self->mCss);
    CFStringAppend(Mutable, @"</style>");
  }
  else
  {
    CFMutableStringRef Mutable = self->mCss;
  }
  CFDataRef ExternalRepresentation = CFStringCreateExternalRepresentation(0, Mutable, 0x8000100u, 0x30u);
  CFRelease(self->mCss);
  self->mCss = CFStringCreateMutable(0, 0);
  self->mLastCss = CFStringCreateMutable(0, 0);
  if (v3) {
    CFRelease(Mutable);
  }
  return ExternalRepresentation;
}

- (BOOL)isProgressive
{
  return self->isProgressive;
}

@end