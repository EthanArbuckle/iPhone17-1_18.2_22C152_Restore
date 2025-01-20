@interface FTABFileOS
- (BOOL)addSubfileWithTagName:(id)a3 contentsOfURL:(id)a4;
- (BOOL)addSubfileWithTagName:(id)a3 subfileData:(id)a4;
- (BOOL)configureFileHandleWriteDestinationForURL:(id)a3;
- (BOOL)fileValidForOffset:(unsigned int)a3 length:(unsigned int)a4;
- (BOOL)initFile;
- (BOOL)parseFileData;
- (BOOL)writeBytes:(const void *)a3 length:(unint64_t)a4;
- (BOOL)writeBytes:(const void *)a3 length:(unint64_t)a4 handle:(id)a5;
- (BOOL)writeSubfileToURL:(id)a3 tag:(id)a4;
- (BOOL)writeToDestination;
- (BOOL)writeToURL:(id)a3;
- (FTABFileOS)init;
- (FTABFileOS)initWithContentsOfURL:(id)a3;
- (FTABFileOS)initWithData:(id)a3;
- (FTABSubfileOS)manifest;
- (NSArray)subfiles;
- (NSData)bootNonce;
- (NSData)magic;
- (NSURL)url;
- (const)filePointer;
- (id)copyWithZone:(_NSZone *)a3;
- (id)createFileHandleForWritingToURL:(id)a3;
- (id)description;
- (id)subfileWithTag:(id)a3;
- (id)writeToData;
- (unint64_t)fileLength;
- (unsigned)generation;
- (unsigned)valid;
- (void)addSubfiles:(id)a3;
- (void)configureDataWriteDestination;
- (void)parseFileData;
- (void)removeSubfileWithTag:(id)a3;
- (void)setBootNonce:(id)a3;
- (void)setManifest:(id)a3;
- (void)writeToDestination;
@end

@implementation FTABFileOS

- (FTABFileOS)initWithContentsOfURL:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)FTABFileOS;
  v6 = [(FTABFileOS *)&v14 init];
  if (!v6) {
    goto LABEL_5;
  }
  id v13 = 0;
  v7 = (NSData *)(id)[MEMORY[0x263EFF8F8] dataWithContentsOfURL:v5 options:1 error:&v13];
  id v8 = v13;
  fileData = v6->_fileData;
  v6->_fileData = v7;

  if (!v6->_fileData)
  {
    v11 = os_log_create("com.apple.accessoryupdater.ftab", "parsing");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[FTABFileOS initWithContentsOfURL:]();
    }

    goto LABEL_9;
  }
  if (![(FTABFileOS *)v6 initFile])
  {
LABEL_9:

    v10 = 0;
    goto LABEL_10;
  }
  objc_storeStrong((id *)&v6->_url, a3);

LABEL_5:
  v10 = v6;
LABEL_10:

  return v10;
}

- (FTABFileOS)initWithData:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)FTABFileOS;
  id v5 = [(FTABFileOS *)&v10 init];
  if (v5
    && (uint64_t v6 = [v4 copy],
        fileData = v5->_fileData,
        v5->_fileData = (NSData *)v6,
        fileData,
        ![(FTABFileOS *)v5 initFile]))
  {
    id v8 = 0;
  }
  else
  {
    id v8 = v5;
  }

  return v8;
}

- (BOOL)initFile
{
  self->_filePointer = (const char *)[(NSData *)self->_fileData bytes];
  self->_fileLength = [(NSData *)self->_fileData length];
  v3 = (NSMutableArray *)(id)[MEMORY[0x263EFF980] array];
  subFileArray = self->_subFileArray;
  self->_subFileArray = v3;

  return [(FTABFileOS *)self parseFileData];
}

