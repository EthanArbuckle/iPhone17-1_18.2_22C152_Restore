@interface WebDataSource
+ (Class)_representationClassForMIMEType:(id)a3 allowingPlugins:(BOOL)a4;
+ (id)_repTypesAllowImageTypeOmission:(BOOL)a3;
+ (void)initialize;
- (BOOL)_isDocumentHTML;
- (BOOL)isLoading;
- (NSArray)subresources;
- (NSData)data;
- (NSDictionary)_quickLookContent;
- (NSMutableURLRequest)request;
- (NSString)pageTitle;
- (NSString)textEncodingName;
- (NSURL)unreachableURL;
- (NSURLRequest)initialRequest;
- (NSURLResponse)response;
- (NakedPtr<WebCore::DocumentLoader>)_documentLoader;
- (WebArchive)webArchive;
- (WebDataSource)initWithRequest:(NSURLRequest *)request;
- (WebFrame)webFrame;
- (WebResource)mainResource;
- (WebResource)subresourceForURL:(NSURL *)URL;
- (id)_URL;
- (id)_documentFragmentWithArchive:(id)a3;
- (id)_documentFragmentWithImageResource:(id)a3;
- (id)_imageElementWithImageResource:(id)a3;
- (id)_initWithDocumentLoader:(void *)a3;
- (id)_mainDocumentError;
- (id)_responseMIMEType;
- (id)_webView;
- (id)dataSourceDelegate;
- (id)representation;
- (void)_addSubframeArchives:(id)a3;
- (void)_finishedLoading;
- (void)_makeRepresentation;
- (void)_quickLookPreviewLoaderClient;
- (void)_receivedData:(id)a3;
- (void)_replaceSelectionWithArchive:(id)a3 selectReplacement:(BOOL)a4;
- (void)_revertToProvisionalState;
- (void)_setDeferMainResourceDataLoad:(BOOL)a3;
- (void)_setMainDocumentError:(id)a3;
- (void)_setOverrideTextEncodingName:(id)a3;
- (void)_setQuickLookContent:(id)a3;
- (void)_setQuickLookPreviewLoaderClient:(void *)a3;
- (void)_setRepresentation:(id)a3;
- (void)addSubresource:(WebResource *)subresource;
- (void)dealloc;
@end

@implementation WebDataSource

- (void)_setRepresentation:(id)a3
{
  v5 = self->_private;
  if (a3) {
    CFRetain(a3);
  }
  v6 = (const void *)v5[1];
  v5[1] = a3;
  if (v6) {
    CFRelease(v6);
  }
  *((unsigned char *)self->_private + 16) = 0;
}

+ (Class)_representationClassForMIMEType:(id)a3 allowingPlugins:(BOOL)a4
{
  v5 = 0;
  if (+[WebView _viewClass:0 andRepresentationClass:&v5 forMIMEType:a3 allowingPlugins:a4])
  {
    return v5;
  }
  else
  {
    return 0;
  }
}

+ (void)initialize
{
}

- (id)_mainDocumentError
{
}

