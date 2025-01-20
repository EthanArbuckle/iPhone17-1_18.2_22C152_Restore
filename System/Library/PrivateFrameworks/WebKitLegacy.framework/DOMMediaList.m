@interface DOMMediaList
- (NSString)item:(unsigned int)index;
- (NSString)mediaText;
- (unsigned)length;
- (void)appendMedium:(NSString *)newMedium;
- (void)dealloc;
- (void)deleteMedium:(NSString *)oldMedium;
- (void)setMediaText:(NSString *)mediaText;
@end

@implementation DOMMediaList

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
        WebCore::MediaList::~MediaList(internal);
        WTF::fastFree(v5, v6);
      }
      else
      {
        --*(_DWORD *)internal;
      }
    }
    v7.receiver = self;
    v7.super_class = (Class)DOMMediaList;
    [(DOMObject *)&v7 dealloc];
  }
}

- (NSString)mediaText
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WebCore::MediaList::mediaText((uint64_t *)&v7, self->super._internal);
  if (v7)
  {
    v4 = (__CFString *)WTF::StringImpl::operator NSString *();
    v5 = v7;
    objc_super v7 = 0;
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

- (void)setMediaText:(NSString *)mediaText
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10);
  internal = self->super._internal;
  MEMORY[0x1E4E442D0](&v9, mediaText);
  WebCore::MediaList::setMediaText(internal, (const WTF::String *)&v9);
  objc_super v7 = v9;
  v9 = 0;
  if (!v7) {
    goto LABEL_4;
  }
  if (*(_DWORD *)v7 != 2)
  {
    *(_DWORD *)v7 -= 2;
LABEL_4:
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10, v6);
    return;
  }
  WTF::StringImpl::destroy(v7, v6);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10, v8);
}

- (unsigned)length
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LODWORD(self) = WebCore::MediaList::length(self->super._internal);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return self;
}

- (NSString)item:(unsigned int)index
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WebCore::MediaList::item(self->super._internal);
  if (v7)
  {
    v5 = (__CFString *)WTF::StringImpl::operator NSString *();
    if (*(_DWORD *)v7 == 2) {
      WTF::StringImpl::destroy(v7, v4);
    }
    else {
      *(_DWORD *)v7 -= 2;
    }
  }
  else
  {
    v5 = &stru_1F3C7DA90;
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8, v4);
  return &v5->isa;
}

- (void)deleteMedium:(NSString *)oldMedium
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v14);
  internal = self->super._internal;
  MEMORY[0x1E4E442D0](&v10, oldMedium);
  WebCore::MediaList::deleteMedium(&v11, internal, (const WTF::String *)&v10);
  if (v13)
  {
    v14[80] = v11;
    uint64_t v9 = v12;
    uint64_t v12 = 0;
    uint64_t v15 = v9;
    raiseDOMErrorException();
  }
  objc_super v7 = v10;
  v10 = 0;
  if (!v7) {
    goto LABEL_5;
  }
  if (*(_DWORD *)v7 != 2)
  {
    *(_DWORD *)v7 -= 2;
LABEL_5:
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v14, v6);
    return;
  }
  WTF::StringImpl::destroy(v7, v6);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v14, v8);
}

- (void)appendMedium:(NSString *)newMedium
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10);
  internal = self->super._internal;
  MEMORY[0x1E4E442D0](&v9, newMedium);
  WebCore::MediaList::appendMedium(internal, (const WTF::String *)&v9);
  objc_super v7 = v9;
  uint64_t v9 = 0;
  if (!v7) {
    goto LABEL_4;
  }
  if (*(_DWORD *)v7 != 2)
  {
    *(_DWORD *)v7 -= 2;
LABEL_4:
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10, v6);
    return;
  }
  WTF::StringImpl::destroy(v7, v6);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10, v8);
}

@end