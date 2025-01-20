@interface SKDisk
+ (void)sortWithDisks:(id)a3;
- (BOOL)canBeErasedToRole:(id)a3;
- (BOOL)canBoot;
- (BOOL)canPartitionDisk;
- (BOOL)canResize;
- (BOOL)cleanupWithError:(id *)a3;
- (BOOL)ejectWithCompletionBlock:(id)a3;
- (BOOL)ejectWithError:(id *)a3;
- (BOOL)isCaseSensitive;
- (BOOL)isDiskImage;
- (BOOL)isEqual:(id)a3;
- (BOOL)isExternal;
- (BOOL)isIOMediaDisk;
- (BOOL)isIOSRootSnapshot;
- (BOOL)isInternal;
- (BOOL)isJournaled;
- (BOOL)isLiveFSAPFSDisk;
- (BOOL)isLocked;
- (BOOL)isMediaWritable;
- (BOOL)isOSInternal;
- (BOOL)isPartitionDisk;
- (BOOL)isPhysicalDisk;
- (BOOL)isRemovable;
- (BOOL)isTrusted;
- (BOOL)isValid;
- (BOOL)isVirtualDiskType;
- (BOOL)isWholeDisk;
- (BOOL)isWritable;
- (BOOL)matchesDictionary:(id)a3;
- (BOOL)mountWithCompletionBlock:(id)a3;
- (BOOL)mountWithOptions:(id)a3 withCompletionBlock:(id)a4;
- (BOOL)mountWithOptionsDictionary:(id)a3 error:(id *)a4;
- (BOOL)mountWithOptionsDictionary:(id)a3 withCompletionBlock:(id)a4;
- (BOOL)mountWithParams:(id)a3 error:(id *)a4;
- (BOOL)rename:(id)a3 withCompletionBlock:(id)a4;
- (BOOL)supportsJournaling;
- (BOOL)supportsRepair;
- (BOOL)supportsVerify;
- (BOOL)unmountWithCompletionBlock:(id)a3;
- (BOOL)unmountWithOptions:(id)a3 completionBlock:(id)a4;
- (BOOL)unmountWithOptions:(id)a3 error:(id *)a4;
- (BOOL)wipeDiskWithError:(id *)a3;
- (NSNumber)diskObjectID;
- (NSObject)daDisk;
- (NSString)diskIdentifier;
- (NSString)filesystemType;
- (NSString)ioContent;
- (NSString)mediaUUID;
- (NSString)mountPoint;
- (NSString)role;
- (NSString)type;
- (NSString)volumeName;
- (NSString)volumeUUID;
- (SKDisk)initWithDictionary:(id)a3;
- (SKDiskPrivateCache)privateCache;
- (SKFilesystem)filesystem;
- (id)cachedWholeDiskByIdentifier;
- (id)children;
- (id)description;
- (id)dictionaryRepresentation;
- (id)formattableFilesystemWithFilesystem:(id)a3;
- (id)formattableFilesystems;
- (id)innerDescriptionWithPrivateData:(BOOL)a3;
- (id)minimalDictionaryRepresentation;
- (id)redactedDescription;
- (id)resizeToSize:(unint64_t)a3 completionBlock:(id)a4;
- (id)supportedFilesystems;
- (id)wholeDiskIdentifier;
- (unint64_t)availableSpace;
- (unint64_t)childCount;
- (unint64_t)freeSpace;
- (unint64_t)hash;
- (unint64_t)purgeableSpace;
- (unint64_t)startLocation;
- (unint64_t)totalSpace;
- (unint64_t)unformattedSize;
- (unsigned)getSectorSize;
- (unsigned)ownerUID;
- (void)expireCache;
- (void)expireCacheWithCompletionBlock:(id)a3;
- (void)expireCacheWithOptions:(unint64_t)a3 completionBlock:(id)a4;
- (void)recacheWithOptions:(unint64_t)a3;
- (void)resize:(unint64_t)a3 completion:(id)a4;
- (void)setAvailableSpace:(unint64_t)a3;
- (void)setCanPartitionDisk:(BOOL)a3;
- (void)setChildCount:(unint64_t)a3;
- (void)setDaDisk:(id)a3;
- (void)setDiskIdentifier:(id)a3;
- (void)setDiskObjectID:(id)a3;
- (void)setFilesystem:(id)a3;
- (void)setFilesystemType:(id)a3;
- (void)setFreeSpace:(unint64_t)a3;
- (void)setIoContent:(id)a3;
- (void)setIsCaseSensitive:(BOOL)a3;
- (void)setIsDiskImage:(BOOL)a3;
- (void)setIsInternal:(BOOL)a3;
- (void)setIsJournaled:(BOOL)a3;
- (void)setIsLocked:(BOOL)a3;
- (void)setIsMediaWritable:(BOOL)a3;
- (void)setIsOSInternal:(BOOL)a3;
- (void)setIsPartitionDisk:(BOOL)a3;
- (void)setIsPhysicalDisk:(BOOL)a3;
- (void)setIsRemovable:(BOOL)a3;
- (void)setIsValid:(BOOL)a3;
- (void)setIsWholeDisk:(BOOL)a3;
- (void)setIsWritable:(BOOL)a3;
- (void)setMediaUUID:(id)a3;
- (void)setMountPoint:(id)a3;
- (void)setOwnerUID:(unsigned int)a3;
- (void)setPrivateCache:(id)a3;
- (void)setPurgeableSpace:(unint64_t)a3;
- (void)setRole:(id)a3;
- (void)setStartLocation:(unint64_t)a3;
- (void)setSupportsJournaling:(BOOL)a3;
- (void)setSupportsRepair:(BOOL)a3;
- (void)setSupportsVerify:(BOOL)a3;
- (void)setTotalSpace:(unint64_t)a3;
- (void)setType:(id)a3;
- (void)setUnformattedSize:(unint64_t)a3;
- (void)setVolumeName:(id)a3;
- (void)setVolumeUUID:(id)a3;
- (void)updateWithDictionary:(id)a3;
@end

@implementation SKDisk

- (id)minimalDictionaryRepresentation
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:5];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  [v3 setObject:v5 forKey:@"**ClassName**"];

  v6 = [(SKDisk *)v2 diskObjectID];
  [v3 setObject:v6 forKey:@"diskObjectID"];

  v7 = [(SKDisk *)v2 role];
  [v3 setObject:v7 forKey:@"role"];

  v8 = [(SKDisk *)v2 type];
  [v3 setObject:v8 forKey:@"type"];

  v9 = [(SKDisk *)v2 filesystemType];

  if (v9)
  {
    v10 = [(SKDisk *)v2 filesystemType];
    [v3 setObject:v10 forKey:@"filesystemType"];
  }
  else
  {
    [v3 setObject:kSKDiskFileSystemUndefined[0] forKey:@"filesystemType"];
  }
  v11 = [(SKDisk *)v2 diskIdentifier];

  if (v11)
  {
    v12 = [(SKDisk *)v2 diskIdentifier];
    [v3 setObject:v12 forKey:@"diskIdentifier"];
  }
  v13 = [(SKDisk *)v2 mediaUUID];

  if (v13)
  {
    v14 = [(SKDisk *)v2 mediaUUID];
    [v3 setObject:v14 forKey:@"mediaUUID"];
  }
  objc_sync_exit(v2);

  return v3;
}

