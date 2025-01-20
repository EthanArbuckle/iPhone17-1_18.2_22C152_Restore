@interface DOMCSSValueList
- (DOMCSSValue)item:(unsigned int)index;
- (unsigned)length;
@end

@implementation DOMCSSValueList

- (unsigned)length
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LODWORD(self) = *((_DWORD *)self->super.super._internal + 11);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return self;
}

- (DOMCSSValue)item:(unsigned int)index
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10);
  internal = self->super.super._internal;
  if (*((_DWORD *)internal + 11) <= index) {
    v6 = 0;
  }
  else {
    v6 = *(WebCore::DeprecatedCSSOMValue **)(*((void *)internal + 4) + 8 * index);
  }
  v7 = (DOMCSSValue *)kit(v6);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10, v8);
  return v7;
}

@end