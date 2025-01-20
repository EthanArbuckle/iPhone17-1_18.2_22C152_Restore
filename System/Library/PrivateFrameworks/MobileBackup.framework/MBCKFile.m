@interface MBCKFile
+ (BOOL)shouldValidateFileEncoding;
+ (BOOL)supportsSecureCoding;
+ (double)sqliteSpaceSavingsThreshold;
+ (id)fileIDFromRecordName:(id)a3;
+ (id)fileWithFileChange:(id)a3 manifest:(id)a4;
+ (id)fileWithMBFile:(id)a3 cache:(id)a4;
+ (id)fileWithMBFile:(id)a3 manifest:(id)a4;
+ (id)fileWithRecord:(id)a3 cache:(id)a4 manifest:(id)a5;
+ (id)fileWithRecord:(id)a3 cache:(id)a4 snapshot:(id)a5 domainName:(id)a6;
+ (id)keysToFetchWithContents;
+ (id)keysToFetchWithoutContents;
+ (id)newFromSqliteStatement:(sqlite3_stmt *)a3 atIndex:(int)a4;
+ (id)recordIDFromFileID:(id)a3;
+ (id)recordType;
- (BOOL)_createResourceCopyWithError:(id *)a3;
- (BOOL)_decryptWithOperationTracker:(id)a3 destination:(id)a4 device:(id)a5 error:(id *)a6;
- (BOOL)decodeWithFileAtPath:(id)a3 destinationDirectory:(id)a4 error:(id *)a5;
- (BOOL)deleted;
- (BOOL)downloaded;
- (BOOL)encodeWithFileAtPath:(id)a3 encodingMethod:(char)a4 hasSnapshot:(BOOL)a5 destinationDirectory:(id)a6 account:(id)a7 device:(id)a8 error:(id *)a9;
- (BOOL)fetchEncryptionKeyWithAccount:(id)a3 device:(id)a4 error:(id *)a5;
- (BOOL)hadTemporarySQLiteArchive;
- (BOOL)hasAbsolutePath;
- (BOOL)hasContentCompressionMethod;
- (BOOL)hasContentEncodingMethod;
- (BOOL)hasDomain;
- (BOOL)hasResources;
- (BOOL)isDataless;
- (BOOL)isDirectory;
- (BOOL)isEqual:(id)a3;
- (BOOL)isProtected;
- (BOOL)isRegularFile;
- (BOOL)isSQLiteFile;
- (BOOL)isSymbolicLink;
- (BOOL)refreshAttributesArchiveWithData:(id)a3 error:(id *)a4;
- (BOOL)refreshAttributesPlistWithData:(id)a3 error:(id *)a4;
- (BOOL)refreshAttributesWithData:(id)a3 error:(id *)a4;
- (BOOL)refreshFromCopyWithAccount:(id)a3 device:(id)a4 error:(id *)a5;
- (BOOL)refreshFromFilesystemWithAccount:(id)a3 device:(id)a4 error:(id *)a5;
- (BOOL)restoreAssetWithOperationTracker:(id)a3 destination:(id)a4 logger:(id)a5 cache:(id)a6 device:(id)a7 error:(id *)a8;
- (BOOL)restoreExtendedAttributesToDestination:(id)a3 withError:(id *)a4;
- (BOOL)shouldBeBackedUpIgnoringProtectionClass;
- (BOOL)stashAssetsToTemporaryDirectoryWithAccount:(id)a3 operationTracker:(id)a4 cache:(id)a5 device:(id)a6 error:(id *)a7;
- (BOOL)stashedAssetIsDecrypted;
- (BOOL)validateEncryptionKeyWithError:(id *)a3;
- (BOOL)validateSignatureAtDestination:(id)a3 withError:(id *)a4;
- (MBCKFile)initWithCoder:(id)a3;
- (MBCKFile)initWithDictionary:(id)a3 cache:(id)a4;
- (MBCKFile)initWithFileChange:(id)a3 manifest:(id)a4;
- (MBCKFile)initWithMBFile:(id)a3 cache:(id)a4;
- (MBCKFile)initWithMBFile:(id)a3 manifest:(id)a4;
- (MBCKFile)initWithRecord:(id)a3 cache:(id)a4;
- (MBCKFile)initWithRecord:(id)a3 cache:(id)a4 manifest:(id)a5;
- (MBCKFile)initWithRecord:(id)a3 cache:(id)a4 snapshot:(id)a5 domainName:(id)a6;
- (MBCKManifest)manifest;
- (MBDomain)domain;
- (NSData)contents;
- (NSData)encryptionKey;
- (NSData)resources;
- (NSData)sha256Signature;
- (NSData)signature;
- (NSDate)birth;
- (NSDate)modified;
- (NSDate)statusChanged;
- (NSDictionary)extendedAttributes;
- (NSString)absolutePath;
- (NSString)assetPath;
- (NSString)decodedAssetPath;
- (NSString)description;
- (NSString)domainName;
- (NSString)fileID;
- (NSString)fileTypeString;
- (NSString)keybagUUIDString;
- (NSString)linkTarget;
- (NSString)relativePath;
- (NSString)stashedAssetPath;
- (NSString)stashedResourcePath;
- (NSString)subDomain;
- (double)progress;
- (id)_compactSQLiteDatabaseAtPath:(id)a3 temporaryDirectory:(id)a4 error:(id *)a5;
- (id)_copySQLiteDatabaseAtPath:(id)a3 temporaryDirectory:(id)a4 error:(id *)a5;
- (id)_getRecordIDString;
- (id)_scrubSQLiteDatabaseWithEngine:(id)a3 temporaryDirectory:(id)a4 error:(id *)a5;
- (id)aggregateDictionaryGroup;
- (id)asArchiveData;
- (id)attributeDataArchiveWithError:(id *)a3;
- (id)attributeDataHashWithAttributes:(id)a3 error:(id *)a4;
- (id)attributeDataPlistWithError:(id *)a3;
- (id)attributeDataTruncatedHashWithError:(id *)a3;
- (id)attributeDataWithError:(id *)a3;
- (id)attributes;
- (id)fileIDWithHmacKey:(id)a3;
- (id)initFromArchiveData:(id)a3;
- (id)initFromPQLResultSet:(id)a3 error:(id *)a4;
- (id)keybagUUIDData;
- (id)recordRepresentation;
- (id)recordType;
- (id)restoreState;
- (int)_createTemporarySQLiteCopyWithEngine:(id)a3 temporaryDirectory:(id)a4 error:(id *)a5;
- (int)prepareForUploadWithEngine:(id)a3 error:(id *)a4;
- (int64_t)savePolicy;
- (unint64_t)aggregateSize;
- (unint64_t)changeType;
- (unint64_t)changeTypeForFullBackup:(BOOL)a3;
- (unint64_t)fileType;
- (unint64_t)hash;
- (unint64_t)inode;
- (unint64_t)priority;
- (unint64_t)recordZone;
- (unint64_t)resourcesSize;
- (unint64_t)size;
- (unint64_t)sizeBeforeCopy;
- (unint64_t)sizeFromFileIDWithDefaultValue:(unint64_t)a3;
- (unint64_t)sourceDeviceInode;
- (unint64_t)volumeType;
- (unsigned)groupID;
- (unsigned)permissions;
- (unsigned)protectionClass;
- (unsigned)type;
- (unsigned)userID;
- (void)_removeResourceCopy;
- (void)_removeTemporaryCopy;
- (void)_setFileMissingEncryptionKeyForPath:(id)a3 account:(id)a4;
- (void)cleanupAfterUpload;
- (void)confirmFileWasModifiedOnDisk;
- (void)dealloc;
- (void)downloadContentsWithOperationTracker:(id)a3 completion:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)getNode:(id *)a3;
- (void)refreshWithDictionary:(id)a3;
- (void)refreshWithMBFile:(id)a3;
- (void)refreshWithRecord:(id)a3;
- (void)saveToCacheWithCompletion:(id)a3;
- (void)setAbsolutePath:(id)a3;
- (void)setDecodedAssetPath:(id)a3;
- (void)setFileID:(id)a3;
- (void)setPriority:(unint64_t)a3;
- (void)setProgress:(double)a3;
- (void)setStashedAssetIsDecrypted:(BOOL)a3;
- (void)setStashedAssetPath:(id)a3;
- (void)setupWithDomain:(id)a3;
- (void)sqliteBind:(sqlite3_stmt *)a3 index:(int)a4;
@end

@implementation MBCKFile

+ (id)keysToFetchWithoutContents
{
  return &off_10043B3B8;
}

+ (id)keysToFetchWithContents
{
  return &off_10043B3D0;
}

+ (id)recordIDFromFileID:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)NSString) initWithFormat:@"%@%@", @"F:", v3];

  id v5 = [objc_alloc((Class)CKRecordID) initWithRecordName:v4];
  return v5;
}

+ (id)fileIDFromRecordName:(id)a3
{
  id v3 = a3;
  if ([v3 hasPrefix:@"F:"])
  {
    id v4 = [v3 substringFromIndex:objc_msgSend(@"F:", "length")];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

+ (id)fileWithMBFile:(id)a3 manifest:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[MBCKFile alloc] initWithMBFile:v6 manifest:v5];

  return v7;
}

+ (id)fileWithMBFile:(id)a3 cache:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[MBCKFile alloc] initWithMBFile:v6 cache:v5];

  return v7;
}

+ (id)fileWithFileChange:(id)a3 manifest:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[MBCKFile alloc] initWithFileChange:v6 manifest:v5];

  return v7;
}

+ (id)fileWithRecord:(id)a3 cache:(id)a4 manifest:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = [[MBCKFile alloc] initWithRecord:v9 cache:v8 manifest:v7];

  return v10;
}

+ (id)fileWithRecord:(id)a3 cache:(id)a4 snapshot:(id)a5 domainName:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = [[MBCKFile alloc] initWithRecord:v12 cache:v11 snapshot:v10 domainName:v9];

  return v13;
}

- (MBCKFile)initWithMBFile:(id)a3 manifest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6) {
    __assert_rtn("-[MBCKFile initWithMBFile:manifest:]", "MBCKFile.m", 156, "file");
  }
  id v8 = v7;
  if (!v7) {
    __assert_rtn("-[MBCKFile initWithMBFile:manifest:]", "MBCKFile.m", 157, "manifest");
  }
  id v9 = [v7 cache];
  v16.receiver = self;
  v16.super_class = (Class)MBCKFile;
  id v10 = [(MBCKModel *)&v16 initWithRecord:0 cache:v9];

  if (v10)
  {
    objc_storeStrong((id *)&v10->_domain, a4);
    [(MBCKFile *)v10 refreshWithMBFile:v6];
    id v11 = [v8 device];
    id v12 = [v11 hmacKey];
    uint64_t v13 = [(MBCKFile *)v10 fileIDWithHmacKey:v12];
    manifest = v10->_manifest;
    v10->_manifest = (MBCKManifest *)v13;
  }
  return v10;
}

- (MBCKFile)initWithMBFile:(id)a3 cache:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6) {
    __assert_rtn("-[MBCKFile initWithMBFile:cache:]", "MBCKFile.m", 168, "file");
  }
  id v8 = v7;
  if (!v7) {
    __assert_rtn("-[MBCKFile initWithMBFile:cache:]", "MBCKFile.m", 169, "cache");
  }
  v12.receiver = self;
  v12.super_class = (Class)MBCKFile;
  id v9 = [(MBCKModel *)&v12 initWithRecord:0 cache:v7];
  id v10 = v9;
  if (v9) {
    [(MBCKFile *)v9 refreshWithMBFile:v6];
  }

  return v10;
}

- (MBCKFile)initWithFileChange:(id)a3 manifest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6) {
    __assert_rtn("-[MBCKFile initWithFileChange:manifest:]", "MBCKFile.m", 178, "fileChange");
  }
  id v8 = v7;
  if (!v7) {
    __assert_rtn("-[MBCKFile initWithFileChange:manifest:]", "MBCKFile.m", 179, "manifest");
  }
  id v9 = [v7 cache];
  v26.receiver = self;
  v26.super_class = (Class)MBCKFile;
  id v10 = [(MBCKModel *)&v26 initWithRecord:0 cache:v9];

  if (v10)
  {
    uint64_t v11 = [v6 absolutePath];
    fileID = v10->_fileID;
    v10->_fileID = (NSString *)v11;

    uint64_t v13 = [v6 relativePath];
    volumeType = (void *)v10->_volumeType;
    v10->_volumeType = v13;

    objc_storeStrong((id *)&v10->_domain, a4);
    v15 = [v6 domain];
    uint64_t v16 = [v15 name];
    v17 = *(void **)&v10->_mbNode.mode;
    *(void *)&v10->_mbNode.mode = v16;

    v18 = [v6 domain];
    *(void *)&v10->_is = [v18 volumeType];

    uint64_t v19 = [v6 domain];
    domainName = v10->_domainName;
    v10->_domainName = (NSString *)v19;

    id v21 = [v6 changeType];
    LOBYTE(v10->_restoreState) = (uint64_t)v10->_restoreState & 0xEF | (16 * (v21 == (id)3));
    if (v21 != (id)3)
    {
      if (!v10->_fileID)
      {
        v22 = MBGetDefaultLog();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 136315138;
          v28 = "_absolutePath";
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_FAULT, "nil %s", buf, 0xCu);
          _MBLog();
        }
      }
      if (!v10->_domainName)
      {
        v23 = MBGetDefaultLog();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 136315138;
          v28 = "_domain";
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_FAULT, "nil %s", buf, 0xCu);
          _MBLog();
        }
      }
    }
    BYTE6(v10->_mbNode.cloneID) = 4;
    LOBYTE(v10->_restoreState) |= 8u;
    resources = v10->_resources;
    v10->_resources = 0;

    LOBYTE(v10->_restoreState) &= ~4u;
  }

  return v10;
}

- (MBCKFile)initWithRecord:(id)a3 cache:(id)a4 manifest:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v8) {
    __assert_rtn("-[MBCKFile initWithRecord:cache:manifest:]", "MBCKFile.m", 202, "record");
  }
  if (!v9) {
    __assert_rtn("-[MBCKFile initWithRecord:cache:manifest:]", "MBCKFile.m", 203, "cache");
  }
  uint64_t v11 = v10;
  if (!v10) {
    __assert_rtn("-[MBCKFile initWithRecord:cache:manifest:]", "MBCKFile.m", 204, "manifest");
  }
  v17.receiver = self;
  v17.super_class = (Class)MBCKFile;
  objc_super v12 = [(MBCKModel *)&v17 initWithRecord:v8 cache:v9];
  uint64_t v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_domain, a5);
    uint64_t v14 = [v11 domainName];
    v15 = *(void **)&v13->_mbNode.mode;
    *(void *)&v13->_mbNode.mode = v14;

    LOBYTE(v13->_restoreState) &= ~4u;
  }

  return v13;
}

- (MBCKFile)initWithDictionary:(id)a3 cache:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6) {
    __assert_rtn("-[MBCKFile initWithDictionary:cache:]", "MBCKFile.m", 215, "dictionary");
  }
  id v8 = v7;
  if (!v7) {
    __assert_rtn("-[MBCKFile initWithDictionary:cache:]", "MBCKFile.m", 216, "cache");
  }
  v12.receiver = self;
  v12.super_class = (Class)MBCKFile;
  id v9 = [(MBCKModel *)&v12 initWithRecord:0 cache:v7];
  id v10 = v9;
  if (v9) {
    [(MBCKFile *)v9 refreshWithDictionary:v6];
  }

  return v10;
}

- (MBCKFile)initWithRecord:(id)a3 cache:(id)a4 snapshot:(id)a5 domainName:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!v10) {
    __assert_rtn("-[MBCKFile initWithRecord:cache:snapshot:domainName:]", "MBCKFile.m", 225, "record");
  }
  if (!v11) {
    __assert_rtn("-[MBCKFile initWithRecord:cache:snapshot:domainName:]", "MBCKFile.m", 226, "cache");
  }
  if (!v12) {
    __assert_rtn("-[MBCKFile initWithRecord:cache:snapshot:domainName:]", "MBCKFile.m", 227, "snapshot");
  }
  uint64_t v14 = v13;
  if (!v13) {
    __assert_rtn("-[MBCKFile initWithRecord:cache:snapshot:domainName:]", "MBCKFile.m", 228, "domainName");
  }
  v20.receiver = self;
  v20.super_class = (Class)MBCKFile;
  id v15 = [(MBCKModel *)&v20 initWithRecord:v10 cache:v11];
  uint64_t v16 = (MBCKFile *)v15;
  if (v15)
  {
    objc_storeStrong((id *)v15 + 18, a6);
    uint64_t v17 = [v12 manifestForDomainName:*(void *)&v16->_mbNode.mode];
    domain = v16->_domain;
    v16->_domain = (MBDomain *)v17;
  }
  return v16;
}

- (MBCKFile)initWithRecord:(id)a3 cache:(id)a4
{
  id v6 = +[NSAssertionHandler currentHandler];
  id v7 = (objc_class *)objc_opt_class();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"MBCKFile.m", 238, @"You must call -[%s initWithRecord:cache:manifest:domain:]", class_getName(v7));

  return 0;
}

- (void)setupWithDomain:(id)a3
{
  id v5 = a3;
  if (!v5) {
    __assert_rtn("-[MBCKFile setupWithDomain:]", "MBCKFile.m", 245, "domain");
  }
  id v6 = v5;
  objc_storeStrong((id *)&self->_domainName, a3);
  *(void *)&self->_is = [v6 volumeType];
  if ([v6 hasRootPath])
  {
    id v7 = [v6 rootPath];
    id v8 = [(MBCKFile *)self relativePath];
    uint64_t v9 = [v7 stringByAppendingPathComponent:v8];

    id v10 = self;
    objc_sync_enter(v10);
    fileID = v10->_fileID;
    v10->_fileID = (NSString *)v9;

    LOBYTE(v10->_restoreState) &= ~2u;
    objc_sync_exit(v10);
  }
  else
  {
    id v12 = MBGetDefaultLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v14 = self;
      __int16 v15 = 2112;
      uint64_t v16 = v6;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "Allowing file %@ in domain without root path %@", buf, 0x16u);
      _MBLog();
    }
  }
}

- (void)dealloc
{
  [(MBCKFile *)self cleanupAfterUpload];
  v3.receiver = self;
  v3.super_class = (Class)MBCKFile;
  [(MBCKFile *)&v3 dealloc];
}

- (NSString)description
{
  manifest = self->_manifest;
  if (!manifest) {
    manifest = (MBCKManifest *)@"PENDING (File is still being built)";
  }
  if (((uint64_t)self->_restoreState & 0x10) != 0)
  {
    id v11 = manifest;
    uint64_t v14 = (objc_class *)objc_opt_class();
    Name = class_getName(v14);
    id v7 = [(MBCKFile *)self domainName];
    id v8 = [(MBCKFile *)self relativePath];
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<%s: %p; id=%@, d=%@, rp=%@, t=%lu, pc=%d>",
      Name,
      self,
      v11,
      v7,
      v8,
      [(MBCKFile *)self fileType],
    id v13 = [(MBCKFile *)self protectionClass]);
  }
  else
  {
    id v4 = manifest;
    uint64_t flags = self->_mbNode.flags;
    id v6 = (objc_class *)objc_opt_class();
    uint64_t v17 = class_getName(v6);
    id v7 = [(MBCKFile *)self domainName];
    id v8 = [(MBCKFile *)self relativePath];
    unint64_t v9 = [(MBCKFile *)self fileType];
    unsigned int v10 = [(MBCKFile *)self protectionClass];
    id v11 = [(MBCKFile *)self modified];
    [(MBCKManifest *)v11 timeIntervalSince1970];
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<%s: %p; id=%@, d=%@, rp=%@, t=%lu, pc=%d, mt=%.3f, m=0%o, o=%d, g=%d, f=0x%lx>",
      v17,
      self,
      v4,
      v7,
      v8,
      v9,
      v10,
      v12,
      WORD2(self->_mbNode.cloneID),
      [(MBCKFile *)self userID],
      [(MBCKFile *)self groupID],
    id v13 = flags);
  }
  return (NSString *)v13;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    id v6 = [(MBCKFile *)self domainName];
    id v7 = [v5 domainName];
    if ([v6 isEqualToString:v7])
    {
      id v8 = [(MBCKFile *)self relativePath];
      unint64_t v9 = [v5 relativePath];
      unsigned __int8 v10 = [v8 isEqualToString:v9];
    }
    else
    {
      unsigned __int8 v10 = 0;
    }
  }
  else
  {
    unsigned __int8 v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  objc_super v3 = [(MBCKFile *)self domainName];
  unint64_t v4 = (unint64_t)[v3 hash];
  id v5 = [(MBCKFile *)self relativePath];
  unint64_t v6 = (unint64_t)[v5 hash] ^ v4;

  return v6;
}

- (BOOL)refreshFromFilesystemWithAccount:(id)a3 device:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (!a5) {
    __assert_rtn("-[MBCKFile refreshFromFilesystemWithAccount:device:error:]", "MBCKFile.m", 294, "error");
  }
  unsigned __int8 v10 = v9;
  if (!v9) {
    __assert_rtn("-[MBCKFile refreshFromFilesystemWithAccount:device:error:]", "MBCKFile.m", 295, "device");
  }
  if (((uint64_t)self->_restoreState & 0x10) != 0)
  {
    id v11 = 0;
    goto LABEL_9;
  }
  id v11 = [(MBCKFile *)self absolutePath];
  if ((MBNodeForPath(v11, (uint64_t)&self->_mbNode, a5) & 1) == 0)
  {
    uint64_t v16 = (MBCKFile *)+[MBError errnoForError:*a5];
    if (v16 == 2)
    {
      *a5 = +[MBError errorWithCode:4 format:@"File not found"];
    }
    uint64_t v17 = MBGetDefaultLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)v27 = v11;
      *(_WORD *)&v27[8] = 1024;
      *(_DWORD *)&v27[10] = v16;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "MBNodeForPath() failed at %@: %{errno}d", buf, 0x12u);
      v24 = v11;
      v25 = v16;
      _MBLog();
    }

    goto LABEL_21;
  }
  self->_sha256Signature = (NSData *)self->_mbNode.inode;
  LOBYTE(self->_restoreState) &= ~0x10u;
  if ((id)[(MBCKFile *)self fileType] != (id)2)
  {
    if (!BYTE6(self->_mbNode.cloneID) && [(MBCKFile *)self isRegularFile])
    {
      v18 = MBGetDefaultLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        int v19 = BYTE6(self->_mbNode.cloneID);
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v27 = v19;
        *(_WORD *)&v27[4] = 2112;
        *(void *)&v27[6] = self;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Filesystem returned an invalid protection class %d for %@", buf, 0x12u);
        v24 = (void *)BYTE6(self->_mbNode.cloneID);
        v25 = self;
        _MBLog();
      }

      BYTE6(self->_mbNode.cloneID) = 4;
    }
    if (-[MBCKFile fetchEncryptionKeyWithAccount:device:error:](self, "fetchEncryptionKeyWithAccount:device:error:", v8, v10, a5, v24, v25))
    {
      goto LABEL_9;
    }
LABEL_21:
    BOOL v15 = 0;
    goto LABEL_22;
  }
  id v12 = v11;
  +[MBFileOperation symbolicLinkTargetWithPathFSR:error:](MBFileOperation, "symbolicLinkTargetWithPathFSR:error:", [v12 fileSystemRepresentation], a5);
  id v13 = (NSString *)objc_claimAutoreleasedReturnValue();
  relativePath = self->_relativePath;
  self->_relativePath = v13;

  if (self->_relativePath)
  {
LABEL_9:
    BOOL v15 = 1;
    goto LABEL_22;
  }
  BOOL v15 = 0;
  id v11 = v12;
LABEL_22:
  objc_super v20 = objc_msgSend(v10, "hmacKey", v24, v25);
  id v21 = [(MBCKFile *)self fileIDWithHmacKey:v20];
  manifest = self->_manifest;
  self->_manifest = v21;

  if (!v15 && !*a5) {
    __assert_rtn("-[MBCKFile refreshFromFilesystemWithAccount:device:error:]", "MBCKFile.m", 342, "result || *error != nil");
  }

  return v15;
}

- (BOOL)refreshFromCopyWithAccount:(id)a3 device:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (((uint64_t)self->_restoreState & 0x10) == 0)
  {
    unsigned __int8 v10 = *(void **)&self->_contentEncodingMethod;
    if (v10)
    {
      memset(&v21, 0, sizeof(v21));
      int v11 = lstat((const char *)[v10 fileSystemRepresentation], &v21);
      BOOL v12 = v11 == 0;
      if (v11)
      {
        int v13 = *__error();
        if (a5)
        {
          if (v13 == 2)
          {
            *a5 = +[MBError errorWithCode:4 format:@"File not found"];
          }
          else
          {
            uint64_t v17 = [(MBCKFile *)self absolutePath];
            *a5 = +[MBError posixErrorWithCode:100 path:v17 format:@"Failed to stat file"];
          }
        }
        uint64_t v14 = MBGetDefaultLog();
        if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          goto LABEL_16;
        }
        uint64_t v18 = *(void *)&self->_contentEncodingMethod;
        int v19 = [(MBCKFile *)self absolutePath];
        *(_DWORD *)buf = 138412802;
        uint64_t v23 = v18;
        __int16 v24 = 2112;
        v25 = v19;
        __int16 v26 = 1024;
        int v27 = v13;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Failed to lstat file copy at %@ on behalf of %@: %{errno}d", buf, 0x1Cu);

        manifest = [(MBCKFile *)self absolutePath];
        _MBLog();
      }
      else
      {
        if ((v21.st_mode & 0xF000) == 0x8000) {
          self->_mbNode.fileSize = v21.st_size;
        }
        if (![(MBCKFile *)self fetchEncryptionKeyWithAccount:v8 device:v9 error:a5])
        {
          BOOL v12 = 0;
          goto LABEL_17;
        }
        uint64_t v14 = [v9 hmacKey];
        BOOL v15 = [(MBCKFile *)self fileIDWithHmacKey:v14];
        manifest = self->_manifest;
        self->_manifest = v15;
      }

LABEL_16:
      goto LABEL_17;
    }
  }
  BOOL v12 = 1;
LABEL_17:

  return v12;
}

- (void)refreshWithRecord:(id)a3
{
  id v4 = a3;
  unint64_t v6 = [v4 encryptedValues];
  id v7 = [v6 objectForKeyedSubscript:@"encryptedAttributes"];

  if (v7) {
    [(MBCKFile *)self refreshAttributesWithData:v7 error:0];
  }
  unint64_t v8 = [v4 objectForKeyedSubscript:@"contents"];
  changeType = (void *)self->_changeType;
  self->_changeType = v8;

  unsigned __int8 v10 = [self->_changeType signature];
  linkTarget = self->_linkTarget;
  self->_linkTarget = v10;

  BOOL v12 = [v4 objectForKeyedSubscript:@"resources"];
  contentAsset = self->_contentAsset;
  self->_contentAsset = v12;

  uint64_t v14 = [v4 objectForKeyedSubscript:@"resourcesSize"];

  if (v14)
  {
    BOOL v15 = [v4 objectForKeyedSubscript:@"resourcesSize"];
    self->_signature = (NSData *)[v15 unsignedLongLongValue];
  }
  else
  {
    uint64_t v16 = self->_contentAsset;
    if (v16) {
      self->_signature = (NSData *)[(CKAsset *)v16 size];
    }
  }
  uint64_t v17 = [v4 objectForKeyedSubscript:@"fileType"];
  unsigned int v18 = [v17 intValue];
  if (v18 >= 3) {
    __int16 v19 = WORD2(self->_mbNode.cloneID) & 0xFFF;
  }
  else {
    __int16 v19 = (0xA00040008000uLL >> (16 * v18)) & 0xF000 | WORD2(self->_mbNode.cloneID) & 0xFFF;
  }
  WORD2(self->_mbNode.cloneID) = v19;

  objc_super v20 = [v4 recordID];
  stat v21 = [v20 recordName];
  if ([v21 hasSuffix:@":D"]) {
    char v22 = 16;
  }
  else {
    char v22 = 0;
  }
  LOBYTE(self->_restoreState) = (uint64_t)self->_restoreState & 0xEF | v22;

  uint64_t v23 = [v4 objectForKeyedSubscript:@"protectionClass"];

  if (v23)
  {
    __int16 v24 = [v4 objectForKeyedSubscript:@"protectionClass"];
    BYTE6(self->_mbNode.cloneID) = [v24 intValue];

    if (!v4) {
      goto LABEL_21;
    }
  }
  else
  {
    BYTE6(self->_mbNode.cloneID) = -1;
    if (!v4) {
      goto LABEL_21;
    }
  }
  if ((BYTE6(self->_mbNode.cloneID) == 255 || !BYTE6(self->_mbNode.cloneID)) && ![(MBCKFile *)self fileType]) {
    BYTE6(self->_mbNode.cloneID) = 4;
  }
LABEL_21:
  v25 = [v4 recordID];
  __int16 v26 = [v25 recordName];
  [(MBCKFile *)self setFileID:v26];

  v30.receiver = self;
  v30.super_class = (Class)MBCKFile;
  [(MBCKModel *)&v30 refreshWithRecord:v4];
  if (v7) {
    BOOL v27 = [(MBCKFile *)self size] == 0;
  }
  else {
    BOOL v27 = 0;
  }
  if ([(MBCKFile *)self isRegularFile] && self->_changeType) {
    BOOL v27 = 1;
  }
  if (v7) {
    BOOL v28 = [(MBCKFile *)self resourcesSize] == 0;
  }
  else {
    BOOL v28 = 0;
  }
  if ([(MBCKFile *)self hasResources] && self->_contentAsset) {
    BOOL v28 = 1;
  }
  if (v27 && v28) {
    char v29 = 32;
  }
  else {
    char v29 = 0;
  }
  LOBYTE(self->_restoreState) = (uint64_t)self->_restoreState & 0xDF | v29;
}

- (void)refreshWithMBFile:(id)a3
{
  id v4 = a3;
  id v5 = [v4 domain];
  uint64_t v6 = [v5 name];
  id v7 = *(void **)&self->_mbNode.mode;
  *(void *)&self->_mbNode.mode = v6;

  unint64_t v8 = [v4 domain];
  *(void *)&self->_is = [v8 volumeType];

  id v9 = [v4 domain];
  domainName = self->_domainName;
  self->_domainName = v9;

  int v11 = self;
  objc_sync_enter(v11);
  uint64_t v12 = [v4 absolutePath];
  fileID = v11->_fileID;
  v11->_fileID = (NSString *)v12;

  LOBYTE(v11->_restoreState) &= ~2u;
  objc_sync_exit(v11);

  uint64_t v14 = [v4 relativePath];
  volumeType = (void *)v11->_volumeType;
  v11->_volumeType = v14;

  uint64_t v16 = [v4 digest];
  linkTarget = v11->_linkTarget;
  v11->_linkTarget = (NSString *)v16;

  [v4 getNode:&v11->_mbNode];
  v11->_sha256Signature = (NSData *)v11->_mbNode.inode;
  v11->_sizeBeforeCopy = 0;
  v11->_encryptedSize = 0;
  if ([v4 isDeleted]) {
    char v18 = 16;
  }
  else {
    char v18 = 0;
  }
  LOBYTE(v11->_restoreState) = (uint64_t)v11->_restoreState & 0xEF | v18;
  uint64_t v19 = [v4 encryptionKey];
  resources = v11->_resources;
  v11->_resources = (NSData *)v19;

  uint64_t v21 = [v4 target];
  relativePath = v11->_relativePath;
  v11->_relativePath = (NSString *)v21;

  if (!v11->_fileID)
  {
    uint64_t v23 = MBGetDefaultLog();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v34 = "_absolutePath";
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_FAULT, "nil %s", buf, 0xCu);
      v32 = "_absolutePath";
      _MBLog();
    }
  }
  if (!self->_domainName)
  {
    __int16 v24 = MBGetDefaultLog();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v34 = "_domain";
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_FAULT, "nil %s", buf, 0xCu);
      v32 = "_domain";
      _MBLog();
    }
  }
  if ([(MBCKFile *)v11 isSymbolicLink])
  {
    if ([(MBCKFile *)v11 hasAbsolutePath])
    {
      v25 = [(MBCKFile *)v11 linkTarget];
      BOOL v26 = v25 == 0;

      if (v26)
      {
        BOOL v27 = [(MBCKFile *)v11 absolutePath];
        uint64_t v28 = +[MBFileOperation symbolicLinkTargetWithPath:v27 error:0];
        char v29 = v11->_relativePath;
        v11->_relativePath = (NSString *)v28;
      }
    }
  }
  if (!BYTE6(v11->_mbNode.cloneID) && [v4 isRegularFile])
  {
    objc_super v30 = MBGetDefaultLog();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v31 = [v4 protectionClass];
      *(_DWORD *)buf = 138412546;
      v34 = (const char *)v4;
      __int16 v35 = 1024;
      unsigned int v36 = v31;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "File %@ has an invalid protection class: %d", buf, 0x12u);
      [v4 protectionClass];
      _MBLog();
    }

    BYTE6(v11->_mbNode.cloneID) = 4;
  }
  LOBYTE(v11->_restoreState) = (uint64_t)v11->_restoreState & 0xF7 | (8 * (v11->_resources == 0));
}