- (id)dictionaryRepresentation
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = [(SKDisk *)v2 minimalDictionaryRepresentation];
  v4 = objc_msgSend(NSNumber, "numberWithBool:", -[SKDisk isValid](v2, "isValid"));
  [v3 setObject:v4 forKey:@"isValid"];

  v5 = objc_msgSend(NSNumber, "numberWithBool:", -[SKDisk isDiskImage](v2, "isDiskImage"));
  [v3 setObject:v5 forKey:@"isDiskImage"];

  v6 = objc_msgSend(NSNumber, "numberWithBool:", -[SKDisk isInternal](v2, "isInternal"));
  [v3 setObject:v6 forKey:@"isInternal"];

  v7 = objc_msgSend(NSNumber, "numberWithBool:", -[SKDisk isWholeDisk](v2, "isWholeDisk"));
  [v3 setObject:v7 forKey:@"isWholeDisk"];

  v8 = objc_msgSend(NSNumber, "numberWithBool:", -[SKDisk isPhysicalDisk](v2, "isPhysicalDisk"));
  [v3 setObject:v8 forKey:@"isPhysicalDisk"];

  v9 = objc_msgSend(NSNumber, "numberWithBool:", -[SKDisk canPartitionDisk](v2, "canPartitionDisk"));
  [v3 setObject:v9 forKey:@"canPartitionDisk"];

  v10 = objc_msgSend(NSNumber, "numberWithBool:", -[SKDisk isCaseSensitive](v2, "isCaseSensitive"));
  [v3 setObject:v10 forKey:@"isCaseSensitive"];

  v11 = objc_msgSend(NSNumber, "numberWithBool:", -[SKDisk isLocked](v2, "isLocked"));
  [v3 setObject:v11 forKey:@"isLocked"];

  v12 = objc_msgSend(NSNumber, "numberWithBool:", -[SKDisk isOSInternal](v2, "isOSInternal"));
  [v3 setObject:v12 forKey:@"isOSInternal"];

  v13 = objc_msgSend(NSNumber, "numberWithBool:", -[SKDisk isPartitionDisk](v2, "isPartitionDisk"));
  [v3 setObject:v13 forKey:@"isPartitionDisk"];

  v14 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[SKDisk freeSpace](v2, "freeSpace"));
  [v3 setObject:v14 forKey:@"freeSpace"];

  v15 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[SKDisk purgeableSpace](v2, "purgeableSpace"));
  [v3 setObject:v15 forKey:@"purgeableSpace"];

  v16 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[SKDisk availableSpace](v2, "availableSpace"));
  [v3 setObject:v16 forKey:@"availableSpace"];

  v17 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[SKDisk totalSpace](v2, "totalSpace"));
  [v3 setObject:v17 forKey:@"totalSpace"];

  v18 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[SKDisk startLocation](v2, "startLocation"));
  [v3 setObject:v18 forKey:@"startLocation"];

  v19 = [(SKDisk *)v2 mountPoint];
  if (v19) {
    [(SKDisk *)v2 mountPoint];
  }
  else {
  v20 = [MEMORY[0x263EFF9D0] null];
  }
  [v3 setObject:v20 forKey:@"mountPoint"];

  v21 = [(SKDisk *)v2 volumeName];
  if (v21) {
    [(SKDisk *)v2 volumeName];
  }
  else {
  v22 = [MEMORY[0x263EFF9D0] null];
  }
  [v3 setObject:v22 forKey:@"volumeName"];

  v23 = [(SKDisk *)v2 volumeUUID];
  if (v23) {
    [(SKDisk *)v2 volumeUUID];
  }
  else {
  v24 = [MEMORY[0x263EFF9D0] null];
  }
  [v3 setObject:v24 forKey:@"volumeUUID"];

  v25 = [(SKDisk *)v2 ioContent];
  if (v25) {
    [(SKDisk *)v2 ioContent];
  }
  else {
  v26 = [MEMORY[0x263EFF9D0] null];
  }
  [v3 setObject:v26 forKey:@"ioContent"];

  v27 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[SKDisk unformattedSize](v2, "unformattedSize"));
  [v3 setObject:v27 forKey:@"unformattedSize"];

  v28 = objc_msgSend(NSNumber, "numberWithBool:", -[SKDisk supportsRepair](v2, "supportsRepair"));
  [v3 setObject:v28 forKey:@"supportsRepair"];

  v29 = objc_msgSend(NSNumber, "numberWithBool:", -[SKDisk supportsVerify](v2, "supportsVerify"));
  [v3 setObject:v29 forKey:@"supportsVerify"];

  v30 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[SKDisk childCount](v2, "childCount"));
  [v3 setObject:v30 forKey:@"childCount"];

  v31 = objc_msgSend(NSNumber, "numberWithBool:", -[SKDisk supportsJournaling](v2, "supportsJournaling"));
  [v3 setObject:v31 forKey:@"supportsJournaling"];

  v32 = objc_msgSend(NSNumber, "numberWithBool:", -[SKDisk isJournaled](v2, "isJournaled"));
  [v3 setObject:v32 forKey:@"isJournaled"];

  v33 = objc_msgSend(NSNumber, "numberWithBool:", -[SKDisk isWritable](v2, "isWritable"));
  [v3 setObject:v33 forKey:@"isWritable"];

  v34 = objc_msgSend(NSNumber, "numberWithBool:", -[SKDisk isMediaWritable](v2, "isMediaWritable"));
  [v3 setObject:v34 forKey:@"isMediaWritable"];

  v35 = [(SKDisk *)v2 filesystem];

  if (v35)
  {
    v36 = [(SKDisk *)v2 filesystem];
    v37 = [v36 dictionaryRepresentation];
    [v3 setObject:v37 forKey:@"filesystem"];
  }
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)matchesDictionary:(id)a3
{
  id v4 = a3;
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  v7 = [v4 objectForKey:@"**ClassName**"];
  if ([v6 isEqualToString:v7])
  {
    v8 = [(SKDisk *)self diskIdentifier];
    v9 = [v4 objectForKey:@"diskIdentifier"];
    int v10 = [v8 isEqualToString:v9];

    if (!v10)
    {
      char v12 = 0;
      goto LABEL_9;
    }
    v11 = [(SKDisk *)self mediaUUID];

    if (!v11)
    {
      char v12 = 1;
      goto LABEL_9;
    }
    v6 = [(SKDisk *)self mediaUUID];
    v7 = [v4 objectForKeyedSubscript:@"mediaUUID"];
    char v12 = [v6 isEqual:v7];
  }
  else
  {
    char v12 = 0;
  }

LABEL_9:
  return v12;
}

