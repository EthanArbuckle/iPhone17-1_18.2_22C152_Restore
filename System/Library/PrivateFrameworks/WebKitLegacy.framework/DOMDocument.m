@interface DOMDocument
- (BOOL)execCommand:(NSString *)command;
- (BOOL)execCommand:(NSString *)command userInterface:(BOOL)userInterface;
- (BOOL)execCommand:(NSString *)command userInterface:(BOOL)userInterface value:(NSString *)value;
- (BOOL)hasFocus;
- (BOOL)hidden;
- (BOOL)queryCommandEnabled:(NSString *)command;
- (BOOL)queryCommandIndeterm:(NSString *)command;
- (BOOL)queryCommandState:(NSString *)command;
- (BOOL)queryCommandSupported:(NSString *)command;
- (BOOL)webkitFullScreenKeyboardInputAllowed;
- (BOOL)webkitFullscreenEnabled;
- (BOOL)webkitIsFullScreen;
- (BOOL)xmlStandalone;
- (DOMAbstractView)defaultView;
- (DOMAttr)createAttribute:(NSString *)name;
- (DOMAttr)createAttributeNS:(NSString *)namespaceURI qualifiedName:(NSString *)qualifiedName;
- (DOMCDATASection)createCDATASection:(NSString *)data;
- (DOMCSSRuleList)getMatchedCSSRules:(DOMElement *)element pseudoElement:(NSString *)pseudoElement;
- (DOMCSSRuleList)getMatchedCSSRules:(DOMElement *)element pseudoElement:(NSString *)pseudoElement authorOnly:(BOOL)authorOnly;
- (DOMCSSStyleDeclaration)createCSSStyleDeclaration;
- (DOMCSSStyleDeclaration)getComputedStyle:(DOMElement *)element pseudoElement:(NSString *)pseudoElement;
- (DOMCSSStyleDeclaration)getOverrideStyle:(DOMElement *)element :(NSString *)pseudoElement;
- (DOMCSSStyleDeclaration)getOverrideStyle:(DOMElement *)element pseudoElement:(NSString *)pseudoElement;
- (DOMComment)createComment:(NSString *)data;
- (DOMDocumentFragment)createDocumentFragment;
- (DOMDocumentType)doctype;
- (DOMElement)activeElement;
- (DOMElement)createElement:(NSString *)tagName;
- (DOMElement)createElementNS:(NSString *)namespaceURI qualifiedName:(NSString *)qualifiedName;
- (DOMElement)documentElement;
- (DOMElement)elementFromPoint:(int)x y:(int)y;
- (DOMElement)getElementById:(NSString *)elementId;
- (DOMElement)querySelector:(NSString *)selectors;
- (DOMEntityReference)createEntityReference:(NSString *)name;
- (DOMEvent)createEvent:(NSString *)eventType;
- (DOMHTMLCollection)anchors;
- (DOMHTMLCollection)applets;
- (DOMHTMLCollection)forms;
- (DOMHTMLCollection)images;
- (DOMHTMLCollection)links;
- (DOMHTMLElement)body;
- (DOMImplementation)implementation;
- (DOMNode)adoptNode:(DOMNode *)source;
- (DOMNode)importNode:(DOMNode *)importedNode deep:(BOOL)deep;
- (DOMNodeIterator)createNodeIterator:(DOMNode *)root whatToShow:(unsigned int)whatToShow filter:(id)filter expandEntityReferences:(BOOL)expandEntityReferences;
- (DOMNodeList)getElementsByClassName:(NSString *)classNames;
- (DOMNodeList)getElementsByName:(NSString *)elementName;
- (DOMNodeList)getElementsByTagName:(NSString *)tagname;
- (DOMNodeList)getElementsByTagNameNS:(NSString *)namespaceURI localName:(NSString *)localName;
- (DOMNodeList)querySelectorAll:(NSString *)selectors;
- (DOMProcessingInstruction)createProcessingInstruction:(NSString *)target data:(NSString *)data;
- (DOMRange)createRange;
- (DOMStyleSheetList)styleSheets;
- (DOMText)createTextNode:(NSString *)data;
- (DOMTreeWalker)createTreeWalker:(DOMNode *)root whatToShow:(unsigned int)whatToShow filter:(id)filter expandEntityReferences:(BOOL)expandEntityReferences;
- (DOMXPathExpression)createExpression:(NSString *)expression resolver:(id)resolver;
- (DOMXPathResult)evaluate:(NSString *)expression contextNode:(DOMNode *)contextNode resolver:(id)resolver type:(unsigned __int16)type inResult:(DOMXPathResult *)inResult;
- (NSString)URL;
- (NSString)characterSet;
- (NSString)charset;
- (NSString)cookie;
- (NSString)defaultCharset;
- (NSString)documentURI;
- (NSString)domain;
- (NSString)inputEncoding;
- (NSString)lastModified;
- (NSString)preferredStylesheetSet;
- (NSString)queryCommandValue:(NSString *)command;
- (NSString)readyState;
- (NSString)referrer;
- (NSString)selectedStylesheetSet;
- (NSString)title;
- (NSString)xmlEncoding;
- (NSString)xmlVersion;
- (NSURL)URLWithAttributeString:(NSString *)string;
- (WebFrame)webFrame;
- (id)_documentRange;
- (id)caretRangeFromPoint:(int)a3 y:(int)a4;
- (id)children;
- (id)compatMode;
- (id)contentType;
- (id)createNSResolver:(DOMNode *)nodeResolver;
- (id)currentScript;
- (id)dir;
- (id)firstElementChild;
- (id)head;
- (id)lastElementChild;
- (id)origin;
- (id)scrollingElement;
- (id)visibilityState;
- (id)webkitCurrentFullScreenElement;
- (id)webkitFullscreenElement;
- (unsigned)childElementCount;
- (void)setBody:(DOMHTMLElement *)body;
- (void)setCharset:(NSString *)charset;
- (void)setCookie:(NSString *)cookie;
- (void)setDir:(id)a3;
- (void)setDocumentURI:(NSString *)documentURI;
- (void)setTitle:(NSString *)title;
- (void)setXmlStandalone:(BOOL)xmlStandalone;
- (void)setXmlVersion:(NSString *)xmlVersion;
- (void)webkitCancelFullScreen;
- (void)webkitExitFullscreen;
@end

@implementation DOMDocument

- (DOMDocumentType)doctype
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  v3 = (WebCore::Node *)WebCore::Document::doctype(self->super.super._internal);
  v4 = (DOMDocumentType *)kit(v3);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7, v5);
  return v4;
}

- (DOMImplementation)implementation
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  v3 = (DOMObjectInternal *)WebCore::Document::implementation(self->super.super._internal);
  v4 = (DOMImplementation *)kit(v3);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7, v5);
  return v4;
}

- (DOMElement)documentElement
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6);
  v3 = (DOMElement *)kit(*((WebCore::Node **)self->super.super._internal + 163));
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6, v4);
  return v3;
}

- (NSString)inputEncoding
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WebCore::Document::characterSetWithUTF8Fallback((uint64_t *)&v7, self->super.super._internal);
  if (v7)
  {
    v4 = (__CFString *)WTF::StringImpl::operator NSString *();
    v5 = v7;
    v7 = 0;
    if (v5)
    {
      if (*(_DWORD *)v5 == 2) {
        WTF::StringImpl::destroy(v5, v3);
      }
      else {
        *(_DWORD *)v5 -= 2;
      }
    }
  }
  else
  {
    v4 = &stru_1F3C7DA90;
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8, v3);
  return &v4->isa;
}

- (NSString)xmlEncoding
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  v4 = (WTF::StringImpl *)*((void *)self->super.super._internal + 217);
  if (v4)
  {
    *(_DWORD *)v4 += 2;
    v5 = (__CFString *)WTF::StringImpl::operator NSString *();
    if (*(_DWORD *)v4 == 2) {
      WTF::StringImpl::destroy(v4, v3);
    }
    else {
      *(_DWORD *)v4 -= 2;
    }
  }
  else
  {
    v5 = &stru_1F3C7DA90;
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7, v3);
  return &v5->isa;
}

- (NSString)xmlVersion
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  v4 = (WTF::StringImpl *)*((void *)self->super.super._internal + 218);
  if (v4)
  {
    *(_DWORD *)v4 += 2;
    v5 = (__CFString *)WTF::StringImpl::operator NSString *();
    if (*(_DWORD *)v4 == 2) {
      WTF::StringImpl::destroy(v4, v3);
    }
    else {
      *(_DWORD *)v4 -= 2;
    }
  }
  else
  {
    v5 = &stru_1F3C7DA90;
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7, v3);
  return &v5->isa;
}

- (void)setXmlVersion:(NSString *)xmlVersion
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v14);
  internal = self->super.super._internal;
  MEMORY[0x1E4E442D0](&v10, xmlVersion);
  WebCore::Document::setXMLVersion(&v11, internal, (const WTF::String *)&v10);
  if (v13)
  {
    v14[80] = v11;
    uint64_t v9 = v12;
    uint64_t v12 = 0;
    uint64_t v15 = v9;
    raiseDOMErrorException();
  }
  v7 = v10;
  v10 = 0;
  if (!v7) {
    goto LABEL_5;
  }
  if (*(_DWORD *)v7 != 2)
  {
    *(_DWORD *)v7 -= 2;
LABEL_5:
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v14, v6);
    return;
  }
  WTF::StringImpl::destroy(v7, v6);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v14, v8);
}

- (BOOL)xmlStandalone
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LOBYTE(self) = *((unsigned char *)self->super.super._internal + 3423) == 1;
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return (char)self;
}

- (void)setXmlStandalone:(BOOL)xmlStandalone
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  WebCore::Document::setXMLStandalone(self->super.super._internal);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v4);
}

- (NSString)documentURI
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WebCore::Document::documentURI((uint64_t *)&v7, self->super.super._internal);
  if (v7)
  {
    v4 = (__CFString *)WTF::StringImpl::operator NSString *();
    v5 = v7;
    v7 = 0;
    if (v5)
    {
      if (*(_DWORD *)v5 == 2) {
        WTF::StringImpl::destroy(v5, v3);
      }
      else {
        *(_DWORD *)v5 -= 2;
      }
    }
  }
  else
  {
    v4 = &stru_1F3C7DA90;
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8, v3);
  return &v4->isa;
}

