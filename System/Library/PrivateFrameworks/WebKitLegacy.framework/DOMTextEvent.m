@interface DOMTextEvent
- (NSString)data;
- (void)initTextEvent:(id)a3 canBubbleArg:(BOOL)a4 cancelableArg:(BOOL)a5 viewArg:(id)a6 dataArg:(id)a7;
@end

@implementation DOMTextEvent

- (NSString)data
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  v4 = (WTF::StringImpl *)*((void *)self->super.super.super._internal + 11);
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

- (void)initTextEvent:(id)a3 canBubbleArg:(BOOL)a4 cancelableArg:(BOOL)a5 viewArg:(id)a6 dataArg:(id)a7
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v22);
  WTF::AtomStringImpl::add((uint64_t *)&v23, (WTF::AtomStringImpl *)a3, v10);
  v21 = v23;
  if (!a6) {
    goto LABEL_7;
  }
  v11 = (WTF::StringImpl *)*((void *)a6 + 2);
  if (!v11) {
    goto LABEL_8;
  }
  uint64_t v12 = *((void *)v11 + 37);
  v13 = *(WebCore::LocalDOMWindow **)(v12 + 728);
  if (v13 && WebCore::LocalDOMWindow::frame(*(WebCore::LocalDOMWindow **)(v12 + 728)))
  {
    v11 = *(WTF::StringImpl **)(WebCore::LocalDOMWindow::frame(v13) + 112);
    if (v11) {
      ++*(_DWORD *)v11;
    }
  }
  else
  {
LABEL_7:
    v11 = 0;
  }
LABEL_8:
  v23 = v11;
  MEMORY[0x1E4E442D0](&v20, a7);
  WebCore::TextEvent::initTextEvent();
  v15 = v20;
  v20 = 0;
  if (!v15) {
    goto LABEL_11;
  }
  if (*(_DWORD *)v15 != 2)
  {
    *(_DWORD *)v15 -= 2;
LABEL_11:
    v16 = v23;
    v23 = 0;
    if (!v16) {
      goto LABEL_16;
    }
    goto LABEL_14;
  }
  WTF::StringImpl::destroy(v15, v14);
  v16 = v23;
  v23 = 0;
  if (!v16) {
    goto LABEL_16;
  }
LABEL_14:
  if (*(_DWORD *)v16 == 1)
  {
    WebCore::WindowProxy::~WindowProxy(v16);
    WTF::fastFree(v18, v19);
    v17 = v21;
    v21 = 0;
    if (!v17) {
      goto LABEL_22;
    }
    goto LABEL_19;
  }
  --*(_DWORD *)v16;
LABEL_16:
  v17 = v21;
  v21 = 0;
  if (!v17) {
    goto LABEL_22;
  }
LABEL_19:
  if (*(_DWORD *)v17 == 2) {
    WTF::StringImpl::destroy(v17, v14);
  }
  else {
    *(_DWORD *)v17 -= 2;
  }
LABEL_22:
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v22, v14);
}

@end