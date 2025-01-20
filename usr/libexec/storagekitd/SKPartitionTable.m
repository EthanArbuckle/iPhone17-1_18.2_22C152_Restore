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
  id v5 = a3;
  v6 = [v5 diskIdentifier];
  id v7 = +[NSString stringWithFormat:@"/dev/r%@", v6];
  [v7 fileSystemRepresentation];

  v19[0] = @"Writable";
  v19[1] = @"Shared Writer";
  v20[0] = &__kCFBooleanTrue;
  v20[1] = &__kCFBooleanTrue;
  v8 = +[NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:2];
  v9 = (__MKMedia *)MKMediaCreateWithPath();
  if (!v9)
  {
    v10 = sub_10000DD48();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v14 = "+[SKPartitionTable createMediaRefWithDisk:error:]";
      __int16 v15 = 2112;
      id v16 = v5;
      __int16 v17 = 1024;
      int v18 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%s: Failed to create media ref with disk %@, MK err %d", buf, 0x1Cu);
    }

    id v11 = +[SKError nilWithPOSIXCode:0 error:a4];
    v9 = 0;
  }

  return v9;
}

- (SKPartitionTable)initWithDisk:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v22.receiver = self;
  v22.super_class = (Class)SKPartitionTable;
  id v7 = [(SKPartitionTable *)&v22 init];
  if (v7)
  {
    uint64_t v8 = +[NSMutableArray array];
    partitions = v7->_partitions;
    v7->_partitions = (NSMutableArray *)v8;

    v10 = +[SKBaseManager sharedManager];
    id v11 = [v10 wholeDiskForDisk:v6];

    if (!v11)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_11;
      }
      id v11 = [v6 container];
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
        v26 = v11;
        v19 = +[NSArray arrayWithObjects:&v26 count:1];
        v20 = +[SKError errorWithCode:117 disks:v19 userInfo:0];
        int v18 = +[SKError nilWithError:v20 error:a4];

        goto LABEL_16;
      }
      v13 = (void *)v12;
      v14 = +[SKBaseManager sharedManager];
      uint64_t v15 = [v14 wholeDiskForDisk:v13];

      id v6 = v13;
      id v11 = (void *)v15;
      if (!v15)
      {
LABEL_11:
        id v25 = v6;
        id v11 = +[NSArray arrayWithObjects:&v25 count:1];
        v19 = +[SKError errorWithCode:117 disks:v11 userInfo:0];
        int v18 = +[SKError nilWithError:v19 error:a4];
LABEL_16:

        goto LABEL_17;
      }
    }
    objc_storeStrong((id *)&v7->_disk, v11);
    v7->_sectorSize = [v11 getSectorSize];
    id v16 = objc_opt_class();
    __int16 v17 = [(SKPartitionTable *)v7 disk];
    v7->_mediaRef = (__MKMedia *)[v16 createMediaRefWithDisk:v17 error:a4];

    if (!v7->_mediaRef)
    {
      v19 = sub_10000DD48();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v24 = "-[SKPartitionTable initWithDisk:error:]";
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%s: Failed to create media ref", buf, 0xCu);
      }
      int v18 = 0;
      goto LABEL_16;
    }
  }
  int v18 = v7;
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
  id v5 = a3;
  int v12 = 0;
  if (MKCFCreateMedia())
  {
    [(SKPartitionTable *)self sectorSize];
    [(SKPartitionTable *)self sectorSize];
    id v11 = [(SKPartitionTable *)self mediaRef];
    MKCFCreateMap();
    [(SKPartitionTable *)self mediaRef];
    int v12 = MKCFWriteMedia();
    if (v12)
    {
      v10 = sub_10000DD48();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v14 = "-[SKPartitionTable writeNewMediaLayout:partitionScheme:]";
        __int16 v15 = 1024;
        int v16 = v12;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%s: Failed to write scheme, MK err %d", buf, 0x12u);
      }
    }
    MKCFDisposeMedia();
    BOOL v8 = v12 == 0;
  }
  else
  {
    id v6 = +[SKBaseManager sharedManager];
    [v6 logEvent:@"com.apple.StorageKit.log.fault" eventPayloadBuilder:&stru_1000495E8];

    id v7 = sub_10000DD48();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      v14 = "-[SKPartitionTable writeNewMediaLayout:partitionScheme:]";
      __int16 v15 = 1024;
      int v16 = v12;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_FAULT, "%s: Failed to create media, MK err %d", buf, 0x12u);
    }

    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)overwriteExistingMediaLayout:(id)a3 opts:(__CFDictionary *)a4 partitionScheme:(int)a5
{
  return [(SKPartitionTable *)self overwriteExistingMediaLayout:a3 opts:a4 partitionScheme:*(void *)&a5 size:0];
}

