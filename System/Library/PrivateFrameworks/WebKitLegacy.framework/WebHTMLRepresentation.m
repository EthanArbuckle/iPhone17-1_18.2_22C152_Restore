@interface WebHTMLRepresentation
+ (id)supportedImageMIMETypes;
+ (id)supportedMIMETypes;
+ (id)supportedMediaMIMETypes;
+ (id)supportedNonImageMIMETypes;
+ (id)unsupportedTextMIMETypes;
- (BOOL)_isDisplayingWebArchive;
- (BOOL)canProvideDocumentSource;
- (BOOL)canSaveAsWebArchive;
- (BOOL)elementDoesAutoComplete:(id)a3;
- (BOOL)elementIsPassword:(id)a3;
- (WebHTMLRepresentation)init;
- (id)DOMDocument;
- (id)controlsInForm:(id)a3;
- (id)currentForm;
- (id)documentSource;
- (id)elementWithName:(id)a3 inForm:(id)a4;
- (id)formForElement:(id)a3;
- (id)matchLabels:(id)a3 againstElement:(id)a4;
- (id)searchForLabels:(id)a3 beforeElement:(id)a4;
- (id)searchForLabels:(id)a3 beforeElement:(id)a4 resultDistance:(unint64_t *)a5 resultIsInCellAbove:(BOOL *)a6;
- (id)title;
- (void)_redirectDataToManualLoader:(id)a3 forPluginView:(id)a4;
- (void)dealloc;
- (void)finishedLoadingWithDataSource:(id)a3;
- (void)receivedData:(id)a3 withDataSource:(id)a4;
- (void)receivedError:(id)a3 withDataSource:(id)a4;
- (void)setDataSource:(id)a3;
@end

@implementation WebHTMLRepresentation

+ (id)supportedMIMETypes
{
  if (_MergedGlobals_19) {
    return (id)qword_1EB3A97B0;
  }
  v3 = (const void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "supportedNonImageMIMETypes"), "arrayByAddingObjectsFromArray:", objc_msgSend(a1, "supportedImageMIMETypes")), "arrayByAddingObjectsFromArray:", objc_msgSend(a1, "supportedMediaMIMETypes"));
  qword_1EB3A97B0 = (uint64_t)v3;
  if (v3) {
    CFRetain(v3);
  }
  _MergedGlobals_19 = 1;
  return (id)qword_1EB3A97B0;
}

+ (id)supportedMediaMIMETypes
{
  if (byte_1EB3A97A9 == 1) {
    return (id)qword_1EB3A97B8;
  }
  v3 = (WTF **)WebCore::MIMETypeRegistry::supportedMediaMIMETypes((WebCore::MIMETypeRegistry *)a1);
  WTF::createNSArray<WTF::HashSet<WTF::String,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTableTraits> const&>(&v4, v3);
  id result = v4;
  qword_1EB3A97B8 = (uint64_t)v4;
  byte_1EB3A97A9 = 1;
  return result;
}

+ (id)supportedNonImageMIMETypes
{
  if (byte_1EB3A97AA == 1) {
    return (id)qword_1EB3A97C0;
  }
  v3 = (WTF **)WebCore::MIMETypeRegistry::supportedNonImageMIMETypes((WebCore::MIMETypeRegistry *)a1);
  WTF::createNSArray<WTF::HashSet<WTF::String,WTF::ASCIICaseInsensitiveHash,WTF::HashTraits<WTF::String>,WTF::HashTableTraits> &>(&v4, v3);
  id result = v4;
  qword_1EB3A97C0 = (uint64_t)v4;
  byte_1EB3A97AA = 1;
  return result;
}

+ (id)supportedImageMIMETypes
{
  if (byte_1EB3A97AB) {
    return (id)qword_1EB3A97C8;
  }
  WebCore::MIMETypeRegistry::supportedImageMIMETypes((uint64_t *)&v5, (WebCore::MIMETypeRegistry *)a1);
  WTF::createNSArray<WTF::FixedVector<WTF::ASCIILiteral>>(&v6, (unsigned int **)&v5);
  v4 = v5;
  qword_1EB3A97C8 = (uint64_t)v6;
  v5 = 0;
  if (v4) {
    WTF::fastFree(v4, v3);
  }
  byte_1EB3A97AB = 1;
  return (id)qword_1EB3A97C8;
}

