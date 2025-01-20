@interface TSUZipArchive
- (BOOL)readCentralFileHeaderWithBuffer:(const void *)a3 dataSize:(unint64_t *)a4;
- (TSUReadChannel)readChannel;
- (TSUZipArchive)init;
- (id)debugDescription;
- (id)entryForName:(id)a3;
- (id)readChannelForEntry:(id)a3;
- (unint64_t)archiveLength;
- (void)addEntry:(id)a3;
- (void)enumerateEntriesUsingBlock:(id)a3;
- (void)readArchiveWithQueue:(id)a3 completion:(id)a4;
- (void)readCentralDirectoryData:(id)a3 entryCount:(unint64_t)a4 queue:(id)a5 completion:(id)a6;
- (void)readCentralDirectoryWithEntryCount:(unint64_t)a3 offset:(int64_t)a4 size:(int64_t)a5 channel:(id)a6 queue:(id)a7 completion:(id)a8;
- (void)readEndOfCentralDirectoryData:(id)a3 channel:(id)a4 queue:(id)a5 completion:(id)a6;
@end

@implementation TSUZipArchive

- (TSUZipArchive)init
{
  v6.receiver = self;
  v6.super_class = (Class)TSUZipArchive;
  v2 = [(TSUZipArchive *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    entries = v2->_entries;
    v2->_entries = v3;
  }
  return v2;
}

- (void)readArchiveWithQueue:(id)a3 completion:(id)a4
{
  objc_super v6 = a3;
  id v7 = a4;
  unint64_t v8 = [(TSUZipArchive *)self archiveLength];
  v9 = dispatch_get_global_queue(0, 0);
  v10 = [(TSUZipArchive *)self readChannel];
  v11 = v10;
  if (v10)
  {
    [v10 setLowWater:-1];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __49__TSUZipArchive_readArchiveWithQueue_completion___block_invoke;
    v17[3] = &unk_26462A708;
    v17[4] = self;
    id v18 = v11;
    v19 = v6;
    id v20 = v7;
    id v12 = v7;
    [v18 readFromOffset:v8 - 22 length:22 queue:v9 handler:v17];

    id v13 = v18;
  }
  else
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __49__TSUZipArchive_readArchiveWithQueue_completion___block_invoke_3;
    block[3] = &unk_26462A730;
    id v16 = v7;
    id v14 = v7;
    dispatch_async(v6, block);
    id v13 = v16;
  }
}

