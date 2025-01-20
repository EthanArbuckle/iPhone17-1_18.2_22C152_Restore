@interface WatermarkView
- (FCFImageEncoder)imageEncoder;
- (UIImageView)imageView;
- (UIViewController)hostViewController;
- (WatermarkProperties)watermarkProperties;
- (WatermarkView)initWithCoder:(id)a3;
- (WatermarkView)initWithFrame:(CGRect)a3;
- (id)_clearImage;
- (void)_commonInit;
- (void)_updateWatermark;
- (void)dealloc;
- (void)flushTileCache;
- (void)layoutSubviews;
- (void)setHostViewController:(id)a3;
- (void)setImageEncoder:(id)a3;
- (void)setImageView:(id)a3;
- (void)setWatermarkProperties:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation WatermarkView

- (WatermarkView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)WatermarkView;
  v3 = -[WatermarkView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(WatermarkView *)v3 _commonInit];
  }
  return v4;
}

- (WatermarkView)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)WatermarkView;
  v3 = [(WatermarkView *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(WatermarkView *)v3 _commonInit];
  }
  return v4;
}

- (void)_commonInit
{
  v3 = +[GEOResourceManifestManager modernManager];
  [v3 addTileGroupObserver:self queue:&_dispatch_main_q];

  MapsFeature_AddDelegateListener();
  objc_initWeak(&location, self);
  objc_copyWeak(&v19, &location);
  v4 = _GEOConfigAddBlockListenerForKey();
  id configListener = self->_configListener;
  self->_id configListener = v4;

  -[WatermarkView setUserInteractionEnabled:](self, "setUserInteractionEnabled:", 0, _NSConcreteStackBlock, 3221225472, sub_100956BBC, &unk_1012F2E00);
  if (sub_100956344())
  {
    sub_10095654C();
    if (objc_opt_class())
    {
      sub_1009566A0();
      if (objc_opt_class())
      {
        objc_super v6 = (FCFImageEncoder *)objc_alloc_init((Class)sub_10095654C());
        imageEncoder = self->_imageEncoder;
        self->_imageEncoder = v6;

        id v8 = objc_alloc((Class)sub_1009566A0());
        LODWORD(v9) = 0.5;
        v10 = (WatermarkProperties *)[v8 initWatermarkPropertiesWithHeight:200.0 width:200.0 angle:45.0 transparency:v9];
        watermarkProperties = self->_watermarkProperties;
        self->_watermarkProperties = v10;

        -[WatermarkProperties setTextOrigin:](self->_watermarkProperties, "setTextOrigin:", 0.0, 100.0);
        [(WatermarkProperties *)self->_watermarkProperties setFontSize:12.0];
        [(WatermarkProperties *)self->_watermarkProperties setTextLineYIncrement:18];
        [(WatermarkProperties *)self->_watermarkProperties setXGridInterval:175];
        [(WatermarkProperties *)self->_watermarkProperties setYGridInterval:175];
        [(WatermarkProperties *)self->_watermarkProperties setColorMode:1];
        if (sub_1000BBB44(self) == 3) {
          +[UIColor systemBackgroundColor];
        }
        else {
        v12 = +[UIColor labelColor];
        }
        [(WatermarkProperties *)self->_watermarkProperties setDarkColor:v12];
      }
    }
  }
  v13 = (UIImageView *)objc_alloc_init((Class)UIImageView);
  imageView = self->_imageView;
  self->_imageView = v13;

  [(UIImageView *)self->_imageView setTranslatesAutoresizingMaskIntoConstraints:0];
  v15 = +[UIColor clearColor];
  [(UIImageView *)self->_imageView setBackgroundColor:v15];

  [(WatermarkView *)self addSubview:self->_imageView];
  LODWORD(v16) = 1148846080;
  v17 = -[UIImageView _maps_constraintsEqualToEdgesOfView:insets:priority:](self->_imageView, "_maps_constraintsEqualToEdgesOfView:insets:priority:", self, -50.0, -25.0, 0.0, 0.0, v16);
  v18 = [v17 allConstraints];
  +[NSLayoutConstraint activateConstraints:v18];

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

- (void)dealloc
{
  v3 = +[GEOResourceManifestManager modernManager];
  [v3 removeTileGroupObserver:self];

  MapsFeature_RemoveDelegateListenerForAllKeys();
  v4.receiver = self;
  v4.super_class = (Class)WatermarkView;
  [(WatermarkView *)&v4 dealloc];
}

- (void)layoutSubviews
{
  v11.receiver = self;
  v11.super_class = (Class)WatermarkView;
  [(WatermarkView *)&v11 layoutSubviews];
  [(WatermarkView *)self bounds];
  v12.origin.x = v3;
  v12.origin.y = v4;
  v12.size.width = v5;
  v12.size.height = v6;
  if (!CGRectEqualToRect(self->_savedBounds, v12))
  {
    [(WatermarkView *)self bounds];
    self->_savedBounds.origin.x = v7;
    self->_savedBounds.origin.y = v8;
    self->_savedBounds.size.width = v9;
    self->_savedBounds.size.height = v10;
    [(WatermarkView *)self _updateWatermark];
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)WatermarkView;
  id v4 = a3;
  [(WatermarkView *)&v8 traitCollectionDidChange:v4];
  id v5 = [v4 userInterfaceStyle];

  CGFloat v6 = [(WatermarkView *)self traitCollection];
  id v7 = [v6 userInterfaceStyle];

  if (v5 != v7) {
    [(WatermarkView *)self _updateWatermark];
  }
}

- (id)_clearImage
{
  [(WatermarkView *)self bounds];
  CGFloat v3 = v2;
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  v14.width = v6;
  v14.height = v8;
  UIGraphicsBeginImageContextWithOptions(v14, 0, 0.0);
  CGFloat v10 = +[UIColor clearColor];
  [v10 set];

  v15.origin.x = v3;
  v15.origin.y = v5;
  v15.size.width = v7;
  v15.size.height = v9;
  UIRectFill(v15);
  objc_super v11 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v11;
}

- (void)_updateWatermark
{
  if (GEOShouldWatermark())
  {
    CGFloat v3 = GEOConfigGetString();
    if ([v3 length])
    {
      if ((_GEOConfigHasValue() & 1) == 0)
      {
        double v4 = sub_100576EC4();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Missing a valid auth token, but we have a valid personID. Will apply watermarking in case the auth token has not been persisted yet.", buf, 2u);
        }
      }
      CGFloat v5 = sub_100576EC4();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Applying watermark", buf, 2u);
      }

      CGFloat v6 = [(WatermarkView *)self _clearImage];
      id v7 = v3;
      if (sub_100956344())
      {
        sub_10095654C();
        if (objc_opt_class())
        {
          sub_1009566A0();
          if (objc_opt_class())
          {
            CGFloat v8 = [(WatermarkView *)self imageEncoder];
            CGFloat v9 = [(WatermarkView *)self watermarkProperties];
            id v20 = 0;
            CGFloat v10 = [v8 addBinaryGridWatermarkToImage:v6 ForId:v7 withProperties:v9 error:&v20];
            id v11 = v20;

            CGRect v12 = [(WatermarkView *)self imageView];
            [v12 setImage:v10];

            if (v11)
            {
              v13 = sub_100576EC4();
              if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                v22[0] = v11;
                _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Error when applying watermark: %@", buf, 0xCu);
              }
            }
          }
        }
      }
    }
    else
    {
      CGRect v15 = sub_100576EC4();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109376;
        LODWORD(v22[0]) = [v3 length] != 0;
        WORD2(v22[0]) = 1024;
        *(_DWORD *)((char *)v22 + 6) = _GEOConfigHasValue();
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Can't apply watermark. Has personID %d, has valid token %d", buf, 0xEu);
      }

      double v16 = [(WatermarkView *)self imageView];
      [v16 setImage:0];

      v17 = +[GEOMapsAuthServiceHelper sharedAuthHelper];
      [v17 invalidateTokens];

      [(WatermarkView *)self flushTileCache];
      v18 = [(WatermarkView *)self _maps_mapsSceneDelegate];
      CGFloat v6 = v18;
      if (!v18) {
        goto LABEL_27;
      }
      id v7 = [v18 topMostPresentedViewController];
      id v19 = sub_100576EC4();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Requesting credentials from AppleConnect", buf, 2u);
      }

      +[MapsAppleConnectAuthViewController presentAppleConnectAuthControllerFrom:v7 withProxyURL:0];
    }

LABEL_27:
    goto LABEL_28;
  }
  CGSize v14 = sub_100576EC4();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "GEOShouldWatermark() returned NO, won't apply watermark", buf, 2u);
  }

  CGFloat v3 = [(WatermarkView *)self imageView];
  [v3 setImage:0];
LABEL_28:
}

- (void)flushTileCache
{
  id v2 = +[GEOTileLoader modernLoader];
  [v2 shrinkDiskCacheToSize:0 callbackQ:&_dispatch_main_q finished:&stru_101303380];
}

- (UIViewController)hostViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hostViewController);

  return (UIViewController *)WeakRetained;
}

- (void)setHostViewController:(id)a3
{
}

- (FCFImageEncoder)imageEncoder
{
  return self->_imageEncoder;
}

- (void)setImageEncoder:(id)a3
{
}

- (WatermarkProperties)watermarkProperties
{
  return self->_watermarkProperties;
}

- (void)setWatermarkProperties:(id)a3
{
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_watermarkProperties, 0);
  objc_storeStrong((id *)&self->_imageEncoder, 0);
  objc_destroyWeak((id *)&self->_hostViewController);

  objc_storeStrong(&self->_configListener, 0);
}

@end