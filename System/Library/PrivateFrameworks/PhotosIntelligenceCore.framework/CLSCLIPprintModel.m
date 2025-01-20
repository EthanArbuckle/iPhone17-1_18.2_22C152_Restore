@interface CLSCLIPprintModel
+ (NSString)name;
+ (id)encodeText:(id)a3 textEncoder:(id)a4;
+ (id)encodeTextAverage:(id)a3 textEncoder:(id)a4;
+ (int64_t)requiredCSUCLIPTextEncoderRevision;
+ (unint64_t)baseSceneAnalysisVersionWithSceneAnalysisVersion:(unint64_t)a3;
+ (unint64_t)latestVersion;
- (CLSCLIPprintModel)initWithSceneAnalysisVersion:(unint64_t)a3;
- (id)initForTesting;
- (unint64_t)version;
- (void)setupVersion84;
@end

@implementation CLSCLIPprintModel

- (unint64_t)version
{
  return self->_version;
}

- (void)setupVersion84
{
  self->_version = 84;
}

- (id)initForTesting
{
  unint64_t v3 = +[CLSCLIPprintModel latestVersion];
  return [(CLSCLIPprintModel *)self initWithSceneAnalysisVersion:v3];
}

- (CLSCLIPprintModel)initWithSceneAnalysisVersion:(unint64_t)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v8.receiver = self;
  v8.super_class = (Class)CLSCLIPprintModel;
  v4 = [(CLSCLIPprintModel *)&v8 init];
  v5 = v4;
  if (v4)
  {
    if (a3 < 0x54)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v6 = objc_opt_class();
        *(_DWORD *)buf = 67109378;
        int v10 = a3;
        __int16 v11 = 2112;
        uint64_t v12 = v6;
        _os_log_impl(&dword_259939000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Unsupported version %d in %@", buf, 0x12u);
      }

      return 0;
    }
    else
    {
      [(CLSCLIPprintModel *)v4 setupVersion84];
    }
  }
  return v5;
}

+ (id)encodeTextAverage:(id)a3 textEncoder:(id)a4
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v44 objects:v49 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v45;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v45 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = +[CLSCLIPprintModel encodeText:*(void *)(*((void *)&v44 + 1) + 8 * i) textEncoder:v6];
        if (!v13)
        {
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl(&dword_259939000, &_os_log_internal, OS_LOG_TYPE_ERROR, "[CLSCLIPprintModel] CLIP Embedding for text failed batch", buf, 2u);
          }

          goto LABEL_33;
        }
        v14 = (void *)v13;
        [v7 addObject:v13];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v44 objects:v49 count:16];
    }
    while (v10);
  }

  if (![v7 count])
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_259939000, &_os_log_internal, OS_LOG_TYPE_ERROR, "[CLSCLIPprintModel] CLIP Embedding for text returned no results", buf, 2u);
    }
