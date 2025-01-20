@interface DOMDocumentType
- (DOMNamedNodeMap)entities;
- (DOMNamedNodeMap)notations;
- (NSString)internalSubset;
- (NSString)name;
- (NSString)publicId;
- (NSString)systemId;
- (void)remove;
@end

@implementation DOMDocumentType

- (NSString)name
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6);
  if (*((void *)self->super.super._internal + 11)) {
    v4 = (__CFString *)WTF::StringImpl::operator NSString *();
  }
  else {
    v4 = &stru_1F3C7DA90;
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6, v3);
  return &v4->isa;
}

- (DOMNamedNodeMap)entities
{
  return 0;
}

- (DOMNamedNodeMap)notations
{
  return 0;
}

- (NSString)publicId
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6);
  if (*((void *)self->super.super._internal + 12)) {
    v4 = (__CFString *)WTF::StringImpl::operator NSString *();
  }
  else {
    v4 = &stru_1F3C7DA90;
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6, v3);
  return &v4->isa;
}

- (NSString)systemId
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6);
  if (*((void *)self->super.super._internal + 13)) {
    v4 = (__CFString *)WTF::StringImpl::operator NSString *();
  }
  else {
    v4 = &stru_1F3C7DA90;
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6, v3);
  return &v4->isa;
}

- (NSString)internalSubset
{
  return (NSString *)&stru_1F3C7DA90;
}

- (void)remove
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WebCore::Node::remove(&v5, self->super.super._internal);
  if (v7)
  {
    v8[80] = v5;
    uint64_t v4 = v6;
    uint64_t v6 = 0;
    uint64_t v9 = v4;
    raiseDOMErrorException();
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8, v3);
}

@end