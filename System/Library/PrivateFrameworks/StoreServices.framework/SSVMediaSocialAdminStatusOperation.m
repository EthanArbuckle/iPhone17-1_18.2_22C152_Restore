@interface SSVMediaSocialAdminStatusOperation
- (SSVMediaSocialAdminStatusOperation)init;
- (id)outputBlock;
- (void)main;
- (void)setOutputBlock:(id)a3;
@end

@implementation SSVMediaSocialAdminStatusOperation

- (SSVMediaSocialAdminStatusOperation)init
{
  v6.receiver = self;
  v6.super_class = (Class)SSVMediaSocialAdminStatusOperation;
  v2 = [(SSVOperation *)&v6 init];
  if (v2)
  {
    v3 = (NSLock *)objc_alloc_init(MEMORY[0x1E4F28E08]);
    lock = v2->_lock;
    v2->_lock = v3;

    [(NSLock *)v2->_lock setName:@"com.apple.MediaSocial.adminStatus"];
  }
  return v2;
}

- (id)outputBlock
{
  [(NSLock *)self->_lock lock];
  v3 = (void *)[self->_outputBlock copy];
  [(NSLock *)self->_lock unlock];
  v4 = (void *)MEMORY[0x1A6268200](v3);

  return v4;
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

- (void)main
{
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__71;
  v31 = __Block_byref_object_dispose__71;
  id v32 = 0;
  v3 = [(SSVComplexOperation *)self URLBagDictionary];
  v4 = [v3 objectForKey:@"musicConnect"];

  if (!v4)
  {
    v5 = [(SSVComplexOperation *)self URLBagDictionary];
    v4 = [v5 objectForKey:@"aucAdminStatus"];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = [v4 objectForKey:@"adminStatus"];
  }
  else
  {
    id v6 = 0;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = objc_alloc(MEMORY[0x1E4F28E88]);
    v8 = [MEMORY[0x1E4F1CB10] URLWithString:v6];
    v9 = (void *)[v7 initWithURL:v8];

    SSVAddMediaSocialHeadersToURLRequest(v9);
    id v10 = [(SSVComplexOperation *)self newLoadURLOperationWithRequest:v9];
    v11 = +[SSVURLDataConsumer consumer];
    [v10 setDataConsumer:v11];

    uint64_t v21 = 0;
    v22 = &v21;
    uint64_t v23 = 0x3032000000;
    v24 = __Block_byref_object_copy__71;
    v25 = __Block_byref_object_dispose__71;
    id v26 = 0;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __42__SSVMediaSocialAdminStatusOperation_main__block_invoke;
    v20[3] = &unk_1E5BACC90;
    v20[4] = &v21;
    v20[5] = &v27;
    [v10 setOutputBlock:v20];
    [(SSVOperation *)self runChildOperation:v10];
    v12 = (void *)v22[5];
    if (v12)
    {
      v13 = [v12 objectForKey:@"status"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        uint64_t v14 = [v13 isEqualToString:@"success"];
      }
      else {
        uint64_t v14 = 0;
      }
      v17 = [(id)v22[5] objectForKey:@"isAdmin"];
      if (objc_opt_respondsToSelector()) {
        uint64_t v16 = [v17 BOOLValue];
      }
      else {
        uint64_t v16 = 0;
      }
    }
    else
    {
      uint64_t v16 = 0;
      uint64_t v14 = 0;
    }
    _Block_object_dispose(&v21, 8);
  }
  else
  {
    uint64_t v15 = SSError(@"SSErrorDomain", 124, 0, 0);
    uint64_t v16 = 0;
    uint64_t v14 = 0;
    v9 = (void *)v28[5];
    v28[5] = v15;
  }

  uint64_t v18 = [(SSVMediaSocialAdminStatusOperation *)self outputBlock];
  v19 = (void *)v18;
  if (v18) {
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v18 + 16))(v18, v14, v16, v28[5]);
  }

  _Block_object_dispose(&v27, 8);
}

void __42__SSVMediaSocialAdminStatusOperation_main__block_invoke(uint64_t a1, void *a2, void *a3)
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
  uint64_t v9 = SSError(@"SSErrorDomain", 100, 0, 0);
  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
  v8 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;
LABEL_7:
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_outputBlock, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

@end