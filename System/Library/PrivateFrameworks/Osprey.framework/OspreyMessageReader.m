@interface OspreyMessageReader
- (OspreyMessageReader)initWithMessageHandler:(id)a3;
- (void)_produceMessageBody:(id)a3;
- (void)readData:(id)a3;
@end

@implementation OspreyMessageReader

- (OspreyMessageReader)initWithMessageHandler:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)OspreyMessageReader;
  v5 = [(OspreyMessageReader *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    id messageHandler = v5->_messageHandler;
    v5->_id messageHandler = (id)v6;
  }
  return v5;
}

- (void)_produceMessageBody:(id)a3
{
  id v4 = a3;
  OspreyLoggingInit();
  v5 = (void *)OspreyLogContextGRPC;
  if (os_log_type_enabled((os_log_t)OspreyLogContextGRPC, OS_LOG_TYPE_DEBUG)) {
    [(OspreyMessageReader *)(uint64_t)self _produceMessageBody:v4];
  }
  id messageHandler = (void (**)(id, id))self->_messageHandler;
  if (messageHandler) {
    messageHandler[2](messageHandler, v4);
  }
}

- (void)readData:(id)a3
{
  id v4 = a3;
  OspreyLoggingInit();
  v5 = (void *)OspreyLogContextGRPC;
  if (os_log_type_enabled((os_log_t)OspreyLogContextGRPC, OS_LOG_TYPE_DEBUG)) {
    [(OspreyMessageReader *)(uint64_t)self readData:v4];
  }
  if (self->_readerState == 1)
  {
    OspreyLoggingInit();
    uint64_t v6 = (void *)OspreyLogContextGRPC;
    if (os_log_type_enabled((os_log_t)OspreyLogContextGRPC, OS_LOG_TYPE_DEBUG)) {
      -[OspreyMessageReader readData:]((uint64_t)self, v6);
    }
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __32__OspreyMessageReader_readData___block_invoke;
  v8[3] = &unk_1E63CBA70;
  v8[4] = self;
  v8[5] = 5;
  [v4 enumerateByteRangesUsingBlock:v8];
  if (self->_readerState == 1)
  {
    OspreyLoggingInit();
    v7 = (void *)OspreyLogContextGRPC;
    if (os_log_type_enabled((os_log_t)OspreyLogContextGRPC, OS_LOG_TYPE_DEBUG)) {
      -[OspreyMessageReader readData:]((uint64_t)self, v7);
    }
  }
}

void __32__OspreyMessageReader_readData___block_invoke(uint64_t a1, uint64_t a2, __n128 a3, uint64_t a4, unint64_t a5)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  if (a5)
  {
    a3.n128_u64[0] = 136315650;
    __n128 v35 = a3;
    unint64_t v8 = a5;
    do
    {
      uint64_t v9 = *(void *)(a1 + 32);
      if (!*(void *)(v9 + 48))
      {
        if (!*(void *)(v9 + 16)) {
          uint64_t v9 = a1;
        }
        uint64_t v10 = [objc_alloc(MEMORY[0x1E4F1CA58]) initWithCapacity:*(void *)(v9 + 40)];
        uint64_t v11 = *(void *)(a1 + 32);
        v12 = *(void **)(v11 + 48);
        *(void *)(v11 + 48) = v10;

        uint64_t v9 = *(void *)(a1 + 32);
      }
      unint64_t v13 = a5 - v8;
      uint64_t v14 = *(void *)(v9 + 16);
      if (v14 == 1)
      {
        uint64_t v21 = [*(id *)(v9 + 48) length];
        uint64_t v22 = *(void *)(a1 + 32);
        unint64_t v23 = *(void *)(v22 + 40);
        if (v21 + v8 <= v23)
        {
          unint64_t v24 = v8;
        }
        else
        {
          unint64_t v24 = v23 - [*(id *)(v22 + 48) length];
          uint64_t v22 = *(void *)(a1 + 32);
        }
        objc_msgSend(*(id *)(v22 + 48), "appendBytes:length:", a2 + v13, v24, *(_OWORD *)&v35);
        v8 -= v24;
        uint64_t v25 = [*(id *)(*(void *)(a1 + 32) + 48) length];
        uint64_t v26 = *(void *)(a1 + 32);
        if (v25 == *(void *)(v26 + 40))
        {
          if (*(unsigned char *)(v26 + 32))
          {
            v27 = [[OspreyZlibDataDecompressor alloc] initWithOptions:31];
            v28 = (void *)[*(id *)(*(void *)(a1 + 32) + 48) _createDispatchData];
            id v36 = 0;
            v29 = [(OspreyZlibDataDecompressor *)v27 decompressedDataForData:v28 error:&v36];
            id v30 = v36;

            if (v30 || !v29)
            {
              OspreyLoggingInit();
              v31 = OspreyLogContextGRPC;
              if (os_log_type_enabled((os_log_t)OspreyLogContextGRPC, OS_LOG_TYPE_ERROR))
              {
                uint64_t v34 = *(void *)(*(void *)(a1 + 32) + 24);
                *(_DWORD *)buf = v35.n128_u32[0];
                v38 = "-[OspreyMessageReader readData:]_block_invoke";
                __int16 v39 = 2048;
                uint64_t v40 = v34;
                __int16 v41 = 2112;
                id v42 = v30;
                _os_log_error_impl(&dword_1BEDB4000, v31, OS_LOG_TYPE_ERROR, "%s Error decompressing message %lu with %@", buf, 0x20u);
              }
            }
            else
            {
              [*(id *)(a1 + 32) _produceMessageBody:v29];
            }
          }
          else
          {
            id v30 = (id)[*(id *)(v26 + 48) copy];
            [(id)v26 _produceMessageBody:v30];
          }

          uint64_t v32 = *(void *)(a1 + 32);
          v33 = *(void **)(v32 + 48);
          *(void *)(v32 + 48) = 0;

          *(unsigned char *)(*(void *)(a1 + 32) + 32) = 0;
          *(void *)(*(void *)(a1 + 32) + 40) = 0;
          *(void *)(*(void *)(a1 + 32) + 16) = 0;
          ++*(void *)(*(void *)(a1 + 32) + 24);
        }
      }
      else if (!v14)
      {
        uint64_t v15 = [*(id *)(v9 + 48) length];
        unint64_t v16 = *(void *)(a1 + 40);
        unint64_t v17 = v8;
        if (v15 + v8 > v16) {
          unint64_t v17 = v16 - [*(id *)(*(void *)(a1 + 32) + 48) length];
        }
        objc_msgSend(*(id *)(*(void *)(a1 + 32) + 48), "appendBytes:length:", a2 + v13, v17, *(_OWORD *)&v35);
        v8 -= v17;
        if ([*(id *)(*(void *)(a1 + 32) + 48) length] == *(void *)(a1 + 40))
        {
          uint64_t v18 = [*(id *)(*(void *)(a1 + 32) + 48) bytes];
          *(void *)(*(void *)(a1 + 32) + 40) = bswap32(*(_DWORD *)(v18 + 1));
          *(unsigned char *)(*(void *)(a1 + 32) + 32) = *(unsigned char *)v18 != 0;
          uint64_t v19 = *(void *)(a1 + 32);
          v20 = *(void **)(v19 + 48);
          *(void *)(v19 + 48) = 0;

          *(void *)(*(void *)(a1 + 32) + 16) = 1;
        }
      }
    }
    while (v8);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageBuffer, 0);

  objc_storeStrong(&self->_messageHandler, 0);
}

