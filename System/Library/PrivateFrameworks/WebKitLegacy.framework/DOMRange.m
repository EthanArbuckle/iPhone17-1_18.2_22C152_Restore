@interface DOMRange
+ (id)rangeForFirstPosition:(id)a3 second:(id)a4;
- (BOOL)collapsed;
- (BOOL)intersectsNode:(DOMNode *)refNode;
- (BOOL)isPointInRange:(DOMNode *)refNode offset:(int)offset;
- (CGImage)renderedImageForcingBlackText:(BOOL)a3;
- (CGRect)boundingBox;
- (DOMDocumentFragment)cloneContents;
- (DOMDocumentFragment)createContextualFragment:(NSString *)html;
- (DOMDocumentFragment)extractContents;
- (DOMNode)commonAncestorContainer;
- (DOMNode)endContainer;
- (DOMNode)startContainer;
- (DOMRange)cloneRange;
- (NSString)markupString;
- (NSString)text;
- (NSString)toString;
- (WebArchive)webArchive;
- (__int16)compareBoundaryPoints:(unsigned __int16)how sourceRange:(DOMRange *)sourceRange;
- (__int16)compareNode:(DOMNode *)refNode;
- (__int16)comparePoint:(DOMNode *)refNode offset:(int)offset;
- (id)description;
- (id)enclosingWordRange;
- (id)endPosition;
- (id)firstNode;
- (id)startPosition;
- (id)textRects;
- (int)endOffset;
- (int)startOffset;
- (void)collapse:(BOOL)toStart;
- (void)dealloc;
- (void)deleteContents;
- (void)detach;
- (void)expand:(id)a3;
- (void)extend:(unsigned int)a3 inDirection:(int)a4;
- (void)insertNode:(DOMNode *)newNode;
- (void)move:(unsigned int)a3 inDirection:(int)a4;
- (void)selectNode:(DOMNode *)refNode;
- (void)selectNodeContents:(DOMNode *)refNode;
- (void)setEnd:(DOMNode *)refNode offset:(int)offset;
- (void)setEndAfter:(DOMNode *)refNode;
- (void)setEndBefore:(DOMNode *)refNode;
- (void)setStart:(DOMNode *)refNode offset:(int)offset;
- (void)setStartAfter:(DOMNode *)refNode;
- (void)setStartBefore:(DOMNode *)refNode;
- (void)surroundContents:(DOMNode *)newParent;
@end

@implementation DOMRange

- (CGRect)boundingBox
{
  WebCore::makeSimpleRange();
  WebCore::Document::updateLayout();
  WebCore::RenderObject::absoluteTextRects();
  WebCore::unionRect();
  WebCore::IntRect::operator CGRect();
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  if (v15) {
    WTF::fastFree(v15, v2);
  }
  if (v17)
  {
    if (*((_DWORD *)v17 + 7) == 2)
    {
      if ((*((_WORD *)v17 + 17) & 0x400) == 0) {
        WebCore::Node::removedLastRef(v17);
      }
    }
    else
    {
      *((_DWORD *)v17 + 7) -= 2;
    }
  }
  if (v16)
  {
    if (*((_DWORD *)v16 + 7) == 2)
    {
      if ((*((_WORD *)v16 + 17) & 0x400) == 0) {
        WebCore::Node::removedLastRef(v16);
      }
    }
    else
    {
      *((_DWORD *)v16 + 7) -= 2;
    }
  }
  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (CGImage)renderedImageForcingBlackText:(BOOL)a3
{
  BOOL v3 = a3;
  WebCore::makeSimpleRange();
  uint64_t v4 = *(void *)(*(void *)(*((void *)v14 + 6) + 8) + 544);
  if (!v4 || (double v5 = *(atomic_uint **)(v4 + 8)) == 0)
  {
    double v7 = 0;
    goto LABEL_8;
  }
  double v6 = v5 + 2;
  atomic_fetch_add(v5 + 2, 1u);
  WebCore::createDragImageForRange((WebCore *)v5, (WebCore::LocalFrame *)&v14, (const WebCore::SimpleRange *)v3);
  if (v16)
  {
    CFAutorelease(v16);
    double v7 = (CGImage *)v16;
    unsigned int add = atomic_fetch_add(v6, 0xFFFFFFFF);
    if (add != 1) {
      goto LABEL_8;
    }
  }
  else
  {
    double v7 = 0;
    unsigned int add = atomic_fetch_add(v6, 0xFFFFFFFF);
    if (add != 1) {
      goto LABEL_8;
    }
  }
  atomic_store(add, (unsigned int *)v6);
  double v12 = (void *)WTF::fastMalloc((WTF *)0x10);
  *double v12 = &unk_1F3C797F0;
  v12[1] = v6;
  v16 = v12;
  WTF::ensureOnMainThread();
  CFTypeRef v13 = v16;
  v16 = 0;
  if (v13) {
    (*(void (**)(CFTypeRef))(*(void *)v13 + 8))(v13);
  }
LABEL_8:
  double v9 = v15;
  v15 = 0;
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
  double v10 = v14;
  double v14 = 0;
  if (!v10) {
    return v7;
  }
  if (*((_DWORD *)v10 + 7) != 2)
  {
    *((_DWORD *)v10 + 7) -= 2;
    return v7;
  }
  if ((*((_WORD *)v10 + 17) & 0x400) != 0) {
    return v7;
  }
  WebCore::Node::removedLastRef(v10);
  return v7;
}

- (id)textRects
{
  WebCore::makeSimpleRange();
  WebCore::Document::updateLayout();
  WebCore::RenderObject::absoluteTextRects();
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v10];
  if (v10)
  {
    BOOL v3 = v9;
    uint64_t v4 = 16 * v10;
    do
    {
      uint64_t NSArrayElement = WebCore::makeNSArrayElement();
      if (NSArrayElement) {
        [v2 addObject:NSArrayElement];
      }
      BOOL v3 = (WTF *)((char *)v3 + 16);
      v4 -= 16;
    }
    while (v4);
  }
  CFTypeRef v7 = (id)CFMakeCollectable(v2);
  if (v9) {
    WTF::fastFree(v9, v6);
  }
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
  if (!v11) {
    return (id)v7;
  }
  if (*((_DWORD *)v11 + 7) != 2)
  {
    *((_DWORD *)v11 + 7) -= 2;
    return (id)v7;
  }
  if ((*((_WORD *)v11 + 17) & 0x400) != 0) {
    return (id)v7;
  }
  WebCore::Node::removedLastRef(v11);
  return (id)v7;
}