void __49__TSUZipArchive_readArchiveWithQueue_completion___block_invoke(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  if ((a2 & 1) == 0)
  {
    v9 = +[TSUAssertionHandler currentHandler];
    v10 = [NSString stringWithUTF8String:"-[TSUZipArchive readArchiveWithQueue:completion:]_block_invoke"];
    v11 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUZipArchive.m"];
    [v9 handleFailureInFunction:v10 file:v11 lineNumber:54 description:@"Partial read"];
  }
  if (v8)
  {
    [*(id *)(a1 + 40) close];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __49__TSUZipArchive_readArchiveWithQueue_completion___block_invoke_2;
    v13[3] = &unk_26462A6E0;
    id v12 = *(NSObject **)(a1 + 48);
    id v15 = *(id *)(a1 + 56);
    id v14 = v8;
    dispatch_async(v12, v13);
  }
  else
  {
    [*(id *)(a1 + 32) readEndOfCentralDirectoryData:v7 channel:*(void *)(a1 + 40) queue:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
  }
}

uint64_t __49__TSUZipArchive_readArchiveWithQueue_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __49__TSUZipArchive_readArchiveWithQueue_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  objc_msgSend(MEMORY[0x263F087E8], "tsu_IOErrorWithCode:", 0);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

- (void)readEndOfCentralDirectoryData:(id)a3 channel:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v10 = a4;
  v11 = a5;
  id v12 = a6;
  size_t size_ptr = 0;
  buffer_ptr = 0;
  dispatch_data_t v17 = dispatch_data_create_map((dispatch_data_t)a3, (const void **)&buffer_ptr, &size_ptr);
  if (size_ptr == 22) {
    goto LABEL_3;
  }
  id v18 = +[TSUAssertionHandler currentHandler];
  v19 = [NSString stringWithUTF8String:"-[TSUZipArchive readEndOfCentralDirectoryData:channel:queue:completion:]"];
  id v20 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUZipArchive.m"];
  [v18 handleFailureInFunction:v19 file:v20 lineNumber:91 description:@"Wrong data size"];

  if (size_ptr >= 0x16)
  {
LABEL_3:
    if (*(_DWORD *)buffer_ptr == 101010256)
    {
      if (*((_WORD *)buffer_ptr + 2) || *((_WORD *)buffer_ptr + 3))
      {
        v21 = @"Don't support multi-disk";
        uint64_t v22 = 106;
      }
      else
      {
        if (*((unsigned __int16 *)buffer_ptr + 5) != 0xFFFFLL && *((_DWORD *)buffer_ptr + 4) != -1)
        {
          uint64_t v13 = *((unsigned int *)buffer_ptr + 3);
          if (v13 != -1)
          {
            -[TSUZipArchive readCentralDirectoryWithEntryCount:offset:size:channel:queue:completion:](self, "readCentralDirectoryWithEntryCount:offset:size:channel:queue:completion:");
            goto LABEL_10;
          }
        }
        v21 = @"Don't support Zip 64";
        uint64_t v22 = 113;
      }
    }
    else
    {
      v21 = @"Don't support end of central directory comments";
      uint64_t v22 = 100;
    }
    TSULogErrorInFunction((uint64_t)"-[TSUZipArchive readEndOfCentralDirectoryData:channel:queue:completion:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUZipArchive.m", v22, (uint64_t)v21, v13, v14, v15, v16, v23);
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __72__TSUZipArchive_readEndOfCentralDirectoryData_channel_queue_completion___block_invoke;
  block[3] = &unk_26462A730;
  id v25 = v12;
  dispatch_async(v11, block);

LABEL_10:
}

void __72__TSUZipArchive_readEndOfCentralDirectoryData_channel_queue_completion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  objc_msgSend(MEMORY[0x263F087E8], "tsu_IOErrorWithCode:", 0);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

- (void)readCentralDirectoryWithEntryCount:(unint64_t)a3 offset:(int64_t)a4 size:(int64_t)a5 channel:(id)a6 queue:(id)a7 completion:(id)a8
{
  id v14 = a7;
  id v15 = a8;
  uint64_t v16 = dispatch_get_global_queue(0, 0);
  id v17 = a6;
  [v17 setLowWater:-1];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __89__TSUZipArchive_readCentralDirectoryWithEntryCount_offset_size_channel_queue_completion___block_invoke;
  v20[3] = &unk_26462A758;
  v20[4] = self;
  id v21 = v14;
  id v22 = v15;
  unint64_t v23 = a3;
  id v18 = v15;
  id v19 = v14;
  [v17 readFromOffset:a4 length:a5 queue:v16 handler:v20];
}

void __89__TSUZipArchive_readCentralDirectoryWithEntryCount_offset_size_channel_queue_completion___block_invoke(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  if ((a2 & 1) == 0)
  {
    v9 = +[TSUAssertionHandler currentHandler];
    id v10 = [NSString stringWithUTF8String:"-[TSUZipArchive readCentralDirectoryWithEntryCount:offset:size:channel:queue:completion:]_block_invoke"];
    v11 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUZipArchive.m"];
    [v9 handleFailureInFunction:v10 file:v11 lineNumber:147 description:@"Partial read"];
  }
  if (v8)
  {
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __89__TSUZipArchive_readCentralDirectoryWithEntryCount_offset_size_channel_queue_completion___block_invoke_2;
    v13[3] = &unk_26462A6E0;
    id v12 = *(NSObject **)(a1 + 40);
    id v15 = *(id *)(a1 + 48);
    id v14 = v8;
    dispatch_async(v12, v13);
  }
  else
  {
    [*(id *)(a1 + 32) readCentralDirectoryData:v7 entryCount:*(void *)(a1 + 56) queue:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
  }
}

uint64_t __89__TSUZipArchive_readCentralDirectoryWithEntryCount_offset_size_channel_queue_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

- (void)readCentralDirectoryData:(id)a3 entryCount:(unint64_t)a4 queue:(id)a5 completion:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  size_t size_ptr = 0;
  buffer_ptr = 0;
  dispatch_data_t v12 = dispatch_data_create_map((dispatch_data_t)a3, (const void **)&buffer_ptr, &size_ptr);
  if (!a4) {
    goto LABEL_7;
  }
  unint64_t v13 = 1;
  do
  {
    BOOL v14 = [(TSUZipArchive *)self readCentralFileHeaderWithBuffer:&buffer_ptr dataSize:&size_ptr];
    if (!v14) {
      break;
    }
  }
  while (v13++ < a4);
  if (!v14)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __70__TSUZipArchive_readCentralDirectoryData_entryCount_queue_completion___block_invoke_2;
    block[3] = &unk_26462A730;
    uint64_t v16 = &v21;
    id v21 = v11;
    id v19 = v11;
    id v18 = block;
  }
  else
  {
LABEL_7:
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __70__TSUZipArchive_readCentralDirectoryData_entryCount_queue_completion___block_invoke;
    v22[3] = &unk_26462A6E0;
    uint64_t v16 = &v23;
    v22[4] = self;
    id v23 = v11;
    id v17 = v11;
    id v18 = v22;
  }
  dispatch_async(v10, v18);
}

