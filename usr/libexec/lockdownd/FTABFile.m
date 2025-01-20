@interface FTABFile
+ (id)longTagName:(id)a3;
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
- (FTABFile)init;
- (FTABFile)initWithContentsOfURL:(id)a3;
- (FTABFile)initWithData:(id)a3;
- (FTABSubfile)manifest;
- (NSArray)subfiles;
- (NSData)bootNonce;
- (NSData)magic;
- (NSString)bverString;
- (NSString)dumpString;
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
- (void)removeSubfileWithTag:(id)a3;
- (void)setManifest:(id)a3;
@end

@implementation FTABFile

- (NSString)dumpString
{
  v3 = +[NSMutableString string];
  v4 = [(FTABFile *)self url];
  [v3 appendFormat:@"Location: %@\n", v4];

  [v3 appendFormat:@"Generation: 0x%08x\n" -[FTABFile generation](self, "generation")];
  [v3 appendFormat:@"Valid: %u\n" -[FTABFile valid](self, "valid")];
  v5 = [(FTABFile *)self bootNonce];
  v6 = [v5 byteString];
  [v3 appendFormat:@"Boot nonce: %@\n", v6];

  id v7 = objc_alloc((Class)NSString);
  v8 = [(FTABFile *)self magic];
  id v9 = [v7 initWithData:v8 encoding:4];

  [v3 appendFormat:@"Magic: %@\n", v9];
  v10 = [(FTABFile *)self manifest];

  if (v10)
  {
    v11 = [(FTABFile *)self manifest];
    v12 = [v11 dumpString];
    [v3 appendFormat:@"\n%@\n", v12];
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v13 = [(FTABFile *)self subfiles];
  id v14 = [v13 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v22;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v22 != v16) {
          objc_enumerationMutation(v13);
        }
        v18 = [*(id *)(*((void *)&v21 + 1) + 8 * i) dumpString];
        [v3 appendFormat:@"\n%@\n", v18];
      }
      id v15 = [v13 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v15);
  }

  v19 = +[NSString stringWithString:v3];

  return (NSString *)v19;
}

- (FTABFile)initWithContentsOfURL:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)FTABFile;
  v6 = [(FTABFile *)&v14 init];
  if (!v6) {
    goto LABEL_5;
  }
  id v13 = 0;
  uint64_t v7 = +[NSData dataWithContentsOfURL:v5 options:1 error:&v13];
  id v8 = v13;
  fileData = v6->_fileData;
  v6->_fileData = (NSData *)v7;

  if (!v6->_fileData)
  {
    v11 = os_log_create("com.apple.accessoryupdater.ftab", "parsing");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1000CFF78();
    }

    goto LABEL_9;
  }
  if (![(FTABFile *)v6 initFile])
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

- (FTABFile)initWithData:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)FTABFile;
  id v5 = [(FTABFile *)&v10 init];
  if (v5
    && (v6 = (NSData *)[v4 copy],
        fileData = v5->_fileData,
        v5->_fileData = v6,
        fileData,
        ![(FTABFile *)v5 initFile]))
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
  v3 = +[NSMutableArray array];
  subFileArray = self->_subFileArray;
  self->_subFileArray = v3;

  return [(FTABFile *)self parseFileData];
}