+ (id)unsupportedTextMIMETypes
{
  if (byte_1EB3A97AC) {
    return (id)qword_1EB3A97D0;
  }
  WebCore::MIMETypeRegistry::unsupportedTextMIMETypes((uint64_t *)&v5, (WebCore::MIMETypeRegistry *)a1);
  WTF::createNSArray<WTF::FixedVector<WTF::ASCIILiteral>>(&v6, (unsigned int **)&v5);
  v4 = v5;
  qword_1EB3A97D0 = (uint64_t)v6;
  v5 = 0;
  if (v4) {
    WTF::fastFree(v4, v3);
  }
  byte_1EB3A97AC = 1;
  return (id)qword_1EB3A97D0;
}

- (WebHTMLRepresentation)init
{
  v4.receiver = self;
  v4.super_class = (Class)WebHTMLRepresentation;
  v2 = [(WebHTMLRepresentation *)&v4 init];
  if (v2) {
    v2->_private = objc_alloc_init(WebHTMLRepresentationPrivate);
  }
  return v2;
}

- (void)dealloc
{
  v3 = self->_private;
  if (v3 && v3->includedInWebKitStatistics) {
    --WebHTMLRepresentationCount;
  }

  v4.receiver = self;
  v4.super_class = (Class)WebHTMLRepresentation;
  [(WebHTMLRepresentation *)&v4 dealloc];
}

- (void)_redirectDataToManualLoader:(id)a3 forPluginView:(id)a4
{
  self->_private->manualLoader = (WebPluginManualLoader *)a3;
  self->_private->pluginView = (WAKView *)a4;
}

- (void)setDataSource:(id)a3
{
  self->_private->dataSource = (WebDataSource *)a3;
  if (!self->_private->includedInWebKitStatistics)
  {
    if (objc_msgSend((id)objc_msgSend(a3, "webFrame"), "_isIncludedInWebKitStatistics"))
    {
      self->_private->includedInWebKitStatistics = 1;
      ++WebHTMLRepresentationCount;
    }
  }
}

- (BOOL)_isDisplayingWebArchive
{
  id v2 = [(WebDataSource *)self->_private->dataSource _responseMIMEType];
  return objc_msgSend(v2, "_webkit_isCaseInsensitiveEqualToString:", @"application/x-webarchive");
}

- (void)receivedData:(id)a3 withDataSource:(id)a4
{
  if (self) {
    CFRetain(self);
  }
  v7 = (void *)[a4 webFrame];
  v8 = v7;
  if (v7)
  {
    if (!self->_private->pluginView) {
      [v7 _commitData:a3];
    }
    uint64_t v9 = *(void *)(v8[1] + 8);
    if ((*(_WORD *)(*(void *)(v9 + 296) + 3406) & 0x10) == 0) {
      goto LABEL_25;
    }
    uint64_t v10 = *(void *)(v9 + 280);
    if (!*(void *)(v10 + 88)) {
      goto LABEL_25;
    }
    (*(void (**)(WTF::StringImpl **__return_ptr))(**(void **)(v10 + 16) + 648))(&v18);
    WebCore::DocumentLoader::cancelMainResourceLoad();
    CFTypeRef v12 = cf;
    CFTypeRef cf = 0;
    if (v12) {
      CFRelease(v12);
    }
    v13 = v20;
    v20 = 0;
    if (v13)
    {
      if (*(_DWORD *)v13 == 2)
      {
        WTF::StringImpl::destroy(v13, v11);
        v14 = v19;
        v19 = 0;
        if (!v14) {
          goto LABEL_20;
        }
LABEL_18:
        if (*(_DWORD *)v14 == 2)
        {
          WTF::StringImpl::destroy(v14, v11);
          v15 = v18;
          v18 = 0;
          if (!v15) {
            goto LABEL_25;
          }
LABEL_23:
          if (*(_DWORD *)v15 == 2)
          {
            WTF::StringImpl::destroy(v15, v11);
            v16 = self->_private;
            pluginView = v16->pluginView;
            if (pluginView) {
              goto LABEL_26;
            }
            goto LABEL_29;
          }
          *(_DWORD *)v15 -= 2;
LABEL_25:
          v16 = self->_private;
          pluginView = v16->pluginView;
          if (pluginView)
          {
LABEL_26:
            if (!v16->hasSentResponseToPlugin)
            {
              -[WebPluginManualLoader pluginView:receivedResponse:](v16->manualLoader, "pluginView:receivedResponse:", pluginView, [a4 response]);
              self->_private->hasSentResponseToPlugin = 1;
              v16 = self->_private;
              pluginView = v16->pluginView;
            }
            -[WebPluginManualLoader pluginView:receivedData:](v16->manualLoader, "pluginView:receivedData:", pluginView, a3, v18, v19);
          }
LABEL_29:
          CFRelease(self);
          return;
        }
        *(_DWORD *)v14 -= 2;
LABEL_20:
        v15 = v18;
        v18 = 0;
        if (!v15) {
          goto LABEL_25;
        }
        goto LABEL_23;
      }
      *(_DWORD *)v13 -= 2;
    }
    v14 = v19;
    v19 = 0;
    if (!v14) {
      goto LABEL_20;
    }
    goto LABEL_18;
  }
  if (self) {
    goto LABEL_29;
  }
}

