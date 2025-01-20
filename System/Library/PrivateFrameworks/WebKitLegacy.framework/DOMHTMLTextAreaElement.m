@interface DOMHTMLTextAreaElement
- (BOOL)_isEdited;
- (BOOL)autofocus;
- (BOOL)canShowPlaceholder;
- (BOOL)disabled;
- (BOOL)readOnly;
- (BOOL)required;
- (BOOL)willValidate;
- (DOMHTMLFormElement)form;
- (NSString)accessKey;
- (NSString)defaultValue;
- (NSString)name;
- (NSString)type;
- (NSString)value;
- (id)autocomplete;
- (id)dirName;
- (id)endPosition;
- (id)labels;
- (id)placeholder;
- (id)selectionDirection;
- (id)startPosition;
- (id)wrap;
- (int)_autocapitalizeType;
- (int)cols;
- (int)maxLength;
- (int)rows;
- (int)selectionEnd;
- (int)selectionStart;
- (int)structuralComplexityContribution;
- (unsigned)textLength;
- (void)select;
- (void)setAccessKey:(NSString *)accessKey;
- (void)setAutocomplete:(id)a3;
- (void)setAutofocus:(BOOL)autofocus;
- (void)setCanShowPlaceholder:(BOOL)a3;
- (void)setCols:(int)cols;
- (void)setDefaultValue:(NSString *)defaultValue;
- (void)setDirName:(id)a3;
- (void)setDisabled:(BOOL)disabled;
- (void)setMaxLength:(int)a3;
- (void)setName:(NSString *)name;
- (void)setPlaceholder:(id)a3;
- (void)setRangeText:(id)a3;
- (void)setRangeText:(id)a3 start:(unsigned int)a4 end:(unsigned int)a5 selectionMode:(id)a6;
- (void)setReadOnly:(BOOL)readOnly;
- (void)setRequired:(BOOL)a3;
- (void)setRows:(int)rows;
- (void)setSelectionDirection:(id)a3;
- (void)setSelectionEnd:(int)selectionEnd;
- (void)setSelectionRange:(int)start end:(int)end;
- (void)setSelectionStart:(int)selectionStart;
- (void)setValue:(NSString *)value;
- (void)setWrap:(id)a3;
@end

@implementation DOMHTMLTextAreaElement

- (BOOL)_isEdited
{
  uint64_t v2 = core((uint64_t)self);
  return MEMORY[0x1F4175AD8](v2, v3);
}

- (int)_autocapitalizeType
{
  uint64_t v2 = (WebCore::HTMLFormControlElement *)core((uint64_t)self);
  char v3 = WebCore::HTMLFormControlElement::autocapitalizeType(v2);
  if (((v3 - 1) & 0xFC) != 0) {
    return 0;
  }
  else {
    return (v3 - 1) + 1;
  }
}

- (BOOL)autofocus
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v13);
  internal = self->super.super.super.super._internal;
  if ((*((_WORD *)internal + 16) & 0x10) != 0
    && *(void *)(*((void *)internal + 13) + 24) == *(void *)(*MEMORY[0x1E4FB6690] + 24))
  {
    uint64_t v5 = *((void *)internal + 14);
    if (v5)
    {
      unsigned int v6 = *(_DWORD *)(v5 + 4);
      if ((v6 & 1) == 0)
      {
        v7 = (uint64_t *)(v5 + 32);
        LODWORD(v8) = v6 >> 5;
        if (!v8) {
          goto LABEL_14;
        }
LABEL_8:
        uint64_t v9 = *MEMORY[0x1E4FB6728];
        uint64_t v8 = v8;
        while (1)
        {
          uint64_t v10 = *v7;
          if (*v7 == v9
            || *(void *)(v10 + 24) == *(void *)(v9 + 24) && *(void *)(v10 + 32) == *(void *)(v9 + 32))
          {
            break;
          }
          v7 += 2;
          if (!--v8) {
            goto LABEL_14;
          }
        }
        BOOL v11 = 1;
        goto LABEL_15;
      }
      v7 = *(uint64_t **)(v5 + 40);
      LODWORD(v8) = *(_DWORD *)(v5 + 52);
      if (v8) {
        goto LABEL_8;
      }
    }
LABEL_14:
    BOOL v11 = 0;
LABEL_15:
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v13, v3);
    return v11;
  }
  BOOL result = 96;
  __break(0xC471u);
  return result;
}

- (void)setAutofocus:(BOOL)autofocus
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6);
  internal = self->super.super.super.super._internal;
  if ((*((_WORD *)internal + 16) & 0x10) != 0
    && *(void *)(*((void *)internal + 13) + 24) == *(void *)(*MEMORY[0x1E4FB6690] + 24))
  {
    WebCore::Element::setBooleanAttribute();
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6, v5);
  }
  else
  {
    __break(0xC471u);
  }
}

- (id)dirName
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  internal = self->super.super.super.super._internal;
  if ((*((_WORD *)internal + 16) & 0x10) != 0
    && *(void *)(*((void *)internal + 13) + 24) == *(void *)(*MEMORY[0x1E4FB6690] + 24))
  {
    if (*(void *)WebCore::Element::getAttribute()) {
      uint64_t v5 = (__CFString *)WTF::StringImpl::operator NSString *();
    }
    else {
      uint64_t v5 = &stru_1F3C7DA90;
    }
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7, v4);
    return v5;
  }
  else
  {
    id result = (id)96;
    __break(0xC471u);
  }
  return result;
}

