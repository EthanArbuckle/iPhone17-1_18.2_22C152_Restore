@interface PXHUDVisualizationView
- (PXHUDVisualizationView)initWithFrame:(CGRect)a3;
- (void)_updateTitleLabel;
@end

@implementation PXHUDVisualizationView

- (void).cxx_destruct
{
}

- (void)_updateTitleLabel
{
  v3 = [(PXHUDAbstractVisualizationView *)self visualization];
  v4 = [v3 title];
  [(UILabel *)self->_titleLabel setText:v4];

  id v6 = [(PXHUDAbstractVisualizationView *)self visualization];
  v5 = [v6 color];
  [(UILabel *)self->_titleLabel setTextColor:v5];
}

- (PXHUDVisualizationView)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PXHUDVisualizationView;
  v3 = -[PXHUDVisualizationView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = v4;

    [(UILabel *)v3->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    id v6 = [MEMORY[0x1E4FB08E0] monospacedSystemFontOfSize:12.0 weight:*MEMORY[0x1E4FB09D0]];
    [(UILabel *)v3->_titleLabel setFont:v6];

    [(PXHUDVisualizationView *)v3 addSubview:v3->_titleLabel];
    PXHUDCenterViewInSuperview(v3->_titleLabel);
  }
  return v3;
}

@end