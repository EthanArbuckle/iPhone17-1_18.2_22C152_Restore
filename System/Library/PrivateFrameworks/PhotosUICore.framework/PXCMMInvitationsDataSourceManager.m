@interface PXCMMInvitationsDataSourceManager
+ (NSArray)keyPathsAffectingCurrentDataSourceManager;
+ (id)currentDataSourceManager;
+ (id)currentDataSourceManagerForPhotoLibrary:(id)a3 momentSharePhotoLibrary:(id)a4;
+ (id)currentDataSourceManagerForPhotoLibrary:(id)a3 momentSharePhotoLibrary:(id)a4 fetchLimit:(int64_t)a5;
+ (id)emptyDataSourceManager;
- (PXMediaProvider)mediaProvider;
- (int64_t)filter;
- (void)setFilter:(int64_t)a3;
@end

@implementation PXCMMInvitationsDataSourceManager

+ (NSArray)keyPathsAffectingCurrentDataSourceManager
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = NSStringFromSelector(sel_invitationsDataSourceType);
  v5[0] = v2;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return (NSArray *)v3;
}

+ (id)currentDataSourceManagerForPhotoLibrary:(id)a3 momentSharePhotoLibrary:(id)a4 fetchLimit:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = +[PXCompleteMyMomentSettings sharedInstance];
  uint64_t v11 = [v10 invitationsDataSourceType];

  switch(v11)
  {
    case 0:
      v12 = [[PXCMMMomentShareInvitationsDataSourceManager alloc] initWithPhotoLibrary:v9 fetchLimit:a5];
      goto LABEL_8;
    case 1:
      v14 = PXCMMMomentsInvitationsDataSourceManager;
      goto LABEL_6;
    case 2:
      v14 = PXCMMSharedAlbumsInvitationsDataSourceManager;
LABEL_6:
      v12 = (PXCMMMomentShareInvitationsDataSourceManager *)[[v14 alloc] initWithPhotoLibrary:v8];
      goto LABEL_8;
    case 3:
      v12 = [a1 emptyDataSourceManager];
LABEL_8:
      v13 = v12;
      break;
    default:
      v13 = 0;
      break;
  }

  return v13;
}

+ (id)currentDataSourceManagerForPhotoLibrary:(id)a3 momentSharePhotoLibrary:(id)a4
{
  return (id)[a1 currentDataSourceManagerForPhotoLibrary:a3 momentSharePhotoLibrary:a4 fetchLimit:0];
}

+ (id)currentDataSourceManager
{
  v3 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
  v4 = [MEMORY[0x1E4F39228] sharedMomentSharePhotoLibrary];
  v5 = [a1 currentDataSourceManagerForPhotoLibrary:v3 momentSharePhotoLibrary:v4];

  return v5;
}

+ (id)emptyDataSourceManager
{
  v2 = objc_alloc_init(PXCMMInvitationsEmptyDataSourceManager);
  return v2;
}

- (void)setFilter:(int64_t)a3
{
  self->_filter = a3;
}

- (int64_t)filter
{
  return self->_filter;
}

- (PXMediaProvider)mediaProvider
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  [v4 handleFailureInMethod:a2, self, @"PXCMMInvitationsDataSourceManager.m", 95, @"Method %s is a responsibility of subclass %@", "-[PXCMMInvitationsDataSourceManager mediaProvider]", v6 object file lineNumber description];

  abort();
}

@end