- (void)setDocumentURI:(NSString *)documentURI
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10);
  internal = self->super.super._internal;
  MEMORY[0x1E4E442D0](&v9, documentURI);
  WebCore::Document::setDocumentURI(internal, (const WTF::String *)&v9);
  v7 = v9;
  uint64_t v9 = 0;
  if (!v7) {
    goto LABEL_4;
  }
  if (*(_DWORD *)v7 != 2)
  {
    *(_DWORD *)v7 -= 2;
LABEL_4:
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10, v6);
    return;
  }
  WTF::StringImpl::destroy(v7, v6);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10, v8);
}

- (DOMAbstractView)defaultView
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  v3 = (WebCore::WindowProxy *)WebCore::Document::windowProxy(self->super.super._internal);
  if (v3 && (v5 = (WebCore::LocalDOMWindow *)WebCore::WindowProxy::window(v3)) != 0 && !*((unsigned char *)v5 + 56)) {
    v6 = (DOMAbstractView *)kit(v5);
  }
  else {
    v6 = 0;
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8, v4);
  return v6;
}

- (DOMStyleSheetList)styleSheets
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  v3 = (DOMObjectInternal *)WebCore::Document::styleSheets(self->super.super._internal);
  v4 = kit(v3);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7, v5);
  return (DOMStyleSheetList *)v4;
}

- (id)contentType
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WebCore::Document::contentType((uint64_t *)&v7, self->super.super._internal);
  if (v7)
  {
    v4 = (__CFString *)WTF::StringImpl::operator NSString *();
    v5 = v7;
    v7 = 0;
    if (v5)
    {
      if (*(_DWORD *)v5 == 2) {
        WTF::StringImpl::destroy(v5, v3);
      }
      else {
        *(_DWORD *)v5 -= 2;
      }
    }
  }
  else
  {
    v4 = &stru_1F3C7DA90;
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8, v3);
  return v4;
}

- (NSString)title
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6);
  if (*((void *)self->super.super._internal + 186)) {
    v4 = (__CFString *)WTF::StringImpl::operator NSString *();
  }
  else {
    v4 = &stru_1F3C7DA90;
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6, v3);
  return &v4->isa;
}

- (void)setTitle:(NSString *)title
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  MEMORY[0x1E4E442D0](&v7, title);
  WebCore::Document::setTitle();
  v5 = v7;
  v7 = 0;
  if (!v5) {
    goto LABEL_4;
  }
  if (*(_DWORD *)v5 != 2)
  {
    *(_DWORD *)v5 -= 2;
LABEL_4:
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8, v4);
    return;
  }
  WTF::StringImpl::destroy(v5, v4);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8, v6);
}

- (id)dir
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6);
  if (*(void *)WebCore::Document::dir(self->super.super._internal)) {
    v4 = (__CFString *)WTF::StringImpl::operator NSString *();
  }
  else {
    v4 = &stru_1F3C7DA90;
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6, v3);
  return v4;
}

- (void)setDir:(id)a3
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WTF::AtomStringImpl::add((uint64_t *)&v9, (WTF::AtomStringImpl *)a3, v4);
  v7 = v9;
  WebCore::Document::setDir();
  if (!v7) {
    goto LABEL_4;
  }
  if (*(_DWORD *)v7 != 2)
  {
    *(_DWORD *)v7 -= 2;
LABEL_4:
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8, v5);
    return;
  }
  WTF::StringImpl::destroy(v7, v5);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8, v6);
}

- (NSString)referrer
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WebCore::Document::referrer((uint64_t *)&v7, self->super.super._internal);
  if (v7)
  {
    CFStringRef v4 = (__CFString *)WTF::StringImpl::operator NSString *();
    v5 = v7;
    v7 = 0;
    if (v5)
    {
      if (*(_DWORD *)v5 == 2) {
        WTF::StringImpl::destroy(v5, v3);
      }
      else {
        *(_DWORD *)v5 -= 2;
      }
    }
  }
  else
  {
    CFStringRef v4 = &stru_1F3C7DA90;
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8, v3);
  return &v4->isa;
}

- (NSString)domain
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WebCore::Document::domain((uint64_t *)&v7, self->super.super._internal);
  if (v7)
  {
    CFStringRef v4 = (__CFString *)WTF::StringImpl::operator NSString *();
    v5 = v7;
    v7 = 0;
    if (v5)
    {
      if (*(_DWORD *)v5 == 2) {
        WTF::StringImpl::destroy(v5, v3);
      }
      else {
        *(_DWORD *)v5 -= 2;
      }
    }
  }
  else
  {
    CFStringRef v4 = &stru_1F3C7DA90;
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8, v3);
  return &v4->isa;
}

- (NSString)URL
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6);
  if (*(void *)WebCore::Document::urlForBindings(self->super.super._internal)) {
    CFStringRef v4 = (__CFString *)WTF::StringImpl::operator NSString *();
  }
  else {
    CFStringRef v4 = &stru_1F3C7DA90;
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6, v3);
  return &v4->isa;
}

- (NSString)cookie
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v12);
  WebCore::Document::cookie((uint64_t *)&v9, self->super.super._internal);
  if (!v11)
  {
    v3 = v9;
    uint64_t v9 = 0;
    if (v3)
    {
      v5 = (__CFString *)WTF::StringImpl::operator NSString *();
      if (*(_DWORD *)v3 == 2)
      {
        WTF::StringImpl::destroy(v3, v4);
        uint64_t v6 = v11;
        if (v11 == -1) {
          goto LABEL_8;
        }
      }
      else
      {
        *(_DWORD *)v3 -= 2;
        uint64_t v6 = v11;
        if (v11 == -1) {
          goto LABEL_8;
        }
      }
    }
    else
    {
      v5 = &stru_1F3C7DA90;
      uint64_t v6 = v11;
    }
    ((void (*)(unsigned char *, WTF::StringImpl **))off_1F3C7A008[v6])(v13, &v9);
LABEL_8:
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v12, v4);
    return &v5->isa;
  }
  if (v11 == 1)
  {
    v13[0] = (_BYTE)v9;
    uint64_t v8 = v10;
    uint64_t v10 = 0;
    uint64_t v14 = v8;
    raiseDOMErrorException();
  }
  result = (NSString *)std::__throw_bad_variant_access[abi:sn180100]();
  __break(1u);
  return result;
}

- (void)setCookie:(NSString *)cookie
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v14);
  internal = self->super.super._internal;
  MEMORY[0x1E4E442D0](&v10, cookie);
  WebCore::Document::setCookie(&v11, internal, (const WTF::String *)&v10);
  if (v13)
  {
    v14[80] = v11;
    uint64_t v9 = v12;
    uint64_t v12 = 0;
    uint64_t v15 = v9;
    raiseDOMErrorException();
  }
  v7 = v10;
  uint64_t v10 = 0;
  if (!v7) {
    goto LABEL_5;
  }
  if (*(_DWORD *)v7 != 2)
  {
    *(_DWORD *)v7 -= 2;
LABEL_5:
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v14, v6);
    return;
  }
  WTF::StringImpl::destroy(v7, v6);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v14, v8);
}

- (DOMHTMLElement)body
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  v3 = (WebCore::Node *)WebCore::Document::bodyOrFrameset(self->super.super._internal);
  CFStringRef v4 = (DOMHTMLElement *)kit(v3);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7, v5);
  return v4;
}

- (void)setBody:(DOMHTMLElement *)body
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v11);
  if (body)
  {
    internal = body->super.super.super._internal;
    if (internal) {
      *((_DWORD *)internal + 7) += 2;
    }
  }
  else
  {
    internal = 0;
  }
  v7 = internal;
  WebCore::Document::setBodyOrFrameset();
  if (v10)
  {
    v11[80] = v8;
    uint64_t v12 = v9;
    raiseDOMErrorException();
  }
  if (!v7) {
    goto LABEL_9;
  }
  if (*((_DWORD *)v7 + 7) != 2)
  {
    *((_DWORD *)v7 + 7) -= 2;
LABEL_9:
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v11, v5);
    return;
  }
  if ((*((_WORD *)v7 + 17) & 0x400) != 0) {
    goto LABEL_9;
  }
  WebCore::Node::removedLastRef(v7);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v11, v6);
}

- (id)head
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  v3 = (WebCore::Node *)WebCore::Document::head(self->super.super._internal);
  CFStringRef v4 = kit(v3);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7, v5);
  return v4;
}

- (DOMHTMLCollection)images
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  MEMORY[0x1E4E48870](&v7, self->super.super._internal);
  CFStringRef v4 = (DOMHTMLCollection *)kit(v7);
  v5 = v7;
  v7 = 0;
  if (v5)
  {
    if (*((_DWORD *)v5 + 4) == 1) {
      (*(void (**)(DOMObjectInternal *))(*(void *)v5 + 8))(v5);
    }
    else {
      --*((_DWORD *)v5 + 4);
    }
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8, v3);
  return v4;
}

- (DOMHTMLCollection)applets
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WebCore::Document::applets((uint64_t *)&v7, self->super.super._internal);
  CFStringRef v4 = (DOMHTMLCollection *)kit(v7);
  v5 = v7;
  v7 = 0;
  if (v5)
  {
    if (*((_DWORD *)v5 + 4) == 1) {
      (*(void (**)(DOMObjectInternal *))(*(void *)v5 + 8))(v5);
    }
    else {
      --*((_DWORD *)v5 + 4);
    }
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8, v3);
  return v4;
}

- (DOMHTMLCollection)links
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  MEMORY[0x1E4E48820](&v7, self->super.super._internal);
  CFStringRef v4 = (DOMHTMLCollection *)kit(v7);
  v5 = v7;
  v7 = 0;
  if (v5)
  {
    if (*((_DWORD *)v5 + 4) == 1) {
      (*(void (**)(DOMObjectInternal *))(*(void *)v5 + 8))(v5);
    }
    else {
      --*((_DWORD *)v5 + 4);
    }
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8, v3);
  return v4;
}

- (DOMHTMLCollection)forms
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  MEMORY[0x1E4E48810](&v7, self->super.super._internal);
  CFStringRef v4 = (DOMHTMLCollection *)kit(v7);
  v5 = v7;
  v7 = 0;
  if (v5)
  {
    if (*((_DWORD *)v5 + 4) == 1) {
      (*(void (**)(DOMObjectInternal *))(*(void *)v5 + 8))(v5);
    }
    else {
      --*((_DWORD *)v5 + 4);
    }
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8, v3);
  return v4;
}

- (DOMHTMLCollection)anchors
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  MEMORY[0x1E4E48890](&v7, self->super.super._internal);
  CFStringRef v4 = (DOMHTMLCollection *)kit(v7);
  v5 = v7;
  v7 = 0;
  if (v5)
  {
    if (*((_DWORD *)v5 + 4) == 1) {
      (*(void (**)(DOMObjectInternal *))(*(void *)v5 + 8))(v5);
    }
    else {
      --*((_DWORD *)v5 + 4);
    }
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8, v3);
  return v4;
}