- (void)refreshWithDictionary:(id)a3
{
  id v4 = a3;
  id v5 = [v4 objectForKeyedSubscript:@"mode"];
  p_mbNode = &self->_mbNode;
  WORD2(self->_mbNode.cloneID) = (unsigned __int16)[v5 intValue];

  id v7 = [v4 objectForKeyedSubscript:@"fileType"];
  unsigned int v8 = [v7 intValue];
  if (v8 >= 3) {
    __int16 v9 = WORD2(self->_mbNode.cloneID) & 0xFFF;
  }
  else {
    __int16 v9 = (0xA00040008000uLL >> (16 * v8)) & 0xF000 | WORD2(self->_mbNode.cloneID) & 0xFFF;
  }
  WORD2(self->_mbNode.cloneID) = v9;

  if (!WORD2(self->_mbNode.cloneID)) {
    __assert_rtn("-[MBCKFile refreshWithDictionary:]", "MBCKFile.m", 462, "_mbNode.mode");
  }
  unsigned __int8 v10 = [v4 objectForKeyedSubscript:@"manifest"];
  domain = self->_domain;
  self->_domain = v10;

  uint64_t v12 = [v4 objectForKeyedSubscript:@"domainName"];
  int v13 = *(void **)&self->_mbNode.mode;
  *(void *)&self->_mbNode.mode = v12;

  uint64_t v14 = [v4 objectForKeyedSubscript:@"absolutePath"];
  BOOL v15 = self;
  objc_sync_enter(v15);
  objc_storeStrong((id *)&v15->_fileID, v14);
  LOBYTE(v15->_restoreState) &= ~2u;
  objc_sync_exit(v15);

  uint64_t v16 = [v4 objectForKeyedSubscript:@"relativePath"];
  volumeType = (void *)v15->_volumeType;
  v15->_volumeType = v16;

  uint64_t v18 = [v4 objectForKeyedSubscript:@"digest"];
  linkTarget = v15->_linkTarget;
  v15->_linkTarget = (NSString *)v18;

  objc_super v20 = [v4 objectForKeyedSubscript:@"size"];
  p_mbNode->fileSize = (int64_t)[v20 unsignedLongLongValue];

  uint64_t v21 = [v4 objectForKeyedSubscript:@"sizeBeforeCopy"];
  v15->_encryptedSize = (unint64_t)[v21 unsignedLongLongValue];

  char v22 = [v4 objectForKeyedSubscript:@"resourcesSize"];
  v15->_signature = (NSData *)[v22 unsignedLongLongValue];

  uint64_t v23 = [v4 objectForKeyedSubscript:@"birth"];
  [v23 timeIntervalSince1970];
  p_mbNode->birth = (uint64_t)v24;

  v25 = [v4 objectForKeyedSubscript:@"modified"];
  [v25 timeIntervalSince1970];
  p_mbNode->modified = (uint64_t)v26;

  BOOL v27 = [v4 objectForKeyedSubscript:@"statusChanged"];
  [v27 timeIntervalSince1970];
  p_mbNode->statusChanged = (uint64_t)v28;

  char v29 = [v4 objectForKeyedSubscript:@"groupID"];
  p_mbNode->groupID = [v29 intValue];

  objc_super v30 = [v4 objectForKeyedSubscript:@"userID"];
  p_mbNode->userID = [v30 intValue];

  unsigned int v31 = [v4 objectForKeyedSubscript:@"deleted"];
  if ([v31 BOOLValue]) {
    char v32 = 16;
  }
  else {
    char v32 = 0;
  }
  LOBYTE(v15->_restoreState) = (uint64_t)v15->_restoreState & 0xEF | v32;

  v33 = [v4 objectForKeyedSubscript:@"protectionClass"];
  BYTE6(p_mbNode->cloneID) = [v33 intValue];

  uint64_t v34 = [v4 objectForKeyedSubscript:@"encryptionKey"];
  resources = v15->_resources;
  v15->_resources = (NSData *)v34;

  unsigned int v36 = [v4 objectForKeyedSubscript:@"sourceDeviceInode"];
  v15->_sha256Signature = (NSData *)[v36 longLongValue];

  v37 = [v4 objectForKeyedSubscript:@"volumeType"];
  *(void *)&v15->_is = [v37 unsignedIntegerValue];

  v38 = [v4 objectForKeyedSubscript:@"fileID"];
  [(MBCKFile *)v15 setFileID:v38];

  uint64_t v39 = [v4 objectForKeyedSubscript:@"linkTarget"];
  relativePath = v15->_relativePath;
  v15->_relativePath = (NSString *)v39;

  if (!BYTE6(p_mbNode->cloneID) && [(MBCKFile *)v15 isRegularFile])
  {
    v41 = MBGetDefaultLog();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      v42 = [v4 objectForKeyedSubscript:@"protectionClass"];
      *(_DWORD *)buf = 138412546;
      id v51 = v4;
      __int16 v52 = 2112;
      v53 = v42;
      _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "File dictionary %@ has an invalid protection class: %@", buf, 0x16u);

      [v4 objectForKeyedSubscript:@"protectionClass"];
      v49 = id v48 = v4;
      _MBLog();
    }
    BYTE6(p_mbNode->cloneID) = 4;
  }
  LOBYTE(v15->_restoreState) = (uint64_t)v15->_restoreState & 0xF7 | (8 * (v15->_resources == 0));
  v43 = objc_msgSend(v4, "objectForKeyedSubscript:", @"device", v48, v49);
  v44 = v43;
  if (v43)
  {
    v45 = [v43 hmacKey];
    uint64_t v46 = [(MBCKFile *)v15 fileIDWithHmacKey:v45];
    manifest = v15->_manifest;
    v15->_manifest = (MBCKManifest *)v46;
  }
}

- (void)confirmFileWasModifiedOnDisk
{
  if (![(MBCKFile *)self fileType])
  {
    memset(&v28, 0, sizeof(v28));
    id v3 = [(MBCKFile *)self assetPath];
    int v4 = lstat((const char *)[v3 fileSystemRepresentation], &v28);

    if (!v4)
    {
      uint64_t v6 = +[NSDate dateWithTimeIntervalSince1970:(double)v28.st_mtimespec.tv_sec];
      __int16 v9 = [(MBCKFile *)self modified];
      [v6 timeIntervalSinceDate:v9];
      double v11 = v10;
      uint64_t v12 = MBGetDefaultLog();
      int v13 = v12;
      if (v11 <= 0.0)
      {
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          double v24 = [(MBCKFile *)self assetPath];
          *(_DWORD *)buf = 138412290;
          objc_super v30 = v24;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "File %@ does not appear to have been modified on disk", buf, 0xCu);

          double v26 = [(MBCKFile *)self assetPath];
          _MBLog();
        }
        int v13 = [(MBCKModel *)self cache];
        id v25 = [v13 markFileAsCopyable:self];
      }
      else if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        uint64_t v14 = [(MBCKFile *)self assetPath];
        BOOL v15 = MBGetLogDateFormatter();
        uint64_t v16 = [v15 stringFromDate:v6];
        uint64_t v17 = MBGetLogDateFormatter();
        uint64_t v18 = [v17 stringFromDate:v9];
        *(_DWORD *)buf = 138413058;
        objc_super v30 = v14;
        __int16 v31 = 2112;
        char v32 = v16;
        __int16 v33 = 2048;
        double v34 = v11;
        __int16 v35 = 2112;
        unsigned int v36 = v18;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "File %@ was modified at %@, %f seconds after %@, the modified date cached during the last scan.", buf, 0x2Au);

        uint64_t v19 = [(MBCKFile *)self assetPath];
        objc_super v20 = MBGetLogDateFormatter();
        uint64_t v21 = [v20 stringFromDate:v6];
        char v22 = MBGetLogDateFormatter();
        BOOL v27 = [v22 stringFromDate:v9];
        _MBLog();
      }
      goto LABEL_16;
    }
    int v5 = *__error();
    uint64_t v6 = MBGetDefaultLog();
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);
    if (v5 == 2)
    {
      if (v7)
      {
        unsigned int v8 = [(MBCKFile *)self assetPath];
        *(_DWORD *)buf = 138412290;
        objc_super v30 = v8;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "File %@ is no longer on disk", buf, 0xCu);

        __int16 v9 = [(MBCKFile *)self assetPath];
LABEL_11:
        _MBLog();
LABEL_16:
      }
    }
    else if (v7)
    {
      uint64_t v23 = [(MBCKFile *)self assetPath];
      *(_DWORD *)buf = 138412546;
      objc_super v30 = v23;
      __int16 v31 = 1024;
      LODWORD(v32) = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Cannot tell if file %@ has changed on disk: stat failed: %{errno}d", buf, 0x12u);

      __int16 v9 = [(MBCKFile *)self assetPath];
      goto LABEL_11;
    }
  }
}

- (BOOL)validateEncryptionKeyWithError:(id *)a3
{
  if (![(MBCKFile *)self isRegularFile] || ![(MBCKFile *)self size]) {
    return 1;
  }
  if (((uint64_t)self->_restoreState & 8) != 0)
  {
    [(MBCKFile *)self encryptionKey];
    if (objc_claimAutoreleasedReturnValue()) {
      __assert_rtn("-[MBCKFile validateEncryptionKeyWithError:]", "MBCKFile.m", 537, "!self.encryptionKey");
    }
    return 1;
  }
  int v5 = BYTE6(self->_mbNode.cloneID);
  unsigned __int8 v6 = 1;
  if ([(MBCKFile *)self isProtected] && (v5 & 0xFFFFFFFB) != 3)
  {
    BOOL v7 = [(MBCKFile *)self encryptionKey];

    if (v7)
    {
      unsigned int v8 = [(MBCKFile *)self assetPath];
      __int16 v9 = +[MBKeyBagFile keybagFileWithPath:v8 error:a3];
      double v10 = v9;
      if (v9) {
        unsigned __int8 v6 = [v9 validateEncryptionKey:self->_resources error:a3];
      }
      else {
        unsigned __int8 v6 = 0;
      }
    }
    else if (a3)
    {
      +[MBError errorWithCode:1 format:@"Nil encryption key"];
      unsigned __int8 v6 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      return 0;
    }
  }
  return v6;
}

- (void)_setFileMissingEncryptionKeyForPath:(id)a3 account:(id)a4
{
  id v9 = a4;
  id v6 = a3;
  BOOL v7 = [(MBCKModel *)self cache];
  unsigned int v8 = [v7 setFileMissingEncryptionKeyForPath:v6];

  if (!v8) {
    +[MBCKEncryptionManager trackMissingEncryptionKeyForAccount:v9];
  }
}

- (BOOL)fetchEncryptionKeyWithAccount:(id)a3 device:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (!v8) {
    __assert_rtn("-[MBCKFile fetchEncryptionKeyWithAccount:device:error:]", "MBCKFile.m", 564, "account");
  }
  double v10 = v9;
  if ([(MBCKFile *)self isRegularFile])
  {
    if (!v10)
    {
      if (!a5)
      {
LABEL_27:
        BOOL v23 = 0;
        goto LABEL_152;
      }
      uint64_t v19 = [(MBCKFile *)self absolutePath];
      id v20 = +[MBError errorWithCode:205 path:v19 format:@"Nil device"];
LABEL_26:
      *a5 = v20;

      goto LABEL_27;
    }
    uint64_t v11 = BYTE6(self->_mbNode.cloneID);
    unsigned int v12 = [(MBCKFile *)self isProtected];
    char restoreState = (char)self->_restoreState;
    if (v12 && (v11 & 0xFB) != 3)
    {
      LOBYTE(self->_restoreState) = restoreState & 0xF7;
      if (v11 <= 7 && ((1 << v11) & 0x98) != 0) {
        __assert_rtn("-[MBCKFile fetchEncryptionKeyWithAccount:device:error:]", "MBCKFile.m", 588, "pc != MBProtectionClassC && pc != MBProtectionClassCx && pc != MBProtectionClassD && \"Unexpected protection class\"");
      }
      BOOL v15 = [v10 keybagManager];
      unsigned __int8 v16 = [v15 hasKeybags];

      if (v16)
      {
        id v129 = [(MBCKFile *)self assetPath];
        unint64_t v17 = [(MBCKFile *)self inode];
        __darwin_ino64_t v126 = *(void *)&self->_is;
        if (!v126) {
          __assert_rtn("-[MBCKFile fetchEncryptionKeyWithAccount:device:error:]", "MBCKFile.m", 601, "volumeType != MBVolumeTypeUnspecified");
        }
        __darwin_ino64_t st_ino = v17;
        if (!v17)
        {
          memset(&buf, 0, sizeof(buf));
          id v24 = v129;
          if (stat((const char *)[v24 fileSystemRepresentation], &buf))
          {
            id v25 = __error();
            uint64_t v26 = *v25;
            if (a5)
            {
              *a5 = +[MBError posixErrorWithCode:100, v24, @"Failed to stat file: (%s) %d", strerror(*v25), v26 path format];
            }
            BOOL v27 = MBGetDefaultLog();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)v134 = 138412546;
              id v135 = v24;
              __int16 v136 = 1024;
              int v137 = v26;
              _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "Failed to stat %@: %{errno}d", v134, 0x12u);
              _MBLog();
            }

            BOOL v23 = 0;
            goto LABEL_151;
          }
          __darwin_ino64_t st_ino = buf.st_ino;
        }
        if (![(MBCKFile *)self size])
        {
          stat v28 = [(MBCKModel *)self cache];
          id v133 = 0;
          char v29 = [v28 encryptionKeyForFileWithInodeNumber:st_ino volumeType:v126 error:&v133];
          id v130 = v133;
          resources = self->_resources;
          self->_resources = v29;

          if (v130)
          {
            __int16 v31 = MBGetDefaultLog();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
            {
              buf.st_dev = 134218498;
              *(void *)&buf.st_mode = st_ino;
              WORD2(buf.st_ino) = 2112;
              *(__darwin_ino64_t *)((char *)&buf.st_ino + 6) = (__darwin_ino64_t)v129;
              HIWORD(buf.st_gid) = 2112;
              *(void *)&buf.st_rdev = v130;
              _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "Failed to fetch the cached encryption key for 0-byte inode:%llu at %@: %@", (uint8_t *)&buf, 0x20u);
              v121 = (NSString *)v129;
              id v122 = v130;
              id v119 = (id)st_ino;
              _MBLog();
            }
          }
          if (self->_resources)
          {
            char v32 = [v10 keybagManager];
            __int16 v33 = [(MBCKFile *)self keybagUUIDString];
            unsigned __int8 v34 = [v32 hasKeybagWithUUID:v33];

            if ((v34 & 1) == 0)
            {
              __int16 v35 = MBGetDefaultLog();
              if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
              {
                buf.st_dev = 134218242;
                *(void *)&buf.st_mode = st_ino;
                WORD2(buf.st_ino) = 2112;
                *(__darwin_ino64_t *)((char *)&buf.st_ino + 6) = (__darwin_ino64_t)v129;
                _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "Keybag UUID mismatch for 0-byte inode:%llu at %@", (uint8_t *)&buf, 0x16u);
                id v119 = (id)st_ino;
                v121 = (NSString *)v129;
                _MBLog();
              }

              unsigned int v36 = self->_resources;
              self->_resources = 0;
            }
          }
          v37 = [(MBCKFile *)self encryptionKey];

          if (!v37)
          {
            BOOL v23 = 1;
LABEL_150:

LABEL_151:
            goto LABEL_152;
          }
          oslog = MBGetDefaultLog();
          BOOL v23 = 1;
          if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
          {
            NSUInteger v38 = [(NSData *)self->_resources length];
            buf.st_dev = 134218498;
            *(void *)&buf.st_mode = v38;
            WORD2(buf.st_ino) = 2048;
            *(__darwin_ino64_t *)((char *)&buf.st_ino + 6) = st_ino;
            HIWORD(buf.st_gid) = 2112;
            *(void *)&buf.st_rdev = v129;
            _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_INFO, "Found cached encryption key (size: %tu) for 0-byte inode:%llu at %@", (uint8_t *)&buf, 0x20u);
            [(NSData *)self->_resources length];
            _MBLog();
          }
LABEL_149:

          goto LABEL_150;
        }
        id v132 = 0;
        oslog = +[MBKeyBagFile keybagFileWithPath:v129 error:&v132];
        id v130 = v132;
        if (!oslog)
        {
          uint64_t v39 = MBGetDefaultLog();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
          {
            buf.st_dev = 138412546;
            *(void *)&buf.st_mode = v129;
            WORD2(buf.st_ino) = 2112;
            *(__darwin_ino64_t *)((char *)&buf.st_ino + 6) = (__darwin_ino64_t)v130;
            _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, "Failed to open file to get encryption key %@: %@", (uint8_t *)&buf, 0x16u);
            _MBLog();
          }

          if (a5)
          {
            id v130 = v130;
            BOOL v23 = 0;
            *a5 = v130;
          }
          else
          {
            BOOL v23 = 0;
          }

          goto LABEL_150;
        }
        rsrcTemporaryPath = self->_rsrcTemporaryPath;
        if (rsrcTemporaryPath)
        {
          v125 = rsrcTemporaryPath;
        }
        else
        {
          v40 = [(MBCKFile *)self domain];
          v41 = [v40 rootPath];
          v42 = [(MBCKFile *)self relativePath];
          v125 = [v41 stringByAppendingPathComponent:v42];
        }
        self->_resourceAsset = (CKAsset *)[oslog size];
        v43 = [(MBCKFile *)self encryptionKey];

        if (v43)
        {
          v44 = MBGetDefaultLog();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
          {
            v45 = v44;
            if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
            {
              NSUInteger v46 = [(NSData *)self->_resources length];
              buf.st_dev = 134218498;
              *(void *)&buf.st_mode = v46;
              WORD2(buf.st_ino) = 2048;
              *(__darwin_ino64_t *)((char *)&buf.st_ino + 6) = st_ino;
              HIWORD(buf.st_gid) = 2112;
              *(void *)&buf.st_rdev = v129;
              _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_INFO, "Found encryption key (size: %tu) for inode:%llu at %@", (uint8_t *)&buf, 0x20u);
            }

            v121 = (NSString *)st_ino;
            id v122 = v129;
            id v119 = [(NSData *)self->_resources length];
            _MBLog();
          }

          v47 = [v10 keybagManager];
          id v48 = [(MBCKFile *)self keybagUUIDString];
          unsigned __int8 v49 = [v47 hasKeybagWithUUID:v48];

          if (v49)
          {
            p_resources = &self->_resources;
            if ([oslog validateEncryptionKey:self->_resources error:a5])
            {
              if (+[MBProtectionClassUtils canOpenWhenLocked:v11])
              {
                id v124 = v130;
LABEL_132:
                v55 = MBGetDefaultLog();
                BOOL v23 = 1;
                if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
                {
                  v93 = v55;
                  if (os_log_type_enabled(v93, OS_LOG_TYPE_INFO))
                  {
                    NSUInteger v94 = [(NSData *)*p_resources length];
                    buf.st_dev = 134218498;
                    *(void *)&buf.st_mode = v94;
                    WORD2(buf.st_ino) = 2048;
                    *(__darwin_ino64_t *)((char *)&buf.st_ino + 6) = st_ino;
                    HIWORD(buf.st_gid) = 2112;
                    *(void *)&buf.st_rdev = v129;
                    _os_log_impl((void *)&_mh_execute_header, v93, OS_LOG_TYPE_INFO, "Cached encryption key (size: %tu) for inode:%llu at %@", (uint8_t *)&buf, 0x20u);
                  }
                  v55 = v93;

                  v121 = (NSString *)st_ino;
                  id v122 = v129;
                  id v119 = [(NSData *)*p_resources length];
                  _MBLog();
                }
                __int16 v52 = 0;
                goto LABEL_139;
              }
              v57 = [(MBCKModel *)self cache];
              id v124 = [v57 setFileEncryptionKey:*p_resources forInodeNumber:st_ino volumeType:v126 atPath:v129];

              if (!v124)
              {
                id v124 = 0;
                goto LABEL_132;
              }
              if (a5) {
                *a5 = v124;
              }
              v55 = MBGetDefaultLog();
              if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
              {
                buf.st_dev = 134218498;
                *(void *)&buf.st_mode = st_ino;
                WORD2(buf.st_ino) = 2112;
                *(__darwin_ino64_t *)((char *)&buf.st_ino + 6) = (__darwin_ino64_t)v129;
                HIWORD(buf.st_gid) = 2112;
                *(void *)&buf.st_rdev = v124;
                v56 = v55;
                _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_ERROR, "Failed to save the encryption key for inode:%llu at %@: %@", (uint8_t *)&buf, 0x20u);
                v121 = (NSString *)v129;
                id v122 = v124;
                id v119 = (id)st_ino;
                _MBLog();
                __int16 v52 = 0;
                goto LABEL_110;
              }
              __int16 v52 = 0;
              goto LABEL_138;
            }
            v53 = [(MBCKFile *)self encryptionKey];
            __int16 v52 = [oslog updatedEncryptionKeyForCurrentKey:v53 withError:0];

            if (v52)
            {
              if ([oslog validateEncryptionKey:v52 error:a5])
              {
                objc_storeStrong((id *)&self->_resources, v52);
                if (!+[MBProtectionClassUtils canOpenWhenLocked:v11])
                {
                  v54 = [(MBCKModel *)self cache];
                  id v124 = [v54 setFileEncryptionKey:*p_resources forInodeNumber:st_ino volumeType:v126 atPath:v129];

                  if (v124)
                  {
                    if (a5) {
                      *a5 = v124;
                    }
                    v55 = MBGetDefaultLog();
                    if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
                    {
                      buf.st_dev = 134218498;
                      *(void *)&buf.st_mode = st_ino;
                      WORD2(buf.st_ino) = 2112;
                      *(__darwin_ino64_t *)((char *)&buf.st_ino + 6) = (__darwin_ino64_t)v129;
                      HIWORD(buf.st_gid) = 2112;
                      *(void *)&buf.st_rdev = v124;
                      v56 = v55;
                      _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_ERROR, "Failed to save the encryption key for inode:%llu at %@: %@", (uint8_t *)&buf, 0x20u);
                      v121 = (NSString *)v129;
                      id v122 = v124;
                      id v119 = (id)st_ino;
                      _MBLog();
LABEL_110:
                      BOOL v23 = 0;
                      v55 = v56;
LABEL_139:

                      int v91 = 1;
                      id v130 = v124;
LABEL_140:

                      if (([oslog closeWithError:a5] & 1) == 0)
                      {
                        v95 = MBGetDefaultLog();
                        if (os_log_type_enabled(v95, OS_LOG_TYPE_ERROR))
                        {
                          if (a5)
                          {
                            id v96 = *a5;
                            buf.st_dev = 138412290;
                            *(void *)&buf.st_mode = v96;
                            _os_log_impl((void *)&_mh_execute_header, v95, OS_LOG_TYPE_ERROR, "Failed to close keybag file: %@", (uint8_t *)&buf, 0xCu);
                            CFStringRef v97 = (const __CFString *)*a5;
                          }
                          else
                          {
                            buf.st_dev = 138412290;
                            CFStringRef v97 = @"(no error available)";
                            *(void *)&buf.st_mode = @"(no error available)";
                            _os_log_impl((void *)&_mh_execute_header, v95, OS_LOG_TYPE_ERROR, "Failed to close keybag file: %@", (uint8_t *)&buf, 0xCu);
                          }
                          id v119 = (id)v97;
                          _MBLog();
                        }
                      }
                      if (v91) {
                        goto LABEL_148;
                      }
                      v99 = [(MBCKFile *)self encryptionKey];

                      if (v99
                        && ([v10 keybagManager],
                            v100 = objc_claimAutoreleasedReturnValue(),
                            [(MBCKFile *)self keybagUUIDString],
                            v101 = objc_claimAutoreleasedReturnValue(),
                            unsigned __int8 v102 = [v100 hasKeybagWithUUID:v101],
                            v101,
                            v100,
                            (v102 & 1) == 0))
                      {
                        v108 = MBGetDefaultLog();
                        if (os_log_type_enabled(v108, OS_LOG_TYPE_ERROR))
                        {
                          v109 = [(MBCKFile *)self keybagUUIDString];
                          buf.st_dev = 138412290;
                          *(void *)&buf.st_mode = v109;
                          _os_log_impl((void *)&_mh_execute_header, v108, OS_LOG_TYPE_ERROR, "Current device keybags do not contain file keybag (%@)", (uint8_t *)&buf, 0xCu);

                          v120 = [(MBCKFile *)self keybagUUIDString];
                          _MBLog();
                        }
                        [(MBCKFile *)self _setFileMissingEncryptionKeyForPath:v125 account:v8];
                        v110 = [(MBCKModel *)self cache];
                        [v110 removeFileEncryptionKeyForInode:st_ino volumeType:v126];

                        if (a5)
                        {
                          v111 = [(MBCKFile *)self absolutePath];
                          *a5 = +[MBError errorWithCode:205 path:v111 format:@"Current device keybags do not contain file keybag"];
                        }
                      }
                      else
                      {
                        v103 = [(MBCKFile *)self encryptionKey];
                        BOOL v104 = v103 == 0;

                        if (!v104)
                        {
                          if (!+[MBProtectionClassUtils canOpenWhenLocked:v11])
                          {
                            v105 = [(MBCKModel *)self cache];
                            v106 = [v105 setFileEncryptionKey:self->_resources forInodeNumber:st_ino volumeType:v126 atPath:v129];

                            if (v106)
                            {
                              if (a5) {
                                *a5 = v106;
                              }
                              v107 = MBGetDefaultLog();
                              if (os_log_type_enabled(v107, OS_LOG_TYPE_ERROR))
                              {
                                buf.st_dev = 134218498;
                                *(void *)&buf.st_mode = st_ino;
                                WORD2(buf.st_ino) = 2112;
                                *(__darwin_ino64_t *)((char *)&buf.st_ino + 6) = (__darwin_ino64_t)v129;
                                HIWORD(buf.st_gid) = 2112;
                                *(void *)&buf.st_rdev = v106;
                                _os_log_impl((void *)&_mh_execute_header, v107, OS_LOG_TYPE_ERROR, "Failed to save the encryption key for inode:%llu at %@: %@", (uint8_t *)&buf, 0x20u);
                                _MBLog();
                              }

                              BOOL v23 = 0;
                              id v130 = v106;
                              goto LABEL_148;
                            }
                            v113 = MBGetDefaultLog();
                            if (os_log_type_enabled(v113, OS_LOG_TYPE_INFO))
                            {
                              NSUInteger v114 = [(NSData *)self->_resources length];
                              buf.st_dev = 134218498;
                              *(void *)&buf.st_mode = v114;
                              WORD2(buf.st_ino) = 2048;
                              *(__darwin_ino64_t *)((char *)&buf.st_ino + 6) = st_ino;
                              HIWORD(buf.st_gid) = 2112;
                              *(void *)&buf.st_rdev = v129;
                              _os_log_impl((void *)&_mh_execute_header, v113, OS_LOG_TYPE_INFO, "Cached encryption key (size: %tu) for inode:%llu at %@", (uint8_t *)&buf, 0x20u);
                              [(NSData *)self->_resources length];
                              _MBLog();
                            }

                            id v130 = 0;
                          }
                          BOOL v23 = 1;
LABEL_148:

                          goto LABEL_149;
                        }
                        v112 = MBGetDefaultLog();
                        if (os_log_type_enabled(v112, OS_LOG_TYPE_INFO))
                        {
                          buf.st_dev = 134218242;
                          *(void *)&buf.st_mode = st_ino;
                          WORD2(buf.st_ino) = 2112;
                          *(__darwin_ino64_t *)((char *)&buf.st_ino + 6) = (__darwin_ino64_t)v125;
                          _os_log_impl((void *)&_mh_execute_header, v112, OS_LOG_TYPE_INFO, "Setting missing encryption key for inode:%llu at %@", (uint8_t *)&buf, 0x16u);
                          _MBLog();
                        }

                        [(MBCKFile *)self _setFileMissingEncryptionKeyForPath:v125 account:v8];
                        if (a5)
                        {
                          +[MBError errorWithCode:100 path:v129 format:@"Failed to retrieve encryption key for file"];
                          BOOL v23 = 0;
                          *a5 = (id)objc_claimAutoreleasedReturnValue();
                          goto LABEL_148;
                        }
                      }
                      BOOL v23 = 0;
                      goto LABEL_148;
                    }
LABEL_138:
                    BOOL v23 = 0;
                    goto LABEL_139;
                  }
                  id v130 = 0;
                }
                v55 = MBGetDefaultLog();
                BOOL v23 = 1;
                if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
                {
                  v117 = v55;
                  if (os_log_type_enabled(v117, OS_LOG_TYPE_INFO))
                  {
                    NSUInteger v118 = [(NSData *)*p_resources length];
                    buf.st_dev = 134218498;
                    *(void *)&buf.st_mode = v118;
                    WORD2(buf.st_ino) = 2048;
                    *(__darwin_ino64_t *)((char *)&buf.st_ino + 6) = st_ino;
                    HIWORD(buf.st_gid) = 2112;
                    *(void *)&buf.st_rdev = v129;
                    _os_log_impl((void *)&_mh_execute_header, v117, OS_LOG_TYPE_INFO, "Updated key (size: %tu) for inode:%llu at %@ from the cache with new extent information", (uint8_t *)&buf, 0x20u);
                  }
                  v55 = v117;

                  v121 = (NSString *)st_ino;
                  id v122 = v129;
                  id v119 = [(NSData *)*p_resources length];
                  _MBLog();
                }
LABEL_129:
                id v124 = v130;
                goto LABEL_139;
              }
              v58 = MBGetDefaultLog();
              if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
              {
                v58 = v58;
                if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
                {
                  id v62 = [v52 length];
                  id v63 = *a5;
                  buf.st_dev = 134218754;
                  *(void *)&buf.st_mode = v62;
                  WORD2(buf.st_ino) = 2048;
                  *(__darwin_ino64_t *)((char *)&buf.st_ino + 6) = st_ino;
                  HIWORD(buf.st_gid) = 2112;
                  *(void *)&buf.st_rdev = v129;
                  LOWORD(buf.st_atimespec.tv_sec) = 2112;
                  *(__darwin_time_t *)((char *)&buf.st_atimespec.tv_sec + 2) = (__darwin_time_t)v63;
                  _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_ERROR, "Failed to validate updated encryption key (size: %tu) for inode:%llu at %@: %@", (uint8_t *)&buf, 0x2Au);
                }

                id v64 = [v52 length];
                id v122 = v129;
                id v123 = *a5;
                id v119 = v64;
                v121 = (NSString *)st_ino;
                _MBLog();
              }
            }
            else
            {
              v58 = MBGetDefaultLog();
              if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
              {
                v58 = v58;
                if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
                {
                  NSUInteger v59 = [(NSData *)*p_resources length];
                  id v60 = *a5;
                  buf.st_dev = 134218754;
                  *(void *)&buf.st_mode = v59;
                  WORD2(buf.st_ino) = 2048;
                  *(__darwin_ino64_t *)((char *)&buf.st_ino + 6) = st_ino;
                  HIWORD(buf.st_gid) = 2112;
                  *(void *)&buf.st_rdev = v129;
                  LOWORD(buf.st_atimespec.tv_sec) = 2112;
                  *(__darwin_time_t *)((char *)&buf.st_atimespec.tv_sec + 2) = (__darwin_time_t)v60;
                  _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_ERROR, "Failed to update cached encryption key (size: %tu) for inode:%llu at %@: %@", (uint8_t *)&buf, 0x2Au);
                }

                id v61 = [(NSData *)*p_resources length];
                id v122 = v129;
                id v123 = *a5;
                id v119 = v61;
                v121 = (NSString *)st_ino;
                _MBLog();
              }
            }

            v65 = *p_resources;
            *p_resources = 0;
          }
          else
          {
            id v51 = MBGetDefaultLog();
            if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
            {
              buf.st_dev = 134218242;
              *(void *)&buf.st_mode = st_ino;
              WORD2(buf.st_ino) = 2112;
              *(__darwin_ino64_t *)((char *)&buf.st_ino + 6) = (__darwin_ino64_t)v129;
              _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_ERROR, "Keybag UUID mismatch for inode:%llu at %@", (uint8_t *)&buf, 0x16u);
              id v119 = (id)st_ino;
              v121 = (NSString *)v129;
              _MBLog();
            }

            __int16 v52 = self->_resources;
            self->_resources = 0;
          }
        }
        v66 = [(MBCKModel *)self cache];
        id v131 = 0;
        v67 = [v66 encryptionKeyForFileWithInodeNumber:st_ino volumeType:v126 error:&v131];
        id v130 = v131;
        v68 = &self->_resources;
        v69 = self->_resources;
        self->_resources = v67;

        if (v130)
        {
          v70 = MBGetDefaultLog();
          if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
          {
            buf.st_dev = 134218754;
            *(void *)&buf.st_mode = st_ino;
            WORD2(buf.st_ino) = 2048;
            *(__darwin_ino64_t *)((char *)&buf.st_ino + 6) = v126;
            HIWORD(buf.st_gid) = 2112;
            *(void *)&buf.st_rdev = v129;
            LOWORD(buf.st_atimespec.tv_sec) = 2112;
            *(__darwin_time_t *)((char *)&buf.st_atimespec.tv_sec + 2) = (__darwin_time_t)v130;
            _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_ERROR, "Failed to fetch the cached encryption key for inode:%llu volumeType:%lu at %@: %@", (uint8_t *)&buf, 0x2Au);
            id v122 = v129;
            id v123 = v130;
            id v119 = (id)st_ino;
            v121 = (NSString *)v126;
            v68 = &self->_resources;
            _MBLog();
          }
        }
        if (*v68)
        {
          v71 = MBGetDefaultLog();
          if (os_log_type_enabled(v71, OS_LOG_TYPE_INFO))
          {
            v72 = v71;
            if (os_log_type_enabled(v72, OS_LOG_TYPE_INFO))
            {
              NSUInteger v73 = [(NSData *)*v68 length];
              buf.st_dev = 134218498;
              *(void *)&buf.st_mode = v73;
              WORD2(buf.st_ino) = 2048;
              *(__darwin_ino64_t *)((char *)&buf.st_ino + 6) = st_ino;
              HIWORD(buf.st_gid) = 2112;
              *(void *)&buf.st_rdev = v129;
              _os_log_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_INFO, "Found cached encryption key (size: %tu) for inode:%llu at %@", (uint8_t *)&buf, 0x20u);
            }

            v121 = (NSString *)st_ino;
            id v122 = v129;
            id v119 = [(NSData *)*v68 length];
            _MBLog();
          }

          if ([oslog validateEncryptionKey:*v68 error:a5])
          {
            __int16 v52 = 0;
          }
          else
          {
            v74 = [(MBCKFile *)self encryptionKey];
            __int16 v52 = [oslog updatedEncryptionKeyForCurrentKey:v74 withError:0];

            if (v52
              && ([oslog validateEncryptionKey:v52 error:a5] & 1) != 0)
            {
              objc_storeStrong((id *)v68, v52);
              if (!+[MBProtectionClassUtils canOpenWhenLocked:v11])
              {
                v75 = [(MBCKModel *)self cache];
                id v124 = [v75 setFileEncryptionKey:*v68 forInodeNumber:st_ino volumeType:v126 atPath:v129];

                if (v124)
                {
                  if (a5) {
                    *a5 = v124;
                  }
                  v55 = MBGetDefaultLog();
                  if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
                  {
                    buf.st_dev = 134218498;
                    *(void *)&buf.st_mode = st_ino;
                    WORD2(buf.st_ino) = 2112;
                    *(__darwin_ino64_t *)((char *)&buf.st_ino + 6) = (__darwin_ino64_t)v129;
                    HIWORD(buf.st_gid) = 2112;
                    *(void *)&buf.st_rdev = v124;
                    v56 = v55;
                    _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_ERROR, "Failed to save the encryption key for inode:%llu at %@: %@", (uint8_t *)&buf, 0x20u);
                    v121 = (NSString *)v129;
                    id v122 = v124;
                    id v119 = (id)st_ino;
                    _MBLog();
                    goto LABEL_110;
                  }
                  goto LABEL_138;
                }
                id v130 = 0;
              }
              v55 = MBGetDefaultLog();
              BOOL v23 = 1;
              if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
              {
                v115 = v55;
                if (os_log_type_enabled(v115, OS_LOG_TYPE_INFO))
                {
                  NSUInteger v116 = [(NSData *)*v68 length];
                  buf.st_dev = 134218498;
                  *(void *)&buf.st_mode = v116;
                  WORD2(buf.st_ino) = 2048;
                  *(__darwin_ino64_t *)((char *)&buf.st_ino + 6) = st_ino;
                  HIWORD(buf.st_gid) = 2112;
                  *(void *)&buf.st_rdev = v129;
                  _os_log_impl((void *)&_mh_execute_header, v115, OS_LOG_TYPE_INFO, "Updated key (size: %tu) for inode:%llu at %@ from the cache with new extent information", (uint8_t *)&buf, 0x20u);
                }
                v55 = v115;

                v121 = (NSString *)st_ino;
                id v122 = v129;
                id v119 = [(NSData *)*v68 length];
                _MBLog();
              }
              goto LABEL_129;
            }
            v76 = MBGetDefaultLog();
            if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR))
            {
              v77 = v76;
              if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
              {
                id v78 = [v52 length];
                id v79 = *a5;
                buf.st_dev = 134218754;
                *(void *)&buf.st_mode = v78;
                WORD2(buf.st_ino) = 2048;
                *(__darwin_ino64_t *)((char *)&buf.st_ino + 6) = st_ino;
                HIWORD(buf.st_gid) = 2112;
                *(void *)&buf.st_rdev = v129;
                LOWORD(buf.st_atimespec.tv_sec) = 2112;
                *(__darwin_time_t *)((char *)&buf.st_atimespec.tv_sec + 2) = (__darwin_time_t)v79;
                _os_log_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_ERROR, "Failed to validate cached encryption key (size: %tu) for inode:%llu at %@: %@", (uint8_t *)&buf, 0x2Au);
              }

              id v80 = [v52 length];
              id v122 = v129;
              id v123 = *a5;
              id v119 = v80;
              v121 = (NSString *)st_ino;
              _MBLog();
            }

            v81 = [(MBCKModel *)self cache];
            [v81 removeFileEncryptionKeyForInode:st_ino volumeType:v126];

            v82 = *v68;
            *v68 = 0;
          }
          if (*v68)
          {
            v83 = [(MBCKFile *)self keybagUUIDString];
            if (v83)
            {
              v84 = [v10 keybagManager];
              unsigned __int8 v85 = [v84 hasKeybagWithUUID:v83];

              if ((v85 & 1) == 0)
              {
                v86 = MBGetDefaultLog();
                if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR))
                {
                  buf.st_dev = 138412290;
                  *(void *)&buf.st_mode = v83;
                  _os_log_impl((void *)&_mh_execute_header, v86, OS_LOG_TYPE_ERROR, "Device keybags do not contain file keybag (%@)", (uint8_t *)&buf, 0xCu);
                  id v119 = v83;
                  _MBLog();
                }

                v87 = [(MBCKModel *)self cache];
                [v87 removeFileEncryptionKeyForInode:st_ino volumeType:v126];

                v88 = *v68;
                *v68 = 0;
              }
            }

            if (*v68)
            {
LABEL_124:
              int v91 = 0;
              BOOL v23 = 0;
              goto LABEL_140;
            }
          }
        }
        else
        {
          __int16 v52 = 0;
        }
        uint64_t v89 = -[NSObject encryptionKeyWithError:](oslog, "encryptionKeyWithError:", 0, v119, v121, v122, v123);
        v90 = *v68;
        *v68 = (NSData *)v89;

        if (!*v68)
        {
          v92 = MBGetDefaultLog();
          if (os_log_type_enabled(v92, OS_LOG_TYPE_INFO))
          {
            buf.st_dev = 134218242;
            *(void *)&buf.st_mode = st_ino;
            WORD2(buf.st_ino) = 2112;
            *(__darwin_ino64_t *)((char *)&buf.st_ino + 6) = (__darwin_ino64_t)v125;
            _os_log_impl((void *)&_mh_execute_header, v92, OS_LOG_TYPE_INFO, "Setting missing encryption key for inode:%llu at %@", (uint8_t *)&buf, 0x16u);
            id v119 = (id)st_ino;
            v121 = v125;
            _MBLog();
          }

          [(MBCKFile *)self _setFileMissingEncryptionKeyForPath:v125 account:v8];
          if (!a5)
          {
            BOOL v23 = 0;
            int v91 = 1;
            goto LABEL_140;
          }
          v55 = [(MBCKFile *)self birth];
          +[MBError errorWithCode:209, v129, @"Missing encryption key for file (created at %@)", v55 path format];
          BOOL v23 = 0;
          *a5 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_129;
        }
        goto LABEL_124;
      }
      if (!a5) {
        goto LABEL_27;
      }
      uint64_t v19 = [(MBCKFile *)self absolutePath];
      id v20 = +[MBError errorWithCode:205 path:v19 format:@"No keybag"];
      goto LABEL_26;
    }
    LOBYTE(self->_restoreState) = restoreState | 8;
    uint64_t v21 = self->_resources;
    self->_resources = 0;

    char v22 = MBGetDefaultLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      buf.st_dev = 138412290;
      *(void *)&buf.st_mode = self;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEBUG, "Not fetching the encryption key for %@", (uint8_t *)&buf, 0xCu);
      _MBLog();
    }
  }
  BOOL v23 = 1;