- (FTABFile)init
{
  v11.receiver = self;
  v11.super_class = (Class)FTABFile;
  v2 = [(FTABFile *)&v11 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    fileData = v2->_fileData;
    v2->_fileData = (NSData *)v3;

    manifest = v2->_manifest;
    v2->_manifest = 0;

    v2->_filePointer = (const char *)[(NSData *)v2->_fileData bytes];
    v2->_fileLength = [(NSData *)v2->_fileData length];
    uint64_t v6 = +[NSMutableArray array];
    subFileArray = v2->_subFileArray;
    v2->_subFileArray = (NSMutableArray *)v6;

    uint64_t v8 = +[NSData dataWithBytes:"rkosftabRoseUpdater-106~24864" length:8];
    magic = v2->_magic;
    v2->_magic = (NSData *)v8;
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
      id v13 = +[NSData dataWithBytes:v12 length:8];
      magic = self->_magic;
      self->_magic = v13;

      self->_generation = *(_DWORD *)filePointer;
      self->_valid = *((_DWORD *)filePointer + 1);
      id v15 = +[NSData dataWithBytes:filePointer + 8 length:8];
      bootNonce = self->_bootNonce;
      self->_bootNonce = v15;

      uint64_t v17 = *((unsigned int *)filePointer + 5);
      if (v17)
      {
        uint64_t v18 = *((unsigned int *)filePointer + 4);
        if (![(FTABFile *)self fileValidForOffset:v18 length:*((unsigned int *)filePointer + 5)])
        {
          v2 = os_log_create("com.apple.accessoryupdater.ftab", "parsing");
          if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
            sub_1000D022C(v2, v29, v30, v31, v32, v33, v34, v35);
          }
          goto LABEL_26;
        }
        v19 = [[FTABSubfile alloc] initWithTag:@"Manifest" dataPointer:&self->_filePointer[v18] dataLength:v17];
        manifest = self->_manifest;
        self->_manifest = v19;
      }
      int v21 = *((_DWORD *)filePointer + 10);
      if (!v21) {
        return 1;
      }
      for (uint64_t i = 0;
            [(FTABFile *)self fileValidForOffset:(i + 48) length:16];
            i += 16)
      {
        uint64_t v24 = *(unsigned int *)&filePointer[i + 52];
        uint64_t v23 = *(unsigned int *)&filePointer[i + 56];
        if (![(FTABFile *)self fileValidForOffset:v24 length:v23])
        {
          v2 = os_log_create("com.apple.accessoryupdater.ftab", "parsing");
          if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
            sub_1000D0118();
          }
          goto LABEL_26;
        }
        id v25 = [objc_alloc((Class)NSString) initWithBytes:&filePointer[i + 48] length:4 encoding:4];
        if (!v25)
        {
          v2 = os_log_create("com.apple.accessoryupdater.ftab", "parsing");
          if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
            sub_1000D0064((unsigned __int8 *)&filePointer[i + 48], v2);
          }
          goto LABEL_26;
        }
        v26 = v25;
        v27 = [[FTABSubfile alloc] initWithTag:v25 dataPointer:&self->_filePointer[v24] dataLength:v23];
        [(NSMutableArray *)self->_subFileArray addObject:v27];
        --v21;

        if (!v21) {
          return 1;
        }
      }
      v2 = os_log_create("com.apple.accessoryupdater.ftab", "parsing");
      if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
        sub_1000D019C();
      }
    }
    else
    {
      v2 = os_log_create("com.apple.accessoryupdater.ftab", "parsing");
      if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
        sub_1000D02A4();
      }
    }
  }
  else
  {
    v2 = os_log_create("com.apple.accessoryupdater.ftab", "parsing");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      sub_1000CFFEC(v2, v3, v4, v5, v6, v7, v8, v9);
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
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = self->_subFileArray;
  id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
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
        objc_super v10 = objc_msgSend(v9, "tag:", v13);
        unsigned __int8 v11 = [v10 isEqual:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
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
  uint64_t v4 = [(FTABFile *)self subfileWithTag:a3];
  if (v4) {
    [(NSMutableArray *)self->_subFileArray removeObject:v4];
  }

  _objc_release_x1();
}

- (NSArray)subfiles
{
  return +[NSArray arrayWithArray:self->_subFileArray];
}

- (id)description
{
  uint64_t v3 = +[NSMutableString string];
  uint64_t v4 = v3;
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
    id v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = 0;
      uint64_t v10 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v8; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v6);
          }
          uint64_t v12 = *(void *)(*((void *)&v16 + 1) + 8 * i);
          if ((void *)-v9 != i) {
            [v4 appendString:@"\n"];
          }
          [v4 appendFormat:@"\t\t%@", v12];
        }
        v9 += (uint64_t)v8;
        id v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v8);
    }
  }
  long long v13 = +[NSString stringWithString:v4];

  return v13;
}

