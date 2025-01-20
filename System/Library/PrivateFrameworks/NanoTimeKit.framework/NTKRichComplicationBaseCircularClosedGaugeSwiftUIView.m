@interface NTKRichComplicationBaseCircularClosedGaugeSwiftUIView
- (id)gaugeProviderFromTemplate:(id)a3;
- (id)innerView;
- (void)_handleTemplate:(id)a3 reason:(int64_t)a4;
- (void)setPaused:(BOOL)a3;
- (void)transitionToMonochromeWithFraction:(double)a3;
- (void)updateMonochromeColor;
@end

@implementation NTKRichComplicationBaseCircularClosedGaugeSwiftUIView

- (id)innerView
{
  swiftUIView = self->_swiftUIView;
  if (!swiftUIView)
  {
    v4 = [off_1E62BD5E8 async];
    v5 = self->_swiftUIView;
    self->_swiftUIView = v4;

    [(CDComplicationHostingView *)self->_swiftUIView setFilterProvider:self];
    v6 = [(CDRichComplicationView *)self device];
    int v7 = NTKShowGossamerUI(v6);

    [(CDComplicationHostingView *)self->_swiftUIView setShouldAccentDesaturatedView:v7 ^ 1u];
    objc_initWeak(&location, self);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __66__NTKRichComplicationBaseCircularClosedGaugeSwiftUIView_innerView__block_invoke;
    v9[3] = &unk_1E62C20F8;
    objc_copyWeak(&v10, &location);
    [(CDComplicationHostingView *)self->_swiftUIView setRenderStatsHandler:v9];
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
    swiftUIView = self->_swiftUIView;
  }
  return swiftUIView;
}

void __66__NTKRichComplicationBaseCircularClosedGaugeSwiftUIView_innerView__block_invoke(uint64_t a1, double a2, double a3)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = [WeakRetained displayObserver];
  [v5 complicationDisplay:WeakRetained renderStatsWithTime:a2 cost:a3];
}

- (id)gaugeProviderFromTemplate:(id)a3
{
  return (id)[a3 gaugeProvider];
}

- (void)setPaused:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)NTKRichComplicationBaseCircularClosedGaugeSwiftUIView;
  -[CDRichComplicationView setPaused:](&v5, sel_setPaused_);
  [(CDComplicationHostingView *)self->_swiftUIView setPaused:v3];
}

- (void)_handleTemplate:(id)a3 reason:(int64_t)a4
{
  v8.receiver = self;
  v8.super_class = (Class)NTKRichComplicationBaseCircularClosedGaugeSwiftUIView;
  id v6 = a3;
  [(NTKRichComplicationCircularClosedGaugeContentView *)&v8 _handleTemplate:v6 reason:a4];
  int v7 = objc_msgSend(v6, "labelData", v8.receiver, v8.super_class);

  [(CDComplicationHostingView *)self->_swiftUIView setViewData:v7];
}

- (void)transitionToMonochromeWithFraction:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NTKRichComplicationBaseCircularClosedGaugeSwiftUIView;
  -[NTKRichComplicationCircularClosedGaugeContentView transitionToMonochromeWithFraction:](&v5, sel_transitionToMonochromeWithFraction_);
  [(CDComplicationHostingView *)self->_swiftUIView transitionToMonochromeWithFraction:a3];
}

- (void)updateMonochromeColor
{
  v3.receiver = self;
  v3.super_class = (Class)NTKRichComplicationBaseCircularClosedGaugeSwiftUIView;
  [(NTKRichComplicationCircularClosedGaugeContentView *)&v3 updateMonochromeColor];
  [(CDComplicationHostingView *)self->_swiftUIView updateMonochromeColor];
}

- (void).cxx_destruct
{
}

@end