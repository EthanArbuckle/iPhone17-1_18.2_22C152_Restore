@interface WebPDFView
+ (CGColor)backgroundColor;
+ (CGColor)shadowColor;
+ (Class)_representationClassForWebFrame:(id)a3;
+ (id)supportedMIMETypes;
- (BOOL)canProvideDocumentSource;
- (CGPDFDocument)doc;
- (CGRect)rectForPageNumber:(unsigned int)a3;
- (id).cxx_construct;
- (id)_pagesInRect:(CGRect)a3;
- (id)documentSource;
- (id)title;
- (unsigned)pageNumberForRect:(CGRect)a3;
- (unsigned)totalPages;
- (void)_checkPDFTitle;
- (void)_computePageRects;
- (void)dealloc;
- (void)drawPage:(CGPDFPage *)a3;
- (void)drawRect:(CGRect)a3;
- (void)finishedLoadingWithDataSource:(id)a3;
- (void)layout;
- (void)setDataSource:(id)a3;
@end

@implementation WebPDFView

+ (id)supportedMIMETypes
{
  return &unk_1F3C9CAA8;
}

+ (CGColor)shadowColor
{
  if (_MergedGlobals_5 == 1) {
    return (CGColor *)qword_1EAD80198;
  }
  createCGColorWithDeviceWhite(0.0, 0.666666667, &v3);
  result = v3;
  qword_1EAD80198 = (uint64_t)v3;
  _MergedGlobals_5 = 1;
  return result;
}

+ (CGColor)backgroundColor
{
  if (byte_1EAD80191 == 1) {
    return (CGColor *)qword_1EAD801A0;
  }
  createCGColorWithDeviceWhite(0.8, 1.0, &v3);
  result = v3;
  qword_1EAD801A0 = (uint64_t)v3;
  byte_1EAD80191 = 1;
  return result;
}

+ (Class)_representationClassForWebFrame:(id)a3
{
  objc_msgSend((id)objc_msgSend(a3, "webView"), "mainFrame");
  return (Class)objc_opt_class();
}

- (void)dealloc
{
  PDFDocument = self->_PDFDocument;
  if (PDFDocument) {
    CGPDFDocumentRelease(PDFDocument);
  }
  free(self->_pageRects);
  v4.receiver = self;
  v4.super_class = (Class)WebPDFView;
  [(WebPDFView *)&v4 dealloc];
}

