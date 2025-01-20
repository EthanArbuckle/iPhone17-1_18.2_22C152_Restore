@interface MBFileMetadata
+ (id)fileMetadataExcludingAssetForPath:(id)a3 error:(id *)a4;
+ (id)fileMetadataExcludingAssetForPath:(id)a3 modifiedDate:(int64_t *)a4 error:(id *)a5;
+ (id)fileMetadataExcludingXattrsAndAssetFromNode:(id *)a3 error:(id *)a4;
+ (id)fileMetadataFromNode:(id *)a3 xattrs:(id)a4 linkTarget:(id)a5 assetMetadata:(id)a6 error:(id *)a7;
+ (unint64_t)modificationTypeForMetadata:(id)a3 oldMetadata:(id)a4;
- ($6C919C46D73A682F6A7B6C938636C930)mbNode;
- (BOOL)isEqual:(id)a3;
- (MBAssetMetadata)assetMetadata;
- (NSDictionary)xattrs;
- (NSString)linkTarget;
- (id)description;
- (id)dictionaryRepresentation;
- (id)stringRepresentationWithAssetMetadata:(BOOL)a3;
- (int64_t)modified;
- (int64_t)size;
- (int64_t)statusChanged;
- (unint64_t)inode;
- (unsigned)genCount;
- (unsigned)mode;
- (void)getNode:(id *)a3;
- (void)setAssetMetadata:(id)a3;
- (void)setLinkTarget:(id)a3;
- (void)setXattrs:(id)a3;
@end

@implementation MBFileMetadata

- (unint64_t)inode
{
  return self->_mbNode.inode;
}

- (unsigned)mode
{
  return WORD2(self->_mbNode.cloneID);
}

- (int64_t)modified
{
  return self->_mbNode.modified;
}

- (int64_t)statusChanged
{
  return self->_mbNode.statusChanged;
}

- (unsigned)genCount
{
  return self->_mbNode.genCount;
}

- (int64_t)size
{
  return self->_mbNode.fileSize;
}

- (void)getNode:(id *)a3
{
  *(_OWORD *)&a3->var0 = *(_OWORD *)&self->_mbNode.direntCount;
  long long v3 = *(_OWORD *)&self->_mbNode.birth;
  long long v4 = *(_OWORD *)&self->_mbNode.statusChanged;
  long long v5 = *(_OWORD *)&self->_mbNode.inode;
  a3->var10 = self->_mbNode.cloneID;
  *(_OWORD *)&a3->var6 = v4;
  *(_OWORD *)&a3->var8 = v5;
  *(_OWORD *)&a3->var4 = v3;
}

- (void)setXattrs:(id)a3
{
  id v5 = a3;
  if (v5 && [v5 count])
  {
    objc_storeStrong((id *)&self->_xattrs, a3);
    char v6 = HIBYTE(self->_mbNode.cloneID) | 4;
  }
  else
  {
    char v6 = HIBYTE(self->_mbNode.cloneID) & 0xFB;
  }
  HIBYTE(self->_mbNode.cloneID) = v6;
  _objc_release_x1();
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    char v6 = v5;
    memset(v15, 0, 56);
    if (v5) {
      objc_msgSend(v5, "mbNode", *(void *)&v15[0]);
    }
    if (!WORD2(self->_mbNode.cloneID)
      && self->_mbNode.userID == DWORD1(v15[0])
      && *(_OWORD *)&self->_mbNode.groupID == *(_OWORD *)((char *)v15 + 8)
      && *(_OWORD *)&self->_mbNode.modified == *(_OWORD *)((char *)&v15[1] + 8)
      && *(_OWORD *)&self->_mbNode.fileSize == *(_OWORD *)((char *)&v15[2] + 8)
      && !BYTE6(self->_mbNode.cloneID)
      && (self->_mbNode.cloneID & 0x400000000000000) == 0)
    {
      v8 = [(MBFileMetadata *)self xattrs];
      if ([v8 count])
      {
      }
      else
      {
        v9 = [v6 xattrs];
        id v10 = [v9 count];

        if (!v10)
        {
LABEL_16:
          BOOL v7 = 1;
LABEL_18:

          goto LABEL_19;
        }
      }
      v11 = [(MBFileMetadata *)self xattrs];
      v12 = [v6 xattrs];
      unsigned int v13 = [v11 isEqualToDictionary:v12];

      if (v13) {
        goto LABEL_16;
      }
    }
    BOOL v7 = 0;
    goto LABEL_18;
  }
  BOOL v7 = 0;