- (void)setDirName:(id)a3
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10);
  internal = self->super.super.super.super._internal;
  if ((*((_WORD *)internal + 16) & 0x10) != 0
    && *(void *)(*((void *)internal + 13) + 24) == *(void *)(*MEMORY[0x1E4FB6690] + 24))
  {
    WTF::AtomStringImpl::add((uint64_t *)&v11, (WTF::AtomStringImpl *)a3, v5);
    uint64_t v9 = v11;
    WebCore::Element::setAttributeWithoutSynchronization();
    if (!v9)
    {
LABEL_6:
      WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10, v7);
      return;
    }
    if (*(_DWORD *)v9 != 2)
    {
      *(_DWORD *)v9 -= 2;
      goto LABEL_6;
    }
    WTF::StringImpl::destroy(v9, v7);
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10, v8);
  }
  else
  {
    __break(0xC471u);
  }
}

- (BOOL)disabled
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v13);
  internal = self->super.super.super.super._internal;
  if ((*((_WORD *)internal + 16) & 0x10) != 0
    && *(void *)(*((void *)internal + 13) + 24) == *(void *)(*MEMORY[0x1E4FB6690] + 24))
  {
    uint64_t v5 = *((void *)internal + 14);
    if (v5)
    {
      unsigned int v6 = *(_DWORD *)(v5 + 4);
      if ((v6 & 1) == 0)
      {
        v7 = (uint64_t *)(v5 + 32);
        LODWORD(v8) = v6 >> 5;
        if (!v8) {
          goto LABEL_14;
        }
LABEL_8:
        uint64_t v9 = *MEMORY[0x1E4FB66C8];
        uint64_t v8 = v8;
        while (1)
        {
          uint64_t v10 = *v7;
          if (*v7 == v9
            || *(void *)(v10 + 24) == *(void *)(v9 + 24) && *(void *)(v10 + 32) == *(void *)(v9 + 32))
          {
            break;
          }
          v7 += 2;
          if (!--v8) {
            goto LABEL_14;
          }
        }
        BOOL v11 = 1;
        goto LABEL_15;
      }
      v7 = *(uint64_t **)(v5 + 40);
      LODWORD(v8) = *(_DWORD *)(v5 + 52);
      if (v8) {
        goto LABEL_8;
      }
    }
LABEL_14:
    BOOL v11 = 0;
LABEL_15:
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v13, v3);
    return v11;
  }
  BOOL result = 96;
  __break(0xC471u);
  return result;
}

- (void)setDisabled:(BOOL)disabled
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6);
  internal = self->super.super.super.super._internal;
  if ((*((_WORD *)internal + 16) & 0x10) != 0
    && *(void *)(*((void *)internal + 13) + 24) == *(void *)(*MEMORY[0x1E4FB6690] + 24))
  {
    WebCore::Element::setBooleanAttribute();
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6, v5);
  }
  else
  {
    __break(0xC471u);
  }
}

- (DOMHTMLFormElement)form
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9);
  internal = self->super.super.super.super._internal;
  if ((*((_WORD *)internal + 16) & 0x10) != 0
    && *(void *)(*((void *)internal + 13) + 24) == *(void *)(*MEMORY[0x1E4FB6690] + 24))
  {
    uint64_t v4 = *((void *)internal + 16);
    if (v4) {
      uint64_t v5 = *(WebCore::Node **)(v4 + 8);
    }
    else {
      uint64_t v5 = 0;
    }
    unsigned int v6 = (DOMHTMLFormElement *)kit(v5);
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9, v7);
    return v6;
  }
  else
  {
    BOOL result = (DOMHTMLFormElement *)96;
    __break(0xC471u);
  }
  return result;
}

- (int)maxLength
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  internal = self->super.super.super.super._internal;
  if ((*((_WORD *)internal + 16) & 0x10) != 0
    && *(void *)(*((void *)internal + 13) + 24) == *(void *)(*MEMORY[0x1E4FB6690] + 24))
  {
    int v5 = *((_DWORD *)internal + 45);
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7, v3);
    return v5;
  }
  else
  {
    int result = 96;
    __break(0xC471u);
  }
  return result;
}

- (void)setMaxLength:(int)a3
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9);
  internal = self->super.super.super.super._internal;
  if ((*((_WORD *)internal + 16) & 0x10) == 0
    || *(void *)(*((void *)internal + 13) + 24) != *(void *)(*MEMORY[0x1E4FB6690] + 24))
  {
    __break(0xC471u);
    JUMPOUT(0x1E13B3F24);
  }
  WebCore::HTMLTextFormControlElement::setMaxLength(internal);
  if (v8)
  {
    unsigned char v9[80] = v6;
    uint64_t v10 = v7;
    raiseDOMErrorException();
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9, v5);
}

- (NSString)name
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v13);
  internal = self->super.super.super.super._internal;
  if ((*((_WORD *)internal + 16) & 0x10) != 0
    && *(void *)(*((void *)internal + 13) + 24) == *(void *)(*MEMORY[0x1E4FB6690] + 24))
  {
    uint64_t v5 = *((void *)internal + 14);
    if (!v5 || (unsigned int v6 = *(_DWORD *)(v5 + 4), (v6 & 2) == 0))
    {
      if (*MEMORY[0x1E4F30968])
      {
LABEL_6:
        uint64_t v7 = (__CFString *)WTF::StringImpl::operator NSString *();
LABEL_20:
        WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v13, v3);
        return &v7->isa;
      }
LABEL_19:
      uint64_t v7 = &stru_1F3C7DA90;
      goto LABEL_20;
    }
    if (v6)
    {
      char v8 = *(uint64_t **)(v5 + 40);
      LODWORD(v9) = *(_DWORD *)(v5 + 52);
      if (!v9)
      {
LABEL_17:
        char v8 = 0;
        goto LABEL_18;
      }
    }
    else
    {
      char v8 = (uint64_t *)(v5 + 32);
      LODWORD(v9) = v6 >> 5;
      if (!v9) {
        goto LABEL_17;
      }
    }
    uint64_t v10 = *MEMORY[0x1E4FB69D0];
    uint64_t v9 = v9;
    while (1)
    {
      uint64_t v11 = *v8;
      if (*v8 == v10
        || *(void *)(v11 + 24) == *(void *)(v10 + 24) && *(void *)(v11 + 32) == *(void *)(v10 + 32))
      {
        break;
      }
      v8 += 2;
      if (!--v9) {
        goto LABEL_17;
      }
    }
