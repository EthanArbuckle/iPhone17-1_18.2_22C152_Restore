@interface PXSurveyQuestionMapConfiguration
- (BOOL)isStale;
- (CGRect)contentRectForOneUp;
- (CLLocation)location;
- (NSString)title;
- (PXSurveyQuestionConfigurationHandlers)handlers;
- (PXSurveyQuestionMapConfiguration)init;
- (PXSurveyQuestionMapConfiguration)initWithTitle:(id)a3 location:(id)a4;
- (UIImage)contentImageForOneUp;
- (UIView)contentView;
- (void)layoutContentViewInRect:(CGRect)a3;
- (void)setHandlers:(id)a3;
- (void)setIsStale:(BOOL)a3;
@end

@implementation PXSurveyQuestionMapConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_handlers, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_mapView, 0);
}

- (CLLocation)location
{
  return self->_location;
}

- (void)setIsStale:(BOOL)a3
{
  self->_isStale = a3;
}

- (BOOL)isStale
{
  return self->_isStale;
}

- (void)setHandlers:(id)a3
{
}

- (PXSurveyQuestionConfigurationHandlers)handlers
{
  return self->_handlers;
}

- (NSString)title
{
  return self->_title;
}

- (CGRect)contentRectForOneUp
{
  double v2 = *MEMORY[0x1E4F1DB20];
  double v3 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  double v4 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  double v5 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (UIImage)contentImageForOneUp
{
  return 0;
}

- (void)layoutContentViewInRect:(CGRect)a3
{
}

- (UIView)contentView
{
  mapView = self->_mapView;
  if (!mapView)
  {
    double v4 = [(PXSurveyQuestionMapConfiguration *)self location];
    double v5 = (MKMapView *)objc_alloc_init(MEMORY[0x1E4F30F50]);
    v6 = self->_mapView;
    self->_mapView = v5;

    [(MKMapView *)self->_mapView setMapType:0];
    [(MKMapView *)self->_mapView setScrollEnabled:0];
    id v7 = objc_alloc_init(MEMORY[0x1E4F30FD8]);
    [v4 coordinate];
    objc_msgSend(v7, "setCoordinate:");
    [(MKMapView *)self->_mapView addAnnotation:v7];
    v8 = self->_mapView;
    [v4 coordinate];
    -[MKMapView setRegion:](v8, "setRegion:");

    mapView = self->_mapView;
  }
  return (UIView *)mapView;
}

- (PXSurveyQuestionMapConfiguration)init
{
  double v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXSurveyQuestionMapConfiguration.m", 34, @"%s is not available as initializer", "-[PXSurveyQuestionMapConfiguration init]");

  abort();
}

- (PXSurveyQuestionMapConfiguration)initWithTitle:(id)a3 location:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"PXSurveyQuestionMapConfiguration.m", 23, @"Invalid parameter not satisfying: %@", @"location != nil" object file lineNumber description];
  }
  v14.receiver = self;
  v14.super_class = (Class)PXSurveyQuestionMapConfiguration;
  v9 = [(PXSurveyQuestionMapConfiguration *)&v14 init];
  if (v9)
  {
    uint64_t v10 = [v7 copy];
    title = v9->_title;
    v9->_title = (NSString *)v10;

    objc_storeStrong((id *)&v9->_location, a4);
    v9->_isStale = 0;
  }

  return v9;
}

@end