LABEL_152:

  return v23;
}

- (int)prepareForUploadWithEngine:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (!a4) {
    __assert_rtn("-[MBCKFile prepareForUploadWithEngine:error:]", "MBCKFile.m", 808, "error");
  }
  BOOL v7 = v6;
  uint64_t v8 = [v6 serviceAccount];
  if (!v8) {
    __assert_rtn("-[MBCKFile prepareForUploadWithEngine:error:]", "MBCKFile.m", 810, "serviceAccount");
  }
  id v9 = (void *)v8;
  if (((uint64_t)self->_restoreState & 0x10) != 0)
  {
    uint64_t v11 = 0;
LABEL_51:
    int v36 = 0;
    int v37 = 2;
    goto LABEL_69;
  }
  uint64_t v10 = BYTE6(self->_mbNode.cloneID);
  uint64_t v11 = [(MBCKFile *)self absolutePath];
  LODWORD(v12) = [(MBCKFile *)self isSQLiteFile];
  unsigned int v13 = [(MBCKFile *)self isDataless];
  if ((v13 & 1) != 0
    || !+[MBProtectionClassUtils canOpenWhenLocked:v10])
  {
    goto LABEL_48;
  }
  if (!v12)
  {
    if ([(MBCKFile *)self size])
    {
      char v72 = 0;
      LODWORD(v12) = [(MBCKFile *)self userID];
      BOOL v19 = v12 == MBMobileUID();
      LOBYTE(v12) = 0;
      if (v19)
      {
        unsigned int v12 = [(MBCKFile *)self domainName];
        unsigned int v27 = [v12 isEqualToString:@"HomeDomain"];

        LOBYTE(v12) = 0;
        if (v27)
        {
          uint64_t v28 = [(MBCKFile *)self relativePath];
          if (!v28) {
            __assert_rtn("-[MBCKFile prepareForUploadWithEngine:error:]", "MBCKFile.m", 866, "relativePath");
          }
          id v25 = (void *)v28;
          if (qword_100482430 != -1) {
            dispatch_once(&qword_100482430, &stru_100413288);
          }
          if (![(id)qword_100482428 containsObject:v25]) {
            goto LABEL_47;
          }
          char v29 = [v7 persona];
          uint64_t v69 = [v29 sqliteCopyDirectory];

          v71 = [v7 serviceAccount];
          objc_super v30 = [v7 device];
          id v73 = 0;
          unsigned __int8 v66 = [(MBCKFile *)self encodeWithFileAtPath:v11 encodingMethod:1 hasSnapshot:1 destinationDirectory:v69 account:v71 device:v30 error:&v73];
          id v31 = v73;

          if ((v66 & 1) == 0)
          {
            char v32 = MBGetDefaultLog();
            if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)stat buf = 138412546;
              id v77 = v11;
              __int16 v78 = 2112;
              id v79 = v31;
              _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Failed to compress the file at %@: %@", buf, 0x16u);
              id v58 = v11;
              id v59 = v31;
              _MBLog();
            }
          }
          uint64_t v26 = (void *)v69;
          goto LABEL_45;
        }
      }
    }
LABEL_48:
    if ([(MBCKFile *)self hasResources]
      && ![(MBCKFile *)self _createResourceCopyWithError:a4])
    {
      p_super = MBGetDefaultLog();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
      {
        id v49 = *a4;
        *(_DWORD *)stat buf = 138412290;
        id v77 = v49;
        _os_log_impl((void *)&_mh_execute_header, p_super, OS_LOG_TYPE_ERROR, "Failed to create copy of file resources: %@", buf, 0xCu);
        id v58 = *a4;
LABEL_56:
        _MBLog();
      }
    }
    else
    {
      if ((v13 | MBIsInternalInstall() ^ 1)) {
        goto LABEL_51;
      }
      char v46 = (char)v12;
      uint64_t v47 = [(MBCKFile *)self sha256Signature];
      if (v47)
      {
        p_super = v47;
LABEL_67:
        int v36 = 0;
        int v37 = 2;
        goto LABEL_68;
      }
      if (![(MBCKFile *)self isRegularFile])
      {
        p_super = 0;
        goto LABEL_67;
      }
      int v36 = 0;
      p_super = 0;
      int v37 = 2;
      if (v10 > 7 || ((1 << v10) & 0x98) == 0) {
        goto LABEL_68;
      }
      if ((v46 & 1) == 0
        && ([v11 hasSuffix:@"plist"] & 1) == 0
        && ![v11 hasSuffix:@"wal"])
      {
        int v36 = 0;
        goto LABEL_69;
      }
      v50 = +[MBDigest sha256];
      id v51 = [v50 digestForFileAtPath:v11 error:a4];

      if (v51)
      {
        int v36 = 0;
        p_super = &self->_encryptionKey->super;
        self->_encryptionKey = v51;
        goto LABEL_68;
      }
      p_super = MBGetDefaultLog();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
      {
        id v57 = *a4;
        *(_DWORD *)stat buf = 138412546;
        id v77 = v11;
        __int16 v78 = 2112;
        id v79 = v57;
        _os_log_impl((void *)&_mh_execute_header, p_super, OS_LOG_TYPE_ERROR, "Unable to create internal-only digest for %@: %@", buf, 0x16u);
        id v58 = v11;
        id v59 = *a4;
        goto LABEL_56;
      }
    }
    int v37 = 0;
    int v36 = 1;
LABEL_68:

    goto LABEL_69;
  }
  char v72 = (char)v12;
  unint64_t sizeBeforeEncoding = self->_sizeBeforeEncoding;
  if (!sizeBeforeEncoding)
  {
    BOOL v15 = [v7 persona];
    unint64_t v16 = +[MBTemporaryDirectory userTemporaryDirectoryForPersona:v15 identifiedBy:@"MBCKFile-SQLite"];
    unint64_t v17 = (void *)self->_sizeBeforeEncoding;
    self->_unint64_t sizeBeforeEncoding = v16;

    unint64_t sizeBeforeEncoding = self->_sizeBeforeEncoding;
  }
  unsigned int v18 = [(MBCKFile *)self _createTemporarySQLiteCopyWithEngine:v7 temporaryDirectory:sizeBeforeEncoding error:a4];
  if (v18 == 2)
  {
    LOBYTE(self->_restoreState) |= 4u;
    LODWORD(v12) = [(MBCKFile *)self userID];
    BOOL v19 = v12 == MBMobileUID();
    LOBYTE(v12) = v72;
    if (!v19) {
      goto LABEL_48;
    }
    if (!*(void *)&self->_contentEncodingMethod) {
      __assert_rtn("-[MBCKFile prepareForUploadWithEngine:error:]", "MBCKFile.m", 841, "_temporaryPath");
    }
    id v20 = [v7 persona];
    uint64_t v65 = [v20 sqliteCopyDirectory];

    p_contentEncodingMethod = &self->_contentEncodingMethod;
    uint64_t v67 = *(void *)&self->_contentEncodingMethod;
    uint64_t v21 = [v7 serviceAccount];
    char v22 = [v7 device];
    id v75 = 0;
    unsigned __int8 v62 = [(MBCKFile *)self encodeWithFileAtPath:v67 encodingMethod:1 hasSnapshot:1 destinationDirectory:v65 account:v21 device:v22 error:&v75];
    id v68 = v75;

    rsrcTemporaryPath = self->_rsrcTemporaryPath;
    if (v62)
    {
      if (!rsrcTemporaryPath) {
        __assert_rtn("-[MBCKFile prepareForUploadWithEngine:error:]", "MBCKFile.m", 858, "_encodedAssetPath");
      }
      p_encryptionKey = (id *)&self->_contentEncodingMethod;
      sub_1000EE4B0(*(void **)p_contentEncodingMethod);
      id v25 = (void *)v65;
      uint64_t v26 = v68;
    }
    else
    {
      if (rsrcTemporaryPath) {
        __assert_rtn("-[MBCKFile prepareForUploadWithEngine:error:]", "MBCKFile.m", 845, "!_encodedAssetPath");
      }
      if (!*(void *)p_contentEncodingMethod) {
        __assert_rtn("-[MBCKFile prepareForUploadWithEngine:error:]", "MBCKFile.m", 846, "_temporaryPath");
      }
      NSUInteger v38 = MBGetDefaultLog();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v39 = *(void **)p_contentEncodingMethod;
        *(_DWORD *)stat buf = 138412802;
        id v77 = v39;
        __int16 v78 = 2112;
        id v79 = v11;
        __int16 v80 = 2112;
        v81[0] = v68;
        _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "Failed to compress the SQLite file at %@(%@): %@", buf, 0x20u);
        id v59 = v11;
        id v60 = v68;
        id v58 = *(id *)p_contentEncodingMethod;
        _MBLog();
      }

      v40 = [v7 serviceAccount];
      v41 = [v7 device];
      id v74 = 0;
      unsigned __int8 v63 = [(MBCKFile *)self refreshFromCopyWithAccount:v40 device:v41 error:&v74];
      id v70 = v74;

      if (v63)
      {
        id v25 = (void *)v65;
        uint64_t v26 = v70;
LABEL_46:

        LOBYTE(v12) = v72;
LABEL_47:

        goto LABEL_48;
      }
      v42 = MBGetDefaultLog();
      uint64_t v26 = v70;
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        v43 = *(void **)p_contentEncodingMethod;
        *(_DWORD *)stat buf = 138412546;
        id v77 = v43;
        __int16 v78 = 2112;
        id v79 = v70;
        _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_ERROR, "Failed to refresh file stats from temporary copy at %@: %@", buf, 0x16u);
        id v58 = *(id *)p_contentEncodingMethod;
        id v59 = v70;
        _MBLog();
      }

      sub_1000EE4B0(*(void **)p_contentEncodingMethod);
      v44 = *(void **)p_contentEncodingMethod;
      *(void *)p_contentEncodingMethod = 0;

      LOBYTE(self->_restoreState) &= ~4u;
      p_encryptionKey = (id *)&self->_encryptionKey;
      id v25 = (void *)v65;
    }
    v45 = p_encryptionKey;
    id v31 = *p_encryptionKey;
    id *v45 = 0;
LABEL_45:

    goto LABEL_46;
  }
  LODWORD(v12) = v18;
  __int16 v33 = MBGetDefaultLog();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
  {
    unsigned __int8 v34 = *(void **)&self->_contentEncodingMethod;
    id v35 = *a4;
    *(_DWORD *)stat buf = 138413058;
    id v77 = v11;
    __int16 v78 = 2112;
    id v79 = v34;
    __int16 v80 = 1024;
    LODWORD(v81[0]) = 0;
    WORD2(v81[0]) = 2112;
    *(void *)((char *)v81 + 6) = v35;
    _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "Failed to create copy of SQLite file %@ to %@: %d, %@", buf, 0x26u);
    id v60 = 0;
    id v61 = *a4;
    id v58 = v11;
    id v59 = *(id *)&self->_contentEncodingMethod;
    _MBLog();
  }

  LOBYTE(self->_restoreState) &= ~4u;
  BOOL v19 = v12 == 1;
  LOBYTE(v12) = v72;
  if (!v19) {
    goto LABEL_48;
  }
  int v36 = 0;
  int v37 = 1;
LABEL_69:
  __int16 v52 = objc_msgSend(v7, "device", v58, v59);
  v53 = [v52 hmacKey];
  v54 = [(MBCKFile *)self fileIDWithHmacKey:v53];
  manifest = self->_manifest;
  self->_manifest = v54;

  if (v36 && !*a4) {
    __assert_rtn("-[MBCKFile prepareForUploadWithEngine:error:]", "MBCKFile.m", 915, "result != MBPrepareForUploadResultFailure || *error != nil");
  }

  return v37;
}

- (void)cleanupAfterUpload
{
  sub_1000EE4B0(self->_rsrcTemporaryPath);
  LOBYTE(self->_sqliteTemporaryDirectory) = -1;
  [(MBCKFile *)self _removeTemporaryCopy];
  [(MBCKFile *)self _removeResourceCopy];
  [self->_sizeBeforeEncoding dispose];
  unint64_t sizeBeforeEncoding = (void *)self->_sizeBeforeEncoding;
  self->_unint64_t sizeBeforeEncoding = 0;
}

- (BOOL)isSQLiteFile
{
  v2 = self;
  objc_sync_enter(v2);
  if (((uint64_t)v2->_restoreState & 2) != 0)
  {
    char v5 = (uint64_t)v2->_restoreState & 1;
  }
  else
  {
    char v8 = 0;
    id v3 = [(MBCKFile *)v2 absolutePath];
    unsigned int v4 = +[MBSQLiteFileHandle isSQLiteFileAtPath:v3 result:&v8 error:0];

    char v5 = v8;
    if (!v4) {
      char v5 = 0;
    }
    LOBYTE(v2->_restoreState) = v5 | (uint64_t)v2->_restoreState & 0xFC | 2;
  }
  BOOL v6 = v5 != 0;
  objc_sync_exit(v2);

  return v6;
}

- (BOOL)hadTemporarySQLiteArchive
{
  return (LOBYTE(self->_restoreState) >> 2) & 1;
}

- (id)_compactSQLiteDatabaseAtPath:(id)a3 temporaryDirectory:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  if (!v7) {
    __assert_rtn("-[MBCKFile _compactSQLiteDatabaseAtPath:temporaryDirectory:error:]", "MBCKFile.m", 963, "path");
  }
  id v9 = v8;
  if (!v8) {
    __assert_rtn("-[MBCKFile _compactSQLiteDatabaseAtPath:temporaryDirectory:error:]", "MBCKFile.m", 964, "temporaryDirectory");
  }
  if (!a5) {
    __assert_rtn("-[MBCKFile _compactSQLiteDatabaseAtPath:temporaryDirectory:error:]", "MBCKFile.m", 965, "error");
  }
  uint64_t v10 = [v8 makeTemporaryFilePath];
  uint64_t v11 = objc_opt_class();
  objc_sync_enter(v11);
  unsigned __int8 v12 = +[MBSQLiteFileHandle compactSQLiteDatabaseAtPath:v7 toPath:v10 error:a5];
  objc_sync_exit(v11);

  if (v12) {
    goto LABEL_7;
  }
  id v13 = [v9 makeTemporaryFilePath];

  uint64_t v14 = objc_opt_class();
  objc_sync_enter(v14);
  unsigned int v15 = +[MBSQLiteFileHandle copySQLiteFileAtPath:v7 toPath:v13 error:a5];
  objc_sync_exit(v14);

  if (v15)
  {
    uint64_t v10 = v13;
LABEL_7:
    id v13 = v10;
    unint64_t v16 = v13;
    goto LABEL_9;
  }
  unint64_t v16 = 0;
LABEL_9:

  return v16;
}

- (id)_copySQLiteDatabaseAtPath:(id)a3 temporaryDirectory:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  if (!v7) {
    __assert_rtn("-[MBCKFile _copySQLiteDatabaseAtPath:temporaryDirectory:error:]", "MBCKFile.m", 988, "path");
  }
  id v9 = v8;
  if (!v8) {
    __assert_rtn("-[MBCKFile _copySQLiteDatabaseAtPath:temporaryDirectory:error:]", "MBCKFile.m", 989, "temporaryDirectory");
  }
  if (!a5) {
    __assert_rtn("-[MBCKFile _copySQLiteDatabaseAtPath:temporaryDirectory:error:]", "MBCKFile.m", 990, "error");
  }
  uint64_t v10 = [v8 makeTemporaryFilePath];
  uint64_t v11 = objc_opt_class();
  objc_sync_enter(v11);
  unsigned __int8 v12 = +[MBSQLiteFileHandle copySQLiteFileAtPath:v7 toPath:v10 error:a5];
  objc_sync_exit(v11);

  if (v12) {
    id v13 = v10;
  }
  else {
    id v13 = 0;
  }

  return v13;
}

- (id)_scrubSQLiteDatabaseWithEngine:(id)a3 temporaryDirectory:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v31 = a4;
  unsigned int v27 = v7;
  uint64_t v28 = [v7 serviceAccount];
  if (!v28) {
    __assert_rtn("-[MBCKFile _scrubSQLiteDatabaseWithEngine:temporaryDirectory:error:]", "MBCKFile.m", 1012, "account");
  }
  objc_super v30 = [(MBCKFile *)self absolutePath];
  char v32 = [(MBCKFile *)self relativePath];
  id v8 = [(MBCKFile *)self _copySQLiteDatabaseAtPath:v30 temporaryDirectory:v31 error:a5];
  if (!v8)
  {
    unint64_t v17 = MBGetDefaultLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      id v22 = *a5;
      *(_DWORD *)stat buf = 138412546;
      id v38 = v30;
      __int16 v39 = 2112;
      id v40 = v22;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Failed to copy SQLite database at %@: %@", buf, 0x16u);
      _MBLog();
    }
LABEL_20:
    id v21 = 0;
    goto LABEL_25;
  }
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v9 = [v7 settingsContext];
  uint64_t v10 = [v9 plugins];

  id v11 = [v10 countByEnumeratingWithState:&v33 objects:v43 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v34;
LABEL_5:
    uint64_t v13 = 0;
    while (1)
    {
      if (*(void *)v34 != v12) {
        objc_enumerationMutation(v10);
      }
      uint64_t v14 = *(void **)(*((void *)&v33 + 1) + 8 * v13);
      if (objc_opt_respondsToSelector())
      {
        unint64_t v16 = [(MBCKFile *)self domain];
        unint64_t v17 = [v14 scrubSQLiteFileCopyAtRelativePath:v32 copyTemporaryPath:v8 domain:v16];

        if (v17) {
          break;
        }
      }
      if (v11 == (id)++v13)
      {
        id v11 = [v10 countByEnumeratingWithState:&v33 objects:v43 count:16];
        if (v11) {
          goto LABEL_5;
        }
        goto LABEL_12;
      }
    }

    BOOL v23 = MBGetDefaultLog();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)stat buf = 138412802;
      id v38 = v8;
      __int16 v39 = 2112;
      id v40 = v32;
      __int16 v41 = 2112;
      v42 = v17;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "Failed to scrub SQLite database at %@ (%@): %@", buf, 0x20u);
      _MBLog();
    }

    +[MBSQLiteFileHandle removeAllSQLiteFilesAtPath:v8];
    if (a5)
    {
      unint64_t v17 = v17;
      id v21 = 0;
      *a5 = v17;
      goto LABEL_25;
    }
    goto LABEL_20;
  }
LABEL_12:

  unsigned int v18 = [v31 makeTemporaryFilePath];
  BOOL v19 = objc_opt_class();
  objc_sync_enter(v19);
  unsigned __int8 v20 = +[MBSQLiteFileHandle compactSQLiteDatabaseAtPath:v8 toPath:v18 error:a5];
  objc_sync_exit(v19);

  +[MBSQLiteFileHandle removeAllSQLiteFilesAtPath:v8];
  if (v20)
  {
    id v21 = v18;
  }
  else
  {
    id v24 = MBGetDefaultLog();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      id v25 = *a5;
      *(_DWORD *)stat buf = 138412802;
      id v38 = v8;
      __int16 v39 = 2112;
      id v40 = v32;
      __int16 v41 = 2112;
      v42 = v25;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "Failed to compact SQLite database at %@ (%@): %@", buf, 0x20u);
      _MBLog();
    }

    id v21 = 0;
  }

  unint64_t v17 = 0;
LABEL_25:

  return v21;
}

- (int)_createTemporarySQLiteCopyWithEngine:(id)a3 temporaryDirectory:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (!a5) {
    __assert_rtn("-[MBCKFile _createTemporarySQLiteCopyWithEngine:temporaryDirectory:error:]", "MBCKFile.m", 1054, "error");
  }
  uint64_t v10 = v9;
  if (!v9) {
    __assert_rtn("-[MBCKFile _createTemporarySQLiteCopyWithEngine:temporaryDirectory:error:]", "MBCKFile.m", 1055, "temporaryDirectory");
  }
  id v64 = [(MBCKFile *)self relativePath];
  unsigned __int8 v63 = [(MBCKFile *)self absolutePath];
  if ([(MBCKFile *)self isProtected]) {
    int v11 = BYTE6(self->_mbNode.cloneID);
  }
  else {
    int v11 = 4;
  }
  p_contentEncodingMethod = &self->_contentEncodingMethod;
  id v13 = *(id *)&self->_contentEncodingMethod;
  if (v13)
  {
    uint64_t v14 = +[NSFileManager defaultManager];
    unsigned __int8 v15 = [v14 fileExistsAtPath:v13];

    if (v15) {
      goto LABEL_8;
    }
  }

  unsigned int v18 = *(void **)p_contentEncodingMethod;
  *(void *)p_contentEncodingMethod = 0;

  int64_t v73 = 0;
  if (+[MBSQLiteFileHandle lastModifiedForSQLiteFileAtPath:v63 time:&v73 error:a5])
  {
    unsigned int v58 = v11;
    unsigned __int8 v62 = a5;
    id v60 = v10;
    self->_mbNode.modified = v73;
    self->_encryptedSize = [(MBCKFile *)self size];
    long long v69 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    id v61 = v8;
    BOOL v19 = [v8 settingsContext];
    unsigned __int8 v20 = [v19 plugins];

    id v21 = [v20 countByEnumeratingWithState:&v69 objects:v81 count:16];
    if (v21)
    {
      id v22 = v21;
      uint64_t v23 = *(void *)v70;
LABEL_12:
      uint64_t v24 = 0;
      while (1)
      {
        if (*(void *)v70 != v23) {
          objc_enumerationMutation(v20);
        }
        id v25 = *(void **)(*((void *)&v69 + 1) + 8 * v24);
        if (objc_opt_respondsToSelector())
        {
          unsigned int v27 = [(MBCKFile *)self domain];
          unsigned int v28 = [v25 shouldScrubSQLiteFileCopyAtRelativePath:v64 domain:v27];

          if (v28) {
            break;
          }
        }
        if (v22 == (id)++v24)
        {
          id v22 = [v20 countByEnumeratingWithState:&v69 objects:v81 count:16];
          if (v22) {
            goto LABEL_12;
          }
          goto LABEL_19;
        }
      }

      uint64_t v10 = v60;
      id v8 = v61;
      a5 = v62;
      id v13 = [(MBCKFile *)self _scrubSQLiteDatabaseWithEngine:v61 temporaryDirectory:v60 error:v62];
      objc_storeStrong((id *)&self->_contentEncodingMethod, v13);
      if (v13)
      {
        char v29 = 1;
        goto LABEL_23;
      }
      uint64_t v47 = MBGetDefaultLog();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      {
        id v48 = *v62;
        *(_DWORD *)stat buf = 138412546;
        id v76 = v63;
        __int16 v77 = 2112;
        id v78 = v48;
        _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_ERROR, "Failed to scrub SQLite database at %@: %@", buf, 0x16u);
        _MBLog();
      }

      [(MBCKFile *)self _removeTemporaryCopy];
      id v13 = 0;
      id v16 = 0;
      goto LABEL_44;
    }
LABEL_19:

    a5 = v62;
    uint64_t v10 = v60;
    id v13 = [(MBCKFile *)self _compactSQLiteDatabaseAtPath:v63 temporaryDirectory:v60 error:v62];
    objc_storeStrong((id *)&self->_contentEncodingMethod, v13);
    if (v13)
    {
      char v29 = 0;
      id v8 = v61;
LABEL_23:
      if (!+[MBProtectionClassUtils setWithPath:v13 value:v58 error:a5])
      {
        v45 = MBGetDefaultLog();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
        {
          id v46 = *a5;
          *(_DWORD *)stat buf = 138412802;
          id v76 = v13;
          __int16 v77 = 2112;
          id v78 = v64;
          __int16 v79 = 2112;
          id v80 = v46;
          _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_ERROR, "Failed to set protection class on SQLite database copy at %@ (%@): %@", buf, 0x20u);
          _MBLog();
        }

        [(MBCKFile *)self _removeTemporaryCopy];
        id v16 = 0;
        if ((v29 & 1) == 0) {
          goto LABEL_51;
        }
        goto LABEL_44;
      }
      char v59 = v29;
      long long v67 = 0u;
      long long v68 = 0u;
      long long v65 = 0u;
      long long v66 = 0u;
      objc_super v30 = [v8 settingsContext];
      id v31 = [v30 plugins];

      id v32 = [v31 countByEnumeratingWithState:&v65 objects:v74 count:16];
      if (v32)
      {
        id v33 = v32;
        uint64_t v34 = *(void *)v66;
LABEL_26:
        uint64_t v35 = 0;
        while (1)
        {
          if (*(void *)v66 != v34) {
            objc_enumerationMutation(v31);
          }
          long long v36 = *(void **)(*((void *)&v65 + 1) + 8 * v35);
          if (objc_opt_respondsToSelector())
          {
            uint64_t v38 = [v36 backingUpSQLiteFileCopyAtPath:v63 temporaryPath:v13];
            if (v38) {
              break;
            }
          }
          if (v33 == (id)++v35)
          {
            id v33 = [v31 countByEnumeratingWithState:&v65 objects:v74 count:16];
            if (v33) {
              goto LABEL_26;
            }
            goto LABEL_33;
          }
        }
        id v49 = (void *)v38;

        id v16 = v49;
        a5 = v62;
        *unsigned __int8 v62 = v16;
        [(MBCKFile *)self _removeTemporaryCopy];
        if (v29)
        {
          int v17 = 1;
          uint64_t v10 = v60;
          id v8 = v61;
          goto LABEL_53;
        }
        uint64_t v10 = v60;
        id v8 = v61;
        goto LABEL_51;
      }
LABEL_33:

      id v8 = v61;
      __int16 v39 = [v61 serviceAccount];
      id v40 = [v61 device];
      a5 = v62;
      unsigned __int8 v41 = [(MBCKFile *)self refreshFromCopyWithAccount:v39 device:v40 error:v62];

      if (v41)
      {
        uint64_t v10 = v60;
        if (!MBIsInternalInstall())
        {
LABEL_8:
          id v16 = 0;
          int v17 = 2;
          goto LABEL_53;
        }
        v42 = +[MBDigest sha256];
        v43 = [v42 digestForFileAtPath:v13 error:v62];

        if (v43)
        {
          encryptionKey = self->_encryptionKey;
          self->_encryptionKey = v43;

          goto LABEL_8;
        }
        v53 = MBGetDefaultLog();
        if (!os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
        {
LABEL_58:

          [(MBCKFile *)self _removeTemporaryCopy];
          id v16 = 0;
          if ((v59 & 1) == 0) {
            goto LABEL_51;
          }
LABEL_44:
          int v17 = 1;
          goto LABEL_53;
        }
        id v55 = *v62;
        *(_DWORD *)stat buf = 138412802;
        id v76 = v13;
        __int16 v77 = 2112;
        id v78 = v64;
        __int16 v79 = 2112;
        id v80 = v55;
        _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_ERROR, "Failed to compute the sha256 digest for the SQLite database copy at %@ (%@): %@", buf, 0x20u);
      }
      else
      {
        v53 = MBGetDefaultLog();
        uint64_t v10 = v60;
        if (!os_log_type_enabled(v53, OS_LOG_TYPE_ERROR)) {
          goto LABEL_58;
        }
        id v54 = *v62;
        *(_DWORD *)stat buf = 138412802;
        id v76 = v13;
        __int16 v77 = 2112;
        id v78 = v64;
        __int16 v79 = 2112;
        id v80 = v54;
        _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_ERROR, "Failed to refresh file stats for SQLite database copy at %@ (%@): %@", buf, 0x20u);
      }
      _MBLog();
      goto LABEL_58;
    }
    v50 = MBGetDefaultLog();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
    {
      id v51 = *v62;
      *(_DWORD *)stat buf = 138412546;
      id v76 = v63;
      __int16 v77 = 2112;
      id v78 = v51;
      _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_ERROR, "Failed to compact SQLite database at %@: %@", buf, 0x16u);
      v56 = v63;
      id v57 = *v62;
      _MBLog();
    }

    id v8 = v61;
  }
  [(MBCKFile *)self _removeTemporaryCopy];
  id v16 = 0;
  id v13 = 0;
LABEL_51:
  if (!*a5) {
    __assert_rtn("-[MBCKFile _createTemporarySQLiteCopyWithEngine:temporaryDirectory:error:]", "MBCKFile.m", 1140, "result != MBPrepareForUploadResultFailure || *error");
  }
  int v17 = 0;
LABEL_53:

  return v17;
}

- (void)_removeTemporaryCopy
{
  v2 = *(void **)&self->_contentEncodingMethod;
  if (v2)
  {
    *(void *)&self->_contentEncodingMethod = 0;
    id v3 = v2;

    sub_1000EE4B0(v3);
  }
}

