@interface DOMTokenList
- (BOOL)contains:(id)a3;
- (BOOL)toggle:(id)a3 force:(BOOL)a4;
- (NSString)value;
- (id)item:(unsigned int)a3;
- (unsigned)length;
- (void)dealloc;
- (void)setValue:(id)a3;
@end

@implementation DOMTokenList

- (void)dealloc
{
  v3 = (objc_class *)objc_opt_class();
  if ((WebCoreObjCScheduleDeallocateOnMainThread(v3, (objc_object *)self) & 1) == 0)
  {
    internal = self->super._internal;
    if (internal)
    {
      uint64_t v5 = *(void *)internal;
      int v6 = *(_DWORD *)(*(void *)internal + 28) - 2;
      if (v6)
      {
        *(_DWORD *)(v5 + 28) = v6;
      }
      else if ((*(_WORD *)(v5 + 34) & 0x400) == 0)
      {
        WebCore::Node::removedLastRef((WebCore::Node *)v5);
      }
    }
    v7.receiver = self;
    v7.super_class = (Class)DOMTokenList;
    [(DOMObject *)&v7 dealloc];
  }
}

- (unsigned)length
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LODWORD(self) = *(_DWORD *)(WebCore::DOMTokenList::tokens(self->super._internal) + 12);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return self;
}

- (NSString)value
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6);
  if (*(void *)WebCore::DOMTokenList::value(self->super._internal)) {
    v4 = (__CFString *)WTF::StringImpl::operator NSString *();
  }
  else {
    v4 = &stru_1F3C7DA90;
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6, v3);
  return &v4->isa;
}

- (void)setValue:(id)a3
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WTF::AtomStringImpl::add((uint64_t *)&v9, (WTF::AtomStringImpl *)a3, v4);
  objc_super v7 = v9;
  WebCore::DOMTokenList::setValue();
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

- (id)item:(unsigned int)a3
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10);
  uint64_t v5 = WebCore::DOMTokenList::tokens(self->super._internal);
  if (*(_DWORD *)(v5 + 12) <= a3) {
    objc_super v7 = (void *)MEMORY[0x1E4F30968];
  }
  else {
    objc_super v7 = (void *)(*(void *)v5 + 8 * a3);
  }
  if (*v7) {
    v8 = (__CFString *)WTF::StringImpl::operator NSString *();
  }
  else {
    v8 = &stru_1F3C7DA90;
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10, v6);
  return v8;
}

- (BOOL)contains:(id)a3
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9);
  WTF::AtomStringImpl::add((uint64_t *)&v10, (WTF::AtomStringImpl *)a3, v4);
  v8 = v10;
  char v6 = WebCore::DOMTokenList::contains();
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
  return v6;
}

- (BOOL)toggle:(id)a3 force:(BOOL)a4
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v12);
  WTF::AtomStringImpl::add(v13, (WTF::AtomStringImpl *)a3, v5);
  v8 = (WTF::StringImpl *)v13[0];
  WebCore::DOMTokenList::toggle();
  if (v11)
  {
    if (v11 == 1)
    {
      LOBYTE(v13[0]) = v9;
      v13[1] = v10;
      raiseDOMErrorException();
    }
    BOOL result = std::__throw_bad_variant_access[abi:sn180100]();
    __break(1u);
  }
  else
  {
    if (v8)
    {
      if (*(_DWORD *)v8 == 2) {
        WTF::StringImpl::destroy(v8, v6);
      }
      else {
        *(_DWORD *)v8 -= 2;
      }
    }
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v12, v6);
    return v9 != 0;
  }
  return result;
}

@end