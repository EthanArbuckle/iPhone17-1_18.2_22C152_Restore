@interface DOMHTMLElement
- (BOOL)autocorrect;
- (BOOL)draggable;
- (BOOL)hidden;
- (BOOL)isContentEditable;
- (BOOL)spellcheck;
- (BOOL)translate;
- (DOMHTMLCollection)children;
- (NSString)accessKey;
- (NSString)contentEditable;
- (NSString)dir;
- (NSString)idName;
- (NSString)innerText;
- (NSString)lang;
- (NSString)outerText;
- (NSString)title;
- (NSString)titleDisplayString;
- (id)autocapitalize;
- (id)insertAdjacentElement:(id)a3 element:(id)a4;
- (id)webkitdropzone;
- (int)scrollXOffset;
- (int)scrollYOffset;
- (int)structuralComplexityContribution;
- (int)tabIndex;
- (void)absolutePosition:(int *)a3 :(int *)a4 :(int *)a5 :(int *)a6;
- (void)click;
- (void)insertAdjacentHTML:(id)a3 html:(id)a4;
- (void)insertAdjacentText:(id)a3 text:(id)a4;
- (void)setAccessKey:(NSString *)accessKey;
- (void)setAutocapitalize:(id)a3;
- (void)setAutocorrect:(BOOL)a3;
- (void)setContentEditable:(NSString *)contentEditable;
- (void)setDir:(NSString *)dir;
- (void)setDraggable:(BOOL)a3;
- (void)setHidden:(BOOL)a3;
- (void)setIdName:(NSString *)idName;
- (void)setInnerText:(NSString *)innerText;
- (void)setLang:(NSString *)lang;
- (void)setOuterText:(NSString *)outerText;
- (void)setScrollXOffset:(int)a3 scrollYOffset:(int)a4;
- (void)setScrollXOffset:(int)a3 scrollYOffset:(int)a4 adjustForIOSCaret:(BOOL)a5;
- (void)setSpellcheck:(BOOL)a3;
- (void)setTabIndex:(int)tabIndex;
- (void)setTitle:(NSString *)title;
- (void)setTranslate:(BOOL)a3;
- (void)setWebkitdropzone:(id)a3;
@end

@implementation DOMHTMLElement

- (int)scrollXOffset
{
  uint64_t v2 = *((void *)self->super.super.super._internal + 9) & 0xFFFFFFFFFFFFLL;
  if (v2)
  {
    char v3 = *(unsigned char *)(v2 + 45);
    if ((v3 & 2) != 0)
    {
      LODWORD(v2) = 105;
      __break(0xC471u);
    }
    else
    {
      if ((*(unsigned char *)(v2 + 52) & 7) != 1)
      {
        uint64_t v2 = WebCore::RenderObject::containingBlock((WebCore::RenderObject *)v2);
        char v3 = *(unsigned char *)(v2 + 45);
      }
      if ((v3 & 4) != 0)
      {
        if (*(unsigned char *)(v2 + 22))
        {
          uint64_t v2 = *(void *)(v2 + 144);
          if (v2)
          {
            uint64_t v2 = WebCore::RenderLayer::scrollableArea((WebCore::RenderLayer *)v2);
            if (v2) {
              LODWORD(v2) = WebCore::ScrollableArea::scrollOffset((WebCore::ScrollableArea *)v2);
            }
          }
        }
        else
        {
          LODWORD(v2) = 0;
        }
      }
      else
      {
        LODWORD(v2) = 0;
      }
    }
  }
  return v2;
}