- (FTABFileOS)init
{
  v11.receiver = self;
  v11.super_class = (Class)FTABFileOS;
  v2 = [(FTABFileOS *)&v11 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    fileData = v2->_fileData;
    v2->_fileData = (NSData *)v3;

    manifest = v2->_manifest;
    v2->_manifest = 0;

    v2->_filePointer = (const char *)[(NSData *)v2->_fileData bytes];
    v2->_fileLength = [(NSData *)v2->_fileData length];
    uint64_t v6 = (NSMutableArray *)(id)[MEMORY[0x263EFF980] array];
    subFileArray = v2->_subFileArray;
    v2->_subFileArray = v6;

    id v8 = (NSData *)(id)[MEMORY[0x263EFF8F8] dataWithBytes:&kFTABMagicLowercase length:8];
    magic = v2->_magic;
    v2->_magic = v8;
  }
  return v2;
}

- (BOOL)parseFileData
{
  if (self->_fileLength > 0x2F)
  {
    filePointer = self->_filePointer;
    v12 = filePointer + 32;
    if (*((void *)filePointer + 4) == 0x42415446534F4B52 || *v12 == 0x62617466736F6B72)
    {
      id v13 = (NSData *)(id)[MEMORY[0x263EFF8F8] dataWithBytes:v12 length:8];
      magic = self->_magic;
      self->_magic = v13;

      self->_generation = *(_DWORD *)filePointer;
      self->_valid = *((_DWORD *)filePointer + 1);
      v15 = (NSData *)(id)[MEMORY[0x263EFF8F8] dataWithBytes:filePointer + 8 length:8];
      bootNonce = self->_bootNonce;
      self->_bootNonce = v15;

      uint64_t v17 = *((unsigned int *)filePointer + 5);
      if (v17)
      {
        uint64_t v18 = *((unsigned int *)filePointer + 4);
        if (![(FTABFileOS *)self fileValidForOffset:v18 length:*((unsigned int *)filePointer + 5)])
        {
          v2 = os_log_create("com.apple.accessoryupdater.ftab", "parsing");
          if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
            [(FTABFileOS *)v2 parseFileData];
          }
          goto LABEL_26;
        }
        v19 = [[FTABSubfileOS alloc] initWithTag:@"Manifest" dataPointer:&self->_filePointer[v18] dataLength:v17];
        manifest = self->_manifest;
        self->_manifest = v19;
      }
      int v21 = *((_DWORD *)filePointer + 10);
      if (!v21) {
        return 1;
      }
      for (uint64_t i = 0;
            [(FTABFileOS *)self fileValidForOffset:(i + 48) length:16];
            i += 16)
      {
        uint64_t v24 = *(unsigned int *)&filePointer[i + 52];
        uint64_t v23 = *(unsigned int *)&filePointer[i + 56];
        if (![(FTABFileOS *)self fileValidForOffset:v24 length:v23])
        {
          v2 = os_log_create("com.apple.accessoryupdater.ftab", "parsing");
          if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
            -[FTABFileOS parseFileData]();
          }
          goto LABEL_26;
        }
        uint64_t v25 = [[NSString alloc] initWithBytes:&filePointer[i + 48] length:4 encoding:4];
        if (!v25)
        {
          v2 = os_log_create("com.apple.accessoryupdater.ftab", "parsing");
          if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
            [(FTABFileOS *)(unsigned __int8 *)&filePointer[i + 48] parseFileData];
          }
          goto LABEL_26;
        }
        v26 = (void *)v25;
        v27 = [[FTABSubfileOS alloc] initWithTag:v25 dataPointer:&self->_filePointer[v24] dataLength:v23];
        [(NSMutableArray *)self->_subFileArray addObject:v27];
        --v21;

        if (!v21) {
          return 1;
        }
      }
      v2 = os_log_create("com.apple.accessoryupdater.ftab", "parsing");
      if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
        -[FTABFileOS parseFileData].cold.4();
      }
    }
    else
    {
      v2 = os_log_create("com.apple.accessoryupdater.ftab", "parsing");
      if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
        -[FTABFileOS parseFileData].cold.6();
      }
    }
  }
  else
  {
    v2 = os_log_create("com.apple.accessoryupdater.ftab", "parsing");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      [(FTABFileOS *)v2 parseFileData];
    }
  }