- (BOOL)_createResourceCopyWithError:(id *)a3
{
  if (!self->_temporaryPath) {
    goto LABEL_4;
  }
  char v5 = +[NSFileManager defaultManager];
  unsigned int v6 = [v5 fileExistsAtPath:self->_temporaryPath];

  if (!v6
    || (+[NSFileManager defaultManager],
        id v7 = objc_claimAutoreleasedReturnValue(),
        unsigned int v8 = [v7 removeItemAtPath:self->_temporaryPath error:a3],
        v7,
        v8))
  {
LABEL_4:
    if ([(MBCKFile *)self hasAbsolutePath])
    {
      MBTemporaryPath();
      id v9 = (NSString *)objc_claimAutoreleasedReturnValue();
      temporaryPath = self->_temporaryPath;
      self->_temporaryPath = v9;

      int v11 = MBGetDefaultLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v12 = [(MBCKFile *)self absolutePath];
        id v13 = self->_temporaryPath;
        buf.st_dev = 138412546;
        *(void *)&buf.st_mode = v12;
        WORD2(buf.st_ino) = 2112;
        *(__darwin_ino64_t *)((char *)&buf.st_ino + 6) = (__darwin_ino64_t)v13;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "Creating a copy of xattrs for %@ (%@)", (uint8_t *)&buf, 0x16u);

        long long v36 = [(MBCKFile *)self absolutePath];
        _MBLog();
      }
      id v14 = [(MBCKFile *)self absolutePath];
      id v38 = 0;
      unsigned __int8 v15 = +[MBExtendedAttributes attributesForPathFSR:error:](MBExtendedAttributes, "attributesForPathFSR:error:", [v14 fileSystemRepresentation], &v38);
      id v16 = v38;

      if (v15)
      {
        int v17 = +[NSURL fileURLWithPath:self->_temporaryPath isDirectory:0];
        int v37 = v16;
        unsigned __int8 v18 = [v15 writeToURL:v17 error:&v37];
        BOOL v19 = v37;

        if (v18)
        {
          memset(&buf, 0, sizeof(buf));
          int v20 = lstat([(NSString *)self->_temporaryPath fileSystemRepresentation], &buf);
          BOOL v21 = v20 == 0;
          if (v20)
          {
            uint64_t v22 = *__error();
            uint64_t v23 = MBGetDefaultLog();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            {
              uint64_t v24 = self->_temporaryPath;
              *(_DWORD *)__int16 v39 = 138412546;
              id v40 = v24;
              __int16 v41 = 1024;
              LODWORD(v42) = v22;
              _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "Failed to lstat %@: %{errno}d", v39, 0x12u);
              _MBLog();
            }

            if (a3)
            {
              *a3 = +[MBError errorWithCode:100, self->_temporaryPath, @"Failed to stat xattrs copy: %d (%s)", v22, strerror(v22) path format];
            }
            id v25 = self->_temporaryPath;
            self->_temporaryPath = 0;
          }
          else
          {
            self->_signature = (NSData *)buf.st_size;
            id v25 = MBGetDefaultLog();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
            {
              id v32 = (NSString *)[v15 count];
              signature = self->_signature;
              unint64_t volumeType = self->_volumeType;
              *(_DWORD *)__int16 v39 = 134218498;
              id v40 = v32;
              __int16 v41 = 2048;
              v42 = signature;
              __int16 v43 = 2112;
              unint64_t v44 = volumeType;
              _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "Found %lu xattrs (%llu) for %@", v39, 0x20u);
              [v15 count];
              _MBLog();
            }
          }
        }
        else
        {
          char v29 = self->_temporaryPath;
          self->_temporaryPath = 0;

          objc_super v30 = MBGetDefaultLog();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          {
            buf.st_dev = 138412546;
            *(void *)&buf.st_mode = self;
            WORD2(buf.st_ino) = 2112;
            *(__darwin_ino64_t *)((char *)&buf.st_ino + 6) = (__darwin_ino64_t)v19;
            _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "Failed to serialize xattrs to disk for %@: %@", (uint8_t *)&buf, 0x16u);
            _MBLog();
          }

          if (a3)
          {
            id v31 = [(MBCKFile *)self absolutePath];
            *a3 = +[MBError errorWithCode:100 error:v19 path:v31 format:@"Failed to serialize xattrs to disk"];
          }
          BOOL v21 = 0;
        }
      }
      else
      {
        unsigned int v28 = MBGetDefaultLog();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          buf.st_dev = 138412546;
          *(void *)&buf.st_mode = self;
          WORD2(buf.st_ino) = 2112;
          *(__darwin_ino64_t *)((char *)&buf.st_ino + 6) = (__darwin_ino64_t)v16;
          _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "Failed to read xattrs for %@: %@", (uint8_t *)&buf, 0x16u);
          _MBLog();
        }

        if (a3)
        {
          BOOL v19 = v16;
          unsigned __int8 v15 = 0;
          BOOL v21 = 0;
          *a3 = v19;
        }
        else
        {
          unsigned __int8 v15 = 0;
          BOOL v21 = 0;
          BOOL v19 = v16;
        }
      }
    }
    else
    {
      BOOL v19 = MBGetDefaultLog();
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        BOOL v21 = 0;
LABEL_34:

        return v21;
      }
      uint64_t v26 = [(MBDomain *)self->_domain domainName];
      unint64_t v27 = self->_volumeType;
      buf.st_dev = 138412546;
      *(void *)&buf.st_mode = v26;
      WORD2(buf.st_ino) = 2112;
      *(__darwin_ino64_t *)((char *)&buf.st_ino + 6) = v27;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Can't make a copy of xattrs without an absolute path (%@:%@)", (uint8_t *)&buf, 0x16u);

      unsigned __int8 v15 = [(MBDomain *)self->_domain domainName];
      _MBLog();
      BOOL v21 = 0;
    }

    goto LABEL_34;
  }
  return 0;
}

- (void)_removeResourceCopy
{
  temporaryPath = self->_temporaryPath;
  if (temporaryPath)
  {
    self->_temporaryPath = 0;
    id v3 = temporaryPath;

    sub_1000EE4B0(v3);
  }
}

- (id)restoreState
{
  encodedAssetPath = self->_encodedAssetPath;
  if (!encodedAssetPath)
  {
    unsigned int v4 = (NSString *)objc_opt_new();
    char v5 = self->_encodedAssetPath;
    self->_encodedAssetPath = v4;

    encodedAssetPath = self->_encodedAssetPath;
  }
  return encodedAssetPath;
}

- (void)downloadContentsWithOperationTracker:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6) {
    __assert_rtn("-[MBCKFile downloadContentsWithOperationTracker:completion:]", "MBCKFile.m", 1216, "tracker");
  }
  unsigned int v8 = (void (**)(void, void))v7;
  if (([(MBCKFile *)self isRegularFile]
     || [(MBCKFile *)self resourcesSize]
     || (self->_mbNode.flags & 0x80) == 0)
    && ![(MBCKFile *)self downloaded])
  {
    id v9 = [(MBCKModel *)self cache];
    uint64_t v10 = [(MBCKFile *)self signature];
    int v11 = objc_msgSend(v9, "fileAssetMetadataForSignature:volumeType:", v10, -[MBCKFile volumeType](self, "volumeType"));

    if (v11 && ![(MBCKFile *)self resourcesSize])
    {
      id v15 = [(MBCKFile *)self restoreState];
      unsigned int v28 = [v11 stashedAssetPath];
      [v15 setStashedAssetPath:v28];

      if ([v15 stashedAssetDecrypted]) {
        uint64_t v29 = 1;
      }
      else {
        uint64_t v29 = (uint64_t)[v11 stashedAssetIsDecrypted];
      }
      [v15 setStashedAssetDecrypted:v29];
      objc_super v30 = [v11 decodedAssetPath];
      [v15 setDecodedAssetPath:v30];

      LOBYTE(self->_restoreState) |= 0x20u;
      id v31 = MBGetDefaultLog();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)stat buf = 138412290;
        __int16 v39 = self;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Mark file as already downloaded because a file of the same signature has already been downloaded: %@", buf, 0xCu);
        _MBLog();
      }

      v8[2](v8, 0);
    }
    else
    {
      id v32 = v11;
      id v12 = objc_alloc((Class)CKRecordID);
      id v13 = [(MBCKModel *)self recordIDString];
      id v14 = +[MBCKDatabaseManager zoneIDOfType:[(MBCKFile *)self recordZone]];
      id v15 = [v12 initWithRecordName:v13 zoneID:v14];

      id v16 = +[NSPredicate predicateWithFormat:@"recordID = %@", v15];
      id v17 = objc_alloc((Class)CKQuery);
      unsigned __int8 v18 = +[MBCKModel privilegedQueryType];
      id v19 = [v17 initWithRecordType:v18 predicate:v16];

      id v20 = [objc_alloc((Class)CKQueryOperation) initWithQuery:v19];
      BOOL v21 = [v6 defaultZoneID];
      [v20 setZoneID:v21];

      uint64_t v22 = [v6 engines];
      uint64_t v23 = [v22 firstObject];

      if (!v23
        || ([v23 persona],
            uint64_t v24 = objc_claimAutoreleasedReturnValue(),
            unsigned int v25 = [v24 shouldRestoreFilesSparse],
            v24,
            v25))
      {
        uint64_t v26 = objc_opt_new();
        [v26 setSparseAware:&__kCFBooleanTrue];
        CFStringRef v36 = @"contents";
        int v37 = v26;
        unint64_t v27 = +[NSDictionary dictionaryWithObjects:&v37 forKeys:&v36 count:1];
        [v20 setAssetTransferOptionsByKey:v27];
      }
      v35[0] = _NSConcreteStackBlock;
      v35[1] = 3221225472;
      v35[2] = sub_1000F04A0;
      v35[3] = &unk_1004132B0;
      v35[4] = self;
      [v20 setRecordFetchedBlock:v35];
      v33[0] = _NSConcreteStackBlock;
      v33[1] = 3221225472;
      v33[2] = sub_1000F04B4;
      v33[3] = &unk_1004132D8;
      uint64_t v34 = v8;
      [v20 setQueryCompletionBlock:v33];
      [v6 addDatabaseOperation:v20];

      int v11 = v32;
    }
  }
  else
  {
    v8[2](v8, 0);
  }
}

- (BOOL)stashAssetsToTemporaryDirectoryWithAccount:(id)a3 operationTracker:(id)a4 cache:(id)a5 device:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  if (!a7) {
    __assert_rtn("-[MBCKFile stashAssetsToTemporaryDirectoryWithAccount:operationTracker:cache:device:error:]", "MBCKFile.m", 1260, "error");
  }
  if (!v14) {
    __assert_rtn("-[MBCKFile stashAssetsToTemporaryDirectoryWithAccount:operationTracker:cache:device:error:]", "MBCKFile.m", 1261, "cache");
  }
  id v16 = v15;
  if (!v15) {
    __assert_rtn("-[MBCKFile stashAssetsToTemporaryDirectoryWithAccount:operationTracker:cache:device:error:]", "MBCKFile.m", 1262, "device");
  }
  id v17 = &selRef_inviteAllowed;
  if ([(MBCKFile *)self isRegularFile] && [(MBCKFile *)self size] || self->_contentAsset)
  {
    v128 = a7;
    unsigned __int8 v18 = [(MBCKFile *)self relativePath];
    id v19 = MBGetDefaultLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)stat buf = 138412802;
      *(void *)id v132 = v18;
      *(_WORD *)&v132[8] = 2048;
      *(void *)&v132[10] = [(MBCKFile *)self size];
      *(_WORD *)&v132[18] = 2048;
      *(void *)&v132[20] = [(MBCKFile *)self resourcesSize];
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "Stashing assets for file, relativePath:%@, size:%llu, resourceSize:%llu", buf, 0x20u);
      v108 = [(MBCKFile *)self size];
      unint64_t v111 = [(MBCKFile *)self resourcesSize];
      v106 = v18;
      _MBLog();
    }

    id v20 = [(MBCKFile *)self restoreState];
    if (![(MBCKFile *)self isRegularFile]) {
      goto LABEL_39;
    }
    if (![(MBCKFile *)self size]) {
      goto LABEL_39;
    }
    uint64_t v21 = [v20 stashedAssetPath];
    if (v21)
    {
      uint64_t v22 = (void *)v21;
      +[NSFileManager defaultManager];
      uint64_t v23 = logc = v12;
      [v20 stashedAssetPath];
      id v24 = v13;
      unsigned int v25 = v20;
      uint64_t v26 = v16;
      unint64_t v27 = v14;
      v29 = unsigned int v28 = v18;
      unsigned __int8 v30 = [v23 fileExistsAtPath:v29];

      unsigned __int8 v18 = v28;
      id v14 = v27;
      id v16 = v26;
      id v20 = v25;
      id v13 = v24;
      id v17 = &selRef_inviteAllowed;

      id v12 = logc;
      if (v30) {
        goto LABEL_39;
      }
    }
    id v31 = (MBCKFile *)self->_changeType;
    if (!v31)
    {
      if (MBIsInternalInstall())
      {
        uint64_t v89 = MBGetDefaultLog();
        if (os_log_type_enabled(v89, OS_LOG_TYPE_FAULT))
        {
          unint64_t v90 = [(MBCKFile *)self size];
          *(_DWORD *)stat buf = 138412546;
          *(void *)id v132 = self;
          *(_WORD *)&v132[8] = 2048;
          *(void *)&v132[10] = v90;
          _os_log_impl((void *)&_mh_execute_header, v89, OS_LOG_TYPE_FAULT, "Nil content asset for file %@ with size:%llu", buf, 0x16u);
          v106 = self;
          v108 = [(MBCKFile *)self size];
          _MBLog();
        }
      }
      +[MBError errorWithCode:100, v18, @"Nil content asset for file with size:%llu", [(MBCKFile *)self size] path format];
      BOOL v79 = 0;
      id *v128 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_51;
    }
    id v32 = v31;
    id v33 = [(MBCKFile *)v31 fileURL];
    if (v33)
    {
      id v119 = v32;
      v121 = v20;
      v120 = v33;
      unsigned int v115 = [(MBCKFile *)self stashedAssetIsDecrypted];
      if (v115) {
        goto LABEL_18;
      }
      os_log_t log = v14;
      uint64_t v34 = v18;
      uint64_t v35 = v12;
      CFStringRef v36 = [v33 path];
      id v130 = 0;
      unsigned __int8 v37 = [(MBCKFile *)self _decryptWithOperationTracker:v13 destination:v36 device:v16 error:&v130];
      id v38 = v130;

      if (v37)
      {

        id v12 = v35;
        unsigned __int8 v18 = v34;
        id v14 = log;
LABEL_18:
        if (BYTE6(self->_mbNode.cloneID) == 4)
        {
          __int16 v39 = v16;
          id v40 = v14;
          __int16 v41 = v18;
          v42 = v33;
          __int16 v43 = v12;
          unint64_t v44 = [v42 path];
          uint64_t v45 = BYTE6(self->_mbNode.cloneID);
          id v129 = 0;
          unsigned __int8 v46 = +[MBProtectionClassUtils setWithPath:v44 value:v45 error:&v129];
          id v47 = v129;

          if ((v46 & 1) == 0)
          {
            id v48 = MBGetDefaultLog();
            if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
            {
              int v49 = BYTE6(self->_mbNode.cloneID);
              [v120 path];
              v50 = logd = v48;
              *(_DWORD *)stat buf = 67109634;
              *(_DWORD *)id v132 = v49;
              *(_WORD *)&v132[4] = 2112;
              *(void *)&v132[6] = v50;
              *(_WORD *)&v132[14] = 2112;
              *(void *)&v132[16] = v47;
              _os_log_impl((void *)&_mh_execute_header, logd, OS_LOG_TYPE_ERROR, "Failed to set protection class %d at path %@: %@", buf, 0x1Cu);

              id v51 = (MBCKFile *)BYTE6(self->_mbNode.cloneID);
              v108 = [v120 path];
              unint64_t v111 = (unint64_t)v47;
              v106 = v51;
              _MBLog();

              id v48 = logd;
            }
          }
          id v12 = v43;
          unsigned __int8 v18 = v41;
          id v14 = v40;
          id v16 = v39;
          id v33 = v120;
        }
        NSUInteger v114 = v18;
        __int16 v52 = [(MBCKFile *)self signature];
        v53 = objc_msgSend(v52, "mb_base64EncodedFileSystemPathString");

        if (!v53) {
          __assert_rtn("-[MBCKFile stashAssetsToTemporaryDirectoryWithAccount:operationTracker:cache:device:error:]", "MBCKFile.m", 1313, "signature");
        }
        id v54 = [v33 path];
        os_log_t loga = v12;
        id v55 = [v12 persona];
        v56 = [(MBCKFile *)self domain];
        uint64_t v57 = [v55 restorePrefetchDirectoryForDomain:v56];

        NSUInteger v116 = (void *)v57;
        unsigned int v58 = +[MBFileOperation createPathInDirectory:v57 fileName:v53];
        id v117 = v54;
        char v59 = (const char *)[v117 fileSystemRepresentation];
        id v60 = v58;
        id v61 = (const char *)[v60 fileSystemRepresentation];
        NSUInteger v118 = v60;
        v113 = v53;
        if (!renamex_np(v59, v61, 4u)) {
          goto LABEL_35;
        }
        int v62 = *__error();
        if (v62 == 17) {
          goto LABEL_35;
        }
        if (v62 == 18)
        {
          unsigned __int8 v63 = MBGetDefaultLog();
          if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
          {
            [v117 lastPathComponent];
            id v64 = v112 = v63;
            *(_DWORD *)stat buf = 138412546;
            *(void *)id v132 = v64;
            *(_WORD *)&v132[8] = 2112;
            *(void *)&v132[10] = v60;
            _os_log_impl((void *)&_mh_execute_header, v112, OS_LOG_TYPE_INFO, "Could not move stashed resource (%@) across volumes, copying to %@", buf, 0x16u);

            v107 = [v117 lastPathComponent];
            id v109 = v60;
            _MBLog();

            unsigned __int8 v63 = v112;
          }

          if (+[MBFileOperation crossVolumeMoveFrom:v117 intoDir:v116 toFileNamed:v53 error:v128])
          {
            goto LABEL_35;
          }
          unsigned int v65 = +[MBError errnoForError:*v128];
          long long v66 = MBGetDefaultLog();
          long long v67 = v66;
          if (v65 == 17)
          {
            if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)stat buf = 138412546;
              *(void *)id v132 = v117;
              *(_WORD *)&v132[8] = 2112;
              *(void *)&v132[10] = v60;
              _os_log_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_INFO, "Cross-volume copied %@ to %@", buf, 0x16u);
              v107 = v117;
              id v109 = v60;
              _MBLog();
            }

LABEL_35:
            objc_msgSend(v121, "setStashedAssetPath:", v60, v107, v109);
            [v121 setStashedAssetDecrypted:v115 ^ 1];
            long long v68 = [(MBCKFile *)self signature];
            long long v69 = [v14 fileAssetMetadataForSignature:v68 volumeType:[(MBCKFile *)self volumeType]];

            if (!v69)
            {
              id v96 = [v121 stashedAssetPath];
              CFStringRef v97 = [(MBCKFile *)self signature];
              v98 = [v14 updateStashPath:v96 forSignature:v97 volumeType:[(MBCKFile *)self volumeType] isDecrypted:[(MBCKFile *)self stashedAssetIsDecrypted]];

              if (v98)
              {
                id v99 = v98;
                id *v128 = v99;

                id v20 = v121;
                id v12 = loga;
                v100 = v113;
                unsigned __int8 v18 = v114;
                v101 = v120;
                unsigned __int8 v102 = v117;
                v103 = v118;
LABEL_73:

                goto LABEL_74;
              }
            }
            long long v70 = MBGetDefaultLog();
            id v12 = loga;
            unsigned __int8 v18 = v114;
            if (os_log_type_enabled(v70, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)stat buf = 138412802;
              *(void *)id v132 = v114;
              *(_WORD *)&v132[8] = 2112;
              *(void *)&v132[10] = v117;
              *(_WORD *)&v132[18] = 2112;
              *(void *)&v132[20] = v118;
              _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_DEBUG, "Stashed downloaded file (%@) %@ at %@", buf, 0x20u);
              v108 = v117;
              unint64_t v111 = (unint64_t)v118;
              v106 = v114;
              _MBLog();
            }

            id v20 = v121;
            id v17 = &selRef_inviteAllowed;
LABEL_39:
            uint64_t v71 = *((int *)v17 + 563);
            if (*(Class *)((char *)&self->super.super.isa + v71))
            {
              id v122 = v13;
              os_log_t logb = v14;
              long long v72 = v18;
              int64_t v73 = v12;
              uint64_t v74 = [v20 stashedResourcePath];
              if (!v74) {
                goto LABEL_43;
              }
              id v75 = (void *)v74;
              id v76 = +[NSFileManager defaultManager];
              __int16 v77 = [v20 stashedResourcePath];
              unsigned __int8 v78 = [v76 fileExistsAtPath:v77];

              if (v78)
              {
                BOOL v79 = 1;
                id v12 = v73;
              }
              else
              {
LABEL_43:
                id v12 = v73;
                id v80 = [v73 persona];
                v81 = [*(id *)((char *)&self->super.super.isa + v71) fileURL];
                v82 = [(MBCKFile *)self domain];
                v83 = [v80 stashAsset:v81 forDomain:v82 error:v128];

                if (v83)
                {
                  [v20 setStashedResourcePath:v83];
                  v84 = MBGetDefaultLog();
                  if (os_log_type_enabled(v84, OS_LOG_TYPE_DEBUG))
                  {
                    unsigned __int8 v85 = [*(id *)((char *)&self->super.super.isa + v71) fileURL];
                    v86 = [v85 path];
                    *(_DWORD *)stat buf = 138412802;
                    *(void *)id v132 = v72;
                    *(_WORD *)&v132[8] = 2112;
                    *(void *)&v132[10] = v86;
                    *(_WORD *)&v132[18] = 2112;
                    *(void *)&v132[20] = v83;
                    _os_log_impl((void *)&_mh_execute_header, v84, OS_LOG_TYPE_DEBUG, "Stashed downloaded file resource (%@) %@ at %@", buf, 0x20u);

                    v87 = [*(id *)((char *)&self->super.super.isa + v71) fileURL];
                    v110 = [v87 path];
                    _MBLog();
                  }
                  BOOL v79 = 1;
                }
                else
                {
                  BOOL v79 = 0;
                }
              }
              unsigned __int8 v18 = v72;
              id v13 = v122;
              id v14 = logb;
            }
            else
            {
              BOOL v79 = 1;
            }
            goto LABEL_51;
          }
          unsigned __int8 v18 = v114;
          if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
          {
            id v105 = *v128;
            *(_DWORD *)stat buf = 138543874;
            *(void *)id v132 = v117;
            *(_WORD *)&v132[8] = 2082;
            *(void *)&v132[10] = v61;
            *(_WORD *)&v132[18] = 2112;
            *(void *)&v132[20] = v105;
            _os_log_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_ERROR, "rename of stashed resource from %{public}@ to %{public}s failed: %@", buf, 0x20u);
            _MBLog();
          }

          id v20 = v121;
          id v12 = loga;
          unsigned __int8 v102 = v117;
          v103 = v118;
        }
        else
        {
          BOOL v104 = MBGetDefaultLog();
          unsigned __int8 v18 = v114;
          if (os_log_type_enabled(v104, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)stat buf = 138412802;
            *(void *)id v132 = v117;
            *(_WORD *)&v132[8] = 2112;
            *(void *)&v132[10] = v118;
            *(_WORD *)&v132[18] = 1024;
            *(_DWORD *)&v132[20] = v62;
            _os_log_impl((void *)&_mh_execute_header, v104, OS_LOG_TYPE_ERROR, "rename of stashed resource from %@ to %@ failed: %{errno}d", buf, 0x1Cu);
            _MBLog();
          }

          v103 = v118;
          +[MBError posixErrorWithCode:v62, @"rename of stashed resource from %@ to %@ failed", v117, v118 format];
          id v12 = loga;
          id *v128 = (id)objc_claimAutoreleasedReturnValue();
          unsigned __int8 v102 = v117;
          id v20 = v121;
        }
        v101 = v120;
        v100 = v113;
        goto LABEL_73;
      }
      NSUInteger v94 = MBGetDefaultLog();
      if (os_log_type_enabled(v94, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)stat buf = 138412802;
        *(void *)id v132 = v120;
        *(_WORD *)&v132[8] = 2112;
        *(void *)&v132[10] = self;
        *(_WORD *)&v132[18] = 2112;
        *(void *)&v132[20] = v38;
        _os_log_impl((void *)&_mh_execute_header, v94, OS_LOG_TYPE_ERROR, "Failed to decrypt prefetched asset at %@ for %@: %@", buf, 0x20u);
        _MBLog();
      }

      id v95 = v38;
      id *v128 = v95;

      id v12 = v35;
      unsigned __int8 v18 = v34;
      id v14 = log;
      id v32 = v119;
      id v33 = v120;
    }
    else
    {
      if (MBIsInternalInstall())
      {
        int v91 = v12;
        v92 = MBGetDefaultLog();
        if (os_log_type_enabled(v92, OS_LOG_TYPE_FAULT))
        {
          unint64_t v93 = [(MBCKFile *)self size];
          *(_DWORD *)stat buf = 138412802;
          *(void *)id v132 = v32;
          *(_WORD *)&v132[8] = 2112;
          *(void *)&v132[10] = self;
          *(_WORD *)&v132[18] = 2048;
          *(void *)&v132[20] = v93;
          _os_log_impl((void *)&_mh_execute_header, v92, OS_LOG_TYPE_FAULT, "Nil fileURL for content asset %@ for file %@ with size:%llu", buf, 0x20u);
          v108 = self;
          unint64_t v111 = [(MBCKFile *)self size];
          v106 = v32;
          _MBLog();
        }

        id v12 = v91;
      }
      id *v128 = +[MBError errorWithCode:100, v18, @"Nil fileURL for content asset with size:%llu", [(MBCKFile *)self size] path format];
    }

LABEL_74:
    BOOL v79 = 0;
LABEL_51:

    goto LABEL_52;
  }
  BOOL v79 = 1;
LABEL_52:

  return v79;
}

