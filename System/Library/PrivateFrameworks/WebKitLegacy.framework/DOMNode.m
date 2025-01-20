@interface DOMNode
+ (id)_nodeFromJSWrapper:(OpaqueJSValue *)a3;
- (BOOL)contains:(DOMNode *)other;
- (BOOL)containsOnlyInlineObjects;
- (BOOL)dispatchEvent:(id)a3;
- (BOOL)hasAttributes;
- (BOOL)hasChildNodes;
- (BOOL)isConnected;
- (BOOL)isContentEditable;
- (BOOL)isDefaultNamespace:(NSString *)namespaceURI;
- (BOOL)isEqualNode:(DOMNode *)other;
- (BOOL)isHorizontalWritingMode;
- (BOOL)isSameNode:(DOMNode *)other;
- (BOOL)isSelectableBlock;
- (BOOL)isSupported:(NSString *)feature version:(NSString *)version;
- (CGRect)_renderRect:(BOOL *)a3;
- (CGRect)boundingBoxUsingTransforms;
- (CGRect)hrefFrame;
- (DOMDocument)ownerDocument;
- (DOMElement)parentElement;
- (DOMNamedNodeMap)attributes;
- (DOMNode)appendChild:(DOMNode *)newChild;
- (DOMNode)cloneNode:(BOOL)deep;
- (DOMNode)firstChild;
- (DOMNode)insertBefore:(DOMNode *)newChild refChild:(DOMNode *)refChild;
- (DOMNode)lastChild;
- (DOMNode)nextSibling;
- (DOMNode)parentNode;
- (DOMNode)previousSibling;
- (DOMNode)removeChild:(DOMNode *)oldChild;
- (DOMNode)replaceChild:(DOMNode *)newChild oldChild:(DOMNode *)oldChild;
- (DOMNodeList)childNodes;
- (NSRect)boundingBox;
- (NSString)baseURI;
- (NSString)description;
- (NSString)localName;
- (NSString)lookupNamespaceURI:(NSString *)prefix;
- (NSString)lookupPrefix:(NSString *)namespaceURI;
- (NSString)namespaceURI;
- (NSString)nodeName;
- (NSString)nodeValue;
- (NSString)prefix;
- (NSString)textContent;
- (RootObject)_rootObject;
- (WebArchive)webArchive;
- (_WKQuad)absoluteQuad;
- (_WKQuad)absoluteQuadAndInsideFixedPosition:(SEL)a3;
- (_WKQuad)innerFrameQuad;
- (double)textHeight;
- (float)computedFontSize;
- (id)absoluteQuads;
- (id)borderRadii;
- (id)boundingBoxes;
- (id)endPosition;
- (id)findExplodedTextNodeAtPoint:(CGPoint)a3;
- (id)hrefLabel;
- (id)hrefTarget;
- (id)hrefTitle;
- (id)hrefURL;
- (id)lineBoxQuads;
- (id)markupString;
- (id)nextFocusNode;
- (id)previousFocusNode;
- (id)rangeOfContainingParagraph;
- (id)rangeOfContents;
- (id)startPosition;
- (id)textRects;
- (id)webArchiveByFilteringSubframes:(id)a3;
- (unsigned)compareDocumentPosition:(DOMNode *)other;
- (unsigned)nodeType;
- (void)_linkElement;
- (void)addEventListener:(id)a3 :(id)a4 :(BOOL)a5;
- (void)addEventListener:(id)a3 listener:(id)a4 useCapture:(BOOL)a5;
- (void)dealloc;
- (void)getPreviewSnapshotImage:(CGImage *)a3 andRects:(id *)a4;
- (void)hidePlaceholder;
- (void)inspect;
- (void)normalize;
- (void)removeEventListener:(id)a3 :(id)a4 :(BOOL)a5;
- (void)removeEventListener:(id)a3 listener:(id)a4 useCapture:(BOOL)a5;
- (void)setNodeValue:(NSString *)nodeValue;
- (void)setPrefix:(NSString *)prefix;
- (void)setTextContent:(NSString *)textContent;
- (void)showPlaceholderIfNecessary;
@end

@implementation DOMNode

- (NSString)description
{
  if (!self->super._internal) {
    return (NSString *)[NSString stringWithFormat:@"<%@: null>", objc_msgSend((id)objc_opt_class(), "description"), v8, v9, v10];
  }
  v3 = [(DOMNode *)self nodeValue];
  v4 = NSString;
  uint64_t v5 = [(id)objc_opt_class() description];
  v6 = [(DOMNode *)self nodeName];
  if (v3) {
    return (NSString *)[v4 stringWithFormat:@"<%@ [%@]: %p '%@'>", v5, v6, self->super._internal, v3];
  }
  else {
    return (NSString *)[v4 stringWithFormat:@"<%@ [%@]: %p>", v5, v6, self->super._internal, v10];
  }
}

- (RootObject)_rootObject
{
  uint64_t v2 = *(void *)(*(void *)(*((void *)self->super._internal + 6) + 8) + 544);
  if (v2 && (uint64_t v3 = *(void *)(v2 + 8)) != 0) {
    return (RootObject *)WebCore::ScriptController::bindingRootObject(*(WebCore::ScriptController **)(v3 + 304));
  }
  else {
    return 0;
  }
}