LABEL_19:

  return v7;
}

- (id)dictionaryRepresentation
{
  long long v3 = objc_opt_new();
  id v4 = +[NSNumber numberWithUnsignedShort:WORD2(self->_mbNode.cloneID)];
  [v3 setObject:v4 forKeyedSubscript:@"mode"];

  id v5 = +[NSNumber numberWithInt:WORD2(self->_mbNode.cloneID) & 0xF000];
  [v3 setObject:v5 forKeyedSubscript:@"type"];

  char v6 = +[NSNumber numberWithUnsignedInt:self->_mbNode.userID];
  [v3 setObject:v6 forKeyedSubscript:@"userID"];

  BOOL v7 = +[NSNumber numberWithUnsignedInt:self->_mbNode.groupID];
  [v3 setObject:v7 forKeyedSubscript:@"groupID"];

  v8 = +[NSNumber numberWithUnsignedInt:self->_mbNode.flags];
  [v3 setObject:v8 forKeyedSubscript:@"flags"];

  v9 = +[NSNumber numberWithLong:self->_mbNode.birth];
  [v3 setObject:v9 forKeyedSubscript:@"birth"];

  id v10 = +[NSNumber numberWithLong:self->_mbNode.modified];
  [v3 setObject:v10 forKeyedSubscript:@"modified"];

  v11 = +[NSNumber numberWithLong:self->_mbNode.statusChanged];
  [v3 setObject:v11 forKeyedSubscript:@"statusChanged"];

  v12 = +[NSNumber numberWithLongLong:self->_mbNode.fileSize];
  [v3 setObject:v12 forKeyedSubscript:@"size"];

  unsigned int v13 = +[NSNumber numberWithUnsignedLongLong:self->_mbNode.inode];
  [v3 setObject:v13 forKeyedSubscript:@"inode"];

  v14 = +[NSNumber numberWithUnsignedLongLong:*(void *)(&self->_mbNode.genCount + 1)];
  [v3 setObject:v14 forKeyedSubscript:@"cloneID"];

  v15 = +[NSNumber numberWithUnsignedChar:BYTE6(self->_mbNode.cloneID)];
  [v3 setObject:v15 forKeyedSubscript:@"pc"];

  v16 = +[NSNumber numberWithBool:HIBYTE(self->_mbNode.cloneID) & 1];
  [v3 setObject:v16 forKeyedSubscript:@"isHardlink"];

  v17 = +[NSNumber numberWithBool:(HIBYTE(self->_mbNode.cloneID) >> 1) & 1];
  [v3 setObject:v17 forKeyedSubscript:@"isFullClone"];

  v18 = +[NSNumber numberWithBool:(HIBYTE(self->_mbNode.cloneID) >> 2) & 1];
  [v3 setObject:v18 forKeyedSubscript:@"hasXattrs"];

  v19 = +[NSNumber numberWithUnsignedInt:self->_mbNode.direntCount];
  [v3 setObject:v19 forKeyedSubscript:@"direntCount"];

  [v3 setObject:self->_linkTarget forKeyedSubscript:@"target"];
  v20 = +[NSNumber numberWithUnsignedInt:self->_mbNode.genCount];
  [v3 setObject:v20 forKeyedSubscript:@"genCount"];

  v21 = [(MBAssetMetadata *)self->_assetMetadata dictionaryRepresentation];
  [v3 setObject:v21 forKeyedSubscript:@"assetMetadata"];

  v22 = +[NSNumber numberWithBool:(self->_mbNode.flags >> 30) & 1];
  [v3 setObject:v22 forKeyedSubscript:@"isDataless"];

  if ((self->_mbNode.cloneID & 0x400000000000000) != 0)
  {
    v23 = objc_opt_new();
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    v24 = [(MBFileMetadata *)self xattrs];
    id v25 = [v24 countByEnumeratingWithState:&v34 objects:v38 count:16];
    if (v25)
    {
      id v26 = v25;
      uint64_t v27 = *(void *)v35;
      do
      {
        for (i = 0; i != v26; i = (char *)i + 1)
        {
          if (*(void *)v35 != v27) {
            objc_enumerationMutation(v24);
          }
          uint64_t v29 = *(void *)(*((void *)&v34 + 1) + 8 * i);
          v30 = [(MBFileMetadata *)self xattrs];
          v31 = [v30 objectForKeyedSubscript:v29];

          v32 = [v31 base64EncodedStringWithOptions:0];
          [v23 setObject:v32 forKeyedSubscript:v29];
        }
        id v26 = [v24 countByEnumeratingWithState:&v34 objects:v38 count:16];
      }
      while (v26);
    }

    [v3 setObject:v23 forKeyedSubscript:@"xattrs"];
  }
  return v3;
}

