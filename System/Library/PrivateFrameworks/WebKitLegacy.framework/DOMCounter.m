@interface DOMCounter
- (NSString)identifier;
- (NSString)listStyle;
- (NSString)separator;
- (void)dealloc;
@end

@implementation DOMCounter

- (void)dealloc
{
  v3 = (objc_class *)objc_opt_class();
  if ((WebCoreObjCScheduleDeallocateOnMainThread(v3, (objc_object *)self) & 1) == 0)
  {
    internal = (WTF::StringImpl **)self->super._internal;
    if (internal) {
      WTF::RefCounted<WebCore::DeprecatedCSSOMCounter>::deref(internal, v4);
    }
    v6.receiver = self;
    v6.super_class = (Class)DOMCounter;
    [(DOMObject *)&v6 dealloc];
  }
}

- (NSString)identifier
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  v4 = (WTF::StringImpl *)*((void *)self->super._internal + 1);
  if (v4)
  {
    *(_DWORD *)v4 += 2;
    v5 = (__CFString *)WTF::StringImpl::operator NSString *();
    if (*(_DWORD *)v4 == 2) {
      WTF::StringImpl::destroy(v4, v3);
    }
    else {
      *(_DWORD *)v4 -= 2;
    }
  }
  else
  {
    v5 = &stru_1F3C7DA90;
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7, v3);
  return &v5->isa;
}

- (NSString)listStyle
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  v4 = (WTF::StringImpl *)*((void *)self->super._internal + 3);
  if (v4)
  {
    *(_DWORD *)v4 += 2;
    v5 = (__CFString *)WTF::StringImpl::operator NSString *();
    if (*(_DWORD *)v4 == 2) {
      WTF::StringImpl::destroy(v4, v3);
    }
    else {
      *(_DWORD *)v4 -= 2;
    }
  }
  else
  {
    v5 = &stru_1F3C7DA90;
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7, v3);
  return &v5->isa;
}

- (NSString)separator
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  v4 = (WTF::StringImpl *)*((void *)self->super._internal + 2);
  if (v4)
  {
    *(_DWORD *)v4 += 2;
    v5 = (__CFString *)WTF::StringImpl::operator NSString *();
    if (*(_DWORD *)v4 == 2) {
      WTF::StringImpl::destroy(v4, v3);
    }
    else {
      *(_DWORD *)v4 -= 2;
    }
  }
  else
  {
    v5 = &stru_1F3C7DA90;
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7, v3);
  return &v5->isa;
}

@end