@interface MBDomainRecord
+ (id)_recordIDForDomain:(id)a3 commitID:(id)a4 hmacKey:(id)a5 pageIndex:(unint64_t)a6;
+ (id)baseRecordIDForDomain:(id)a3 commitID:(id)a4 hmacKey:(id)a5;
+ (id)domainHmacForDomainName:(id)a3 hmacKey:(id)a4;
+ (id)domainHmacFromBaseRecordID:(id)a3;
+ (id)domainRecordForDomain:(id)a3 commitID:(id)a4 addedOrModifiedAssets:(id)a5 deletedAssets:(id)a6 hmacKey:(id)a7 fileListStats:(id *)a8 fileListPath:(id)a9 fileListEncodingType:(char)a10;
+ (id)domainRecordFromCKRecord:(id)a3;
+ (id)domainRecordPageForDomain:(id)a3 commitID:(id)a4 addedOrModifiedAssets:(id)a5 deletedAssets:(id)a6 hmacKey:(id)a7 pageIndex:(unint64_t)a8;
+ (id)recordIDFromBaseRecordID:(id)a3 pageIndex:(unint64_t)a4;
- (BOOL)decompressAssetIntoSnapshotDirectoryRoot:(id)a3 commitID:(id)a4 error:(id *)a5;
- (CKAsset)fileList;
- (CKRecordID)recordID;
- (MBDomainRecord)initWithDomainName:(id)a3 recordID:(id)a4 pageIndex:(unint64_t)a5 addedOrModifiedAssets:(id)a6 deletedAssets:(id)a7 cumulativeDirectoryCount:(unint64_t)a8 cumulativeRegCount:(unint64_t)a9 cumulativeEmptyRegCount:(unint64_t)a10 cumulativeSymlinkCount:(unint64_t)a11 cumulativeAssetCount:(unint64_t)a12 fileList:(id)a13 fileListEncodingType:(char)a14;
- (NSArray)addedOrModifiedAssets;
- (NSArray)deletedAssets;
- (NSString)domainName;
- (char)fileListEncodingType;
- (id)asCKRecord;
- (unint64_t)cumulativeAssetCount;
- (unint64_t)cumulativeDirectoryCount;
- (unint64_t)cumulativeEmptyRegCount;
- (unint64_t)cumulativeRegCount;
- (unint64_t)cumulativeSymlinkCount;
- (unint64_t)pageIndex;
@end

@implementation MBDomainRecord

- (MBDomainRecord)initWithDomainName:(id)a3 recordID:(id)a4 pageIndex:(unint64_t)a5 addedOrModifiedAssets:(id)a6 deletedAssets:(id)a7 cumulativeDirectoryCount:(unint64_t)a8 cumulativeRegCount:(unint64_t)a9 cumulativeEmptyRegCount:(unint64_t)a10 cumulativeSymlinkCount:(unint64_t)a11 cumulativeAssetCount:(unint64_t)a12 fileList:(id)a13 fileListEncodingType:(char)a14
{
  id v19 = a3;
  id v20 = a4;
  id v21 = a6;
  id v22 = a7;
  id v28 = a13;
  v29.receiver = self;
  v29.super_class = (Class)MBDomainRecord;
  v23 = [(MBDomainRecord *)&v29 init];
  v24 = v23;
  if (v23)
  {
    objc_storeStrong((id *)&v23->_domainName, a3);
    objc_storeStrong((id *)&v24->_recordID, a4);
    v24->_pageIndex = a5;
    v24->_cumulativeDirectoryCount = a8;
    v24->_cumulativeRegCount = a9;
    v24->_cumulativeEmptyRegCount = a10;
    v24->_cumulativeSymlinkCount = a11;
    v24->_cumulativeAssetCount = a12;
    objc_storeStrong((id *)&v24->_addedOrModifiedAssets, a6);
    objc_storeStrong((id *)&v24->_deletedAssets, a7);
    objc_storeStrong((id *)&v24->_fileList, a13);
    v24->_fileListEncodingType = a14;
    if (a14 == -1) {
      __assert_rtn("-[MBDomainRecord initWithDomainName:recordID:pageIndex:addedOrModifiedAssets:deletedAssets:cumulativeDirectoryCount:cumulativeRegCount:cumulativeEmptyRegCount:cumulativeSymlinkCount:cumulativeAssetCount:fileList:fileListEncodingType:]", "MBDomainRecord.m", 57, "fileListEncodingType != MBFileCompressionMethodDefault");
    }
  }

  return v24;
}