- (BOOL)overwriteExistingMediaLayout:(id)a3 opts:(__CFDictionary *)a4 partitionScheme:(int)a5 size:(unint64_t)a6
{
  id v7 = a3;
  int v17 = 0;
  [(SKPartitionTable *)self mediaRef];
  CFDictionaryRef v8 = (const __CFDictionary *)MKCFReadMedia();
  if (!v8)
  {
    v10 = sub_10000DD48();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v19 = "-[SKPartitionTable overwriteExistingMediaLayout:opts:partitionScheme:size:]";
      __int16 v20 = 1024;
      int v21 = v17;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%s: Failed to read media, MK err %d", buf, 0x12u);
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
    id v11 = +[SKBaseManager sharedManager];
    [v11 logEvent:@"com.apple.StorageKit.log.fault" eventPayloadBuilder:&stru_100049648];

    int v12 = sub_10000DD48();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      v19 = "-[SKPartitionTable overwriteExistingMediaLayout:opts:partitionScheme:size:]";
      __int16 v20 = 1024;
      int v21 = v17;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_FAULT, "%s: Failed to update scheme, MK err %d", buf, 0x12u);
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
    __int16 v15 = sub_10000DD48();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v19 = "-[SKPartitionTable overwriteExistingMediaLayout:opts:partitionScheme:size:]";
      __int16 v20 = 1024;
      int v21 = v17;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%s: Failed to write scheme, MK err %d", buf, 0x12u);
    }
  }
  MKCFDisposeMedia();
  BOOL v13 = v17 == 0;
LABEL_11:

  return v13;
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
  if (![(SKPartitionTable *)self allocateMediaRef:a4]) {
    return 0;
  }
  id v7 = [(SKPartitionTable *)self disk];
  unsigned int v8 = [v7 wipeDiskWithError:a4];

  if (!v8) {
    return 0;
  }
  v9 = objc_opt_new();
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  v10 = [(SKPartitionTable *)self partitions];
  id v11 = [v10 countByEnumeratingWithState:&v26 objects:v36 count:16];
  if (v11)
  {
    id v12 = v11;
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
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v27 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v17 = [*(id *)(*((void *)&v26 + 1) + 8 * i) buildWithScheme:v15 sectorSize:-[SKPartitionTable sectorSize](self, "sectorSize")];
        if (!v17)
        {
          __int16 v20 = [(SKPartitionTable *)self disk];
          v35 = v20;
          int v21 = +[NSArray arrayWithObjects:&v35 count:1];
          uint64_t v22 = 300;
          goto LABEL_23;
        }
        int v18 = (void *)v17;
        [v9 addObject:v17];
      }
      id v12 = [v10 countByEnumeratingWithState:&v26 objects:v36 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }

  CFStringRef v33 = @"Partitions";
  v34 = v9;
  v10 = +[NSDictionary dictionaryWithObjects:&v34 forKeys:&v33 count:1];
  if ([(SKPartitionTable *)self writeNewMediaLayout:v10 partitionScheme:a3])
  {
    [(SKPartitionTable *)self flushMediaRef];
    unsigned __int8 v19 = 1;
  }
  else
  {
    v23 = sub_10000DD48();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v32 = "-[SKPartitionTable writePartitionScheme:error:]";
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%s: Failed to write media on disk", buf, 0xCu);
    }

    __int16 v20 = [(SKPartitionTable *)self disk];
    v30 = v20;
    int v21 = +[NSArray arrayWithObjects:&v30 count:1];
    uint64_t v22 = 114;
LABEL_23:
    v24 = +[SKError errorWithCode:v22 disks:v21 userInfo:0];
    unsigned __int8 v19 = +[SKError failWithError:v24 error:a4];
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
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v11 = v8;
  id v12 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v24;
    while (2)
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v24 != v14) {
          objc_enumerationMutation(v11);
        }
        int v16 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        uint64_t v17 = [v16 objectForKeyedSubscript:@"Partition ID"];
        unsigned int v18 = [v17 isEqual:v9];

        if (v18)
        {
          [v16 setObject:v10 forKeyedSubscript:@"Type"];
          unsigned __int8 v20 = 1;
          unsigned __int8 v19 = v11;
          goto LABEL_11;
        }
      }
      id v13 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }

  unsigned __int8 v19 = +[NSString stringWithFormat:@"Couldn't find partition with ID %@", v9];
  unsigned __int8 v20 = +[SKError failWithSKErrorCode:117 debugDescription:v19 error:a6];
LABEL_11:

  return v20;
}