- (void)receivedError:(id)a3 withDataSource:(id)a4
{
  v5 = self->_private;
  pluginView = v5->pluginView;
  if (pluginView) {
    [(WebPluginManualLoader *)v5->manualLoader pluginView:pluginView receivedError:a3];
  }
}

- (void)finishedLoadingWithDataSource:(id)a3
{
  objc_super v4 = (void *)[a3 webFrame];
  v5 = self->_private;
  if (v5->pluginView)
  {
    manualLoader = v5->manualLoader;
    -[WebPluginManualLoader pluginViewFinishedLoading:](manualLoader, "pluginViewFinishedLoading:");
  }
  else
  {
    v7 = v4;
    if (v4)
    {
      v8 = (void *)[v4 webView];
      if ((void *)[v8 mainFrame] == v7)
      {
        if ([v8 isEditable])
        {
          uint64_t v9 = (WebCore::Editor *)WebCore::Document::editor(*(WebCore::Document **)(*(void *)(v7[1] + 8) + 296));
          WebCore::Editor::applyEditingStyleToBodyElement(v9);
        }
      }
    }
  }
}

- (BOOL)canProvideDocumentSource
{
  id v2 = [(WebDataSource *)self->_private->dataSource webFrame];
  return [(WebFrame *)v2 _canProvideDocumentSource];
}

- (BOOL)canSaveAsWebArchive
{
  id v2 = [(WebDataSource *)self->_private->dataSource webFrame];
  return [(WebFrame *)v2 _canSaveAsWebArchive];
}

- (id)documentSource
{
  if ([(WebHTMLRepresentation *)self _isDisplayingWebArchive])
  {
    dataSource = self->_private->dataSource;
    if (dataSource)
    {
      [dataSource _documentLoader];
      dataSource = (void *)cf;
    }
    else
    {
      CFTypeRef cf = 0;
    }
    v14 = (WebCore::SharedBuffer *)WebCore::DocumentLoader::parsedArchiveData((WebCore::DocumentLoader *)dataSource);
    id v15 = [NSString alloc];
    if (v14)
    {
      WebCore::SharedBuffer::createNSData((uint64_t *)&cf, v14);
      CFTypeRef v16 = cf;
    }
    else
    {
      CFTypeRef v16 = 0;
    }
    CFTypeRef v7 = (id)CFMakeCollectable((CFTypeRef)objc_msgSend(v15, "initWithData:encoding:", v16, 4, cf));
    if (v14)
    {
      CFTypeRef v17 = cf;
      CFTypeRef cf = 0;
      if (v17)
      {
        CFRelease(v17);
        return (id)v7;
      }
    }
    return (id)v7;
  }
  objc_super v4 = [(WebDataSource *)self->_private->dataSource webFrame];
  if (!v4) {
    return 0;
  }
  m_ptr = v4->_private->coreFrame.m_ptr;
  if (!m_ptr) {
    return 0;
  }
  uint64_t v6 = *((void *)m_ptr + 37);
  if (!v6) {
    return 0;
  }
  CFTypeRef v7 = *(CFTypeRef *)(v6 + 1784);
  if (!v7) {
    return (id)v7;
  }
  v8 = [(WebDataSource *)self->_private->dataSource data];
  if (!v8) {
    return 0;
  }
  uint64_t v9 = v8;
  [(NSData *)v8 bytes];
  [(NSData *)v9 length];
  char v19 = 0;
  PAL::TextEncoding::decode();
  if (!cf) {
    return &stru_1F3C7DA90;
  }
  v11 = (void *)WTF::StringImpl::operator NSString *();
  CFTypeRef v12 = (WTF::StringImpl *)cf;
  CFTypeRef cf = 0;
  if (*(_DWORD *)v12 == 2) {
    WTF::StringImpl::destroy(v12, v10);
  }
  else {
    *(_DWORD *)v12 -= 2;
  }
  return v11;
}

