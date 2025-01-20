@interface NTKWorldClockRichComplicationHandsBaseView
+ (BOOL)showsSecondHand;
- (CLKMonochromeFilterProvider)filterProvider;
- (UIColor)pegDotColor;
- (double)_timeAnimationFramesPerSecondForDevice:(id)a3;
- (id)createSecondHandView;
- (id)hourHandConfiguration;
- (id)initForDevice:(id)a3;
- (id)minuteHandConfiguration;
- (id)secondHandConfiguration;
- (int64_t)complicationFamily;
- (int64_t)displayedHour;
- (void)layoutHandViews;
- (void)setFilterProvider:(id)a3;
- (void)setPegDotColor:(id)a3;
@end

@implementation NTKWorldClockRichComplicationHandsBaseView

- (id)initForDevice:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)NTKWorldClockRichComplicationHandsBaseView;
  v5 = [(NTKAnalogHandsView *)&v20 initForDevice:v4];
  v6 = v5;
  if (v5)
  {
    v7 = v5 + 77;
    _LayoutConstants_35(v4, [v5 complicationFamily], (uint64_t)&v17);
    *(void *)v7 = v17;
    uint64_t v8 = v18;
    uint64_t v18 = 0;
    v9 = (void *)*((void *)v6 + 78);
    *((void *)v6 + 78) = v8;

    uint64_t v10 = v19;
    uint64_t v19 = 0;
    v11 = (void *)*((void *)v6 + 79);
    *((void *)v6 + 79) = v10;

    [v6 setMinuteHandDotDiameter:*v7];
    v12 = [v6 minuteHandDot];
    v13 = [MEMORY[0x1E4FB1618] colorWithRed:0.898039222 green:0.427450985 blue:0.0 alpha:1.0];
    [v12 setBackgroundColor:v13];

    *((unsigned char *)v6 + 640) = NTKShowGossamerUI(v4);
    v14 = [v6 minuteHandDot];
    [v14 setHidden:*((unsigned __int8 *)v6 + 640)];

    v15 = [v6 secondHandDot];
    [v15 setHidden:*((unsigned __int8 *)v6 + 640)];
  }
  return v6;
}

- (id)hourHandConfiguration
{
  v3 = [(CLKUIAnalogHandsView *)self device];
  _LayoutConstants_35(v3, [(NTKWorldClockRichComplicationHandsBaseView *)self complicationFamily], (uint64_t)v6);
  id v4 = v7;

  return v4;
}

- (id)minuteHandConfiguration
{
  v3 = [(CLKUIAnalogHandsView *)self device];
  _LayoutConstants_35(v3, [(NTKWorldClockRichComplicationHandsBaseView *)self complicationFamily], (uint64_t)v6);
  id v4 = v8;

  return v4;
}

- (id)secondHandConfiguration
{
  v3 = [(CLKUIAnalogHandsView *)self device];
  double v11 = 0.0;
  id v12 = 0;
  id v13 = 0;
  _LayoutConstants_35(v3, [(NTKWorldClockRichComplicationHandsBaseView *)self complicationFamily], (uint64_t)&v11);
  if ([(NTKWorldClockRichComplicationHandsBaseView *)self complicationFamily] == 10)
  {
    id v4 = [(CLKUIAnalogHandsView *)self device];
    id v5 = [off_1E62BDB38 defaultSubdialConfigurationForDevice:v4];

    [v5 setExcludePeg:0];
    [v13 handLength];
    objc_msgSend(v5, "setHandLength:");
  }
  else
  {
    id v5 = objc_alloc_init((Class)off_1E62BDB38);
    [v5 setType:1];
    [v13 handLength];
    double v7 = v6;
    [v13 handWidth];
    double v9 = v8;
    [v5 setTailLength:floor(v7 / 3.0)];
    [v5 setPegRadius:round(v11 / 3.0)];
    [v5 setPegStrokeWidth:ceil(v9 / 5.0)];
    [v5 setExcludePeg:0];
    [v5 setHandLength:v7];
    [v5 setHandWidth:ceil(v9 / 3.0)];
    [v5 setRoundedSecondHand:1];
  }

  return v5;
}

+ (BOOL)showsSecondHand
{
  return 0;
}

- (id)createSecondHandView
{
  if ([(id)objc_opt_class() showsSecondHand])
  {
    v5.receiver = self;
    v5.super_class = (Class)NTKWorldClockRichComplicationHandsBaseView;
    v3 = [(CLKUIAnalogHandsView *)&v5 createSecondHandView];
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (double)_timeAnimationFramesPerSecondForDevice:(id)a3
{
  return 6.0;
}

- (void)layoutHandViews
{
  v10.receiver = self;
  v10.super_class = (Class)NTKWorldClockRichComplicationHandsBaseView;
  [(CLKUIAnalogHandsView *)&v10 layoutHandViews];
  [(NTKWorldClockRichComplicationHandsBaseView *)self bounds];
  double v4 = v3 * 0.5;
  [(NTKWorldClockRichComplicationHandsBaseView *)self bounds];
  double v6 = v5 * 0.5;
  double v7 = [(CLKUIAnalogHandsView *)self hourHandView];
  objc_msgSend(v7, "setCenter:", v4, v6);

  double v8 = [(CLKUIAnalogHandsView *)self minuteHandView];
  objc_msgSend(v8, "setCenter:", v4, v6);

  double v9 = [(CLKUIAnalogHandsView *)self secondHandView];
  objc_msgSend(v9, "setCenter:", v4, v6);
}

- (void)setFilterProvider:(id)a3
{
  p_filterProvider = &self->_filterProvider;
  id v5 = a3;
  objc_storeWeak((id *)p_filterProvider, v5);
  if ([(id)objc_opt_class() showsSecondHand])
  {
    [(CLKUIAnalogHandsView *)self secondHandView];
  }
  else
  {
    double v6 = [(CLKUIAnalogHandsView *)self hourHandView];
    [v6 setFilterProvider:v5];

    [(CLKUIAnalogHandsView *)self minuteHandView];
  }
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [v7 setFilterProvider:v5];
}

- (int64_t)displayedHour
{
  double v3 = [(NTKAnalogHandsView *)self overrideDate];
  double v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(NTKAnalogHandsView *)self displayTime];
  }
  double v6 = v5;

  id v7 = [(CLKUIAnalogHandsView *)self calendar];
  int64_t v8 = [v7 component:32 fromDate:v6];

  return v8;
}

- (UIColor)pegDotColor
{
  v2 = [(CLKUIAnalogHandsView *)self minuteHandDot];
  double v3 = [v2 backgroundColor];

  return (UIColor *)v3;
}

- (void)setPegDotColor:(id)a3
{
  id v4 = a3;
  id v5 = [(CLKUIAnalogHandsView *)self minuteHandDot];
  [v5 setBackgroundColor:v4];
}

- (CLKMonochromeFilterProvider)filterProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_filterProvider);
  return (CLKMonochromeFilterProvider *)WeakRetained;
}

- (void).cxx_destruct
{
  v2 = self;
  objc_destroyWeak((id *)&self->_filterProvider);
  v2 = (NTKWorldClockRichComplicationHandsBaseView *)((char *)v2 + 616);

  layeringSceneIdentity = v2->super.super.super.super.__layeringSceneIdentity;
}

- (int64_t)complicationFamily
{
  return 10;
}

@end