- (BOOL)overwritePartitionAt:(id)a3 filesystem:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if ([(SKPartitionTable *)self allocateMediaRef:a5])
  {
    [(SKPartitionTable *)self mediaRef];
    id v10 = MKCFReadMedia();
    id v11 = v10;
    if (!v10)
    {
      int v21 = sub_10000DD48();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v34 = "-[SKPartitionTable overwritePartitionAt:filesystem:error:]";
        __int16 v35 = 1024;
        int v36 = 0;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%s: Failed to read media, MK err %d", buf, 0x12u);
      }

      id v12 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:0 userInfo:0];
      unsigned __int8 v20 = +[SKError failWithError:v12 error:a5];
      goto LABEL_17;
    }
    id v12 = [v10 objectForKeyedSubscript:@"Schemes"];
    long long v28 = [v12 objectAtIndexedSubscript:0];
    v30 = [v28 objectForKeyedSubscript:@"Sections"];
    long long v29 = [v30 objectAtIndexedSubscript:0];
    id v13 = [v29 objectForKeyedSubscript:@"Partitions"];
    uint64_t v14 = [(SKPartitionTable *)self disk];
    uint64_t v15 = [v14 type];
    int v16 = sub_100023DD4(v15);

    if (v16 == 512)
    {
      MKCFDisposeMedia();
      uint64_t v17 = [(SKPartitionTable *)self disk];
      v32 = v17;
      unsigned int v18 = +[NSArray arrayWithObjects:&v32 count:1];
      unsigned __int8 v19 = +[SKError errorWithCode:117 disks:v18 userInfo:0];
      unsigned __int8 v20 = +[SKError failWithError:v19 error:a5];
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
          unsigned __int8 v20 = +[SKError failWithSKErrorCode:114 debugDescription:@"Failed to overwrite existing partition" error:a5];
        }
        else
        {
          [(SKPartitionTable *)self flushMediaRef];
          unsigned __int8 v20 = 1;
        }
        long long v26 = v28;
        goto LABEL_16;
      }
      unsigned __int8 v20 = 0;
    }
    long long v26 = v28;
    long long v25 = v29;
    long long v24 = v30;
LABEL_16:

LABEL_17:
    goto LABEL_18;
  }
  unsigned __int8 v20 = 0;
LABEL_18:

  return v20;
}

- (BOOL)fitToContainerSize:(unint64_t)a3 error:(id *)a4
{
  if (![(SKPartitionTable *)self allocateMediaRef:a4]) {
    return 0;
  }
  [(SKPartitionTable *)self mediaRef];
  id v7 = MKCFReadMedia();
  if (v7)
  {
    id v8 = [(SKPartitionTable *)self disk];
    id v9 = [v8 type];
    uint64_t v10 = sub_100023DD4(v9);

    if (v10 == 512)
    {
      MKCFDisposeMedia();
      id v11 = [(SKPartitionTable *)self disk];
      long long v26 = v11;
      id v12 = +[NSArray arrayWithObjects:&v26 count:1];
      id v13 = +[SKError errorWithCode:117 disks:v12 userInfo:0];
      unsigned __int8 v14 = +[SKError failWithError:v13 error:a4];
    }
    else
    {
      id v11 = [v7 objectForKeyedSubscript:@"Schemes"];
      int v16 = [v11 objectAtIndexedSubscript:0];
      uint64_t v17 = [v16 objectForKeyedSubscript:@"Sections"];
      unsigned int v18 = [v17 objectAtIndexedSubscript:0];
      unsigned __int8 v19 = [(SKPartitionTable *)self overwriteExistingMediaLayout:v18 opts:&off_10004BE78 partitionScheme:v10 size:a3 / [(SKPartitionTable *)self sectorSize]];
      MKCFDisposeMedia();
      if (v19)
      {
        [(SKPartitionTable *)self flushMediaRef];
        unsigned __int8 v14 = 1;
      }
      else
      {
        unsigned __int8 v20 = sub_10000DD48();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          long long v28 = "-[SKPartitionTable fitToContainerSize:error:]";
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%s: Failed to fit existing partition", buf, 0xCu);
        }

        int v21 = [(SKPartitionTable *)self disk];
        long long v25 = v21;
        uint64_t v22 = +[NSArray arrayWithObjects:&v25 count:1];
        long long v23 = +[SKError errorWithCode:114 disks:v22 userInfo:0];
        unsigned __int8 v14 = +[SKError failWithError:v23 error:a4];
      }
    }
  }
  else
  {
    uint64_t v15 = sub_10000DD48();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      long long v28 = "-[SKPartitionTable fitToContainerSize:error:]";
      __int16 v29 = 1024;
      int v30 = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%s: Failed to read media, MK err %d", buf, 0x12u);
    }

    id v11 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:0 userInfo:0];
    unsigned __int8 v14 = +[SKError failWithError:v11 error:a4];
  }

  return v14;
}

