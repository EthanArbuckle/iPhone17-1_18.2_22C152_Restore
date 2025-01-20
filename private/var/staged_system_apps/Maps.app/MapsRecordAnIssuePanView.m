@interface MapsRecordAnIssuePanView
- (BOOL)red;
- (MapsRecordAnIssueDebugController)parentController;
- (MapsRecordAnIssuePanView)initWithParent:(id)a3;
- (NSTimer)recordTimer;
- (UIImageView)mapIcon;
- (UILabel)endLabel;
- (UIView)redView;
- (id)convertImageToGrayScale:(id)a3;
- (void)changeColor;
- (void)endRecording;
- (void)mapsRecordAnIssueEndViewPan:(id)a3;
- (void)setEndLabel:(id)a3;
- (void)setMapIcon:(id)a3;
- (void)setParentController:(id)a3;
- (void)setRecordTimer:(id)a3;
- (void)setRed:(BOOL)a3;
- (void)setRedView:(id)a3;
@end

@implementation MapsRecordAnIssuePanView

- (MapsRecordAnIssuePanView)initWithParent:(id)a3
{
  id v4 = a3;
  v58.receiver = self;
  v58.super_class = (Class)MapsRecordAnIssuePanView;
  v5 = -[MapsRecordAnIssuePanView initWithFrame:](&v58, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v6 = v5;
  if (v5)
  {
    [(MapsRecordAnIssuePanView *)v5 setParentController:v4];
    v7 = [v4 view];
    v8 = [v7 window];

    [v8 frame];
    double v10 = v9 * 0.5;
    [v8 frame];
    double v12 = v11 + -100.0;
    -[MapsRecordAnIssuePanView setFrame:](v6, "setFrame:", v10, v11 + -100.0, 40.0, 40.0);
    -[MapsRecordAnIssuePanView setCenter:](v6, "setCenter:", v10, v12);
    v13 = +[UIBlurEffect effectWithStyle:2];
    [(MapsRecordAnIssuePanView *)v6 setEffect:v13];

    [(MapsRecordAnIssuePanView *)v6 setAlpha:0.5];
    v14 = [(MapsRecordAnIssuePanView *)v6 layer];
    [v14 setCornerRadius:20.0];

    v15 = [(MapsRecordAnIssuePanView *)v6 layer];
    [v15 setMasksToBounds:1];

    v53 = +[UIImage imageNamed:@"RAPMapIcon"];
    id v16 = objc_alloc((Class)UIImageView);
    v17 = [(MapsRecordAnIssuePanView *)v6 convertImageToGrayScale:v53];
    id v18 = [v16 initWithImage:v17];

    [v18 setContentMode:1];
    [v18 setFrame:CGRectMake(20.0, 0.0, 25.0, 25.0)];
    [v18 center];
    [v18 setCenter:];
    v19 = [v18 layer];
    [v19 setCornerRadius:8.0];

    v20 = [v18 layer];
    [v20 setMasksToBounds:1];

    [v18 setAlpha:0.5];
    [(MapsRecordAnIssuePanView *)v6 setMapIcon:v18];
    [(MapsRecordAnIssuePanView *)v6 addSubview:v18];
    v21 = +[UIFont systemFontOfSize:11.5];
    id v22 = [objc_alloc((Class)UILabel) initWithFrame:60.0, 0.0, 125.0, 40.0];
    [(MapsRecordAnIssuePanView *)v6 setEndLabel:v22];

    v23 = [(MapsRecordAnIssuePanView *)v6 endLabel];
    [v23 setText:@"End Recording"];

    v24 = +[UIColor whiteColor];
    v25 = [(MapsRecordAnIssuePanView *)v6 endLabel];
    [v25 setTextColor:v24];

    v26 = [(MapsRecordAnIssuePanView *)v6 endLabel];
    [v26 setFont:v21];

    v27 = [(MapsRecordAnIssuePanView *)v6 endLabel];
    [v27 sizeToFit];

    v28 = [(MapsRecordAnIssuePanView *)v6 endLabel];
    [v28 center];
    double v30 = v29;
    v31 = [(MapsRecordAnIssuePanView *)v6 endLabel];
    [v31 setCenter:v30, 20.0];

    v32 = [(MapsRecordAnIssuePanView *)v6 endLabel];
    [(MapsRecordAnIssuePanView *)v6 addSubview:v32];

    id v33 = [objc_alloc((Class)UIView) initWithFrame:0.0, 0.0, 12.0, 12.0];
    [(MapsRecordAnIssuePanView *)v6 setRedView:v33];

    [v18 center];
    double v35 = v34;
    [v18 center];
    double v37 = v36;
    v38 = [(MapsRecordAnIssuePanView *)v6 redView];
    [v38 setCenter:v35, v37];

    v39 = [(MapsRecordAnIssuePanView *)v6 redView];
    [v39 frame];
    double v41 = v40 * 0.5;
    v42 = [(MapsRecordAnIssuePanView *)v6 redView];
    v43 = [v42 layer];
    [v43 setCornerRadius:v41];

    v44 = [(MapsRecordAnIssuePanView *)v6 redView];
    v45 = [v44 layer];
    [v45 setMasksToBounds:1];

    v46 = +[UIColor redColor];
    v47 = [(MapsRecordAnIssuePanView *)v6 redView];
    [v47 setBackgroundColor:v46];

    v48 = [(MapsRecordAnIssuePanView *)v6 redView];
    [(MapsRecordAnIssuePanView *)v6 addSubview:v48];

    v49 = [(MapsRecordAnIssuePanView *)v6 redView];
    [(MapsRecordAnIssuePanView *)v6 bringSubviewToFront:v49];

    v50 = +[NSTimer scheduledTimerWithTimeInterval:v6 target:"changeColor" selector:0 userInfo:1 repeats:0.5];
    [(MapsRecordAnIssuePanView *)v6 setRecordTimer:v50];

    [(MapsRecordAnIssuePanView *)v6 setRed:1];
    id v51 = [objc_alloc((Class)UITapGestureRecognizer) initWithTarget:v6 action:"endRecording"];
    [(MapsRecordAnIssuePanView *)v6 addGestureRecognizer:v51];
    v54[0] = _NSConcreteStackBlock;
    v54[1] = 3221225472;
    v54[2] = sub_100AAD70C;
    v54[3] = &unk_1012E8160;
    v55 = v6;
    double v56 = v10;
    double v57 = v12;
    +[UIView animateWithDuration:v54 animations:0.3];
  }
  return v6;
}

- (id)convertImageToGrayScale:(id)a3
{
  id v3 = a3;
  [v3 size];
  CGFloat v5 = v4;
  [v3 size];
  CGFloat v7 = v6;
  DeviceGray = CGColorSpaceCreateDeviceGray();
  [v3 size];
  size_t v10 = (unint64_t)v9;
  [v3 size];
  double v12 = CGBitmapContextCreate(0, v10, (unint64_t)v11, 8uLL, 0, DeviceGray, 0);
  id v13 = v3;
  v14 = (CGImage *)[v13 CGImage];

  v19.origin.x = 0.0;
  v19.origin.y = 0.0;
  v19.size.width = v5;
  v19.size.height = v7;
  CGContextDrawImage(v12, v19, v14);
  CGImageRef Image = CGBitmapContextCreateImage(v12);
  id v16 = +[UIImage imageWithCGImage:Image];
  CGColorSpaceRelease(DeviceGray);
  CGContextRelease(v12);
  CFRelease(Image);

  return v16;
}

- (void)changeColor
{
  if ([(MapsRecordAnIssuePanView *)self red]) {
    +[UIColor blackColor];
  }
  else {
  id v3 = +[UIColor redColor];
  }
  double v4 = [(MapsRecordAnIssuePanView *)self redView];
  [v4 setBackgroundColor:v3];

  uint64_t v5 = [(MapsRecordAnIssuePanView *)self red] ^ 1;

  [(MapsRecordAnIssuePanView *)self setRed:v5];
}

- (void)mapsRecordAnIssueEndViewPan:(id)a3
{
  id v30 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentController);
  uint64_t v5 = [WeakRetained view];
  double v6 = [v5 window];

  [v6 frame];
  double v8 = v7;
  [v6 frame];
  double v10 = v9;
  double v11 = [v30 view];
  [v11 frame];
  double v13 = v12;
  [v11 frame];
  double v15 = v14;
  [v30 translationInView:v6];
  double v17 = v16;
  double v19 = v18;
  [v11 center];
  double v21 = v17 + v20;
  [v11 center];
  double v23 = v19 + v22;
  double v24 = v13 * 0.5 + v21;
  if (v21 - v13 * 0.5 < 0.0 || v24 > v8)
  {
    [v11 center:v24];
    double v21 = v26;
  }
  double v27 = v15 * 0.5 + v23;
  if (v23 - v15 * 0.5 < 0.0 || v27 > v10)
  {
    [v11 center:v27];
    double v23 = v29;
  }
  [v11 setCenter:v21, v23];
  [v30 setTranslation:v11 inView:CGPointZero.x, CGPointZero.y];
  [v6 bringSubviewToFront:v11];
}

