@interface TSUZipArchive
- (BOOL)hasNonEmptyEntries;
- (BOOL)isValid;
- (BOOL)readCentralFileHeaderWithBuffer:(const void *)a3 dataSize:(unint64_t *)a4 error:(id *)a5;
- (BOOL)readExtraFieldsFromBuffer:(const void *)a3 extraFieldsLength:(unsigned __int16)a4 entry:(id)a5 dataSize:(unint64_t *)a6 error:(id *)a7;
- (BOOL)readFileCommentFromBuffer:(const void *)a3 fileCommentLength:(unsigned __int16)a4 entry:(id)a5 dataSize:(unint64_t *)a6 error:(id *)a7;
- (BOOL)readFilenameFromBuffer:(const void *)a3 nameLength:(unsigned __int16)a4 entry:(id)a5 dataSize:(unint64_t *)a6 error:(id *)a7;
- (BOOL)readLocalFileHeaderFilenameAndExtraFieldsData:(id)a3 forEntry:(id)a4 error:(id *)a5;
- (BOOL)readZip64ExtraFieldFromBuffer:(const void *)a3 dataLength:(unsigned __int16)a4 entry:(id)a5 error:(id *)a6;
- (TSUZipArchive)init;
- (TSUZipArchive)initWithOptions:(unint64_t)a3;
- (id)containedZipArchiveForEntry:(id)a3 options:(unint64_t)a4 error:(id *)a5;
- (id)debugDescription;
- (id)entryForName:(id)a3;
- (id)newArchiveReadChannel;
- (id)normalizeEntryName:(id)a3;
- (id)readChannelForEntry:(id)a3;
- (id)readChannelForEntry:(id)a3 validateCRC:(BOOL)a4;
- (id)streamReadChannelForEntry:(id)a3;
- (id)streamReadChannelForEntry:(id)a3 validateCRC:(BOOL)a4;
- (int64_t)endOfLastEntry;
- (unint64_t)archiveLength;
- (unint64_t)entriesCount;
- (void)addEntry:(id)a3;
- (void)collapseCommonRootDirectory;
- (void)enumerateEntriesUsingBlock:(id)a3;
- (void)readArchiveWithQueue:(id)a3 completion:(id)a4;
- (void)readCentralDirectoryData:(id)a3 entryCount:(unint64_t)a4 completion:(id)a5;
- (void)readCentralDirectoryWithEntryCount:(unint64_t)a3 offset:(int64_t)a4 size:(unint64_t)a5 channel:(id)a6 completion:(id)a7;
- (void)readEndOfCentralDirectoryData:(id)a3 eocdOffset:(int64_t)a4 channel:(id)a5 completion:(id)a6;
- (void)readLocalFileHeaderData:(id)a3 atOffset:(int64_t)a4 channel:(id)a5 completion:(id)a6;
- (void)readLocalFileHeaderEntriesFromChannel:(id)a3 offset:(int64_t)a4 previousEntry:(id)a5 seekAttempts:(unsigned int)a6 seekForward:(BOOL)a7 completion:(id)a8;
- (void)readZip64EndOfCentralDirectoryData:(id)a3 channel:(id)a4 completion:(id)a5;
- (void)readZip64EndOfCentralDirectoryLocatorData:(id)a3 channel:(id)a4 completion:(id)a5;
- (void)readZip64EndOfCentralDirectoryLocatorWithChannel:(id)a3 eocdOffset:(int64_t)a4 completion:(id)a5;
- (void)readZip64EndOfCentralDirectoryWithChannel:(id)a3 offset:(int64_t)a4 completion:(id)a5;
@end

@implementation TSUZipArchive

- (TSUZipArchive)init
{
  return [(TSUZipArchive *)self initWithOptions:0];
}

- (TSUZipArchive)initWithOptions:(unint64_t)a3
{
  v11.receiver = self;
  v11.super_class = (Class)TSUZipArchive;
  v4 = [(TSUZipArchive *)&v11 init];
  v5 = v4;
  if (v4)
  {
    v4->_options = a3;
    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    entriesMap = v5->_entriesMap;
    v5->_entriesMap = v6;

    v8 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x263EFF9B0]);
    entries = v5->_entries;
    v5->_entries = v8;
  }
  return v5;
}

- (unint64_t)entriesCount
{
  return [(NSMutableOrderedSet *)self->_entries count];
}

- (BOOL)hasNonEmptyEntries
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __35__TSUZipArchive_hasNonEmptyEntries__block_invoke;
  v4[3] = &unk_264D61360;
  v4[4] = &v5;
  [(TSUZipArchive *)self enumerateEntriesUsingBlock:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __35__TSUZipArchive_hasNonEmptyEntries__block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  uint64_t result = [a3 size];
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

- (void)readArchiveWithQueue:(id)a3 completion:(id)a4
{
  v6 = a3;
  id v7 = a4;
  unint64_t v8 = [(TSUZipArchive *)self archiveLength];
  id v9 = [(TSUZipArchive *)self newArchiveReadChannel];
  v10 = v9;
  if (v9)
  {
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __49__TSUZipArchive_readArchiveWithQueue_completion___block_invoke;
    aBlock[3] = &unk_264D613B0;
    objc_super v11 = (id *)v21;
    id v12 = v9;
    v21[0] = v12;
    v21[1] = self;
    v22 = v6;
    id v23 = v7;
    v13 = _Block_copy(aBlock);
    if ((self->_options & 8) != 0)
    {
      [(TSUZipArchive *)self readLocalFileHeaderEntriesFromChannel:v12 offset:0 previousEntry:0 seekAttempts:0 seekForward:0 completion:v13];
    }
    else
    {
      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      v16[2] = __49__TSUZipArchive_readArchiveWithQueue_completion___block_invoke_3;
      v16[3] = &unk_264D61400;
      v16[4] = self;
      unint64_t v19 = v8 - 22;
      id v17 = v12;
      id v18 = v13;
      +[TSUIOUtils readAllFromChannel:v17 offset:v8 - 22 length:22 completion:v16];
    }
  }
  else
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __49__TSUZipArchive_readArchiveWithQueue_completion___block_invoke_6;
    block[3] = &unk_264D61428;
    objc_super v11 = &v15;
    id v15 = v7;
    dispatch_async(v6, block);
  }
}

void __49__TSUZipArchive_readArchiveWithQueue_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) close];
  if (v3)
  {
    v4 = 0;
  }
  else
  {
    uint64_t v5 = *(unsigned char **)(a1 + 40);
    if (v5[8])
    {
      [v5 collapseCommonRootDirectory];
      uint64_t v5 = *(unsigned char **)(a1 + 40);
    }
    v4 = v5;
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__TSUZipArchive_readArchiveWithQueue_completion___block_invoke_2;
  block[3] = &unk_264D61388;
  v6 = *(NSObject **)(a1 + 48);
  id v7 = *(id *)(a1 + 56);
  id v12 = v3;
  id v13 = v7;
  id v11 = v4;
  id v8 = v3;
  id v9 = v4;
  dispatch_async(v6, block);
}

uint64_t __49__TSUZipArchive_readArchiveWithQueue_completion___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __49__TSUZipArchive_readArchiveWithQueue_completion___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    v4 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v4();
  }
  else
  {
    uint64_t v6 = *(void *)(a1 + 56);
    id v8 = *(void **)(a1 + 32);
    id v7 = *(void **)(a1 + 40);
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __49__TSUZipArchive_readArchiveWithQueue_completion___block_invoke_4;
    v11[3] = &unk_264D613D8;
    v11[4] = v8;
    id v12 = v7;
    id v9 = *(id *)(a1 + 48);
    uint64_t v10 = *(void *)(a1 + 56);
    id v13 = v9;
    uint64_t v14 = v10;
    [v8 readEndOfCentralDirectoryData:a2 eocdOffset:v6 channel:v12 completion:v11];
  }
}