- (SKDisk)initWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = [(SKDisk *)self init];
  v6 = v5;
  if (v5)
  {
    v7 = v5;
    objc_sync_enter(v7);
    [(SKDisk *)v7 updateWithDictionary:v4];
    objc_sync_exit(v7);
  }
  return v6;
}

- (void)updateWithDictionary:(id)a3
{
  uint64_t v97 = *MEMORY[0x263EF8340];
  id v95 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  v5 = [v95 objectForKey:@"**ClassName**"];

  if (v5)
  {
    v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    v8 = [v95 objectForKey:@"**ClassName**"];
    char v9 = [v7 isEqualToString:v8];

    if ((v9 & 1) == 0)
    {
      v91 = SKGetOSLog();
      if (os_log_type_enabled(v91, OS_LOG_TYPE_ERROR))
      {
        v92 = (objc_class *)objc_opt_class();
        NSStringFromClass(v92);
        id v93 = (id)objc_claimAutoreleasedReturnValue();
        v94 = [v95 objectForKey:@"**ClassName**"];
        -[SKDisk updateWithDictionary:](v93, v94, buf, v91);
      }

      __assert_rtn("-[SKDisk updateWithDictionary:]", "SKDisk.m", 211, "NO");
    }
  }
  int v10 = [v95 objectForKeyedSubscript:@"diskObjectID"];
  [(SKDisk *)v4 setDiskObjectID:v10];

  v11 = [v95 objectForKey:@"role"];

  if (v11)
  {
    char v12 = [v95 objectForKey:@"role"];
    [(SKDisk *)v4 setRole:v12];
  }
  v13 = [v95 objectForKey:@"filesystemType"];

  if (v13)
  {
    v14 = [v95 objectForKey:@"filesystemType"];
    [(SKDisk *)v4 setFilesystemType:v14];
  }
  v15 = [v95 objectForKey:@"type"];

  if (v15)
  {
    v16 = [v95 objectForKey:@"type"];
    [(SKDisk *)v4 setType:v16];
  }
  v17 = [v95 objectForKey:@"isValid"];

  if (v17)
  {
    v18 = [v95 objectForKey:@"isValid"];
    -[SKDisk setIsValid:](v4, "setIsValid:", [v18 BOOLValue]);
  }
  v19 = [v95 objectForKey:@"isDiskImage"];

  if (v19)
  {
    v20 = [v95 objectForKey:@"isDiskImage"];
    -[SKDisk setIsDiskImage:](v4, "setIsDiskImage:", [v20 BOOLValue]);
  }
  v21 = [v95 objectForKey:@"isInternal"];

  if (v21)
  {
    v22 = [v95 objectForKey:@"isInternal"];
    -[SKDisk setIsInternal:](v4, "setIsInternal:", [v22 BOOLValue]);
  }
  v23 = [v95 objectForKey:@"isWholeDisk"];

  if (v23)
  {
    v24 = [v95 objectForKey:@"isWholeDisk"];
    -[SKDisk setIsWholeDisk:](v4, "setIsWholeDisk:", [v24 BOOLValue]);
  }
  v25 = [v95 objectForKey:@"isPhysicalDisk"];

  if (v25)
  {
    v26 = [v95 objectForKey:@"isPhysicalDisk"];
    -[SKDisk setIsPhysicalDisk:](v4, "setIsPhysicalDisk:", [v26 BOOLValue]);
  }
  v27 = [v95 objectForKey:@"canPartitionDisk"];

  if (v27)
  {
    v28 = [v95 objectForKey:@"canPartitionDisk"];
    -[SKDisk setCanPartitionDisk:](v4, "setCanPartitionDisk:", [v28 BOOLValue]);
  }
  v29 = [v95 objectForKey:@"isPartitionDisk"];

  if (v29)
  {
    v30 = [v95 objectForKey:@"isPartitionDisk"];
    -[SKDisk setIsPartitionDisk:](v4, "setIsPartitionDisk:", [v30 BOOLValue]);
  }
  v31 = [v95 objectForKey:@"supportsJournaling"];

  if (v31)
  {
    v32 = [v95 objectForKey:@"supportsJournaling"];
    -[SKDisk setSupportsJournaling:](v4, "setSupportsJournaling:", [v32 BOOLValue]);
  }
  v33 = [v95 objectForKey:@"isJournaled"];

  if (v33)
  {
    v34 = [v95 objectForKey:@"isJournaled"];
    -[SKDisk setIsJournaled:](v4, "setIsJournaled:", [v34 BOOLValue]);
  }
  v35 = [v95 objectForKey:@"isCaseSensitive"];

  if (v35)
  {
    v36 = [v95 objectForKey:@"isCaseSensitive"];
    -[SKDisk setIsCaseSensitive:](v4, "setIsCaseSensitive:", [v36 BOOLValue]);
  }
  v37 = [v95 objectForKey:@"mediaUUID"];

  if (v37)
  {
    v38 = [v95 objectForKey:@"mediaUUID"];
    v39 = [MEMORY[0x263EFF9D0] null];
    if (v38 == v39)
    {
      v40 = 0;
    }
    else
    {
      v40 = [v95 objectForKey:@"mediaUUID"];
    }
    [(SKDisk *)v4 setMediaUUID:v40];
    if (v38 != v39) {
  }
    }
  v41 = [v95 objectForKey:@"isOSInternal"];

  if (v41)
  {
    v42 = [v95 objectForKey:@"isOSInternal"];
    -[SKDisk setIsOSInternal:](v4, "setIsOSInternal:", [v42 BOOLValue]);
  }
  v43 = [v95 objectForKey:@"childCount"];

  if (v43)
  {
    v44 = [v95 objectForKey:@"childCount"];
    -[SKDisk setChildCount:](v4, "setChildCount:", [v44 unsignedLongLongValue]);
  }
  v45 = [v95 objectForKey:@"startLocation"];

  if (v45)
  {
    v46 = [v95 objectForKey:@"startLocation"];
    -[SKDisk setStartLocation:](v4, "setStartLocation:", [v46 unsignedLongLongValue]);
  }
  v47 = [v95 objectForKey:@"isLocked"];

  if (v47)
  {
    v48 = [v95 objectForKey:@"isLocked"];
    -[SKDisk setIsLocked:](v4, "setIsLocked:", [v48 BOOLValue]);
  }
  v49 = [v95 objectForKey:@"diskIdentifier"];

  if (v49)
  {
    v50 = [v95 objectForKey:@"diskIdentifier"];
    v51 = [MEMORY[0x263EFF9D0] null];
    if (v50 == v51)
    {
      v52 = 0;
    }
    else
    {
      v52 = [v95 objectForKey:@"diskIdentifier"];
    }
    [(SKDisk *)v4 setDiskIdentifier:v52];
    if (v50 != v51) {
  }
    }
  v53 = [v95 objectForKey:@"volumeName"];

  if (v53)
  {
    v54 = [v95 objectForKey:@"volumeName"];
    v55 = [MEMORY[0x263EFF9D0] null];
    if (v54 == v55)
    {
      v56 = 0;
    }
    else
    {
      v56 = [v95 objectForKey:@"volumeName"];
    }
    [(SKDisk *)v4 setVolumeName:v56];
    if (v54 != v55) {
  }
    }
  v57 = [v95 objectForKey:@"volumeUUID"];

  if (v57)
  {
    v58 = [v95 objectForKey:@"volumeUUID"];
    v59 = [MEMORY[0x263EFF9D0] null];
    if (v58 == v59)
    {
      v60 = 0;
    }
    else
    {
      v60 = [v95 objectForKey:@"volumeUUID"];
    }
    [(SKDisk *)v4 setVolumeUUID:v60];
    if (v58 != v59) {
  }
    }
  v61 = [v95 objectForKey:@"supportsRepair"];

  if (v61)
  {
    v62 = [v95 objectForKey:@"supportsRepair"];
    -[SKDisk setSupportsRepair:](v4, "setSupportsRepair:", [v62 BOOLValue]);
  }
  v63 = [v95 objectForKey:@"supportsVerify"];

  if (v63)
  {
    v64 = [v95 objectForKey:@"supportsVerify"];
    -[SKDisk setSupportsVerify:](v4, "setSupportsVerify:", [v64 BOOLValue]);
  }
  v65 = [v95 objectForKey:@"unformattedSize"];

  if (v65)
  {
    v66 = [v95 objectForKey:@"unformattedSize"];
    -[SKDisk setUnformattedSize:](v4, "setUnformattedSize:", [v66 unsignedLongLongValue]);
  }
  v67 = [v95 objectForKey:@"filesystem"];

  if (v67)
  {
    v68 = [SKFilesystem alloc];
    v69 = [v95 objectForKey:@"filesystem"];
    v70 = [(SKFilesystem *)v68 initWithDictionaryRepresentation:v69];
    [(SKDisk *)v4 setFilesystem:v70];
  }
  v71 = [v95 objectForKey:@"freeSpace"];

  if (v71)
  {
    v72 = [v95 objectForKey:@"freeSpace"];
    -[SKDisk setFreeSpace:](v4, "setFreeSpace:", [v72 unsignedLongLongValue]);
  }
  v73 = [v95 objectForKey:@"purgeableSpace"];

  if (v73)
  {
    v74 = [v95 objectForKey:@"purgeableSpace"];
    -[SKDisk setPurgeableSpace:](v4, "setPurgeableSpace:", [v74 unsignedLongLongValue]);
  }
  v75 = [v95 objectForKey:@"availableSpace"];

  if (v75)
  {
    v76 = [v95 objectForKey:@"availableSpace"];
    -[SKDisk setAvailableSpace:](v4, "setAvailableSpace:", [v76 unsignedLongLongValue]);
  }
  v77 = [v95 objectForKey:@"totalSpace"];

  if (v77)
  {
    v78 = [v95 objectForKey:@"totalSpace"];
    -[SKDisk setTotalSpace:](v4, "setTotalSpace:", [v78 unsignedLongLongValue]);
  }
  v79 = [v95 objectForKey:@"ioContent"];

  if (v79)
  {
    v80 = [v95 objectForKey:@"ioContent"];
    v81 = [MEMORY[0x263EFF9D0] null];
    if (v80 == v81)
    {
      v82 = 0;
    }
    else
    {
      v82 = [v95 objectForKey:@"ioContent"];
    }
    [(SKDisk *)v4 setIoContent:v82];
    if (v80 != v81) {
  }
    }
  v83 = [v95 objectForKey:@"isWritable"];

  if (v83)
  {
    v84 = [v95 objectForKey:@"isWritable"];
    -[SKDisk setIsWritable:](v4, "setIsWritable:", [v84 BOOLValue]);
  }
  v85 = [v95 objectForKey:@"isMediaWritable"];

  if (v85)
  {
    v86 = [v95 objectForKey:@"isMediaWritable"];
    -[SKDisk setIsMediaWritable:](v4, "setIsMediaWritable:", [v86 BOOLValue]);
  }
  v87 = [v95 objectForKey:@"mountPoint"];

  if (v87)
  {
    v88 = [v95 objectForKey:@"mountPoint"];
    v89 = [MEMORY[0x263EFF9D0] null];
    if (v88 == v89)
    {
      v90 = 0;
    }
    else
    {
      v90 = [v95 objectForKey:@"mountPoint"];
    }
    [(SKDisk *)v4 setMountPoint:v90];
    if (v88 != v89) {
  }
    }
  objc_sync_exit(v4);
}

