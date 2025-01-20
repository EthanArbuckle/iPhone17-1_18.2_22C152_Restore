@interface NTKRichComplicationLineMeteredView
- (CGPoint)_pointAtProgress:(float)a3;
- (NSArray)meterLayers;
- (id)_shapeStrokeColor;
- (void)_setupShapeLayer:(id)a3;
- (void)_updateGradient;
- (void)colorMetersWithProgress:(double)a3;
- (void)setMeterLayers:(id)a3;
- (void)setProgress:(double)a3;
@end

@implementation NTKRichComplicationLineMeteredView

- (void)_setupShapeLayer:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F19A30];
  id v4 = a3;
  id v5 = [v3 currentDevice];
  os_unfair_lock_lock((os_unfair_lock_t)&_LayoutConstants___lock_9);
  id WeakRetained = objc_loadWeakRetained(&_LayoutConstants___cachedDevice_9);
  if (WeakRetained)
  {
    v7 = WeakRetained;
    id v8 = objc_loadWeakRetained(&_LayoutConstants___cachedDevice_9);
    if (v8 == v5)
    {
      uint64_t v9 = [v5 version];
      uint64_t v10 = _LayoutConstants___previousCLKDeviceVersion_9;

      if (v9 == v10) {
        goto LABEL_6;
      }
    }
    else
    {
    }
  }
  id v11 = objc_storeWeak(&_LayoutConstants___cachedDevice_9, v5);
  _LayoutConstants___previousCLKDeviceVersion_9 = [v5 version];

  ___LayoutConstants_block_invoke_8(v12, v5);
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_LayoutConstants___lock_9);

  CDGenerateMeterLayersOnLayer();
}

void __55__NTKRichComplicationLineMeteredView__setupShapeLayer___block_invoke(uint64_t a1, void *a2, double a3, uint64_t a4, int a5)
{
  double v7 = *(double *)(a1 + 40);
  double v8 = *(double *)(a1 + 48);
  if (a5) {
    double v8 = v8 + *(double *)(a1 + 56);
  }
  uint64_t v9 = (void *)MEMORY[0x1E4FB14C0];
  double v10 = *(double *)(a1 + 64);
  id v11 = a2;
  objc_msgSend(v9, "bezierPathWithRoundedRect:cornerRadius:", 0.0, 0.0, v7, v8, v10);
  id v14 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setPath:", objc_msgSend(v14, "CGPath"));
  objc_msgSend(v11, "setBounds:", 0.0, 0.0, v7, v8);
  *(float *)&double v12 = a3;
  [*(id *)(a1 + 32) _pointAtProgress:v12];
  [v11 setPosition:v7 * 0.5 + v13];
}

- (id)_shapeStrokeColor
{
  return 0;
}

- (void)setProgress:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NTKRichComplicationLineMeteredView;
  -[CDRichComplicationShapeView setProgress:](&v5, sel_setProgress_);
  [(NTKRichComplicationLineMeteredView *)self colorMetersWithProgress:a3];
}

- (void)_updateGradient
{
  v3.receiver = self;
  v3.super_class = (Class)NTKRichComplicationLineMeteredView;
  [(CDRichComplicationShapeView *)&v3 _updateGradient];
  [(CDRichComplicationShapeView *)self progress];
  -[NTKRichComplicationLineMeteredView colorMetersWithProgress:](self, "colorMetersWithProgress:");
}

- (void)colorMetersWithProgress:(double)a3
{
  id v4 = [(NTKRichComplicationLineMeteredView *)self meterLayers];

  if (v4)
  {
    [(NTKRichComplicationLineMeteredView *)self meterLayers];
    objc_claimAutoreleasedReturnValue();
    [(CDRichComplicationShapeView *)self gradientColors];
    objc_claimAutoreleasedReturnValue();
    CDColorizeMeterProgress();
  }
}

- (CGPoint)_pointAtProgress:(float)a3
{
  [(NTKRichComplicationLineMeteredView *)self bounds];
  double v5 = v4 * a3;
  double v7 = v6 * 0.5;
  result.y = v7;
  result.x = v5;
  return result;
}

- (NSArray)meterLayers
{
  return self->_meterLayers;
}

- (void)setMeterLayers:(id)a3
{
}

- (void).cxx_destruct
{
}

@end