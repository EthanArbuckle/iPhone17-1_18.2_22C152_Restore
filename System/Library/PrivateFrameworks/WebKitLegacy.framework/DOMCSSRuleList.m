@interface DOMCSSRuleList
- (DOMCSSRule)item:(unsigned int)index;
- (unsigned)length;
- (void)dealloc;
@end

@implementation DOMCSSRuleList

- (void)dealloc
{
  v3 = (objc_class *)objc_opt_class();
  if ((WebCoreObjCScheduleDeallocateOnMainThread(v3, (objc_object *)self) & 1) == 0)
  {
    internal = self->super._internal;
    if (internal) {
      (*(void (**)(DOMObjectInternal *))(*(void *)internal + 24))(internal);
    }
    v5.receiver = self;
    v5.super_class = (Class)DOMCSSRuleList;
    [(DOMObject *)&v5 dealloc];
  }
}

- (unsigned)length
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LODWORD(self) = (*(uint64_t (**)(DOMObjectInternal *))(*(void *)self->super._internal + 32))(self->super._internal);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return self;
}

- (DOMCSSRule)item:(unsigned int)index
{
  uint64_t v3 = *(void *)&index;
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9);
  objc_super v5 = (WebCore::CSSRule *)(*(uint64_t (**)(DOMObjectInternal *, uint64_t))(*(void *)self->super._internal
                                                                                   + 40))(self->super._internal, v3);
  v6 = (DOMCSSRule *)kit(v5);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9, v7);
  return v6;
}

@end