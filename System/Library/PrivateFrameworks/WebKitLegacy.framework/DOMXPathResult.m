@interface DOMXPathResult
- (BOOL)BOOLeanValue;
- (BOOL)invalidIteratorState;
- (DOMNode)iterateNext;
- (DOMNode)singleNodeValue;
- (DOMNode)snapshotItem:(unsigned int)index;
- (NSString)stringValue;
- (double)numberValue;
- (unsigned)resultType;
- (unsigned)snapshotLength;
- (void)dealloc;
@end

@implementation DOMXPathResult

- (void)dealloc
{
  v3 = (objc_class *)objc_opt_class();
  if ((WebCoreObjCScheduleDeallocateOnMainThread(v3, (objc_object *)self) & 1) == 0)
  {
    internal = self->super._internal;
    if (internal)
    {
      if (*(_DWORD *)internal == 1)
      {
        v5 = (WTF *)MEMORY[0x1E4E44B30]();
        WTF::fastFree(v5, v6);
      }
      else
      {
        --*(_DWORD *)internal;
      }
    }
    v7.receiver = self;
    v7.super_class = (Class)DOMXPathResult;
    [(DOMObject *)&v7 dealloc];
  }
}

- (unsigned)resultType
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LOWORD(self) = WebCore::XPathResult::resultType(self->super._internal);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return (unsigned __int16)self;
}

- (double)numberValue
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10);
  WebCore::XPathResult::numberValue((uint64_t *)&v7, self->super._internal);
  if (v9)
  {
    if (v9 == 1)
    {
      v10[80] = LOBYTE(v7);
      uint64_t v6 = v8;
      uint64_t v8 = 0;
      uint64_t v11 = v6;
      raiseDOMErrorException();
    }
    std::__throw_bad_variant_access[abi:sn180100]();
    __break(1u);
  }
  else
  {
    double v4 = v7;
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10, v3);
    return v4;
  }
  return result;
}

- (NSString)stringValue
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v12);
  WebCore::XPathResult::stringValue((uint64_t *)&v9, self->super._internal);
  if (!v11)
  {
    v3 = v9;
    int v9 = 0;
    if (v3)
    {
      v5 = (__CFString *)WTF::StringImpl::operator NSString *();
      if (*(_DWORD *)v3 == 2)
      {
        WTF::StringImpl::destroy(v3, v4);
        uint64_t v6 = v11;
        if (v11 == -1) {
          goto LABEL_8;
        }
      }
      else
      {
        *(_DWORD *)v3 -= 2;
        uint64_t v6 = v11;
        if (v11 == -1) {
          goto LABEL_8;
        }
      }
    }
    else
    {
      v5 = &stru_1F3C7DA90;
      uint64_t v6 = v11;
    }
    ((void (*)(unsigned char *, WTF::StringImpl **))off_1F3C7A2C8[v6])(v13, &v9);
LABEL_8:
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v12, v4);
    return &v5->isa;
  }
  if (v11 == 1)
  {
    v13[0] = (_BYTE)v9;
    uint64_t v8 = v10;
    uint64_t v10 = 0;
    uint64_t v14 = v8;
    raiseDOMErrorException();
  }
  double result = (NSString *)std::__throw_bad_variant_access[abi:sn180100]();
  __break(1u);
  return result;
}

- (BOOL)BOOLeanValue
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10);
  WebCore::XPathResult::BOOLeanValue(&v7, self->super._internal);
  if (v9)
  {
    if (v9 == 1)
    {
      v10[80] = v7;
      uint64_t v6 = v8;
      uint64_t v8 = 0;
      uint64_t v11 = v6;
      raiseDOMErrorException();
    }
    BOOL result = std::__throw_bad_variant_access[abi:sn180100]();
    __break(1u);
  }
  else
  {
    char v4 = v7;
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10, v3);
    return v4;
  }
  return result;
}

- (DOMNode)singleNodeValue
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10);
  WebCore::XPathResult::singleNodeValue((uint64_t *)&v7, self->super._internal);
  if (v9)
  {
    if (v9 == 1)
    {
      v11[0] = (_BYTE)v7;
      uint64_t v6 = v8;
      uint64_t v8 = 0;
      uint64_t v12 = v6;
      raiseDOMErrorException();
    }
    BOOL result = (DOMNode *)std::__throw_bad_variant_access[abi:sn180100]();
    __break(1u);
  }
  else
  {
    char v4 = (DOMNode *)kit(v7);
    if (v9 != -1) {
      ((void (*)(unsigned char *, WebCore::Node **))off_1F3C7A2E8[v9])(v11, &v7);
    }
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10, v3);
    return v4;
  }
  return result;
}

- (BOOL)invalidIteratorState
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LOBYTE(self) = WebCore::XPathResult::invalidIteratorState(self->super._internal);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return (char)self;
}

- (unsigned)snapshotLength
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10);
  WebCore::XPathResult::snapshotLength(&v7, self->super._internal);
  if (v9)
  {
    if (v9 == 1)
    {
      unsigned char v10[80] = v7;
      uint64_t v6 = v8;
      uint64_t v8 = 0;
      uint64_t v11 = v6;
      raiseDOMErrorException();
    }
    unsigned int result = std::__throw_bad_variant_access[abi:sn180100]();
    __break(1u);
  }
  else
  {
    unsigned int v4 = v7;
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10, v3);
    return v4;
  }
  return result;
}

- (DOMNode)iterateNext
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10);
  WebCore::XPathResult::iterateNext((uint64_t *)&v7, self->super._internal);
  if (v9)
  {
    if (v9 == 1)
    {
      v11[0] = (_BYTE)v7;
      uint64_t v6 = v8;
      uint64_t v8 = 0;
      uint64_t v12 = v6;
      raiseDOMErrorException();
    }
    unsigned int result = (DOMNode *)std::__throw_bad_variant_access[abi:sn180100]();
    __break(1u);
  }
  else
  {
    unsigned int v4 = (DOMNode *)kit(v7);
    if (v9 != -1) {
      ((void (*)(unsigned char *, WebCore::Node **))off_1F3C7A2E8[v9])(v11, &v7);
    }
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10, v3);
    return v4;
  }
  return result;
}

- (DOMNode)snapshotItem:(unsigned int)index
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v11);
  WebCore::XPathResult::snapshotItem(self->super._internal);
  if (v10)
  {
    if (v10 == 1)
    {
      v12[0] = (_BYTE)v8;
      uint64_t v7 = v9;
      uint64_t v9 = 0;
      uint64_t v13 = v7;
      raiseDOMErrorException();
    }
    unsigned int result = (DOMNode *)std::__throw_bad_variant_access[abi:sn180100]();
    __break(1u);
  }
  else
  {
    unsigned int v4 = (DOMNode *)kit(v8);
    ((void (*)(unsigned char *, WebCore::Node **))off_1F3C7A2E8[v10])(v12, &v8);
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v11, v5);
    return v4;
  }
  return result;
}

@end