- (void)_addSubframeArchives:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v4 = [a3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(a3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * v7) _coreLegacyWebArchive];
        WebCore::DocumentLoader::addAllArchiveResources();
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [a3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (id)_responseMIMEType
{
  v2 = [(WebDataSource *)self response];
  return [(NSURLResponse *)v2 MIMEType];
}

- (void)_setDeferMainResourceDataLoad:(BOOL)a3
{
  *(unsigned char *)(*(void *)self->_private + 3537) = a3;
}

- (void)_setOverrideTextEncodingName:(id)a3
{
  uint64_t v3 = *(void *)self->_private;
  MEMORY[0x1E4E442D0](&v7, a3);
  uint64_t v5 = v7;
  if (v7) {
    *(_DWORD *)v7 += 2;
  }
  uint64_t v6 = *(WTF::StringImpl **)(v3 + 1624);
  *(void *)(v3 + 1624) = v5;
  if (v6)
  {
    if (*(_DWORD *)v6 == 2)
    {
      WTF::StringImpl::destroy(v6, v4);
      uint64_t v5 = v7;
      uint64_t v7 = 0;
      if (!v5) {
        return;
      }
      goto LABEL_9;
    }
    *(_DWORD *)v6 -= 2;
  }
  uint64_t v7 = 0;
  if (!v5) {
    return;
  }
LABEL_9:
  if (*(_DWORD *)v5 == 2) {
    WTF::StringImpl::destroy(v5, v4);
  }
  else {
    *(_DWORD *)v5 -= 2;
  }
}

- (id)dataSourceDelegate
{
  return 0;
}

- (NSDictionary)_quickLookContent
{
  return (NSDictionary *)*((void *)self->_private + 4);
}

- (void)_finishedLoading
{
  *((unsigned char *)self->_private + 16) = 1;
  id v3 = [(WebDataSource *)self representation];
  [v3 finishedLoadingWithDataSource:self];
}

- (void)_receivedData:(id)a3
{
  if (self) {
    CFRetain(self);
  }
  objc_msgSend(-[WebDataSource representation](self, "representation"), "receivedData:withDataSource:", a3, self);
  [(NSView *)[(WebFrameView *)[(WebFrame *)[(WebDataSource *)self webFrame] frameView] documentView] dataSourceUpdated:self];
  if (self)
  {
    CFRelease(self);
  }
}

- (void)_setMainDocumentError:(id)a3
{
  id v3 = self->_private;
  if (!v3[16])
  {
    v3[16] = 1;
    id v6 = [(WebDataSource *)self representation];
    [v6 receivedError:a3 withDataSource:self];
  }
}

- (void)_revertToProvisionalState
{
}

+ (id)_repTypesAllowImageTypeOmission:(BOOL)a3
{
  if (_MergedGlobals_9 == 1)
  {
    uint64_t v4 = (void *)qword_1EB3A9680;
    if (byte_1EB3A9679) {
      return v4;
    }
  }
  else
  {
    +[WebDataSource(WebInternal) _repTypesAllowImageTypeOmission:]::$_3::operator()(&v10);
    uint64_t v4 = (void *)v10;
    qword_1EB3A9680 = v10;
    _MergedGlobals_9 = 1;
    if (byte_1EB3A9679) {
      return v4;
    }
  }
  if (!a3)
  {
    uint64_t v5 = objc_opt_class();
    id v6 = objc_msgSend(+[WebHTMLRepresentation supportedImageMIMETypes](WebHTMLRepresentation, "supportedImageMIMETypes"), "objectEnumerator");
    uint64_t v7 = [v6 nextObject];
    if (v7)
    {
      uint64_t v8 = v7;
      do
      {
        if (![v4 objectForKey:v8]) {
          [v4 setObject:v5 forKey:v8];
        }
        uint64_t v8 = [v6 nextObject];
      }
      while (v8);
    }
    byte_1EB3A9679 = 1;
    return (id)qword_1EB3A9680;
  }
  return v4;
}

- (void)_replaceSelectionWithArchive:(id)a3 selectReplacement:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [(WebDataSource *)self _documentFragmentWithArchive:a3];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = [(WebDataSource *)self webFrame];
    [(WebFrame *)v8 _replaceSelectionWithFragment:v7 selectReplacement:v4 smartReplace:0 matchStyle:0];
  }
}

