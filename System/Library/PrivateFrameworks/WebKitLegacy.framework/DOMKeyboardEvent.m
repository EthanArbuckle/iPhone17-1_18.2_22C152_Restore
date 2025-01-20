@interface DOMKeyboardEvent
- (BOOL)altGraphKey;
- (BOOL)altKey;
- (BOOL)ctrlKey;
- (BOOL)getModifierState:(NSString *)keyIdentifierArg;
- (BOOL)metaKey;
- (BOOL)shiftKey;
- (NSString)keyIdentifier;
- (int)charCode;
- (int)keyCode;
- (unsigned)keyLocation;
- (unsigned)location;
- (void)initKeyboardEvent:(NSString *)type canBubble:(BOOL)canBubble cancelable:(BOOL)cancelable view:(DOMAbstractView *)view keyIdentifier:(NSString *)keyIdentifier keyLocation:(unsigned int)keyLocation ctrlKey:(BOOL)ctrlKey altKey:(BOOL)altKey shiftKey:(BOOL)shiftKey metaKey:(BOOL)metaKey;
- (void)initKeyboardEvent:(NSString *)type canBubble:(BOOL)canBubble cancelable:(BOOL)cancelable view:(DOMAbstractView *)view keyIdentifier:(NSString *)keyIdentifier keyLocation:(unsigned int)keyLocation ctrlKey:(BOOL)ctrlKey altKey:(BOOL)altKey shiftKey:(BOOL)shiftKey metaKey:(BOOL)metaKey altGraphKey:(BOOL)altGraphKey;
- (void)initKeyboardEvent:(NSString *)type canBubble:(BOOL)canBubble cancelable:(BOOL)cancelable view:(DOMAbstractView *)view keyIdentifier:(NSString *)keyIdentifier location:(unsigned int)location ctrlKey:(BOOL)ctrlKey altKey:(BOOL)altKey shiftKey:(BOOL)shiftKey metaKey:(BOOL)metaKey;
- (void)initKeyboardEvent:(NSString *)type canBubble:(BOOL)canBubble cancelable:(BOOL)cancelable view:(DOMAbstractView *)view keyIdentifier:(NSString *)keyIdentifier location:(unsigned int)location ctrlKey:(BOOL)ctrlKey altKey:(BOOL)altKey shiftKey:(BOOL)shiftKey metaKey:(BOOL)metaKey altGraphKey:(BOOL)altGraphKey;
@end

@implementation DOMKeyboardEvent

- (NSString)keyIdentifier
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6);
  if (*((void *)self->super.super.super._internal + 14)) {
    v4 = (__CFString *)WTF::StringImpl::operator NSString *();
  }
  else {
    v4 = &stru_1F3C7DA90;
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6, v3);
  return &v4->isa;
}

- (unsigned)location
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LODWORD(self) = *((_DWORD *)self->super.super.super._internal + 30);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return self;
}

- (unsigned)keyLocation
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LODWORD(self) = *((_DWORD *)self->super.super.super._internal + 30);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return self;
}

- (BOOL)ctrlKey
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LODWORD(self) = (*((unsigned __int8 *)self->super.super.super._internal + 84) >> 1) & 1;
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return (char)self;
}

- (BOOL)shiftKey
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LODWORD(self) = (*((unsigned __int8 *)self->super.super.super._internal + 84) >> 3) & 1;
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return (char)self;
}

- (BOOL)altKey
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LOBYTE(self) = *((unsigned char *)self->super.super.super._internal + 84) & 1;
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return (char)self;
}

- (BOOL)metaKey
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LODWORD(self) = (*((unsigned __int8 *)self->super.super.super._internal + 84) >> 2) & 1;
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return (char)self;
}

- (BOOL)altGraphKey
{
  return 0;
}

- (int)keyCode
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LODWORD(self) = WebCore::KeyboardEvent::keyCode(self->super.super.super._internal);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return (int)self;
}

- (int)charCode
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LODWORD(self) = WebCore::KeyboardEvent::charCode(self->super.super.super._internal);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return (int)self;
}

- (BOOL)getModifierState:(NSString *)keyIdentifierArg
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v11);
  internal = self->super.super.super._internal;
  MEMORY[0x1E4E442D0](&v10, keyIdentifierArg);
  char ModifierState = WebCore::UIEventWithKeyState::getModifierState(internal, (const WTF::String *)&v10);
  v8 = v10;
  v10 = 0;
  if (v8)
  {
    if (*(_DWORD *)v8 == 2) {
      WTF::StringImpl::destroy(v8, v6);
    }
    else {
      *(_DWORD *)v8 -= 2;
    }
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v11, v6);
  return ModifierState;
}

