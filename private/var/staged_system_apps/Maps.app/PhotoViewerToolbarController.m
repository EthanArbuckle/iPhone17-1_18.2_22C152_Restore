@interface PhotoViewerToolbarController
- (BOOL)shouldEnableReportAnIssue;
- (BOOL)shouldShowAddPhotoButton;
- (BOOL)shouldShowPhotoThumbnailFeed;
- (BOOL)shouldSuppressPhotoGrid;
- (PhotoViewerToolbarController)initWithMapItem:(id)a3;
- (PhotoViewerToolbarControllerActionHandling)delegate;
- (int64_t)context;
- (void)_addPhotoTapped;
- (void)_leftButtonTapped;
- (void)_morePhotosButtonTapped;
- (void)_rightButtonTapped;
- (void)setContext:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setSuppressPhotoGrid:(BOOL)a3;
@end

@implementation PhotoViewerToolbarController

- (PhotoViewerToolbarController)initWithMapItem:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PhotoViewerToolbarController;
  v6 = [(PhotoViewerToolbarController *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_mapItem, a3);
  }

  return v7;
}

- (void)_addPhotoTapped
{
  id v3 = [(PhotoViewerToolbarController *)self delegate];
  [v3 photoViewerToolbarControllerTappedAddPhoto:self];
}

- (void)_leftButtonTapped
{
  id v3 = [(PhotoViewerToolbarController *)self delegate];
  [v3 photoViewerToolbarControllerTappedLeft:self];
}

- (void)_rightButtonTapped
{
  id v3 = [(PhotoViewerToolbarController *)self delegate];
  [v3 photoViewerToolbarControllerTappedRight:self];
}

- (void)_morePhotosButtonTapped
{
  id v3 = [(PhotoViewerToolbarController *)self delegate];
  [v3 photoViewerToolbarControllerTappedMorePhotos:self];
}

- (BOOL)shouldEnableReportAnIssue
{
  id v3 = [(PhotoViewerToolbarController *)self delegate];
  v4 = [v3 photoViewerToolbarControllerGetCurrentPhoto:self];
  id v5 = [v4 attribution];

  if (!v5)
  {
    id v5 = [(MKMapItem *)self->_mapItem _mapkit_preferredFirstPhotoVendor];
  }
  unsigned __int8 v6 = +[MKPOIEnrichmentAvailibility shouldShowReportAnIssueOnPhotoGalleryForMapItem:self->_mapItem photoAttribution:v5];

  return v6;
}

- (BOOL)shouldShowAddPhotoButton
{
  mapItem = self->_mapItem;
  id v3 = [(MKMapItem *)mapItem _mapkit_preferredFirstPhotoVendor];
  unsigned __int8 v4 = +[MKPOIEnrichmentAvailibility shouldShowAddPhotoButtonsOnSingleFullScreenPhotoViewerForMapItem:mapItem photoAttribution:v3];

  return v4;
}

- (BOOL)shouldShowPhotoThumbnailFeed
{
  unsigned int v3 = +[MKPOIEnrichmentAvailibility shouldShowMorePhotosGalleryForMapItem:self->_mapItem];
  if (v3) {
    LOBYTE(v3) = ![(PhotoViewerToolbarController *)self shouldSuppressPhotoGrid];
  }
  return v3;
}

- (int64_t)context
{
  return self->_context;
}

- (void)setContext:(int64_t)a3
{
  self->_context = a3;
}

- (PhotoViewerToolbarControllerActionHandling)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PhotoViewerToolbarControllerActionHandling *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)shouldSuppressPhotoGrid
{
  return self->_suppressPhotoGrid;
}

- (void)setSuppressPhotoGrid:(BOOL)a3
{
  self->_suppressPhotoGrid = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_rapLayoutManger, 0);

  objc_storeStrong((id *)&self->_mapItem, 0);
}

@end