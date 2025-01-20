@interface NTKAstronomyRichComplicationContentView
- (BOOL)_shouldAnimateWithTemplateUpdateReason:(int64_t)a3;
- (BOOL)editing;
- (id)initForDevice:(id)a3 family:(int64_t)a4 diameter:(double)a5;
- (void)_hideLocationDot;
- (void)_startAnimating;
- (void)_stopAnimating;
- (void)applyPausedUpdate:(BOOL)a3;
- (void)astronomyVistaViewWillDisplay:(id)a3 forTime:(double)a4;
- (void)handleOrdinaryScreenWake;
- (void)handleTemplateMetadata:(id)a3 reason:(int64_t)a4;
- (void)handleWristRaiseScreenWake;
- (void)layoutSubviews;
- (void)prepareWristRaiseAnimation;
- (void)renderSynchronouslyWithImageQueueDiscard:(BOOL)a3 inGroup:(id)a4;
- (void)setEditing:(BOOL)a3;
- (void)setTimeTravelDate:(id)a3 animated:(BOOL)a4;
@end

@implementation NTKAstronomyRichComplicationContentView

- (id)initForDevice:(id)a3 family:(int64_t)a4 diameter:(double)a5
{
  id v9 = a3;
  v17.receiver = self;
  v17.super_class = (Class)NTKAstronomyRichComplicationContentView;
  v10 = [(NTKAstronomyRichComplicationContentView *)&v17 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_device, a3);
    v11->_family = a4;
    id v12 = objc_alloc(MEMORY[0x1E4F7A058]);
    v13 = [MEMORY[0x1E4F7A048] defaultConfigurationWithDevice:v9];
    uint64_t v14 = objc_msgSend(v12, "initWithFrame:configuration:", v13, 0.0, 0.0, a5, a5);
    astronomyVistaView = v11->_astronomyVistaView;
    v11->_astronomyVistaView = (NUNIAstronomyVistaView *)v14;

    [(NUNIAstronomyVistaView *)v11->_astronomyVistaView setObserver:v11];
    [(NTKAstronomyRichComplicationContentView *)v11 addSubview:v11->_astronomyVistaView];
    [(NUNIAstronomyVistaView *)v11->_astronomyVistaView setOpaque:0];
    *((unsigned char *)v11 + 464) |= 1u;
  }

  return v11;
}

- (void)applyPausedUpdate:(BOOL)a3
{
  *((unsigned char *)self + 464) = *((unsigned char *)self + 464) & 0xFE | a3;
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)NTKAstronomyRichComplicationContentView;
  [(NTKAstronomyRichComplicationContentView *)&v5 layoutSubviews];
  uint64_t v3 = [(NTKAstronomyRichComplicationContentView *)self bounds];
  locationDot = self->_locationDot;
  MEMORY[0x1C1874A70](v3);
  -[NUNIAstronomyLocationDot setCenter:](locationDot, "setCenter:");
}

- (void)_hideLocationDot
{
  [(NUNIAstronomyLocationDot *)self->_locationDot stopAnimation];
  [(NUNIAstronomyLocationDot *)self->_locationDot setAlpha:0.0];
  locationDot = self->_locationDot;
  [(NUNIAstronomyLocationDot *)locationDot removeFromSuperview];
}

- (void)handleTemplateMetadata:(id)a3 reason:(int64_t)a4
{
  id v6 = a3;
  v7 = [v6 objectForKeyedSubscript:@"vista"];
  unint64_t v8 = (int)[v7 intValue];

  id v9 = [v6 objectForKeyedSubscript:@"entry date"];
  timelineDate = self->_timelineDate;
  self->_timelineDate = v9;

  v11 = [v6 objectForKeyedSubscript:@"current location"];
  currentLocation = self->_currentLocation;
  self->_currentLocation = v11;

  v13 = [v6 objectForKeyedSubscript:@"any location"];
  uint64_t v14 = [(NUNIAstronomyVistaView *)self->_astronomyVistaView scene];
  if (!v14)
  {
    if (v8 == 2)
    {
      if (self->_family == 12) {
        uint64_t v15 = 16499712;
      }
      else {
        uint64_t v15 = 771072;
      }
    }
    else if (v8 == 1)
    {
      uint64_t v15 = 24;
    }
    else
    {
      uint64_t v15 = 8;
    }
    objc_initWeak(&location, self);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __73__NTKAstronomyRichComplicationContentView_handleTemplateMetadata_reason___block_invoke;
    aBlock[3] = &unk_1E62C60A0;
    objc_copyWeak(v23, &location);
    v23[1] = (id)v8;
    v16 = _Block_copy(aBlock);
    uint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F7A068]) initWithSphereoids:v15 currentDateBlock:v16];
    [v14 setBackgroundType:1];
    [v14 setCollectionType:self->_family != 12];
    [(NUNIAstronomyVistaView *)self->_astronomyVistaView setScene:v14];

    objc_destroyWeak(v23);
    objc_destroyWeak(&location);
  }
  [(NUNIAstronomyVistaView *)self->_astronomyVistaView applyVista:v8 transitionStyle:0];
  self->_vista = v8;
  [(NTKAstronomyRichComplicationContentView *)self _startAnimating];
  BOOL v17 = [(NTKAstronomyRichComplicationContentView *)self _shouldAnimateWithTemplateUpdateReason:a4];
  if ((unint64_t)a4 > 1 || !self->_currentLocation || v8)
  {
    [(NTKAstronomyRichComplicationContentView *)self _hideLocationDot];
    if (v8) {
      goto LABEL_21;
    }
  }
  else if (self->_editing)
  {
    [(NTKAstronomyRichComplicationContentView *)self _hideLocationDot];
  }
  else
  {
    [(NTKAstronomyRichComplicationContentView *)self _showLocationDot];
  }
  v18 = [(NUNIAstronomyVistaView *)self->_astronomyVistaView rotatable:0];
  v19 = self->_currentLocation;
  if (!v19) {
    v19 = v13;
  }
  [(CLLocation *)v19 coordinate];
  objc_msgSend(v18, "setHomeCoordinate:");
  [v18 homeCoordinate];
  objc_msgSend(v18, "setCenterCoordinate:animated:", v17);

