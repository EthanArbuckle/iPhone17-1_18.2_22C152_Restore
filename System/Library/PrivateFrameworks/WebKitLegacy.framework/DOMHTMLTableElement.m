@interface DOMHTMLTableElement
- (DOMHTMLCollection)rows;
- (DOMHTMLCollection)tBodies;
- (DOMHTMLElement)createCaption;
- (DOMHTMLElement)createTFoot;
- (DOMHTMLElement)createTHead;
- (DOMHTMLElement)insertRow:(int)index;
- (DOMHTMLTableCaptionElement)caption;
- (DOMHTMLTableSectionElement)tFoot;
- (DOMHTMLTableSectionElement)tHead;
- (NSString)align;
- (NSString)bgColor;
- (NSString)border;
- (NSString)cellPadding;
- (NSString)cellSpacing;
- (NSString)frameBorders;
- (NSString)rules;
- (NSString)summary;
- (NSString)width;
- (id)createTBody;
- (int)structuralComplexityContribution;
- (void)deleteCaption;
- (void)deleteRow:(int)index;
- (void)deleteTFoot;
- (void)deleteTHead;
- (void)setAlign:(NSString *)align;
- (void)setBgColor:(NSString *)bgColor;
- (void)setBorder:(NSString *)border;
- (void)setCaption:(DOMHTMLTableCaptionElement *)caption;
- (void)setCellPadding:(NSString *)cellPadding;
- (void)setCellSpacing:(NSString *)cellSpacing;
- (void)setFrameBorders:(NSString *)frameBorders;
- (void)setRules:(NSString *)rules;
- (void)setSummary:(NSString *)summary;
- (void)setTFoot:(DOMHTMLTableSectionElement *)tFoot;
- (void)setTHead:(DOMHTMLTableSectionElement *)tHead;
- (void)setWidth:(NSString *)width;
@end

@implementation DOMHTMLTableElement

- (DOMHTMLTableCaptionElement)caption
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WebCore::HTMLTableElement::caption((uint64_t *)&v7, self->super.super.super.super._internal);
  v4 = (DOMHTMLTableCaptionElement *)kit(v7);
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

- (void)setCaption:(DOMHTMLTableCaptionElement *)caption
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v11);
  if (caption)
  {
    internal = caption->super.super.super.super._internal;
    if (internal) {
      *((_DWORD *)internal + 7) += 2;
    }
  }
  else
  {
    internal = 0;
  }
  v7 = internal;
  WebCore::HTMLTableElement::setCaption();
  if (v10)
  {
    v11[80] = v8;
    uint64_t v12 = v9;
    raiseDOMErrorException();
  }
  if (!v7) {
    goto LABEL_9;
  }
  if (*((_DWORD *)v7 + 7) != 2)
  {
    *((_DWORD *)v7 + 7) -= 2;
LABEL_9:
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v11, v5);
    return;
  }
  if ((*((_WORD *)v7 + 17) & 0x400) != 0) {
    goto LABEL_9;
  }
  WebCore::Node::removedLastRef(v7);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v11, v6);
}

- (DOMHTMLTableSectionElement)tHead
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WebCore::HTMLTableElement::tHead((uint64_t *)&v7, self->super.super.super.super._internal);
  v4 = (DOMHTMLTableSectionElement *)kit(v7);
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

- (void)setTHead:(DOMHTMLTableSectionElement *)tHead
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v11);
  if (tHead)
  {
    internal = tHead->super.super.super.super._internal;
    if (internal) {
      *((_DWORD *)internal + 7) += 2;
    }
  }
  else
  {
    internal = 0;
  }
  v7 = internal;
  WebCore::HTMLTableElement::setTHead();
  if (v10)
  {
    v11[80] = v8;
    uint64_t v12 = v9;
    raiseDOMErrorException();
  }
  if (!v7) {
    goto LABEL_9;
  }
  if (*((_DWORD *)v7 + 7) != 2)
  {
    *((_DWORD *)v7 + 7) -= 2;
LABEL_9:
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v11, v5);
    return;
  }
  if ((*((_WORD *)v7 + 17) & 0x400) != 0) {
    goto LABEL_9;
  }
  WebCore::Node::removedLastRef(v7);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v11, v6);
}

