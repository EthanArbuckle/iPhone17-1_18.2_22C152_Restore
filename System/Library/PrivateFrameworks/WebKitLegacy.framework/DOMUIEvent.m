@interface DOMUIEvent
- (DOMAbstractView)view;
- (int)charCode;
- (int)detail;
- (int)keyCode;
- (int)layerX;
- (int)layerY;
- (int)pageX;
- (int)pageY;
- (int)which;
- (void)initUIEvent:(NSString *)type canBubble:(BOOL)canBubble cancelable:(BOOL)cancelable view:(DOMAbstractView *)view detail:(int)detail;
@end

@implementation DOMUIEvent

- (DOMAbstractView)view
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  v4 = (WebCore::WindowProxy *)*((void *)self->super.super._internal + 9);
  if (v4 && (v5 = (WebCore::LocalDOMWindow *)WebCore::WindowProxy::window(v4)) != 0 && !*((unsigned char *)v5 + 56)) {
    v6 = (DOMAbstractView *)kit(v5);
  }
  else {
    v6 = 0;
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8, v3);
  return v6;
}

- (int)detail
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LODWORD(self) = *((_DWORD *)self->super.super._internal + 20);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return (int)self;
}

- (int)keyCode
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  if (!(*(unsigned int (**)(DOMObjectInternal *))(*(void *)self->super.super._internal + 80))(self->super.super._internal))
  {
    int v5 = 0;
    goto LABEL_5;
  }
  internal = self->super.super._internal;
  if ((*(uint64_t (**)(DOMObjectInternal *))(*(void *)internal + 80))(internal))
  {
    int v5 = WebCore::KeyboardEvent::keyCode(internal);
LABEL_5:
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7, v3);
    return v5;
  }
  int result = 96;
  __break(0xC471u);
  return result;
}

- (int)charCode
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  if (!(*(unsigned int (**)(DOMObjectInternal *))(*(void *)self->super.super._internal + 80))(self->super.super._internal))
  {
    int v5 = 0;
    goto LABEL_5;
  }
  internal = self->super.super._internal;
  if ((*(uint64_t (**)(DOMObjectInternal *))(*(void *)internal + 80))(internal))
  {
    int v5 = WebCore::KeyboardEvent::charCode(internal);
LABEL_5:
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7, v3);
    return v5;
  }
  int result = 96;
  __break(0xC471u);
  return result;
}

- (int)layerX
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LODWORD(self) = (*(uint64_t (**)(DOMObjectInternal *))(*(void *)self->super.super._internal + 184))(self->super.super._internal);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return (int)self;
}

- (int)layerY
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LODWORD(self) = (*(uint64_t (**)(DOMObjectInternal *))(*(void *)self->super.super._internal + 192))(self->super.super._internal);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return (int)self;
}

- (int)pageX
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LODWORD(self) = (*(uint64_t (**)(DOMObjectInternal *))(*(void *)self->super.super._internal + 200))(self->super.super._internal);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return (int)self;
}

- (int)pageY
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LODWORD(self) = (*(uint64_t (**)(DOMObjectInternal *))(*(void *)self->super.super._internal + 208))(self->super.super._internal);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return (int)self;
}

- (int)which
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LODWORD(self) = (*(uint64_t (**)(DOMObjectInternal *))(*(void *)self->super.super._internal + 216))(self->super.super._internal);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return (int)self;
}

- (void)initUIEvent:(NSString *)type canBubble:(BOOL)canBubble cancelable:(BOOL)cancelable view:(DOMAbstractView *)view detail:(int)detail
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v19);
  WTF::AtomStringImpl::add((uint64_t *)&v20, (WTF::AtomStringImpl *)type, v9);
  v18 = v20;
  if (!view) {
    goto LABEL_7;
  }
  internal = view->super._internal;
  if (!internal) {
    goto LABEL_8;
  }
  uint64_t v11 = *((void *)internal + 37);
  v12 = *(WebCore::LocalDOMWindow **)(v11 + 728);
  if (v12 && WebCore::LocalDOMWindow::frame(*(WebCore::LocalDOMWindow **)(v11 + 728)))
  {
    internal = *(DOMObjectInternal **)(WebCore::LocalDOMWindow::frame(v12) + 112);
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
  v20 = internal;
  WebCore::UIEvent::initUIEvent();
  v14 = v20;
  v20 = 0;
  if (v14)
  {
    if (*(_DWORD *)v14 == 1)
    {
      WebCore::WindowProxy::~WindowProxy(v14);
      WTF::fastFree(v16, v17);
      v15 = v18;
      if (!v18) {
        goto LABEL_17;
      }
      goto LABEL_14;
    }
    --*(_DWORD *)v14;
  }
  v15 = v18;
  if (!v18) {
    goto LABEL_17;
  }
LABEL_14:
  if (*(_DWORD *)v15 == 2) {
    WTF::StringImpl::destroy(v15, v13);
  }
  else {
    *(_DWORD *)v15 -= 2;
  }
LABEL_17:
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v19, v13);
}

@end