uint64_t __70__TSUZipArchive_readCentralDirectoryData_entryCount_queue_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

void __70__TSUZipArchive_readCentralDirectoryData_entryCount_queue_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  objc_msgSend(MEMORY[0x263F087E8], "tsu_IOErrorWithCode:", 0);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

- (BOOL)readCentralFileHeaderWithBuffer:(const void *)a3 dataSize:(unint64_t *)a4
{
  id v7 = objc_alloc_init(TSUZipEntry);
  dispatch_data_t v12 = v7;
  if (*a4 <= 0x2D)
  {
    uint64_t v16 = @"Central directory too short";
    uint64_t v17 = 217;
    goto LABEL_9;
  }
  unint64_t v13 = (unsigned int *)*a3;
  BOOL v14 = (char *)*a3 + 46;
  int v15 = *(_DWORD *)*a3;
  *a4 -= 46;
  *a3 = v14;
  if (v15 != 33639248)
  {
    uint64_t v16 = @"Central directory file header has bad signature";
    uint64_t v17 = 223;
    goto LABEL_9;
  }
  if (v13[2])
  {
    uint64_t v16 = @"Encrypted files are not supported";
    uint64_t v17 = 229;
    goto LABEL_9;
  }
  if (*((_WORD *)v13 + 17))
  {
    uint64_t v16 = @"No multi-disk support";
    uint64_t v17 = 235;
LABEL_9:
    TSULogErrorInFunction((uint64_t)"-[TSUZipArchive readCentralFileHeaderWithBuffer:dataSize:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUZipArchive.m", v17, (uint64_t)v16, v8, v9, v10, v11, v27);
    goto LABEL_10;
  }
  if (*((_WORD *)v13 + 5))
  {
    uint64_t v16 = @"No compression support";
    uint64_t v17 = 241;
    goto LABEL_9;
  }
  [(TSUZipEntry *)v7 setCRC:v13[4]];
  [(TSUZipEntry *)v12 setCompressedSize:v13[5]];
  [(TSUZipEntry *)v12 setSize:v13[6]];
  [(TSUZipEntry *)v12 setOffset:*(unsigned int *)((char *)v13 + 42)];
  [(TSUZipEntry *)v12 setNameLength:*((unsigned __int16 *)v13 + 14)];
  [(TSUZipEntry *)v12 setExtraFieldLength:*((unsigned __int16 *)v13 + 15)];
  if (*a4 < *((unsigned __int16 *)v13 + 14))
  {
    uint64_t v16 = @"Central directory too short";
    uint64_t v17 = 274;
    goto LABEL_9;
  }
  id v20 = (void *)[[NSString alloc] initWithBytes:*a3 length:*((unsigned __int16 *)v13 + 14) encoding:4];
  [(TSUZipEntry *)v12 setName:v20];
  uint64_t v21 = *((unsigned __int16 *)v13 + 14);
  unint64_t v22 = *a4 - v21;
  *a4 = v22;
  id v23 = (char *)*a3 + v21;
  *a3 = v23;
  if (!v20)
  {
    uint64_t v16 = @"Couldn't read name";
    uint64_t v17 = 268;
    goto LABEL_9;
  }
  unint64_t v24 = *((unsigned __int16 *)v13 + 16) + (unint64_t)*((unsigned __int16 *)v13 + 15);
  BOOL v25 = v22 >= v24;
  unint64_t v26 = v22 - v24;
  if (v25)
  {
    *a4 = v26;
    *a3 = &v23[v24];
    [(TSUZipArchive *)self addEntry:v12];

    BOOL v18 = 1;
    goto LABEL_11;
  }
  TSULogErrorInFunction((uint64_t)"-[TSUZipArchive readCentralFileHeaderWithBuffer:dataSize:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUZipArchive.m", 290, @"Central directory too short", v8, v9, v10, v11, v27);

LABEL_10:
  BOOL v18 = 0;
LABEL_11:

  return v18;
}

