@interface HUDLine
- (BOOL)updatesComplete;
- (CALayer)keyLayer;
- (CALayer)valueLayer;
- (HUDLine)init;
- (HUDLineDelegate)lineDelegate;
- (double)contentScaleForTexts;
- (double)preferredKeyLayerWidth;
- (double)preferredValueLayerWidth;
- (double)spacing;
- (void)layoutSublayers;
- (void)nilifyCALayers;
- (void)setFontSize:(double)a3;
- (void)setKeyLayer:(id)a3;
- (void)setLineDelegate:(id)a3;
- (void)setPreferredKeyLayerWidth:(double)a3;
- (void)setPreferredValueLayerWidth:(double)a3;
- (void)setSpacing:(double)a3;
- (void)setUpdatesComplete:(BOOL)a3;
- (void)setValueLayer:(id)a3;
@end

@implementation HUDLine

- (HUDLine)init
{
  v7.receiver = self;
  v7.super_class = (Class)HUDLine;
  v2 = [(HUDLine *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_updatesComplete = 0;
    keyLayer = v2->_keyLayer;
    v2->_keyLayer = 0;

    valueLayer = v3->_valueLayer;
    v3->_valueLayer = 0;

    v3->_preferredKeyLayerWidth = 0.0;
    v3->_preferredValueLayerWidth = 0.0;
  }
  return v3;
}

- (void)nilifyCALayers
{
  keyLayer = self->_keyLayer;
  self->_keyLayer = 0;

  valueLayer = self->_valueLayer;
  self->_valueLayer = 0;
}

- (void)setPreferredKeyLayerWidth:(double)a3
{
  [(HUDLine *)self preferredKeyLayerWidth];
  if (v5 != a3)
  {
    self->_preferredKeyLayerWidth = a3;
    [(HUDLine *)self setNeedsLayout];
  }
}

- (void)setPreferredValueLayerWidth:(double)a3
{
  [(HUDLine *)self preferredValueLayerWidth];
  if (v5 != a3)
  {
    self->_preferredValueLayerWidth = a3;
    [(HUDLine *)self setNeedsLayout];
  }
}

- (void)layoutSublayers
{
  v15.receiver = self;
  v15.super_class = (Class)HUDLine;
  [(HUDLine *)&v15 layoutSublayers];
  double preferredKeyLayerWidth = self->_preferredKeyLayerWidth;
  [(HUDLine *)self bounds];
  double v4 = CGRectGetWidth(v16) - self->_preferredValueLayerWidth - self->_spacing;
  if (preferredKeyLayerWidth >= v4) {
    double preferredKeyLayerWidth = v4;
  }
  [(CALayer *)self->_keyLayer preferredFrameSize];
  double v6 = v5;
  objc_super v7 = [(HUDLine *)self keyLayer];
  [v7 setFrame:CGRectMake(0.0, 0.0, preferredKeyLayerWidth, v6)];

  v8 = [(HUDLine *)self valueLayer];

  if (v8)
  {
    [(CALayer *)self->_keyLayer frame];
    double v10 = self->_spacing + v9;
    double preferredValueLayerWidth = self->_preferredValueLayerWidth;
    [(CALayer *)self->_valueLayer preferredFrameSize];
    double v13 = v12;
    v14 = [(HUDLine *)self valueLayer];
    [v14 setFrame:v10, 0.0, preferredValueLayerWidth, v13];
  }
}

- (void)setFontSize:(double)a3
{
  v3 = sub_100027DEC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    double v5 = "-[HUDLine setFontSize:]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s from HUDLine called. The derived classes's method should be called instead.", (uint8_t *)&v4, 0xCu);
  }
}

- (BOOL)updatesComplete
{
  return self->_updatesComplete;
}

- (void)setUpdatesComplete:(BOOL)a3
{
  self->_updatesComplete = a3;
}

- (CALayer)keyLayer
{
  return self->_keyLayer;
}

- (void)setKeyLayer:(id)a3
{
}

- (CALayer)valueLayer
{
  return self->_valueLayer;
}

- (void)setValueLayer:(id)a3
{
}

- (double)preferredKeyLayerWidth
{
  return self->_preferredKeyLayerWidth;
}

- (double)preferredValueLayerWidth
{
  return self->_preferredValueLayerWidth;
}

- (HUDLineDelegate)lineDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_lineDelegate);

  return (HUDLineDelegate *)WeakRetained;
}

- (void)setLineDelegate:(id)a3
{
}

- (double)spacing
{
  return self->_spacing;
}

- (void)setSpacing:(double)a3
{
  self->_spacing = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_lineDelegate);
  objc_storeStrong((id *)&self->_valueLayer, 0);

  objc_storeStrong((id *)&self->_keyLayer, 0);
}

- (double)contentScaleForTexts
{
  double result = *(double *)&qword_100064488;
  if (*(double *)&qword_100064488 <= 0.0)
  {
    if (qword_100064438 != -1) {
      dispatch_once(&qword_100064438, &stru_100052958);
    }
    if (byte_100064440)
    {
      v1 = +[CADisplay mainDisplay];
      [v1 bounds];
      double v2 = 1.0;
      if (v3 > 1920.0) {
        double v2 = 2.0;
      }
      qword_100064488 = *(void *)&v2;

      return *(double *)&qword_100064488;
    }
    else
    {
      MGGetFloat32Answer();
      double result = v4;
      qword_100064488 = *(void *)&result;
    }
  }
  return result;
}

@end