- (NSRect)boundingBox
{
  internal = self->super._internal;
  WebCore::Document::updateLayout();
  uint64_t v3 = (WebCore::RenderObject *)(*((void *)internal + 9) & 0xFFFFFFFFFFFFLL);
  if (v3)
  {
    WebCore::RenderObject::absoluteBoundingBoxRect(v3, 1, 0);
    WebCore::IntRect::operator CGRect();
  }
  else
  {
    double v4 = *MEMORY[0x1E4F1DB28];
    double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (_WKQuad)absoluteQuad
{
  if (self) {
    return (_WKQuad *)[(_WKQuad *)self absoluteQuadAndInsideFixedPosition:0];
  }
  retstr->p3 = 0u;
  retstr->p4 = 0u;
  retstr->p1 = 0u;
  retstr->p2 = 0u;
  return self;
}

- (_WKQuad)absoluteQuadAndInsideFixedPosition:(SEL)a3
{
  internal = self->super._internal;
  WebCore::Document::updateLayout();
  NSRect result = (_WKQuad *)(*((void *)internal + 9) & 0xFFFFFFFFFFFFLL);
  if (result)
  {
    v26 = 0;
    uint64_t v27 = 0;
    BOOL v25 = 0;
    (*(void (**)(_WKQuad *, WTF **, BOOL *))(*(void *)&result->p1.x + 392))(result, &v26, &v25);
    if (a4) {
      *a4 = v25;
    }
    if (HIDWORD(v27) == 1)
    {
      WebCore::FloatPoint::operator CGPoint();
      retstr->p1.x = v11;
      retstr->p1.y = v12;
      WebCore::FloatPoint::operator CGPoint();
      retstr->p2.x = v13;
      retstr->p2.y = v14;
      WebCore::FloatPoint::operator CGPoint();
      retstr->p3.x = v15;
      retstr->p3.y = v16;
      WebCore::FloatPoint::operator CGPoint();
    }
    else
    {
      if (!HIDWORD(v27))
      {
        CGPoint v9 = (CGPoint)*MEMORY[0x1E4F1DAD8];
        retstr->p1 = (CGPoint)*MEMORY[0x1E4F1DAD8];
        retstr->p2 = v9;
        retstr->p3 = v9;
        retstr->p4 = v9;
        NSRect result = (_WKQuad *)v26;
        if (!v26) {
          return result;
        }
LABEL_14:
        v26 = 0;
        LODWORD(v27) = 0;
        return (_WKQuad *)WTF::fastFree((WTF *)result, v8);
      }
      WebCore::unitedBoundingBoxes();
      WebCore::FloatPoint::operator CGPoint();
      retstr->p1.x = v19;
      retstr->p1.y = v20;
      WebCore::FloatPoint::operator CGPoint();
      retstr->p2.x = v21;
      retstr->p2.y = v22;
      WebCore::FloatPoint::operator CGPoint();
      retstr->p3.x = v23;
      retstr->p3.y = v24;
      WebCore::FloatPoint::operator CGPoint();
    }
    retstr->p4.x = v17;
    retstr->p4.y = v18;
    NSRect result = (_WKQuad *)v26;
    if (v26) {
      goto LABEL_14;
    }
  }
  else
  {
    if (a4) {
      *a4 = 0;
    }
    CGPoint v10 = (CGPoint)*MEMORY[0x1E4F1DAD8];
    retstr->p1 = (CGPoint)*MEMORY[0x1E4F1DAD8];
    retstr->p2 = v10;
    retstr->p3 = v10;
    retstr->p4 = v10;
  }
  return result;
}

- (CGRect)boundingBoxUsingTransforms
{
  internal = self->super._internal;
  WebCore::Document::updateLayout();
  uint64_t v3 = (WebCore::RenderObject *)(*((void *)internal + 9) & 0xFFFFFFFFFFFFLL);
  if (v3)
  {
    WebCore::RenderObject::absoluteBoundingBoxRect(v3, 1, 0);
    WebCore::IntRect::operator CGRect();
  }
  else
  {
    double v4 = *MEMORY[0x1E4F1DB28];
    double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (id)lineBoxQuads
{
  internal = self->super._internal;
  WebCore::Document::updateLayout();
  uint64_t v3 = *((void *)internal + 9) & 0xFFFFFFFFFFFFLL;
  if (!v3) {
    return 0;
  }
  CGFloat v23 = 0;
  uint64_t v24 = 0;
  (*(void (**)(uint64_t, WTF **, void))(*(void *)v3 + 392))(v3, &v23, 0);
  id v4 = objc_alloc(MEMORY[0x1E4F1CA48]);
  double v5 = (void *)[v4 initWithCapacity:HIDWORD(v24)];
  if (HIDWORD(v24))
  {
    double v6 = v23;
    double v7 = (WTF *)((char *)v23 + 32 * HIDWORD(v24));
    do
    {
      uint64_t v8 = [WKQuadObject alloc];
      WebCore::FloatPoint::operator CGPoint();
      v25[0] = v9;
      v25[1] = v10;
      WebCore::FloatPoint::operator CGPoint();
      v25[2] = v11;
      v25[3] = v12;
      WebCore::FloatPoint::operator CGPoint();
      v25[4] = v13;
      v25[5] = v14;
      CGFloat v15 = (char *)v6 + 24;
      WebCore::FloatPoint::operator CGPoint();
      v25[6] = v16;
      v25[7] = v17;
      CGFloat v18 = [(WKQuadObject *)v8 initWithQuad:v25];
      if (v18)
      {
        [v5 addObject:v18];
        CFRelease(v18);
      }
      double v6 = (WTF *)(v15 + 8);
    }
    while (v6 != v7);
  }
  CFTypeRef v20 = (id)CFMakeCollectable(v5);
  CGFloat v21 = v23;
  if (v23)
  {
    CGFloat v23 = 0;
    LODWORD(v24) = 0;
    WTF::fastFree(v21, v19);
  }
  return (id)v20;
}

- (void)_linkElement
{
  if (self)
  {
    for (self = (void *)*((void *)self + 2); self; self = (void *)*((void *)self + 5))
    {
      if (*((_WORD *)self + 16) & 8) != 0 && (*((_WORD *)self + 17)) {
        break;
      }
    }
  }
  return self;
}

- (id)hrefURL
{
  if (![(DOMNode *)self _linkElement]) {
    return 0;
  }
  WebCore::Element::getAttribute();
  WebCore::Document::completeURL();
  uint64_t v3 = (void *)WTF::URL::operator NSURL *();
  if (!v5) {
    return v3;
  }
  if (*(_DWORD *)v5 != 2)
  {
    *(_DWORD *)v5 -= 2;
    return v3;
  }
  WTF::StringImpl::destroy(v5, v2);
  return v3;
}

- (id)hrefTarget
{
  id result = [(DOMNode *)self _linkElement];
  if (result)
  {
    if (*(void *)WebCore::Element::getAttribute())
    {
      return (id)WTF::StringImpl::operator NSString *();
    }
    else
    {
      return &stru_1F3C7DA90;
    }
  }
  return result;
}

- (CGRect)hrefFrame
{
  uint64_t v2 = [(DOMNode *)self _linkElement];
  if (v2 && (double v7 = (WebCore::RenderObject *)(v2[9] & 0xFFFFFFFFFFFFLL)) != 0)
  {
    if ((*((unsigned char *)v7 + 45) & 2) != 0)
    {
      __break(0xC471u);
    }
    else
    {
      WebCore::RenderObject::absoluteBoundingBoxRect(v7, 1, 0);
      WebCore::IntRect::operator CGRect();
    }
  }
  else
  {
    double v3 = *MEMORY[0x1E4F1DB28];
    double v4 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (id)hrefLabel
{
  uint64_t v2 = [(DOMNode *)self _linkElement];
  if (!v2) {
    return 0;
  }
  WebCore::Node::textContent(v2);
  if (!v6) {
    return &stru_1F3C7DA90;
  }
  double v4 = (void *)WTF::StringImpl::operator NSString *();
  if (*(_DWORD *)v6 == 2)
  {
    WTF::StringImpl::destroy(v6, v3);
    return v4;
  }
  else
  {
    *(_DWORD *)v6 -= 2;
    return v4;
  }
}

- (id)hrefTitle
{
  uint64_t v2 = [(DOMNode *)self _linkElement];
  if (!v2 || (v2[16] & 0x10) == 0) {
    return 0;
  }
  double v5 = *(WebCore::Document **)(*((void *)v2 + 6) + 8);
  WebCore::HTMLElement::title((uint64_t *)&v9, (WebCore::HTMLElement *)v2);
  WebCore::Document::displayStringModifiedByEncoding((uint64_t *)&v10, v5, (const WTF::String *)&v9);
  if (v10)
  {
    double v3 = (__CFString *)WTF::StringImpl::operator NSString *();
    double v7 = v10;
    uint64_t v10 = 0;
    if (v7)
    {
      if (*(_DWORD *)v7 == 2)
      {
        WTF::StringImpl::destroy(v7, v6);
        uint64_t v8 = v9;
        uint64_t v9 = 0;
        if (!v8) {
          return v3;
        }
      }
      else
      {
        *(_DWORD *)v7 -= 2;
        uint64_t v8 = v9;
        uint64_t v9 = 0;
        if (!v8) {
          return v3;
        }
      }
      goto LABEL_12;
    }
  }
  else
  {
    uint64_t v10 = 0;
    double v3 = &stru_1F3C7DA90;
  }
  uint64_t v8 = v9;
  uint64_t v9 = 0;
  if (!v8) {
    return v3;
  }
LABEL_12:
  if (*(_DWORD *)v8 == 2) {
    WTF::StringImpl::destroy(v8, v6);
  }
  else {
    *(_DWORD *)v8 -= 2;
  }
  return v3;
}

- (_WKQuad)innerFrameQuad
{
  internal = self->super._internal;
  WebCore::Document::updateLayout();
  CGRect result = (_WKQuad *)(*((void *)internal + 9) & 0xFFFFFFFFFFFFLL);
  if (result)
  {
    WebCore::RenderObject::absoluteBoundingBoxRect((WebCore::RenderObject *)result, 1, 0);
    WebCore::FloatRect::FloatRect();
    WebCore::FloatPoint::operator CGPoint();
    retstr->p1.x = v7;
    retstr->p1.y = v8;
    WebCore::FloatPoint::operator CGPoint();
    retstr->p2.x = v9;
    retstr->p2.y = v10;
    WebCore::FloatPoint::operator CGPoint();
    retstr->p3.x = v11;
    retstr->p3.y = v12;
    CGRect result = (_WKQuad *)WebCore::FloatPoint::operator CGPoint();
    retstr->p4.x = v13;
    retstr->p4.y = v14;
  }
  else
  {
    CGPoint v6 = (CGPoint)*MEMORY[0x1E4F1DAD8];
    retstr->p1 = (CGPoint)*MEMORY[0x1E4F1DAD8];
    retstr->p2 = v6;
    retstr->p3 = v6;
    retstr->p4 = v6;
  }
  return result;
}

- (float)computedFontSize
{
  uint64_t v2 = *((void *)self->super._internal + 9) & 0xFFFFFFFFFFFFLL;
  if (!v2) {
    return 0.0;
  }
  if ((*(unsigned char *)((*((void *)self->super._internal + 9) & 0xFFFFFFFFFFFFLL) + 0x2D) & 2) != 0)
  {
    uint64_t v2 = *(void *)((*((void *)self->super._internal + 9) & 0xFFFFFFFFFFFFLL) + 0x20);
    if (v2) {
      uint64_t v2 = *(void *)(v2 + 8);
    }
  }
  return *(float *)(WebCore::RenderStyle::fontDescription((WebCore::RenderStyle *)(v2 + 80)) + 156);
}

- (id)nextFocusNode
{
  internal = self->super._internal;
  uint64_t v3 = *(void *)(*(void *)(*((void *)internal + 6) + 8) + 544);
  if (!v3) {
    return 0;
  }
  uint64_t v4 = *(void *)(v3 + 8);
  if (!v4) {
    return 0;
  }
  uint64_t v5 = *(void *)(v4 + 24);
  if (!v5) {
    return 0;
  }
  uint64_t v6 = *(void *)(v5 + 8);
  if (!v6) {
    return 0;
  }
  FocusableElement = (WebCore::Node *)WebCore::FocusController::nextFocusableElement(*(WebCore::FocusController **)(v6 + 72), (Node *)internal);
  return kit(FocusableElement);
}

- (id)previousFocusNode
{
  internal = self->super._internal;
  uint64_t v3 = *(void *)(*(void *)(*((void *)internal + 6) + 8) + 544);
  if (!v3) {
    return 0;
  }
  uint64_t v4 = *(void *)(v3 + 8);
  if (!v4) {
    return 0;
  }
  uint64_t v5 = *(void *)(v4 + 24);
  if (!v5) {
    return 0;
  }
  uint64_t v6 = *(void *)(v5 + 8);
  if (!v6) {
    return 0;
  }
  CGFloat v7 = (WebCore::Node *)WebCore::FocusController::previousFocusableElement(*(WebCore::FocusController **)(v6 + 72), (Node *)internal);
  return kit(v7);
}

- (id)textRects
{
  internal = self->super._internal;
  WebCore::Document::updateLayout();
  if ((*((void *)internal + 9) & 0xFFFFFFFFFFFFLL) == 0) {
    return 0;
  }
  WebCore::makeRangeSelectingNodeContents((uint64_t *)&v15, internal, v3);
  WebCore::RenderObject::absoluteTextRects();
  id v4 = objc_alloc(MEMORY[0x1E4F1CA48]);
  uint64_t v5 = (void *)[v4 initWithCapacity:v19];
  if (v19)
  {
    uint64_t v6 = v17;
    uint64_t v7 = 16 * v19;
    do
    {
      uint64_t NSArrayElement = WebCore::makeNSArrayElement();
      if (NSArrayElement) {
        [v5 addObject:NSArrayElement];
      }
      uint64_t v6 = (WTF *)((char *)v6 + 16);
      v7 -= 16;
    }
    while (v7);
  }
  CFTypeRef v10 = (id)CFMakeCollectable(v5);
  CGFloat v11 = v17;
  if (v17)
  {
    uint64_t v17 = 0;
    int v18 = 0;
    WTF::fastFree(v11, v9);
  }
  CGFloat v12 = v16;
  uint64_t v16 = 0;
  if (v12)
  {
    if (*((_DWORD *)v12 + 7) == 2)
    {
      if ((*((_WORD *)v12 + 17) & 0x400) == 0) {
        WebCore::Node::removedLastRef(v12);
      }
    }
    else
    {
      *((_DWORD *)v12 + 7) -= 2;
    }
  }
  CGFloat v14 = v15;
  CGFloat v15 = 0;
  if (!v14) {
    return (id)v10;
  }
  if (*((_DWORD *)v14 + 7) != 2)
  {
    *((_DWORD *)v14 + 7) -= 2;
    return (id)v10;
  }
  if ((*((_WORD *)v14 + 17) & 0x400) != 0) {
    return (id)v10;
  }
  WebCore::Node::removedLastRef(v14);
  return (id)v10;
}

+ (id)_nodeFromJSWrapper:(OpaqueJSValue *)a3
{
  if (*((unsigned __int8 *)a3 + 5) < 0xF0u) {
    return 0;
  }
  else {
    return kit(*((WebCore::Node **)a3 + 3));
  }
}

- (void)getPreviewSnapshotImage:(CGImage *)a3 andRects:(id *)a4
{
  v64[1] = *MEMORY[0x1E4F143B8];
  if (!a3 || !a4) {
    return;
  }
  *a3 = 0;
  *a4 = 0;
  if (self) {
    internal = self->super._internal;
  }
  else {
    internal = 0;
  }
  float v7 = *(float *)(*(void *)(*(void *)(*(void *)(*(void *)(*(void *)(*((void *)internal + 6) + 8) + 544)
                                                    + 8)
                                        + 24)
                            + 8)
                + 356);
  WebCore::makeRangeSelectingNodeContents((uint64_t *)v61, internal, (Node *)a2);
  *(float *)v8.i32 = 4.0 / v7;
  int32x2_t v54 = v8;
  WebCore::TextIndicator::createWithRange();
  CGFloat v9 = v62;
  v62 = 0;
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
  Ref = v61[0];
  v61[0] = 0;
  if (Ref)
  {
    if (*((_DWORD *)Ref + 7) == 2)
    {
      if ((*((_WORD *)Ref + 17) & 0x400) == 0) {
        Ref = (WebCore::Node *)WebCore::Node::removedLastRef(Ref);
      }
    }
    else
    {
      *((_DWORD *)Ref + 7) -= 2;
    }
  }
  if (v57)
  {
    uint64_t v11 = *((void *)v57 + 12);
    if (v11)
    {
      uint64_t v12 = WebCore::DestinationColorSpace::SRGB(Ref);
      (*(void (**)(WebCore::Node **__return_ptr, uint64_t, uint64_t))(*(void *)v11 + 288))(v61, v11, v12);
      CGFloat v13 = (CFTypeRef *)WebCore::NativeImage::platformImage(v61[0]);
      CGFloat v15 = (void *)*v13;
      if (*v13) {
        CFRetain(*v13);
      }
      uint64_t v16 = v61[0];
      v61[0] = 0;
      if (!v16)
      {
LABEL_29:
        if (v15) {
          CFAutorelease(v15);
        }
        *a3 = (CGImage *)v15;
        if (!v15) {
          goto LABEL_32;
        }
LABEL_37:
        float32x2_t v27 = *(float32x2_t *)((char *)v57 + 24);
        v28 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:*((unsigned int *)v57 + 17)];
        uint64_t v29 = *((unsigned int *)v57 + 17);
        if (v29)
        {
          uint64_t v30 = *((void *)v57 + 7);
          float64x2_t v55 = vcvtq_f64_f32(v27);
          uint64_t v31 = 16 * v29;
          do
          {
            WebCore::FloatRect::operator CGRect();
            v62 = v32;
            uint64_t v63 = v33;
            v35.f64[1] = v34;
            *(float64x2_t *)v61 = vaddq_f64(v35, v55);
            *(void *)&long long v58 = WebCore::enclosingIntRect((WebCore *)v61, v36);
            *((void *)&v58 + 1) = v37;
            uint64_t v59 = WebCore::ScrollView::contentsToWindow();
            unint64_t v60 = v38;
            uint64_t NSArrayElement = WebCore::makeNSArrayElement();
            if (NSArrayElement) {
              [v28 addObject:NSArrayElement];
            }
            v30 += 16;
            v31 -= 16;
          }
          while (v31);
        }
        v40 = (id)CFMakeCollectable(v28);
        goto LABEL_45;
      }
      char v17 = 0;
      uint64_t v18 = *((void *)v16 + 1);
      atomic_compare_exchange_strong_explicit((atomic_uchar *volatile)v18, (unsigned __int8 *)&v17, 1u, memory_order_acquire, memory_order_acquire);
      if (v17)
      {
        MEMORY[0x1E4E44220](v18);
        int v19 = 1;
        uint64_t v20 = *(void *)(v18 + 8) - 1;
        *(void *)(v18 + 8) = v20;
        if (v20)
        {
LABEL_23:
          uint64_t v21 = 0;
          BOOL v22 = 1;
          atomic_compare_exchange_strong_explicit((atomic_uchar *volatile)v18, (unsigned __int8 *)&v19, 0, memory_order_release, memory_order_relaxed);
          if (v19 == 1) {
            goto LABEL_24;
          }
          goto LABEL_53;
        }
      }
      else
      {
        int v19 = 1;
        uint64_t v20 = *(void *)(v18 + 8) - 1;
        *(void *)(v18 + 8) = v20;
        if (v20) {
          goto LABEL_23;
        }
      }
      uint64_t v51 = *(void *)(v18 + 16);
      uint64_t v21 = *(void *)(v18 + 24);
      *(void *)(v18 + 24) = 0;
      BOOL v22 = v51 != 0;
      atomic_compare_exchange_strong_explicit((atomic_uchar *volatile)v18, (unsigned __int8 *)&v19, 0, memory_order_release, memory_order_relaxed);
      if (v19 == 1)
      {
LABEL_24:
        if (v20) {
          goto LABEL_29;
        }
LABEL_25:
        if (v21) {
          (*(void (**)(uint64_t))(*(void *)v21 + 8))(v21);
        }
        if (!v22) {
          WTF::fastFree((WTF *)v18, v14);
        }
        goto LABEL_29;
      }
LABEL_53:
      uint64_t v52 = v20;
      uint64_t v53 = v21;
      WTF::Lock::unlockSlow((WTF::Lock *)v18);
      uint64_t v21 = v53;
      if (v52) {
        goto LABEL_29;
      }
      goto LABEL_25;
    }
  }
  if (*a3) {
    goto LABEL_37;
  }
LABEL_32:
  CGFloat v23 = (WebCore::RenderBox *)(*((void *)internal + 9) & 0xFFFFFFFFFFFFLL);
  if (!v23) {
    goto LABEL_46;
  }
  if ((*(unsigned char *)((*((void *)internal + 9) & 0xFFFFFFFFFFFFLL) + 0x34) & 7) == 3
    && (*(unsigned char *)((*((void *)internal + 9) & 0xFFFFFFFFFFFFLL) + 0x35) & 1) != 0)
  {
    WebCore::RenderBox::absoluteContentQuad((uint64_t *)v61, v23);
    WebCore::FloatQuad::boundingBox((WebCore::FloatQuad *)v61);
    uint64_t v59 = __PAIR64__(v42, v41);
    unint64_t v60 = __PAIR64__(v44, v43);
    WebCore::enclosingIntRect((WebCore *)&v59, v45);
    WebCore::FloatRect::FloatRect();
    long long v26 = v56;
  }
  else
  {
    uint64_t v59 = WebCore::RenderObject::absoluteBoundingBoxRect(v23, 1, 0);
    unint64_t v60 = v24;
    WebCore::FloatRect::FloatRect();
    long long v26 = *(_OWORD *)v61;
  }
  long long v58 = v26;
  float32x2_t v46 = (float32x2_t)vdup_lane_s32(v54, 0);
  *(float32x2_t *)&long long v58 = vsub_f32(*(float32x2_t *)&v58, v46);
  *((float32x2_t *)&v58 + 1) = vadd_f32(v46, vadd_f32(v46, *(float32x2_t *)((char *)&v58 + 8)));
  uint64_t v59 = WebCore::enclosingIntRect((WebCore *)&v58, v25);
  unint64_t v60 = v47;
  v61[0] = (WebCore::Node *)WebCore::ScrollView::contentsToWindow();
  v61[1] = v48;
  v64[0] = WebCore::makeNSArrayElement();
  v40 = (void *)[MEMORY[0x1E4F1C978] arrayWithObjects:v64 count:1];
LABEL_45:
  *a4 = v40;
LABEL_46:
  if (v57)
  {
    if (*(_DWORD *)v57 == 1)
    {
      WebCore::TextIndicator::~TextIndicator(v57);
      WTF::fastFree(v49, v50);
    }
    else
    {
      --*(_DWORD *)v57;
    }
  }
}

- (void)dealloc
{
  uint64_t v3 = (objc_class *)objc_opt_class();
  if ((WebCoreObjCScheduleDeallocateOnMainThread(v3, (objc_object *)self) & 1) == 0)
  {
    internal = self->super._internal;
    if (internal)
    {
      if (*((_DWORD *)internal + 7) == 2)
      {
        if ((*((_WORD *)internal + 17) & 0x400) == 0) {
          WebCore::Node::removedLastRef(internal);
        }
      }
      else
      {
        *((_DWORD *)internal + 7) -= 2;
      }
    }
    v5.receiver = self;
    v5.super_class = (Class)DOMNode;
    [(DOMObject *)&v5 dealloc];
  }
}

- (NSString)nodeName
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  (*(void (**)(WTF::StringImpl **__return_ptr))(*(void *)self->super._internal + 104))(&v7);
  if (v7)
  {
    id v4 = (__CFString *)WTF::StringImpl::operator NSString *();
    objc_super v5 = v7;
    float v7 = 0;
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
    id v4 = &stru_1F3C7DA90;
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8, v3);
  return &v4->isa;
}

- (NSString)nodeValue
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  (*(void (**)(WTF::StringImpl **__return_ptr))(*(void *)self->super._internal + 112))(&v7);
  if (v7)
  {
    id v4 = (__CFString *)WTF::StringImpl::operator NSString *();
    objc_super v5 = v7;
    float v7 = 0;
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
    id v4 = &stru_1F3C7DA90;
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8, v3);
  return &v4->isa;
}

- (void)setNodeValue:(NSString *)nodeValue
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v14);
  internal = self->super._internal;
  MEMORY[0x1E4E442D0](&v10, nodeValue);
  (*(void (**)(uint64_t *__return_ptr, DOMObjectInternal *, WTF::StringImpl **))(*(void *)internal + 120))(&v11, internal, &v10);
  if (v13)
  {
    float v7 = v12;
    uint64_t v12 = 0;
    if (v7)
    {
      if (*(_DWORD *)v7 == 2)
      {
        WTF::StringImpl::destroy(v7, v6);
        int32x2_t v8 = v10;
        CFTypeRef v10 = 0;
        if (!v8) {
          goto LABEL_8;
        }
        goto LABEL_6;
      }
      *(_DWORD *)v7 -= 2;
    }
  }
  int32x2_t v8 = v10;
  CFTypeRef v10 = 0;
  if (!v8)
  {
LABEL_8:
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v14, v6);
    return;
  }
LABEL_6:
  if (*(_DWORD *)v8 != 2)
  {
    *(_DWORD *)v8 -= 2;
    goto LABEL_8;
  }
  WTF::StringImpl::destroy(v8, v6);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v14, v9);
}

