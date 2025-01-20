@interface SKEraseDisk
+ (BOOL)supportsSecureCoding;
+ (id)eraseDiskWithRootDisk:(id)a3 descriptors:(id)a4 error:(id *)a5;
+ (id)eraseDiskWithRootDisk:(id)a3 error:(id *)a4;
- (BOOL)forceUnmount;
- (NSArray)descriptors;
- (NSDictionary)diskRepresentation;
- (NSString)description;
- (SKDisk)disk;
- (SKEraseDisk)initWithCoder:(id)a3;
- (SKEraseDisk)initWithRootDisk:(id)a3 descriptors:(id)a4 error:(id *)a5;
- (SKProgress)progress;
- (id)eraseProgressReportingWithCompletionBlock:(id)a3;
- (id)formattableFilesystems;
- (id)validateWithError:(id *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)eraseWithCompletionBlock:(id)a3;
- (void)setDescriptors:(id)a3;
- (void)setDisk:(id)a3;
- (void)setDiskRepresentation:(id)a3;
- (void)setForceUnmount:(BOOL)a3;
- (void)setProgress:(id)a3;
@end

@implementation SKEraseDisk

- (SKEraseDisk)initWithRootDisk:(id)a3 descriptors:(id)a4 error:(id *)a5
{
  v27[1] = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  v26.receiver = self;
  v26.super_class = (Class)SKEraseDisk;
  v11 = [(SKEraseDisk *)&v26 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_disk, a3);
    if (!v10)
    {
      v13 = [(SKEraseDisk *)v12 formattableFilesystems];
      v14 = [v13 firstObject];

      v15 = [v14 majorType];
      int v16 = [v15 isEqualToString:@"msdos"];

      if (v16) {
        v17 = @"NO NAME";
      }
      else {
        v17 = @"Untitled";
      }
      v18 = +[SKVolumeDescriptor descriptorWithName:v17 filesystem:v14];
      v19 = +[SKPartitionDescriptor descriptorWithVolume:v18];
      v27[0] = v19;
      id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:1];
    }
    objc_storeStrong((id *)&v12->_descriptors, v10);
    uint64_t v20 = [v9 minimalDictionaryRepresentation];
    diskRepresentation = v12->_diskRepresentation;
    v12->_diskRepresentation = (NSDictionary *)v20;

    uint64_t v22 = +[SKProgress progressWithTotalUnitCount:100];
    progress = v12->_progress;
    v12->_progress = (SKProgress *)v22;
  }
  v24 = [(SKEraseDisk *)v12 validateWithError:a5];

  return v24;
}

+ (id)eraseDiskWithRootDisk:(id)a3 descriptors:(id)a4 error:(id *)a5
{
  id v7 = a4;
  id v8 = a3;
  id v9 = (void *)[objc_alloc((Class)objc_opt_class()) initWithRootDisk:v8 descriptors:v7 error:a5];

  return v9;
}

+ (id)eraseDiskWithRootDisk:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = (void *)[objc_alloc((Class)objc_opt_class()) initWithRootDisk:v5 descriptors:0 error:a4];

  return v6;
}

- (void)eraseWithCompletionBlock:(id)a3
{
  v3 = [(SKEraseDisk *)self eraseProgressReportingWithCompletionBlock:a3];
}

- (id)eraseProgressReportingWithCompletionBlock:(id)a3
{
  v18[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = +[SKProgress progressWithTotalUnitCount:100];
  [v5 setCancellable:0];
  v17 = @"kSKDiskMountOptionForce";
  v6 = objc_msgSend(NSNumber, "numberWithBool:", -[SKEraseDisk forceUnmount](self, "forceUnmount"));
  v18[0] = v6;
  id v7 = [NSDictionary dictionaryWithObjects:v18 forKeys:&v17 count:1];

  id v8 = [(SKEraseDisk *)self disk];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __57__SKEraseDisk_eraseProgressReportingWithCompletionBlock___block_invoke;
  v14[3] = &unk_26506C028;
  id v16 = v4;
  v14[4] = self;
  id v9 = v5;
  id v15 = v9;
  id v10 = v4;
  [v8 unmountWithOptions:v7 completionBlock:v14];

  v11 = v15;
  id v12 = v9;

  return v12;
}

void __57__SKEraseDisk_eraseProgressReportingWithCompletionBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    v3 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v3();
  }
  else
  {
    id v4 = +[SKHelperClient sharedClient];
    id v5 = [v4 eraseWithEraser:*(void *)(a1 + 32) completionBlock:*(void *)(a1 + 48)];

    [*(id *)(a1 + 40) setCompletedUnitCount:10];
    [*(id *)(a1 + 40) chainChildProgress:v5 withPendingUnitCount:90];
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  v6 = [(SKEraseDisk *)self disk];
  id v7 = [(SKEraseDisk *)self descriptors];
  id v8 = [v3 stringWithFormat:@"<%@: { disk: \"%@\", descriptors: \"%@\"}>", v5, v6, v7];

  return (NSString *)v8;
}

