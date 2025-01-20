@interface WebScriptObject(WebScriptObjectInternal)
- (char)_init;
- (uint64_t)_initializeScriptDOMNodeImp;
@end

@implementation WebScriptObject(WebScriptObjectInternal)

- (char)_init
{
  v4.receiver = a1;
  v4.super_class = (Class)WebScriptObject_0;
  v1 = (char *)objc_msgSendSuper2(&v4, sel_init);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v2 = objc_alloc_init(MEMORY[0x1E4FB61F0]);
    *(void *)&v1[*MEMORY[0x1E4FB6210]] = v2;
    v2[*MEMORY[0x1E4FB6218]] = 1;
    return v1;
  }
  else
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3A8], @"+%@: _init is an internal initializer", objc_opt_class() format];
    return 0;
  }
}

- (uint64_t)_initializeScriptDOMNodeImp
{
  objc_opt_class();
  uint64_t result = objc_opt_isKindOfClass();
  if (result)
  {
    uint64_t v3 = a1[2];
    uint64_t v4 = *(void *)(*(void *)(*(void *)(v3 + 48) + 8) + 544);
    if (v4)
    {
      uint64_t v5 = *(void *)(v4 + 8);
      if (v5)
      {
        v6 = *(WebCore::ScriptController **)(v5 + 304);
        v7 = (WebCore::DOMWrapperWorld *)WebCore::mainThreadNormalWorld((WebCore *)result);
        uint64_t v8 = WebCore::ScriptController::jsWindowProxy(v6, v7);
        uint64_t v9 = WebCore::toJS(*(void *)(v8 + 16), *(void *)(v8 + 16), v3);
        uint64_t v10 = WebCore::ScriptController::bindingRootObject(*(WebCore::ScriptController **)(v5 + 304));
        if (v10) {
          *(_DWORD *)(v10 + 8) += 2;
        }
        v12 = (_DWORD *)v10;
        uint64_t v13 = v10;
        [a1 _setImp:v9 originRootObject:&v13 rootObject:&v12];
        v11 = v12;
        v12 = 0;
        if (v11)
        {
          if (v11[2] == 1)
          {
            (*(void (**)(_DWORD *))(*(void *)v11 + 8))(v11);
            uint64_t result = v13;
            uint64_t v13 = 0;
            if (!result) {
              return result;
            }
            goto LABEL_12;
          }
          --v11[2];
        }
        uint64_t result = v13;
        uint64_t v13 = 0;
        if (!result) {
          return result;
        }
LABEL_12:
        if (*(_DWORD *)(result + 8) == 1) {
          return (*(uint64_t (**)(uint64_t))(*(void *)result + 8))(result);
        }
        else {
          --*(_DWORD *)(result + 8);
        }
      }
    }
  }
  return result;
}

@end