- (unsigned)nodeType
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LODWORD(self) = *((unsigned __int16 *)self->super._internal + 16) >> 12;
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return (unsigned __int16)self;
}

- (DOMNode)parentNode
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6);
  uint64_t v3 = (DOMNode *)kit(*((WebCore::Node **)self->super._internal + 5));
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6, v4);
  return v3;
}

- (DOMNodeList)childNodes
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WebCore::Node::childNodes((uint64_t *)&v7, self->super._internal);
  id v4 = (DOMNodeList *)kit(v7);
  objc_super v5 = v7;
  float v7 = 0;
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

- (DOMNode)firstChild
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9);
  internal = self->super._internal;
  if (internal) {
    BOOL v4 = (*((_WORD *)internal + 16) & 4) == 0;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4) {
    objc_super v5 = 0;
  }
  else {
    objc_super v5 = (WebCore::Node *)*((void *)internal + 11);
  }
  uint64_t v6 = (DOMNode *)kit(v5);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9, v7);
  return v6;
}

- (DOMNode)lastChild
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9);
  internal = self->super._internal;
  if (internal) {
    BOOL v4 = (*((_WORD *)internal + 16) & 4) == 0;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4) {
    objc_super v5 = 0;
  }
  else {
    objc_super v5 = (WebCore::Node *)*((void *)internal + 12);
  }
  uint64_t v6 = (DOMNode *)kit(v5);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9, v7);
  return v6;
}

