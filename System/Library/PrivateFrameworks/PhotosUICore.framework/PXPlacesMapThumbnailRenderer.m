@interface PXPlacesMapThumbnailRenderer
- (BOOL)supportsMoveAnimations;
- (PKExtendedTraitCollection)extendedTraitCollection;
- (PXPlacesMapGeotaggableInfoDelegate)informationDelegate;
- (PXPlacesMapPipelineComponentProvider)pipelineComponentProvider;
- (PXPlacesMapThumbnailCurationDelegate)thumbnailCurationDelegate;
- (PXPlacesMapThumbnailRenderer)init;
- (PXPlacesMapThumbnailRenderer)initWithTraitCollection:(id)a3 informationDelegate:(id)a4 popoverImageType:(int64_t)a5 popoverImageOptions:(unint64_t)a6 countLabelStyle:(int64_t)a7 thumbnailCurationDelegate:(id)a8;
- (UIEdgeInsets)minimumEdgeInsets;
- (id)annotationForGeotaggables:(id)a3 initialCoordinate:(CLLocationCoordinate2D)a4;
- (id)extendedTraitObserver;
- (id)viewForAnnotation:(id)a3 andMapView:(id)a4;
- (int64_t)annotationType;
- (int64_t)countLabelStyle;
- (int64_t)popoverImageType;
- (unint64_t)imageOptions;
- (void)dealloc;
- (void)imageForGeotaggable:(id)a3 ofSize:(CGSize)a4 networkAccessAllowed:(BOOL)a5 andCompletion:(id)a6;
- (void)setExtendedTraitCollection:(id)a3;
- (void)setExtendedTraitObserver:(id)a3;
- (void)setInformationDelegate:(id)a3;
- (void)setPipelineComponentProvider:(id)a3;
- (void)setThumbnailCurationDelegate:(id)a3;
@end

@implementation PXPlacesMapThumbnailRenderer

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_thumbnailCurationDelegate);
  objc_storeStrong(&self->_extendedTraitObserver, 0);
  objc_storeStrong((id *)&self->_extendedTraitCollection, 0);
  objc_storeStrong((id *)&self->_informationDelegate, 0);
  objc_destroyWeak((id *)&self->pipelineComponentProvider);
}

- (int64_t)countLabelStyle
{
  return self->_countLabelStyle;
}

- (void)setThumbnailCurationDelegate:(id)a3
{
}

- (PXPlacesMapThumbnailCurationDelegate)thumbnailCurationDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_thumbnailCurationDelegate);
  return (PXPlacesMapThumbnailCurationDelegate *)WeakRetained;
}

- (void)setExtendedTraitObserver:(id)a3
{
}

- (id)extendedTraitObserver
{
  return objc_getProperty(self, a2, 48, 1);
}

- (void)setExtendedTraitCollection:(id)a3
{
}

- (PKExtendedTraitCollection)extendedTraitCollection
{
  return (PKExtendedTraitCollection *)objc_getProperty(self, a2, 40, 1);
}

- (void)setInformationDelegate:(id)a3
{
}

- (PXPlacesMapGeotaggableInfoDelegate)informationDelegate
{
  return (PXPlacesMapGeotaggableInfoDelegate *)objc_getProperty(self, a2, 32, 1);
}

- (unint64_t)imageOptions
{
  return self->_imageOptions;
}

- (void)setPipelineComponentProvider:(id)a3
{
}

- (PXPlacesMapPipelineComponentProvider)pipelineComponentProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->pipelineComponentProvider);
  return (PXPlacesMapPipelineComponentProvider *)WeakRetained;
}

- (int64_t)popoverImageType
{
  return self->_popoverImageType;
}

- (void)imageForGeotaggable:(id)a3 ofSize:(CGSize)a4 networkAccessAllowed:(BOOL)a5 andCompletion:(id)a6
{
  BOOL v7 = a5;
  double height = a4.height;
  double width = a4.width;
  id v15 = a3;
  id v11 = a6;
  v12 = [(PXPlacesMapThumbnailRenderer *)self informationDelegate];
  char v13 = objc_opt_respondsToSelector();

  if (v13)
  {
    v14 = [(PXPlacesMapThumbnailRenderer *)self informationDelegate];
    objc_msgSend(v14, "imageForGeotaggable:ofSize:networkAccessAllowed:andCompletion:", v15, v7, v11, width, height);
  }
}

- (id)viewForAnnotation:(id)a3 andMapView:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (objc_class *)objc_opt_class();
  v9 = NSStringFromClass(v8);
  v10 = [v7 dequeueReusableAnnotationViewWithIdentifier:v9];

  if (v10)
  {
    [(PXPlacesMapThumbnailAnnotationView *)v10 setAnnotation:v6];
  }
  else
  {
    id v11 = [(PXPlacesMapThumbnailRenderer *)self pipelineComponentProvider];
    v12 = [v11 imageCache];

    char v13 = [PXPlacesMapThumbnailAnnotationView alloc];
    v14 = [(PXPlacesMapThumbnailRenderer *)self extendedTraitCollection];
    v10 = [(PXPlacesMapThumbnailAnnotationView *)v13 initWithAnnotation:v6 reuseIdentifier:v9 extendedTraitCollection:v14 imageCache:v12 countLabelStyle:[(PXPlacesMapThumbnailRenderer *)self countLabelStyle]];
  }
  id v15 = [(PXPlacesMapThumbnailRenderer *)self thumbnailCurationDelegate];
  [(PXPlacesMapThumbnailAnnotationView *)v10 setThumbnailCurationDelegate:v15];

  return v10;
}

