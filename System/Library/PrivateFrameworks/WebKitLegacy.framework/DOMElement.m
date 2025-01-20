@interface DOMElement
+ (id)_DOMElementFromJSContext:(OpaqueJSContext *)a3 value:(OpaqueJSValue *)a4;
- (BOOL)hasAttribute:(NSString *)name;
- (BOOL)hasAttributeNS:(NSString *)namespaceURI localName:(NSString *)localName;
- (BOOL)isFocused;
- (BOOL)matches:(id)a3;
- (BOOL)webkitMatchesSelector:(id)a3;
- (CGRect)boundsInRootViewSpace;
- (DOMAttr)getAttributeNode:(NSString *)name;
- (DOMAttr)getAttributeNodeNS:(NSString *)namespaceURI localName:(NSString *)localName;
- (DOMAttr)removeAttributeNode:(DOMAttr *)oldAttr;
- (DOMAttr)setAttributeNode:(DOMAttr *)newAttr;
- (DOMAttr)setAttributeNodeNS:(DOMAttr *)newAttr;
- (DOMCSSStyleDeclaration)style;
- (DOMElement)firstElementChild;
- (DOMElement)lastElementChild;
- (DOMElement)nextElementSibling;
- (DOMElement)offsetParent;
- (DOMElement)previousElementSibling;
- (DOMElement)querySelector:(NSString *)selectors;
- (DOMNodeList)getElementsByClassName:(NSString *)name;
- (DOMNodeList)getElementsByTagName:(NSString *)name;
- (DOMNodeList)getElementsByTagNameNS:(NSString *)namespaceURI localName:(NSString *)localName;
- (DOMNodeList)querySelectorAll:(NSString *)selectors;
- (NSString)className;
- (NSString)getAttribute:(NSString *)name;
- (NSString)getAttributeNS:(NSString *)namespaceURI localName:(NSString *)localName;
- (NSString)innerHTML;
- (NSString)innerText;
- (NSString)outerHTML;
- (NSString)tagName;
- (__CTFont)_font;
- (id)_getURLAttribute:(id)a3;
- (id)children;
- (id)classList;
- (id)closest:(id)a3;
- (id)uiactions;
- (int)clientHeight;
- (int)clientLeft;
- (int)clientTop;
- (int)clientWidth;
- (int)offsetHeight;
- (int)offsetLeft;
- (int)offsetTop;
- (int)offsetWidth;
- (int)scrollHeight;
- (int)scrollLeft;
- (int)scrollTop;
- (int)scrollWidth;
- (int)structuralComplexityContribution;
- (unsigned)childElementCount;
- (void)blur;
- (void)focus;
- (void)remove;
- (void)removeAttribute:(NSString *)name;
- (void)removeAttributeNS:(NSString *)namespaceURI localName:(NSString *)localName;
- (void)scrollIntoView:(BOOL)alignWithTop;
- (void)scrollIntoViewIfNeeded:(BOOL)centerIfNeeded;
- (void)setAttribute:(NSString *)name value:(NSString *)value;
- (void)setAttributeNS:(NSString *)namespaceURI qualifiedName:(NSString *)qualifiedName value:(NSString *)value;
- (void)setClassName:(NSString *)className;
- (void)setInnerHTML:(NSString *)innerHTML;
- (void)setOuterHTML:(NSString *)outerHTML;
- (void)setScrollLeft:(int)scrollLeft;
- (void)setScrollTop:(int)scrollTop;
- (void)setUiactions:(id)a3;
- (void)webkitRequestFullScreen:(unsigned __int16)flags;
- (void)webkitRequestFullscreen;
@end

@implementation DOMElement

- (__CTFont)_font
{
  uint64_t v2 = core((uint64_t)self);
  if ((*(void *)(v2 + 72) & 0xFFFFFFFFFFFFLL) == 0) {
    return 0;
  }
  if ((*(unsigned char *)((*(void *)(v2 + 72) & 0xFFFFFFFFFFFFLL) + 0x2D) & 2) != 0)
  {
    __break(0xC471u);
    goto LABEL_80;
  }
  v3 = (WebCore::FontCascade *)WebCore::RenderStyle::fontCascade((WebCore::RenderStyle *)((*(void *)(v2 + 72) & 0xFFFFFFFFFFFFLL)
                                                                                        + 80));
  WebCore::FontCascade::protectedFonts(&v33, v3);
  uint64_t v4 = v33;
  uint64_t v5 = *(void *)(v33 + 104);
  if (v5 && *(void *)(v5 + 8)) {
    goto LABEL_66;
  }
  uint64_t v6 = WebCore::FontCascadeFonts::realizeFallbackRangesAt();
  WebCore::FontRanges::glyphDataForCharacter();
  if (!v34 || (uint64_t v8 = *((void *)v34 + 1)) == 0)
  {
    uint64_t v9 = 0;
    goto LABEL_15;
  }
  uint64_t v9 = *(void *)(v8 + 8);
  if (!v9)
  {
    uint64_t v9 = WTF::fastCompactMalloc((WTF *)0x10);
    *(_DWORD *)uint64_t v9 = 1;
    *(void *)(v9 + 8) = v8;
    v10 = *(WTF **)(v8 + 8);
    *(void *)(v8 + 8) = v9;
    if (v10)
    {
      if (*(_DWORD *)v10 == 1)
      {
        WTF::fastFree(v10, v7);
        uint64_t v9 = *(void *)(v8 + 8);
        if (!v9) {
          goto LABEL_15;
        }
      }
      else
      {
        --*(_DWORD *)v10;
      }
    }
  }
  ++*(_DWORD *)v9;
LABEL_15:
  v12 = *(WTF **)(v4 + 104);
  *(void *)(v4 + 104) = v9;
  if (!v12) {
    goto LABEL_18;
  }
  if (*(_DWORD *)v12 != 1)
  {
    --*(_DWORD *)v12;
LABEL_18:
    v13 = v34;
    v34 = 0;
    if (!v13) {
      goto LABEL_23;
    }
    goto LABEL_21;
  }
  WTF::fastFree(v12, v7);
  v13 = v34;
  v34 = 0;
  if (!v13) {
    goto LABEL_23;
  }
LABEL_21:
  if (*(_DWORD *)v13 == 1)
  {
    WTF::fastFree(v13, v7);
    uint64_t v14 = *(void *)(v4 + 104);
    if (!v14) {
      goto LABEL_52;
    }
LABEL_26:
    uint64_t v15 = *(void *)(v14 + 8);
    if (!v15) {
      goto LABEL_52;
    }
    if ((*(unsigned char *)(v15 + 256) & 2) != 0 && *(_DWORD *)(WebCore::FontCascadeFonts::realizeFallbackRangesAt() + 12))
    {
      int v16 = 2;
      do
      {
        WebCore::FontRanges::glyphDataForCharacter();
        if (!v34) {
          goto LABEL_50;
        }
        uint64_t v18 = *((void *)v34 + 1);
        if (!v18)
        {
          v19 = 0;
          goto LABEL_39;
        }
        v19 = *(WTF **)(v18 + 8);
        if (!v19)
        {
          v19 = (WTF *)WTF::fastCompactMalloc((WTF *)0x10);
          *(_DWORD *)v19 = 1;
          *((void *)v19 + 1) = v18;
          v20 = *(WTF **)(v18 + 8);
          *(void *)(v18 + 8) = v19;
          if (v20)
          {
            if (*(_DWORD *)v20 == 1)
            {
              WTF::fastFree(v20, v17);
              v19 = *(WTF **)(v18 + 8);
              if (!v19) {
                goto LABEL_39;
              }
            }
            else
            {
              --*(_DWORD *)v20;
            }
          }
        }
        ++*(_DWORD *)v19;
LABEL_39:
        v21 = v34;
        v34 = 0;
        if (v21)
        {
          if (*(_DWORD *)v21 == 1)
          {
            WTF::fastFree(v21, v17);
            if (!v19) {
              goto LABEL_50;
            }
            goto LABEL_45;
          }
          --*(_DWORD *)v21;
        }
        if (!v19) {
          goto LABEL_50;
        }
LABEL_45:
        uint64_t v22 = *((void *)v19 + 1);
        if (v22 && (*(unsigned char *)(v22 + 256) & 2) == 0)
        {
          v28 = *(WTF **)(v4 + 104);
          *(void *)(v4 + 104) = v19;
          if (!v28) {
            break;
          }
          if (*(_DWORD *)v28 != 1)
          {
            --*(_DWORD *)v28;
            break;
          }
LABEL_65:
          WTF::fastFree(v28, v17);
          break;
        }
        if (*(_DWORD *)v19 == 1) {
          WTF::fastFree(v19, v17);
        }
        else {
          --*(_DWORD *)v19;
        }
LABEL_50:
        ++v16;
      }
      while (*(_DWORD *)(WebCore::FontCascadeFonts::realizeFallbackRangesAt() + 12));
    }
LABEL_66:
    uint64_t v25 = *(void *)(v4 + 104);
    goto LABEL_67;
  }
  --*(_DWORD *)v13;
LABEL_23:
  uint64_t v14 = *(void *)(v4 + 104);
  if (v14) {
    goto LABEL_26;
  }
LABEL_52:
  if (!*(_DWORD *)(v6 + 12))
  {
    __break(0xC471u);
LABEL_80:
    JUMPOUT(0x1E136669CLL);
  }
  uint64_t v23 = WebCore::FontRanges::Range::font();
  uint64_t v24 = v23;
  if (!v23)
  {
    uint64_t v25 = 0;
    goto LABEL_61;
  }
  uint64_t v25 = *(void *)(v23 + 8);
  if (!v25)
  {
    uint64_t v25 = WTF::fastCompactMalloc((WTF *)0x10);
    *(_DWORD *)uint64_t v25 = 1;
    *(void *)(v25 + 8) = v24;
    v26 = *(WTF **)(v24 + 8);
    *(void *)(v24 + 8) = v25;
    if (v26)
    {
      if (*(_DWORD *)v26 == 1)
      {
        WTF::fastFree(v26, v17);
        uint64_t v25 = *(void *)(v24 + 8);
        if (!v25) {
          goto LABEL_61;
        }
      }
      else
      {
        --*(_DWORD *)v26;
      }
    }
  }
  ++*(_DWORD *)v25;
LABEL_61:
  v27 = *(WTF **)(v4 + 104);
  *(void *)(v4 + 104) = v25;
  if (v27)
  {
    if (*(_DWORD *)v27 != 1)
    {
      --*(_DWORD *)v27;
      goto LABEL_66;
    }
    v28 = v27;
    goto LABEL_65;
  }
LABEL_67:
  if (v25)
  {
    uint64_t v29 = *(void *)(v25 + 8);
    v30 = (_DWORD *)v33;
    uint64_t v33 = 0;
    if (!v30) {
      goto LABEL_74;
    }
LABEL_71:
    if (*v30 == 1)
    {
      v31 = (WTF *)MEMORY[0x1E4E46070]();
      WTF::fastFree(v31, v32);
    }
    else
    {
      --*v30;
    }
    goto LABEL_74;
  }
  uint64_t v29 = 0;
  v30 = (_DWORD *)v33;
  uint64_t v33 = 0;
  if (v30) {
    goto LABEL_71;
  }
LABEL_74:
  WebCore::FontCascadeDescription::resolveFontSizeAdjustFromFontIfNeeded();
  return *(__CTFont **)(v29 + 88);
}

