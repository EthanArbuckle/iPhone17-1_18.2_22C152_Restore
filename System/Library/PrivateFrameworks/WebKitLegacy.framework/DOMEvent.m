@interface DOMEvent
- (BOOL)bubbles;
- (BOOL)cancelBubble;
- (BOOL)cancelable;
- (BOOL)composed;
- (BOOL)defaultPrevented;
- (BOOL)isTrusted;
- (BOOL)returnValue;
- (DOMTimeStamp)timeStamp;
- (NSString)type;
- (id)currentTarget;
- (id)srcElement;
- (id)target;
- (unsigned)eventPhase;
- (void)dealloc;
- (void)initEvent:(NSString *)eventTypeArg canBubbleArg:(BOOL)canBubbleArg cancelableArg:(BOOL)cancelableArg;
- (void)preventDefault;
- (void)setCancelBubble:(BOOL)cancelBubble;
- (void)setReturnValue:(BOOL)returnValue;
- (void)stopImmediatePropagation;
- (void)stopPropagation;
@end

@implementation DOMEvent

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
    v5.super_class = (Class)DOMEvent;
    [(DOMObject *)&v5 dealloc];
  }
}

- (NSString)type
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6);
  if (*((void *)self->super._internal + 3)) {
    v4 = (__CFString *)WTF::StringImpl::operator NSString *();
  }
  else {
    v4 = &stru_1F3C7DA90;
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6, v3);
  return &v4->isa;
}

- (id)target
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  v4 = (WebCore::Node *)*((void *)self->super._internal + 6);
  if (v4 && (*((unsigned char *)v4 + 22) & 2) != 0) {
    objc_super v5 = kit(v4);
  }
  else {
    objc_super v5 = 0;
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7, v3);
  return v5;
}

- (id)currentTarget
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  v4 = (WebCore::Node *)*((void *)self->super._internal + 4);
  if (v4 && (*((unsigned char *)v4 + 22) & 2) != 0) {
    objc_super v5 = kit(v4);
  }
  else {
    objc_super v5 = 0;
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7, v3);
  return v5;
}

- (unsigned)eventPhase
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LODWORD(self) = (*((unsigned __int16 *)self->super._internal + 10) >> 12) & 3;
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return (unsigned __int16)self;
}

- (BOOL)bubbles
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LODWORD(self) = (*((_DWORD *)self->super._internal + 5) >> 1) & 1;
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return (char)self;
}

- (BOOL)cancelable
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LODWORD(self) = (*((_DWORD *)self->super._internal + 5) >> 2) & 1;
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return (char)self;
}

- (BOOL)composed
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LODWORD(self) = (*((_DWORD *)self->super._internal + 5) >> 3) & 1;
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return (char)self;
}

- (DOMTimeStamp)timeStamp
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  uint64_t v7 = *((void *)self->super._internal + 7);
  WTF::MonotonicTime::approximateWallTime((WTF::MonotonicTime *)&v7);
  DOMTimeStamp v4 = (unint64_t)(v3 * 1000.0);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8, v5);
  return v4;
}

- (BOOL)defaultPrevented
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LODWORD(self) = (*((_DWORD *)self->super._internal + 5) >> 6) & 1;
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return (char)self;
}

- (BOOL)isTrusted
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LODWORD(self) = (*((_DWORD *)self->super._internal + 5) >> 9) & 1;
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return (char)self;
}

- (id)srcElement
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  DOMTimeStamp v4 = (WebCore::Node *)*((void *)self->super._internal + 6);
  if (v4 && (*((unsigned char *)v4 + 22) & 2) != 0) {
    objc_super v5 = kit(v4);
  }
  else {
    objc_super v5 = 0;
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7, v3);
  return v5;
}

- (BOOL)returnValue
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LOBYTE(self) = (*((_DWORD *)self->super._internal + 5) & 0x40) == 0;
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return (char)self;
}

- (void)setReturnValue:(BOOL)returnValue
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  if (!returnValue)
  {
    internal = self->super._internal;
    if ((*((_DWORD *)internal + 5) & 0x404) == 4) {
      *((_DWORD *)internal + 5) |= 0x40u;
    }
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7, v5);
}

- (BOOL)cancelBubble
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LOBYTE(self) = (*((_DWORD *)self->super._internal + 5) & 0x30) != 0;
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return (char)self;
}

- (void)setCancelBubble:(BOOL)cancelBubble
{
  BOOL v3 = cancelBubble;
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6);
  if (v3) {
    *((_DWORD *)self->super._internal + 5) |= 0x10u;
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6, v5);
}

- (void)stopPropagation
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v4);
  *((_DWORD *)self->super._internal + 5) |= 0x10u;
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v4, v3);
}

- (void)preventDefault
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  internal = self->super._internal;
  if ((*((_DWORD *)internal + 5) & 0x404) == 4) {
    *((_DWORD *)internal + 5) |= 0x40u;
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
}

- (void)initEvent:(NSString *)eventTypeArg canBubbleArg:(BOOL)canBubbleArg cancelableArg:(BOOL)cancelableArg
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9);
  WTF::AtomStringImpl::add((uint64_t *)&v10, (WTF::AtomStringImpl *)eventTypeArg, v6);
  v8 = v10;
  WebCore::Event::initEvent();
  if (v8)
  {
    if (*(_DWORD *)v8 == 2) {
      WTF::StringImpl::destroy(v8, v7);
    }
    else {
      *(_DWORD *)v8 -= 2;
    }
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9, v7);
}

- (void)stopImmediatePropagation
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v4);
  *((_DWORD *)self->super._internal + 5) |= 0x20u;
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v4, v3);
}

@end