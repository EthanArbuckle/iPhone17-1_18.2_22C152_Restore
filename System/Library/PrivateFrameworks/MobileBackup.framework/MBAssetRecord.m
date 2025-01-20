@interface MBAssetRecord
+ (id)_assetIDForDomain:(id)a3 inode:(unint64_t)a4 hmacKey:(id)a5;
+ (id)_contentAssetForFileAtPath:(id)a3 domain:(id)a4 assetType:(unint64_t)a5 compressionMethod:(char)a6 protectionClass:(unsigned __int8)a7;
+ (id)_recordIDForAssetIDPrefix:(id)a3 commitID:(id)a4 domainName:(id)a5 inode:(unint64_t)a6 hmacKey:(id)a7 logicalSize:(int64_t)a8;
+ (id)assetRecordForDomain:(id)a3 absolutePath:(id)a4 extension:(id)a5 inode:(unint64_t)a6 protectionClass:(unsigned __int8)a7 assetType:(unint64_t)a8 compressionMethod:(char)a9 device:(id)a10 commitID:(id)a11 error:(id *)a12;
+ (id)assetRecordFromCKRecord:(id)a3;
+ (id)assetRecordIDPrefixFromAssetIDPrefix:(id)a3;
+ (id)recordIDFromAssetIDPrefix:(id)a3 recordIDSuffix:(id)a4;
- (CKAsset)contents;
- (CKRecordID)recordID;
- (MBAssetRecord)initWithRecordID:(id)a3 contents:(id)a4 extension:(id)a5 pluginFields:(id)a6;
- (NSString)extension;
- (NSString)recordIDSuffix;
- (id)asCKRecord;
@end

@implementation MBAssetRecord

- (MBAssetRecord)initWithRecordID:(id)a3 contents:(id)a4 extension:(id)a5 pluginFields:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (!v11) {
    __assert_rtn("-[MBAssetRecord initWithRecordID:contents:extension:pluginFields:]", "MBAssetRecord.m", 33, "recordID");
  }
  if (!v12) {
    __assert_rtn("-[MBAssetRecord initWithRecordID:contents:extension:pluginFields:]", "MBAssetRecord.m", 34, "contents");
  }
  v15 = v14;
  v19.receiver = self;
  v19.super_class = (Class)MBAssetRecord;
  v16 = [(MBAssetRecord *)&v19 init];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_recordID, a3);
    objc_storeStrong((id *)&v17->_contents, a4);
    objc_storeStrong((id *)&v17->_extension, a5);
    objc_storeStrong((id *)&v17->_pluginFields, a6);
  }

  return v17;
}

- (id)asCKRecord
{
  id v3 = objc_alloc((Class)CKRecord);
  v4 = [(MBAssetRecord *)self recordID];
  id v5 = [v3 initWithRecordType:@"BackupAsset" recordID:v4];

  v6 = [(MBAssetRecord *)self contents];
  [v5 setObject:v6 forKeyedSubscript:@"contents"];

  v7 = [(MBAssetRecord *)self extension];
  [v5 setObject:v7 forKeyedSubscript:@"extension"];

  if ([(NSDictionary *)self->_pluginFields count]) {
    [v5 setPluginFields:self->_pluginFields];
  }
  return v5;
}

- (NSString)recordIDSuffix
{
  v2 = [(MBAssetRecord *)self recordID];
  id v3 = [v2 recordName];

  v4 = [v3 componentsSeparatedByString:@":"];
  if ([v4 count] != (id)5) {
    __assert_rtn("-[MBAssetRecord recordIDSuffix]", "MBAssetRecord.m", 59, "components.count == expectedLength");
  }
  id v5 = [@":" length];
  v6 = [v4 objectAtIndexedSubscript:0];
  id v7 = [v6 length];

  v8 = [v4 objectAtIndexedSubscript:1];
  v9 = (char *)[v8 length];

  v10 = [v3 substringFromIndex:&v9[(void)v7 + 2 * (void)v5]];

  return (NSString *)v10;
}

