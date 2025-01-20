@interface NTKGreenfieldPlaceholderView
- (BOOL)_shouldAnimateWithTemplateUpdateReason:(int64_t)a3;
- (BOOL)usesLegibility;
- (CLKImageProvider)imageProvider;
- (CLKMonochromeFilterProvider)filterProvider;
- (NTKGreenfieldPlaceholderView)initWithFrame:(CGRect)a3;
- (UIColor)color;
- (UIColor)overrideColor;
- (id)initFullColorImageViewWithDevice:(id)a3;
- (void)configureWithImageProvider:(id)a3 reason:(int64_t)a4;
- (void)layoutSubviews;
- (void)setAppIcon:(id)a3;
- (void)setColor:(id)a3;
- (void)setFilterProvider:(id)a3;
- (void)setImageProvider:(id)a3;
- (void)setOverrideColor:(id)a3;
- (void)setProgress:(double)a3 animated:(BOOL)a4;
- (void)setUsesLegibility:(BOOL)a3;
@end

@implementation NTKGreenfieldPlaceholderView

- (NTKGreenfieldPlaceholderView)initWithFrame:(CGRect)a3
{
  v9.receiver = self;
  v9.super_class = (Class)NTKGreenfieldPlaceholderView;
  v3 = -[NTKGreenfieldPlaceholderView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
    iconView = v3->_iconView;
    v3->_iconView = v4;

    [(UIImageView *)v3->_iconView setContentMode:1];
    [(NTKGreenfieldPlaceholderView *)v3 addSubview:v3->_iconView];
    v6 = objc_alloc_init(_NTKPieChartView);
    uncompletedPieChartView = v3->_uncompletedPieChartView;
    v3->_uncompletedPieChartView = v6;

    [(NTKGreenfieldPlaceholderView *)v3 addSubview:v3->_uncompletedPieChartView];
  }
  return v3;
}

- (void)layoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)NTKGreenfieldPlaceholderView;
  [(NTKGreenfieldPlaceholderView *)&v13 layoutSubviews];
  [(NTKGreenfieldPlaceholderView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(NTKGreenfieldPlaceholderView *)self bounds];
  double v12 = v11 * 0.75;
  -[UIImageView setFrame:](self->_iconView, "setFrame:", v4, v6, v8, v10);
  -[_NTKPieChartView setFrame:](self->_uncompletedPieChartView, "setFrame:", v8 * 0.25 * 0.5, v8 * 0.25 * 0.5, v12, v12);
}

- (void)setProgress:(double)a3 animated:(BOOL)a4
{
}

- (void)setAppIcon:(id)a3
{
}

- (BOOL)_shouldAnimateWithTemplateUpdateReason:(int64_t)a3
{
  return a3 == 1;
}

- (void)setImageProvider:(id)a3
{
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v6;
    [v4 progress];
    -[NTKGreenfieldPlaceholderView setProgress:animated:](self, "setProgress:animated:", 1);
    double v5 = [v4 appIcon];

    [(NTKGreenfieldPlaceholderView *)self setAppIcon:v5];
  }
}

- (id)initFullColorImageViewWithDevice:(id)a3
{
  return -[NTKGreenfieldPlaceholderView initWithFrame:](self, "initWithFrame:", a3, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
}

- (void)configureWithImageProvider:(id)a3 reason:(int64_t)a4
{
  id v10 = [a3 metadata];
  id v6 = [v10 objectForKeyedSubscript:@"NTKGreenfieldPlaceholderTimelineEntryModelProgressKey"];
  BOOL v7 = [(NTKGreenfieldPlaceholderView *)self _shouldAnimateWithTemplateUpdateReason:a4];
  [v6 floatValue];
  [(NTKGreenfieldPlaceholderView *)self setProgress:v7 animated:v8];
  double v9 = [v10 objectForKeyedSubscript:@"NTKGreenfieldPlaceholderTimelineEntryModelIconKey"];
  if (v9) {
    [(NTKGreenfieldPlaceholderView *)self setAppIcon:v9];
  }
}

- (CLKMonochromeFilterProvider)filterProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_filterProvider);
  return (CLKMonochromeFilterProvider *)WeakRetained;
}

- (void)setFilterProvider:(id)a3
{
}

- (CLKImageProvider)imageProvider
{
  return self->_imageProvider;
}

- (UIColor)color
{
  return self->_color;
}

- (void)setColor:(id)a3
{
}

- (UIColor)overrideColor
{
  return self->_overrideColor;
}

- (void)setOverrideColor:(id)a3
{
}

- (BOOL)usesLegibility
{
  return self->_usesLegibility;
}

- (void)setUsesLegibility:(BOOL)a3
{
  self->_usesLegibility = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideColor, 0);
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_imageProvider, 0);
  objc_destroyWeak((id *)&self->_filterProvider);
  objc_storeStrong((id *)&self->_uncompletedPieChartView, 0);
  objc_storeStrong((id *)&self->_iconView, 0);
}

@end