- (id)asCKRecord
{
  id v3 = objc_alloc((Class)CKRecord);
  v4 = [(MBDomainRecord *)self recordID];
  id v5 = [v3 initWithRecordType:@"Domain" recordID:v4];

  v6 = [(MBDomainRecord *)self domainName];
  [v5 setObject:v6 forKeyedSubscript:@"domainName"];

  v7 = [(MBDomainRecord *)self domainName];
  v8 = [v7 dataUsingEncoding:4];
  v9 = [v5 encryptedValues];
  [v9 setObject:v8 forKeyedSubscript:@"domain"];

  v10 = [(MBDomainRecord *)self addedOrModifiedAssets];
  id v11 = [v10 count];

  if (v11)
  {
    v12 = [(MBDomainRecord *)self addedOrModifiedAssets];
    [v5 setObject:v12 forKeyedSubscript:@"newAssets"];
  }
  v13 = [(MBDomainRecord *)self deletedAssets];
  id v14 = [v13 count];

  if (v14)
  {
    v15 = [(MBDomainRecord *)self deletedAssets];
    [v5 setObject:v15 forKeyedSubscript:@"deletedAssets"];
  }
  if (![(MBDomainRecord *)self pageIndex])
  {
    v16 = [(MBDomainRecord *)self fileList];
    [v5 setObject:v16 forKeyedSubscript:@"fileList"];

    v17 = +[NSNumber numberWithChar:[(MBDomainRecord *)self fileListEncodingType]];
    [v5 setObject:v17 forKeyedSubscript:@"fileListEncoding"];

    v18 = +[NSNumber numberWithUnsignedLongLong:[(MBDomainRecord *)self cumulativeDirectoryCount]];
    [v5 setObject:v18 forKeyedSubscript:@"cumulativeDirectoryCount"];

    id v19 = +[NSNumber numberWithUnsignedLongLong:[(MBDomainRecord *)self cumulativeRegCount]];
    [v5 setObject:v19 forKeyedSubscript:@"cumulativeFileCount"];

    id v20 = +[NSNumber numberWithUnsignedLongLong:[(MBDomainRecord *)self cumulativeEmptyRegCount]];
    [v5 setObject:v20 forKeyedSubscript:@"cumulativeEmptyFileCount"];

    id v21 = +[NSNumber numberWithUnsignedLongLong:[(MBDomainRecord *)self cumulativeSymlinkCount]];
    [v5 setObject:v21 forKeyedSubscript:@"cumulativeSymLinkCount"];

    id v22 = +[NSNumber numberWithUnsignedLongLong:[(MBDomainRecord *)self cumulativeAssetCount]];
    [v5 setObject:v22 forKeyedSubscript:@"cumulativeAssetCount"];
  }
  return v5;
}

- (BOOL)decompressAssetIntoSnapshotDirectoryRoot:(id)a3 commitID:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = [(MBDomainRecord *)self fileList];
  id v11 = [v10 fileURL];

  if (!v11) {
    __assert_rtn("-[MBDomainRecord decompressAssetIntoSnapshotDirectoryRoot:commitID:error:]", "MBDomainRecord.m", 91, "assetURL");
  }
  v12 = [v11 path];
  uint64_t v13 = [(MBDomainRecord *)self fileListEncodingType];
  id v14 = [(MBDomainRecord *)self domainName];
  v15 = MBDecompressFileListDB(v12, v13, v8, v9, v14, a5);
  BOOL v16 = v15 != 0;

  return v16;
}

