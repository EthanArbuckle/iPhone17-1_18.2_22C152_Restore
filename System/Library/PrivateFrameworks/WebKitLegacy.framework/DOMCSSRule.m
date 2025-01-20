@interface DOMCSSRule
- (DOMCSSRule)parentRule;
- (DOMCSSStyleSheet)parentStyleSheet;
- (NSString)cssText;
- (unsigned)type;
- (void)dealloc;
- (void)setCssText:(NSString *)cssText;
@end

@implementation DOMCSSRule

- (void)dealloc
{
  v3 = (objc_class *)objc_opt_class();
  if ((WebCoreObjCScheduleDeallocateOnMainThread(v3, (objc_object *)self) & 1) == 0)
  {
    internal = self->super._internal;
    if (internal)
    {
      if (*((_DWORD *)internal + 2) == 1) {
        (*(void (**)(DOMObjectInternal *))(*(void *)internal + 8))(internal);
      }
      else {
        --*((_DWORD *)internal + 2);
      }
    }
    v5.receiver = self;
    v5.super_class = (Class)DOMCSSRule;
    [(DOMObject *)&v5 dealloc];
  }
}

- (unsigned)type
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LOWORD(self) = WebCore::CSSRule::typeForCSSOM(self->super._internal);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return (unsigned __int16)self;
}

- (NSString)cssText
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  (*(void (**)(WTF::StringImpl **__return_ptr))(*(void *)self->super._internal + 32))(&v7);
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
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v14);
  internal = self->super._internal;
  MEMORY[0x1E4E442D0](&v10, cssText);
  WebCore::CSSRule::setCssText(&v11, internal, (const WTF::String *)&v10);
  if (v13)
  {
    v14[80] = v11;
    uint64_t v9 = v12;
    uint64_t v12 = 0;
    uint64_t v15 = v9;
    raiseDOMErrorException();
  }
  v7 = v10;
  v10 = 0;
  if (!v7) {
    goto LABEL_5;
  }
  if (*(_DWORD *)v7 != 2)
  {
    *(_DWORD *)v7 -= 2;
LABEL_5:
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v14, v6);
    return;
  }
  WTF::StringImpl::destroy(v7, v6);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v14, v8);
}

- (DOMCSSStyleSheet)parentStyleSheet
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  internal = self->super._internal;
  do
  {
    char v4 = *((unsigned char *)internal + 12);
    internal = (DOMObjectInternal *)*((void *)internal + 2);
  }
  while ((v4 & 2) != 0 && internal);
  objc_super v5 = (DOMCSSStyleSheet *)kit(internal);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8, v6);
  return v5;
}

- (DOMCSSRule)parentRule
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  internal = self->super._internal;
  if ((*((unsigned char *)internal + 12) & 2) != 0) {
    char v4 = (WebCore::CSSRule *)*((void *)internal + 2);
  }
  else {
    char v4 = 0;
  }
  objc_super v5 = (DOMCSSRule *)kit(v4);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8, v6);
  return v5;
}

@end