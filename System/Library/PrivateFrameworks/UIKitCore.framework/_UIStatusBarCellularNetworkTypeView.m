@interface _UIStatusBarCellularNetworkTypeView
- (NSLayoutConstraint)widthConstraint;
- (UIAccessibilityHUDItem)accessibilityHUDRepresentation;
- (UIVectorLabel)accessoryLabel;
- (UIVectorLabel)prefixLabel;
- (_UIStatusBarCellularNetworkTypeView)initWithFrame:(CGRect)a3;
- (_UIStatusBarStringView)stringView;
- (id)viewForLastBaselineLayout;
- (int64_t)type;
- (void)_animateUpdateToText:(id)a3 prefixLength:(int64_t)a4 styleAttributes:(id)a5 attributedText:(id)a6 type:(int64_t)a7;
- (void)applyStyleAttributes:(id)a3;
- (void)setAccessoryLabel:(id)a3;
- (void)setAttributedText:(id)a3 prefixLength:(int64_t)a4 forType:(int64_t)a5 animated:(BOOL)a6;
- (void)setFixedWidth:(double)a3;
- (void)setPrefixLabel:(id)a3;
- (void)setStringView:(id)a3;
- (void)setText:(id)a3 prefixLength:(int64_t)a4 withStyleAttributes:(id)a5 forType:(int64_t)a6 animated:(BOOL)a7;
- (void)setType:(int64_t)a3;
- (void)setWidthConstraint:(id)a3;
@end

@implementation _UIStatusBarCellularNetworkTypeView