LABEL_18:
    if (v8[1]) {
      goto LABEL_6;
    }
    goto LABEL_19;
  }
  int result = (NSString *)96;
  __break(0xC471u);
  return result;
}

- (void)setName:(NSString *)name
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10);
  internal = self->super.super.super.super._internal;
  if ((*((_WORD *)internal + 16) & 0x10) != 0
    && *(void *)(*((void *)internal + 13) + 24) == *(void *)(*MEMORY[0x1E4FB6690] + 24))
  {
    WTF::AtomStringImpl::add((uint64_t *)&v11, (WTF::AtomStringImpl *)name, v5);
    uint64_t v9 = v11;
    WebCore::Element::setAttributeWithoutSynchronization();
    if (!v9)
    {
LABEL_6:
      WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10, v7);
      return;
    }
    if (*(_DWORD *)v9 != 2)
    {
      *(_DWORD *)v9 -= 2;
      goto LABEL_6;
    }
    WTF::StringImpl::destroy(v9, v7);
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10, v8);
  }
  else
  {
    __break(0xC471u);
  }
}

- (id)placeholder
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  internal = self->super.super.super.super._internal;
  if ((*((_WORD *)internal + 16) & 0x10) != 0
    && *(void *)(*((void *)internal + 13) + 24) == *(void *)(*MEMORY[0x1E4FB6690] + 24))
  {
    if (*(void *)WebCore::Element::getAttribute()) {
      CFStringRef v5 = (__CFString *)WTF::StringImpl::operator NSString *();
    }
    else {
      CFStringRef v5 = &stru_1F3C7DA90;
    }
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7, v4);
    return v5;
  }
  else
  {
    id result = (id)96;
    __break(0xC471u);
  }
  return result;
}

- (void)setPlaceholder:(id)a3
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10);
  internal = self->super.super.super.super._internal;
  if ((*((_WORD *)internal + 16) & 0x10) != 0
    && *(void *)(*((void *)internal + 13) + 24) == *(void *)(*MEMORY[0x1E4FB6690] + 24))
  {
    WTF::AtomStringImpl::add((uint64_t *)&v11, (WTF::AtomStringImpl *)a3, v5);
    uint64_t v9 = v11;
    WebCore::Element::setAttributeWithoutSynchronization();
    if (!v9)
    {
LABEL_6:
      WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10, v7);
      return;
    }
    if (*(_DWORD *)v9 != 2)
    {
      *(_DWORD *)v9 -= 2;
      goto LABEL_6;
    }
    WTF::StringImpl::destroy(v9, v7);
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10, v8);
  }
  else
  {
    __break(0xC471u);
  }
}

- (BOOL)readOnly
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v13);
  internal = self->super.super.super.super._internal;
  if ((*((_WORD *)internal + 16) & 0x10) != 0
    && *(void *)(*((void *)internal + 13) + 24) == *(void *)(*MEMORY[0x1E4FB6690] + 24))
  {
    uint64_t v5 = *((void *)internal + 14);
    if (v5)
    {
      unsigned int v6 = *(_DWORD *)(v5 + 4);
      if ((v6 & 1) == 0)
      {
        uint64_t v7 = (uint64_t *)(v5 + 32);
        LODWORD(v8) = v6 >> 5;
        if (!v8) {
          goto LABEL_14;
        }
LABEL_8:
        uint64_t v9 = *MEMORY[0x1E4FB66F8];
        uint64_t v8 = v8;
        while (1)
        {
          uint64_t v10 = *v7;
          if (*v7 == v9
            || *(void *)(v10 + 24) == *(void *)(v9 + 24) && *(void *)(v10 + 32) == *(void *)(v9 + 32))
          {
            break;
          }
          v7 += 2;
          if (!--v8) {
            goto LABEL_14;
          }
        }
        BOOL v11 = 1;
        goto LABEL_15;
      }
      uint64_t v7 = *(uint64_t **)(v5 + 40);
      LODWORD(v8) = *(_DWORD *)(v5 + 52);
      if (v8) {
        goto LABEL_8;
      }
    }
LABEL_14:
    BOOL v11 = 0;
LABEL_15:
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v13, v3);
    return v11;
  }
  BOOL result = 96;
  __break(0xC471u);
  return result;
}

- (void)setReadOnly:(BOOL)readOnly
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6);
  internal = self->super.super.super.super._internal;
  if ((*((_WORD *)internal + 16) & 0x10) != 0
    && *(void *)(*((void *)internal + 13) + 24) == *(void *)(*MEMORY[0x1E4FB6690] + 24))
  {
    WebCore::Element::setBooleanAttribute();
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6, v5);
  }
  else
  {
    __break(0xC471u);
  }
}