- (BOOL)restoreAssetWithOperationTracker:(id)a3 destination:(id)a4 logger:(id)a5 cache:(id)a6 device:(id)a7 error:(id *)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  if (!v14) {
    __assert_rtn("-[MBCKFile restoreAssetWithOperationTracker:destination:logger:cache:device:error:]", "MBCKFile.m", 1368, "tracker");
  }
  if (!v17) {
    __assert_rtn("-[MBCKFile restoreAssetWithOperationTracker:destination:logger:cache:device:error:]", "MBCKFile.m", 1369, "cache");
  }
  id v19 = v18;
  if (!v18) {
    __assert_rtn("-[MBCKFile restoreAssetWithOperationTracker:destination:logger:cache:device:error:]", "MBCKFile.m", 1370, "device");
  }
  uint64_t v20 = [v14 account];
  if (!v20) {
    __assert_rtn("-[MBCKFile restoreAssetWithOperationTracker:destination:logger:cache:device:error:]", "MBCKFile.m", 1372, "serviceAccount");
  }
  uint64_t v21 = (void *)v20;
  v220 = a8;
  id v22 = v15;
  v221 = (char *)[v22 fileSystemRepresentation];
  uint64_t v23 = [(MBCKFile *)self relativePath];
  id v24 = [v23 length];

  if (!v24)
  {
LABEL_18:
    memset(&v232, 0, sizeof(v232));
    if (lstat(v221, &v232))
    {
      if (*__error() == 63)
      {
        id v38 = v19;
        __int16 v39 = MBGetDefaultLog();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          int v40 = *__error();
          *(_DWORD *)stat buf = 138412546;
          *(void *)v234 = v22;
          *(_WORD *)&v234[8] = 1024;
          *(_DWORD *)&v234[10] = v40;
          _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "Skipping restore asset, lstat failed at %@: %{errno}d", buf, 0x12u);
          unint64_t v185 = (unint64_t)v22;
          uint64_t v187 = *__error();
          _MBLog();
        }

        __int16 v41 = v220;
        if (v220)
        {
          CFStringRef v42 = @"lstat error";
          uint64_t v43 = 107;
LABEL_164:
          +[MBError posixErrorWithCode:path:format:](MBError, "posixErrorWithCode:path:format:", v43, v22, v42, v185, v187);
          BOOL v79 = 0;
          id *v41 = (id)objc_claimAutoreleasedReturnValue();
LABEL_166:
          id v19 = v38;
          goto LABEL_238;
        }
LABEL_165:
        BOOL v79 = 0;
        goto LABEL_166;
      }
      if (*__error() != 2)
      {
        if (v220)
        {
          id *v220 = +[MBError posixErrorWithCode:101 path:v22 format:@"lstat error"];
        }
        id v48 = MBGetDefaultLog();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
        {
          int v49 = *__error();
          *(_DWORD *)stat buf = 138412546;
          *(void *)v234 = v22;
          *(_WORD *)&v234[8] = 1024;
          *(_DWORD *)&v234[10] = v49;
          _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_ERROR, "lstat failed at %@: %{errno}d", buf, 0x12u);
          __error();
          _MBLog();
        }

        goto LABEL_236;
      }
      id v38 = v19;
      goto LABEL_43;
    }
    if ((v232.st_mode & 0xF000) == 0x4000)
    {
      id v38 = v19;
      char v44 = 1;
LABEL_44:
      if (![(MBCKFile *)self isRegularFile] || ![(MBCKFile *)self size])
      {
        if ([(MBCKFile *)self isRegularFile] && ![(MBCKFile *)self size])
        {
          int v81 = open_dprotected_np(v221, 1793, 4, 0);
          id v19 = v38;
          if ((v81 & 0x80000000) == 0)
          {
            close(v81);
            goto LABEL_237;
          }
          __int16 v41 = v220;
          if (!v220) {
            goto LABEL_165;
          }
          CFStringRef v42 = @"open_dprotected_np error";
        }
        else if ([(MBCKFile *)self isDirectory])
        {
          int v62 = MBGetDefaultLog();
          BOOL v63 = os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG);
          if (v44)
          {
            id v19 = v38;
            if (v63)
            {
              unsigned int v64 = [(MBCKFile *)self permissions];
              *(_DWORD *)stat buf = 67109378;
              *(_DWORD *)v234 = v64;
              *(_WORD *)&v234[4] = 2112;
              *(void *)&v234[6] = v22;
              _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_DEBUG, "Directory already exists, restoring permissions 0%o at %@", buf, 0x12u);
              unint64_t v185 = [(MBCKFile *)self permissions];
              uint64_t v187 = (uint64_t)v22;
              _MBLog();
            }

            if (!lchmod(v221, [(MBCKFile *)self permissions])) {
              goto LABEL_237;
            }
            __int16 v41 = v220;
            if (!v220) {
              goto LABEL_165;
            }
            CFStringRef v42 = @"lchmod error";
          }
          else
          {
            id v19 = v38;
            if (v63)
            {
              unsigned int v80 = [(MBCKFile *)self permissions];
              *(_DWORD *)stat buf = 138412546;
              *(void *)v234 = v22;
              *(_WORD *)&v234[8] = 1024;
              *(_DWORD *)&v234[10] = v80;
              _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_DEBUG, "Making directory at %@ (0%o)", buf, 0x12u);
              unint64_t v185 = (unint64_t)v22;
              uint64_t v187 = [(MBCKFile *)self permissions];
              _MBLog();
            }

            if (!mkdir(v221, [(MBCKFile *)self permissions])) {
              goto LABEL_237;
            }
            __int16 v41 = v220;
            if (!v220) {
              goto LABEL_165;
            }
            CFStringRef v42 = @"mkdir error";
          }
        }
        else
        {
          id v19 = v38;
          if (![(MBCKFile *)self isSymbolicLink]) {
            goto LABEL_237;
          }
          unsigned int v65 = [(MBCKFile *)self linkTarget];

          long long v66 = MBGetDefaultLog();
          long long v67 = v66;
          if (!v65)
          {
            if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)stat buf = 138412290;
              *(void *)v234 = self;
              _os_log_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_ERROR, "Failed to set symbolic link: file missing link target: %@", buf, 0xCu);
              _MBLog();
            }

            if (v220)
            {
              unint64_t v111 = [(MBCKFile *)self absolutePath];
              id *v220 = +[MBError errorWithCode:205 path:v111 format:@"Symbolic link missing link target"];
            }
            BOOL v79 = 0;
            goto LABEL_238;
          }
          if (os_log_type_enabled(v66, OS_LOG_TYPE_DEBUG))
          {
            long long v68 = [(MBCKFile *)self linkTarget];
            *(_DWORD *)stat buf = 138412546;
            *(void *)v234 = v22;
            *(_WORD *)&v234[8] = 2112;
            *(void *)&v234[10] = v68;
            _os_log_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_DEBUG, "Creating symbolic link at %@ to target %@", buf, 0x16u);

            [(MBCKFile *)self linkTarget];
            v187 = unint64_t v185 = (unint64_t)v22;
            _MBLog();
          }
          long long v69 = [(MBCKFile *)self linkTarget];
          if ([v69 length])
          {
            [(MBCKFile *)self linkTarget];
            long long v70 = v21;
            id v71 = objc_claimAutoreleasedReturnValue();
            long long v72 = (const char *)[v71 fileSystemRepresentation];

            uint64_t v21 = v70;
          }
          else
          {
            long long v72 = "";
          }

          if (!symlink(v72, v221)) {
            goto LABEL_237;
          }
          id v38 = v19;
          __int16 v41 = v220;
          if (!v220) {
            goto LABEL_165;
          }
          CFStringRef v42 = @"symlink error";
        }
        uint64_t v43 = 102;
        goto LABEL_164;
      }
      v201 = v16;
      v222 = +[NSFileManager defaultManager];
      v56 = [(MBCKFile *)self restoreState];
      uint64_t v57 = [(MBCKFile *)self signature];
      unsigned int v58 = objc_msgSend(v17, "fileAssetMetadataForSignature:volumeType:", v57, -[MBCKFile volumeType](self, "volumeType"));

      char v59 = v58;
      uint64_t v60 = [v58 stashedAssetPath];
      if (v60) {
        [v56 setStashedAssetPath:v60];
      }
      v199 = (void *)v60;
      id v19 = v38;
      if ([v56 stashedAssetDecrypted]) {
        uint64_t v61 = 1;
      }
      else {
        uint64_t v61 = (uint64_t)[v59 stashedAssetIsDecrypted];
      }
      [v56 setStashedAssetDecrypted:v61];
      uint64_t v73 = [v59 decodedAssetPath];
      if (v73) {
        [v56 setDecodedAssetPath:v73];
      }
      v207 = v56;
      uint64_t v74 = [v56 decodedAssetPath];
      v200 = v59;
      v198 = (void *)v73;
      if (v74)
      {
        id v75 = (void *)v74;
        if ([v222 fileExistsAtPath:v74])
        {
          id v76 = self;
          [(MBCKFile *)self hasContentEncodingMethod];
          __int16 v77 = 0;
LABEL_71:
          id v197 = v75;
          id v209 = v197;
          unsigned __int8 v78 = v77;
          self = v76;
          goto LABEL_106;
        }
        v88 = MBGetDefaultLog();
        if (os_log_type_enabled(v88, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)stat buf = 138412546;
          *(void *)v234 = v75;
          *(_WORD *)&v234[8] = 2112;
          *(void *)&v234[10] = self;
          _os_log_impl((void *)&_mh_execute_header, v88, OS_LOG_TYPE_ERROR, "Missing decoded asset at %@ for %@", buf, 0x16u);
          unint64_t v185 = (unint64_t)v75;
          uint64_t v187 = (uint64_t)self;
          _MBLog();
        }
      }
      unsigned int v89 = [(MBCKFile *)self hasContentEncodingMethod];
      unint64_t v90 = v207;
      uint64_t v91 = [v207 stashedAssetPath];
      uint64_t v92 = v91;
      if (v89)
      {
        if (v91)
        {
          v218 = v21;
          id v210 = (id)v91;
          if (objc_msgSend(v222, "fileExistsAtPath:"))
          {
            unint64_t v93 = self;
            id v211 = v22;
            NSUInteger v94 = v19;
            __int16 v77 = 0;
            goto LABEL_143;
          }
          id v119 = MBGetDefaultLog();
          if (os_log_type_enabled(v119, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)stat buf = 138412546;
            *(void *)v234 = v210;
            *(_WORD *)&v234[8] = 2112;
            *(void *)&v234[10] = self;
            _os_log_impl((void *)&_mh_execute_header, v119, OS_LOG_TYPE_ERROR, "Missing stashed asset at %@ for %@", buf, 0x16u);
            unint64_t v185 = (unint64_t)v210;
            uint64_t v187 = (uint64_t)self;
            _MBLog();
          }

          [v207 setStashedAssetPath:0];
          [v207 setStashedAssetDecrypted:0];
          uint64_t v21 = v218;
        }
        v120 = objc_msgSend(self->_changeType, "fileURL", v92, v185, v187);
        v121 = [v120 path];

        if (!v121 || ([v222 fileExistsAtPath:v121] & 1) == 0)
        {
          v138 = v19;
          id v139 = v14;
          id v140 = v17;
          v141 = v21;
          v142 = MBGetDefaultLog();
          if (os_log_type_enabled(v142, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)stat buf = 138412546;
            *(void *)v234 = v121;
            *(_WORD *)&v234[8] = 2112;
            *(void *)&v234[10] = self;
            _os_log_impl((void *)&_mh_execute_header, v142, OS_LOG_TYPE_ERROR, "Missing content asset at %@ for %@", buf, 0x16u);
            _MBLog();
          }

          if (v220)
          {
            v143 = [(MBCKFile *)self absolutePath];
            id *v220 = +[MBError errorWithCode:205 path:v143 format:@"Missing content asset"];
          }
          __int16 v77 = 0;
          int v107 = 1;
          uint64_t v21 = v141;
          id v17 = v140;
          id v14 = v139;
          id v19 = v138;
          goto LABEL_158;
        }
        id v230 = 0;
        v218 = v21;
        unsigned __int8 v122 = [(MBCKFile *)self stashAssetsToTemporaryDirectoryWithAccount:v21 operationTracker:v14 cache:v17 device:v19 error:&v230];
        id v123 = (MBCKFile *)v230;
        id v124 = self;
        __int16 v77 = v123;
        if ((v122 & 1) == 0)
        {
          v159 = MBGetDefaultLog();
          if (os_log_type_enabled(v159, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)stat buf = 138412290;
            *(void *)v234 = v77;
            _os_log_impl((void *)&_mh_execute_header, v159, OS_LOG_TYPE_ERROR, "Failed to stash content asset %@", buf, 0xCu);
            _MBLog();
          }

          if (v220)
          {
            __int16 v77 = v77;
            id *v220 = v77;
          }
          int v107 = 1;
          goto LABEL_197;
        }
        id v211 = v22;
        NSUInteger v94 = v19;
        unint64_t v93 = v124;
        v125 = [(MBCKFile *)v124 restoreState];
        uint64_t v126 = [v125 stashedAssetPath];

        id v210 = (id)v126;
        if (!v126) {
          __assert_rtn("-[MBCKFile restoreAssetWithOperationTracker:destination:logger:cache:device:error:]", "MBCKFile.m", 1487, "stashedAssetPath");
        }
LABEL_143:
        v127 = v77;
        uint64_t v128 = [v218 persona];
        id v129 = [(MBCKFile *)v93 domain];
        uint64_t v130 = [(id)v128 restorePrefetchDirectoryForDomain:v129];

        v229 = v127;
        id v76 = v93;
        v205 = (void *)v130;
        LOBYTE(v128) = [(MBCKFile *)v93 decodeWithFileAtPath:v210 destinationDirectory:v130 error:&v229];
        __int16 v77 = v229;

        if (v128)
        {
          uint64_t v131 = [v207 decodedAssetPath];
          if (!v131) {
            __assert_rtn("-[MBCKFile restoreAssetWithOperationTracker:destination:logger:cache:device:error:]", "MBCKFile.m", 1496, "decodedAssetPath");
          }
          id v75 = (void *)v131;
          id v132 = MBGetDefaultLog();
          id v19 = v94;
          if (os_log_type_enabled(v132, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)stat buf = 138412802;
            *(void *)v234 = v210;
            *(_WORD *)&v234[8] = 2112;
            *(void *)&v234[10] = v75;
            __int16 v235 = 2112;
            v236 = v76;
            _os_log_impl((void *)&_mh_execute_header, v132, OS_LOG_TYPE_DEFAULT, "Decoded stashed asset from %@ to %@ for %@", buf, 0x20u);
            uint64_t v187 = (uint64_t)v75;
            v189 = v76;
            unint64_t v185 = (unint64_t)v210;
            _MBLog();
          }

          id v133 = [(MBCKFile *)v76 signature];
          v134 = objc_msgSend(v17, "updateDecodedAssetPath:forSignature:volumeType:", v75, v133, -[MBCKFile volumeType](v76, "volumeType"));

          id v22 = v211;
          if (!v134)
          {

            uint64_t v21 = v218;
            goto LABEL_71;
          }
          v216 = v19;
          id v135 = v14;
          id v136 = v17;
          int v137 = MBGetDefaultLog();
          if (os_log_type_enabled(v137, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)stat buf = 138412290;
            *(void *)v234 = v134;
            _os_log_impl((void *)&_mh_execute_header, v137, OS_LOG_TYPE_ERROR, "Failed to update decoded asset path: %@", buf, 0xCu);
            _MBLog();
          }

          if (v220) {
            id *v220 = v134;
          }

          int v107 = 1;
          v121 = v75;
          id v17 = v136;
          id v14 = v135;
          id v19 = v216;
          uint64_t v21 = v218;
LABEL_158:
          unint64_t v90 = v207;
          goto LABEL_235;
        }
        v158 = MBGetDefaultLog();
        unint64_t v90 = v207;
        if (os_log_type_enabled(v158, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)stat buf = 138412802;
          *(void *)v234 = v210;
          *(_WORD *)&v234[8] = 2112;
          *(void *)&v234[10] = v76;
          __int16 v235 = 2112;
          v236 = v77;
          _os_log_impl((void *)&_mh_execute_header, v158, OS_LOG_TYPE_ERROR, "Failed to decode the stashed asset at %@ for %@: %@", buf, 0x20u);
          _MBLog();
        }

        id v19 = v94;
        if (v220) {
          id *v220 = v77;
        }

        int v107 = 1;
        v121 = v210;
        id v22 = v211;
LABEL_197:
        uint64_t v21 = v218;
        goto LABEL_235;
      }
      v214 = v19;
      id v95 = v220;
      if (v91)
      {
        id v209 = (id)v91;
        if (objc_msgSend(v222, "fileExistsAtPath:"))
        {
LABEL_105:
          id v197 = 0;
          unsigned __int8 v78 = 0;
          id v19 = v214;
LABEL_106:
          v219 = v21;
          if (_os_feature_enabled_impl())
          {
            unint64_t v100 = [(MBCKFile *)self volumeType];
            v203 = self;
            v101 = [(MBCKFile *)self signature];
            v228 = v78;
            unsigned __int8 v102 = [v17 retainCountForSignature:v101 volumeType:v100 error:&v228];
            __int16 v77 = v228;

            v215 = v19;
            if (v77)
            {
              v103 = v102;
              BOOL v104 = MBGetDefaultLog();
              id v105 = v220;
              unint64_t v90 = v207;
              if (os_log_type_enabled(v104, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)stat buf = 138412546;
                *(void *)v234 = v203;
                *(_WORD *)&v234[8] = 2112;
                *(void *)&v234[10] = v77;
                _os_log_impl((void *)&_mh_execute_header, v104, OS_LOG_TYPE_ERROR, "Failed to fetch retain count for %@: %@", buf, 0x16u);
                _MBLog();
              }

              uint64_t v21 = v219;
              id v106 = v197;
              if (!v220) {
                goto LABEL_112;
              }
LABEL_111:
              __int16 v77 = v77;
              id *v105 = v77;
LABEL_112:

              int v107 = 1;
              id v19 = v215;
LABEL_233:
              v157 = v209;
              goto LABEL_234;
            }
            v103 = v102;
            id v193 = [v102 unsignedLongLongValue];
            if (!v193)
            {
              v144 = MBGetDefaultLog();
              if (os_log_type_enabled(v144, OS_LOG_TYPE_FAULT))
              {
                *(_WORD *)stat buf = 0;
                _os_log_impl((void *)&_mh_execute_header, v144, OS_LOG_TYPE_FAULT, "retainCount == 0, clones may not be preserved", buf, 2u);
                _MBLog();
              }
            }
            v196 = v102;
            if ([(MBCKFile *)v203 sourceDeviceInode])
            {
              id v145 = [(MBCKFile *)v203 sourceDeviceInode];
              v146 = [(MBCKFile *)v203 signature];
              id v227 = 0;
              unint64_t v147 = (unint64_t)[v17 countRestoreFilesWithSourceDeviceInode:v145 signature:v146 volumeType:v100 error:&v227];
              id v148 = v227;

              if (!v147 || v148)
              {
                v149 = MBGetDefaultLog();
                if (os_log_type_enabled(v149, OS_LOG_TYPE_ERROR))
                {
                  v150 = +[NSNumber numberWithUnsignedLongLong:[(MBCKFile *)v203 sourceDeviceInode]];
                  *(_DWORD *)stat buf = 138412546;
                  *(void *)v234 = v150;
                  *(_WORD *)&v234[8] = 2112;
                  *(void *)&v234[10] = v148;
                  _os_log_impl((void *)&_mh_execute_header, v149, OS_LOG_TYPE_ERROR, "Failed to get link count for %@: %@", buf, 0x16u);

                  v186 = +[NSNumber numberWithUnsignedLongLong:[(MBCKFile *)v203 sourceDeviceInode]];
                  id v188 = v148;
                  _MBLog();
                }
              }

              v103 = v196;
            }
            else
            {
              unint64_t v147 = 1;
            }
            id v212 = v209;
            v195 = (const char *)[v212 fileSystemRepresentation];
            if (!v195) {
              __assert_rtn("-[MBCKFile restoreAssetWithOperationTracker:destination:logger:cache:device:error:]", "MBCKFile.m", 1565, "sourcePathFSR");
            }
            id v160 = v22;
            v194 = (const char *)[v160 fileSystemRepresentation];
            if (!v194) {
              __assert_rtn("-[MBCKFile restoreAssetWithOperationTracker:destination:logger:cache:device:error:]", "MBCKFile.m", 1567, "destinationFSR");
            }
            v161 = MBGetDefaultLog();
            BOOL v162 = os_log_type_enabled(v161, OS_LOG_TYPE_INFO);
            if (v147 >= 2)
            {
              if (v162)
              {
                v163 = [(MBCKFile *)v203 fileID];
                *(_DWORD *)stat buf = 138413058;
                *(void *)v234 = v212;
                *(_WORD *)&v234[8] = 2112;
                *(void *)&v234[10] = v160;
                __int16 v235 = 2112;
                v236 = v163;
                __int16 v237 = 2048;
                id v238 = v193;
                _os_log_impl((void *)&_mh_execute_header, v161, OS_LOG_TYPE_INFO, "Restoring hard link from %@ to %@ (%@) rc:%lld", buf, 0x2Au);

                v190 = [(MBCKFile *)v203 fileID];
                id v191 = v193;
                v186 = v212;
                id v188 = v160;
                _MBLog();

                v103 = v196;
              }

              id v192 = v160;
              if (!link(v195, v194))
              {
                __int16 v77 = 0;
                unint64_t v90 = v207;
                id v106 = v197;
LABEL_228:
                objc_msgSend(v201, "logLinkForRestorable:state:source:target:", v203, 5, v212, v192, v186, v188, v190, v191);
LABEL_231:

                v110 = v77;
                id v19 = v215;
                goto LABEL_232;
              }
              unint64_t v164 = *__error();
              v165 = MBGetDefaultLog();
              v166 = v165;
              if (v164 == 18)
              {
                unint64_t v90 = v207;
                if (os_log_type_enabled(v165, OS_LOG_TYPE_FAULT))
                {
                  v167 = [v212 lastPathComponent];
                  *(_DWORD *)stat buf = 138412546;
                  *(void *)v234 = v167;
                  *(_WORD *)&v234[8] = 2112;
                  *(void *)&v234[10] = v160;
                  _os_log_impl((void *)&_mh_execute_header, v166, OS_LOG_TYPE_FAULT, "Could not restore hard link (%@) across volumes, copying to %@", buf, 0x16u);

                  v186 = [v212 lastPathComponent];
                  id v188 = v160;
                  _MBLog();

                  v103 = v196;
                }

                __int16 v77 = 0;
                uint64_t v21 = v219;
                id v106 = v197;
                if (!+[MBFileOperation crossVolumeCopyFrom:v195 toDestination:v194 shouldDeleteSource:0 error:v220])goto LABEL_112; {
                goto LABEL_228;
                }
              }
              id v175 = v212;
              if (os_log_type_enabled(v165, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)stat buf = 138412802;
                *(void *)v234 = v212;
                *(_WORD *)&v234[8] = 2112;
                *(void *)&v234[10] = v160;
                __int16 v235 = 1024;
                LODWORD(v236) = v164;
                _os_log_impl((void *)&_mh_execute_header, v166, OS_LOG_TYPE_ERROR, "Failed to hardlink file from %@ to %@: %{errno}d", buf, 0x1Cu);
                id v188 = v160;
                v190 = (void *)v164;
                v186 = v212;
                _MBLog();
              }

              if (v164 == 17)
              {
                v176 = [(MBCKFile *)v203 domainName];
                unsigned int v177 = [v176 isEqualToString:@"AppDomainGroup-group.com.apple.FileProvider.LocalStorage"];

                id v175 = v212;
                if (v177)
                {
                  id v226 = 0;
                  v178 = [(MBCKFile *)v203 moveFileFromSource:v212 destination:v160 destinationSize:v232.st_size conflictResolution:2 error:&v226];
                  __int16 v77 = (MBCKFile *)v226;

                  unint64_t v90 = v207;
                  id v106 = v197;
                  if (v178)
                  {
                    v103 = v196;
                    goto LABEL_228;
                  }
                  goto LABEL_265;
                }
              }
              __int16 v77 = +[MBError errorWithErrno:v164, @"Failed hardlinking from %@ to %@", v175, v160, v190, v191 format];
              v183 = MBGetDefaultLog();
              if (os_log_type_enabled(v183, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)stat buf = 138412802;
                *(void *)v234 = v175;
                *(_WORD *)&v234[8] = 2112;
                *(void *)&v234[10] = v192;
                __int16 v235 = 2112;
                v236 = v77;
                _os_log_impl((void *)&_mh_execute_header, v183, OS_LOG_TYPE_ERROR, "link error from %@ to %@: %@", buf, 0x20u);
LABEL_255:
                _MBLog();
                goto LABEL_256;
              }
              goto LABEL_256;
            }
            if (v162)
            {
              *(_DWORD *)stat buf = 138413058;
              *(void *)v234 = v212;
              *(_WORD *)&v234[8] = 2112;
              *(void *)&v234[10] = v160;
              __int16 v235 = 2112;
              v236 = v203;
              __int16 v237 = 2048;
              id v238 = v193;
              _os_log_impl((void *)&_mh_execute_header, v161, OS_LOG_TYPE_INFO, "Cloning from %@ to %@ (%@) rc:%lld", buf, 0x2Au);
              v190 = v203;
              id v191 = v193;
              v186 = v212;
              id v188 = v160;
              _MBLog();
            }

            if (clonefile(v195, v194, 0))
            {
              unint64_t v168 = *__error();
              v169 = MBGetDefaultLog();
              v170 = v169;
              if (v168 == 18)
              {
                unint64_t v90 = v207;
                if (os_log_type_enabled(v169, OS_LOG_TYPE_INFO))
                {
                  v171 = [v212 lastPathComponent];
                  *(_DWORD *)stat buf = 138412546;
                  *(void *)v234 = v171;
                  *(_WORD *)&v234[8] = 2112;
                  *(void *)&v234[10] = v160;
                  _os_log_impl((void *)&_mh_execute_header, v170, OS_LOG_TYPE_INFO, "Could not restore clone (%@) across volumes, copying to %@", buf, 0x16u);

                  v186 = [v212 lastPathComponent];
                  id v188 = v160;
                  _MBLog();

                  v103 = v196;
                }
                id v172 = v160;

                __int16 v77 = 0;
                uint64_t v21 = v219;
                id v106 = v197;
                if (!+[MBFileOperation crossVolumeCopyFrom:v195 toDestination:v194 shouldDeleteSource:0 error:v220])goto LABEL_112; {
              }
                }
              else
              {
                id v179 = v212;
                if (os_log_type_enabled(v169, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)stat buf = 138412802;
                  *(void *)v234 = v212;
                  *(_WORD *)&v234[8] = 2112;
                  *(void *)&v234[10] = v160;
                  __int16 v235 = 1024;
                  LODWORD(v236) = v168;
                  _os_log_impl((void *)&_mh_execute_header, v170, OS_LOG_TYPE_ERROR, "Failed to clone file from %@ to %@: %{errno}d", buf, 0x1Cu);
                  id v188 = v160;
                  v190 = (void *)v168;
                  v186 = v212;
                  _MBLog();
                }

                if (v168 != 17
                  || ([(MBCKFile *)v203 domainName],
                      v180 = objc_claimAutoreleasedReturnValue(),
                      v181 = [v180 isEqualToString:@"AppDomainGroup-group.com.apple.FileProvider.LocalStorage"], v180, id v179 = v212, !v181))
                {
                  +[MBError errorWithErrno:v168, @"Failed cloning from %@ to %@", v179, v160, v190, v191 format];
                  id v184 = v160;
                  __int16 v77 = (MBCKFile *)objc_claimAutoreleasedReturnValue();
                  v183 = MBGetDefaultLog();
                  if (os_log_type_enabled(v183, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)stat buf = 138412802;
                    *(void *)v234 = v179;
                    *(_WORD *)&v234[8] = 2112;
                    *(void *)&v234[10] = v184;
                    __int16 v235 = 2112;
                    v236 = v77;
                    _os_log_impl((void *)&_mh_execute_header, v183, OS_LOG_TYPE_ERROR, "clone error from %@ to %@: %@", buf, 0x20u);
                    goto LABEL_255;
                  }
LABEL_256:

                  uint64_t v21 = v219;
                  id v105 = v220;
                  unint64_t v90 = v207;
                  id v106 = v197;
                  goto LABEL_257;
                }
                id v225 = 0;
                id v172 = v160;
                v182 = [(MBCKFile *)v203 moveFileFromSource:v212 destination:v160 destinationSize:v232.st_size conflictResolution:1 error:&v225];
                __int16 v77 = (MBCKFile *)v225;

                unint64_t v90 = v207;
                id v106 = v197;
                if (!v182)
                {
LABEL_265:
                  uint64_t v21 = v219;
                  id v105 = v220;
LABEL_257:
                  v103 = v196;
                  if (!v105) {
                    goto LABEL_112;
                  }
                  goto LABEL_111;
                }
                v103 = v196;
              }
            }
            else
            {
              id v172 = v160;
              __int16 v77 = 0;
              unint64_t v90 = v207;
              id v106 = v197;
            }
            objc_msgSend(v201, "logCloneForRestorable:state:source:target:", v203, 5, v212, v172, v186, v188, v190, v191);
            goto LABEL_231;
          }
          v108 = MBGetDefaultLog();
          if (os_log_type_enabled(v108, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)stat buf = 138412546;
            *(void *)v234 = v209;
            *(_WORD *)&v234[8] = 2112;
            *(void *)&v234[10] = v22;
            _os_log_impl((void *)&_mh_execute_header, v108, OS_LOG_TYPE_DEBUG, "Moving downloaded file from %@ to %@", buf, 0x16u);
            unint64_t v185 = (unint64_t)v209;
            uint64_t v187 = (uint64_t)v22;
            _MBLog();
          }

          v224 = v78;
          unsigned __int8 v109 = [v222 moveItemAtPath:v209 toPath:v22 error:&v224];
          v110 = v224;

          if (v109)
          {
            unint64_t v90 = v207;
LABEL_117:
            id v106 = v197;
LABEL_232:
            objc_msgSend(v90, "setStashedAssetPath:", 0, v185, v187, v189);
            int v107 = 0;
            __int16 v77 = v110;
            uint64_t v21 = v219;
            goto LABEL_233;
          }
          v112 = MBGetDefaultLog();
          if (os_log_type_enabled(v112, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)stat buf = 138543874;
            *(void *)v234 = v209;
            *(_WORD *)&v234[8] = 2114;
            *(void *)&v234[10] = v22;
            __int16 v235 = 2114;
            v236 = v110;
            _os_log_impl((void *)&_mh_execute_header, v112, OS_LOG_TYPE_ERROR, "Failed to move file into place from %{public}@ to %{public}@: %{public}@", buf, 0x20u);
            uint64_t v187 = (uint64_t)v22;
            v189 = v110;
            unint64_t v185 = (unint64_t)v209;
            _MBLog();
          }

          v113 = [(MBCKFile *)self domainName];
          if ([v113 isEqualToString:@"AppDomainGroup-group.com.apple.FileProvider.LocalStorage"])
          {
            NSUInteger v114 = [(MBCKFile *)v110 domain];
            if ([v114 isEqualToString:NSCocoaErrorDomain])
            {
              v204 = self;
              unsigned int v115 = v19;
              id v116 = [(MBCKFile *)v110 code];

              if (v116 == (id)516)
              {
                v223 = v110;
                id v117 = [(MBCKFile *)v204 moveFileFromSource:v209 destination:v22 destinationSize:v232.st_size conflictResolution:3 error:&v223];
                __int16 v77 = v223;

                NSUInteger v118 = v220;
                unint64_t v90 = v207;
                if (v117)
                {
                  v110 = v77;
                  id v19 = v115;
                  goto LABEL_117;
                }
                if (!v220) {
                  goto LABEL_223;
                }
                v173 = v77;
LABEL_222:
                __int16 v77 = v173;
                *NSUInteger v118 = v77;
LABEL_223:
                int v107 = 1;
LABEL_225:
                uint64_t v21 = v219;
                id v19 = v115;
                v157 = v209;
                id v106 = v197;
LABEL_234:

                v121 = v106;
LABEL_235:

                id v16 = v201;
                if (v107)
                {
LABEL_236:
                  BOOL v79 = 0;
                  goto LABEL_238;
                }
LABEL_237:
                BOOL v79 = 1;
                goto LABEL_238;
              }
LABEL_220:
              unint64_t v90 = v207;
              objc_msgSend(v207, "setStashedAssetPath:", 0, v185, v187, v189);
              [v207 setStashedAssetDecrypted:0];
              NSUInteger v118 = v220;
              if (!v220)
              {
                int v107 = 1;
                __int16 v77 = v110;
                goto LABEL_225;
              }
              v173 = v110;
              goto LABEL_222;
            }
          }
          unsigned int v115 = v19;

          goto LABEL_220;
        }
        id v96 = v21;
        CFStringRef v97 = MBGetDefaultLog();
        if (os_log_type_enabled(v97, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)stat buf = 138412546;
          *(void *)v234 = v209;
          *(_WORD *)&v234[8] = 2112;
          *(void *)&v234[10] = self;
          _os_log_impl((void *)&_mh_execute_header, v97, OS_LOG_TYPE_ERROR, "Missing stashed asset at %@ for %@", buf, 0x16u);
          unint64_t v185 = (unint64_t)v209;
          uint64_t v187 = (uint64_t)self;
          id v95 = v220;
          _MBLog();
        }

        [v207 setStashedAssetPath:0];
        [v207 setStashedAssetDecrypted:0];
        uint64_t v21 = v96;
      }
      v98 = objc_msgSend(self->_changeType, "fileURL", v92, v185, v187);
      id v99 = [v98 path];

      if (v99)
      {
        id v209 = v99;
        if ([v222 fileExistsAtPath:v99]) {
          goto LABEL_105;
        }
        v151 = v21;
        v152 = MBGetDefaultLog();
        if (os_log_type_enabled(v152, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)stat buf = 138412546;
          *(void *)v234 = v99;
          *(_WORD *)&v234[8] = 2112;
          *(void *)&v234[10] = self;
          _os_log_impl((void *)&_mh_execute_header, v152, OS_LOG_TYPE_ERROR, "Missing content asset at %@ for %@", buf, 0x16u);
          unint64_t v185 = (unint64_t)v99;
          uint64_t v187 = (uint64_t)self;
          _MBLog();
        }

        uint64_t v21 = v151;
      }
      id v153 = v17;
      v154 = [(MBCKFile *)self absolutePath];
      +[MBError errorWithCode:205 path:v154 format:@"Missing content asset"];
      v155 = self;
      __int16 v77 = (MBCKFile *)objc_claimAutoreleasedReturnValue();

      v156 = MBGetDefaultLog();
      if (os_log_type_enabled(v156, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)stat buf = 138412546;
        *(void *)v234 = v155;
        *(_WORD *)&v234[8] = 2112;
        *(void *)&v234[10] = v77;
        _os_log_impl((void *)&_mh_execute_header, v156, OS_LOG_TYPE_ERROR, "Missing content asset on %@: %@", buf, 0x16u);
        _MBLog();
      }

      if (v95)
      {
        __int16 v77 = v77;
        id v106 = 0;
        v157 = 0;
        id *v95 = v77;
      }
      else
      {
        id v106 = 0;
        v157 = 0;
      }
      int v107 = 1;
      id v19 = v214;
      id v17 = v153;
      unint64_t v90 = v207;
      goto LABEL_234;
    }
    uint64_t v45 = [(MBCKFile *)self domainName];
    if ([v45 isEqualToString:@"AppDomainGroup-group.com.apple.FileProvider.LocalStorage"])
    {
      int v46 = _os_feature_enabled_impl();

      if (v46)
      {
        id v38 = v19;
        id v47 = MBGetDefaultLog();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)stat buf = 138412290;
          *(void *)v234 = v22;
          _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "Not removing existing On My iPhone file at %@", buf, 0xCu);
          unint64_t v185 = (unint64_t)v22;
          _MBLog();
        }
LABEL_42:

LABEL_43:
        char v44 = 0;
        goto LABEL_44;
      }
    }
    else
    {
    }
    v202 = self;
    id v50 = v14;
    id v51 = v17;
    __int16 v52 = v21;
    v53 = MBGetDefaultLog();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)stat buf = 138412290;
      *(void *)v234 = v22;
      _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, "Removing existing item at %@", buf, 0xCu);
      unint64_t v185 = (unint64_t)v22;
      _MBLog();
    }

    id v54 = +[NSFileManager defaultManager];
    id v231 = 0;
    unsigned __int8 v55 = [v54 removeItemAtPath:v22 error:&v231];
    id v47 = v231;

    if ((v55 & 1) == 0)
    {
      if (v220)
      {
        id *v220 = +[MBError errorWithCode:102 error:v47 path:v22 format:@"Failed to remove existing file"];
      }

      BOOL v79 = 0;
      uint64_t v21 = v52;
      id v17 = v51;
      id v14 = v50;
      goto LABEL_238;
    }
    id v38 = v19;
    uint64_t v21 = v52;
    id v17 = v51;
    id v14 = v50;
    self = v202;
    goto LABEL_42;
  }
  id v25 = v16;
  id v26 = v14;
  id v27 = v17;
  v217 = v21;
  unsigned int v28 = [(MBCKFile *)self relativePath];
  uint64_t v29 = [v28 stringByDeletingLastPathComponent];

  unsigned __int8 v30 = self;
  id v31 = [(MBCKFile *)self relativePath];
  id v32 = [v22 rangeOfString:v31];

  if (v32 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_17:

    uint64_t v21 = v217;
    unsigned __int8 v37 = v27;
    id v14 = v26;
    self = v30;
    id v17 = v37;
    id v16 = v25;
    goto LABEL_18;
  }
  v213 = v19;
  v206 = v26;
  id v208 = v27;
  id v33 = [v22 substringToIndex:v32];
  if (![v29 length])
  {
    CFStringRef v36 = v29;
LABEL_16:

    uint64_t v29 = v36;
    goto LABEL_17;
  }
  while (1)
  {
    uint64_t v34 = [v33 stringByAppendingPathComponent:v29];
    memset(&v232, 0, sizeof(v232));
    id v35 = v34;
    if (!lstat((const char *)[v35 fileSystemRepresentation], &v232))
    {
      if ((~v232.st_mode & 0xA000) == 0)
      {
        id v16 = v25;
        id v14 = v206;
        v84 = v220;
        if (!v220) {
          goto LABEL_121;
        }
        unsigned __int8 v85 = +[MBError errorWithCode:205 path:v35 format:@"Restore path parent directory is a symlink"];
        goto LABEL_120;
      }
      goto LABEL_13;
    }
    if (*__error() == 63) {
      break;
    }
    if (*__error() != 2)
    {
      if (v220)
      {
        id *v220 = +[MBError posixErrorWithPath:v35 format:@"lstat error"];
      }
      v86 = MBGetDefaultLog();
      if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR))
      {
        int v87 = *__error();
        *(_DWORD *)stat buf = 138412546;
        *(void *)v234 = v35;
        *(_WORD *)&v234[8] = 1024;
        *(_DWORD *)&v234[10] = v87;
        _os_log_impl((void *)&_mh_execute_header, v86, OS_LOG_TYPE_ERROR, "lstat failed at %@: %{errno}d", buf, 0x12u);
        __error();
        _MBLog();
      }

      id v14 = v206;
      id v16 = v25;
      goto LABEL_121;
    }
LABEL_13:
    CFStringRef v36 = [v29 stringByDeletingLastPathComponent];

    uint64_t v29 = v36;
    if (![v36 length]) {
      goto LABEL_16;
    }
  }
  v82 = MBGetDefaultLog();
  if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
  {
    int v83 = *__error();
    *(_DWORD *)stat buf = 138412546;
    *(void *)v234 = v35;
    *(_WORD *)&v234[8] = 1024;
    *(_DWORD *)&v234[10] = v83;
    _os_log_impl((void *)&_mh_execute_header, v82, OS_LOG_TYPE_DEFAULT, "Skipping restore asset, lstat failed at %@: %{errno}d", buf, 0x12u);
    __error();
    _MBLog();
  }

  id v14 = v206;
  v84 = v220;
  id v16 = v25;
  if (v220)
  {
    unsigned __int8 v85 = +[MBError posixErrorWithCode:107 path:v22 format:@"lstat error"];
LABEL_120:
    id *v84 = v85;
  }
LABEL_121:

  BOOL v79 = 0;
  id v17 = v208;
  id v19 = v213;
  uint64_t v21 = v217;
LABEL_238:

  return v79;
}

- (BOOL)_decryptWithOperationTracker:(id)a3 destination:(id)a4 device:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ([(MBCKFile *)self isRegularFile] && [(MBCKFile *)self size])
  {
    if (((uint64_t)self->_restoreState & 8) != 0 || ![(MBCKFile *)self isProtected])
    {
      id v14 = MBGetDefaultLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        buf.st_dev = 138412290;
        *(void *)&buf.st_mode = self;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "Not decrypting %@", (uint8_t *)&buf, 0xCu);
        _MBLog();
      }
      BOOL v28 = 1;
      goto LABEL_58;
    }
    if (!a6) {
      __assert_rtn("-[MBCKFile _decryptWithOperationTracker:destination:device:error:]", "MBCKFile.m", 1712, "error");
    }
    if (!v10) {
      __assert_rtn("-[MBCKFile _decryptWithOperationTracker:destination:device:error:]", "MBCKFile.m", 1713, "tracker");
    }
    if (!v12) {
      __assert_rtn("-[MBCKFile _decryptWithOperationTracker:destination:device:error:]", "MBCKFile.m", 1714, "device");
    }
    id v13 = [v10 account];
    id v14 = v13;
    if (!v13) {
      __assert_rtn("-[MBCKFile _decryptWithOperationTracker:destination:device:error:]", "MBCKFile.m", 1716, "account");
    }
    id v15 = [v13 persona];
    id v65 = [v15 accountType];

    id v16 = MBGetDefaultLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      buf.st_dev = 138412290;
      *(void *)&buf.st_mode = self;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Decrypting file %@", (uint8_t *)&buf, 0xCu);
      id v54 = self;
      _MBLog();
    }

    long long v67 = [v12 keybagManager];
    id v17 = [(MBCKFile *)self encryptionKey];
    BOOL v18 = v17 == 0;

    if (v18) {
      goto LABEL_42;
    }
    if (!v67) {
      __assert_rtn("-[MBCKFile _decryptWithOperationTracker:destination:device:error:]", "MBCKFile.m", 1727, "keybagManager");
    }
    id v19 = [(MBCKFile *)self keybagUUIDString];
    uint64_t v20 = [v67 keybagWithUUID:v19];

    if (v20)
    {
      id v21 = 0;
      goto LABEL_15;
    }
    uint64_t v29 = [(MBCKFile *)self keybagUUIDData];
    id v86 = 0;
    uint64_t v20 = +[MBCKKeyBag keybagWithDevice:v12 keybagUUID:v29 operationTracker:v10 error:&v86];
    id v30 = v86;

    if (v20)
    {
      [v67 addKeybag:v20];
      id v85 = v30;
      unsigned __int8 v31 = [v12 saveWithOperationTracker:v10 error:&v85];
      id v21 = v85;

      if ((v31 & 1) == 0)
      {
        id v32 = MBGetDefaultLog();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          id v33 = [v20 keybagUUIDString];
          buf.st_dev = 138543618;
          *(void *)&buf.st_mode = v33;
          WORD2(buf.st_ino) = 2112;
          *(__darwin_ino64_t *)((char *)&buf.st_ino + 6) = (__darwin_ino64_t)v21;
          _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "Failed to save device record with recovered keybag %{public}@: %@", (uint8_t *)&buf, 0x16u);

          id v54 = [v20 keybagUUIDString];
          id v56 = v21;
          _MBLog();
        }
      }
