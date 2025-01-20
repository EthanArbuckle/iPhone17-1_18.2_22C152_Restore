@interface MBFile
+ (BOOL)supportsSecureCoding;
+ (id)fileWithDecoder:(id)a3 database:(id)a4;
+ (id)fileWithDomain:(id)a3 relativePath:(id)a4;
+ (id)fileWithDomain:(id)a3 snapshotPath:(id)a4 relativePath:(id)a5;
- (BOOL)hasFlags;
- (BOOL)hasOverriddenModifiedDate;
- (BOOL)hasXattrs;
- (BOOL)isCommitted;
- (BOOL)isCompressed;
- (BOOL)isDataless;
- (BOOL)isDeleted;
- (BOOL)isDirectory;
- (BOOL)isFullClone;
- (BOOL)isHardLink;
- (BOOL)isRegularFile;
- (BOOL)isStatusChangedComparedToFile:(id)a3;
- (BOOL)isSymbolicLink;
- (MBDomain)domain;
- (MBDomain)nonRedirectedDomain;
- (MBFile)initWithCoder:(id)a3;
- (MBFile)initWithDecoder:(id)a3;
- (MBFile)initWithDecoder:(id)a3 database:(id)a4;
- (MBFile)initWithDomain:(id)a3 snapshotPath:(id)a4 relativePath:(id)a5;
- (MBFileID)fileID;
- (NSData)digest;
- (NSData)encryptionKey;
- (NSDate)birthDate;
- (NSDate)lastModifiedDate;
- (NSDate)lastStatusChangeDate;
- (NSDictionary)extendedAttributes;
- (NSString)absolutePath;
- (NSString)debugDescription;
- (NSString)description;
- (NSString)itemID;
- (NSString)livePath;
- (NSString)modeString;
- (NSString)relativePath;
- (NSString)snapshotPath;
- (NSString)target;
- (NSString)typeString;
- (const)absolutePathFSR;
- (const)keybagUUID;
- (id)backupSymbolicLinkTarget;
- (int64_t)birth;
- (int64_t)lastModified;
- (int64_t)lastStatusChange;
- (int64_t)size;
- (unint64_t)cloneID;
- (unint64_t)decryptedSize;
- (unint64_t)encryptionKeyVersion;
- (unint64_t)inodeNumber;
- (unint64_t)priority;
- (unint64_t)snapshotID;
- (unsigned)direntCount;
- (unsigned)genCount;
- (unsigned)groupID;
- (unsigned)keybagID;
- (unsigned)mode;
- (unsigned)permissions;
- (unsigned)protectionClass;
- (unsigned)type;
- (unsigned)userID;
- (void)dealloc;
- (void)encode:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)getNode:(id *)a3;
- (void)getStat:(stat *)a3;
- (void)setCommitted:(BOOL)a3;
- (void)setDecryptedSize:(unint64_t)a3;
- (void)setDeleted:(BOOL)a3;
- (void)setDigest:(id)a3;
- (void)setDomain:(id)a3;
- (void)setEncryptionKey:(id)a3;
- (void)setEncryptionKeyVersion:(unint64_t)a3;
- (void)setExtendedAttributes:(id)a3;
- (void)setKeybagID:(unsigned int)a3;
- (void)setLastModified:(int64_t)a3;
- (void)setNode:(id *)a3;
- (void)setNonRedirectedDomain:(id)a3;
- (void)setPriority:(unint64_t)a3;
- (void)setProtectionClass:(unsigned __int8)a3;
- (void)setSnapshotID:(unint64_t)a3;
- (void)setTarget:(id)a3;
@end

@implementation MBFile

+ (id)fileWithDomain:(id)a3 snapshotPath:(id)a4 relativePath:(id)a5
{
  v5 = [[MBFile alloc] initWithDomain:a3 snapshotPath:a4 relativePath:a5];

  return v5;
}

+ (id)fileWithDomain:(id)a3 relativePath:(id)a4
{
  v4 = [[MBFile alloc] initWithDomain:a3 snapshotPath:0 relativePath:a4];

  return v4;
}

+ (id)fileWithDecoder:(id)a3 database:(id)a4
{
  v4 = [[MBFile alloc] initWithDecoder:a3 database:a4];

  return v4;
}

- (MBFile)initWithDecoder:(id)a3
{
  return 0;
}