- (BOOL)addSubfileWithTagName:(id)a3 contentsOfURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v13 = 0;
  id v8 = +[NSData dataWithContentsOfURL:v7 options:1 error:&v13];
  id v9 = v13;
  if (v8)
  {
    BOOL v10 = [(FTABFile *)self addSubfileWithTagName:v6 subfileData:v8];
  }
  else
  {
    unsigned __int8 v11 = os_log_create("com.apple.accessoryupdater.ftab", "parsing");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1000D0384();
    }

    BOOL v10 = 0;
  }

  return v10;
}

- (BOOL)addSubfileWithTagName:(id)a3 subfileData:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(FTABFile *)self removeSubfileWithTag:v7];
  id v8 = [FTABSubfile alloc];
  id v9 = v6;
  id v10 = [v9 bytes];
  id v11 = [v9 length];

  uint64_t v12 = [(FTABSubfile *)v8 initWithTag:v7 dataPointer:v10 dataLength:v11];
  [(NSMutableArray *)self->_subFileArray addObject:v12];

  return 1;
}

- (void)addSubfiles:(id)a3
{
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = [*(id *)(*((void *)&v10 + 1) + 8 * (void)v8) tag];
        [(FTABFile *)self removeSubfileWithTag:v9];

        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
  [(NSMutableArray *)self->_subFileArray addObjectsFromArray:v4];
}

- (void)setManifest:(id)a3
{
  id v4 = a3;
  id v5 = [[FTABSubfile alloc] initWithTag:@"Manifest" data:v4];

  manifest = self->_manifest;
  self->_manifest = v5;
}

- (id)createFileHandleForWritingToURL:(id)a3
{
  id v3 = a3;
  id v4 = +[NSFileManager defaultManager];
  id v5 = [v3 path];
  unsigned int v6 = [v4 fileExistsAtPath:v5];

  if (v6)
  {
    uint64_t v7 = [v3 path];
    id v18 = 0;
    unsigned __int8 v8 = [v4 removeItemAtPath:v7 error:&v18];
    os_log_t v9 = (os_log_t)v18;

    if ((v8 & 1) == 0)
    {
      uint64_t v15 = os_log_create("com.apple.accessoryupdater.ftab", "writing");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        sub_1000D047C(v3);
      }

      goto LABEL_14;
    }
  }
  long long v10 = +[NSFileManager defaultManager];
  long long v11 = [v3 path];
  unsigned __int8 v12 = [v10 createFileAtPath:v11 contents:0 attributes:0];

  if ((v12 & 1) == 0)
  {
    os_log_t v9 = os_log_create("com.apple.accessoryupdater.ftab", "writing");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1000D03F8(v3);
    }
LABEL_14:
    long long v13 = 0;
    goto LABEL_15;
  }
  id v17 = 0;
  long long v13 = +[NSFileHandle fileHandleForWritingToURL:v3 error:&v17];
  os_log_t v9 = (os_log_t)v17;
  if (!v13)
  {
    long long v14 = os_log_create("com.apple.accessoryupdater.ftab", "writing");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_1000C4620();
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

  unsigned int v6 = [(FTABFile *)self createFileHandleForWritingToURL:v5];

  fileHandleWriteDestination = self->_fileHandleWriteDestination;
  self->_fileHandleWriteDestination = v6;

  return self->_fileHandleWriteDestination != 0;
}

