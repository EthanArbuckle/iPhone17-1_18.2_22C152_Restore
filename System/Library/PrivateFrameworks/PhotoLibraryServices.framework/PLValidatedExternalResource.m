@interface PLValidatedExternalResource
+ (id)resourceWithExternalResource:(id)a3;
- (BOOL)hasRecipe;
- (BOOL)isDerivative;
- (BOOL)isEqualToValidatedExternalResource:(id)a3;
- (BOOL)isOriginalResource;
- (BOOL)isPlayableVideo;
- (NSDate)trashedDate;
- (NSNumber)sidecarIndex;
- (NSString)codecFourCharCode;
- (NSString)description;
- (NSURL)fileURL;
- (PLUniformTypeIdentifier)uniformTypeIdentifier;
- (PLValidatedExternalResource)init;
- (int64_t)dataLength;
- (int64_t)ptpTrashedState;
- (int64_t)unorientedHeight;
- (int64_t)unorientedWidth;
- (signed)trashedState;
- (unint64_t)cplTypeWithAssetID:(id)a3;
- (unsigned)recipeID;
- (unsigned)resourceType;
- (unsigned)version;
- (void)persistResourceTypeToFileURL;
- (void)setCodecFourCharCode:(id)a3;
- (void)setDataLength:(int64_t)a3;
- (void)setFileURL:(id)a3;
- (void)setPtpTrashedState:(int64_t)a3;
- (void)setRecipeID:(unsigned int)a3;
- (void)setResourceType:(unsigned int)a3;
- (void)setSidecarIndex:(id)a3;
- (void)setTrashedDate:(id)a3;
- (void)setTrashedState:(signed __int16)a3;
- (void)setTrashedStateFromURL;
- (void)setUniformTypeIdentifier:(id)a3;
- (void)setUnorientedHeight:(int64_t)a3;
- (void)setUnorientedWidth:(int64_t)a3;
- (void)setVersion:(unsigned int)a3;
@end

@implementation PLValidatedExternalResource

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trashedDate, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);
  objc_storeStrong((id *)&self->_sidecarIndex, 0);
  objc_storeStrong((id *)&self->_uniformTypeIdentifier, 0);
  objc_storeStrong((id *)&self->_codecFourCharCode, 0);
}

- (void)setPtpTrashedState:(int64_t)a3
{
  self->_ptpTrashedState = a3;
}

- (int64_t)ptpTrashedState
{
  return self->_ptpTrashedState;
}

- (void)setTrashedDate:(id)a3
{
}

- (NSDate)trashedDate
{
  return self->_trashedDate;
}

- (void)setTrashedState:(signed __int16)a3
{
  self->_trashedState = a3;
}

- (signed)trashedState
{
  return self->_trashedState;
}

- (void)setFileURL:(id)a3
{
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (void)setSidecarIndex:(id)a3
{
}

- (NSNumber)sidecarIndex
{
  return self->_sidecarIndex;
}

- (void)setDataLength:(int64_t)a3
{
  self->_dataLength = a3;
}

- (int64_t)dataLength
{
  return self->_dataLength;
}

- (void)setUniformTypeIdentifier:(id)a3
{
}

- (PLUniformTypeIdentifier)uniformTypeIdentifier
{
  return self->_uniformTypeIdentifier;
}

- (void)setCodecFourCharCode:(id)a3
{
}

- (NSString)codecFourCharCode
{
  return self->_codecFourCharCode;
}

- (void)setUnorientedHeight:(int64_t)a3
{
  self->_unorientedHeight = a3;
}

- (int64_t)unorientedHeight
{
  return self->_unorientedHeight;
}

- (void)setUnorientedWidth:(int64_t)a3
{
  self->_unorientedWidth = a3;
}

- (int64_t)unorientedWidth
{
  return self->_unorientedWidth;
}

- (void)setRecipeID:(unsigned int)a3
{
  self->_recipeID = a3;
}

- (unsigned)recipeID
{
  return self->_recipeID;
}

- (void)setResourceType:(unsigned int)a3
{
  self->_resourceType = a3;
}

- (unsigned)resourceType
{
  return self->_resourceType;
}

- (void)setVersion:(unsigned int)a3
{
  self->_version = a3;
}

- (unsigned)version
{
  return self->_version;
}

- (NSString)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  unsigned int v6 = [(PLValidatedExternalResource *)self resourceType];
  if (v6 > 0x1F) {
    v7 = @"invalid";
  }
  else {
    v7 = off_1E58641E0[v6];
  }
  v8 = v7;
  unsigned int v9 = [(PLValidatedExternalResource *)self version];
  if (v9 > 2) {
    v10 = @"cur";
  }
  else {
    v10 = off_1E58642E0[v9];
  }
  v11 = v10;
  int64_t v12 = [(PLValidatedExternalResource *)self unorientedWidth];
  int64_t v13 = [(PLValidatedExternalResource *)self unorientedHeight];
  v14 = [(PLValidatedExternalResource *)self uniformTypeIdentifier];
  v15 = [v14 identifier];
  v16 = [v3 stringWithFormat:@"<%@: %p> type: %@, ver: %@, width: %lu, height: %lu, uti: %@", v5, self, v8, v11, v12, v13, v15];

  return (NSString *)v16;
}

- (void)persistResourceTypeToFileURL
{
  v3 = (void *)MEMORY[0x1E4F8B900];
  v4 = [(PLValidatedExternalResource *)self fileURL];
  id v6 = [v3 filesystemPersistenceBatchItemForFileAtURL:v4];

  unsigned __int16 v5 = [(PLValidatedExternalResource *)self resourceType];
  [v6 setUInt16:v5 forKey:*MEMORY[0x1E4F8C418]];
  [v6 persist];
}