- (id)formattableFilesystems
{
  v2 = [(SKEraseDisk *)self disk];
  v3 = [v2 formattableFilesystems];

  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(SKEraseDisk *)self diskRepresentation];
  [v4 encodeObject:v5 forKey:@"diskRepresentation"];

  id v6 = [(SKEraseDisk *)self descriptors];
  [v4 encodeObject:v6 forKey:@"descriptors"];
}

- (SKEraseDisk)initWithCoder:(id)a3
{
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)SKEraseDisk;
  id v5 = [(SKEraseDisk *)&v29 init];
  if (v5)
  {
    v28 = (void *)MEMORY[0x263EFFA08];
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    v14 = objc_msgSend(v28, "setWithObjects:", v6, v7, v8, v9, v10, v11, v12, v13, objc_opt_class(), 0);
    uint64_t v15 = [v4 decodeObjectOfClasses:v14 forKey:@"diskRepresentation"];
    diskRepresentation = v5->_diskRepresentation;
    v5->_diskRepresentation = (NSDictionary *)v15;

    v17 = (void *)MEMORY[0x263EFFA08];
    uint64_t v18 = objc_opt_class();
    v19 = objc_msgSend(v17, "setWithObjects:", v18, objc_opt_class(), 0);
    uint64_t v20 = [v4 decodeObjectOfClasses:v19 forKey:@"descriptors"];
    descriptors = v5->_descriptors;
    v5->_descriptors = (NSArray *)v20;

    uint64_t v22 = +[SKBaseManager sharedManager];
    uint64_t v23 = [v22 knownDiskForDictionary:v5->_diskRepresentation];
    disk = v5->_disk;
    v5->_disk = (SKDisk *)v23;

    uint64_t v25 = +[SKProgress progressWithTotalUnitCount:100];
    progress = v5->_progress;
    v5->_progress = (SKProgress *)v25;
  }
  return v5;
}

- (id)validateWithError:(id *)a3
{
  uint64_t v63 = *MEMORY[0x263EF8340];
  id v5 = [(SKEraseDisk *)self disk];

  if (!v5)
  {
    v19 = SKGetOSLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = [(SKEraseDisk *)self disk];
      *(_DWORD *)v61 = 136315394;
      *(void *)&v61[4] = "-[SKEraseDisk validateWithError:]";
      *(_WORD *)&v61[12] = 2112;
      *(void *)&v61[14] = v20;
      _os_log_impl(&dword_23F40C000, v19, OS_LOG_TYPE_ERROR, "%s: Disk %@ not valid for erase", v61, 0x16u);
    }
    uint64_t v21 = +[SKError nilWithPOSIXCode:22 error:a3];
    goto LABEL_18;
  }
  uint64_t v6 = [(SKEraseDisk *)self disk];
  char v7 = [v6 canPartitionDisk];

  if ((v7 & 1) == 0)
  {
    uint64_t v22 = SKGetOSLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      uint64_t v23 = [(SKEraseDisk *)self disk];
      *(_DWORD *)v61 = 136315394;
      *(void *)&v61[4] = "-[SKEraseDisk validateWithError:]";
      *(_WORD *)&v61[12] = 2112;
      *(void *)&v61[14] = v23;
      _os_log_impl(&dword_23F40C000, v22, OS_LOG_TYPE_ERROR, "%s: Disk %@ not valid for erase, should be whole disk not APFSContainer", v61, 0x16u);
    }
    uint64_t v21 = +[SKError nilWithPOSIXCode:45 error:a3];
    goto LABEL_18;
  }
  uint64_t v8 = [(SKEraseDisk *)self descriptors];
  if (!v8
    || ([(SKEraseDisk *)self descriptors],
        uint64_t v9 = objc_claimAutoreleasedReturnValue(),
        uint64_t v10 = [v9 count],
        v9,
        v8,
        !v10))
  {
    v24 = SKGetOSLog();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v61 = 136315138;
      *(void *)&v61[4] = "-[SKEraseDisk validateWithError:]";
      _os_log_impl(&dword_23F40C000, v24, OS_LOG_TYPE_ERROR, "%s: Missing partition descriptors for erase disk", v61, 0xCu);
    }

    uint64_t v21 = +[SKError nilWithPOSIXCode:22 error:a3];