+ (void)sortWithDisks:(id)a3
{
}

uint64_t __24__SKDisk_sortWithDisks___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = v4;
  id v7 = v5;
  unint64_t v8 = [v6 startLocation];
  if (v8 >= [v7 startLocation])
  {
    unint64_t v10 = [v6 startLocation];
    if (v10 <= [v7 startLocation])
    {
      v11 = [v6 diskIdentifier];
      if ((unint64_t)[v11 length] < 5)
      {
        uint64_t v9 = 0;
      }
      else
      {
        char v12 = [v7 diskIdentifier];
        unint64_t v13 = [v12 length];

        if (v13 < 5)
        {
          uint64_t v9 = 0;
          goto LABEL_29;
        }
        v14 = [v6 diskIdentifier];
        v15 = [v14 substringFromIndex:4];
        v11 = [v15 componentsSeparatedByString:@"s"];

        uint64_t v16 = [v11 count];
        v17 = [v7 diskIdentifier];
        v18 = [v17 substringFromIndex:4];
        v19 = [v18 componentsSeparatedByString:@"s"];

        uint64_t v20 = [v19 count];
        uint64_t v9 = 0;
        if (v16 && v20)
        {
          uint64_t v21 = 0;
          uint64_t v29 = v20;
          uint64_t v30 = v16;
          if (v16 >= v20) {
            uint64_t v22 = v20;
          }
          else {
            uint64_t v22 = v16;
          }
          if (v22 <= 1) {
            uint64_t v23 = 1;
          }
          else {
            uint64_t v23 = v22;
          }
          uint64_t v9 = 1;
          do
          {
            v24 = objc_msgSend(v11, "objectAtIndexedSubscript:", v21, v29, v30);
            int v25 = [v24 intValue];

            v26 = [v19 objectAtIndexedSubscript:v21];
            int v27 = [v26 intValue];

            if (v25 < v27)
            {
              uint64_t v9 = -1;
              goto LABEL_27;
            }
            if (v25 > v27) {
              goto LABEL_27;
            }
            ++v21;
          }
          while (v23 != v21);
          if (v30 == v29)
          {
            uint64_t v9 = 0;
          }
          else if (v30 < v29)
          {
            uint64_t v9 = -1;
          }
          else
          {
            uint64_t v9 = 1;
          }
        }
LABEL_27:
      }
      goto LABEL_29;
    }
    uint64_t v9 = 1;
  }
  else
  {
    uint64_t v9 = -1;
  }