- (id)title
{
  [(WebDataSource *)self->_private->dataSource _documentLoader];
  id result = *(id *)(v3 + 1608);
  if (result)
  {
    if (*((_DWORD *)result + 1)) {
      return (id)WTF::StringImpl::operator NSString *();
    }
    else {
      return 0;
    }
  }
  return result;
}

- (id)DOMDocument
{
  id v2 = [(WebDataSource *)self->_private->dataSource webFrame];
  return [(WebFrame *)v2 DOMDocument];
}

- (id)elementWithName:(id)a3 inForm:(id)a4
{
  uint64_t v5 = core((uint64_t)a4);
  if (!v5) {
    return 0;
  }
  CFTypeRef v7 = (WebCore::HTMLFormElement *)v5;
  if ((*(_WORD *)(v5 + 32) & 0x10) == 0
    || *(void *)(*(void *)(v5 + 104) + 24) != *(void *)(*MEMORY[0x1E4FB68F8] + 24))
  {
    return 0;
  }
  v8 = (_DWORD *)MEMORY[0x1E4FB64F0];
  ++*MEMORY[0x1E4FB64F0];
  WTF::AtomStringImpl::add((uint64_t *)&v19, (WTF::AtomStringImpl *)a3, v6);
  uint64_t v9 = v19;
  uint64_t v10 = WebCore::HTMLFormElement::unsafeListedElements(v7);
  uint64_t v12 = *(unsigned int *)(v10 + 12);
  if (!v12)
  {
LABEL_16:
    CFTypeRef v17 = 0;
    goto LABEL_21;
  }
  uint64_t v13 = *(void *)v10;
  uint64_t v14 = 8 * v12;
  while (1)
  {
    if (*(void *)v13)
    {
      id v15 = *(WebCore::Node **)(*(void *)v13 + 8);
      if (v15) {
        break;
      }
    }
LABEL_7:
    v13 += 8;
    v14 -= 8;
    if (!v14) {
      goto LABEL_16;
    }
  }
  *((_DWORD *)v15 + 7) += 2;
  uint64_t v16 = (*(uint64_t (**)(WebCore::Node *))(*(void *)v15 + 456))(v15);
  if (*(WTF::StringImpl **)(*(uint64_t (**)(uint64_t))(*(void *)v16 + 128))(v16) != v9)
  {
    if (*((_DWORD *)v15 + 7) == 2)
    {
      if ((*((_WORD *)v15 + 17) & 0x400) == 0) {
        WebCore::Node::removedLastRef(v15);
      }
    }
    else
    {
      *((_DWORD *)v15 + 7) -= 2;
    }
    goto LABEL_7;
  }
  CFTypeRef v17 = kit(v15);
  if (*((_DWORD *)v15 + 7) == 2)
  {
    if ((*((_WORD *)v15 + 17) & 0x400) == 0) {
      WebCore::Node::removedLastRef(v15);
    }
  }
  else
  {
    *((_DWORD *)v15 + 7) -= 2;
  }
LABEL_21:
  if (v9)
  {
    if (*(_DWORD *)v9 == 2) {
      WTF::StringImpl::destroy(v9, v11);
    }
    else {
      *(_DWORD *)v9 -= 2;
    }
  }
  --*v8;
  return v17;
}

- (BOOL)elementDoesAutoComplete:(id)a3
{
  uint64_t v3 = core((uint64_t)a3);
  if (!v3) {
    return 0;
  }
  objc_super v4 = (WebCore::HTMLInputElement *)v3;
  if ((*(_WORD *)(v3 + 32) & 0x10) == 0
    || *(void *)(*(void *)(v3 + 104) + 24) != *(void *)(*MEMORY[0x1E4FB69A8] + 24)
    || !WebCore::HTMLInputElement::isTextField((WebCore::HTMLInputElement *)v3)
    || (WebCore::HTMLInputElement::isPasswordField(v4) & 1) != 0)
  {
    return 0;
  }
  return MEMORY[0x1F4174F20](v4);
}