- (NSString)lastModified
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WebCore::Document::lastModified((uint64_t *)&v7, self->super.super._internal);
  if (v7)
  {
    CFStringRef v4 = (__CFString *)WTF::StringImpl::operator NSString *();
    v5 = v7;
    v7 = 0;
    if (v5)
    {
      if (*(_DWORD *)v5 == 2) {
        WTF::StringImpl::destroy(v5, v3);
      }
      else {
        *(_DWORD *)v5 -= 2;
      }
    }
  }
  else
  {
    CFStringRef v4 = &stru_1F3C7DA90;
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8, v3);
  return &v4->isa;
}

- (NSString)charset
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WebCore::Document::encoding((uint64_t *)&v9, self->super.super._internal);
  CFStringRef v4 = v9;
  if (v9)
  {
    int v5 = *(_DWORD *)v9;
    *(_DWORD *)v9 += 2;
    uint64_t v9 = 0;
    if (v5) {
      *(_DWORD *)CFStringRef v4 = v5;
    }
    else {
      WTF::StringImpl::destroy(v4, v3);
    }
    uint64_t v6 = (__CFString *)WTF::StringImpl::operator NSString *();
    if (*(_DWORD *)v4 == 2) {
      WTF::StringImpl::destroy(v4, v3);
    }
    else {
      *(_DWORD *)v4 -= 2;
    }
  }
  else
  {
    uint64_t v6 = &stru_1F3C7DA90;
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8, v3);
  return &v6->isa;
}

- (void)setCharset:(NSString *)charset
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10);
  internal = self->super.super._internal;
  MEMORY[0x1E4E442D0](&v9, charset);
  WebCore::Document::setCharset(internal, (const WTF::String *)&v9);
  v7 = v9;
  uint64_t v9 = 0;
  if (!v7) {
    goto LABEL_4;
  }
  if (*(_DWORD *)v7 != 2)
  {
    *(_DWORD *)v7 -= 2;
LABEL_4:
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10, v6);
    return;
  }
  WTF::StringImpl::destroy(v7, v6);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10, v8);
}

- (NSString)defaultCharset
{
  WebCore::Document::defaultCharsetForLegacyBindings((uint64_t *)&v6, self->super.super._internal);
  if (!v6) {
    return (NSString *)&stru_1F3C7DA90;
  }
  v3 = (NSString *)WTF::StringImpl::operator NSString *();
  CFStringRef v4 = v6;
  uint64_t v6 = 0;
  if (!v4) {
    return v3;
  }
  if (*(_DWORD *)v4 != 2)
  {
    *(_DWORD *)v4 -= 2;
    return v3;
  }
  WTF::StringImpl::destroy(v4, v2);
  return v3;
}

- (NSString)readyState
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  unint64_t v4 = *((char *)self->super.super._internal + 3411);
  if (v4 > 2) {
    int v5 = @"complete";
  }
  else {
    int v5 = off_1E6D97CA0[v4];
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7, v3);
  return &v5->isa;
}

- (NSString)characterSet
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WebCore::Document::characterSetWithUTF8Fallback((uint64_t *)&v7, self->super.super._internal);
  if (v7)
  {
    unint64_t v4 = (__CFString *)WTF::StringImpl::operator NSString *();
    int v5 = v7;
    v7 = 0;
    if (v5)
    {
      if (*(_DWORD *)v5 == 2) {
        WTF::StringImpl::destroy(v5, v3);
      }
      else {
        *(_DWORD *)v5 -= 2;
      }
    }
  }
  else
  {
    unint64_t v4 = &stru_1F3C7DA90;
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8, v3);
  return &v4->isa;
}

- (NSString)preferredStylesheetSet
{
  return 0;
}

- (NSString)selectedStylesheetSet
{
  return 0;
}

- (DOMElement)activeElement
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  active = (WebCore::Node *)WebCore::Document::activeElement(self->super.super._internal);
  unint64_t v4 = (DOMElement *)kit(active);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7, v5);
  return v4;
}

- (id)compatMode
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WebCore::Document::compatMode((uint64_t *)&v7, self->super.super._internal);
  if (v7)
  {
    unint64_t v4 = (__CFString *)WTF::StringImpl::operator NSString *();
    int v5 = v7;
    v7 = 0;
    if (v5)
    {
      if (*(_DWORD *)v5 == 2) {
        WTF::StringImpl::destroy(v5, v3);
      }
      else {
        *(_DWORD *)v5 -= 2;
      }
    }
  }
  else
  {
    unint64_t v4 = &stru_1F3C7DA90;
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8, v3);
  return v4;
}

- (BOOL)webkitIsFullScreen
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  uint64_t v4 = *((void *)self->super.super._internal + 254);
  if (!v4) {
    uint64_t v4 = WebCore::Document::ensureFullscreenManager(self->super.super._internal);
  }
  BOOL v5 = *(void *)(v4 + 56) != 0;
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7, v3);
  return v5;
}

- (BOOL)webkitFullScreenKeyboardInputAllowed
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  uint64_t v4 = *((void *)self->super.super._internal + 254);
  if (!v4) {
    uint64_t v4 = WebCore::Document::ensureFullscreenManager(self->super.super._internal);
  }
  if (*(void *)(v4 + 56)) {
    BOOL v5 = *(unsigned char *)(v4 + 129) != 0;
  }
  else {
    BOOL v5 = 0;
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7, v3);
  return v5;
}

- (id)webkitCurrentFullScreenElement
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9);
  internal = self->super.super._internal;
  uint64_t v4 = *((void *)internal + 254);
  if (!v4) {
    uint64_t v4 = WebCore::Document::ensureFullscreenManager(internal);
  }
  BOOL v5 = (WebCore::Node *)WebCore::TreeScope::ancestorElementInThisScope((DOMObjectInternal *)((char *)internal + 104), *(WebCore::Element **)(v4 + 56));
  uint64_t v6 = kit(v5);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9, v7);
  return v6;
}

- (BOOL)webkitFullscreenEnabled
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  v3 = (WebCore::FullscreenManager *)*((void *)self->super.super._internal + 254);
  if (!v3) {
    v3 = (WebCore::FullscreenManager *)WebCore::Document::ensureFullscreenManager(self->super.super._internal);
  }
  char isFullscreenEnabled = WebCore::FullscreenManager::isFullscreenEnabled(v3);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7, v5);
  return isFullscreenEnabled;
}

- (id)webkitFullscreenElement
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10);
  internal = self->super.super._internal;
  uint64_t v4 = (WebCore::FullscreenManager *)*((void *)internal + 254);
  if (!v4) {
    uint64_t v4 = (WebCore::FullscreenManager *)WebCore::Document::ensureFullscreenManager(internal);
  }
  BOOL v5 = (WebCore::Element *)WebCore::FullscreenManager::fullscreenElement(v4);
  uint64_t v6 = (WebCore::Node *)WebCore::TreeScope::ancestorElementInThisScope((DOMObjectInternal *)((char *)internal + 104), v5);
  v7 = kit(v6);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10, v8);
  return v7;
}

- (id)visibilityState
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6);
  if (WebCore::Document::visibilityState(self->super.super._internal)) {
    uint64_t v4 = @"visible";
  }
  else {
    uint64_t v4 = @"hidden";
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6, v3);
  return v4;
}

- (BOOL)hidden
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LOBYTE(self) = WebCore::Document::hidden(self->super.super._internal);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return (char)self;
}

- (id)currentScript
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9);
  internal = self->super.super._internal;
  uint64_t v5 = *((unsigned int *)internal + 415);
  if (v5
    && (uint64_t v6 = *(void *)(*((void *)internal + 206) + 8 * v5 - 8)) != 0
    && (*(_WORD *)(v6 + 32) & 0x10) != 0
    && *(void *)(*(void *)(v6 + 104) + 24) == *(void *)(*MEMORY[0x1E4FB6B00] + 24))
  {
    v7 = kit((WebCore::Node *)v6);
  }
  else
  {
    v7 = 0;
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9, v3);
  return v7;
}

- (id)origin
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9);
  v3 = (WebCore::SecurityOrigin *)WebCore::SecurityContext::securityOrigin((WebCore::SecurityContext *)((char *)self->super.super._internal + 208));
  WebCore::SecurityOrigin::toString((uint64_t *)&v8, v3);
  if (v8)
  {
    uint64_t v5 = (__CFString *)WTF::StringImpl::operator NSString *();
    uint64_t v6 = v8;
    char v8 = 0;
    if (v6)
    {
      if (*(_DWORD *)v6 == 2) {
        WTF::StringImpl::destroy(v6, v4);
      }
      else {
        *(_DWORD *)v6 -= 2;
      }
    }
  }
  else
  {
    uint64_t v5 = &stru_1F3C7DA90;
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9, v4);
  return v5;
}

- (id)scrollingElement
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  v3 = (WebCore::Node *)WebCore::Document::scrollingElementForAPI(self->super.super._internal);
  uint64_t v4 = kit(v3);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7, v5);
  return v4;
}

- (id)children
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WebCore::ContainerNode::children((uint64_t *)&v7, self->super.super._internal);
  id v4 = kit(v7);
  uint64_t v5 = v7;
  v7 = 0;
  if (v5)
  {
    if (*((_DWORD *)v5 + 4) == 1) {
      (*(void (**)(DOMObjectInternal *))(*(void *)v5 + 8))(v5);
    }
    else {
      --*((_DWORD *)v5 + 4);
    }
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8, v3);
  return v4;
}

- (id)firstElementChild
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  ElementChild = (WebCore::Node *)WebCore::ContainerNode::firstElementChild(self->super.super._internal);
  id v4 = kit(ElementChild);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7, v5);
  return v4;
}

- (id)lastElementChild
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  ElementChild = (WebCore::Node *)WebCore::ContainerNode::lastElementChild(self->super.super._internal);
  id v4 = kit(ElementChild);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7, v5);
  return v4;
}

- (unsigned)childElementCount
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LODWORD(self) = WebCore::ContainerNode::childElementCount(self->super.super._internal);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return self;
}