LABEL_29:

  return v9;
}

- (id)children
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  if ([(SKDisk *)self isWholeDisk])
  {
    v3 = [(SKDisk *)self diskIdentifier];

    if (v3)
    {
      id v4 = +[SKBaseManager sharedManager];
      id v5 = [v4 allDisks];

      v3 = [MEMORY[0x263EFF980] arrayWithCapacity:2];
      BOOL v6 = [(SKDisk *)self isLiveFSAPFSDisk];
      id v7 = [NSString alloc];
      uint64_t v8 = [(SKDisk *)self diskIdentifier];
      uint64_t v9 = (void *)v8;
      if (v6) {
        unint64_t v10 = @"%@/";
      }
      else {
        unint64_t v10 = @"%@s";
      }
      v11 = objc_msgSend(v7, "initWithFormat:", v10, v8);

      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      id v12 = v5;
      uint64_t v13 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v22;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v22 != v15) {
              objc_enumerationMutation(v12);
            }
            v17 = *(void **)(*((void *)&v21 + 1) + 8 * i);
            v18 = [v17 diskIdentifier];
            int v19 = [v18 hasPrefix:v11];

            if (v19) {
              [v3 addObject:v17];
            }
          }
          uint64_t v14 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
        }
        while (v14);
      }

      +[SKDisk sortWithDisks:v3];
    }
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    id v5 = v4;
    BOOL v6 = [(SKDisk *)self mediaUUID];
    id v7 = [v5 mediaUUID];
    int v8 = isEqualOrBothNil((unint64_t)v6, (uint64_t)v7);

    if (v8)
    {
      uint64_t v9 = [(SKDisk *)self diskIdentifier];
      unint64_t v10 = [v5 diskIdentifier];
      char v11 = isEqualOrBothNil((unint64_t)v9, (uint64_t)v10);
    }
    else
    {
      char v11 = 0;
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  v3 = [(SKDisk *)self mediaUUID];

  id v4 = [(SKDisk *)self diskIdentifier];
  unint64_t v5 = [v4 hash];
  if (v3)
  {
    BOOL v6 = [(SKDisk *)self mediaUUID];
    v5 ^= [v6 hash];
  }
  return v5;
}

- (id)supportedFilesystems
{
  v2 = +[SKManager sharedManager];
  v3 = [v2 formatableFileSystems];

  return v3;
}

- (BOOL)canResize
{
  v3 = [(SKDisk *)self filesystemType];
  if ([v3 isEqualToString:kSKDiskFileSystemHFS[0]])
  {
    id v4 = [(SKDisk *)self filesystem];
    char v5 = [v4 isJournaled];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (BOOL)isExternal
{
  if ([(SKDisk *)self isInternal]) {
    return 0;
  }
  else {
    return ![(SKDisk *)self isDiskImage];
  }
}

- (BOOL)isTrusted
{
  BOOL v3 = [(SKDisk *)self isInternal];
  if (v3) {
    LOBYTE(v3) = ![(SKDisk *)self isRemovable];
  }
  return v3;
}

- (void)expireCacheWithOptions:(unint64_t)a3 completionBlock:(id)a4
{
  id v6 = a4;
  id v7 = +[SKHelperClient sharedClient];
  [v7 recacheDisk:self options:a3 callbackBlock:v6];
}

- (void)expireCacheWithCompletionBlock:(id)a3
{
  id v4 = a3;
  id v5 = +[SKHelperClient sharedClient];
  [v5 recacheDisk:self options:0 callbackBlock:v4];
}

- (void)expireCache
{
  id v3 = +[SKHelperClient sharedClient];
  [v3 recacheDisk:self options:0 callbackBlock:0];
}

- (void)recacheWithOptions:(unint64_t)a3
{
  id v5 = +[SKHelperClient sharedClient];
  [v5 recacheDisk:self options:a3 blocking:1 callbackBlock:0];
}

- (BOOL)canBoot
{
  v2 = [(SKDisk *)self role];
  if (([v2 isEqualToString:kSKDiskRoleMacSystem[0]] & 1) != 0
    || ([v2 isEqualToString:kSKDiskRoleLegacyMacSystem[0]] & 1) != 0)
  {
    char v3 = 1;
  }
  else
  {
    char v3 = [v2 isEqualToString:kSKDiskRoleWindowsSystem[0]];
  }

  return v3;
}

- (BOOL)canBeErasedToRole:(id)a3
{
  char v3 = (void *)MEMORY[0x263EFFA08];
  id v4 = kSKDiskRoleLegacyMacData[0];
  id v5 = kSKDiskRoleMacData[0];
  id v6 = kSKDiskRoleWindowsData[0];
  id v7 = kSKDiskRoleDigitalCameraData[0];
  int v8 = kSKDiskRoleExternalMedia[0];
  id v9 = a3;
  unint64_t v10 = objc_msgSend(v3, "setWithObjects:", v4, v5, v6, v7, v8, 0);
  LOBYTE(v4) = [v10 containsObject:v9];

  return (char)v4;
}

- (id)innerDescriptionWithPrivateData:(BOOL)a3
{
  if (self->_isValid) {
    char v3 = @"Yes";
  }
  else {
    char v3 = @"No";
  }
  mediaUUID = @"None";
  volumeUUID = (__CFString *)self->_volumeUUID;
  if (!volumeUUID) {
    volumeUUID = @"None";
  }
  if (self->_mediaUUID) {
    mediaUUID = (__CFString *)self->_mediaUUID;
  }
  return (id)[NSString stringWithFormat:@"Role: %@, Type: %@, Valid: %@, Volume UUID: %@, Media UUID: %@", self->_role, self->_type, v3, volumeUUID, mediaUUID];
}

- (id)redactedDescription
{
  v2 = self;
  objc_sync_enter(v2);
  char v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  diskObjectID = v2->_diskObjectID;
  diskIdentifier = (__CFString *)v2->_diskIdentifier;
  mountPoint = v2->_mountPoint;
  uint64_t v9 = [(SKDisk *)v2 innerDescriptionWithPrivateData:0];
  unint64_t v10 = (void *)v9;
  char v11 = @"None";
  if (diskIdentifier) {
    char v11 = diskIdentifier;
  }
  id v12 = @"Yes";
  if (!mountPoint) {
    id v12 = @"No";
  }
  uint64_t v13 = [v3 stringWithFormat:@"<%@: [%@] { BSD Name: %@, Mounted: %@, %@ }>", v5, diskObjectID, v11, v12, v9];

  objc_sync_exit(v2);

  return v13;
}

- (id)description
{
  v2 = self;
  objc_sync_enter(v2);
  char v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  diskObjectID = v2->_diskObjectID;
  volumeName = (__CFString *)v2->_volumeName;
  diskIdentifier = (__CFString *)v2->_diskIdentifier;
  mountPoint = (__CFString *)v2->_mountPoint;
  uint64_t v10 = [(SKDisk *)v2 innerDescriptionWithPrivateData:1];
  char v11 = (void *)v10;
  id v12 = @"Not Mounted";
  if (mountPoint) {
    id v12 = mountPoint;
  }
  uint64_t v13 = @"None";
  if (diskIdentifier) {
    uint64_t v13 = diskIdentifier;
  }
  uint64_t v14 = &stru_26F313B30;
  if (volumeName) {
    uint64_t v14 = volumeName;
  }
  uint64_t v15 = [v3 stringWithFormat:@"<%@: [%@] { Volume Name: \"%@\", BSD Name: %@, Mount point: %@, %@ }>", v5, diskObjectID, v14, v13, v12, v10];

  objc_sync_exit(v2);

  return v15;
}

- (id)wholeDiskIdentifier
{
  char v3 = [(SKDisk *)self contentDiskIdentifier];
  id v4 = [v3 substringFromIndex:4];

  id v5 = [v4 componentsSeparatedByString:@"s"];
  if ((unint64_t)[v5 count] >= 2)
  {
    id v7 = [(SKDisk *)self contentDiskIdentifier];
    int v8 = [v7 substringToIndex:4];
    uint64_t v9 = [v5 objectAtIndexedSubscript:0];
    id v6 = [v8 stringByAppendingString:v9];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)cachedWholeDiskByIdentifier
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v2 = [(SKDisk *)self wholeDiskIdentifier];
  if (v2)
  {
    char v3 = +[SKBaseManager sharedManager];
    id v4 = [v3 allDisks];

    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v5 = v4;
    id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
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
          uint64_t v10 = objc_msgSend(v9, "diskIdentifier", (void)v13);
          char v11 = [v10 isEqualToString:v2];

          if (v11)
          {
            id v6 = v9;
            goto LABEL_12;
          }
        }
        id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (BOOL)isVirtualDiskType
{
  return 0;
}

- (BOOL)isIOMediaDisk
{
  if ([(SKDisk *)self isLiveFSAPFSDisk]) {
    return 0;
  }
  else {
    return ![(SKDisk *)self isIOSRootSnapshot];
  }
}

- (BOOL)isLiveFSAPFSDisk
{
  v2 = [(SKDisk *)self diskIdentifier];
  char v3 = [v2 hasPrefix:@"apfs://disk"];

  return v3;
}

- (BOOL)isIOSRootSnapshot
{
  return objc_opt_isKindOfClass() & 1;
}

- (BOOL)rename:(id)a3 withCompletionBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  int v8 = +[SKHelperClient sharedClient];
  [v8 renameDisk:self to:v7 withCompletionBlock:v6];

  return 1;
}

- (BOOL)unmountWithCompletionBlock:(id)a3
{
  id v4 = a3;
  id v5 = +[SKHelperClient sharedClient];
  [v5 unmountDisk:self withCompletionBlock:v4];

  return 1;
}

- (BOOL)unmountWithOptions:(id)a3 completionBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  int v8 = +[SKHelperClient sharedClient];
  [v8 unmountDisk:self options:v7 withCompletionBlock:v6];

  return 1;
}

- (BOOL)unmountWithOptions:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = objc_alloc_init(SKSyncCommand);
  int v8 = +[SKHelperClient sharedClient];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __35__SKDisk_unmountWithOptions_error___block_invoke;
  v11[3] = &unk_26506BF88;
  id v12 = v7;
  uint64_t v9 = v7;
  [v8 unmountDisk:self options:v6 blocking:1 withCompletionBlock:v11];

  LOBYTE(a4) = [(SKSyncCommand *)v9 returnWithError:a4];
  return (char)a4;
}