- (id)stringRepresentationWithAssetMetadata:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = WORD2(self->_mbNode.cloneID);
  int v6 = v5 & 0xF000;
  if (v6 == 0x4000)
  {
    long long v55 = *(_OWORD *)&self->_mbNode.birth;
    long long v52 = *(_OWORD *)&self->_mbNode.statusChanged;
    BOOL v14 = a3;
    unint64_t inode = self->_mbNode.inode;
    uint64_t v16 = BYTE6(self->_mbNode.cloneID);
    uint64_t v17 = (HIBYTE(self->_mbNode.cloneID) >> 2) & 1;
    uint64_t userID = self->_mbNode.userID;
    uint64_t groupID = self->_mbNode.groupID;
    uint64_t flags = self->_mbNode.flags;
    unsigned int v13 = [(MBFileMetadata *)self xattrs];
    unint64_t v44 = inode;
    BOOL v3 = v14;
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"(dir) mode 0%o, u/gid %d/%d, flags 0x%x, b/m/ctime %ld/%ld/%ld, size %llu, ino %llu, pc %hhu, hasXattrs %d(%llu)", v5, userID, groupID, flags, v55, v52, v44, v16, v17, [v13 count], v46);
  }
  else
  {
    if (v6 != 0x8000)
    {
      BOOL v57 = a3;
      long long v54 = *(_OWORD *)&self->_mbNode.birth;
      long long v51 = *(_OWORD *)&self->_mbNode.statusChanged;
      if (v6 == 40960)
      {
        unint64_t v7 = self->_mbNode.inode;
        uint64_t v8 = BYTE6(self->_mbNode.cloneID);
        uint64_t v9 = (HIBYTE(self->_mbNode.cloneID) >> 2) & 1;
        uint64_t v10 = self->_mbNode.userID;
        uint64_t v11 = self->_mbNode.groupID;
        uint64_t v12 = self->_mbNode.flags;
        unsigned int v13 = [(MBFileMetadata *)self xattrs];
        +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"(symlink) mode 0%o, u/gid %d/%d, flags 0x%x, b/m/ctime %ld/%ld/%ld, size %llu, ino %llu, pc %hhu hasXattrs %d(%llu), target %@", v5, v10, v11, v12, v54, v51, v7, v8, v9, [v13 count], self->_linkTarget);
      }
      else
      {
        unint64_t v28 = self->_mbNode.inode;
        uint64_t v29 = BYTE6(self->_mbNode.cloneID);
        uint64_t v30 = (HIBYTE(self->_mbNode.cloneID) >> 2) & 1;
        uint64_t v31 = self->_mbNode.userID;
        uint64_t v32 = self->_mbNode.groupID;
        uint64_t v33 = self->_mbNode.flags;
        unsigned int v13 = [(MBFileMetadata *)self xattrs];
        +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"(unsupported) mode 0%o, u/gid %d/%d, flags 0x%x, b/m/ctime %ld/%ld/%ld, size %llu, ino %llu, pc %hhu, hasXattrs %d(%llu)", v5, v31, v32, v33, v54, v51, v28, v29, v30, [v13 count], v46);
      long long v34 = };
      BOOL v3 = v57;
      goto LABEL_13;
    }
    uint64_t v56 = self->_mbNode.userID;
    uint64_t v53 = self->_mbNode.groupID;
    uint64_t v50 = self->_mbNode.flags;
    int64_t statusChanged = self->_mbNode.statusChanged;
    int64_t modified = self->_mbNode.modified;
    int64_t birth = self->_mbNode.birth;
    int64_t fileSize = self->_mbNode.fileSize;
    unint64_t v22 = self->_mbNode.inode;
    uint64_t genCount = self->_mbNode.genCount;
    uint64_t v25 = (HIBYTE(self->_mbNode.cloneID) >> 2) & 1;
    uint64_t v26 = BYTE6(self->_mbNode.cloneID);
    unsigned int v13 = [(MBFileMetadata *)self xattrs];
    id v47 = [v13 count];
    if (fileSize)
    {
      *((void *)&v43 + 1) = fileSize;
      unint64_t v45 = v22;
      int64_t v42 = modified;
      *(void *)&long long v43 = statusChanged;
      uint64_t v40 = v50;
      int64_t v41 = birth;
      uint64_t v39 = v53;
      CFStringRef v27 = @"(reg) mode 0%o, u/gid %d/%d, flags 0x%x, b/m/ctime %ld/%ld/%ld, size %llu, ino %llu, gen %u, pc %hhu, hasXattrs %d(%llu)";
    }
    else
    {
      unint64_t v45 = v22;
      int64_t v42 = modified;
      long long v43 = (unint64_t)statusChanged;
      uint64_t v40 = v50;
      int64_t v41 = birth;
      uint64_t v39 = v53;
      CFStringRef v27 = @"(reg-empty) mode 0%o, u/gid %d/%d, flags 0x%x, b/m/ctime %ld/%ld/%ld, size %llu, ino %llu, gen %u, pc %hhu, hasXattrs %d(%llu)";
    }
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", v27, v5, v56, v39, v40, v41, v42, v43, v45, genCount, v26, v25, v47);
  long long v34 = };
