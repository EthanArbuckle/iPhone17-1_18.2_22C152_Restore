@interface DOMHTMLMetaElement
- (NSString)content;
- (NSString)httpEquiv;
- (NSString)name;
- (NSString)scheme;
- (void)setContent:(NSString *)content;
- (void)setHttpEquiv:(NSString *)httpEquiv;
- (void)setName:(NSString *)name;
- (void)setScheme:(NSString *)scheme;
@end

@implementation DOMHTMLMetaElement

- (NSString)content
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

- (void)setContent:(NSString *)content
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WTF::AtomStringImpl::add((uint64_t *)&v9, (WTF::AtomStringImpl *)content, v4);
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

- (NSString)httpEquiv
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

- (void)setHttpEquiv:(NSString *)httpEquiv
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WTF::AtomStringImpl::add((uint64_t *)&v9, (WTF::AtomStringImpl *)httpEquiv, v4);
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
        v7 = *(uint64_t **)(v4 + 40);
        LODWORD(v8) = *(_DWORD *)(v4 + 52);
        if (!v8)
        {
LABEL_15:
          v7 = 0;
          goto LABEL_16;
        }
      }
      else
      {
        v7 = (uint64_t *)(v4 + 32);
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

- (NSString)scheme
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

- (void)setScheme:(NSString *)scheme
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WTF::AtomStringImpl::add((uint64_t *)&v9, (WTF::AtomStringImpl *)scheme, v4);
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

@end