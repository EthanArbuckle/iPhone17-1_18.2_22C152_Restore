@interface ICRadioURLRequest
- (BOOL)isBackgroundRadioRequest;
- (ICRadioURLRequest)initWithURLRequest:(id)a3 requestContext:(id)a4;
- (NSNumber)isDelegatedPrivateListeningEnabled;
- (NSNumber)isPrivateListeningEnabled;
- (id)radioContentDictionaryCreationBlock;
- (int64_t)protocolVersion;
- (void)_decorateHeaderPropertiesForURLRequest:(id)a3 withBuilderProperties:(id)a4;
- (void)buildStoreURLRequestWithURLRequest:(id)a3 builderProperties:(id)a4 completionHandler:(id)a5;
- (void)setBackgroundRadioRequest:(BOOL)a3;
- (void)setDelegatedPrivateListeningEnabled:(id)a3;
- (void)setPrivateListeningEnabled:(id)a3;
- (void)setProtocolVersion:(int64_t)a3;
- (void)setRadioContentDictionaryCreationBlock:(id)a3;
@end

@implementation ICRadioURLRequest

- (void).cxx_destruct
{
  objc_storeStrong(&self->_radioContentDictionaryCreationBlock, 0);
  objc_storeStrong((id *)&self->_delegatedPrivateListeningEnabled, 0);

  objc_storeStrong((id *)&self->_privateListeningEnabled, 0);
}

- (void)setRadioContentDictionaryCreationBlock:(id)a3
{
}

- (id)radioContentDictionaryCreationBlock
{
  return self->_radioContentDictionaryCreationBlock;
}

- (void)setProtocolVersion:(int64_t)a3
{
  self->_protocolVersion = a3;
}

- (int64_t)protocolVersion
{
  return self->_protocolVersion;
}

- (void)setDelegatedPrivateListeningEnabled:(id)a3
{
}

- (NSNumber)isDelegatedPrivateListeningEnabled
{
  return self->_delegatedPrivateListeningEnabled;
}

- (void)setPrivateListeningEnabled:(id)a3
{
}

- (NSNumber)isPrivateListeningEnabled
{
  return self->_privateListeningEnabled;
}

- (void)setBackgroundRadioRequest:(BOOL)a3
{
  self->_backgroundRadioRequest = a3;
}

- (BOOL)isBackgroundRadioRequest
{
  return self->_backgroundRadioRequest;
}

- (void)_decorateHeaderPropertiesForURLRequest:(id)a3 withBuilderProperties:(id)a4
{
  id v23 = a3;
  id v6 = a4;
  v7 = [(ICStoreURLRequest *)self storeRequestContext];
  v8 = [v7 deviceInfo];
  int64_t v9 = [(ICRadioURLRequest *)self protocolVersion];
  v10 = NSString;
  uint64_t v11 = [v8 buildVersion];
  v12 = (void *)v11;
  v13 = &stru_1EF5F5C40;
  if (v11) {
    v13 = (__CFString *)v11;
  }
  v14 = [v10 stringWithFormat:@"%ld/%@", v9, v13];

  [v23 setValue:v14 forHTTPHeaderField:@"X-Apple-Radio-Client-Version"];
  privateListeningEnabled = self->_privateListeningEnabled;
  if (privateListeningEnabled)
  {
    if ([(NSNumber *)privateListeningEnabled BOOLValue]) {
      v16 = @"true";
    }
    else {
      v16 = @"false";
    }
    [v23 setValue:v16 forHTTPHeaderField:@"X-Apple-Private-Listening"];
  }
  delegatedPrivateListeningEnabled = self->_delegatedPrivateListeningEnabled;
  if (delegatedPrivateListeningEnabled)
  {
    if ([(NSNumber *)delegatedPrivateListeningEnabled BOOLValue]) {
      v18 = @"true";
    }
    else {
      v18 = @"false";
    }
    [v23 setValue:v18 forHTTPHeaderField:@"X-Apple-Enqueuer-Private-Listening"];
  }
  v19 = [v6 URLBag];
  v20 = [v19 radioConfiguration];
  v21 = [v23 URL];
  if (v21 && [v20 shouldIncludeHTTPHeaderField:@"X-Guid" forRequestURL:v21])
  {
    v22 = [v8 deviceGUID];
    if (v22) {
      [v23 setValue:v22 forHTTPHeaderField:@"X-Guid"];
    }
  }
}