- (void)drawPage:(CGPDFPage *)a3
{
  v5 = (CGContext *)WKGetCurrentGraphicsContext();
  v6 = &self->_pageRects[CGPDFPageGetPageNumber(a3)];
  CGFloat x = v6[-1].origin.x;
  CGFloat y = v6[-1].origin.y;
  CGFloat width = v6[-1].size.width;
  CGFloat height = v6[-1].size.height;
  CGContextSaveGState(v5);
  v11 = (CGColor *)[(id)objc_opt_class() shadowColor];
  v20.CGFloat width = 0.0;
  v20.CGFloat height = 2.0;
  CGContextSetShadowWithColor(v5, v20, 3.0, v11);
  uint64_t v18 = 0x11040000FFFFFFFFLL;
  WebCore::cachedCGColor();
  CGContextSetFillColorWithColor(v5, color);
  CGColorRef v12 = color;
  CGColorRef color = 0;
  if (v12) {
    CFRelease(v12);
  }
  v21.origin.CGFloat x = x;
  v21.origin.CGFloat y = y;
  v21.size.CGFloat width = width;
  v21.size.CGFloat height = height;
  CGContextFillRect(v5, v21);
  CGContextRestoreGState(v5);
  CGContextSaveGState(v5);
  v22.origin.CGFloat x = x;
  v22.origin.CGFloat y = y;
  v22.size.CGFloat width = width;
  v22.size.CGFloat height = height;
  CGFloat MinX = CGRectGetMinX(v22);
  v23.origin.CGFloat x = x;
  v23.origin.CGFloat y = y;
  v23.size.CGFloat width = width;
  v23.size.CGFloat height = height;
  CGFloat MinY = CGRectGetMinY(v23);
  CGContextTranslateCTM(v5, MinX, MinY);
  CGContextScaleCTM(v5, 1.0, -1.0);
  v24.origin.CGFloat x = x;
  v24.origin.CGFloat y = y;
  v24.size.CGFloat width = width;
  v24.size.CGFloat height = height;
  CGFloat v15 = CGRectGetHeight(v24);
  CGContextTranslateCTM(v5, 0.0, -v15);
  v25.origin.CGFloat x = x;
  v25.origin.CGFloat y = y;
  v25.size.CGFloat width = width;
  v25.size.CGFloat height = height;
  CGFloat v16 = CGRectGetWidth(v25);
  v26.origin.CGFloat x = x;
  v26.origin.CGFloat y = y;
  v26.size.CGFloat width = width;
  v26.size.CGFloat height = height;
  v27.size.CGFloat height = CGRectGetHeight(v26);
  v27.origin.CGFloat x = 0.0;
  v27.origin.CGFloat y = 0.0;
  v27.size.CGFloat width = v16;
  CGPDFPageGetDrawingTransform(&v17, a3, kCGPDFCropBox, v27, 0, 1);
  CGContextConcatCTM(v5, &v17);
  CGRect BoxRect = CGPDFPageGetBoxRect(a3, kCGPDFCropBox);
  CGContextClipToRect(v5, BoxRect);
  CGContextDrawPDFPage(v5, a3);
  CGContextRestoreGState(v5);
}

- (id)_pagesInRect:(CGRect)a3
{
  CGRect v16 = a3;
  objc_super v4 = (void *)[MEMORY[0x1E4F1CA48] array];
  unint64_t NumberOfPages = CGPDFDocumentGetNumberOfPages(self->_PDFDocument);
  v6 = bsearch(&v16, self->_pageRects, NumberOfPages, 0x20uLL, (int (__cdecl *)(const void *, const void *))comparePageRects);
  if (v6)
  {
    size_t v7 = (int64_t)((uint64_t)v6 - (unint64_t)self->_pageRects) >> 5;
    unint64_t v8 = v7 + 1;
    CGPDFPageRef Page = CGPDFDocumentGetPage(self->_PDFDocument, v7 + 1);
    if (Page)
    {
      [v4 addObject:Page];
      size_t v10 = v7;
      if (v7 - 1 < NumberOfPages)
      {
        size_t v11 = v7;
        do
        {
          CGRect v17 = CGRectInset(self->_pageRects[v11 - 1], 0.0, -16.0);
          if (!CGRectIntersectsRect(v17, v16)) {
            break;
          }
          CGPDFPageRef v13 = CGPDFDocumentGetPage(self->_PDFDocument, v7);
          if (v13) {
            [v4 addObject:v13];
          }
          unint64_t v12 = v7 - 2;
          --v7;
          --v11;
        }
        while (v12 < NumberOfPages);
      }
      if (v8 < NumberOfPages)
      {
        do
        {
          CGRect v18 = CGRectInset(self->_pageRects[v10 + 1], 0.0, -16.0);
          if (!CGRectIntersectsRect(v18, v16)) {
            break;
          }
          CGPDFPageRef v15 = CGPDFDocumentGetPage(self->_PDFDocument, ++v8);
          if (v15) {
            [v4 addObject:v15];
          }
          ++v10;
        }
        while (NumberOfPages != v8);
      }
    }
  }
  return v4;
}

