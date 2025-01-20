@interface WebPDFViewPlaceholder
+ (Class)_representationClassForWebFrame:(id)a3;
+ (id)supportedMIMETypes;
+ (void)setAsPDFDocRepAndView;
- (BOOL)canProvideDocumentSource;
- (BOOL)didCompleteLayout;
- (CGPDFDocument)document;
- (CGRect)_getPDFPageBounds:(CGPDFPage *)a3;
- (CGRect)rectForPageNumber:(unint64_t)a3;
- (CGSize)_computePageRects:(CGPDFDocument *)a3;
- (CGSize)containerSize;
- (NSArray)pageRects;
- (NSArray)pageYOrigins;
- (NSString)title;
- (WebPDFViewPlaceholderDelegate)delegate;
- (id)documentSource;
- (unint64_t)totalPages;
- (void)_doPostLoadOrUnlockTasks;
- (void)_evaluateJSForDocument:(CGPDFDocument *)a3;
- (void)_notifyDidCompleteLayout;
- (void)_updateTitleForDocumentIfAvailable;
- (void)_updateTitleForURL:(id)a3;
- (void)clearDocument;
- (void)dataSourceUpdated:(id)a3;
- (void)dealloc;
- (void)finishedLoadingWithDataSource:(id)a3;
- (void)layout;
- (void)setContainerSize:(CGSize)a3;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDocument:(CGPDFDocument *)a3;
- (void)setPageRects:(id)a3;
- (void)setPageYOrigins:(id)a3;
- (void)setTitle:(id)a3;
- (void)simulateClickOnLinkToURL:(id)a3;
@end

@implementation WebPDFViewPlaceholder

- (CGPDFDocument)document
{
  objc_sync_enter(self);
  document = self->_document;
  objc_sync_exit(self);
  if (document) {
    return document;
  }
  [(WebPDFViewPlaceholder *)self delegate];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  v5 = [(WebPDFViewPlaceholder *)self delegate];
  return (CGPDFDocument *)[(WebPDFViewPlaceholderDelegate *)v5 cgPDFDocument];
}

- (void)setDocument:(CGPDFDocument *)a3
{
  objc_sync_enter(self);
  CGPDFDocumentRetain(a3);
  CGPDFDocumentRelease(self->_document);
  self->_document = a3;
  objc_sync_exit(self);
}

- (void)clearDocument
{
}

- (unint64_t)totalPages
{
  v2 = [(WebPDFViewPlaceholder *)self document];
  return CGPDFDocumentGetNumberOfPages(v2);
}

+ (void)setAsPDFDocRepAndView
{
  +[WebView _setPDFRepresentationClass:objc_opt_class()];
  uint64_t v2 = objc_opt_class();
  +[WebView _setPDFViewClass:v2];
}

+ (Class)_representationClassForWebFrame:(id)a3
{
  return +[WebPDFView _representationClassForWebFrame:a3];
}

- (void)dealloc
{
  [(WebPDFViewPlaceholder *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [(WebPDFViewPlaceholderDelegate *)[(WebPDFViewPlaceholder *)self delegate] viewWillClose];
  }
  [(WebPDFViewPlaceholder *)self setTitle:0];
  [(WebPDFViewPlaceholder *)self setPageRects:0];
  [(WebPDFViewPlaceholder *)self setPageYOrigins:0];
  [(WebPDFViewPlaceholder *)self setDocument:0];
  v3.receiver = self;
  v3.super_class = (Class)WebPDFViewPlaceholder;
  [(WebPDFViewPlaceholder *)&v3 dealloc];
}

+ (id)supportedMIMETypes
{
  return +[WebPDFView supportedMIMETypes];
}

- (void)setDataSource:(id)a3
{
  -[WebPDFViewPlaceholder dataSourceUpdated:](self, "dataSourceUpdated:");
  if ([a3 request]) {
    -[WebPDFViewPlaceholder _updateTitleForURL:](self, "_updateTitleForURL:", objc_msgSend((id)objc_msgSend(a3, "request"), "URL"));
  }
  v5 = (void *)[(WebPDFViewPlaceholder *)self superview];
  if (v5)
  {
    v6 = v5;
    [v5 bounds];
    -[WebPDFViewPlaceholder convertRect:fromView:](self, "convertRect:fromView:", v6);
    -[WebPDFViewPlaceholder setBoundsSize:](self, "setBoundsSize:", v7, v8);
  }
}

- (void)_notifyDidCompleteLayout
{
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    [(WebPDFViewPlaceholder *)self delegate];
    if (objc_opt_respondsToSelector())
    {
      objc_super v3 = [(WebPDFViewPlaceholder *)self delegate];
      [(WebPDFViewPlaceholderDelegate *)v3 didCompleteLayout];
    }
  }
  else
  {
    [(WebPDFViewPlaceholder *)self performSelectorOnMainThread:sel__notifyDidCompleteLayout withObject:0 waitUntilDone:0];
  }
}

