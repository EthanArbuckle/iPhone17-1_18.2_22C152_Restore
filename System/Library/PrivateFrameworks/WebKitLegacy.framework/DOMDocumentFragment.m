@interface DOMDocumentFragment
- (id)children;
- (id)firstElementChild;
- (id)getElementById:(id)a3;
- (id)lastElementChild;
- (id)querySelector:(id)a3;
- (id)querySelectorAll:(id)a3;
- (unsigned)childElementCount;
@end

@implementation DOMDocumentFragment

- (id)children
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WebCore::ContainerNode::children((uint64_t *)&v7, self->super.super._internal);
  id v4 = kit(v7);
  v5 = v7;
  v7 = 0;
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

- (id)firstElementChild
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  ElementChild = (WebCore::Node *)WebCore::ContainerNode::firstElementChild(self->super.super._internal);
  id v4 = kit(ElementChild);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7, v5);
  return v4;
}

- (id)lastElementChild
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  ElementChild = (WebCore::Node *)WebCore::ContainerNode::lastElementChild(self->super.super._internal);
  id v4 = kit(ElementChild);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7, v5);
  return v4;
}

- (unsigned)childElementCount
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LODWORD(self) = WebCore::ContainerNode::childElementCount(self->super.super._internal);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return self;
}

- (id)getElementById:(id)a3
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10);
  WTF::AtomStringImpl::add((uint64_t *)&v11, (WTF::AtomStringImpl *)a3, v4);
  v9 = v11;
  ElementById = (WebCore::Node *)WebCore::DocumentFragment::getElementById();
  v7 = kit(ElementById);
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

- (id)querySelector:(id)a3
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v15);
  internal = self->super.super._internal;
  MEMORY[0x1E4E442D0](&v11, a3);
  WebCore::ContainerNode::querySelector((uint64_t *)&v12, internal, (const WTF::String *)&v11);
  if (v14)
  {
    if (v14 == 1)
    {
      v16[0] = (_BYTE)v12;
      uint64_t v10 = v13;
      uint64_t v13 = 0;
      uint64_t v17 = v10;
      raiseDOMErrorException();
    }
    id result = (id)std::__throw_bad_variant_access[abi:sn180100]();
    __break(1u);
  }
  else
  {
    v7 = kit(v12);
    if (v14 != -1) {
      ((void (*)(unsigned char *, WebCore::Node **))off_1F3C7A0B8[v14])(v16, &v12);
    }
    int v14 = -1;
    v8 = v11;
    v11 = 0;
    if (v8)
    {
      if (*(_DWORD *)v8 == 2) {
        WTF::StringImpl::destroy(v8, v6);
      }
      else {
        *(_DWORD *)v8 -= 2;
      }
    }
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v15, v6);
    return v7;
  }
  return result;
}

- (id)querySelectorAll:(id)a3
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v17);
  internal = self->super.super._internal;
  MEMORY[0x1E4E442D0](&v13, a3);
  WebCore::ContainerNode::querySelectorAll((uint64_t *)&v14, internal, (const WTF::String *)&v13);
  if (!v16)
  {
    v6 = v14;
    int v14 = 0;
    v8 = kit(v6);
    if (v6)
    {
      if (*((_DWORD *)v6 + 4) == 1)
      {
        (*(void (**)(DOMObjectInternal *))(*(void *)v6 + 8))(v6);
        uint64_t v9 = v16;
        if (v16 == -1) {
          goto LABEL_7;
        }
        goto LABEL_6;
      }
      --*((_DWORD *)v6 + 4);
    }
    uint64_t v9 = v16;
    if (v16 == -1)
    {
LABEL_7:
      unsigned int v16 = -1;
      uint64_t v10 = v13;
      uint64_t v13 = 0;
      if (v10)
      {
        if (*(_DWORD *)v10 == 2) {
          WTF::StringImpl::destroy(v10, v7);
        }
        else {
          *(_DWORD *)v10 -= 2;
        }
      }
      WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v17, v7);
      return v8;
    }
LABEL_6:
    ((void (*)(char *, DOMObjectInternal **))off_1F3C7A0C8[v9])(v18, &v14);
    goto LABEL_7;
  }
  if (v16 == 1)
  {
    v18[0] = (char)v14;
    uint64_t v12 = v15;
    uint64_t v15 = 0;
    uint64_t v19 = v12;
    raiseDOMErrorException();
  }
  id result = (id)std::__throw_bad_variant_access[abi:sn180100]();
  __break(1u);
  return result;
}

@end