- (DOMElement)createElement:(NSString *)tagName
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v15);
  WTF::AtomStringImpl::add(v16, (WTF::AtomStringImpl *)tagName, v4);
  char v10 = (WTF::StringImpl *)v16[0];
  WebCore::Document::createElementForBindings();
  if (v13)
  {
    if (v13 == 1)
    {
      LOBYTE(v16[0]) = (_BYTE)v11;
      uint64_t v9 = v12;
      uint64_t v12 = 0;
      v16[1] = v9;
      raiseDOMErrorException();
    }
    result = (DOMElement *)std::__throw_bad_variant_access[abi:sn180100]();
    __break(1u);
  }
  else
  {
    uint64_t v5 = v11;
    uint64_t v11 = 0;
    uint64_t v14 = v5;
    v7 = (DOMElement *)kit(v5);
    if (v5)
    {
      if (*((_DWORD *)v5 + 7) == 2)
      {
        if ((*((_WORD *)v5 + 17) & 0x400) == 0) {
          WebCore::Node::removedLastRef(v5);
        }
      }
      else
      {
        *((_DWORD *)v5 + 7) -= 2;
      }
    }
    if (v13 != -1) {
      ((void (*)(uint64_t *, WebCore::Node **))off_1F3C7A018[v13])(v16, &v11);
    }
    int v13 = -1;
    if (v10)
    {
      if (*(_DWORD *)v10 == 2) {
        WTF::StringImpl::destroy(v10, v6);
      }
      else {
        *(_DWORD *)v10 -= 2;
      }
    }
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v15, v6);
    return v7;
  }
  return result;
}

- (DOMDocumentFragment)createDocumentFragment
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WebCore::Document::createDocumentFragment((uint64_t *)&v7, self->super.super._internal);
  CFStringRef v4 = (DOMDocumentFragment *)kit(v7);
  uint64_t v5 = v7;
  v7 = 0;
  if (v5)
  {
    if (*((_DWORD *)v5 + 7) == 2)
    {
      if ((*((_WORD *)v5 + 17) & 0x400) == 0) {
        WebCore::Node::removedLastRef(v5);
      }
    }
    else
    {
      *((_DWORD *)v5 + 7) -= 2;
    }
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8, v3);
  return v4;
}

- (DOMText)createTextNode:(NSString *)data
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v11);
  MEMORY[0x1E4E442D0](&v9, data);
  WebCore::Document::createTextNode();
  uint64_t v5 = (DOMText *)kit(v10);
  uint64_t v6 = v10;
  char v10 = 0;
  if (v6)
  {
    if (*((_DWORD *)v6 + 7) == 2)
    {
      if ((*((_WORD *)v6 + 17) & 0x400) == 0) {
        WebCore::Node::removedLastRef(v6);
      }
    }
    else
    {
      *((_DWORD *)v6 + 7) -= 2;
    }
  }
  v7 = v9;
  uint64_t v9 = 0;
  if (v7)
  {
    if (*(_DWORD *)v7 == 2) {
      WTF::StringImpl::destroy(v7, v4);
    }
    else {
      *(_DWORD *)v7 -= 2;
    }
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v11, v4);
  return v5;
}

- (DOMComment)createComment:(NSString *)data
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v11);
  MEMORY[0x1E4E442D0](&v9, data);
  WebCore::Document::createComment();
  uint64_t v5 = (DOMComment *)kit(v10);
  uint64_t v6 = v10;
  char v10 = 0;
  if (v6)
  {
    if (*((_DWORD *)v6 + 7) == 2)
    {
      if ((*((_WORD *)v6 + 17) & 0x400) == 0) {
        WebCore::Node::removedLastRef(v6);
      }
    }
    else
    {
      *((_DWORD *)v6 + 7) -= 2;
    }
  }
  v7 = v9;
  uint64_t v9 = 0;
  if (v7)
  {
    if (*(_DWORD *)v7 == 2) {
      WTF::StringImpl::destroy(v7, v4);
    }
    else {
      *(_DWORD *)v7 -= 2;
    }
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v11, v4);
  return v5;
}

- (DOMCDATASection)createCDATASection:(NSString *)data
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v15);
  MEMORY[0x1E4E442D0](&v10, data);
  WebCore::Document::createCDATASection();
  if (v13)
  {
    if (v13 == 1)
    {
      v16[0] = (_BYTE)v11;
      uint64_t v9 = v12;
      uint64_t v12 = 0;
      uint64_t v17 = v9;
      raiseDOMErrorException();
    }
    result = (DOMCDATASection *)std::__throw_bad_variant_access[abi:sn180100]();
    __break(1u);
  }
  else
  {
    CFStringRef v4 = v11;
    uint64_t v11 = 0;
    uint64_t v14 = v4;
    uint64_t v6 = (DOMCDATASection *)kit(v4);
    if (v4)
    {
      if (*((_DWORD *)v4 + 7) == 2)
      {
        if ((*((_WORD *)v4 + 17) & 0x400) == 0) {
          WebCore::Node::removedLastRef(v4);
        }
      }
      else
      {
        *((_DWORD *)v4 + 7) -= 2;
      }
    }
    if (v13 != -1) {
      ((void (*)(unsigned char *, WebCore::Node **))off_1F3C7A028[v13])(v16, &v11);
    }
    int v13 = -1;
    v7 = v10;
    char v10 = 0;
    if (v7)
    {
      if (*(_DWORD *)v7 == 2) {
        WTF::StringImpl::destroy(v7, v5);
      }
      else {
        *(_DWORD *)v7 -= 2;
      }
    }
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v15, v5);
    return v6;
  }
  return result;
}

- (DOMProcessingInstruction)createProcessingInstruction:(NSString *)target data:(NSString *)data
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v19);
  MEMORY[0x1E4E442D0](&v14, target);
  MEMORY[0x1E4E442D0](&v13, data);
  WebCore::Document::createProcessingInstruction();
  if (!v17)
  {
    uint64_t v6 = v15;
    uint64_t v15 = 0;
    v18 = v6;
    char v8 = (DOMProcessingInstruction *)kit(v6);
    if (v6)
    {
      if (*((_DWORD *)v6 + 7) == 2)
      {
        if ((*((_WORD *)v6 + 17) & 0x400) == 0) {
          WebCore::Node::removedLastRef(v6);
        }
      }
      else
      {
        *((_DWORD *)v6 + 7) -= 2;
      }
    }
    if (v17 != -1) {
      ((void (*)(unsigned char *, WebCore::Node **))off_1F3C7A038[v17])(v20, &v15);
    }
    int v17 = -1;
    uint64_t v9 = v13;
    int v13 = 0;
    if (v9)
    {
      if (*(_DWORD *)v9 == 2)
      {
        WTF::StringImpl::destroy(v9, v7);
        char v10 = v14;
        uint64_t v14 = 0;
        if (!v10)
        {
LABEL_18:
          WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v19, v7);
          return v8;
        }
LABEL_15:
        if (*(_DWORD *)v10 == 2) {
          WTF::StringImpl::destroy(v10, v7);
        }
        else {
          *(_DWORD *)v10 -= 2;
        }
        goto LABEL_18;
      }
      *(_DWORD *)v9 -= 2;
    }
    char v10 = v14;
    uint64_t v14 = 0;
    if (!v10) {
      goto LABEL_18;
    }
    goto LABEL_15;
  }
  if (v17 == 1)
  {
    v20[0] = (_BYTE)v15;
    uint64_t v12 = v16;
    uint64_t v16 = 0;
    uint64_t v21 = v12;
    raiseDOMErrorException();
  }
  result = (DOMProcessingInstruction *)std::__throw_bad_variant_access[abi:sn180100]();
  __break(1u);
  return result;
}

- (DOMAttr)createAttribute:(NSString *)name
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v15);
  WTF::AtomStringImpl::add(v16, (WTF::AtomStringImpl *)name, v4);
  char v10 = (WTF::StringImpl *)v16[0];
  WebCore::Document::createAttribute();
  if (v13)
  {
    if (v13 == 1)
    {
      LOBYTE(v16[0]) = (_BYTE)v11;
      uint64_t v9 = v12;
      uint64_t v12 = 0;
      v16[1] = v9;
      raiseDOMErrorException();
    }
    result = (DOMAttr *)std::__throw_bad_variant_access[abi:sn180100]();
    __break(1u);
  }
  else
  {
    uint64_t v5 = v11;
    uint64_t v11 = 0;
    uint64_t v14 = v5;
    v7 = (DOMAttr *)kit(v5);
    if (v5)
    {
      if (*((_DWORD *)v5 + 7) == 2)
      {
        if ((*((_WORD *)v5 + 17) & 0x400) == 0) {
          WebCore::Node::removedLastRef(v5);
        }
      }
      else
      {
        *((_DWORD *)v5 + 7) -= 2;
      }
    }
    if (v13 != -1) {
      ((void (*)(uint64_t *, WebCore::Node **))off_1F3C7A048[v13])(v16, &v11);
    }
    int v13 = -1;
    if (v10)
    {
      if (*(_DWORD *)v10 == 2) {
        WTF::StringImpl::destroy(v10, v6);
      }
      else {
        *(_DWORD *)v10 -= 2;
      }
    }
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v15, v6);
    return v7;
  }
  return result;
}

- (DOMEntityReference)createEntityReference:(NSString *)name
{
}

- (DOMNodeList)getElementsByTagName:(NSString *)tagname
{
  if (!tagname) {
    return 0;
  }
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v11);
  WTF::AtomStringImpl::add((uint64_t *)&v12, (WTF::AtomStringImpl *)tagname, v4);
  uint64_t v9 = v12;
  WebCore::ContainerNode::getElementsByTagName();
  uint64_t v6 = (DOMNodeList *)kit(v10);
  if (!v10)
  {
LABEL_5:
    v7 = v9;
    if (v9) {
      goto LABEL_6;
    }
    goto LABEL_10;
  }
  if (*((_DWORD *)v10 + 4) != 1)
  {
    --*((_DWORD *)v10 + 4);
    goto LABEL_5;
  }
  (*(void (**)())(*(void *)v10 + 8))();
  v7 = v9;
  if (v9)
  {
LABEL_6:
    if (*(_DWORD *)v7 == 2) {
      WTF::StringImpl::destroy(v7, v5);
    }
    else {
      *(_DWORD *)v7 -= 2;
    }
  }
LABEL_10:
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v11, v5);
  return v6;
}

