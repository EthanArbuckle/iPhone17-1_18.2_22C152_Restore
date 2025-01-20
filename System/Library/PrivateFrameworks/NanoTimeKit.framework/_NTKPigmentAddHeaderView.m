@interface _NTKPigmentAddHeaderView
+ (id)_font;
+ (id)reuseIdentifier;
- (_NTKPigmentAddHeaderView)initWithFrame:(CGRect)a3;
- (void)_fontSizeDidChange;
- (void)dealloc;
- (void)setName:(id)a3;
@end

@implementation _NTKPigmentAddHeaderView

+ (id)reuseIdentifier
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (_NTKPigmentAddHeaderView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v28[4] = *MEMORY[0x1E4F143B8];
  v27.receiver = self;
  v27.super_class = (Class)_NTKPigmentAddHeaderView;
  v7 = -[_NTKPigmentAddHeaderView initWithFrame:](&v27, sel_initWithFrame_);
  if (v7)
  {
    uint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", x, y, width, height);
    label = v7->_label;
    v7->_label = (UILabel *)v8;

    v10 = BPSTextColor();
    [(UILabel *)v7->_label setTextColor:v10];

    [(_NTKPigmentAddHeaderView *)v7 addSubview:v7->_label];
    v21 = (void *)MEMORY[0x1E4F28DC8];
    v26 = [(UILabel *)v7->_label leadingAnchor];
    v25 = [(_NTKPigmentAddHeaderView *)v7 leadingAnchor];
    v24 = [v26 constraintEqualToAnchor:v25];
    v28[0] = v24;
    v23 = [(UILabel *)v7->_label trailingAnchor];
    v22 = [(_NTKPigmentAddHeaderView *)v7 trailingAnchor];
    v11 = [v23 constraintEqualToAnchor:v22];
    v28[1] = v11;
    v12 = [(UILabel *)v7->_label topAnchor];
    v13 = [(_NTKPigmentAddHeaderView *)v7 topAnchor];
    v14 = [v12 constraintEqualToAnchor:v13];
    v28[2] = v14;
    v15 = [(UILabel *)v7->_label bottomAnchor];
    v16 = [(_NTKPigmentAddHeaderView *)v7 bottomAnchor];
    v17 = [v15 constraintEqualToAnchor:v16];
    v28[3] = v17;
    v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:4];
    [v21 activateConstraints:v18];

    [(UILabel *)v7->_label setTranslatesAutoresizingMaskIntoConstraints:0];
    v19 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v19 addObserver:v7 selector:sel__fontSizeDidChange name:*MEMORY[0x1E4FB27A8] object:0];

    [(_NTKPigmentAddHeaderView *)v7 _fontSizeDidChange];
  }
  return v7;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4FB27A8] object:0];

  v4.receiver = self;
  v4.super_class = (Class)_NTKPigmentAddHeaderView;
  [(_NTKPigmentAddHeaderView *)&v4 dealloc];
}

- (void)setName:(id)a3
{
  [(UILabel *)self->_label setText:a3];

  [(_NTKPigmentAddHeaderView *)self setNeedsLayout];
}

+ (id)_font
{
  v2 = [MEMORY[0x1E4FB1BA8] mainScreen];
  v3 = [v2 traitCollection];
  objc_super v4 = [v3 preferredContentSizeCategory];

  v5 = (void *)*MEMORY[0x1E4FB2790];
  if (UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)v4, (UIContentSizeCategory)*MEMORY[0x1E4FB2790]) == NSOrderedDescending)
  {
    id v6 = v5;

    objc_super v4 = v6;
  }
  v7 = [MEMORY[0x1E4FB1E20] traitCollectionWithPreferredContentSizeCategory:v4];
  uint64_t v8 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4FB28C8] compatibleWithTraitCollection:v7];
  v9 = [v8 fontDescriptorWithSymbolicTraits:0x8000];

  v10 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v9 size:0.0];

  return v10;
}

- (void)_fontSizeDidChange
{
  label = self->_label;
  objc_super v4 = [(id)objc_opt_class() _font];
  [(UILabel *)label setFont:v4];

  [(_NTKPigmentAddHeaderView *)self setNeedsLayout];
}

- (void).cxx_destruct
{
}

@end