- (DOMHTMLTableSectionElement)tFoot
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WebCore::HTMLTableElement::tFoot((uint64_t *)&v7, self->super.super.super.super._internal);
  v4 = (DOMHTMLTableSectionElement *)kit(v7);
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

- (void)setTFoot:(DOMHTMLTableSectionElement *)tFoot
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v11);
  if (tFoot)
  {
    internal = tFoot->super.super.super.super._internal;
    if (internal) {
      *((_DWORD *)internal + 7) += 2;
    }
  }
  else
  {
    internal = 0;
  }
  v7 = internal;
  WebCore::HTMLTableElement::setTFoot();
  if (v10)
  {
    v11[80] = v8;
    uint64_t v12 = v9;
    raiseDOMErrorException();
  }
  if (!v7) {
    goto LABEL_9;
  }
  if (*((_DWORD *)v7 + 7) != 2)
  {
    *((_DWORD *)v7 + 7) -= 2;
LABEL_9:
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v11, v5);
    return;
  }
  if ((*((_WORD *)v7 + 17) & 0x400) != 0) {
    goto LABEL_9;
  }
  WebCore::Node::removedLastRef(v7);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v11, v6);
}

- (DOMHTMLCollection)rows
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WebCore::HTMLTableElement::rows((uint64_t *)&v7, self->super.super.super.super._internal);
  v4 = (DOMHTMLCollection *)kit(v7);
  v5 = v7;
  v7 = 0;
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

- (DOMHTMLCollection)tBodies
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WebCore::HTMLTableElement::tBodies((uint64_t *)&v7, self->super.super.super.super._internal);
  v4 = (DOMHTMLCollection *)kit(v7);
  v5 = v7;
  v7 = 0;
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

- (NSString)align
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  if (*(void *)WebCore::Element::getAttribute()) {
    v3 = (__CFString *)WTF::StringImpl::operator NSString *();
  }
  else {
    v3 = &stru_1F3C7DA90;
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v2);
  return &v3->isa;
}

- (void)setAlign:(NSString *)align
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WTF::AtomStringImpl::add((uint64_t *)&v9, (WTF::AtomStringImpl *)align, v4);
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

- (NSString)bgColor
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  if (*(void *)WebCore::Element::getAttribute()) {
    v3 = (__CFString *)WTF::StringImpl::operator NSString *();
  }
  else {
    v3 = &stru_1F3C7DA90;
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v2);
  return &v3->isa;
}

- (void)setBgColor:(NSString *)bgColor
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WTF::AtomStringImpl::add((uint64_t *)&v9, (WTF::AtomStringImpl *)bgColor, v4);
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

- (NSString)border
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  if (*(void *)WebCore::Element::getAttribute()) {
    v3 = (__CFString *)WTF::StringImpl::operator NSString *();
  }
  else {
    v3 = &stru_1F3C7DA90;
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v2);
  return &v3->isa;
}

- (void)setBorder:(NSString *)border
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WTF::AtomStringImpl::add((uint64_t *)&v9, (WTF::AtomStringImpl *)border, v4);
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

- (NSString)cellPadding
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  if (*(void *)WebCore::Element::getAttribute()) {
    v3 = (__CFString *)WTF::StringImpl::operator NSString *();
  }
  else {
    v3 = &stru_1F3C7DA90;
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v2);
  return &v3->isa;
}

- (void)setCellPadding:(NSString *)cellPadding
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WTF::AtomStringImpl::add((uint64_t *)&v9, (WTF::AtomStringImpl *)cellPadding, v4);
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

- (NSString)cellSpacing
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  if (*(void *)WebCore::Element::getAttribute()) {
    v3 = (__CFString *)WTF::StringImpl::operator NSString *();
  }
  else {
    v3 = &stru_1F3C7DA90;
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v2);
  return &v3->isa;
}

- (void)setCellSpacing:(NSString *)cellSpacing
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WTF::AtomStringImpl::add((uint64_t *)&v9, (WTF::AtomStringImpl *)cellSpacing, v4);
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

- (NSString)frameBorders
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  if (*(void *)WebCore::Element::getAttribute()) {
    v3 = (__CFString *)WTF::StringImpl::operator NSString *();
  }
  else {
    v3 = &stru_1F3C7DA90;
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v2);
  return &v3->isa;
}

- (void)setFrameBorders:(NSString *)frameBorders
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WTF::AtomStringImpl::add((uint64_t *)&v9, (WTF::AtomStringImpl *)frameBorders, v4);
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