- (id)_getURLAttribute:(id)a3
{
  core((uint64_t)self);
  WTF::AtomStringImpl::add((uint64_t *)&v10, (WTF::AtomStringImpl *)a3, v4);
  WebCore::Element::getAttribute();
  WebCore::Document::completeURL();
  uint64_t v6 = (void *)WTF::URL::operator NSURL *();
  v7 = v11;
  v11 = 0;
  if (!v7)
  {
LABEL_4:
    uint64_t v8 = v10;
    v10 = 0;
    if (!v8) {
      return v6;
    }
    goto LABEL_7;
  }
  if (*(_DWORD *)v7 != 2)
  {
    *(_DWORD *)v7 -= 2;
    goto LABEL_4;
  }
  WTF::StringImpl::destroy(v7, v5);
  uint64_t v8 = v10;
  v10 = 0;
  if (!v8) {
    return v6;
  }
LABEL_7:
  if (*(_DWORD *)v8 != 2)
  {
    *(_DWORD *)v8 -= 2;
    return v6;
  }
  WTF::StringImpl::destroy(v8, v5);
  return v6;
}

- (BOOL)isFocused
{
  uint64_t v2 = core((uint64_t)self);
  return *(void *)(*(void *)(*(void *)(v2 + 48) + 8) + 1280) == v2;
}

- (NSString)tagName
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9);
  internal = self->super.super._internal;
  if ((*((_WORD *)internal + 16) & 8) != 0)
  {
    (*(void (**)(WTF::StringImpl **__return_ptr))(*(void *)internal + 104))(&v8);
    if (v8)
    {
      uint64_t v5 = (__CFString *)WTF::StringImpl::operator NSString *();
      uint64_t v6 = v8;
      uint64_t v8 = 0;
      if (v6)
      {
        if (*(_DWORD *)v6 == 2) {
          WTF::StringImpl::destroy(v6, v4);
        }
        else {
          *(_DWORD *)v6 -= 2;
        }
      }
    }
    else
    {
      uint64_t v5 = &stru_1F3C7DA90;
    }
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9, v4);
    return &v5->isa;
  }
  else
  {
    result = (NSString *)96;
    __break(0xC471u);
  }
  return result;
}

- (DOMCSSStyleDeclaration)style
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9);
  internal = self->super.super._internal;
  __int16 v5 = *((_WORD *)internal + 16);
  if ((v5 & 8) != 0)
  {
    if ((v5 & 0x70) != 0)
    {
      uint64_t v6 = (DOMObjectInternal *)WebCore::StyledElement::cssomStyle(internal);
      v7 = (DOMCSSStyleDeclaration *)kit(v6);
    }
    else
    {
      v7 = 0;
    }
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9, v3);
    return v7;
  }
  else
  {
    result = (DOMCSSStyleDeclaration *)96;
    __break(0xC471u);
  }
  return result;
}

- (int)offsetLeft
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  internal = self->super.super._internal;
  if ((*((_WORD *)internal + 16) & 8) != 0)
  {
    int v4 = WebCore::Element::offsetLeftForBindings(internal);
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7, v5);
    return v4;
  }
  else
  {
    int result = 96;
    __break(0xC471u);
  }
  return result;
}

- (int)offsetTop
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  internal = self->super.super._internal;
  if ((*((_WORD *)internal + 16) & 8) != 0)
  {
    int v4 = WebCore::Element::offsetTopForBindings(internal);
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7, v5);
    return v4;
  }
  else
  {
    int result = 96;
    __break(0xC471u);
  }
  return result;
}

- (int)offsetWidth
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  internal = self->super.super._internal;
  if ((*((_WORD *)internal + 16) & 8) != 0)
  {
    int v4 = WebCore::Element::offsetWidth(internal);
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7, v5);
    return v4;
  }
  else
  {
    int result = 96;
    __break(0xC471u);
  }
  return result;
}