- (BOOL)required
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v13);
  internal = self->super.super.super.super._internal;
  if ((*((_WORD *)internal + 16) & 0x10) != 0
    && *(void *)(*((void *)internal + 13) + 24) == *(void *)(*MEMORY[0x1E4FB6690] + 24))
  {
    uint64_t v5 = *((void *)internal + 14);
    if (v5)
    {
      unsigned int v6 = *(_DWORD *)(v5 + 4);
      if ((v6 & 1) == 0)
      {
        uint64_t v7 = (uint64_t *)(v5 + 32);
        LODWORD(v8) = v6 >> 5;
        if (!v8) {
          goto LABEL_14;
        }
LABEL_8:
        uint64_t v9 = *MEMORY[0x1E4FB6700];
        uint64_t v8 = v8;
        while (1)
        {
          uint64_t v10 = *v7;
          if (*v7 == v9
            || *(void *)(v10 + 24) == *(void *)(v9 + 24) && *(void *)(v10 + 32) == *(void *)(v9 + 32))
          {
            break;
          }
          v7 += 2;
          if (!--v8) {
            goto LABEL_14;
          }
        }
        BOOL v11 = 1;
        goto LABEL_15;
      }
      uint64_t v7 = *(uint64_t **)(v5 + 40);
      LODWORD(v8) = *(_DWORD *)(v5 + 52);
      if (v8) {
        goto LABEL_8;
      }
    }
LABEL_14:
    BOOL v11 = 0;
LABEL_15:
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v13, v3);
    return v11;
  }
  BOOL result = 96;
  __break(0xC471u);
  return result;
}

- (void)setRequired:(BOOL)a3
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6);
  internal = self->super.super.super.super._internal;
  if ((*((_WORD *)internal + 16) & 0x10) != 0
    && *(void *)(*((void *)internal + 13) + 24) == *(void *)(*MEMORY[0x1E4FB6690] + 24))
  {
    WebCore::Element::setBooleanAttribute();
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6, v5);
  }
  else
  {
    __break(0xC471u);
  }
}

- (int)rows
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  internal = self->super.super.super.super._internal;
  if ((*((_WORD *)internal + 16) & 0x10) != 0
    && *(void *)(*((void *)internal + 13) + 24) == *(void *)(*MEMORY[0x1E4FB6690] + 24))
  {
    int v5 = *((_DWORD *)internal + 54);
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7, v3);
    return v5;
  }
  else
  {
    int result = 96;
    __break(0xC471u);
  }
  return result;
}

- (void)setRows:(int)rows
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6);
  internal = self->super.super.super.super._internal;
  if ((*((_WORD *)internal + 16) & 0x10) != 0
    && *(void *)(*((void *)internal + 13) + 24) == *(void *)(*MEMORY[0x1E4FB6690] + 24))
  {
    WebCore::HTMLTextAreaElement::setRows(internal);
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6, v5);
  }
  else
  {
    __break(0xC471u);
  }
}

- (int)cols
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  internal = self->super.super.super.super._internal;
  if ((*((_WORD *)internal + 16) & 0x10) != 0
    && *(void *)(*((void *)internal + 13) + 24) == *(void *)(*MEMORY[0x1E4FB6690] + 24))
  {
    int v5 = *((_DWORD *)internal + 55);
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7, v3);
    return v5;
  }
  else
  {
    int result = 96;
    __break(0xC471u);
  }
  return result;
}

- (void)setCols:(int)cols
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6);
  internal = self->super.super.super.super._internal;
  if ((*((_WORD *)internal + 16) & 0x10) != 0
    && *(void *)(*((void *)internal + 13) + 24) == *(void *)(*MEMORY[0x1E4FB6690] + 24))
  {
    WebCore::HTMLTextAreaElement::setCols(internal);
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6, v5);
  }
  else
  {
    __break(0xC471u);
  }
}

- (id)wrap
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  internal = self->super.super.super.super._internal;
  if ((*((_WORD *)internal + 16) & 0x10) != 0
    && *(void *)(*((void *)internal + 13) + 24) == *(void *)(*MEMORY[0x1E4FB6690] + 24))
  {
    if (*(void *)WebCore::Element::getAttribute()) {
      int v5 = (__CFString *)WTF::StringImpl::operator NSString *();
    }
    else {
      int v5 = &stru_1F3C7DA90;
    }
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7, v4);
    return v5;
  }
  else
  {
    id result = (id)96;
    __break(0xC471u);
  }
  return result;
}

- (void)setWrap:(id)a3
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10);
  internal = self->super.super.super.super._internal;
  if ((*((_WORD *)internal + 16) & 0x10) != 0
    && *(void *)(*((void *)internal + 13) + 24) == *(void *)(*MEMORY[0x1E4FB6690] + 24))
  {
    WTF::AtomStringImpl::add((uint64_t *)&v11, (WTF::AtomStringImpl *)a3, v5);
    uint64_t v9 = v11;
    WebCore::Element::setAttributeWithoutSynchronization();
    if (!v9)
    {
LABEL_6:
      WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10, v7);
      return;
    }
    if (*(_DWORD *)v9 != 2)
    {
      *(_DWORD *)v9 -= 2;
      goto LABEL_6;
    }
    WTF::StringImpl::destroy(v9, v7);
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10, v8);
  }
  else
  {
    __break(0xC471u);
  }
}