LABEL_13:

  if (v3 && (assetMetadata = self->_assetMetadata) != 0)
  {
    long long v36 = [(MBAssetMetadata *)assetMetadata stringRepresentation];
    id v37 = +[NSString stringWithFormat:@"%@, %@", v34, v36];
  }
  else
  {
    id v37 = v34;
  }

  return v37;
}

- (id)description
{
  BOOL v3 = [(MBFileMetadata *)self stringRepresentationWithAssetMetadata:0];
  id v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = +[NSString stringWithFormat:@"<%s: %p, %@>", class_getName(v4), self, v3];

  return v5;
}

+ (id)fileMetadataFromNode:(id *)a3 xattrs:(id)a4 linkTarget:(id)a5 assetMetadata:(id)a6 error:(id *)a7
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  uint64_t v13 = objc_opt_new();
  *(_OWORD *)(v13 + 32) = *(_OWORD *)&a3->var0;
  long long v15 = *(_OWORD *)&a3->var6;
  long long v14 = *(_OWORD *)&a3->var8;
  long long v16 = *(_OWORD *)&a3->var4;
  *(void *)(v13 + 96) = a3->var10;
  *(_OWORD *)(v13 + 64) = v15;
  *(_OWORD *)(v13 + 80) = v14;
  *(_OWORD *)(v13 + 48) = v16;
  [(id)v13 setLinkTarget:v11];

  [(id)v13 setXattrs:v12];
  [(id)v13 setAssetMetadata:v10];

  return (id)v13;
}