- (id)description
{
  if (self->super._internal) {
    return (id)[NSString stringWithFormat:@"<DOMRange: %@ %d %@ %d>", -[DOMRange startContainer](self, "startContainer"), -[DOMRange startOffset](self, "startOffset"), -[DOMRange endContainer](self, "endContainer"), -[DOMRange endOffset](self, "endOffset")];
  }
  else {
    return @"<DOMRange: null>";
  }
}

- (void)dealloc
{
  BOOL v3 = (objc_class *)objc_opt_class();
  if ((WebCoreObjCScheduleDeallocateOnMainThread(v3, (objc_object *)self) & 1) == 0)
  {
    internal = self->super._internal;
    if (internal)
    {
      if (*((_DWORD *)internal + 2) == 1) {
        (*(void (**)(DOMObjectInternal *))(*(void *)internal + 8))(internal);
      }
      else {
        --*((_DWORD *)internal + 2);
      }
    }
    v5.receiver = self;
    v5.super_class = (Class)DOMRange;
    [(DOMObject *)&v5 dealloc];
  }
}

- (DOMNode)startContainer
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6);
  BOOL v3 = (DOMNode *)kit(*((WebCore::Node **)self->super._internal + 4));
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6, v4);
  return v3;
}

- (int)startOffset
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LODWORD(self) = *((_DWORD *)self->super._internal + 10);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return (int)self;
}

- (DOMNode)endContainer
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6);
  BOOL v3 = (DOMNode *)kit(*((WebCore::Node **)self->super._internal + 7));
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6, v4);
  return v3;
}

- (int)endOffset
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LODWORD(self) = *((_DWORD *)self->super._internal + 16);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return (int)self;
}

- (BOOL)collapsed
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10);
  internal = self->super._internal;
  BOOL v7 = *((void *)internal + 4) == *((void *)internal + 7);
  int v5 = *((_DWORD *)internal + 10);
  int v6 = *((_DWORD *)internal + 16);
  BOOL v7 = v7 && v5 == v6;
  BOOL v8 = v7;
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10, v3);
  return v8;
}

- (DOMNode)commonAncestorContainer
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  BOOL v3 = (WebCore::Node *)WebCore::Range::commonAncestorContainer(self->super._internal);
  uint64_t v4 = (DOMNode *)kit(v3);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7, v5);
  return v4;
}

- (NSString)text
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9);
  WebCore::makeSimpleRange();
  WebCore::Document::updateLayout();
  WebCore::plainText();
  if (v6)
  {
    BOOL v3 = (__CFString *)WTF::StringImpl::operator NSString *();
    if (*(_DWORD *)v6 == 2)
    {
      WTF::StringImpl::destroy(v6, v2);
      uint64_t v4 = v8;
      if (!v8) {
        goto LABEL_11;
      }
    }
    else
    {
      *(_DWORD *)v6 -= 2;
      uint64_t v4 = v8;
      if (!v8) {
        goto LABEL_11;
      }
    }
  }
  else
  {
    BOOL v3 = &stru_1F3C7DA90;
    uint64_t v4 = v8;
    if (!v8) {
      goto LABEL_11;
    }
  }
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
LABEL_11:
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
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9, v2);
  return &v3->isa;
}

- (void)setStart:(DOMNode *)refNode offset:(int)offset
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v11);
  if (!refNode) {
    raiseTypeErrorException();
  }
  internal = refNode->super._internal;
  *((_DWORD *)internal + 7) += 2;
  BOOL v7 = internal;
  WebCore::Range::setStart();
  if (v10)
  {
    v11[80] = v8;
    uint64_t v12 = v9;
    raiseDOMErrorException();
  }
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
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v11, v6);
}

- (void)setEnd:(DOMNode *)refNode offset:(int)offset
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v11);
  if (!refNode) {
    raiseTypeErrorException();
  }
  internal = refNode->super._internal;
  *((_DWORD *)internal + 7) += 2;
  BOOL v7 = internal;
  WebCore::Range::setEnd();
  if (v10)
  {
    v11[80] = v8;
    uint64_t v12 = v9;
    raiseDOMErrorException();
  }
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
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v11, v6);
}

- (void)setStartBefore:(DOMNode *)refNode
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10);
  if (!refNode) {
    raiseTypeErrorException();
  }
  WebCore::Range::setStartBefore(&v7, self->super._internal, refNode->super._internal);
  if (v9)
  {
    unsigned char v10[80] = v7;
    uint64_t v6 = v8;
    uint64_t v8 = 0;
    uint64_t v11 = v6;
    raiseDOMErrorException();
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10, v5);
}

