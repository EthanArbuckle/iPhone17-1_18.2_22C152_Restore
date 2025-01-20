@interface WebScriptObject(SUScriptAdditions)
- (id)copyArrayOrDictionaryWithContext:()SUScriptAdditions;
- (id)copyArrayValueWithValidator:()SUScriptAdditions context:;
- (id)copyValuesForKeys:()SUScriptAdditions;
- (uint64_t)copyDate;
- (uint64_t)copyJSONDataWithContext:()SUScriptAdditions;
- (uint64_t)safeValueForKey:()SUScriptAdditions;
@end

@implementation WebScriptObject(SUScriptAdditions)

- (id)copyArrayValueWithValidator:()SUScriptAdditions context:
{
  id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v8 = [a1 webScriptValueAtIndex:0];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v9 = 1;
    while (!a3 || (a3(v8, a4) & 1) != 0)
    {
      [v7 addObject:v8];
      uint64_t v8 = [a1 webScriptValueAtIndex:v9];
      objc_opt_class();
      uint64_t v9 = (v9 + 1);
      if (objc_opt_isKindOfClass()) {
        return v7;
      }
    }

    return 0;
  }
  return v7;
}

- (id)copyArrayOrDictionaryWithContext:()SUScriptAdditions
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v1 = objc_msgSend(a1, "copyJSONDataWithContext:");
  if (!v1) {
    return 0;
  }
  v2 = (void *)v1;
  uint64_t v12 = 0;
  id v3 = (id)[MEMORY[0x263F08900] JSONObjectWithData:v1 options:0 error:&v12];
  if (!v3)
  {
    v5 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
    int v6 = [v5 shouldLog];
    if ([v5 shouldLogToDisk]) {
      int v7 = v6 | 2;
    }
    else {
      int v7 = v6;
    }
    if (!os_log_type_enabled((os_log_t)[v5 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
      v7 &= 2u;
    }
    if (v7)
    {
      uint64_t v8 = objc_opt_class();
      int v13 = 138412546;
      uint64_t v14 = v8;
      __int16 v15 = 2112;
      uint64_t v16 = v12;
      LODWORD(v11) = 22;
      uint64_t v9 = _os_log_send_and_compose_impl();
      if (v9)
      {
        v10 = (void *)v9;
        objc_msgSend(NSString, "stringWithCString:encoding:", v9, 4, &v13, v11);
        free(v10);
        SSFileLog();
      }
    }
  }

  return v3;
}

- (uint64_t)copyDate
{
  uint64_t v1 = objc_msgSend((id)objc_msgSend(a1, "JSValue"), "toObjectOfClass:", objc_opt_class());

  return [v1 copy];
}

- (uint64_t)copyJSONDataWithContext:()SUScriptAdditions
{
  uint64_t v4 = [a1 JSObject];
  uint64_t v5 = 0;
  if (a3)
  {
    int v6 = (OpaqueJSValue *)v4;
    if (v4)
    {
      int v7 = JSStringCreateWithCFString(@"JSON.stringify(this);");
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = JSEvaluateScript(a3, v7, v6, 0, 0, 0);
        if (v9 && (JSStringRef v10 = JSValueToStringCopy(a3, v9, 0)) != 0)
        {
          uint64_t v11 = v10;
          id v12 = objc_alloc(MEMORY[0x263EFF8F8]);
          CharactersPtr = JSStringGetCharactersPtr(v11);
          uint64_t v5 = [v12 initWithBytes:CharactersPtr length:2 * JSStringGetLength(v11)];
          JSStringRelease(v11);
        }
        else
        {
          uint64_t v5 = 0;
        }
        JSStringRelease(v8);
      }
      else
      {
        return 0;
      }
    }
  }
  return v5;
}

- (id)copyValuesForKeys:()SUScriptAdditions
{
  id v11 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  __int16 v15 = &a9;
  if (a3)
  {
    do
    {
      uint64_t v12 = [a1 safeValueForKey:a3];
      if (v12) {
        [v11 setObject:v12 forKey:a3];
      }
      int v13 = v15++;
      a3 = *v13;
    }
    while (*v13);
  }
  return v11;
}

- (uint64_t)safeValueForKey:()SUScriptAdditions
{
  return objc_msgSend(a1, "valueForKey:");
}

@end