@interface DOMMouseEvent
- (BOOL)altKey;
- (BOOL)ctrlKey;
- (BOOL)metaKey;
- (BOOL)shiftKey;
- (DOMNode)fromElement;
- (DOMNode)toElement;
- (__int16)button;
- (id)relatedTarget;
- (int)clientX;
- (int)clientY;
- (int)offsetX;
- (int)offsetY;
- (int)screenX;
- (int)screenY;
- (int)x;
- (int)y;
- (void)initMouseEvent:(NSString *)type :(BOOL)canBubble :(BOOL)cancelable :(DOMAbstractView *)view :(int)detail :(int)screenX :(int)screenY :(int)clientX :(int)clientY :(BOOL)ctrlKey :(BOOL)altKey :(BOOL)shiftKey :(BOOL)metaKey :(unsigned __int16)button :(id)relatedTarget;
- (void)initMouseEvent:(NSString *)type canBubble:(BOOL)canBubble cancelable:(BOOL)cancelable view:(DOMAbstractView *)view detail:(int)detail screenX:(int)screenX screenY:(int)screenY clientX:(int)clientX clientY:(int)clientY ctrlKey:(BOOL)ctrlKey altKey:(BOOL)altKey shiftKey:(BOOL)shiftKey metaKey:(BOOL)metaKey button:(unsigned __int16)button relatedTarget:(id)relatedTarget;
@end

@implementation DOMMouseEvent

- (int)screenX
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LODWORD(self) = *((_DWORD *)self->super.super.super._internal + 22);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return (int)self;
}

- (int)screenY
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LODWORD(self) = *((_DWORD *)self->super.super.super._internal + 23);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return (int)self;
}

- (int)clientX
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LODWORD(self) = *((_DWORD *)self->super.super.super._internal + 24) / 64;
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return (int)self;
}

- (int)clientY
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LODWORD(self) = *((_DWORD *)self->super.super.super._internal + 25) / 64;
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return (int)self;
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

- (__int16)button
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LOWORD(self) = *((_WORD *)self->super.super.super._internal + 81);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return (__int16)self;
}

- (id)relatedTarget
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  v4 = (WebCore::Node *)*((void *)self->super.super.super._internal + 21);
  if (v4 && (*((unsigned char *)v4 + 22) & 2) != 0) {
    v5 = kit(v4);
  }
  else {
    v5 = 0;
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7, v3);
  return v5;
}

- (int)offsetX
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LODWORD(self) = WebCore::MouseRelatedEvent::offsetX(self->super.super.super._internal);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return (int)self;
}

- (int)offsetY
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LODWORD(self) = WebCore::MouseRelatedEvent::offsetY(self->super.super.super._internal);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return (int)self;
}

- (int)x
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LODWORD(self) = *((_DWORD *)self->super.super.super._internal + 24) / 64;
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return (int)self;
}

- (int)y
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LODWORD(self) = *((_DWORD *)self->super.super.super._internal + 25) / 64;
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return (int)self;
}

- (DOMNode)fromElement
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  (*(void (**)(WebCore::Node **__return_ptr))(*(void *)self->super.super.super._internal + 232))(&v7);
  v4 = (DOMNode *)kit(v7);
  v5 = v7;
  v7 = 0;
  if (v5)
  {
    if (*((_DWORD *)v5 + 7) == 2)
    {
      if ((*((_WORD *)v5 + 17) & 0x400) == 0) {
        WebCore::Node::removedLastRef(v5);
      }
    }
    else
    {
      *((_DWORD *)v5 + 7) -= 2;
    }
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8, v3);
  return v4;
}

- (DOMNode)toElement
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  (*(void (**)(WebCore::Node **__return_ptr))(*(void *)self->super.super.super._internal + 224))(&v7);
  v4 = (DOMNode *)kit(v7);
  v5 = v7;
  v7 = 0;
  if (v5)
  {
    if (*((_DWORD *)v5 + 7) == 2)
    {
      if ((*((_WORD *)v5 + 17) & 0x400) == 0) {
        WebCore::Node::removedLastRef(v5);
      }
    }
    else
    {
      *((_DWORD *)v5 + 7) -= 2;
    }
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8, v3);
  return v4;
}

- (void)initMouseEvent:(NSString *)type canBubble:(BOOL)canBubble cancelable:(BOOL)cancelable view:(DOMAbstractView *)view detail:(int)detail screenX:(int)screenX screenY:(int)screenY clientX:(int)clientX clientY:(int)clientY ctrlKey:(BOOL)ctrlKey altKey:(BOOL)altKey shiftKey:(BOOL)shiftKey metaKey:(BOOL)metaKey button:(unsigned __int16)button relatedTarget:(id)relatedTarget
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v29);
  WTF::AtomStringImpl::add((uint64_t *)&v30, (WTF::AtomStringImpl *)type, v19);
  v28 = v30;
  if (!view) {
    goto LABEL_7;
  }
  internal = view->super._internal;
  if (!internal) {
    goto LABEL_8;
  }
  uint64_t v21 = *((void *)internal + 37);
  v22 = *(WebCore::LocalDOMWindow **)(v21 + 728);
  if (v22 && WebCore::LocalDOMWindow::frame(*(WebCore::LocalDOMWindow **)(v21 + 728)))
  {
    internal = *(DOMObjectInternal **)(WebCore::LocalDOMWindow::frame(v22) + 112);
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
  v30 = internal;
  WebCore::MouseEvent::initMouseEvent();
  v24 = v30;
  v30 = 0;
  if (v24)
  {
    if (*(_DWORD *)v24 == 1)
    {
      WebCore::WindowProxy::~WindowProxy(v24);
      WTF::fastFree(v26, v27);
      v25 = v28;
      if (!v28) {
        goto LABEL_17;
      }
      goto LABEL_14;
    }
    --*(_DWORD *)v24;
  }
  v25 = v28;
  if (!v28) {
    goto LABEL_17;
  }
LABEL_14:
  if (*(_DWORD *)v25 == 2) {
    WTF::StringImpl::destroy(v25, v23);
  }
  else {
    *(_DWORD *)v25 -= 2;
  }
LABEL_17:
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v29, v23);
}

- (void)initMouseEvent:(NSString *)type :(BOOL)canBubble :(BOOL)cancelable :(DOMAbstractView *)view :(int)detail :(int)screenX :(int)screenY :(int)clientX :(int)clientY :(BOOL)ctrlKey :(BOOL)altKey :(BOOL)shiftKey :(BOOL)metaKey :(unsigned __int16)button :(id)relatedTarget
{
}

@end