- (DOMNode)importNode:(DOMNode *)importedNode deep:(BOOL)deep
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v15);
  if (!importedNode) {
    raiseTypeErrorException();
  }
  WebCore::Document::importNode(self->super.super._internal, importedNode->super._internal);
  if (v13)
  {
    if (v13 == 1)
    {
      v16[0] = (_BYTE)v11;
      uint64_t v10 = v12;
      uint64_t v12 = 0;
      uint64_t v17 = v10;
      raiseDOMErrorException();
    }
    result = (DOMNode *)std::__throw_bad_variant_access[abi:sn180100]();
    __break(1u);
  }
  else
  {
    uint64_t v6 = v11;
    uint64_t v11 = 0;
    uint64_t v14 = v6;
    char v8 = (DOMNode *)kit(v6);
    if (v6)
    {
      if (*((_DWORD *)v6 + 7) == 2)
      {
        if ((*((_WORD *)v6 + 17) & 0x400) == 0) {
          WebCore::Node::removedLastRef(v6);
        }
      }
      else
      {
        *((_DWORD *)v6 + 7) -= 2;
      }
    }
    if (v13 != -1) {
      ((void (*)(unsigned char *, WebCore::Node **))off_1F3C7A058[v13])(v16, &v11);
    }
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v15, v7);
    return v8;
  }
  return result;
}

- (DOMElement)createElementNS:(NSString *)namespaceURI qualifiedName:(NSString *)qualifiedName
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v20);
  WTF::AtomStringImpl::add(v21, (WTF::AtomStringImpl *)namespaceURI, v6);
  uint64_t v15 = (WTF::StringImpl *)v21[0];
  WTF::AtomStringImpl::add(v21, (WTF::AtomStringImpl *)qualifiedName, v7);
  uint64_t v14 = (WTF::StringImpl *)v21[0];
  WebCore::Document::createElementNS();
  if (!v18)
  {
    char v8 = v16;
    uint64_t v16 = 0;
    v19 = v8;
    uint64_t v10 = (DOMElement *)kit(v8);
    if (v8)
    {
      if (*((_DWORD *)v8 + 7) == 2)
      {
        if ((*((_WORD *)v8 + 17) & 0x400) == 0) {
          WebCore::Node::removedLastRef(v8);
        }
      }
      else
      {
        *((_DWORD *)v8 + 7) -= 2;
      }
    }
    if (v18 != -1) {
      ((void (*)(uint64_t *, WebCore::Node **))off_1F3C7A018[v18])(v21, &v16);
    }
    int v18 = -1;
    if (v14)
    {
      if (*(_DWORD *)v14 == 2)
      {
        WTF::StringImpl::destroy(v14, v9);
        uint64_t v11 = v15;
        if (!v15)
        {
LABEL_18:
          WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v20, v9);
          return v10;
        }
LABEL_15:
        if (*(_DWORD *)v11 == 2) {
          WTF::StringImpl::destroy(v11, v9);
        }
        else {
          *(_DWORD *)v11 -= 2;
        }
        goto LABEL_18;
      }
      *(_DWORD *)v14 -= 2;
    }
    uint64_t v11 = v15;
    if (!v15) {
      goto LABEL_18;
    }
    goto LABEL_15;
  }
  if (v18 == 1)
  {
    LOBYTE(v21[0]) = (_BYTE)v16;
    uint64_t v13 = v17;
    uint64_t v17 = 0;
    v21[1] = v13;
    raiseDOMErrorException();
  }
  result = (DOMElement *)std::__throw_bad_variant_access[abi:sn180100]();
  __break(1u);
  return result;
}

- (DOMAttr)createAttributeNS:(NSString *)namespaceURI qualifiedName:(NSString *)qualifiedName
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v20);
  WTF::AtomStringImpl::add(v21, (WTF::AtomStringImpl *)namespaceURI, v6);
  uint64_t v15 = (WTF::StringImpl *)v21[0];
  WTF::AtomStringImpl::add(v21, (WTF::AtomStringImpl *)qualifiedName, v7);
  uint64_t v14 = (WTF::StringImpl *)v21[0];
  WebCore::Document::createAttributeNS();
  if (!v18)
  {
    char v8 = v16;
    uint64_t v16 = 0;
    v19 = v8;
    uint64_t v10 = (DOMAttr *)kit(v8);
    if (v8)
    {
      if (*((_DWORD *)v8 + 7) == 2)
      {
        if ((*((_WORD *)v8 + 17) & 0x400) == 0) {
          WebCore::Node::removedLastRef(v8);
        }
      }
      else
      {
        *((_DWORD *)v8 + 7) -= 2;
      }
    }
    if (v18 != -1) {
      ((void (*)(uint64_t *, WebCore::Node **))off_1F3C7A048[v18])(v21, &v16);
    }
    int v18 = -1;
    if (v14)
    {
      if (*(_DWORD *)v14 == 2)
      {
        WTF::StringImpl::destroy(v14, v9);
        uint64_t v11 = v15;
        if (!v15)
        {
LABEL_18:
          WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v20, v9);
          return v10;
        }
LABEL_15:
        if (*(_DWORD *)v11 == 2) {
          WTF::StringImpl::destroy(v11, v9);
        }
        else {
          *(_DWORD *)v11 -= 2;
        }
        goto LABEL_18;
      }
      *(_DWORD *)v14 -= 2;
    }
    uint64_t v11 = v15;
    if (!v15) {
      goto LABEL_18;
    }
    goto LABEL_15;
  }
  if (v18 == 1)
  {
    LOBYTE(v21[0]) = (_BYTE)v16;
    uint64_t v13 = v17;
    uint64_t v17 = 0;
    v21[1] = v13;
    raiseDOMErrorException();
  }
  result = (DOMAttr *)std::__throw_bad_variant_access[abi:sn180100]();
  __break(1u);
  return result;
}

- (DOMNodeList)getElementsByTagNameNS:(NSString *)namespaceURI localName:(NSString *)localName
{
  if (!localName) {
    return 0;
  }
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v15);
  WTF::AtomStringImpl::add((uint64_t *)&v16, (WTF::AtomStringImpl *)namespaceURI, v6);
  uint64_t v13 = v16;
  WTF::AtomStringImpl::add((uint64_t *)&v16, (WTF::AtomStringImpl *)localName, v7);
  uint64_t v12 = v16;
  WebCore::ContainerNode::getElementsByTagNameNS();
  uint64_t v9 = (DOMNodeList *)kit(v14);
  if (!v14)
  {
LABEL_5:
    uint64_t v10 = v12;
    if (v12) {
      goto LABEL_6;
    }
    goto LABEL_10;
  }
  if (*((_DWORD *)v14 + 4) != 1)
  {
    --*((_DWORD *)v14 + 4);
    goto LABEL_5;
  }
  (*(void (**)())(*(void *)v14 + 8))();
  uint64_t v10 = v12;
  if (v12)
  {
LABEL_6:
    if (*(_DWORD *)v10 == 2) {
      WTF::StringImpl::destroy(v10, v8);
    }
    else {
      *(_DWORD *)v10 -= 2;
    }
  }
LABEL_10:
  if (v13)
  {
    if (*(_DWORD *)v13 == 2) {
      WTF::StringImpl::destroy(v13, v8);
    }
    else {
      *(_DWORD *)v13 -= 2;
    }
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v15, v8);
  return v9;
}

- (DOMNode)adoptNode:(DOMNode *)source
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v14);
  if (!source) {
    raiseTypeErrorException();
  }
  WebCore::Document::adoptNode((uint64_t *)&v10, self->super.super._internal, source->super._internal);
  if (v12)
  {
    if (v12 == 1)
    {
      v15[0] = (_BYTE)v10;
      uint64_t v9 = v11;
      uint64_t v11 = 0;
      uint64_t v16 = v9;
      raiseDOMErrorException();
    }
    result = (DOMNode *)std::__throw_bad_variant_access[abi:sn180100]();
    __break(1u);
  }
  else
  {
    uint64_t v5 = v10;
    uint64_t v10 = 0;
    uint64_t v13 = v5;
    CFStringRef v7 = (DOMNode *)kit(v5);
    if (v5)
    {
      if (*((_DWORD *)v5 + 7) == 2)
      {
        if ((*((_WORD *)v5 + 17) & 0x400) == 0) {
          WebCore::Node::removedLastRef(v5);
        }
      }
      else
      {
        *((_DWORD *)v5 + 7) -= 2;
      }
    }
    if (v12 != -1) {
      ((void (*)(unsigned char *, WebCore::Node **))off_1F3C7A058[v12])(v15, &v10);
    }
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v14, v6);
    return v7;
  }
  return result;
}

- (DOMEvent)createEvent:(NSString *)eventType
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v17);
  internal = self->super.super._internal;
  MEMORY[0x1E4E442D0](&v13, eventType);
  WebCore::Document::createEvent((uint64_t *)&v14, internal, (const WTF::String *)&v13);
  if (!v16)
  {
    CFStringRef v6 = v14;
    uint64_t v14 = 0;
    char v8 = (DOMEvent *)kit(v6);
    if (v6)
    {
      if (*((_DWORD *)v6 + 4) == 1)
      {
        (*(void (**)(DOMObjectInternal *))(*(void *)v6 + 8))(v6);
        uint64_t v9 = v16;
        if (v16 == -1) {
          goto LABEL_7;
        }
        goto LABEL_6;
      }
      --*((_DWORD *)v6 + 4);
    }
    uint64_t v9 = v16;
    if (v16 == -1)
    {
LABEL_7:
      unsigned int v16 = -1;
      uint64_t v10 = v13;
      uint64_t v13 = 0;
      if (v10)
      {
        if (*(_DWORD *)v10 == 2) {
          WTF::StringImpl::destroy(v10, v7);
        }
        else {
          *(_DWORD *)v10 -= 2;
        }
      }
      WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v17, v7);
      return v8;
    }
LABEL_6:
    ((void (*)(char *, DOMObjectInternal **))off_1F3C7A068[v9])(v18, &v14);
    goto LABEL_7;
  }
  if (v16 == 1)
  {
    v18[0] = (char)v14;
    uint64_t v12 = v15;
    uint64_t v15 = 0;
    uint64_t v19 = v12;
    raiseDOMErrorException();
  }
  result = (DOMEvent *)std::__throw_bad_variant_access[abi:sn180100]();
  __break(1u);
  return result;
}

- (DOMRange)createRange
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  MEMORY[0x1E4E484F0](&v7, self->super.super._internal);
  CFStringRef v4 = kit(v7);
  uint64_t v5 = v7;
  CFStringRef v7 = 0;
  if (v5)
  {
    if (*((_DWORD *)v5 + 2) == 1) {
      (*(void (**)(WebCore::Range *))(*(void *)v5 + 8))(v5);
    }
    else {
      --*((_DWORD *)v5 + 2);
    }
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8, v3);
  return (DOMRange *)v4;
}