- (NSString)type
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  internal = self->super.super.super.super._internal;
  if ((*((_WORD *)internal + 16) & 0x10) != 0
    && *(void *)(*((void *)internal + 13) + 24) == *(void *)(*MEMORY[0x1E4FB6690] + 24))
  {
    if (*(void *)(*(uint64_t (**)(void))(*((void *)internal + 15) + 328))()) {
      CFStringRef v5 = (__CFString *)WTF::StringImpl::operator NSString *();
    }
    else {
      CFStringRef v5 = &stru_1F3C7DA90;
    }
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7, v4);
    return &v5->isa;
  }
  else
  {
    id result = (NSString *)96;
    __break(0xC471u);
  }
  return result;
}

- (NSString)defaultValue
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9);
  internal = self->super.super.super.super._internal;
  if ((*((_WORD *)internal + 16) & 0x10) != 0
    && *(void *)(*((void *)internal + 13) + 24) == *(void *)(*MEMORY[0x1E4FB6690] + 24))
  {
    MEMORY[0x1E4E4A640](&v8);
    if (v8)
    {
      CFStringRef v5 = (__CFString *)WTF::StringImpl::operator NSString *();
      unsigned int v6 = v8;
      uint64_t v8 = 0;
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
      CFStringRef v5 = &stru_1F3C7DA90;
    }
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9, v4);
    return &v5->isa;
  }
  else
  {
    id result = (NSString *)96;
    __break(0xC471u);
  }
  return result;
}

- (void)setDefaultValue:(NSString *)defaultValue
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10);
  internal = self->super.super.super.super._internal;
  if ((*((_WORD *)internal + 16) & 0x10) != 0
    && *(void *)(*((void *)internal + 13) + 24) == *(void *)(*MEMORY[0x1E4FB6690] + 24))
  {
    MEMORY[0x1E4E442D0](&v9, defaultValue);
    WebCore::HTMLTextAreaElement::setDefaultValue();
    uint64_t v7 = v9;
    uint64_t v9 = 0;
    if (!v7)
    {
LABEL_6:
      WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10, v6);
      return;
    }
    if (*(_DWORD *)v7 != 2)
    {
      *(_DWORD *)v7 -= 2;
      goto LABEL_6;
    }
    WTF::StringImpl::destroy(v7, v6);
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10, v8);
  }
  else
  {
    __break(0xC471u);
  }
}

- (NSString)value
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9);
  internal = self->super.super.super.super._internal;
  if ((*((_WORD *)internal + 16) & 0x10) != 0
    && *(void *)(*((void *)internal + 13) + 24) == *(void *)(*MEMORY[0x1E4FB6690] + 24))
  {
    WebCore::HTMLTextAreaElement::value((uint64_t *)&v8, internal);
    if (v8)
    {
      CFStringRef v5 = (__CFString *)WTF::StringImpl::operator NSString *();
      unsigned int v6 = v8;
      uint64_t v8 = 0;
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
      CFStringRef v5 = &stru_1F3C7DA90;
    }
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9, v4);
    return &v5->isa;
  }
  else
  {
    id result = (NSString *)96;
    __break(0xC471u);
  }
  return result;
}

- (void)setValue:(NSString *)value
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v13);
  internal = self->super.super.super.super._internal;
  if ((*((_WORD *)internal + 16) & 0x10) == 0
    || *(void *)(*((void *)internal + 13) + 24) != *(void *)(*MEMORY[0x1E4FB6690] + 24))
  {
    __break(0xC471u);
    return;
  }
  MEMORY[0x1E4E442D0](&v10, value);
  WebCore::HTMLTextAreaElement::setValue();
  if (!v12) {
    goto LABEL_7;
  }
  uint64_t v7 = v11;
  BOOL v11 = 0;
  if (!v7) {
    goto LABEL_7;
  }
  if (*(_DWORD *)v7 != 2)
  {
    *(_DWORD *)v7 -= 2;
LABEL_7:
    uint64_t v8 = v10;
    uint64_t v10 = 0;
    if (!v8)
    {
LABEL_10:
      WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v13, v6);
      return;
    }
    goto LABEL_8;
  }
  WTF::StringImpl::destroy(v7, v6);
  uint64_t v8 = v10;
  uint64_t v10 = 0;
  if (!v8) {
    goto LABEL_10;
  }
LABEL_8:
  if (*(_DWORD *)v8 != 2)
  {
    *(_DWORD *)v8 -= 2;
    goto LABEL_10;
  }
  WTF::StringImpl::destroy(v8, v6);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v13, v9);
}

- (unsigned)textLength
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  internal = self->super.super.super.super._internal;
  if ((*((_WORD *)internal + 16) & 0x10) != 0
    && *(void *)(*((void *)internal + 13) + 24) == *(void *)(*MEMORY[0x1E4FB6690] + 24))
  {
    WebCore::HTMLTextAreaElement::value((uint64_t *)&v9, internal);
    CFStringRef v5 = (WTF::StringImpl *)v9;
    if (v9)
    {
      unsigned int v6 = v9[1];
      uint64_t v9 = 0;
      if (*(_DWORD *)v5 == 2) {
        WTF::StringImpl::destroy(v5, v4);
      }
      else {
        *(_DWORD *)v5 -= 2;
      }
    }
    else
    {
      unsigned int v6 = 0;
    }
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8, v4);
    return v6;
  }
  else
  {
    unsigned int result = 96;
    __break(0xC471u);
  }
  return result;
}

- (BOOL)willValidate
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  internal = self->super.super.super.super._internal;
  if ((*((_WORD *)internal + 16) & 0x10) != 0
    && *(void *)(*((void *)internal + 13) + 24) == *(void *)(*MEMORY[0x1E4FB6690] + 24))
  {
    char v4 = WebCore::ValidatedFormListedElement::willValidate((DOMObjectInternal *)((char *)internal + 120));
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7, v5);
    return v4;
  }
  else
  {
    BOOL result = 96;
    __break(0xC471u);
  }
  return result;
}