- (int)scrollYOffset
{
  uint64_t v2 = *((void *)self->super.super.super._internal + 9) & 0xFFFFFFFFFFFFLL;
  if (v2)
  {
    char v3 = *(unsigned char *)(v2 + 45);
    if ((v3 & 2) != 0)
    {
      LODWORD(v2) = 105;
      __break(0xC471u);
    }
    else
    {
      if ((*(unsigned char *)(v2 + 52) & 7) != 1)
      {
        uint64_t v2 = WebCore::RenderObject::containingBlock((WebCore::RenderObject *)v2);
        char v3 = *(unsigned char *)(v2 + 45);
      }
      if ((v3 & 4) != 0)
      {
        if (*(unsigned char *)(v2 + 22))
        {
          uint64_t v2 = *(void *)(v2 + 144);
          if (v2)
          {
            uint64_t v2 = WebCore::RenderLayer::scrollableArea((WebCore::RenderLayer *)v2);
            if (v2) {
              return (unint64_t)WebCore::ScrollableArea::scrollOffset((WebCore::ScrollableArea *)v2) >> 32;
            }
          }
        }
        else
        {
          LODWORD(v2) = 0;
        }
      }
      else
      {
        LODWORD(v2) = 0;
      }
    }
  }
  return v2;
}

- (void)setScrollXOffset:(int)a3 scrollYOffset:(int)a4
{
}

- (void)setScrollXOffset:(int)a3 scrollYOffset:(int)a4 adjustForIOSCaret:(BOOL)a5
{
  uint64_t v5 = *((void *)self->super.super.super._internal + 9) & 0xFFFFFFFFFFFFLL;
  if (v5)
  {
    if ((*(unsigned char *)(v5 + 45) & 2) != 0)
    {
      __break(0xC471u);
    }
    else
    {
      if ((*(unsigned char *)(v5 + 52) & 7) != 1) {
        uint64_t v5 = WebCore::RenderObject::containingBlock((WebCore::RenderObject *)v5);
      }
      if ((*(unsigned char *)(v5 + 22) & 1) != 0 && (*(unsigned char *)(v5 + 45) & 4) != 0)
      {
        v6 = *(WebCore::RenderLayer **)(v5 + 144);
        if (v6)
        {
          WebCore::RenderLayer::ensureLayerScrollableArea(v6);
          WebCore::RenderLayerScrollableArea::scrollToOffset();
        }
      }
    }
  }
}

- (void)absolutePosition:(int *)a3 :(int *)a4 :(int *)a5 :(int *)a6
{
  if (self) {
    self = (DOMHTMLElement *)self->super.super.super._internal;
  }
  uint64_t v10 = WebCore::Node::renderBox((WebCore::Node *)self);
  if (v10)
  {
    if (a5) {
      *a5 = *(_DWORD *)(v10 + 160) / 64;
    }
    if (a6) {
      *a6 = *(_DWORD *)(v10 + 160) / 64;
    }
    if (a3 && a4)
    {
      float v16 = (float)*a3;
      float v17 = (float)*a4;
      WebCore::RenderObject::localToAbsolute();
      float v11 = roundf(v16);
      if (v11 > -2147500000.0) {
        int v12 = (int)v11;
      }
      else {
        int v12 = 0x80000000;
      }
      if (v11 < 2147500000.0) {
        int v13 = v12;
      }
      else {
        int v13 = 0x7FFFFFFF;
      }
      float v14 = roundf(v17);
      if (v14 >= 2147500000.0)
      {
        int v15 = 0x7FFFFFFF;
      }
      else if (v14 <= -2147500000.0)
      {
        int v15 = 0x80000000;
      }
      else
      {
        int v15 = (int)v14;
      }
      *a3 = v13;
      *a4 = v15;
    }
  }
}

- (NSString)title
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  if (*(void *)WebCore::Element::getAttribute()) {
    char v3 = (__CFString *)WTF::StringImpl::operator NSString *();
  }
  else {
    char v3 = &stru_1F3C7DA90;
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v2);
  return &v3->isa;
}

- (void)setTitle:(NSString *)title
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WTF::AtomStringImpl::add((uint64_t *)&v9, (WTF::AtomStringImpl *)title, v4);
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

- (NSString)lang
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  if (*(void *)WebCore::Element::getAttribute()) {
    char v3 = (__CFString *)WTF::StringImpl::operator NSString *();
  }
  else {
    char v3 = &stru_1F3C7DA90;
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v2);
  return &v3->isa;
}

- (void)setLang:(NSString *)lang
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WTF::AtomStringImpl::add((uint64_t *)&v9, (WTF::AtomStringImpl *)lang, v4);
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