LABEL_15:
      id v22 = [(MBCKFile *)self encryptionKey];
      BOOL v23 = v22 == 0;

      id v24 = MBGetDefaultLog();
      id v25 = v24;
      if (v23)
      {
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          uint64_t v34 = [(MBCKFile *)self absolutePath];
          buf.st_dev = 138412546;
          *(void *)&buf.st_mode = v11;
          WORD2(buf.st_ino) = 2112;
          *(__darwin_ino64_t *)((char *)&buf.st_ino + 6) = (__darwin_ino64_t)v34;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "Failed to decrypt file at %@(%@) without an encryption key", (uint8_t *)&buf, 0x16u);

          unsigned int v58 = [(MBCKFile *)self absolutePath];
          _MBLog();
        }
        id v35 = [(MBCKFile *)self absolutePath];
        *a6 = +[MBError errorWithCode:205 path:v35 format:@"No encryption key found for protected file"];

        BOOL v28 = 0;
        goto LABEL_57;
      }
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        id v26 = [v20 keybagUUIDString];
        buf.st_dev = 138412546;
        *(void *)&buf.st_mode = v11;
        WORD2(buf.st_ino) = 2112;
        *(__darwin_ino64_t *)((char *)&buf.st_ino + 6) = (__darwin_ino64_t)v26;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEBUG, "Decrypting file in place at %@ with keybag %@", (uint8_t *)&buf, 0x16u);

        uint64_t v57 = [v20 keybagUUIDString];
        _MBLog();
      }
      uint64_t v81 = 0;
      v82 = &v81;
      uint64_t v83 = 0x2020000000;
      char v84 = 0;
      uint64_t v75 = 0;
      id v76 = &v75;
      uint64_t v77 = 0x3032000000;
      unsigned __int8 v78 = sub_1000F4350;
      BOOL v79 = sub_1000F4360;
      id v80 = 0;
      id v74 = v21;
      v68[0] = _NSConcreteStackBlock;
      v68[1] = 3221225472;
      v68[2] = sub_1000F4368;
      v68[3] = &unk_100413300;
      long long v72 = &v81;
      id v63 = v11;
      id v69 = v63;
      long long v70 = self;
      id v71 = v12;
      uint64_t v73 = &v75;
      unsigned __int8 v27 = +[MBCKKeyBag unlockKeybag:v20 accountType:v65 error:&v74 block:v68];
      id v66 = v74;

      if (v27)
      {
        if (*((unsigned char *)v82 + 24))
        {
          BOOL v28 = 1;
LABEL_56:

          _Block_object_dispose(&v75, 8);
          _Block_object_dispose(&v81, 8);

          id v21 = v66;
          goto LABEL_57;
        }
        if (!v76[5]) {
          __assert_rtn("-[MBCKFile _decryptWithOperationTracker:destination:device:error:]", "MBCKFile.m", 1772, "decryptError");
        }
        memset(&buf, 0, sizeof(buf));
        id v64 = v63;
        if (lstat((const char *)[v64 fileSystemRepresentation], &buf)) {
          off_t st_size = -1;
        }
        else {
          off_t st_size = buf.st_size;
        }
        int v46 = MBGetDefaultLog();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
        {
          off_t v62 = st_size;
          id v47 = v46;
          if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
          {
            uint64_t v61 = [(MBCKFile *)self absolutePath];
            id v48 = [(MBCKFile *)self fileID];
            unint64_t v49 = [(MBCKFile *)self size];
            uint64_t v50 = v76[5];
            *(_DWORD *)int v87 = 138413570;
            id v88 = v64;
            __int16 v89 = 2112;
            unint64_t v90 = v61;
            __int16 v91 = 2112;
            uint64_t v92 = v48;
            __int16 v93 = 2048;
            unint64_t v94 = v49;
            __int16 v95 = 2048;
            off_t v96 = v62;
            __int16 v97 = 2112;
            uint64_t v98 = v50;
            _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_ERROR, "Failed to decrypt file at %@(%@), fileID:%@, size:%llu, sizeOnDisk:%llu: %@", v87, 0x3Eu);
          }
          id v51 = [(MBCKFile *)self absolutePath];
          __int16 v52 = [(MBCKFile *)self fileID];
          [(MBCKFile *)self size];
          _MBLog();
        }
        id v39 = (id) v76[5];
      }
      else
      {
        CFStringRef v36 = MBGetDefaultLog();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        {
          unsigned __int8 v37 = v36;
          if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
          {
            id v38 = [(MBCKFile *)self absolutePath];
            buf.st_dev = 138412802;
            *(void *)&buf.st_mode = v63;
            WORD2(buf.st_ino) = 2112;
            *(__darwin_ino64_t *)((char *)&buf.st_ino + 6) = (__darwin_ino64_t)v38;
            HIWORD(buf.st_gid) = 2112;
            *(void *)&buf.st_rdev = v66;
            _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "Failed to decrypt file at %@(%@): %@", (uint8_t *)&buf, 0x20u);
          }
          char v59 = [(MBCKFile *)self absolutePath];
          _MBLog();
        }
        id v39 = v66;
      }
      BOOL v28 = 0;
      *a6 = v39;
      goto LABEL_56;
    }
    int v40 = MBGetDefaultLog();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      __int16 v41 = [(MBCKFile *)self keybagUUIDString];
      buf.st_dev = 138543618;
      *(void *)&buf.st_mode = v41;
      WORD2(buf.st_ino) = 2112;
      *(__darwin_ino64_t *)((char *)&buf.st_ino + 6) = (__darwin_ino64_t)v30;
      _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_ERROR, "No keybag found for %{public}@: %@", (uint8_t *)&buf, 0x16u);

      unsigned __int8 v55 = [(MBCKFile *)self keybagUUIDString];
      _MBLog();
    }
    if (!v30)
    {
LABEL_42:
      uint64_t v43 = MBGetDefaultLog();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      {
        char v44 = [(MBCKFile *)self absolutePath];
        buf.st_dev = 138412546;
        *(void *)&buf.st_mode = v11;
        WORD2(buf.st_ino) = 2112;
        *(__darwin_ino64_t *)((char *)&buf.st_ino + 6) = (__darwin_ino64_t)v44;
        _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_ERROR, "Failed to decrypt file at %@(%@) without a keybag", (uint8_t *)&buf, 0x16u);

        uint64_t v60 = [(MBCKFile *)self absolutePath];
        _MBLog();
      }
      id v21 = [(MBCKFile *)self absolutePath];
      id v42 = +[MBError errorWithCode:205 path:v21 format:@"No keybag found for protected file"];
    }
    else
    {
      id v42 = v30;
      id v21 = v42;
    }
    BOOL v28 = 0;
    *a6 = v42;
LABEL_57:

LABEL_58:
    goto LABEL_59;
  }
  BOOL v28 = 1;
LABEL_59:

  return v28;
}

- (BOOL)validateSignatureAtDestination:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  if (!a4) {
    __assert_rtn("-[MBCKFile validateSignatureAtDestination:withError:]", "MBCKFile.m", 1784, "error");
  }
  id v7 = v6;
  if (MBIsInternalInstall())
  {
    if ([(MBCKFile *)self isRegularFile])
    {
      unsigned int v8 = [(MBCKFile *)self sha256Signature];

      if (v8)
      {
        if (qword_100482438 != -1) {
          dispatch_once(&qword_100482438, &stru_100413320);
        }
        if (![(MBCKFile *)self hasContentEncodingMethod]
          || ((uint64_t)self->_sqliteTemporaryDirectory & 0xFE) != 2)
        {
          id v11 = +[MBDigest sha256];
          id v12 = [v11 digestForFileAtPath:v7 error:a4];

          if (!v12)
          {
            id v17 = MBGetDefaultLog();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            {
              id v18 = *a4;
              *(_DWORD *)stat buf = 138412546;
              BOOL v23 = v7;
              __int16 v24 = 2112;
              id v25 = v18;
              _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Failed to compute the sha256 digest for the file at %@: %@", buf, 0x16u);
              _MBLog();
            }

            BOOL v9 = byte_100482420 == 0;
            goto LABEL_24;
          }
          id v13 = [(MBCKFile *)self sha256Signature];
          unsigned __int8 v14 = [v13 isEqualToData:v12];

          id v15 = MBGetDefaultLog();
          id v16 = v15;
          if (v14)
          {
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)stat buf = 138412290;
              BOOL v23 = v7;
              _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Validated %@", buf, 0xCu);
              _MBLog();
            }
          }
          else
          {
            if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            {
              id v19 = [(MBCKFile *)self sha256Signature];
              *(_DWORD *)stat buf = 138412802;
              BOOL v23 = v7;
              __int16 v24 = 2112;
              id v25 = v19;
              __int16 v26 = 2112;
              unsigned __int8 v27 = v12;
              _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Failed to validate the file at %@, %@ != %@", buf, 0x20u);

              id v21 = [(MBCKFile *)self sha256Signature];
              _MBLog();
            }
            if (byte_100482420)
            {
              uint64_t v20 = [(MBCKFile *)self sha256Signature];
              *a4 = +[MBError errorWithCode:1, @"Expected signature %@ got %@ for path %@", v20, v12, v7 format];

              BOOL v9 = 0;
LABEL_24:

              goto LABEL_10;
            }
          }
          BOOL v9 = 1;
          goto LABEL_24;
        }
      }
    }
  }
  BOOL v9 = 1;
LABEL_10:

  return v9;
}

- (BOOL)restoreExtendedAttributesToDestination:(id)a3 withError:(id *)a4
{
  id v5 = a3;
  if (![(MBCKFile *)self isSymbolicLink])
  {
    id v6 = [(MBCKFile *)self extendedAttributes];
    if (v6)
    {
      id v7 = [(MBCKFile *)self restoreState];
      unsigned int v8 = MBGetDefaultLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        contentAsset = self->_contentAsset;
        id v10 = [v7 stashedResourcePath];
        *(_DWORD *)stat buf = 138412802;
        id v18 = self;
        __int16 v19 = 2048;
        uint64_t v20 = contentAsset;
        __int16 v21 = 2112;
        id v22 = v10;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Restoring extended attributes for %@, resourceAsset:%p, stashedResourcePath:%@", buf, 0x20u);

        id v15 = [v7 stashedResourcePath];
        _MBLog();
      }
      id v16 = 0;
      unsigned __int8 v11 = +[MBExtendedAttributes setAttributes:forPathFSR:error:](MBExtendedAttributes, "setAttributes:forPathFSR:error:", v6, [v5 fileSystemRepresentation], &v16);
      id v12 = (CKAsset *)v16;
      if ((v11 & 1) == 0)
      {
        id v13 = MBGetDefaultLog();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)stat buf = 138412546;
          id v18 = self;
          __int16 v19 = 2112;
          uint64_t v20 = v12;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Failed to restore extended attributes for %@: %@", buf, 0x16u);
          _MBLog();
        }
      }
    }
  }
  return 1;
}

- (NSDictionary)extendedAttributes
{
  id v3 = [(MBCKFile *)self restoreState];
  contentAsset = self->_contentAsset;
  if (!contentAsset)
  {
    id v5 = [v3 stashedResourcePath];

    if (!v5) {
      goto LABEL_8;
    }
    contentAsset = self->_contentAsset;
  }
  id v6 = [(CKAsset *)contentAsset fileURL];
  uint64_t v7 = [v3 stashedResourcePath];
  if (v7)
  {
    unsigned int v8 = (void *)v7;
    BOOL v9 = +[NSFileManager defaultManager];
    id v10 = [v3 stashedResourcePath];
    unsigned int v11 = [v9 fileExistsAtPath:v10];

    if (v11)
    {
      id v12 = objc_alloc((Class)NSURL);
      id v13 = [v3 stashedResourcePath];
      id v14 = [v12 initFileURLWithPath:v13];

      id v6 = v14;
    }
  }
  id v15 = [v6 filePathURL];
  id v5 = +[NSDictionary dictionaryWithContentsOfURL:v15];

LABEL_8:
  return (NSDictionary *)v5;
}

- (void)setAbsolutePath:(id)a3
{
  unsigned int v4 = (NSString *)a3;
  obj = self;
  objc_sync_enter(obj);
  fileID = obj->_fileID;
  obj->_fileID = v4;

  LOBYTE(obj->_restoreState) &= ~2u;
  objc_sync_exit(obj);
}

- (BOOL)hasAbsolutePath
{
  return self->_fileID != 0;
}

- (NSString)absolutePath
{
  fileID = self->_fileID;
  if (!fileID)
  {
    unsigned int v4 = MBGetDefaultLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)stat buf = 136315138;
      uint64_t v7 = "_absolutePath";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_FAULT, "nil %s", buf, 0xCu);
      _MBLog();
    }

    fileID = self->_fileID;
  }
  return fileID;
}

- (unsigned)permissions
{
  return WORD2(self->_mbNode.cloneID) & 0xFFF;
}

- (NSString)assetPath
{
  id v3 = self->_rsrcTemporaryPath;
  if (!v3)
  {
    encodedAssetPath = self->_encodedAssetPath;
    if (!encodedAssetPath
      || ([(NSString *)encodedAssetPath decodedAssetPath],
          (id v3 = (NSString *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      id v3 = (NSString *)*(id *)&self->_contentEncodingMethod;
      if (!v3)
      {
        id v3 = [(MBCKFile *)self absolutePath];
      }
    }
  }
  return v3;
}

- (BOOL)isRegularFile
{
  return (WORD2(self->_mbNode.cloneID) & 0xF000) == 0x8000;
}

- (BOOL)isDirectory
{
  return (WORD2(self->_mbNode.cloneID) & 0xF000) == 0x4000;
}

- (BOOL)isSymbolicLink
{
  return (WORD2(self->_mbNode.cloneID) & 0xF000) == 40960;
}

- (BOOL)hasDomain
{
  return self->_domainName != 0;
}

- (MBDomain)domain
{
  domainName = self->_domainName;
  if (!domainName)
  {
    unsigned int v4 = MBGetDefaultLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)stat buf = 136315138;
      uint64_t v7 = "_domain";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_FAULT, "nil %s", buf, 0xCu);
      _MBLog();
    }

    domainName = self->_domainName;
  }
  return (MBDomain *)domainName;
}

- (BOOL)downloaded
{
  return (LOBYTE(self->_restoreState) >> 5) & 1;
}

- (BOOL)deleted
{
  return (LOBYTE(self->_restoreState) >> 4) & 1;
}

- (BOOL)shouldBeBackedUpIgnoringProtectionClass
{
  if ((BYTE6(self->_mbNode.cloneID) | 4) != 7) {
    return 0;
  }
  id v3 = [(MBCKFile *)self domain];
  unsigned int v4 = [v3 relativePathsToBackupIgnoringProtectionClass];

  if ([v4 count])
  {
    id v5 = [(MBCKFile *)self relativePath];
    id v6 = [v5 pathComponents];

    id v7 = [v6 count];
    unint64_t v8 = 1;
    do
    {
      id v10 = objc_msgSend(v6, "subarrayWithRange:", 0, v8 - 1);
      unsigned int v11 = +[NSString pathWithComponents:v10];

      unsigned __int8 v12 = [v4 containsObject:v11];
      if (v12) {
        break;
      }
    }
    while (v8++ <= (unint64_t)v7);
  }
  else
  {
    unsigned __int8 v12 = 0;
  }

  return v12;
}

- (BOOL)isProtected
{
  uint64_t v2 = BYTE6(self->_mbNode.cloneID);
  if (v2 == 255 || !BYTE6(self->_mbNode.cloneID) && [(MBCKFile *)self isDirectory])
  {
    LOBYTE(v4) = 0;
  }
  else
  {
    BOOL v4 = +[MBProtectionClassUtils isProtected:v2];
    if (v4)
    {
      if ((v2 & 0xFFFFFFFB) == 3) {
        LOBYTE(v4) = ![(MBCKFile *)self shouldBeBackedUpIgnoringProtectionClass];
      }
      else {
        LOBYTE(v4) = 1;
      }
    }
  }
  return v4;
}

- (id)aggregateDictionaryGroup
{
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v3 = [(MBCKFile *)self domain];
  BOOL v4 = [v3 relativePathAggregateDictionaryGroups];

  id v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        if ([self->_volumeType hasPrefix:v9])
        {
          unsigned int v11 = [(MBCKFile *)self domain];
          unsigned __int8 v12 = [v11 relativePathAggregateDictionaryGroups];
          id v10 = [v12 objectForKeyedSubscript:v9];

          goto LABEL_11;
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  id v10 = 0;
LABEL_11:

  return v10;
}

- (BOOL)hasResources
{
  if (self->_contentAsset) {
    return 1;
  }
  if (!self->_fileID) {
    return 0;
  }
  BOOL v4 = [(MBCKFile *)self absolutePath];
  id v10 = 0;
  BOOL v2 = +[MBExtendedAttributes hasAttributesForPath:v4 error:&v10];
  id v5 = v10;

  if (!v2 && v5)
  {
    id v6 = MBGetDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = [(MBCKFile *)self absolutePath];
      *(_DWORD *)stat buf = 138412546;
      unsigned __int8 v12 = v7;
      __int16 v13 = 2112;
      id v14 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Failed to list xattrs at %@: %@", buf, 0x16u);

      uint64_t v9 = [(MBCKFile *)self absolutePath];
      _MBLog();
    }
  }

  return v2;
}

- (unint64_t)changeType
{
  return [(MBCKFile *)self changeTypeForFullBackup:0];
}

- (unint64_t)changeTypeForFullBackup:(BOOL)a3
{
  if (((uint64_t)self->_restoreState & 0x10) == 0)
  {
    id v5 = [(MBCKModel *)self cache];
    id v6 = v5;
    if (a3)
    {
      uint64_t v7 = [(MBCKFile *)self domainName];
      unint64_t v8 = [(MBCKFile *)self relativePath];
      id v34 = 0;
      uint64_t v9 = [v6 uploadedFileInPendingSnapshotWithDomainName:v7 relativePath:v8 error:&v34];
      id v10 = v34;

      if (v10)
      {
        unsigned int v11 = MBGetDefaultLog();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)stat buf = 138412546;
          unsigned __int8 v37 = v9;
          __int16 v38 = 2112;
          id v39 = v10;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Error fetching uploaded file in pending snapshot %@: %@", buf, 0x16u);
          id v32 = v9;
          id v33 = v10;
LABEL_10:
          _MBLog();
          goto LABEL_11;
        }
        goto LABEL_11;
      }
    }
    else
    {
      id v35 = 0;
      uint64_t v9 = [v5 lastBackedUpFileForFile:self error:&v35];
      id v10 = v35;

      if (v10)
      {
        unsigned int v11 = MBGetDefaultLog();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)stat buf = 138412546;
          unsigned __int8 v37 = v9;
          __int16 v38 = 2112;
          id v39 = v10;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Error fetching last modified version of file %@: %@", buf, 0x16u);
          id v32 = v9;
          id v33 = v10;
          goto LABEL_10;
        }
LABEL_11:
      }
    }
    if (!v9
      || ([v9 encryptionKey],
          __int16 v13 = (NSData *)objc_claimAutoreleasedReturnValue(),
          resources = self->_resources,
          self->_resources = v13,
          resources,
          ([v9 deleted] & 1) != 0))
    {
      unint64_t v12 = 1;
LABEL_40:

      return v12;
    }
    long long v15 = [(MBCKFile *)self modified];
    long long v16 = [v9 modified];
    unsigned int v17 = [v15 isEqualToDate:v16];

    if (v17)
    {
      id v18 = [(MBCKFile *)self fileType];
      if (v18 == [v9 fileType])
      {
        if (v18 == (id)2)
        {
          uint64_t v21 = [(MBCKFile *)self linkTarget];
          uint64_t v22 = [v9 linkTarget];
          BOOL v23 = (void *)v22;
          if (v21 | v22 && (!v22 || ![(id)v21 isEqualToString:v22]))
          {

            goto LABEL_39;
          }
        }
        else if (!v18 && ![(MBCKFile *)self hasContentEncodingMethod])
        {
          if ([v9 sizeBeforeCopy])
          {
            id v19 = [(MBCKFile *)self size];
            if (v19 != [v9 sizeBeforeCopy] && -[MBCKFile isSQLiteFile](self, "isSQLiteFile")) {
              goto LABEL_39;
            }
          }
          if ((objc_msgSend(v9, "hasContentEncodingMethod", v32, v33) & 1) == 0)
          {
            id v20 = [(MBCKFile *)self size];
            if (v20 != [v9 size] && !-[MBCKFile isSQLiteFile](self, "isSQLiteFile")) {
              goto LABEL_39;
            }
          }
        }
        unsigned int v24 = [(MBCKFile *)self permissions];
        if (v24 == [v9 permissions])
        {
          unsigned int v25 = [(MBCKFile *)self groupID];
          if (v25 == [v9 groupID])
          {
            unsigned int v26 = [(MBCKFile *)self userID];
            if (v26 == [v9 userID])
            {
              unsigned __int8 v27 = [(MBCKFile *)self birth];
              BOOL v28 = [v9 birth];
              unsigned int v29 = [v27 isEqualToDate:v28];

              if (v29)
              {
                if ((unint64_t)v18 > 1
                  || (int v30 = BYTE6(self->_mbNode.cloneID), v30 == [v9 protectionClass]))
                {
                  unint64_t v12 = 0;
                  goto LABEL_40;
                }
              }
            }
          }
        }
      }
    }
LABEL_39:
    unint64_t v12 = 2;
    goto LABEL_40;
  }
  return 3;
}

- (NSString)domainName
{
  return (NSString *)*(id *)&self->_mbNode.mode;
}

- (NSString)fileID
{
  manifest = self->_manifest;
  if (!manifest)
  {
    id v5 = +[NSAssertionHandler currentHandler];
    id v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[MBCKFile fileID]");
    [v5 handleFailureInFunction:v6, @"MBCKFile.m", 2078, @"nil _fileID, MBCKFile is not fully built" file lineNumber description];

    manifest = self->_manifest;
  }
  return (NSString *)manifest;
}

- (id)fileIDWithHmacKey:(id)a3
{
  id v5 = a3;
  id v6 = [(MBCKFile *)self manifest];
  uint64_t v7 = [v6 snapshotID];

  if (!v7) {
    __assert_rtn("-[MBCKFile fileIDWithHmacKey:]", "MBCKFile.m", 2088, "snapshotID && \"File is missing snapshot ID\"");
  }
  id v8 = objc_alloc((Class)NSString);
  uint64_t v9 = [(MBCKFile *)self domainName];
  id v10 = [(MBCKFile *)self relativePath];
  id v11 = [v8 initWithFormat:@"%@:%@", v9, v10];

  unint64_t v12 = +[MBDigestSHA1 sha1HmacForString:v11 key:v5];
  __int16 v13 = [v12 base64EncodedStringWithOptions:0];

  if (!v13) {
    __assert_rtn("-[MBCKFile fileIDWithHmacKey:]", "MBCKFile.m", 2092, "pathHMAC && \"File is missing path hash\"");
  }
  if (((uint64_t)self->_restoreState & 0x10) != 0)
  {
    id v15 = [objc_alloc((Class)NSString) initWithFormat:@"%@:%@:D", v7, v13];
  }
  else
  {
    id v14 = [(MBCKFile *)self attributeDataTruncatedHashWithError:0];
    if (!v14)
    {
      unsigned int v17 = +[NSAssertionHandler currentHandler];
      [v17 handleFailureInMethod:a2 object:self file:@"MBCKFile.m" lineNumber:2099 description:@"File is missing truncated hash"];
    }
    id v15 = [objc_alloc((Class)NSString) initWithFormat:@"%@:%@:%llu:%@", v7, v13, -[MBCKFile aggregateSize](self, "aggregateSize"), v14];
  }
  return v15;
}

- (void)setFileID:(id)a3
{
  id v6 = a3;
  if ([v6 hasPrefix:@"F:"])
  {
    BOOL v4 = [v6 substringFromIndex:objc_msgSend(@"F:", "length")];
  }
  else
  {
    BOOL v4 = (MBCKManifest *)v6;
  }
  manifest = self->_manifest;
  self->_manifest = v4;
}

- (unint64_t)aggregateSize
{
  if ([(MBCKFile *)self isProtected]
    && ([(MBCKFile *)self encryptionKey],
        id v3 = objc_claimAutoreleasedReturnValue(),
        v3,
        v3))
  {
    resourceAsset = self->_resourceAsset;
  }
  else
  {
    resourceAsset = [(MBCKFile *)self size];
  }
  return (unint64_t)resourceAsset + [(MBCKFile *)self resourcesSize];
}

- (unint64_t)sizeFromFileIDWithDefaultValue:(unint64_t)a3
{
  BOOL v4 = [(MBCKFile *)self fileID];
  id v5 = v4;
  if (v4)
  {
    id v6 = [v4 componentsSeparatedByString:@":"];
    id v7 = [v6 count];
    if ((unint64_t)v7 >= 3)
    {
      if (v7 != (id)3
        || ([v6 lastObject],
            id v8 = objc_claimAutoreleasedReturnValue(),
            unsigned __int8 v9 = [v8 isEqualToString:@"D"],
            v8,
            (v9 & 1) == 0))
      {
        id v10 = [v6 objectAtIndexedSubscript:2];
        *__error() = 0;
        id v11 = v10;
        unint64_t v12 = strtoull((const char *)[v11 UTF8String], 0, 10);
        if (v12 + 1 > 1 || !*__error()) {
          a3 = v12;
        }
      }
    }
  }
  return a3;
}

- (id)keybagUUIDData
{
  id v3 = [(MBCKFile *)self encryptionKey];

  if (v3)
  {
    BOOL v4 = [(MBCKFile *)self encryptionKey];
    int v5 = MKBBackupCopyBackupKeyUUID();

    if (v5)
    {
      id v6 = MBGetDefaultLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      {
        id v7 = [(MBCKFile *)self relativePath];
        *(_DWORD *)stat buf = 138412290;
        id v11 = v7;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_FAULT, "Failed to get UUID from encryption key for file %@", buf, 0xCu);

        unsigned __int8 v9 = [(MBCKFile *)self relativePath];
        _MBLog();
      }
    }
  }
  return 0;
}

- (NSString)keybagUUIDString
{
  BOOL v2 = [(MBCKFile *)self keybagUUIDData];
  id v3 = [v2 base64EncodedStringWithOptions:0];

  return (NSString *)v3;
}

- (void)saveToCacheWithCompletion:(id)a3
{
  BOOL v4 = (void (**)(id, id))a3;
  int v5 = [(MBCKModel *)self cache];
  id v6 = [(MBCKFile *)self manifest];
  id v7 = [v5 addFile:self toManifest:v6];

  v4[2](v4, v7);
}

- (id)_getRecordIDString
{
  id v3 = objc_alloc((Class)NSString);
  BOOL v4 = [(MBCKFile *)self fileID];
  id v5 = [v3 initWithFormat:@"%@%@", @"F:", v4];

  return v5;
}

- (id)recordType
{
  return +[MBCKFile recordType];
}

+ (id)recordType
{
  return @"File";
}

- (unint64_t)recordZone
{
  return 1;
}

- (id)attributes
{
  unint64_t v4 = [(MBCKFile *)self size];
  if (v4 >= (unint64_t)+[MBFileSystemManager fileSystemCapacity])
  {
    id v20 = +[NSAssertionHandler currentHandler];
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"MBCKFile.m", 2183, @"File size (%llu) exceeds filesystem capacity (%llu)", -[MBCKFile size](self, "size"), +[MBFileSystemManager fileSystemCapacity](MBFileSystemManager, "fileSystemCapacity"));
  }
  if (((uint64_t)self->_restoreState & 0x10) != 0)
  {
    v27[0] = @"relativePath";
    __int16 v13 = [(MBCKFile *)self relativePath];
    v27[1] = @"domain";
    v28[0] = v13;
    id v18 = [(MBCKFile *)self domainName];
    v28[1] = v18;
    id v14 = +[NSDictionary dictionaryWithObjects:v28 forKeys:v27 count:2];
    goto LABEL_11;
  }
  SEL v22 = a2;
  v25[0] = @"relativePath";
  unsigned int v24 = [(MBCKFile *)self relativePath];
  v26[0] = v24;
  v25[1] = @"domain";
  BOOL v23 = [(MBCKFile *)self domainName];
  v26[1] = v23;
  v25[2] = @"birth";
  id v5 = [(MBCKFile *)self birth];
  v26[2] = v5;
  v25[3] = @"modified";
  id v6 = [(MBCKFile *)self modified];
  v26[3] = v6;
  v25[4] = @"statusChanged";
  id v7 = [(MBCKFile *)self statusChanged];
  v26[4] = v7;
  v25[5] = @"size";
  id v8 = +[NSNumber numberWithLongLong:[(MBCKFile *)self size]];
  v26[5] = v8;
  v25[6] = @"groupID";
  unsigned __int8 v9 = +[NSNumber numberWithInt:[(MBCKFile *)self groupID]];
  v26[6] = v9;
  v25[7] = @"userID";
  id v10 = +[NSNumber numberWithInt:[(MBCKFile *)self userID]];
  v26[7] = v10;
  v25[8] = @"mode";
  id v11 = +[NSNumber numberWithInt:[(MBCKFile *)self permissions]];
  v26[8] = v11;
  v25[9] = @"sizeBeforeCopy";
  unint64_t v12 = +[NSNumber numberWithLongLong:[(MBCKFile *)self sizeBeforeCopy]];
  v26[9] = v12;
  __int16 v13 = +[NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:10];

  id v14 = [v13 mutableCopy];
  if ([(MBCKFile *)self isSymbolicLink])
  {
    id v15 = [(MBCKFile *)self linkTarget];

    if (!v15)
    {
      uint64_t v21 = +[NSAssertionHandler currentHandler];
      [v21 handleFailureInMethod:v22 object:self file:@"MBCKFile.m" lineNumber:2208 description:@"File (symbolic link) does not have a link target"];
    }
    long long v16 = [(MBCKFile *)self linkTarget];
    [v14 setObject:v16 forKeyedSubscript:@"linkTarget"];
  }
  unsigned int v17 = [(MBCKFile *)self encryptionKey];

  if (v17)
  {
    id v18 = [(MBCKFile *)self encryptionKey];
    [v14 setObject:v18 forKeyedSubscript:@"encryptionKey"];
LABEL_11:
  }
  return v14;
}

- (id)attributeDataHashWithAttributes:(id)a3 error:(id *)a4
{
  id v4 = a3;
  id v5 = objc_opt_new();
  CFStringRef v36 = [v4 allKeys];
  [v36 sortedArrayUsingComparator:&stru_100413340];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = [v6 countByEnumeratingWithState:&v38 objects:v44 count:16];
  if (v7)
  {
    id v8 = v7;
    unsigned __int8 v9 = ATClientController_ptr;
    CFStringRef v10 = @"%@:%s;";
    uint64_t v11 = *(void *)v39;
    id v37 = v4;
    while (2)
    {
      unint64_t v12 = 0;
      do
      {
        if (*(void *)v39 != v11) {
          objc_enumerationMutation(v6);
        }
        uint64_t v13 = *(void *)(*((void *)&v38 + 1) + 8 * (void)v12);
        id v14 = [v4 objectForKeyedSubscript:v13];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          objc_msgSend(v5, "appendFormat:", v10, v13, objc_msgSend(v14, "UTF8String"));
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            [v5 appendFormat:@"%@:%lld;", v13, objc_msgSend(v14, "longLongValue")];
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              [v14 timeIntervalSinceReferenceDate];
              [v5 appendFormat:@"%@:%.3lf;", v13, v15];
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                unsigned int v24 = MBGetDefaultLog();
                if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
                {
                  *(_DWORD *)stat buf = 138412290;
                  uint64_t v43 = v14;
                  _os_log_fault_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_FAULT, "Unknown attribute data value %@", buf, 0xCu);
                }

                id v32 = sub_1001E6FFC(@"Unknown attribute data value %@", v25, v26, v27, v28, v29, v30, v31, (uint64_t)v14);
                id v33 = v32;
                BOOL v23 = v36;
                if (a4) {
                  *a4 = v32;
                }

                SEL v22 = 0;
                uint64_t v21 = v6;
                goto LABEL_23;
              }
              [v14 base64EncodedStringWithOptions:49];
              long long v16 = v9;
              id v17 = v6;
              id v19 = v18 = v10;
              [v5 appendFormat:@"%@:%@;", v13, v19];

              CFStringRef v10 = v18;
              id v6 = v17;
              unsigned __int8 v9 = v16;
              id v4 = v37;
            }
          }
        }

        unint64_t v12 = (char *)v12 + 1;
      }
      while (v8 != v12);
      id v20 = [v6 countByEnumeratingWithState:&v38 objects:v44 count:16];
      id v8 = v20;
      if (v20) {
        continue;
      }
      break;
    }
  }

  uint64_t v21 = [v5 dataUsingEncoding:4];
  SEL v22 = +[MBDigest sha1ForData:v21];
  BOOL v23 = v36;
LABEL_23:

  return v22;
}

- (id)attributeDataTruncatedHashWithError:(id *)a3
{
  id v6 = [(MBCKFile *)self attributes];
  id v7 = [(MBCKFile *)self attributeDataHashWithAttributes:v6 error:a3];

  if (!v7)
  {
    uint64_t v11 = +[NSAssertionHandler currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"MBCKFile.m" lineNumber:2262 description:@"attributeHash should not be nil"];
  }
  id v8 = [v7 base64EncodedStringWithOptions:0];
  unsigned __int8 v9 = objc_msgSend(v8, "substringWithRange:", 0, 4);

  return v9;
}

- (id)attributeDataPlistWithError:(id *)a3
{
  id v4 = [(MBCKFile *)self attributes];
  id v5 = +[NSPropertyListSerialization dataWithPropertyList:v4 format:200 options:0 error:a3];

  return v5;
}

- (id)attributeDataArchiveWithError:(id *)a3
{
  id v4 = objc_alloc_init(MBCKFileAttributesArchive);
  [(MBCKFileAttributesArchive *)v4 setRelativePath:self->_volumeType];
  if (((uint64_t)self->_restoreState & 0x10) == 0)
  {
    [(MBCKFileAttributesArchive *)v4 setLinkTarget:self->_relativePath];
    int64_t birth = self->_mbNode.birth;
    if (birth) {
      [(MBCKFileAttributesArchive *)v4 setBirth:(birth - 978307200)];
    }
    int64_t modified = self->_mbNode.modified;
    if (modified) {
      [(MBCKFileAttributesArchive *)v4 setModified:(modified - 978307200)];
    }
    int64_t statusChanged = self->_mbNode.statusChanged;
    if (statusChanged) {
      [(MBCKFileAttributesArchive *)v4 setStatusChanged:(statusChanged - 978307200)];
    }
    if (self->_mbNode.fileSize)
    {
      char restoreState = (char)self->_restoreState;
      unsigned __int8 v9 = [(MBCKFile *)self encryptionKey];
      CFStringRef v10 = v9;
      if ((restoreState & 8) != 0)
      {
        if (v9) {
          __assert_rtn("-[MBCKFile attributeDataArchiveWithError:]", "MBCKFile.m", 2299, "!self.encryptionKey");
        }
        [(MBCKFileAttributesArchive *)v4 setIsMMCSEncryptedOnly:1];
      }
      else
      {

        if (v10)
        {
          uint64_t v11 = [(MBCKFile *)self encryptionKey];
          [(MBCKFileAttributesArchive *)v4 setEncryptionKey:v11];
        }
      }
    }
    [(MBCKFileAttributesArchive *)v4 setSize:self->_mbNode.fileSize];
    [(MBCKFileAttributesArchive *)v4 setGroupID:self->_mbNode.groupID];
    [(MBCKFileAttributesArchive *)v4 setUserID:self->_mbNode.userID];
    [(MBCKFileAttributesArchive *)v4 setMode:WORD2(self->_mbNode.cloneID)];
    [(MBCKFileAttributesArchive *)v4 setSourceDeviceInode:self->_sha256Signature];
    if (self->_encryptedSize) {
      -[MBCKFileAttributesArchive setSizeBeforeCopy:](v4, "setSizeBeforeCopy:");
    }
    [(MBCKFileAttributesArchive *)v4 setSha256Signature:self->_encryptionKey];
    uint64_t flags = self->_mbNode.flags;
    if (flags)
    {
      [(MBCKFileAttributesArchive *)v4 setFlags:self->_mbNode.flags];
      uint64_t v13 = MBGetDefaultLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        fileID = self->_fileID;
        domainName = self->_domainName;
        *(_DWORD *)stat buf = 67109634;
        int v24 = flags;
        __int16 v25 = 2114;
        uint64_t v26 = fileID;
        __int16 v27 = 2112;
        uint64_t v28 = domainName;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Including BSD flags (0x%x) for %{public}@ (%@)", buf, 0x1Cu);
        uint64_t v21 = self->_fileID;
        SEL v22 = self->_domainName;
        uint64_t v20 = flags;
        _MBLog();
      }
    }
    if ([(MBCKFile *)self hasContentEncodingMethod])
    {
      int sqliteTemporaryDirectory_low = LOBYTE(self->_sqliteTemporaryDirectory);
      if (!LOBYTE(self->_sqliteTemporaryDirectory)) {
        __assert_rtn("-[MBCKFile attributeDataArchiveWithError:]", "MBCKFile.m", 2320, "_contentEncodingMethod != MBFileEncodingMethodUnspecified");
      }
      if (sqliteTemporaryDirectory_low == 255) {
        __assert_rtn("-[MBCKFile attributeDataArchiveWithError:]", "MBCKFile.m", 2321, "_contentEncodingMethod != MBFileEncodingMethodDefault");
      }
      [(MBCKFileAttributesArchive *)v4 setContentEncodingMethod:(char)sqliteTemporaryDirectory_low];
      if ([(MBCKFile *)self hasContentCompressionMethod])
      {
        int v17 = BYTE1(self->_sqliteTemporaryDirectory);
        if (v17 != 255)
        {
          if (!BYTE1(self->_sqliteTemporaryDirectory)) {
            __assert_rtn("-[MBCKFile attributeDataArchiveWithError:]", "MBCKFile.m", 2324, "_contentCompressionMethod != MBFileCompressionMethodUnspecified");
          }
          [(MBCKFileAttributesArchive *)v4 setContentCompressionMethod:(char)v17];
        }
      }
    }
  }
  CFStringRef v18 = [(MBCKFileAttributesArchive *)v4 data];

  return v18;
}