- (DOMNode)previousSibling
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6);
  uint64_t v3 = (DOMNode *)kit((WebCore::Node *)(*((void *)self->super._internal + 7) & 0xFFFFFFFFFFFFLL));
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6, v4);
  return v3;
}

- (DOMNode)nextSibling
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6);
  uint64_t v3 = (DOMNode *)kit(*((WebCore::Node **)self->super._internal + 8));
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6, v4);
  return v3;
}

- (DOMDocument)ownerDocument
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6);
  uint64_t v3 = (DOMDocument *)kit(*(WebCore::Node **)(*((void *)self->super._internal + 6) + 8));
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6, v4);
  return v3;
}

- (NSString)namespaceURI
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6);
  if (*(void *)(*(uint64_t (**)(DOMObjectInternal *))(*(void *)self->super._internal + 152))(self->super._internal)) {
    BOOL v4 = (__CFString *)WTF::StringImpl::operator NSString *();
  }
  else {
    BOOL v4 = &stru_1F3C7DA90;
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6, v3);
  return &v4->isa;
}

- (NSString)prefix
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6);
  if (*(void *)(*(uint64_t (**)(DOMObjectInternal *))(*(void *)self->super._internal + 160))(self->super._internal)) {
    BOOL v4 = (__CFString *)WTF::StringImpl::operator NSString *();
  }
  else {
    BOOL v4 = &stru_1F3C7DA90;
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6, v3);
  return &v4->isa;
}

- (void)setPrefix:(NSString *)prefix
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v15);
  internal = self->super._internal;
  WTF::AtomStringImpl::add(v16, (WTF::AtomStringImpl *)prefix, v6);
  uint64_t v11 = (WTF::StringImpl *)v16[0];
  (*(void (**)(uint64_t *__return_ptr, DOMObjectInternal *, WTF::StringImpl **))(*(void *)internal + 168))(&v12, internal, &v11);
  if (v14)
  {
    LOBYTE(v16[0]) = v12;
    uint64_t v10 = v13;
    uint64_t v13 = 0;
    v16[1] = v10;
    raiseDOMErrorException();
  }
  int32x2_t v8 = v11;
  uint64_t v11 = 0;
  if (!v8) {
    goto LABEL_5;
  }
  if (*(_DWORD *)v8 != 2)
  {
    *(_DWORD *)v8 -= 2;
LABEL_5:
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v15, v7);
    return;
  }
  WTF::StringImpl::destroy(v8, v7);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v15, v9);
}

- (NSString)localName
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6);
  if (*(void *)(*(uint64_t (**)(DOMObjectInternal *))(*(void *)self->super._internal + 144))(self->super._internal)) {
    BOOL v4 = (__CFString *)WTF::StringImpl::operator NSString *();
  }
  else {
    BOOL v4 = &stru_1F3C7DA90;
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6, v3);
  return &v4->isa;
}

- (DOMNamedNodeMap)attributes
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9);
  internal = self->super._internal;
  if (internal) {
    BOOL v4 = (*((_WORD *)internal + 16) & 8) == 0;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4) {
    objc_super v5 = 0;
  }
  else {
    objc_super v5 = (DOMObjectInternal *)WebCore::Element::attributes(internal);
  }
  CFStringRef v6 = (DOMNamedNodeMap *)kit(v5);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9, v7);
  return v6;
}

- (NSString)baseURI
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6);
  if (*(void *)WebCore::Node::baseURI(self->super._internal)) {
    BOOL v4 = (__CFString *)WTF::StringImpl::operator NSString *();
  }
  else {
    BOOL v4 = &stru_1F3C7DA90;
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6, v3);
  return &v4->isa;
}

- (NSString)textContent
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  WebCore::Node::textContent(self->super._internal);
  if (v6)
  {
    BOOL v4 = (__CFString *)WTF::StringImpl::operator NSString *();
    if (*(_DWORD *)v6 == 2) {
      WTF::StringImpl::destroy(v6, v3);
    }
    else {
      *(_DWORD *)v6 -= 2;
    }
  }
  else
  {
    BOOL v4 = &stru_1F3C7DA90;
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7, v3);
  return &v4->isa;
}

