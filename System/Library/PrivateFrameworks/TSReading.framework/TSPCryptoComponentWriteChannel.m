@interface TSPCryptoComponentWriteChannel
- (TSPCryptoComponentWriteChannel)initWithWriteChannel:(id)a3 encryptionKey:(id)a4;
- (void)_writeData:(id)a3 updateHmac:(BOOL)a4;
- (void)close;
- (void)dealloc;
- (void)writeData:(id)a3;
@end

@implementation TSPCryptoComponentWriteChannel

- (TSPCryptoComponentWriteChannel)initWithWriteChannel:(id)a3 encryptionKey:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v39.receiver = self;
  v39.super_class = (Class)TSPCryptoComponentWriteChannel;
  v9 = [(TSPCryptoComponentWriteChannel *)&v39 init];
  v10 = (TSPCryptoComponentWriteChannel *)v9;
  if (v9)
  {
    if (!v7)
    {
      v11 = [MEMORY[0x263F7C7F0] currentHandler];
      v12 = [NSString stringWithUTF8String:"-[TSPCryptoComponentWriteChannel initWithWriteChannel:encryptionKey:]"];
      v13 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/persistence/src/TSPCryptoComponentWriteChannel.mm"];
      objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, v13, 30, @"invalid nil value for '%s'", "writeChannel");
    }
    v14 = (void **)(v9 + 8);
    objc_storeStrong((id *)v9 + 1, a3);
    if (!v8)
    {
      v15 = [MEMORY[0x263F7C7F0] currentHandler];
      v16 = [NSString stringWithUTF8String:"-[TSPCryptoComponentWriteChannel initWithWriteChannel:encryptionKey:]"];
      v17 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/persistence/src/TSPCryptoComponentWriteChannel.mm"];
      objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, v17, 33, @"invalid nil value for '%s'", "encryptionKey");
    }
    v18 = malloc_type_malloc(0x20000uLL, 0x270AD37BuLL);
    *((void *)v9 + 3) = v18;
    if (!v18)
    {
      v19 = [MEMORY[0x263F7C7F0] currentHandler];
      v20 = [NSString stringWithUTF8String:"-[TSPCryptoComponentWriteChannel initWithWriteChannel:encryptionKey:]"];
      v21 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/persistence/src/TSPCryptoComponentWriteChannel.mm"];
      [v19 handleFailureInFunction:v20 file:v21 lineNumber:36 description:@"Failed to allocate space for encryption buffer"];
    }
    v22 = malloc_type_malloc(0x10uLL, 0xE2E4F584uLL);
    if (v22 && ([MEMORY[0x263F7C7D8] generateRandomDataInBuffer:v22 length:16] & 1) != 0)
    {
      uint64_t v23 = CCCryptorCreate(0, 0, 1u, (const void *)[v8 keyData], objc_msgSend(v8, "keyLength"), v22, (CCCryptorRef *)v9 + 2);
      if (v23 || !*((void *)v9 + 2))
      {
        v24 = [MEMORY[0x263F7C7F0] currentHandler];
        v25 = [NSString stringWithUTF8String:"-[TSPCryptoComponentWriteChannel initWithWriteChannel:encryptionKey:]"];
        v26 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/persistence/src/TSPCryptoComponentWriteChannel.mm"];
        objc_msgSend(v24, "handleFailureInFunction:file:lineNumber:description:", v25, v26, 48, @"CCCryptorCreate() failed: %d", v23);
      }
      else
      {
        id v33 = [v8 passphrase];
        v34 = (const char *)[v33 cStringUsingEncoding:4];

        if (v34)
        {
          size_t v35 = strlen(v34);
          CCHmacInit((CCHmacContext *)(v9 + 32), 0, v34, v35);
          v36 = *v14;
          v37 = (void *)*MEMORY[0x263EF8378];
          dispatch_data_t v38 = dispatch_data_create(v22, 0x10uLL, 0, (dispatch_block_t)*MEMORY[0x263EF8378]);
          [v36 writeData:v38];

          v22 = malloc_type_malloc(0x10uLL, 0xB7DDFBADuLL);
          if (v22 && ([MEMORY[0x263F7C7D8] generateRandomDataInBuffer:v22 length:16] & 1) != 0)
          {
            dispatch_data_t p_super = dispatch_data_create(v22, 0x10uLL, 0, v37);
            [(TSPCryptoComponentWriteChannel *)v10 _writeData:p_super updateHmac:0];
            goto LABEL_17;
          }
          v27 = [MEMORY[0x263F7C7F0] currentHandler];
          v28 = [NSString stringWithUTF8String:"-[TSPCryptoComponentWriteChannel initWithWriteChannel:encryptionKey:]"];
          v29 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/persistence/src/TSPCryptoComponentWriteChannel.mm"];
          [v27 handleFailureInFunction:v28 file:v29 lineNumber:72 description:@"Failed to generate initial block of random plaintext"];
LABEL_14:

          if (!v22)
          {
LABEL_16:
            v30 = *v14;
            *v14 = 0;

            dispatch_data_t p_super = &v10->super;
            v10 = 0;
LABEL_17:

            goto LABEL_18;
          }
LABEL_15:
          free(v22);
          goto LABEL_16;
        }
        v24 = [MEMORY[0x263F7C7F0] currentHandler];
        v25 = [NSString stringWithUTF8String:"-[TSPCryptoComponentWriteChannel initWithWriteChannel:encryptionKey:]"];
        v26 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/persistence/src/TSPCryptoComponentWriteChannel.mm"];
        [v24 handleFailureInFunction:v25 file:v26 lineNumber:56 description:@"Invalid passphrase"];
      }

      goto LABEL_15;
    }
    v27 = [MEMORY[0x263F7C7F0] currentHandler];
    v28 = [NSString stringWithUTF8String:"-[TSPCryptoComponentWriteChannel initWithWriteChannel:encryptionKey:]"];
    v29 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/persistence/src/TSPCryptoComponentWriteChannel.mm"];
    [v27 handleFailureInFunction:v28 file:v29 lineNumber:41 description:@"Failed to generate IV"];
    goto LABEL_14;
  }