void __49__TSUZipArchive_readArchiveWithQueue_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  id v10 = v3;
  if ((*(unsigned char *)(*(void *)(a1 + 32) + 8) & 4) != 0
    && (uint64_t v5 = [v3 code], v4 = v10, v5 == 259)
    && ([v10 domain],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        int v7 = [v6 isEqualToString:*MEMORY[0x263F07F70]],
        v6,
        id v4 = v10,
        v7))
  {
    id v8 = [v10 userInfo];
    id v9 = [v8 objectForKeyedSubscript:@"TSUZipArchiveErrorDescription"];

    if (v9)
    {
      if (TSUDefaultCat_init_token != -1) {
        dispatch_once(&TSUDefaultCat_init_token, &__block_literal_global_20);
      }
      [*(id *)(a1 + 32) readLocalFileHeaderEntriesFromChannel:*(void *)(a1 + 40) offset:0 previousEntry:0 seekAttempts:0 seekForward:0 completion:*(void *)(a1 + 48)];
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
  }
  else
  {
    if (!v4) {
      *(void *)(*(void *)(a1 + 32) + 32) = *(void *)(a1 + 56);
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __49__TSUZipArchive_readArchiveWithQueue_completion___block_invoke_5()
{
  uint64_t v0 = TSULogCreateCategory("TSUDefaultCat");
  v1 = (void *)TSUDefaultCat_log_t;
  TSUDefaultCat_log_t = v0;
}

void __49__TSUZipArchive_readArchiveWithQueue_completion___block_invoke_6(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  objc_msgSend(MEMORY[0x263F087E8], "tsu_fileReadUnknownErrorWithUserInfo:", 0);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

- (void)readEndOfCentralDirectoryData:(id)a3 eocdOffset:(int64_t)a4 channel:(id)a5 completion:(id)a6
{
  v29[1] = *MEMORY[0x263EF8340];
  id v10 = a5;
  id v11 = (void (**)(id, void *))a6;
  size_t size_ptr = 0;
  buffer_ptr = 0;
  dispatch_data_t v12 = dispatch_data_create_map((dispatch_data_t)a3, (const void **)&buffer_ptr, &size_ptr);
  if (size_ptr <= 0x15)
  {
    id v13 = (void *)MEMORY[0x263F087E8];
    v28 = @"TSUZipArchiveErrorDescription";
    v29[0] = @"Wrong data size for TSUZipEndOfCentralDirectoryRecord";
    uint64_t v14 = NSDictionary;
    id v15 = (__CFString **)v29;
    v16 = &v28;
    goto LABEL_8;
  }
  if (*(_DWORD *)buffer_ptr != 101010256)
  {
    id v13 = (void *)MEMORY[0x263F087E8];
    v26 = @"TSUZipArchiveErrorDescription";
    v27 = @"Don't support end of central directory comments";
    uint64_t v14 = NSDictionary;
    id v15 = &v27;
    v16 = &v26;
LABEL_8:
    id v17 = [v14 dictionaryWithObjects:v15 forKeys:v16 count:1];
    id v18 = objc_msgSend(v13, "tsu_fileReadCorruptedFileErrorWithUserInfo:", v17);

    if (v18)
    {
      v11[2](v11, v18);
    }
    else
    {
      unint64_t v19 = objc_msgSend(MEMORY[0x263F087E8], "tsu_fileReadUnknownErrorWithUserInfo:", 0);
      v11[2](v11, v19);
    }
    goto LABEL_11;
  }
  if (*((_WORD *)buffer_ptr + 2) || *((_WORD *)buffer_ptr + 3))
  {
    id v13 = (void *)MEMORY[0x263F087E8];
    v24 = @"TSUZipArchiveErrorDescription";
    v25 = @"Don't support multi-disk";
    uint64_t v14 = NSDictionary;
    id v15 = &v25;
    v16 = &v24;
    goto LABEL_8;
  }
  if (*((unsigned __int16 *)buffer_ptr + 5) == 0xFFFFLL
    || *((_DWORD *)buffer_ptr + 4) == -1
    || *((_DWORD *)buffer_ptr + 3) == -1)
  {
    [(TSUZipArchive *)self readZip64EndOfCentralDirectoryLocatorWithChannel:v10 eocdOffset:a4 completion:v11];
  }
  else
  {
    -[TSUZipArchive readCentralDirectoryWithEntryCount:offset:size:channel:completion:](self, "readCentralDirectoryWithEntryCount:offset:size:channel:completion:");
  }
LABEL_11:
}

- (void)readZip64EndOfCentralDirectoryLocatorWithChannel:(id)a3 eocdOffset:(int64_t)a4 completion:(id)a5
{
  v17[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  if ((unint64_t)a4 > 0x13)
  {
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __88__TSUZipArchive_readZip64EndOfCentralDirectoryLocatorWithChannel_eocdOffset_completion___block_invoke;
    v13[3] = &unk_264D61450;
    v13[4] = self;
    id v14 = v8;
    id v15 = v9;
    +[TSUIOUtils readAllFromChannel:v14 offset:a4 - 20 length:20 completion:v13];
  }
  else
  {
    id v10 = (void *)MEMORY[0x263F087E8];
    v16 = @"TSUZipArchiveErrorDescription";
    v17[0] = @"File isn't long enough for Zip64 locator";
    id v11 = [NSDictionary dictionaryWithObjects:v17 forKeys:&v16 count:1];
    dispatch_data_t v12 = objc_msgSend(v10, "tsu_fileReadCorruptedFileErrorWithUserInfo:", v11);
    (*((void (**)(id, void *))v9 + 2))(v9, v12);
  }
}

uint64_t __88__TSUZipArchive_readZip64EndOfCentralDirectoryLocatorWithChannel_eocdOffset_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else {
    return [*(id *)(a1 + 32) readZip64EndOfCentralDirectoryLocatorData:a2 channel:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
  }
}

- (void)readZip64EndOfCentralDirectoryLocatorData:(id)a3 channel:(id)a4 completion:(id)a5
{
  v25[1] = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = (void (**)(id, void *))a5;
  size_t size_ptr = 0;
  buffer_ptr = 0;
  dispatch_data_t v10 = dispatch_data_create_map((dispatch_data_t)a3, (const void **)&buffer_ptr, &size_ptr);
  if (size_ptr <= 0x13)
  {
    id v11 = (void *)MEMORY[0x263F087E8];
    v24 = @"TSUZipArchiveErrorDescription";
    v25[0] = @"Wrong data size for TSUZip64EndOfCentralDirectoryLocatorRecord";
    dispatch_data_t v12 = NSDictionary;
    id v13 = (__CFString **)v25;
    id v14 = &v24;
  }
  else if (*(_DWORD *)buffer_ptr == 117853008)
  {
    if (!*((_DWORD *)buffer_ptr + 1) && *((_DWORD *)buffer_ptr + 4) == 1)
    {
      [(TSUZipArchive *)self readZip64EndOfCentralDirectoryWithChannel:v8 offset:*((void *)buffer_ptr + 1) completion:v9];
      goto LABEL_12;
    }
    id v11 = (void *)MEMORY[0x263F087E8];
    v20 = @"TSUZipArchiveErrorDescription";
    v21 = @"Multi-disk is not supported";
    dispatch_data_t v12 = NSDictionary;
    id v13 = &v21;
    id v14 = &v20;
  }
  else
  {
    id v11 = (void *)MEMORY[0x263F087E8];
    v22 = @"TSUZipArchiveErrorDescription";
    id v23 = @"Zip64 end of central directory locator record signature not found";
    dispatch_data_t v12 = NSDictionary;
    id v13 = &v23;
    id v14 = &v22;
  }
  id v15 = [v12 dictionaryWithObjects:v13 forKeys:v14 count:1];
  v16 = objc_msgSend(v11, "tsu_fileReadCorruptedFileErrorWithUserInfo:", v15);

  if (v16)
  {
    v9[2](v9, v16);
  }
  else
  {
    id v17 = objc_msgSend(MEMORY[0x263F087E8], "tsu_fileReadUnknownErrorWithUserInfo:", 0);
    v9[2](v9, v17);
  }
LABEL_12:
}

- (void)readZip64EndOfCentralDirectoryWithChannel:(id)a3 offset:(int64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __77__TSUZipArchive_readZip64EndOfCentralDirectoryWithChannel_offset_completion___block_invoke;
  v12[3] = &unk_264D61450;
  v12[4] = self;
  id v13 = v8;
  id v14 = v9;
  id v10 = v9;
  id v11 = v8;
  +[TSUIOUtils readAllFromChannel:v11 offset:a4 length:56 completion:v12];
}

uint64_t __77__TSUZipArchive_readZip64EndOfCentralDirectoryWithChannel_offset_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else {
    return [*(id *)(a1 + 32) readZip64EndOfCentralDirectoryData:a2 channel:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
  }
}

- (void)readZip64EndOfCentralDirectoryData:(id)a3 channel:(id)a4 completion:(id)a5
{
  v25[1] = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = (void (**)(id, void *))a5;
  size_t size_ptr = 0;
  buffer_ptr = 0;
  dispatch_data_t v10 = dispatch_data_create_map((dispatch_data_t)a3, (const void **)&buffer_ptr, &size_ptr);
  if (size_ptr <= 0x37)
  {
    id v11 = (void *)MEMORY[0x263F087E8];
    v24 = @"TSUZipArchiveErrorDescription";
    v25[0] = @"Wrong data size for TSUZip64EndOfCentralDirectoryRecord";
    dispatch_data_t v12 = NSDictionary;
    id v13 = (__CFString **)v25;
    id v14 = &v24;
  }
  else if (*(_DWORD *)buffer_ptr == 101075792)
  {
    if (!*((_DWORD *)buffer_ptr + 4) && !*((_DWORD *)buffer_ptr + 5))
    {
      [(TSUZipArchive *)self readCentralDirectoryWithEntryCount:*((void *)buffer_ptr + 4) offset:*((void *)buffer_ptr + 6) size:*((void *)buffer_ptr + 5) channel:v8 completion:v9];
      goto LABEL_11;
    }
    id v11 = (void *)MEMORY[0x263F087E8];
    v20 = @"TSUZipArchiveErrorDescription";
    v21 = @"Multi-disk is not supported";
    dispatch_data_t v12 = NSDictionary;
    id v13 = &v21;
    id v14 = &v20;
  }
  else
  {
    id v11 = (void *)MEMORY[0x263F087E8];
    v22 = @"TSUZipArchiveErrorDescription";
    id v23 = @"Zip64 end of central directory record signature not found";
    dispatch_data_t v12 = NSDictionary;
    id v13 = &v23;
    id v14 = &v22;
  }
  id v15 = [v12 dictionaryWithObjects:v13 forKeys:v14 count:1];
  v16 = objc_msgSend(v11, "tsu_fileReadCorruptedFileErrorWithUserInfo:", v15);

  if (v16)
  {
    v9[2](v9, v16);
  }
  else
  {
    id v17 = objc_msgSend(MEMORY[0x263F087E8], "tsu_fileReadUnknownErrorWithUserInfo:", 0);
    v9[2](v9, v17);
  }
LABEL_11:
}

- (void)readCentralDirectoryWithEntryCount:(unint64_t)a3 offset:(int64_t)a4 size:(unint64_t)a5 channel:(id)a6 completion:(id)a7
{
  id v12 = a7;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __83__TSUZipArchive_readCentralDirectoryWithEntryCount_offset_size_channel_completion___block_invoke;
  v14[3] = &unk_264D61478;
  id v15 = v12;
  unint64_t v16 = a3;
  v14[4] = self;
  id v13 = v12;
  +[TSUIOUtils readAllFromChannel:a6 offset:a4 length:a5 completion:v14];
}

uint64_t __83__TSUZipArchive_readCentralDirectoryWithEntryCount_offset_size_channel_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else {
    return [*(id *)(a1 + 32) readCentralDirectoryData:a2 entryCount:*(void *)(a1 + 48) completion:*(void *)(a1 + 40)];
  }
}

- (void)readCentralDirectoryData:(id)a3 entryCount:(unint64_t)a4 completion:(id)a5
{
  id v8 = (void (**)(id, id))a5;
  size_t size_ptr = 0;
  buffer_ptr = 0;
  dispatch_data_t v9 = dispatch_data_create_map((dispatch_data_t)a3, (const void **)&buffer_ptr, &size_ptr);
  id v10 = 0;
  if (!a4) {
    goto LABEL_7;
  }
  unint64_t v11 = 1;
  do
  {
    id v12 = v10;
    id v15 = v10;
    BOOL v13 = [(TSUZipArchive *)self readCentralFileHeaderWithBuffer:&buffer_ptr dataSize:&size_ptr error:&v15];
    id v10 = v15;

    if (!v13) {
      break;
    }
  }
  while (v11++ < a4);
  if (!v13)
  {
    if (!v10)
    {
      objc_msgSend(MEMORY[0x263F087E8], "tsu_fileReadUnknownErrorWithUserInfo:", 0);
      id v10 = (id)objc_claimAutoreleasedReturnValue();
    }
    v8[2](v8, v10);
  }
  else
  {
LABEL_7:
    v8[2](v8, 0);
  }
}

- (BOOL)readCentralFileHeaderWithBuffer:(const void *)a3 dataSize:(unint64_t *)a4 error:(id *)a5
{
  v43[1] = *MEMORY[0x263EF8340];
  dispatch_data_t v9 = objc_alloc_init(TSUZipEntry);
  id v10 = v9;
  if (*a4 <= 0x2D)
  {
    id v14 = (void *)MEMORY[0x263F087E8];
    v42 = @"TSUZipArchiveErrorDescription";
    v43[0] = @"Central directory too short";
    id v15 = NSDictionary;
    unint64_t v16 = (__CFString **)v43;
    id v17 = &v42;
    goto LABEL_9;
  }
  unint64_t v11 = (unsigned __int16 *)*a3;
  id v12 = (char *)*a3 + 46;
  int v13 = *(_DWORD *)*a3;
  *a4 -= 46;
  *a3 = v12;
  if (v13 != 33639248)
  {
    id v14 = (void *)MEMORY[0x263F087E8];
    v40 = @"TSUZipArchiveErrorDescription";
    v41 = @"Central directory file header has bad signature";
    id v15 = NSDictionary;
    unint64_t v16 = &v41;
    id v17 = &v40;
    goto LABEL_9;
  }
  if (v11[4])
  {
    id v14 = (void *)MEMORY[0x263F087E8];
    v38 = @"TSUZipArchiveErrorDescription";
    v39 = @"Encrypted files are not supported";
    id v15 = NSDictionary;
    unint64_t v16 = &v39;
    id v17 = &v38;
    goto LABEL_9;
  }
  if (v11[17])
  {
    id v14 = (void *)MEMORY[0x263F087E8];
    v36 = @"TSUZipArchiveErrorDescription";
    v37 = @"No multi-disk support";
    id v15 = NSDictionary;
    unint64_t v16 = &v37;
    id v17 = &v36;
LABEL_9:
    id v18 = [v15 dictionaryWithObjects:v16 forKeys:v17 count:1];
    objc_msgSend(v14, "tsu_fileReadCorruptedFileErrorWithUserInfo:", v18);
    id v19 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_10;
  }
  int v22 = v11[5];
  if (v11[5]) {
    BOOL v23 = v22 == (unsigned __int16)TSUZipDeflateCompressionMethod;
  }
  else {
    BOOL v23 = 1;
  }
  if (!v23)
  {
    id v14 = (void *)MEMORY[0x263F087E8];
    v34 = @"TSUZipArchiveErrorDescription";
    v35 = @"Unsupported compression method";
    id v15 = NSDictionary;
    unint64_t v16 = &v35;
    id v17 = &v34;
    goto LABEL_9;
  }
  [(TSUZipEntry *)v9 setCompressed:v22 == (unsigned __int16)TSUZipDeflateCompressionMethod];
  v24 = objc_msgSend(objc_alloc(MEMORY[0x263EFF910]), "tsu_initWithDOSTime:", v11[7] | ((unint64_t)v11[6] << 16));
  [(TSUZipEntry *)v10 setLastModificationDate:v24];

  [(TSUZipEntry *)v10 setCRC:*((unsigned int *)v11 + 4)];
  [(TSUZipEntry *)v10 setCompressedSize:*((unsigned int *)v11 + 5)];
  [(TSUZipEntry *)v10 setSize:*((unsigned int *)v11 + 6)];
  [(TSUZipEntry *)v10 setOffset:*(unsigned int *)(v11 + 21)];
  [(TSUZipEntry *)v10 setNameLength:v11[14]];
  [(TSUZipEntry *)v10 setExtraFieldsLength:v11[15]];
  uint64_t v25 = v11[14];
  id v33 = 0;
  BOOL v26 = [(TSUZipArchive *)self readFilenameFromBuffer:a3 nameLength:v25 entry:v10 dataSize:a4 error:&v33];
  id v27 = v33;
  id v19 = v27;
  if (v26)
  {
    if (!v11[15]
      || (v32 = v27,
          v28 = -[TSUZipArchive readExtraFieldsFromBuffer:extraFieldsLength:entry:dataSize:error:](self, "readExtraFieldsFromBuffer:extraFieldsLength:entry:dataSize:error:", a3), v29 = v32, v19, id v19 = v29, v28))
    {
      if (!v11[16]
        || (v30 = -[TSUZipArchive readFileCommentFromBuffer:fileCommentLength:entry:dataSize:error:](self, "readFileCommentFromBuffer:fileCommentLength:entry:dataSize:error:", a3), v31 = v19, v19, id v19 = v31, v30))
      {
        [(TSUZipArchive *)self addEntry:v10];
        BOOL v20 = 1;
        goto LABEL_13;
      }
    }
  }
LABEL_10:
  if (a5)
  {
    id v19 = v19;
    BOOL v20 = 0;
    *a5 = v19;
  }
  else
  {
    BOOL v20 = 0;
  }
LABEL_13:

  return v20;
}

- (BOOL)readFilenameFromBuffer:(const void *)a3 nameLength:(unsigned __int16)a4 entry:(id)a5 dataSize:(unint64_t *)a6 error:(id *)a7
{
  unsigned int v9 = a4;
  v23[1] = *MEMORY[0x263EF8340];
  id v11 = a5;
  if (*a6 < v9)
  {
    id v12 = (void *)MEMORY[0x263F087E8];
    BOOL v20 = @"TSUZipArchiveErrorDescription";
    v21 = @"Central directory too short";
    int v13 = [NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];
    id v14 = objc_msgSend(v12, "tsu_fileReadCorruptedFileErrorWithUserInfo:", v13);
LABEL_6:
    BOOL v16 = 0;
    goto LABEL_7;
  }
  uint64_t v15 = v9;
  int v13 = (void *)[[NSString alloc] initWithBytes:*a3 length:v9 encoding:4];
  [v11 setName:v13];
  *a6 -= v15;
  *a3 = (char *)*a3 + v15;
  BOOL v16 = v13 != 0;
  if (!v13)
  {
    id v17 = (void *)MEMORY[0x263F087E8];
    int v22 = @"TSUZipArchiveErrorDescription";
    v23[0] = @"Couldn't read name";
    id v18 = [NSDictionary dictionaryWithObjects:v23 forKeys:&v22 count:1];
    id v14 = objc_msgSend(v17, "tsu_fileReadCorruptedFileErrorWithUserInfo:", v18);

    goto LABEL_6;
  }
  id v14 = 0;
LABEL_7:

  if (a7 && !v16) {
    *a7 = v14;
  }

  return v16;
}

- (BOOL)readExtraFieldsFromBuffer:(const void *)a3 extraFieldsLength:(unsigned __int16)a4 entry:(id)a5 dataSize:(unint64_t *)a6 error:(id *)a7
{
  unsigned int v9 = a4;
  v33[1] = *MEMORY[0x263EF8340];
  id v29 = a5;
  if (*a6 < v9)
  {
    id v12 = (void *)MEMORY[0x263F087E8];
    BOOL v30 = @"TSUZipArchiveErrorDescription";
    id v31 = @"Central directory too short";
    int v13 = [NSDictionary dictionaryWithObjects:&v31 forKeys:&v30 count:1];
    id v14 = objc_msgSend(v12, "tsu_fileReadCorruptedFileErrorWithUserInfo:", v13);

    BOOL v15 = 0;
    if (!a7) {
      goto LABEL_18;
    }
    goto LABEL_16;
  }
  id v14 = 0;
  BOOL v16 = (char *)*a3 + v9;
  BOOL v17 = 1;
  while (1)
  {
    id v18 = (char *)*a3;
    id v19 = (char *)*a3 + 4;
    BOOL v15 = v19 > v16;
    if (v19 > v16) {
      break;
    }
    unint64_t v20 = *a6 - 4;
    *a6 = v20;
    *a3 = v19;
    uint64_t v21 = *((unsigned __int16 *)v18 + 1);
    if (&v19[v21] > v16)
    {
      BOOL v23 = (void *)MEMORY[0x263F087E8];
      v32 = @"TSUZipArchiveErrorDescription";
      v33[0] = @"Invalid Zip entry extra field length";
      v24 = [NSDictionary dictionaryWithObjects:v33 forKeys:&v32 count:1];
      uint64_t v25 = objc_msgSend(v23, "tsu_fileReadCorruptedFileErrorWithUserInfo:", v24);

      id v14 = (void *)v25;
LABEL_12:
      id v18 = (char *)*a3;
      break;
    }
    if (*(unsigned __int16 *)v18 == (unsigned __int16)TSUZip64ExtraFieldSignature)
    {
      BOOL v17 = -[TSUZipArchive readZip64ExtraFieldFromBuffer:dataLength:entry:error:](self, "readZip64ExtraFieldFromBuffer:dataLength:entry:error:");
      id v22 = v14;

      uint64_t v21 = *((unsigned __int16 *)v18 + 1);
      unint64_t v20 = *a6;
      id v14 = v22;
      id v19 = (char *)*a3;
    }
    *a6 = v20 - v21;
    *a3 = &v19[v21];
    if (!v17) {
      goto LABEL_12;
    }
  }
  if (v18 != v16)
  {
    BOOL v26 = [NSString stringWithUTF8String:"-[TSUZipArchive readExtraFieldsFromBuffer:extraFieldsLength:entry:dataSize:error:]"];
    id v27 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUZipArchive.m"];
    +[OITSUAssertionHandler handleFailureInFunction:v26 file:v27 lineNumber:453 isFatal:0 description:"Unexpected buffer position while reading extra fields."];

    +[OITSUAssertionHandler logBacktraceThrottled];
  }
  if (a7)
  {
LABEL_16:
    if (!v15) {
      *a7 = v14;
    }
  }
LABEL_18:

  return v15;
}

- (BOOL)readZip64ExtraFieldFromBuffer:(const void *)a3 dataLength:(unsigned __int16)a4 entry:(id)a5 error:(id *)a6
{
  unsigned int v7 = a4;
  v26[1] = *MEMORY[0x263EF8340];
  id v9 = a5;
  if ([v9 size] == 0xFFFFFFFFLL)
  {
    BOOL v10 = v7 >= 8;
    LOWORD(v7) = v7 - 8;
    if (!v10)
    {
      BOOL v15 = (void *)MEMORY[0x263F087E8];
      uint64_t v25 = @"TSUZipArchiveErrorDescription";
      v26[0] = @"Not enough room for Zip64 uncompressed size";
      BOOL v16 = NSDictionary;
      BOOL v17 = (__CFString **)v26;
      id v18 = &v25;
      goto LABEL_14;
    }
    uint64_t v11 = *(void *)a3;
    a3 = (char *)a3 + 8;
    [v9 setSize:v11];
  }
  if ([v9 compressedSize] == 0xFFFFFFFFLL)
  {
    if ((unsigned __int16)v7 < 8u)
    {
      BOOL v15 = (void *)MEMORY[0x263F087E8];
      BOOL v23 = @"TSUZipArchiveErrorDescription";
      v24 = @"Not enough room for Zip64 compressed size";
      BOOL v16 = NSDictionary;
      BOOL v17 = &v24;
      id v18 = &v23;
      goto LABEL_14;
    }
    uint64_t v12 = *(void *)a3;
    a3 = (char *)a3 + 8;
    [v9 setCompressedSize:v12];
    LOWORD(v7) = v7 - 8;
  }
  if ([v9 offset] != 0xFFFFFFFFLL)
  {
LABEL_11:
    id v13 = 0;
    BOOL v14 = 1;
    goto LABEL_17;
  }
  if ((unsigned __int16)v7 >= 8u)
  {
    [v9 setOffset:*(void *)a3];
    goto LABEL_11;
  }
  BOOL v15 = (void *)MEMORY[0x263F087E8];
  uint64_t v21 = @"TSUZipArchiveErrorDescription";
  id v22 = @"Not enough room for Zip64 offset";
  BOOL v16 = NSDictionary;
  BOOL v17 = &v22;
  id v18 = &v21;
LABEL_14:
  id v19 = [v16 dictionaryWithObjects:v17 forKeys:v18 count:1];
  objc_msgSend(v15, "tsu_fileReadCorruptedFileErrorWithUserInfo:", v19);
  id v13 = (id)objc_claimAutoreleasedReturnValue();

  if (a6)
  {
    id v13 = v13;
    BOOL v14 = 0;
    *a6 = v13;
  }
  else
  {
    BOOL v14 = 0;
  }
LABEL_17:

  return v14;
}

- (BOOL)readFileCommentFromBuffer:(const void *)a3 fileCommentLength:(unsigned __int16)a4 entry:(id)a5 dataSize:(unint64_t *)a6 error:(id *)a7
{
  unsigned int v9 = a4;
  v19[1] = *MEMORY[0x263EF8340];
  id v11 = a5;
  unint64_t v12 = *a6;
  unint64_t v13 = v9;
  if (*a6 < v9)
  {
    BOOL v15 = (void *)MEMORY[0x263F087E8];
    id v18 = @"TSUZipArchiveErrorDescription";
    v19[0] = @"Central directory too short";
    BOOL v16 = [NSDictionary dictionaryWithObjects:v19 forKeys:&v18 count:1];
    objc_msgSend(v15, "tsu_fileReadCorruptedFileErrorWithUserInfo:", v16);
    id v14 = (id)objc_claimAutoreleasedReturnValue();

    if (a7)
    {
      id v14 = v14;
      *a7 = v14;
    }
  }
  else
  {
    id v14 = 0;
    *a6 = v12 - v13;
    *a3 = (char *)*a3 + v13;
  }

  return v12 >= v13;
}

- (void)readLocalFileHeaderEntriesFromChannel:(id)a3 offset:(int64_t)a4 previousEntry:(id)a5 seekAttempts:(unsigned int)a6 seekForward:(BOOL)a7 completion:(id)a8
{
  id v14 = a3;
  id v15 = a5;
  id v16 = a8;
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __112__TSUZipArchive_readLocalFileHeaderEntriesFromChannel_offset_previousEntry_seekAttempts_seekForward_completion___block_invoke;
  v20[3] = &unk_264D614C8;
  id v23 = v16;
  int64_t v24 = a4;
  v20[4] = self;
  id v21 = v14;
  BOOL v26 = a7;
  unsigned int v25 = a6;
  id v22 = v15;
  id v17 = v16;
  id v18 = v15;
  id v19 = v14;
  +[TSUIOUtils readAllFromChannel:v19 offset:a4 length:30 completion:v20];
}

void __112__TSUZipArchive_readLocalFileHeaderEntriesFromChannel_offset_previousEntry_seekAttempts_seekForward_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    id v4 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    v4();
  }
  else
  {
    uint64_t v6 = *(void *)(a1 + 64);
    unsigned int v7 = *(void **)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 40);
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __112__TSUZipArchive_readLocalFileHeaderEntriesFromChannel_offset_previousEntry_seekAttempts_seekForward_completion___block_invoke_2;
    v9[3] = &unk_264D614A0;
    v9[4] = v7;
    id v10 = *(id *)(a1 + 48);
    char v14 = *(unsigned char *)(a1 + 76);
    int v13 = *(_DWORD *)(a1 + 72);
    id v11 = *(id *)(a1 + 40);
    id v12 = *(id *)(a1 + 56);
    [v7 readLocalFileHeaderData:a2 atOffset:v6 channel:v8 completion:v9];
  }
}

void __112__TSUZipArchive_readLocalFileHeaderEntriesFromChannel_offset_previousEntry_seekAttempts_seekForward_completion___block_invoke_2(uint64_t a1, void *a2, void *a3, char a4)
{
  id v29 = a2;
  id v7 = a3;
  if (v7)
  {
    uint64_t v8 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
LABEL_3:
    v8();
    goto LABEL_11;
  }
  if (v29)
  {
    objc_msgSend(*(id *)(a1 + 32), "addEntry:");
    unsigned int v9 = *(void **)(a1 + 40);
    if (v9 && !*(unsigned char *)(a1 + 68) && *(_DWORD *)(a1 + 64)) {
      objc_msgSend(v9, "setCompressedSize:", objc_msgSend(*(id *)(a1 + 40), "compressedSize") - *(unsigned int *)(a1 + 64));
    }
    uint64_t v10 = [v29 offset];
    uint64_t v11 = [v29 fileHeaderLength] + v10;
    uint64_t v12 = v11 + [v29 compressedSize];
    int v13 = *(void **)(a1 + 32);
    uint64_t v14 = *(void *)(a1 + 48);
    uint64_t v15 = *(void *)(a1 + 56);
    id v16 = v29;
    uint64_t v17 = 0;
    uint64_t v18 = 0;
    goto LABEL_10;
  }
  if (a4)
  {
LABEL_39:
    uint64_t v8 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    goto LABEL_3;
  }
  uint64_t v19 = *(unsigned int *)(a1 + 64);
  if (*(unsigned char *)(a1 + 68))
  {
    if (v19)
    {
LABEL_25:
      int v22 = 1;
      unint64_t v21 = 100;
      goto LABEL_26;
    }
LABEL_22:
    if (TSUDefaultCat_init_token != -1) {
      dispatch_once(&TSUDefaultCat_init_token, &__block_literal_global_83);
    }
    LODWORD(v19) = 0;
    goto LABEL_25;
  }
  unint64_t v20 = [*(id *)(a1 + 40) compressedSize];
  if (v20 >= 0x64) {
    unint64_t v21 = 100;
  }
  else {
    unint64_t v21 = v20;
  }
  if (v21 == v19) {
    goto LABEL_22;
  }
  if (!v19)
  {
    if (TSUDefaultCat_init_token == -1)
    {
      if (v21)
      {
LABEL_33:
        uint64_t v23 = 1;
        goto LABEL_34;
      }
    }
    else
    {
      dispatch_once(&TSUDefaultCat_init_token, &__block_literal_global_85);
      if (v21) {
        goto LABEL_33;
      }
    }
LABEL_37:
    if (TSUDefaultCat_init_token != -1) {
      dispatch_once(&TSUDefaultCat_init_token, &__block_literal_global_87);
    }
    goto LABEL_39;
  }
  int v22 = 0;
LABEL_26:
  if (v21 <= v19) {
    goto LABEL_37;
  }
  uint64_t v23 = (v19 + 1);
  if (!v22)
  {
LABEL_34:
    uint64_t v26 = [*(id *)(a1 + 40) offset];
    uint64_t v27 = [*(id *)(a1 + 40) fileHeaderLength];
    uint64_t v28 = [*(id *)(a1 + 40) compressedSize];
    uint64_t v18 = 0;
    uint64_t v12 = v26 - v23 + v27 + v28;
    goto LABEL_35;
  }
  uint64_t v24 = [*(id *)(a1 + 40) offset];
  uint64_t v25 = [*(id *)(a1 + 40) fileHeaderLength];
  uint64_t v12 = v24 + v23 + v25 + [*(id *)(a1 + 40) compressedSize];
  uint64_t v18 = 1;
LABEL_35:
  int v13 = *(void **)(a1 + 32);
  id v16 = *(id *)(a1 + 40);
  uint64_t v14 = *(void *)(a1 + 48);
  uint64_t v15 = *(void *)(a1 + 56);
  uint64_t v17 = v23;
LABEL_10:
  [v13 readLocalFileHeaderEntriesFromChannel:v14 offset:v12 previousEntry:v16 seekAttempts:v17 seekForward:v18 completion:v15];
LABEL_11:
}

void __112__TSUZipArchive_readLocalFileHeaderEntriesFromChannel_offset_previousEntry_seekAttempts_seekForward_completion___block_invoke_3()
{
  uint64_t v0 = TSULogCreateCategory("TSUDefaultCat");
  uint64_t v1 = (void *)TSUDefaultCat_log_t;
  TSUDefaultCat_log_t = v0;
}

void __112__TSUZipArchive_readLocalFileHeaderEntriesFromChannel_offset_previousEntry_seekAttempts_seekForward_completion___block_invoke_4()
{
  uint64_t v0 = TSULogCreateCategory("TSUDefaultCat");
  uint64_t v1 = (void *)TSUDefaultCat_log_t;
  TSUDefaultCat_log_t = v0;
}

void __112__TSUZipArchive_readLocalFileHeaderEntriesFromChannel_offset_previousEntry_seekAttempts_seekForward_completion___block_invoke_5()
{
  uint64_t v0 = TSULogCreateCategory("TSUDefaultCat");
  uint64_t v1 = (void *)TSUDefaultCat_log_t;
  TSUDefaultCat_log_t = v0;
}

- (void)readLocalFileHeaderData:(id)a3 atOffset:(int64_t)a4 channel:(id)a5 completion:(id)a6
{
  v46[1] = *MEMORY[0x263EF8340];
  id v10 = a5;
  id v11 = a6;
  size_t size_ptr = 0;
  buffer_ptr = 0;
  dispatch_data_t v12 = dispatch_data_create_map((dispatch_data_t)a3, (const void **)&buffer_ptr, &size_ptr);
  if (size_ptr <= 0x1D)
  {
    unint64_t v21 = (void *)MEMORY[0x263F087E8];
    v45 = @"TSUZipArchiveErrorDescription";
    v46[0] = @"Wrong data size for TSUZipLocalFileHeaderRecord";
    int v22 = NSDictionary;
    BOOL v23 = 1;
    uint64_t v24 = (__CFString **)v46;
    uint64_t v25 = &v45;
    goto LABEL_13;
  }
  int v13 = (unsigned __int16 *)buffer_ptr;
  if (*(_DWORD *)buffer_ptr != 67324752)
  {
    BOOL v23 = *(_DWORD *)buffer_ptr == 33639248;
    unint64_t v21 = (void *)MEMORY[0x263F087E8];
    v43 = @"TSUZipArchiveErrorDescription";
    v44 = @"Local file header has bad signature";
    int v22 = NSDictionary;
    uint64_t v24 = &v44;
    uint64_t v25 = &v43;
LABEL_13:
    uint64_t v26 = [v22 dictionaryWithObjects:v24 forKeys:v25 count:1];
    objc_msgSend(v21, "tsu_fileReadCorruptedFileErrorWithUserInfo:", v26);
    unint64_t v20 = (TSUZipEntry *)objc_claimAutoreleasedReturnValue();

    if ([(NSMutableOrderedSet *)self->_entries count])
    {
      (*((void (**)(id, void, void, BOOL))v11 + 2))(v11, 0, 0, v23);
      goto LABEL_21;
    }
    goto LABEL_18;
  }
  __int16 v14 = *((_WORD *)buffer_ptr + 3);
  if (v14)
  {
    uint64_t v27 = (void *)MEMORY[0x263F087E8];
    v41 = @"TSUZipArchiveErrorDescription";
    v42 = @"Encrypted files are not supported";
    uint64_t v28 = NSDictionary;
    id v29 = &v42;
    BOOL v30 = &v41;
  }
  else if ((v14 & 8) != 0)
  {
    uint64_t v27 = (void *)MEMORY[0x263F087E8];
    v39 = @"TSUZipArchiveErrorDescription";
    v40 = @"Local file header does not have the entry CRC and size";
    uint64_t v28 = NSDictionary;
    id v29 = &v40;
    BOOL v30 = &v39;
  }
  else
  {
    if (*((_WORD *)buffer_ptr + 4)) {
      BOOL v15 = *((unsigned __int16 *)buffer_ptr + 4) == (unsigned __int16)TSUZipDeflateCompressionMethod;
    }
    else {
      BOOL v15 = 1;
    }
    if (v15)
    {
      id v16 = objc_alloc_init(TSUZipEntry);
      [(TSUZipEntry *)v16 setCompressed:v13[4] == (unsigned __int16)TSUZipDeflateCompressionMethod];
      uint64_t v17 = objc_msgSend(objc_alloc(MEMORY[0x263EFF910]), "tsu_initWithDOSTime:", v13[6] | ((unint64_t)v13[5] << 16));
      [(TSUZipEntry *)v16 setLastModificationDate:v17];

      [(TSUZipEntry *)v16 setCRC:*(unsigned int *)(v13 + 7)];
      [(TSUZipEntry *)v16 setCompressedSize:*(unsigned int *)(v13 + 9)];
      [(TSUZipEntry *)v16 setSize:*(unsigned int *)(v13 + 11)];
      [(TSUZipEntry *)v16 setOffset:a4];
      [(TSUZipEntry *)v16 setNameLength:v13[13]];
      [(TSUZipEntry *)v16 setExtraFieldsLength:v13[14]];
      unint64_t v18 = v13[14] + (unint64_t)v13[13];
      [(TSUZipEntry *)v16 setFileHeaderLength:v18 + 30];
      int64_t v19 = a4 + 30;
      v32[0] = MEMORY[0x263EF8330];
      v32[1] = 3221225472;
      v32[2] = __69__TSUZipArchive_readLocalFileHeaderData_atOffset_channel_completion___block_invoke;
      v32[3] = &unk_264D61450;
      v32[4] = self;
      id v33 = v16;
      id v34 = v11;
      unint64_t v20 = v16;
      +[TSUIOUtils readAllFromChannel:v10 offset:v19 length:v18 completion:v32];

      goto LABEL_21;
    }
    uint64_t v27 = (void *)MEMORY[0x263F087E8];
    v37 = @"TSUZipArchiveErrorDescription";
    v38 = @"Unsupported compression method";
    uint64_t v28 = NSDictionary;
    id v29 = &v38;
    BOOL v30 = &v37;
  }
  id v31 = [v28 dictionaryWithObjects:v29 forKeys:v30 count:1];
  objc_msgSend(v27, "tsu_fileReadCorruptedFileErrorWithUserInfo:", v31);
  unint64_t v20 = (TSUZipEntry *)objc_claimAutoreleasedReturnValue();

LABEL_18:
  if (!v20)
  {
    objc_msgSend(MEMORY[0x263F087E8], "tsu_fileReadUnknownErrorWithUserInfo:", 0);
    unint64_t v20 = (TSUZipEntry *)objc_claimAutoreleasedReturnValue();
  }
  (*((void (**)(id, void, TSUZipEntry *, void))v11 + 2))(v11, 0, v20, 0);
LABEL_21:
}

void __69__TSUZipArchive_readLocalFileHeaderData_atOffset_channel_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6
    || (id v7 = *(void **)(a1 + 32),
        uint64_t v8 = *(void *)(a1 + 40),
        id v15 = 0,
        int v9 = [v7 readLocalFileHeaderFilenameAndExtraFieldsData:v5 forEntry:v8 error:&v15],
        id v6 = v15,
        !v9))
  {
    __int16 v14 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
  }
  else
  {
    uint64_t v10 = [*(id *)(a1 + 40) offset];
    uint64_t v11 = [*(id *)(a1 + 40) fileHeaderLength] + v10;
    uint64_t v12 = [*(id *)(a1 + 40) compressedSize];
    uint64_t v13 = *(void *)(a1 + 32);
    if (v11 + v12 > *(void *)(v13 + 32)) {
      *(void *)(v13 + 32) = v11 + v12;
    }
    __int16 v14 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
  }
  v14();
}

