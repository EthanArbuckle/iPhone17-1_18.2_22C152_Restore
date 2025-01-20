@interface UGCPhotoViewerDataProvider
- (BOOL)hasDataToShow;
- (BOOL)hasPhotosThatShouldBeObfuscatedWhenInFullScreen;
- (BOOL)hasReachedTotalCount;
- (BOOL)isAllowedToShowAddPhotoCallToAction;
- (NSArray)attributionNames;
- (NSArray)photoList;
- (UGCMorePhotosDataProviderUpdateDelegate)delegate;
- (UGCPhotoAlbumCategory)albumCategory;
- (unint64_t)indexOfTappedPhoto;
- (unint64_t)totalNumberOfPhotos;
- (void)setDelegate:(id)a3;
- (void)setIndexOfTappedPhoto:(unint64_t)a3;
@end

@implementation UGCPhotoViewerDataProvider

- (NSArray)attributionNames
{
  return (NSArray *)&__NSArray0__struct;
}

- (BOOL)isAllowedToShowAddPhotoCallToAction
{
  return 0;
}

- (BOOL)hasDataToShow
{
  return 0;
}

- (BOOL)hasReachedTotalCount
{
  return 1;
}

- (BOOL)hasPhotosThatShouldBeObfuscatedWhenInFullScreen
{
  return 0;
}

- (unint64_t)totalNumberOfPhotos
{
  return 0;
}

- (NSArray)photoList
{
  return (NSArray *)&__NSArray0__struct;
}

- (UGCPhotoAlbumCategory)albumCategory
{
  v2 = [[UGCPhotoAlbumCategory alloc] initWithTitle:&stru_101324E70 categoryType:0];

  return v2;
}

- (unint64_t)indexOfTappedPhoto
{
  return self->indexOfTappedPhoto;
}

- (void)setIndexOfTappedPhoto:(unint64_t)a3
{
  self->indexOfTappedPhoto = a3;
}

- (UGCMorePhotosDataProviderUpdateDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (UGCMorePhotosDataProviderUpdateDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end