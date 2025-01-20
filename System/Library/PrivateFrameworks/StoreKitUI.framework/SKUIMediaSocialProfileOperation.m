@interface SKUIMediaSocialProfileOperation
- (SKUIMediaSocialProfileOperation)init;
- (SKUIMediaSocialProfileOperation)initWithClientContext:(id)a3;
- (id)_profileWithResponseDictionary:(id)a3;
- (id)outputBlock;
- (void)init;
- (void)main;
- (void)setOutputBlock:(id)a3;
@end

@implementation SKUIMediaSocialProfileOperation

- (SKUIMediaSocialProfileOperation)init
{
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIMediaSocialProfileOperation init]();
  }
  v7.receiver = self;
  v7.super_class = (Class)SKUIMediaSocialProfileOperation;
  v3 = [(SSVOperation *)&v7 init];
  if (v3)
  {
    v4 = (NSLock *)objc_alloc_init(MEMORY[0x1E4F28E08]);
    lock = v3->_lock;
    v3->_lock = v4;

    [(NSLock *)v3->_lock setName:@"com.apple.MediaSocial.profile"];
  }
  return v3;
}

- (SKUIMediaSocialProfileOperation)initWithClientContext:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIMediaSocialProfileOperation initWithClientContext:]();
  }
  v5 = [(SKUIMediaSocialProfileOperation *)self init];
  if (v5)
  {
    v6 = [v4 URLBag];
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
  v39 = __Block_byref_object_copy__100;
  v40 = __Block_byref_object_dispose__100;
  id v41 = 0;
  v3 = [(SSVComplexOperation *)self URLBagDictionary];
  id v4 = [v3 objectForKey:*MEMORY[0x1E4FA89B0]];

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
    id v6 = objc_alloc(MEMORY[0x1E4F29088]);
    objc_super v7 = [MEMORY[0x1E4F1CB10] URLWithString:v5];
    v8 = (void *)[v6 initWithURL:v7 resolvingAgainstBaseURL:0];

    v9 = [MEMORY[0x1E4FA8100] defaultStore];
    v10 = [v9 activeAccount];

    id v11 = objc_alloc(MEMORY[0x1E4F290C8]);
    v12 = [v10 uniqueIdentifier];
    v13 = [v12 stringValue];
    v14 = (void *)[v11 initWithName:@"user" value:v13];
    v28 = v10;

    v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", v14, 0);
    [v8 setQueryItems:v15];
    id v16 = objc_alloc(MEMORY[0x1E4F18D50]);
    v17 = [v8 URL];
    v18 = (void *)[v16 initWithURL:v17];

    SSVAddMediaSocialHeadersToURLRequest();
    id v19 = [(SSVComplexOperation *)self newLoadURLOperationWithRequest:v18];
    v20 = [MEMORY[0x1E4FA8388] consumer];
    [v19 setDataConsumer:v20];

    uint64_t v30 = 0;
    v31 = &v30;
    uint64_t v32 = 0x3032000000;
    v33 = __Block_byref_object_copy__100;
    v34 = __Block_byref_object_dispose__100;
    id v35 = 0;
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __39__SKUIMediaSocialProfileOperation_main__block_invoke;
    v29[3] = &unk_1E6425980;
    v29[4] = &v30;
    v29[5] = &v36;
    [v19 setOutputBlock:v29];
    [(SSVOperation *)self runChildOperation:v19];
    if (v31[5])
    {
      uint64_t v21 = -[SKUIMediaSocialProfileOperation _profileWithResponseDictionary:](self, "_profileWithResponseDictionary:");
    }
    else
    {
      uint64_t v21 = 0;
    }
    if (!(v37[5] | v21))
    {
      v23 = [v19 URLResponse];
      if ([v23 statusCode] == 403) {
        [MEMORY[0x1E4F28C58] errorWithDomain:@"SKUIErrorDomain" code:3 userInfo:0];
      }
      else {
      uint64_t v24 = [MEMORY[0x1E4F28C58] errorWithDomain:@"SKUIErrorDomain" code:2 userInfo:0];
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

  uint64_t v26 = [(SKUIMediaSocialProfileOperation *)self outputBlock];
  v27 = (void *)v26;
  if (v26) {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v26 + 16))(v26, v21, v37[5]);
  }

  _Block_object_dispose(&v36, 8);
}

void __39__SKUIMediaSocialProfileOperation_main__block_invoke(uint64_t a1, void *a2, void *a3)
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
    id v4 = [[SKUIMediaSocialProfile alloc] initWithProfileDictionary:v3];
    id v5 = [v3 objectForKey:@"backgroundImage"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4FA81E8]) initWithLookupDictionary:v5];
      id v7 = objc_msgSend(v6, "URLWithHeight:width:", objc_msgSend(v6, "height"), objc_msgSend(v6, "width"));
      [(SKUIMediaSocialProfile *)v4 setBackgroundImageURL:v7];
    }
    v8 = [v3 objectForKey:@"profileImage"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4FA81E8]) initWithLookupDictionary:v8];
      uint64_t v10 = objc_msgSend(v9, "URLWithHeight:width:", objc_msgSend(v9, "height"), objc_msgSend(v9, "width"));
      [(SKUIMediaSocialProfile *)v4 setProfileImageURL:v10];
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

- (void)init
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIMediaSocialProfileOperation init]";
}

- (void)initWithClientContext:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIMediaSocialProfileOperation initWithClientContext:]";
}

@end