- (BOOL)elementIsPassword:(id)a3
{
  uint64_t v3 = core((uint64_t)a3);
  if (!v3
    || (*(_WORD *)(v3 + 32) & 0x10) == 0
    || *(void *)(*(void *)(v3 + 104) + 24) != *(void *)(*MEMORY[0x1E4FB69A8] + 24))
  {
    return 0;
  }
  return WebCore::HTMLInputElement::isPasswordField((WebCore::HTMLInputElement *)v3);
}

- (id)formForElement:(id)a3
{
  uint64_t v3 = core((uint64_t)a3);
  if (!v3
    || (*(_WORD *)(v3 + 32) & 0x10) == 0
    || *(void *)(*(void *)(v3 + 104) + 24) != *(void *)(*MEMORY[0x1E4FB69A8] + 24))
  {
    return 0;
  }
  uint64_t v4 = *(void *)(v3 + 128);
  if (v4)
  {
    uint64_t v5 = *(WebCore::Node **)(v4 + 8);
  }
  else
  {
    uint64_t v5 = 0;
  }
  return kit(v5);
}

- (id)currentForm
{
  WebCore::FrameSelection::currentForm((uint64_t *)&v5, *(WebCore::FrameSelection **)(*(void *)(*(void *)((void)[(WebDataSource *)self->_private->dataSource webFrame][8]+ 8)+ 296)+ 3096));
  id v2 = kit(v5);
  uint64_t v3 = v5;
  uint64_t v5 = 0;
  if (!v3) {
    return v2;
  }
  if (*((_DWORD *)v3 + 7) != 2)
  {
    *((_DWORD *)v3 + 7) -= 2;
    return v2;
  }
  if ((*((_WORD *)v3 + 17) & 0x400) != 0) {
    return v2;
  }
  WebCore::Node::removedLastRef(v3);
  return v2;
}

- (id)controlsInForm:(id)a3
{
  id result = (id)core((uint64_t)a3);
  if (result)
  {
    if ((*((_WORD *)result + 16) & 0x10) == 0) {
      return 0;
    }
    if (*(void *)(*((void *)result + 13) + 24) != *(void *)(*MEMORY[0x1E4FB68F8] + 24)) {
      return 0;
    }
    uint64_t v4 = (_DWORD *)MEMORY[0x1E4FB64F0];
    ++*MEMORY[0x1E4FB64F0];
    uint64_t v5 = WebCore::HTMLFormElement::unsafeListedElements((WebCore::HTMLFormElement *)result);
    CFStringRef v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:*(unsigned int *)(v5 + 12)];
    uint64_t v7 = *(unsigned int *)(v5 + 12);
    if (v7)
    {
      uint64_t v8 = *(void *)v5;
      uint64_t v9 = 8 * v7;
      while (1)
      {
        if (*(void *)v8)
        {
          uint64_t v10 = *(WebCore::Node **)(*(void *)v8 + 8);
          if (v10) {
            break;
          }
        }
LABEL_8:
        v8 += 8;
        v9 -= 8;
        if (!v9) {
          goto LABEL_20;
        }
      }
      *((_DWORD *)v10 + 7) += 2;
      uint64_t v11 = (*(uint64_t (**)(WebCore::Node *))(*(void *)v10 + 456))(v10);
      if ((*(uint64_t (**)(uint64_t))(*(void *)v11 + 120))(v11))
      {
        uint64_t v12 = kit(v10);
        int v13 = *((_DWORD *)v10 + 7) - 2;
        if (*((_DWORD *)v10 + 7) == 2) {
          goto LABEL_13;
        }
      }
      else
      {
        uint64_t v12 = 0;
        int v13 = *((_DWORD *)v10 + 7) - 2;
        if (*((_DWORD *)v10 + 7) == 2)
        {
LABEL_13:
          if ((*((_WORD *)v10 + 17) & 0x400) == 0) {
            WebCore::Node::removedLastRef(v10);
          }
          goto LABEL_17;
        }
      }
      *((_DWORD *)v10 + 7) = v13;
LABEL_17:
      if (v12) {
        [v6 addObject:v12];
      }
      goto LABEL_8;
    }
LABEL_20:
    if ([v6 count])
    {
      id result = (id)CFMakeCollectable(v6);
    }
    else
    {
      if (v6) {
        CFRelease(v6);
      }
      id result = 0;
    }
    --*v4;
  }
  return result;
}

