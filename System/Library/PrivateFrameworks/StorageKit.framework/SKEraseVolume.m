@interface SKEraseVolume
+ (BOOL)supportsSecureCoding;
+ (id)eraseVolumeWithAPFSContainerDisk:(id)a3 descriptor:(id)a4 error:(id *)a5;
+ (id)eraseVolumeWithAPFSStoreDisk:(id)a3 descriptor:(id)a4 error:(id *)a5;
+ (id)eraseVolumeWithChildDisk:(id)a3 descriptor:(id)a4 error:(id *)a5;
+ (id)eraseVolumeWithChildDisk:(id)a3 error:(id *)a4;
- (BOOL)forceUnmount;
- (NSDictionary)diskRepresentation;
- (NSString)description;
- (SKDisk)disk;
- (SKEraseVolume)initWithChildDisk:(id)a3 descriptor:(id)a4 error:(id *)a5;
- (SKEraseVolume)initWithCoder:(id)a3;
- (SKProgress)progress;
- (SKVolumeDescriptor)descriptor;
- (id)eraseProgressReportingWithCompletionBlock:(id)a3;
- (id)formattableFilesystems;
- (id)validateWithError:(id *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)eraseWithCompletionBlock:(id)a3;
- (void)setDescriptor:(id)a3;
- (void)setDisk:(id)a3;
- (void)setDiskRepresentation:(id)a3;
- (void)setForceUnmount:(BOOL)a3;
- (void)setProgress:(id)a3;
@end

@implementation SKEraseVolume

- (SKEraseVolume)initWithChildDisk:(id)a3 descriptor:(id)a4 error:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  v30.receiver = self;
  v30.super_class = (Class)SKEraseVolume;
  v11 = [(SKEraseVolume *)&v30 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_disk, a3);
    if (!v10)
    {
      v13 = [(SKEraseVolume *)v12 formattableFilesystems];
      v14 = [(SKEraseVolume *)v12 formattableFilesystems];
      v15 = [v14 firstObject];

      v16 = [v9 filesystem];

      if (v16)
      {
        v17 = (void *)MEMORY[0x263F08A98];
        v28[0] = MEMORY[0x263EF8330];
        v28[1] = 3221225472;
        v28[2] = __52__SKEraseVolume_initWithChildDisk_descriptor_error___block_invoke;
        v28[3] = &unk_26506BFD8;
        id v29 = v9;
        v18 = [v17 predicateWithBlock:v28];
        v19 = [v13 filteredArrayUsingPredicate:v18];

        if ([v19 count])
        {
          uint64_t v20 = [v19 firstObject];

          v15 = (void *)v20;
        }
      }
      v21 = [v9 volumeName];
      id v10 = +[SKVolumeDescriptor descriptorWithName:v21 filesystem:v15];
    }
    objc_storeStrong((id *)&v12->_descriptor, v10);
    uint64_t v22 = [v9 minimalDictionaryRepresentation];
    diskRepresentation = v12->_diskRepresentation;
    v12->_diskRepresentation = (NSDictionary *)v22;

    uint64_t v24 = +[SKProgress progressWithTotalUnitCount:100];
    progress = v12->_progress;
    v12->_progress = (SKProgress *)v24;
  }
  v26 = [(SKEraseVolume *)v12 validateWithError:a5];

  return v26;
}

uint64_t __52__SKEraseVolume_initWithChildDisk_descriptor_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 majorType];
  v5 = [*(id *)(a1 + 32) filesystem];
  v6 = [v5 majorType];
  if ([v4 isEqualToString:v6])
  {
    int v7 = [v3 isCaseSensitive];
    v8 = [*(id *)(a1 + 32) filesystem];
    if (v7 == [v8 isCaseSensitive])
    {
      int v10 = [v3 isEncrypted];
      v11 = [*(id *)(a1 + 32) filesystem];
      uint64_t v9 = v10 ^ [v11 isEncrypted] ^ 1;
    }
    else
    {
      uint64_t v9 = 0;
    }
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

+ (id)eraseVolumeWithChildDisk:(id)a3 descriptor:(id)a4 error:(id *)a5
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_8;
  }
  id v9 = v7;
  int v10 = [v9 container];
  v11 = v10;
  if (!v10
    || ([v10 volumes],
        v12 = objc_claimAutoreleasedReturnValue(),
        unint64_t v13 = [v12 count],
        v12,
        v13 < 2))
  {

LABEL_8:
    v17 = (void *)[objc_alloc((Class)objc_opt_class()) initWithChildDisk:v7 descriptor:v8 error:a5];
    goto LABEL_9;
  }
  v14 = SKGetOSLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    int v19 = 136315394;
    uint64_t v20 = "+[SKEraseVolume eraseVolumeWithChildDisk:descriptor:error:]";
    __int16 v21 = 2112;
    id v22 = v9;
    _os_log_impl(&dword_23F40C000, v14, OS_LOG_TYPE_ERROR, "%s: More than 1 volume on %@ physical store", (uint8_t *)&v19, 0x16u);
  }

  v15 = [v11 volumes];
  v16 = +[SKError errorWithCode:301 disks:v15 userInfo:MEMORY[0x263EFFA78]];
  v17 = +[SKError nilWithError:v16 error:a5];