uint64_t __35__SKDisk_unmountWithOptions_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) onCallbackWithError:a2];
}

- (BOOL)mountWithCompletionBlock:(id)a3
{
  return [(SKDisk *)self mountWithOptions:0 withCompletionBlock:a3];
}

- (BOOL)mountWithOptions:(id)a3 withCompletionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:1];
  uint64_t v9 = v8;
  if (v6) {
    [v8 setObject:v6 forKey:@"kSKDiskMountOptionToolOptions"];
  }
  BOOL v10 = [(SKDisk *)self mountWithOptionsDictionary:v9 withCompletionBlock:v7];

  return v10;
}

- (BOOL)mountWithOptionsDictionary:(id)a3 withCompletionBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  int v8 = +[SKHelperClient sharedClient];
  [v8 mountDisk:self options:v7 completionBlock:v6];

  return 1;
}

- (BOOL)mountWithOptionsDictionary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = objc_alloc_init(SKSyncCommand);
  int v8 = +[SKHelperClient sharedClient];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __43__SKDisk_mountWithOptionsDictionary_error___block_invoke;
  v11[3] = &unk_26506BF88;
  id v12 = v7;
  uint64_t v9 = v7;
  [v8 mountDisk:self options:v6 blocking:1 completionBlock:v11];

  LOBYTE(a4) = [(SKSyncCommand *)v9 returnWithError:a4];
  return (char)a4;
}

uint64_t __43__SKDisk_mountWithOptionsDictionary_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) onCallbackWithError:a2];
}

- (BOOL)mountWithParams:(id)a3 error:(id *)a4
{
  id v6 = [a3 dictionaryRepresentation];
  LOBYTE(a4) = [(SKDisk *)self mountWithOptionsDictionary:v6 error:a4];

  return (char)a4;
}

- (BOOL)ejectWithCompletionBlock:(id)a3
{
  id v4 = a3;
  id v5 = +[SKHelperClient sharedClient];
  [v5 ejectDisk:self withCompletionBlock:v4];

  return 1;
}

- (BOOL)ejectWithError:(id *)a3
{
  id v5 = objc_alloc_init(SKSyncCommand);
  id v6 = +[SKHelperClient sharedClient];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __25__SKDisk_ejectWithError___block_invoke;
  v9[3] = &unk_26506BF88;
  BOOL v10 = v5;
  id v7 = v5;
  [v6 ejectDisk:self blocking:1 withCompletionBlock:v9];

  LOBYTE(a3) = [(SKSyncCommand *)v7 returnWithError:a3];
  return (char)a3;
}

uint64_t __25__SKDisk_ejectWithError___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) onCallbackWithError:a2];
}

- (id)resizeToSize:(unint64_t)a3 completionBlock:(id)a4
{
  id v6 = a4;
  id v7 = +[SKProgress progressWithTotalUnitCount:100];
  int v8 = +[SKHelperClient sharedClient];
  uint64_t v9 = [v8 resize:self toSize:a3 completionBlock:v6];

  [v7 chainChildProgress:v9 withPendingUnitCount:100];

  return v7;
}

- (void)resize:(unint64_t)a3 completion:(id)a4
{
  id v8 = a4;
  id v6 = +[SKHelperClient sharedClient];
  id v7 = (id)[v6 resize:self toSize:a3 completionBlock:v8];
}

