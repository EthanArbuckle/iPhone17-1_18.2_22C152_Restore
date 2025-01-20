@interface MBPeerPreflightResponse
- (MBPeerPreflightResponse)initWithDictionary:(id)a3 error:(id *)a4;
- (MBPeerPreflightResponse)initWithUploadSize:(unint64_t)a3 uploadFileCount:(unint64_t)a4 uploadSizeExcludingHardlinksAndClones:(unint64_t)a5 freeDiskSpace:(unint64_t)a6 purgeableDiskSpace:(unint64_t)a7;
- (NSData)propertiesData;
- (NSString)description;
- (id)dictionaryRepresentation;
- (unint64_t)freeDiskSpace;
- (unint64_t)purgeableDiskSpace;
- (unint64_t)uploadFileCount;
- (unint64_t)uploadSize;
- (unint64_t)uploadSizeExcludingHardlinksAndClones;
- (void)setPropertiesData:(id)a3;
@end

@implementation MBPeerPreflightResponse

- (MBPeerPreflightResponse)initWithUploadSize:(unint64_t)a3 uploadFileCount:(unint64_t)a4 uploadSizeExcludingHardlinksAndClones:(unint64_t)a5 freeDiskSpace:(unint64_t)a6 purgeableDiskSpace:(unint64_t)a7
{
  v13.receiver = self;
  v13.super_class = (Class)MBPeerPreflightResponse;
  result = [(MBPeerPreflightResponse *)&v13 init];
  if (result)
  {
    result->_uploadSize = a3;
    result->_uploadSizeExcludingHardlinksAndClones = a5;
    result->_uploadFileCount = a4;
    result->_freeDiskSpace = a6;
    result->_purgeableDiskSpace = a7;
  }
  return result;
}

- (MBPeerPreflightResponse)initWithDictionary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v20.receiver = self;
  v20.super_class = (Class)MBPeerPreflightResponse;
  v7 = [(MBPeerPreflightResponse *)&v20 init];
  if (!v7) {
    goto LABEL_20;
  }
  v8 = [v6 objectForKeyedSubscript:@"MBUploadSize"];
  v9 = [v6 objectForKeyedSubscript:@"MBUploadFileCount"];
  v10 = [v6 objectForKeyedSubscript:@"MBUploadSizeExcludingHardlinksAndClones"];
  v11 = [v6 objectForKeyedSubscript:@"MBFreeDiskSpace"];
  v12 = [v6 objectForKeyedSubscript:@"MBPurgeableDiskSpace"];
  objc_super v13 = [v6 objectForKeyedSubscript:@"MBPropertiesData"];
  BOOL v14 = !v8 || v9 == 0;
  BOOL v15 = v14 || v11 == 0;
  BOOL v16 = v15 || v12 == 0;
  BOOL v17 = v16;
  if (v16)
  {
    if (a4)
    {
      *a4 = +[MBError errorWithCode:11, @"Failed to decode request. Missing property in dictionary %@", v6 format];
    }
  }
  else
  {
    v7->_uploadSize = (unint64_t)[v8 unsignedLongLongValue];
    v7->_uploadFileCount = (unint64_t)[v9 unsignedLongLongValue];
    v7->_uploadSizeExcludingHardlinksAndClones = (unint64_t)[v10 unsignedLongLongValue];
    v7->_freeDiskSpace = (unint64_t)[v11 unsignedLongLongValue];
    v7->_purgeableDiskSpace = (unint64_t)[v12 unsignedLongLongValue];
    objc_storeStrong((id *)&v7->_propertiesData, v13);
  }

  if (v17) {
    v18 = 0;
  }
  else {
LABEL_20:
  }
    v18 = v7;

  return v18;
}