- (void)addEntry:(id)a3
{
  entries = self->_entries;
  id v4 = a3;
  id v5 = [v4 name];
  [(NSMutableDictionary *)entries setObject:v4 forKeyedSubscript:v5];
}

- (id)readChannelForEntry:(id)a3
{
  id v4 = a3;
  entries = self->_entries;
  objc_super v6 = [v4 name];
  id v7 = [(NSMutableDictionary *)entries objectForKeyedSubscript:v6];

  if (v7 == v4)
  {
    dispatch_data_t v12 = [TSUZipReadChannel alloc];
    uint64_t v8 = [(TSUZipArchive *)self readChannel];
    uint64_t v11 = [(TSUZipReadChannel *)v12 initWithEntry:v4 archiveReadChannel:v8];
  }
  else
  {
    uint64_t v8 = +[TSUAssertionHandler currentHandler];
    uint64_t v9 = [NSString stringWithUTF8String:"-[TSUZipArchive readChannelForEntry:]"];
    uint64_t v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUZipArchive.m"];
    [v8 handleFailureInFunction:v9 file:v10 lineNumber:319 description:@"Entry isn't part of this archive"];

    uint64_t v11 = 0;
  }

  return v11;
}

- (id)entryForName:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_entries objectForKeyedSubscript:a3];
}

- (void)enumerateEntriesUsingBlock:(id)a3
{
  id v4 = a3;
  entries = self->_entries;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __44__TSUZipArchive_enumerateEntriesUsingBlock___block_invoke;
  v7[3] = &unk_26462A780;
  id v8 = v4;
  id v6 = v4;
  [(NSMutableDictionary *)entries enumerateKeysAndObjectsUsingBlock:v7];
}

uint64_t __44__TSUZipArchive_enumerateEntriesUsingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (unint64_t)archiveLength
{
  id v2 = +[TSUAssertionHandler currentHandler];
  v3 = [NSString stringWithUTF8String:"-[TSUZipArchive archiveLength]"];
  id v4 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUZipArchive.m"];
  [v2 handleFailureInFunction:v3 file:v4 lineNumber:344 description:@"Abstract method"];

  id v5 = (void *)MEMORY[0x263EFF940];
  uint64_t v6 = *MEMORY[0x263EFF498];
  id v7 = [NSString stringWithFormat:@"%@: %s", @"Abstract method", "-[TSUZipArchive archiveLength]"];
  id v8 = [v5 exceptionWithName:v6 reason:v7 userInfo:0];

  objc_exception_throw(v8);
}

- (TSUReadChannel)readChannel
{
  id v2 = +[TSUAssertionHandler currentHandler];
  v3 = [NSString stringWithUTF8String:"-[TSUZipArchive readChannel]"];
  id v4 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUZipArchive.m"];
  [v2 handleFailureInFunction:v3 file:v4 lineNumber:349 description:@"Abstract method"];

  id v5 = (void *)MEMORY[0x263EFF940];
  uint64_t v6 = *MEMORY[0x263EFF498];
  id v7 = [NSString stringWithFormat:@"%@: %s", @"Abstract method", "-[TSUZipArchive readChannel]"];
  id v8 = [v5 exceptionWithName:v6 reason:v7 userInfo:0];

  objc_exception_throw(v8);
}

- (id)debugDescription
{
  v3 = +[TSUDescription descriptionWithObject:self class:objc_opt_class()];
  id v4 = [(TSUZipArchive *)self readChannel];
  id v5 = TSUObjectReferenceDescription(v4);
  [v3 addField:@"readChannel" value:v5];

  uint64_t v6 = TSUCFArrayDescription((const __CFArray *)[(NSMutableDictionary *)self->_entries allValues]);
  [v3 addField:@"entries" value:v6];

  id v7 = [v3 descriptionString];

  return v7;
}

- (void).cxx_destruct
{
}

@end