- (id)labels
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9);
  internal = self->super.super.super.super._internal;
  if ((*((_WORD *)internal + 16) & 0x10) != 0
    && *(void *)(*((void *)internal + 13) + 24) == *(void *)(*MEMORY[0x1E4FB6690] + 24))
  {
    WebCore::HTMLElement::labels((uint64_t *)&v8, internal);
    CFStringRef v5 = kit(v8);
    unsigned int v6 = v8;
    uint64_t v8 = 0;
    if (v6)
    {
      if (*((_DWORD *)v6 + 4) == 1) {
        (*(void (**)(DOMObjectInternal *))(*(void *)v6 + 8))(v6);
      }
      else {
        --*((_DWORD *)v6 + 4);
      }
    }
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9, v4);
    return v5;
  }
  else
  {
    id result = (id)96;
    __break(0xC471u);
  }
  return result;
}

- (int)selectionStart
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  internal = self->super.super.super.super._internal;
  if ((*((_WORD *)internal + 16) & 0x10) != 0
    && *(void *)(*((void *)internal + 13) + 24) == *(void *)(*MEMORY[0x1E4FB6690] + 24))
  {
    int v4 = WebCore::HTMLTextFormControlElement::selectionStart(internal);
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7, v5);
    return v4;
  }
  else
  {
    int result = 96;
    __break(0xC471u);
  }
  return result;
}

- (void)setSelectionStart:(int)selectionStart
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6);
  internal = self->super.super.super.super._internal;
  if ((*((_WORD *)internal + 16) & 0x10) != 0
    && *(void *)(*((void *)internal + 13) + 24) == *(void *)(*MEMORY[0x1E4FB6690] + 24))
  {
    WebCore::HTMLTextFormControlElement::setSelectionStart(internal);
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6, v5);
  }
  else
  {
    __break(0xC471u);
  }
}

- (int)selectionEnd
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  internal = self->super.super.super.super._internal;
  if ((*((_WORD *)internal + 16) & 0x10) != 0
    && *(void *)(*((void *)internal + 13) + 24) == *(void *)(*MEMORY[0x1E4FB6690] + 24))
  {
    int v4 = WebCore::HTMLTextFormControlElement::selectionEnd(internal);
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7, v5);
    return v4;
  }
  else
  {
    int result = 96;
    __break(0xC471u);
  }
  return result;
}

- (void)setSelectionEnd:(int)selectionEnd
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6);
  internal = self->super.super.super.super._internal;
  if ((*((_WORD *)internal + 16) & 0x10) != 0
    && *(void *)(*((void *)internal + 13) + 24) == *(void *)(*MEMORY[0x1E4FB6690] + 24))
  {
    WebCore::HTMLTextFormControlElement::setSelectionEnd(internal);
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6, v5);
  }
  else
  {
    __break(0xC471u);
  }
}

- (id)selectionDirection
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  internal = self->super.super.super.super._internal;
  if ((*((_WORD *)internal + 16) & 0x10) != 0
    && *(void *)(*((void *)internal + 13) + 24) == *(void *)(*MEMORY[0x1E4FB6690] + 24))
  {
    if (*(void *)WebCore::HTMLTextFormControlElement::selectionDirection(internal)) {
      CFStringRef v5 = (__CFString *)WTF::StringImpl::operator NSString *();
    }
    else {
      CFStringRef v5 = &stru_1F3C7DA90;
    }
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7, v4);
    return v5;
  }
  else
  {
    id result = (id)96;
    __break(0xC471u);
  }
  return result;
}

- (void)setSelectionDirection:(id)a3
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10);
  internal = self->super.super.super.super._internal;
  if ((*((_WORD *)internal + 16) & 0x10) != 0
    && *(void *)(*((void *)internal + 13) + 24) == *(void *)(*MEMORY[0x1E4FB6690] + 24))
  {
    MEMORY[0x1E4E442D0](&v9, a3);
    WebCore::HTMLTextFormControlElement::setSelectionDirection(internal, (const WTF::String *)&v9);
    uint64_t v7 = v9;
    uint64_t v9 = 0;
    if (!v7)
    {
LABEL_6:
      WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10, v6);
      return;
    }
    if (*(_DWORD *)v7 != 2)
    {
      *(_DWORD *)v7 -= 2;
      goto LABEL_6;
    }
    WTF::StringImpl::destroy(v7, v6);
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10, v8);
  }
  else
  {
    __break(0xC471u);
  }
}

- (NSString)accessKey
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  internal = self->super.super.super.super._internal;
  if ((*((_WORD *)internal + 16) & 0x10) != 0
    && *(void *)(*((void *)internal + 13) + 24) == *(void *)(*MEMORY[0x1E4FB6690] + 24))
  {
    if (*(void *)WebCore::Element::getAttribute()) {
      CFStringRef v5 = (__CFString *)WTF::StringImpl::operator NSString *();
    }
    else {
      CFStringRef v5 = &stru_1F3C7DA90;
    }
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7, v4);
    return &v5->isa;
  }
  else
  {
    id result = (NSString *)96;
    __break(0xC471u);
  }
  return result;
}

