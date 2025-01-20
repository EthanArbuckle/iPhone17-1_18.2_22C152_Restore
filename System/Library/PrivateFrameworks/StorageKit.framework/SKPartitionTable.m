@interface SKPartitionTable
+ (BOOL)updatePartitionTypeWithPartitions:(id)a3 partID:(id)a4 newType:(id)a5 error:(id *)a6;
+ (__MKMedia)createMediaRefWithDisk:(id)a3 error:(id *)a4;
+ (id)partitionIDFromDisk:(id)a3;
- (BOOL)allocateMediaRef:(id *)a3;
- (BOOL)fitToContainerSize:(unint64_t)a3 error:(id *)a4;
- (BOOL)overwriteExistingMediaLayout:(id)a3 opts:(__CFDictionary *)a4 partitionScheme:(int)a5;
- (BOOL)overwriteExistingMediaLayout:(id)a3 opts:(__CFDictionary *)a4 partitionScheme:(int)a5 size:(unint64_t)a6;
- (BOOL)overwritePartitionAt:(id)a3 filesystem:(id)a4 error:(id *)a5;
- (BOOL)resizePartitionID:(id)a3 size:(unint64_t)a4 offset:(unint64_t)a5 error:(id *)a6;
- (BOOL)writeNewMediaLayout:(id)a3 partitionScheme:(unint64_t)a4;
- (BOOL)writePartitionScheme:(unint64_t)a3 error:(id *)a4;
- (NSMutableArray)partitions;
- (SKDisk)disk;
- (SKPartitionTable)initWithDisk:(id)a3 error:(id *)a4;
- (__MKMedia)mediaRef;
- (unsigned)sectorSize;
- (void)dealloc;
- (void)flushMediaRef;
- (void)setDisk:(id)a3;
- (void)setMediaRef:(__MKMedia *)a3;
- (void)setPartitions:(id)a3;
- (void)setSectorSize:(unsigned int)a3;
@end

@implementation SKPartitionTable

+ (__MKMedia)createMediaRefWithDisk:(id)a3 error:(id *)a4
{
  v21[2] = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = NSString;
  v7 = [v5 diskIdentifier];
  id v8 = [v6 stringWithFormat:@"/dev/r%@", v7];
  [v8 fileSystemRepresentation];

  v20[0] = @"Writable";
  v20[1] = @"Shared Writer";
  v21[0] = MEMORY[0x263EFFA88];
  v21[1] = MEMORY[0x263EFFA88];
  v9 = [NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:2];
  v10 = (__MKMedia *)MKMediaCreateWithPath();
  if (!v10)
  {
    v11 = SKGetOSLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v15 = "+[SKPartitionTable createMediaRefWithDisk:error:]";
      __int16 v16 = 2112;
      id v17 = v5;
      __int16 v18 = 1024;
      int v19 = 0;
      _os_log_impl(&dword_23F40C000, v11, OS_LOG_TYPE_ERROR, "%s: Failed to create media ref with disk %@, MK err %d", buf, 0x1Cu);
    }

    id v12 = +[SKError nilWithPOSIXCode:0 error:a4];
    v10 = 0;
  }

  return v10;
}

