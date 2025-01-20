@interface FCGzipAssetTransformer
+ (id)sharedInstance;
- (BOOL)transformAssetDataFromFilePath:(id)a3 toFilePath:(id)a4 error:(id *)a5;
@end

@implementation FCGzipAssetTransformer

+ (id)sharedInstance
{
  if (qword_1EB5D1BD8 != -1) {
    dispatch_once(&qword_1EB5D1BD8, &__block_literal_global_178);
  }
  v2 = (void *)_MergedGlobals_226;
  return v2;
}

uint64_t __40__FCGzipAssetTransformer_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(FCGzipAssetTransformer);
  uint64_t v1 = _MergedGlobals_226;
  _MergedGlobals_226 = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (BOOL)transformAssetDataFromFilePath:(id)a3 toFilePath:(id)a4 error:(id *)a5
{
  v8 = (void *)MEMORY[0x1E4F1CA10];
  id v9 = a4;
  v10 = [v8 inputStreamWithFileAtPath:a3];
  v11 = [MEMORY[0x1E4F1CAA8] outputStreamToFileAtPath:v9 append:0];

  [v10 open];
  [v11 open];
  id v12 = v10;
  id v13 = v11;
  if (self)
  {
    v14 = [MEMORY[0x1E4F1CA58] dataWithLength:0x2000];
    v15 = [MEMORY[0x1E4F1CA58] dataWithLength:0x2000];
    memset(&v33.avail_in, 0, 104);
    id v16 = v14;
    v33.next_in = (Bytef *)[v16 bytes];
    id v17 = v15;
    v33.next_out = (Bytef *)objc_msgSend(v17, "bytes", v33.next_in);
    v33.avail_out = [v17 length];
    if (inflateInit2_(&v33, 47, "1.2.12", 112))
    {
LABEL_3:
      id v18 = 0;
    }
    else
    {
      do
      {
        while (1)
        {
          int v21 = inflate(&v33, 0);
          if (v21 != -5) {
            break;
          }
          if (v33.avail_in)
          {
            id v22 = v17;
            uint64_t v23 = [v22 bytes];
            next_out = v33.next_out;
            id v25 = v22;
            if (objc_msgSend(v13, "write:maxLength:", v23, &next_out[-objc_msgSend(v25, "bytes")]) == -1)
            {
              v32 = v13;
              goto LABEL_26;
            }
            id v18 = v25;
            v33.next_out = (Bytef *)[v18 bytes];
            LODWORD(v18) = [v18 length];
            p_avail_out = &v33.avail_out;
          }
          else
          {
            id v27 = v16;
            uint64_t v28 = objc_msgSend(v12, "read:maxLength:", objc_msgSend(v27, "mutableBytes"), objc_msgSend(v27, "length"));
            if (v28 == -1)
            {
              v32 = v12;
              goto LABEL_26;
            }
            id v18 = (id)v28;
            if (!v28) {
              goto LABEL_4;
            }
            v33.next_in = (Bytef *)[v27 bytes];
            p_avail_out = &v33.avail_in;
          }
          uInt *p_avail_out = v18;
        }
      }
      while (!v21);
      if (v21 != 1) {
        goto LABEL_3;
      }
      id v29 = v17;
      uint64_t v30 = [v29 bytes];
      uint64_t v31 = objc_msgSend(v13, "write:maxLength:", v30, &v33.next_out[-objc_msgSend(v29, "bytes")]);
      v32 = v13;
      if (v31 != -1)
      {
        id v18 = 0;
        BOOL v19 = 1;
        goto LABEL_5;
      }
LABEL_26:
      objc_msgSend(v32, "streamError", v33.next_in);
      id v18 = (id)objc_claimAutoreleasedReturnValue();
    }
LABEL_4:
    BOOL v19 = 0;
LABEL_5:
    if (inflateEnd(&v33)) {
      BOOL v19 = 0;
    }
    if (a5) {
      *a5 = v18;
    }
  }
  else
  {
    BOOL v19 = 0;
  }

  [v12 close];
  [v13 close];

  return v19;
}

@end