- (void)buildStoreURLRequestWithURLRequest:(id)a3 builderProperties:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __92__ICRadioURLRequest_buildStoreURLRequestWithURLRequest_builderProperties_completionHandler___block_invoke;
  v22[3] = &unk_1E5ACCA00;
  id v11 = v8;
  id v23 = v11;
  v24 = self;
  id v12 = v9;
  id v25 = v12;
  id v13 = v10;
  id v26 = v13;
  v14 = (void (**)(void, void, void))MEMORY[0x1A6240BF0](v22);
  v15 = [(ICRadioURLRequest *)self radioContentDictionaryCreationBlock];
  if (v15)
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __92__ICRadioURLRequest_buildStoreURLRequestWithURLRequest_builderProperties_completionHandler___block_invoke_15;
    v18[3] = &unk_1E5ACCA28;
    v18[4] = self;
    id v19 = v12;
    id v20 = v15;
    v21 = v14;
    v17.receiver = self;
    v17.super_class = (Class)ICRadioURLRequest;
    [(ICStoreURLRequest *)&v17 buildStoreURLRequestWithURLRequest:v11 builderProperties:v19 completionHandler:v18];
  }
  else
  {
    v16 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:-7101 userInfo:0];
    ((void (**)(void, void, void *))v14)[2](v14, 0, v16);
  }
}

void __92__ICRadioURLRequest_buildStoreURLRequestWithURLRequest_builderProperties_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    if (*(void *)(a1 + 56))
    {
      v7 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        uint64_t v8 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 134218499;
        uint64_t v19 = v8;
        __int16 v20 = 2113;
        id v21 = v5;
        __int16 v22 = 2114;
        id v23 = v6;
        _os_log_impl(&dword_1A2D01000, v7, OS_LOG_TYPE_ERROR, "<ICStoreURLRequest %p> encountered error building url request contentDictionary=%{private}@ error=%{public}@", buf, 0x20u);
      }

      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    }
  }
  else
  {
    id v9 = (void *)[*(id *)(a1 + 32) mutableCopy];
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v11 = [*(id *)(a1 + 40) protocolVersion];
    id v12 = [NSNumber numberWithInteger:v11];
    [v10 setObject:v12 forKey:@"version"];

    if (v5) {
      [v10 setObject:v5 forKey:@"content"];
    }
    if ([*(id *)(a1 + 40) isBackgroundRadioRequest]) {
      [v10 setObject:MEMORY[0x1E4F1CC38] forKey:@"is-async"];
    }
    id v13 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v10 format:200 options:0 error:0];
    if (v13)
    {
      v14 = MSVGzipCompressData();
      if ([v14 length])
      {
        [v9 setHTTPBody:v14];
        [v9 setValue:@"gzip" forHTTPHeaderField:@"Content-Encoding"];
      }
      else
      {
        [v9 setHTTPBody:v13];
      }
    }
    [*(id *)(a1 + 40) _decorateHeaderPropertiesForURLRequest:v9 withBuilderProperties:*(void *)(a1 + 48)];
    uint64_t v15 = *(void *)(a1 + 48);
    uint64_t v16 = *(void *)(a1 + 56);
    v17.receiver = *(id *)(a1 + 40);
    v17.super_class = (Class)ICRadioURLRequest;
    objc_msgSendSuper2(&v17, sel_buildStoreURLRequestWithURLRequest_builderProperties_completionHandler_, v9, v15, v16);
  }
}

void __92__ICRadioURLRequest_buildStoreURLRequestWithURLRequest_builderProperties_completionHandler___block_invoke_15(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v4 = (id)[a2 mutableCopy];
    [*(id *)(a1 + 32) _decorateHeaderPropertiesForURLRequest:v4 withBuilderProperties:*(void *)(a1 + 40)];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    v3 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    v3();
  }
}

- (ICRadioURLRequest)initWithURLRequest:(id)a3 requestContext:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)ICRadioURLRequest;
  result = [(ICStoreURLRequest *)&v5 initWithURLRequest:a3 requestContext:a4];
  if (result) {
    result->_protocolVersion = 5;
  }
  return result;
}

@end