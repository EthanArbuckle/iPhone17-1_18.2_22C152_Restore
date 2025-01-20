@interface MBAssetMetadata
+ (id)assetMetadataForEmptyFileWithEncryptionKey:(id)a3;
+ (id)assetMetadataForFilePendingUploadWithEncryptionKey:(id)a3 size:(int64_t)a4;
+ (id)assetMetadataForUploadedRecordWithRecordIDSuffix:(id)a3 signature:(id)a4 size:(int64_t)a5 type:(unint64_t)a6 compressionMethod:(char)a7;
+ (id)assetMetadataFromRecordIDSuffix:(id)a3 signature:(id)a4 size:(int64_t)a5 type:(unint64_t)a6 compressionMethod:(char)a7 encryptionKey:(id)a8;
- (BOOL)isPendingUpload;
- (MBAssetMetadata)initWithRecordIDSuffix:(id)a3 signature:(id)a4 size:(int64_t)a5 type:(unint64_t)a6 compressionMethod:(char)a7 encryptionKey:(id)a8;
- (NSData)assetSignature;
- (NSData)encryptionKey;
- (NSString)recordIDSuffix;
- (char)compressionMethod;
- (id)description;
- (id)dictionaryRepresentation;
- (id)stringRepresentation;
- (int64_t)assetSize;
- (unint64_t)assetType;
@end

@implementation MBAssetMetadata

+ (id)assetMetadataForFilePendingUploadWithEncryptionKey:(id)a3 size:(int64_t)a4
{
  id v5 = a3;
  v6 = [[MBAssetMetadata alloc] initWithRecordIDSuffix:0 signature:0 size:a4 type:1 compressionMethod:0 encryptionKey:v5];

  return v6;
}

+ (id)assetMetadataForEmptyFileWithEncryptionKey:(id)a3
{
  id v3 = a3;
  v4 = [[MBAssetMetadata alloc] initWithRecordIDSuffix:@"EMPTY_FILE" signature:0 size:0 type:4 compressionMethod:0 encryptionKey:v3];

  return v4;
}

+ (id)assetMetadataForUploadedRecordWithRecordIDSuffix:(id)a3 signature:(id)a4 size:(int64_t)a5 type:(unint64_t)a6 compressionMethod:(char)a7
{
  uint64_t v7 = a7;
  id v11 = a3;
  id v12 = a4;
  if (!a6) {
    __assert_rtn("+[MBAssetMetadata assetMetadataForUploadedRecordWithRecordIDSuffix:signature:size:type:compressionMethod:]", "MBFileMetadata.m", 40, "type != MBAssetTypeUnknown");
  }
  v13 = v12;
  v14 = [[MBAssetMetadata alloc] initWithRecordIDSuffix:v11 signature:v12 size:a5 type:a6 compressionMethod:v7 encryptionKey:0];

  return v14;
}

+ (id)assetMetadataFromRecordIDSuffix:(id)a3 signature:(id)a4 size:(int64_t)a5 type:(unint64_t)a6 compressionMethod:(char)a7 encryptionKey:(id)a8
{
  uint64_t v9 = a7;
  id v13 = a3;
  id v14 = a4;
  id v15 = a8;
  if (!a6) {
    __assert_rtn("+[MBAssetMetadata assetMetadataFromRecordIDSuffix:signature:size:type:compressionMethod:encryptionKey:]", "MBFileMetadata.m", 46, "type != MBAssetTypeUnknown");
  }
  v16 = v15;
  v17 = [[MBAssetMetadata alloc] initWithRecordIDSuffix:v13 signature:v14 size:a5 type:a6 compressionMethod:v9 encryptionKey:v15];

  return v17;
}

- (MBAssetMetadata)initWithRecordIDSuffix:(id)a3 signature:(id)a4 size:(int64_t)a5 type:(unint64_t)a6 compressionMethod:(char)a7 encryptionKey:(id)a8
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a8;
  v21.receiver = self;
  v21.super_class = (Class)MBAssetMetadata;
  v18 = [(MBAssetMetadata *)&v21 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_recordIDSuffix, a3);
    objc_storeStrong((id *)&v19->_assetSignature, a4);
    v19->_assetSize = a5;
    v19->_assetType = a6;
    v19->_compressionMethod = a7;
    objc_storeStrong((id *)&v19->_encryptionKey, a8);
  }

  return v19;
}

