@interface DOMFileList
- (DOMFile)item:(unsigned int)index;
- (unsigned)length;
- (void)dealloc;
@end

@implementation DOMFileList

- (void)dealloc
{
  v3 = (objc_class *)objc_opt_class();
  if ((WebCoreObjCScheduleDeallocateOnMainThread(v3, (objc_object *)self) & 1) == 0)
  {
    internal = self->super._internal;
    if (internal)
    {
      if (*((_DWORD *)internal + 2) == 1)
      {
        uint64_t v6 = *((unsigned int *)internal + 7);
        if (v6)
        {
          v7 = (_DWORD **)*((void *)internal + 2);
          uint64_t v8 = 8 * v6;
          do
          {
            v9 = *v7;
            *v7 = 0;
            if (v9)
            {
              if (v9[4] == 1) {
                (*(void (**)(_DWORD *))(*(void *)v9 + 8))(v9);
              }
              else {
                --v9[4];
              }
            }
            ++v7;
            v8 -= 8;
          }
          while (v8);
        }
        v10 = (WTF *)*((void *)internal + 2);
        if (v10)
        {
          *((void *)internal + 2) = 0;
          *((_DWORD *)internal + 6) = 0;
          WTF::fastFree(v10, v4);
        }
        if (*(void *)internal)
        {
          *(void *)(*(void *)internal + 8) = 3;
          *(void *)internal = 0;
        }
        MEMORY[0x1E4E48930](internal);
      }
      else
      {
        --*((_DWORD *)internal + 2);
      }
    }
    v11.receiver = self;
    v11.super_class = (Class)DOMFileList;
    [(DOMObject *)&v11 dealloc];
  }
}

- (unsigned)length
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LODWORD(self) = *((_DWORD *)self->super._internal + 7);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return self;
}

- (DOMFile)item:(unsigned int)index
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  v4 = (DOMObjectInternal *)WebCore::FileList::item(self->super._internal);
  v5 = (DOMFile *)kit(v4);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8, v6);
  return v5;
}

@end