@interface PREditingPickerImageCellView
- (PREditingPickerImageCellView)initWithFrame:(CGRect)a3;
- (UIImageView)contentImageView;
- (void)_configureWithSystemImage:(id)a3;
- (void)configureWithSystemImageNamed:(id)a3;
- (void)configureWithSystemImageNamed:(id)a3 configuration:(id)a4;
@end

@implementation PREditingPickerImageCellView

- (PREditingPickerImageCellView)initWithFrame:(CGRect)a3
{
  v27[5] = *MEMORY[0x1E4F143B8];
  v26.receiver = self;
  v26.super_class = (Class)PREditingPickerImageCellView;
  v3 = -[PREditingPickerCellView initWithFrame:](&v26, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
    contentImageView = v3->_contentImageView;
    v3->_contentImageView = v4;

    LODWORD(v6) = 1144750080;
    [(UIImageView *)v3->_contentImageView setContentCompressionResistancePriority:0 forAxis:v6];
    LODWORD(v7) = 1144750080;
    [(UIImageView *)v3->_contentImageView setContentCompressionResistancePriority:1 forAxis:v7];
    [(UIImageView *)v3->_contentImageView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(PREditingPickerImageCellView *)v3 addSubview:v3->_contentImageView];
    v19 = (void *)MEMORY[0x1E4F28DC8];
    v25 = [(UIImageView *)v3->_contentImageView topAnchor];
    v24 = [(PREditingPickerImageCellView *)v3 topAnchor];
    v23 = [v25 constraintEqualToAnchor:v24 constant:9.0];
    v27[0] = v23;
    v22 = [(UIImageView *)v3->_contentImageView bottomAnchor];
    v21 = [(PREditingPickerImageCellView *)v3 bottomAnchor];
    v20 = [v22 constraintEqualToAnchor:v21 constant:-9.0];
    v27[1] = v20;
    v18 = [(UIImageView *)v3->_contentImageView centerXAnchor];
    v8 = [(PREditingPickerImageCellView *)v3 centerXAnchor];
    v9 = [v18 constraintEqualToAnchor:v8];
    v27[2] = v9;
    v10 = [(UIImageView *)v3->_contentImageView leadingAnchor];
    v11 = [(PREditingPickerImageCellView *)v3 leadingAnchor];
    v12 = [v10 constraintEqualToAnchor:v11 constant:9.0];
    v27[3] = v12;
    v13 = [(UIImageView *)v3->_contentImageView trailingAnchor];
    v14 = [(PREditingPickerImageCellView *)v3 trailingAnchor];
    v15 = [v13 constraintEqualToAnchor:v14 constant:-9.0];
    v27[4] = v15;
    v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:5];
    [v19 activateConstraints:v16];
  }
  return v3;
}

- (void)configureWithSystemImageNamed:(id)a3
{
  id v4 = [MEMORY[0x1E4FB1818] _systemImageNamed:a3];
  [(PREditingPickerImageCellView *)self _configureWithSystemImage:v4];
}

- (void)configureWithSystemImageNamed:(id)a3 configuration:(id)a4
{
  id v5 = [MEMORY[0x1E4FB1818] _systemImageNamed:a3 withConfiguration:a4];
  [(PREditingPickerImageCellView *)self _configureWithSystemImage:v5];
}

- (void)_configureWithSystemImage:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4FB1618];
  id v5 = a3;
  double v6 = [v4 labelColor];
  id v7 = [v5 imageWithTintColor:v6 renderingMode:1];

  [(UIImageView *)self->_contentImageView setImage:v7];
}

- (UIImageView)contentImageView
{
  return self->_contentImageView;
}

- (void).cxx_destruct
{
}

@end