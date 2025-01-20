@interface NTKRichComplicationRectangularLargeHeadlineBaseView
+ (BOOL)supportsComplicationFamily:(int64_t)a3;
- (NTKRichComplicationRectangularLargeHeadlineBaseView)init;
- (int64_t)tritiumUpdateMode;
- (void)_editingDidEnd;
- (void)_enumerateLabelsWithBlock:(id)a3;
- (void)_updateTemplateHeaderWithTextProvider:(id)a3 imageProvider:(id)a4 viewData:(id)a5 reason:(int64_t)a6;
- (void)layoutSubviews;
- (void)setPaused:(BOOL)a3;
- (void)transitionToMonochromeWithFraction:(double)a3;
- (void)updateMonochromeColor;
@end

@implementation NTKRichComplicationRectangularLargeHeadlineBaseView

- (NTKRichComplicationRectangularLargeHeadlineBaseView)init
{
  v21.receiver = self;
  v21.super_class = (Class)NTKRichComplicationRectangularLargeHeadlineBaseView;
  v2 = [(NTKRichComplicationRectangularBaseView *)&v21 init];
  if (v2)
  {
    id v3 = objc_alloc((Class)off_1E62BD628);
    v4 = [(CDRichComplicationView *)v2 device];
    uint64_t v5 = [v3 initWithDevice:v4 useAccentColor:1];
    headerImageView = v2->_headerImageView;
    v2->_headerImageView = (CDRichComplicationImageView *)v5;

    [(CDRichComplicationImageView *)v2->_headerImageView setPaused:[(CDRichComplicationView *)v2 paused]];
    [(CDRichComplicationImageView *)v2->_headerImageView setFilterProvider:v2];
    uint64_t v7 = [off_1E62BD5E8 async];
    headerSwiftUIView = v2->_headerSwiftUIView;
    v2->_headerSwiftUIView = (CDComplicationHostingView *)v7;

    [(CDComplicationHostingView *)v2->_headerSwiftUIView setFilterProvider:v2];
    [(CDComplicationHostingView *)v2->_headerSwiftUIView setShouldAccentDesaturatedView:1];
    objc_initWeak(&location, v2);
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    v17 = __59__NTKRichComplicationRectangularLargeHeadlineBaseView_init__block_invoke;
    v18 = &unk_1E62C20F8;
    objc_copyWeak(&v19, &location);
    [(CDComplicationHostingView *)v2->_headerSwiftUIView setRenderStatsHandler:&v15];
    v9 = [(CDRichComplicationView *)v2 device];
    _LayoutConstants_29(v9);
    double v11 = v10;

    uint64_t v12 = [(NTKRichComplicationRectangularBaseView *)v2 _createAndAddColoringLabelWithFontSize:1 weight:v11 usesTextProviderTintColoring:*MEMORY[0x1E4FB09E0]];
    headerLabel = v2->_headerLabel;
    v2->_headerLabel = (CLKUIColoringLabel *)v12;

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __59__NTKRichComplicationRectangularLargeHeadlineBaseView_init__block_invoke(uint64_t a1, double a2, double a3)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v5 = [WeakRetained displayObserver];
  [v5 complicationDisplay:WeakRetained renderStatsWithTime:a2 cost:a3];
}

- (void)layoutSubviews
{
  v59.receiver = self;
  v59.super_class = (Class)NTKRichComplicationRectangularLargeHeadlineBaseView;
  [(NTKRichComplicationRectangularLargeHeadlineBaseView *)&v59 layoutSubviews];
  id v3 = [(CDRichComplicationView *)self device];
  double v4 = _LayoutConstants_29(v3);
  double v6 = v5;
  double v58 = v7;

  char IsRTL = CLKLayoutIsRTL();
  [(NTKRichComplicationRectangularLargeHeadlineBaseView *)self bounds];
  CGFloat v55 = v9;
  CGFloat v56 = v10;
  CGFloat v12 = v11;
  CGFloat rect = v13;
  [(NTKRichComplicationRectangularBaseView *)self contentMargin];
  double v15 = v14;
  uint64_t v16 = [(CLKUIColoringLabel *)self->_headerLabel font];
  [v16 ascender];
  double v18 = v4 - v17;

  [(CLKUIColoringLabel *)self->_headerLabel sizeToFit];
  [(CLKUIColoringLabel *)self->_headerLabel frame];
  CGFloat v20 = v19;
  CGFloat v22 = v21;
  v23 = [(CLKUIColoringLabel *)self->_headerLabel font];
  [v23 lineHeight];
  CGFloat v25 = v24;

  v60.origin.x = v20;
  v60.origin.y = v18;
  v60.size.width = v22;
  v60.size.height = v25;
  double MinY = CGRectGetMinY(v60);
  v61.origin.x = v20;
  v61.origin.y = v18;
  v61.size.width = v22;
  v61.size.height = v25;
  double v27 = MinY + (CGRectGetHeight(v61) - v6) * 0.5;
  v28 = [(CDRichComplicationImageView *)self->_headerImageView superview];
  if (v28)
  {
  }
  else
  {
    v29 = [(CDComplicationHostingView *)self->_headerSwiftUIView superview];

    if (!v29) {
      goto LABEL_8;
    }
  }
  if (IsRTL)
  {
    v62.origin.x = v55;
    v62.origin.y = v56;
    v62.size.width = v12;
    v62.size.height = rect;
    CGFloat v30 = CGRectGetWidth(v62) - v15;
    v63.origin.x = 0.0;
    v63.origin.y = v27;
    v63.size.width = v6;
    v63.size.height = v6;
    double v31 = v30 - CGRectGetWidth(v63);
    double v32 = v27;
    double v33 = v6;
    double v34 = v6;
  }
  else
  {
    v64.origin.x = v15;
    v64.origin.y = v27;
    v64.size.width = v6;
    v64.size.height = v6;
    CGFloat MaxX = CGRectGetMaxX(v64);
    v65.size.height = rect;
    double v36 = v58 + MaxX;
    v65.origin.x = v55;
    v65.origin.y = v56;
    v65.size.width = v12;
    CGRectGetWidth(v65);
    double v31 = v36;
    double v32 = v18;
    double v33 = v22;
    double v34 = v25;
  }
  CGRectGetMinX(*(CGRect *)&v31);
LABEL_8:
  v37 = [(CDRichComplicationView *)self device];
  CLKPixelAlignRectForDevice();
  double v39 = v38;
  double v41 = v40;
  double v43 = v42;
  double v45 = v44;

  -[CLKUIColoringLabel setFrame:](self->_headerLabel, "setFrame:", v39, v41, v43, v45);
  v66.origin.x = v39;
  v66.origin.y = v41;
  v66.size.width = v43;
  v66.size.height = v45;
  [(CLKUIColoringLabel *)self->_headerLabel setMaxWidth:CGRectGetWidth(v66)];
  v46 = [(CDRichComplicationView *)self device];
  CLKPixelAlignRectForDevice();
  double v48 = v47;
  double v50 = v49;
  double v52 = v51;
  double v54 = v53;

  -[CDRichComplicationImageView setFrame:](self->_headerImageView, "setFrame:", v48, v50, v52, v54);
  -[CDComplicationHostingView setFrame:](self->_headerSwiftUIView, "setFrame:", v48, v50, v52, v54);
}

+ (BOOL)supportsComplicationFamily:(int64_t)a3
{
  return a3 == 11;
}

- (void)_updateTemplateHeaderWithTextProvider:(id)a3 imageProvider:(id)a4 viewData:(id)a5 reason:(int64_t)a6
{
  id v10 = a4;
  id v11 = a5;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __123__NTKRichComplicationRectangularLargeHeadlineBaseView__updateTemplateHeaderWithTextProvider_imageProvider_viewData_reason___block_invoke;
  aBlock[3] = &unk_1E62BFF20;
  aBlock[4] = self;
  id v12 = a3;
  double v13 = (void (**)(void))_Block_copy(aBlock);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __123__NTKRichComplicationRectangularLargeHeadlineBaseView__updateTemplateHeaderWithTextProvider_imageProvider_viewData_reason___block_invoke_2;
  v17[3] = &unk_1E62C2950;
  v17[4] = self;
  v17[5] = a6;
  double v14 = (void (**)(void))_Block_copy(v17);
  double v15 = v14;
  if (v11)
  {
    [(CDComplicationHostingView *)self->_headerSwiftUIView setViewData:v11];
    [(NTKRichComplicationRectangularLargeHeadlineBaseView *)self addSubview:self->_headerSwiftUIView];
    uint64_t v16 = v15;
  }
  else
  {
    if (v10)
    {
      [(CDRichComplicationImageView *)self->_headerImageView setImageProvider:v10 reason:a6];
      [(NTKRichComplicationRectangularLargeHeadlineBaseView *)self addSubview:self->_headerImageView];
    }
    else
    {
      ((void (*)(void (**)(void)))v14[2])(v14);
    }
    uint64_t v16 = v13;
  }
  v16[2]();
  [(CLKUIColoringLabel *)self->_headerLabel setTextProvider:v12];
}

uint64_t __123__NTKRichComplicationRectangularLargeHeadlineBaseView__updateTemplateHeaderWithTextProvider_imageProvider_viewData_reason___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 536) setViewData:0];
  v2 = *(void **)(*(void *)(a1 + 32) + 536);

  return [v2 removeFromSuperview];
}