LABEL_26:

  return 0;
}

- (BOOL)fileValidForOffset:(unsigned int)a3 length:(unsigned int)a4
{
  return self->_fileLength >= a4 + a3;
}

- (id)subfileWithTag:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = self->_subFileArray;
  id v6 = (id)[(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v10 = (id)[v9 tag:v13];
        char v11 = [v10 isEqual:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)removeSubfileWithTag:(id)a3
{
  id v4 = [(FTABFileOS *)self subfileWithTag:a3];
  if (v4) {
    [(NSMutableArray *)self->_subFileArray removeObject:v4];
  }
}

- (NSArray)subfiles
{
  return (NSArray *)[MEMORY[0x263EFF8C0] arrayWithArray:self->_subFileArray];
}

- (id)description
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = (id)[MEMORY[0x263F089D8] string];
  id v4 = v3;
  if (self->_url) {
    [v3 appendFormat:@"FTAB %@:\n", self->_url];
  }
  else {
    [v3 appendFormat:@"FTAB:\n%@", v15];
  }
  [v4 appendFormat:@"\tGeneration: 0x%08x\n", self->_generation];
  [v4 appendFormat:@"\tValid: %u\n", self->_valid];
  uint64_t v5 = [(NSData *)self->_bootNonce byteString];
  [v4 appendFormat:@"\tBoot Nonce: %@\n", v5];

  if (self->_manifest) {
    [v4 appendFormat:@"\tManifest: %@\n", self->_manifest];
  }
  if ([(NSMutableArray *)self->_subFileArray count])
  {
    [v4 appendFormat:@"\tSubfiles:\n"];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v6 = self->_subFileArray;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = 0;
      uint64_t v10 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v6);
          }
          uint64_t v12 = *(void *)(*((void *)&v16 + 1) + 8 * i);
          if (-v9 != i) {
            [v4 appendString:@"\n"];
          }
          [v4 appendFormat:@"\t\t%@", v12];
        }
        v9 += v8;
        uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v8);
    }
  }
  id v13 = (id)[NSString stringWithString:v4];

  return v13;
}

- (BOOL)addSubfileWithTagName:(id)a3 contentsOfURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v13 = 0;
  id v8 = (id)[MEMORY[0x263EFF8F8] dataWithContentsOfURL:v7 options:1 error:&v13];
  id v9 = v13;
  if (v8)
  {
    BOOL v10 = [(FTABFileOS *)self addSubfileWithTagName:v6 subfileData:v8];
  }
  else
  {
    char v11 = os_log_create("com.apple.accessoryupdater.ftab", "parsing");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[FTABFileOS addSubfileWithTagName:contentsOfURL:]();
    }

    BOOL v10 = 0;
  }

  return v10;
}

- (BOOL)addSubfileWithTagName:(id)a3 subfileData:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(FTABFileOS *)self removeSubfileWithTag:v7];
  id v8 = [FTABSubfileOS alloc];
  id v9 = v6;
  uint64_t v10 = [v9 bytes];
  uint64_t v11 = [v9 length];

  uint64_t v12 = [(FTABSubfileOS *)v8 initWithTag:v7 dataPointer:v10 dataLength:v11];
  [(NSMutableArray *)self->_subFileArray addObject:v12];

  return 1;
}

- (void)addSubfiles:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = (id)[*(id *)(*((void *)&v10 + 1) + 8 * v8) tag];
        [(FTABFileOS *)self removeSubfileWithTag:v9];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
  [(NSMutableArray *)self->_subFileArray addObjectsFromArray:v4];
}

- (void)setManifest:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [[FTABSubfileOS alloc] initWithTag:@"Manifest" data:v4];

  manifest = self->_manifest;
  self->_manifest = v5;
}

- (void)setBootNonce:(id)a3
{
  id v4 = a3;
  if ([v4 length] == 8)
  {
    uint64_t v5 = (NSData *)[v4 copy];
    bootNonce = self->_bootNonce;
    self->_bootNonce = v5;
  }
}