- (id)_documentFragmentWithArchive:(id)a3
{
  uint64_t v5 = (void *)[a3 mainResource];
  id v6 = v5;
  if (!v5) {
    return v6;
  }
  uint64_t v7 = [v5 MIMEType];
  if (!+[WebView canShowMIMETypeAsHTML:v7])
  {
    MEMORY[0x1E4E442D0](&v14, v7);
    int isSupportedImageMIMEType = WebCore::MIMETypeRegistry::isSupportedImageMIMEType((WebCore::MIMETypeRegistry *)&v14, v9);
    v12 = v14;
    v14 = 0;
    if (v12)
    {
      if (*(_DWORD *)v12 == 2)
      {
        WTF::StringImpl::destroy(v12, v10);
        if (isSupportedImageMIMEType) {
          return [(WebDataSource *)self _documentFragmentWithImageResource:v6];
        }
        return 0;
      }
      *(_DWORD *)v12 -= 2;
    }
    if (isSupportedImageMIMEType) {
      return [(WebDataSource *)self _documentFragmentWithImageResource:v6];
    }
    return 0;
  }
  uint64_t v8 = (const void *)objc_msgSend([NSString alloc], "initWithData:encoding:", objc_msgSend(v6, "data"), 4);
  [a3 _coreLegacyWebArchive];
  WebCore::DocumentLoader::addAllArchiveResources();
  id v6 = -[WebFrame _documentFragmentWithMarkupString:baseURLString:](-[WebDataSource webFrame](self, "webFrame"), "_documentFragmentWithMarkupString:baseURLString:", v8, objc_msgSend((id)objc_msgSend(v6, "URL"), "_web_originalDataAsString"));
  if (v8) {
    CFRelease(v8);
  }
  return v6;
}

- (id)_documentFragmentWithImageResource:(id)a3
{
  id v4 = [(WebDataSource *)self _imageElementWithImageResource:a3];
  if (!v4) {
    return 0;
  }
  id v5 = v4;
  id v6 = [[(WebFrame *)[(WebDataSource *)self webFrame] DOMDocument] createDocumentFragment];
  [(DOMNode *)v6 appendChild:v5];
  return v6;
}

- (id)_imageElementWithImageResource:(id)a3
{
  if (!a3) {
    return 0;
  }
  -[WebDataSource addSubresource:](self, "addSubresource:");
  id v5 = [[(WebFrame *)[(WebDataSource *)self webFrame] DOMDocument] createElement:@"img"];
  id v6 = (void *)[a3 URL];
  if ([v6 isFileURL]) {
    uint64_t v7 = [v6 absoluteString];
  }
  else {
    uint64_t v7 = objc_msgSend(v6, "_web_originalDataAsString");
  }
  [(DOMElement *)v5 setAttribute:@"src" value:v7];
  return v5;
}

- (id)_URL
{
  uint64_t v2 = WebCore::ResourceRequestBase::url((WebCore::ResourceRequestBase *)(*(void *)self->_private + 872));
  if (!*(void *)v2 || !*(_DWORD *)(*(void *)v2 + 4)) {
    return 0;
  }
  return (id)WTF::URL::operator NSURL *();
}

- (id)_webView
{
  uint64_t v2 = [(WebDataSource *)self webFrame];
  return [(WebFrame *)v2 webView];
}

- (BOOL)_isDocumentHTML
{
  id v2 = [(WebDataSource *)self _responseMIMEType];
  return +[WebView canShowMIMETypeAsHTML:v2];
}

- (void)_makeRepresentation
{
  id v3 = (id)objc_msgSend((id)objc_opt_class(), "_representationClassForMIMEType:allowingPlugins:", -[WebDataSource _responseMIMEType](self, "_responseMIMEType"), 0);
  if (objc_opt_respondsToSelector()) {
    id v3 = (id)objc_msgSend(v3, "_representationClassForWebFrame:", -[WebDataSource webFrame](self, "webFrame"));
  }
  [(WebDataSource *)self representation];
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (v3) {
      id v3 = objc_alloc_init((Class)v3);
    }
    [(WebDataSource *)self _setRepresentation:v3];
    if (v3) {
      CFRelease(v3);
    }
  }
  [*((id *)self->_private + 1) setDataSource:self];
  id v4 = *(WebCore::DocumentLoader **)self->_private;
  MEMORY[0x1E4E442D0](&v7, [(WebDataSource *)self _responseMIMEType]);
  WebCore::DocumentLoader::setResponseMIMEType(v4, (const WTF::String *)&v7);
  id v6 = v7;
  uint64_t v7 = 0;
  if (v6)
  {
    if (*(_DWORD *)v6 == 2) {
      WTF::StringImpl::destroy(v6, v5);
    }
    else {
      *(_DWORD *)v6 -= 2;
    }
  }
}

