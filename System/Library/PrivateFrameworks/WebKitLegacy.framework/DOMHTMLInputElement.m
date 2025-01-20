@interface DOMHTMLInputElement
- (BOOL)_isAutoFilledAndViewable;
- (BOOL)_isAutofilled;
- (BOOL)_isEdited;
- (BOOL)_isTextField;
- (BOOL)autofocus;
- (BOOL)canShowPlaceholder;
- (BOOL)capture;
- (BOOL)checkValidity;
- (BOOL)checked;
- (BOOL)defaultChecked;
- (BOOL)disabled;
- (BOOL)formNoValidate;
- (BOOL)incremental;
- (BOOL)indeterminate;
- (BOOL)multiple;
- (BOOL)readOnly;
- (BOOL)required;
- (BOOL)willValidate;
- (DOMFileList)files;
- (DOMHTMLFormElement)form;
- (NSString)accept;
- (NSString)accessKey;
- (NSString)align;
- (NSString)alt;
- (NSString)altDisplayString;
- (NSString)defaultValue;
- (NSString)name;
- (NSString)size;
- (NSString)src;
- (NSString)type;
- (NSString)useMap;
- (NSString)value;
- (NSURL)absoluteImageURL;
- (double)valueAsDate;
- (double)valueAsNumber;
- (id)_autofillContext;
- (id)autocomplete;
- (id)dirName;
- (id)endPosition;
- (id)formAction;
- (id)formEnctype;
- (id)formMethod;
- (id)formTarget;
- (id)labels;
- (id)list;
- (id)max;
- (id)min;
- (id)pattern;
- (id)placeholder;
- (id)selectionDirection;
- (id)startPosition;
- (id)step;
- (id)validationMessage;
- (int)_autocapitalizeType;
- (int)maxLength;
- (int)selectionEnd;
- (int)selectionStart;
- (int)structuralComplexityContribution;
- (unsigned)height;
- (unsigned)width;
- (void)_setAutoFilledAndViewable:(BOOL)a3;
- (void)_setAutofilled:(BOOL)a3;
- (void)click;
- (void)insertTextSuggestion:(id)a3;
- (void)select;
- (void)setAccept:(NSString *)accept;
- (void)setAccessKey:(NSString *)accessKey;
- (void)setAlign:(NSString *)align;
- (void)setAlt:(NSString *)alt;
- (void)setAutocomplete:(id)a3;
- (void)setAutofocus:(BOOL)autofocus;
- (void)setCanShowPlaceholder:(BOOL)a3;
- (void)setCapture:(BOOL)a3;
- (void)setChecked:(BOOL)checked;
- (void)setCustomValidity:(id)a3;
- (void)setDefaultChecked:(BOOL)defaultChecked;
- (void)setDefaultValue:(NSString *)defaultValue;
- (void)setDirName:(id)a3;
- (void)setDisabled:(BOOL)disabled;
- (void)setFiles:(DOMFileList *)files;
- (void)setFormAction:(id)a3;
- (void)setFormEnctype:(id)a3;
- (void)setFormMethod:(id)a3;
- (void)setFormNoValidate:(BOOL)a3;
- (void)setFormTarget:(id)a3;
- (void)setHeight:(unsigned int)a3;
- (void)setIndeterminate:(BOOL)indeterminate;
- (void)setMax:(id)a3;
- (void)setMaxLength:(int)maxLength;
- (void)setMin:(id)a3;
- (void)setMultiple:(BOOL)multiple;
- (void)setName:(NSString *)name;
- (void)setPattern:(id)a3;
- (void)setPlaceholder:(id)a3;
- (void)setRangeText:(id)a3;
- (void)setRangeText:(id)a3 start:(unsigned int)a4 end:(unsigned int)a5 selectionMode:(id)a6;
- (void)setReadOnly:(BOOL)readOnly;
- (void)setRequired:(BOOL)a3;
- (void)setSelectionDirection:(id)a3;
- (void)setSelectionEnd:(int)selectionEnd;
- (void)setSelectionRange:(int)start end:(int)end;
- (void)setSelectionStart:(int)selectionStart;
- (void)setSize:(NSString *)size;
- (void)setSrc:(NSString *)src;
- (void)setStep:(id)a3;
- (void)setType:(NSString *)type;
- (void)setUseMap:(NSString *)useMap;
- (void)setValue:(NSString *)value;
- (void)setValueAsDate:(double)a3;
- (void)setValueAsNumber:(double)a3;
- (void)setValueAsNumberWithChangeEvent:(double)a3;
- (void)setValueForUser:(id)a3;
- (void)setValueWithChangeEvent:(id)a3;
- (void)setWidth:(unsigned int)a3;
- (void)stepDown:(int)a3;
- (void)stepUp:(int)a3;
@end

@implementation DOMHTMLInputElement

- (BOOL)_isTextField
{
  if (self) {
    self = (DOMHTMLInputElement *)self->super.super.super.super._internal;
  }
  return WebCore::HTMLInputElement::isTextField((WebCore::HTMLInputElement *)self);
}

- (BOOL)_isEdited
{
  if (self) {
    self = (DOMHTMLInputElement *)self->super.super.super.super._internal;
  }
  return MEMORY[0x1F4175AD8](self, a2);
}

