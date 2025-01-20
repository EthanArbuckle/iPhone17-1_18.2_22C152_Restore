@interface NTKRichComplicationRectangularFullSwiftUIView
+ (BOOL)handlesComplicationTemplate:(id)a3;
- (id)content;
- (void)_handleTemplate:(id)a3 reason:(int64_t)a4;
- (void)setPaused:(BOOL)a3;
- (void)transitionToMonochromeWithFraction:(double)a3;
- (void)updateMonochromeColor;
@end

@implementation NTKRichComplicationRectangularFullSwiftUIView

- (id)content
{
  swiftUIView = self->_swiftUIView;
  if (!swiftUIView)
  {
    v4 = [off_1E62BD5E8 async];
    v5 = self->_swiftUIView;
    self->_swiftUIView = v4;

    [(CDComplicationHostingView *)self->_swiftUIView setFilterProvider:self];
    objc_initWeak(&location, self);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __56__NTKRichComplicationRectangularFullSwiftUIView_content__block_invoke;
    v7[3] = &unk_1E62C20F8;
    objc_copyWeak(&v8, &location);
    [(CDComplicationHostingView *)self->_swiftUIView setRenderStatsHandler:v7];
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
    swiftUIView = self->_swiftUIView;
  }

  return swiftUIView;
}

void __56__NTKRichComplicationRectangularFullSwiftUIView_content__block_invoke(uint64_t a1, double a2, double a3)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = [WeakRetained displayObserver];
  [v5 complicationDisplay:WeakRetained renderStatsWithTime:a2 cost:a3];
}

- (void)setPaused:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)NTKRichComplicationRectangularFullSwiftUIView;
  -[CDRichComplicationView setPaused:](&v5, sel_setPaused_);
  [(CDComplicationHostingView *)self->_swiftUIView setPaused:v3];
}

+ (BOOL)handlesComplicationTemplate:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)_handleTemplate:(id)a3 reason:(int64_t)a4
{
  id v5 = [a3 contentData];
  [(CDComplicationHostingView *)self->_swiftUIView setViewData:v5];
}

- (void)transitionToMonochromeWithFraction:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NTKRichComplicationRectangularFullSwiftUIView;
  -[CDRichComplicationView transitionToMonochromeWithFraction:](&v5, sel_transitionToMonochromeWithFraction_);
  if (([(CDComplicationHostingView *)self->_swiftUIView isHidden] & 1) == 0) {
    [(CDComplicationHostingView *)self->_swiftUIView transitionToMonochromeWithFraction:a3];
  }
}

- (void)updateMonochromeColor
{
  v3.receiver = self;
  v3.super_class = (Class)NTKRichComplicationRectangularFullSwiftUIView;
  [(CDRichComplicationView *)&v3 updateMonochromeColor];
  if (([(CDComplicationHostingView *)self->_swiftUIView isHidden] & 1) == 0) {
    [(CDComplicationHostingView *)self->_swiftUIView updateMonochromeColor];
  }
}

- (void).cxx_destruct
{
}

@end