- (MBFile)initWithDecoder:(id)a3 database:(id)a4
{
  v20.receiver = self;
  v20.super_class = (Class)MBFile;
  v6 = [(MBFile *)&v20 init];
  if (!v6) {
    return v6;
  }
  id v7 = [a3 decodeString];
  if (!v7)
  {
    id v16 = objc_alloc((Class)MBException);
    CFStringRef v17 = @"Domain name missing from file record";
LABEL_20:
    id v18 = [v16 initWithCode:11 format:v17, v19];
    goto LABEL_21;
  }
  id v8 = v7;
  v6->_nonRedirectedDomain = (MBDomain *)[a3 decodeString];
  if ((MBIsValidRelativePath() & 1) == 0)
  {
    id v16 = objc_alloc((Class)MBException);
    CFStringRef v17 = @"Invalid relative path in file record";
    goto LABEL_20;
  }
  v9 = (MBDomain *)[a4 domainManager][v8];
  v6->_domain = v9;
  if (!v9)
  {
    id v18 = [objc_alloc((Class)MBException) initWithCode:11, @"Unknown domain name in file record: \"%@\"", v8 format];
LABEL_21:
    objc_exception_throw(v18);
  }
  v6->_snapshotID = (unint64_t)[[objc_msgSend(objc_msgSend(a4, "domainManager"), "redirectDomain:forRelativePath:", v6->_domain, v6->_nonRedirectedDomain) stringByAppendingPathComponent:@"DBCShutdownCookie"];
  v6->_priority = (unint64_t)[a3 decodeString];
  v6->_target = (NSString *)[a3 decodeData];
  v6->_digest = (NSData *)[a3 decodeData];
  WORD2(v6->_mbNode.cloneID) = (unsigned __int16)[a3 decodeInt16];
  if (![(MBFile *)v6 isRegularFile]
    && ![(MBFile *)v6 isDirectory]
    && ![(MBFile *)v6 isSymbolicLink])
  {
    id v16 = objc_alloc((Class)MBException);
    CFStringRef v17 = @"File type missing from file record mode";
    goto LABEL_20;
  }
  if ([(MBFile *)v6 isSymbolicLink] && !v6->_priority)
  {
    id v16 = objc_alloc((Class)MBException);
    CFStringRef v17 = @"Target required for symbolic links";
    goto LABEL_20;
  }
  v6->_mbNode.inode = (unint64_t)[a3 decodeInt64];
  v6->_mbNode.userID = [a3 decodeInt32];
  v6->_mbNode.groupID = [a3 decodeInt32];
  v6->_mbNode.modified = (int)[a3 decodeInt32];
  v6->_mbNode.statusChanged = (int)[a3 decodeInt32];
  v6->_mbNode.birth = (int)[a3 decodeInt32];
  v6->_mbNode.fileSize = (int64_t)[a3 decodeInt64];
  if (![(MBFile *)v6 isRegularFile] && v6->_mbNode.fileSize)
  {
    id v16 = objc_alloc((Class)MBException);
    CFStringRef v17 = @"Non-zero size for a file record which is not a regular file";
    goto LABEL_20;
  }
  BYTE6(v6->_mbNode.cloneID) = [a3 decodeInt8];
  int v10 = [a3 decodeInt8];
  v11 = +[NSMutableDictionary dictionaryWithCapacity:v10];
  if (v10 >= 1)
  {
    while (1)
    {
      id v12 = [a3 decodeString];
      if (!v12)
      {
        id v16 = objc_alloc((Class)MBException);
        CFStringRef v17 = @"Null key for a file record extended attribute";
        goto LABEL_20;
      }
      id v13 = v12;
      id v14 = [a3 decodeData];
      if (!v14) {
        break;
      }
      [(NSMutableDictionary *)v11 setObject:v14 forKeyedSubscript:v13];
      if (!--v10) {
        goto LABEL_16;
      }
    }
    id v16 = objc_alloc((Class)MBException);
    CFStringRef v17 = @"Null value for a file record extended attribute";
    goto LABEL_20;
  }
LABEL_16:
  v6->_decryptedSize = (unint64_t)v11;
  return v6;
}

- (MBFile)initWithDomain:(id)a3 snapshotPath:(id)a4 relativePath:(id)a5
{
  if (a4 && ![a3 volumeMountPoint]) {
    sub_10009A234();
  }
  if (a3)
  {
    if (a5) {
      goto LABEL_5;
    }
  }
  else
  {
    +[NSException raise:NSInvalidArgumentException format:@"Null domain"];
    if (a5) {
      goto LABEL_5;
    }
  }
  +[NSException raise:NSInvalidArgumentException format:@"Null relative path"];
LABEL_5:
  v11.receiver = self;
  v11.super_class = (Class)MBFile;
  v9 = [(MBFile *)&v11 init];
  if (v9)
  {
    v9->_snapshotID = (unint64_t)a3;
    v9->_nonRedirectedDomain = (MBDomain *)a5;
    v9->_decryptedSize = (unint64_t)&__NSDictionary0__struct;
    v9->_relativePath = (NSString *)a4;
  }
  return v9;
}

- (void)dealloc
{
  v3 = *(void **)&self->_hasOverriddenModifiedDate;
  if (v3) {
    free(v3);
  }

  v4.receiver = self;
  v4.super_class = (Class)MBFile;
  [(MBFile *)&v4 dealloc];
}

- (NSString)description
{
  if ([self->_snapshotID hasRootPath]) {
    v3 = [(MBFile *)self absolutePath];
  }
  else {
    v3 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@:%@", [self->_snapshotID name], self->_nonRedirectedDomain);
  }
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<%@: %p; %@>",
           objc_opt_class(),
           self,
           v3);
}