- (DOMNodeIterator)createNodeIterator:(DOMNode *)root whatToShow:(unsigned int)whatToShow filter:(id)filter expandEntityReferences:(BOOL)expandEntityReferences
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v18);
  if (!root) {
    raiseTypeErrorException();
  }
  if (filter)
  {
    uint64_t v8 = WTF::fastMalloc((WTF *)0x18);
    *(_DWORD *)(v8 + 8) = 1;
    *(void *)uint64_t v8 = &unk_1F3C7A3B8;
    *(void *)(v8 + 16) = filter;
    CFRetain(filter);
    uint64_t v17 = (WebCore::NodeIterator *)v8;
    uint64_t v9 = (_DWORD *)WTF::fastMalloc((WTF *)0x20);
    WebCore::NativeNodeFilter::NativeNodeFilter();
    uint64_t v10 = v17;
    unsigned int v16 = 0;
    if (v10)
    {
      if (*((_DWORD *)v10 + 2) == 1) {
        (*(void (**)(WebCore::NodeIterator *))(*(void *)v10 + 8))(v10);
      }
      else {
        --*((_DWORD *)v10 + 2);
      }
    }
    ++v9[4];
  }
  else
  {
    uint64_t v9 = 0;
  }
  WebCore::Document::createNodeIterator();
  uint64_t v12 = (DOMNodeIterator *)kit(v16);
  if (v16)
  {
    if (*((_DWORD *)v16 + 2) == 1)
    {
      uint64_t v15 = MEMORY[0x1E4E44DC0]();
      MEMORY[0x1E4E44DD0](v15);
      uint64_t v13 = v9;
      if (!v9) {
        goto LABEL_16;
      }
      goto LABEL_13;
    }
    --*((_DWORD *)v16 + 2);
  }
  uint64_t v13 = v9;
  if (!v9) {
    goto LABEL_16;
  }
LABEL_13:
  if (v13[4] == 1) {
    (*(void (**)(_DWORD *))(*(void *)v13 + 16))(v13);
  }
  else {
    --v13[4];
  }
LABEL_16:
  if (filter)
  {
    if (v9[4] == 1) {
      (*(void (**)(_DWORD *))(*(void *)v9 + 16))(v9);
    }
    else {
      --v9[4];
    }
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v18, v11);
  return v12;
}

- (DOMTreeWalker)createTreeWalker:(DOMNode *)root whatToShow:(unsigned int)whatToShow filter:(id)filter expandEntityReferences:(BOOL)expandEntityReferences
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v16);
  if (!root) {
    raiseTypeErrorException();
  }
  if (filter)
  {
    uint64_t v8 = WTF::fastMalloc((WTF *)0x18);
    *(_DWORD *)(v8 + 8) = 1;
    *(void *)uint64_t v8 = &unk_1F3C7A3B8;
    *(void *)(v8 + 16) = filter;
    CFRetain(filter);
    uint64_t v15 = (WebCore::TreeWalker *)v8;
    uint64_t v9 = (_DWORD *)WTF::fastMalloc((WTF *)0x20);
    WebCore::NativeNodeFilter::NativeNodeFilter();
    uint64_t v10 = v15;
    uint64_t v14 = 0;
    if (v10)
    {
      if (*((_DWORD *)v10 + 2) == 1) {
        (*(void (**)(WebCore::TreeWalker *))(*(void *)v10 + 8))(v10);
      }
      else {
        --*((_DWORD *)v10 + 2);
      }
    }
    ++v9[4];
  }
  else
  {
    uint64_t v9 = 0;
  }
  WebCore::Document::createTreeWalker();
  uint64_t v12 = kit(v14);
  if (v14) {
    WTF::RefCounted<WebCore::TreeWalker>::deref((void *)v14 + 1);
  }
  if (v9)
  {
    if (v9[4] == 1)
    {
      (*(void (**)(_DWORD *))(*(void *)v9 + 16))(v9);
      if (!filter) {
        goto LABEL_20;
      }
      goto LABEL_17;
    }
    --v9[4];
  }
  if (!filter) {
    goto LABEL_20;
  }
LABEL_17:
  if (v9[4] == 1) {
    (*(void (**)(_DWORD *))(*(void *)v9 + 16))(v9);
  }
  else {
    --v9[4];
  }
LABEL_20:
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v16, v11);
  return (DOMTreeWalker *)v12;
}

- (DOMCSSStyleDeclaration)getOverrideStyle:(DOMElement *)element pseudoElement:(NSString *)pseudoElement
{
  return 0;
}

- (DOMXPathExpression)createExpression:(NSString *)expression resolver:(id)resolver
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v22);
  MEMORY[0x1E4E442D0](&v17, expression);
  if (resolver)
  {
    if ([resolver isMemberOfClass:objc_opt_class()])
    {
      uint64_t v6 = *((void *)resolver + 2);
      if (v6) {
        ++*(_DWORD *)(v6 + 8);
      }
    }
    else
    {
      uint64_t v6 = WTF::fastMalloc((WTF *)0x18);
      *(_DWORD *)(v6 + 8) = 1;
      *(void *)uint64_t v6 = &unk_1F3C79FC0;
      *(void *)(v6 + 16) = resolver;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }
  unsigned int v16 = (_DWORD *)v6;
  WebCore::Document::createExpression();
  if (!v20)
  {
    CFStringRef v7 = v18;
    int v18 = 0;
    uint64_t v21 = v7;
    uint64_t v9 = kit(v7);
    if (v7)
    {
      if (*(_DWORD *)v7 == 1)
      {
        WebCore::XPathExpression::~XPathExpression(v7);
        WTF::fastFree(v13, v14);
        uint64_t v10 = v20;
        if (v20 == -1)
        {
LABEL_13:
          unsigned int v20 = -1;
          if (v16)
          {
            if (v16[2] == 1)
            {
              (*(void (**)(_DWORD *))(*(void *)v16 + 8))(v16);
              uint64_t v11 = v17;
              uint64_t v17 = 0;
              if (!v11)
              {
LABEL_22:
                WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v22, v8);
                return (DOMXPathExpression *)v9;
              }
LABEL_19:
              if (*(_DWORD *)v11 == 2) {
                WTF::StringImpl::destroy(v11, v8);
              }
              else {
                *(_DWORD *)v11 -= 2;
              }
              goto LABEL_22;
            }
            --v16[2];
          }
          uint64_t v11 = v17;
          uint64_t v17 = 0;
          if (!v11) {
            goto LABEL_22;
          }
          goto LABEL_19;
        }
LABEL_12:
        ((void (*)(unsigned char *, WebCore::XPathExpression **))off_1F3C7A078[v10])(v23, &v18);
        goto LABEL_13;
      }
      --*(_DWORD *)v7;
    }
    uint64_t v10 = v20;
    if (v20 == -1) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v20 == 1)
  {
    v23[0] = (_BYTE)v18;
    uint64_t v15 = v19;
    uint64_t v19 = 0;
    uint64_t v24 = v15;
    raiseDOMErrorException();
  }
  result = (DOMXPathExpression *)std::__throw_bad_variant_access[abi:sn180100]();
  __break(1u);
  return result;
}

- (id)createNSResolver:(DOMNode *)nodeResolver
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10);
  if (nodeResolver)
  {
    WebCore::Document::createNSResolver((uint64_t *)&v9, self->super.super._internal, nodeResolver->super._internal);
    uint64_t v6 = kit(v9);
    CFStringRef v7 = v9;
    uint64_t v9 = 0;
    if (v7)
    {
      if (*((_DWORD *)v7 + 2) == 1) {
        (*(void (**)(WebCore::XPathNSResolver *))(*(void *)v7 + 8))(v7);
      }
      else {
        --*((_DWORD *)v7 + 2);
      }
    }
  }
  else
  {
    uint64_t v6 = 0;
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10, v5);
  return v6;
}

- (DOMXPathResult)evaluate:(NSString *)expression contextNode:(DOMNode *)contextNode resolver:(id)resolver type:(unsigned __int16)type inResult:(DOMXPathResult *)inResult
{
  if (!contextNode) {
    return 0;
  }
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v26);
  MEMORY[0x1E4E442D0](&v21, expression);
  if (!resolver)
  {
    uint64_t v9 = 0;
LABEL_8:
    unsigned int v20 = v9;
    goto LABEL_10;
  }
  if ([resolver isMemberOfClass:objc_opt_class()])
  {
    uint64_t v9 = (_DWORD *)*((void *)resolver + 2);
    if (v9)
    {
      ++v9[2];
      unsigned int v20 = v9;
      goto LABEL_10;
    }
    goto LABEL_8;
  }
  uint64_t v11 = WTF::fastMalloc((WTF *)0x18);
  *(_DWORD *)(v11 + 8) = 1;
  *(void *)uint64_t v11 = &unk_1F3C79FC0;
  *(void *)(v11 + 16) = resolver;
  unsigned int v20 = (_DWORD *)v11;
LABEL_10:
  WebCore::Document::evaluate();
  if (!v24)
  {
    uint64_t v12 = v22;
    v22 = 0;
    v25 = v12;
    uint64_t v10 = kit(v12);
    if (v12)
    {
      if (*(_DWORD *)v12 == 1)
      {
        uint64_t v17 = (WTF *)MEMORY[0x1E4E44B30](v12);
        WTF::fastFree(v17, v18);
        uint64_t v14 = v24;
        if (v24 == -1)
        {
LABEL_16:
          unsigned int v24 = -1;
          if (v20)
          {
            if (v20[2] == 1)
            {
              (*(void (**)(_DWORD *))(*(void *)v20 + 8))(v20);
              uint64_t v15 = v21;
              uint64_t v21 = 0;
              if (!v15)
              {
LABEL_25:
                WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v26, v13);
                return (DOMXPathResult *)v10;
              }
LABEL_22:
              if (*(_DWORD *)v15 == 2) {
                WTF::StringImpl::destroy(v15, v13);
              }
              else {
                *(_DWORD *)v15 -= 2;
              }
              goto LABEL_25;
            }
            --v20[2];
          }
          uint64_t v15 = v21;
          uint64_t v21 = 0;
          if (!v15) {
            goto LABEL_25;
          }
          goto LABEL_22;
        }
LABEL_15:
        ((void (*)(unsigned char *, WebCore::XPathResult **))off_1F3C7A088[v14])(v27, &v22);
        goto LABEL_16;
      }
      --*(_DWORD *)v12;
    }
    uint64_t v14 = v24;
    if (v24 == -1) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
  if (v24 == 1)
  {
    v27[0] = (_BYTE)v22;
    uint64_t v19 = v23;
    uint64_t v23 = 0;
    uint64_t v28 = v19;
    raiseDOMErrorException();
  }
  result = (DOMXPathResult *)std::__throw_bad_variant_access[abi:sn180100]();
  __break(1u);
  return result;
}