- (int)_autocapitalizeType
{
  if (self) {
    self = (DOMHTMLInputElement *)self->super.super.super.super._internal;
  }
  char v2 = WebCore::HTMLFormControlElement::autocapitalizeType((WebCore::HTMLFormControlElement *)self);
  if (((v2 - 1) & 0xFC) != 0) {
    return 0;
  }
  else {
    return (v2 - 1) + 1;
  }
}

- (void)setValueWithChangeEvent:(id)a3
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v11);
  MEMORY[0x1E4E442D0](&v8, a3);
  WebCore::HTMLInputElement::setValue();
  if (v10)
  {
    v5 = v9;
    v9 = 0;
    if (v5)
    {
      if (*(_DWORD *)v5 == 2)
      {
        WTF::StringImpl::destroy(v5, v4);
        v6 = v8;
        v8 = 0;
        if (!v6) {
          goto LABEL_8;
        }
        goto LABEL_6;
      }
      *(_DWORD *)v5 -= 2;
    }
  }
  v6 = v8;
  v8 = 0;
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

- (void)setValueAsNumberWithChangeEvent:(double)a3
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6);
  WebCore::HTMLInputElement::setValueAsNumber();
  if (v5 && v4)
  {
    if (*(_DWORD *)v4 == 2) {
      WTF::StringImpl::destroy(v4, v3);
    }
    else {
      *(_DWORD *)v4 -= 2;
    }
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6, v3);
}

- (NSString)accept
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

- (void)setAccept:(NSString *)accept
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WTF::AtomStringImpl::add((uint64_t *)&v9, (WTF::AtomStringImpl *)accept, v4);
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

- (id)autocomplete
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WebCore::HTMLFormControlElement::autocomplete((uint64_t *)&v7, self->super.super.super.super._internal);
  if (v7)
  {
    CFStringRef v4 = (__CFString *)WTF::StringImpl::operator NSString *();
    char v5 = v7;
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
  return v4;
}

- (void)setAutocomplete:(id)a3
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WTF::AtomStringImpl::add((uint64_t *)&v9, (WTF::AtomStringImpl *)a3, v4);
  v7 = v9;
  WebCore::HTMLFormControlElement::setAutocomplete();
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

- (BOOL)defaultChecked
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
  uint64_t v8 = *MEMORY[0x1E4FB6610];
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

- (void)setDefaultChecked:(BOOL)defaultChecked
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v4);
  WebCore::Element::setBooleanAttribute();
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v4, v3);
}

- (BOOL)checked
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LOWORD(self) = *((_WORD *)self->super.super.super.super._internal + 119) & 1;
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return (char)self;
}

- (void)setChecked:(BOOL)checked
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v4);
  WebCore::HTMLInputElement::setChecked();
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v4, v3);
}

- (id)dirName
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

- (void)setDirName:(id)a3
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

- (DOMFileList)files
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  uint64_t v3 = (DOMObjectInternal *)WebCore::HTMLInputElement::files(self->super.super.super.super._internal);
  uint64_t v4 = (DOMFileList *)kit(v3);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7, v5);
  return v4;
}

- (void)setFiles:(DOMFileList *)files
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v12);
  if (files)
  {
    internal = files->super._internal;
    if (internal) {
      ++*((_DWORD *)internal + 2);
    }
  }
  else
  {
    internal = 0;
  }
  v11 = internal;
  WebCore::HTMLInputElement::setFiles();
  if (v11)
  {
    if (*((_DWORD *)v11 + 2) == 1)
    {
      uint64_t v6 = *((unsigned int *)v11 + 7);
      if (v6)
      {
        uint64_t v7 = (_DWORD **)*((void *)v11 + 2);
        uint64_t v8 = 8 * v6;
        do
        {
          uint64_t v9 = *v7;
          WTF::StringImpl *v7 = 0;
          if (v9)
          {
            if (v9[4] == 1) {
              (*(void (**)(_DWORD *))(*(void *)v9 + 8))(v9);
            }
            else {
              --v9[4];
            }
          }
          ++v7;
          v8 -= 8;
        }
        while (v8);
      }
      BOOL v10 = (WTF *)*((void *)v11 + 2);
      if (v10)
      {
        *((void *)v11 + 2) = 0;
        *((_DWORD *)v11 + 6) = 0;
        WTF::fastFree(v10, v5);
      }
      if (*(void *)v11)
      {
        *(void *)(*(void *)v11 + 8) = 3;
        *(void *)v11 = 0;
      }
      MEMORY[0x1E4E48930](v11);
    }
    else
    {
      --*((_DWORD *)v11 + 2);
    }
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v12, v5);
}

- (id)formAction
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WebCore::HTMLFormControlElement::formAction((uint64_t *)&v7, self->super.super.super.super._internal);
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
  return v4;
}

- (void)setFormAction:(id)a3
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WTF::AtomStringImpl::add((uint64_t *)&v9, (WTF::AtomStringImpl *)a3, v4);
  uint64_t v7 = v9;
  WebCore::HTMLFormControlElement::setFormAction();
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

- (id)formEnctype
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WebCore::HTMLFormControlElement::formEnctype((uint64_t *)&v7, self->super.super.super.super._internal);
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

- (void)setFormEnctype:(id)a3
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WTF::AtomStringImpl::add((uint64_t *)&v9, (WTF::AtomStringImpl *)a3, v4);
  uint64_t v7 = v9;
  WebCore::HTMLFormControlElement::setFormEnctype();
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

- (id)formMethod
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WebCore::HTMLFormControlElement::formMethod((uint64_t *)&v7, self->super.super.super.super._internal);
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