- (_UIStatusBarCellularNetworkTypeView)initWithFrame:(CGRect)a3
{
  v55[12] = *MEMORY[0x1E4F143B8];
  v54.receiver = self;
  v54.super_class = (Class)_UIStatusBarCellularNetworkTypeView;
  v3 = -[UIView initWithFrame:](&v54, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = objc_alloc_init(UILayoutGuide);
  [(UIView *)v3 addLayoutGuide:"addLayoutGuide:"];
  v5 = [_UIStatusBarStringView alloc];
  [(UIView *)v3 bounds];
  uint64_t v6 = -[_UIStatusBarStringView initWithFrame:](v5, "initWithFrame:");
  stringView = v3->_stringView;
  v3->_stringView = (_UIStatusBarStringView *)v6;

  [(UIView *)v3->_stringView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)v3->_stringView setLineBreakMode:2];
  [(UIView *)v3 addSubview:v3->_stringView];
  v8 = [UIVectorLabel alloc];
  [(UIView *)v3 bounds];
  uint64_t v9 = -[UIVectorLabel initWithFrame:](v8, "initWithFrame:");
  prefixLabel = v3->_prefixLabel;
  v3->_prefixLabel = (UIVectorLabel *)v9;

  [(UIVectorLabel *)v3->_prefixLabel setText:&stru_1ED0E84C0];
  [(UIView *)v3->_prefixLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIView *)v3->_prefixLabel setHidden:1];
  [(UIView *)v3 addSubview:v3->_prefixLabel];
  v11 = [UIVectorLabel alloc];
  [(UIView *)v3 bounds];
  uint64_t v12 = -[UIVectorLabel initWithFrame:](v11, "initWithFrame:");
  accessoryLabel = v3->_accessoryLabel;
  v3->_accessoryLabel = (UIVectorLabel *)v12;

  [(UIVectorLabel *)v3->_accessoryLabel setText:&stru_1ED0E84C0];
  [(UIView *)v3->_accessoryLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIView *)v3->_accessoryLabel setHidden:1];
  [(UIView *)v3 addSubview:v3->_accessoryLabel];
  v14 = [(UIView *)v3 widthAnchor];
  uint64_t v15 = [v14 constraintEqualToConstant:0.0];
  widthConstraint = v3->_widthConstraint;
  v3->_widthConstraint = (NSLayoutConstraint *)v15;

  v53 = [(UILayoutGuide *)v4 leadingAnchor];
  v52 = [(UIView *)v3->_stringView leadingAnchor];
  v51 = [v53 constraintEqualToAnchor:v52];
  v55[0] = v51;
  v50 = [(UILayoutGuide *)v4 trailingAnchor];
  v49 = [(UIView *)v3->_stringView trailingAnchor];
  v48 = [v50 constraintEqualToAnchor:v49];
  v55[1] = v48;
  v47 = [(UILayoutGuide *)v4 topAnchor];
  v46 = [(UIView *)v3->_stringView topAnchor];
  v45 = [v47 constraintEqualToAnchor:v46];
  v55[2] = v45;
  v44 = [(UILayoutGuide *)v4 bottomAnchor];
  v43 = [(UIView *)v3->_stringView bottomAnchor];
  v42 = [v44 constraintEqualToAnchor:v43];
  v55[3] = v42;
  v41 = [(UILayoutGuide *)v4 leadingAnchor];
  v39 = [(UIView *)v3->_prefixLabel leadingAnchor];
  v38 = [v41 constraintEqualToAnchor:v39];
  v55[4] = v38;
  v37 = [(UIView *)v3->_prefixLabel trailingAnchor];
  v36 = [(UIView *)v3->_accessoryLabel leadingAnchor];
  v34 = [v37 constraintEqualToAnchor:v36];
  v55[5] = v34;
  v33 = [(UIView *)v3->_stringView lastBaselineAnchor];
  v32 = [(UIView *)v3->_prefixLabel lastBaselineAnchor];
  v31 = [v33 constraintEqualToAnchor:v32];
  v55[6] = v31;
  v30 = [(UIView *)v3->_stringView lastBaselineAnchor];
  v29 = [(UIView *)v3->_accessoryLabel lastBaselineAnchor];
  v28 = [v30 constraintEqualToAnchor:v29];
  v55[7] = v28;
  v17 = v4;
  v18 = [(UILayoutGuide *)v4 centerXAnchor];
  v19 = [(UIView *)v3 centerXAnchor];
  v20 = [v18 constraintEqualToAnchor:v19];
  v55[8] = v20;
  v21 = [(UIView *)v3 topAnchor];
  v35 = v17;
  v22 = [(UILayoutGuide *)v17 topAnchor];
  v23 = [v21 constraintEqualToAnchor:v22];
  v55[9] = v23;
  v24 = [(UIView *)v3 bottomAnchor];
  v25 = [(UILayoutGuide *)v17 bottomAnchor];
  v26 = [v24 constraintEqualToAnchor:v25];
  v55[10] = v26;
  v55[11] = v3->_widthConstraint;
  v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:v55 count:12];

  [MEMORY[0x1E4F5B268] activateConstraints:v40];
  return v3;
}

- (void)setFixedWidth:(double)a3
{
  v5 = [(_UIStatusBarCellularNetworkTypeView *)self widthConstraint];
  [v5 constant];
  double v7 = vabdd_f64(a3, v6);

  if (v7 > 0.00000011920929)
  {
    if (a3 <= 0.0
      || ([(_UIStatusBarCellularNetworkTypeView *)self widthConstraint],
          v8 = objc_claimAutoreleasedReturnValue(),
          [v8 constant],
          double v10 = v9,
          v8,
          v10 <= 0.0))
    {
      v11 = [(_UIStatusBarCellularNetworkTypeView *)self widthConstraint];
      [v11 setConstant:a3];

      id v12 = [(UIView *)self superview];
      [v12 layoutSubviews];
    }
    else
    {
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __53___UIStatusBarCellularNetworkTypeView_setFixedWidth___block_invoke;
      v13[3] = &unk_1E52D9CD0;
      v13[4] = self;
      *(double *)&v13[5] = a3;
      [(id)UIApp _performBlockAfterCATransactionCommits:v13];
    }
  }
}