- (NakedPtr<WebCore::DocumentLoader>)_documentLoader
{
  void *v2 = *(void *)self->_private;
  return (NakedPtr<WebCore::DocumentLoader>)self;
}

- (id)_initWithDocumentLoader:(void *)a3
{
  v4.receiver = self;
  v4.super_class = (Class)WebDataSource;
  if ([(WebDataSource *)&v4 init]) {
    operator new();
  }
  return 0;
}

- (void)_quickLookPreviewLoaderClient
{
  return (void *)*((void *)self->_private + 5);
}

- (void)_setQuickLookContent:(id)a3
{
  uint64_t v4 = [a3 copy];
  id v5 = self->_private;
  id v6 = (const void *)v5[4];
  v5[4] = v4;
  if (v6)
  {
    CFRelease(v6);
  }
}

- (void)_setQuickLookPreviewLoaderClient:(void *)a3
{
  id v3 = self->_private;
  if (a3) {
    ++*((_DWORD *)a3 + 2);
  }
  uint64_t v4 = (_DWORD *)v3[5];
  v3[5] = a3;
  if (v4)
  {
    if (v4[2] == 1) {
      (*(void (**)(void))(*(void *)v4 + 8))();
    }
    else {
      --v4[2];
    }
  }
}

- (WebDataSource)initWithRequest:(NSURLRequest *)request
{
  MEMORY[0x1E4E45D10](v12, request);
  uint64_t v11 = 0;
  memset(v10, 0, sizeof(v10));
  WebCore::SubstituteData::SubstituteData((WebCore::SubstituteData *)v10);
  uint64_t v4 = (WebDocumentLoaderMac *)WTF::fastMalloc((WTF *)0xE20);
  WebDocumentLoaderMac::WebDocumentLoaderMac(v4, (const WebCore::ResourceRequest *)v12, (const WebCore::SubstituteData *)v10);
  uint64_t v13 = v4;
  id v6 = [(WebDataSource *)self _initWithDocumentLoader:&v13];
  uint64_t v7 = v13;
  uint64_t v13 = 0;
  if (v7)
  {
    if (*((_DWORD *)v7 + 6) == 1) {
      (*(void (**)(WebDocumentLoaderMac *))(*(void *)v7 + 24))(v7);
    }
    else {
      --*((_DWORD *)v7 + 6);
    }
  }
  WebCore::SubstituteData::~SubstituteData((WebCore::SubstituteData *)v10, v5);
  WebCore::ResourceRequest::~ResourceRequest((WebCore::ResourceRequest *)v12, v8);
  return v6;
}

- (void)dealloc
{
  id v3 = (objc_class *)objc_opt_class();
  if ((WebCoreObjCScheduleDeallocateOnMainThread(v3, (objc_object *)self) & 1) == 0)
  {
    uint64_t v4 = self->_private;
    if (v4 && v4[17]) {
      --WebDataSourceCount;
    }
    id v5 = [(NSURLResponse *)[(WebDataSource *)self response] URL];
    if (v5) {
      WebCore::removeQLPreviewConverterForURL((WebCore *)v5, v6);
    }
    uint64_t v7 = self->_private;
    if (!v7) {
      goto LABEL_22;
    }
    *(void *)(*v7 + 3568) = 0;
    uint64_t v8 = (_DWORD *)v7[5];
    v7[5] = 0;
    if (v8)
    {
      if (v8[2] == 1)
      {
        (*(void (**)(_DWORD *))(*(void *)v8 + 8))(v8);
        long long v9 = (const void *)v7[4];
        v7[4] = 0;
        if (!v9) {
          goto LABEL_13;
        }
        goto LABEL_12;
      }
      --v8[2];
    }
    long long v9 = (const void *)v7[4];
    v7[4] = 0;
    if (!v9)
    {
LABEL_13:
      uint64_t v10 = (const void *)v7[1];
      v7[1] = 0;
      if (v10) {
        CFRelease(v10);
      }
      uint64_t v11 = (_DWORD *)*v7;
      *uint64_t v7 = 0;
      if (v11)
      {
        if (v11[6] == 1) {
          (*(void (**)(_DWORD *))(*(void *)v11 + 24))(v11);
        }
        else {
          --v11[6];
        }
      }
      MEMORY[0x1E4E4B240](v7, 0x10E0C4010F12D8CLL);
LABEL_22:
      v12.receiver = self;
      v12.super_class = (Class)WebDataSource;
      [(WebDataSource *)&v12 dealloc];
      return;
    }
LABEL_12:
    CFRelease(v9);
    goto LABEL_13;
  }
}