- (id)searchForLabels:(id)a3 beforeElement:(id)a4
{
  return [(WebHTMLRepresentation *)self searchForLabels:a3 beforeElement:a4 resultDistance:0 resultIsInCellAbove:0];
}

- (id)searchForLabels:(id)a3 beforeElement:(id)a4 resultDistance:(unint64_t *)a5 resultIsInCellAbove:(BOOL *)a6
{
  [(WebDataSource *)self->_private->dataSource webFrame];
  uint64_t v10 = core((uint64_t)a4);
  uint64_t v12 = (JSC::Yarr::RegularExpression *)regExpForLabels((NSArray *)a3);
  uint64_t v47 = -1;
  int v13 = (WebCore::NodeTraversal *)(*(void *)(v10 + 56) & 0xFFFFFFFFFFFFLL);
  if (v13)
  {
    uint64_t Child = WebCore::NodeTraversal::deepLastChild(v13, v11);
    if (!Child)
    {
LABEL_78:
      BOOL v16 = 0;
      v32 = 0;
      if (a5)
      {
LABEL_79:
        unint64_t v42 = v47;
        if (v47 == -1) {
          unint64_t v42 = 0x7FFFFFFFFFFFFFFFLL;
        }
        *a5 = v42;
      }
      goto LABEL_82;
    }
  }
  else
  {
    uint64_t Child = *(void *)(v10 + 40);
    if (!Child) {
      goto LABEL_78;
    }
  }
  v45 = a5;
  v46 = a6;
  unsigned int v15 = 0;
  BOOL v16 = 0;
  uint64_t v17 = 0;
  uint64_t v18 = MEMORY[0x1E4FB6850];
  uint64_t v19 = MEMORY[0x1E4FB68F8];
  while (1)
  {
    __int16 v20 = *(_WORD *)(Child + 32);
    if ((v20 & 0x10) != 0 && *(void *)(*(void *)(Child + 104) + 24) == *(void *)(*(void *)v19 + 24))
    {
LABEL_72:
      a5 = v45;
      a6 = v46;
      if (!v17 || v16) {
        goto LABEL_78;
      }
      WebCore::LocalFrame::searchForLabelsAboveCell();
      if (v49)
      {
        v32 = (__CFString *)WTF::StringImpl::operator NSString *();
        v41 = v49;
        v49 = 0;
        if (v41)
        {
          if (*(_DWORD *)v41 == 2)
          {
            WTF::StringImpl::destroy(v41, v40);
            if (![(__CFString *)v32 length]) {
              goto LABEL_78;
            }
          }
          else
          {
            *(_DWORD *)v41 -= 2;
            if (![(__CFString *)v32 length]) {
              goto LABEL_78;
            }
          }
          goto LABEL_87;
        }
      }
      else
      {
        v32 = &stru_1F3C7DA90;
      }
      if (![(__CFString *)v32 length]) {
        goto LABEL_78;
      }
LABEL_87:
      BOOL v16 = 1;
      if (v45) {
        goto LABEL_79;
      }
      goto LABEL_82;
    }
    if ((v20 & 8) != 0)
    {
      if ((*(uint64_t (**)(uint64_t))(*(void *)Child + 848))(Child)) {
        goto LABEL_72;
      }
      __int16 v20 = *(_WORD *)(Child + 32);
    }
    if ((v20 & 0x10) == 0) {
      break;
    }
    uint64_t v21 = *(void *)(*(void *)(Child + 104) + 24);
    if (v21 == *(void *)(*(void *)v18 + 24) && v17 == 0)
    {
      uint64_t v17 = Child;
      goto LABEL_70;
    }
    if (v21 != *(void *)(*MEMORY[0x1E4FB6860] + 24) || v17 == 0) {
      break;
    }
    WebCore::LocalFrame::searchForLabelsAboveCell();
    if (!v49)
    {
      v32 = &stru_1F3C7DA90;
LABEL_42:
      BOOL v16 = 1;
      if ([(__CFString *)v32 length]) {
        goto LABEL_92;
      }
      goto LABEL_70;
    }
    v32 = (__CFString *)WTF::StringImpl::operator NSString *();
    v33 = v49;
    v49 = 0;
    if (!v33) {
      goto LABEL_42;
    }
    if (*(_DWORD *)v33 == 2)
    {
      WTF::StringImpl::destroy(v33, v31);
      BOOL v16 = 1;
      if ([(__CFString *)v32 length]) {
        goto LABEL_92;
      }
    }
    else
    {
      *(_DWORD *)v33 -= 2;
      BOOL v16 = 1;
      if ([(__CFString *)v32 length]) {
        goto LABEL_92;
      }
    }
LABEL_70:
    v39 = (WebCore::NodeTraversal *)(*(void *)(Child + 56) & 0xFFFFFFFFFFFFLL);
    if (v39)
    {
      uint64_t Child = WebCore::NodeTraversal::deepLastChild(v39, v11);
      if (!Child) {
        goto LABEL_72;
      }
    }
    else
    {
      uint64_t Child = *(void *)(Child + 40);
      if (!Child) {
        goto LABEL_72;
      }
    }
    if (v15 >= 0x1F4) {
      goto LABEL_72;
    }
  }
  if ((v20 & 2) == 0) {
    goto LABEL_70;
  }
  uint64_t v24 = *(void *)(Child + 72) & 0xFFFFFFFFFFFFLL;
  if (!v24) {
    goto LABEL_70;
  }
  if ((*(unsigned char *)((*(void *)(Child + 72) & 0xFFFFFFFFFFFFLL) + 0x2D) & 2) != 0)
  {
    uint64_t v24 = *(void *)((*(void *)(Child + 72) & 0xFFFFFFFFFFFFLL) + 0x20);
    if (v24) {
      uint64_t v24 = *(void *)(v24 + 8);
    }
  }
  if ((*(unsigned char *)(*(void *)(v24 + 104) + 239) & 0x10) != 0 || (*(unsigned char *)(v24 + 123) & 0x18) != 0) {
    goto LABEL_70;
  }
  (*(void (**)(WTF::StringImpl **__return_ptr, uint64_t))(*(void *)Child + 112))(&v48, Child);
  v25 = v48;
  if (v48)
  {
    int v26 = *((_DWORD *)v48 + 1);
    if (v26 + v15 >= 0x259)
    {
      v27 = (StringImpl *)(v26 - (500 - v15));
      if (v26 == 500 - v15)
      {
        int v28 = *(_DWORD *)v48 + 2;
        *(_DWORD *)v48 = v28;
        v29 = v25;
        int v30 = v28 - 2;
        if (v30) {
          goto LABEL_34;
        }
LABEL_48:
        WTF::StringImpl::destroy(v29, v27);
      }
      else
      {
        WTF::StringImpl::substring(v48);
        v29 = v48;
        v48 = v49;
        if (v29)
        {
          int v30 = *(_DWORD *)v29 - 2;
          if (*(_DWORD *)v29 == 2) {
            goto LABEL_48;
          }
LABEL_34:
          *(_DWORD *)v29 = v30;
        }
      }
    }
  }
  int v34 = JSC::Yarr::RegularExpression::searchRev();
  if (v34 < 0)
  {
    int v38 = (int)v48;
    if (v48) {
      int v38 = *((_DWORD *)v48 + 1);
    }
    v15 += v38;
    v37 = v48;
    v48 = 0;
    if (v37) {
      goto LABEL_65;
    }
    goto LABEL_67;
  }
  uint64_t v47 = v15;
  unsigned int v35 = JSC::Yarr::RegularExpression::matchedLength(v12);
  v36 = v48;
  if (!v48)
  {
    BOOL v16 = 0;
    v32 = &stru_1F3C7DA90;
    a5 = v45;
    a6 = v46;
    if (v45) {
      goto LABEL_79;
    }
    goto LABEL_82;
  }
  if (!v34 && *((_DWORD *)v48 + 1) <= v35)
  {
    *(_DWORD *)v48 += 2;
    goto LABEL_61;
  }
  WTF::StringImpl::substring(v48);
  v36 = v49;
  if (v49)
  {
LABEL_61:
    v44 = (__CFString *)WTF::StringImpl::operator NSString *();
    if (*(_DWORD *)v36 == 2)
    {
      WTF::StringImpl::destroy(v36, (StringImpl *)v11);
      v37 = v48;
      v48 = 0;
      if (!v37) {
        goto LABEL_67;
      }
      goto LABEL_65;
    }
    *(_DWORD *)v36 -= 2;
    v37 = v48;
    v48 = 0;
    if (v37) {
      goto LABEL_65;
    }
LABEL_67:
    if ((v34 & 0x80000000) == 0) {
      goto LABEL_91;
    }
    goto LABEL_70;
  }
  v44 = &stru_1F3C7DA90;
  v37 = v48;
  v48 = 0;
  if (!v37) {
    goto LABEL_67;
  }
LABEL_65:
  if (*(_DWORD *)v37 != 2)
  {
    *(_DWORD *)v37 -= 2;
    goto LABEL_67;
  }
  WTF::StringImpl::destroy(v37, (StringImpl *)v11);
  if (v34 < 0) {
    goto LABEL_70;
  }
LABEL_91:
  BOOL v16 = 0;
  v32 = v44;
LABEL_92:
  a5 = v45;
  a6 = v46;
  if (v45) {
    goto LABEL_79;
  }
LABEL_82:
  if (a6) {
    *a6 = v16;
  }
  return v32;
}

