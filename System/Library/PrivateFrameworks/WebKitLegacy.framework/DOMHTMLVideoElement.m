@interface DOMHTMLVideoElement
- (BOOL)playsInline;
- (BOOL)webkitDisplayingFullscreen;
- (BOOL)webkitSupportsFullscreen;
- (NSString)poster;
- (unsigned)height;
- (unsigned)videoHeight;
- (unsigned)videoWidth;
- (unsigned)width;
- (void)setHeight:(unsigned int)a3;
- (void)setPlaysInline:(BOOL)a3;
- (void)setPoster:(id)a3;
- (void)setWidth:(unsigned int)a3;
- (void)webkitEnterFullscreen;
- (void)webkitExitFullscreen;
@end

@implementation DOMHTMLVideoElement

- (unsigned)width
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  unsigned int UnsignedIntegralAttribute = WebCore::Element::getUnsignedIntegralAttribute();
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return UnsignedIntegralAttribute;
}

- (void)setWidth:(unsigned int)a3
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v4);
  WebCore::Element::setUnsignedIntegralAttribute();
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v4, v3);
}

- (unsigned)height
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  unsigned int UnsignedIntegralAttribute = WebCore::Element::getUnsignedIntegralAttribute();
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return UnsignedIntegralAttribute;
}

- (void)setHeight:(unsigned int)a3
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v4);
  WebCore::Element::setUnsignedIntegralAttribute();
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v4, v3);
}

- (unsigned)videoWidth
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LODWORD(self) = WebCore::HTMLVideoElement::videoWidth(self->super.super.super.super.super._internal);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return self;
}

- (unsigned)videoHeight
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LODWORD(self) = WebCore::HTMLVideoElement::videoHeight(self->super.super.super.super.super._internal);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return self;
}

- (NSString)poster
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6);
  WebCore::Element::getURLAttribute();
  if (v5)
  {
    v3 = (__CFString *)WTF::StringImpl::operator NSString *();
    if (*(_DWORD *)v5 == 2) {
      WTF::StringImpl::destroy(v5, v2);
    }
    else {
      *(_DWORD *)v5 -= 2;
    }
  }
  else
  {
    v3 = &stru_1F3C7DA90;
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6, v2);
  return &v3->isa;
}

- (void)setPoster:(id)a3
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WTF::AtomStringImpl::add((uint64_t *)&v9, (WTF::AtomStringImpl *)a3, v4);
  v7 = v9;
  WebCore::Element::setAttributeWithoutSynchronization();
  if (!v7) {
    goto LABEL_4;
  }
  if (*(_DWORD *)v7 != 2)
  {
    *(_DWORD *)v7 -= 2;
LABEL_4:
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8, v5);
    return;
  }
  WTF::StringImpl::destroy(v7, v5);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8, v6);
}

- (BOOL)playsInline
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v12);
  uint64_t v4 = *((void *)self->super.super.super.super.super._internal + 14);
  if (!v4) {
    goto LABEL_12;
  }
  unsigned int v5 = *(_DWORD *)(v4 + 4);
  if (v5)
  {
    v6 = *(uint64_t **)(v4 + 40);
    LODWORD(v7) = *(_DWORD *)(v4 + 52);
    if (!v7)
    {
LABEL_12:
      BOOL v10 = 0;
      goto LABEL_13;
    }
  }
  else
  {
    v6 = (uint64_t *)(v4 + 32);
    LODWORD(v7) = v5 >> 5;
    if (!v7) {
      goto LABEL_12;
    }
  }
  uint64_t v8 = *MEMORY[0x1E4FB67B0];
  uint64_t v7 = v7;
  while (1)
  {
    uint64_t v9 = *v6;
    if (*v6 == v8 || *(void *)(v9 + 24) == *(void *)(v8 + 24) && *(void *)(v9 + 32) == *(void *)(v8 + 32)) {
      break;
    }
    v6 += 2;
    if (!--v7) {
      goto LABEL_12;
    }
  }
  BOOL v10 = 1;
LABEL_13:
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v12, v3);
  return v10;
}

- (void)setPlaysInline:(BOOL)a3
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v4);
  WebCore::Element::setBooleanAttribute();
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v4, v3);
}

- (BOOL)webkitSupportsFullscreen
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LOBYTE(self) = WebCore::HTMLVideoElement::webkitSupportsFullscreen(self->super.super.super.super.super._internal);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return (char)self;
}

- (BOOL)webkitDisplayingFullscreen
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LOBYTE(self) = WebCore::HTMLVideoElement::webkitDisplayingFullscreen(self->super.super.super.super.super._internal);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return (char)self;
}

- (void)webkitEnterFullscreen
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WebCore::HTMLVideoElement::webkitEnterFullscreen(&v5, self->super.super.super.super.super._internal);
  if (v7)
  {
    unsigned char v8[80] = v5;
    uint64_t v4 = v6;
    uint64_t v6 = 0;
    uint64_t v9 = v4;
    raiseDOMErrorException();
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8, v3);
}

- (void)webkitExitFullscreen
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v4);
  WebCore::HTMLVideoElement::webkitExitFullscreen(self->super.super.super.super.super._internal);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v4, v3);
}

@end