+ (id)assetRecordFromCKRecord:(id)a3
{
  id v3 = a3;
  v4 = [v3 objectForKeyedSubscript:@"contents"];
  id v5 = [v3 objectForKeyedSubscript:@"extension"];
  v6 = [MBAssetRecord alloc];
  id v7 = [v3 recordID];

  v8 = [(MBAssetRecord *)v6 initWithRecordID:v7 contents:v4 extension:v5 pluginFields:0];
  return v8;
}

+ (id)assetRecordIDPrefixFromAssetIDPrefix:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)NSString) initWithFormat:@"%@%@", @"A:", v3];

  return v4;
}

+ (id)recordIDFromAssetIDPrefix:(id)a3 recordIDSuffix:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[MBCKDatabaseManager zoneIDOfType:1];
  id v8 = [objc_alloc((Class)NSString) initWithFormat:@"%@%@:%@", @"A:", v6, v5];

  id v9 = [objc_alloc((Class)CKRecordID) initWithRecordName:v8 zoneID:v7];
  return v9;
}

+ (id)_assetIDForDomain:(id)a3 inode:(unint64_t)a4 hmacKey:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  id v9 = [objc_alloc((Class)NSString) initWithFormat:@"%@:%llu", v8, a4];

  v10 = +[MBDigestSHA1 sha1HmacForString:v9 key:v7];

  id v11 = [v10 base64EncodedStringWithOptions:0];

  return v11;
}

+ (id)_recordIDForAssetIDPrefix:(id)a3 commitID:(id)a4 domainName:(id)a5 inode:(unint64_t)a6 hmacKey:(id)a7 logicalSize:(int64_t)a8
{
  id v14 = a4;
  id v15 = a3;
  v16 = [a1 _assetIDForDomain:a5 inode:a6 hmacKey:a7];
  id v17 = [objc_alloc((Class)NSString) initWithFormat:@"%@:%@:%llu", v14, v16, a8];

  v18 = [a1 recordIDFromAssetIDPrefix:v15 recordIDSuffix:v17];

  return v18;
}

+ (id)_contentAssetForFileAtPath:(id)a3 domain:(id)a4 assetType:(unint64_t)a5 compressionMethod:(char)a6 protectionClass:(unsigned __int8)a7
{
  int v7 = a7;
  int v8 = a6;
  id v11 = a3;
  id v12 = a4;
  id v13 = +[NSURL fileURLWithPath:v11];
  id v14 = [objc_alloc((Class)CKAsset) initWithFileURL:v13];
  if (v7 == 3)
  {
    id v15 = [v12 name];
    if ([v15 isEqualToString:@"CameraRollDomain"])
    {
      unsigned __int8 v16 = [v12 shouldBackupRelativePathIgnoringProtectionClass:v11];

      if (v16)
      {
        if (a5 == 2) {
          goto LABEL_26;
        }
        if (!v8)
        {
          if (a5 != 3) {
            goto LABEL_26;
          }
          uint64_t v26 = kCKAssetChunkLength;
          v27 = &off_100439F78;
          id v17 = &v27;
          v18 = &v26;
          goto LABEL_15;
        }
        goto LABEL_21;
      }
    }
    else
    {
    }
  }
  if (a5 != 2)
  {
    if ((v7 | 4) == 7) {
      [v14 setItemTypeHint:@"fxd"];
    }
    if (v8)
    {
      [v14 setItemTypeHint:@"fxd"];
    }
    else if (a5 == 3)
    {
      uint64_t v26 = kCKAssetChunkLength;
      v27 = &off_100439F78;
      v23 = +[NSDictionary dictionaryWithObjects:&v27 forKeys:&v26 count:1];
      [v14 setAssetChunkerOptions:v23];
    }
    v22 = objc_opt_new();
    [v22 setUseMMCSEncryptionV2:&__kCFBooleanTrue];
    [v14 setAssetTransferOptions:v22];
    goto LABEL_25;
  }
  [v14 setShouldReadRawEncryptedData:1];
  objc_super v19 = [v12 name];
  if (![v19 isEqualToString:@"HealthDomain"])
  {

    goto LABEL_21;
  }
  unsigned int v20 = [v11 hasSuffix:@"healthdb_secure.sqlite"];

  if (!v20)
  {
LABEL_21:
    [v14 setItemTypeHint:@"fxd"];
    goto LABEL_26;
  }
  v21 = MBGetDefaultLog();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v31 = v11;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "Not using fxd for: %@", buf, 0xCu);
    id v25 = v11;
    _MBLog();
  }

  uint64_t v28 = kCKAssetChunkLength;
  v29 = &off_100439F78;
  id v17 = &v29;
  v18 = &v28;