- (NSString)type
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setType:(id)a3
{
}

- (NSString)filesystemType
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setFilesystemType:(id)a3
{
}

- (BOOL)isValid
{
  return self->_isValid;
}

- (void)setIsValid:(BOOL)a3
{
  self->_isValid = a3;
}

- (NSString)volumeName
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setVolumeName:(id)a3
{
}

- (NSString)volumeUUID
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setVolumeUUID:(id)a3
{
}

- (NSString)mediaUUID
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setMediaUUID:(id)a3
{
}

- (NSString)mountPoint
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)setMountPoint:(id)a3
{
}

- (unint64_t)freeSpace
{
  return self->_freeSpace;
}

- (void)setFreeSpace:(unint64_t)a3
{
  self->_freeSpace = a3;
}

- (unint64_t)purgeableSpace
{
  return self->_purgeableSpace;
}

- (void)setPurgeableSpace:(unint64_t)a3
{
  self->_purgeableSpace = a3;
}

- (unint64_t)availableSpace
{
  return self->_availableSpace;
}

- (void)setAvailableSpace:(unint64_t)a3
{
  self->_availableSpace = a3;
}

- (unint64_t)totalSpace
{
  return self->_totalSpace;
}

- (void)setTotalSpace:(unint64_t)a3
{
  self->_totalSpace = a3;
}

- (NSString)diskIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 112, 1);
}

- (void)setDiskIdentifier:(id)a3
{
}

- (BOOL)isDiskImage
{
  return self->_isDiskImage;
}

- (void)setIsDiskImage:(BOOL)a3
{
  self->_isDiskImage = a3;
}

- (BOOL)isInternal
{
  return self->_isInternal;
}

- (void)setIsInternal:(BOOL)a3
{
  self->_isInternal = a3;
}

- (BOOL)isRemovable
{
  return self->_isRemovable;
}

- (void)setIsRemovable:(BOOL)a3
{
  self->_isRemovable = a3;
}

- (BOOL)isWholeDisk
{
  return self->_isWholeDisk;
}

- (void)setIsWholeDisk:(BOOL)a3
{
  self->_isWholeDisk = a3;
}

- (BOOL)isPhysicalDisk
{
  return self->_isPhysicalDisk;
}

- (void)setIsPhysicalDisk:(BOOL)a3
{
  self->_isPhysicalDisk = a3;
}

- (BOOL)canPartitionDisk
{
  return self->_canPartitionDisk;
}

- (void)setCanPartitionDisk:(BOOL)a3
{
  self->_canPartitionDisk = a3;
}

- (BOOL)supportsJournaling
{
  return self->_supportsJournaling;
}

- (void)setSupportsJournaling:(BOOL)a3
{
  self->_supportsJournaling = a3;
}

- (BOOL)isJournaled
{
  return self->_isJournaled;
}

- (void)setIsJournaled:(BOOL)a3
{
  self->_isJournaled = a3;
}

- (BOOL)isLocked
{
  return self->_isLocked;
}

- (void)setIsLocked:(BOOL)a3
{
  self->_isLocked = a3;
}

- (NSString)ioContent
{
  return (NSString *)objc_getProperty(self, a2, 120, 1);
}

- (void)setIoContent:(id)a3
{
}

- (BOOL)supportsRepair
{
  return self->_supportsRepair;
}

- (void)setSupportsRepair:(BOOL)a3
{
  self->_supportsRepair = a3;
}

- (BOOL)supportsVerify
{
  return self->_supportsVerify;
}

- (void)setSupportsVerify:(BOOL)a3
{
  self->_supportsVerify = a3;
}

- (unint64_t)unformattedSize
{
  return self->_unformattedSize;
}

- (void)setUnformattedSize:(unint64_t)a3
{
  self->_unformattedSize = a3;
}

- (BOOL)isCaseSensitive
{
  return self->_isCaseSensitive;
}

- (void)setIsCaseSensitive:(BOOL)a3
{
  self->_isCaseSensitive = a3;
}

- (unint64_t)childCount
{
  return self->_childCount;
}

- (void)setChildCount:(unint64_t)a3
{
  self->_childCount = a3;
}

- (unint64_t)startLocation
{
  return self->_startLocation;
}

- (void)setStartLocation:(unint64_t)a3
{
  self->_startLocation = a3;
}

- (SKFilesystem)filesystem
{
  return (SKFilesystem *)objc_getProperty(self, a2, 152, 1);
}

- (void)setFilesystem:(id)a3
{
}

- (NSString)role
{
  return (NSString *)objc_getProperty(self, a2, 160, 1);
}

- (void)setRole:(id)a3
{
}

- (BOOL)isOSInternal
{
  return self->_isOSInternal;
}

- (void)setIsOSInternal:(BOOL)a3
{
  self->_isOSInternal = a3;
}

- (BOOL)isPartitionDisk
{
  return self->_isPartitionDisk;
}

- (void)setIsPartitionDisk:(BOOL)a3
{
  self->_isPartitionDisk = a3;
}

- (BOOL)isWritable
{
  return self->_isWritable;
}

- (void)setIsWritable:(BOOL)a3
{
  self->_isWritable = a3;
}

- (BOOL)isMediaWritable
{
  return self->_isMediaWritable;
}

- (void)setIsMediaWritable:(BOOL)a3
{
  self->_isMediaWritable = a3;
}

- (NSNumber)diskObjectID
{
  return self->_diskObjectID;
}

- (void)setDiskObjectID:(id)a3
{
}

- (NSObject)daDisk
{
  return objc_getProperty(self, a2, 176, 1);
}

- (void)setDaDisk:(id)a3
{
}

- (unsigned)ownerUID
{
  return self->_ownerUID;
}

- (void)setOwnerUID:(unsigned int)a3
{
  self->_ownerUID = a3;
}

- (SKDiskPrivateCache)privateCache
{
  return self->_privateCache;
}

- (void)setPrivateCache:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privateCache, 0);
  objc_storeStrong((id *)&self->_daDisk, 0);
  objc_storeStrong((id *)&self->_diskObjectID, 0);
  objc_storeStrong((id *)&self->_role, 0);
  objc_storeStrong((id *)&self->_filesystem, 0);
  objc_storeStrong((id *)&self->_ioContent, 0);
  objc_storeStrong((id *)&self->_diskIdentifier, 0);
  objc_storeStrong((id *)&self->_mountPoint, 0);
  objc_storeStrong((id *)&self->_mediaUUID, 0);
  objc_storeStrong((id *)&self->_volumeUUID, 0);
  objc_storeStrong((id *)&self->_volumeName, 0);
  objc_storeStrong((id *)&self->_filesystemType, 0);

  objc_storeStrong((id *)&self->_type, 0);
}