- (id)createFileHandleForWritingToURL:(id)a3
{
  id v3 = a3;
  id v4 = (id)[MEMORY[0x263F08850] defaultManager];
  id v5 = (id)[v3 path];
  int v6 = [v4 fileExistsAtPath:v5];

  if (v6)
  {
    id v7 = (id)[v3 path];
    id v18 = 0;
    char v8 = [v4 removeItemAtPath:v7 error:&v18];
    os_log_t v9 = (os_log_t)v18;

    if ((v8 & 1) == 0)
    {
      uint64_t v15 = os_log_create("com.apple.accessoryupdater.ftab", "writing");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        -[FTABFileOS createFileHandleForWritingToURL:](v3);
      }

      goto LABEL_14;
    }
  }
  id v10 = (id)[MEMORY[0x263F08850] defaultManager];
  id v11 = (id)[v3 path];
  char v12 = [v10 createFileAtPath:v11 contents:0 attributes:0];

  if ((v12 & 1) == 0)
  {
    os_log_t v9 = os_log_create("com.apple.accessoryupdater.ftab", "writing");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[FTABFileOS createFileHandleForWritingToURL:](v3);
    }
LABEL_14:
    id v13 = 0;
    goto LABEL_15;
  }
  id v17 = 0;
  id v13 = (id)[MEMORY[0x263F08840] fileHandleForWritingToURL:v3 error:&v17];
  os_log_t v9 = (os_log_t)v17;
  if (!v13)
  {
    long long v14 = os_log_create("com.apple.accessoryupdater.ftab", "writing");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[FTABFileOS createFileHandleForWritingToURL:]();
    }
  }
LABEL_15:

  return v13;
}

- (BOOL)configureFileHandleWriteDestinationForURL:(id)a3
{
  dataWriteDestination = self->_dataWriteDestination;
  self->_dataWriteDestination = 0;
  id v5 = a3;

  int v6 = (NSFileHandle *)[(FTABFileOS *)self createFileHandleForWritingToURL:v5];
  fileHandleWriteDestination = self->_fileHandleWriteDestination;
  self->_fileHandleWriteDestination = v6;

  return self->_fileHandleWriteDestination != 0;
}

- (void)configureDataWriteDestination
{
  fileHandleWriteDestination = self->_fileHandleWriteDestination;
  self->_fileHandleWriteDestination = 0;

  id v4 = (NSMutableData *)(id)[MEMORY[0x263EFF990] data];
  dataWriteDestination = self->_dataWriteDestination;
  self->_dataWriteDestination = v4;
}

- (BOOL)writeBytes:(const void *)a3 length:(unint64_t)a4
{
  fileHandleWriteDestination = self->_fileHandleWriteDestination;
  if (fileHandleWriteDestination)
  {
    LOBYTE(dataWriteDestination) = [(NSFileHandle *)fileHandleWriteDestination writeBytes:a3 length:a4];
  }
  else
  {
    dataWriteDestination = self->_dataWriteDestination;
    if (dataWriteDestination)
    {
      [(NSMutableData *)dataWriteDestination appendBytes:a3 length:a4];
      LOBYTE(dataWriteDestination) = 1;
    }
  }
  return (char)dataWriteDestination;
}

