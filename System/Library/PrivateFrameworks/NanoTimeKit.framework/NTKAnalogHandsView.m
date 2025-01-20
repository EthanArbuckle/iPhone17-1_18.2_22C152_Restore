@interface NTKAnalogHandsView
+ (Class)handViewClass;
- (BOOL)_canRunTimeAnimation;
- (BOOL)shouldShowSecondsHandInAlwaysOn;
- (NSDate)overrideDate;
- (NTKHandView)hourHandViewAlt;
- (NTKHandView)minuteHandViewAlt;
- (NTKHandView)secondHandViewAlt;
- (id)displayTime;
- (id)initForDevice:(id)a3;
- (int64_t)dataMode;
- (void)_addHourMinuteHandsTransitionLayers;
- (void)_enumerateHourHandViewsWithBlock:(id)a3;
- (void)_enumerateMinuteHandViewsWithBlock:(id)a3;
- (void)_enumerateSecondHandViewsWithBlock:(id)a3;
- (void)_installAltViewsHour:(id)a3 minute:(id)a4 second:(id)a5;
- (void)_removeHourMinuteHandsTransitionLayers;
- (void)_setAltHandsAlpha:(double)a3;
- (void)_setHandsAlpha:(double)a3;
- (void)applyHourMinuteHandsTransitionFraction:(double)a3 fromStrokeColor:(id)a4 fromFillColor:(id)a5 toStrokeColor:(id)a6 toFillColor:(id)a7;
- (void)applySecondHandColor:(id)a3;
- (void)setDataMode:(int64_t)a3;
- (void)setHourHandViewAlt:(id)a3;
- (void)setMinuteHandViewAlt:(id)a3;
- (void)setOverrideDate:(id)a3 duration:(double)a4;
- (void)setSecondHandViewAlt:(id)a3;
- (void)setShouldShowSecondsHandInAlwaysOn:(BOOL)a3;
- (void)setTimeOffset:(double)a3;
@end

@implementation NTKAnalogHandsView

- (id)initForDevice:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)NTKAnalogHandsView;
  v3 = [(CLKUIAnalogHandsView *)&v7 initForDevice:a3];
  if (v3)
  {
    v4 = +[NTKTimeOffsetManager sharedManager];
    [v4 timeOffset];
    v3[65] = v5;
  }
  return v3;
}

+ (Class)handViewClass
{
  return (Class)objc_opt_class();
}

- (id)displayTime
{
  return +[NTKDate faceDate];
}

- (void)_enumerateSecondHandViewsWithBlock:(id)a3
{
  v4 = (void (**)(void))a3;
  v5.receiver = self;
  v5.super_class = (Class)NTKAnalogHandsView;
  [(CLKUIAnalogHandsView *)&v5 _enumerateSecondHandViewsWithBlock:v4];
  if (self->_secondHandViewAlt) {
    v4[2](v4);
  }
}

- (void)_enumerateMinuteHandViewsWithBlock:(id)a3
{
  v4 = (void (**)(void))a3;
  v5.receiver = self;
  v5.super_class = (Class)NTKAnalogHandsView;
  [(CLKUIAnalogHandsView *)&v5 _enumerateMinuteHandViewsWithBlock:v4];
  if (self->_minuteHandViewAlt) {
    v4[2](v4);
  }
}

- (void)_enumerateHourHandViewsWithBlock:(id)a3
{
  v4 = (void (**)(void))a3;
  v5.receiver = self;
  v5.super_class = (Class)NTKAnalogHandsView;
  [(CLKUIAnalogHandsView *)&v5 _enumerateHourHandViewsWithBlock:v4];
  if (self->_hourHandViewAlt) {
    v4[2](v4);
  }
}

- (BOOL)_canRunTimeAnimation
{
  if (self->_overrideDate) {
    return 0;
  }
  v3.receiver = self;
  v3.super_class = (Class)NTKAnalogHandsView;
  return [(CLKUIAnalogHandsView *)&v3 _canRunTimeAnimation];
}