- (id)attributeDataWithError:(id *)a3
{
  return [(MBCKFile *)self attributeDataArchiveWithError:a3];
}

- (BOOL)refreshAttributesPlistWithData:(id)a3 error:(id *)a4
{
  id v34 = 0;
  id v6 = +[NSPropertyListSerialization propertyListWithData:a3 options:0 format:0 error:&v34];
  id v7 = v34;
  id v8 = v7;
  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unint64_t v9 = [v6 objectForKeyedSubscript:@"relativePath"];
      unint64_t volumeType = (void *)self->_volumeType;
      self->_unint64_t volumeType = v9;

      uint64_t v11 = [v6 objectForKeyedSubscript:@"domain"];
      unint64_t v12 = *(void **)&self->_mbNode.mode;
      *(void *)&self->_mbNode.mode = v11;

      uint64_t v13 = [v6 objectForKeyedSubscript:@"birth"];
      [v13 timeIntervalSince1970];
      self->_mbNode.int64_t birth = (uint64_t)v14;

      uint64_t v15 = [v6 objectForKeyedSubscript:@"modified"];
      [v15 timeIntervalSince1970];
      self->_mbNode.int64_t modified = (uint64_t)v16;

      int v17 = [v6 objectForKeyedSubscript:@"statusChanged"];
      [v17 timeIntervalSince1970];
      self->_mbNode.int64_t statusChanged = (uint64_t)v18;

      id v19 = [v6 objectForKeyedSubscript:@"size"];
      self->_mbNode.fileSize = (int64_t)[v19 longLongValue];

      uint64_t v20 = [v6 objectForKeyedSubscript:@"sizeBeforeCopy"];
      self->_encryptedSize = (unint64_t)[v20 longLongValue];

      uint64_t v21 = [v6 objectForKeyedSubscript:@"groupID"];
      self->_mbNode.groupID = [v21 intValue];

      SEL v22 = [v6 objectForKeyedSubscript:@"userID"];
      self->_mbNode.userID = [v22 intValue];

      BOOL v23 = [v6 objectForKeyedSubscript:@"mode"];
      WORD2(self->_mbNode.cloneID) = (unsigned __int16)[v23 intValue];

      int v24 = [v6 objectForKeyedSubscript:@"linkTarget"];
      relativePath = self->_relativePath;
      self->_relativePath = v24;

      uint64_t v26 = [v6 objectForKeyedSubscript:@"encryptionKey"];
      resources = self->_resources;
      self->_resources = v26;

      uint64_t v28 = [v6 objectForKeyedSubscript:@"sha256Signature"];
      encryptionKey = self->_encryptionKey;
      self->_encryptionKey = v28;

      uint64_t v30 = [v6 objectForKeyedSubscript:@"sourceDeviceInode"];
      self->_sha256Signature = (NSData *)[v30 longLongValue];

      if (!a4)
      {
        BOOL v32 = 1;
        goto LABEL_13;
      }
      id v31 = v8;
      BOOL v32 = 1;
      goto LABEL_10;
    }
    if (a4)
    {
      id v31 = +[MBError errorWithCode:1 format:@"Invalid plist"];
      goto LABEL_9;
    }
LABEL_11:
    BOOL v32 = 0;
    goto LABEL_13;
  }
  if (!a4) {
    goto LABEL_11;
  }
  id v31 = v7;
LABEL_9:
  BOOL v32 = 0;
LABEL_10:
  *a4 = v31;
LABEL_13:

  return v32;
}

- (BOOL)refreshAttributesArchiveWithData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = [[MBCKFileAttributesArchive alloc] initWithData:v5];

  if (v6)
  {
    if ([(MBCKFileAttributesArchive *)v6 hasRelativePath])
    {
      unint64_t v7 = [(MBCKFileAttributesArchive *)v6 relativePath];
      unint64_t volumeType = (void *)self->_volumeType;
      self->_unint64_t volumeType = v7;
    }
    if ([(MBCKFileAttributesArchive *)v6 hasLinkTarget])
    {
      unint64_t v9 = [(MBCKFileAttributesArchive *)v6 linkTarget];
      relativePath = self->_relativePath;
      self->_relativePath = v9;
    }
    if ([(MBCKFileAttributesArchive *)v6 hasBirth]) {
      self->_mbNode.int64_t birth = [(MBCKFileAttributesArchive *)v6 birth] + 978307200;
    }
    if ([(MBCKFileAttributesArchive *)v6 hasModified]) {
      self->_mbNode.int64_t modified = [(MBCKFileAttributesArchive *)v6 modified] + 978307200;
    }
    if ([(MBCKFileAttributesArchive *)v6 hasStatusChanged]) {
      self->_mbNode.int64_t statusChanged = [(MBCKFileAttributesArchive *)v6 statusChanged] + 978307200;
    }
    LOBYTE(self->_restoreState) &= ~8u;
    if ([(MBCKFileAttributesArchive *)v6 hasIsMMCSEncryptedOnly])
    {
      if ([(MBCKFileAttributesArchive *)v6 isMMCSEncryptedOnly]) {
        int v11 = 8;
      }
      else {
        int v11 = 0;
      }
      LOBYTE(self->_restoreState) = (uint64_t)self->_restoreState & 0xF7 | v11;
      if (v11) {
        goto LABEL_17;
      }
    }
    else if (((uint64_t)self->_restoreState & 8) != 0)
    {
LABEL_17:
      resources = self->_resources;
      self->_resources = 0;
      goto LABEL_24;
    }
    if (![(MBCKFileAttributesArchive *)v6 hasEncryptionKey])
    {
LABEL_25:
      if ([(MBCKFileAttributesArchive *)v6 hasSize]) {
        int64_t v16 = [(MBCKFileAttributesArchive *)v6 size];
      }
      else {
        int64_t v16 = 0;
      }
      self->_mbNode.fileSize = v16;
      unsigned int v17 = [(MBCKFileAttributesArchive *)v6 hasGroupID];
      if (v17) {
        unsigned int v17 = [(MBCKFileAttributesArchive *)v6 groupID];
      }
      self->_mbNode.groupID = v17;
      unsigned int v18 = [(MBCKFileAttributesArchive *)v6 hasUserID];
      if (v18) {
        unsigned int v18 = [(MBCKFileAttributesArchive *)v6 userID];
      }
      self->_mbNode.userID = v18;
      unsigned int v19 = [(MBCKFileAttributesArchive *)v6 hasMode];
      if (v19) {
        LOWORD(v19) = (unsigned __int16)[(MBCKFileAttributesArchive *)v6 mode];
      }
      WORD2(self->_mbNode.cloneID) = v19;
      if ([(MBCKFileAttributesArchive *)v6 hasSizeBeforeCopy]) {
        int64_t v20 = [(MBCKFileAttributesArchive *)v6 sizeBeforeCopy];
      }
      else {
        int64_t v20 = 0;
      }
      self->_encryptedSize = v20;
      if ([(MBCKFileAttributesArchive *)v6 hasFlags])
      {
        unsigned int v21 = [(MBCKFileAttributesArchive *)v6 flags];
        self->_mbNode.uint64_t flags = v21;
        if ((v21 & 0x40000000) != 0) {
          self->_mbNode.fileSize = 0;
        }
      }
      else
      {
        self->_mbNode.uint64_t flags = 0;
      }
      if ([(MBCKFileAttributesArchive *)v6 hasSourceDeviceInode]) {
        SEL v22 = [(MBCKFileAttributesArchive *)v6 sourceDeviceInode];
      }
      else {
        SEL v22 = 0;
      }
      self->_sha256Signature = v22;
      if ([(MBCKFileAttributesArchive *)v6 hasSha256Signature])
      {
        BOOL v23 = [(MBCKFileAttributesArchive *)v6 sha256Signature];
        encryptionKey = self->_encryptionKey;
        self->_encryptionKey = v23;
      }
      if ([(MBCKFileAttributesArchive *)v6 hasContentEncodingMethod])
      {
        LOBYTE(self->_sqliteTemporaryDirectory) = [(MBCKFileAttributesArchive *)v6 contentEncodingMethod];
        if ([(MBCKFileAttributesArchive *)v6 hasContentCompressionMethod]) {
          BYTE1(self->_sqliteTemporaryDirectory) = [(MBCKFileAttributesArchive *)v6 contentCompressionMethod];
        }
      }
      goto LABEL_49;
    }
    uint64_t v15 = [(MBCKFileAttributesArchive *)v6 encryptionKey];
    resources = self->_resources;
    self->_resources = v15;
LABEL_24:

    goto LABEL_25;
  }
  uint64_t v13 = MBGetDefaultLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    double v14 = [0 dictionaryRepresentation];
    *(_DWORD *)stat buf = 138412290;
    uint64_t v28 = v14;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Unable to refresh attributes: %@", buf, 0xCu);

    uint64_t v26 = [0 dictionaryRepresentation];
    _MBLog();
  }
LABEL_49:

  return v6 != 0;
}

- (BOOL)refreshAttributesWithData:(id)a3 error:(id *)a4
{
  id v7 = a3;
  if ((unint64_t)[v7 length] >= 6
    && ((id v8 = v7, v9 = (unsigned __int16 *)[v8 bytes],
                                          *(_DWORD *)v9 == 1768714338)
      ? (BOOL v10 = v9[2] == 29811)
      : (BOOL v10 = 0),
        v10 && [(MBCKFile *)self refreshAttributesPlistWithData:v8 error:a4])
    || [(MBCKFile *)self refreshAttributesArchiveWithData:v7 error:a4])
  {
    BOOL v11 = 1;
  }
  else
  {
    unint64_t v12 = +[NSAssertionHandler currentHandler];
    [v12 handleFailureInMethod:a2, self, @"MBCKFile.m", 2437, @"Unable to refresh attributes: %@", v7 object file lineNumber description];

    BOOL v11 = 0;
  }

  return v11;
}

- (id)recordRepresentation
{
  v65.receiver = self;
  v65.super_class = (Class)MBCKFile;
  id v4 = [(MBCKModel *)&v65 recordRepresentation];
  [v4 setUseLightweightPCS:1];
  id v5 = [(MBCKFile *)self attributeDataWithError:0];
  if (!v5)
  {
    char v59 = +[NSAssertionHandler currentHandler];
    [v59 handleFailureInMethod:a2 object:self file:@"MBCKFile.m" lineNumber:2474 description:@"Failed to serialize file attribute data"];
  }
  id v6 = [v4 encryptedValues];
  [v6 setObject:v5 forKeyedSubscript:@"encryptedAttributes"];

  id v7 = +[NSNumber numberWithUnsignedInteger:[(MBCKFile *)self fileType]];
  [v4 setObject:v7 forKeyedSubscript:@"fileType"];

  if ([(MBCKFile *)self isRegularFile])
  {
    id v8 = [self->_volumeType pathExtension];
    [v4 setObject:v8 forKeyedSubscript:@"extension"];
  }
  else
  {
    [v4 setObject:0 forKeyedSubscript:@"extension"];
  }
  if (((uint64_t)self->_restoreState & 0x10) == 0)
  {
    if (qword_100482448 != -1) {
      dispatch_once(&qword_100482448, &stru_100413360);
    }
    uint64_t v9 = BYTE6(self->_mbNode.cloneID);
    if ([(MBCKFile *)self hasResources] && self->_temporaryPath)
    {
      id v10 = objc_alloc((Class)CKAsset);
      BOOL v11 = +[NSURL fileURLWithPath:self->_temporaryPath];
      id v12 = [v10 initWithFileURL:v11];

      uint64_t v13 = [v12 assetTransferOptions];
      if (v13)
      {
        double v14 = [v12 assetTransferOptions];
        uint64_t v15 = [v14 useMMCSEncryptionV2];
        if ([v15 BOOLValue]) {
          __assert_rtn("-[MBCKFile recordRepresentation]", "MBCKFile.m", 2490, "!rsrcContents.assetTransferOptions || !rsrcContents.assetTransferOptions.useMMCSEncryptionV2.BOOLValue");
        }
      }
      [v4 setObject:v12 forKeyedSubscript:@"resources"];
    }
    if ([(MBCKFile *)self isRegularFile] || [(MBCKFile *)self isDirectory])
    {
      int64_t v16 = +[NSNumber numberWithInt:v9];
      [v4 setObject:v16 forKeyedSubscript:@"protectionClass"];
    }
    if ([(MBCKFile *)self isRegularFile]
      && [(MBCKFile *)self size]
      && ![(MBCKFile *)self isDataless])
    {
      id v17 = objc_alloc((Class)CKAsset);
      unsigned int v18 = [(MBCKFile *)self assetPath];
      unsigned int v19 = +[NSURL fileURLWithPath:v18];
      id v20 = [v17 initWithFileURL:v19];

      uint64_t v62 = [(MBCKFile *)self encryptionKey];
      char restoreState = (char)self->_restoreState;
      unsigned int v64 = +[MBProtectionClassUtils canOpenWhenLocked:v9];
      unsigned __int8 v22 = [(MBCKFile *)self isProtected];
      if ((v22 & 1) == 0)
      {
        BOOL v23 = [(MBCKFile *)self domainName];
        if ([v23 isEqualToString:@"CameraRollDomain"])
        {
          unsigned int v24 = [(MBCKFile *)self shouldBeBackedUpIgnoringProtectionClass];

          unsigned int v25 = v24;
          if (v24)
          {
            uint64_t v26 = (void *)v62;
            unsigned int v27 = v64;
            if ((restoreState & 8) == 0) {
              __assert_rtn("-[MBCKFile recordRepresentation]", "MBCKFile.m", 2505, "!useMMVCSv1 || isMMCSEncryptedOnly");
            }
LABEL_29:
            BOOL v28 = (restoreState & 8) == 0;
            if ((restoreState & 8) != 0) {
              char v29 = v27;
            }
            else {
              char v29 = 1;
            }
            if ((v29 & 1) == 0) {
              __assert_rtn("-[MBCKFile recordRepresentation]", "MBCKFile.m", 2506, "!isMMCSEncryptedOnly || canBeBackedUpWhenLocked");
            }
            if (v26) {
              unsigned int v30 = v27;
            }
            else {
              unsigned int v30 = 0;
            }
            if (v30 == 1) {
              __assert_rtn("-[MBCKFile recordRepresentation]", "MBCKFile.m", 2507, "!encryptionKey || !canBeBackedUpWhenLocked");
            }
            char v63 = restoreState;
            int v31 = restoreState & 8;
            if (!v26 && (restoreState & 8) == 0) {
              __assert_rtn("-[MBCKFile recordRepresentation]", "MBCKFile.m", 2508, "isMMCSEncryptedOnly || encryptionKey");
            }
            BOOL v32 = v20;
            if (v26 && v31) {
              __assert_rtn("-[MBCKFile recordRepresentation]", "MBCKFile.m", 2509, "!isMMCSEncryptedOnly || !encryptionKey");
            }
            unsigned __int8 v33 = v9 & 0xFB;
            if ((v9 & 0xFFFFFFFB) == 3) {
              char v34 = v22;
            }
            else {
              char v34 = 1;
            }
            if ((v34 & 1) == 0)
            {
              unsigned int v61 = v25;
              id v35 = MBGetDefaultLog();
              if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
              {
                CFStringRef v36 = [(MBCKFile *)self relativePath];
                *(_DWORD *)stat buf = 138412290;
                id v71 = v36;
                _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEBUG, "Treating file with pc C or Cx as having pc D: %@", buf, 0xCu);

                uint64_t v60 = [(MBCKFile *)self relativePath];
                _MBLog();

                uint64_t v26 = (void *)v62;
              }

              unsigned int v25 = v61;
            }
            if (((v25 | v28) & 1) == 0)
            {
              int v45 = v33;
              long long v38 = v32;
              if (v45 == 3) {
                [v32 setItemTypeHint:@"fxd"];
              }
              objc_msgSend(v32, "setAssetTransferOptions:", qword_100482440, v60);
              int v46 = [v32 assetTransferOptions];
              id v47 = [v46 useMMCSEncryptionV2];
              char v48 = v63;
              if (([v47 BOOLValue] & 1) == 0) {
                __assert_rtn("-[MBCKFile recordRepresentation]", "MBCKFile.m", 2520, "contents.assetTransferOptions.useMMCSEncryptionV2.BOOLValue");
              }
              goto LABEL_69;
            }
            char v37 = v22 ^ 1;
            long long v38 = v32;
            if (!v26) {
              char v37 = 1;
            }
            if (v37)
            {
              int v46 = [v32 assetTransferOptions];
              if (!v46)
              {
                char v48 = v63;
                goto LABEL_70;
              }
              id v47 = [v32 assetTransferOptions];
              unint64_t v49 = [v47 useMMCSEncryptionV2];
              if ([v49 BOOLValue]) {
                __assert_rtn("-[MBCKFile recordRepresentation]", "MBCKFile.m", 2537, "!contents.assetTransferOptions || !contents.assetTransferOptions.useMMCSEncryptionV2.BOOLValue");
              }
LABEL_68:

              char v48 = v63;
LABEL_69:

              goto LABEL_70;
            }
            [v32 setShouldReadRawEncryptedData:1];
            long long v39 = [(MBCKFile *)self domainName];
            if ([v39 isEqualToString:@"HealthDomain"])
            {
              long long v40 = [(MBCKFile *)self relativePath];
              unsigned __int8 v41 = [v40 hasSuffix:@"healthdb_secure.sqlite"];

              if (v41)
              {
                id v42 = MBGetDefaultLog();
                if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
                {
                  uint64_t v43 = [(MBCKFile *)self relativePath];
                  *(_DWORD *)stat buf = 138412290;
                  id v71 = v43;
                  _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_INFO, "Not using fxd for: %@", buf, 0xCu);

                  uint64_t v60 = [(MBCKFile *)self relativePath];
                  _MBLog();
                }
                uint64_t v68 = kCKAssetChunkLength;
                id v69 = &off_100439F30;
                char v44 = +[NSDictionary dictionaryWithObjects:&v69 forKeys:&v68 count:1];
                [v38 setAssetChunkerOptions:v44];

                goto LABEL_66;
              }
            }
            else
            {
            }
            objc_msgSend(v38, "setItemTypeHint:", @"fxd", v60);
LABEL_66:
            char v48 = v63;
            int v46 = objc_msgSend(v38, "assetTransferOptions", v60);
            if (!v46)
            {
LABEL_70:

              if (v64)
              {
                if ([(MBCKFile *)self hasContentEncodingMethod])
                {
                  [v38 setItemTypeHint:@"fxd"];
                }
                else if ([(MBCKFile *)self isSQLiteFile])
                {
                  uint64_t v66 = kCKAssetChunkLength;
                  long long v67 = &off_100439F30;
                  uint64_t v50 = +[NSDictionary dictionaryWithObjects:&v67 forKeys:&v66 count:1];
                  [v38 setAssetChunkerOptions:v50];

                  char v48 = v63;
                }
              }
              unsigned int v51 = objc_msgSend(v38, "shouldReadRawEncryptedData", v60);
              if ((v48 & 8) != 0)
              {
                if (v51) {
                  __assert_rtn("-[MBCKFile recordRepresentation]", "MBCKFile.m", 2550, "!isMMCSEncryptedOnly || !contents.shouldReadRawEncryptedData");
                }
              }
              else if ((v51 & 1) == 0)
              {
                __assert_rtn("-[MBCKFile recordRepresentation]", "MBCKFile.m", 2549, "isMMCSEncryptedOnly || contents.shouldReadRawEncryptedData");
              }
              [v4 setObject:v38 forKeyedSubscript:@"contents"];

              goto LABEL_80;
            }
            id v47 = [v38 assetTransferOptions];
            unint64_t v49 = [v47 useMMCSEncryptionV2];
            if ([v49 BOOLValue]) {
              __assert_rtn("-[MBCKFile recordRepresentation]", "MBCKFile.m", 2535, "!contents.assetTransferOptions || !contents.assetTransferOptions.useMMCSEncryptionV2.BOOLValue");
            }
            goto LABEL_68;
          }
LABEL_28:
          uint64_t v26 = (void *)v62;
          unsigned int v27 = v64;
          goto LABEL_29;
        }
      }
      unsigned int v25 = 0;
      goto LABEL_28;
    }
  }
LABEL_80:
  __int16 v52 = objc_opt_new();
  v53 = [(MBCKFile *)self aggregateDictionaryGroup];
  id v54 = [(MBCKFile *)self domainName];

  if (v54)
  {
    unsigned __int8 v55 = [(MBCKFile *)self domainName];
    [v52 setObject:v55 forKeyedSubscript:@"domainName"];
  }
  if (v53) {
    [v52 setObject:v53 forKeyedSubscript:@"subDomain"];
  }
  if ([(MBCKFile *)self hasContentEncodingMethod])
  {
    id v56 = +[NSNumber numberWithLongLong:self->_sizeBeforeCopy];
    [v52 setObject:v56 forKeyedSubscript:@"originalSize"];
  }
  if ([v52 count]) {
    [v4 setPluginFields:v52];
  }
  uint64_t v57 = MBGetDefaultLog();
  if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)stat buf = 138412290;
    id v71 = v4;
    _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_DEBUG, "Saving file record: %@", buf, 0xCu);
    _MBLog();
  }

  return v4;
}

- (int64_t)savePolicy
{
  return 2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MBCKFile;
  [(MBCKModel *)&v9 encodeWithCoder:v4];
  [v4 encodeObject:self->_manifest forKey:@"FileID"];
  [v4 encodeObject:*(void *)&self->_mbNode.mode forKey:@"DomainName"];
  [v4 encodeObject:self->_volumeType forKey:@"RelativePath"];
  [v4 encodeObject:self->_fileID forKey:@"AbsolutePath"];
  [v4 encodeObject:self->_relativePath forKey:@"LinkTarget"];
  [v4 encodeObject:self->_linkTarget forKey:@"Signature"];
  id v6 = [(MBCKFile *)self birth];
  [v4 encodeObject:v6 forKey:@"FileBirth"];

  id v7 = [(MBCKFile *)self modified];
  [v4 encodeObject:v7 forKey:@"FileModified"];

  id v8 = [(MBCKFile *)self statusChanged];
  [v4 encodeObject:v8 forKey:@"FileStatusChanged"];

  [v4 encodeObject:self->_resources forKey:@"EncrptionKey"];
  [v4 encodeInt64:self->_mbNode.fileSize forKey:@"FileSize"];
  [v4 encodeInt32:self->_mbNode.groupID forKey:@"GroupID"];
  [v4 encodeInt32:self->_mbNode.userID forKey:@"UserID"];
  [v4 encodeInt32:WORD2(self->_mbNode.cloneID) forKey:@"FileMode"];
  [v4 encodeBool:(LOBYTE(self->_restoreState) >> 4) & 1 forKey:@"Deleted"];
  [v4 encodeInt32:BYTE6(self->_mbNode.cloneID) forKey:@"ProtectionClass"];
  [v4 encodeInt64:self->_encryptedSize forKey:@"FileSizeBeforeCopy"];
  [v4 encodeInt32:self->_mbNode.flags forKey:@"Flags"];
  [v4 encodeInt64:self->_sha256Signature forKey:@"SourceDeviceInode"];
}

- (MBCKFile)initWithCoder:(id)a3
{
  id v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)MBCKFile;
  id v6 = [(MBCKModel *)&v31 initWithCoder:v4];
  if (v6)
  {
    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"FileID"];
    manifest = v6->_manifest;
    v6->_manifest = (MBCKManifest *)v7;

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"DomainName"];
    id v10 = *(void **)&v6->_mbNode.mode;
    *(void *)&v6->_mbNode.mode = v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"RelativePath"];
    unint64_t volumeType = (void *)v6->_volumeType;
    v6->_unint64_t volumeType = v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AbsolutePath"];
    fileID = v6->_fileID;
    v6->_fileID = (NSString *)v13;

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"LinkTarget"];
    relativePath = v6->_relativePath;
    v6->_relativePath = (NSString *)v15;

    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Signature"];
    linkTarget = v6->_linkTarget;
    v6->_linkTarget = (NSString *)v17;

    unsigned int v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"FileBirth"];
    [v19 timeIntervalSince1970];
    v6->_mbNode.int64_t birth = (uint64_t)v20;

    unsigned int v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"FileModified"];
    [v21 timeIntervalSince1970];
    v6->_mbNode.int64_t modified = (uint64_t)v22;

    BOOL v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"FileStatusChanged"];
    [v23 timeIntervalSince1970];
    v6->_mbNode.int64_t statusChanged = (uint64_t)v24;

    uint64_t v25 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EncrptionKey"];
    resources = v6->_resources;
    v6->_resources = (NSData *)v25;

    BYTE6(v6->_mbNode.cloneID) = [v4 decodeInt32ForKey:@"ProtectionClass"];
    v6->_mbNode.fileSize = (int64_t)[v4 decodeInt64ForKey:@"FileSize"];
    v6->_mbNode.groupID = [v4 decodeInt32ForKey:@"GroupID"];
    v6->_mbNode.userID = [v4 decodeInt32ForKey:@"UserID"];
    WORD2(v6->_mbNode.cloneID) = (unsigned __int16)[v4 decodeInt32ForKey:@"FileMode"];
    if ([v4 decodeBoolForKey:@"Deleted"]) {
      char v27 = 16;
    }
    else {
      char v27 = 0;
    }
    LOBYTE(v6->_restoreState) = (uint64_t)v6->_restoreState & 0xEF | v27;
    v6->_encryptedSize = (unint64_t)[v4 decodeInt64ForKey:@"FileSizeBeforeCopy"];
    unsigned int v28 = [v4 decodeInt32ForKey:@"Flags"];
    v6->_mbNode.uint64_t flags = v28;
    if ((v28 & 0x40000000) != 0) {
      v6->_mbNode.fileSize = 0;
    }
    v6->_sha256Signature = (NSData *)[v4 decodeInt64ForKey:@"SourceDeviceInode"];
  }
  char v29 = v6;

  return v29;
}

- (id)asArchiveData
{
  id v3 = objc_alloc_init(MBCKFileArchive);
  [(MBCKFileArchive *)v3 setFileID:self->_manifest];
  [(MBCKFileArchive *)v3 setDomainName:*(void *)&self->_mbNode.mode];
  unint64_t volumeType = self->_volumeType;
  if (volumeType)
  {
    fileID = self->_fileID;
    if (fileID)
    {
      if (-[NSString hasSuffix:](fileID, "hasSuffix:"))
      {
        id v6 = -[NSString substringToIndex:](self->_fileID, "substringToIndex:", (unsigned char *)-[NSString length](self->_fileID, "length") - (unsigned char *)[self->_volumeType length]);
        [(MBCKFileArchive *)v3 setAbsolutePathPrefix:v6];
        [(MBCKFileArchive *)v3 setRelativePath:self->_volumeType];

        goto LABEL_7;
      }
      unint64_t volumeType = self->_volumeType;
    }
  }
  [(MBCKFileArchive *)v3 setRelativePath:volumeType];
  [(MBCKFileArchive *)v3 setAbsolutePath:self->_fileID];
LABEL_7:
  [(MBCKFileArchive *)v3 setLinkTarget:self->_relativePath];
  [(MBCKFileArchive *)v3 setSignature:self->_linkTarget];
  int64_t birth = self->_mbNode.birth;
  if (birth) {
    [(MBCKFileArchive *)v3 setBirth:(birth - 978307200)];
  }
  int64_t modified = self->_mbNode.modified;
  if (modified) {
    [(MBCKFileArchive *)v3 setModified:(modified - 978307200)];
  }
  int64_t statusChanged = self->_mbNode.statusChanged;
  if (statusChanged) {
    [(MBCKFileArchive *)v3 setStatusChanged:(statusChanged - 978307200)];
  }
  if (self->_mbNode.fileSize && ((uint64_t)self->_restoreState & 8) != 0)
  {
    [(MBCKFile *)self encryptionKey];
    if (objc_claimAutoreleasedReturnValue()) {
      __assert_rtn("-[MBCKFile asArchiveData]", "MBCKFile.m", 2691, "!self.encryptionKey");
    }
    [(MBCKFileArchive *)v3 setIsMMCSEncryptedOnly:1];
  }
  else
  {
    id v10 = [(MBCKFile *)self encryptionKey];
    [(MBCKFileArchive *)v3 setEncryptionKey:v10];
  }
  uint64_t v11 = BYTE6(self->_mbNode.cloneID);
  if (MBProtectionClassSupportedValue(v11, (WORD2(self->_mbNode.cloneID) & 0xF000) == 0x8000, 0) == 255)
  {
    if (v11 != 255)
    {
      id v12 = MBGetDefaultLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      {
        uint64_t v13 = *(void *)&self->_mbNode.mode;
        unint64_t v14 = self->_volumeType;
        *(_DWORD *)stat buf = 67109634;
        int v27 = v11;
        __int16 v28 = 2112;
        uint64_t v29 = v13;
        __int16 v30 = 2112;
        unint64_t v31 = v14;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_FAULT, "CKFile archiving invalid PC (%d) for: %@:%@", buf, 0x1Cu);
        uint64_t v24 = *(void *)&self->_mbNode.mode;
        unint64_t v25 = self->_volumeType;
        uint64_t v23 = v11;
        _MBLog();
      }
    }
  }
  else
  {
    [(MBCKFileArchive *)v3 setProtectionClass:v11];
  }
  if ([(MBCKFile *)self inode]
    && !+[MBProtectionClassUtils canOpenWhenLocked:v11])
  {
    [(MBCKFileArchive *)v3 setInode:[(MBCKFile *)self inode]];
  }
  else if ([(MBCKFileArchive *)v3 inode])
  {
    __assert_rtn("-[MBCKFile asArchiveData]", "MBCKFile.m", 2711, "a.inode == 0");
  }
  if (*(void *)&self->_is
    && !+[MBProtectionClassUtils canOpenWhenLocked:v11])
  {
    [(MBCKFileArchive *)v3 setVolumeType:*(_DWORD *)&self->_is];
  }
  else if ([(MBCKFileArchive *)v3 volumeType])
  {
    __assert_rtn("-[MBCKFile asArchiveData]", "MBCKFile.m", 2716, "a.volumeType == MBVolumeTypeUnspecified");
  }
  [(MBCKFileArchive *)v3 setSourceDeviceInode:[(MBCKFile *)self sourceDeviceInode]];
  [(MBCKFileArchive *)v3 setSize:self->_mbNode.fileSize];
  [(MBCKFileArchive *)v3 setGroupID:self->_mbNode.groupID];
  [(MBCKFileArchive *)v3 setUserID:self->_mbNode.userID];
  [(MBCKFileArchive *)v3 setMode:WORD2(self->_mbNode.cloneID)];
  [(MBCKFileArchive *)v3 setDeleted:(LOBYTE(self->_restoreState) >> 4) & 1];
  if (self->_encryptedSize) {
    -[MBCKFileArchive setSizeBeforeCopy:](v3, "setSizeBeforeCopy:");
  }
  if (self->_domainName)
  {
    uint64_t v15 = [(MBCKFile *)self aggregateDictionaryGroup];
    [(MBCKFileArchive *)v3 setSubDomain:v15];
  }
  [(MBCKFileArchive *)v3 setResourcesSize:self->_signature];
  int64_t v16 = [(NSString *)self->_encodedAssetPath stashedAssetPath];
  [(MBCKFileArchive *)v3 setStashedAssetPath:v16];

  uint64_t v17 = [(NSString *)self->_encodedAssetPath stashedResourcePath];
  [(MBCKFileArchive *)v3 setStashedResourcePath:v17];

  [(MBCKFileArchive *)v3 setStashedAssetIsDecrypted:[(NSString *)self->_encodedAssetPath stashedAssetDecrypted]];
  if (self->_mbNode.flags) {
    -[MBCKFileArchive setFlags:](v3, "setFlags:");
  }
  if ([(MBCKFile *)self hasContentEncodingMethod])
  {
    [(MBCKFileArchive *)v3 setSizeBeforeEncoding:self->_sizeBeforeCopy];
    int sqliteTemporaryDirectory_low = LOBYTE(self->_sqliteTemporaryDirectory);
    if (sqliteTemporaryDirectory_low == 255) {
      __assert_rtn("-[MBCKFile asArchiveData]", "MBCKFile.m", 2742, "_contentEncodingMethod != MBFileEncodingMethodDefault");
    }
    if (!LOBYTE(self->_sqliteTemporaryDirectory)) {
      __assert_rtn("-[MBCKFile asArchiveData]", "MBCKFile.m", 2743, "_contentEncodingMethod != MBFileEncodingMethodUnspecified");
    }
    [(MBCKFileArchive *)v3 setContentEncodingMethod:(char)sqliteTemporaryDirectory_low];
    if ([(MBCKFile *)self hasContentCompressionMethod])
    {
      int v19 = BYTE1(self->_sqliteTemporaryDirectory);
      if (v19 != 255)
      {
        if (!BYTE1(self->_sqliteTemporaryDirectory)) {
          __assert_rtn("-[MBCKFile asArchiveData]", "MBCKFile.m", 2746, "_contentCompressionMethod != MBFileCompressionMethodUnspecified");
        }
        [(MBCKFileArchive *)v3 setContentCompressionMethod:(char)v19];
      }
    }
    double v20 = [(NSString *)self->_encodedAssetPath decodedAssetPath];
    [(MBCKFileArchive *)v3 setDecodedAssetPath:v20];
  }
  [(MBCKFileArchive *)v3 setSha256Signature:self->_encryptionKey];
  unsigned int v21 = [(MBCKFileArchive *)v3 data];

  return v21;
}