LABEL_33:
    id v33 = 0;
    goto LABEL_44;
  }
  v15 = [v7 firstObject];
  unint64_t v16 = [v15 length];

  id v17 = (id) [objc_alloc(MEMORY[0x263EFF990]) initWithLength:v16];
  uint64_t v18 = [v17 mutableBytes];
  if (!v18)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_259939000, &_os_log_internal, OS_LOG_TYPE_ERROR, "[CLSCLIPprintModel] CLIP Embedding failed to create a mutable byte array", buf, 2u);
    }
    id v33 = 0;
    goto LABEL_43;
  }
  v19 = (float *)v18;
  v37 = v17;
  unint64_t v20 = v16 >> 2;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  obuint64_t j = v7;
  uint64_t v21 = [obj countByEnumeratingWithState:&v39 objects:v48 count:16];
  if (!v21) {
    goto LABEL_24;
  }
  uint64_t v22 = v21;
  uint64_t v23 = *(void *)v40;
  if (v20 <= 1) {
    uint64_t v24 = 1;
  }
  else {
    uint64_t v24 = v16 >> 2;
  }
  while (2)
  {
    for (uint64_t j = 0; j != v22; ++j)
    {
      if (*(void *)v40 != v23) {
        objc_enumerationMutation(obj);
      }
      v26 = *(void **)(*((void *)&v39 + 1) + 8 * j);
      if ([v26 length] != v16)
      {
        if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
        {
LABEL_42:

          id v33 = 0;
          id v17 = v37;
          goto LABEL_43;
        }
        *(_WORD *)buf = 0;
        v34 = &_os_log_internal;
        v35 = "[CLSCLIPprintModel] CLIP Embedding failed, inconsistent embedding length";
LABEL_48:
        _os_log_error_impl(&dword_259939000, v34, OS_LOG_TYPE_ERROR, v35, buf, 2u);
        goto LABEL_42;
      }
      v27 = (float *)[v26 bytes];
      if (!v27)
      {
        if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          goto LABEL_42;
        }
        *(_WORD *)buf = 0;
        v34 = &_os_log_internal;
        v35 = "[CLSCLIPprintModel] CLIP Embedding failed to read embedding byte array";
        goto LABEL_48;
      }
      v28 = v19;
      uint64_t v29 = v24;
      if (v16 >= 4)
      {
        do
        {
          float v30 = *v27++;
          float *v28 = v30 + *v28;
          ++v28;
          --v29;
        }
        while (v29);
      }
    }
    uint64_t v22 = [obj countByEnumeratingWithState:&v39 objects:v48 count:16];
    unint64_t v20 = v16 >> 2;
    if (v22) {
      continue;
    }
    break;
  }
LABEL_24:

  unint64_t v31 = [obj count];
  if (v16 >= 4)
  {
    if (v20 <= 1) {
      uint64_t v32 = 1;
    }
    else {
      uint64_t v32 = v20;
    }
    do
    {
      float *v19 = (float)(1.0 / (float)v31) * *v19;
      ++v19;
      --v32;
    }
    while (v32);
  }
  id v17 = v37;
  id v33 = v37;
LABEL_43:

LABEL_44:
  return v33;
}

+ (id)encodeText:(id)a3 textEncoder:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy_;
  unint64_t v20 = __Block_byref_object_dispose_;
  id v21 = 0;
  dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __44__CLSCLIPprintModel_encodeText_textEncoder___block_invoke;
  v12[3] = &unk_2654540B8;
  v15 = &v16;
  id v8 = v7;
  uint64_t v13 = v8;
  id v9 = v5;
  id v14 = v9;
  [v6 runOnInputText:v9 completion:v12];
  dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
  id v10 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  return v10;
}

void __44__CLSCLIPprintModel_encodeText_textEncoder___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    dispatch_semaphore_t v7 = [v5 clipTextEmbedding];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __44__CLSCLIPprintModel_encodeText_textEncoder___block_invoke_2;
    v9[3] = &unk_265454090;
    uint64_t v11 = *(void *)(a1 + 48);
    id v10 = *(id *)(a1 + 32);
    [v7 accessDataUsingBlock:v9];
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      uint64_t v13 = v8;
      __int16 v14 = 2112;
      id v15 = v6;
      _os_log_error_impl(&dword_259939000, &_os_log_internal, OS_LOG_TYPE_ERROR, "[CLSCLIPprintModel] CLIP Embedding for text query %@ is nil, failed with error %@", buf, 0x16u);
    }
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  }
}

intptr_t __44__CLSCLIPprintModel_encodeText_textEncoder___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = [objc_alloc(MEMORY[0x263EFF8F8]) initWithBytes:a2 length:a3];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  dispatch_semaphore_t v7 = *(NSObject **)(a1 + 32);
  return dispatch_semaphore_signal(v7);
}

+ (int64_t)requiredCSUCLIPTextEncoderRevision
{
  return -1;
}

+ (unint64_t)latestVersion
{
  return 84;
}

+ (NSString)name
{
  return (NSString *)@"CLIPprint";
}

+ (unint64_t)baseSceneAnalysisVersionWithSceneAnalysisVersion:(unint64_t)a3
{
  if (a3 >= 0x54) {
    return 84;
  }
  else {
    return 0;
  }
}

@end