- (int)offsetHeight
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  internal = self->super.super._internal;
  if ((*((_WORD *)internal + 16) & 8) != 0)
  {
    int v4 = WebCore::Element::offsetHeight(internal);
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7, v5);
    return v4;
  }
  else
  {
    int result = 96;
    __break(0xC471u);
  }
  return result;
}

- (int)clientLeft
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  internal = self->super.super._internal;
  if ((*((_WORD *)internal + 16) & 8) != 0)
  {
    int v4 = WebCore::Element::clientLeft(internal);
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7, v5);
    return v4;
  }
  else
  {
    int result = 96;
    __break(0xC471u);
  }
  return result;
}

- (int)clientTop
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  internal = self->super.super._internal;
  if ((*((_WORD *)internal + 16) & 8) != 0)
  {
    int v4 = WebCore::Element::clientTop(internal);
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7, v5);
    return v4;
  }
  else
  {
    int result = 96;
    __break(0xC471u);
  }
  return result;
}

- (int)clientWidth
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  internal = self->super.super._internal;
  if ((*((_WORD *)internal + 16) & 8) != 0)
  {
    int v4 = WebCore::Element::clientWidth(internal);
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7, v5);
    return v4;
  }
  else
  {
    int result = 96;
    __break(0xC471u);
  }
  return result;
}

- (int)clientHeight
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  internal = self->super.super._internal;
  if ((*((_WORD *)internal + 16) & 8) != 0)
  {
    int v4 = WebCore::Element::clientHeight(internal);
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7, v5);
    return v4;
  }
  else
  {
    int result = 96;
    __break(0xC471u);
  }
  return result;
}

- (int)scrollLeft
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  internal = self->super.super._internal;
  if ((*((_WORD *)internal + 16) & 8) != 0)
  {
    int v4 = (*(uint64_t (**)(DOMObjectInternal *))(*(void *)internal + 400))(internal);
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7, v5);
    return v4;
  }
  else
  {
    int result = 96;
    __break(0xC471u);
  }
  return result;
}

- (void)setScrollLeft:(int)scrollLeft
{
  uint64_t v3 = *(void *)&scrollLeft;
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  internal = self->super.super._internal;
  if ((*((_WORD *)internal + 16) & 8) != 0)
  {
    (*(void (**)(DOMObjectInternal *, uint64_t))(*(void *)internal + 416))(internal, v3);
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7, v6);
  }
  else
  {
    __break(0xC471u);
  }
}

- (int)scrollTop
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  internal = self->super.super._internal;
  if ((*((_WORD *)internal + 16) & 8) != 0)
  {
    int v4 = (*(uint64_t (**)(DOMObjectInternal *))(*(void *)internal + 408))(internal);
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7, v5);
    return v4;
  }
  else
  {
    int result = 96;
    __break(0xC471u);
  }
  return result;
}

- (void)setScrollTop:(int)scrollTop
{
  uint64_t v3 = *(void *)&scrollTop;
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  internal = self->super.super._internal;
  if ((*((_WORD *)internal + 16) & 8) != 0)
  {
    (*(void (**)(DOMObjectInternal *, uint64_t))(*(void *)internal + 424))(internal, v3);
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7, v6);
  }
  else
  {
    __break(0xC471u);
  }
}

- (int)scrollWidth
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  internal = self->super.super._internal;
  if ((*((_WORD *)internal + 16) & 8) != 0)
  {
    int v4 = (*(uint64_t (**)(DOMObjectInternal *))(*(void *)internal + 432))(internal);
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7, v5);
    return v4;
  }
  else
  {
    int result = 96;
    __break(0xC471u);
  }
  return result;
}

- (int)scrollHeight
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  internal = self->super.super._internal;
  if ((*((_WORD *)internal + 16) & 8) != 0)
  {
    int v4 = (*(uint64_t (**)(DOMObjectInternal *))(*(void *)internal + 440))(internal);
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7, v5);
    return v4;
  }
  else
  {
    int result = 96;
    __break(0xC471u);
  }
  return result;
}

- (DOMElement)offsetParent
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9);
  internal = self->super.super._internal;
  if ((*((_WORD *)internal + 16) & 8) != 0)
  {
    WebCore::Element::offsetParentForBindings((uint64_t *)&v8, internal);
    __int16 v5 = (DOMElement *)kit(v8);
    uint64_t v6 = v8;
    uint64_t v8 = 0;
    if (v6)
    {
      if (*((_DWORD *)v6 + 7) == 2)
      {
        if ((*((_WORD *)v6 + 17) & 0x400) == 0) {
          WebCore::Node::removedLastRef(v6);
        }
      }
      else
      {
        *((_DWORD *)v6 + 7) -= 2;
      }
    }
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9, v4);
    return v5;
  }
  else
  {
    int result = (DOMElement *)96;
    __break(0xC471u);
  }
  return result;
}

- (NSString)innerHTML
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9);
  internal = self->super.super._internal;
  if ((*((_WORD *)internal + 16) & 8) != 0)
  {
    WebCore::Element::innerHTML((uint64_t *)&v8, internal);
    if (v8)
    {
      __int16 v5 = (__CFString *)WTF::StringImpl::operator NSString *();
      uint64_t v6 = v8;
      uint64_t v8 = 0;
      if (v6)
      {
        if (*(_DWORD *)v6 == 2) {
          WTF::StringImpl::destroy(v6, v4);
        }
        else {
          *(_DWORD *)v6 -= 2;
        }
      }
    }
    else
    {
      __int16 v5 = &stru_1F3C7DA90;
    }
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9, v4);
    return &v5->isa;
  }
  else
  {
    int result = (NSString *)96;
    __break(0xC471u);
  }
  return result;
}

- (void)setInnerHTML:(NSString *)innerHTML
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v12);
  if ((*((_WORD *)self->super.super._internal + 16) & 8) == 0)
  {
    __break(0xC471u);
    JUMPOUT(0x1E1388C68);
  }
  MEMORY[0x1E4E442D0](v7, innerHTML);
  int v8 = 1;
  WebCore::Element::setInnerHTML();
  if (v11)
  {
    v13[0] = v9;
    uint64_t v6 = v10;
    uint64_t v10 = 0;
    uint64_t v14 = v6;
    raiseDOMErrorException();
  }
  if (v8 != -1) {
    ((void (*)(unsigned char *, unsigned char *))off_1F3C7A0D8[v8])(v13, v7);
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v12, v5);
}

- (NSString)outerHTML
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9);
  internal = self->super.super._internal;
  if ((*((_WORD *)internal + 16) & 8) != 0)
  {
    WebCore::Element::outerHTML((uint64_t *)&v8, internal);
    if (v8)
    {
      __int16 v5 = (__CFString *)WTF::StringImpl::operator NSString *();
      uint64_t v6 = v8;
      int v8 = 0;
      if (v6)
      {
        if (*(_DWORD *)v6 == 2) {
          WTF::StringImpl::destroy(v6, v4);
        }
        else {
          *(_DWORD *)v6 -= 2;
        }
      }
    }
    else
    {
      __int16 v5 = &stru_1F3C7DA90;
    }
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9, v4);
    return &v5->isa;
  }
  else
  {
    int result = (NSString *)96;
    __break(0xC471u);
  }
  return result;
}

- (void)setOuterHTML:(NSString *)outerHTML
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v12);
  if ((*((_WORD *)self->super.super._internal + 16) & 8) == 0)
  {
    __break(0xC471u);
    JUMPOUT(0x1E1388ED4);
  }
  MEMORY[0x1E4E442D0](v7, outerHTML);
  int v8 = 1;
  WebCore::Element::setOuterHTML();
  if (v11)
  {
    v13[0] = v9;
    uint64_t v6 = v10;
    uint64_t v10 = 0;
    uint64_t v14 = v6;
    raiseDOMErrorException();
  }
  if (v8 != -1) {
    ((void (*)(unsigned char *, unsigned char *))off_1F3C7A0D8[v8])(v13, v7);
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v12, v5);
}

