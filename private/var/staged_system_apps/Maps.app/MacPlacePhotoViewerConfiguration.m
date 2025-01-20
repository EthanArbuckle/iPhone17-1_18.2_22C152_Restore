@interface MacPlacePhotoViewerConfiguration
- (MKMapItem)mapItem;
- (MUPlacePhotoGalleryViewController)photoGalleryViewController;
- (MacPlacePhotoViewerConfiguration)initWithMapItem:(id)a3 photoGalleryViewController:(id)a4;
- (MacPlacePhotoViewerConfiguration)initWithMapItem:(id)a3 startingContext:(int64_t)a4;
- (UGCSubmissionLookupResult)userSubmissionLookupResult;
- (int64_t)startingContext;
- (unint64_t)albumIndex;
- (unint64_t)selectedPhotoIndex;
- (void)setAlbumIndex:(unint64_t)a3;
- (void)setMapItem:(id)a3;
- (void)setPhotoGalleryViewController:(id)a3;
- (void)setSelectedPhotoIndex:(unint64_t)a3;
- (void)setStartingContext:(int64_t)a3;
- (void)setUserSubmissionLookupResult:(id)a3;
@end

@implementation MacPlacePhotoViewerConfiguration

- (MacPlacePhotoViewerConfiguration)initWithMapItem:(id)a3 startingContext:(int64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MacPlacePhotoViewerConfiguration;
  v8 = [(MacPlacePhotoViewerConfiguration *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_mapItem, a3);
    v9->_startingContext = a4;
  }

  return v9;
}

- (MacPlacePhotoViewerConfiguration)initWithMapItem:(id)a3 photoGalleryViewController:(id)a4
{
  id v7 = a4;
  v8 = [(MacPlacePhotoViewerConfiguration *)self initWithMapItem:a3 startingContext:2];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_photoGalleryViewController, a4);
  }

  return v9;
}

- (int64_t)startingContext
{
  return self->_startingContext;
}

- (void)setStartingContext:(int64_t)a3
{
  self->_startingContext = a3;
}

- (MKMapItem)mapItem
{
  return self->_mapItem;
}

- (void)setMapItem:(id)a3
{
}

- (unint64_t)albumIndex
{
  return self->_albumIndex;
}

- (void)setAlbumIndex:(unint64_t)a3
{
  self->_albumIndex = a3;
}

- (unint64_t)selectedPhotoIndex
{
  return self->_selectedPhotoIndex;
}

- (void)setSelectedPhotoIndex:(unint64_t)a3
{
  self->_selectedPhotoIndex = a3;
}

- (MUPlacePhotoGalleryViewController)photoGalleryViewController
{
  return self->_photoGalleryViewController;
}

- (void)setPhotoGalleryViewController:(id)a3
{
}

- (UGCSubmissionLookupResult)userSubmissionLookupResult
{
  return self->_userSubmissionLookupResult;
}

- (void)setUserSubmissionLookupResult:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userSubmissionLookupResult, 0);
  objc_storeStrong((id *)&self->_photoGalleryViewController, 0);

  objc_storeStrong((id *)&self->_mapItem, 0);
}

@end