+ (id)domainHmacForDomainName:(id)a3 hmacKey:(id)a4
{
  return MBDomainHMACForDomainName((uint64_t)a3, (uint64_t)a4);
}

+ (id)baseRecordIDForDomain:(id)a3 commitID:(id)a4 hmacKey:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = [(id)objc_opt_class() domainHmacForDomainName:v9 hmacKey:v7];

  id v11 = [objc_alloc((Class)NSString) initWithFormat:@"%@%@:%@", @"N:", v8, v10];
  return v11;
}

+ (id)domainHmacFromBaseRecordID:(id)a3
{
  id v3 = a3;
  if (([v3 hasPrefix:@"N:"] & 1) == 0) {
    __assert_rtn("+[MBDomainRecord domainHmacFromBaseRecordID:]", "MBDomainRecord.m", 107, "[recordID hasPrefix:MBDomainRecordPrefix]");
  }
  v4 = [v3 componentsSeparatedByString:@":"];
  if ([v4 count] != (id)3) {
    __assert_rtn("+[MBDomainRecord domainHmacFromBaseRecordID:]", "MBDomainRecord.m", 110, "components.count == 3");
  }
  id v5 = [v4 objectAtIndexedSubscript:2];

  return v5;
}

+ (id)recordIDFromBaseRecordID:(id)a3 pageIndex:(unint64_t)a4
{
  id v5 = a3;
  v6 = +[MBCKDatabaseManager zoneIDOfType:1];
  id v7 = [objc_alloc((Class)NSString) initWithFormat:@"%@:%llu", v5, a4];

  id v8 = [objc_alloc((Class)CKRecordID) initWithRecordName:v7 zoneID:v6];
  return v8;
}

+ (id)_recordIDForDomain:(id)a3 commitID:(id)a4 hmacKey:(id)a5 pageIndex:(unint64_t)a6
{
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  v12 = [(id)objc_opt_class() baseRecordIDForDomain:v11 commitID:v10 hmacKey:v9];

  uint64_t v13 = [(id)objc_opt_class() recordIDFromBaseRecordID:v12 pageIndex:a6];

  return v13;
}

+ (id)domainRecordForDomain:(id)a3 commitID:(id)a4 addedOrModifiedAssets:(id)a5 deletedAssets:(id)a6 hmacKey:(id)a7 fileListStats:(id *)a8 fileListPath:(id)a9 fileListEncodingType:(char)a10
{
  HIDWORD(v27) = a10;
  id v16 = a9;
  id v17 = a7;
  id v18 = a6;
  id v19 = a5;
  id v20 = a4;
  id v21 = a3;
  id v22 = [(id)objc_opt_class() _recordIDForDomain:v21 commitID:v20 hmacKey:v17 pageIndex:0];

  v23 = +[NSURL fileURLWithPath:v16];

  id v24 = [objc_alloc((Class)CKAsset) initWithFileURL:v23];
  LOBYTE(v27) = a10;
  v25 = [[MBDomainRecord alloc] initWithDomainName:v21 recordID:v22 pageIndex:0 addedOrModifiedAssets:v19 deletedAssets:v18 cumulativeDirectoryCount:a8->var3 cumulativeRegCount:a8->var1 cumulativeEmptyRegCount:a8->var2 cumulativeSymlinkCount:a8->var4 cumulativeAssetCount:a8->var0 fileList:v24 fileListEncodingType:v27];

  return v25;
}

+ (id)domainRecordPageForDomain:(id)a3 commitID:(id)a4 addedOrModifiedAssets:(id)a5 deletedAssets:(id)a6 hmacKey:(id)a7 pageIndex:(unint64_t)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  if (!a8) {
    __assert_rtn("+[MBDomainRecord domainRecordPageForDomain:commitID:addedOrModifiedAssets:deletedAssets:hmacKey:pageIndex:]", "MBDomainRecord.m", 146, "pageIndex != 0");
  }
  id v18 = v17;
  id v19 = [(id)objc_opt_class() _recordIDForDomain:v13 commitID:v14 hmacKey:v17 pageIndex:a8];
  LOBYTE(v22) = 0;
  id v20 = [[MBDomainRecord alloc] initWithDomainName:v13 recordID:v19 pageIndex:a8 addedOrModifiedAssets:v15 deletedAssets:v16 cumulativeDirectoryCount:0 cumulativeRegCount:0 cumulativeEmptyRegCount:0 cumulativeSymlinkCount:0 cumulativeAssetCount:0 fileList:0 fileListEncodingType:v22];

  return v20;
}