- (void)setTextContent:(NSString *)textContent
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v11);
  MEMORY[0x1E4E442D0](&v8, textContent);
  WebCore::Node::setTextContent();
  if (v10)
  {
    objc_super v5 = v9;
    CGFloat v9 = 0;
    if (v5)
    {
      if (*(_DWORD *)v5 == 2)
      {
        WTF::StringImpl::destroy(v5, v4);
        CFStringRef v6 = v8;
        int32x2_t v8 = 0;
        if (!v6) {
          goto LABEL_8;
        }
        goto LABEL_6;
      }
      *(_DWORD *)v5 -= 2;
    }
  }
  CFStringRef v6 = v8;
  int32x2_t v8 = 0;
  if (!v6)
  {
LABEL_8:
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v11, v4);
    return;
  }
LABEL_6:
  if (*(_DWORD *)v6 != 2)
  {
    *(_DWORD *)v6 -= 2;
    goto LABEL_8;
  }
  WTF::StringImpl::destroy(v6, v4);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v11, v7);
}

- (BOOL)isConnected
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6);
  BOOL v3 = (*((void *)self->super._internal + 2) >> 51) & 1;
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6, v4);
  return v3;
}

- (DOMElement)parentElement
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  uint64_t v3 = *((void *)self->super._internal + 5);
  if (v3)
  {
    if ((*(_WORD *)(v3 + 32) & 8) != 0) {
      BOOL v4 = (WebCore::Node *)*((void *)self->super._internal + 5);
    }
    else {
      BOOL v4 = 0;
    }
  }
  else
  {
    BOOL v4 = 0;
  }
  objc_super v5 = (DOMElement *)kit(v4);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8, v6);
  return v5;
}

- (BOOL)isContentEditable
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LOBYTE(self) = WebCore::Node::isContentEditable(self->super._internal);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return (char)self;
}

- (DOMNode)insertBefore:(DOMNode *)newChild refChild:(DOMNode *)refChild
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v13);
  if (!newChild) {
    raiseTypeErrorException();
  }
  if (refChild)
  {
    internal = refChild->super._internal;
    if (internal) {
      *((_DWORD *)internal + 7) += 2;
    }
  }
  else
  {
    internal = 0;
  }
  CGFloat v9 = internal;
  WebCore::Node::insertBefore();
  if (v12)
  {
    v13[80] = v10;
    uint64_t v14 = v11;
    raiseDOMErrorException();
  }
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
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v13, v7);
  return newChild;
}

- (DOMNode)replaceChild:(DOMNode *)newChild oldChild:(DOMNode *)oldChild
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v13);
  if (!newChild || !oldChild) {
    raiseTypeErrorException();
  }
  WebCore::Node::replaceChild(&v10, self->super._internal, newChild->super._internal, oldChild->super._internal);
  if (v12)
  {
    v13[80] = v10;
    uint64_t v9 = v11;
    uint64_t v11 = 0;
    uint64_t v14 = v9;
    raiseDOMErrorException();
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v13, v7);
  return oldChild;
}

- (DOMNode)removeChild:(DOMNode *)oldChild
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v11);
  if (!oldChild) {
    raiseTypeErrorException();
  }
  WebCore::Node::removeChild(&v8, self->super._internal, oldChild->super._internal);
  if (v10)
  {
    unsigned char v11[80] = v8;
    uint64_t v7 = v9;
    uint64_t v9 = 0;
    uint64_t v12 = v7;
    raiseDOMErrorException();
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v11, v5);
  return oldChild;
}

- (DOMNode)appendChild:(DOMNode *)newChild
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v11);
  if (!newChild) {
    raiseTypeErrorException();
  }
  WebCore::Node::appendChild(&v8, self->super._internal, newChild->super._internal);
  if (v10)
  {
    unsigned char v11[80] = v8;
    uint64_t v7 = v9;
    uint64_t v9 = 0;
    uint64_t v12 = v7;
    raiseDOMErrorException();
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v11, v5);
  return newChild;
}

- (BOOL)hasChildNodes
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  internal = self->super._internal;
  if (internal) {
    BOOL v5 = (*((_WORD *)internal + 16) & 4) == 0;
  }
  else {
    BOOL v5 = 1;
  }
  BOOL v6 = !v5 && *((void *)internal + 11) != 0;
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8, v3);
  return v6;
}

- (DOMNode)cloneNode:(BOOL)deep
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v13);
  WebCore::Node::cloneNodeForBindings(self->super._internal);
  if (v11)
  {
    if (v11 == 1)
    {
      v14[0] = (_BYTE)v9;
      uint64_t v8 = v10;
      uint64_t v10 = 0;
      uint64_t v15 = v8;
      raiseDOMErrorException();
    }
    CGRect result = (DOMNode *)std::__throw_bad_variant_access[abi:sn180100]();
    __break(1u);
  }
  else
  {
    BOOL v4 = v9;
    uint64_t v9 = 0;
    uint64_t v12 = v4;
    BOOL v6 = (DOMNode *)kit(v4);
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
    if (v11 != -1) {
      ((void (*)(unsigned char *, WebCore::Node **))off_1F3C7A1D8[v11])(v14, &v9);
    }
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v13, v5);
    return v6;
  }
  return result;
}

- (void)normalize
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v4);
  WebCore::Node::normalize(self->super._internal);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v4, v3);
}

- (BOOL)isSupported:(NSString *)feature version:(NSString *)version
{
  return 1;
}

- (BOOL)hasAttributes
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  internal = self->super._internal;
  if (internal) {
    BOOL v5 = (*((_WORD *)internal + 16) & 8) == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5) {
    char hasAttributes = 0;
  }
  else {
    char hasAttributes = WebCore::Element::hasAttributes(internal);
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8, v3);
  return hasAttributes;
}

- (BOOL)isSameNode:(DOMNode *)other
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9);
  if (other) {
    internal = other->super._internal;
  }
  else {
    internal = 0;
  }
  BOOL v7 = self->super._internal == internal;
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9, v5);
  return v7;
}

- (BOOL)isEqualNode:(DOMNode *)other
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9);
  if (other) {
    internal = other->super._internal;
  }
  else {
    internal = 0;
  }
  char isEqualNode = WebCore::Node::isEqualNode(self->super._internal, internal);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9, v7);
  return isEqualNode;
}

- (NSString)lookupPrefix:(NSString *)namespaceURI
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10);
  WTF::AtomStringImpl::add((uint64_t *)&v11, (WTF::AtomStringImpl *)namespaceURI, v4);
  uint64_t v9 = v11;
  if (*(void *)WebCore::Node::lookupPrefix())
  {
    BOOL v6 = (__CFString *)WTF::StringImpl::operator NSString *();
    BOOL v7 = v9;
    if (!v9) {
      goto LABEL_8;
    }
  }
  else
  {
    BOOL v6 = &stru_1F3C7DA90;
    BOOL v7 = v9;
    if (!v9) {
      goto LABEL_8;
    }
  }
  if (*(_DWORD *)v7 == 2) {
    WTF::StringImpl::destroy(v7, v5);
  }
  else {
    *(_DWORD *)v7 -= 2;
  }
LABEL_8:
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10, v5);
  return &v6->isa;
}

- (NSString)lookupNamespaceURI:(NSString *)prefix
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10);
  WTF::AtomStringImpl::add((uint64_t *)&v11, (WTF::AtomStringImpl *)prefix, v4);
  uint64_t v9 = v11;
  if (*(void *)WebCore::Node::lookupNamespaceURI())
  {
    BOOL v6 = (__CFString *)WTF::StringImpl::operator NSString *();
    BOOL v7 = v9;
    if (!v9) {
      goto LABEL_8;
    }
  }
  else
  {
    BOOL v6 = &stru_1F3C7DA90;
    BOOL v7 = v9;
    if (!v9) {
      goto LABEL_8;
    }
  }
  if (*(_DWORD *)v7 == 2) {
    WTF::StringImpl::destroy(v7, v5);
  }
  else {
    *(_DWORD *)v7 -= 2;
  }
LABEL_8:
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10, v5);
  return &v6->isa;
}

- (BOOL)isDefaultNamespace:(NSString *)namespaceURI
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9);
  WTF::AtomStringImpl::add((uint64_t *)&v10, (WTF::AtomStringImpl *)namespaceURI, v4);
  uint64_t v8 = v10;
  char isDefaultNamespace = WebCore::Node::isDefaultNamespace();
  if (v8)
  {
    if (*(_DWORD *)v8 == 2) {
      WTF::StringImpl::destroy(v8, v5);
    }
    else {
      *(_DWORD *)v8 -= 2;
    }
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9, v5);
  return isDefaultNamespace;
}

- (unsigned)compareDocumentPosition:(DOMNode *)other
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  if (other) {
    unsigned __int16 v6 = WebCore::Node::compareDocumentPosition(self->super._internal, other->super._internal);
  }
  else {
    unsigned __int16 v6 = 1;
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8, v5);
  return v6;
}

- (BOOL)contains:(DOMNode *)other
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  if (other && (internal = other->super._internal) != 0) {
    char v6 = WebCore::Node::contains(self->super._internal, internal);
  }
  else {
    char v6 = 0;
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8, internal);
  return v6;
}

- (void)inspect
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v4);
  WebCore::Node::inspect(self->super._internal);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v4, v3);
}

