@interface DOMBlob
- (id)type;
- (unint64_t)size;
- (void)dealloc;
@end

@implementation DOMBlob

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
    v5.super_class = (Class)DOMBlob;
    [(DOMObject *)&v5 dealloc];
  }
}

- (unint64_t)size
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6);
  unint64_t v3 = WebCore::Blob::size(self->super._internal);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6, v4);
  return v3;
}

- (id)type
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6);
  if (*((void *)self->super._internal + 6)) {
    v4 = (__CFString *)WTF::StringImpl::operator NSString *();
  }
  else {
    v4 = &stru_1F3C7DA90;
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6, v3);
  return v4;
}

@end