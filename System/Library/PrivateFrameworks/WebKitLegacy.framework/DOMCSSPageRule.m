@interface DOMCSSPageRule
- (DOMCSSStyleDeclaration)style;
- (NSString)selectorText;
- (void)setSelectorText:(NSString *)selectorText;
@end

@implementation DOMCSSPageRule

- (NSString)selectorText
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WebCore::CSSPageRule::selectorText((uint64_t *)&v7, self->super.super._internal);
  if (v7)
  {
    v4 = (__CFString *)WTF::StringImpl::operator NSString *();
    v5 = v7;
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

- (void)setSelectorText:(NSString *)selectorText
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10);
  internal = self->super.super._internal;
  MEMORY[0x1E4E442D0](&v9, selectorText);
  WebCore::CSSPageRule::setSelectorText(internal, (const WTF::String *)&v9);
  v7 = v9;
  v9 = 0;
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

- (DOMCSSStyleDeclaration)style
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  v3 = (DOMObjectInternal *)WebCore::CSSPageRule::style(self->super.super._internal);
  v4 = (DOMCSSStyleDeclaration *)kit(v3);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7, v5);
  return v4;
}

@end