+ (id)fileMetadataExcludingXattrsAndAssetFromNode:(id *)a3 error:(id *)a4
{
  int v6 = objc_opt_class();
  return [v6 fileMetadataFromNode:a3 xattrs:0 linkTarget:0 assetMetadata:0 error:a4];
}

+ (id)fileMetadataExcludingAssetForPath:(id)a3 error:(id *)a4
{
  id v5 = a3;
  int v6 = [(id)objc_opt_class() fileMetadataExcludingAssetForPath:v5 modifiedDate:0 error:a4];

  return v6;
}

+ (id)fileMetadataExcludingAssetForPath:(id)a3 modifiedDate:(int64_t *)a4 error:(id *)a5
{
  id v7 = a3;
  uint64_t v19 = 0;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v8 = 0;
  if (MBNodeForPath(v7, (uint64_t)&v15, a5))
  {
    if (a4) {
      *((void *)&v16 + 1) = *a4;
    }
    id v9 = [v7 fileSystemRepresentation];
    if ((v19 & 0x400000000000000) != 0)
    {
      id v14 = 0;
      id v10 = +[MBExtendedAttributes attributesForPathFSR:v9 error:&v14];
      id v11 = v14;
      if (v11)
      {
        id v12 = v11;
        uint64_t v8 = 0;
        if (a5) {
          *a5 = v11;
        }
        goto LABEL_14;
      }
    }
    else
    {
      id v10 = 0;
    }
    if ((WORD2(v19) & 0xF000) == 0xA000)
    {
      id v12 = +[MBFileOperation symbolicLinkTargetWithPathFSR:v9 error:a5];
      if (!v12)
      {
        uint64_t v8 = 0;
LABEL_15:

        goto LABEL_16;
      }
    }
    else
    {
      id v12 = 0;
    }
    uint64_t v8 = +[MBFileMetadata fileMetadataFromNode:&v15 xattrs:v10 linkTarget:v12 assetMetadata:0 error:a5];
LABEL_14:

    goto LABEL_15;
  }
LABEL_16:

  return v8;
}

+ (unint64_t)modificationTypeForMetadata:(id)a3 oldMetadata:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v6)
  {
    [v6 mbNode];
    if (v5) {
      objc_msgSend(v5, "mbNode", 0);
    }
    __assert_rtn("+[MBFileMetadata modificationTypeForMetadata:oldMetadata:]", "MBFileMetadata.m", 384, "0");
  }

  return 1;
}

- (NSDictionary)xattrs
{
  return self->_xattrs;
}

- (NSString)linkTarget
{
  return self->_linkTarget;
}

- (void)setLinkTarget:(id)a3
{
}

- (MBAssetMetadata)assetMetadata
{
  return self->_assetMetadata;
}

- (void)setAssetMetadata:(id)a3
{
}

- ($6C919C46D73A682F6A7B6C938636C930)mbNode
{
  long long v3 = *(_OWORD *)&self[1].var0;
  *(_OWORD *)&retstr->var6 = *(_OWORD *)&self->var10;
  *(_OWORD *)&retstr->var8 = v3;
  retstr->var10 = self[1].var4;
  long long v4 = *(_OWORD *)&self->var8;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self->var6;
  *(_OWORD *)&retstr->var4 = v4;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetMetadata, 0);
  objc_storeStrong((id *)&self->_linkTarget, 0);
  objc_storeStrong((id *)&self->_xattrs, 0);
}

@end