- (void)setAccessKey:(NSString *)accessKey
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10);
  internal = self->super.super.super.super._internal;
  if ((*((_WORD *)internal + 16) & 0x10) != 0
    && *(void *)(*((void *)internal + 13) + 24) == *(void *)(*MEMORY[0x1E4FB6690] + 24))
  {
    WTF::AtomStringImpl::add((uint64_t *)&v11, (WTF::AtomStringImpl *)accessKey, v5);
    uint64_t v9 = v11;
    WebCore::Element::setAttributeWithoutSynchronization();
    if (!v9)
    {
LABEL_6:
      WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10, v7);
      return;
    }
    if (*(_DWORD *)v9 != 2)
    {
      *(_DWORD *)v9 -= 2;
      goto LABEL_6;
    }
    WTF::StringImpl::destroy(v9, v7);
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10, v8);
  }
  else
  {
    __break(0xC471u);
  }
}

- (id)autocomplete
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9);
  internal = self->super.super.super.super._internal;
  if ((*((_WORD *)internal + 16) & 0x10) != 0
    && *(void *)(*((void *)internal + 13) + 24) == *(void *)(*MEMORY[0x1E4FB6690] + 24))
  {
    WebCore::HTMLFormControlElement::autocomplete((uint64_t *)&v8, internal);
    if (v8)
    {
      CFStringRef v5 = (__CFString *)WTF::StringImpl::operator NSString *();
      unsigned int v6 = v8;
      uint64_t v8 = 0;
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
      CFStringRef v5 = &stru_1F3C7DA90;
    }
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9, v4);
    return v5;
  }
  else
  {
    id result = (id)96;
    __break(0xC471u);
  }
  return result;
}

- (void)setAutocomplete:(id)a3
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10);
  internal = self->super.super.super.super._internal;
  if ((*((_WORD *)internal + 16) & 0x10) != 0
    && *(void *)(*((void *)internal + 13) + 24) == *(void *)(*MEMORY[0x1E4FB6690] + 24))
  {
    WTF::AtomStringImpl::add((uint64_t *)&v11, (WTF::AtomStringImpl *)a3, v5);
    uint64_t v9 = v11;
    WebCore::HTMLFormControlElement::setAutocomplete();
    if (!v9)
    {
LABEL_6:
      WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10, v7);
      return;
    }
    if (*(_DWORD *)v9 != 2)
    {
      *(_DWORD *)v9 -= 2;
      goto LABEL_6;
    }
    WTF::StringImpl::destroy(v9, v7);
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10, v8);
  }
  else
  {
    __break(0xC471u);
  }
}

- (void)select
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  internal = self->super.super.super.super._internal;
  if ((*((_WORD *)internal + 16) & 0x10) != 0
    && *(void *)(*((void *)internal + 13) + 24) == *(void *)(*MEMORY[0x1E4FB6690] + 24))
  {
    WebCore::HTMLTextFormControlElement::select();
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v4);
  }
  else
  {
    __break(0xC471u);
  }
}

- (void)setRangeText:(id)a3
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v14);
  internal = self->super.super.super.super._internal;
  if ((*((_WORD *)internal + 16) & 0x10) == 0
    || *(void *)(*((void *)internal + 13) + 24) != *(void *)(*MEMORY[0x1E4FB6690] + 24))
  {
    __break(0xC471u);
    JUMPOUT(0x1E13B6044);
  }
  MEMORY[0x1E4E442D0](&v10, a3);
  WebCore::HTMLTextFormControlElement::setRangeText();
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
    goto LABEL_7;
  }
  if (*(_DWORD *)v7 != 2)
  {
    *(_DWORD *)v7 -= 2;
LABEL_7:
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v14, v6);
    return;
  }
  WTF::StringImpl::destroy(v7, v6);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v14, v8);
}

- (void)setRangeText:(id)a3 start:(unsigned int)a4 end:(unsigned int)a5 selectionMode:(id)a6
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v19);
  internal = self->super.super.super.super._internal;
  if ((*((_WORD *)internal + 16) & 0x10) == 0
    || *(void *)(*((void *)internal + 13) + 24) != *(void *)(*MEMORY[0x1E4FB6690] + 24))
  {
    __break(0xC471u);
    JUMPOUT(0x1E13B6260);
  }
  MEMORY[0x1E4E442D0](&v15, a3);
  MEMORY[0x1E4E442D0](&v14, a6);
  WebCore::HTMLTextFormControlElement::setRangeText();
  if (v18)
  {
    v19[80] = v16;
    uint64_t v13 = v17;
    uint64_t v17 = 0;
    uint64_t v20 = v13;
    raiseDOMErrorException();
  }
  char v11 = v14;
  v14 = 0;
  if (v11)
  {
    if (*(_DWORD *)v11 == 2)
    {
      WTF::StringImpl::destroy(v11, v10);
      uint64_t v12 = v15;
      uint64_t v15 = 0;
      if (!v12) {
        goto LABEL_13;
      }
      goto LABEL_10;
    }
    *(_DWORD *)v11 -= 2;
  }
  uint64_t v12 = v15;
  uint64_t v15 = 0;
  if (!v12) {
    goto LABEL_13;
  }
LABEL_10:
  if (*(_DWORD *)v12 == 2) {
    WTF::StringImpl::destroy(v12, v10);
  }
  else {
    *(_DWORD *)v12 -= 2;
  }
LABEL_13:
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v19, v10);
}

- (void)setSelectionRange:(int)start end:(int)end
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  internal = self->super.super.super.super._internal;
  if ((*((_WORD *)internal + 16) & 0x10) != 0
    && *(void *)(*((void *)internal + 13) + 24) == *(void *)(*MEMORY[0x1E4FB6690] + 24))
  {
    WebCore::HTMLTextFormControlElement::setSelectionRange();
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7, v6);
  }
  else
  {
    __break(0xC471u);
  }
}

