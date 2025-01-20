@interface DOMCharacterData
- (NSString)data;
- (NSString)substringData:(unsigned int)offset length:(unsigned int)length;
- (id)nextElementSibling;
- (id)previousElementSibling;
- (unsigned)length;
- (void)appendData:(NSString *)data;
- (void)deleteData:(unsigned int)offset length:(unsigned int)length;
- (void)insertData:(unsigned int)offset data:(NSString *)data;
- (void)remove;
- (void)replaceData:(unsigned int)offset length:(unsigned int)length data:(NSString *)data;
- (void)setData:(NSString *)data;
@end

@implementation DOMCharacterData

- (NSString)data
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

- (void)setData:(NSString *)data
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10);
  internal = self->super.super._internal;
  MEMORY[0x1E4E442D0](&v9, data);
  WebCore::CharacterData::setData(internal, (const WTF::String *)&v9);
  v7 = v9;
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

- (unsigned)length
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  uint64_t v4 = *((void *)self->super.super._internal + 11);
  if (v4) {
    unsigned int v5 = *(_DWORD *)(v4 + 4);
  }
  else {
    unsigned int v5 = 0;
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7, v3);
  return v5;
}

- (id)previousElementSibling
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  v3 = (WebCore::Node *)WebCore::Node::previousElementSibling(self->super.super._internal);
  uint64_t v4 = kit(v3);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7, v5);
  return v4;
}

- (id)nextElementSibling
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  ElementSibling = (WebCore::Node *)WebCore::Node::nextElementSibling(self->super.super._internal);
  uint64_t v4 = kit(ElementSibling);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7, v5);
  return v4;
}

- (NSString)substringData:(unsigned int)offset length:(unsigned int)length
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v14);
  WebCore::CharacterData::substringData(self->super.super._internal);
  if (!v13)
  {
    unsigned int v5 = v11;
    v11 = 0;
    if (v5)
    {
      v7 = (__CFString *)WTF::StringImpl::operator NSString *();
      if (*(_DWORD *)v5 == 2)
      {
        WTF::StringImpl::destroy(v5, v6);
        uint64_t v8 = v13;
      }
      else
      {
        *(_DWORD *)v5 -= 2;
        uint64_t v8 = v13;
        if (v13 == -1) {
          goto LABEL_8;
        }
      }
    }
    else
    {
      v7 = &stru_1F3C7DA90;
      uint64_t v8 = v13;
    }
    ((void (*)(unsigned char *, WTF::StringImpl **))off_1F3C79FF8[v8])(v15, &v11);
LABEL_8:
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v14, v6);
    return &v7->isa;
  }
  if (v13 == 1)
  {
    v15[0] = (_BYTE)v11;
    uint64_t v10 = v12;
    uint64_t v12 = 0;
    uint64_t v16 = v10;
    raiseDOMErrorException();
  }
  result = (NSString *)std::__throw_bad_variant_access[abi:sn180100]();
  __break(1u);
  return result;
}

- (void)appendData:(NSString *)data
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10);
  internal = self->super.super._internal;
  MEMORY[0x1E4E442D0](&v9, data);
  WebCore::CharacterData::appendData(internal, (const WTF::String *)&v9);
  v7 = v9;
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

- (void)insertData:(unsigned int)offset data:(NSString *)data
{
  uint64_t v5 = *(void *)&offset;
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v15);
  internal = self->super.super._internal;
  MEMORY[0x1E4E442D0](&v11, data);
  WebCore::CharacterData::insertData(internal, v5, (const WTF::String *)&v11);
  if (v14)
  {
    v15[80] = v12;
    uint64_t v10 = v13;
    uint64_t v13 = 0;
    uint64_t v16 = v10;
    raiseDOMErrorException();
  }
  v9 = v11;
  v11 = 0;
  if (v9)
  {
    if (*(_DWORD *)v9 == 2) {
      WTF::StringImpl::destroy(v9, v8);
    }
    else {
      *(_DWORD *)v9 -= 2;
    }
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v15, v8);
}

- (void)deleteData:(unsigned int)offset length:(unsigned int)length
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9);
  WebCore::CharacterData::deleteData(self->super.super._internal);
  if (v8)
  {
    v9[80] = v6;
    uint64_t v10 = v7;
    raiseDOMErrorException();
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9, v5);
}

- (void)replaceData:(unsigned int)offset length:(unsigned int)length data:(NSString *)data
{
  uint64_t v6 = *(void *)&length;
  uint64_t v7 = *(void *)&offset;
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v17);
  internal = self->super.super._internal;
  MEMORY[0x1E4E442D0](&v13, data);
  WebCore::CharacterData::replaceData(internal, v7, v6, (const WTF::String *)&v13);
  if (v16)
  {
    v17[80] = v14;
    uint64_t v12 = v15;
    uint64_t v15 = 0;
    uint64_t v18 = v12;
    raiseDOMErrorException();
  }
  v11 = v13;
  uint64_t v13 = 0;
  if (v11)
  {
    if (*(_DWORD *)v11 == 2) {
      WTF::StringImpl::destroy(v11, v10);
    }
    else {
      *(_DWORD *)v11 -= 2;
    }
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v17, v10);
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