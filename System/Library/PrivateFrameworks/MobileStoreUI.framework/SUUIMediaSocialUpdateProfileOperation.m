@interface SUUIMediaSocialUpdateProfileOperation
- (NSNumber)identifier;
- (NSString)entityType;
- (SUUIMediaSocialUpdateProfileOperation)initWithClientContext:(id)a3;
- (id)_imageDictionaryFromPhotoUpload:(id)a3;
- (id)_requestBodyWithError:(id *)a3;
- (id)_requestWithError:(id *)a3;
- (id)outputBlock;
- (void)main;
- (void)setEntityType:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setOutputBlock:(id)a3;
- (void)setValue:(id)a3 forProfileField:(id)a4;
@end

@implementation SUUIMediaSocialUpdateProfileOperation

- (SUUIMediaSocialUpdateProfileOperation)initWithClientContext:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SUUIMediaSocialUpdateProfileOperation;
  v6 = [(SSVOperation *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_clientContext, a3);
    v8 = (NSLock *)objc_alloc_init(MEMORY[0x263F08958]);
    lock = v7->_lock;
    v7->_lock = v8;

    [(NSLock *)v7->_lock setName:@"com.apple.MediaSocial.updateProfile"];
  }

  return v7;
}

- (NSString)entityType
{
  [(NSLock *)self->_lock lock];
  v3 = (void *)[(NSString *)self->_entityType copy];
  [(NSLock *)self->_lock unlock];
  return (NSString *)v3;
}

- (NSNumber)identifier
{
  [(NSLock *)self->_lock lock];
  v3 = (void *)[(NSNumber *)self->_identifier copy];
  [(NSLock *)self->_lock unlock];
  return (NSNumber *)v3;
}

- (id)outputBlock
{
  [(NSLock *)self->_lock lock];
  v3 = (void *)[self->_outputBlock copy];
  [(NSLock *)self->_lock unlock];
  v4 = _Block_copy(v3);

  return v4;
}

- (void)setEntityType:(id)a3
{
  lock = self->_lock;
  id v5 = a3;
  [(NSLock *)lock lock];
  v6 = (NSString *)[v5 copy];

  entityType = self->_entityType;
  self->_entityType = v6;

  v8 = self->_lock;
  [(NSLock *)v8 unlock];
}

- (void)setIdentifier:(id)a3
{
  lock = self->_lock;
  id v5 = a3;
  [(NSLock *)lock lock];
  v6 = (NSNumber *)[v5 copy];

  identifier = self->_identifier;
  self->_identifier = v6;

  v8 = self->_lock;
  [(NSLock *)v8 unlock];
}

- (void)setOutputBlock:(id)a3
{
  id v6 = a3;
  [(NSLock *)self->_lock lock];
  if (self->_outputBlock != v6)
  {
    v4 = (void *)[v6 copy];
    id outputBlock = self->_outputBlock;
    self->_id outputBlock = v4;
  }
  [(NSLock *)self->_lock unlock];
}

- (void)setValue:(id)a3 forProfileField:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  [(NSLock *)self->_lock lock];
  if (!self->_parameters)
  {
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    parameters = self->_parameters;
    self->_parameters = v7;
  }
  if ([v6 isEqualToString:@"backgroundImage"]
    || [v6 isEqualToString:@"profileImage"])
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_9;
    }
    v9 = [(SUUIMediaSocialUpdateProfileOperation *)self _imageDictionaryFromPhotoUpload:v12];
    v10 = self->_parameters;
  }
  else
  {
    objc_super v11 = self->_parameters;
    v9 = (void *)[v12 copy];
    v10 = v11;
  }
  [(NSMutableDictionary *)v10 setObject:v9 forKey:v6];

LABEL_9:
  [(NSLock *)self->_lock unlock];
}