- (void)setStartAfter:(DOMNode *)refNode
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10);
  if (!refNode) {
    raiseTypeErrorException();
  }
  WebCore::Range::setStartAfter(&v7, self->super._internal, refNode->super._internal);
  if (v9)
  {
    unsigned char v10[80] = v7;
    uint64_t v6 = v8;
    uint64_t v8 = 0;
    uint64_t v11 = v6;
    raiseDOMErrorException();
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10, v5);
}

- (void)setEndBefore:(DOMNode *)refNode
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10);
  if (!refNode) {
    raiseTypeErrorException();
  }
  WebCore::Range::setEndBefore(&v7, self->super._internal, refNode->super._internal);
  if (v9)
  {
    unsigned char v10[80] = v7;
    uint64_t v6 = v8;
    uint64_t v8 = 0;
    uint64_t v11 = v6;
    raiseDOMErrorException();
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10, v5);
}

- (void)setEndAfter:(DOMNode *)refNode
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10);
  if (!refNode) {
    raiseTypeErrorException();
  }
  WebCore::Range::setEndAfter(&v7, self->super._internal, refNode->super._internal);
  if (v9)
  {
    unsigned char v10[80] = v7;
    uint64_t v6 = v8;
    uint64_t v8 = 0;
    uint64_t v11 = v6;
    raiseDOMErrorException();
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10, v5);
}

- (void)collapse:(BOOL)toStart
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  WebCore::Range::collapse(self->super._internal);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v4);
}

- (void)selectNode:(DOMNode *)refNode
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10);
  if (!refNode) {
    raiseTypeErrorException();
  }
  WebCore::Range::selectNode(&v7, self->super._internal, refNode->super._internal);
  if (v9)
  {
    unsigned char v10[80] = v7;
    uint64_t v6 = v8;
    uint64_t v8 = 0;
    uint64_t v11 = v6;
    raiseDOMErrorException();
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10, v5);
}

- (void)selectNodeContents:(DOMNode *)refNode
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10);
  if (!refNode) {
    raiseTypeErrorException();
  }
  WebCore::Range::selectNodeContents(&v7, self->super._internal, refNode->super._internal);
  if (v9)
  {
    unsigned char v10[80] = v7;
    uint64_t v6 = v8;
    uint64_t v8 = 0;
    uint64_t v11 = v6;
    raiseDOMErrorException();
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10, v5);
}

- (__int16)compareBoundaryPoints:(unsigned __int16)how sourceRange:(DOMRange *)sourceRange
{
  uint64_t v5 = how;
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v12);
  if (!sourceRange) {
    raiseTypeErrorException();
  }
  WebCore::Range::compareBoundaryPoints(self->super._internal, v5, sourceRange->super._internal);
  if (v11)
  {
    if (v11 == 1)
    {
      v12[80] = v9;
      uint64_t v13 = v10;
      raiseDOMErrorException();
    }
    __int16 result = std::__throw_bad_variant_access[abi:sn180100]();
    __break(1u);
  }
  else
  {
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v12, v7);
    return v9;
  }
  return result;
}

- (void)deleteContents
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WebCore::Range::deleteContents(&v5, self->super._internal);
  if (v7)
  {
    v8[80] = v5;
    uint64_t v4 = v6;
    uint64_t v6 = 0;
    uint64_t v9 = v4;
    raiseDOMErrorException();
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8, v3);
}

- (DOMDocumentFragment)extractContents
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v12);
  WebCore::Range::extractContents((uint64_t *)&v8, self->super._internal);
  if (v10)
  {
    if (v10 == 1)
    {
      v13[0] = (_BYTE)v8;
      uint64_t v7 = v9;
      uint64_t v9 = 0;
      uint64_t v14 = v7;
      raiseDOMErrorException();
    }
    __int16 result = (DOMDocumentFragment *)std::__throw_bad_variant_access[abi:sn180100]();
    __break(1u);
  }
  else
  {
    BOOL v3 = v8;
    uint64_t v8 = 0;
    int v11 = v3;
    uint64_t v5 = (DOMDocumentFragment *)kit(v3);
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
    if (v10 != -1) {
      ((void (*)(unsigned char *, WebCore::Node **))off_1F3C7A228[v10])(v13, &v8);
    }
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v12, v4);
    return v5;
  }
  return result;
}

- (DOMDocumentFragment)cloneContents
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v12);
  WebCore::Range::cloneContents((uint64_t *)&v8, self->super._internal);
  if (v10)
  {
    if (v10 == 1)
    {
      v13[0] = (_BYTE)v8;
      uint64_t v7 = v9;
      uint64_t v9 = 0;
      uint64_t v14 = v7;
      raiseDOMErrorException();
    }
    __int16 result = (DOMDocumentFragment *)std::__throw_bad_variant_access[abi:sn180100]();
    __break(1u);
  }
  else
  {
    BOOL v3 = v8;
    uint64_t v8 = 0;
    int v11 = v3;
    uint64_t v5 = (DOMDocumentFragment *)kit(v3);
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
    if (v10 != -1) {
      ((void (*)(unsigned char *, WebCore::Node **))off_1F3C7A228[v10])(v13, &v8);
    }
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v12, v4);
    return v5;
  }
  return result;
}