- (void)setOverrideDate:(id)a3 duration:(double)a4
{
  id v7 = a3;
  v8 = self->_overrideDate;
  if ((CLKEqualObjects() & 1) == 0)
  {
    [(CLKUIAnalogHandsView *)self _stopTimeAnimation];
    v9 = [(NTKAnalogHandsView *)self displayTime];
    v10 = v9;
    if (v7)
    {
      id v11 = v7;
    }
    else
    {
      id v11 = [v9 dateByAddingTimeInterval:a4];
    }
    v12 = v11;
    objc_storeStrong((id *)&self->_overrideDate, a3);
    v13 = [(CLKUIAnalogHandsView *)self calendar];
    CLKHourMinuteSecondAnglesForTime();

    v14 = [(CLKUIAnalogHandsView *)self hourHandView];
    [v14 setZRotation:0.0];

    v15 = [(NTKAnalogHandsView *)self hourHandViewAlt];
    [v15 setZRotation:0.0];

    v16 = [(CLKUIAnalogHandsView *)self minuteHandView];
    [v16 setZRotation:0.0];

    v17 = [(NTKAnalogHandsView *)self minuteHandViewAlt];
    [v17 setZRotation:0.0];

    v18 = [(CLKUIAnalogHandsView *)self secondHandView];
    [v18 setZRotation:0.0];

    v19 = [(NTKAnalogHandsView *)self secondHandViewAlt];
    [v19 setZRotation:0.0];

    v20 = [(CLKUIAnalogHandsView *)self delegate];

    if (v20)
    {
      v21 = [(CLKUIAnalogHandsView *)self delegate];
      v22 = [(CLKUIAnalogHandsView *)self hourHandView];
      [v21 overrideZRotation:v22 forHandView:0.0];

      v23 = [(NTKAnalogHandsView *)self hourHandViewAlt];

      if (v23)
      {
        v24 = [(CLKUIAnalogHandsView *)self delegate];
        v25 = [(NTKAnalogHandsView *)self hourHandViewAlt];
        [v24 overrideZRotation:v25 forHandView:0.0];
      }
      v26 = [(CLKUIAnalogHandsView *)self delegate];
      v27 = [(CLKUIAnalogHandsView *)self minuteHandView];
      [v26 overrideZRotation:v27 forHandView:0.0];

      v28 = [(NTKAnalogHandsView *)self minuteHandViewAlt];

      if (v28)
      {
        v29 = [(CLKUIAnalogHandsView *)self delegate];
        v30 = [(NTKAnalogHandsView *)self minuteHandViewAlt];
        [v29 overrideZRotation:v30 forHandView:0.0];
      }
      v31 = [(CLKUIAnalogHandsView *)self delegate];
      v32 = [(CLKUIAnalogHandsView *)self secondHandView];
      [v31 overrideZRotation:v32 forHandView:0.0];

      v33 = [(NTKAnalogHandsView *)self secondHandViewAlt];

      if (v33)
      {
        v34 = [(CLKUIAnalogHandsView *)self delegate];
        v35 = [(NTKAnalogHandsView *)self secondHandViewAlt];
        [v34 overrideZRotation:v35 forHandView:0.0];
      }
    }
    if (!v7) {
      [(CLKUIAnalogHandsView *)self _startNewTimeAnimation];
    }
  }
}

- (void)setTimeOffset:(double)a3
{
  if ((CLKFloatEqualsFloat() & 1) == 0)
  {
    self->_timeOffset = a3;
    [(CLKUIAnalogHandsView *)self _startNewTimeAnimation];
  }
}

- (void)_setHandsAlpha:(double)a3
{
  objc_super v5 = [(CLKUIAnalogHandsView *)self hourHandView];
  [v5 setAlpha:a3];

  v6 = [(CLKUIAnalogHandsView *)self minuteHandView];
  [v6 setAlpha:a3];

  id v7 = [(CLKUIAnalogHandsView *)self secondHandView];
  [v7 setAlpha:a3];

  v8 = [(CLKUIAnalogHandsView *)self hourHandView];
  v9 = [v8 shadowView];
  [v9 setAlpha:a3];

  v10 = [(CLKUIAnalogHandsView *)self minuteHandView];
  id v11 = [v10 shadowView];
  [v11 setAlpha:a3];

  id v13 = [(CLKUIAnalogHandsView *)self secondHandView];
  v12 = [v13 shadowView];
  [v12 setAlpha:a3];
}

- (void)_setAltHandsAlpha:(double)a3
{
  -[CLKUIHandView setAlpha:](self->_hourHandViewAlt, "setAlpha:");
  [(CLKUIHandView *)self->_minuteHandViewAlt setAlpha:a3];
  [(CLKUIHandView *)self->_secondHandViewAlt setAlpha:a3];
  objc_super v5 = [(CLKUIHandView *)self->_hourHandViewAlt shadowView];
  [v5 setAlpha:a3];

  v6 = [(CLKUIHandView *)self->_minuteHandViewAlt shadowView];
  [v6 setAlpha:a3];

  id v7 = [(CLKUIHandView *)self->_secondHandViewAlt shadowView];
  [v7 setAlpha:a3];
}

