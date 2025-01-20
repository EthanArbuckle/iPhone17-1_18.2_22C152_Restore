@interface TSPCryptoReadChannel
- (TSPCryptoReadChannel)initWithReadChannel:(id)a3 decryptionKey:(id)a4;
- (void)close;
- (void)dealloc;
- (void)readWithQueue:(id)a3 handler:(id)a4;
@end

@implementation TSPCryptoReadChannel

- (TSPCryptoReadChannel)initWithReadChannel:(id)a3 decryptionKey:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v32.receiver = self;
  v32.super_class = (Class)TSPCryptoReadChannel;
  v9 = [(TSPCryptoReadChannel *)&v32 init];
  if (v9)
  {
    if (!v7)
    {
      v10 = [MEMORY[0x263F7C7F0] currentHandler];
      v11 = [NSString stringWithUTF8String:"-[TSPCryptoReadChannel initWithReadChannel:decryptionKey:]"];
      v12 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/persistence/src/TSPCryptoReadChannel.mm"];
      objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, v12, 39, @"invalid nil value for '%s'", "readChannel");
    }
    objc_storeStrong((id *)&v9->_readChannel, a3);
    if (!v8)
    {
      v13 = [MEMORY[0x263F7C7F0] currentHandler];
      v14 = [NSString stringWithUTF8String:"-[TSPCryptoReadChannel initWithReadChannel:decryptionKey:]"];
      v15 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/persistence/src/TSPCryptoReadChannel.mm"];
      objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, v15, 42, @"invalid nil value for '%s'", "decryptionKey");
    }
    objc_storeStrong((id *)&v9->_decryptionKey, a4);
    dispatch_queue_t v16 = dispatch_queue_create("TSPCryptoReadChannel.Read", 0);
    readChannelQueue = v9->_readChannelQueue;
    v9->_readChannelQueue = (OS_dispatch_queue *)v16;

    id v18 = [v8 passphrase];
    uint64_t v19 = [v18 cStringUsingEncoding:4];

    if (!v19)
    {
      v20 = [MEMORY[0x263F7C7F0] currentHandler];
      v21 = [NSString stringWithUTF8String:"-[TSPCryptoReadChannel initWithReadChannel:decryptionKey:]"];
      v22 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/persistence/src/TSPCryptoReadChannel.mm"];
      [v20 handleFailureInFunction:v21 file:v22 lineNumber:49 description:@"Invalid passphrase"];
    }
    v23 = (char *)malloc_type_malloc(0x10uLL, 0x383A422uLL);
    v9->_iv = v23;
    if (!v23)
    {
      v24 = [MEMORY[0x263F7C7F0] currentHandler];
      v25 = [NSString stringWithUTF8String:"-[TSPCryptoReadChannel initWithReadChannel:decryptionKey:]"];
      v26 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/persistence/src/TSPCryptoReadChannel.mm"];
      [v24 handleFailureInFunction:v25 file:v26 lineNumber:59 description:@"Failed to allocate space for IV"];
    }
    v27 = (char *)malloc_type_malloc(0x200000uLL, 0xDD67014EuLL);
    v9->_buffer = v27;
    if (!v27)
    {
      v28 = [MEMORY[0x263F7C7F0] currentHandler];
      v29 = [NSString stringWithUTF8String:"-[TSPCryptoReadChannel initWithReadChannel:decryptionKey:]"];
      v30 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/persistence/src/TSPCryptoReadChannel.mm"];
      [v28 handleFailureInFunction:v29 file:v30 lineNumber:62 description:@"Failed to allocate space for decryption buffer"];
    }
    if (!v9->_readChannel || !v19 || !v9->_decryptionKey || !v9->_iv || !v9->_buffer)
    {

      v9 = 0;
    }
  }

  return v9;
}

- (void)dealloc
{
  [(TSPCryptoReadChannel *)self close];
  cryptor = self->_cryptor;
  if (cryptor)
  {
    CCCryptorRelease(cryptor);
    self->_cryptor = 0;
  }
  iv = self->_iv;
  if (iv)
  {
    free(iv);
    self->_iv = 0;
  }
  buffer = self->_buffer;
  if (buffer)
  {
    free(buffer);
    self->_buffer = 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)TSPCryptoReadChannel;
  [(TSPCryptoReadChannel *)&v6 dealloc];
}