+ (id)domainRecordFromCKRecord:(id)a3
{
  id v3 = a3;
  id v28 = [v3 recordID];
  v4 = [v3 encryptedValues];
  v30 = [v4 objectForKeyedSubscript:@"domain"];

  id v5 = [objc_alloc((Class)NSString) initWithData:v30 encoding:4];
  objc_super v29 = [v3 objectForKeyedSubscript:@"cumulativeDirectoryCount"];
  id v25 = [v29 unsignedLongLongValue];
  uint64_t v27 = [v3 objectForKeyedSubscript:@"cumulativeFileCount"];
  id v23 = [v27 unsignedLongLongValue];
  v26 = [v3 objectForKeyedSubscript:@"cumulativeSymLinkCount"];
  id v22 = [v26 unsignedLongLongValue];
  id v24 = [v3 objectForKeyedSubscript:@"cumulativeEmptyFileCount"];
  id v21 = [v24 unsignedLongLongValue];
  v6 = [v3 objectForKeyedSubscript:@"cumulativeAssetCount"];
  id v20 = [v6 unsignedLongLongValue];
  id v7 = [v3 recordID];
  id v8 = [v7 recordName];
  id v9 = [v8 componentsSeparatedByString:@":"];
  id v10 = [v9 lastObject];

  id v11 = [v10 longLongValue];
  v12 = [v3 objectForKeyedSubscript:@"fileList"];
  id v13 = [v3 objectForKeyedSubscript:@"fileListEncoding"];
  unsigned __int8 v14 = [v13 unsignedLongLongValue];
  id v15 = [v3 objectForKeyedSubscript:@"newAssets"];
  id v16 = [v3 objectForKeyedSubscript:@"deletedAssets"];

  LOBYTE(v19) = v14;
  id v17 = [[MBDomainRecord alloc] initWithDomainName:v5 recordID:v28 pageIndex:v11 addedOrModifiedAssets:v15 deletedAssets:v16 cumulativeDirectoryCount:v25 cumulativeRegCount:v23 cumulativeEmptyRegCount:v21 cumulativeSymlinkCount:v22 cumulativeAssetCount:v20 fileList:v12 fileListEncodingType:v19];

  return v17;
}

- (CKRecordID)recordID
{
  return self->_recordID;
}

- (unint64_t)pageIndex
{
  return self->_pageIndex;
}

- (NSArray)addedOrModifiedAssets
{
  return self->_addedOrModifiedAssets;
}

- (NSArray)deletedAssets
{
  return self->_deletedAssets;
}

- (NSString)domainName
{
  return self->_domainName;
}

- (unint64_t)cumulativeDirectoryCount
{
  return self->_cumulativeDirectoryCount;
}

- (unint64_t)cumulativeRegCount
{
  return self->_cumulativeRegCount;
}

- (unint64_t)cumulativeEmptyRegCount
{
  return self->_cumulativeEmptyRegCount;
}

- (unint64_t)cumulativeSymlinkCount
{
  return self->_cumulativeSymlinkCount;
}

- (unint64_t)cumulativeAssetCount
{
  return self->_cumulativeAssetCount;
}

- (char)fileListEncodingType
{
  return self->_fileListEncodingType;
}

- (CKAsset)fileList
{
  return self->_fileList;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileList, 0);
  objc_storeStrong((id *)&self->_domainName, 0);
  objc_storeStrong((id *)&self->_deletedAssets, 0);
  objc_storeStrong((id *)&self->_addedOrModifiedAssets, 0);
  objc_storeStrong((id *)&self->_recordID, 0);
}

@end