- (BOOL)execCommand:(NSString *)command userInterface:(BOOL)userInterface value:(NSString *)value
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v17);
  MEMORY[0x1E4E442D0](&v14, command);
  MEMORY[0x1E4E442D0](v12, value);
  int v13 = 0;
  WebCore::Document::execCommand();
  if (v13 != -1) {
    ((void (*)(char *, unsigned char *))off_1F3C7A098[v13])(&v18, v12);
  }
  uint64_t v8 = v14;
  uint64_t v14 = 0;
  if (v8)
  {
    if (*(_DWORD *)v8 == 2)
    {
      WTF::StringImpl::destroy(v8, v7);
      BOOL v9 = 0;
      uint64_t v10 = v16;
      if (v16 == -1) {
        goto LABEL_12;
      }
      goto LABEL_9;
    }
    *(_DWORD *)v8 -= 2;
  }
  BOOL v9 = 0;
  uint64_t v10 = v16;
  if (v16 == -1) {
    goto LABEL_12;
  }
LABEL_9:
  if (!v10) {
    BOOL v9 = v15[0] != 0;
  }
  ((void (*)(unsigned char *, unsigned char *))off_1F3C7A0A8[v10])(v12, v15);
LABEL_12:
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v17, v7);
  return v9;
}

- (BOOL)execCommand:(NSString *)command userInterface:(BOOL)userInterface
{
  return [(DOMDocument *)self execCommand:command userInterface:userInterface value:0];
}

- (BOOL)execCommand:(NSString *)command
{
  return [(DOMDocument *)self execCommand:command userInterface:0 value:0];
}

- (BOOL)queryCommandEnabled:(NSString *)command
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v14);
  internal = self->super.super._internal;
  MEMORY[0x1E4E442D0](&v11, command);
  WebCore::Document::queryCommandEnabled(v12, internal, (const WTF::String *)&v11);
  CFStringRef v7 = v11;
  uint64_t v11 = 0;
  if (v7)
  {
    if (*(_DWORD *)v7 == 2)
    {
      WTF::StringImpl::destroy(v7, v6);
      BOOL v8 = 0;
      uint64_t v9 = v13;
      if (v13 == -1) {
        goto LABEL_10;
      }
      goto LABEL_7;
    }
    *(_DWORD *)v7 -= 2;
  }
  BOOL v8 = 0;
  uint64_t v9 = v13;
  if (v13 == -1) {
    goto LABEL_10;
  }
LABEL_7:
  if (!v9) {
    BOOL v8 = LOBYTE(v12[0]) != 0;
  }
  ((void (*)(WTF::StringImpl **, uint64_t *))off_1F3C7A0A8[v9])(&v11, v12);
LABEL_10:
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v14, v6);
  return v8;
}

- (BOOL)queryCommandIndeterm:(NSString *)command
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v14);
  internal = self->super.super._internal;
  MEMORY[0x1E4E442D0](&v11, command);
  WebCore::Document::queryCommandIndeterm(v12, internal, (const WTF::String *)&v11);
  CFStringRef v7 = v11;
  uint64_t v11 = 0;
  if (v7)
  {
    if (*(_DWORD *)v7 == 2)
    {
      WTF::StringImpl::destroy(v7, v6);
      BOOL v8 = 0;
      uint64_t v9 = v13;
      if (v13 == -1) {
        goto LABEL_10;
      }
      goto LABEL_7;
    }
    *(_DWORD *)v7 -= 2;
  }
  BOOL v8 = 0;
  uint64_t v9 = v13;
  if (v13 == -1) {
    goto LABEL_10;
  }
LABEL_7:
  if (!v9) {
    BOOL v8 = LOBYTE(v12[0]) != 0;
  }
  ((void (*)(WTF::StringImpl **, uint64_t *))off_1F3C7A0A8[v9])(&v11, v12);
LABEL_10:
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v14, v6);
  return v8;
}

- (BOOL)queryCommandState:(NSString *)command
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v14);
  internal = self->super.super._internal;
  MEMORY[0x1E4E442D0](&v11, command);
  WebCore::Document::queryCommandState(v12, internal, (const WTF::String *)&v11);
  CFStringRef v7 = v11;
  uint64_t v11 = 0;
  if (v7)
  {
    if (*(_DWORD *)v7 == 2)
    {
      WTF::StringImpl::destroy(v7, v6);
      BOOL v8 = 0;
      uint64_t v9 = v13;
      if (v13 == -1) {
        goto LABEL_10;
      }
      goto LABEL_7;
    }
    *(_DWORD *)v7 -= 2;
  }
  BOOL v8 = 0;
  uint64_t v9 = v13;
  if (v13 == -1) {
    goto LABEL_10;
  }
LABEL_7:
  if (!v9) {
    BOOL v8 = LOBYTE(v12[0]) != 0;
  }
  ((void (*)(WTF::StringImpl **, uint64_t *))off_1F3C7A0A8[v9])(&v11, v12);
LABEL_10:
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v14, v6);
  return v8;
}

- (BOOL)queryCommandSupported:(NSString *)command
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v14);
  internal = self->super.super._internal;
  MEMORY[0x1E4E442D0](&v11, command);
  WebCore::Document::queryCommandSupported(v12, internal, (const WTF::String *)&v11);
  CFStringRef v7 = v11;
  uint64_t v11 = 0;
  if (v7)
  {
    if (*(_DWORD *)v7 == 2)
    {
      WTF::StringImpl::destroy(v7, v6);
      BOOL v8 = 0;
      uint64_t v9 = v13;
      if (v13 == -1) {
        goto LABEL_10;
      }
      goto LABEL_7;
    }
    *(_DWORD *)v7 -= 2;
  }
  BOOL v8 = 0;
  uint64_t v9 = v13;
  if (v13 == -1) {
    goto LABEL_10;
  }
LABEL_7:
  if (!v9) {
    BOOL v8 = LOBYTE(v12[0]) != 0;
  }
  ((void (*)(WTF::StringImpl **, uint64_t *))off_1F3C7A0A8[v9])(&v11, v12);
LABEL_10:
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v14, v6);
  return v8;
}

- (NSString)queryCommandValue:(NSString *)command
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v15);
  internal = self->super.super._internal;
  MEMORY[0x1E4E442D0](&v12, command);
  WebCore::Document::queryCommandValue(v13, internal, (const WTF::String *)&v12);
  CFStringRef v7 = v12;
  uint64_t v12 = 0;
  if (!v7)
  {
LABEL_4:
    int v8 = v14;
    if (v14) {
      goto LABEL_5;
    }
    goto LABEL_8;
  }
  if (*(_DWORD *)v7 != 2)
  {
    *(_DWORD *)v7 -= 2;
    goto LABEL_4;
  }
  WTF::StringImpl::destroy(v7, v6);
  int v8 = v14;
  if (v14)
  {
LABEL_5:
    uint64_t v9 = &stru_1F3C7DA90;
    if (v8 == -1) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
LABEL_8:
  uint64_t v10 = (WTF::StringImpl *)v13[0];
  if (!v13[0])
  {
    int v8 = 0;
    uint64_t v9 = &stru_1F3C7DA90;
    goto LABEL_13;
  }
  *(_DWORD *)v13[0] += 2;
  uint64_t v9 = (__CFString *)WTF::StringImpl::operator NSString *();
  if (*(_DWORD *)v10 != 2)
  {
    *(_DWORD *)v10 -= 2;
    int v8 = v14;
    if (v14 == -1) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  WTF::StringImpl::destroy(v10, v6);
  int v8 = v14;
  if (v14 != -1) {
LABEL_13:
  }
    ((void (*)(WTF::StringImpl **, uint64_t *))off_1F3C7A008[v8])(&v12, v13);
LABEL_14:
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v15, v6);
  return &v9->isa;
}

- (DOMNodeList)getElementsByName:(NSString *)elementName
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v11);
  WTF::AtomStringImpl::add((uint64_t *)&v12, (WTF::AtomStringImpl *)elementName, v4);
  uint64_t v9 = v12;
  WebCore::Document::getElementsByName();
  uint64_t v6 = (DOMNodeList *)kit(v10);
  if (!v10)
  {
LABEL_4:
    CFStringRef v7 = v9;
    if (!v9) {
      goto LABEL_8;
    }
    goto LABEL_5;
  }
  if (*((_DWORD *)v10 + 4) != 1)
  {
    --*((_DWORD *)v10 + 4);
    goto LABEL_4;
  }
  (*(void (**)())(*(void *)v10 + 8))();
  CFStringRef v7 = v9;
  if (!v9) {
    goto LABEL_8;
  }
LABEL_5:
  if (*(_DWORD *)v7 == 2) {
    WTF::StringImpl::destroy(v7, v5);
  }
  else {
    *(_DWORD *)v7 -= 2;
  }
LABEL_8:
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v11, v5);
  return v6;
}

- (DOMElement)elementFromPoint:(int)x y:(int)y
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WebCore::TreeScope::elementFromPoint();
  uint64_t v5 = (DOMElement *)kit(v7);
  if (v7)
  {
    if (*((_DWORD *)v7 + 7) == 2)
    {
      if ((*((_WORD *)v7 + 17) & 0x400) == 0) {
        WebCore::Node::removedLastRef(v7);
      }
    }
    else
    {
      *((_DWORD *)v7 + 7) -= 2;
    }
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8, v4);
  return v5;
}

- (id)caretRangeFromPoint:(int)a3 y:(int)a4
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WebCore::Document::caretRangeFromPoint();
  uint64_t v5 = kit(v7);
  if (v7)
  {
    if (*((_DWORD *)v7 + 2) == 1) {
      (*(void (**)())(*(void *)v7 + 8))();
    }
    else {
      --*((_DWORD *)v7 + 2);
    }
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8, v4);
  return v5;
}

- (DOMCSSStyleDeclaration)createCSSStyleDeclaration
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WebCore::Document::createCSSStyleDeclaration((uint64_t *)&v7, self->super.super._internal);
  CFStringRef v4 = (DOMCSSStyleDeclaration *)kit(v7);
  uint64_t v5 = v7;
  CFStringRef v7 = 0;
  if (v5) {
    (*(void (**)(DOMObjectInternal *))(*(void *)v5 + 24))(v5);
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8, v3);
  return v4;
}

