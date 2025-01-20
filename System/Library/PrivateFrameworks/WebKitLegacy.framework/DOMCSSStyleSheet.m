@interface DOMCSSStyleSheet
- (DOMCSSRule)ownerRule;
- (DOMCSSRuleList)cssRules;
- (DOMCSSRuleList)rules;
- (int)addRule:(NSString *)selector style:(NSString *)style index:(unsigned int)index;
- (unsigned)insertRule:(NSString *)rule index:(unsigned int)index;
- (void)deleteRule:(unsigned int)index;
- (void)removeRule:(unsigned int)index;
@end

@implementation DOMCSSStyleSheet

- (DOMCSSRule)ownerRule
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  v3 = (WebCore::CSSRule *)WebCore::CSSStyleSheet::ownerRule(self->super.super._internal);
  v4 = (DOMCSSRule *)kit(v3);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7, v5);
  return v4;
}

- (DOMCSSRuleList)cssRules
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WebCore::CSSStyleSheet::cssRules((uint64_t *)&v7, self->super.super._internal);
  v4 = (DOMCSSRuleList *)kit(v7);
  v5 = v7;
  v7 = 0;
  if (v5) {
    (*(void (**)(DOMObjectInternal *))(*(void *)v5 + 24))(v5);
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8, v3);
  return v4;
}

- (DOMCSSRuleList)rules
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WebCore::CSSStyleSheet::cssRules((uint64_t *)&v7, self->super.super._internal);
  v4 = (DOMCSSRuleList *)kit(v7);
  v5 = v7;
  v7 = 0;
  if (v5) {
    (*(void (**)(DOMObjectInternal *))(*(void *)v5 + 24))(v5);
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8, v3);
  return v4;
}

- (unsigned)insertRule:(NSString *)rule index:(unsigned int)index
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v16);
  internal = self->super.super._internal;
  MEMORY[0x1E4E442D0](&v12, rule);
  WebCore::CSSStyleSheet::insertRule(internal, (const WTF::String *)&v12);
  if (v15)
  {
    if (v15 == 1)
    {
      v16[80] = v13;
      uint64_t v11 = v14;
      uint64_t v14 = 0;
      uint64_t v17 = v11;
      raiseDOMErrorException();
    }
    unsigned int result = std::__throw_bad_variant_access[abi:sn180100]();
    __break(1u);
  }
  else
  {
    unsigned int v8 = v13;
    int v15 = -1;
    v9 = v12;
    v12 = 0;
    if (v9)
    {
      if (*(_DWORD *)v9 == 2) {
        WTF::StringImpl::destroy(v9, v7);
      }
      else {
        *(_DWORD *)v9 -= 2;
      }
    }
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v16, v7);
    return v8;
  }
  return result;
}

- (void)deleteRule:(unsigned int)index
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WebCore::CSSStyleSheet::deleteRule(self->super.super._internal);
  if (v7)
  {
    unsigned char v8[80] = v5;
    uint64_t v9 = v6;
    raiseDOMErrorException();
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8, v4);
}

- (int)addRule:(NSString *)selector style:(NSString *)style index:(unsigned int)index
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v18);
  MEMORY[0x1E4E442D0](&v14, selector);
  MEMORY[0x1E4E442D0](&v13, style);
  WebCore::CSSStyleSheet::addRule();
  if (!v17)
  {
    int v8 = v15;
    int v17 = -1;
    uint64_t v9 = v13;
    unsigned int v13 = 0;
    if (v9)
    {
      if (*(_DWORD *)v9 == 2)
      {
        WTF::StringImpl::destroy(v9, v7);
        v10 = v14;
        uint64_t v14 = 0;
        if (!v10)
        {
LABEL_11:
          WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v18, v7);
          return v8;
        }
LABEL_8:
        if (*(_DWORD *)v10 == 2) {
          WTF::StringImpl::destroy(v10, v7);
        }
        else {
          *(_DWORD *)v10 -= 2;
        }
        goto LABEL_11;
      }
      *(_DWORD *)v9 -= 2;
    }
    v10 = v14;
    uint64_t v14 = 0;
    if (!v10) {
      goto LABEL_11;
    }
    goto LABEL_8;
  }
  if (v17 == 1)
  {
    v18[80] = v15;
    uint64_t v12 = v16;
    uint64_t v16 = 0;
    uint64_t v19 = v12;
    raiseDOMErrorException();
  }
  int result = std::__throw_bad_variant_access[abi:sn180100]();
  __break(1u);
  return result;
}

- (void)removeRule:(unsigned int)index
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WebCore::CSSStyleSheet::deleteRule(self->super.super._internal);
  if (v7)
  {
    unsigned char v8[80] = v5;
    uint64_t v9 = v6;
    raiseDOMErrorException();
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8, v4);
}

@end