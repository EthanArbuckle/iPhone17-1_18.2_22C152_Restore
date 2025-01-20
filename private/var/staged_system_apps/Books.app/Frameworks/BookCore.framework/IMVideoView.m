@interface IMVideoView
- (AVPlayerLayer)videoLayer;
- (BOOL)airplayActive;
- (BOOL)externalDisplay;
- (BOOL)smallAirplayBackground;
- (IMAVPlayer)player;
- (NSString)airplayRouteName;
- (void)dealloc;
- (void)layout:(BOOL)a3;
- (void)layoutSublayersOfLayer:(id)a3;
- (void)layoutSubviews;
- (void)setAirplayActive:(BOOL)a3;
- (void)setAirplayRouteName:(id)a3;
- (void)setExternalDisplay:(BOOL)a3;
- (void)setPlayer:(id)a3;
- (void)setVideoLayer:(id)a3;
- (void)updateAirplayNoContentView;
- (void)willMoveToWindow:(id)a3;
@end

@implementation IMVideoView

- (void)dealloc
{
  [(IMVideoView *)self setVideoLayer:0];
  [(IMVideoView *)self setAirplayActive:0];
  [(IMVideoView *)self setAirplayRouteName:0];
  v3.receiver = self;
  v3.super_class = (Class)IMVideoView;
  [(IMVideoView *)&v3 dealloc];
}

- (void)setAirplayActive:(BOOL)a3
{
  if (self->_airplayActive != a3)
  {
    self->_airplayActive = a3;
    [(IMVideoView *)self updateAirplayNoContentView];
  }
}

- (void)setVideoLayer:(id)a3
{
  v5 = (AVPlayerLayer *)a3;
  p_videoLayer = &self->_videoLayer;
  videoLayer = self->_videoLayer;
  if (videoLayer != v5)
  {
    [(AVPlayerLayer *)videoLayer removeFromSuperlayer];
    objc_storeStrong((id *)&self->_videoLayer, a3);
    v8 = [(IMVideoView *)self layer];
    [v8 addSublayer:*p_videoLayer];
  }

  _objc_release_x1();
}

- (void)setAirplayRouteName:(id)a3
{
  obj = (NSString *)a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_player);
  unsigned int v5 = [WeakRetained airplayVideoActive];

  if (v5)
  {
    v6 = IMCommonCoreBundle();
    v7 = [v6 localizedStringForKey:@"AirPlay" value:&stru_2CE418 table:@"BCCommonCoreLocalizable"];
  }
  else
  {
    if (![(IMVideoView *)self externalDisplay]) {
      goto LABEL_6;
    }
    v8 = IMCommonCoreBundle();
    uint64_t v9 = [v8 localizedStringForKey:@"TV" value:&stru_2CE418 table:@"BCCommonCoreLocalizable"];

    v6 = IMCommonCoreBundle();
    v7 = [v6 localizedStringForKey:@"TV Connected" value:&stru_2CE418 table:@"BCCommonCoreLocalizable"];
    obj = (NSString *)v9;
  }
  [(UILabel *)self->_airplayLabel setText:v7];

LABEL_6:
  if (self->_airplayRouteName != obj)
  {
    objc_storeStrong((id *)&self->_airplayRouteName, obj);
    v10 = IMCommonCoreBundle();
    v11 = [v10 localizedStringForKey:@"The video is playing on \\U201C%@\\U201D." value:&stru_2CE418 table:@"BCCommonCoreLocalizable"];

    v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v11, obj);
    [(UILabel *)self->_airplayRouteLabel setText:v12];
  }

  _objc_release_x1();
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)IMVideoView;
  [(IMVideoView *)&v3 layoutSubviews];
  [(IMVideoView *)self layout:isPortrait()];
}

- (BOOL)smallAirplayBackground
{
  BOOL v3 = isPhone();
  [(IMVideoView *)self frame];
  return v4 < 768.0 || v3;
}