- (void)close
{
  [(TSUStreamReadChannel *)self->_readChannel close];
  readChannel = self->_readChannel;
  self->_readChannel = 0;
}

- (void)readWithQueue:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  readChannel = self->_readChannel;
  if (!readChannel)
  {
    v9 = [MEMORY[0x263F7C7F0] currentHandler];
    v10 = [NSString stringWithUTF8String:"-[TSPCryptoReadChannel readWithQueue:handler:]"];
    v11 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/persistence/src/TSPCryptoReadChannel.mm"];
    [v9 handleFailureInFunction:v10 file:v11 lineNumber:96 description:@"Read channel is already closed"];

    readChannel = self->_readChannel;
  }
  readChannelQueue = self->_readChannelQueue;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __46__TSPCryptoReadChannel_readWithQueue_handler___block_invoke;
  v15[3] = &unk_2646B04B0;
  id v13 = v6;
  id v16 = v13;
  id v14 = v7;
  v17 = self;
  id v18 = v14;
  [(TSUStreamReadChannel *)readChannel readWithQueue:readChannelQueue handler:v15];
}

void __46__TSPCryptoReadChannel_readWithQueue_handler___block_invoke(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v94 = 0;
  v95 = &v94;
  uint64_t v96 = 0x2020000000;
  char v97 = 1;
  if (v8)
  {
    v9 = *(NSObject **)(a1 + 32);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __46__TSPCryptoReadChannel_readWithQueue_handler___block_invoke_2;
    block[3] = &unk_2646AFA50;
    id v93 = *(id *)(a1 + 48);
    id v92 = v8;
    dispatch_async(v9, block);
    *((unsigned char *)v95 + 24) = 0;

    goto LABEL_53;
  }
  v10 = *(NSObject **)(*(void *)(a1 + 40) + 32);
  if (v10)
  {
    dispatch_data_t concat = dispatch_data_create_concat(v10, v7);

    id v7 = concat;
  }
  v12 = v7;
  size_t size = dispatch_data_get_size(v7);
  if (size >= 0x14) {
    size_t v14 = 20;
  }
  else {
    size_t v14 = size;
  }
  size_t v15 = size - v14;
  dispatch_data_t subrange = dispatch_data_create_subrange(v12, size - v14, v14);
  uint64_t v17 = *(void *)(a1 + 40);
  id v18 = *(void **)(v17 + 32);
  *(void *)(v17 + 32) = subrange;

  id v7 = dispatch_data_create_subrange(v12, 0, v15);
  size_t v19 = dispatch_data_get_size(v7);
  if (a2 && !v19)
  {
    v20 = *(_CCCryptor **)(*(void *)(a1 + 40) + 56);
    if (v20)
    {
      size_t OutputLength = CCCryptorGetOutputLength(v20, 0, 1);
      dispatch_data_t v22 = (dispatch_data_t)OutputLength;
      if (!OutputLength)
      {
LABEL_32:
        if (*(void *)(*(void *)(a1 + 40) + 72) != 16)
        {
          v47 = [MEMORY[0x263F7C7F0] currentHandler];
          v48 = [NSString stringWithUTF8String:"-[TSPCryptoReadChannel readWithQueue:handler:]_block_invoke"];
          v49 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/persistence/src/TSPCryptoReadChannel.mm"];
          objc_msgSend(v47, "handleFailureInFunction:file:lineNumber:description:", v48, v49, 154, @"Failed to read and discard the initial random block; only read %zu bytes",
            *(void *)(*(void *)(a1 + 40) + 72));
        }
        v50 = *(NSObject **)(a1 + 32);
        v88[0] = MEMORY[0x263EF8330];
        v88[1] = 3221225472;
        v88[2] = __46__TSPCryptoReadChannel_readWithQueue_handler___block_invoke_3;
        v88[3] = &unk_2646AFA50;
        id v51 = *(id *)(a1 + 48);
        dispatch_data_t v89 = v22;
        id v90 = v51;
        v52 = v22;
        dispatch_async(v50, v88);

        goto LABEL_53;
      }
      v23 = malloc_type_malloc(OutputLength, 0x1AEB0013uLL);
      if (v23)
      {
        size_t dataOutMoved = 0;
        uint64_t v24 = CCCryptorFinal(*(CCCryptorRef *)(*(void *)(a1 + 40) + 56), v23, (size_t)v22, &dataOutMoved);
        if (v24)
        {
          v25 = [MEMORY[0x263F7C7F0] currentHandler];
          v26 = [NSString stringWithUTF8String:"-[TSPCryptoReadChannel readWithQueue:handler:]_block_invoke"];
          v27 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/persistence/src/TSPCryptoReadChannel.mm"];
          objc_msgSend(v25, "handleFailureInFunction:file:lineNumber:description:", v26, v27, 138, @"Finalizing decryption failed: CCCryptorFinal status %i", v24);
        }
        if (dataOutMoved) {
          dispatch_data_t v22 = dispatch_data_create(v23, dataOutMoved, 0, 0);
        }
        else {
          dispatch_data_t v22 = 0;
        }
        free(v23);
        goto LABEL_32;
      }
      v44 = [MEMORY[0x263F7C7F0] currentHandler];
      v45 = [NSString stringWithUTF8String:"-[TSPCryptoReadChannel readWithQueue:handler:]_block_invoke"];
      v46 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/persistence/src/TSPCryptoReadChannel.mm"];
      [v44 handleFailureInFunction:v45 file:v46 lineNumber:133 description:@"Failed to allocate buffer for finalizing decryption"];
    }
    dispatch_data_t v22 = 0;
    goto LABEL_32;
  }
  size_t dataOutMoved = 0;
  p_size_t dataOutMoved = &dataOutMoved;
  uint64_t v86 = 0x2020000000;
  uint64_t v87 = 0;
  applier[0] = MEMORY[0x263EF8330];
  applier[1] = 3221225472;
  applier[2] = __46__TSPCryptoReadChannel_readWithQueue_handler___block_invoke_4;
  applier[3] = &unk_2646B0460;
  applier[4] = *(void *)(a1 + 40);
  applier[5] = &v94;
  applier[6] = &dataOutMoved;
  dispatch_data_apply(v7, applier);
  if (*((unsigned char *)v95 + 24))
  {
    uint64_t v28 = *(void *)(a1 + 40);
    uint64_t v29 = *(void *)(v28 + 72);
    v30 = p_dataOutMoved;
    size_t v31 = 16 - v29 >= p_dataOutMoved[3] ? p_dataOutMoved[3] : 16 - v29;
    *(void *)(v28 + 72) = v31 + v29;
    size_t v32 = v30[3];
    if (v32 != v31)
    {
      if (a2)
      {
        size_t v79 = 0;
        size_t v33 = CCCryptorGetOutputLength(*(CCCryptorRef *)(*(void *)(a1 + 40) + 56), 0, 1);
        size_t v34 = v33;
        if (v33)
        {
          v35 = (char *)malloc_type_malloc(v33, 0x4B64D27EuLL);
          if (!v35)
          {
            v37 = [MEMORY[0x263F7C7F0] currentHandler];
            v38 = [NSString stringWithUTF8String:"-[TSPCryptoReadChannel readWithQueue:handler:]_block_invoke"];
            v39 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/persistence/src/TSPCryptoReadChannel.mm"];
            [v37 handleFailureInFunction:v38 file:v39 lineNumber:240 description:@"Failed to allocate buffer for finalizing decryption"];
            v35 = 0;
            goto LABEL_37;
          }
          uint64_t v36 = CCCryptorFinal(*(CCCryptorRef *)(*(void *)(a1 + 40) + 56), v35, v34, &v79);
          if (v36)
          {
            v37 = [MEMORY[0x263F7C7F0] currentHandler];
            v38 = [NSString stringWithUTF8String:"-[TSPCryptoReadChannel readWithQueue:handler:]_block_invoke"];
            v39 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/persistence/src/TSPCryptoReadChannel.mm"];
            objc_msgSend(v37, "handleFailureInFunction:file:lineNumber:description:", v38, v39, 244, @"Finalizing decryption failed: CCCryptorFinal status %i", v36);
LABEL_37:
          }
        }
        else
        {
          v35 = 0;
        }
        uint64_t v53 = *(void *)(a1 + 40);
        uint64_t v54 = *(void *)(v53 + 72);
        if (16 - v54 >= v79) {
          size_t v55 = v79;
        }
        else {
          size_t v55 = 16 - v54;
        }
        *(void *)(v53 + 72) = v55 + v54;
        uint64_t v56 = *(void *)(a1 + 40);
        if (*(void *)(v56 + 72) != 16)
        {
          v57 = [MEMORY[0x263F7C7F0] currentHandler];
          v58 = [NSString stringWithUTF8String:"-[TSPCryptoReadChannel readWithQueue:handler:]_block_invoke"];
          v59 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/persistence/src/TSPCryptoReadChannel.mm"];
          objc_msgSend(v57, "handleFailureInFunction:file:lineNumber:description:", v58, v59, 249, @"Failed to read and discard the initial random block; only read %zu bytes",
            *(void *)(*(void *)(a1 + 40) + 72));

          uint64_t v56 = *(void *)(a1 + 40);
        }
        dispatch_data_t v60 = dispatch_data_create((const void *)(*(void *)(v56 + 64) + v31), p_dataOutMoved[3] - v31, 0, 0);
        v61 = *(NSObject **)(a1 + 32);
        v74[0] = MEMORY[0x263EF8330];
        v74[1] = 3221225472;
        v74[2] = __46__TSPCryptoReadChannel_readWithQueue_handler___block_invoke_6;
        v74[3] = &unk_2646B0488;
        id v76 = *(id *)(a1 + 48);
        size_t v77 = v79;
        size_t v78 = v55;
        v62 = v60;
        v75 = v62;
        dispatch_async(v61, v74);
        if (v79 != v55)
        {
          dispatch_data_t v63 = dispatch_data_create(&v35[v55], v79 - v55, 0, 0);
          v64 = *(NSObject **)(a1 + 32);
          v71[0] = MEMORY[0x263EF8330];
          v71[1] = 3221225472;
          v71[2] = __46__TSPCryptoReadChannel_readWithQueue_handler___block_invoke_7;
          v71[3] = &unk_2646AFA50;
          id v65 = *(id *)(a1 + 48);
          dispatch_data_t v72 = v63;
          id v73 = v65;
          v66 = v63;
          dispatch_async(v64, v71);
        }
        if (v35) {
          free(v35);
        }
        v67 = *(_CCCryptor **)(*(void *)(a1 + 40) + 56);
        if (v67)
        {
          CCCryptorRelease(v67);
          *(void *)(*(void *)(a1 + 40) + 56) = 0;
        }

        goto LABEL_50;
      }
      dispatch_data_t v40 = dispatch_data_create((const void *)(*(void *)(*(void *)(a1 + 40) + 64) + v31), v32 - v31, 0, 0);
      v41 = *(NSObject **)(a1 + 32);
      v80[0] = MEMORY[0x263EF8330];
      v80[1] = 3221225472;
      v80[2] = __46__TSPCryptoReadChannel_readWithQueue_handler___block_invoke_5;
      v80[3] = &unk_2646AFA50;
      id v42 = *(id *)(a1 + 48);
      dispatch_data_t v81 = v40;
      id v82 = v42;
      v43 = v40;
      dispatch_async(v41, v80);
    }
  }
LABEL_50:
  if (!*((unsigned char *)v95 + 24))
  {
    v68 = *(NSObject **)(a1 + 32);
    v69[0] = MEMORY[0x263EF8330];
    v69[1] = 3221225472;
    v69[2] = __46__TSPCryptoReadChannel_readWithQueue_handler___block_invoke_8;
    v69[3] = &unk_2646AFC00;
    id v70 = *(id *)(a1 + 48);
    dispatch_async(v68, v69);
  }
  _Block_object_dispose(&dataOutMoved, 8);
LABEL_53:
  _Block_object_dispose(&v94, 8);
}

