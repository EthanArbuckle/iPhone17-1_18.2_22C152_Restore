@interface DOMMediaError
- (unsigned)code;
- (void)dealloc;
@end

@implementation DOMMediaError

- (void)dealloc
{
  v3 = (objc_class *)objc_opt_class();
  if ((WebCoreObjCScheduleDeallocateOnMainThread(v3, (objc_object *)self) & 1) == 0)
  {
    internal = self->super._internal;
    if (internal)
    {
      if (*(_DWORD *)internal == 1)
      {
        v6 = (WTF::StringImpl *)*((void *)internal + 1);
        *((void *)internal + 1) = 0;
        if (v6)
        {
          if (*(_DWORD *)v6 == 2) {
            WTF::StringImpl::destroy(v6, v4);
          }
          else {
            *(_DWORD *)v6 -= 2;
          }
        }
        WTF::fastFree(internal, v4);
      }
      else
      {
        --*(_DWORD *)internal;
      }
    }
    v7.receiver = self;
    v7.super_class = (Class)DOMMediaError;
    [(DOMObject *)&v7 dealloc];
  }
}

- (unsigned)code
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LOWORD(self) = *((_WORD *)self->super._internal + 2);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return (unsigned __int16)self;
}

@end