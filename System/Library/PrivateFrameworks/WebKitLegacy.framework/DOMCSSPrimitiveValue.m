@interface DOMCSSPrimitiveValue
- (DOMCounter)getCounterValue;
- (DOMRGBColor)getRGBColorValue;
- (DOMRect)getRectValue;
- (NSString)getStringValue;
- (float)getFloatValue:(unsigned __int16)unitType;
- (unsigned)primitiveType;
- (void)setFloatValue:(unsigned __int16)unitType floatValue:(float)floatValue;
- (void)setStringValue:(unsigned __int16)stringType stringValue:(NSString *)stringValue;
@end

@implementation DOMCSSPrimitiveValue

- (unsigned)primitiveType
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LOWORD(self) = WebCore::DeprecatedCSSOMPrimitiveValue::primitiveType(self->super.super._internal);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return (unsigned __int16)self;
}

- (void)setFloatValue:(unsigned __int16)unitType floatValue:(float)floatValue
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v4);
  v4[80] = 4;
  uint64_t v5 = 0;
  raiseDOMErrorException();
}

- (float)getFloatValue:(unsigned __int16)unitType
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9);
  WebCore::DeprecatedCSSOMPrimitiveValue::getFloatValue(self->super.super._internal);
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

- (void)setStringValue:(unsigned __int16)stringType stringValue:(NSString *)stringValue
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6);
  MEMORY[0x1E4E442D0](v5, stringValue);
  v6[80] = 4;
  uint64_t v7 = 0;
  raiseDOMErrorException();
}

- (NSString)getStringValue
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v12);
  WebCore::DeprecatedCSSOMPrimitiveValue::getStringValue((uint64_t *)&v9, self->super.super._internal);
  if (!v11)
  {
    v3 = v9;
    v9 = 0;
    if (v3)
    {
      uint64_t v5 = (__CFString *)WTF::StringImpl::operator NSString *();
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
      uint64_t v5 = &stru_1F3C7DA90;
      uint64_t v6 = v11;
    }
    ((void (*)(unsigned char *, WTF::StringImpl **))off_1F3C79F70[v6])(v13, &v9);
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
  float result = (NSString *)std::__throw_bad_variant_access[abi:sn180100]();
  __break(1u);
  return result;
}

- (DOMCounter)getCounterValue
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v11);
  WebCore::DeprecatedCSSOMPrimitiveValue::getCounterValue((uint64_t *)&v8, self->super.super._internal);
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
    float result = (DOMCounter *)std::__throw_bad_variant_access[abi:sn180100]();
    __break(1u);
  }
  else
  {
    v3 = v8;
    uint64_t v8 = 0;
    uint64_t v5 = (DOMCounter *)kit(v3);
    if (v3) {
      WTF::RefCounted<WebCore::DeprecatedCSSOMCounter>::deref((WTF::StringImpl **)v3, v4);
    }
    if (v10 != -1) {
      ((void (*)(unsigned char *, DOMObjectInternal **))off_1F3C79F80[v10])(v12, &v8);
    }
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v11, v4);
    return v5;
  }
  return result;
}

- (DOMRect)getRectValue
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v11);
  WebCore::DeprecatedCSSOMPrimitiveValue::getRectValue((uint64_t *)&v8, self->super.super._internal);
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
    float result = (DOMRect *)std::__throw_bad_variant_access[abi:sn180100]();
    __break(1u);
  }
  else
  {
    v3 = v8;
    uint64_t v8 = 0;
    uint64_t v5 = kit(v3);
    if (v3) {
      WTF::RefCounted<WebCore::DeprecatedCSSOMRGBColor>::deref(v3, v4);
    }
    if (v10 != -1) {
      ((void (*)(unsigned char *, DOMObjectInternal **))off_1F3C79F90[v10])(v12, &v8);
    }
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v11, v4);
    return (DOMRect *)v5;
  }
  return result;
}

- (DOMRGBColor)getRGBColorValue
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v11);
  WebCore::DeprecatedCSSOMPrimitiveValue::getRGBColorValue((uint64_t *)&v8, self->super.super._internal);
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
    float result = (DOMRGBColor *)std::__throw_bad_variant_access[abi:sn180100]();
    __break(1u);
  }
  else
  {
    v3 = v8;
    uint64_t v8 = 0;
    uint64_t v5 = kit(v3);
    if (v3) {
      WTF::RefCounted<WebCore::DeprecatedCSSOMRGBColor>::deref(v3, v4);
    }
    if (v10 != -1) {
      ((void (*)(unsigned char *, DOMObjectInternal **))off_1F3C79FA0[v10])(v12, &v8);
    }
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v11, v4);
    return (DOMRGBColor *)v5;
  }
  return result;
}

@end