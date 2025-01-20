@interface PXPlacesSnapshotOptions
- ($B7681AED98C8A3AAF93603046C9C96EE)region;
- (BOOL)shouldRenderThumbnailForNoLocation;
- (BOOL)shouldSkipPlaceholder;
- (BOOL)showsPointLabels;
- (CGSize)viewSize;
- (NSString)cacheDirectoryPath;
- (OS_dispatch_queue)queue;
- (PKExtendedTraitCollection)extendedTraitCollection;
- (PXPlacesMapGeotaggableInfoDelegate)geotaggableInformationDelegate;
- (PXPlacesMapThumbnailCurationDelegate)mapThumbnailCurationDelegate;
- (PXPlacesSnapshotOptions)init;
- (UIEdgeInsets)additionalInsets;
- (double)visibleDistance;
- (id)description;
- (int64_t)popoverImageType;
- (unint64_t)snapshotMapType;
- (void)setAdditionalInsets:(UIEdgeInsets)a3;
- (void)setCacheDirectoryPath:(id)a3;
- (void)setExtendedTraitCollection:(id)a3;
- (void)setGeotaggableInformationDelegate:(id)a3;
- (void)setMapThumbnailCurationDelegate:(id)a3;
- (void)setPopoverImageType:(int64_t)a3;
- (void)setQueue:(id)a3;
- (void)setRegion:(id *)a3;
- (void)setShouldRenderThumbnailForNoLocation:(BOOL)a3;
- (void)setShouldSkipPlaceholder:(BOOL)a3;
- (void)setShowsPointLabels:(BOOL)a3;
- (void)setSnapshotMapType:(unint64_t)a3;
- (void)setViewSize:(CGSize)a3;
- (void)setVisibleDistance:(double)a3;
@end

@implementation PXPlacesSnapshotOptions

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_mapThumbnailCurationDelegate);
  objc_storeStrong((id *)&self->_cacheDirectoryPath, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_geotaggableInformationDelegate, 0);
  objc_storeStrong((id *)&self->_extendedTraitCollection, 0);
}

- (void)setMapThumbnailCurationDelegate:(id)a3
{
}

- (PXPlacesMapThumbnailCurationDelegate)mapThumbnailCurationDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mapThumbnailCurationDelegate);
  return (PXPlacesMapThumbnailCurationDelegate *)WeakRetained;
}

- (void)setRegion:(id *)a3
{
  self->_region.center.latitude = v3;
  self->_region.center.longitude = v4;
  self->_region.span.latitudeDelta = v5;
  self->_region.span.longitudeDelta = v6;
}

- ($B7681AED98C8A3AAF93603046C9C96EE)region
{
  return self;
}

- (void)setAdditionalInsets:(UIEdgeInsets)a3
{
  self->_additionalInsets = a3;
}