- (void)insertNode:(DOMNode *)newNode
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v11);
  if (!newNode) {
    raiseTypeErrorException();
  }
  internal = newNode->super._internal;
  *((_DWORD *)internal + 7) += 2;
  uint64_t v7 = internal;
  WebCore::Range::insertNode();
  if (v10)
  {
    v11[80] = v8;
    uint64_t v12 = v9;
    raiseDOMErrorException();
  }
  if (!v7) {
    goto LABEL_6;
  }
  if (*((_DWORD *)v7 + 7) != 2)
  {
    *((_DWORD *)v7 + 7) -= 2;
LABEL_6:
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v11, v5);
    return;
  }
  if ((*((_WORD *)v7 + 17) & 0x400) != 0) {
    goto LABEL_6;
  }
  WebCore::Node::removedLastRef(v7);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v11, v6);
}

- (void)surroundContents:(DOMNode *)newParent
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10);
  if (!newParent) {
    raiseTypeErrorException();
  }
  WebCore::Range::surroundContents(&v7, self->super._internal, newParent->super._internal);
  if (v9)
  {
    unsigned char v10[80] = v7;
    uint64_t v6 = v8;
    uint64_t v8 = 0;
    uint64_t v11 = v6;
    raiseDOMErrorException();
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10, v5);
}

- (DOMRange)cloneRange
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WebCore::Range::cloneRange((uint64_t *)&v7, self->super._internal);
  uint64_t v4 = kit(v7);
  uint64_t v5 = v7;
  uint64_t v7 = 0;
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

- (NSString)toString
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WebCore::Range::toString((uint64_t *)&v7, self->super._internal);
  if (v7)
  {
    uint64_t v4 = (__CFString *)WTF::StringImpl::operator NSString *();
    uint64_t v5 = v7;
    uint64_t v7 = 0;
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
    uint64_t v4 = &stru_1F3C7DA90;
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8, v3);
  return &v4->isa;
}

- (void)detach
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v3);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v3, v2);
}

- (DOMDocumentFragment)createContextualFragment:(NSString *)html
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v15);
  MEMORY[0x1E4E442D0](&v9, html);
  int v10 = 1;
  WebCore::Range::createContextualFragment();
  if (v13)
  {
    if (v13 == 1)
    {
      v16[0] = (_BYTE)v11;
      uint64_t v8 = v12;
      uint64_t v12 = 0;
      uint64_t v17 = v8;
      raiseDOMErrorException();
    }
    __int16 result = (DOMDocumentFragment *)std::__throw_bad_variant_access[abi:sn180100]();
    __break(1u);
  }
  else
  {
    uint64_t v4 = v11;
    uint64_t v11 = 0;
    uint64_t v14 = v4;
    uint64_t v6 = (DOMDocumentFragment *)kit(v4);
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
      ((void (*)(unsigned char *, WebCore::Node **))off_1F3C7A228[v13])(v16, &v11);
    }
    int v13 = -1;
    if (v10 != -1) {
      ((void (*)(unsigned char *, uint64_t *))off_1F3C7A238[v10])(v16, &v9);
    }
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v15, v5);
    return v6;
  }
  return result;
}

- (__int16)compareNode:(DOMNode *)refNode
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v12);
  if (!refNode) {
    raiseTypeErrorException();
  }
  WebCore::Range::compareNode(&v9, self->super._internal, refNode->super._internal);
  if (v11)
  {
    if (v11 == 1)
    {
      unsigned char v12[80] = v9;
      uint64_t v8 = v10;
      uint64_t v10 = 0;
      uint64_t v13 = v8;
      raiseDOMErrorException();
    }
    __int16 result = std::__throw_bad_variant_access[abi:sn180100]();
    __break(1u);
  }
  else
  {
    __int16 v6 = v9;
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v12, v5);
    return v6;
  }
  return result;
}

- (BOOL)intersectsNode:(DOMNode *)refNode
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  if (!refNode) {
    raiseTypeErrorException();
  }
  char v5 = WebCore::Range::intersectsNode(self->super._internal, refNode->super._internal);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8, v6);
  return v5;
}

- (__int16)comparePoint:(DOMNode *)refNode offset:(int)offset
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v11);
  if (!refNode) {
    raiseTypeErrorException();
  }
  WebCore::Range::comparePoint(self->super._internal, refNode->super._internal);
  if (v10)
  {
    if (v10 == 1)
    {
      v11[80] = v8;
      uint64_t v12 = v9;
      raiseDOMErrorException();
    }
    __int16 result = std::__throw_bad_variant_access[abi:sn180100]();
    __break(1u);
  }
  else
  {
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v11, v6);
    return v8;
  }
  return result;
}

- (BOOL)isPointInRange:(DOMNode *)refNode offset:(int)offset
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v11);
  if (!refNode) {
    raiseTypeErrorException();
  }
  WebCore::Range::isPointInRange(self->super._internal, refNode->super._internal);
  if (v10)
  {
    if (v10 == 1)
    {
      v11[80] = v8;
      uint64_t v12 = v9;
      raiseDOMErrorException();
    }
    BOOL result = std::__throw_bad_variant_access[abi:sn180100]();
    __break(1u);
  }
  else
  {
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v11, v6);
    return v8;
  }
  return result;
}

- (void)expand:(id)a3
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v14);
  internal = self->super._internal;
  MEMORY[0x1E4E442D0](&v10, a3);
  WebCore::Range::expand(&v11, internal, (const WTF::String *)&v10);
  if (v13)
  {
    v14[80] = v11;
    uint64_t v9 = v12;
    uint64_t v12 = 0;
    uint64_t v15 = v9;
    raiseDOMErrorException();
  }
  uint64_t v7 = v10;
  int v10 = 0;
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

