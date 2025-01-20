@interface NTKRichComplicationBaseCircularSwiftUIView
- (NTKRichComplicationBaseCircularSwiftUIView)initWithFamily:(int64_t)a3;
- (void)_handleTemplate:(id)a3 reason:(int64_t)a4;
- (void)layoutSubviews;
- (void)setPaused:(BOOL)a3;
- (void)transitionToMonochromeWithFraction:(double)a3;
- (void)updateMonochromeColor;
@end

@implementation NTKRichComplicationBaseCircularSwiftUIView

- (NTKRichComplicationBaseCircularSwiftUIView)initWithFamily:(int64_t)a3
{
  v14.receiver = self;
  v14.super_class = (Class)NTKRichComplicationBaseCircularSwiftUIView;
  v3 = [(NTKRichComplicationCircularBaseView *)&v14 initWithFamily:a3];
  if (v3)
  {
    uint64_t v4 = [off_1E62BD5E8 async];
    swiftUIView = v3->_swiftUIView;
    v3->_swiftUIView = (CDComplicationHostingView *)v4;

    [(CDComplicationHostingView *)v3->_swiftUIView setFilterProvider:v3];
    objc_initWeak(&location, v3);
    uint64_t v8 = MEMORY[0x1E4F143A8];
    uint64_t v9 = 3221225472;
    v10 = __61__NTKRichComplicationBaseCircularSwiftUIView_initWithFamily___block_invoke;
    v11 = &unk_1E62C20F8;
    objc_copyWeak(&v12, &location);
    [(CDComplicationHostingView *)v3->_swiftUIView setRenderStatsHandler:&v8];
    v6 = [(NTKRichComplicationCircularBaseView *)v3 contentView];
    [v6 addSubview:v3->_swiftUIView];

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  return v3;
}

void __61__NTKRichComplicationBaseCircularSwiftUIView_initWithFamily___block_invoke(uint64_t a1, double a2, double a3)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = [WeakRetained displayObserver];
  [v5 complicationDisplay:WeakRetained renderStatsWithTime:a2 cost:a3];
}

- (void)layoutSubviews
{
  v14.receiver = self;
  v14.super_class = (Class)NTKRichComplicationBaseCircularSwiftUIView;
  [(NTKRichComplicationCircularBaseView *)&v14 layoutSubviews];
  v3 = [(NTKRichComplicationCircularBaseView *)self contentView];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  -[CDComplicationHostingView setFrame:](self->_swiftUIView, "setFrame:", v5, v7, v9, v11);
  v15.origin.x = v5;
  v15.origin.y = v7;
  v15.size.width = v9;
  v15.size.height = v11;
  CGFloat v12 = CGRectGetWidth(v15) * 0.5;
  v13 = [(CDComplicationHostingView *)self->_swiftUIView layer];
  [v13 setCornerRadius:v12];
}

- (void)setPaused:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)NTKRichComplicationBaseCircularSwiftUIView;
  -[CDRichComplicationView setPaused:](&v5, sel_setPaused_);
  [(CDComplicationHostingView *)self->_swiftUIView setPaused:v3];
}

- (void)_handleTemplate:(id)a3 reason:(int64_t)a4
{
  id v5 = [a3 contentData];
  [(CDComplicationHostingView *)self->_swiftUIView setViewData:v5];
}

- (void)transitionToMonochromeWithFraction:(double)a3
{
}

- (void)updateMonochromeColor
{
}

- (void).cxx_destruct
{
}

@end