- (NSString)className
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6);
  if ((*((_WORD *)self->super.super._internal + 16) & 8) != 0)
  {
    if (*(void *)WebCore::Element::getAttribute()) {
      int v4 = (__CFString *)WTF::StringImpl::operator NSString *();
    }
    else {
      int v4 = &stru_1F3C7DA90;
    }
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6, v3);
    return &v4->isa;
  }
  else
  {
    int result = (NSString *)96;
    __break(0xC471u);
  }
  return result;
}

- (void)setClassName:(NSString *)className
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9);
  if ((*((_WORD *)self->super.super._internal + 16) & 8) != 0)
  {
    WTF::AtomStringImpl::add((uint64_t *)&v10, (WTF::AtomStringImpl *)className, v5);
    int v8 = v10;
    WebCore::Element::setAttributeWithoutSynchronization();
    if (!v8)
    {
LABEL_5:
      WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9, v6);
      return;
    }
    if (*(_DWORD *)v8 != 2)
    {
      *(_DWORD *)v8 -= 2;
      goto LABEL_5;
    }
    WTF::StringImpl::destroy(v8, v6);
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9, v7);
  }
  else
  {
    __break(0xC471u);
  }
}

- (id)classList
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  internal = self->super.super._internal;
  if ((*((_WORD *)internal + 16) & 8) != 0)
  {
    int v4 = (DOMObjectInternal *)WebCore::Element::classList(internal);
    CFStringRef v5 = kit(v4);
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8, v6);
    return v5;
  }
  else
  {
    id result = (id)96;
    __break(0xC471u);
  }
  return result;
}

- (NSString)innerText
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9);
  internal = self->super.super._internal;
  if ((*((_WORD *)internal + 16) & 8) != 0)
  {
    WebCore::Element::innerText((uint64_t *)&v8, internal);
    if (v8)
    {
      CFStringRef v5 = (__CFString *)WTF::StringImpl::operator NSString *();
      uint64_t v6 = v8;
      int v8 = 0;
      if (v6)
      {
        if (*(_DWORD *)v6 == 2) {
          WTF::StringImpl::destroy(v6, v4);
        }
        else {
          *(_DWORD *)v6 -= 2;
        }
      }
    }
    else
    {
      CFStringRef v5 = &stru_1F3C7DA90;
    }
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9, v4);
    return &v5->isa;
  }
  else
  {
    id result = (NSString *)96;
    __break(0xC471u);
  }
  return result;
}

- (id)uiactions
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6);
  if ((*((_WORD *)self->super.super._internal + 16) & 8) != 0)
  {
    if (*(void *)WebCore::Element::getAttribute()) {
      int v4 = (__CFString *)WTF::StringImpl::operator NSString *();
    }
    else {
      int v4 = &stru_1F3C7DA90;
    }
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6, v3);
    return v4;
  }
  else
  {
    id result = (id)96;
    __break(0xC471u);
  }
  return result;
}

- (void)setUiactions:(id)a3
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9);
  if ((*((_WORD *)self->super.super._internal + 16) & 8) != 0)
  {
    WTF::AtomStringImpl::add((uint64_t *)&v10, (WTF::AtomStringImpl *)a3, v5);
    int v8 = v10;
    WebCore::Element::setAttributeWithoutSynchronization();
    if (!v8)
    {
LABEL_5:
      WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9, v6);
      return;
    }
    if (*(_DWORD *)v8 != 2)
    {
      *(_DWORD *)v8 -= 2;
      goto LABEL_5;
    }
    WTF::StringImpl::destroy(v8, v6);
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9, v7);
  }
  else
  {
    __break(0xC471u);
  }
}

- (DOMElement)previousElementSibling
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  internal = self->super.super._internal;
  if ((*((_WORD *)internal + 16) & 8) != 0)
  {
    int v4 = (WebCore::Node *)WebCore::Node::previousElementSibling(internal);
    CFStringRef v5 = (DOMElement *)kit(v4);
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8, v6);
    return v5;
  }
  else
  {
    id result = (DOMElement *)96;
    __break(0xC471u);
  }
  return result;
}

- (DOMElement)nextElementSibling
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  internal = self->super.super._internal;
  if ((*((_WORD *)internal + 16) & 8) != 0)
  {
    ElementSibling = (WebCore::Node *)WebCore::Node::nextElementSibling(internal);
    CFStringRef v5 = (DOMElement *)kit(ElementSibling);
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8, v6);
    return v5;
  }
  else
  {
    id result = (DOMElement *)96;
    __break(0xC471u);
  }
  return result;
}

- (id)children
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9);
  internal = self->super.super._internal;
  if ((*((_WORD *)internal + 16) & 8) != 0)
  {
    WebCore::ContainerNode::children((uint64_t *)&v8, internal);
    id v5 = kit(v8);
    uint64_t v6 = v8;
    int v8 = 0;
    if (v6)
    {
      if (*((_DWORD *)v6 + 4) == 1) {
        (*(void (**)(DOMObjectInternal *))(*(void *)v6 + 8))(v6);
      }
      else {
        --*((_DWORD *)v6 + 4);
      }
    }
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9, v4);
    return v5;
  }
  else
  {
    id result = (id)96;
    __break(0xC471u);
  }
  return result;
}

- (DOMElement)firstElementChild
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  internal = self->super.super._internal;
  if ((*((_WORD *)internal + 16) & 8) != 0)
  {
    ElementChild = (WebCore::Node *)WebCore::ContainerNode::firstElementChild(internal);
    id v5 = (DOMElement *)kit(ElementChild);
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8, v6);
    return v5;
  }
  else
  {
    id result = (DOMElement *)96;
    __break(0xC471u);
  }
  return result;
}

- (DOMElement)lastElementChild
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  internal = self->super.super._internal;
  if ((*((_WORD *)internal + 16) & 8) != 0)
  {
    ElementChild = (WebCore::Node *)WebCore::ContainerNode::lastElementChild(internal);
    id v5 = (DOMElement *)kit(ElementChild);
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8, v6);
    return v5;
  }
  else
  {
    id result = (DOMElement *)96;
    __break(0xC471u);
  }
  return result;
}

- (unsigned)childElementCount
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  internal = self->super.super._internal;
  if ((*((_WORD *)internal + 16) & 8) != 0)
  {
    unsigned int v4 = WebCore::ContainerNode::childElementCount(internal);
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7, v5);
    return v4;
  }
  else
  {
    unsigned int result = 96;
    __break(0xC471u);
  }
  return result;
}

- (CGRect)boundsInRootViewSpace
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v14);
  internal = self->super.super._internal;
  if ((*((_WORD *)internal + 16) & 8) != 0)
  {
    uint64_t v8 = WebCore::Element::boundsInRootViewSpace(internal);
    double v10 = (double)(int)v9;
    double v11 = (double)SHIDWORD(v8);
    double v12 = (double)(int)v8;
    double v13 = (double)SHIDWORD(v9);
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v14, v9);
    double v3 = v12;
    double v4 = v11;
    double v5 = v10;
    double v6 = v13;
  }
  else
  {
    __break(0xC471u);
  }
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (NSString)getAttribute:(NSString *)name
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v11);
  if ((*((_WORD *)self->super.super._internal + 16) & 8) != 0)
  {
    WTF::AtomStringImpl::add((uint64_t *)&v12, (WTF::AtomStringImpl *)name, v5);
    double v10 = v12;
    if (*(void *)WebCore::Element::getAttribute())
    {
      v7 = (__CFString *)WTF::StringImpl::operator NSString *();
      uint64_t v8 = v10;
      if (!v10) {
        goto LABEL_9;
      }
    }
    else
    {
      v7 = &stru_1F3C7DA90;
      uint64_t v8 = v10;
      if (!v10)
      {
LABEL_9:
        WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v11, v6);
        return &v7->isa;
      }
    }
    if (*(_DWORD *)v8 == 2) {
      WTF::StringImpl::destroy(v8, v6);
    }
    else {
      *(_DWORD *)v8 -= 2;
    }
    goto LABEL_9;
  }
  CGRect result = (NSString *)96;
  __break(0xC471u);
  return result;
}