LABEL_9:

  return v17;
}

+ (id)eraseVolumeWithChildDisk:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = (void *)[objc_alloc((Class)objc_opt_class()) initWithChildDisk:v5 descriptor:0 error:a4];

  return v6;
}

+ (id)eraseVolumeWithAPFSStoreDisk:(id)a3 descriptor:(id)a4 error:(id *)a5
{
  id v7 = a4;
  id v8 = a3;
  id v9 = (void *)[objc_alloc((Class)objc_opt_class()) initWithChildDisk:v8 descriptor:v7 error:a5];

  return v9;
}

+ (id)eraseVolumeWithAPFSContainerDisk:(id)a3 descriptor:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [v7 designatedPhysicalStore];

  if (v9)
  {
    int v10 = objc_opt_class();
    v11 = [v7 designatedPhysicalStore];
    [v10 eraseVolumeWithAPFSStoreDisk:v11 descriptor:v8 error:a5];
  }
  else
  {
    v11 = +[SKError errorWithCode:117 userInfo:0];
    +[SKError nilWithError:v11 error:a5];
  v12 = };

  return v12;
}

- (void)setDisk:(id)a3
{
  objc_storeStrong((id *)&self->_disk, a3);
  id v7 = a3;
  id v5 = [v7 minimalDictionaryRepresentation];
  diskRepresentation = self->_diskRepresentation;
  self->_diskRepresentation = v5;
}

- (void)eraseWithCompletionBlock:(id)a3
{
  id v3 = [(SKEraseVolume *)self eraseProgressReportingWithCompletionBlock:a3];
}

- (id)eraseProgressReportingWithCompletionBlock:(id)a3
{
  v20[3] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = +[SKProgress progressWithTotalUnitCount:100];
  [v5 setCancellable:0];
  v6 = [(SKEraseVolume *)self descriptor];
  char v7 = [v6 validateForErase];

  if (v7)
  {
    v19[0] = kSKAPFSDiskUnmountIgnoreGroup;
    v19[1] = @"kSKDiskMountOptionRecursive";
    v20[0] = MEMORY[0x263EFFA88];
    v20[1] = MEMORY[0x263EFFA88];
    v19[2] = @"kSKDiskMountOptionForce";
    id v8 = objc_msgSend(NSNumber, "numberWithBool:", -[SKEraseVolume forceUnmount](self, "forceUnmount"));
    v20[2] = v8;
    id v9 = [NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:3];

    int v10 = [(SKEraseVolume *)self disk];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __59__SKEraseVolume_eraseProgressReportingWithCompletionBlock___block_invoke;
    v16[3] = &unk_26506C028;
    id v18 = v4;
    v16[4] = self;
    id v11 = v5;
    id v17 = v11;
    [v10 unmountWithOptions:v9 completionBlock:v16];

    v12 = v17;
    id v13 = v11;
  }
  else
  {
    v14 = +[SKError errorWithPOSIXCode:22 error:0];
    (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v14);
  }

  return v5;
}

void __59__SKEraseVolume_eraseProgressReportingWithCompletionBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    id v3 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v3();
  }
  else
  {
    id v4 = +[SKHelperClient sharedClient];
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v8 = MEMORY[0x263EF8330];
    uint64_t v9 = 3221225472;
    int v10 = __59__SKEraseVolume_eraseProgressReportingWithCompletionBlock___block_invoke_2;
    id v11 = &unk_26506C000;
    id v6 = *(id *)(a1 + 48);
    uint64_t v12 = *(void *)(a1 + 32);
    id v13 = v6;
    char v7 = [v4 eraseWithEraser:v5 completionBlock:&v8];

    objc_msgSend(*(id *)(a1 + 40), "setCompletedUnitCount:", 10, v8, v9, v10, v11);
    [*(id *)(a1 + 40) chainChildProgress:v7 withPendingUnitCount:90];
  }
}