- (void)endRecording
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentController);
  double v4 = [WeakRetained view];
  uint64_t v5 = [v4 window];

  id v6 = [objc_alloc((Class)UIActivityIndicatorView) initWithActivityIndicatorStyle:101];
  double v7 = +[UIColor grayColor];
  [v6 setColor:v7];

  [v5 frame];
  double v9 = v8 * 0.5;
  [v5 frame];
  [v6 setCenter:v9, v10 * 0.5];
  [v5 addSubview:v6];
  [v6 startAnimating];
  +[MapsEventRecorder defaultRecorder];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100AADC0C;
  v13[3] = &unk_1012E66E0;
  v13[4] = self;
  id v14 = v6;
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  id v11 = v15;
  id v12 = v6;
  [v11 endRecordingWithCompletion:v13];
}

- (MapsRecordAnIssueDebugController)parentController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentController);

  return (MapsRecordAnIssueDebugController *)WeakRetained;
}

- (void)setParentController:(id)a3
{
}

- (UILabel)endLabel
{
  return self->_endLabel;
}

- (void)setEndLabel:(id)a3
{
}

- (NSTimer)recordTimer
{
  return self->_recordTimer;
}

- (void)setRecordTimer:(id)a3
{
}

- (UIView)redView
{
  return self->_redView;
}

- (void)setRedView:(id)a3
{
}

- (UIImageView)mapIcon
{
  return self->_mapIcon;
}

- (void)setMapIcon:(id)a3
{
}

- (BOOL)red
{
  return self->_red;
}

- (void)setRed:(BOOL)a3
{
  self->_red = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapIcon, 0);
  objc_storeStrong((id *)&self->_redView, 0);
  objc_storeStrong((id *)&self->_recordTimer, 0);
  objc_storeStrong((id *)&self->_endLabel, 0);

  objc_destroyWeak((id *)&self->_parentController);
}

@end