- (SKPartitionTable)initWithDisk:(id)a3 error:(id *)a4
{
  v26[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  v22.receiver = self;
  v22.super_class = (Class)SKPartitionTable;
  v7 = [(SKPartitionTable *)&v22 init];
  if (v7)
  {
    uint64_t v8 = [MEMORY[0x263EFF980] array];
    partitions = v7->_partitions;
    v7->_partitions = (NSMutableArray *)v8;

    v10 = +[SKBaseManager sharedManager];
    v11 = [v10 wholeDiskForDisk:v6];

    if (!v11)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_11;
      }
      v11 = [v6 container];
      if (!v11) {
        goto LABEL_11;
      }
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v12 = [v11 designatedPhysicalStore];
      if (!v12)
      {
        v26[0] = v11;
        int v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v26 count:1];
        v20 = +[SKError errorWithCode:117 disks:v19 userInfo:0];
        __int16 v18 = +[SKError nilWithError:v20 error:a4];

        goto LABEL_16;
      }
      v13 = (void *)v12;
      v14 = +[SKBaseManager sharedManager];
      uint64_t v15 = [v14 wholeDiskForDisk:v13];

      id v6 = v13;
      v11 = (void *)v15;
      if (!v15)
      {
LABEL_11:
        id v25 = v6;
        v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v25 count:1];
        int v19 = +[SKError errorWithCode:117 disks:v11 userInfo:0];
        __int16 v18 = +[SKError nilWithError:v19 error:a4];
LABEL_16:

        goto LABEL_17;
      }
    }
    objc_storeStrong((id *)&v7->_disk, v11);
    v7->_sectorSize = [v11 getSectorSize];
    __int16 v16 = objc_opt_class();
    id v17 = [(SKPartitionTable *)v7 disk];
    v7->_mediaRef = (__MKMedia *)[v16 createMediaRefWithDisk:v17 error:a4];

    if (!v7->_mediaRef)
    {
      int v19 = SKGetOSLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v24 = "-[SKPartitionTable initWithDisk:error:]";
        _os_log_impl(&dword_23F40C000, v19, OS_LOG_TYPE_ERROR, "%s: Failed to create media ref", buf, 0xCu);
      }
      __int16 v18 = 0;
      goto LABEL_16;
    }
  }
  __int16 v18 = v7;
LABEL_17:

  return v18;
}

- (void)dealloc
{
  mediaRef = self->_mediaRef;
  if (mediaRef) {
    CFRelease(mediaRef);
  }
  v4.receiver = self;
  v4.super_class = (Class)SKPartitionTable;
  [(SKPartitionTable *)&v4 dealloc];
}

- (BOOL)writeNewMediaLayout:(id)a3 partitionScheme:(unint64_t)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a3;
  int v12 = 0;
  if (MKCFCreateMedia())
  {
    [(SKPartitionTable *)self sectorSize];
    [(SKPartitionTable *)self sectorSize];
    v11 = [(SKPartitionTable *)self mediaRef];
    MKCFCreateMap();
    [(SKPartitionTable *)self mediaRef];
    int v12 = MKCFWriteMedia();
    if (v12)
    {
      v10 = SKGetOSLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v14 = "-[SKPartitionTable writeNewMediaLayout:partitionScheme:]";
        __int16 v15 = 1024;
        int v16 = v12;
        _os_log_impl(&dword_23F40C000, v10, OS_LOG_TYPE_ERROR, "%s: Failed to write scheme, MK err %d", buf, 0x12u);
      }
    }
    MKCFDisposeMedia();
    BOOL v8 = v12 == 0;
  }
  else
  {
    id v6 = +[SKBaseManager sharedManager];
    [v6 logEvent:@"com.apple.StorageKit.log.fault" eventPayloadBuilder:&__block_literal_global_51];

    v7 = SKGetOSLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      v14 = "-[SKPartitionTable writeNewMediaLayout:partitionScheme:]";
      __int16 v15 = 1024;
      int v16 = v12;
      _os_log_impl(&dword_23F40C000, v7, OS_LOG_TYPE_FAULT, "%s: Failed to create media, MK err %d", buf, 0x12u);
    }

    BOOL v8 = 0;
  }

  return v8;
}

id __56__SKPartitionTable_writeNewMediaLayout_partitionScheme___block_invoke()
{
  v4[1] = *MEMORY[0x263EF8340];
  v3 = @"faultCode";
  v0 = base64Encode((uint64_t)"SKPartitionTable.m", 141);
  v4[0] = v0;
  v1 = [NSDictionary dictionaryWithObjects:v4 forKeys:&v3 count:1];

  return v1;
}