- (BOOL)translate
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LOBYTE(self) = WebCore::HTMLElement::translate(self->super.super.super._internal);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return (char)self;
}

- (void)setTranslate:(BOOL)a3
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  WebCore::HTMLElement::setTranslate(self->super.super.super._internal);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v4);
}

- (NSString)dir
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6);
  if (*(void *)WebCore::HTMLElement::dir(self->super.super.super._internal)) {
    CFStringRef v4 = (__CFString *)WTF::StringImpl::operator NSString *();
  }
  else {
    CFStringRef v4 = &stru_1F3C7DA90;
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6, v3);
  return &v4->isa;
}

- (void)setDir:(NSString *)dir
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WTF::AtomStringImpl::add((uint64_t *)&v9, (WTF::AtomStringImpl *)dir, v4);
  v7 = v9;
  WebCore::HTMLElement::setDir();
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

- (int)tabIndex
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LODWORD(self) = (*(uint64_t (**)(DOMObjectInternal *))(*(void *)self->super.super.super._internal + 584))(self->super.super.super._internal);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return (int)self;
}

- (void)setTabIndex:(int)tabIndex
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  WebCore::Element::setTabIndexForBindings(self->super.super.super._internal);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v4);
}

- (BOOL)draggable
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LOBYTE(self) = (*(uint64_t (**)(DOMObjectInternal *))(*(void *)self->super.super.super._internal + 1168))(self->super.super.super._internal);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return (char)self;
}

- (void)setDraggable:(BOOL)a3
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  WebCore::HTMLElement::setDraggable(self->super.super.super._internal);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v4);
}

- (id)webkitdropzone
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  if (*(void *)WebCore::Element::getAttribute()) {
    char v3 = (__CFString *)WTF::StringImpl::operator NSString *();
  }
  else {
    char v3 = &stru_1F3C7DA90;
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v2);
  return v3;
}

- (void)setWebkitdropzone:(id)a3
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WTF::AtomStringImpl::add((uint64_t *)&v9, (WTF::AtomStringImpl *)a3, v4);
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

- (BOOL)hidden
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v12);
  uint64_t v4 = *((void *)self->super.super.super._internal + 14);
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
  uint64_t v8 = *MEMORY[0x1E4FB6560];
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

- (void)setHidden:(BOOL)a3
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v4);
  WebCore::Element::setBooleanAttribute();
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v4, v3);
}

- (NSString)accessKey
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  if (*(void *)WebCore::Element::getAttribute()) {
    char v3 = (__CFString *)WTF::StringImpl::operator NSString *();
  }
  else {
    char v3 = &stru_1F3C7DA90;
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

- (NSString)innerText
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WebCore::Element::innerText((uint64_t *)&v7, self->super.super.super._internal);
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

- (void)setInnerText:(NSString *)innerText
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v12);
  MEMORY[0x1E4E442D0](&v8, innerText);
  WebCore::HTMLElement::setInnerText();
  if (v11)
  {
    unsigned char v12[80] = v9;
    uint64_t v7 = v10;
    uint64_t v10 = 0;
    uint64_t v13 = v7;
    raiseDOMErrorException();
  }
  unsigned int v5 = v8;
  uint64_t v8 = 0;
  if (!v5) {
    goto LABEL_5;
  }
  if (*(_DWORD *)v5 != 2)
  {
    *(_DWORD *)v5 -= 2;
LABEL_5:
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v12, v4);
    return;
  }
  WTF::StringImpl::destroy(v5, v4);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v12, v6);
}

- (NSString)outerText
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WebCore::Element::innerText((uint64_t *)&v7, self->super.super.super._internal);
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

- (void)setOuterText:(NSString *)outerText
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v12);
  MEMORY[0x1E4E442D0](&v8, outerText);
  WebCore::HTMLElement::setOuterText();
  if (v11)
  {
    unsigned char v12[80] = v9;
    uint64_t v7 = v10;
    uint64_t v10 = 0;
    uint64_t v13 = v7;
    raiseDOMErrorException();
  }
  unsigned int v5 = v8;
  uint64_t v8 = 0;
  if (!v5) {
    goto LABEL_5;
  }
  if (*(_DWORD *)v5 != 2)
  {
    *(_DWORD *)v5 -= 2;
LABEL_5:
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v12, v4);
    return;
  }
  WTF::StringImpl::destroy(v5, v4);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v12, v6);
}