- (id)formattableFilesystems
{
  if ([(SKDisk *)self isMediaWritable])
  {
    char v3 = +[SKBaseManager sharedManager];
    id v4 = [v3 formatableFileSystems];

    if ([(SKDisk *)self isExternal])
    {
      id v5 = [MEMORY[0x263F08A98] predicateWithBlock:&__block_literal_global_6];
      id v6 = [v4 filteredArrayUsingPredicate:v5];
    }
    else
    {
      id v5 = +[SKFilesystem allFilesystems];
      id v7 = [MEMORY[0x263F08A98] predicateWithBlock:&__block_literal_global_17];
      id v8 = [v4 filteredArrayUsingPredicate:v7];

      uint64_t v9 = [MEMORY[0x263F08A98] predicateWithBlock:&__block_literal_global_19_0];
      BOOL v10 = [v5 filteredArrayUsingPredicate:v9];

      char v11 = [v8 arrayByAddingObjectsFromArray:v10];
      id v6 = [v11 sortedArrayWithOptions:16 usingComparator:&__block_literal_global_22];
    }
  }
  else
  {
    id v6 = (void *)MEMORY[0x263EFFA68];
  }

  return v6;
}

uint64_t __39__SKDisk_Erase__formattableFilesystems__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isExtension];
}

uint64_t __39__SKDisk_Erase__formattableFilesystems__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  char v3 = [v2 majorType];
  if ([v3 isEqualToString:@"hfs"])
  {
    uint64_t v4 = 0;
  }
  else
  {
    id v5 = [v2 majorType];
    uint64_t v4 = [v5 isEqualToString:@"apfs"] ^ 1;
  }
  return v4;
}

uint64_t __39__SKDisk_Erase__formattableFilesystems__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  char v3 = [v2 majorType];
  if ([v3 isEqualToString:@"apfs"]) {
    uint64_t v4 = [v2 isExtension] ^ 1;
  }
  else {
    uint64_t v4 = 0;
  }

  return v4;
}

uint64_t __39__SKDisk_Erase__formattableFilesystems__block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  int v6 = [v4 sortPriority];
  if (v6 >= (int)[v5 sortPriority])
  {
    int v8 = [v4 sortPriority];
    uint64_t v7 = v8 > (int)[v5 sortPriority];
  }
  else
  {
    uint64_t v7 = -1;
  }

  return v7;
}

- (id)formattableFilesystemWithFilesystem:(id)a3
{
  id v4 = a3;
  id v5 = [(SKDisk *)self formattableFilesystems];
  if (([v5 containsObject:v4] & 1) == 0)
  {
    int v6 = (void *)MEMORY[0x263F08A98];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __53__SKDisk_Erase__formattableFilesystemWithFilesystem___block_invoke;
    v11[3] = &unk_26506BFD8;
    id v12 = v4;
    id v7 = v4;
    int v8 = [v6 predicateWithBlock:v11];
    uint64_t v9 = [v5 filteredArrayUsingPredicate:v8];

    if ([v9 count])
    {
      id v4 = [v9 firstObject];
    }
    else
    {
      id v4 = 0;
    }
  }

  return v4;
}

uint64_t __53__SKDisk_Erase__formattableFilesystemWithFilesystem___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isExtensionInsensitiveEqual:*(void *)(a1 + 32)];
}

- (BOOL)cleanupWithError:(id *)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [(SKDisk *)self children];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        if (![*(id *)(*((void *)&v11 + 1) + 8 * i) cleanupWithError:a3])
        {
          BOOL v9 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v9 = 1;
LABEL_11:

  return v9;
}

- (unsigned)getSectorSize
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  unsigned int v16 = 512;
  char v3 = [(SKDisk *)self diskIdentifier];

  if (!v3)
  {
    long long v11 = SKGetOSLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v18 = "-[SKDisk(Erase) getSectorSize]";
      __int16 v19 = 2112;
      uint64_t v20 = self;
      long long v12 = "%s: Disk %@, does not have a BSD name";
      long long v13 = v11;
      uint32_t v14 = 22;
LABEL_12:
      _os_log_impl(&dword_23F40C000, v13, OS_LOG_TYPE_ERROR, v12, buf, v14);
    }
LABEL_13:

    return 512;
  }
  id v4 = NSString;
  uint64_t v5 = [(SKDisk *)self diskIdentifier];
  id v6 = [v4 stringWithFormat:@"/dev/r%@", v5];
  int v7 = open((const char *)[v6 fileSystemRepresentation], 0);

  if (v7 < 0)
  {
    long long v11 = SKGetOSLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v15 = *__error();
      *(_DWORD *)buf = 136315650;
      uint64_t v18 = "-[SKDisk(Erase) getSectorSize]";
      __int16 v19 = 2112;
      uint64_t v20 = self;
      __int16 v21 = 1024;
      int v22 = v15;
      long long v12 = "%s: Failed to get block size of %@, open err %d";
      long long v13 = v11;
      uint32_t v14 = 28;
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  if (ioctl(v7, 0x40046418uLL, &v16))
  {
    int v8 = SKGetOSLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v9 = *__error();
      *(_DWORD *)buf = 136315650;
      uint64_t v18 = "-[SKDisk(Erase) getSectorSize]";
      __int16 v19 = 2112;
      uint64_t v20 = self;
      __int16 v21 = 1024;
      int v22 = v9;
      _os_log_impl(&dword_23F40C000, v8, OS_LOG_TYPE_ERROR, "%s: Failed to get block size of %@, ioctl err %d", buf, 0x1Cu);
    }
  }
  close(v7);
  return v16;
}

- (BOOL)wipeDiskWithError:(id *)a3
{
  uint64_t v5 = [(SKDisk *)self diskIdentifier];

  if (!v5)
  {
    long long v13 = @"Disk does not have a BSD name";
    uint64_t v14 = 22;
LABEL_7:
    return +[SKError failWithPOSIXCode:v14 debugDescription:v13 error:a3];
  }
  id v6 = NSString;
  int v7 = [(SKDisk *)self diskIdentifier];
  id v8 = [v6 stringWithFormat:@"/dev/r%@", v7];
  int v9 = open((const char *)[v8 fileSystemRepresentation], 2);

  if (v9 < 0)
  {
    uint64_t v14 = *__error();
    long long v13 = @"Failed to open disk";
    goto LABEL_7;
  }
  [(SKDisk *)self getSectorSize];
  uint64_t v10 = wipefs_alloc();
  if (v10)
  {
    uint64_t v11 = v10;
    close(v9);
    long long v12 = @"wipefs_alloc failed";
  }
  else
  {
    uint64_t v11 = wipefs_wipe();
    wipefs_free();
    close(v9);
    if (!v11) {
      return 1;
    }
    long long v12 = @"wipefs_wipe failed";
  }
  return +[SKError failWithPOSIXCode:v11 debugDescription:v12 error:a3];
}

- (void)updateWithDictionary:(uint8_t *)buf .cold.1(void *a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543618;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(void *)(buf + 14) = a2;
  _os_log_impl(&dword_23F40C000, log, OS_LOG_TYPE_ERROR, "Invalid Class Update: %{public}@ -> %{public}@", buf, 0x16u);
}

@end