- (id)stringRepresentation
{
  id v3 = objc_opt_new();
  v4 = v3;
  switch(self->_assetType)
  {
    case 1uLL:
      goto LABEL_7;
    case 2uLL:
      CFStringRef v5 = @"raw-encrypted";
      goto LABEL_6;
    case 3uLL:
      CFStringRef v5 = @"compacted-sqlite";
      goto LABEL_6;
    case 4uLL:
      CFStringRef v5 = @"empty-reg";
      goto LABEL_6;
    default:
      CFStringRef v5 = @"unknown";
LABEL_6:
      [v3 appendFormat:@"type %@, ", v5];
LABEL_7:
      if (self->_compressionMethod)
      {
        v6 = MBStringForFileCompressionMethod(self->_compressionMethod);
        [v4 appendFormat:@"compressionMethod/size %@(%llu), ", v6, self->_assetSize];
      }
      encryptionKey = self->_encryptionKey;
      if (encryptionKey) {
        [v4 appendFormat:@"keySize %lu, ", -[NSData length](encryptionKey, "length")];
      }
      v8 = [(NSData *)self->_assetSignature base64EncodedStringWithOptions:0];
      [v4 appendFormat:@"sig %@, rid %@", v8, self->_recordIDSuffix];

      return v4;
  }
}

- (id)dictionaryRepresentation
{
  id v3 = objc_opt_new();
  [v3 setObject:self->_recordIDSuffix forKeyedSubscript:@"recordIDSuffix"];
  v4 = +[NSNumber numberWithLongLong:self->_assetSize];
  [v3 setObject:v4 forKeyedSubscript:@"size"];

  CFStringRef v5 = +[NSNumber numberWithUnsignedLongLong:self->_assetType];
  [v3 setObject:v5 forKeyedSubscript:@"type"];

  v6 = +[NSNumber numberWithChar:self->_compressionMethod];
  [v3 setObject:v6 forKeyedSubscript:@"compressionMethod"];

  assetSignature = self->_assetSignature;
  if (assetSignature)
  {
    v8 = [(NSData *)assetSignature base64EncodedStringWithOptions:0];
    [v3 setObject:v8 forKeyedSubscript:@"signature"];
  }
  encryptionKey = self->_encryptionKey;
  if (encryptionKey)
  {
    v10 = [(NSData *)encryptionKey base64EncodedStringWithOptions:0];
    [v3 setObject:v10 forKeyedSubscript:@"encryptionKey"];
  }
  return v3;
}

- (BOOL)isPendingUpload
{
  if ((id)[(MBAssetMetadata *)self assetType] == (id)4) {
    return 0;
  }
  v4 = [(MBAssetMetadata *)self recordIDSuffix];
  if (v4)
  {
    CFStringRef v5 = [(MBAssetMetadata *)self assetSignature];
    BOOL v3 = v5 == 0;
  }
  else
  {
    BOOL v3 = 1;
  }

  return v3;
}

- (id)description
{
  BOOL v3 = (objc_class *)objc_opt_class();
  Name = class_getName(v3);
  CFStringRef v5 = [(MBAssetMetadata *)self stringRepresentation];
  v6 = +[NSString stringWithFormat:@"<%s: %p, %@>", Name, self, v5];

  return v6;
}

- (NSString)recordIDSuffix
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSData)assetSignature
{
  return (NSData *)objc_getProperty(self, a2, 24, 1);
}

- (int64_t)assetSize
{
  return self->_assetSize;
}

- (unint64_t)assetType
{
  return self->_assetType;
}

- (char)compressionMethod
{
  return self->_compressionMethod;
}

- (NSData)encryptionKey
{
  return self->_encryptionKey;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encryptionKey, 0);
  objc_storeStrong((id *)&self->_assetSignature, 0);
  objc_storeStrong((id *)&self->_recordIDSuffix, 0);
}

@end