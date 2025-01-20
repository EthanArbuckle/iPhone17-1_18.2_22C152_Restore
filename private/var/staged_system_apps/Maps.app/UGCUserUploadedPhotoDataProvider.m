@interface UGCUserUploadedPhotoDataProvider
- (BOOL)hasDataToShow;
- (BOOL)hasReachedTotalCount;
- (BOOL)isAllowedToShowAddPhotoCallToAction;
- (NSArray)attributionNames;
- (NSArray)photoList;
- (UGCPhotoAlbumCategory)albumCategory;
- (UGCUserUploadedPhotoDataProvider)initWithLookupResult:(id)a3 delegate:(id)a4;
- (unint64_t)indexOfTappedPhoto;
- (unint64_t)totalNumberOfPhotos;
- (void)_setupPhotos;
- (void)fetchNextBatchRequestIfNeeded;
- (void)setIndexOfTappedPhoto:(unint64_t)a3;
@end

@implementation UGCUserUploadedPhotoDataProvider

- (UGCUserUploadedPhotoDataProvider)initWithLookupResult:(id)a3 delegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)UGCUserUploadedPhotoDataProvider;
  v9 = [(UGCUserUploadedPhotoDataProvider *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_lookupResult, a3);
    [(UGCPhotoViewerDataProvider *)v10 setDelegate:v8];
    [(UGCUserUploadedPhotoDataProvider *)v10 _setupPhotos];
  }

  return v10;
}

- (BOOL)hasDataToShow
{
  v2 = [(UGCUserUploadedPhotoDataProvider *)self photoList];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (BOOL)hasReachedTotalCount
{
  return 1;
}

- (void)fetchNextBatchRequestIfNeeded
{
  if (!self->_hasNotifiedDelegate)
  {
    BOOL v3 = [(UGCPhotoViewerDataProvider *)self delegate];

    if (v3)
    {
      v4 = [(UGCPhotoViewerDataProvider *)self delegate];
      v5 = [(UGCUserUploadedPhotoDataProvider *)self photoList];
      [v4 photoViewerDataProvider:self didUpdateWithPhotos:v5];

      self->_hasNotifiedDelegate = 1;
    }
  }
}

- (void)_setupPhotos
{
  BOOL v3 = [(UGCSubmissionLookupResult *)self->_lookupResult previousSubmission];
  v4 = [v3 images];
  sub_100099700(v4, &stru_10131C530);
  id v9 = (id)objc_claimAutoreleasedReturnValue();

  if ([v9 count])
  {
    v5 = +[Result resultWithValue:v9];
    userSubmittedPhotosResult = self->_userSubmittedPhotosResult;
    self->_userSubmittedPhotosResult = v5;
  }
  else
  {
    userSubmittedPhotosResult = +[NSError errorWithDomain:NSCocoaErrorDomain code:-1 userInfo:0];
    id v7 = +[Result resultWithError:userSubmittedPhotosResult];
    id v8 = self->_userSubmittedPhotosResult;
    self->_userSubmittedPhotosResult = v7;
  }
}

- (NSArray)attributionNames
{
  return (NSArray *)&__NSArray0__struct;
}

- (NSArray)photoList
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = sub_100104480;
  v11 = sub_100104AB0;
  id v12 = 0;
  userSubmittedPhotosResult = self->_userSubmittedPhotosResult;
  v5[4] = &v7;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100C499C8;
  v6[3] = &unk_1012EEC48;
  v6[4] = &v7;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100C499D8;
  v5[3] = &unk_1012EAC00;
  [userSubmittedPhotosResult withValue:v6 orError:v5];
  id v3 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v3;
}

- (UGCPhotoAlbumCategory)albumCategory
{
  v2 = [UGCPhotoAlbumCategory alloc];
  id v3 = +[NSBundle mainBundle];
  v4 = [v3 localizedStringForKey:@"Your Photos Header [UGC]" value:@"localized string not found" table:0];
  v5 = [(UGCPhotoAlbumCategory *)v2 initWithTitle:v4 categoryType:2];

  return v5;
}

- (BOOL)isAllowedToShowAddPhotoCallToAction
{
  return 1;
}

- (unint64_t)totalNumberOfPhotos
{
  v2 = [(UGCUserUploadedPhotoDataProvider *)self photoList];
  id v3 = [v2 count];

  return (unint64_t)v3;
}

- (unint64_t)indexOfTappedPhoto
{
  return self->_indexOfTappedPhoto;
}

- (void)setIndexOfTappedPhoto:(unint64_t)a3
{
  self->_indexOfTappedPhoto = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userSubmittedPhotosResult, 0);

  objc_storeStrong((id *)&self->_lookupResult, 0);
}

@end