- (NSString)contentEditable
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WebCore::HTMLElement::contentEditable((uint64_t *)&v7, self->super.super.super._internal);
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

- (void)setContentEditable:(NSString *)contentEditable
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v14);
  internal = self->super.super.super._internal;
  MEMORY[0x1E4E442D0](&v10, contentEditable);
  WebCore::HTMLElement::setContentEditable(&v11, internal, (const WTF::String *)&v10);
  if (v13)
  {
    v14[80] = v11;
    uint64_t v9 = v12;
    uint64_t v12 = 0;
    uint64_t v15 = v9;
    raiseDOMErrorException();
  }
  uint64_t v7 = v10;
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

- (BOOL)isContentEditable
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LOBYTE(self) = WebCore::Node::isContentEditable(self->super.super.super._internal);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return (char)self;
}

- (BOOL)spellcheck
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LOBYTE(self) = MEMORY[0x1E4E49630](self->super.super.super._internal);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return (char)self;
}

- (void)setSpellcheck:(BOOL)a3
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  WebCore::HTMLElement::setSpellcheck(self->super.super.super._internal);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v4);
}

- (NSString)idName
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v12);
  uint64_t v4 = *((void *)self->super.super.super._internal + 14);
  if (v4 && *(void *)(v4 + 24))
  {
    unsigned int v5 = *(_DWORD *)(v4 + 4);
    if (v5)
    {
      v6 = *(uint64_t **)(v4 + 40);
      LODWORD(v7) = *(_DWORD *)(v4 + 52);
      if (!v7)
      {
LABEL_15:
        v6 = 0;
        goto LABEL_16;
      }
    }
    else
    {
      v6 = (uint64_t *)(v4 + 32);
      LODWORD(v7) = v5 >> 5;
      if (!v7) {
        goto LABEL_15;
      }
    }
    uint64_t v9 = *MEMORY[0x1E4FB6898];
    uint64_t v7 = v7;
    while (1)
    {
      uint64_t v10 = *v6;
      if (*v6 == v9 || *(void *)(v10 + 24) == *(void *)(v9 + 24) && *(void *)(v10 + 32) == *(void *)(v9 + 32)) {
        break;
      }
      v6 += 2;
      if (!--v7) {
        goto LABEL_15;
      }
    }
LABEL_16:
    if (!v6[1]) {
      goto LABEL_17;
    }
    goto LABEL_7;
  }
  if (!*MEMORY[0x1E4F30968])
  {
LABEL_17:
    uint64_t v8 = &stru_1F3C7DA90;
    goto LABEL_18;
  }
LABEL_7:
  uint64_t v8 = (__CFString *)WTF::StringImpl::operator NSString *();
LABEL_18:
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v12, v3);
  return &v8->isa;
}

- (void)setIdName:(NSString *)idName
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WTF::AtomStringImpl::add((uint64_t *)&v9, (WTF::AtomStringImpl *)idName, v4);
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

- (DOMHTMLCollection)children
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WebCore::ContainerNode::children((uint64_t *)&v7, self->super.super.super._internal);
  CFStringRef v4 = (DOMHTMLCollection *)kit(v7);
  unsigned int v5 = v7;
  uint64_t v7 = 0;
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

- (NSString)titleDisplayString
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v11);
  WebCore::HTMLElement::title((uint64_t *)&v9, self->super.super.super._internal);
  WebCore::displayString((uint64_t *)&v10, (WebCore *)&v9, self->super.super.super._internal, v3);
  if (!v10)
  {
    uint64_t v10 = 0;
    unsigned int v5 = &stru_1F3C7DA90;
LABEL_7:
    uint64_t v7 = v9;
    uint64_t v9 = 0;
    if (!v7) {
      goto LABEL_11;
    }
    goto LABEL_8;
  }
  unsigned int v5 = (__CFString *)WTF::StringImpl::operator NSString *();
  v6 = v10;
  uint64_t v10 = 0;
  if (!v6) {
    goto LABEL_7;
  }
  if (*(_DWORD *)v6 == 2)
  {
    WTF::StringImpl::destroy(v6, v4);
    uint64_t v7 = v9;
    uint64_t v9 = 0;
    if (!v7) {
      goto LABEL_11;
    }
  }
  else
  {
    *(_DWORD *)v6 -= 2;
    uint64_t v7 = v9;
    uint64_t v9 = 0;
    if (!v7) {
      goto LABEL_11;
    }
  }