LABEL_21:
  [(NUNIAstronomyVistaView *)self->_astronomyVistaView updateSunLocationAnimated:v17];
  [(NTKAstronomyRichComplicationContentView *)self setNeedsLayout];
  if ((*((unsigned char *)self + 464) & 1) == 0 || v17) {
    char v21 = 0;
  }
  else {
    char v21 = 4;
  }
  *((unsigned char *)self + 464) = v21 | *((unsigned char *)self + 464) & 0xFB;
}

id __73__NTKAstronomyRichComplicationContentView_handleTemplateMetadata_reason___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = (void *)*((void *)WeakRetained + 57);
    if (!v4 || *(void *)(a1 + 40)) {
      v4 = (void *)*((void *)WeakRetained + 56);
    }
    id v5 = v4;
  }
  else
  {
    id v5 = [MEMORY[0x1E4F1C9C8] date];
  }
  id v6 = v5;

  return v6;
}

- (void)astronomyVistaViewWillDisplay:(id)a3 forTime:(double)a4
{
  if ((*((unsigned char *)self + 464) & 4) != 0) {
    [(NTKAstronomyRichComplicationContentView *)self _stopAnimating];
  }
}

- (void)_startAnimating
{
  if ((*((unsigned char *)self + 464) & 2) == 0)
  {
    *((unsigned char *)self + 464) |= 2u;
    *((unsigned char *)self + 464) &= ~4u;
    [(NUNIAstronomyVistaView *)self->_astronomyVistaView startAnimation];
  }
  [(NTKDelayedBlock *)self->_stopAnimationDelayedBlock cancel];
  objc_initWeak(&location, self);
  uint64_t v3 = [NTKDelayedBlock alloc];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __58__NTKAstronomyRichComplicationContentView__startAnimating__block_invoke;
  v6[3] = &unk_1E62C08C0;
  objc_copyWeak(&v7, &location);
  v4 = [(NTKDelayedBlock *)v3 initWithDelay:v6 action:1.0];
  stopAnimationDelayedBlock = self->_stopAnimationDelayedBlock;
  self->_stopAnimationDelayedBlock = v4;

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __58__NTKAstronomyRichComplicationContentView__startAnimating__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _stopAnimating];
}

- (void)_stopAnimating
{
  if ((*((unsigned char *)self + 464) & 2) != 0)
  {
    *((unsigned char *)self + 464) &= ~2u;
    [(NUNIAstronomyVistaView *)self->_astronomyVistaView stopAnimation];
  }
}

- (BOOL)_shouldAnimateWithTemplateUpdateReason:(int64_t)a3
{
  return (unint64_t)(a3 - 1) < 3;
}

- (void)prepareWristRaiseAnimation
{
  if (!self->_vista)
  {
    id v3 = [(NUNIAstronomyVistaView *)self->_astronomyVistaView rotatable:0];
    CLLocationCoordinate2D v2 = CLLocationCoordinate2DMake(0.0, 0.0);
    objc_msgSend(v3, "setCenterCoordinate:animated:", 0, v2.latitude, v2.longitude);
  }
}

- (void)handleOrdinaryScreenWake
{
  if (!self->_vista)
  {
    [(NTKAstronomyRichComplicationContentView *)self _startAnimating];
    id v3 = [(NUNIAstronomyVistaView *)self->_astronomyVistaView rotatable:0];
    [v3 homeCoordinate];
    objc_msgSend(v3, "setCenterCoordinate:animated:", 1);
  }
}

- (void)handleWristRaiseScreenWake
{
  if (!self->_vista)
  {
    [(NTKAstronomyRichComplicationContentView *)self _startAnimating];
    id v3 = [(NUNIAstronomyVistaView *)self->_astronomyVistaView rotatable:0];
    [v3 homeCoordinate];
    objc_msgSend(v3, "setCenterCoordinate:animated:", 1);
  }
}

- (void)renderSynchronouslyWithImageQueueDiscard:(BOOL)a3 inGroup:(id)a4
{
}

- (void)setTimeTravelDate:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  objc_storeStrong((id *)&self->_timeTravelDate, a3);
  id v7 = a3;
  [(NUNIAstronomyVistaView *)self->_astronomyVistaView updateSunLocationAnimated:v4];
}

- (BOOL)editing
{
  return self->_editing;
}

- (void)setEditing:(BOOL)a3
{
  self->_editing = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentLocation, 0);
  objc_storeStrong((id *)&self->_stopAnimationDelayedBlock, 0);
  objc_storeStrong((id *)&self->_timeTravelDate, 0);
  objc_storeStrong((id *)&self->_timelineDate, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_locationDot, 0);
  objc_storeStrong((id *)&self->_astronomyVistaView, 0);
}

@end