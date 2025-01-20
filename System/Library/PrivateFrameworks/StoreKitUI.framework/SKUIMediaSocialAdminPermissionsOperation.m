@interface SKUIMediaSocialAdminPermissionsOperation
- (SKUIMediaSocialAdminPermissionsOperation)initWithClientContext:(id)a3;
- (id)_authorsWithResponseDictionary:(id)a3;
- (id)_lookupResponseForMissingAuthors:(id)a3 error:(id *)a4;
- (id)outputBlock;
- (void)main;
- (void)setOutputBlock:(id)a3;
@end

@implementation SKUIMediaSocialAdminPermissionsOperation

- (SKUIMediaSocialAdminPermissionsOperation)initWithClientContext:(id)a3
{
  id v5 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIMediaSocialAdminPermissionsOperation initWithClientContext:]();
  }
  v10.receiver = self;
  v10.super_class = (Class)SKUIMediaSocialAdminPermissionsOperation;
  v6 = [(SSVOperation *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_clientContext, a3);
    v8 = [(SKUIClientContext *)v7->_clientContext URLBag];
    [(SSVComplexOperation *)v7 configureWithURLBag:v8];
  }
  return v7;
}

- (id)outputBlock
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__24;
  v9 = __Block_byref_object_dispose__24;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __55__SKUIMediaSocialAdminPermissionsOperation_outputBlock__block_invoke;
  v4[3] = &unk_1E6422538;
  v4[4] = self;
  v4[5] = &v5;
  [(SSVOperation *)self dispatchSync:v4];
  v2 = _Block_copy((const void *)v6[5]);
  _Block_object_dispose(&v5, 8);

  return v2;
}

uint64_t __55__SKUIMediaSocialAdminPermissionsOperation_outputBlock__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 320) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return MEMORY[0x1F41817F8](v2, v4);
}

- (void)setOutputBlock:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __59__SKUIMediaSocialAdminPermissionsOperation_setOutputBlock___block_invoke;
  v6[3] = &unk_1E6423820;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(SSVOperation *)self dispatchAsync:v6];
}

void *__59__SKUIMediaSocialAdminPermissionsOperation_setOutputBlock___block_invoke(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  result = *(void **)(a1 + 40);
  if (*(void **)(v3 + 320) != result)
  {
    uint64_t v4 = [result copy];
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(v5 + 320);
    *(void *)(v5 + 320) = v4;
    return (void *)MEMORY[0x1F41817F8](v4, v6);
  }
  return result;
}

- (void)main
{
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__4;
  v28 = __Block_byref_object_dispose__5;
  id v29 = 0;
  uint64_t v3 = [(SSVComplexOperation *)self URLBagDictionary];
  uint64_t v4 = [v3 objectForKey:*MEMORY[0x1E4FA89B0]];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [v4 objectForKey:@"profilePermissions"];
  }
  else
  {
    uint64_t v5 = 0;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:v5];
    id v7 = (void *)[objc_alloc(MEMORY[0x1E4F18D50]) initWithURL:v6];
    SSVAddMediaSocialHeadersToURLRequest();
    id v8 = [(SSVComplexOperation *)self newLoadURLOperationWithRequest:v7];
    v9 = [MEMORY[0x1E4FA8388] consumer];
    [v8 setDataConsumer:v9];

    uint64_t v18 = 0;
    v19 = &v18;
    uint64_t v20 = 0x3032000000;
    v21 = __Block_byref_object_copy__4;
    v22 = __Block_byref_object_dispose__5;
    id v23 = 0;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __48__SKUIMediaSocialAdminPermissionsOperation_main__block_invoke;
    v17[3] = &unk_1E6425980;
    v17[4] = &v18;
    v17[5] = &v24;
    [v8 setOutputBlock:v17];
    [(SSVOperation *)self runChildOperation:v8];
    if (v19[5])
    {
      id v10 = -[SKUIMediaSocialAdminPermissionsOperation _authorsWithResponseDictionary:](self, "_authorsWithResponseDictionary:");
    }
    else
    {
      id v10 = 0;
    }
    if (!v25[5] && ![v10 count])
    {
      v12 = [v8 URLResponse];
      if ([v12 statusCode] == 403) {
        [MEMORY[0x1E4F28C58] errorWithDomain:@"SKUIErrorDomain" code:3 userInfo:0];
      }
      else {
      uint64_t v13 = [MEMORY[0x1E4F28C58] errorWithDomain:@"SKUIErrorDomain" code:2 userInfo:0];
      }
      v14 = (void *)v25[5];
      v25[5] = v13;
    }
    _Block_object_dispose(&v18, 8);
  }
  else
  {
    uint64_t v11 = SSError();
    id v10 = 0;
    uint64_t v6 = (void *)v25[5];
    v25[5] = v11;
  }

  uint64_t v15 = [(SKUIMediaSocialAdminPermissionsOperation *)self outputBlock];
  v16 = (void *)v15;
  if (v15) {
    (*(void (**)(uint64_t, void *, uint64_t))(v15 + 16))(v15, v10, v25[5]);
  }

  _Block_object_dispose(&v24, 8);
}

