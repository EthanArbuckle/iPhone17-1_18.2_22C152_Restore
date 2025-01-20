@interface DOMHTMLDocument
- (DOMDocumentFragment)createDocumentFragmentWithMarkupString:(NSString *)markupString baseURL:(NSURL *)baseURL;
- (DOMDocumentFragment)createDocumentFragmentWithText:(NSString *)text;
- (DOMHTMLCollection)embeds;
- (DOMHTMLCollection)plugins;
- (DOMHTMLCollection)scripts;
- (NSString)alinkColor;
- (NSString)bgColor;
- (NSString)compatMode;
- (NSString)designMode;
- (NSString)dir;
- (NSString)fgColor;
- (NSString)linkColor;
- (NSString)vlinkColor;
- (id)_createDocumentFragmentWithMarkupString:(id)a3 baseURLString:(id)a4;
- (int)height;
- (int)width;
- (void)captureEvents;
- (void)clear;
- (void)close;
- (void)open;
- (void)releaseEvents;
- (void)setAlinkColor:(NSString *)alinkColor;
- (void)setBgColor:(NSString *)bgColor;
- (void)setDesignMode:(NSString *)designMode;
- (void)setDir:(NSString *)dir;
- (void)setFgColor:(NSString *)fgColor;
- (void)setLinkColor:(NSString *)linkColor;
- (void)setVlinkColor:(NSString *)vlinkColor;
- (void)write:(NSString *)text;
- (void)writeln:(NSString *)text;
@end

@implementation DOMHTMLDocument

- (DOMDocumentFragment)createDocumentFragmentWithMarkupString:(NSString *)markupString baseURL:(NSURL *)baseURL
{
  MEMORY[0x1E4E442D0](&v12, markupString);
  MEMORY[0x1E4E442D0](&v11, [(NSURL *)baseURL absoluteString]);
  WebCore::createFragmentFromMarkup();
  v6 = (DOMDocumentFragment *)kit(v13);
  v7 = v13;
  v13 = 0;
  if (v7)
  {
    if (*((_DWORD *)v7 + 7) == 2)
    {
      if ((*((_WORD *)v7 + 17) & 0x400) == 0) {
        WebCore::Node::removedLastRef(v7);
      }
    }
    else
    {
      *((_DWORD *)v7 + 7) -= 2;
    }
  }
  v8 = v11;
  v11 = 0;
  if (!v8)
  {
LABEL_9:
    v9 = v12;
    v12 = 0;
    if (!v9) {
      return v6;
    }
    goto LABEL_12;
  }
  if (*(_DWORD *)v8 != 2)
  {
    *(_DWORD *)v8 -= 2;
    goto LABEL_9;
  }
  WTF::StringImpl::destroy(v8, v5);
  v9 = v12;
  v12 = 0;
  if (!v9) {
    return v6;
  }
LABEL_12:
  if (*(_DWORD *)v9 != 2)
  {
    *(_DWORD *)v9 -= 2;
    return v6;
  }
  WTF::StringImpl::destroy(v9, v5);
  return v6;
}

- (DOMDocumentFragment)createDocumentFragmentWithText:(NSString *)text
{
  WebCore::makeRangeSelectingNodeContents((uint64_t *)v13, self->super.super.super._internal, (Node *)a2);
  MEMORY[0x1E4E442D0](&v12, text);
  WebCore::createFragmentFromText((uint64_t *)&v15, (WebCore *)v13, (const WebCore::SimpleRange *)&v12, v4);
  v6 = (DOMDocumentFragment *)kit(v15);
  v7 = v15;
  v15 = 0;
  if (v7)
  {
    if (*((_DWORD *)v7 + 7) == 2)
    {
      if ((*((_WORD *)v7 + 17) & 0x400) == 0) {
        WebCore::Node::removedLastRef(v7);
      }
    }
    else
    {
      *((_DWORD *)v7 + 7) -= 2;
    }
  }
  v8 = v12;
  v12 = 0;
  if (!v8)
  {
LABEL_9:
    v9 = v14;
    v14 = 0;
    if (!v9) {
      goto LABEL_16;
    }
    goto LABEL_12;
  }
  if (*(_DWORD *)v8 != 2)
  {
    *(_DWORD *)v8 -= 2;
    goto LABEL_9;
  }
  WTF::StringImpl::destroy(v8, v5);
  v9 = v14;
  v14 = 0;
  if (!v9) {
    goto LABEL_16;
  }
LABEL_12:
  if (*((_DWORD *)v9 + 7) == 2)
  {
    if ((*((_WORD *)v9 + 17) & 0x400) == 0) {
      WebCore::Node::removedLastRef(v9);
    }
  }
  else
  {
    *((_DWORD *)v9 + 7) -= 2;
  }
LABEL_16:
  v10 = v13[0];
  v13[0] = 0;
  if (!v10) {
    return v6;
  }
  if (*((_DWORD *)v10 + 7) != 2)
  {
    *((_DWORD *)v10 + 7) -= 2;
    return v6;
  }
  if ((*((_WORD *)v10 + 17) & 0x400) != 0) {
    return v6;
  }
  WebCore::Node::removedLastRef(v10);
  return v6;
}