- (id)matchLabels:(id)a3 againstElement:(id)a4
{
  uint64_t v5 = core((uint64_t)a4);
  if (!v5) {
    return 0;
  }
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)(v5 + 112);
  if (v7)
  {
    unsigned int v8 = *(_DWORD *)(v7 + 4);
    if (v8)
    {
      uint64_t v9 = *(void *)(v7 + 40);
      LODWORD(v10) = *(_DWORD *)(v7 + 52);
      if (v10)
      {
LABEL_5:
        uint64_t v11 = *MEMORY[0x1E4FB69D0];
        uint64_t v10 = v10;
        uint64_t v12 = (const WTF::String **)(v9 + 8);
        while (1)
        {
          uint64_t v13 = (uint64_t)*(v12 - 1);
          if (v13 == v11
            || *(void *)(v13 + 24) == *(void *)(v11 + 24) && *(void *)(v13 + 32) == *(void *)(v11 + 32))
          {
            break;
          }
          v12 += 2;
          if (!--v10)
          {
            matched = matchLabelsAgainstString((NSArray *)a3, (const WTF::String *)*MEMORY[0x1E4F30968]);
            if ([(__CFString *)matched length]) {
              return matched;
            }
            goto LABEL_13;
          }
        }
LABEL_19:
        matched = matchLabelsAgainstString((NSArray *)a3, *v12);
        if ([(__CFString *)matched length]) {
          return matched;
        }
        goto LABEL_13;
      }
    }
    else
    {
      uint64_t v9 = v7 + 32;
      LODWORD(v10) = v8 >> 5;
      if (v10) {
        goto LABEL_5;
      }
    }
    uint64_t v12 = (const WTF::String **)MEMORY[0x1E4F30968];
    goto LABEL_19;
  }
  matched = matchLabelsAgainstString((NSArray *)a3, (const WTF::String *)*MEMORY[0x1E4F30968]);
  if ([(__CFString *)matched length]) {
    return matched;
  }
