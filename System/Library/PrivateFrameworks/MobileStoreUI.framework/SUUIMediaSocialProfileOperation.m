@interface SUUIMediaSocialProfileOperation
- (SUUIMediaSocialProfileOperation)init;
- (SUUIMediaSocialProfileOperation)initWithClientContext:(id)a3;
- (id)_profileWithResponseDictionary:(id)a3;
- (id)outputBlock;
- (void)main;
- (void)setOutputBlock:(id)a3;
@end

@implementation SUUIMediaSocialProfileOperation

- (SUUIMediaSocialProfileOperation)init
{
  v6.receiver = self;
  v6.super_class = (Class)SUUIMediaSocialProfileOperation;
  v2 = [(SSVOperation *)&v6 init];
  if (v2)
  {
    v3 = (NSLock *)objc_alloc_init(MEMORY[0x263F08958]);
    lock = v2->_lock;
    v2->_lock = v3;

    [(NSLock *)v2->_lock setName:@"com.apple.MediaSocial.profile"];
  }
  return v2;
}

- (SUUIMediaSocialProfileOperation)initWithClientContext:(id)a3
{
  id v4 = a3;
  v5 = [(SUUIMediaSocialProfileOperation *)self init];
  if (v5)
  {
    objc_super v6 = [v4 URLBag];
    [(SSVComplexOperation *)v5 configureWithURLBag:v6];
  }
  return v5;
}

- (id)outputBlock
{
  [(NSLock *)self->_lock lock];
  v3 = (void *)[self->_outputBlock copy];
  [(NSLock *)self->_lock unlock];
  id v4 = _Block_copy(v3);

  return v4;
}

- (void)setOutputBlock:(id)a3
{
  id v6 = a3;
  [(NSLock *)self->_lock lock];
  if (self->_outputBlock != v6)
  {
    id v4 = (void *)[v6 copy];
    id outputBlock = self->_outputBlock;
    self->_id outputBlock = v4;
  }
  [(NSLock *)self->_lock unlock];
}

- (void)main
{
  uint64_t v36 = 0;
  v37 = &v36;
  uint64_t v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__106;
  v40 = __Block_byref_object_dispose__106;
  id v41 = 0;
  v3 = [(SSVComplexOperation *)self URLBagDictionary];
  id v4 = [v3 objectForKey:*MEMORY[0x263F7BD30]];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [v4 objectForKey:@"userProfile"];
  }
  else
  {
    v5 = 0;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = objc_alloc(MEMORY[0x263F08BA0]);
    v7 = [NSURL URLWithString:v5];
    v8 = (void *)[v6 initWithURL:v7 resolvingAgainstBaseURL:0];

    v9 = [MEMORY[0x263F7B0E8] defaultStore];
    v10 = [v9 activeAccount];

    id v11 = objc_alloc(MEMORY[0x263F08BD0]);
    v12 = [v10 uniqueIdentifier];
    v13 = [v12 stringValue];
    v14 = (void *)[v11 initWithName:@"user" value:v13];
    v28 = v10;

    v15 = objc_msgSend(objc_alloc(MEMORY[0x263EFF8C0]), "initWithObjects:", v14, 0);
    [v8 setQueryItems:v15];
    id v16 = objc_alloc(MEMORY[0x263EFC5E8]);
    v17 = [v8 URL];
    v18 = (void *)[v16 initWithURL:v17];

    SSVAddMediaSocialHeadersToURLRequest();
    id v19 = [(SSVComplexOperation *)self newLoadURLOperationWithRequest:v18];
    v20 = [MEMORY[0x263F7B418] consumer];
    [v19 setDataConsumer:v20];

    uint64_t v30 = 0;
    v31 = &v30;
    uint64_t v32 = 0x3032000000;
    v33 = __Block_byref_object_copy__106;
    v34 = __Block_byref_object_dispose__106;
    id v35 = 0;
    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = __39__SUUIMediaSocialProfileOperation_main__block_invoke;
    v29[3] = &unk_265402EF0;
    v29[4] = &v30;
    v29[5] = &v36;
    [v19 setOutputBlock:v29];
    [(SSVOperation *)self runChildOperation:v19];
    if (v31[5])
    {
      uint64_t v21 = -[SUUIMediaSocialProfileOperation _profileWithResponseDictionary:](self, "_profileWithResponseDictionary:");
    }
    else
    {
      uint64_t v21 = 0;
    }
    if (!(v37[5] | v21))
    {
      v23 = [v19 URLResponse];
      if ([v23 statusCode] == 403) {
        [MEMORY[0x263F087E8] errorWithDomain:@"SUUIErrorDomain" code:3 userInfo:0];
      }
      else {
      uint64_t v24 = [MEMORY[0x263F087E8] errorWithDomain:@"SUUIErrorDomain" code:2 userInfo:0];
      }
      v25 = (void *)v37[5];
      v37[5] = v24;
    }
    _Block_object_dispose(&v30, 8);
  }
  else
  {
    uint64_t v22 = SSError();
    uint64_t v21 = 0;
    v8 = (void *)v37[5];
    v37[5] = v22;
  }

  uint64_t v26 = [(SUUIMediaSocialProfileOperation *)self outputBlock];
  v27 = (void *)v26;
  if (v26) {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v26 + 16))(v26, v21, v37[5]);
  }

  _Block_object_dispose(&v36, 8);
}

void __39__SUUIMediaSocialProfileOperation_main__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
    id v7 = v11;
LABEL_5:
    v8 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v7;
    goto LABEL_7;
  }
  if (v5)
  {
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    id v7 = v5;
    goto LABEL_5;
  }
  uint64_t v9 = SSError();
  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
  v8 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;
LABEL_7:
}

- (id)_profileWithResponseDictionary:(id)a3
{
  v3 = [a3 objectForKey:@"profile"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [[SUUIMediaSocialProfile alloc] initWithProfileDictionary:v3];
    id v5 = [v3 objectForKey:@"backgroundImage"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v6 = (void *)[objc_alloc(MEMORY[0x263F7B208]) initWithLookupDictionary:v5];
      id v7 = objc_msgSend(v6, "URLWithHeight:width:", objc_msgSend(v6, "height"), objc_msgSend(v6, "width"));
      [(SUUIMediaSocialProfile *)v4 setBackgroundImageURL:v7];
    }
    v8 = [v3 objectForKey:@"profileImage"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v9 = (void *)[objc_alloc(MEMORY[0x263F7B208]) initWithLookupDictionary:v8];
      uint64_t v10 = objc_msgSend(v9, "URLWithHeight:width:", objc_msgSend(v9, "height"), objc_msgSend(v9, "width"));
      [(SUUIMediaSocialProfile *)v4 setProfileImageURL:v10];
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_outputBlock, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

@end