- (id)_createDocumentFragmentWithMarkupString:(id)a3 baseURLString:(id)a4
{
  MEMORY[0x1E4E442D0](&v11, a4);
  WebCore::Document::completeURL();
  uint64_t v7 = WTF::URL::operator NSURL *();
  v8 = v12;
  v12 = 0;
  if (v8)
  {
    if (*(_DWORD *)v8 == 2)
    {
      WTF::StringImpl::destroy(v8, v6);
      v9 = v11;
      v11 = 0;
      if (!v9) {
        return -[DOMHTMLDocument createDocumentFragmentWithMarkupString:baseURL:](self, "createDocumentFragmentWithMarkupString:baseURL:", a3, v7, v11, v12);
      }
      goto LABEL_7;
    }
    *(_DWORD *)v8 -= 2;
  }
  v9 = v11;
  v11 = 0;
  if (!v9) {
    return -[DOMHTMLDocument createDocumentFragmentWithMarkupString:baseURL:](self, "createDocumentFragmentWithMarkupString:baseURL:", a3, v7, v11, v12);
  }
LABEL_7:
  if (*(_DWORD *)v9 == 2) {
    WTF::StringImpl::destroy(v9, v6);
  }
  else {
    *(_DWORD *)v9 -= 2;
  }
  return -[DOMHTMLDocument createDocumentFragmentWithMarkupString:baseURL:](self, "createDocumentFragmentWithMarkupString:baseURL:", a3, v7, v11, v12);
}

- (DOMHTMLCollection)embeds
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  MEMORY[0x1E4E48860](&v7, self->super.super.super._internal);
  v4 = (DOMHTMLCollection *)kit(v7);
  v5 = v7;
  uint64_t v7 = 0;
  if (v5)
  {
    if (*((_DWORD *)v5 + 4) == 1) {
      (*(void (**)(DOMObjectInternal *))(*(void *)v5 + 8))(v5);
    }
    else {
      --*((_DWORD *)v5 + 4);
    }
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8, v3);
  return v4;
}

- (DOMHTMLCollection)plugins
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  MEMORY[0x1E4E48860](&v7, self->super.super.super._internal);
  v4 = (DOMHTMLCollection *)kit(v7);
  v5 = v7;
  uint64_t v7 = 0;
  if (v5)
  {
    if (*((_DWORD *)v5 + 4) == 1) {
      (*(void (**)(DOMObjectInternal *))(*(void *)v5 + 8))(v5);
    }
    else {
      --*((_DWORD *)v5 + 4);
    }
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8, v3);
  return v4;
}

- (DOMHTMLCollection)scripts
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  MEMORY[0x1E4E488B0](&v7, self->super.super.super._internal);
  v4 = (DOMHTMLCollection *)kit(v7);
  v5 = v7;
  uint64_t v7 = 0;
  if (v5)
  {
    if (*((_DWORD *)v5 + 4) == 1) {
      (*(void (**)(DOMObjectInternal *))(*(void *)v5 + 8))(v5);
    }
    else {
      --*((_DWORD *)v5 + 4);
    }
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8, v3);
  return v4;
}

- (int)width
{
  return 0;
}

- (int)height
{
  return 0;
}

- (NSString)dir
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6);
  if (*(void *)WebCore::Document::dir(self->super.super.super._internal)) {
    v4 = (__CFString *)WTF::StringImpl::operator NSString *();
  }
  else {
    v4 = &stru_1F3C7DA90;
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6, v3);
  return &v4->isa;
}

- (void)setDir:(NSString *)dir
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WTF::AtomStringImpl::add((uint64_t *)&v9, (WTF::AtomStringImpl *)dir, v4);
  uint64_t v7 = v9;
  WebCore::Document::setDir();
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

