@interface PLCameraPreviewWellAssetInfo
- (BOOL)hidden;
- (NSDate)addedDate;
- (NSString)thumbnailIdentifier;
- (NSString)uuid;
- (PLCameraPreviewWellAssetInfo)initWithUUID:(id)a3 sortToken:(double)a4 addedDate:(id)a5 hidden:(BOOL)a6 visibilityState:(signed __int16)a7 trashedState:(signed __int16)a8 avalanchePickType:(int)a9 savedAssetType:(signed __int16)a10 thumbnailIdentifier:(id)a11 pathManager:(id)a12;
- (PLPhotoLibraryPathManager)pathManager;
- (double)sortToken;
- (int)avalanchePickType;
- (signed)savedAssetType;
- (signed)trashedState;
- (signed)visibilityState;
@end

@implementation PLCameraPreviewWellAssetInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pathManager, 0);
  objc_storeStrong((id *)&self->_thumbnailIdentifier, 0);
  objc_storeStrong((id *)&self->_addedDate, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

- (PLPhotoLibraryPathManager)pathManager
{
  return self->_pathManager;
}

- (NSString)thumbnailIdentifier
{
  return self->_thumbnailIdentifier;
}

- (signed)savedAssetType
{
  return self->_savedAssetType;
}

- (int)avalanchePickType
{
  return self->_avalanchePickType;
}

- (signed)trashedState
{
  return self->_trashedState;
}

- (signed)visibilityState
{
  return self->_visibilityState;
}

- (BOOL)hidden
{
  return self->_hidden;
}

- (NSDate)addedDate
{
  return self->_addedDate;
}

- (double)sortToken
{
  return self->_sortToken;
}

- (NSString)uuid
{
  return self->_uuid;
}

- (PLCameraPreviewWellAssetInfo)initWithUUID:(id)a3 sortToken:(double)a4 addedDate:(id)a5 hidden:(BOOL)a6 visibilityState:(signed __int16)a7 trashedState:(signed __int16)a8 avalanchePickType:(int)a9 savedAssetType:(signed __int16)a10 thumbnailIdentifier:(id)a11 pathManager:(id)a12
{
  id v19 = a3;
  id v20 = a5;
  id v26 = a11;
  id v25 = a12;
  v27.receiver = self;
  v27.super_class = (Class)PLCameraPreviewWellAssetInfo;
  v21 = [(PLCameraPreviewWellAssetInfo *)&v27 init];
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_uuid, a3);
    v22->_sortToken = a4;
    objc_storeStrong((id *)&v22->_addedDate, a5);
    v22->_hidden = a6;
    v22->_visibilityState = a7;
    v22->_trashedState = a8;
    v22->_avalanchePickType = a9;
    v22->_savedAssetType = a10;
    objc_storeStrong((id *)&v22->_thumbnailIdentifier, a11);
    objc_storeStrong((id *)&v22->_pathManager, a12);
  }

  return v22;
}

@end