- (void)setAttribute:(NSString *)name value:(NSString *)value
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v16);
  if ((*((_WORD *)self->super.super._internal + 16) & 8) == 0)
  {
    __break(0xC471u);
    JUMPOUT(0x1E1389BCCLL);
  }
  WTF::AtomStringImpl::add(v17, (WTF::AtomStringImpl *)name, v7);
  double v12 = (WTF::StringImpl *)v17[0];
  WTF::AtomStringImpl::add(v17, (WTF::AtomStringImpl *)value, v8);
  double v11 = (WTF::StringImpl *)v17[0];
  WebCore::Element::setAttribute();
  if (v15)
  {
    LOBYTE(v17[0]) = v13;
    v17[1] = v14;
    raiseDOMErrorException();
  }
  if (v11)
  {
    if (*(_DWORD *)v11 == 2)
    {
      WTF::StringImpl::destroy(v11, v9);
      double v10 = v12;
      if (!v12) {
        goto LABEL_12;
      }
      goto LABEL_9;
    }
    *(_DWORD *)v11 -= 2;
  }
  double v10 = v12;
  if (!v12) {
    goto LABEL_12;
  }
LABEL_9:
  if (*(_DWORD *)v10 == 2) {
    WTF::StringImpl::destroy(v10, v9);
  }
  else {
    *(_DWORD *)v10 -= 2;
  }
LABEL_12:
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v16, v9);
}

- (void)removeAttribute:(NSString *)name
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9);
  if ((*((_WORD *)self->super.super._internal + 16) & 8) != 0)
  {
    WTF::AtomStringImpl::add((uint64_t *)&v10, (WTF::AtomStringImpl *)name, v5);
    CFStringRef v8 = v10;
    WebCore::Element::removeAttribute();
    if (!v8)
    {
LABEL_5:
      WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9, v6);
      return;
    }
    if (*(_DWORD *)v8 != 2)
    {
      *(_DWORD *)v8 -= 2;
      goto LABEL_5;
    }
    WTF::StringImpl::destroy(v8, v6);
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9, v7);
  }
  else
  {
    __break(0xC471u);
  }
}

- (DOMAttr)getAttributeNode:(NSString *)name
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v11);
  if ((*((_WORD *)self->super.super._internal + 16) & 8) != 0)
  {
    WTF::AtomStringImpl::add((uint64_t *)&v12, (WTF::AtomStringImpl *)name, v5);
    char v9 = v12;
    WebCore::Element::getAttributeNode();
    CFStringRef v7 = (DOMAttr *)kit(v10);
    if (v10)
    {
      if (*((_DWORD *)v10 + 7) == 2)
      {
        if ((*((_WORD *)v10 + 17) & 0x400) == 0) {
          WebCore::Node::removedLastRef(v10);
        }
      }
      else
      {
        *((_DWORD *)v10 + 7) -= 2;
      }
    }
    if (v9)
    {
      if (*(_DWORD *)v9 == 2) {
        WTF::StringImpl::destroy(v9, v6);
      }
      else {
        *(_DWORD *)v9 -= 2;
      }
    }
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v11, v6);
    return v7;
  }
  else
  {
    CGRect result = (DOMAttr *)96;
    __break(0xC471u);
  }
  return result;
}

- (DOMAttr)setAttributeNode:(DOMAttr *)newAttr
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v14);
  if (!newAttr) {
    raiseTypeErrorException();
  }
  internal = self->super.super._internal;
  if ((*((_WORD *)internal + 16) & 8) == 0)
  {
    __break(0xC471u);
    goto LABEL_17;
  }
  WebCore::Element::setAttributeNode((uint64_t *)&v11, internal, newAttr->super.super._internal);
  if (v13)
  {
    if (v13 == 1)
    {
      v15[0] = (_BYTE)v11;
      uint64_t v10 = v12;
      uint64_t v12 = 0;
      uint64_t v16 = v10;
      raiseDOMErrorException();
    }
    std::__throw_bad_variant_access[abi:sn180100]();
    __break(1u);
LABEL_17:
    JUMPOUT(0x1E138A02CLL);
  }
  double v6 = v11;
  double v11 = 0;
  CFStringRef v8 = (DOMAttr *)kit(v6);
  if (v6)
  {
    if (*((_DWORD *)v6 + 7) == 2)
    {
      if ((*((_WORD *)v6 + 17) & 0x400) == 0) {
        WebCore::Node::removedLastRef(v6);
      }
    }
    else
    {
      *((_DWORD *)v6 + 7) -= 2;
    }
  }
  if (v13 != -1) {
    ((void (*)(unsigned char *, WebCore::Node **))off_1F3C7A0E8[v13])(v15, &v11);
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v14, v7);
  return v8;
}

- (DOMAttr)removeAttributeNode:(DOMAttr *)oldAttr
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v15);
  if (!oldAttr) {
    raiseTypeErrorException();
  }
  internal = self->super.super._internal;
  if ((*((_WORD *)internal + 16) & 8) == 0)
  {
    __break(0xC471u);
    goto LABEL_17;
  }
  WebCore::Element::removeAttributeNode((uint64_t *)&v11, internal, oldAttr->super.super._internal);
  if (v13)
  {
    if (v13 == 1)
    {
      v16[0] = (_BYTE)v11;
      uint64_t v10 = v12;
      uint64_t v12 = 0;
      uint64_t v17 = v10;
      raiseDOMErrorException();
    }
    std::__throw_bad_variant_access[abi:sn180100]();
    __break(1u);
LABEL_17:
    JUMPOUT(0x1E138A20CLL);
  }
  double v6 = v11;
  double v11 = 0;
  uint64_t v14 = v6;
  CFStringRef v8 = (DOMAttr *)kit(v6);
  if (v6)
  {
    if (*((_DWORD *)v6 + 7) == 2)
    {
      if ((*((_WORD *)v6 + 17) & 0x400) == 0) {
        WebCore::Node::removedLastRef(v6);
      }
    }
    else
    {
      *((_DWORD *)v6 + 7) -= 2;
    }
  }
  if (v13 != -1) {
    ((void (*)(unsigned char *, WebCore::Node **))off_1F3C7A048[v13])(v16, &v11);
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v15, v7);
  return v8;
}

- (DOMNodeList)getElementsByTagName:(NSString *)name
{
  double v3 = (DOMNodeList *)name;
  if (!name) {
    return v3;
  }
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v11);
  if ((*((_WORD *)self->super.super._internal + 16) & 8) != 0)
  {
    WTF::AtomStringImpl::add((uint64_t *)&v12, (WTF::AtomStringImpl *)v3, v5);
    char v9 = v12;
    WebCore::ContainerNode::getElementsByTagName();
    if (v9)
    {
      if (*(_DWORD *)v9 == 2) {
        WTF::StringImpl::destroy(v9, v6);
      }
      else {
        *(_DWORD *)v9 -= 2;
      }
    }
    double v3 = (DOMNodeList *)kit(v10);
    if (v10)
    {
      if (*((_DWORD *)v10 + 4) == 1) {
        (*(void (**)())(*(void *)v10 + 8))();
      }
      else {
        --*((_DWORD *)v10 + 4);
      }
    }
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v11, v7);
    return v3;
  }
  CGRect result = (DOMNodeList *)96;
  __break(0xC471u);
  return result;
}