- (void)drawRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  unint64_t v8 = (CGContext *)WKGetCurrentGraphicsContext();
  CGContextSaveGState(v8);
  v9 = (CGColor *)[(id)objc_opt_class() backgroundColor];
  CGContextSetFillColorWithColor(v8, v9);
  v13.origin.double x = x;
  v13.origin.double y = y;
  v13.size.double width = width;
  v13.size.double height = height;
  CGContextFillRect(v8, v13);
  CGContextRestoreGState(v8);
  if (self->_PDFDocument)
  {
    size_t v10 = objc_msgSend(-[WebPDFView _pagesInRect:](self, "_pagesInRect:", x, y, width, height), "objectEnumerator");
    uint64_t v11 = [v10 nextObject];
    if (v11)
    {
      uint64_t v12 = v11;
      do
      {
        [(WebPDFView *)self drawPage:v12];
        uint64_t v12 = [v10 nextObject];
      }
      while (v12);
    }
  }
}

- (void)setDataSource:(id)a3
{
  if (!self->dataSourceHasBeenSet)
  {
    if (!self->_title.m_ptr)
    {
      objc_super v4 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "request"), "URL"), "lastPathComponent"), "copy");
      m_ptr = self->_title.m_ptr;
      self->_title.m_ptr = v4;
      if (m_ptr) {
        CFRelease(m_ptr);
      }
    }
    v6 = (void *)[(WebPDFView *)self superview];
    if (v6)
    {
      size_t v7 = v6;
      [v6 bounds];
      -[WebPDFView convertRect:fromView:](self, "convertRect:fromView:", v7);
      -[WebPDFView setBoundsSize:](self, "setBoundsSize:", v8, v9);
      self->dataSourceHasBeenSet = 1;
    }
  }
}

- (void)layout
{
}

- (void)_computePageRects
{
  size_t NumberOfPages = CGPDFDocumentGetNumberOfPages(self->_PDFDocument);
  self->_pageRects = (CGRect *)malloc_type_malloc(32 * NumberOfPages, 0x1000040E0EAB150uLL);
  if (NumberOfPages)
  {
    uint64_t v4 = 0;
    double v5 = 0.0;
    size_t v6 = 1;
    double v7 = 8.0;
    do
    {
      CGPDFPageRef Page = CGPDFDocumentGetPage(self->_PDFDocument, v6);
      CGRect BoxRect = CGPDFPageGetBoxRect(Page, kCGPDFCropBox);
      CGFloat x = BoxRect.origin.x;
      CGFloat y = BoxRect.origin.y;
      double width = BoxRect.size.width;
      double height = BoxRect.size.height;
      double v14 = (double)CGPDFPageGetRotationAngle(Page) * 0.0174532925;
      if (v14 != 0.0)
      {
        CGAffineTransformMakeRotation(&v25, v14);
        v28.origin.CGFloat x = x;
        v28.origin.CGFloat y = y;
        v28.size.double width = width;
        v28.size.double height = height;
        CGRect v29 = CGRectApplyAffineTransform(v28, &v25);
        CGFloat x = v29.origin.x;
        *(float *)&v29.origin.CGFloat x = v29.size.width;
        double width = roundf(*(float *)&v29.origin.x);
        *(float *)&v29.origin.CGFloat x = v29.size.height;
        double height = roundf(*(float *)&v29.origin.x);
      }
      double v8 = &self->_pageRects[v4];
      v8->size.double width = width;
      v8->size.double height = height;
      v8->origin.CGFloat x = x;
      v8->origin.CGFloat y = v7;
      double v7 = v7 + height + 8.0;
      if (v5 < width) {
        double v5 = width;
      }
      ++v6;
      ++v4;
    }
    while (v6 <= NumberOfPages);
    double v15 = v5 + 16.0;
    -[WebPDFView setBoundsSize:](self, "setBoundsSize:", v5 + 16.0, v7);
    pageRects = self->_pageRects;
    if (NumberOfPages < 2)
    {
      unint64_t v17 = 0;
LABEL_16:
      size_t v22 = NumberOfPages - v17;
      p_double width = &pageRects[v17].size.width;
      do
      {
        float v24 = (v15 - *p_width) * 0.5;
        *(p_width - 2) = roundf(v24);
        p_width += 4;
        --v22;
      }
      while (v22);
      return;
    }
    unint64_t v17 = NumberOfPages & 0xFFFFFFFFFFFFFFFELL;
    p_CGFloat x = &pageRects[1].origin.x;
    unint64_t v19 = NumberOfPages & 0xFFFFFFFFFFFFFFFELL;
    do
    {
      float v20 = (v15 - *(p_x - 2)) * 0.5;
      float v21 = (v15 - p_x[2]) * 0.5;
      *(p_x - 4) = roundf(v20);
      *p_CGFloat x = roundf(v21);
      p_x += 8;
      v19 -= 2;
    }
    while (v19);
    if (NumberOfPages != v17) {
      goto LABEL_16;
    }
  }
  else
  {
    -[WebPDFView setBoundsSize:](self, "setBoundsSize:", 16.0, 8.0);
  }
}

