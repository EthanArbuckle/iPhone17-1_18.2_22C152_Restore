@interface DOMRect
- (DOMCSSPrimitiveValue)bottom;
- (DOMCSSPrimitiveValue)left;
- (DOMCSSPrimitiveValue)right;
- (DOMCSSPrimitiveValue)top;
- (void)dealloc;
@end

@implementation DOMRect

- (void)dealloc
{
  v3 = (objc_class *)objc_opt_class();
  if ((WebCoreObjCScheduleDeallocateOnMainThread(v3, (objc_object *)self) & 1) == 0)
  {
    internal = self->super._internal;
    if (internal) {
      WTF::RefCounted<WebCore::DeprecatedCSSOMRGBColor>::deref(internal, v4);
    }
    v6.receiver = self;
    v6.super_class = (Class)DOMRect;
    [(DOMObject *)&v6 dealloc];
  }
}

- (DOMCSSPrimitiveValue)top
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6);
  v3 = (DOMCSSPrimitiveValue *)kit(*((WebCore::DeprecatedCSSOMValue **)self->super._internal + 1));
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6, v4);
  return v3;
}

- (DOMCSSPrimitiveValue)right
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6);
  v3 = (DOMCSSPrimitiveValue *)kit(*((WebCore::DeprecatedCSSOMValue **)self->super._internal + 2));
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6, v4);
  return v3;
}

- (DOMCSSPrimitiveValue)bottom
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6);
  v3 = (DOMCSSPrimitiveValue *)kit(*((WebCore::DeprecatedCSSOMValue **)self->super._internal + 3));
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6, v4);
  return v3;
}

- (DOMCSSPrimitiveValue)left
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6);
  v3 = (DOMCSSPrimitiveValue *)kit(*((WebCore::DeprecatedCSSOMValue **)self->super._internal + 4));
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6, v4);
  return v3;
}

@end