- (NSString)getAttributeNS:(NSString *)namespaceURI localName:(NSString *)localName
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v16);
  if ((*((_WORD *)self->super.super._internal + 16) & 8) != 0)
  {
    WTF::AtomStringImpl::add((uint64_t *)&v17, (WTF::AtomStringImpl *)namespaceURI, v7);
    char v15 = v17;
    WTF::AtomStringImpl::add((uint64_t *)&v17, (WTF::AtomStringImpl *)localName, v8);
    uint64_t v14 = v17;
    if (*(void *)WebCore::Element::getAttributeNS())
    {
      uint64_t v10 = (__CFString *)WTF::StringImpl::operator NSString *();
      double v11 = v14;
      if (!v14) {
        goto LABEL_8;
      }
    }
    else
    {
      uint64_t v10 = &stru_1F3C7DA90;
      double v11 = v14;
      if (!v14) {
        goto LABEL_8;
      }
    }
    if (*(_DWORD *)v11 == 2)
    {
      WTF::StringImpl::destroy(v11, v9);
      uint64_t v12 = v15;
      if (!v15)
      {
LABEL_14:
        WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v16, v9);
        return &v10->isa;
      }
LABEL_11:
      if (*(_DWORD *)v12 == 2) {
        WTF::StringImpl::destroy(v12, v9);
      }
      else {
        *(_DWORD *)v12 -= 2;
      }
      goto LABEL_14;
    }
    *(_DWORD *)v11 -= 2;
LABEL_8:
    uint64_t v12 = v15;
    if (!v15) {
      goto LABEL_14;
    }
    goto LABEL_11;
  }
  CGRect result = (NSString *)96;
  __break(0xC471u);
  return result;
}

- (void)setAttributeNS:(NSString *)namespaceURI qualifiedName:(NSString *)qualifiedName value:(NSString *)value
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v21);
  if ((*((_WORD *)self->super.super._internal + 16) & 8) == 0)
  {
    __break(0xC471u);
    JUMPOUT(0x1E138A7BCLL);
  }
  WTF::AtomStringImpl::add(v22, (WTF::AtomStringImpl *)namespaceURI, v9);
  uint64_t v17 = (WTF::StringImpl *)v22[0];
  WTF::AtomStringImpl::add(v22, (WTF::AtomStringImpl *)qualifiedName, v10);
  uint64_t v16 = (WTF::StringImpl *)v22[0];
  WTF::AtomStringImpl::add(v22, (WTF::AtomStringImpl *)value, v11);
  char v15 = (WTF::StringImpl *)v22[0];
  WebCore::Element::setAttributeNS();
  if (v20)
  {
    LOBYTE(v22[0]) = v18;
    v22[1] = v19;
    raiseDOMErrorException();
  }
  if (!v15)
  {
LABEL_6:
    int v13 = v16;
    if (!v16) {
      goto LABEL_11;
    }
    goto LABEL_9;
  }
  if (*(_DWORD *)v15 != 2)
  {
    *(_DWORD *)v15 -= 2;
    goto LABEL_6;
  }
  WTF::StringImpl::destroy(v15, v12);
  int v13 = v16;
  if (!v16) {
    goto LABEL_11;
  }
LABEL_9:
  if (*(_DWORD *)v13 == 2)
  {
    WTF::StringImpl::destroy(v13, v12);
    uint64_t v14 = v17;
    if (!v17) {
      goto LABEL_17;
    }
    goto LABEL_14;
  }
  *(_DWORD *)v13 -= 2;
LABEL_11:
  uint64_t v14 = v17;
  if (!v17) {
    goto LABEL_17;
  }
LABEL_14:
  if (*(_DWORD *)v14 == 2) {
    WTF::StringImpl::destroy(v14, v12);
  }
  else {
    *(_DWORD *)v14 -= 2;
  }
LABEL_17:
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v21, v12);
}

- (void)removeAttributeNS:(NSString *)namespaceURI localName:(NSString *)localName
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v13);
  if ((*((_WORD *)self->super.super._internal + 16) & 8) != 0)
  {
    WTF::AtomStringImpl::add((uint64_t *)&v14, (WTF::AtomStringImpl *)namespaceURI, v7);
    uint64_t v12 = v14;
    WTF::AtomStringImpl::add((uint64_t *)&v14, (WTF::AtomStringImpl *)localName, v8);
    CFStringRef v11 = v14;
    WebCore::Element::removeAttributeNS();
    if (v11)
    {
      if (*(_DWORD *)v11 == 2)
      {
        WTF::StringImpl::destroy(v11, v9);
        CFStringRef v10 = v12;
        if (!v12)
        {
LABEL_11:
          WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v13, v9);
          return;
        }
LABEL_8:
        if (*(_DWORD *)v10 == 2) {
          WTF::StringImpl::destroy(v10, v9);
        }
        else {
          *(_DWORD *)v10 -= 2;
        }
        goto LABEL_11;
      }
      *(_DWORD *)v11 -= 2;
    }
    CFStringRef v10 = v12;
    if (!v12) {
      goto LABEL_11;
    }
    goto LABEL_8;
  }
  __break(0xC471u);
}

- (DOMNodeList)getElementsByTagNameNS:(NSString *)namespaceURI localName:(NSString *)localName
{
  double v4 = (DOMNodeList *)localName;
  if (!localName) {
    return v4;
  }
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v16);
  if ((*((_WORD *)self->super.super._internal + 16) & 8) != 0)
  {
    WTF::AtomStringImpl::add((uint64_t *)&v17, (WTF::AtomStringImpl *)namespaceURI, v7);
    uint64_t v14 = v17;
    WTF::AtomStringImpl::add((uint64_t *)&v17, (WTF::AtomStringImpl *)v4, v8);
    int v13 = v17;
    WebCore::ContainerNode::getElementsByTagNameNS();
    if (v13)
    {
      if (*(_DWORD *)v13 == 2)
      {
        WTF::StringImpl::destroy(v13, v9);
        CFStringRef v10 = v14;
        if (!v14)
        {
LABEL_12:
          double v4 = (DOMNodeList *)kit(v15);
          if (v15)
          {
            if (*((_DWORD *)v15 + 4) == 1) {
              (*(void (**)())(*(void *)v15 + 8))();
            }
            else {
              --*((_DWORD *)v15 + 4);
            }
          }
          WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v16, v11);
          return v4;
        }
LABEL_9:
        if (*(_DWORD *)v10 == 2) {
          WTF::StringImpl::destroy(v10, v9);
        }
        else {
          *(_DWORD *)v10 -= 2;
        }
        goto LABEL_12;
      }
      *(_DWORD *)v13 -= 2;
    }
    CFStringRef v10 = v14;
    if (!v14) {
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  CGRect result = (DOMNodeList *)96;
  __break(0xC471u);
  return result;
}