- (void)_produceMessageBody:(void *)a3 .cold.1(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *(void *)(a1 + 24);
  int v5 = *(unsigned __int8 *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  v7 = a2;
  [a3 length];
  v10[0] = 136316418;
  OUTLINED_FUNCTION_0_1();
  uint64_t v11 = v4;
  __int16 v12 = 1024;
  int v13 = v5;
  __int16 v14 = v8;
  uint64_t v15 = v6;
  __int16 v16 = v8;
  uint64_t v17 = v9;
  _os_log_debug_impl(&dword_1BEDB4000, v7, OS_LOG_TYPE_DEBUG, "%s %@ [%lu] Parsed gRPC message { compressed: %d, size: %lu, bodySize: %lu }", (uint8_t *)v10, 0x3Au);
}

- (void)readData:(uint64_t)a1 .cold.1(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 48);
  id v3 = a2;
  [v2 length];
  OUTLINED_FUNCTION_1_1(&dword_1BEDB4000, v4, v5, "%s %@ [%lu] Processed %lu of %lu bytes of message body", v6, v7, v8, v9, 2u);
}

- (void)readData:(uint64_t)a1 .cold.2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 48);
  id v3 = a2;
  [v2 length];
  OUTLINED_FUNCTION_1_1(&dword_1BEDB4000, v4, v5, "%s %@ [%lu] Looking for %lu of %lu bytes of message body", v6, v7, v8, v9, 2u);
}

- (void)readData:(void *)a3 .cold.3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = a2;
  [a3 length];
  v6[0] = 136315650;
  OUTLINED_FUNCTION_0_1();
  uint64_t v7 = v5;
  _os_log_debug_impl(&dword_1BEDB4000, v4, OS_LOG_TYPE_DEBUG, "%s %@ Reading data of size: %lu", (uint8_t *)v6, 0x20u);
}

@end