- (void)_installAltViewsHour:(id)a3 minute:(id)a4 second:(id)a5
{
  id v18 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_storeStrong((id *)&self->_hourHandViewAlt, a3);
  objc_storeStrong((id *)&self->_minuteHandViewAlt, a4);
  p_secondHandViewAlt = &self->_secondHandViewAlt;
  objc_storeStrong((id *)&self->_secondHandViewAlt, a5);
  [(NTKAnalogHandsView *)self addSubview:self->_hourHandViewAlt];
  [(CLKUIHandView *)self->_hourHandViewAlt setNeedsLayout];
  [(NTKAnalogHandsView *)self addSubview:self->_minuteHandViewAlt];
  [(CLKUIHandView *)self->_minuteHandViewAlt setNeedsLayout];
  [(NTKAnalogHandsView *)self addSubview:self->_secondHandViewAlt];
  [(CLKUIHandView *)self->_secondHandViewAlt setNeedsLayout];
  if ([(CLKUIAnalogHandsView *)self useDirectionalShadows])
  {
    v12 = [(CLKUIAnalogHandsView *)self directionalShadowContainerView];
    id v13 = [(CLKUIHandView *)self->_hourHandViewAlt shadowView];
    [v12 addSubview:v13];

    v14 = [(CLKUIAnalogHandsView *)self directionalShadowContainerView];
    v15 = [(CLKUIHandView *)self->_minuteHandViewAlt shadowView];
    [v14 addSubview:v15];

    v16 = [(CLKUIAnalogHandsView *)self directionalShadowContainerView];
    v17 = [(CLKUIHandView *)*p_secondHandViewAlt shadowView];
    [v16 addSubview:v17];
  }
}

- (void)applySecondHandColor:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NTKAnalogHandsView;
  id v4 = a3;
  [(CLKUIAnalogHandsView *)&v5 applySecondHandColor:v4];
  -[NTKHandView setColor:](self->_secondHandViewAlt, "setColor:", v4, v5.receiver, v5.super_class);
}