- (void)dataSourceUpdated:(id)a3
{
}

- (void)layout
{
  if (self->_didFinishLoad && ![(WebPDFViewPlaceholder *)self pageRects])
  {
    [(WebPDFViewPlaceholder *)self _computePageRects:self->_document];
    -[WebPDFViewPlaceholder setBoundsSize:](self, "setBoundsSize:");
    self->_didCompleteLayout = 1;
    [(WebPDFViewPlaceholder *)self _notifyDidCompleteLayout];
  }
}

- (void)_doPostLoadOrUnlockTasks
{
  if (self->_document)
  {
    [(WebPDFViewPlaceholder *)self _updateTitleForDocumentIfAvailable];
    [(WebPDFViewPlaceholder *)self _evaluateJSForDocument:self->_document];
    [(WebPDFViewPlaceholder *)self layout];
  }
}

- (void)finishedLoadingWithDataSource:(id)a3
{
  -[WebPDFViewPlaceholder dataSourceUpdated:](self, "dataSourceUpdated:");
  self->_didFinishLoad = 1;
  v5 = CGDataProviderCreateWithCFData((CFDataRef)[a3 data]);
  if (v5)
  {
    v6 = v5;
    self->_document = CGPDFDocumentCreateWithProvider(v5);
    [(WebPDFViewPlaceholder *)self _doPostLoadOrUnlockTasks];
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

- (void)_evaluateJSForDocument:(CGPDFDocument *)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    if (CGPDFDocumentIsUnlocked(a3))
    {
      v5 = allScriptsInPDFDocument(a3);
      if ([v5 count])
      {
        v6 = JSGlobalContextCreate(0);
        id Weak = objc_loadWeak((id *)&self->_dataSource);
        {
          double v8 = (OpaqueJSClass *)jsPDFDocClass(void)::jsPDFDocClass;
        }
        else
        {
          double v8 = JSClassCreate(&jsPDFDocClass(void)::jsPDFDocClassDefinition);
          jsPDFDocClass(void)::jsPDFDocClass = (uint64_t)v8;
        }
        v9 = JSObjectMake(v6, v8, Weak);
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        uint64_t v10 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
        if (v10)
        {
          uint64_t v11 = *(void *)v21;
          do
          {
            for (uint64_t i = 0; i != v10; ++i)
            {
              if (*(void *)v21 != v11) {
                objc_enumerationMutation(v5);
              }
              MEMORY[0x1E4E442D0](&v18, *(void *)(*((void *)&v20 + 1) + 8 * i));
              OpaqueJSString::tryCreate();
              JSEvaluateScript(v6, script, v9, 0, 0, 0);
              v14 = (unsigned int *)script;
              JSStringRef script = 0;
              if (v14 && atomic_fetch_add((atomic_uint *volatile)v14, 0xFFFFFFFF) == 1)
              {
                atomic_store(1u, v14);
                OpaqueJSString::~OpaqueJSString((OpaqueJSString *)v14);
                WTF::fastFree(v16, v17);
                v15 = v18;
                v18 = 0;
                if (!v15) {
                  continue;
                }
              }
              else
              {
                v15 = v18;
                v18 = 0;
                if (!v15) {
                  continue;
                }
              }
              if (*(_DWORD *)v15 == 2) {
                WTF::StringImpl::destroy(v15, v13);
              }
              else {
                *(_DWORD *)v15 -= 2;
              }
            }
            uint64_t v10 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
          }
          while (v10);
        }
        JSGlobalContextRelease(v6);
      }
    }
  }
}