- (NSData)data
{
  WebCore::DocumentLoader::mainResourceData((uint64_t *)&v21, *(WebCore::DocumentLoader **)self->_private);
  if (!v21) {
    return 0;
  }
  WebCore::FragmentedSharedBuffer::makeContiguous((uint64_t *)&v19, v21);
  WebCore::SharedBuffer::createNSData((uint64_t *)&cf, v19);
  CFTypeRef v2 = cf;
  CFTypeRef cf = 0;
  uint64_t v4 = (id)CFMakeCollectable(v2);
  CFTypeRef v5 = cf;
  CFTypeRef cf = 0;
  if (v5) {
    CFRelease(v5);
  }
  WTF::Ref<WebCore::SharedBuffer,WTF::RawPtrTraits<WebCore::SharedBuffer>,WTF::DefaultRefDerefTraits<WebCore::SharedBuffer>>::~Ref(&v19, v3);
  uint64_t v7 = v21;
  v21 = 0;
  if (!v7 || atomic_fetch_add((atomic_uint *volatile)v7, 0xFFFFFFFF) != 1) {
    return v4;
  }
  atomic_store(1u, (unsigned int *)v7);
  uint64_t v9 = *((unsigned int *)v7 + 5);
  if (v9)
  {
    uint64_t v10 = 16 * v9;
    uint64_t v11 = (unsigned int **)(*((void *)v7 + 1) + 8);
    do
    {
      objc_super v12 = *v11;
      *uint64_t v11 = 0;
      if (v12 && atomic_fetch_add((atomic_uint *volatile)v12, 0xFFFFFFFF) == 1)
      {
        uint64_t v16 = v10;
        v17 = v11;
        atomic_store(1u, v12);
        v18 = (WTF *)v12;
        uint64_t v13 = v12[6];
        if (v13 != -1) {
          ((void (*)(CFTypeRef *, unsigned int *))off_1F3C7AB60[v13])(&cf, v12 + 2);
        }
        *((_DWORD *)v18 + 6) = -1;
        WTF::fastFree(v18, v6);
        uint64_t v10 = v16;
        uint64_t v11 = v17;
      }
      v11 += 2;
      v10 -= 16;
    }
    while (v10);
  }
  v14 = (WTF *)*((void *)v7 + 1);
  if ((WebCore::FragmentedSharedBuffer *)((char *)v7 + 24) != v14 && v14 != 0)
  {
    *((void *)v7 + 1) = 0;
    *((_DWORD *)v7 + 4) = 0;
    WTF::fastFree(v14, v6);
  }
  WTF::fastFree(v7, v6);
  return v4;
}

- (id)representation
{
  return (id)*((void *)self->_private + 1);
}

- (WebFrame)webFrame
{
  uint64_t v2 = *(void *)(*(void *)self->_private + 16);
  if (v2
    && (uint64_t v3 = *(void *)(v2 + 8)) != 0
    && (uint64_t v4 = *(WebFrame ***)(*(void *)(v3 + 280) + 16),
        (((uint64_t (*)(WebFrame **, SEL))(*v4)[67].super.isa)(v4, a2) & 1) == 0))
  {
    return v4[2];
  }
  else
  {
    return 0;
  }
}