- (void)applyHourMinuteHandsTransitionFraction:(double)a3 fromStrokeColor:(id)a4 fromFillColor:(id)a5 toStrokeColor:(id)a6 toFillColor:(id)a7
{
  BOOL v14 = fabs(a3) < 0.00000011920929;
  double v13 = fabs(a3 + -1.0);
  BOOL v14 = v14 || v13 < 0.00000011920929;
  if (v14)
  {
    id v15 = a7;
    id v16 = a6;
    id v17 = a5;
    id v18 = a4;
    [(NTKAnalogHandsView *)self _removeHourMinuteHandsTransitionLayers];
  }
  else
  {
    id v19 = a7;
    id v20 = a6;
    id v21 = a5;
    id v22 = a4;
    [(NTKAnalogHandsView *)self _addHourMinuteHandsTransitionLayers];
  }
  CLKCompressFraction();
  CGFloat v24 = v23;
  CLKCompressFraction();
  double v26 = v25;
  CLKCompressFraction();
  *(float *)&double v26 = v26;
  LODWORD(v27) = LODWORD(v26);
  [(CALayer *)self->_hourHandTransitionBodyLayer setOpacity:v27];
  LODWORD(v28) = LODWORD(v26);
  [(CALayer *)self->_minuteHandTransitionBodyLayer setOpacity:v28];
  LODWORD(v29) = LODWORD(v26);
  [(CALayer *)self->_minuteHandTransitionPegLayer setOpacity:v29];
  LODWORD(v30) = LODWORD(v26);
  [(CALayer *)self->_hourHandTransitionStemLayer setOpacity:v30];
  LODWORD(v31) = LODWORD(v26);
  [(CALayer *)self->_minuteHandTransitionStemLayer setOpacity:v31];
  memset(&v68, 0, sizeof(v68));
  CLKInterpolateBetweenFloatsClipped();
  CATransform3DMakeScale(&v68, v24, v32, 1.0);
  minuteHandTransitionBodyLayer = self->_minuteHandTransitionBodyLayer;
  CATransform3D v67 = v68;
  [(CALayer *)minuteHandTransitionBodyLayer setTransform:&v67];
  hourHandTransitionBodyLayer = self->_hourHandTransitionBodyLayer;
  CATransform3D v67 = v68;
  [(CALayer *)hourHandTransitionBodyLayer setTransform:&v67];
  minuteHandTransitionPegLayer = self->_minuteHandTransitionPegLayer;
  CATransform3DMakeScale(&v66, v24, v24, 1.0);
  [(CALayer *)minuteHandTransitionPegLayer setTransform:&v66];
  CLKInterpolateBetweenFloatsClipped();
  double v37 = v36;
  -[CALayer setBorderWidth:](self->_minuteHandTransitionBodyLayer, "setBorderWidth:");
  [(CALayer *)self->_hourHandTransitionBodyLayer setBorderWidth:v37];
  v38 = self->_minuteHandTransitionPegLayer;
  CLKInterpolateBetweenFloatsClipped();
  -[CALayer setBorderWidth:](v38, "setBorderWidth:");
  minuteHandTransitionStemLayer = self->_minuteHandTransitionStemLayer;
  CATransform3DMakeScale(&v65, v24, 1.0, 1.0);
  [(CALayer *)minuteHandTransitionStemLayer setTransform:&v65];
  hourHandTransitionStemLayer = self->_hourHandTransitionStemLayer;
  CATransform3DMakeScale(&v64, v24, 1.0, 1.0);
  [(CALayer *)hourHandTransitionStemLayer setTransform:&v64];
  v41 = self->_minuteHandTransitionBodyLayer;
  id v42 = a6;
  -[CALayer setBorderColor:](v41, "setBorderColor:", [v42 CGColor]);
  v43 = self->_minuteHandTransitionPegLayer;
  id v44 = v42;
  -[CALayer setBorderColor:](v43, "setBorderColor:", [v44 CGColor]);
  v45 = self->_minuteHandTransitionStemLayer;
  id v46 = v44;
  -[CALayer setBackgroundColor:](v45, "setBackgroundColor:", [v46 CGColor]);
  v47 = self->_minuteHandTransitionBodyLayer;
  id v48 = a7;
  -[CALayer setBackgroundColor:](v47, "setBackgroundColor:", [v48 CGColor]);
  v49 = self->_minuteHandTransitionPegLayer;
  id v50 = v48;
  -[CALayer setBackgroundColor:](v49, "setBackgroundColor:", [v50 CGColor]);
  v51 = self->_hourHandTransitionBodyLayer;
  id v52 = v46;
  -[CALayer setBorderColor:](v51, "setBorderColor:", [v52 CGColor]);
  v53 = self->_hourHandTransitionStemLayer;
  id v54 = v52;
  -[CALayer setBackgroundColor:](v53, "setBackgroundColor:", [v54 CGColor]);
  v55 = self->_hourHandTransitionBodyLayer;
  id v56 = v50;
  -[CALayer setBackgroundColor:](v55, "setBackgroundColor:", [v56 CGColor]);
  if (a3 > 0.6) {
    id v57 = v56;
  }
  else {
    id v57 = a5;
  }
  if (a3 > 0.6) {
    id v58 = v54;
  }
  else {
    id v58 = a4;
  }
  id v59 = v58;
  id v60 = v57;
  v61 = [(CLKUIAnalogHandsView *)self minuteHandView];
  [v61 setColor:v59];

  v62 = [(CLKUIAnalogHandsView *)self hourHandView];
  [v62 setColor:v59];

  [(CLKUIAnalogHandsView *)self setInlayColor:v60];
}

- (void)_removeHourMinuteHandsTransitionLayers
{
  [(CALayer *)self->_minuteHandTransitionBodyLayer removeFromSuperlayer];
  [(CALayer *)self->_minuteHandTransitionStemLayer removeFromSuperlayer];
  [(CALayer *)self->_minuteHandTransitionPegLayer removeFromSuperlayer];
  [(CALayer *)self->_hourHandTransitionBodyLayer removeFromSuperlayer];
  hourHandTransitionStemLayer = self->_hourHandTransitionStemLayer;
  [(CALayer *)hourHandTransitionStemLayer removeFromSuperlayer];
}