- (void)setFormMethod:(id)a3
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WTF::AtomStringImpl::add((uint64_t *)&v9, (WTF::AtomStringImpl *)a3, v4);
  uint64_t v7 = v9;
  WebCore::HTMLFormControlElement::setFormMethod();
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

- (BOOL)formNoValidate
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v12);
  uint64_t v4 = *((void *)self->super.super.super.super._internal + 14);
  if (!v4) {
    goto LABEL_12;
  }
  unsigned int v5 = *(_DWORD *)(v4 + 4);
  if (v5)
  {
    uint64_t v6 = *(uint64_t **)(v4 + 40);
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
    uint64_t v6 = (uint64_t *)(v4 + 32);
    LODWORD(v7) = v5 >> 5;
    if (!v7) {
      goto LABEL_12;
    }
  }
  uint64_t v8 = *MEMORY[0x1E4FB67C8];
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

- (void)setFormNoValidate:(BOOL)a3
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v4);
  WebCore::Element::setBooleanAttribute();
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v4, v3);
}

- (id)formTarget
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  if (*(void *)WebCore::Element::getAttribute()) {
    uint64_t v3 = (__CFString *)WTF::StringImpl::operator NSString *();
  }
  else {
    uint64_t v3 = &stru_1F3C7DA90;
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v2);
  return v3;
}

- (void)setFormTarget:(id)a3
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

- (unsigned)height
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LODWORD(self) = WebCore::HTMLInputElement::height(self->super.super.super.super._internal);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return self;
}

- (void)setHeight:(unsigned int)a3
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  WebCore::HTMLInputElement::setHeight(self->super.super.super.super._internal);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v4);
}

- (BOOL)indeterminate
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LODWORD(self) = (*((unsigned __int16 *)self->super.super.super.super._internal + 119) >> 3) & 1;
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return (char)self;
}

- (void)setIndeterminate:(BOOL)indeterminate
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  WebCore::HTMLInputElement::setIndeterminate(self->super.super.super.super._internal);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v4);
}

- (id)list
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  MEMORY[0x1E4E4A090](&v7, self->super.super.super.super._internal);
  CFStringRef v4 = kit(v7);
  unsigned int v5 = v7;
  uint64_t v7 = 0;
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

- (id)max
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  if (*(void *)WebCore::Element::getAttribute()) {
    uint64_t v3 = (__CFString *)WTF::StringImpl::operator NSString *();
  }
  else {
    uint64_t v3 = &stru_1F3C7DA90;
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v2);
  return v3;
}

- (void)setMax:(id)a3
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

- (int)maxLength
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LODWORD(self) = *((_DWORD *)self->super.super.super.super._internal + 45);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return (int)self;
}

- (void)setMaxLength:(int)maxLength
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WebCore::HTMLTextFormControlElement::setMaxLength(self->super.super.super.super._internal);
  if (v7)
  {
    unsigned char v8[80] = v5;
    uint64_t v9 = v6;
    raiseDOMErrorException();
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8, v4);
}

- (id)min
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  if (*(void *)WebCore::Element::getAttribute()) {
    uint64_t v3 = (__CFString *)WTF::StringImpl::operator NSString *();
  }
  else {
    uint64_t v3 = &stru_1F3C7DA90;
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v2);
  return v3;
}

- (void)setMin:(id)a3
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WTF::AtomStringImpl::add((uint64_t *)&v9, (WTF::AtomStringImpl *)a3, v4);
  char v7 = v9;
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

- (BOOL)multiple
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v12);
  uint64_t v4 = *((void *)self->super.super.super.super._internal + 14);
  if (!v4) {
    goto LABEL_12;
  }
  unsigned int v5 = *(_DWORD *)(v4 + 4);
  if (v5)
  {
    uint64_t v6 = *(uint64_t **)(v4 + 40);
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
    uint64_t v6 = (uint64_t *)(v4 + 32);
    LODWORD(v7) = v5 >> 5;
    if (!v7) {
      goto LABEL_12;
    }
  }
  uint64_t v8 = *MEMORY[0x1E4FB66E8];
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
      uint64_t v6 = &stru_1F3C7DA90;
      goto LABEL_18;
    }
  }
  if (!*MEMORY[0x1E4F30968]) {
    goto LABEL_17;
  }
LABEL_4:
  uint64_t v6 = (__CFString *)WTF::StringImpl::operator NSString *();
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

- (id)pattern
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  if (*(void *)WebCore::Element::getAttribute()) {
    uint64_t v3 = (__CFString *)WTF::StringImpl::operator NSString *();
  }
  else {
    uint64_t v3 = &stru_1F3C7DA90;
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v2);
  return v3;
}

- (void)setPattern:(id)a3
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

- (id)placeholder
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  if (*(void *)WebCore::Element::getAttribute()) {
    uint64_t v3 = (__CFString *)WTF::StringImpl::operator NSString *();
  }
  else {
    uint64_t v3 = &stru_1F3C7DA90;
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v2);
  return v3;
}

- (void)setPlaceholder:(id)a3
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

- (BOOL)readOnly
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v12);
  uint64_t v4 = *((void *)self->super.super.super.super._internal + 14);
  if (!v4) {
    goto LABEL_12;
  }
  unsigned int v5 = *(_DWORD *)(v4 + 4);
  if (v5)
  {
    uint64_t v6 = *(uint64_t **)(v4 + 40);
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
    uint64_t v6 = (uint64_t *)(v4 + 32);
    LODWORD(v7) = v5 >> 5;
    if (!v7) {
      goto LABEL_12;
    }
  }
  uint64_t v8 = *MEMORY[0x1E4FB66F8];
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

