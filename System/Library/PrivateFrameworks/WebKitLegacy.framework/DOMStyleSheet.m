@interface DOMStyleSheet
- (BOOL)disabled;
- (DOMMediaList)media;
- (DOMNode)ownerNode;
- (DOMStyleSheet)parentStyleSheet;
- (NSString)href;
- (NSString)title;
- (NSString)type;
- (void)dealloc;
- (void)setDisabled:(BOOL)disabled;
@end

@implementation DOMStyleSheet

- (void)dealloc
{
  v3 = (objc_class *)objc_opt_class();
  if ((WebCoreObjCScheduleDeallocateOnMainThread(v3, (objc_object *)self) & 1) == 0)
  {
    internal = self->super._internal;
    if (internal)
    {
      if (*((_DWORD *)internal + 2) == 1) {
        (*(void (**)(DOMObjectInternal *))(*(void *)internal + 8))(internal);
      }
      else {
        --*((_DWORD *)internal + 2);
      }
    }
    v5.receiver = self;
    v5.super_class = (Class)DOMStyleSheet;
    [(DOMObject *)&v5 dealloc];
  }
}

- (NSString)type
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  (*(void (**)(WTF::StringImpl **__return_ptr))(*(void *)self->super._internal + 72))(&v7);
  if (v7)
  {
    v4 = (__CFString *)WTF::StringImpl::operator NSString *();
    objc_super v5 = v7;
    v7 = 0;
    if (v5)
    {
      if (*(_DWORD *)v5 == 2) {
        WTF::StringImpl::destroy(v5, v3);
      }
      else {
        *(_DWORD *)v5 -= 2;
      }
    }
  }
  else
  {
    v4 = &stru_1F3C7DA90;
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8, v3);
  return &v4->isa;
}

- (BOOL)disabled
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LOBYTE(self) = (*(uint64_t (**)(DOMObjectInternal *))(*(void *)self->super._internal + 16))(self->super._internal);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return (char)self;
}

- (void)setDisabled:(BOOL)disabled
{
  BOOL v3 = disabled;
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6);
  (*(void (**)(DOMObjectInternal *, BOOL))(*(void *)self->super._internal + 24))(self->super._internal, v3);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6, v5);
}

- (DOMNode)ownerNode
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  BOOL v3 = (WebCore::Node *)(*(uint64_t (**)(DOMObjectInternal *))(*(void *)self->super._internal + 32))(self->super._internal);
  v4 = (DOMNode *)kit(v3);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7, v5);
  return v4;
}

- (DOMStyleSheet)parentStyleSheet
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  BOOL v3 = (DOMObjectInternal *)(*(uint64_t (**)(DOMObjectInternal *))(*(void *)self->super._internal + 40))(self->super._internal);
  v4 = (DOMStyleSheet *)kit(v3);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7, v5);
  return v4;
}

- (NSString)href
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  (*(void (**)(WTF::StringImpl **__return_ptr))(*(void *)self->super._internal + 48))(&v7);
  if (v7)
  {
    v4 = (__CFString *)WTF::StringImpl::operator NSString *();
    objc_super v5 = v7;
    v7 = 0;
    if (v5)
    {
      if (*(_DWORD *)v5 == 2) {
        WTF::StringImpl::destroy(v5, v3);
      }
      else {
        *(_DWORD *)v5 -= 2;
      }
    }
  }
  else
  {
    v4 = &stru_1F3C7DA90;
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8, v3);
  return &v4->isa;
}

- (NSString)title
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  (*(void (**)(WTF::StringImpl **__return_ptr))(*(void *)self->super._internal + 56))(&v7);
  if (v7)
  {
    v4 = (__CFString *)WTF::StringImpl::operator NSString *();
    objc_super v5 = v7;
    v7 = 0;
    if (v5)
    {
      if (*(_DWORD *)v5 == 2) {
        WTF::StringImpl::destroy(v5, v3);
      }
      else {
        *(_DWORD *)v5 -= 2;
      }
    }
  }
  else
  {
    v4 = &stru_1F3C7DA90;
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8, v3);
  return &v4->isa;
}

- (DOMMediaList)media
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  BOOL v3 = (DOMObjectInternal *)(*(uint64_t (**)(DOMObjectInternal *))(*(void *)self->super._internal + 64))(self->super._internal);
  v4 = (DOMMediaList *)kit(v3);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7, v5);
  return v4;
}

@end