LABEL_8:
  if (*(_DWORD *)v7 == 2) {
    WTF::StringImpl::destroy(v7, v4);
  }
  else {
    *(_DWORD *)v7 -= 2;
  }
LABEL_11:
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v11, v4);
  return &v5->isa;
}

- (id)insertAdjacentElement:(id)a3 element:(id)a4
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v18);
  if (!a4) {
    raiseTypeErrorException();
  }
  internal = self->super.super.super._internal;
  MEMORY[0x1E4E442D0](&v14, a3);
  uint64_t v8 = (WebCore::Element *)core((uint64_t)a4);
  WebCore::Element::insertAdjacentElement((uint64_t *)&v15, internal, (const WTF::String *)&v14, v8);
  if (v17)
  {
    if (v17 == 1)
    {
      v19[0] = (_BYTE)v15;
      uint64_t v13 = v16;
      uint64_t v16 = 0;
      uint64_t v20 = v13;
      raiseDOMErrorException();
    }
    id result = (id)std::__throw_bad_variant_access[abi:sn180100]();
    __break(1u);
  }
  else
  {
    uint64_t v10 = kit(v15);
    if (v17 != -1) {
      ((void (*)(unsigned char *, WebCore::Node **))off_1F3C7A108[v17])(v19, &v15);
    }
    int v17 = -1;
    uint64_t v11 = v14;
    float v14 = 0;
    if (v11)
    {
      if (*(_DWORD *)v11 == 2) {
        WTF::StringImpl::destroy(v11, v9);
      }
      else {
        *(_DWORD *)v11 -= 2;
      }
    }
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v18, v9);
    return v10;
  }
  return result;
}

- (void)insertAdjacentHTML:(id)a3 html:(id)a4
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v15);
  MEMORY[0x1E4E442D0](&v11, a3);
  MEMORY[0x1E4E442D0](&v9, a4);
  int v10 = 1;
  WebCore::Element::insertAdjacentHTML();
  if (v14)
  {
    v16[0] = v12;
    uint64_t v8 = v13;
    uint64_t v13 = 0;
    uint64_t v17 = v8;
    raiseDOMErrorException();
  }
  if (v10 != -1) {
    ((void (*)(unsigned char *, uint64_t *))off_1F3C7A118[v10])(v16, &v9);
  }
  uint64_t v7 = v11;
  uint64_t v11 = 0;
  if (v7)
  {
    if (*(_DWORD *)v7 == 2) {
      WTF::StringImpl::destroy(v7, v6);
    }
    else {
      *(_DWORD *)v7 -= 2;
    }
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v15, v6);
}

- (void)insertAdjacentText:(id)a3 text:(id)a4
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v15);
  MEMORY[0x1E4E442D0](&v11, a3);
  MEMORY[0x1E4E442D0](&v10, a4);
  WebCore::Element::insertAdjacentText();
  if (v14)
  {
    unsigned char v15[80] = v12;
    uint64_t v9 = v13;
    uint64_t v13 = 0;
    uint64_t v16 = v9;
    raiseDOMErrorException();
  }
  uint64_t v7 = v10;
  int v10 = 0;
  if (v7)
  {
    if (*(_DWORD *)v7 == 2)
    {
      WTF::StringImpl::destroy(v7, v6);
      uint64_t v8 = v11;
      uint64_t v11 = 0;
      if (!v8) {
        goto LABEL_11;
      }
      goto LABEL_8;
    }
    *(_DWORD *)v7 -= 2;
  }
  uint64_t v8 = v11;
  uint64_t v11 = 0;
  if (!v8) {
    goto LABEL_11;
  }
