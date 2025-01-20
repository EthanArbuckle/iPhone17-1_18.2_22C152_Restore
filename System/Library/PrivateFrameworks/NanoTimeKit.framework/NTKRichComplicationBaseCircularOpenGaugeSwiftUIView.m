@interface NTKRichComplicationBaseCircularOpenGaugeSwiftUIView
- (id)bottomView;
- (void)_handleTemplate:(id)a3 reason:(int64_t)a4;
- (void)gaugeProvider:(id *)a3 andCenterTextProvider:(id *)a4 fromTemplate:(id)a5;
- (void)setPaused:(BOOL)a3;
- (void)transitionToMonochromeWithFraction:(double)a3;
- (void)updateMonochromeColor;
@end

@implementation NTKRichComplicationBaseCircularOpenGaugeSwiftUIView

- (id)bottomView
{
  bottomSwiftUIView = self->_bottomSwiftUIView;
  if (!bottomSwiftUIView)
  {
    v4 = [off_1E62BD5E8 async];
    v5 = self->_bottomSwiftUIView;
    self->_bottomSwiftUIView = v4;

    [(CDComplicationHostingView *)self->_bottomSwiftUIView setFilterProvider:self];
    v6 = [(CDRichComplicationView *)self device];
    int v7 = NTKShowGossamerUI(v6);

    [(CDComplicationHostingView *)self->_bottomSwiftUIView setShouldAccentDesaturatedView:v7 ^ 1u];
    objc_initWeak(&location, self);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __65__NTKRichComplicationBaseCircularOpenGaugeSwiftUIView_bottomView__block_invoke;
    v9[3] = &unk_1E62C20F8;
    objc_copyWeak(&v10, &location);
    [(CDComplicationHostingView *)self->_bottomSwiftUIView setRenderStatsHandler:v9];
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
    bottomSwiftUIView = self->_bottomSwiftUIView;
  }

  return bottomSwiftUIView;
}

void __65__NTKRichComplicationBaseCircularOpenGaugeSwiftUIView_bottomView__block_invoke(uint64_t a1, double a2, double a3)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = [WeakRetained displayObserver];
  [v5 complicationDisplay:WeakRetained renderStatsWithTime:a2 cost:a3];
}

- (void)gaugeProvider:(id *)a3 andCenterTextProvider:(id *)a4 fromTemplate:(id)a5
{
  id v7 = a5;
  *a3 = [v7 gaugeProvider];
  v8 = [v7 centerTextProvider];

  *a4 = v8;
}

- (void)setPaused:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)NTKRichComplicationBaseCircularOpenGaugeSwiftUIView;
  -[CDRichComplicationView setPaused:](&v5, sel_setPaused_);
  [(CDComplicationHostingView *)self->_bottomSwiftUIView setPaused:v3];
}

- (void)_handleTemplate:(id)a3 reason:(int64_t)a4
{
  v8.receiver = self;
  v8.super_class = (Class)NTKRichComplicationBaseCircularOpenGaugeSwiftUIView;
  id v6 = a3;
  [(NTKRichComplicationCircularOpenGaugeContentView *)&v8 _handleTemplate:v6 reason:a4];
  id v7 = objc_msgSend(v6, "bottomLabelData", v8.receiver, v8.super_class);

  [(CDComplicationHostingView *)self->_bottomSwiftUIView setViewData:v7];
}

- (void)transitionToMonochromeWithFraction:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NTKRichComplicationBaseCircularOpenGaugeSwiftUIView;
  -[NTKRichComplicationCircularOpenGaugeContentView transitionToMonochromeWithFraction:](&v5, sel_transitionToMonochromeWithFraction_);
  [(CDComplicationHostingView *)self->_bottomSwiftUIView transitionToMonochromeWithFraction:a3];
}

- (void)updateMonochromeColor
{
  v3.receiver = self;
  v3.super_class = (Class)NTKRichComplicationBaseCircularOpenGaugeSwiftUIView;
  [(NTKRichComplicationCircularOpenGaugeContentView *)&v3 updateMonochromeColor];
  [(CDComplicationHostingView *)self->_bottomSwiftUIView updateMonochromeColor];
}

- (void).cxx_destruct
{
}

@end