- (DOMCSSStyleDeclaration)getComputedStyle:(DOMElement *)element pseudoElement:(NSString *)pseudoElement
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v15);
  if (!element) {
    raiseTypeErrorException();
  }
  int v8 = (DOMObjectInternal *)*((void *)self->super.super._internal + 91);
  if (v8)
  {
    internal = element->super.super._internal;
    if ((*((_WORD *)internal + 16) & 8) == 0)
    {
      __break(0xC471u);
      JUMPOUT(0x1E1386ACCLL);
    }
    MEMORY[0x1E4E442D0](&v13, pseudoElement);
    WebCore::LocalDOMWindow::getComputedStyle((uint64_t *)&v14, v8, internal, (const WTF::String *)&v13);
    int v8 = kit(v14);
    uint64_t v10 = v14;
    int v14 = 0;
    if (v10) {
      (*(void (**)(DOMObjectInternal *))(*(void *)v10 + 24))(v10);
    }
    uint64_t v11 = v13;
    unsigned int v13 = 0;
    if (v11)
    {
      if (*(_DWORD *)v11 == 2) {
        WTF::StringImpl::destroy(v11, v7);
      }
      else {
        *(_DWORD *)v11 -= 2;
      }
    }
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v15, v7);
  return (DOMCSSStyleDeclaration *)v8;
}

- (DOMCSSRuleList)getMatchedCSSRules:(DOMElement *)element pseudoElement:(NSString *)pseudoElement
{
  return [(DOMDocument *)self getMatchedCSSRules:element pseudoElement:pseudoElement authorOnly:1];
}

- (DOMCSSRuleList)getMatchedCSSRules:(DOMElement *)element pseudoElement:(NSString *)pseudoElement authorOnly:(BOOL)authorOnly
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v16);
  uint64_t v9 = (WebCore::LocalDOMWindow *)*((void *)self->super.super._internal + 91);
  if (!v9)
  {
    uint64_t v10 = 0;
LABEL_11:
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v16, v8);
    return v10;
  }
  if (!element
    || (element = (DOMElement *)element->super.super._internal, ((uint64_t)element[1].super.super.super._private & 8) != 0))
  {
    MEMORY[0x1E4E442D0](&v14, pseudoElement);
    WebCore::LocalDOMWindow::getMatchedCSSRules(v9, (WebCore::Element *)element, (const WTF::String *)&v14);
    uint64_t v10 = (DOMCSSRuleList *)kit(v15);
    uint64_t v11 = v15;
    uint64_t v15 = 0;
    if (v11) {
      (*(void (**)(DOMObjectInternal *))(*(void *)v11 + 24))(v11);
    }
    uint64_t v12 = v14;
    int v14 = 0;
    if (v12)
    {
      if (*(_DWORD *)v12 == 2) {
        WTF::StringImpl::destroy(v12, v8);
      }
      else {
        *(_DWORD *)v12 -= 2;
      }
    }
    goto LABEL_11;
  }
  result = (DOMCSSRuleList *)96;
  __break(0xC471u);
  return result;
}

- (DOMNodeList)getElementsByClassName:(NSString *)classNames
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v11);
  WTF::AtomStringImpl::add((uint64_t *)&v12, (WTF::AtomStringImpl *)classNames, v4);
  uint64_t v9 = v12;
  WebCore::ContainerNode::getElementsByClassName();
  uint64_t v6 = (DOMNodeList *)kit(v10);
  if (!v10)
  {
LABEL_4:
    CFStringRef v7 = v9;
    if (!v9) {
      goto LABEL_8;
    }
    goto LABEL_5;
  }
  if (*((_DWORD *)v10 + 4) != 1)
  {
    --*((_DWORD *)v10 + 4);
    goto LABEL_4;
  }
  (*(void (**)())(*(void *)v10 + 8))();
  CFStringRef v7 = v9;
  if (!v9) {
    goto LABEL_8;
  }
LABEL_5:
  if (*(_DWORD *)v7 == 2) {
    WTF::StringImpl::destroy(v7, v5);
  }
  else {
    *(_DWORD *)v7 -= 2;
  }
LABEL_8:
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v11, v5);
  return v6;
}

- (BOOL)hasFocus
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LOBYTE(self) = WebCore::Document::hasFocus(self->super.super._internal);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return (char)self;
}

- (void)webkitCancelFullScreen
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  v3 = (WebCore::FullscreenManager *)*((void *)self->super.super._internal + 254);
  if (!v3) {
    v3 = (WebCore::FullscreenManager *)WebCore::Document::ensureFullscreenManager(self->super.super._internal);
  }
  WebCore::FullscreenManager::cancelFullscreen(v3);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v4);
}

- (void)webkitExitFullscreen
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  WebCore::DocumentFullscreen::webkitExitFullscreen(self->super.super._internal, v3);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v4);
}

- (DOMElement)getElementById:(NSString *)elementId
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10);
  WTF::AtomStringImpl::add((uint64_t *)&v11, (WTF::AtomStringImpl *)elementId, v4);
  int v8 = v11;
  WebCore::TreeScope::getElementById();
  uint64_t v6 = (DOMElement *)kit(v9);
  if (v9)
  {
    if (*((_DWORD *)v9 + 7) == 2)
    {
      if ((*((_WORD *)v9 + 17) & 0x400) == 0) {
        WebCore::Node::removedLastRef(v9);
      }
    }
    else
    {
      *((_DWORD *)v9 + 7) -= 2;
    }
  }
  if (v8)
  {
    if (*(_DWORD *)v8 == 2) {
      WTF::StringImpl::destroy(v8, v5);
    }
    else {
      *(_DWORD *)v8 -= 2;
    }
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10, v5);
  return v6;
}

- (DOMElement)querySelector:(NSString *)selectors
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v15);
  internal = self->super.super._internal;
  MEMORY[0x1E4E442D0](&v11, selectors);
  WebCore::ContainerNode::querySelector((uint64_t *)&v12, internal, (const WTF::String *)&v11);
  if (v14)
  {
    if (v14 == 1)
    {
      v16[0] = (_BYTE)v12;
      uint64_t v10 = v13;
      uint64_t v13 = 0;
      uint64_t v17 = v10;
      raiseDOMErrorException();
    }
    result = (DOMElement *)std::__throw_bad_variant_access[abi:sn180100]();
    __break(1u);
  }
  else
  {
    CFStringRef v7 = (DOMElement *)kit(v12);
    if (v14 != -1) {
      ((void (*)(unsigned char *, WebCore::Node **))off_1F3C7A0B8[v14])(v16, &v12);
    }
    int v14 = -1;
    int v8 = v11;
    uint64_t v11 = 0;
    if (v8)
    {
      if (*(_DWORD *)v8 == 2) {
        WTF::StringImpl::destroy(v8, v6);
      }
      else {
        *(_DWORD *)v8 -= 2;
      }
    }
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v15, v6);
    return v7;
  }
  return result;
}

- (DOMNodeList)querySelectorAll:(NSString *)selectors
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v17);
  internal = self->super.super._internal;
  MEMORY[0x1E4E442D0](&v13, selectors);
  WebCore::ContainerNode::querySelectorAll((uint64_t *)&v14, internal, (const WTF::String *)&v13);
  if (!v16)
  {
    uint64_t v6 = v14;
    int v14 = 0;
    int v8 = (DOMNodeList *)kit(v6);
    if (v6)
    {
      if (*((_DWORD *)v6 + 4) == 1)
      {
        (*(void (**)(DOMObjectInternal *))(*(void *)v6 + 8))(v6);
        uint64_t v9 = v16;
        if (v16 == -1) {
          goto LABEL_7;
        }
        goto LABEL_6;
      }
      --*((_DWORD *)v6 + 4);
    }
    uint64_t v9 = v16;
    if (v16 == -1)
    {
LABEL_7:
      unsigned int v16 = -1;
      uint64_t v10 = v13;
      uint64_t v13 = 0;
      if (v10)
      {
        if (*(_DWORD *)v10 == 2) {
          WTF::StringImpl::destroy(v10, v7);
        }
        else {
          *(_DWORD *)v10 -= 2;
        }
      }
      WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v17, v7);
      return v8;
    }
LABEL_6:
    ((void (*)(char *, DOMObjectInternal **))off_1F3C7A0C8[v9])(v18, &v14);
    goto LABEL_7;
  }
  if (v16 == 1)
  {
    v18[0] = (char)v14;
    uint64_t v12 = v15;
    uint64_t v15 = 0;
    uint64_t v19 = v12;
    raiseDOMErrorException();
  }
  result = (DOMNodeList *)std::__throw_bad_variant_access[abi:sn180100]();
  __break(1u);
  return result;
}

- (DOMCSSStyleDeclaration)getOverrideStyle:(DOMElement *)element :(NSString *)pseudoElement
{
  return 0;
}

- (WebFrame)webFrame
{
  uint64_t v2 = *((void *)self->super.super._internal + 68);
  if (v2
    && (uint64_t v3 = *(void *)(v2 + 8)) != 0
    && (CFStringRef v4 = *(WebFrame ***)(*(void *)(v3 + 280) + 16),
        (((uint64_t (*)(WebFrame **, SEL))(*v4)[67].super.isa)(v4, a2) & 1) == 0))
  {
    return v4[2];
  }
  else
  {
    return 0;
  }
}

- (NSURL)URLWithAttributeString:(NSString *)string
{
  MEMORY[0x1E4E442D0](&v8, string);
  WebCore::Document::completeURL();
  CFStringRef v4 = (NSURL *)WTF::URL::operator NSURL *();
  uint64_t v5 = v9;
  uint64_t v9 = 0;
  if (!v5)
  {
LABEL_4:
    uint64_t v6 = v8;
    int v8 = 0;
    if (!v6) {
      return v4;
    }
    goto LABEL_7;
  }
  if (*(_DWORD *)v5 != 2)
  {
    *(_DWORD *)v5 -= 2;
    goto LABEL_4;
  }
  WTF::StringImpl::destroy(v5, v3);
  uint64_t v6 = v8;
  int v8 = 0;
  if (!v6) {
    return v4;
  }
LABEL_7:
  if (*(_DWORD *)v6 != 2)
  {
    *(_DWORD *)v6 -= 2;
    return v4;
  }
  WTF::StringImpl::destroy(v6, v3);
  return v4;
}

- (id)_documentRange
{
  uint64_t v3 = [(DOMDocument *)self createRange];
  CFStringRef v4 = [(DOMDocument *)self documentElement];
  if (v4) {
    [(DOMRange *)v3 selectNode:v4];
  }
  return v3;
}

@end