LABEL_18:

  return v10;
}

- (void)dealloc
{
  [(TSPCryptoComponentWriteChannel *)self close];
  cryptor = self->_cryptor;
  if (cryptor)
  {
    CCCryptorRelease(cryptor);
    self->_cryptor = 0;
  }
  buffer = self->_buffer;
  if (buffer)
  {
    free(buffer);
    self->_buffer = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)TSPCryptoComponentWriteChannel;
  [(TSPCryptoComponentWriteChannel *)&v5 dealloc];
}

- (void)writeData:(id)a3
{
}

- (void)_writeData:(id)a3 updateHmac:(BOOL)a4
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __56__TSPCryptoComponentWriteChannel__writeData_updateHmac___block_invoke;
  v4[3] = &unk_2646B0438;
  v4[4] = self;
  BOOL v5 = a4;
  dispatch_data_apply((dispatch_data_t)a3, v4);
}

uint64_t __56__TSPCryptoComponentWriteChannel__writeData_updateHmac___block_invoke(uint64_t a1, void *a2, uint64_t a3, char *a4, size_t a5)
{
  id v8 = a2;
  uint64_t v9 = *(void *)(a1 + 32);
  if (!*(void *)(v9 + 8))
  {
    v16 = [MEMORY[0x263F7C7F0] currentHandler];
    v17 = [NSString stringWithUTF8String:"-[TSPCryptoComponentWriteChannel _writeData:updateHmac:]_block_invoke"];
    v18 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/persistence/src/TSPCryptoComponentWriteChannel.mm"];
    [v16 handleFailureInFunction:v17 file:v18 lineNumber:124 description:@"Tried to write data when already closed."];
LABEL_15:

    uint64_t v15 = 0;
    goto LABEL_16;
  }
  if (*(unsigned char *)(a1 + 40)) {
    CCHmacUpdate((CCHmacContext *)(v9 + 32), a4, a5);
  }
  if (a5)
  {
    while (1)
    {
      size_t v10 = a5 >= 0x1FFF0 ? 131056 : a5;
      size_t dataOutMoved = 0;
      uint64_t v11 = CCCryptorUpdate(*(CCCryptorRef *)(*(void *)(a1 + 32) + 16), a4, v10, *(void **)(*(void *)(a1 + 32) + 24), 0x20000uLL, &dataOutMoved);
      if (v11) {
        break;
      }
      if (dataOutMoved)
      {
        uint64_t v12 = *(void *)(a1 + 32);
        v13 = *(void **)(v12 + 8);
        dispatch_data_t v14 = dispatch_data_create(*(const void **)(v12 + 24), dataOutMoved, 0, 0);
        [v13 writeData:v14];
      }
      a4 += v10;
      a5 -= v10;
      if (!a5) {
        goto LABEL_12;
      }
    }
    v16 = [MEMORY[0x263F7C7F0] currentHandler];
    v17 = [NSString stringWithUTF8String:"-[TSPCryptoComponentWriteChannel _writeData:updateHmac:]_block_invoke"];
    v18 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/persistence/src/TSPCryptoComponentWriteChannel.mm"];
    objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v17, v18, 145, @"Encryption failed: CCCryptorUpdate result %d", v11);
    goto LABEL_15;
  }
