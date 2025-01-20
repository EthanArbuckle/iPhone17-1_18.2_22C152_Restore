@interface NTKRichComplicationBaseCircularStackSwiftUIView
- (id)line1View;
- (id)line2TextProviderFromTemplate:(id)a3;
- (void)_handleTemplate:(id)a3 reason:(int64_t)a4;
- (void)setPaused:(BOOL)a3;
- (void)transitionToMonochromeWithFraction:(double)a3;
- (void)updateMonochromeColor;
@end

@implementation NTKRichComplicationBaseCircularStackSwiftUIView

- (id)line1View
{
  line1SwiftUIView = self->_line1SwiftUIView;
  if (!line1SwiftUIView)
  {
    v4 = [off_1E62BD5E8 async];
    v5 = self->_line1SwiftUIView;
    self->_line1SwiftUIView = v4;

    [(CDComplicationHostingView *)self->_line1SwiftUIView setFilterProvider:self];
    objc_initWeak(&location, self);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __60__NTKRichComplicationBaseCircularStackSwiftUIView_line1View__block_invoke;
    v7[3] = &unk_1E62C20F8;
    objc_copyWeak(&v8, &location);
    [(CDComplicationHostingView *)self->_line1SwiftUIView setRenderStatsHandler:v7];
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
    line1SwiftUIView = self->_line1SwiftUIView;
  }
  return line1SwiftUIView;
}

void __60__NTKRichComplicationBaseCircularStackSwiftUIView_line1View__block_invoke(uint64_t a1, double a2, double a3)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = [WeakRetained displayObserver];
  [v5 complicationDisplay:WeakRetained renderStatsWithTime:a2 cost:a3];
}

- (id)line2TextProviderFromTemplate:(id)a3
{
  return (id)[a3 textProvider];
}

- (void)setPaused:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)NTKRichComplicationBaseCircularStackSwiftUIView;
  -[CDRichComplicationView setPaused:](&v5, sel_setPaused_);
  [(CDComplicationHostingView *)self->_line1SwiftUIView setPaused:v3];
}

- (void)_handleTemplate:(id)a3 reason:(int64_t)a4
{
  v8.receiver = self;
  v8.super_class = (Class)NTKRichComplicationBaseCircularStackSwiftUIView;
  id v6 = a3;
  [(NTKRichComplicationCircularStackContentTextView *)&v8 _handleTemplate:v6 reason:a4];
  v7 = objc_msgSend(v6, "contentData", v8.receiver, v8.super_class);

  [(CDComplicationHostingView *)self->_line1SwiftUIView setViewData:v7];
}

- (void)transitionToMonochromeWithFraction:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NTKRichComplicationBaseCircularStackSwiftUIView;
  -[NTKRichComplicationCircularStackContentTextView transitionToMonochromeWithFraction:](&v5, sel_transitionToMonochromeWithFraction_);
  [(CDComplicationHostingView *)self->_line1SwiftUIView transitionToMonochromeWithFraction:a3];
}

- (void)updateMonochromeColor
{
  v3.receiver = self;
  v3.super_class = (Class)NTKRichComplicationBaseCircularStackSwiftUIView;
  [(NTKRichComplicationCircularStackContentTextView *)&v3 updateMonochromeColor];
  [(CDComplicationHostingView *)self->_line1SwiftUIView updateMonochromeColor];
}

- (void).cxx_destruct
{
}

@end