- (BOOL)resizePartitionID:(id)a3 size:(unint64_t)a4 offset:(unint64_t)a5 error:(id *)a6
{
  id v50 = a3;
  if ([(SKPartitionTable *)self allocateMediaRef:a6])
  {
    int v55 = 0;
    [(SKPartitionTable *)self mediaRef];
    id v8 = MKCFReadMedia();
    id v9 = v8;
    if (!v8)
    {
      int v21 = sub_10000DD48();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v62 = "-[SKPartitionTable resizePartitionID:size:offset:error:]";
        __int16 v63 = 1024;
        int v64 = v55;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%s: Failed to read media, MK err %d", buf, 0x12u);
      }

      uint64_t v10 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:v55 userInfo:0];
      unsigned __int8 v20 = +[SKError failWithError:v10 error:a6];
      goto LABEL_26;
    }
    uint64_t v10 = [v8 objectForKeyedSubscript:@"Schemes"];
    id v11 = [v10 objectAtIndexedSubscript:0];
    id v12 = [v11 objectForKeyedSubscript:@"Sections"];
    v46 = [v12 objectAtIndexedSubscript:0];
    id v13 = [v46 objectForKeyedSubscript:@"Partitions"];
    unsigned __int8 v14 = [(SKPartitionTable *)self disk];
    uint64_t v15 = [v14 type];
    unsigned int v16 = sub_100023DD4(v15);

    v47 = v13;
    if (v16 == 512)
    {
      MKCFDisposeMedia();
      uint64_t v17 = [(SKPartitionTable *)self disk];
      v60 = v17;
      unsigned int v18 = +[NSArray arrayWithObjects:&v60 count:1];
      unsigned __int8 v19 = +[SKError errorWithCode:117 disks:v18 userInfo:0];
      unsigned __int8 v20 = +[SKError failWithError:v19 error:a6];
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
      id v23 = [v22 countByEnumeratingWithState:&v51 objects:v59 count:16];
      if (v23)
      {
        id v24 = v23;
        uint64_t v25 = *(void *)v52;
        do
        {
          for (i = 0; i != v24; i = (char *)i + 1)
          {
            if (*(void *)v52 != v25) {
              objc_enumerationMutation(v22);
            }
            long long v27 = *(void **)(*((void *)&v51 + 1) + 8 * i);
            id v28 = [v27 mutableCopy];
            __int16 v29 = [v27 objectForKeyedSubscript:@"Partition ID"];
            unsigned int v30 = [v29 isEqualToNumber:v50];

            if (v30)
            {
              int v31 = +[NSNumber numberWithUnsignedLongLong:a4 / [(SKPartitionTable *)self sectorSize]];
              [v28 setObject:v31 forKeyedSubscript:@"Size"];

              if (a5)
              {
                v32 = +[NSNumber numberWithUnsignedLongLong:a5 / [(SKPartitionTable *)self sectorSize]];
                [v28 setObject:v32 forKeyedSubscript:@"Offset"];
              }
            }
            [v17 addObject:v28];
          }
          id v24 = [v22 countByEnumeratingWithState:&v51 objects:v59 count:16];
        }
        while (v24);
      }

      CFStringRef v57 = @"Partitions";
      v58 = v17;
      unsigned int v18 = +[NSDictionary dictionaryWithObjects:&v58 forKeys:&v57 count:1];
      unsigned __int8 v33 = [(SKPartitionTable *)self overwriteExistingMediaLayout:v18 opts:&off_10004BEC8 partitionScheme:v44];
      id v9 = v45;
      MKCFDisposeMedia();
      if ((v33 & 1) == 0)
      {
        __int16 v35 = sub_10000DD48();
        id v12 = v41;
        v34 = v46;
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          v62 = "-[SKPartitionTable resizePartitionID:size:offset:error:]";
          _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "%s: Failed to overwrite existing partition", buf, 0xCu);
        }

        int v36 = [(SKPartitionTable *)self disk];
        v56 = v36;
        v37 = +[NSArray arrayWithObjects:&v56 count:1];
        v38 = +[SKError errorWithCode:114 disks:v37 userInfo:0];
        unsigned __int8 v20 = +[SKError failWithError:v38 error:v40];

        id v11 = v42;
        uint64_t v10 = v43;
        goto LABEL_25;
      }
      [(SKPartitionTable *)self flushMediaRef];
      unsigned __int8 v20 = 1;
      uint64_t v10 = v43;
      id v12 = v41;
    }
    v34 = v46;
LABEL_25:

LABEL_26:
    goto LABEL_27;
  }
  unsigned __int8 v20 = 0;
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