LABEL_12:
  uint64_t v15 = 1;
LABEL_16:

  return v15;
}

- (void)close
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_writeChannel) {
    goto LABEL_15;
  }
  size_t dataOutMoved = 0;
  buffer = v2->_buffer;
  if (CCCryptorFinal(v2->_cryptor, buffer, 0x20000uLL, &dataOutMoved) == -4301)
  {
    size_t OutputLength = CCCryptorGetOutputLength(v2->_cryptor, 0, 1);
    buffer = malloc_type_malloc(OutputLength, 0x9E89D6E1uLL);
    if (buffer)
    {
      uint64_t v5 = CCCryptorFinal(v2->_cryptor, buffer, OutputLength, &dataOutMoved);
      if (!v5)
      {
LABEL_9:
        uint64_t v9 = buffer;
        goto LABEL_10;
      }
      v6 = [MEMORY[0x263F7C7F0] currentHandler];
      id v7 = [NSString stringWithUTF8String:"-[TSPCryptoComponentWriteChannel close]"];
      id v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/persistence/src/TSPCryptoComponentWriteChannel.mm"];
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, v8, 194, @"Finalizing encryption failed: CCCryptorFinal status %i", v5);
    }
    else
    {
      v6 = [MEMORY[0x263F7C7F0] currentHandler];
      id v7 = [NSString stringWithUTF8String:"-[TSPCryptoComponentWriteChannel close]"];
      id v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/persistence/src/TSPCryptoComponentWriteChannel.mm"];
      [v6 handleFailureInFunction:v7 file:v8 lineNumber:188 description:@"Failed to allocate buffer for finalizing encryption"];
      buffer = 0;
    }

    goto LABEL_9;
  }
  uint64_t v9 = 0;
LABEL_10:
  if (dataOutMoved)
  {
    writeChannel = v2->_writeChannel;
    dispatch_data_t v11 = dispatch_data_create(buffer, dataOutMoved, 0, 0);
    [(TSPComponentWriteChannel *)writeChannel writeData:v11];
  }
  if (v9) {
    free(v9);
  }
  CCHmacFinal((CCHmacContext *)&v2->_ccHmacContext, macOut);
  uint64_t v12 = v2->_writeChannel;
  dispatch_data_t v13 = dispatch_data_create(macOut, 0x14uLL, 0, 0);
  [(TSPComponentWriteChannel *)v12 writeData:v13];

  [(TSPComponentWriteChannel *)v2->_writeChannel close];
  dispatch_data_t v14 = v2->_writeChannel;
  v2->_writeChannel = 0;

LABEL_15:
  objc_sync_exit(v2);
}

- (void).cxx_destruct
{
}

@end