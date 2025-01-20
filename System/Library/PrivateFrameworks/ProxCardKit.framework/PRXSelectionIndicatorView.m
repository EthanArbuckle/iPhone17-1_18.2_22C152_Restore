@interface PRXSelectionIndicatorView
- (BOOL)isSelected;
- (CGSize)intrinsicContentSize;
- (PRXSelectionIndicatorView)initWithFrame:(CGRect)a3;
- (void)setSelected:(BOOL)a3;
@end

@implementation PRXSelectionIndicatorView

- (PRXSelectionIndicatorView)initWithFrame:(CGRect)a3
{
  v36[4] = *MEMORY[0x263EF8340];
  v35.receiver = self;
  v35.super_class = (Class)PRXSelectionIndicatorView;
  v3 = -[PRXSelectionIndicatorView initWithFrame:](&v35, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x263F1C6C8] configurationWithScale:3];
    id v5 = objc_alloc(MEMORY[0x263F1C6D0]);
    v6 = [MEMORY[0x263F1C6B0] systemImageNamed:@"checkmark.circle.fill"];
    uint64_t v7 = [v5 initWithImage:v6];
    selectedImageView = v3->_selectedImageView;
    v3->_selectedImageView = (UIImageView *)v7;

    [(UIImageView *)v3->_selectedImageView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIImageView *)v3->_selectedImageView setHidden:1];
    v34 = (void *)v4;
    [(UIImageView *)v3->_selectedImageView setPreferredSymbolConfiguration:v4];
    [(PRXSelectionIndicatorView *)v3 addSubview:v3->_selectedImageView];
    id v9 = objc_alloc(MEMORY[0x263F1C6D0]);
    v10 = [MEMORY[0x263F1C6B0] systemImageNamed:@"circle"];
    uint64_t v11 = [v9 initWithImage:v10];
    deselectedImageView = v3->_deselectedImageView;
    v3->_deselectedImageView = (UIImageView *)v11;

    v13 = [MEMORY[0x263F1C550] systemFillColor];
    [(UIImageView *)v3->_deselectedImageView setTintColor:v13];

    [(UIImageView *)v3->_deselectedImageView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIImageView *)v3->_deselectedImageView setPreferredSymbolConfiguration:v4];
    [(PRXSelectionIndicatorView *)v3 addSubview:v3->_deselectedImageView];
    v29 = (void *)MEMORY[0x263F08938];
    v33 = [(UIImageView *)v3->_selectedImageView centerXAnchor];
    v32 = [(PRXSelectionIndicatorView *)v3 centerXAnchor];
    v31 = [v33 constraintEqualToAnchor:v32];
    v36[0] = v31;
    v30 = [(UIImageView *)v3->_deselectedImageView centerXAnchor];
    v14 = [(PRXSelectionIndicatorView *)v3 centerXAnchor];
    v15 = [v30 constraintEqualToAnchor:v14];
    v36[1] = v15;
    v16 = [(UIImageView *)v3->_selectedImageView centerYAnchor];
    v17 = [(PRXSelectionIndicatorView *)v3 centerYAnchor];
    v18 = [v16 constraintEqualToAnchor:v17];
    v36[2] = v18;
    v19 = [(UIImageView *)v3->_deselectedImageView centerYAnchor];
    v20 = [(PRXSelectionIndicatorView *)v3 centerYAnchor];
    v21 = [v19 constraintEqualToAnchor:v20];
    v36[3] = v21;
    v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:v36 count:4];
    [v29 activateConstraints:v22];

    LODWORD(v23) = 1148846080;
    [(PRXSelectionIndicatorView *)v3 setContentCompressionResistancePriority:0 forAxis:v23];
    LODWORD(v24) = 1148846080;
    [(PRXSelectionIndicatorView *)v3 setContentCompressionResistancePriority:1 forAxis:v24];
    LODWORD(v25) = 1148846080;
    [(PRXSelectionIndicatorView *)v3 setContentHuggingPriority:0 forAxis:v25];
    LODWORD(v26) = 1148846080;
    [(PRXSelectionIndicatorView *)v3 setContentHuggingPriority:1 forAxis:v26];
    v27 = v3;
  }
  return v3;
}

- (void)setSelected:(BOOL)a3
{
  if (self->_selected != a3)
  {
    BOOL v3 = a3;
    self->_selected = a3;
    [(UIImageView *)self->_selectedImageView setHidden:!a3];
    deselectedImageView = self->_deselectedImageView;
    [(UIImageView *)deselectedImageView setHidden:v3];
  }
}

- (CGSize)intrinsicContentSize
{
  [(UIImageView *)self->_selectedImageView intrinsicContentSize];
  double v4 = v3;
  double v6 = v5;
  [(UIImageView *)self->_deselectedImageView intrinsicContentSize];
  if (v4 >= v7) {
    double v7 = v4;
  }
  if (v6 >= v8) {
    double v8 = v6;
  }
  result.height = v8;
  result.width = v7;
  return result;
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deselectedImageView, 0);
  objc_storeStrong((id *)&self->_selectedImageView, 0);
}

@end