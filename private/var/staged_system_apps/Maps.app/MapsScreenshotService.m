@interface MapsScreenshotService
- (MapsScreenshotService)initWithDelegate:(id)a3 windowScene:(id)a4;
- (MapsScreenshotServiceDelegate)delegate;
- (id)_generateUIImageFromView:(id)a3 withWatermark:(id)a4 size:(CGSize)a5;
- (void)screenshotService:(id)a3 generatePDFRepresentationWithCompletion:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation MapsScreenshotService

- (MapsScreenshotService)initWithDelegate:(id)a3 windowScene:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MapsScreenshotService;
  v8 = [(MapsScreenshotService *)&v12 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v6);
    v10 = [v7 screenshotService];
    [v10 setDelegate:v9];
  }
  return v9;
}

- (void)screenshotService:(id)a3 generatePDFRepresentationWithCompletion:(id)a4
{
  v5 = (void (**)(id, id, id, double, double, double, double))a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v7 = [WeakRetained viewsToRenderMapsScreenshotService:self];

  if ([v7 count])
  {
    id v8 = [v7 count];
    v9 = [v7 firstObject];
    [v9 bounds];
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;

    v18 = +[GEOPlatform sharedPlatform];
    unsigned __int8 v19 = [v18 isInternalInstall];

    if (v19) {
      v20 = -[WatermarkView initWithFrame:]([WatermarkView alloc], "initWithFrame:", v11, v13, v15, v17);
    }
    else {
      v20 = 0;
    }
    id v21 = [objc_alloc((Class)UIGraphicsPDFRenderer) initWithBounds:v11, v13, v15, v17];
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_10066FDBC;
    v25[3] = &unk_1012F3A30;
    id v26 = v7;
    v27 = self;
    v28 = v20;
    double v29 = v11;
    double v30 = v13;
    double v31 = v15;
    double v32 = v17;
    v22 = v20;
    v23 = [v21 PDFDataWithActions:v25];
    id v24 = [v23 copy];
    v5[2](v5, v24, v8, v11, v13, v15, v17);
  }
  else
  {
    v5[2](v5, 0, 0, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  }
}

- (id)_generateUIImageFromView:(id)a3 withWatermark:(id)a4 size:(CGSize)a5
{
  double height = a5.height;
  double width = a5.width;
  id v8 = a3;
  id v9 = a4;
  double v10 = [v8 viewWithTag:MKLookAroundTTRButtonTag];
  id v11 = [v10 isHidden];
  [v10 setHidden:1];
  double v12 = [v8 viewWithTag:MKLookAroundCompassTag];
  id v13 = [v12 isHidden];
  [v12 setHidden:1];
  id v14 = [objc_alloc((Class)UIGraphicsImageRenderer) initWithSize:width, height];
  unsigned __int8 v19 = _NSConcreteStackBlock;
  uint64_t v20 = 3221225472;
  id v21 = sub_10067009C;
  v22 = &unk_1012F3A58;
  double v25 = width;
  double v26 = height;
  id v23 = v8;
  id v24 = v9;
  id v15 = v9;
  id v16 = v8;
  double v17 = [v14 imageWithActions:&v19];
  [v10 setHidden:v11, v19, v20, v21, v22];
  [v12 setHidden:v13];

  return v17;
}

- (MapsScreenshotServiceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MapsScreenshotServiceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end