- (void)main
{
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__34;
  v30 = __Block_byref_object_dispose__34;
  id v31 = 0;
  id obj = 0;
  v3 = [(SUUIMediaSocialUpdateProfileOperation *)self _requestWithError:&obj];
  objc_storeStrong(&v31, obj);
  if (!v3)
  {
    BOOL v10 = 0;
    goto LABEL_19;
  }
  id v4 = [(SUUIClientContext *)self->_clientContext newLoadStoreURLOperationWithURLRequest:v3];
  id v5 = [MEMORY[0x263F7B418] consumer];
  [v4 setDataConsumer:v5];

  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__34;
  v23 = __Block_byref_object_dispose__34;
  id v24 = 0;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __45__SUUIMediaSocialUpdateProfileOperation_main__block_invoke;
  v18[3] = &unk_265402EF0;
  v18[4] = &v19;
  v18[5] = &v26;
  [v4 setOutputBlock:v18];
  [(SSVOperation *)self runChildOperation:v4];
  id v6 = (void *)v20[5];
  if (!v6)
  {
    int v9 = 0;
    goto LABEL_13;
  }
  v7 = [v6 objectForKey:@"status"];
  v8 = v7;
  if (v7)
  {
    if ([v7 isEqualToString:@"success"])
    {
      int v9 = 1;
      goto LABEL_12;
    }
    if ([v8 isEqualToString:@"handleAlreadyExists"]
      || [v8 isEqualToString:@"ResourceAlreadyExists"])
    {
      uint64_t v11 = [MEMORY[0x263F087E8] errorWithDomain:@"SUUIErrorDomain" code:5 userInfo:0];
      id v12 = (void *)v27[5];
      v27[5] = v11;
    }
  }
  int v9 = 0;
LABEL_12:

  if (!v9)
  {
LABEL_13:
    if (!v27[5])
    {
      v13 = [v4 URLResponse];
      if ([v13 statusCode] == 403) {
        [MEMORY[0x263F087E8] errorWithDomain:@"SUUIErrorDomain" code:3 userInfo:0];
      }
      else {
      uint64_t v14 = [MEMORY[0x263F087E8] errorWithDomain:@"SUUIErrorDomain" code:0 userInfo:0];
      }
      v15 = (void *)v27[5];
      v27[5] = v14;
    }
  }
  _Block_object_dispose(&v19, 8);

  BOOL v10 = v9 != 0;
LABEL_19:
  uint64_t v16 = [(SUUIMediaSocialUpdateProfileOperation *)self outputBlock];
  v17 = (void *)v16;
  if (v16) {
    (*(void (**)(uint64_t, BOOL, uint64_t))(v16 + 16))(v16, v10, v27[5]);
  }

  _Block_object_dispose(&v26, 8);
}

void __45__SUUIMediaSocialUpdateProfileOperation_main__block_invoke(uint64_t a1, void *a2, void *a3)
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

- (id)_imageDictionaryFromPhotoUpload:(id)a3
{
  v3 = (objc_class *)NSDictionary;
  id v4 = a3;
  id v5 = [v3 alloc];
  uint64_t v6 = [v4 token];
  id v7 = [v4 tokenType];

  v8 = objc_msgSend(v5, "initWithObjectsAndKeys:", v6, @"contentToken", v7, @"contentTokenType", 0);
  return v8;
}

- (id)_requestWithError:(id *)a3
{
  id v5 = [(SUUIClientContext *)self->_clientContext URLBag];
  uint64_t v6 = [v5 valueForKey:*MEMORY[0x263F7BD30] error:a3];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = [v6 objectForKey:@"updateProfile"];
  }
  else
  {
    id v7 = 0;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v8 = [(SUUIMediaSocialUpdateProfileOperation *)self _requestBodyWithError:a3];
    if (v8)
    {
      id v9 = objc_alloc(MEMORY[0x263EFC5E8]);
      uint64_t v10 = [NSURL URLWithString:v7];
      id v11 = (void *)[v9 initWithURL:v10];

      [v11 setHTTPMethod:@"POST"];
      [v11 setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
      [v11 setHTTPBody:v8];
      SSVAddMediaSocialHeadersToURLRequest();
    }
    else
    {
      id v11 = 0;
    }
  }
  else if (a3)
  {
    SSError();
    id v11 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (id)_requestBodyWithError:(id *)a3
{
  if (self->_entityType && self->_identifier && (parameters = self->_parameters) != 0)
  {
    uint64_t v6 = (void *)[(NSMutableDictionary *)parameters mutableCopy];
    id v7 = objc_msgSend(objc_alloc(NSDictionary), "initWithObjectsAndKeys:", self->_entityType, @"type", self->_identifier, @"id", 0);
    [v6 setObject:v7 forKey:@"owner"];
    v8 = [MEMORY[0x263F08900] dataWithJSONObject:v6 options:0 error:a3];
  }
  else
  {
    v8 = 0;
    if (a3) {
      *a3 = (id)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"SUUIErrorDomain" code:4 userInfo:0];
    }
  }
  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_outputBlock, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_entityType, 0);
  objc_storeStrong((id *)&self->_clientContext, 0);
}

@end