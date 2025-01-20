@interface StaleMapEffectView
+ (double)_dimmingAlphaForUserInterfaceStyle:(int64_t)a3;
+ (id)dimmingOverlayForView:(id)a3;
- (StaleMapEffectView)initWithMapView:(id)a3 applyDimmingEffect:(BOOL)a4;
- (id)_mapRepresentationImage:(id)a3;
- (id)_mapSnapshotImage;
- (void)_addDimmingEffect;
- (void)_updateImage;
- (void)setAlpha:(double)a3;
@end

@implementation StaleMapEffectView

- (StaleMapEffectView)initWithMapView:(id)a3 applyDimmingEffect:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  [v7 bounds];
  v11.receiver = self;
  v11.super_class = (Class)StaleMapEffectView;
  v8 = -[StaleMapEffectView initWithFrame:](&v11, "initWithFrame:");
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_mapView, a3);
    [(StaleMapEffectView *)v9 setAutoresizingMask:18];
    [(StaleMapEffectView *)v9 _updateImage];
    if (v4) {
      [(StaleMapEffectView *)v9 _addDimmingEffect];
    }
  }

  return v9;
}

- (void)setAlpha:(double)a3
{
  if (a3 > 0.0)
  {
    [(StaleMapEffectView *)self alpha];
    if (fabs(v5) <= 2.22044605e-16)
    {
      [(MKMapView *)self->_mapView _forceFrame];
      [(StaleMapEffectView *)self _updateImage];
    }
  }
  v6.receiver = self;
  v6.super_class = (Class)StaleMapEffectView;
  [(StaleMapEffectView *)&v6 setAlpha:a3];
}

- (void)_updateImage
{
  id v3 = [(StaleMapEffectView *)self _mapSnapshotImage];
  [(StaleMapEffectView *)self setImage:v3];
}

- (id)_mapRepresentationImage:(id)a3
{
  id v4 = a3;
  double v5 = self->_mapView;
  id v6 = objc_alloc_init((Class)UIGraphicsImageRendererFormat);
  id v7 = +[UIScreen mainScreen];
  [v7 scale];
  [v6 setScale:];

  [v6 setOpaque:1];
  [v6 setPreferredRange:2];
  id v8 = objc_alloc((Class)UIGraphicsImageRenderer);
  [(MKMapView *)v5 bounds];
  id v9 = [v8 initWithBounds:v6];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100B582F0;
  v14[3] = &unk_1013191A0;
  v15 = v5;
  id v16 = v4;
  v10 = v5;
  id v11 = v4;
  v12 = [v9 imageWithActions:v14];

  return v12;
}

- (id)_mapSnapshotImage
{
  return [(StaleMapEffectView *)self _mapRepresentationImage:&stru_1013191E0];
}

- (void)_addDimmingEffect
{
  id v3 = +[StaleMapEffectView dimmingOverlayForView:self];
  [(StaleMapEffectView *)self addSubview:v3];
}

+ (double)_dimmingAlphaForUserInterfaceStyle:(int64_t)a3
{
  GEOConfigGetDouble();
  return result;
}

+ (id)dimmingOverlayForView:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc((Class)UIView);
  [v3 bounds];
  id v5 = [v4 initWithFrame:];
  id v6 = +[UIColor blackColor];
  [v5 setBackgroundColor:v6];

  [v5 setAutoresizingMask:18];
  id v7 = [v3 traitCollection];
  +[StaleMapEffectView _dimmingAlphaForUserInterfaceStyle:](StaleMapEffectView, "_dimmingAlphaForUserInterfaceStyle:", [v7 userInterfaceStyle]);
  [v5 setAlpha:];

  uint64_t Integer = GEOConfigGetInteger();
  id v9 = objc_alloc((Class)UIVisualEffectView);
  v10 = +[UIBlurEffect effectWithStyle:Integer];
  id v11 = [v9 initWithEffect:v10];

  [v11 setAutoresizingMask:18];
  [v3 bounds];
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;

  [v11 setFrame:v13, v15, v17, v19];
  v20 = [v11 contentView];
  [v20 addSubview:v5];

  return v11;
}

- (void).cxx_destruct
{
}

@end