void __59__SKEraseVolume_eraseProgressReportingWithCompletionBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    char v7 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    if (!v5)
    {
      uint64_t v12 = *(void *)(a1 + 40);
      id v13 = +[SKError errorWithCode:117 disks:MEMORY[0x263EFFA68] userInfo:0];
      (*(void (**)(uint64_t, void, void *))(v12 + 16))(v12, 0, v13);

      goto LABEL_13;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v8 = [v5 container];
      uint64_t v9 = [v8 volumes];
      if ([v9 count])
      {
        uint64_t v10 = [v9 objectAtIndexedSubscript:0];

        id v11 = SKGetOSLog();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          int v19 = 136315394;
          uint64_t v20 = "-[SKEraseVolume eraseProgressReportingWithCompletionBlock:]_block_invoke";
          __int16 v21 = 2112;
          uint64_t v22 = v10;
          _os_log_impl(&dword_23F40C000, v11, OS_LOG_TYPE_DEFAULT, "%s: The new APFS volume is: %@", (uint8_t *)&v19, 0x16u);
        }
        id v5 = (id)v10;
      }
      else
      {
        if (![v8 isLiveFSAPFSDisk]
          || ([*(id *)(a1 + 32) descriptor],
              v14 = objc_claimAutoreleasedReturnValue(),
              [v14 filesystem],
              v15 = objc_claimAutoreleasedReturnValue(),
              int v16 = [v15 isEncrypted],
              v15,
              v14,
              !v16))
        {
          uint64_t v17 = *(void *)(a1 + 40);
          id v18 = +[SKError errorWithCode:117 debugDescription:@"No APFS volumes found after erase" error:0];
          (*(void (**)(uint64_t, void, void *))(v17 + 16))(v17, 0, v18);

          goto LABEL_12;
        }
        id v11 = SKGetOSLog();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          int v19 = 136315394;
          uint64_t v20 = "-[SKEraseVolume eraseProgressReportingWithCompletionBlock:]_block_invoke_2";
          __int16 v21 = 2112;
          uint64_t v22 = (uint64_t)v5;
          _os_log_impl(&dword_23F40C000, v11, OS_LOG_TYPE_DEFAULT, "%s: Volume was formatted to encrypted APFS, returning %@", (uint8_t *)&v19, 0x16u);
        }
      }
    }
    char v7 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v7();
LABEL_12:

LABEL_13:
}

- (NSString)description
{
  id v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  id v6 = [(SKEraseVolume *)self disk];
  char v7 = [(SKEraseVolume *)self descriptor];
  uint64_t v8 = [v3 stringWithFormat:@"<%@: { disk: \"%@\", descriptor: \"%@\"}>", v5, v6, v7];

  return (NSString *)v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(SKEraseVolume *)self descriptor];
  [v4 encodeObject:v5 forKey:@"descriptor"];

  id v6 = [(SKEraseVolume *)self diskRepresentation];
  [v4 encodeObject:v6 forKey:@"diskRepresentation"];
}

- (id)formattableFilesystems
{
  id v3 = [(SKEraseVolume *)self disk];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_5:

    goto LABEL_6;
  }
  id v4 = [(SKEraseVolume *)self disk];
  int v5 = [v4 isLiveFSAPFSDisk];

  if (v5)
  {
    id v3 = [(SKEraseVolume *)self disk];
    if ([v3 hasVolumeSiblings])
    {
      id v6 = +[SKFilesystem extensionFilesystems];
      char v7 = [MEMORY[0x263F08A98] predicateWithBlock:&__block_literal_global_140];
      uint64_t v8 = [v6 filteredArrayUsingPredicate:v7];

      goto LABEL_7;
    }
    goto LABEL_5;
  }
LABEL_6:
  id v3 = [(SKEraseVolume *)self disk];
  uint64_t v8 = [v3 formattableFilesystems];
LABEL_7:

  return v8;
}

uint64_t __39__SKEraseVolume_formattableFilesystems__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 majorType];
  uint64_t v3 = [v2 isEqualToString:@"apfs"];

  return v3;
}