- (void)_checkPDFTitle
{
  PDFDocument = self->_PDFDocument;
  if (PDFDocument)
  {
    Info = CGPDFDocumentGetInfo(PDFDocument);
    CGPDFStringRef value = 0;
    if (CGPDFDictionaryGetString(Info, "Title", &value))
    {
      CFStringRef v5 = CGPDFStringCopyTextString(value);
      if (v5)
      {
        size_t v6 = (__CFString *)v5;
        if (CFStringGetLength(v5))
        {
          CFRetain(v6);
          m_ptr = self->_title.m_ptr;
          self->_title.m_ptr = v6;
          if (m_ptr) {
            CFRelease(m_ptr);
          }
          uint64_t v8 = *(void *)(*(void *)(*(void *)(*(void *)([(WAKView *)self _frame] + 8) + 8) + 280)
                         + 16);
          MEMORY[0x1E4E442D0](&v11, self->_title.m_ptr);
          char v12 = 0;
          (*(void (**)(uint64_t, WTF::StringImpl **))(*(void *)v8 + 296))(v8, &v11);
          size_t v10 = v11;
          uint64_t v11 = 0;
          if (v10)
          {
            if (*(_DWORD *)v10 == 2) {
              WTF::StringImpl::destroy(v10, v9);
            }
            else {
              *(_DWORD *)v10 -= 2;
            }
          }
        }
        CFRelease(v6);
      }
    }
  }
}

- (void)finishedLoadingWithDataSource:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  CFStringRef v5 = CGDataProviderCreateWithCFData((CFDataRef)[a3 data]);
  if (v5)
  {
    size_t v6 = v5;
    double v7 = CGPDFDocumentCreateWithProvider(v5);
    self->_PDFDocument = v7;
    if (v7)
    {
      [(WebPDFView *)self _checkPDFTitle];
      [(WebPDFView *)self _computePageRects];
      uint64_t v8 = allScriptsInPDFDocument(self->_PDFDocument);
      if ([v8 count])
      {
        double v9 = JSGlobalContextCreate(0);
        {
          size_t v10 = (OpaqueJSClass *)jsPDFDocClass(void)::jsPDFDocClass;
        }
        else
        {
          size_t v10 = JSClassCreate(&jsPDFDocClass(void)::jsPDFDocClassDefinition);
          jsPDFDocClass(void)::jsPDFDocClass = (uint64_t)v10;
        }
        uint64_t v11 = JSObjectMake(v9, v10, a3);
        long long v24 = 0u;
        long long v25 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        uint64_t v12 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
        if (v12)
        {
          uint64_t v13 = *(void *)v23;
          do
          {
            for (uint64_t i = 0; i != v12; ++i)
            {
              if (*(void *)v23 != v13) {
                objc_enumerationMutation(v8);
              }
              MEMORY[0x1E4E442D0](&v20, *(void *)(*((void *)&v22 + 1) + 8 * i));
              OpaqueJSString::tryCreate();
              JSEvaluateScript(v9, script, v11, 0, 0, 0);
              CGRect v16 = (unsigned int *)script;
              JSStringRef script = 0;
              if (v16 && atomic_fetch_add((atomic_uint *volatile)v16, 0xFFFFFFFF) == 1)
              {
                atomic_store(1u, v16);
                OpaqueJSString::~OpaqueJSString((OpaqueJSString *)v16);
                WTF::fastFree(v18, v19);
                unint64_t v17 = v20;
                float v20 = 0;
                if (!v17) {
                  continue;
                }
              }
              else
              {
                unint64_t v17 = v20;
                float v20 = 0;
                if (!v17) {
                  continue;
                }
              }
              if (*(_DWORD *)v17 == 2) {
                WTF::StringImpl::destroy(v17, v15);
              }
              else {
                *(_DWORD *)v17 -= 2;
              }
            }
            uint64_t v12 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
          }
          while (v12);
        }
        JSGlobalContextRelease(v9);
        [(WebPDFView *)self setNeedsDisplay:1];
      }
    }
    CFRelease(v6);
  }
}

