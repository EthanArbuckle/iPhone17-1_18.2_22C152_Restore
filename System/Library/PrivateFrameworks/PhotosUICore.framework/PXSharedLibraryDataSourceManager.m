@interface PXSharedLibraryDataSourceManager
+ (id)currentExitingDataSourceManagerForPhotoLibrary:(id)a3;
+ (id)currentInvitationsDataSourceManagerForPhotoLibrary:(id)a3;
+ (id)currentPreviewDataSourceManagerForPhotoLibrary:(id)a3;
+ (id)currentSharedLibraryDataSourceManagerForPhotoLibrary:(id)a3;
+ (id)exitingDataSourceManagerForPhotoLibrary:(id)a3 type:(int64_t)a4;
+ (id)invitationsDataSourceManagerForPhotoLibrary:(id)a3 type:(int64_t)a4;
+ (id)keyPathsAffectingCurrentExitingDataSourceManager;
+ (id)keyPathsAffectingCurrentInvitationsDataSourceManager;
+ (id)keyPathsAffectingCurrentPreviewDataSourceManager;
+ (id)keyPathsAffectingCurrentSharedLibraryDataSourceManager;
+ (id)previewDataSourceManagerForPhotoLibrary:(id)a3 type:(int64_t)a4;
+ (id)sharedLibraryDataSourceManagerForPhotoLibrary:(id)a3 type:(int64_t)a4;
- (id)fetchExiting;
- (id)fetchPreview;
- (id)fetchSharedLibrary;
- (void)fetchSharedLibraryForURL:(id)a3 completionHandler:(id)a4;
@end

@implementation PXSharedLibraryDataSourceManager

+ (id)currentPreviewDataSourceManagerForPhotoLibrary:(id)a3
{
  id v4 = a3;
  if (PLIsPhotosReliveWidget())
  {
    v5 = objc_alloc_init(PXSharedLibraryEmptyDataSourceManager);
  }
  else
  {
    v6 = +[PXSharedLibrarySettings sharedInstance];
    uint64_t v7 = [v6 previewDataSourceType];

    v5 = [a1 previewDataSourceManagerForPhotoLibrary:v4 type:v7];
  }
  v8 = v5;

  return v8;
}

+ (id)previewDataSourceManagerForPhotoLibrary:(id)a3 type:(int64_t)a4
{
  id v5 = a3;
  switch(a4)
  {
    case 0:
      v6 = +[PXSharedLibraryPhotoKitDataSourceManager previewDataSourceManagerForPhotoLibrary:v5];
      goto LABEL_7;
    case 1:
      v6 = +[PXSharedLibraryMockDataSourceManager ownerPreviewDataSourceManager];
      goto LABEL_7;
    case 2:
      v6 = +[PXSharedLibraryMockDataSourceManager participantPreviewDataSourceManager];
      goto LABEL_7;
    case 3:
      v6 = objc_alloc_init(PXSharedLibraryEmptyDataSourceManager);
LABEL_7:
      uint64_t v7 = v6;
      break;
    default:
      uint64_t v7 = 0;
      break;
  }

  return v7;
}

+ (id)currentInvitationsDataSourceManagerForPhotoLibrary:(id)a3
{
  id v4 = a3;
  if (PLIsPhotosReliveWidget())
  {
    id v5 = objc_alloc_init(PXSharedLibraryEmptyDataSourceManager);
  }
  else
  {
    v6 = +[PXSharedLibrarySettings sharedInstance];
    uint64_t v7 = [v6 invitationsDataSourceType];

    id v5 = [a1 invitationsDataSourceManagerForPhotoLibrary:v4 type:v7];
  }
  v8 = v5;

  return v8;
}

+ (id)invitationsDataSourceManagerForPhotoLibrary:(id)a3 type:(int64_t)a4
{
  id v5 = a3;
  switch(a4)
  {
    case 2:
      v6 = objc_alloc_init(PXSharedLibraryEmptyDataSourceManager);
      goto LABEL_7;
    case 1:
      v6 = +[PXSharedLibraryMockDataSourceManager invitationsDataSourceManager];
      goto LABEL_7;
    case 0:
      v6 = +[PXSharedLibraryPhotoKitDataSourceManager invitationsDataSourceManagerForPhotoLibrary:v5];
LABEL_7:
      uint64_t v7 = v6;
      goto LABEL_9;
  }
  uint64_t v7 = 0;
LABEL_9:

  return v7;
}

+ (id)currentSharedLibraryDataSourceManagerForPhotoLibrary:(id)a3
{
  id v4 = a3;
  if (PLIsPhotosReliveWidget())
  {
    id v5 = objc_alloc_init(PXSharedLibraryEmptyDataSourceManager);
  }
  else
  {
    v6 = +[PXSharedLibrarySettings sharedInstance];
    uint64_t v7 = [v6 sharedLibraryDataSourceType];

    id v5 = [a1 sharedLibraryDataSourceManagerForPhotoLibrary:v4 type:v7];
  }
  v8 = v5;

  return v8;
}