- (NSString)debugDescription
{
  uint64_t v20 = objc_opt_class();
  uint64_t v19 = [(MBFile *)self fileID];
  id v18 = [(MBDomain *)[(MBFile *)self domain] name];
  CFStringRef v17 = [(MBFile *)self relativePath];
  id v16 = [(MBFile *)self target];
  v15 = [(MBFile *)self digest];
  id v14 = [(MBFile *)self encryptionKey];
  id v13 = [(MBFile *)self modeString];
  unint64_t v3 = [(MBFile *)self inodeNumber];
  uint64_t v4 = [(MBFile *)self userID];
  uint64_t v5 = [(MBFile *)self groupID];
  [(MBFile *)self lastModifiedDate];
  uint64_t v6 = MBStringWithDate();
  [(MBFile *)self lastStatusChangeDate];
  uint64_t v7 = MBStringWithDate();
  [(MBFile *)self birthDate];
  uint64_t v8 = MBStringWithDate();
  int64_t v9 = [(MBFile *)self size];
  unsigned int v10 = [(MBFile *)self protectionClass];
  unint64_t v11 = [(MBFile *)self priority];
  [(MBFile *)self extendedAttributes];
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<%@: fileID=%@, domain=%@, relativePath=%@, target=%@, digest=%@, encryptionKey=%@, mode=%@, inodeNumber=%llu, userID=%u, groupID=%u, lastModified=%@, lastStatusChange=%@, birth=%@, size=%llu, protectionClass=%d, priority=%lld extendedAttributes=%@>", v20, v19, v18, v17, v16, v15, v14, v13, v3, v4, v5, v6, v7, v8, v9, v10,
           v11,
           MBStringWithDictionary());
}

- (MBFileID)fileID
{
  result = *(MBFileID **)&self->_mbNode.mode;
  if (!result)
  {
    result = [[MBFileID alloc] initWithDomain:self->_snapshotID relativePath:self->_nonRedirectedDomain];
    *(void *)&self->_mbNode.mode = result;
  }
  return result;
}

- (NSString)absolutePath
{
  result = (NSString *)self->_absolutePathFSR;
  if (!result)
  {
    snapshotID = (void *)self->_snapshotID;
    if (!snapshotID)
    {
      [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:self file:@"MBFile.m" lineNumber:151 description:@"Null domain"];
      snapshotID = (void *)self->_snapshotID;
    }
    if ([snapshotID isUninstalledAppDomain]) {
      -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"MBFile.m", 152, @"No absolute path for file record (uninstalled app): %@/%@", [self->_snapshotID name], self->_nonRedirectedDomain);
    }
    relativePath = self->_relativePath;
    uint64_t v7 = (char *)[self->_snapshotID rootPath];
    if (relativePath)
    {
      [self->_snapshotID volumeMountPoint];
      uint64_t v7 = (char *)MBSnapshotPathFromLivePath();
      self->_absolutePathFSR = v7;
    }
    result = (NSString *)[v7 stringByAppendingPathComponent:self->_nonRedirectedDomain];
    self->_absolutePathFSR = (char *)result;
  }
  return result;
}