- (void)_addHourMinuteHandsTransitionLayers
{
  id v93 = [(CLKUIAnalogHandsView *)self minuteHandConfiguration];
  objc_super v3 = [(CLKUIAnalogHandsView *)self hourHandConfiguration];
  if (!self->_minuteHandTransitionPegLayer)
  {
    id v4 = (CALayer *)objc_opt_new();
    minuteHandTransitionPegLayer = self->_minuteHandTransitionPegLayer;
    self->_minuteHandTransitionPegLayer = v4;

    v6 = self->_minuteHandTransitionPegLayer;
    id v7 = [(CLKUIAnalogHandsView *)self minuteHandDot];
    [v7 center];
    -[CALayer setPosition:](v6, "setPosition:");

    [v93 pegRadius];
    double v9 = v8;
    [v93 pegStrokeWidth];
    -[CALayer setBounds:](self->_minuteHandTransitionPegLayer, "setBounds:", 0.0, 0.0, v9 + v10 + v9 + v10, v9 + v10 + v9 + v10);
    id v11 = self->_minuteHandTransitionPegLayer;
    v12 = _disabledLayerActions();
    [(CALayer *)v11 setActions:v12];

    double v13 = self->_minuteHandTransitionPegLayer;
    [(CALayer *)v13 bounds];
    [(CALayer *)v13 setCornerRadius:v14 * 0.5];
  }
  if (!self->_minuteHandTransitionBodyLayer)
  {
    id v15 = (CALayer *)objc_opt_new();
    minuteHandTransitionBodyLayer = self->_minuteHandTransitionBodyLayer;
    self->_minuteHandTransitionBodyLayer = v15;

    double v17 = *MEMORY[0x1E4F1DAD8];
    double v18 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    [v93 handWidth];
    double v20 = v19;
    [v93 handLength];
    -[CALayer setBounds:](self->_minuteHandTransitionBodyLayer, "setBounds:", v17, v18, v20, v21);
    id v22 = [(CLKUIAnalogHandsView *)self minuteHandView];
    [v22 bounds];
    double v24 = v23 * 0.5;
    [v93 handLength];
    -[CALayer setPosition:](self->_minuteHandTransitionBodyLayer, "setPosition:", v24, v25 * 0.5);
    double v26 = self->_minuteHandTransitionBodyLayer;
    double v27 = _disabledLayerActions();
    [(CALayer *)v26 setActions:v27];

    [(CALayer *)self->_minuteHandTransitionBodyLayer setCornerRadius:v20 * 0.5];
  }
  if (!self->_minuteHandTransitionStemLayer)
  {
    double v28 = *MEMORY[0x1E4F1DAD8];
    double v29 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    [v93 armWidth];
    double v31 = v30;
    [v93 armLength];
    double v33 = v32;
    v34 = (CALayer *)objc_opt_new();
    minuteHandTransitionStemLayer = self->_minuteHandTransitionStemLayer;
    self->_minuteHandTransitionStemLayer = v34;

    double v36 = [(CLKUIAnalogHandsView *)self minuteHandView];
    [v36 bounds];
    double v38 = v37 * 0.5;
    [v93 handLength];
    double v40 = v39;
    [v93 armLength];
    double v42 = v40 + v41 * 0.5;
    -[CALayer setBounds:](self->_minuteHandTransitionStemLayer, "setBounds:", v28, v29, v31, v33);
    -[CALayer setPosition:](self->_minuteHandTransitionStemLayer, "setPosition:", v38, v42);
    v43 = self->_minuteHandTransitionStemLayer;
    id v44 = _disabledLayerActions();
    [(CALayer *)v43 setActions:v44];
  }
  if (!self->_hourHandTransitionBodyLayer)
  {
    v45 = [(CLKUIAnalogHandsView *)self hourHandView];
    id v46 = (CALayer *)objc_opt_new();
    hourHandTransitionBodyLayer = self->_hourHandTransitionBodyLayer;
    self->_hourHandTransitionBodyLayer = v46;

    double v48 = *MEMORY[0x1E4F1DAD8];
    double v49 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    [v3 handWidth];
    double v51 = v50;
    [v3 handLength];
    -[CALayer setBounds:](self->_hourHandTransitionBodyLayer, "setBounds:", v48, v49, v51, v52);
    [v45 bounds];
    double v54 = v53 * 0.5;
    [v3 handLength];
    -[CALayer setPosition:](self->_hourHandTransitionBodyLayer, "setPosition:", v54, v55 * 0.5);
    id v56 = self->_hourHandTransitionBodyLayer;
    id v57 = _disabledLayerActions();
    [(CALayer *)v56 setActions:v57];

    [(CALayer *)self->_hourHandTransitionBodyLayer setCornerRadius:v51 * 0.5];
  }
  hourHandTransitionStemLayer = self->_hourHandTransitionStemLayer;
  if (!hourHandTransitionStemLayer)
  {
    double v59 = *MEMORY[0x1E4F1DAD8];
    double v60 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    [v3 armWidth];
    double v62 = v61;
    [v3 armLength];
    double v64 = v63;
    CATransform3D v65 = (CALayer *)objc_opt_new();
    CATransform3D v66 = self->_hourHandTransitionStemLayer;
    self->_hourHandTransitionStemLayer = v65;

    CATransform3D v67 = [(CLKUIAnalogHandsView *)self hourHandView];
    -[CALayer setBounds:](self->_hourHandTransitionStemLayer, "setBounds:", v59, v60, v62, v64);
    [v67 bounds];
    double v69 = v68 * 0.5;
    [v67 bounds];
    -[CALayer setPosition:](self->_hourHandTransitionStemLayer, "setPosition:", v69, v70 * 0.5);
    v71 = self->_hourHandTransitionStemLayer;
    v72 = _disabledLayerActions();
    [(CALayer *)v71 setActions:v72];

    hourHandTransitionStemLayer = self->_hourHandTransitionStemLayer;
  }
  v73 = [(CALayer *)hourHandTransitionStemLayer superlayer];

  if (!v73)
  {
    v74 = [(CLKUIAnalogHandsView *)self hourHandView];
    v75 = [v74 transitionContainerView];
    v76 = [v75 layer];
    [v76 addSublayer:self->_hourHandTransitionStemLayer];
  }
  v77 = [(CALayer *)self->_hourHandTransitionBodyLayer superlayer];

  if (!v77)
  {
    v78 = [(CLKUIAnalogHandsView *)self hourHandView];
    v79 = [v78 transitionContainerView];
    v80 = [v79 layer];
    [v80 addSublayer:self->_hourHandTransitionBodyLayer];
  }
  v81 = [(CALayer *)self->_minuteHandTransitionStemLayer superlayer];

  if (!v81)
  {
    v82 = [(CLKUIAnalogHandsView *)self minuteHandView];
    v83 = [v82 transitionContainerView];
    v84 = [v83 layer];
    [v84 addSublayer:self->_minuteHandTransitionStemLayer];
  }
  v85 = [(CALayer *)self->_minuteHandTransitionPegLayer superlayer];

  if (!v85)
  {
    v86 = [(CLKUIAnalogHandsView *)self minuteHandView];
    v87 = [v86 transitionContainerView];
    v88 = [v87 layer];
    [v88 addSublayer:self->_minuteHandTransitionPegLayer];
  }
  v89 = [(CALayer *)self->_minuteHandTransitionBodyLayer superlayer];

  if (!v89)
  {
    v90 = [(CLKUIAnalogHandsView *)self minuteHandView];
    v91 = [v90 transitionContainerView];
    v92 = [v91 layer];
    [v92 addSublayer:self->_minuteHandTransitionBodyLayer];
  }
}