uint64_t __123__NTKRichComplicationRectangularLargeHeadlineBaseView__updateTemplateHeaderWithTextProvider_imageProvider_viewData_reason___block_invoke_2(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 528) setImageProvider:0 reason:*(void *)(a1 + 40)];
  v2 = *(void **)(*(void *)(a1 + 32) + 528);

  return [v2 removeFromSuperview];
}

- (void)setPaused:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)NTKRichComplicationRectangularLargeHeadlineBaseView;
  -[CDRichComplicationView setPaused:](&v5, sel_setPaused_);
  [(CDRichComplicationImageView *)self->_headerImageView setPaused:v3];
  [(CDComplicationHostingView *)self->_headerSwiftUIView setPaused:v3];
}

- (int64_t)tritiumUpdateMode
{
  BOOL v3 = [(CDRichComplicationImageView *)self->_headerImageView tritiumUpdateMode];
  double v4 = v3;
  if (v3)
  {
    unint64_t v5 = [v3 integerValue];
    if (v5 >= 2) {
      int64_t v6 = 2;
    }
    else {
      int64_t v6 = v5;
    }
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)NTKRichComplicationRectangularLargeHeadlineBaseView;
    int64_t v6 = [(CDRichComplicationTemplateView *)&v8 tritiumUpdateMode];
  }

  return v6;
}