- (void)layout:(BOOL)a3
{
  if (self->_airplayBackground)
  {
    [(IMVideoView *)self bounds];
    -[UIView setFrame:](self->_airplayBackground, "setFrame:");
    airplayLabel = self->_airplayLabel;
    unsigned int v6 = [(IMVideoView *)self smallAirplayBackground];
    double v7 = 24.0;
    if (v6) {
      double v7 = 17.0;
    }
    v8 = +[UIFont systemFontOfSize:v7];
    [(UILabel *)airplayLabel setFont:v8];

    airplayRouteLabel = self->_airplayRouteLabel;
    unsigned int v10 = [(IMVideoView *)self smallAirplayBackground];
    double v11 = 12.0;
    if (!v10) {
      double v11 = 17.0;
    }
    v12 = +[UIFont systemFontOfSize:v11];
    [(UILabel *)airplayRouteLabel setFont:v12];

    [(UIView *)self->_airplayBackground frame];
    double v14 = v13;
    if (a3)
    {
      double v15 = 0.8;
    }
    else if ([(IMVideoView *)self smallAirplayBackground])
    {
      double v15 = 0.5;
    }
    else
    {
      double v15 = 0.8;
    }
    [(UIView *)self->_airplayBackground frame];
    double v17 = v15 * (v16 + -44.0) * 0.5;
    if ([(IMVideoView *)self smallAirplayBackground]) {
      double v18 = 0.5;
    }
    else {
      double v18 = 1.0;
    }
    v19 = [(UIImageView *)self->_airplayTVImage image];
    [v19 size];
    double v21 = v18 * v20;

    double v22 = 0.0;
    -[UIImageView setFrame:](self->_airplayTVImage, "setFrame:", 0.0, v17 + 44.0 - v21 * 0.5, v14, v21);
    LODWORD(v19) = [(IMVideoView *)self smallAirplayBackground];
    [(UIImageView *)self->_airplayTVImage frame];
    double MaxY = CGRectGetMaxY(v31);
    if (!v19) {
      double v22 = 15.0;
    }
    double v24 = v22 + MaxY;
    v25 = [(UILabel *)self->_airplayLabel font];
    [v25 lineHeight];
    -[UILabel setFrame:](self->_airplayLabel, "setFrame:", 0.0, v24, v14, v26);

    [(UILabel *)self->_airplayLabel frame];
    double v27 = v22 + CGRectGetMaxY(v32);
    id v29 = [(UILabel *)self->_airplayRouteLabel font];
    [v29 lineHeight];
    -[UILabel setFrame:](self->_airplayRouteLabel, "setFrame:", 0.0, v27, v14, v28);
  }
}

- (void)layoutSublayersOfLayer:(id)a3
{
  v17.receiver = self;
  v17.super_class = (Class)IMVideoView;
  id v4 = a3;
  [(IMVideoView *)&v17 layoutSublayersOfLayer:v4];
  id v5 = [(IMVideoView *)self layer];

  if (v5 == v4)
  {
    unsigned int v6 = [(IMVideoView *)self videoLayer];
    [v6 bounds];
    BOOL IsEmpty = CGRectIsEmpty(v18);

    if (IsEmpty)
    {
      +[CATransaction begin];
      +[CATransaction setDisableActions:1];
    }
    [(IMVideoView *)self bounds];
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    double v16 = [(IMVideoView *)self videoLayer];
    [v16 setFrame:v9, v11, v13, v15];

    if (IsEmpty) {
      +[CATransaction commit];
    }
  }
}

- (void)willMoveToWindow:(id)a3
{
  if (a3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_player);
    [WeakRetained updateVideoLayer];
  }
}