+ (id)sharedLibraryDataSourceManagerForPhotoLibrary:(id)a3 type:(int64_t)a4
{
  id v5 = a3;
  switch(a4)
  {
    case 0:
      v6 = +[PXSharedLibraryPhotoKitDataSourceManager sharedLibraryDataSourceManagerForPhotoLibrary:v5];
      goto LABEL_7;
    case 1:
      v6 = +[PXSharedLibraryMockDataSourceManager ownerSharedLibraryDataSourceManager];
      goto LABEL_7;
    case 2:
      v6 = +[PXSharedLibraryMockDataSourceManager participantSharedLibraryDataSourceManager];
      goto LABEL_7;
    case 3:
      v6 = objc_alloc_init(PXSharedLibraryEmptyDataSourceManager);
LABEL_7:
      uint64_t v7 = v6;
      break;
    default:
      uint64_t v7 = 0;
      break;
  }

  return v7;
}

+ (id)currentExitingDataSourceManagerForPhotoLibrary:(id)a3
{
  id v4 = a3;
  if (PLIsPhotosReliveWidget())
  {
    id v5 = objc_alloc_init(PXSharedLibraryEmptyDataSourceManager);
  }
  else
  {
    v6 = +[PXSharedLibrarySettings sharedInstance];
    uint64_t v7 = [v6 exitingDataSourceType];

    id v5 = [a1 exitingDataSourceManagerForPhotoLibrary:v4 type:v7];
  }
  v8 = v5;

  return v8;
}

+ (id)exitingDataSourceManagerForPhotoLibrary:(id)a3 type:(int64_t)a4
{
  id v5 = a3;
  switch(a4)
  {
    case 0:
      v6 = +[PXSharedLibraryPhotoKitDataSourceManager exitingDataSourceManagerForPhotoLibrary:v5];
      goto LABEL_7;
    case 1:
      v6 = +[PXSharedLibraryMockDataSourceManager ownerExitingDataSourceManager];
      goto LABEL_7;
    case 2:
      v6 = +[PXSharedLibraryMockDataSourceManager participantExitingDataSourceManager];
      goto LABEL_7;
    case 3:
      v6 = objc_alloc_init(PXSharedLibraryEmptyDataSourceManager);
LABEL_7:
      uint64_t v7 = v6;
      break;
    default:
      uint64_t v7 = 0;
      break;
  }

  return v7;
}

- (id)fetchExiting
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  id v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  [v4 handleFailureInMethod:a2, self, @"PXSharedLibraryDataSource.m", 206, @"Method %s is a responsibility of subclass %@", "-[PXSharedLibraryDataSourceManager fetchExiting]", v6 object file lineNumber description];

  abort();
}

- (id)fetchSharedLibrary
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  id v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  [v4 handleFailureInMethod:a2, self, @"PXSharedLibraryDataSource.m", 202, @"Method %s is a responsibility of subclass %@", "-[PXSharedLibraryDataSourceManager fetchSharedLibrary]", v6 object file lineNumber description];

  abort();
}

- (id)fetchPreview
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  id v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  [v4 handleFailureInMethod:a2, self, @"PXSharedLibraryDataSource.m", 198, @"Method %s is a responsibility of subclass %@", "-[PXSharedLibraryDataSourceManager fetchPreview]", v6 object file lineNumber description];

  abort();
}

- (void)fetchSharedLibraryForURL:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [MEMORY[0x1E4F28B00] currentHandler];
  v10 = (objc_class *)objc_opt_class();
  v11 = NSStringFromClass(v10);
  [v9 handleFailureInMethod:a2, self, @"PXSharedLibraryDataSource.m", 194, @"Method %s is a responsibility of subclass %@", "-[PXSharedLibraryDataSourceManager fetchSharedLibraryForURL:completionHandler:]", v11 object file lineNumber description];

  abort();
}

+ (id)keyPathsAffectingCurrentExitingDataSourceManager
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = NSStringFromSelector(sel_exitingDataSourceType);
  v5[0] = v2;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

+ (id)keyPathsAffectingCurrentSharedLibraryDataSourceManager
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = NSStringFromSelector(sel_sharedLibraryDataSourceType);
  v5[0] = v2;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

+ (id)keyPathsAffectingCurrentPreviewDataSourceManager
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = NSStringFromSelector(sel_previewDataSourceType);
  v5[0] = v2;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

+ (id)keyPathsAffectingCurrentInvitationsDataSourceManager
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = NSStringFromSelector(sel_invitationsDataSourceType);
  v5[0] = v2;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

@end