- (void)_animateUpdateToText:(id)a3 prefixLength:(int64_t)a4 styleAttributes:(id)a5 attributedText:(id)a6 type:(int64_t)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __109___UIStatusBarCellularNetworkTypeView__animateUpdateToText_prefixLength_styleAttributes_attributedText_type___block_invoke;
  v29[3] = &unk_1E52E7ED8;
  BOOL v15 = a4 != 0x7FFFFFFFFFFFFFFFLL;
  v29[4] = self;
  BOOL v34 = a4 != 0x7FFFFFFFFFFFFFFFLL;
  id v16 = v12;
  id v30 = v16;
  int64_t v33 = a4;
  id v17 = v14;
  id v31 = v17;
  id v18 = v13;
  id v32 = v18;
  +[UIView performWithoutAnimation:v29];
  v19 = (void *)UIApp;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __109___UIStatusBarCellularNetworkTypeView__animateUpdateToText_prefixLength_styleAttributes_attributedText_type___block_invoke_2;
  v23[3] = &unk_1E52E7ED8;
  v23[4] = self;
  id v24 = v17;
  id v25 = v16;
  id v26 = v18;
  BOOL v28 = v15;
  int64_t v27 = a7;
  id v20 = v18;
  id v21 = v16;
  id v22 = v17;
  [v19 _performBlockAfterCATransactionCommits:v23];
}

- (void)setAttributedText:(id)a3 prefixLength:(int64_t)a4 forType:(int64_t)a5 animated:(BOOL)a6
{
  BOOL v6 = a6;
  v33[3] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  v11 = v10;
  if (v6 && !self->_animatingUpdate)
  {
    self->_animatingUpdate = 1;
    BOOL v28 = [v10 string];
    [(_UIStatusBarCellularNetworkTypeView *)self _animateUpdateToText:v28 prefixLength:a4 styleAttributes:0 attributedText:v11 type:a5];
  }
  else
  {
    int64_t v31 = a5;
    [(UILabel *)self->_stringView setAttributedText:v10];
    [(UIView *)self->_prefixLabel setHidden:1];
    [(UIView *)self->_accessoryLabel setHidden:1];
    [(UIView *)self->_stringView setAlpha:1.0];
    id v12 = [v11 string];
    id v13 = v12;
    if (a4 == 0x7FFFFFFFFFFFFFFFLL)
    {
      id v14 = v12;
    }
    else
    {
      id v14 = [v12 substringToIndex:a4];
    }
    BOOL v15 = [v11 attributesAtIndex:0 effectiveRange:0];
    uint64_t v16 = *(void *)off_1E52D2040;
    uint64_t v17 = [v15 objectForKeyedSubscript:*(void *)off_1E52D2040];
    uint64_t v18 = *(void *)off_1E52D2048;
    v29 = v15;
    v19 = [v15 objectForKeyedSubscript:*(void *)off_1E52D2048];
    id v20 = objc_alloc(MEMORY[0x1E4F28B18]);
    v32[0] = *(void *)off_1E52D20C8;
    v32[1] = v16;
    v33[0] = &unk_1ED3F2858;
    v33[1] = v17;
    id v30 = (void *)v17;
    v32[2] = v18;
    v33[2] = v19;
    id v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:v32 count:3];
    id v22 = (void *)[v20 initWithString:v14 attributes:v21];
    [(UIVectorLabel *)self->_prefixLabel _setAttributedText:v22];

    [(UIView *)self->_prefixLabel setNeedsLayout];
    if (a4 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v23 = [v11 string];
      id v24 = [v23 substringFromIndex:a4];
      [(UIVectorLabel *)self->_accessoryLabel setText:v24];

      id v25 = [v11 attributesAtIndex:a4 effectiveRange:0];
      id v26 = [v25 objectForKeyedSubscript:v16];
      [(UIVectorLabel *)self->_accessoryLabel setFont:v26];

      int64_t v27 = [v25 objectForKeyedSubscript:v18];
      [(UIVectorLabel *)self->_accessoryLabel setTextColor:v27];

      [(UIView *)self->_accessoryLabel setNeedsLayout];
    }
    self->_type = v31;
    self->_animatingUpdate = 0;
  }
}