- (void)configureDataWriteDestination
{
  fileHandleWriteDestination = self->_fileHandleWriteDestination;
  self->_fileHandleWriteDestination = 0;

  self->_dataWriteDestination = +[NSMutableData data];

  _objc_release_x1();
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
  uint64_t v39 = 0;
  uint64_t v40 = 0;
  uint64_t v41 = 0;
  v36[0] = *(void *)&self->_generation;
  v36[1] = *(void *)[(NSData *)self->_bootNonce bytes];
  unsigned int v3 = 16 * [(NSMutableArray *)self->_subFileArray count];
  manifest = self->_manifest;
  if (manifest)
  {
    unsigned int v5 = v3 + 48;
    unsigned int v6 = [(FTABSubfile *)manifest dataLength];
  }
  else
  {
    unsigned int v6 = 0;
    unsigned int v5 = 0;
  }
  unsigned int v37 = v5;
  unsigned int v38 = v6;
  uint64_t v40 = *(void *)[(NSData *)self->_magic bytes];
  LODWORD(v41) = [(NSMutableArray *)self->_subFileArray count];
  if (![(FTABFile *)self writeBytes:v36 length:48])
  {
    uint64_t v7 = (NSMutableArray *)os_log_create("com.apple.accessoryupdater.ftab", "writing");
    if (os_log_type_enabled(&v7->super.super, OS_LOG_TYPE_ERROR)) {
      sub_1000C4910(&v7->super.super);
    }
    goto LABEL_31;
  }
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v7 = self->_subFileArray;
  id v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v8)
  {
    id v9 = v8;
    int v10 = v3 + v6 + 48;
    uint64_t v11 = *(void *)v31;
    while (2)
    {
      for (uint64_t i = 0; i != v9; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v31 != v11) {
          objc_enumerationMutation(v7);
        }
        long long v13 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        uint64_t v28 = 0;
        uint64_t v29 = 0;
        id v14 = [v13 tag];
        LODWORD(v28) = *(_DWORD *)[v14 UTF8String];

        HIDWORD(v28) = v10;
        LODWORD(v29) = [v13 dataLength];
        if (![(FTABFile *)self writeBytes:&v28 length:16])
        {
          long long v22 = os_log_create("com.apple.accessoryupdater.ftab", "writing");
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
            sub_1000D0584(v13);
          }
LABEL_30:

          goto LABEL_31;
        }
        v10 += [v13 dataLength];
      }
      id v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v30 objects:v35 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  uint64_t v15 = self->_manifest;
  if (v15
    && ![(FTABFile *)self writeBytes:[(FTABSubfile *)v15 dataPointer] length:[(FTABSubfile *)self->_manifest dataLength]])
  {
    uint64_t v7 = (NSMutableArray *)os_log_create("com.apple.accessoryupdater.ftab", "writing");
    if (os_log_type_enabled(&v7->super.super, OS_LOG_TYPE_ERROR)) {
      sub_1000C4840(&v7->super.super);
    }
LABEL_31:
    BOOL v21 = 0;
    goto LABEL_32;
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v7 = self->_subFileArray;
  id v16 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v24 objects:v34 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v25;
    while (2)
    {
      for (j = 0; j != v17; j = (char *)j + 1)
      {
        if (*(void *)v25 != v18) {
          objc_enumerationMutation(v7);
        }
        v20 = *(void **)(*((void *)&v24 + 1) + 8 * (void)j);
        if (!-[FTABFile writeBytes:length:](self, "writeBytes:length:", objc_msgSend(v20, "dataPointer", (void)v24), objc_msgSend(v20, "dataLength")))
        {
          long long v22 = os_log_create("com.apple.accessoryupdater.ftab", "writing");
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
            sub_1000D0500(v20);
          }
          goto LABEL_30;
        }
      }
      id v17 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v24 objects:v34 count:16];
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
  if ([(FTABFile *)self configureFileHandleWriteDestinationForURL:v4])
  {
    BOOL v5 = [(FTABFile *)self writeToDestination];
    fileHandleWriteDestination = self->_fileHandleWriteDestination;
    self->_fileHandleWriteDestination = 0;
  }
  else
  {
    uint64_t v7 = os_log_create("com.apple.accessoryupdater.ftab", "writing");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1000D0608(v4);
    }

    BOOL v5 = 0;
  }

  return v5;
}