- (BOOL)readLocalFileHeaderFilenameAndExtraFieldsData:(id)a3 forEntry:(id)a4 error:(id *)a5
{
  v23[1] = *MEMORY[0x263EF8340];
  id v8 = a4;
  size_t size_ptr = 0;
  buffer_ptr = 0;
  dispatch_data_t v9 = dispatch_data_create_map((dispatch_data_t)a3, (const void **)&buffer_ptr, &size_ptr);
  size_t v10 = size_ptr;
  unsigned int v11 = [v8 nameLength];
  if (v10 >= [v8 extraFieldsLength] + (unint64_t)v11)
  {
    id v19 = 0;
    BOOL v16 = -[TSUZipArchive readFilenameFromBuffer:nameLength:entry:dataSize:error:](self, "readFilenameFromBuffer:nameLength:entry:dataSize:error:", &buffer_ptr, [v8 nameLength], v8, &size_ptr, &v19);
    id v13 = v19;
    if (!v16)
    {
      BOOL v15 = 0;
      if (!a5) {
        goto LABEL_11;
      }
      goto LABEL_9;
    }
    if (![v8 extraFieldsLength])
    {
      BOOL v15 = 1;
      goto LABEL_11;
    }
    id v18 = v13;
    BOOL v15 = -[TSUZipArchive readExtraFieldsFromBuffer:extraFieldsLength:entry:dataSize:error:](self, "readExtraFieldsFromBuffer:extraFieldsLength:entry:dataSize:error:", &buffer_ptr, [v8 extraFieldsLength], v8, &size_ptr, &v18);
    id v14 = v18;
  }
  else
  {
    uint64_t v12 = (void *)MEMORY[0x263F087E8];
    int v22 = @"TSUZipArchiveErrorDescription";
    v23[0] = @"Wrong data size for TSUZipLocalFileHeaderRecord filename and extra fields";
    id v13 = [NSDictionary dictionaryWithObjects:v23 forKeys:&v22 count:1];
    objc_msgSend(v12, "tsu_fileReadCorruptedFileErrorWithUserInfo:", v13);
    id v14 = (id)objc_claimAutoreleasedReturnValue();
    BOOL v15 = 0;
  }

  id v13 = v14;
  if (!a5) {
    goto LABEL_11;
  }
LABEL_9:
  if (!v15)
  {
    id v13 = v13;
    BOOL v15 = 0;
    *a5 = v13;
  }
LABEL_11:

  return v15;
}