- (void)initKeyboardEvent:(NSString *)type canBubble:(BOOL)canBubble cancelable:(BOOL)cancelable view:(DOMAbstractView *)view keyIdentifier:(NSString *)keyIdentifier location:(unsigned int)location ctrlKey:(BOOL)ctrlKey altKey:(BOOL)altKey shiftKey:(BOOL)shiftKey metaKey:(BOOL)metaKey altGraphKey:(BOOL)altGraphKey
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v29);
  WTF::AtomStringImpl::add((uint64_t *)&v30, (WTF::AtomStringImpl *)type, v16);
  v28 = v30;
  if (!view) {
    goto LABEL_7;
  }
  internal = view->super._internal;
  if (!internal) {
    goto LABEL_8;
  }
  uint64_t v19 = *((void *)internal + 37);
  v20 = *(WebCore::LocalDOMWindow **)(v19 + 728);
  if (v20 && WebCore::LocalDOMWindow::frame(*(WebCore::LocalDOMWindow **)(v19 + 728)))
  {
    internal = *(DOMObjectInternal **)(WebCore::LocalDOMWindow::frame(v20) + 112);
    if (internal) {
      ++*(_DWORD *)internal;
    }
  }
  else
  {
LABEL_7:
    internal = 0;
  }
LABEL_8:
  v27 = internal;
  WTF::AtomStringImpl::add((uint64_t *)&v30, (WTF::AtomStringImpl *)keyIdentifier, v17);
  v26 = v30;
  WebCore::KeyboardEvent::initKeyboardEvent();
  if (!v26) {
    goto LABEL_11;
  }
  if (*(_DWORD *)v26 != 2)
  {
    *(_DWORD *)v26 -= 2;
LABEL_11:
    v22 = v27;
    if (!v27) {
      goto LABEL_16;
    }
    goto LABEL_14;
  }
  WTF::StringImpl::destroy(v26, v21);
  v22 = v27;
  if (!v27) {
    goto LABEL_16;
  }
LABEL_14:
  if (*(_DWORD *)v22 == 1)
  {
    WebCore::WindowProxy::~WindowProxy(v22);
    WTF::fastFree(v24, v25);
    v23 = v28;
    if (!v28) {
      goto LABEL_22;
    }
    goto LABEL_19;
  }
  --*(_DWORD *)v22;
LABEL_16:
  v23 = v28;
  if (!v28) {
    goto LABEL_22;
  }
LABEL_19:
  if (*(_DWORD *)v23 == 2) {
    WTF::StringImpl::destroy(v23, v21);
  }
  else {
    *(_DWORD *)v23 -= 2;
  }
LABEL_22:
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v29, v21);
}

- (void)initKeyboardEvent:(NSString *)type canBubble:(BOOL)canBubble cancelable:(BOOL)cancelable view:(DOMAbstractView *)view keyIdentifier:(NSString *)keyIdentifier location:(unsigned int)location ctrlKey:(BOOL)ctrlKey altKey:(BOOL)altKey shiftKey:(BOOL)shiftKey metaKey:(BOOL)metaKey
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v28);
  WTF::AtomStringImpl::add((uint64_t *)&v29, (WTF::AtomStringImpl *)type, v15);
  v27 = v29;
  if (!view) {
    goto LABEL_7;
  }
  internal = view->super._internal;
  if (!internal) {
    goto LABEL_8;
  }
  uint64_t v18 = *((void *)internal + 37);
  uint64_t v19 = *(WebCore::LocalDOMWindow **)(v18 + 728);
  if (v19 && WebCore::LocalDOMWindow::frame(*(WebCore::LocalDOMWindow **)(v18 + 728)))
  {
    internal = *(DOMObjectInternal **)(WebCore::LocalDOMWindow::frame(v19) + 112);
    if (internal) {
      ++*(_DWORD *)internal;
    }
  }
  else
  {
LABEL_7:
    internal = 0;
  }
LABEL_8:
  v26 = internal;
  WTF::AtomStringImpl::add((uint64_t *)&v29, (WTF::AtomStringImpl *)keyIdentifier, v16);
  v25 = v29;
  WebCore::KeyboardEvent::initKeyboardEvent();
  if (!v25) {
    goto LABEL_11;
  }
  if (*(_DWORD *)v25 != 2)
  {
    *(_DWORD *)v25 -= 2;
LABEL_11:
    v21 = v26;
    if (!v26) {
      goto LABEL_16;
    }
    goto LABEL_14;
  }
  WTF::StringImpl::destroy(v25, v20);
  v21 = v26;
  if (!v26) {
    goto LABEL_16;
  }
LABEL_14:
  if (*(_DWORD *)v21 == 1)
  {
    WebCore::WindowProxy::~WindowProxy(v21);
    WTF::fastFree(v23, v24);
    v22 = v27;
    if (!v27) {
      goto LABEL_22;
    }
    goto LABEL_19;
  }
  --*(_DWORD *)v21;
LABEL_16:
  v22 = v27;
  if (!v27) {
    goto LABEL_22;
  }
LABEL_19:
  if (*(_DWORD *)v22 == 2) {
    WTF::StringImpl::destroy(v22, v20);
  }
  else {
    *(_DWORD *)v22 -= 2;
  }
LABEL_22:
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v28, v20);
}

