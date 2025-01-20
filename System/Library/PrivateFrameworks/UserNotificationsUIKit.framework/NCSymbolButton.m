@interface NCSymbolButton
+ (id)button;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (id)_init;
- (void)clearSymbol;
- (void)setSymbolNamed:(id)a3 color:(id)a4 pointSize:(double)a5 backgroundDiameter:(double)a6;
@end

@implementation NCSymbolButton

+ (id)button
{
  id v2 = [[NCSymbolButton alloc] _init];

  return v2;
}

- (id)_init
{
  v31.receiver = self;
  v31.super_class = (Class)NCSymbolButton;
  double v2 = *MEMORY[0x1E4F1DB28];
  double v3 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v4 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  v6 = -[NCSymbolButton initWithFrame:](&v31, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], v3, v4, v5);
  if (v6)
  {
    uint64_t v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", v2, v3, v4, v5);
    backgroundView = v6->_backgroundView;
    v6->_backgroundView = (UIView *)v7;

    [(UIView *)v6->_backgroundView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)v6->_backgroundView setUserInteractionEnabled:0];
    [(NCSymbolButton *)v6 addSubview:v6->_backgroundView];
    uint64_t v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1838]), "initWithFrame:", v2, v3, v4, v5);
    symbolImageView = v6->_symbolImageView;
    v6->_symbolImageView = (UIImageView *)v9;

    [(UIImageView *)v6->_symbolImageView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIImageView *)v6->_symbolImageView setUserInteractionEnabled:0];
    [(UIImageView *)v6->_symbolImageView setContentMode:4];
    [(NCSymbolButton *)v6 addSubview:v6->_symbolImageView];
    id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v12 = [(UIView *)v6->_backgroundView widthAnchor];
    uint64_t v13 = [v12 constraintEqualToConstant:0.0];
    backgroundWidthConstraint = v6->_backgroundWidthConstraint;
    v6->_backgroundWidthConstraint = (NSLayoutConstraint *)v13;

    v15 = [(UIView *)v6->_backgroundView heightAnchor];
    uint64_t v16 = [v15 constraintEqualToConstant:0.0];
    backgroundHeightConstraint = v6->_backgroundHeightConstraint;
    v6->_backgroundHeightConstraint = (NSLayoutConstraint *)v16;

    [v11 addObject:v6->_backgroundWidthConstraint];
    [v11 addObject:v6->_backgroundHeightConstraint];
    v18 = [(UIView *)v6->_backgroundView centerXAnchor];
    v19 = [(NCSymbolButton *)v6 centerXAnchor];
    v20 = [v18 constraintEqualToAnchor:v19];
    [v11 addObject:v20];

    v21 = [(UIView *)v6->_backgroundView centerYAnchor];
    v22 = [(NCSymbolButton *)v6 centerYAnchor];
    v23 = [v21 constraintEqualToAnchor:v22];
    [v11 addObject:v23];

    v24 = [(UIImageView *)v6->_symbolImageView centerXAnchor];
    v25 = [(UIView *)v6->_backgroundView centerXAnchor];
    v26 = [v24 constraintEqualToAnchor:v25];
    [v11 addObject:v26];

    v27 = [(UIImageView *)v6->_symbolImageView centerYAnchor];
    v28 = [(UIView *)v6->_backgroundView centerYAnchor];
    v29 = [v27 constraintEqualToAnchor:v28];
    [v11 addObject:v29];

    [MEMORY[0x1E4F28DC8] activateConstraints:v11];
  }
  return v6;
}

- (void)setSymbolNamed:(id)a3 color:(id)a4 pointSize:(double)a5 backgroundDiameter:(double)a6
{
  double v10 = a6 * 0.5;
  backgroundView = self->_backgroundView;
  id v12 = a4;
  id v13 = a3;
  [(UIView *)backgroundView _setCornerRadius:v10];
  [(NSLayoutConstraint *)self->_backgroundHeightConstraint setConstant:a6];
  [(NSLayoutConstraint *)self->_backgroundWidthConstraint setConstant:a6];
  [(NCSymbolButton *)self setNeedsUpdateConstraints];
  id v17 = [MEMORY[0x1E4FB1830] configurationWithPointSize:7 weight:a5];
  v14 = [MEMORY[0x1E4FB1818] systemImageNamed:v13 withConfiguration:v17];

  [(UIImageView *)self->_symbolImageView setImage:v14];
  [(UIImageView *)self->_symbolImageView setContentMode:4];
  symbolImageView = self->_symbolImageView;
  uint64_t v16 = [MEMORY[0x1E4FB1618] systemWhiteColor];
  [(UIImageView *)symbolImageView setTintColor:v16];

  [(UIView *)self->_backgroundView setBackgroundColor:v12];
  [(NCSymbolButton *)self setNeedsLayout];
}

- (void)clearSymbol
{
  [(UIImageView *)self->_symbolImageView setImage:0];
  [(NSLayoutConstraint *)self->_backgroundHeightConstraint setConstant:0.0];
  [(NSLayoutConstraint *)self->_backgroundWidthConstraint setConstant:0.0];
  [(NCSymbolButton *)self setNeedsUpdateConstraints];

  [(NCSymbolButton *)self setNeedsLayout];
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  double v5 = [v4 view];
  if (v5 == self
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    || [v4 numberOfTouchesRequired] != 1)
  {

    goto LABEL_7;
  }
  uint64_t v6 = [v4 numberOfTapsRequired];

  if (v6 != 1)
  {
LABEL_7:
    BOOL v7 = 1;
    goto LABEL_8;
  }
  BOOL v7 = 0;
LABEL_8:

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundWidthConstraint, 0);
  objc_storeStrong((id *)&self->_backgroundHeightConstraint, 0);
  objc_storeStrong((id *)&self->_symbolImageView, 0);

  objc_storeStrong((id *)&self->_backgroundView, 0);
}

@end