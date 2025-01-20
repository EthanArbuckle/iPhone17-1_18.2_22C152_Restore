@interface DOMCSSValue
- (NSString)cssText;
- (unsigned)cssValueType;
- (void)dealloc;
- (void)setCssText:(NSString *)cssText;
@end

@implementation DOMCSSValue

- (void)dealloc
{
  v3 = (objc_class *)objc_opt_class();
  if ((WebCoreObjCScheduleDeallocateOnMainThread(v3, (objc_object *)self) & 1) == 0)
  {
    internal = self->super._internal;
    if (internal)
    {
      if (*(_DWORD *)internal == 1) {
        WebCore::DeprecatedCSSOMValue::operator delete();
      }
      else {
        --*(_DWORD *)internal;
      }
    }
    v5.receiver = self;
    v5.super_class = (Class)DOMCSSValue;
    [(DOMObject *)&v5 dealloc];
  }
}

- (NSString)cssText
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WebCore::DeprecatedCSSOMValue::cssText((uint64_t *)&v7, self->super._internal);
  if (v7)
  {
    v4 = (__CFString *)WTF::StringImpl::operator NSString *();
    objc_super v5 = v7;
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
    v4 = &stru_1F3C7DA90;
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8, v3);
  return &v4->isa;
}

- (void)setCssText:(NSString *)cssText
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  MEMORY[0x1E4E442D0](&v7, cssText);
  objc_super v5 = v7;
  v7 = 0;
  if (!v5) {
    goto LABEL_4;
  }
  if (*(_DWORD *)v5 != 2)
  {
    *(_DWORD *)v5 -= 2;
LABEL_4:
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8, v4);
    return;
  }
  WTF::StringImpl::destroy(v5, v4);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8, v6);
}

- (unsigned)cssValueType
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LOWORD(self) = WebCore::DeprecatedCSSOMValue::cssValueType(self->super._internal);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return (unsigned __int16)self;
}

@end