- (const)absolutePathFSR
{
  if (!*(void *)&self->_hasOverriddenModifiedDate)
  {
    CFStringRef v4 = [(MBFile *)self absolutePath];
    if (v4)
    {
      CFStringRef v5 = v4;
      CFIndex MaximumSizeOfFileSystemRepresentation = CFStringGetMaximumSizeOfFileSystemRepresentation(v4);
      uint64_t v7 = (char *)malloc_type_malloc(MaximumSizeOfFileSystemRepresentation, 0x7D6C621uLL);
      *(void *)&self->_hasOverriddenModifiedDate = v7;
      if (!CFStringGetFileSystemRepresentation(v5, v7, MaximumSizeOfFileSystemRepresentation)) {
        [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:self file:@"MBFile.m" lineNumber:173 description:@"Getting absolute path file system representation failed"];
      }
    }
  }
  return *(const char **)&self->_hasOverriddenModifiedDate;
}

- (NSString)livePath
{
  result = self->_absolutePath;
  if (!result)
  {
    snapshotID = (void *)self->_snapshotID;
    if (!snapshotID)
    {
      [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:self file:@"MBFile.m" lineNumber:181 description:@"Null domain"];
      snapshotID = (void *)self->_snapshotID;
    }
    result = (NSString *)[snapshotID rootPath stringByAppendingPathComponent:self->_nonRedirectedDomain];
    self->_absolutePath = result;
  }
  return result;
}

- (BOOL)isStatusChangedComparedToFile:(id)a3
{
  if ((![(MBFile *)self isSymbolicLink]
     || -[NSString isEqualToString:](-[MBFile target](self, "target"), "isEqualToString:", [a3 target]))
    && (unsigned int v5 = -[MBFile mode](self, "mode"), v5 == [a3 mode])
    && (unsigned int v6 = -[MBFile userID](self, "userID"), v6 == [a3 userID])
    && (unsigned int v7 = -[MBFile groupID](self, "groupID"), v7 == [a3 groupID])
    && (unsigned int v8 = -[MBFile protectionClass](self, "protectionClass"), v8 == [a3 protectionClass]))
  {
    return !-[NSDictionary isEqualToDictionary:](-[MBFile extendedAttributes](self, "extendedAttributes"), "isEqualToDictionary:", [a3 extendedAttributes]);
  }
  else
  {
    return 1;
  }
}

- (id)backupSymbolicLinkTarget
{
  unsigned int v6 = 0;
  if (![(MBFile *)self isSymbolicLink]) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:self file:@"MBFile.m" lineNumber:199 description:@"Not a symbolic link"];
  }
  if (self->_priority) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:self file:@"MBFile.m" lineNumber:200 description:@"Symbolic link target already backed up"];
  }
  id v4 = +[MBFileOperation symbolicLinkTargetWithPathFSR:[(MBFile *)self absolutePathFSR] error:&v6];
  self->_priority = (unint64_t)v4;
  if (v4) {
    return 0;
  }
  else {
    return v6;
  }
}

- (const)keybagUUID
{
  if (self->_encryptionKey < (NSData *)2 || [(NSData *)self->_digest length] < 0x10) {
    return 0;
  }
  digest = self->_digest;

  return (const char *)[(NSData *)digest bytes];
}