- (void)addEntry:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v8 = v4;
    id v5 = [v4 name];
    id v6 = [(TSUZipArchive *)self normalizeEntryName:v5];

    id v7 = [(NSMutableDictionary *)self->_entriesMap objectForKeyedSubscript:v6];

    if (v7)
    {
      if (TSUDefaultCat_init_token != -1) {
        dispatch_once(&TSUDefaultCat_init_token, &__block_literal_global_102);
      }
    }
    else
    {
      [(NSMutableDictionary *)self->_entriesMap setObject:v8 forKeyedSubscript:v6];
      [(NSMutableOrderedSet *)self->_entries addObject:v8];
    }

    id v4 = v8;
  }
}

void __26__TSUZipArchive_addEntry___block_invoke()
{
  uint64_t v0 = TSULogCreateCategory("TSUDefaultCat");
  uint64_t v1 = (void *)TSUDefaultCat_log_t;
  TSUDefaultCat_log_t = v0;
}

- (id)readChannelForEntry:(id)a3
{
  return [(TSUZipArchive *)self readChannelForEntry:a3 validateCRC:1];
}

- (id)readChannelForEntry:(id)a3 validateCRC:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if ([(NSMutableOrderedSet *)self->_entries containsObject:v6])
  {
    unsigned int v7 = [v6 isCompressed] ^ 1;
    id v8 = [[TSUZipReadChannel alloc] initWithEntry:v6 archive:self validateCRC:v4 & v7];
    if ((v7 & 1) == 0)
    {
      dispatch_data_t v9 = [TSUBufferedReadChannel alloc];
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __49__TSUZipArchive_readChannelForEntry_validateCRC___block_invoke;
      v14[3] = &unk_264D614F0;
      id v15 = v6;
      BOOL v16 = v4;
      uint64_t v10 = [(TSUBufferedReadChannel *)v9 initWithReadChannel:v8 blockInfos:0 streamReadChannelBlock:v14];

      id v8 = (TSUZipReadChannel *)v10;
    }
  }
  else
  {
    unsigned int v11 = [NSString stringWithUTF8String:"-[TSUZipArchive readChannelForEntry:validateCRC:]"];
    uint64_t v12 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUZipArchive.m"];
    +[OITSUAssertionHandler handleFailureInFunction:v11 file:v12 lineNumber:741 isFatal:0 description:"Entry isn't part of this archive"];

    +[OITSUAssertionHandler logBacktraceThrottled];
    id v8 = 0;
  }

  return v8;
}

