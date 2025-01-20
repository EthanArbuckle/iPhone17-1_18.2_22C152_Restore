@interface FCANEFFileDataProvider
- (BOOL)isRawFileConsumable;
- (FCANEFFileDataProvider)initWithFilePath:(id)a3 wrappingKey:(id)a4 options:(int64_t)a5 holdToken:(id)a6;
- (FCInterestToken)holdToken;
- (NSData)data;
- (NSData)wrappingKey;
- (NSString)filePath;
- (int64_t)options;
@end

@implementation FCANEFFileDataProvider

- (FCANEFFileDataProvider)initWithFilePath:(id)a3 wrappingKey:(id)a4 options:(int64_t)a5 holdToken:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v19.receiver = self;
  v19.super_class = (Class)FCANEFFileDataProvider;
  v13 = [(FCANEFFileDataProvider *)&v19 init];
  if (v13)
  {
    uint64_t v14 = [v10 copy];
    filePath = v13->_filePath;
    v13->_filePath = (NSString *)v14;

    uint64_t v16 = [v11 copy];
    wrappingKey = v13->_wrappingKey;
    v13->_wrappingKey = (NSData *)v16;

    v13->_options = a5;
    objc_storeStrong((id *)&v13->_holdToken, a6);
  }

  return v13;
}

- (NSData)data
{
  v3 = (void *)MEMORY[0x1A6260FD0](self, a2);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __30__FCANEFFileDataProvider_data__block_invoke;
  aBlock[3] = &unk_1E5B582A0;
  aBlock[4] = self;
  v4 = _Block_copy(aBlock);
  v5 = [MEMORY[0x1E4F28CB0] fileHandleForReadingAtPath:self->_filePath];
  v6 = v5;
  if (v5)
  {
    v7 = v5;
    v8 = -[FCANEFHeader initWithFileHandle:]([FCANEFHeader alloc], v7);
    v9 = v8;
    if (v8)
    {
      id v10 = v8;
      v22 = v3;
      objc_msgSend(v7, "seekToFileOffset:", objc_msgSend(v10[4], "length"));
      v23 = [v7 readDataToEndOfFile];
      id v11 = v10[2];
      id v12 = [(FCANEFFileDataProvider *)self wrappingKey];
      v13 = objc_msgSend(v11, "fc_anefDecryptWithKey:", v12);

      if (v13)
      {
        uint64_t v14 = v13;
        v15 = objc_msgSend(v23, "fc_anefDecryptWithKey:", v14);
        uint64_t v16 = v15;
        if (v15)
        {
          v17 = v15;
          if (([(FCANEFFileDataProvider *)self options] & 1) == 0
            || (id v18 = v10[3], IsGZip = FCMIMETypeIsGZip(v18), v18, !IsGZip)
            || (objc_msgSend(v17, "fc_gzipInflate"), (objc_super v19 = (void (**)(void))objc_claimAutoreleasedReturnValue()) == 0))
          {
            objc_super v19 = v17;
          }
        }
        else
        {
          v24 = v4;
          v24[2]();
          objc_super v19 = (void (**)(void))objc_claimAutoreleasedReturnValue();
          v17 = v24;
        }
      }
      else
      {
        v25 = v4;
        v25[2]();
        objc_super v19 = (void (**)(void))objc_claimAutoreleasedReturnValue();
        uint64_t v14 = v25;
      }

      v3 = v22;
    }
    else
    {
      v26 = v4;
      v26[2]();
      objc_super v19 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      id v10 = (id *)v26;
    }
  }
  else
  {
    v27 = v4;
    v27[2]();
    objc_super v19 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v7 = v27;
  }

  return (NSData *)v19;
}

uint64_t __30__FCANEFFileDataProvider_data__block_invoke(uint64_t a1)
{
  return [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:*(void *)(*(void *)(a1 + 32) + 8)];
}

uint64_t __30__FCANEFFileDataProvider_data__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __30__FCANEFFileDataProvider_data__block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __30__FCANEFFileDataProvider_data__block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __30__FCANEFFileDataProvider_data__block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (NSString)filePath
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v5 = (void *)[[NSString alloc] initWithFormat:@"the file path for an encrypted asset should not be accessed directly"];
    int v6 = 136315906;
    v7 = "-[FCANEFFileDataProvider filePath]";
    __int16 v8 = 2080;
    v9 = "FCANEFFileDataProvider.m";
    __int16 v10 = 1024;
    int v11 = 100;
    __int16 v12 = 2114;
    v13 = v5;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v6, 0x26u);
  }
  filePath = self->_filePath;
  return filePath;
}

- (BOOL)isRawFileConsumable
{
  return 0;
}

- (NSData)wrappingKey
{
  return self->_wrappingKey;
}

- (int64_t)options
{
  return self->_options;
}

- (FCInterestToken)holdToken
{
  return self->_holdToken;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_holdToken, 0);
  objc_storeStrong((id *)&self->_wrappingKey, 0);
  objc_storeStrong((id *)&self->_filePath, 0);
}

@end