id __56__SKPartitionTable_writeNewMediaLayout_partitionScheme___block_invoke_56()
{
  v4[1] = *MEMORY[0x263EF8340];
  v3 = @"faultCode";
  v0 = base64Encode((uint64_t)"SKPartitionTable.m", 149);
  v4[0] = v0;
  v1 = [NSDictionary dictionaryWithObjects:v4 forKeys:&v3 count:1];

  return v1;
}

- (BOOL)overwriteExistingMediaLayout:(id)a3 opts:(__CFDictionary *)a4 partitionScheme:(int)a5
{
  return [(SKPartitionTable *)self overwriteExistingMediaLayout:a3 opts:a4 partitionScheme:*(void *)&a5 size:0];
}

- (BOOL)overwriteExistingMediaLayout:(id)a3 opts:(__CFDictionary *)a4 partitionScheme:(int)a5 size:(unint64_t)a6
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v7 = a3;
  int v17 = 0;
  [(SKPartitionTable *)self mediaRef];
  CFDictionaryRef v8 = (const __CFDictionary *)MKCFReadMedia();
  if (!v8)
  {
    v10 = SKGetOSLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      int v19 = "-[SKPartitionTable overwriteExistingMediaLayout:opts:partitionScheme:size:]";
      __int16 v20 = 1024;
      int v21 = v17;
      _os_log_impl(&dword_23F40C000, v10, OS_LOG_TYPE_ERROR, "%s: Failed to read media, MK err %d", buf, 0x12u);
    }

    goto LABEL_10;
  }
  CFArrayRef Value = (const __CFArray *)CFDictionaryGetValue(v8, @"Schemes");
  [(SKPartitionTable *)self sectorSize];
  int v16 = [(SKPartitionTable *)self mediaRef];
  MKCFCreateMap();
  CFArrayGetValueAtIndex(Value, 1);
  [(SKPartitionTable *)self mediaRef];
  int v17 = MKCFUpdateScheme();
  if (v17)
  {
    v11 = +[SKBaseManager sharedManager];
    [v11 logEvent:@"com.apple.StorageKit.log.fault" eventPayloadBuilder:&__block_literal_global_73];

    int v12 = SKGetOSLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      int v19 = "-[SKPartitionTable overwriteExistingMediaLayout:opts:partitionScheme:size:]";
      __int16 v20 = 1024;
      int v21 = v17;
      _os_log_impl(&dword_23F40C000, v12, OS_LOG_TYPE_FAULT, "%s: Failed to update scheme, MK err %d", buf, 0x12u);
    }

    MKCFDisposeMedia();
LABEL_10:
    BOOL v13 = 0;
    goto LABEL_11;
  }
  [(SKPartitionTable *)self mediaRef];
  int v17 = MKCFWriteScheme();
  if (v17)
  {
    __int16 v15 = SKGetOSLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      int v19 = "-[SKPartitionTable overwriteExistingMediaLayout:opts:partitionScheme:size:]";
      __int16 v20 = 1024;
      int v21 = v17;
      _os_log_impl(&dword_23F40C000, v15, OS_LOG_TYPE_ERROR, "%s: Failed to write scheme, MK err %d", buf, 0x12u);
    }
  }
  MKCFDisposeMedia();
  BOOL v13 = v17 == 0;
LABEL_11:

  return v13;
}

id __75__SKPartitionTable_overwriteExistingMediaLayout_opts_partitionScheme_size___block_invoke()
{
  v4[1] = *MEMORY[0x263EF8340];
  v3 = @"faultCode";
  v0 = base64Encode((uint64_t)"SKPartitionTable.m", 180);
  v4[0] = v0;
  v1 = [NSDictionary dictionaryWithObjects:v4 forKeys:&v3 count:1];

  return v1;
}