- (BOOL)isEqualToValidatedExternalResource:(id)a3
{
  id v4 = a3;
  if (!v4) {
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || !PLResourceIdentityIsEqual(self, v4)) {
    goto LABEL_8;
  }
  unsigned __int16 v5 = [(PLValidatedExternalResource *)self fileURL];

  if (!v5)
  {
    v10 = [v4 fileURL];

    if (!v10) {
      goto LABEL_6;
    }
LABEL_8:
    BOOL v9 = 0;
    goto LABEL_9;
  }
  id v6 = [(PLValidatedExternalResource *)self fileURL];
  v7 = [v4 fileURL];
  char v8 = [v6 isEqual:v7];

  if ((v8 & 1) == 0) {
    goto LABEL_8;
  }
LABEL_6:
  BOOL v9 = 1;
LABEL_9:

  return v9;
}

- (void)setTrashedStateFromURL
{
  uint64_t v3 = [(PLValidatedExternalResource *)self fileURL];
  if (v3)
  {
    id v4 = (void *)v3;
    BOOL v5 = +[PLInternalResource supportsTrashedStateForResourceIdentity:self];

    if (v5)
    {
      id v6 = (void *)MEMORY[0x1E4F8B900];
      v7 = [(PLValidatedExternalResource *)self fileURL];
      char v8 = [v6 persistedAttributesForFileAtURL:v7];

      __int16 v11 = 0;
      if ([v8 getUInt16:&v11 forKey:*MEMORY[0x1E4F8C460]]) {
        BOOL v9 = v11 == 0;
      }
      else {
        BOOL v9 = 1;
      }
      if (!v9)
      {
        [(PLValidatedExternalResource *)self setTrashedState:1];
        v10 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:2592000.0];
        [(PLValidatedExternalResource *)self setTrashedDate:v10];
      }
    }
  }
}

- (unint64_t)cplTypeWithAssetID:(id)a3
{
  id v4 = a3;
  if ([(PLValidatedExternalResource *)self isDerivative])
  {
    unint64_t v5 = +[PLResourceInstaller derivativeCPLTypeFromRecipeID:[(PLValidatedExternalResource *)self recipeID] version:[(PLValidatedExternalResource *)self version]];
  }
  else
  {
    id v6 = [(PLValidatedExternalResource *)self fileURL];
    v7 = [v6 lastPathComponent];

    if ([(PLValidatedExternalResource *)self version]
      || ([v4 filename],
          char v8 = objc_claimAutoreleasedReturnValue(),
          char v9 = [v7 isEqualToString:v8],
          v8,
          (v9 & 1) == 0))
    {
      uint64_t v10 = [(PLValidatedExternalResource *)self resourceType];
      uint64_t v11 = [(PLValidatedExternalResource *)self version];
      int64_t v12 = [(PLValidatedExternalResource *)self uniformTypeIdentifier];
      unint64_t v5 = +[PLResourceInstaller nonDerivativeCPLTypeFromResourceType:v10 version:v11 uniformTypeIdentifier:v12];
    }
    else
    {
      unint64_t v5 = 1;
    }
  }
  return v5;
}

- (BOOL)isPlayableVideo
{
  return 0;
}

- (BOOL)hasRecipe
{
  return [(PLValidatedExternalResource *)self recipeID] != 0;
}

- (BOOL)isDerivative
{
  return [(PLValidatedExternalResource *)self recipeID] & 1;
}

- (BOOL)isOriginalResource
{
  v2 = self;
  if ([(PLValidatedExternalResource *)v2 version]) {
    BOOL v3 = 0;
  }
  else {
    BOOL v3 = ([(PLValidatedExternalResource *)v2 recipeID] & 1) == 0;
  }

  return v3;
}

- (PLValidatedExternalResource)init
{
  v3.receiver = self;
  v3.super_class = (Class)PLValidatedExternalResource;
  return [(PLValidatedExternalResource *)&v3 init];
}

+ (id)resourceWithExternalResource:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)a1);
  objc_msgSend(v5, "setResourceType:", objc_msgSend(v4, "resourceType"));
  objc_msgSend(v5, "setVersion:", objc_msgSend(v4, "version"));
  objc_msgSend(v5, "setRecipeID:", objc_msgSend(v4, "recipeID"));
  id v6 = [v4 uniformTypeIdentifier];
  [v5 setUniformTypeIdentifier:v6];

  v7 = [v4 fileURL];
  [v5 setFileURL:v7];

  objc_msgSend(v5, "setDataLength:", objc_msgSend(v4, "dataLength"));
  objc_msgSend(v5, "setUnorientedWidth:", objc_msgSend(v4, "unorientedWidth"));
  objc_msgSend(v5, "setUnorientedHeight:", objc_msgSend(v4, "unorientedHeight"));
  char v8 = [v4 codecFourCharCode];
  [v5 setCodecFourCharCode:v8];

  objc_msgSend(v5, "setTrashedState:", objc_msgSend(v4, "trashedState"));
  char v9 = [v4 trashedDate];
  [v5 setTrashedDate:v9];

  objc_msgSend(v5, "setPtpTrashedState:", objc_msgSend(v4, "ptpTrashedState"));
  uint64_t v10 = [v4 sidecarIndex];

  [v5 setSidecarIndex:v10];
  return v5;
}

@end