@interface DOMHTMLAreaElement
- (BOOL)noHref;
- (CGRect)boundingBoxWithOwner:(id)a3;
- (NSString)accessKey;
- (NSString)alt;
- (NSString)coords;
- (NSString)hashName;
- (NSString)host;
- (NSString)hostname;
- (NSString)href;
- (NSString)pathname;
- (NSString)port;
- (NSString)protocol;
- (NSString)search;
- (NSString)shape;
- (NSString)target;
- (NSURL)absoluteLinkURL;
- (_WKQuad)absoluteQuadWithOwner:(SEL)a3;
- (id)absoluteQuadsWithOwner:(id)a3;
- (id)boundingBoxesWithOwner:(id)a3;
- (id)origin;
- (id)ping;
- (id)rel;
- (id)relList;
- (void)setAccessKey:(NSString *)accessKey;
- (void)setAlt:(NSString *)alt;
- (void)setCoords:(NSString *)coords;
- (void)setHref:(NSString *)href;
- (void)setNoHref:(BOOL)noHref;
- (void)setPing:(id)a3;
- (void)setRel:(id)a3;
- (void)setShape:(NSString *)shape;
- (void)setTarget:(NSString *)target;
@end

@implementation DOMHTMLAreaElement

- (NSString)alt
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  if (*(void *)WebCore::Element::getAttribute()) {
    v3 = (__CFString *)WTF::StringImpl::operator NSString *();
  }
  else {
    v3 = &stru_1F3C7DA90;
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v2);
  return &v3->isa;
}

- (void)setAlt:(NSString *)alt
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WTF::AtomStringImpl::add((uint64_t *)&v9, (WTF::AtomStringImpl *)alt, v4);
  v7 = v9;
  WebCore::Element::setAttributeWithoutSynchronization();
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

- (NSString)coords
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  if (*(void *)WebCore::Element::getAttribute()) {
    v3 = (__CFString *)WTF::StringImpl::operator NSString *();
  }
  else {
    v3 = &stru_1F3C7DA90;
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v2);
  return &v3->isa;
}

- (void)setCoords:(NSString *)coords
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WTF::AtomStringImpl::add((uint64_t *)&v9, (WTF::AtomStringImpl *)coords, v4);
  v7 = v9;
  WebCore::Element::setAttributeWithoutSynchronization();
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

- (BOOL)noHref
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v12);
  uint64_t v4 = *((void *)self->super.super.super.super._internal + 14);
  if (!v4) {
    goto LABEL_12;
  }
  unsigned int v5 = *(_DWORD *)(v4 + 4);
  if (v5)
  {
    v6 = *(uint64_t **)(v4 + 40);
    LODWORD(v7) = *(_DWORD *)(v4 + 52);
    if (!v7)
    {
LABEL_12:
      BOOL v10 = 0;
      goto LABEL_13;
    }
  }
  else
  {
    v6 = (uint64_t *)(v4 + 32);
    LODWORD(v7) = v5 >> 5;
    if (!v7) {
      goto LABEL_12;
    }
  }
  uint64_t v8 = *MEMORY[0x1E4FB6588];
  uint64_t v7 = v7;
  while (1)
  {
    uint64_t v9 = *v6;
    if (*v6 == v8 || *(void *)(v9 + 24) == *(void *)(v8 + 24) && *(void *)(v9 + 32) == *(void *)(v8 + 32)) {
      break;
    }
    v6 += 2;
    if (!--v7) {
      goto LABEL_12;
    }
  }
  BOOL v10 = 1;
LABEL_13:
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v12, v3);
  return v10;
}

- (void)setNoHref:(BOOL)noHref
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v4);
  WebCore::Element::setBooleanAttribute();
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v4, v3);
}

- (id)ping
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  if (*(void *)WebCore::Element::getAttribute()) {
    v3 = (__CFString *)WTF::StringImpl::operator NSString *();
  }
  else {
    v3 = &stru_1F3C7DA90;
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v2);
  return v3;
}

- (void)setPing:(id)a3
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WTF::AtomStringImpl::add((uint64_t *)&v9, (WTF::AtomStringImpl *)a3, v4);
  uint64_t v7 = v9;
  WebCore::Element::setAttributeWithoutSynchronization();
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

- (id)rel
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  if (*(void *)WebCore::Element::getAttribute()) {
    v3 = (__CFString *)WTF::StringImpl::operator NSString *();
  }
  else {
    v3 = &stru_1F3C7DA90;
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v2);
  return v3;
}

- (void)setRel:(id)a3
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WTF::AtomStringImpl::add((uint64_t *)&v9, (WTF::AtomStringImpl *)a3, v4);
  uint64_t v7 = v9;
  WebCore::Element::setAttributeWithoutSynchronization();
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

- (NSString)shape
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  if (*(void *)WebCore::Element::getAttribute()) {
    v3 = (__CFString *)WTF::StringImpl::operator NSString *();
  }
  else {
    v3 = &stru_1F3C7DA90;
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v2);
  return &v3->isa;
}

