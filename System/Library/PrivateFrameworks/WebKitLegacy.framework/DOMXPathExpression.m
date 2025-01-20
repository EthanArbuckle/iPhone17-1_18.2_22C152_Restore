@interface DOMXPathExpression
- (DOMXPathResult)evaluate:(DOMNode *)contextNode type:(unsigned __int16)type inResult:(DOMXPathResult *)inResult;
- (void)dealloc;
@end

@implementation DOMXPathExpression

- (void)dealloc
{
  v3 = (objc_class *)objc_opt_class();
  if ((WebCoreObjCScheduleDeallocateOnMainThread(v3, (objc_object *)self) & 1) == 0)
  {
    internal = self->super._internal;
    if (internal)
    {
      if (*(_DWORD *)internal == 1)
      {
        WebCore::XPathExpression::~XPathExpression(internal);
        WTF::fastFree(v5, v6);
      }
      else
      {
        --*(_DWORD *)internal;
      }
    }
    v7.receiver = self;
    v7.super_class = (Class)DOMXPathExpression;
    [(DOMObject *)&v7 dealloc];
  }
}

- (DOMXPathResult)evaluate:(DOMNode *)contextNode type:(unsigned __int16)type inResult:(DOMXPathResult *)inResult
{
  if (!contextNode) {
    return 0;
  }
  uint64_t v6 = type;
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v22);
  if (inResult) {
    internal = inResult->super._internal;
  }
  else {
    internal = 0;
  }
  WebCore::XPathExpression::evaluate(self->super._internal, (Node *)contextNode->super._internal, v6, internal);
  if (!v20)
  {
    v11 = v18;
    v18 = 0;
    v21 = v11;
    v13 = kit(v11);
    if (v11)
    {
      if (*(_DWORD *)v11 == 1)
      {
        v15 = (WTF *)MEMORY[0x1E4E44B30](v11);
        WTF::fastFree(v15, v16);
        uint64_t v14 = v20;
        goto LABEL_11;
      }
      --*(_DWORD *)v11;
    }
    uint64_t v14 = v20;
    if (v20 == -1)
    {
LABEL_12:
      WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v22, v12);
      return (DOMXPathResult *)v13;
    }
LABEL_11:
    ((void (*)(unsigned char *, WebCore::XPathResult **))off_1F3C7A2A8[v14])(v23, &v18);
    goto LABEL_12;
  }
  if (v20 == 1)
  {
    v23[0] = (_BYTE)v18;
    uint64_t v17 = v19;
    uint64_t v19 = 0;
    uint64_t v24 = v17;
    raiseDOMErrorException();
  }
  result = (DOMXPathResult *)std::__throw_bad_variant_access[abi:sn180100]();
  __break(1u);
  return result;
}

@end