id __75__SKPartitionTable_overwriteExistingMediaLayout_opts_partitionScheme_size___block_invoke_71()
{
  v4[1] = *MEMORY[0x263EF8340];
  v3 = @"faultCode";
  v0 = base64Encode((uint64_t)"SKPartitionTable.m", 187);
  v4[0] = v0;
  v1 = [NSDictionary dictionaryWithObjects:v4 forKeys:&v3 count:1];

  return v1;
}

- (void)flushMediaRef
{
  if ([(SKPartitionTable *)self mediaRef])
  {
    CFRelease([(SKPartitionTable *)self mediaRef]);
    [(SKPartitionTable *)self setMediaRef:0];
  }
}

- (BOOL)allocateMediaRef:(id *)a3
{
  if (![(SKPartitionTable *)self mediaRef])
  {
    id v5 = objc_opt_class();
    id v6 = [(SKPartitionTable *)self disk];
    -[SKPartitionTable setMediaRef:](self, "setMediaRef:", [v5 createMediaRefWithDisk:v6 error:a3]);
  }
  return [(SKPartitionTable *)self mediaRef] != 0;
}

- (BOOL)writePartitionScheme:(unint64_t)a3 error:(id *)a4
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  if (![(SKPartitionTable *)self allocateMediaRef:a4]) {
    return 0;
  }
  id v7 = [(SKPartitionTable *)self disk];
  int v8 = [v7 wipeDiskWithError:a4];

  if (!v8) {
    return 0;
  }
  v9 = objc_opt_new();
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  v10 = [(SKPartitionTable *)self partitions];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v26 objects:v36 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v27;
    if (a3) {
      unsigned int v14 = 1;
    }
    else {
      unsigned int v14 = 16;
    }
    if (a3 == 1) {
      uint64_t v15 = 8;
    }
    else {
      uint64_t v15 = v14;
    }
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v27 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v17 = objc_msgSend(*(id *)(*((void *)&v26 + 1) + 8 * i), "buildWithScheme:sectorSize:", v15, -[SKPartitionTable sectorSize](self, "sectorSize"));
        if (!v17)
        {
          __int16 v20 = [(SKPartitionTable *)self disk];
          v35 = v20;
          int v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v35 count:1];
          uint64_t v22 = 300;
          goto LABEL_23;
        }
        __int16 v18 = (void *)v17;
        [v9 addObject:v17];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v26 objects:v36 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }

  v33 = @"Partitions";
  v34 = v9;
  v10 = [NSDictionary dictionaryWithObjects:&v34 forKeys:&v33 count:1];
  if ([(SKPartitionTable *)self writeNewMediaLayout:v10 partitionScheme:a3])
  {
    [(SKPartitionTable *)self flushMediaRef];
    BOOL v19 = 1;
  }
  else
  {
    v23 = SKGetOSLog();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v32 = "-[SKPartitionTable writePartitionScheme:error:]";
      _os_log_impl(&dword_23F40C000, v23, OS_LOG_TYPE_ERROR, "%s: Failed to write media on disk", buf, 0xCu);
    }

    __int16 v20 = [(SKPartitionTable *)self disk];
    v30 = v20;
    int v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v30 count:1];
    uint64_t v22 = 114;
LABEL_23:
    v24 = +[SKError errorWithCode:v22 disks:v21 userInfo:0];
    BOOL v19 = +[SKError failWithError:v24 error:a4];
  }
  return v19;
}

+ (id)partitionIDFromDisk:(id)a3
{
  id v3 = a3;
  objc_super v4 = [SKIOMedia alloc];
  id v5 = [v3 diskIdentifier];

  id v6 = [(SKIOMedia *)v4 initWithDevName:v5];
  id v7 = [(SKIOObject *)v6 copyPropertyWithClass:objc_opt_class() key:@"Partition ID"];

  return v7;
}