OITSUZipInflateReadChannel *__49__TSUZipArchive_readChannelForEntry_validateCRC___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = [OITSUZipInflateReadChannel alloc];
  [*(id *)(a1 + 32) size];
  id v5 = -[OITSUZipInflateReadChannel initWithReadChannel:uncompressedSize:CRC:validateCRC:](v4, "initWithReadChannel:uncompressedSize:CRC:validateCRC:", v3, [*(id *)(a1 + 32) size], objc_msgSend(*(id *)(a1 + 32), "CRC"), *(unsigned __int8 *)(a1 + 40));

  return v5;
}

- (id)streamReadChannelForEntry:(id)a3
{
  return [(TSUZipArchive *)self streamReadChannelForEntry:a3 validateCRC:1];
}

- (id)streamReadChannelForEntry:(id)a3 validateCRC:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if ([(NSMutableOrderedSet *)self->_entries containsObject:v6])
  {
    int v7 = [v6 isCompressed] ^ 1;
    id v8 = [[TSUZipReadChannel alloc] initWithEntry:v6 archive:self validateCRC:v4 & v7];
    if ((v7 & 1) == 0)
    {
      dispatch_data_t v9 = [OITSUZipInflateReadChannel alloc];
      [v6 size];
      uint64_t v10 = -[OITSUZipInflateReadChannel initWithReadChannel:uncompressedSize:CRC:validateCRC:](v9, "initWithReadChannel:uncompressedSize:CRC:validateCRC:", v8, [v6 size], objc_msgSend(v6, "CRC"), v4);

      id v8 = (TSUZipReadChannel *)v10;
    }
  }
  else
  {
    unsigned int v11 = [NSString stringWithUTF8String:"-[TSUZipArchive streamReadChannelForEntry:validateCRC:]"];
    uint64_t v12 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUZipArchive.m"];
    +[OITSUAssertionHandler handleFailureInFunction:v11 file:v12 lineNumber:764 isFatal:0 description:"Entry isn't part of this archive"];

    +[OITSUAssertionHandler logBacktraceThrottled];
    id v8 = 0;
  }

  return v8;
}

