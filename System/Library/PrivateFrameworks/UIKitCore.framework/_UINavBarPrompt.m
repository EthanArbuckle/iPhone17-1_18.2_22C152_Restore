@interface _UINavBarPrompt
- (CGRect)_labelFrame;
- (CGRect)promptBounds;
- (CGSize)_updateLabelTextColorAndFontReturningShadowOffset;
- (NSString)prompt;
- (_UINavBarPrompt)initWithNavBar:(id)a3;
- (void)layoutSubviews;
- (void)setPrompt:(id)a3;
@end

@implementation _UINavBarPrompt

- (_UINavBarPrompt)initWithNavBar:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_UINavBarPrompt;
  v5 = [(UIView *)&v14 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_navBar, v4);
    v7 = objc_alloc_init(UILabel);
    label = v6->_label;
    v6->_label = v7;

    [(UIView *)v6 setUserInteractionEnabled:0];
    v9 = +[UIColor clearColor];
    [(UIView *)v6 setBackgroundColor:v9];

    [(UIView *)v6 setContentMode:3];
    [(UIView *)v6->_label setOpaque:0];
    v10 = v6->_label;
    v11 = +[UIColor clearColor];
    [(UIView *)v10 setBackgroundColor:v11];

    v12 = v6->_label;
    [(_UINavBarPrompt *)v6 _labelFrame];
    -[UILabel setFrame:](v12, "setFrame:");
  }

  return v6;
}

- (void)setPrompt:(id)a3
{
  id v6 = a3;
  id v4 = [(UILabel *)self->_label text];

  v5 = v6;
  if (v4 != v6)
  {
    [(UILabel *)self->_label setText:v6];
    [(UIView *)self setNeedsLayout];
    v5 = v6;
  }
}

- (NSString)prompt
{
  return [(UILabel *)self->_label text];
}

- (CGRect)_labelFrame
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_navBar);
  id v4 = [WeakRetained _currentVisualStyle];

  [(UIView *)self bounds];
  double v6 = v5;
  double v8 = v7;
  float v10 = v9;
  -[UILabel sizeThatFits:](self->_label, "sizeThatFits:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  double v12 = v11;
  double v14 = v13;
  double v15 = v6 + round((v10 - v11) * 0.5);
  if (v15 >= 0.0) {
    double v16 = v15;
  }
  else {
    double v16 = 0.0;
  }
  [v4 promptTextOffset];
  double v18 = v8 + v17;

  double v19 = v16;
  double v20 = v18;
  double v21 = v12;
  double v22 = v14;
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- (CGRect)promptBounds
{
  [(UIView *)self->_label frame];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGSize)_updateLabelTextColorAndFontReturningShadowOffset
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_navBar);
  double v4 = [WeakRetained _appearanceStorage];
  double v5 = [WeakRetained _currentVisualStyle];
  double v6 = [v4 textAttributes];
  double v7 = [v6 objectForKey:*(void *)off_1E52D2040];
  if (v7)
  {
    double v8 = v7;
    [v7 pointSize];
    if (v9 == 0.0)
    {
      [v5 promptFontSize];
    }
    else
    {
      [v8 pointSize];
      double v13 = v12;
      [v5 promptFontSize];
      double v15 = v13 * v14;
      [v5 headingFontSize];
      double v10 = round(v15 / v16);
    }
    double v11 = [v8 fontWithSize:v10];
  }
  else
  {
    double v11 = +[UINavigationBar defaultPromptFont];
  }
  if ((unint64_t)([WeakRetained barStyle] - 3) > 0xFFFFFFFFFFFFFFFDLL) {
    +[UIColor whiteColor];
  }
  else {
  double v17 = +[UIColor blackColor];
  }
  uint64_t v18 = [v6 objectForKey:*(void *)off_1E52D2048];
  double v19 = (void *)v18;
  if (v18) {
    double v20 = (void *)v18;
  }
  else {
    double v20 = v17;
  }
  id v21 = v20;

  double v22 = [v6 objectForKey:*(void *)off_1E52D2238];
  v23 = v22;
  if (v22)
  {
    v24 = [v22 shadowColor];
    [v23 shadowOffset];
    double v26 = v25;
    double v28 = v27;
  }
  else
  {
    v24 = 0;
    double v26 = *MEMORY[0x1E4F1DB30];
    double v28 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  [(UILabel *)self->_label setTextColor:v21];
  if (v24) {
    [(UILabel *)self->_label setShadowColor:v24];
  }
  [(UILabel *)self->_label setFont:v11];

  double v29 = v26;
  double v30 = v28;
  result.height = v30;
  result.width = v29;
  return result;
}

- (void)layoutSubviews
{
  [(_UINavBarPrompt *)self _updateLabelTextColorAndFontReturningShadowOffset];
  double v4 = v3;
  double v6 = v5;
  double v7 = [(UIView *)self->_label superview];

  if (v7)
  {
    label = self->_label;
    [(_UINavBarPrompt *)self _labelFrame];
    -[UILabel setFrame:](label, "setFrame:");
  }
  else
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __33___UINavBarPrompt_layoutSubviews__block_invoke;
    v9[3] = &unk_1E52D9F70;
    v9[4] = self;
    +[UIView performWithoutAnimation:v9];
  }
  [(UIView *)self addSubview:self->_label];
  -[UILabel setShadowOffset:](self->_label, "setShadowOffset:", v4, v6);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_navBar);
  objc_storeStrong((id *)&self->_label, 0);
}

@end