- (id)dictionaryRepresentation
{
  propertiesData = self->_propertiesData;
  if (propertiesData)
  {
    v17[0] = @"MBUploadSize";
    v4 = propertiesData;
    v5 = +[NSNumber numberWithUnsignedLongLong:[(MBPeerPreflightResponse *)self uploadSize]];
    v18[0] = v5;
    v17[1] = @"MBUploadSizeExcludingHardlinksAndClones";
    id v6 = +[NSNumber numberWithUnsignedLongLong:[(MBPeerPreflightResponse *)self uploadSizeExcludingHardlinksAndClones]];
    v18[1] = v6;
    v17[2] = @"MBUploadFileCount";
    v7 = +[NSNumber numberWithUnsignedLongLong:[(MBPeerPreflightResponse *)self uploadFileCount]];
    v18[2] = v7;
    v17[3] = @"MBFreeDiskSpace";
    v8 = +[NSNumber numberWithUnsignedLongLong:[(MBPeerPreflightResponse *)self freeDiskSpace]];
    v18[3] = v8;
    v17[4] = @"MBPurgeableDiskSpace";
    v9 = +[NSNumber numberWithUnsignedLongLong:[(MBPeerPreflightResponse *)self purgeableDiskSpace]];
    v17[5] = @"MBPropertiesData";
    v18[4] = v9;
    v18[5] = v4;
    v10 = v18;
    v11 = v17;
    uint64_t v12 = 6;
  }
  else
  {
    v15[0] = @"MBUploadSize";
    v5 = +[NSNumber numberWithUnsignedLongLong:[(MBPeerPreflightResponse *)self uploadSize]];
    v16[0] = v5;
    v15[1] = @"MBUploadSizeExcludingHardlinksAndClones";
    id v6 = +[NSNumber numberWithUnsignedLongLong:[(MBPeerPreflightResponse *)self uploadSizeExcludingHardlinksAndClones]];
    v16[1] = v6;
    v15[2] = @"MBUploadFileCount";
    v7 = +[NSNumber numberWithUnsignedLongLong:[(MBPeerPreflightResponse *)self uploadFileCount]];
    v16[2] = v7;
    v15[3] = @"MBFreeDiskSpace";
    v8 = +[NSNumber numberWithUnsignedLongLong:[(MBPeerPreflightResponse *)self freeDiskSpace]];
    v16[3] = v8;
    v15[4] = @"MBPurgeableDiskSpace";
    v9 = +[NSNumber numberWithUnsignedLongLong:[(MBPeerPreflightResponse *)self purgeableDiskSpace]];
    v16[4] = v9;
    v10 = v16;
    v11 = v15;
    uint64_t v12 = 5;
  }
  objc_super v13 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v11 count:v12];

  return v13;
}

- (NSString)description
{
  v3 = (objc_class *)objc_opt_class();
  Name = class_getName(v3);
  unint64_t v5 = [(MBPeerPreflightResponse *)self uploadSize];
  unint64_t v6 = [(MBPeerPreflightResponse *)self uploadSizeExcludingHardlinksAndClones];
  unint64_t v7 = [(MBPeerPreflightResponse *)self uploadFileCount];
  unint64_t v8 = [(MBPeerPreflightResponse *)self freeDiskSpace];
  v9 = [(MBPeerPreflightResponse *)self propertiesData];
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<%s: %p; size=%llu(%llu), fileCount=%llu, freeDiskSpace=%llu, properties.length=%lu>",
    Name,
    self,
    v5,
    v6,
    v7,
    v8,
  v10 = [v9 length]);

  return (NSString *)v10;
}

- (unint64_t)uploadSize
{
  return self->_uploadSize;
}

- (unint64_t)uploadSizeExcludingHardlinksAndClones
{
  return self->_uploadSizeExcludingHardlinksAndClones;
}

- (unint64_t)uploadFileCount
{
  return self->_uploadFileCount;
}

- (unint64_t)freeDiskSpace
{
  return self->_freeDiskSpace;
}

- (unint64_t)purgeableDiskSpace
{
  return self->_purgeableDiskSpace;
}

- (NSData)propertiesData
{
  return (NSData *)objc_getProperty(self, a2, 48, 1);
}

- (void)setPropertiesData:(id)a3
{
}

- (void).cxx_destruct
{
}

@end