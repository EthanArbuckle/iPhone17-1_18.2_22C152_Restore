@interface SiriCoreZlibDataCompressor
- (SiriCoreZlibDataCompressor)init;
- (id)compressedDataForData:(id)a3 error:(id *)a4;
- (void)dealloc;
@end

@implementation SiriCoreZlibDataCompressor

- (id)compressedDataForData:(id)a3 error:(id *)a4
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  v6 = a3;
  v7 = v6;
  if (v6 && dispatch_data_get_size(v6))
  {
    uint64_t v22 = 0;
    v23 = &v22;
    uint64_t v24 = 0x3032000000;
    v25 = __Block_byref_object_copy__2930;
    v26 = __Block_byref_object_dispose__2931;
    v8 = (void *)MEMORY[0x263EF8388];
    id v9 = MEMORY[0x263EF8388];
    id v27 = v8;
    uint64_t v18 = 0;
    v19 = &v18;
    uint64_t v20 = 0x2020000000;
    int v21 = 0;
    applier[0] = MEMORY[0x263EF8330];
    applier[1] = 3221225472;
    applier[2] = __58__SiriCoreZlibDataCompressor_compressedDataForData_error___block_invoke;
    applier[3] = &unk_26443ADA8;
    applier[4] = self;
    applier[5] = &v18;
    applier[6] = &v22;
    dispatch_data_apply(v7, applier);
    unsigned int v10 = *((_DWORD *)v19 + 6);
    if (v10 >= 2)
    {
      v11 = *MEMORY[0x263F28358];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28358], OS_LOG_TYPE_ERROR))
      {
        msg = self->_deflateStream.msg;
        *(_DWORD *)buf = 136315650;
        v29 = "-[SiriCoreZlibDataCompressor compressedDataForData:error:]";
        __int16 v30 = 1026;
        unsigned int v31 = v10;
        __int16 v32 = 2080;
        v33 = msg;
        _os_log_error_impl(&dword_21CBF7000, v11, OS_LOG_TYPE_ERROR, "%s Deflate finished with unexpected status %{public}d. %s", buf, 0x1Cu);
      }
      v12 = (void *)v23[5];
      v23[5] = 0;

      if (a4)
      {
        *a4 = [MEMORY[0x263F087E8] errorWithDomain:@"SiriCoreDataCompressorErrorDomain" code:*((int *)v19 + 6) userInfo:0];
      }
    }
    id v13 = (id)v23[5];
    _Block_object_dispose(&v18, 8);
    _Block_object_dispose(&v22, 8);
  }
  else
  {
    id v13 = (id)MEMORY[0x263EF8388];
    id v14 = MEMORY[0x263EF8388];
  }

  return v13;
}

uint64_t __58__SiriCoreZlibDataCompressor_compressedDataForData_error___block_invoke(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  *(void *)(a1[4] + 8) = a4;
  *(_DWORD *)(a1[4] + 16) = a5;
  uint64_t v6 = a1[4];
  while (1)
  {
    *(void *)(v6 + 32) = v6 + 120;
    *(_DWORD *)(a1[4] + 40) = 0x2000;
    *(_DWORD *)(*(void *)(a1[5] + 8) + 24) = deflate((z_streamp)(a1[4] + 8), 2);
    if (*(_DWORD *)(*(void *)(a1[5] + 8) + 24) > 1u) {
      break;
    }
    v7 = dispatch_data_create((const void *)(a1[4] + 120), 0x2000 - *(unsigned int *)(a1[4] + 40), 0, 0);
    dispatch_data_t concat = dispatch_data_create_concat(*(dispatch_data_t *)(*(void *)(a1[6] + 8) + 40), v7);
    uint64_t v9 = *(void *)(a1[6] + 8);
    unsigned int v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = concat;

    if (*(_DWORD *)(*(void *)(a1[5] + 8) + 24)) {
      break;
    }
    uint64_t v6 = a1[4];
    if (*(_DWORD *)(v6 + 40)) {
      return 1;
    }
  }
  return 0;
}

- (void)dealloc
{
  deflateEnd(&self->_deflateStream);
  v3.receiver = self;
  v3.super_class = (Class)SiriCoreZlibDataCompressor;
  [(SiriCoreZlibDataCompressor *)&v3 dealloc];
}

- (SiriCoreZlibDataCompressor)init
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v9.receiver = self;
  v9.super_class = (Class)SiriCoreZlibDataCompressor;
  v2 = [(SiriCoreZlibDataCompressor *)&v9 init];
  objc_super v3 = v2;
  if (v2
    && (v2->_deflateStream.zfree = 0,
        v2->_deflateStream.opaque = 0,
        v2->_deflateStream.zalloc = 0,
        (int v4 = deflateInit_(&v2->_deflateStream, 9, "1.2.12", 112)) != 0))
  {
    int v5 = v4;
    uint64_t v6 = *MEMORY[0x263F28358];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28358], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v11 = "-[SiriCoreZlibDataCompressor init]";
      __int16 v12 = 1026;
      int v13 = v5;
      _os_log_error_impl(&dword_21CBF7000, v6, OS_LOG_TYPE_ERROR, "%s inflateInit failed with status %{public}d", buf, 0x12u);
    }
    v7 = 0;
  }
  else
  {
    v7 = v3;
  }

  return v7;
}

@end