- (void)setShape:(NSString *)shape
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WTF::AtomStringImpl::add((uint64_t *)&v9, (WTF::AtomStringImpl *)shape, v4);
  uint64_t v7 = v9;
  WebCore::Element::setAttributeWithoutSynchronization();
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

- (NSString)target
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  if (*(void *)WebCore::Element::getAttribute()) {
    v3 = (__CFString *)WTF::StringImpl::operator NSString *();
  }
  else {
    v3 = &stru_1F3C7DA90;
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v2);
  return &v3->isa;
}

- (void)setTarget:(NSString *)target
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WTF::AtomStringImpl::add((uint64_t *)&v9, (WTF::AtomStringImpl *)target, v4);
  uint64_t v7 = v9;
  WebCore::Element::setAttributeWithoutSynchronization();
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

- (NSString)accessKey
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  if (*(void *)WebCore::Element::getAttribute()) {
    v3 = (__CFString *)WTF::StringImpl::operator NSString *();
  }
  else {
    v3 = &stru_1F3C7DA90;
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v2);
  return &v3->isa;
}

- (void)setAccessKey:(NSString *)accessKey
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WTF::AtomStringImpl::add((uint64_t *)&v9, (WTF::AtomStringImpl *)accessKey, v4);
  uint64_t v7 = v9;
  WebCore::Element::setAttributeWithoutSynchronization();
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

- (NSURL)absoluteLinkURL
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6);
  v3 = [(DOMElement *)self _getURLAttribute:@"href"];
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6, v4);
  return v3;
}

- (id)relList
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  v3 = (DOMObjectInternal *)WebCore::HTMLAnchorElement::relList(self->super.super.super.super._internal);
  CFStringRef v4 = kit(v3);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7, v5);
  return v4;
}

- (NSString)href
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6);
  WebCore::Element::getURLAttribute();
  if (v5)
  {
    v3 = (__CFString *)WTF::StringImpl::operator NSString *();
    if (*(_DWORD *)v5 == 2) {
      WTF::StringImpl::destroy(v5, v2);
    }
    else {
      *(_DWORD *)v5 -= 2;
    }
  }
  else
  {
    v3 = &stru_1F3C7DA90;
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6, v2);
  return &v3->isa;
}

- (void)setHref:(NSString *)href
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WTF::AtomStringImpl::add((uint64_t *)&v9, (WTF::AtomStringImpl *)href, v4);
  uint64_t v7 = v9;
  WebCore::Element::setAttributeWithoutSynchronization();
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

- (id)origin
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WebCore::HTMLAnchorElement::origin((uint64_t *)&v7, self->super.super.super.super._internal);
  if (v7)
  {
    CFStringRef v4 = (__CFString *)WTF::StringImpl::operator NSString *();
    unsigned int v5 = v7;
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
    CFStringRef v4 = &stru_1F3C7DA90;
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8, v3);
  return v4;
}

- (NSString)protocol
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WebCore::URLDecomposition::protocol((uint64_t *)&v7, (WebCore::URLDecomposition *)((char *)self->super.super.super.super._internal + 120));
  if (v7)
  {
    CFStringRef v4 = (__CFString *)WTF::StringImpl::operator NSString *();
    unsigned int v5 = v7;
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
    CFStringRef v4 = &stru_1F3C7DA90;
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8, v3);
  return &v4->isa;
}

- (NSString)host
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WebCore::URLDecomposition::host((uint64_t *)&v7, (WebCore::URLDecomposition *)((char *)self->super.super.super.super._internal + 120));
  if (v7)
  {
    CFStringRef v4 = (__CFString *)WTF::StringImpl::operator NSString *();
    unsigned int v5 = v7;
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
    CFStringRef v4 = &stru_1F3C7DA90;
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8, v3);
  return &v4->isa;
}

- (NSString)hostname
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WebCore::URLDecomposition::hostname((uint64_t *)&v7, (WebCore::URLDecomposition *)((char *)self->super.super.super.super._internal + 120));
  if (v7)
  {
    CFStringRef v4 = (__CFString *)WTF::StringImpl::operator NSString *();
    unsigned int v5 = v7;
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
    CFStringRef v4 = &stru_1F3C7DA90;
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8, v3);
  return &v4->isa;
}

- (NSString)port
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WebCore::URLDecomposition::port((uint64_t *)&v7, (WebCore::URLDecomposition *)((char *)self->super.super.super.super._internal + 120));
  if (v7)
  {
    CFStringRef v4 = (__CFString *)WTF::StringImpl::operator NSString *();
    unsigned int v5 = v7;
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
    CFStringRef v4 = &stru_1F3C7DA90;
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8, v3);
  return &v4->isa;
}

