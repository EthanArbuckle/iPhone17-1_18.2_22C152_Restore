@interface HCIndexTable
+ (id)indexTableFromFile:(id)a3;
- (BOOL)isValid;
- (BOOL)writeToFile:(id)a3;
- (HCIndexTable)init;
- (HCIndexTable)initWithHuffmanCodesMemoryMappedData:(id)a3;
- (NSData)huffmanCodesMemoryMappedData;
- (NSUUID)versionUUID;
- (const)fileHeader;
- (const)huffmanCodes;
- (id).cxx_construct;
- (id)codeAtIndex:(unint64_t)a3;
- (unint64_t)count;
@end

@implementation HCIndexTable

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  *((void *)self + 3) = 0;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_versionUUID, 0);
  objc_storeStrong((id *)&self->_huffmanCodesMemoryMappedData, 0);
  begin = self->_mutableHuffmanCodes.__begin_;
  if (begin)
  {
    self->_mutableHuffmanCodes.__end_ = begin;
    operator delete(begin);
  }
}

- (NSData)huffmanCodesMemoryMappedData
{
  return self->_huffmanCodesMemoryMappedData;
}

- (const)huffmanCodes
{
  return (const unint64_t *)([(NSData *)self->_huffmanCodesMemoryMappedData bytes] + 24);
}

- (NSUUID)versionUUID
{
  v2 = [(HCIndexTable *)self fileHeader] + 6;
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:v2];

  return (NSUUID *)v3;
}

- (const)fileHeader
{
  [(NSData *)self->_huffmanCodesMemoryMappedData length];
  huffmanCodesMemoryMappedData = self->_huffmanCodesMemoryMappedData;

  return (const HCIndexTableFileHeader *)[(NSData *)huffmanCodesMemoryMappedData bytes];
}

- (BOOL)writeToFile:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  v6 = [v4 path];
  [v5 createFileAtPath:v6 contents:0 attributes:0];

  v7 = (void *)MEMORY[0x1E4F28CB0];
  v8 = [v4 path];
  v9 = [v7 fileHandleForWritingAtPath:v8];

  if (v9)
  {
    v10 = [(HCIndexTable *)self fileHeader];
    v11 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:v10 length:24 freeWhenDone:0];
    id v21 = 0;
    [v9 writeData:v11 error:&v21];
    id v12 = v21;
    if (v12 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v17 = [v12 localizedDescription];
      *(_DWORD *)buf = 136315394;
      v23 = "-[HCIndexTable writeToFile:]";
      __int16 v24 = 2112;
      v25 = v17;
      _os_log_error_impl(&dword_1E3F0E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%s  %@", buf, 0x16u);
    }
    v13 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:self->_mutableHuffmanCodes.__begin_ length:(char *)self->_mutableHuffmanCodes.__end_ - (char *)self->_mutableHuffmanCodes.__begin_ freeWhenDone:0];
    id v20 = 0;
    [v9 writeData:v13 error:&v20];
    id v14 = v20;

    BOOL v15 = v14 == 0;
    if (v14 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v18 = [v14 localizedDescription];
      *(_DWORD *)buf = 136315394;
      v23 = "-[HCIndexTable writeToFile:]";
      __int16 v24 = 2112;
      v25 = v18;
      _os_log_error_impl(&dword_1E3F0E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%s  %@", buf, 0x16u);
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v19 = [v4 path];
      *(_DWORD *)buf = 136315394;
      v23 = "-[HCIndexTable writeToFile:]";
      __int16 v24 = 2112;
      v25 = v19;
      _os_log_error_impl(&dword_1E3F0E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%s  Couldn't open file '%@' for writing.", buf, 0x16u);
    }
    BOOL v15 = 0;
  }

  return v15;
}

- (id)codeAtIndex:(unint64_t)a3
{
  if ([(HCIndexTable *)self count] - 1 >= a3)
  {
    v6 = [(HCIndexTable *)self huffmanCodes];
    v5 = [NSNumber numberWithLongLong:v6[a3]];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (unint64_t)count
{
  v2 = [(HCIndexTable *)self huffmanCodesMemoryMappedData];
  unint64_t v3 = (unint64_t)[v2 length] >> 3;

  return v3;
}

- (BOOL)isValid
{
  {
    v6 = self;
    self = v6;
    if (v5)
    {
      -[HCIndexTable isValid]::staticHeader = kHCIndexTableFileHeaderSignature;
      -[HCIndexTable isValid]::staticHeader = kHCIndexTableFileHeaderSupportedSchemaVersion;
      self = v6;
    }
  }
  v2 = [(HCIndexTable *)self fileHeader];
  return v2->var1 == -[HCIndexTable isValid]::staticHeader && v2->var0 == -[HCIndexTable isValid]::staticHeader;
}

- (HCIndexTable)initWithHuffmanCodesMemoryMappedData:(id)a3
{
  id v4 = a3;
  int v5 = [(HCIndexTable *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    huffmanCodesMemoryMappedData = v5->_huffmanCodesMemoryMappedData;
    v5->_huffmanCodesMemoryMappedData = (NSData *)v6;
  }
  if ([(HCIndexTable *)v5 isValid]) {
    v8 = v5;
  }
  else {
    v8 = 0;
  }
  v9 = v8;

  return v9;
}

- (HCIndexTable)init
{
  v7.receiver = self;
  v7.super_class = (Class)HCIndexTable;
  v2 = [(HCIndexTable *)&v7 init];
  unint64_t v3 = v2;
  if (v2)
  {
    p_mutableHuffmanCodes = &v2->_mutableHuffmanCodes;
    begin = v2->_mutableHuffmanCodes.__begin_;
    if (begin)
    {
      v3->_mutableHuffmanCodes.__end_ = begin;
      operator delete(begin);
    }
    p_mutableHuffmanCodes->__begin_ = 0;
    v3->_mutableHuffmanCodes.__end_ = 0;
    v3->_mutableHuffmanCodes.__end_cap_.__value_ = 0;
  }
  return v3;
}

+ (id)indexTableFromFile:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = (void *)MEMORY[0x1E4F1C9B8];
  id v4 = [a3 path];
  id v10 = 0;
  int v5 = [v3 dataWithContentsOfFile:v4 options:8 error:&v10];
  id v6 = v10;

  if (v6)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v9 = [v6 localizedDescription];
      *(_DWORD *)buf = 136315394;
      id v12 = "+[HCIndexTable indexTableFromFile:]";
      __int16 v13 = 2112;
      id v14 = v9;
      _os_log_error_impl(&dword_1E3F0E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%s  Error while loading index map from file: '%@'", buf, 0x16u);
    }
    objc_super v7 = 0;
  }
  else
  {
    objc_super v7 = [[HCIndexTable alloc] initWithHuffmanCodesMemoryMappedData:v5];
  }

  return v7;
}

@end