- (void)setText:(id)a3 prefixLength:(int64_t)a4 withStyleAttributes:(id)a5 forType:(int64_t)a6 animated:(BOOL)a7
{
  BOOL v7 = a7;
  v27[3] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a5;
  if (v7 && !self->_animatingUpdate)
  {
    self->_animatingUpdate = 1;
    [(_UIStatusBarCellularNetworkTypeView *)self _animateUpdateToText:v12 prefixLength:a4 styleAttributes:v13 attributedText:0 type:a6];
  }
  else
  {
    [(_UIStatusBarStringView *)self->_stringView setText:v12];
    [(_UIStatusBarStringView *)self->_stringView applyStyleAttributes:v13];
    [(UIView *)self->_prefixLabel setHidden:1];
    [(UIView *)self->_accessoryLabel setHidden:1];
    [(UIView *)self->_stringView setAlpha:1.0];
    id v23 = v12;
    if (a4 == 0x7FFFFFFFFFFFFFFFLL)
    {
      id v14 = v12;
    }
    else
    {
      id v14 = [v12 substringToIndex:a4];
    }
    id v15 = v14;
    uint64_t v16 = objc_msgSend(v13, "fontForStyle:", -[_UIStatusBarStringView fontStyle](self->_stringView, "fontStyle", v23));
    uint64_t v17 = [v13 textColor];
    id v18 = objc_alloc(MEMORY[0x1E4F28B18]);
    uint64_t v19 = *(void *)off_1E52D2040;
    v26[0] = *(void *)off_1E52D20C8;
    v26[1] = v19;
    v27[0] = &unk_1ED3F2858;
    v27[1] = v16;
    v26[2] = *(void *)off_1E52D2048;
    v27[2] = v17;
    id v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:3];
    id v25 = v15;
    id v21 = (void *)[v18 initWithString:v15 attributes:v20];
    [(UIVectorLabel *)self->_prefixLabel _setAttributedText:v21];

    [(UIView *)self->_prefixLabel setNeedsLayout];
    id v12 = v24;
    if (a4 != 0x7FFFFFFFFFFFFFFFLL)
    {
      id v22 = [v24 substringFromIndex:a4];
      [(UIVectorLabel *)self->_accessoryLabel setText:v22];

      [(UIVectorLabel *)self->_accessoryLabel setFont:v16];
      [(UIVectorLabel *)self->_accessoryLabel setTextColor:v17];
      [(UIView *)self->_accessoryLabel setNeedsLayout];
    }
    self->_type = a6;
    self->_animatingUpdate = 0;
  }
}

- (void)applyStyleAttributes:(id)a3
{
}

- (id)viewForLastBaselineLayout
{
  return self->_stringView;
}

- (UIAccessibilityHUDItem)accessibilityHUDRepresentation
{
  v3 = [UIAccessibilityHUDItem alloc];
  v4 = [(UILabel *)self->_stringView text];
  v5 = -[UIAccessibilityHUDItem initWithTitle:image:imageInsets:](v3, "initWithTitle:image:imageInsets:", v4, 0, 0.0, 0.0, 0.0, 0.0);

  return v5;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (_UIStatusBarStringView)stringView
{
  return self->_stringView;
}

- (void)setStringView:(id)a3
{
}

- (UIVectorLabel)prefixLabel
{
  return self->_prefixLabel;
}

- (void)setPrefixLabel:(id)a3
{
}

- (UIVectorLabel)accessoryLabel
{
  return self->_accessoryLabel;
}

- (void)setAccessoryLabel:(id)a3
{
}

- (NSLayoutConstraint)widthConstraint
{
  return self->_widthConstraint;
}

- (void)setWidthConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widthConstraint, 0);
  objc_storeStrong((id *)&self->_accessoryLabel, 0);
  objc_storeStrong((id *)&self->_prefixLabel, 0);
  objc_storeStrong((id *)&self->_stringView, 0);
}

@end