- (SKEraseVolume)initWithCoder:(id)a3
{
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)SKEraseVolume;
  int v5 = [(SKEraseVolume *)&v27 init];
  if (v5)
  {
    id v6 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"descriptor"];
    descriptor = v5->_descriptor;
    v5->_descriptor = (SKVolumeDescriptor *)v7;

    v26 = (void *)MEMORY[0x263EFFA08];
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = objc_opt_class();
    uint64_t v16 = objc_opt_class();
    uint64_t v17 = objc_msgSend(v26, "setWithObjects:", v9, v10, v11, v12, v13, v14, v15, v16, objc_opt_class(), 0);
    uint64_t v18 = [v4 decodeObjectOfClasses:v17 forKey:@"diskRepresentation"];
    diskRepresentation = v5->_diskRepresentation;
    v5->_diskRepresentation = (NSDictionary *)v18;

    uint64_t v20 = +[SKBaseManager sharedManager];
    uint64_t v21 = [v20 knownDiskForDictionary:v5->_diskRepresentation];
    disk = v5->_disk;
    v5->_disk = (SKDisk *)v21;

    uint64_t v23 = +[SKProgress progressWithTotalUnitCount:100];
    progress = v5->_progress;
    v5->_progress = (SKProgress *)v23;
  }
  return v5;
}

- (id)validateWithError:(id *)a3
{
  v66[3] = *MEMORY[0x263EF8340];
  uint64_t v7 = [(SKEraseVolume *)self disk];

  if (!v7)
  {
    uint64_t v12 = +[SKError nilWithPOSIXCode:22 debugDescription:@"No disk specified" error:a3];
    goto LABEL_52;
  }
  v66[0] = kSKDiskTypeGPTWholeDisk[0];
  v66[1] = kSKDiskTypeMBRWholeDisk[0];
  v66[2] = kSKDiskTypeAPMWholeDisk[0];
  uint64_t v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v66 count:3];
  uint64_t v9 = [(SKEraseVolume *)self disk];
  char v10 = [v9 isMemberOfClass:objc_opt_class()];
  v59 = v8;
  if (v10)
  {
    int v11 = 0;
  }
  else
  {
    uint64_t v3 = [(SKEraseVolume *)self disk];
    if ([v3 isMemberOfClass:objc_opt_class()])
    {
      int v11 = 0;
    }
    else
    {
      id v4 = [(SKEraseVolume *)self disk];
      if (([v4 isMemberOfClass:objc_opt_class()] & 1) == 0)
      {

        goto LABEL_36;
      }
      int v11 = 1;
    }
  }
  uint64_t v13 = [(SKEraseVolume *)self disk];
  uint64_t v14 = [v13 type];
  int v15 = [v8 containsObject:v14];

  if (v11) {
  if ((v10 & 1) == 0)
  }
  {

    if ((v15 & 1) == 0) {
      goto LABEL_15;
    }
LABEL_36:
    v46 = NSString;
    uint64_t v16 = [(SKEraseVolume *)self disk];
    v47 = [v46 stringWithFormat:@"Volume %@ not valid for erase", v16];
    uint64_t v12 = +[SKError nilWithPOSIXCode:45 debugDescription:v47 error:a3];

LABEL_50:
    uint64_t v21 = v59;
    goto LABEL_51;
  }

  if (v15) {
    goto LABEL_36;
  }
LABEL_15:
  uint64_t v16 = [(SKEraseVolume *)self disk];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v17 = [(SKEraseVolume *)self descriptor];
    uint64_t v18 = [v17 filesystem];
    int v19 = [v18 majorType];
    char v20 = [v19 isEqualToString:@"apfs"];

    if (v20) {
      goto LABEL_22;
    }
    uint64_t v16 = [(SKEraseVolume *)self disk];
    uint64_t v21 = v59;
    if ([v16 hasVolumeSiblings])
    {
      uint64_t v22 = SKGetOSLog();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        uint64_t v23 = [v16 container];
        *(_DWORD *)buf = 136315394;
        v61 = "-[SKEraseVolume validateWithError:]";
        __int16 v62 = 2112;
        v63 = v23;
        _os_log_impl(&dword_23F40C000, v22, OS_LOG_TYPE_ERROR, "%s: More than 1 volume on %@ container", buf, 0x16u);
      }
      uint64_t v24 = [v16 container];
      v25 = [v24 volumes];
      v26 = +[SKError errorWithCode:301 disks:v25 userInfo:MEMORY[0x263EFFA78]];
      uint64_t v12 = +[SKError nilWithError:v26 error:a3];

      goto LABEL_51;
    }
  }