- (NSURLRequest)initialRequest
{
  return (NSURLRequest *)WebCore::ResourceRequest::nsURLRequest();
}

- (NSMutableURLRequest)request
{
  uint64_t v2 = (WebCore::FrameLoader *)WebCore::DocumentLoader::frameLoader(*(WebCore::DocumentLoader **)self->_private);
  if (!v2 || !WebCore::FrameLoader::frameHasLoaded(v2)) {
    return 0;
  }
  return (NSMutableURLRequest *)WebCore::ResourceRequest::nsURLRequest();
}

- (NSURLResponse)response
{
  return (NSURLResponse *)WebCore::ResourceResponse::nsURLResponse((WebCore::ResourceResponse *)(*(void *)self->_private
                                                                                               + 1272));
}

- (NSString)textEncodingName
{
  if (!*(void *)(*(void *)self->_private + 1624)) {
    return (NSString *)&stru_1F3C7DA90;
  }
  result = (NSString *)WTF::StringImpl::operator NSString *();
  if (!result)
  {
    uint64_t v4 = [(WebDataSource *)self response];
    return [(NSURLResponse *)v4 textEncodingName];
  }
  return result;
}

- (BOOL)isLoading
{
  return MEMORY[0x1F41749B0](*(void *)self->_private, a2);
}

- (NSString)pageTitle
{
  id v2 = [(WebDataSource *)self representation];
  return (NSString *)[v2 title];
}

- (NSURL)unreachableURL
{
  uint64_t v2 = *(void *)(*(void *)self->_private + 368);
  if (v2 && *(_DWORD *)(v2 + 4)) {
    return (NSURL *)WTF::URL::operator NSURL *();
  }
  else {
    return 0;
  }
}

- (WebArchive)webArchive
{
  if (!*(unsigned char *)(*(void *)self->_private + 3539)) {
    return 0;
  }
  uint64_t v3 = [WebArchive alloc];
  uint64_t v4 = [(WebDataSource *)self webFrame];
  WebCore::LegacyWebArchive::create((uint64_t *)&v9, (WebCore::LegacyWebArchive *)v4->_private->coreFrame.m_ptr, v5);
  id v6 = (id)CFMakeCollectable([(WebArchive *)v3 _initWithCoreLegacyWebArchive:&v9]);
  uint64_t v7 = v9;
  uint64_t v9 = 0;
  if (!v7) {
    return v6;
  }
  if (v7[2] != 1)
  {
    --v7[2];
    return v6;
  }
  (*(void (**)(_DWORD *))(*(void *)v7 + 8))(v7);
  return v6;
}

- (WebResource)mainResource
{
  WebCore::DocumentLoader::mainResource((uint64_t *)&v8, *(WebCore::DocumentLoader **)self->_private);
  if (!v8) {
    return 0;
  }
  uint64_t v2 = [WebResource alloc];
  uint64_t v7 = (uint64_t)v8;
  uint64_t v8 = 0;
  uint64_t v3 = (id)CFMakeCollectable([(WebResource *)v2 _initWithCoreResource:&v7]);
  uint64_t v4 = (_DWORD *)v7;
  uint64_t v7 = 0;
  if (!v4) {
    goto LABEL_5;
  }
  if (v4[2] != 1)
  {
    --v4[2];
LABEL_5:
    CFTypeRef v5 = v8;
    uint64_t v8 = 0;
    if (!v5) {
      return v3;
    }
    goto LABEL_6;
  }
  (*(void (**)(_DWORD *))(*(void *)v4 + 8))(v4);
  CFTypeRef v5 = v8;
  uint64_t v8 = 0;
  if (!v5) {
    return v3;
  }
LABEL_6:
  if (v5[2] != 1)
  {
    --v5[2];
    return v3;
  }
  (*(void (**)(_DWORD *))(*(void *)v5 + 8))(v5);
  return v3;
}