- (id)containedZipArchiveForEntry:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  return +[TSUContainedZipArchive zipArchiveFromEntry:a3 zipArchive:self options:a4 error:a5];
}

- (id)normalizeEntryName:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if ((self->_options & 2) != 0)
  {
    uint64_t v6 = [v4 lowercaseString];

    id v5 = (void *)v6;
  }
  int v7 = [v5 precomposedStringWithCanonicalMapping];

  return v7;
}

- (id)entryForName:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = [(TSUZipArchive *)self normalizeEntryName:v4];

    int v7 = [(NSMutableDictionary *)self->_entriesMap objectForKeyedSubscript:v6];
  }
  else
  {
    int v7 = 0;
  }
  return v7;
}

- (void)enumerateEntriesUsingBlock:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = (void (**)(id, void *, void *, unsigned char *))a3;
  char v17 = 0;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = self->_entries;
  uint64_t v6 = [(NSMutableOrderedSet *)v5 countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v14 != v8) {
        objc_enumerationMutation(v5);
      }
      uint64_t v10 = *(void **)(*((void *)&v13 + 1) + 8 * v9);
      unsigned int v11 = objc_msgSend(v10, "collapsedName", (void)v13);
      if (v11)
      {
        v4[2](v4, v11, v10, &v17);
      }
      else
      {
        uint64_t v12 = [v10 name];
        v4[2](v4, v12, v10, &v17);
      }
      if (v17) {
        break;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [(NSMutableOrderedSet *)v5 countByEnumeratingWithState:&v13 objects:v18 count:16];
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (void)collapseCommonRootDirectory
{
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  unint64_t v21 = __Block_byref_object_copy__8;
  int v22 = __Block_byref_object_dispose__8;
  id v23 = 0;
  id v3 = (void *)MEMORY[0x23EC9A170](self, a2);
  entriesMap = self->_entriesMap;
  unint64_t v5 = (self->_options >> 1) & 1 | 2;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  void v17[2] = __44__TSUZipArchive_collapseCommonRootDirectory__block_invoke;
  v17[3] = &unk_264D61518;
  v17[4] = &v18;
  v17[5] = v5;
  [(NSMutableDictionary *)entriesMap enumerateKeysAndObjectsUsingBlock:v17];
  if ([(id)v19[5] count])
  {
    uint64_t v6 = [NSString pathWithComponents:v19[5]];
  }
  else
  {
    uint64_t v6 = 0;
  }
  uint64_t v7 = [v6 length];
  if (v7)
  {
    uint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithCapacity:", -[NSMutableDictionary count](self->_entriesMap, "count"));
    uint64_t v9 = (void *)MEMORY[0x23EC9A170]();
    uint64_t v10 = self->_entriesMap;
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __44__TSUZipArchive_collapseCommonRootDirectory__block_invoke_2;
    v13[3] = &unk_264D61540;
    uint64_t v16 = v7;
    unsigned int v11 = v8;
    long long v14 = v11;
    long long v15 = self;
    [(NSMutableDictionary *)v10 enumerateKeysAndObjectsUsingBlock:v13];

    uint64_t v12 = self->_entriesMap;
    self->_entriesMap = v11;
  }
  _Block_object_dispose(&v18, 8);
}

void __44__TSUZipArchive_collapseCommonRootDirectory__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v21 = [a2 pathComponents];
  if ((unint64_t)[v21 count] < 2
    || ([v21 objectAtIndexedSubscript:0],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        char v7 = [v6 isEqualToString:@"__MACOSX"],
        v6,
        uint64_t v8 = v21,
        (v7 & 1) == 0))
  {
    uint64_t v9 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    if (v9)
    {
      unint64_t v10 = 0;
      if (![v9 count]) {
        goto LABEL_10;
      }
      do
      {
        if (v10 >= [v21 count]) {
          break;
        }
        unsigned int v11 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) objectAtIndexedSubscript:v10];
        uint64_t v12 = [v21 objectAtIndexedSubscript:v10];
        uint64_t v13 = [v11 compare:v12 options:*(void *)(a1 + 40)];

        if (v13) {
          break;
        }
        ++v10;
      }
      while (v10 < [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) count]);
      if (v10 == 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v14 = *(void *)(*(void *)(a1 + 32) + 8);
        long long v15 = *(void **)(v14 + 40);
        *(void *)(v14 + 40) = 0;

        *a4 = 1;
      }
      else
      {
LABEL_10:
        BOOL v16 = v10 >= [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) count];
        uint64_t v8 = v21;
        if (v16) {
          goto LABEL_14;
        }
        char v17 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
        objc_msgSend(v17, "removeObjectsInRange:", v10, objc_msgSend(v17, "count") - v10);
      }
    }
    else
    {
      uint64_t v18 = [objc_alloc(MEMORY[0x263EFF980]) initWithArray:v21];
      uint64_t v19 = *(void *)(*(void *)(a1 + 32) + 8);
      uint64_t v20 = *(void **)(v19 + 40);
      *(void *)(v19 + 40) = v18;

      [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) removeLastObject];
    }
    uint64_t v8 = v21;
  }
