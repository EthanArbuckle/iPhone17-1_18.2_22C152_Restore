@interface DOMHTMLCollection
- (DOMNode)item:(unsigned int)index;
- (DOMNode)namedItem:(NSString *)name;
- (DOMNodeList)tags:(NSString *)name;
- (unsigned)length;
- (void)dealloc;
@end

@implementation DOMHTMLCollection

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
    v5.super_class = (Class)DOMHTMLCollection;
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

- (DOMNode)namedItem:(NSString *)name
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v13);
  internal = self->super._internal;
  WTF::AtomStringImpl::add((uint64_t *)&v14, (WTF::AtomStringImpl *)name, v6);
  v12 = v14;
  v7 = (WebCore::Node *)(*(uint64_t (**)(DOMObjectInternal *, WTF::StringImpl **))(*(void *)internal + 64))(internal, &v12);
  v9 = (DOMNode *)kit(v7);
  v10 = v12;
  v12 = 0;
  if (v10)
  {
    if (*(_DWORD *)v10 == 2) {
      WTF::StringImpl::destroy(v10, v8);
    }
    else {
      *(_DWORD *)v10 -= 2;
    }
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v13, v8);
  return v9;
}

- (DOMNodeList)tags:(NSString *)name
{
  if (!name) {
    return 0;
  }
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v11);
  WTF::AtomStringImpl::add((uint64_t *)&v12, (WTF::AtomStringImpl *)name, v4);
  v9 = v12;
  WebCore::ContainerNode::getElementsByTagName();
  CFStringRef v6 = (DOMNodeList *)kit(v10);
  if (!v10)
  {
LABEL_5:
    v7 = v9;
    if (v9) {
      goto LABEL_6;
    }
    goto LABEL_10;
  }
  if (*((_DWORD *)v10 + 4) != 1)
  {
    --*((_DWORD *)v10 + 4);
    goto LABEL_5;
  }
  (*(void (**)())(*(void *)v10 + 8))();
  v7 = v9;
  if (v9)
  {
LABEL_6:
    if (*(_DWORD *)v7 == 2) {
      WTF::StringImpl::destroy(v7, v5);
    }
    else {
      *(_DWORD *)v7 -= 2;
    }
  }
LABEL_10:
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v11, v5);
  return v6;
}

@end