- (NSArray)subresources
{
  WebCore::DocumentLoader::subresources((uint64_t *)&v14, *(WebCore::DocumentLoader **)self->_private);
  id v2 = objc_alloc(MEMORY[0x1E4F1CA48]);
  uint64_t v3 = (void *)[v2 initWithCapacity:v16];
  if (v16)
  {
    uint64_t v4 = v14;
    uint64_t v5 = 8 * v16;
    do
    {
      id v6 = [[WebResource alloc] _initWithCoreResource:v4];
      if (v6)
      {
        [v3 addObject:v6];
        CFRelease(v6);
      }
      uint64_t v4 = (WTF *)((char *)v4 + 8);
      v5 -= 8;
    }
    while (v5);
  }
  uint64_t v8 = (id)CFMakeCollectable(v3);
  if (v16)
  {
    uint64_t v9 = v14;
    uint64_t v10 = 8 * v16;
    do
    {
      uint64_t v11 = *(_DWORD **)v9;
      *(void *)uint64_t v9 = 0;
      if (v11)
      {
        if (v11[2] == 1) {
          (*(void (**)(_DWORD *))(*(void *)v11 + 8))(v11);
        }
        else {
          --v11[2];
        }
      }
      uint64_t v9 = (WTF *)((char *)v9 + 8);
      v10 -= 8;
    }
    while (v10);
  }
  objc_super v12 = v14;
  if (v14)
  {
    v14 = 0;
    int v15 = 0;
    WTF::fastFree(v12, v7);
  }
  return v8;
}

- (WebResource)subresourceForURL:(NSURL *)URL
{
  uint64_t v3 = *(WebCore::DocumentLoader **)self->_private;
  MEMORY[0x1E4E441F0](v11, URL);
  WebCore::DocumentLoader::subresource((uint64_t *)&v12, v3, (const WTF::URL *)v11);
  uint64_t v5 = v11[0];
  v11[0] = 0;
  if (!v5)
  {
LABEL_4:
    if (v12) {
      goto LABEL_5;
    }
    return 0;
  }
  if (*(_DWORD *)v5 != 2)
  {
    *(_DWORD *)v5 -= 2;
    goto LABEL_4;
  }
  WTF::StringImpl::destroy(v5, v4);
  if (!v12) {
    return 0;
  }
LABEL_5:
  id v6 = [WebResource alloc];
  v11[0] = v12;
  objc_super v12 = 0;
  uint64_t v7 = (id)CFMakeCollectable([(WebResource *)v6 _initWithCoreResource:v11]);
  uint64_t v8 = v11[0];
  v11[0] = 0;
  if (!v8) {
    goto LABEL_8;
  }
  if (*((_DWORD *)v8 + 2) != 1)
  {
    --*((_DWORD *)v8 + 2);
LABEL_8:
    uint64_t v9 = v12;
    objc_super v12 = 0;
    if (!v9) {
      return v7;
    }
    goto LABEL_9;
  }
  (*(void (**)(WTF::StringImpl *))(*(void *)v8 + 8))(v8);
  uint64_t v9 = v12;
  objc_super v12 = 0;
  if (!v9) {
    return v7;
  }
LABEL_9:
  if (*((_DWORD *)v9 + 2) != 1)
  {
    --*((_DWORD *)v9 + 2);
    return v7;
  }
  (*(void (**)(WTF::StringImpl *))(*(void *)v9 + 8))(v9);
  return v7;
}

- (void)addSubresource:(WebResource *)subresource
{
  v3.var0 = (ArchiveResource *)[(WebResource *)subresource _coreResource];
  ++*((_DWORD *)v3.var0 + 2);
  var0 = v3.var0;
  WebCore::DocumentLoader::addArchiveResource();
  if (var0)
  {
    if (*((_DWORD *)var0 + 2) == 1) {
      (*(void (**)(ArchiveResource *))(*(void *)var0 + 8))(var0);
    }
    else {
      --*((_DWORD *)var0 + 2);
    }
  }
}

@end