- (NSString)designMode
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WebCore::Document::designMode((uint64_t *)&v7, self->super.super.super._internal);
  if (v7)
  {
    CFStringRef v4 = (__CFString *)WTF::StringImpl::operator NSString *();
    v5 = v7;
    uint64_t v7 = 0;
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
    CFStringRef v4 = &stru_1F3C7DA90;
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8, v3);
  return &v4->isa;
}

- (void)setDesignMode:(NSString *)designMode
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10);
  internal = self->super.super.super._internal;
  MEMORY[0x1E4E442D0](&v9, designMode);
  WebCore::Document::setDesignMode(internal, (const WTF::String *)&v9);
  uint64_t v7 = v9;
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

- (NSString)compatMode
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WebCore::Document::compatMode((uint64_t *)&v7, self->super.super.super._internal);
  if (v7)
  {
    CFStringRef v4 = (__CFString *)WTF::StringImpl::operator NSString *();
    v5 = v7;
    uint64_t v7 = 0;
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
    CFStringRef v4 = &stru_1F3C7DA90;
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8, v3);
  return &v4->isa;
}

- (NSString)bgColor
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6);
  if (*(void *)WebCore::Document::bgColor(self->super.super.super._internal)) {
    CFStringRef v4 = (__CFString *)WTF::StringImpl::operator NSString *();
  }
  else {
    CFStringRef v4 = &stru_1F3C7DA90;
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6, v3);
  return &v4->isa;
}

- (void)setBgColor:(NSString *)bgColor
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WTF::AtomStringImpl::add((uint64_t *)&v9, (WTF::AtomStringImpl *)bgColor, v4);
  uint64_t v7 = v9;
  WebCore::Document::setBgColor();
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

- (NSString)fgColor
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6);
  if (*(void *)WebCore::Document::fgColor(self->super.super.super._internal)) {
    CFStringRef v4 = (__CFString *)WTF::StringImpl::operator NSString *();
  }
  else {
    CFStringRef v4 = &stru_1F3C7DA90;
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6, v3);
  return &v4->isa;
}

- (void)setFgColor:(NSString *)fgColor
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WTF::AtomStringImpl::add((uint64_t *)&v9, (WTF::AtomStringImpl *)fgColor, v4);
  uint64_t v7 = v9;
  WebCore::Document::setFgColor();
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

- (NSString)alinkColor
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6);
  if (*(void *)WebCore::Document::alinkColor(self->super.super.super._internal)) {
    CFStringRef v4 = (__CFString *)WTF::StringImpl::operator NSString *();
  }
  else {
    CFStringRef v4 = &stru_1F3C7DA90;
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6, v3);
  return &v4->isa;
}

- (void)setAlinkColor:(NSString *)alinkColor
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WTF::AtomStringImpl::add((uint64_t *)&v9, (WTF::AtomStringImpl *)alinkColor, v4);
  uint64_t v7 = v9;
  WebCore::Document::setAlinkColor();
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

- (NSString)linkColor
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6);
  if (*(void *)WebCore::Document::linkColorForBindings(self->super.super.super._internal)) {
    CFStringRef v4 = (__CFString *)WTF::StringImpl::operator NSString *();
  }
  else {
    CFStringRef v4 = &stru_1F3C7DA90;
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6, v3);
  return &v4->isa;
}

- (void)setLinkColor:(NSString *)linkColor
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WTF::AtomStringImpl::add((uint64_t *)&v9, (WTF::AtomStringImpl *)linkColor, v4);
  uint64_t v7 = v9;
  WebCore::Document::setLinkColorForBindings();
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

- (NSString)vlinkColor
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6);
  if (*(void *)WebCore::Document::vlinkColor(self->super.super.super._internal)) {
    CFStringRef v4 = (__CFString *)WTF::StringImpl::operator NSString *();
  }
  else {
    CFStringRef v4 = &stru_1F3C7DA90;
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6, v3);
  return &v4->isa;
}

- (void)setVlinkColor:(NSString *)vlinkColor
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WTF::AtomStringImpl::add((uint64_t *)&v9, (WTF::AtomStringImpl *)vlinkColor, v4);
  uint64_t v7 = v9;
  WebCore::Document::setVlinkColor();
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

- (void)open
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9);
  WebCore::Document::open(&v6, self->super.super.super._internal, 0);
  if (!v8) {
    goto LABEL_5;
  }
  CFStringRef v4 = v7;
  uint64_t v7 = 0;
  if (!v4) {
    goto LABEL_5;
  }
  if (*(_DWORD *)v4 != 2)
  {
    *(_DWORD *)v4 -= 2;
LABEL_5:
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9, v3);
    return;
  }
  WTF::StringImpl::destroy(v4, v3);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9, v5);
}