LABEL_18:
    uint64_t v25 = (void *)v21;
    goto LABEL_19;
  }
  *(void *)v61 = 0;
  *(void *)&v61[8] = v61;
  *(void *)&v61[16] = 0x2020000000;
  uint64_t v62 = 0;
  uint64_t v11 = [(SKEraseDisk *)self descriptors];
  v53[0] = MEMORY[0x263EF8330];
  v53[1] = 3221225472;
  v53[2] = __33__SKEraseDisk_validateWithError___block_invoke;
  v53[3] = &unk_26506C050;
  v53[4] = v61;
  [v11 enumerateObjectsUsingBlock:v53];

  unint64_t v12 = *(void *)(*(void *)&v61[8] + 24);
  uint64_t v13 = [(SKEraseDisk *)self disk];
  LOBYTE(v12) = v12 > [v13 unformattedSize];

  if (v12)
  {
    v14 = SKGetOSLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = *(void **)(*(void *)&v61[8] + 24);
      id v16 = [(SKEraseDisk *)self disk];
      uint64_t v17 = [v16 unformattedSize];
      *(_DWORD *)buf = 136315650;
      v56 = "-[SKEraseDisk validateWithError:]";
      __int16 v57 = 2048;
      v58 = v15;
      __int16 v59 = 2048;
      uint64_t v60 = v17;
      _os_log_impl(&dword_23F40C000, v14, OS_LOG_TYPE_ERROR, "%s: New size %lu exceeds %llu", buf, 0x20u);
    }
    uint64_t v18 = +[SKError nilWithPOSIXCode:28 error:a3];
    goto LABEL_39;
  }
  for (unint64_t i = 0; ; ++i)
  {
    v28 = [(SKEraseDisk *)self descriptors];
    BOOL v29 = [v28 count] - 1 > i;

    if (!v29) {
      break;
    }
    v30 = [(SKEraseDisk *)self descriptors];
    v31 = [v30 objectAtIndexedSubscript:i];
    BOOL v32 = [v31 size] == 0;

    if (v32)
    {
      v43 = SKGetOSLog();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v56 = "-[SKEraseDisk validateWithError:]";
        __int16 v57 = 1024;
        LODWORD(v58) = i;
        _os_log_impl(&dword_23F40C000, v43, OS_LOG_TYPE_ERROR, "%s: Non last descriptor %d zero size", buf, 0x12u);
      }

      uint64_t v18 = +[SKError nilWithPOSIXCode:22 error:a3];
      goto LABEL_39;
    }
  }
  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  v33 = [(SKEraseDisk *)self descriptors];
  uint64_t v34 = [v33 countByEnumeratingWithState:&v49 objects:v54 count:16];
  obuint64_t j = v33;
  if (!v34) {
    goto LABEL_35;
  }
  uint64_t v35 = *(void *)v50;
  while (2)
  {
    for (uint64_t j = 0; j != v34; ++j)
    {
      if (*(void *)v50 != v35) {
        objc_enumerationMutation(obj);
      }
      v37 = *(void **)(*((void *)&v49 + 1) + 8 * j);
      v38 = [(SKEraseDisk *)self disk];
      v39 = [v37 filesystem];
      v40 = [v38 formattableFilesystemWithFilesystem:v39];

      if (!v40)
      {
        v44 = SKGetOSLog();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
        {
          v45 = [v37 filesystem];
          v46 = [(SKEraseDisk *)self formattableFilesystems];
          *(_DWORD *)buf = 136315650;
          v56 = "-[SKEraseDisk validateWithError:]";
          __int16 v57 = 2112;
          v58 = v45;
          __int16 v59 = 2112;
          uint64_t v60 = (uint64_t)v46;
          _os_log_impl(&dword_23F40C000, v44, OS_LOG_TYPE_ERROR, "%s: FS to format %@ not found in supported filesystems %@", buf, 0x20u);
        }
        uint64_t v47 = 45;
        goto LABEL_45;
      }
      v41 = [v37 innerDescriptor];
      [v41 setFilesystem:v40];

      v42 = [v37 innerDescriptor];
      LODWORD(v41) = [v42 validateForErase];

      if (!v41)
      {
        uint64_t v47 = 22;
LABEL_45:
        uint64_t v25 = +[SKError nilWithPOSIXCode:v47 error:a3];

        goto LABEL_40;
      }
    }
    uint64_t v34 = [obj countByEnumeratingWithState:&v49 objects:v54 count:16];
    if (v34) {
      continue;
    }
    break;
  }
LABEL_35:

  uint64_t v18 = self;
LABEL_39:
  uint64_t v25 = v18;
LABEL_40:
  _Block_object_dispose(v61, 8);
LABEL_19:

  return v25;
}

uint64_t __33__SKEraseDisk_validateWithError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 size];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += result;
  return result;
}

- (SKDisk)disk
{
  return self->_disk;
}

- (void)setDisk:(id)a3
{
}

- (NSArray)descriptors
{
  return self->_descriptors;
}

- (void)setDescriptors:(id)a3
{
}

- (BOOL)forceUnmount
{
  return self->_forceUnmount;
}

- (void)setForceUnmount:(BOOL)a3
{
  self->_forceUnmount = a3;
}

- (SKProgress)progress
{
  return self->_progress;
}

- (void)setProgress:(id)a3
{
}

- (NSDictionary)diskRepresentation
{
  return self->_diskRepresentation;
}

- (void)setDiskRepresentation:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_diskRepresentation, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_descriptors, 0);

  objc_storeStrong((id *)&self->_disk, 0);
}

@end