LABEL_22:
  uint64_t v16 = [(SKEraseVolume *)self disk];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v21 = v59;
    goto LABEL_29;
  }
  objc_super v27 = [(SKEraseVolume *)self disk];
  int v28 = [v27 isLiveFSAPFSDisk];

  uint64_t v21 = v59;
  if (!v28) {
    goto LABEL_30;
  }
  uint64_t v16 = [(SKEraseVolume *)self disk];
  if ([v16 hasVolumeSiblings])
  {
    id v29 = SKGetOSLog();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      objc_super v30 = [v16 container];
      *(_DWORD *)buf = 136315394;
      v61 = "-[SKEraseVolume validateWithError:]";
      __int16 v62 = 2112;
      v63 = v30;
      _os_log_impl(&dword_23F40C000, v29, OS_LOG_TYPE_ERROR, "%s: More than 1 volume on %@ container, erase will be destructive", buf, 0x16u);
    }
    v31 = +[SKError errorWithCode:301 userInfo:0];
    uint64_t v32 = +[SKError nilWithError:v31 error:a3];
    goto LABEL_46;
  }
  v55 = [v16 container];
  v56 = [v55 designatedPhysicalStore];
  [(SKEraseVolume *)self setDisk:v56];

  v57 = [(SKEraseVolume *)self disk];

  if (v57)
  {
LABEL_29:

LABEL_30:
    v33 = [(SKEraseVolume *)self disk];
    v34 = [(SKEraseVolume *)self descriptor];
    v35 = [v34 filesystem];
    uint64_t v16 = [v33 formattableFilesystemWithFilesystem:v35];

    if (!v16)
    {
      v48 = SKGetOSLog();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      {
        v49 = [(SKEraseVolume *)self descriptor];
        v50 = [v49 filesystem];
        v51 = [(SKEraseVolume *)self formattableFilesystems];
        *(_DWORD *)buf = 136315650;
        v61 = "-[SKEraseVolume validateWithError:]";
        __int16 v62 = 2112;
        v63 = v50;
        __int16 v64 = 2112;
        v65 = v51;
        _os_log_impl(&dword_23F40C000, v48, OS_LOG_TYPE_ERROR, "%s: FS to format %@ not found in supported filesystems %@", buf, 0x20u);
      }
      uint64_t v12 = +[SKError nilWithPOSIXCode:45 error:a3];
      goto LABEL_51;
    }
    v36 = [(SKEraseVolume *)self descriptor];
    [v36 setFilesystem:v16];

    v37 = [(SKEraseVolume *)self descriptor];
    v38 = [v37 filesystem];
    v39 = [v38 majorType];
    int v40 = [v39 isEqualToString:@"apfs"];

    if (v40)
    {
      v41 = +[SKBaseManager sharedManager];
      v42 = [(SKEraseVolume *)self disk];
      v43 = [v41 wholeDiskForDisk:v42];

      v44 = [v43 type];
      if ([v44 isEqualToString:kSKDiskTypeMBRWholeDisk[0]])
      {
        unint64_t v45 = [v43 childCount];

        if (v45 >= 2) {
          goto LABEL_43;
        }
      }
      else
      {
      }
      v52 = [v43 type];
      if ([v52 isEqualToString:kSKDiskTypeAPMWholeDisk[0]])
      {
        unint64_t v53 = [v43 childCount];

        if (v53 >= 3)
        {
LABEL_43:
          v54 = +[SKError errorWithCode:301 userInfo:0];
          uint64_t v12 = +[SKError nilWithError:v54 error:a3];

          goto LABEL_50;
        }
      }
      else
      {
      }
    }
    uint64_t v12 = self;
    goto LABEL_50;
  }
  v31 = [NSString stringWithFormat:@"Cannot find physical store for %@", v16];
  uint64_t v32 = +[SKError nilWithSKErrorCode:117 debugDescription:v31 error:a3];
LABEL_46:
  uint64_t v12 = (SKEraseVolume *)v32;

LABEL_51:
LABEL_52:

  return v12;
}

- (SKDisk)disk
{
  return self->_disk;
}

- (SKVolumeDescriptor)descriptor
{
  return self->_descriptor;
}

- (void)setDescriptor:(id)a3
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
  objc_storeStrong((id *)&self->_descriptor, 0);

  objc_storeStrong((id *)&self->_disk, 0);
}

@end