- (id)writeToData
{
  [(FTABFile *)self configureDataWriteDestination];
  [(FTABFile *)self writeToDestination];
  unsigned int v3 = +[NSData dataWithData:self->_dataWriteDestination];
  dataWriteDestination = self->_dataWriteDestination;
  self->_dataWriteDestination = 0;

  return v3;
}

- (BOOL)writeSubfileToURL:(id)a3 tag:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(FTABFile *)self subfileWithTag:v7];
  if (v8)
  {
    id v9 = [(FTABFile *)self createFileHandleForWritingToURL:v6];
    if (v9) {
      unsigned __int8 v10 = [v9 writeBytes:[v8 dataPointer] length:[v8 dataLength]];
    }
    else {
      unsigned __int8 v10 = 0;
    }
  }
  else
  {
    uint64_t v11 = os_log_create("com.apple.accessoryupdater.ftab", "writing");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1000C49E0();
    }

    unsigned __int8 v10 = 0;
  }

  return v10;
}

- (BOOL)writeBytes:(const void *)a3 length:(unint64_t)a4 handle:(id)a5
{
  id v7 = a5;
  id v8 = +[NSData dataWithBytes:a3 length:a4];
  LOBYTE(a3) = [v7 uarpWriteData:v8 error:0];

  return (char)a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  unsigned int v3 = [(FTABFile *)self writeToData];
  id v4 = [[FTABFile alloc] initWithData:v3];

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

- (FTABSubfile)manifest
{
  return (FTABSubfile *)objc_getProperty(self, a2, 88, 1);
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

- (NSString)bverString
{
  v2 = [(FTABFile *)self subfileWithTag:@"bver"];
  unsigned int v3 = v2;
  if (v2 && (unsigned int v4 = [v2 dataLength]) != 0)
  {
    LODWORD(v5) = v4;
    if (*((unsigned char *)[v3 dataPointer] + v4 - 1) == 10) {
      uint64_t v5 = (v5 - 1);
    }
    else {
      uint64_t v5 = v5;
    }
    id v6 = [objc_alloc((Class)NSString) initWithBytes:objc_msgSend(v3, "dataPointer") length:v5 encoding:4];
  }
  else
  {
    id v6 = 0;
  }

  return (NSString *)v6;
}

+ (id)longTagName:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"acib"])
  {
    CFStringRef v4 = @"ACIBT";
  }
  else if ([v3 isEqualToString:@"aopf"])
  {
    CFStringRef v4 = @"AOP";
  }
  else if ([v3 isEqualToString:@"lpda"])
  {
    CFStringRef v4 = @"LeapBinsDigestsArray";
  }
  else if ([v3 isEqualToString:@"phyb"])
  {
    CFStringRef v4 = @"PhyBlueTooth";
  }
  else if ([v3 isEqualToString:@"rrko"])
  {
    CFStringRef v4 = @"RestoreRTKitOS";
  }
  else if ([v3 isEqualToString:@"rkos"])
  {
    CFStringRef v4 = @"RTKitOS";
  }
  else if ([v3 isEqualToString:@"rtpf"])
  {
    CFStringRef v4 = @"RTP";
  }
  else if ([v3 isEqualToString:@"sbd1"])
  {
    CFStringRef v4 = @"SoftwareBinaryDsp1";
  }
  else if ([v3 isEqualToString:@"sbd2"])
  {
    CFStringRef v4 = @"SoftwareBinaryDsp2";
  }
  else
  {
    CFStringRef v4 = 0;
  }

  return (id)v4;
}

@end