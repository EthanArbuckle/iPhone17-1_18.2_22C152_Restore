@interface DOMNodeList
- (DOMNode)item:(unsigned int)index;
- (unsigned)length;
- (void)dealloc;
@end

@implementation DOMNodeList

- (void)dealloc
{
  v3 = (objc_class *)objc_opt_class();
  if ((WebCoreObjCScheduleDeallocateOnMainThread(v3, (objc_object *)self) & 1) == 0)
  {
    internal = self->super._internal;
    if (internal)
    {
      if (*((_DWORD *)internal + 4) == 1) {
        (*(void (**)(DOMObjectInternal *))(*(void *)internal + 8))(internal);
      }
      else {
        --*((_DWORD *)internal + 4);
      }
    }
    v5.receiver = self;
    v5.super_class = (Class)DOMNodeList;
    [(DOMObject *)&v5 dealloc];
  }
}

- (unsigned)length
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LODWORD(self) = (*(uint64_t (**)(DOMObjectInternal *))(*(void *)self->super._internal + 16))(self->super._internal);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return self;
}

- (DOMNode)item:(unsigned int)index
{
  uint64_t v3 = *(void *)&index;
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9);
  objc_super v5 = (WebCore::Node *)(*(uint64_t (**)(DOMObjectInternal *, uint64_t))(*(void *)self->super._internal + 24))(self->super._internal, v3);
  v6 = (DOMNode *)kit(v5);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9, v7);
  return v6;
}

@end