- (UIEdgeInsets)additionalInsets
{
  double top = self->_additionalInsets.top;
  double left = self->_additionalInsets.left;
  double bottom = self->_additionalInsets.bottom;
  double right = self->_additionalInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setShouldRenderThumbnailForNoLocation:(BOOL)a3
{
  self->_shouldRenderThumbnailForNoLocation = a3;
}

- (BOOL)shouldRenderThumbnailForNoLocation
{
  return self->_shouldRenderThumbnailForNoLocation;
}

- (void)setShowsPointLabels:(BOOL)a3
{
  self->_showsPointLabels = a3;
}

- (BOOL)showsPointLabels
{
  return self->_showsPointLabels;
}

- (void)setShouldSkipPlaceholder:(BOOL)a3
{
  self->_shouldSkipPlaceholder = a3;
}

- (BOOL)shouldSkipPlaceholder
{
  return self->_shouldSkipPlaceholder;
}

- (void)setViewSize:(CGSize)a3
{
  self->_viewSize = a3;
}

- (CGSize)viewSize
{
  double width = self->_viewSize.width;
  double height = self->_viewSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setPopoverImageType:(int64_t)a3
{
  self->_popoverImageType = a3;
}

- (int64_t)popoverImageType
{
  return self->_popoverImageType;
}

- (void)setSnapshotMapType:(unint64_t)a3
{
  self->_snapshotMapType = a3;
}

- (unint64_t)snapshotMapType
{
  return self->_snapshotMapType;
}

- (void)setVisibleDistance:(double)a3
{
  self->_visibleDistance = a3;
}

- (double)visibleDistance
{
  return self->_visibleDistance;
}

- (void)setCacheDirectoryPath:(id)a3
{
}

- (NSString)cacheDirectoryPath
{
  return self->_cacheDirectoryPath;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setGeotaggableInformationDelegate:(id)a3
{
}

- (PXPlacesMapGeotaggableInfoDelegate)geotaggableInformationDelegate
{
  return self->_geotaggableInformationDelegate;
}

- (void)setExtendedTraitCollection:(id)a3
{
}

- (PKExtendedTraitCollection)extendedTraitCollection
{
  return self->_extendedTraitCollection;
}

- (id)description
{
  v32.receiver = self;
  v32.super_class = (Class)PXPlacesSnapshotOptions;
  CLLocationDegrees v3 = [(PXPlacesSnapshotOptions *)&v32 description];
  CLLocationDegrees v4 = (void *)[v3 mutableCopy];

  double v5 = NSString;
  double v6 = [(PXPlacesSnapshotOptions *)self extendedTraitCollection];
  v7 = [v5 stringWithFormat:@"\nExtended Trait Collection: %@", v6];
  [v4 appendString:v7];

  v8 = NSString;
  v9 = [(PXPlacesSnapshotOptions *)self geotaggableInformationDelegate];
  v10 = [v8 stringWithFormat:@"\nGeotaggable Info Delegate: %@", v9];
  [v4 appendString:v10];

  v11 = NSString;
  v12 = [(PXPlacesSnapshotOptions *)self queue];
  v13 = [v11 stringWithFormat:@"\nQueue: %@", v12];
  [v4 appendString:v13];

  v14 = NSString;
  v15 = [(PXPlacesSnapshotOptions *)self cacheDirectoryPath];
  v16 = [v14 stringWithFormat:@"\nCache Directory Path: %@", v15];
  [v4 appendString:v16];

  v17 = NSString;
  [(PXPlacesSnapshotOptions *)self visibleDistance];
  v19 = objc_msgSend(v17, "stringWithFormat:", @"\nVisible Distance: %f", v18);
  [v4 appendString:v19];

  v20 = objc_msgSend(NSString, "stringWithFormat:", @"\nSnapshot Map Type: %ld", -[PXPlacesSnapshotOptions snapshotMapType](self, "snapshotMapType"));
  [v4 appendString:v20];

  v21 = objc_msgSend(NSString, "stringWithFormat:", @"\nImage Popover Type: %ld", -[PXPlacesSnapshotOptions popoverImageType](self, "popoverImageType"));
  [v4 appendString:v21];

  v22 = NSString;
  [(PXPlacesSnapshotOptions *)self viewSize];
  v23 = NSStringFromCGSize(v34);
  v24 = [v22 stringWithFormat:@"\nView Size: %@", v23];
  [v4 appendString:v24];

  v25 = objc_msgSend(NSString, "stringWithFormat:", @"\nShould Skip Placeholder: %d", -[PXPlacesSnapshotOptions shouldSkipPlaceholder](self, "shouldSkipPlaceholder"));
  [v4 appendString:v25];

  v26 = objc_msgSend(NSString, "stringWithFormat:", @"\nShows Point Labels: %d", -[PXPlacesSnapshotOptions showsPointLabels](self, "showsPointLabels"));
  [v4 appendString:v26];

  v27 = objc_msgSend(NSString, "stringWithFormat:", @"\nShould Render Thumbnail For No Location: %d", -[PXPlacesSnapshotOptions shouldRenderThumbnailForNoLocation](self, "shouldRenderThumbnailForNoLocation"));
  [v4 appendString:v27];

  v28 = NSString;
  [(PXPlacesSnapshotOptions *)self additionalInsets];
  v29 = NSStringFromUIEdgeInsets(v35);
  v30 = [v28 stringWithFormat:@"\nAdditional Insets: %@", v29];
  [v4 appendString:v30];

  return v4;
}

- (PXPlacesSnapshotOptions)init
{
  v5.receiver = self;
  v5.super_class = (Class)PXPlacesSnapshotOptions;
  CGSize result = [(PXPlacesSnapshotOptions *)&v5 init];
  if (result)
  {
    result->_visibleDistance = 10000.0;
    *(_WORD *)&result->_showsPointLabels = 1;
    long long v3 = *(_OWORD *)(MEMORY[0x1E4FB2848] + 16);
    *(_OWORD *)&result->_additionalInsets.double top = *MEMORY[0x1E4FB2848];
    *(_OWORD *)&result->_additionalInsets.double bottom = v3;
    result->_popoverImageType = 2;
    $2AEA816EAF9616B0E64737FB4BB06332 v4 = *($2AEA816EAF9616B0E64737FB4BB06332 *)(MEMORY[0x1E4F30D30] + 16);
    result->_region.center = (CLLocationCoordinate2D)*MEMORY[0x1E4F30D30];
    result->_region.span = v4;
  }
  return result;
}

@end