- (void)addEventListener:(id)a3 listener:(id)a4 useCapture:(BOOL)a5
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v17);
  WTF::AtomStringImpl::add(v12, (WTF::AtomStringImpl *)a3, v8);
  uint64_t v16 = (WTF::StringImpl *)v12[0];
  WebCore::ObjCEventListener::wrap((uint64_t)a4, &v14);
  uint64_t v15 = v14;
  LOBYTE(v12[0]) = a5;
  int v13 = 1;
  WebCore::EventTarget::addEventListenerForBindings();
  if (v13 != -1) {
    ((void (*)(char *, uint64_t *))off_1F3C7A1E8[v13])(&v18, v12);
  }
  uint64_t v10 = (_DWORD *)v15;
  uint64_t v15 = 0;
  if (v10)
  {
    if (v10[4] == 1)
    {
      (*(void (**)(_DWORD *))(*(void *)v10 + 8))(v10);
      int v11 = v16;
      uint64_t v16 = 0;
      if (!v11) {
        goto LABEL_12;
      }
      goto LABEL_9;
    }
    --v10[4];
  }
  int v11 = v16;
  uint64_t v16 = 0;
  if (!v11) {
    goto LABEL_12;
  }
LABEL_9:
  if (*(_DWORD *)v11 == 2) {
    WTF::StringImpl::destroy(v11, v9);
  }
  else {
    *(_DWORD *)v11 -= 2;
  }
LABEL_12:
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v17, v9);
}

- (void)addEventListener:(id)a3 :(id)a4 :(BOOL)a5
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v17);
  WTF::AtomStringImpl::add(v12, (WTF::AtomStringImpl *)a3, v8);
  uint64_t v16 = (WTF::StringImpl *)v12[0];
  WebCore::ObjCEventListener::wrap((uint64_t)a4, &v14);
  uint64_t v15 = v14;
  LOBYTE(v12[0]) = a5;
  int v13 = 1;
  WebCore::EventTarget::addEventListenerForBindings();
  if (v13 != -1) {
    ((void (*)(char *, uint64_t *))off_1F3C7A1E8[v13])(&v18, v12);
  }
  uint64_t v10 = (_DWORD *)v15;
  uint64_t v15 = 0;
  if (v10)
  {
    if (v10[4] == 1)
    {
      (*(void (**)(_DWORD *))(*(void *)v10 + 8))(v10);
      int v11 = v16;
      uint64_t v16 = 0;
      if (!v11) {
        goto LABEL_12;
      }
      goto LABEL_9;
    }
    --v10[4];
  }
  int v11 = v16;
  uint64_t v16 = 0;
  if (!v11) {
    goto LABEL_12;
  }
LABEL_9:
  if (*(_DWORD *)v11 == 2) {
    WTF::StringImpl::destroy(v11, v9);
  }
  else {
    *(_DWORD *)v11 -= 2;
  }
LABEL_12:
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v17, v9);
}

- (void)removeEventListener:(id)a3 listener:(id)a4 useCapture:(BOOL)a5
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v13);
  WTF::AtomStringImpl::add((uint64_t *)&v14, (WTF::AtomStringImpl *)a3, v7);
  uint64_t v12 = v14;
  WebCore::ObjCEventListener::wrap((uint64_t)a4, (uint64_t *)&v11);
  uint64_t v14 = v11;
  WebCore::EventTarget::removeEventListenerForBindings();
  uint64_t v9 = v14;
  uint64_t v14 = 0;
  if (v9)
  {
    if (*((_DWORD *)v9 + 4) == 1)
    {
      (*(void (**)(WTF::StringImpl *))(*(void *)v9 + 8))(v9);
      uint64_t v10 = v12;
      uint64_t v12 = 0;
      if (!v10) {
        goto LABEL_10;
      }
      goto LABEL_7;
    }
    --*((_DWORD *)v9 + 4);
  }
  uint64_t v10 = v12;
  uint64_t v12 = 0;
  if (!v10) {
    goto LABEL_10;
  }
LABEL_7:
  if (*(_DWORD *)v10 == 2) {
    WTF::StringImpl::destroy(v10, v8);
  }
  else {
    *(_DWORD *)v10 -= 2;
  }
LABEL_10:
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v13, v8);
}

- (void)removeEventListener:(id)a3 :(id)a4 :(BOOL)a5
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v13);
  WTF::AtomStringImpl::add((uint64_t *)&v14, (WTF::AtomStringImpl *)a3, v7);
  uint64_t v12 = v14;
  WebCore::ObjCEventListener::wrap((uint64_t)a4, (uint64_t *)&v11);
  uint64_t v14 = v11;
  WebCore::EventTarget::removeEventListenerForBindings();
  uint64_t v9 = v14;
  uint64_t v14 = 0;
  if (v9)
  {
    if (*((_DWORD *)v9 + 4) == 1)
    {
      (*(void (**)(WTF::StringImpl *))(*(void *)v9 + 8))(v9);
      uint64_t v10 = v12;
      uint64_t v12 = 0;
      if (!v10) {
        goto LABEL_10;
      }
      goto LABEL_7;
    }
    --*((_DWORD *)v9 + 4);
  }
  uint64_t v10 = v12;
  uint64_t v12 = 0;
  if (!v10) {
    goto LABEL_10;
  }
LABEL_7:
  if (*(_DWORD *)v10 == 2) {
    WTF::StringImpl::destroy(v10, v8);
  }
  else {
    *(_DWORD *)v10 -= 2;
  }
LABEL_10:
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v13, v8);
}

- (BOOL)dispatchEvent:(id)a3
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9);
  if (!a3) {
    raiseTypeErrorException();
  }
  WebCore::EventTarget::dispatchEventForBindings();
  if (v8)
  {
    if (v8 == 1)
    {
      unsigned char v9[80] = v6;
      uint64_t v10 = v7;
      raiseDOMErrorException();
    }
    BOOL result = std::__throw_bad_variant_access[abi:sn180100]();
    __break(1u);
  }
  else
  {
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9, v4);
    return v6;
  }
  return result;
}

- (id)boundingBoxes
{
  v9[1] = *MEMORY[0x1E4F143B8];
  [(DOMNode *)self boundingBox];
  double x = v10.origin.x;
  double y = v10.origin.y;
  double width = v10.size.width;
  double height = v10.size.height;
  if (!NSIsEmptyRect(v10))
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (![(NSString *)[(DOMCSSStyleDeclaration *)[(DOMDocument *)[(DOMNode *)self ownerDocument] getComputedStyle:self pseudoElement:&stru_1F3C7DA90] getPropertyValue:@"display"] isEqualToString:@"inline"])goto LABEL_4; {
LABEL_8:
      }
      uint64_t v7 = [(DOMNode *)self lineBoxRects];
      if ([(NSArray *)v7 count]) {
        return v7;
      }
      goto LABEL_5;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_8;
    }
  }
LABEL_4:
  uint64_t v7 = 0;
  if (![0 count])
  {
LABEL_5:
    v9[0] = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRect:", x, y, width, height);
    return (id)[MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  }
  return v7;
}

- (id)absoluteQuads
{
  v8[1] = *MEMORY[0x1E4F143B8];
  [(DOMNode *)self boundingBox];
  if (NSIsEmptyRect(v9)) {
    goto LABEL_4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_7;
    }
LABEL_4:
    id v3 = 0;
    if ([0 count]) {
      return v3;
    }
    goto LABEL_8;
  }
  if (![(NSString *)[(DOMCSSStyleDeclaration *)[(DOMDocument *)[(DOMNode *)self ownerDocument] getComputedStyle:self pseudoElement:&stru_1F3C7DA90] getPropertyValue:@"display"] isEqualToString:@"inline"])goto LABEL_4; {
LABEL_7:
  }
  id v3 = [(DOMNode *)self lineBoxQuads];
  if ([v3 count]) {
    return v3;
  }
LABEL_8:
  CFStringRef v4 = [WKQuadObject alloc];
  if (self) {
    [(DOMNode *)self absoluteQuad];
  }
  else {
    memset(v7, 0, sizeof(v7));
  }
  BOOL v5 = [(WKQuadObject *)v4 initWithQuad:v7];
  v8[0] = v5;
  id v3 = (id)[MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  if (v5) {
    CFRelease(v5);
  }
  return v3;
}

