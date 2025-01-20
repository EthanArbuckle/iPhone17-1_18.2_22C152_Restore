@interface ICJSSign
- (ICJSSign)initWithConfiguration:(id)a3;
- (id)signatureDataWithURLRequest:(id)a3;
- (id)signatureStringWithURLRequest:(id)a3;
@end

@implementation ICJSSign

- (void).cxx_destruct
{
}

- (id)signatureStringWithURLRequest:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F28E78] string];
  id v6 = objc_alloc(MEMORY[0x1E4F29088]);
  v7 = [v4 URL];
  v8 = (void *)[v6 initWithURL:v7 resolvingAgainstBaseURL:0];

  v9 = [v8 queryItems];
  configuration = self->_configuration;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __42__ICJSSign_signatureStringWithURLRequest___block_invoke;
  v14[3] = &unk_1E5AC6C18;
  id v15 = v4;
  v16 = v9;
  v17 = v5;
  id v11 = v4;
  [(ICJSSignConfiguration *)configuration _enumerateComponentsUsingBlock:v14];
  id v12 = v5;

  return v12;
}

void __42__ICJSSign_signatureStringWithURLRequest___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = v5;
  if (a2 != 2)
  {
    if (a2 == 1)
    {
      v8 = objc_msgSend(*(id *)(a1 + 32), "ic_valueForHTTPHeaderField:", v5);
      if (!v8) {
        goto LABEL_22;
      }
    }
    else
    {
      if (a2) {
        goto LABEL_22;
      }
      v7 = objc_msgSend(*(id *)(a1 + 32), "ic_valuesForCookieWithName:", v5);
      v8 = [v7 firstObject];

      if (!v8) {
        goto LABEL_22;
      }
    }
LABEL_21:
    [*(id *)(a1 + 48) appendString:v8];

    goto LABEL_22;
  }
  v9 = *(void **)(a1 + 40);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v21 = __42__ICJSSign_signatureStringWithURLRequest___block_invoke_2;
  v22 = &unk_1E5AC6BF0;
  id v23 = v5;
  id v10 = v9;
  id v11 = v20;
  char v28 = 0;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v12 = v10;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = 0;
    uint64_t v16 = *(void *)v25;
    while (2)
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v25 != v16) {
          objc_enumerationMutation(v12);
        }
        v18 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        if (((unsigned int (*)(void *, void *, uint64_t, char *))v21)(v11, v18, v15 + i, &v28))
        {
          id v19 = v18;
          char v28 = 1;
          goto LABEL_20;
        }
        if (v28) {
          goto LABEL_18;
        }
      }
      v15 += i;
      uint64_t v14 = [v12 countByEnumeratingWithState:&v24 objects:v29 count:16];
      id v19 = 0;
      if (v14) {
        continue;
      }
      break;
    }
  }
  else
  {
LABEL_18:
    id v19 = 0;
  }
LABEL_20:

  v8 = [v19 value];

  if (v8) {
    goto LABEL_21;
  }
LABEL_22:
}

BOOL __42__ICJSSign_signatureStringWithURLRequest___block_invoke_2(uint64_t a1, void *a2)
{
  v3 = [a2 name];
  BOOL v4 = [v3 caseInsensitiveCompare:*(void *)(a1 + 32)] == 0;

  return v4;
}

- (id)signatureDataWithURLRequest:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = [(ICJSSign *)self signatureStringWithURLRequest:a3];
  id v5 = (id)[v4 UTF8String];
  if (v5)
  {
    id v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithLength:20];
    CC_LONG v7 = [v4 length];
    id v8 = v6;
    CC_SHA1(v5, v7, (unsigned __int8 *)[v8 mutableBytes]);
    [v8 setLength:16];
    v9 = +[ICDeviceInfo currentDeviceInfo];
    int v10 = [v9 isMac] ? 1 : 3;

    id v5 = v8;
    fd3fa4R8(v10, [v5 mutableBytes]);
    if (v11)
    {
      int v12 = v11;
      uint64_t v13 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        int v15 = 138543618;
        uint64_t v16 = self;
        __int16 v17 = 1024;
        int v18 = v12;
        _os_log_impl(&dword_1A2D01000, v13, OS_LOG_TYPE_ERROR, "%{public}@ Failed to js-sign request. err=%d", (uint8_t *)&v15, 0x12u);
      }
    }
  }

  return v5;
}

- (ICJSSign)initWithConfiguration:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICJSSign;
  id v5 = [(ICJSSign *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    configuration = v5->_configuration;
    v5->_configuration = (ICJSSignConfiguration *)v6;
  }
  return v5;
}

@end