void __48__SKUIMediaSocialAdminPermissionsOperation_main__block_invoke(uint64_t a1, void *a2, void *a3)
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

- (id)_authorsWithResponseDictionary:(id)a3
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v6 = [v4 objectForKey:@"permissions"];
  if (!v6)
  {
    uint64_t v6 = [v4 objectForKey:@"persmissions"];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v54 = v4;
    id v7 = [v4 objectForKey:@"storePlatformData"];
    unint64_t v8 = 0x1E4F1C000uLL;
    objc_opt_class();
    v55 = v5;
    v51 = self;
    v52 = v7;
    if (objc_opt_isKindOfClass())
    {
      uint64_t v9 = [v7 objectForKey:@"artist"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v10 = [v9 objectForKey:@"results"];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          id v11 = v10;
        }
        else {
          id v11 = 0;
        }
      }
      else
      {
        id v11 = 0;
      }
    }
    else
    {
      id v11 = 0;
    }
    id v58 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v56 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v68 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    v53 = v6;
    obuint64_t j = v6;
    uint64_t v12 = [obj countByEnumeratingWithState:&v68 objects:v74 count:16];
    v57 = v11;
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v69;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v69 != v14) {
            objc_enumerationMutation(obj);
          }
          uint64_t v16 = *(void *)(*((void *)&v68 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v17 = [[SKUIMediaSocialAuthor alloc] initWithAuthorDictionary:v16];
            uint64_t v18 = [(SKUIMediaSocialAuthor *)v17 identifier];
            if (v18)
            {
              v19 = [v11 objectForKey:v18];
              unint64_t v20 = v8;
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v21 = (void *)[objc_alloc(MEMORY[0x1E4FA81E0]) initWithLookupDictionary:v19];
                v22 = [v21 artwork];
                id v23 = [v22 lastObject];

                uint64_t v24 = [v21 displayName];
                [(SKUIMediaSocialAuthor *)v17 setName:v24];

                v25 = [v23 URLWithHeight:125 width:125];
                [(SKUIMediaSocialAuthor *)v17 setThumbnailImageURL:v25];

                id v11 = v57;
                [(SKUIMediaSocialAuthor *)v17 setStorePlatformData:v19];
              }
              uint64_t v26 = [(SKUIMediaSocialAuthor *)v17 name];
              uint64_t v27 = [v26 length];

              if (!v27) {
                [v56 addObject:v17];
              }
              [v58 addObject:v17];

              unint64_t v8 = v20;
            }
          }
        }
        uint64_t v13 = [obj countByEnumeratingWithState:&v68 objects:v74 count:16];
      }
      while (v13);
    }

    if ([v56 count])
    {
      v28 = [(SKUIMediaSocialAdminPermissionsOperation *)v51 _lookupResponseForMissingAuthors:v56 error:0];
      long long v64 = 0u;
      long long v65 = 0u;
      long long v66 = 0u;
      long long v67 = 0u;
      id v29 = v56;
      uint64_t v30 = [v29 countByEnumeratingWithState:&v64 objects:v73 count:16];
      if (v30)
      {
        uint64_t v31 = v30;
        uint64_t v32 = *(void *)v65;
        do
        {
          for (uint64_t j = 0; j != v31; ++j)
          {
            if (*(void *)v65 != v32) {
              objc_enumerationMutation(v29);
            }
            v34 = *(void **)(*((void *)&v64 + 1) + 8 * j);
            v35 = [v34 identifier];
            v36 = [v28 itemForKey:v35];

            v37 = [v36 artwork];
            v38 = [v37 lastObject];

            v39 = [v36 displayName];
            [v34 setName:v39];

            v40 = [v38 URL];
            [v34 setThumbnailImageURL:v40];

            v41 = [v36 lookupDictionary];
            [v34 setStorePlatformData:v41];
          }
          uint64_t v31 = [v29 countByEnumeratingWithState:&v64 objects:v73 count:16];
        }
        while (v31);
      }
    }
    long long v62 = 0u;
    long long v63 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    id v42 = v58;
    uint64_t v43 = [v42 countByEnumeratingWithState:&v60 objects:v72 count:16];
    id v5 = v55;
    if (v43)
    {
      uint64_t v44 = v43;
      uint64_t v45 = *(void *)v61;
      do
      {
        for (uint64_t k = 0; k != v44; ++k)
        {
          if (*(void *)v61 != v45) {
            objc_enumerationMutation(v42);
          }
          v47 = *(void **)(*((void *)&v60 + 1) + 8 * k);
          v48 = [v47 name];
          uint64_t v49 = [v48 length];

          if (v49) {
            [v55 addObject:v47];
          }
        }
        uint64_t v44 = [v42 countByEnumeratingWithState:&v60 objects:v72 count:16];
      }
      while (v44);
    }

    uint64_t v6 = v53;
    id v4 = v54;
  }

  return v5;
}