- (MBCKManifest)manifest
{
  return (MBCKManifest *)self->_domain;
}

- (unint64_t)volumeType
{
  return *(void *)&self->_is;
}

- (NSString)relativePath
{
  return (NSString *)self->_volumeType;
}

- (NSString)linkTarget
{
  return self->_relativePath;
}

- (NSData)signature
{
  return (NSData *)self->_linkTarget;
}

- (unint64_t)sizeBeforeCopy
{
  return self->_encryptedSize;
}

- (unint64_t)resourcesSize
{
  return (unint64_t)self->_signature;
}

- (NSData)contents
{
  return (NSData *)self->_resourcesSize;
}

- (NSData)resources
{
  return self->_contents;
}

- (NSData)encryptionKey
{
  return self->_resources;
}

- (NSData)sha256Signature
{
  return self->_encryptionKey;
}

- (unint64_t)sourceDeviceInode
{
  return (unint64_t)self->_sha256Signature;
}

- (NSString)subDomain
{
  return (NSString *)self->_sourceDeviceInode;
}

- (double)progress
{
  return *(double *)&self->_subDomain;
}

- (void)setProgress:(double)a3
{
  *(double *)&self->_subDomain = a3;
}

- (unint64_t)priority
{
  return *(void *)&self->_progress;
}

- (void)setPriority:(unint64_t)a3
{
  *(void *)&self->_progress = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceDeviceInode, 0);
  objc_storeStrong((id *)&self->_encryptionKey, 0);
  objc_storeStrong((id *)&self->_resources, 0);
  objc_storeStrong((id *)&self->_contents, 0);
  objc_storeStrong((id *)&self->_resourcesSize, 0);
  objc_storeStrong((id *)&self->_linkTarget, 0);
  objc_storeStrong((id *)&self->_relativePath, 0);
  objc_storeStrong((id *)&self->_volumeType, 0);
  objc_storeStrong((id *)&self->_encodedAssetPath, 0);
  objc_storeStrong((id *)&self->_rsrcTemporaryPath, 0);
  objc_storeStrong((id *)&self->_temporaryPath, 0);
  objc_storeStrong((id *)&self->_contentEncodingMethod, 0);
  objc_storeStrong((id *)&self->_sizeBeforeEncoding, 0);
  objc_storeStrong((id *)&self->_contentAsset, 0);
  objc_storeStrong((id *)&self->_changeType, 0);
  objc_storeStrong((id *)&self->_fileID, 0);
  objc_storeStrong((id *)&self->_manifest, 0);
  objc_storeStrong((id *)&self->_domain, 0);
  objc_storeStrong((id *)&self->_domainName, 0);
  objc_storeStrong((id *)&self->_mbNode.mode, 0);
}

- (id)initFromArchiveData:(id)a3
{
  id v4 = a3;
  id v5 = [[MBCKFileArchive alloc] initWithData:v4];
  if (!v5)
  {

    id v6 = 0;
    goto LABEL_112;
  }
  v86.receiver = self;
  v86.super_class = (Class)MBCKFile;
  id v6 = [(MBCKModel *)&v86 initWithRecord:0 cache:0];

  if (v6)
  {
    uint64_t v7 = [(MBCKFileArchive *)v5 fileID];
    manifest = v6->_manifest;
    v6->_manifest = (MBCKManifest *)v7;

    uint64_t v9 = [(MBCKFileArchive *)v5 domainName];
    id v10 = *(void **)&v6->_mbNode.mode;
    *(void *)&v6->_mbNode.mode = v9;

    uint64_t v11 = [(MBCKFileArchive *)v5 absolutePathPrefix];

    uint64_t v12 = [(MBCKFileArchive *)v5 relativePath];
    unint64_t volumeType = (void *)v6->_volumeType;
    v6->_unint64_t volumeType = v12;

    if (v11)
    {
      uint64_t v14 = [(MBCKFileArchive *)v5 absolutePathPrefix];
      fileID = v6->_fileID;
      v6->_fileID = (NSString *)v14;

      if (!v6->_volumeType) {
        goto LABEL_9;
      }
      uint64_t v16 = -[NSString stringByAppendingString:](v6->_fileID, "stringByAppendingString:");
      uint64_t v17 = v6->_fileID;
      v6->_fileID = (NSString *)v16;
    }
    else
    {
      uint64_t v18 = [(MBCKFileArchive *)v5 absolutePath];
      uint64_t v17 = v6->_fileID;
      v6->_fileID = (NSString *)v18;
    }

LABEL_9:
    uint64_t v19 = [(MBCKFileArchive *)v5 linkTarget];
    relativePath = v6->_relativePath;
    v6->_relativePath = (NSString *)v19;

    uint64_t v21 = [(MBCKFileArchive *)v5 signature];
    linkTarget = v6->_linkTarget;
    v6->_linkTarget = (NSString *)v21;

    if ([(MBCKFileArchive *)v5 hasBirth]) {
      v6->_mbNode.int64_t birth = [(MBCKFileArchive *)v5 birth] + 978307200;
    }
    if ([(MBCKFileArchive *)v5 hasModified]) {
      v6->_mbNode.int64_t modified = [(MBCKFileArchive *)v5 modified] + 978307200;
    }
    if ([(MBCKFileArchive *)v5 hasStatusChanged]) {
      v6->_mbNode.int64_t statusChanged = [(MBCKFileArchive *)v5 statusChanged] + 978307200;
    }
    if ([(MBCKFileArchive *)v5 hasSize]) {
      int64_t v23 = [(MBCKFileArchive *)v5 size];
    }
    else {
      int64_t v23 = 0;
    }
    v6->_mbNode.fileSize = v23;
    unsigned int v24 = [(MBCKFileArchive *)v5 hasIsMMCSEncryptedOnly];
    if (v24)
    {
      unsigned int v24 = [(MBCKFileArchive *)v5 isMMCSEncryptedOnly];
      if (v24) {
        char v25 = 8;
      }
      else {
        char v25 = 0;
      }
    }
    else
    {
      char v25 = 0;
    }
    LOBYTE(v6->_restoreState) = (uint64_t)v6->_restoreState & 0xF7 | v25;
    if (v24 && v6->_mbNode.fileSize)
    {
      resources = v6->_resources;
      v6->_resources = 0;
    }
    else
    {
      uint64_t v27 = [(MBCKFileArchive *)v5 encryptionKey];
      resources = v6->_resources;
      v6->_resources = (NSData *)v27;
    }

    unsigned int v28 = [(MBCKFileArchive *)v5 hasMode];
    if (v28) {
      LOWORD(v28) = (unsigned __int16)[(MBCKFileArchive *)v5 mode];
    }
    WORD2(v6->_mbNode.cloneID) = v28;
    if ([(MBCKFileArchive *)v5 hasProtectionClass])
    {
      uint64_t v29 = MBProtectionClassSupportedValue([(MBCKFileArchive *)v5 protectionClass], (WORD2(v6->_mbNode.cloneID) & 0xF000) == 0x8000, 0);
      BYTE6(v6->_mbNode.cloneID) = v29;
      if (v29 != 255
        && !+[MBProtectionClassUtils canOpenWhenLocked:v29])
      {
        if ([(MBCKFileArchive *)v5 hasInode]) {
          int64_t v30 = [(MBCKFileArchive *)v5 inode];
        }
        else {
          int64_t v30 = 0;
        }
        v6->_mbNode.inode = v30;
        if ([(MBCKFileArchive *)v5 hasVolumeType]) {
          uint64_t v79 = [(MBCKFileArchive *)v5 volumeType];
        }
        else {
          uint64_t v79 = 0;
        }
        *(void *)&v6->_is = v79;
        goto LABEL_37;
      }
    }
    else
    {
      BYTE6(v6->_mbNode.cloneID) = -1;
    }
    if (v6->_mbNode.inode) {
      __assert_rtn("-[MBCKFile(PQLResultSetInitializer) initFromArchiveData:]", "MBCKFile.m", 2809, "_mbNode.inode == 0");
    }
    if (*(void *)&v6->_is) {
      __assert_rtn("-[MBCKFile(PQLResultSetInitializer) initFromArchiveData:]", "MBCKFile.m", 2810, "_volumeType == MBVolumeTypeUnspecified");
    }
LABEL_37:
    if ([(MBCKFileArchive *)v5 hasResourcesSize]) {
      unint64_t v31 = [(MBCKFileArchive *)v5 resourcesSize];
    }
    else {
      unint64_t v31 = 0;
    }
    v6->_signature = v31;
    unsigned int v32 = [(MBCKFileArchive *)v5 hasGroupID];
    if (v32) {
      unsigned int v32 = [(MBCKFileArchive *)v5 groupID];
    }
    v6->_mbNode.groupID = v32;
    unsigned int v33 = [(MBCKFileArchive *)v5 hasUserID];
    if (v33) {
      unsigned int v33 = [(MBCKFileArchive *)v5 userID];
    }
    v6->_mbNode.userID = v33;
    if ([(MBCKFileArchive *)v5 hasFlags])
    {
      unsigned int v34 = [(MBCKFileArchive *)v5 flags];
      v6->_mbNode.uint64_t flags = v34;
      p_uint64_t flags = &v6->_mbNode.flags;
      if ((v34 & 0x40000000) != 0) {
        v6->_mbNode.fileSize = 0;
      }
    }
    else
    {
      v6->_mbNode.uint64_t flags = 0;
      p_uint64_t flags = &v6->_mbNode.flags;
    }
    if ([(MBCKFileArchive *)v5 hasDeleted])
    {
      if ([(MBCKFileArchive *)v5 deleted]) {
        char v36 = 16;
      }
      else {
        char v36 = 0;
      }
    }
    else
    {
      char v36 = 0;
    }
    LOBYTE(v6->_restoreState) = (uint64_t)v6->_restoreState & 0xEF | v36;
    if ([(MBCKFileArchive *)v5 hasSizeBeforeCopy]) {
      int64_t v37 = [(MBCKFileArchive *)v5 sizeBeforeCopy];
    }
    else {
      int64_t v37 = 0;
    }
    v6->_encryptedSize = v37;
    unsigned int v38 = [(MBCKFileArchive *)v5 hasSubDomain];
    if (v38)
    {
      long long v39 = [(MBCKFileArchive *)v5 subDomain];
    }
    else
    {
      long long v39 = 0;
    }
    objc_storeStrong((id *)&v6->_sourceDeviceInode, v39);
    if (v38) {

    }
    if ([(MBCKFileArchive *)v5 hasSourceDeviceInode]) {
      long long v40 = [(MBCKFileArchive *)v5 sourceDeviceInode];
    }
    else {
      long long v40 = 0;
    }
    v6->_sha256Signature = v40;
    if ([(MBCKFileArchive *)v5 hasStashedAssetPath])
    {
      unsigned __int8 v41 = +[NSFileManager defaultManager];
      id v42 = [(MBCKFileArchive *)v5 stashedAssetPath];
      unsigned int v43 = [v41 fileExistsAtPath:v42];

      if (v43)
      {
        char v44 = [(MBCKFileArchive *)v5 stashedAssetPath];
        int v45 = [(MBCKFile *)v6 restoreState];
        [v45 setStashedAssetPath:v44];
      }
    }
    if ([(MBCKFileArchive *)v5 hasStashedResourcePath])
    {
      int v46 = +[NSFileManager defaultManager];
      id v47 = [(MBCKFileArchive *)v5 stashedResourcePath];
      unsigned int v48 = [v46 fileExistsAtPath:v47];

      if (v48)
      {
        unint64_t v49 = [(MBCKFileArchive *)v5 stashedResourcePath];
        uint64_t v50 = [(MBCKFile *)v6 restoreState];
        [v50 setStashedResourcePath:v49];
      }
    }
    if ([(MBCKFileArchive *)v5 hasStashedAssetIsDecrypted])
    {
      BOOL v51 = [(MBCKFileArchive *)v5 stashedAssetIsDecrypted];
      __int16 v52 = [(MBCKFile *)v6 restoreState];
      [v52 setStashedAssetDecrypted:v51];
    }
    v53 = [(NSString *)v6->_encodedAssetPath stashedAssetPath];
    if (!v53)
    {
      if (![(MBCKFileArchive *)v5 hasStashedAssetPath]) {
        goto LABEL_80;
      }
      id v54 = MBGetDefaultLog();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
      {
        unsigned __int8 v55 = v54;
        if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
        {
          id v56 = [(MBCKFileArchive *)v5 stashedAssetPath];
          *(_DWORD *)stat buf = 138412546;
          id v88 = v6;
          __int16 v89 = 2112;
          unint64_t v90 = v56;
          _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_ERROR, "Prefetch: %@ prefetched, no file asset: %@", buf, 0x16u);
        }
        [(MBCKFileArchive *)v5 stashedAssetPath];
        v83 = id v80 = v6;
        _MBLog();
      }
      v53 = [(MBCKFile *)v6 restoreState];
      [v53 setStashedAssetDecrypted:0];
    }

LABEL_80:
    uint64_t v57 = [(NSString *)v6->_encodedAssetPath stashedResourcePath];
    if (!v57)
    {
      if (![(MBCKFileArchive *)v5 hasStashedResourcePath])
      {
LABEL_82:
        if ([(MBCKFileArchive *)v5 hasContentEncodingMethod])
        {
          if ([(MBCKFileArchive *)v5 hasSizeBeforeEncoding]) {
            v6->_sizeBeforeCopy = [(MBCKFileArchive *)v5 sizeBeforeEncoding];
          }
          LOBYTE(v6->_sqliteTemporaryDirectory) = [(MBCKFileArchive *)v5 contentEncodingMethod];
          if ([(MBCKFileArchive *)v5 hasContentCompressionMethod]) {
            BYTE1(v6->_sqliteTemporaryDirectory) = [(MBCKFileArchive *)v5 contentCompressionMethod];
          }
          if ([(MBCKFileArchive *)v5 hasDecodedAssetPath])
          {
            unsigned int v58 = +[NSFileManager defaultManager];
            char v59 = [(MBCKFileArchive *)v5 decodedAssetPath];
            unsigned int v60 = [v58 fileExistsAtPath:v59];

            if (v60)
            {
              unsigned int v61 = [(MBCKFileArchive *)v5 decodedAssetPath];
              uint64_t v62 = [(MBCKFile *)v6 restoreState];
              [v62 setDecodedAssetPath:v61];
            }
          }
          char v63 = [(NSString *)v6->_encodedAssetPath decodedAssetPath];
          if (!v63)
          {
            if (![(MBCKFileArchive *)v5 hasDecodedAssetPath]) {
              goto LABEL_92;
            }
            char v63 = MBGetDefaultLog();
            if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
            {
              uint64_t v77 = v63;
              if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
              {
                unsigned __int8 v78 = [(MBCKFileArchive *)v5 decodedAssetPath];
                *(_DWORD *)stat buf = 138412546;
                id v88 = v6;
                __int16 v89 = 2112;
                unint64_t v90 = v78;
                _os_log_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_ERROR, "Prefetch: %@ prefetched, no decoded asset: %@", buf, 0x16u);
              }
              [(MBCKFileArchive *)v5 decodedAssetPath];
              id v85 = v82 = v6;
              _MBLog();
            }
          }
        }
LABEL_92:
        if (v6->_mbNode.fileSize)
        {
          unsigned int v64 = [(NSString *)v6->_encodedAssetPath stashedAssetPath];
          BOOL v65 = v64 != 0;
        }
        else
        {
          BOOL v65 = 1;
        }
        if (v6->_signature || (*(unsigned char *)p_flags & 0x80) != 0)
        {
          id v69 = [(NSString *)v6->_encodedAssetPath stashedResourcePath];
          BOOL v68 = v69 != 0;
        }
        else
        {
          BOOL v68 = 1;
        }
        long long v70 = [(NSString *)v6->_encodedAssetPath decodedAssetPath];

        if (v70) {
          int v71 = 1;
        }
        else {
          int v71 = v65;
        }
        if ((v71 & v68) != 0) {
          char v72 = 32;
        }
        else {
          char v72 = 0;
        }
        LOBYTE(v6->_restoreState) = (uint64_t)v6->_restoreState & 0xDF | v72;
        if ([(MBCKFileArchive *)v5 hasSha256Signature])
        {
          uint64_t v73 = [(MBCKFileArchive *)v5 sha256Signature];
          encryptionKey = v6->_encryptionKey;
          v6->_encryptionKey = (NSData *)v73;
        }
        goto LABEL_112;
      }
      uint64_t v57 = MBGetDefaultLog();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
      {
        uint64_t v66 = v57;
        if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
        {
          long long v67 = [(MBCKFileArchive *)v5 stashedResourcePath];
          *(_DWORD *)stat buf = 138412546;
          id v88 = v6;
          __int16 v89 = 2112;
          unint64_t v90 = v67;
          _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_ERROR, "Prefetch: %@ prefetched, no resource asset: %@", buf, 0x16u);
        }
        [(MBCKFileArchive *)v5 stashedResourcePath];
        v84 = uint64_t v81 = v6;
        _MBLog();
      }
    }

    goto LABEL_82;
  }
LABEL_112:
  uint64_t v75 = v6;

  return v75;
}

- (id)initFromPQLResultSet:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([v6 columns] == (id)1)
  {
    uint64_t v7 = [v6 dataAtIndex:0];
    if (v7)
    {
      id v8 = [(MBCKFile *)self initFromArchiveData:v7];
    }
    else
    {

      id v8 = 0;
    }
    self = (MBCKFile *)v8;

    uint64_t v9 = self;
  }
  else if (a4)
  {
    +[NSError errorWithSqliteCode:20 andMessage:@"This result set has more than one column"];
    uint64_t v9 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

+ (id)newFromSqliteStatement:(sqlite3_stmt *)a3 atIndex:(int)a4
{
  if (!a3) {
    __assert_rtn("+[MBCKFile(PQLResultSetInitializer) newFromSqliteStatement:atIndex:]", "MBCKFile.m", 2888, "statement");
  }
  int v7 = sqlite3_column_type(a3, a4);
  if (v7 == 4)
  {
    id v8 = sqlite3_column_blob(a3, a4);
    id v9 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", v8, sqlite3_column_bytes(a3, a4));
    id v10 = [objc_alloc((Class)a1) initFromArchiveData:v9];

    return v10;
  }
  else
  {
    int v12 = v7;
    uint64_t v13 = MBGetDefaultLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)stat buf = 67109376;
      int v15 = v12;
      __int16 v16 = 1024;
      int v17 = a4;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Invalid type (%d) for the column at index %d", buf, 0xEu);
      _MBLog();
    }

    return 0;
  }
}

- (void)sqliteBind:(sqlite3_stmt *)a3 index:(int)a4
{
  id v6 = [(MBCKFile *)self asArchiveData];
  sqlite3_bind_blob(a3, a4, [v6 bytes], (int)objc_msgSend(v6, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
}

- (BOOL)hasContentCompressionMethod
{
  return BYTE1(self->_sqliteTemporaryDirectory) - 1 < 0xFE;
}

+ (BOOL)shouldValidateFileEncoding
{
  if (qword_100482450 != -1) {
    dispatch_once(&qword_100482450, &stru_100413380);
  }
  return byte_100482421;
}

+ (double)sqliteSpaceSavingsThreshold
{
  if (qword_100482460 != -1) {
    dispatch_once(&qword_100482460, &stru_1004133A0);
  }
  return *(double *)&qword_100482458;
}

- (BOOL)encodeWithFileAtPath:(id)a3 encodingMethod:(char)a4 hasSnapshot:(BOOL)a5 destinationDirectory:(id)a6 account:(id)a7 device:(id)a8 error:(id *)a9
{
  BOOL v12 = a5;
  uint64_t v13 = a4;
  id v15 = a3;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  if (!v15) {
    __assert_rtn("-[MBCKFile(EncodingPrivate) encodeWithFileAtPath:encodingMethod:hasSnapshot:destinationDirectory:account:device:error:]", "MBCKFile.m", 2974, "path");
  }
  switch(v13)
  {
    case 0:
      __assert_rtn("-[MBCKFile(EncodingPrivate) encodeWithFileAtPath:encodingMethod:hasSnapshot:destinationDirectory:account:device:error:]", "MBCKFile.m", 2975, "encodingMethod != MBFileEncodingMethodUnspecified");
    case 2:
      __assert_rtn("-[MBCKFile(EncodingPrivate) encodeWithFileAtPath:encodingMethod:hasSnapshot:destinationDirectory:account:device:error:]", "MBCKFile.m", 2976, "encodingMethod != MBFileEncodingMethodCompressedSQLiteText");
    case 3:
      __assert_rtn("-[MBCKFile(EncodingPrivate) encodeWithFileAtPath:encodingMethod:hasSnapshot:destinationDirectory:account:device:error:]", "MBCKFile.m", 2977, "encodingMethod != MBFileEncodingMethodCompressedSQLiteBinary");
  }
  uint64_t v19 = v18;
  if (!v18) {
    __assert_rtn("-[MBCKFile(EncodingPrivate) encodeWithFileAtPath:encodingMethod:hasSnapshot:destinationDirectory:account:device:error:]", "MBCKFile.m", 2978, "device");
  }
  if (!a9) {
    __assert_rtn("-[MBCKFile(EncodingPrivate) encodeWithFileAtPath:encodingMethod:hasSnapshot:destinationDirectory:account:device:error:]", "MBCKFile.m", 2979, "error");
  }
  id v42 = v17;
  unsigned __int8 v20 = [(MBCKFile *)self isSQLiteFile];
  uint64_t v21 = [(MBCKFile *)self domainName];
  unint64_t v22 = [(MBCKFile *)self inode];
  id v23 = v16;
  id v24 = v21;
  if (!v23) {
    __assert_rtn("MBEncodingPath", "MBCKFile.m", 2911, "destinationDirectory");
  }
  char v25 = v24;
  if (v22)
  {
    uint64_t v26 = [objc_alloc((Class)NSString) initWithFormat:@"%@-%llu.%@", v24, v22, @"e"];
    uint64_t v27 = [v23 stringByAppendingPathComponent:v26];
  }
  else
  {
    uint64_t v27 = MBTemporaryPath();
    uint64_t v26 = MBGetDefaultLog();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)stat buf = 138412290;
      int v45 = v27;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "Invalid inode - reverting to: %@", buf, 0xCu);
      unsigned __int8 v41 = v27;
      _MBLog();
    }
  }

  if (!v27) {
    __assert_rtn("-[MBCKFile(EncodingPrivate) encodeWithFileAtPath:encodingMethod:hasSnapshot:destinationDirectory:account:device:error:]", "MBCKFile.m", 2983, "destinationPath");
  }
  uint64_t v28 = BYTE6(self->_mbNode.cloneID);
  if (!+[MBProtectionClassUtils canOpenWhenLocked:v28]) {
    __assert_rtn("-[MBCKFile(EncodingPrivate) encodeWithFileAtPath:encodingMethod:hasSnapshot:destinationDirectory:account:device:error:]", "MBCKFile.m", 2985, "[MBProtectionClassUtils canOpenWhenLocked:pc]");
  }
  [(id)objc_opt_class() sqliteSpaceSavingsThreshold];
  double v30 = v29;
  unint64_t v31 = dispatch_group_create();
  unsigned int v32 = +[MBFileEncodingTask encodingTaskWithEncodingMethod:v13];
  objc_msgSend(v32, "setValidate:", objc_msgSend((id)objc_opt_class(), "shouldValidateFileEncoding"));
  [v32 setSourcePath:v15];
  [v32 setSourceIsLive:!v12];
  [v32 setDestinationPath:v27];
  [v32 setProtectionClass:v28];
  if (v20)
  {
    unsigned int v33 = +[NSNumber numberWithDouble:v30];
    [v32 setSpaceSavingsThreshold:v33];
  }
  else
  {
    [v32 setSpaceSavingsThreshold:0];
  }
  objc_msgSend(v32, "setGroup:", v31, v41);
  [v32 start];
  dispatch_group_wait(v31, 0xFFFFFFFFFFFFFFFFLL);
  id v34 = [v32 error];
  if (v34) {
    goto LABEL_26;
  }
  objc_storeStrong((id *)&self->_rsrcTemporaryPath, v27);
  resources = self->_resources;
  self->_resources = 0;

  id v43 = 0;
  unsigned __int8 v36 = [(MBCKFile *)self fetchEncryptionKeyWithAccount:v42 device:v19 error:&v43];
  id v34 = v43;
  if ((v36 & 1) == 0)
  {
    unsigned int v38 = MBGetDefaultLog();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)stat buf = 138412546;
      int v45 = v27;
      __int16 v46 = 2112;
      id v47 = v34;
      _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "Failed to fetch the encryption key for encoding file at %@, error:%@", buf, 0x16u);
      _MBLog();
    }

LABEL_26:
    id v34 = v34;
    *a9 = v34;
    rsrcTemporaryPath = self->_rsrcTemporaryPath;
    self->_rsrcTemporaryPath = 0;

    LOBYTE(self->_sqliteTemporaryDirectory) = -1;
    BYTE1(self->_sqliteTemporaryDirectory) = -1;
    sub_1000EE4B0(v27);
    BOOL v37 = 0;
    goto LABEL_27;
  }
  if ([v32 encodingMethod] == -1) {
    __assert_rtn("-[MBCKFile(EncodingPrivate) encodeWithFileAtPath:encodingMethod:hasSnapshot:destinationDirectory:account:device:error:]", "MBCKFile.m", 3015, "task.encodingMethod != MBFileEncodingMethodDefault");
  }
  if (![v32 encodingMethod]) {
    __assert_rtn("-[MBCKFile(EncodingPrivate) encodeWithFileAtPath:encodingMethod:hasSnapshot:destinationDirectory:account:device:error:]", "MBCKFile.m", 3016, "task.encodingMethod != MBFileEncodingMethodUnspecified");
  }
  if (![v32 compressionMethod]) {
    __assert_rtn("-[MBCKFile(EncodingPrivate) encodeWithFileAtPath:encodingMethod:hasSnapshot:destinationDirectory:account:device:error:]", "MBCKFile.m", 3017, "task.compressionMethod != MBFileEncodingMethodUnspecified");
  }
  LOBYTE(self->_sqliteTemporaryDirectory) = [v32 encodingMethod];
  BYTE1(self->_sqliteTemporaryDirectory) = [v32 compressionMethod];
  self->_sizeBeforeCopy = self->_mbNode.fileSize;
  self->_mbNode.fileSize = (int64_t)[v32 destinationSize];
  BOOL v37 = 1;
LABEL_27:

  return v37;
}

- (BOOL)decodeWithFileAtPath:(id)a3 destinationDirectory:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (!v8) {
    __assert_rtn("-[MBCKFile(Encoding) decodeWithFileAtPath:destinationDirectory:error:]", "MBCKFile.m", 3043, "path");
  }
  if (!a5) {
    __assert_rtn("-[MBCKFile(Encoding) decodeWithFileAtPath:destinationDirectory:error:]", "MBCKFile.m", 3044, "error");
  }
  id v10 = v9;
  if (![(MBCKFile *)self hasContentEncodingMethod]) {
    __assert_rtn("-[MBCKFile(Encoding) decodeWithFileAtPath:destinationDirectory:error:]", "MBCKFile.m", 3045, "self.hasContentEncodingMethod");
  }
  uint64_t v11 = +[NSFileManager defaultManager];
  BOOL v12 = [v10 stringByAppendingPathComponent:@"DecodedAssets"];
  uint64_t v13 = [(MBCKFile *)self signature];
  uint64_t v14 = objc_msgSend(v13, "mb_base64EncodedFileSystemPathString");

  if (!v14) {
    __assert_rtn("-[MBCKFile(Encoding) decodeWithFileAtPath:destinationDirectory:error:]", "MBCKFile.m", 3050, "signature");
  }
  unsigned int v38 = a5;
  unsigned __int8 v41 = v12;
  long long v39 = [v12 stringByAppendingPathComponent:v14];
  uint64_t v15 = BYTE6(self->_mbNode.cloneID);
  char sqliteTemporaryDirectory = (char)self->_sqliteTemporaryDirectory;
  if ([(MBCKFile *)self hasContentCompressionMethod]) {
    char v17 = BYTE1(self->_sqliteTemporaryDirectory);
  }
  else {
    char v17 = -1;
  }
  uint64_t v18 = MBTemporaryPath();
  if (!v18) {
    __assert_rtn("-[MBCKFile(Encoding) decodeWithFileAtPath:destinationDirectory:error:]", "MBCKFile.m", 3061, "destinationPath");
  }
  uint64_t v19 = (void *)v18;
  long long v40 = (void *)v11;
  unsigned __int8 v20 = dispatch_group_create();
  uint64_t v21 = +[MBFileEncodingTask decodingTaskWithEncodingMethod:sqliteTemporaryDirectory];
  objc_msgSend(v21, "setValidate:", objc_msgSend((id)objc_opt_class(), "shouldValidateFileEncoding"));
  [v21 setSourcePath:v8];
  [v21 setDestinationPath:v19];
  [v21 setCompressionMethod:v17];
  [v21 setProtectionClass:v15];
  [v21 setGroup:v20];
  [v21 start];
  dispatch_group_wait(v20, 0xFFFFFFFFFFFFFFFFLL);
  unint64_t v22 = [v21 error];

  if (v22)
  {
    id v23 = [v21 error];
LABEL_11:
    id v24 = v41;
LABEL_18:
    id v28 = v23;
    id *v38 = v28;
    unsigned int v32 = [(MBCKFile *)self restoreState];
    [v32 setDecodedAssetPath:0];

    sub_1000EE4B0(v19);
    BOOL v30 = 0;
    goto LABEL_19;
  }
  id v43 = 0;
  uint64_t v25 = [v40 createDirectoryAtPath:v41 withIntermediateDirectories:1 attributes:0 error:&v43];
  id v26 = v43;
  id v23 = v26;
  if ((v25 & 1) == 0)
  {
    unint64_t v31 = MBGetDefaultLog();
    id v24 = v41;
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)stat buf = 138412546;
      int v45 = v41;
      __int16 v46 = 2112;
      id v47 = v23;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "Failed to create DecodedAssets directory %@: %@", buf, 0x16u);
      _MBLog();
    }

    goto LABEL_18;
  }
  BOOL v37 = v10;
  id v42 = v26;
  unsigned __int8 v27 = [v40 moveItemAtPath:v19 toPath:v39 error:&v42];
  id v28 = v42;

  if ((v27 & 1) == 0)
  {
    id v34 = [v28 domain];
    if ([v34 isEqualToString:NSCocoaErrorDomain])
    {
      id v35 = [v28 code];

      if (v35 == (id)516) {
        goto LABEL_14;
      }
    }
    else
    {
    }
    unsigned __int8 v36 = MBGetDefaultLog();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)stat buf = 138412802;
      int v45 = v19;
      __int16 v46 = 2112;
      id v47 = v39;
      __int16 v48 = 2112;
      id v49 = v28;
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "Decode failed to move file from %@ to %@: %@", buf, 0x20u);
      _MBLog();
    }

    id v23 = v28;
    id v10 = v37;
    goto LABEL_11;
  }
LABEL_14:
  double v29 = [(MBCKFile *)self restoreState];
  [v29 setDecodedAssetPath:v39];

  self->_mbNode.fileSize = (int64_t)[v21 destinationSize];
  BOOL v30 = 1;
  id v10 = v37;
  id v24 = v41;
LABEL_19:

  return v30;
}

- (void)getNode:(id *)a3
{
  *(_OWORD *)&a3->var0 = *(_OWORD *)&self->_mbNode.direntCount;
  long long v4 = *(_OWORD *)&self->_mbNode.statusChanged;
  long long v3 = *(_OWORD *)&self->_mbNode.inode;
  long long v5 = *(_OWORD *)&self->_mbNode.birth;
  a3->var10 = self->_mbNode.cloneID;
  *(_OWORD *)&a3->var6 = v4;
  *(_OWORD *)&a3->var8 = v3;
  *(_OWORD *)&a3->var4 = v5;
}

- (unsigned)userID
{
  return self->_mbNode.userID;
}

- (unsigned)groupID
{
  return self->_mbNode.groupID;
}

- (NSDate)birth
{
  return +[NSDate dateWithTimeIntervalSince1970:(double)self->_mbNode.birth];
}

- (NSDate)modified
{
  return +[NSDate dateWithTimeIntervalSince1970:(double)self->_mbNode.modified];
}

- (NSDate)statusChanged
{
  return +[NSDate dateWithTimeIntervalSince1970:(double)self->_mbNode.statusChanged];
}

- (unsigned)protectionClass
{
  return BYTE6(self->_mbNode.cloneID);
}

- (unint64_t)size
{
  return self->_mbNode.fileSize;
}

- (unint64_t)inode
{
  return self->_mbNode.inode;
}

- (BOOL)isDataless
{
  return (HIBYTE(self->_mbNode.flags) >> 6) & 1;
}

- (unint64_t)fileType
{
  unsigned int v2 = [(MBCKFile *)self type];
  unint64_t v3 = 3;
  if (v2 == 0x4000) {
    unint64_t v3 = 1;
  }
  if (v2 == 0x8000) {
    unint64_t v3 = 0;
  }
  if (v2 == 40960) {
    return 2;
  }
  else {
    return v3;
  }
}

- (NSString)fileTypeString
{
  unsigned int v2 = [(MBCKFile *)self type];
  CFStringRef v3 = @"file";
  CFStringRef v4 = @"(unknown type)";
  if (v2 == 0x4000) {
    CFStringRef v4 = @"directory";
  }
  if (v2 != 0x8000) {
    CFStringRef v3 = v4;
  }
  if (v2 == 40960) {
    return (NSString *)@"symlink";
  }
  else {
    return &v3->isa;
  }
}

- (unsigned)type
{
  return WORD2(self->_mbNode.cloneID) & 0xF000;
}

- (BOOL)stashedAssetIsDecrypted
{
  return [(NSString *)self->_encodedAssetPath stashedAssetDecrypted];
}

- (void)setStashedAssetIsDecrypted:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(MBCKFile *)self restoreState];
  [v4 setStashedAssetDecrypted:v3];
}

- (BOOL)hasContentEncodingMethod
{
  return LOBYTE(self->_sqliteTemporaryDirectory) - 1 < 0xFE;
}

- (NSString)stashedAssetPath
{
  return (NSString *)[(NSString *)self->_encodedAssetPath stashedAssetPath];
}

- (void)setStashedAssetPath:(id)a3
{
  id v4 = a3;
  id v5 = [(MBCKFile *)self restoreState];
  [v5 setStashedAssetPath:v4];
}

- (NSString)stashedResourcePath
{
  return (NSString *)[(NSString *)self->_encodedAssetPath stashedResourcePath];
}

- (NSString)decodedAssetPath
{
  return (NSString *)[(NSString *)self->_encodedAssetPath decodedAssetPath];
}

- (void)setDecodedAssetPath:(id)a3
{
  id v4 = a3;
  id v5 = [(MBCKFile *)self restoreState];
  [v5 setDecodedAssetPath:v4];
}

@end