+ (BOOL)updatePartitionTypeWithPartitions:(id)a3 partID:(id)a4 newType:(id)a5 error:(id *)a6
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v11 = v8;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v24;
    while (2)
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v24 != v14) {
          objc_enumerationMutation(v11);
        }
        int v16 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        uint64_t v17 = [v16 objectForKeyedSubscript:@"Partition ID"];
        int v18 = [v17 isEqual:v9];

        if (v18)
        {
          [v16 setObject:v10 forKeyedSubscript:@"Type"];
          BOOL v20 = 1;
          BOOL v19 = v11;
          goto LABEL_11;
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }

  BOOL v19 = [NSString stringWithFormat:@"Couldn't find partition with ID %@", v9];
  BOOL v20 = +[SKError failWithSKErrorCode:117 debugDescription:v19 error:a6];
LABEL_11:

  return v20;
}

- (BOOL)overwritePartitionAt:(id)a3 filesystem:(id)a4 error:(id *)a5
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  if ([(SKPartitionTable *)self allocateMediaRef:a5])
  {
    [(SKPartitionTable *)self mediaRef];
    id v10 = MKCFReadMedia();
    id v11 = v10;
    if (!v10)
    {
      int v21 = SKGetOSLog();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v34 = "-[SKPartitionTable overwritePartitionAt:filesystem:error:]";
        __int16 v35 = 1024;
        int v36 = 0;
        _os_log_impl(&dword_23F40C000, v21, OS_LOG_TYPE_ERROR, "%s: Failed to read media, MK err %d", buf, 0x12u);
      }

      uint64_t v12 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:0 userInfo:0];
      BOOL v20 = +[SKError failWithError:v12 error:a5];
      goto LABEL_17;
    }
    uint64_t v12 = [v10 objectForKeyedSubscript:@"Schemes"];
    uint64_t v28 = [v12 objectAtIndexedSubscript:0];
    v30 = [v28 objectForKeyedSubscript:@"Sections"];
    long long v29 = [v30 objectAtIndexedSubscript:0];
    uint64_t v13 = [v29 objectForKeyedSubscript:@"Partitions"];
    uint64_t v14 = [(SKPartitionTable *)self disk];
    uint64_t v15 = [v14 type];
    int v16 = diskTypeToScheme(v15);

    if (v16 == 512)
    {
      MKCFDisposeMedia();
      uint64_t v17 = [(SKPartitionTable *)self disk];
      v32 = v17;
      int v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v32 count:1];
      BOOL v19 = +[SKError errorWithCode:117 disks:v18 userInfo:0];
      BOOL v20 = +[SKError failWithError:v19 error:a5];
    }
    else
    {
      uint64_t v22 = objc_opt_class();
      long long v23 = [v9 contentMask];
      LODWORD(v22) = [v22 updatePartitionTypeWithPartitions:v13 partID:v8 newType:v23 error:a5];

      if (v22)
      {
        [(SKPartitionTable *)self mediaRef];
        int v31 = MKCFWriteMedia();
        MKCFDisposeMedia();
        long long v25 = v29;
        long long v24 = v30;
        if (v31)
        {
          BOOL v20 = +[SKError failWithSKErrorCode:114 debugDescription:@"Failed to overwrite existing partition" error:a5];
        }
        else
        {
          [(SKPartitionTable *)self flushMediaRef];
          BOOL v20 = 1;
        }
        long long v26 = v28;
        goto LABEL_16;
      }
      BOOL v20 = 0;
    }
    long long v26 = v28;
    long long v25 = v29;
    long long v24 = v30;
LABEL_16:

LABEL_17:
    goto LABEL_18;
  }
  BOOL v20 = 0;
LABEL_18:

  return v20;
}

