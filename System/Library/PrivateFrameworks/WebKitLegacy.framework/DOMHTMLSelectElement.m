@interface DOMHTMLSelectElement
- (BOOL)autofocus;
- (BOOL)disabled;
- (BOOL)multiple;
- (BOOL)willValidate;
- (DOMHTMLFormElement)form;
- (DOMHTMLOptionsCollection)options;
- (DOMNode)item:(unsigned int)index;
- (DOMNode)namedItem:(NSString *)name;
- (NSString)name;
- (NSString)type;
- (NSString)value;
- (id)listItemAtIndex:(int)a3;
- (int)length;
- (int)selectedIndex;
- (int)size;
- (int)structuralComplexityContribution;
- (unsigned)completeLength;
- (void)_activateItemAtIndex:(int)a3;
- (void)_activateItemAtIndex:(int)a3 allowMultipleSelection:(BOOL)a4;
- (void)add:(DOMHTMLElement *)element before:(DOMHTMLElement *)before;
- (void)remove:(int)index;
- (void)setAutofocus:(BOOL)autofocus;
- (void)setDisabled:(BOOL)disabled;
- (void)setMultiple:(BOOL)multiple;
- (void)setName:(NSString *)name;
- (void)setSelectedIndex:(int)selectedIndex;
- (void)setSize:(int)size;
- (void)setValue:(NSString *)value;
@end

@implementation DOMHTMLSelectElement

- (void)_activateItemAtIndex:(int)a3
{
  if (self)
  {
    if (self->super.super.super.super._internal) {
      MEMORY[0x1F416EE88]();
    }
  }
}

- (void)_activateItemAtIndex:(int)a3 allowMultipleSelection:(BOOL)a4
{
  if (self)
  {
    if (self->super.super.super.super._internal) {
      MEMORY[0x1F416EE88]();
    }
  }
}

- (BOOL)autofocus
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
  uint64_t v8 = *MEMORY[0x1E4FB6728];
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

- (void)setAutofocus:(BOOL)autofocus
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v4);
  WebCore::Element::setBooleanAttribute();
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v4, v3);
}

- (BOOL)disabled
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
  uint64_t v8 = *MEMORY[0x1E4FB66C8];
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

- (void)setDisabled:(BOOL)disabled
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v4);
  WebCore::Element::setBooleanAttribute();
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v4, v3);
}

- (DOMHTMLFormElement)form
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  uint64_t v3 = *((void *)self->super.super.super.super._internal + 16);
  if (v3) {
    uint64_t v4 = *(WebCore::Node **)(v3 + 8);
  }
  else {
    uint64_t v4 = 0;
  }
  unsigned int v5 = (DOMHTMLFormElement *)kit(v4);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8, v6);
  return v5;
}

- (BOOL)multiple
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LOBYTE(self) = *((unsigned char *)self->super.super.super.super._internal + 305);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return (char)self;
}

- (void)setMultiple:(BOOL)multiple
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v4);
  WebCore::Element::setBooleanAttribute();
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v4, v3);
}

- (NSString)name
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v12);
  uint64_t v4 = *((void *)self->super.super.super.super._internal + 14);
  if (v4)
  {
    unsigned int v5 = *(_DWORD *)(v4 + 4);
    if ((v5 & 2) != 0)
    {
      if (v5)
      {
        uint64_t v7 = *(uint64_t **)(v4 + 40);
        LODWORD(v8) = *(_DWORD *)(v4 + 52);
        if (!v8)
        {
LABEL_15:
          uint64_t v7 = 0;
          goto LABEL_16;
        }
      }
      else
      {
        uint64_t v7 = (uint64_t *)(v4 + 32);
        LODWORD(v8) = v5 >> 5;
        if (!v8) {
          goto LABEL_15;
        }
      }
      uint64_t v9 = *MEMORY[0x1E4FB69D0];
      uint64_t v8 = v8;
      while (1)
      {
        uint64_t v10 = *v7;
        if (*v7 == v9 || *(void *)(v10 + 24) == *(void *)(v9 + 24) && *(void *)(v10 + 32) == *(void *)(v9 + 32)) {
          break;
        }
        v7 += 2;
        if (!--v8) {
          goto LABEL_15;
        }
      }
LABEL_16:
      if (v7[1]) {
        goto LABEL_4;
      }
LABEL_17:
      v6 = &stru_1F3C7DA90;
      goto LABEL_18;
    }
  }
  if (!*MEMORY[0x1E4F30968]) {
    goto LABEL_17;
  }
LABEL_4:
  v6 = (__CFString *)WTF::StringImpl::operator NSString *();
LABEL_18:
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v12, v3);
  return &v6->isa;
}

- (void)setName:(NSString *)name
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WTF::AtomStringImpl::add((uint64_t *)&v9, (WTF::AtomStringImpl *)name, v4);
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

- (int)size
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LODWORD(self) = *((_DWORD *)self->super.super.super.super._internal + 72);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return (int)self;
}

- (void)setSize:(int)size
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  WebCore::HTMLSelectElement::setSize(self->super.super.super.super._internal);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v4);
}

- (NSString)type
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6);
  if (*(void *)(*(uint64_t (**)(void))(*((void *)self->super.super.super.super._internal + 15) + 328))()) {
    CFStringRef v4 = (__CFString *)WTF::StringImpl::operator NSString *();
  }
  else {
    CFStringRef v4 = &stru_1F3C7DA90;
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6, v3);
  return &v4->isa;
}