- (void)move:(unsigned int)a3 inDirection:(int)a4
{
  MEMORY[0x1E4E45500](v25, 0);
  WebCore::makeSimpleRange();
  WebCore::VisibleSelection::VisibleSelection();
  WebCore::FrameSelection::setSelection();
  WebCore::VisibleSelection::~VisibleSelection((WebCore::VisibleSelection *)&v24);
  __int16 v6 = v23;
  v23 = 0;
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
  uint64_t v7 = v22;
  v22 = 0;
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
  if (a4 == 4)
  {
    if (!a3) {
      goto LABEL_19;
    }
  }
  else if (a4 == 5)
  {
    if (!a3) {
      goto LABEL_19;
    }
  }
  else if (!a3)
  {
    goto LABEL_19;
  }
  do
  {
    WebCore::FrameSelection::modify();
    --a3;
  }
  while (a3);
LABEL_19:
  WebCore::Position::parentAnchoredEquivalent((uint64_t *)&v24, (WebCore::Position *)&v26);
  WebCore::Position::parentAnchoredEquivalent((uint64_t *)&v22, (WebCore::Position *)&v27);
  if (!WebCore::Position::containerNode((WebCore::Position *)&v24)) {
    goto LABEL_30;
  }
  uint64_t v8 = WebCore::Position::containerNode((WebCore::Position *)&v24);
  *(_DWORD *)(v8 + 28) += 2;
  v18 = (WebCore::Node *)v8;
  WebCore::Range::setStart();
  if (v21 && v20)
  {
    if (*(_DWORD *)v20 == 2)
    {
      WTF::StringImpl::destroy(v20, v9);
      int v10 = v18;
      if (!v18) {
        goto LABEL_30;
      }
      goto LABEL_25;
    }
    *(_DWORD *)v20 -= 2;
  }
  int v10 = v18;
  if (!v18) {
    goto LABEL_30;
  }
LABEL_25:
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
LABEL_30:
  if (!WebCore::Position::containerNode((WebCore::Position *)&v22)) {
    goto LABEL_41;
  }
  uint64_t v11 = WebCore::Position::containerNode((WebCore::Position *)&v22);
  *(_DWORD *)(v11 + 28) += 2;
  v19 = (WebCore::Node *)v11;
  WebCore::Range::setEnd();
  if (v17 && v16)
  {
    if (*(_DWORD *)v16 == 2)
    {
      WTF::StringImpl::destroy(v16, v12);
      char v13 = v19;
      if (!v19) {
        goto LABEL_41;
      }
      goto LABEL_36;
    }
    *(_DWORD *)v16 -= 2;
  }
  char v13 = v19;
  if (!v19) {
    goto LABEL_41;
  }
LABEL_36:
  if (*((_DWORD *)v13 + 7) == 2)
  {
    if ((*((_WORD *)v13 + 17) & 0x400) == 0) {
      WebCore::Node::removedLastRef(v13);
    }
  }
  else
  {
    *((_DWORD *)v13 + 7) -= 2;
  }
LABEL_41:
  uint64_t v14 = v22;
  v22 = 0;
  if (v14)
  {
    if (*((_DWORD *)v14 + 7) == 2)
    {
      if ((*((_WORD *)v14 + 17) & 0x400) == 0) {
        WebCore::Node::removedLastRef(v14);
      }
    }
    else
    {
      *((_DWORD *)v14 + 7) -= 2;
    }
  }
  uint64_t v15 = v24;
  v24 = 0;
  if (v15)
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
  }
  MEMORY[0x1E4E45510](v25);
}