- (void)encode:(id)a3
{
  [a3 encodeString:[self->_snapshotID name]];
  [a3 encodeString:self->_nonRedirectedDomain];
  [a3 encodeString:self->_priority];
  [a3 encodeData:self->_target];
  [a3 encodeData:self->_digest];
  [a3 encodeInt16:SWORD2(self->_mbNode.cloneID)];
  [a3 encodeInt64:self->_mbNode.inode];
  [a3 encodeInt32:self->_mbNode.userID];
  [a3 encodeInt32:self->_mbNode.groupID];
  [a3 encodeInt32:LODWORD(self->_mbNode.modified)];
  [a3 encodeInt32:LODWORD(self->_mbNode.statusChanged)];
  [a3 encodeInt32:LODWORD(self->_mbNode.birth)];
  [a3 encodeInt64:self->_mbNode.fileSize];
  [a3 encodeInt8:SBYTE6(self->_mbNode.cloneID)];
  if ((unint64_t)[self->_decryptedSize count] >= 0x100) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:self file:@"MBFile.m" lineNumber:236 description:@"Too many extended attributes"];
  }
  [a3 encodeInt8:[self->_decryptedSize count]];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  decryptedSize = (void *)self->_decryptedSize;
  id v7 = [decryptedSize countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(decryptedSize);
        }
        uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        id v12 = [self->_decryptedSize objectForKeyedSubscript:v11];
        [a3 encodeString:v11];
        [a3 encodeData:v12];
      }
      id v8 = [decryptedSize countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }
  [a3 encodeInt32:sub_10008F3B4((uint64_t)&self->_mbNode)];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeObject:self->_nonRedirectedDomain forKey:@"RelativePath"];
  unint64_t priority = self->_priority;
  if (priority) {
    [a3 encodeObject:priority forKey:@"Target"];
  }
  target = self->_target;
  if (target) {
    [a3 encodeObject:target forKey:@"Digest"];
  }
  digest = self->_digest;
  if (digest) {
    [a3 encodeObject:digest forKey:@"EncryptionKey"];
  }
  [a3 encodeInt32:WORD2(self->_mbNode.cloneID) forKey:@"Mode"];
  [a3 encodeInt64:self->_mbNode.inode forKey:@"InodeNumber"];
  [a3 encodeInt32:self->_mbNode.userID forKey:@"UserID"];
  [a3 encodeInt32:self->_mbNode.groupID forKey:@"GroupID"];
  [a3 encodeInt32:LODWORD(self->_mbNode.modified) forKey:@"LastModified"];
  [a3 encodeInt32:LODWORD(self->_mbNode.statusChanged) forKey:@"LastStatusChange"];
  [a3 encodeInt32:LODWORD(self->_mbNode.birth) forKey:@"Birth"];
  [a3 encodeInt64:self->_mbNode.fileSize forKey:@"Size"];
  [a3 encodeInt32:BYTE6(self->_mbNode.cloneID) forKey:@"ProtectionClass"];
  if ([self->_decryptedSize count])
  {
    uint64_t v11 = 0;
    uint64_t v9 = +[NSPropertyListSerialization dataWithPropertyList:self->_decryptedSize format:200 options:0 error:&v11];
    if (v9 || !v11)
    {
      if (v9) {
        [a3 encodeObject:v9 forKey:@"ExtendedAttributes"];
      }
    }
    else
    {
      unsigned int v10 = MBGetDefaultLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v13 = v11;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Failed to serialize extended attributes: %@", buf, 0xCu);
        _MBLog();
      }
    }
  }
  [a3 encodeInt32:sub_10008F3B4((uint64_t)&self->_mbNode) forKey:@"Flags"];
}

- (MBFile)initWithCoder:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)MBFile;
  id v4 = [(MBFile *)&v11 init];
  if (v4)
  {
    v4->_nonRedirectedDomain = (MBDomain *)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"RelativePath"];
    v4->_unint64_t priority = (unint64_t)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"Target"];
    v4->_target = (NSString *)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"Digest"];
    v4->_digest = (NSData *)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"EncryptionKey"];
    WORD2(v4->_mbNode.cloneID) = (unsigned __int16)[a3 decodeInt32ForKey:@"Mode"];
    v4->_mbNode.inode = (unint64_t)[a3 decodeInt64ForKey:@"InodeNumber"];
    v4->_mbNode.userID = [a3 decodeInt32ForKey:@"UserID"];
    v4->_mbNode.groupID = [a3 decodeInt32ForKey:@"GroupID"];
    v4->_mbNode.modified = (int)[a3 decodeInt32ForKey:@"LastModified"];
    v4->_mbNode.statusChanged = (int)[a3 decodeInt32ForKey:@"LastStatusChange"];
    v4->_mbNode.birth = (int)[a3 decodeInt32ForKey:@"Birth"];
    v4->_mbNode.fileSize = (int64_t)[a3 decodeInt64ForKey:@"Size"];
    BYTE6(v4->_mbNode.cloneID) = [a3 decodeInt32ForKey:@"ProtectionClass"];
    id v5 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"ExtendedAttributes"];
    if (v5)
    {
      uint64_t v10 = 0;
      id v6 = +[NSPropertyListSerialization propertyListWithData:v5 options:0 format:0 error:&v10];
      if (!v10 || v6)
      {
        if (v6) {
          v4->_decryptedSize = (unint64_t)v6;
        }
      }
      else
      {
        id v7 = MBGetDefaultLog();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v13 = v10;
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Failed to deserialize extended attributes: %@", buf, 0xCu);
          uint64_t v9 = v10;
          _MBLog();
        }
      }
    }
    sub_10008F3BC((uint64_t)&v4->_mbNode, (int)[a3 decodeInt32ForKey:@"Flags" v9]);
  }
  return v4;
}

