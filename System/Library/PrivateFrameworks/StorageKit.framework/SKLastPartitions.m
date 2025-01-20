@interface SKLastPartitions
+ (unint64_t)hfsMinimalSizeForDisk:(id)a3 currentSize:(unint64_t *)a4;
+ (unint64_t)secondaryPartitionTableSizeWithDiskType:(id)a3;
- (SKDisk)recoveryPart;
- (SKDisk)resizablePart;
- (SKLastPartitions)initWithDisk:(id)a3;
- (unint64_t)nonResizableSize;
@end

@implementation SKLastPartitions

- (SKLastPartitions)initWithDisk:(id)a3
{
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)SKLastPartitions;
  v5 = [(SKLastPartitions *)&v27 init];
  if (!v5) {
    goto LABEL_11;
  }
  v6 = [v4 children];
  v7 = v6;
  if (v6 && [v6 count])
  {
    resizablePart = [v7 lastObject];
    p_resizablePart = (void **)&v5->_resizablePart;
    objc_storeStrong((id *)&v5->_resizablePart, resizablePart);
    if ((unint64_t)[v7 count] >= 2)
    {
      v10 = [resizablePart ioContent];
      int v11 = [v10 isEqualToString:@"Apple_APFS_Recovery"];

      if (v11)
      {
        v12 = resizablePart;
        recoveryPart = v5->_recoveryPart;
        v5->_recoveryPart = v12;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_19;
        }
        v20 = [resizablePart container];
        recoveryPart = v20;
        if (v20)
        {
          v21 = [(SKDisk *)v20 volumes];
          if ([v21 count] == 1)
          {
            v22 = [v21 objectAtIndexedSubscript:0];
            v23 = [v22 getAPFSVolumeRole];
            int v24 = [v23 isEqualToString:SKAPFSVolumeRoleRecovery];

            if (v24) {
              objc_storeStrong((id *)&v5->_recoveryPart, resizablePart);
            }
          }
        }
      }

LABEL_19:
      if (v5->_recoveryPart)
      {
        uint64_t v25 = objc_msgSend(v7, "objectAtIndexedSubscript:", objc_msgSend(v7, "count") - 2);
        v26 = *p_resizablePart;
        *p_resizablePart = (void *)v25;
      }
    }
  }
  else
  {
    v14 = (SKDisk *)v4;
    resizablePart = v5->_resizablePart;
    v5->_resizablePart = v14;
  }

  uint64_t v15 = [(SKDisk *)v5->_resizablePart startLocation];
  v16 = objc_opt_class();
  v17 = [v4 type];
  v5->_nonResizableSize = [v16 secondaryPartitionTableSizeWithDiskType:v17] + v15;

  v18 = v5->_recoveryPart;
  if (v18) {
    v5->_nonResizableSize += [(SKDisk *)v18 unformattedSize];
  }

LABEL_11:
  return v5;
}

+ (unint64_t)secondaryPartitionTableSizeWithDiskType:(id)a3
{
  if ([a3 isEqualToString:kSKDiskTypeGPTWholeDisk[0]]) {
    return 20480;
  }
  else {
    return 0;
  }
}

+ (unint64_t)hfsMinimalSizeForDisk:(id)a3 currentSize:(unint64_t *)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = [v5 type];
  char v7 = [v6 isEqualToString:kSKDiskTypeHFS[0]];

  if (v7)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    id v18 = 0;
    v8 = +[SKPartitionTable createMediaRefWithDisk:v5 error:&v18];
    id v9 = v18;
    if (v8)
    {
      int v10 = MKHFSGetResizeLimits();
      CFRelease(v8);
      if (!v10)
      {
        unsigned int v16 = [v5 getSectorSize];
        if (a4) {
          *a4 = v19 * v16;
        }
        unint64_t v15 = v20 * v16;
        goto LABEL_14;
      }
      int v11 = SKGetOSLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v22 = "+[SKLastPartitions hfsMinimalSizeForDisk:currentSize:]";
        __int16 v23 = 2112;
        id v24 = v5;
        __int16 v25 = 1024;
        LODWORD(v26) = v10;
        v12 = "%s: Failed to get size from %@, %d";
        v13 = v11;
        uint32_t v14 = 28;
LABEL_9:
        _os_log_impl(&dword_23F40C000, v13, OS_LOG_TYPE_ERROR, v12, buf, v14);
      }
    }
    else
    {
      int v11 = SKGetOSLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v22 = "+[SKLastPartitions hfsMinimalSizeForDisk:currentSize:]";
        __int16 v23 = 2112;
        id v24 = v5;
        __int16 v25 = 2112;
        id v26 = v9;
        v12 = "%s: Failed to read media from %@, %@";
        v13 = v11;
        uint32_t v14 = 32;
        goto LABEL_9;
      }
    }

    unint64_t v15 = [v5 totalSpace];
LABEL_14:

    goto LABEL_15;
  }
  unint64_t v15 = [v5 totalSpace];
LABEL_15:

  return v15;
}

- (SKDisk)resizablePart
{
  return self->_resizablePart;
}

- (SKDisk)recoveryPart
{
  return self->_recoveryPart;
}

- (unint64_t)nonResizableSize
{
  return self->_nonResizableSize;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recoveryPart, 0);

  objc_storeStrong((id *)&self->_resizablePart, 0);
}

@end