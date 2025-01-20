@interface DOMText
- (DOMText)replaceWholeText:(NSString *)content;
- (DOMText)splitText:(unsigned int)offset;
- (NSString)wholeText;
@end

@implementation DOMText

- (NSString)wholeText
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WebCore::Text::wholeText((uint64_t *)&v7, self->super.super.super._internal);
  if (v7)
  {
    v4 = (__CFString *)WTF::StringImpl::operator NSString *();
    v5 = v7;
    v7 = 0;
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
    v4 = &stru_1F3C7DA90;
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8, v3);
  return &v4->isa;
}

- (DOMText)splitText:(unsigned int)offset
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v13);
  WebCore::Text::splitText(self->super.super.super._internal);
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
    result = (DOMText *)std::__throw_bad_variant_access[abi:sn180100]();
    __break(1u);
  }
  else
  {
    v4 = v9;
    v9 = 0;
    v12 = v4;
    v6 = (DOMText *)kit(v4);
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
      ((void (*)(unsigned char *, WebCore::Node **))off_1F3C7A268[v11])(v14, &v9);
    }
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v13, v5);
    return v6;
  }
  return result;
}

- (DOMText)replaceWholeText:(NSString *)content
{
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10);
  internal = self->super.super.super._internal;
  if (internal) {
    *((_DWORD *)internal + 7) += 2;
  }
  MEMORY[0x1E4E442D0](&v9, content);
  WebCore::Text::replaceWholeText(internal, (const WTF::String *)&v9);
  v7 = v9;
  v9 = 0;
  if (v7)
  {
    if (*(_DWORD *)v7 == 2)
    {
      WTF::StringImpl::destroy(v7, v6);
      if (!internal) {
        goto LABEL_13;
      }
      goto LABEL_9;
    }
    *(_DWORD *)v7 -= 2;
  }
  if (!internal) {
    goto LABEL_13;
  }
LABEL_9:
  if (*((_DWORD *)internal + 7) == 2)
  {
    if ((*((_WORD *)internal + 17) & 0x400) == 0) {
      WebCore::Node::removedLastRef(internal);
    }
  }
  else
  {
    *((_DWORD *)internal + 7) -= 2;
  }
LABEL_13:
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10, v6);
  return self;
}

@end