LABEL_14:
}

void __44__TSUZipArchive_collapseCommonRootDirectory__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  if ([v7 length] <= (unint64_t)(*(void *)(a1 + 48) + 1))
  {
    [*(id *)(*(void *)(a1 + 40) + 24) removeObject:v5];
  }
  else if (([v7 hasPrefix:@"__MACOSX"] & 1) == 0)
  {
    uint64_t v6 = [v7 substringFromIndex:*(void *)(a1 + 48) + 1];
    [v5 setCollapsedName:v6];
    [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:v6];
  }
}

- (unint64_t)archiveLength
{
  id v2 = [NSString stringWithUTF8String:"-[TSUZipArchive archiveLength]"];
  id v3 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUZipArchive.m"];
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  +[OITSUAssertionHandler handleFailureInFunction:v2, v3, 877, 0, "Abstract method not overridden by %@", v5 file lineNumber isFatal description];

  +[OITSUAssertionHandler logBacktraceThrottled];
  uint64_t v6 = (void *)MEMORY[0x263EFF940];
  uint64_t v7 = *MEMORY[0x263EFF498];
  uint64_t v8 = NSString;
  uint64_t v9 = (objc_class *)objc_opt_class();
  unint64_t v10 = NSStringFromClass(v9);
  unsigned int v11 = [v8 stringWithFormat:@"Abstract method not overridden by %@: %s", v10, "-[TSUZipArchive archiveLength]"];
  id v12 = [v6 exceptionWithName:v7 reason:v11 userInfo:0];

  objc_exception_throw(v12);
}

