@interface DOMRGBColor
- (DOMCSSPrimitiveValue)alpha;
- (DOMCSSPrimitiveValue)blue;
- (DOMCSSPrimitiveValue)green;
- (DOMCSSPrimitiveValue)red;
- (NSColor)color;
- (void)dealloc;
@end

@implementation DOMRGBColor

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
    v6.super_class = (Class)DOMRGBColor;
    [(DOMObject *)&v6 dealloc];
  }
}

- (DOMCSSPrimitiveValue)red
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6);
  v3 = (DOMCSSPrimitiveValue *)kit(*((WebCore::DeprecatedCSSOMValue **)self->super._internal + 1));
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6, v4);
  return v3;
}

- (DOMCSSPrimitiveValue)green
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6);
  v3 = (DOMCSSPrimitiveValue *)kit(*((WebCore::DeprecatedCSSOMValue **)self->super._internal + 2));
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6, v4);
  return v3;
}

- (DOMCSSPrimitiveValue)blue
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6);
  v3 = (DOMCSSPrimitiveValue *)kit(*((WebCore::DeprecatedCSSOMValue **)self->super._internal + 3));
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6, v4);
  return v3;
}

- (DOMCSSPrimitiveValue)alpha
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6);
  v3 = (DOMCSSPrimitiveValue *)kit(*((WebCore::DeprecatedCSSOMValue **)self->super._internal + 4));
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6, v4);
  return v3;
}

- (NSColor)color
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10);
  uint64_t v8 = bswap32(*((_DWORD *)self->super._internal + 1)) | 0x1104000000000000;
  WebCore::cachedCGColor();
  if (arg)
  {
    CFAutorelease(arg);
    uint64_t v4 = v8;
    v5 = arg;
    if ((v8 & 0x8000000000000) == 0) {
      goto LABEL_7;
    }
  }
  else
  {
    v5 = 0;
    uint64_t v4 = v8;
    if ((v8 & 0x8000000000000) == 0) {
      goto LABEL_7;
    }
  }
  objc_super v6 = (unsigned int *)(v4 & 0xFFFFFFFFFFFFLL);
  if (atomic_fetch_add((atomic_uint *volatile)(v4 & 0xFFFFFFFFFFFFLL), 0xFFFFFFFF) == 1)
  {
    atomic_store(1u, v6);
    WTF::fastFree((WTF *)v6, v3);
  }
LABEL_7:
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10, v3);
  return v5;
}

@end