- (void)setReadOnly:(BOOL)readOnly
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v4);
  WebCore::Element::setBooleanAttribute();
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v4, v3);
}

- (BOOL)required
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v12);
  uint64_t v4 = *((void *)self->super.super.super.super._internal + 14);
  if (!v4) {
    goto LABEL_12;
  }
  unsigned int v5 = *(_DWORD *)(v4 + 4);
  if (v5)
  {
    uint64_t v6 = *(uint64_t **)(v4 + 40);
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
    uint64_t v6 = (uint64_t *)(v4 + 32);
    LODWORD(v7) = v5 >> 5;
    if (!v7) {
      goto LABEL_12;
    }
  }
  uint64_t v8 = *MEMORY[0x1E4FB6700];
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

- (void)setRequired:(BOOL)a3
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v4);
  WebCore::Element::setBooleanAttribute();
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v4, v3);
}

- (NSString)size
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  WTF::String::number((WTF::String *)*((unsigned int *)self->super.super.super.super._internal + 58));
  if (v6)
  {
    uint64_t v4 = (__CFString *)WTF::StringImpl::operator NSString *();
    if (*(_DWORD *)v6 == 2) {
      WTF::StringImpl::destroy(v6, v3);
    }
    else {
      *(_DWORD *)v6 -= 2;
    }
  }
  else
  {
    uint64_t v4 = &stru_1F3C7DA90;
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7, v3);
  return &v4->isa;
}

- (void)setSize:(NSString *)size
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10);
  internal = self->super.super.super.super._internal;
  [(NSString *)size intValue];
  WebCore::HTMLInputElement::setSize(internal);
  if (!v9 || !v8) {
    goto LABEL_5;
  }
  if (*(_DWORD *)v8 != 2)
  {
    *(_DWORD *)v8 -= 2;
LABEL_5:
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10, v6);
    return;
  }
  WTF::StringImpl::destroy(v8, v6);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10, v7);
}

- (NSString)src
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6);
  WebCore::Element::getURLAttribute();
  if (v5)
  {
    uint64_t v3 = (__CFString *)WTF::StringImpl::operator NSString *();
    if (*(_DWORD *)v5 == 2) {
      WTF::StringImpl::destroy(v5, v2);
    }
    else {
      *(_DWORD *)v5 -= 2;
    }
  }
  else
  {
    uint64_t v3 = &stru_1F3C7DA90;
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6, v2);
  return &v3->isa;
}

- (void)setSrc:(NSString *)src
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WTF::AtomStringImpl::add((uint64_t *)&v9, (WTF::AtomStringImpl *)src, v4);
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

- (id)step
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  if (*(void *)WebCore::Element::getAttribute()) {
    uint64_t v3 = (__CFString *)WTF::StringImpl::operator NSString *();
  }
  else {
    uint64_t v3 = &stru_1F3C7DA90;
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v2);
  return v3;
}

- (void)setStep:(id)a3
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

- (void)setType:(NSString *)type
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WTF::AtomStringImpl::add((uint64_t *)&v9, (WTF::AtomStringImpl *)type, v4);
  uint64_t v7 = v9;
  WebCore::HTMLInputElement::setType();
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

- (NSString)defaultValue
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6);
  if (*(void *)WebCore::HTMLInputElement::defaultValue(self->super.super.super.super._internal)) {
    CFStringRef v4 = (__CFString *)WTF::StringImpl::operator NSString *();
  }
  else {
    CFStringRef v4 = &stru_1F3C7DA90;
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6, v3);
  return &v4->isa;
}

- (void)setDefaultValue:(NSString *)defaultValue
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WTF::AtomStringImpl::add((uint64_t *)&v9, (WTF::AtomStringImpl *)defaultValue, v4);
  uint64_t v7 = v9;
  WebCore::HTMLInputElement::setDefaultValue();
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

- (NSString)value
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WebCore::HTMLInputElement::value((uint64_t *)&v7, self->super.super.super.super._internal);
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
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v11);
  MEMORY[0x1E4E442D0](&v8, value);
  WebCore::HTMLInputElement::setValue();
  if (v10)
  {
    unsigned int v5 = v9;
    char v9 = 0;
    if (v5)
    {
      if (*(_DWORD *)v5 == 2)
      {
        WTF::StringImpl::destroy(v5, v4);
        uint64_t v6 = v8;
        uint64_t v8 = 0;
        if (!v6) {
          goto LABEL_8;
        }
        goto LABEL_6;
      }
      *(_DWORD *)v5 -= 2;
    }
  }
  uint64_t v6 = v8;
  uint64_t v8 = 0;
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

- (double)valueAsDate
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  WebCore::HTMLInputElement::valueAsDate(self->super.super.super.super._internal);
  double v4 = v3 + -978307200.0;
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7, v5);
  return v4;
}

- (void)setValueAsDate:(double)a3
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  WebCore::HTMLInputElement::setValueAsDate();
  if (v6)
  {
    unsigned char v7[80] = v4;
    uint64_t v8 = v5;
    raiseDOMErrorException();
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7, v3);
}

- (double)valueAsNumber
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  WebCore::HTMLInputElement::valueAsNumber(self->super.super.super.super._internal);
  double v4 = v3;
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7, v5);
  return v4;
}