- (BOOL)canProvideDocumentSource
{
  return 0;
}

- (id)documentSource
{
  return 0;
}

- (id)title
{
  return self->_title.m_ptr;
}

- (unsigned)pageNumberForRect:(CGRect)a3
{
  if (!self->_PDFDocument) {
    return 0;
  }
  if (!self->_pageRects) {
    return 0;
  }
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v8 = -[WebPDFView _pagesInRect:](self, "_pagesInRect:");
  uint64_t v9 = [v8 count];
  if (!v9) {
    return 0;
  }
  uint64_t v10 = v9;
  unsigned int v11 = 0;
  uint64_t v12 = 0;
  float v13 = 0.0;
  do
  {
    size_t PageNumber = CGPDFPageGetPageNumber((CGPDFPageRef)[v8 objectAtIndex:v12]);
    v17.origin.CGFloat x = x;
    v17.origin.CGFloat y = y;
    v17.size.CGFloat width = width;
    v17.size.CGFloat height = height;
    CGRect v16 = CGRectIntersection(self->_pageRects[PageNumber - 1], v17);
    *(float *)&v16.origin.CGFloat x = v16.size.width * v16.size.height;
    if (v13 < *(float *)&v16.origin.x)
    {
      float v13 = v16.size.width * v16.size.height;
      unsigned int v11 = PageNumber;
    }
    ++v12;
  }
  while (v10 != v12);
  return v11;
}

- (unsigned)totalPages
{
  PDFDocument = self->_PDFDocument;
  if (PDFDocument) {
    LODWORD(PDFDocument) = CGPDFDocumentGetNumberOfPages(PDFDocument);
  }
  return PDFDocument;
}

- (CGPDFDocument)doc
{
  return self->_PDFDocument;
}

- (CGRect)rectForPageNumber:(unsigned int)a3
{
  pageRects = self->_pageRects;
  BOOL v4 = pageRects != 0;
  p_CGFloat x = &pageRects[a3 - 1].origin.x;
  if (a3 == 0 || !v4) {
    p_CGFloat x = (double *)MEMORY[0x1E4F1DB20];
  }
  double v6 = *p_x;
  double v7 = p_x[1];
  double v8 = p_x[2];
  double v9 = p_x[3];
  result.size.CGFloat height = v9;
  result.size.CGFloat width = v8;
  result.origin.CGFloat y = v7;
  result.origin.CGFloat x = v6;
  return result;
}

- (void).cxx_destruct
{
  m_ptr = self->_title.m_ptr;
  self->_title.m_ptr = 0;
  if (m_ptr) {
    CFRelease(m_ptr);
  }
}

- (id).cxx_construct
{
  *((void *)self + 12) = 0;
  return self;
}

@end