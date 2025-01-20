@interface SKDiskPrivateCache
- (BOOL)isLiveFSContainer;
- (NSArray)sortedChildren;
- (NSObject)wholeDADisk;
- (NSString)liveDiskIdentifier;
- (NSString)rawIOContent;
- (NSString)volumeKind;
- (NSString)volumeType;
- (SKDiskPrivateCache)init;
- (id)copyHumanIOContentWithMediaDict:(id)a3 isWholeDisk:(BOOL)a4;
- (int)schemeID;
- (int64_t)mountFlags;
- (void)setIsLiveFSContainer:(BOOL)a3;
- (void)setLiveDiskIdentifier:(id)a3;
- (void)setMountFlags:(int64_t)a3;
- (void)setRawIOContent:(id)a3;
- (void)setSchemeID:(int)a3;
- (void)setSortedChildren:(id)a3;
- (void)setVolumeKind:(id)a3;
- (void)setVolumeType:(id)a3;
- (void)setWholeDADisk:(id)a3;
@end

@implementation SKDiskPrivateCache

- (SKDiskPrivateCache)init
{
  v3.receiver = self;
  v3.super_class = (Class)SKDiskPrivateCache;
  result = [(SKDiskPrivateCache *)&v3 init];
  if (result) {
    result->_schemeID = 512;
  }
  return result;
}

- (id)copyHumanIOContentWithMediaDict:(id)a3 isWholeDisk:(BOOL)a4
{
  BOOL v4 = a4;
  v6 = [a3 objectForKeyedSubscript:@"Content"];
  [(SKDiskPrivateCache *)self setRawIOContent:v6];

  v7 = [(SKDiskPrivateCache *)self rawIOContent];

  if (!v7) {
    return 0;
  }
  if (v4)
  {
    id v8 = [(SKDiskPrivateCache *)self rawIOContent];
  }
  else
  {
    v10 = [SKIOMedia alloc];
    v11 = [(SKDiskPrivateCache *)self wholeDADisk];
    v12 = [(SKIOMedia *)v10 initWithDADisk:v11];

    id v8 = [(SKIOObject *)v12 copyPropertyWithClass:objc_opt_class() key:@"Content"];
  }
  if (sub_1000121D4(v8))
  {
    id v13 = v8;
    if ([v13 isEqualToString:@"Apple_partition_scheme"])
    {
      uint64_t v14 = 1;
    }
    else if ([v13 isEqualToString:@"FDisk_partition_scheme"])
    {
      uint64_t v14 = 8;
    }
    else if ([v13 isEqualToString:@"GUID_partition_scheme"])
    {
      uint64_t v14 = 16;
    }
    else
    {
      uint64_t v14 = 512;
    }
  }
  else
  {
    uint64_t v14 = 512;
  }
  [(SKDiskPrivateCache *)self setSchemeID:v14];
  if ([(SKDiskPrivateCache *)self schemeID] == 512)
  {
    if (v4)
    {
      uint64_t v15 = 0;
      v16 = 0;
      while (1)
      {
        v17 = v16;
        v18 = [(SKDiskPrivateCache *)self rawIOContent];
        v16 = (void *)MKTypeToHuman();

        if (v16)
        {
          v19 = [(SKDiskPrivateCache *)self rawIOContent];
          unsigned int v20 = [v16 isEqualToString:v19];

          if (!v20) {
            break;
          }
        }
        v15 += 4;
        if (v15 == 16)
        {
          if (v16) {
            break;
          }
          goto LABEL_28;
        }
      }
LABEL_25:
      v22 = [(SKDiskPrivateCache *)self rawIOContent];
      unsigned int v23 = [v16 isEqualToString:v22];

      if (!v23) {
        goto LABEL_29;
      }
      goto LABEL_28;
    }
    v16 = 0;
  }
  else
  {
    [(SKDiskPrivateCache *)self schemeID];
    v21 = [(SKDiskPrivateCache *)self rawIOContent];
    v16 = (void *)MKTypeToHuman();

    if (v16) {
      goto LABEL_25;
    }
  }
LABEL_28:
  v24 = [(SKDiskPrivateCache *)self rawIOContent];
  uint64_t v25 = [&off_10004BD60 objectForKey:v24];

  v16 = (void *)v25;
LABEL_29:
  if (sub_1000121D4(v16))
  {
    id v26 = v16;
  }
  else
  {
    id v26 = [(SKDiskPrivateCache *)self rawIOContent];
  }
  v9 = v26;

  return v9;
}

- (NSObject)wholeDADisk
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)setWholeDADisk:(id)a3
{
}

- (int)schemeID
{
  return self->_schemeID;
}

- (void)setSchemeID:(int)a3
{
  self->_schemeID = a3;
}

- (NSString)rawIOContent
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setRawIOContent:(id)a3
{
}

- (NSString)volumeKind
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setVolumeKind:(id)a3
{
}

- (NSString)volumeType
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setVolumeType:(id)a3
{
}

- (NSString)liveDiskIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setLiveDiskIdentifier:(id)a3
{
}

- (BOOL)isLiveFSContainer
{
  return self->_isLiveFSContainer;
}

- (void)setIsLiveFSContainer:(BOOL)a3
{
  self->_isLiveFSContainer = a3;
}

- (int64_t)mountFlags
{
  return self->_mountFlags;
}

- (void)setMountFlags:(int64_t)a3
{
  self->_mountFlags = a3;
}

- (NSArray)sortedChildren
{
  return (NSArray *)objc_getProperty(self, a2, 64, 1);
}

- (void)setSortedChildren:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sortedChildren, 0);
  objc_storeStrong((id *)&self->_liveDiskIdentifier, 0);
  objc_storeStrong((id *)&self->_volumeType, 0);
  objc_storeStrong((id *)&self->_volumeKind, 0);
  objc_storeStrong((id *)&self->_rawIOContent, 0);

  objc_storeStrong((id *)&self->_wholeDADisk, 0);
}

@end