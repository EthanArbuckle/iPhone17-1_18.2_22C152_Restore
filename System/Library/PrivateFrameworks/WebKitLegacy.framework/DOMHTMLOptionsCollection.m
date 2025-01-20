@interface DOMHTMLOptionsCollection
- (DOMNode)item:(unsigned int)index;
- (DOMNode)namedItem:(NSString *)name;
- (int)selectedIndex;
- (unsigned)length;
- (void)add:(DOMHTMLOptionElement *)option index:(unsigned int)index;
- (void)dealloc;
- (void)remove:(unsigned int)index;
- (void)setLength:(unsigned int)length;
- (void)setSelectedIndex:(int)selectedIndex;
@end

@implementation DOMHTMLOptionsCollection

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
    v5.super_class = (Class)DOMHTMLOptionsCollection;
    [(DOMObject *)&v5 dealloc];
  }
}

- (int)selectedIndex
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LODWORD(self) = WebCore::HTMLOptionsCollection::selectedIndex(self->super._internal);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return (int)self;
}

- (void)setSelectedIndex:(int)selectedIndex
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  WebCore::HTMLOptionsCollection::setSelectedIndex(self->super._internal);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v4);
}

- (unsigned)length
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LODWORD(self) = WebCore::HTMLOptionsCollection::length(self->super._internal);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return self;
}

- (void)setLength:(unsigned int)length
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WebCore::HTMLOptionsCollection::setLength(self->super._internal);
  if (v7)
  {
    v8[80] = v5;
    uint64_t v9 = v6;
    raiseDOMErrorException();
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8, v4);
}

- (DOMNode)namedItem:(NSString *)name
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10);
  WTF::AtomStringImpl::add((uint64_t *)&v11, (WTF::AtomStringImpl *)name, v4);
  uint64_t v9 = v11;
  char v5 = (WebCore::Node *)WebCore::HTMLOptionsCollection::namedItem();
  char v7 = (DOMNode *)kit(v5);
  if (v9)
  {
    if (*(_DWORD *)v9 == 2) {
      WTF::StringImpl::destroy(v9, v6);
    }
    else {
      *(_DWORD *)v9 -= 2;
    }
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10, v6);
  return v7;
}

- (void)add:(DOMHTMLOptionElement *)option index:(unsigned int)index
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v17);
  if (!option) {
    raiseTypeErrorException();
  }
  internal = option->super.super.super.super._internal;
  if (internal) {
    *((_DWORD *)internal + 7) += 2;
  }
  v12 = internal;
  int v13 = 0;
  unsigned int v9 = index;
  int v10 = 1;
  char v11 = 1;
  WebCore::HTMLOptionsCollection::add();
  if (v16)
  {
    v18[0] = v14;
    uint64_t v8 = v15;
    uint64_t v15 = 0;
    uint64_t v19 = v8;
    raiseDOMErrorException();
  }
  ((void (*)(unsigned char *, unsigned int *))off_1F3C7A128[v10])(v18, &v9);
  if (v13 != -1) {
    ((void (*)(unsigned int *, DOMObjectInternal **))off_1F3C7A138[v13])(&v9, &v12);
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v17, v7);
}

- (void)remove:(unsigned int)index
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  WebCore::HTMLOptionsCollection::remove(self->super._internal);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v4);
}

- (DOMNode)item:(unsigned int)index
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  CFStringRef v4 = (WebCore::Node *)WebCore::HTMLOptionsCollection::item(self->super._internal);
  char v5 = (DOMNode *)kit(v4);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8, v6);
  return v5;
}

@end