- (void)setValueAsNumber:(double)a3
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  WebCore::HTMLInputElement::setValueAsNumber();
  if (v6)
  {
    unsigned char v7[80] = v4;
    uint64_t v8 = v5;
    raiseDOMErrorException();
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7, v3);
}

- (unsigned)width
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LODWORD(self) = WebCore::HTMLInputElement::width(self->super.super.super.super._internal);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return self;
}

- (void)setWidth:(unsigned int)a3
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  WebCore::HTMLInputElement::setWidth(self->super.super.super.super._internal);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v4);
}

- (BOOL)willValidate
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LOBYTE(self) = WebCore::ValidatedFormListedElement::willValidate((WebCore::ValidatedFormListedElement *)((char *)self->super.super.super.super._internal + 120));
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return (char)self;
}

- (id)validationMessage
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WebCore::HTMLInputElement::validationMessage((uint64_t *)&v7, self->super.super.super.super._internal);
  if (v7)
  {
    char v4 = (__CFString *)WTF::StringImpl::operator NSString *();
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
    char v4 = &stru_1F3C7DA90;
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8, v3);
  return v4;
}

- (id)labels
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WebCore::HTMLElement::labels((uint64_t *)&v7, self->super.super.super.super._internal);
  char v4 = kit(v7);
  uint64_t v5 = v7;
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

- (int)selectionStart
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LODWORD(self) = WebCore::HTMLTextFormControlElement::selectionStart(self->super.super.super.super._internal);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return (int)self;
}

- (void)setSelectionStart:(int)selectionStart
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  WebCore::HTMLTextFormControlElement::setSelectionStart(self->super.super.super.super._internal);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v4);
}

- (int)selectionEnd
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LODWORD(self) = WebCore::HTMLTextFormControlElement::selectionEnd(self->super.super.super.super._internal);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return (int)self;
}

- (void)setSelectionEnd:(int)selectionEnd
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  WebCore::HTMLTextFormControlElement::setSelectionEnd(self->super.super.super.super._internal);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v4);
}

- (id)selectionDirection
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6);
  if (*(void *)WebCore::HTMLTextFormControlElement::selectionDirection(self->super.super.super.super._internal)) {
    char v4 = (__CFString *)WTF::StringImpl::operator NSString *();
  }
  else {
    char v4 = &stru_1F3C7DA90;
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6, v3);
  return v4;
}

- (void)setSelectionDirection:(id)a3
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10);
  internal = self->super.super.super.super._internal;
  MEMORY[0x1E4E442D0](&v9, a3);
  WebCore::HTMLTextFormControlElement::setSelectionDirection(internal, (const WTF::String *)&v9);
  uint64_t v7 = v9;
  char v9 = 0;
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

- (NSString)align
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  if (*(void *)WebCore::Element::getAttribute()) {
    double v3 = (__CFString *)WTF::StringImpl::operator NSString *();
  }
  else {
    double v3 = &stru_1F3C7DA90;
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v2);
  return &v3->isa;
}

- (void)setAlign:(NSString *)align
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WTF::AtomStringImpl::add((uint64_t *)&v9, (WTF::AtomStringImpl *)align, v4);
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

- (NSString)useMap
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  if (*(void *)WebCore::Element::getAttribute()) {
    double v3 = (__CFString *)WTF::StringImpl::operator NSString *();
  }
  else {
    double v3 = &stru_1F3C7DA90;
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v2);
  return &v3->isa;
}

- (void)setUseMap:(NSString *)useMap
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WTF::AtomStringImpl::add((uint64_t *)&v9, (WTF::AtomStringImpl *)useMap, v4);
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

- (BOOL)incremental
{
  return 0;
}

- (NSString)accessKey
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  if (*(void *)WebCore::Element::getAttribute()) {
    double v3 = (__CFString *)WTF::StringImpl::operator NSString *();
  }
  else {
    double v3 = &stru_1F3C7DA90;
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

- (NSString)altDisplayString
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v11);
  WebCore::HTMLInputElement::alt((uint64_t *)&v9, self->super.super.super.super._internal);
  WebCore::displayString((uint64_t *)&v10, (WebCore *)&v9, self->super.super.super.super._internal, v3);
  if (!v10)
  {
    char v10 = 0;
    uint64_t v5 = &stru_1F3C7DA90;
LABEL_7:
    uint64_t v7 = v9;
    char v9 = 0;
    if (!v7) {
      goto LABEL_11;
    }
    goto LABEL_8;
  }
  uint64_t v5 = (__CFString *)WTF::StringImpl::operator NSString *();
  char v6 = v10;
  char v10 = 0;
  if (!v6) {
    goto LABEL_7;
  }
  if (*(_DWORD *)v6 == 2)
  {
    WTF::StringImpl::destroy(v6, v4);
    uint64_t v7 = v9;
    char v9 = 0;
    if (!v7) {
      goto LABEL_11;
    }
  }
  else
  {
    *(_DWORD *)v6 -= 2;
    uint64_t v7 = v9;
    char v9 = 0;
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

- (NSURL)absoluteImageURL
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  uint64_t v4 = *((void *)self->super.super.super.super._internal + 9);
  if ((v4 & 0xFFFFFFFFFFFFLL) == 0) {
    goto LABEL_5;
  }
  if ((*(unsigned char *)((v4 & 0xFFFFFFFFFFFFLL) + 0x2D) & 2) == 0)
  {
    if ((*(uint64_t (**)(uint64_t))(*(void *)(v4 & 0xFFFFFFFFFFFFLL) + 152))(v4 & 0xFFFFFFFFFFFFLL))
    {
      uint64_t v5 = [(DOMElement *)self _getURLAttribute:@"src"];
LABEL_6:
      WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7, v3);
      return v5;
    }
LABEL_5:
    uint64_t v5 = 0;
    goto LABEL_6;
  }
  result = (NSURL *)105;
  __break(0xC471u);
  return result;
}