- (void)_enumerateLabelsWithBlock:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NTKRichComplicationRectangularLargeHeadlineBaseView;
  double v4 = (void (**)(id, CLKUIColoringLabel *))a3;
  [(CDRichComplicationView *)&v5 _enumerateLabelsWithBlock:v4];
  v4[2](v4, self->_headerLabel);
}

- (void)_editingDidEnd
{
}

- (void)transitionToMonochromeWithFraction:(double)a3
{
  -[CLKUIColoringLabel transitionToMonochromeWithFraction:style:](self->_headerLabel, "transitionToMonochromeWithFraction:style:", 2);
  [(CDRichComplicationImageView *)self->_headerImageView transitionToMonochromeWithFraction:a3];
  headerSwiftUIView = self->_headerSwiftUIView;

  [(CDComplicationHostingView *)headerSwiftUIView transitionToMonochromeWithFraction:a3];
}

- (void)updateMonochromeColor
{
  [(CLKUIColoringLabel *)self->_headerLabel updateMonochromeColorWithStyle:2];
  [(CDRichComplicationImageView *)self->_headerImageView updateMonochromeColor];
  headerSwiftUIView = self->_headerSwiftUIView;

  [(CDComplicationHostingView *)headerSwiftUIView updateMonochromeColor];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerLabel, 0);
  objc_storeStrong((id *)&self->_headerSwiftUIView, 0);

  objc_storeStrong((id *)&self->_headerImageView, 0);
}

@end