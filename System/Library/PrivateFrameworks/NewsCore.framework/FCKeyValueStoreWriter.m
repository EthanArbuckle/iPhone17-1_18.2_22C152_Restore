@interface FCKeyValueStoreWriter
- (BOOL)_moveTempFileToPath:(id)a3;
- (BOOL)writeKVS:(id)a3 codables:(id)a4 toFile:(id)a5 size:(unint64_t *)a6;
- (FCKeyValueStoreWriter)init;
- (NSOutputStream)tempFileOutputStream;
- (NSString)tempFilePath;
- (PBDataWriter)dataWriter;
- (unint64_t)_flushToDisk;
- (unint64_t)_flushToDiskIfNeeded;
@end

@implementation FCKeyValueStoreWriter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tempFileOutputStream, 0);
  objc_storeStrong((id *)&self->_tempFilePath, 0);
  objc_storeStrong((id *)&self->_dataWriter, 0);
}

void __29__FCKeyValueStoreWriter_init__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F94098]);
  v1 = (void *)_MergedGlobals_200;
  _MergedGlobals_200 = (uint64_t)v0;

  NSTemporaryDirectory();
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  v2 = NSString;
  v3 = [MEMORY[0x1E4F29128] UUID];
  v4 = [v3 UUIDString];
  v5 = [v2 stringWithFormat:@"kvs-%@.tmp", v4];
  uint64_t v6 = [v8 stringByAppendingPathComponent:v5];
  v7 = (void *)qword_1EB5D1978;
  qword_1EB5D1978 = v6;
}

- (unint64_t)_flushToDisk
{
  v3 = [(FCKeyValueStoreWriter *)self dataWriter];
  v4 = [v3 data];

  unint64_t v5 = [v4 length];
  uint64_t v6 = [(FCKeyValueStoreWriter *)self tempFileOutputStream];
  id v7 = v4;
  objc_msgSend(v6, "write:maxLength:", objc_msgSend(v7, "bytes"), v5);

  id v8 = [(FCKeyValueStoreWriter *)self dataWriter];
  v9 = [v8 data];
  [v9 setLength:0];

  return v5;
}

- (BOOL)writeKVS:(id)a3 codables:(id)a4 toFile:(id)a5 size:(unint64_t *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = FCPersistenceQueue();
  dispatch_assert_queue_V2(v13);

  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x2020000000;
  uint64_t v29 = 0;
  v14 = [(FCKeyValueStoreWriter *)self tempFileOutputStream];
  [v14 open];

  v15 = [(FCKeyValueStoreWriter *)self dataWriter];
  [v10 version];
  PBDataWriterWriteInt64Field();

  v16 = [(FCKeyValueStoreWriter *)self dataWriter];
  [v10 clientVersion];
  PBDataWriterWriteInt64Field();

  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __55__FCKeyValueStoreWriter_writeKVS_codables_toFile_size___block_invoke;
  v25[3] = &unk_1E5B59408;
  v25[4] = self;
  v25[5] = &v26;
  [v11 enumerateKeysAndObjectsUsingBlock:v25];
  v17 = [v10 plistSidecar];

  if (v17)
  {
    v18 = [(FCKeyValueStoreWriter *)self dataWriter];
    v19 = [v10 plistSidecar];
    PBDataWriterWriteDataField();
  }
  unint64_t v20 = [(FCKeyValueStoreWriter *)self _flushToDisk];
  v27[3] += v20;
  v21 = [(FCKeyValueStoreWriter *)self tempFileOutputStream];
  [v21 close];

  BOOL v22 = [(FCKeyValueStoreWriter *)self _moveTempFileToPath:v12];
  char v23 = !v22;
  if (!a6) {
    char v23 = 1;
  }
  if ((v23 & 1) == 0) {
    *a6 = v27[3];
  }
  _Block_object_dispose(&v26, 8);

  return v22;
}

- (PBDataWriter)dataWriter
{
  return self->_dataWriter;
}

- (NSOutputStream)tempFileOutputStream
{
  return self->_tempFileOutputStream;
}

- (BOOL)_moveTempFileToPath:(id)a3
{
  id v4 = a3;
  id v5 = [(FCKeyValueStoreWriter *)self tempFilePath];
  uint64_t v6 = (const std::__fs::filesystem::path *)[v5 fileSystemRepresentation];
  id v7 = v4;
  id v8 = (const std::__fs::filesystem::path *)[v7 fileSystemRepresentation];

  rename(v6, v8, v9);
  LODWORD(v7) = v10;

  return v7 == 0;
}

- (NSString)tempFilePath
{
  return self->_tempFilePath;
}

- (FCKeyValueStoreWriter)init
{
  v6.receiver = self;
  v6.super_class = (Class)FCKeyValueStoreWriter;
  v2 = [(FCKeyValueStoreWriter *)&v6 init];
  if (v2)
  {
    if (qword_1EB5D1980 != -1) {
      dispatch_once(&qword_1EB5D1980, &__block_literal_global_141);
    }
    objc_storeStrong((id *)&v2->_dataWriter, (id)_MergedGlobals_200);
    objc_storeStrong((id *)&v2->_tempFilePath, (id)qword_1EB5D1978);
    uint64_t v3 = [MEMORY[0x1E4F1CAA8] outputStreamToFileAtPath:qword_1EB5D1978 append:0];
    tempFileOutputStream = v2->_tempFileOutputStream;
    v2->_tempFileOutputStream = (NSOutputStream *)v3;
  }
  return v2;
}

void __55__FCKeyValueStoreWriter_writeKVS_codables_toFile_size___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (objc_opt_respondsToSelector())
  {
    id v7 = [*(id *)(a1 + 32) dataWriter];
    PBDataWriterPlaceMark();

    id v8 = [*(id *)(a1 + 32) dataWriter];
    PBDataWriterWriteStringField();

    v9 = [*(id *)(a1 + 32) dataWriter];
    [(id)objc_opt_class() keyValuePairType];
    PBDataWriterWriteInt32Field();

    int v10 = [*(id *)(a1 + 32) dataWriter];
    [v6 writeValueToDataWriter:v10];

    id v11 = [*(id *)(a1 + 32) dataWriter];
    PBDataWriterRecallMark();
  }
  else
  {
    id v12 = (void *)MEMORY[0x1A6260FD0]();
    id v13 = objc_alloc_init(MEMORY[0x1E4F82A88]);
    [v13 setKey:v5];
    [v6 writeToKeyValuePair:v13];
    v14 = [*(id *)(a1 + 32) dataWriter];
    PBDataWriterWriteSubmessage();
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) += [*(id *)(a1 + 32) _flushToDiskIfNeeded];
}

- (unint64_t)_flushToDiskIfNeeded
{
  uint64_t v3 = [(FCKeyValueStoreWriter *)self dataWriter];
  id v4 = [v3 data];
  unint64_t v5 = [v4 length];
  if (qword_1EB5D1990 != -1) {
    dispatch_once(&qword_1EB5D1990, &__block_literal_global_38_1);
  }
  unint64_t v6 = qword_1EB5D1988;

  if (v5 < v6) {
    return 0;
  }
  return [(FCKeyValueStoreWriter *)self _flushToDisk];
}

@end