- (BOOL)capture
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v12);
  uint64_t v4 = *((void *)self->super.super.super.super._internal + 14);
  if (!v4) {
    goto LABEL_12;
  }
  unsigned int v5 = *(_DWORD *)(v4 + 4);
  if (v5)
  {
    char v6 = *(uint64_t **)(v4 + 40);
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
    char v6 = (uint64_t *)(v4 + 32);
    LODWORD(v7) = v5 >> 5;
    if (!v7) {
      goto LABEL_12;
    }
  }
  uint64_t v8 = *MEMORY[0x1E4FB65F8];
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

- (void)setCapture:(BOOL)a3
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v4);
  WebCore::Element::setBooleanAttribute();
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v4, v3);
}

- (void)stepUp:(int)a3
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WebCore::HTMLInputElement::stepUp(self->super.super.super.super._internal);
  if (v7)
  {
    unsigned char v8[80] = v5;
    uint64_t v9 = v6;
    raiseDOMErrorException();
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8, v4);
}

- (void)stepDown:(int)a3
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WebCore::HTMLInputElement::stepDown(self->super.super.super.super._internal);
  if (v7)
  {
    unsigned char v8[80] = v5;
    uint64_t v9 = v6;
    raiseDOMErrorException();
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8, v4);
}

- (BOOL)checkValidity
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  char v2 = WebCore::ValidatedFormListedElement::checkValidity();
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return v2;
}

- (void)setCustomValidity:(id)a3
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10);
  internal = self->super.super.super.super._internal;
  MEMORY[0x1E4E442D0](&v9, a3);
  WebCore::ValidatedFormListedElement::setCustomValidity((DOMObjectInternal *)((char *)internal + 120), (const WTF::String *)&v9);
  char v7 = v9;
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

- (void)select
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v3);
  WebCore::HTMLTextFormControlElement::select();
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v3, v2);
}

- (void)setRangeText:(id)a3
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v12);
  MEMORY[0x1E4E442D0](&v8, a3);
  WebCore::HTMLTextFormControlElement::setRangeText();
  if (v11)
  {
    unsigned char v12[80] = v9;
    uint64_t v7 = v10;
    uint64_t v10 = 0;
    uint64_t v13 = v7;
    raiseDOMErrorException();
  }
  char v5 = v8;
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

- (void)setRangeText:(id)a3 start:(unsigned int)a4 end:(unsigned int)a5 selectionMode:(id)a6
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v17);
  MEMORY[0x1E4E442D0](&v13, a3);
  MEMORY[0x1E4E442D0](&v12, a6);
  WebCore::HTMLInputElement::setRangeText();
  if (v16)
  {
    v17[80] = v14;
    uint64_t v11 = v15;
    uint64_t v15 = 0;
    uint64_t v18 = v11;
    raiseDOMErrorException();
  }
  char v9 = v12;
  v12 = 0;
  if (v9)
  {
    if (*(_DWORD *)v9 == 2)
    {
      WTF::StringImpl::destroy(v9, v8);
      uint64_t v10 = v13;
      uint64_t v13 = 0;
      if (!v10) {
        goto LABEL_11;
      }
      goto LABEL_8;
    }
    *(_DWORD *)v9 -= 2;
  }
  uint64_t v10 = v13;
  uint64_t v13 = 0;
  if (!v10) {
    goto LABEL_11;
  }
LABEL_8:
  if (*(_DWORD *)v10 == 2) {
    WTF::StringImpl::destroy(v10, v8);
  }
  else {
    *(_DWORD *)v10 -= 2;
  }
LABEL_11:
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v17, v8);
}

- (void)setSelectionRange:(int)start end:(int)end
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  WebCore::HTMLTextFormControlElement::setSelectionRange();
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v4);
}

- (void)click
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v4);
  WebCore::HTMLElement::click(self->super.super.super.super._internal);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v4, v3);
}

- (void)setValueForUser:(id)a3
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9);
  MEMORY[0x1E4E442D0](&v8, a3);
  WebCore::HTMLInputElement::setValue();
  if (v11)
  {
    char v5 = v10;
    uint64_t v10 = 0;
    if (v5)
    {
      if (*(_DWORD *)v5 == 2)
      {
        WTF::StringImpl::destroy(v5, v4);
        uint64_t v6 = v8;
        uint64_t v8 = 0;
        if (!v6) {
          goto LABEL_8;
        }
        goto LABEL_6;
      }
      *(_DWORD *)v5 -= 2;
    }
  }
  uint64_t v6 = v8;
  uint64_t v8 = 0;
  if (!v6)
  {
LABEL_8:
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9, v4);
    return;
  }
LABEL_6:
  if (*(_DWORD *)v6 != 2)
  {
    *(_DWORD *)v6 -= 2;
    goto LABEL_8;
  }
  WTF::StringImpl::destroy(v6, v4);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9, v7);
}

