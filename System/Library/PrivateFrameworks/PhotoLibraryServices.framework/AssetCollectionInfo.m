@interface AssetCollectionInfo
+ (BOOL)supportsSecureCoding;
- (AssetCollectionInfo)initWithAssetCollection:(id)a3;
- (AssetCollectionInfo)initWithCoder:(id)a3;
- (BOOL)isDeletable;
- (BOOL)isMine;
- (BOOL)isPhotoIris;
- (BOOL)isVideo;
- (NSDate)timestamp;
- (NSDictionary)metaData;
- (NSNumber)height;
- (NSNumber)originalFilesize;
- (NSNumber)width;
- (NSString)GUID;
- (NSString)derivativeUTI;
- (NSString)originalFilename;
- (NSString)personID;
- (id)description;
- (unsigned)playbackVariation;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AssetCollectionInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalFilename, 0);
  objc_storeStrong((id *)&self->_originalFilesize, 0);
  objc_storeStrong((id *)&self->_derivativeUTI, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_height, 0);
  objc_storeStrong((id *)&self->_width, 0);
  objc_storeStrong((id *)&self->_metaData, 0);
  objc_storeStrong((id *)&self->_personID, 0);
  objc_storeStrong((id *)&self->_GUID, 0);
}

- (NSString)originalFilename
{
  return self->_originalFilename;
}

- (NSNumber)originalFilesize
{
  return self->_originalFilesize;
}

- (NSString)derivativeUTI
{
  return self->_derivativeUTI;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (NSNumber)height
{
  return self->_height;
}

- (NSNumber)width
{
  return self->_width;
}

- (NSDictionary)metaData
{
  return self->_metaData;
}

- (BOOL)isDeletable
{
  return self->_isDeletable;
}

- (unsigned)playbackVariation
{
  return self->_playbackVariation;
}

- (BOOL)isPhotoIris
{
  return self->_isPhotoIris;
}

- (BOOL)isVideo
{
  return self->_isVideo;
}

- (BOOL)isMine
{
  return self->_isMine;
}

- (NSString)personID
{
  return self->_personID;
}

- (NSString)GUID
{
  return self->_GUID;
}

- (id)description
{
  v6.receiver = self;
  v6.super_class = (Class)AssetCollectionInfo;
  v3 = [(AssetCollectionInfo *)&v6 description];
  v4 = (void *)[v3 mutableCopy];

  if (self->_GUID) {
    [v4 appendFormat:@" GUID: %@", self->_GUID];
  }
  if (self->_personID) {
    [v4 appendFormat:@" personID: %@", self->_personID];
  }
  if (self->_isMine) {
    objc_msgSend(v4, "appendFormat:", @" isMine: %d", 1);
  }
  if (self->_isVideo) {
    objc_msgSend(v4, "appendFormat:", @" isVideo: %d", 1);
  }
  if (self->_isPhotoIris) {
    objc_msgSend(v4, "appendFormat:", @" isPhotoIris: %d", 1);
  }
  if (self->_isDeletable) {
    objc_msgSend(v4, "appendFormat:", @" isDeletable: %d", 1);
  }
  if (self->_metaData) {
    [v4 appendFormat:@" metaData: %@", self->_metaData];
  }
  if (self->_width) {
    [v4 appendFormat:@" width: %@", self->_width];
  }
  if (self->_height) {
    [v4 appendFormat:@" height: %@", self->_height];
  }
  if (self->_timestamp) {
    [v4 appendFormat:@" timestamp: %@", self->_timestamp];
  }
  if (self->_derivativeUTI) {
    [v4 appendFormat:@" derivativeUTI: %@", self->_derivativeUTI];
  }
  if (self->_originalFilesize) {
    [v4 appendFormat:@" originalFilesize: %@", self->_originalFilesize];
  }
  if (self->_originalFilename) {
    [v4 appendFormat:@" originalFilename: %@", self->_originalFilename];
  }
  return v4;
}

- (AssetCollectionInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)AssetCollectionInfo;
  v5 = [(AssetCollectionInfo *)&v25 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"GUID"];
    GUID = v5->_GUID;
    v5->_GUID = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"personID"];
    personID = v5->_personID;
    v5->_personID = (NSString *)v8;

    uint64_t v10 = [v4 decodePropertyListForKey:@"metaData"];
    metaData = v5->_metaData;
    v5->_metaData = (NSDictionary *)v10;

    v5->_isMine = [v4 decodeBoolForKey:@"isMine"];
    v5->_isVideo = [v4 decodeBoolForKey:@"isVideo"];
    v5->_isPhotoIris = [v4 decodeBoolForKey:@"isPhotoIris"];
    v5->_isDeletable = [v4 decodeBoolForKey:@"isDeletable"];
    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"width"];
    width = v5->_width;
    v5->_width = (NSNumber *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"height"];
    height = v5->_height;
    v5->_height = (NSNumber *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"timestamp"];
    timestamp = v5->_timestamp;
    v5->_timestamp = (NSDate *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"derivativeUTI"];
    derivativeUTI = v5->_derivativeUTI;
    v5->_derivativeUTI = (NSString *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"originalFilesize"];
    originalFilesize = v5->_originalFilesize;
    v5->_originalFilesize = (NSNumber *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"originalFilename"];
    originalFilename = v5->_originalFilename;
    v5->_originalFilename = (NSString *)v22;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  GUID = self->_GUID;
  id v5 = a3;
  [v5 encodeObject:GUID forKey:@"GUID"];
  [v5 encodeObject:self->_personID forKey:@"personID"];
  [v5 encodeObject:self->_metaData forKey:@"metaData"];
  [v5 encodeBool:self->_isMine forKey:@"isMine"];
  [v5 encodeBool:self->_isVideo forKey:@"isVideo"];
  [v5 encodeBool:self->_isPhotoIris forKey:@"isPhotoIris"];
  [v5 encodeBool:self->_isDeletable forKey:@"isDeletable"];
  [v5 encodeObject:self->_width forKey:@"width"];
  [v5 encodeObject:self->_height forKey:@"height"];
  [v5 encodeObject:self->_timestamp forKey:@"timestamp"];
  [v5 encodeObject:self->_derivativeUTI forKey:@"derivativeUTI"];
  [v5 encodeObject:self->_originalFilesize forKey:@"originalFilesize"];
  [v5 encodeObject:self->_originalFilename forKey:@"originalFilename"];
}

