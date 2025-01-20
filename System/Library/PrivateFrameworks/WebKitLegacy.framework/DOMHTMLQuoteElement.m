@interface DOMHTMLQuoteElement
- (NSString)cite;
- (void)setCite:(NSString *)cite;
@end

@implementation DOMHTMLQuoteElement

- (NSString)cite
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

- (void)setCite:(NSString *)cite
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WTF::AtomStringImpl::add((uint64_t *)&v9, (WTF::AtomStringImpl *)cite, v4);
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

@end