- (id)_autofillContext
{
  v15[1] = *MEMORY[0x1E4F143B8];
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v13);
  internal = self->super.super.super.super._internal;
  *((_DWORD *)internal + 7) += 2;
  uint64_t v8 = internal;
  WebCore::AutofillElements::computeAutofillElements();
  if (v12)
  {
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
  }
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
  if (v12
    && (uint64_t v5 = objc_msgSend(MEMORY[0x1E4F1CB10], "URLWithString:", -[DOMDocument URL](-[DOMNode ownerDocument](self, "ownerDocument", 0), "URL"))) != 0)
  {
    char v14 = @"_WebViewURL";
    v15[0] = v5;
    uint64_t v6 = (void *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
  }
  else
  {
    uint64_t v6 = 0;
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v13, v4);
  return v6;
}

- (void)insertTextSuggestion:(id)a3
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v21);
  internal = self->super.super.super.super._internal;
  if (!internal) {
    goto LABEL_16;
  }
  *((_DWORD *)internal + 7) += 2;
  char v16 = internal;
  WebCore::AutofillElements::computeAutofillElements();
  uint64_t v7 = v16;
  char v16 = 0;
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
  if (!v20) {
    goto LABEL_16;
  }
  MEMORY[0x1E4E442D0](&v15, [a3 username]);
  MEMORY[0x1E4E442D0](&v14, [a3 password]);
  WebCore::AutofillElements::autofill();
  uint64_t v8 = v14;
  char v14 = 0;
  if (!v8)
  {
LABEL_10:
    char v9 = v15;
    uint64_t v15 = 0;
    if (!v9) {
      goto LABEL_15;
    }
    goto LABEL_13;
  }
  if (*(_DWORD *)v8 != 2)
  {
    *(_DWORD *)v8 -= 2;
    goto LABEL_10;
  }
  WTF::StringImpl::destroy(v8, v5);
  char v9 = v15;
  uint64_t v15 = 0;
  if (!v9) {
    goto LABEL_15;
  }
LABEL_13:
  if (*(_DWORD *)v9 == 2)
  {
    WTF::StringImpl::destroy(v9, v5);
    if (!v20) {
      goto LABEL_16;
    }
    goto LABEL_18;
  }
  *(_DWORD *)v9 -= 2;
LABEL_15:
  if (!v20)
  {
LABEL_16:
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v21, v5);
    return;
  }
LABEL_18:
  uint64_t v10 = v19;
  v19 = 0;
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
  char v11 = v18;
  uint64_t v18 = 0;
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
  char v12 = v17;
  v17 = 0;
  if (!v12) {
    goto LABEL_16;
  }
  if (*((_DWORD *)v12 + 7) == 2)
  {
    if ((*((_WORD *)v12 + 17) & 0x400) != 0) {
      goto LABEL_16;
    }
    WebCore::Node::removedLastRef(v12);
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v21, v13);
  }
  else
  {
    *((_DWORD *)v12 + 7) -= 2;
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v21, v5);
  }
}

- (BOOL)canShowPlaceholder
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LODWORD(self) = (*((unsigned __int8 *)self->super.super.super.super._internal + 177) >> 4) & 1;
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return (char)self;
}

- (void)setCanShowPlaceholder:(BOOL)a3
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  WebCore::HTMLTextFormControlElement::setCanShowPlaceholder(self->super.super.super.super._internal);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v4);
}

- (int)structuralComplexityContribution
{
  return 0x7FFFFFFF;
}

- (BOOL)_isAutofilled
{
  uint64_t v2 = core((uint64_t)self);
  if (!v2
    || (*(_WORD *)(v2 + 32) & 0x10) != 0
    && *(void *)(*(void *)(v2 + 104) + 24) == *(void *)(*MEMORY[0x1E4FB69A8] + 24))
  {
    return HIBYTE(*(unsigned __int16 *)(v2 + 238)) & 1;
  }
  else
  {
    LOBYTE(v3) = 105;
    __break(0xC471u);
  }
  return v3;
}

- (BOOL)_isAutoFilledAndViewable
{
  uint64_t v2 = core((uint64_t)self);
  if (!v2
    || (*(_WORD *)(v2 + 32) & 0x10) != 0
    && *(void *)(*(void *)(v2 + 104) + 24) == *(void *)(*MEMORY[0x1E4FB69A8] + 24))
  {
    return (*(unsigned __int16 *)(v2 + 238) >> 9) & 1;
  }
  else
  {
    LOBYTE(v3) = 105;
    __break(0xC471u);
  }
  return v3;
}

- (void)_setAutofilled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v4 = core((uint64_t)self);
  if (!v4
    || (*(_WORD *)(v4 + 32) & 0x10) != 0
    && *(void *)(*(void *)(v4 + 104) + 24) == *(void *)(*MEMORY[0x1E4FB69A8] + 24))
  {
    uint64_t v7 = (const char *)v3;
  }
  else
  {
    uint64_t v7 = "/AppleInternal/Library/BuildRoots/7a5643da-a7fb-11ef-987a-36218cb420d5/Applications/Xcode.app/Contents/Develope"
         "r/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS18.2.Internal.sdk/usr/local/include/wtf/TypeCasts.h";
    uint64_t v5 = "match_constness_t<Source, Target> *WTF::downcast(Source *) [Target = WebCore::HTMLInputElement, Source = WebCore::Element]";
    uint64_t v4 = 105;
    uint64_t v6 = 2;
    __break(0xC471u);
  }
  MEMORY[0x1F416E6A8](v4, v7, v5, v6);
}