- (BOOL)writeToDestination
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  uint64_t v39 = 0;
  uint64_t v40 = 0;
  uint64_t v41 = 0;
  v36[0] = *(void *)&self->_generation;
  v36[1] = *(void *)[(NSData *)self->_bootNonce bytes];
  int v3 = 16 * [(NSMutableArray *)self->_subFileArray count];
  manifest = self->_manifest;
  if (manifest)
  {
    int v5 = v3 + 48;
    unsigned int v6 = [(FTABSubfileOS *)manifest dataLength];
  }
  else
  {
    unsigned int v6 = 0;
    int v5 = 0;
  }
  int v37 = v5;
  unsigned int v38 = v6;
  uint64_t v40 = *(void *)[(NSData *)self->_magic bytes];
  LODWORD(v41) = [(NSMutableArray *)self->_subFileArray count];
  if (![(FTABFileOS *)self writeBytes:v36 length:48])
  {
    id v7 = (NSMutableArray *)os_log_create("com.apple.accessoryupdater.ftab", "writing");
    if (os_log_type_enabled(&v7->super.super, OS_LOG_TYPE_ERROR)) {
      -[FTABFileOS writeToDestination].cold.4(&v7->super.super);
    }
    goto LABEL_31;
  }
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v7 = self->_subFileArray;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    int v10 = v3 + v6 + 48;
    uint64_t v11 = *(void *)v31;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v31 != v11) {
          objc_enumerationMutation(v7);
        }
        id v13 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        uint64_t v28 = 0;
        uint64_t v29 = 0;
        id v14 = (id) [v13 tag];
        LODWORD(v28) = *(_DWORD *)[v14 UTF8String];

        HIDWORD(v28) = v10;
        LODWORD(v29) = [v13 dataLength];
        if (![(FTABFileOS *)self writeBytes:&v28 length:16])
        {
          v22 = os_log_create("com.apple.accessoryupdater.ftab", "writing");
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
            -[FTABFileOS writeToDestination](v13);
          }
LABEL_30:

          goto LABEL_31;
        }
        v10 += [v13 dataLength];
      }
      uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v30 objects:v35 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  uint64_t v15 = self->_manifest;
  if (v15
    && ![(FTABFileOS *)self writeBytes:[(FTABSubfileOS *)v15 dataPointer] length:[(FTABSubfileOS *)self->_manifest dataLength]])
  {
    id v7 = (NSMutableArray *)os_log_create("com.apple.accessoryupdater.ftab", "writing");
    if (os_log_type_enabled(&v7->super.super, OS_LOG_TYPE_ERROR)) {
      -[FTABFileOS writeToDestination](&v7->super.super);
    }
LABEL_31:
    BOOL v21 = 0;
    goto LABEL_32;
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v7 = self->_subFileArray;
  uint64_t v16 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v24 objects:v34 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v25;
    while (2)
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v25 != v18) {
          objc_enumerationMutation(v7);
        }
        v20 = *(void **)(*((void *)&v24 + 1) + 8 * j);
        if (!-[FTABFileOS writeBytes:length:](self, "writeBytes:length:", objc_msgSend(v20, "dataPointer", (void)v24), objc_msgSend(v20, "dataLength")))
        {
          v22 = os_log_create("com.apple.accessoryupdater.ftab", "writing");
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
            -[FTABFileOS writeToDestination](v20);
          }
          goto LABEL_30;
        }
      }
      uint64_t v17 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v24 objects:v34 count:16];
      BOOL v21 = 1;
      if (v17) {
        continue;
      }
      break;
    }
  }
  else
  {
    BOOL v21 = 1;
  }
LABEL_32:

  return v21;
}

- (BOOL)writeToURL:(id)a3
{
  id v4 = a3;
  if ([(FTABFileOS *)self configureFileHandleWriteDestinationForURL:v4])
  {
    BOOL v5 = [(FTABFileOS *)self writeToDestination];
    fileHandleWriteDestination = self->_fileHandleWriteDestination;
    self->_fileHandleWriteDestination = 0;
  }
  else
  {
    id v7 = os_log_create("com.apple.accessoryupdater.ftab", "writing");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[FTABFileOS writeToURL:](v4);
    }

    BOOL v5 = 0;
  }

  return v5;
}

- (id)writeToData
{
  [(FTABFileOS *)self configureDataWriteDestination];
  [(FTABFileOS *)self writeToDestination];
  id v3 = (id)[MEMORY[0x263EFF8F8] dataWithData:self->_dataWriteDestination];
  dataWriteDestination = self->_dataWriteDestination;
  self->_dataWriteDestination = 0;

  return v3;
}