- (void)_updateTitleForURL:(id)a3
{
  v5 = (void *)[a3 lastPathComponent];
  if (![v5 length] || objc_msgSend(v5, "isEqualToString:", @"/")) {
    v5 = objc_msgSend((id)objc_msgSend(a3, "_web_hostString"), "_webkit_decodeHostName");
  }
  [(WebPDFViewPlaceholder *)self setTitle:v5];
  id v6 = [(WAKView *)self _frame];
  [v6 _dispatchDidReceiveTitle:v5];
}

- (void)_updateTitleForDocumentIfAvailable
{
  document = self->_document;
  if (document)
  {
    if (CGPDFDocumentIsUnlocked(document))
    {
      Info = CGPDFDocumentGetInfo(self->_document);
      CGPDFStringRef value = 0;
      if (CGPDFDictionaryGetString(Info, "Title", &value))
      {
        CFStringRef v5 = CGPDFStringCopyTextString(value);
        if (v5)
        {
          CFStringRef v6 = v5;
          if (CFStringGetLength(v5))
          {
            [(WebPDFViewPlaceholder *)self setTitle:v6];
            objc_msgSend(-[WAKView _frame](self, "_frame"), "_dispatchDidReceiveTitle:", v6);
          }
          CFRelease(v6);
        }
      }
    }
  }
}

