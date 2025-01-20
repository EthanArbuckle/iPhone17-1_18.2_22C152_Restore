@interface DOMHTMLOptionElement
- (BOOL)defaultSelected;
- (BOOL)disabled;
- (BOOL)selected;
- (DOMHTMLFormElement)form;
- (NSString)label;
- (NSString)text;
- (NSString)value;
- (int)index;
- (void)setDefaultSelected:(BOOL)defaultSelected;
- (void)setDisabled:(BOOL)disabled;
- (void)setLabel:(NSString *)label;
- (void)setSelected:(BOOL)selected;
- (void)setValue:(NSString *)value;
@end

@implementation DOMHTMLOptionElement

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
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  v3 = (WebCore::Node *)WebCore::HTMLOptionElement::form(self->super.super.super.super._internal);
  uint64_t v4 = (DOMHTMLFormElement *)kit(v3);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7, v5);
  return v4;
}

- (NSString)label
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WebCore::HTMLOptionElement::label((uint64_t *)&v7, self->super.super.super.super._internal);
  if (v7)
  {
    uint64_t v4 = (__CFString *)WTF::StringImpl::operator NSString *();
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
    uint64_t v4 = &stru_1F3C7DA90;
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8, v3);
  return &v4->isa;
}

- (void)setLabel:(NSString *)label
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WTF::AtomStringImpl::add((uint64_t *)&v9, (WTF::AtomStringImpl *)label, v4);
  uint64_t v7 = v9;
  WebCore::HTMLOptionElement::setLabel();
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

- (BOOL)defaultSelected
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
  uint64_t v8 = *MEMORY[0x1E4FB6710];
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

- (void)setDefaultSelected:(BOOL)defaultSelected
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v4);
  WebCore::Element::setBooleanAttribute();
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v4, v3);
}

- (BOOL)selected
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  char v2 = WebCore::HTMLOptionElement::selected();
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return v2;
}

- (void)setSelected:(BOOL)selected
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  WebCore::HTMLOptionElement::setSelected(self->super.super.super.super._internal);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v4);
}

- (NSString)value
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WebCore::HTMLOptionElement::value((uint64_t *)&v7, self->super.super.super.super._internal);
  if (v7)
  {
    uint64_t v4 = (__CFString *)WTF::StringImpl::operator NSString *();
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
    uint64_t v4 = &stru_1F3C7DA90;
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8, v3);
  return &v4->isa;
}

- (void)setValue:(NSString *)value
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WTF::AtomStringImpl::add((uint64_t *)&v9, (WTF::AtomStringImpl *)value, v4);
  uint64_t v7 = v9;
  WebCore::HTMLOptionElement::setValue();
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

- (NSString)text
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WebCore::HTMLOptionElement::text((uint64_t *)&v7, self->super.super.super.super._internal);
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

- (int)index
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LODWORD(self) = WebCore::HTMLOptionElement::index(self->super.super.super.super._internal);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return (int)self;
}

@end