- (void)initKeyboardEvent:(NSString *)type canBubble:(BOOL)canBubble cancelable:(BOOL)cancelable view:(DOMAbstractView *)view keyIdentifier:(NSString *)keyIdentifier keyLocation:(unsigned int)keyLocation ctrlKey:(BOOL)ctrlKey altKey:(BOOL)altKey shiftKey:(BOOL)shiftKey metaKey:(BOOL)metaKey altGraphKey:(BOOL)altGraphKey
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v29);
  WTF::AtomStringImpl::add((uint64_t *)&v30, (WTF::AtomStringImpl *)type, v16);
  v28 = v30;
  if (!view) {
    goto LABEL_7;
  }
  internal = view->super._internal;
  if (!internal) {
    goto LABEL_8;
  }
  uint64_t v19 = *((void *)internal + 37);
  v20 = *(WebCore::LocalDOMWindow **)(v19 + 728);
  if (v20 && WebCore::LocalDOMWindow::frame(*(WebCore::LocalDOMWindow **)(v19 + 728)))
  {
    internal = *(DOMObjectInternal **)(WebCore::LocalDOMWindow::frame(v20) + 112);
    if (internal) {
      ++*(_DWORD *)internal;
    }
  }
  else
  {
LABEL_7:
    internal = 0;
  }
LABEL_8:
  v27 = internal;
  WTF::AtomStringImpl::add((uint64_t *)&v30, (WTF::AtomStringImpl *)keyIdentifier, v17);
  v26 = v30;
  WebCore::KeyboardEvent::initKeyboardEvent();
  if (!v26) {
    goto LABEL_11;
  }
  if (*(_DWORD *)v26 != 2)
  {
    *(_DWORD *)v26 -= 2;
LABEL_11:
    v22 = v27;
    if (!v27) {
      goto LABEL_16;
    }
    goto LABEL_14;
  }
  WTF::StringImpl::destroy(v26, v21);
  v22 = v27;
  if (!v27) {
    goto LABEL_16;
  }
LABEL_14:
  if (*(_DWORD *)v22 == 1)
  {
    WebCore::WindowProxy::~WindowProxy(v22);
    WTF::fastFree(v24, v25);
    v23 = v28;
    if (!v28) {
      goto LABEL_22;
    }
    goto LABEL_19;
  }
  --*(_DWORD *)v22;
LABEL_16:
  v23 = v28;
  if (!v28) {
    goto LABEL_22;
  }
LABEL_19:
  if (*(_DWORD *)v23 == 2) {
    WTF::StringImpl::destroy(v23, v21);
  }
  else {
    *(_DWORD *)v23 -= 2;
  }
LABEL_22:
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v29, v21);
}

- (void)initKeyboardEvent:(NSString *)type canBubble:(BOOL)canBubble cancelable:(BOOL)cancelable view:(DOMAbstractView *)view keyIdentifier:(NSString *)keyIdentifier keyLocation:(unsigned int)keyLocation ctrlKey:(BOOL)ctrlKey altKey:(BOOL)altKey shiftKey:(BOOL)shiftKey metaKey:(BOOL)metaKey
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v28);
  WTF::AtomStringImpl::add((uint64_t *)&v29, (WTF::AtomStringImpl *)type, v15);
  v27 = v29;
  if (!view) {
    goto LABEL_7;
  }
  internal = view->super._internal;
  if (!internal) {
    goto LABEL_8;
  }
  uint64_t v18 = *((void *)internal + 37);
  uint64_t v19 = *(WebCore::LocalDOMWindow **)(v18 + 728);
  if (v19 && WebCore::LocalDOMWindow::frame(*(WebCore::LocalDOMWindow **)(v18 + 728)))
  {
    internal = *(DOMObjectInternal **)(WebCore::LocalDOMWindow::frame(v19) + 112);
    if (internal) {
      ++*(_DWORD *)internal;
    }
  }
  else
  {
LABEL_7:
    internal = 0;
  }
LABEL_8:
  v26 = internal;
  WTF::AtomStringImpl::add((uint64_t *)&v29, (WTF::AtomStringImpl *)keyIdentifier, v16);
  v25 = v29;
  WebCore::KeyboardEvent::initKeyboardEvent();
  if (!v25) {
    goto LABEL_11;
  }
  if (*(_DWORD *)v25 != 2)
  {
    *(_DWORD *)v25 -= 2;
LABEL_11:
    v21 = v26;
    if (!v26) {
      goto LABEL_16;
    }
    goto LABEL_14;
  }
  WTF::StringImpl::destroy(v25, v20);
  v21 = v26;
  if (!v26) {
    goto LABEL_16;
  }
LABEL_14:
  if (*(_DWORD *)v21 == 1)
  {
    WebCore::WindowProxy::~WindowProxy(v21);
    WTF::fastFree(v23, v24);
    v22 = v27;
    if (!v27) {
      goto LABEL_22;
    }
    goto LABEL_19;
  }
  --*(_DWORD *)v21;
LABEL_16:
  v22 = v27;
  if (!v27) {
    goto LABEL_22;
  }
LABEL_19:
  if (*(_DWORD *)v22 == 2) {
    WTF::StringImpl::destroy(v22, v20);
  }
  else {
    *(_DWORD *)v22 -= 2;
  }
LABEL_22:
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v28, v20);
}

@end