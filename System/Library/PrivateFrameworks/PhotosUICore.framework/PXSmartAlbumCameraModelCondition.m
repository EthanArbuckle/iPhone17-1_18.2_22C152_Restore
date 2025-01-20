@interface PXSmartAlbumCameraModelCondition
+ (id)defaultSingleQueryForEditingContext:(id)a3;
- (NSArray)cameraModels;
- (NSString)cameraModel;
- (void)setCameraModel:(id)a3;
@end

@implementation PXSmartAlbumCameraModelCondition

+ (id)defaultSingleQueryForEditingContext:(id)a3
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F8B9E8]);
  [v3 setKey:301];
  [v3 setStringValue:&stru_1F00B0030];
  [v3 setComparator:20];
  return v3;
}

- (void).cxx_destruct
{
}

- (void)setCameraModel:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"PXSmartAlbumEXIFCondition.m", 121, @"Invalid parameter not satisfying: %@", @"cameraModel" object file lineNumber description];
  }
  v6 = [(PXSmartAlbumCondition *)self singleQuery];
  [v6 setStringValue:v5];
  v7 = PLUIGetLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v11 = v5;
    _os_log_impl(&dword_1A9AE7000, v7, OS_LOG_TYPE_DEBUG, "PXSmartAlbums: camera model set to: \"%@\"", buf, 0xCu);
  }

  v8 = [(PXSmartAlbumCondition *)self delegate];
  [v8 conditionDidChange:self];
}

- (NSString)cameraModel
{
  v2 = [(PXSmartAlbumCondition *)self singleQuery];
  id v3 = [v2 stringValue];

  return (NSString *)v3;
}

- (NSArray)cameraModels
{
  cameraModels = self->_cameraModels;
  if (!cameraModels)
  {
    v4 = [(PXSmartAlbumCondition *)self editingContext];
    id v5 = [v4 cameraModels];
    v6 = self->_cameraModels;
    self->_cameraModels = v5;

    cameraModels = self->_cameraModels;
  }
  return cameraModels;
}

@end