- (void)setNonRedirectedDomain:(id)a3
{
  self->_domain = (MBDomain *)a3;
}

- (void)setDomain:(id)a3
{
  self->_snapshotID = (unint64_t)a3;
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

- (unsigned)type
{
  return WORD2(self->_mbNode.cloneID) & 0xF000;
}

- (NSString)itemID
{
  v2 = [(MBFile *)self fileID];

  return [(MBFileID *)v2 string];
}

- (unint64_t)snapshotID
{
  return *(void *)&self->_committed;
}

- (void)setSnapshotID:(unint64_t)a3
{
  *(void *)&self->_committed = a3;
}

- (MBDomain)domain
{
  return (MBDomain *)self->_snapshotID;
}

- (MBDomain)nonRedirectedDomain
{
  return self->_domain;
}

- (NSString)relativePath
{
  return (NSString *)self->_nonRedirectedDomain;
}

- (NSString)snapshotPath
{
  return self->_relativePath;
}

- (BOOL)isCommitted
{
  return (BOOL)self->_livePath;
}

- (void)setCommitted:(BOOL)a3
{
  LOBYTE(self->_livePath) = a3;
}

- (BOOL)isDeleted
{
  return BYTE1(self->_livePath);
}

- (void)setDeleted:(BOOL)a3
{
  BYTE1(self->_livePath) = a3;
}

- (unint64_t)priority
{
  return (unint64_t)self->_snapshotPath;
}

- (void)setPriority:(unint64_t)a3
{
  self->_snapshotPath = (NSString *)a3;
}

- (NSString)target
{
  return (NSString *)self->_priority;
}

- (void)setTarget:(id)a3
{
}

- (NSData)digest
{
  return (NSData *)self->_target;
}

- (void)setDigest:(id)a3
{
}

- (unsigned)keybagID
{
  return HIDWORD(self->_livePath);
}

- (void)setKeybagID:(unsigned int)a3
{
  HIDWORD(self->_livePath) = a3;
}

- (NSData)encryptionKey
{
  return self->_digest;
}

- (void)setEncryptionKey:(id)a3
{
}

- (unint64_t)encryptionKeyVersion
{
  return (unint64_t)self->_encryptionKey;
}

- (void)setEncryptionKeyVersion:(unint64_t)a3
{
  self->_encryptionKey = (NSData *)a3;
}

- (unint64_t)decryptedSize
{
  return self->_encryptionKeyVersion;
}

- (void)setDecryptedSize:(unint64_t)a3
{
  self->_encryptionKeyVersion = a3;
}

- (NSDictionary)extendedAttributes
{
  return (NSDictionary *)self->_decryptedSize;
}

- (void)setExtendedAttributes:(id)a3
{
}

- (void)getStat:(stat *)a3
{
  *(_OWORD *)&a3->st_blksize = 0u;
  *(_OWORD *)a3->st_qspare = 0u;
  a3->st_birthtimespec = 0u;
  *(_OWORD *)&a3->st_size = 0u;
  a3->st_mtimespec = 0u;
  a3->st_ctimespec = 0u;
  *(_OWORD *)&a3->st_uid = 0u;
  a3->st_atimespec = 0u;
  *(_OWORD *)&a3->st_dev = 0u;
  mode_t v4 = WORD2(self->_mbNode.cloneID);
  off_t fileSize = self->_mbNode.fileSize;
  __darwin_ino64_t inode = self->_mbNode.inode;
  __darwin_time_t birth = self->_mbNode.birth;
  __darwin_time_t modified = self->_mbNode.modified;
  __darwin_time_t statusChanged = self->_mbNode.statusChanged;
  uint64_t v10 = *(void *)&self->_mbNode.userID;
  __uint32_t v11 = sub_10008F3B4((uint64_t)&self->_mbNode);
  a3->st_dev = 0;
  a3->st_mode = v4;
  a3->st_nlink = 0;
  a3->st_ino = inode;
  *(void *)&a3->st_uid = v10;
  a3->st_rdev = 0;
  *(_OWORD *)(&a3->st_rdev + 1) = v12;
  HIDWORD(a3->st_atimespec.tv_nsec) = 0;
  a3->st_mtimespec.tv_sec = modified;
  a3->st_mtimespec.tv_nsec = 0;
  a3->st_ctimespec.tv_sec = statusChanged;
  a3->st_ctimespec.tv_nsec = 0;
  a3->st_birthtimespec.tv_sec = birth;
  a3->st_birthtimespec.tv_nsec = 0;
  a3->st_size = fileSize;
  a3->st_blocks = 0;
  a3->st_blksize = 0;
  a3->st_flags = v11;
  *(void *)&a3->st_gen = 0;
  a3->st_qspare[0] = 0;
  a3->st_qspare[1] = 0;
}

- (void)setNode:(id *)a3
{
  *(_OWORD *)&self->_mbNode.direntCount = *(_OWORD *)&a3->var0;
  long long v3 = *(_OWORD *)&a3->var4;
  long long v4 = *(_OWORD *)&a3->var6;
  long long v5 = *(_OWORD *)&a3->var8;
  self->_mbNode.cloneID = a3->var10;
  *(_OWORD *)&self->_mbNode.__darwin_ino64_t inode = v5;
  *(_OWORD *)&self->_mbNode.__darwin_time_t statusChanged = v4;
  *(_OWORD *)&self->_mbNode.__darwin_time_t birth = v3;
}

- (BOOL)hasFlags
{
  return self->_mbNode.flags != 0;
}

- (unsigned)mode
{
  return WORD2(self->_mbNode.cloneID);
}

- (NSString)modeString
{
  return +[NSString stringWithFormat:@"%06o", [(MBFile *)self mode]];
}

- (NSString)typeString
{
  return (NSString *)sub_10008F4EC(WORD2(self->_mbNode.cloneID));
}

- (unsigned)permissions
{
  return sub_10008F450((uint64_t)&self->_mbNode);
}

- (BOOL)isRegularFile
{
  return sub_10008F428((uint64_t)&self->_mbNode);
}

- (BOOL)isDirectory
{
  return sub_10008F414((uint64_t)&self->_mbNode);
}

- (BOOL)isSymbolicLink
{
  return sub_10008F43C((uint64_t)&self->_mbNode);
}

- (unsigned)userID
{
  return self->_mbNode.userID;
}

- (unsigned)groupID
{
  return self->_mbNode.groupID;
}

- (NSDate)lastModifiedDate
{
  return +[NSDate dateWithTimeIntervalSince1970:(double)self->_mbNode.modified];
}

- (int64_t)lastModified
{
  return self->_mbNode.modified;
}

- (void)setLastModified:(int64_t)a3
{
  LOBYTE(self->_fileID) = 1;
  self->_mbNode.__darwin_time_t modified = a3;
}

- (BOOL)hasOverriddenModifiedDate
{
  return (BOOL)self->_fileID;
}

- (NSDate)lastStatusChangeDate
{
  return +[NSDate dateWithTimeIntervalSince1970:(double)self->_mbNode.statusChanged];
}

- (int64_t)lastStatusChange
{
  return self->_mbNode.statusChanged;
}

- (NSDate)birthDate
{
  return +[NSDate dateWithTimeIntervalSince1970:(double)self->_mbNode.birth];
}

- (int64_t)birth
{
  return self->_mbNode.birth;
}

- (unint64_t)inodeNumber
{
  return self->_mbNode.inode;
}

- (unsigned)direntCount
{
  return self->_mbNode.direntCount;
}

- (unsigned)protectionClass
{
  return BYTE6(self->_mbNode.cloneID);
}

- (void)setProtectionClass:(unsigned __int8)a3
{
  BYTE6(self->_mbNode.cloneID) = a3;
}

- (int64_t)size
{
  return self->_mbNode.fileSize;
}

- (unint64_t)cloneID
{
  return *(void *)(&self->_mbNode.genCount + 1);
}

- (unsigned)genCount
{
  return self->_mbNode.genCount;
}

- (BOOL)isHardLink
{
  return HIBYTE(self->_mbNode.cloneID) & 1;
}

- (BOOL)isFullClone
{
  return (HIBYTE(self->_mbNode.cloneID) >> 1) & 1;
}

- (BOOL)isCompressed
{
  return sub_10008F3F0((uint64_t)&self->_mbNode);
}

- (BOOL)isDataless
{
  return sub_10008F3CC((uint64_t)&self->_mbNode);
}

- (BOOL)hasXattrs
{
  return (HIBYTE(self->_mbNode.cloneID) >> 2) & 1;
}

@end