- (BOOL)writeSubfileToURL:(id)a3 tag:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(FTABFileOS *)self subfileWithTag:v7];
  if (v8)
  {
    id v9 = [(FTABFileOS *)self createFileHandleForWritingToURL:v6];
    if (v9) {
      char v10 = [v9 writeBytes:objc_msgSend(v8, "dataPointer") length:objc_msgSend(v8, "dataLength")];
    }
    else {
      char v10 = 0;
    }
  }
  else
  {
    uint64_t v11 = os_log_create("com.apple.accessoryupdater.ftab", "writing");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[FTABFileOS writeSubfileToURL:tag:]();
    }

    char v10 = 0;
  }

  return v10;
}

- (BOOL)writeBytes:(const void *)a3 length:(unint64_t)a4 handle:(id)a5
{
  id v7 = (void *)MEMORY[0x263EFF8F8];
  id v8 = a5;
  id v9 = (id)[v7 dataWithBytes:a3 length:a4];
  LOBYTE(a3) = [v8 uarpWriteData:v9 error:0];

  return (char)a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v3 = [(FTABFileOS *)self writeToData];
  id v4 = [[FTABFileOS alloc] initWithData:v3];

  return v4;
}

- (const)filePointer
{
  return self->_filePointer;
}

- (unint64_t)fileLength
{
  return self->_fileLength;
}

- (NSURL)url
{
  return (NSURL *)objc_getProperty(self, a2, 64, 1);
}

- (unsigned)generation
{
  return self->_generation;
}

- (unsigned)valid
{
  return self->_valid;
}

- (NSData)bootNonce
{
  return (NSData *)objc_getProperty(self, a2, 72, 1);
}

- (NSData)magic
{
  return (NSData *)objc_getProperty(self, a2, 80, 1);
}

- (FTABSubfileOS)manifest
{
  return (FTABSubfileOS *)objc_getProperty(self, a2, 88, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_manifest, 0);
  objc_storeStrong((id *)&self->_magic, 0);
  objc_storeStrong((id *)&self->_bootNonce, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_dataWriteDestination, 0);
  objc_storeStrong((id *)&self->_fileHandleWriteDestination, 0);
  objc_storeStrong((id *)&self->_subFileArray, 0);

  objc_storeStrong((id *)&self->_fileData, 0);
}

- (void)initWithContentsOfURL:.cold.1()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5(&dword_217A74000, v0, v1, "%s: Unable to open file at %@ (%@)", v2);
}

- (void)parseFileData
{
  OUTLINED_FUNCTION_4();
  _os_log_error_impl(v0, v1, v2, v3, v4, 0x3Cu);
}

- (void)addSubfileWithTagName:contentsOfURL:.cold.1()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5(&dword_217A74000, v0, v1, "%s: Unable to open file at %@ (%@)", v2);
}

- (void)createFileHandleForWritingToURL:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4();
  _os_log_error_impl(v0, v1, v2, v3, v4, 0x16u);
}

- (void)createFileHandleForWritingToURL:(void *)a1 .cold.2(void *a1)
{
  id v1 = (id)[a1 path];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_0_1(&dword_217A74000, v2, v3, "Unable to create file at %@", v4, v5, v6, v7, v8);
}

- (void)createFileHandleForWritingToURL:(void *)a1 .cold.3(void *a1)
{
  id v1 = (id)[a1 path];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_0_1(&dword_217A74000, v2, v3, "Unable to delete file at %@", v4, v5, v6, v7, v8);
}

- (void)writeToDestination
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl(&dword_217A74000, log, OS_LOG_TYPE_ERROR, "Failed to write FTAB header", v1, 2u);
}

- (void)writeToURL:(void *)a1 .cold.1(void *a1)
{
  id v1 = (id)[a1 absoluteString];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_0_1(&dword_217A74000, v2, v3, "Failed to open file handle for writing to '%@'", v4, v5, v6, v7, v8);
}

- (void)writeSubfileToURL:tag:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3_0(&dword_217A74000, v0, v1, "Unable to locate subfile with tag '%@'", v2, v3, v4, v5, v6);
}

@end