- (id)borderRadii
{
  v12[4] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (WebCore::RenderBox *)(*((void *)self->super._internal + 9) & 0xFFFFFFFFFFFFLL);
  if (v2 && (*((unsigned char *)v2 + 45) & 4) != 0)
  {
    WebCore::RenderBox::borderRadii(&v10, v2);
    BOOL v5 = (void *)MEMORY[0x1E4F29238];
    WebCore::FloatSize::operator CGSize();
    v12[0] = objc_msgSend(v5, "valueWithSize:");
    BOOL v6 = (void *)MEMORY[0x1E4F29238];
    WebCore::FloatSize::operator CGSize();
    v12[1] = objc_msgSend(v6, "valueWithSize:");
    uint64_t v7 = (void *)MEMORY[0x1E4F29238];
    WebCore::FloatSize::operator CGSize();
    uint64_t v12[2] = objc_msgSend(v7, "valueWithSize:");
    int v8 = (void *)MEMORY[0x1E4F29238];
    WebCore::FloatSize::operator CGSize();
    v12[3] = objc_msgSend(v8, "valueWithSize:");
    id v3 = (void *)MEMORY[0x1E4F1C978];
    CFStringRef v4 = v12;
  }
  else
  {
    v11[0] = objc_msgSend(MEMORY[0x1E4F29238], "valueWithSize:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
    v11[1] = v11[0];
    v11[2] = v11[0];
    v11[3] = v11[0];
    id v3 = (void *)MEMORY[0x1E4F1C978];
    CFStringRef v4 = v11;
  }
  return (id)[v3 arrayWithObjects:v4 count:4];
}

- (BOOL)containsOnlyInlineObjects
{
  uint64_t v2 = *((void *)self->super._internal + 9) & 0xFFFFFFFFFFFFLL;
  if (!v2
    || (*(unsigned char *)((*((void *)self->super._internal + 9) & 0xFFFFFFFFFFFFLL) + 0x16) & 4) == 0
    || (*(unsigned char *)((*((void *)self->super._internal + 9) & 0xFFFFFFFFFFFFLL) + 0x2D) & 0x40) == 0
    || WebCore::RenderBoxModelObject::inlineContinuation((WebCore::RenderBoxModelObject *)(*((void *)self->super._internal
                                                                                           + 9) & 0xFFFFFFFFFFFFLL)))
  {
    return 0;
  }
  int v4 = *(unsigned __int8 *)(v2 + 46);
  return v4 != 35 && v4 != 63;
}

- (BOOL)isSelectableBlock
{
  uint64_t v2 = (WebCore::RenderBoxModelObject *)(*((void *)self->super._internal + 9) & 0xFFFFFFFFFFFFLL);
  if (v2) {
    LOBYTE(v2) = (*((unsigned char *)v2 + 52) & 7) == 1
  }
              || (*((unsigned char *)v2 + 45) & 0x40) != 0 && WebCore::RenderBoxModelObject::inlineContinuation(v2) != 0;
  return (char)v2;
}

- (id)rangeOfContainingParagraph
{
  if (self)
  {
    internal = self->super._internal;
    if (internal) {
      *((_DWORD *)internal + 7) += 2;
    }
  }
  else
  {
    internal = 0;
  }
  uint64_t v14 = internal;
  WebCore::Position::Position();
  WebCore::VisiblePosition::VisiblePosition();
  id v3 = v15;
  uint64_t v15 = 0;
  if (v3)
  {
    if (*((_DWORD *)v3 + 7) == 2)
    {
      if ((*((_WORD *)v3 + 17) & 0x400) == 0) {
        WebCore::Node::removedLastRef(v3);
      }
    }
    else
    {
      *((_DWORD *)v3 + 7) -= 2;
    }
  }
  int v4 = v14;
  uint64_t v14 = 0;
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
  WebCore::startOfParagraph();
  WebCore::endOfParagraph();
  WebCore::makeSimpleRange<WebCore::VisiblePosition,WebCore::VisiblePosition>((WebCore *)&v14, &v13, (uint64_t)&v15);
  WebCore::createLiveRange();
  BOOL v5 = kit(v19);
  BOOL v6 = v19;
  int v19 = 0;
  if (!v6)
  {
LABEL_18:
    if (!v17) {
      goto LABEL_31;
    }
    goto LABEL_21;
  }
  if (*((_DWORD *)v6 + 2) != 1)
  {
    --*((_DWORD *)v6 + 2);
    goto LABEL_18;
  }
  (*(void (**)(DOMObjectInternal *))(*(void *)v6 + 8))(v6);
  if (!v17) {
    goto LABEL_31;
  }
LABEL_21:
  uint64_t v7 = v16;
  uint64_t v16 = 0;
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
  int v8 = v15;
  uint64_t v15 = 0;
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
LABEL_31:
  var0 = v13.var0.var0.var0;
  v13.var0.var0.var0 = 0;
  if (var0)
  {
    if (*((_DWORD *)var0 + 7) == 2)
    {
      if ((*((_WORD *)var0 + 17) & 0x400) == 0) {
        WebCore::Node::removedLastRef((WebCore::Node *)var0);
      }
    }
    else
    {
      *((_DWORD *)var0 + 7) -= 2;
    }
  }
  uint64_t v10 = v14;
  uint64_t v14 = 0;
  if (v10)
  {
    if (*((_DWORD *)v10 + 7) == 2)
    {
      if ((*((_WORD *)v10 + 17) & 0x400) == 0) {
        WebCore::Node::removedLastRef(v10);
      }
    }
    else
    {
      *((_DWORD *)v10 + 7) -= 2;
    }
  }
  uint64_t v11 = v18;
  uint64_t v18 = 0;
  if (!v11) {
    return v5;
  }
  if (*(_DWORD *)(v11 + 28) != 2)
  {
    *(_DWORD *)(v11 + 28) -= 2;
    return v5;
  }
  if ((*(_WORD *)(v11 + 34) & 0x400) != 0) {
    return v5;
  }
  WebCore::Node::removedLastRef((WebCore::Node *)v11);
  return v5;
}

- (double)textHeight
{
  if ((*((void *)self->super._internal + 9) & 0xFFFFFFFFFFFFLL) == 0
    || (*(unsigned char *)((*((void *)self->super._internal + 9) & 0xFFFFFFFFFFFFLL) + 0x2D) & 2) == 0)
  {
    return 1.79769313e308;
  }
  uint64_t v3 = *(void *)((*((void *)self->super._internal + 9) & 0xFFFFFFFFFFFFLL) + 0x20);
  if (v3) {
    uint64_t v3 = *(void *)(v3 + 8);
  }
  WebCore::RenderStyle::computedLineHeight((WebCore::RenderStyle *)(v3 + 80));
  return v4;
}

- (id)findExplodedTextNodeAtPoint:(CGPoint)a3
{
  CGPoint v8 = a3;
  uint64_t v3 = (WebCore::RenderBlockFlow *)(*((void *)self->super._internal + 9) & 0xFFFFFFFFFFFFLL);
  if (!v3 || (*(unsigned char *)((*((void *)self->super._internal + 9) & 0xFFFFFFFFFFFFLL) + 0x34) & 7) != 1) {
    return 0;
  }
  WebCore::FloatPoint::FloatPoint((WebCore::FloatPoint *)v7, &v8);
  id result = (id)WebCore::RenderBlockFlow::findClosestTextAtAbsolutePoint(v3, (const WebCore::FloatPoint *)v7);
  if (result)
  {
    BOOL v5 = (WebCore::RenderText *)result;
    id result = (id)WebCore::RenderText::textNode((WebCore::RenderText *)result);
    if (result)
    {
      BOOL v6 = (WebCore::Node *)WebCore::RenderText::textNode(v5);
      return kit(v6);
    }
  }
  return result;
}

- (WebArchive)webArchive
{
  uint64_t v2 = [WebArchive alloc];
  WebCore::LegacyWebArchive::create();
  uint64_t v3 = (id)CFMakeCollectable([(WebArchive *)v2 _initWithCoreLegacyWebArchive:&v6]);
  float v4 = v6;
  BOOL v6 = 0;
  if (v4)
  {
    if (v4[2] == 1) {
      (*(void (**)(_DWORD *))(*(void *)v4 + 8))(v4);
    }
    else {
      --v4[2];
    }
  }
  return v3;
}

- (id)webArchiveByFilteringSubframes:(id)a3
{
  float v4 = [WebArchive alloc];
  BOOL v5 = (void *)WTF::fastMalloc((WTF *)0x10);
  *BOOL v5 = &unk_1F3C7A390;
  v5[1] = a3;
  NSRect v9 = v5;
  WebCore::LegacyWebArchive::create();
  id v6 = [(WebArchive *)v4 _initWithCoreLegacyWebArchive:&v10];
  uint64_t v7 = v10;
  uint64_t v10 = 0;
  if (v7)
  {
    if (v7[2] == 1) {
      (*(void (**)(_DWORD *))(*(void *)v7 + 8))(v7);
    }
    else {
      --v7[2];
    }
  }
  if (v9) {
    (*(void (**)(void *))(*v9 + 8))(v9);
  }
  return (id)(id)CFMakeCollectable(v6);
}

- (BOOL)isHorizontalWritingMode
{
  if (!self) {
    return 1;
  }
  internal = self->super._internal;
  if (!internal) {
    return 1;
  }
  uint64_t v3 = *((void *)internal + 9) & 0xFFFFFFFFFFFFLL;
  if (!v3) {
    return 1;
  }
  if ((*(unsigned char *)(v3 + 45) & 2) != 0) {
    uint64_t v3 = *(void *)(*(void *)(v3 + 32) + 8);
  }
  int v4 = *(_DWORD *)(v3 + 120) & 7;
  char v5 = 2;
  switch(v4)
  {
    case 1:
    case 2:
      goto LABEL_10;
    case 3:
    case 5:
      LOBYTE(v4) = 3;
      goto LABEL_10;
    case 4:
      goto LABEL_11;
    default:
      LOBYTE(v4) = 0;
LABEL_10:
      char v5 = v4;
LABEL_11:
      BOOL result = (v5 & 6) != 2;
      break;
  }
  return result;
}

- (void)hidePlaceholder
{
  if (self)
  {
    internal = self->super._internal;
    if (internal)
    {
      if ((*((_WORD *)internal + 16) & 8) != 0
        && (*(unsigned int (**)(DOMObjectInternal *, SEL))(*(void *)internal + 872))(self->super._internal, a2))
      {
        if ((*((_WORD *)internal + 16) & 8) != 0
          && ((*(uint64_t (**)(DOMObjectInternal *))(*(void *)internal + 872))(internal) & 1) != 0)
        {
          WebCore::HTMLTextFormControlElement::setCanShowPlaceholder(internal);
        }
        else
        {
          __break(0xC471u);
        }
      }
    }
  }
}

- (void)showPlaceholderIfNecessary
{
  if (self)
  {
    internal = self->super._internal;
    if (internal)
    {
      if ((*((_WORD *)internal + 16) & 8) != 0
        && (*(unsigned int (**)(DOMObjectInternal *, SEL))(*(void *)internal + 872))(self->super._internal, a2))
      {
        if ((*((_WORD *)internal + 16) & 8) != 0
          && ((*(uint64_t (**)(DOMObjectInternal *))(*(void *)internal + 872))(internal) & 1) != 0)
        {
          WebCore::HTMLTextFormControlElement::setCanShowPlaceholder(internal);
        }
        else
        {
          __break(0xC471u);
        }
      }
    }
  }
}

- (id)markupString
{
  internal = self->super._internal;
  v17[0] = 0;
  v17[1] = 0;
  v16[1] = 0;
  uint64_t v16[2] = 0;
  WebCore::serializeFragment();
  if ((*((unsigned __int16 *)internal + 16) >> 12) - 11 > 0xFFFFFFFD) {
    goto LABEL_32;
  }
  id result = WebCore::documentTypeString((uint64_t *)v16, *(WebCore **)(*((void *)internal + 6) + 8), v3);
  char v5 = v18;
  if (v18) {
    *(_DWORD *)v18 += 2;
  }
  if (v16[0])
  {
    int v6 = *((_DWORD *)v16[0] + 1);
    if (v5) {
      goto LABEL_6;
    }
  }
  else
  {
    int v6 = 0;
    if (v5)
    {
LABEL_6:
      int v7 = *((_DWORD *)v5 + 1);
      if ((v7 | v6) < 0) {
        goto LABEL_40;
      }
      goto LABEL_10;
    }
  }
  int v7 = 0;
  if (v6 < 0) {
    goto LABEL_40;
  }
LABEL_10:
  id result = (id)(v6 + v7);
  if (__OFADD__(v6, v7)) {
    goto LABEL_40;
  }
  if (!v16[0])
  {
    if (!v5)
    {
      int v9 = 1;
      goto LABEL_18;
    }
LABEL_16:
    int v9 = (*((unsigned __int8 *)v5 + 16) >> 2) & 1;
    goto LABEL_18;
  }
  unsigned int v8 = *((_DWORD *)v16[0] + 4);
  int v9 = (v8 >> 2) & 1;
  if (v5 && (v8 & 4) != 0) {
    goto LABEL_16;
  }
LABEL_18:
  id result = (id)WTF::tryMakeStringImplFromAdaptersInternal<WTF::StringTypeAdapter<WTF::String,void>,WTF::StringTypeAdapter<WTF::String,void>>((unint64_t)result, v9, (uint64_t)v16[0], (uint64_t)v5, v17);
  if (v17[0])
  {
    uint64_t v11 = v18;
    uint64_t v18 = v17[0];
    if (v11)
    {
      if (*(_DWORD *)v11 == 2)
      {
        WTF::StringImpl::destroy(v11, v10);
        if (!v5) {
          goto LABEL_27;
        }
LABEL_25:
        if (*(_DWORD *)v5 == 2)
        {
          WTF::StringImpl::destroy(v5, v10);
          uint64_t v12 = v16[0];
          v16[0] = 0;
          if (!v12) {
            goto LABEL_32;
          }
LABEL_30:
          if (*(_DWORD *)v12 == 2)
          {
            WTF::StringImpl::destroy(v12, v10);
            if (v18)
            {
LABEL_33:
              uint64_t v14 = (void *)WTF::StringImpl::operator NSString *();
              uint64_t v15 = v18;
              uint64_t v18 = 0;
              if (v15)
              {
                if (*(_DWORD *)v15 == 2)
                {
                  WTF::StringImpl::destroy(v15, v13);
                  return v14;
                }
                *(_DWORD *)v15 -= 2;
              }
              return v14;
            }
            return &stru_1F3C7DA90;
          }
          *(_DWORD *)v12 -= 2;
LABEL_32:
          if (v18) {
            goto LABEL_33;
          }
          return &stru_1F3C7DA90;
        }
        *(_DWORD *)v5 -= 2;
LABEL_27:
        uint64_t v12 = v16[0];
        v16[0] = 0;
        if (!v12) {
          goto LABEL_32;
        }
        goto LABEL_30;
      }
      *(_DWORD *)v11 -= 2;
    }
    if (!v5) {
      goto LABEL_27;
    }
    goto LABEL_25;
  }
LABEL_40:
  __break(0xC471u);
  return result;
}

- (CGRect)_renderRect:(BOOL *)a3
{
  if (self) {
    self = (DOMNode *)self->super._internal;
  }
  WebCore::Node::absoluteBoundingRect((WebCore::Node *)self, a3);
  WebCore::IntRect::operator CGRect();
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (id)rangeOfContents
{
  double v3 = [(DOMDocument *)[(DOMNode *)self ownerDocument] createRange];
  [(DOMRange *)v3 setStart:self offset:0];
  [(DOMRange *)v3 setEnd:self offset:[(DOMNodeList *)[(DOMNode *)self childNodes] length]];
  return v3;
}

- (id)startPosition
{
  if (self)
  {
    internal = self->super._internal;
    if (WebCore::Node::isContentEditable(internal))
    {
      if (internal) {
        *((_DWORD *)internal + 7) += 2;
      }
      goto LABEL_7;
    }
LABEL_10:
    id v7 = [(DOMNode *)self rangeOfContents];
    return (id)[v7 startPosition];
  }
  if (!WebCore::Node::isContentEditable(0)) {
    goto LABEL_10;
  }
  internal = 0;
LABEL_7:
  WebCore::Position::Position();
  WebCore::VisiblePosition::VisiblePosition();
  WebCore::startOfEditableContent(v12, (WebCore *)&v11, v4);
  id v5 = +[WebVisiblePosition _wrapVisiblePosition:v12];
  uint64_t v6 = v12[0];
  v12[0] = 0;
  if (v6)
  {
    if (*(_DWORD *)(v6 + 28) == 2)
    {
      if ((*(_WORD *)(v6 + 34) & 0x400) == 0) {
        WebCore::Node::removedLastRef((WebCore::Node *)v6);
      }
    }
    else
    {
      *(_DWORD *)(v6 + 28) -= 2;
    }
  }
  int v9 = v11;
  uint64_t v11 = 0;
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
  if (v10)
  {
    if (*((_DWORD *)v10 + 7) == 2)
    {
      if ((*((_WORD *)v10 + 17) & 0x400) == 0) {
        WebCore::Node::removedLastRef(v10);
      }
    }
    else
    {
      *((_DWORD *)v10 + 7) -= 2;
    }
  }
  if (!internal) {
    return v5;
  }
  if (*((_DWORD *)internal + 7) != 2)
  {
    *((_DWORD *)internal + 7) -= 2;
    return v5;
  }
  if ((*((_WORD *)internal + 17) & 0x400) != 0) {
    return v5;
  }
  WebCore::Node::removedLastRef(internal);
  return v5;
}

- (id)endPosition
{
  if (self)
  {
    internal = self->super._internal;
    if (WebCore::Node::isContentEditable(internal))
    {
      if (internal) {
        *((_DWORD *)internal + 7) += 2;
      }
      goto LABEL_7;
    }
LABEL_10:
    id v7 = [(DOMNode *)self rangeOfContents];
    return (id)[v7 endPosition];
  }
  if (!WebCore::Node::isContentEditable(0)) {
    goto LABEL_10;
  }
  internal = 0;
LABEL_7:
  WebCore::Position::Position();
  WebCore::VisiblePosition::VisiblePosition();
  WebCore::endOfEditableContent(v12, (WebCore *)&v11, v4);
  id v5 = +[WebVisiblePosition _wrapVisiblePosition:v12];
  uint64_t v6 = v12[0];
  v12[0] = 0;
  if (v6)
  {
    if (*(_DWORD *)(v6 + 28) == 2)
    {
      if ((*(_WORD *)(v6 + 34) & 0x400) == 0) {
        WebCore::Node::removedLastRef((WebCore::Node *)v6);
      }
    }
    else
    {
      *(_DWORD *)(v6 + 28) -= 2;
    }
  }
  int v9 = v11;
  uint64_t v11 = 0;
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
  if (v10)
  {
    if (*((_DWORD *)v10 + 7) == 2)
    {
      if ((*((_WORD *)v10 + 17) & 0x400) == 0) {
        WebCore::Node::removedLastRef(v10);
      }
    }
    else
    {
      *((_DWORD *)v10 + 7) -= 2;
    }
  }
  if (!internal) {
    return v5;
  }
  if (*((_DWORD *)internal + 7) != 2)
  {
    *((_DWORD *)internal + 7) -= 2;
    return v5;
  }
  if ((*((_WORD *)internal + 17) & 0x400) != 0) {
    return v5;
  }
  WebCore::Node::removedLastRef(internal);
  return v5;
}

@end