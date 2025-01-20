@interface SKUIMediaSocialSuggestedHandlesOperation
- (NSArray)words;
- (SKUIMediaSocialSuggestedHandlesOperation)initWithClientContext:(id)a3;
- (id)outputBlock;
- (void)main;
- (void)setOutputBlock:(id)a3;
- (void)setWords:(id)a3;
@end

@implementation SKUIMediaSocialSuggestedHandlesOperation

- (SKUIMediaSocialSuggestedHandlesOperation)initWithClientContext:(id)a3
{
  id v5 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIMediaSocialSuggestedHandlesOperation initWithClientContext:]();
  }
  v11.receiver = self;
  v11.super_class = (Class)SKUIMediaSocialSuggestedHandlesOperation;
  v6 = [(SSVOperation *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_clientContext, a3);
    v8 = (NSLock *)objc_alloc_init(MEMORY[0x1E4F28E08]);
    lock = v7->_lock;
    v7->_lock = v8;

    [(NSLock *)v7->_lock setName:@"com.apple.MediaSocial.suggestedHandles"];
  }

  return v7;
}

- (id)outputBlock
{
  [(NSLock *)self->_lock lock];
  v3 = (void *)[self->_outputBlock copy];
  [(NSLock *)self->_lock unlock];
  v4 = _Block_copy(v3);

  return v4;
}

- (NSArray)words
{
  [(NSLock *)self->_lock lock];
  v3 = (void *)[(NSArray *)self->_words copy];
  [(NSLock *)self->_lock unlock];

  return (NSArray *)v3;
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

- (void)setWords:(id)a3
{
  id v6 = (NSArray *)a3;
  [(NSLock *)self->_lock lock];
  if (self->_words != v6)
  {
    v4 = (NSArray *)[(NSArray *)v6 copy];
    words = self->_words;
    self->_words = v4;
  }
  [(NSLock *)self->_lock unlock];
}

- (void)main
{
  uint64_t v40 = 0;
  v41 = &v40;
  uint64_t v42 = 0x3032000000;
  v43 = __Block_byref_object_copy__92;
  v44 = __Block_byref_object_dispose__92;
  id v45 = 0;
  v3 = [(SKUIClientContext *)self->_clientContext URLBag];
  uint64_t v4 = *MEMORY[0x1E4FA89B0];
  id v5 = (id *)(v41 + 5);
  id obj = (id)v41[5];
  id v6 = [v3 valueForKey:v4 error:&obj];
  objc_storeStrong(v5, obj);

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v7 = [v6 objectForKey:@"suggestedHandles"];
  }
  else
  {
    v7 = 0;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = objc_alloc(MEMORY[0x1E4F29088]);
    v9 = [MEMORY[0x1E4F1CB10] URLWithString:v7];
    v10 = (void *)[v8 initWithURL:v9 resolvingAgainstBaseURL:0];

    objc_super v11 = [(SKUIMediaSocialSuggestedHandlesOperation *)self words];
    uint64_t v12 = [v11 componentsJoinedByString:@","];

    uint64_t v13 = [objc_alloc(MEMORY[0x1E4F290C8]) initWithName:@"words" value:v12];
    v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", v13, 0);
    [v10 setQueryItems:v14];
    id v15 = objc_alloc(MEMORY[0x1E4F18D50]);
    v16 = [v10 URL];
    v17 = (void *)[v15 initWithURL:v16];

    SSVAddMediaSocialHeadersToURLRequest();
    id v18 = [(SSVComplexOperation *)self newLoadURLOperationWithRequest:v17];
    v19 = [MEMORY[0x1E4FA8388] consumer];
    [v18 setDataConsumer:v19];
    v31 = (void *)v13;

    uint64_t v33 = 0;
    v34 = &v33;
    uint64_t v35 = 0x3032000000;
    v36 = __Block_byref_object_copy__92;
    v37 = __Block_byref_object_dispose__92;
    id v38 = 0;
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __48__SKUIMediaSocialSuggestedHandlesOperation_main__block_invoke;
    v32[3] = &unk_1E6425980;
    v32[4] = &v33;
    v32[5] = &v40;
    [v18 setOutputBlock:v32];
    [(SSVOperation *)self runChildOperation:v18];
    v20 = (void *)v12;
    v21 = (void *)v34[5];
    if (v21)
    {
      v22 = [v21 objectForKey:@"status"];
      v23 = v22;
      if (v22 && [v22 isEqualToString:@"success"])
      {
        uint64_t v24 = [(id)v34[5] objectForKey:@"suggestions"];
      }
      else
      {
        uint64_t v24 = 0;
      }
    }
    else
    {
      uint64_t v24 = 0;
    }
    if (!(v41[5] | v24))
    {
      v26 = [v18 URLResponse];
      if ([v26 statusCode] == 403) {
        [MEMORY[0x1E4F28C58] errorWithDomain:@"SKUIErrorDomain" code:3 userInfo:0];
      }
      else {
      uint64_t v27 = [MEMORY[0x1E4F28C58] errorWithDomain:@"SKUIErrorDomain" code:2 userInfo:0];
      }
      v28 = (void *)v41[5];
      v41[5] = v27;
    }
    _Block_object_dispose(&v33, 8);
  }
  else
  {
    uint64_t v25 = SSError();
    uint64_t v24 = 0;
    v10 = (void *)v41[5];
    v41[5] = v25;
  }

  uint64_t v29 = [(SKUIMediaSocialSuggestedHandlesOperation *)self outputBlock];
  v30 = (void *)v29;
  if (v29) {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v29 + 16))(v29, v24, v41[5]);
  }

  _Block_object_dispose(&v40, 8);
}

void __48__SKUIMediaSocialSuggestedHandlesOperation_main__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
    id v7 = v11;
LABEL_5:
    id v8 = *(void **)(v6 + 40);
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
  id v8 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;
LABEL_7:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_words, 0);
  objc_storeStrong(&self->_outputBlock, 0);
  objc_storeStrong((id *)&self->_lock, 0);

  objc_storeStrong((id *)&self->_clientContext, 0);
}

- (void)initWithClientContext:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIMediaSocialSuggestedHandlesOperation initWithClientContext:]";
}

@end