- (AssetCollectionInfo)initWithAssetCollection:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v45.receiver = self;
  v45.super_class = (Class)AssetCollectionInfo;
  id v5 = [(AssetCollectionInfo *)&v45 init];
  if (v5)
  {
    uint64_t v6 = [v4 GUID];
    GUID = v5->_GUID;
    v5->_GUID = (NSString *)v6;

    uint64_t v8 = [v4 personID];
    personID = v5->_personID;
    v5->_personID = (NSString *)v8;

    v5->_isMine = [v4 isMine];
    v5->_isVideo = [v4 isVideo];
    v5->_isPhotoIris = [v4 isPhotoIris];
    v5->_isDeletable = [v4 isDeletable];
    uint64_t v10 = [v4 metadata];
    metaData = v5->_metaData;
    v5->_metaData = (NSDictionary *)v10;

    uint64_t v12 = [v4 timestamp];
    timestamp = v5->_timestamp;
    v5->_timestamp = (NSDate *)v12;

    uint64_t v14 = [(id)*MEMORY[0x1E4F44410] identifier];
    derivativeUTI = v5->_derivativeUTI;
    v5->_derivativeUTI = (NSString *)v14;

    uint64_t v16 = [v4 fileName];
    originalFilename = v5->_originalFilename;
    v5->_originalFilename = (NSString *)v16;

    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    uint64_t v18 = objc_msgSend(v4, "assets", 0);
    uint64_t v19 = [v18 countByEnumeratingWithState:&v41 objects:v46 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v42;
      while (2)
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v42 != v21) {
            objc_enumerationMutation(v18);
          }
          v23 = *(void **)(*((void *)&v41 + 1) + 8 * i);
          uint64_t v24 = [v23 mediaAssetType];
          if (v24 != 3 && (v24 != 7 || v5->_isPhotoIris)) {
            continue;
          }
          v26 = [v23 metadata];
          v27 = v26;
          if (v26)
          {
            uint64_t v28 = [v26 objectForKey:*MEMORY[0x1E4F5C720]];
            width = v5->_width;
            v5->_width = (NSNumber *)v28;

            uint64_t v30 = [v27 objectForKey:*MEMORY[0x1E4F5C718]];
            height = v5->_height;
            v5->_height = (NSNumber *)v30;

            uint64_t v32 = [v27 objectForKey:*MEMORY[0x1E4F5C710]];
            originalFilesize = v5->_originalFilesize;
            v5->_originalFilesize = (NSNumber *)v32;
          }
          v34 = [v23 type];
          if (v34) {
            objc_storeStrong((id *)&v5->_derivativeUTI, v34);
          }

          goto LABEL_20;
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v41 objects:v46 count:16];
        if (v20) {
          continue;
        }
        break;
      }
    }
LABEL_20:

    if (!v5->_width)
    {
      LODWORD(v35) = 1.0;
      uint64_t v36 = [NSNumber numberWithFloat:v35];
      v37 = v5->_width;
      v5->_width = (NSNumber *)v36;
    }
    if (!v5->_height)
    {
      LODWORD(v35) = 1.0;
      uint64_t v38 = [NSNumber numberWithFloat:v35];
      v39 = v5->_height;
      v5->_height = (NSNumber *)v38;
    }
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end