- (void)extend:(unsigned int)a3 inDirection:(int)a4
{
  MEMORY[0x1E4E45500](v24, 0);
  WebCore::makeSimpleRange();
  WebCore::VisibleSelection::VisibleSelection();
  WebCore::FrameSelection::setSelection();
  WebCore::VisibleSelection::~VisibleSelection((WebCore::VisibleSelection *)&v23);
  char v5 = v22;
  v22 = 0;
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
  __int16 v6 = v21;
  char v21 = 0;
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
  for (; a3; --a3)
    WebCore::FrameSelection::modify();
  WebCore::Position::parentAnchoredEquivalent((uint64_t *)&v23, (WebCore::Position *)&v25);
  WebCore::Position::parentAnchoredEquivalent((uint64_t *)&v21, (WebCore::Position *)&v26);
  if (WebCore::Position::containerNode((WebCore::Position *)&v23))
  {
    uint64_t v7 = WebCore::Position::containerNode((WebCore::Position *)&v23);
    *(_DWORD *)(v7 + 28) += 2;
    char v17 = (WebCore::Node *)v7;
    WebCore::Range::setStart();
    if (v20 && v19)
    {
      if (*(_DWORD *)v19 == 2)
      {
        WTF::StringImpl::destroy(v19, v8);
        uint64_t v9 = v17;
        if (!v17) {
          goto LABEL_24;
        }
        goto LABEL_19;
      }
      *(_DWORD *)v19 -= 2;
    }
    uint64_t v9 = v17;
    if (!v17) {
      goto LABEL_24;
    }
LABEL_19:
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
LABEL_24:
  if (!WebCore::Position::containerNode((WebCore::Position *)&v21)) {
    goto LABEL_35;
  }
  uint64_t v10 = WebCore::Position::containerNode((WebCore::Position *)&v21);
  *(_DWORD *)(v10 + 28) += 2;
  v18 = (WebCore::Node *)v10;
  WebCore::Range::setEnd();
  if (v16 && v15)
  {
    if (*(_DWORD *)v15 == 2)
    {
      WTF::StringImpl::destroy(v15, v11);
      uint64_t v12 = v18;
      if (!v18) {
        goto LABEL_35;
      }
      goto LABEL_30;
    }
    *(_DWORD *)v15 -= 2;
  }
  uint64_t v12 = v18;
  if (!v18) {
    goto LABEL_35;
  }
LABEL_30:
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
LABEL_35:
  char v13 = v21;
  char v21 = 0;
  if (v13)
  {
    if (*((_DWORD *)v13 + 7) == 2)
    {
      if ((*((_WORD *)v13 + 17) & 0x400) == 0) {
        WebCore::Node::removedLastRef(v13);
      }
    }
    else
    {
      *((_DWORD *)v13 + 7) -= 2;
    }
  }
  uint64_t v14 = v23;
  v23 = 0;
  if (v14)
  {
    if (*((_DWORD *)v14 + 7) == 2)
    {
      if ((*((_WORD *)v14 + 17) & 0x400) == 0) {
        WebCore::Node::removedLastRef(v14);
      }
    }
    else
    {
      *((_DWORD *)v14 + 7) -= 2;
    }
  }
  MEMORY[0x1E4E45510](v24);
}

- (id)firstNode
{
  WebCore::makeSimpleRange();
  AncestorSibling = v8;
  __int16 v3 = *((_WORD *)v8 + 16);
  if ((v3 & 1) == 0)
  {
    uint64_t v4 = (const Node *)v9;
    if ((v3 & 4) != 0)
    {
      char v5 = (WebCore::Node *)WebCore::ContainerNode::traverseToChildAt(v8);
      if (v5) {
        goto LABEL_9;
      }
      uint64_t v4 = (const Node *)v9;
      AncestorSibling = v8;
    }
    if (v4)
    {
      char v5 = (WebCore::Node *)*((void *)AncestorSibling + 8);
      if (v5) {
        goto LABEL_9;
      }
      AncestorSibling = (WebCore::NodeTraversal *)WebCore::NodeTraversal::nextAncestorSibling(AncestorSibling, v4);
    }
  }
  char v5 = AncestorSibling;
LABEL_9:
  __int16 v6 = kit(v5);
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
  if (!v8) {
    return v6;
  }
  if (*((_DWORD *)v8 + 7) != 2)
  {
    *((_DWORD *)v8 + 7) -= 2;
    return v6;
  }
  if ((*((_WORD *)v8 + 17) & 0x400) != 0) {
    return v6;
  }
  WebCore::Node::removedLastRef(v8);
  return v6;
}

- (WebArchive)webArchive
{
  v2 = [WebArchive alloc];
  WebCore::makeSimpleRange();
  WebCore::LegacyWebArchive::create((uint64_t *)&v11, (WebCore::LegacyWebArchive *)&v9, v3);
  uint64_t v4 = (id)CFMakeCollectable([(WebArchive *)v2 _initWithCoreLegacyWebArchive:&v11]);
  char v5 = v11;
  uint64_t v11 = 0;
  if (!v5)
  {
LABEL_4:
    __int16 v6 = v10;
    uint64_t v10 = 0;
    if (!v6) {
      goto LABEL_11;
    }
    goto LABEL_7;
  }
  if (v5[2] != 1)
  {
    --v5[2];
    goto LABEL_4;
  }
  (*(void (**)(_DWORD *))(*(void *)v5 + 8))(v5);
  __int16 v6 = v10;
  uint64_t v10 = 0;
  if (!v6) {
    goto LABEL_11;
  }
LABEL_7:
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
LABEL_11:
  uint64_t v7 = v9;
  unsigned int v9 = 0;
  if (!v7) {
    return v4;
  }
  if (*((_DWORD *)v7 + 7) != 2)
  {
    *((_DWORD *)v7 + 7) -= 2;
    return v4;
  }
  if ((*((_WORD *)v7 + 17) & 0x400) != 0) {
    return v4;
  }
  WebCore::Node::removedLastRef(v7);
  return v4;
}

- (NSString)markupString
{
  WebCore::makeSimpleRange();
  WebCore::documentTypeString((uint64_t *)&v16, *(WebCore **)(*((void *)v17 + 6) + 8), v2);
  BOOL result = (NSString *)WebCore::serializePreservingVisualAppearance();
  if (v16)
  {
    int v4 = *((_DWORD *)v16 + 1);
    if (v15) {
      goto LABEL_3;
    }
  }
  else
  {
    int v4 = 0;
    if (v15)
    {
LABEL_3:
      int v5 = *((_DWORD *)v15 + 1);
      if ((v5 | v4) < 0) {
        goto LABEL_40;
      }
      goto LABEL_7;
    }
  }
  int v5 = 0;
  if (v4 < 0) {
    goto LABEL_40;
  }
LABEL_7:
  BOOL result = (NSString *)(v4 + v5);
  if (__OFADD__(v4, v5)) {
    goto LABEL_40;
  }
  if (!v16)
  {
    if (!v15)
    {
      int v7 = 1;
      goto LABEL_15;
    }
LABEL_13:
    int v7 = (*((unsigned __int8 *)v15 + 16) >> 2) & 1;
    goto LABEL_15;
  }
  unsigned int v6 = *((_DWORD *)v16 + 4);
  int v7 = (v6 >> 2) & 1;
  if (v15 && (v6 & 4) != 0) {
    goto LABEL_13;
  }
LABEL_15:
  BOOL result = (NSString *)WTF::tryMakeStringImplFromAdaptersInternal<WTF::StringTypeAdapter<WTF::String,void>,WTF::StringTypeAdapter<WTF::String,void>>((unint64_t)result, v7, (uint64_t)v16, (uint64_t)v15, &v19);
  uint64_t v8 = v19;
  if (v19)
  {
    uint64_t v10 = (NSString *)WTF::StringImpl::operator NSString *();
    if (*(_DWORD *)v8 == 2)
    {
      WTF::StringImpl::destroy(v8, v9);
      uint64_t v11 = v15;
      if (!v15) {
        goto LABEL_22;
      }
    }
    else
    {
      *(_DWORD *)v8 -= 2;
      uint64_t v11 = v15;
      if (!v15) {
        goto LABEL_22;
      }
    }
    if (*(_DWORD *)v11 == 2)
    {
      WTF::StringImpl::destroy(v11, v9);
      uint64_t v12 = v16;
      char v16 = 0;
      if (!v12) {
        goto LABEL_27;
      }
LABEL_25:
      if (*(_DWORD *)v12 == 2)
      {
        WTF::StringImpl::destroy(v12, v9);
        char v13 = v18;
        v18 = 0;
        if (!v13) {
          goto LABEL_34;
        }
LABEL_30:
        if (*((_DWORD *)v13 + 7) == 2)
        {
          if ((*((_WORD *)v13 + 17) & 0x400) == 0) {
            WebCore::Node::removedLastRef(v13);
          }
        }
        else
        {
          *((_DWORD *)v13 + 7) -= 2;
        }
LABEL_34:
        uint64_t v14 = v17;
        char v17 = 0;
        if (v14)
        {
          if (*((_DWORD *)v14 + 7) == 2)
          {
            if ((*((_WORD *)v14 + 17) & 0x400) == 0)
            {
              WebCore::Node::removedLastRef(v14);
              return v10;
            }
          }
          else
          {
            *((_DWORD *)v14 + 7) -= 2;
          }
        }
        return v10;
      }
      *(_DWORD *)v12 -= 2;
LABEL_27:
      char v13 = v18;
      v18 = 0;
      if (!v13) {
        goto LABEL_34;
      }
      goto LABEL_30;
    }
    *(_DWORD *)v11 -= 2;
LABEL_22:
    uint64_t v12 = v16;
    char v16 = 0;
    if (!v12) {
      goto LABEL_27;
    }
    goto LABEL_25;
  }
LABEL_40:
  __break(0xC471u);
  return result;
}

- (id)startPosition
{
  v2 = (WebCore::Node *)*((void *)self->super._internal + 4);
  *((_DWORD *)v2 + 7) += 2;
  unsigned int v6 = v2;
  WebCore::Position::Position();
  WebCore::VisiblePosition::VisiblePosition();
  id v3 = +[WebVisiblePosition _wrapVisiblePosition:&v8];
  int v4 = v8;
  uint64_t v8 = 0;
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
  if (!v6) {
    return v3;
  }
  if (*((_DWORD *)v6 + 7) != 2)
  {
    *((_DWORD *)v6 + 7) -= 2;
    return v3;
  }
  if ((*((_WORD *)v6 + 17) & 0x400) != 0) {
    return v3;
  }
  WebCore::Node::removedLastRef(v6);
  return v3;
}

- (id)endPosition
{
  v2 = (WebCore::Node *)*((void *)self->super._internal + 7);
  *((_DWORD *)v2 + 7) += 2;
  unsigned int v6 = v2;
  WebCore::Position::Position();
  WebCore::VisiblePosition::VisiblePosition();
  id v3 = +[WebVisiblePosition _wrapVisiblePosition:&v8];
  int v4 = v8;
  uint64_t v8 = 0;
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
  if (!v6) {
    return v3;
  }
  if (*((_DWORD *)v6 + 7) != 2)
  {
    *((_DWORD *)v6 + 7) -= 2;
    return v3;
  }
  if ((*((_WORD *)v6 + 17) & 0x400) != 0) {
    return v3;
  }
  WebCore::Node::removedLastRef(v6);
  return v3;
}

- (id)enclosingWordRange
{
  id v3 = [(DOMRange *)self startPosition];
  if (v3) {
    [v3 _visiblePosition];
  }
  else {
    memset(&v15, 0, sizeof(v15));
  }
  id v4 = [(DOMRange *)self endPosition];
  if (v4) {
    [v4 _visiblePosition];
  }
  else {
    memset(&v16, 0, sizeof(v16));
  }
  WebCore::VisibleSelection::VisibleSelection((WebCore::VisibleSelection *)v17, &v15, &v16);
  var0 = v16.var0.var0.var0;
  v16.var0.var0.var0 = 0;
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
  unsigned int v6 = v15.var0.var0.var0;
  v15.var0.var0.var0 = 0;
  if (v6)
  {
    if (*((_DWORD *)v6 + 7) == 2)
    {
      if ((*((_WORD *)v6 + 17) & 0x400) == 0) {
        WebCore::Node::removedLastRef((WebCore::Node *)v6);
      }
    }
    else
    {
      *((_DWORD *)v6 + 7) -= 2;
    }
  }
  WebCore::FrameSelection::wordSelectionContainingCaretSelection();
  WebCore::VisibleSelection::operator=(v17, (uint64_t *)&v15);
  WebCore::VisibleSelection::~VisibleSelection((WebCore::VisibleSelection *)&v15);
  WebCore::VisiblePosition::VisiblePosition();
  id v7 = +[WebVisiblePosition _wrapVisiblePosition:&v14];
  uint64_t v8 = v14;
  uint64_t v14 = 0;
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
  WebCore::VisiblePosition::VisiblePosition();
  id v9 = +[WebVisiblePosition _wrapVisiblePosition:&v13];
  uint64_t v10 = v13;
  char v13 = 0;
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
  id v11 = +[DOMRange rangeForFirstPosition:v7 second:v9];
  WebCore::VisibleSelection::~VisibleSelection((WebCore::VisibleSelection *)v17);
  return v11;
}

+ (id)rangeForFirstPosition:(id)a3 second:(id)a4
{
  if (!a3)
  {
    memset(&v25, 0, sizeof(v25));
    if (a4) {
      goto LABEL_3;
    }
LABEL_5:
    v22 = 0;
    uint64_t v23 = 0;
    BOOL v24 = 0;
    goto LABEL_6;
  }
  [a3 _visiblePosition];
  if (!a4) {
    goto LABEL_5;
  }
LABEL_3:
  [a4 _visiblePosition];
LABEL_6:
  int v6 = (char)WebCore::documentOrder((WebCore *)&v22, &v25, (const VisiblePosition *)a3);
  if (v6 != -127 && v6 < 0)
  {
    var0 = v25.var0.var0.var0;
    char v8 = *((unsigned char *)&v25.var0 + 12);
    unsigned int var1 = v25.var0.var1;
    BOOL v10 = v25.var1;
    v25.var0.var0.var0 = (Node *)v22;
    v25.var0.unsigned int var1 = v23;
    *((unsigned char *)&v25.var0 + 12) = BYTE4(v23);
    v25.unsigned int var1 = v24;
    v22 = (WebCore::Node *)var0;
    LODWORD(v23) = var1;
    BYTE4(v23) = v8;
    LOBYTE(v24) = v10;
  }
  WebCore::makeBoundaryPoint(&v28, (WebCore *)&v25, v5);
  WebCore::makeBoundaryPoint((uint64_t *)&v26, (WebCore *)&v22, v11);
  if (v29 && v27)
  {
    WebCore::SimpleRange::SimpleRange();
    v19 = v30;
    char v20 = v31;
    char v21 = 1;
    if (!v27) {
      goto LABEL_19;
    }
  }
  else
  {
    LOBYTE(v19) = 0;
    char v21 = 0;
    if (!v27) {
      goto LABEL_19;
    }
  }
  uint64_t v12 = v26;
  uint64_t v26 = 0;
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
LABEL_19:
  if (v29)
  {
    uint64_t v13 = v28;
    uint64_t v28 = 0;
    if (v13)
    {
      if (*(_DWORD *)(v13 + 28) == 2)
      {
        if ((*(_WORD *)(v13 + 34) & 0x400) == 0) {
          WebCore::Node::removedLastRef((WebCore::Node *)v13);
        }
      }
      else
      {
        *(_DWORD *)(v13 + 28) -= 2;
      }
    }
  }
  WebCore::createLiveRange();
  uint64_t v14 = kit(v30);
  VisiblePosition v15 = v30;
  v30 = 0;
  if (!v15)
  {
LABEL_28:
    if (!v21) {
      goto LABEL_41;
    }
    goto LABEL_31;
  }
  if (*((_DWORD *)v15 + 2) != 1)
  {
    --*((_DWORD *)v15 + 2);
    goto LABEL_28;
  }
  (*(void (**)(DOMObjectInternal *))(*(void *)v15 + 8))(v15);
  if (!v21) {
    goto LABEL_41;
  }
LABEL_31:
  if (v20)
  {
    if (*((_DWORD *)v20 + 7) == 2)
    {
      if ((*((_WORD *)v20 + 17) & 0x400) == 0) {
        WebCore::Node::removedLastRef(v20);
      }
    }
    else
    {
      *((_DWORD *)v20 + 7) -= 2;
    }
  }
  if (v19)
  {
    if (*((_DWORD *)v19 + 7) == 2)
    {
      if ((*((_WORD *)v19 + 17) & 0x400) == 0) {
        WebCore::Node::removedLastRef(v19);
      }
    }
    else
    {
      *((_DWORD *)v19 + 7) -= 2;
    }
  }
LABEL_41:
  VisiblePosition v16 = v22;
  v22 = 0;
  if (v16)
  {
    if (*((_DWORD *)v16 + 7) == 2)
    {
      if ((*((_WORD *)v16 + 17) & 0x400) == 0) {
        WebCore::Node::removedLastRef(v16);
      }
    }
    else
    {
      *((_DWORD *)v16 + 7) -= 2;
    }
  }
  char v17 = v25.var0.var0.var0;
  v25.var0.var0.var0 = 0;
  if (v17)
  {
    if (*((_DWORD *)v17 + 7) == 2)
    {
      if ((*((_WORD *)v17 + 17) & 0x400) == 0)
      {
        WebCore::Node::removedLastRef((WebCore::Node *)v17);
        return v14;
      }
    }
    else
    {
      *((_DWORD *)v17 + 7) -= 2;
    }
  }
  return v14;
}

@end