@interface DOMTimeRanges
- (double)end:(unsigned int)a3;
- (double)start:(unsigned int)a3;
- (unsigned)length;
- (void)dealloc;
@end

@implementation DOMTimeRanges

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
        v6 = (WTF *)*((void *)internal + 1);
        if (v6)
        {
          *((void *)internal + 1) = 0;
          *((_DWORD *)internal + 4) = 0;
          WTF::fastFree(v6, v4);
        }
        WTF::fastFree(internal, v4);
      }
      else
      {
        --*(_DWORD *)internal;
      }
    }
    v7.receiver = self;
    v7.super_class = (Class)DOMTimeRanges;
    [(DOMObject *)&v7 dealloc];
  }
}

- (unsigned)length
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LODWORD(self) = WebCore::TimeRanges::length(self->super._internal);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return self;
}

- (double)start:(unsigned int)a3
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9);
  WebCore::TimeRanges::start(self->super._internal);
  if (v8)
  {
    if (v8 == 1)
    {
      v9[80] = LOBYTE(v6);
      uint64_t v10 = v7;
      raiseDOMErrorException();
    }
    std::__throw_bad_variant_access[abi:sn180100]();
    __break(1u);
  }
  else
  {
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9, v4);
    return v6;
  }
  return result;
}

- (double)end:(unsigned int)a3
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9);
  WebCore::TimeRanges::end(self->super._internal);
  if (v8)
  {
    if (v8 == 1)
    {
      v9[80] = LOBYTE(v6);
      uint64_t v10 = v7;
      raiseDOMErrorException();
    }
    std::__throw_bad_variant_access[abi:sn180100]();
    __break(1u);
  }
  else
  {
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9, v4);
    return v6;
  }
  return result;
}

@end