- (int64_t)dataMode
{
  return self->_dataMode;
}

- (void)setDataMode:(int64_t)a3
{
  self->_dataMode = a3;
}

- (NSDate)overrideDate
{
  return self->_overrideDate;
}

- (NTKHandView)hourHandViewAlt
{
  return self->_hourHandViewAlt;
}

- (void)setHourHandViewAlt:(id)a3
{
}

- (NTKHandView)minuteHandViewAlt
{
  return self->_minuteHandViewAlt;
}

- (void)setMinuteHandViewAlt:(id)a3
{
}

- (NTKHandView)secondHandViewAlt
{
  return self->_secondHandViewAlt;
}

- (void)setSecondHandViewAlt:(id)a3
{
}

- (BOOL)shouldShowSecondsHandInAlwaysOn
{
  return self->_shouldShowSecondsHandInAlwaysOn;
}

- (void)setShouldShowSecondsHandInAlwaysOn:(BOOL)a3
{
  self->_shouldShowSecondsHandInAlwaysOn = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondHandViewAlt, 0);
  objc_storeStrong((id *)&self->_minuteHandViewAlt, 0);
  objc_storeStrong((id *)&self->_hourHandViewAlt, 0);
  objc_storeStrong((id *)&self->_overrideDate, 0);
  objc_storeStrong((id *)&self->_hourHandTransitionStemLayer, 0);
  objc_storeStrong((id *)&self->_hourHandTransitionBodyLayer, 0);
  objc_storeStrong((id *)&self->_minuteHandTransitionPegLayer, 0);
  objc_storeStrong((id *)&self->_minuteHandTransitionStemLayer, 0);
  objc_storeStrong((id *)&self->_minuteHandTransitionBodyLayer, 0);
}

@end