- (NSString)rules
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  if (*(void *)WebCore::Element::getAttribute()) {
    v3 = (__CFString *)WTF::StringImpl::operator NSString *();
  }
  else {
    v3 = &stru_1F3C7DA90;
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v2);
  return &v3->isa;
}

- (void)setRules:(NSString *)rules
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WTF::AtomStringImpl::add((uint64_t *)&v9, (WTF::AtomStringImpl *)rules, v4);
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

- (NSString)summary
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  if (*(void *)WebCore::Element::getAttribute()) {
    v3 = (__CFString *)WTF::StringImpl::operator NSString *();
  }
  else {
    v3 = &stru_1F3C7DA90;
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v2);
  return &v3->isa;
}

- (void)setSummary:(NSString *)summary
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WTF::AtomStringImpl::add((uint64_t *)&v9, (WTF::AtomStringImpl *)summary, v4);
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

- (NSString)width
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  if (*(void *)WebCore::Element::getAttribute()) {
    v3 = (__CFString *)WTF::StringImpl::operator NSString *();
  }
  else {
    v3 = &stru_1F3C7DA90;
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v2);
  return &v3->isa;
}

- (void)setWidth:(NSString *)width
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WTF::AtomStringImpl::add((uint64_t *)&v9, (WTF::AtomStringImpl *)width, v4);
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

- (DOMHTMLElement)createTHead
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WebCore::HTMLTableElement::createTHead((uint64_t *)&v7, self->super.super.super.super._internal);
  CFStringRef v4 = (DOMHTMLElement *)kit(v7);
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

- (void)deleteTHead
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v4);
  WebCore::HTMLTableElement::deleteTHead(self->super.super.super.super._internal);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v4, v3);
}

- (DOMHTMLElement)createTFoot
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WebCore::HTMLTableElement::createTFoot((uint64_t *)&v7, self->super.super.super.super._internal);
  CFStringRef v4 = (DOMHTMLElement *)kit(v7);
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

- (void)deleteTFoot
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v4);
  WebCore::HTMLTableElement::deleteTFoot(self->super.super.super.super._internal);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v4, v3);
}

- (id)createTBody
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WebCore::HTMLTableElement::createTBody((uint64_t *)&v7, self->super.super.super.super._internal);
  CFStringRef v4 = kit(v7);
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

- (DOMHTMLElement)createCaption
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WebCore::HTMLTableElement::createCaption((uint64_t *)&v7, self->super.super.super.super._internal);
  CFStringRef v4 = (DOMHTMLElement *)kit(v7);
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

- (void)deleteCaption
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v4);
  WebCore::HTMLTableElement::deleteCaption(self->super.super.super.super._internal);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v4, v3);
}

- (DOMHTMLElement)insertRow:(int)index
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v13);
  WebCore::HTMLTableElement::insertRow(self->super.super.super.super._internal);
  if (v11)
  {
    if (v11 == 1)
    {
      v14[0] = (_BYTE)v9;
      uint64_t v8 = v10;
      uint64_t v10 = 0;
      uint64_t v15 = v8;
      raiseDOMErrorException();
    }
    result = (DOMHTMLElement *)std::__throw_bad_variant_access[abi:sn180100]();
    __break(1u);
  }
  else
  {
    CFStringRef v4 = v9;
    uint64_t v9 = 0;
    uint64_t v12 = v4;
    v6 = (DOMHTMLElement *)kit(v4);
    if (v4)
    {
      if (*((_DWORD *)v4 + 7) == 2)
      {
        if ((*((_WORD *)v4 + 17) & 0x400) == 0) {
          WebCore::Node::removedLastRef(v4);
        }
      }
      else
      {
        *((_DWORD *)v4 + 7) -= 2;
      }
    }
    if (v11 != -1) {
      ((void (*)(unsigned char *, WebCore::Node **))off_1F3C7A168[v11])(v14, &v9);
    }
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v13, v5);
    return v6;
  }
  return result;
}

- (void)deleteRow:(int)index
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WebCore::HTMLTableElement::deleteRow(self->super.super.super.super._internal);
  if (v7)
  {
    unsigned char v8[80] = v5;
    uint64_t v9 = v6;
    raiseDOMErrorException();
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8, v4);
}

- (int)structuralComplexityContribution
{
  return 0x7FFFFFFF;
}

@end