- (BOOL)fitToContainerSize:(unint64_t)a3 error:(id *)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  if (![(SKPartitionTable *)self allocateMediaRef:a4]) {
    return 0;
  }
  [(SKPartitionTable *)self mediaRef];
  id v7 = MKCFReadMedia();
  if (v7)
  {
    id v8 = [(SKPartitionTable *)self disk];
    id v9 = [v8 type];
    uint64_t v10 = diskTypeToScheme(v9);

    if (v10 == 512)
    {
      MKCFDisposeMedia();
      id v11 = [(SKPartitionTable *)self disk];
      long long v26 = v11;
      uint64_t v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v26 count:1];
      uint64_t v13 = +[SKError errorWithCode:117 disks:v12 userInfo:0];
      BOOL v14 = +[SKError failWithError:v13 error:a4];
    }
    else
    {
      id v11 = [v7 objectForKeyedSubscript:@"Schemes"];
      int v16 = [v11 objectAtIndexedSubscript:0];
      uint64_t v17 = [v16 objectForKeyedSubscript:@"Sections"];
      int v18 = [v17 objectAtIndexedSubscript:0];
      BOOL v19 = [(SKPartitionTable *)self overwriteExistingMediaLayout:v18 opts:&unk_26F31DAE8 partitionScheme:v10 size:a3 / [(SKPartitionTable *)self sectorSize]];
      MKCFDisposeMedia();
      if (v19)
      {
        [(SKPartitionTable *)self flushMediaRef];
        BOOL v14 = 1;
      }
      else
      {
        BOOL v20 = SKGetOSLog();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          uint64_t v28 = "-[SKPartitionTable fitToContainerSize:error:]";
          _os_log_impl(&dword_23F40C000, v20, OS_LOG_TYPE_ERROR, "%s: Failed to fit existing partition", buf, 0xCu);
        }

        int v21 = [(SKPartitionTable *)self disk];
        long long v25 = v21;
        uint64_t v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v25 count:1];
        long long v23 = +[SKError errorWithCode:114 disks:v22 userInfo:0];
        BOOL v14 = +[SKError failWithError:v23 error:a4];
      }
    }
  }
  else
  {
    uint64_t v15 = SKGetOSLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v28 = "-[SKPartitionTable fitToContainerSize:error:]";
      __int16 v29 = 1024;
      int v30 = 0;
      _os_log_impl(&dword_23F40C000, v15, OS_LOG_TYPE_ERROR, "%s: Failed to read media, MK err %d", buf, 0x12u);
    }

    id v11 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:0 userInfo:0];
    BOOL v14 = +[SKError failWithError:v11 error:a4];
  }

  return v14;
}