- (id)annotationForGeotaggables:(id)a3 initialCoordinate:(CLLocationCoordinate2D)a4
{
  double longitude = a4.longitude;
  double latitude = a4.latitude;
  id v7 = a3;
  v8 = objc_alloc_init(PXPlacesMapPointAnnotation);
  -[PXPlacesMapPointAnnotation setCoordinate:](v8, "setCoordinate:", latitude, longitude);
  [(PXPlacesMapPointAnnotation *)v8 setGeotaggables:v7];

  v9 = [(PXPlacesMapThumbnailRenderer *)self pipelineComponentProvider];
  v10 = [v9 renderer];
  [(PXPlacesMapPointAnnotation *)v8 setRenderer:v10];

  id v11 = [(PXPlacesMapThumbnailRenderer *)self pipelineComponentProvider];
  v12 = [v11 selectionHandler];
  [(PXPlacesMapPointAnnotation *)v8 setSelectionHandler:v12];

  return v8;
}

- (BOOL)supportsMoveAnimations
{
  return 0;
}

- (UIEdgeInsets)minimumEdgeInsets
{
  v3 = +[PXPlacesPopoverImageFactory sharedInstance];
  [v3 backgroundImageSizeForType:2 usingTraitCollection:self->_extendedTraitCollection];
  double v5 = v4;
  double v7 = v6;

  double v8 = v7 + 20.0;
  double v9 = v5 * 0.5 + 20.0;
  double v10 = 20.0;
  double v11 = v9;
  result.right = v11;
  result.bottom = v10;
  result.left = v9;
  result.top = v8;
  return result;
}

- (int64_t)annotationType
{
  return 0;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  double v4 = [(PXPlacesMapThumbnailRenderer *)self extendedTraitObserver];
  [v3 removeObserver:v4];

  v5.receiver = self;
  v5.super_class = (Class)PXPlacesMapThumbnailRenderer;
  [(PXPlacesMapThumbnailRenderer *)&v5 dealloc];
}

- (PXPlacesMapThumbnailRenderer)init
{
  double v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXPlacesMapThumbnailRenderer.m", 72, @"%s is not available as initializer", "-[PXPlacesMapThumbnailRenderer init]");

  abort();
}

- (PXPlacesMapThumbnailRenderer)initWithTraitCollection:(id)a3 informationDelegate:(id)a4 popoverImageType:(int64_t)a5 popoverImageOptions:(unint64_t)a6 countLabelStyle:(int64_t)a7 thumbnailCurationDelegate:(id)a8
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a8;
  v31.receiver = self;
  v31.super_class = (Class)PXPlacesMapThumbnailRenderer;
  v18 = [(PXPlacesMapThumbnailRenderer *)&v31 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_extendedTraitCollection, a3);
    objc_storeStrong((id *)&v19->_informationDelegate, a4);
    v19->_popoverImageType = a5;
    v19->_imageOptions = a6;
    v19->_countLabelStyle = a7;
    objc_storeWeak((id *)&v19->_thumbnailCurationDelegate, v17);
    objc_initWeak(&location, v19);
    uint64_t v25 = MEMORY[0x1E4F143A8];
    uint64_t v26 = 3221225472;
    v27 = __155__PXPlacesMapThumbnailRenderer_initWithTraitCollection_informationDelegate_popoverImageType_popoverImageOptions_countLabelStyle_thumbnailCurationDelegate___block_invoke;
    v28 = &unk_1E5DCFD58;
    objc_copyWeak(&v29, &location);
    v20 = _Block_copy(&v25);
    v21 = objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter", v25, v26, v27, v28);
    uint64_t v22 = [v21 addObserverForName:@"kPKExtendedTraitCollectionChangedNotification" object:0 queue:0 usingBlock:v20];
    id extendedTraitObserver = v19->_extendedTraitObserver;
    v19->_id extendedTraitObserver = (id)v22;

    objc_destroyWeak(&v29);
    objc_destroyWeak(&location);
  }

  return v19;
}

void __155__PXPlacesMapThumbnailRenderer_initWithTraitCollection_informationDelegate_popoverImageType_popoverImageOptions_countLabelStyle_thumbnailCurationDelegate___block_invoke(uint64_t a1, void *a2)
{
  id v5 = [a2 userInfo];
  v3 = [v5 objectForKeyedSubscript:@"kPKExtendedTraitCollectionKey"];
  if (v3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained setExtendedTraitCollection:v3];
  }
}

@end