uint64_t __46__TSPCryptoReadChannel_readWithQueue_handler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, uint64_t, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 1, 0, *(void *)(a1 + 32));
}

uint64_t __46__TSPCryptoReadChannel_readWithQueue_handler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, uint64_t, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 1, *(void *)(a1 + 32), 0);
}

uint64_t __46__TSPCryptoReadChannel_readWithQueue_handler___block_invoke_4(void *a1, void *a2, uint64_t a3, char *a4, unint64_t a5)
{
  id v28 = a2;
  while (a5)
  {
    uint64_t v8 = a1[4];
    if (!*(void *)(v8 + 56))
    {
      uint64_t v11 = v8 + 40;
      uint64_t v9 = *(void *)(v8 + 40);
      uint64_t v10 = *(void *)(v11 + 8);
      size_t v12 = 16 - v10 >= a5 ? a5 : 16 - v10;
      memcpy((void *)(v9 + v10), a4, v12);
      *(void *)(a1[4] + 48) += v12;
      a4 += v12;
      a5 -= v12;
      uint64_t v13 = a1[4];
      if (*(void *)(v13 + 48) == 16)
      {
        uint64_t v14 = CCCryptorCreate(1u, 0, 1u, (const void *)[*(id *)(v13 + 24) keyData], objc_msgSend(*(id *)(a1[4] + 24), "keyLength"), *(const void **)(a1[4] + 40), (CCCryptorRef *)(a1[4] + 56));
        if (v14 || !*(void *)(a1[4] + 56))
        {
          size_t v15 = [MEMORY[0x263F7C7F0] currentHandler];
          id v16 = [NSString stringWithUTF8String:"-[TSPCryptoReadChannel readWithQueue:handler:]_block_invoke_4"];
          uint64_t v17 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/persistence/src/TSPCryptoReadChannel.mm"];
          objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, v17, 183, @"CCCryptorCreate() failed: %d", v14);

          *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 0;
        }
      }
    }
    if (*(unsigned char *)(*(void *)(a1[5] + 8) + 24))
    {
      if (a5)
      {
        uint64_t v18 = a1[4];
        size_t v19 = *(_CCCryptor **)(v18 + 56);
        if (v19)
        {
          size_t dataOutMoved = 0;
          if (a5 >= 0x1FFFF0) {
            size_t v20 = 2097136;
          }
          else {
            size_t v20 = a5;
          }
          uint64_t v21 = *(void *)(*(void *)(a1[6] + 8) + 24);
          uint64_t v22 = CCCryptorUpdate(v19, a4, v20, (void *)(*(void *)(v18 + 64) + v21), 0x200000 - v21, &dataOutMoved);
          if (v22)
          {
            v23 = [MEMORY[0x263F7C7F0] currentHandler];
            uint64_t v24 = [NSString stringWithUTF8String:"-[TSPCryptoReadChannel readWithQueue:handler:]_block_invoke_4"];
            v25 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/persistence/src/TSPCryptoReadChannel.mm"];
            objc_msgSend(v23, "handleFailureInFunction:file:lineNumber:description:", v24, v25, 198, @"CCCryptorUpdate() failed: %d", v22);

            *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 0;
          }
          a4 += v20;
          a5 -= v20;
          *(void *)(*(void *)(a1[6] + 8) + 24) += dataOutMoved;
        }
      }
    }
  }
  uint64_t v26 = *(unsigned __int8 *)(*(void *)(a1[5] + 8) + 24);

  return v26;
}

uint64_t __46__TSPCryptoReadChannel_readWithQueue_handler___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32), 0);
}

uint64_t __46__TSPCryptoReadChannel_readWithQueue_handler___block_invoke_6(void *a1)
{
  return (*(uint64_t (**)(void, BOOL, void, void))(a1[5] + 16))(a1[5], a1[6] == a1[7], a1[4], 0);
}

uint64_t __46__TSPCryptoReadChannel_readWithQueue_handler___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void, uint64_t, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 1, *(void *)(a1 + 32), 0);
}

void __46__TSPCryptoReadChannel_readWithQueue_handler___block_invoke_8(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  objc_msgSend(MEMORY[0x263F087E8], "tsp_errorWithCode:", 1);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, void))(v1 + 16))(v1, 1, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_holdData, 0);
  objc_storeStrong((id *)&self->_decryptionKey, 0);
  objc_storeStrong((id *)&self->_readChannelQueue, 0);

  objc_storeStrong((id *)&self->_readChannel, 0);
}

@end