- (CGRect)_getPDFPageBounds:(CGPDFPage *)a3
{
  if (a3)
  {
    CGRect BoxRect = CGPDFPageGetBoxRect(a3, kCGPDFCropBox);
    double x = BoxRect.origin.x;
    double y = BoxRect.origin.y;
    double width = BoxRect.size.width;
    double height = BoxRect.size.height;
    double v8 = (double)CGPDFPageGetRotationAngle(a3) * 0.0174532925;
    if (v8 != 0.0)
    {
      CGAffineTransformMakeRotation(&v17, v8);
      v19.origin.double x = x;
      v19.origin.double y = y;
      v19.size.double width = width;
      v19.size.double height = height;
      CGRect v20 = CGRectApplyAffineTransform(v19, &v17);
      double x = v20.origin.x;
      double y = v20.origin.y;
      double width = v20.size.width;
      double height = v20.size.height;
    }
    float v9 = x;
    double v10 = roundf(v9);
    float v11 = y;
    double v12 = roundf(v11);
    float v13 = width;
    double v14 = roundf(v13);
    float v15 = height;
    double v16 = roundf(v15);
  }
  else
  {
    double v10 = *MEMORY[0x1E4F1DB28];
    double v12 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v14 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v16 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  result.size.double height = v16;
  result.size.double width = v14;
  result.origin.double y = v12;
  result.origin.double x = v10;
  return result;
}

- (CGSize)_computePageRects:(CGPDFDocument *)a3
{
  if ([(WebPDFViewPlaceholder *)self pageRects])
  {
    [(WebPDFViewPlaceholder *)self bounds];
    double v6 = v5;
    double v8 = v7;
LABEL_10:
    double v19 = v6;
    double v20 = v8;
    goto LABEL_29;
  }
  if (!a3
    || !CGPDFDocumentIsUnlocked(a3)
    || (size_t NumberOfPages = CGPDFDocumentGetNumberOfPages(a3)) == 0
    || (size_t v10 = NumberOfPages, (v11 = [MEMORY[0x1E4F1CA48] array]) == 0)
    || (double v12 = (void *)v11, (v13 = [MEMORY[0x1E4F1CA48] array]) == 0))
  {
    double v6 = *MEMORY[0x1E4F1DB30];
    double v8 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    goto LABEL_10;
  }
  double v14 = (void *)v13;
  size_t v15 = 0;
  double v16 = 0;
  unsigned int v17 = 0;
  v53 = 0;
  uint64_t v54 = 0;
  double v18 = 0.0;
  while (1)
  {
    CGPDFPageRef Page = CGPDFDocumentGetPage(a3, v15 + 1);
    if (!Page) {
      break;
    }
    -[WebPDFViewPlaceholder _getPDFPageBounds:](self, "_getPDFPageBounds:", Page, 0, 0, 0, 0);
    *(void *)&long long v51 = v27;
    *((void *)&v51 + 1) = v28;
    *(double *)&long long v52 = v26;
    *((void *)&v52 + 1) = v29;
    if (v18 < v26) {
      double v18 = v26;
    }
    if (v17 == v54)
    {
      v30 = (_OWORD *)WTF::Vector<CGRect,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::expandCapacity<(WTF::FailureAction)0>((uint64_t)&v53, v17 + 1, (unint64_t)&v51);
      int v31 = HIDWORD(v54);
      double v16 = v53;
      v32 = (_OWORD *)((char *)v53 + 32 * HIDWORD(v54));
      long long v33 = v30[1];
      _OWORD *v32 = *v30;
      v32[1] = v33;
      unsigned int v17 = v31 + 1;
      HIDWORD(v54) = v17;
      size_t v34 = v15 + 2;
      ++v15;
      if (v34 > v10)
      {
LABEL_17:
        size_t v15 = v10;
        break;
      }
    }
    else
    {
      long long v21 = v52;
      long long v22 = (_OWORD *)((char *)v16 + 32 * v17);
      *long long v22 = v51;
      v22[1] = v21;
      HIDWORD(v54) = ++v17;
      size_t v23 = v15 + 2;
      ++v15;
      if (v23 > v10) {
        goto LABEL_17;
      }
    }
  }
  if (!v15)
  {
    double v6 = *MEMORY[0x1E4F1DB30];
    double v8 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    if (v16)
    {
LABEL_27:
      v53 = 0;
      LODWORD(v54) = 0;
      WTF::fastFree(v16, v24);
    }
    goto LABEL_10;
  }
  uint64_t v35 = 0;
  double width = self->_containerSize.width;
  double v20 = width / v18;
  if (width >= 0.00000011920929) {
    double v37 = width / v18;
  }
  else {
    double v37 = 1.0;
  }
  double v19 = v18 + 16.0;
  double v38 = (v18 + 16.0) * v37;
  uint64_t v39 = 32 * v17;
  double v40 = 8.0;
  while (v39 != v35)
  {
    float v41 = v37 * *(double *)((char *)v16 + v35 + 16);
    CGFloat v42 = roundf(v41);
    float v43 = v37 * *(double *)((char *)v16 + v35 + 24);
    CGFloat v44 = roundf(v43);
    float v45 = (v38 - v42) * 0.5;
    CGFloat v46 = roundf(v45);
    objc_msgSend(v12, "addObject:", objc_msgSend(MEMORY[0x1E4F29238], "_web_valueWithCGRect:", Page, v46, v40, v42, v44));
    v47 = NSNumber;
    v56.origin.double x = v46;
    v56.origin.double y = v40;
    v56.size.double width = v42;
    v56.size.double height = v44;
    CGFloat MinY = CGRectGetMinY(v56);
    *(float *)&CGFloat MinY = MinY;
    objc_msgSend(v14, "addObject:", objc_msgSend(v47, "numberWithFloat:", MinY));
    double v19 = v44 + 8.0;
    double v40 = v40 + v44 + 8.0;
    v35 += 32;
    if (!--v15)
    {
      [(WebPDFViewPlaceholder *)self setPageRects:v12];
      [(WebPDFViewPlaceholder *)self setPageYOrigins:v14];
      float v49 = v38;
      double v6 = roundf(v49);
      float v50 = v40;
      double v8 = roundf(v50);
      goto LABEL_27;
    }
  }
  __break(0xC471u);
LABEL_29:
  result.double height = v20;
  result.double width = v19;
  return result;
}

- (CGRect)rectForPageNumber:(unint64_t)a3
{
  if (a3 && [(NSArray *)self->_pageRects count] >= a3)
  {
    objc_msgSend(-[NSArray objectAtIndex:](self->_pageRects, "objectAtIndex:", a3 - 1), "_web_CGRectValue");
  }
  else
  {
    double v5 = *MEMORY[0x1E4F1DB20];
    double v6 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double v7 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double v8 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  }
  result.size.double height = v8;
  result.size.double width = v7;
  result.origin.double y = v6;
  result.origin.double x = v5;
  return result;
}

- (void)simulateClickOnLinkToURL:(id)a3
{
  if (a3)
  {
    v4 = self;
    uint64_t v5 = *(void *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 736);
    if (!v5 || (double v6 = *(WebPDFViewPlaceholder **)(v5 + 96)) == 0)
    {
      self = (WebPDFViewPlaceholder *)WebCore::threadGlobalDataSlow((WebCore *)self);
      double v6 = self;
    }
    if (!v6->super.viewContext.willRemoveSubviewCallback) {
      self = (WebPDFViewPlaceholder *)WebCore::ThreadGlobalData::initializeEventNames((WebCore::ThreadGlobalData *)v6);
    }
    WTF::MonotonicTime::now((WTF::MonotonicTime *)self);
    uint64_t v39 = 0;
    uint64_t v40 = 0;
    v37[0] = 0;
    v37[1] = 0;
    v25[0] = 0;
    v25[1] = 0;
    LOWORD(v24) = 257;
    LOBYTE(v23) = 0;
    WORD1(v22) = 0;
    LOBYTE(v22) = 0;
    WebCore::MouseEvent::create();
    v36[0] = 0;
    uint64_t v7 = objc_msgSend(objc_loadWeak((id *)&v4->_dataSource), "webFrame", 0, v22, 0, v23, v37, v25, v24);
    if (v7) {
      uint64_t v8 = *(void *)(*(void *)(v7 + 8) + 8);
    }
    else {
      uint64_t v8 = 0;
    }
    uint64_t v9 = *(void *)(v8 + 296);
    *(_DWORD *)(v9 + 28) += 2;
    uint64_t v40 = v9;
    uint64_t v10 = WebCore::SecurityContext::securityOrigin((WebCore::SecurityContext *)(v9 + 208));
    MEMORY[0x1E4E441F0](v36, a3);
    WebCore::ResourceRequestBase::RequestData::RequestData((uint64_t)v25, (uint64_t)v36, 0);
    uint64_t v27 = 0;
    uint64_t v11 = (_DWORD *)*MEMORY[0x1E4F30980];
    if (*MEMORY[0x1E4F30980]) {
      *v11 += 2;
    }
    uint64_t v28 = v11;
    uint64_t v29 = 0;
    char v30 = 0;
    char v31 = 0;
    char v32 = v32 & 0xE0 | 5;
    v26 |= 2u;
    uint64_t v33 = 0;
    uint64_t v39 = 0;
    uint64_t v35 = 0;
    MEMORY[0x1E4E46080](v37, &v40, v10, v25, &v39, 1, &v35);
    uint64_t v13 = v35;
    uint64_t v35 = 0;
    if (v13)
    {
      if (*(_DWORD *)v13 == 2)
      {
        WTF::StringImpl::destroy(v13, v12);
        double v14 = v39;
        uint64_t v39 = 0;
        if (!v14) {
          goto LABEL_20;
        }
LABEL_18:
        if (*(_DWORD *)v14 == 2)
        {
          WTF::StringImpl::destroy(v14, v12);
          WebCore::ResourceRequest::~ResourceRequest((WebCore::ResourceRequest *)v25, v17);
          double v16 = v36[0];
          v36[0] = 0;
          if (!v16) {
            goto LABEL_25;
          }
LABEL_23:
          if (*(_DWORD *)v16 == 2)
          {
            WTF::StringImpl::destroy(v16, v15);
            uint64_t v18 = v40;
            uint64_t v40 = 0;
            if (!v18) {
              goto LABEL_32;
            }
LABEL_28:
            if (*(_DWORD *)(v18 + 28) == 2)
            {
              if ((*(_WORD *)(v18 + 34) & 0x400) == 0) {
                WebCore::Node::removedLastRef((WebCore::Node *)v18);
              }
            }
            else
            {
              *(_DWORD *)(v18 + 28) -= 2;
            }
LABEL_32:
            char v38 = 1;
            v36[0] = 0;
            LOBYTE(v25[0]) = 0;
            char v34 = 0;
            WebCore::FrameLoader::loadFrameRequest();
            if (v34) {
              WebCore::PrivateClickMeasurement::~PrivateClickMeasurement((WebCore::PrivateClickMeasurement *)v25, v19);
            }
            double v20 = v36[0];
            v36[0] = 0;
            if (v20)
            {
              if (*((_DWORD *)v20 + 6) == 1)
              {
                (*(void (**)(WTF::StringImpl *))(*(void *)v20 + 24))(v20);
                MEMORY[0x1E4E460A0](v37);
                long long v21 = v41;
                float v41 = 0;
                if (!v21) {
                  return;
                }
                goto LABEL_38;
              }
              --*((_DWORD *)v20 + 6);
            }
            MEMORY[0x1E4E460A0](v37);
            long long v21 = v41;
            float v41 = 0;
            if (!v21) {
              return;
            }
LABEL_38:
            if (v21[4] == 1) {
              (*(void (**)(_DWORD *))(*(void *)v21 + 8))(v21);
            }
            else {
              --v21[4];
            }
            return;
          }
          *(_DWORD *)v16 -= 2;
LABEL_25:
          uint64_t v18 = v40;
          uint64_t v40 = 0;
          if (!v18) {
            goto LABEL_32;
          }
          goto LABEL_28;
        }
        *(_DWORD *)v14 -= 2;
LABEL_20:
        WebCore::ResourceRequest::~ResourceRequest((WebCore::ResourceRequest *)v25, v12);
        double v16 = v36[0];
        v36[0] = 0;
        if (!v16) {
          goto LABEL_25;
        }
        goto LABEL_23;
      }
      *(_DWORD *)v13 -= 2;
    }
    double v14 = v39;
    uint64_t v39 = 0;
    if (!v14) {
      goto LABEL_20;
    }
    goto LABEL_18;
  }
}

- (WebPDFViewPlaceholderDelegate)delegate
{
  return (WebPDFViewPlaceholderDelegate *)objc_loadWeak((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (NSArray)pageRects
{
  return (NSArray *)objc_getProperty(self, a2, 88, 1);
}

- (void)setPageRects:(id)a3
{
}

- (NSArray)pageYOrigins
{
  return (NSArray *)objc_getProperty(self, a2, 96, 1);
}

- (void)setPageYOrigins:(id)a3
{
}

- (NSString)title
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (void)setTitle:(id)a3
{
}

- (CGSize)containerSize
{
  objc_copyStruct(v4, &self->_containerSize, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.double height = v3;
  result.double width = v2;
  return result;
}

- (void)setContainerSize:(CGSize)a3
{
  CGSize v3 = a3;
  objc_copyStruct(&self->_containerSize, &v3, 16, 1, 0);
}

- (BOOL)didCompleteLayout
{
  return self->_didCompleteLayout;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
}

@end