- (BOOL)resizePartitionID:(id)a3 size:(unint64_t)a4 offset:(unint64_t)a5 error:(id *)a6
{
  uint64_t v65 = *MEMORY[0x263EF8340];
  id v50 = a3;
  if ([(SKPartitionTable *)self allocateMediaRef:a6])
  {
    int v55 = 0;
    [(SKPartitionTable *)self mediaRef];
    id v8 = MKCFReadMedia();
    id v9 = v8;
    if (!v8)
    {
      int v21 = SKGetOSLog();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v62 = "-[SKPartitionTable resizePartitionID:size:offset:error:]";
        __int16 v63 = 1024;
        int v64 = v55;
        _os_log_impl(&dword_23F40C000, v21, OS_LOG_TYPE_ERROR, "%s: Failed to read media, MK err %d", buf, 0x12u);
      }

      uint64_t v10 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:v55 userInfo:0];
      BOOL v20 = +[SKError failWithError:v10 error:a6];
      goto LABEL_26;
    }
    uint64_t v10 = [v8 objectForKeyedSubscript:@"Schemes"];
    id v11 = [v10 objectAtIndexedSubscript:0];
    uint64_t v12 = [v11 objectForKeyedSubscript:@"Sections"];
    v46 = [v12 objectAtIndexedSubscript:0];
    uint64_t v13 = [v46 objectForKeyedSubscript:@"Partitions"];
    BOOL v14 = [(SKPartitionTable *)self disk];
    uint64_t v15 = [v14 type];
    unsigned int v16 = diskTypeToScheme(v15);

    v47 = v13;
    if (v16 == 512)
    {
      MKCFDisposeMedia();
      uint64_t v17 = [(SKPartitionTable *)self disk];
      v60 = v17;
      int v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v60 count:1];
      BOOL v19 = +[SKError errorWithCode:117 disks:v18 userInfo:0];
      BOOL v20 = +[SKError failWithError:v19 error:a6];
    }
    else
    {
      unsigned int v44 = v16;
      v41 = v12;
      v42 = v11;
      v43 = v10;
      v40 = a6;
      v45 = v9;
      uint64_t v17 = objc_opt_new();
      long long v51 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      id v22 = v13;
      uint64_t v23 = [v22 countByEnumeratingWithState:&v51 objects:v59 count:16];
      if (v23)
      {
        uint64_t v24 = v23;
        uint64_t v25 = *(void *)v52;
        do
        {
          for (uint64_t i = 0; i != v24; ++i)
          {
            if (*(void *)v52 != v25) {
              objc_enumerationMutation(v22);
            }
            long long v27 = *(void **)(*((void *)&v51 + 1) + 8 * i);
            uint64_t v28 = (void *)[v27 mutableCopy];
            __int16 v29 = [v27 objectForKeyedSubscript:@"Partition ID"];
            int v30 = [v29 isEqualToNumber:v50];

            if (v30)
            {
              uint64_t v31 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", a4 / -[SKPartitionTable sectorSize](self, "sectorSize"));
              [v28 setObject:v31 forKeyedSubscript:@"Size"];

              if (a5)
              {
                v32 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", a5 / -[SKPartitionTable sectorSize](self, "sectorSize"));
                [v28 setObject:v32 forKeyedSubscript:@"Offset"];
              }
            }
            [v17 addObject:v28];
          }
          uint64_t v24 = [v22 countByEnumeratingWithState:&v51 objects:v59 count:16];
        }
        while (v24);
      }

      v57 = @"Partitions";
      v58 = v17;
      int v18 = [NSDictionary dictionaryWithObjects:&v58 forKeys:&v57 count:1];
      BOOL v33 = [(SKPartitionTable *)self overwriteExistingMediaLayout:v18 opts:&unk_26F31DB38 partitionScheme:v44];
      id v9 = v45;
      MKCFDisposeMedia();
      if (!v33)
      {
        __int16 v35 = SKGetOSLog();
        uint64_t v12 = v41;
        v34 = v46;
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          v62 = "-[SKPartitionTable resizePartitionID:size:offset:error:]";
          _os_log_impl(&dword_23F40C000, v35, OS_LOG_TYPE_ERROR, "%s: Failed to overwrite existing partition", buf, 0xCu);
        }

        int v36 = [(SKPartitionTable *)self disk];
        v56 = v36;
        uint64_t v37 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v56 count:1];
        v38 = +[SKError errorWithCode:114 disks:v37 userInfo:0];
        BOOL v20 = +[SKError failWithError:v38 error:v40];

        id v11 = v42;
        uint64_t v10 = v43;
        goto LABEL_25;
      }
      [(SKPartitionTable *)self flushMediaRef];
      BOOL v20 = 1;
      uint64_t v10 = v43;
      uint64_t v12 = v41;
    }
    v34 = v46;
LABEL_25:

LABEL_26:
    goto LABEL_27;
  }
  BOOL v20 = 0;
LABEL_27:

  return v20;
}

- (NSMutableArray)partitions
{
  return self->_partitions;
}

- (void)setPartitions:(id)a3
{
}

- (SKDisk)disk
{
  return (SKDisk *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDisk:(id)a3
{
}

- (unsigned)sectorSize
{
  return self->_sectorSize;
}

- (void)setSectorSize:(unsigned int)a3
{
  self->_sectorSize = a3;
}

- (__MKMedia)mediaRef
{
  return self->_mediaRef;
}

- (void)setMediaRef:(__MKMedia *)a3
{
  self->_mediaRef = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_disk, 0);

  objc_storeStrong((id *)&self->_partitions, 0);
}

@end