- (id)_lookupResponseForMissingAuthors:(id)a3 error:(id *)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v33 = 0;
  v34 = &v33;
  uint64_t v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__4;
  v37 = __Block_byref_object_dispose__5;
  id v38 = 0;
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x3032000000;
  uint64_t v30 = __Block_byref_object_copy__4;
  uint64_t v31 = __Block_byref_object_dispose__5;
  id v32 = 0;
  id v7 = objc_alloc(MEMORY[0x1E4FA8348]);
  unint64_t v8 = [(SKUIClientContext *)self->_clientContext URLBag];
  uint64_t v9 = [v8 existingBagDictionary];
  uint64_t v10 = (void *)[v7 initWithBagDictionary:v9];

  id v11 = (void *)[objc_alloc(MEMORY[0x1E4FA8350]) initWithPlatformContext:v10];
  [v11 setKeyProfile:*MEMORY[0x1E4FA86D0]];
  [v11 setPersonalizationStyle:2];
  uint64_t v12 = [(SKUIClientContext *)self->_clientContext valueForConfigurationKey:@"sfsuffix"];
  [v11 setStoreFrontSuffix:v12];

  id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v14 = v6;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v23 objects:v39 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v24 != v16) {
          objc_enumerationMutation(v14);
        }
        uint64_t v18 = [*(id *)(*((void *)&v23 + 1) + 8 * i) identifier];
        [v13 addObject:v18];
      }
      uint64_t v15 = [v14 countByEnumeratingWithState:&v23 objects:v39 count:16];
    }
    while (v15);
  }

  [v11 setItemIdentifiers:v13];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __83__SKUIMediaSocialAdminPermissionsOperation__lookupResponseForMissingAuthors_error___block_invoke;
  v22[3] = &unk_1E64259A8;
  v22[4] = &v33;
  v22[5] = &v27;
  [v11 setResponseBlock:v22];
  [(SSVOperation *)self runChildOperation:v11];
  v19 = (void *)v28[5];
  if (a4 && !v19)
  {
    *a4 = (id) v34[5];
    v19 = (void *)v28[5];
  }
  id v20 = v19;

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v33, 8);

  return v20;
}

void __83__SKUIMediaSocialAdminPermissionsOperation__lookupResponseForMissingAuthors_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  id v8 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_outputBlock, 0);

  objc_storeStrong((id *)&self->_clientContext, 0);
}

- (void)initWithClientContext:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIMediaSocialAdminPermissionsOperation initWithClientContext:]";
}

@end