- (void)updateAirplayNoContentView
{
  if ([(IMVideoView *)self airplayActive] || [(IMVideoView *)self externalDisplay])
  {
    airplayBackground = self->_airplayBackground;
    if (!airplayBackground)
    {
      id v4 = objc_alloc((Class)UIView);
      double y = CGRectZero.origin.y;
      double width = CGRectZero.size.width;
      double height = CGRectZero.size.height;
      double v8 = [v4 initWithFrame:CGRectZero.origin.x, y, width, height];
      double v9 = self->_airplayBackground;
      self->_airplayBackground = v8;

      double v10 = +[UIImage imageNamed:@"UIStockImageNoContentDarkGradientBackgroundColor.jpg"];
      double v11 = +[UIColor colorWithPatternImage:v10];
      [(UIView *)self->_airplayBackground setBackgroundColor:v11];

      id v12 = objc_alloc((Class)UIImageView);
      double v13 = +[UIImage imageNamed:@"NoContentVideosOverlay"];
      double v14 = (UIImageView *)[v12 initWithImage:v13];
      airplayTVImage = self->_airplayTVImage;
      self->_airplayTVImage = v14;

      -[UIImageView setFrame:](self->_airplayTVImage, "setFrame:", CGRectZero.origin.x, y, width, height);
      [(UIImageView *)self->_airplayTVImage setContentMode:1];
      [(UIView *)self->_airplayBackground addSubview:self->_airplayTVImage];
      double v16 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];
      airplayLabel = self->_airplayLabel;
      self->_airplayLabel = v16;

      [(UILabel *)self->_airplayLabel setBackgroundColor:0];
      [(UILabel *)self->_airplayLabel setContentMode:4];
      [(UILabel *)self->_airplayLabel setOpaque:0];
      CGRect v18 = self->_airplayLabel;
      v19 = +[UIColor colorWithWhite:1.0 alpha:0.25];
      [(UILabel *)v18 setTextColor:v19];

      [(UILabel *)self->_airplayLabel setTextAlignment:1];
      [(UIView *)self->_airplayBackground addSubview:self->_airplayLabel];
      double v20 = (UILabel *)[objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];
      airplayRouteLabel = self->_airplayRouteLabel;
      self->_airplayRouteLabel = v20;

      [(IMVideoView *)self setAirplayRouteName:self->_airplayRouteName];
      [(UILabel *)self->_airplayRouteLabel setBackgroundColor:0];
      [(UILabel *)self->_airplayRouteLabel setOpaque:0];
      [(UILabel *)self->_airplayRouteLabel setContentMode:4];
      double v22 = self->_airplayRouteLabel;
      v23 = +[UIColor colorWithWhite:1.0 alpha:0.45];
      [(UILabel *)v22 setTextColor:v23];

      [(UILabel *)self->_airplayRouteLabel setTextAlignment:1];
      [(UIView *)self->_airplayBackground addSubview:self->_airplayRouteLabel];
      airplayBackground = self->_airplayBackground;
    }
    [(IMVideoView *)self addSubview:airplayBackground];
  }
  else
  {
    [(UIImageView *)self->_airplayTVImage removeFromSuperview];
    double v24 = self->_airplayTVImage;
    self->_airplayTVImage = 0;

    [(UILabel *)self->_airplayLabel removeFromSuperview];
    v25 = self->_airplayLabel;
    self->_airplayLabel = 0;

    [(UILabel *)self->_airplayRouteLabel removeFromSuperview];
    double v26 = self->_airplayRouteLabel;
    self->_airplayRouteLabel = 0;

    [(UIView *)self->_airplayBackground removeFromSuperview];
    double v27 = self->_airplayBackground;
    self->_airplayBackground = 0;
  }
}

- (AVPlayerLayer)videoLayer
{
  return self->_videoLayer;
}

- (BOOL)airplayActive
{
  return self->_airplayActive;
}

- (BOOL)externalDisplay
{
  return self->_externalDisplay;
}

- (void)setExternalDisplay:(BOOL)a3
{
  self->_externalDispladouble y = a3;
}

- (NSString)airplayRouteName
{
  return self->_airplayRouteName;
}

- (IMAVPlayer)player
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_player);

  return (IMAVPlayer *)WeakRetained;
}

- (void)setPlayer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_player);
  objc_storeStrong((id *)&self->_airplayRouteName, 0);
  objc_storeStrong((id *)&self->_airplayRouteLabel, 0);
  objc_storeStrong((id *)&self->_airplayLabel, 0);
  objc_storeStrong((id *)&self->_airplayTVImage, 0);
  objc_storeStrong((id *)&self->_airplayBackground, 0);

  objc_storeStrong((id *)&self->_videoLayer, 0);
}

@end