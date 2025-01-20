@interface DOMHTMLCanvasElement
- (id)toDataURL:(id)a3;
- (int)height;
- (int)width;
- (void)setHeight:(int)a3;
- (void)setWidth:(int)a3;
@end

@implementation DOMHTMLCanvasElement

- (int)width
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LODWORD(self) = *((_DWORD *)self->super.super.super.super._internal + 32);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return (int)self;
}

- (void)setWidth:(int)a3
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WebCore::HTMLCanvasElement::setWidth(self->super.super.super.super._internal);
  if (!v7 || !v6) {
    goto LABEL_5;
  }
  if (*(_DWORD *)v6 != 2)
  {
    *(_DWORD *)v6 -= 2;
LABEL_5:
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8, v4);
    return;
  }
  WTF::StringImpl::destroy(v6, v4);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8, v5);
}

- (int)height
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LODWORD(self) = *((_DWORD *)self->super.super.super.super._internal + 33);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return (int)self;
}

- (void)setHeight:(int)a3
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WebCore::HTMLCanvasElement::setHeight(self->super.super.super.super._internal);
  if (!v7 || !v6) {
    goto LABEL_5;
  }
  if (*(_DWORD *)v6 != 2)
  {
    *(_DWORD *)v6 -= 2;
LABEL_5:
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8, v4);
    return;
  }
  WTF::StringImpl::destroy(v6, v4);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8, v5);
}

- (id)toDataURL:(id)a3
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v19);
  internal = self->super.super.super.super._internal;
  MEMORY[0x1E4E442D0](v15, a3);
  WebCore::HTMLCanvasElement::toDataURL((uint64_t *)&v16, internal, (const WTF::String *)v15);
  char v7 = v15[0];
  v15[0] = 0;
  if (!v7)
  {
LABEL_4:
    unsigned int v8 = v18;
    if (!v18) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
  if (*(_DWORD *)v7 != 2)
  {
    *(_DWORD *)v7 -= 2;
    goto LABEL_4;
  }
  WTF::StringImpl::destroy(v7, v6);
  unsigned int v8 = v18;
  if (!v18)
  {
LABEL_5:
    v9 = v16;
    v16 = 0;
    if (v9)
    {
      v11 = (__CFString *)WTF::StringImpl::operator NSString *();
      if (*(_DWORD *)v9 == 2)
      {
        WTF::StringImpl::destroy(v9, v10);
        uint64_t v12 = v18;
        if (v18 == -1) {
          goto LABEL_11;
        }
      }
      else
      {
        *(_DWORD *)v9 -= 2;
        uint64_t v12 = v18;
        if (v18 == -1) {
          goto LABEL_11;
        }
      }
    }
    else
    {
      v11 = &stru_1F3C7DA90;
      uint64_t v12 = v18;
    }
    ((void (*)(WTF::StringImpl **, WTF::StringImpl **))off_1F3C7A0F8[v12])(v15, &v16);
LABEL_11:
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v19, v10);
    return v11;
  }
LABEL_13:
  if (v8 == 1)
  {
    LOBYTE(v15[0]) = (_BYTE)v16;
    v14 = v17;
    v17 = 0;
    v15[1] = v14;
    raiseDOMErrorException();
  }
  id result = (id)std::__throw_bad_variant_access[abi:sn180100]();
  __break(1u);
  return result;
}

@end