LABEL_15:
  v22 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v17, v18, 1, v25);
  [v14 setAssetChunkerOptions:v22];
LABEL_25:

LABEL_26:
  return v14;
}

+ (id)assetRecordForDomain:(id)a3 absolutePath:(id)a4 extension:(id)a5 inode:(unint64_t)a6 protectionClass:(unsigned __int8)a7 assetType:(unint64_t)a8 compressionMethod:(char)a9 device:(id)a10 commitID:(id)a11 error:(id *)a12
{
  unsigned int v13 = a7;
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a10;
  id v20 = a11;
  if (!v19) {
    __assert_rtn("+[MBAssetRecord assetRecordForDomain:absolutePath:extension:inode:protectionClass:assetType:compressionMethod:device:commitID:error:]", "MBAssetRecord.m", 176, "device");
  }
  v21 = v20;
  v22 = [v19 assetIDPrefix];
  if (!v22) {
    __assert_rtn("+[MBAssetRecord assetRecordForDomain:absolutePath:extension:inode:protectionClass:assetType:compressionMethod:device:commitID:error:]", "MBAssetRecord.m", 177, "device.assetIDPrefix");
  }

  v23 = [v19 hmacKey];
  if (!v23) {
    __assert_rtn("+[MBAssetRecord assetRecordForDomain:absolutePath:extension:inode:protectionClass:assetType:compressionMethod:device:commitID:error:]", "MBAssetRecord.m", 178, "device.hmacKey");
  }

  uint64_t v40 = 0;
  long long v38 = 0u;
  long long v39 = 0u;
  memset(v37, 0, sizeof(v37));
  v24 = 0;
  if (MBNodeForPath(v17, (uint64_t)v37, a12))
  {
    uint64_t v25 = *((void *)&v38 + 1);
    uint64_t v26 = [v19 assetIDPrefix];
    [v16 name];
    v27 = unsigned int v34 = v13;
    uint64_t v28 = [v19 hmacKey];
    v29 = [a1 _recordIDForAssetIDPrefix:v26 commitID:v21 domainName:v27 inode:a6 hmacKey:v28 logicalSize:v25];

    v30 = [a1 _contentAssetForFileAtPath:v17 domain:v16 assetType:a8 compressionMethod:a9 protectionClass:v34];
    CFStringRef v41 = @"domainName";
    id v31 = [v16 name];
    v42 = v31;
    v32 = +[NSDictionary dictionaryWithObjects:&v42 forKeys:&v41 count:1];

    v24 = [[MBAssetRecord alloc] initWithRecordID:v29 contents:v30 extension:v18 pluginFields:v32];
  }

  return v24;
}

- (CKRecordID)recordID
{
  return self->_recordID;
}

- (CKAsset)contents
{
  return self->_contents;
}

- (NSString)extension
{
  return self->_extension;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extension, 0);
  objc_storeStrong((id *)&self->_contents, 0);
  objc_storeStrong((id *)&self->_recordID, 0);
  objc_storeStrong((id *)&self->_pluginFields, 0);
}

@end