- (DOMHTMLOptionsCollection)options
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WebCore::HTMLSelectElement::options((uint64_t *)&v7, self->super.super.super.super._internal);
  CFStringRef v4 = (DOMHTMLOptionsCollection *)kit(v7);
  unsigned int v5 = v7;
  uint64_t v7 = 0;
  if (v5)
  {
    if (*((_DWORD *)v5 + 4) == 1) {
      (*(void (**)(WebCore::HTMLOptionsCollection *))(*(void *)v5 + 8))(v5);
    }
    else {
      --*((_DWORD *)v5 + 4);
    }
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8, v3);
  return v4;
}

- (int)length
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LODWORD(self) = WebCore::HTMLSelectElement::length(self->super.super.super.super._internal);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return (int)self;
}

- (int)selectedIndex
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LODWORD(self) = WebCore::HTMLSelectElement::selectedIndex(self->super.super.super.super._internal);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return (int)self;
}

- (void)setSelectedIndex:(int)selectedIndex
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  WebCore::HTMLSelectElement::setSelectedIndex(self->super.super.super.super._internal);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v4);
}

- (NSString)value
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WebCore::HTMLSelectElement::value((uint64_t *)&v7, self->super.super.super.super._internal);
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

- (void)setValue:(NSString *)value
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10);
  internal = self->super.super.super.super._internal;
  MEMORY[0x1E4E442D0](&v9, value);
  WebCore::HTMLSelectElement::setValue(internal, (const WTF::String *)&v9);
  uint64_t v7 = v9;
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

- (BOOL)willValidate
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LOBYTE(self) = (*(uint64_t (**)(void))(*((void *)self->super.super.super.super._internal + 15) + 272))();
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return (char)self;
}

- (DOMNode)item:(unsigned int)index
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  CFStringRef v4 = (WebCore::Node *)WebCore::HTMLSelectElement::item(self->super.super.super.super._internal);
  unsigned int v5 = (DOMNode *)kit(v4);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8, v6);
  return v5;
}

- (DOMNode)namedItem:(NSString *)name
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10);
  WTF::AtomStringImpl::add((uint64_t *)&v11, (WTF::AtomStringImpl *)name, v4);
  uint64_t v9 = v11;
  unsigned int v5 = (WebCore::Node *)WebCore::HTMLSelectElement::namedItem();
  uint64_t v7 = (DOMNode *)kit(v5);
  if (v9)
  {
    if (*(_DWORD *)v9 == 2) {
      WTF::StringImpl::destroy(v9, v6);
    }
    else {
      *(_DWORD *)v9 -= 2;
    }
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10, v6);
  return v7;
}

- (void)add:(DOMHTMLElement *)element before:(DOMHTMLElement *)before
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v21);
  if (!element) {
    raiseTypeErrorException();
  }
  internal = element->super.super.super._internal;
  v19 = 0;
  int v20 = 0;
  uint64_t v7 = *(void *)(*((void *)internal + 13) + 24);
  if (v7 != *(void *)(*MEMORY[0x1E4FB6AF0] + 24))
  {
    if (v7 != *(void *)(*MEMORY[0x1E4FB6668] + 24)) {
      raiseTypeErrorException();
    }
    *((_DWORD *)internal + 7) += 2;
    v19 = internal;
    int v20 = 1;
    if (before) {
      goto LABEL_5;
    }
LABEL_8:
    uint64_t v8 = 0;
    goto LABEL_9;
  }
  *((_DWORD *)internal + 7) += 2;
  v19 = internal;
  if (!before) {
    goto LABEL_8;
  }
LABEL_5:
  uint64_t v8 = before->super.super.super._internal;
  if (v8) {
    *((_DWORD *)v8 + 7) += 2;
  }
LABEL_9:
  int v12 = 0;
  uint64_t v11 = 0;
  v13 = v8;
  int v14 = 0;
  char v15 = 1;
  WebCore::HTMLSelectElement::add();
  if (v18)
  {
    v22[0] = v16[0];
    uint64_t v10 = v17;
    uint64_t v17 = 0;
    uint64_t v23 = v10;
    raiseDOMErrorException();
  }
  ((void (*)(unsigned char *, DOMObjectInternal **))off_1F3C7A148[v14])(v22, &v13);
  int v14 = -1;
  ((void (*)(unsigned char *, uint64_t *))off_1F3C7A148[v12])(v22, &v11);
  if (v20 != -1) {
    ((void (*)(unsigned char *, DOMObjectInternal **))off_1F3C7A158[v20])(v16, &v19);
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v21, v9);
}

- (void)remove:(int)index
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  WebCore::HTMLSelectElement::remove(self->super.super.super.super._internal);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v4);
}

- (int)structuralComplexityContribution
{
  return 0x7FFFFFFF;
}

- (unsigned)completeLength
{
  if (self) {
    self = (DOMHTMLSelectElement *)self->super.super.super.super._internal;
  }
  return *(_DWORD *)(WebCore::HTMLSelectElement::listItems((WebCore::HTMLSelectElement *)self) + 12);
}

- (id)listItemAtIndex:(int)a3
{
  if (self) {
    self = (DOMHTMLSelectElement *)self->super.super.super.super._internal;
  }
  id result = (id)WebCore::HTMLSelectElement::listItems((WebCore::HTMLSelectElement *)self);
  if (*((unsigned int *)result + 3) <= (unint64_t)a3)
  {
    __break(0xC471u);
  }
  else
  {
    uint64_t v5 = *(void *)(*(void *)result + 8 * a3);
    if (v5)
    {
      v6 = *(WebCore::Node **)(v5 + 8);
    }
    else
    {
      v6 = 0;
    }
    return kit(v6);
  }
  return result;
}

@end