- (DOMAttr)getAttributeNodeNS:(NSString *)namespaceURI localName:(NSString *)localName
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v16);
  if ((*((_WORD *)self->super.super._internal + 16) & 8) != 0)
  {
    WTF::AtomStringImpl::add((uint64_t *)&v17, (WTF::AtomStringImpl *)namespaceURI, v7);
    uint64_t v14 = v17;
    WTF::AtomStringImpl::add((uint64_t *)&v17, (WTF::AtomStringImpl *)localName, v8);
    int v13 = v17;
    WebCore::Element::getAttributeNodeNS();
    CFStringRef v10 = (DOMAttr *)kit(v15);
    if (v15)
    {
      if (*((_DWORD *)v15 + 7) == 2)
      {
        if ((*((_WORD *)v15 + 17) & 0x400) == 0) {
          WebCore::Node::removedLastRef(v15);
        }
      }
      else
      {
        *((_DWORD *)v15 + 7) -= 2;
      }
    }
    if (v13)
    {
      if (*(_DWORD *)v13 == 2)
      {
        WTF::StringImpl::destroy(v13, v9);
        CFStringRef v11 = v14;
        if (!v14)
        {
LABEL_16:
          WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v16, v9);
          return v10;
        }
LABEL_13:
        if (*(_DWORD *)v11 == 2) {
          WTF::StringImpl::destroy(v11, v9);
        }
        else {
          *(_DWORD *)v11 -= 2;
        }
        goto LABEL_16;
      }
      *(_DWORD *)v13 -= 2;
    }
    CFStringRef v11 = v14;
    if (!v14) {
      goto LABEL_16;
    }
    goto LABEL_13;
  }
  CGRect result = (DOMAttr *)96;
  __break(0xC471u);
  return result;
}

- (DOMAttr)setAttributeNodeNS:(DOMAttr *)newAttr
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v14);
  if (!newAttr) {
    raiseTypeErrorException();
  }
  internal = self->super.super._internal;
  if ((*((_WORD *)internal + 16) & 8) == 0)
  {
    __break(0xC471u);
    goto LABEL_17;
  }
  WebCore::Element::setAttributeNodeNS((uint64_t *)&v11, internal, newAttr->super.super._internal);
  if (v13)
  {
    if (v13 == 1)
    {
      v15[0] = (_BYTE)v11;
      uint64_t v10 = v12;
      uint64_t v12 = 0;
      uint64_t v16 = v10;
      raiseDOMErrorException();
    }
    std::__throw_bad_variant_access[abi:sn180100]();
    __break(1u);
LABEL_17:
    JUMPOUT(0x1E138AF84);
  }
  double v6 = v11;
  CFStringRef v11 = 0;
  CFStringRef v8 = (DOMAttr *)kit(v6);
  if (v6)
  {
    if (*((_DWORD *)v6 + 7) == 2)
    {
      if ((*((_WORD *)v6 + 17) & 0x400) == 0) {
        WebCore::Node::removedLastRef(v6);
      }
    }
    else
    {
      *((_DWORD *)v6 + 7) -= 2;
    }
  }
  if (v13 != -1) {
    ((void (*)(unsigned char *, WebCore::Node **))off_1F3C7A0E8[v13])(v15, &v11);
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v14, v7);
  return v8;
}

- (BOOL)hasAttribute:(NSString *)name
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10);
  if ((*((_WORD *)self->super.super._internal + 16) & 8) != 0)
  {
    WTF::AtomStringImpl::add((uint64_t *)&v11, (WTF::AtomStringImpl *)name, v5);
    CFStringRef v9 = v11;
    char hasAttribute = WebCore::Element::hasAttribute();
    if (v9)
    {
      if (*(_DWORD *)v9 == 2) {
        WTF::StringImpl::destroy(v9, v6);
      }
      else {
        *(_DWORD *)v9 -= 2;
      }
    }
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10, v6);
    return hasAttribute;
  }
  else
  {
    BOOL result = 96;
    __break(0xC471u);
  }
  return result;
}

- (BOOL)hasAttributeNS:(NSString *)namespaceURI localName:(NSString *)localName
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v15);
  if ((*((_WORD *)self->super.super._internal + 16) & 8) != 0)
  {
    WTF::AtomStringImpl::add((uint64_t *)&v16, (WTF::AtomStringImpl *)namespaceURI, v7);
    uint64_t v14 = v16;
    WTF::AtomStringImpl::add((uint64_t *)&v16, (WTF::AtomStringImpl *)localName, v8);
    int v13 = v16;
    char hasAttributeNS = WebCore::Element::hasAttributeNS();
    if (v13)
    {
      if (*(_DWORD *)v13 == 2)
      {
        WTF::StringImpl::destroy(v13, v9);
        CFStringRef v11 = v14;
        if (!v14)
        {
LABEL_11:
          WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v15, v9);
          return hasAttributeNS;
        }
LABEL_8:
        if (*(_DWORD *)v11 == 2) {
          WTF::StringImpl::destroy(v11, v9);
        }
        else {
          *(_DWORD *)v11 -= 2;
        }
        goto LABEL_11;
      }
      *(_DWORD *)v13 -= 2;
    }
    CFStringRef v11 = v14;
    if (!v14) {
      goto LABEL_11;
    }
    goto LABEL_8;
  }
  BOOL result = 96;
  __break(0xC471u);
  return result;
}

- (void)focus
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  internal = self->super.super._internal;
  if ((*((_WORD *)internal + 16) & 8) != 0)
  {
    __int16 v6 = 0;
    int v5 = 0;
    (*(void (**)(DOMObjectInternal *, int *))(*(void *)internal + 656))(internal, &v5);
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7, v4);
  }
  else
  {
    __break(0xC471u);
  }
}

- (void)blur
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  internal = self->super.super._internal;
  if ((*((_WORD *)internal + 16) & 8) != 0)
  {
    (*(void (**)(DOMObjectInternal *))(*(void *)internal + 688))(internal);
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v4);
  }
  else
  {
    __break(0xC471u);
  }
}

- (void)scrollIntoView:(BOOL)alignWithTop
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6);
  internal = self->super.super._internal;
  if ((*((_WORD *)internal + 16) & 8) != 0)
  {
    WebCore::Element::scrollIntoView(internal);
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6, v5);
  }
  else
  {
    __break(0xC471u);
  }
}

- (void)scrollIntoViewIfNeeded:(BOOL)centerIfNeeded
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6);
  internal = self->super.super._internal;
  if ((*((_WORD *)internal + 16) & 8) != 0)
  {
    WebCore::Element::scrollIntoViewIfNeeded(internal);
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6, v5);
  }
  else
  {
    __break(0xC471u);
  }
}

- (DOMNodeList)getElementsByClassName:(NSString *)name
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v12);
  if ((*((_WORD *)self->super.super._internal + 16) & 8) != 0)
  {
    WTF::AtomStringImpl::add((uint64_t *)&v13, (WTF::AtomStringImpl *)name, v5);
    uint64_t v10 = v13;
    WebCore::ContainerNode::getElementsByClassName();
    if (v10)
    {
      if (*(_DWORD *)v10 == 2) {
        WTF::StringImpl::destroy(v10, v6);
      }
      else {
        *(_DWORD *)v10 -= 2;
      }
    }
    CFStringRef v8 = (DOMNodeList *)kit(v11);
    if (v11)
    {
      if (*((_DWORD *)v11 + 4) == 1) {
        (*(void (**)())(*(void *)v11 + 8))();
      }
      else {
        --*((_DWORD *)v11 + 4);
      }
    }
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v12, v7);
    return v8;
  }
  else
  {
    BOOL result = (DOMNodeList *)96;
    __break(0xC471u);
  }
  return result;
}

- (BOOL)matches:(id)a3
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v15);
  internal = self->super.super._internal;
  if ((*((_WORD *)internal + 16) & 8) == 0)
  {
    __break(0xC471u);
    goto LABEL_12;
  }
  MEMORY[0x1E4E442D0](&v11, a3);
  WebCore::Element::matches(&v12, internal, (const WTF::String *)&v11);
  if (v14)
  {
    if (v14 == 1)
    {
      unsigned char v15[80] = v12;
      uint64_t v10 = v13;
      uint64_t v13 = 0;
      uint64_t v16 = v10;
      raiseDOMErrorException();
    }
    std::__throw_bad_variant_access[abi:sn180100]();
    __break(1u);
LABEL_12:
    JUMPOUT(0x1E138B82CLL);
  }
  int v7 = v12;
  int v14 = -1;
  CFStringRef v8 = v11;
  CFStringRef v11 = 0;
  if (v8)
  {
    if (*(_DWORD *)v8 == 2) {
      WTF::StringImpl::destroy(v8, v6);
    }
    else {
      *(_DWORD *)v8 -= 2;
    }
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v15, v6);
  return v7 != 0;
}