- (NSString)pathname
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WebCore::URLDecomposition::pathname((uint64_t *)&v7, (WebCore::URLDecomposition *)((char *)self->super.super.super.super._internal + 120));
  if (v7)
  {
    CFStringRef v4 = (__CFString *)WTF::StringImpl::operator NSString *();
    unsigned int v5 = v7;
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
    CFStringRef v4 = &stru_1F3C7DA90;
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8, v3);
  return &v4->isa;
}

- (NSString)search
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WebCore::URLDecomposition::search((uint64_t *)&v7, (WebCore::URLDecomposition *)((char *)self->super.super.super.super._internal + 120));
  if (v7)
  {
    CFStringRef v4 = (__CFString *)WTF::StringImpl::operator NSString *();
    unsigned int v5 = v7;
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
    CFStringRef v4 = &stru_1F3C7DA90;
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8, v3);
  return &v4->isa;
}

- (NSString)hashName
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WebCore::URLDecomposition::hash((uint64_t *)&v7, (WebCore::URLDecomposition *)((char *)self->super.super.super.super._internal + 120));
  if (v7)
  {
    CFStringRef v4 = (__CFString *)WTF::StringImpl::operator NSString *();
    unsigned int v5 = v7;
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
    CFStringRef v4 = &stru_1F3C7DA90;
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8, v3);
  return &v4->isa;
}

- (CGRect)boundingBoxWithOwner:(id)a3
{
  if (a3)
  {
    if (self) {
      self = (DOMHTMLAreaElement *)self->super.super.super.super._internal;
    }
    WebCore::HTMLAreaElement::computeRect((WebCore::HTMLAreaElement *)self, (WebCore::RenderObject *)(*(void *)(*((void *)a3 + 2) + 72) & 0xFFFFFFFFFFFFLL));
    WebCore::IntRect::operator CGRect();
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

- (_WKQuad)absoluteQuadWithOwner:(SEL)a3
{
  if (a4)
  {
    if (self) {
      self = *(_WKQuad **)&self->p2.x;
    }
    self = (_WKQuad *)WebCore::HTMLAreaElement::computeRect((WebCore::HTMLAreaElement *)self, (WebCore::RenderObject *)(*(void *)(*((void *)a4 + 2) + 72) & 0xFFFFFFFFFFFFLL));
    unsigned int v7 = self - (v6 & 0xFFFFFFC0);
    int v8 = (int)self / 64 + ((int)(v7 + 32) >> 6);
    unsigned int v10 = HIDWORD(self) - (v9 & 0xFFFFFFC0);
    int v11 = (v9 >> 6) + ((int)(v10 + 32) >> 6);
    BOOL v13 = __OFADD__(v7, v12);
    int v14 = v7 + v12;
    int v15 = (v7 >> 31) + 0x7FFFFFFF;
    if (!v13) {
      int v15 = v14;
    }
    int v16 = v15 + 63;
    if (v15 >= 0) {
      int v16 = v15;
    }
    signed int v17 = v15 - (v16 & 0xFFFFFFC0) + 32;
    BOOL v13 = __OFADD__(v10, v5);
    int v18 = v10 + v5;
    int v19 = (v10 >> 31) + 0x7FFFFFFF;
    if (!v13) {
      int v19 = v18;
    }
    retstr->p1.x = (double)v8;
    retstr->p1.y = (double)v11;
    CGFloat v20 = (double)((int)self / 64 + (v16 >> 6) + (v17 >> 6));
    retstr->p2.x = v20;
    retstr->p2.y = (double)v11;
    CGFloat v21 = (double)(SHIDWORD(self) / 64 + v19 / 64 + ((int)(v19 - (v18 & 0xFFFFFFC0) + 32) >> 6));
    retstr->p3.x = v20;
    retstr->p3.y = v21;
    retstr->p4.x = (double)v8;
    retstr->p4.y = v21;
  }
  else
  {
    CGPoint v22 = (CGPoint)*MEMORY[0x1E4F1DAD8];
    retstr->p1 = (CGPoint)*MEMORY[0x1E4F1DAD8];
    retstr->p2 = v22;
    retstr->p3 = v22;
    retstr->p4 = v22;
  }
  return self;
}

- (id)boundingBoxesWithOwner:(id)a3
{
  v5[1] = *MEMORY[0x1E4F143B8];
  double v3 = (void *)MEMORY[0x1E4F29238];
  [(DOMHTMLAreaElement *)self boundingBoxWithOwner:a3];
  v5[0] = objc_msgSend(v3, "valueWithRect:");
  return (id)[MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];
}

- (id)absoluteQuadsWithOwner:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  int v5 = [WKQuadObject alloc];
  if (self) {
    [(DOMHTMLAreaElement *)self absoluteQuadWithOwner:a3];
  }
  else {
    memset(v9, 0, sizeof(v9));
  }
  int v6 = [(WKQuadObject *)v5 initWithQuad:v9];
  v10[0] = v6;
  unsigned int v7 = (void *)[MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  if (v6) {
    CFRelease(v6);
  }
  return v7;
}

@end