- (void)close
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v4);
  WebCore::Document::close(self->super.super.super._internal);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v4, v3);
}

- (void)write:(NSString *)text
{
  v17[1] = *MEMORY[0x1E4F143B8];
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v16);
  MEMORY[0x1E4E442D0](v17, text);
  uint64_t v4 = WTF::fastMalloc((WTF *)0x10);
  *(_DWORD *)uint64_t v4 = 1;
  *(void *)(v4 + 8) = 0;
  v13 = (WTF *)v4;
  uint64_t v5 = v17[0];
  if (v17[0]) {
    *(_DWORD *)v17[0] += 2;
  }
  *(void *)(v4 + 8) = v5;
  WebCore::Document::write();
  if (v15 && v14)
  {
    if (*(_DWORD *)v14 == 2)
    {
      WTF::StringImpl::destroy(v14, v6);
      uint64_t v7 = v13;
      if (!v13) {
        goto LABEL_16;
      }
      goto LABEL_8;
    }
    *(_DWORD *)v14 -= 2;
  }
  uint64_t v7 = v13;
  if (!v13) {
    goto LABEL_16;
  }
LABEL_8:
  v9 = (WTF::StringImpl **)((char *)v7 + 8);
  uint64_t v8 = *(unsigned int *)v7;
  if (v8)
  {
    uint64_t v10 = 8 * v8;
    do
    {
      v11 = *v9;
      WTF::StringImpl *v9 = 0;
      if (v11)
      {
        if (*(_DWORD *)v11 == 2) {
          WTF::StringImpl::destroy(v11, v6);
        }
        else {
          *(_DWORD *)v11 -= 2;
        }
      }
      ++v9;
      v10 -= 8;
    }
    while (v10);
  }
  WTF::fastFree(v7, v6);
LABEL_16:
  v12 = (WTF::StringImpl *)v17[0];
  v17[0] = 0;
  if (v12)
  {
    if (*(_DWORD *)v12 == 2) {
      WTF::StringImpl::destroy(v12, v6);
    }
    else {
      *(_DWORD *)v12 -= 2;
    }
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v16, v6);
}

- (void)writeln:(NSString *)text
{
  v17[1] = *MEMORY[0x1E4F143B8];
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v16);
  MEMORY[0x1E4E442D0](v17, text);
  uint64_t v4 = WTF::fastMalloc((WTF *)0x10);
  *(_DWORD *)uint64_t v4 = 1;
  *(void *)(v4 + 8) = 0;
  v13 = (WTF *)v4;
  uint64_t v5 = v17[0];
  if (v17[0]) {
    *(_DWORD *)v17[0] += 2;
  }
  *(void *)(v4 + 8) = v5;
  WebCore::Document::writeln();
  if (v15 && v14)
  {
    if (*(_DWORD *)v14 == 2)
    {
      WTF::StringImpl::destroy(v14, v6);
      uint64_t v7 = v13;
      if (!v13) {
        goto LABEL_16;
      }
      goto LABEL_8;
    }
    *(_DWORD *)v14 -= 2;
  }
  uint64_t v7 = v13;
  if (!v13) {
    goto LABEL_16;
  }
LABEL_8:
  v9 = (WTF::StringImpl **)((char *)v7 + 8);
  uint64_t v8 = *(unsigned int *)v7;
  if (v8)
  {
    uint64_t v10 = 8 * v8;
    do
    {
      v11 = *v9;
      WTF::StringImpl *v9 = 0;
      if (v11)
      {
        if (*(_DWORD *)v11 == 2) {
          WTF::StringImpl::destroy(v11, v6);
        }
        else {
          *(_DWORD *)v11 -= 2;
        }
      }
      ++v9;
      v10 -= 8;
    }
    while (v10);
  }
  WTF::fastFree(v7, v6);
LABEL_16:
  v12 = (WTF::StringImpl *)v17[0];
  v17[0] = 0;
  if (v12)
  {
    if (*(_DWORD *)v12 == 2) {
      WTF::StringImpl::destroy(v12, v6);
    }
    else {
      *(_DWORD *)v12 -= 2;
    }
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v16, v6);
}

- (void)clear
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v3);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v3, v2);
}

- (void)captureEvents
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v3);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v3, v2);
}

- (void)releaseEvents
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v3);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v3, v2);
}

@end