- (void)_setAutoFilledAndViewable:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v4 = core((uint64_t)self);
  if (!v4
    || (*(_WORD *)(v4 + 32) & 0x10) != 0
    && *(void *)(*(void *)(v4 + 104) + 24) == *(void *)(*MEMORY[0x1E4FB69A8] + 24))
  {
    uint64_t v7 = (const char *)v3;
  }
  else
  {
    uint64_t v7 = "/AppleInternal/Library/BuildRoots/7a5643da-a7fb-11ef-987a-36218cb420d5/Applications/Xcode.app/Contents/Develope"
         "r/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS18.2.Internal.sdk/usr/local/include/wtf/TypeCasts.h";
    uint64_t v5 = "match_constness_t<Source, Target> *WTF::downcast(Source *) [Target = WebCore::HTMLInputElement, Source = WebCore::Element]";
    uint64_t v4 = 105;
    uint64_t v6 = 2;
    __break(0xC471u);
  }
  MEMORY[0x1F416E6E0](v4, v7, v5, v6);
}

- (id)startPosition
{
  if ((*((void *)self->super.super.super.super._internal + 9) & 0xFFFFFFFFFFFFLL) == 0
    || ((*(unsigned char *)((*((void *)self->super.super.super.super._internal + 9) & 0xFFFFFFFFFFFFLL) + 0x34) & 7) == 1
      ? (BOOL v2 = (*(unsigned char *)((*((void *)self->super.super.super.super._internal + 9) & 0xFFFFFFFFFFFFLL) + 0x35) & 4) == 0)
      : (BOOL v2 = 1),
        v2))
  {
    v17.receiver = self;
    v17.super_class = (Class)DOMHTMLInputElement;
    return [(DOMNode *)&v17 startPosition];
  }
  uint64_t v5 = (WebCore::HTMLTextFormControlElement *)WebCore::RenderTextControl::textFormControlElement((WebCore::RenderTextControl *)(*((void *)self->super.super.super.super._internal + 9) & 0xFFFFFFFFFFFFLL));
  WebCore::HTMLTextFormControlElement::visiblePositionForIndex(v5);
  uint64_t v6 = v13;
  if (v13) {
    *((_DWORD *)v13 + 7) += 2;
  }
  char v9 = v6;
  int v10 = v14;
  char v11 = v15;
  char v12 = v16;
  id v3 = +[WebVisiblePosition _wrapVisiblePosition:&v9];
  uint64_t v7 = v9;
  char v9 = 0;
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
  uint64_t v8 = v13;
  uint64_t v13 = 0;
  if (!v8) {
    return v3;
  }
  if (*((_DWORD *)v8 + 7) != 2)
  {
    *((_DWORD *)v8 + 7) -= 2;
    return v3;
  }
  if ((*((_WORD *)v8 + 17) & 0x400) != 0) {
    return v3;
  }
  WebCore::Node::removedLastRef(v8);
  return v3;
}

- (id)endPosition
{
  BOOL v2 = (WebCore::RenderTextControl *)(*((void *)self->super.super.super.super._internal + 9) & 0xFFFFFFFFFFFFLL);
  if (!v2
    || ((*(unsigned char *)((*((void *)self->super.super.super.super._internal + 9) & 0xFFFFFFFFFFFFLL) + 0x34) & 7) == 1
      ? (BOOL v3 = (*(unsigned char *)((*((void *)self->super.super.super.super._internal + 9) & 0xFFFFFFFFFFFFLL) + 0x35) & 4) == 0)
      : (BOOL v3 = 1),
        v3))
  {
    v22.receiver = self;
    v22.super_class = (Class)DOMHTMLInputElement;
    return [(DOMNode *)&v22 endPosition];
  }
  uint64_t v6 = (WebCore::HTMLTextFormControlElement *)WebCore::RenderTextControl::textFormControlElement((WebCore::RenderTextControl *)(*((void *)self->super.super.super.super._internal + 9) & 0xFFFFFFFFFFFFLL));
  uint64_t v7 = *(void *)WebCore::RenderTextControl::textFormControlElement(v2);
  (*(void (**)(WTF::StringImpl **__return_ptr))(v7 + 1400))(&v17);
  WebCore::HTMLTextFormControlElement::visiblePositionForIndex(v6);
  char v9 = v17;
  objc_super v17 = 0;
  if (v9)
  {
    if (*(_DWORD *)v9 == 2)
    {
      WTF::StringImpl::destroy(v9, v8);
      int v10 = v18;
      if (!v18) {
        goto LABEL_14;
      }
      goto LABEL_13;
    }
    *(_DWORD *)v9 -= 2;
  }
  int v10 = v18;
  if (v18) {
LABEL_13:
  }
    *((_DWORD *)v10 + 7) += 2;
LABEL_14:
  uint64_t v13 = v10;
  int v14 = v19;
  char v15 = v20;
  char v16 = v21;
  id v4 = +[WebVisiblePosition _wrapVisiblePosition:&v13];
  char v11 = v13;
  uint64_t v13 = 0;
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
  char v12 = v18;
  uint64_t v18 = 0;
  if (!v12) {
    return v4;
  }
  if (*((_DWORD *)v12 + 7) != 2)
  {
    *((_DWORD *)v12 + 7) -= 2;
    return v4;
  }
  if ((*((_WORD *)v12 + 17) & 0x400) != 0) {
    return v4;
  }
  WebCore::Node::removedLastRef(v12);
  return v4;
}

@end