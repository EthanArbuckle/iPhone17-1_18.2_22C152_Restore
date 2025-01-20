@interface DOMCSSMediaRule
- (DOMCSSRuleList)cssRules;
- (DOMMediaList)media;
- (unsigned)insertRule:(NSString *)rule index:(unsigned int)index;
- (void)deleteRule:(unsigned int)index;
@end

@implementation DOMCSSMediaRule

- (DOMMediaList)media
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  v3 = (DOMObjectInternal *)WebCore::CSSMediaRule::media(self->super.super._internal);
  v4 = (DOMMediaList *)kit(v3);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7, v5);
  return v4;
}

- (DOMCSSRuleList)cssRules
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  v3 = (DOMObjectInternal *)WebCore::CSSGroupingRule::cssRules(self->super.super._internal);
  v4 = (DOMCSSRuleList *)kit(v3);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7, v5);
  return v4;
}

- (unsigned)insertRule:(NSString *)rule index:(unsigned int)index
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v16);
  internal = self->super.super._internal;
  MEMORY[0x1E4E442D0](&v12, rule);
  WebCore::CSSGroupingRule::insertRule(internal, (const WTF::String *)&v12);
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
  WebCore::CSSGroupingRule::deleteRule(self->super.super._internal);
  if (v7)
  {
    v8[80] = v5;
    uint64_t v9 = v6;
    raiseDOMErrorException();
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8, v4);
}

@end