LABEL_8:
  if (*(_DWORD *)v8 == 2) {
    WTF::StringImpl::destroy(v8, v6);
  }
  else {
    *(_DWORD *)v8 -= 2;
  }
LABEL_11:
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v15, v6);
}

- (void)click
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v4);
  WebCore::HTMLElement::click(self->super.super.super._internal);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v4, v3);
}

- (BOOL)autocorrect
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LOBYTE(self) = (*(uint64_t (**)(DOMObjectInternal *))(*(void *)self->super.super.super._internal + 1240))(self->super.super.super._internal);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return (char)self;
}

- (void)setAutocorrect:(BOOL)a3
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  WebCore::HTMLElement::setAutocorrect(self->super.super.super._internal);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v4);
}

- (id)autocapitalize
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6);
  if (*(void *)WebCore::HTMLElement::autocapitalize(self->super.super.super._internal)) {
    CFStringRef v4 = (__CFString *)WTF::StringImpl::operator NSString *();
  }
  else {
    CFStringRef v4 = &stru_1F3C7DA90;
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6, v3);
  return v4;
}

- (void)setAutocapitalize:(id)a3
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WTF::AtomStringImpl::add((uint64_t *)&v9, (WTF::AtomStringImpl *)a3, v4);
  uint64_t v7 = v9;
  WebCore::HTMLElement::setAutocapitalize();
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

- (int)structuralComplexityContribution
{
  uint64_t v2 = *((void *)self->super.super.super._internal + 9) & 0xFFFFFFFFFFFFLL;
  if (!v2) {
    goto LABEL_15;
  }
  if ((*(unsigned char *)((*((void *)self->super.super.super._internal + 9) & 0xFFFFFFFFFFFFLL) + 0x2D) & 2) != 0)
  {
    LODWORD(self) = 105;
    __break(0xC471u);
    return (int)self;
  }
  int v3 = *(_DWORD *)((*((void *)self->super.super.super._internal + 9) & 0xFFFFFFFFFFFFLL) + 0x14);
  LODWORD(self) = 0x7FFFFFFF;
  if ((v3 & 0x800) == 0
    && (v3 & 0x1800000) != 0x1000000
    && ((*(unsigned char *)(v2 + 52) & 7) != 3 || (*(unsigned char *)(v2 + 53) & 4) == 0))
  {
    self = (DOMHTMLElement *)(*(uint64_t (**)(uint64_t, SEL))(*(void *)v2 + 112))(v2, a2);
    if (self)
    {
      if ((*(unsigned char *)(v2 + 52) & 7) == 1
        || (*(unsigned char *)(v2 + 45) & 0x40) != 0
        && WebCore::RenderBoxModelObject::inlineContinuation((WebCore::RenderBoxModelObject *)v2))
      {
        if ((*(unsigned char *)(v2 + 45) & 4) != 0)
        {
          uint64_t v5 = *(void *)(v2 + 32);
          LODWORD(self) = !v5
                       || (uint64_t v6 = *(void *)(v5 + 8)) == 0
                       || (*(unsigned char *)(v6 + 45) & 4) == 0
                       || *(_DWORD *)(v2 + 160) != *(_DWORD *)(v6 + 160);
        }
        else
        {
          LODWORD(self) = 1;
        }
        return (int)self;
      }
      int v4 = *(_DWORD *)(v2 + 20);
      if ((v4 & 0x20000) != 0)
      {
        if ((*(unsigned char *)(v2 + 45) & 2) != 0) {
          uint64_t v2 = *(void *)(*(void *)(v2 + 32) + 8);
        }
        uint64_t v7 = *(void *)(v2 + 88);
        if (*(_DWORD *)(*(void *)(*(void *)(v7 + 32) + 40) + 20)
          || (uint64_t v8 = *(void **)(v7 + 40), v8[43])
          || v8[40]
          || v8[41]
          || (v4 & 0x100000) != 0
          || v8[42])
        {
          LODWORD(self) = 0x7FFFFFFF;
          return (int)self;
        }
      }
LABEL_15:
      LODWORD(self) = 0;
    }
  }
  return (int)self;
}

@end