- (id)newArchiveReadChannel
{
  id v2 = [NSString stringWithUTF8String:"-[TSUZipArchive newArchiveReadChannel]"];
  id v3 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUZipArchive.m"];
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  +[OITSUAssertionHandler handleFailureInFunction:v2, v3, 881, 0, "Abstract method not overridden by %@", v5 file lineNumber isFatal description];

  +[OITSUAssertionHandler logBacktraceThrottled];
  uint64_t v6 = (void *)MEMORY[0x263EFF940];
  uint64_t v7 = *MEMORY[0x263EFF498];
  uint64_t v8 = NSString;
  uint64_t v9 = (objc_class *)objc_opt_class();
  unint64_t v10 = NSStringFromClass(v9);
  unsigned int v11 = [v8 stringWithFormat:@"Abstract method not overridden by %@: %s", v10, "-[TSUZipArchive newArchiveReadChannel]"];
  id v12 = [v6 exceptionWithName:v7 reason:v11 userInfo:0];

  objc_exception_throw(v12);
}

- (BOOL)isValid
{
  id v2 = [NSString stringWithUTF8String:"-[TSUZipArchive isValid]"];
  id v3 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUZipArchive.m"];
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  +[OITSUAssertionHandler handleFailureInFunction:v2, v3, 885, 0, "Abstract method not overridden by %@", v5 file lineNumber isFatal description];

  +[OITSUAssertionHandler logBacktraceThrottled];
  uint64_t v6 = (void *)MEMORY[0x263EFF940];
  uint64_t v7 = *MEMORY[0x263EFF498];
  uint64_t v8 = NSString;
  uint64_t v9 = (objc_class *)objc_opt_class();
  unint64_t v10 = NSStringFromClass(v9);
  unsigned int v11 = [v8 stringWithFormat:@"Abstract method not overridden by %@: %s", v10, "-[TSUZipArchive isValid]"];
  id v12 = [v6 exceptionWithName:v7 reason:v11 userInfo:0];

  objc_exception_throw(v12);
}

- (id)debugDescription
{
  id v3 = +[OITSUDescription descriptionWithObject:self class:objc_opt_class()];
  CFArrayRef v4 = [(NSMutableOrderedSet *)self->_entries array];
  id v5 = TSUCFArrayDescription(v4);
  [v3 addField:@"entries" value:v5];

  uint64_t v6 = [v3 descriptionString];

  return v6;
}

- (int64_t)endOfLastEntry
{
  return self->_endOfLastEntry;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entries, 0);
  objc_storeStrong((id *)&self->_entriesMap, 0);
}

@end