- (BOOL)canShowPlaceholder
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  internal = self->super.super.super.super._internal;
  if ((*((_WORD *)internal + 16) & 0x10) != 0
    && *(void *)(*((void *)internal + 13) + 24) == *(void *)(*MEMORY[0x1E4FB6690] + 24))
  {
    BOOL v5 = (*((unsigned __int8 *)internal + 177) >> 4) & 1;
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7, v3);
    return v5;
  }
  else
  {
    BOOL result = 96;
    __break(0xC471u);
  }
  return result;
}

- (void)setCanShowPlaceholder:(BOOL)a3
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6);
  internal = self->super.super.super.super._internal;
  if ((*((_WORD *)internal + 16) & 0x10) != 0
    && *(void *)(*((void *)internal + 13) + 24) == *(void *)(*MEMORY[0x1E4FB6690] + 24))
  {
    WebCore::HTMLTextFormControlElement::setCanShowPlaceholder(internal);
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6, v5);
  }
  else
  {
    __break(0xC471u);
  }
}

- (int)structuralComplexityContribution
{
  return 0x7FFFFFFF;
}

- (id)startPosition
{
  char v3 = (WebCore::RenderTextControl *)(*((void *)self->super.super.super.super._internal + 9) & 0xFFFFFFFFFFFFLL);
  if (!v3)
  {
    v19.receiver = self;
    v19.super_class = (Class)DOMHTMLTextAreaElement;
    return [(DOMNode *)&v19 startPosition];
  }
  if ((*((unsigned char *)v3 + 52) & 7) == 1 && (*((unsigned char *)v3 + 53) & 4) != 0)
  {
    BOOL v5 = (WebCore::HTMLTextFormControlElement *)WebCore::RenderTextControl::textFormControlElement(v3);
    WebCore::HTMLTextFormControlElement::visiblePositionForIndex(v5);
    unsigned int v6 = v15;
    if (v15) {
      *((_DWORD *)v15 + 7) += 2;
    }
    char v11 = v6;
    int v12 = v16;
    char v13 = v17;
    char v14 = v18;
    id v7 = +[WebVisiblePosition _wrapVisiblePosition:&v11];
    uint64_t v8 = v11;
    char v11 = 0;
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
    uint64_t v10 = v15;
    uint64_t v15 = 0;
    if (v10)
    {
      if (*((_DWORD *)v10 + 7) != 2)
      {
        *((_DWORD *)v10 + 7) -= 2;
        return v7;
      }
      if ((*((_WORD *)v10 + 17) & 0x400) == 0)
      {
        WebCore::Node::removedLastRef(v10);
        return v7;
      }
    }
    return v7;
  }
  id result = (id)96;
  __break(0xC471u);
  return result;
}

- (id)endPosition
{
  uint64_t v2 = (WebCore::RenderTextControl *)(*((void *)self->super.super.super.super._internal + 9) & 0xFFFFFFFFFFFFLL);
  if (!v2)
  {
    v22.receiver = self;
    v22.super_class = (Class)DOMHTMLTextAreaElement;
    return [(DOMNode *)&v22 endPosition];
  }
  if ((*(unsigned char *)((*((void *)self->super.super.super.super._internal + 9) & 0xFFFFFFFFFFFFLL) + 0x34) & 7) == 1
    && (*(unsigned char *)((*((void *)self->super.super.super.super._internal + 9) & 0xFFFFFFFFFFFFLL) + 0x35) & 4) != 0)
  {
    int v4 = (WebCore::HTMLTextFormControlElement *)WebCore::RenderTextControl::textFormControlElement((WebCore::RenderTextControl *)(*((void *)self->super.super.super.super._internal + 9) & 0xFFFFFFFFFFFFLL));
    uint64_t v5 = *(void *)WebCore::RenderTextControl::textFormControlElement(v2);
    (*(void (**)(WTF::StringImpl **__return_ptr))(v5 + 1400))(&v17);
    WebCore::HTMLTextFormControlElement::visiblePositionForIndex(v4);
    uint64_t v9 = v17;
    char v17 = 0;
    if (v9)
    {
      if (*(_DWORD *)v9 == 2)
      {
        WTF::StringImpl::destroy(v9, v8);
        uint64_t v10 = v18;
        if (!v18) {
          goto LABEL_14;
        }
        goto LABEL_13;
      }
      *(_DWORD *)v9 -= 2;
    }
    uint64_t v10 = v18;
    if (!v18)
    {
LABEL_14:
      char v13 = v10;
      int v14 = v19;
      char v15 = v20;
      char v16 = v21;
      id v6 = +[WebVisiblePosition _wrapVisiblePosition:&v13];
      char v11 = v13;
      char v13 = 0;
      if (v11)
      {
        if (*((_DWORD *)v11 + 7) == 2)
        {
          if ((*((_WORD *)v11 + 17) & 0x400) == 0) {
            WebCore::Node::removedLastRef(v11);
          }
        }
        else
        {
          *((_DWORD *)v11 + 7) -= 2;
        }
      }
      int v12 = v18;
      char v18 = 0;
      if (v12)
      {
        if (*((_DWORD *)v12 + 7) != 2)
        {
          *((_DWORD *)v12 + 7) -= 2;
          return v6;
        }
        if ((*((_WORD *)v12 + 17) & 0x400) == 0)
        {
          WebCore::Node::removedLastRef(v12);
          return v6;
        }
      }
      return v6;
    }
LABEL_13:
    *((_DWORD *)v10 + 7) += 2;
    goto LABEL_14;
  }
  id result = (id)96;
  __break(0xC471u);
  return result;
}

@end