LABEL_13:
  uint64_t v16 = *(void *)(v6 + 112);
  if (v16)
  {
    unsigned int v17 = *(_DWORD *)(v16 + 4);
    if (v17)
    {
      uint64_t v18 = *(void *)(v16 + 40);
      LODWORD(v19) = *(_DWORD *)(v16 + 52);
      if (!v19) {
        goto LABEL_16;
      }
    }
    else
    {
      uint64_t v18 = v16 + 32;
      LODWORD(v19) = v17 >> 5;
      if (!v19) {
        goto LABEL_16;
      }
    }
    uint64_t v21 = *MEMORY[0x1E4FB6898];
    uint64_t v19 = v19;
    __int16 v20 = (const WTF::String **)(v18 + 8);
    while (1)
    {
      uint64_t v22 = (uint64_t)*(v20 - 1);
      if (v22 == v21
        || *(void *)(v22 + 24) == *(void *)(v21 + 24) && *(void *)(v22 + 32) == *(void *)(v21 + 32))
      {
        goto LABEL_31;
      }
      v20 += 2;
      if (!--v19)
      {
        __int16 v20 = (const WTF::String **)MEMORY[0x1E4F30968];
        goto LABEL_31;
      }
    }
  }
LABEL_16:
  __int16 v20 = (const WTF::String **)MEMORY[0x1E4F30968];
LABEL_31:
  v23 = *v20;
  return matchLabelsAgainstString((NSArray *)a3, v23);
}

@end