- (id)closest:(id)a3
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v15);
  internal = self->super.super._internal;
  if ((*((_WORD *)internal + 16) & 8) == 0)
  {
    __break(0xC471u);
    goto LABEL_14;
  }
  MEMORY[0x1E4E442D0](&v11, a3);
  WebCore::Element::closest((uint64_t *)&v12, internal, (const WTF::String *)&v11);
  if (v14)
  {
    if (v14 == 1)
    {
      v16[0] = (_BYTE)v12;
      uint64_t v10 = v13;
      uint64_t v13 = 0;
      uint64_t v17 = v10;
      raiseDOMErrorException();
    }
    std::__throw_bad_variant_access[abi:sn180100]();
    __break(1u);
LABEL_14:
    JUMPOUT(0x1E138BA04);
  }
  int v7 = kit(v12);
  if (v14 != -1) {
    ((void (*)(unsigned char *, WebCore::Node **))off_1F3C7A0B8[v14])(v16, &v12);
  }
  int v14 = -1;
  CFStringRef v8 = v11;
  CFStringRef v11 = 0;
  if (v8)
  {
    if (*(_DWORD *)v8 == 2) {
      WTF::StringImpl::destroy(v8, v6);
    }
    else {
      *(_DWORD *)v8 -= 2;
    }
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v15, v6);
  return v7;
}

- (BOOL)webkitMatchesSelector:(id)a3
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v15);
  internal = self->super.super._internal;
  if ((*((_WORD *)internal + 16) & 8) == 0)
  {
    __break(0xC471u);
    goto LABEL_12;
  }
  MEMORY[0x1E4E442D0](&v11, a3);
  WebCore::Element::matches(&v12, internal, (const WTF::String *)&v11);
  if (v14)
  {
    if (v14 == 1)
    {
      unsigned char v15[80] = v12;
      uint64_t v10 = v13;
      uint64_t v13 = 0;
      uint64_t v16 = v10;
      raiseDOMErrorException();
    }
    std::__throw_bad_variant_access[abi:sn180100]();
    __break(1u);
LABEL_12:
    JUMPOUT(0x1E138BBB8);
  }
  int v7 = v12;
  int v14 = -1;
  CFStringRef v8 = v11;
  CFStringRef v11 = 0;
  if (v8)
  {
    if (*(_DWORD *)v8 == 2) {
      WTF::StringImpl::destroy(v8, v6);
    }
    else {
      *(_DWORD *)v8 -= 2;
    }
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v15, v6);
  return v7 != 0;
}

- (void)webkitRequestFullScreen:(unsigned __int16)flags
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6);
  internal = self->super.super._internal;
  if ((*((_WORD *)internal + 16) & 8) != 0)
  {
    WebCore::Element::webkitRequestFullscreen(internal);
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6, v5);
  }
  else
  {
    __break(0xC471u);
  }
}

- (void)webkitRequestFullscreen
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  internal = self->super.super._internal;
  if ((*((_WORD *)internal + 16) & 8) != 0)
  {
    WebCore::Element::webkitRequestFullscreen(internal);
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v4);
  }
  else
  {
    __break(0xC471u);
  }
}

- (void)remove
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9);
  internal = self->super.super._internal;
  if ((*((_WORD *)internal + 16) & 8) == 0)
  {
    __break(0xC471u);
    JUMPOUT(0x1E138BE20);
  }
  WebCore::Node::remove(&v6, internal);
  if (v8)
  {
    unsigned char v9[80] = v6;
    uint64_t v5 = v7;
    uint64_t v7 = 0;
    uint64_t v10 = v5;
    raiseDOMErrorException();
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9, v4);
}

- (DOMElement)querySelector:(NSString *)selectors
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v15);
  internal = self->super.super._internal;
  if ((*((_WORD *)internal + 16) & 8) == 0)
  {
    __break(0xC471u);
    goto LABEL_14;
  }
  MEMORY[0x1E4E442D0](&v11, selectors);
  WebCore::ContainerNode::querySelector((uint64_t *)&v12, internal, (const WTF::String *)&v11);
  if (v14)
  {
    if (v14 == 1)
    {
      v16[0] = (_BYTE)v12;
      uint64_t v10 = v13;
      uint64_t v13 = 0;
      uint64_t v17 = v10;
      raiseDOMErrorException();
    }
    std::__throw_bad_variant_access[abi:sn180100]();
    __break(1u);
LABEL_14:
    JUMPOUT(0x1E138BF84);
  }
  uint64_t v7 = (DOMElement *)kit(v12);
  if (v14 != -1) {
    ((void (*)(unsigned char *, WebCore::Node **))off_1F3C7A0B8[v14])(v16, &v12);
  }
  int v14 = -1;
  char v8 = v11;
  CFStringRef v11 = 0;
  if (v8)
  {
    if (*(_DWORD *)v8 == 2) {
      WTF::StringImpl::destroy(v8, v6);
    }
    else {
      *(_DWORD *)v8 -= 2;
    }
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v15, v6);
  return v7;
}

- (DOMNodeList)querySelectorAll:(NSString *)selectors
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v17);
  internal = self->super.super._internal;
  if ((*((_WORD *)internal + 16) & 8) == 0)
  {
    __break(0xC471u);
    goto LABEL_19;
  }
  MEMORY[0x1E4E442D0](&v13, selectors);
  WebCore::ContainerNode::querySelectorAll((uint64_t *)&v14, internal, (const WTF::String *)&v13);
  if (v16)
  {
    if (v16 == 1)
    {
      v18[0] = (char)v14;
      uint64_t v12 = v15;
      uint64_t v15 = 0;
      uint64_t v19 = v12;
      raiseDOMErrorException();
    }
    std::__throw_bad_variant_access[abi:sn180100]();
    __break(1u);
LABEL_19:
    JUMPOUT(0x1E138C1B0);
  }
  uint64_t v6 = v14;
  int v14 = 0;
  char v8 = (DOMNodeList *)kit(v6);
  if (!v6) {
    goto LABEL_6;
  }
  if (*((_DWORD *)v6 + 4) != 1)
  {
    --*((_DWORD *)v6 + 4);
LABEL_6:
    uint64_t v9 = v16;
    if (v16 == -1) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  (*(void (**)(DOMObjectInternal *))(*(void *)v6 + 8))(v6);
  uint64_t v9 = v16;
  if (v16 != -1) {
LABEL_7:
  }
    ((void (*)(char *, DOMObjectInternal **))off_1F3C7A0C8[v9])(v18, &v14);
LABEL_8:
  unsigned int v16 = -1;
  uint64_t v10 = v13;
  uint64_t v13 = 0;
  if (v10)
  {
    if (*(_DWORD *)v10 == 2) {
      WTF::StringImpl::destroy(v10, v7);
    }
    else {
      *(_DWORD *)v10 -= 2;
    }
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v17, v7);
  return v8;
}

- (int)structuralComplexityContribution
{
  return 0;
}

+ (id)_DOMElementFromJSContext:(OpaqueJSContext *)a3 value:(OpaqueJSValue *)a4
{
  double v4 = 0;
  if (a3 && a4)
  {
    JSC::JSLockHolder::JSLockHolder();
    uint64_t v5 = (WebCore::Node *)WebCore::JSElement::toWrapped();
    double v4 = kit(v5);
    MEMORY[0x1E4E43B10](v7);
  }
  return v4;
}

@end